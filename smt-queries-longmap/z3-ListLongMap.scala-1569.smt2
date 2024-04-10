; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29904 () Bool)

(assert start!29904)

(declare-fun b!300645 () Bool)

(declare-fun res!158538 () Bool)

(declare-fun e!189824 () Bool)

(assert (=> b!300645 (=> (not res!158538) (not e!189824))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!15182 0))(
  ( (array!15183 (arr!7185 (Array (_ BitVec 32) (_ BitVec 64))) (size!7537 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15182)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!300645 (= res!158538 (and (= (size!7537 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7537 a!3312))))))

(declare-fun b!300646 () Bool)

(declare-fun res!158541 () Bool)

(assert (=> b!300646 (=> (not res!158541) (not e!189824))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300646 (= res!158541 (validKeyInArray!0 k0!2524))))

(declare-fun b!300647 () Bool)

(declare-fun res!158537 () Bool)

(assert (=> b!300647 (=> (not res!158537) (not e!189824))))

(declare-fun arrayContainsKey!0 (array!15182 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300647 (= res!158537 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!158536 () Bool)

(assert (=> start!29904 (=> (not res!158536) (not e!189824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29904 (= res!158536 (validMask!0 mask!3809))))

(assert (=> start!29904 e!189824))

(assert (=> start!29904 true))

(declare-fun array_inv!5148 (array!15182) Bool)

(assert (=> start!29904 (array_inv!5148 a!3312)))

(declare-fun b!300648 () Bool)

(declare-fun e!189825 () Bool)

(assert (=> b!300648 (= e!189824 e!189825)))

(declare-fun res!158539 () Bool)

(assert (=> b!300648 (=> (not res!158539) (not e!189825))))

(declare-fun lt!149580 () Bool)

(declare-datatypes ((SeekEntryResult!2334 0))(
  ( (MissingZero!2334 (index!11512 (_ BitVec 32))) (Found!2334 (index!11513 (_ BitVec 32))) (Intermediate!2334 (undefined!3146 Bool) (index!11514 (_ BitVec 32)) (x!29768 (_ BitVec 32))) (Undefined!2334) (MissingVacant!2334 (index!11515 (_ BitVec 32))) )
))
(declare-fun lt!149577 () SeekEntryResult!2334)

(assert (=> b!300648 (= res!158539 (or lt!149580 (= lt!149577 (MissingVacant!2334 i!1256))))))

(assert (=> b!300648 (= lt!149580 (= lt!149577 (MissingZero!2334 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15182 (_ BitVec 32)) SeekEntryResult!2334)

(assert (=> b!300648 (= lt!149577 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun lt!149578 () SeekEntryResult!2334)

(declare-fun b!300649 () Bool)

(get-info :version)

(assert (=> b!300649 (= e!189825 (and (not lt!149580) (= lt!149577 (MissingVacant!2334 i!1256)) (not ((_ is Intermediate!2334) lt!149578))))))

(declare-fun lt!149576 () (_ BitVec 32))

(declare-fun lt!149579 () SeekEntryResult!2334)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15182 (_ BitVec 32)) SeekEntryResult!2334)

(assert (=> b!300649 (= lt!149579 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149576 k0!2524 (array!15183 (store (arr!7185 a!3312) i!1256 k0!2524) (size!7537 a!3312)) mask!3809))))

(assert (=> b!300649 (= lt!149578 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149576 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300649 (= lt!149576 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!300650 () Bool)

(declare-fun res!158540 () Bool)

(assert (=> b!300650 (=> (not res!158540) (not e!189825))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15182 (_ BitVec 32)) Bool)

(assert (=> b!300650 (= res!158540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29904 res!158536) b!300645))

(assert (= (and b!300645 res!158538) b!300646))

(assert (= (and b!300646 res!158541) b!300647))

(assert (= (and b!300647 res!158537) b!300648))

(assert (= (and b!300648 res!158539) b!300650))

(assert (= (and b!300650 res!158540) b!300649))

(declare-fun m!312629 () Bool)

(assert (=> b!300648 m!312629))

(declare-fun m!312631 () Bool)

(assert (=> b!300650 m!312631))

(declare-fun m!312633 () Bool)

(assert (=> start!29904 m!312633))

(declare-fun m!312635 () Bool)

(assert (=> start!29904 m!312635))

(declare-fun m!312637 () Bool)

(assert (=> b!300649 m!312637))

(declare-fun m!312639 () Bool)

(assert (=> b!300649 m!312639))

(declare-fun m!312641 () Bool)

(assert (=> b!300649 m!312641))

(declare-fun m!312643 () Bool)

(assert (=> b!300649 m!312643))

(declare-fun m!312645 () Bool)

(assert (=> b!300647 m!312645))

(declare-fun m!312647 () Bool)

(assert (=> b!300646 m!312647))

(check-sat (not b!300650) (not start!29904) (not b!300647) (not b!300649) (not b!300648) (not b!300646))
(check-sat)
(get-model)

(declare-fun b!300693 () Bool)

(declare-fun e!189849 () SeekEntryResult!2334)

(assert (=> b!300693 (= e!189849 Undefined!2334)))

(declare-fun b!300694 () Bool)

(declare-fun e!189850 () SeekEntryResult!2334)

(declare-fun lt!149608 () SeekEntryResult!2334)

(assert (=> b!300694 (= e!189850 (MissingZero!2334 (index!11514 lt!149608)))))

(declare-fun b!300695 () Bool)

(declare-fun c!48661 () Bool)

(declare-fun lt!149606 () (_ BitVec 64))

(assert (=> b!300695 (= c!48661 (= lt!149606 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!189848 () SeekEntryResult!2334)

(assert (=> b!300695 (= e!189848 e!189850)))

(declare-fun b!300696 () Bool)

(assert (=> b!300696 (= e!189848 (Found!2334 (index!11514 lt!149608)))))

(declare-fun d!67775 () Bool)

(declare-fun lt!149607 () SeekEntryResult!2334)

(assert (=> d!67775 (and (or ((_ is Undefined!2334) lt!149607) (not ((_ is Found!2334) lt!149607)) (and (bvsge (index!11513 lt!149607) #b00000000000000000000000000000000) (bvslt (index!11513 lt!149607) (size!7537 a!3312)))) (or ((_ is Undefined!2334) lt!149607) ((_ is Found!2334) lt!149607) (not ((_ is MissingZero!2334) lt!149607)) (and (bvsge (index!11512 lt!149607) #b00000000000000000000000000000000) (bvslt (index!11512 lt!149607) (size!7537 a!3312)))) (or ((_ is Undefined!2334) lt!149607) ((_ is Found!2334) lt!149607) ((_ is MissingZero!2334) lt!149607) (not ((_ is MissingVacant!2334) lt!149607)) (and (bvsge (index!11515 lt!149607) #b00000000000000000000000000000000) (bvslt (index!11515 lt!149607) (size!7537 a!3312)))) (or ((_ is Undefined!2334) lt!149607) (ite ((_ is Found!2334) lt!149607) (= (select (arr!7185 a!3312) (index!11513 lt!149607)) k0!2524) (ite ((_ is MissingZero!2334) lt!149607) (= (select (arr!7185 a!3312) (index!11512 lt!149607)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2334) lt!149607) (= (select (arr!7185 a!3312) (index!11515 lt!149607)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67775 (= lt!149607 e!189849)))

(declare-fun c!48663 () Bool)

(assert (=> d!67775 (= c!48663 (and ((_ is Intermediate!2334) lt!149608) (undefined!3146 lt!149608)))))

(assert (=> d!67775 (= lt!149608 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67775 (validMask!0 mask!3809)))

(assert (=> d!67775 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!149607)))

(declare-fun b!300697 () Bool)

(assert (=> b!300697 (= e!189849 e!189848)))

(assert (=> b!300697 (= lt!149606 (select (arr!7185 a!3312) (index!11514 lt!149608)))))

(declare-fun c!48662 () Bool)

(assert (=> b!300697 (= c!48662 (= lt!149606 k0!2524))))

(declare-fun b!300698 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15182 (_ BitVec 32)) SeekEntryResult!2334)

(assert (=> b!300698 (= e!189850 (seekKeyOrZeroReturnVacant!0 (x!29768 lt!149608) (index!11514 lt!149608) (index!11514 lt!149608) k0!2524 a!3312 mask!3809))))

(assert (= (and d!67775 c!48663) b!300693))

(assert (= (and d!67775 (not c!48663)) b!300697))

(assert (= (and b!300697 c!48662) b!300696))

(assert (= (and b!300697 (not c!48662)) b!300695))

(assert (= (and b!300695 c!48661) b!300694))

(assert (= (and b!300695 (not c!48661)) b!300698))

(assert (=> d!67775 m!312643))

(declare-fun m!312669 () Bool)

(assert (=> d!67775 m!312669))

(declare-fun m!312671 () Bool)

(assert (=> d!67775 m!312671))

(declare-fun m!312673 () Bool)

(assert (=> d!67775 m!312673))

(assert (=> d!67775 m!312633))

(assert (=> d!67775 m!312643))

(declare-fun m!312675 () Bool)

(assert (=> d!67775 m!312675))

(declare-fun m!312677 () Bool)

(assert (=> b!300697 m!312677))

(declare-fun m!312679 () Bool)

(assert (=> b!300698 m!312679))

(assert (=> b!300648 d!67775))

(declare-fun d!67781 () Bool)

(declare-fun res!158570 () Bool)

(declare-fun e!189859 () Bool)

(assert (=> d!67781 (=> res!158570 e!189859)))

(assert (=> d!67781 (= res!158570 (= (select (arr!7185 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67781 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!189859)))

(declare-fun b!300709 () Bool)

(declare-fun e!189860 () Bool)

(assert (=> b!300709 (= e!189859 e!189860)))

(declare-fun res!158571 () Bool)

(assert (=> b!300709 (=> (not res!158571) (not e!189860))))

(assert (=> b!300709 (= res!158571 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7537 a!3312)))))

(declare-fun b!300710 () Bool)

(assert (=> b!300710 (= e!189860 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67781 (not res!158570)) b!300709))

(assert (= (and b!300709 res!158571) b!300710))

(declare-fun m!312681 () Bool)

(assert (=> d!67781 m!312681))

(declare-fun m!312683 () Bool)

(assert (=> b!300710 m!312683))

(assert (=> b!300647 d!67781))

(declare-fun d!67783 () Bool)

(assert (=> d!67783 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!300646 d!67783))

(declare-fun b!300755 () Bool)

(declare-fun e!189887 () Bool)

(declare-fun e!189888 () Bool)

(assert (=> b!300755 (= e!189887 e!189888)))

(declare-fun c!48681 () Bool)

(assert (=> b!300755 (= c!48681 (validKeyInArray!0 (select (arr!7185 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!300756 () Bool)

(declare-fun e!189886 () Bool)

(assert (=> b!300756 (= e!189888 e!189886)))

(declare-fun lt!149636 () (_ BitVec 64))

(assert (=> b!300756 (= lt!149636 (select (arr!7185 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9367 0))(
  ( (Unit!9368) )
))
(declare-fun lt!149634 () Unit!9367)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15182 (_ BitVec 64) (_ BitVec 32)) Unit!9367)

(assert (=> b!300756 (= lt!149634 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!149636 #b00000000000000000000000000000000))))

(assert (=> b!300756 (arrayContainsKey!0 a!3312 lt!149636 #b00000000000000000000000000000000)))

(declare-fun lt!149635 () Unit!9367)

(assert (=> b!300756 (= lt!149635 lt!149634)))

(declare-fun res!158583 () Bool)

(assert (=> b!300756 (= res!158583 (= (seekEntryOrOpen!0 (select (arr!7185 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2334 #b00000000000000000000000000000000)))))

(assert (=> b!300756 (=> (not res!158583) (not e!189886))))

(declare-fun bm!25855 () Bool)

(declare-fun call!25858 () Bool)

(assert (=> bm!25855 (= call!25858 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!67785 () Bool)

(declare-fun res!158584 () Bool)

(assert (=> d!67785 (=> res!158584 e!189887)))

(assert (=> d!67785 (= res!158584 (bvsge #b00000000000000000000000000000000 (size!7537 a!3312)))))

(assert (=> d!67785 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!189887)))

(declare-fun b!300757 () Bool)

(assert (=> b!300757 (= e!189888 call!25858)))

(declare-fun b!300758 () Bool)

(assert (=> b!300758 (= e!189886 call!25858)))

(assert (= (and d!67785 (not res!158584)) b!300755))

(assert (= (and b!300755 c!48681) b!300756))

(assert (= (and b!300755 (not c!48681)) b!300757))

(assert (= (and b!300756 res!158583) b!300758))

(assert (= (or b!300758 b!300757) bm!25855))

(assert (=> b!300755 m!312681))

(assert (=> b!300755 m!312681))

(declare-fun m!312711 () Bool)

(assert (=> b!300755 m!312711))

(assert (=> b!300756 m!312681))

(declare-fun m!312713 () Bool)

(assert (=> b!300756 m!312713))

(declare-fun m!312715 () Bool)

(assert (=> b!300756 m!312715))

(assert (=> b!300756 m!312681))

(declare-fun m!312717 () Bool)

(assert (=> b!300756 m!312717))

(declare-fun m!312719 () Bool)

(assert (=> bm!25855 m!312719))

(assert (=> b!300650 d!67785))

(declare-fun b!300785 () Bool)

(declare-fun e!189906 () SeekEntryResult!2334)

(assert (=> b!300785 (= e!189906 (Intermediate!2334 true lt!149576 #b00000000000000000000000000000000))))

(declare-fun b!300786 () Bool)

(declare-fun lt!149648 () SeekEntryResult!2334)

(assert (=> b!300786 (and (bvsge (index!11514 lt!149648) #b00000000000000000000000000000000) (bvslt (index!11514 lt!149648) (size!7537 (array!15183 (store (arr!7185 a!3312) i!1256 k0!2524) (size!7537 a!3312)))))))

(declare-fun e!189907 () Bool)

(assert (=> b!300786 (= e!189907 (= (select (arr!7185 (array!15183 (store (arr!7185 a!3312) i!1256 k0!2524) (size!7537 a!3312))) (index!11514 lt!149648)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!67799 () Bool)

(declare-fun e!189909 () Bool)

(assert (=> d!67799 e!189909))

(declare-fun c!48692 () Bool)

(assert (=> d!67799 (= c!48692 (and ((_ is Intermediate!2334) lt!149648) (undefined!3146 lt!149648)))))

(assert (=> d!67799 (= lt!149648 e!189906)))

(declare-fun c!48690 () Bool)

(assert (=> d!67799 (= c!48690 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!149647 () (_ BitVec 64))

(assert (=> d!67799 (= lt!149647 (select (arr!7185 (array!15183 (store (arr!7185 a!3312) i!1256 k0!2524) (size!7537 a!3312))) lt!149576))))

(assert (=> d!67799 (validMask!0 mask!3809)))

(assert (=> d!67799 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149576 k0!2524 (array!15183 (store (arr!7185 a!3312) i!1256 k0!2524) (size!7537 a!3312)) mask!3809) lt!149648)))

(declare-fun e!189908 () SeekEntryResult!2334)

(declare-fun b!300787 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300787 (= e!189908 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149576 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!15183 (store (arr!7185 a!3312) i!1256 k0!2524) (size!7537 a!3312)) mask!3809))))

(declare-fun b!300788 () Bool)

(assert (=> b!300788 (and (bvsge (index!11514 lt!149648) #b00000000000000000000000000000000) (bvslt (index!11514 lt!149648) (size!7537 (array!15183 (store (arr!7185 a!3312) i!1256 k0!2524) (size!7537 a!3312)))))))

(declare-fun res!158595 () Bool)

(assert (=> b!300788 (= res!158595 (= (select (arr!7185 (array!15183 (store (arr!7185 a!3312) i!1256 k0!2524) (size!7537 a!3312))) (index!11514 lt!149648)) k0!2524))))

(assert (=> b!300788 (=> res!158595 e!189907)))

(declare-fun e!189905 () Bool)

(assert (=> b!300788 (= e!189905 e!189907)))

(declare-fun b!300789 () Bool)

(assert (=> b!300789 (= e!189906 e!189908)))

(declare-fun c!48691 () Bool)

(assert (=> b!300789 (= c!48691 (or (= lt!149647 k0!2524) (= (bvadd lt!149647 lt!149647) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!300790 () Bool)

(assert (=> b!300790 (= e!189909 e!189905)))

(declare-fun res!158597 () Bool)

(assert (=> b!300790 (= res!158597 (and ((_ is Intermediate!2334) lt!149648) (not (undefined!3146 lt!149648)) (bvslt (x!29768 lt!149648) #b01111111111111111111111111111110) (bvsge (x!29768 lt!149648) #b00000000000000000000000000000000) (bvsge (x!29768 lt!149648) #b00000000000000000000000000000000)))))

(assert (=> b!300790 (=> (not res!158597) (not e!189905))))

(declare-fun b!300791 () Bool)

(assert (=> b!300791 (= e!189909 (bvsge (x!29768 lt!149648) #b01111111111111111111111111111110))))

(declare-fun b!300792 () Bool)

(assert (=> b!300792 (and (bvsge (index!11514 lt!149648) #b00000000000000000000000000000000) (bvslt (index!11514 lt!149648) (size!7537 (array!15183 (store (arr!7185 a!3312) i!1256 k0!2524) (size!7537 a!3312)))))))

(declare-fun res!158596 () Bool)

(assert (=> b!300792 (= res!158596 (= (select (arr!7185 (array!15183 (store (arr!7185 a!3312) i!1256 k0!2524) (size!7537 a!3312))) (index!11514 lt!149648)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!300792 (=> res!158596 e!189907)))

(declare-fun b!300793 () Bool)

(assert (=> b!300793 (= e!189908 (Intermediate!2334 false lt!149576 #b00000000000000000000000000000000))))

(assert (= (and d!67799 c!48690) b!300785))

(assert (= (and d!67799 (not c!48690)) b!300789))

(assert (= (and b!300789 c!48691) b!300793))

(assert (= (and b!300789 (not c!48691)) b!300787))

(assert (= (and d!67799 c!48692) b!300791))

(assert (= (and d!67799 (not c!48692)) b!300790))

(assert (= (and b!300790 res!158597) b!300788))

(assert (= (and b!300788 (not res!158595)) b!300792))

(assert (= (and b!300792 (not res!158596)) b!300786))

(declare-fun m!312721 () Bool)

(assert (=> b!300786 m!312721))

(declare-fun m!312723 () Bool)

(assert (=> b!300787 m!312723))

(assert (=> b!300787 m!312723))

(declare-fun m!312725 () Bool)

(assert (=> b!300787 m!312725))

(assert (=> b!300792 m!312721))

(assert (=> b!300788 m!312721))

(declare-fun m!312727 () Bool)

(assert (=> d!67799 m!312727))

(assert (=> d!67799 m!312633))

(assert (=> b!300649 d!67799))

(declare-fun b!300794 () Bool)

(declare-fun e!189911 () SeekEntryResult!2334)

(assert (=> b!300794 (= e!189911 (Intermediate!2334 true lt!149576 #b00000000000000000000000000000000))))

(declare-fun b!300795 () Bool)

(declare-fun lt!149650 () SeekEntryResult!2334)

(assert (=> b!300795 (and (bvsge (index!11514 lt!149650) #b00000000000000000000000000000000) (bvslt (index!11514 lt!149650) (size!7537 a!3312)))))

(declare-fun e!189912 () Bool)

(assert (=> b!300795 (= e!189912 (= (select (arr!7185 a!3312) (index!11514 lt!149650)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!67809 () Bool)

(declare-fun e!189914 () Bool)

(assert (=> d!67809 e!189914))

(declare-fun c!48695 () Bool)

(assert (=> d!67809 (= c!48695 (and ((_ is Intermediate!2334) lt!149650) (undefined!3146 lt!149650)))))

(assert (=> d!67809 (= lt!149650 e!189911)))

(declare-fun c!48693 () Bool)

(assert (=> d!67809 (= c!48693 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!149649 () (_ BitVec 64))

(assert (=> d!67809 (= lt!149649 (select (arr!7185 a!3312) lt!149576))))

(assert (=> d!67809 (validMask!0 mask!3809)))

(assert (=> d!67809 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149576 k0!2524 a!3312 mask!3809) lt!149650)))

(declare-fun b!300796 () Bool)

(declare-fun e!189913 () SeekEntryResult!2334)

(assert (=> b!300796 (= e!189913 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149576 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!300797 () Bool)

(assert (=> b!300797 (and (bvsge (index!11514 lt!149650) #b00000000000000000000000000000000) (bvslt (index!11514 lt!149650) (size!7537 a!3312)))))

(declare-fun res!158598 () Bool)

(assert (=> b!300797 (= res!158598 (= (select (arr!7185 a!3312) (index!11514 lt!149650)) k0!2524))))

(assert (=> b!300797 (=> res!158598 e!189912)))

(declare-fun e!189910 () Bool)

(assert (=> b!300797 (= e!189910 e!189912)))

(declare-fun b!300798 () Bool)

(assert (=> b!300798 (= e!189911 e!189913)))

(declare-fun c!48694 () Bool)

(assert (=> b!300798 (= c!48694 (or (= lt!149649 k0!2524) (= (bvadd lt!149649 lt!149649) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!300799 () Bool)

(assert (=> b!300799 (= e!189914 e!189910)))

(declare-fun res!158600 () Bool)

(assert (=> b!300799 (= res!158600 (and ((_ is Intermediate!2334) lt!149650) (not (undefined!3146 lt!149650)) (bvslt (x!29768 lt!149650) #b01111111111111111111111111111110) (bvsge (x!29768 lt!149650) #b00000000000000000000000000000000) (bvsge (x!29768 lt!149650) #b00000000000000000000000000000000)))))

(assert (=> b!300799 (=> (not res!158600) (not e!189910))))

(declare-fun b!300800 () Bool)

(assert (=> b!300800 (= e!189914 (bvsge (x!29768 lt!149650) #b01111111111111111111111111111110))))

(declare-fun b!300801 () Bool)

(assert (=> b!300801 (and (bvsge (index!11514 lt!149650) #b00000000000000000000000000000000) (bvslt (index!11514 lt!149650) (size!7537 a!3312)))))

(declare-fun res!158599 () Bool)

(assert (=> b!300801 (= res!158599 (= (select (arr!7185 a!3312) (index!11514 lt!149650)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!300801 (=> res!158599 e!189912)))

(declare-fun b!300802 () Bool)

(assert (=> b!300802 (= e!189913 (Intermediate!2334 false lt!149576 #b00000000000000000000000000000000))))

(assert (= (and d!67809 c!48693) b!300794))

(assert (= (and d!67809 (not c!48693)) b!300798))

(assert (= (and b!300798 c!48694) b!300802))

(assert (= (and b!300798 (not c!48694)) b!300796))

(assert (= (and d!67809 c!48695) b!300800))

(assert (= (and d!67809 (not c!48695)) b!300799))

(assert (= (and b!300799 res!158600) b!300797))

(assert (= (and b!300797 (not res!158598)) b!300801))

(assert (= (and b!300801 (not res!158599)) b!300795))

(declare-fun m!312729 () Bool)

(assert (=> b!300795 m!312729))

(assert (=> b!300796 m!312723))

(assert (=> b!300796 m!312723))

(declare-fun m!312731 () Bool)

(assert (=> b!300796 m!312731))

(assert (=> b!300801 m!312729))

(assert (=> b!300797 m!312729))

(declare-fun m!312733 () Bool)

(assert (=> d!67809 m!312733))

(assert (=> d!67809 m!312633))

(assert (=> b!300649 d!67809))

(declare-fun d!67811 () Bool)

(declare-fun lt!149665 () (_ BitVec 32))

(declare-fun lt!149664 () (_ BitVec 32))

(assert (=> d!67811 (= lt!149665 (bvmul (bvxor lt!149664 (bvlshr lt!149664 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67811 (= lt!149664 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67811 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!158603 (let ((h!5326 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29773 (bvmul (bvxor h!5326 (bvlshr h!5326 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29773 (bvlshr x!29773 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!158603 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!158603 #b00000000000000000000000000000000))))))

(assert (=> d!67811 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!149665 (bvlshr lt!149665 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!300649 d!67811))

(declare-fun d!67815 () Bool)

(assert (=> d!67815 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29904 d!67815))

(declare-fun d!67819 () Bool)

(assert (=> d!67819 (= (array_inv!5148 a!3312) (bvsge (size!7537 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29904 d!67819))

(check-sat (not b!300796) (not b!300698) (not d!67799) (not b!300787) (not b!300755) (not bm!25855) (not d!67809) (not b!300710) (not d!67775) (not b!300756))
(check-sat)
