; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116410 () Bool)

(assert start!116410)

(declare-fun b!1373679 () Bool)

(declare-fun res!916893 () Bool)

(declare-fun e!778159 () Bool)

(assert (=> b!1373679 (=> (not res!916893) (not e!778159))))

(declare-datatypes ((List!32047 0))(
  ( (Nil!32044) (Cons!32043 (h!33252 (_ BitVec 64)) (t!46741 List!32047)) )
))
(declare-fun newAcc!98 () List!32047)

(declare-fun acc!866 () List!32047)

(declare-fun subseq!1131 (List!32047 List!32047) Bool)

(assert (=> b!1373679 (= res!916893 (subseq!1131 newAcc!98 acc!866))))

(declare-fun b!1373680 () Bool)

(declare-fun e!778157 () Bool)

(assert (=> b!1373680 (= e!778159 e!778157)))

(declare-fun res!916891 () Bool)

(assert (=> b!1373680 (=> (not res!916891) (not e!778157))))

(declare-datatypes ((array!93143 0))(
  ( (array!93144 (arr!44979 (Array (_ BitVec 32) (_ BitVec 64))) (size!45529 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93143)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!93143 (_ BitVec 32) List!32047) Bool)

(assert (=> b!1373680 (= res!916891 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45395 0))(
  ( (Unit!45396) )
))
(declare-fun lt!603094 () Unit!45395)

(declare-fun noDuplicateSubseq!318 (List!32047 List!32047) Unit!45395)

(assert (=> b!1373680 (= lt!603094 (noDuplicateSubseq!318 newAcc!98 acc!866))))

(declare-fun b!1373681 () Bool)

(declare-fun res!916887 () Bool)

(assert (=> b!1373681 (=> (not res!916887) (not e!778159))))

(declare-fun contains!9729 (List!32047 (_ BitVec 64)) Bool)

(assert (=> b!1373681 (= res!916887 (not (contains!9729 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373682 () Bool)

(declare-fun res!916889 () Bool)

(assert (=> b!1373682 (=> (not res!916889) (not e!778159))))

(declare-fun noDuplicate!2586 (List!32047) Bool)

(assert (=> b!1373682 (= res!916889 (noDuplicate!2586 acc!866))))

(declare-fun b!1373683 () Bool)

(declare-fun res!916890 () Bool)

(assert (=> b!1373683 (=> (not res!916890) (not e!778159))))

(assert (=> b!1373683 (= res!916890 (not (contains!9729 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373684 () Bool)

(declare-fun res!916886 () Bool)

(assert (=> b!1373684 (=> (not res!916886) (not e!778159))))

(assert (=> b!1373684 (= res!916886 (not (contains!9729 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373685 () Bool)

(assert (=> b!1373685 (= e!778157 (not (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98)))))

(declare-fun b!1373686 () Bool)

(declare-fun res!916894 () Bool)

(assert (=> b!1373686 (=> (not res!916894) (not e!778159))))

(assert (=> b!1373686 (= res!916894 (not (contains!9729 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1373678 () Bool)

(declare-fun res!916888 () Bool)

(assert (=> b!1373678 (=> (not res!916888) (not e!778157))))

(assert (=> b!1373678 (= res!916888 (bvsge from!3239 (size!45529 a!3861)))))

(declare-fun res!916892 () Bool)

(assert (=> start!116410 (=> (not res!916892) (not e!778159))))

(assert (=> start!116410 (= res!916892 (and (bvslt (size!45529 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45529 a!3861))))))

(assert (=> start!116410 e!778159))

(declare-fun array_inv!34007 (array!93143) Bool)

(assert (=> start!116410 (array_inv!34007 a!3861)))

(assert (=> start!116410 true))

(assert (= (and start!116410 res!916892) b!1373682))

(assert (= (and b!1373682 res!916889) b!1373683))

(assert (= (and b!1373683 res!916890) b!1373686))

(assert (= (and b!1373686 res!916894) b!1373684))

(assert (= (and b!1373684 res!916886) b!1373681))

(assert (= (and b!1373681 res!916887) b!1373679))

(assert (= (and b!1373679 res!916893) b!1373680))

(assert (= (and b!1373680 res!916891) b!1373678))

(assert (= (and b!1373678 res!916888) b!1373685))

(declare-fun m!1256889 () Bool)

(assert (=> b!1373686 m!1256889))

(declare-fun m!1256891 () Bool)

(assert (=> b!1373685 m!1256891))

(declare-fun m!1256893 () Bool)

(assert (=> b!1373682 m!1256893))

(declare-fun m!1256895 () Bool)

(assert (=> b!1373680 m!1256895))

(declare-fun m!1256897 () Bool)

(assert (=> b!1373680 m!1256897))

(declare-fun m!1256899 () Bool)

(assert (=> b!1373679 m!1256899))

(declare-fun m!1256901 () Bool)

(assert (=> b!1373683 m!1256901))

(declare-fun m!1256903 () Bool)

(assert (=> b!1373681 m!1256903))

(declare-fun m!1256905 () Bool)

(assert (=> b!1373684 m!1256905))

(declare-fun m!1256907 () Bool)

(assert (=> start!116410 m!1256907))

(check-sat (not b!1373682) (not b!1373683) (not b!1373685) (not start!116410) (not b!1373684) (not b!1373679) (not b!1373686) (not b!1373680) (not b!1373681))
(check-sat)
(get-model)

(declare-fun d!148041 () Bool)

(declare-fun lt!603100 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!753 (List!32047) (InoxSet (_ BitVec 64)))

(assert (=> d!148041 (= lt!603100 (select (content!753 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778174 () Bool)

(assert (=> d!148041 (= lt!603100 e!778174)))

(declare-fun res!916926 () Bool)

(assert (=> d!148041 (=> (not res!916926) (not e!778174))))

(get-info :version)

(assert (=> d!148041 (= res!916926 ((_ is Cons!32043) acc!866))))

(assert (=> d!148041 (= (contains!9729 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603100)))

(declare-fun b!1373718 () Bool)

(declare-fun e!778173 () Bool)

(assert (=> b!1373718 (= e!778174 e!778173)))

(declare-fun res!916927 () Bool)

(assert (=> b!1373718 (=> res!916927 e!778173)))

(assert (=> b!1373718 (= res!916927 (= (h!33252 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373719 () Bool)

(assert (=> b!1373719 (= e!778173 (contains!9729 (t!46741 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148041 res!916926) b!1373718))

(assert (= (and b!1373718 (not res!916927)) b!1373719))

(declare-fun m!1256929 () Bool)

(assert (=> d!148041 m!1256929))

(declare-fun m!1256931 () Bool)

(assert (=> d!148041 m!1256931))

(declare-fun m!1256933 () Bool)

(assert (=> b!1373719 m!1256933))

(assert (=> b!1373686 d!148041))

(declare-fun d!148047 () Bool)

(declare-fun lt!603101 () Bool)

(assert (=> d!148047 (= lt!603101 (select (content!753 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778176 () Bool)

(assert (=> d!148047 (= lt!603101 e!778176)))

(declare-fun res!916928 () Bool)

(assert (=> d!148047 (=> (not res!916928) (not e!778176))))

(assert (=> d!148047 (= res!916928 ((_ is Cons!32043) newAcc!98))))

(assert (=> d!148047 (= (contains!9729 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603101)))

(declare-fun b!1373720 () Bool)

(declare-fun e!778175 () Bool)

(assert (=> b!1373720 (= e!778176 e!778175)))

(declare-fun res!916929 () Bool)

(assert (=> b!1373720 (=> res!916929 e!778175)))

(assert (=> b!1373720 (= res!916929 (= (h!33252 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373721 () Bool)

(assert (=> b!1373721 (= e!778175 (contains!9729 (t!46741 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148047 res!916928) b!1373720))

(assert (= (and b!1373720 (not res!916929)) b!1373721))

(declare-fun m!1256935 () Bool)

(assert (=> d!148047 m!1256935))

(declare-fun m!1256937 () Bool)

(assert (=> d!148047 m!1256937))

(declare-fun m!1256939 () Bool)

(assert (=> b!1373721 m!1256939))

(assert (=> b!1373681 d!148047))

(declare-fun call!65636 () Bool)

(declare-fun bm!65633 () Bool)

(declare-fun c!127841 () Bool)

(assert (=> bm!65633 (= call!65636 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127841 (Cons!32043 (select (arr!44979 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun d!148053 () Bool)

(declare-fun res!916958 () Bool)

(declare-fun e!778211 () Bool)

(assert (=> d!148053 (=> res!916958 e!778211)))

(assert (=> d!148053 (= res!916958 (bvsge from!3239 (size!45529 a!3861)))))

(assert (=> d!148053 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!778211)))

(declare-fun b!1373759 () Bool)

(declare-fun e!778210 () Bool)

(assert (=> b!1373759 (= e!778210 call!65636)))

(declare-fun b!1373760 () Bool)

(declare-fun e!778212 () Bool)

(assert (=> b!1373760 (= e!778212 e!778210)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373760 (= c!127841 (validKeyInArray!0 (select (arr!44979 a!3861) from!3239)))))

(declare-fun e!778209 () Bool)

(declare-fun b!1373761 () Bool)

(assert (=> b!1373761 (= e!778209 (contains!9729 acc!866 (select (arr!44979 a!3861) from!3239)))))

(declare-fun b!1373762 () Bool)

(assert (=> b!1373762 (= e!778210 call!65636)))

(declare-fun b!1373763 () Bool)

(assert (=> b!1373763 (= e!778211 e!778212)))

(declare-fun res!916957 () Bool)

(assert (=> b!1373763 (=> (not res!916957) (not e!778212))))

(assert (=> b!1373763 (= res!916957 (not e!778209))))

(declare-fun res!916959 () Bool)

(assert (=> b!1373763 (=> (not res!916959) (not e!778209))))

(assert (=> b!1373763 (= res!916959 (validKeyInArray!0 (select (arr!44979 a!3861) from!3239)))))

(assert (= (and d!148053 (not res!916958)) b!1373763))

(assert (= (and b!1373763 res!916959) b!1373761))

(assert (= (and b!1373763 res!916957) b!1373760))

(assert (= (and b!1373760 c!127841) b!1373762))

(assert (= (and b!1373760 (not c!127841)) b!1373759))

(assert (= (or b!1373762 b!1373759) bm!65633))

(declare-fun m!1256967 () Bool)

(assert (=> bm!65633 m!1256967))

(declare-fun m!1256971 () Bool)

(assert (=> bm!65633 m!1256971))

(assert (=> b!1373760 m!1256967))

(assert (=> b!1373760 m!1256967))

(declare-fun m!1256973 () Bool)

(assert (=> b!1373760 m!1256973))

(assert (=> b!1373761 m!1256967))

(assert (=> b!1373761 m!1256967))

(declare-fun m!1256975 () Bool)

(assert (=> b!1373761 m!1256975))

(assert (=> b!1373763 m!1256967))

(assert (=> b!1373763 m!1256967))

(assert (=> b!1373763 m!1256973))

(assert (=> b!1373680 d!148053))

(declare-fun d!148065 () Bool)

(assert (=> d!148065 (noDuplicate!2586 newAcc!98)))

(declare-fun lt!603113 () Unit!45395)

(declare-fun choose!2027 (List!32047 List!32047) Unit!45395)

(assert (=> d!148065 (= lt!603113 (choose!2027 newAcc!98 acc!866))))

(declare-fun e!778226 () Bool)

(assert (=> d!148065 e!778226))

(declare-fun res!916971 () Bool)

(assert (=> d!148065 (=> (not res!916971) (not e!778226))))

(assert (=> d!148065 (= res!916971 (subseq!1131 newAcc!98 acc!866))))

(assert (=> d!148065 (= (noDuplicateSubseq!318 newAcc!98 acc!866) lt!603113)))

(declare-fun b!1373779 () Bool)

(assert (=> b!1373779 (= e!778226 (noDuplicate!2586 acc!866))))

(assert (= (and d!148065 res!916971) b!1373779))

(declare-fun m!1256981 () Bool)

(assert (=> d!148065 m!1256981))

(declare-fun m!1256983 () Bool)

(assert (=> d!148065 m!1256983))

(assert (=> d!148065 m!1256899))

(assert (=> b!1373779 m!1256893))

(assert (=> b!1373680 d!148065))

(declare-fun bm!65637 () Bool)

(declare-fun call!65640 () Bool)

(declare-fun c!127845 () Bool)

(assert (=> bm!65637 (= call!65640 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127845 (Cons!32043 (select (arr!44979 a!3861) from!3239) newAcc!98) newAcc!98)))))

(declare-fun d!148069 () Bool)

(declare-fun res!916976 () Bool)

(declare-fun e!778233 () Bool)

(assert (=> d!148069 (=> res!916976 e!778233)))

(assert (=> d!148069 (= res!916976 (bvsge from!3239 (size!45529 a!3861)))))

(assert (=> d!148069 (= (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98) e!778233)))

(declare-fun b!1373785 () Bool)

(declare-fun e!778232 () Bool)

(assert (=> b!1373785 (= e!778232 call!65640)))

(declare-fun b!1373786 () Bool)

(declare-fun e!778234 () Bool)

(assert (=> b!1373786 (= e!778234 e!778232)))

(assert (=> b!1373786 (= c!127845 (validKeyInArray!0 (select (arr!44979 a!3861) from!3239)))))

(declare-fun b!1373787 () Bool)

(declare-fun e!778231 () Bool)

(assert (=> b!1373787 (= e!778231 (contains!9729 newAcc!98 (select (arr!44979 a!3861) from!3239)))))

(declare-fun b!1373788 () Bool)

(assert (=> b!1373788 (= e!778232 call!65640)))

(declare-fun b!1373789 () Bool)

(assert (=> b!1373789 (= e!778233 e!778234)))

(declare-fun res!916975 () Bool)

(assert (=> b!1373789 (=> (not res!916975) (not e!778234))))

(assert (=> b!1373789 (= res!916975 (not e!778231))))

(declare-fun res!916977 () Bool)

(assert (=> b!1373789 (=> (not res!916977) (not e!778231))))

(assert (=> b!1373789 (= res!916977 (validKeyInArray!0 (select (arr!44979 a!3861) from!3239)))))

(assert (= (and d!148069 (not res!916976)) b!1373789))

(assert (= (and b!1373789 res!916977) b!1373787))

(assert (= (and b!1373789 res!916975) b!1373786))

(assert (= (and b!1373786 c!127845) b!1373788))

(assert (= (and b!1373786 (not c!127845)) b!1373785))

(assert (= (or b!1373788 b!1373785) bm!65637))

(assert (=> bm!65637 m!1256967))

(declare-fun m!1256989 () Bool)

(assert (=> bm!65637 m!1256989))

(assert (=> b!1373786 m!1256967))

(assert (=> b!1373786 m!1256967))

(assert (=> b!1373786 m!1256973))

(assert (=> b!1373787 m!1256967))

(assert (=> b!1373787 m!1256967))

(declare-fun m!1256995 () Bool)

(assert (=> b!1373787 m!1256995))

(assert (=> b!1373789 m!1256967))

(assert (=> b!1373789 m!1256967))

(assert (=> b!1373789 m!1256973))

(assert (=> b!1373685 d!148069))

(declare-fun d!148073 () Bool)

(assert (=> d!148073 (= (array_inv!34007 a!3861) (bvsge (size!45529 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116410 d!148073))

(declare-fun d!148075 () Bool)

(declare-fun lt!603116 () Bool)

(assert (=> d!148075 (= lt!603116 (select (content!753 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778240 () Bool)

(assert (=> d!148075 (= lt!603116 e!778240)))

(declare-fun res!916982 () Bool)

(assert (=> d!148075 (=> (not res!916982) (not e!778240))))

(assert (=> d!148075 (= res!916982 ((_ is Cons!32043) newAcc!98))))

(assert (=> d!148075 (= (contains!9729 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603116)))

(declare-fun b!1373794 () Bool)

(declare-fun e!778239 () Bool)

(assert (=> b!1373794 (= e!778240 e!778239)))

(declare-fun res!916983 () Bool)

(assert (=> b!1373794 (=> res!916983 e!778239)))

(assert (=> b!1373794 (= res!916983 (= (h!33252 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373795 () Bool)

(assert (=> b!1373795 (= e!778239 (contains!9729 (t!46741 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148075 res!916982) b!1373794))

(assert (= (and b!1373794 (not res!916983)) b!1373795))

(assert (=> d!148075 m!1256935))

(declare-fun m!1256997 () Bool)

(assert (=> d!148075 m!1256997))

(declare-fun m!1256999 () Bool)

(assert (=> b!1373795 m!1256999))

(assert (=> b!1373684 d!148075))

(declare-fun b!1373830 () Bool)

(declare-fun e!778275 () Bool)

(assert (=> b!1373830 (= e!778275 (subseq!1131 newAcc!98 (t!46741 acc!866)))))

(declare-fun b!1373827 () Bool)

(declare-fun e!778272 () Bool)

(declare-fun e!778274 () Bool)

(assert (=> b!1373827 (= e!778272 e!778274)))

(declare-fun res!917015 () Bool)

(assert (=> b!1373827 (=> (not res!917015) (not e!778274))))

(assert (=> b!1373827 (= res!917015 ((_ is Cons!32043) acc!866))))

(declare-fun d!148077 () Bool)

(declare-fun res!917012 () Bool)

(assert (=> d!148077 (=> res!917012 e!778272)))

(assert (=> d!148077 (= res!917012 ((_ is Nil!32044) newAcc!98))))

(assert (=> d!148077 (= (subseq!1131 newAcc!98 acc!866) e!778272)))

(declare-fun b!1373828 () Bool)

(assert (=> b!1373828 (= e!778274 e!778275)))

(declare-fun res!917014 () Bool)

(assert (=> b!1373828 (=> res!917014 e!778275)))

(declare-fun e!778273 () Bool)

(assert (=> b!1373828 (= res!917014 e!778273)))

(declare-fun res!917016 () Bool)

(assert (=> b!1373828 (=> (not res!917016) (not e!778273))))

(assert (=> b!1373828 (= res!917016 (= (h!33252 newAcc!98) (h!33252 acc!866)))))

(declare-fun b!1373829 () Bool)

(assert (=> b!1373829 (= e!778273 (subseq!1131 (t!46741 newAcc!98) (t!46741 acc!866)))))

(assert (= (and d!148077 (not res!917012)) b!1373827))

(assert (= (and b!1373827 res!917015) b!1373828))

(assert (= (and b!1373828 res!917016) b!1373829))

(assert (= (and b!1373828 (not res!917014)) b!1373830))

(declare-fun m!1257025 () Bool)

(assert (=> b!1373830 m!1257025))

(declare-fun m!1257027 () Bool)

(assert (=> b!1373829 m!1257027))

(assert (=> b!1373679 d!148077))

(declare-fun d!148089 () Bool)

(declare-fun lt!603122 () Bool)

(assert (=> d!148089 (= lt!603122 (select (content!753 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!778277 () Bool)

(assert (=> d!148089 (= lt!603122 e!778277)))

(declare-fun res!917017 () Bool)

(assert (=> d!148089 (=> (not res!917017) (not e!778277))))

(assert (=> d!148089 (= res!917017 ((_ is Cons!32043) acc!866))))

(assert (=> d!148089 (= (contains!9729 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603122)))

(declare-fun b!1373833 () Bool)

(declare-fun e!778276 () Bool)

(assert (=> b!1373833 (= e!778277 e!778276)))

(declare-fun res!917018 () Bool)

(assert (=> b!1373833 (=> res!917018 e!778276)))

(assert (=> b!1373833 (= res!917018 (= (h!33252 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1373834 () Bool)

(assert (=> b!1373834 (= e!778276 (contains!9729 (t!46741 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148089 res!917017) b!1373833))

(assert (= (and b!1373833 (not res!917018)) b!1373834))

(assert (=> d!148089 m!1256929))

(declare-fun m!1257033 () Bool)

(assert (=> d!148089 m!1257033))

(declare-fun m!1257035 () Bool)

(assert (=> b!1373834 m!1257035))

(assert (=> b!1373683 d!148089))

(declare-fun d!148093 () Bool)

(declare-fun res!917029 () Bool)

(declare-fun e!778288 () Bool)

(assert (=> d!148093 (=> res!917029 e!778288)))

(assert (=> d!148093 (= res!917029 ((_ is Nil!32044) acc!866))))

(assert (=> d!148093 (= (noDuplicate!2586 acc!866) e!778288)))

(declare-fun b!1373845 () Bool)

(declare-fun e!778289 () Bool)

(assert (=> b!1373845 (= e!778288 e!778289)))

(declare-fun res!917030 () Bool)

(assert (=> b!1373845 (=> (not res!917030) (not e!778289))))

(assert (=> b!1373845 (= res!917030 (not (contains!9729 (t!46741 acc!866) (h!33252 acc!866))))))

(declare-fun b!1373846 () Bool)

(assert (=> b!1373846 (= e!778289 (noDuplicate!2586 (t!46741 acc!866)))))

(assert (= (and d!148093 (not res!917029)) b!1373845))

(assert (= (and b!1373845 res!917030) b!1373846))

(declare-fun m!1257045 () Bool)

(assert (=> b!1373845 m!1257045))

(declare-fun m!1257047 () Bool)

(assert (=> b!1373846 m!1257047))

(assert (=> b!1373682 d!148093))

(check-sat (not b!1373846) (not b!1373779) (not d!148047) (not b!1373845) (not b!1373719) (not b!1373829) (not d!148075) (not d!148041) (not b!1373789) (not b!1373787) (not b!1373786) (not b!1373763) (not b!1373760) (not bm!65633) (not b!1373834) (not bm!65637) (not b!1373761) (not b!1373795) (not b!1373721) (not d!148065) (not d!148089) (not b!1373830))
(check-sat)
