; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29022 () Bool)

(assert start!29022)

(declare-fun b!294942 () Bool)

(declare-fun e!186432 () Bool)

(declare-fun e!186431 () Bool)

(assert (=> b!294942 (= e!186432 e!186431)))

(declare-fun res!155032 () Bool)

(assert (=> b!294942 (=> (not res!155032) (not e!186431))))

(declare-datatypes ((SeekEntryResult!2220 0))(
  ( (MissingZero!2220 (index!11050 (_ BitVec 32))) (Found!2220 (index!11051 (_ BitVec 32))) (Intermediate!2220 (undefined!3032 Bool) (index!11052 (_ BitVec 32)) (x!29260 (_ BitVec 32))) (Undefined!2220) (MissingVacant!2220 (index!11053 (_ BitVec 32))) )
))
(declare-fun lt!146226 () SeekEntryResult!2220)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!146224 () Bool)

(assert (=> b!294942 (= res!155032 (or lt!146224 (= lt!146226 (MissingVacant!2220 i!1256))))))

(assert (=> b!294942 (= lt!146224 (= lt!146226 (MissingZero!2220 i!1256)))))

(declare-datatypes ((array!14915 0))(
  ( (array!14916 (arr!7071 (Array (_ BitVec 32) (_ BitVec 64))) (size!7423 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14915)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14915 (_ BitVec 32)) SeekEntryResult!2220)

(assert (=> b!294942 (= lt!146226 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!294943 () Bool)

(declare-fun res!155037 () Bool)

(assert (=> b!294943 (=> (not res!155037) (not e!186431))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14915 (_ BitVec 32)) Bool)

(assert (=> b!294943 (= res!155037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!294944 () Bool)

(declare-fun res!155036 () Bool)

(assert (=> b!294944 (=> (not res!155036) (not e!186432))))

(declare-fun arrayContainsKey!0 (array!14915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!294944 (= res!155036 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun lt!146222 () SeekEntryResult!2220)

(declare-fun b!294945 () Bool)

(get-info :version)

(assert (=> b!294945 (= e!186431 (and lt!146224 (let ((bdg!6247 (not ((_ is Intermediate!2220) lt!146222)))) (and (or bdg!6247 (not (undefined!3032 lt!146222))) (or bdg!6247 (not (= (select (arr!7071 a!3312) (index!11052 lt!146222)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or bdg!6247 (not (= (select (arr!7071 a!3312) (index!11052 lt!146222)) k0!2524))) (not bdg!6247) (not (= (select (arr!7071 a!3312) (index!11052 lt!146222)) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!146223 () (_ BitVec 32))

(declare-fun lt!146225 () SeekEntryResult!2220)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14915 (_ BitVec 32)) SeekEntryResult!2220)

(assert (=> b!294945 (= lt!146225 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146223 k0!2524 (array!14916 (store (arr!7071 a!3312) i!1256 k0!2524) (size!7423 a!3312)) mask!3809))))

(assert (=> b!294945 (= lt!146222 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146223 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294945 (= lt!146223 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!294947 () Bool)

(declare-fun res!155034 () Bool)

(assert (=> b!294947 (=> (not res!155034) (not e!186432))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!294947 (= res!155034 (validKeyInArray!0 k0!2524))))

(declare-fun b!294946 () Bool)

(declare-fun res!155033 () Bool)

(assert (=> b!294946 (=> (not res!155033) (not e!186432))))

(assert (=> b!294946 (= res!155033 (and (= (size!7423 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7423 a!3312))))))

(declare-fun res!155035 () Bool)

(assert (=> start!29022 (=> (not res!155035) (not e!186432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29022 (= res!155035 (validMask!0 mask!3809))))

(assert (=> start!29022 e!186432))

(assert (=> start!29022 true))

(declare-fun array_inv!5034 (array!14915) Bool)

(assert (=> start!29022 (array_inv!5034 a!3312)))

(assert (= (and start!29022 res!155035) b!294946))

(assert (= (and b!294946 res!155033) b!294947))

(assert (= (and b!294947 res!155034) b!294944))

(assert (= (and b!294944 res!155036) b!294942))

(assert (= (and b!294942 res!155032) b!294943))

(assert (= (and b!294943 res!155037) b!294945))

(declare-fun m!308239 () Bool)

(assert (=> b!294942 m!308239))

(declare-fun m!308241 () Bool)

(assert (=> b!294945 m!308241))

(declare-fun m!308243 () Bool)

(assert (=> b!294945 m!308243))

(declare-fun m!308245 () Bool)

(assert (=> b!294945 m!308245))

(declare-fun m!308247 () Bool)

(assert (=> b!294945 m!308247))

(declare-fun m!308249 () Bool)

(assert (=> b!294945 m!308249))

(declare-fun m!308251 () Bool)

(assert (=> start!29022 m!308251))

(declare-fun m!308253 () Bool)

(assert (=> start!29022 m!308253))

(declare-fun m!308255 () Bool)

(assert (=> b!294944 m!308255))

(declare-fun m!308257 () Bool)

(assert (=> b!294943 m!308257))

(declare-fun m!308259 () Bool)

(assert (=> b!294947 m!308259))

(check-sat (not b!294943) (not b!294945) (not b!294947) (not b!294942) (not b!294944) (not start!29022))
(check-sat)
(get-model)

(declare-fun b!294974 () Bool)

(declare-fun e!186451 () Bool)

(declare-fun e!186449 () Bool)

(assert (=> b!294974 (= e!186451 e!186449)))

(declare-fun lt!146248 () (_ BitVec 64))

(assert (=> b!294974 (= lt!146248 (select (arr!7071 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9214 0))(
  ( (Unit!9215) )
))
(declare-fun lt!146250 () Unit!9214)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14915 (_ BitVec 64) (_ BitVec 32)) Unit!9214)

(assert (=> b!294974 (= lt!146250 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!146248 #b00000000000000000000000000000000))))

(assert (=> b!294974 (arrayContainsKey!0 a!3312 lt!146248 #b00000000000000000000000000000000)))

(declare-fun lt!146249 () Unit!9214)

(assert (=> b!294974 (= lt!146249 lt!146250)))

(declare-fun res!155061 () Bool)

(assert (=> b!294974 (= res!155061 (= (seekEntryOrOpen!0 (select (arr!7071 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2220 #b00000000000000000000000000000000)))))

(assert (=> b!294974 (=> (not res!155061) (not e!186449))))

(declare-fun bm!25717 () Bool)

(declare-fun call!25720 () Bool)

(assert (=> bm!25717 (= call!25720 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!294975 () Bool)

(declare-fun e!186450 () Bool)

(assert (=> b!294975 (= e!186450 e!186451)))

(declare-fun c!47532 () Bool)

(assert (=> b!294975 (= c!47532 (validKeyInArray!0 (select (arr!7071 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!66907 () Bool)

(declare-fun res!155060 () Bool)

(assert (=> d!66907 (=> res!155060 e!186450)))

(assert (=> d!66907 (= res!155060 (bvsge #b00000000000000000000000000000000 (size!7423 a!3312)))))

(assert (=> d!66907 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!186450)))

(declare-fun b!294976 () Bool)

(assert (=> b!294976 (= e!186451 call!25720)))

(declare-fun b!294977 () Bool)

(assert (=> b!294977 (= e!186449 call!25720)))

(assert (= (and d!66907 (not res!155060)) b!294975))

(assert (= (and b!294975 c!47532) b!294974))

(assert (= (and b!294975 (not c!47532)) b!294976))

(assert (= (and b!294974 res!155061) b!294977))

(assert (= (or b!294977 b!294976) bm!25717))

(declare-fun m!308283 () Bool)

(assert (=> b!294974 m!308283))

(declare-fun m!308285 () Bool)

(assert (=> b!294974 m!308285))

(declare-fun m!308287 () Bool)

(assert (=> b!294974 m!308287))

(assert (=> b!294974 m!308283))

(declare-fun m!308289 () Bool)

(assert (=> b!294974 m!308289))

(declare-fun m!308291 () Bool)

(assert (=> bm!25717 m!308291))

(assert (=> b!294975 m!308283))

(assert (=> b!294975 m!308283))

(declare-fun m!308293 () Bool)

(assert (=> b!294975 m!308293))

(assert (=> b!294943 d!66907))

(declare-fun d!66911 () Bool)

(assert (=> d!66911 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!294947 d!66911))

(declare-fun b!295020 () Bool)

(declare-fun e!186477 () SeekEntryResult!2220)

(declare-fun e!186476 () SeekEntryResult!2220)

(assert (=> b!295020 (= e!186477 e!186476)))

(declare-fun lt!146275 () (_ BitVec 64))

(declare-fun lt!146276 () SeekEntryResult!2220)

(assert (=> b!295020 (= lt!146275 (select (arr!7071 a!3312) (index!11052 lt!146276)))))

(declare-fun c!47553 () Bool)

(assert (=> b!295020 (= c!47553 (= lt!146275 k0!2524))))

(declare-fun d!66913 () Bool)

(declare-fun lt!146277 () SeekEntryResult!2220)

(assert (=> d!66913 (and (or ((_ is Undefined!2220) lt!146277) (not ((_ is Found!2220) lt!146277)) (and (bvsge (index!11051 lt!146277) #b00000000000000000000000000000000) (bvslt (index!11051 lt!146277) (size!7423 a!3312)))) (or ((_ is Undefined!2220) lt!146277) ((_ is Found!2220) lt!146277) (not ((_ is MissingZero!2220) lt!146277)) (and (bvsge (index!11050 lt!146277) #b00000000000000000000000000000000) (bvslt (index!11050 lt!146277) (size!7423 a!3312)))) (or ((_ is Undefined!2220) lt!146277) ((_ is Found!2220) lt!146277) ((_ is MissingZero!2220) lt!146277) (not ((_ is MissingVacant!2220) lt!146277)) (and (bvsge (index!11053 lt!146277) #b00000000000000000000000000000000) (bvslt (index!11053 lt!146277) (size!7423 a!3312)))) (or ((_ is Undefined!2220) lt!146277) (ite ((_ is Found!2220) lt!146277) (= (select (arr!7071 a!3312) (index!11051 lt!146277)) k0!2524) (ite ((_ is MissingZero!2220) lt!146277) (= (select (arr!7071 a!3312) (index!11050 lt!146277)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2220) lt!146277) (= (select (arr!7071 a!3312) (index!11053 lt!146277)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66913 (= lt!146277 e!186477)))

(declare-fun c!47552 () Bool)

(assert (=> d!66913 (= c!47552 (and ((_ is Intermediate!2220) lt!146276) (undefined!3032 lt!146276)))))

(assert (=> d!66913 (= lt!146276 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66913 (validMask!0 mask!3809)))

(assert (=> d!66913 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!146277)))

(declare-fun b!295021 () Bool)

(declare-fun e!186478 () SeekEntryResult!2220)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14915 (_ BitVec 32)) SeekEntryResult!2220)

(assert (=> b!295021 (= e!186478 (seekKeyOrZeroReturnVacant!0 (x!29260 lt!146276) (index!11052 lt!146276) (index!11052 lt!146276) k0!2524 a!3312 mask!3809))))

(declare-fun b!295022 () Bool)

(assert (=> b!295022 (= e!186477 Undefined!2220)))

(declare-fun b!295023 () Bool)

(assert (=> b!295023 (= e!186478 (MissingZero!2220 (index!11052 lt!146276)))))

(declare-fun b!295024 () Bool)

(assert (=> b!295024 (= e!186476 (Found!2220 (index!11052 lt!146276)))))

(declare-fun b!295025 () Bool)

(declare-fun c!47551 () Bool)

(assert (=> b!295025 (= c!47551 (= lt!146275 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!295025 (= e!186476 e!186478)))

(assert (= (and d!66913 c!47552) b!295022))

(assert (= (and d!66913 (not c!47552)) b!295020))

(assert (= (and b!295020 c!47553) b!295024))

(assert (= (and b!295020 (not c!47553)) b!295025))

(assert (= (and b!295025 c!47551) b!295023))

(assert (= (and b!295025 (not c!47551)) b!295021))

(declare-fun m!308319 () Bool)

(assert (=> b!295020 m!308319))

(declare-fun m!308321 () Bool)

(assert (=> d!66913 m!308321))

(declare-fun m!308323 () Bool)

(assert (=> d!66913 m!308323))

(assert (=> d!66913 m!308251))

(declare-fun m!308325 () Bool)

(assert (=> d!66913 m!308325))

(assert (=> d!66913 m!308249))

(declare-fun m!308327 () Bool)

(assert (=> d!66913 m!308327))

(assert (=> d!66913 m!308249))

(declare-fun m!308329 () Bool)

(assert (=> b!295021 m!308329))

(assert (=> b!294942 d!66913))

(declare-fun b!295068 () Bool)

(declare-fun e!186513 () SeekEntryResult!2220)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295068 (= e!186513 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146223 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!14916 (store (arr!7071 a!3312) i!1256 k0!2524) (size!7423 a!3312)) mask!3809))))

(declare-fun b!295069 () Bool)

(assert (=> b!295069 (= e!186513 (Intermediate!2220 false lt!146223 #b00000000000000000000000000000000))))

(declare-fun b!295070 () Bool)

(declare-fun e!186514 () Bool)

(declare-fun e!186511 () Bool)

(assert (=> b!295070 (= e!186514 e!186511)))

(declare-fun res!155093 () Bool)

(declare-fun lt!146292 () SeekEntryResult!2220)

(assert (=> b!295070 (= res!155093 (and ((_ is Intermediate!2220) lt!146292) (not (undefined!3032 lt!146292)) (bvslt (x!29260 lt!146292) #b01111111111111111111111111111110) (bvsge (x!29260 lt!146292) #b00000000000000000000000000000000) (bvsge (x!29260 lt!146292) #b00000000000000000000000000000000)))))

(assert (=> b!295070 (=> (not res!155093) (not e!186511))))

(declare-fun b!295071 () Bool)

(assert (=> b!295071 (and (bvsge (index!11052 lt!146292) #b00000000000000000000000000000000) (bvslt (index!11052 lt!146292) (size!7423 (array!14916 (store (arr!7071 a!3312) i!1256 k0!2524) (size!7423 a!3312)))))))

(declare-fun res!155094 () Bool)

(assert (=> b!295071 (= res!155094 (= (select (arr!7071 (array!14916 (store (arr!7071 a!3312) i!1256 k0!2524) (size!7423 a!3312))) (index!11052 lt!146292)) k0!2524))))

(declare-fun e!186512 () Bool)

(assert (=> b!295071 (=> res!155094 e!186512)))

(assert (=> b!295071 (= e!186511 e!186512)))

(declare-fun b!295072 () Bool)

(assert (=> b!295072 (and (bvsge (index!11052 lt!146292) #b00000000000000000000000000000000) (bvslt (index!11052 lt!146292) (size!7423 (array!14916 (store (arr!7071 a!3312) i!1256 k0!2524) (size!7423 a!3312)))))))

(declare-fun res!155092 () Bool)

(assert (=> b!295072 (= res!155092 (= (select (arr!7071 (array!14916 (store (arr!7071 a!3312) i!1256 k0!2524) (size!7423 a!3312))) (index!11052 lt!146292)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!295072 (=> res!155092 e!186512)))

(declare-fun b!295073 () Bool)

(assert (=> b!295073 (= e!186514 (bvsge (x!29260 lt!146292) #b01111111111111111111111111111110))))

(declare-fun d!66923 () Bool)

(assert (=> d!66923 e!186514))

(declare-fun c!47564 () Bool)

(assert (=> d!66923 (= c!47564 (and ((_ is Intermediate!2220) lt!146292) (undefined!3032 lt!146292)))))

(declare-fun e!186510 () SeekEntryResult!2220)

(assert (=> d!66923 (= lt!146292 e!186510)))

(declare-fun c!47565 () Bool)

(assert (=> d!66923 (= c!47565 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!146291 () (_ BitVec 64))

(assert (=> d!66923 (= lt!146291 (select (arr!7071 (array!14916 (store (arr!7071 a!3312) i!1256 k0!2524) (size!7423 a!3312))) lt!146223))))

(assert (=> d!66923 (validMask!0 mask!3809)))

(assert (=> d!66923 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146223 k0!2524 (array!14916 (store (arr!7071 a!3312) i!1256 k0!2524) (size!7423 a!3312)) mask!3809) lt!146292)))

(declare-fun b!295074 () Bool)

(assert (=> b!295074 (and (bvsge (index!11052 lt!146292) #b00000000000000000000000000000000) (bvslt (index!11052 lt!146292) (size!7423 (array!14916 (store (arr!7071 a!3312) i!1256 k0!2524) (size!7423 a!3312)))))))

(assert (=> b!295074 (= e!186512 (= (select (arr!7071 (array!14916 (store (arr!7071 a!3312) i!1256 k0!2524) (size!7423 a!3312))) (index!11052 lt!146292)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!295075 () Bool)

(assert (=> b!295075 (= e!186510 (Intermediate!2220 true lt!146223 #b00000000000000000000000000000000))))

(declare-fun b!295076 () Bool)

(assert (=> b!295076 (= e!186510 e!186513)))

(declare-fun c!47563 () Bool)

(assert (=> b!295076 (= c!47563 (or (= lt!146291 k0!2524) (= (bvadd lt!146291 lt!146291) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!66923 c!47565) b!295075))

(assert (= (and d!66923 (not c!47565)) b!295076))

(assert (= (and b!295076 c!47563) b!295069))

(assert (= (and b!295076 (not c!47563)) b!295068))

(assert (= (and d!66923 c!47564) b!295073))

(assert (= (and d!66923 (not c!47564)) b!295070))

(assert (= (and b!295070 res!155093) b!295071))

(assert (= (and b!295071 (not res!155094)) b!295072))

(assert (= (and b!295072 (not res!155092)) b!295074))

(declare-fun m!308347 () Bool)

(assert (=> b!295074 m!308347))

(assert (=> b!295071 m!308347))

(declare-fun m!308349 () Bool)

(assert (=> d!66923 m!308349))

(assert (=> d!66923 m!308251))

(declare-fun m!308351 () Bool)

(assert (=> b!295068 m!308351))

(assert (=> b!295068 m!308351))

(declare-fun m!308353 () Bool)

(assert (=> b!295068 m!308353))

(assert (=> b!295072 m!308347))

(assert (=> b!294945 d!66923))

(declare-fun b!295077 () Bool)

(declare-fun e!186518 () SeekEntryResult!2220)

(assert (=> b!295077 (= e!186518 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146223 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!295078 () Bool)

(assert (=> b!295078 (= e!186518 (Intermediate!2220 false lt!146223 #b00000000000000000000000000000000))))

(declare-fun b!295079 () Bool)

(declare-fun e!186519 () Bool)

(declare-fun e!186516 () Bool)

(assert (=> b!295079 (= e!186519 e!186516)))

(declare-fun res!155096 () Bool)

(declare-fun lt!146294 () SeekEntryResult!2220)

(assert (=> b!295079 (= res!155096 (and ((_ is Intermediate!2220) lt!146294) (not (undefined!3032 lt!146294)) (bvslt (x!29260 lt!146294) #b01111111111111111111111111111110) (bvsge (x!29260 lt!146294) #b00000000000000000000000000000000) (bvsge (x!29260 lt!146294) #b00000000000000000000000000000000)))))

(assert (=> b!295079 (=> (not res!155096) (not e!186516))))

(declare-fun b!295080 () Bool)

(assert (=> b!295080 (and (bvsge (index!11052 lt!146294) #b00000000000000000000000000000000) (bvslt (index!11052 lt!146294) (size!7423 a!3312)))))

(declare-fun res!155097 () Bool)

(assert (=> b!295080 (= res!155097 (= (select (arr!7071 a!3312) (index!11052 lt!146294)) k0!2524))))

(declare-fun e!186517 () Bool)

(assert (=> b!295080 (=> res!155097 e!186517)))

(assert (=> b!295080 (= e!186516 e!186517)))

(declare-fun b!295081 () Bool)

(assert (=> b!295081 (and (bvsge (index!11052 lt!146294) #b00000000000000000000000000000000) (bvslt (index!11052 lt!146294) (size!7423 a!3312)))))

(declare-fun res!155095 () Bool)

(assert (=> b!295081 (= res!155095 (= (select (arr!7071 a!3312) (index!11052 lt!146294)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!295081 (=> res!155095 e!186517)))

(declare-fun b!295082 () Bool)

(assert (=> b!295082 (= e!186519 (bvsge (x!29260 lt!146294) #b01111111111111111111111111111110))))

(declare-fun d!66937 () Bool)

(assert (=> d!66937 e!186519))

(declare-fun c!47567 () Bool)

(assert (=> d!66937 (= c!47567 (and ((_ is Intermediate!2220) lt!146294) (undefined!3032 lt!146294)))))

(declare-fun e!186515 () SeekEntryResult!2220)

(assert (=> d!66937 (= lt!146294 e!186515)))

(declare-fun c!47568 () Bool)

(assert (=> d!66937 (= c!47568 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!146293 () (_ BitVec 64))

(assert (=> d!66937 (= lt!146293 (select (arr!7071 a!3312) lt!146223))))

(assert (=> d!66937 (validMask!0 mask!3809)))

(assert (=> d!66937 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146223 k0!2524 a!3312 mask!3809) lt!146294)))

(declare-fun b!295083 () Bool)

(assert (=> b!295083 (and (bvsge (index!11052 lt!146294) #b00000000000000000000000000000000) (bvslt (index!11052 lt!146294) (size!7423 a!3312)))))

(assert (=> b!295083 (= e!186517 (= (select (arr!7071 a!3312) (index!11052 lt!146294)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!295084 () Bool)

(assert (=> b!295084 (= e!186515 (Intermediate!2220 true lt!146223 #b00000000000000000000000000000000))))

(declare-fun b!295085 () Bool)

(assert (=> b!295085 (= e!186515 e!186518)))

(declare-fun c!47566 () Bool)

(assert (=> b!295085 (= c!47566 (or (= lt!146293 k0!2524) (= (bvadd lt!146293 lt!146293) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!66937 c!47568) b!295084))

(assert (= (and d!66937 (not c!47568)) b!295085))

(assert (= (and b!295085 c!47566) b!295078))

(assert (= (and b!295085 (not c!47566)) b!295077))

(assert (= (and d!66937 c!47567) b!295082))

(assert (= (and d!66937 (not c!47567)) b!295079))

(assert (= (and b!295079 res!155096) b!295080))

(assert (= (and b!295080 (not res!155097)) b!295081))

(assert (= (and b!295081 (not res!155095)) b!295083))

(declare-fun m!308355 () Bool)

(assert (=> b!295083 m!308355))

(assert (=> b!295080 m!308355))

(declare-fun m!308357 () Bool)

(assert (=> d!66937 m!308357))

(assert (=> d!66937 m!308251))

(assert (=> b!295077 m!308351))

(assert (=> b!295077 m!308351))

(declare-fun m!308359 () Bool)

(assert (=> b!295077 m!308359))

(assert (=> b!295081 m!308355))

(assert (=> b!294945 d!66937))

(declare-fun d!66941 () Bool)

(declare-fun lt!146306 () (_ BitVec 32))

(declare-fun lt!146305 () (_ BitVec 32))

(assert (=> d!66941 (= lt!146306 (bvmul (bvxor lt!146305 (bvlshr lt!146305 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66941 (= lt!146305 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66941 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!155098 (let ((h!5286 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29263 (bvmul (bvxor h!5286 (bvlshr h!5286 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29263 (bvlshr x!29263 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!155098 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!155098 #b00000000000000000000000000000000))))))

(assert (=> d!66941 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!146306 (bvlshr lt!146306 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!294945 d!66941))

(declare-fun d!66945 () Bool)

(assert (=> d!66945 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29022 d!66945))

(declare-fun d!66949 () Bool)

(assert (=> d!66949 (= (array_inv!5034 a!3312) (bvsge (size!7423 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29022 d!66949))

(declare-fun d!66951 () Bool)

(declare-fun res!155109 () Bool)

(declare-fun e!186543 () Bool)

(assert (=> d!66951 (=> res!155109 e!186543)))

(assert (=> d!66951 (= res!155109 (= (select (arr!7071 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66951 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!186543)))

(declare-fun b!295126 () Bool)

(declare-fun e!186544 () Bool)

(assert (=> b!295126 (= e!186543 e!186544)))

(declare-fun res!155110 () Bool)

(assert (=> b!295126 (=> (not res!155110) (not e!186544))))

(assert (=> b!295126 (= res!155110 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7423 a!3312)))))

(declare-fun b!295127 () Bool)

(assert (=> b!295127 (= e!186544 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66951 (not res!155109)) b!295126))

(assert (= (and b!295126 res!155110) b!295127))

(assert (=> d!66951 m!308283))

(declare-fun m!308373 () Bool)

(assert (=> b!295127 m!308373))

(assert (=> b!294944 d!66951))

(check-sat (not b!294974) (not b!295077) (not d!66913) (not d!66937) (not b!295021) (not bm!25717) (not b!295127) (not b!294975) (not d!66923) (not b!295068))
(check-sat)
