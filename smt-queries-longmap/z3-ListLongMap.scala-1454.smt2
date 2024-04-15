; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28010 () Bool)

(assert start!28010)

(declare-fun b!287247 () Bool)

(declare-fun e!181921 () Bool)

(declare-fun e!181923 () Bool)

(assert (=> b!287247 (= e!181921 e!181923)))

(declare-fun res!149189 () Bool)

(assert (=> b!287247 (=> (not res!149189) (not e!181923))))

(declare-datatypes ((SeekEntryResult!1982 0))(
  ( (MissingZero!1982 (index!10098 (_ BitVec 32))) (Found!1982 (index!10099 (_ BitVec 32))) (Intermediate!1982 (undefined!2794 Bool) (index!10100 (_ BitVec 32)) (x!28334 (_ BitVec 32))) (Undefined!1982) (MissingVacant!1982 (index!10101 (_ BitVec 32))) )
))
(declare-fun lt!141309 () SeekEntryResult!1982)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287247 (= res!149189 (or (= lt!141309 (MissingZero!1982 i!1256)) (= lt!141309 (MissingVacant!1982 i!1256))))))

(declare-datatypes ((array!14407 0))(
  ( (array!14408 (arr!6834 (Array (_ BitVec 32) (_ BitVec 64))) (size!7187 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14407)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14407 (_ BitVec 32)) SeekEntryResult!1982)

(assert (=> b!287247 (= lt!141309 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!287248 () Bool)

(declare-fun res!149188 () Bool)

(assert (=> b!287248 (=> (not res!149188) (not e!181921))))

(declare-fun arrayContainsKey!0 (array!14407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287248 (= res!149188 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287249 () Bool)

(declare-fun res!149190 () Bool)

(assert (=> b!287249 (=> (not res!149190) (not e!181921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287249 (= res!149190 (validKeyInArray!0 k0!2524))))

(declare-fun b!287250 () Bool)

(declare-fun res!149186 () Bool)

(assert (=> b!287250 (=> (not res!149186) (not e!181923))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14407 (_ BitVec 32)) Bool)

(assert (=> b!287250 (= res!149186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!149187 () Bool)

(assert (=> start!28010 (=> (not res!149187) (not e!181921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28010 (= res!149187 (validMask!0 mask!3809))))

(assert (=> start!28010 e!181921))

(assert (=> start!28010 true))

(declare-fun array_inv!4806 (array!14407) Bool)

(assert (=> start!28010 (array_inv!4806 a!3312)))

(declare-fun b!287251 () Bool)

(declare-fun res!149191 () Bool)

(assert (=> b!287251 (=> (not res!149191) (not e!181921))))

(assert (=> b!287251 (= res!149191 (and (= (size!7187 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7187 a!3312))))))

(declare-fun b!287252 () Bool)

(declare-fun lt!141307 () (_ BitVec 32))

(assert (=> b!287252 (= e!181923 (and (bvsge mask!3809 #b00000000000000000000000000000000) (or (bvslt lt!141307 #b00000000000000000000000000000000) (bvsge lt!141307 (bvadd #b00000000000000000000000000000001 mask!3809)))))))

(declare-fun lt!141308 () SeekEntryResult!1982)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14407 (_ BitVec 32)) SeekEntryResult!1982)

(assert (=> b!287252 (= lt!141308 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141307 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287252 (= lt!141307 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!28010 res!149187) b!287251))

(assert (= (and b!287251 res!149191) b!287249))

(assert (= (and b!287249 res!149190) b!287248))

(assert (= (and b!287248 res!149188) b!287247))

(assert (= (and b!287247 res!149189) b!287250))

(assert (= (and b!287250 res!149186) b!287252))

(declare-fun m!301235 () Bool)

(assert (=> b!287249 m!301235))

(declare-fun m!301237 () Bool)

(assert (=> b!287248 m!301237))

(declare-fun m!301239 () Bool)

(assert (=> start!28010 m!301239))

(declare-fun m!301241 () Bool)

(assert (=> start!28010 m!301241))

(declare-fun m!301243 () Bool)

(assert (=> b!287247 m!301243))

(declare-fun m!301245 () Bool)

(assert (=> b!287252 m!301245))

(declare-fun m!301247 () Bool)

(assert (=> b!287252 m!301247))

(declare-fun m!301249 () Bool)

(assert (=> b!287250 m!301249))

(check-sat (not b!287247) (not b!287252) (not b!287249) (not b!287248) (not b!287250) (not start!28010))
(check-sat)
(get-model)

(declare-fun d!65949 () Bool)

(declare-fun res!149232 () Bool)

(declare-fun e!181946 () Bool)

(assert (=> d!65949 (=> res!149232 e!181946)))

(assert (=> d!65949 (= res!149232 (= (select (arr!6834 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!65949 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!181946)))

(declare-fun b!287293 () Bool)

(declare-fun e!181947 () Bool)

(assert (=> b!287293 (= e!181946 e!181947)))

(declare-fun res!149233 () Bool)

(assert (=> b!287293 (=> (not res!149233) (not e!181947))))

(assert (=> b!287293 (= res!149233 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7187 a!3312)))))

(declare-fun b!287294 () Bool)

(assert (=> b!287294 (= e!181947 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65949 (not res!149232)) b!287293))

(assert (= (and b!287293 res!149233) b!287294))

(declare-fun m!301283 () Bool)

(assert (=> d!65949 m!301283))

(declare-fun m!301285 () Bool)

(assert (=> b!287294 m!301285))

(assert (=> b!287248 d!65949))

(declare-fun b!287319 () Bool)

(declare-fun e!181962 () SeekEntryResult!1982)

(declare-fun lt!141340 () SeekEntryResult!1982)

(assert (=> b!287319 (= e!181962 (Found!1982 (index!10100 lt!141340)))))

(declare-fun b!287320 () Bool)

(declare-fun e!181960 () SeekEntryResult!1982)

(assert (=> b!287320 (= e!181960 Undefined!1982)))

(declare-fun b!287321 () Bool)

(assert (=> b!287321 (= e!181960 e!181962)))

(declare-fun lt!141341 () (_ BitVec 64))

(assert (=> b!287321 (= lt!141341 (select (arr!6834 a!3312) (index!10100 lt!141340)))))

(declare-fun c!46601 () Bool)

(assert (=> b!287321 (= c!46601 (= lt!141341 k0!2524))))

(declare-fun b!287322 () Bool)

(declare-fun c!46603 () Bool)

(assert (=> b!287322 (= c!46603 (= lt!141341 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!181961 () SeekEntryResult!1982)

(assert (=> b!287322 (= e!181962 e!181961)))

(declare-fun b!287323 () Bool)

(assert (=> b!287323 (= e!181961 (MissingZero!1982 (index!10100 lt!141340)))))

(declare-fun d!65951 () Bool)

(declare-fun lt!141342 () SeekEntryResult!1982)

(get-info :version)

(assert (=> d!65951 (and (or ((_ is Undefined!1982) lt!141342) (not ((_ is Found!1982) lt!141342)) (and (bvsge (index!10099 lt!141342) #b00000000000000000000000000000000) (bvslt (index!10099 lt!141342) (size!7187 a!3312)))) (or ((_ is Undefined!1982) lt!141342) ((_ is Found!1982) lt!141342) (not ((_ is MissingZero!1982) lt!141342)) (and (bvsge (index!10098 lt!141342) #b00000000000000000000000000000000) (bvslt (index!10098 lt!141342) (size!7187 a!3312)))) (or ((_ is Undefined!1982) lt!141342) ((_ is Found!1982) lt!141342) ((_ is MissingZero!1982) lt!141342) (not ((_ is MissingVacant!1982) lt!141342)) (and (bvsge (index!10101 lt!141342) #b00000000000000000000000000000000) (bvslt (index!10101 lt!141342) (size!7187 a!3312)))) (or ((_ is Undefined!1982) lt!141342) (ite ((_ is Found!1982) lt!141342) (= (select (arr!6834 a!3312) (index!10099 lt!141342)) k0!2524) (ite ((_ is MissingZero!1982) lt!141342) (= (select (arr!6834 a!3312) (index!10098 lt!141342)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1982) lt!141342) (= (select (arr!6834 a!3312) (index!10101 lt!141342)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!65951 (= lt!141342 e!181960)))

(declare-fun c!46602 () Bool)

(assert (=> d!65951 (= c!46602 (and ((_ is Intermediate!1982) lt!141340) (undefined!2794 lt!141340)))))

(assert (=> d!65951 (= lt!141340 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!65951 (validMask!0 mask!3809)))

(assert (=> d!65951 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!141342)))

(declare-fun b!287324 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14407 (_ BitVec 32)) SeekEntryResult!1982)

(assert (=> b!287324 (= e!181961 (seekKeyOrZeroReturnVacant!0 (x!28334 lt!141340) (index!10100 lt!141340) (index!10100 lt!141340) k0!2524 a!3312 mask!3809))))

(assert (= (and d!65951 c!46602) b!287320))

(assert (= (and d!65951 (not c!46602)) b!287321))

(assert (= (and b!287321 c!46601) b!287319))

(assert (= (and b!287321 (not c!46601)) b!287322))

(assert (= (and b!287322 c!46603) b!287323))

(assert (= (and b!287322 (not c!46603)) b!287324))

(declare-fun m!301287 () Bool)

(assert (=> b!287321 m!301287))

(assert (=> d!65951 m!301247))

(declare-fun m!301289 () Bool)

(assert (=> d!65951 m!301289))

(declare-fun m!301291 () Bool)

(assert (=> d!65951 m!301291))

(declare-fun m!301293 () Bool)

(assert (=> d!65951 m!301293))

(assert (=> d!65951 m!301239))

(assert (=> d!65951 m!301247))

(declare-fun m!301295 () Bool)

(assert (=> d!65951 m!301295))

(declare-fun m!301297 () Bool)

(assert (=> b!287324 m!301297))

(assert (=> b!287247 d!65951))

(declare-fun d!65957 () Bool)

(assert (=> d!65957 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!287249 d!65957))

(declare-fun b!287366 () Bool)

(declare-fun e!181989 () Bool)

(declare-fun call!25594 () Bool)

(assert (=> b!287366 (= e!181989 call!25594)))

(declare-fun b!287367 () Bool)

(declare-fun e!181987 () Bool)

(declare-fun e!181988 () Bool)

(assert (=> b!287367 (= e!181987 e!181988)))

(declare-fun c!46618 () Bool)

(assert (=> b!287367 (= c!46618 (validKeyInArray!0 (select (arr!6834 a!3312) #b00000000000000000000000000000000)))))

(declare-fun bm!25591 () Bool)

(assert (=> bm!25591 (= call!25594 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!287368 () Bool)

(assert (=> b!287368 (= e!181988 e!181989)))

(declare-fun lt!141358 () (_ BitVec 64))

(assert (=> b!287368 (= lt!141358 (select (arr!6834 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9018 0))(
  ( (Unit!9019) )
))
(declare-fun lt!141359 () Unit!9018)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14407 (_ BitVec 64) (_ BitVec 32)) Unit!9018)

(assert (=> b!287368 (= lt!141359 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!141358 #b00000000000000000000000000000000))))

(assert (=> b!287368 (arrayContainsKey!0 a!3312 lt!141358 #b00000000000000000000000000000000)))

(declare-fun lt!141360 () Unit!9018)

(assert (=> b!287368 (= lt!141360 lt!141359)))

(declare-fun res!149249 () Bool)

(assert (=> b!287368 (= res!149249 (= (seekEntryOrOpen!0 (select (arr!6834 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!1982 #b00000000000000000000000000000000)))))

(assert (=> b!287368 (=> (not res!149249) (not e!181989))))

(declare-fun d!65959 () Bool)

(declare-fun res!149248 () Bool)

(assert (=> d!65959 (=> res!149248 e!181987)))

(assert (=> d!65959 (= res!149248 (bvsge #b00000000000000000000000000000000 (size!7187 a!3312)))))

(assert (=> d!65959 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!181987)))

(declare-fun b!287369 () Bool)

(assert (=> b!287369 (= e!181988 call!25594)))

(assert (= (and d!65959 (not res!149248)) b!287367))

(assert (= (and b!287367 c!46618) b!287368))

(assert (= (and b!287367 (not c!46618)) b!287369))

(assert (= (and b!287368 res!149249) b!287366))

(assert (= (or b!287366 b!287369) bm!25591))

(assert (=> b!287367 m!301283))

(assert (=> b!287367 m!301283))

(declare-fun m!301319 () Bool)

(assert (=> b!287367 m!301319))

(declare-fun m!301321 () Bool)

(assert (=> bm!25591 m!301321))

(assert (=> b!287368 m!301283))

(declare-fun m!301323 () Bool)

(assert (=> b!287368 m!301323))

(declare-fun m!301325 () Bool)

(assert (=> b!287368 m!301325))

(assert (=> b!287368 m!301283))

(declare-fun m!301327 () Bool)

(assert (=> b!287368 m!301327))

(assert (=> b!287250 d!65959))

(declare-fun b!287424 () Bool)

(declare-fun e!182028 () SeekEntryResult!1982)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287424 (= e!182028 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!141307 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun d!65965 () Bool)

(declare-fun e!182025 () Bool)

(assert (=> d!65965 e!182025))

(declare-fun c!46635 () Bool)

(declare-fun lt!141385 () SeekEntryResult!1982)

(assert (=> d!65965 (= c!46635 (and ((_ is Intermediate!1982) lt!141385) (undefined!2794 lt!141385)))))

(declare-fun e!182029 () SeekEntryResult!1982)

(assert (=> d!65965 (= lt!141385 e!182029)))

(declare-fun c!46634 () Bool)

(assert (=> d!65965 (= c!46634 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!141384 () (_ BitVec 64))

(assert (=> d!65965 (= lt!141384 (select (arr!6834 a!3312) lt!141307))))

(assert (=> d!65965 (validMask!0 mask!3809)))

(assert (=> d!65965 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141307 k0!2524 a!3312 mask!3809) lt!141385)))

(declare-fun b!287425 () Bool)

(assert (=> b!287425 (= e!182028 (Intermediate!1982 false lt!141307 #b00000000000000000000000000000000))))

(declare-fun b!287426 () Bool)

(assert (=> b!287426 (= e!182025 (bvsge (x!28334 lt!141385) #b01111111111111111111111111111110))))

(declare-fun b!287427 () Bool)

(assert (=> b!287427 (and (bvsge (index!10100 lt!141385) #b00000000000000000000000000000000) (bvslt (index!10100 lt!141385) (size!7187 a!3312)))))

(declare-fun res!149276 () Bool)

(assert (=> b!287427 (= res!149276 (= (select (arr!6834 a!3312) (index!10100 lt!141385)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!182026 () Bool)

(assert (=> b!287427 (=> res!149276 e!182026)))

(declare-fun b!287428 () Bool)

(assert (=> b!287428 (and (bvsge (index!10100 lt!141385) #b00000000000000000000000000000000) (bvslt (index!10100 lt!141385) (size!7187 a!3312)))))

(assert (=> b!287428 (= e!182026 (= (select (arr!6834 a!3312) (index!10100 lt!141385)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!287429 () Bool)

(assert (=> b!287429 (= e!182029 (Intermediate!1982 true lt!141307 #b00000000000000000000000000000000))))

(declare-fun b!287430 () Bool)

(assert (=> b!287430 (= e!182029 e!182028)))

(declare-fun c!46636 () Bool)

(assert (=> b!287430 (= c!46636 (or (= lt!141384 k0!2524) (= (bvadd lt!141384 lt!141384) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!287431 () Bool)

(assert (=> b!287431 (and (bvsge (index!10100 lt!141385) #b00000000000000000000000000000000) (bvslt (index!10100 lt!141385) (size!7187 a!3312)))))

(declare-fun res!149275 () Bool)

(assert (=> b!287431 (= res!149275 (= (select (arr!6834 a!3312) (index!10100 lt!141385)) k0!2524))))

(assert (=> b!287431 (=> res!149275 e!182026)))

(declare-fun e!182027 () Bool)

(assert (=> b!287431 (= e!182027 e!182026)))

(declare-fun b!287432 () Bool)

(assert (=> b!287432 (= e!182025 e!182027)))

(declare-fun res!149274 () Bool)

(assert (=> b!287432 (= res!149274 (and ((_ is Intermediate!1982) lt!141385) (not (undefined!2794 lt!141385)) (bvslt (x!28334 lt!141385) #b01111111111111111111111111111110) (bvsge (x!28334 lt!141385) #b00000000000000000000000000000000) (bvsge (x!28334 lt!141385) #b00000000000000000000000000000000)))))

(assert (=> b!287432 (=> (not res!149274) (not e!182027))))

(assert (= (and d!65965 c!46634) b!287429))

(assert (= (and d!65965 (not c!46634)) b!287430))

(assert (= (and b!287430 c!46636) b!287425))

(assert (= (and b!287430 (not c!46636)) b!287424))

(assert (= (and d!65965 c!46635) b!287426))

(assert (= (and d!65965 (not c!46635)) b!287432))

(assert (= (and b!287432 res!149274) b!287431))

(assert (= (and b!287431 (not res!149275)) b!287427))

(assert (= (and b!287427 (not res!149276)) b!287428))

(declare-fun m!301343 () Bool)

(assert (=> b!287427 m!301343))

(assert (=> b!287428 m!301343))

(declare-fun m!301345 () Bool)

(assert (=> b!287424 m!301345))

(assert (=> b!287424 m!301345))

(declare-fun m!301347 () Bool)

(assert (=> b!287424 m!301347))

(declare-fun m!301349 () Bool)

(assert (=> d!65965 m!301349))

(assert (=> d!65965 m!301239))

(assert (=> b!287431 m!301343))

(assert (=> b!287252 d!65965))

(declare-fun d!65977 () Bool)

(declare-fun lt!141393 () (_ BitVec 32))

(declare-fun lt!141392 () (_ BitVec 32))

(assert (=> d!65977 (= lt!141393 (bvmul (bvxor lt!141392 (bvlshr lt!141392 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!65977 (= lt!141392 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!65977 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!149277 (let ((h!5222 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28341 (bvmul (bvxor h!5222 (bvlshr h!5222 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28341 (bvlshr x!28341 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!149277 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!149277 #b00000000000000000000000000000000))))))

(assert (=> d!65977 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!141393 (bvlshr lt!141393 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!287252 d!65977))

(declare-fun d!65981 () Bool)

(assert (=> d!65981 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28010 d!65981))

(declare-fun d!65989 () Bool)

(assert (=> d!65989 (= (array_inv!4806 a!3312) (bvsge (size!7187 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28010 d!65989))

(check-sat (not d!65965) (not b!287368) (not d!65951) (not b!287294) (not b!287324) (not bm!25591) (not b!287424) (not b!287367))
(check-sat)
