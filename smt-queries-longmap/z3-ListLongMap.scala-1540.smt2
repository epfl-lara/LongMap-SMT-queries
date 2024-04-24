; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29164 () Bool)

(assert start!29164)

(declare-fun b!296055 () Bool)

(declare-fun res!155827 () Bool)

(declare-fun e!187113 () Bool)

(assert (=> b!296055 (=> (not res!155827) (not e!187113))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14970 0))(
  ( (array!14971 (arr!7096 (Array (_ BitVec 32) (_ BitVec 64))) (size!7448 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14970)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!296055 (= res!155827 (and (= (size!7448 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7448 a!3312))))))

(declare-fun b!296056 () Bool)

(declare-fun e!187115 () Bool)

(assert (=> b!296056 (= e!187115 (not true))))

(declare-datatypes ((SeekEntryResult!2210 0))(
  ( (MissingZero!2210 (index!11010 (_ BitVec 32))) (Found!2210 (index!11011 (_ BitVec 32))) (Intermediate!2210 (undefined!3022 Bool) (index!11012 (_ BitVec 32)) (x!29335 (_ BitVec 32))) (Undefined!2210) (MissingVacant!2210 (index!11013 (_ BitVec 32))) )
))
(declare-fun lt!146948 () SeekEntryResult!2210)

(assert (=> b!296056 (and (= (select (arr!7096 a!3312) (index!11012 lt!146948)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11012 lt!146948) i!1256))))

(declare-fun b!296057 () Bool)

(declare-fun e!187112 () Bool)

(assert (=> b!296057 (= e!187112 e!187115)))

(declare-fun res!155826 () Bool)

(assert (=> b!296057 (=> (not res!155826) (not e!187115))))

(declare-fun lt!146945 () Bool)

(declare-fun k0!2524 () (_ BitVec 64))

(assert (=> b!296057 (= res!155826 (and (or lt!146945 (not (undefined!3022 lt!146948))) (or lt!146945 (not (= (select (arr!7096 a!3312) (index!11012 lt!146948)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146945 (not (= (select (arr!7096 a!3312) (index!11012 lt!146948)) k0!2524))) (not lt!146945)))))

(get-info :version)

(assert (=> b!296057 (= lt!146945 (not ((_ is Intermediate!2210) lt!146948)))))

(declare-fun b!296058 () Bool)

(declare-fun e!187114 () Bool)

(assert (=> b!296058 (= e!187114 e!187112)))

(declare-fun res!155830 () Bool)

(assert (=> b!296058 (=> (not res!155830) (not e!187112))))

(declare-fun lt!146947 () Bool)

(assert (=> b!296058 (= res!155830 lt!146947)))

(declare-fun lt!146946 () SeekEntryResult!2210)

(declare-fun lt!146949 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14970 (_ BitVec 32)) SeekEntryResult!2210)

(assert (=> b!296058 (= lt!146946 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146949 k0!2524 (array!14971 (store (arr!7096 a!3312) i!1256 k0!2524) (size!7448 a!3312)) mask!3809))))

(assert (=> b!296058 (= lt!146948 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146949 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296058 (= lt!146949 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!296059 () Bool)

(declare-fun res!155825 () Bool)

(assert (=> b!296059 (=> (not res!155825) (not e!187113))))

(declare-fun arrayContainsKey!0 (array!14970 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296059 (= res!155825 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!155828 () Bool)

(assert (=> start!29164 (=> (not res!155828) (not e!187113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29164 (= res!155828 (validMask!0 mask!3809))))

(assert (=> start!29164 e!187113))

(assert (=> start!29164 true))

(declare-fun array_inv!5046 (array!14970) Bool)

(assert (=> start!29164 (array_inv!5046 a!3312)))

(declare-fun b!296060 () Bool)

(declare-fun res!155829 () Bool)

(assert (=> b!296060 (=> (not res!155829) (not e!187113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296060 (= res!155829 (validKeyInArray!0 k0!2524))))

(declare-fun b!296061 () Bool)

(declare-fun res!155831 () Bool)

(assert (=> b!296061 (=> (not res!155831) (not e!187114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14970 (_ BitVec 32)) Bool)

(assert (=> b!296061 (= res!155831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296062 () Bool)

(assert (=> b!296062 (= e!187113 e!187114)))

(declare-fun res!155832 () Bool)

(assert (=> b!296062 (=> (not res!155832) (not e!187114))))

(declare-fun lt!146944 () SeekEntryResult!2210)

(assert (=> b!296062 (= res!155832 (or lt!146947 (= lt!146944 (MissingVacant!2210 i!1256))))))

(assert (=> b!296062 (= lt!146947 (= lt!146944 (MissingZero!2210 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14970 (_ BitVec 32)) SeekEntryResult!2210)

(assert (=> b!296062 (= lt!146944 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!29164 res!155828) b!296055))

(assert (= (and b!296055 res!155827) b!296060))

(assert (= (and b!296060 res!155829) b!296059))

(assert (= (and b!296059 res!155825) b!296062))

(assert (= (and b!296062 res!155832) b!296061))

(assert (= (and b!296061 res!155831) b!296058))

(assert (= (and b!296058 res!155830) b!296057))

(assert (= (and b!296057 res!155826) b!296056))

(declare-fun m!309281 () Bool)

(assert (=> b!296061 m!309281))

(declare-fun m!309283 () Bool)

(assert (=> b!296057 m!309283))

(declare-fun m!309285 () Bool)

(assert (=> b!296060 m!309285))

(declare-fun m!309287 () Bool)

(assert (=> b!296058 m!309287))

(declare-fun m!309289 () Bool)

(assert (=> b!296058 m!309289))

(declare-fun m!309291 () Bool)

(assert (=> b!296058 m!309291))

(declare-fun m!309293 () Bool)

(assert (=> b!296058 m!309293))

(declare-fun m!309295 () Bool)

(assert (=> b!296062 m!309295))

(assert (=> b!296056 m!309283))

(declare-fun m!309297 () Bool)

(assert (=> start!29164 m!309297))

(declare-fun m!309299 () Bool)

(assert (=> start!29164 m!309299))

(declare-fun m!309301 () Bool)

(assert (=> b!296059 m!309301))

(check-sat (not b!296058) (not b!296060) (not start!29164) (not b!296061) (not b!296062) (not b!296059))
(check-sat)
