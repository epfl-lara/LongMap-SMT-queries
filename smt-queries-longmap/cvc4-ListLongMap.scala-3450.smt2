; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47896 () Bool)

(assert start!47896)

(declare-fun b!527431 () Bool)

(declare-fun e!307402 () Bool)

(declare-fun e!307403 () Bool)

(assert (=> b!527431 (= e!307402 e!307403)))

(declare-fun res!323761 () Bool)

(assert (=> b!527431 (=> (not res!323761) (not e!307403))))

(declare-datatypes ((SeekEntryResult!4549 0))(
  ( (MissingZero!4549 (index!20414 (_ BitVec 32))) (Found!4549 (index!20415 (_ BitVec 32))) (Intermediate!4549 (undefined!5361 Bool) (index!20416 (_ BitVec 32)) (x!49382 (_ BitVec 32))) (Undefined!4549) (MissingVacant!4549 (index!20417 (_ BitVec 32))) )
))
(declare-fun lt!242745 () SeekEntryResult!4549)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!527431 (= res!323761 (or (= lt!242745 (MissingZero!4549 i!1204)) (= lt!242745 (MissingVacant!4549 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33464 0))(
  ( (array!33465 (arr!16082 (Array (_ BitVec 32) (_ BitVec 64))) (size!16446 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33464)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33464 (_ BitVec 32)) SeekEntryResult!4549)

(assert (=> b!527431 (= lt!242745 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!527432 () Bool)

(declare-fun res!323758 () Bool)

(assert (=> b!527432 (=> (not res!323758) (not e!307403))))

(declare-datatypes ((List!10240 0))(
  ( (Nil!10237) (Cons!10236 (h!11170 (_ BitVec 64)) (t!16468 List!10240)) )
))
(declare-fun arrayNoDuplicates!0 (array!33464 (_ BitVec 32) List!10240) Bool)

(assert (=> b!527432 (= res!323758 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10237))))

(declare-fun b!527433 () Bool)

(declare-fun res!323763 () Bool)

(assert (=> b!527433 (=> (not res!323763) (not e!307402))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!527433 (= res!323763 (and (= (size!16446 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16446 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16446 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!527434 () Bool)

(declare-fun res!323766 () Bool)

(assert (=> b!527434 (=> (not res!323766) (not e!307402))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!527434 (= res!323766 (validKeyInArray!0 (select (arr!16082 a!3235) j!176)))))

(declare-fun b!527435 () Bool)

(declare-fun e!307404 () Bool)

(assert (=> b!527435 (= e!307403 (not e!307404))))

(declare-fun res!323762 () Bool)

(assert (=> b!527435 (=> res!323762 e!307404)))

(declare-fun lt!242741 () (_ BitVec 32))

(declare-fun lt!242740 () array!33464)

(declare-fun lt!242743 () SeekEntryResult!4549)

(declare-fun lt!242742 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33464 (_ BitVec 32)) SeekEntryResult!4549)

(assert (=> b!527435 (= res!323762 (= lt!242743 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242741 lt!242742 lt!242740 mask!3524)))))

(declare-fun lt!242739 () (_ BitVec 32))

(assert (=> b!527435 (= lt!242743 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242739 (select (arr!16082 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527435 (= lt!242741 (toIndex!0 lt!242742 mask!3524))))

(assert (=> b!527435 (= lt!242742 (select (store (arr!16082 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!527435 (= lt!242739 (toIndex!0 (select (arr!16082 a!3235) j!176) mask!3524))))

(assert (=> b!527435 (= lt!242740 (array!33465 (store (arr!16082 a!3235) i!1204 k!2280) (size!16446 a!3235)))))

(declare-fun e!307406 () Bool)

(assert (=> b!527435 e!307406))

(declare-fun res!323767 () Bool)

(assert (=> b!527435 (=> (not res!323767) (not e!307406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33464 (_ BitVec 32)) Bool)

(assert (=> b!527435 (= res!323767 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16648 0))(
  ( (Unit!16649) )
))
(declare-fun lt!242744 () Unit!16648)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33464 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16648)

(assert (=> b!527435 (= lt!242744 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!527436 () Bool)

(declare-fun res!323760 () Bool)

(assert (=> b!527436 (=> res!323760 e!307404)))

(assert (=> b!527436 (= res!323760 (or (undefined!5361 lt!242743) (not (is-Intermediate!4549 lt!242743))))))

(declare-fun b!527438 () Bool)

(assert (=> b!527438 (= e!307404 (or (bvsgt (x!49382 lt!242743) #b01111111111111111111111111111110) (bvslt lt!242739 #b00000000000000000000000000000000) (bvsge lt!242739 (size!16446 a!3235)) (and (bvsge (index!20416 lt!242743) #b00000000000000000000000000000000) (bvslt (index!20416 lt!242743) (size!16446 a!3235)))))))

(assert (=> b!527438 (= (index!20416 lt!242743) i!1204)))

(declare-fun lt!242746 () Unit!16648)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33464 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16648)

(assert (=> b!527438 (= lt!242746 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!242739 #b00000000000000000000000000000000 (index!20416 lt!242743) (x!49382 lt!242743) mask!3524))))

(assert (=> b!527438 (and (or (= (select (arr!16082 a!3235) (index!20416 lt!242743)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16082 a!3235) (index!20416 lt!242743)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16082 a!3235) (index!20416 lt!242743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16082 a!3235) (index!20416 lt!242743)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242737 () Unit!16648)

(declare-fun e!307405 () Unit!16648)

(assert (=> b!527438 (= lt!242737 e!307405)))

(declare-fun c!62144 () Bool)

(assert (=> b!527438 (= c!62144 (= (select (arr!16082 a!3235) (index!20416 lt!242743)) (select (arr!16082 a!3235) j!176)))))

(assert (=> b!527438 (and (bvslt (x!49382 lt!242743) #b01111111111111111111111111111110) (or (= (select (arr!16082 a!3235) (index!20416 lt!242743)) (select (arr!16082 a!3235) j!176)) (= (select (arr!16082 a!3235) (index!20416 lt!242743)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16082 a!3235) (index!20416 lt!242743)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527439 () Bool)

(declare-fun res!323768 () Bool)

(assert (=> b!527439 (=> (not res!323768) (not e!307402))))

(declare-fun arrayContainsKey!0 (array!33464 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!527439 (= res!323768 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!527437 () Bool)

(declare-fun res!323757 () Bool)

(assert (=> b!527437 (=> (not res!323757) (not e!307403))))

(assert (=> b!527437 (= res!323757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!323759 () Bool)

(assert (=> start!47896 (=> (not res!323759) (not e!307402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47896 (= res!323759 (validMask!0 mask!3524))))

(assert (=> start!47896 e!307402))

(assert (=> start!47896 true))

(declare-fun array_inv!11878 (array!33464) Bool)

(assert (=> start!47896 (array_inv!11878 a!3235)))

(declare-fun b!527440 () Bool)

(declare-fun e!307401 () Bool)

(assert (=> b!527440 (= e!307401 false)))

(declare-fun b!527441 () Bool)

(declare-fun Unit!16650 () Unit!16648)

(assert (=> b!527441 (= e!307405 Unit!16650)))

(declare-fun lt!242738 () Unit!16648)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33464 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16648)

(assert (=> b!527441 (= lt!242738 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!242739 #b00000000000000000000000000000000 (index!20416 lt!242743) (x!49382 lt!242743) mask!3524))))

(declare-fun res!323765 () Bool)

(assert (=> b!527441 (= res!323765 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242739 lt!242742 lt!242740 mask!3524) (Intermediate!4549 false (index!20416 lt!242743) (x!49382 lt!242743))))))

(assert (=> b!527441 (=> (not res!323765) (not e!307401))))

(assert (=> b!527441 e!307401))

(declare-fun b!527442 () Bool)

(declare-fun res!323764 () Bool)

(assert (=> b!527442 (=> (not res!323764) (not e!307402))))

(assert (=> b!527442 (= res!323764 (validKeyInArray!0 k!2280))))

(declare-fun b!527443 () Bool)

(assert (=> b!527443 (= e!307406 (= (seekEntryOrOpen!0 (select (arr!16082 a!3235) j!176) a!3235 mask!3524) (Found!4549 j!176)))))

(declare-fun b!527444 () Bool)

(declare-fun Unit!16651 () Unit!16648)

(assert (=> b!527444 (= e!307405 Unit!16651)))

(assert (= (and start!47896 res!323759) b!527433))

(assert (= (and b!527433 res!323763) b!527434))

(assert (= (and b!527434 res!323766) b!527442))

(assert (= (and b!527442 res!323764) b!527439))

(assert (= (and b!527439 res!323768) b!527431))

(assert (= (and b!527431 res!323761) b!527437))

(assert (= (and b!527437 res!323757) b!527432))

(assert (= (and b!527432 res!323758) b!527435))

(assert (= (and b!527435 res!323767) b!527443))

(assert (= (and b!527435 (not res!323762)) b!527436))

(assert (= (and b!527436 (not res!323760)) b!527438))

(assert (= (and b!527438 c!62144) b!527441))

(assert (= (and b!527438 (not c!62144)) b!527444))

(assert (= (and b!527441 res!323765) b!527440))

(declare-fun m!508081 () Bool)

(assert (=> b!527432 m!508081))

(declare-fun m!508083 () Bool)

(assert (=> b!527438 m!508083))

(declare-fun m!508085 () Bool)

(assert (=> b!527438 m!508085))

(declare-fun m!508087 () Bool)

(assert (=> b!527438 m!508087))

(declare-fun m!508089 () Bool)

(assert (=> start!47896 m!508089))

(declare-fun m!508091 () Bool)

(assert (=> start!47896 m!508091))

(declare-fun m!508093 () Bool)

(assert (=> b!527435 m!508093))

(declare-fun m!508095 () Bool)

(assert (=> b!527435 m!508095))

(assert (=> b!527435 m!508087))

(declare-fun m!508097 () Bool)

(assert (=> b!527435 m!508097))

(declare-fun m!508099 () Bool)

(assert (=> b!527435 m!508099))

(declare-fun m!508101 () Bool)

(assert (=> b!527435 m!508101))

(assert (=> b!527435 m!508087))

(declare-fun m!508103 () Bool)

(assert (=> b!527435 m!508103))

(declare-fun m!508105 () Bool)

(assert (=> b!527435 m!508105))

(declare-fun m!508107 () Bool)

(assert (=> b!527435 m!508107))

(assert (=> b!527435 m!508087))

(declare-fun m!508109 () Bool)

(assert (=> b!527431 m!508109))

(declare-fun m!508111 () Bool)

(assert (=> b!527437 m!508111))

(assert (=> b!527443 m!508087))

(assert (=> b!527443 m!508087))

(declare-fun m!508113 () Bool)

(assert (=> b!527443 m!508113))

(declare-fun m!508115 () Bool)

(assert (=> b!527441 m!508115))

(declare-fun m!508117 () Bool)

(assert (=> b!527441 m!508117))

(declare-fun m!508119 () Bool)

(assert (=> b!527442 m!508119))

(declare-fun m!508121 () Bool)

(assert (=> b!527439 m!508121))

(assert (=> b!527434 m!508087))

(assert (=> b!527434 m!508087))

(declare-fun m!508123 () Bool)

(assert (=> b!527434 m!508123))

(push 1)

(assert (not b!527443))

(assert (not b!527434))

(assert (not b!527435))

(assert (not b!527439))

(assert (not start!47896))

(assert (not b!527437))

(assert (not b!527431))

(assert (not b!527432))

(assert (not b!527441))

(assert (not b!527438))

(assert (not b!527442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

