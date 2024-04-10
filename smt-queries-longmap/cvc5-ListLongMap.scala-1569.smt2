; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29902 () Bool)

(assert start!29902)

(declare-fun b!300627 () Bool)

(declare-fun res!158523 () Bool)

(declare-fun e!189817 () Bool)

(assert (=> b!300627 (=> (not res!158523) (not e!189817))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300627 (= res!158523 (validKeyInArray!0 k!2524))))

(declare-fun b!300628 () Bool)

(declare-fun res!158519 () Bool)

(assert (=> b!300628 (=> (not res!158519) (not e!189817))))

(declare-datatypes ((array!15180 0))(
  ( (array!15181 (arr!7184 (Array (_ BitVec 32) (_ BitVec 64))) (size!7536 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15180)

(declare-fun arrayContainsKey!0 (array!15180 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300628 (= res!158519 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun e!189815 () Bool)

(declare-datatypes ((SeekEntryResult!2333 0))(
  ( (MissingZero!2333 (index!11508 (_ BitVec 32))) (Found!2333 (index!11509 (_ BitVec 32))) (Intermediate!2333 (undefined!3145 Bool) (index!11510 (_ BitVec 32)) (x!29767 (_ BitVec 32))) (Undefined!2333) (MissingVacant!2333 (index!11511 (_ BitVec 32))) )
))
(declare-fun lt!149565 () SeekEntryResult!2333)

(declare-fun b!300629 () Bool)

(declare-fun lt!149563 () SeekEntryResult!2333)

(declare-fun lt!149561 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!300629 (= e!189815 (and (not lt!149561) (= lt!149565 (MissingVacant!2333 i!1256)) (not (is-Intermediate!2333 lt!149563))))))

(declare-fun lt!149562 () (_ BitVec 32))

(declare-fun lt!149564 () SeekEntryResult!2333)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15180 (_ BitVec 32)) SeekEntryResult!2333)

(assert (=> b!300629 (= lt!149564 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149562 k!2524 (array!15181 (store (arr!7184 a!3312) i!1256 k!2524) (size!7536 a!3312)) mask!3809))))

(assert (=> b!300629 (= lt!149563 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149562 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300629 (= lt!149562 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!300630 () Bool)

(declare-fun res!158522 () Bool)

(assert (=> b!300630 (=> (not res!158522) (not e!189817))))

(assert (=> b!300630 (= res!158522 (and (= (size!7536 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7536 a!3312))))))

(declare-fun res!158521 () Bool)

(assert (=> start!29902 (=> (not res!158521) (not e!189817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29902 (= res!158521 (validMask!0 mask!3809))))

(assert (=> start!29902 e!189817))

(assert (=> start!29902 true))

(declare-fun array_inv!5147 (array!15180) Bool)

(assert (=> start!29902 (array_inv!5147 a!3312)))

(declare-fun b!300631 () Bool)

(declare-fun res!158520 () Bool)

(assert (=> b!300631 (=> (not res!158520) (not e!189815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15180 (_ BitVec 32)) Bool)

(assert (=> b!300631 (= res!158520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!300632 () Bool)

(assert (=> b!300632 (= e!189817 e!189815)))

(declare-fun res!158518 () Bool)

(assert (=> b!300632 (=> (not res!158518) (not e!189815))))

(assert (=> b!300632 (= res!158518 (or lt!149561 (= lt!149565 (MissingVacant!2333 i!1256))))))

(assert (=> b!300632 (= lt!149561 (= lt!149565 (MissingZero!2333 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15180 (_ BitVec 32)) SeekEntryResult!2333)

(assert (=> b!300632 (= lt!149565 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!29902 res!158521) b!300630))

(assert (= (and b!300630 res!158522) b!300627))

(assert (= (and b!300627 res!158523) b!300628))

(assert (= (and b!300628 res!158519) b!300632))

(assert (= (and b!300632 res!158518) b!300631))

(assert (= (and b!300631 res!158520) b!300629))

(declare-fun m!312609 () Bool)

(assert (=> b!300629 m!312609))

(declare-fun m!312611 () Bool)

(assert (=> b!300629 m!312611))

(declare-fun m!312613 () Bool)

(assert (=> b!300629 m!312613))

(declare-fun m!312615 () Bool)

(assert (=> b!300629 m!312615))

(declare-fun m!312617 () Bool)

(assert (=> b!300627 m!312617))

(declare-fun m!312619 () Bool)

(assert (=> b!300632 m!312619))

(declare-fun m!312621 () Bool)

(assert (=> start!29902 m!312621))

(declare-fun m!312623 () Bool)

(assert (=> start!29902 m!312623))

(declare-fun m!312625 () Bool)

(assert (=> b!300628 m!312625))

(declare-fun m!312627 () Bool)

(assert (=> b!300631 m!312627))

(push 1)

(assert (not start!29902))

(assert (not b!300632))

(assert (not b!300629))

(assert (not b!300627))

(assert (not b!300628))

(assert (not b!300631))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!300743 () Bool)

(declare-fun e!189880 () SeekEntryResult!2333)

(declare-fun e!189879 () SeekEntryResult!2333)

(assert (=> b!300743 (= e!189880 e!189879)))

(declare-fun lt!149625 () (_ BitVec 64))

(declare-fun lt!149623 () SeekEntryResult!2333)

(assert (=> b!300743 (= lt!149625 (select (arr!7184 a!3312) (index!11510 lt!149623)))))

(declare-fun c!48678 () Bool)

(assert (=> b!300743 (= c!48678 (= lt!149625 k!2524))))

(declare-fun b!300744 () Bool)

(declare-fun c!48676 () Bool)

(assert (=> b!300744 (= c!48676 (= lt!149625 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!189881 () SeekEntryResult!2333)

(assert (=> b!300744 (= e!189879 e!189881)))

(declare-fun d!67779 () Bool)

(declare-fun lt!149624 () SeekEntryResult!2333)

(assert (=> d!67779 (and (or (is-Undefined!2333 lt!149624) (not (is-Found!2333 lt!149624)) (and (bvsge (index!11509 lt!149624) #b00000000000000000000000000000000) (bvslt (index!11509 lt!149624) (size!7536 a!3312)))) (or (is-Undefined!2333 lt!149624) (is-Found!2333 lt!149624) (not (is-MissingZero!2333 lt!149624)) (and (bvsge (index!11508 lt!149624) #b00000000000000000000000000000000) (bvslt (index!11508 lt!149624) (size!7536 a!3312)))) (or (is-Undefined!2333 lt!149624) (is-Found!2333 lt!149624) (is-MissingZero!2333 lt!149624) (not (is-MissingVacant!2333 lt!149624)) (and (bvsge (index!11511 lt!149624) #b00000000000000000000000000000000) (bvslt (index!11511 lt!149624) (size!7536 a!3312)))) (or (is-Undefined!2333 lt!149624) (ite (is-Found!2333 lt!149624) (= (select (arr!7184 a!3312) (index!11509 lt!149624)) k!2524) (ite (is-MissingZero!2333 lt!149624) (= (select (arr!7184 a!3312) (index!11508 lt!149624)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2333 lt!149624) (= (select (arr!7184 a!3312) (index!11511 lt!149624)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67779 (= lt!149624 e!189880)))

(declare-fun c!48677 () Bool)

(assert (=> d!67779 (= c!48677 (and (is-Intermediate!2333 lt!149623) (undefined!3145 lt!149623)))))

(assert (=> d!67779 (= lt!149623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!67779 (validMask!0 mask!3809)))

(assert (=> d!67779 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!149624)))

(declare-fun b!300745 () Bool)

(assert (=> b!300745 (= e!189880 Undefined!2333)))

(declare-fun b!300746 () Bool)

(assert (=> b!300746 (= e!189879 (Found!2333 (index!11510 lt!149623)))))

(declare-fun b!300747 () Bool)

(assert (=> b!300747 (= e!189881 (MissingZero!2333 (index!11510 lt!149623)))))

(declare-fun b!300748 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15180 (_ BitVec 32)) SeekEntryResult!2333)

(assert (=> b!300748 (= e!189881 (seekKeyOrZeroReturnVacant!0 (x!29767 lt!149623) (index!11510 lt!149623) (index!11510 lt!149623) k!2524 a!3312 mask!3809))))

(assert (= (and d!67779 c!48677) b!300745))

(assert (= (and d!67779 (not c!48677)) b!300743))

(assert (= (and b!300743 c!48678) b!300746))

(assert (= (and b!300743 (not c!48678)) b!300744))

(assert (= (and b!300744 c!48676) b!300747))

(assert (= (and b!300744 (not c!48676)) b!300748))

(declare-fun m!312699 () Bool)

(assert (=> b!300743 m!312699))

(assert (=> d!67779 m!312621))

(declare-fun m!312701 () Bool)

(assert (=> d!67779 m!312701))

(declare-fun m!312703 () Bool)

(assert (=> d!67779 m!312703))

(declare-fun m!312705 () Bool)

(assert (=> d!67779 m!312705))

(assert (=> d!67779 m!312615))

(declare-fun m!312707 () Bool)

(assert (=> d!67779 m!312707))

(assert (=> d!67779 m!312615))

(declare-fun m!312709 () Bool)

(assert (=> b!300748 m!312709))

(assert (=> b!300632 d!67779))

(declare-fun d!67793 () Bool)

(assert (=> d!67793 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!300627 d!67793))

(declare-fun d!67797 () Bool)

(assert (=> d!67797 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29902 d!67797))

(declare-fun d!67805 () Bool)

(assert (=> d!67805 (= (array_inv!5147 a!3312) (bvsge (size!7536 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29902 d!67805))

(declare-fun b!300803 () Bool)

(declare-fun e!189916 () Bool)

(declare-fun e!189917 () Bool)

(assert (=> b!300803 (= e!189916 e!189917)))

(declare-fun lt!149652 () (_ BitVec 64))

(assert (=> b!300803 (= lt!149652 (select (arr!7184 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9369 0))(
  ( (Unit!9370) )
))
(declare-fun lt!149653 () Unit!9369)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15180 (_ BitVec 64) (_ BitVec 32)) Unit!9369)

(assert (=> b!300803 (= lt!149653 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!149652 #b00000000000000000000000000000000))))

(assert (=> b!300803 (arrayContainsKey!0 a!3312 lt!149652 #b00000000000000000000000000000000)))

(declare-fun lt!149651 () Unit!9369)

(assert (=> b!300803 (= lt!149651 lt!149653)))

(declare-fun res!158602 () Bool)

(assert (=> b!300803 (= res!158602 (= (seekEntryOrOpen!0 (select (arr!7184 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2333 #b00000000000000000000000000000000)))))

(assert (=> b!300803 (=> (not res!158602) (not e!189917))))

(declare-fun b!300804 () Bool)

(declare-fun e!189915 () Bool)

(assert (=> b!300804 (= e!189915 e!189916)))

(declare-fun c!48696 () Bool)

(assert (=> b!300804 (= c!48696 (validKeyInArray!0 (select (arr!7184 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!67807 () Bool)

(declare-fun res!158601 () Bool)

(assert (=> d!67807 (=> res!158601 e!189915)))

(assert (=> d!67807 (= res!158601 (bvsge #b00000000000000000000000000000000 (size!7536 a!3312)))))

(assert (=> d!67807 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!189915)))

(declare-fun b!300805 () Bool)

(declare-fun call!25861 () Bool)

(assert (=> b!300805 (= e!189916 call!25861)))

(declare-fun b!300806 () Bool)

(assert (=> b!300806 (= e!189917 call!25861)))

(declare-fun bm!25858 () Bool)

(assert (=> bm!25858 (= call!25861 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(assert (= (and d!67807 (not res!158601)) b!300804))

(assert (= (and b!300804 c!48696) b!300803))

(assert (= (and b!300804 (not c!48696)) b!300805))

(assert (= (and b!300803 res!158602) b!300806))

(assert (= (or b!300806 b!300805) bm!25858))

(declare-fun m!312735 () Bool)

(assert (=> b!300803 m!312735))

(declare-fun m!312737 () Bool)

(assert (=> b!300803 m!312737))

(declare-fun m!312739 () Bool)

(assert (=> b!300803 m!312739))

(assert (=> b!300803 m!312735))

(declare-fun m!312741 () Bool)

(assert (=> b!300803 m!312741))

(assert (=> b!300804 m!312735))

(assert (=> b!300804 m!312735))

(declare-fun m!312743 () Bool)

(assert (=> b!300804 m!312743))

(declare-fun m!312745 () Bool)

(assert (=> bm!25858 m!312745))

(assert (=> b!300631 d!67807))

(declare-fun lt!149683 () SeekEntryResult!2333)

(declare-fun b!300861 () Bool)

(assert (=> b!300861 (and (bvsge (index!11510 lt!149683) #b00000000000000000000000000000000) (bvslt (index!11510 lt!149683) (size!7536 (array!15181 (store (arr!7184 a!3312) i!1256 k!2524) (size!7536 a!3312)))))))

(declare-fun res!158622 () Bool)

(assert (=> b!300861 (= res!158622 (= (select (arr!7184 (array!15181 (store (arr!7184 a!3312) i!1256 k!2524) (size!7536 a!3312))) (index!11510 lt!149683)) k!2524))))

(declare-fun e!189956 () Bool)

(assert (=> b!300861 (=> res!158622 e!189956)))

(declare-fun e!189954 () Bool)

(assert (=> b!300861 (= e!189954 e!189956)))

(declare-fun b!300862 () Bool)

(declare-fun e!189952 () SeekEntryResult!2333)

(assert (=> b!300862 (= e!189952 (Intermediate!2333 false lt!149562 #b00000000000000000000000000000000))))

(declare-fun b!300863 () Bool)

(declare-fun e!189955 () Bool)

(assert (=> b!300863 (= e!189955 (bvsge (x!29767 lt!149683) #b01111111111111111111111111111110))))

(declare-fun b!300864 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300864 (= e!189952 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149562 #b00000000000000000000000000000000 mask!3809) k!2524 (array!15181 (store (arr!7184 a!3312) i!1256 k!2524) (size!7536 a!3312)) mask!3809))))

(declare-fun d!67813 () Bool)

(assert (=> d!67813 e!189955))

(declare-fun c!48715 () Bool)

(assert (=> d!67813 (= c!48715 (and (is-Intermediate!2333 lt!149683) (undefined!3145 lt!149683)))))

(declare-fun e!189953 () SeekEntryResult!2333)

(assert (=> d!67813 (= lt!149683 e!189953)))

(declare-fun c!48716 () Bool)

(assert (=> d!67813 (= c!48716 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!149682 () (_ BitVec 64))

(assert (=> d!67813 (= lt!149682 (select (arr!7184 (array!15181 (store (arr!7184 a!3312) i!1256 k!2524) (size!7536 a!3312))) lt!149562))))

(assert (=> d!67813 (validMask!0 mask!3809)))

(assert (=> d!67813 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149562 k!2524 (array!15181 (store (arr!7184 a!3312) i!1256 k!2524) (size!7536 a!3312)) mask!3809) lt!149683)))

(declare-fun b!300865 () Bool)

(assert (=> b!300865 (and (bvsge (index!11510 lt!149683) #b00000000000000000000000000000000) (bvslt (index!11510 lt!149683) (size!7536 (array!15181 (store (arr!7184 a!3312) i!1256 k!2524) (size!7536 a!3312)))))))

(assert (=> b!300865 (= e!189956 (= (select (arr!7184 (array!15181 (store (arr!7184 a!3312) i!1256 k!2524) (size!7536 a!3312))) (index!11510 lt!149683)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!300866 () Bool)

(assert (=> b!300866 (= e!189953 e!189952)))

(declare-fun c!48717 () Bool)

(assert (=> b!300866 (= c!48717 (or (= lt!149682 k!2524) (= (bvadd lt!149682 lt!149682) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!300867 () Bool)

(assert (=> b!300867 (and (bvsge (index!11510 lt!149683) #b00000000000000000000000000000000) (bvslt (index!11510 lt!149683) (size!7536 (array!15181 (store (arr!7184 a!3312) i!1256 k!2524) (size!7536 a!3312)))))))

(declare-fun res!158623 () Bool)

(assert (=> b!300867 (= res!158623 (= (select (arr!7184 (array!15181 (store (arr!7184 a!3312) i!1256 k!2524) (size!7536 a!3312))) (index!11510 lt!149683)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!300867 (=> res!158623 e!189956)))

(declare-fun b!300868 () Bool)

(assert (=> b!300868 (= e!189955 e!189954)))

(declare-fun res!158624 () Bool)

(assert (=> b!300868 (= res!158624 (and (is-Intermediate!2333 lt!149683) (not (undefined!3145 lt!149683)) (bvslt (x!29767 lt!149683) #b01111111111111111111111111111110) (bvsge (x!29767 lt!149683) #b00000000000000000000000000000000) (bvsge (x!29767 lt!149683) #b00000000000000000000000000000000)))))

(assert (=> b!300868 (=> (not res!158624) (not e!189954))))

(declare-fun b!300869 () Bool)

(assert (=> b!300869 (= e!189953 (Intermediate!2333 true lt!149562 #b00000000000000000000000000000000))))

(assert (= (and d!67813 c!48716) b!300869))

(assert (= (and d!67813 (not c!48716)) b!300866))

(assert (= (and b!300866 c!48717) b!300862))

(assert (= (and b!300866 (not c!48717)) b!300864))

(assert (= (and d!67813 c!48715) b!300863))

(assert (= (and d!67813 (not c!48715)) b!300868))

(assert (= (and b!300868 res!158624) b!300861))

(assert (= (and b!300861 (not res!158622)) b!300867))

(assert (= (and b!300867 (not res!158623)) b!300865))

(declare-fun m!312773 () Bool)

(assert (=> b!300867 m!312773))

(declare-fun m!312775 () Bool)

(assert (=> b!300864 m!312775))

(assert (=> b!300864 m!312775))

(declare-fun m!312777 () Bool)

(assert (=> b!300864 m!312777))

(declare-fun m!312779 () Bool)

(assert (=> d!67813 m!312779))

(assert (=> d!67813 m!312621))

(assert (=> b!300865 m!312773))

(assert (=> b!300861 m!312773))

(assert (=> b!300629 d!67813))

(declare-fun b!300870 () Bool)

(declare-fun lt!149685 () SeekEntryResult!2333)

(assert (=> b!300870 (and (bvsge (index!11510 lt!149685) #b00000000000000000000000000000000) (bvslt (index!11510 lt!149685) (size!7536 a!3312)))))

(declare-fun res!158625 () Bool)

(assert (=> b!300870 (= res!158625 (= (select (arr!7184 a!3312) (index!11510 lt!149685)) k!2524))))

(declare-fun e!189961 () Bool)

(assert (=> b!300870 (=> res!158625 e!189961)))

(declare-fun e!189959 () Bool)

(assert (=> b!300870 (= e!189959 e!189961)))

(declare-fun b!300871 () Bool)

(declare-fun e!189957 () SeekEntryResult!2333)

(assert (=> b!300871 (= e!189957 (Intermediate!2333 false lt!149562 #b00000000000000000000000000000000))))

(declare-fun b!300872 () Bool)

(declare-fun e!189960 () Bool)

(assert (=> b!300872 (= e!189960 (bvsge (x!29767 lt!149685) #b01111111111111111111111111111110))))

(declare-fun b!300873 () Bool)

(assert (=> b!300873 (= e!189957 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149562 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun d!67823 () Bool)

(assert (=> d!67823 e!189960))

(declare-fun c!48718 () Bool)

(assert (=> d!67823 (= c!48718 (and (is-Intermediate!2333 lt!149685) (undefined!3145 lt!149685)))))

(declare-fun e!189958 () SeekEntryResult!2333)

(assert (=> d!67823 (= lt!149685 e!189958)))

(declare-fun c!48719 () Bool)

(assert (=> d!67823 (= c!48719 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!149684 () (_ BitVec 64))

(assert (=> d!67823 (= lt!149684 (select (arr!7184 a!3312) lt!149562))))

(assert (=> d!67823 (validMask!0 mask!3809)))

(assert (=> d!67823 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149562 k!2524 a!3312 mask!3809) lt!149685)))

(declare-fun b!300874 () Bool)

(assert (=> b!300874 (and (bvsge (index!11510 lt!149685) #b00000000000000000000000000000000) (bvslt (index!11510 lt!149685) (size!7536 a!3312)))))

(assert (=> b!300874 (= e!189961 (= (select (arr!7184 a!3312) (index!11510 lt!149685)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!300875 () Bool)

(assert (=> b!300875 (= e!189958 e!189957)))

(declare-fun c!48720 () Bool)

(assert (=> b!300875 (= c!48720 (or (= lt!149684 k!2524) (= (bvadd lt!149684 lt!149684) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!300876 () Bool)

(assert (=> b!300876 (and (bvsge (index!11510 lt!149685) #b00000000000000000000000000000000) (bvslt (index!11510 lt!149685) (size!7536 a!3312)))))

(declare-fun res!158626 () Bool)

(assert (=> b!300876 (= res!158626 (= (select (arr!7184 a!3312) (index!11510 lt!149685)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!300876 (=> res!158626 e!189961)))

(declare-fun b!300877 () Bool)

(assert (=> b!300877 (= e!189960 e!189959)))

(declare-fun res!158627 () Bool)

(assert (=> b!300877 (= res!158627 (and (is-Intermediate!2333 lt!149685) (not (undefined!3145 lt!149685)) (bvslt (x!29767 lt!149685) #b01111111111111111111111111111110) (bvsge (x!29767 lt!149685) #b00000000000000000000000000000000) (bvsge (x!29767 lt!149685) #b00000000000000000000000000000000)))))

(assert (=> b!300877 (=> (not res!158627) (not e!189959))))

(declare-fun b!300878 () Bool)

(assert (=> b!300878 (= e!189958 (Intermediate!2333 true lt!149562 #b00000000000000000000000000000000))))

(assert (= (and d!67823 c!48719) b!300878))

(assert (= (and d!67823 (not c!48719)) b!300875))

(assert (= (and b!300875 c!48720) b!300871))

(assert (= (and b!300875 (not c!48720)) b!300873))

(assert (= (and d!67823 c!48718) b!300872))

(assert (= (and d!67823 (not c!48718)) b!300877))

(assert (= (and b!300877 res!158627) b!300870))

(assert (= (and b!300870 (not res!158625)) b!300876))

(assert (= (and b!300876 (not res!158626)) b!300874))

(declare-fun m!312781 () Bool)

(assert (=> b!300876 m!312781))

(assert (=> b!300873 m!312775))

(assert (=> b!300873 m!312775))

(declare-fun m!312783 () Bool)

