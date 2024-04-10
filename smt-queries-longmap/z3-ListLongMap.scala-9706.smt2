; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114688 () Bool)

(assert start!114688)

(declare-fun b!1360601 () Bool)

(declare-fun res!904875 () Bool)

(declare-fun e!771859 () Bool)

(assert (=> b!1360601 (=> (not res!904875) (not e!771859))))

(declare-datatypes ((List!31768 0))(
  ( (Nil!31765) (Cons!31764 (h!32973 (_ BitVec 64)) (t!46444 List!31768)) )
))
(declare-fun acc!759 () List!31768)

(declare-fun noDuplicate!2334 (List!31768) Bool)

(assert (=> b!1360601 (= res!904875 (noDuplicate!2334 acc!759))))

(declare-fun b!1360602 () Bool)

(declare-fun res!904872 () Bool)

(assert (=> b!1360602 (=> (not res!904872) (not e!771859))))

(declare-fun contains!9477 (List!31768 (_ BitVec 64)) Bool)

(assert (=> b!1360602 (= res!904872 (not (contains!9477 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1360603 () Bool)

(declare-datatypes ((Unit!44841 0))(
  ( (Unit!44842) )
))
(declare-fun e!771862 () Unit!44841)

(declare-fun Unit!44843 () Unit!44841)

(assert (=> b!1360603 (= e!771862 Unit!44843)))

(declare-fun b!1360604 () Bool)

(declare-fun res!904867 () Bool)

(assert (=> b!1360604 (=> (not res!904867) (not e!771859))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92576 0))(
  ( (array!92577 (arr!44727 (Array (_ BitVec 32) (_ BitVec 64))) (size!45277 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92576)

(assert (=> b!1360604 (= res!904867 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45277 a!3742)))))

(declare-fun b!1360605 () Bool)

(declare-fun res!904876 () Bool)

(assert (=> b!1360605 (=> (not res!904876) (not e!771859))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1360605 (= res!904876 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1360606 () Bool)

(declare-fun res!904869 () Bool)

(assert (=> b!1360606 (=> (not res!904869) (not e!771859))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1360606 (= res!904869 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45277 a!3742))))))

(declare-fun b!1360607 () Bool)

(declare-fun e!771860 () Bool)

(assert (=> b!1360607 (= e!771859 e!771860)))

(declare-fun res!904874 () Bool)

(assert (=> b!1360607 (=> (not res!904874) (not e!771860))))

(declare-fun lt!599940 () Bool)

(assert (=> b!1360607 (= res!904874 (and (not (= from!3120 i!1404)) lt!599940 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!599939 () Unit!44841)

(assert (=> b!1360607 (= lt!599939 e!771862)))

(declare-fun c!127307 () Bool)

(assert (=> b!1360607 (= c!127307 lt!599940)))

(assert (=> b!1360607 (= lt!599940 (validKeyInArray!0 (select (arr!44727 a!3742) from!3120)))))

(declare-fun res!904868 () Bool)

(assert (=> start!114688 (=> (not res!904868) (not e!771859))))

(assert (=> start!114688 (= res!904868 (and (bvslt (size!45277 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45277 a!3742))))))

(assert (=> start!114688 e!771859))

(assert (=> start!114688 true))

(declare-fun array_inv!33755 (array!92576) Bool)

(assert (=> start!114688 (array_inv!33755 a!3742)))

(declare-fun b!1360608 () Bool)

(declare-fun lt!599938 () Unit!44841)

(assert (=> b!1360608 (= e!771862 lt!599938)))

(declare-fun lt!599941 () Unit!44841)

(declare-fun lemmaListSubSeqRefl!0 (List!31768) Unit!44841)

(assert (=> b!1360608 (= lt!599941 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!879 (List!31768 List!31768) Bool)

(assert (=> b!1360608 (subseq!879 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92576 List!31768 List!31768 (_ BitVec 32)) Unit!44841)

(declare-fun $colon$colon!882 (List!31768 (_ BitVec 64)) List!31768)

(assert (=> b!1360608 (= lt!599938 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!882 acc!759 (select (arr!44727 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92576 (_ BitVec 32) List!31768) Bool)

(assert (=> b!1360608 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1360609 () Bool)

(declare-fun res!904871 () Bool)

(assert (=> b!1360609 (=> (not res!904871) (not e!771859))))

(assert (=> b!1360609 (= res!904871 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31765))))

(declare-fun b!1360610 () Bool)

(declare-fun res!904873 () Bool)

(assert (=> b!1360610 (=> (not res!904873) (not e!771859))))

(assert (=> b!1360610 (= res!904873 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1360611 () Bool)

(assert (=> b!1360611 (= e!771860 (not (noDuplicate!2334 ($colon$colon!882 acc!759 (select (arr!44727 a!3742) from!3120)))))))

(declare-fun b!1360612 () Bool)

(declare-fun res!904870 () Bool)

(assert (=> b!1360612 (=> (not res!904870) (not e!771859))))

(assert (=> b!1360612 (= res!904870 (not (contains!9477 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114688 res!904868) b!1360601))

(assert (= (and b!1360601 res!904875) b!1360612))

(assert (= (and b!1360612 res!904870) b!1360602))

(assert (= (and b!1360602 res!904872) b!1360609))

(assert (= (and b!1360609 res!904871) b!1360610))

(assert (= (and b!1360610 res!904873) b!1360606))

(assert (= (and b!1360606 res!904869) b!1360605))

(assert (= (and b!1360605 res!904876) b!1360604))

(assert (= (and b!1360604 res!904867) b!1360607))

(assert (= (and b!1360607 c!127307) b!1360608))

(assert (= (and b!1360607 (not c!127307)) b!1360603))

(assert (= (and b!1360607 res!904874) b!1360611))

(declare-fun m!1245847 () Bool)

(assert (=> start!114688 m!1245847))

(declare-fun m!1245849 () Bool)

(assert (=> b!1360602 m!1245849))

(declare-fun m!1245851 () Bool)

(assert (=> b!1360609 m!1245851))

(declare-fun m!1245853 () Bool)

(assert (=> b!1360601 m!1245853))

(declare-fun m!1245855 () Bool)

(assert (=> b!1360611 m!1245855))

(assert (=> b!1360611 m!1245855))

(declare-fun m!1245857 () Bool)

(assert (=> b!1360611 m!1245857))

(assert (=> b!1360611 m!1245857))

(declare-fun m!1245859 () Bool)

(assert (=> b!1360611 m!1245859))

(declare-fun m!1245861 () Bool)

(assert (=> b!1360610 m!1245861))

(declare-fun m!1245863 () Bool)

(assert (=> b!1360612 m!1245863))

(assert (=> b!1360607 m!1245855))

(assert (=> b!1360607 m!1245855))

(declare-fun m!1245865 () Bool)

(assert (=> b!1360607 m!1245865))

(declare-fun m!1245867 () Bool)

(assert (=> b!1360605 m!1245867))

(declare-fun m!1245869 () Bool)

(assert (=> b!1360608 m!1245869))

(assert (=> b!1360608 m!1245855))

(assert (=> b!1360608 m!1245857))

(declare-fun m!1245871 () Bool)

(assert (=> b!1360608 m!1245871))

(declare-fun m!1245873 () Bool)

(assert (=> b!1360608 m!1245873))

(assert (=> b!1360608 m!1245855))

(assert (=> b!1360608 m!1245857))

(declare-fun m!1245875 () Bool)

(assert (=> b!1360608 m!1245875))

(check-sat (not b!1360602) (not b!1360608) (not b!1360601) (not b!1360609) (not b!1360611) (not b!1360610) (not start!114688) (not b!1360605) (not b!1360607) (not b!1360612))
(check-sat)
(get-model)

(declare-fun bm!65327 () Bool)

(declare-fun call!65330 () Bool)

(declare-fun c!127313 () Bool)

(assert (=> bm!65327 (= call!65330 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127313 (Cons!31764 (select (arr!44727 a!3742) #b00000000000000000000000000000000) Nil!31765) Nil!31765)))))

(declare-fun b!1360659 () Bool)

(declare-fun e!771884 () Bool)

(declare-fun e!771886 () Bool)

(assert (=> b!1360659 (= e!771884 e!771886)))

(declare-fun res!904915 () Bool)

(assert (=> b!1360659 (=> (not res!904915) (not e!771886))))

(declare-fun e!771883 () Bool)

(assert (=> b!1360659 (= res!904915 (not e!771883))))

(declare-fun res!904913 () Bool)

(assert (=> b!1360659 (=> (not res!904913) (not e!771883))))

(assert (=> b!1360659 (= res!904913 (validKeyInArray!0 (select (arr!44727 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1360660 () Bool)

(declare-fun e!771885 () Bool)

(assert (=> b!1360660 (= e!771885 call!65330)))

(declare-fun b!1360661 () Bool)

(assert (=> b!1360661 (= e!771886 e!771885)))

(assert (=> b!1360661 (= c!127313 (validKeyInArray!0 (select (arr!44727 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!145653 () Bool)

(declare-fun res!904914 () Bool)

(assert (=> d!145653 (=> res!904914 e!771884)))

(assert (=> d!145653 (= res!904914 (bvsge #b00000000000000000000000000000000 (size!45277 a!3742)))))

(assert (=> d!145653 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31765) e!771884)))

(declare-fun b!1360662 () Bool)

(assert (=> b!1360662 (= e!771885 call!65330)))

(declare-fun b!1360663 () Bool)

(assert (=> b!1360663 (= e!771883 (contains!9477 Nil!31765 (select (arr!44727 a!3742) #b00000000000000000000000000000000)))))

(assert (= (and d!145653 (not res!904914)) b!1360659))

(assert (= (and b!1360659 res!904913) b!1360663))

(assert (= (and b!1360659 res!904915) b!1360661))

(assert (= (and b!1360661 c!127313) b!1360662))

(assert (= (and b!1360661 (not c!127313)) b!1360660))

(assert (= (or b!1360662 b!1360660) bm!65327))

(declare-fun m!1245907 () Bool)

(assert (=> bm!65327 m!1245907))

(declare-fun m!1245909 () Bool)

(assert (=> bm!65327 m!1245909))

(assert (=> b!1360659 m!1245907))

(assert (=> b!1360659 m!1245907))

(declare-fun m!1245911 () Bool)

(assert (=> b!1360659 m!1245911))

(assert (=> b!1360661 m!1245907))

(assert (=> b!1360661 m!1245907))

(assert (=> b!1360661 m!1245911))

(assert (=> b!1360663 m!1245907))

(assert (=> b!1360663 m!1245907))

(declare-fun m!1245913 () Bool)

(assert (=> b!1360663 m!1245913))

(assert (=> b!1360609 d!145653))

(declare-fun d!145655 () Bool)

(assert (=> d!145655 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!599956 () Unit!44841)

(declare-fun choose!80 (array!92576 List!31768 List!31768 (_ BitVec 32)) Unit!44841)

(assert (=> d!145655 (= lt!599956 (choose!80 a!3742 ($colon$colon!882 acc!759 (select (arr!44727 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!145655 (bvslt (size!45277 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145655 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!882 acc!759 (select (arr!44727 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!599956)))

(declare-fun bs!39018 () Bool)

(assert (= bs!39018 d!145655))

(assert (=> bs!39018 m!1245873))

(assert (=> bs!39018 m!1245857))

(declare-fun m!1245915 () Bool)

(assert (=> bs!39018 m!1245915))

(assert (=> b!1360608 d!145655))

(declare-fun b!1360673 () Bool)

(declare-fun e!771898 () Bool)

(declare-fun e!771896 () Bool)

(assert (=> b!1360673 (= e!771898 e!771896)))

(declare-fun res!904926 () Bool)

(assert (=> b!1360673 (=> res!904926 e!771896)))

(declare-fun e!771895 () Bool)

(assert (=> b!1360673 (= res!904926 e!771895)))

(declare-fun res!904927 () Bool)

(assert (=> b!1360673 (=> (not res!904927) (not e!771895))))

(assert (=> b!1360673 (= res!904927 (= (h!32973 acc!759) (h!32973 acc!759)))))

(declare-fun b!1360672 () Bool)

(declare-fun e!771897 () Bool)

(assert (=> b!1360672 (= e!771897 e!771898)))

(declare-fun res!904924 () Bool)

(assert (=> b!1360672 (=> (not res!904924) (not e!771898))))

(get-info :version)

(assert (=> b!1360672 (= res!904924 ((_ is Cons!31764) acc!759))))

(declare-fun b!1360675 () Bool)

(assert (=> b!1360675 (= e!771896 (subseq!879 acc!759 (t!46444 acc!759)))))

(declare-fun d!145657 () Bool)

(declare-fun res!904925 () Bool)

(assert (=> d!145657 (=> res!904925 e!771897)))

(assert (=> d!145657 (= res!904925 ((_ is Nil!31765) acc!759))))

(assert (=> d!145657 (= (subseq!879 acc!759 acc!759) e!771897)))

(declare-fun b!1360674 () Bool)

(assert (=> b!1360674 (= e!771895 (subseq!879 (t!46444 acc!759) (t!46444 acc!759)))))

(assert (= (and d!145657 (not res!904925)) b!1360672))

(assert (= (and b!1360672 res!904924) b!1360673))

(assert (= (and b!1360673 res!904927) b!1360674))

(assert (= (and b!1360673 (not res!904926)) b!1360675))

(declare-fun m!1245917 () Bool)

(assert (=> b!1360675 m!1245917))

(declare-fun m!1245919 () Bool)

(assert (=> b!1360674 m!1245919))

(assert (=> b!1360608 d!145657))

(declare-fun bm!65328 () Bool)

(declare-fun call!65331 () Bool)

(declare-fun c!127314 () Bool)

(assert (=> bm!65328 (= call!65331 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127314 (Cons!31764 (select (arr!44727 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1360676 () Bool)

(declare-fun e!771900 () Bool)

(declare-fun e!771902 () Bool)

(assert (=> b!1360676 (= e!771900 e!771902)))

(declare-fun res!904930 () Bool)

(assert (=> b!1360676 (=> (not res!904930) (not e!771902))))

(declare-fun e!771899 () Bool)

(assert (=> b!1360676 (= res!904930 (not e!771899))))

(declare-fun res!904928 () Bool)

(assert (=> b!1360676 (=> (not res!904928) (not e!771899))))

(assert (=> b!1360676 (= res!904928 (validKeyInArray!0 (select (arr!44727 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1360677 () Bool)

(declare-fun e!771901 () Bool)

(assert (=> b!1360677 (= e!771901 call!65331)))

(declare-fun b!1360678 () Bool)

(assert (=> b!1360678 (= e!771902 e!771901)))

(assert (=> b!1360678 (= c!127314 (validKeyInArray!0 (select (arr!44727 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!145663 () Bool)

(declare-fun res!904929 () Bool)

(assert (=> d!145663 (=> res!904929 e!771900)))

(assert (=> d!145663 (= res!904929 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45277 a!3742)))))

(assert (=> d!145663 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!771900)))

(declare-fun b!1360679 () Bool)

(assert (=> b!1360679 (= e!771901 call!65331)))

(declare-fun b!1360680 () Bool)

(assert (=> b!1360680 (= e!771899 (contains!9477 acc!759 (select (arr!44727 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!145663 (not res!904929)) b!1360676))

(assert (= (and b!1360676 res!904928) b!1360680))

(assert (= (and b!1360676 res!904930) b!1360678))

(assert (= (and b!1360678 c!127314) b!1360679))

(assert (= (and b!1360678 (not c!127314)) b!1360677))

(assert (= (or b!1360679 b!1360677) bm!65328))

(declare-fun m!1245921 () Bool)

(assert (=> bm!65328 m!1245921))

(declare-fun m!1245923 () Bool)

(assert (=> bm!65328 m!1245923))

(assert (=> b!1360676 m!1245921))

(assert (=> b!1360676 m!1245921))

(declare-fun m!1245925 () Bool)

(assert (=> b!1360676 m!1245925))

(assert (=> b!1360678 m!1245921))

(assert (=> b!1360678 m!1245921))

(assert (=> b!1360678 m!1245925))

(assert (=> b!1360680 m!1245921))

(assert (=> b!1360680 m!1245921))

(declare-fun m!1245927 () Bool)

(assert (=> b!1360680 m!1245927))

(assert (=> b!1360608 d!145663))

(declare-fun d!145665 () Bool)

(assert (=> d!145665 (= ($colon$colon!882 acc!759 (select (arr!44727 a!3742) from!3120)) (Cons!31764 (select (arr!44727 a!3742) from!3120) acc!759))))

(assert (=> b!1360608 d!145665))

(declare-fun d!145667 () Bool)

(assert (=> d!145667 (subseq!879 acc!759 acc!759)))

(declare-fun lt!599959 () Unit!44841)

(declare-fun choose!36 (List!31768) Unit!44841)

(assert (=> d!145667 (= lt!599959 (choose!36 acc!759))))

(assert (=> d!145667 (= (lemmaListSubSeqRefl!0 acc!759) lt!599959)))

(declare-fun bs!39019 () Bool)

(assert (= bs!39019 d!145667))

(assert (=> bs!39019 m!1245875))

(declare-fun m!1245933 () Bool)

(assert (=> bs!39019 m!1245933))

(assert (=> b!1360608 d!145667))

(declare-fun d!145671 () Bool)

(declare-fun lt!599965 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!691 (List!31768) (InoxSet (_ BitVec 64)))

(assert (=> d!145671 (= lt!599965 (select (content!691 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771932 () Bool)

(assert (=> d!145671 (= lt!599965 e!771932)))

(declare-fun res!904956 () Bool)

(assert (=> d!145671 (=> (not res!904956) (not e!771932))))

(assert (=> d!145671 (= res!904956 ((_ is Cons!31764) acc!759))))

(assert (=> d!145671 (= (contains!9477 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599965)))

(declare-fun b!1360712 () Bool)

(declare-fun e!771931 () Bool)

(assert (=> b!1360712 (= e!771932 e!771931)))

(declare-fun res!904957 () Bool)

(assert (=> b!1360712 (=> res!904957 e!771931)))

(assert (=> b!1360712 (= res!904957 (= (h!32973 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360713 () Bool)

(assert (=> b!1360713 (= e!771931 (contains!9477 (t!46444 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145671 res!904956) b!1360712))

(assert (= (and b!1360712 (not res!904957)) b!1360713))

(declare-fun m!1245941 () Bool)

(assert (=> d!145671 m!1245941))

(declare-fun m!1245943 () Bool)

(assert (=> d!145671 m!1245943))

(declare-fun m!1245947 () Bool)

(assert (=> b!1360713 m!1245947))

(assert (=> b!1360602 d!145671))

(declare-fun d!145675 () Bool)

(declare-fun lt!599966 () Bool)

(assert (=> d!145675 (= lt!599966 (select (content!691 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!771934 () Bool)

(assert (=> d!145675 (= lt!599966 e!771934)))

(declare-fun res!904958 () Bool)

(assert (=> d!145675 (=> (not res!904958) (not e!771934))))

(assert (=> d!145675 (= res!904958 ((_ is Cons!31764) acc!759))))

(assert (=> d!145675 (= (contains!9477 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599966)))

(declare-fun b!1360714 () Bool)

(declare-fun e!771933 () Bool)

(assert (=> b!1360714 (= e!771934 e!771933)))

(declare-fun res!904959 () Bool)

(assert (=> b!1360714 (=> res!904959 e!771933)))

(assert (=> b!1360714 (= res!904959 (= (h!32973 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1360715 () Bool)

(assert (=> b!1360715 (= e!771933 (contains!9477 (t!46444 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145675 res!904958) b!1360714))

(assert (= (and b!1360714 (not res!904959)) b!1360715))

(assert (=> d!145675 m!1245941))

(declare-fun m!1245951 () Bool)

(assert (=> d!145675 m!1245951))

(declare-fun m!1245953 () Bool)

(assert (=> b!1360715 m!1245953))

(assert (=> b!1360612 d!145675))

(declare-fun d!145679 () Bool)

(assert (=> d!145679 (= (validKeyInArray!0 (select (arr!44727 a!3742) from!3120)) (and (not (= (select (arr!44727 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44727 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1360607 d!145679))

(declare-fun d!145681 () Bool)

(declare-fun res!904976 () Bool)

(declare-fun e!771953 () Bool)

(assert (=> d!145681 (=> res!904976 e!771953)))

(assert (=> d!145681 (= res!904976 ((_ is Nil!31765) acc!759))))

(assert (=> d!145681 (= (noDuplicate!2334 acc!759) e!771953)))

(declare-fun b!1360736 () Bool)

(declare-fun e!771954 () Bool)

(assert (=> b!1360736 (= e!771953 e!771954)))

(declare-fun res!904977 () Bool)

(assert (=> b!1360736 (=> (not res!904977) (not e!771954))))

(assert (=> b!1360736 (= res!904977 (not (contains!9477 (t!46444 acc!759) (h!32973 acc!759))))))

(declare-fun b!1360737 () Bool)

(assert (=> b!1360737 (= e!771954 (noDuplicate!2334 (t!46444 acc!759)))))

(assert (= (and d!145681 (not res!904976)) b!1360736))

(assert (= (and b!1360736 res!904977) b!1360737))

(declare-fun m!1245959 () Bool)

(assert (=> b!1360736 m!1245959))

(declare-fun m!1245961 () Bool)

(assert (=> b!1360737 m!1245961))

(assert (=> b!1360601 d!145681))

(declare-fun d!145687 () Bool)

(declare-fun res!904978 () Bool)

(declare-fun e!771955 () Bool)

(assert (=> d!145687 (=> res!904978 e!771955)))

(assert (=> d!145687 (= res!904978 ((_ is Nil!31765) ($colon$colon!882 acc!759 (select (arr!44727 a!3742) from!3120))))))

(assert (=> d!145687 (= (noDuplicate!2334 ($colon$colon!882 acc!759 (select (arr!44727 a!3742) from!3120))) e!771955)))

(declare-fun b!1360738 () Bool)

(declare-fun e!771956 () Bool)

(assert (=> b!1360738 (= e!771955 e!771956)))

(declare-fun res!904979 () Bool)

(assert (=> b!1360738 (=> (not res!904979) (not e!771956))))

(assert (=> b!1360738 (= res!904979 (not (contains!9477 (t!46444 ($colon$colon!882 acc!759 (select (arr!44727 a!3742) from!3120))) (h!32973 ($colon$colon!882 acc!759 (select (arr!44727 a!3742) from!3120))))))))

(declare-fun b!1360739 () Bool)

(assert (=> b!1360739 (= e!771956 (noDuplicate!2334 (t!46444 ($colon$colon!882 acc!759 (select (arr!44727 a!3742) from!3120)))))))

(assert (= (and d!145687 (not res!904978)) b!1360738))

(assert (= (and b!1360738 res!904979) b!1360739))

(declare-fun m!1245963 () Bool)

(assert (=> b!1360738 m!1245963))

(declare-fun m!1245965 () Bool)

(assert (=> b!1360739 m!1245965))

(assert (=> b!1360611 d!145687))

(assert (=> b!1360611 d!145665))

(declare-fun c!127320 () Bool)

(declare-fun call!65337 () Bool)

(declare-fun bm!65334 () Bool)

(assert (=> bm!65334 (= call!65337 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127320 (Cons!31764 (select (arr!44727 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1360740 () Bool)

(declare-fun e!771958 () Bool)

(declare-fun e!771960 () Bool)

(assert (=> b!1360740 (= e!771958 e!771960)))

(declare-fun res!904982 () Bool)

(assert (=> b!1360740 (=> (not res!904982) (not e!771960))))

(declare-fun e!771957 () Bool)

(assert (=> b!1360740 (= res!904982 (not e!771957))))

(declare-fun res!904980 () Bool)

(assert (=> b!1360740 (=> (not res!904980) (not e!771957))))

(assert (=> b!1360740 (= res!904980 (validKeyInArray!0 (select (arr!44727 a!3742) from!3120)))))

(declare-fun b!1360741 () Bool)

(declare-fun e!771959 () Bool)

(assert (=> b!1360741 (= e!771959 call!65337)))

(declare-fun b!1360742 () Bool)

(assert (=> b!1360742 (= e!771960 e!771959)))

(assert (=> b!1360742 (= c!127320 (validKeyInArray!0 (select (arr!44727 a!3742) from!3120)))))

(declare-fun d!145689 () Bool)

(declare-fun res!904981 () Bool)

(assert (=> d!145689 (=> res!904981 e!771958)))

(assert (=> d!145689 (= res!904981 (bvsge from!3120 (size!45277 a!3742)))))

(assert (=> d!145689 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!771958)))

(declare-fun b!1360743 () Bool)

(assert (=> b!1360743 (= e!771959 call!65337)))

(declare-fun b!1360744 () Bool)

(assert (=> b!1360744 (= e!771957 (contains!9477 acc!759 (select (arr!44727 a!3742) from!3120)))))

(assert (= (and d!145689 (not res!904981)) b!1360740))

(assert (= (and b!1360740 res!904980) b!1360744))

(assert (= (and b!1360740 res!904982) b!1360742))

(assert (= (and b!1360742 c!127320) b!1360743))

(assert (= (and b!1360742 (not c!127320)) b!1360741))

(assert (= (or b!1360743 b!1360741) bm!65334))

(assert (=> bm!65334 m!1245855))

(declare-fun m!1245967 () Bool)

(assert (=> bm!65334 m!1245967))

(assert (=> b!1360740 m!1245855))

(assert (=> b!1360740 m!1245855))

(assert (=> b!1360740 m!1245865))

(assert (=> b!1360742 m!1245855))

(assert (=> b!1360742 m!1245855))

(assert (=> b!1360742 m!1245865))

(assert (=> b!1360744 m!1245855))

(assert (=> b!1360744 m!1245855))

(declare-fun m!1245969 () Bool)

(assert (=> b!1360744 m!1245969))

(assert (=> b!1360610 d!145689))

(declare-fun d!145691 () Bool)

(assert (=> d!145691 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1360605 d!145691))

(declare-fun d!145693 () Bool)

(assert (=> d!145693 (= (array_inv!33755 a!3742) (bvsge (size!45277 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114688 d!145693))

(check-sat (not b!1360659) (not b!1360742) (not b!1360744) (not b!1360713) (not b!1360737) (not b!1360678) (not bm!65334) (not b!1360676) (not b!1360715) (not b!1360736) (not bm!65327) (not b!1360738) (not b!1360680) (not d!145675) (not b!1360740) (not b!1360739) (not b!1360661) (not d!145655) (not b!1360663) (not bm!65328) (not d!145671) (not b!1360674) (not d!145667) (not b!1360675))
(check-sat)
