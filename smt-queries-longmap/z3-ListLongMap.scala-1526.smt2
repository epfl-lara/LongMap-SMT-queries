; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28726 () Bool)

(assert start!28726)

(declare-fun b!293462 () Bool)

(declare-fun res!154352 () Bool)

(declare-fun e!185561 () Bool)

(assert (=> b!293462 (=> (not res!154352) (not e!185561))))

(declare-datatypes ((array!14865 0))(
  ( (array!14866 (arr!7054 (Array (_ BitVec 32) (_ BitVec 64))) (size!7406 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14865)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14865 (_ BitVec 32)) Bool)

(assert (=> b!293462 (= res!154352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-datatypes ((SeekEntryResult!2168 0))(
  ( (MissingZero!2168 (index!10842 (_ BitVec 32))) (Found!2168 (index!10843 (_ BitVec 32))) (Intermediate!2168 (undefined!2980 Bool) (index!10844 (_ BitVec 32)) (x!29133 (_ BitVec 32))) (Undefined!2168) (MissingVacant!2168 (index!10845 (_ BitVec 32))) )
))
(declare-fun lt!145500 () SeekEntryResult!2168)

(declare-fun lt!145498 () Bool)

(declare-fun b!293463 () Bool)

(get-info :version)

(assert (=> b!293463 (= e!185561 (and lt!145498 (let ((bdg!6217 (not ((_ is Intermediate!2168) lt!145500)))) (and (or bdg!6217 (not (undefined!2980 lt!145500))) (not bdg!6217) (or (bvslt (index!10844 lt!145500) #b00000000000000000000000000000000) (bvsge (index!10844 lt!145500) (size!7406 a!3312)))))))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!145499 () SeekEntryResult!2168)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun lt!145497 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14865 (_ BitVec 32)) SeekEntryResult!2168)

(assert (=> b!293463 (= lt!145499 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145497 k0!2524 (array!14866 (store (arr!7054 a!3312) i!1256 k0!2524) (size!7406 a!3312)) mask!3809))))

(assert (=> b!293463 (= lt!145500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145497 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293463 (= lt!145497 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!154356 () Bool)

(declare-fun e!185559 () Bool)

(assert (=> start!28726 (=> (not res!154356) (not e!185559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28726 (= res!154356 (validMask!0 mask!3809))))

(assert (=> start!28726 e!185559))

(assert (=> start!28726 true))

(declare-fun array_inv!5004 (array!14865) Bool)

(assert (=> start!28726 (array_inv!5004 a!3312)))

(declare-fun b!293464 () Bool)

(declare-fun res!154354 () Bool)

(assert (=> b!293464 (=> (not res!154354) (not e!185559))))

(declare-fun arrayContainsKey!0 (array!14865 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!293464 (= res!154354 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!293465 () Bool)

(assert (=> b!293465 (= e!185559 e!185561)))

(declare-fun res!154355 () Bool)

(assert (=> b!293465 (=> (not res!154355) (not e!185561))))

(declare-fun lt!145496 () SeekEntryResult!2168)

(assert (=> b!293465 (= res!154355 (or lt!145498 (= lt!145496 (MissingVacant!2168 i!1256))))))

(assert (=> b!293465 (= lt!145498 (= lt!145496 (MissingZero!2168 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14865 (_ BitVec 32)) SeekEntryResult!2168)

(assert (=> b!293465 (= lt!145496 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!293466 () Bool)

(declare-fun res!154351 () Bool)

(assert (=> b!293466 (=> (not res!154351) (not e!185559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!293466 (= res!154351 (validKeyInArray!0 k0!2524))))

(declare-fun b!293467 () Bool)

(declare-fun res!154353 () Bool)

(assert (=> b!293467 (=> (not res!154353) (not e!185559))))

(assert (=> b!293467 (= res!154353 (and (= (size!7406 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7406 a!3312))))))

(assert (= (and start!28726 res!154356) b!293467))

(assert (= (and b!293467 res!154353) b!293466))

(assert (= (and b!293466 res!154351) b!293464))

(assert (= (and b!293464 res!154354) b!293465))

(assert (= (and b!293465 res!154355) b!293462))

(assert (= (and b!293462 res!154352) b!293463))

(declare-fun m!307331 () Bool)

(assert (=> b!293466 m!307331))

(declare-fun m!307333 () Bool)

(assert (=> start!28726 m!307333))

(declare-fun m!307335 () Bool)

(assert (=> start!28726 m!307335))

(declare-fun m!307337 () Bool)

(assert (=> b!293464 m!307337))

(declare-fun m!307339 () Bool)

(assert (=> b!293463 m!307339))

(declare-fun m!307341 () Bool)

(assert (=> b!293463 m!307341))

(declare-fun m!307343 () Bool)

(assert (=> b!293463 m!307343))

(declare-fun m!307345 () Bool)

(assert (=> b!293463 m!307345))

(declare-fun m!307347 () Bool)

(assert (=> b!293465 m!307347))

(declare-fun m!307349 () Bool)

(assert (=> b!293462 m!307349))

(check-sat (not b!293462) (not b!293463) (not start!28726) (not b!293465) (not b!293464) (not b!293466))
(check-sat)
(get-model)

(declare-fun d!66629 () Bool)

(assert (=> d!66629 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28726 d!66629))

(declare-fun d!66631 () Bool)

(assert (=> d!66631 (= (array_inv!5004 a!3312) (bvsge (size!7406 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28726 d!66631))

(declare-fun d!66633 () Bool)

(assert (=> d!66633 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!293466 d!66633))

(declare-fun b!293520 () Bool)

(declare-fun e!185590 () SeekEntryResult!2168)

(declare-fun lt!145538 () SeekEntryResult!2168)

(assert (=> b!293520 (= e!185590 (Found!2168 (index!10844 lt!145538)))))

(declare-fun b!293521 () Bool)

(declare-fun e!185591 () SeekEntryResult!2168)

(assert (=> b!293521 (= e!185591 e!185590)))

(declare-fun lt!145539 () (_ BitVec 64))

(assert (=> b!293521 (= lt!145539 (select (arr!7054 a!3312) (index!10844 lt!145538)))))

(declare-fun c!47130 () Bool)

(assert (=> b!293521 (= c!47130 (= lt!145539 k0!2524))))

(declare-fun b!293522 () Bool)

(assert (=> b!293522 (= e!185591 Undefined!2168)))

(declare-fun d!66635 () Bool)

(declare-fun lt!145537 () SeekEntryResult!2168)

(assert (=> d!66635 (and (or ((_ is Undefined!2168) lt!145537) (not ((_ is Found!2168) lt!145537)) (and (bvsge (index!10843 lt!145537) #b00000000000000000000000000000000) (bvslt (index!10843 lt!145537) (size!7406 a!3312)))) (or ((_ is Undefined!2168) lt!145537) ((_ is Found!2168) lt!145537) (not ((_ is MissingZero!2168) lt!145537)) (and (bvsge (index!10842 lt!145537) #b00000000000000000000000000000000) (bvslt (index!10842 lt!145537) (size!7406 a!3312)))) (or ((_ is Undefined!2168) lt!145537) ((_ is Found!2168) lt!145537) ((_ is MissingZero!2168) lt!145537) (not ((_ is MissingVacant!2168) lt!145537)) (and (bvsge (index!10845 lt!145537) #b00000000000000000000000000000000) (bvslt (index!10845 lt!145537) (size!7406 a!3312)))) (or ((_ is Undefined!2168) lt!145537) (ite ((_ is Found!2168) lt!145537) (= (select (arr!7054 a!3312) (index!10843 lt!145537)) k0!2524) (ite ((_ is MissingZero!2168) lt!145537) (= (select (arr!7054 a!3312) (index!10842 lt!145537)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2168) lt!145537) (= (select (arr!7054 a!3312) (index!10845 lt!145537)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66635 (= lt!145537 e!185591)))

(declare-fun c!47129 () Bool)

(assert (=> d!66635 (= c!47129 (and ((_ is Intermediate!2168) lt!145538) (undefined!2980 lt!145538)))))

(assert (=> d!66635 (= lt!145538 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66635 (validMask!0 mask!3809)))

(assert (=> d!66635 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!145537)))

(declare-fun b!293523 () Bool)

(declare-fun c!47131 () Bool)

(assert (=> b!293523 (= c!47131 (= lt!145539 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185592 () SeekEntryResult!2168)

(assert (=> b!293523 (= e!185590 e!185592)))

(declare-fun b!293524 () Bool)

(assert (=> b!293524 (= e!185592 (MissingZero!2168 (index!10844 lt!145538)))))

(declare-fun b!293525 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14865 (_ BitVec 32)) SeekEntryResult!2168)

(assert (=> b!293525 (= e!185592 (seekKeyOrZeroReturnVacant!0 (x!29133 lt!145538) (index!10844 lt!145538) (index!10844 lt!145538) k0!2524 a!3312 mask!3809))))

(assert (= (and d!66635 c!47129) b!293522))

(assert (= (and d!66635 (not c!47129)) b!293521))

(assert (= (and b!293521 c!47130) b!293520))

(assert (= (and b!293521 (not c!47130)) b!293523))

(assert (= (and b!293523 c!47131) b!293524))

(assert (= (and b!293523 (not c!47131)) b!293525))

(declare-fun m!307395 () Bool)

(assert (=> b!293521 m!307395))

(assert (=> d!66635 m!307333))

(declare-fun m!307397 () Bool)

(assert (=> d!66635 m!307397))

(declare-fun m!307399 () Bool)

(assert (=> d!66635 m!307399))

(assert (=> d!66635 m!307345))

(declare-fun m!307401 () Bool)

(assert (=> d!66635 m!307401))

(declare-fun m!307403 () Bool)

(assert (=> d!66635 m!307403))

(assert (=> d!66635 m!307345))

(declare-fun m!307405 () Bool)

(assert (=> b!293525 m!307405))

(assert (=> b!293465 d!66635))

(declare-fun b!293586 () Bool)

(declare-fun e!185626 () SeekEntryResult!2168)

(assert (=> b!293586 (= e!185626 (Intermediate!2168 false lt!145497 #b00000000000000000000000000000000))))

(declare-fun b!293587 () Bool)

(declare-fun lt!145557 () SeekEntryResult!2168)

(assert (=> b!293587 (and (bvsge (index!10844 lt!145557) #b00000000000000000000000000000000) (bvslt (index!10844 lt!145557) (size!7406 (array!14866 (store (arr!7054 a!3312) i!1256 k0!2524) (size!7406 a!3312)))))))

(declare-fun res!154416 () Bool)

(assert (=> b!293587 (= res!154416 (= (select (arr!7054 (array!14866 (store (arr!7054 a!3312) i!1256 k0!2524) (size!7406 a!3312))) (index!10844 lt!145557)) k0!2524))))

(declare-fun e!185628 () Bool)

(assert (=> b!293587 (=> res!154416 e!185628)))

(declare-fun e!185630 () Bool)

(assert (=> b!293587 (= e!185630 e!185628)))

(declare-fun b!293588 () Bool)

(declare-fun e!185629 () SeekEntryResult!2168)

(assert (=> b!293588 (= e!185629 e!185626)))

(declare-fun c!47153 () Bool)

(declare-fun lt!145556 () (_ BitVec 64))

(assert (=> b!293588 (= c!47153 (or (= lt!145556 k0!2524) (= (bvadd lt!145556 lt!145556) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293589 () Bool)

(assert (=> b!293589 (and (bvsge (index!10844 lt!145557) #b00000000000000000000000000000000) (bvslt (index!10844 lt!145557) (size!7406 (array!14866 (store (arr!7054 a!3312) i!1256 k0!2524) (size!7406 a!3312)))))))

(declare-fun res!154415 () Bool)

(assert (=> b!293589 (= res!154415 (= (select (arr!7054 (array!14866 (store (arr!7054 a!3312) i!1256 k0!2524) (size!7406 a!3312))) (index!10844 lt!145557)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293589 (=> res!154415 e!185628)))

(declare-fun b!293590 () Bool)

(assert (=> b!293590 (and (bvsge (index!10844 lt!145557) #b00000000000000000000000000000000) (bvslt (index!10844 lt!145557) (size!7406 (array!14866 (store (arr!7054 a!3312) i!1256 k0!2524) (size!7406 a!3312)))))))

(assert (=> b!293590 (= e!185628 (= (select (arr!7054 (array!14866 (store (arr!7054 a!3312) i!1256 k0!2524) (size!7406 a!3312))) (index!10844 lt!145557)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!293591 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293591 (= e!185626 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!14866 (store (arr!7054 a!3312) i!1256 k0!2524) (size!7406 a!3312)) mask!3809))))

(declare-fun d!66643 () Bool)

(declare-fun e!185627 () Bool)

(assert (=> d!66643 e!185627))

(declare-fun c!47155 () Bool)

(assert (=> d!66643 (= c!47155 (and ((_ is Intermediate!2168) lt!145557) (undefined!2980 lt!145557)))))

(assert (=> d!66643 (= lt!145557 e!185629)))

(declare-fun c!47154 () Bool)

(assert (=> d!66643 (= c!47154 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66643 (= lt!145556 (select (arr!7054 (array!14866 (store (arr!7054 a!3312) i!1256 k0!2524) (size!7406 a!3312))) lt!145497))))

(assert (=> d!66643 (validMask!0 mask!3809)))

(assert (=> d!66643 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145497 k0!2524 (array!14866 (store (arr!7054 a!3312) i!1256 k0!2524) (size!7406 a!3312)) mask!3809) lt!145557)))

(declare-fun b!293585 () Bool)

(assert (=> b!293585 (= e!185627 (bvsge (x!29133 lt!145557) #b01111111111111111111111111111110))))

(declare-fun b!293592 () Bool)

(assert (=> b!293592 (= e!185629 (Intermediate!2168 true lt!145497 #b00000000000000000000000000000000))))

(declare-fun b!293593 () Bool)

(assert (=> b!293593 (= e!185627 e!185630)))

(declare-fun res!154414 () Bool)

(assert (=> b!293593 (= res!154414 (and ((_ is Intermediate!2168) lt!145557) (not (undefined!2980 lt!145557)) (bvslt (x!29133 lt!145557) #b01111111111111111111111111111110) (bvsge (x!29133 lt!145557) #b00000000000000000000000000000000) (bvsge (x!29133 lt!145557) #b00000000000000000000000000000000)))))

(assert (=> b!293593 (=> (not res!154414) (not e!185630))))

(assert (= (and d!66643 c!47154) b!293592))

(assert (= (and d!66643 (not c!47154)) b!293588))

(assert (= (and b!293588 c!47153) b!293586))

(assert (= (and b!293588 (not c!47153)) b!293591))

(assert (= (and d!66643 c!47155) b!293585))

(assert (= (and d!66643 (not c!47155)) b!293593))

(assert (= (and b!293593 res!154414) b!293587))

(assert (= (and b!293587 (not res!154416)) b!293589))

(assert (= (and b!293589 (not res!154415)) b!293590))

(declare-fun m!307415 () Bool)

(assert (=> b!293587 m!307415))

(assert (=> b!293589 m!307415))

(declare-fun m!307417 () Bool)

(assert (=> d!66643 m!307417))

(assert (=> d!66643 m!307333))

(declare-fun m!307419 () Bool)

(assert (=> b!293591 m!307419))

(assert (=> b!293591 m!307419))

(declare-fun m!307425 () Bool)

(assert (=> b!293591 m!307425))

(assert (=> b!293590 m!307415))

(assert (=> b!293463 d!66643))

(declare-fun b!293610 () Bool)

(declare-fun e!185639 () SeekEntryResult!2168)

(assert (=> b!293610 (= e!185639 (Intermediate!2168 false lt!145497 #b00000000000000000000000000000000))))

(declare-fun b!293611 () Bool)

(declare-fun lt!145564 () SeekEntryResult!2168)

(assert (=> b!293611 (and (bvsge (index!10844 lt!145564) #b00000000000000000000000000000000) (bvslt (index!10844 lt!145564) (size!7406 a!3312)))))

(declare-fun res!154422 () Bool)

(assert (=> b!293611 (= res!154422 (= (select (arr!7054 a!3312) (index!10844 lt!145564)) k0!2524))))

(declare-fun e!185641 () Bool)

(assert (=> b!293611 (=> res!154422 e!185641)))

(declare-fun e!185643 () Bool)

(assert (=> b!293611 (= e!185643 e!185641)))

(declare-fun b!293612 () Bool)

(declare-fun e!185642 () SeekEntryResult!2168)

(assert (=> b!293612 (= e!185642 e!185639)))

(declare-fun c!47162 () Bool)

(declare-fun lt!145563 () (_ BitVec 64))

(assert (=> b!293612 (= c!47162 (or (= lt!145563 k0!2524) (= (bvadd lt!145563 lt!145563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293613 () Bool)

(assert (=> b!293613 (and (bvsge (index!10844 lt!145564) #b00000000000000000000000000000000) (bvslt (index!10844 lt!145564) (size!7406 a!3312)))))

(declare-fun res!154421 () Bool)

(assert (=> b!293613 (= res!154421 (= (select (arr!7054 a!3312) (index!10844 lt!145564)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293613 (=> res!154421 e!185641)))

(declare-fun b!293614 () Bool)

(assert (=> b!293614 (and (bvsge (index!10844 lt!145564) #b00000000000000000000000000000000) (bvslt (index!10844 lt!145564) (size!7406 a!3312)))))

(assert (=> b!293614 (= e!185641 (= (select (arr!7054 a!3312) (index!10844 lt!145564)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!293615 () Bool)

(assert (=> b!293615 (= e!185639 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun d!66647 () Bool)

(declare-fun e!185640 () Bool)

(assert (=> d!66647 e!185640))

(declare-fun c!47164 () Bool)

(assert (=> d!66647 (= c!47164 (and ((_ is Intermediate!2168) lt!145564) (undefined!2980 lt!145564)))))

(assert (=> d!66647 (= lt!145564 e!185642)))

(declare-fun c!47163 () Bool)

(assert (=> d!66647 (= c!47163 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66647 (= lt!145563 (select (arr!7054 a!3312) lt!145497))))

(assert (=> d!66647 (validMask!0 mask!3809)))

(assert (=> d!66647 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145497 k0!2524 a!3312 mask!3809) lt!145564)))

(declare-fun b!293609 () Bool)

(assert (=> b!293609 (= e!185640 (bvsge (x!29133 lt!145564) #b01111111111111111111111111111110))))

(declare-fun b!293616 () Bool)

(assert (=> b!293616 (= e!185642 (Intermediate!2168 true lt!145497 #b00000000000000000000000000000000))))

(declare-fun b!293617 () Bool)

(assert (=> b!293617 (= e!185640 e!185643)))

(declare-fun res!154420 () Bool)

(assert (=> b!293617 (= res!154420 (and ((_ is Intermediate!2168) lt!145564) (not (undefined!2980 lt!145564)) (bvslt (x!29133 lt!145564) #b01111111111111111111111111111110) (bvsge (x!29133 lt!145564) #b00000000000000000000000000000000) (bvsge (x!29133 lt!145564) #b00000000000000000000000000000000)))))

(assert (=> b!293617 (=> (not res!154420) (not e!185643))))

(assert (= (and d!66647 c!47163) b!293616))

(assert (= (and d!66647 (not c!47163)) b!293612))

(assert (= (and b!293612 c!47162) b!293610))

(assert (= (and b!293612 (not c!47162)) b!293615))

(assert (= (and d!66647 c!47164) b!293609))

(assert (= (and d!66647 (not c!47164)) b!293617))

(assert (= (and b!293617 res!154420) b!293611))

(assert (= (and b!293611 (not res!154422)) b!293613))

(assert (= (and b!293613 (not res!154421)) b!293614))

(declare-fun m!307441 () Bool)

(assert (=> b!293611 m!307441))

(assert (=> b!293613 m!307441))

(declare-fun m!307443 () Bool)

(assert (=> d!66647 m!307443))

(assert (=> d!66647 m!307333))

(assert (=> b!293615 m!307419))

(assert (=> b!293615 m!307419))

(declare-fun m!307445 () Bool)

(assert (=> b!293615 m!307445))

(assert (=> b!293614 m!307441))

(assert (=> b!293463 d!66647))

(declare-fun d!66653 () Bool)

(declare-fun lt!145582 () (_ BitVec 32))

(declare-fun lt!145581 () (_ BitVec 32))

(assert (=> d!66653 (= lt!145582 (bvmul (bvxor lt!145581 (bvlshr lt!145581 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66653 (= lt!145581 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66653 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154424 (let ((h!5184 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29139 (bvmul (bvxor h!5184 (bvlshr h!5184 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29139 (bvlshr x!29139 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154424 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154424 #b00000000000000000000000000000000))))))

(assert (=> d!66653 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!145582 (bvlshr lt!145582 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!293463 d!66653))

(declare-fun d!66657 () Bool)

(declare-fun res!154435 () Bool)

(declare-fun e!185657 () Bool)

(assert (=> d!66657 (=> res!154435 e!185657)))

(assert (=> d!66657 (= res!154435 (= (select (arr!7054 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66657 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!185657)))

(declare-fun b!293634 () Bool)

(declare-fun e!185658 () Bool)

(assert (=> b!293634 (= e!185657 e!185658)))

(declare-fun res!154436 () Bool)

(assert (=> b!293634 (=> (not res!154436) (not e!185658))))

(assert (=> b!293634 (= res!154436 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7406 a!3312)))))

(declare-fun b!293635 () Bool)

(assert (=> b!293635 (= e!185658 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66657 (not res!154435)) b!293634))

(assert (= (and b!293634 res!154436) b!293635))

(declare-fun m!307457 () Bool)

(assert (=> d!66657 m!307457))

(declare-fun m!307459 () Bool)

(assert (=> b!293635 m!307459))

(assert (=> b!293464 d!66657))

(declare-fun b!293644 () Bool)

(declare-fun e!185666 () Bool)

(declare-fun e!185665 () Bool)

(assert (=> b!293644 (= e!185666 e!185665)))

(declare-fun c!47170 () Bool)

(assert (=> b!293644 (= c!47170 (validKeyInArray!0 (select (arr!7054 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!293645 () Bool)

(declare-fun e!185667 () Bool)

(declare-fun call!25663 () Bool)

(assert (=> b!293645 (= e!185667 call!25663)))

(declare-fun b!293646 () Bool)

(assert (=> b!293646 (= e!185665 call!25663)))

(declare-fun b!293647 () Bool)

(assert (=> b!293647 (= e!185665 e!185667)))

(declare-fun lt!145592 () (_ BitVec 64))

(assert (=> b!293647 (= lt!145592 (select (arr!7054 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9154 0))(
  ( (Unit!9155) )
))
(declare-fun lt!145594 () Unit!9154)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14865 (_ BitVec 64) (_ BitVec 32)) Unit!9154)

(assert (=> b!293647 (= lt!145594 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145592 #b00000000000000000000000000000000))))

(assert (=> b!293647 (arrayContainsKey!0 a!3312 lt!145592 #b00000000000000000000000000000000)))

(declare-fun lt!145593 () Unit!9154)

(assert (=> b!293647 (= lt!145593 lt!145594)))

(declare-fun res!154442 () Bool)

(assert (=> b!293647 (= res!154442 (= (seekEntryOrOpen!0 (select (arr!7054 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2168 #b00000000000000000000000000000000)))))

(assert (=> b!293647 (=> (not res!154442) (not e!185667))))

(declare-fun bm!25660 () Bool)

(assert (=> bm!25660 (= call!25663 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!66661 () Bool)

(declare-fun res!154441 () Bool)

(assert (=> d!66661 (=> res!154441 e!185666)))

(assert (=> d!66661 (= res!154441 (bvsge #b00000000000000000000000000000000 (size!7406 a!3312)))))

(assert (=> d!66661 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!185666)))

(assert (= (and d!66661 (not res!154441)) b!293644))

(assert (= (and b!293644 c!47170) b!293647))

(assert (= (and b!293644 (not c!47170)) b!293646))

(assert (= (and b!293647 res!154442) b!293645))

(assert (= (or b!293645 b!293646) bm!25660))

(assert (=> b!293644 m!307457))

(assert (=> b!293644 m!307457))

(declare-fun m!307461 () Bool)

(assert (=> b!293644 m!307461))

(assert (=> b!293647 m!307457))

(declare-fun m!307463 () Bool)

(assert (=> b!293647 m!307463))

(declare-fun m!307465 () Bool)

(assert (=> b!293647 m!307465))

(assert (=> b!293647 m!307457))

(declare-fun m!307467 () Bool)

(assert (=> b!293647 m!307467))

(declare-fun m!307469 () Bool)

(assert (=> bm!25660 m!307469))

(assert (=> b!293462 d!66661))

(check-sat (not b!293615) (not b!293591) (not d!66647) (not b!293525) (not bm!25660) (not b!293635) (not b!293644) (not d!66643) (not b!293647) (not d!66635))
(check-sat)
