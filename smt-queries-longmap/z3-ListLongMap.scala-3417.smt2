; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47426 () Bool)

(assert start!47426)

(declare-fun b!521914 () Bool)

(declare-fun e!304453 () Bool)

(declare-fun e!304452 () Bool)

(assert (=> b!521914 (= e!304453 (not e!304452))))

(declare-fun res!319644 () Bool)

(assert (=> b!521914 (=> res!319644 e!304452)))

(declare-datatypes ((SeekEntryResult!4449 0))(
  ( (MissingZero!4449 (index!19999 (_ BitVec 32))) (Found!4449 (index!20000 (_ BitVec 32))) (Intermediate!4449 (undefined!5261 Bool) (index!20001 (_ BitVec 32)) (x!48979 (_ BitVec 32))) (Undefined!4449) (MissingVacant!4449 (index!20002 (_ BitVec 32))) )
))
(declare-fun lt!239267 () SeekEntryResult!4449)

(declare-fun lt!239270 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33252 0))(
  ( (array!33253 (arr!15982 (Array (_ BitVec 32) (_ BitVec 64))) (size!16346 (_ BitVec 32))) )
))
(declare-fun lt!239272 () array!33252)

(declare-fun lt!239271 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33252 (_ BitVec 32)) SeekEntryResult!4449)

(assert (=> b!521914 (= res!319644 (= lt!239267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239270 lt!239271 lt!239272 mask!3524)))))

(declare-fun a!3235 () array!33252)

(declare-fun lt!239265 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!521914 (= lt!239267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239265 (select (arr!15982 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521914 (= lt!239270 (toIndex!0 lt!239271 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521914 (= lt!239271 (select (store (arr!15982 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!521914 (= lt!239265 (toIndex!0 (select (arr!15982 a!3235) j!176) mask!3524))))

(assert (=> b!521914 (= lt!239272 (array!33253 (store (arr!15982 a!3235) i!1204 k0!2280) (size!16346 a!3235)))))

(declare-fun e!304456 () Bool)

(assert (=> b!521914 e!304456))

(declare-fun res!319650 () Bool)

(assert (=> b!521914 (=> (not res!319650) (not e!304456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33252 (_ BitVec 32)) Bool)

(assert (=> b!521914 (= res!319650 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16248 0))(
  ( (Unit!16249) )
))
(declare-fun lt!239269 () Unit!16248)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33252 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16248)

(assert (=> b!521914 (= lt!239269 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521915 () Bool)

(declare-fun e!304454 () Bool)

(assert (=> b!521915 (= e!304454 false)))

(declare-fun b!521916 () Bool)

(declare-fun res!319655 () Bool)

(declare-fun e!304455 () Bool)

(assert (=> b!521916 (=> (not res!319655) (not e!304455))))

(declare-fun arrayContainsKey!0 (array!33252 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521916 (= res!319655 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!319646 () Bool)

(assert (=> start!47426 (=> (not res!319646) (not e!304455))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47426 (= res!319646 (validMask!0 mask!3524))))

(assert (=> start!47426 e!304455))

(assert (=> start!47426 true))

(declare-fun array_inv!11778 (array!33252) Bool)

(assert (=> start!47426 (array_inv!11778 a!3235)))

(declare-fun b!521917 () Bool)

(declare-fun e!304458 () Unit!16248)

(declare-fun Unit!16250 () Unit!16248)

(assert (=> b!521917 (= e!304458 Unit!16250)))

(declare-fun b!521918 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33252 (_ BitVec 32)) SeekEntryResult!4449)

(assert (=> b!521918 (= e!304456 (= (seekEntryOrOpen!0 (select (arr!15982 a!3235) j!176) a!3235 mask!3524) (Found!4449 j!176)))))

(declare-fun b!521919 () Bool)

(declare-fun res!319653 () Bool)

(assert (=> b!521919 (=> (not res!319653) (not e!304455))))

(assert (=> b!521919 (= res!319653 (and (= (size!16346 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16346 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16346 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521920 () Bool)

(declare-fun res!319654 () Bool)

(assert (=> b!521920 (=> (not res!319654) (not e!304455))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521920 (= res!319654 (validKeyInArray!0 (select (arr!15982 a!3235) j!176)))))

(declare-fun b!521921 () Bool)

(declare-fun Unit!16251 () Unit!16248)

(assert (=> b!521921 (= e!304458 Unit!16251)))

(declare-fun lt!239266 () Unit!16248)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33252 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16248)

(assert (=> b!521921 (= lt!239266 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239265 #b00000000000000000000000000000000 (index!20001 lt!239267) (x!48979 lt!239267) mask!3524))))

(declare-fun res!319652 () Bool)

(assert (=> b!521921 (= res!319652 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239265 lt!239271 lt!239272 mask!3524) (Intermediate!4449 false (index!20001 lt!239267) (x!48979 lt!239267))))))

(assert (=> b!521921 (=> (not res!319652) (not e!304454))))

(assert (=> b!521921 e!304454))

(declare-fun b!521922 () Bool)

(declare-fun res!319645 () Bool)

(assert (=> b!521922 (=> (not res!319645) (not e!304453))))

(assert (=> b!521922 (= res!319645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521923 () Bool)

(assert (=> b!521923 (= e!304455 e!304453)))

(declare-fun res!319647 () Bool)

(assert (=> b!521923 (=> (not res!319647) (not e!304453))))

(declare-fun lt!239264 () SeekEntryResult!4449)

(assert (=> b!521923 (= res!319647 (or (= lt!239264 (MissingZero!4449 i!1204)) (= lt!239264 (MissingVacant!4449 i!1204))))))

(assert (=> b!521923 (= lt!239264 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!521924 () Bool)

(declare-fun res!319648 () Bool)

(assert (=> b!521924 (=> res!319648 e!304452)))

(get-info :version)

(assert (=> b!521924 (= res!319648 (or (undefined!5261 lt!239267) (not ((_ is Intermediate!4449) lt!239267))))))

(declare-fun b!521925 () Bool)

(declare-fun res!319651 () Bool)

(assert (=> b!521925 (=> (not res!319651) (not e!304453))))

(declare-datatypes ((List!10140 0))(
  ( (Nil!10137) (Cons!10136 (h!11058 (_ BitVec 64)) (t!16368 List!10140)) )
))
(declare-fun arrayNoDuplicates!0 (array!33252 (_ BitVec 32) List!10140) Bool)

(assert (=> b!521925 (= res!319651 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10137))))

(declare-fun b!521926 () Bool)

(declare-fun res!319649 () Bool)

(assert (=> b!521926 (=> (not res!319649) (not e!304455))))

(assert (=> b!521926 (= res!319649 (validKeyInArray!0 k0!2280))))

(declare-fun b!521927 () Bool)

(assert (=> b!521927 (= e!304452 true)))

(assert (=> b!521927 (and (or (= (select (arr!15982 a!3235) (index!20001 lt!239267)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15982 a!3235) (index!20001 lt!239267)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15982 a!3235) (index!20001 lt!239267)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15982 a!3235) (index!20001 lt!239267)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239268 () Unit!16248)

(assert (=> b!521927 (= lt!239268 e!304458)))

(declare-fun c!61436 () Bool)

(assert (=> b!521927 (= c!61436 (= (select (arr!15982 a!3235) (index!20001 lt!239267)) (select (arr!15982 a!3235) j!176)))))

(assert (=> b!521927 (and (bvslt (x!48979 lt!239267) #b01111111111111111111111111111110) (or (= (select (arr!15982 a!3235) (index!20001 lt!239267)) (select (arr!15982 a!3235) j!176)) (= (select (arr!15982 a!3235) (index!20001 lt!239267)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15982 a!3235) (index!20001 lt!239267)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!47426 res!319646) b!521919))

(assert (= (and b!521919 res!319653) b!521920))

(assert (= (and b!521920 res!319654) b!521926))

(assert (= (and b!521926 res!319649) b!521916))

(assert (= (and b!521916 res!319655) b!521923))

(assert (= (and b!521923 res!319647) b!521922))

(assert (= (and b!521922 res!319645) b!521925))

(assert (= (and b!521925 res!319651) b!521914))

(assert (= (and b!521914 res!319650) b!521918))

(assert (= (and b!521914 (not res!319644)) b!521924))

(assert (= (and b!521924 (not res!319648)) b!521927))

(assert (= (and b!521927 c!61436) b!521921))

(assert (= (and b!521927 (not c!61436)) b!521917))

(assert (= (and b!521921 res!319652) b!521915))

(declare-fun m!502827 () Bool)

(assert (=> b!521922 m!502827))

(declare-fun m!502829 () Bool)

(assert (=> b!521927 m!502829))

(declare-fun m!502831 () Bool)

(assert (=> b!521927 m!502831))

(declare-fun m!502833 () Bool)

(assert (=> start!47426 m!502833))

(declare-fun m!502835 () Bool)

(assert (=> start!47426 m!502835))

(declare-fun m!502837 () Bool)

(assert (=> b!521926 m!502837))

(declare-fun m!502839 () Bool)

(assert (=> b!521916 m!502839))

(declare-fun m!502841 () Bool)

(assert (=> b!521923 m!502841))

(assert (=> b!521920 m!502831))

(assert (=> b!521920 m!502831))

(declare-fun m!502843 () Bool)

(assert (=> b!521920 m!502843))

(assert (=> b!521918 m!502831))

(assert (=> b!521918 m!502831))

(declare-fun m!502845 () Bool)

(assert (=> b!521918 m!502845))

(declare-fun m!502847 () Bool)

(assert (=> b!521925 m!502847))

(declare-fun m!502849 () Bool)

(assert (=> b!521914 m!502849))

(declare-fun m!502851 () Bool)

(assert (=> b!521914 m!502851))

(declare-fun m!502853 () Bool)

(assert (=> b!521914 m!502853))

(declare-fun m!502855 () Bool)

(assert (=> b!521914 m!502855))

(assert (=> b!521914 m!502831))

(declare-fun m!502857 () Bool)

(assert (=> b!521914 m!502857))

(assert (=> b!521914 m!502831))

(declare-fun m!502859 () Bool)

(assert (=> b!521914 m!502859))

(declare-fun m!502861 () Bool)

(assert (=> b!521914 m!502861))

(assert (=> b!521914 m!502831))

(declare-fun m!502863 () Bool)

(assert (=> b!521914 m!502863))

(declare-fun m!502865 () Bool)

(assert (=> b!521921 m!502865))

(declare-fun m!502867 () Bool)

(assert (=> b!521921 m!502867))

(check-sat (not b!521925) (not b!521918) (not b!521926) (not b!521921) (not b!521916) (not b!521914) (not start!47426) (not b!521922) (not b!521920) (not b!521923))
(check-sat)
