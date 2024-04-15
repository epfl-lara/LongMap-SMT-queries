; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115732 () Bool)

(assert start!115732)

(declare-fun b!1368722 () Bool)

(declare-fun e!775391 () Bool)

(declare-datatypes ((List!32012 0))(
  ( (Nil!32009) (Cons!32008 (h!33217 (_ BitVec 64)) (t!46698 List!32012)) )
))
(declare-fun newAcc!98 () List!32012)

(declare-fun noDuplicate!2520 (List!32012) Bool)

(assert (=> b!1368722 (= e!775391 (not (noDuplicate!2520 newAcc!98)))))

(declare-datatypes ((array!92883 0))(
  ( (array!92884 (arr!44866 (Array (_ BitVec 32) (_ BitVec 64))) (size!45418 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92883)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92883 (_ BitVec 32) List!32012) Bool)

(assert (=> b!1368722 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-datatypes ((Unit!45060 0))(
  ( (Unit!45061) )
))
(declare-fun lt!601941 () Unit!45060)

(declare-fun acc!866 () List!32012)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92883 List!32012 List!32012 (_ BitVec 32)) Unit!45060)

(assert (=> b!1368722 (= lt!601941 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(declare-fun b!1368723 () Bool)

(declare-fun e!775392 () Bool)

(assert (=> b!1368723 (= e!775392 e!775391)))

(declare-fun res!912282 () Bool)

(assert (=> b!1368723 (=> (not res!912282) (not e!775391))))

(assert (=> b!1368723 (= res!912282 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601940 () Unit!45060)

(declare-fun noDuplicateSubseq!230 (List!32012 List!32012) Unit!45060)

(assert (=> b!1368723 (= lt!601940 (noDuplicateSubseq!230 newAcc!98 acc!866))))

(declare-fun b!1368724 () Bool)

(declare-fun res!912278 () Bool)

(assert (=> b!1368724 (=> (not res!912278) (not e!775392))))

(declare-fun contains!9605 (List!32012 (_ BitVec 64)) Bool)

(assert (=> b!1368724 (= res!912278 (not (contains!9605 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368725 () Bool)

(declare-fun res!912277 () Bool)

(assert (=> b!1368725 (=> (not res!912277) (not e!775392))))

(assert (=> b!1368725 (= res!912277 (not (contains!9605 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368726 () Bool)

(declare-fun res!912279 () Bool)

(assert (=> b!1368726 (=> (not res!912279) (not e!775391))))

(assert (=> b!1368726 (= res!912279 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368727 () Bool)

(declare-fun res!912275 () Bool)

(assert (=> b!1368727 (=> (not res!912275) (not e!775392))))

(assert (=> b!1368727 (= res!912275 (not (contains!9605 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368729 () Bool)

(declare-fun res!912280 () Bool)

(assert (=> b!1368729 (=> (not res!912280) (not e!775391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368729 (= res!912280 (not (validKeyInArray!0 (select (arr!44866 a!3861) from!3239))))))

(declare-fun b!1368730 () Bool)

(declare-fun res!912274 () Bool)

(assert (=> b!1368730 (=> (not res!912274) (not e!775392))))

(declare-fun subseq!1043 (List!32012 List!32012) Bool)

(assert (=> b!1368730 (= res!912274 (subseq!1043 newAcc!98 acc!866))))

(declare-fun b!1368731 () Bool)

(declare-fun res!912276 () Bool)

(assert (=> b!1368731 (=> (not res!912276) (not e!775392))))

(assert (=> b!1368731 (= res!912276 (not (contains!9605 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368732 () Bool)

(declare-fun res!912284 () Bool)

(assert (=> b!1368732 (=> (not res!912284) (not e!775392))))

(assert (=> b!1368732 (= res!912284 (noDuplicate!2520 acc!866))))

(declare-fun b!1368733 () Bool)

(declare-fun res!912283 () Bool)

(assert (=> b!1368733 (=> (not res!912283) (not e!775391))))

(assert (=> b!1368733 (= res!912283 (bvslt from!3239 (size!45418 a!3861)))))

(declare-fun res!912273 () Bool)

(assert (=> start!115732 (=> (not res!912273) (not e!775392))))

(assert (=> start!115732 (= res!912273 (and (bvslt (size!45418 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45418 a!3861))))))

(assert (=> start!115732 e!775392))

(declare-fun array_inv!34099 (array!92883) Bool)

(assert (=> start!115732 (array_inv!34099 a!3861)))

(assert (=> start!115732 true))

(declare-fun b!1368728 () Bool)

(declare-fun res!912281 () Bool)

(assert (=> b!1368728 (=> (not res!912281) (not e!775391))))

(assert (=> b!1368728 (= res!912281 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(assert (= (and start!115732 res!912273) b!1368732))

(assert (= (and b!1368732 res!912284) b!1368731))

(assert (= (and b!1368731 res!912276) b!1368724))

(assert (= (and b!1368724 res!912278) b!1368725))

(assert (= (and b!1368725 res!912277) b!1368727))

(assert (= (and b!1368727 res!912275) b!1368730))

(assert (= (and b!1368730 res!912274) b!1368723))

(assert (= (and b!1368723 res!912282) b!1368733))

(assert (= (and b!1368733 res!912283) b!1368729))

(assert (= (and b!1368729 res!912280) b!1368726))

(assert (= (and b!1368726 res!912279) b!1368728))

(assert (= (and b!1368728 res!912281) b!1368722))

(declare-fun m!1252149 () Bool)

(assert (=> start!115732 m!1252149))

(declare-fun m!1252151 () Bool)

(assert (=> b!1368727 m!1252151))

(declare-fun m!1252153 () Bool)

(assert (=> b!1368728 m!1252153))

(declare-fun m!1252155 () Bool)

(assert (=> b!1368729 m!1252155))

(assert (=> b!1368729 m!1252155))

(declare-fun m!1252157 () Bool)

(assert (=> b!1368729 m!1252157))

(declare-fun m!1252159 () Bool)

(assert (=> b!1368731 m!1252159))

(declare-fun m!1252161 () Bool)

(assert (=> b!1368725 m!1252161))

(declare-fun m!1252163 () Bool)

(assert (=> b!1368724 m!1252163))

(declare-fun m!1252165 () Bool)

(assert (=> b!1368730 m!1252165))

(declare-fun m!1252167 () Bool)

(assert (=> b!1368732 m!1252167))

(declare-fun m!1252169 () Bool)

(assert (=> b!1368722 m!1252169))

(declare-fun m!1252171 () Bool)

(assert (=> b!1368722 m!1252171))

(declare-fun m!1252173 () Bool)

(assert (=> b!1368722 m!1252173))

(declare-fun m!1252175 () Bool)

(assert (=> b!1368723 m!1252175))

(declare-fun m!1252177 () Bool)

(assert (=> b!1368723 m!1252177))

(check-sat (not b!1368725) (not b!1368730) (not b!1368731) (not b!1368724) (not b!1368722) (not b!1368729) (not b!1368728) (not b!1368727) (not b!1368732) (not b!1368723) (not start!115732))
(check-sat)
(get-model)

(declare-fun d!146787 () Bool)

(declare-fun lt!601956 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!716 (List!32012) (InoxSet (_ BitVec 64)))

(assert (=> d!146787 (= lt!601956 (select (content!716 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775416 () Bool)

(assert (=> d!146787 (= lt!601956 e!775416)))

(declare-fun res!912362 () Bool)

(assert (=> d!146787 (=> (not res!912362) (not e!775416))))

(get-info :version)

(assert (=> d!146787 (= res!912362 ((_ is Cons!32008) acc!866))))

(assert (=> d!146787 (= (contains!9605 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601956)))

(declare-fun b!1368810 () Bool)

(declare-fun e!775415 () Bool)

(assert (=> b!1368810 (= e!775416 e!775415)))

(declare-fun res!912361 () Bool)

(assert (=> b!1368810 (=> res!912361 e!775415)))

(assert (=> b!1368810 (= res!912361 (= (h!33217 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1368811 () Bool)

(assert (=> b!1368811 (= e!775415 (contains!9605 (t!46698 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146787 res!912362) b!1368810))

(assert (= (and b!1368810 (not res!912361)) b!1368811))

(declare-fun m!1252239 () Bool)

(assert (=> d!146787 m!1252239))

(declare-fun m!1252241 () Bool)

(assert (=> d!146787 m!1252241))

(declare-fun m!1252243 () Bool)

(assert (=> b!1368811 m!1252243))

(assert (=> b!1368724 d!146787))

(declare-fun call!65476 () Bool)

(declare-fun c!127669 () Bool)

(declare-fun bm!65473 () Bool)

(assert (=> bm!65473 (= call!65476 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127669 (Cons!32008 (select (arr!44866 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun d!146789 () Bool)

(declare-fun res!912381 () Bool)

(declare-fun e!775438 () Bool)

(assert (=> d!146789 (=> res!912381 e!775438)))

(assert (=> d!146789 (= res!912381 (bvsge from!3239 (size!45418 a!3861)))))

(assert (=> d!146789 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!775438)))

(declare-fun b!1368834 () Bool)

(declare-fun e!775440 () Bool)

(assert (=> b!1368834 (= e!775440 call!65476)))

(declare-fun b!1368835 () Bool)

(declare-fun e!775439 () Bool)

(assert (=> b!1368835 (= e!775439 e!775440)))

(assert (=> b!1368835 (= c!127669 (validKeyInArray!0 (select (arr!44866 a!3861) from!3239)))))

(declare-fun b!1368836 () Bool)

(assert (=> b!1368836 (= e!775440 call!65476)))

(declare-fun b!1368837 () Bool)

(declare-fun e!775437 () Bool)

(assert (=> b!1368837 (= e!775437 (contains!9605 acc!866 (select (arr!44866 a!3861) from!3239)))))

(declare-fun b!1368838 () Bool)

(assert (=> b!1368838 (= e!775438 e!775439)))

(declare-fun res!912382 () Bool)

(assert (=> b!1368838 (=> (not res!912382) (not e!775439))))

(assert (=> b!1368838 (= res!912382 (not e!775437))))

(declare-fun res!912383 () Bool)

(assert (=> b!1368838 (=> (not res!912383) (not e!775437))))

(assert (=> b!1368838 (= res!912383 (validKeyInArray!0 (select (arr!44866 a!3861) from!3239)))))

(assert (= (and d!146789 (not res!912381)) b!1368838))

(assert (= (and b!1368838 res!912383) b!1368837))

(assert (= (and b!1368838 res!912382) b!1368835))

(assert (= (and b!1368835 c!127669) b!1368836))

(assert (= (and b!1368835 (not c!127669)) b!1368834))

(assert (= (or b!1368836 b!1368834) bm!65473))

(assert (=> bm!65473 m!1252155))

(declare-fun m!1252253 () Bool)

(assert (=> bm!65473 m!1252253))

(assert (=> b!1368835 m!1252155))

(assert (=> b!1368835 m!1252155))

(assert (=> b!1368835 m!1252157))

(assert (=> b!1368837 m!1252155))

(assert (=> b!1368837 m!1252155))

(declare-fun m!1252255 () Bool)

(assert (=> b!1368837 m!1252255))

(assert (=> b!1368838 m!1252155))

(assert (=> b!1368838 m!1252155))

(assert (=> b!1368838 m!1252157))

(assert (=> b!1368723 d!146789))

(declare-fun d!146801 () Bool)

(assert (=> d!146801 (noDuplicate!2520 newAcc!98)))

(declare-fun lt!601959 () Unit!45060)

(declare-fun choose!2008 (List!32012 List!32012) Unit!45060)

(assert (=> d!146801 (= lt!601959 (choose!2008 newAcc!98 acc!866))))

(declare-fun e!775459 () Bool)

(assert (=> d!146801 e!775459))

(declare-fun res!912398 () Bool)

(assert (=> d!146801 (=> (not res!912398) (not e!775459))))

(assert (=> d!146801 (= res!912398 (subseq!1043 newAcc!98 acc!866))))

(assert (=> d!146801 (= (noDuplicateSubseq!230 newAcc!98 acc!866) lt!601959)))

(declare-fun b!1368861 () Bool)

(assert (=> b!1368861 (= e!775459 (noDuplicate!2520 acc!866))))

(assert (= (and d!146801 res!912398) b!1368861))

(assert (=> d!146801 m!1252169))

(declare-fun m!1252257 () Bool)

(assert (=> d!146801 m!1252257))

(assert (=> d!146801 m!1252165))

(assert (=> b!1368861 m!1252167))

(assert (=> b!1368723 d!146801))

(declare-fun d!146803 () Bool)

(declare-fun res!912409 () Bool)

(declare-fun e!775472 () Bool)

(assert (=> d!146803 (=> res!912409 e!775472)))

(assert (=> d!146803 (= res!912409 ((_ is Nil!32009) newAcc!98))))

(assert (=> d!146803 (= (noDuplicate!2520 newAcc!98) e!775472)))

(declare-fun b!1368876 () Bool)

(declare-fun e!775473 () Bool)

(assert (=> b!1368876 (= e!775472 e!775473)))

(declare-fun res!912410 () Bool)

(assert (=> b!1368876 (=> (not res!912410) (not e!775473))))

(assert (=> b!1368876 (= res!912410 (not (contains!9605 (t!46698 newAcc!98) (h!33217 newAcc!98))))))

(declare-fun b!1368877 () Bool)

(assert (=> b!1368877 (= e!775473 (noDuplicate!2520 (t!46698 newAcc!98)))))

(assert (= (and d!146803 (not res!912409)) b!1368876))

(assert (= (and b!1368876 res!912410) b!1368877))

(declare-fun m!1252271 () Bool)

(assert (=> b!1368876 m!1252271))

(declare-fun m!1252273 () Bool)

(assert (=> b!1368877 m!1252273))

(assert (=> b!1368722 d!146803))

(declare-fun c!127676 () Bool)

(declare-fun call!65483 () Bool)

(declare-fun bm!65480 () Bool)

(assert (=> bm!65480 (= call!65483 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127676 (Cons!32008 (select (arr!44866 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) newAcc!98) newAcc!98)))))

(declare-fun d!146809 () Bool)

(declare-fun res!912411 () Bool)

(declare-fun e!775475 () Bool)

(assert (=> d!146809 (=> res!912411 e!775475)))

(assert (=> d!146809 (= res!912411 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45418 a!3861)))))

(assert (=> d!146809 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98) e!775475)))

(declare-fun b!1368878 () Bool)

(declare-fun e!775477 () Bool)

(assert (=> b!1368878 (= e!775477 call!65483)))

(declare-fun b!1368879 () Bool)

(declare-fun e!775476 () Bool)

(assert (=> b!1368879 (= e!775476 e!775477)))

(assert (=> b!1368879 (= c!127676 (validKeyInArray!0 (select (arr!44866 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1368880 () Bool)

(assert (=> b!1368880 (= e!775477 call!65483)))

(declare-fun b!1368881 () Bool)

(declare-fun e!775474 () Bool)

(assert (=> b!1368881 (= e!775474 (contains!9605 newAcc!98 (select (arr!44866 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1368882 () Bool)

(assert (=> b!1368882 (= e!775475 e!775476)))

(declare-fun res!912412 () Bool)

(assert (=> b!1368882 (=> (not res!912412) (not e!775476))))

(assert (=> b!1368882 (= res!912412 (not e!775474))))

(declare-fun res!912413 () Bool)

(assert (=> b!1368882 (=> (not res!912413) (not e!775474))))

(assert (=> b!1368882 (= res!912413 (validKeyInArray!0 (select (arr!44866 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(assert (= (and d!146809 (not res!912411)) b!1368882))

(assert (= (and b!1368882 res!912413) b!1368881))

(assert (= (and b!1368882 res!912412) b!1368879))

(assert (= (and b!1368879 c!127676) b!1368880))

(assert (= (and b!1368879 (not c!127676)) b!1368878))

(assert (= (or b!1368880 b!1368878) bm!65480))

(declare-fun m!1252275 () Bool)

(assert (=> bm!65480 m!1252275))

(declare-fun m!1252277 () Bool)

(assert (=> bm!65480 m!1252277))

(assert (=> b!1368879 m!1252275))

(assert (=> b!1368879 m!1252275))

(declare-fun m!1252279 () Bool)

(assert (=> b!1368879 m!1252279))

(assert (=> b!1368881 m!1252275))

(assert (=> b!1368881 m!1252275))

(declare-fun m!1252281 () Bool)

(assert (=> b!1368881 m!1252281))

(assert (=> b!1368882 m!1252275))

(assert (=> b!1368882 m!1252275))

(assert (=> b!1368882 m!1252279))

(assert (=> b!1368722 d!146809))

(declare-fun d!146811 () Bool)

(assert (=> d!146811 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-fun lt!601968 () Unit!45060)

(declare-fun choose!80 (array!92883 List!32012 List!32012 (_ BitVec 32)) Unit!45060)

(assert (=> d!146811 (= lt!601968 (choose!80 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> d!146811 (bvslt (size!45418 a!3861) #b01111111111111111111111111111111)))

(assert (=> d!146811 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)) lt!601968)))

(declare-fun bs!39240 () Bool)

(assert (= bs!39240 d!146811))

(assert (=> bs!39240 m!1252171))

(declare-fun m!1252287 () Bool)

(assert (=> bs!39240 m!1252287))

(assert (=> b!1368722 d!146811))

(declare-fun d!146819 () Bool)

(declare-fun res!912417 () Bool)

(declare-fun e!775481 () Bool)

(assert (=> d!146819 (=> res!912417 e!775481)))

(assert (=> d!146819 (= res!912417 ((_ is Nil!32009) acc!866))))

(assert (=> d!146819 (= (noDuplicate!2520 acc!866) e!775481)))

(declare-fun b!1368886 () Bool)

(declare-fun e!775482 () Bool)

(assert (=> b!1368886 (= e!775481 e!775482)))

(declare-fun res!912418 () Bool)

(assert (=> b!1368886 (=> (not res!912418) (not e!775482))))

(assert (=> b!1368886 (= res!912418 (not (contains!9605 (t!46698 acc!866) (h!33217 acc!866))))))

(declare-fun b!1368887 () Bool)

(assert (=> b!1368887 (= e!775482 (noDuplicate!2520 (t!46698 acc!866)))))

(assert (= (and d!146819 (not res!912417)) b!1368886))

(assert (= (and b!1368886 res!912418) b!1368887))

(declare-fun m!1252289 () Bool)

(assert (=> b!1368886 m!1252289))

(declare-fun m!1252291 () Bool)

(assert (=> b!1368887 m!1252291))

(assert (=> b!1368732 d!146819))

(declare-fun d!146821 () Bool)

(declare-fun lt!601969 () Bool)

(assert (=> d!146821 (= lt!601969 (select (content!716 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775484 () Bool)

(assert (=> d!146821 (= lt!601969 e!775484)))

(declare-fun res!912420 () Bool)

(assert (=> d!146821 (=> (not res!912420) (not e!775484))))

(assert (=> d!146821 (= res!912420 ((_ is Cons!32008) acc!866))))

(assert (=> d!146821 (= (contains!9605 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601969)))

(declare-fun b!1368888 () Bool)

(declare-fun e!775483 () Bool)

(assert (=> b!1368888 (= e!775484 e!775483)))

(declare-fun res!912419 () Bool)

(assert (=> b!1368888 (=> res!912419 e!775483)))

(assert (=> b!1368888 (= res!912419 (= (h!33217 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1368889 () Bool)

(assert (=> b!1368889 (= e!775483 (contains!9605 (t!46698 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146821 res!912420) b!1368888))

(assert (= (and b!1368888 (not res!912419)) b!1368889))

(assert (=> d!146821 m!1252239))

(declare-fun m!1252293 () Bool)

(assert (=> d!146821 m!1252293))

(declare-fun m!1252295 () Bool)

(assert (=> b!1368889 m!1252295))

(assert (=> b!1368731 d!146821))

(declare-fun d!146823 () Bool)

(assert (=> d!146823 (= (array_inv!34099 a!3861) (bvsge (size!45418 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!115732 d!146823))

(declare-fun d!146825 () Bool)

(declare-fun res!912459 () Bool)

(declare-fun e!775523 () Bool)

(assert (=> d!146825 (=> res!912459 e!775523)))

(assert (=> d!146825 (= res!912459 ((_ is Nil!32009) newAcc!98))))

(assert (=> d!146825 (= (subseq!1043 newAcc!98 acc!866) e!775523)))

(declare-fun b!1368927 () Bool)

(declare-fun e!775522 () Bool)

(assert (=> b!1368927 (= e!775523 e!775522)))

(declare-fun res!912456 () Bool)

(assert (=> b!1368927 (=> (not res!912456) (not e!775522))))

(assert (=> b!1368927 (= res!912456 ((_ is Cons!32008) acc!866))))

(declare-fun b!1368930 () Bool)

(declare-fun e!775524 () Bool)

(assert (=> b!1368930 (= e!775524 (subseq!1043 newAcc!98 (t!46698 acc!866)))))

(declare-fun b!1368929 () Bool)

(declare-fun e!775521 () Bool)

(assert (=> b!1368929 (= e!775521 (subseq!1043 (t!46698 newAcc!98) (t!46698 acc!866)))))

(declare-fun b!1368928 () Bool)

(assert (=> b!1368928 (= e!775522 e!775524)))

(declare-fun res!912457 () Bool)

(assert (=> b!1368928 (=> res!912457 e!775524)))

(assert (=> b!1368928 (= res!912457 e!775521)))

(declare-fun res!912458 () Bool)

(assert (=> b!1368928 (=> (not res!912458) (not e!775521))))

(assert (=> b!1368928 (= res!912458 (= (h!33217 newAcc!98) (h!33217 acc!866)))))

(assert (= (and d!146825 (not res!912459)) b!1368927))

(assert (= (and b!1368927 res!912456) b!1368928))

(assert (= (and b!1368928 res!912458) b!1368929))

(assert (= (and b!1368928 (not res!912457)) b!1368930))

(declare-fun m!1252345 () Bool)

(assert (=> b!1368930 m!1252345))

(declare-fun m!1252347 () Bool)

(assert (=> b!1368929 m!1252347))

(assert (=> b!1368730 d!146825))

(declare-fun d!146849 () Bool)

(assert (=> d!146849 (= (validKeyInArray!0 (select (arr!44866 a!3861) from!3239)) (and (not (= (select (arr!44866 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44866 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1368729 d!146849))

(declare-fun bm!65482 () Bool)

(declare-fun call!65485 () Bool)

(declare-fun c!127678 () Bool)

(assert (=> bm!65482 (= call!65485 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239 #b00000000000000000000000000000001) (ite c!127678 (Cons!32008 (select (arr!44866 a!3861) (bvadd #b00000000000000000000000000000001 from!3239)) acc!866) acc!866)))))

(declare-fun d!146851 () Bool)

(declare-fun res!912460 () Bool)

(declare-fun e!775526 () Bool)

(assert (=> d!146851 (=> res!912460 e!775526)))

(assert (=> d!146851 (= res!912460 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) (size!45418 a!3861)))))

(assert (=> d!146851 (= (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866) e!775526)))

(declare-fun b!1368931 () Bool)

(declare-fun e!775528 () Bool)

(assert (=> b!1368931 (= e!775528 call!65485)))

(declare-fun b!1368932 () Bool)

(declare-fun e!775527 () Bool)

(assert (=> b!1368932 (= e!775527 e!775528)))

(assert (=> b!1368932 (= c!127678 (validKeyInArray!0 (select (arr!44866 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1368933 () Bool)

(assert (=> b!1368933 (= e!775528 call!65485)))

(declare-fun e!775525 () Bool)

(declare-fun b!1368934 () Bool)

(assert (=> b!1368934 (= e!775525 (contains!9605 acc!866 (select (arr!44866 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(declare-fun b!1368935 () Bool)

(assert (=> b!1368935 (= e!775526 e!775527)))

(declare-fun res!912461 () Bool)

(assert (=> b!1368935 (=> (not res!912461) (not e!775527))))

(assert (=> b!1368935 (= res!912461 (not e!775525))))

(declare-fun res!912462 () Bool)

(assert (=> b!1368935 (=> (not res!912462) (not e!775525))))

(assert (=> b!1368935 (= res!912462 (validKeyInArray!0 (select (arr!44866 a!3861) (bvadd #b00000000000000000000000000000001 from!3239))))))

(assert (= (and d!146851 (not res!912460)) b!1368935))

(assert (= (and b!1368935 res!912462) b!1368934))

(assert (= (and b!1368935 res!912461) b!1368932))

(assert (= (and b!1368932 c!127678) b!1368933))

(assert (= (and b!1368932 (not c!127678)) b!1368931))

(assert (= (or b!1368933 b!1368931) bm!65482))

(assert (=> bm!65482 m!1252275))

(declare-fun m!1252349 () Bool)

(assert (=> bm!65482 m!1252349))

(assert (=> b!1368932 m!1252275))

(assert (=> b!1368932 m!1252275))

(assert (=> b!1368932 m!1252279))

(assert (=> b!1368934 m!1252275))

(assert (=> b!1368934 m!1252275))

(declare-fun m!1252351 () Bool)

(assert (=> b!1368934 m!1252351))

(assert (=> b!1368935 m!1252275))

(assert (=> b!1368935 m!1252275))

(assert (=> b!1368935 m!1252279))

(assert (=> b!1368728 d!146851))

(declare-fun d!146853 () Bool)

(declare-fun lt!601984 () Bool)

(assert (=> d!146853 (= lt!601984 (select (content!716 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775538 () Bool)

(assert (=> d!146853 (= lt!601984 e!775538)))

(declare-fun res!912472 () Bool)

(assert (=> d!146853 (=> (not res!912472) (not e!775538))))

(assert (=> d!146853 (= res!912472 ((_ is Cons!32008) newAcc!98))))

(assert (=> d!146853 (= (contains!9605 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601984)))

(declare-fun b!1368944 () Bool)

(declare-fun e!775537 () Bool)

(assert (=> b!1368944 (= e!775538 e!775537)))

(declare-fun res!912471 () Bool)

(assert (=> b!1368944 (=> res!912471 e!775537)))

(assert (=> b!1368944 (= res!912471 (= (h!33217 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1368945 () Bool)

(assert (=> b!1368945 (= e!775537 (contains!9605 (t!46698 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146853 res!912472) b!1368944))

(assert (= (and b!1368944 (not res!912471)) b!1368945))

(declare-fun m!1252355 () Bool)

(assert (=> d!146853 m!1252355))

(declare-fun m!1252357 () Bool)

(assert (=> d!146853 m!1252357))

(declare-fun m!1252359 () Bool)

(assert (=> b!1368945 m!1252359))

(assert (=> b!1368727 d!146853))

(declare-fun d!146857 () Bool)

(declare-fun lt!601985 () Bool)

(assert (=> d!146857 (= lt!601985 (select (content!716 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!775540 () Bool)

(assert (=> d!146857 (= lt!601985 e!775540)))

(declare-fun res!912474 () Bool)

(assert (=> d!146857 (=> (not res!912474) (not e!775540))))

(assert (=> d!146857 (= res!912474 ((_ is Cons!32008) newAcc!98))))

(assert (=> d!146857 (= (contains!9605 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601985)))

(declare-fun b!1368946 () Bool)

(declare-fun e!775539 () Bool)

(assert (=> b!1368946 (= e!775540 e!775539)))

(declare-fun res!912473 () Bool)

(assert (=> b!1368946 (=> res!912473 e!775539)))

(assert (=> b!1368946 (= res!912473 (= (h!33217 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1368947 () Bool)

(assert (=> b!1368947 (= e!775539 (contains!9605 (t!46698 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146857 res!912474) b!1368946))

(assert (= (and b!1368946 (not res!912473)) b!1368947))

(assert (=> d!146857 m!1252355))

(declare-fun m!1252361 () Bool)

(assert (=> d!146857 m!1252361))

(declare-fun m!1252363 () Bool)

(assert (=> b!1368947 m!1252363))

(assert (=> b!1368725 d!146857))

(check-sat (not bm!65482) (not d!146801) (not d!146821) (not b!1368877) (not b!1368837) (not b!1368879) (not b!1368934) (not b!1368932) (not b!1368886) (not b!1368835) (not b!1368889) (not bm!65480) (not d!146853) (not b!1368882) (not bm!65473) (not b!1368945) (not d!146787) (not b!1368838) (not d!146857) (not b!1368811) (not b!1368887) (not b!1368881) (not b!1368935) (not b!1368876) (not b!1368929) (not d!146811) (not b!1368947) (not b!1368930) (not b!1368861))
(check-sat)
