; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47884 () Bool)

(assert start!47884)

(declare-fun b!527160 () Bool)

(declare-fun res!323634 () Bool)

(declare-fun e!307232 () Bool)

(assert (=> b!527160 (=> (not res!323634) (not e!307232))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33462 0))(
  ( (array!33463 (arr!16081 (Array (_ BitVec 32) (_ BitVec 64))) (size!16446 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33462)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!527160 (= res!323634 (and (= (size!16446 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16446 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16446 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!527162 () Bool)

(declare-fun res!323629 () Bool)

(assert (=> b!527162 (=> (not res!323629) (not e!307232))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!527162 (= res!323629 (validKeyInArray!0 (select (arr!16081 a!3235) j!176)))))

(declare-fun b!527163 () Bool)

(declare-fun e!307228 () Bool)

(declare-fun e!307233 () Bool)

(assert (=> b!527163 (= e!307228 (not e!307233))))

(declare-fun res!323635 () Bool)

(assert (=> b!527163 (=> res!323635 e!307233)))

(declare-fun lt!242507 () array!33462)

(declare-fun lt!242511 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4545 0))(
  ( (MissingZero!4545 (index!20398 (_ BitVec 32))) (Found!4545 (index!20399 (_ BitVec 32))) (Intermediate!4545 (undefined!5357 Bool) (index!20400 (_ BitVec 32)) (x!49373 (_ BitVec 32))) (Undefined!4545) (MissingVacant!4545 (index!20401 (_ BitVec 32))) )
))
(declare-fun lt!242510 () SeekEntryResult!4545)

(declare-fun lt!242506 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33462 (_ BitVec 32)) SeekEntryResult!4545)

(assert (=> b!527163 (= res!323635 (= lt!242510 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242506 lt!242511 lt!242507 mask!3524)))))

(declare-fun lt!242509 () (_ BitVec 32))

(assert (=> b!527163 (= lt!242510 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242509 (select (arr!16081 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527163 (= lt!242506 (toIndex!0 lt!242511 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!527163 (= lt!242511 (select (store (arr!16081 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!527163 (= lt!242509 (toIndex!0 (select (arr!16081 a!3235) j!176) mask!3524))))

(assert (=> b!527163 (= lt!242507 (array!33463 (store (arr!16081 a!3235) i!1204 k!2280) (size!16446 a!3235)))))

(declare-fun e!307229 () Bool)

(assert (=> b!527163 e!307229))

(declare-fun res!323638 () Bool)

(assert (=> b!527163 (=> (not res!323638) (not e!307229))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33462 (_ BitVec 32)) Bool)

(assert (=> b!527163 (= res!323638 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16626 0))(
  ( (Unit!16627) )
))
(declare-fun lt!242505 () Unit!16626)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33462 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16626)

(assert (=> b!527163 (= lt!242505 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!527164 () Bool)

(assert (=> b!527164 (= e!307233 (or (bvsgt (x!49373 lt!242510) #b01111111111111111111111111111110) (bvslt lt!242509 #b00000000000000000000000000000000) (bvsge lt!242509 (size!16446 a!3235)) (and (bvsge (index!20400 lt!242510) #b00000000000000000000000000000000) (bvslt (index!20400 lt!242510) (size!16446 a!3235)))))))

(assert (=> b!527164 (= (index!20400 lt!242510) i!1204)))

(declare-fun lt!242504 () Unit!16626)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33462 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16626)

(assert (=> b!527164 (= lt!242504 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!242509 #b00000000000000000000000000000000 (index!20400 lt!242510) (x!49373 lt!242510) mask!3524))))

(assert (=> b!527164 (and (or (= (select (arr!16081 a!3235) (index!20400 lt!242510)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16081 a!3235) (index!20400 lt!242510)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16081 a!3235) (index!20400 lt!242510)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16081 a!3235) (index!20400 lt!242510)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242503 () Unit!16626)

(declare-fun e!307227 () Unit!16626)

(assert (=> b!527164 (= lt!242503 e!307227)))

(declare-fun c!62073 () Bool)

(assert (=> b!527164 (= c!62073 (= (select (arr!16081 a!3235) (index!20400 lt!242510)) (select (arr!16081 a!3235) j!176)))))

(assert (=> b!527164 (and (bvslt (x!49373 lt!242510) #b01111111111111111111111111111110) (or (= (select (arr!16081 a!3235) (index!20400 lt!242510)) (select (arr!16081 a!3235) j!176)) (= (select (arr!16081 a!3235) (index!20400 lt!242510)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16081 a!3235) (index!20400 lt!242510)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527165 () Bool)

(declare-fun res!323639 () Bool)

(assert (=> b!527165 (=> (not res!323639) (not e!307228))))

(assert (=> b!527165 (= res!323639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!527166 () Bool)

(declare-fun res!323632 () Bool)

(assert (=> b!527166 (=> res!323632 e!307233)))

(assert (=> b!527166 (= res!323632 (or (undefined!5357 lt!242510) (not (is-Intermediate!4545 lt!242510))))))

(declare-fun b!527167 () Bool)

(declare-fun e!307230 () Bool)

(assert (=> b!527167 (= e!307230 false)))

(declare-fun b!527168 () Bool)

(assert (=> b!527168 (= e!307232 e!307228)))

(declare-fun res!323631 () Bool)

(assert (=> b!527168 (=> (not res!323631) (not e!307228))))

(declare-fun lt!242508 () SeekEntryResult!4545)

(assert (=> b!527168 (= res!323631 (or (= lt!242508 (MissingZero!4545 i!1204)) (= lt!242508 (MissingVacant!4545 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33462 (_ BitVec 32)) SeekEntryResult!4545)

(assert (=> b!527168 (= lt!242508 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!527169 () Bool)

(declare-fun Unit!16628 () Unit!16626)

(assert (=> b!527169 (= e!307227 Unit!16628)))

(declare-fun b!527170 () Bool)

(declare-fun res!323637 () Bool)

(assert (=> b!527170 (=> (not res!323637) (not e!307232))))

(declare-fun arrayContainsKey!0 (array!33462 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!527170 (= res!323637 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!527171 () Bool)

(assert (=> b!527171 (= e!307229 (= (seekEntryOrOpen!0 (select (arr!16081 a!3235) j!176) a!3235 mask!3524) (Found!4545 j!176)))))

(declare-fun b!527172 () Bool)

(declare-fun res!323633 () Bool)

(assert (=> b!527172 (=> (not res!323633) (not e!307232))))

(assert (=> b!527172 (= res!323633 (validKeyInArray!0 k!2280))))

(declare-fun b!527173 () Bool)

(declare-fun res!323628 () Bool)

(assert (=> b!527173 (=> (not res!323628) (not e!307228))))

(declare-datatypes ((List!10278 0))(
  ( (Nil!10275) (Cons!10274 (h!11208 (_ BitVec 64)) (t!16497 List!10278)) )
))
(declare-fun arrayNoDuplicates!0 (array!33462 (_ BitVec 32) List!10278) Bool)

(assert (=> b!527173 (= res!323628 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10275))))

(declare-fun res!323636 () Bool)

(assert (=> start!47884 (=> (not res!323636) (not e!307232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47884 (= res!323636 (validMask!0 mask!3524))))

(assert (=> start!47884 e!307232))

(assert (=> start!47884 true))

(declare-fun array_inv!11964 (array!33462) Bool)

(assert (=> start!47884 (array_inv!11964 a!3235)))

(declare-fun b!527161 () Bool)

(declare-fun Unit!16629 () Unit!16626)

(assert (=> b!527161 (= e!307227 Unit!16629)))

(declare-fun lt!242512 () Unit!16626)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33462 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16626)

(assert (=> b!527161 (= lt!242512 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!242509 #b00000000000000000000000000000000 (index!20400 lt!242510) (x!49373 lt!242510) mask!3524))))

(declare-fun res!323630 () Bool)

(assert (=> b!527161 (= res!323630 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242509 lt!242511 lt!242507 mask!3524) (Intermediate!4545 false (index!20400 lt!242510) (x!49373 lt!242510))))))

(assert (=> b!527161 (=> (not res!323630) (not e!307230))))

(assert (=> b!527161 e!307230))

(assert (= (and start!47884 res!323636) b!527160))

(assert (= (and b!527160 res!323634) b!527162))

(assert (= (and b!527162 res!323629) b!527172))

(assert (= (and b!527172 res!323633) b!527170))

(assert (= (and b!527170 res!323637) b!527168))

(assert (= (and b!527168 res!323631) b!527165))

(assert (= (and b!527165 res!323639) b!527173))

(assert (= (and b!527173 res!323628) b!527163))

(assert (= (and b!527163 res!323638) b!527171))

(assert (= (and b!527163 (not res!323635)) b!527166))

(assert (= (and b!527166 (not res!323632)) b!527164))

(assert (= (and b!527164 c!62073) b!527161))

(assert (= (and b!527164 (not c!62073)) b!527169))

(assert (= (and b!527161 res!323630) b!527167))

(declare-fun m!507329 () Bool)

(assert (=> b!527165 m!507329))

(declare-fun m!507331 () Bool)

(assert (=> start!47884 m!507331))

(declare-fun m!507333 () Bool)

(assert (=> start!47884 m!507333))

(declare-fun m!507335 () Bool)

(assert (=> b!527170 m!507335))

(declare-fun m!507337 () Bool)

(assert (=> b!527161 m!507337))

(declare-fun m!507339 () Bool)

(assert (=> b!527161 m!507339))

(declare-fun m!507341 () Bool)

(assert (=> b!527172 m!507341))

(declare-fun m!507343 () Bool)

(assert (=> b!527171 m!507343))

(assert (=> b!527171 m!507343))

(declare-fun m!507345 () Bool)

(assert (=> b!527171 m!507345))

(declare-fun m!507347 () Bool)

(assert (=> b!527163 m!507347))

(declare-fun m!507349 () Bool)

(assert (=> b!527163 m!507349))

(declare-fun m!507351 () Bool)

(assert (=> b!527163 m!507351))

(assert (=> b!527163 m!507343))

(declare-fun m!507353 () Bool)

(assert (=> b!527163 m!507353))

(declare-fun m!507355 () Bool)

(assert (=> b!527163 m!507355))

(assert (=> b!527163 m!507343))

(declare-fun m!507357 () Bool)

(assert (=> b!527163 m!507357))

(assert (=> b!527163 m!507343))

(declare-fun m!507359 () Bool)

(assert (=> b!527163 m!507359))

(declare-fun m!507361 () Bool)

(assert (=> b!527163 m!507361))

(declare-fun m!507363 () Bool)

(assert (=> b!527173 m!507363))

(declare-fun m!507365 () Bool)

(assert (=> b!527168 m!507365))

(assert (=> b!527162 m!507343))

(assert (=> b!527162 m!507343))

(declare-fun m!507367 () Bool)

(assert (=> b!527162 m!507367))

(declare-fun m!507369 () Bool)

(assert (=> b!527164 m!507369))

(declare-fun m!507371 () Bool)

(assert (=> b!527164 m!507371))

(assert (=> b!527164 m!507343))

(push 1)

(assert (not b!527168))

(assert (not b!527171))

(assert (not b!527162))

(assert (not start!47884))

(assert (not b!527170))

(assert (not b!527165))

(assert (not b!527163))

(assert (not b!527172))

(assert (not b!527161))

(assert (not b!527164))

(assert (not b!527173))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

