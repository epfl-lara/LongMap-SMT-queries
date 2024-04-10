; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28334 () Bool)

(assert start!28334)

(declare-fun b!290329 () Bool)

(declare-fun e!183722 () Bool)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!290329 (= e!183722 (not (or (bvslt mask!3809 #b00000000000000000000000000000000) (bvsle mask!3809 #b00111111111111111111111111111111))))))

(declare-datatypes ((SeekEntryResult!2100 0))(
  ( (MissingZero!2100 (index!10570 (_ BitVec 32))) (Found!2100 (index!10571 (_ BitVec 32))) (Intermediate!2100 (undefined!2912 Bool) (index!10572 (_ BitVec 32)) (x!28761 (_ BitVec 32))) (Undefined!2100) (MissingVacant!2100 (index!10573 (_ BitVec 32))) )
))
(declare-fun lt!143430 () SeekEntryResult!2100)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!290329 (= (index!10572 lt!143430) i!1256)))

(declare-fun b!290330 () Bool)

(declare-fun res!151814 () Bool)

(declare-fun e!183724 () Bool)

(assert (=> b!290330 (=> (not res!151814) (not e!183724))))

(declare-datatypes ((array!14648 0))(
  ( (array!14649 (arr!6951 (Array (_ BitVec 32) (_ BitVec 64))) (size!7303 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14648)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290330 (= res!151814 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290332 () Bool)

(declare-fun res!151812 () Bool)

(assert (=> b!290332 (=> (not res!151812) (not e!183724))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290332 (= res!151812 (validKeyInArray!0 k0!2524))))

(declare-fun b!290333 () Bool)

(declare-fun res!151810 () Bool)

(declare-fun e!183725 () Bool)

(assert (=> b!290333 (=> (not res!151810) (not e!183725))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14648 (_ BitVec 32)) Bool)

(assert (=> b!290333 (= res!151810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290334 () Bool)

(declare-fun res!151808 () Bool)

(assert (=> b!290334 (=> (not res!151808) (not e!183724))))

(assert (=> b!290334 (= res!151808 (and (= (size!7303 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7303 a!3312))))))

(declare-fun b!290335 () Bool)

(declare-fun e!183721 () Bool)

(assert (=> b!290335 (= e!183721 e!183722)))

(declare-fun res!151811 () Bool)

(assert (=> b!290335 (=> (not res!151811) (not e!183722))))

(declare-fun lt!143429 () Bool)

(assert (=> b!290335 (= res!151811 (and (or lt!143429 (not (undefined!2912 lt!143430))) (not lt!143429) (= (select (arr!6951 a!3312) (index!10572 lt!143430)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!290335 (= lt!143429 (not ((_ is Intermediate!2100) lt!143430)))))

(declare-fun b!290336 () Bool)

(assert (=> b!290336 (= e!183724 e!183725)))

(declare-fun res!151813 () Bool)

(assert (=> b!290336 (=> (not res!151813) (not e!183725))))

(declare-fun lt!143431 () Bool)

(declare-fun lt!143427 () SeekEntryResult!2100)

(assert (=> b!290336 (= res!151813 (or lt!143431 (= lt!143427 (MissingVacant!2100 i!1256))))))

(assert (=> b!290336 (= lt!143431 (= lt!143427 (MissingZero!2100 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14648 (_ BitVec 32)) SeekEntryResult!2100)

(assert (=> b!290336 (= lt!143427 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!151815 () Bool)

(assert (=> start!28334 (=> (not res!151815) (not e!183724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28334 (= res!151815 (validMask!0 mask!3809))))

(assert (=> start!28334 e!183724))

(assert (=> start!28334 true))

(declare-fun array_inv!4914 (array!14648) Bool)

(assert (=> start!28334 (array_inv!4914 a!3312)))

(declare-fun b!290331 () Bool)

(assert (=> b!290331 (= e!183725 e!183721)))

(declare-fun res!151809 () Bool)

(assert (=> b!290331 (=> (not res!151809) (not e!183721))))

(assert (=> b!290331 (= res!151809 (and (not lt!143431) (= lt!143427 (MissingVacant!2100 i!1256))))))

(declare-fun lt!143426 () (_ BitVec 32))

(declare-fun lt!143428 () SeekEntryResult!2100)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14648 (_ BitVec 32)) SeekEntryResult!2100)

(assert (=> b!290331 (= lt!143428 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143426 k0!2524 (array!14649 (store (arr!6951 a!3312) i!1256 k0!2524) (size!7303 a!3312)) mask!3809))))

(assert (=> b!290331 (= lt!143430 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143426 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290331 (= lt!143426 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!28334 res!151815) b!290334))

(assert (= (and b!290334 res!151808) b!290332))

(assert (= (and b!290332 res!151812) b!290330))

(assert (= (and b!290330 res!151814) b!290336))

(assert (= (and b!290336 res!151813) b!290333))

(assert (= (and b!290333 res!151810) b!290331))

(assert (= (and b!290331 res!151809) b!290335))

(assert (= (and b!290335 res!151811) b!290329))

(declare-fun m!304435 () Bool)

(assert (=> b!290333 m!304435))

(declare-fun m!304437 () Bool)

(assert (=> b!290331 m!304437))

(declare-fun m!304439 () Bool)

(assert (=> b!290331 m!304439))

(declare-fun m!304441 () Bool)

(assert (=> b!290331 m!304441))

(declare-fun m!304443 () Bool)

(assert (=> b!290331 m!304443))

(declare-fun m!304445 () Bool)

(assert (=> b!290336 m!304445))

(declare-fun m!304447 () Bool)

(assert (=> start!28334 m!304447))

(declare-fun m!304449 () Bool)

(assert (=> start!28334 m!304449))

(declare-fun m!304451 () Bool)

(assert (=> b!290335 m!304451))

(declare-fun m!304453 () Bool)

(assert (=> b!290332 m!304453))

(declare-fun m!304455 () Bool)

(assert (=> b!290330 m!304455))

(check-sat (not b!290330) (not b!290333) (not b!290336) (not b!290331) (not b!290332) (not start!28334))
(check-sat)
(get-model)

(declare-fun d!66281 () Bool)

(assert (=> d!66281 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28334 d!66281))

(declare-fun d!66283 () Bool)

(assert (=> d!66283 (= (array_inv!4914 a!3312) (bvsge (size!7303 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28334 d!66283))

(declare-fun b!290369 () Bool)

(declare-fun e!183749 () Bool)

(declare-fun call!25636 () Bool)

(assert (=> b!290369 (= e!183749 call!25636)))

(declare-fun b!290370 () Bool)

(declare-fun e!183748 () Bool)

(assert (=> b!290370 (= e!183748 e!183749)))

(declare-fun lt!143456 () (_ BitVec 64))

(assert (=> b!290370 (= lt!143456 (select (arr!6951 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9140 0))(
  ( (Unit!9141) )
))
(declare-fun lt!143457 () Unit!9140)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14648 (_ BitVec 64) (_ BitVec 32)) Unit!9140)

(assert (=> b!290370 (= lt!143457 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!143456 #b00000000000000000000000000000000))))

(assert (=> b!290370 (arrayContainsKey!0 a!3312 lt!143456 #b00000000000000000000000000000000)))

(declare-fun lt!143458 () Unit!9140)

(assert (=> b!290370 (= lt!143458 lt!143457)))

(declare-fun res!151845 () Bool)

(assert (=> b!290370 (= res!151845 (= (seekEntryOrOpen!0 (select (arr!6951 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2100 #b00000000000000000000000000000000)))))

(assert (=> b!290370 (=> (not res!151845) (not e!183749))))

(declare-fun bm!25633 () Bool)

(assert (=> bm!25633 (= call!25636 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!66287 () Bool)

(declare-fun res!151844 () Bool)

(declare-fun e!183747 () Bool)

(assert (=> d!66287 (=> res!151844 e!183747)))

(assert (=> d!66287 (= res!151844 (bvsge #b00000000000000000000000000000000 (size!7303 a!3312)))))

(assert (=> d!66287 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!183747)))

(declare-fun b!290371 () Bool)

(assert (=> b!290371 (= e!183748 call!25636)))

(declare-fun b!290372 () Bool)

(assert (=> b!290372 (= e!183747 e!183748)))

(declare-fun c!46824 () Bool)

(assert (=> b!290372 (= c!46824 (validKeyInArray!0 (select (arr!6951 a!3312) #b00000000000000000000000000000000)))))

(assert (= (and d!66287 (not res!151844)) b!290372))

(assert (= (and b!290372 c!46824) b!290370))

(assert (= (and b!290372 (not c!46824)) b!290371))

(assert (= (and b!290370 res!151845) b!290369))

(assert (= (or b!290369 b!290371) bm!25633))

(declare-fun m!304479 () Bool)

(assert (=> b!290370 m!304479))

(declare-fun m!304481 () Bool)

(assert (=> b!290370 m!304481))

(declare-fun m!304483 () Bool)

(assert (=> b!290370 m!304483))

(assert (=> b!290370 m!304479))

(declare-fun m!304485 () Bool)

(assert (=> b!290370 m!304485))

(declare-fun m!304487 () Bool)

(assert (=> bm!25633 m!304487))

(assert (=> b!290372 m!304479))

(assert (=> b!290372 m!304479))

(declare-fun m!304489 () Bool)

(assert (=> b!290372 m!304489))

(assert (=> b!290333 d!66287))

(declare-fun d!66291 () Bool)

(assert (=> d!66291 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!290332 d!66291))

(declare-fun b!290442 () Bool)

(declare-fun c!46853 () Bool)

(declare-fun lt!143490 () (_ BitVec 64))

(assert (=> b!290442 (= c!46853 (= lt!143490 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!183790 () SeekEntryResult!2100)

(declare-fun e!183791 () SeekEntryResult!2100)

(assert (=> b!290442 (= e!183790 e!183791)))

(declare-fun d!66295 () Bool)

(declare-fun lt!143491 () SeekEntryResult!2100)

(assert (=> d!66295 (and (or ((_ is Undefined!2100) lt!143491) (not ((_ is Found!2100) lt!143491)) (and (bvsge (index!10571 lt!143491) #b00000000000000000000000000000000) (bvslt (index!10571 lt!143491) (size!7303 a!3312)))) (or ((_ is Undefined!2100) lt!143491) ((_ is Found!2100) lt!143491) (not ((_ is MissingZero!2100) lt!143491)) (and (bvsge (index!10570 lt!143491) #b00000000000000000000000000000000) (bvslt (index!10570 lt!143491) (size!7303 a!3312)))) (or ((_ is Undefined!2100) lt!143491) ((_ is Found!2100) lt!143491) ((_ is MissingZero!2100) lt!143491) (not ((_ is MissingVacant!2100) lt!143491)) (and (bvsge (index!10573 lt!143491) #b00000000000000000000000000000000) (bvslt (index!10573 lt!143491) (size!7303 a!3312)))) (or ((_ is Undefined!2100) lt!143491) (ite ((_ is Found!2100) lt!143491) (= (select (arr!6951 a!3312) (index!10571 lt!143491)) k0!2524) (ite ((_ is MissingZero!2100) lt!143491) (= (select (arr!6951 a!3312) (index!10570 lt!143491)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2100) lt!143491) (= (select (arr!6951 a!3312) (index!10573 lt!143491)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!183789 () SeekEntryResult!2100)

(assert (=> d!66295 (= lt!143491 e!183789)))

(declare-fun c!46852 () Bool)

(declare-fun lt!143489 () SeekEntryResult!2100)

(assert (=> d!66295 (= c!46852 (and ((_ is Intermediate!2100) lt!143489) (undefined!2912 lt!143489)))))

(assert (=> d!66295 (= lt!143489 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66295 (validMask!0 mask!3809)))

(assert (=> d!66295 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!143491)))

(declare-fun b!290443 () Bool)

(assert (=> b!290443 (= e!183789 Undefined!2100)))

(declare-fun b!290444 () Bool)

(assert (=> b!290444 (= e!183791 (MissingZero!2100 (index!10572 lt!143489)))))

(declare-fun b!290445 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14648 (_ BitVec 32)) SeekEntryResult!2100)

(assert (=> b!290445 (= e!183791 (seekKeyOrZeroReturnVacant!0 (x!28761 lt!143489) (index!10572 lt!143489) (index!10572 lt!143489) k0!2524 a!3312 mask!3809))))

(declare-fun b!290446 () Bool)

(assert (=> b!290446 (= e!183790 (Found!2100 (index!10572 lt!143489)))))

(declare-fun b!290447 () Bool)

(assert (=> b!290447 (= e!183789 e!183790)))

(assert (=> b!290447 (= lt!143490 (select (arr!6951 a!3312) (index!10572 lt!143489)))))

(declare-fun c!46854 () Bool)

(assert (=> b!290447 (= c!46854 (= lt!143490 k0!2524))))

(assert (= (and d!66295 c!46852) b!290443))

(assert (= (and d!66295 (not c!46852)) b!290447))

(assert (= (and b!290447 c!46854) b!290446))

(assert (= (and b!290447 (not c!46854)) b!290442))

(assert (= (and b!290442 c!46853) b!290444))

(assert (= (and b!290442 (not c!46853)) b!290445))

(declare-fun m!304515 () Bool)

(assert (=> d!66295 m!304515))

(declare-fun m!304517 () Bool)

(assert (=> d!66295 m!304517))

(assert (=> d!66295 m!304447))

(assert (=> d!66295 m!304443))

(assert (=> d!66295 m!304443))

(declare-fun m!304521 () Bool)

(assert (=> d!66295 m!304521))

(declare-fun m!304525 () Bool)

(assert (=> d!66295 m!304525))

(declare-fun m!304529 () Bool)

(assert (=> b!290445 m!304529))

(declare-fun m!304531 () Bool)

(assert (=> b!290447 m!304531))

(assert (=> b!290336 d!66295))

(declare-fun b!290502 () Bool)

(declare-fun lt!143510 () SeekEntryResult!2100)

(assert (=> b!290502 (and (bvsge (index!10572 lt!143510) #b00000000000000000000000000000000) (bvslt (index!10572 lt!143510) (size!7303 (array!14649 (store (arr!6951 a!3312) i!1256 k0!2524) (size!7303 a!3312)))))))

(declare-fun res!151881 () Bool)

(assert (=> b!290502 (= res!151881 (= (select (arr!6951 (array!14649 (store (arr!6951 a!3312) i!1256 k0!2524) (size!7303 a!3312))) (index!10572 lt!143510)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!183825 () Bool)

(assert (=> b!290502 (=> res!151881 e!183825)))

(declare-fun b!290503 () Bool)

(declare-fun e!183826 () Bool)

(assert (=> b!290503 (= e!183826 (bvsge (x!28761 lt!143510) #b01111111111111111111111111111110))))

(declare-fun b!290504 () Bool)

(assert (=> b!290504 (and (bvsge (index!10572 lt!143510) #b00000000000000000000000000000000) (bvslt (index!10572 lt!143510) (size!7303 (array!14649 (store (arr!6951 a!3312) i!1256 k0!2524) (size!7303 a!3312)))))))

(assert (=> b!290504 (= e!183825 (= (select (arr!6951 (array!14649 (store (arr!6951 a!3312) i!1256 k0!2524) (size!7303 a!3312))) (index!10572 lt!143510)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!290505 () Bool)

(assert (=> b!290505 (and (bvsge (index!10572 lt!143510) #b00000000000000000000000000000000) (bvslt (index!10572 lt!143510) (size!7303 (array!14649 (store (arr!6951 a!3312) i!1256 k0!2524) (size!7303 a!3312)))))))

(declare-fun res!151880 () Bool)

(assert (=> b!290505 (= res!151880 (= (select (arr!6951 (array!14649 (store (arr!6951 a!3312) i!1256 k0!2524) (size!7303 a!3312))) (index!10572 lt!143510)) k0!2524))))

(assert (=> b!290505 (=> res!151880 e!183825)))

(declare-fun e!183824 () Bool)

(assert (=> b!290505 (= e!183824 e!183825)))

(declare-fun b!290506 () Bool)

(assert (=> b!290506 (= e!183826 e!183824)))

(declare-fun res!151882 () Bool)

(assert (=> b!290506 (= res!151882 (and ((_ is Intermediate!2100) lt!143510) (not (undefined!2912 lt!143510)) (bvslt (x!28761 lt!143510) #b01111111111111111111111111111110) (bvsge (x!28761 lt!143510) #b00000000000000000000000000000000) (bvsge (x!28761 lt!143510) #b00000000000000000000000000000000)))))

(assert (=> b!290506 (=> (not res!151882) (not e!183824))))

(declare-fun b!290507 () Bool)

(declare-fun e!183823 () SeekEntryResult!2100)

(declare-fun e!183822 () SeekEntryResult!2100)

(assert (=> b!290507 (= e!183823 e!183822)))

(declare-fun c!46875 () Bool)

(declare-fun lt!143511 () (_ BitVec 64))

(assert (=> b!290507 (= c!46875 (or (= lt!143511 k0!2524) (= (bvadd lt!143511 lt!143511) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!290508 () Bool)

(assert (=> b!290508 (= e!183823 (Intermediate!2100 true lt!143426 #b00000000000000000000000000000000))))

(declare-fun d!66301 () Bool)

(assert (=> d!66301 e!183826))

(declare-fun c!46874 () Bool)

(assert (=> d!66301 (= c!46874 (and ((_ is Intermediate!2100) lt!143510) (undefined!2912 lt!143510)))))

(assert (=> d!66301 (= lt!143510 e!183823)))

(declare-fun c!46873 () Bool)

(assert (=> d!66301 (= c!46873 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66301 (= lt!143511 (select (arr!6951 (array!14649 (store (arr!6951 a!3312) i!1256 k0!2524) (size!7303 a!3312))) lt!143426))))

(assert (=> d!66301 (validMask!0 mask!3809)))

(assert (=> d!66301 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143426 k0!2524 (array!14649 (store (arr!6951 a!3312) i!1256 k0!2524) (size!7303 a!3312)) mask!3809) lt!143510)))

(declare-fun b!290509 () Bool)

(assert (=> b!290509 (= e!183822 (Intermediate!2100 false lt!143426 #b00000000000000000000000000000000))))

(declare-fun b!290510 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290510 (= e!183822 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!143426 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!14649 (store (arr!6951 a!3312) i!1256 k0!2524) (size!7303 a!3312)) mask!3809))))

(assert (= (and d!66301 c!46873) b!290508))

(assert (= (and d!66301 (not c!46873)) b!290507))

(assert (= (and b!290507 c!46875) b!290509))

(assert (= (and b!290507 (not c!46875)) b!290510))

(assert (= (and d!66301 c!46874) b!290503))

(assert (= (and d!66301 (not c!46874)) b!290506))

(assert (= (and b!290506 res!151882) b!290505))

(assert (= (and b!290505 (not res!151880)) b!290502))

(assert (= (and b!290502 (not res!151881)) b!290504))

(declare-fun m!304549 () Bool)

(assert (=> b!290510 m!304549))

(assert (=> b!290510 m!304549))

(declare-fun m!304553 () Bool)

(assert (=> b!290510 m!304553))

(declare-fun m!304557 () Bool)

(assert (=> b!290502 m!304557))

(declare-fun m!304559 () Bool)

(assert (=> d!66301 m!304559))

(assert (=> d!66301 m!304447))

(assert (=> b!290504 m!304557))

(assert (=> b!290505 m!304557))

(assert (=> b!290331 d!66301))

(declare-fun b!290520 () Bool)

(declare-fun lt!143514 () SeekEntryResult!2100)

(assert (=> b!290520 (and (bvsge (index!10572 lt!143514) #b00000000000000000000000000000000) (bvslt (index!10572 lt!143514) (size!7303 a!3312)))))

(declare-fun res!151887 () Bool)

(assert (=> b!290520 (= res!151887 (= (select (arr!6951 a!3312) (index!10572 lt!143514)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!183835 () Bool)

(assert (=> b!290520 (=> res!151887 e!183835)))

(declare-fun b!290521 () Bool)

(declare-fun e!183836 () Bool)

(assert (=> b!290521 (= e!183836 (bvsge (x!28761 lt!143514) #b01111111111111111111111111111110))))

(declare-fun b!290522 () Bool)

(assert (=> b!290522 (and (bvsge (index!10572 lt!143514) #b00000000000000000000000000000000) (bvslt (index!10572 lt!143514) (size!7303 a!3312)))))

(assert (=> b!290522 (= e!183835 (= (select (arr!6951 a!3312) (index!10572 lt!143514)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!290523 () Bool)

(assert (=> b!290523 (and (bvsge (index!10572 lt!143514) #b00000000000000000000000000000000) (bvslt (index!10572 lt!143514) (size!7303 a!3312)))))

(declare-fun res!151886 () Bool)

(assert (=> b!290523 (= res!151886 (= (select (arr!6951 a!3312) (index!10572 lt!143514)) k0!2524))))

(assert (=> b!290523 (=> res!151886 e!183835)))

(declare-fun e!183834 () Bool)

(assert (=> b!290523 (= e!183834 e!183835)))

(declare-fun b!290524 () Bool)

(assert (=> b!290524 (= e!183836 e!183834)))

(declare-fun res!151888 () Bool)

(assert (=> b!290524 (= res!151888 (and ((_ is Intermediate!2100) lt!143514) (not (undefined!2912 lt!143514)) (bvslt (x!28761 lt!143514) #b01111111111111111111111111111110) (bvsge (x!28761 lt!143514) #b00000000000000000000000000000000) (bvsge (x!28761 lt!143514) #b00000000000000000000000000000000)))))

(assert (=> b!290524 (=> (not res!151888) (not e!183834))))

(declare-fun b!290525 () Bool)

(declare-fun e!183833 () SeekEntryResult!2100)

(declare-fun e!183832 () SeekEntryResult!2100)

(assert (=> b!290525 (= e!183833 e!183832)))

(declare-fun c!46881 () Bool)

(declare-fun lt!143515 () (_ BitVec 64))

(assert (=> b!290525 (= c!46881 (or (= lt!143515 k0!2524) (= (bvadd lt!143515 lt!143515) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!290526 () Bool)

(assert (=> b!290526 (= e!183833 (Intermediate!2100 true lt!143426 #b00000000000000000000000000000000))))

(declare-fun d!66317 () Bool)

(assert (=> d!66317 e!183836))

(declare-fun c!46880 () Bool)

(assert (=> d!66317 (= c!46880 (and ((_ is Intermediate!2100) lt!143514) (undefined!2912 lt!143514)))))

(assert (=> d!66317 (= lt!143514 e!183833)))

(declare-fun c!46879 () Bool)

(assert (=> d!66317 (= c!46879 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66317 (= lt!143515 (select (arr!6951 a!3312) lt!143426))))

(assert (=> d!66317 (validMask!0 mask!3809)))

(assert (=> d!66317 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143426 k0!2524 a!3312 mask!3809) lt!143514)))

(declare-fun b!290527 () Bool)

(assert (=> b!290527 (= e!183832 (Intermediate!2100 false lt!143426 #b00000000000000000000000000000000))))

(declare-fun b!290528 () Bool)

(assert (=> b!290528 (= e!183832 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!143426 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (= (and d!66317 c!46879) b!290526))

(assert (= (and d!66317 (not c!46879)) b!290525))

(assert (= (and b!290525 c!46881) b!290527))

(assert (= (and b!290525 (not c!46881)) b!290528))

(assert (= (and d!66317 c!46880) b!290521))

(assert (= (and d!66317 (not c!46880)) b!290524))

(assert (= (and b!290524 res!151888) b!290523))

(assert (= (and b!290523 (not res!151886)) b!290520))

(assert (= (and b!290520 (not res!151887)) b!290522))

(assert (=> b!290528 m!304549))

(assert (=> b!290528 m!304549))

(declare-fun m!304563 () Bool)

(assert (=> b!290528 m!304563))

(declare-fun m!304565 () Bool)

(assert (=> b!290520 m!304565))

(declare-fun m!304567 () Bool)

(assert (=> d!66317 m!304567))

(assert (=> d!66317 m!304447))

(assert (=> b!290522 m!304565))

(assert (=> b!290523 m!304565))

(assert (=> b!290331 d!66317))

(declare-fun d!66319 () Bool)

(declare-fun lt!143527 () (_ BitVec 32))

(declare-fun lt!143526 () (_ BitVec 32))

(assert (=> d!66319 (= lt!143527 (bvmul (bvxor lt!143526 (bvlshr lt!143526 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66319 (= lt!143526 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66319 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!151890 (let ((h!5261 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28768 (bvmul (bvxor h!5261 (bvlshr h!5261 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28768 (bvlshr x!28768 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!151890 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!151890 #b00000000000000000000000000000000))))))

(assert (=> d!66319 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!143527 (bvlshr lt!143527 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!290331 d!66319))

(declare-fun d!66325 () Bool)

(declare-fun res!151901 () Bool)

(declare-fun e!183847 () Bool)

(assert (=> d!66325 (=> res!151901 e!183847)))

(assert (=> d!66325 (= res!151901 (= (select (arr!6951 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66325 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!183847)))

(declare-fun b!290539 () Bool)

(declare-fun e!183848 () Bool)

(assert (=> b!290539 (= e!183847 e!183848)))

(declare-fun res!151902 () Bool)

(assert (=> b!290539 (=> (not res!151902) (not e!183848))))

(assert (=> b!290539 (= res!151902 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7303 a!3312)))))

(declare-fun b!290540 () Bool)

(assert (=> b!290540 (= e!183848 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66325 (not res!151901)) b!290539))

(assert (= (and b!290539 res!151902) b!290540))

(assert (=> d!66325 m!304479))

(declare-fun m!304571 () Bool)

(assert (=> b!290540 m!304571))

(assert (=> b!290330 d!66325))

(check-sat (not d!66317) (not d!66295) (not b!290370) (not b!290372) (not b!290445) (not d!66301) (not bm!25633) (not b!290510) (not b!290528) (not b!290540))
(check-sat)
