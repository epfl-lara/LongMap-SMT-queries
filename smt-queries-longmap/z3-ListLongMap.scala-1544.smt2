; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29196 () Bool)

(assert start!29196)

(declare-fun b!296302 () Bool)

(declare-fun e!187274 () Bool)

(declare-datatypes ((SeekEntryResult!2259 0))(
  ( (MissingZero!2259 (index!11206 (_ BitVec 32))) (Found!2259 (index!11207 (_ BitVec 32))) (Intermediate!2259 (undefined!3071 Bool) (index!11208 (_ BitVec 32)) (x!29415 (_ BitVec 32))) (Undefined!2259) (MissingVacant!2259 (index!11209 (_ BitVec 32))) )
))
(declare-fun lt!147116 () SeekEntryResult!2259)

(assert (=> b!296302 (= e!187274 (not (or (not (= lt!147116 (Intermediate!2259 false (index!11208 lt!147116) (x!29415 lt!147116)))) (bvsle #b00000000000000000000000000000000 (x!29415 lt!147116)))))))

(declare-datatypes ((array!14999 0))(
  ( (array!15000 (arr!7110 (Array (_ BitVec 32) (_ BitVec 64))) (size!7462 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14999)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!296302 (and (= (select (arr!7110 a!3312) (index!11208 lt!147116)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11208 lt!147116) i!1256))))

(declare-fun b!296303 () Bool)

(declare-fun e!187275 () Bool)

(assert (=> b!296303 (= e!187275 e!187274)))

(declare-fun res!156115 () Bool)

(assert (=> b!296303 (=> (not res!156115) (not e!187274))))

(declare-fun lt!147117 () Bool)

(declare-fun k0!2524 () (_ BitVec 64))

(assert (=> b!296303 (= res!156115 (and (or lt!147117 (not (undefined!3071 lt!147116))) (or lt!147117 (not (= (select (arr!7110 a!3312) (index!11208 lt!147116)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147117 (not (= (select (arr!7110 a!3312) (index!11208 lt!147116)) k0!2524))) (not lt!147117)))))

(get-info :version)

(assert (=> b!296303 (= lt!147117 (not ((_ is Intermediate!2259) lt!147116)))))

(declare-fun b!296304 () Bool)

(declare-fun res!156114 () Bool)

(declare-fun e!187273 () Bool)

(assert (=> b!296304 (=> (not res!156114) (not e!187273))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14999 (_ BitVec 32)) Bool)

(assert (=> b!296304 (= res!156114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296305 () Bool)

(assert (=> b!296305 (= e!187273 e!187275)))

(declare-fun res!156116 () Bool)

(assert (=> b!296305 (=> (not res!156116) (not e!187275))))

(declare-fun lt!147114 () Bool)

(assert (=> b!296305 (= res!156116 lt!147114)))

(declare-fun lt!147112 () SeekEntryResult!2259)

(declare-fun lt!147115 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14999 (_ BitVec 32)) SeekEntryResult!2259)

(assert (=> b!296305 (= lt!147112 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147115 k0!2524 (array!15000 (store (arr!7110 a!3312) i!1256 k0!2524) (size!7462 a!3312)) mask!3809))))

(assert (=> b!296305 (= lt!147116 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147115 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296305 (= lt!147115 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!296306 () Bool)

(declare-fun e!187276 () Bool)

(assert (=> b!296306 (= e!187276 e!187273)))

(declare-fun res!156110 () Bool)

(assert (=> b!296306 (=> (not res!156110) (not e!187273))))

(declare-fun lt!147113 () SeekEntryResult!2259)

(assert (=> b!296306 (= res!156110 (or lt!147114 (= lt!147113 (MissingVacant!2259 i!1256))))))

(assert (=> b!296306 (= lt!147114 (= lt!147113 (MissingZero!2259 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14999 (_ BitVec 32)) SeekEntryResult!2259)

(assert (=> b!296306 (= lt!147113 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!156112 () Bool)

(assert (=> start!29196 (=> (not res!156112) (not e!187276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29196 (= res!156112 (validMask!0 mask!3809))))

(assert (=> start!29196 e!187276))

(assert (=> start!29196 true))

(declare-fun array_inv!5073 (array!14999) Bool)

(assert (=> start!29196 (array_inv!5073 a!3312)))

(declare-fun b!296307 () Bool)

(declare-fun res!156117 () Bool)

(assert (=> b!296307 (=> (not res!156117) (not e!187276))))

(declare-fun arrayContainsKey!0 (array!14999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296307 (= res!156117 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!296308 () Bool)

(declare-fun res!156113 () Bool)

(assert (=> b!296308 (=> (not res!156113) (not e!187276))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296308 (= res!156113 (validKeyInArray!0 k0!2524))))

(declare-fun b!296309 () Bool)

(declare-fun res!156111 () Bool)

(assert (=> b!296309 (=> (not res!156111) (not e!187276))))

(assert (=> b!296309 (= res!156111 (and (= (size!7462 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7462 a!3312))))))

(assert (= (and start!29196 res!156112) b!296309))

(assert (= (and b!296309 res!156111) b!296308))

(assert (= (and b!296308 res!156113) b!296307))

(assert (= (and b!296307 res!156117) b!296306))

(assert (= (and b!296306 res!156110) b!296304))

(assert (= (and b!296304 res!156114) b!296305))

(assert (= (and b!296305 res!156116) b!296303))

(assert (= (and b!296303 res!156115) b!296302))

(declare-fun m!309337 () Bool)

(assert (=> b!296308 m!309337))

(declare-fun m!309339 () Bool)

(assert (=> b!296304 m!309339))

(declare-fun m!309341 () Bool)

(assert (=> b!296307 m!309341))

(declare-fun m!309343 () Bool)

(assert (=> b!296302 m!309343))

(declare-fun m!309345 () Bool)

(assert (=> b!296306 m!309345))

(assert (=> b!296303 m!309343))

(declare-fun m!309347 () Bool)

(assert (=> b!296305 m!309347))

(declare-fun m!309349 () Bool)

(assert (=> b!296305 m!309349))

(declare-fun m!309351 () Bool)

(assert (=> b!296305 m!309351))

(declare-fun m!309353 () Bool)

(assert (=> b!296305 m!309353))

(declare-fun m!309355 () Bool)

(assert (=> start!29196 m!309355))

(declare-fun m!309357 () Bool)

(assert (=> start!29196 m!309357))

(check-sat (not b!296304) (not b!296306) (not b!296305) (not start!29196) (not b!296308) (not b!296307))
(check-sat)
(get-model)

(declare-fun b!296360 () Bool)

(declare-fun e!187308 () SeekEntryResult!2259)

(assert (=> b!296360 (= e!187308 (Intermediate!2259 false lt!147115 #b00000000000000000000000000000000))))

(declare-fun b!296361 () Bool)

(declare-fun e!187311 () Bool)

(declare-fun lt!147147 () SeekEntryResult!2259)

(assert (=> b!296361 (= e!187311 (bvsge (x!29415 lt!147147) #b01111111111111111111111111111110))))

(declare-fun b!296362 () Bool)

(declare-fun e!187309 () SeekEntryResult!2259)

(assert (=> b!296362 (= e!187309 (Intermediate!2259 true lt!147115 #b00000000000000000000000000000000))))

(declare-fun b!296363 () Bool)

(assert (=> b!296363 (and (bvsge (index!11208 lt!147147) #b00000000000000000000000000000000) (bvslt (index!11208 lt!147147) (size!7462 (array!15000 (store (arr!7110 a!3312) i!1256 k0!2524) (size!7462 a!3312)))))))

(declare-fun res!156154 () Bool)

(assert (=> b!296363 (= res!156154 (= (select (arr!7110 (array!15000 (store (arr!7110 a!3312) i!1256 k0!2524) (size!7462 a!3312))) (index!11208 lt!147147)) k0!2524))))

(declare-fun e!187310 () Bool)

(assert (=> b!296363 (=> res!156154 e!187310)))

(declare-fun e!187312 () Bool)

(assert (=> b!296363 (= e!187312 e!187310)))

(declare-fun b!296364 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296364 (= e!187308 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147115 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!15000 (store (arr!7110 a!3312) i!1256 k0!2524) (size!7462 a!3312)) mask!3809))))

(declare-fun d!67041 () Bool)

(assert (=> d!67041 e!187311))

(declare-fun c!47682 () Bool)

(assert (=> d!67041 (= c!47682 (and ((_ is Intermediate!2259) lt!147147) (undefined!3071 lt!147147)))))

(assert (=> d!67041 (= lt!147147 e!187309)))

(declare-fun c!47683 () Bool)

(assert (=> d!67041 (= c!47683 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!147146 () (_ BitVec 64))

(assert (=> d!67041 (= lt!147146 (select (arr!7110 (array!15000 (store (arr!7110 a!3312) i!1256 k0!2524) (size!7462 a!3312))) lt!147115))))

(assert (=> d!67041 (validMask!0 mask!3809)))

(assert (=> d!67041 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147115 k0!2524 (array!15000 (store (arr!7110 a!3312) i!1256 k0!2524) (size!7462 a!3312)) mask!3809) lt!147147)))

(declare-fun b!296365 () Bool)

(assert (=> b!296365 (= e!187311 e!187312)))

(declare-fun res!156152 () Bool)

(assert (=> b!296365 (= res!156152 (and ((_ is Intermediate!2259) lt!147147) (not (undefined!3071 lt!147147)) (bvslt (x!29415 lt!147147) #b01111111111111111111111111111110) (bvsge (x!29415 lt!147147) #b00000000000000000000000000000000) (bvsge (x!29415 lt!147147) #b00000000000000000000000000000000)))))

(assert (=> b!296365 (=> (not res!156152) (not e!187312))))

(declare-fun b!296366 () Bool)

(assert (=> b!296366 (= e!187309 e!187308)))

(declare-fun c!47684 () Bool)

(assert (=> b!296366 (= c!47684 (or (= lt!147146 k0!2524) (= (bvadd lt!147146 lt!147146) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!296367 () Bool)

(assert (=> b!296367 (and (bvsge (index!11208 lt!147147) #b00000000000000000000000000000000) (bvslt (index!11208 lt!147147) (size!7462 (array!15000 (store (arr!7110 a!3312) i!1256 k0!2524) (size!7462 a!3312)))))))

(declare-fun res!156153 () Bool)

(assert (=> b!296367 (= res!156153 (= (select (arr!7110 (array!15000 (store (arr!7110 a!3312) i!1256 k0!2524) (size!7462 a!3312))) (index!11208 lt!147147)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!296367 (=> res!156153 e!187310)))

(declare-fun b!296368 () Bool)

(assert (=> b!296368 (and (bvsge (index!11208 lt!147147) #b00000000000000000000000000000000) (bvslt (index!11208 lt!147147) (size!7462 (array!15000 (store (arr!7110 a!3312) i!1256 k0!2524) (size!7462 a!3312)))))))

(assert (=> b!296368 (= e!187310 (= (select (arr!7110 (array!15000 (store (arr!7110 a!3312) i!1256 k0!2524) (size!7462 a!3312))) (index!11208 lt!147147)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!67041 c!47683) b!296362))

(assert (= (and d!67041 (not c!47683)) b!296366))

(assert (= (and b!296366 c!47684) b!296360))

(assert (= (and b!296366 (not c!47684)) b!296364))

(assert (= (and d!67041 c!47682) b!296361))

(assert (= (and d!67041 (not c!47682)) b!296365))

(assert (= (and b!296365 res!156152) b!296363))

(assert (= (and b!296363 (not res!156154)) b!296367))

(assert (= (and b!296367 (not res!156153)) b!296368))

(declare-fun m!309381 () Bool)

(assert (=> b!296364 m!309381))

(assert (=> b!296364 m!309381))

(declare-fun m!309383 () Bool)

(assert (=> b!296364 m!309383))

(declare-fun m!309385 () Bool)

(assert (=> b!296367 m!309385))

(assert (=> b!296363 m!309385))

(declare-fun m!309387 () Bool)

(assert (=> d!67041 m!309387))

(assert (=> d!67041 m!309355))

(assert (=> b!296368 m!309385))

(assert (=> b!296305 d!67041))

(declare-fun b!296373 () Bool)

(declare-fun e!187316 () SeekEntryResult!2259)

(assert (=> b!296373 (= e!187316 (Intermediate!2259 false lt!147115 #b00000000000000000000000000000000))))

(declare-fun b!296374 () Bool)

(declare-fun e!187319 () Bool)

(declare-fun lt!147152 () SeekEntryResult!2259)

(assert (=> b!296374 (= e!187319 (bvsge (x!29415 lt!147152) #b01111111111111111111111111111110))))

(declare-fun b!296375 () Bool)

(declare-fun e!187317 () SeekEntryResult!2259)

(assert (=> b!296375 (= e!187317 (Intermediate!2259 true lt!147115 #b00000000000000000000000000000000))))

(declare-fun b!296376 () Bool)

(assert (=> b!296376 (and (bvsge (index!11208 lt!147152) #b00000000000000000000000000000000) (bvslt (index!11208 lt!147152) (size!7462 a!3312)))))

(declare-fun res!156159 () Bool)

(assert (=> b!296376 (= res!156159 (= (select (arr!7110 a!3312) (index!11208 lt!147152)) k0!2524))))

(declare-fun e!187318 () Bool)

(assert (=> b!296376 (=> res!156159 e!187318)))

(declare-fun e!187320 () Bool)

(assert (=> b!296376 (= e!187320 e!187318)))

(declare-fun b!296377 () Bool)

(assert (=> b!296377 (= e!187316 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147115 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun d!67047 () Bool)

(assert (=> d!67047 e!187319))

(declare-fun c!47686 () Bool)

(assert (=> d!67047 (= c!47686 (and ((_ is Intermediate!2259) lt!147152) (undefined!3071 lt!147152)))))

(assert (=> d!67047 (= lt!147152 e!187317)))

(declare-fun c!47687 () Bool)

(assert (=> d!67047 (= c!47687 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!147151 () (_ BitVec 64))

(assert (=> d!67047 (= lt!147151 (select (arr!7110 a!3312) lt!147115))))

(assert (=> d!67047 (validMask!0 mask!3809)))

(assert (=> d!67047 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147115 k0!2524 a!3312 mask!3809) lt!147152)))

(declare-fun b!296378 () Bool)

(assert (=> b!296378 (= e!187319 e!187320)))

(declare-fun res!156157 () Bool)

(assert (=> b!296378 (= res!156157 (and ((_ is Intermediate!2259) lt!147152) (not (undefined!3071 lt!147152)) (bvslt (x!29415 lt!147152) #b01111111111111111111111111111110) (bvsge (x!29415 lt!147152) #b00000000000000000000000000000000) (bvsge (x!29415 lt!147152) #b00000000000000000000000000000000)))))

(assert (=> b!296378 (=> (not res!156157) (not e!187320))))

(declare-fun b!296379 () Bool)

(assert (=> b!296379 (= e!187317 e!187316)))

(declare-fun c!47688 () Bool)

(assert (=> b!296379 (= c!47688 (or (= lt!147151 k0!2524) (= (bvadd lt!147151 lt!147151) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!296380 () Bool)

(assert (=> b!296380 (and (bvsge (index!11208 lt!147152) #b00000000000000000000000000000000) (bvslt (index!11208 lt!147152) (size!7462 a!3312)))))

(declare-fun res!156158 () Bool)

(assert (=> b!296380 (= res!156158 (= (select (arr!7110 a!3312) (index!11208 lt!147152)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!296380 (=> res!156158 e!187318)))

(declare-fun b!296381 () Bool)

(assert (=> b!296381 (and (bvsge (index!11208 lt!147152) #b00000000000000000000000000000000) (bvslt (index!11208 lt!147152) (size!7462 a!3312)))))

(assert (=> b!296381 (= e!187318 (= (select (arr!7110 a!3312) (index!11208 lt!147152)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!67047 c!47687) b!296375))

(assert (= (and d!67047 (not c!47687)) b!296379))

(assert (= (and b!296379 c!47688) b!296373))

(assert (= (and b!296379 (not c!47688)) b!296377))

(assert (= (and d!67047 c!47686) b!296374))

(assert (= (and d!67047 (not c!47686)) b!296378))

(assert (= (and b!296378 res!156157) b!296376))

(assert (= (and b!296376 (not res!156159)) b!296380))

(assert (= (and b!296380 (not res!156158)) b!296381))

(assert (=> b!296377 m!309381))

(assert (=> b!296377 m!309381))

(declare-fun m!309401 () Bool)

(assert (=> b!296377 m!309401))

(declare-fun m!309403 () Bool)

(assert (=> b!296380 m!309403))

(assert (=> b!296376 m!309403))

(declare-fun m!309405 () Bool)

(assert (=> d!67047 m!309405))

(assert (=> d!67047 m!309355))

(assert (=> b!296381 m!309403))

(assert (=> b!296305 d!67047))

(declare-fun d!67051 () Bool)

(declare-fun lt!147158 () (_ BitVec 32))

(declare-fun lt!147157 () (_ BitVec 32))

(assert (=> d!67051 (= lt!147158 (bvmul (bvxor lt!147157 (bvlshr lt!147157 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67051 (= lt!147157 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67051 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!156160 (let ((h!5292 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29418 (bvmul (bvxor h!5292 (bvlshr h!5292 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29418 (bvlshr x!29418 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!156160 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!156160 #b00000000000000000000000000000000))))))

(assert (=> d!67051 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!147158 (bvlshr lt!147158 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!296305 d!67051))

(declare-fun b!296426 () Bool)

(declare-fun e!187349 () Bool)

(declare-fun e!187347 () Bool)

(assert (=> b!296426 (= e!187349 e!187347)))

(declare-fun c!47703 () Bool)

(assert (=> b!296426 (= c!47703 (validKeyInArray!0 (select (arr!7110 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!296427 () Bool)

(declare-fun e!187348 () Bool)

(declare-fun call!25741 () Bool)

(assert (=> b!296427 (= e!187348 call!25741)))

(declare-fun b!296429 () Bool)

(assert (=> b!296429 (= e!187347 call!25741)))

(declare-fun bm!25738 () Bool)

(assert (=> bm!25738 (= call!25741 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!67055 () Bool)

(declare-fun res!156177 () Bool)

(assert (=> d!67055 (=> res!156177 e!187349)))

(assert (=> d!67055 (= res!156177 (bvsge #b00000000000000000000000000000000 (size!7462 a!3312)))))

(assert (=> d!67055 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!187349)))

(declare-fun b!296428 () Bool)

(assert (=> b!296428 (= e!187347 e!187348)))

(declare-fun lt!147175 () (_ BitVec 64))

(assert (=> b!296428 (= lt!147175 (select (arr!7110 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9228 0))(
  ( (Unit!9229) )
))
(declare-fun lt!147173 () Unit!9228)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14999 (_ BitVec 64) (_ BitVec 32)) Unit!9228)

(assert (=> b!296428 (= lt!147173 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!147175 #b00000000000000000000000000000000))))

(assert (=> b!296428 (arrayContainsKey!0 a!3312 lt!147175 #b00000000000000000000000000000000)))

(declare-fun lt!147174 () Unit!9228)

(assert (=> b!296428 (= lt!147174 lt!147173)))

(declare-fun res!156178 () Bool)

(assert (=> b!296428 (= res!156178 (= (seekEntryOrOpen!0 (select (arr!7110 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2259 #b00000000000000000000000000000000)))))

(assert (=> b!296428 (=> (not res!156178) (not e!187348))))

(assert (= (and d!67055 (not res!156177)) b!296426))

(assert (= (and b!296426 c!47703) b!296428))

(assert (= (and b!296426 (not c!47703)) b!296429))

(assert (= (and b!296428 res!156178) b!296427))

(assert (= (or b!296427 b!296429) bm!25738))

(declare-fun m!309421 () Bool)

(assert (=> b!296426 m!309421))

(assert (=> b!296426 m!309421))

(declare-fun m!309423 () Bool)

(assert (=> b!296426 m!309423))

(declare-fun m!309425 () Bool)

(assert (=> bm!25738 m!309425))

(assert (=> b!296428 m!309421))

(declare-fun m!309427 () Bool)

(assert (=> b!296428 m!309427))

(declare-fun m!309429 () Bool)

(assert (=> b!296428 m!309429))

(assert (=> b!296428 m!309421))

(declare-fun m!309431 () Bool)

(assert (=> b!296428 m!309431))

(assert (=> b!296304 d!67055))

(declare-fun d!67065 () Bool)

(assert (=> d!67065 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!296308 d!67065))

(declare-fun d!67067 () Bool)

(assert (=> d!67067 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29196 d!67067))

(declare-fun d!67073 () Bool)

(assert (=> d!67073 (= (array_inv!5073 a!3312) (bvsge (size!7462 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29196 d!67073))

(declare-fun b!296502 () Bool)

(declare-fun e!187398 () SeekEntryResult!2259)

(declare-fun e!187399 () SeekEntryResult!2259)

(assert (=> b!296502 (= e!187398 e!187399)))

(declare-fun lt!147211 () (_ BitVec 64))

(declare-fun lt!147213 () SeekEntryResult!2259)

(assert (=> b!296502 (= lt!147211 (select (arr!7110 a!3312) (index!11208 lt!147213)))))

(declare-fun c!47725 () Bool)

(assert (=> b!296502 (= c!47725 (= lt!147211 k0!2524))))

(declare-fun b!296503 () Bool)

(assert (=> b!296503 (= e!187398 Undefined!2259)))

(declare-fun b!296504 () Bool)

(assert (=> b!296504 (= e!187399 (Found!2259 (index!11208 lt!147213)))))

(declare-fun b!296505 () Bool)

(declare-fun c!47726 () Bool)

(assert (=> b!296505 (= c!47726 (= lt!147211 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!187397 () SeekEntryResult!2259)

(assert (=> b!296505 (= e!187399 e!187397)))

(declare-fun d!67075 () Bool)

(declare-fun lt!147212 () SeekEntryResult!2259)

(assert (=> d!67075 (and (or ((_ is Undefined!2259) lt!147212) (not ((_ is Found!2259) lt!147212)) (and (bvsge (index!11207 lt!147212) #b00000000000000000000000000000000) (bvslt (index!11207 lt!147212) (size!7462 a!3312)))) (or ((_ is Undefined!2259) lt!147212) ((_ is Found!2259) lt!147212) (not ((_ is MissingZero!2259) lt!147212)) (and (bvsge (index!11206 lt!147212) #b00000000000000000000000000000000) (bvslt (index!11206 lt!147212) (size!7462 a!3312)))) (or ((_ is Undefined!2259) lt!147212) ((_ is Found!2259) lt!147212) ((_ is MissingZero!2259) lt!147212) (not ((_ is MissingVacant!2259) lt!147212)) (and (bvsge (index!11209 lt!147212) #b00000000000000000000000000000000) (bvslt (index!11209 lt!147212) (size!7462 a!3312)))) (or ((_ is Undefined!2259) lt!147212) (ite ((_ is Found!2259) lt!147212) (= (select (arr!7110 a!3312) (index!11207 lt!147212)) k0!2524) (ite ((_ is MissingZero!2259) lt!147212) (= (select (arr!7110 a!3312) (index!11206 lt!147212)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2259) lt!147212) (= (select (arr!7110 a!3312) (index!11209 lt!147212)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67075 (= lt!147212 e!187398)))

(declare-fun c!47727 () Bool)

(assert (=> d!67075 (= c!47727 (and ((_ is Intermediate!2259) lt!147213) (undefined!3071 lt!147213)))))

(assert (=> d!67075 (= lt!147213 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67075 (validMask!0 mask!3809)))

(assert (=> d!67075 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!147212)))

(declare-fun b!296506 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14999 (_ BitVec 32)) SeekEntryResult!2259)

(assert (=> b!296506 (= e!187397 (seekKeyOrZeroReturnVacant!0 (x!29415 lt!147213) (index!11208 lt!147213) (index!11208 lt!147213) k0!2524 a!3312 mask!3809))))

(declare-fun b!296507 () Bool)

(assert (=> b!296507 (= e!187397 (MissingZero!2259 (index!11208 lt!147213)))))

(assert (= (and d!67075 c!47727) b!296503))

(assert (= (and d!67075 (not c!47727)) b!296502))

(assert (= (and b!296502 c!47725) b!296504))

(assert (= (and b!296502 (not c!47725)) b!296505))

(assert (= (and b!296505 c!47726) b!296507))

(assert (= (and b!296505 (not c!47726)) b!296506))

(declare-fun m!309463 () Bool)

(assert (=> b!296502 m!309463))

(assert (=> d!67075 m!309353))

(assert (=> d!67075 m!309353))

(declare-fun m!309465 () Bool)

(assert (=> d!67075 m!309465))

(assert (=> d!67075 m!309355))

(declare-fun m!309467 () Bool)

(assert (=> d!67075 m!309467))

(declare-fun m!309469 () Bool)

(assert (=> d!67075 m!309469))

(declare-fun m!309471 () Bool)

(assert (=> d!67075 m!309471))

(declare-fun m!309473 () Bool)

(assert (=> b!296506 m!309473))

(assert (=> b!296306 d!67075))

(declare-fun d!67091 () Bool)

(declare-fun res!156215 () Bool)

(declare-fun e!187404 () Bool)

(assert (=> d!67091 (=> res!156215 e!187404)))

(assert (=> d!67091 (= res!156215 (= (select (arr!7110 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67091 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!187404)))

(declare-fun b!296512 () Bool)

(declare-fun e!187405 () Bool)

(assert (=> b!296512 (= e!187404 e!187405)))

(declare-fun res!156216 () Bool)

(assert (=> b!296512 (=> (not res!156216) (not e!187405))))

(assert (=> b!296512 (= res!156216 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7462 a!3312)))))

(declare-fun b!296513 () Bool)

(assert (=> b!296513 (= e!187405 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67091 (not res!156215)) b!296512))

(assert (= (and b!296512 res!156216) b!296513))

(assert (=> d!67091 m!309421))

(declare-fun m!309475 () Bool)

(assert (=> b!296513 m!309475))

(assert (=> b!296307 d!67091))

(check-sat (not b!296428) (not bm!25738) (not d!67075) (not b!296506) (not b!296364) (not d!67047) (not b!296426) (not d!67041) (not b!296377) (not b!296513))
(check-sat)
