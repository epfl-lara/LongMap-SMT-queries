; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29564 () Bool)

(assert start!29564)

(declare-fun res!157395 () Bool)

(declare-fun e!188526 () Bool)

(assert (=> start!29564 (=> (not res!157395) (not e!188526))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29564 (= res!157395 (validMask!0 mask!3809))))

(assert (=> start!29564 e!188526))

(assert (=> start!29564 true))

(declare-datatypes ((array!15094 0))(
  ( (array!15095 (arr!7149 (Array (_ BitVec 32) (_ BitVec 64))) (size!7502 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15094)

(declare-fun array_inv!5121 (array!15094) Bool)

(assert (=> start!29564 (array_inv!5121 a!3312)))

(declare-fun b!298430 () Bool)

(declare-fun res!157397 () Bool)

(assert (=> b!298430 (=> (not res!157397) (not e!188526))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298430 (= res!157397 (validKeyInArray!0 k0!2524))))

(declare-fun b!298431 () Bool)

(declare-fun res!157396 () Bool)

(assert (=> b!298431 (=> (not res!157396) (not e!188526))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!298431 (= res!157396 (and (= (size!7502 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7502 a!3312))))))

(declare-fun e!188527 () Bool)

(declare-datatypes ((SeekEntryResult!2297 0))(
  ( (MissingZero!2297 (index!11361 (_ BitVec 32))) (Found!2297 (index!11362 (_ BitVec 32))) (Intermediate!2297 (undefined!3109 Bool) (index!11363 (_ BitVec 32)) (x!29608 (_ BitVec 32))) (Undefined!2297) (MissingVacant!2297 (index!11364 (_ BitVec 32))) )
))
(declare-fun lt!148277 () SeekEntryResult!2297)

(declare-fun b!298432 () Bool)

(declare-fun lt!148278 () SeekEntryResult!2297)

(declare-fun lt!148275 () Bool)

(get-info :version)

(assert (=> b!298432 (= e!188527 (and (not lt!148275) (= lt!148278 (MissingVacant!2297 i!1256)) (let ((bdg!6425 (not ((_ is Intermediate!2297) lt!148277)))) (and (or bdg!6425 (not (undefined!3109 lt!148277))) (not bdg!6425) (= (select (arr!7149 a!3312) (index!11363 lt!148277)) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (index!11363 lt!148277) i!1256))))))))

(declare-fun lt!148274 () SeekEntryResult!2297)

(declare-fun lt!148276 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15094 (_ BitVec 32)) SeekEntryResult!2297)

(assert (=> b!298432 (= lt!148274 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148276 k0!2524 (array!15095 (store (arr!7149 a!3312) i!1256 k0!2524) (size!7502 a!3312)) mask!3809))))

(assert (=> b!298432 (= lt!148277 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148276 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298432 (= lt!148276 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!298433 () Bool)

(assert (=> b!298433 (= e!188526 e!188527)))

(declare-fun res!157399 () Bool)

(assert (=> b!298433 (=> (not res!157399) (not e!188527))))

(assert (=> b!298433 (= res!157399 (or lt!148275 (= lt!148278 (MissingVacant!2297 i!1256))))))

(assert (=> b!298433 (= lt!148275 (= lt!148278 (MissingZero!2297 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15094 (_ BitVec 32)) SeekEntryResult!2297)

(assert (=> b!298433 (= lt!148278 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!298434 () Bool)

(declare-fun res!157398 () Bool)

(assert (=> b!298434 (=> (not res!157398) (not e!188526))))

(declare-fun arrayContainsKey!0 (array!15094 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298434 (= res!157398 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!298435 () Bool)

(declare-fun res!157394 () Bool)

(assert (=> b!298435 (=> (not res!157394) (not e!188527))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15094 (_ BitVec 32)) Bool)

(assert (=> b!298435 (= res!157394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29564 res!157395) b!298431))

(assert (= (and b!298431 res!157396) b!298430))

(assert (= (and b!298430 res!157397) b!298434))

(assert (= (and b!298434 res!157398) b!298433))

(assert (= (and b!298433 res!157399) b!298435))

(assert (= (and b!298435 res!157394) b!298432))

(declare-fun m!310413 () Bool)

(assert (=> start!29564 m!310413))

(declare-fun m!310415 () Bool)

(assert (=> start!29564 m!310415))

(declare-fun m!310417 () Bool)

(assert (=> b!298434 m!310417))

(declare-fun m!310419 () Bool)

(assert (=> b!298430 m!310419))

(declare-fun m!310421 () Bool)

(assert (=> b!298435 m!310421))

(declare-fun m!310423 () Bool)

(assert (=> b!298432 m!310423))

(declare-fun m!310425 () Bool)

(assert (=> b!298432 m!310425))

(declare-fun m!310427 () Bool)

(assert (=> b!298432 m!310427))

(declare-fun m!310429 () Bool)

(assert (=> b!298432 m!310429))

(declare-fun m!310431 () Bool)

(assert (=> b!298432 m!310431))

(declare-fun m!310433 () Bool)

(assert (=> b!298433 m!310433))

(check-sat (not b!298435) (not b!298432) (not start!29564) (not b!298434) (not b!298430) (not b!298433))
(check-sat)
(get-model)

(declare-fun bm!25763 () Bool)

(declare-fun call!25766 () Bool)

(assert (=> bm!25763 (= call!25766 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!298480 () Bool)

(declare-fun e!188553 () Bool)

(declare-fun e!188554 () Bool)

(assert (=> b!298480 (= e!188553 e!188554)))

(declare-fun lt!148317 () (_ BitVec 64))

(assert (=> b!298480 (= lt!148317 (select (arr!7149 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9269 0))(
  ( (Unit!9270) )
))
(declare-fun lt!148316 () Unit!9269)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15094 (_ BitVec 64) (_ BitVec 32)) Unit!9269)

(assert (=> b!298480 (= lt!148316 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148317 #b00000000000000000000000000000000))))

(assert (=> b!298480 (arrayContainsKey!0 a!3312 lt!148317 #b00000000000000000000000000000000)))

(declare-fun lt!148315 () Unit!9269)

(assert (=> b!298480 (= lt!148315 lt!148316)))

(declare-fun res!157440 () Bool)

(assert (=> b!298480 (= res!157440 (= (seekEntryOrOpen!0 (select (arr!7149 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2297 #b00000000000000000000000000000000)))))

(assert (=> b!298480 (=> (not res!157440) (not e!188554))))

(declare-fun d!67213 () Bool)

(declare-fun res!157441 () Bool)

(declare-fun e!188552 () Bool)

(assert (=> d!67213 (=> res!157441 e!188552)))

(assert (=> d!67213 (= res!157441 (bvsge #b00000000000000000000000000000000 (size!7502 a!3312)))))

(assert (=> d!67213 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!188552)))

(declare-fun b!298481 () Bool)

(assert (=> b!298481 (= e!188554 call!25766)))

(declare-fun b!298482 () Bool)

(assert (=> b!298482 (= e!188553 call!25766)))

(declare-fun b!298483 () Bool)

(assert (=> b!298483 (= e!188552 e!188553)))

(declare-fun c!48107 () Bool)

(assert (=> b!298483 (= c!48107 (validKeyInArray!0 (select (arr!7149 a!3312) #b00000000000000000000000000000000)))))

(assert (= (and d!67213 (not res!157441)) b!298483))

(assert (= (and b!298483 c!48107) b!298480))

(assert (= (and b!298483 (not c!48107)) b!298482))

(assert (= (and b!298480 res!157440) b!298481))

(assert (= (or b!298481 b!298482) bm!25763))

(declare-fun m!310479 () Bool)

(assert (=> bm!25763 m!310479))

(declare-fun m!310481 () Bool)

(assert (=> b!298480 m!310481))

(declare-fun m!310483 () Bool)

(assert (=> b!298480 m!310483))

(declare-fun m!310485 () Bool)

(assert (=> b!298480 m!310485))

(assert (=> b!298480 m!310481))

(declare-fun m!310487 () Bool)

(assert (=> b!298480 m!310487))

(assert (=> b!298483 m!310481))

(assert (=> b!298483 m!310481))

(declare-fun m!310489 () Bool)

(assert (=> b!298483 m!310489))

(assert (=> b!298435 d!67213))

(declare-fun d!67217 () Bool)

(declare-fun res!157446 () Bool)

(declare-fun e!188559 () Bool)

(assert (=> d!67217 (=> res!157446 e!188559)))

(assert (=> d!67217 (= res!157446 (= (select (arr!7149 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67217 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!188559)))

(declare-fun b!298488 () Bool)

(declare-fun e!188560 () Bool)

(assert (=> b!298488 (= e!188559 e!188560)))

(declare-fun res!157447 () Bool)

(assert (=> b!298488 (=> (not res!157447) (not e!188560))))

(assert (=> b!298488 (= res!157447 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7502 a!3312)))))

(declare-fun b!298489 () Bool)

(assert (=> b!298489 (= e!188560 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67217 (not res!157446)) b!298488))

(assert (= (and b!298488 res!157447) b!298489))

(assert (=> d!67217 m!310481))

(declare-fun m!310491 () Bool)

(assert (=> b!298489 m!310491))

(assert (=> b!298434 d!67217))

(declare-fun d!67219 () Bool)

(assert (=> d!67219 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!298430 d!67219))

(declare-fun lt!148337 () SeekEntryResult!2297)

(declare-fun b!298538 () Bool)

(assert (=> b!298538 (and (bvsge (index!11363 lt!148337) #b00000000000000000000000000000000) (bvslt (index!11363 lt!148337) (size!7502 (array!15095 (store (arr!7149 a!3312) i!1256 k0!2524) (size!7502 a!3312)))))))

(declare-fun res!157454 () Bool)

(assert (=> b!298538 (= res!157454 (= (select (arr!7149 (array!15095 (store (arr!7149 a!3312) i!1256 k0!2524) (size!7502 a!3312))) (index!11363 lt!148337)) k0!2524))))

(declare-fun e!188587 () Bool)

(assert (=> b!298538 (=> res!157454 e!188587)))

(declare-fun e!188589 () Bool)

(assert (=> b!298538 (= e!188589 e!188587)))

(declare-fun b!298539 () Bool)

(assert (=> b!298539 (and (bvsge (index!11363 lt!148337) #b00000000000000000000000000000000) (bvslt (index!11363 lt!148337) (size!7502 (array!15095 (store (arr!7149 a!3312) i!1256 k0!2524) (size!7502 a!3312)))))))

(assert (=> b!298539 (= e!188587 (= (select (arr!7149 (array!15095 (store (arr!7149 a!3312) i!1256 k0!2524) (size!7502 a!3312))) (index!11363 lt!148337)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298540 () Bool)

(declare-fun e!188586 () Bool)

(assert (=> b!298540 (= e!188586 (bvsge (x!29608 lt!148337) #b01111111111111111111111111111110))))

(declare-fun b!298541 () Bool)

(assert (=> b!298541 (and (bvsge (index!11363 lt!148337) #b00000000000000000000000000000000) (bvslt (index!11363 lt!148337) (size!7502 (array!15095 (store (arr!7149 a!3312) i!1256 k0!2524) (size!7502 a!3312)))))))

(declare-fun res!157456 () Bool)

(assert (=> b!298541 (= res!157456 (= (select (arr!7149 (array!15095 (store (arr!7149 a!3312) i!1256 k0!2524) (size!7502 a!3312))) (index!11363 lt!148337)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298541 (=> res!157456 e!188587)))

(declare-fun d!67221 () Bool)

(assert (=> d!67221 e!188586))

(declare-fun c!48130 () Bool)

(assert (=> d!67221 (= c!48130 (and ((_ is Intermediate!2297) lt!148337) (undefined!3109 lt!148337)))))

(declare-fun e!188588 () SeekEntryResult!2297)

(assert (=> d!67221 (= lt!148337 e!188588)))

(declare-fun c!48131 () Bool)

(assert (=> d!67221 (= c!48131 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148338 () (_ BitVec 64))

(assert (=> d!67221 (= lt!148338 (select (arr!7149 (array!15095 (store (arr!7149 a!3312) i!1256 k0!2524) (size!7502 a!3312))) lt!148276))))

(assert (=> d!67221 (validMask!0 mask!3809)))

(assert (=> d!67221 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148276 k0!2524 (array!15095 (store (arr!7149 a!3312) i!1256 k0!2524) (size!7502 a!3312)) mask!3809) lt!148337)))

(declare-fun e!188590 () SeekEntryResult!2297)

(declare-fun b!298542 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298542 (= e!188590 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148276 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!15095 (store (arr!7149 a!3312) i!1256 k0!2524) (size!7502 a!3312)) mask!3809))))

(declare-fun b!298543 () Bool)

(assert (=> b!298543 (= e!188588 (Intermediate!2297 true lt!148276 #b00000000000000000000000000000000))))

(declare-fun b!298544 () Bool)

(assert (=> b!298544 (= e!188586 e!188589)))

(declare-fun res!157455 () Bool)

(assert (=> b!298544 (= res!157455 (and ((_ is Intermediate!2297) lt!148337) (not (undefined!3109 lt!148337)) (bvslt (x!29608 lt!148337) #b01111111111111111111111111111110) (bvsge (x!29608 lt!148337) #b00000000000000000000000000000000) (bvsge (x!29608 lt!148337) #b00000000000000000000000000000000)))))

(assert (=> b!298544 (=> (not res!157455) (not e!188589))))

(declare-fun b!298545 () Bool)

(assert (=> b!298545 (= e!188590 (Intermediate!2297 false lt!148276 #b00000000000000000000000000000000))))

(declare-fun b!298546 () Bool)

(assert (=> b!298546 (= e!188588 e!188590)))

(declare-fun c!48129 () Bool)

(assert (=> b!298546 (= c!48129 (or (= lt!148338 k0!2524) (= (bvadd lt!148338 lt!148338) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!67221 c!48131) b!298543))

(assert (= (and d!67221 (not c!48131)) b!298546))

(assert (= (and b!298546 c!48129) b!298545))

(assert (= (and b!298546 (not c!48129)) b!298542))

(assert (= (and d!67221 c!48130) b!298540))

(assert (= (and d!67221 (not c!48130)) b!298544))

(assert (= (and b!298544 res!157455) b!298538))

(assert (= (and b!298538 (not res!157454)) b!298541))

(assert (= (and b!298541 (not res!157456)) b!298539))

(declare-fun m!310505 () Bool)

(assert (=> b!298538 m!310505))

(assert (=> b!298539 m!310505))

(declare-fun m!310507 () Bool)

(assert (=> d!67221 m!310507))

(assert (=> d!67221 m!310413))

(assert (=> b!298541 m!310505))

(declare-fun m!310509 () Bool)

(assert (=> b!298542 m!310509))

(assert (=> b!298542 m!310509))

(declare-fun m!310511 () Bool)

(assert (=> b!298542 m!310511))

(assert (=> b!298432 d!67221))

(declare-fun b!298549 () Bool)

(declare-fun lt!148339 () SeekEntryResult!2297)

(assert (=> b!298549 (and (bvsge (index!11363 lt!148339) #b00000000000000000000000000000000) (bvslt (index!11363 lt!148339) (size!7502 a!3312)))))

(declare-fun res!157459 () Bool)

(assert (=> b!298549 (= res!157459 (= (select (arr!7149 a!3312) (index!11363 lt!148339)) k0!2524))))

(declare-fun e!188594 () Bool)

(assert (=> b!298549 (=> res!157459 e!188594)))

(declare-fun e!188596 () Bool)

(assert (=> b!298549 (= e!188596 e!188594)))

(declare-fun b!298550 () Bool)

(assert (=> b!298550 (and (bvsge (index!11363 lt!148339) #b00000000000000000000000000000000) (bvslt (index!11363 lt!148339) (size!7502 a!3312)))))

(assert (=> b!298550 (= e!188594 (= (select (arr!7149 a!3312) (index!11363 lt!148339)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298551 () Bool)

(declare-fun e!188593 () Bool)

(assert (=> b!298551 (= e!188593 (bvsge (x!29608 lt!148339) #b01111111111111111111111111111110))))

(declare-fun b!298552 () Bool)

(assert (=> b!298552 (and (bvsge (index!11363 lt!148339) #b00000000000000000000000000000000) (bvslt (index!11363 lt!148339) (size!7502 a!3312)))))

(declare-fun res!157461 () Bool)

(assert (=> b!298552 (= res!157461 (= (select (arr!7149 a!3312) (index!11363 lt!148339)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298552 (=> res!157461 e!188594)))

(declare-fun d!67229 () Bool)

(assert (=> d!67229 e!188593))

(declare-fun c!48133 () Bool)

(assert (=> d!67229 (= c!48133 (and ((_ is Intermediate!2297) lt!148339) (undefined!3109 lt!148339)))))

(declare-fun e!188595 () SeekEntryResult!2297)

(assert (=> d!67229 (= lt!148339 e!188595)))

(declare-fun c!48134 () Bool)

(assert (=> d!67229 (= c!48134 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148340 () (_ BitVec 64))

(assert (=> d!67229 (= lt!148340 (select (arr!7149 a!3312) lt!148276))))

(assert (=> d!67229 (validMask!0 mask!3809)))

(assert (=> d!67229 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148276 k0!2524 a!3312 mask!3809) lt!148339)))

(declare-fun e!188597 () SeekEntryResult!2297)

(declare-fun b!298553 () Bool)

(assert (=> b!298553 (= e!188597 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148276 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!298554 () Bool)

(assert (=> b!298554 (= e!188595 (Intermediate!2297 true lt!148276 #b00000000000000000000000000000000))))

(declare-fun b!298555 () Bool)

(assert (=> b!298555 (= e!188593 e!188596)))

(declare-fun res!157460 () Bool)

(assert (=> b!298555 (= res!157460 (and ((_ is Intermediate!2297) lt!148339) (not (undefined!3109 lt!148339)) (bvslt (x!29608 lt!148339) #b01111111111111111111111111111110) (bvsge (x!29608 lt!148339) #b00000000000000000000000000000000) (bvsge (x!29608 lt!148339) #b00000000000000000000000000000000)))))

(assert (=> b!298555 (=> (not res!157460) (not e!188596))))

(declare-fun b!298556 () Bool)

(assert (=> b!298556 (= e!188597 (Intermediate!2297 false lt!148276 #b00000000000000000000000000000000))))

(declare-fun b!298557 () Bool)

(assert (=> b!298557 (= e!188595 e!188597)))

(declare-fun c!48132 () Bool)

(assert (=> b!298557 (= c!48132 (or (= lt!148340 k0!2524) (= (bvadd lt!148340 lt!148340) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!67229 c!48134) b!298554))

(assert (= (and d!67229 (not c!48134)) b!298557))

(assert (= (and b!298557 c!48132) b!298556))

(assert (= (and b!298557 (not c!48132)) b!298553))

(assert (= (and d!67229 c!48133) b!298551))

(assert (= (and d!67229 (not c!48133)) b!298555))

(assert (= (and b!298555 res!157460) b!298549))

(assert (= (and b!298549 (not res!157459)) b!298552))

(assert (= (and b!298552 (not res!157461)) b!298550))

(declare-fun m!310513 () Bool)

(assert (=> b!298549 m!310513))

(assert (=> b!298550 m!310513))

(declare-fun m!310515 () Bool)

(assert (=> d!67229 m!310515))

(assert (=> d!67229 m!310413))

(assert (=> b!298552 m!310513))

(assert (=> b!298553 m!310509))

(assert (=> b!298553 m!310509))

(declare-fun m!310517 () Bool)

(assert (=> b!298553 m!310517))

(assert (=> b!298432 d!67229))

(declare-fun d!67231 () Bool)

(declare-fun lt!148358 () (_ BitVec 32))

(declare-fun lt!148357 () (_ BitVec 32))

(assert (=> d!67231 (= lt!148358 (bvmul (bvxor lt!148357 (bvlshr lt!148357 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67231 (= lt!148357 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67231 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157464 (let ((h!5278 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29612 (bvmul (bvxor h!5278 (bvlshr h!5278 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29612 (bvlshr x!29612 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157464 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157464 #b00000000000000000000000000000000))))))

(assert (=> d!67231 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!148358 (bvlshr lt!148358 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!298432 d!67231))

(declare-fun d!67239 () Bool)

(assert (=> d!67239 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29564 d!67239))

(declare-fun d!67247 () Bool)

(assert (=> d!67247 (= (array_inv!5121 a!3312) (bvsge (size!7502 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29564 d!67247))

(declare-fun b!298652 () Bool)

(declare-fun e!188657 () SeekEntryResult!2297)

(assert (=> b!298652 (= e!188657 Undefined!2297)))

(declare-fun b!298653 () Bool)

(declare-fun e!188656 () SeekEntryResult!2297)

(declare-fun lt!148383 () SeekEntryResult!2297)

(assert (=> b!298653 (= e!188656 (MissingZero!2297 (index!11363 lt!148383)))))

(declare-fun b!298654 () Bool)

(declare-fun c!48167 () Bool)

(declare-fun lt!148385 () (_ BitVec 64))

(assert (=> b!298654 (= c!48167 (= lt!148385 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188658 () SeekEntryResult!2297)

(assert (=> b!298654 (= e!188658 e!188656)))

(declare-fun b!298655 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15094 (_ BitVec 32)) SeekEntryResult!2297)

(assert (=> b!298655 (= e!188656 (seekKeyOrZeroReturnVacant!0 (x!29608 lt!148383) (index!11363 lt!148383) (index!11363 lt!148383) k0!2524 a!3312 mask!3809))))

(declare-fun b!298656 () Bool)

(assert (=> b!298656 (= e!188658 (Found!2297 (index!11363 lt!148383)))))

(declare-fun b!298657 () Bool)

(assert (=> b!298657 (= e!188657 e!188658)))

(assert (=> b!298657 (= lt!148385 (select (arr!7149 a!3312) (index!11363 lt!148383)))))

(declare-fun c!48165 () Bool)

(assert (=> b!298657 (= c!48165 (= lt!148385 k0!2524))))

(declare-fun d!67251 () Bool)

(declare-fun lt!148384 () SeekEntryResult!2297)

(assert (=> d!67251 (and (or ((_ is Undefined!2297) lt!148384) (not ((_ is Found!2297) lt!148384)) (and (bvsge (index!11362 lt!148384) #b00000000000000000000000000000000) (bvslt (index!11362 lt!148384) (size!7502 a!3312)))) (or ((_ is Undefined!2297) lt!148384) ((_ is Found!2297) lt!148384) (not ((_ is MissingZero!2297) lt!148384)) (and (bvsge (index!11361 lt!148384) #b00000000000000000000000000000000) (bvslt (index!11361 lt!148384) (size!7502 a!3312)))) (or ((_ is Undefined!2297) lt!148384) ((_ is Found!2297) lt!148384) ((_ is MissingZero!2297) lt!148384) (not ((_ is MissingVacant!2297) lt!148384)) (and (bvsge (index!11364 lt!148384) #b00000000000000000000000000000000) (bvslt (index!11364 lt!148384) (size!7502 a!3312)))) (or ((_ is Undefined!2297) lt!148384) (ite ((_ is Found!2297) lt!148384) (= (select (arr!7149 a!3312) (index!11362 lt!148384)) k0!2524) (ite ((_ is MissingZero!2297) lt!148384) (= (select (arr!7149 a!3312) (index!11361 lt!148384)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2297) lt!148384) (= (select (arr!7149 a!3312) (index!11364 lt!148384)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67251 (= lt!148384 e!188657)))

(declare-fun c!48166 () Bool)

(assert (=> d!67251 (= c!48166 (and ((_ is Intermediate!2297) lt!148383) (undefined!3109 lt!148383)))))

(assert (=> d!67251 (= lt!148383 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67251 (validMask!0 mask!3809)))

(assert (=> d!67251 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!148384)))

(assert (= (and d!67251 c!48166) b!298652))

(assert (= (and d!67251 (not c!48166)) b!298657))

(assert (= (and b!298657 c!48165) b!298656))

(assert (= (and b!298657 (not c!48165)) b!298654))

(assert (= (and b!298654 c!48167) b!298653))

(assert (= (and b!298654 (not c!48167)) b!298655))

(declare-fun m!310563 () Bool)

(assert (=> b!298655 m!310563))

(declare-fun m!310565 () Bool)

(assert (=> b!298657 m!310565))

(assert (=> d!67251 m!310431))

(declare-fun m!310567 () Bool)

(assert (=> d!67251 m!310567))

(declare-fun m!310569 () Bool)

(assert (=> d!67251 m!310569))

(declare-fun m!310571 () Bool)

(assert (=> d!67251 m!310571))

(declare-fun m!310573 () Bool)

(assert (=> d!67251 m!310573))

(assert (=> d!67251 m!310413))

(assert (=> d!67251 m!310431))

(assert (=> b!298433 d!67251))

(check-sat (not b!298489) (not b!298553) (not b!298542) (not d!67229) (not d!67221) (not b!298480) (not d!67251) (not b!298483) (not bm!25763) (not b!298655))
(check-sat)
(get-model)

(declare-fun b!298706 () Bool)

(declare-fun lt!148412 () SeekEntryResult!2297)

(assert (=> b!298706 (and (bvsge (index!11363 lt!148412) #b00000000000000000000000000000000) (bvslt (index!11363 lt!148412) (size!7502 a!3312)))))

(declare-fun res!157517 () Bool)

(assert (=> b!298706 (= res!157517 (= (select (arr!7149 a!3312) (index!11363 lt!148412)) k0!2524))))

(declare-fun e!188689 () Bool)

(assert (=> b!298706 (=> res!157517 e!188689)))

(declare-fun e!188691 () Bool)

(assert (=> b!298706 (= e!188691 e!188689)))

(declare-fun b!298707 () Bool)

(assert (=> b!298707 (and (bvsge (index!11363 lt!148412) #b00000000000000000000000000000000) (bvslt (index!11363 lt!148412) (size!7502 a!3312)))))

(assert (=> b!298707 (= e!188689 (= (select (arr!7149 a!3312) (index!11363 lt!148412)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298708 () Bool)

(declare-fun e!188688 () Bool)

(assert (=> b!298708 (= e!188688 (bvsge (x!29608 lt!148412) #b01111111111111111111111111111110))))

(declare-fun b!298709 () Bool)

(assert (=> b!298709 (and (bvsge (index!11363 lt!148412) #b00000000000000000000000000000000) (bvslt (index!11363 lt!148412) (size!7502 a!3312)))))

(declare-fun res!157519 () Bool)

(assert (=> b!298709 (= res!157519 (= (select (arr!7149 a!3312) (index!11363 lt!148412)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298709 (=> res!157519 e!188689)))

(declare-fun d!67273 () Bool)

(assert (=> d!67273 e!188688))

(declare-fun c!48184 () Bool)

(assert (=> d!67273 (= c!48184 (and ((_ is Intermediate!2297) lt!148412) (undefined!3109 lt!148412)))))

(declare-fun e!188690 () SeekEntryResult!2297)

(assert (=> d!67273 (= lt!148412 e!188690)))

(declare-fun c!48185 () Bool)

(assert (=> d!67273 (= c!48185 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!148413 () (_ BitVec 64))

(assert (=> d!67273 (= lt!148413 (select (arr!7149 a!3312) (nextIndex!0 lt!148276 #b00000000000000000000000000000000 mask!3809)))))

(assert (=> d!67273 (validMask!0 mask!3809)))

(assert (=> d!67273 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148276 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809) lt!148412)))

(declare-fun e!188692 () SeekEntryResult!2297)

(declare-fun b!298710 () Bool)

(assert (=> b!298710 (= e!188692 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 lt!148276 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!298711 () Bool)

(assert (=> b!298711 (= e!188690 (Intermediate!2297 true (nextIndex!0 lt!148276 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!298712 () Bool)

(assert (=> b!298712 (= e!188688 e!188691)))

(declare-fun res!157518 () Bool)

(assert (=> b!298712 (= res!157518 (and ((_ is Intermediate!2297) lt!148412) (not (undefined!3109 lt!148412)) (bvslt (x!29608 lt!148412) #b01111111111111111111111111111110) (bvsge (x!29608 lt!148412) #b00000000000000000000000000000000) (bvsge (x!29608 lt!148412) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!298712 (=> (not res!157518) (not e!188691))))

(declare-fun b!298713 () Bool)

(assert (=> b!298713 (= e!188692 (Intermediate!2297 false (nextIndex!0 lt!148276 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!298714 () Bool)

(assert (=> b!298714 (= e!188690 e!188692)))

(declare-fun c!48183 () Bool)

(assert (=> b!298714 (= c!48183 (or (= lt!148413 k0!2524) (= (bvadd lt!148413 lt!148413) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!67273 c!48185) b!298711))

(assert (= (and d!67273 (not c!48185)) b!298714))

(assert (= (and b!298714 c!48183) b!298713))

(assert (= (and b!298714 (not c!48183)) b!298710))

(assert (= (and d!67273 c!48184) b!298708))

(assert (= (and d!67273 (not c!48184)) b!298712))

(assert (= (and b!298712 res!157518) b!298706))

(assert (= (and b!298706 (not res!157517)) b!298709))

(assert (= (and b!298709 (not res!157519)) b!298707))

(declare-fun m!310615 () Bool)

(assert (=> b!298706 m!310615))

(assert (=> b!298707 m!310615))

(assert (=> d!67273 m!310509))

(declare-fun m!310617 () Bool)

(assert (=> d!67273 m!310617))

(assert (=> d!67273 m!310413))

(assert (=> b!298709 m!310615))

(assert (=> b!298710 m!310509))

(declare-fun m!310619 () Bool)

(assert (=> b!298710 m!310619))

(assert (=> b!298710 m!310619))

(declare-fun m!310621 () Bool)

(assert (=> b!298710 m!310621))

(assert (=> b!298553 d!67273))

(declare-fun d!67277 () Bool)

(declare-fun lt!148416 () (_ BitVec 32))

(assert (=> d!67277 (and (bvsge lt!148416 #b00000000000000000000000000000000) (bvslt lt!148416 (bvadd mask!3809 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!67277 (= lt!148416 (choose!52 lt!148276 #b00000000000000000000000000000000 mask!3809))))

(assert (=> d!67277 (validMask!0 mask!3809)))

(assert (=> d!67277 (= (nextIndex!0 lt!148276 #b00000000000000000000000000000000 mask!3809) lt!148416)))

(declare-fun bs!10517 () Bool)

(assert (= bs!10517 d!67277))

(declare-fun m!310623 () Bool)

(assert (=> bs!10517 m!310623))

(assert (=> bs!10517 m!310413))

(assert (=> b!298553 d!67277))

(declare-fun d!67279 () Bool)

(declare-fun res!157520 () Bool)

(declare-fun e!188693 () Bool)

(assert (=> d!67279 (=> res!157520 e!188693)))

(assert (=> d!67279 (= res!157520 (= (select (arr!7149 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!2524))))

(assert (=> d!67279 (= (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!188693)))

(declare-fun b!298715 () Bool)

(declare-fun e!188694 () Bool)

(assert (=> b!298715 (= e!188693 e!188694)))

(declare-fun res!157521 () Bool)

(assert (=> b!298715 (=> (not res!157521) (not e!188694))))

(assert (=> b!298715 (= res!157521 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!7502 a!3312)))))

(declare-fun b!298716 () Bool)

(assert (=> b!298716 (= e!188694 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!67279 (not res!157520)) b!298715))

(assert (= (and b!298715 res!157521) b!298716))

(declare-fun m!310625 () Bool)

(assert (=> d!67279 m!310625))

(declare-fun m!310627 () Bool)

(assert (=> b!298716 m!310627))

(assert (=> b!298489 d!67279))

(declare-fun b!298717 () Bool)

(declare-fun lt!148417 () SeekEntryResult!2297)

(assert (=> b!298717 (and (bvsge (index!11363 lt!148417) #b00000000000000000000000000000000) (bvslt (index!11363 lt!148417) (size!7502 (array!15095 (store (arr!7149 a!3312) i!1256 k0!2524) (size!7502 a!3312)))))))

(declare-fun res!157522 () Bool)

(assert (=> b!298717 (= res!157522 (= (select (arr!7149 (array!15095 (store (arr!7149 a!3312) i!1256 k0!2524) (size!7502 a!3312))) (index!11363 lt!148417)) k0!2524))))

(declare-fun e!188696 () Bool)

(assert (=> b!298717 (=> res!157522 e!188696)))

(declare-fun e!188698 () Bool)

(assert (=> b!298717 (= e!188698 e!188696)))

(declare-fun b!298718 () Bool)

(assert (=> b!298718 (and (bvsge (index!11363 lt!148417) #b00000000000000000000000000000000) (bvslt (index!11363 lt!148417) (size!7502 (array!15095 (store (arr!7149 a!3312) i!1256 k0!2524) (size!7502 a!3312)))))))

(assert (=> b!298718 (= e!188696 (= (select (arr!7149 (array!15095 (store (arr!7149 a!3312) i!1256 k0!2524) (size!7502 a!3312))) (index!11363 lt!148417)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298719 () Bool)

(declare-fun e!188695 () Bool)

(assert (=> b!298719 (= e!188695 (bvsge (x!29608 lt!148417) #b01111111111111111111111111111110))))

(declare-fun b!298720 () Bool)

(assert (=> b!298720 (and (bvsge (index!11363 lt!148417) #b00000000000000000000000000000000) (bvslt (index!11363 lt!148417) (size!7502 (array!15095 (store (arr!7149 a!3312) i!1256 k0!2524) (size!7502 a!3312)))))))

(declare-fun res!157524 () Bool)

(assert (=> b!298720 (= res!157524 (= (select (arr!7149 (array!15095 (store (arr!7149 a!3312) i!1256 k0!2524) (size!7502 a!3312))) (index!11363 lt!148417)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298720 (=> res!157524 e!188696)))

(declare-fun d!67281 () Bool)

(assert (=> d!67281 e!188695))

(declare-fun c!48187 () Bool)

(assert (=> d!67281 (= c!48187 (and ((_ is Intermediate!2297) lt!148417) (undefined!3109 lt!148417)))))

(declare-fun e!188697 () SeekEntryResult!2297)

(assert (=> d!67281 (= lt!148417 e!188697)))

(declare-fun c!48188 () Bool)

(assert (=> d!67281 (= c!48188 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!148418 () (_ BitVec 64))

(assert (=> d!67281 (= lt!148418 (select (arr!7149 (array!15095 (store (arr!7149 a!3312) i!1256 k0!2524) (size!7502 a!3312))) (nextIndex!0 lt!148276 #b00000000000000000000000000000000 mask!3809)))))

(assert (=> d!67281 (validMask!0 mask!3809)))

(assert (=> d!67281 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148276 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!15095 (store (arr!7149 a!3312) i!1256 k0!2524) (size!7502 a!3312)) mask!3809) lt!148417)))

(declare-fun e!188699 () SeekEntryResult!2297)

(declare-fun b!298721 () Bool)

(assert (=> b!298721 (= e!188699 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 lt!148276 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!15095 (store (arr!7149 a!3312) i!1256 k0!2524) (size!7502 a!3312)) mask!3809))))

(declare-fun b!298722 () Bool)

(assert (=> b!298722 (= e!188697 (Intermediate!2297 true (nextIndex!0 lt!148276 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!298723 () Bool)

(assert (=> b!298723 (= e!188695 e!188698)))

(declare-fun res!157523 () Bool)

(assert (=> b!298723 (= res!157523 (and ((_ is Intermediate!2297) lt!148417) (not (undefined!3109 lt!148417)) (bvslt (x!29608 lt!148417) #b01111111111111111111111111111110) (bvsge (x!29608 lt!148417) #b00000000000000000000000000000000) (bvsge (x!29608 lt!148417) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!298723 (=> (not res!157523) (not e!188698))))

(declare-fun b!298724 () Bool)

(assert (=> b!298724 (= e!188699 (Intermediate!2297 false (nextIndex!0 lt!148276 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!298725 () Bool)

(assert (=> b!298725 (= e!188697 e!188699)))

(declare-fun c!48186 () Bool)

(assert (=> b!298725 (= c!48186 (or (= lt!148418 k0!2524) (= (bvadd lt!148418 lt!148418) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!67281 c!48188) b!298722))

(assert (= (and d!67281 (not c!48188)) b!298725))

(assert (= (and b!298725 c!48186) b!298724))

(assert (= (and b!298725 (not c!48186)) b!298721))

(assert (= (and d!67281 c!48187) b!298719))

(assert (= (and d!67281 (not c!48187)) b!298723))

(assert (= (and b!298723 res!157523) b!298717))

(assert (= (and b!298717 (not res!157522)) b!298720))

(assert (= (and b!298720 (not res!157524)) b!298718))

(declare-fun m!310629 () Bool)

(assert (=> b!298717 m!310629))

(assert (=> b!298718 m!310629))

(assert (=> d!67281 m!310509))

(declare-fun m!310631 () Bool)

(assert (=> d!67281 m!310631))

(assert (=> d!67281 m!310413))

(assert (=> b!298720 m!310629))

(assert (=> b!298721 m!310509))

(assert (=> b!298721 m!310619))

(assert (=> b!298721 m!310619))

(declare-fun m!310633 () Bool)

(assert (=> b!298721 m!310633))

(assert (=> b!298542 d!67281))

(assert (=> b!298542 d!67277))

(assert (=> d!67229 d!67239))

(assert (=> d!67221 d!67239))

(declare-fun d!67283 () Bool)

(assert (=> d!67283 (= (validKeyInArray!0 (select (arr!7149 a!3312) #b00000000000000000000000000000000)) (and (not (= (select (arr!7149 a!3312) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7149 a!3312) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!298483 d!67283))

(declare-fun d!67285 () Bool)

(assert (=> d!67285 (arrayContainsKey!0 a!3312 lt!148317 #b00000000000000000000000000000000)))

(declare-fun lt!148421 () Unit!9269)

(declare-fun choose!13 (array!15094 (_ BitVec 64) (_ BitVec 32)) Unit!9269)

(assert (=> d!67285 (= lt!148421 (choose!13 a!3312 lt!148317 #b00000000000000000000000000000000))))

(assert (=> d!67285 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!67285 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148317 #b00000000000000000000000000000000) lt!148421)))

(declare-fun bs!10518 () Bool)

(assert (= bs!10518 d!67285))

(assert (=> bs!10518 m!310485))

(declare-fun m!310635 () Bool)

(assert (=> bs!10518 m!310635))

(assert (=> b!298480 d!67285))

(declare-fun d!67287 () Bool)

(declare-fun res!157525 () Bool)

(declare-fun e!188700 () Bool)

(assert (=> d!67287 (=> res!157525 e!188700)))

(assert (=> d!67287 (= res!157525 (= (select (arr!7149 a!3312) #b00000000000000000000000000000000) lt!148317))))

(assert (=> d!67287 (= (arrayContainsKey!0 a!3312 lt!148317 #b00000000000000000000000000000000) e!188700)))

(declare-fun b!298726 () Bool)

(declare-fun e!188701 () Bool)

(assert (=> b!298726 (= e!188700 e!188701)))

(declare-fun res!157526 () Bool)

(assert (=> b!298726 (=> (not res!157526) (not e!188701))))

(assert (=> b!298726 (= res!157526 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7502 a!3312)))))

(declare-fun b!298727 () Bool)

(assert (=> b!298727 (= e!188701 (arrayContainsKey!0 a!3312 lt!148317 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67287 (not res!157525)) b!298726))

(assert (= (and b!298726 res!157526) b!298727))

(assert (=> d!67287 m!310481))

(declare-fun m!310637 () Bool)

(assert (=> b!298727 m!310637))

(assert (=> b!298480 d!67287))

(declare-fun b!298728 () Bool)

(declare-fun e!188703 () SeekEntryResult!2297)

(assert (=> b!298728 (= e!188703 Undefined!2297)))

(declare-fun b!298729 () Bool)

(declare-fun e!188702 () SeekEntryResult!2297)

(declare-fun lt!148422 () SeekEntryResult!2297)

(assert (=> b!298729 (= e!188702 (MissingZero!2297 (index!11363 lt!148422)))))

(declare-fun b!298730 () Bool)

(declare-fun c!48191 () Bool)

(declare-fun lt!148424 () (_ BitVec 64))

(assert (=> b!298730 (= c!48191 (= lt!148424 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188704 () SeekEntryResult!2297)

(assert (=> b!298730 (= e!188704 e!188702)))

(declare-fun b!298731 () Bool)

(assert (=> b!298731 (= e!188702 (seekKeyOrZeroReturnVacant!0 (x!29608 lt!148422) (index!11363 lt!148422) (index!11363 lt!148422) (select (arr!7149 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809))))

(declare-fun b!298732 () Bool)

(assert (=> b!298732 (= e!188704 (Found!2297 (index!11363 lt!148422)))))

(declare-fun b!298733 () Bool)

(assert (=> b!298733 (= e!188703 e!188704)))

(assert (=> b!298733 (= lt!148424 (select (arr!7149 a!3312) (index!11363 lt!148422)))))

(declare-fun c!48189 () Bool)

(assert (=> b!298733 (= c!48189 (= lt!148424 (select (arr!7149 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!67289 () Bool)

(declare-fun lt!148423 () SeekEntryResult!2297)

(assert (=> d!67289 (and (or ((_ is Undefined!2297) lt!148423) (not ((_ is Found!2297) lt!148423)) (and (bvsge (index!11362 lt!148423) #b00000000000000000000000000000000) (bvslt (index!11362 lt!148423) (size!7502 a!3312)))) (or ((_ is Undefined!2297) lt!148423) ((_ is Found!2297) lt!148423) (not ((_ is MissingZero!2297) lt!148423)) (and (bvsge (index!11361 lt!148423) #b00000000000000000000000000000000) (bvslt (index!11361 lt!148423) (size!7502 a!3312)))) (or ((_ is Undefined!2297) lt!148423) ((_ is Found!2297) lt!148423) ((_ is MissingZero!2297) lt!148423) (not ((_ is MissingVacant!2297) lt!148423)) (and (bvsge (index!11364 lt!148423) #b00000000000000000000000000000000) (bvslt (index!11364 lt!148423) (size!7502 a!3312)))) (or ((_ is Undefined!2297) lt!148423) (ite ((_ is Found!2297) lt!148423) (= (select (arr!7149 a!3312) (index!11362 lt!148423)) (select (arr!7149 a!3312) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!2297) lt!148423) (= (select (arr!7149 a!3312) (index!11361 lt!148423)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2297) lt!148423) (= (select (arr!7149 a!3312) (index!11364 lt!148423)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67289 (= lt!148423 e!188703)))

(declare-fun c!48190 () Bool)

(assert (=> d!67289 (= c!48190 (and ((_ is Intermediate!2297) lt!148422) (undefined!3109 lt!148422)))))

(assert (=> d!67289 (= lt!148422 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!7149 a!3312) #b00000000000000000000000000000000) mask!3809) (select (arr!7149 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809))))

(assert (=> d!67289 (validMask!0 mask!3809)))

(assert (=> d!67289 (= (seekEntryOrOpen!0 (select (arr!7149 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) lt!148423)))

(assert (= (and d!67289 c!48190) b!298728))

(assert (= (and d!67289 (not c!48190)) b!298733))

(assert (= (and b!298733 c!48189) b!298732))

(assert (= (and b!298733 (not c!48189)) b!298730))

(assert (= (and b!298730 c!48191) b!298729))

(assert (= (and b!298730 (not c!48191)) b!298731))

(assert (=> b!298731 m!310481))

(declare-fun m!310639 () Bool)

(assert (=> b!298731 m!310639))

(declare-fun m!310641 () Bool)

(assert (=> b!298733 m!310641))

(declare-fun m!310643 () Bool)

(assert (=> d!67289 m!310643))

(assert (=> d!67289 m!310481))

(declare-fun m!310645 () Bool)

(assert (=> d!67289 m!310645))

(declare-fun m!310647 () Bool)

(assert (=> d!67289 m!310647))

(declare-fun m!310649 () Bool)

(assert (=> d!67289 m!310649))

(declare-fun m!310651 () Bool)

(assert (=> d!67289 m!310651))

(assert (=> d!67289 m!310413))

(assert (=> d!67289 m!310481))

(assert (=> d!67289 m!310643))

(assert (=> b!298480 d!67289))

(declare-fun b!298734 () Bool)

(declare-fun lt!148425 () SeekEntryResult!2297)

(assert (=> b!298734 (and (bvsge (index!11363 lt!148425) #b00000000000000000000000000000000) (bvslt (index!11363 lt!148425) (size!7502 a!3312)))))

(declare-fun res!157527 () Bool)

(assert (=> b!298734 (= res!157527 (= (select (arr!7149 a!3312) (index!11363 lt!148425)) k0!2524))))

(declare-fun e!188706 () Bool)

(assert (=> b!298734 (=> res!157527 e!188706)))

(declare-fun e!188708 () Bool)

(assert (=> b!298734 (= e!188708 e!188706)))

(declare-fun b!298735 () Bool)

(assert (=> b!298735 (and (bvsge (index!11363 lt!148425) #b00000000000000000000000000000000) (bvslt (index!11363 lt!148425) (size!7502 a!3312)))))

(assert (=> b!298735 (= e!188706 (= (select (arr!7149 a!3312) (index!11363 lt!148425)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298736 () Bool)

(declare-fun e!188705 () Bool)

(assert (=> b!298736 (= e!188705 (bvsge (x!29608 lt!148425) #b01111111111111111111111111111110))))

(declare-fun b!298737 () Bool)

(assert (=> b!298737 (and (bvsge (index!11363 lt!148425) #b00000000000000000000000000000000) (bvslt (index!11363 lt!148425) (size!7502 a!3312)))))

(declare-fun res!157529 () Bool)

(assert (=> b!298737 (= res!157529 (= (select (arr!7149 a!3312) (index!11363 lt!148425)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298737 (=> res!157529 e!188706)))

(declare-fun d!67291 () Bool)

(assert (=> d!67291 e!188705))

(declare-fun c!48193 () Bool)

(assert (=> d!67291 (= c!48193 (and ((_ is Intermediate!2297) lt!148425) (undefined!3109 lt!148425)))))

(declare-fun e!188707 () SeekEntryResult!2297)

(assert (=> d!67291 (= lt!148425 e!188707)))

(declare-fun c!48194 () Bool)

(assert (=> d!67291 (= c!48194 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148426 () (_ BitVec 64))

(assert (=> d!67291 (= lt!148426 (select (arr!7149 a!3312) (toIndex!0 k0!2524 mask!3809)))))

(assert (=> d!67291 (validMask!0 mask!3809)))

(assert (=> d!67291 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809) lt!148425)))

(declare-fun b!298738 () Bool)

(declare-fun e!188709 () SeekEntryResult!2297)

(assert (=> b!298738 (= e!188709 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2524 mask!3809) #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!298739 () Bool)

(assert (=> b!298739 (= e!188707 (Intermediate!2297 true (toIndex!0 k0!2524 mask!3809) #b00000000000000000000000000000000))))

(declare-fun b!298740 () Bool)

(assert (=> b!298740 (= e!188705 e!188708)))

(declare-fun res!157528 () Bool)

(assert (=> b!298740 (= res!157528 (and ((_ is Intermediate!2297) lt!148425) (not (undefined!3109 lt!148425)) (bvslt (x!29608 lt!148425) #b01111111111111111111111111111110) (bvsge (x!29608 lt!148425) #b00000000000000000000000000000000) (bvsge (x!29608 lt!148425) #b00000000000000000000000000000000)))))

(assert (=> b!298740 (=> (not res!157528) (not e!188708))))

(declare-fun b!298741 () Bool)

(assert (=> b!298741 (= e!188709 (Intermediate!2297 false (toIndex!0 k0!2524 mask!3809) #b00000000000000000000000000000000))))

(declare-fun b!298742 () Bool)

(assert (=> b!298742 (= e!188707 e!188709)))

(declare-fun c!48192 () Bool)

(assert (=> b!298742 (= c!48192 (or (= lt!148426 k0!2524) (= (bvadd lt!148426 lt!148426) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!67291 c!48194) b!298739))

(assert (= (and d!67291 (not c!48194)) b!298742))

(assert (= (and b!298742 c!48192) b!298741))

(assert (= (and b!298742 (not c!48192)) b!298738))

(assert (= (and d!67291 c!48193) b!298736))

(assert (= (and d!67291 (not c!48193)) b!298740))

(assert (= (and b!298740 res!157528) b!298734))

(assert (= (and b!298734 (not res!157527)) b!298737))

(assert (= (and b!298737 (not res!157529)) b!298735))

(declare-fun m!310653 () Bool)

(assert (=> b!298734 m!310653))

(assert (=> b!298735 m!310653))

(assert (=> d!67291 m!310431))

(declare-fun m!310655 () Bool)

(assert (=> d!67291 m!310655))

(assert (=> d!67291 m!310413))

(assert (=> b!298737 m!310653))

(assert (=> b!298738 m!310431))

(declare-fun m!310657 () Bool)

(assert (=> b!298738 m!310657))

(assert (=> b!298738 m!310657))

(declare-fun m!310659 () Bool)

(assert (=> b!298738 m!310659))

(assert (=> d!67251 d!67291))

(assert (=> d!67251 d!67231))

(assert (=> d!67251 d!67239))

(declare-fun bm!25770 () Bool)

(declare-fun call!25773 () Bool)

(assert (=> bm!25770 (= call!25773 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!298743 () Bool)

(declare-fun e!188711 () Bool)

(declare-fun e!188712 () Bool)

(assert (=> b!298743 (= e!188711 e!188712)))

(declare-fun lt!148429 () (_ BitVec 64))

(assert (=> b!298743 (= lt!148429 (select (arr!7149 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!148428 () Unit!9269)

(assert (=> b!298743 (= lt!148428 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148429 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!298743 (arrayContainsKey!0 a!3312 lt!148429 #b00000000000000000000000000000000)))

(declare-fun lt!148427 () Unit!9269)

(assert (=> b!298743 (= lt!148427 lt!148428)))

(declare-fun res!157530 () Bool)

(assert (=> b!298743 (= res!157530 (= (seekEntryOrOpen!0 (select (arr!7149 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3312 mask!3809) (Found!2297 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!298743 (=> (not res!157530) (not e!188712))))

(declare-fun d!67293 () Bool)

(declare-fun res!157531 () Bool)

(declare-fun e!188710 () Bool)

(assert (=> d!67293 (=> res!157531 e!188710)))

(assert (=> d!67293 (= res!157531 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7502 a!3312)))))

(assert (=> d!67293 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809) e!188710)))

(declare-fun b!298744 () Bool)

(assert (=> b!298744 (= e!188712 call!25773)))

(declare-fun b!298745 () Bool)

(assert (=> b!298745 (= e!188711 call!25773)))

(declare-fun b!298746 () Bool)

(assert (=> b!298746 (= e!188710 e!188711)))

(declare-fun c!48195 () Bool)

(assert (=> b!298746 (= c!48195 (validKeyInArray!0 (select (arr!7149 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!67293 (not res!157531)) b!298746))

(assert (= (and b!298746 c!48195) b!298743))

(assert (= (and b!298746 (not c!48195)) b!298745))

(assert (= (and b!298743 res!157530) b!298744))

(assert (= (or b!298744 b!298745) bm!25770))

(declare-fun m!310661 () Bool)

(assert (=> bm!25770 m!310661))

(assert (=> b!298743 m!310625))

(declare-fun m!310663 () Bool)

(assert (=> b!298743 m!310663))

(declare-fun m!310665 () Bool)

(assert (=> b!298743 m!310665))

(assert (=> b!298743 m!310625))

(declare-fun m!310667 () Bool)

(assert (=> b!298743 m!310667))

(assert (=> b!298746 m!310625))

(assert (=> b!298746 m!310625))

(declare-fun m!310669 () Bool)

(assert (=> b!298746 m!310669))

(assert (=> bm!25763 d!67293))

(declare-fun b!298800 () Bool)

(declare-fun e!188744 () SeekEntryResult!2297)

(assert (=> b!298800 (= e!188744 (MissingVacant!2297 (index!11363 lt!148383)))))

(declare-fun b!298801 () Bool)

(declare-fun e!188745 () SeekEntryResult!2297)

(assert (=> b!298801 (= e!188745 Undefined!2297)))

(declare-fun b!298802 () Bool)

(declare-fun e!188743 () SeekEntryResult!2297)

(assert (=> b!298802 (= e!188745 e!188743)))

(declare-fun c!48219 () Bool)

(declare-fun lt!148451 () (_ BitVec 64))

(assert (=> b!298802 (= c!48219 (= lt!148451 k0!2524))))

(declare-fun b!298803 () Bool)

(assert (=> b!298803 (= e!188743 (Found!2297 (index!11363 lt!148383)))))

(declare-fun d!67295 () Bool)

(declare-fun lt!148452 () SeekEntryResult!2297)

(assert (=> d!67295 (and (or ((_ is Undefined!2297) lt!148452) (not ((_ is Found!2297) lt!148452)) (and (bvsge (index!11362 lt!148452) #b00000000000000000000000000000000) (bvslt (index!11362 lt!148452) (size!7502 a!3312)))) (or ((_ is Undefined!2297) lt!148452) ((_ is Found!2297) lt!148452) (not ((_ is MissingVacant!2297) lt!148452)) (not (= (index!11364 lt!148452) (index!11363 lt!148383))) (and (bvsge (index!11364 lt!148452) #b00000000000000000000000000000000) (bvslt (index!11364 lt!148452) (size!7502 a!3312)))) (or ((_ is Undefined!2297) lt!148452) (ite ((_ is Found!2297) lt!148452) (= (select (arr!7149 a!3312) (index!11362 lt!148452)) k0!2524) (and ((_ is MissingVacant!2297) lt!148452) (= (index!11364 lt!148452) (index!11363 lt!148383)) (= (select (arr!7149 a!3312) (index!11364 lt!148452)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!67295 (= lt!148452 e!188745)))

(declare-fun c!48218 () Bool)

(assert (=> d!67295 (= c!48218 (bvsge (x!29608 lt!148383) #b01111111111111111111111111111110))))

(assert (=> d!67295 (= lt!148451 (select (arr!7149 a!3312) (index!11363 lt!148383)))))

(assert (=> d!67295 (validMask!0 mask!3809)))

(assert (=> d!67295 (= (seekKeyOrZeroReturnVacant!0 (x!29608 lt!148383) (index!11363 lt!148383) (index!11363 lt!148383) k0!2524 a!3312 mask!3809) lt!148452)))

(declare-fun b!298804 () Bool)

(declare-fun c!48220 () Bool)

(assert (=> b!298804 (= c!48220 (= lt!148451 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298804 (= e!188743 e!188744)))

(declare-fun b!298805 () Bool)

(assert (=> b!298805 (= e!188744 (seekKeyOrZeroReturnVacant!0 (bvadd (x!29608 lt!148383) #b00000000000000000000000000000001) (nextIndex!0 (index!11363 lt!148383) (x!29608 lt!148383) mask!3809) (index!11363 lt!148383) k0!2524 a!3312 mask!3809))))

(assert (= (and d!67295 c!48218) b!298801))

(assert (= (and d!67295 (not c!48218)) b!298802))

(assert (= (and b!298802 c!48219) b!298803))

(assert (= (and b!298802 (not c!48219)) b!298804))

(assert (= (and b!298804 c!48220) b!298800))

(assert (= (and b!298804 (not c!48220)) b!298805))

(declare-fun m!310719 () Bool)

(assert (=> d!67295 m!310719))

(declare-fun m!310721 () Bool)

(assert (=> d!67295 m!310721))

(assert (=> d!67295 m!310565))

(assert (=> d!67295 m!310413))

(declare-fun m!310723 () Bool)

(assert (=> b!298805 m!310723))

(assert (=> b!298805 m!310723))

(declare-fun m!310725 () Bool)

(assert (=> b!298805 m!310725))

(assert (=> b!298655 d!67295))

(check-sat (not d!67291) (not b!298731) (not d!67273) (not d!67277) (not d!67281) (not b!298805) (not bm!25770) (not b!298727) (not d!67295) (not d!67289) (not b!298743) (not d!67285) (not b!298716) (not b!298721) (not b!298738) (not b!298746) (not b!298710))
(check-sat)
