; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92584 () Bool)

(assert start!92584)

(declare-fun b!1052820 () Bool)

(declare-fun res!702030 () Bool)

(declare-fun e!597827 () Bool)

(assert (=> b!1052820 (=> (not res!702030) (not e!597827))))

(declare-datatypes ((array!66326 0))(
  ( (array!66327 (arr!31902 (Array (_ BitVec 32) (_ BitVec 64))) (size!32440 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66326)

(declare-datatypes ((List!22273 0))(
  ( (Nil!22270) (Cons!22269 (h!23478 (_ BitVec 64)) (t!31571 List!22273)) )
))
(declare-fun arrayNoDuplicates!0 (array!66326 (_ BitVec 32) List!22273) Bool)

(assert (=> b!1052820 (= res!702030 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22270))))

(declare-fun res!702031 () Bool)

(assert (=> start!92584 (=> (not res!702031) (not e!597827))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> start!92584 (= res!702031 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32440 a!3488)) (bvslt (size!32440 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92584 e!597827))

(assert (=> start!92584 true))

(declare-fun array_inv!24685 (array!66326) Bool)

(assert (=> start!92584 (array_inv!24685 a!3488)))

(declare-fun b!1052821 () Bool)

(declare-fun res!702033 () Bool)

(assert (=> b!1052821 (=> (not res!702033) (not e!597827))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052821 (= res!702033 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052822 () Bool)

(declare-fun e!597828 () Bool)

(assert (=> b!1052822 (= e!597827 e!597828)))

(declare-fun res!702034 () Bool)

(assert (=> b!1052822 (=> (not res!702034) (not e!597828))))

(declare-fun lt!464821 () array!66326)

(declare-fun arrayContainsKey!0 (array!66326 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052822 (= res!702034 (arrayContainsKey!0 lt!464821 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052822 (= lt!464821 (array!66327 (store (arr!31902 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32440 a!3488)))))

(declare-fun b!1052823 () Bool)

(declare-fun res!702032 () Bool)

(assert (=> b!1052823 (=> (not res!702032) (not e!597827))))

(assert (=> b!1052823 (= res!702032 (= (select (arr!31902 a!3488) i!1381) k0!2747))))

(declare-fun b!1052824 () Bool)

(declare-fun arrayScanForKey!0 (array!66326 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052824 (= e!597828 (= (arrayScanForKey!0 lt!464821 k0!2747 #b00000000000000000000000000000000) i!1381))))

(assert (= (and start!92584 res!702031) b!1052820))

(assert (= (and b!1052820 res!702030) b!1052821))

(assert (= (and b!1052821 res!702033) b!1052823))

(assert (= (and b!1052823 res!702032) b!1052822))

(assert (= (and b!1052822 res!702034) b!1052824))

(declare-fun m!972745 () Bool)

(assert (=> b!1052823 m!972745))

(declare-fun m!972747 () Bool)

(assert (=> b!1052820 m!972747))

(declare-fun m!972749 () Bool)

(assert (=> b!1052824 m!972749))

(declare-fun m!972751 () Bool)

(assert (=> start!92584 m!972751))

(declare-fun m!972753 () Bool)

(assert (=> b!1052821 m!972753))

(declare-fun m!972755 () Bool)

(assert (=> b!1052822 m!972755))

(declare-fun m!972757 () Bool)

(assert (=> b!1052822 m!972757))

(check-sat (not b!1052821) (not start!92584) (not b!1052822) (not b!1052824) (not b!1052820))
(check-sat)
(get-model)

(declare-fun d!127649 () Bool)

(assert (=> d!127649 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1052821 d!127649))

(declare-fun d!127651 () Bool)

(declare-fun res!702069 () Bool)

(declare-fun e!597851 () Bool)

(assert (=> d!127651 (=> res!702069 e!597851)))

(assert (=> d!127651 (= res!702069 (= (select (arr!31902 lt!464821) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!127651 (= (arrayContainsKey!0 lt!464821 k0!2747 #b00000000000000000000000000000000) e!597851)))

(declare-fun b!1052859 () Bool)

(declare-fun e!597852 () Bool)

(assert (=> b!1052859 (= e!597851 e!597852)))

(declare-fun res!702070 () Bool)

(assert (=> b!1052859 (=> (not res!702070) (not e!597852))))

(assert (=> b!1052859 (= res!702070 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32440 lt!464821)))))

(declare-fun b!1052860 () Bool)

(assert (=> b!1052860 (= e!597852 (arrayContainsKey!0 lt!464821 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127651 (not res!702069)) b!1052859))

(assert (= (and b!1052859 res!702070) b!1052860))

(declare-fun m!972787 () Bool)

(assert (=> d!127651 m!972787))

(declare-fun m!972789 () Bool)

(assert (=> b!1052860 m!972789))

(assert (=> b!1052822 d!127651))

(declare-fun d!127657 () Bool)

(declare-fun lt!464832 () (_ BitVec 32))

(assert (=> d!127657 (and (or (bvslt lt!464832 #b00000000000000000000000000000000) (bvsge lt!464832 (size!32440 lt!464821)) (and (bvsge lt!464832 #b00000000000000000000000000000000) (bvslt lt!464832 (size!32440 lt!464821)))) (bvsge lt!464832 #b00000000000000000000000000000000) (bvslt lt!464832 (size!32440 lt!464821)) (= (select (arr!31902 lt!464821) lt!464832) k0!2747))))

(declare-fun e!597875 () (_ BitVec 32))

(assert (=> d!127657 (= lt!464832 e!597875)))

(declare-fun c!106865 () Bool)

(assert (=> d!127657 (= c!106865 (= (select (arr!31902 lt!464821) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!127657 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32440 lt!464821)) (bvslt (size!32440 lt!464821) #b01111111111111111111111111111111))))

(assert (=> d!127657 (= (arrayScanForKey!0 lt!464821 k0!2747 #b00000000000000000000000000000000) lt!464832)))

(declare-fun b!1052890 () Bool)

(assert (=> b!1052890 (= e!597875 #b00000000000000000000000000000000)))

(declare-fun b!1052891 () Bool)

(assert (=> b!1052891 (= e!597875 (arrayScanForKey!0 lt!464821 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127657 c!106865) b!1052890))

(assert (= (and d!127657 (not c!106865)) b!1052891))

(declare-fun m!972803 () Bool)

(assert (=> d!127657 m!972803))

(assert (=> d!127657 m!972787))

(declare-fun m!972805 () Bool)

(assert (=> b!1052891 m!972805))

(assert (=> b!1052824 d!127657))

(declare-fun d!127667 () Bool)

(assert (=> d!127667 (= (array_inv!24685 a!3488) (bvsge (size!32440 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92584 d!127667))

(declare-fun b!1052931 () Bool)

(declare-fun e!597907 () Bool)

(declare-fun call!44708 () Bool)

(assert (=> b!1052931 (= e!597907 call!44708)))

(declare-fun b!1052932 () Bool)

(declare-fun e!597906 () Bool)

(declare-fun contains!6135 (List!22273 (_ BitVec 64)) Bool)

(assert (=> b!1052932 (= e!597906 (contains!6135 Nil!22270 (select (arr!31902 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1052933 () Bool)

(declare-fun e!597909 () Bool)

(declare-fun e!597908 () Bool)

(assert (=> b!1052933 (= e!597909 e!597908)))

(declare-fun res!702107 () Bool)

(assert (=> b!1052933 (=> (not res!702107) (not e!597908))))

(assert (=> b!1052933 (= res!702107 (not e!597906))))

(declare-fun res!702108 () Bool)

(assert (=> b!1052933 (=> (not res!702108) (not e!597906))))

(assert (=> b!1052933 (= res!702108 (validKeyInArray!0 (select (arr!31902 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1052934 () Bool)

(assert (=> b!1052934 (= e!597908 e!597907)))

(declare-fun c!106875 () Bool)

(assert (=> b!1052934 (= c!106875 (validKeyInArray!0 (select (arr!31902 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1052935 () Bool)

(assert (=> b!1052935 (= e!597907 call!44708)))

(declare-fun bm!44705 () Bool)

(assert (=> bm!44705 (= call!44708 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106875 (Cons!22269 (select (arr!31902 a!3488) #b00000000000000000000000000000000) Nil!22270) Nil!22270)))))

(declare-fun d!127669 () Bool)

(declare-fun res!702109 () Bool)

(assert (=> d!127669 (=> res!702109 e!597909)))

(assert (=> d!127669 (= res!702109 (bvsge #b00000000000000000000000000000000 (size!32440 a!3488)))))

(assert (=> d!127669 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22270) e!597909)))

(assert (= (and d!127669 (not res!702109)) b!1052933))

(assert (= (and b!1052933 res!702108) b!1052932))

(assert (= (and b!1052933 res!702107) b!1052934))

(assert (= (and b!1052934 c!106875) b!1052931))

(assert (= (and b!1052934 (not c!106875)) b!1052935))

(assert (= (or b!1052931 b!1052935) bm!44705))

(declare-fun m!972827 () Bool)

(assert (=> b!1052932 m!972827))

(assert (=> b!1052932 m!972827))

(declare-fun m!972829 () Bool)

(assert (=> b!1052932 m!972829))

(assert (=> b!1052933 m!972827))

(assert (=> b!1052933 m!972827))

(declare-fun m!972831 () Bool)

(assert (=> b!1052933 m!972831))

(assert (=> b!1052934 m!972827))

(assert (=> b!1052934 m!972827))

(assert (=> b!1052934 m!972831))

(assert (=> bm!44705 m!972827))

(declare-fun m!972833 () Bool)

(assert (=> bm!44705 m!972833))

(assert (=> b!1052820 d!127669))

(check-sat (not b!1052933) (not b!1052932) (not b!1052891) (not b!1052934) (not b!1052860) (not bm!44705))
(check-sat)
