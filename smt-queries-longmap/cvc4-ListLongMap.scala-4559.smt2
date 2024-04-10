; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63530 () Bool)

(assert start!63530)

(declare-fun b!715963 () Bool)

(declare-fun res!478949 () Bool)

(declare-fun e!401920 () Bool)

(assert (=> b!715963 (=> (not res!478949) (not e!401920))))

(declare-datatypes ((array!40544 0))(
  ( (array!40545 (arr!19409 (Array (_ BitVec 32) (_ BitVec 64))) (size!19825 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40544)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40544 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715963 (= res!478949 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!715964 () Bool)

(declare-fun res!478945 () Bool)

(assert (=> b!715964 (=> (not res!478945) (not e!401920))))

(declare-datatypes ((List!13450 0))(
  ( (Nil!13447) (Cons!13446 (h!14491 (_ BitVec 64)) (t!19765 List!13450)) )
))
(declare-fun acc!652 () List!13450)

(declare-fun contains!4027 (List!13450 (_ BitVec 64)) Bool)

(assert (=> b!715964 (= res!478945 (not (contains!4027 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715965 () Bool)

(declare-fun res!478943 () Bool)

(assert (=> b!715965 (=> (not res!478943) (not e!401920))))

(assert (=> b!715965 (= res!478943 (not (contains!4027 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715966 () Bool)

(declare-fun res!478941 () Bool)

(assert (=> b!715966 (=> (not res!478941) (not e!401920))))

(declare-fun newAcc!49 () List!13450)

(declare-fun subseq!472 (List!13450 List!13450) Bool)

(assert (=> b!715966 (= res!478941 (subseq!472 acc!652 newAcc!49))))

(declare-fun b!715967 () Bool)

(declare-fun res!478944 () Bool)

(assert (=> b!715967 (=> (not res!478944) (not e!401920))))

(declare-fun arrayNoDuplicates!0 (array!40544 (_ BitVec 32) List!13450) Bool)

(assert (=> b!715967 (= res!478944 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!715968 () Bool)

(declare-fun res!478950 () Bool)

(assert (=> b!715968 (=> (not res!478950) (not e!401920))))

(assert (=> b!715968 (= res!478950 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!715969 () Bool)

(declare-fun res!478948 () Bool)

(assert (=> b!715969 (=> (not res!478948) (not e!401920))))

(declare-fun noDuplicate!1274 (List!13450) Bool)

(assert (=> b!715969 (= res!478948 (noDuplicate!1274 acc!652))))

(declare-fun b!715970 () Bool)

(declare-fun res!478938 () Bool)

(assert (=> b!715970 (=> (not res!478938) (not e!401920))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715970 (= res!478938 (validKeyInArray!0 k!2824))))

(declare-fun b!715971 () Bool)

(assert (=> b!715971 (= e!401920 (not (arrayNoDuplicates!0 a!3591 from!2969 newAcc!49)))))

(assert (=> b!715971 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-datatypes ((Unit!24640 0))(
  ( (Unit!24641) )
))
(declare-fun lt!318860 () Unit!24640)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40544 (_ BitVec 64) (_ BitVec 32) List!13450 List!13450) Unit!24640)

(assert (=> b!715971 (= lt!318860 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(declare-fun b!715972 () Bool)

(declare-fun res!478951 () Bool)

(assert (=> b!715972 (=> (not res!478951) (not e!401920))))

(assert (=> b!715972 (= res!478951 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715973 () Bool)

(declare-fun res!478937 () Bool)

(assert (=> b!715973 (=> (not res!478937) (not e!401920))))

(assert (=> b!715973 (= res!478937 (noDuplicate!1274 newAcc!49))))

(declare-fun b!715974 () Bool)

(declare-fun res!478940 () Bool)

(assert (=> b!715974 (=> (not res!478940) (not e!401920))))

(assert (=> b!715974 (= res!478940 (contains!4027 newAcc!49 k!2824))))

(declare-fun b!715975 () Bool)

(declare-fun res!478934 () Bool)

(assert (=> b!715975 (=> (not res!478934) (not e!401920))))

(assert (=> b!715975 (= res!478934 (not (validKeyInArray!0 (select (arr!19409 a!3591) from!2969))))))

(declare-fun b!715976 () Bool)

(declare-fun res!478933 () Bool)

(assert (=> b!715976 (=> (not res!478933) (not e!401920))))

(assert (=> b!715976 (= res!478933 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19825 a!3591)))))

(declare-fun res!478939 () Bool)

(assert (=> start!63530 (=> (not res!478939) (not e!401920))))

(assert (=> start!63530 (= res!478939 (and (bvslt (size!19825 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19825 a!3591))))))

(assert (=> start!63530 e!401920))

(assert (=> start!63530 true))

(declare-fun array_inv!15205 (array!40544) Bool)

(assert (=> start!63530 (array_inv!15205 a!3591)))

(declare-fun b!715977 () Bool)

(declare-fun res!478942 () Bool)

(assert (=> b!715977 (=> (not res!478942) (not e!401920))))

(assert (=> b!715977 (= res!478942 (not (contains!4027 acc!652 k!2824)))))

(declare-fun b!715978 () Bool)

(declare-fun res!478935 () Bool)

(assert (=> b!715978 (=> (not res!478935) (not e!401920))))

(declare-fun -!437 (List!13450 (_ BitVec 64)) List!13450)

(assert (=> b!715978 (= res!478935 (= (-!437 newAcc!49 k!2824) acc!652))))

(declare-fun b!715979 () Bool)

(declare-fun res!478946 () Bool)

(assert (=> b!715979 (=> (not res!478946) (not e!401920))))

(assert (=> b!715979 (= res!478946 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!715980 () Bool)

(declare-fun res!478936 () Bool)

(assert (=> b!715980 (=> (not res!478936) (not e!401920))))

(assert (=> b!715980 (= res!478936 (not (contains!4027 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715981 () Bool)

(declare-fun res!478947 () Bool)

(assert (=> b!715981 (=> (not res!478947) (not e!401920))))

(assert (=> b!715981 (= res!478947 (not (contains!4027 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!63530 res!478939) b!715969))

(assert (= (and b!715969 res!478948) b!715973))

(assert (= (and b!715973 res!478937) b!715964))

(assert (= (and b!715964 res!478945) b!715965))

(assert (= (and b!715965 res!478943) b!715963))

(assert (= (and b!715963 res!478949) b!715977))

(assert (= (and b!715977 res!478942) b!715970))

(assert (= (and b!715970 res!478938) b!715967))

(assert (= (and b!715967 res!478944) b!715966))

(assert (= (and b!715966 res!478941) b!715974))

(assert (= (and b!715974 res!478940) b!715978))

(assert (= (and b!715978 res!478935) b!715980))

(assert (= (and b!715980 res!478936) b!715981))

(assert (= (and b!715981 res!478947) b!715976))

(assert (= (and b!715976 res!478933) b!715975))

(assert (= (and b!715975 res!478934) b!715968))

(assert (= (and b!715968 res!478950) b!715972))

(assert (= (and b!715972 res!478951) b!715979))

(assert (= (and b!715979 res!478946) b!715971))

(declare-fun m!672031 () Bool)

(assert (=> b!715967 m!672031))

(declare-fun m!672033 () Bool)

(assert (=> b!715979 m!672033))

(declare-fun m!672035 () Bool)

(assert (=> b!715970 m!672035))

(declare-fun m!672037 () Bool)

(assert (=> b!715981 m!672037))

(declare-fun m!672039 () Bool)

(assert (=> b!715978 m!672039))

(declare-fun m!672041 () Bool)

(assert (=> b!715969 m!672041))

(declare-fun m!672043 () Bool)

(assert (=> b!715973 m!672043))

(declare-fun m!672045 () Bool)

(assert (=> b!715974 m!672045))

(declare-fun m!672047 () Bool)

(assert (=> b!715980 m!672047))

(declare-fun m!672049 () Bool)

(assert (=> b!715977 m!672049))

(declare-fun m!672051 () Bool)

(assert (=> b!715966 m!672051))

(declare-fun m!672053 () Bool)

(assert (=> b!715971 m!672053))

(declare-fun m!672055 () Bool)

(assert (=> b!715971 m!672055))

(declare-fun m!672057 () Bool)

(assert (=> b!715971 m!672057))

(declare-fun m!672059 () Bool)

(assert (=> b!715964 m!672059))

(declare-fun m!672061 () Bool)

(assert (=> b!715963 m!672061))

(declare-fun m!672063 () Bool)

(assert (=> start!63530 m!672063))

(declare-fun m!672065 () Bool)

(assert (=> b!715975 m!672065))

(assert (=> b!715975 m!672065))

(declare-fun m!672067 () Bool)

(assert (=> b!715975 m!672067))

(declare-fun m!672069 () Bool)

(assert (=> b!715965 m!672069))

(declare-fun m!672071 () Bool)

(assert (=> b!715972 m!672071))

(push 1)

(assert (not b!715967))

(assert (not b!715973))

(assert (not b!715971))

(assert (not b!715964))

(assert (not b!715975))

(assert (not b!715963))

(assert (not b!715979))

(assert (not b!715965))

(assert (not b!715974))

(assert (not b!715972))

(assert (not b!715966))

(assert (not b!715969))

(assert (not b!715978))

(assert (not b!715970))

(assert (not b!715981))

(assert (not start!63530))

(assert (not b!715980))

(assert (not b!715977))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98461 () Bool)

(declare-fun res!478993 () Bool)

(declare-fun e!401966 () Bool)

(assert (=> d!98461 (=> res!478993 e!401966)))

(assert (=> d!98461 (= res!478993 (= (select (arr!19409 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k!2824))))

(assert (=> d!98461 (= (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!401966)))

(declare-fun b!716029 () Bool)

(declare-fun e!401967 () Bool)

(assert (=> b!716029 (= e!401966 e!401967)))

(declare-fun res!478994 () Bool)

(assert (=> b!716029 (=> (not res!478994) (not e!401967))))

(assert (=> b!716029 (= res!478994 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19825 a!3591)))))

(declare-fun b!716030 () Bool)

(assert (=> b!716030 (= e!401967 (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98461 (not res!478993)) b!716029))

(assert (= (and b!716029 res!478994) b!716030))

(declare-fun m!672103 () Bool)

(assert (=> d!98461 m!672103))

(declare-fun m!672105 () Bool)

(assert (=> b!716030 m!672105))

(assert (=> b!715972 d!98461))

(declare-fun d!98469 () Bool)

(assert (=> d!98469 (= (validKeyInArray!0 k!2824) (and (not (= k!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!715970 d!98469))

(declare-fun d!98477 () Bool)

(declare-fun lt!318869 () Bool)

(declare-fun content!371 (List!13450) (Set (_ BitVec 64)))

(assert (=> d!98477 (= lt!318869 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!371 newAcc!49)))))

(declare-fun e!401994 () Bool)

(assert (=> d!98477 (= lt!318869 e!401994)))

(declare-fun res!479019 () Bool)

(assert (=> d!98477 (=> (not res!479019) (not e!401994))))

(assert (=> d!98477 (= res!479019 (is-Cons!13446 newAcc!49))))

(assert (=> d!98477 (= (contains!4027 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318869)))

(declare-fun b!716062 () Bool)

(declare-fun e!401995 () Bool)

(assert (=> b!716062 (= e!401994 e!401995)))

(declare-fun res!479018 () Bool)

(assert (=> b!716062 (=> res!479018 e!401995)))

(assert (=> b!716062 (= res!479018 (= (h!14491 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!716063 () Bool)

(assert (=> b!716063 (= e!401995 (contains!4027 (t!19765 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98477 res!479019) b!716062))

(assert (= (and b!716062 (not res!479018)) b!716063))

(declare-fun m!672129 () Bool)

(assert (=> d!98477 m!672129))

(declare-fun m!672131 () Bool)

(assert (=> d!98477 m!672131))

(declare-fun m!672133 () Bool)

(assert (=> b!716063 m!672133))

(assert (=> b!715981 d!98477))

(declare-fun b!716096 () Bool)

(declare-fun e!402024 () Bool)

(declare-fun call!34647 () Bool)

(assert (=> b!716096 (= e!402024 call!34647)))

(declare-fun b!716097 () Bool)

(assert (=> b!716097 (= e!402024 call!34647)))

(declare-fun bm!34644 () Bool)

(declare-fun c!78898 () Bool)

(assert (=> bm!34644 (= call!34647 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78898 (Cons!13446 (select (arr!19409 a!3591) from!2969) newAcc!49) newAcc!49)))))

(declare-fun e!402023 () Bool)

(declare-fun b!716098 () Bool)

(assert (=> b!716098 (= e!402023 (contains!4027 newAcc!49 (select (arr!19409 a!3591) from!2969)))))

(declare-fun b!716099 () Bool)

(declare-fun e!402021 () Bool)

(assert (=> b!716099 (= e!402021 e!402024)))

(assert (=> b!716099 (= c!78898 (validKeyInArray!0 (select (arr!19409 a!3591) from!2969)))))

(declare-fun b!716100 () Bool)

(declare-fun e!402022 () Bool)

(assert (=> b!716100 (= e!402022 e!402021)))

(declare-fun res!479034 () Bool)

(assert (=> b!716100 (=> (not res!479034) (not e!402021))))

(assert (=> b!716100 (= res!479034 (not e!402023))))

(declare-fun res!479036 () Bool)

(assert (=> b!716100 (=> (not res!479036) (not e!402023))))

(assert (=> b!716100 (= res!479036 (validKeyInArray!0 (select (arr!19409 a!3591) from!2969)))))

(declare-fun d!98487 () Bool)

(declare-fun res!479035 () Bool)

(assert (=> d!98487 (=> res!479035 e!402022)))

(assert (=> d!98487 (= res!479035 (bvsge from!2969 (size!19825 a!3591)))))

(assert (=> d!98487 (= (arrayNoDuplicates!0 a!3591 from!2969 newAcc!49) e!402022)))

(assert (= (and d!98487 (not res!479035)) b!716100))

(assert (= (and b!716100 res!479036) b!716098))

(assert (= (and b!716100 res!479034) b!716099))

(assert (= (and b!716099 c!78898) b!716097))

(assert (= (and b!716099 (not c!78898)) b!716096))

(assert (= (or b!716097 b!716096) bm!34644))

(assert (=> bm!34644 m!672065))

(declare-fun m!672149 () Bool)

(assert (=> bm!34644 m!672149))

(assert (=> b!716098 m!672065))

(assert (=> b!716098 m!672065))

(declare-fun m!672151 () Bool)

(assert (=> b!716098 m!672151))

(assert (=> b!716099 m!672065))

(assert (=> b!716099 m!672065))

(assert (=> b!716099 m!672067))

(assert (=> b!716100 m!672065))

(assert (=> b!716100 m!672065))

(assert (=> b!716100 m!672067))

(assert (=> b!715971 d!98487))

(declare-fun b!716101 () Bool)

(declare-fun e!402028 () Bool)

(declare-fun call!34648 () Bool)

(assert (=> b!716101 (= e!402028 call!34648)))

(declare-fun b!716102 () Bool)

(assert (=> b!716102 (= e!402028 call!34648)))

(declare-fun bm!34645 () Bool)

(declare-fun c!78899 () Bool)

(assert (=> bm!34645 (= call!34648 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78899 (Cons!13446 (select (arr!19409 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) newAcc!49) newAcc!49)))))

(declare-fun e!402027 () Bool)

(declare-fun b!716103 () Bool)

(assert (=> b!716103 (= e!402027 (contains!4027 newAcc!49 (select (arr!19409 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!716104 () Bool)

(declare-fun e!402025 () Bool)

(assert (=> b!716104 (= e!402025 e!402028)))

(assert (=> b!716104 (= c!78899 (validKeyInArray!0 (select (arr!19409 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!716105 () Bool)

(declare-fun e!402026 () Bool)

(assert (=> b!716105 (= e!402026 e!402025)))

(declare-fun res!479037 () Bool)

(assert (=> b!716105 (=> (not res!479037) (not e!402025))))

(assert (=> b!716105 (= res!479037 (not e!402027))))

(declare-fun res!479039 () Bool)

(assert (=> b!716105 (=> (not res!479039) (not e!402027))))

(assert (=> b!716105 (= res!479039 (validKeyInArray!0 (select (arr!19409 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun d!98495 () Bool)

(declare-fun res!479038 () Bool)

(assert (=> d!98495 (=> res!479038 e!402026)))

(assert (=> d!98495 (= res!479038 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19825 a!3591)))))

(assert (=> d!98495 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49) e!402026)))

(assert (= (and d!98495 (not res!479038)) b!716105))

(assert (= (and b!716105 res!479039) b!716103))

(assert (= (and b!716105 res!479037) b!716104))

(assert (= (and b!716104 c!78899) b!716102))

(assert (= (and b!716104 (not c!78899)) b!716101))

(assert (= (or b!716102 b!716101) bm!34645))

(assert (=> bm!34645 m!672103))

(declare-fun m!672155 () Bool)

(assert (=> bm!34645 m!672155))

(assert (=> b!716103 m!672103))

(assert (=> b!716103 m!672103))

(declare-fun m!672157 () Bool)

(assert (=> b!716103 m!672157))

(assert (=> b!716104 m!672103))

(assert (=> b!716104 m!672103))

(declare-fun m!672159 () Bool)

(assert (=> b!716104 m!672159))

(assert (=> b!716105 m!672103))

(assert (=> b!716105 m!672103))

(assert (=> b!716105 m!672159))

(assert (=> b!715971 d!98495))

(declare-fun d!98499 () Bool)

(assert (=> d!98499 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-fun lt!318883 () Unit!24640)

(declare-fun choose!66 (array!40544 (_ BitVec 64) (_ BitVec 32) List!13450 List!13450) Unit!24640)

(assert (=> d!98499 (= lt!318883 (choose!66 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(assert (=> d!98499 (bvslt (size!19825 a!3591) #b01111111111111111111111111111111)))

(assert (=> d!98499 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49) lt!318883)))

(declare-fun bs!20610 () Bool)

(assert (= bs!20610 d!98499))

(assert (=> bs!20610 m!672055))

(declare-fun m!672175 () Bool)

(assert (=> bs!20610 m!672175))

(assert (=> b!715971 d!98499))

(declare-fun d!98505 () Bool)

(declare-fun lt!318884 () Bool)

(assert (=> d!98505 (= lt!318884 (member k!2824 (content!371 newAcc!49)))))

(declare-fun e!402040 () Bool)

(assert (=> d!98505 (= lt!318884 e!402040)))

(declare-fun res!479049 () Bool)

(assert (=> d!98505 (=> (not res!479049) (not e!402040))))

(assert (=> d!98505 (= res!479049 (is-Cons!13446 newAcc!49))))

(assert (=> d!98505 (= (contains!4027 newAcc!49 k!2824) lt!318884)))

(declare-fun b!716120 () Bool)

(declare-fun e!402041 () Bool)

(assert (=> b!716120 (= e!402040 e!402041)))

(declare-fun res!479048 () Bool)

(assert (=> b!716120 (=> res!479048 e!402041)))

(assert (=> b!716120 (= res!479048 (= (h!14491 newAcc!49) k!2824))))

(declare-fun b!716121 () Bool)

(assert (=> b!716121 (= e!402041 (contains!4027 (t!19765 newAcc!49) k!2824))))

(assert (= (and d!98505 res!479049) b!716120))

(assert (= (and b!716120 (not res!479048)) b!716121))

(assert (=> d!98505 m!672129))

(declare-fun m!672177 () Bool)

(assert (=> d!98505 m!672177))

(declare-fun m!672179 () Bool)

(assert (=> b!716121 m!672179))

(assert (=> b!715974 d!98505))

(declare-fun d!98507 () Bool)

(declare-fun lt!318885 () Bool)

(assert (=> d!98507 (= lt!318885 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!371 acc!652)))))

(declare-fun e!402050 () Bool)

(assert (=> d!98507 (= lt!318885 e!402050)))

(declare-fun res!479059 () Bool)

(assert (=> d!98507 (=> (not res!479059) (not e!402050))))

(assert (=> d!98507 (= res!479059 (is-Cons!13446 acc!652))))

(assert (=> d!98507 (= (contains!4027 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318885)))

(declare-fun b!716130 () Bool)

(declare-fun e!402051 () Bool)

(assert (=> b!716130 (= e!402050 e!402051)))

(declare-fun res!479058 () Bool)

(assert (=> b!716130 (=> res!479058 e!402051)))

(assert (=> b!716130 (= res!479058 (= (h!14491 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!716131 () Bool)

(assert (=> b!716131 (= e!402051 (contains!4027 (t!19765 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98507 res!479059) b!716130))

(assert (= (and b!716130 (not res!479058)) b!716131))

(declare-fun m!672181 () Bool)

(assert (=> d!98507 m!672181))

(declare-fun m!672183 () Bool)

(assert (=> d!98507 m!672183))

(declare-fun m!672185 () Bool)

(assert (=> b!716131 m!672185))

(assert (=> b!715964 d!98507))

(declare-fun d!98509 () Bool)

(assert (=> d!98509 (= (validKeyInArray!0 (select (arr!19409 a!3591) from!2969)) (and (not (= (select (arr!19409 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19409 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!715975 d!98509))

(declare-fun d!98513 () Bool)

(declare-fun res!479076 () Bool)

(declare-fun e!402068 () Bool)

(assert (=> d!98513 (=> res!479076 e!402068)))

(assert (=> d!98513 (= res!479076 (is-Nil!13447 newAcc!49))))

(assert (=> d!98513 (= (noDuplicate!1274 newAcc!49) e!402068)))

