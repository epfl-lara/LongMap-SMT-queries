; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29884 () Bool)

(assert start!29884)

(declare-fun res!158389 () Bool)

(declare-fun e!189639 () Bool)

(assert (=> start!29884 (=> (not res!158389) (not e!189639))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29884 (= res!158389 (validMask!0 mask!3809))))

(assert (=> start!29884 e!189639))

(assert (=> start!29884 true))

(declare-datatypes ((array!15169 0))(
  ( (array!15170 (arr!7179 (Array (_ BitVec 32) (_ BitVec 64))) (size!7532 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15169)

(declare-fun array_inv!5151 (array!15169) Bool)

(assert (=> start!29884 (array_inv!5151 a!3312)))

(declare-fun b!300352 () Bool)

(declare-datatypes ((SeekEntryResult!2327 0))(
  ( (MissingZero!2327 (index!11484 (_ BitVec 32))) (Found!2327 (index!11485 (_ BitVec 32))) (Intermediate!2327 (undefined!3139 Bool) (index!11486 (_ BitVec 32)) (x!29756 (_ BitVec 32))) (Undefined!2327) (MissingVacant!2327 (index!11487 (_ BitVec 32))) )
))
(declare-fun lt!149330 () SeekEntryResult!2327)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun e!189640 () Bool)

(declare-fun lt!149326 () Bool)

(declare-fun lt!149328 () SeekEntryResult!2327)

(get-info :version)

(assert (=> b!300352 (= e!189640 (and (not lt!149326) (= lt!149328 (MissingVacant!2327 i!1256)) (not ((_ is Intermediate!2327) lt!149330))))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun lt!149327 () (_ BitVec 32))

(declare-fun lt!149329 () SeekEntryResult!2327)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15169 (_ BitVec 32)) SeekEntryResult!2327)

(assert (=> b!300352 (= lt!149329 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149327 k0!2524 (array!15170 (store (arr!7179 a!3312) i!1256 k0!2524) (size!7532 a!3312)) mask!3809))))

(assert (=> b!300352 (= lt!149330 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149327 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300352 (= lt!149327 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!300353 () Bool)

(declare-fun res!158394 () Bool)

(assert (=> b!300353 (=> (not res!158394) (not e!189640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15169 (_ BitVec 32)) Bool)

(assert (=> b!300353 (= res!158394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!300354 () Bool)

(assert (=> b!300354 (= e!189639 e!189640)))

(declare-fun res!158391 () Bool)

(assert (=> b!300354 (=> (not res!158391) (not e!189640))))

(assert (=> b!300354 (= res!158391 (or lt!149326 (= lt!149328 (MissingVacant!2327 i!1256))))))

(assert (=> b!300354 (= lt!149326 (= lt!149328 (MissingZero!2327 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15169 (_ BitVec 32)) SeekEntryResult!2327)

(assert (=> b!300354 (= lt!149328 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!300355 () Bool)

(declare-fun res!158390 () Bool)

(assert (=> b!300355 (=> (not res!158390) (not e!189639))))

(declare-fun arrayContainsKey!0 (array!15169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300355 (= res!158390 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!300356 () Bool)

(declare-fun res!158393 () Bool)

(assert (=> b!300356 (=> (not res!158393) (not e!189639))))

(assert (=> b!300356 (= res!158393 (and (= (size!7532 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7532 a!3312))))))

(declare-fun b!300357 () Bool)

(declare-fun res!158392 () Bool)

(assert (=> b!300357 (=> (not res!158392) (not e!189639))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300357 (= res!158392 (validKeyInArray!0 k0!2524))))

(assert (= (and start!29884 res!158389) b!300356))

(assert (= (and b!300356 res!158393) b!300357))

(assert (= (and b!300357 res!158392) b!300355))

(assert (= (and b!300355 res!158390) b!300354))

(assert (= (and b!300354 res!158391) b!300353))

(assert (= (and b!300353 res!158394) b!300352))

(declare-fun m!311869 () Bool)

(assert (=> b!300352 m!311869))

(declare-fun m!311871 () Bool)

(assert (=> b!300352 m!311871))

(declare-fun m!311873 () Bool)

(assert (=> b!300352 m!311873))

(declare-fun m!311875 () Bool)

(assert (=> b!300352 m!311875))

(declare-fun m!311877 () Bool)

(assert (=> b!300353 m!311877))

(declare-fun m!311879 () Bool)

(assert (=> b!300357 m!311879))

(declare-fun m!311881 () Bool)

(assert (=> b!300355 m!311881))

(declare-fun m!311883 () Bool)

(assert (=> b!300354 m!311883))

(declare-fun m!311885 () Bool)

(assert (=> start!29884 m!311885))

(declare-fun m!311887 () Bool)

(assert (=> start!29884 m!311887))

(check-sat (not b!300353) (not start!29884) (not b!300352) (not b!300354) (not b!300357) (not b!300355))
(check-sat)
(get-model)

(declare-fun d!67565 () Bool)

(assert (=> d!67565 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29884 d!67565))

(declare-fun d!67567 () Bool)

(assert (=> d!67567 (= (array_inv!5151 a!3312) (bvsge (size!7532 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29884 d!67567))

(declare-fun d!67569 () Bool)

(assert (=> d!67569 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!300357 d!67569))

(declare-fun lt!149366 () SeekEntryResult!2327)

(declare-fun b!300418 () Bool)

(assert (=> b!300418 (and (bvsge (index!11486 lt!149366) #b00000000000000000000000000000000) (bvslt (index!11486 lt!149366) (size!7532 (array!15170 (store (arr!7179 a!3312) i!1256 k0!2524) (size!7532 a!3312)))))))

(declare-fun e!189680 () Bool)

(assert (=> b!300418 (= e!189680 (= (select (arr!7179 (array!15170 (store (arr!7179 a!3312) i!1256 k0!2524) (size!7532 a!3312))) (index!11486 lt!149366)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!300419 () Bool)

(assert (=> b!300419 (and (bvsge (index!11486 lt!149366) #b00000000000000000000000000000000) (bvslt (index!11486 lt!149366) (size!7532 (array!15170 (store (arr!7179 a!3312) i!1256 k0!2524) (size!7532 a!3312)))))))

(declare-fun res!158444 () Bool)

(assert (=> b!300419 (= res!158444 (= (select (arr!7179 (array!15170 (store (arr!7179 a!3312) i!1256 k0!2524) (size!7532 a!3312))) (index!11486 lt!149366)) k0!2524))))

(assert (=> b!300419 (=> res!158444 e!189680)))

(declare-fun e!189678 () Bool)

(assert (=> b!300419 (= e!189678 e!189680)))

(declare-fun b!300420 () Bool)

(declare-fun e!189677 () SeekEntryResult!2327)

(assert (=> b!300420 (= e!189677 (Intermediate!2327 true lt!149327 #b00000000000000000000000000000000))))

(declare-fun b!300421 () Bool)

(declare-fun e!189676 () Bool)

(assert (=> b!300421 (= e!189676 e!189678)))

(declare-fun res!158445 () Bool)

(assert (=> b!300421 (= res!158445 (and ((_ is Intermediate!2327) lt!149366) (not (undefined!3139 lt!149366)) (bvslt (x!29756 lt!149366) #b01111111111111111111111111111110) (bvsge (x!29756 lt!149366) #b00000000000000000000000000000000) (bvsge (x!29756 lt!149366) #b00000000000000000000000000000000)))))

(assert (=> b!300421 (=> (not res!158445) (not e!189678))))

(declare-fun b!300422 () Bool)

(assert (=> b!300422 (and (bvsge (index!11486 lt!149366) #b00000000000000000000000000000000) (bvslt (index!11486 lt!149366) (size!7532 (array!15170 (store (arr!7179 a!3312) i!1256 k0!2524) (size!7532 a!3312)))))))

(declare-fun res!158443 () Bool)

(assert (=> b!300422 (= res!158443 (= (select (arr!7179 (array!15170 (store (arr!7179 a!3312) i!1256 k0!2524) (size!7532 a!3312))) (index!11486 lt!149366)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!300422 (=> res!158443 e!189680)))

(declare-fun d!67571 () Bool)

(assert (=> d!67571 e!189676))

(declare-fun c!48582 () Bool)

(assert (=> d!67571 (= c!48582 (and ((_ is Intermediate!2327) lt!149366) (undefined!3139 lt!149366)))))

(assert (=> d!67571 (= lt!149366 e!189677)))

(declare-fun c!48584 () Bool)

(assert (=> d!67571 (= c!48584 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!149365 () (_ BitVec 64))

(assert (=> d!67571 (= lt!149365 (select (arr!7179 (array!15170 (store (arr!7179 a!3312) i!1256 k0!2524) (size!7532 a!3312))) lt!149327))))

(assert (=> d!67571 (validMask!0 mask!3809)))

(assert (=> d!67571 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149327 k0!2524 (array!15170 (store (arr!7179 a!3312) i!1256 k0!2524) (size!7532 a!3312)) mask!3809) lt!149366)))

(declare-fun b!300423 () Bool)

(declare-fun e!189679 () SeekEntryResult!2327)

(assert (=> b!300423 (= e!189677 e!189679)))

(declare-fun c!48583 () Bool)

(assert (=> b!300423 (= c!48583 (or (= lt!149365 k0!2524) (= (bvadd lt!149365 lt!149365) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!300424 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300424 (= e!189679 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149327 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!15170 (store (arr!7179 a!3312) i!1256 k0!2524) (size!7532 a!3312)) mask!3809))))

(declare-fun b!300425 () Bool)

(assert (=> b!300425 (= e!189679 (Intermediate!2327 false lt!149327 #b00000000000000000000000000000000))))

(declare-fun b!300426 () Bool)

(assert (=> b!300426 (= e!189676 (bvsge (x!29756 lt!149366) #b01111111111111111111111111111110))))

(assert (= (and d!67571 c!48584) b!300420))

(assert (= (and d!67571 (not c!48584)) b!300423))

(assert (= (and b!300423 c!48583) b!300425))

(assert (= (and b!300423 (not c!48583)) b!300424))

(assert (= (and d!67571 c!48582) b!300426))

(assert (= (and d!67571 (not c!48582)) b!300421))

(assert (= (and b!300421 res!158445) b!300419))

(assert (= (and b!300419 (not res!158444)) b!300422))

(assert (= (and b!300422 (not res!158443)) b!300418))

(declare-fun m!311933 () Bool)

(assert (=> b!300424 m!311933))

(assert (=> b!300424 m!311933))

(declare-fun m!311935 () Bool)

(assert (=> b!300424 m!311935))

(declare-fun m!311937 () Bool)

(assert (=> d!67571 m!311937))

(assert (=> d!67571 m!311885))

(declare-fun m!311939 () Bool)

(assert (=> b!300419 m!311939))

(assert (=> b!300422 m!311939))

(assert (=> b!300418 m!311939))

(assert (=> b!300352 d!67571))

(declare-fun b!300427 () Bool)

(declare-fun lt!149368 () SeekEntryResult!2327)

(assert (=> b!300427 (and (bvsge (index!11486 lt!149368) #b00000000000000000000000000000000) (bvslt (index!11486 lt!149368) (size!7532 a!3312)))))

(declare-fun e!189685 () Bool)

(assert (=> b!300427 (= e!189685 (= (select (arr!7179 a!3312) (index!11486 lt!149368)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!300428 () Bool)

(assert (=> b!300428 (and (bvsge (index!11486 lt!149368) #b00000000000000000000000000000000) (bvslt (index!11486 lt!149368) (size!7532 a!3312)))))

(declare-fun res!158447 () Bool)

(assert (=> b!300428 (= res!158447 (= (select (arr!7179 a!3312) (index!11486 lt!149368)) k0!2524))))

(assert (=> b!300428 (=> res!158447 e!189685)))

(declare-fun e!189683 () Bool)

(assert (=> b!300428 (= e!189683 e!189685)))

(declare-fun b!300429 () Bool)

(declare-fun e!189682 () SeekEntryResult!2327)

(assert (=> b!300429 (= e!189682 (Intermediate!2327 true lt!149327 #b00000000000000000000000000000000))))

(declare-fun b!300430 () Bool)

(declare-fun e!189681 () Bool)

(assert (=> b!300430 (= e!189681 e!189683)))

(declare-fun res!158448 () Bool)

(assert (=> b!300430 (= res!158448 (and ((_ is Intermediate!2327) lt!149368) (not (undefined!3139 lt!149368)) (bvslt (x!29756 lt!149368) #b01111111111111111111111111111110) (bvsge (x!29756 lt!149368) #b00000000000000000000000000000000) (bvsge (x!29756 lt!149368) #b00000000000000000000000000000000)))))

(assert (=> b!300430 (=> (not res!158448) (not e!189683))))

(declare-fun b!300431 () Bool)

(assert (=> b!300431 (and (bvsge (index!11486 lt!149368) #b00000000000000000000000000000000) (bvslt (index!11486 lt!149368) (size!7532 a!3312)))))

(declare-fun res!158446 () Bool)

(assert (=> b!300431 (= res!158446 (= (select (arr!7179 a!3312) (index!11486 lt!149368)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!300431 (=> res!158446 e!189685)))

(declare-fun d!67585 () Bool)

(assert (=> d!67585 e!189681))

(declare-fun c!48585 () Bool)

(assert (=> d!67585 (= c!48585 (and ((_ is Intermediate!2327) lt!149368) (undefined!3139 lt!149368)))))

(assert (=> d!67585 (= lt!149368 e!189682)))

(declare-fun c!48587 () Bool)

(assert (=> d!67585 (= c!48587 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!149367 () (_ BitVec 64))

(assert (=> d!67585 (= lt!149367 (select (arr!7179 a!3312) lt!149327))))

(assert (=> d!67585 (validMask!0 mask!3809)))

(assert (=> d!67585 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149327 k0!2524 a!3312 mask!3809) lt!149368)))

(declare-fun b!300432 () Bool)

(declare-fun e!189684 () SeekEntryResult!2327)

(assert (=> b!300432 (= e!189682 e!189684)))

(declare-fun c!48586 () Bool)

(assert (=> b!300432 (= c!48586 (or (= lt!149367 k0!2524) (= (bvadd lt!149367 lt!149367) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!300433 () Bool)

(assert (=> b!300433 (= e!189684 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149327 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!300434 () Bool)

(assert (=> b!300434 (= e!189684 (Intermediate!2327 false lt!149327 #b00000000000000000000000000000000))))

(declare-fun b!300435 () Bool)

(assert (=> b!300435 (= e!189681 (bvsge (x!29756 lt!149368) #b01111111111111111111111111111110))))

(assert (= (and d!67585 c!48587) b!300429))

(assert (= (and d!67585 (not c!48587)) b!300432))

(assert (= (and b!300432 c!48586) b!300434))

(assert (= (and b!300432 (not c!48586)) b!300433))

(assert (= (and d!67585 c!48585) b!300435))

(assert (= (and d!67585 (not c!48585)) b!300430))

(assert (= (and b!300430 res!158448) b!300428))

(assert (= (and b!300428 (not res!158447)) b!300431))

(assert (= (and b!300431 (not res!158446)) b!300427))

(assert (=> b!300433 m!311933))

(assert (=> b!300433 m!311933))

(declare-fun m!311941 () Bool)

(assert (=> b!300433 m!311941))

(declare-fun m!311943 () Bool)

(assert (=> d!67585 m!311943))

(assert (=> d!67585 m!311885))

(declare-fun m!311945 () Bool)

(assert (=> b!300428 m!311945))

(assert (=> b!300431 m!311945))

(assert (=> b!300427 m!311945))

(assert (=> b!300352 d!67585))

(declare-fun d!67587 () Bool)

(declare-fun lt!149380 () (_ BitVec 32))

(declare-fun lt!149379 () (_ BitVec 32))

(assert (=> d!67587 (= lt!149380 (bvmul (bvxor lt!149379 (bvlshr lt!149379 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67587 (= lt!149379 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67587 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!158449 (let ((h!5293 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29761 (bvmul (bvxor h!5293 (bvlshr h!5293 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29761 (bvlshr x!29761 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!158449 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!158449 #b00000000000000000000000000000000))))))

(assert (=> d!67587 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!149380 (bvlshr lt!149380 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!300352 d!67587))

(declare-fun b!300498 () Bool)

(declare-fun e!189723 () Bool)

(declare-fun e!189724 () Bool)

(assert (=> b!300498 (= e!189723 e!189724)))

(declare-fun c!48608 () Bool)

(assert (=> b!300498 (= c!48608 (validKeyInArray!0 (select (arr!7179 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!300499 () Bool)

(declare-fun e!189722 () Bool)

(assert (=> b!300499 (= e!189724 e!189722)))

(declare-fun lt!149399 () (_ BitVec 64))

(assert (=> b!300499 (= lt!149399 (select (arr!7179 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9329 0))(
  ( (Unit!9330) )
))
(declare-fun lt!149401 () Unit!9329)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15169 (_ BitVec 64) (_ BitVec 32)) Unit!9329)

(assert (=> b!300499 (= lt!149401 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!149399 #b00000000000000000000000000000000))))

(assert (=> b!300499 (arrayContainsKey!0 a!3312 lt!149399 #b00000000000000000000000000000000)))

(declare-fun lt!149400 () Unit!9329)

(assert (=> b!300499 (= lt!149400 lt!149401)))

(declare-fun res!158473 () Bool)

(assert (=> b!300499 (= res!158473 (= (seekEntryOrOpen!0 (select (arr!7179 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2327 #b00000000000000000000000000000000)))))

(assert (=> b!300499 (=> (not res!158473) (not e!189722))))

(declare-fun b!300500 () Bool)

(declare-fun call!25832 () Bool)

(assert (=> b!300500 (= e!189722 call!25832)))

(declare-fun d!67589 () Bool)

(declare-fun res!158474 () Bool)

(assert (=> d!67589 (=> res!158474 e!189723)))

(assert (=> d!67589 (= res!158474 (bvsge #b00000000000000000000000000000000 (size!7532 a!3312)))))

(assert (=> d!67589 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!189723)))

(declare-fun bm!25829 () Bool)

(assert (=> bm!25829 (= call!25832 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!300501 () Bool)

(assert (=> b!300501 (= e!189724 call!25832)))

(assert (= (and d!67589 (not res!158474)) b!300498))

(assert (= (and b!300498 c!48608) b!300499))

(assert (= (and b!300498 (not c!48608)) b!300501))

(assert (= (and b!300499 res!158473) b!300500))

(assert (= (or b!300500 b!300501) bm!25829))

(declare-fun m!311961 () Bool)

(assert (=> b!300498 m!311961))

(assert (=> b!300498 m!311961))

(declare-fun m!311963 () Bool)

(assert (=> b!300498 m!311963))

(assert (=> b!300499 m!311961))

(declare-fun m!311965 () Bool)

(assert (=> b!300499 m!311965))

(declare-fun m!311967 () Bool)

(assert (=> b!300499 m!311967))

(assert (=> b!300499 m!311961))

(declare-fun m!311969 () Bool)

(assert (=> b!300499 m!311969))

(declare-fun m!311971 () Bool)

(assert (=> bm!25829 m!311971))

(assert (=> b!300353 d!67589))

(declare-fun lt!149428 () SeekEntryResult!2327)

(declare-fun b!300550 () Bool)

(declare-fun e!189752 () SeekEntryResult!2327)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15169 (_ BitVec 32)) SeekEntryResult!2327)

(assert (=> b!300550 (= e!189752 (seekKeyOrZeroReturnVacant!0 (x!29756 lt!149428) (index!11486 lt!149428) (index!11486 lt!149428) k0!2524 a!3312 mask!3809))))

(declare-fun b!300551 () Bool)

(declare-fun e!189750 () SeekEntryResult!2327)

(assert (=> b!300551 (= e!189750 Undefined!2327)))

(declare-fun b!300552 () Bool)

(declare-fun c!48632 () Bool)

(declare-fun lt!149427 () (_ BitVec 64))

(assert (=> b!300552 (= c!48632 (= lt!149427 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!189751 () SeekEntryResult!2327)

(assert (=> b!300552 (= e!189751 e!189752)))

(declare-fun b!300553 () Bool)

(assert (=> b!300553 (= e!189751 (Found!2327 (index!11486 lt!149428)))))

(declare-fun d!67597 () Bool)

(declare-fun lt!149429 () SeekEntryResult!2327)

(assert (=> d!67597 (and (or ((_ is Undefined!2327) lt!149429) (not ((_ is Found!2327) lt!149429)) (and (bvsge (index!11485 lt!149429) #b00000000000000000000000000000000) (bvslt (index!11485 lt!149429) (size!7532 a!3312)))) (or ((_ is Undefined!2327) lt!149429) ((_ is Found!2327) lt!149429) (not ((_ is MissingZero!2327) lt!149429)) (and (bvsge (index!11484 lt!149429) #b00000000000000000000000000000000) (bvslt (index!11484 lt!149429) (size!7532 a!3312)))) (or ((_ is Undefined!2327) lt!149429) ((_ is Found!2327) lt!149429) ((_ is MissingZero!2327) lt!149429) (not ((_ is MissingVacant!2327) lt!149429)) (and (bvsge (index!11487 lt!149429) #b00000000000000000000000000000000) (bvslt (index!11487 lt!149429) (size!7532 a!3312)))) (or ((_ is Undefined!2327) lt!149429) (ite ((_ is Found!2327) lt!149429) (= (select (arr!7179 a!3312) (index!11485 lt!149429)) k0!2524) (ite ((_ is MissingZero!2327) lt!149429) (= (select (arr!7179 a!3312) (index!11484 lt!149429)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2327) lt!149429) (= (select (arr!7179 a!3312) (index!11487 lt!149429)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67597 (= lt!149429 e!189750)))

(declare-fun c!48630 () Bool)

(assert (=> d!67597 (= c!48630 (and ((_ is Intermediate!2327) lt!149428) (undefined!3139 lt!149428)))))

(assert (=> d!67597 (= lt!149428 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67597 (validMask!0 mask!3809)))

(assert (=> d!67597 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!149429)))

(declare-fun b!300554 () Bool)

(assert (=> b!300554 (= e!189752 (MissingZero!2327 (index!11486 lt!149428)))))

(declare-fun b!300555 () Bool)

(assert (=> b!300555 (= e!189750 e!189751)))

(assert (=> b!300555 (= lt!149427 (select (arr!7179 a!3312) (index!11486 lt!149428)))))

(declare-fun c!48631 () Bool)

(assert (=> b!300555 (= c!48631 (= lt!149427 k0!2524))))

(assert (= (and d!67597 c!48630) b!300551))

(assert (= (and d!67597 (not c!48630)) b!300555))

(assert (= (and b!300555 c!48631) b!300553))

(assert (= (and b!300555 (not c!48631)) b!300552))

(assert (= (and b!300552 c!48632) b!300554))

(assert (= (and b!300552 (not c!48632)) b!300550))

(declare-fun m!311999 () Bool)

(assert (=> b!300550 m!311999))

(assert (=> d!67597 m!311875))

(assert (=> d!67597 m!311875))

(declare-fun m!312001 () Bool)

(assert (=> d!67597 m!312001))

(declare-fun m!312003 () Bool)

(assert (=> d!67597 m!312003))

(declare-fun m!312005 () Bool)

(assert (=> d!67597 m!312005))

(declare-fun m!312007 () Bool)

(assert (=> d!67597 m!312007))

(assert (=> d!67597 m!311885))

(declare-fun m!312009 () Bool)

(assert (=> b!300555 m!312009))

(assert (=> b!300354 d!67597))

(declare-fun d!67609 () Bool)

(declare-fun res!158486 () Bool)

(declare-fun e!189763 () Bool)

(assert (=> d!67609 (=> res!158486 e!189763)))

(assert (=> d!67609 (= res!158486 (= (select (arr!7179 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67609 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!189763)))

(declare-fun b!300572 () Bool)

(declare-fun e!189764 () Bool)

(assert (=> b!300572 (= e!189763 e!189764)))

(declare-fun res!158487 () Bool)

(assert (=> b!300572 (=> (not res!158487) (not e!189764))))

(assert (=> b!300572 (= res!158487 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7532 a!3312)))))

(declare-fun b!300573 () Bool)

(assert (=> b!300573 (= e!189764 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67609 (not res!158486)) b!300572))

(assert (= (and b!300572 res!158487) b!300573))

(assert (=> d!67609 m!311961))

(declare-fun m!312011 () Bool)

(assert (=> b!300573 m!312011))

(assert (=> b!300355 d!67609))

(check-sat (not b!300498) (not b!300573) (not d!67571) (not b!300433) (not d!67597) (not b!300499) (not b!300550) (not d!67585) (not b!300424) (not bm!25829))
(check-sat)
