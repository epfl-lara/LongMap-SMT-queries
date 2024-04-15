; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93364 () Bool)

(assert start!93364)

(declare-fun res!706445 () Bool)

(declare-fun e!601646 () Bool)

(assert (=> start!93364 (=> (not res!706445) (not e!601646))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66659 0))(
  ( (array!66660 (arr!32049 (Array (_ BitVec 32) (_ BitVec 64))) (size!32587 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66659)

(assert (=> start!93364 (= res!706445 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32587 a!3488)) (bvslt (size!32587 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93364 e!601646))

(assert (=> start!93364 true))

(declare-fun array_inv!24832 (array!66659) Bool)

(assert (=> start!93364 (array_inv!24832 a!3488)))

(declare-fun b!1057742 () Bool)

(declare-fun res!706450 () Bool)

(assert (=> b!1057742 (=> (not res!706450) (not e!601646))))

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1057742 (= res!706450 (= (select (arr!32049 a!3488) i!1381) k0!2747))))

(declare-fun b!1057743 () Bool)

(declare-fun res!706452 () Bool)

(assert (=> b!1057743 (=> (not res!706452) (not e!601646))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057743 (= res!706452 (validKeyInArray!0 k0!2747))))

(declare-fun b!1057744 () Bool)

(declare-fun e!601645 () Bool)

(declare-fun e!601649 () Bool)

(assert (=> b!1057744 (= e!601645 e!601649)))

(declare-fun res!706444 () Bool)

(assert (=> b!1057744 (=> res!706444 e!601649)))

(declare-fun lt!466447 () (_ BitVec 32))

(assert (=> b!1057744 (= res!706444 (or (bvsgt lt!466447 i!1381) (bvsle i!1381 lt!466447)))))

(declare-fun b!1057745 () Bool)

(declare-fun e!601651 () Bool)

(assert (=> b!1057745 (= e!601646 e!601651)))

(declare-fun res!706443 () Bool)

(assert (=> b!1057745 (=> (not res!706443) (not e!601651))))

(declare-fun lt!466443 () array!66659)

(declare-fun arrayContainsKey!0 (array!66659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057745 (= res!706443 (arrayContainsKey!0 lt!466443 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057745 (= lt!466443 (array!66660 (store (arr!32049 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32587 a!3488)))))

(declare-fun b!1057746 () Bool)

(declare-fun res!706447 () Bool)

(declare-fun e!601653 () Bool)

(assert (=> b!1057746 (=> res!706447 e!601653)))

(declare-datatypes ((List!22420 0))(
  ( (Nil!22417) (Cons!22416 (h!23625 (_ BitVec 64)) (t!31718 List!22420)) )
))
(declare-fun noDuplicate!1573 (List!22420) Bool)

(assert (=> b!1057746 (= res!706447 (not (noDuplicate!1573 Nil!22417)))))

(declare-fun b!1057747 () Bool)

(declare-fun res!706451 () Bool)

(assert (=> b!1057747 (=> (not res!706451) (not e!601646))))

(declare-fun arrayNoDuplicates!0 (array!66659 (_ BitVec 32) List!22420) Bool)

(assert (=> b!1057747 (= res!706451 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22417))))

(declare-fun b!1057748 () Bool)

(declare-fun e!601647 () Bool)

(assert (=> b!1057748 (= e!601647 e!601653)))

(declare-fun res!706453 () Bool)

(assert (=> b!1057748 (=> res!706453 e!601653)))

(declare-fun lt!466444 () (_ BitVec 32))

(assert (=> b!1057748 (= res!706453 (or (bvslt lt!466447 #b00000000000000000000000000000000) (bvsge lt!466444 (size!32587 a!3488)) (bvsge lt!466447 (size!32587 a!3488))))))

(assert (=> b!1057748 (arrayContainsKey!0 a!3488 k0!2747 lt!466444)))

(declare-datatypes ((Unit!34553 0))(
  ( (Unit!34554) )
))
(declare-fun lt!466446 () Unit!34553)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66659 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34553)

(assert (=> b!1057748 (= lt!466446 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466444))))

(assert (=> b!1057748 (= lt!466444 (bvadd #b00000000000000000000000000000001 lt!466447))))

(assert (=> b!1057748 (arrayNoDuplicates!0 a!3488 lt!466447 Nil!22417)))

(declare-fun lt!466445 () Unit!34553)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66659 (_ BitVec 32) (_ BitVec 32)) Unit!34553)

(assert (=> b!1057748 (= lt!466445 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466447))))

(declare-fun b!1057749 () Bool)

(declare-fun e!601652 () Bool)

(assert (=> b!1057749 (= e!601653 e!601652)))

(declare-fun res!706448 () Bool)

(assert (=> b!1057749 (=> (not res!706448) (not e!601652))))

(declare-fun contains!6172 (List!22420 (_ BitVec 64)) Bool)

(assert (=> b!1057749 (= res!706448 (not (contains!6172 Nil!22417 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1057750 () Bool)

(declare-fun e!601650 () Bool)

(assert (=> b!1057750 (= e!601650 (not e!601647))))

(declare-fun res!706442 () Bool)

(assert (=> b!1057750 (=> res!706442 e!601647)))

(assert (=> b!1057750 (= res!706442 (or (bvsgt lt!466447 i!1381) (bvsle i!1381 lt!466447)))))

(assert (=> b!1057750 e!601645))

(declare-fun res!706449 () Bool)

(assert (=> b!1057750 (=> (not res!706449) (not e!601645))))

(assert (=> b!1057750 (= res!706449 (= (select (store (arr!32049 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466447) k0!2747))))

(declare-fun b!1057751 () Bool)

(assert (=> b!1057751 (= e!601651 e!601650)))

(declare-fun res!706446 () Bool)

(assert (=> b!1057751 (=> (not res!706446) (not e!601650))))

(assert (=> b!1057751 (= res!706446 (not (= lt!466447 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66659 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057751 (= lt!466447 (arrayScanForKey!0 lt!466443 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057752 () Bool)

(assert (=> b!1057752 (= e!601649 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1057753 () Bool)

(assert (=> b!1057753 (= e!601652 (not (contains!6172 Nil!22417 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!93364 res!706445) b!1057747))

(assert (= (and b!1057747 res!706451) b!1057743))

(assert (= (and b!1057743 res!706452) b!1057742))

(assert (= (and b!1057742 res!706450) b!1057745))

(assert (= (and b!1057745 res!706443) b!1057751))

(assert (= (and b!1057751 res!706446) b!1057750))

(assert (= (and b!1057750 res!706449) b!1057744))

(assert (= (and b!1057744 (not res!706444)) b!1057752))

(assert (= (and b!1057750 (not res!706442)) b!1057748))

(assert (= (and b!1057748 (not res!706453)) b!1057746))

(assert (= (and b!1057746 (not res!706447)) b!1057749))

(assert (= (and b!1057749 res!706448) b!1057753))

(declare-fun m!976931 () Bool)

(assert (=> b!1057747 m!976931))

(declare-fun m!976933 () Bool)

(assert (=> b!1057753 m!976933))

(declare-fun m!976935 () Bool)

(assert (=> b!1057752 m!976935))

(declare-fun m!976937 () Bool)

(assert (=> b!1057743 m!976937))

(declare-fun m!976939 () Bool)

(assert (=> b!1057751 m!976939))

(declare-fun m!976941 () Bool)

(assert (=> b!1057750 m!976941))

(declare-fun m!976943 () Bool)

(assert (=> b!1057750 m!976943))

(declare-fun m!976945 () Bool)

(assert (=> b!1057745 m!976945))

(assert (=> b!1057745 m!976941))

(declare-fun m!976947 () Bool)

(assert (=> b!1057749 m!976947))

(declare-fun m!976949 () Bool)

(assert (=> start!93364 m!976949))

(declare-fun m!976951 () Bool)

(assert (=> b!1057748 m!976951))

(declare-fun m!976953 () Bool)

(assert (=> b!1057748 m!976953))

(declare-fun m!976955 () Bool)

(assert (=> b!1057748 m!976955))

(declare-fun m!976957 () Bool)

(assert (=> b!1057748 m!976957))

(declare-fun m!976959 () Bool)

(assert (=> b!1057746 m!976959))

(declare-fun m!976961 () Bool)

(assert (=> b!1057742 m!976961))

(check-sat (not b!1057751) (not b!1057748) (not b!1057745) (not start!93364) (not b!1057749) (not b!1057747) (not b!1057746) (not b!1057752) (not b!1057753) (not b!1057743))
(check-sat)
(get-model)

(declare-fun d!128371 () Bool)

(declare-fun res!706530 () Bool)

(declare-fun e!601712 () Bool)

(assert (=> d!128371 (=> res!706530 e!601712)))

(assert (=> d!128371 (= res!706530 (= (select (arr!32049 a!3488) i!1381) k0!2747))))

(assert (=> d!128371 (= (arrayContainsKey!0 a!3488 k0!2747 i!1381) e!601712)))

(declare-fun b!1057830 () Bool)

(declare-fun e!601713 () Bool)

(assert (=> b!1057830 (= e!601712 e!601713)))

(declare-fun res!706531 () Bool)

(assert (=> b!1057830 (=> (not res!706531) (not e!601713))))

(assert (=> b!1057830 (= res!706531 (bvslt (bvadd i!1381 #b00000000000000000000000000000001) (size!32587 a!3488)))))

(declare-fun b!1057831 () Bool)

(assert (=> b!1057831 (= e!601713 (arrayContainsKey!0 a!3488 k0!2747 (bvadd i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128371 (not res!706530)) b!1057830))

(assert (= (and b!1057830 res!706531) b!1057831))

(assert (=> d!128371 m!976961))

(declare-fun m!977027 () Bool)

(assert (=> b!1057831 m!977027))

(assert (=> b!1057752 d!128371))

(declare-fun bm!44837 () Bool)

(declare-fun call!44840 () Bool)

(declare-fun c!107115 () Bool)

(assert (=> bm!44837 (= call!44840 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107115 (Cons!22416 (select (arr!32049 a!3488) #b00000000000000000000000000000000) Nil!22417) Nil!22417)))))

(declare-fun d!128373 () Bool)

(declare-fun res!706539 () Bool)

(declare-fun e!601722 () Bool)

(assert (=> d!128373 (=> res!706539 e!601722)))

(assert (=> d!128373 (= res!706539 (bvsge #b00000000000000000000000000000000 (size!32587 a!3488)))))

(assert (=> d!128373 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22417) e!601722)))

(declare-fun b!1057842 () Bool)

(declare-fun e!601723 () Bool)

(assert (=> b!1057842 (= e!601723 call!44840)))

(declare-fun b!1057843 () Bool)

(declare-fun e!601725 () Bool)

(assert (=> b!1057843 (= e!601725 e!601723)))

(assert (=> b!1057843 (= c!107115 (validKeyInArray!0 (select (arr!32049 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1057844 () Bool)

(assert (=> b!1057844 (= e!601723 call!44840)))

(declare-fun b!1057845 () Bool)

(declare-fun e!601724 () Bool)

(assert (=> b!1057845 (= e!601724 (contains!6172 Nil!22417 (select (arr!32049 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1057846 () Bool)

(assert (=> b!1057846 (= e!601722 e!601725)))

(declare-fun res!706538 () Bool)

(assert (=> b!1057846 (=> (not res!706538) (not e!601725))))

(assert (=> b!1057846 (= res!706538 (not e!601724))))

(declare-fun res!706540 () Bool)

(assert (=> b!1057846 (=> (not res!706540) (not e!601724))))

(assert (=> b!1057846 (= res!706540 (validKeyInArray!0 (select (arr!32049 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!128373 (not res!706539)) b!1057846))

(assert (= (and b!1057846 res!706540) b!1057845))

(assert (= (and b!1057846 res!706538) b!1057843))

(assert (= (and b!1057843 c!107115) b!1057842))

(assert (= (and b!1057843 (not c!107115)) b!1057844))

(assert (= (or b!1057842 b!1057844) bm!44837))

(declare-fun m!977029 () Bool)

(assert (=> bm!44837 m!977029))

(declare-fun m!977031 () Bool)

(assert (=> bm!44837 m!977031))

(assert (=> b!1057843 m!977029))

(assert (=> b!1057843 m!977029))

(declare-fun m!977033 () Bool)

(assert (=> b!1057843 m!977033))

(assert (=> b!1057845 m!977029))

(assert (=> b!1057845 m!977029))

(declare-fun m!977035 () Bool)

(assert (=> b!1057845 m!977035))

(assert (=> b!1057846 m!977029))

(assert (=> b!1057846 m!977029))

(assert (=> b!1057846 m!977033))

(assert (=> b!1057747 d!128373))

(declare-fun d!128375 () Bool)

(declare-fun lt!466480 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!531 (List!22420) (InoxSet (_ BitVec 64)))

(assert (=> d!128375 (= lt!466480 (select (content!531 Nil!22417) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!601730 () Bool)

(assert (=> d!128375 (= lt!466480 e!601730)))

(declare-fun res!706545 () Bool)

(assert (=> d!128375 (=> (not res!706545) (not e!601730))))

(get-info :version)

(assert (=> d!128375 (= res!706545 ((_ is Cons!22416) Nil!22417))))

(assert (=> d!128375 (= (contains!6172 Nil!22417 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466480)))

(declare-fun b!1057851 () Bool)

(declare-fun e!601731 () Bool)

(assert (=> b!1057851 (= e!601730 e!601731)))

(declare-fun res!706546 () Bool)

(assert (=> b!1057851 (=> res!706546 e!601731)))

(assert (=> b!1057851 (= res!706546 (= (h!23625 Nil!22417) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1057852 () Bool)

(assert (=> b!1057852 (= e!601731 (contains!6172 (t!31718 Nil!22417) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!128375 res!706545) b!1057851))

(assert (= (and b!1057851 (not res!706546)) b!1057852))

(declare-fun m!977037 () Bool)

(assert (=> d!128375 m!977037))

(declare-fun m!977039 () Bool)

(assert (=> d!128375 m!977039))

(declare-fun m!977041 () Bool)

(assert (=> b!1057852 m!977041))

(assert (=> b!1057753 d!128375))

(declare-fun d!128377 () Bool)

(assert (=> d!128377 (= (array_inv!24832 a!3488) (bvsge (size!32587 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93364 d!128377))

(declare-fun d!128379 () Bool)

(declare-fun lt!466488 () (_ BitVec 32))

(assert (=> d!128379 (and (or (bvslt lt!466488 #b00000000000000000000000000000000) (bvsge lt!466488 (size!32587 lt!466443)) (and (bvsge lt!466488 #b00000000000000000000000000000000) (bvslt lt!466488 (size!32587 lt!466443)))) (bvsge lt!466488 #b00000000000000000000000000000000) (bvslt lt!466488 (size!32587 lt!466443)) (= (select (arr!32049 lt!466443) lt!466488) k0!2747))))

(declare-fun e!601746 () (_ BitVec 32))

(assert (=> d!128379 (= lt!466488 e!601746)))

(declare-fun c!107118 () Bool)

(assert (=> d!128379 (= c!107118 (= (select (arr!32049 lt!466443) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128379 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32587 lt!466443)) (bvslt (size!32587 lt!466443) #b01111111111111111111111111111111))))

(assert (=> d!128379 (= (arrayScanForKey!0 lt!466443 k0!2747 #b00000000000000000000000000000000) lt!466488)))

(declare-fun b!1057869 () Bool)

(assert (=> b!1057869 (= e!601746 #b00000000000000000000000000000000)))

(declare-fun b!1057870 () Bool)

(assert (=> b!1057870 (= e!601746 (arrayScanForKey!0 lt!466443 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128379 c!107118) b!1057869))

(assert (= (and d!128379 (not c!107118)) b!1057870))

(declare-fun m!977055 () Bool)

(assert (=> d!128379 m!977055))

(declare-fun m!977057 () Bool)

(assert (=> d!128379 m!977057))

(declare-fun m!977059 () Bool)

(assert (=> b!1057870 m!977059))

(assert (=> b!1057751 d!128379))

(declare-fun d!128393 () Bool)

(declare-fun res!706575 () Bool)

(declare-fun e!601767 () Bool)

(assert (=> d!128393 (=> res!706575 e!601767)))

(assert (=> d!128393 (= res!706575 ((_ is Nil!22417) Nil!22417))))

(assert (=> d!128393 (= (noDuplicate!1573 Nil!22417) e!601767)))

(declare-fun b!1057895 () Bool)

(declare-fun e!601768 () Bool)

(assert (=> b!1057895 (= e!601767 e!601768)))

(declare-fun res!706576 () Bool)

(assert (=> b!1057895 (=> (not res!706576) (not e!601768))))

(assert (=> b!1057895 (= res!706576 (not (contains!6172 (t!31718 Nil!22417) (h!23625 Nil!22417))))))

(declare-fun b!1057896 () Bool)

(assert (=> b!1057896 (= e!601768 (noDuplicate!1573 (t!31718 Nil!22417)))))

(assert (= (and d!128393 (not res!706575)) b!1057895))

(assert (= (and b!1057895 res!706576) b!1057896))

(declare-fun m!977061 () Bool)

(assert (=> b!1057895 m!977061))

(declare-fun m!977063 () Bool)

(assert (=> b!1057896 m!977063))

(assert (=> b!1057746 d!128393))

(declare-fun d!128395 () Bool)

(declare-fun res!706577 () Bool)

(declare-fun e!601769 () Bool)

(assert (=> d!128395 (=> res!706577 e!601769)))

(assert (=> d!128395 (= res!706577 (= (select (arr!32049 lt!466443) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128395 (= (arrayContainsKey!0 lt!466443 k0!2747 #b00000000000000000000000000000000) e!601769)))

(declare-fun b!1057897 () Bool)

(declare-fun e!601770 () Bool)

(assert (=> b!1057897 (= e!601769 e!601770)))

(declare-fun res!706578 () Bool)

(assert (=> b!1057897 (=> (not res!706578) (not e!601770))))

(assert (=> b!1057897 (= res!706578 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32587 lt!466443)))))

(declare-fun b!1057898 () Bool)

(assert (=> b!1057898 (= e!601770 (arrayContainsKey!0 lt!466443 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128395 (not res!706577)) b!1057897))

(assert (= (and b!1057897 res!706578) b!1057898))

(assert (=> d!128395 m!977057))

(declare-fun m!977065 () Bool)

(assert (=> b!1057898 m!977065))

(assert (=> b!1057745 d!128395))

(declare-fun d!128397 () Bool)

(declare-fun res!706579 () Bool)

(declare-fun e!601771 () Bool)

(assert (=> d!128397 (=> res!706579 e!601771)))

(assert (=> d!128397 (= res!706579 (= (select (arr!32049 a!3488) lt!466444) k0!2747))))

(assert (=> d!128397 (= (arrayContainsKey!0 a!3488 k0!2747 lt!466444) e!601771)))

(declare-fun b!1057899 () Bool)

(declare-fun e!601772 () Bool)

(assert (=> b!1057899 (= e!601771 e!601772)))

(declare-fun res!706580 () Bool)

(assert (=> b!1057899 (=> (not res!706580) (not e!601772))))

(assert (=> b!1057899 (= res!706580 (bvslt (bvadd lt!466444 #b00000000000000000000000000000001) (size!32587 a!3488)))))

(declare-fun b!1057900 () Bool)

(assert (=> b!1057900 (= e!601772 (arrayContainsKey!0 a!3488 k0!2747 (bvadd lt!466444 #b00000000000000000000000000000001)))))

(assert (= (and d!128397 (not res!706579)) b!1057899))

(assert (= (and b!1057899 res!706580) b!1057900))

(declare-fun m!977067 () Bool)

(assert (=> d!128397 m!977067))

(declare-fun m!977069 () Bool)

(assert (=> b!1057900 m!977069))

(assert (=> b!1057748 d!128397))

(declare-fun d!128399 () Bool)

(assert (=> d!128399 (arrayContainsKey!0 a!3488 k0!2747 lt!466444)))

(declare-fun lt!466492 () Unit!34553)

(declare-fun choose!114 (array!66659 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34553)

(assert (=> d!128399 (= lt!466492 (choose!114 a!3488 k0!2747 i!1381 lt!466444))))

(assert (=> d!128399 (bvsge i!1381 #b00000000000000000000000000000000)))

(assert (=> d!128399 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466444) lt!466492)))

(declare-fun bs!31000 () Bool)

(assert (= bs!31000 d!128399))

(assert (=> bs!31000 m!976951))

(declare-fun m!977079 () Bool)

(assert (=> bs!31000 m!977079))

(assert (=> b!1057748 d!128399))

(declare-fun c!107125 () Bool)

(declare-fun bm!44844 () Bool)

(declare-fun call!44847 () Bool)

(assert (=> bm!44844 (= call!44847 (arrayNoDuplicates!0 a!3488 (bvadd lt!466447 #b00000000000000000000000000000001) (ite c!107125 (Cons!22416 (select (arr!32049 a!3488) lt!466447) Nil!22417) Nil!22417)))))

(declare-fun d!128403 () Bool)

(declare-fun res!706588 () Bool)

(declare-fun e!601781 () Bool)

(assert (=> d!128403 (=> res!706588 e!601781)))

(assert (=> d!128403 (= res!706588 (bvsge lt!466447 (size!32587 a!3488)))))

(assert (=> d!128403 (= (arrayNoDuplicates!0 a!3488 lt!466447 Nil!22417) e!601781)))

(declare-fun b!1057911 () Bool)

(declare-fun e!601782 () Bool)

(assert (=> b!1057911 (= e!601782 call!44847)))

(declare-fun b!1057912 () Bool)

(declare-fun e!601784 () Bool)

(assert (=> b!1057912 (= e!601784 e!601782)))

(assert (=> b!1057912 (= c!107125 (validKeyInArray!0 (select (arr!32049 a!3488) lt!466447)))))

(declare-fun b!1057913 () Bool)

(assert (=> b!1057913 (= e!601782 call!44847)))

(declare-fun b!1057914 () Bool)

(declare-fun e!601783 () Bool)

(assert (=> b!1057914 (= e!601783 (contains!6172 Nil!22417 (select (arr!32049 a!3488) lt!466447)))))

(declare-fun b!1057915 () Bool)

(assert (=> b!1057915 (= e!601781 e!601784)))

(declare-fun res!706587 () Bool)

(assert (=> b!1057915 (=> (not res!706587) (not e!601784))))

(assert (=> b!1057915 (= res!706587 (not e!601783))))

(declare-fun res!706589 () Bool)

(assert (=> b!1057915 (=> (not res!706589) (not e!601783))))

(assert (=> b!1057915 (= res!706589 (validKeyInArray!0 (select (arr!32049 a!3488) lt!466447)))))

(assert (= (and d!128403 (not res!706588)) b!1057915))

(assert (= (and b!1057915 res!706589) b!1057914))

(assert (= (and b!1057915 res!706587) b!1057912))

(assert (= (and b!1057912 c!107125) b!1057911))

(assert (= (and b!1057912 (not c!107125)) b!1057913))

(assert (= (or b!1057911 b!1057913) bm!44844))

(declare-fun m!977089 () Bool)

(assert (=> bm!44844 m!977089))

(declare-fun m!977091 () Bool)

(assert (=> bm!44844 m!977091))

(assert (=> b!1057912 m!977089))

(assert (=> b!1057912 m!977089))

(declare-fun m!977093 () Bool)

(assert (=> b!1057912 m!977093))

(assert (=> b!1057914 m!977089))

(assert (=> b!1057914 m!977089))

(declare-fun m!977095 () Bool)

(assert (=> b!1057914 m!977095))

(assert (=> b!1057915 m!977089))

(assert (=> b!1057915 m!977089))

(assert (=> b!1057915 m!977093))

(assert (=> b!1057748 d!128403))

(declare-fun d!128407 () Bool)

(assert (=> d!128407 (arrayNoDuplicates!0 a!3488 lt!466447 Nil!22417)))

(declare-fun lt!466501 () Unit!34553)

(declare-fun choose!39 (array!66659 (_ BitVec 32) (_ BitVec 32)) Unit!34553)

(assert (=> d!128407 (= lt!466501 (choose!39 a!3488 #b00000000000000000000000000000000 lt!466447))))

(assert (=> d!128407 (bvslt (size!32587 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128407 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466447) lt!466501)))

(declare-fun bs!31003 () Bool)

(assert (= bs!31003 d!128407))

(assert (=> bs!31003 m!976955))

(declare-fun m!977111 () Bool)

(assert (=> bs!31003 m!977111))

(assert (=> b!1057748 d!128407))

(declare-fun d!128419 () Bool)

(assert (=> d!128419 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1057743 d!128419))

(declare-fun d!128425 () Bool)

(declare-fun lt!466502 () Bool)

(assert (=> d!128425 (= lt!466502 (select (content!531 Nil!22417) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!601801 () Bool)

(assert (=> d!128425 (= lt!466502 e!601801)))

(declare-fun res!706605 () Bool)

(assert (=> d!128425 (=> (not res!706605) (not e!601801))))

(assert (=> d!128425 (= res!706605 ((_ is Cons!22416) Nil!22417))))

(assert (=> d!128425 (= (contains!6172 Nil!22417 #b0000000000000000000000000000000000000000000000000000000000000000) lt!466502)))

(declare-fun b!1057933 () Bool)

(declare-fun e!601802 () Bool)

(assert (=> b!1057933 (= e!601801 e!601802)))

(declare-fun res!706606 () Bool)

(assert (=> b!1057933 (=> res!706606 e!601802)))

(assert (=> b!1057933 (= res!706606 (= (h!23625 Nil!22417) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1057934 () Bool)

(assert (=> b!1057934 (= e!601802 (contains!6172 (t!31718 Nil!22417) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!128425 res!706605) b!1057933))

(assert (= (and b!1057933 (not res!706606)) b!1057934))

(assert (=> d!128425 m!977037))

(declare-fun m!977119 () Bool)

(assert (=> d!128425 m!977119))

(declare-fun m!977121 () Bool)

(assert (=> b!1057934 m!977121))

(assert (=> b!1057749 d!128425))

(check-sat (not b!1057831) (not b!1057852) (not b!1057843) (not b!1057898) (not b!1057896) (not bm!44844) (not b!1057870) (not b!1057914) (not b!1057895) (not d!128407) (not b!1057912) (not b!1057846) (not b!1057900) (not b!1057845) (not d!128425) (not bm!44837) (not d!128375) (not b!1057934) (not b!1057915) (not d!128399))
(check-sat)
