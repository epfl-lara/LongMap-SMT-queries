; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29170 () Bool)

(assert start!29170)

(declare-fun b!296127 () Bool)

(declare-fun e!187158 () Bool)

(declare-fun e!187159 () Bool)

(assert (=> b!296127 (= e!187158 e!187159)))

(declare-fun res!155904 () Bool)

(assert (=> b!296127 (=> (not res!155904) (not e!187159))))

(declare-datatypes ((SeekEntryResult!2213 0))(
  ( (MissingZero!2213 (index!11022 (_ BitVec 32))) (Found!2213 (index!11023 (_ BitVec 32))) (Intermediate!2213 (undefined!3025 Bool) (index!11024 (_ BitVec 32)) (x!29346 (_ BitVec 32))) (Undefined!2213) (MissingVacant!2213 (index!11025 (_ BitVec 32))) )
))
(declare-fun lt!147000 () SeekEntryResult!2213)

(declare-datatypes ((array!14976 0))(
  ( (array!14977 (arr!7099 (Array (_ BitVec 32) (_ BitVec 64))) (size!7451 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14976)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun lt!146998 () Bool)

(assert (=> b!296127 (= res!155904 (and (or lt!146998 (not (undefined!3025 lt!147000))) (or lt!146998 (not (= (select (arr!7099 a!3312) (index!11024 lt!147000)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146998 (not (= (select (arr!7099 a!3312) (index!11024 lt!147000)) k0!2524))) (not lt!146998)))))

(get-info :version)

(assert (=> b!296127 (= lt!146998 (not ((_ is Intermediate!2213) lt!147000)))))

(declare-fun b!296128 () Bool)

(declare-fun res!155902 () Bool)

(declare-fun e!187156 () Bool)

(assert (=> b!296128 (=> (not res!155902) (not e!187156))))

(declare-fun arrayContainsKey!0 (array!14976 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296128 (= res!155902 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!155899 () Bool)

(assert (=> start!29170 (=> (not res!155899) (not e!187156))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29170 (= res!155899 (validMask!0 mask!3809))))

(assert (=> start!29170 e!187156))

(assert (=> start!29170 true))

(declare-fun array_inv!5049 (array!14976) Bool)

(assert (=> start!29170 (array_inv!5049 a!3312)))

(declare-fun b!296129 () Bool)

(declare-fun res!155903 () Bool)

(assert (=> b!296129 (=> (not res!155903) (not e!187156))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!296129 (= res!155903 (and (= (size!7451 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7451 a!3312))))))

(declare-fun b!296130 () Bool)

(declare-fun res!155901 () Bool)

(declare-fun e!187160 () Bool)

(assert (=> b!296130 (=> (not res!155901) (not e!187160))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14976 (_ BitVec 32)) Bool)

(assert (=> b!296130 (= res!155901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296131 () Bool)

(assert (=> b!296131 (= e!187156 e!187160)))

(declare-fun res!155900 () Bool)

(assert (=> b!296131 (=> (not res!155900) (not e!187160))))

(declare-fun lt!147003 () SeekEntryResult!2213)

(declare-fun lt!147001 () Bool)

(assert (=> b!296131 (= res!155900 (or lt!147001 (= lt!147003 (MissingVacant!2213 i!1256))))))

(assert (=> b!296131 (= lt!147001 (= lt!147003 (MissingZero!2213 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14976 (_ BitVec 32)) SeekEntryResult!2213)

(assert (=> b!296131 (= lt!147003 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!296132 () Bool)

(assert (=> b!296132 (= e!187160 e!187158)))

(declare-fun res!155897 () Bool)

(assert (=> b!296132 (=> (not res!155897) (not e!187158))))

(assert (=> b!296132 (= res!155897 lt!147001)))

(declare-fun lt!146999 () (_ BitVec 32))

(declare-fun lt!147002 () SeekEntryResult!2213)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14976 (_ BitVec 32)) SeekEntryResult!2213)

(assert (=> b!296132 (= lt!147002 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146999 k0!2524 (array!14977 (store (arr!7099 a!3312) i!1256 k0!2524) (size!7451 a!3312)) mask!3809))))

(assert (=> b!296132 (= lt!147000 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146999 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296132 (= lt!146999 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!296133 () Bool)

(assert (=> b!296133 (= e!187159 (not (= lt!147000 (Intermediate!2213 false (index!11024 lt!147000) (x!29346 lt!147000)))))))

(assert (=> b!296133 (and (= (select (arr!7099 a!3312) (index!11024 lt!147000)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11024 lt!147000) i!1256))))

(declare-fun b!296134 () Bool)

(declare-fun res!155898 () Bool)

(assert (=> b!296134 (=> (not res!155898) (not e!187156))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296134 (= res!155898 (validKeyInArray!0 k0!2524))))

(assert (= (and start!29170 res!155899) b!296129))

(assert (= (and b!296129 res!155903) b!296134))

(assert (= (and b!296134 res!155898) b!296128))

(assert (= (and b!296128 res!155902) b!296131))

(assert (= (and b!296131 res!155900) b!296130))

(assert (= (and b!296130 res!155901) b!296132))

(assert (= (and b!296132 res!155897) b!296127))

(assert (= (and b!296127 res!155904) b!296133))

(declare-fun m!309347 () Bool)

(assert (=> b!296134 m!309347))

(declare-fun m!309349 () Bool)

(assert (=> b!296128 m!309349))

(declare-fun m!309351 () Bool)

(assert (=> b!296133 m!309351))

(declare-fun m!309353 () Bool)

(assert (=> b!296130 m!309353))

(declare-fun m!309355 () Bool)

(assert (=> b!296132 m!309355))

(declare-fun m!309357 () Bool)

(assert (=> b!296132 m!309357))

(declare-fun m!309359 () Bool)

(assert (=> b!296132 m!309359))

(declare-fun m!309361 () Bool)

(assert (=> b!296132 m!309361))

(assert (=> b!296127 m!309351))

(declare-fun m!309363 () Bool)

(assert (=> start!29170 m!309363))

(declare-fun m!309365 () Bool)

(assert (=> start!29170 m!309365))

(declare-fun m!309367 () Bool)

(assert (=> b!296131 m!309367))

(check-sat (not b!296130) (not b!296134) (not b!296128) (not b!296131) (not start!29170) (not b!296132))
(check-sat)
