; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29884 () Bool)

(assert start!29884)

(declare-fun b!300574 () Bool)

(declare-fun res!158518 () Bool)

(declare-fun e!189782 () Bool)

(assert (=> b!300574 (=> (not res!158518) (not e!189782))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!15177 0))(
  ( (array!15178 (arr!7183 (Array (_ BitVec 32) (_ BitVec 64))) (size!7535 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15177)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!300574 (= res!158518 (and (= (size!7535 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7535 a!3312))))))

(declare-datatypes ((SeekEntryResult!2297 0))(
  ( (MissingZero!2297 (index!11364 (_ BitVec 32))) (Found!2297 (index!11365 (_ BitVec 32))) (Intermediate!2297 (undefined!3109 Bool) (index!11366 (_ BitVec 32)) (x!29728 (_ BitVec 32))) (Undefined!2297) (MissingVacant!2297 (index!11367 (_ BitVec 32))) )
))
(declare-fun lt!149582 () SeekEntryResult!2297)

(declare-fun e!189781 () Bool)

(declare-fun lt!149579 () Bool)

(declare-fun b!300575 () Bool)

(declare-fun lt!149583 () SeekEntryResult!2297)

(get-info :version)

(assert (=> b!300575 (= e!189781 (and (not lt!149579) (= lt!149583 (MissingVacant!2297 i!1256)) (not ((_ is Intermediate!2297) lt!149582))))))

(declare-fun lt!149580 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun lt!149581 () SeekEntryResult!2297)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15177 (_ BitVec 32)) SeekEntryResult!2297)

(assert (=> b!300575 (= lt!149581 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149580 k0!2524 (array!15178 (store (arr!7183 a!3312) i!1256 k0!2524) (size!7535 a!3312)) mask!3809))))

(assert (=> b!300575 (= lt!149582 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149580 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300575 (= lt!149580 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!158520 () Bool)

(assert (=> start!29884 (=> (not res!158520) (not e!189782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29884 (= res!158520 (validMask!0 mask!3809))))

(assert (=> start!29884 e!189782))

(assert (=> start!29884 true))

(declare-fun array_inv!5133 (array!15177) Bool)

(assert (=> start!29884 (array_inv!5133 a!3312)))

(declare-fun b!300576 () Bool)

(assert (=> b!300576 (= e!189782 e!189781)))

(declare-fun res!158516 () Bool)

(assert (=> b!300576 (=> (not res!158516) (not e!189781))))

(assert (=> b!300576 (= res!158516 (or lt!149579 (= lt!149583 (MissingVacant!2297 i!1256))))))

(assert (=> b!300576 (= lt!149579 (= lt!149583 (MissingZero!2297 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15177 (_ BitVec 32)) SeekEntryResult!2297)

(assert (=> b!300576 (= lt!149583 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!300577 () Bool)

(declare-fun res!158519 () Bool)

(assert (=> b!300577 (=> (not res!158519) (not e!189782))))

(declare-fun arrayContainsKey!0 (array!15177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300577 (= res!158519 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!300578 () Bool)

(declare-fun res!158517 () Bool)

(assert (=> b!300578 (=> (not res!158517) (not e!189781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15177 (_ BitVec 32)) Bool)

(assert (=> b!300578 (= res!158517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!300579 () Bool)

(declare-fun res!158515 () Bool)

(assert (=> b!300579 (=> (not res!158515) (not e!189782))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300579 (= res!158515 (validKeyInArray!0 k0!2524))))

(assert (= (and start!29884 res!158520) b!300574))

(assert (= (and b!300574 res!158518) b!300579))

(assert (= (and b!300579 res!158515) b!300577))

(assert (= (and b!300577 res!158519) b!300576))

(assert (= (and b!300576 res!158516) b!300578))

(assert (= (and b!300578 res!158517) b!300575))

(declare-fun m!312711 () Bool)

(assert (=> b!300579 m!312711))

(declare-fun m!312713 () Bool)

(assert (=> b!300578 m!312713))

(declare-fun m!312715 () Bool)

(assert (=> b!300577 m!312715))

(declare-fun m!312717 () Bool)

(assert (=> b!300576 m!312717))

(declare-fun m!312719 () Bool)

(assert (=> start!29884 m!312719))

(declare-fun m!312721 () Bool)

(assert (=> start!29884 m!312721))

(declare-fun m!312723 () Bool)

(assert (=> b!300575 m!312723))

(declare-fun m!312725 () Bool)

(assert (=> b!300575 m!312725))

(declare-fun m!312727 () Bool)

(assert (=> b!300575 m!312727))

(declare-fun m!312729 () Bool)

(assert (=> b!300575 m!312729))

(check-sat (not b!300577) (not b!300576) (not b!300579) (not start!29884) (not b!300575) (not b!300578))
(check-sat)
(get-model)

(declare-fun b!300628 () Bool)

(declare-fun e!189808 () SeekEntryResult!2297)

(declare-fun lt!149620 () SeekEntryResult!2297)

(assert (=> b!300628 (= e!189808 (Found!2297 (index!11366 lt!149620)))))

(declare-fun b!300629 () Bool)

(declare-fun c!48630 () Bool)

(declare-fun lt!149621 () (_ BitVec 64))

(assert (=> b!300629 (= c!48630 (= lt!149621 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!189809 () SeekEntryResult!2297)

(assert (=> b!300629 (= e!189808 e!189809)))

(declare-fun b!300630 () Bool)

(assert (=> b!300630 (= e!189809 (MissingZero!2297 (index!11366 lt!149620)))))

(declare-fun b!300631 () Bool)

(declare-fun e!189810 () SeekEntryResult!2297)

(assert (=> b!300631 (= e!189810 e!189808)))

(assert (=> b!300631 (= lt!149621 (select (arr!7183 a!3312) (index!11366 lt!149620)))))

(declare-fun c!48631 () Bool)

(assert (=> b!300631 (= c!48631 (= lt!149621 k0!2524))))

(declare-fun d!67799 () Bool)

(declare-fun lt!149622 () SeekEntryResult!2297)

(assert (=> d!67799 (and (or ((_ is Undefined!2297) lt!149622) (not ((_ is Found!2297) lt!149622)) (and (bvsge (index!11365 lt!149622) #b00000000000000000000000000000000) (bvslt (index!11365 lt!149622) (size!7535 a!3312)))) (or ((_ is Undefined!2297) lt!149622) ((_ is Found!2297) lt!149622) (not ((_ is MissingZero!2297) lt!149622)) (and (bvsge (index!11364 lt!149622) #b00000000000000000000000000000000) (bvslt (index!11364 lt!149622) (size!7535 a!3312)))) (or ((_ is Undefined!2297) lt!149622) ((_ is Found!2297) lt!149622) ((_ is MissingZero!2297) lt!149622) (not ((_ is MissingVacant!2297) lt!149622)) (and (bvsge (index!11367 lt!149622) #b00000000000000000000000000000000) (bvslt (index!11367 lt!149622) (size!7535 a!3312)))) (or ((_ is Undefined!2297) lt!149622) (ite ((_ is Found!2297) lt!149622) (= (select (arr!7183 a!3312) (index!11365 lt!149622)) k0!2524) (ite ((_ is MissingZero!2297) lt!149622) (= (select (arr!7183 a!3312) (index!11364 lt!149622)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2297) lt!149622) (= (select (arr!7183 a!3312) (index!11367 lt!149622)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67799 (= lt!149622 e!189810)))

(declare-fun c!48632 () Bool)

(assert (=> d!67799 (= c!48632 (and ((_ is Intermediate!2297) lt!149620) (undefined!3109 lt!149620)))))

(assert (=> d!67799 (= lt!149620 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67799 (validMask!0 mask!3809)))

(assert (=> d!67799 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!149622)))

(declare-fun b!300632 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15177 (_ BitVec 32)) SeekEntryResult!2297)

(assert (=> b!300632 (= e!189809 (seekKeyOrZeroReturnVacant!0 (x!29728 lt!149620) (index!11366 lt!149620) (index!11366 lt!149620) k0!2524 a!3312 mask!3809))))

(declare-fun b!300633 () Bool)

(assert (=> b!300633 (= e!189810 Undefined!2297)))

(assert (= (and d!67799 c!48632) b!300633))

(assert (= (and d!67799 (not c!48632)) b!300631))

(assert (= (and b!300631 c!48631) b!300628))

(assert (= (and b!300631 (not c!48631)) b!300629))

(assert (= (and b!300629 c!48630) b!300630))

(assert (= (and b!300629 (not c!48630)) b!300632))

(declare-fun m!312771 () Bool)

(assert (=> b!300631 m!312771))

(declare-fun m!312773 () Bool)

(assert (=> d!67799 m!312773))

(declare-fun m!312775 () Bool)

(assert (=> d!67799 m!312775))

(assert (=> d!67799 m!312729))

(declare-fun m!312777 () Bool)

(assert (=> d!67799 m!312777))

(assert (=> d!67799 m!312719))

(declare-fun m!312779 () Bool)

(assert (=> d!67799 m!312779))

(assert (=> d!67799 m!312729))

(declare-fun m!312781 () Bool)

(assert (=> b!300632 m!312781))

(assert (=> b!300576 d!67799))

(declare-fun d!67807 () Bool)

(declare-fun res!158561 () Bool)

(declare-fun e!189815 () Bool)

(assert (=> d!67807 (=> res!158561 e!189815)))

(assert (=> d!67807 (= res!158561 (= (select (arr!7183 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67807 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!189815)))

(declare-fun b!300638 () Bool)

(declare-fun e!189816 () Bool)

(assert (=> b!300638 (= e!189815 e!189816)))

(declare-fun res!158562 () Bool)

(assert (=> b!300638 (=> (not res!158562) (not e!189816))))

(assert (=> b!300638 (= res!158562 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7535 a!3312)))))

(declare-fun b!300639 () Bool)

(assert (=> b!300639 (= e!189816 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67807 (not res!158561)) b!300638))

(assert (= (and b!300638 res!158562) b!300639))

(declare-fun m!312783 () Bool)

(assert (=> d!67807 m!312783))

(declare-fun m!312785 () Bool)

(assert (=> b!300639 m!312785))

(assert (=> b!300577 d!67807))

(declare-fun d!67809 () Bool)

(assert (=> d!67809 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29884 d!67809))

(declare-fun d!67815 () Bool)

(assert (=> d!67815 (= (array_inv!5133 a!3312) (bvsge (size!7535 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29884 d!67815))

(declare-fun b!300696 () Bool)

(declare-fun e!189851 () Bool)

(declare-fun call!25844 () Bool)

(assert (=> b!300696 (= e!189851 call!25844)))

(declare-fun b!300697 () Bool)

(declare-fun e!189850 () Bool)

(assert (=> b!300697 (= e!189850 call!25844)))

(declare-fun b!300698 () Bool)

(declare-fun e!189849 () Bool)

(assert (=> b!300698 (= e!189849 e!189851)))

(declare-fun c!48653 () Bool)

(assert (=> b!300698 (= c!48653 (validKeyInArray!0 (select (arr!7183 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!67817 () Bool)

(declare-fun res!158581 () Bool)

(assert (=> d!67817 (=> res!158581 e!189849)))

(assert (=> d!67817 (= res!158581 (bvsge #b00000000000000000000000000000000 (size!7535 a!3312)))))

(assert (=> d!67817 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!189849)))

(declare-fun b!300699 () Bool)

(assert (=> b!300699 (= e!189851 e!189850)))

(declare-fun lt!149650 () (_ BitVec 64))

(assert (=> b!300699 (= lt!149650 (select (arr!7183 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9329 0))(
  ( (Unit!9330) )
))
(declare-fun lt!149649 () Unit!9329)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15177 (_ BitVec 64) (_ BitVec 32)) Unit!9329)

(assert (=> b!300699 (= lt!149649 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!149650 #b00000000000000000000000000000000))))

(assert (=> b!300699 (arrayContainsKey!0 a!3312 lt!149650 #b00000000000000000000000000000000)))

(declare-fun lt!149651 () Unit!9329)

(assert (=> b!300699 (= lt!149651 lt!149649)))

(declare-fun res!158580 () Bool)

(assert (=> b!300699 (= res!158580 (= (seekEntryOrOpen!0 (select (arr!7183 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2297 #b00000000000000000000000000000000)))))

(assert (=> b!300699 (=> (not res!158580) (not e!189850))))

(declare-fun bm!25841 () Bool)

(assert (=> bm!25841 (= call!25844 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(assert (= (and d!67817 (not res!158581)) b!300698))

(assert (= (and b!300698 c!48653) b!300699))

(assert (= (and b!300698 (not c!48653)) b!300696))

(assert (= (and b!300699 res!158580) b!300697))

(assert (= (or b!300697 b!300696) bm!25841))

(assert (=> b!300698 m!312783))

(assert (=> b!300698 m!312783))

(declare-fun m!312801 () Bool)

(assert (=> b!300698 m!312801))

(assert (=> b!300699 m!312783))

(declare-fun m!312803 () Bool)

(assert (=> b!300699 m!312803))

(declare-fun m!312805 () Bool)

(assert (=> b!300699 m!312805))

(assert (=> b!300699 m!312783))

(declare-fun m!312807 () Bool)

(assert (=> b!300699 m!312807))

(declare-fun m!312809 () Bool)

(assert (=> bm!25841 m!312809))

(assert (=> b!300578 d!67817))

(declare-fun d!67825 () Bool)

(assert (=> d!67825 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!300579 d!67825))

(declare-fun e!189898 () SeekEntryResult!2297)

(declare-fun b!300778 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300778 (= e!189898 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149580 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 (array!15178 (store (arr!7183 a!3312) i!1256 k0!2524) (size!7535 a!3312)) mask!3809))))

(declare-fun d!67829 () Bool)

(declare-fun e!189897 () Bool)

(assert (=> d!67829 e!189897))

(declare-fun c!48683 () Bool)

(declare-fun lt!149674 () SeekEntryResult!2297)

(assert (=> d!67829 (= c!48683 (and ((_ is Intermediate!2297) lt!149674) (undefined!3109 lt!149674)))))

(declare-fun e!189901 () SeekEntryResult!2297)

(assert (=> d!67829 (= lt!149674 e!189901)))

(declare-fun c!48682 () Bool)

(assert (=> d!67829 (= c!48682 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!149673 () (_ BitVec 64))

(assert (=> d!67829 (= lt!149673 (select (arr!7183 (array!15178 (store (arr!7183 a!3312) i!1256 k0!2524) (size!7535 a!3312))) lt!149580))))

(assert (=> d!67829 (validMask!0 mask!3809)))

(assert (=> d!67829 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149580 k0!2524 (array!15178 (store (arr!7183 a!3312) i!1256 k0!2524) (size!7535 a!3312)) mask!3809) lt!149674)))

(declare-fun b!300779 () Bool)

(assert (=> b!300779 (and (bvsge (index!11366 lt!149674) #b00000000000000000000000000000000) (bvslt (index!11366 lt!149674) (size!7535 (array!15178 (store (arr!7183 a!3312) i!1256 k0!2524) (size!7535 a!3312)))))))

(declare-fun res!158608 () Bool)

(assert (=> b!300779 (= res!158608 (= (select (arr!7183 (array!15178 (store (arr!7183 a!3312) i!1256 k0!2524) (size!7535 a!3312))) (index!11366 lt!149674)) k0!2524))))

(declare-fun e!189900 () Bool)

(assert (=> b!300779 (=> res!158608 e!189900)))

(declare-fun e!189899 () Bool)

(assert (=> b!300779 (= e!189899 e!189900)))

(declare-fun b!300780 () Bool)

(assert (=> b!300780 (and (bvsge (index!11366 lt!149674) #b00000000000000000000000000000000) (bvslt (index!11366 lt!149674) (size!7535 (array!15178 (store (arr!7183 a!3312) i!1256 k0!2524) (size!7535 a!3312)))))))

(declare-fun res!158606 () Bool)

(assert (=> b!300780 (= res!158606 (= (select (arr!7183 (array!15178 (store (arr!7183 a!3312) i!1256 k0!2524) (size!7535 a!3312))) (index!11366 lt!149674)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!300780 (=> res!158606 e!189900)))

(declare-fun b!300781 () Bool)

(assert (=> b!300781 (= e!189897 (bvsge (x!29728 lt!149674) #b01111111111111111111111111111110))))

(declare-fun b!300782 () Bool)

(assert (=> b!300782 (= e!189898 (Intermediate!2297 false lt!149580 #b00000000000000000000000000000000))))

(declare-fun b!300783 () Bool)

(assert (=> b!300783 (= e!189901 e!189898)))

(declare-fun c!48681 () Bool)

(assert (=> b!300783 (= c!48681 (or (= lt!149673 k0!2524) (= (bvadd lt!149673 lt!149673) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!300784 () Bool)

(assert (=> b!300784 (= e!189901 (Intermediate!2297 true lt!149580 #b00000000000000000000000000000000))))

(declare-fun b!300785 () Bool)

(assert (=> b!300785 (= e!189897 e!189899)))

(declare-fun res!158607 () Bool)

(assert (=> b!300785 (= res!158607 (and ((_ is Intermediate!2297) lt!149674) (not (undefined!3109 lt!149674)) (bvslt (x!29728 lt!149674) #b01111111111111111111111111111110) (bvsge (x!29728 lt!149674) #b00000000000000000000000000000000) (bvsge (x!29728 lt!149674) #b00000000000000000000000000000000)))))

(assert (=> b!300785 (=> (not res!158607) (not e!189899))))

(declare-fun b!300786 () Bool)

(assert (=> b!300786 (and (bvsge (index!11366 lt!149674) #b00000000000000000000000000000000) (bvslt (index!11366 lt!149674) (size!7535 (array!15178 (store (arr!7183 a!3312) i!1256 k0!2524) (size!7535 a!3312)))))))

(assert (=> b!300786 (= e!189900 (= (select (arr!7183 (array!15178 (store (arr!7183 a!3312) i!1256 k0!2524) (size!7535 a!3312))) (index!11366 lt!149674)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!67829 c!48682) b!300784))

(assert (= (and d!67829 (not c!48682)) b!300783))

(assert (= (and b!300783 c!48681) b!300782))

(assert (= (and b!300783 (not c!48681)) b!300778))

(assert (= (and d!67829 c!48683) b!300781))

(assert (= (and d!67829 (not c!48683)) b!300785))

(assert (= (and b!300785 res!158607) b!300779))

(assert (= (and b!300779 (not res!158608)) b!300780))

(assert (= (and b!300780 (not res!158606)) b!300786))

(declare-fun m!312841 () Bool)

(assert (=> b!300780 m!312841))

(declare-fun m!312843 () Bool)

(assert (=> d!67829 m!312843))

(assert (=> d!67829 m!312719))

(declare-fun m!312845 () Bool)

(assert (=> b!300778 m!312845))

(assert (=> b!300778 m!312845))

(declare-fun m!312847 () Bool)

(assert (=> b!300778 m!312847))

(assert (=> b!300779 m!312841))

(assert (=> b!300786 m!312841))

(assert (=> b!300575 d!67829))

(declare-fun b!300787 () Bool)

(declare-fun e!189903 () SeekEntryResult!2297)

(assert (=> b!300787 (= e!189903 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149580 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun d!67843 () Bool)

(declare-fun e!189902 () Bool)

(assert (=> d!67843 e!189902))

(declare-fun c!48686 () Bool)

(declare-fun lt!149676 () SeekEntryResult!2297)

(assert (=> d!67843 (= c!48686 (and ((_ is Intermediate!2297) lt!149676) (undefined!3109 lt!149676)))))

(declare-fun e!189906 () SeekEntryResult!2297)

(assert (=> d!67843 (= lt!149676 e!189906)))

(declare-fun c!48685 () Bool)

(assert (=> d!67843 (= c!48685 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!149675 () (_ BitVec 64))

(assert (=> d!67843 (= lt!149675 (select (arr!7183 a!3312) lt!149580))))

(assert (=> d!67843 (validMask!0 mask!3809)))

(assert (=> d!67843 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149580 k0!2524 a!3312 mask!3809) lt!149676)))

(declare-fun b!300788 () Bool)

(assert (=> b!300788 (and (bvsge (index!11366 lt!149676) #b00000000000000000000000000000000) (bvslt (index!11366 lt!149676) (size!7535 a!3312)))))

(declare-fun res!158612 () Bool)

(assert (=> b!300788 (= res!158612 (= (select (arr!7183 a!3312) (index!11366 lt!149676)) k0!2524))))

(declare-fun e!189905 () Bool)

(assert (=> b!300788 (=> res!158612 e!189905)))

(declare-fun e!189904 () Bool)

(assert (=> b!300788 (= e!189904 e!189905)))

(declare-fun b!300789 () Bool)

(assert (=> b!300789 (and (bvsge (index!11366 lt!149676) #b00000000000000000000000000000000) (bvslt (index!11366 lt!149676) (size!7535 a!3312)))))

(declare-fun res!158610 () Bool)

(assert (=> b!300789 (= res!158610 (= (select (arr!7183 a!3312) (index!11366 lt!149676)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!300789 (=> res!158610 e!189905)))

(declare-fun b!300790 () Bool)

(assert (=> b!300790 (= e!189902 (bvsge (x!29728 lt!149676) #b01111111111111111111111111111110))))

(declare-fun b!300791 () Bool)

(assert (=> b!300791 (= e!189903 (Intermediate!2297 false lt!149580 #b00000000000000000000000000000000))))

(declare-fun b!300792 () Bool)

(assert (=> b!300792 (= e!189906 e!189903)))

(declare-fun c!48684 () Bool)

(assert (=> b!300792 (= c!48684 (or (= lt!149675 k0!2524) (= (bvadd lt!149675 lt!149675) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!300793 () Bool)

(assert (=> b!300793 (= e!189906 (Intermediate!2297 true lt!149580 #b00000000000000000000000000000000))))

(declare-fun b!300794 () Bool)

(assert (=> b!300794 (= e!189902 e!189904)))

(declare-fun res!158611 () Bool)

(assert (=> b!300794 (= res!158611 (and ((_ is Intermediate!2297) lt!149676) (not (undefined!3109 lt!149676)) (bvslt (x!29728 lt!149676) #b01111111111111111111111111111110) (bvsge (x!29728 lt!149676) #b00000000000000000000000000000000) (bvsge (x!29728 lt!149676) #b00000000000000000000000000000000)))))

(assert (=> b!300794 (=> (not res!158611) (not e!189904))))

(declare-fun b!300795 () Bool)

(assert (=> b!300795 (and (bvsge (index!11366 lt!149676) #b00000000000000000000000000000000) (bvslt (index!11366 lt!149676) (size!7535 a!3312)))))

(assert (=> b!300795 (= e!189905 (= (select (arr!7183 a!3312) (index!11366 lt!149676)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!67843 c!48685) b!300793))

(assert (= (and d!67843 (not c!48685)) b!300792))

(assert (= (and b!300792 c!48684) b!300791))

(assert (= (and b!300792 (not c!48684)) b!300787))

(assert (= (and d!67843 c!48686) b!300790))

(assert (= (and d!67843 (not c!48686)) b!300794))

(assert (= (and b!300794 res!158611) b!300788))

(assert (= (and b!300788 (not res!158612)) b!300789))

(assert (= (and b!300789 (not res!158610)) b!300795))

(declare-fun m!312849 () Bool)

(assert (=> b!300789 m!312849))

(declare-fun m!312851 () Bool)

(assert (=> d!67843 m!312851))

(assert (=> d!67843 m!312719))

(assert (=> b!300787 m!312845))

(assert (=> b!300787 m!312845))

(declare-fun m!312853 () Bool)

(assert (=> b!300787 m!312853))

(assert (=> b!300788 m!312849))

(assert (=> b!300795 m!312849))

(assert (=> b!300575 d!67843))

(declare-fun d!67845 () Bool)

(declare-fun lt!149691 () (_ BitVec 32))

(declare-fun lt!149690 () (_ BitVec 32))

(assert (=> d!67845 (= lt!149691 (bvmul (bvxor lt!149690 (bvlshr lt!149690 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67845 (= lt!149690 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67845 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!158613 (let ((h!5239 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29736 (bvmul (bvxor h!5239 (bvlshr h!5239 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29736 (bvlshr x!29736 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!158613 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!158613 #b00000000000000000000000000000000))))))

(assert (=> d!67845 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!149691 (bvlshr lt!149691 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!300575 d!67845))

(check-sat (not b!300639) (not b!300778) (not d!67829) (not b!300787) (not b!300698) (not b!300699) (not d!67843) (not bm!25841) (not d!67799) (not b!300632))
(check-sat)
