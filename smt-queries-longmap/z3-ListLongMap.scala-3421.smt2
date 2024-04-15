; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47436 () Bool)

(assert start!47436)

(declare-fun b!522105 () Bool)

(declare-fun res!319916 () Bool)

(declare-fun e!304515 () Bool)

(assert (=> b!522105 (=> (not res!319916) (not e!304515))))

(declare-datatypes ((array!33272 0))(
  ( (array!33273 (arr!15992 (Array (_ BitVec 32) (_ BitVec 64))) (size!16357 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33272)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522105 (= res!319916 (validKeyInArray!0 (select (arr!15992 a!3235) j!176)))))

(declare-fun b!522106 () Bool)

(declare-fun e!304513 () Bool)

(assert (=> b!522106 (= e!304513 false)))

(declare-fun res!319914 () Bool)

(assert (=> start!47436 (=> (not res!319914) (not e!304515))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47436 (= res!319914 (validMask!0 mask!3524))))

(assert (=> start!47436 e!304515))

(assert (=> start!47436 true))

(declare-fun array_inv!11875 (array!33272) Bool)

(assert (=> start!47436 (array_inv!11875 a!3235)))

(declare-fun b!522107 () Bool)

(declare-fun e!304510 () Bool)

(declare-fun e!304509 () Bool)

(assert (=> b!522107 (= e!304510 (not e!304509))))

(declare-fun res!319913 () Bool)

(assert (=> b!522107 (=> res!319913 e!304509)))

(declare-fun lt!239335 () array!33272)

(declare-fun lt!239332 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4456 0))(
  ( (MissingZero!4456 (index!20027 (_ BitVec 32))) (Found!4456 (index!20028 (_ BitVec 32))) (Intermediate!4456 (undefined!5268 Bool) (index!20029 (_ BitVec 32)) (x!49013 (_ BitVec 32))) (Undefined!4456) (MissingVacant!4456 (index!20030 (_ BitVec 32))) )
))
(declare-fun lt!239333 () SeekEntryResult!4456)

(declare-fun lt!239330 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33272 (_ BitVec 32)) SeekEntryResult!4456)

(assert (=> b!522107 (= res!319913 (= lt!239333 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239332 lt!239330 lt!239335 mask!3524)))))

(declare-fun lt!239334 () (_ BitVec 32))

(assert (=> b!522107 (= lt!239333 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239334 (select (arr!15992 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522107 (= lt!239332 (toIndex!0 lt!239330 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!522107 (= lt!239330 (select (store (arr!15992 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!522107 (= lt!239334 (toIndex!0 (select (arr!15992 a!3235) j!176) mask!3524))))

(assert (=> b!522107 (= lt!239335 (array!33273 (store (arr!15992 a!3235) i!1204 k0!2280) (size!16357 a!3235)))))

(declare-fun e!304512 () Bool)

(assert (=> b!522107 e!304512))

(declare-fun res!319917 () Bool)

(assert (=> b!522107 (=> (not res!319917) (not e!304512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33272 (_ BitVec 32)) Bool)

(assert (=> b!522107 (= res!319917 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16270 0))(
  ( (Unit!16271) )
))
(declare-fun lt!239328 () Unit!16270)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33272 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16270)

(assert (=> b!522107 (= lt!239328 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522108 () Bool)

(assert (=> b!522108 (= e!304515 e!304510)))

(declare-fun res!319922 () Bool)

(assert (=> b!522108 (=> (not res!319922) (not e!304510))))

(declare-fun lt!239327 () SeekEntryResult!4456)

(assert (=> b!522108 (= res!319922 (or (= lt!239327 (MissingZero!4456 i!1204)) (= lt!239327 (MissingVacant!4456 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33272 (_ BitVec 32)) SeekEntryResult!4456)

(assert (=> b!522108 (= lt!239327 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!522109 () Bool)

(declare-fun e!304514 () Unit!16270)

(declare-fun Unit!16272 () Unit!16270)

(assert (=> b!522109 (= e!304514 Unit!16272)))

(declare-fun lt!239331 () Unit!16270)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33272 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16270)

(assert (=> b!522109 (= lt!239331 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239334 #b00000000000000000000000000000000 (index!20029 lt!239333) (x!49013 lt!239333) mask!3524))))

(declare-fun res!319920 () Bool)

(assert (=> b!522109 (= res!319920 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239334 lt!239330 lt!239335 mask!3524) (Intermediate!4456 false (index!20029 lt!239333) (x!49013 lt!239333))))))

(assert (=> b!522109 (=> (not res!319920) (not e!304513))))

(assert (=> b!522109 e!304513))

(declare-fun b!522110 () Bool)

(declare-fun res!319911 () Bool)

(assert (=> b!522110 (=> (not res!319911) (not e!304515))))

(declare-fun arrayContainsKey!0 (array!33272 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522110 (= res!319911 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!522111 () Bool)

(declare-fun res!319915 () Bool)

(assert (=> b!522111 (=> (not res!319915) (not e!304515))))

(assert (=> b!522111 (= res!319915 (and (= (size!16357 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16357 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16357 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!522112 () Bool)

(declare-fun res!319918 () Bool)

(assert (=> b!522112 (=> (not res!319918) (not e!304515))))

(assert (=> b!522112 (= res!319918 (validKeyInArray!0 k0!2280))))

(declare-fun b!522113 () Bool)

(assert (=> b!522113 (= e!304512 (= (seekEntryOrOpen!0 (select (arr!15992 a!3235) j!176) a!3235 mask!3524) (Found!4456 j!176)))))

(declare-fun b!522114 () Bool)

(declare-fun res!319921 () Bool)

(assert (=> b!522114 (=> res!319921 e!304509)))

(get-info :version)

(assert (=> b!522114 (= res!319921 (or (undefined!5268 lt!239333) (not ((_ is Intermediate!4456) lt!239333))))))

(declare-fun b!522115 () Bool)

(declare-fun res!319912 () Bool)

(assert (=> b!522115 (=> (not res!319912) (not e!304510))))

(assert (=> b!522115 (= res!319912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!522116 () Bool)

(assert (=> b!522116 (= e!304509 true)))

(assert (=> b!522116 (and (or (= (select (arr!15992 a!3235) (index!20029 lt!239333)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15992 a!3235) (index!20029 lt!239333)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15992 a!3235) (index!20029 lt!239333)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15992 a!3235) (index!20029 lt!239333)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239329 () Unit!16270)

(assert (=> b!522116 (= lt!239329 e!304514)))

(declare-fun c!61398 () Bool)

(assert (=> b!522116 (= c!61398 (= (select (arr!15992 a!3235) (index!20029 lt!239333)) (select (arr!15992 a!3235) j!176)))))

(assert (=> b!522116 (and (bvslt (x!49013 lt!239333) #b01111111111111111111111111111110) (or (= (select (arr!15992 a!3235) (index!20029 lt!239333)) (select (arr!15992 a!3235) j!176)) (= (select (arr!15992 a!3235) (index!20029 lt!239333)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15992 a!3235) (index!20029 lt!239333)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522117 () Bool)

(declare-fun res!319919 () Bool)

(assert (=> b!522117 (=> (not res!319919) (not e!304510))))

(declare-datatypes ((List!10189 0))(
  ( (Nil!10186) (Cons!10185 (h!11107 (_ BitVec 64)) (t!16408 List!10189)) )
))
(declare-fun arrayNoDuplicates!0 (array!33272 (_ BitVec 32) List!10189) Bool)

(assert (=> b!522117 (= res!319919 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10186))))

(declare-fun b!522118 () Bool)

(declare-fun Unit!16273 () Unit!16270)

(assert (=> b!522118 (= e!304514 Unit!16273)))

(assert (= (and start!47436 res!319914) b!522111))

(assert (= (and b!522111 res!319915) b!522105))

(assert (= (and b!522105 res!319916) b!522112))

(assert (= (and b!522112 res!319918) b!522110))

(assert (= (and b!522110 res!319911) b!522108))

(assert (= (and b!522108 res!319922) b!522115))

(assert (= (and b!522115 res!319912) b!522117))

(assert (= (and b!522117 res!319919) b!522107))

(assert (= (and b!522107 res!319917) b!522113))

(assert (= (and b!522107 (not res!319913)) b!522114))

(assert (= (and b!522114 (not res!319921)) b!522116))

(assert (= (and b!522116 c!61398) b!522109))

(assert (= (and b!522116 (not c!61398)) b!522118))

(assert (= (and b!522109 res!319920) b!522106))

(declare-fun m!502537 () Bool)

(assert (=> b!522115 m!502537))

(declare-fun m!502539 () Bool)

(assert (=> b!522108 m!502539))

(declare-fun m!502541 () Bool)

(assert (=> b!522105 m!502541))

(assert (=> b!522105 m!502541))

(declare-fun m!502543 () Bool)

(assert (=> b!522105 m!502543))

(declare-fun m!502545 () Bool)

(assert (=> start!47436 m!502545))

(declare-fun m!502547 () Bool)

(assert (=> start!47436 m!502547))

(declare-fun m!502549 () Bool)

(assert (=> b!522112 m!502549))

(declare-fun m!502551 () Bool)

(assert (=> b!522109 m!502551))

(declare-fun m!502553 () Bool)

(assert (=> b!522109 m!502553))

(declare-fun m!502555 () Bool)

(assert (=> b!522110 m!502555))

(declare-fun m!502557 () Bool)

(assert (=> b!522107 m!502557))

(declare-fun m!502559 () Bool)

(assert (=> b!522107 m!502559))

(declare-fun m!502561 () Bool)

(assert (=> b!522107 m!502561))

(declare-fun m!502563 () Bool)

(assert (=> b!522107 m!502563))

(assert (=> b!522107 m!502541))

(declare-fun m!502565 () Bool)

(assert (=> b!522107 m!502565))

(assert (=> b!522107 m!502541))

(declare-fun m!502567 () Bool)

(assert (=> b!522107 m!502567))

(declare-fun m!502569 () Bool)

(assert (=> b!522107 m!502569))

(declare-fun m!502571 () Bool)

(assert (=> b!522107 m!502571))

(assert (=> b!522107 m!502541))

(declare-fun m!502573 () Bool)

(assert (=> b!522117 m!502573))

(declare-fun m!502575 () Bool)

(assert (=> b!522116 m!502575))

(assert (=> b!522116 m!502541))

(assert (=> b!522113 m!502541))

(assert (=> b!522113 m!502541))

(declare-fun m!502577 () Bool)

(assert (=> b!522113 m!502577))

(check-sat (not b!522107) (not b!522110) (not start!47436) (not b!522109) (not b!522117) (not b!522108) (not b!522112) (not b!522113) (not b!522105) (not b!522115))
(check-sat)
