; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28784 () Bool)

(assert start!28784)

(declare-fun b!293538 () Bool)

(declare-fun res!154364 () Bool)

(declare-fun e!185595 () Bool)

(assert (=> b!293538 (=> (not res!154364) (not e!185595))))

(declare-datatypes ((array!14866 0))(
  ( (array!14867 (arr!7053 (Array (_ BitVec 32) (_ BitVec 64))) (size!7406 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14866)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14866 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!293538 (= res!154364 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!154369 () Bool)

(assert (=> start!28784 (=> (not res!154369) (not e!185595))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28784 (= res!154369 (validMask!0 mask!3809))))

(assert (=> start!28784 e!185595))

(assert (=> start!28784 true))

(declare-fun array_inv!5025 (array!14866) Bool)

(assert (=> start!28784 (array_inv!5025 a!3312)))

(declare-fun b!293539 () Bool)

(declare-fun res!154365 () Bool)

(assert (=> b!293539 (=> (not res!154365) (not e!185595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!293539 (= res!154365 (validKeyInArray!0 k0!2524))))

(declare-fun b!293540 () Bool)

(declare-fun res!154366 () Bool)

(declare-fun e!185594 () Bool)

(assert (=> b!293540 (=> (not res!154366) (not e!185594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14866 (_ BitVec 32)) Bool)

(assert (=> b!293540 (= res!154366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun lt!145401 () Bool)

(declare-fun b!293541 () Bool)

(declare-datatypes ((SeekEntryResult!2201 0))(
  ( (MissingZero!2201 (index!10974 (_ BitVec 32))) (Found!2201 (index!10975 (_ BitVec 32))) (Intermediate!2201 (undefined!3013 Bool) (index!10976 (_ BitVec 32)) (x!29179 (_ BitVec 32))) (Undefined!2201) (MissingVacant!2201 (index!10977 (_ BitVec 32))) )
))
(declare-fun lt!145397 () SeekEntryResult!2201)

(get-info :version)

(assert (=> b!293541 (= e!185594 (and lt!145401 (let ((bdg!6223 (not ((_ is Intermediate!2201) lt!145397)))) (and (or bdg!6223 (not (undefined!3013 lt!145397))) (not bdg!6223) (= (select (arr!7053 a!3312) (index!10976 lt!145397)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!145400 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!145399 () SeekEntryResult!2201)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14866 (_ BitVec 32)) SeekEntryResult!2201)

(assert (=> b!293541 (= lt!145399 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145400 k0!2524 (array!14867 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7406 a!3312)) mask!3809))))

(assert (=> b!293541 (= lt!145397 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145400 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293541 (= lt!145400 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!293542 () Bool)

(declare-fun res!154368 () Bool)

(assert (=> b!293542 (=> (not res!154368) (not e!185595))))

(assert (=> b!293542 (= res!154368 (and (= (size!7406 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7406 a!3312))))))

(declare-fun b!293543 () Bool)

(assert (=> b!293543 (= e!185595 e!185594)))

(declare-fun res!154367 () Bool)

(assert (=> b!293543 (=> (not res!154367) (not e!185594))))

(declare-fun lt!145398 () SeekEntryResult!2201)

(assert (=> b!293543 (= res!154367 (or lt!145401 (= lt!145398 (MissingVacant!2201 i!1256))))))

(assert (=> b!293543 (= lt!145401 (= lt!145398 (MissingZero!2201 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14866 (_ BitVec 32)) SeekEntryResult!2201)

(assert (=> b!293543 (= lt!145398 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28784 res!154369) b!293542))

(assert (= (and b!293542 res!154368) b!293539))

(assert (= (and b!293539 res!154365) b!293538))

(assert (= (and b!293538 res!154364) b!293543))

(assert (= (and b!293543 res!154367) b!293540))

(assert (= (and b!293540 res!154366) b!293541))

(declare-fun m!306713 () Bool)

(assert (=> b!293540 m!306713))

(declare-fun m!306715 () Bool)

(assert (=> b!293538 m!306715))

(declare-fun m!306717 () Bool)

(assert (=> b!293543 m!306717))

(declare-fun m!306719 () Bool)

(assert (=> start!28784 m!306719))

(declare-fun m!306721 () Bool)

(assert (=> start!28784 m!306721))

(declare-fun m!306723 () Bool)

(assert (=> b!293541 m!306723))

(declare-fun m!306725 () Bool)

(assert (=> b!293541 m!306725))

(declare-fun m!306727 () Bool)

(assert (=> b!293541 m!306727))

(declare-fun m!306729 () Bool)

(assert (=> b!293541 m!306729))

(declare-fun m!306731 () Bool)

(assert (=> b!293541 m!306731))

(declare-fun m!306733 () Bool)

(assert (=> b!293539 m!306733))

(check-sat (not b!293540) (not b!293543) (not start!28784) (not b!293541) (not b!293539) (not b!293538))
(check-sat)
(get-model)

(declare-fun b!293588 () Bool)

(declare-fun e!185622 () Bool)

(declare-fun e!185620 () Bool)

(assert (=> b!293588 (= e!185622 e!185620)))

(declare-fun lt!145438 () (_ BitVec 64))

(assert (=> b!293588 (= lt!145438 (select (arr!7053 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9142 0))(
  ( (Unit!9143) )
))
(declare-fun lt!145439 () Unit!9142)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14866 (_ BitVec 64) (_ BitVec 32)) Unit!9142)

(assert (=> b!293588 (= lt!145439 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145438 #b00000000000000000000000000000000))))

(assert (=> b!293588 (arrayContainsKey!0 a!3312 lt!145438 #b00000000000000000000000000000000)))

(declare-fun lt!145440 () Unit!9142)

(assert (=> b!293588 (= lt!145440 lt!145439)))

(declare-fun res!154410 () Bool)

(assert (=> b!293588 (= res!154410 (= (seekEntryOrOpen!0 (select (arr!7053 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2201 #b00000000000000000000000000000000)))))

(assert (=> b!293588 (=> (not res!154410) (not e!185620))))

(declare-fun b!293589 () Bool)

(declare-fun e!185621 () Bool)

(assert (=> b!293589 (= e!185621 e!185622)))

(declare-fun c!47158 () Bool)

(assert (=> b!293589 (= c!47158 (validKeyInArray!0 (select (arr!7053 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!293590 () Bool)

(declare-fun call!25657 () Bool)

(assert (=> b!293590 (= e!185620 call!25657)))

(declare-fun b!293591 () Bool)

(assert (=> b!293591 (= e!185622 call!25657)))

(declare-fun bm!25654 () Bool)

(assert (=> bm!25654 (= call!25657 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!66467 () Bool)

(declare-fun res!154411 () Bool)

(assert (=> d!66467 (=> res!154411 e!185621)))

(assert (=> d!66467 (= res!154411 (bvsge #b00000000000000000000000000000000 (size!7406 a!3312)))))

(assert (=> d!66467 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!185621)))

(assert (= (and d!66467 (not res!154411)) b!293589))

(assert (= (and b!293589 c!47158) b!293588))

(assert (= (and b!293589 (not c!47158)) b!293591))

(assert (= (and b!293588 res!154410) b!293590))

(assert (= (or b!293590 b!293591) bm!25654))

(declare-fun m!306779 () Bool)

(assert (=> b!293588 m!306779))

(declare-fun m!306781 () Bool)

(assert (=> b!293588 m!306781))

(declare-fun m!306783 () Bool)

(assert (=> b!293588 m!306783))

(assert (=> b!293588 m!306779))

(declare-fun m!306785 () Bool)

(assert (=> b!293588 m!306785))

(assert (=> b!293589 m!306779))

(assert (=> b!293589 m!306779))

(declare-fun m!306787 () Bool)

(assert (=> b!293589 m!306787))

(declare-fun m!306789 () Bool)

(assert (=> bm!25654 m!306789))

(assert (=> b!293540 d!66467))

(declare-fun d!66469 () Bool)

(declare-fun e!185647 () Bool)

(assert (=> d!66469 e!185647))

(declare-fun c!47168 () Bool)

(declare-fun lt!145452 () SeekEntryResult!2201)

(assert (=> d!66469 (= c!47168 (and ((_ is Intermediate!2201) lt!145452) (undefined!3013 lt!145452)))))

(declare-fun e!185649 () SeekEntryResult!2201)

(assert (=> d!66469 (= lt!145452 e!185649)))

(declare-fun c!47167 () Bool)

(assert (=> d!66469 (= c!47167 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!145451 () (_ BitVec 64))

(assert (=> d!66469 (= lt!145451 (select (arr!7053 (array!14867 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7406 a!3312))) lt!145400))))

(assert (=> d!66469 (validMask!0 mask!3809)))

(assert (=> d!66469 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145400 k0!2524 (array!14867 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7406 a!3312)) mask!3809) lt!145452)))

(declare-fun b!293624 () Bool)

(assert (=> b!293624 (and (bvsge (index!10976 lt!145452) #b00000000000000000000000000000000) (bvslt (index!10976 lt!145452) (size!7406 (array!14867 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7406 a!3312)))))))

(declare-fun res!154430 () Bool)

(assert (=> b!293624 (= res!154430 (= (select (arr!7053 (array!14867 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7406 a!3312))) (index!10976 lt!145452)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185645 () Bool)

(assert (=> b!293624 (=> res!154430 e!185645)))

(declare-fun b!293625 () Bool)

(declare-fun e!185648 () SeekEntryResult!2201)

(assert (=> b!293625 (= e!185648 (Intermediate!2201 false lt!145400 #b00000000000000000000000000000000))))

(declare-fun b!293626 () Bool)

(assert (=> b!293626 (and (bvsge (index!10976 lt!145452) #b00000000000000000000000000000000) (bvslt (index!10976 lt!145452) (size!7406 (array!14867 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7406 a!3312)))))))

(assert (=> b!293626 (= e!185645 (= (select (arr!7053 (array!14867 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7406 a!3312))) (index!10976 lt!145452)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!293627 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!293627 (= e!185648 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145400 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!14867 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7406 a!3312)) mask!3809))))

(declare-fun b!293628 () Bool)

(assert (=> b!293628 (= e!185649 (Intermediate!2201 true lt!145400 #b00000000000000000000000000000000))))

(declare-fun b!293629 () Bool)

(assert (=> b!293629 (and (bvsge (index!10976 lt!145452) #b00000000000000000000000000000000) (bvslt (index!10976 lt!145452) (size!7406 (array!14867 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7406 a!3312)))))))

(declare-fun res!154429 () Bool)

(assert (=> b!293629 (= res!154429 (= (select (arr!7053 (array!14867 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7406 a!3312))) (index!10976 lt!145452)) k0!2524))))

(assert (=> b!293629 (=> res!154429 e!185645)))

(declare-fun e!185646 () Bool)

(assert (=> b!293629 (= e!185646 e!185645)))

(declare-fun b!293630 () Bool)

(assert (=> b!293630 (= e!185647 (bvsge (x!29179 lt!145452) #b01111111111111111111111111111110))))

(declare-fun b!293631 () Bool)

(assert (=> b!293631 (= e!185649 e!185648)))

(declare-fun c!47169 () Bool)

(assert (=> b!293631 (= c!47169 (or (= lt!145451 k0!2524) (= (bvadd lt!145451 lt!145451) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293632 () Bool)

(assert (=> b!293632 (= e!185647 e!185646)))

(declare-fun res!154428 () Bool)

(assert (=> b!293632 (= res!154428 (and ((_ is Intermediate!2201) lt!145452) (not (undefined!3013 lt!145452)) (bvslt (x!29179 lt!145452) #b01111111111111111111111111111110) (bvsge (x!29179 lt!145452) #b00000000000000000000000000000000) (bvsge (x!29179 lt!145452) #b00000000000000000000000000000000)))))

(assert (=> b!293632 (=> (not res!154428) (not e!185646))))

(assert (= (and d!66469 c!47167) b!293628))

(assert (= (and d!66469 (not c!47167)) b!293631))

(assert (= (and b!293631 c!47169) b!293625))

(assert (= (and b!293631 (not c!47169)) b!293627))

(assert (= (and d!66469 c!47168) b!293630))

(assert (= (and d!66469 (not c!47168)) b!293632))

(assert (= (and b!293632 res!154428) b!293629))

(assert (= (and b!293629 (not res!154429)) b!293624))

(assert (= (and b!293624 (not res!154430)) b!293626))

(declare-fun m!306795 () Bool)

(assert (=> b!293629 m!306795))

(assert (=> b!293624 m!306795))

(declare-fun m!306797 () Bool)

(assert (=> d!66469 m!306797))

(assert (=> d!66469 m!306719))

(declare-fun m!306799 () Bool)

(assert (=> b!293627 m!306799))

(assert (=> b!293627 m!306799))

(declare-fun m!306801 () Bool)

(assert (=> b!293627 m!306801))

(assert (=> b!293626 m!306795))

(assert (=> b!293541 d!66469))

(declare-fun d!66477 () Bool)

(declare-fun e!185655 () Bool)

(assert (=> d!66477 e!185655))

(declare-fun c!47172 () Bool)

(declare-fun lt!145457 () SeekEntryResult!2201)

(assert (=> d!66477 (= c!47172 (and ((_ is Intermediate!2201) lt!145457) (undefined!3013 lt!145457)))))

(declare-fun e!185657 () SeekEntryResult!2201)

(assert (=> d!66477 (= lt!145457 e!185657)))

(declare-fun c!47171 () Bool)

(assert (=> d!66477 (= c!47171 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!145456 () (_ BitVec 64))

(assert (=> d!66477 (= lt!145456 (select (arr!7053 a!3312) lt!145400))))

(assert (=> d!66477 (validMask!0 mask!3809)))

(assert (=> d!66477 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145400 k0!2524 a!3312 mask!3809) lt!145457)))

(declare-fun b!293637 () Bool)

(assert (=> b!293637 (and (bvsge (index!10976 lt!145457) #b00000000000000000000000000000000) (bvslt (index!10976 lt!145457) (size!7406 a!3312)))))

(declare-fun res!154435 () Bool)

(assert (=> b!293637 (= res!154435 (= (select (arr!7053 a!3312) (index!10976 lt!145457)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185653 () Bool)

(assert (=> b!293637 (=> res!154435 e!185653)))

(declare-fun b!293638 () Bool)

(declare-fun e!185656 () SeekEntryResult!2201)

(assert (=> b!293638 (= e!185656 (Intermediate!2201 false lt!145400 #b00000000000000000000000000000000))))

(declare-fun b!293639 () Bool)

(assert (=> b!293639 (and (bvsge (index!10976 lt!145457) #b00000000000000000000000000000000) (bvslt (index!10976 lt!145457) (size!7406 a!3312)))))

(assert (=> b!293639 (= e!185653 (= (select (arr!7053 a!3312) (index!10976 lt!145457)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!293640 () Bool)

(assert (=> b!293640 (= e!185656 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145400 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!293641 () Bool)

(assert (=> b!293641 (= e!185657 (Intermediate!2201 true lt!145400 #b00000000000000000000000000000000))))

(declare-fun b!293642 () Bool)

(assert (=> b!293642 (and (bvsge (index!10976 lt!145457) #b00000000000000000000000000000000) (bvslt (index!10976 lt!145457) (size!7406 a!3312)))))

(declare-fun res!154434 () Bool)

(assert (=> b!293642 (= res!154434 (= (select (arr!7053 a!3312) (index!10976 lt!145457)) k0!2524))))

(assert (=> b!293642 (=> res!154434 e!185653)))

(declare-fun e!185654 () Bool)

(assert (=> b!293642 (= e!185654 e!185653)))

(declare-fun b!293643 () Bool)

(assert (=> b!293643 (= e!185655 (bvsge (x!29179 lt!145457) #b01111111111111111111111111111110))))

(declare-fun b!293644 () Bool)

(assert (=> b!293644 (= e!185657 e!185656)))

(declare-fun c!47173 () Bool)

(assert (=> b!293644 (= c!47173 (or (= lt!145456 k0!2524) (= (bvadd lt!145456 lt!145456) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293645 () Bool)

(assert (=> b!293645 (= e!185655 e!185654)))

(declare-fun res!154433 () Bool)

(assert (=> b!293645 (= res!154433 (and ((_ is Intermediate!2201) lt!145457) (not (undefined!3013 lt!145457)) (bvslt (x!29179 lt!145457) #b01111111111111111111111111111110) (bvsge (x!29179 lt!145457) #b00000000000000000000000000000000) (bvsge (x!29179 lt!145457) #b00000000000000000000000000000000)))))

(assert (=> b!293645 (=> (not res!154433) (not e!185654))))

(assert (= (and d!66477 c!47171) b!293641))

(assert (= (and d!66477 (not c!47171)) b!293644))

(assert (= (and b!293644 c!47173) b!293638))

(assert (= (and b!293644 (not c!47173)) b!293640))

(assert (= (and d!66477 c!47172) b!293643))

(assert (= (and d!66477 (not c!47172)) b!293645))

(assert (= (and b!293645 res!154433) b!293642))

(assert (= (and b!293642 (not res!154434)) b!293637))

(assert (= (and b!293637 (not res!154435)) b!293639))

(declare-fun m!306815 () Bool)

(assert (=> b!293642 m!306815))

(assert (=> b!293637 m!306815))

(declare-fun m!306817 () Bool)

(assert (=> d!66477 m!306817))

(assert (=> d!66477 m!306719))

(assert (=> b!293640 m!306799))

(assert (=> b!293640 m!306799))

(declare-fun m!306819 () Bool)

(assert (=> b!293640 m!306819))

(assert (=> b!293639 m!306815))

(assert (=> b!293541 d!66477))

(declare-fun d!66481 () Bool)

(declare-fun lt!145463 () (_ BitVec 32))

(declare-fun lt!145462 () (_ BitVec 32))

(assert (=> d!66481 (= lt!145463 (bvmul (bvxor lt!145462 (bvlshr lt!145462 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66481 (= lt!145462 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66481 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154436 (let ((h!5242 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29183 (bvmul (bvxor h!5242 (bvlshr h!5242 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29183 (bvlshr x!29183 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154436 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154436 #b00000000000000000000000000000000))))))

(assert (=> d!66481 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!145463 (bvlshr lt!145463 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!293541 d!66481))

(declare-fun d!66489 () Bool)

(assert (=> d!66489 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!293539 d!66489))

(declare-fun b!293718 () Bool)

(declare-fun e!185700 () SeekEntryResult!2201)

(assert (=> b!293718 (= e!185700 Undefined!2201)))

(declare-fun b!293719 () Bool)

(declare-fun e!185699 () SeekEntryResult!2201)

(declare-fun lt!145487 () SeekEntryResult!2201)

(assert (=> b!293719 (= e!185699 (MissingZero!2201 (index!10976 lt!145487)))))

(declare-fun b!293720 () Bool)

(declare-fun c!47203 () Bool)

(declare-fun lt!145489 () (_ BitVec 64))

(assert (=> b!293720 (= c!47203 (= lt!145489 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185701 () SeekEntryResult!2201)

(assert (=> b!293720 (= e!185701 e!185699)))

(declare-fun b!293721 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14866 (_ BitVec 32)) SeekEntryResult!2201)

(assert (=> b!293721 (= e!185699 (seekKeyOrZeroReturnVacant!0 (x!29179 lt!145487) (index!10976 lt!145487) (index!10976 lt!145487) k0!2524 a!3312 mask!3809))))

(declare-fun b!293722 () Bool)

(assert (=> b!293722 (= e!185701 (Found!2201 (index!10976 lt!145487)))))

(declare-fun b!293723 () Bool)

(assert (=> b!293723 (= e!185700 e!185701)))

(assert (=> b!293723 (= lt!145489 (select (arr!7053 a!3312) (index!10976 lt!145487)))))

(declare-fun c!47202 () Bool)

(assert (=> b!293723 (= c!47202 (= lt!145489 k0!2524))))

(declare-fun d!66491 () Bool)

(declare-fun lt!145488 () SeekEntryResult!2201)

(assert (=> d!66491 (and (or ((_ is Undefined!2201) lt!145488) (not ((_ is Found!2201) lt!145488)) (and (bvsge (index!10975 lt!145488) #b00000000000000000000000000000000) (bvslt (index!10975 lt!145488) (size!7406 a!3312)))) (or ((_ is Undefined!2201) lt!145488) ((_ is Found!2201) lt!145488) (not ((_ is MissingZero!2201) lt!145488)) (and (bvsge (index!10974 lt!145488) #b00000000000000000000000000000000) (bvslt (index!10974 lt!145488) (size!7406 a!3312)))) (or ((_ is Undefined!2201) lt!145488) ((_ is Found!2201) lt!145488) ((_ is MissingZero!2201) lt!145488) (not ((_ is MissingVacant!2201) lt!145488)) (and (bvsge (index!10977 lt!145488) #b00000000000000000000000000000000) (bvslt (index!10977 lt!145488) (size!7406 a!3312)))) (or ((_ is Undefined!2201) lt!145488) (ite ((_ is Found!2201) lt!145488) (= (select (arr!7053 a!3312) (index!10975 lt!145488)) k0!2524) (ite ((_ is MissingZero!2201) lt!145488) (= (select (arr!7053 a!3312) (index!10974 lt!145488)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2201) lt!145488) (= (select (arr!7053 a!3312) (index!10977 lt!145488)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66491 (= lt!145488 e!185700)))

(declare-fun c!47201 () Bool)

(assert (=> d!66491 (= c!47201 (and ((_ is Intermediate!2201) lt!145487) (undefined!3013 lt!145487)))))

(assert (=> d!66491 (= lt!145487 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66491 (validMask!0 mask!3809)))

(assert (=> d!66491 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!145488)))

(assert (= (and d!66491 c!47201) b!293718))

(assert (= (and d!66491 (not c!47201)) b!293723))

(assert (= (and b!293723 c!47202) b!293722))

(assert (= (and b!293723 (not c!47202)) b!293720))

(assert (= (and b!293720 c!47203) b!293719))

(assert (= (and b!293720 (not c!47203)) b!293721))

(declare-fun m!306849 () Bool)

(assert (=> b!293721 m!306849))

(declare-fun m!306851 () Bool)

(assert (=> b!293723 m!306851))

(assert (=> d!66491 m!306731))

(declare-fun m!306853 () Bool)

(assert (=> d!66491 m!306853))

(assert (=> d!66491 m!306719))

(declare-fun m!306855 () Bool)

(assert (=> d!66491 m!306855))

(declare-fun m!306857 () Bool)

(assert (=> d!66491 m!306857))

(assert (=> d!66491 m!306731))

(declare-fun m!306859 () Bool)

(assert (=> d!66491 m!306859))

(assert (=> b!293543 d!66491))

(declare-fun d!66499 () Bool)

(declare-fun res!154464 () Bool)

(declare-fun e!185712 () Bool)

(assert (=> d!66499 (=> res!154464 e!185712)))

(assert (=> d!66499 (= res!154464 (= (select (arr!7053 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66499 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!185712)))

(declare-fun b!293736 () Bool)

(declare-fun e!185713 () Bool)

(assert (=> b!293736 (= e!185712 e!185713)))

(declare-fun res!154465 () Bool)

(assert (=> b!293736 (=> (not res!154465) (not e!185713))))

(assert (=> b!293736 (= res!154465 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7406 a!3312)))))

(declare-fun b!293737 () Bool)

(assert (=> b!293737 (= e!185713 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66499 (not res!154464)) b!293736))

(assert (= (and b!293736 res!154465) b!293737))

(assert (=> d!66499 m!306779))

(declare-fun m!306861 () Bool)

(assert (=> b!293737 m!306861))

(assert (=> b!293538 d!66499))

(declare-fun d!66501 () Bool)

(assert (=> d!66501 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28784 d!66501))

(declare-fun d!66509 () Bool)

(assert (=> d!66509 (= (array_inv!5025 a!3312) (bvsge (size!7406 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28784 d!66509))

(check-sat (not d!66477) (not b!293721) (not b!293589) (not b!293588) (not bm!25654) (not d!66491) (not b!293640) (not b!293627) (not d!66469) (not b!293737))
(check-sat)
(get-model)

(assert (=> d!66469 d!66501))

(declare-fun d!66521 () Bool)

(declare-fun e!185748 () Bool)

(assert (=> d!66521 e!185748))

(declare-fun c!47229 () Bool)

(declare-fun lt!145529 () SeekEntryResult!2201)

(assert (=> d!66521 (= c!47229 (and ((_ is Intermediate!2201) lt!145529) (undefined!3013 lt!145529)))))

(declare-fun e!185750 () SeekEntryResult!2201)

(assert (=> d!66521 (= lt!145529 e!185750)))

(declare-fun c!47228 () Bool)

(assert (=> d!66521 (= c!47228 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!145528 () (_ BitVec 64))

(assert (=> d!66521 (= lt!145528 (select (arr!7053 a!3312) (toIndex!0 k0!2524 mask!3809)))))

(assert (=> d!66521 (validMask!0 mask!3809)))

(assert (=> d!66521 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809) lt!145529)))

(declare-fun b!293796 () Bool)

(assert (=> b!293796 (and (bvsge (index!10976 lt!145529) #b00000000000000000000000000000000) (bvslt (index!10976 lt!145529) (size!7406 a!3312)))))

(declare-fun res!154483 () Bool)

(assert (=> b!293796 (= res!154483 (= (select (arr!7053 a!3312) (index!10976 lt!145529)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185746 () Bool)

(assert (=> b!293796 (=> res!154483 e!185746)))

(declare-fun b!293797 () Bool)

(declare-fun e!185749 () SeekEntryResult!2201)

(assert (=> b!293797 (= e!185749 (Intermediate!2201 false (toIndex!0 k0!2524 mask!3809) #b00000000000000000000000000000000))))

(declare-fun b!293798 () Bool)

(assert (=> b!293798 (and (bvsge (index!10976 lt!145529) #b00000000000000000000000000000000) (bvslt (index!10976 lt!145529) (size!7406 a!3312)))))

(assert (=> b!293798 (= e!185746 (= (select (arr!7053 a!3312) (index!10976 lt!145529)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!293799 () Bool)

(assert (=> b!293799 (= e!185749 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2524 mask!3809) #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!293800 () Bool)

(assert (=> b!293800 (= e!185750 (Intermediate!2201 true (toIndex!0 k0!2524 mask!3809) #b00000000000000000000000000000000))))

(declare-fun b!293801 () Bool)

(assert (=> b!293801 (and (bvsge (index!10976 lt!145529) #b00000000000000000000000000000000) (bvslt (index!10976 lt!145529) (size!7406 a!3312)))))

(declare-fun res!154482 () Bool)

(assert (=> b!293801 (= res!154482 (= (select (arr!7053 a!3312) (index!10976 lt!145529)) k0!2524))))

(assert (=> b!293801 (=> res!154482 e!185746)))

(declare-fun e!185747 () Bool)

(assert (=> b!293801 (= e!185747 e!185746)))

(declare-fun b!293802 () Bool)

(assert (=> b!293802 (= e!185748 (bvsge (x!29179 lt!145529) #b01111111111111111111111111111110))))

(declare-fun b!293803 () Bool)

(assert (=> b!293803 (= e!185750 e!185749)))

(declare-fun c!47230 () Bool)

(assert (=> b!293803 (= c!47230 (or (= lt!145528 k0!2524) (= (bvadd lt!145528 lt!145528) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293804 () Bool)

(assert (=> b!293804 (= e!185748 e!185747)))

(declare-fun res!154481 () Bool)

(assert (=> b!293804 (= res!154481 (and ((_ is Intermediate!2201) lt!145529) (not (undefined!3013 lt!145529)) (bvslt (x!29179 lt!145529) #b01111111111111111111111111111110) (bvsge (x!29179 lt!145529) #b00000000000000000000000000000000) (bvsge (x!29179 lt!145529) #b00000000000000000000000000000000)))))

(assert (=> b!293804 (=> (not res!154481) (not e!185747))))

(assert (= (and d!66521 c!47228) b!293800))

(assert (= (and d!66521 (not c!47228)) b!293803))

(assert (= (and b!293803 c!47230) b!293797))

(assert (= (and b!293803 (not c!47230)) b!293799))

(assert (= (and d!66521 c!47229) b!293802))

(assert (= (and d!66521 (not c!47229)) b!293804))

(assert (= (and b!293804 res!154481) b!293801))

(assert (= (and b!293801 (not res!154482)) b!293796))

(assert (= (and b!293796 (not res!154483)) b!293798))

(declare-fun m!306899 () Bool)

(assert (=> b!293801 m!306899))

(assert (=> b!293796 m!306899))

(assert (=> d!66521 m!306731))

(declare-fun m!306901 () Bool)

(assert (=> d!66521 m!306901))

(assert (=> d!66521 m!306719))

(assert (=> b!293799 m!306731))

(declare-fun m!306903 () Bool)

(assert (=> b!293799 m!306903))

(assert (=> b!293799 m!306903))

(declare-fun m!306905 () Bool)

(assert (=> b!293799 m!306905))

(assert (=> b!293798 m!306899))

(assert (=> d!66491 d!66521))

(assert (=> d!66491 d!66481))

(assert (=> d!66491 d!66501))

(declare-fun d!66523 () Bool)

(assert (=> d!66523 (arrayContainsKey!0 a!3312 lt!145438 #b00000000000000000000000000000000)))

(declare-fun lt!145532 () Unit!9142)

(declare-fun choose!13 (array!14866 (_ BitVec 64) (_ BitVec 32)) Unit!9142)

(assert (=> d!66523 (= lt!145532 (choose!13 a!3312 lt!145438 #b00000000000000000000000000000000))))

(assert (=> d!66523 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!66523 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145438 #b00000000000000000000000000000000) lt!145532)))

(declare-fun bs!10418 () Bool)

(assert (= bs!10418 d!66523))

(assert (=> bs!10418 m!306783))

(declare-fun m!306907 () Bool)

(assert (=> bs!10418 m!306907))

(assert (=> b!293588 d!66523))

(declare-fun d!66525 () Bool)

(declare-fun res!154484 () Bool)

(declare-fun e!185751 () Bool)

(assert (=> d!66525 (=> res!154484 e!185751)))

(assert (=> d!66525 (= res!154484 (= (select (arr!7053 a!3312) #b00000000000000000000000000000000) lt!145438))))

(assert (=> d!66525 (= (arrayContainsKey!0 a!3312 lt!145438 #b00000000000000000000000000000000) e!185751)))

(declare-fun b!293805 () Bool)

(declare-fun e!185752 () Bool)

(assert (=> b!293805 (= e!185751 e!185752)))

(declare-fun res!154485 () Bool)

(assert (=> b!293805 (=> (not res!154485) (not e!185752))))

(assert (=> b!293805 (= res!154485 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7406 a!3312)))))

(declare-fun b!293806 () Bool)

(assert (=> b!293806 (= e!185752 (arrayContainsKey!0 a!3312 lt!145438 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66525 (not res!154484)) b!293805))

(assert (= (and b!293805 res!154485) b!293806))

(assert (=> d!66525 m!306779))

(declare-fun m!306909 () Bool)

(assert (=> b!293806 m!306909))

(assert (=> b!293588 d!66525))

(declare-fun b!293807 () Bool)

(declare-fun e!185754 () SeekEntryResult!2201)

(assert (=> b!293807 (= e!185754 Undefined!2201)))

(declare-fun b!293808 () Bool)

(declare-fun e!185753 () SeekEntryResult!2201)

(declare-fun lt!145533 () SeekEntryResult!2201)

(assert (=> b!293808 (= e!185753 (MissingZero!2201 (index!10976 lt!145533)))))

(declare-fun b!293809 () Bool)

(declare-fun c!47233 () Bool)

(declare-fun lt!145535 () (_ BitVec 64))

(assert (=> b!293809 (= c!47233 (= lt!145535 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185755 () SeekEntryResult!2201)

(assert (=> b!293809 (= e!185755 e!185753)))

(declare-fun b!293810 () Bool)

(assert (=> b!293810 (= e!185753 (seekKeyOrZeroReturnVacant!0 (x!29179 lt!145533) (index!10976 lt!145533) (index!10976 lt!145533) (select (arr!7053 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809))))

(declare-fun b!293811 () Bool)

(assert (=> b!293811 (= e!185755 (Found!2201 (index!10976 lt!145533)))))

(declare-fun b!293812 () Bool)

(assert (=> b!293812 (= e!185754 e!185755)))

(assert (=> b!293812 (= lt!145535 (select (arr!7053 a!3312) (index!10976 lt!145533)))))

(declare-fun c!47232 () Bool)

(assert (=> b!293812 (= c!47232 (= lt!145535 (select (arr!7053 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!66527 () Bool)

(declare-fun lt!145534 () SeekEntryResult!2201)

(assert (=> d!66527 (and (or ((_ is Undefined!2201) lt!145534) (not ((_ is Found!2201) lt!145534)) (and (bvsge (index!10975 lt!145534) #b00000000000000000000000000000000) (bvslt (index!10975 lt!145534) (size!7406 a!3312)))) (or ((_ is Undefined!2201) lt!145534) ((_ is Found!2201) lt!145534) (not ((_ is MissingZero!2201) lt!145534)) (and (bvsge (index!10974 lt!145534) #b00000000000000000000000000000000) (bvslt (index!10974 lt!145534) (size!7406 a!3312)))) (or ((_ is Undefined!2201) lt!145534) ((_ is Found!2201) lt!145534) ((_ is MissingZero!2201) lt!145534) (not ((_ is MissingVacant!2201) lt!145534)) (and (bvsge (index!10977 lt!145534) #b00000000000000000000000000000000) (bvslt (index!10977 lt!145534) (size!7406 a!3312)))) (or ((_ is Undefined!2201) lt!145534) (ite ((_ is Found!2201) lt!145534) (= (select (arr!7053 a!3312) (index!10975 lt!145534)) (select (arr!7053 a!3312) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!2201) lt!145534) (= (select (arr!7053 a!3312) (index!10974 lt!145534)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2201) lt!145534) (= (select (arr!7053 a!3312) (index!10977 lt!145534)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66527 (= lt!145534 e!185754)))

(declare-fun c!47231 () Bool)

(assert (=> d!66527 (= c!47231 (and ((_ is Intermediate!2201) lt!145533) (undefined!3013 lt!145533)))))

(assert (=> d!66527 (= lt!145533 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!7053 a!3312) #b00000000000000000000000000000000) mask!3809) (select (arr!7053 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809))))

(assert (=> d!66527 (validMask!0 mask!3809)))

(assert (=> d!66527 (= (seekEntryOrOpen!0 (select (arr!7053 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) lt!145534)))

(assert (= (and d!66527 c!47231) b!293807))

(assert (= (and d!66527 (not c!47231)) b!293812))

(assert (= (and b!293812 c!47232) b!293811))

(assert (= (and b!293812 (not c!47232)) b!293809))

(assert (= (and b!293809 c!47233) b!293808))

(assert (= (and b!293809 (not c!47233)) b!293810))

(assert (=> b!293810 m!306779))

(declare-fun m!306911 () Bool)

(assert (=> b!293810 m!306911))

(declare-fun m!306913 () Bool)

(assert (=> b!293812 m!306913))

(assert (=> d!66527 m!306779))

(declare-fun m!306915 () Bool)

(assert (=> d!66527 m!306915))

(declare-fun m!306917 () Bool)

(assert (=> d!66527 m!306917))

(assert (=> d!66527 m!306719))

(declare-fun m!306919 () Bool)

(assert (=> d!66527 m!306919))

(declare-fun m!306921 () Bool)

(assert (=> d!66527 m!306921))

(assert (=> d!66527 m!306915))

(assert (=> d!66527 m!306779))

(declare-fun m!306923 () Bool)

(assert (=> d!66527 m!306923))

(assert (=> b!293588 d!66527))

(assert (=> d!66477 d!66501))

(declare-fun d!66529 () Bool)

(declare-fun res!154486 () Bool)

(declare-fun e!185756 () Bool)

(assert (=> d!66529 (=> res!154486 e!185756)))

(assert (=> d!66529 (= res!154486 (= (select (arr!7053 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!2524))))

(assert (=> d!66529 (= (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!185756)))

(declare-fun b!293813 () Bool)

(declare-fun e!185757 () Bool)

(assert (=> b!293813 (= e!185756 e!185757)))

(declare-fun res!154487 () Bool)

(assert (=> b!293813 (=> (not res!154487) (not e!185757))))

(assert (=> b!293813 (= res!154487 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!7406 a!3312)))))

(declare-fun b!293814 () Bool)

(assert (=> b!293814 (= e!185757 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!66529 (not res!154486)) b!293813))

(assert (= (and b!293813 res!154487) b!293814))

(declare-fun m!306925 () Bool)

(assert (=> d!66529 m!306925))

(declare-fun m!306927 () Bool)

(assert (=> b!293814 m!306927))

(assert (=> b!293737 d!66529))

(declare-fun b!293827 () Bool)

(declare-fun e!185766 () SeekEntryResult!2201)

(assert (=> b!293827 (= e!185766 (Found!2201 (index!10976 lt!145487)))))

(declare-fun b!293828 () Bool)

(declare-fun e!185765 () SeekEntryResult!2201)

(assert (=> b!293828 (= e!185765 (seekKeyOrZeroReturnVacant!0 (bvadd (x!29179 lt!145487) #b00000000000000000000000000000001) (nextIndex!0 (index!10976 lt!145487) (x!29179 lt!145487) mask!3809) (index!10976 lt!145487) k0!2524 a!3312 mask!3809))))

(declare-fun b!293829 () Bool)

(declare-fun e!185764 () SeekEntryResult!2201)

(assert (=> b!293829 (= e!185764 Undefined!2201)))

(declare-fun b!293830 () Bool)

(declare-fun c!47240 () Bool)

(declare-fun lt!145541 () (_ BitVec 64))

(assert (=> b!293830 (= c!47240 (= lt!145541 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!293830 (= e!185766 e!185765)))

(declare-fun b!293831 () Bool)

(assert (=> b!293831 (= e!185764 e!185766)))

(declare-fun c!47241 () Bool)

(assert (=> b!293831 (= c!47241 (= lt!145541 k0!2524))))

(declare-fun b!293832 () Bool)

(assert (=> b!293832 (= e!185765 (MissingVacant!2201 (index!10976 lt!145487)))))

(declare-fun d!66531 () Bool)

(declare-fun lt!145540 () SeekEntryResult!2201)

(assert (=> d!66531 (and (or ((_ is Undefined!2201) lt!145540) (not ((_ is Found!2201) lt!145540)) (and (bvsge (index!10975 lt!145540) #b00000000000000000000000000000000) (bvslt (index!10975 lt!145540) (size!7406 a!3312)))) (or ((_ is Undefined!2201) lt!145540) ((_ is Found!2201) lt!145540) (not ((_ is MissingVacant!2201) lt!145540)) (not (= (index!10977 lt!145540) (index!10976 lt!145487))) (and (bvsge (index!10977 lt!145540) #b00000000000000000000000000000000) (bvslt (index!10977 lt!145540) (size!7406 a!3312)))) (or ((_ is Undefined!2201) lt!145540) (ite ((_ is Found!2201) lt!145540) (= (select (arr!7053 a!3312) (index!10975 lt!145540)) k0!2524) (and ((_ is MissingVacant!2201) lt!145540) (= (index!10977 lt!145540) (index!10976 lt!145487)) (= (select (arr!7053 a!3312) (index!10977 lt!145540)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!66531 (= lt!145540 e!185764)))

(declare-fun c!47242 () Bool)

(assert (=> d!66531 (= c!47242 (bvsge (x!29179 lt!145487) #b01111111111111111111111111111110))))

(assert (=> d!66531 (= lt!145541 (select (arr!7053 a!3312) (index!10976 lt!145487)))))

(assert (=> d!66531 (validMask!0 mask!3809)))

(assert (=> d!66531 (= (seekKeyOrZeroReturnVacant!0 (x!29179 lt!145487) (index!10976 lt!145487) (index!10976 lt!145487) k0!2524 a!3312 mask!3809) lt!145540)))

(assert (= (and d!66531 c!47242) b!293829))

(assert (= (and d!66531 (not c!47242)) b!293831))

(assert (= (and b!293831 c!47241) b!293827))

(assert (= (and b!293831 (not c!47241)) b!293830))

(assert (= (and b!293830 c!47240) b!293832))

(assert (= (and b!293830 (not c!47240)) b!293828))

(declare-fun m!306929 () Bool)

(assert (=> b!293828 m!306929))

(assert (=> b!293828 m!306929))

(declare-fun m!306931 () Bool)

(assert (=> b!293828 m!306931))

(declare-fun m!306933 () Bool)

(assert (=> d!66531 m!306933))

(declare-fun m!306935 () Bool)

(assert (=> d!66531 m!306935))

(assert (=> d!66531 m!306851))

(assert (=> d!66531 m!306719))

(assert (=> b!293721 d!66531))

(declare-fun d!66533 () Bool)

(assert (=> d!66533 (= (validKeyInArray!0 (select (arr!7053 a!3312) #b00000000000000000000000000000000)) (and (not (= (select (arr!7053 a!3312) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7053 a!3312) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!293589 d!66533))

(declare-fun b!293833 () Bool)

(declare-fun e!185769 () Bool)

(declare-fun e!185767 () Bool)

(assert (=> b!293833 (= e!185769 e!185767)))

(declare-fun lt!145542 () (_ BitVec 64))

(assert (=> b!293833 (= lt!145542 (select (arr!7053 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!145543 () Unit!9142)

(assert (=> b!293833 (= lt!145543 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!145542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!293833 (arrayContainsKey!0 a!3312 lt!145542 #b00000000000000000000000000000000)))

(declare-fun lt!145544 () Unit!9142)

(assert (=> b!293833 (= lt!145544 lt!145543)))

(declare-fun res!154488 () Bool)

(assert (=> b!293833 (= res!154488 (= (seekEntryOrOpen!0 (select (arr!7053 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3312 mask!3809) (Found!2201 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!293833 (=> (not res!154488) (not e!185767))))

(declare-fun b!293834 () Bool)

(declare-fun e!185768 () Bool)

(assert (=> b!293834 (= e!185768 e!185769)))

(declare-fun c!47243 () Bool)

(assert (=> b!293834 (= c!47243 (validKeyInArray!0 (select (arr!7053 a!3312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!293835 () Bool)

(declare-fun call!25664 () Bool)

(assert (=> b!293835 (= e!185767 call!25664)))

(declare-fun b!293836 () Bool)

(assert (=> b!293836 (= e!185769 call!25664)))

(declare-fun bm!25661 () Bool)

(assert (=> bm!25661 (= call!25664 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!66535 () Bool)

(declare-fun res!154489 () Bool)

(assert (=> d!66535 (=> res!154489 e!185768)))

(assert (=> d!66535 (= res!154489 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7406 a!3312)))))

(assert (=> d!66535 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809) e!185768)))

(assert (= (and d!66535 (not res!154489)) b!293834))

(assert (= (and b!293834 c!47243) b!293833))

(assert (= (and b!293834 (not c!47243)) b!293836))

(assert (= (and b!293833 res!154488) b!293835))

(assert (= (or b!293835 b!293836) bm!25661))

(assert (=> b!293833 m!306925))

(declare-fun m!306937 () Bool)

(assert (=> b!293833 m!306937))

(declare-fun m!306939 () Bool)

(assert (=> b!293833 m!306939))

(assert (=> b!293833 m!306925))

(declare-fun m!306941 () Bool)

(assert (=> b!293833 m!306941))

(assert (=> b!293834 m!306925))

(assert (=> b!293834 m!306925))

(declare-fun m!306943 () Bool)

(assert (=> b!293834 m!306943))

(declare-fun m!306945 () Bool)

(assert (=> bm!25661 m!306945))

(assert (=> bm!25654 d!66535))

(declare-fun d!66537 () Bool)

(declare-fun e!185772 () Bool)

(assert (=> d!66537 e!185772))

(declare-fun c!47245 () Bool)

(declare-fun lt!145546 () SeekEntryResult!2201)

(assert (=> d!66537 (= c!47245 (and ((_ is Intermediate!2201) lt!145546) (undefined!3013 lt!145546)))))

(declare-fun e!185774 () SeekEntryResult!2201)

(assert (=> d!66537 (= lt!145546 e!185774)))

(declare-fun c!47244 () Bool)

(assert (=> d!66537 (= c!47244 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!145545 () (_ BitVec 64))

(assert (=> d!66537 (= lt!145545 (select (arr!7053 a!3312) (nextIndex!0 lt!145400 #b00000000000000000000000000000000 mask!3809)))))

(assert (=> d!66537 (validMask!0 mask!3809)))

(assert (=> d!66537 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145400 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809) lt!145546)))

(declare-fun b!293837 () Bool)

(assert (=> b!293837 (and (bvsge (index!10976 lt!145546) #b00000000000000000000000000000000) (bvslt (index!10976 lt!145546) (size!7406 a!3312)))))

(declare-fun res!154492 () Bool)

(assert (=> b!293837 (= res!154492 (= (select (arr!7053 a!3312) (index!10976 lt!145546)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185770 () Bool)

(assert (=> b!293837 (=> res!154492 e!185770)))

(declare-fun b!293838 () Bool)

(declare-fun e!185773 () SeekEntryResult!2201)

(assert (=> b!293838 (= e!185773 (Intermediate!2201 false (nextIndex!0 lt!145400 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!293839 () Bool)

(assert (=> b!293839 (and (bvsge (index!10976 lt!145546) #b00000000000000000000000000000000) (bvslt (index!10976 lt!145546) (size!7406 a!3312)))))

(assert (=> b!293839 (= e!185770 (= (select (arr!7053 a!3312) (index!10976 lt!145546)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!293840 () Bool)

(assert (=> b!293840 (= e!185773 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 lt!145400 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!293841 () Bool)

(assert (=> b!293841 (= e!185774 (Intermediate!2201 true (nextIndex!0 lt!145400 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!293842 () Bool)

(assert (=> b!293842 (and (bvsge (index!10976 lt!145546) #b00000000000000000000000000000000) (bvslt (index!10976 lt!145546) (size!7406 a!3312)))))

(declare-fun res!154491 () Bool)

(assert (=> b!293842 (= res!154491 (= (select (arr!7053 a!3312) (index!10976 lt!145546)) k0!2524))))

(assert (=> b!293842 (=> res!154491 e!185770)))

(declare-fun e!185771 () Bool)

(assert (=> b!293842 (= e!185771 e!185770)))

(declare-fun b!293843 () Bool)

(assert (=> b!293843 (= e!185772 (bvsge (x!29179 lt!145546) #b01111111111111111111111111111110))))

(declare-fun b!293844 () Bool)

(assert (=> b!293844 (= e!185774 e!185773)))

(declare-fun c!47246 () Bool)

(assert (=> b!293844 (= c!47246 (or (= lt!145545 k0!2524) (= (bvadd lt!145545 lt!145545) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293845 () Bool)

(assert (=> b!293845 (= e!185772 e!185771)))

(declare-fun res!154490 () Bool)

(assert (=> b!293845 (= res!154490 (and ((_ is Intermediate!2201) lt!145546) (not (undefined!3013 lt!145546)) (bvslt (x!29179 lt!145546) #b01111111111111111111111111111110) (bvsge (x!29179 lt!145546) #b00000000000000000000000000000000) (bvsge (x!29179 lt!145546) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!293845 (=> (not res!154490) (not e!185771))))

(assert (= (and d!66537 c!47244) b!293841))

(assert (= (and d!66537 (not c!47244)) b!293844))

(assert (= (and b!293844 c!47246) b!293838))

(assert (= (and b!293844 (not c!47246)) b!293840))

(assert (= (and d!66537 c!47245) b!293843))

(assert (= (and d!66537 (not c!47245)) b!293845))

(assert (= (and b!293845 res!154490) b!293842))

(assert (= (and b!293842 (not res!154491)) b!293837))

(assert (= (and b!293837 (not res!154492)) b!293839))

(declare-fun m!306947 () Bool)

(assert (=> b!293842 m!306947))

(assert (=> b!293837 m!306947))

(assert (=> d!66537 m!306799))

(declare-fun m!306949 () Bool)

(assert (=> d!66537 m!306949))

(assert (=> d!66537 m!306719))

(assert (=> b!293840 m!306799))

(declare-fun m!306951 () Bool)

(assert (=> b!293840 m!306951))

(assert (=> b!293840 m!306951))

(declare-fun m!306953 () Bool)

(assert (=> b!293840 m!306953))

(assert (=> b!293839 m!306947))

(assert (=> b!293640 d!66537))

(declare-fun d!66539 () Bool)

(declare-fun lt!145549 () (_ BitVec 32))

(assert (=> d!66539 (and (bvsge lt!145549 #b00000000000000000000000000000000) (bvslt lt!145549 (bvadd mask!3809 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!66539 (= lt!145549 (choose!52 lt!145400 #b00000000000000000000000000000000 mask!3809))))

(assert (=> d!66539 (validMask!0 mask!3809)))

(assert (=> d!66539 (= (nextIndex!0 lt!145400 #b00000000000000000000000000000000 mask!3809) lt!145549)))

(declare-fun bs!10419 () Bool)

(assert (= bs!10419 d!66539))

(declare-fun m!306955 () Bool)

(assert (=> bs!10419 m!306955))

(assert (=> bs!10419 m!306719))

(assert (=> b!293640 d!66539))

(declare-fun d!66541 () Bool)

(declare-fun e!185777 () Bool)

(assert (=> d!66541 e!185777))

(declare-fun c!47248 () Bool)

(declare-fun lt!145551 () SeekEntryResult!2201)

(assert (=> d!66541 (= c!47248 (and ((_ is Intermediate!2201) lt!145551) (undefined!3013 lt!145551)))))

(declare-fun e!185779 () SeekEntryResult!2201)

(assert (=> d!66541 (= lt!145551 e!185779)))

(declare-fun c!47247 () Bool)

(assert (=> d!66541 (= c!47247 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!145550 () (_ BitVec 64))

(assert (=> d!66541 (= lt!145550 (select (arr!7053 (array!14867 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7406 a!3312))) (nextIndex!0 lt!145400 #b00000000000000000000000000000000 mask!3809)))))

(assert (=> d!66541 (validMask!0 mask!3809)))

(assert (=> d!66541 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!145400 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!14867 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7406 a!3312)) mask!3809) lt!145551)))

(declare-fun b!293846 () Bool)

(assert (=> b!293846 (and (bvsge (index!10976 lt!145551) #b00000000000000000000000000000000) (bvslt (index!10976 lt!145551) (size!7406 (array!14867 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7406 a!3312)))))))

(declare-fun res!154495 () Bool)

(assert (=> b!293846 (= res!154495 (= (select (arr!7053 (array!14867 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7406 a!3312))) (index!10976 lt!145551)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!185775 () Bool)

(assert (=> b!293846 (=> res!154495 e!185775)))

(declare-fun b!293847 () Bool)

(declare-fun e!185778 () SeekEntryResult!2201)

(assert (=> b!293847 (= e!185778 (Intermediate!2201 false (nextIndex!0 lt!145400 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!293848 () Bool)

(assert (=> b!293848 (and (bvsge (index!10976 lt!145551) #b00000000000000000000000000000000) (bvslt (index!10976 lt!145551) (size!7406 (array!14867 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7406 a!3312)))))))

(assert (=> b!293848 (= e!185775 (= (select (arr!7053 (array!14867 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7406 a!3312))) (index!10976 lt!145551)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!293849 () Bool)

(assert (=> b!293849 (= e!185778 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 lt!145400 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!14867 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7406 a!3312)) mask!3809))))

(declare-fun b!293850 () Bool)

(assert (=> b!293850 (= e!185779 (Intermediate!2201 true (nextIndex!0 lt!145400 #b00000000000000000000000000000000 mask!3809) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!293851 () Bool)

(assert (=> b!293851 (and (bvsge (index!10976 lt!145551) #b00000000000000000000000000000000) (bvslt (index!10976 lt!145551) (size!7406 (array!14867 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7406 a!3312)))))))

(declare-fun res!154494 () Bool)

(assert (=> b!293851 (= res!154494 (= (select (arr!7053 (array!14867 (store (arr!7053 a!3312) i!1256 k0!2524) (size!7406 a!3312))) (index!10976 lt!145551)) k0!2524))))

(assert (=> b!293851 (=> res!154494 e!185775)))

(declare-fun e!185776 () Bool)

(assert (=> b!293851 (= e!185776 e!185775)))

(declare-fun b!293852 () Bool)

(assert (=> b!293852 (= e!185777 (bvsge (x!29179 lt!145551) #b01111111111111111111111111111110))))

(declare-fun b!293853 () Bool)

(assert (=> b!293853 (= e!185779 e!185778)))

(declare-fun c!47249 () Bool)

(assert (=> b!293853 (= c!47249 (or (= lt!145550 k0!2524) (= (bvadd lt!145550 lt!145550) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!293854 () Bool)

(assert (=> b!293854 (= e!185777 e!185776)))

(declare-fun res!154493 () Bool)

(assert (=> b!293854 (= res!154493 (and ((_ is Intermediate!2201) lt!145551) (not (undefined!3013 lt!145551)) (bvslt (x!29179 lt!145551) #b01111111111111111111111111111110) (bvsge (x!29179 lt!145551) #b00000000000000000000000000000000) (bvsge (x!29179 lt!145551) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!293854 (=> (not res!154493) (not e!185776))))

(assert (= (and d!66541 c!47247) b!293850))

(assert (= (and d!66541 (not c!47247)) b!293853))

(assert (= (and b!293853 c!47249) b!293847))

(assert (= (and b!293853 (not c!47249)) b!293849))

(assert (= (and d!66541 c!47248) b!293852))

(assert (= (and d!66541 (not c!47248)) b!293854))

(assert (= (and b!293854 res!154493) b!293851))

(assert (= (and b!293851 (not res!154494)) b!293846))

(assert (= (and b!293846 (not res!154495)) b!293848))

(declare-fun m!306957 () Bool)

(assert (=> b!293851 m!306957))

(assert (=> b!293846 m!306957))

(assert (=> d!66541 m!306799))

(declare-fun m!306959 () Bool)

(assert (=> d!66541 m!306959))

(assert (=> d!66541 m!306719))

(assert (=> b!293849 m!306799))

(assert (=> b!293849 m!306951))

(assert (=> b!293849 m!306951))

(declare-fun m!306961 () Bool)

(assert (=> b!293849 m!306961))

(assert (=> b!293848 m!306957))

(assert (=> b!293627 d!66541))

(assert (=> b!293627 d!66539))

(check-sat (not d!66531) (not b!293849) (not b!293833) (not d!66521) (not d!66537) (not d!66541) (not b!293834) (not b!293806) (not b!293828) (not b!293799) (not b!293840) (not d!66523) (not b!293810) (not d!66539) (not d!66527) (not bm!25661) (not b!293814))
(check-sat)
