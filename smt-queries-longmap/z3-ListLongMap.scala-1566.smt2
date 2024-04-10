; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29838 () Bool)

(assert start!29838)

(declare-fun b!300267 () Bool)

(declare-fun res!158304 () Bool)

(declare-fun e!189613 () Bool)

(assert (=> b!300267 (=> (not res!158304) (not e!189613))))

(declare-datatypes ((array!15161 0))(
  ( (array!15162 (arr!7176 (Array (_ BitVec 32) (_ BitVec 64))) (size!7528 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15161)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15161 (_ BitVec 32)) Bool)

(assert (=> b!300267 (= res!158304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!300268 () Bool)

(declare-fun res!158302 () Bool)

(declare-fun e!189611 () Bool)

(assert (=> b!300268 (=> (not res!158302) (not e!189611))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300268 (= res!158302 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!300269 () Bool)

(assert (=> b!300269 (= e!189611 e!189613)))

(declare-fun res!158299 () Bool)

(assert (=> b!300269 (=> (not res!158299) (not e!189613))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2325 0))(
  ( (MissingZero!2325 (index!11476 (_ BitVec 32))) (Found!2325 (index!11477 (_ BitVec 32))) (Intermediate!2325 (undefined!3137 Bool) (index!11478 (_ BitVec 32)) (x!29729 (_ BitVec 32))) (Undefined!2325) (MissingVacant!2325 (index!11479 (_ BitVec 32))) )
))
(declare-fun lt!149364 () SeekEntryResult!2325)

(declare-fun lt!149363 () Bool)

(assert (=> b!300269 (= res!158299 (or lt!149363 (= lt!149364 (MissingVacant!2325 i!1256))))))

(assert (=> b!300269 (= lt!149363 (= lt!149364 (MissingZero!2325 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15161 (_ BitVec 32)) SeekEntryResult!2325)

(assert (=> b!300269 (= lt!149364 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!300270 () Bool)

(declare-fun res!158300 () Bool)

(assert (=> b!300270 (=> (not res!158300) (not e!189611))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300270 (= res!158300 (validKeyInArray!0 k0!2524))))

(declare-fun b!300271 () Bool)

(declare-fun lt!149366 () SeekEntryResult!2325)

(get-info :version)

(assert (=> b!300271 (= e!189613 (and (not lt!149363) (= lt!149364 (MissingVacant!2325 i!1256)) (let ((bdg!6466 (not ((_ is Intermediate!2325) lt!149366)))) (and (or bdg!6466 (not (undefined!3137 lt!149366))) (or bdg!6466 (not (= (select (arr!7176 a!3312) (index!11478 lt!149366)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or bdg!6466 (not (= (select (arr!7176 a!3312) (index!11478 lt!149366)) k0!2524))) (not bdg!6466)))))))

(declare-fun lt!149365 () SeekEntryResult!2325)

(declare-fun lt!149367 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15161 (_ BitVec 32)) SeekEntryResult!2325)

(assert (=> b!300271 (= lt!149365 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149367 k0!2524 (array!15162 (store (arr!7176 a!3312) i!1256 k0!2524) (size!7528 a!3312)) mask!3809))))

(assert (=> b!300271 (= lt!149366 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149367 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300271 (= lt!149367 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!300272 () Bool)

(declare-fun res!158303 () Bool)

(assert (=> b!300272 (=> (not res!158303) (not e!189611))))

(assert (=> b!300272 (= res!158303 (and (= (size!7528 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7528 a!3312))))))

(declare-fun res!158301 () Bool)

(assert (=> start!29838 (=> (not res!158301) (not e!189611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29838 (= res!158301 (validMask!0 mask!3809))))

(assert (=> start!29838 e!189611))

(assert (=> start!29838 true))

(declare-fun array_inv!5139 (array!15161) Bool)

(assert (=> start!29838 (array_inv!5139 a!3312)))

(assert (= (and start!29838 res!158301) b!300272))

(assert (= (and b!300272 res!158303) b!300270))

(assert (= (and b!300270 res!158300) b!300268))

(assert (= (and b!300268 res!158302) b!300269))

(assert (= (and b!300269 res!158299) b!300267))

(assert (= (and b!300267 res!158304) b!300271))

(declare-fun m!312325 () Bool)

(assert (=> b!300269 m!312325))

(declare-fun m!312327 () Bool)

(assert (=> b!300270 m!312327))

(declare-fun m!312329 () Bool)

(assert (=> start!29838 m!312329))

(declare-fun m!312331 () Bool)

(assert (=> start!29838 m!312331))

(declare-fun m!312333 () Bool)

(assert (=> b!300267 m!312333))

(declare-fun m!312335 () Bool)

(assert (=> b!300271 m!312335))

(declare-fun m!312337 () Bool)

(assert (=> b!300271 m!312337))

(declare-fun m!312339 () Bool)

(assert (=> b!300271 m!312339))

(declare-fun m!312341 () Bool)

(assert (=> b!300271 m!312341))

(declare-fun m!312343 () Bool)

(assert (=> b!300271 m!312343))

(declare-fun m!312345 () Bool)

(assert (=> b!300268 m!312345))

(check-sat (not b!300271) (not b!300269) (not b!300267) (not b!300270) (not b!300268) (not start!29838))
(check-sat)
(get-model)

(declare-fun d!67715 () Bool)

(declare-fun res!158327 () Bool)

(declare-fun e!189627 () Bool)

(assert (=> d!67715 (=> res!158327 e!189627)))

(assert (=> d!67715 (= res!158327 (= (select (arr!7176 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67715 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!189627)))

(declare-fun b!300295 () Bool)

(declare-fun e!189628 () Bool)

(assert (=> b!300295 (= e!189627 e!189628)))

(declare-fun res!158328 () Bool)

(assert (=> b!300295 (=> (not res!158328) (not e!189628))))

(assert (=> b!300295 (= res!158328 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7528 a!3312)))))

(declare-fun b!300296 () Bool)

(assert (=> b!300296 (= e!189628 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67715 (not res!158327)) b!300295))

(assert (= (and b!300295 res!158328) b!300296))

(declare-fun m!312369 () Bool)

(assert (=> d!67715 m!312369))

(declare-fun m!312371 () Bool)

(assert (=> b!300296 m!312371))

(assert (=> b!300268 d!67715))

(declare-fun b!300309 () Bool)

(declare-fun c!48584 () Bool)

(declare-fun lt!149390 () (_ BitVec 64))

(assert (=> b!300309 (= c!48584 (= lt!149390 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!189637 () SeekEntryResult!2325)

(declare-fun e!189635 () SeekEntryResult!2325)

(assert (=> b!300309 (= e!189637 e!189635)))

(declare-fun d!67717 () Bool)

(declare-fun lt!149389 () SeekEntryResult!2325)

(assert (=> d!67717 (and (or ((_ is Undefined!2325) lt!149389) (not ((_ is Found!2325) lt!149389)) (and (bvsge (index!11477 lt!149389) #b00000000000000000000000000000000) (bvslt (index!11477 lt!149389) (size!7528 a!3312)))) (or ((_ is Undefined!2325) lt!149389) ((_ is Found!2325) lt!149389) (not ((_ is MissingZero!2325) lt!149389)) (and (bvsge (index!11476 lt!149389) #b00000000000000000000000000000000) (bvslt (index!11476 lt!149389) (size!7528 a!3312)))) (or ((_ is Undefined!2325) lt!149389) ((_ is Found!2325) lt!149389) ((_ is MissingZero!2325) lt!149389) (not ((_ is MissingVacant!2325) lt!149389)) (and (bvsge (index!11479 lt!149389) #b00000000000000000000000000000000) (bvslt (index!11479 lt!149389) (size!7528 a!3312)))) (or ((_ is Undefined!2325) lt!149389) (ite ((_ is Found!2325) lt!149389) (= (select (arr!7176 a!3312) (index!11477 lt!149389)) k0!2524) (ite ((_ is MissingZero!2325) lt!149389) (= (select (arr!7176 a!3312) (index!11476 lt!149389)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2325) lt!149389) (= (select (arr!7176 a!3312) (index!11479 lt!149389)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!189636 () SeekEntryResult!2325)

(assert (=> d!67717 (= lt!149389 e!189636)))

(declare-fun c!48585 () Bool)

(declare-fun lt!149391 () SeekEntryResult!2325)

(assert (=> d!67717 (= c!48585 (and ((_ is Intermediate!2325) lt!149391) (undefined!3137 lt!149391)))))

(assert (=> d!67717 (= lt!149391 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67717 (validMask!0 mask!3809)))

(assert (=> d!67717 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!149389)))

(declare-fun b!300310 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15161 (_ BitVec 32)) SeekEntryResult!2325)

(assert (=> b!300310 (= e!189635 (seekKeyOrZeroReturnVacant!0 (x!29729 lt!149391) (index!11478 lt!149391) (index!11478 lt!149391) k0!2524 a!3312 mask!3809))))

(declare-fun b!300311 () Bool)

(assert (=> b!300311 (= e!189635 (MissingZero!2325 (index!11478 lt!149391)))))

(declare-fun b!300312 () Bool)

(assert (=> b!300312 (= e!189636 Undefined!2325)))

(declare-fun b!300313 () Bool)

(assert (=> b!300313 (= e!189636 e!189637)))

(assert (=> b!300313 (= lt!149390 (select (arr!7176 a!3312) (index!11478 lt!149391)))))

(declare-fun c!48583 () Bool)

(assert (=> b!300313 (= c!48583 (= lt!149390 k0!2524))))

(declare-fun b!300314 () Bool)

(assert (=> b!300314 (= e!189637 (Found!2325 (index!11478 lt!149391)))))

(assert (= (and d!67717 c!48585) b!300312))

(assert (= (and d!67717 (not c!48585)) b!300313))

(assert (= (and b!300313 c!48583) b!300314))

(assert (= (and b!300313 (not c!48583)) b!300309))

(assert (= (and b!300309 c!48584) b!300311))

(assert (= (and b!300309 (not c!48584)) b!300310))

(assert (=> d!67717 m!312343))

(declare-fun m!312373 () Bool)

(assert (=> d!67717 m!312373))

(declare-fun m!312375 () Bool)

(assert (=> d!67717 m!312375))

(assert (=> d!67717 m!312343))

(declare-fun m!312377 () Bool)

(assert (=> d!67717 m!312377))

(assert (=> d!67717 m!312329))

(declare-fun m!312379 () Bool)

(assert (=> d!67717 m!312379))

(declare-fun m!312381 () Bool)

(assert (=> b!300310 m!312381))

(declare-fun m!312383 () Bool)

(assert (=> b!300313 m!312383))

(assert (=> b!300269 d!67717))

(declare-fun d!67723 () Bool)

(assert (=> d!67723 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!300270 d!67723))

(declare-fun d!67725 () Bool)

(assert (=> d!67725 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29838 d!67725))

(declare-fun d!67729 () Bool)

(assert (=> d!67729 (= (array_inv!5139 a!3312) (bvsge (size!7528 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29838 d!67729))

(declare-fun b!300399 () Bool)

(declare-fun lt!149426 () SeekEntryResult!2325)

(assert (=> b!300399 (and (bvsge (index!11478 lt!149426) #b00000000000000000000000000000000) (bvslt (index!11478 lt!149426) (size!7528 (array!15162 (store (arr!7176 a!3312) i!1256 k0!2524) (size!7528 a!3312)))))))

(declare-fun e!189693 () Bool)

(assert (=> b!300399 (= e!189693 (= (select (arr!7176 (array!15162 (store (arr!7176 a!3312) i!1256 k0!2524) (size!7528 a!3312))) (index!11478 lt!149426)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!300400 () Bool)

(declare-fun e!189692 () SeekEntryResult!2325)

(assert (=> b!300400 (= e!189692 (Intermediate!2325 false lt!149367 #b00000000000000000000000000000000))))

(declare-fun b!300401 () Bool)

(declare-fun e!189690 () Bool)

(declare-fun e!189689 () Bool)

(assert (=> b!300401 (= e!189690 e!189689)))

(declare-fun res!158362 () Bool)

(assert (=> b!300401 (= res!158362 (and ((_ is Intermediate!2325) lt!149426) (not (undefined!3137 lt!149426)) (bvslt (x!29729 lt!149426) #b01111111111111111111111111111110) (bvsge (x!29729 lt!149426) #b00000000000000000000000000000000) (bvsge (x!29729 lt!149426) #b00000000000000000000000000000000)))))

(assert (=> b!300401 (=> (not res!158362) (not e!189689))))

(declare-fun b!300402 () Bool)

(declare-fun e!189691 () SeekEntryResult!2325)

(assert (=> b!300402 (= e!189691 (Intermediate!2325 true lt!149367 #b00000000000000000000000000000000))))

(declare-fun b!300403 () Bool)

(assert (=> b!300403 (and (bvsge (index!11478 lt!149426) #b00000000000000000000000000000000) (bvslt (index!11478 lt!149426) (size!7528 (array!15162 (store (arr!7176 a!3312) i!1256 k0!2524) (size!7528 a!3312)))))))

(declare-fun res!158361 () Bool)

(assert (=> b!300403 (= res!158361 (= (select (arr!7176 (array!15162 (store (arr!7176 a!3312) i!1256 k0!2524) (size!7528 a!3312))) (index!11478 lt!149426)) k0!2524))))

(assert (=> b!300403 (=> res!158361 e!189693)))

(assert (=> b!300403 (= e!189689 e!189693)))

(declare-fun b!300404 () Bool)

(assert (=> b!300404 (= e!189691 e!189692)))

(declare-fun c!48613 () Bool)

(declare-fun lt!149425 () (_ BitVec 64))

(assert (=> b!300404 (= c!48613 (or (= lt!149425 k0!2524) (= (bvadd lt!149425 lt!149425) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!300405 () Bool)

(assert (=> b!300405 (= e!189690 (bvsge (x!29729 lt!149426) #b01111111111111111111111111111110))))

(declare-fun d!67733 () Bool)

(assert (=> d!67733 e!189690))

(declare-fun c!48615 () Bool)

(assert (=> d!67733 (= c!48615 (and ((_ is Intermediate!2325) lt!149426) (undefined!3137 lt!149426)))))

(assert (=> d!67733 (= lt!149426 e!189691)))

(declare-fun c!48614 () Bool)

(assert (=> d!67733 (= c!48614 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67733 (= lt!149425 (select (arr!7176 (array!15162 (store (arr!7176 a!3312) i!1256 k0!2524) (size!7528 a!3312))) lt!149367))))

(assert (=> d!67733 (validMask!0 mask!3809)))

(assert (=> d!67733 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149367 k0!2524 (array!15162 (store (arr!7176 a!3312) i!1256 k0!2524) (size!7528 a!3312)) mask!3809) lt!149426)))

(declare-fun b!300406 () Bool)

(assert (=> b!300406 (and (bvsge (index!11478 lt!149426) #b00000000000000000000000000000000) (bvslt (index!11478 lt!149426) (size!7528 (array!15162 (store (arr!7176 a!3312) i!1256 k0!2524) (size!7528 a!3312)))))))

(declare-fun res!158360 () Bool)

(assert (=> b!300406 (= res!158360 (= (select (arr!7176 (array!15162 (store (arr!7176 a!3312) i!1256 k0!2524) (size!7528 a!3312))) (index!11478 lt!149426)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!300406 (=> res!158360 e!189693)))

(declare-fun b!300407 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300407 (= e!189692 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149367 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!15162 (store (arr!7176 a!3312) i!1256 k0!2524) (size!7528 a!3312)) mask!3809))))

(assert (= (and d!67733 c!48614) b!300402))

(assert (= (and d!67733 (not c!48614)) b!300404))

(assert (= (and b!300404 c!48613) b!300400))

(assert (= (and b!300404 (not c!48613)) b!300407))

(assert (= (and d!67733 c!48615) b!300405))

(assert (= (and d!67733 (not c!48615)) b!300401))

(assert (= (and b!300401 res!158362) b!300403))

(assert (= (and b!300403 (not res!158361)) b!300406))

(assert (= (and b!300406 (not res!158360)) b!300399))

(declare-fun m!312413 () Bool)

(assert (=> b!300399 m!312413))

(assert (=> b!300403 m!312413))

(declare-fun m!312415 () Bool)

(assert (=> d!67733 m!312415))

(assert (=> d!67733 m!312329))

(assert (=> b!300406 m!312413))

(declare-fun m!312417 () Bool)

(assert (=> b!300407 m!312417))

(assert (=> b!300407 m!312417))

(declare-fun m!312419 () Bool)

(assert (=> b!300407 m!312419))

(assert (=> b!300271 d!67733))

(declare-fun b!300408 () Bool)

(declare-fun lt!149428 () SeekEntryResult!2325)

(assert (=> b!300408 (and (bvsge (index!11478 lt!149428) #b00000000000000000000000000000000) (bvslt (index!11478 lt!149428) (size!7528 a!3312)))))

(declare-fun e!189698 () Bool)

(assert (=> b!300408 (= e!189698 (= (select (arr!7176 a!3312) (index!11478 lt!149428)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!300409 () Bool)

(declare-fun e!189697 () SeekEntryResult!2325)

(assert (=> b!300409 (= e!189697 (Intermediate!2325 false lt!149367 #b00000000000000000000000000000000))))

(declare-fun b!300410 () Bool)

(declare-fun e!189695 () Bool)

(declare-fun e!189694 () Bool)

(assert (=> b!300410 (= e!189695 e!189694)))

(declare-fun res!158365 () Bool)

(assert (=> b!300410 (= res!158365 (and ((_ is Intermediate!2325) lt!149428) (not (undefined!3137 lt!149428)) (bvslt (x!29729 lt!149428) #b01111111111111111111111111111110) (bvsge (x!29729 lt!149428) #b00000000000000000000000000000000) (bvsge (x!29729 lt!149428) #b00000000000000000000000000000000)))))

(assert (=> b!300410 (=> (not res!158365) (not e!189694))))

(declare-fun b!300411 () Bool)

(declare-fun e!189696 () SeekEntryResult!2325)

(assert (=> b!300411 (= e!189696 (Intermediate!2325 true lt!149367 #b00000000000000000000000000000000))))

(declare-fun b!300412 () Bool)

(assert (=> b!300412 (and (bvsge (index!11478 lt!149428) #b00000000000000000000000000000000) (bvslt (index!11478 lt!149428) (size!7528 a!3312)))))

(declare-fun res!158364 () Bool)

(assert (=> b!300412 (= res!158364 (= (select (arr!7176 a!3312) (index!11478 lt!149428)) k0!2524))))

(assert (=> b!300412 (=> res!158364 e!189698)))

(assert (=> b!300412 (= e!189694 e!189698)))

(declare-fun b!300413 () Bool)

(assert (=> b!300413 (= e!189696 e!189697)))

(declare-fun c!48616 () Bool)

(declare-fun lt!149427 () (_ BitVec 64))

(assert (=> b!300413 (= c!48616 (or (= lt!149427 k0!2524) (= (bvadd lt!149427 lt!149427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!300414 () Bool)

(assert (=> b!300414 (= e!189695 (bvsge (x!29729 lt!149428) #b01111111111111111111111111111110))))

(declare-fun d!67741 () Bool)

(assert (=> d!67741 e!189695))

(declare-fun c!48618 () Bool)

(assert (=> d!67741 (= c!48618 (and ((_ is Intermediate!2325) lt!149428) (undefined!3137 lt!149428)))))

(assert (=> d!67741 (= lt!149428 e!189696)))

(declare-fun c!48617 () Bool)

(assert (=> d!67741 (= c!48617 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67741 (= lt!149427 (select (arr!7176 a!3312) lt!149367))))

(assert (=> d!67741 (validMask!0 mask!3809)))

(assert (=> d!67741 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149367 k0!2524 a!3312 mask!3809) lt!149428)))

(declare-fun b!300415 () Bool)

(assert (=> b!300415 (and (bvsge (index!11478 lt!149428) #b00000000000000000000000000000000) (bvslt (index!11478 lt!149428) (size!7528 a!3312)))))

(declare-fun res!158363 () Bool)

(assert (=> b!300415 (= res!158363 (= (select (arr!7176 a!3312) (index!11478 lt!149428)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!300415 (=> res!158363 e!189698)))

(declare-fun b!300416 () Bool)

(assert (=> b!300416 (= e!189697 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149367 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (= (and d!67741 c!48617) b!300411))

(assert (= (and d!67741 (not c!48617)) b!300413))

(assert (= (and b!300413 c!48616) b!300409))

(assert (= (and b!300413 (not c!48616)) b!300416))

(assert (= (and d!67741 c!48618) b!300414))

(assert (= (and d!67741 (not c!48618)) b!300410))

(assert (= (and b!300410 res!158365) b!300412))

(assert (= (and b!300412 (not res!158364)) b!300415))

(assert (= (and b!300415 (not res!158363)) b!300408))

(declare-fun m!312421 () Bool)

(assert (=> b!300408 m!312421))

(assert (=> b!300412 m!312421))

(declare-fun m!312423 () Bool)

(assert (=> d!67741 m!312423))

(assert (=> d!67741 m!312329))

(assert (=> b!300415 m!312421))

(assert (=> b!300416 m!312417))

(assert (=> b!300416 m!312417))

(declare-fun m!312425 () Bool)

(assert (=> b!300416 m!312425))

(assert (=> b!300271 d!67741))

(declare-fun d!67743 () Bool)

(declare-fun lt!149441 () (_ BitVec 32))

(declare-fun lt!149440 () (_ BitVec 32))

(assert (=> d!67743 (= lt!149441 (bvmul (bvxor lt!149440 (bvlshr lt!149440 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67743 (= lt!149440 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67743 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!158366 (let ((h!5323 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29734 (bvmul (bvxor h!5323 (bvlshr h!5323 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29734 (bvlshr x!29734 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!158366 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!158366 #b00000000000000000000000000000000))))))

(assert (=> d!67743 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!149441 (bvlshr lt!149441 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!300271 d!67743))

(declare-fun b!300449 () Bool)

(declare-fun e!189717 () Bool)

(declare-fun call!25852 () Bool)

(assert (=> b!300449 (= e!189717 call!25852)))

(declare-fun bm!25849 () Bool)

(assert (=> bm!25849 (= call!25852 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!300450 () Bool)

(declare-fun e!189718 () Bool)

(declare-fun e!189719 () Bool)

(assert (=> b!300450 (= e!189718 e!189719)))

(declare-fun c!48633 () Bool)

(assert (=> b!300450 (= c!48633 (validKeyInArray!0 (select (arr!7176 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!300451 () Bool)

(assert (=> b!300451 (= e!189719 e!189717)))

(declare-fun lt!149455 () (_ BitVec 64))

(assert (=> b!300451 (= lt!149455 (select (arr!7176 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9365 0))(
  ( (Unit!9366) )
))
(declare-fun lt!149453 () Unit!9365)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15161 (_ BitVec 64) (_ BitVec 32)) Unit!9365)

(assert (=> b!300451 (= lt!149453 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!149455 #b00000000000000000000000000000000))))

(assert (=> b!300451 (arrayContainsKey!0 a!3312 lt!149455 #b00000000000000000000000000000000)))

(declare-fun lt!149454 () Unit!9365)

(assert (=> b!300451 (= lt!149454 lt!149453)))

(declare-fun res!158372 () Bool)

(assert (=> b!300451 (= res!158372 (= (seekEntryOrOpen!0 (select (arr!7176 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2325 #b00000000000000000000000000000000)))))

(assert (=> b!300451 (=> (not res!158372) (not e!189717))))

(declare-fun b!300452 () Bool)

(assert (=> b!300452 (= e!189719 call!25852)))

(declare-fun d!67747 () Bool)

(declare-fun res!158371 () Bool)

(assert (=> d!67747 (=> res!158371 e!189718)))

(assert (=> d!67747 (= res!158371 (bvsge #b00000000000000000000000000000000 (size!7528 a!3312)))))

(assert (=> d!67747 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!189718)))

(assert (= (and d!67747 (not res!158371)) b!300450))

(assert (= (and b!300450 c!48633) b!300451))

(assert (= (and b!300450 (not c!48633)) b!300452))

(assert (= (and b!300451 res!158372) b!300449))

(assert (= (or b!300449 b!300452) bm!25849))

(declare-fun m!312451 () Bool)

(assert (=> bm!25849 m!312451))

(assert (=> b!300450 m!312369))

(assert (=> b!300450 m!312369))

(declare-fun m!312453 () Bool)

(assert (=> b!300450 m!312453))

(assert (=> b!300451 m!312369))

(declare-fun m!312455 () Bool)

(assert (=> b!300451 m!312455))

(declare-fun m!312457 () Bool)

(assert (=> b!300451 m!312457))

(assert (=> b!300451 m!312369))

(declare-fun m!312459 () Bool)

(assert (=> b!300451 m!312459))

(assert (=> b!300267 d!67747))

(check-sat (not b!300407) (not bm!25849) (not d!67741) (not b!300296) (not b!300310) (not b!300451) (not d!67733) (not d!67717) (not b!300450) (not b!300416))
(check-sat)
