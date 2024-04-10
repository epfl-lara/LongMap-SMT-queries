; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48002 () Bool)

(assert start!48002)

(declare-fun b!528419 () Bool)

(declare-fun res!324417 () Bool)

(declare-fun e!307951 () Bool)

(assert (=> b!528419 (=> res!324417 e!307951)))

(declare-fun e!307952 () Bool)

(assert (=> b!528419 (= res!324417 e!307952)))

(declare-fun res!324408 () Bool)

(assert (=> b!528419 (=> (not res!324408) (not e!307952))))

(declare-datatypes ((SeekEntryResult!4563 0))(
  ( (MissingZero!4563 (index!20476 (_ BitVec 32))) (Found!4563 (index!20477 (_ BitVec 32))) (Intermediate!4563 (undefined!5375 Bool) (index!20478 (_ BitVec 32)) (x!49451 (_ BitVec 32))) (Undefined!4563) (MissingVacant!4563 (index!20479 (_ BitVec 32))) )
))
(declare-fun lt!243337 () SeekEntryResult!4563)

(assert (=> b!528419 (= res!324408 (bvsgt #b00000000000000000000000000000000 (x!49451 lt!243337)))))

(declare-fun b!528420 () Bool)

(declare-fun e!307955 () Bool)

(assert (=> b!528420 (= e!307955 e!307951)))

(declare-fun res!324414 () Bool)

(assert (=> b!528420 (=> res!324414 e!307951)))

(declare-fun lt!243342 () (_ BitVec 32))

(declare-datatypes ((array!33495 0))(
  ( (array!33496 (arr!16096 (Array (_ BitVec 32) (_ BitVec 64))) (size!16460 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33495)

(assert (=> b!528420 (= res!324414 (or (bvsgt (x!49451 lt!243337) #b01111111111111111111111111111110) (bvslt lt!243342 #b00000000000000000000000000000000) (bvsge lt!243342 (size!16460 a!3235)) (bvslt (index!20478 lt!243337) #b00000000000000000000000000000000) (bvsge (index!20478 lt!243337) (size!16460 a!3235)) (not (= lt!243337 (Intermediate!4563 false (index!20478 lt!243337) (x!49451 lt!243337))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!528420 (= (index!20478 lt!243337) i!1204)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((Unit!16704 0))(
  ( (Unit!16705) )
))
(declare-fun lt!243333 () Unit!16704)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33495 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16704)

(assert (=> b!528420 (= lt!243333 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!243342 #b00000000000000000000000000000000 (index!20478 lt!243337) (x!49451 lt!243337) mask!3524))))

(assert (=> b!528420 (and (or (= (select (arr!16096 a!3235) (index!20478 lt!243337)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16096 a!3235) (index!20478 lt!243337)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16096 a!3235) (index!20478 lt!243337)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16096 a!3235) (index!20478 lt!243337)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243338 () Unit!16704)

(declare-fun e!307954 () Unit!16704)

(assert (=> b!528420 (= lt!243338 e!307954)))

(declare-fun c!62315 () Bool)

(assert (=> b!528420 (= c!62315 (= (select (arr!16096 a!3235) (index!20478 lt!243337)) (select (arr!16096 a!3235) j!176)))))

(assert (=> b!528420 (and (bvslt (x!49451 lt!243337) #b01111111111111111111111111111110) (or (= (select (arr!16096 a!3235) (index!20478 lt!243337)) (select (arr!16096 a!3235) j!176)) (= (select (arr!16096 a!3235) (index!20478 lt!243337)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16096 a!3235) (index!20478 lt!243337)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!243339 () array!33495)

(declare-fun lt!243335 () SeekEntryResult!4563)

(declare-fun b!528421 () Bool)

(declare-fun lt!243334 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33495 (_ BitVec 32)) SeekEntryResult!4563)

(assert (=> b!528421 (= e!307951 (= lt!243335 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243342 lt!243334 lt!243339 mask!3524)))))

(declare-fun b!528423 () Bool)

(declare-fun res!324409 () Bool)

(declare-fun e!307957 () Bool)

(assert (=> b!528423 (=> (not res!324409) (not e!307957))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!528423 (= res!324409 (validKeyInArray!0 (select (arr!16096 a!3235) j!176)))))

(declare-fun b!528424 () Bool)

(declare-fun res!324416 () Bool)

(assert (=> b!528424 (=> (not res!324416) (not e!307957))))

(assert (=> b!528424 (= res!324416 (and (= (size!16460 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16460 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16460 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!528425 () Bool)

(declare-fun e!307958 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33495 (_ BitVec 32)) SeekEntryResult!4563)

(assert (=> b!528425 (= e!307958 (= (seekEntryOrOpen!0 (select (arr!16096 a!3235) j!176) a!3235 mask!3524) (Found!4563 j!176)))))

(declare-fun b!528426 () Bool)

(declare-fun e!307956 () Bool)

(assert (=> b!528426 (= e!307957 e!307956)))

(declare-fun res!324413 () Bool)

(assert (=> b!528426 (=> (not res!324413) (not e!307956))))

(declare-fun lt!243340 () SeekEntryResult!4563)

(assert (=> b!528426 (= res!324413 (or (= lt!243340 (MissingZero!4563 i!1204)) (= lt!243340 (MissingVacant!4563 i!1204))))))

(assert (=> b!528426 (= lt!243340 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!528427 () Bool)

(declare-fun res!324418 () Bool)

(assert (=> b!528427 (=> (not res!324418) (not e!307956))))

(declare-datatypes ((List!10254 0))(
  ( (Nil!10251) (Cons!10250 (h!11187 (_ BitVec 64)) (t!16482 List!10254)) )
))
(declare-fun arrayNoDuplicates!0 (array!33495 (_ BitVec 32) List!10254) Bool)

(assert (=> b!528427 (= res!324418 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10251))))

(declare-fun b!528428 () Bool)

(declare-fun res!324412 () Bool)

(assert (=> b!528428 (=> (not res!324412) (not e!307957))))

(assert (=> b!528428 (= res!324412 (validKeyInArray!0 k0!2280))))

(declare-fun b!528429 () Bool)

(declare-fun res!324407 () Bool)

(assert (=> b!528429 (=> (not res!324407) (not e!307957))))

(declare-fun arrayContainsKey!0 (array!33495 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!528429 (= res!324407 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!324411 () Bool)

(assert (=> start!48002 (=> (not res!324411) (not e!307957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48002 (= res!324411 (validMask!0 mask!3524))))

(assert (=> start!48002 e!307957))

(assert (=> start!48002 true))

(declare-fun array_inv!11892 (array!33495) Bool)

(assert (=> start!48002 (array_inv!11892 a!3235)))

(declare-fun b!528422 () Bool)

(declare-fun Unit!16706 () Unit!16704)

(assert (=> b!528422 (= e!307954 Unit!16706)))

(declare-fun lt!243341 () Unit!16704)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33495 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16704)

(assert (=> b!528422 (= lt!243341 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!243342 #b00000000000000000000000000000000 (index!20478 lt!243337) (x!49451 lt!243337) mask!3524))))

(declare-fun res!324406 () Bool)

(assert (=> b!528422 (= res!324406 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243342 lt!243334 lt!243339 mask!3524) (Intermediate!4563 false (index!20478 lt!243337) (x!49451 lt!243337))))))

(declare-fun e!307959 () Bool)

(assert (=> b!528422 (=> (not res!324406) (not e!307959))))

(assert (=> b!528422 e!307959))

(declare-fun b!528430 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33495 (_ BitVec 32)) SeekEntryResult!4563)

(assert (=> b!528430 (= e!307952 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243342 (index!20478 lt!243337) (select (arr!16096 a!3235) j!176) a!3235 mask!3524) (Found!4563 j!176))))))

(declare-fun b!528431 () Bool)

(declare-fun res!324415 () Bool)

(assert (=> b!528431 (=> (not res!324415) (not e!307956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33495 (_ BitVec 32)) Bool)

(assert (=> b!528431 (= res!324415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!528432 () Bool)

(declare-fun Unit!16707 () Unit!16704)

(assert (=> b!528432 (= e!307954 Unit!16707)))

(declare-fun b!528433 () Bool)

(assert (=> b!528433 (= e!307956 (not e!307955))))

(declare-fun res!324419 () Bool)

(assert (=> b!528433 (=> res!324419 e!307955)))

(get-info :version)

(assert (=> b!528433 (= res!324419 (or (= lt!243337 lt!243335) (undefined!5375 lt!243337) (not ((_ is Intermediate!4563) lt!243337))))))

(declare-fun lt!243336 () (_ BitVec 32))

(assert (=> b!528433 (= lt!243335 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243336 lt!243334 lt!243339 mask!3524))))

(assert (=> b!528433 (= lt!243337 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243342 (select (arr!16096 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528433 (= lt!243336 (toIndex!0 lt!243334 mask!3524))))

(assert (=> b!528433 (= lt!243334 (select (store (arr!16096 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!528433 (= lt!243342 (toIndex!0 (select (arr!16096 a!3235) j!176) mask!3524))))

(assert (=> b!528433 (= lt!243339 (array!33496 (store (arr!16096 a!3235) i!1204 k0!2280) (size!16460 a!3235)))))

(assert (=> b!528433 e!307958))

(declare-fun res!324410 () Bool)

(assert (=> b!528433 (=> (not res!324410) (not e!307958))))

(assert (=> b!528433 (= res!324410 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243343 () Unit!16704)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33495 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16704)

(assert (=> b!528433 (= lt!243343 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!528434 () Bool)

(assert (=> b!528434 (= e!307959 false)))

(assert (= (and start!48002 res!324411) b!528424))

(assert (= (and b!528424 res!324416) b!528423))

(assert (= (and b!528423 res!324409) b!528428))

(assert (= (and b!528428 res!324412) b!528429))

(assert (= (and b!528429 res!324407) b!528426))

(assert (= (and b!528426 res!324413) b!528431))

(assert (= (and b!528431 res!324415) b!528427))

(assert (= (and b!528427 res!324418) b!528433))

(assert (= (and b!528433 res!324410) b!528425))

(assert (= (and b!528433 (not res!324419)) b!528420))

(assert (= (and b!528420 c!62315) b!528422))

(assert (= (and b!528420 (not c!62315)) b!528432))

(assert (= (and b!528422 res!324406) b!528434))

(assert (= (and b!528420 (not res!324414)) b!528419))

(assert (= (and b!528419 res!324408) b!528430))

(assert (= (and b!528419 (not res!324417)) b!528421))

(declare-fun m!508963 () Bool)

(assert (=> b!528431 m!508963))

(declare-fun m!508965 () Bool)

(assert (=> b!528428 m!508965))

(declare-fun m!508967 () Bool)

(assert (=> b!528430 m!508967))

(assert (=> b!528430 m!508967))

(declare-fun m!508969 () Bool)

(assert (=> b!528430 m!508969))

(declare-fun m!508971 () Bool)

(assert (=> b!528421 m!508971))

(declare-fun m!508973 () Bool)

(assert (=> b!528433 m!508973))

(declare-fun m!508975 () Bool)

(assert (=> b!528433 m!508975))

(declare-fun m!508977 () Bool)

(assert (=> b!528433 m!508977))

(declare-fun m!508979 () Bool)

(assert (=> b!528433 m!508979))

(assert (=> b!528433 m!508967))

(declare-fun m!508981 () Bool)

(assert (=> b!528433 m!508981))

(assert (=> b!528433 m!508967))

(declare-fun m!508983 () Bool)

(assert (=> b!528433 m!508983))

(declare-fun m!508985 () Bool)

(assert (=> b!528433 m!508985))

(assert (=> b!528433 m!508967))

(declare-fun m!508987 () Bool)

(assert (=> b!528433 m!508987))

(declare-fun m!508989 () Bool)

(assert (=> b!528426 m!508989))

(assert (=> b!528425 m!508967))

(assert (=> b!528425 m!508967))

(declare-fun m!508991 () Bool)

(assert (=> b!528425 m!508991))

(declare-fun m!508993 () Bool)

(assert (=> b!528420 m!508993))

(declare-fun m!508995 () Bool)

(assert (=> b!528420 m!508995))

(assert (=> b!528420 m!508967))

(declare-fun m!508997 () Bool)

(assert (=> b!528427 m!508997))

(assert (=> b!528423 m!508967))

(assert (=> b!528423 m!508967))

(declare-fun m!508999 () Bool)

(assert (=> b!528423 m!508999))

(declare-fun m!509001 () Bool)

(assert (=> b!528429 m!509001))

(declare-fun m!509003 () Bool)

(assert (=> start!48002 m!509003))

(declare-fun m!509005 () Bool)

(assert (=> start!48002 m!509005))

(declare-fun m!509007 () Bool)

(assert (=> b!528422 m!509007))

(assert (=> b!528422 m!508971))

(check-sat (not b!528429) (not b!528428) (not b!528422) (not b!528427) (not b!528425) (not b!528421) (not b!528431) (not b!528430) (not b!528423) (not b!528426) (not b!528420) (not start!48002) (not b!528433))
(check-sat)
