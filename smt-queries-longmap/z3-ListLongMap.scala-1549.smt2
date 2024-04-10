; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29322 () Bool)

(assert start!29322)

(declare-fun b!297094 () Bool)

(declare-fun e!187764 () Bool)

(declare-fun e!187763 () Bool)

(assert (=> b!297094 (= e!187764 e!187763)))

(declare-fun res!156623 () Bool)

(assert (=> b!297094 (=> (not res!156623) (not e!187763))))

(declare-fun lt!147591 () Bool)

(assert (=> b!297094 (= res!156623 lt!147591)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!15035 0))(
  ( (array!15036 (arr!7125 (Array (_ BitVec 32) (_ BitVec 64))) (size!7477 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15035)

(declare-fun lt!147590 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2274 0))(
  ( (MissingZero!2274 (index!11266 (_ BitVec 32))) (Found!2274 (index!11267 (_ BitVec 32))) (Intermediate!2274 (undefined!3086 Bool) (index!11268 (_ BitVec 32)) (x!29482 (_ BitVec 32))) (Undefined!2274) (MissingVacant!2274 (index!11269 (_ BitVec 32))) )
))
(declare-fun lt!147592 () SeekEntryResult!2274)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15035 (_ BitVec 32)) SeekEntryResult!2274)

(assert (=> b!297094 (= lt!147592 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147590 k0!2524 (array!15036 (store (arr!7125 a!3312) i!1256 k0!2524) (size!7477 a!3312)) mask!3809))))

(declare-fun lt!147594 () SeekEntryResult!2274)

(assert (=> b!297094 (= lt!147594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147590 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297094 (= lt!147590 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!297095 () Bool)

(declare-fun e!187765 () Bool)

(assert (=> b!297095 (= e!187765 (not (and (bvsge (index!11268 lt!147594) #b00000000000000000000000000000000) (bvslt (index!11268 lt!147594) (size!7477 a!3312)))))))

(assert (=> b!297095 (= lt!147592 lt!147594)))

(declare-datatypes ((Unit!9246 0))(
  ( (Unit!9247) )
))
(declare-fun lt!147589 () Unit!9246)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15035 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9246)

(assert (=> b!297095 (= lt!147589 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!147590 (index!11268 lt!147594) (x!29482 lt!147594) mask!3809))))

(assert (=> b!297095 (and (= (select (arr!7125 a!3312) (index!11268 lt!147594)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11268 lt!147594) i!1256))))

(declare-fun b!297096 () Bool)

(declare-fun e!187761 () Bool)

(assert (=> b!297096 (= e!187761 e!187764)))

(declare-fun res!156626 () Bool)

(assert (=> b!297096 (=> (not res!156626) (not e!187764))))

(declare-fun lt!147593 () SeekEntryResult!2274)

(assert (=> b!297096 (= res!156626 (or lt!147591 (= lt!147593 (MissingVacant!2274 i!1256))))))

(assert (=> b!297096 (= lt!147591 (= lt!147593 (MissingZero!2274 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15035 (_ BitVec 32)) SeekEntryResult!2274)

(assert (=> b!297096 (= lt!147593 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!297097 () Bool)

(assert (=> b!297097 (= e!187763 e!187765)))

(declare-fun res!156624 () Bool)

(assert (=> b!297097 (=> (not res!156624) (not e!187765))))

(declare-fun lt!147588 () Bool)

(assert (=> b!297097 (= res!156624 (and (or lt!147588 (not (undefined!3086 lt!147594))) (or lt!147588 (not (= (select (arr!7125 a!3312) (index!11268 lt!147594)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147588 (not (= (select (arr!7125 a!3312) (index!11268 lt!147594)) k0!2524))) (not lt!147588)))))

(get-info :version)

(assert (=> b!297097 (= lt!147588 (not ((_ is Intermediate!2274) lt!147594)))))

(declare-fun b!297098 () Bool)

(declare-fun res!156621 () Bool)

(assert (=> b!297098 (=> (not res!156621) (not e!187761))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297098 (= res!156621 (validKeyInArray!0 k0!2524))))

(declare-fun res!156627 () Bool)

(assert (=> start!29322 (=> (not res!156627) (not e!187761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29322 (= res!156627 (validMask!0 mask!3809))))

(assert (=> start!29322 e!187761))

(assert (=> start!29322 true))

(declare-fun array_inv!5088 (array!15035) Bool)

(assert (=> start!29322 (array_inv!5088 a!3312)))

(declare-fun b!297099 () Bool)

(declare-fun res!156625 () Bool)

(assert (=> b!297099 (=> (not res!156625) (not e!187764))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15035 (_ BitVec 32)) Bool)

(assert (=> b!297099 (= res!156625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297100 () Bool)

(declare-fun res!156620 () Bool)

(assert (=> b!297100 (=> (not res!156620) (not e!187761))))

(assert (=> b!297100 (= res!156620 (and (= (size!7477 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7477 a!3312))))))

(declare-fun b!297101 () Bool)

(declare-fun res!156622 () Bool)

(assert (=> b!297101 (=> (not res!156622) (not e!187761))))

(declare-fun arrayContainsKey!0 (array!15035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297101 (= res!156622 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29322 res!156627) b!297100))

(assert (= (and b!297100 res!156620) b!297098))

(assert (= (and b!297098 res!156621) b!297101))

(assert (= (and b!297101 res!156622) b!297096))

(assert (= (and b!297096 res!156626) b!297099))

(assert (= (and b!297099 res!156625) b!297094))

(assert (= (and b!297094 res!156623) b!297097))

(assert (= (and b!297097 res!156624) b!297095))

(declare-fun m!309915 () Bool)

(assert (=> b!297095 m!309915))

(declare-fun m!309917 () Bool)

(assert (=> b!297095 m!309917))

(declare-fun m!309919 () Bool)

(assert (=> b!297094 m!309919))

(declare-fun m!309921 () Bool)

(assert (=> b!297094 m!309921))

(declare-fun m!309923 () Bool)

(assert (=> b!297094 m!309923))

(declare-fun m!309925 () Bool)

(assert (=> b!297094 m!309925))

(declare-fun m!309927 () Bool)

(assert (=> start!29322 m!309927))

(declare-fun m!309929 () Bool)

(assert (=> start!29322 m!309929))

(declare-fun m!309931 () Bool)

(assert (=> b!297096 m!309931))

(declare-fun m!309933 () Bool)

(assert (=> b!297098 m!309933))

(declare-fun m!309935 () Bool)

(assert (=> b!297101 m!309935))

(declare-fun m!309937 () Bool)

(assert (=> b!297099 m!309937))

(assert (=> b!297097 m!309917))

(check-sat (not start!29322) (not b!297101) (not b!297098) (not b!297096) (not b!297099) (not b!297094) (not b!297095))
(check-sat)
