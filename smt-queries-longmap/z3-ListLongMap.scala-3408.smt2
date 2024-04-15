; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47358 () Bool)

(assert start!47358)

(declare-fun b!520467 () Bool)

(declare-datatypes ((Unit!16114 0))(
  ( (Unit!16115) )
))
(declare-fun e!303696 () Unit!16114)

(declare-fun Unit!16116 () Unit!16114)

(assert (=> b!520467 (= e!303696 Unit!16116)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4417 0))(
  ( (MissingZero!4417 (index!19871 (_ BitVec 32))) (Found!4417 (index!19872 (_ BitVec 32))) (Intermediate!4417 (undefined!5229 Bool) (index!19873 (_ BitVec 32)) (x!48870 (_ BitVec 32))) (Undefined!4417) (MissingVacant!4417 (index!19874 (_ BitVec 32))) )
))
(declare-fun lt!238282 () SeekEntryResult!4417)

(declare-datatypes ((array!33194 0))(
  ( (array!33195 (arr!15953 (Array (_ BitVec 32) (_ BitVec 64))) (size!16318 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33194)

(declare-fun lt!238275 () Unit!16114)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!238274 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33194 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16114)

(assert (=> b!520467 (= lt!238275 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238274 #b00000000000000000000000000000000 (index!19873 lt!238282) (x!48870 lt!238282) mask!3524))))

(declare-fun res!318516 () Bool)

(declare-fun lt!238276 () array!33194)

(declare-fun lt!238279 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33194 (_ BitVec 32)) SeekEntryResult!4417)

(assert (=> b!520467 (= res!318516 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238274 lt!238279 lt!238276 mask!3524) (Intermediate!4417 false (index!19873 lt!238282) (x!48870 lt!238282))))))

(declare-fun e!303694 () Bool)

(assert (=> b!520467 (=> (not res!318516) (not e!303694))))

(assert (=> b!520467 e!303694))

(declare-fun b!520468 () Bool)

(declare-fun res!318517 () Bool)

(declare-fun e!303693 () Bool)

(assert (=> b!520468 (=> (not res!318517) (not e!303693))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!520468 (= res!318517 (validKeyInArray!0 (select (arr!15953 a!3235) j!176)))))

(declare-fun b!520469 () Bool)

(declare-fun res!318509 () Bool)

(declare-fun e!303690 () Bool)

(assert (=> b!520469 (=> res!318509 e!303690)))

(get-info :version)

(assert (=> b!520469 (= res!318509 (or (undefined!5229 lt!238282) (not ((_ is Intermediate!4417) lt!238282))))))

(declare-fun b!520470 () Bool)

(declare-fun res!318514 () Bool)

(assert (=> b!520470 (=> (not res!318514) (not e!303693))))

(declare-fun arrayContainsKey!0 (array!33194 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!520470 (= res!318514 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun e!303691 () Bool)

(declare-fun b!520471 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33194 (_ BitVec 32)) SeekEntryResult!4417)

(assert (=> b!520471 (= e!303691 (= (seekEntryOrOpen!0 (select (arr!15953 a!3235) j!176) a!3235 mask!3524) (Found!4417 j!176)))))

(declare-fun b!520472 () Bool)

(declare-fun res!318518 () Bool)

(assert (=> b!520472 (=> (not res!318518) (not e!303693))))

(assert (=> b!520472 (= res!318518 (and (= (size!16318 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16318 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16318 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!520473 () Bool)

(declare-fun res!318512 () Bool)

(declare-fun e!303692 () Bool)

(assert (=> b!520473 (=> (not res!318512) (not e!303692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33194 (_ BitVec 32)) Bool)

(assert (=> b!520473 (= res!318512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!520474 () Bool)

(assert (=> b!520474 (= e!303690 (= (select (arr!15953 a!3235) (index!19873 lt!238282)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!520474 (and (or (= (select (arr!15953 a!3235) (index!19873 lt!238282)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15953 a!3235) (index!19873 lt!238282)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15953 a!3235) (index!19873 lt!238282)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!238278 () Unit!16114)

(assert (=> b!520474 (= lt!238278 e!303696)))

(declare-fun c!61281 () Bool)

(assert (=> b!520474 (= c!61281 (= (select (arr!15953 a!3235) (index!19873 lt!238282)) (select (arr!15953 a!3235) j!176)))))

(assert (=> b!520474 (and (bvslt (x!48870 lt!238282) #b01111111111111111111111111111110) (or (= (select (arr!15953 a!3235) (index!19873 lt!238282)) (select (arr!15953 a!3235) j!176)) (= (select (arr!15953 a!3235) (index!19873 lt!238282)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15953 a!3235) (index!19873 lt!238282)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520475 () Bool)

(assert (=> b!520475 (= e!303694 false)))

(declare-fun b!520476 () Bool)

(declare-fun res!318511 () Bool)

(assert (=> b!520476 (=> (not res!318511) (not e!303693))))

(assert (=> b!520476 (= res!318511 (validKeyInArray!0 k0!2280))))

(declare-fun b!520477 () Bool)

(assert (=> b!520477 (= e!303692 (not e!303690))))

(declare-fun res!318508 () Bool)

(assert (=> b!520477 (=> res!318508 e!303690)))

(declare-fun lt!238277 () (_ BitVec 32))

(assert (=> b!520477 (= res!318508 (= lt!238282 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238277 lt!238279 lt!238276 mask!3524)))))

(assert (=> b!520477 (= lt!238282 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238274 (select (arr!15953 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520477 (= lt!238277 (toIndex!0 lt!238279 mask!3524))))

(assert (=> b!520477 (= lt!238279 (select (store (arr!15953 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!520477 (= lt!238274 (toIndex!0 (select (arr!15953 a!3235) j!176) mask!3524))))

(assert (=> b!520477 (= lt!238276 (array!33195 (store (arr!15953 a!3235) i!1204 k0!2280) (size!16318 a!3235)))))

(assert (=> b!520477 e!303691))

(declare-fun res!318515 () Bool)

(assert (=> b!520477 (=> (not res!318515) (not e!303691))))

(assert (=> b!520477 (= res!318515 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238280 () Unit!16114)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33194 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16114)

(assert (=> b!520477 (= lt!238280 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!318510 () Bool)

(assert (=> start!47358 (=> (not res!318510) (not e!303693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47358 (= res!318510 (validMask!0 mask!3524))))

(assert (=> start!47358 e!303693))

(assert (=> start!47358 true))

(declare-fun array_inv!11836 (array!33194) Bool)

(assert (=> start!47358 (array_inv!11836 a!3235)))

(declare-fun b!520478 () Bool)

(assert (=> b!520478 (= e!303693 e!303692)))

(declare-fun res!318507 () Bool)

(assert (=> b!520478 (=> (not res!318507) (not e!303692))))

(declare-fun lt!238281 () SeekEntryResult!4417)

(assert (=> b!520478 (= res!318507 (or (= lt!238281 (MissingZero!4417 i!1204)) (= lt!238281 (MissingVacant!4417 i!1204))))))

(assert (=> b!520478 (= lt!238281 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!520479 () Bool)

(declare-fun Unit!16117 () Unit!16114)

(assert (=> b!520479 (= e!303696 Unit!16117)))

(declare-fun b!520480 () Bool)

(declare-fun res!318513 () Bool)

(assert (=> b!520480 (=> (not res!318513) (not e!303692))))

(declare-datatypes ((List!10150 0))(
  ( (Nil!10147) (Cons!10146 (h!11068 (_ BitVec 64)) (t!16369 List!10150)) )
))
(declare-fun arrayNoDuplicates!0 (array!33194 (_ BitVec 32) List!10150) Bool)

(assert (=> b!520480 (= res!318513 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10147))))

(assert (= (and start!47358 res!318510) b!520472))

(assert (= (and b!520472 res!318518) b!520468))

(assert (= (and b!520468 res!318517) b!520476))

(assert (= (and b!520476 res!318511) b!520470))

(assert (= (and b!520470 res!318514) b!520478))

(assert (= (and b!520478 res!318507) b!520473))

(assert (= (and b!520473 res!318512) b!520480))

(assert (= (and b!520480 res!318513) b!520477))

(assert (= (and b!520477 res!318515) b!520471))

(assert (= (and b!520477 (not res!318508)) b!520469))

(assert (= (and b!520469 (not res!318509)) b!520474))

(assert (= (and b!520474 c!61281) b!520467))

(assert (= (and b!520474 (not c!61281)) b!520479))

(assert (= (and b!520467 res!318516) b!520475))

(declare-fun m!500899 () Bool)

(assert (=> b!520480 m!500899))

(declare-fun m!500901 () Bool)

(assert (=> b!520467 m!500901))

(declare-fun m!500903 () Bool)

(assert (=> b!520467 m!500903))

(declare-fun m!500905 () Bool)

(assert (=> start!47358 m!500905))

(declare-fun m!500907 () Bool)

(assert (=> start!47358 m!500907))

(declare-fun m!500909 () Bool)

(assert (=> b!520478 m!500909))

(declare-fun m!500911 () Bool)

(assert (=> b!520477 m!500911))

(declare-fun m!500913 () Bool)

(assert (=> b!520477 m!500913))

(declare-fun m!500915 () Bool)

(assert (=> b!520477 m!500915))

(declare-fun m!500917 () Bool)

(assert (=> b!520477 m!500917))

(declare-fun m!500919 () Bool)

(assert (=> b!520477 m!500919))

(assert (=> b!520477 m!500917))

(declare-fun m!500921 () Bool)

(assert (=> b!520477 m!500921))

(assert (=> b!520477 m!500917))

(declare-fun m!500923 () Bool)

(assert (=> b!520477 m!500923))

(declare-fun m!500925 () Bool)

(assert (=> b!520477 m!500925))

(declare-fun m!500927 () Bool)

(assert (=> b!520477 m!500927))

(declare-fun m!500929 () Bool)

(assert (=> b!520473 m!500929))

(declare-fun m!500931 () Bool)

(assert (=> b!520474 m!500931))

(assert (=> b!520474 m!500917))

(assert (=> b!520471 m!500917))

(assert (=> b!520471 m!500917))

(declare-fun m!500933 () Bool)

(assert (=> b!520471 m!500933))

(declare-fun m!500935 () Bool)

(assert (=> b!520470 m!500935))

(declare-fun m!500937 () Bool)

(assert (=> b!520476 m!500937))

(assert (=> b!520468 m!500917))

(assert (=> b!520468 m!500917))

(declare-fun m!500939 () Bool)

(assert (=> b!520468 m!500939))

(check-sat (not b!520468) (not start!47358) (not b!520470) (not b!520473) (not b!520467) (not b!520480) (not b!520471) (not b!520477) (not b!520478) (not b!520476))
(check-sat)
