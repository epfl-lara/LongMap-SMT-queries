; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28454 () Bool)

(assert start!28454)

(declare-fun res!152753 () Bool)

(declare-fun e!184396 () Bool)

(assert (=> start!28454 (=> (not res!152753) (not e!184396))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28454 (= res!152753 (validMask!0 mask!3809))))

(assert (=> start!28454 e!184396))

(assert (=> start!28454 true))

(declare-datatypes ((array!14723 0))(
  ( (array!14724 (arr!6987 (Array (_ BitVec 32) (_ BitVec 64))) (size!7339 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14723)

(declare-fun array_inv!4950 (array!14723) Bool)

(assert (=> start!28454 (array_inv!4950 a!3312)))

(declare-fun b!291409 () Bool)

(declare-fun e!184395 () Bool)

(declare-fun e!184393 () Bool)

(assert (=> b!291409 (= e!184395 e!184393)))

(declare-fun res!152748 () Bool)

(assert (=> b!291409 (=> (not res!152748) (not e!184393))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2136 0))(
  ( (MissingZero!2136 (index!10714 (_ BitVec 32))) (Found!2136 (index!10715 (_ BitVec 32))) (Intermediate!2136 (undefined!2948 Bool) (index!10716 (_ BitVec 32)) (x!28899 (_ BitVec 32))) (Undefined!2136) (MissingVacant!2136 (index!10717 (_ BitVec 32))) )
))
(declare-fun lt!144170 () SeekEntryResult!2136)

(declare-fun lt!144175 () Bool)

(assert (=> b!291409 (= res!152748 (and (not lt!144175) (= lt!144170 (MissingVacant!2136 i!1256))))))

(declare-fun lt!144171 () SeekEntryResult!2136)

(declare-fun lt!144172 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14723 (_ BitVec 32)) SeekEntryResult!2136)

(assert (=> b!291409 (= lt!144171 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144172 k0!2524 (array!14724 (store (arr!6987 a!3312) i!1256 k0!2524) (size!7339 a!3312)) mask!3809))))

(declare-fun lt!144174 () SeekEntryResult!2136)

(assert (=> b!291409 (= lt!144174 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144172 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291409 (= lt!144172 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!291410 () Bool)

(assert (=> b!291410 (= e!184396 e!184395)))

(declare-fun res!152747 () Bool)

(assert (=> b!291410 (=> (not res!152747) (not e!184395))))

(assert (=> b!291410 (= res!152747 (or lt!144175 (= lt!144170 (MissingVacant!2136 i!1256))))))

(assert (=> b!291410 (= lt!144175 (= lt!144170 (MissingZero!2136 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14723 (_ BitVec 32)) SeekEntryResult!2136)

(assert (=> b!291410 (= lt!144170 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!291411 () Bool)

(declare-fun e!184397 () Bool)

(assert (=> b!291411 (= e!184393 e!184397)))

(declare-fun res!152749 () Bool)

(assert (=> b!291411 (=> (not res!152749) (not e!184397))))

(declare-fun lt!144173 () Bool)

(assert (=> b!291411 (= res!152749 (and (or lt!144173 (not (undefined!2948 lt!144174))) (not lt!144173) (= (select (arr!6987 a!3312) (index!10716 lt!144174)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!291411 (= lt!144173 (not ((_ is Intermediate!2136) lt!144174)))))

(declare-fun b!291412 () Bool)

(declare-fun res!152754 () Bool)

(assert (=> b!291412 (=> (not res!152754) (not e!184396))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291412 (= res!152754 (validKeyInArray!0 k0!2524))))

(declare-fun b!291413 () Bool)

(declare-fun res!152751 () Bool)

(assert (=> b!291413 (=> (not res!152751) (not e!184396))))

(assert (=> b!291413 (= res!152751 (and (= (size!7339 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7339 a!3312))))))

(declare-fun b!291414 () Bool)

(assert (=> b!291414 (= e!184397 (not (or (not (= lt!144174 (Intermediate!2136 false (index!10716 lt!144174) (x!28899 lt!144174)))) (bvsle #b00000000000000000000000000000000 (x!28899 lt!144174)))))))

(assert (=> b!291414 (= (index!10716 lt!144174) i!1256)))

(declare-fun b!291415 () Bool)

(declare-fun res!152752 () Bool)

(assert (=> b!291415 (=> (not res!152752) (not e!184396))))

(declare-fun arrayContainsKey!0 (array!14723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291415 (= res!152752 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!291416 () Bool)

(declare-fun res!152750 () Bool)

(assert (=> b!291416 (=> (not res!152750) (not e!184395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14723 (_ BitVec 32)) Bool)

(assert (=> b!291416 (= res!152750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28454 res!152753) b!291413))

(assert (= (and b!291413 res!152751) b!291412))

(assert (= (and b!291412 res!152754) b!291415))

(assert (= (and b!291415 res!152752) b!291410))

(assert (= (and b!291410 res!152747) b!291416))

(assert (= (and b!291416 res!152750) b!291409))

(assert (= (and b!291409 res!152748) b!291411))

(assert (= (and b!291411 res!152749) b!291414))

(declare-fun m!305347 () Bool)

(assert (=> b!291411 m!305347))

(declare-fun m!305349 () Bool)

(assert (=> b!291416 m!305349))

(declare-fun m!305351 () Bool)

(assert (=> b!291415 m!305351))

(declare-fun m!305353 () Bool)

(assert (=> start!28454 m!305353))

(declare-fun m!305355 () Bool)

(assert (=> start!28454 m!305355))

(declare-fun m!305357 () Bool)

(assert (=> b!291412 m!305357))

(declare-fun m!305359 () Bool)

(assert (=> b!291409 m!305359))

(declare-fun m!305361 () Bool)

(assert (=> b!291409 m!305361))

(declare-fun m!305363 () Bool)

(assert (=> b!291409 m!305363))

(declare-fun m!305365 () Bool)

(assert (=> b!291409 m!305365))

(declare-fun m!305367 () Bool)

(assert (=> b!291410 m!305367))

(check-sat (not b!291412) (not b!291415) (not start!28454) (not b!291410) (not b!291416) (not b!291409))
(check-sat)
(get-model)

(declare-fun d!66359 () Bool)

(assert (=> d!66359 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!291412 d!66359))

(declare-fun b!291449 () Bool)

(declare-fun e!184419 () Bool)

(declare-fun e!184420 () Bool)

(assert (=> b!291449 (= e!184419 e!184420)))

(declare-fun lt!144202 () (_ BitVec 64))

(assert (=> b!291449 (= lt!144202 (select (arr!6987 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9144 0))(
  ( (Unit!9145) )
))
(declare-fun lt!144200 () Unit!9144)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14723 (_ BitVec 64) (_ BitVec 32)) Unit!9144)

(assert (=> b!291449 (= lt!144200 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!144202 #b00000000000000000000000000000000))))

(assert (=> b!291449 (arrayContainsKey!0 a!3312 lt!144202 #b00000000000000000000000000000000)))

(declare-fun lt!144201 () Unit!9144)

(assert (=> b!291449 (= lt!144201 lt!144200)))

(declare-fun res!152783 () Bool)

(assert (=> b!291449 (= res!152783 (= (seekEntryOrOpen!0 (select (arr!6987 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2136 #b00000000000000000000000000000000)))))

(assert (=> b!291449 (=> (not res!152783) (not e!184420))))

(declare-fun b!291450 () Bool)

(declare-fun call!25645 () Bool)

(assert (=> b!291450 (= e!184420 call!25645)))

(declare-fun b!291451 () Bool)

(assert (=> b!291451 (= e!184419 call!25645)))

(declare-fun d!66361 () Bool)

(declare-fun res!152784 () Bool)

(declare-fun e!184421 () Bool)

(assert (=> d!66361 (=> res!152784 e!184421)))

(assert (=> d!66361 (= res!152784 (bvsge #b00000000000000000000000000000000 (size!7339 a!3312)))))

(assert (=> d!66361 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!184421)))

(declare-fun bm!25642 () Bool)

(assert (=> bm!25642 (= call!25645 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!291452 () Bool)

(assert (=> b!291452 (= e!184421 e!184419)))

(declare-fun c!46896 () Bool)

(assert (=> b!291452 (= c!46896 (validKeyInArray!0 (select (arr!6987 a!3312) #b00000000000000000000000000000000)))))

(assert (= (and d!66361 (not res!152784)) b!291452))

(assert (= (and b!291452 c!46896) b!291449))

(assert (= (and b!291452 (not c!46896)) b!291451))

(assert (= (and b!291449 res!152783) b!291450))

(assert (= (or b!291450 b!291451) bm!25642))

(declare-fun m!305391 () Bool)

(assert (=> b!291449 m!305391))

(declare-fun m!305393 () Bool)

(assert (=> b!291449 m!305393))

(declare-fun m!305395 () Bool)

(assert (=> b!291449 m!305395))

(assert (=> b!291449 m!305391))

(declare-fun m!305397 () Bool)

(assert (=> b!291449 m!305397))

(declare-fun m!305399 () Bool)

(assert (=> bm!25642 m!305399))

(assert (=> b!291452 m!305391))

(assert (=> b!291452 m!305391))

(declare-fun m!305401 () Bool)

(assert (=> b!291452 m!305401))

(assert (=> b!291416 d!66361))

(declare-fun b!291477 () Bool)

(declare-fun e!184440 () SeekEntryResult!2136)

(assert (=> b!291477 (= e!184440 Undefined!2136)))

(declare-fun b!291478 () Bool)

(declare-fun e!184442 () SeekEntryResult!2136)

(declare-fun lt!144209 () SeekEntryResult!2136)

(assert (=> b!291478 (= e!184442 (MissingZero!2136 (index!10716 lt!144209)))))

(declare-fun b!291479 () Bool)

(declare-fun c!46904 () Bool)

(declare-fun lt!144211 () (_ BitVec 64))

(assert (=> b!291479 (= c!46904 (= lt!144211 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!184441 () SeekEntryResult!2136)

(assert (=> b!291479 (= e!184441 e!184442)))

(declare-fun d!66365 () Bool)

(declare-fun lt!144210 () SeekEntryResult!2136)

(assert (=> d!66365 (and (or ((_ is Undefined!2136) lt!144210) (not ((_ is Found!2136) lt!144210)) (and (bvsge (index!10715 lt!144210) #b00000000000000000000000000000000) (bvslt (index!10715 lt!144210) (size!7339 a!3312)))) (or ((_ is Undefined!2136) lt!144210) ((_ is Found!2136) lt!144210) (not ((_ is MissingZero!2136) lt!144210)) (and (bvsge (index!10714 lt!144210) #b00000000000000000000000000000000) (bvslt (index!10714 lt!144210) (size!7339 a!3312)))) (or ((_ is Undefined!2136) lt!144210) ((_ is Found!2136) lt!144210) ((_ is MissingZero!2136) lt!144210) (not ((_ is MissingVacant!2136) lt!144210)) (and (bvsge (index!10717 lt!144210) #b00000000000000000000000000000000) (bvslt (index!10717 lt!144210) (size!7339 a!3312)))) (or ((_ is Undefined!2136) lt!144210) (ite ((_ is Found!2136) lt!144210) (= (select (arr!6987 a!3312) (index!10715 lt!144210)) k0!2524) (ite ((_ is MissingZero!2136) lt!144210) (= (select (arr!6987 a!3312) (index!10714 lt!144210)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2136) lt!144210) (= (select (arr!6987 a!3312) (index!10717 lt!144210)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66365 (= lt!144210 e!184440)))

(declare-fun c!46903 () Bool)

(assert (=> d!66365 (= c!46903 (and ((_ is Intermediate!2136) lt!144209) (undefined!2948 lt!144209)))))

(assert (=> d!66365 (= lt!144209 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66365 (validMask!0 mask!3809)))

(assert (=> d!66365 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!144210)))

(declare-fun b!291480 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14723 (_ BitVec 32)) SeekEntryResult!2136)

(assert (=> b!291480 (= e!184442 (seekKeyOrZeroReturnVacant!0 (x!28899 lt!144209) (index!10716 lt!144209) (index!10716 lt!144209) k0!2524 a!3312 mask!3809))))

(declare-fun b!291481 () Bool)

(assert (=> b!291481 (= e!184440 e!184441)))

(assert (=> b!291481 (= lt!144211 (select (arr!6987 a!3312) (index!10716 lt!144209)))))

(declare-fun c!46905 () Bool)

(assert (=> b!291481 (= c!46905 (= lt!144211 k0!2524))))

(declare-fun b!291482 () Bool)

(assert (=> b!291482 (= e!184441 (Found!2136 (index!10716 lt!144209)))))

(assert (= (and d!66365 c!46903) b!291477))

(assert (= (and d!66365 (not c!46903)) b!291481))

(assert (= (and b!291481 c!46905) b!291482))

(assert (= (and b!291481 (not c!46905)) b!291479))

(assert (= (and b!291479 c!46904) b!291478))

(assert (= (and b!291479 (not c!46904)) b!291480))

(assert (=> d!66365 m!305353))

(declare-fun m!305411 () Bool)

(assert (=> d!66365 m!305411))

(declare-fun m!305413 () Bool)

(assert (=> d!66365 m!305413))

(assert (=> d!66365 m!305365))

(declare-fun m!305415 () Bool)

(assert (=> d!66365 m!305415))

(assert (=> d!66365 m!305365))

(declare-fun m!305417 () Bool)

(assert (=> d!66365 m!305417))

(declare-fun m!305419 () Bool)

(assert (=> b!291480 m!305419))

(declare-fun m!305421 () Bool)

(assert (=> b!291481 m!305421))

(assert (=> b!291410 d!66365))

(declare-fun d!66379 () Bool)

(assert (=> d!66379 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28454 d!66379))

(declare-fun d!66381 () Bool)

(assert (=> d!66381 (= (array_inv!4950 a!3312) (bvsge (size!7339 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28454 d!66381))

(declare-fun d!66383 () Bool)

(declare-fun res!152801 () Bool)

(declare-fun e!184462 () Bool)

(assert (=> d!66383 (=> res!152801 e!184462)))

(assert (=> d!66383 (= res!152801 (= (select (arr!6987 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66383 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!184462)))

(declare-fun b!291517 () Bool)

(declare-fun e!184463 () Bool)

(assert (=> b!291517 (= e!184462 e!184463)))

(declare-fun res!152802 () Bool)

(assert (=> b!291517 (=> (not res!152802) (not e!184463))))

(assert (=> b!291517 (= res!152802 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7339 a!3312)))))

(declare-fun b!291518 () Bool)

(assert (=> b!291518 (= e!184463 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66383 (not res!152801)) b!291517))

(assert (= (and b!291517 res!152802) b!291518))

(assert (=> d!66383 m!305391))

(declare-fun m!305423 () Bool)

(assert (=> b!291518 m!305423))

(assert (=> b!291415 d!66383))

(declare-fun d!66385 () Bool)

(declare-fun e!184496 () Bool)

(assert (=> d!66385 e!184496))

(declare-fun c!46936 () Bool)

(declare-fun lt!144249 () SeekEntryResult!2136)

(assert (=> d!66385 (= c!46936 (and ((_ is Intermediate!2136) lt!144249) (undefined!2948 lt!144249)))))

(declare-fun e!184495 () SeekEntryResult!2136)

(assert (=> d!66385 (= lt!144249 e!184495)))

(declare-fun c!46935 () Bool)

(assert (=> d!66385 (= c!46935 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!144250 () (_ BitVec 64))

(assert (=> d!66385 (= lt!144250 (select (arr!6987 (array!14724 (store (arr!6987 a!3312) i!1256 k0!2524) (size!7339 a!3312))) lt!144172))))

(assert (=> d!66385 (validMask!0 mask!3809)))

(assert (=> d!66385 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144172 k0!2524 (array!14724 (store (arr!6987 a!3312) i!1256 k0!2524) (size!7339 a!3312)) mask!3809) lt!144249)))

(declare-fun b!291563 () Bool)

(declare-fun e!184492 () SeekEntryResult!2136)

(assert (=> b!291563 (= e!184495 e!184492)))

(declare-fun c!46937 () Bool)

(assert (=> b!291563 (= c!46937 (or (= lt!144250 k0!2524) (= (bvadd lt!144250 lt!144250) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!291564 () Bool)

(assert (=> b!291564 (= e!184492 (Intermediate!2136 false lt!144172 #b00000000000000000000000000000000))))

(declare-fun b!291565 () Bool)

(assert (=> b!291565 (and (bvsge (index!10716 lt!144249) #b00000000000000000000000000000000) (bvslt (index!10716 lt!144249) (size!7339 (array!14724 (store (arr!6987 a!3312) i!1256 k0!2524) (size!7339 a!3312)))))))

(declare-fun res!152820 () Bool)

(assert (=> b!291565 (= res!152820 (= (select (arr!6987 (array!14724 (store (arr!6987 a!3312) i!1256 k0!2524) (size!7339 a!3312))) (index!10716 lt!144249)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!184493 () Bool)

(assert (=> b!291565 (=> res!152820 e!184493)))

(declare-fun b!291566 () Bool)

(declare-fun e!184494 () Bool)

(assert (=> b!291566 (= e!184496 e!184494)))

(declare-fun res!152819 () Bool)

(assert (=> b!291566 (= res!152819 (and ((_ is Intermediate!2136) lt!144249) (not (undefined!2948 lt!144249)) (bvslt (x!28899 lt!144249) #b01111111111111111111111111111110) (bvsge (x!28899 lt!144249) #b00000000000000000000000000000000) (bvsge (x!28899 lt!144249) #b00000000000000000000000000000000)))))

(assert (=> b!291566 (=> (not res!152819) (not e!184494))))

(declare-fun b!291567 () Bool)

(assert (=> b!291567 (and (bvsge (index!10716 lt!144249) #b00000000000000000000000000000000) (bvslt (index!10716 lt!144249) (size!7339 (array!14724 (store (arr!6987 a!3312) i!1256 k0!2524) (size!7339 a!3312)))))))

(declare-fun res!152821 () Bool)

(assert (=> b!291567 (= res!152821 (= (select (arr!6987 (array!14724 (store (arr!6987 a!3312) i!1256 k0!2524) (size!7339 a!3312))) (index!10716 lt!144249)) k0!2524))))

(assert (=> b!291567 (=> res!152821 e!184493)))

(assert (=> b!291567 (= e!184494 e!184493)))

(declare-fun b!291568 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291568 (= e!184492 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!144172 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!14724 (store (arr!6987 a!3312) i!1256 k0!2524) (size!7339 a!3312)) mask!3809))))

(declare-fun b!291569 () Bool)

(assert (=> b!291569 (= e!184495 (Intermediate!2136 true lt!144172 #b00000000000000000000000000000000))))

(declare-fun b!291570 () Bool)

(assert (=> b!291570 (and (bvsge (index!10716 lt!144249) #b00000000000000000000000000000000) (bvslt (index!10716 lt!144249) (size!7339 (array!14724 (store (arr!6987 a!3312) i!1256 k0!2524) (size!7339 a!3312)))))))

(assert (=> b!291570 (= e!184493 (= (select (arr!6987 (array!14724 (store (arr!6987 a!3312) i!1256 k0!2524) (size!7339 a!3312))) (index!10716 lt!144249)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!291571 () Bool)

(assert (=> b!291571 (= e!184496 (bvsge (x!28899 lt!144249) #b01111111111111111111111111111110))))

(assert (= (and d!66385 c!46935) b!291569))

(assert (= (and d!66385 (not c!46935)) b!291563))

(assert (= (and b!291563 c!46937) b!291564))

(assert (= (and b!291563 (not c!46937)) b!291568))

(assert (= (and d!66385 c!46936) b!291571))

(assert (= (and d!66385 (not c!46936)) b!291566))

(assert (= (and b!291566 res!152819) b!291567))

(assert (= (and b!291567 (not res!152821)) b!291565))

(assert (= (and b!291565 (not res!152820)) b!291570))

(declare-fun m!305459 () Bool)

(assert (=> b!291568 m!305459))

(assert (=> b!291568 m!305459))

(declare-fun m!305465 () Bool)

(assert (=> b!291568 m!305465))

(declare-fun m!305467 () Bool)

(assert (=> d!66385 m!305467))

(assert (=> d!66385 m!305353))

(declare-fun m!305473 () Bool)

(assert (=> b!291567 m!305473))

(assert (=> b!291565 m!305473))

(assert (=> b!291570 m!305473))

(assert (=> b!291409 d!66385))

(declare-fun d!66399 () Bool)

(declare-fun e!184504 () Bool)

(assert (=> d!66399 e!184504))

(declare-fun c!46940 () Bool)

(declare-fun lt!144254 () SeekEntryResult!2136)

(assert (=> d!66399 (= c!46940 (and ((_ is Intermediate!2136) lt!144254) (undefined!2948 lt!144254)))))

(declare-fun e!184503 () SeekEntryResult!2136)

(assert (=> d!66399 (= lt!144254 e!184503)))

(declare-fun c!46939 () Bool)

(assert (=> d!66399 (= c!46939 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!144255 () (_ BitVec 64))

(assert (=> d!66399 (= lt!144255 (select (arr!6987 a!3312) lt!144172))))

(assert (=> d!66399 (validMask!0 mask!3809)))

(assert (=> d!66399 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144172 k0!2524 a!3312 mask!3809) lt!144254)))

(declare-fun b!291576 () Bool)

(declare-fun e!184500 () SeekEntryResult!2136)

(assert (=> b!291576 (= e!184503 e!184500)))

(declare-fun c!46941 () Bool)

(assert (=> b!291576 (= c!46941 (or (= lt!144255 k0!2524) (= (bvadd lt!144255 lt!144255) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!291577 () Bool)

(assert (=> b!291577 (= e!184500 (Intermediate!2136 false lt!144172 #b00000000000000000000000000000000))))

(declare-fun b!291578 () Bool)

(assert (=> b!291578 (and (bvsge (index!10716 lt!144254) #b00000000000000000000000000000000) (bvslt (index!10716 lt!144254) (size!7339 a!3312)))))

(declare-fun res!152825 () Bool)

(assert (=> b!291578 (= res!152825 (= (select (arr!6987 a!3312) (index!10716 lt!144254)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!184501 () Bool)

(assert (=> b!291578 (=> res!152825 e!184501)))

(declare-fun b!291579 () Bool)

(declare-fun e!184502 () Bool)

(assert (=> b!291579 (= e!184504 e!184502)))

(declare-fun res!152824 () Bool)

(assert (=> b!291579 (= res!152824 (and ((_ is Intermediate!2136) lt!144254) (not (undefined!2948 lt!144254)) (bvslt (x!28899 lt!144254) #b01111111111111111111111111111110) (bvsge (x!28899 lt!144254) #b00000000000000000000000000000000) (bvsge (x!28899 lt!144254) #b00000000000000000000000000000000)))))

(assert (=> b!291579 (=> (not res!152824) (not e!184502))))

(declare-fun b!291580 () Bool)

(assert (=> b!291580 (and (bvsge (index!10716 lt!144254) #b00000000000000000000000000000000) (bvslt (index!10716 lt!144254) (size!7339 a!3312)))))

(declare-fun res!152826 () Bool)

(assert (=> b!291580 (= res!152826 (= (select (arr!6987 a!3312) (index!10716 lt!144254)) k0!2524))))

(assert (=> b!291580 (=> res!152826 e!184501)))

(assert (=> b!291580 (= e!184502 e!184501)))

(declare-fun b!291581 () Bool)

(assert (=> b!291581 (= e!184500 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!144172 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!291582 () Bool)

(assert (=> b!291582 (= e!184503 (Intermediate!2136 true lt!144172 #b00000000000000000000000000000000))))

(declare-fun b!291583 () Bool)

(assert (=> b!291583 (and (bvsge (index!10716 lt!144254) #b00000000000000000000000000000000) (bvslt (index!10716 lt!144254) (size!7339 a!3312)))))

(assert (=> b!291583 (= e!184501 (= (select (arr!6987 a!3312) (index!10716 lt!144254)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!291584 () Bool)

(assert (=> b!291584 (= e!184504 (bvsge (x!28899 lt!144254) #b01111111111111111111111111111110))))

(assert (= (and d!66399 c!46939) b!291582))

(assert (= (and d!66399 (not c!46939)) b!291576))

(assert (= (and b!291576 c!46941) b!291577))

(assert (= (and b!291576 (not c!46941)) b!291581))

(assert (= (and d!66399 c!46940) b!291584))

(assert (= (and d!66399 (not c!46940)) b!291579))

(assert (= (and b!291579 res!152824) b!291580))

(assert (= (and b!291580 (not res!152826)) b!291578))

(assert (= (and b!291578 (not res!152825)) b!291583))

(assert (=> b!291581 m!305459))

(assert (=> b!291581 m!305459))

(declare-fun m!305477 () Bool)

(assert (=> b!291581 m!305477))

(declare-fun m!305479 () Bool)

(assert (=> d!66399 m!305479))

(assert (=> d!66399 m!305353))

(declare-fun m!305481 () Bool)

(assert (=> b!291580 m!305481))

(assert (=> b!291578 m!305481))

(assert (=> b!291583 m!305481))

(assert (=> b!291409 d!66399))

(declare-fun d!66403 () Bool)

(declare-fun lt!144265 () (_ BitVec 32))

(declare-fun lt!144264 () (_ BitVec 32))

(assert (=> d!66403 (= lt!144265 (bvmul (bvxor lt!144264 (bvlshr lt!144264 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66403 (= lt!144264 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66403 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!152827 (let ((h!5262 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28902 (bvmul (bvxor h!5262 (bvlshr h!5262 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28902 (bvlshr x!28902 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!152827 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!152827 #b00000000000000000000000000000000))))))

(assert (=> d!66403 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!144265 (bvlshr lt!144265 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!291409 d!66403))

(check-sat (not b!291480) (not b!291449) (not b!291581) (not d!66365) (not d!66385) (not bm!25642) (not b!291568) (not b!291452) (not d!66399) (not b!291518))
(check-sat)
