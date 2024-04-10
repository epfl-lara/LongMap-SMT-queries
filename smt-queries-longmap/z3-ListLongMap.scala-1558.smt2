; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29526 () Bool)

(assert start!29526)

(declare-fun res!157407 () Bool)

(declare-fun e!188535 () Bool)

(assert (=> start!29526 (=> (not res!157407) (not e!188535))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29526 (= res!157407 (validMask!0 mask!3809))))

(assert (=> start!29526 e!188535))

(assert (=> start!29526 true))

(declare-datatypes ((array!15098 0))(
  ( (array!15099 (arr!7152 (Array (_ BitVec 32) (_ BitVec 64))) (size!7504 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15098)

(declare-fun array_inv!5115 (array!15098) Bool)

(assert (=> start!29526 (array_inv!5115 a!3312)))

(declare-fun b!298425 () Bool)

(declare-fun res!157403 () Bool)

(assert (=> b!298425 (=> (not res!157403) (not e!188535))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!298425 (= res!157403 (and (= (size!7504 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7504 a!3312))))))

(declare-fun b!298426 () Bool)

(declare-fun res!157405 () Bool)

(assert (=> b!298426 (=> (not res!157405) (not e!188535))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15098 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!298426 (= res!157405 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!298427 () Bool)

(declare-fun res!157402 () Bool)

(assert (=> b!298427 (=> (not res!157402) (not e!188535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!298427 (= res!157402 (validKeyInArray!0 k0!2524))))

(declare-datatypes ((SeekEntryResult!2301 0))(
  ( (MissingZero!2301 (index!11377 (_ BitVec 32))) (Found!2301 (index!11378 (_ BitVec 32))) (Intermediate!2301 (undefined!3113 Bool) (index!11379 (_ BitVec 32)) (x!29602 (_ BitVec 32))) (Undefined!2301) (MissingVacant!2301 (index!11380 (_ BitVec 32))) )
))
(declare-fun lt!148373 () SeekEntryResult!2301)

(declare-fun lt!148370 () Bool)

(declare-fun b!298428 () Bool)

(declare-fun lt!148371 () SeekEntryResult!2301)

(declare-fun e!188534 () Bool)

(get-info :version)

(assert (=> b!298428 (= e!188534 (and (not lt!148370) (= lt!148373 (MissingVacant!2301 i!1256)) (let ((bdg!6419 (not ((_ is Intermediate!2301) lt!148371)))) (and (or bdg!6419 (not (undefined!3113 lt!148371))) (not bdg!6419) (or (bvslt (index!11379 lt!148371) #b00000000000000000000000000000000) (bvsge (index!11379 lt!148371) (size!7504 a!3312)))))))))

(declare-fun lt!148372 () SeekEntryResult!2301)

(declare-fun lt!148374 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15098 (_ BitVec 32)) SeekEntryResult!2301)

(assert (=> b!298428 (= lt!148372 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148374 k0!2524 (array!15099 (store (arr!7152 a!3312) i!1256 k0!2524) (size!7504 a!3312)) mask!3809))))

(assert (=> b!298428 (= lt!148371 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148374 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298428 (= lt!148374 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!298429 () Bool)

(assert (=> b!298429 (= e!188535 e!188534)))

(declare-fun res!157404 () Bool)

(assert (=> b!298429 (=> (not res!157404) (not e!188534))))

(assert (=> b!298429 (= res!157404 (or lt!148370 (= lt!148373 (MissingVacant!2301 i!1256))))))

(assert (=> b!298429 (= lt!148370 (= lt!148373 (MissingZero!2301 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15098 (_ BitVec 32)) SeekEntryResult!2301)

(assert (=> b!298429 (= lt!148373 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!298430 () Bool)

(declare-fun res!157406 () Bool)

(assert (=> b!298430 (=> (not res!157406) (not e!188534))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15098 (_ BitVec 32)) Bool)

(assert (=> b!298430 (= res!157406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29526 res!157407) b!298425))

(assert (= (and b!298425 res!157403) b!298427))

(assert (= (and b!298427 res!157402) b!298426))

(assert (= (and b!298426 res!157405) b!298429))

(assert (= (and b!298429 res!157404) b!298430))

(assert (= (and b!298430 res!157406) b!298428))

(declare-fun m!310949 () Bool)

(assert (=> b!298426 m!310949))

(declare-fun m!310951 () Bool)

(assert (=> b!298428 m!310951))

(declare-fun m!310953 () Bool)

(assert (=> b!298428 m!310953))

(declare-fun m!310955 () Bool)

(assert (=> b!298428 m!310955))

(declare-fun m!310957 () Bool)

(assert (=> b!298428 m!310957))

(declare-fun m!310959 () Bool)

(assert (=> b!298430 m!310959))

(declare-fun m!310961 () Bool)

(assert (=> start!29526 m!310961))

(declare-fun m!310963 () Bool)

(assert (=> start!29526 m!310963))

(declare-fun m!310965 () Bool)

(assert (=> b!298429 m!310965))

(declare-fun m!310967 () Bool)

(assert (=> b!298427 m!310967))

(check-sat (not start!29526) (not b!298429) (not b!298426) (not b!298430) (not b!298428) (not b!298427))
(check-sat)
(get-model)

(declare-fun b!298457 () Bool)

(declare-fun e!188553 () Bool)

(declare-fun e!188554 () Bool)

(assert (=> b!298457 (= e!188553 e!188554)))

(declare-fun c!48099 () Bool)

(assert (=> b!298457 (= c!48099 (validKeyInArray!0 (select (arr!7152 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!67351 () Bool)

(declare-fun res!157431 () Bool)

(assert (=> d!67351 (=> res!157431 e!188553)))

(assert (=> d!67351 (= res!157431 (bvsge #b00000000000000000000000000000000 (size!7504 a!3312)))))

(assert (=> d!67351 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!188553)))

(declare-fun bm!25780 () Bool)

(declare-fun call!25783 () Bool)

(assert (=> bm!25780 (= call!25783 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!298458 () Bool)

(declare-fun e!188552 () Bool)

(assert (=> b!298458 (= e!188554 e!188552)))

(declare-fun lt!148396 () (_ BitVec 64))

(assert (=> b!298458 (= lt!148396 (select (arr!7152 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9311 0))(
  ( (Unit!9312) )
))
(declare-fun lt!148397 () Unit!9311)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15098 (_ BitVec 64) (_ BitVec 32)) Unit!9311)

(assert (=> b!298458 (= lt!148397 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!148396 #b00000000000000000000000000000000))))

(assert (=> b!298458 (arrayContainsKey!0 a!3312 lt!148396 #b00000000000000000000000000000000)))

(declare-fun lt!148398 () Unit!9311)

(assert (=> b!298458 (= lt!148398 lt!148397)))

(declare-fun res!157430 () Bool)

(assert (=> b!298458 (= res!157430 (= (seekEntryOrOpen!0 (select (arr!7152 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2301 #b00000000000000000000000000000000)))))

(assert (=> b!298458 (=> (not res!157430) (not e!188552))))

(declare-fun b!298459 () Bool)

(assert (=> b!298459 (= e!188554 call!25783)))

(declare-fun b!298460 () Bool)

(assert (=> b!298460 (= e!188552 call!25783)))

(assert (= (and d!67351 (not res!157431)) b!298457))

(assert (= (and b!298457 c!48099) b!298458))

(assert (= (and b!298457 (not c!48099)) b!298459))

(assert (= (and b!298458 res!157430) b!298460))

(assert (= (or b!298460 b!298459) bm!25780))

(declare-fun m!310989 () Bool)

(assert (=> b!298457 m!310989))

(assert (=> b!298457 m!310989))

(declare-fun m!310991 () Bool)

(assert (=> b!298457 m!310991))

(declare-fun m!310993 () Bool)

(assert (=> bm!25780 m!310993))

(assert (=> b!298458 m!310989))

(declare-fun m!310995 () Bool)

(assert (=> b!298458 m!310995))

(declare-fun m!310997 () Bool)

(assert (=> b!298458 m!310997))

(assert (=> b!298458 m!310989))

(declare-fun m!310999 () Bool)

(assert (=> b!298458 m!310999))

(assert (=> b!298430 d!67351))

(declare-fun d!67353 () Bool)

(declare-fun res!157436 () Bool)

(declare-fun e!188559 () Bool)

(assert (=> d!67353 (=> res!157436 e!188559)))

(assert (=> d!67353 (= res!157436 (= (select (arr!7152 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67353 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!188559)))

(declare-fun b!298465 () Bool)

(declare-fun e!188560 () Bool)

(assert (=> b!298465 (= e!188559 e!188560)))

(declare-fun res!157437 () Bool)

(assert (=> b!298465 (=> (not res!157437) (not e!188560))))

(assert (=> b!298465 (= res!157437 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7504 a!3312)))))

(declare-fun b!298466 () Bool)

(assert (=> b!298466 (= e!188560 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67353 (not res!157436)) b!298465))

(assert (= (and b!298465 res!157437) b!298466))

(assert (=> d!67353 m!310989))

(declare-fun m!311001 () Bool)

(assert (=> b!298466 m!311001))

(assert (=> b!298426 d!67353))

(declare-fun d!67355 () Bool)

(assert (=> d!67355 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!298427 d!67355))

(declare-fun b!298505 () Bool)

(declare-fun e!188587 () SeekEntryResult!2301)

(declare-fun e!188586 () SeekEntryResult!2301)

(assert (=> b!298505 (= e!188587 e!188586)))

(declare-fun c!48113 () Bool)

(declare-fun lt!148416 () (_ BitVec 64))

(assert (=> b!298505 (= c!48113 (or (= lt!148416 k0!2524) (= (bvadd lt!148416 lt!148416) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!298506 () Bool)

(declare-fun lt!148417 () SeekEntryResult!2301)

(assert (=> b!298506 (and (bvsge (index!11379 lt!148417) #b00000000000000000000000000000000) (bvslt (index!11379 lt!148417) (size!7504 (array!15099 (store (arr!7152 a!3312) i!1256 k0!2524) (size!7504 a!3312)))))))

(declare-fun e!188588 () Bool)

(assert (=> b!298506 (= e!188588 (= (select (arr!7152 (array!15099 (store (arr!7152 a!3312) i!1256 k0!2524) (size!7504 a!3312))) (index!11379 lt!148417)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298507 () Bool)

(assert (=> b!298507 (= e!188587 (Intermediate!2301 true lt!148374 #b00000000000000000000000000000000))))

(declare-fun b!298508 () Bool)

(declare-fun e!188585 () Bool)

(assert (=> b!298508 (= e!188585 (bvsge (x!29602 lt!148417) #b01111111111111111111111111111110))))

(declare-fun b!298509 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!298509 (= e!188586 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148374 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!15099 (store (arr!7152 a!3312) i!1256 k0!2524) (size!7504 a!3312)) mask!3809))))

(declare-fun b!298510 () Bool)

(assert (=> b!298510 (and (bvsge (index!11379 lt!148417) #b00000000000000000000000000000000) (bvslt (index!11379 lt!148417) (size!7504 (array!15099 (store (arr!7152 a!3312) i!1256 k0!2524) (size!7504 a!3312)))))))

(declare-fun res!157451 () Bool)

(assert (=> b!298510 (= res!157451 (= (select (arr!7152 (array!15099 (store (arr!7152 a!3312) i!1256 k0!2524) (size!7504 a!3312))) (index!11379 lt!148417)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298510 (=> res!157451 e!188588)))

(declare-fun b!298511 () Bool)

(declare-fun e!188584 () Bool)

(assert (=> b!298511 (= e!188585 e!188584)))

(declare-fun res!157452 () Bool)

(assert (=> b!298511 (= res!157452 (and ((_ is Intermediate!2301) lt!148417) (not (undefined!3113 lt!148417)) (bvslt (x!29602 lt!148417) #b01111111111111111111111111111110) (bvsge (x!29602 lt!148417) #b00000000000000000000000000000000) (bvsge (x!29602 lt!148417) #b00000000000000000000000000000000)))))

(assert (=> b!298511 (=> (not res!157452) (not e!188584))))

(declare-fun d!67357 () Bool)

(assert (=> d!67357 e!188585))

(declare-fun c!48115 () Bool)

(assert (=> d!67357 (= c!48115 (and ((_ is Intermediate!2301) lt!148417) (undefined!3113 lt!148417)))))

(assert (=> d!67357 (= lt!148417 e!188587)))

(declare-fun c!48114 () Bool)

(assert (=> d!67357 (= c!48114 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67357 (= lt!148416 (select (arr!7152 (array!15099 (store (arr!7152 a!3312) i!1256 k0!2524) (size!7504 a!3312))) lt!148374))))

(assert (=> d!67357 (validMask!0 mask!3809)))

(assert (=> d!67357 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148374 k0!2524 (array!15099 (store (arr!7152 a!3312) i!1256 k0!2524) (size!7504 a!3312)) mask!3809) lt!148417)))

(declare-fun b!298512 () Bool)

(assert (=> b!298512 (= e!188586 (Intermediate!2301 false lt!148374 #b00000000000000000000000000000000))))

(declare-fun b!298513 () Bool)

(assert (=> b!298513 (and (bvsge (index!11379 lt!148417) #b00000000000000000000000000000000) (bvslt (index!11379 lt!148417) (size!7504 (array!15099 (store (arr!7152 a!3312) i!1256 k0!2524) (size!7504 a!3312)))))))

(declare-fun res!157450 () Bool)

(assert (=> b!298513 (= res!157450 (= (select (arr!7152 (array!15099 (store (arr!7152 a!3312) i!1256 k0!2524) (size!7504 a!3312))) (index!11379 lt!148417)) k0!2524))))

(assert (=> b!298513 (=> res!157450 e!188588)))

(assert (=> b!298513 (= e!188584 e!188588)))

(assert (= (and d!67357 c!48114) b!298507))

(assert (= (and d!67357 (not c!48114)) b!298505))

(assert (= (and b!298505 c!48113) b!298512))

(assert (= (and b!298505 (not c!48113)) b!298509))

(assert (= (and d!67357 c!48115) b!298508))

(assert (= (and d!67357 (not c!48115)) b!298511))

(assert (= (and b!298511 res!157452) b!298513))

(assert (= (and b!298513 (not res!157450)) b!298510))

(assert (= (and b!298510 (not res!157451)) b!298506))

(declare-fun m!311015 () Bool)

(assert (=> b!298506 m!311015))

(declare-fun m!311017 () Bool)

(assert (=> d!67357 m!311017))

(assert (=> d!67357 m!310961))

(declare-fun m!311019 () Bool)

(assert (=> b!298509 m!311019))

(assert (=> b!298509 m!311019))

(declare-fun m!311021 () Bool)

(assert (=> b!298509 m!311021))

(assert (=> b!298510 m!311015))

(assert (=> b!298513 m!311015))

(assert (=> b!298428 d!67357))

(declare-fun b!298522 () Bool)

(declare-fun e!188598 () SeekEntryResult!2301)

(declare-fun e!188597 () SeekEntryResult!2301)

(assert (=> b!298522 (= e!188598 e!188597)))

(declare-fun c!48118 () Bool)

(declare-fun lt!148418 () (_ BitVec 64))

(assert (=> b!298522 (= c!48118 (or (= lt!148418 k0!2524) (= (bvadd lt!148418 lt!148418) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!298523 () Bool)

(declare-fun lt!148419 () SeekEntryResult!2301)

(assert (=> b!298523 (and (bvsge (index!11379 lt!148419) #b00000000000000000000000000000000) (bvslt (index!11379 lt!148419) (size!7504 a!3312)))))

(declare-fun e!188599 () Bool)

(assert (=> b!298523 (= e!188599 (= (select (arr!7152 a!3312) (index!11379 lt!148419)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!298524 () Bool)

(assert (=> b!298524 (= e!188598 (Intermediate!2301 true lt!148374 #b00000000000000000000000000000000))))

(declare-fun b!298525 () Bool)

(declare-fun e!188596 () Bool)

(assert (=> b!298525 (= e!188596 (bvsge (x!29602 lt!148419) #b01111111111111111111111111111110))))

(declare-fun b!298526 () Bool)

(assert (=> b!298526 (= e!188597 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!148374 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!298527 () Bool)

(assert (=> b!298527 (and (bvsge (index!11379 lt!148419) #b00000000000000000000000000000000) (bvslt (index!11379 lt!148419) (size!7504 a!3312)))))

(declare-fun res!157460 () Bool)

(assert (=> b!298527 (= res!157460 (= (select (arr!7152 a!3312) (index!11379 lt!148419)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!298527 (=> res!157460 e!188599)))

(declare-fun b!298528 () Bool)

(declare-fun e!188595 () Bool)

(assert (=> b!298528 (= e!188596 e!188595)))

(declare-fun res!157461 () Bool)

(assert (=> b!298528 (= res!157461 (and ((_ is Intermediate!2301) lt!148419) (not (undefined!3113 lt!148419)) (bvslt (x!29602 lt!148419) #b01111111111111111111111111111110) (bvsge (x!29602 lt!148419) #b00000000000000000000000000000000) (bvsge (x!29602 lt!148419) #b00000000000000000000000000000000)))))

(assert (=> b!298528 (=> (not res!157461) (not e!188595))))

(declare-fun d!67365 () Bool)

(assert (=> d!67365 e!188596))

(declare-fun c!48120 () Bool)

(assert (=> d!67365 (= c!48120 (and ((_ is Intermediate!2301) lt!148419) (undefined!3113 lt!148419)))))

(assert (=> d!67365 (= lt!148419 e!188598)))

(declare-fun c!48119 () Bool)

(assert (=> d!67365 (= c!48119 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67365 (= lt!148418 (select (arr!7152 a!3312) lt!148374))))

(assert (=> d!67365 (validMask!0 mask!3809)))

(assert (=> d!67365 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!148374 k0!2524 a!3312 mask!3809) lt!148419)))

(declare-fun b!298529 () Bool)

(assert (=> b!298529 (= e!188597 (Intermediate!2301 false lt!148374 #b00000000000000000000000000000000))))

(declare-fun b!298530 () Bool)

(assert (=> b!298530 (and (bvsge (index!11379 lt!148419) #b00000000000000000000000000000000) (bvslt (index!11379 lt!148419) (size!7504 a!3312)))))

(declare-fun res!157457 () Bool)

(assert (=> b!298530 (= res!157457 (= (select (arr!7152 a!3312) (index!11379 lt!148419)) k0!2524))))

(assert (=> b!298530 (=> res!157457 e!188599)))

(assert (=> b!298530 (= e!188595 e!188599)))

(assert (= (and d!67365 c!48119) b!298524))

(assert (= (and d!67365 (not c!48119)) b!298522))

(assert (= (and b!298522 c!48118) b!298529))

(assert (= (and b!298522 (not c!48118)) b!298526))

(assert (= (and d!67365 c!48120) b!298525))

(assert (= (and d!67365 (not c!48120)) b!298528))

(assert (= (and b!298528 res!157461) b!298530))

(assert (= (and b!298530 (not res!157457)) b!298527))

(assert (= (and b!298527 (not res!157460)) b!298523))

(declare-fun m!311023 () Bool)

(assert (=> b!298523 m!311023))

(declare-fun m!311025 () Bool)

(assert (=> d!67365 m!311025))

(assert (=> d!67365 m!310961))

(assert (=> b!298526 m!311019))

(assert (=> b!298526 m!311019))

(declare-fun m!311027 () Bool)

(assert (=> b!298526 m!311027))

(assert (=> b!298527 m!311023))

(assert (=> b!298530 m!311023))

(assert (=> b!298428 d!67365))

(declare-fun d!67367 () Bool)

(declare-fun lt!148429 () (_ BitVec 32))

(declare-fun lt!148428 () (_ BitVec 32))

(assert (=> d!67367 (= lt!148429 (bvmul (bvxor lt!148428 (bvlshr lt!148428 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67367 (= lt!148428 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67367 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!157462 (let ((h!5307 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29606 (bvmul (bvxor h!5307 (bvlshr h!5307 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29606 (bvlshr x!29606 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!157462 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!157462 #b00000000000000000000000000000000))))))

(assert (=> d!67367 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!148429 (bvlshr lt!148429 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!298428 d!67367))

(declare-fun lt!148448 () SeekEntryResult!2301)

(declare-fun e!188633 () SeekEntryResult!2301)

(declare-fun b!298587 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15098 (_ BitVec 32)) SeekEntryResult!2301)

(assert (=> b!298587 (= e!188633 (seekKeyOrZeroReturnVacant!0 (x!29602 lt!148448) (index!11379 lt!148448) (index!11379 lt!148448) k0!2524 a!3312 mask!3809))))

(declare-fun b!298588 () Bool)

(declare-fun c!48139 () Bool)

(declare-fun lt!148447 () (_ BitVec 64))

(assert (=> b!298588 (= c!48139 (= lt!148447 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!188634 () SeekEntryResult!2301)

(assert (=> b!298588 (= e!188634 e!188633)))

(declare-fun b!298589 () Bool)

(declare-fun e!188632 () SeekEntryResult!2301)

(assert (=> b!298589 (= e!188632 Undefined!2301)))

(declare-fun b!298590 () Bool)

(assert (=> b!298590 (= e!188633 (MissingZero!2301 (index!11379 lt!148448)))))

(declare-fun b!298591 () Bool)

(assert (=> b!298591 (= e!188634 (Found!2301 (index!11379 lt!148448)))))

(declare-fun d!67375 () Bool)

(declare-fun lt!148446 () SeekEntryResult!2301)

(assert (=> d!67375 (and (or ((_ is Undefined!2301) lt!148446) (not ((_ is Found!2301) lt!148446)) (and (bvsge (index!11378 lt!148446) #b00000000000000000000000000000000) (bvslt (index!11378 lt!148446) (size!7504 a!3312)))) (or ((_ is Undefined!2301) lt!148446) ((_ is Found!2301) lt!148446) (not ((_ is MissingZero!2301) lt!148446)) (and (bvsge (index!11377 lt!148446) #b00000000000000000000000000000000) (bvslt (index!11377 lt!148446) (size!7504 a!3312)))) (or ((_ is Undefined!2301) lt!148446) ((_ is Found!2301) lt!148446) ((_ is MissingZero!2301) lt!148446) (not ((_ is MissingVacant!2301) lt!148446)) (and (bvsge (index!11380 lt!148446) #b00000000000000000000000000000000) (bvslt (index!11380 lt!148446) (size!7504 a!3312)))) (or ((_ is Undefined!2301) lt!148446) (ite ((_ is Found!2301) lt!148446) (= (select (arr!7152 a!3312) (index!11378 lt!148446)) k0!2524) (ite ((_ is MissingZero!2301) lt!148446) (= (select (arr!7152 a!3312) (index!11377 lt!148446)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2301) lt!148446) (= (select (arr!7152 a!3312) (index!11380 lt!148446)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67375 (= lt!148446 e!188632)))

(declare-fun c!48141 () Bool)

(assert (=> d!67375 (= c!48141 (and ((_ is Intermediate!2301) lt!148448) (undefined!3113 lt!148448)))))

(assert (=> d!67375 (= lt!148448 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67375 (validMask!0 mask!3809)))

(assert (=> d!67375 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!148446)))

(declare-fun b!298592 () Bool)

(assert (=> b!298592 (= e!188632 e!188634)))

(assert (=> b!298592 (= lt!148447 (select (arr!7152 a!3312) (index!11379 lt!148448)))))

(declare-fun c!48140 () Bool)

(assert (=> b!298592 (= c!48140 (= lt!148447 k0!2524))))

(assert (= (and d!67375 c!48141) b!298589))

(assert (= (and d!67375 (not c!48141)) b!298592))

(assert (= (and b!298592 c!48140) b!298591))

(assert (= (and b!298592 (not c!48140)) b!298588))

(assert (= (and b!298588 c!48139) b!298590))

(assert (= (and b!298588 (not c!48139)) b!298587))

(declare-fun m!311047 () Bool)

(assert (=> b!298587 m!311047))

(declare-fun m!311049 () Bool)

(assert (=> d!67375 m!311049))

(assert (=> d!67375 m!310957))

(declare-fun m!311051 () Bool)

(assert (=> d!67375 m!311051))

(declare-fun m!311053 () Bool)

(assert (=> d!67375 m!311053))

(assert (=> d!67375 m!310961))

(assert (=> d!67375 m!310957))

(declare-fun m!311055 () Bool)

(assert (=> d!67375 m!311055))

(declare-fun m!311057 () Bool)

(assert (=> b!298592 m!311057))

(assert (=> b!298429 d!67375))

(declare-fun d!67387 () Bool)

(assert (=> d!67387 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29526 d!67387))

(declare-fun d!67397 () Bool)

(assert (=> d!67397 (= (array_inv!5115 a!3312) (bvsge (size!7504 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29526 d!67397))

(check-sat (not b!298526) (not b!298587) (not b!298466) (not bm!25780) (not b!298509) (not b!298458) (not d!67365) (not b!298457) (not d!67375) (not d!67357))
(check-sat)
