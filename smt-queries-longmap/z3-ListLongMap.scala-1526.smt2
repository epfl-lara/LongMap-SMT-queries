; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28730 () Bool)

(assert start!28730)

(declare-fun b!293268 () Bool)

(declare-fun res!154238 () Bool)

(declare-fun e!185434 () Bool)

(assert (=> b!293268 (=> (not res!154238) (not e!185434))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!293268 (= res!154238 (validKeyInArray!0 k0!2524))))

(declare-fun b!293269 () Bool)

(declare-fun res!154237 () Bool)

(declare-fun e!185436 () Bool)

(assert (=> b!293269 (=> (not res!154237) (not e!185436))))

(declare-datatypes ((array!14857 0))(
  ( (array!14858 (arr!7050 (Array (_ BitVec 32) (_ BitVec 64))) (size!7403 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14857)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14857 (_ BitVec 32)) Bool)

(assert (=> b!293269 (= res!154237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun lt!145257 () Bool)

(declare-fun b!293270 () Bool)

(declare-datatypes ((SeekEntryResult!2198 0))(
  ( (MissingZero!2198 (index!10962 (_ BitVec 32))) (Found!2198 (index!10963 (_ BitVec 32))) (Intermediate!2198 (undefined!3010 Bool) (index!10964 (_ BitVec 32)) (x!29162 (_ BitVec 32))) (Undefined!2198) (MissingVacant!2198 (index!10965 (_ BitVec 32))) )
))
(declare-fun lt!145259 () SeekEntryResult!2198)

(get-info :version)

(assert (=> b!293270 (= e!185436 (and lt!145257 (let ((bdg!6217 (not ((_ is Intermediate!2198) lt!145259)))) (and (or bdg!6217 (not (undefined!3010 lt!145259))) (not bdg!6217) (or (bvslt (index!10964 lt!145259) #b00000000000000000000000000000000) (bvsge (index!10964 lt!145259) (size!7403 a!3312)))))))))

(declare-fun lt!145256 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!145258 () SeekEntryResult!2198)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14857 (_ BitVec 32)) SeekEntryResult!2198)

(assert (=> b!293270 (= lt!145258 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145256 k0!2524 (array!14858 (store (arr!7050 a!3312) i!1256 k0!2524) (size!7403 a!3312)) mask!3809))))

(assert (=> b!293270 (= lt!145259 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145256 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293270 (= lt!145256 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!293271 () Bool)

(declare-fun res!154236 () Bool)

(assert (=> b!293271 (=> (not res!154236) (not e!185434))))

(declare-fun arrayContainsKey!0 (array!14857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!293271 (= res!154236 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!293272 () Bool)

(declare-fun res!154235 () Bool)

(assert (=> b!293272 (=> (not res!154235) (not e!185434))))

(assert (=> b!293272 (= res!154235 (and (= (size!7403 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7403 a!3312))))))

(declare-fun b!293273 () Bool)

(assert (=> b!293273 (= e!185434 e!185436)))

(declare-fun res!154240 () Bool)

(assert (=> b!293273 (=> (not res!154240) (not e!185436))))

(declare-fun lt!145260 () SeekEntryResult!2198)

(assert (=> b!293273 (= res!154240 (or lt!145257 (= lt!145260 (MissingVacant!2198 i!1256))))))

(assert (=> b!293273 (= lt!145257 (= lt!145260 (MissingZero!2198 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14857 (_ BitVec 32)) SeekEntryResult!2198)

(assert (=> b!293273 (= lt!145260 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!154239 () Bool)

(assert (=> start!28730 (=> (not res!154239) (not e!185434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28730 (= res!154239 (validMask!0 mask!3809))))

(assert (=> start!28730 e!185434))

(assert (=> start!28730 true))

(declare-fun array_inv!5022 (array!14857) Bool)

(assert (=> start!28730 (array_inv!5022 a!3312)))

(assert (= (and start!28730 res!154239) b!293272))

(assert (= (and b!293272 res!154235) b!293268))

(assert (= (and b!293268 res!154238) b!293271))

(assert (= (and b!293271 res!154236) b!293273))

(assert (= (and b!293273 res!154240) b!293269))

(assert (= (and b!293269 res!154237) b!293270))

(declare-fun m!306533 () Bool)

(assert (=> b!293273 m!306533))

(declare-fun m!306535 () Bool)

(assert (=> b!293270 m!306535))

(declare-fun m!306537 () Bool)

(assert (=> b!293270 m!306537))

(declare-fun m!306539 () Bool)

(assert (=> b!293270 m!306539))

(declare-fun m!306541 () Bool)

(assert (=> b!293270 m!306541))

(declare-fun m!306543 () Bool)

(assert (=> b!293268 m!306543))

(declare-fun m!306545 () Bool)

(assert (=> start!28730 m!306545))

(declare-fun m!306547 () Bool)

(assert (=> start!28730 m!306547))

(declare-fun m!306549 () Bool)

(assert (=> b!293271 m!306549))

(declare-fun m!306551 () Bool)

(assert (=> b!293269 m!306551))

(check-sat (not b!293269) (not b!293268) (not b!293273) (not b!293270) (not start!28730) (not b!293271))
(check-sat)
(get-model)

(declare-fun d!66411 () Bool)

(declare-fun res!154281 () Bool)

(declare-fun e!185459 () Bool)

(assert (=> d!66411 (=> res!154281 e!185459)))

(assert (=> d!66411 (= res!154281 (= (select (arr!7050 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66411 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!185459)))

(declare-fun b!293314 () Bool)

(declare-fun e!185460 () Bool)

(assert (=> b!293314 (= e!185459 e!185460)))

(declare-fun res!154282 () Bool)

(assert (=> b!293314 (=> (not res!154282) (not e!185460))))

(assert (=> b!293314 (= res!154282 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7403 a!3312)))))

(declare-fun b!293315 () Bool)

(assert (=> b!293315 (= e!185460 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66411 (not res!154281)) b!293314))

(assert (= (and b!293314 res!154282) b!293315))

(declare-fun m!306593 () Bool)

(assert (=> d!66411 m!306593))

(declare-fun m!306595 () Bool)

(assert (=> b!293315 m!306595))

(assert (=> b!293271 d!66411))

(declare-fun d!66413 () Bool)

(assert (=> d!66413 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28730 d!66413))

(declare-fun d!66415 () Bool)

(assert (=> d!66415 (= (array_inv!5022 a!3312) (bvsge (size!7403 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28730 d!66415))

(declare-fun e!185486 () SeekEntryResult!2198)

(declare-fun b!293352 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293352 (= e!185486 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145256 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!14858 (store (arr!7050 a!3312) i!1256 k0!2524) (size!7403 a!3312)) mask!3809))))

(declare-fun lt!145305 () SeekEntryResult!2198)

(declare-fun b!293353 () Bool)

(assert (=> b!293353 (and (bvsge (index!10964 lt!145305) #b00000000000000000000000000000000) (bvslt (index!10964 lt!145305) (size!7403 (array!14858 (store (arr!7050 a!3312) i!1256 k0!2524) (size!7403 a!3312)))))))

(declare-fun e!185489 () Bool)

(assert (=> b!293353 (= e!185489 (= (select (arr!7050 (array!14858 (store (arr!7050 a!3312) i!1256 k0!2524) (size!7403 a!3312))) (index!10964 lt!145305)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!293354 () Bool)

(assert (=> b!293354 (and (bvsge (index!10964 lt!145305) #b00000000000000000000000000000000) (bvslt (index!10964 lt!145305) (size!7403 (array!14858 (store (arr!7050 a!3312) i!1256 k0!2524) (size!7403 a!3312)))))))

(declare-fun res!154302 () Bool)

(assert (=> b!293354 (= res!154302 (= (select (arr!7050 (array!14858 (store (arr!7050 a!3312) i!1256 k0!2524) (size!7403 a!3312))) (index!10964 lt!145305)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293354 (=> res!154302 e!185489)))

(declare-fun b!293355 () Bool)

(assert (=> b!293355 (= e!185486 (Intermediate!2198 false lt!145256 #b00000000000000000000000000000000))))

(declare-fun d!66417 () Bool)

(declare-fun e!185490 () Bool)

(assert (=> d!66417 e!185490))

(declare-fun c!47095 () Bool)

(assert (=> d!66417 (= c!47095 (and ((_ is Intermediate!2198) lt!145305) (undefined!3010 lt!145305)))))

(declare-fun e!185488 () SeekEntryResult!2198)

(assert (=> d!66417 (= lt!145305 e!185488)))

(declare-fun c!47094 () Bool)

(assert (=> d!66417 (= c!47094 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!145304 () (_ BitVec 64))

(assert (=> d!66417 (= lt!145304 (select (arr!7050 (array!14858 (store (arr!7050 a!3312) i!1256 k0!2524) (size!7403 a!3312))) lt!145256))))

(assert (=> d!66417 (validMask!0 mask!3809)))

(assert (=> d!66417 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145256 k0!2524 (array!14858 (store (arr!7050 a!3312) i!1256 k0!2524) (size!7403 a!3312)) mask!3809) lt!145305)))

(declare-fun b!293356 () Bool)

(declare-fun e!185487 () Bool)

(assert (=> b!293356 (= e!185490 e!185487)))

(declare-fun res!154301 () Bool)

(assert (=> b!293356 (= res!154301 (and ((_ is Intermediate!2198) lt!145305) (not (undefined!3010 lt!145305)) (bvslt (x!29162 lt!145305) #b01111111111111111111111111111110) (bvsge (x!29162 lt!145305) #b00000000000000000000000000000000) (bvsge (x!29162 lt!145305) #b00000000000000000000000000000000)))))

(assert (=> b!293356 (=> (not res!154301) (not e!185487))))

(declare-fun b!293357 () Bool)

(assert (=> b!293357 (and (bvsge (index!10964 lt!145305) #b00000000000000000000000000000000) (bvslt (index!10964 lt!145305) (size!7403 (array!14858 (store (arr!7050 a!3312) i!1256 k0!2524) (size!7403 a!3312)))))))

(declare-fun res!154303 () Bool)

(assert (=> b!293357 (= res!154303 (= (select (arr!7050 (array!14858 (store (arr!7050 a!3312) i!1256 k0!2524) (size!7403 a!3312))) (index!10964 lt!145305)) k0!2524))))

(assert (=> b!293357 (=> res!154303 e!185489)))

(assert (=> b!293357 (= e!185487 e!185489)))

(declare-fun b!293358 () Bool)

(assert (=> b!293358 (= e!185490 (bvsge (x!29162 lt!145305) #b01111111111111111111111111111110))))

(declare-fun b!293359 () Bool)

(assert (=> b!293359 (= e!185488 e!185486)))

(declare-fun c!47093 () Bool)

(assert (=> b!293359 (= c!47093 (or (= lt!145304 k0!2524) (= (bvadd lt!145304 lt!145304) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293360 () Bool)

(assert (=> b!293360 (= e!185488 (Intermediate!2198 true lt!145256 #b00000000000000000000000000000000))))

(assert (= (and d!66417 c!47094) b!293360))

(assert (= (and d!66417 (not c!47094)) b!293359))

(assert (= (and b!293359 c!47093) b!293355))

(assert (= (and b!293359 (not c!47093)) b!293352))

(assert (= (and d!66417 c!47095) b!293358))

(assert (= (and d!66417 (not c!47095)) b!293356))

(assert (= (and b!293356 res!154301) b!293357))

(assert (= (and b!293357 (not res!154303)) b!293354))

(assert (= (and b!293354 (not res!154302)) b!293353))

(declare-fun m!306613 () Bool)

(assert (=> b!293353 m!306613))

(declare-fun m!306615 () Bool)

(assert (=> d!66417 m!306615))

(assert (=> d!66417 m!306545))

(assert (=> b!293354 m!306613))

(assert (=> b!293357 m!306613))

(declare-fun m!306617 () Bool)

(assert (=> b!293352 m!306617))

(assert (=> b!293352 m!306617))

(declare-fun m!306619 () Bool)

(assert (=> b!293352 m!306619))

(assert (=> b!293270 d!66417))

(declare-fun e!185495 () SeekEntryResult!2198)

(declare-fun b!293369 () Bool)

(assert (=> b!293369 (= e!185495 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145256 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!293370 () Bool)

(declare-fun lt!145311 () SeekEntryResult!2198)

(assert (=> b!293370 (and (bvsge (index!10964 lt!145311) #b00000000000000000000000000000000) (bvslt (index!10964 lt!145311) (size!7403 a!3312)))))

(declare-fun e!185498 () Bool)

(assert (=> b!293370 (= e!185498 (= (select (arr!7050 a!3312) (index!10964 lt!145311)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!293371 () Bool)

(assert (=> b!293371 (and (bvsge (index!10964 lt!145311) #b00000000000000000000000000000000) (bvslt (index!10964 lt!145311) (size!7403 a!3312)))))

(declare-fun res!154305 () Bool)

(assert (=> b!293371 (= res!154305 (= (select (arr!7050 a!3312) (index!10964 lt!145311)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293371 (=> res!154305 e!185498)))

(declare-fun b!293372 () Bool)

(assert (=> b!293372 (= e!185495 (Intermediate!2198 false lt!145256 #b00000000000000000000000000000000))))

(declare-fun d!66427 () Bool)

(declare-fun e!185499 () Bool)

(assert (=> d!66427 e!185499))

(declare-fun c!47102 () Bool)

(assert (=> d!66427 (= c!47102 (and ((_ is Intermediate!2198) lt!145311) (undefined!3010 lt!145311)))))

(declare-fun e!185497 () SeekEntryResult!2198)

(assert (=> d!66427 (= lt!145311 e!185497)))

(declare-fun c!47101 () Bool)

(assert (=> d!66427 (= c!47101 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!145310 () (_ BitVec 64))

(assert (=> d!66427 (= lt!145310 (select (arr!7050 a!3312) lt!145256))))

(assert (=> d!66427 (validMask!0 mask!3809)))

(assert (=> d!66427 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145256 k0!2524 a!3312 mask!3809) lt!145311)))

(declare-fun b!293373 () Bool)

(declare-fun e!185496 () Bool)

(assert (=> b!293373 (= e!185499 e!185496)))

(declare-fun res!154304 () Bool)

(assert (=> b!293373 (= res!154304 (and ((_ is Intermediate!2198) lt!145311) (not (undefined!3010 lt!145311)) (bvslt (x!29162 lt!145311) #b01111111111111111111111111111110) (bvsge (x!29162 lt!145311) #b00000000000000000000000000000000) (bvsge (x!29162 lt!145311) #b00000000000000000000000000000000)))))

(assert (=> b!293373 (=> (not res!154304) (not e!185496))))

(declare-fun b!293374 () Bool)

(assert (=> b!293374 (and (bvsge (index!10964 lt!145311) #b00000000000000000000000000000000) (bvslt (index!10964 lt!145311) (size!7403 a!3312)))))

(declare-fun res!154306 () Bool)

(assert (=> b!293374 (= res!154306 (= (select (arr!7050 a!3312) (index!10964 lt!145311)) k0!2524))))

(assert (=> b!293374 (=> res!154306 e!185498)))

(assert (=> b!293374 (= e!185496 e!185498)))

(declare-fun b!293375 () Bool)

(assert (=> b!293375 (= e!185499 (bvsge (x!29162 lt!145311) #b01111111111111111111111111111110))))

(declare-fun b!293376 () Bool)

(assert (=> b!293376 (= e!185497 e!185495)))

(declare-fun c!47100 () Bool)

(assert (=> b!293376 (= c!47100 (or (= lt!145310 k0!2524) (= (bvadd lt!145310 lt!145310) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293377 () Bool)

(assert (=> b!293377 (= e!185497 (Intermediate!2198 true lt!145256 #b00000000000000000000000000000000))))

(assert (= (and d!66427 c!47101) b!293377))

(assert (= (and d!66427 (not c!47101)) b!293376))

(assert (= (and b!293376 c!47100) b!293372))

(assert (= (and b!293376 (not c!47100)) b!293369))

(assert (= (and d!66427 c!47102) b!293375))

(assert (= (and d!66427 (not c!47102)) b!293373))

(assert (= (and b!293373 res!154304) b!293374))

(assert (= (and b!293374 (not res!154306)) b!293371))

(assert (= (and b!293371 (not res!154305)) b!293370))

(declare-fun m!306621 () Bool)

(assert (=> b!293370 m!306621))

(declare-fun m!306623 () Bool)

(assert (=> d!66427 m!306623))

(assert (=> d!66427 m!306545))

(assert (=> b!293371 m!306621))

(assert (=> b!293374 m!306621))

(assert (=> b!293369 m!306617))

(assert (=> b!293369 m!306617))

(declare-fun m!306625 () Bool)

(assert (=> b!293369 m!306625))

(assert (=> b!293270 d!66427))

(declare-fun d!66429 () Bool)

(declare-fun lt!145319 () (_ BitVec 32))

(declare-fun lt!145318 () (_ BitVec 32))

(assert (=> d!66429 (= lt!145319 (bvmul (bvxor lt!145318 (bvlshr lt!145318 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66429 (= lt!145318 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66429 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154313 (let ((h!5239 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29167 (bvmul (bvxor h!5239 (bvlshr h!5239 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29167 (bvlshr x!29167 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154313 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154313 #b00000000000000000000000000000000))))))

(assert (=> d!66429 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!145319 (bvlshr lt!145319 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!293270 d!66429))

(declare-fun d!66431 () Bool)

(assert (=> d!66431 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!293268 d!66431))

(declare-fun b!293438 () Bool)

(declare-fun e!185538 () Bool)

(declare-fun call!25651 () Bool)

(assert (=> b!293438 (= e!185538 call!25651)))

(declare-fun b!293439 () Bool)

(declare-fun e!185537 () Bool)

(assert (=> b!293439 (= e!185538 e!185537)))

(declare-fun lt!145344 () (_ BitVec 64))

(assert (=> b!293439 (= lt!145344 (select (arr!7050 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9138 0))(
  ( (Unit!9139) )
))
(declare-fun lt!145343 () Unit!9138)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14857 (_ BitVec 64) (_ BitVec 32)) Unit!9138)

(assert (=> b!293439 (= lt!145343 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145344 #b00000000000000000000000000000000))))

(assert (=> b!293439 (arrayContainsKey!0 a!3312 lt!145344 #b00000000000000000000000000000000)))

(declare-fun lt!145345 () Unit!9138)

(assert (=> b!293439 (= lt!145345 lt!145343)))

(declare-fun res!154331 () Bool)

(assert (=> b!293439 (= res!154331 (= (seekEntryOrOpen!0 (select (arr!7050 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2198 #b00000000000000000000000000000000)))))

(assert (=> b!293439 (=> (not res!154331) (not e!185537))))

(declare-fun bm!25648 () Bool)

(assert (=> bm!25648 (= call!25651 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!66435 () Bool)

(declare-fun res!154332 () Bool)

(declare-fun e!185539 () Bool)

(assert (=> d!66435 (=> res!154332 e!185539)))

(assert (=> d!66435 (= res!154332 (bvsge #b00000000000000000000000000000000 (size!7403 a!3312)))))

(assert (=> d!66435 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!185539)))

(declare-fun b!293440 () Bool)

(assert (=> b!293440 (= e!185539 e!185538)))

(declare-fun c!47122 () Bool)

(assert (=> b!293440 (= c!47122 (validKeyInArray!0 (select (arr!7050 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!293441 () Bool)

(assert (=> b!293441 (= e!185537 call!25651)))

(assert (= (and d!66435 (not res!154332)) b!293440))

(assert (= (and b!293440 c!47122) b!293439))

(assert (= (and b!293440 (not c!47122)) b!293438))

(assert (= (and b!293439 res!154331) b!293441))

(assert (= (or b!293441 b!293438) bm!25648))

(assert (=> b!293439 m!306593))

(declare-fun m!306655 () Bool)

(assert (=> b!293439 m!306655))

(declare-fun m!306657 () Bool)

(assert (=> b!293439 m!306657))

(assert (=> b!293439 m!306593))

(declare-fun m!306659 () Bool)

(assert (=> b!293439 m!306659))

(declare-fun m!306661 () Bool)

(assert (=> bm!25648 m!306661))

(assert (=> b!293440 m!306593))

(assert (=> b!293440 m!306593))

(declare-fun m!306663 () Bool)

(assert (=> b!293440 m!306663))

(assert (=> b!293269 d!66435))

(declare-fun lt!145362 () SeekEntryResult!2198)

(declare-fun b!293466 () Bool)

(declare-fun e!185557 () SeekEntryResult!2198)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14857 (_ BitVec 32)) SeekEntryResult!2198)

(assert (=> b!293466 (= e!185557 (seekKeyOrZeroReturnVacant!0 (x!29162 lt!145362) (index!10964 lt!145362) (index!10964 lt!145362) k0!2524 a!3312 mask!3809))))

(declare-fun b!293467 () Bool)

(assert (=> b!293467 (= e!185557 (MissingZero!2198 (index!10964 lt!145362)))))

(declare-fun b!293468 () Bool)

(declare-fun e!185555 () SeekEntryResult!2198)

(declare-fun e!185556 () SeekEntryResult!2198)

(assert (=> b!293468 (= e!185555 e!185556)))

(declare-fun lt!145361 () (_ BitVec 64))

(assert (=> b!293468 (= lt!145361 (select (arr!7050 a!3312) (index!10964 lt!145362)))))

(declare-fun c!47134 () Bool)

(assert (=> b!293468 (= c!47134 (= lt!145361 k0!2524))))

(declare-fun b!293469 () Bool)

(declare-fun c!47133 () Bool)

(assert (=> b!293469 (= c!47133 (= lt!145361 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293469 (= e!185556 e!185557)))

(declare-fun d!66445 () Bool)

(declare-fun lt!145363 () SeekEntryResult!2198)

(assert (=> d!66445 (and (or ((_ is Undefined!2198) lt!145363) (not ((_ is Found!2198) lt!145363)) (and (bvsge (index!10963 lt!145363) #b00000000000000000000000000000000) (bvslt (index!10963 lt!145363) (size!7403 a!3312)))) (or ((_ is Undefined!2198) lt!145363) ((_ is Found!2198) lt!145363) (not ((_ is MissingZero!2198) lt!145363)) (and (bvsge (index!10962 lt!145363) #b00000000000000000000000000000000) (bvslt (index!10962 lt!145363) (size!7403 a!3312)))) (or ((_ is Undefined!2198) lt!145363) ((_ is Found!2198) lt!145363) ((_ is MissingZero!2198) lt!145363) (not ((_ is MissingVacant!2198) lt!145363)) (and (bvsge (index!10965 lt!145363) #b00000000000000000000000000000000) (bvslt (index!10965 lt!145363) (size!7403 a!3312)))) (or ((_ is Undefined!2198) lt!145363) (ite ((_ is Found!2198) lt!145363) (= (select (arr!7050 a!3312) (index!10963 lt!145363)) k0!2524) (ite ((_ is MissingZero!2198) lt!145363) (= (select (arr!7050 a!3312) (index!10962 lt!145363)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2198) lt!145363) (= (select (arr!7050 a!3312) (index!10965 lt!145363)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66445 (= lt!145363 e!185555)))

(declare-fun c!47132 () Bool)

(assert (=> d!66445 (= c!47132 (and ((_ is Intermediate!2198) lt!145362) (undefined!3010 lt!145362)))))

(assert (=> d!66445 (= lt!145362 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66445 (validMask!0 mask!3809)))

(assert (=> d!66445 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!145363)))

(declare-fun b!293470 () Bool)

(assert (=> b!293470 (= e!185555 Undefined!2198)))

(declare-fun b!293471 () Bool)

(assert (=> b!293471 (= e!185556 (Found!2198 (index!10964 lt!145362)))))

(assert (= (and d!66445 c!47132) b!293470))

(assert (= (and d!66445 (not c!47132)) b!293468))

(assert (= (and b!293468 c!47134) b!293471))

(assert (= (and b!293468 (not c!47134)) b!293469))

(assert (= (and b!293469 c!47133) b!293467))

(assert (= (and b!293469 (not c!47133)) b!293466))

(declare-fun m!306675 () Bool)

(assert (=> b!293466 m!306675))

(declare-fun m!306677 () Bool)

(assert (=> b!293468 m!306677))

(assert (=> d!66445 m!306545))

(declare-fun m!306679 () Bool)

(assert (=> d!66445 m!306679))

(assert (=> d!66445 m!306541))

(assert (=> d!66445 m!306541))

(declare-fun m!306681 () Bool)

(assert (=> d!66445 m!306681))

(declare-fun m!306683 () Bool)

(assert (=> d!66445 m!306683))

(declare-fun m!306685 () Bool)

(assert (=> d!66445 m!306685))

(assert (=> b!293273 d!66445))

(check-sat (not b!293315) (not d!66445) (not d!66417) (not b!293369) (not b!293439) (not b!293440) (not b!293466) (not b!293352) (not bm!25648) (not d!66427))
(check-sat)
