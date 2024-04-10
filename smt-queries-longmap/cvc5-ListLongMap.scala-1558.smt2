; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29524 () Bool)

(assert start!29524)

(declare-fun b!298407 () Bool)

(declare-fun e!188526 () Bool)

(declare-fun e!188525 () Bool)

(assert (=> b!298407 (= e!188526 e!188525)))

(declare-fun res!157389 () Bool)

(assert (=> b!298407 (=> (not res!157389) (not e!188525))))

(declare-fun lt!148355 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2300 0))(
  ( (MissingZero!2300 (index!11373 (_ BitVec 32))) (Found!2300 (index!11374 (_ BitVec 32))) (Intermediate!2300 (undefined!3112 Bool) (index!11375 (_ BitVec 32)) (x!29601 (_ BitVec 32))) (Undefined!2300) (MissingVacant!2300 (index!11376 (_ BitVec 32))) )
))
(declare-fun lt!148356 () SeekEntryResult!2300)

(assert (=> b!298407 (= res!157389 (or lt!148355 (= lt!148356 (MissingVacant!2300 i!1256))))))

(assert (=> b!298407 (= lt!148355 (= lt!148356 (MissingZero!2300 i!1256)))))

(declare-datatypes ((array!15096 0))(
  ( (array!15097 (arr!7151 (Array (_ BitVec 32) (_ BitVec 64))) (size!7503 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15096)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15096 (_ BitVec 32)) SeekEntryResult!2300)

(assert (=> b!298407 (= lt!148356 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!298408 () Bool)

(declare-fun res!157386 () Bool)

(assert (=> b!298408 (=> (not res!157386) (not e!188526))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298408 (= res!157386 (validKeyInArray!0 k!2524))))

(declare-fun b!298409 () Bool)

(declare-fun res!157388 () Bool)

(assert (=> b!298409 (=> (not res!157388) (not e!188525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15096 (_ BitVec 32)) Bool)

(assert (=> b!298409 (= res!157388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!157384 () Bool)

(assert (=> start!29524 (=> (not res!157384) (not e!188526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29524 (= res!157384 (validMask!0 mask!3809))))

(assert (=> start!29524 e!188526))

(assert (=> start!29524 true))

(declare-fun array_inv!5114 (array!15096) Bool)

(assert (=> start!29524 (array_inv!5114 a!3312)))

(declare-fun lt!148358 () SeekEntryResult!2300)

(declare-fun b!298410 () Bool)

(assert (=> b!298410 (= e!188525 (and (not lt!148355) (= lt!148356 (MissingVacant!2300 i!1256)) (let ((bdg!6419 (not (is-Intermediate!2300 lt!148358)))) (and (or bdg!6419 (not (undefined!3112 lt!148358))) (not bdg!6419) (or (bvslt (index!11375 lt!148358) #b00000000000000000000000000000000) (bvsge (index!11375 lt!148358) (size!7503 a!3312)))))))))

(declare-fun lt!148357 () (_ BitVec 32))

(declare-fun lt!148359 () SeekEntryResult!2300)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15096 (_ BitVec 32)) SeekEntryResult!2300)

(assert (=> b!298410 (= lt!148359 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148357 k!2524 (array!15097 (store (arr!7151 a!3312) i!1256 k!2524) (size!7503 a!3312)) mask!3809))))

(assert (=> b!298410 (= lt!148358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148357 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298410 (= lt!148357 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!298411 () Bool)

(declare-fun res!157385 () Bool)

(assert (=> b!298411 (=> (not res!157385) (not e!188526))))

(assert (=> b!298411 (= res!157385 (and (= (size!7503 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7503 a!3312))))))

(declare-fun b!298412 () Bool)

(declare-fun res!157387 () Bool)

(assert (=> b!298412 (=> (not res!157387) (not e!188526))))

(declare-fun arrayContainsKey!0 (array!15096 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298412 (= res!157387 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29524 res!157384) b!298411))

(assert (= (and b!298411 res!157385) b!298408))

(assert (= (and b!298408 res!157386) b!298412))

(assert (= (and b!298412 res!157387) b!298407))

(assert (= (and b!298407 res!157389) b!298409))

(assert (= (and b!298409 res!157388) b!298410))

(declare-fun m!310929 () Bool)

(assert (=> b!298410 m!310929))

(declare-fun m!310931 () Bool)

(assert (=> b!298410 m!310931))

(declare-fun m!310933 () Bool)

(assert (=> b!298410 m!310933))

(declare-fun m!310935 () Bool)

(assert (=> b!298410 m!310935))

(declare-fun m!310937 () Bool)

(assert (=> b!298412 m!310937))

(declare-fun m!310939 () Bool)

(assert (=> b!298407 m!310939))

(declare-fun m!310941 () Bool)

(assert (=> start!29524 m!310941))

(declare-fun m!310943 () Bool)

(assert (=> start!29524 m!310943))

(declare-fun m!310945 () Bool)

(assert (=> b!298408 m!310945))

(declare-fun m!310947 () Bool)

(assert (=> b!298409 m!310947))

(push 1)

(assert (not b!298410))

(assert (not start!29524))

(assert (not b!298407))

(assert (not b!298409))

(assert (not b!298408))

(assert (not b!298412))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!298533 () Bool)

(declare-fun lt!148421 () SeekEntryResult!2300)

(assert (=> b!298533 (and (bvsge (index!11375 lt!148421) #b00000000000000000000000000000000) (bvslt (index!11375 lt!148421) (size!7503 (array!15097 (store (arr!7151 a!3312) i!1256 k!2524) (size!7503 a!3312)))))))

(declare-fun e!188604 () Bool)

(assert (=> b!298533 (= e!188604 (= (select (arr!7151 (array!15097 (store (arr!7151 a!3312) i!1256 k!2524) (size!7503 a!3312))) (index!11375 lt!148421)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188600 () SeekEntryResult!2300)

(declare-fun b!298534 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298534 (= e!188600 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148357 #b00000000000000000000000000000000 mask!3809) k!2524 (array!15097 (store (arr!7151 a!3312) i!1256 k!2524) (size!7503 a!3312)) mask!3809))))

(declare-fun b!298535 () Bool)

(assert (=> b!298535 (= e!188600 (Intermediate!2300 false lt!148357 #b00000000000000000000000000000000))))

(declare-fun b!298536 () Bool)

(assert (=> b!298536 (and (bvsge (index!11375 lt!148421) #b00000000000000000000000000000000) (bvslt (index!11375 lt!148421) (size!7503 (array!15097 (store (arr!7151 a!3312) i!1256 k!2524) (size!7503 a!3312)))))))

(declare-fun res!157465 () Bool)

(assert (=> b!298536 (= res!157465 (= (select (arr!7151 (array!15097 (store (arr!7151 a!3312) i!1256 k!2524) (size!7503 a!3312))) (index!11375 lt!148421)) k!2524))))

(assert (=> b!298536 (=> res!157465 e!188604)))

(declare-fun e!188601 () Bool)

(assert (=> b!298536 (= e!188601 e!188604)))

(declare-fun d!67359 () Bool)

(declare-fun e!188602 () Bool)

(assert (=> d!67359 e!188602))

(declare-fun c!48122 () Bool)

(assert (=> d!67359 (= c!48122 (and (is-Intermediate!2300 lt!148421) (undefined!3112 lt!148421)))))

(declare-fun e!188603 () SeekEntryResult!2300)

(assert (=> d!67359 (= lt!148421 e!188603)))

(declare-fun c!48121 () Bool)

(assert (=> d!67359 (= c!48121 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148420 () (_ BitVec 64))

(assert (=> d!67359 (= lt!148420 (select (arr!7151 (array!15097 (store (arr!7151 a!3312) i!1256 k!2524) (size!7503 a!3312))) lt!148357))))

(assert (=> d!67359 (validMask!0 mask!3809)))

(assert (=> d!67359 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148357 k!2524 (array!15097 (store (arr!7151 a!3312) i!1256 k!2524) (size!7503 a!3312)) mask!3809) lt!148421)))

(declare-fun b!298537 () Bool)

(assert (=> b!298537 (= e!188602 (bvsge (x!29601 lt!148421) #b01111111111111111111111111111110))))

(declare-fun b!298538 () Bool)

(assert (=> b!298538 (= e!188603 (Intermediate!2300 true lt!148357 #b00000000000000000000000000000000))))

(declare-fun b!298539 () Bool)

(assert (=> b!298539 (and (bvsge (index!11375 lt!148421) #b00000000000000000000000000000000) (bvslt (index!11375 lt!148421) (size!7503 (array!15097 (store (arr!7151 a!3312) i!1256 k!2524) (size!7503 a!3312)))))))

(declare-fun res!157464 () Bool)

(assert (=> b!298539 (= res!157464 (= (select (arr!7151 (array!15097 (store (arr!7151 a!3312) i!1256 k!2524) (size!7503 a!3312))) (index!11375 lt!148421)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298539 (=> res!157464 e!188604)))

(declare-fun b!298540 () Bool)

(assert (=> b!298540 (= e!188603 e!188600)))

(declare-fun c!48123 () Bool)

(assert (=> b!298540 (= c!48123 (or (= lt!148420 k!2524) (= (bvadd lt!148420 lt!148420) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!298541 () Bool)

(assert (=> b!298541 (= e!188602 e!188601)))

(declare-fun res!157463 () Bool)

(assert (=> b!298541 (= res!157463 (and (is-Intermediate!2300 lt!148421) (not (undefined!3112 lt!148421)) (bvslt (x!29601 lt!148421) #b01111111111111111111111111111110) (bvsge (x!29601 lt!148421) #b00000000000000000000000000000000) (bvsge (x!29601 lt!148421) #b00000000000000000000000000000000)))))

(assert (=> b!298541 (=> (not res!157463) (not e!188601))))

(assert (= (and d!67359 c!48121) b!298538))

(assert (= (and d!67359 (not c!48121)) b!298540))

(assert (= (and b!298540 c!48123) b!298535))

(assert (= (and b!298540 (not c!48123)) b!298534))

(assert (= (and d!67359 c!48122) b!298537))

(assert (= (and d!67359 (not c!48122)) b!298541))

(assert (= (and b!298541 res!157463) b!298536))

(assert (= (and b!298536 (not res!157465)) b!298539))

(assert (= (and b!298539 (not res!157464)) b!298533))

(declare-fun m!311029 () Bool)

(assert (=> b!298536 m!311029))

(assert (=> b!298539 m!311029))

(assert (=> b!298533 m!311029))

(declare-fun m!311031 () Bool)

(assert (=> d!67359 m!311031))

(assert (=> d!67359 m!310941))

(declare-fun m!311033 () Bool)

(assert (=> b!298534 m!311033))

(assert (=> b!298534 m!311033))

(declare-fun m!311035 () Bool)

(assert (=> b!298534 m!311035))

(assert (=> b!298410 d!67359))

(declare-fun b!298542 () Bool)

(declare-fun lt!148423 () SeekEntryResult!2300)

(assert (=> b!298542 (and (bvsge (index!11375 lt!148423) #b00000000000000000000000000000000) (bvslt (index!11375 lt!148423) (size!7503 a!3312)))))

(declare-fun e!188609 () Bool)

(assert (=> b!298542 (= e!188609 (= (select (arr!7151 a!3312) (index!11375 lt!148423)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298543 () Bool)

(declare-fun e!188605 () SeekEntryResult!2300)

(assert (=> b!298543 (= e!188605 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148357 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!298544 () Bool)

(assert (=> b!298544 (= e!188605 (Intermediate!2300 false lt!148357 #b00000000000000000000000000000000))))

(declare-fun b!298545 () Bool)

(assert (=> b!298545 (and (bvsge (index!11375 lt!148423) #b00000000000000000000000000000000) (bvslt (index!11375 lt!148423) (size!7503 a!3312)))))

(declare-fun res!157468 () Bool)

(assert (=> b!298545 (= res!157468 (= (select (arr!7151 a!3312) (index!11375 lt!148423)) k!2524))))

(assert (=> b!298545 (=> res!157468 e!188609)))

(declare-fun e!188606 () Bool)

(assert (=> b!298545 (= e!188606 e!188609)))

(declare-fun d!67369 () Bool)

(declare-fun e!188607 () Bool)

(assert (=> d!67369 e!188607))

(declare-fun c!48125 () Bool)

(assert (=> d!67369 (= c!48125 (and (is-Intermediate!2300 lt!148423) (undefined!3112 lt!148423)))))

(declare-fun e!188608 () SeekEntryResult!2300)

(assert (=> d!67369 (= lt!148423 e!188608)))

(declare-fun c!48124 () Bool)

(assert (=> d!67369 (= c!48124 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!148422 () (_ BitVec 64))

(assert (=> d!67369 (= lt!148422 (select (arr!7151 a!3312) lt!148357))))

(assert (=> d!67369 (validMask!0 mask!3809)))

(assert (=> d!67369 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148357 k!2524 a!3312 mask!3809) lt!148423)))

(declare-fun b!298546 () Bool)

(assert (=> b!298546 (= e!188607 (bvsge (x!29601 lt!148423) #b01111111111111111111111111111110))))

(declare-fun b!298547 () Bool)

(assert (=> b!298547 (= e!188608 (Intermediate!2300 true lt!148357 #b00000000000000000000000000000000))))

(declare-fun b!298548 () Bool)

(assert (=> b!298548 (and (bvsge (index!11375 lt!148423) #b00000000000000000000000000000000) (bvslt (index!11375 lt!148423) (size!7503 a!3312)))))

(declare-fun res!157467 () Bool)

(assert (=> b!298548 (= res!157467 (= (select (arr!7151 a!3312) (index!11375 lt!148423)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298548 (=> res!157467 e!188609)))

(declare-fun b!298549 () Bool)

(assert (=> b!298549 (= e!188608 e!188605)))

(declare-fun c!48126 () Bool)

(assert (=> b!298549 (= c!48126 (or (= lt!148422 k!2524) (= (bvadd lt!148422 lt!148422) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!298550 () Bool)

(assert (=> b!298550 (= e!188607 e!188606)))

(declare-fun res!157466 () Bool)

(assert (=> b!298550 (= res!157466 (and (is-Intermediate!2300 lt!148423) (not (undefined!3112 lt!148423)) (bvslt (x!29601 lt!148423) #b01111111111111111111111111111110) (bvsge (x!29601 lt!148423) #b00000000000000000000000000000000) (bvsge (x!29601 lt!148423) #b00000000000000000000000000000000)))))

(assert (=> b!298550 (=> (not res!157466) (not e!188606))))

(assert (= (and d!67369 c!48124) b!298547))

(assert (= (and d!67369 (not c!48124)) b!298549))

(assert (= (and b!298549 c!48126) b!298544))

(assert (= (and b!298549 (not c!48126)) b!298543))

(assert (= (and d!67369 c!48125) b!298546))

(assert (= (and d!67369 (not c!48125)) b!298550))

(assert (= (and b!298550 res!157466) b!298545))

(assert (= (and b!298545 (not res!157468)) b!298548))

(assert (= (and b!298548 (not res!157467)) b!298542))

(declare-fun m!311037 () Bool)

(assert (=> b!298545 m!311037))

(assert (=> b!298548 m!311037))

(assert (=> b!298542 m!311037))

(declare-fun m!311039 () Bool)

(assert (=> d!67369 m!311039))

(assert (=> d!67369 m!310941))

(assert (=> b!298543 m!311033))

(assert (=> b!298543 m!311033))

(declare-fun m!311041 () Bool)

(assert (=> b!298543 m!311041))

(assert (=> b!298410 d!67369))

(declare-fun d!67373 () Bool)

(declare-fun lt!148435 () (_ BitVec 32))

(declare-fun lt!148434 () (_ BitVec 32))

(assert (=> d!67373 (= lt!148435 (bvmul (bvxor lt!148434 (bvlshr lt!148434 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67373 (= lt!148434 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67373 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157469 (let ((h!5308 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29607 (bvmul (bvxor h!5308 (bvlshr h!5308 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29607 (bvlshr x!29607 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157469 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157469 #b00000000000000000000000000000000))))))

(assert (=> d!67373 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!148435 (bvlshr lt!148435 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!298410 d!67373))

(declare-fun d!67379 () Bool)

(assert (=> d!67379 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29524 d!67379))

(declare-fun d!67381 () Bool)

(assert (=> d!67381 (= (array_inv!5114 a!3312) (bvsge (size!7503 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29524 d!67381))

(declare-fun d!67383 () Bool)

(declare-fun res!157480 () Bool)

(declare-fun e!188630 () Bool)

(assert (=> d!67383 (=> res!157480 e!188630)))

(assert (=> d!67383 (= res!157480 (= (select (arr!7151 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!67383 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!188630)))

(declare-fun b!298585 () Bool)

(declare-fun e!188631 () Bool)

(assert (=> b!298585 (= e!188630 e!188631)))

(declare-fun res!157481 () Bool)

(assert (=> b!298585 (=> (not res!157481) (not e!188631))))

(assert (=> b!298585 (= res!157481 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7503 a!3312)))))

(declare-fun b!298586 () Bool)

(assert (=> b!298586 (= e!188631 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67383 (not res!157480)) b!298585))

(assert (= (and b!298585 res!157481) b!298586))

(declare-fun m!311043 () Bool)

(assert (=> d!67383 m!311043))

(declare-fun m!311045 () Bool)

(assert (=> b!298586 m!311045))

(assert (=> b!298412 d!67383))

(declare-fun b!298629 () Bool)

(declare-fun e!188658 () SeekEntryResult!2300)

(declare-fun lt!148466 () SeekEntryResult!2300)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15096 (_ BitVec 32)) SeekEntryResult!2300)

(assert (=> b!298629 (= e!188658 (seekKeyOrZeroReturnVacant!0 (x!29601 lt!148466) (index!11375 lt!148466) (index!11375 lt!148466) k!2524 a!3312 mask!3809))))

(declare-fun b!298630 () Bool)

(declare-fun c!48154 () Bool)

(declare-fun lt!148467 () (_ BitVec 64))

(assert (=> b!298630 (= c!48154 (= lt!148467 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188657 () SeekEntryResult!2300)

(assert (=> b!298630 (= e!188657 e!188658)))

(declare-fun b!298631 () Bool)

(assert (=> b!298631 (= e!188657 (Found!2300 (index!11375 lt!148466)))))

(declare-fun d!67385 () Bool)

(declare-fun lt!148465 () SeekEntryResult!2300)

(assert (=> d!67385 (and (or (is-Undefined!2300 lt!148465) (not (is-Found!2300 lt!148465)) (and (bvsge (index!11374 lt!148465) #b00000000000000000000000000000000) (bvslt (index!11374 lt!148465) (size!7503 a!3312)))) (or (is-Undefined!2300 lt!148465) (is-Found!2300 lt!148465) (not (is-MissingZero!2300 lt!148465)) (and (bvsge (index!11373 lt!148465) #b00000000000000000000000000000000) (bvslt (index!11373 lt!148465) (size!7503 a!3312)))) (or (is-Undefined!2300 lt!148465) (is-Found!2300 lt!148465) (is-MissingZero!2300 lt!148465) (not (is-MissingVacant!2300 lt!148465)) (and (bvsge (index!11376 lt!148465) #b00000000000000000000000000000000) (bvslt (index!11376 lt!148465) (size!7503 a!3312)))) (or (is-Undefined!2300 lt!148465) (ite (is-Found!2300 lt!148465) (= (select (arr!7151 a!3312) (index!11374 lt!148465)) k!2524) (ite (is-MissingZero!2300 lt!148465) (= (select (arr!7151 a!3312) (index!11373 lt!148465)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2300 lt!148465) (= (select (arr!7151 a!3312) (index!11376 lt!148465)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!188659 () SeekEntryResult!2300)

(assert (=> d!67385 (= lt!148465 e!188659)))

(declare-fun c!48155 () Bool)

(assert (=> d!67385 (= c!48155 (and (is-Intermediate!2300 lt!148466) (undefined!3112 lt!148466)))))

(assert (=> d!67385 (= lt!148466 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!67385 (validMask!0 mask!3809)))

(assert (=> d!67385 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!148465)))

(declare-fun b!298632 () Bool)

(assert (=> b!298632 (= e!188659 Undefined!2300)))

(declare-fun b!298633 () Bool)

(assert (=> b!298633 (= e!188659 e!188657)))

(assert (=> b!298633 (= lt!148467 (select (arr!7151 a!3312) (index!11375 lt!148466)))))

(declare-fun c!48156 () Bool)

(assert (=> b!298633 (= c!48156 (= lt!148467 k!2524))))

(declare-fun b!298634 () Bool)

(assert (=> b!298634 (= e!188658 (MissingZero!2300 (index!11375 lt!148466)))))

(assert (= (and d!67385 c!48155) b!298632))

(assert (= (and d!67385 (not c!48155)) b!298633))

(assert (= (and b!298633 c!48156) b!298631))

(assert (= (and b!298633 (not c!48156)) b!298630))

(assert (= (and b!298630 c!48154) b!298634))

(assert (= (and b!298630 (not c!48154)) b!298629))

(declare-fun m!311075 () Bool)

(assert (=> b!298629 m!311075))

(assert (=> d!67385 m!310935))

(declare-fun m!311077 () Bool)

(assert (=> d!67385 m!311077))

(declare-fun m!311079 () Bool)

(assert (=> d!67385 m!311079))

(assert (=> d!67385 m!310935))

(assert (=> d!67385 m!310941))

(declare-fun m!311081 () Bool)

(assert (=> d!67385 m!311081))

(declare-fun m!311083 () Bool)

(assert (=> d!67385 m!311083))

(declare-fun m!311085 () Bool)

(assert (=> b!298633 m!311085))

(assert (=> b!298407 d!67385))

(declare-fun d!67401 () Bool)

(assert (=> d!67401 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!298408 d!67401))

(declare-fun d!67403 () Bool)

(declare-fun res!157499 () Bool)

(declare-fun e!188673 () Bool)

(assert (=> d!67403 (=> res!157499 e!188673)))

(assert (=> d!67403 (= res!157499 (bvsge #b00000000000000000000000000000000 (size!7503 a!3312)))))

(assert (=> d!67403 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!188673)))

(declare-fun b!298655 () Bool)

(declare-fun e!188674 () Bool)

(assert (=> b!298655 (= e!188673 e!188674)))

(declare-fun c!48165 () Bool)

(assert (=> b!298655 (= c!48165 (validKeyInArray!0 (select (arr!7151 a!3312) #b00000000000000000000000000000000)))))

(declare-fun bm!25786 () Bool)

(declare-fun call!25789 () Bool)

(assert (=> bm!25786 (= call!25789 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!298656 () Bool)

(declare-fun e!188672 () Bool)

(assert (=> b!298656 (= e!188674 e!188672)))

(declare-fun lt!148481 () (_ BitVec 64))

(assert (=> b!298656 (= lt!148481 (select (arr!7151 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9315 0))(
  ( (Unit!9316) )
))
(declare-fun lt!148480 () Unit!9315)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15096 (_ BitVec 64) (_ BitVec 32)) Unit!9315)

(assert (=> b!298656 (= lt!148480 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148481 #b00000000000000000000000000000000))))

(assert (=> b!298656 (arrayContainsKey!0 a!3312 lt!148481 #b00000000000000000000000000000000)))

(declare-fun lt!148482 () Unit!9315)

(assert (=> b!298656 (= lt!148482 lt!148480)))

(declare-fun res!157500 () Bool)

(assert (=> b!298656 (= res!157500 (= (seekEntryOrOpen!0 (select (arr!7151 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2300 #b00000000000000000000000000000000)))))

(assert (=> b!298656 (=> (not res!157500) (not e!188672))))

(declare-fun b!298657 () Bool)

(assert (=> b!298657 (= e!188674 call!25789)))

(declare-fun b!298658 () Bool)

(assert (=> b!298658 (= e!188672 call!25789)))

(assert (= (and d!67403 (not res!157499)) b!298655))

(assert (= (and b!298655 c!48165) b!298656))

(assert (= (and b!298655 (not c!48165)) b!298657))

(assert (= (and b!298656 res!157500) b!298658))

(assert (= (or b!298658 b!298657) bm!25786))

(assert (=> b!298655 m!311043))

(assert (=> b!298655 m!311043))

(declare-fun m!311087 () Bool)

(assert (=> b!298655 m!311087))

(declare-fun m!311089 () Bool)

(assert (=> bm!25786 m!311089))

(assert (=> b!298656 m!311043))

(declare-fun m!311091 () Bool)

(assert (=> b!298656 m!311091))

(declare-fun m!311093 () Bool)

(assert (=> b!298656 m!311093))

(assert (=> b!298656 m!311043))

(declare-fun m!311095 () Bool)

(assert (=> b!298656 m!311095))

(assert (=> b!298409 d!67403))

(push 1)

(assert (not d!67385))

(assert (not b!298586))

(assert (not b!298629))

(assert (not b!298534))

(assert (not d!67359))

(assert (not bm!25786))

(assert (not b!298656))

(assert (not b!298543))

(assert (not b!298655))

(assert (not d!67369))

(check-sat)

(pop 1)

(push 1)

(check-sat)

