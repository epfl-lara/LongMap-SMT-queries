; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47690 () Bool)

(assert start!47690)

(declare-fun b!524430 () Bool)

(declare-fun res!321388 () Bool)

(declare-fun e!305845 () Bool)

(assert (=> b!524430 (=> (not res!321388) (not e!305845))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524430 (= res!321388 (validKeyInArray!0 k0!2280))))

(declare-fun b!524432 () Bool)

(declare-fun res!321391 () Bool)

(declare-fun e!305841 () Bool)

(assert (=> b!524432 (=> (not res!321391) (not e!305841))))

(declare-datatypes ((array!33328 0))(
  ( (array!33329 (arr!16015 (Array (_ BitVec 32) (_ BitVec 64))) (size!16379 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33328)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33328 (_ BitVec 32)) Bool)

(assert (=> b!524432 (= res!321391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524433 () Bool)

(declare-fun res!321389 () Bool)

(declare-fun e!305843 () Bool)

(assert (=> b!524433 (=> res!321389 e!305843)))

(declare-datatypes ((SeekEntryResult!4438 0))(
  ( (MissingZero!4438 (index!19964 (_ BitVec 32))) (Found!4438 (index!19965 (_ BitVec 32))) (Intermediate!4438 (undefined!5250 Bool) (index!19966 (_ BitVec 32)) (x!49096 (_ BitVec 32))) (Undefined!4438) (MissingVacant!4438 (index!19967 (_ BitVec 32))) )
))
(declare-fun lt!240738 () SeekEntryResult!4438)

(get-info :version)

(assert (=> b!524433 (= res!321389 (or (undefined!5250 lt!240738) (not ((_ is Intermediate!4438) lt!240738))))))

(declare-fun b!524434 () Bool)

(declare-fun res!321387 () Bool)

(assert (=> b!524434 (=> (not res!321387) (not e!305845))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!524434 (= res!321387 (and (= (size!16379 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16379 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16379 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524435 () Bool)

(declare-datatypes ((Unit!16363 0))(
  ( (Unit!16364) )
))
(declare-fun e!305846 () Unit!16363)

(declare-fun Unit!16365 () Unit!16363)

(assert (=> b!524435 (= e!305846 Unit!16365)))

(declare-fun lt!240742 () Unit!16363)

(declare-fun lt!240741 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33328 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16363)

(assert (=> b!524435 (= lt!240742 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240741 #b00000000000000000000000000000000 (index!19966 lt!240738) (x!49096 lt!240738) mask!3524))))

(declare-fun lt!240737 () (_ BitVec 64))

(declare-fun res!321383 () Bool)

(declare-fun lt!240736 () array!33328)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33328 (_ BitVec 32)) SeekEntryResult!4438)

(assert (=> b!524435 (= res!321383 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240741 lt!240737 lt!240736 mask!3524) (Intermediate!4438 false (index!19966 lt!240738) (x!49096 lt!240738))))))

(declare-fun e!305847 () Bool)

(assert (=> b!524435 (=> (not res!321383) (not e!305847))))

(assert (=> b!524435 e!305847))

(declare-fun b!524436 () Bool)

(assert (=> b!524436 (= e!305847 false)))

(declare-fun b!524437 () Bool)

(assert (=> b!524437 (= e!305845 e!305841)))

(declare-fun res!321394 () Bool)

(assert (=> b!524437 (=> (not res!321394) (not e!305841))))

(declare-fun lt!240739 () SeekEntryResult!4438)

(assert (=> b!524437 (= res!321394 (or (= lt!240739 (MissingZero!4438 i!1204)) (= lt!240739 (MissingVacant!4438 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33328 (_ BitVec 32)) SeekEntryResult!4438)

(assert (=> b!524437 (= lt!240739 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!524438 () Bool)

(declare-fun Unit!16366 () Unit!16363)

(assert (=> b!524438 (= e!305846 Unit!16366)))

(declare-fun b!524439 () Bool)

(declare-fun res!321385 () Bool)

(assert (=> b!524439 (=> (not res!321385) (not e!305841))))

(declare-datatypes ((List!10080 0))(
  ( (Nil!10077) (Cons!10076 (h!11007 (_ BitVec 64)) (t!16300 List!10080)) )
))
(declare-fun arrayNoDuplicates!0 (array!33328 (_ BitVec 32) List!10080) Bool)

(assert (=> b!524439 (= res!321385 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10077))))

(declare-fun res!321390 () Bool)

(assert (=> start!47690 (=> (not res!321390) (not e!305845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47690 (= res!321390 (validMask!0 mask!3524))))

(assert (=> start!47690 e!305845))

(assert (=> start!47690 true))

(declare-fun array_inv!11874 (array!33328) Bool)

(assert (=> start!47690 (array_inv!11874 a!3235)))

(declare-fun b!524431 () Bool)

(assert (=> b!524431 (= e!305841 (not e!305843))))

(declare-fun res!321393 () Bool)

(assert (=> b!524431 (=> res!321393 e!305843)))

(declare-fun lt!240734 () (_ BitVec 32))

(assert (=> b!524431 (= res!321393 (= lt!240738 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240734 lt!240737 lt!240736 mask!3524)))))

(assert (=> b!524431 (= lt!240738 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240741 (select (arr!16015 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524431 (= lt!240734 (toIndex!0 lt!240737 mask!3524))))

(assert (=> b!524431 (= lt!240737 (select (store (arr!16015 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!524431 (= lt!240741 (toIndex!0 (select (arr!16015 a!3235) j!176) mask!3524))))

(assert (=> b!524431 (= lt!240736 (array!33329 (store (arr!16015 a!3235) i!1204 k0!2280) (size!16379 a!3235)))))

(declare-fun e!305842 () Bool)

(assert (=> b!524431 e!305842))

(declare-fun res!321386 () Bool)

(assert (=> b!524431 (=> (not res!321386) (not e!305842))))

(assert (=> b!524431 (= res!321386 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240735 () Unit!16363)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33328 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16363)

(assert (=> b!524431 (= lt!240735 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524440 () Bool)

(declare-fun res!321384 () Bool)

(assert (=> b!524440 (=> (not res!321384) (not e!305845))))

(declare-fun arrayContainsKey!0 (array!33328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524440 (= res!321384 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524441 () Bool)

(assert (=> b!524441 (= e!305842 (= (seekEntryOrOpen!0 (select (arr!16015 a!3235) j!176) a!3235 mask!3524) (Found!4438 j!176)))))

(declare-fun b!524442 () Bool)

(assert (=> b!524442 (= e!305843 true)))

(assert (=> b!524442 (and (or (= (select (arr!16015 a!3235) (index!19966 lt!240738)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16015 a!3235) (index!19966 lt!240738)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16015 a!3235) (index!19966 lt!240738)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16015 a!3235) (index!19966 lt!240738)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240740 () Unit!16363)

(assert (=> b!524442 (= lt!240740 e!305846)))

(declare-fun c!61829 () Bool)

(assert (=> b!524442 (= c!61829 (= (select (arr!16015 a!3235) (index!19966 lt!240738)) (select (arr!16015 a!3235) j!176)))))

(assert (=> b!524442 (and (bvslt (x!49096 lt!240738) #b01111111111111111111111111111110) (or (= (select (arr!16015 a!3235) (index!19966 lt!240738)) (select (arr!16015 a!3235) j!176)) (= (select (arr!16015 a!3235) (index!19966 lt!240738)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16015 a!3235) (index!19966 lt!240738)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524443 () Bool)

(declare-fun res!321392 () Bool)

(assert (=> b!524443 (=> (not res!321392) (not e!305845))))

(assert (=> b!524443 (= res!321392 (validKeyInArray!0 (select (arr!16015 a!3235) j!176)))))

(assert (= (and start!47690 res!321390) b!524434))

(assert (= (and b!524434 res!321387) b!524443))

(assert (= (and b!524443 res!321392) b!524430))

(assert (= (and b!524430 res!321388) b!524440))

(assert (= (and b!524440 res!321384) b!524437))

(assert (= (and b!524437 res!321394) b!524432))

(assert (= (and b!524432 res!321391) b!524439))

(assert (= (and b!524439 res!321385) b!524431))

(assert (= (and b!524431 res!321386) b!524441))

(assert (= (and b!524431 (not res!321393)) b!524433))

(assert (= (and b!524433 (not res!321389)) b!524442))

(assert (= (and b!524442 c!61829) b!524435))

(assert (= (and b!524442 (not c!61829)) b!524438))

(assert (= (and b!524435 res!321383) b!524436))

(declare-fun m!505309 () Bool)

(assert (=> b!524443 m!505309))

(assert (=> b!524443 m!505309))

(declare-fun m!505311 () Bool)

(assert (=> b!524443 m!505311))

(declare-fun m!505313 () Bool)

(assert (=> b!524439 m!505313))

(declare-fun m!505315 () Bool)

(assert (=> b!524432 m!505315))

(declare-fun m!505317 () Bool)

(assert (=> b!524430 m!505317))

(declare-fun m!505319 () Bool)

(assert (=> b!524437 m!505319))

(declare-fun m!505321 () Bool)

(assert (=> b!524442 m!505321))

(assert (=> b!524442 m!505309))

(declare-fun m!505323 () Bool)

(assert (=> b!524431 m!505323))

(assert (=> b!524431 m!505309))

(declare-fun m!505325 () Bool)

(assert (=> b!524431 m!505325))

(assert (=> b!524431 m!505309))

(declare-fun m!505327 () Bool)

(assert (=> b!524431 m!505327))

(assert (=> b!524431 m!505309))

(declare-fun m!505329 () Bool)

(assert (=> b!524431 m!505329))

(declare-fun m!505331 () Bool)

(assert (=> b!524431 m!505331))

(declare-fun m!505333 () Bool)

(assert (=> b!524431 m!505333))

(declare-fun m!505335 () Bool)

(assert (=> b!524431 m!505335))

(declare-fun m!505337 () Bool)

(assert (=> b!524431 m!505337))

(declare-fun m!505339 () Bool)

(assert (=> start!47690 m!505339))

(declare-fun m!505341 () Bool)

(assert (=> start!47690 m!505341))

(assert (=> b!524441 m!505309))

(assert (=> b!524441 m!505309))

(declare-fun m!505343 () Bool)

(assert (=> b!524441 m!505343))

(declare-fun m!505345 () Bool)

(assert (=> b!524435 m!505345))

(declare-fun m!505347 () Bool)

(assert (=> b!524435 m!505347))

(declare-fun m!505349 () Bool)

(assert (=> b!524440 m!505349))

(check-sat (not b!524432) (not b!524435) (not b!524441) (not b!524437) (not b!524443) (not b!524439) (not b!524430) (not b!524440) (not start!47690) (not b!524431))
(check-sat)
