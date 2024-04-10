; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29078 () Bool)

(assert start!29078)

(declare-fun b!295246 () Bool)

(declare-fun e!186617 () Bool)

(declare-datatypes ((SeekEntryResult!2224 0))(
  ( (MissingZero!2224 (index!11066 (_ BitVec 32))) (Found!2224 (index!11067 (_ BitVec 32))) (Intermediate!2224 (undefined!3036 Bool) (index!11068 (_ BitVec 32)) (x!29278 (_ BitVec 32))) (Undefined!2224) (MissingVacant!2224 (index!11069 (_ BitVec 32))) )
))
(declare-fun lt!146390 () SeekEntryResult!2224)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!295246 (= e!186617 (not (= (index!11068 lt!146390) i!1256)))))

(declare-datatypes ((array!14926 0))(
  ( (array!14927 (arr!7075 (Array (_ BitVec 32) (_ BitVec 64))) (size!7427 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14926)

(assert (=> b!295246 (= (select (arr!7075 a!3312) (index!11068 lt!146390)) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!295247 () Bool)

(declare-fun res!155197 () Bool)

(declare-fun e!186615 () Bool)

(assert (=> b!295247 (=> (not res!155197) (not e!186615))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14926 (_ BitVec 32)) Bool)

(assert (=> b!295247 (= res!155197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295248 () Bool)

(declare-fun e!186619 () Bool)

(assert (=> b!295248 (= e!186615 e!186619)))

(declare-fun res!155199 () Bool)

(assert (=> b!295248 (=> (not res!155199) (not e!186619))))

(declare-fun lt!146391 () Bool)

(assert (=> b!295248 (= res!155199 lt!146391)))

(declare-fun lt!146386 () SeekEntryResult!2224)

(declare-fun lt!146387 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14926 (_ BitVec 32)) SeekEntryResult!2224)

(assert (=> b!295248 (= lt!146386 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146387 k!2524 (array!14927 (store (arr!7075 a!3312) i!1256 k!2524) (size!7427 a!3312)) mask!3809))))

(assert (=> b!295248 (= lt!146390 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146387 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295248 (= lt!146387 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!295249 () Bool)

(declare-fun res!155201 () Bool)

(declare-fun e!186618 () Bool)

(assert (=> b!295249 (=> (not res!155201) (not e!186618))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295249 (= res!155201 (validKeyInArray!0 k!2524))))

(declare-fun b!295250 () Bool)

(assert (=> b!295250 (= e!186619 e!186617)))

(declare-fun res!155195 () Bool)

(assert (=> b!295250 (=> (not res!155195) (not e!186617))))

(declare-fun lt!146389 () Bool)

(assert (=> b!295250 (= res!155195 (and (or lt!146389 (not (undefined!3036 lt!146390))) (or lt!146389 (not (= (select (arr!7075 a!3312) (index!11068 lt!146390)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146389 (not (= (select (arr!7075 a!3312) (index!11068 lt!146390)) k!2524))) (not lt!146389)))))

(assert (=> b!295250 (= lt!146389 (not (is-Intermediate!2224 lt!146390)))))

(declare-fun b!295251 () Bool)

(declare-fun res!155198 () Bool)

(assert (=> b!295251 (=> (not res!155198) (not e!186618))))

(declare-fun arrayContainsKey!0 (array!14926 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295251 (= res!155198 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!155200 () Bool)

(assert (=> start!29078 (=> (not res!155200) (not e!186618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29078 (= res!155200 (validMask!0 mask!3809))))

(assert (=> start!29078 e!186618))

(assert (=> start!29078 true))

(declare-fun array_inv!5038 (array!14926) Bool)

(assert (=> start!29078 (array_inv!5038 a!3312)))

(declare-fun b!295252 () Bool)

(declare-fun res!155196 () Bool)

(assert (=> b!295252 (=> (not res!155196) (not e!186618))))

(assert (=> b!295252 (= res!155196 (and (= (size!7427 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7427 a!3312))))))

(declare-fun b!295253 () Bool)

(assert (=> b!295253 (= e!186618 e!186615)))

(declare-fun res!155202 () Bool)

(assert (=> b!295253 (=> (not res!155202) (not e!186615))))

(declare-fun lt!146388 () SeekEntryResult!2224)

(assert (=> b!295253 (= res!155202 (or lt!146391 (= lt!146388 (MissingVacant!2224 i!1256))))))

(assert (=> b!295253 (= lt!146391 (= lt!146388 (MissingZero!2224 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14926 (_ BitVec 32)) SeekEntryResult!2224)

(assert (=> b!295253 (= lt!146388 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!29078 res!155200) b!295252))

(assert (= (and b!295252 res!155196) b!295249))

(assert (= (and b!295249 res!155201) b!295251))

(assert (= (and b!295251 res!155198) b!295253))

(assert (= (and b!295253 res!155202) b!295247))

(assert (= (and b!295247 res!155197) b!295248))

(assert (= (and b!295248 res!155199) b!295250))

(assert (= (and b!295250 res!155195) b!295246))

(declare-fun m!308447 () Bool)

(assert (=> b!295250 m!308447))

(assert (=> b!295246 m!308447))

(declare-fun m!308449 () Bool)

(assert (=> b!295249 m!308449))

(declare-fun m!308451 () Bool)

(assert (=> b!295251 m!308451))

(declare-fun m!308453 () Bool)

(assert (=> b!295247 m!308453))

(declare-fun m!308455 () Bool)

(assert (=> start!29078 m!308455))

(declare-fun m!308457 () Bool)

(assert (=> start!29078 m!308457))

(declare-fun m!308459 () Bool)

(assert (=> b!295248 m!308459))

(declare-fun m!308461 () Bool)

(assert (=> b!295248 m!308461))

(declare-fun m!308463 () Bool)

(assert (=> b!295248 m!308463))

(declare-fun m!308465 () Bool)

(assert (=> b!295248 m!308465))

(declare-fun m!308467 () Bool)

(assert (=> b!295253 m!308467))

(push 1)

(assert (not b!295251))

(assert (not b!295247))

(assert (not b!295253))

(assert (not b!295248))

(assert (not b!295249))

(assert (not start!29078))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!295296 () Bool)

(declare-fun e!186646 () SeekEntryResult!2224)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295296 (= e!186646 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146387 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14927 (store (arr!7075 a!3312) i!1256 k!2524) (size!7427 a!3312)) mask!3809))))

(declare-fun b!295297 () Bool)

(declare-fun e!186647 () SeekEntryResult!2224)

(assert (=> b!295297 (= e!186647 e!186646)))

(declare-fun c!47619 () Bool)

(declare-fun lt!146406 () (_ BitVec 64))

(assert (=> b!295297 (= c!47619 (or (= lt!146406 k!2524) (= (bvadd lt!146406 lt!146406) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!295298 () Bool)

(assert (=> b!295298 (= e!186646 (Intermediate!2224 false lt!146387 #b00000000000000000000000000000000))))

(declare-fun lt!146405 () SeekEntryResult!2224)

(declare-fun b!295299 () Bool)

(assert (=> b!295299 (and (bvsge (index!11068 lt!146405) #b00000000000000000000000000000000) (bvslt (index!11068 lt!146405) (size!7427 (array!14927 (store (arr!7075 a!3312) i!1256 k!2524) (size!7427 a!3312)))))))

(declare-fun e!186645 () Bool)

(assert (=> b!295299 (= e!186645 (= (select (arr!7075 (array!14927 (store (arr!7075 a!3312) i!1256 k!2524) (size!7427 a!3312))) (index!11068 lt!146405)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!295300 () Bool)

(declare-fun e!186648 () Bool)

(declare-fun e!186649 () Bool)

(assert (=> b!295300 (= e!186648 e!186649)))

(declare-fun res!155215 () Bool)

(assert (=> b!295300 (= res!155215 (and (is-Intermediate!2224 lt!146405) (not (undefined!3036 lt!146405)) (bvslt (x!29278 lt!146405) #b01111111111111111111111111111110) (bvsge (x!29278 lt!146405) #b00000000000000000000000000000000) (bvsge (x!29278 lt!146405) #b00000000000000000000000000000000)))))

(assert (=> b!295300 (=> (not res!155215) (not e!186649))))

(declare-fun b!295301 () Bool)

(assert (=> b!295301 (and (bvsge (index!11068 lt!146405) #b00000000000000000000000000000000) (bvslt (index!11068 lt!146405) (size!7427 (array!14927 (store (arr!7075 a!3312) i!1256 k!2524) (size!7427 a!3312)))))))

(declare-fun res!155217 () Bool)

(assert (=> b!295301 (= res!155217 (= (select (arr!7075 (array!14927 (store (arr!7075 a!3312) i!1256 k!2524) (size!7427 a!3312))) (index!11068 lt!146405)) k!2524))))

(assert (=> b!295301 (=> res!155217 e!186645)))

(assert (=> b!295301 (= e!186649 e!186645)))

(declare-fun d!66971 () Bool)

(assert (=> d!66971 e!186648))

(declare-fun c!47618 () Bool)

(assert (=> d!66971 (= c!47618 (and (is-Intermediate!2224 lt!146405) (undefined!3036 lt!146405)))))

(assert (=> d!66971 (= lt!146405 e!186647)))

(declare-fun c!47617 () Bool)

(assert (=> d!66971 (= c!47617 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66971 (= lt!146406 (select (arr!7075 (array!14927 (store (arr!7075 a!3312) i!1256 k!2524) (size!7427 a!3312))) lt!146387))))

(assert (=> d!66971 (validMask!0 mask!3809)))

(assert (=> d!66971 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146387 k!2524 (array!14927 (store (arr!7075 a!3312) i!1256 k!2524) (size!7427 a!3312)) mask!3809) lt!146405)))

(declare-fun b!295302 () Bool)

(assert (=> b!295302 (and (bvsge (index!11068 lt!146405) #b00000000000000000000000000000000) (bvslt (index!11068 lt!146405) (size!7427 (array!14927 (store (arr!7075 a!3312) i!1256 k!2524) (size!7427 a!3312)))))))

(declare-fun res!155216 () Bool)

(assert (=> b!295302 (= res!155216 (= (select (arr!7075 (array!14927 (store (arr!7075 a!3312) i!1256 k!2524) (size!7427 a!3312))) (index!11068 lt!146405)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!295302 (=> res!155216 e!186645)))

(declare-fun b!295303 () Bool)

(assert (=> b!295303 (= e!186648 (bvsge (x!29278 lt!146405) #b01111111111111111111111111111110))))

(declare-fun b!295304 () Bool)

(assert (=> b!295304 (= e!186647 (Intermediate!2224 true lt!146387 #b00000000000000000000000000000000))))

(assert (= (and d!66971 c!47617) b!295304))

(assert (= (and d!66971 (not c!47617)) b!295297))

(assert (= (and b!295297 c!47619) b!295298))

(assert (= (and b!295297 (not c!47619)) b!295296))

(assert (= (and d!66971 c!47618) b!295303))

(assert (= (and d!66971 (not c!47618)) b!295300))

(assert (= (and b!295300 res!155215) b!295301))

(assert (= (and b!295301 (not res!155217)) b!295302))

(assert (= (and b!295302 (not res!155216)) b!295299))

(declare-fun m!308485 () Bool)

(assert (=> d!66971 m!308485))

(assert (=> d!66971 m!308455))

(declare-fun m!308487 () Bool)

(assert (=> b!295301 m!308487))

(declare-fun m!308489 () Bool)

(assert (=> b!295296 m!308489))

(assert (=> b!295296 m!308489))

(declare-fun m!308491 () Bool)

(assert (=> b!295296 m!308491))

(assert (=> b!295302 m!308487))

(assert (=> b!295299 m!308487))

(assert (=> b!295248 d!66971))

(declare-fun b!295305 () Bool)

(declare-fun e!186651 () SeekEntryResult!2224)

(assert (=> b!295305 (= e!186651 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146387 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!295306 () Bool)

(declare-fun e!186652 () SeekEntryResult!2224)

(assert (=> b!295306 (= e!186652 e!186651)))

(declare-fun c!47622 () Bool)

(declare-fun lt!146408 () (_ BitVec 64))

(assert (=> b!295306 (= c!47622 (or (= lt!146408 k!2524) (= (bvadd lt!146408 lt!146408) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!295307 () Bool)

(assert (=> b!295307 (= e!186651 (Intermediate!2224 false lt!146387 #b00000000000000000000000000000000))))

(declare-fun b!295308 () Bool)

(declare-fun lt!146407 () SeekEntryResult!2224)

(assert (=> b!295308 (and (bvsge (index!11068 lt!146407) #b00000000000000000000000000000000) (bvslt (index!11068 lt!146407) (size!7427 a!3312)))))

(declare-fun e!186650 () Bool)

(assert (=> b!295308 (= e!186650 (= (select (arr!7075 a!3312) (index!11068 lt!146407)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!295309 () Bool)

(declare-fun e!186653 () Bool)

(declare-fun e!186654 () Bool)

(assert (=> b!295309 (= e!186653 e!186654)))

(declare-fun res!155218 () Bool)

(assert (=> b!295309 (= res!155218 (and (is-Intermediate!2224 lt!146407) (not (undefined!3036 lt!146407)) (bvslt (x!29278 lt!146407) #b01111111111111111111111111111110) (bvsge (x!29278 lt!146407) #b00000000000000000000000000000000) (bvsge (x!29278 lt!146407) #b00000000000000000000000000000000)))))

(assert (=> b!295309 (=> (not res!155218) (not e!186654))))

(declare-fun b!295310 () Bool)

(assert (=> b!295310 (and (bvsge (index!11068 lt!146407) #b00000000000000000000000000000000) (bvslt (index!11068 lt!146407) (size!7427 a!3312)))))

(declare-fun res!155220 () Bool)

(assert (=> b!295310 (= res!155220 (= (select (arr!7075 a!3312) (index!11068 lt!146407)) k!2524))))

(assert (=> b!295310 (=> res!155220 e!186650)))

(assert (=> b!295310 (= e!186654 e!186650)))

(declare-fun d!66983 () Bool)

(assert (=> d!66983 e!186653))

(declare-fun c!47621 () Bool)

(assert (=> d!66983 (= c!47621 (and (is-Intermediate!2224 lt!146407) (undefined!3036 lt!146407)))))

(assert (=> d!66983 (= lt!146407 e!186652)))

(declare-fun c!47620 () Bool)

(assert (=> d!66983 (= c!47620 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66983 (= lt!146408 (select (arr!7075 a!3312) lt!146387))))

(assert (=> d!66983 (validMask!0 mask!3809)))

(assert (=> d!66983 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146387 k!2524 a!3312 mask!3809) lt!146407)))

(declare-fun b!295311 () Bool)

(assert (=> b!295311 (and (bvsge (index!11068 lt!146407) #b00000000000000000000000000000000) (bvslt (index!11068 lt!146407) (size!7427 a!3312)))))

(declare-fun res!155219 () Bool)

(assert (=> b!295311 (= res!155219 (= (select (arr!7075 a!3312) (index!11068 lt!146407)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!295311 (=> res!155219 e!186650)))

(declare-fun b!295312 () Bool)

(assert (=> b!295312 (= e!186653 (bvsge (x!29278 lt!146407) #b01111111111111111111111111111110))))

(declare-fun b!295313 () Bool)

(assert (=> b!295313 (= e!186652 (Intermediate!2224 true lt!146387 #b00000000000000000000000000000000))))

(assert (= (and d!66983 c!47620) b!295313))

(assert (= (and d!66983 (not c!47620)) b!295306))

(assert (= (and b!295306 c!47622) b!295307))

(assert (= (and b!295306 (not c!47622)) b!295305))

(assert (= (and d!66983 c!47621) b!295312))

(assert (= (and d!66983 (not c!47621)) b!295309))

(assert (= (and b!295309 res!155218) b!295310))

(assert (= (and b!295310 (not res!155220)) b!295311))

(assert (= (and b!295311 (not res!155219)) b!295308))

(declare-fun m!308493 () Bool)

(assert (=> d!66983 m!308493))

(assert (=> d!66983 m!308455))

(declare-fun m!308495 () Bool)

(assert (=> b!295310 m!308495))

(assert (=> b!295305 m!308489))

(assert (=> b!295305 m!308489))

(declare-fun m!308497 () Bool)

(assert (=> b!295305 m!308497))

(assert (=> b!295311 m!308495))

(assert (=> b!295308 m!308495))

(assert (=> b!295248 d!66983))

(declare-fun d!66985 () Bool)

(declare-fun lt!146418 () (_ BitVec 32))

(declare-fun lt!146417 () (_ BitVec 32))

(assert (=> d!66985 (= lt!146418 (bvmul (bvxor lt!146417 (bvlshr lt!146417 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66985 (= lt!146417 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66985 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!155221 (let ((h!5289 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29281 (bvmul (bvxor h!5289 (bvlshr h!5289 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29281 (bvlshr x!29281 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!155221 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!155221 #b00000000000000000000000000000000))))))

(assert (=> d!66985 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!146418 (bvlshr lt!146418 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!295248 d!66985))

(declare-fun b!295398 () Bool)

(declare-fun e!186701 () SeekEntryResult!2224)

(assert (=> b!295398 (= e!186701 Undefined!2224)))

(declare-fun b!295399 () Bool)

(declare-fun e!186702 () SeekEntryResult!2224)

(assert (=> b!295399 (= e!186701 e!186702)))

(declare-fun lt!146451 () (_ BitVec 64))

(declare-fun lt!146449 () SeekEntryResult!2224)

(assert (=> b!295399 (= lt!146451 (select (arr!7075 a!3312) (index!11068 lt!146449)))))

(declare-fun c!47655 () Bool)

(assert (=> b!295399 (= c!47655 (= lt!146451 k!2524))))

(declare-fun d!66987 () Bool)

(declare-fun lt!146450 () SeekEntryResult!2224)

(assert (=> d!66987 (and (or (is-Undefined!2224 lt!146450) (not (is-Found!2224 lt!146450)) (and (bvsge (index!11067 lt!146450) #b00000000000000000000000000000000) (bvslt (index!11067 lt!146450) (size!7427 a!3312)))) (or (is-Undefined!2224 lt!146450) (is-Found!2224 lt!146450) (not (is-MissingZero!2224 lt!146450)) (and (bvsge (index!11066 lt!146450) #b00000000000000000000000000000000) (bvslt (index!11066 lt!146450) (size!7427 a!3312)))) (or (is-Undefined!2224 lt!146450) (is-Found!2224 lt!146450) (is-MissingZero!2224 lt!146450) (not (is-MissingVacant!2224 lt!146450)) (and (bvsge (index!11069 lt!146450) #b00000000000000000000000000000000) (bvslt (index!11069 lt!146450) (size!7427 a!3312)))) (or (is-Undefined!2224 lt!146450) (ite (is-Found!2224 lt!146450) (= (select (arr!7075 a!3312) (index!11067 lt!146450)) k!2524) (ite (is-MissingZero!2224 lt!146450) (= (select (arr!7075 a!3312) (index!11066 lt!146450)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2224 lt!146450) (= (select (arr!7075 a!3312) (index!11069 lt!146450)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66987 (= lt!146450 e!186701)))

(declare-fun c!47654 () Bool)

(assert (=> d!66987 (= c!47654 (and (is-Intermediate!2224 lt!146449) (undefined!3036 lt!146449)))))

(assert (=> d!66987 (= lt!146449 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66987 (validMask!0 mask!3809)))

(assert (=> d!66987 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!146450)))

(declare-fun b!295400 () Bool)

(declare-fun e!186703 () SeekEntryResult!2224)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14926 (_ BitVec 32)) SeekEntryResult!2224)

(assert (=> b!295400 (= e!186703 (seekKeyOrZeroReturnVacant!0 (x!29278 lt!146449) (index!11068 lt!146449) (index!11068 lt!146449) k!2524 a!3312 mask!3809))))

(declare-fun b!295401 () Bool)

(assert (=> b!295401 (= e!186703 (MissingZero!2224 (index!11068 lt!146449)))))

(declare-fun b!295402 () Bool)

(declare-fun c!47653 () Bool)

(assert (=> b!295402 (= c!47653 (= lt!146451 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!295402 (= e!186702 e!186703)))

(declare-fun b!295403 () Bool)

(assert (=> b!295403 (= e!186702 (Found!2224 (index!11068 lt!146449)))))

(assert (= (and d!66987 c!47654) b!295398))

(assert (= (and d!66987 (not c!47654)) b!295399))

(assert (= (and b!295399 c!47655) b!295403))

(assert (= (and b!295399 (not c!47655)) b!295402))

(assert (= (and b!295402 c!47653) b!295401))

(assert (= (and b!295402 (not c!47653)) b!295400))

(declare-fun m!308527 () Bool)

(assert (=> b!295399 m!308527))

(declare-fun m!308529 () Bool)

(assert (=> d!66987 m!308529))

(declare-fun m!308531 () Bool)

(assert (=> d!66987 m!308531))

(assert (=> d!66987 m!308455))

(assert (=> d!66987 m!308465))

(declare-fun m!308533 () Bool)

(assert (=> d!66987 m!308533))

(declare-fun m!308535 () Bool)

(assert (=> d!66987 m!308535))

(assert (=> d!66987 m!308465))

(declare-fun m!308537 () Bool)

(assert (=> b!295400 m!308537))

(assert (=> b!295253 d!66987))

(declare-fun b!295446 () Bool)

(declare-fun e!186732 () Bool)

(declare-fun e!186734 () Bool)

(assert (=> b!295446 (= e!186732 e!186734)))

(declare-fun c!47670 () Bool)

(assert (=> b!295446 (= c!47670 (validKeyInArray!0 (select (arr!7075 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!295447 () Bool)

(declare-fun e!186733 () Bool)

(assert (=> b!295447 (= e!186734 e!186733)))

(declare-fun lt!146476 () (_ BitVec 64))

(assert (=> b!295447 (= lt!146476 (select (arr!7075 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9224 0))(
  ( (Unit!9225) )
))
(declare-fun lt!146478 () Unit!9224)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14926 (_ BitVec 64) (_ BitVec 32)) Unit!9224)

(assert (=> b!295447 (= lt!146478 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!146476 #b00000000000000000000000000000000))))

(assert (=> b!295447 (arrayContainsKey!0 a!3312 lt!146476 #b00000000000000000000000000000000)))

(declare-fun lt!146477 () Unit!9224)

(assert (=> b!295447 (= lt!146477 lt!146478)))

(declare-fun res!155263 () Bool)

(assert (=> b!295447 (= res!155263 (= (seekEntryOrOpen!0 (select (arr!7075 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2224 #b00000000000000000000000000000000)))))

(assert (=> b!295447 (=> (not res!155263) (not e!186733))))

(declare-fun bm!25729 () Bool)

(declare-fun call!25732 () Bool)

(assert (=> bm!25729 (= call!25732 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!67003 () Bool)

(declare-fun res!155262 () Bool)

(assert (=> d!67003 (=> res!155262 e!186732)))

(assert (=> d!67003 (= res!155262 (bvsge #b00000000000000000000000000000000 (size!7427 a!3312)))))

(assert (=> d!67003 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!186732)))

(declare-fun b!295448 () Bool)

(assert (=> b!295448 (= e!186733 call!25732)))

(declare-fun b!295449 () Bool)

(assert (=> b!295449 (= e!186734 call!25732)))

(assert (= (and d!67003 (not res!155262)) b!295446))

(assert (= (and b!295446 c!47670) b!295447))

(assert (= (and b!295446 (not c!47670)) b!295449))

(assert (= (and b!295447 res!155263) b!295448))

(assert (= (or b!295448 b!295449) bm!25729))

(declare-fun m!308563 () Bool)

(assert (=> b!295446 m!308563))

(assert (=> b!295446 m!308563))

(declare-fun m!308565 () Bool)

(assert (=> b!295446 m!308565))

(assert (=> b!295447 m!308563))

(declare-fun m!308567 () Bool)

(assert (=> b!295447 m!308567))

(declare-fun m!308569 () Bool)

(assert (=> b!295447 m!308569))

(assert (=> b!295447 m!308563))

(declare-fun m!308571 () Bool)

(assert (=> b!295447 m!308571))

(declare-fun m!308573 () Bool)

(assert (=> bm!25729 m!308573))

(assert (=> b!295247 d!67003))

(declare-fun d!67009 () Bool)

(assert (=> d!67009 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!295249 d!67009))

(declare-fun d!67011 () Bool)

(assert (=> d!67011 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29078 d!67011))

(declare-fun d!67013 () Bool)

