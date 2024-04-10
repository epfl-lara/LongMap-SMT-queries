; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45376 () Bool)

(assert start!45376)

(declare-fun b!498423 () Bool)

(declare-fun res!300530 () Bool)

(declare-fun e!292127 () Bool)

(assert (=> b!498423 (=> (not res!300530) (not e!292127))))

(declare-datatypes ((array!32201 0))(
  ( (array!32202 (arr!15482 (Array (_ BitVec 32) (_ BitVec 64))) (size!15846 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32201)

(declare-datatypes ((List!9640 0))(
  ( (Nil!9637) (Cons!9636 (h!10510 (_ BitVec 64)) (t!15868 List!9640)) )
))
(declare-fun arrayNoDuplicates!0 (array!32201 (_ BitVec 32) List!9640) Bool)

(assert (=> b!498423 (= res!300530 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9637))))

(declare-fun res!300529 () Bool)

(declare-fun e!292133 () Bool)

(assert (=> start!45376 (=> (not res!300529) (not e!292133))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45376 (= res!300529 (validMask!0 mask!3524))))

(assert (=> start!45376 e!292133))

(assert (=> start!45376 true))

(declare-fun array_inv!11278 (array!32201) Bool)

(assert (=> start!45376 (array_inv!11278 a!3235)))

(declare-fun b!498424 () Bool)

(declare-fun e!292131 () Bool)

(assert (=> b!498424 (= e!292131 false)))

(declare-fun b!498425 () Bool)

(declare-fun e!292134 () Bool)

(assert (=> b!498425 (= e!292127 (not e!292134))))

(declare-fun res!300531 () Bool)

(assert (=> b!498425 (=> res!300531 e!292134)))

(declare-fun lt!225774 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3949 0))(
  ( (MissingZero!3949 (index!17978 (_ BitVec 32))) (Found!3949 (index!17979 (_ BitVec 32))) (Intermediate!3949 (undefined!4761 Bool) (index!17980 (_ BitVec 32)) (x!47026 (_ BitVec 32))) (Undefined!3949) (MissingVacant!3949 (index!17981 (_ BitVec 32))) )
))
(declare-fun lt!225771 () SeekEntryResult!3949)

(declare-fun lt!225778 () array!32201)

(declare-fun lt!225770 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32201 (_ BitVec 32)) SeekEntryResult!3949)

(assert (=> b!498425 (= res!300531 (= lt!225771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225770 lt!225774 lt!225778 mask!3524)))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!225772 () (_ BitVec 32))

(assert (=> b!498425 (= lt!225771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225772 (select (arr!15482 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498425 (= lt!225770 (toIndex!0 lt!225774 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!498425 (= lt!225774 (select (store (arr!15482 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!498425 (= lt!225772 (toIndex!0 (select (arr!15482 a!3235) j!176) mask!3524))))

(assert (=> b!498425 (= lt!225778 (array!32202 (store (arr!15482 a!3235) i!1204 k!2280) (size!15846 a!3235)))))

(declare-fun e!292132 () Bool)

(assert (=> b!498425 e!292132))

(declare-fun res!300523 () Bool)

(assert (=> b!498425 (=> (not res!300523) (not e!292132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32201 (_ BitVec 32)) Bool)

(assert (=> b!498425 (= res!300523 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14872 0))(
  ( (Unit!14873) )
))
(declare-fun lt!225773 () Unit!14872)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32201 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14872)

(assert (=> b!498425 (= lt!225773 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498426 () Bool)

(declare-fun res!300525 () Bool)

(assert (=> b!498426 (=> (not res!300525) (not e!292133))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498426 (= res!300525 (validKeyInArray!0 k!2280))))

(declare-fun b!498427 () Bool)

(assert (=> b!498427 (= e!292133 e!292127)))

(declare-fun res!300526 () Bool)

(assert (=> b!498427 (=> (not res!300526) (not e!292127))))

(declare-fun lt!225777 () SeekEntryResult!3949)

(assert (=> b!498427 (= res!300526 (or (= lt!225777 (MissingZero!3949 i!1204)) (= lt!225777 (MissingVacant!3949 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32201 (_ BitVec 32)) SeekEntryResult!3949)

(assert (=> b!498427 (= lt!225777 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!498428 () Bool)

(assert (=> b!498428 (= e!292132 (= (seekEntryOrOpen!0 (select (arr!15482 a!3235) j!176) a!3235 mask!3524) (Found!3949 j!176)))))

(declare-fun b!498429 () Bool)

(declare-fun res!300527 () Bool)

(assert (=> b!498429 (=> (not res!300527) (not e!292133))))

(assert (=> b!498429 (= res!300527 (validKeyInArray!0 (select (arr!15482 a!3235) j!176)))))

(declare-fun b!498430 () Bool)

(declare-fun res!300524 () Bool)

(assert (=> b!498430 (=> (not res!300524) (not e!292133))))

(declare-fun arrayContainsKey!0 (array!32201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498430 (= res!300524 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498431 () Bool)

(declare-fun e!292128 () Bool)

(assert (=> b!498431 (= e!292128 true)))

(declare-fun lt!225769 () SeekEntryResult!3949)

(assert (=> b!498431 (= lt!225769 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225772 lt!225774 lt!225778 mask!3524))))

(declare-fun b!498432 () Bool)

(assert (=> b!498432 (= e!292134 e!292128)))

(declare-fun res!300521 () Bool)

(assert (=> b!498432 (=> res!300521 e!292128)))

(assert (=> b!498432 (= res!300521 (or (bvsgt #b00000000000000000000000000000000 (x!47026 lt!225771)) (bvsgt (x!47026 lt!225771) #b01111111111111111111111111111110) (bvslt lt!225772 #b00000000000000000000000000000000) (bvsge lt!225772 (size!15846 a!3235)) (bvslt (index!17980 lt!225771) #b00000000000000000000000000000000) (bvsge (index!17980 lt!225771) (size!15846 a!3235)) (not (= lt!225771 (Intermediate!3949 false (index!17980 lt!225771) (x!47026 lt!225771))))))))

(assert (=> b!498432 (and (or (= (select (arr!15482 a!3235) (index!17980 lt!225771)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15482 a!3235) (index!17980 lt!225771)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15482 a!3235) (index!17980 lt!225771)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15482 a!3235) (index!17980 lt!225771)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225775 () Unit!14872)

(declare-fun e!292130 () Unit!14872)

(assert (=> b!498432 (= lt!225775 e!292130)))

(declare-fun c!59228 () Bool)

(assert (=> b!498432 (= c!59228 (= (select (arr!15482 a!3235) (index!17980 lt!225771)) (select (arr!15482 a!3235) j!176)))))

(assert (=> b!498432 (and (bvslt (x!47026 lt!225771) #b01111111111111111111111111111110) (or (= (select (arr!15482 a!3235) (index!17980 lt!225771)) (select (arr!15482 a!3235) j!176)) (= (select (arr!15482 a!3235) (index!17980 lt!225771)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15482 a!3235) (index!17980 lt!225771)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498433 () Bool)

(declare-fun res!300532 () Bool)

(assert (=> b!498433 (=> (not res!300532) (not e!292127))))

(assert (=> b!498433 (= res!300532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498434 () Bool)

(declare-fun res!300522 () Bool)

(assert (=> b!498434 (=> res!300522 e!292134)))

(assert (=> b!498434 (= res!300522 (or (undefined!4761 lt!225771) (not (is-Intermediate!3949 lt!225771))))))

(declare-fun b!498435 () Bool)

(declare-fun Unit!14874 () Unit!14872)

(assert (=> b!498435 (= e!292130 Unit!14874)))

(declare-fun b!498436 () Bool)

(declare-fun Unit!14875 () Unit!14872)

(assert (=> b!498436 (= e!292130 Unit!14875)))

(declare-fun lt!225776 () Unit!14872)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32201 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14872)

(assert (=> b!498436 (= lt!225776 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!225772 #b00000000000000000000000000000000 (index!17980 lt!225771) (x!47026 lt!225771) mask!3524))))

(declare-fun res!300533 () Bool)

(assert (=> b!498436 (= res!300533 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225772 lt!225774 lt!225778 mask!3524) (Intermediate!3949 false (index!17980 lt!225771) (x!47026 lt!225771))))))

(assert (=> b!498436 (=> (not res!300533) (not e!292131))))

(assert (=> b!498436 e!292131))

(declare-fun b!498437 () Bool)

(declare-fun res!300528 () Bool)

(assert (=> b!498437 (=> (not res!300528) (not e!292133))))

(assert (=> b!498437 (= res!300528 (and (= (size!15846 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15846 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15846 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45376 res!300529) b!498437))

(assert (= (and b!498437 res!300528) b!498429))

(assert (= (and b!498429 res!300527) b!498426))

(assert (= (and b!498426 res!300525) b!498430))

(assert (= (and b!498430 res!300524) b!498427))

(assert (= (and b!498427 res!300526) b!498433))

(assert (= (and b!498433 res!300532) b!498423))

(assert (= (and b!498423 res!300530) b!498425))

(assert (= (and b!498425 res!300523) b!498428))

(assert (= (and b!498425 (not res!300531)) b!498434))

(assert (= (and b!498434 (not res!300522)) b!498432))

(assert (= (and b!498432 c!59228) b!498436))

(assert (= (and b!498432 (not c!59228)) b!498435))

(assert (= (and b!498436 res!300533) b!498424))

(assert (= (and b!498432 (not res!300521)) b!498431))

(declare-fun m!479691 () Bool)

(assert (=> b!498431 m!479691))

(declare-fun m!479693 () Bool)

(assert (=> b!498430 m!479693))

(declare-fun m!479695 () Bool)

(assert (=> b!498425 m!479695))

(declare-fun m!479697 () Bool)

(assert (=> b!498425 m!479697))

(declare-fun m!479699 () Bool)

(assert (=> b!498425 m!479699))

(declare-fun m!479701 () Bool)

(assert (=> b!498425 m!479701))

(declare-fun m!479703 () Bool)

(assert (=> b!498425 m!479703))

(assert (=> b!498425 m!479695))

(declare-fun m!479705 () Bool)

(assert (=> b!498425 m!479705))

(assert (=> b!498425 m!479695))

(declare-fun m!479707 () Bool)

(assert (=> b!498425 m!479707))

(declare-fun m!479709 () Bool)

(assert (=> b!498425 m!479709))

(declare-fun m!479711 () Bool)

(assert (=> b!498425 m!479711))

(assert (=> b!498429 m!479695))

(assert (=> b!498429 m!479695))

(declare-fun m!479713 () Bool)

(assert (=> b!498429 m!479713))

(declare-fun m!479715 () Bool)

(assert (=> b!498427 m!479715))

(declare-fun m!479717 () Bool)

(assert (=> b!498432 m!479717))

(assert (=> b!498432 m!479695))

(declare-fun m!479719 () Bool)

(assert (=> b!498433 m!479719))

(declare-fun m!479721 () Bool)

(assert (=> b!498436 m!479721))

(assert (=> b!498436 m!479691))

(declare-fun m!479723 () Bool)

(assert (=> start!45376 m!479723))

(declare-fun m!479725 () Bool)

(assert (=> start!45376 m!479725))

(declare-fun m!479727 () Bool)

(assert (=> b!498426 m!479727))

(declare-fun m!479729 () Bool)

(assert (=> b!498423 m!479729))

(assert (=> b!498428 m!479695))

(assert (=> b!498428 m!479695))

(declare-fun m!479731 () Bool)

(assert (=> b!498428 m!479731))

(push 1)

