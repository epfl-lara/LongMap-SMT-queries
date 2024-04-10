; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29020 () Bool)

(assert start!29020)

(declare-fun b!294924 () Bool)

(declare-fun e!186423 () Bool)

(declare-fun e!186424 () Bool)

(assert (=> b!294924 (= e!186423 e!186424)))

(declare-fun res!155017 () Bool)

(assert (=> b!294924 (=> (not res!155017) (not e!186424))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!146209 () Bool)

(declare-datatypes ((SeekEntryResult!2219 0))(
  ( (MissingZero!2219 (index!11046 (_ BitVec 32))) (Found!2219 (index!11047 (_ BitVec 32))) (Intermediate!2219 (undefined!3031 Bool) (index!11048 (_ BitVec 32)) (x!29259 (_ BitVec 32))) (Undefined!2219) (MissingVacant!2219 (index!11049 (_ BitVec 32))) )
))
(declare-fun lt!146210 () SeekEntryResult!2219)

(assert (=> b!294924 (= res!155017 (or lt!146209 (= lt!146210 (MissingVacant!2219 i!1256))))))

(assert (=> b!294924 (= lt!146209 (= lt!146210 (MissingZero!2219 i!1256)))))

(declare-datatypes ((array!14913 0))(
  ( (array!14914 (arr!7070 (Array (_ BitVec 32) (_ BitVec 64))) (size!7422 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14913)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14913 (_ BitVec 32)) SeekEntryResult!2219)

(assert (=> b!294924 (= lt!146210 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!294925 () Bool)

(declare-fun res!155019 () Bool)

(assert (=> b!294925 (=> (not res!155019) (not e!186423))))

(assert (=> b!294925 (= res!155019 (and (= (size!7422 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7422 a!3312))))))

(declare-fun b!294926 () Bool)

(declare-fun lt!146207 () SeekEntryResult!2219)

(assert (=> b!294926 (= e!186424 (and lt!146209 (let ((bdg!6247 (not (is-Intermediate!2219 lt!146207)))) (and (or bdg!6247 (not (undefined!3031 lt!146207))) (or bdg!6247 (not (= (select (arr!7070 a!3312) (index!11048 lt!146207)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or bdg!6247 (not (= (select (arr!7070 a!3312) (index!11048 lt!146207)) k!2524))) (not bdg!6247) (not (= (select (arr!7070 a!3312) (index!11048 lt!146207)) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!146208 () (_ BitVec 32))

(declare-fun lt!146211 () SeekEntryResult!2219)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14913 (_ BitVec 32)) SeekEntryResult!2219)

(assert (=> b!294926 (= lt!146211 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146208 k!2524 (array!14914 (store (arr!7070 a!3312) i!1256 k!2524) (size!7422 a!3312)) mask!3809))))

(assert (=> b!294926 (= lt!146207 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146208 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294926 (= lt!146208 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!294927 () Bool)

(declare-fun res!155014 () Bool)

(assert (=> b!294927 (=> (not res!155014) (not e!186423))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!294927 (= res!155014 (validKeyInArray!0 k!2524))))

(declare-fun b!294928 () Bool)

(declare-fun res!155016 () Bool)

(assert (=> b!294928 (=> (not res!155016) (not e!186423))))

(declare-fun arrayContainsKey!0 (array!14913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!294928 (= res!155016 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!294929 () Bool)

(declare-fun res!155015 () Bool)

(assert (=> b!294929 (=> (not res!155015) (not e!186424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14913 (_ BitVec 32)) Bool)

(assert (=> b!294929 (= res!155015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!155018 () Bool)

(assert (=> start!29020 (=> (not res!155018) (not e!186423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29020 (= res!155018 (validMask!0 mask!3809))))

(assert (=> start!29020 e!186423))

(assert (=> start!29020 true))

(declare-fun array_inv!5033 (array!14913) Bool)

(assert (=> start!29020 (array_inv!5033 a!3312)))

(assert (= (and start!29020 res!155018) b!294925))

(assert (= (and b!294925 res!155019) b!294927))

(assert (= (and b!294927 res!155014) b!294928))

(assert (= (and b!294928 res!155016) b!294924))

(assert (= (and b!294924 res!155017) b!294929))

(assert (= (and b!294929 res!155015) b!294926))

(declare-fun m!308217 () Bool)

(assert (=> start!29020 m!308217))

(declare-fun m!308219 () Bool)

(assert (=> start!29020 m!308219))

(declare-fun m!308221 () Bool)

(assert (=> b!294924 m!308221))

(declare-fun m!308223 () Bool)

(assert (=> b!294929 m!308223))

(declare-fun m!308225 () Bool)

(assert (=> b!294926 m!308225))

(declare-fun m!308227 () Bool)

(assert (=> b!294926 m!308227))

(declare-fun m!308229 () Bool)

(assert (=> b!294926 m!308229))

(declare-fun m!308231 () Bool)

(assert (=> b!294926 m!308231))

(declare-fun m!308233 () Bool)

(assert (=> b!294926 m!308233))

(declare-fun m!308235 () Bool)

(assert (=> b!294927 m!308235))

(declare-fun m!308237 () Bool)

(assert (=> b!294928 m!308237))

(push 1)

(assert (not b!294929))

(assert (not b!294927))

(assert (not start!29020))

(assert (not b!294928))

(assert (not b!294924))

(assert (not b!294926))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!295014 () Bool)

(declare-fun e!186473 () SeekEntryResult!2219)

(assert (=> b!295014 (= e!186473 Undefined!2219)))

(declare-fun e!186475 () SeekEntryResult!2219)

(declare-fun lt!146272 () SeekEntryResult!2219)

(declare-fun b!295015 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14913 (_ BitVec 32)) SeekEntryResult!2219)

(assert (=> b!295015 (= e!186475 (seekKeyOrZeroReturnVacant!0 (x!29259 lt!146272) (index!11048 lt!146272) (index!11048 lt!146272) k!2524 a!3312 mask!3809))))

(declare-fun b!295016 () Bool)

(declare-fun e!186474 () SeekEntryResult!2219)

(assert (=> b!295016 (= e!186473 e!186474)))

(declare-fun lt!146274 () (_ BitVec 64))

(assert (=> b!295016 (= lt!146274 (select (arr!7070 a!3312) (index!11048 lt!146272)))))

(declare-fun c!47549 () Bool)

(assert (=> b!295016 (= c!47549 (= lt!146274 k!2524))))

(declare-fun b!295017 () Bool)

(declare-fun c!47548 () Bool)

(assert (=> b!295017 (= c!47548 (= lt!146274 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!295017 (= e!186474 e!186475)))

(declare-fun d!66909 () Bool)

(declare-fun lt!146273 () SeekEntryResult!2219)

(assert (=> d!66909 (and (or (is-Undefined!2219 lt!146273) (not (is-Found!2219 lt!146273)) (and (bvsge (index!11047 lt!146273) #b00000000000000000000000000000000) (bvslt (index!11047 lt!146273) (size!7422 a!3312)))) (or (is-Undefined!2219 lt!146273) (is-Found!2219 lt!146273) (not (is-MissingZero!2219 lt!146273)) (and (bvsge (index!11046 lt!146273) #b00000000000000000000000000000000) (bvslt (index!11046 lt!146273) (size!7422 a!3312)))) (or (is-Undefined!2219 lt!146273) (is-Found!2219 lt!146273) (is-MissingZero!2219 lt!146273) (not (is-MissingVacant!2219 lt!146273)) (and (bvsge (index!11049 lt!146273) #b00000000000000000000000000000000) (bvslt (index!11049 lt!146273) (size!7422 a!3312)))) (or (is-Undefined!2219 lt!146273) (ite (is-Found!2219 lt!146273) (= (select (arr!7070 a!3312) (index!11047 lt!146273)) k!2524) (ite (is-MissingZero!2219 lt!146273) (= (select (arr!7070 a!3312) (index!11046 lt!146273)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2219 lt!146273) (= (select (arr!7070 a!3312) (index!11049 lt!146273)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66909 (= lt!146273 e!186473)))

(declare-fun c!47550 () Bool)

(assert (=> d!66909 (= c!47550 (and (is-Intermediate!2219 lt!146272) (undefined!3031 lt!146272)))))

(assert (=> d!66909 (= lt!146272 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66909 (validMask!0 mask!3809)))

(assert (=> d!66909 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!146273)))

(declare-fun b!295018 () Bool)

(assert (=> b!295018 (= e!186475 (MissingZero!2219 (index!11048 lt!146272)))))

(declare-fun b!295019 () Bool)

(assert (=> b!295019 (= e!186474 (Found!2219 (index!11048 lt!146272)))))

(assert (= (and d!66909 c!47550) b!295014))

(assert (= (and d!66909 (not c!47550)) b!295016))

(assert (= (and b!295016 c!47549) b!295019))

(assert (= (and b!295016 (not c!47549)) b!295017))

(assert (= (and b!295017 c!47548) b!295018))

(assert (= (and b!295017 (not c!47548)) b!295015))

(declare-fun m!308307 () Bool)

(assert (=> b!295015 m!308307))

(declare-fun m!308309 () Bool)

(assert (=> b!295016 m!308309))

(assert (=> d!66909 m!308233))

(declare-fun m!308311 () Bool)

(assert (=> d!66909 m!308311))

(declare-fun m!308313 () Bool)

(assert (=> d!66909 m!308313))

(declare-fun m!308315 () Bool)

(assert (=> d!66909 m!308315))

(declare-fun m!308317 () Bool)

(assert (=> d!66909 m!308317))

(assert (=> d!66909 m!308217))

(assert (=> d!66909 m!308233))

(assert (=> b!294924 d!66909))

(declare-fun d!66921 () Bool)

(declare-fun res!155072 () Bool)

(declare-fun e!186483 () Bool)

(assert (=> d!66921 (=> res!155072 e!186483)))

(assert (=> d!66921 (= res!155072 (= (select (arr!7070 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66921 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!186483)))

(declare-fun b!295030 () Bool)

(declare-fun e!186484 () Bool)

(assert (=> b!295030 (= e!186483 e!186484)))

(declare-fun res!155073 () Bool)

(assert (=> b!295030 (=> (not res!155073) (not e!186484))))

(assert (=> b!295030 (= res!155073 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7422 a!3312)))))

(declare-fun b!295031 () Bool)

(assert (=> b!295031 (= e!186484 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66921 (not res!155072)) b!295030))

(assert (= (and b!295030 res!155073) b!295031))

(declare-fun m!308331 () Bool)

(assert (=> d!66921 m!308331))

(declare-fun m!308333 () Bool)

(assert (=> b!295031 m!308333))

(assert (=> b!294928 d!66921))

(declare-fun b!295046 () Bool)

(declare-fun e!186498 () Bool)

(declare-fun e!186497 () Bool)

(assert (=> b!295046 (= e!186498 e!186497)))

(declare-fun c!47556 () Bool)

(assert (=> b!295046 (= c!47556 (validKeyInArray!0 (select (arr!7070 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!295047 () Bool)

(declare-fun e!186499 () Bool)

(declare-fun call!25726 () Bool)

(assert (=> b!295047 (= e!186499 call!25726)))

(declare-fun b!295048 () Bool)

(assert (=> b!295048 (= e!186497 call!25726)))

(declare-fun d!66925 () Bool)

(declare-fun res!155085 () Bool)

(assert (=> d!66925 (=> res!155085 e!186498)))

(assert (=> d!66925 (= res!155085 (bvsge #b00000000000000000000000000000000 (size!7422 a!3312)))))

(assert (=> d!66925 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!186498)))

(declare-fun b!295049 () Bool)

(assert (=> b!295049 (= e!186497 e!186499)))

(declare-fun lt!146286 () (_ BitVec 64))

(assert (=> b!295049 (= lt!146286 (select (arr!7070 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9218 0))(
  ( (Unit!9219) )
))
(declare-fun lt!146285 () Unit!9218)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14913 (_ BitVec 64) (_ BitVec 32)) Unit!9218)

(assert (=> b!295049 (= lt!146285 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!146286 #b00000000000000000000000000000000))))

(assert (=> b!295049 (arrayContainsKey!0 a!3312 lt!146286 #b00000000000000000000000000000000)))

(declare-fun lt!146284 () Unit!9218)

(assert (=> b!295049 (= lt!146284 lt!146285)))

(declare-fun res!155084 () Bool)

(assert (=> b!295049 (= res!155084 (= (seekEntryOrOpen!0 (select (arr!7070 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2219 #b00000000000000000000000000000000)))))

(assert (=> b!295049 (=> (not res!155084) (not e!186499))))

(declare-fun bm!25723 () Bool)

(assert (=> bm!25723 (= call!25726 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(assert (= (and d!66925 (not res!155085)) b!295046))

(assert (= (and b!295046 c!47556) b!295049))

(assert (= (and b!295046 (not c!47556)) b!295048))

(assert (= (and b!295049 res!155084) b!295047))

(assert (= (or b!295047 b!295048) bm!25723))

(assert (=> b!295046 m!308331))

(assert (=> b!295046 m!308331))

(declare-fun m!308337 () Bool)

(assert (=> b!295046 m!308337))

(assert (=> b!295049 m!308331))

(declare-fun m!308339 () Bool)

(assert (=> b!295049 m!308339))

(declare-fun m!308341 () Bool)

(assert (=> b!295049 m!308341))

(assert (=> b!295049 m!308331))

(declare-fun m!308343 () Bool)

(assert (=> b!295049 m!308343))

(declare-fun m!308345 () Bool)

(assert (=> bm!25723 m!308345))

(assert (=> b!294929 d!66925))

(declare-fun d!66933 () Bool)

(assert (=> d!66933 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!294927 d!66933))

(declare-fun d!66935 () Bool)

(assert (=> d!66935 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29020 d!66935))

(declare-fun d!66939 () Bool)

(assert (=> d!66939 (= (array_inv!5033 a!3312) (bvsge (size!7422 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29020 d!66939))

(declare-fun b!295129 () Bool)

(declare-fun lt!146314 () SeekEntryResult!2219)

(assert (=> b!295129 (and (bvsge (index!11048 lt!146314) #b00000000000000000000000000000000) (bvslt (index!11048 lt!146314) (size!7422 (array!14914 (store (arr!7070 a!3312) i!1256 k!2524) (size!7422 a!3312)))))))

(declare-fun res!155112 () Bool)

(assert (=> b!295129 (= res!155112 (= (select (arr!7070 (array!14914 (store (arr!7070 a!3312) i!1256 k!2524) (size!7422 a!3312))) (index!11048 lt!146314)) k!2524))))

(declare-fun e!186547 () Bool)

(assert (=> b!295129 (=> res!155112 e!186547)))

(declare-fun e!186545 () Bool)

(assert (=> b!295129 (= e!186545 e!186547)))

(declare-fun b!295130 () Bool)

(declare-fun e!186546 () SeekEntryResult!2219)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295130 (= e!186546 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146208 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14914 (store (arr!7070 a!3312) i!1256 k!2524) (size!7422 a!3312)) mask!3809))))

(declare-fun b!295131 () Bool)

(assert (=> b!295131 (and (bvsge (index!11048 lt!146314) #b00000000000000000000000000000000) (bvslt (index!11048 lt!146314) (size!7422 (array!14914 (store (arr!7070 a!3312) i!1256 k!2524) (size!7422 a!3312)))))))

(assert (=> b!295131 (= e!186547 (= (select (arr!7070 (array!14914 (store (arr!7070 a!3312) i!1256 k!2524) (size!7422 a!3312))) (index!11048 lt!146314)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!295132 () Bool)

(assert (=> b!295132 (and (bvsge (index!11048 lt!146314) #b00000000000000000000000000000000) (bvslt (index!11048 lt!146314) (size!7422 (array!14914 (store (arr!7070 a!3312) i!1256 k!2524) (size!7422 a!3312)))))))

(declare-fun res!155113 () Bool)

(assert (=> b!295132 (= res!155113 (= (select (arr!7070 (array!14914 (store (arr!7070 a!3312) i!1256 k!2524) (size!7422 a!3312))) (index!11048 lt!146314)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!295132 (=> res!155113 e!186547)))

(declare-fun b!295128 () Bool)

(declare-fun e!186549 () SeekEntryResult!2219)

(assert (=> b!295128 (= e!186549 e!186546)))

(declare-fun c!47584 () Bool)

(declare-fun lt!146315 () (_ BitVec 64))

(assert (=> b!295128 (= c!47584 (or (= lt!146315 k!2524) (= (bvadd lt!146315 lt!146315) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!66943 () Bool)

(declare-fun e!186548 () Bool)

(assert (=> d!66943 e!186548))

(declare-fun c!47585 () Bool)

(assert (=> d!66943 (= c!47585 (and (is-Intermediate!2219 lt!146314) (undefined!3031 lt!146314)))))

(assert (=> d!66943 (= lt!146314 e!186549)))

(declare-fun c!47586 () Bool)

(assert (=> d!66943 (= c!47586 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66943 (= lt!146315 (select (arr!7070 (array!14914 (store (arr!7070 a!3312) i!1256 k!2524) (size!7422 a!3312))) lt!146208))))

(assert (=> d!66943 (validMask!0 mask!3809)))

(assert (=> d!66943 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146208 k!2524 (array!14914 (store (arr!7070 a!3312) i!1256 k!2524) (size!7422 a!3312)) mask!3809) lt!146314)))

(declare-fun b!295133 () Bool)

(assert (=> b!295133 (= e!186548 e!186545)))

(declare-fun res!155111 () Bool)

(assert (=> b!295133 (= res!155111 (and (is-Intermediate!2219 lt!146314) (not (undefined!3031 lt!146314)) (bvslt (x!29259 lt!146314) #b01111111111111111111111111111110) (bvsge (x!29259 lt!146314) #b00000000000000000000000000000000) (bvsge (x!29259 lt!146314) #b00000000000000000000000000000000)))))

(assert (=> b!295133 (=> (not res!155111) (not e!186545))))

(declare-fun b!295134 () Bool)

(assert (=> b!295134 (= e!186549 (Intermediate!2219 true lt!146208 #b00000000000000000000000000000000))))

(declare-fun b!295135 () Bool)

(assert (=> b!295135 (= e!186546 (Intermediate!2219 false lt!146208 #b00000000000000000000000000000000))))

(declare-fun b!295136 () Bool)

(assert (=> b!295136 (= e!186548 (bvsge (x!29259 lt!146314) #b01111111111111111111111111111110))))

(assert (= (and d!66943 c!47586) b!295134))

(assert (= (and d!66943 (not c!47586)) b!295128))

(assert (= (and b!295128 c!47584) b!295135))

(assert (= (and b!295128 (not c!47584)) b!295130))

(assert (= (and d!66943 c!47585) b!295136))

(assert (= (and d!66943 (not c!47585)) b!295133))

(assert (= (and b!295133 res!155111) b!295129))

(assert (= (and b!295129 (not res!155112)) b!295132))

(assert (= (and b!295132 (not res!155113)) b!295131))

(declare-fun m!308375 () Bool)

(assert (=> d!66943 m!308375))

(assert (=> d!66943 m!308217))

(declare-fun m!308377 () Bool)

(assert (=> b!295132 m!308377))

(assert (=> b!295131 m!308377))

(assert (=> b!295129 m!308377))

(declare-fun m!308379 () Bool)

(assert (=> b!295130 m!308379))

(assert (=> b!295130 m!308379))

(declare-fun m!308381 () Bool)

(assert (=> b!295130 m!308381))

(assert (=> b!294926 d!66943))

(declare-fun b!295138 () Bool)

(declare-fun lt!146316 () SeekEntryResult!2219)

(assert (=> b!295138 (and (bvsge (index!11048 lt!146316) #b00000000000000000000000000000000) (bvslt (index!11048 lt!146316) (size!7422 a!3312)))))

(declare-fun res!155115 () Bool)

(assert (=> b!295138 (= res!155115 (= (select (arr!7070 a!3312) (index!11048 lt!146316)) k!2524))))

(declare-fun e!186552 () Bool)

(assert (=> b!295138 (=> res!155115 e!186552)))

(declare-fun e!186550 () Bool)

(assert (=> b!295138 (= e!186550 e!186552)))

(declare-fun e!186551 () SeekEntryResult!2219)

(declare-fun b!295139 () Bool)

(assert (=> b!295139 (= e!186551 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146208 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!295140 () Bool)

(assert (=> b!295140 (and (bvsge (index!11048 lt!146316) #b00000000000000000000000000000000) (bvslt (index!11048 lt!146316) (size!7422 a!3312)))))

(assert (=> b!295140 (= e!186552 (= (select (arr!7070 a!3312) (index!11048 lt!146316)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!295141 () Bool)

(assert (=> b!295141 (and (bvsge (index!11048 lt!146316) #b00000000000000000000000000000000) (bvslt (index!11048 lt!146316) (size!7422 a!3312)))))

(declare-fun res!155116 () Bool)

(assert (=> b!295141 (= res!155116 (= (select (arr!7070 a!3312) (index!11048 lt!146316)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!295141 (=> res!155116 e!186552)))

(declare-fun b!295137 () Bool)

(declare-fun e!186554 () SeekEntryResult!2219)

(assert (=> b!295137 (= e!186554 e!186551)))

(declare-fun c!47587 () Bool)

(declare-fun lt!146317 () (_ BitVec 64))

(assert (=> b!295137 (= c!47587 (or (= lt!146317 k!2524) (= (bvadd lt!146317 lt!146317) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!66953 () Bool)

(declare-fun e!186553 () Bool)

(assert (=> d!66953 e!186553))

(declare-fun c!47588 () Bool)

(assert (=> d!66953 (= c!47588 (and (is-Intermediate!2219 lt!146316) (undefined!3031 lt!146316)))))

(assert (=> d!66953 (= lt!146316 e!186554)))

(declare-fun c!47589 () Bool)

(assert (=> d!66953 (= c!47589 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66953 (= lt!146317 (select (arr!7070 a!3312) lt!146208))))

(assert (=> d!66953 (validMask!0 mask!3809)))

(assert (=> d!66953 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146208 k!2524 a!3312 mask!3809) lt!146316)))

(declare-fun b!295142 () Bool)

(assert (=> b!295142 (= e!186553 e!186550)))

(declare-fun res!155114 () Bool)

(assert (=> b!295142 (= res!155114 (and (is-Intermediate!2219 lt!146316) (not (undefined!3031 lt!146316)) (bvslt (x!29259 lt!146316) #b01111111111111111111111111111110) (bvsge (x!29259 lt!146316) #b00000000000000000000000000000000) (bvsge (x!29259 lt!146316) #b00000000000000000000000000000000)))))

(assert (=> b!295142 (=> (not res!155114) (not e!186550))))

(declare-fun b!295143 () Bool)

(assert (=> b!295143 (= e!186554 (Intermediate!2219 true lt!146208 #b00000000000000000000000000000000))))

(declare-fun b!295144 () Bool)

(assert (=> b!295144 (= e!186551 (Intermediate!2219 false lt!146208 #b00000000000000000000000000000000))))

(declare-fun b!295145 () Bool)

(assert (=> b!295145 (= e!186553 (bvsge (x!29259 lt!146316) #b01111111111111111111111111111110))))

(assert (= (and d!66953 c!47589) b!295143))

(assert (= (and d!66953 (not c!47589)) b!295137))

(assert (= (and b!295137 c!47587) b!295144))

(assert (= (and b!295137 (not c!47587)) b!295139))

(assert (= (and d!66953 c!47588) b!295145))

(assert (= (and d!66953 (not c!47588)) b!295142))

(assert (= (and b!295142 res!155114) b!295138))

(assert (= (and b!295138 (not res!155115)) b!295141))

(assert (= (and b!295141 (not res!155116)) b!295140))

(declare-fun m!308383 () Bool)

(assert (=> d!66953 m!308383))

(assert (=> d!66953 m!308217))

(declare-fun m!308385 () Bool)

(assert (=> b!295141 m!308385))

(assert (=> b!295140 m!308385))

(assert (=> b!295138 m!308385))

(assert (=> b!295139 m!308379))

(assert (=> b!295139 m!308379))

(declare-fun m!308387 () Bool)

(assert (=> b!295139 m!308387))

(assert (=> b!294926 d!66953))

(declare-fun d!66955 () Bool)

(declare-fun lt!146327 () (_ BitVec 32))

(declare-fun lt!146326 () (_ BitVec 32))

(assert (=> d!66955 (= lt!146327 (bvmul (bvxor lt!146326 (bvlshr lt!146326 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66955 (= lt!146326 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66955 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!155117 (let ((h!5287 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29266 (bvmul (bvxor h!5287 (bvlshr h!5287 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29266 (bvlshr x!29266 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!155117 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!155117 #b00000000000000000000000000000000))))))

(assert (=> d!66955 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!146327 (bvlshr lt!146327 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!294926 d!66955))

(push 1)

