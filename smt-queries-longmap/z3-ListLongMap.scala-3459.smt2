; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48026 () Bool)

(assert start!48026)

(declare-fun b!529027 () Bool)

(declare-fun res!324950 () Bool)

(declare-fun e!308277 () Bool)

(assert (=> b!529027 (=> (not res!324950) (not e!308277))))

(declare-datatypes ((array!33519 0))(
  ( (array!33520 (arr!16108 (Array (_ BitVec 32) (_ BitVec 64))) (size!16472 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33519)

(declare-datatypes ((List!10266 0))(
  ( (Nil!10263) (Cons!10262 (h!11199 (_ BitVec 64)) (t!16494 List!10266)) )
))
(declare-fun arrayNoDuplicates!0 (array!33519 (_ BitVec 32) List!10266) Bool)

(assert (=> b!529027 (= res!324950 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10263))))

(declare-fun b!529028 () Bool)

(declare-fun e!308275 () Bool)

(assert (=> b!529028 (= e!308275 false)))

(declare-fun b!529029 () Bool)

(declare-fun e!308276 () Bool)

(assert (=> b!529029 (= e!308276 e!308277)))

(declare-fun res!324943 () Bool)

(assert (=> b!529029 (=> (not res!324943) (not e!308277))))

(declare-datatypes ((SeekEntryResult!4575 0))(
  ( (MissingZero!4575 (index!20524 (_ BitVec 32))) (Found!4575 (index!20525 (_ BitVec 32))) (Intermediate!4575 (undefined!5387 Bool) (index!20526 (_ BitVec 32)) (x!49495 (_ BitVec 32))) (Undefined!4575) (MissingVacant!4575 (index!20527 (_ BitVec 32))) )
))
(declare-fun lt!243797 () SeekEntryResult!4575)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!529029 (= res!324943 (or (= lt!243797 (MissingZero!4575 i!1204)) (= lt!243797 (MissingVacant!4575 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33519 (_ BitVec 32)) SeekEntryResult!4575)

(assert (=> b!529029 (= lt!243797 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!529030 () Bool)

(declare-fun res!324942 () Bool)

(assert (=> b!529030 (=> (not res!324942) (not e!308276))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!529030 (= res!324942 (and (= (size!16472 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16472 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16472 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!529031 () Bool)

(declare-fun res!324953 () Bool)

(assert (=> b!529031 (=> (not res!324953) (not e!308277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33519 (_ BitVec 32)) Bool)

(assert (=> b!529031 (= res!324953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529032 () Bool)

(declare-datatypes ((Unit!16752 0))(
  ( (Unit!16753) )
))
(declare-fun e!308281 () Unit!16752)

(declare-fun Unit!16754 () Unit!16752)

(assert (=> b!529032 (= e!308281 Unit!16754)))

(declare-fun lt!243803 () SeekEntryResult!4575)

(declare-fun lt!243801 () Unit!16752)

(declare-fun lt!243800 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33519 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16752)

(assert (=> b!529032 (= lt!243801 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!243800 #b00000000000000000000000000000000 (index!20526 lt!243803) (x!49495 lt!243803) mask!3524))))

(declare-fun res!324946 () Bool)

(declare-fun lt!243794 () array!33519)

(declare-fun lt!243798 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33519 (_ BitVec 32)) SeekEntryResult!4575)

(assert (=> b!529032 (= res!324946 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243800 lt!243798 lt!243794 mask!3524) (Intermediate!4575 false (index!20526 lt!243803) (x!49495 lt!243803))))))

(assert (=> b!529032 (=> (not res!324946) (not e!308275))))

(assert (=> b!529032 e!308275))

(declare-fun b!529033 () Bool)

(declare-fun res!324951 () Bool)

(declare-fun e!308282 () Bool)

(assert (=> b!529033 (=> res!324951 e!308282)))

(declare-fun lt!243793 () SeekEntryResult!4575)

(assert (=> b!529033 (= res!324951 (not (= lt!243793 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243800 lt!243798 lt!243794 mask!3524))))))

(declare-fun b!529034 () Bool)

(assert (=> b!529034 (= e!308282 true)))

(declare-fun lt!243799 () SeekEntryResult!4575)

(assert (=> b!529034 (= (seekEntryOrOpen!0 lt!243798 lt!243794 mask!3524) lt!243799)))

(declare-fun lt!243804 () Unit!16752)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!33519 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16752)

(assert (=> b!529034 (= lt!243804 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!243800 #b00000000000000000000000000000000 (index!20526 lt!243803) (x!49495 lt!243803) mask!3524))))

(declare-fun b!529035 () Bool)

(declare-fun res!324947 () Bool)

(assert (=> b!529035 (=> (not res!324947) (not e!308276))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529035 (= res!324947 (validKeyInArray!0 (select (arr!16108 a!3235) j!176)))))

(declare-fun res!324948 () Bool)

(assert (=> start!48026 (=> (not res!324948) (not e!308276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48026 (= res!324948 (validMask!0 mask!3524))))

(assert (=> start!48026 e!308276))

(assert (=> start!48026 true))

(declare-fun array_inv!11904 (array!33519) Bool)

(assert (=> start!48026 (array_inv!11904 a!3235)))

(declare-fun b!529036 () Bool)

(declare-fun res!324954 () Bool)

(assert (=> b!529036 (=> (not res!324954) (not e!308276))))

(assert (=> b!529036 (= res!324954 (validKeyInArray!0 k0!2280))))

(declare-fun e!308283 () Bool)

(declare-fun b!529037 () Bool)

(assert (=> b!529037 (= e!308283 (= (seekEntryOrOpen!0 (select (arr!16108 a!3235) j!176) a!3235 mask!3524) (Found!4575 j!176)))))

(declare-fun b!529038 () Bool)

(declare-fun e!308280 () Bool)

(assert (=> b!529038 (= e!308277 (not e!308280))))

(declare-fun res!324955 () Bool)

(assert (=> b!529038 (=> res!324955 e!308280)))

(get-info :version)

(assert (=> b!529038 (= res!324955 (or (= lt!243803 lt!243793) (undefined!5387 lt!243803) (not ((_ is Intermediate!4575) lt!243803))))))

(declare-fun lt!243802 () (_ BitVec 32))

(assert (=> b!529038 (= lt!243793 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243802 lt!243798 lt!243794 mask!3524))))

(assert (=> b!529038 (= lt!243803 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243800 (select (arr!16108 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529038 (= lt!243802 (toIndex!0 lt!243798 mask!3524))))

(assert (=> b!529038 (= lt!243798 (select (store (arr!16108 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!529038 (= lt!243800 (toIndex!0 (select (arr!16108 a!3235) j!176) mask!3524))))

(assert (=> b!529038 (= lt!243794 (array!33520 (store (arr!16108 a!3235) i!1204 k0!2280) (size!16472 a!3235)))))

(assert (=> b!529038 (= lt!243799 (Found!4575 j!176))))

(assert (=> b!529038 e!308283))

(declare-fun res!324949 () Bool)

(assert (=> b!529038 (=> (not res!324949) (not e!308283))))

(assert (=> b!529038 (= res!324949 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243805 () Unit!16752)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33519 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16752)

(assert (=> b!529038 (= lt!243805 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529039 () Bool)

(assert (=> b!529039 (= e!308280 e!308282)))

(declare-fun res!324945 () Bool)

(assert (=> b!529039 (=> res!324945 e!308282)))

(assert (=> b!529039 (= res!324945 (or (bvsgt (x!49495 lt!243803) #b01111111111111111111111111111110) (bvslt lt!243800 #b00000000000000000000000000000000) (bvsge lt!243800 (size!16472 a!3235)) (bvslt (index!20526 lt!243803) #b00000000000000000000000000000000) (bvsge (index!20526 lt!243803) (size!16472 a!3235)) (not (= lt!243803 (Intermediate!4575 false (index!20526 lt!243803) (x!49495 lt!243803))))))))

(assert (=> b!529039 (= (index!20526 lt!243803) i!1204)))

(declare-fun lt!243796 () Unit!16752)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33519 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16752)

(assert (=> b!529039 (= lt!243796 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!243800 #b00000000000000000000000000000000 (index!20526 lt!243803) (x!49495 lt!243803) mask!3524))))

(assert (=> b!529039 (and (or (= (select (arr!16108 a!3235) (index!20526 lt!243803)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16108 a!3235) (index!20526 lt!243803)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16108 a!3235) (index!20526 lt!243803)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16108 a!3235) (index!20526 lt!243803)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243795 () Unit!16752)

(assert (=> b!529039 (= lt!243795 e!308281)))

(declare-fun c!62351 () Bool)

(assert (=> b!529039 (= c!62351 (= (select (arr!16108 a!3235) (index!20526 lt!243803)) (select (arr!16108 a!3235) j!176)))))

(assert (=> b!529039 (and (bvslt (x!49495 lt!243803) #b01111111111111111111111111111110) (or (= (select (arr!16108 a!3235) (index!20526 lt!243803)) (select (arr!16108 a!3235) j!176)) (= (select (arr!16108 a!3235) (index!20526 lt!243803)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16108 a!3235) (index!20526 lt!243803)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!529040 () Bool)

(declare-fun e!308278 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33519 (_ BitVec 32)) SeekEntryResult!4575)

(assert (=> b!529040 (= e!308278 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243800 (index!20526 lt!243803) (select (arr!16108 a!3235) j!176) a!3235 mask!3524) lt!243799)))))

(declare-fun b!529041 () Bool)

(declare-fun res!324952 () Bool)

(assert (=> b!529041 (=> res!324952 e!308282)))

(assert (=> b!529041 (= res!324952 e!308278)))

(declare-fun res!324956 () Bool)

(assert (=> b!529041 (=> (not res!324956) (not e!308278))))

(assert (=> b!529041 (= res!324956 (bvsgt #b00000000000000000000000000000000 (x!49495 lt!243803)))))

(declare-fun b!529042 () Bool)

(declare-fun res!324944 () Bool)

(assert (=> b!529042 (=> (not res!324944) (not e!308276))))

(declare-fun arrayContainsKey!0 (array!33519 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529042 (= res!324944 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529043 () Bool)

(declare-fun Unit!16755 () Unit!16752)

(assert (=> b!529043 (= e!308281 Unit!16755)))

(assert (= (and start!48026 res!324948) b!529030))

(assert (= (and b!529030 res!324942) b!529035))

(assert (= (and b!529035 res!324947) b!529036))

(assert (= (and b!529036 res!324954) b!529042))

(assert (= (and b!529042 res!324944) b!529029))

(assert (= (and b!529029 res!324943) b!529031))

(assert (= (and b!529031 res!324953) b!529027))

(assert (= (and b!529027 res!324950) b!529038))

(assert (= (and b!529038 res!324949) b!529037))

(assert (= (and b!529038 (not res!324955)) b!529039))

(assert (= (and b!529039 c!62351) b!529032))

(assert (= (and b!529039 (not c!62351)) b!529043))

(assert (= (and b!529032 res!324946) b!529028))

(assert (= (and b!529039 (not res!324945)) b!529041))

(assert (= (and b!529041 res!324956) b!529040))

(assert (= (and b!529041 (not res!324952)) b!529033))

(assert (= (and b!529033 (not res!324951)) b!529034))

(declare-fun m!509555 () Bool)

(assert (=> b!529039 m!509555))

(declare-fun m!509557 () Bool)

(assert (=> b!529039 m!509557))

(declare-fun m!509559 () Bool)

(assert (=> b!529039 m!509559))

(declare-fun m!509561 () Bool)

(assert (=> b!529042 m!509561))

(assert (=> b!529035 m!509559))

(assert (=> b!529035 m!509559))

(declare-fun m!509563 () Bool)

(assert (=> b!529035 m!509563))

(declare-fun m!509565 () Bool)

(assert (=> b!529032 m!509565))

(declare-fun m!509567 () Bool)

(assert (=> b!529032 m!509567))

(assert (=> b!529038 m!509559))

(declare-fun m!509569 () Bool)

(assert (=> b!529038 m!509569))

(declare-fun m!509571 () Bool)

(assert (=> b!529038 m!509571))

(declare-fun m!509573 () Bool)

(assert (=> b!529038 m!509573))

(declare-fun m!509575 () Bool)

(assert (=> b!529038 m!509575))

(assert (=> b!529038 m!509559))

(declare-fun m!509577 () Bool)

(assert (=> b!529038 m!509577))

(declare-fun m!509579 () Bool)

(assert (=> b!529038 m!509579))

(assert (=> b!529038 m!509559))

(declare-fun m!509581 () Bool)

(assert (=> b!529038 m!509581))

(declare-fun m!509583 () Bool)

(assert (=> b!529038 m!509583))

(assert (=> b!529040 m!509559))

(assert (=> b!529040 m!509559))

(declare-fun m!509585 () Bool)

(assert (=> b!529040 m!509585))

(declare-fun m!509587 () Bool)

(assert (=> b!529031 m!509587))

(declare-fun m!509589 () Bool)

(assert (=> b!529034 m!509589))

(declare-fun m!509591 () Bool)

(assert (=> b!529034 m!509591))

(declare-fun m!509593 () Bool)

(assert (=> start!48026 m!509593))

(declare-fun m!509595 () Bool)

(assert (=> start!48026 m!509595))

(declare-fun m!509597 () Bool)

(assert (=> b!529036 m!509597))

(declare-fun m!509599 () Bool)

(assert (=> b!529027 m!509599))

(declare-fun m!509601 () Bool)

(assert (=> b!529029 m!509601))

(assert (=> b!529033 m!509567))

(assert (=> b!529037 m!509559))

(assert (=> b!529037 m!509559))

(declare-fun m!509603 () Bool)

(assert (=> b!529037 m!509603))

(check-sat (not b!529042) (not b!529039) (not b!529031) (not b!529035) (not b!529037) (not b!529036) (not b!529029) (not b!529033) (not b!529032) (not b!529027) (not b!529040) (not b!529038) (not b!529034) (not start!48026))
(check-sat)
