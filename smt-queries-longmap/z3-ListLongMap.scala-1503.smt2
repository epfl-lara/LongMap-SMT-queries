; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28444 () Bool)

(assert start!28444)

(declare-fun b!291432 () Bool)

(declare-fun e!184404 () Bool)

(declare-fun e!184403 () Bool)

(assert (=> b!291432 (= e!184404 e!184403)))

(declare-fun res!152746 () Bool)

(assert (=> b!291432 (=> (not res!152746) (not e!184403))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2099 0))(
  ( (MissingZero!2099 (index!10566 (_ BitVec 32))) (Found!2099 (index!10567 (_ BitVec 32))) (Intermediate!2099 (undefined!2911 Bool) (index!10568 (_ BitVec 32)) (x!28862 (_ BitVec 32))) (Undefined!2099) (MissingVacant!2099 (index!10569 (_ BitVec 32))) )
))
(declare-fun lt!144213 () SeekEntryResult!2099)

(declare-fun lt!144211 () Bool)

(assert (=> b!291432 (= res!152746 (and (not lt!144211) (= lt!144213 (MissingVacant!2099 i!1256))))))

(declare-fun lt!144212 () (_ BitVec 32))

(declare-fun lt!144216 () SeekEntryResult!2099)

(declare-datatypes ((array!14718 0))(
  ( (array!14719 (arr!6985 (Array (_ BitVec 32) (_ BitVec 64))) (size!7337 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14718)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14718 (_ BitVec 32)) SeekEntryResult!2099)

(assert (=> b!291432 (= lt!144216 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144212 k0!2524 (array!14719 (store (arr!6985 a!3312) i!1256 k0!2524) (size!7337 a!3312)) mask!3809))))

(declare-fun lt!144215 () SeekEntryResult!2099)

(assert (=> b!291432 (= lt!144215 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144212 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291432 (= lt!144212 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!291433 () Bool)

(declare-fun e!184406 () Bool)

(assert (=> b!291433 (= e!184403 e!184406)))

(declare-fun res!152749 () Bool)

(assert (=> b!291433 (=> (not res!152749) (not e!184406))))

(declare-fun lt!144214 () Bool)

(assert (=> b!291433 (= res!152749 (and (or lt!144214 (not (undefined!2911 lt!144215))) (not lt!144214) (= (select (arr!6985 a!3312) (index!10568 lt!144215)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!291433 (= lt!144214 (not ((_ is Intermediate!2099) lt!144215)))))

(declare-fun b!291434 () Bool)

(declare-fun e!184405 () Bool)

(assert (=> b!291434 (= e!184405 e!184404)))

(declare-fun res!152744 () Bool)

(assert (=> b!291434 (=> (not res!152744) (not e!184404))))

(assert (=> b!291434 (= res!152744 (or lt!144211 (= lt!144213 (MissingVacant!2099 i!1256))))))

(assert (=> b!291434 (= lt!144211 (= lt!144213 (MissingZero!2099 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14718 (_ BitVec 32)) SeekEntryResult!2099)

(assert (=> b!291434 (= lt!144213 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!291435 () Bool)

(assert (=> b!291435 (= e!184406 (not (or (not (= lt!144215 (Intermediate!2099 false (index!10568 lt!144215) (x!28862 lt!144215)))) (bvsle #b00000000000000000000000000000000 (x!28862 lt!144215)))))))

(assert (=> b!291435 (= (index!10568 lt!144215) i!1256)))

(declare-fun b!291436 () Bool)

(declare-fun res!152750 () Bool)

(assert (=> b!291436 (=> (not res!152750) (not e!184405))))

(assert (=> b!291436 (= res!152750 (and (= (size!7337 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7337 a!3312))))))

(declare-fun b!291437 () Bool)

(declare-fun res!152747 () Bool)

(assert (=> b!291437 (=> (not res!152747) (not e!184405))))

(declare-fun arrayContainsKey!0 (array!14718 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!291437 (= res!152747 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!152748 () Bool)

(assert (=> start!28444 (=> (not res!152748) (not e!184405))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28444 (= res!152748 (validMask!0 mask!3809))))

(assert (=> start!28444 e!184405))

(assert (=> start!28444 true))

(declare-fun array_inv!4935 (array!14718) Bool)

(assert (=> start!28444 (array_inv!4935 a!3312)))

(declare-fun b!291438 () Bool)

(declare-fun res!152751 () Bool)

(assert (=> b!291438 (=> (not res!152751) (not e!184405))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!291438 (= res!152751 (validKeyInArray!0 k0!2524))))

(declare-fun b!291439 () Bool)

(declare-fun res!152745 () Bool)

(assert (=> b!291439 (=> (not res!152745) (not e!184404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14718 (_ BitVec 32)) Bool)

(assert (=> b!291439 (= res!152745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28444 res!152748) b!291436))

(assert (= (and b!291436 res!152750) b!291438))

(assert (= (and b!291438 res!152751) b!291437))

(assert (= (and b!291437 res!152747) b!291434))

(assert (= (and b!291434 res!152744) b!291439))

(assert (= (and b!291439 res!152745) b!291432))

(assert (= (and b!291432 res!152746) b!291433))

(assert (= (and b!291433 res!152749) b!291435))

(declare-fun m!305531 () Bool)

(assert (=> b!291438 m!305531))

(declare-fun m!305533 () Bool)

(assert (=> b!291439 m!305533))

(declare-fun m!305535 () Bool)

(assert (=> start!28444 m!305535))

(declare-fun m!305537 () Bool)

(assert (=> start!28444 m!305537))

(declare-fun m!305539 () Bool)

(assert (=> b!291432 m!305539))

(declare-fun m!305541 () Bool)

(assert (=> b!291432 m!305541))

(declare-fun m!305543 () Bool)

(assert (=> b!291432 m!305543))

(declare-fun m!305545 () Bool)

(assert (=> b!291432 m!305545))

(declare-fun m!305547 () Bool)

(assert (=> b!291434 m!305547))

(declare-fun m!305549 () Bool)

(assert (=> b!291437 m!305549))

(declare-fun m!305551 () Bool)

(assert (=> b!291433 m!305551))

(check-sat (not b!291439) (not start!28444) (not b!291434) (not b!291438) (not b!291432) (not b!291437))
(check-sat)
(get-model)

(declare-fun d!66421 () Bool)

(assert (=> d!66421 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!291438 d!66421))

(declare-fun d!66423 () Bool)

(assert (=> d!66423 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28444 d!66423))

(declare-fun d!66425 () Bool)

(assert (=> d!66425 (= (array_inv!4935 a!3312) (bvsge (size!7337 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28444 d!66425))

(declare-fun bm!25630 () Bool)

(declare-fun call!25633 () Bool)

(assert (=> bm!25630 (= call!25633 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!291496 () Bool)

(declare-fun e!184443 () Bool)

(assert (=> b!291496 (= e!184443 call!25633)))

(declare-fun d!66427 () Bool)

(declare-fun res!152804 () Bool)

(declare-fun e!184444 () Bool)

(assert (=> d!66427 (=> res!152804 e!184444)))

(assert (=> d!66427 (= res!152804 (bvsge #b00000000000000000000000000000000 (size!7337 a!3312)))))

(assert (=> d!66427 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!184444)))

(declare-fun b!291497 () Bool)

(declare-fun e!184445 () Bool)

(assert (=> b!291497 (= e!184445 call!25633)))

(declare-fun b!291498 () Bool)

(assert (=> b!291498 (= e!184443 e!184445)))

(declare-fun lt!144260 () (_ BitVec 64))

(assert (=> b!291498 (= lt!144260 (select (arr!6985 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9112 0))(
  ( (Unit!9113) )
))
(declare-fun lt!144261 () Unit!9112)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14718 (_ BitVec 64) (_ BitVec 32)) Unit!9112)

(assert (=> b!291498 (= lt!144261 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!144260 #b00000000000000000000000000000000))))

(assert (=> b!291498 (arrayContainsKey!0 a!3312 lt!144260 #b00000000000000000000000000000000)))

(declare-fun lt!144259 () Unit!9112)

(assert (=> b!291498 (= lt!144259 lt!144261)))

(declare-fun res!152805 () Bool)

(assert (=> b!291498 (= res!152805 (= (seekEntryOrOpen!0 (select (arr!6985 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2099 #b00000000000000000000000000000000)))))

(assert (=> b!291498 (=> (not res!152805) (not e!184445))))

(declare-fun b!291499 () Bool)

(assert (=> b!291499 (= e!184444 e!184443)))

(declare-fun c!46909 () Bool)

(assert (=> b!291499 (= c!46909 (validKeyInArray!0 (select (arr!6985 a!3312) #b00000000000000000000000000000000)))))

(assert (= (and d!66427 (not res!152804)) b!291499))

(assert (= (and b!291499 c!46909) b!291498))

(assert (= (and b!291499 (not c!46909)) b!291496))

(assert (= (and b!291498 res!152805) b!291497))

(assert (= (or b!291497 b!291496) bm!25630))

(declare-fun m!305597 () Bool)

(assert (=> bm!25630 m!305597))

(declare-fun m!305599 () Bool)

(assert (=> b!291498 m!305599))

(declare-fun m!305601 () Bool)

(assert (=> b!291498 m!305601))

(declare-fun m!305603 () Bool)

(assert (=> b!291498 m!305603))

(assert (=> b!291498 m!305599))

(declare-fun m!305605 () Bool)

(assert (=> b!291498 m!305605))

(assert (=> b!291499 m!305599))

(assert (=> b!291499 m!305599))

(declare-fun m!305607 () Bool)

(assert (=> b!291499 m!305607))

(assert (=> b!291439 d!66427))

(declare-fun b!291544 () Bool)

(declare-fun e!184479 () SeekEntryResult!2099)

(declare-fun lt!144285 () SeekEntryResult!2099)

(assert (=> b!291544 (= e!184479 (MissingZero!2099 (index!10568 lt!144285)))))

(declare-fun b!291545 () Bool)

(declare-fun e!184481 () SeekEntryResult!2099)

(assert (=> b!291545 (= e!184481 Undefined!2099)))

(declare-fun d!66431 () Bool)

(declare-fun lt!144284 () SeekEntryResult!2099)

(assert (=> d!66431 (and (or ((_ is Undefined!2099) lt!144284) (not ((_ is Found!2099) lt!144284)) (and (bvsge (index!10567 lt!144284) #b00000000000000000000000000000000) (bvslt (index!10567 lt!144284) (size!7337 a!3312)))) (or ((_ is Undefined!2099) lt!144284) ((_ is Found!2099) lt!144284) (not ((_ is MissingZero!2099) lt!144284)) (and (bvsge (index!10566 lt!144284) #b00000000000000000000000000000000) (bvslt (index!10566 lt!144284) (size!7337 a!3312)))) (or ((_ is Undefined!2099) lt!144284) ((_ is Found!2099) lt!144284) ((_ is MissingZero!2099) lt!144284) (not ((_ is MissingVacant!2099) lt!144284)) (and (bvsge (index!10569 lt!144284) #b00000000000000000000000000000000) (bvslt (index!10569 lt!144284) (size!7337 a!3312)))) (or ((_ is Undefined!2099) lt!144284) (ite ((_ is Found!2099) lt!144284) (= (select (arr!6985 a!3312) (index!10567 lt!144284)) k0!2524) (ite ((_ is MissingZero!2099) lt!144284) (= (select (arr!6985 a!3312) (index!10566 lt!144284)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2099) lt!144284) (= (select (arr!6985 a!3312) (index!10569 lt!144284)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66431 (= lt!144284 e!184481)))

(declare-fun c!46921 () Bool)

(assert (=> d!66431 (= c!46921 (and ((_ is Intermediate!2099) lt!144285) (undefined!2911 lt!144285)))))

(assert (=> d!66431 (= lt!144285 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66431 (validMask!0 mask!3809)))

(assert (=> d!66431 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!144284)))

(declare-fun b!291546 () Bool)

(declare-fun e!184480 () SeekEntryResult!2099)

(assert (=> b!291546 (= e!184481 e!184480)))

(declare-fun lt!144283 () (_ BitVec 64))

(assert (=> b!291546 (= lt!144283 (select (arr!6985 a!3312) (index!10568 lt!144285)))))

(declare-fun c!46922 () Bool)

(assert (=> b!291546 (= c!46922 (= lt!144283 k0!2524))))

(declare-fun b!291547 () Bool)

(assert (=> b!291547 (= e!184480 (Found!2099 (index!10568 lt!144285)))))

(declare-fun b!291548 () Bool)

(declare-fun c!46923 () Bool)

(assert (=> b!291548 (= c!46923 (= lt!144283 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!291548 (= e!184480 e!184479)))

(declare-fun b!291549 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14718 (_ BitVec 32)) SeekEntryResult!2099)

(assert (=> b!291549 (= e!184479 (seekKeyOrZeroReturnVacant!0 (x!28862 lt!144285) (index!10568 lt!144285) (index!10568 lt!144285) k0!2524 a!3312 mask!3809))))

(assert (= (and d!66431 c!46921) b!291545))

(assert (= (and d!66431 (not c!46921)) b!291546))

(assert (= (and b!291546 c!46922) b!291547))

(assert (= (and b!291546 (not c!46922)) b!291548))

(assert (= (and b!291548 c!46923) b!291544))

(assert (= (and b!291548 (not c!46923)) b!291549))

(assert (=> d!66431 m!305545))

(assert (=> d!66431 m!305535))

(declare-fun m!305627 () Bool)

(assert (=> d!66431 m!305627))

(assert (=> d!66431 m!305545))

(declare-fun m!305629 () Bool)

(assert (=> d!66431 m!305629))

(declare-fun m!305631 () Bool)

(assert (=> d!66431 m!305631))

(declare-fun m!305633 () Bool)

(assert (=> d!66431 m!305633))

(declare-fun m!305635 () Bool)

(assert (=> b!291546 m!305635))

(declare-fun m!305637 () Bool)

(assert (=> b!291549 m!305637))

(assert (=> b!291434 d!66431))

(declare-fun d!66443 () Bool)

(declare-fun res!152834 () Bool)

(declare-fun e!184489 () Bool)

(assert (=> d!66443 (=> res!152834 e!184489)))

(assert (=> d!66443 (= res!152834 (= (select (arr!6985 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66443 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!184489)))

(declare-fun b!291558 () Bool)

(declare-fun e!184490 () Bool)

(assert (=> b!291558 (= e!184489 e!184490)))

(declare-fun res!152835 () Bool)

(assert (=> b!291558 (=> (not res!152835) (not e!184490))))

(assert (=> b!291558 (= res!152835 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7337 a!3312)))))

(declare-fun b!291559 () Bool)

(assert (=> b!291559 (= e!184490 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66443 (not res!152834)) b!291558))

(assert (= (and b!291558 res!152835) b!291559))

(assert (=> d!66443 m!305599))

(declare-fun m!305649 () Bool)

(assert (=> b!291559 m!305649))

(assert (=> b!291437 d!66443))

(declare-fun b!291614 () Bool)

(declare-fun lt!144308 () SeekEntryResult!2099)

(assert (=> b!291614 (and (bvsge (index!10568 lt!144308) #b00000000000000000000000000000000) (bvslt (index!10568 lt!144308) (size!7337 (array!14719 (store (arr!6985 a!3312) i!1256 k0!2524) (size!7337 a!3312)))))))

(declare-fun e!184523 () Bool)

(assert (=> b!291614 (= e!184523 (= (select (arr!6985 (array!14719 (store (arr!6985 a!3312) i!1256 k0!2524) (size!7337 a!3312))) (index!10568 lt!144308)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!291615 () Bool)

(assert (=> b!291615 (and (bvsge (index!10568 lt!144308) #b00000000000000000000000000000000) (bvslt (index!10568 lt!144308) (size!7337 (array!14719 (store (arr!6985 a!3312) i!1256 k0!2524) (size!7337 a!3312)))))))

(declare-fun res!152857 () Bool)

(assert (=> b!291615 (= res!152857 (= (select (arr!6985 (array!14719 (store (arr!6985 a!3312) i!1256 k0!2524) (size!7337 a!3312))) (index!10568 lt!144308)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!291615 (=> res!152857 e!184523)))

(declare-fun b!291617 () Bool)

(declare-fun e!184522 () SeekEntryResult!2099)

(assert (=> b!291617 (= e!184522 (Intermediate!2099 true lt!144212 #b00000000000000000000000000000000))))

(declare-fun e!184524 () SeekEntryResult!2099)

(declare-fun b!291618 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!291618 (= e!184524 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!144212 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!14719 (store (arr!6985 a!3312) i!1256 k0!2524) (size!7337 a!3312)) mask!3809))))

(declare-fun b!291619 () Bool)

(declare-fun e!184525 () Bool)

(declare-fun e!184521 () Bool)

(assert (=> b!291619 (= e!184525 e!184521)))

(declare-fun res!152855 () Bool)

(assert (=> b!291619 (= res!152855 (and ((_ is Intermediate!2099) lt!144308) (not (undefined!2911 lt!144308)) (bvslt (x!28862 lt!144308) #b01111111111111111111111111111110) (bvsge (x!28862 lt!144308) #b00000000000000000000000000000000) (bvsge (x!28862 lt!144308) #b00000000000000000000000000000000)))))

(assert (=> b!291619 (=> (not res!152855) (not e!184521))))

(declare-fun b!291620 () Bool)

(assert (=> b!291620 (and (bvsge (index!10568 lt!144308) #b00000000000000000000000000000000) (bvslt (index!10568 lt!144308) (size!7337 (array!14719 (store (arr!6985 a!3312) i!1256 k0!2524) (size!7337 a!3312)))))))

(declare-fun res!152856 () Bool)

(assert (=> b!291620 (= res!152856 (= (select (arr!6985 (array!14719 (store (arr!6985 a!3312) i!1256 k0!2524) (size!7337 a!3312))) (index!10568 lt!144308)) k0!2524))))

(assert (=> b!291620 (=> res!152856 e!184523)))

(assert (=> b!291620 (= e!184521 e!184523)))

(declare-fun d!66447 () Bool)

(assert (=> d!66447 e!184525))

(declare-fun c!46944 () Bool)

(assert (=> d!66447 (= c!46944 (and ((_ is Intermediate!2099) lt!144308) (undefined!2911 lt!144308)))))

(assert (=> d!66447 (= lt!144308 e!184522)))

(declare-fun c!46945 () Bool)

(assert (=> d!66447 (= c!46945 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!144307 () (_ BitVec 64))

(assert (=> d!66447 (= lt!144307 (select (arr!6985 (array!14719 (store (arr!6985 a!3312) i!1256 k0!2524) (size!7337 a!3312))) lt!144212))))

(assert (=> d!66447 (validMask!0 mask!3809)))

(assert (=> d!66447 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144212 k0!2524 (array!14719 (store (arr!6985 a!3312) i!1256 k0!2524) (size!7337 a!3312)) mask!3809) lt!144308)))

(declare-fun b!291616 () Bool)

(assert (=> b!291616 (= e!184522 e!184524)))

(declare-fun c!46943 () Bool)

(assert (=> b!291616 (= c!46943 (or (= lt!144307 k0!2524) (= (bvadd lt!144307 lt!144307) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!291621 () Bool)

(assert (=> b!291621 (= e!184524 (Intermediate!2099 false lt!144212 #b00000000000000000000000000000000))))

(declare-fun b!291622 () Bool)

(assert (=> b!291622 (= e!184525 (bvsge (x!28862 lt!144308) #b01111111111111111111111111111110))))

(assert (= (and d!66447 c!46945) b!291617))

(assert (= (and d!66447 (not c!46945)) b!291616))

(assert (= (and b!291616 c!46943) b!291621))

(assert (= (and b!291616 (not c!46943)) b!291618))

(assert (= (and d!66447 c!46944) b!291622))

(assert (= (and d!66447 (not c!46944)) b!291619))

(assert (= (and b!291619 res!152855) b!291620))

(assert (= (and b!291620 (not res!152856)) b!291615))

(assert (= (and b!291615 (not res!152857)) b!291614))

(declare-fun m!305665 () Bool)

(assert (=> b!291618 m!305665))

(assert (=> b!291618 m!305665))

(declare-fun m!305667 () Bool)

(assert (=> b!291618 m!305667))

(declare-fun m!305669 () Bool)

(assert (=> b!291620 m!305669))

(assert (=> b!291615 m!305669))

(declare-fun m!305671 () Bool)

(assert (=> d!66447 m!305671))

(assert (=> d!66447 m!305535))

(assert (=> b!291614 m!305669))

(assert (=> b!291432 d!66447))

(declare-fun b!291623 () Bool)

(declare-fun lt!144310 () SeekEntryResult!2099)

(assert (=> b!291623 (and (bvsge (index!10568 lt!144310) #b00000000000000000000000000000000) (bvslt (index!10568 lt!144310) (size!7337 a!3312)))))

(declare-fun e!184528 () Bool)

(assert (=> b!291623 (= e!184528 (= (select (arr!6985 a!3312) (index!10568 lt!144310)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!291624 () Bool)

(assert (=> b!291624 (and (bvsge (index!10568 lt!144310) #b00000000000000000000000000000000) (bvslt (index!10568 lt!144310) (size!7337 a!3312)))))

(declare-fun res!152860 () Bool)

(assert (=> b!291624 (= res!152860 (= (select (arr!6985 a!3312) (index!10568 lt!144310)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!291624 (=> res!152860 e!184528)))

(declare-fun b!291626 () Bool)

(declare-fun e!184527 () SeekEntryResult!2099)

(assert (=> b!291626 (= e!184527 (Intermediate!2099 true lt!144212 #b00000000000000000000000000000000))))

(declare-fun b!291627 () Bool)

(declare-fun e!184529 () SeekEntryResult!2099)

(assert (=> b!291627 (= e!184529 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!144212 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!291628 () Bool)

(declare-fun e!184530 () Bool)

(declare-fun e!184526 () Bool)

(assert (=> b!291628 (= e!184530 e!184526)))

(declare-fun res!152858 () Bool)

(assert (=> b!291628 (= res!152858 (and ((_ is Intermediate!2099) lt!144310) (not (undefined!2911 lt!144310)) (bvslt (x!28862 lt!144310) #b01111111111111111111111111111110) (bvsge (x!28862 lt!144310) #b00000000000000000000000000000000) (bvsge (x!28862 lt!144310) #b00000000000000000000000000000000)))))

(assert (=> b!291628 (=> (not res!152858) (not e!184526))))

(declare-fun b!291629 () Bool)

(assert (=> b!291629 (and (bvsge (index!10568 lt!144310) #b00000000000000000000000000000000) (bvslt (index!10568 lt!144310) (size!7337 a!3312)))))

(declare-fun res!152859 () Bool)

(assert (=> b!291629 (= res!152859 (= (select (arr!6985 a!3312) (index!10568 lt!144310)) k0!2524))))

(assert (=> b!291629 (=> res!152859 e!184528)))

(assert (=> b!291629 (= e!184526 e!184528)))

(declare-fun d!66461 () Bool)

(assert (=> d!66461 e!184530))

(declare-fun c!46947 () Bool)

(assert (=> d!66461 (= c!46947 (and ((_ is Intermediate!2099) lt!144310) (undefined!2911 lt!144310)))))

(assert (=> d!66461 (= lt!144310 e!184527)))

(declare-fun c!46948 () Bool)

(assert (=> d!66461 (= c!46948 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!144309 () (_ BitVec 64))

(assert (=> d!66461 (= lt!144309 (select (arr!6985 a!3312) lt!144212))))

(assert (=> d!66461 (validMask!0 mask!3809)))

(assert (=> d!66461 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144212 k0!2524 a!3312 mask!3809) lt!144310)))

(declare-fun b!291625 () Bool)

(assert (=> b!291625 (= e!184527 e!184529)))

(declare-fun c!46946 () Bool)

(assert (=> b!291625 (= c!46946 (or (= lt!144309 k0!2524) (= (bvadd lt!144309 lt!144309) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!291630 () Bool)

(assert (=> b!291630 (= e!184529 (Intermediate!2099 false lt!144212 #b00000000000000000000000000000000))))

(declare-fun b!291631 () Bool)

(assert (=> b!291631 (= e!184530 (bvsge (x!28862 lt!144310) #b01111111111111111111111111111110))))

(assert (= (and d!66461 c!46948) b!291626))

(assert (= (and d!66461 (not c!46948)) b!291625))

(assert (= (and b!291625 c!46946) b!291630))

(assert (= (and b!291625 (not c!46946)) b!291627))

(assert (= (and d!66461 c!46947) b!291631))

(assert (= (and d!66461 (not c!46947)) b!291628))

(assert (= (and b!291628 res!152858) b!291629))

(assert (= (and b!291629 (not res!152859)) b!291624))

(assert (= (and b!291624 (not res!152860)) b!291623))

(assert (=> b!291627 m!305665))

(assert (=> b!291627 m!305665))

(declare-fun m!305673 () Bool)

(assert (=> b!291627 m!305673))

(declare-fun m!305675 () Bool)

(assert (=> b!291629 m!305675))

(assert (=> b!291624 m!305675))

(declare-fun m!305677 () Bool)

(assert (=> d!66461 m!305677))

(assert (=> d!66461 m!305535))

(assert (=> b!291623 m!305675))

(assert (=> b!291432 d!66461))

(declare-fun d!66463 () Bool)

(declare-fun lt!144316 () (_ BitVec 32))

(declare-fun lt!144315 () (_ BitVec 32))

(assert (=> d!66463 (= lt!144316 (bvmul (bvxor lt!144315 (bvlshr lt!144315 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66463 (= lt!144315 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66463 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!152861 (let ((h!5175 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28868 (bvmul (bvxor h!5175 (bvlshr h!5175 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28868 (bvlshr x!28868 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!152861 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!152861 #b00000000000000000000000000000000))))))

(assert (=> d!66463 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!144316 (bvlshr lt!144316 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!291432 d!66463))

(check-sat (not b!291559) (not d!66447) (not b!291498) (not b!291549) (not b!291627) (not b!291499) (not b!291618) (not d!66431) (not bm!25630) (not d!66461))
(check-sat)
