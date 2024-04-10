; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28014 () Bool)

(assert start!28014)

(declare-fun b!287394 () Bool)

(declare-fun res!149281 () Bool)

(declare-fun e!182024 () Bool)

(assert (=> b!287394 (=> (not res!149281) (not e!182024))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287394 (= res!149281 (validKeyInArray!0 k!2524))))

(declare-fun res!149284 () Bool)

(assert (=> start!28014 (=> (not res!149284) (not e!182024))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28014 (= res!149284 (validMask!0 mask!3809))))

(assert (=> start!28014 e!182024))

(assert (=> start!28014 true))

(declare-datatypes ((array!14418 0))(
  ( (array!14419 (arr!6839 (Array (_ BitVec 32) (_ BitVec 64))) (size!7191 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14418)

(declare-fun array_inv!4802 (array!14418) Bool)

(assert (=> start!28014 (array_inv!4802 a!3312)))

(declare-fun b!287395 () Bool)

(declare-fun res!149282 () Bool)

(declare-fun e!182023 () Bool)

(assert (=> b!287395 (=> (not res!149282) (not e!182023))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14418 (_ BitVec 32)) Bool)

(assert (=> b!287395 (= res!149282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287396 () Bool)

(assert (=> b!287396 (= e!182024 e!182023)))

(declare-fun res!149283 () Bool)

(assert (=> b!287396 (=> (not res!149283) (not e!182023))))

(declare-datatypes ((SeekEntryResult!1988 0))(
  ( (MissingZero!1988 (index!10122 (_ BitVec 32))) (Found!1988 (index!10123 (_ BitVec 32))) (Intermediate!1988 (undefined!2800 Bool) (index!10124 (_ BitVec 32)) (x!28341 (_ BitVec 32))) (Undefined!1988) (MissingVacant!1988 (index!10125 (_ BitVec 32))) )
))
(declare-fun lt!141489 () SeekEntryResult!1988)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287396 (= res!149283 (or (= lt!141489 (MissingZero!1988 i!1256)) (= lt!141489 (MissingVacant!1988 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14418 (_ BitVec 32)) SeekEntryResult!1988)

(assert (=> b!287396 (= lt!141489 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!287397 () Bool)

(declare-fun res!149286 () Bool)

(assert (=> b!287397 (=> (not res!149286) (not e!182024))))

(assert (=> b!287397 (= res!149286 (and (= (size!7191 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7191 a!3312))))))

(declare-fun b!287398 () Bool)

(declare-fun res!149285 () Bool)

(assert (=> b!287398 (=> (not res!149285) (not e!182024))))

(declare-fun arrayContainsKey!0 (array!14418 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287398 (= res!149285 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287399 () Bool)

(declare-fun lt!141490 () (_ BitVec 32))

(assert (=> b!287399 (= e!182023 (and (bvsge mask!3809 #b00000000000000000000000000000000) (or (bvslt lt!141490 #b00000000000000000000000000000000) (bvsge lt!141490 (bvadd #b00000000000000000000000000000001 mask!3809)))))))

(declare-fun lt!141488 () SeekEntryResult!1988)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14418 (_ BitVec 32)) SeekEntryResult!1988)

(assert (=> b!287399 (= lt!141488 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141490 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287399 (= lt!141490 (toIndex!0 k!2524 mask!3809))))

(assert (= (and start!28014 res!149284) b!287397))

(assert (= (and b!287397 res!149286) b!287394))

(assert (= (and b!287394 res!149281) b!287398))

(assert (= (and b!287398 res!149285) b!287396))

(assert (= (and b!287396 res!149283) b!287395))

(assert (= (and b!287395 res!149282) b!287399))

(declare-fun m!301827 () Bool)

(assert (=> b!287394 m!301827))

(declare-fun m!301829 () Bool)

(assert (=> b!287396 m!301829))

(declare-fun m!301831 () Bool)

(assert (=> b!287395 m!301831))

(declare-fun m!301833 () Bool)

(assert (=> start!28014 m!301833))

(declare-fun m!301835 () Bool)

(assert (=> start!28014 m!301835))

(declare-fun m!301837 () Bool)

(assert (=> b!287399 m!301837))

(declare-fun m!301839 () Bool)

(assert (=> b!287399 m!301839))

(declare-fun m!301841 () Bool)

(assert (=> b!287398 m!301841))

(push 1)

(assert (not b!287398))

(assert (not b!287394))

(assert (not start!28014))

(assert (not b!287396))

(assert (not b!287399))

(assert (not b!287395))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66105 () Bool)

(declare-fun res!149327 () Bool)

(declare-fun e!182047 () Bool)

(assert (=> d!66105 (=> res!149327 e!182047)))

(assert (=> d!66105 (= res!149327 (= (select (arr!6839 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66105 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!182047)))

(declare-fun b!287440 () Bool)

(declare-fun e!182048 () Bool)

(assert (=> b!287440 (= e!182047 e!182048)))

(declare-fun res!149328 () Bool)

(assert (=> b!287440 (=> (not res!149328) (not e!182048))))

(assert (=> b!287440 (= res!149328 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7191 a!3312)))))

(declare-fun b!287441 () Bool)

(assert (=> b!287441 (= e!182048 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66105 (not res!149327)) b!287440))

(assert (= (and b!287440 res!149328) b!287441))

(declare-fun m!301875 () Bool)

(assert (=> d!66105 m!301875))

(declare-fun m!301877 () Bool)

(assert (=> b!287441 m!301877))

(assert (=> b!287398 d!66105))

(declare-fun d!66111 () Bool)

(assert (=> d!66111 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28014 d!66111))

(declare-fun d!66113 () Bool)

(assert (=> d!66113 (= (array_inv!4802 a!3312) (bvsge (size!7191 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28014 d!66113))

(declare-fun b!287492 () Bool)

(declare-fun e!182083 () SeekEntryResult!1988)

(declare-fun e!182084 () SeekEntryResult!1988)

(assert (=> b!287492 (= e!182083 e!182084)))

(declare-fun c!46633 () Bool)

(declare-fun lt!141529 () (_ BitVec 64))

(assert (=> b!287492 (= c!46633 (or (= lt!141529 k!2524) (= (bvadd lt!141529 lt!141529) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!287493 () Bool)

(declare-fun e!182080 () Bool)

(declare-fun lt!141528 () SeekEntryResult!1988)

(assert (=> b!287493 (= e!182080 (bvsge (x!28341 lt!141528) #b01111111111111111111111111111110))))

(declare-fun b!287494 () Bool)

(assert (=> b!287494 (and (bvsge (index!10124 lt!141528) #b00000000000000000000000000000000) (bvslt (index!10124 lt!141528) (size!7191 a!3312)))))

(declare-fun e!182081 () Bool)

(assert (=> b!287494 (= e!182081 (= (select (arr!6839 a!3312) (index!10124 lt!141528)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!66115 () Bool)

(assert (=> d!66115 e!182080))

(declare-fun c!46632 () Bool)

(assert (=> d!66115 (= c!46632 (and (is-Intermediate!1988 lt!141528) (undefined!2800 lt!141528)))))

(assert (=> d!66115 (= lt!141528 e!182083)))

(declare-fun c!46634 () Bool)

(assert (=> d!66115 (= c!46634 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66115 (= lt!141529 (select (arr!6839 a!3312) lt!141490))))

(assert (=> d!66115 (validMask!0 mask!3809)))

(assert (=> d!66115 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141490 k!2524 a!3312 mask!3809) lt!141528)))

(declare-fun b!287495 () Bool)

(assert (=> b!287495 (and (bvsge (index!10124 lt!141528) #b00000000000000000000000000000000) (bvslt (index!10124 lt!141528) (size!7191 a!3312)))))

(declare-fun res!149346 () Bool)

(assert (=> b!287495 (= res!149346 (= (select (arr!6839 a!3312) (index!10124 lt!141528)) k!2524))))

(assert (=> b!287495 (=> res!149346 e!182081)))

(declare-fun e!182082 () Bool)

(assert (=> b!287495 (= e!182082 e!182081)))

(declare-fun b!287496 () Bool)

(assert (=> b!287496 (= e!182084 (Intermediate!1988 false lt!141490 #b00000000000000000000000000000000))))

(declare-fun b!287497 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287497 (= e!182084 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!141490 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!287498 () Bool)

(assert (=> b!287498 (and (bvsge (index!10124 lt!141528) #b00000000000000000000000000000000) (bvslt (index!10124 lt!141528) (size!7191 a!3312)))))

(declare-fun res!149345 () Bool)

(assert (=> b!287498 (= res!149345 (= (select (arr!6839 a!3312) (index!10124 lt!141528)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!287498 (=> res!149345 e!182081)))

(declare-fun b!287499 () Bool)

(assert (=> b!287499 (= e!182083 (Intermediate!1988 true lt!141490 #b00000000000000000000000000000000))))

(declare-fun b!287500 () Bool)

(assert (=> b!287500 (= e!182080 e!182082)))

(declare-fun res!149347 () Bool)

(assert (=> b!287500 (= res!149347 (and (is-Intermediate!1988 lt!141528) (not (undefined!2800 lt!141528)) (bvslt (x!28341 lt!141528) #b01111111111111111111111111111110) (bvsge (x!28341 lt!141528) #b00000000000000000000000000000000) (bvsge (x!28341 lt!141528) #b00000000000000000000000000000000)))))

(assert (=> b!287500 (=> (not res!149347) (not e!182082))))

(assert (= (and d!66115 c!46634) b!287499))

(assert (= (and d!66115 (not c!46634)) b!287492))

(assert (= (and b!287492 c!46633) b!287496))

(assert (= (and b!287492 (not c!46633)) b!287497))

(assert (= (and d!66115 c!46632) b!287493))

(assert (= (and d!66115 (not c!46632)) b!287500))

(assert (= (and b!287500 res!149347) b!287495))

(assert (= (and b!287495 (not res!149346)) b!287498))

(assert (= (and b!287498 (not res!149345)) b!287494))

(declare-fun m!301895 () Bool)

(assert (=> d!66115 m!301895))

(assert (=> d!66115 m!301833))

(declare-fun m!301897 () Bool)

(assert (=> b!287498 m!301897))

(declare-fun m!301899 () Bool)

(assert (=> b!287497 m!301899))

(assert (=> b!287497 m!301899))

(declare-fun m!301901 () Bool)

(assert (=> b!287497 m!301901))

(assert (=> b!287495 m!301897))

(assert (=> b!287494 m!301897))

(assert (=> b!287399 d!66115))

(declare-fun d!66123 () Bool)

(declare-fun lt!141538 () (_ BitVec 32))

(declare-fun lt!141537 () (_ BitVec 32))

(assert (=> d!66123 (= lt!141538 (bvmul (bvxor lt!141537 (bvlshr lt!141537 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66123 (= lt!141537 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66123 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!149350 (let ((h!5253 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28345 (bvmul (bvxor h!5253 (bvlshr h!5253 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28345 (bvlshr x!28345 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!149350 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!149350 #b00000000000000000000000000000000))))))

(assert (=> d!66123 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!141538 (bvlshr lt!141538 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!287399 d!66123))

(declare-fun d!66127 () Bool)

(assert (=> d!66127 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!287394 d!66127))

(declare-fun b!287531 () Bool)

(declare-fun e!182104 () Bool)

(declare-fun call!25621 () Bool)

(assert (=> b!287531 (= e!182104 call!25621)))

(declare-fun b!287532 () Bool)

(declare-fun e!182105 () Bool)

(assert (=> b!287532 (= e!182105 call!25621)))

(declare-fun b!287533 () Bool)

(assert (=> b!287533 (= e!182105 e!182104)))

(declare-fun lt!141549 () (_ BitVec 64))

(assert (=> b!287533 (= lt!141549 (select (arr!6839 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9070 0))(
  ( (Unit!9071) )
))
(declare-fun lt!141550 () Unit!9070)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14418 (_ BitVec 64) (_ BitVec 32)) Unit!9070)

(assert (=> b!287533 (= lt!141550 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!141549 #b00000000000000000000000000000000))))

(assert (=> b!287533 (arrayContainsKey!0 a!3312 lt!141549 #b00000000000000000000000000000000)))

(declare-fun lt!141551 () Unit!9070)

(assert (=> b!287533 (= lt!141551 lt!141550)))

(declare-fun res!149361 () Bool)

(assert (=> b!287533 (= res!149361 (= (seekEntryOrOpen!0 (select (arr!6839 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!1988 #b00000000000000000000000000000000)))))

(assert (=> b!287533 (=> (not res!149361) (not e!182104))))

(declare-fun d!66129 () Bool)

(declare-fun res!149362 () Bool)

(declare-fun e!182106 () Bool)

(assert (=> d!66129 (=> res!149362 e!182106)))

(assert (=> d!66129 (= res!149362 (bvsge #b00000000000000000000000000000000 (size!7191 a!3312)))))

(assert (=> d!66129 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!182106)))

(declare-fun b!287534 () Bool)

(assert (=> b!287534 (= e!182106 e!182105)))

(declare-fun c!46644 () Bool)

(assert (=> b!287534 (= c!46644 (validKeyInArray!0 (select (arr!6839 a!3312) #b00000000000000000000000000000000)))))

(declare-fun bm!25618 () Bool)

(assert (=> bm!25618 (= call!25621 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(assert (= (and d!66129 (not res!149362)) b!287534))

(assert (= (and b!287534 c!46644) b!287533))

(assert (= (and b!287534 (not c!46644)) b!287532))

(assert (= (and b!287533 res!149361) b!287531))

(assert (= (or b!287531 b!287532) bm!25618))

(assert (=> b!287533 m!301875))

(declare-fun m!301913 () Bool)

(assert (=> b!287533 m!301913))

(declare-fun m!301915 () Bool)

(assert (=> b!287533 m!301915))

(assert (=> b!287533 m!301875))

(declare-fun m!301917 () Bool)

(assert (=> b!287533 m!301917))

(assert (=> b!287534 m!301875))

(assert (=> b!287534 m!301875))

(declare-fun m!301919 () Bool)

(assert (=> b!287534 m!301919))

(declare-fun m!301921 () Bool)

(assert (=> bm!25618 m!301921))

(assert (=> b!287395 d!66129))

(declare-fun b!287583 () Bool)

(declare-fun lt!141574 () SeekEntryResult!1988)

(declare-fun e!182133 () SeekEntryResult!1988)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14418 (_ BitVec 32)) SeekEntryResult!1988)

(assert (=> b!287583 (= e!182133 (seekKeyOrZeroReturnVacant!0 (x!28341 lt!141574) (index!10124 lt!141574) (index!10124 lt!141574) k!2524 a!3312 mask!3809))))

(declare-fun d!66135 () Bool)

(declare-fun lt!141572 () SeekEntryResult!1988)

(assert (=> d!66135 (and (or (is-Undefined!1988 lt!141572) (not (is-Found!1988 lt!141572)) (and (bvsge (index!10123 lt!141572) #b00000000000000000000000000000000) (bvslt (index!10123 lt!141572) (size!7191 a!3312)))) (or (is-Undefined!1988 lt!141572) (is-Found!1988 lt!141572) (not (is-MissingZero!1988 lt!141572)) (and (bvsge (index!10122 lt!141572) #b00000000000000000000000000000000) (bvslt (index!10122 lt!141572) (size!7191 a!3312)))) (or (is-Undefined!1988 lt!141572) (is-Found!1988 lt!141572) (is-MissingZero!1988 lt!141572) (not (is-MissingVacant!1988 lt!141572)) (and (bvsge (index!10125 lt!141572) #b00000000000000000000000000000000) (bvslt (index!10125 lt!141572) (size!7191 a!3312)))) (or (is-Undefined!1988 lt!141572) (ite (is-Found!1988 lt!141572) (= (select (arr!6839 a!3312) (index!10123 lt!141572)) k!2524) (ite (is-MissingZero!1988 lt!141572) (= (select (arr!6839 a!3312) (index!10122 lt!141572)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1988 lt!141572) (= (select (arr!6839 a!3312) (index!10125 lt!141572)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!182134 () SeekEntryResult!1988)

(assert (=> d!66135 (= lt!141572 e!182134)))

(declare-fun c!46664 () Bool)

(assert (=> d!66135 (= c!46664 (and (is-Intermediate!1988 lt!141574) (undefined!2800 lt!141574)))))

(assert (=> d!66135 (= lt!141574 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66135 (validMask!0 mask!3809)))

(assert (=> d!66135 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!141572)))

(declare-fun b!287584 () Bool)

(assert (=> b!287584 (= e!182133 (MissingZero!1988 (index!10124 lt!141574)))))

(declare-fun b!287585 () Bool)

(declare-fun e!182135 () SeekEntryResult!1988)

(assert (=> b!287585 (= e!182135 (Found!1988 (index!10124 lt!141574)))))

(declare-fun b!287586 () Bool)

(assert (=> b!287586 (= e!182134 e!182135)))

(declare-fun lt!141573 () (_ BitVec 64))

(assert (=> b!287586 (= lt!141573 (select (arr!6839 a!3312) (index!10124 lt!141574)))))

(declare-fun c!46663 () Bool)

(assert (=> b!287586 (= c!46663 (= lt!141573 k!2524))))

(declare-fun b!287587 () Bool)

(declare-fun c!46665 () Bool)

(assert (=> b!287587 (= c!46665 (= lt!141573 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!287587 (= e!182135 e!182133)))

(declare-fun b!287588 () Bool)

(assert (=> b!287588 (= e!182134 Undefined!1988)))

(assert (= (and d!66135 c!46664) b!287588))

(assert (= (and d!66135 (not c!46664)) b!287586))

(assert (= (and b!287586 c!46663) b!287585))

(assert (= (and b!287586 (not c!46663)) b!287587))

(assert (= (and b!287587 c!46665) b!287584))

(assert (= (and b!287587 (not c!46665)) b!287583))

(declare-fun m!301939 () Bool)

(assert (=> b!287583 m!301939))

(declare-fun m!301941 () Bool)

(assert (=> d!66135 m!301941))

(declare-fun m!301943 () Bool)

(assert (=> d!66135 m!301943))

(declare-fun m!301945 () Bool)

(assert (=> d!66135 m!301945))

(assert (=> d!66135 m!301833))

(assert (=> d!66135 m!301839))

(assert (=> d!66135 m!301839))

(declare-fun m!301947 () Bool)

(assert (=> d!66135 m!301947))

(declare-fun m!301949 () Bool)

(assert (=> b!287586 m!301949))

(assert (=> b!287396 d!66135))

(push 1)

(assert (not b!287583))

(assert (not d!66115))

(assert (not bm!25618))

(assert (not b!287534))

(assert (not b!287533))

(assert (not d!66135))

(assert (not b!287441))

(assert (not b!287497))

(check-sat)

(pop 1)

(push 1)

(check-sat)

