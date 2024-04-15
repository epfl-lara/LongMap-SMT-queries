; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29384 () Bool)

(assert start!29384)

(declare-fun b!297443 () Bool)

(declare-fun e!187948 () Bool)

(declare-fun e!187954 () Bool)

(assert (=> b!297443 (= e!187948 e!187954)))

(declare-fun res!156877 () Bool)

(assert (=> b!297443 (=> (not res!156877) (not e!187954))))

(declare-fun lt!147741 () Bool)

(declare-datatypes ((SeekEntryResult!2282 0))(
  ( (MissingZero!2282 (index!11298 (_ BitVec 32))) (Found!2282 (index!11299 (_ BitVec 32))) (Intermediate!2282 (undefined!3094 Bool) (index!11300 (_ BitVec 32)) (x!29532 (_ BitVec 32))) (Undefined!2282) (MissingVacant!2282 (index!11301 (_ BitVec 32))) )
))
(declare-fun lt!147744 () SeekEntryResult!2282)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!297443 (= res!156877 (or lt!147741 (= lt!147744 (MissingVacant!2282 i!1256))))))

(assert (=> b!297443 (= lt!147741 (= lt!147744 (MissingZero!2282 i!1256)))))

(declare-datatypes ((array!15055 0))(
  ( (array!15056 (arr!7134 (Array (_ BitVec 32) (_ BitVec 64))) (size!7487 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15055)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15055 (_ BitVec 32)) SeekEntryResult!2282)

(assert (=> b!297443 (= lt!147744 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun e!187951 () Bool)

(declare-fun b!297444 () Bool)

(declare-fun lt!147740 () array!15055)

(assert (=> b!297444 (= e!187951 (not (= (seekEntryOrOpen!0 k0!2524 lt!147740 mask!3809) (Found!2282 i!1256))))))

(declare-fun b!297445 () Bool)

(declare-fun res!156876 () Bool)

(assert (=> b!297445 (=> (not res!156876) (not e!187954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15055 (_ BitVec 32)) Bool)

(assert (=> b!297445 (= res!156876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297446 () Bool)

(declare-fun lt!147746 () SeekEntryResult!2282)

(declare-fun lt!147747 () SeekEntryResult!2282)

(assert (=> b!297446 (and (= lt!147747 lt!147746) (= (select (store (arr!7134 a!3312) i!1256 k0!2524) (index!11300 lt!147746)) k0!2524))))

(declare-datatypes ((Unit!9244 0))(
  ( (Unit!9245) )
))
(declare-fun lt!147743 () Unit!9244)

(declare-fun lt!147745 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15055 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9244)

(assert (=> b!297446 (= lt!147743 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!147745 (index!11300 lt!147746) (x!29532 lt!147746) mask!3809))))

(assert (=> b!297446 (and (= (select (arr!7134 a!3312) (index!11300 lt!147746)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11300 lt!147746) i!1256))))

(declare-fun e!187950 () Unit!9244)

(declare-fun Unit!9246 () Unit!9244)

(assert (=> b!297446 (= e!187950 Unit!9246)))

(declare-fun b!297447 () Bool)

(declare-fun e!187952 () Unit!9244)

(assert (=> b!297447 (= e!187952 e!187950)))

(declare-fun c!47866 () Bool)

(get-info :version)

(assert (=> b!297447 (= c!47866 ((_ is Intermediate!2282) lt!147746))))

(declare-fun b!297448 () Bool)

(declare-fun res!156883 () Bool)

(assert (=> b!297448 (=> (not res!156883) (not e!187948))))

(declare-fun arrayContainsKey!0 (array!15055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297448 (= res!156883 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297449 () Bool)

(declare-fun res!156882 () Bool)

(assert (=> b!297449 (=> (not res!156882) (not e!187948))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297449 (= res!156882 (validKeyInArray!0 k0!2524))))

(declare-fun b!297450 () Bool)

(declare-fun e!187953 () Bool)

(assert (=> b!297450 (= e!187954 e!187953)))

(declare-fun res!156880 () Bool)

(assert (=> b!297450 (=> (not res!156880) (not e!187953))))

(assert (=> b!297450 (= res!156880 lt!147741)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15055 (_ BitVec 32)) SeekEntryResult!2282)

(assert (=> b!297450 (= lt!147747 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147745 k0!2524 lt!147740 mask!3809))))

(assert (=> b!297450 (= lt!147740 (array!15056 (store (arr!7134 a!3312) i!1256 k0!2524) (size!7487 a!3312)))))

(assert (=> b!297450 (= lt!147746 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147745 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297450 (= lt!147745 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!156879 () Bool)

(assert (=> start!29384 (=> (not res!156879) (not e!187948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29384 (= res!156879 (validMask!0 mask!3809))))

(assert (=> start!29384 e!187948))

(assert (=> start!29384 true))

(declare-fun array_inv!5106 (array!15055) Bool)

(assert (=> start!29384 (array_inv!5106 a!3312)))

(declare-fun b!297451 () Bool)

(declare-fun res!156878 () Bool)

(assert (=> b!297451 (=> (not res!156878) (not e!187948))))

(assert (=> b!297451 (= res!156878 (and (= (size!7487 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7487 a!3312))))))

(declare-fun b!297452 () Bool)

(assert (=> b!297452 false))

(declare-fun Unit!9247 () Unit!9244)

(assert (=> b!297452 (= e!187950 Unit!9247)))

(declare-fun b!297453 () Bool)

(declare-fun Unit!9248 () Unit!9244)

(assert (=> b!297453 (= e!187952 Unit!9248)))

(assert (=> b!297453 false))

(declare-fun b!297454 () Bool)

(assert (=> b!297454 (= e!187953 e!187951)))

(declare-fun res!156881 () Bool)

(assert (=> b!297454 (=> (not res!156881) (not e!187951))))

(assert (=> b!297454 (= res!156881 (= lt!147747 lt!147746))))

(declare-fun lt!147742 () Unit!9244)

(assert (=> b!297454 (= lt!147742 e!187952)))

(declare-fun c!47867 () Bool)

(assert (=> b!297454 (= c!47867 (or (and ((_ is Intermediate!2282) lt!147746) (undefined!3094 lt!147746)) (and ((_ is Intermediate!2282) lt!147746) (= (select (arr!7134 a!3312) (index!11300 lt!147746)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and ((_ is Intermediate!2282) lt!147746) (= (select (arr!7134 a!3312) (index!11300 lt!147746)) k0!2524))))))

(assert (= (and start!29384 res!156879) b!297451))

(assert (= (and b!297451 res!156878) b!297449))

(assert (= (and b!297449 res!156882) b!297448))

(assert (= (and b!297448 res!156883) b!297443))

(assert (= (and b!297443 res!156877) b!297445))

(assert (= (and b!297445 res!156876) b!297450))

(assert (= (and b!297450 res!156880) b!297454))

(assert (= (and b!297454 c!47867) b!297453))

(assert (= (and b!297454 (not c!47867)) b!297447))

(assert (= (and b!297447 c!47866) b!297446))

(assert (= (and b!297447 (not c!47866)) b!297452))

(assert (= (and b!297454 res!156881) b!297444))

(declare-fun m!309681 () Bool)

(assert (=> b!297450 m!309681))

(declare-fun m!309683 () Bool)

(assert (=> b!297450 m!309683))

(declare-fun m!309685 () Bool)

(assert (=> b!297450 m!309685))

(declare-fun m!309687 () Bool)

(assert (=> b!297450 m!309687))

(assert (=> b!297446 m!309683))

(declare-fun m!309689 () Bool)

(assert (=> b!297446 m!309689))

(declare-fun m!309691 () Bool)

(assert (=> b!297446 m!309691))

(declare-fun m!309693 () Bool)

(assert (=> b!297446 m!309693))

(declare-fun m!309695 () Bool)

(assert (=> b!297443 m!309695))

(declare-fun m!309697 () Bool)

(assert (=> start!29384 m!309697))

(declare-fun m!309699 () Bool)

(assert (=> start!29384 m!309699))

(declare-fun m!309701 () Bool)

(assert (=> b!297444 m!309701))

(declare-fun m!309703 () Bool)

(assert (=> b!297448 m!309703))

(declare-fun m!309705 () Bool)

(assert (=> b!297449 m!309705))

(declare-fun m!309707 () Bool)

(assert (=> b!297445 m!309707))

(assert (=> b!297454 m!309693))

(check-sat (not b!297445) (not b!297450) (not b!297444) (not b!297448) (not start!29384) (not b!297446) (not b!297443) (not b!297449))
(check-sat)
(get-model)

(declare-fun d!67029 () Bool)

(assert (=> d!67029 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!297449 d!67029))

(declare-fun b!297539 () Bool)

(declare-fun e!188007 () SeekEntryResult!2282)

(declare-fun e!188006 () SeekEntryResult!2282)

(assert (=> b!297539 (= e!188007 e!188006)))

(declare-fun lt!147803 () (_ BitVec 64))

(declare-fun lt!147804 () SeekEntryResult!2282)

(assert (=> b!297539 (= lt!147803 (select (arr!7134 a!3312) (index!11300 lt!147804)))))

(declare-fun c!47886 () Bool)

(assert (=> b!297539 (= c!47886 (= lt!147803 k0!2524))))

(declare-fun b!297540 () Bool)

(declare-fun e!188005 () SeekEntryResult!2282)

(assert (=> b!297540 (= e!188005 (MissingZero!2282 (index!11300 lt!147804)))))

(declare-fun d!67031 () Bool)

(declare-fun lt!147802 () SeekEntryResult!2282)

(assert (=> d!67031 (and (or ((_ is Undefined!2282) lt!147802) (not ((_ is Found!2282) lt!147802)) (and (bvsge (index!11299 lt!147802) #b00000000000000000000000000000000) (bvslt (index!11299 lt!147802) (size!7487 a!3312)))) (or ((_ is Undefined!2282) lt!147802) ((_ is Found!2282) lt!147802) (not ((_ is MissingZero!2282) lt!147802)) (and (bvsge (index!11298 lt!147802) #b00000000000000000000000000000000) (bvslt (index!11298 lt!147802) (size!7487 a!3312)))) (or ((_ is Undefined!2282) lt!147802) ((_ is Found!2282) lt!147802) ((_ is MissingZero!2282) lt!147802) (not ((_ is MissingVacant!2282) lt!147802)) (and (bvsge (index!11301 lt!147802) #b00000000000000000000000000000000) (bvslt (index!11301 lt!147802) (size!7487 a!3312)))) (or ((_ is Undefined!2282) lt!147802) (ite ((_ is Found!2282) lt!147802) (= (select (arr!7134 a!3312) (index!11299 lt!147802)) k0!2524) (ite ((_ is MissingZero!2282) lt!147802) (= (select (arr!7134 a!3312) (index!11298 lt!147802)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2282) lt!147802) (= (select (arr!7134 a!3312) (index!11301 lt!147802)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67031 (= lt!147802 e!188007)))

(declare-fun c!47887 () Bool)

(assert (=> d!67031 (= c!47887 (and ((_ is Intermediate!2282) lt!147804) (undefined!3094 lt!147804)))))

(assert (=> d!67031 (= lt!147804 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67031 (validMask!0 mask!3809)))

(assert (=> d!67031 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!147802)))

(declare-fun b!297541 () Bool)

(declare-fun c!47888 () Bool)

(assert (=> b!297541 (= c!47888 (= lt!147803 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!297541 (= e!188006 e!188005)))

(declare-fun b!297542 () Bool)

(assert (=> b!297542 (= e!188007 Undefined!2282)))

(declare-fun b!297543 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15055 (_ BitVec 32)) SeekEntryResult!2282)

(assert (=> b!297543 (= e!188005 (seekKeyOrZeroReturnVacant!0 (x!29532 lt!147804) (index!11300 lt!147804) (index!11300 lt!147804) k0!2524 a!3312 mask!3809))))

(declare-fun b!297544 () Bool)

(assert (=> b!297544 (= e!188006 (Found!2282 (index!11300 lt!147804)))))

(assert (= (and d!67031 c!47887) b!297542))

(assert (= (and d!67031 (not c!47887)) b!297539))

(assert (= (and b!297539 c!47886) b!297544))

(assert (= (and b!297539 (not c!47886)) b!297541))

(assert (= (and b!297541 c!47888) b!297540))

(assert (= (and b!297541 (not c!47888)) b!297543))

(declare-fun m!309765 () Bool)

(assert (=> b!297539 m!309765))

(declare-fun m!309767 () Bool)

(assert (=> d!67031 m!309767))

(assert (=> d!67031 m!309687))

(declare-fun m!309769 () Bool)

(assert (=> d!67031 m!309769))

(declare-fun m!309771 () Bool)

(assert (=> d!67031 m!309771))

(assert (=> d!67031 m!309697))

(declare-fun m!309773 () Bool)

(assert (=> d!67031 m!309773))

(assert (=> d!67031 m!309687))

(declare-fun m!309775 () Bool)

(assert (=> b!297543 m!309775))

(assert (=> b!297443 d!67031))

(declare-fun d!67035 () Bool)

(declare-fun res!156942 () Bool)

(declare-fun e!188019 () Bool)

(assert (=> d!67035 (=> res!156942 e!188019)))

(assert (=> d!67035 (= res!156942 (= (select (arr!7134 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67035 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!188019)))

(declare-fun b!297561 () Bool)

(declare-fun e!188020 () Bool)

(assert (=> b!297561 (= e!188019 e!188020)))

(declare-fun res!156943 () Bool)

(assert (=> b!297561 (=> (not res!156943) (not e!188020))))

(assert (=> b!297561 (= res!156943 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7487 a!3312)))))

(declare-fun b!297562 () Bool)

(assert (=> b!297562 (= e!188020 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67035 (not res!156942)) b!297561))

(assert (= (and b!297561 res!156943) b!297562))

(declare-fun m!309777 () Bool)

(assert (=> d!67035 m!309777))

(declare-fun m!309779 () Bool)

(assert (=> b!297562 m!309779))

(assert (=> b!297448 d!67035))

(declare-fun d!67037 () Bool)

(declare-fun e!188029 () Bool)

(assert (=> d!67037 e!188029))

(declare-fun res!156952 () Bool)

(assert (=> d!67037 (=> (not res!156952) (not e!188029))))

(assert (=> d!67037 (= res!156952 (and (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7487 a!3312))))))

(declare-fun lt!147816 () Unit!9244)

(declare-fun choose!42 (array!15055 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9244)

(assert (=> d!67037 (= lt!147816 (choose!42 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!147745 (index!11300 lt!147746) (x!29532 lt!147746) mask!3809))))

(assert (=> d!67037 (validMask!0 mask!3809)))

(assert (=> d!67037 (= (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!147745 (index!11300 lt!147746) (x!29532 lt!147746) mask!3809) lt!147816)))

(declare-fun b!297571 () Bool)

(assert (=> b!297571 (= e!188029 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147745 k0!2524 (array!15056 (store (arr!7134 a!3312) i!1256 k0!2524) (size!7487 a!3312)) mask!3809) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147745 k0!2524 a!3312 mask!3809)))))

(assert (= (and d!67037 res!156952) b!297571))

(declare-fun m!309795 () Bool)

(assert (=> d!67037 m!309795))

(assert (=> d!67037 m!309697))

(assert (=> b!297571 m!309683))

(declare-fun m!309797 () Bool)

(assert (=> b!297571 m!309797))

(assert (=> b!297571 m!309685))

(assert (=> b!297446 d!67037))

(declare-fun d!67045 () Bool)

(declare-fun res!156964 () Bool)

(declare-fun e!188046 () Bool)

(assert (=> d!67045 (=> res!156964 e!188046)))

(assert (=> d!67045 (= res!156964 (bvsge #b00000000000000000000000000000000 (size!7487 a!3312)))))

(assert (=> d!67045 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!188046)))

(declare-fun bm!25742 () Bool)

(declare-fun call!25745 () Bool)

(assert (=> bm!25742 (= call!25745 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!297592 () Bool)

(declare-fun e!188045 () Bool)

(declare-fun e!188047 () Bool)

(assert (=> b!297592 (= e!188045 e!188047)))

(declare-fun lt!147832 () (_ BitVec 64))

(assert (=> b!297592 (= lt!147832 (select (arr!7134 a!3312) #b00000000000000000000000000000000))))

(declare-fun lt!147834 () Unit!9244)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15055 (_ BitVec 64) (_ BitVec 32)) Unit!9244)

(assert (=> b!297592 (= lt!147834 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!147832 #b00000000000000000000000000000000))))

(assert (=> b!297592 (arrayContainsKey!0 a!3312 lt!147832 #b00000000000000000000000000000000)))

(declare-fun lt!147833 () Unit!9244)

(assert (=> b!297592 (= lt!147833 lt!147834)))

(declare-fun res!156963 () Bool)

(assert (=> b!297592 (= res!156963 (= (seekEntryOrOpen!0 (select (arr!7134 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2282 #b00000000000000000000000000000000)))))

(assert (=> b!297592 (=> (not res!156963) (not e!188047))))

(declare-fun b!297593 () Bool)

(assert (=> b!297593 (= e!188047 call!25745)))

(declare-fun b!297594 () Bool)

(assert (=> b!297594 (= e!188046 e!188045)))

(declare-fun c!47897 () Bool)

(assert (=> b!297594 (= c!47897 (validKeyInArray!0 (select (arr!7134 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!297595 () Bool)

(assert (=> b!297595 (= e!188045 call!25745)))

(assert (= (and d!67045 (not res!156964)) b!297594))

(assert (= (and b!297594 c!47897) b!297592))

(assert (= (and b!297594 (not c!47897)) b!297595))

(assert (= (and b!297592 res!156963) b!297593))

(assert (= (or b!297593 b!297595) bm!25742))

(declare-fun m!309811 () Bool)

(assert (=> bm!25742 m!309811))

(assert (=> b!297592 m!309777))

(declare-fun m!309813 () Bool)

(assert (=> b!297592 m!309813))

(declare-fun m!309815 () Bool)

(assert (=> b!297592 m!309815))

(assert (=> b!297592 m!309777))

(declare-fun m!309817 () Bool)

(assert (=> b!297592 m!309817))

(assert (=> b!297594 m!309777))

(assert (=> b!297594 m!309777))

(declare-fun m!309819 () Bool)

(assert (=> b!297594 m!309819))

(assert (=> b!297445 d!67045))

(declare-fun b!297629 () Bool)

(declare-fun e!188067 () Bool)

(declare-fun lt!147849 () SeekEntryResult!2282)

(assert (=> b!297629 (= e!188067 (bvsge (x!29532 lt!147849) #b01111111111111111111111111111110))))

(declare-fun b!297630 () Bool)

(declare-fun e!188071 () SeekEntryResult!2282)

(assert (=> b!297630 (= e!188071 (Intermediate!2282 false lt!147745 #b00000000000000000000000000000000))))

(declare-fun b!297631 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297631 (= e!188071 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147745 #b00000000000000000000000000000000 mask!3809) k0!2524 lt!147740 mask!3809))))

(declare-fun b!297632 () Bool)

(declare-fun e!188070 () SeekEntryResult!2282)

(assert (=> b!297632 (= e!188070 e!188071)))

(declare-fun c!47910 () Bool)

(declare-fun lt!147848 () (_ BitVec 64))

(assert (=> b!297632 (= c!47910 (or (= lt!147848 k0!2524) (= (bvadd lt!147848 lt!147848) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!297633 () Bool)

(assert (=> b!297633 (and (bvsge (index!11300 lt!147849) #b00000000000000000000000000000000) (bvslt (index!11300 lt!147849) (size!7487 lt!147740)))))

(declare-fun res!156975 () Bool)

(assert (=> b!297633 (= res!156975 (= (select (arr!7134 lt!147740) (index!11300 lt!147849)) k0!2524))))

(declare-fun e!188069 () Bool)

(assert (=> b!297633 (=> res!156975 e!188069)))

(declare-fun e!188068 () Bool)

(assert (=> b!297633 (= e!188068 e!188069)))

(declare-fun b!297634 () Bool)

(assert (=> b!297634 (= e!188070 (Intermediate!2282 true lt!147745 #b00000000000000000000000000000000))))

(declare-fun b!297635 () Bool)

(assert (=> b!297635 (and (bvsge (index!11300 lt!147849) #b00000000000000000000000000000000) (bvslt (index!11300 lt!147849) (size!7487 lt!147740)))))

(assert (=> b!297635 (= e!188069 (= (select (arr!7134 lt!147740) (index!11300 lt!147849)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!297637 () Bool)

(assert (=> b!297637 (= e!188067 e!188068)))

(declare-fun res!156976 () Bool)

(assert (=> b!297637 (= res!156976 (and ((_ is Intermediate!2282) lt!147849) (not (undefined!3094 lt!147849)) (bvslt (x!29532 lt!147849) #b01111111111111111111111111111110) (bvsge (x!29532 lt!147849) #b00000000000000000000000000000000) (bvsge (x!29532 lt!147849) #b00000000000000000000000000000000)))))

(assert (=> b!297637 (=> (not res!156976) (not e!188068))))

(declare-fun d!67053 () Bool)

(assert (=> d!67053 e!188067))

(declare-fun c!47911 () Bool)

(assert (=> d!67053 (= c!47911 (and ((_ is Intermediate!2282) lt!147849) (undefined!3094 lt!147849)))))

(assert (=> d!67053 (= lt!147849 e!188070)))

(declare-fun c!47912 () Bool)

(assert (=> d!67053 (= c!47912 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67053 (= lt!147848 (select (arr!7134 lt!147740) lt!147745))))

(assert (=> d!67053 (validMask!0 mask!3809)))

(assert (=> d!67053 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147745 k0!2524 lt!147740 mask!3809) lt!147849)))

(declare-fun b!297636 () Bool)

(assert (=> b!297636 (and (bvsge (index!11300 lt!147849) #b00000000000000000000000000000000) (bvslt (index!11300 lt!147849) (size!7487 lt!147740)))))

(declare-fun res!156974 () Bool)

(assert (=> b!297636 (= res!156974 (= (select (arr!7134 lt!147740) (index!11300 lt!147849)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!297636 (=> res!156974 e!188069)))

(assert (= (and d!67053 c!47912) b!297634))

(assert (= (and d!67053 (not c!47912)) b!297632))

(assert (= (and b!297632 c!47910) b!297630))

(assert (= (and b!297632 (not c!47910)) b!297631))

(assert (= (and d!67053 c!47911) b!297629))

(assert (= (and d!67053 (not c!47911)) b!297637))

(assert (= (and b!297637 res!156976) b!297633))

(assert (= (and b!297633 (not res!156975)) b!297636))

(assert (= (and b!297636 (not res!156974)) b!297635))

(declare-fun m!309825 () Bool)

(assert (=> b!297636 m!309825))

(declare-fun m!309827 () Bool)

(assert (=> d!67053 m!309827))

(assert (=> d!67053 m!309697))

(declare-fun m!309829 () Bool)

(assert (=> b!297631 m!309829))

(assert (=> b!297631 m!309829))

(declare-fun m!309831 () Bool)

(assert (=> b!297631 m!309831))

(assert (=> b!297633 m!309825))

(assert (=> b!297635 m!309825))

(assert (=> b!297450 d!67053))

(declare-fun b!297650 () Bool)

(declare-fun e!188078 () Bool)

(declare-fun lt!147857 () SeekEntryResult!2282)

(assert (=> b!297650 (= e!188078 (bvsge (x!29532 lt!147857) #b01111111111111111111111111111110))))

(declare-fun b!297651 () Bool)

(declare-fun e!188082 () SeekEntryResult!2282)

(assert (=> b!297651 (= e!188082 (Intermediate!2282 false lt!147745 #b00000000000000000000000000000000))))

(declare-fun b!297652 () Bool)

(assert (=> b!297652 (= e!188082 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147745 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!297653 () Bool)

(declare-fun e!188081 () SeekEntryResult!2282)

(assert (=> b!297653 (= e!188081 e!188082)))

(declare-fun c!47919 () Bool)

(declare-fun lt!147856 () (_ BitVec 64))

(assert (=> b!297653 (= c!47919 (or (= lt!147856 k0!2524) (= (bvadd lt!147856 lt!147856) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!297654 () Bool)

(assert (=> b!297654 (and (bvsge (index!11300 lt!147857) #b00000000000000000000000000000000) (bvslt (index!11300 lt!147857) (size!7487 a!3312)))))

(declare-fun res!156978 () Bool)

(assert (=> b!297654 (= res!156978 (= (select (arr!7134 a!3312) (index!11300 lt!147857)) k0!2524))))

(declare-fun e!188080 () Bool)

(assert (=> b!297654 (=> res!156978 e!188080)))

(declare-fun e!188079 () Bool)

(assert (=> b!297654 (= e!188079 e!188080)))

(declare-fun b!297655 () Bool)

(assert (=> b!297655 (= e!188081 (Intermediate!2282 true lt!147745 #b00000000000000000000000000000000))))

(declare-fun b!297656 () Bool)

(assert (=> b!297656 (and (bvsge (index!11300 lt!147857) #b00000000000000000000000000000000) (bvslt (index!11300 lt!147857) (size!7487 a!3312)))))

(assert (=> b!297656 (= e!188080 (= (select (arr!7134 a!3312) (index!11300 lt!147857)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!297658 () Bool)

(assert (=> b!297658 (= e!188078 e!188079)))

(declare-fun res!156979 () Bool)

(assert (=> b!297658 (= res!156979 (and ((_ is Intermediate!2282) lt!147857) (not (undefined!3094 lt!147857)) (bvslt (x!29532 lt!147857) #b01111111111111111111111111111110) (bvsge (x!29532 lt!147857) #b00000000000000000000000000000000) (bvsge (x!29532 lt!147857) #b00000000000000000000000000000000)))))

(assert (=> b!297658 (=> (not res!156979) (not e!188079))))

(declare-fun d!67061 () Bool)

(assert (=> d!67061 e!188078))

(declare-fun c!47920 () Bool)

(assert (=> d!67061 (= c!47920 (and ((_ is Intermediate!2282) lt!147857) (undefined!3094 lt!147857)))))

(assert (=> d!67061 (= lt!147857 e!188081)))

(declare-fun c!47921 () Bool)

(assert (=> d!67061 (= c!47921 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67061 (= lt!147856 (select (arr!7134 a!3312) lt!147745))))

(assert (=> d!67061 (validMask!0 mask!3809)))

(assert (=> d!67061 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147745 k0!2524 a!3312 mask!3809) lt!147857)))

(declare-fun b!297657 () Bool)

(assert (=> b!297657 (and (bvsge (index!11300 lt!147857) #b00000000000000000000000000000000) (bvslt (index!11300 lt!147857) (size!7487 a!3312)))))

(declare-fun res!156977 () Bool)

(assert (=> b!297657 (= res!156977 (= (select (arr!7134 a!3312) (index!11300 lt!147857)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!297657 (=> res!156977 e!188080)))

(assert (= (and d!67061 c!47921) b!297655))

(assert (= (and d!67061 (not c!47921)) b!297653))

(assert (= (and b!297653 c!47919) b!297651))

(assert (= (and b!297653 (not c!47919)) b!297652))

(assert (= (and d!67061 c!47920) b!297650))

(assert (= (and d!67061 (not c!47920)) b!297658))

(assert (= (and b!297658 res!156979) b!297654))

(assert (= (and b!297654 (not res!156978)) b!297657))

(assert (= (and b!297657 (not res!156977)) b!297656))

(declare-fun m!309833 () Bool)

(assert (=> b!297657 m!309833))

(declare-fun m!309835 () Bool)

(assert (=> d!67061 m!309835))

(assert (=> d!67061 m!309697))

(assert (=> b!297652 m!309829))

(assert (=> b!297652 m!309829))

(declare-fun m!309837 () Bool)

(assert (=> b!297652 m!309837))

(assert (=> b!297654 m!309833))

(assert (=> b!297656 m!309833))

(assert (=> b!297450 d!67061))

(declare-fun d!67063 () Bool)

(declare-fun lt!147869 () (_ BitVec 32))

(declare-fun lt!147868 () (_ BitVec 32))

(assert (=> d!67063 (= lt!147869 (bvmul (bvxor lt!147868 (bvlshr lt!147868 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67063 (= lt!147868 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67063 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!156980 (let ((h!5269 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29538 (bvmul (bvxor h!5269 (bvlshr h!5269 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29538 (bvlshr x!29538 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!156980 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!156980 #b00000000000000000000000000000000))))))

(assert (=> d!67063 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!147869 (bvlshr lt!147869 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!297450 d!67063))

(declare-fun d!67069 () Bool)

(assert (=> d!67069 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29384 d!67069))

(declare-fun d!67073 () Bool)

(assert (=> d!67073 (= (array_inv!5106 a!3312) (bvsge (size!7487 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29384 d!67073))

(declare-fun b!297674 () Bool)

(declare-fun e!188094 () SeekEntryResult!2282)

(declare-fun e!188093 () SeekEntryResult!2282)

(assert (=> b!297674 (= e!188094 e!188093)))

(declare-fun lt!147874 () (_ BitVec 64))

(declare-fun lt!147875 () SeekEntryResult!2282)

(assert (=> b!297674 (= lt!147874 (select (arr!7134 lt!147740) (index!11300 lt!147875)))))

(declare-fun c!47928 () Bool)

(assert (=> b!297674 (= c!47928 (= lt!147874 k0!2524))))

(declare-fun b!297675 () Bool)

(declare-fun e!188092 () SeekEntryResult!2282)

(assert (=> b!297675 (= e!188092 (MissingZero!2282 (index!11300 lt!147875)))))

(declare-fun d!67075 () Bool)

(declare-fun lt!147873 () SeekEntryResult!2282)

(assert (=> d!67075 (and (or ((_ is Undefined!2282) lt!147873) (not ((_ is Found!2282) lt!147873)) (and (bvsge (index!11299 lt!147873) #b00000000000000000000000000000000) (bvslt (index!11299 lt!147873) (size!7487 lt!147740)))) (or ((_ is Undefined!2282) lt!147873) ((_ is Found!2282) lt!147873) (not ((_ is MissingZero!2282) lt!147873)) (and (bvsge (index!11298 lt!147873) #b00000000000000000000000000000000) (bvslt (index!11298 lt!147873) (size!7487 lt!147740)))) (or ((_ is Undefined!2282) lt!147873) ((_ is Found!2282) lt!147873) ((_ is MissingZero!2282) lt!147873) (not ((_ is MissingVacant!2282) lt!147873)) (and (bvsge (index!11301 lt!147873) #b00000000000000000000000000000000) (bvslt (index!11301 lt!147873) (size!7487 lt!147740)))) (or ((_ is Undefined!2282) lt!147873) (ite ((_ is Found!2282) lt!147873) (= (select (arr!7134 lt!147740) (index!11299 lt!147873)) k0!2524) (ite ((_ is MissingZero!2282) lt!147873) (= (select (arr!7134 lt!147740) (index!11298 lt!147873)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2282) lt!147873) (= (select (arr!7134 lt!147740) (index!11301 lt!147873)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67075 (= lt!147873 e!188094)))

(declare-fun c!47929 () Bool)

(assert (=> d!67075 (= c!47929 (and ((_ is Intermediate!2282) lt!147875) (undefined!3094 lt!147875)))))

(assert (=> d!67075 (= lt!147875 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 lt!147740 mask!3809))))

(assert (=> d!67075 (validMask!0 mask!3809)))

(assert (=> d!67075 (= (seekEntryOrOpen!0 k0!2524 lt!147740 mask!3809) lt!147873)))

(declare-fun b!297676 () Bool)

(declare-fun c!47930 () Bool)

(assert (=> b!297676 (= c!47930 (= lt!147874 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!297676 (= e!188093 e!188092)))

(declare-fun b!297677 () Bool)

(assert (=> b!297677 (= e!188094 Undefined!2282)))

(declare-fun b!297678 () Bool)

(assert (=> b!297678 (= e!188092 (seekKeyOrZeroReturnVacant!0 (x!29532 lt!147875) (index!11300 lt!147875) (index!11300 lt!147875) k0!2524 lt!147740 mask!3809))))

(declare-fun b!297679 () Bool)

(assert (=> b!297679 (= e!188093 (Found!2282 (index!11300 lt!147875)))))

(assert (= (and d!67075 c!47929) b!297677))

(assert (= (and d!67075 (not c!47929)) b!297674))

(assert (= (and b!297674 c!47928) b!297679))

(assert (= (and b!297674 (not c!47928)) b!297676))

(assert (= (and b!297676 c!47930) b!297675))

(assert (= (and b!297676 (not c!47930)) b!297678))

(declare-fun m!309867 () Bool)

(assert (=> b!297674 m!309867))

(declare-fun m!309869 () Bool)

(assert (=> d!67075 m!309869))

(assert (=> d!67075 m!309687))

(declare-fun m!309871 () Bool)

(assert (=> d!67075 m!309871))

(declare-fun m!309873 () Bool)

(assert (=> d!67075 m!309873))

(assert (=> d!67075 m!309697))

(declare-fun m!309875 () Bool)

(assert (=> d!67075 m!309875))

(assert (=> d!67075 m!309687))

(declare-fun m!309877 () Bool)

(assert (=> b!297678 m!309877))

(assert (=> b!297444 d!67075))

(check-sat (not d!67053) (not b!297543) (not bm!25742) (not d!67037) (not b!297678) (not d!67031) (not d!67075) (not b!297594) (not b!297652) (not b!297571) (not d!67061) (not b!297631) (not b!297592) (not b!297562))
(check-sat)
