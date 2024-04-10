; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29836 () Bool)

(assert start!29836)

(declare-fun b!300249 () Bool)

(declare-fun res!158281 () Bool)

(declare-fun e!189603 () Bool)

(assert (=> b!300249 (=> (not res!158281) (not e!189603))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!15159 0))(
  ( (array!15160 (arr!7175 (Array (_ BitVec 32) (_ BitVec 64))) (size!7527 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15159)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!300249 (= res!158281 (and (= (size!7527 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7527 a!3312))))))

(declare-fun b!300250 () Bool)

(declare-fun res!158284 () Bool)

(declare-fun e!189604 () Bool)

(assert (=> b!300250 (=> (not res!158284) (not e!189604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15159 (_ BitVec 32)) Bool)

(assert (=> b!300250 (= res!158284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!300252 () Bool)

(assert (=> b!300252 (= e!189603 e!189604)))

(declare-fun res!158283 () Bool)

(assert (=> b!300252 (=> (not res!158283) (not e!189604))))

(declare-datatypes ((SeekEntryResult!2324 0))(
  ( (MissingZero!2324 (index!11472 (_ BitVec 32))) (Found!2324 (index!11473 (_ BitVec 32))) (Intermediate!2324 (undefined!3136 Bool) (index!11474 (_ BitVec 32)) (x!29728 (_ BitVec 32))) (Undefined!2324) (MissingVacant!2324 (index!11475 (_ BitVec 32))) )
))
(declare-fun lt!149350 () SeekEntryResult!2324)

(declare-fun lt!149349 () Bool)

(assert (=> b!300252 (= res!158283 (or lt!149349 (= lt!149350 (MissingVacant!2324 i!1256))))))

(assert (=> b!300252 (= lt!149349 (= lt!149350 (MissingZero!2324 i!1256)))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15159 (_ BitVec 32)) SeekEntryResult!2324)

(assert (=> b!300252 (= lt!149350 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!300253 () Bool)

(declare-fun res!158282 () Bool)

(assert (=> b!300253 (=> (not res!158282) (not e!189603))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300253 (= res!158282 (validKeyInArray!0 k!2524))))

(declare-fun lt!149352 () SeekEntryResult!2324)

(declare-fun b!300254 () Bool)

(assert (=> b!300254 (= e!189604 (and (not lt!149349) (= lt!149350 (MissingVacant!2324 i!1256)) (let ((bdg!6466 (not (is-Intermediate!2324 lt!149352)))) (and (or bdg!6466 (not (undefined!3136 lt!149352))) (or bdg!6466 (not (= (select (arr!7175 a!3312) (index!11474 lt!149352)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or bdg!6466 (not (= (select (arr!7175 a!3312) (index!11474 lt!149352)) k!2524))) (not bdg!6466)))))))

(declare-fun lt!149348 () SeekEntryResult!2324)

(declare-fun lt!149351 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15159 (_ BitVec 32)) SeekEntryResult!2324)

(assert (=> b!300254 (= lt!149348 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149351 k!2524 (array!15160 (store (arr!7175 a!3312) i!1256 k!2524) (size!7527 a!3312)) mask!3809))))

(assert (=> b!300254 (= lt!149352 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149351 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300254 (= lt!149351 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!300251 () Bool)

(declare-fun res!158286 () Bool)

(assert (=> b!300251 (=> (not res!158286) (not e!189603))))

(declare-fun arrayContainsKey!0 (array!15159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300251 (= res!158286 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!158285 () Bool)

(assert (=> start!29836 (=> (not res!158285) (not e!189603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29836 (= res!158285 (validMask!0 mask!3809))))

(assert (=> start!29836 e!189603))

(assert (=> start!29836 true))

(declare-fun array_inv!5138 (array!15159) Bool)

(assert (=> start!29836 (array_inv!5138 a!3312)))

(assert (= (and start!29836 res!158285) b!300249))

(assert (= (and b!300249 res!158281) b!300253))

(assert (= (and b!300253 res!158282) b!300251))

(assert (= (and b!300251 res!158286) b!300252))

(assert (= (and b!300252 res!158283) b!300250))

(assert (= (and b!300250 res!158284) b!300254))

(declare-fun m!312303 () Bool)

(assert (=> b!300253 m!312303))

(declare-fun m!312305 () Bool)

(assert (=> b!300254 m!312305))

(declare-fun m!312307 () Bool)

(assert (=> b!300254 m!312307))

(declare-fun m!312309 () Bool)

(assert (=> b!300254 m!312309))

(declare-fun m!312311 () Bool)

(assert (=> b!300254 m!312311))

(declare-fun m!312313 () Bool)

(assert (=> b!300254 m!312313))

(declare-fun m!312315 () Bool)

(assert (=> start!29836 m!312315))

(declare-fun m!312317 () Bool)

(assert (=> start!29836 m!312317))

(declare-fun m!312319 () Bool)

(assert (=> b!300252 m!312319))

(declare-fun m!312321 () Bool)

(assert (=> b!300251 m!312321))

(declare-fun m!312323 () Bool)

(assert (=> b!300250 m!312323))

(push 1)

(assert (not b!300252))

(assert (not b!300253))

(assert (not b!300251))

(assert (not b!300250))

(assert (not start!29836))

(assert (not b!300254))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!67719 () Bool)

(declare-fun res!158334 () Bool)

(declare-fun e!189646 () Bool)

(assert (=> d!67719 (=> res!158334 e!189646)))

(assert (=> d!67719 (= res!158334 (bvsge #b00000000000000000000000000000000 (size!7527 a!3312)))))

(assert (=> d!67719 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!189646)))

(declare-fun b!300323 () Bool)

(declare-fun e!189645 () Bool)

(declare-fun call!25849 () Bool)

(assert (=> b!300323 (= e!189645 call!25849)))

(declare-fun b!300324 () Bool)

(assert (=> b!300324 (= e!189646 e!189645)))

(declare-fun c!48588 () Bool)

(assert (=> b!300324 (= c!48588 (validKeyInArray!0 (select (arr!7175 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!300325 () Bool)

(declare-fun e!189644 () Bool)

(assert (=> b!300325 (= e!189644 call!25849)))

(declare-fun bm!25846 () Bool)

(assert (=> bm!25846 (= call!25849 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!300326 () Bool)

(assert (=> b!300326 (= e!189645 e!189644)))

(declare-fun lt!149399 () (_ BitVec 64))

(assert (=> b!300326 (= lt!149399 (select (arr!7175 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9363 0))(
  ( (Unit!9364) )
))
(declare-fun lt!149398 () Unit!9363)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15159 (_ BitVec 64) (_ BitVec 32)) Unit!9363)

(assert (=> b!300326 (= lt!149398 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!149399 #b00000000000000000000000000000000))))

(assert (=> b!300326 (arrayContainsKey!0 a!3312 lt!149399 #b00000000000000000000000000000000)))

(declare-fun lt!149400 () Unit!9363)

(assert (=> b!300326 (= lt!149400 lt!149398)))

(declare-fun res!158333 () Bool)

(assert (=> b!300326 (= res!158333 (= (seekEntryOrOpen!0 (select (arr!7175 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2324 #b00000000000000000000000000000000)))))

(assert (=> b!300326 (=> (not res!158333) (not e!189644))))

(assert (= (and d!67719 (not res!158334)) b!300324))

(assert (= (and b!300324 c!48588) b!300326))

(assert (= (and b!300324 (not c!48588)) b!300323))

(assert (= (and b!300326 res!158333) b!300325))

(assert (= (or b!300325 b!300323) bm!25846))

(declare-fun m!312385 () Bool)

(assert (=> b!300324 m!312385))

(assert (=> b!300324 m!312385))

(declare-fun m!312387 () Bool)

(assert (=> b!300324 m!312387))

(declare-fun m!312389 () Bool)

(assert (=> bm!25846 m!312389))

(assert (=> b!300326 m!312385))

(declare-fun m!312391 () Bool)

(assert (=> b!300326 m!312391))

(declare-fun m!312393 () Bool)

(assert (=> b!300326 m!312393))

(assert (=> b!300326 m!312385))

(declare-fun m!312395 () Bool)

(assert (=> b!300326 m!312395))

(assert (=> b!300250 d!67719))

(declare-fun d!67727 () Bool)

(declare-fun res!158339 () Bool)

(declare-fun e!189651 () Bool)

(assert (=> d!67727 (=> res!158339 e!189651)))

(assert (=> d!67727 (= res!158339 (= (select (arr!7175 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!67727 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!189651)))

(declare-fun b!300333 () Bool)

(declare-fun e!189652 () Bool)

(assert (=> b!300333 (= e!189651 e!189652)))

(declare-fun res!158340 () Bool)

(assert (=> b!300333 (=> (not res!158340) (not e!189652))))

(assert (=> b!300333 (= res!158340 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7527 a!3312)))))

(declare-fun b!300334 () Bool)

(assert (=> b!300334 (= e!189652 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67727 (not res!158339)) b!300333))

(assert (= (and b!300333 res!158340) b!300334))

(assert (=> d!67727 m!312385))

(declare-fun m!312397 () Bool)

(assert (=> b!300334 m!312397))

(assert (=> b!300251 d!67727))

(declare-fun lt!149429 () SeekEntryResult!2324)

(declare-fun e!189701 () SeekEntryResult!2324)

(declare-fun b!300417 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15159 (_ BitVec 32)) SeekEntryResult!2324)

(assert (=> b!300417 (= e!189701 (seekKeyOrZeroReturnVacant!0 (x!29728 lt!149429) (index!11474 lt!149429) (index!11474 lt!149429) k!2524 a!3312 mask!3809))))

(declare-fun b!300418 () Bool)

(declare-fun c!48620 () Bool)

(declare-fun lt!149431 () (_ BitVec 64))

(assert (=> b!300418 (= c!48620 (= lt!149431 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!189699 () SeekEntryResult!2324)

(assert (=> b!300418 (= e!189699 e!189701)))

(declare-fun b!300419 () Bool)

(assert (=> b!300419 (= e!189701 (MissingZero!2324 (index!11474 lt!149429)))))

(declare-fun d!67731 () Bool)

(declare-fun lt!149430 () SeekEntryResult!2324)

(assert (=> d!67731 (and (or (is-Undefined!2324 lt!149430) (not (is-Found!2324 lt!149430)) (and (bvsge (index!11473 lt!149430) #b00000000000000000000000000000000) (bvslt (index!11473 lt!149430) (size!7527 a!3312)))) (or (is-Undefined!2324 lt!149430) (is-Found!2324 lt!149430) (not (is-MissingZero!2324 lt!149430)) (and (bvsge (index!11472 lt!149430) #b00000000000000000000000000000000) (bvslt (index!11472 lt!149430) (size!7527 a!3312)))) (or (is-Undefined!2324 lt!149430) (is-Found!2324 lt!149430) (is-MissingZero!2324 lt!149430) (not (is-MissingVacant!2324 lt!149430)) (and (bvsge (index!11475 lt!149430) #b00000000000000000000000000000000) (bvslt (index!11475 lt!149430) (size!7527 a!3312)))) (or (is-Undefined!2324 lt!149430) (ite (is-Found!2324 lt!149430) (= (select (arr!7175 a!3312) (index!11473 lt!149430)) k!2524) (ite (is-MissingZero!2324 lt!149430) (= (select (arr!7175 a!3312) (index!11472 lt!149430)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2324 lt!149430) (= (select (arr!7175 a!3312) (index!11475 lt!149430)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!189700 () SeekEntryResult!2324)

(assert (=> d!67731 (= lt!149430 e!189700)))

(declare-fun c!48621 () Bool)

(assert (=> d!67731 (= c!48621 (and (is-Intermediate!2324 lt!149429) (undefined!3136 lt!149429)))))

(assert (=> d!67731 (= lt!149429 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!67731 (validMask!0 mask!3809)))

(assert (=> d!67731 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!149430)))

(declare-fun b!300420 () Bool)

(assert (=> b!300420 (= e!189699 (Found!2324 (index!11474 lt!149429)))))

(declare-fun b!300421 () Bool)

(assert (=> b!300421 (= e!189700 e!189699)))

(assert (=> b!300421 (= lt!149431 (select (arr!7175 a!3312) (index!11474 lt!149429)))))

(declare-fun c!48619 () Bool)

(assert (=> b!300421 (= c!48619 (= lt!149431 k!2524))))

(declare-fun b!300422 () Bool)

(assert (=> b!300422 (= e!189700 Undefined!2324)))

(assert (= (and d!67731 c!48621) b!300422))

(assert (= (and d!67731 (not c!48621)) b!300421))

(assert (= (and b!300421 c!48619) b!300420))

(assert (= (and b!300421 (not c!48619)) b!300418))

(assert (= (and b!300418 c!48620) b!300419))

(assert (= (and b!300418 (not c!48620)) b!300417))

(declare-fun m!312427 () Bool)

(assert (=> b!300417 m!312427))

(assert (=> d!67731 m!312309))

(declare-fun m!312429 () Bool)

(assert (=> d!67731 m!312429))

(assert (=> d!67731 m!312315))

(declare-fun m!312431 () Bool)

(assert (=> d!67731 m!312431))

(declare-fun m!312433 () Bool)

(assert (=> d!67731 m!312433))

(assert (=> d!67731 m!312309))

(declare-fun m!312435 () Bool)

(assert (=> d!67731 m!312435))

(declare-fun m!312437 () Bool)

(assert (=> b!300421 m!312437))

(assert (=> b!300252 d!67731))

(declare-fun d!67745 () Bool)

(assert (=> d!67745 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29836 d!67745))

(declare-fun d!67751 () Bool)

(assert (=> d!67751 (= (array_inv!5138 a!3312) (bvsge (size!7527 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29836 d!67751))

(declare-fun d!67753 () Bool)

(assert (=> d!67753 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!300253 d!67753))

(declare-fun b!300489 () Bool)

(declare-fun e!189746 () SeekEntryResult!2324)

(assert (=> b!300489 (= e!189746 (Intermediate!2324 true lt!149351 #b00000000000000000000000000000000))))

(declare-fun b!300490 () Bool)

(declare-fun e!189747 () Bool)

(declare-fun e!189749 () Bool)

(assert (=> b!300490 (= e!189747 e!189749)))

(declare-fun res!158392 () Bool)

(declare-fun lt!149469 () SeekEntryResult!2324)

(assert (=> b!300490 (= res!158392 (and (is-Intermediate!2324 lt!149469) (not (undefined!3136 lt!149469)) (bvslt (x!29728 lt!149469) #b01111111111111111111111111111110) (bvsge (x!29728 lt!149469) #b00000000000000000000000000000000) (bvsge (x!29728 lt!149469) #b00000000000000000000000000000000)))))

(assert (=> b!300490 (=> (not res!158392) (not e!189749))))

(declare-fun b!300491 () Bool)

(declare-fun e!189748 () SeekEntryResult!2324)

(assert (=> b!300491 (= e!189746 e!189748)))

(declare-fun c!48645 () Bool)

(declare-fun lt!149470 () (_ BitVec 64))

(assert (=> b!300491 (= c!48645 (or (= lt!149470 k!2524) (= (bvadd lt!149470 lt!149470) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!300492 () Bool)

(assert (=> b!300492 (and (bvsge (index!11474 lt!149469) #b00000000000000000000000000000000) (bvslt (index!11474 lt!149469) (size!7527 (array!15160 (store (arr!7175 a!3312) i!1256 k!2524) (size!7527 a!3312)))))))

(declare-fun e!189745 () Bool)

(assert (=> b!300492 (= e!189745 (= (select (arr!7175 (array!15160 (store (arr!7175 a!3312) i!1256 k!2524) (size!7527 a!3312))) (index!11474 lt!149469)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!67755 () Bool)

(assert (=> d!67755 e!189747))

(declare-fun c!48643 () Bool)

(assert (=> d!67755 (= c!48643 (and (is-Intermediate!2324 lt!149469) (undefined!3136 lt!149469)))))

(assert (=> d!67755 (= lt!149469 e!189746)))

(declare-fun c!48644 () Bool)

(assert (=> d!67755 (= c!48644 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67755 (= lt!149470 (select (arr!7175 (array!15160 (store (arr!7175 a!3312) i!1256 k!2524) (size!7527 a!3312))) lt!149351))))

(assert (=> d!67755 (validMask!0 mask!3809)))

(assert (=> d!67755 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149351 k!2524 (array!15160 (store (arr!7175 a!3312) i!1256 k!2524) (size!7527 a!3312)) mask!3809) lt!149469)))

(declare-fun b!300493 () Bool)

(assert (=> b!300493 (and (bvsge (index!11474 lt!149469) #b00000000000000000000000000000000) (bvslt (index!11474 lt!149469) (size!7527 (array!15160 (store (arr!7175 a!3312) i!1256 k!2524) (size!7527 a!3312)))))))

(declare-fun res!158393 () Bool)

(assert (=> b!300493 (= res!158393 (= (select (arr!7175 (array!15160 (store (arr!7175 a!3312) i!1256 k!2524) (size!7527 a!3312))) (index!11474 lt!149469)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!300493 (=> res!158393 e!189745)))

(declare-fun b!300494 () Bool)

(assert (=> b!300494 (and (bvsge (index!11474 lt!149469) #b00000000000000000000000000000000) (bvslt (index!11474 lt!149469) (size!7527 (array!15160 (store (arr!7175 a!3312) i!1256 k!2524) (size!7527 a!3312)))))))

(declare-fun res!158391 () Bool)

(assert (=> b!300494 (= res!158391 (= (select (arr!7175 (array!15160 (store (arr!7175 a!3312) i!1256 k!2524) (size!7527 a!3312))) (index!11474 lt!149469)) k!2524))))

(assert (=> b!300494 (=> res!158391 e!189745)))

(assert (=> b!300494 (= e!189749 e!189745)))

(declare-fun b!300495 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300495 (= e!189748 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149351 #b00000000000000000000000000000000 mask!3809) k!2524 (array!15160 (store (arr!7175 a!3312) i!1256 k!2524) (size!7527 a!3312)) mask!3809))))

(declare-fun b!300496 () Bool)

(assert (=> b!300496 (= e!189748 (Intermediate!2324 false lt!149351 #b00000000000000000000000000000000))))

(declare-fun b!300497 () Bool)

(assert (=> b!300497 (= e!189747 (bvsge (x!29728 lt!149469) #b01111111111111111111111111111110))))

(assert (= (and d!67755 c!48644) b!300489))

(assert (= (and d!67755 (not c!48644)) b!300491))

(assert (= (and b!300491 c!48645) b!300496))

(assert (= (and b!300491 (not c!48645)) b!300495))

(assert (= (and d!67755 c!48643) b!300497))

(assert (= (and d!67755 (not c!48643)) b!300490))

(assert (= (and b!300490 res!158392) b!300494))

(assert (= (and b!300494 (not res!158391)) b!300493))

(assert (= (and b!300493 (not res!158393)) b!300492))

(declare-fun m!312475 () Bool)

(assert (=> b!300495 m!312475))

(assert (=> b!300495 m!312475))

(declare-fun m!312477 () Bool)

(assert (=> b!300495 m!312477))

(declare-fun m!312479 () Bool)

(assert (=> b!300492 m!312479))

(assert (=> b!300493 m!312479))

(declare-fun m!312481 () Bool)

(assert (=> d!67755 m!312481))

(assert (=> d!67755 m!312315))

(assert (=> b!300494 m!312479))

(assert (=> b!300254 d!67755))

(declare-fun b!300498 () Bool)

(declare-fun e!189751 () SeekEntryResult!2324)

(assert (=> b!300498 (= e!189751 (Intermediate!2324 true lt!149351 #b00000000000000000000000000000000))))

(declare-fun b!300499 () Bool)

(declare-fun e!189752 () Bool)

(declare-fun e!189754 () Bool)

(assert (=> b!300499 (= e!189752 e!189754)))

(declare-fun res!158395 () Bool)

(declare-fun lt!149471 () SeekEntryResult!2324)

(assert (=> b!300499 (= res!158395 (and (is-Intermediate!2324 lt!149471) (not (undefined!3136 lt!149471)) (bvslt (x!29728 lt!149471) #b01111111111111111111111111111110) (bvsge (x!29728 lt!149471) #b00000000000000000000000000000000) (bvsge (x!29728 lt!149471) #b00000000000000000000000000000000)))))

(assert (=> b!300499 (=> (not res!158395) (not e!189754))))

(declare-fun b!300500 () Bool)

(declare-fun e!189753 () SeekEntryResult!2324)

(assert (=> b!300500 (= e!189751 e!189753)))

(declare-fun c!48648 () Bool)

(declare-fun lt!149472 () (_ BitVec 64))

(assert (=> b!300500 (= c!48648 (or (= lt!149472 k!2524) (= (bvadd lt!149472 lt!149472) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!300501 () Bool)

(assert (=> b!300501 (and (bvsge (index!11474 lt!149471) #b00000000000000000000000000000000) (bvslt (index!11474 lt!149471) (size!7527 a!3312)))))

(declare-fun e!189750 () Bool)

(assert (=> b!300501 (= e!189750 (= (select (arr!7175 a!3312) (index!11474 lt!149471)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!67765 () Bool)

(assert (=> d!67765 e!189752))

(declare-fun c!48646 () Bool)

(assert (=> d!67765 (= c!48646 (and (is-Intermediate!2324 lt!149471) (undefined!3136 lt!149471)))))

(assert (=> d!67765 (= lt!149471 e!189751)))

(declare-fun c!48647 () Bool)

(assert (=> d!67765 (= c!48647 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67765 (= lt!149472 (select (arr!7175 a!3312) lt!149351))))

