; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116128 () Bool)

(assert start!116128)

(declare-fun b!1371729 () Bool)

(declare-fun res!915138 () Bool)

(declare-fun e!777049 () Bool)

(assert (=> b!1371729 (=> (not res!915138) (not e!777049))))

(declare-datatypes ((array!93006 0))(
  ( (array!93007 (arr!44917 (Array (_ BitVec 32) (_ BitVec 64))) (size!45469 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93006)

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((List!32063 0))(
  ( (Nil!32060) (Cons!32059 (h!33268 (_ BitVec 64)) (t!46749 List!32063)) )
))
(declare-fun acc!866 () List!32063)

(declare-fun contains!9656 (List!32063 (_ BitVec 64)) Bool)

(assert (=> b!1371729 (= res!915138 (not (contains!9656 acc!866 (select (arr!44917 a!3861) from!3239))))))

(declare-fun res!915141 () Bool)

(declare-fun e!777050 () Bool)

(assert (=> start!116128 (=> (not res!915141) (not e!777050))))

(assert (=> start!116128 (= res!915141 (and (bvslt (size!45469 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45469 a!3861))))))

(assert (=> start!116128 e!777050))

(declare-fun array_inv!34150 (array!93006) Bool)

(assert (=> start!116128 (array_inv!34150 a!3861)))

(assert (=> start!116128 true))

(declare-fun b!1371730 () Bool)

(declare-fun res!915137 () Bool)

(assert (=> b!1371730 (=> (not res!915137) (not e!777050))))

(declare-fun newAcc!98 () List!32063)

(declare-fun subseq!1094 (List!32063 List!32063) Bool)

(assert (=> b!1371730 (= res!915137 (subseq!1094 newAcc!98 acc!866))))

(declare-fun b!1371731 () Bool)

(declare-fun res!915144 () Bool)

(assert (=> b!1371731 (=> (not res!915144) (not e!777050))))

(assert (=> b!1371731 (= res!915144 (not (contains!9656 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371732 () Bool)

(declare-fun res!915142 () Bool)

(assert (=> b!1371732 (=> (not res!915142) (not e!777050))))

(assert (=> b!1371732 (= res!915142 (not (contains!9656 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371733 () Bool)

(declare-fun res!915136 () Bool)

(assert (=> b!1371733 (=> (not res!915136) (not e!777050))))

(assert (=> b!1371733 (= res!915136 (not (contains!9656 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1371734 () Bool)

(declare-fun res!915143 () Bool)

(assert (=> b!1371734 (=> (not res!915143) (not e!777049))))

(assert (=> b!1371734 (= res!915143 (bvslt from!3239 (size!45469 a!3861)))))

(declare-fun b!1371735 () Bool)

(declare-fun res!915145 () Bool)

(assert (=> b!1371735 (=> (not res!915145) (not e!777049))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1371735 (= res!915145 (validKeyInArray!0 (select (arr!44917 a!3861) from!3239)))))

(declare-fun b!1371736 () Bool)

(assert (=> b!1371736 (= e!777050 e!777049)))

(declare-fun res!915140 () Bool)

(assert (=> b!1371736 (=> (not res!915140) (not e!777049))))

(declare-fun arrayNoDuplicates!0 (array!93006 (_ BitVec 32) List!32063) Bool)

(assert (=> b!1371736 (= res!915140 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45162 0))(
  ( (Unit!45163) )
))
(declare-fun lt!602548 () Unit!45162)

(declare-fun noDuplicateSubseq!281 (List!32063 List!32063) Unit!45162)

(assert (=> b!1371736 (= lt!602548 (noDuplicateSubseq!281 newAcc!98 acc!866))))

(declare-fun b!1371737 () Bool)

(assert (=> b!1371737 (= e!777049 (not (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98)))))

(declare-fun lt!602550 () Unit!45162)

(declare-fun lt!602547 () List!32063)

(declare-fun lt!602546 () List!32063)

(assert (=> b!1371737 (= lt!602550 (noDuplicateSubseq!281 lt!602547 lt!602546))))

(assert (=> b!1371737 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602547)))

(declare-fun lt!602549 () Unit!45162)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!93006 List!32063 List!32063 (_ BitVec 32)) Unit!45162)

(assert (=> b!1371737 (= lt!602549 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!602546 lt!602547 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> b!1371737 (= lt!602547 (Cons!32059 (select (arr!44917 a!3861) from!3239) newAcc!98))))

(assert (=> b!1371737 (= lt!602546 (Cons!32059 (select (arr!44917 a!3861) from!3239) acc!866))))

(declare-fun b!1371738 () Bool)

(declare-fun res!915146 () Bool)

(assert (=> b!1371738 (=> (not res!915146) (not e!777050))))

(declare-fun noDuplicate!2571 (List!32063) Bool)

(assert (=> b!1371738 (= res!915146 (noDuplicate!2571 acc!866))))

(declare-fun b!1371739 () Bool)

(declare-fun res!915139 () Bool)

(assert (=> b!1371739 (=> (not res!915139) (not e!777050))))

(assert (=> b!1371739 (= res!915139 (not (contains!9656 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116128 res!915141) b!1371738))

(assert (= (and b!1371738 res!915146) b!1371732))

(assert (= (and b!1371732 res!915142) b!1371739))

(assert (= (and b!1371739 res!915139) b!1371733))

(assert (= (and b!1371733 res!915136) b!1371731))

(assert (= (and b!1371731 res!915144) b!1371730))

(assert (= (and b!1371730 res!915137) b!1371736))

(assert (= (and b!1371736 res!915140) b!1371734))

(assert (= (and b!1371734 res!915143) b!1371735))

(assert (= (and b!1371735 res!915145) b!1371729))

(assert (= (and b!1371729 res!915138) b!1371737))

(declare-fun m!1254681 () Bool)

(assert (=> b!1371735 m!1254681))

(assert (=> b!1371735 m!1254681))

(declare-fun m!1254683 () Bool)

(assert (=> b!1371735 m!1254683))

(assert (=> b!1371729 m!1254681))

(assert (=> b!1371729 m!1254681))

(declare-fun m!1254685 () Bool)

(assert (=> b!1371729 m!1254685))

(declare-fun m!1254687 () Bool)

(assert (=> b!1371732 m!1254687))

(declare-fun m!1254689 () Bool)

(assert (=> b!1371737 m!1254689))

(assert (=> b!1371737 m!1254681))

(declare-fun m!1254691 () Bool)

(assert (=> b!1371737 m!1254691))

(declare-fun m!1254693 () Bool)

(assert (=> b!1371737 m!1254693))

(declare-fun m!1254695 () Bool)

(assert (=> b!1371737 m!1254695))

(declare-fun m!1254697 () Bool)

(assert (=> b!1371739 m!1254697))

(declare-fun m!1254699 () Bool)

(assert (=> start!116128 m!1254699))

(declare-fun m!1254701 () Bool)

(assert (=> b!1371731 m!1254701))

(declare-fun m!1254703 () Bool)

(assert (=> b!1371733 m!1254703))

(declare-fun m!1254705 () Bool)

(assert (=> b!1371730 m!1254705))

(declare-fun m!1254707 () Bool)

(assert (=> b!1371736 m!1254707))

(declare-fun m!1254709 () Bool)

(assert (=> b!1371736 m!1254709))

(declare-fun m!1254711 () Bool)

(assert (=> b!1371738 m!1254711))

(check-sat (not b!1371733) (not b!1371731) (not b!1371735) (not start!116128) (not b!1371732) (not b!1371737) (not b!1371738) (not b!1371730) (not b!1371739) (not b!1371736) (not b!1371729))
(check-sat)
(get-model)

(declare-fun d!147433 () Bool)

(assert (=> d!147433 (= (validKeyInArray!0 (select (arr!44917 a!3861) from!3239)) (and (not (= (select (arr!44917 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44917 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1371735 d!147433))

(declare-fun b!1371814 () Bool)

(declare-fun e!777078 () Bool)

(declare-fun e!777080 () Bool)

(assert (=> b!1371814 (= e!777078 e!777080)))

(declare-fun res!915221 () Bool)

(assert (=> b!1371814 (=> (not res!915221) (not e!777080))))

(get-info :version)

(assert (=> b!1371814 (= res!915221 ((_ is Cons!32059) acc!866))))

(declare-fun b!1371816 () Bool)

(declare-fun e!777081 () Bool)

(assert (=> b!1371816 (= e!777081 (subseq!1094 (t!46749 newAcc!98) (t!46749 acc!866)))))

(declare-fun b!1371817 () Bool)

(declare-fun e!777079 () Bool)

(assert (=> b!1371817 (= e!777079 (subseq!1094 newAcc!98 (t!46749 acc!866)))))

(declare-fun d!147435 () Bool)

(declare-fun res!915222 () Bool)

(assert (=> d!147435 (=> res!915222 e!777078)))

(assert (=> d!147435 (= res!915222 ((_ is Nil!32060) newAcc!98))))

(assert (=> d!147435 (= (subseq!1094 newAcc!98 acc!866) e!777078)))

(declare-fun b!1371815 () Bool)

(assert (=> b!1371815 (= e!777080 e!777079)))

(declare-fun res!915224 () Bool)

(assert (=> b!1371815 (=> res!915224 e!777079)))

(assert (=> b!1371815 (= res!915224 e!777081)))

(declare-fun res!915223 () Bool)

(assert (=> b!1371815 (=> (not res!915223) (not e!777081))))

(assert (=> b!1371815 (= res!915223 (= (h!33268 newAcc!98) (h!33268 acc!866)))))

(assert (= (and d!147435 (not res!915222)) b!1371814))

(assert (= (and b!1371814 res!915221) b!1371815))

(assert (= (and b!1371815 res!915223) b!1371816))

(assert (= (and b!1371815 (not res!915224)) b!1371817))

(declare-fun m!1254777 () Bool)

(assert (=> b!1371816 m!1254777))

(declare-fun m!1254779 () Bool)

(assert (=> b!1371817 m!1254779))

(assert (=> b!1371730 d!147435))

(declare-fun b!1371846 () Bool)

(declare-fun e!777112 () Bool)

(declare-fun call!65550 () Bool)

(assert (=> b!1371846 (= e!777112 call!65550)))

(declare-fun e!777113 () Bool)

(declare-fun b!1371847 () Bool)

(assert (=> b!1371847 (= e!777113 (contains!9656 acc!866 (select (arr!44917 a!3861) from!3239)))))

(declare-fun d!147441 () Bool)

(declare-fun res!915249 () Bool)

(declare-fun e!777111 () Bool)

(assert (=> d!147441 (=> res!915249 e!777111)))

(assert (=> d!147441 (= res!915249 (bvsge from!3239 (size!45469 a!3861)))))

(assert (=> d!147441 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!777111)))

(declare-fun bm!65547 () Bool)

(declare-fun c!127743 () Bool)

(assert (=> bm!65547 (= call!65550 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127743 (Cons!32059 (select (arr!44917 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1371850 () Bool)

(declare-fun e!777110 () Bool)

(assert (=> b!1371850 (= e!777111 e!777110)))

(declare-fun res!915250 () Bool)

(assert (=> b!1371850 (=> (not res!915250) (not e!777110))))

(assert (=> b!1371850 (= res!915250 (not e!777113))))

(declare-fun res!915251 () Bool)

(assert (=> b!1371850 (=> (not res!915251) (not e!777113))))

(assert (=> b!1371850 (= res!915251 (validKeyInArray!0 (select (arr!44917 a!3861) from!3239)))))

(declare-fun b!1371851 () Bool)

(assert (=> b!1371851 (= e!777110 e!777112)))

(assert (=> b!1371851 (= c!127743 (validKeyInArray!0 (select (arr!44917 a!3861) from!3239)))))

(declare-fun b!1371852 () Bool)

(assert (=> b!1371852 (= e!777112 call!65550)))

(assert (= (and d!147441 (not res!915249)) b!1371850))

(assert (= (and b!1371850 res!915251) b!1371847))

(assert (= (and b!1371850 res!915250) b!1371851))

(assert (= (and b!1371851 c!127743) b!1371846))

(assert (= (and b!1371851 (not c!127743)) b!1371852))

(assert (= (or b!1371846 b!1371852) bm!65547))

(assert (=> b!1371847 m!1254681))

(assert (=> b!1371847 m!1254681))

(assert (=> b!1371847 m!1254685))

(assert (=> bm!65547 m!1254681))

(declare-fun m!1254785 () Bool)

(assert (=> bm!65547 m!1254785))

(assert (=> b!1371850 m!1254681))

(assert (=> b!1371850 m!1254681))

(assert (=> b!1371850 m!1254683))

(assert (=> b!1371851 m!1254681))

(assert (=> b!1371851 m!1254681))

(assert (=> b!1371851 m!1254683))

(assert (=> b!1371736 d!147441))

(declare-fun d!147449 () Bool)

(assert (=> d!147449 (noDuplicate!2571 newAcc!98)))

(declare-fun lt!602583 () Unit!45162)

(declare-fun choose!2026 (List!32063 List!32063) Unit!45162)

(assert (=> d!147449 (= lt!602583 (choose!2026 newAcc!98 acc!866))))

(declare-fun e!777128 () Bool)

(assert (=> d!147449 e!777128))

(declare-fun res!915262 () Bool)

(assert (=> d!147449 (=> (not res!915262) (not e!777128))))

(assert (=> d!147449 (= res!915262 (subseq!1094 newAcc!98 acc!866))))

(assert (=> d!147449 (= (noDuplicateSubseq!281 newAcc!98 acc!866) lt!602583)))

(declare-fun b!1371871 () Bool)

(assert (=> b!1371871 (= e!777128 (noDuplicate!2571 acc!866))))

(assert (= (and d!147449 res!915262) b!1371871))

(declare-fun m!1254793 () Bool)

(assert (=> d!147449 m!1254793))

(declare-fun m!1254795 () Bool)

(assert (=> d!147449 m!1254795))

(assert (=> d!147449 m!1254705))

(assert (=> b!1371871 m!1254711))

(assert (=> b!1371736 d!147449))

(declare-fun d!147455 () Bool)

(declare-fun lt!602592 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!737 (List!32063) (InoxSet (_ BitVec 64)))

(assert (=> d!147455 (= lt!602592 (select (content!737 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777141 () Bool)

(assert (=> d!147455 (= lt!602592 e!777141)))

(declare-fun res!915275 () Bool)

(assert (=> d!147455 (=> (not res!915275) (not e!777141))))

(assert (=> d!147455 (= res!915275 ((_ is Cons!32059) newAcc!98))))

(assert (=> d!147455 (= (contains!9656 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602592)))

(declare-fun b!1371887 () Bool)

(declare-fun e!777142 () Bool)

(assert (=> b!1371887 (= e!777141 e!777142)))

(declare-fun res!915274 () Bool)

(assert (=> b!1371887 (=> res!915274 e!777142)))

(assert (=> b!1371887 (= res!915274 (= (h!33268 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371888 () Bool)

(assert (=> b!1371888 (= e!777142 (contains!9656 (t!46749 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147455 res!915275) b!1371887))

(assert (= (and b!1371887 (not res!915274)) b!1371888))

(declare-fun m!1254809 () Bool)

(assert (=> d!147455 m!1254809))

(declare-fun m!1254811 () Bool)

(assert (=> d!147455 m!1254811))

(declare-fun m!1254815 () Bool)

(assert (=> b!1371888 m!1254815))

(assert (=> b!1371731 d!147455))

(declare-fun b!1371893 () Bool)

(declare-fun e!777149 () Bool)

(declare-fun call!65556 () Bool)

(assert (=> b!1371893 (= e!777149 call!65556)))

(declare-fun b!1371894 () Bool)

(declare-fun e!777150 () Bool)

(assert (=> b!1371894 (= e!777150 (contains!9656 newAcc!98 (select (arr!44917 a!3861) from!3239)))))

(declare-fun d!147463 () Bool)

(declare-fun res!915280 () Bool)

(declare-fun e!777148 () Bool)

(assert (=> d!147463 (=> res!915280 e!777148)))

(assert (=> d!147463 (= res!915280 (bvsge from!3239 (size!45469 a!3861)))))

(assert (=> d!147463 (= (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98) e!777148)))

(declare-fun c!127749 () Bool)

(declare-fun bm!65553 () Bool)

(assert (=> bm!65553 (= call!65556 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127749 (Cons!32059 (select (arr!44917 a!3861) from!3239) newAcc!98) newAcc!98)))))

(declare-fun b!1371895 () Bool)

(declare-fun e!777147 () Bool)

(assert (=> b!1371895 (= e!777148 e!777147)))

(declare-fun res!915281 () Bool)

(assert (=> b!1371895 (=> (not res!915281) (not e!777147))))

(assert (=> b!1371895 (= res!915281 (not e!777150))))

(declare-fun res!915282 () Bool)

(assert (=> b!1371895 (=> (not res!915282) (not e!777150))))

(assert (=> b!1371895 (= res!915282 (validKeyInArray!0 (select (arr!44917 a!3861) from!3239)))))

(declare-fun b!1371896 () Bool)

(assert (=> b!1371896 (= e!777147 e!777149)))

(assert (=> b!1371896 (= c!127749 (validKeyInArray!0 (select (arr!44917 a!3861) from!3239)))))

(declare-fun b!1371897 () Bool)

(assert (=> b!1371897 (= e!777149 call!65556)))

(assert (= (and d!147463 (not res!915280)) b!1371895))

(assert (= (and b!1371895 res!915282) b!1371894))

(assert (= (and b!1371895 res!915281) b!1371896))

(assert (= (and b!1371896 c!127749) b!1371893))

(assert (= (and b!1371896 (not c!127749)) b!1371897))

(assert (= (or b!1371893 b!1371897) bm!65553))

(assert (=> b!1371894 m!1254681))

(assert (=> b!1371894 m!1254681))

(declare-fun m!1254823 () Bool)

(assert (=> b!1371894 m!1254823))

(assert (=> bm!65553 m!1254681))

(declare-fun m!1254825 () Bool)

(assert (=> bm!65553 m!1254825))

(assert (=> b!1371895 m!1254681))

(assert (=> b!1371895 m!1254681))

(assert (=> b!1371895 m!1254683))

(assert (=> b!1371896 m!1254681))

(assert (=> b!1371896 m!1254681))

(assert (=> b!1371896 m!1254683))

(assert (=> b!1371737 d!147463))

(declare-fun d!147467 () Bool)

(assert (=> d!147467 (noDuplicate!2571 lt!602547)))

(declare-fun lt!602595 () Unit!45162)

(assert (=> d!147467 (= lt!602595 (choose!2026 lt!602547 lt!602546))))

(declare-fun e!777151 () Bool)

(assert (=> d!147467 e!777151))

(declare-fun res!915283 () Bool)

(assert (=> d!147467 (=> (not res!915283) (not e!777151))))

(assert (=> d!147467 (= res!915283 (subseq!1094 lt!602547 lt!602546))))

(assert (=> d!147467 (= (noDuplicateSubseq!281 lt!602547 lt!602546) lt!602595)))

(declare-fun b!1371898 () Bool)

(assert (=> b!1371898 (= e!777151 (noDuplicate!2571 lt!602546))))

(assert (= (and d!147467 res!915283) b!1371898))

(declare-fun m!1254827 () Bool)

(assert (=> d!147467 m!1254827))

(declare-fun m!1254829 () Bool)

(assert (=> d!147467 m!1254829))

(declare-fun m!1254831 () Bool)

(assert (=> d!147467 m!1254831))

(declare-fun m!1254833 () Bool)

(assert (=> b!1371898 m!1254833))

(assert (=> b!1371737 d!147467))

(declare-fun b!1371901 () Bool)

(declare-fun e!777156 () Bool)

(declare-fun call!65557 () Bool)

(assert (=> b!1371901 (= e!777156 call!65557)))

(declare-fun e!777157 () Bool)

(declare-fun b!1371902 () Bool)

(assert (=> b!1371902 (= e!777157 (contains!9656 lt!602547 (select (arr!44917 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun d!147469 () Bool)

(declare-fun res!915286 () Bool)

(declare-fun e!777155 () Bool)

(assert (=> d!147469 (=> res!915286 e!777155)))

(assert (=> d!147469 (= res!915286 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45469 a!3861)))))

(assert (=> d!147469 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602547) e!777155)))

(declare-fun c!127750 () Bool)

(declare-fun bm!65554 () Bool)

(assert (=> bm!65554 (= call!65557 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127750 (Cons!32059 (select (arr!44917 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) lt!602547) lt!602547)))))

(declare-fun b!1371903 () Bool)

(declare-fun e!777154 () Bool)

(assert (=> b!1371903 (= e!777155 e!777154)))

(declare-fun res!915287 () Bool)

(assert (=> b!1371903 (=> (not res!915287) (not e!777154))))

(assert (=> b!1371903 (= res!915287 (not e!777157))))

(declare-fun res!915288 () Bool)

(assert (=> b!1371903 (=> (not res!915288) (not e!777157))))

(assert (=> b!1371903 (= res!915288 (validKeyInArray!0 (select (arr!44917 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1371904 () Bool)

(assert (=> b!1371904 (= e!777154 e!777156)))

(assert (=> b!1371904 (= c!127750 (validKeyInArray!0 (select (arr!44917 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1371905 () Bool)

(assert (=> b!1371905 (= e!777156 call!65557)))

(assert (= (and d!147469 (not res!915286)) b!1371903))

(assert (= (and b!1371903 res!915288) b!1371902))

(assert (= (and b!1371903 res!915287) b!1371904))

(assert (= (and b!1371904 c!127750) b!1371901))

(assert (= (and b!1371904 (not c!127750)) b!1371905))

(assert (= (or b!1371901 b!1371905) bm!65554))

(declare-fun m!1254847 () Bool)

(assert (=> b!1371902 m!1254847))

(assert (=> b!1371902 m!1254847))

(declare-fun m!1254849 () Bool)

(assert (=> b!1371902 m!1254849))

(assert (=> bm!65554 m!1254847))

(declare-fun m!1254851 () Bool)

(assert (=> bm!65554 m!1254851))

(assert (=> b!1371903 m!1254847))

(assert (=> b!1371903 m!1254847))

(declare-fun m!1254853 () Bool)

(assert (=> b!1371903 m!1254853))

(assert (=> b!1371904 m!1254847))

(assert (=> b!1371904 m!1254847))

(assert (=> b!1371904 m!1254853))

(assert (=> b!1371737 d!147469))

(declare-fun d!147475 () Bool)

(assert (=> d!147475 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602547)))

(declare-fun lt!602606 () Unit!45162)

(declare-fun choose!80 (array!93006 List!32063 List!32063 (_ BitVec 32)) Unit!45162)

(assert (=> d!147475 (= lt!602606 (choose!80 a!3861 lt!602546 lt!602547 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> d!147475 (bvslt (size!45469 a!3861) #b01111111111111111111111111111111)))

(assert (=> d!147475 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!602546 lt!602547 (bvadd #b00000000000000000000000000000001 from!3239)) lt!602606)))

(declare-fun bs!39294 () Bool)

(assert (= bs!39294 d!147475))

(assert (=> bs!39294 m!1254689))

(declare-fun m!1254885 () Bool)

(assert (=> bs!39294 m!1254885))

(assert (=> b!1371737 d!147475))

(declare-fun d!147489 () Bool)

(declare-fun lt!602609 () Bool)

(assert (=> d!147489 (= lt!602609 (select (content!737 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777173 () Bool)

(assert (=> d!147489 (= lt!602609 e!777173)))

(declare-fun res!915303 () Bool)

(assert (=> d!147489 (=> (not res!915303) (not e!777173))))

(assert (=> d!147489 (= res!915303 ((_ is Cons!32059) acc!866))))

(assert (=> d!147489 (= (contains!9656 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602609)))

(declare-fun b!1371923 () Bool)

(declare-fun e!777174 () Bool)

(assert (=> b!1371923 (= e!777173 e!777174)))

(declare-fun res!915302 () Bool)

(assert (=> b!1371923 (=> res!915302 e!777174)))

(assert (=> b!1371923 (= res!915302 (= (h!33268 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371924 () Bool)

(assert (=> b!1371924 (= e!777174 (contains!9656 (t!46749 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147489 res!915303) b!1371923))

(assert (= (and b!1371923 (not res!915302)) b!1371924))

(declare-fun m!1254887 () Bool)

(assert (=> d!147489 m!1254887))

(declare-fun m!1254889 () Bool)

(assert (=> d!147489 m!1254889))

(declare-fun m!1254891 () Bool)

(assert (=> b!1371924 m!1254891))

(assert (=> b!1371732 d!147489))

(declare-fun d!147491 () Bool)

(declare-fun res!915316 () Bool)

(declare-fun e!777187 () Bool)

(assert (=> d!147491 (=> res!915316 e!777187)))

(assert (=> d!147491 (= res!915316 ((_ is Nil!32060) acc!866))))

(assert (=> d!147491 (= (noDuplicate!2571 acc!866) e!777187)))

(declare-fun b!1371937 () Bool)

(declare-fun e!777188 () Bool)

(assert (=> b!1371937 (= e!777187 e!777188)))

(declare-fun res!915317 () Bool)

(assert (=> b!1371937 (=> (not res!915317) (not e!777188))))

(assert (=> b!1371937 (= res!915317 (not (contains!9656 (t!46749 acc!866) (h!33268 acc!866))))))

(declare-fun b!1371938 () Bool)

(assert (=> b!1371938 (= e!777188 (noDuplicate!2571 (t!46749 acc!866)))))

(assert (= (and d!147491 (not res!915316)) b!1371937))

(assert (= (and b!1371937 res!915317) b!1371938))

(declare-fun m!1254905 () Bool)

(assert (=> b!1371937 m!1254905))

(declare-fun m!1254907 () Bool)

(assert (=> b!1371938 m!1254907))

(assert (=> b!1371738 d!147491))

(declare-fun d!147501 () Bool)

(declare-fun lt!602615 () Bool)

(assert (=> d!147501 (= lt!602615 (select (content!737 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777193 () Bool)

(assert (=> d!147501 (= lt!602615 e!777193)))

(declare-fun res!915322 () Bool)

(assert (=> d!147501 (=> (not res!915322) (not e!777193))))

(assert (=> d!147501 (= res!915322 ((_ is Cons!32059) newAcc!98))))

(assert (=> d!147501 (= (contains!9656 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602615)))

(declare-fun b!1371944 () Bool)

(declare-fun e!777194 () Bool)

(assert (=> b!1371944 (= e!777193 e!777194)))

(declare-fun res!915321 () Bool)

(assert (=> b!1371944 (=> res!915321 e!777194)))

(assert (=> b!1371944 (= res!915321 (= (h!33268 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371945 () Bool)

(assert (=> b!1371945 (= e!777194 (contains!9656 (t!46749 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147501 res!915322) b!1371944))

(assert (= (and b!1371944 (not res!915321)) b!1371945))

(assert (=> d!147501 m!1254809))

(declare-fun m!1254909 () Bool)

(assert (=> d!147501 m!1254909))

(declare-fun m!1254911 () Bool)

(assert (=> b!1371945 m!1254911))

(assert (=> b!1371733 d!147501))

(declare-fun d!147503 () Bool)

(declare-fun lt!602616 () Bool)

(assert (=> d!147503 (= lt!602616 (select (content!737 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777195 () Bool)

(assert (=> d!147503 (= lt!602616 e!777195)))

(declare-fun res!915324 () Bool)

(assert (=> d!147503 (=> (not res!915324) (not e!777195))))

(assert (=> d!147503 (= res!915324 ((_ is Cons!32059) acc!866))))

(assert (=> d!147503 (= (contains!9656 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602616)))

(declare-fun b!1371946 () Bool)

(declare-fun e!777196 () Bool)

(assert (=> b!1371946 (= e!777195 e!777196)))

(declare-fun res!915323 () Bool)

(assert (=> b!1371946 (=> res!915323 e!777196)))

(assert (=> b!1371946 (= res!915323 (= (h!33268 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371947 () Bool)

(assert (=> b!1371947 (= e!777196 (contains!9656 (t!46749 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147503 res!915324) b!1371946))

(assert (= (and b!1371946 (not res!915323)) b!1371947))

(assert (=> d!147503 m!1254887))

(declare-fun m!1254915 () Bool)

(assert (=> d!147503 m!1254915))

(declare-fun m!1254917 () Bool)

(assert (=> b!1371947 m!1254917))

(assert (=> b!1371739 d!147503))

(declare-fun d!147507 () Bool)

(assert (=> d!147507 (= (array_inv!34150 a!3861) (bvsge (size!45469 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116128 d!147507))

(declare-fun d!147513 () Bool)

(declare-fun lt!602619 () Bool)

(assert (=> d!147513 (= lt!602619 (select (content!737 acc!866) (select (arr!44917 a!3861) from!3239)))))

(declare-fun e!777200 () Bool)

(assert (=> d!147513 (= lt!602619 e!777200)))

(declare-fun res!915329 () Bool)

(assert (=> d!147513 (=> (not res!915329) (not e!777200))))

(assert (=> d!147513 (= res!915329 ((_ is Cons!32059) acc!866))))

(assert (=> d!147513 (= (contains!9656 acc!866 (select (arr!44917 a!3861) from!3239)) lt!602619)))

(declare-fun b!1371951 () Bool)

(declare-fun e!777201 () Bool)

(assert (=> b!1371951 (= e!777200 e!777201)))

(declare-fun res!915328 () Bool)

(assert (=> b!1371951 (=> res!915328 e!777201)))

(assert (=> b!1371951 (= res!915328 (= (h!33268 acc!866) (select (arr!44917 a!3861) from!3239)))))

(declare-fun b!1371952 () Bool)

(assert (=> b!1371952 (= e!777201 (contains!9656 (t!46749 acc!866) (select (arr!44917 a!3861) from!3239)))))

(assert (= (and d!147513 res!915329) b!1371951))

(assert (= (and b!1371951 (not res!915328)) b!1371952))

(assert (=> d!147513 m!1254887))

(assert (=> d!147513 m!1254681))

(declare-fun m!1254929 () Bool)

(assert (=> d!147513 m!1254929))

(assert (=> b!1371952 m!1254681))

(declare-fun m!1254931 () Bool)

(assert (=> b!1371952 m!1254931))

(assert (=> b!1371729 d!147513))

(check-sat (not b!1371938) (not b!1371952) (not d!147449) (not b!1371894) (not bm!65553) (not bm!65554) (not d!147513) (not b!1371896) (not b!1371895) (not d!147467) (not b!1371937) (not b!1371851) (not b!1371888) (not b!1371898) (not b!1371847) (not b!1371904) (not d!147475) (not d!147455) (not d!147489) (not b!1371817) (not b!1371816) (not b!1371945) (not b!1371903) (not b!1371947) (not d!147503) (not b!1371924) (not bm!65547) (not b!1371902) (not b!1371850) (not b!1371871) (not d!147501))
(check-sat)
(get-model)

(declare-fun lt!602623 () Bool)

(declare-fun d!147523 () Bool)

(assert (=> d!147523 (= lt!602623 (select (content!737 (t!46749 acc!866)) (select (arr!44917 a!3861) from!3239)))))

(declare-fun e!777238 () Bool)

(assert (=> d!147523 (= lt!602623 e!777238)))

(declare-fun res!915367 () Bool)

(assert (=> d!147523 (=> (not res!915367) (not e!777238))))

(assert (=> d!147523 (= res!915367 ((_ is Cons!32059) (t!46749 acc!866)))))

(assert (=> d!147523 (= (contains!9656 (t!46749 acc!866) (select (arr!44917 a!3861) from!3239)) lt!602623)))

(declare-fun b!1371989 () Bool)

(declare-fun e!777239 () Bool)

(assert (=> b!1371989 (= e!777238 e!777239)))

(declare-fun res!915366 () Bool)

(assert (=> b!1371989 (=> res!915366 e!777239)))

(assert (=> b!1371989 (= res!915366 (= (h!33268 (t!46749 acc!866)) (select (arr!44917 a!3861) from!3239)))))

(declare-fun b!1371990 () Bool)

(assert (=> b!1371990 (= e!777239 (contains!9656 (t!46749 (t!46749 acc!866)) (select (arr!44917 a!3861) from!3239)))))

(assert (= (and d!147523 res!915367) b!1371989))

(assert (= (and b!1371989 (not res!915366)) b!1371990))

(declare-fun m!1254957 () Bool)

(assert (=> d!147523 m!1254957))

(assert (=> d!147523 m!1254681))

(declare-fun m!1254959 () Bool)

(assert (=> d!147523 m!1254959))

(assert (=> b!1371990 m!1254681))

(declare-fun m!1254961 () Bool)

(assert (=> b!1371990 m!1254961))

(assert (=> b!1371952 d!147523))

(assert (=> b!1371896 d!147433))

(assert (=> b!1371895 d!147433))

(declare-fun d!147525 () Bool)

(declare-fun lt!602624 () Bool)

(assert (=> d!147525 (= lt!602624 (select (content!737 (t!46749 newAcc!98)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777240 () Bool)

(assert (=> d!147525 (= lt!602624 e!777240)))

(declare-fun res!915369 () Bool)

(assert (=> d!147525 (=> (not res!915369) (not e!777240))))

(assert (=> d!147525 (= res!915369 ((_ is Cons!32059) (t!46749 newAcc!98)))))

(assert (=> d!147525 (= (contains!9656 (t!46749 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000) lt!602624)))

(declare-fun b!1371991 () Bool)

(declare-fun e!777241 () Bool)

(assert (=> b!1371991 (= e!777240 e!777241)))

(declare-fun res!915368 () Bool)

(assert (=> b!1371991 (=> res!915368 e!777241)))

(assert (=> b!1371991 (= res!915368 (= (h!33268 (t!46749 newAcc!98)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371992 () Bool)

(assert (=> b!1371992 (= e!777241 (contains!9656 (t!46749 (t!46749 newAcc!98)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147525 res!915369) b!1371991))

(assert (= (and b!1371991 (not res!915368)) b!1371992))

(declare-fun m!1254963 () Bool)

(assert (=> d!147525 m!1254963))

(declare-fun m!1254965 () Bool)

(assert (=> d!147525 m!1254965))

(declare-fun m!1254967 () Bool)

(assert (=> b!1371992 m!1254967))

(assert (=> b!1371888 d!147525))

(declare-fun d!147527 () Bool)

(declare-fun lt!602625 () Bool)

(assert (=> d!147527 (= lt!602625 (select (content!737 (t!46749 acc!866)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777242 () Bool)

(assert (=> d!147527 (= lt!602625 e!777242)))

(declare-fun res!915371 () Bool)

(assert (=> d!147527 (=> (not res!915371) (not e!777242))))

(assert (=> d!147527 (= res!915371 ((_ is Cons!32059) (t!46749 acc!866)))))

(assert (=> d!147527 (= (contains!9656 (t!46749 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000) lt!602625)))

(declare-fun b!1371993 () Bool)

(declare-fun e!777243 () Bool)

(assert (=> b!1371993 (= e!777242 e!777243)))

(declare-fun res!915370 () Bool)

(assert (=> b!1371993 (=> res!915370 e!777243)))

(assert (=> b!1371993 (= res!915370 (= (h!33268 (t!46749 acc!866)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1371994 () Bool)

(assert (=> b!1371994 (= e!777243 (contains!9656 (t!46749 (t!46749 acc!866)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147527 res!915371) b!1371993))

(assert (= (and b!1371993 (not res!915370)) b!1371994))

(assert (=> d!147527 m!1254957))

(declare-fun m!1254969 () Bool)

(assert (=> d!147527 m!1254969))

(declare-fun m!1254971 () Bool)

(assert (=> b!1371994 m!1254971))

(assert (=> b!1371947 d!147527))

(declare-fun b!1371995 () Bool)

(declare-fun e!777246 () Bool)

(declare-fun call!65561 () Bool)

(assert (=> b!1371995 (= e!777246 call!65561)))

(declare-fun e!777247 () Bool)

(declare-fun b!1371996 () Bool)

(assert (=> b!1371996 (= e!777247 (contains!9656 (ite c!127749 (Cons!32059 (select (arr!44917 a!3861) from!3239) newAcc!98) newAcc!98) (select (arr!44917 a!3861) (bvadd from!3239 #b00000000000000000000000000000001))))))

(declare-fun d!147529 () Bool)

(declare-fun res!915372 () Bool)

(declare-fun e!777245 () Bool)

(assert (=> d!147529 (=> res!915372 e!777245)))

(assert (=> d!147529 (= res!915372 (bvsge (bvadd from!3239 #b00000000000000000000000000000001) (size!45469 a!3861)))))

(assert (=> d!147529 (= (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127749 (Cons!32059 (select (arr!44917 a!3861) from!3239) newAcc!98) newAcc!98)) e!777245)))

(declare-fun bm!65558 () Bool)

(declare-fun c!127754 () Bool)

(assert (=> bm!65558 (= call!65561 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!127754 (Cons!32059 (select (arr!44917 a!3861) (bvadd from!3239 #b00000000000000000000000000000001)) (ite c!127749 (Cons!32059 (select (arr!44917 a!3861) from!3239) newAcc!98) newAcc!98)) (ite c!127749 (Cons!32059 (select (arr!44917 a!3861) from!3239) newAcc!98) newAcc!98))))))

(declare-fun b!1371997 () Bool)

(declare-fun e!777244 () Bool)

(assert (=> b!1371997 (= e!777245 e!777244)))

(declare-fun res!915373 () Bool)

(assert (=> b!1371997 (=> (not res!915373) (not e!777244))))

(assert (=> b!1371997 (= res!915373 (not e!777247))))

(declare-fun res!915374 () Bool)

(assert (=> b!1371997 (=> (not res!915374) (not e!777247))))

(assert (=> b!1371997 (= res!915374 (validKeyInArray!0 (select (arr!44917 a!3861) (bvadd from!3239 #b00000000000000000000000000000001))))))

(declare-fun b!1371998 () Bool)

(assert (=> b!1371998 (= e!777244 e!777246)))

(assert (=> b!1371998 (= c!127754 (validKeyInArray!0 (select (arr!44917 a!3861) (bvadd from!3239 #b00000000000000000000000000000001))))))

(declare-fun b!1371999 () Bool)

(assert (=> b!1371999 (= e!777246 call!65561)))

(assert (= (and d!147529 (not res!915372)) b!1371997))

(assert (= (and b!1371997 res!915374) b!1371996))

(assert (= (and b!1371997 res!915373) b!1371998))

(assert (= (and b!1371998 c!127754) b!1371995))

(assert (= (and b!1371998 (not c!127754)) b!1371999))

(assert (= (or b!1371995 b!1371999) bm!65558))

(declare-fun m!1254973 () Bool)

(assert (=> b!1371996 m!1254973))

(assert (=> b!1371996 m!1254973))

(declare-fun m!1254975 () Bool)

(assert (=> b!1371996 m!1254975))

(assert (=> bm!65558 m!1254973))

(declare-fun m!1254977 () Bool)

(assert (=> bm!65558 m!1254977))

(assert (=> b!1371997 m!1254973))

(assert (=> b!1371997 m!1254973))

(declare-fun m!1254979 () Bool)

(assert (=> b!1371997 m!1254979))

(assert (=> b!1371998 m!1254973))

(assert (=> b!1371998 m!1254973))

(assert (=> b!1371998 m!1254979))

(assert (=> bm!65553 d!147529))

(declare-fun d!147531 () Bool)

(declare-fun c!127757 () Bool)

(assert (=> d!147531 (= c!127757 ((_ is Nil!32060) newAcc!98))))

(declare-fun e!777250 () (InoxSet (_ BitVec 64)))

(assert (=> d!147531 (= (content!737 newAcc!98) e!777250)))

(declare-fun b!1372004 () Bool)

(assert (=> b!1372004 (= e!777250 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!1372005 () Bool)

(assert (=> b!1372005 (= e!777250 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!33268 newAcc!98) true) (content!737 (t!46749 newAcc!98))))))

(assert (= (and d!147531 c!127757) b!1372004))

(assert (= (and d!147531 (not c!127757)) b!1372005))

(declare-fun m!1254981 () Bool)

(assert (=> b!1372005 m!1254981))

(assert (=> b!1372005 m!1254963))

(assert (=> d!147501 d!147531))

(declare-fun lt!602626 () Bool)

(declare-fun d!147533 () Bool)

(assert (=> d!147533 (= lt!602626 (select (content!737 newAcc!98) (select (arr!44917 a!3861) from!3239)))))

(declare-fun e!777251 () Bool)

(assert (=> d!147533 (= lt!602626 e!777251)))

(declare-fun res!915376 () Bool)

(assert (=> d!147533 (=> (not res!915376) (not e!777251))))

(assert (=> d!147533 (= res!915376 ((_ is Cons!32059) newAcc!98))))

(assert (=> d!147533 (= (contains!9656 newAcc!98 (select (arr!44917 a!3861) from!3239)) lt!602626)))

(declare-fun b!1372006 () Bool)

(declare-fun e!777252 () Bool)

(assert (=> b!1372006 (= e!777251 e!777252)))

(declare-fun res!915375 () Bool)

(assert (=> b!1372006 (=> res!915375 e!777252)))

(assert (=> b!1372006 (= res!915375 (= (h!33268 newAcc!98) (select (arr!44917 a!3861) from!3239)))))

(declare-fun b!1372007 () Bool)

(assert (=> b!1372007 (= e!777252 (contains!9656 (t!46749 newAcc!98) (select (arr!44917 a!3861) from!3239)))))

(assert (= (and d!147533 res!915376) b!1372006))

(assert (= (and b!1372006 (not res!915375)) b!1372007))

(assert (=> d!147533 m!1254809))

(assert (=> d!147533 m!1254681))

(declare-fun m!1254983 () Bool)

(assert (=> d!147533 m!1254983))

(assert (=> b!1372007 m!1254681))

(declare-fun m!1254985 () Bool)

(assert (=> b!1372007 m!1254985))

(assert (=> b!1371894 d!147533))

(declare-fun d!147535 () Bool)

(declare-fun res!915377 () Bool)

(declare-fun e!777253 () Bool)

(assert (=> d!147535 (=> res!915377 e!777253)))

(assert (=> d!147535 (= res!915377 ((_ is Nil!32060) (t!46749 acc!866)))))

(assert (=> d!147535 (= (noDuplicate!2571 (t!46749 acc!866)) e!777253)))

(declare-fun b!1372008 () Bool)

(declare-fun e!777254 () Bool)

(assert (=> b!1372008 (= e!777253 e!777254)))

(declare-fun res!915378 () Bool)

(assert (=> b!1372008 (=> (not res!915378) (not e!777254))))

(assert (=> b!1372008 (= res!915378 (not (contains!9656 (t!46749 (t!46749 acc!866)) (h!33268 (t!46749 acc!866)))))))

(declare-fun b!1372009 () Bool)

(assert (=> b!1372009 (= e!777254 (noDuplicate!2571 (t!46749 (t!46749 acc!866))))))

(assert (= (and d!147535 (not res!915377)) b!1372008))

(assert (= (and b!1372008 res!915378) b!1372009))

(declare-fun m!1254987 () Bool)

(assert (=> b!1372008 m!1254987))

(declare-fun m!1254989 () Bool)

(assert (=> b!1372009 m!1254989))

(assert (=> b!1371938 d!147535))

(declare-fun d!147537 () Bool)

(declare-fun res!915379 () Bool)

(declare-fun e!777255 () Bool)

(assert (=> d!147537 (=> res!915379 e!777255)))

(assert (=> d!147537 (= res!915379 ((_ is Nil!32060) lt!602546))))

(assert (=> d!147537 (= (noDuplicate!2571 lt!602546) e!777255)))

(declare-fun b!1372010 () Bool)

(declare-fun e!777256 () Bool)

(assert (=> b!1372010 (= e!777255 e!777256)))

(declare-fun res!915380 () Bool)

(assert (=> b!1372010 (=> (not res!915380) (not e!777256))))

(assert (=> b!1372010 (= res!915380 (not (contains!9656 (t!46749 lt!602546) (h!33268 lt!602546))))))

(declare-fun b!1372011 () Bool)

(assert (=> b!1372011 (= e!777256 (noDuplicate!2571 (t!46749 lt!602546)))))

(assert (= (and d!147537 (not res!915379)) b!1372010))

(assert (= (and b!1372010 res!915380) b!1372011))

(declare-fun m!1254991 () Bool)

(assert (=> b!1372010 m!1254991))

(declare-fun m!1254993 () Bool)

(assert (=> b!1372011 m!1254993))

(assert (=> b!1371898 d!147537))

(declare-fun d!147539 () Bool)

(declare-fun lt!602627 () Bool)

(assert (=> d!147539 (= lt!602627 (select (content!737 (t!46749 acc!866)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777257 () Bool)

(assert (=> d!147539 (= lt!602627 e!777257)))

(declare-fun res!915382 () Bool)

(assert (=> d!147539 (=> (not res!915382) (not e!777257))))

(assert (=> d!147539 (= res!915382 ((_ is Cons!32059) (t!46749 acc!866)))))

(assert (=> d!147539 (= (contains!9656 (t!46749 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000) lt!602627)))

(declare-fun b!1372012 () Bool)

(declare-fun e!777258 () Bool)

(assert (=> b!1372012 (= e!777257 e!777258)))

(declare-fun res!915381 () Bool)

(assert (=> b!1372012 (=> res!915381 e!777258)))

(assert (=> b!1372012 (= res!915381 (= (h!33268 (t!46749 acc!866)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372013 () Bool)

(assert (=> b!1372013 (= e!777258 (contains!9656 (t!46749 (t!46749 acc!866)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147539 res!915382) b!1372012))

(assert (= (and b!1372012 (not res!915381)) b!1372013))

(assert (=> d!147539 m!1254957))

(declare-fun m!1254995 () Bool)

(assert (=> d!147539 m!1254995))

(declare-fun m!1254997 () Bool)

(assert (=> b!1372013 m!1254997))

(assert (=> b!1371924 d!147539))

(declare-fun d!147541 () Bool)

(declare-fun lt!602628 () Bool)

(assert (=> d!147541 (= lt!602628 (select (content!737 (t!46749 acc!866)) (h!33268 acc!866)))))

(declare-fun e!777259 () Bool)

(assert (=> d!147541 (= lt!602628 e!777259)))

(declare-fun res!915384 () Bool)

(assert (=> d!147541 (=> (not res!915384) (not e!777259))))

(assert (=> d!147541 (= res!915384 ((_ is Cons!32059) (t!46749 acc!866)))))

(assert (=> d!147541 (= (contains!9656 (t!46749 acc!866) (h!33268 acc!866)) lt!602628)))

(declare-fun b!1372014 () Bool)

(declare-fun e!777260 () Bool)

(assert (=> b!1372014 (= e!777259 e!777260)))

(declare-fun res!915383 () Bool)

(assert (=> b!1372014 (=> res!915383 e!777260)))

(assert (=> b!1372014 (= res!915383 (= (h!33268 (t!46749 acc!866)) (h!33268 acc!866)))))

(declare-fun b!1372015 () Bool)

(assert (=> b!1372015 (= e!777260 (contains!9656 (t!46749 (t!46749 acc!866)) (h!33268 acc!866)))))

(assert (= (and d!147541 res!915384) b!1372014))

(assert (= (and b!1372014 (not res!915383)) b!1372015))

(assert (=> d!147541 m!1254957))

(declare-fun m!1254999 () Bool)

(assert (=> d!147541 m!1254999))

(declare-fun m!1255001 () Bool)

(assert (=> b!1372015 m!1255001))

(assert (=> b!1371937 d!147541))

(assert (=> b!1371847 d!147513))

(declare-fun d!147543 () Bool)

(declare-fun c!127758 () Bool)

(assert (=> d!147543 (= c!127758 ((_ is Nil!32060) acc!866))))

(declare-fun e!777261 () (InoxSet (_ BitVec 64)))

(assert (=> d!147543 (= (content!737 acc!866) e!777261)))

(declare-fun b!1372016 () Bool)

(assert (=> b!1372016 (= e!777261 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!1372017 () Bool)

(assert (=> b!1372017 (= e!777261 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!33268 acc!866) true) (content!737 (t!46749 acc!866))))))

(assert (= (and d!147543 c!127758) b!1372016))

(assert (= (and d!147543 (not c!127758)) b!1372017))

(declare-fun m!1255003 () Bool)

(assert (=> b!1372017 m!1255003))

(assert (=> b!1372017 m!1254957))

(assert (=> d!147513 d!147543))

(declare-fun d!147545 () Bool)

(declare-fun res!915385 () Bool)

(declare-fun e!777262 () Bool)

(assert (=> d!147545 (=> res!915385 e!777262)))

(assert (=> d!147545 (= res!915385 ((_ is Nil!32060) lt!602547))))

(assert (=> d!147545 (= (noDuplicate!2571 lt!602547) e!777262)))

(declare-fun b!1372018 () Bool)

(declare-fun e!777263 () Bool)

(assert (=> b!1372018 (= e!777262 e!777263)))

(declare-fun res!915386 () Bool)

(assert (=> b!1372018 (=> (not res!915386) (not e!777263))))

(assert (=> b!1372018 (= res!915386 (not (contains!9656 (t!46749 lt!602547) (h!33268 lt!602547))))))

(declare-fun b!1372019 () Bool)

(assert (=> b!1372019 (= e!777263 (noDuplicate!2571 (t!46749 lt!602547)))))

(assert (= (and d!147545 (not res!915385)) b!1372018))

(assert (= (and b!1372018 res!915386) b!1372019))

(declare-fun m!1255005 () Bool)

(assert (=> b!1372018 m!1255005))

(declare-fun m!1255007 () Bool)

(assert (=> b!1372019 m!1255007))

(assert (=> d!147467 d!147545))

(declare-fun d!147547 () Bool)

(assert (=> d!147547 (noDuplicate!2571 lt!602547)))

(assert (=> d!147547 true))

(declare-fun _$12!471 () Unit!45162)

(assert (=> d!147547 (= (choose!2026 lt!602547 lt!602546) _$12!471)))

(declare-fun bs!39296 () Bool)

(assert (= bs!39296 d!147547))

(assert (=> bs!39296 m!1254827))

(assert (=> d!147467 d!147547))

(declare-fun b!1372020 () Bool)

(declare-fun e!777264 () Bool)

(declare-fun e!777266 () Bool)

(assert (=> b!1372020 (= e!777264 e!777266)))

(declare-fun res!915387 () Bool)

(assert (=> b!1372020 (=> (not res!915387) (not e!777266))))

(assert (=> b!1372020 (= res!915387 ((_ is Cons!32059) lt!602546))))

(declare-fun b!1372022 () Bool)

(declare-fun e!777267 () Bool)

(assert (=> b!1372022 (= e!777267 (subseq!1094 (t!46749 lt!602547) (t!46749 lt!602546)))))

(declare-fun b!1372023 () Bool)

(declare-fun e!777265 () Bool)

(assert (=> b!1372023 (= e!777265 (subseq!1094 lt!602547 (t!46749 lt!602546)))))

(declare-fun d!147549 () Bool)

(declare-fun res!915388 () Bool)

(assert (=> d!147549 (=> res!915388 e!777264)))

(assert (=> d!147549 (= res!915388 ((_ is Nil!32060) lt!602547))))

(assert (=> d!147549 (= (subseq!1094 lt!602547 lt!602546) e!777264)))

(declare-fun b!1372021 () Bool)

(assert (=> b!1372021 (= e!777266 e!777265)))

(declare-fun res!915390 () Bool)

(assert (=> b!1372021 (=> res!915390 e!777265)))

(assert (=> b!1372021 (= res!915390 e!777267)))

(declare-fun res!915389 () Bool)

(assert (=> b!1372021 (=> (not res!915389) (not e!777267))))

(assert (=> b!1372021 (= res!915389 (= (h!33268 lt!602547) (h!33268 lt!602546)))))

(assert (= (and d!147549 (not res!915388)) b!1372020))

(assert (= (and b!1372020 res!915387) b!1372021))

(assert (= (and b!1372021 res!915389) b!1372022))

(assert (= (and b!1372021 (not res!915390)) b!1372023))

(declare-fun m!1255009 () Bool)

(assert (=> b!1372022 m!1255009))

(declare-fun m!1255011 () Bool)

(assert (=> b!1372023 m!1255011))

(assert (=> d!147467 d!147549))

(declare-fun d!147551 () Bool)

(declare-fun res!915391 () Bool)

(declare-fun e!777268 () Bool)

(assert (=> d!147551 (=> res!915391 e!777268)))

(assert (=> d!147551 (= res!915391 ((_ is Nil!32060) newAcc!98))))

(assert (=> d!147551 (= (noDuplicate!2571 newAcc!98) e!777268)))

(declare-fun b!1372024 () Bool)

(declare-fun e!777269 () Bool)

(assert (=> b!1372024 (= e!777268 e!777269)))

(declare-fun res!915392 () Bool)

(assert (=> b!1372024 (=> (not res!915392) (not e!777269))))

(assert (=> b!1372024 (= res!915392 (not (contains!9656 (t!46749 newAcc!98) (h!33268 newAcc!98))))))

(declare-fun b!1372025 () Bool)

(assert (=> b!1372025 (= e!777269 (noDuplicate!2571 (t!46749 newAcc!98)))))

(assert (= (and d!147551 (not res!915391)) b!1372024))

(assert (= (and b!1372024 res!915392) b!1372025))

(declare-fun m!1255013 () Bool)

(assert (=> b!1372024 m!1255013))

(declare-fun m!1255015 () Bool)

(assert (=> b!1372025 m!1255015))

(assert (=> d!147449 d!147551))

(declare-fun d!147553 () Bool)

(assert (=> d!147553 (noDuplicate!2571 newAcc!98)))

(assert (=> d!147553 true))

(declare-fun _$12!472 () Unit!45162)

(assert (=> d!147553 (= (choose!2026 newAcc!98 acc!866) _$12!472)))

(declare-fun bs!39297 () Bool)

(assert (= bs!39297 d!147553))

(assert (=> bs!39297 m!1254793))

(assert (=> d!147449 d!147553))

(assert (=> d!147449 d!147435))

(declare-fun b!1372026 () Bool)

(declare-fun e!777272 () Bool)

(declare-fun call!65562 () Bool)

(assert (=> b!1372026 (= e!777272 call!65562)))

(declare-fun e!777273 () Bool)

(declare-fun b!1372027 () Bool)

(assert (=> b!1372027 (= e!777273 (contains!9656 (ite c!127743 (Cons!32059 (select (arr!44917 a!3861) from!3239) acc!866) acc!866) (select (arr!44917 a!3861) (bvadd from!3239 #b00000000000000000000000000000001))))))

(declare-fun d!147555 () Bool)

(declare-fun res!915393 () Bool)

(declare-fun e!777271 () Bool)

(assert (=> d!147555 (=> res!915393 e!777271)))

(assert (=> d!147555 (= res!915393 (bvsge (bvadd from!3239 #b00000000000000000000000000000001) (size!45469 a!3861)))))

(assert (=> d!147555 (= (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127743 (Cons!32059 (select (arr!44917 a!3861) from!3239) acc!866) acc!866)) e!777271)))

(declare-fun bm!65559 () Bool)

(declare-fun c!127759 () Bool)

(assert (=> bm!65559 (= call!65562 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!127759 (Cons!32059 (select (arr!44917 a!3861) (bvadd from!3239 #b00000000000000000000000000000001)) (ite c!127743 (Cons!32059 (select (arr!44917 a!3861) from!3239) acc!866) acc!866)) (ite c!127743 (Cons!32059 (select (arr!44917 a!3861) from!3239) acc!866) acc!866))))))

(declare-fun b!1372028 () Bool)

(declare-fun e!777270 () Bool)

(assert (=> b!1372028 (= e!777271 e!777270)))

(declare-fun res!915394 () Bool)

(assert (=> b!1372028 (=> (not res!915394) (not e!777270))))

(assert (=> b!1372028 (= res!915394 (not e!777273))))

(declare-fun res!915395 () Bool)

(assert (=> b!1372028 (=> (not res!915395) (not e!777273))))

(assert (=> b!1372028 (= res!915395 (validKeyInArray!0 (select (arr!44917 a!3861) (bvadd from!3239 #b00000000000000000000000000000001))))))

(declare-fun b!1372029 () Bool)

(assert (=> b!1372029 (= e!777270 e!777272)))

(assert (=> b!1372029 (= c!127759 (validKeyInArray!0 (select (arr!44917 a!3861) (bvadd from!3239 #b00000000000000000000000000000001))))))

(declare-fun b!1372030 () Bool)

(assert (=> b!1372030 (= e!777272 call!65562)))

(assert (= (and d!147555 (not res!915393)) b!1372028))

(assert (= (and b!1372028 res!915395) b!1372027))

(assert (= (and b!1372028 res!915394) b!1372029))

(assert (= (and b!1372029 c!127759) b!1372026))

(assert (= (and b!1372029 (not c!127759)) b!1372030))

(assert (= (or b!1372026 b!1372030) bm!65559))

(assert (=> b!1372027 m!1254973))

(assert (=> b!1372027 m!1254973))

(declare-fun m!1255017 () Bool)

(assert (=> b!1372027 m!1255017))

(assert (=> bm!65559 m!1254973))

(declare-fun m!1255019 () Bool)

(assert (=> bm!65559 m!1255019))

(assert (=> b!1372028 m!1254973))

(assert (=> b!1372028 m!1254973))

(assert (=> b!1372028 m!1254979))

(assert (=> b!1372029 m!1254973))

(assert (=> b!1372029 m!1254973))

(assert (=> b!1372029 m!1254979))

(assert (=> bm!65547 d!147555))

(declare-fun b!1372031 () Bool)

(declare-fun e!777274 () Bool)

(declare-fun e!777276 () Bool)

(assert (=> b!1372031 (= e!777274 e!777276)))

(declare-fun res!915396 () Bool)

(assert (=> b!1372031 (=> (not res!915396) (not e!777276))))

(assert (=> b!1372031 (= res!915396 ((_ is Cons!32059) (t!46749 acc!866)))))

(declare-fun b!1372033 () Bool)

(declare-fun e!777277 () Bool)

(assert (=> b!1372033 (= e!777277 (subseq!1094 (t!46749 (t!46749 newAcc!98)) (t!46749 (t!46749 acc!866))))))

(declare-fun b!1372034 () Bool)

(declare-fun e!777275 () Bool)

(assert (=> b!1372034 (= e!777275 (subseq!1094 (t!46749 newAcc!98) (t!46749 (t!46749 acc!866))))))

(declare-fun d!147557 () Bool)

(declare-fun res!915397 () Bool)

(assert (=> d!147557 (=> res!915397 e!777274)))

(assert (=> d!147557 (= res!915397 ((_ is Nil!32060) (t!46749 newAcc!98)))))

(assert (=> d!147557 (= (subseq!1094 (t!46749 newAcc!98) (t!46749 acc!866)) e!777274)))

(declare-fun b!1372032 () Bool)

(assert (=> b!1372032 (= e!777276 e!777275)))

(declare-fun res!915399 () Bool)

(assert (=> b!1372032 (=> res!915399 e!777275)))

(assert (=> b!1372032 (= res!915399 e!777277)))

(declare-fun res!915398 () Bool)

(assert (=> b!1372032 (=> (not res!915398) (not e!777277))))

(assert (=> b!1372032 (= res!915398 (= (h!33268 (t!46749 newAcc!98)) (h!33268 (t!46749 acc!866))))))

(assert (= (and d!147557 (not res!915397)) b!1372031))

(assert (= (and b!1372031 res!915396) b!1372032))

(assert (= (and b!1372032 res!915398) b!1372033))

(assert (= (and b!1372032 (not res!915399)) b!1372034))

(declare-fun m!1255021 () Bool)

(assert (=> b!1372033 m!1255021))

(declare-fun m!1255023 () Bool)

(assert (=> b!1372034 m!1255023))

(assert (=> b!1371816 d!147557))

(assert (=> d!147475 d!147469))

(declare-fun d!147559 () Bool)

(assert (=> d!147559 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602547)))

(assert (=> d!147559 true))

(declare-fun _$70!110 () Unit!45162)

(assert (=> d!147559 (= (choose!80 a!3861 lt!602546 lt!602547 (bvadd #b00000000000000000000000000000001 from!3239)) _$70!110)))

(declare-fun bs!39298 () Bool)

(assert (= bs!39298 d!147559))

(assert (=> bs!39298 m!1254689))

(assert (=> d!147475 d!147559))

(assert (=> b!1371850 d!147433))

(declare-fun b!1372035 () Bool)

(declare-fun e!777278 () Bool)

(declare-fun e!777280 () Bool)

(assert (=> b!1372035 (= e!777278 e!777280)))

(declare-fun res!915400 () Bool)

(assert (=> b!1372035 (=> (not res!915400) (not e!777280))))

(assert (=> b!1372035 (= res!915400 ((_ is Cons!32059) (t!46749 acc!866)))))

(declare-fun b!1372037 () Bool)

(declare-fun e!777281 () Bool)

(assert (=> b!1372037 (= e!777281 (subseq!1094 (t!46749 newAcc!98) (t!46749 (t!46749 acc!866))))))

(declare-fun b!1372038 () Bool)

(declare-fun e!777279 () Bool)

(assert (=> b!1372038 (= e!777279 (subseq!1094 newAcc!98 (t!46749 (t!46749 acc!866))))))

(declare-fun d!147561 () Bool)

(declare-fun res!915401 () Bool)

(assert (=> d!147561 (=> res!915401 e!777278)))

(assert (=> d!147561 (= res!915401 ((_ is Nil!32060) newAcc!98))))

(assert (=> d!147561 (= (subseq!1094 newAcc!98 (t!46749 acc!866)) e!777278)))

(declare-fun b!1372036 () Bool)

(assert (=> b!1372036 (= e!777280 e!777279)))

(declare-fun res!915403 () Bool)

(assert (=> b!1372036 (=> res!915403 e!777279)))

(assert (=> b!1372036 (= res!915403 e!777281)))

(declare-fun res!915402 () Bool)

(assert (=> b!1372036 (=> (not res!915402) (not e!777281))))

(assert (=> b!1372036 (= res!915402 (= (h!33268 newAcc!98) (h!33268 (t!46749 acc!866))))))

(assert (= (and d!147561 (not res!915401)) b!1372035))

(assert (= (and b!1372035 res!915400) b!1372036))

(assert (= (and b!1372036 res!915402) b!1372037))

(assert (= (and b!1372036 (not res!915403)) b!1372038))

(assert (=> b!1372037 m!1255023))

(declare-fun m!1255025 () Bool)

(assert (=> b!1372038 m!1255025))

(assert (=> b!1371817 d!147561))

(assert (=> d!147503 d!147543))

(assert (=> b!1371851 d!147433))

(assert (=> b!1371871 d!147491))

(declare-fun d!147563 () Bool)

(assert (=> d!147563 (= (validKeyInArray!0 (select (arr!44917 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))) (and (not (= (select (arr!44917 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44917 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1371904 d!147563))

(assert (=> b!1371903 d!147563))

(declare-fun b!1372039 () Bool)

(declare-fun e!777284 () Bool)

(declare-fun call!65563 () Bool)

(assert (=> b!1372039 (= e!777284 call!65563)))

(declare-fun b!1372040 () Bool)

(declare-fun e!777285 () Bool)

(assert (=> b!1372040 (= e!777285 (contains!9656 (ite c!127750 (Cons!32059 (select (arr!44917 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) lt!602547) lt!602547) (select (arr!44917 a!3861) (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001))))))

(declare-fun d!147565 () Bool)

(declare-fun res!915404 () Bool)

(declare-fun e!777283 () Bool)

(assert (=> d!147565 (=> res!915404 e!777283)))

(assert (=> d!147565 (= res!915404 (bvsge (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (size!45469 a!3861)))))

(assert (=> d!147565 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127750 (Cons!32059 (select (arr!44917 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) lt!602547) lt!602547)) e!777283)))

(declare-fun c!127760 () Bool)

(declare-fun bm!65560 () Bool)

(assert (=> bm!65560 (= call!65563 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!127760 (Cons!32059 (select (arr!44917 a!3861) (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001)) (ite c!127750 (Cons!32059 (select (arr!44917 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) lt!602547) lt!602547)) (ite c!127750 (Cons!32059 (select (arr!44917 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) lt!602547) lt!602547))))))

(declare-fun b!1372041 () Bool)

(declare-fun e!777282 () Bool)

(assert (=> b!1372041 (= e!777283 e!777282)))

(declare-fun res!915405 () Bool)

(assert (=> b!1372041 (=> (not res!915405) (not e!777282))))

(assert (=> b!1372041 (= res!915405 (not e!777285))))

(declare-fun res!915406 () Bool)

(assert (=> b!1372041 (=> (not res!915406) (not e!777285))))

(assert (=> b!1372041 (= res!915406 (validKeyInArray!0 (select (arr!44917 a!3861) (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001))))))

(declare-fun b!1372042 () Bool)

(assert (=> b!1372042 (= e!777282 e!777284)))

(assert (=> b!1372042 (= c!127760 (validKeyInArray!0 (select (arr!44917 a!3861) (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001))))))

(declare-fun b!1372043 () Bool)

(assert (=> b!1372043 (= e!777284 call!65563)))

(assert (= (and d!147565 (not res!915404)) b!1372041))

(assert (= (and b!1372041 res!915406) b!1372040))

(assert (= (and b!1372041 res!915405) b!1372042))

(assert (= (and b!1372042 c!127760) b!1372039))

(assert (= (and b!1372042 (not c!127760)) b!1372043))

(assert (= (or b!1372039 b!1372043) bm!65560))

(declare-fun m!1255027 () Bool)

(assert (=> b!1372040 m!1255027))

(assert (=> b!1372040 m!1255027))

(declare-fun m!1255029 () Bool)

(assert (=> b!1372040 m!1255029))

(assert (=> bm!65560 m!1255027))

(declare-fun m!1255031 () Bool)

(assert (=> bm!65560 m!1255031))

(assert (=> b!1372041 m!1255027))

(assert (=> b!1372041 m!1255027))

(declare-fun m!1255033 () Bool)

(assert (=> b!1372041 m!1255033))

(assert (=> b!1372042 m!1255027))

(assert (=> b!1372042 m!1255027))

(assert (=> b!1372042 m!1255033))

(assert (=> bm!65554 d!147565))

(declare-fun d!147567 () Bool)

(declare-fun lt!602629 () Bool)

(assert (=> d!147567 (= lt!602629 (select (content!737 (t!46749 newAcc!98)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!777286 () Bool)

(assert (=> d!147567 (= lt!602629 e!777286)))

(declare-fun res!915408 () Bool)

(assert (=> d!147567 (=> (not res!915408) (not e!777286))))

(assert (=> d!147567 (= res!915408 ((_ is Cons!32059) (t!46749 newAcc!98)))))

(assert (=> d!147567 (= (contains!9656 (t!46749 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000) lt!602629)))

(declare-fun b!1372044 () Bool)

(declare-fun e!777287 () Bool)

(assert (=> b!1372044 (= e!777286 e!777287)))

(declare-fun res!915407 () Bool)

(assert (=> b!1372044 (=> res!915407 e!777287)))

(assert (=> b!1372044 (= res!915407 (= (h!33268 (t!46749 newAcc!98)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1372045 () Bool)

(assert (=> b!1372045 (= e!777287 (contains!9656 (t!46749 (t!46749 newAcc!98)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147567 res!915408) b!1372044))

(assert (= (and b!1372044 (not res!915407)) b!1372045))

(assert (=> d!147567 m!1254963))

(declare-fun m!1255035 () Bool)

(assert (=> d!147567 m!1255035))

(declare-fun m!1255037 () Bool)

(assert (=> b!1372045 m!1255037))

(assert (=> b!1371945 d!147567))

(declare-fun lt!602630 () Bool)

(declare-fun d!147569 () Bool)

(assert (=> d!147569 (= lt!602630 (select (content!737 lt!602547) (select (arr!44917 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun e!777288 () Bool)

(assert (=> d!147569 (= lt!602630 e!777288)))

(declare-fun res!915410 () Bool)

(assert (=> d!147569 (=> (not res!915410) (not e!777288))))

(assert (=> d!147569 (= res!915410 ((_ is Cons!32059) lt!602547))))

(assert (=> d!147569 (= (contains!9656 lt!602547 (select (arr!44917 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))) lt!602630)))

(declare-fun b!1372046 () Bool)

(declare-fun e!777289 () Bool)

(assert (=> b!1372046 (= e!777288 e!777289)))

(declare-fun res!915409 () Bool)

(assert (=> b!1372046 (=> res!915409 e!777289)))

(assert (=> b!1372046 (= res!915409 (= (h!33268 lt!602547) (select (arr!44917 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1372047 () Bool)

(assert (=> b!1372047 (= e!777289 (contains!9656 (t!46749 lt!602547) (select (arr!44917 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(assert (= (and d!147569 res!915410) b!1372046))

(assert (= (and b!1372046 (not res!915409)) b!1372047))

(declare-fun m!1255039 () Bool)

(assert (=> d!147569 m!1255039))

(assert (=> d!147569 m!1254847))

(declare-fun m!1255041 () Bool)

(assert (=> d!147569 m!1255041))

(assert (=> b!1372047 m!1254847))

(declare-fun m!1255043 () Bool)

(assert (=> b!1372047 m!1255043))

(assert (=> b!1371902 d!147569))

(assert (=> d!147489 d!147543))

(assert (=> d!147455 d!147531))

(check-sat (not b!1372041) (not b!1372034) (not d!147527) (not d!147567) (not b!1372008) (not b!1372022) (not d!147533) (not b!1371996) (not b!1371994) (not b!1372040) (not d!147539) (not b!1372027) (not d!147547) (not b!1372024) (not b!1372005) (not b!1372010) (not b!1371998) (not b!1372015) (not b!1372042) (not b!1372037) (not b!1371990) (not d!147541) (not d!147523) (not b!1372013) (not b!1372038) (not b!1372045) (not bm!65559) (not b!1372009) (not d!147559) (not d!147553) (not b!1372047) (not b!1371992) (not b!1372017) (not b!1372033) (not d!147525) (not b!1372025) (not b!1372018) (not b!1372023) (not bm!65560) (not b!1372019) (not b!1372011) (not bm!65558) (not b!1372007) (not b!1372028) (not b!1372029) (not b!1371997) (not d!147569))
(check-sat)
