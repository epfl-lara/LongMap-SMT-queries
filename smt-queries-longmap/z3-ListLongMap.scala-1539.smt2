; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29166 () Bool)

(assert start!29166)

(declare-fun res!155754 () Bool)

(declare-fun e!187049 () Bool)

(assert (=> start!29166 (=> (not res!155754) (not e!187049))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29166 (= res!155754 (validMask!0 mask!3809))))

(assert (=> start!29166 e!187049))

(assert (=> start!29166 true))

(declare-datatypes ((array!14969 0))(
  ( (array!14970 (arr!7095 (Array (_ BitVec 32) (_ BitVec 64))) (size!7447 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14969)

(declare-fun array_inv!5058 (array!14969) Bool)

(assert (=> start!29166 (array_inv!5058 a!3312)))

(declare-fun b!295942 () Bool)

(declare-fun res!155757 () Bool)

(assert (=> b!295942 (=> (not res!155757) (not e!187049))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295942 (= res!155757 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295943 () Bool)

(declare-fun res!155756 () Bool)

(assert (=> b!295943 (=> (not res!155756) (not e!187049))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!295943 (= res!155756 (and (= (size!7447 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7447 a!3312))))))

(declare-fun b!295944 () Bool)

(declare-fun e!187048 () Bool)

(declare-fun e!187047 () Bool)

(assert (=> b!295944 (= e!187048 e!187047)))

(declare-fun res!155753 () Bool)

(assert (=> b!295944 (=> (not res!155753) (not e!187047))))

(declare-fun lt!146847 () Bool)

(declare-datatypes ((SeekEntryResult!2244 0))(
  ( (MissingZero!2244 (index!11146 (_ BitVec 32))) (Found!2244 (index!11147 (_ BitVec 32))) (Intermediate!2244 (undefined!3056 Bool) (index!11148 (_ BitVec 32)) (x!29360 (_ BitVec 32))) (Undefined!2244) (MissingVacant!2244 (index!11149 (_ BitVec 32))) )
))
(declare-fun lt!146845 () SeekEntryResult!2244)

(assert (=> b!295944 (= res!155753 (and (or lt!146847 (not (undefined!3056 lt!146845))) (or lt!146847 (not (= (select (arr!7095 a!3312) (index!11148 lt!146845)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146847 (not (= (select (arr!7095 a!3312) (index!11148 lt!146845)) k0!2524))) (not lt!146847)))))

(get-info :version)

(assert (=> b!295944 (= lt!146847 (not ((_ is Intermediate!2244) lt!146845)))))

(declare-fun b!295945 () Bool)

(declare-fun res!155752 () Bool)

(assert (=> b!295945 (=> (not res!155752) (not e!187049))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295945 (= res!155752 (validKeyInArray!0 k0!2524))))

(declare-fun b!295946 () Bool)

(assert (=> b!295946 (= e!187047 (not true))))

(assert (=> b!295946 (and (= (select (arr!7095 a!3312) (index!11148 lt!146845)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11148 lt!146845) i!1256))))

(declare-fun b!295947 () Bool)

(declare-fun e!187050 () Bool)

(assert (=> b!295947 (= e!187050 e!187048)))

(declare-fun res!155755 () Bool)

(assert (=> b!295947 (=> (not res!155755) (not e!187048))))

(declare-fun lt!146842 () Bool)

(assert (=> b!295947 (= res!155755 lt!146842)))

(declare-fun lt!146844 () SeekEntryResult!2244)

(declare-fun lt!146846 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14969 (_ BitVec 32)) SeekEntryResult!2244)

(assert (=> b!295947 (= lt!146844 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146846 k0!2524 (array!14970 (store (arr!7095 a!3312) i!1256 k0!2524) (size!7447 a!3312)) mask!3809))))

(assert (=> b!295947 (= lt!146845 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146846 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295947 (= lt!146846 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!295948 () Bool)

(assert (=> b!295948 (= e!187049 e!187050)))

(declare-fun res!155750 () Bool)

(assert (=> b!295948 (=> (not res!155750) (not e!187050))))

(declare-fun lt!146843 () SeekEntryResult!2244)

(assert (=> b!295948 (= res!155750 (or lt!146842 (= lt!146843 (MissingVacant!2244 i!1256))))))

(assert (=> b!295948 (= lt!146842 (= lt!146843 (MissingZero!2244 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14969 (_ BitVec 32)) SeekEntryResult!2244)

(assert (=> b!295948 (= lt!146843 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!295949 () Bool)

(declare-fun res!155751 () Bool)

(assert (=> b!295949 (=> (not res!155751) (not e!187050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14969 (_ BitVec 32)) Bool)

(assert (=> b!295949 (= res!155751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29166 res!155754) b!295943))

(assert (= (and b!295943 res!155756) b!295945))

(assert (= (and b!295945 res!155752) b!295942))

(assert (= (and b!295942 res!155757) b!295948))

(assert (= (and b!295948 res!155750) b!295949))

(assert (= (and b!295949 res!155751) b!295947))

(assert (= (and b!295947 res!155755) b!295944))

(assert (= (and b!295944 res!155753) b!295946))

(declare-fun m!309007 () Bool)

(assert (=> b!295944 m!309007))

(assert (=> b!295946 m!309007))

(declare-fun m!309009 () Bool)

(assert (=> b!295947 m!309009))

(declare-fun m!309011 () Bool)

(assert (=> b!295947 m!309011))

(declare-fun m!309013 () Bool)

(assert (=> b!295947 m!309013))

(declare-fun m!309015 () Bool)

(assert (=> b!295947 m!309015))

(declare-fun m!309017 () Bool)

(assert (=> b!295949 m!309017))

(declare-fun m!309019 () Bool)

(assert (=> b!295942 m!309019))

(declare-fun m!309021 () Bool)

(assert (=> b!295945 m!309021))

(declare-fun m!309023 () Bool)

(assert (=> b!295948 m!309023))

(declare-fun m!309025 () Bool)

(assert (=> start!29166 m!309025))

(declare-fun m!309027 () Bool)

(assert (=> start!29166 m!309027))

(check-sat (not start!29166) (not b!295945) (not b!295949) (not b!295942) (not b!295948) (not b!295947))
(check-sat)
