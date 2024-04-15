; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33128 () Bool)

(assert start!33128)

(declare-fun res!181513 () Bool)

(declare-fun e!202295 () Bool)

(assert (=> start!33128 (=> (not res!181513) (not e!202295))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33128 (= res!181513 (validMask!0 mask!3777))))

(assert (=> start!33128 e!202295))

(declare-datatypes ((array!16842 0))(
  ( (array!16843 (arr!7965 (Array (_ BitVec 32) (_ BitVec 64))) (size!8318 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16842)

(declare-fun array_inv!5937 (array!16842) Bool)

(assert (=> start!33128 (array_inv!5937 a!3305)))

(assert (=> start!33128 true))

(declare-fun b!329344 () Bool)

(declare-fun res!181514 () Bool)

(declare-fun e!202298 () Bool)

(assert (=> b!329344 (=> (not res!181514) (not e!202298))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!329344 (= res!181514 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7965 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7965 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7965 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!329345 () Bool)

(declare-fun res!181512 () Bool)

(assert (=> b!329345 (=> (not res!181512) (not e!202295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16842 (_ BitVec 32)) Bool)

(assert (=> b!329345 (= res!181512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!329346 () Bool)

(declare-fun res!181520 () Bool)

(assert (=> b!329346 (=> (not res!181520) (not e!202298))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!329346 (= res!181520 (and (= (select (arr!7965 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8318 a!3305))))))

(declare-fun b!329347 () Bool)

(assert (=> b!329347 (= e!202295 e!202298)))

(declare-fun res!181521 () Bool)

(assert (=> b!329347 (=> (not res!181521) (not e!202298))))

(declare-datatypes ((SeekEntryResult!3095 0))(
  ( (MissingZero!3095 (index!14556 (_ BitVec 32))) (Found!3095 (index!14557 (_ BitVec 32))) (Intermediate!3095 (undefined!3907 Bool) (index!14558 (_ BitVec 32)) (x!32848 (_ BitVec 32))) (Undefined!3095) (MissingVacant!3095 (index!14559 (_ BitVec 32))) )
))
(declare-fun lt!158059 () SeekEntryResult!3095)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16842 (_ BitVec 32)) SeekEntryResult!3095)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329347 (= res!181521 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158059))))

(assert (=> b!329347 (= lt!158059 (Intermediate!3095 false resIndex!58 resX!58))))

(declare-fun b!329348 () Bool)

(declare-datatypes ((Unit!10176 0))(
  ( (Unit!10177) )
))
(declare-fun e!202296 () Unit!10176)

(declare-fun Unit!10178 () Unit!10176)

(assert (=> b!329348 (= e!202296 Unit!10178)))

(assert (=> b!329348 false))

(declare-fun b!329349 () Bool)

(declare-fun res!181517 () Bool)

(assert (=> b!329349 (=> (not res!181517) (not e!202298))))

(assert (=> b!329349 (= res!181517 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158059))))

(declare-fun b!329350 () Bool)

(declare-fun Unit!10179 () Unit!10176)

(assert (=> b!329350 (= e!202296 Unit!10179)))

(declare-fun b!329351 () Bool)

(assert (=> b!329351 (= e!202298 true)))

(declare-fun lt!158060 () Unit!10176)

(assert (=> b!329351 (= lt!158060 e!202296)))

(declare-fun c!51557 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!329351 (= c!51557 ((_ is Intermediate!3095) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun b!329352 () Bool)

(declare-fun res!181518 () Bool)

(assert (=> b!329352 (=> (not res!181518) (not e!202295))))

(declare-fun arrayContainsKey!0 (array!16842 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!329352 (= res!181518 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!329353 () Bool)

(declare-fun res!181515 () Bool)

(assert (=> b!329353 (=> (not res!181515) (not e!202295))))

(assert (=> b!329353 (= res!181515 (and (= (size!8318 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8318 a!3305))))))

(declare-fun b!329354 () Bool)

(declare-fun res!181519 () Bool)

(assert (=> b!329354 (=> (not res!181519) (not e!202295))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!329354 (= res!181519 (validKeyInArray!0 k0!2497))))

(declare-fun b!329355 () Bool)

(declare-fun res!181516 () Bool)

(assert (=> b!329355 (=> (not res!181516) (not e!202295))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16842 (_ BitVec 32)) SeekEntryResult!3095)

(assert (=> b!329355 (= res!181516 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3095 i!1250)))))

(assert (= (and start!33128 res!181513) b!329353))

(assert (= (and b!329353 res!181515) b!329354))

(assert (= (and b!329354 res!181519) b!329352))

(assert (= (and b!329352 res!181518) b!329355))

(assert (= (and b!329355 res!181516) b!329345))

(assert (= (and b!329345 res!181512) b!329347))

(assert (= (and b!329347 res!181521) b!329346))

(assert (= (and b!329346 res!181520) b!329349))

(assert (= (and b!329349 res!181517) b!329344))

(assert (= (and b!329344 res!181514) b!329351))

(assert (= (and b!329351 c!51557) b!329350))

(assert (= (and b!329351 (not c!51557)) b!329348))

(declare-fun m!334477 () Bool)

(assert (=> b!329346 m!334477))

(declare-fun m!334479 () Bool)

(assert (=> b!329349 m!334479))

(declare-fun m!334481 () Bool)

(assert (=> b!329347 m!334481))

(assert (=> b!329347 m!334481))

(declare-fun m!334483 () Bool)

(assert (=> b!329347 m!334483))

(declare-fun m!334485 () Bool)

(assert (=> b!329354 m!334485))

(declare-fun m!334487 () Bool)

(assert (=> start!33128 m!334487))

(declare-fun m!334489 () Bool)

(assert (=> start!33128 m!334489))

(declare-fun m!334491 () Bool)

(assert (=> b!329345 m!334491))

(declare-fun m!334493 () Bool)

(assert (=> b!329352 m!334493))

(declare-fun m!334495 () Bool)

(assert (=> b!329344 m!334495))

(declare-fun m!334497 () Bool)

(assert (=> b!329355 m!334497))

(declare-fun m!334499 () Bool)

(assert (=> b!329351 m!334499))

(assert (=> b!329351 m!334499))

(declare-fun m!334501 () Bool)

(assert (=> b!329351 m!334501))

(check-sat (not b!329347) (not b!329354) (not b!329349) (not b!329352) (not b!329345) (not start!33128) (not b!329355) (not b!329351))
(check-sat)
(get-model)

(declare-fun b!329452 () Bool)

(declare-fun lt!158077 () SeekEntryResult!3095)

(assert (=> b!329452 (and (bvsge (index!14558 lt!158077) #b00000000000000000000000000000000) (bvslt (index!14558 lt!158077) (size!8318 a!3305)))))

(declare-fun res!181595 () Bool)

(assert (=> b!329452 (= res!181595 (= (select (arr!7965 a!3305) (index!14558 lt!158077)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202343 () Bool)

(assert (=> b!329452 (=> res!181595 e!202343)))

(declare-fun b!329453 () Bool)

(declare-fun e!202341 () Bool)

(assert (=> b!329453 (= e!202341 (bvsge (x!32848 lt!158077) #b01111111111111111111111111111110))))

(declare-fun b!329454 () Bool)

(declare-fun e!202342 () SeekEntryResult!3095)

(assert (=> b!329454 (= e!202342 (Intermediate!3095 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!329455 () Bool)

(declare-fun e!202340 () Bool)

(assert (=> b!329455 (= e!202341 e!202340)))

(declare-fun res!181594 () Bool)

(assert (=> b!329455 (= res!181594 (and ((_ is Intermediate!3095) lt!158077) (not (undefined!3907 lt!158077)) (bvslt (x!32848 lt!158077) #b01111111111111111111111111111110) (bvsge (x!32848 lt!158077) #b00000000000000000000000000000000) (bvsge (x!32848 lt!158077) #b00000000000000000000000000000000)))))

(assert (=> b!329455 (=> (not res!181594) (not e!202340))))

(declare-fun b!329456 () Bool)

(assert (=> b!329456 (and (bvsge (index!14558 lt!158077) #b00000000000000000000000000000000) (bvslt (index!14558 lt!158077) (size!8318 a!3305)))))

(assert (=> b!329456 (= e!202343 (= (select (arr!7965 a!3305) (index!14558 lt!158077)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!329457 () Bool)

(assert (=> b!329457 (= e!202342 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun d!70013 () Bool)

(assert (=> d!70013 e!202341))

(declare-fun c!51570 () Bool)

(assert (=> d!70013 (= c!51570 (and ((_ is Intermediate!3095) lt!158077) (undefined!3907 lt!158077)))))

(declare-fun e!202339 () SeekEntryResult!3095)

(assert (=> d!70013 (= lt!158077 e!202339)))

(declare-fun c!51572 () Bool)

(assert (=> d!70013 (= c!51572 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!158078 () (_ BitVec 64))

(assert (=> d!70013 (= lt!158078 (select (arr!7965 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!70013 (validMask!0 mask!3777)))

(assert (=> d!70013 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158077)))

(declare-fun b!329458 () Bool)

(assert (=> b!329458 (= e!202339 (Intermediate!3095 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!329459 () Bool)

(assert (=> b!329459 (= e!202339 e!202342)))

(declare-fun c!51571 () Bool)

(assert (=> b!329459 (= c!51571 (or (= lt!158078 k0!2497) (= (bvadd lt!158078 lt!158078) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329460 () Bool)

(assert (=> b!329460 (and (bvsge (index!14558 lt!158077) #b00000000000000000000000000000000) (bvslt (index!14558 lt!158077) (size!8318 a!3305)))))

(declare-fun res!181596 () Bool)

(assert (=> b!329460 (= res!181596 (= (select (arr!7965 a!3305) (index!14558 lt!158077)) k0!2497))))

(assert (=> b!329460 (=> res!181596 e!202343)))

(assert (=> b!329460 (= e!202340 e!202343)))

(assert (= (and d!70013 c!51572) b!329458))

(assert (= (and d!70013 (not c!51572)) b!329459))

(assert (= (and b!329459 c!51571) b!329454))

(assert (= (and b!329459 (not c!51571)) b!329457))

(assert (= (and d!70013 c!51570) b!329453))

(assert (= (and d!70013 (not c!51570)) b!329455))

(assert (= (and b!329455 res!181594) b!329460))

(assert (= (and b!329460 (not res!181596)) b!329452))

(assert (= (and b!329452 (not res!181595)) b!329456))

(assert (=> d!70013 m!334481))

(declare-fun m!334559 () Bool)

(assert (=> d!70013 m!334559))

(assert (=> d!70013 m!334487))

(declare-fun m!334561 () Bool)

(assert (=> b!329456 m!334561))

(assert (=> b!329452 m!334561))

(assert (=> b!329460 m!334561))

(assert (=> b!329457 m!334481))

(declare-fun m!334563 () Bool)

(assert (=> b!329457 m!334563))

(assert (=> b!329457 m!334563))

(declare-fun m!334565 () Bool)

(assert (=> b!329457 m!334565))

(assert (=> b!329347 d!70013))

(declare-fun d!70023 () Bool)

(declare-fun lt!158090 () (_ BitVec 32))

(declare-fun lt!158089 () (_ BitVec 32))

(assert (=> d!70023 (= lt!158090 (bvmul (bvxor lt!158089 (bvlshr lt!158089 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70023 (= lt!158089 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70023 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!181597 (let ((h!5386 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32852 (bvmul (bvxor h!5386 (bvlshr h!5386 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32852 (bvlshr x!32852 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!181597 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!181597 #b00000000000000000000000000000000))))))

(assert (=> d!70023 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!158090 (bvlshr lt!158090 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!329347 d!70023))

(declare-fun d!70025 () Bool)

(declare-fun res!181608 () Bool)

(declare-fun e!202364 () Bool)

(assert (=> d!70025 (=> res!181608 e!202364)))

(assert (=> d!70025 (= res!181608 (= (select (arr!7965 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!70025 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!202364)))

(declare-fun b!329493 () Bool)

(declare-fun e!202365 () Bool)

(assert (=> b!329493 (= e!202364 e!202365)))

(declare-fun res!181609 () Bool)

(assert (=> b!329493 (=> (not res!181609) (not e!202365))))

(assert (=> b!329493 (= res!181609 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8318 a!3305)))))

(declare-fun b!329494 () Bool)

(assert (=> b!329494 (= e!202365 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70025 (not res!181608)) b!329493))

(assert (= (and b!329493 res!181609) b!329494))

(declare-fun m!334567 () Bool)

(assert (=> d!70025 m!334567))

(declare-fun m!334569 () Bool)

(assert (=> b!329494 m!334569))

(assert (=> b!329352 d!70025))

(declare-fun b!329497 () Bool)

(declare-fun lt!158095 () SeekEntryResult!3095)

(assert (=> b!329497 (and (bvsge (index!14558 lt!158095) #b00000000000000000000000000000000) (bvslt (index!14558 lt!158095) (size!8318 a!3305)))))

(declare-fun res!181611 () Bool)

(assert (=> b!329497 (= res!181611 (= (select (arr!7965 a!3305) (index!14558 lt!158095)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202370 () Bool)

(assert (=> b!329497 (=> res!181611 e!202370)))

(declare-fun b!329498 () Bool)

(declare-fun e!202368 () Bool)

(assert (=> b!329498 (= e!202368 (bvsge (x!32848 lt!158095) #b01111111111111111111111111111110))))

(declare-fun e!202369 () SeekEntryResult!3095)

(declare-fun b!329499 () Bool)

(assert (=> b!329499 (= e!202369 (Intermediate!3095 false (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!329500 () Bool)

(declare-fun e!202367 () Bool)

(assert (=> b!329500 (= e!202368 e!202367)))

(declare-fun res!181610 () Bool)

(assert (=> b!329500 (= res!181610 (and ((_ is Intermediate!3095) lt!158095) (not (undefined!3907 lt!158095)) (bvslt (x!32848 lt!158095) #b01111111111111111111111111111110) (bvsge (x!32848 lt!158095) #b00000000000000000000000000000000) (bvsge (x!32848 lt!158095) (bvadd #b00000000000000000000000000000001 x!1490))))))

(assert (=> b!329500 (=> (not res!181610) (not e!202367))))

(declare-fun b!329501 () Bool)

(assert (=> b!329501 (and (bvsge (index!14558 lt!158095) #b00000000000000000000000000000000) (bvslt (index!14558 lt!158095) (size!8318 a!3305)))))

(assert (=> b!329501 (= e!202370 (= (select (arr!7965 a!3305) (index!14558 lt!158095)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!329502 () Bool)

(assert (=> b!329502 (= e!202369 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun d!70027 () Bool)

(assert (=> d!70027 e!202368))

(declare-fun c!51585 () Bool)

(assert (=> d!70027 (= c!51585 (and ((_ is Intermediate!3095) lt!158095) (undefined!3907 lt!158095)))))

(declare-fun e!202366 () SeekEntryResult!3095)

(assert (=> d!70027 (= lt!158095 e!202366)))

(declare-fun c!51587 () Bool)

(assert (=> d!70027 (= c!51587 (bvsge (bvadd #b00000000000000000000000000000001 x!1490) #b01111111111111111111111111111110))))

(declare-fun lt!158096 () (_ BitVec 64))

(assert (=> d!70027 (= lt!158096 (select (arr!7965 a!3305) (nextIndex!0 index!1840 x!1490 mask!3777)))))

(assert (=> d!70027 (validMask!0 mask!3777)))

(assert (=> d!70027 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777) lt!158095)))

(declare-fun b!329503 () Bool)

(assert (=> b!329503 (= e!202366 (Intermediate!3095 true (nextIndex!0 index!1840 x!1490 mask!3777) (bvadd #b00000000000000000000000000000001 x!1490)))))

(declare-fun b!329504 () Bool)

(assert (=> b!329504 (= e!202366 e!202369)))

(declare-fun c!51586 () Bool)

(assert (=> b!329504 (= c!51586 (or (= lt!158096 k0!2497) (= (bvadd lt!158096 lt!158096) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329505 () Bool)

(assert (=> b!329505 (and (bvsge (index!14558 lt!158095) #b00000000000000000000000000000000) (bvslt (index!14558 lt!158095) (size!8318 a!3305)))))

(declare-fun res!181612 () Bool)

(assert (=> b!329505 (= res!181612 (= (select (arr!7965 a!3305) (index!14558 lt!158095)) k0!2497))))

(assert (=> b!329505 (=> res!181612 e!202370)))

(assert (=> b!329505 (= e!202367 e!202370)))

(assert (= (and d!70027 c!51587) b!329503))

(assert (= (and d!70027 (not c!51587)) b!329504))

(assert (= (and b!329504 c!51586) b!329499))

(assert (= (and b!329504 (not c!51586)) b!329502))

(assert (= (and d!70027 c!51585) b!329498))

(assert (= (and d!70027 (not c!51585)) b!329500))

(assert (= (and b!329500 res!181610) b!329505))

(assert (= (and b!329505 (not res!181612)) b!329497))

(assert (= (and b!329497 (not res!181611)) b!329501))

(assert (=> d!70027 m!334499))

(declare-fun m!334571 () Bool)

(assert (=> d!70027 m!334571))

(assert (=> d!70027 m!334487))

(declare-fun m!334573 () Bool)

(assert (=> b!329501 m!334573))

(assert (=> b!329497 m!334573))

(assert (=> b!329505 m!334573))

(assert (=> b!329502 m!334499))

(declare-fun m!334575 () Bool)

(assert (=> b!329502 m!334575))

(assert (=> b!329502 m!334575))

(declare-fun m!334577 () Bool)

(assert (=> b!329502 m!334577))

(assert (=> b!329351 d!70027))

(declare-fun d!70029 () Bool)

(declare-fun lt!158104 () (_ BitVec 32))

(assert (=> d!70029 (and (bvsge lt!158104 #b00000000000000000000000000000000) (bvslt lt!158104 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70029 (= lt!158104 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!70029 (validMask!0 mask!3777)))

(assert (=> d!70029 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!158104)))

(declare-fun bs!11384 () Bool)

(assert (= bs!11384 d!70029))

(declare-fun m!334589 () Bool)

(assert (=> bs!11384 m!334589))

(assert (=> bs!11384 m!334487))

(assert (=> b!329351 d!70029))

(declare-fun e!202405 () SeekEntryResult!3095)

(declare-fun b!329569 () Bool)

(declare-fun lt!158129 () SeekEntryResult!3095)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16842 (_ BitVec 32)) SeekEntryResult!3095)

(assert (=> b!329569 (= e!202405 (seekKeyOrZeroReturnVacant!0 (x!32848 lt!158129) (index!14558 lt!158129) (index!14558 lt!158129) k0!2497 a!3305 mask!3777))))

(declare-fun b!329570 () Bool)

(declare-fun e!202407 () SeekEntryResult!3095)

(assert (=> b!329570 (= e!202407 Undefined!3095)))

(declare-fun b!329571 () Bool)

(assert (=> b!329571 (= e!202405 (MissingZero!3095 (index!14558 lt!158129)))))

(declare-fun d!70033 () Bool)

(declare-fun lt!158128 () SeekEntryResult!3095)

(assert (=> d!70033 (and (or ((_ is Undefined!3095) lt!158128) (not ((_ is Found!3095) lt!158128)) (and (bvsge (index!14557 lt!158128) #b00000000000000000000000000000000) (bvslt (index!14557 lt!158128) (size!8318 a!3305)))) (or ((_ is Undefined!3095) lt!158128) ((_ is Found!3095) lt!158128) (not ((_ is MissingZero!3095) lt!158128)) (and (bvsge (index!14556 lt!158128) #b00000000000000000000000000000000) (bvslt (index!14556 lt!158128) (size!8318 a!3305)))) (or ((_ is Undefined!3095) lt!158128) ((_ is Found!3095) lt!158128) ((_ is MissingZero!3095) lt!158128) (not ((_ is MissingVacant!3095) lt!158128)) (and (bvsge (index!14559 lt!158128) #b00000000000000000000000000000000) (bvslt (index!14559 lt!158128) (size!8318 a!3305)))) (or ((_ is Undefined!3095) lt!158128) (ite ((_ is Found!3095) lt!158128) (= (select (arr!7965 a!3305) (index!14557 lt!158128)) k0!2497) (ite ((_ is MissingZero!3095) lt!158128) (= (select (arr!7965 a!3305) (index!14556 lt!158128)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3095) lt!158128) (= (select (arr!7965 a!3305) (index!14559 lt!158128)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70033 (= lt!158128 e!202407)))

(declare-fun c!51613 () Bool)

(assert (=> d!70033 (= c!51613 (and ((_ is Intermediate!3095) lt!158129) (undefined!3907 lt!158129)))))

(assert (=> d!70033 (= lt!158129 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!70033 (validMask!0 mask!3777)))

(assert (=> d!70033 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!158128)))

(declare-fun b!329572 () Bool)

(declare-fun e!202406 () SeekEntryResult!3095)

(assert (=> b!329572 (= e!202406 (Found!3095 (index!14558 lt!158129)))))

(declare-fun b!329573 () Bool)

(assert (=> b!329573 (= e!202407 e!202406)))

(declare-fun lt!158130 () (_ BitVec 64))

(assert (=> b!329573 (= lt!158130 (select (arr!7965 a!3305) (index!14558 lt!158129)))))

(declare-fun c!51614 () Bool)

(assert (=> b!329573 (= c!51614 (= lt!158130 k0!2497))))

(declare-fun b!329574 () Bool)

(declare-fun c!51612 () Bool)

(assert (=> b!329574 (= c!51612 (= lt!158130 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!329574 (= e!202406 e!202405)))

(assert (= (and d!70033 c!51613) b!329570))

(assert (= (and d!70033 (not c!51613)) b!329573))

(assert (= (and b!329573 c!51614) b!329572))

(assert (= (and b!329573 (not c!51614)) b!329574))

(assert (= (and b!329574 c!51612) b!329571))

(assert (= (and b!329574 (not c!51612)) b!329569))

(declare-fun m!334617 () Bool)

(assert (=> b!329569 m!334617))

(assert (=> d!70033 m!334481))

(assert (=> d!70033 m!334481))

(assert (=> d!70033 m!334483))

(assert (=> d!70033 m!334487))

(declare-fun m!334619 () Bool)

(assert (=> d!70033 m!334619))

(declare-fun m!334621 () Bool)

(assert (=> d!70033 m!334621))

(declare-fun m!334623 () Bool)

(assert (=> d!70033 m!334623))

(declare-fun m!334627 () Bool)

(assert (=> b!329573 m!334627))

(assert (=> b!329355 d!70033))

(declare-fun d!70049 () Bool)

(declare-fun res!181641 () Bool)

(declare-fun e!202424 () Bool)

(assert (=> d!70049 (=> res!181641 e!202424)))

(assert (=> d!70049 (= res!181641 (bvsge #b00000000000000000000000000000000 (size!8318 a!3305)))))

(assert (=> d!70049 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!202424)))

(declare-fun bm!26126 () Bool)

(declare-fun call!26129 () Bool)

(assert (=> bm!26126 (= call!26129 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!329601 () Bool)

(declare-fun e!202425 () Bool)

(assert (=> b!329601 (= e!202425 call!26129)))

(declare-fun b!329602 () Bool)

(declare-fun e!202426 () Bool)

(assert (=> b!329602 (= e!202425 e!202426)))

(declare-fun lt!158150 () (_ BitVec 64))

(assert (=> b!329602 (= lt!158150 (select (arr!7965 a!3305) #b00000000000000000000000000000000))))

(declare-fun lt!158152 () Unit!10176)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16842 (_ BitVec 64) (_ BitVec 32)) Unit!10176)

(assert (=> b!329602 (= lt!158152 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!158150 #b00000000000000000000000000000000))))

(assert (=> b!329602 (arrayContainsKey!0 a!3305 lt!158150 #b00000000000000000000000000000000)))

(declare-fun lt!158151 () Unit!10176)

(assert (=> b!329602 (= lt!158151 lt!158152)))

(declare-fun res!181640 () Bool)

(assert (=> b!329602 (= res!181640 (= (seekEntryOrOpen!0 (select (arr!7965 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3095 #b00000000000000000000000000000000)))))

(assert (=> b!329602 (=> (not res!181640) (not e!202426))))

(declare-fun b!329603 () Bool)

(assert (=> b!329603 (= e!202424 e!202425)))

(declare-fun c!51623 () Bool)

(assert (=> b!329603 (= c!51623 (validKeyInArray!0 (select (arr!7965 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!329604 () Bool)

(assert (=> b!329604 (= e!202426 call!26129)))

(assert (= (and d!70049 (not res!181641)) b!329603))

(assert (= (and b!329603 c!51623) b!329602))

(assert (= (and b!329603 (not c!51623)) b!329601))

(assert (= (and b!329602 res!181640) b!329604))

(assert (= (or b!329604 b!329601) bm!26126))

(declare-fun m!334641 () Bool)

(assert (=> bm!26126 m!334641))

(assert (=> b!329602 m!334567))

(declare-fun m!334643 () Bool)

(assert (=> b!329602 m!334643))

(declare-fun m!334645 () Bool)

(assert (=> b!329602 m!334645))

(assert (=> b!329602 m!334567))

(declare-fun m!334647 () Bool)

(assert (=> b!329602 m!334647))

(assert (=> b!329603 m!334567))

(assert (=> b!329603 m!334567))

(declare-fun m!334649 () Bool)

(assert (=> b!329603 m!334649))

(assert (=> b!329345 d!70049))

(declare-fun d!70059 () Bool)

(assert (=> d!70059 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!33128 d!70059))

(declare-fun d!70067 () Bool)

(assert (=> d!70067 (= (array_inv!5937 a!3305) (bvsge (size!8318 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!33128 d!70067))

(declare-fun b!329623 () Bool)

(declare-fun lt!158162 () SeekEntryResult!3095)

(assert (=> b!329623 (and (bvsge (index!14558 lt!158162) #b00000000000000000000000000000000) (bvslt (index!14558 lt!158162) (size!8318 a!3305)))))

(declare-fun res!181643 () Bool)

(assert (=> b!329623 (= res!181643 (= (select (arr!7965 a!3305) (index!14558 lt!158162)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!202440 () Bool)

(assert (=> b!329623 (=> res!181643 e!202440)))

(declare-fun b!329624 () Bool)

(declare-fun e!202438 () Bool)

(assert (=> b!329624 (= e!202438 (bvsge (x!32848 lt!158162) #b01111111111111111111111111111110))))

(declare-fun b!329625 () Bool)

(declare-fun e!202439 () SeekEntryResult!3095)

(assert (=> b!329625 (= e!202439 (Intermediate!3095 false index!1840 x!1490))))

(declare-fun b!329626 () Bool)

(declare-fun e!202437 () Bool)

(assert (=> b!329626 (= e!202438 e!202437)))

(declare-fun res!181642 () Bool)

(assert (=> b!329626 (= res!181642 (and ((_ is Intermediate!3095) lt!158162) (not (undefined!3907 lt!158162)) (bvslt (x!32848 lt!158162) #b01111111111111111111111111111110) (bvsge (x!32848 lt!158162) #b00000000000000000000000000000000) (bvsge (x!32848 lt!158162) x!1490)))))

(assert (=> b!329626 (=> (not res!181642) (not e!202437))))

(declare-fun b!329627 () Bool)

(assert (=> b!329627 (and (bvsge (index!14558 lt!158162) #b00000000000000000000000000000000) (bvslt (index!14558 lt!158162) (size!8318 a!3305)))))

(assert (=> b!329627 (= e!202440 (= (select (arr!7965 a!3305) (index!14558 lt!158162)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!329628 () Bool)

(assert (=> b!329628 (= e!202439 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun d!70069 () Bool)

(assert (=> d!70069 e!202438))

(declare-fun c!51633 () Bool)

(assert (=> d!70069 (= c!51633 (and ((_ is Intermediate!3095) lt!158162) (undefined!3907 lt!158162)))))

(declare-fun e!202436 () SeekEntryResult!3095)

(assert (=> d!70069 (= lt!158162 e!202436)))

(declare-fun c!51635 () Bool)

(assert (=> d!70069 (= c!51635 (bvsge x!1490 #b01111111111111111111111111111110))))

(declare-fun lt!158163 () (_ BitVec 64))

(assert (=> d!70069 (= lt!158163 (select (arr!7965 a!3305) index!1840))))

(assert (=> d!70069 (validMask!0 mask!3777)))

(assert (=> d!70069 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158162)))

(declare-fun b!329629 () Bool)

(assert (=> b!329629 (= e!202436 (Intermediate!3095 true index!1840 x!1490))))

(declare-fun b!329630 () Bool)

(assert (=> b!329630 (= e!202436 e!202439)))

(declare-fun c!51634 () Bool)

(assert (=> b!329630 (= c!51634 (or (= lt!158163 k0!2497) (= (bvadd lt!158163 lt!158163) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!329631 () Bool)

(assert (=> b!329631 (and (bvsge (index!14558 lt!158162) #b00000000000000000000000000000000) (bvslt (index!14558 lt!158162) (size!8318 a!3305)))))

(declare-fun res!181644 () Bool)

(assert (=> b!329631 (= res!181644 (= (select (arr!7965 a!3305) (index!14558 lt!158162)) k0!2497))))

(assert (=> b!329631 (=> res!181644 e!202440)))

(assert (=> b!329631 (= e!202437 e!202440)))

(assert (= (and d!70069 c!51635) b!329629))

(assert (= (and d!70069 (not c!51635)) b!329630))

(assert (= (and b!329630 c!51634) b!329625))

(assert (= (and b!329630 (not c!51634)) b!329628))

(assert (= (and d!70069 c!51633) b!329624))

(assert (= (and d!70069 (not c!51633)) b!329626))

(assert (= (and b!329626 res!181642) b!329631))

(assert (= (and b!329631 (not res!181644)) b!329623))

(assert (= (and b!329623 (not res!181643)) b!329627))

(assert (=> d!70069 m!334495))

(assert (=> d!70069 m!334487))

(declare-fun m!334661 () Bool)

(assert (=> b!329627 m!334661))

(assert (=> b!329623 m!334661))

(assert (=> b!329631 m!334661))

(assert (=> b!329628 m!334499))

(assert (=> b!329628 m!334499))

(declare-fun m!334663 () Bool)

(assert (=> b!329628 m!334663))

(assert (=> b!329349 d!70069))

(declare-fun d!70071 () Bool)

(assert (=> d!70071 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!329354 d!70071))

(check-sat (not d!70013) (not b!329628) (not b!329603) (not d!70033) (not d!70027) (not b!329502) (not d!70069) (not b!329569) (not d!70029) (not b!329457) (not bm!26126) (not b!329602) (not b!329494))
(check-sat)
