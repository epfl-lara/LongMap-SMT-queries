; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115558 () Bool)

(assert start!115558)

(declare-fun b!1366911 () Bool)

(declare-fun res!910462 () Bool)

(declare-fun e!774694 () Bool)

(assert (=> b!1366911 (=> (not res!910462) (not e!774694))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92834 0))(
  ( (array!92835 (arr!44844 (Array (_ BitVec 32) (_ BitVec 64))) (size!45394 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92834)

(assert (=> b!1366911 (= res!910462 (bvslt from!3239 (size!45394 a!3861)))))

(declare-fun b!1366912 () Bool)

(declare-fun res!910466 () Bool)

(declare-fun e!774692 () Bool)

(assert (=> b!1366912 (=> (not res!910466) (not e!774692))))

(declare-datatypes ((List!31912 0))(
  ( (Nil!31909) (Cons!31908 (h!33117 (_ BitVec 64)) (t!46606 List!31912)) )
))
(declare-fun acc!866 () List!31912)

(declare-fun noDuplicate!2451 (List!31912) Bool)

(assert (=> b!1366912 (= res!910466 (noDuplicate!2451 acc!866))))

(declare-fun b!1366913 () Bool)

(declare-fun res!910469 () Bool)

(assert (=> b!1366913 (=> (not res!910469) (not e!774692))))

(declare-fun newAcc!98 () List!31912)

(declare-fun contains!9594 (List!31912 (_ BitVec 64)) Bool)

(assert (=> b!1366913 (= res!910469 (not (contains!9594 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366914 () Bool)

(declare-fun res!910470 () Bool)

(assert (=> b!1366914 (=> (not res!910470) (not e!774692))))

(assert (=> b!1366914 (= res!910470 (not (contains!9594 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366915 () Bool)

(assert (=> b!1366915 (= e!774694 (not (noDuplicate!2451 newAcc!98)))))

(declare-datatypes ((Unit!45125 0))(
  ( (Unit!45126) )
))
(declare-fun lt!601737 () Unit!45125)

(declare-fun lt!601738 () List!31912)

(declare-fun lt!601736 () List!31912)

(declare-fun noDuplicateSubseq!183 (List!31912 List!31912) Unit!45125)

(assert (=> b!1366915 (= lt!601737 (noDuplicateSubseq!183 lt!601738 lt!601736))))

(declare-fun arrayNoDuplicates!0 (array!92834 (_ BitVec 32) List!31912) Bool)

(assert (=> b!1366915 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601738)))

(declare-fun lt!601734 () Unit!45125)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92834 List!31912 List!31912 (_ BitVec 32)) Unit!45125)

(assert (=> b!1366915 (= lt!601734 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601736 lt!601738 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> b!1366915 (= lt!601738 (Cons!31908 (select (arr!44844 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366915 (= lt!601736 (Cons!31908 (select (arr!44844 a!3861) from!3239) acc!866))))

(declare-fun b!1366916 () Bool)

(declare-fun res!910461 () Bool)

(assert (=> b!1366916 (=> (not res!910461) (not e!774692))))

(assert (=> b!1366916 (= res!910461 (not (contains!9594 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!910467 () Bool)

(assert (=> start!115558 (=> (not res!910467) (not e!774692))))

(assert (=> start!115558 (= res!910467 (and (bvslt (size!45394 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45394 a!3861))))))

(assert (=> start!115558 e!774692))

(declare-fun array_inv!33872 (array!92834) Bool)

(assert (=> start!115558 (array_inv!33872 a!3861)))

(assert (=> start!115558 true))

(declare-fun b!1366917 () Bool)

(assert (=> b!1366917 (= e!774692 e!774694)))

(declare-fun res!910465 () Bool)

(assert (=> b!1366917 (=> (not res!910465) (not e!774694))))

(assert (=> b!1366917 (= res!910465 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601735 () Unit!45125)

(assert (=> b!1366917 (= lt!601735 (noDuplicateSubseq!183 newAcc!98 acc!866))))

(declare-fun b!1366918 () Bool)

(declare-fun res!910463 () Bool)

(assert (=> b!1366918 (=> (not res!910463) (not e!774694))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366918 (= res!910463 (validKeyInArray!0 (select (arr!44844 a!3861) from!3239)))))

(declare-fun b!1366919 () Bool)

(declare-fun res!910468 () Bool)

(assert (=> b!1366919 (=> (not res!910468) (not e!774692))))

(assert (=> b!1366919 (= res!910468 (not (contains!9594 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366920 () Bool)

(declare-fun res!910471 () Bool)

(assert (=> b!1366920 (=> (not res!910471) (not e!774694))))

(assert (=> b!1366920 (= res!910471 (not (contains!9594 acc!866 (select (arr!44844 a!3861) from!3239))))))

(declare-fun b!1366921 () Bool)

(declare-fun res!910464 () Bool)

(assert (=> b!1366921 (=> (not res!910464) (not e!774692))))

(declare-fun subseq!996 (List!31912 List!31912) Bool)

(assert (=> b!1366921 (= res!910464 (subseq!996 newAcc!98 acc!866))))

(assert (= (and start!115558 res!910467) b!1366912))

(assert (= (and b!1366912 res!910466) b!1366919))

(assert (= (and b!1366919 res!910468) b!1366914))

(assert (= (and b!1366914 res!910470) b!1366916))

(assert (= (and b!1366916 res!910461) b!1366913))

(assert (= (and b!1366913 res!910469) b!1366921))

(assert (= (and b!1366921 res!910464) b!1366917))

(assert (= (and b!1366917 res!910465) b!1366911))

(assert (= (and b!1366911 res!910462) b!1366918))

(assert (= (and b!1366918 res!910463) b!1366920))

(assert (= (and b!1366920 res!910471) b!1366915))

(declare-fun m!1251177 () Bool)

(assert (=> b!1366912 m!1251177))

(declare-fun m!1251179 () Bool)

(assert (=> b!1366915 m!1251179))

(declare-fun m!1251181 () Bool)

(assert (=> b!1366915 m!1251181))

(declare-fun m!1251183 () Bool)

(assert (=> b!1366915 m!1251183))

(declare-fun m!1251185 () Bool)

(assert (=> b!1366915 m!1251185))

(declare-fun m!1251187 () Bool)

(assert (=> b!1366915 m!1251187))

(declare-fun m!1251189 () Bool)

(assert (=> b!1366919 m!1251189))

(declare-fun m!1251191 () Bool)

(assert (=> b!1366913 m!1251191))

(assert (=> b!1366920 m!1251187))

(assert (=> b!1366920 m!1251187))

(declare-fun m!1251193 () Bool)

(assert (=> b!1366920 m!1251193))

(declare-fun m!1251195 () Bool)

(assert (=> b!1366914 m!1251195))

(declare-fun m!1251197 () Bool)

(assert (=> b!1366921 m!1251197))

(declare-fun m!1251199 () Bool)

(assert (=> b!1366916 m!1251199))

(declare-fun m!1251201 () Bool)

(assert (=> start!115558 m!1251201))

(declare-fun m!1251203 () Bool)

(assert (=> b!1366917 m!1251203))

(declare-fun m!1251205 () Bool)

(assert (=> b!1366917 m!1251205))

(assert (=> b!1366918 m!1251187))

(assert (=> b!1366918 m!1251187))

(declare-fun m!1251207 () Bool)

(assert (=> b!1366918 m!1251207))

(check-sat (not b!1366915) (not b!1366918) (not b!1366921) (not b!1366916) (not b!1366920) (not b!1366919) (not b!1366912) (not b!1366914) (not start!115558) (not b!1366917) (not b!1366913))
(check-sat)
(get-model)

(declare-fun d!146721 () Bool)

(declare-fun lt!601756 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!715 (List!31912) (InoxSet (_ BitVec 64)))

(assert (=> d!146721 (= lt!601756 (select (content!715 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774708 () Bool)

(assert (=> d!146721 (= lt!601756 e!774708)))

(declare-fun res!910509 () Bool)

(assert (=> d!146721 (=> (not res!910509) (not e!774708))))

(get-info :version)

(assert (=> d!146721 (= res!910509 ((_ is Cons!31908) acc!866))))

(assert (=> d!146721 (= (contains!9594 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601756)))

(declare-fun b!1366959 () Bool)

(declare-fun e!774709 () Bool)

(assert (=> b!1366959 (= e!774708 e!774709)))

(declare-fun res!910510 () Bool)

(assert (=> b!1366959 (=> res!910510 e!774709)))

(assert (=> b!1366959 (= res!910510 (= (h!33117 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1366960 () Bool)

(assert (=> b!1366960 (= e!774709 (contains!9594 (t!46606 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146721 res!910509) b!1366959))

(assert (= (and b!1366959 (not res!910510)) b!1366960))

(declare-fun m!1251241 () Bool)

(assert (=> d!146721 m!1251241))

(declare-fun m!1251243 () Bool)

(assert (=> d!146721 m!1251243))

(declare-fun m!1251245 () Bool)

(assert (=> b!1366960 m!1251245))

(assert (=> b!1366919 d!146721))

(declare-fun d!146723 () Bool)

(assert (=> d!146723 (= (validKeyInArray!0 (select (arr!44844 a!3861) from!3239)) (and (not (= (select (arr!44844 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44844 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1366918 d!146723))

(declare-fun d!146725 () Bool)

(declare-fun res!910550 () Bool)

(declare-fun e!774751 () Bool)

(assert (=> d!146725 (=> res!910550 e!774751)))

(assert (=> d!146725 (= res!910550 (bvsge from!3239 (size!45394 a!3861)))))

(assert (=> d!146725 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!774751)))

(declare-fun e!774752 () Bool)

(declare-fun b!1367003 () Bool)

(assert (=> b!1367003 (= e!774752 (contains!9594 acc!866 (select (arr!44844 a!3861) from!3239)))))

(declare-fun b!1367004 () Bool)

(declare-fun e!774750 () Bool)

(declare-fun e!774753 () Bool)

(assert (=> b!1367004 (= e!774750 e!774753)))

(declare-fun c!127667 () Bool)

(assert (=> b!1367004 (= c!127667 (validKeyInArray!0 (select (arr!44844 a!3861) from!3239)))))

(declare-fun b!1367005 () Bool)

(assert (=> b!1367005 (= e!774751 e!774750)))

(declare-fun res!910551 () Bool)

(assert (=> b!1367005 (=> (not res!910551) (not e!774750))))

(assert (=> b!1367005 (= res!910551 (not e!774752))))

(declare-fun res!910549 () Bool)

(assert (=> b!1367005 (=> (not res!910549) (not e!774752))))

(assert (=> b!1367005 (= res!910549 (validKeyInArray!0 (select (arr!44844 a!3861) from!3239)))))

(declare-fun b!1367006 () Bool)

(declare-fun call!65474 () Bool)

(assert (=> b!1367006 (= e!774753 call!65474)))

(declare-fun bm!65471 () Bool)

(assert (=> bm!65471 (= call!65474 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127667 (Cons!31908 (select (arr!44844 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1367007 () Bool)

(assert (=> b!1367007 (= e!774753 call!65474)))

(assert (= (and d!146725 (not res!910550)) b!1367005))

(assert (= (and b!1367005 res!910549) b!1367003))

(assert (= (and b!1367005 res!910551) b!1367004))

(assert (= (and b!1367004 c!127667) b!1367007))

(assert (= (and b!1367004 (not c!127667)) b!1367006))

(assert (= (or b!1367007 b!1367006) bm!65471))

(assert (=> b!1367003 m!1251187))

(assert (=> b!1367003 m!1251187))

(assert (=> b!1367003 m!1251193))

(assert (=> b!1367004 m!1251187))

(assert (=> b!1367004 m!1251187))

(assert (=> b!1367004 m!1251207))

(assert (=> b!1367005 m!1251187))

(assert (=> b!1367005 m!1251187))

(assert (=> b!1367005 m!1251207))

(assert (=> bm!65471 m!1251187))

(declare-fun m!1251291 () Bool)

(assert (=> bm!65471 m!1251291))

(assert (=> b!1366917 d!146725))

(declare-fun d!146751 () Bool)

(assert (=> d!146751 (noDuplicate!2451 newAcc!98)))

(declare-fun lt!601773 () Unit!45125)

(declare-fun choose!1994 (List!31912 List!31912) Unit!45125)

(assert (=> d!146751 (= lt!601773 (choose!1994 newAcc!98 acc!866))))

(declare-fun e!774778 () Bool)

(assert (=> d!146751 e!774778))

(declare-fun res!910576 () Bool)

(assert (=> d!146751 (=> (not res!910576) (not e!774778))))

(assert (=> d!146751 (= res!910576 (subseq!996 newAcc!98 acc!866))))

(assert (=> d!146751 (= (noDuplicateSubseq!183 newAcc!98 acc!866) lt!601773)))

(declare-fun b!1367032 () Bool)

(assert (=> b!1367032 (= e!774778 (noDuplicate!2451 acc!866))))

(assert (= (and d!146751 res!910576) b!1367032))

(assert (=> d!146751 m!1251179))

(declare-fun m!1251313 () Bool)

(assert (=> d!146751 m!1251313))

(assert (=> d!146751 m!1251197))

(assert (=> b!1367032 m!1251177))

(assert (=> b!1366917 d!146751))

(declare-fun d!146765 () Bool)

(declare-fun res!910598 () Bool)

(declare-fun e!774804 () Bool)

(assert (=> d!146765 (=> res!910598 e!774804)))

(assert (=> d!146765 (= res!910598 ((_ is Nil!31909) newAcc!98))))

(assert (=> d!146765 (= (subseq!996 newAcc!98 acc!866) e!774804)))

(declare-fun b!1367059 () Bool)

(declare-fun e!774805 () Bool)

(assert (=> b!1367059 (= e!774804 e!774805)))

(declare-fun res!910597 () Bool)

(assert (=> b!1367059 (=> (not res!910597) (not e!774805))))

(assert (=> b!1367059 (= res!910597 ((_ is Cons!31908) acc!866))))

(declare-fun b!1367060 () Bool)

(declare-fun e!774803 () Bool)

(assert (=> b!1367060 (= e!774805 e!774803)))

(declare-fun res!910599 () Bool)

(assert (=> b!1367060 (=> res!910599 e!774803)))

(declare-fun e!774802 () Bool)

(assert (=> b!1367060 (= res!910599 e!774802)))

(declare-fun res!910600 () Bool)

(assert (=> b!1367060 (=> (not res!910600) (not e!774802))))

(assert (=> b!1367060 (= res!910600 (= (h!33117 newAcc!98) (h!33117 acc!866)))))

(declare-fun b!1367061 () Bool)

(assert (=> b!1367061 (= e!774802 (subseq!996 (t!46606 newAcc!98) (t!46606 acc!866)))))

(declare-fun b!1367062 () Bool)

(assert (=> b!1367062 (= e!774803 (subseq!996 newAcc!98 (t!46606 acc!866)))))

(assert (= (and d!146765 (not res!910598)) b!1367059))

(assert (= (and b!1367059 res!910597) b!1367060))

(assert (= (and b!1367060 res!910600) b!1367061))

(assert (= (and b!1367060 (not res!910599)) b!1367062))

(declare-fun m!1251325 () Bool)

(assert (=> b!1367061 m!1251325))

(declare-fun m!1251327 () Bool)

(assert (=> b!1367062 m!1251327))

(assert (=> b!1366921 d!146765))

(declare-fun d!146771 () Bool)

(declare-fun lt!601779 () Bool)

(assert (=> d!146771 (= lt!601779 (select (content!715 acc!866) (select (arr!44844 a!3861) from!3239)))))

(declare-fun e!774814 () Bool)

(assert (=> d!146771 (= lt!601779 e!774814)))

(declare-fun res!910609 () Bool)

(assert (=> d!146771 (=> (not res!910609) (not e!774814))))

(assert (=> d!146771 (= res!910609 ((_ is Cons!31908) acc!866))))

(assert (=> d!146771 (= (contains!9594 acc!866 (select (arr!44844 a!3861) from!3239)) lt!601779)))

(declare-fun b!1367069 () Bool)

(declare-fun e!774815 () Bool)

(assert (=> b!1367069 (= e!774814 e!774815)))

(declare-fun res!910610 () Bool)

(assert (=> b!1367069 (=> res!910610 e!774815)))

(assert (=> b!1367069 (= res!910610 (= (h!33117 acc!866) (select (arr!44844 a!3861) from!3239)))))

(declare-fun b!1367070 () Bool)

(assert (=> b!1367070 (= e!774815 (contains!9594 (t!46606 acc!866) (select (arr!44844 a!3861) from!3239)))))

(assert (= (and d!146771 res!910609) b!1367069))

(assert (= (and b!1367069 (not res!910610)) b!1367070))

(assert (=> d!146771 m!1251241))

(assert (=> d!146771 m!1251187))

(declare-fun m!1251329 () Bool)

(assert (=> d!146771 m!1251329))

(assert (=> b!1367070 m!1251187))

(declare-fun m!1251331 () Bool)

(assert (=> b!1367070 m!1251331))

(assert (=> b!1366920 d!146771))

(declare-fun d!146773 () Bool)

(declare-fun lt!601781 () Bool)

(assert (=> d!146773 (= lt!601781 (select (content!715 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774819 () Bool)

(assert (=> d!146773 (= lt!601781 e!774819)))

(declare-fun res!910612 () Bool)

(assert (=> d!146773 (=> (not res!910612) (not e!774819))))

(assert (=> d!146773 (= res!910612 ((_ is Cons!31908) newAcc!98))))

(assert (=> d!146773 (= (contains!9594 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601781)))

(declare-fun b!1367078 () Bool)

(declare-fun e!774820 () Bool)

(assert (=> b!1367078 (= e!774819 e!774820)))

(declare-fun res!910613 () Bool)

(assert (=> b!1367078 (=> res!910613 e!774820)))

(assert (=> b!1367078 (= res!910613 (= (h!33117 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1367079 () Bool)

(assert (=> b!1367079 (= e!774820 (contains!9594 (t!46606 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146773 res!910612) b!1367078))

(assert (= (and b!1367078 (not res!910613)) b!1367079))

(declare-fun m!1251335 () Bool)

(assert (=> d!146773 m!1251335))

(declare-fun m!1251341 () Bool)

(assert (=> d!146773 m!1251341))

(declare-fun m!1251343 () Bool)

(assert (=> b!1367079 m!1251343))

(assert (=> b!1366913 d!146773))

(declare-fun d!146779 () Bool)

(declare-fun res!910624 () Bool)

(declare-fun e!774832 () Bool)

(assert (=> d!146779 (=> res!910624 e!774832)))

(assert (=> d!146779 (= res!910624 ((_ is Nil!31909) acc!866))))

(assert (=> d!146779 (= (noDuplicate!2451 acc!866) e!774832)))

(declare-fun b!1367092 () Bool)

(declare-fun e!774833 () Bool)

(assert (=> b!1367092 (= e!774832 e!774833)))

(declare-fun res!910625 () Bool)

(assert (=> b!1367092 (=> (not res!910625) (not e!774833))))

(assert (=> b!1367092 (= res!910625 (not (contains!9594 (t!46606 acc!866) (h!33117 acc!866))))))

(declare-fun b!1367093 () Bool)

(assert (=> b!1367093 (= e!774833 (noDuplicate!2451 (t!46606 acc!866)))))

(assert (= (and d!146779 (not res!910624)) b!1367092))

(assert (= (and b!1367092 res!910625) b!1367093))

(declare-fun m!1251361 () Bool)

(assert (=> b!1367092 m!1251361))

(declare-fun m!1251363 () Bool)

(assert (=> b!1367093 m!1251363))

(assert (=> b!1366912 d!146779))

(declare-fun d!146785 () Bool)

(assert (=> d!146785 (= (array_inv!33872 a!3861) (bvsge (size!45394 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115558 d!146785))

(declare-fun d!146787 () Bool)

(declare-fun lt!601786 () Bool)

(assert (=> d!146787 (= lt!601786 (select (content!715 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774838 () Bool)

(assert (=> d!146787 (= lt!601786 e!774838)))

(declare-fun res!910629 () Bool)

(assert (=> d!146787 (=> (not res!910629) (not e!774838))))

(assert (=> d!146787 (= res!910629 ((_ is Cons!31908) newAcc!98))))

(assert (=> d!146787 (= (contains!9594 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601786)))

(declare-fun b!1367099 () Bool)

(declare-fun e!774839 () Bool)

(assert (=> b!1367099 (= e!774838 e!774839)))

(declare-fun res!910630 () Bool)

(assert (=> b!1367099 (=> res!910630 e!774839)))

(assert (=> b!1367099 (= res!910630 (= (h!33117 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1367100 () Bool)

(assert (=> b!1367100 (= e!774839 (contains!9594 (t!46606 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146787 res!910629) b!1367099))

(assert (= (and b!1367099 (not res!910630)) b!1367100))

(assert (=> d!146787 m!1251335))

(declare-fun m!1251375 () Bool)

(assert (=> d!146787 m!1251375))

(declare-fun m!1251377 () Bool)

(assert (=> b!1367100 m!1251377))

(assert (=> b!1366916 d!146787))

(declare-fun d!146791 () Bool)

(declare-fun res!910631 () Bool)

(declare-fun e!774840 () Bool)

(assert (=> d!146791 (=> res!910631 e!774840)))

(assert (=> d!146791 (= res!910631 ((_ is Nil!31909) newAcc!98))))

(assert (=> d!146791 (= (noDuplicate!2451 newAcc!98) e!774840)))

(declare-fun b!1367101 () Bool)

(declare-fun e!774841 () Bool)

(assert (=> b!1367101 (= e!774840 e!774841)))

(declare-fun res!910632 () Bool)

(assert (=> b!1367101 (=> (not res!910632) (not e!774841))))

(assert (=> b!1367101 (= res!910632 (not (contains!9594 (t!46606 newAcc!98) (h!33117 newAcc!98))))))

(declare-fun b!1367102 () Bool)

(assert (=> b!1367102 (= e!774841 (noDuplicate!2451 (t!46606 newAcc!98)))))

(assert (= (and d!146791 (not res!910631)) b!1367101))

(assert (= (and b!1367101 res!910632) b!1367102))

(declare-fun m!1251379 () Bool)

(assert (=> b!1367101 m!1251379))

(declare-fun m!1251381 () Bool)

(assert (=> b!1367102 m!1251381))

(assert (=> b!1366915 d!146791))

(declare-fun d!146793 () Bool)

(assert (=> d!146793 (noDuplicate!2451 lt!601738)))

(declare-fun lt!601787 () Unit!45125)

(assert (=> d!146793 (= lt!601787 (choose!1994 lt!601738 lt!601736))))

(declare-fun e!774842 () Bool)

(assert (=> d!146793 e!774842))

(declare-fun res!910633 () Bool)

(assert (=> d!146793 (=> (not res!910633) (not e!774842))))

(assert (=> d!146793 (= res!910633 (subseq!996 lt!601738 lt!601736))))

(assert (=> d!146793 (= (noDuplicateSubseq!183 lt!601738 lt!601736) lt!601787)))

(declare-fun b!1367103 () Bool)

(assert (=> b!1367103 (= e!774842 (noDuplicate!2451 lt!601736))))

(assert (= (and d!146793 res!910633) b!1367103))

(declare-fun m!1251383 () Bool)

(assert (=> d!146793 m!1251383))

(declare-fun m!1251385 () Bool)

(assert (=> d!146793 m!1251385))

(declare-fun m!1251387 () Bool)

(assert (=> d!146793 m!1251387))

(declare-fun m!1251389 () Bool)

(assert (=> b!1367103 m!1251389))

(assert (=> b!1366915 d!146793))

(declare-fun d!146795 () Bool)

(declare-fun res!910635 () Bool)

(declare-fun e!774844 () Bool)

(assert (=> d!146795 (=> res!910635 e!774844)))

(assert (=> d!146795 (= res!910635 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45394 a!3861)))))

(assert (=> d!146795 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601738) e!774844)))

(declare-fun b!1367104 () Bool)

(declare-fun e!774845 () Bool)

(assert (=> b!1367104 (= e!774845 (contains!9594 lt!601738 (select (arr!44844 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1367105 () Bool)

(declare-fun e!774843 () Bool)

(declare-fun e!774846 () Bool)

(assert (=> b!1367105 (= e!774843 e!774846)))

(declare-fun c!127675 () Bool)

(assert (=> b!1367105 (= c!127675 (validKeyInArray!0 (select (arr!44844 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1367106 () Bool)

(assert (=> b!1367106 (= e!774844 e!774843)))

(declare-fun res!910636 () Bool)

(assert (=> b!1367106 (=> (not res!910636) (not e!774843))))

(assert (=> b!1367106 (= res!910636 (not e!774845))))

(declare-fun res!910634 () Bool)

(assert (=> b!1367106 (=> (not res!910634) (not e!774845))))

(assert (=> b!1367106 (= res!910634 (validKeyInArray!0 (select (arr!44844 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1367107 () Bool)

(declare-fun call!65482 () Bool)

(assert (=> b!1367107 (= e!774846 call!65482)))

(declare-fun bm!65479 () Bool)

(assert (=> bm!65479 (= call!65482 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127675 (Cons!31908 (select (arr!44844 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) lt!601738) lt!601738)))))

(declare-fun b!1367108 () Bool)

(assert (=> b!1367108 (= e!774846 call!65482)))

(assert (= (and d!146795 (not res!910635)) b!1367106))

(assert (= (and b!1367106 res!910634) b!1367104))

(assert (= (and b!1367106 res!910636) b!1367105))

(assert (= (and b!1367105 c!127675) b!1367108))

(assert (= (and b!1367105 (not c!127675)) b!1367107))

(assert (= (or b!1367108 b!1367107) bm!65479))

(declare-fun m!1251391 () Bool)

(assert (=> b!1367104 m!1251391))

(assert (=> b!1367104 m!1251391))

(declare-fun m!1251393 () Bool)

(assert (=> b!1367104 m!1251393))

(assert (=> b!1367105 m!1251391))

(assert (=> b!1367105 m!1251391))

(declare-fun m!1251395 () Bool)

(assert (=> b!1367105 m!1251395))

(assert (=> b!1367106 m!1251391))

(assert (=> b!1367106 m!1251391))

(assert (=> b!1367106 m!1251395))

(assert (=> bm!65479 m!1251391))

(declare-fun m!1251397 () Bool)

(assert (=> bm!65479 m!1251397))

(assert (=> b!1366915 d!146795))

(declare-fun d!146797 () Bool)

(assert (=> d!146797 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601738)))

(declare-fun lt!601793 () Unit!45125)

(declare-fun choose!80 (array!92834 List!31912 List!31912 (_ BitVec 32)) Unit!45125)

(assert (=> d!146797 (= lt!601793 (choose!80 a!3861 lt!601736 lt!601738 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> d!146797 (bvslt (size!45394 a!3861) #b01111111111111111111111111111111)))

(assert (=> d!146797 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601736 lt!601738 (bvadd #b00000000000000000000000000000001 from!3239)) lt!601793)))

(declare-fun bs!39218 () Bool)

(assert (= bs!39218 d!146797))

(assert (=> bs!39218 m!1251181))

(declare-fun m!1251401 () Bool)

(assert (=> bs!39218 m!1251401))

(assert (=> b!1366915 d!146797))

(declare-fun d!146803 () Bool)

(declare-fun lt!601794 () Bool)

(assert (=> d!146803 (= lt!601794 (select (content!715 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!774847 () Bool)

(assert (=> d!146803 (= lt!601794 e!774847)))

(declare-fun res!910637 () Bool)

(assert (=> d!146803 (=> (not res!910637) (not e!774847))))

(assert (=> d!146803 (= res!910637 ((_ is Cons!31908) acc!866))))

(assert (=> d!146803 (= (contains!9594 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601794)))

(declare-fun b!1367109 () Bool)

(declare-fun e!774848 () Bool)

(assert (=> b!1367109 (= e!774847 e!774848)))

(declare-fun res!910638 () Bool)

(assert (=> b!1367109 (=> res!910638 e!774848)))

(assert (=> b!1367109 (= res!910638 (= (h!33117 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1367110 () Bool)

(assert (=> b!1367110 (= e!774848 (contains!9594 (t!46606 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146803 res!910637) b!1367109))

(assert (= (and b!1367109 (not res!910638)) b!1367110))

(assert (=> d!146803 m!1251241))

(declare-fun m!1251403 () Bool)

(assert (=> d!146803 m!1251403))

(declare-fun m!1251405 () Bool)

(assert (=> b!1367110 m!1251405))

(assert (=> b!1366914 d!146803))

(check-sat (not b!1367092) (not b!1367093) (not b!1367032) (not b!1367003) (not b!1367102) (not b!1367103) (not b!1367101) (not b!1367106) (not b!1367079) (not b!1367104) (not bm!65471) (not b!1367062) (not b!1367004) (not bm!65479) (not d!146793) (not b!1367061) (not d!146771) (not d!146773) (not b!1367110) (not b!1367100) (not b!1367070) (not b!1366960) (not b!1367105) (not b!1367005) (not d!146787) (not d!146803) (not d!146751) (not d!146721) (not d!146797))
(check-sat)
