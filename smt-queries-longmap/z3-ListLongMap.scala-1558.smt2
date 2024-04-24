; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29518 () Bool)

(assert start!29518)

(declare-fun b!298473 () Bool)

(declare-fun res!157413 () Bool)

(declare-fun e!188559 () Bool)

(assert (=> b!298473 (=> (not res!157413) (not e!188559))))

(declare-datatypes ((array!15093 0))(
  ( (array!15094 (arr!7150 (Array (_ BitVec 32) (_ BitVec 64))) (size!7502 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15093)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298473 (= res!157413 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!298474 () Bool)

(declare-fun e!188561 () Bool)

(assert (=> b!298474 (= e!188559 e!188561)))

(declare-fun res!157411 () Bool)

(assert (=> b!298474 (=> (not res!157411) (not e!188561))))

(declare-datatypes ((SeekEntryResult!2264 0))(
  ( (MissingZero!2264 (index!11229 (_ BitVec 32))) (Found!2264 (index!11230 (_ BitVec 32))) (Intermediate!2264 (undefined!3076 Bool) (index!11231 (_ BitVec 32)) (x!29566 (_ BitVec 32))) (Undefined!2264) (MissingVacant!2264 (index!11232 (_ BitVec 32))) )
))
(declare-fun lt!148421 () SeekEntryResult!2264)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!148422 () Bool)

(assert (=> b!298474 (= res!157411 (or lt!148422 (= lt!148421 (MissingVacant!2264 i!1256))))))

(assert (=> b!298474 (= lt!148422 (= lt!148421 (MissingZero!2264 i!1256)))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15093 (_ BitVec 32)) SeekEntryResult!2264)

(assert (=> b!298474 (= lt!148421 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!298475 () Bool)

(declare-fun lt!148423 () SeekEntryResult!2264)

(get-info :version)

(assert (=> b!298475 (= e!188561 (and (not lt!148422) (= lt!148421 (MissingVacant!2264 i!1256)) (let ((bdg!6419 (not ((_ is Intermediate!2264) lt!148423)))) (and (or bdg!6419 (not (undefined!3076 lt!148423))) (not bdg!6419) (or (bvslt (index!11231 lt!148423) #b00000000000000000000000000000000) (bvsge (index!11231 lt!148423) (size!7502 a!3312)))))))))

(declare-fun lt!148425 () (_ BitVec 32))

(declare-fun lt!148424 () SeekEntryResult!2264)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15093 (_ BitVec 32)) SeekEntryResult!2264)

(assert (=> b!298475 (= lt!148424 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148425 k0!2524 (array!15094 (store (arr!7150 a!3312) i!1256 k0!2524) (size!7502 a!3312)) mask!3809))))

(assert (=> b!298475 (= lt!148423 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148425 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298475 (= lt!148425 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!298476 () Bool)

(declare-fun res!157416 () Bool)

(assert (=> b!298476 (=> (not res!157416) (not e!188559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298476 (= res!157416 (validKeyInArray!0 k0!2524))))

(declare-fun b!298477 () Bool)

(declare-fun res!157414 () Bool)

(assert (=> b!298477 (=> (not res!157414) (not e!188559))))

(assert (=> b!298477 (= res!157414 (and (= (size!7502 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7502 a!3312))))))

(declare-fun res!157412 () Bool)

(assert (=> start!29518 (=> (not res!157412) (not e!188559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29518 (= res!157412 (validMask!0 mask!3809))))

(assert (=> start!29518 e!188559))

(assert (=> start!29518 true))

(declare-fun array_inv!5100 (array!15093) Bool)

(assert (=> start!29518 (array_inv!5100 a!3312)))

(declare-fun b!298472 () Bool)

(declare-fun res!157415 () Bool)

(assert (=> b!298472 (=> (not res!157415) (not e!188561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15093 (_ BitVec 32)) Bool)

(assert (=> b!298472 (= res!157415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29518 res!157412) b!298477))

(assert (= (and b!298477 res!157414) b!298476))

(assert (= (and b!298476 res!157416) b!298473))

(assert (= (and b!298473 res!157413) b!298474))

(assert (= (and b!298474 res!157411) b!298472))

(assert (= (and b!298472 res!157415) b!298475))

(declare-fun m!311159 () Bool)

(assert (=> start!29518 m!311159))

(declare-fun m!311161 () Bool)

(assert (=> start!29518 m!311161))

(declare-fun m!311163 () Bool)

(assert (=> b!298474 m!311163))

(declare-fun m!311165 () Bool)

(assert (=> b!298476 m!311165))

(declare-fun m!311167 () Bool)

(assert (=> b!298475 m!311167))

(declare-fun m!311169 () Bool)

(assert (=> b!298475 m!311169))

(declare-fun m!311171 () Bool)

(assert (=> b!298475 m!311171))

(declare-fun m!311173 () Bool)

(assert (=> b!298475 m!311173))

(declare-fun m!311175 () Bool)

(assert (=> b!298473 m!311175))

(declare-fun m!311177 () Bool)

(assert (=> b!298472 m!311177))

(check-sat (not b!298475) (not b!298476) (not b!298472) (not b!298474) (not start!29518) (not b!298473))
(check-sat)
(get-model)

(declare-fun d!67419 () Bool)

(assert (=> d!67419 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29518 d!67419))

(declare-fun d!67421 () Bool)

(assert (=> d!67421 (= (array_inv!5100 a!3312) (bvsge (size!7502 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29518 d!67421))

(declare-fun d!67423 () Bool)

(assert (=> d!67423 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!298476 d!67423))

(declare-fun b!298522 () Bool)

(declare-fun e!188588 () Bool)

(declare-fun e!188587 () Bool)

(assert (=> b!298522 (= e!188588 e!188587)))

(declare-fun c!48118 () Bool)

(assert (=> b!298522 (= c!48118 (validKeyInArray!0 (select (arr!7150 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!298523 () Bool)

(declare-fun e!188586 () Bool)

(assert (=> b!298523 (= e!188587 e!188586)))

(declare-fun lt!148462 () (_ BitVec 64))

(assert (=> b!298523 (= lt!148462 (select (arr!7150 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9267 0))(
  ( (Unit!9268) )
))
(declare-fun lt!148464 () Unit!9267)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15093 (_ BitVec 64) (_ BitVec 32)) Unit!9267)

(assert (=> b!298523 (= lt!148464 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148462 #b00000000000000000000000000000000))))

(assert (=> b!298523 (arrayContainsKey!0 a!3312 lt!148462 #b00000000000000000000000000000000)))

(declare-fun lt!148463 () Unit!9267)

(assert (=> b!298523 (= lt!148463 lt!148464)))

(declare-fun res!157458 () Bool)

(assert (=> b!298523 (= res!157458 (= (seekEntryOrOpen!0 (select (arr!7150 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2264 #b00000000000000000000000000000000)))))

(assert (=> b!298523 (=> (not res!157458) (not e!188586))))

(declare-fun b!298524 () Bool)

(declare-fun call!25771 () Bool)

(assert (=> b!298524 (= e!188586 call!25771)))

(declare-fun d!67425 () Bool)

(declare-fun res!157457 () Bool)

(assert (=> d!67425 (=> res!157457 e!188588)))

(assert (=> d!67425 (= res!157457 (bvsge #b00000000000000000000000000000000 (size!7502 a!3312)))))

(assert (=> d!67425 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!188588)))

(declare-fun b!298525 () Bool)

(assert (=> b!298525 (= e!188587 call!25771)))

(declare-fun bm!25768 () Bool)

(assert (=> bm!25768 (= call!25771 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(assert (= (and d!67425 (not res!157457)) b!298522))

(assert (= (and b!298522 c!48118) b!298523))

(assert (= (and b!298522 (not c!48118)) b!298525))

(assert (= (and b!298523 res!157458) b!298524))

(assert (= (or b!298524 b!298525) bm!25768))

(declare-fun m!311219 () Bool)

(assert (=> b!298522 m!311219))

(assert (=> b!298522 m!311219))

(declare-fun m!311221 () Bool)

(assert (=> b!298522 m!311221))

(assert (=> b!298523 m!311219))

(declare-fun m!311223 () Bool)

(assert (=> b!298523 m!311223))

(declare-fun m!311225 () Bool)

(assert (=> b!298523 m!311225))

(assert (=> b!298523 m!311219))

(declare-fun m!311227 () Bool)

(assert (=> b!298523 m!311227))

(declare-fun m!311229 () Bool)

(assert (=> bm!25768 m!311229))

(assert (=> b!298472 d!67425))

(declare-fun b!298556 () Bool)

(declare-fun e!188605 () SeekEntryResult!2264)

(assert (=> b!298556 (= e!188605 Undefined!2264)))

(declare-fun b!298557 () Bool)

(declare-fun e!188604 () SeekEntryResult!2264)

(assert (=> b!298557 (= e!188605 e!188604)))

(declare-fun lt!148481 () (_ BitVec 64))

(declare-fun lt!148482 () SeekEntryResult!2264)

(assert (=> b!298557 (= lt!148481 (select (arr!7150 a!3312) (index!11231 lt!148482)))))

(declare-fun c!48134 () Bool)

(assert (=> b!298557 (= c!48134 (= lt!148481 k0!2524))))

(declare-fun b!298558 () Bool)

(declare-fun c!48135 () Bool)

(assert (=> b!298558 (= c!48135 (= lt!148481 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188606 () SeekEntryResult!2264)

(assert (=> b!298558 (= e!188604 e!188606)))

(declare-fun b!298559 () Bool)

(assert (=> b!298559 (= e!188606 (MissingZero!2264 (index!11231 lt!148482)))))

(declare-fun b!298560 () Bool)

(assert (=> b!298560 (= e!188604 (Found!2264 (index!11231 lt!148482)))))

(declare-fun b!298561 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15093 (_ BitVec 32)) SeekEntryResult!2264)

(assert (=> b!298561 (= e!188606 (seekKeyOrZeroReturnVacant!0 (x!29566 lt!148482) (index!11231 lt!148482) (index!11231 lt!148482) k0!2524 a!3312 mask!3809))))

(declare-fun d!67431 () Bool)

(declare-fun lt!148480 () SeekEntryResult!2264)

(assert (=> d!67431 (and (or ((_ is Undefined!2264) lt!148480) (not ((_ is Found!2264) lt!148480)) (and (bvsge (index!11230 lt!148480) #b00000000000000000000000000000000) (bvslt (index!11230 lt!148480) (size!7502 a!3312)))) (or ((_ is Undefined!2264) lt!148480) ((_ is Found!2264) lt!148480) (not ((_ is MissingZero!2264) lt!148480)) (and (bvsge (index!11229 lt!148480) #b00000000000000000000000000000000) (bvslt (index!11229 lt!148480) (size!7502 a!3312)))) (or ((_ is Undefined!2264) lt!148480) ((_ is Found!2264) lt!148480) ((_ is MissingZero!2264) lt!148480) (not ((_ is MissingVacant!2264) lt!148480)) (and (bvsge (index!11232 lt!148480) #b00000000000000000000000000000000) (bvslt (index!11232 lt!148480) (size!7502 a!3312)))) (or ((_ is Undefined!2264) lt!148480) (ite ((_ is Found!2264) lt!148480) (= (select (arr!7150 a!3312) (index!11230 lt!148480)) k0!2524) (ite ((_ is MissingZero!2264) lt!148480) (= (select (arr!7150 a!3312) (index!11229 lt!148480)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2264) lt!148480) (= (select (arr!7150 a!3312) (index!11232 lt!148480)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67431 (= lt!148480 e!188605)))

(declare-fun c!48136 () Bool)

(assert (=> d!67431 (= c!48136 (and ((_ is Intermediate!2264) lt!148482) (undefined!3076 lt!148482)))))

(assert (=> d!67431 (= lt!148482 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67431 (validMask!0 mask!3809)))

(assert (=> d!67431 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!148480)))

(assert (= (and d!67431 c!48136) b!298556))

(assert (= (and d!67431 (not c!48136)) b!298557))

(assert (= (and b!298557 c!48134) b!298560))

(assert (= (and b!298557 (not c!48134)) b!298558))

(assert (= (and b!298558 c!48135) b!298559))

(assert (= (and b!298558 (not c!48135)) b!298561))

(declare-fun m!311243 () Bool)

(assert (=> b!298557 m!311243))

(declare-fun m!311245 () Bool)

(assert (=> b!298561 m!311245))

(declare-fun m!311247 () Bool)

(assert (=> d!67431 m!311247))

(declare-fun m!311249 () Bool)

(assert (=> d!67431 m!311249))

(assert (=> d!67431 m!311159))

(declare-fun m!311251 () Bool)

(assert (=> d!67431 m!311251))

(assert (=> d!67431 m!311173))

(assert (=> d!67431 m!311173))

(declare-fun m!311253 () Bool)

(assert (=> d!67431 m!311253))

(assert (=> b!298474 d!67431))

(declare-fun d!67437 () Bool)

(declare-fun res!157463 () Bool)

(declare-fun e!188611 () Bool)

(assert (=> d!67437 (=> res!157463 e!188611)))

(assert (=> d!67437 (= res!157463 (= (select (arr!7150 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67437 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!188611)))

(declare-fun b!298566 () Bool)

(declare-fun e!188612 () Bool)

(assert (=> b!298566 (= e!188611 e!188612)))

(declare-fun res!157464 () Bool)

(assert (=> b!298566 (=> (not res!157464) (not e!188612))))

(assert (=> b!298566 (= res!157464 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7502 a!3312)))))

(declare-fun b!298567 () Bool)

(assert (=> b!298567 (= e!188612 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67437 (not res!157463)) b!298566))

(assert (= (and b!298566 res!157464) b!298567))

(assert (=> d!67437 m!311219))

(declare-fun m!311255 () Bool)

(assert (=> b!298567 m!311255))

(assert (=> b!298473 d!67437))

(declare-fun e!188650 () SeekEntryResult!2264)

(declare-fun b!298628 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298628 (= e!188650 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148425 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!15094 (store (arr!7150 a!3312) i!1256 k0!2524) (size!7502 a!3312)) mask!3809))))

(declare-fun b!298629 () Bool)

(declare-fun e!188651 () Bool)

(declare-fun lt!148496 () SeekEntryResult!2264)

(assert (=> b!298629 (= e!188651 (bvsge (x!29566 lt!148496) #b01111111111111111111111111111110))))

(declare-fun b!298630 () Bool)

(assert (=> b!298630 (and (bvsge (index!11231 lt!148496) #b00000000000000000000000000000000) (bvslt (index!11231 lt!148496) (size!7502 (array!15094 (store (arr!7150 a!3312) i!1256 k0!2524) (size!7502 a!3312)))))))

(declare-fun e!188653 () Bool)

(assert (=> b!298630 (= e!188653 (= (select (arr!7150 (array!15094 (store (arr!7150 a!3312) i!1256 k0!2524) (size!7502 a!3312))) (index!11231 lt!148496)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298631 () Bool)

(declare-fun e!188649 () Bool)

(assert (=> b!298631 (= e!188651 e!188649)))

(declare-fun res!157490 () Bool)

(assert (=> b!298631 (= res!157490 (and ((_ is Intermediate!2264) lt!148496) (not (undefined!3076 lt!148496)) (bvslt (x!29566 lt!148496) #b01111111111111111111111111111110) (bvsge (x!29566 lt!148496) #b00000000000000000000000000000000) (bvsge (x!29566 lt!148496) #b00000000000000000000000000000000)))))

(assert (=> b!298631 (=> (not res!157490) (not e!188649))))

(declare-fun b!298632 () Bool)

(declare-fun e!188652 () SeekEntryResult!2264)

(assert (=> b!298632 (= e!188652 e!188650)))

(declare-fun c!48157 () Bool)

(declare-fun lt!148495 () (_ BitVec 64))

(assert (=> b!298632 (= c!48157 (or (= lt!148495 k0!2524) (= (bvadd lt!148495 lt!148495) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!298633 () Bool)

(assert (=> b!298633 (= e!188650 (Intermediate!2264 false lt!148425 #b00000000000000000000000000000000))))

(declare-fun b!298634 () Bool)

(assert (=> b!298634 (and (bvsge (index!11231 lt!148496) #b00000000000000000000000000000000) (bvslt (index!11231 lt!148496) (size!7502 (array!15094 (store (arr!7150 a!3312) i!1256 k0!2524) (size!7502 a!3312)))))))

(declare-fun res!157491 () Bool)

(assert (=> b!298634 (= res!157491 (= (select (arr!7150 (array!15094 (store (arr!7150 a!3312) i!1256 k0!2524) (size!7502 a!3312))) (index!11231 lt!148496)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298634 (=> res!157491 e!188653)))

(declare-fun d!67441 () Bool)

(assert (=> d!67441 e!188651))

(declare-fun c!48155 () Bool)

(assert (=> d!67441 (= c!48155 (and ((_ is Intermediate!2264) lt!148496) (undefined!3076 lt!148496)))))

(assert (=> d!67441 (= lt!148496 e!188652)))

(declare-fun c!48156 () Bool)

(assert (=> d!67441 (= c!48156 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67441 (= lt!148495 (select (arr!7150 (array!15094 (store (arr!7150 a!3312) i!1256 k0!2524) (size!7502 a!3312))) lt!148425))))

(assert (=> d!67441 (validMask!0 mask!3809)))

(assert (=> d!67441 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148425 k0!2524 (array!15094 (store (arr!7150 a!3312) i!1256 k0!2524) (size!7502 a!3312)) mask!3809) lt!148496)))

(declare-fun b!298635 () Bool)

(assert (=> b!298635 (= e!188652 (Intermediate!2264 true lt!148425 #b00000000000000000000000000000000))))

(declare-fun b!298636 () Bool)

(assert (=> b!298636 (and (bvsge (index!11231 lt!148496) #b00000000000000000000000000000000) (bvslt (index!11231 lt!148496) (size!7502 (array!15094 (store (arr!7150 a!3312) i!1256 k0!2524) (size!7502 a!3312)))))))

(declare-fun res!157492 () Bool)

(assert (=> b!298636 (= res!157492 (= (select (arr!7150 (array!15094 (store (arr!7150 a!3312) i!1256 k0!2524) (size!7502 a!3312))) (index!11231 lt!148496)) k0!2524))))

(assert (=> b!298636 (=> res!157492 e!188653)))

(assert (=> b!298636 (= e!188649 e!188653)))

(assert (= (and d!67441 c!48156) b!298635))

(assert (= (and d!67441 (not c!48156)) b!298632))

(assert (= (and b!298632 c!48157) b!298633))

(assert (= (and b!298632 (not c!48157)) b!298628))

(assert (= (and d!67441 c!48155) b!298629))

(assert (= (and d!67441 (not c!48155)) b!298631))

(assert (= (and b!298631 res!157490) b!298636))

(assert (= (and b!298636 (not res!157492)) b!298634))

(assert (= (and b!298634 (not res!157491)) b!298630))

(declare-fun m!311275 () Bool)

(assert (=> b!298630 m!311275))

(assert (=> b!298636 m!311275))

(assert (=> b!298634 m!311275))

(declare-fun m!311277 () Bool)

(assert (=> d!67441 m!311277))

(assert (=> d!67441 m!311159))

(declare-fun m!311279 () Bool)

(assert (=> b!298628 m!311279))

(assert (=> b!298628 m!311279))

(declare-fun m!311281 () Bool)

(assert (=> b!298628 m!311281))

(assert (=> b!298475 d!67441))

(declare-fun e!188655 () SeekEntryResult!2264)

(declare-fun b!298637 () Bool)

(assert (=> b!298637 (= e!188655 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148425 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!298638 () Bool)

(declare-fun e!188656 () Bool)

(declare-fun lt!148502 () SeekEntryResult!2264)

(assert (=> b!298638 (= e!188656 (bvsge (x!29566 lt!148502) #b01111111111111111111111111111110))))

(declare-fun b!298639 () Bool)

(assert (=> b!298639 (and (bvsge (index!11231 lt!148502) #b00000000000000000000000000000000) (bvslt (index!11231 lt!148502) (size!7502 a!3312)))))

(declare-fun e!188658 () Bool)

(assert (=> b!298639 (= e!188658 (= (select (arr!7150 a!3312) (index!11231 lt!148502)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298640 () Bool)

(declare-fun e!188654 () Bool)

(assert (=> b!298640 (= e!188656 e!188654)))

(declare-fun res!157493 () Bool)

(assert (=> b!298640 (= res!157493 (and ((_ is Intermediate!2264) lt!148502) (not (undefined!3076 lt!148502)) (bvslt (x!29566 lt!148502) #b01111111111111111111111111111110) (bvsge (x!29566 lt!148502) #b00000000000000000000000000000000) (bvsge (x!29566 lt!148502) #b00000000000000000000000000000000)))))

(assert (=> b!298640 (=> (not res!157493) (not e!188654))))

(declare-fun b!298641 () Bool)

(declare-fun e!188657 () SeekEntryResult!2264)

(assert (=> b!298641 (= e!188657 e!188655)))

(declare-fun c!48160 () Bool)

(declare-fun lt!148501 () (_ BitVec 64))

(assert (=> b!298641 (= c!48160 (or (= lt!148501 k0!2524) (= (bvadd lt!148501 lt!148501) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!298642 () Bool)

(assert (=> b!298642 (= e!188655 (Intermediate!2264 false lt!148425 #b00000000000000000000000000000000))))

(declare-fun b!298643 () Bool)

(assert (=> b!298643 (and (bvsge (index!11231 lt!148502) #b00000000000000000000000000000000) (bvslt (index!11231 lt!148502) (size!7502 a!3312)))))

(declare-fun res!157494 () Bool)

(assert (=> b!298643 (= res!157494 (= (select (arr!7150 a!3312) (index!11231 lt!148502)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298643 (=> res!157494 e!188658)))

(declare-fun d!67451 () Bool)

(assert (=> d!67451 e!188656))

(declare-fun c!48158 () Bool)

(assert (=> d!67451 (= c!48158 (and ((_ is Intermediate!2264) lt!148502) (undefined!3076 lt!148502)))))

(assert (=> d!67451 (= lt!148502 e!188657)))

(declare-fun c!48159 () Bool)

(assert (=> d!67451 (= c!48159 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67451 (= lt!148501 (select (arr!7150 a!3312) lt!148425))))

(assert (=> d!67451 (validMask!0 mask!3809)))

(assert (=> d!67451 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148425 k0!2524 a!3312 mask!3809) lt!148502)))

(declare-fun b!298644 () Bool)

(assert (=> b!298644 (= e!188657 (Intermediate!2264 true lt!148425 #b00000000000000000000000000000000))))

(declare-fun b!298645 () Bool)

(assert (=> b!298645 (and (bvsge (index!11231 lt!148502) #b00000000000000000000000000000000) (bvslt (index!11231 lt!148502) (size!7502 a!3312)))))

(declare-fun res!157495 () Bool)

(assert (=> b!298645 (= res!157495 (= (select (arr!7150 a!3312) (index!11231 lt!148502)) k0!2524))))

(assert (=> b!298645 (=> res!157495 e!188658)))

(assert (=> b!298645 (= e!188654 e!188658)))

(assert (= (and d!67451 c!48159) b!298644))

(assert (= (and d!67451 (not c!48159)) b!298641))

(assert (= (and b!298641 c!48160) b!298642))

(assert (= (and b!298641 (not c!48160)) b!298637))

(assert (= (and d!67451 c!48158) b!298638))

(assert (= (and d!67451 (not c!48158)) b!298640))

(assert (= (and b!298640 res!157493) b!298645))

(assert (= (and b!298645 (not res!157495)) b!298643))

(assert (= (and b!298643 (not res!157494)) b!298639))

(declare-fun m!311283 () Bool)

(assert (=> b!298639 m!311283))

(assert (=> b!298645 m!311283))

(assert (=> b!298643 m!311283))

(declare-fun m!311285 () Bool)

(assert (=> d!67451 m!311285))

(assert (=> d!67451 m!311159))

(assert (=> b!298637 m!311279))

(assert (=> b!298637 m!311279))

(declare-fun m!311287 () Bool)

(assert (=> b!298637 m!311287))

(assert (=> b!298475 d!67451))

(declare-fun d!67455 () Bool)

(declare-fun lt!148516 () (_ BitVec 32))

(declare-fun lt!148515 () (_ BitVec 32))

(assert (=> d!67455 (= lt!148516 (bvmul (bvxor lt!148515 (bvlshr lt!148515 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67455 (= lt!148515 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67455 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157496 (let ((h!5220 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29572 (bvmul (bvxor h!5220 (bvlshr h!5220 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29572 (bvlshr x!29572 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157496 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157496 #b00000000000000000000000000000000))))))

(assert (=> d!67455 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!148516 (bvlshr lt!148516 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!298475 d!67455))

(check-sat (not b!298628) (not d!67431) (not b!298522) (not d!67441) (not bm!25768) (not d!67451) (not b!298561) (not b!298523) (not b!298637) (not b!298567))
(check-sat)
