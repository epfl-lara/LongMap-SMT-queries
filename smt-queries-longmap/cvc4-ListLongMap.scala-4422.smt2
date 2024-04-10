; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61182 () Bool)

(assert start!61182)

(declare-fun b!685832 () Bool)

(declare-fun res!451118 () Bool)

(declare-fun e!390537 () Bool)

(assert (=> b!685832 (=> (not res!451118) (not e!390537))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!685832 (= res!451118 (validKeyInArray!0 k!2843))))

(declare-fun b!685833 () Bool)

(declare-fun res!451115 () Bool)

(assert (=> b!685833 (=> (not res!451115) (not e!390537))))

(declare-datatypes ((array!39641 0))(
  ( (array!39642 (arr!18998 (Array (_ BitVec 32) (_ BitVec 64))) (size!19370 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39641)

(declare-datatypes ((List!13039 0))(
  ( (Nil!13036) (Cons!13035 (h!14080 (_ BitVec 64)) (t!19291 List!13039)) )
))
(declare-fun arrayNoDuplicates!0 (array!39641 (_ BitVec 32) List!13039) Bool)

(assert (=> b!685833 (= res!451115 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13036))))

(declare-fun b!685834 () Bool)

(declare-datatypes ((Unit!24157 0))(
  ( (Unit!24158) )
))
(declare-fun e!390535 () Unit!24157)

(declare-fun lt!314807 () Unit!24157)

(assert (=> b!685834 (= e!390535 lt!314807)))

(declare-fun lt!314804 () Unit!24157)

(declare-fun acc!681 () List!13039)

(declare-fun lemmaListSubSeqRefl!0 (List!13039) Unit!24157)

(assert (=> b!685834 (= lt!314804 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!202 (List!13039 List!13039) Bool)

(assert (=> b!685834 (subseq!202 acc!681 acc!681)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39641 List!13039 List!13039 (_ BitVec 32)) Unit!24157)

(declare-fun $colon$colon!367 (List!13039 (_ BitVec 64)) List!13039)

(assert (=> b!685834 (= lt!314807 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!367 acc!681 (select (arr!18998 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!685834 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!685835 () Bool)

(declare-fun res!451127 () Bool)

(assert (=> b!685835 (=> (not res!451127) (not e!390537))))

(declare-fun contains!3616 (List!13039 (_ BitVec 64)) Bool)

(assert (=> b!685835 (= res!451127 (not (contains!3616 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685836 () Bool)

(declare-fun res!451113 () Bool)

(declare-fun e!390539 () Bool)

(assert (=> b!685836 (=> res!451113 e!390539)))

(declare-fun lt!314805 () List!13039)

(declare-fun noDuplicate!863 (List!13039) Bool)

(assert (=> b!685836 (= res!451113 (not (noDuplicate!863 lt!314805)))))

(declare-fun b!685837 () Bool)

(declare-fun e!390536 () Bool)

(assert (=> b!685837 (= e!390539 e!390536)))

(declare-fun res!451112 () Bool)

(assert (=> b!685837 (=> (not res!451112) (not e!390536))))

(assert (=> b!685837 (= res!451112 (not (contains!3616 lt!314805 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685838 () Bool)

(declare-fun res!451114 () Bool)

(assert (=> b!685838 (=> (not res!451114) (not e!390537))))

(assert (=> b!685838 (= res!451114 (not (contains!3616 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685839 () Bool)

(declare-fun res!451119 () Bool)

(assert (=> b!685839 (=> (not res!451119) (not e!390537))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!685839 (= res!451119 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19370 a!3626))))))

(declare-fun b!685840 () Bool)

(declare-fun e!390538 () Bool)

(assert (=> b!685840 (= e!390538 (contains!3616 acc!681 k!2843))))

(declare-fun res!451129 () Bool)

(assert (=> start!61182 (=> (not res!451129) (not e!390537))))

(assert (=> start!61182 (= res!451129 (and (bvslt (size!19370 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19370 a!3626))))))

(assert (=> start!61182 e!390537))

(assert (=> start!61182 true))

(declare-fun array_inv!14794 (array!39641) Bool)

(assert (=> start!61182 (array_inv!14794 a!3626)))

(declare-fun b!685841 () Bool)

(assert (=> b!685841 (= e!390537 (not e!390539))))

(declare-fun res!451111 () Bool)

(assert (=> b!685841 (=> res!451111 e!390539)))

(assert (=> b!685841 (= res!451111 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!167 (List!13039 (_ BitVec 64)) List!13039)

(assert (=> b!685841 (= (-!167 lt!314805 k!2843) acc!681)))

(assert (=> b!685841 (= lt!314805 ($colon$colon!367 acc!681 k!2843))))

(declare-fun lt!314806 () Unit!24157)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13039) Unit!24157)

(assert (=> b!685841 (= lt!314806 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!685841 (subseq!202 acc!681 acc!681)))

(declare-fun lt!314808 () Unit!24157)

(assert (=> b!685841 (= lt!314808 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!685841 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314812 () Unit!24157)

(assert (=> b!685841 (= lt!314812 e!390535)))

(declare-fun c!77729 () Bool)

(assert (=> b!685841 (= c!77729 (validKeyInArray!0 (select (arr!18998 a!3626) from!3004)))))

(declare-fun lt!314810 () Unit!24157)

(declare-fun e!390543 () Unit!24157)

(assert (=> b!685841 (= lt!314810 e!390543)))

(declare-fun c!77728 () Bool)

(declare-fun lt!314809 () Bool)

(assert (=> b!685841 (= c!77728 lt!314809)))

(declare-fun arrayContainsKey!0 (array!39641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!685841 (= lt!314809 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!685841 (arrayContainsKey!0 (array!39642 (store (arr!18998 a!3626) i!1382 k!2843) (size!19370 a!3626)) k!2843 from!3004)))

(declare-fun b!685842 () Bool)

(declare-fun res!451110 () Bool)

(assert (=> b!685842 (=> res!451110 e!390539)))

(assert (=> b!685842 (= res!451110 (contains!3616 acc!681 k!2843))))

(declare-fun b!685843 () Bool)

(declare-fun Unit!24159 () Unit!24157)

(assert (=> b!685843 (= e!390535 Unit!24159)))

(declare-fun b!685844 () Bool)

(declare-fun res!451128 () Bool)

(assert (=> b!685844 (=> (not res!451128) (not e!390537))))

(declare-fun e!390540 () Bool)

(assert (=> b!685844 (= res!451128 e!390540)))

(declare-fun res!451130 () Bool)

(assert (=> b!685844 (=> res!451130 e!390540)))

(assert (=> b!685844 (= res!451130 e!390538)))

(declare-fun res!451124 () Bool)

(assert (=> b!685844 (=> (not res!451124) (not e!390538))))

(assert (=> b!685844 (= res!451124 (bvsgt from!3004 i!1382))))

(declare-fun b!685845 () Bool)

(declare-fun res!451126 () Bool)

(assert (=> b!685845 (=> res!451126 e!390539)))

(assert (=> b!685845 (= res!451126 (not (contains!3616 lt!314805 k!2843)))))

(declare-fun b!685846 () Bool)

(declare-fun e!390541 () Bool)

(assert (=> b!685846 (= e!390540 e!390541)))

(declare-fun res!451116 () Bool)

(assert (=> b!685846 (=> (not res!451116) (not e!390541))))

(assert (=> b!685846 (= res!451116 (bvsle from!3004 i!1382))))

(declare-fun b!685847 () Bool)

(assert (=> b!685847 (= e!390541 (not (contains!3616 acc!681 k!2843)))))

(declare-fun b!685848 () Bool)

(declare-fun res!451120 () Bool)

(assert (=> b!685848 (=> res!451120 e!390539)))

(assert (=> b!685848 (= res!451120 lt!314809)))

(declare-fun b!685849 () Bool)

(declare-fun res!451122 () Bool)

(assert (=> b!685849 (=> (not res!451122) (not e!390537))))

(assert (=> b!685849 (= res!451122 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!685850 () Bool)

(declare-fun res!451125 () Bool)

(assert (=> b!685850 (=> res!451125 e!390539)))

(assert (=> b!685850 (= res!451125 (not (subseq!202 acc!681 lt!314805)))))

(declare-fun b!685851 () Bool)

(declare-fun res!451123 () Bool)

(assert (=> b!685851 (=> (not res!451123) (not e!390537))))

(assert (=> b!685851 (= res!451123 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19370 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!685852 () Bool)

(assert (=> b!685852 (= e!390536 (not (contains!3616 lt!314805 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685853 () Bool)

(declare-fun Unit!24160 () Unit!24157)

(assert (=> b!685853 (= e!390543 Unit!24160)))

(declare-fun lt!314811 () Unit!24157)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39641 (_ BitVec 64) (_ BitVec 32)) Unit!24157)

(assert (=> b!685853 (= lt!314811 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!685853 false))

(declare-fun b!685854 () Bool)

(declare-fun res!451117 () Bool)

(assert (=> b!685854 (=> (not res!451117) (not e!390537))))

(assert (=> b!685854 (= res!451117 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!685855 () Bool)

(declare-fun Unit!24161 () Unit!24157)

(assert (=> b!685855 (= e!390543 Unit!24161)))

(declare-fun b!685856 () Bool)

(declare-fun res!451121 () Bool)

(assert (=> b!685856 (=> (not res!451121) (not e!390537))))

(assert (=> b!685856 (= res!451121 (noDuplicate!863 acc!681))))

(assert (= (and start!61182 res!451129) b!685856))

(assert (= (and b!685856 res!451121) b!685835))

(assert (= (and b!685835 res!451127) b!685838))

(assert (= (and b!685838 res!451114) b!685844))

(assert (= (and b!685844 res!451124) b!685840))

(assert (= (and b!685844 (not res!451130)) b!685846))

(assert (= (and b!685846 res!451116) b!685847))

(assert (= (and b!685844 res!451128) b!685833))

(assert (= (and b!685833 res!451115) b!685849))

(assert (= (and b!685849 res!451122) b!685839))

(assert (= (and b!685839 res!451119) b!685832))

(assert (= (and b!685832 res!451118) b!685854))

(assert (= (and b!685854 res!451117) b!685851))

(assert (= (and b!685851 res!451123) b!685841))

(assert (= (and b!685841 c!77728) b!685853))

(assert (= (and b!685841 (not c!77728)) b!685855))

(assert (= (and b!685841 c!77729) b!685834))

(assert (= (and b!685841 (not c!77729)) b!685843))

(assert (= (and b!685841 (not res!451111)) b!685836))

(assert (= (and b!685836 (not res!451113)) b!685848))

(assert (= (and b!685848 (not res!451120)) b!685842))

(assert (= (and b!685842 (not res!451110)) b!685850))

(assert (= (and b!685850 (not res!451125)) b!685845))

(assert (= (and b!685845 (not res!451126)) b!685837))

(assert (= (and b!685837 res!451112) b!685852))

(declare-fun m!649947 () Bool)

(assert (=> b!685833 m!649947))

(declare-fun m!649949 () Bool)

(assert (=> b!685850 m!649949))

(declare-fun m!649951 () Bool)

(assert (=> b!685836 m!649951))

(declare-fun m!649953 () Bool)

(assert (=> b!685840 m!649953))

(declare-fun m!649955 () Bool)

(assert (=> b!685832 m!649955))

(assert (=> b!685847 m!649953))

(declare-fun m!649957 () Bool)

(assert (=> b!685845 m!649957))

(declare-fun m!649959 () Bool)

(assert (=> start!61182 m!649959))

(declare-fun m!649961 () Bool)

(assert (=> b!685854 m!649961))

(declare-fun m!649963 () Bool)

(assert (=> b!685853 m!649963))

(declare-fun m!649965 () Bool)

(assert (=> b!685834 m!649965))

(declare-fun m!649967 () Bool)

(assert (=> b!685834 m!649967))

(declare-fun m!649969 () Bool)

(assert (=> b!685834 m!649969))

(declare-fun m!649971 () Bool)

(assert (=> b!685834 m!649971))

(assert (=> b!685834 m!649967))

(assert (=> b!685834 m!649969))

(declare-fun m!649973 () Bool)

(assert (=> b!685834 m!649973))

(declare-fun m!649975 () Bool)

(assert (=> b!685834 m!649975))

(assert (=> b!685842 m!649953))

(declare-fun m!649977 () Bool)

(assert (=> b!685838 m!649977))

(declare-fun m!649979 () Bool)

(assert (=> b!685852 m!649979))

(declare-fun m!649981 () Bool)

(assert (=> b!685835 m!649981))

(declare-fun m!649983 () Bool)

(assert (=> b!685849 m!649983))

(declare-fun m!649985 () Bool)

(assert (=> b!685856 m!649985))

(declare-fun m!649987 () Bool)

(assert (=> b!685837 m!649987))

(assert (=> b!685841 m!649965))

(assert (=> b!685841 m!649967))

(declare-fun m!649989 () Bool)

(assert (=> b!685841 m!649989))

(declare-fun m!649991 () Bool)

(assert (=> b!685841 m!649991))

(assert (=> b!685841 m!649973))

(declare-fun m!649993 () Bool)

(assert (=> b!685841 m!649993))

(assert (=> b!685841 m!649967))

(declare-fun m!649995 () Bool)

(assert (=> b!685841 m!649995))

(declare-fun m!649997 () Bool)

(assert (=> b!685841 m!649997))

(declare-fun m!649999 () Bool)

(assert (=> b!685841 m!649999))

(declare-fun m!650001 () Bool)

(assert (=> b!685841 m!650001))

(assert (=> b!685841 m!649975))

(push 1)

(assert (not b!685840))

(assert (not b!685853))

(assert (not b!685847))

(assert (not b!685837))

(assert (not b!685849))

(assert (not b!685838))

(assert (not b!685856))

(assert (not b!685835))

(assert (not start!61182))

(assert (not b!685836))

(assert (not b!685845))

(assert (not b!685832))

(assert (not b!685841))

(assert (not b!685834))

(assert (not b!685842))

(assert (not b!685833))

(assert (not b!685852))

(assert (not b!685850))

(assert (not b!685854))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94611 () Bool)

(declare-fun lt!314825 () Bool)

(declare-fun content!292 (List!13039) (Set (_ BitVec 64)))

(assert (=> d!94611 (= lt!314825 (member k!2843 (content!292 acc!681)))))

(declare-fun e!390562 () Bool)

(assert (=> d!94611 (= lt!314825 e!390562)))

(declare-fun res!451149 () Bool)

(assert (=> d!94611 (=> (not res!451149) (not e!390562))))

(assert (=> d!94611 (= res!451149 (is-Cons!13035 acc!681))))

(assert (=> d!94611 (= (contains!3616 acc!681 k!2843) lt!314825)))

(declare-fun b!685875 () Bool)

(declare-fun e!390563 () Bool)

(assert (=> b!685875 (= e!390562 e!390563)))

(declare-fun res!451150 () Bool)

(assert (=> b!685875 (=> res!451150 e!390563)))

(assert (=> b!685875 (= res!451150 (= (h!14080 acc!681) k!2843))))

(declare-fun b!685876 () Bool)

(assert (=> b!685876 (= e!390563 (contains!3616 (t!19291 acc!681) k!2843))))

(assert (= (and d!94611 res!451149) b!685875))

(assert (= (and b!685875 (not res!451150)) b!685876))

(declare-fun m!650029 () Bool)

(assert (=> d!94611 m!650029))

(declare-fun m!650031 () Bool)

(assert (=> d!94611 m!650031))

(declare-fun m!650033 () Bool)

(assert (=> b!685876 m!650033))

(assert (=> b!685840 d!94611))

(declare-fun b!685897 () Bool)

(declare-fun e!390581 () Bool)

(assert (=> b!685897 (= e!390581 (subseq!202 (t!19291 acc!681) (t!19291 lt!314805)))))

(declare-fun d!94619 () Bool)

(declare-fun res!451165 () Bool)

(declare-fun e!390582 () Bool)

(assert (=> d!94619 (=> res!451165 e!390582)))

(assert (=> d!94619 (= res!451165 (is-Nil!13036 acc!681))))

(assert (=> d!94619 (= (subseq!202 acc!681 lt!314805) e!390582)))

(declare-fun b!685898 () Bool)

(declare-fun e!390583 () Bool)

(assert (=> b!685898 (= e!390583 (subseq!202 acc!681 (t!19291 lt!314805)))))

(declare-fun b!685895 () Bool)

(declare-fun e!390580 () Bool)

(assert (=> b!685895 (= e!390582 e!390580)))

(declare-fun res!451167 () Bool)

(assert (=> b!685895 (=> (not res!451167) (not e!390580))))

(assert (=> b!685895 (= res!451167 (is-Cons!13035 lt!314805))))

(declare-fun b!685896 () Bool)

(assert (=> b!685896 (= e!390580 e!390583)))

(declare-fun res!451166 () Bool)

(assert (=> b!685896 (=> res!451166 e!390583)))

(assert (=> b!685896 (= res!451166 e!390581)))

(declare-fun res!451168 () Bool)

(assert (=> b!685896 (=> (not res!451168) (not e!390581))))

(assert (=> b!685896 (= res!451168 (= (h!14080 acc!681) (h!14080 lt!314805)))))

(assert (= (and d!94619 (not res!451165)) b!685895))

(assert (= (and b!685895 res!451167) b!685896))

(assert (= (and b!685896 res!451168) b!685897))

(assert (= (and b!685896 (not res!451166)) b!685898))

(declare-fun m!650035 () Bool)

(assert (=> b!685897 m!650035))

(declare-fun m!650037 () Bool)

(assert (=> b!685898 m!650037))

(assert (=> b!685850 d!94619))

(declare-fun d!94623 () Bool)

(assert (=> d!94623 (= (array_inv!14794 a!3626) (bvsge (size!19370 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61182 d!94623))

(declare-fun bm!34081 () Bool)

(declare-fun call!34084 () Bool)

(declare-fun c!77739 () Bool)

(assert (=> bm!34081 (= call!34084 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77739 (Cons!13035 (select (arr!18998 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!685942 () Bool)

(declare-fun e!390623 () Bool)

(assert (=> b!685942 (= e!390623 (contains!3616 acc!681 (select (arr!18998 a!3626) from!3004)))))

(declare-fun d!94625 () Bool)

(declare-fun res!451200 () Bool)

(declare-fun e!390624 () Bool)

(assert (=> d!94625 (=> res!451200 e!390624)))

(assert (=> d!94625 (= res!451200 (bvsge from!3004 (size!19370 a!3626)))))

(assert (=> d!94625 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!390624)))

(declare-fun b!685943 () Bool)

(declare-fun e!390622 () Bool)

(declare-fun e!390621 () Bool)

(assert (=> b!685943 (= e!390622 e!390621)))

(assert (=> b!685943 (= c!77739 (validKeyInArray!0 (select (arr!18998 a!3626) from!3004)))))

(declare-fun b!685944 () Bool)

(assert (=> b!685944 (= e!390624 e!390622)))

(declare-fun res!451198 () Bool)

(assert (=> b!685944 (=> (not res!451198) (not e!390622))))

(assert (=> b!685944 (= res!451198 (not e!390623))))

(declare-fun res!451199 () Bool)

(assert (=> b!685944 (=> (not res!451199) (not e!390623))))

(assert (=> b!685944 (= res!451199 (validKeyInArray!0 (select (arr!18998 a!3626) from!3004)))))

(declare-fun b!685945 () Bool)

(assert (=> b!685945 (= e!390621 call!34084)))

(declare-fun b!685946 () Bool)

(assert (=> b!685946 (= e!390621 call!34084)))

(assert (= (and d!94625 (not res!451200)) b!685944))

(assert (= (and b!685944 res!451199) b!685942))

(assert (= (and b!685944 res!451198) b!685943))

(assert (= (and b!685943 c!77739) b!685945))

(assert (= (and b!685943 (not c!77739)) b!685946))

(assert (= (or b!685945 b!685946) bm!34081))

(assert (=> bm!34081 m!649967))

(declare-fun m!650053 () Bool)

(assert (=> bm!34081 m!650053))

(assert (=> b!685942 m!649967))

(assert (=> b!685942 m!649967))

(declare-fun m!650055 () Bool)

(assert (=> b!685942 m!650055))

(assert (=> b!685943 m!649967))

(assert (=> b!685943 m!649967))

(assert (=> b!685943 m!649995))

(assert (=> b!685944 m!649967))

(assert (=> b!685944 m!649967))

(assert (=> b!685944 m!649995))

(assert (=> b!685849 d!94625))

(declare-fun d!94633 () Bool)

(declare-fun lt!314831 () Bool)

(assert (=> d!94633 (= lt!314831 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!292 acc!681)))))

(declare-fun e!390629 () Bool)

(assert (=> d!94633 (= lt!314831 e!390629)))

(declare-fun res!451205 () Bool)

(assert (=> d!94633 (=> (not res!451205) (not e!390629))))

(assert (=> d!94633 (= res!451205 (is-Cons!13035 acc!681))))

(assert (=> d!94633 (= (contains!3616 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!314831)))

(declare-fun b!685951 () Bool)

(declare-fun e!390630 () Bool)

(assert (=> b!685951 (= e!390629 e!390630)))

(declare-fun res!451206 () Bool)

(assert (=> b!685951 (=> res!451206 e!390630)))

(assert (=> b!685951 (= res!451206 (= (h!14080 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!685952 () Bool)

(assert (=> b!685952 (= e!390630 (contains!3616 (t!19291 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94633 res!451205) b!685951))

(assert (= (and b!685951 (not res!451206)) b!685952))

(assert (=> d!94633 m!650029))

(declare-fun m!650057 () Bool)

(assert (=> d!94633 m!650057))

(declare-fun m!650059 () Bool)

(assert (=> b!685952 m!650059))

(assert (=> b!685838 d!94633))

(declare-fun d!94635 () Bool)

(declare-fun lt!314832 () Bool)

(assert (=> d!94635 (= lt!314832 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!292 lt!314805)))))

(declare-fun e!390631 () Bool)

(assert (=> d!94635 (= lt!314832 e!390631)))

(declare-fun res!451207 () Bool)

(assert (=> d!94635 (=> (not res!451207) (not e!390631))))

(assert (=> d!94635 (= res!451207 (is-Cons!13035 lt!314805))))

(assert (=> d!94635 (= (contains!3616 lt!314805 #b0000000000000000000000000000000000000000000000000000000000000000) lt!314832)))

(declare-fun b!685953 () Bool)

(declare-fun e!390633 () Bool)

(assert (=> b!685953 (= e!390631 e!390633)))

(declare-fun res!451208 () Bool)

(assert (=> b!685953 (=> res!451208 e!390633)))

(assert (=> b!685953 (= res!451208 (= (h!14080 lt!314805) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!685954 () Bool)

(assert (=> b!685954 (= e!390633 (contains!3616 (t!19291 lt!314805) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94635 res!451207) b!685953))

(assert (= (and b!685953 (not res!451208)) b!685954))

(declare-fun m!650061 () Bool)

(assert (=> d!94635 m!650061))

(declare-fun m!650063 () Bool)

(assert (=> d!94635 m!650063))

(declare-fun m!650065 () Bool)

(assert (=> b!685954 m!650065))

(assert (=> b!685837 d!94635))

(assert (=> b!685847 d!94611))

(declare-fun d!94637 () Bool)

(declare-fun res!451216 () Bool)

(declare-fun e!390642 () Bool)

(assert (=> d!94637 (=> res!451216 e!390642)))

(assert (=> d!94637 (= res!451216 (is-Nil!13036 lt!314805))))

(assert (=> d!94637 (= (noDuplicate!863 lt!314805) e!390642)))

(declare-fun b!685966 () Bool)

(declare-fun e!390643 () Bool)

(assert (=> b!685966 (= e!390642 e!390643)))

(declare-fun res!451217 () Bool)

(assert (=> b!685966 (=> (not res!451217) (not e!390643))))

(assert (=> b!685966 (= res!451217 (not (contains!3616 (t!19291 lt!314805) (h!14080 lt!314805))))))

(declare-fun b!685967 () Bool)

(assert (=> b!685967 (= e!390643 (noDuplicate!863 (t!19291 lt!314805)))))

(assert (= (and d!94637 (not res!451216)) b!685966))

(assert (= (and b!685966 res!451217) b!685967))

(declare-fun m!650081 () Bool)

(assert (=> b!685966 m!650081))

(declare-fun m!650083 () Bool)

(assert (=> b!685967 m!650083))

(assert (=> b!685836 d!94637))

(declare-fun d!94643 () Bool)

(declare-fun lt!314836 () Bool)

(assert (=> d!94643 (= lt!314836 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!292 acc!681)))))

(declare-fun e!390648 () Bool)

(assert (=> d!94643 (= lt!314836 e!390648)))

(declare-fun res!451222 () Bool)

(assert (=> d!94643 (=> (not res!451222) (not e!390648))))

(assert (=> d!94643 (= res!451222 (is-Cons!13035 acc!681))))

(assert (=> d!94643 (= (contains!3616 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!314836)))

(declare-fun b!685972 () Bool)

(declare-fun e!390649 () Bool)

(assert (=> b!685972 (= e!390648 e!390649)))

(declare-fun res!451223 () Bool)

(assert (=> b!685972 (=> res!451223 e!390649)))

(assert (=> b!685972 (= res!451223 (= (h!14080 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!685973 () Bool)

(assert (=> b!685973 (= e!390649 (contains!3616 (t!19291 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94643 res!451222) b!685972))

(assert (= (and b!685972 (not res!451223)) b!685973))

(assert (=> d!94643 m!650029))

(declare-fun m!650085 () Bool)

(assert (=> d!94643 m!650085))

(declare-fun m!650089 () Bool)

(assert (=> b!685973 m!650089))

(assert (=> b!685835 d!94643))

(declare-fun d!94645 () Bool)

(declare-fun lt!314838 () Bool)

(assert (=> d!94645 (= lt!314838 (member k!2843 (content!292 lt!314805)))))

(declare-fun e!390654 () Bool)

(assert (=> d!94645 (= lt!314838 e!390654)))

(declare-fun res!451228 () Bool)

(assert (=> d!94645 (=> (not res!451228) (not e!390654))))

(assert (=> d!94645 (= res!451228 (is-Cons!13035 lt!314805))))

(assert (=> d!94645 (= (contains!3616 lt!314805 k!2843) lt!314838)))

(declare-fun b!685978 () Bool)

(declare-fun e!390655 () Bool)

(assert (=> b!685978 (= e!390654 e!390655)))

(declare-fun res!451229 () Bool)

(assert (=> b!685978 (=> res!451229 e!390655)))

(assert (=> b!685978 (= res!451229 (= (h!14080 lt!314805) k!2843))))

(declare-fun b!685979 () Bool)

(assert (=> b!685979 (= e!390655 (contains!3616 (t!19291 lt!314805) k!2843))))

(assert (= (and d!94645 res!451228) b!685978))

(assert (= (and b!685978 (not res!451229)) b!685979))

(assert (=> d!94645 m!650061))

(declare-fun m!650093 () Bool)

(assert (=> d!94645 m!650093))

(declare-fun m!650095 () Bool)

(assert (=> b!685979 m!650095))

(assert (=> b!685845 d!94645))

(declare-fun d!94649 () Bool)

(declare-fun res!451230 () Bool)

(declare-fun e!390656 () Bool)

(assert (=> d!94649 (=> res!451230 e!390656)))

(assert (=> d!94649 (= res!451230 (is-Nil!13036 acc!681))))

(assert (=> d!94649 (= (noDuplicate!863 acc!681) e!390656)))

(declare-fun b!685980 () Bool)

(declare-fun e!390657 () Bool)

(assert (=> b!685980 (= e!390656 e!390657)))

(declare-fun res!451231 () Bool)

(assert (=> b!685980 (=> (not res!451231) (not e!390657))))

(assert (=> b!685980 (= res!451231 (not (contains!3616 (t!19291 acc!681) (h!14080 acc!681))))))

(declare-fun b!685981 () Bool)

(assert (=> b!685981 (= e!390657 (noDuplicate!863 (t!19291 acc!681)))))

(assert (= (and d!94649 (not res!451230)) b!685980))

(assert (= (and b!685980 res!451231) b!685981))

(declare-fun m!650097 () Bool)

(assert (=> b!685980 m!650097))

(declare-fun m!650099 () Bool)

(assert (=> b!685981 m!650099))

(assert (=> b!685856 d!94649))

(declare-fun d!94651 () Bool)

(assert (=> d!94651 (= ($colon$colon!367 acc!681 (select (arr!18998 a!3626) from!3004)) (Cons!13035 (select (arr!18998 a!3626) from!3004) acc!681))))

(assert (=> b!685834 d!94651))

(declare-fun b!685988 () Bool)

(declare-fun e!390663 () Bool)

(assert (=> b!685988 (= e!390663 (subseq!202 (t!19291 acc!681) (t!19291 acc!681)))))

(declare-fun d!94653 () Bool)

(declare-fun res!451236 () Bool)

(declare-fun e!390664 () Bool)

(assert (=> d!94653 (=> res!451236 e!390664)))

(assert (=> d!94653 (= res!451236 (is-Nil!13036 acc!681))))

(assert (=> d!94653 (= (subseq!202 acc!681 acc!681) e!390664)))

(declare-fun b!685989 () Bool)

(declare-fun e!390665 () Bool)

(assert (=> b!685989 (= e!390665 (subseq!202 acc!681 (t!19291 acc!681)))))

(declare-fun b!685986 () Bool)

(declare-fun e!390662 () Bool)

(assert (=> b!685986 (= e!390664 e!390662)))

(declare-fun res!451238 () Bool)

(assert (=> b!685986 (=> (not res!451238) (not e!390662))))

(assert (=> b!685986 (= res!451238 (is-Cons!13035 acc!681))))

(declare-fun b!685987 () Bool)

(assert (=> b!685987 (= e!390662 e!390665)))

(declare-fun res!451237 () Bool)

(assert (=> b!685987 (=> res!451237 e!390665)))

(assert (=> b!685987 (= res!451237 e!390663)))

(declare-fun res!451239 () Bool)

(assert (=> b!685987 (=> (not res!451239) (not e!390663))))

(assert (=> b!685987 (= res!451239 (= (h!14080 acc!681) (h!14080 acc!681)))))

(assert (= (and d!94653 (not res!451236)) b!685986))

(assert (= (and b!685986 res!451238) b!685987))

(assert (= (and b!685987 res!451239) b!685988))

(assert (= (and b!685987 (not res!451237)) b!685989))

(declare-fun m!650103 () Bool)

(assert (=> b!685988 m!650103))

(declare-fun m!650107 () Bool)

(assert (=> b!685989 m!650107))

(assert (=> b!685834 d!94653))

(declare-fun d!94657 () Bool)

(assert (=> d!94657 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314843 () Unit!24157)

(declare-fun choose!80 (array!39641 List!13039 List!13039 (_ BitVec 32)) Unit!24157)

(assert (=> d!94657 (= lt!314843 (choose!80 a!3626 ($colon$colon!367 acc!681 (select (arr!18998 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94657 (bvslt (size!19370 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94657 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!367 acc!681 (select (arr!18998 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!314843)))

(declare-fun bs!20109 () Bool)

(assert (= bs!20109 d!94657))

(assert (=> bs!20109 m!649965))

(assert (=> bs!20109 m!649969))

(declare-fun m!650109 () Bool)

(assert (=> bs!20109 m!650109))

(assert (=> b!685834 d!94657))

(declare-fun d!94659 () Bool)

(assert (=> d!94659 (subseq!202 acc!681 acc!681)))

(declare-fun lt!314846 () Unit!24157)

(declare-fun choose!36 (List!13039) Unit!24157)

(assert (=> d!94659 (= lt!314846 (choose!36 acc!681))))

(assert (=> d!94659 (= (lemmaListSubSeqRefl!0 acc!681) lt!314846)))

(declare-fun bs!20110 () Bool)

(assert (= bs!20110 d!94659))

(assert (=> bs!20110 m!649975))

(declare-fun m!650115 () Bool)

(assert (=> bs!20110 m!650115))

(assert (=> b!685834 d!94659))

(declare-fun c!77746 () Bool)

(declare-fun call!34088 () Bool)

(declare-fun bm!34085 () Bool)

(assert (=> bm!34085 (= call!34088 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77746 (Cons!13035 (select (arr!18998 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!686006 () Bool)

(declare-fun e!390681 () Bool)

(assert (=> b!686006 (= e!390681 (contains!3616 acc!681 (select (arr!18998 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!94663 () Bool)

(declare-fun res!451250 () Bool)

(declare-fun e!390682 () Bool)

(assert (=> d!94663 (=> res!451250 e!390682)))

(assert (=> d!94663 (= res!451250 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19370 a!3626)))))

(assert (=> d!94663 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!390682)))

(declare-fun b!686007 () Bool)

(declare-fun e!390680 () Bool)

(declare-fun e!390679 () Bool)

(assert (=> b!686007 (= e!390680 e!390679)))

(assert (=> b!686007 (= c!77746 (validKeyInArray!0 (select (arr!18998 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!686008 () Bool)

(assert (=> b!686008 (= e!390682 e!390680)))

(declare-fun res!451248 () Bool)

(assert (=> b!686008 (=> (not res!451248) (not e!390680))))

(assert (=> b!686008 (= res!451248 (not e!390681))))

(declare-fun res!451249 () Bool)

(assert (=> b!686008 (=> (not res!451249) (not e!390681))))

(assert (=> b!686008 (= res!451249 (validKeyInArray!0 (select (arr!18998 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!686009 () Bool)

(assert (=> b!686009 (= e!390679 call!34088)))

(declare-fun b!686010 () Bool)

(assert (=> b!686010 (= e!390679 call!34088)))

(assert (= (and d!94663 (not res!451250)) b!686008))

(assert (= (and b!686008 res!451249) b!686006))

(assert (= (and b!686008 res!451248) b!686007))

(assert (= (and b!686007 c!77746) b!686009))

(assert (= (and b!686007 (not c!77746)) b!686010))

(assert (= (or b!686009 b!686010) bm!34085))

(declare-fun m!650117 () Bool)

(assert (=> bm!34085 m!650117))

(declare-fun m!650119 () Bool)

(assert (=> bm!34085 m!650119))

(assert (=> b!686006 m!650117))

(assert (=> b!686006 m!650117))

(declare-fun m!650121 () Bool)

(assert (=> b!686006 m!650121))

(assert (=> b!686007 m!650117))

(assert (=> b!686007 m!650117))

(declare-fun m!650127 () Bool)

(assert (=> b!686007 m!650127))

(assert (=> b!686008 m!650117))

(assert (=> b!686008 m!650117))

(assert (=> b!686008 m!650127))

(assert (=> b!685834 d!94663))

(declare-fun bm!34087 () Bool)

(declare-fun call!34090 () Bool)

(declare-fun c!77749 () Bool)

(assert (=> bm!34087 (= call!34090 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77749 (Cons!13035 (select (arr!18998 a!3626) #b00000000000000000000000000000000) Nil!13036) Nil!13036)))))

(declare-fun b!686016 () Bool)

