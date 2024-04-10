; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63088 () Bool)

(assert start!63088)

(declare-fun b!710833 () Bool)

(declare-fun res!474222 () Bool)

(declare-fun e!399982 () Bool)

(assert (=> b!710833 (=> (not res!474222) (not e!399982))))

(declare-datatypes ((List!13388 0))(
  ( (Nil!13385) (Cons!13384 (h!14429 (_ BitVec 64)) (t!19691 List!13388)) )
))
(declare-fun newAcc!49 () List!13388)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun acc!652 () List!13388)

(declare-fun -!375 (List!13388 (_ BitVec 64)) List!13388)

(assert (=> b!710833 (= res!474222 (= (-!375 newAcc!49 k!2824) acc!652))))

(declare-fun b!710834 () Bool)

(declare-fun res!474228 () Bool)

(declare-fun e!399983 () Bool)

(assert (=> b!710834 (=> (not res!474228) (not e!399983))))

(declare-fun lt!318383 () List!13388)

(declare-fun lt!318382 () List!13388)

(declare-fun subseq!410 (List!13388 List!13388) Bool)

(assert (=> b!710834 (= res!474228 (subseq!410 lt!318383 lt!318382))))

(declare-fun b!710835 () Bool)

(assert (=> b!710835 (= e!399982 e!399983)))

(declare-fun res!474210 () Bool)

(assert (=> b!710835 (=> (not res!474210) (not e!399983))))

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!710835 (= res!474210 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-datatypes ((array!40402 0))(
  ( (array!40403 (arr!19347 (Array (_ BitVec 32) (_ BitVec 64))) (size!19748 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40402)

(declare-fun $colon$colon!521 (List!13388 (_ BitVec 64)) List!13388)

(assert (=> b!710835 (= lt!318382 ($colon$colon!521 newAcc!49 (select (arr!19347 a!3591) from!2969)))))

(assert (=> b!710835 (= lt!318383 ($colon$colon!521 acc!652 (select (arr!19347 a!3591) from!2969)))))

(declare-fun b!710836 () Bool)

(declare-fun res!474215 () Bool)

(assert (=> b!710836 (=> (not res!474215) (not e!399983))))

(declare-fun arrayNoDuplicates!0 (array!40402 (_ BitVec 32) List!13388) Bool)

(assert (=> b!710836 (= res!474215 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318383))))

(declare-fun b!710837 () Bool)

(declare-fun res!474216 () Bool)

(assert (=> b!710837 (=> (not res!474216) (not e!399982))))

(declare-fun contains!3965 (List!13388 (_ BitVec 64)) Bool)

(assert (=> b!710837 (= res!474216 (not (contains!3965 acc!652 k!2824)))))

(declare-fun b!710838 () Bool)

(declare-fun res!474208 () Bool)

(assert (=> b!710838 (=> (not res!474208) (not e!399982))))

(assert (=> b!710838 (= res!474208 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19748 a!3591)))))

(declare-fun b!710839 () Bool)

(declare-fun res!474220 () Bool)

(assert (=> b!710839 (=> (not res!474220) (not e!399982))))

(assert (=> b!710839 (= res!474220 (not (contains!3965 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710840 () Bool)

(declare-fun res!474219 () Bool)

(assert (=> b!710840 (=> (not res!474219) (not e!399983))))

(assert (=> b!710840 (= res!474219 (not (contains!3965 lt!318383 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710841 () Bool)

(declare-fun res!474212 () Bool)

(assert (=> b!710841 (=> (not res!474212) (not e!399982))))

(declare-fun noDuplicate!1212 (List!13388) Bool)

(assert (=> b!710841 (= res!474212 (noDuplicate!1212 acc!652))))

(declare-fun b!710843 () Bool)

(declare-fun res!474207 () Bool)

(assert (=> b!710843 (=> (not res!474207) (not e!399983))))

(assert (=> b!710843 (= res!474207 (not (contains!3965 lt!318383 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710844 () Bool)

(declare-fun res!474206 () Bool)

(assert (=> b!710844 (=> (not res!474206) (not e!399983))))

(assert (=> b!710844 (= res!474206 (noDuplicate!1212 lt!318383))))

(declare-fun b!710845 () Bool)

(declare-fun res!474205 () Bool)

(assert (=> b!710845 (=> (not res!474205) (not e!399983))))

(assert (=> b!710845 (= res!474205 (noDuplicate!1212 lt!318382))))

(declare-fun b!710846 () Bool)

(declare-fun res!474223 () Bool)

(assert (=> b!710846 (=> (not res!474223) (not e!399982))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!710846 (= res!474223 (validKeyInArray!0 (select (arr!19347 a!3591) from!2969)))))

(declare-fun b!710847 () Bool)

(declare-fun res!474211 () Bool)

(assert (=> b!710847 (=> (not res!474211) (not e!399982))))

(assert (=> b!710847 (= res!474211 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!710848 () Bool)

(declare-fun res!474224 () Bool)

(assert (=> b!710848 (=> (not res!474224) (not e!399982))))

(assert (=> b!710848 (= res!474224 (noDuplicate!1212 newAcc!49))))

(declare-fun b!710849 () Bool)

(declare-fun res!474214 () Bool)

(assert (=> b!710849 (=> (not res!474214) (not e!399983))))

(assert (=> b!710849 (= res!474214 (not (contains!3965 lt!318383 k!2824)))))

(declare-fun b!710850 () Bool)

(declare-fun res!474221 () Bool)

(assert (=> b!710850 (=> (not res!474221) (not e!399982))))

(assert (=> b!710850 (= res!474221 (contains!3965 newAcc!49 k!2824))))

(declare-fun b!710851 () Bool)

(declare-fun res!474218 () Bool)

(assert (=> b!710851 (=> (not res!474218) (not e!399982))))

(assert (=> b!710851 (= res!474218 (validKeyInArray!0 k!2824))))

(declare-fun b!710852 () Bool)

(declare-fun res!474217 () Bool)

(assert (=> b!710852 (=> (not res!474217) (not e!399982))))

(declare-fun arrayContainsKey!0 (array!40402 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!710852 (= res!474217 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!710853 () Bool)

(declare-fun res!474213 () Bool)

(assert (=> b!710853 (=> (not res!474213) (not e!399982))))

(assert (=> b!710853 (= res!474213 (not (contains!3965 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710854 () Bool)

(declare-fun res!474227 () Bool)

(assert (=> b!710854 (=> (not res!474227) (not e!399982))))

(assert (=> b!710854 (= res!474227 (not (contains!3965 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710855 () Bool)

(declare-fun res!474226 () Bool)

(assert (=> b!710855 (=> (not res!474226) (not e!399983))))

(assert (=> b!710855 (= res!474226 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun res!474209 () Bool)

(assert (=> start!63088 (=> (not res!474209) (not e!399982))))

(assert (=> start!63088 (= res!474209 (and (bvslt (size!19748 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19748 a!3591))))))

(assert (=> start!63088 e!399982))

(assert (=> start!63088 true))

(declare-fun array_inv!15143 (array!40402) Bool)

(assert (=> start!63088 (array_inv!15143 a!3591)))

(declare-fun b!710842 () Bool)

(assert (=> b!710842 (= e!399983 (not (contains!3965 lt!318382 k!2824)))))

(declare-fun b!710856 () Bool)

(declare-fun res!474225 () Bool)

(assert (=> b!710856 (=> (not res!474225) (not e!399982))))

(assert (=> b!710856 (= res!474225 (not (contains!3965 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710857 () Bool)

(declare-fun res!474229 () Bool)

(assert (=> b!710857 (=> (not res!474229) (not e!399982))))

(assert (=> b!710857 (= res!474229 (subseq!410 acc!652 newAcc!49))))

(assert (= (and start!63088 res!474209) b!710841))

(assert (= (and b!710841 res!474212) b!710848))

(assert (= (and b!710848 res!474224) b!710839))

(assert (= (and b!710839 res!474220) b!710856))

(assert (= (and b!710856 res!474225) b!710852))

(assert (= (and b!710852 res!474217) b!710837))

(assert (= (and b!710837 res!474216) b!710851))

(assert (= (and b!710851 res!474218) b!710847))

(assert (= (and b!710847 res!474211) b!710857))

(assert (= (and b!710857 res!474229) b!710850))

(assert (= (and b!710850 res!474221) b!710833))

(assert (= (and b!710833 res!474222) b!710854))

(assert (= (and b!710854 res!474227) b!710853))

(assert (= (and b!710853 res!474213) b!710838))

(assert (= (and b!710838 res!474208) b!710846))

(assert (= (and b!710846 res!474223) b!710835))

(assert (= (and b!710835 res!474210) b!710844))

(assert (= (and b!710844 res!474206) b!710845))

(assert (= (and b!710845 res!474205) b!710843))

(assert (= (and b!710843 res!474207) b!710840))

(assert (= (and b!710840 res!474219) b!710855))

(assert (= (and b!710855 res!474226) b!710849))

(assert (= (and b!710849 res!474214) b!710836))

(assert (= (and b!710836 res!474215) b!710834))

(assert (= (and b!710834 res!474228) b!710842))

(declare-fun m!667921 () Bool)

(assert (=> b!710854 m!667921))

(declare-fun m!667923 () Bool)

(assert (=> b!710836 m!667923))

(declare-fun m!667925 () Bool)

(assert (=> b!710856 m!667925))

(declare-fun m!667927 () Bool)

(assert (=> b!710845 m!667927))

(declare-fun m!667929 () Bool)

(assert (=> b!710841 m!667929))

(declare-fun m!667931 () Bool)

(assert (=> b!710855 m!667931))

(declare-fun m!667933 () Bool)

(assert (=> b!710840 m!667933))

(declare-fun m!667935 () Bool)

(assert (=> b!710857 m!667935))

(declare-fun m!667937 () Bool)

(assert (=> b!710852 m!667937))

(declare-fun m!667939 () Bool)

(assert (=> b!710846 m!667939))

(assert (=> b!710846 m!667939))

(declare-fun m!667941 () Bool)

(assert (=> b!710846 m!667941))

(declare-fun m!667943 () Bool)

(assert (=> b!710850 m!667943))

(declare-fun m!667945 () Bool)

(assert (=> b!710849 m!667945))

(declare-fun m!667947 () Bool)

(assert (=> b!710839 m!667947))

(declare-fun m!667949 () Bool)

(assert (=> b!710833 m!667949))

(declare-fun m!667951 () Bool)

(assert (=> b!710843 m!667951))

(declare-fun m!667953 () Bool)

(assert (=> b!710853 m!667953))

(declare-fun m!667955 () Bool)

(assert (=> b!710848 m!667955))

(declare-fun m!667957 () Bool)

(assert (=> b!710851 m!667957))

(declare-fun m!667959 () Bool)

(assert (=> b!710837 m!667959))

(declare-fun m!667961 () Bool)

(assert (=> b!710844 m!667961))

(declare-fun m!667963 () Bool)

(assert (=> b!710834 m!667963))

(assert (=> b!710835 m!667939))

(assert (=> b!710835 m!667939))

(declare-fun m!667965 () Bool)

(assert (=> b!710835 m!667965))

(assert (=> b!710835 m!667939))

(declare-fun m!667967 () Bool)

(assert (=> b!710835 m!667967))

(declare-fun m!667969 () Bool)

(assert (=> b!710847 m!667969))

(declare-fun m!667971 () Bool)

(assert (=> b!710842 m!667971))

(declare-fun m!667973 () Bool)

(assert (=> start!63088 m!667973))

(push 1)

(assert (not b!710836))

(assert (not start!63088))

(assert (not b!710853))

(assert (not b!710851))

(assert (not b!710844))

(assert (not b!710857))

(assert (not b!710856))

(assert (not b!710845))

(assert (not b!710854))

(assert (not b!710846))

(assert (not b!710834))

(assert (not b!710841))

(assert (not b!710833))

(assert (not b!710837))

(assert (not b!710843))

(assert (not b!710842))

(assert (not b!710849))

(assert (not b!710835))

(assert (not b!710839))

(assert (not b!710855))

(assert (not b!710847))

(assert (not b!710852))

(assert (not b!710848))

(assert (not b!710840))

(assert (not b!710850))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97535 () Bool)

(assert (=> d!97535 (= (array_inv!15143 a!3591) (bvsge (size!19748 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63088 d!97535))

(declare-fun d!97539 () Bool)

(declare-fun res!474419 () Bool)

(declare-fun e!400048 () Bool)

(assert (=> d!97539 (=> res!474419 e!400048)))

(assert (=> d!97539 (= res!474419 (is-Nil!13385 acc!652))))

(assert (=> d!97539 (= (noDuplicate!1212 acc!652) e!400048)))

(declare-fun b!711059 () Bool)

(declare-fun e!400049 () Bool)

(assert (=> b!711059 (= e!400048 e!400049)))

(declare-fun res!474420 () Bool)

(assert (=> b!711059 (=> (not res!474420) (not e!400049))))

(assert (=> b!711059 (= res!474420 (not (contains!3965 (t!19691 acc!652) (h!14429 acc!652))))))

(declare-fun b!711060 () Bool)

(assert (=> b!711060 (= e!400049 (noDuplicate!1212 (t!19691 acc!652)))))

(assert (= (and d!97539 (not res!474419)) b!711059))

(assert (= (and b!711059 res!474420) b!711060))

(declare-fun m!668117 () Bool)

(assert (=> b!711059 m!668117))

(declare-fun m!668119 () Bool)

(assert (=> b!711060 m!668119))

(assert (=> b!710841 d!97539))

(declare-fun d!97543 () Bool)

(declare-fun lt!318408 () Bool)

(declare-fun content!354 (List!13388) (Set (_ BitVec 64)))

(assert (=> d!97543 (= lt!318408 (set.member k!2824 (content!354 lt!318382)))))

(declare-fun e!400072 () Bool)

(assert (=> d!97543 (= lt!318408 e!400072)))

(declare-fun res!474441 () Bool)

(assert (=> d!97543 (=> (not res!474441) (not e!400072))))

(assert (=> d!97543 (= res!474441 (is-Cons!13384 lt!318382))))

(assert (=> d!97543 (= (contains!3965 lt!318382 k!2824) lt!318408)))

(declare-fun b!711086 () Bool)

(declare-fun e!400073 () Bool)

(assert (=> b!711086 (= e!400072 e!400073)))

(declare-fun res!474440 () Bool)

(assert (=> b!711086 (=> res!474440 e!400073)))

(assert (=> b!711086 (= res!474440 (= (h!14429 lt!318382) k!2824))))

(declare-fun b!711087 () Bool)

(assert (=> b!711087 (= e!400073 (contains!3965 (t!19691 lt!318382) k!2824))))

(assert (= (and d!97543 res!474441) b!711086))

(assert (= (and b!711086 (not res!474440)) b!711087))

(declare-fun m!668135 () Bool)

(assert (=> d!97543 m!668135))

(declare-fun m!668137 () Bool)

(assert (=> d!97543 m!668137))

(declare-fun m!668141 () Bool)

(assert (=> b!711087 m!668141))

(assert (=> b!710842 d!97543))

(declare-fun d!97557 () Bool)

(declare-fun lt!318409 () Bool)

(assert (=> d!97557 (= lt!318409 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!354 acc!652)))))

(declare-fun e!400074 () Bool)

(assert (=> d!97557 (= lt!318409 e!400074)))

(declare-fun res!474443 () Bool)

(assert (=> d!97557 (=> (not res!474443) (not e!400074))))

(assert (=> d!97557 (= res!474443 (is-Cons!13384 acc!652))))

(assert (=> d!97557 (= (contains!3965 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318409)))

(declare-fun b!711088 () Bool)

(declare-fun e!400075 () Bool)

(assert (=> b!711088 (= e!400074 e!400075)))

(declare-fun res!474442 () Bool)

(assert (=> b!711088 (=> res!474442 e!400075)))

(assert (=> b!711088 (= res!474442 (= (h!14429 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711089 () Bool)

(assert (=> b!711089 (= e!400075 (contains!3965 (t!19691 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97557 res!474443) b!711088))

(assert (= (and b!711088 (not res!474442)) b!711089))

(declare-fun m!668145 () Bool)

(assert (=> d!97557 m!668145))

(declare-fun m!668147 () Bool)

(assert (=> d!97557 m!668147))

(declare-fun m!668149 () Bool)

(assert (=> b!711089 m!668149))

(assert (=> b!710839 d!97557))

(declare-fun d!97561 () Bool)

(declare-fun lt!318410 () Bool)

(assert (=> d!97561 (= lt!318410 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!354 lt!318383)))))

(declare-fun e!400076 () Bool)

(assert (=> d!97561 (= lt!318410 e!400076)))

(declare-fun res!474445 () Bool)

(assert (=> d!97561 (=> (not res!474445) (not e!400076))))

(assert (=> d!97561 (= res!474445 (is-Cons!13384 lt!318383))))

(assert (=> d!97561 (= (contains!3965 lt!318383 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318410)))

(declare-fun b!711090 () Bool)

(declare-fun e!400077 () Bool)

(assert (=> b!711090 (= e!400076 e!400077)))

(declare-fun res!474444 () Bool)

(assert (=> b!711090 (=> res!474444 e!400077)))

(assert (=> b!711090 (= res!474444 (= (h!14429 lt!318383) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711091 () Bool)

(assert (=> b!711091 (= e!400077 (contains!3965 (t!19691 lt!318383) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97561 res!474445) b!711090))

(assert (= (and b!711090 (not res!474444)) b!711091))

(declare-fun m!668151 () Bool)

(assert (=> d!97561 m!668151))

(declare-fun m!668153 () Bool)

(assert (=> d!97561 m!668153))

(declare-fun m!668155 () Bool)

(assert (=> b!711091 m!668155))

(assert (=> b!710840 d!97561))

(declare-fun d!97563 () Bool)

(assert (=> d!97563 (= (validKeyInArray!0 (select (arr!19347 a!3591) from!2969)) (and (not (= (select (arr!19347 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19347 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!710846 d!97563))

(declare-fun b!711164 () Bool)

(declare-fun e!400146 () Bool)

(declare-fun call!34507 () Bool)

(assert (=> b!711164 (= e!400146 call!34507)))

(declare-fun b!711165 () Bool)

(declare-fun e!400144 () Bool)

(assert (=> b!711165 (= e!400144 e!400146)))

(declare-fun c!78696 () Bool)

(assert (=> b!711165 (= c!78696 (validKeyInArray!0 (select (arr!19347 a!3591) from!2969)))))

(declare-fun d!97565 () Bool)

(declare-fun res!474507 () Bool)

(declare-fun e!400145 () Bool)

(assert (=> d!97565 (=> res!474507 e!400145)))

(assert (=> d!97565 (= res!474507 (bvsge from!2969 (size!19748 a!3591)))))

(assert (=> d!97565 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!400145)))

(declare-fun b!711166 () Bool)

(assert (=> b!711166 (= e!400146 call!34507)))

(declare-fun b!711167 () Bool)

(assert (=> b!711167 (= e!400145 e!400144)))

(declare-fun res!474506 () Bool)

(assert (=> b!711167 (=> (not res!474506) (not e!400144))))

(declare-fun e!400147 () Bool)

(assert (=> b!711167 (= res!474506 (not e!400147))))

(declare-fun res!474508 () Bool)

(assert (=> b!711167 (=> (not res!474508) (not e!400147))))

(assert (=> b!711167 (= res!474508 (validKeyInArray!0 (select (arr!19347 a!3591) from!2969)))))

(declare-fun b!711168 () Bool)

(assert (=> b!711168 (= e!400147 (contains!3965 acc!652 (select (arr!19347 a!3591) from!2969)))))

(declare-fun bm!34504 () Bool)

(assert (=> bm!34504 (= call!34507 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78696 (Cons!13384 (select (arr!19347 a!3591) from!2969) acc!652) acc!652)))))

(assert (= (and d!97565 (not res!474507)) b!711167))

(assert (= (and b!711167 res!474508) b!711168))

(assert (= (and b!711167 res!474506) b!711165))

(assert (= (and b!711165 c!78696) b!711164))

(assert (= (and b!711165 (not c!78696)) b!711166))

(assert (= (or b!711164 b!711166) bm!34504))

(assert (=> b!711165 m!667939))

(assert (=> b!711165 m!667939))

(assert (=> b!711165 m!667941))

(assert (=> b!711167 m!667939))

(assert (=> b!711167 m!667939))

(assert (=> b!711167 m!667941))

(assert (=> b!711168 m!667939))

(assert (=> b!711168 m!667939))

(declare-fun m!668213 () Bool)

(assert (=> b!711168 m!668213))

(assert (=> bm!34504 m!667939))

(declare-fun m!668215 () Bool)

(assert (=> bm!34504 m!668215))

(assert (=> b!710847 d!97565))

(declare-fun d!97595 () Bool)

(declare-fun res!474517 () Bool)

(declare-fun e!400156 () Bool)

(assert (=> d!97595 (=> res!474517 e!400156)))

(assert (=> d!97595 (= res!474517 (is-Nil!13385 newAcc!49))))

(assert (=> d!97595 (= (noDuplicate!1212 newAcc!49) e!400156)))

(declare-fun b!711177 () Bool)

(declare-fun e!400157 () Bool)

(assert (=> b!711177 (= e!400156 e!400157)))

(declare-fun res!474518 () Bool)

(assert (=> b!711177 (=> (not res!474518) (not e!400157))))

(assert (=> b!711177 (= res!474518 (not (contains!3965 (t!19691 newAcc!49) (h!14429 newAcc!49))))))

(declare-fun b!711178 () Bool)

(assert (=> b!711178 (= e!400157 (noDuplicate!1212 (t!19691 newAcc!49)))))

(assert (= (and d!97595 (not res!474517)) b!711177))

(assert (= (and b!711177 res!474518) b!711178))

(declare-fun m!668225 () Bool)

(assert (=> b!711177 m!668225))

(declare-fun m!668227 () Bool)

(assert (=> b!711178 m!668227))

(assert (=> b!710848 d!97595))

(declare-fun d!97601 () Bool)

(declare-fun lt!318419 () Bool)

(assert (=> d!97601 (= lt!318419 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!354 lt!318383)))))

(declare-fun e!400162 () Bool)

(assert (=> d!97601 (= lt!318419 e!400162)))

(declare-fun res!474524 () Bool)

(assert (=> d!97601 (=> (not res!474524) (not e!400162))))

(assert (=> d!97601 (= res!474524 (is-Cons!13384 lt!318383))))

(assert (=> d!97601 (= (contains!3965 lt!318383 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318419)))

(declare-fun b!711183 () Bool)

(declare-fun e!400164 () Bool)

(assert (=> b!711183 (= e!400162 e!400164)))

(declare-fun res!474523 () Bool)

(assert (=> b!711183 (=> res!474523 e!400164)))

(assert (=> b!711183 (= res!474523 (= (h!14429 lt!318383) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711184 () Bool)

(assert (=> b!711184 (= e!400164 (contains!3965 (t!19691 lt!318383) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97601 res!474524) b!711183))

(assert (= (and b!711183 (not res!474523)) b!711184))

(assert (=> d!97601 m!668151))

(declare-fun m!668241 () Bool)

(assert (=> d!97601 m!668241))

(declare-fun m!668243 () Bool)

(assert (=> b!711184 m!668243))

(assert (=> b!710843 d!97601))

(declare-fun d!97609 () Bool)

(declare-fun res!474532 () Bool)

(declare-fun e!400172 () Bool)

(assert (=> d!97609 (=> res!474532 e!400172)))

(assert (=> d!97609 (= res!474532 (is-Nil!13385 lt!318383))))

(assert (=> d!97609 (= (noDuplicate!1212 lt!318383) e!400172)))

(declare-fun b!711194 () Bool)

(declare-fun e!400173 () Bool)

(assert (=> b!711194 (= e!400172 e!400173)))

(declare-fun res!474533 () Bool)

(assert (=> b!711194 (=> (not res!474533) (not e!400173))))

(assert (=> b!711194 (= res!474533 (not (contains!3965 (t!19691 lt!318383) (h!14429 lt!318383))))))

(declare-fun b!711195 () Bool)

(assert (=> b!711195 (= e!400173 (noDuplicate!1212 (t!19691 lt!318383)))))

(assert (= (and d!97609 (not res!474532)) b!711194))

(assert (= (and b!711194 res!474533) b!711195))

(declare-fun m!668253 () Bool)

(assert (=> b!711194 m!668253))

(declare-fun m!668257 () Bool)

(assert (=> b!711195 m!668257))

(assert (=> b!710844 d!97609))

(declare-fun d!97613 () Bool)

(declare-fun res!474536 () Bool)

(declare-fun e!400176 () Bool)

(assert (=> d!97613 (=> res!474536 e!400176)))

(assert (=> d!97613 (= res!474536 (is-Nil!13385 lt!318382))))

(assert (=> d!97613 (= (noDuplicate!1212 lt!318382) e!400176)))

(declare-fun b!711198 () Bool)

(declare-fun e!400177 () Bool)

(assert (=> b!711198 (= e!400176 e!400177)))

(declare-fun res!474537 () Bool)

(assert (=> b!711198 (=> (not res!474537) (not e!400177))))

(assert (=> b!711198 (= res!474537 (not (contains!3965 (t!19691 lt!318382) (h!14429 lt!318382))))))

(declare-fun b!711199 () Bool)

(assert (=> b!711199 (= e!400177 (noDuplicate!1212 (t!19691 lt!318382)))))

(assert (= (and d!97613 (not res!474536)) b!711198))

(assert (= (and b!711198 res!474537) b!711199))

(declare-fun m!668265 () Bool)

(assert (=> b!711198 m!668265))

(declare-fun m!668267 () Bool)

(assert (=> b!711199 m!668267))

(assert (=> b!710845 d!97613))

(declare-fun d!97617 () Bool)

(assert (=> d!97617 (= (validKeyInArray!0 k!2824) (and (not (= k!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!710851 d!97617))

(declare-fun d!97619 () Bool)

(declare-fun res!474552 () Bool)

(declare-fun e!400192 () Bool)

(assert (=> d!97619 (=> res!474552 e!400192)))

(assert (=> d!97619 (= res!474552 (= (select (arr!19347 a!3591) from!2969) k!2824))))

(assert (=> d!97619 (= (arrayContainsKey!0 a!3591 k!2824 from!2969) e!400192)))

(declare-fun b!711214 () Bool)

(declare-fun e!400193 () Bool)

(assert (=> b!711214 (= e!400192 e!400193)))

(declare-fun res!474553 () Bool)

(assert (=> b!711214 (=> (not res!474553) (not e!400193))))

(assert (=> b!711214 (= res!474553 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19748 a!3591)))))

(declare-fun b!711215 () Bool)

(assert (=> b!711215 (= e!400193 (arrayContainsKey!0 a!3591 k!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97619 (not res!474552)) b!711214))

(assert (= (and b!711214 res!474553) b!711215))

(assert (=> d!97619 m!667939))

(declare-fun m!668289 () Bool)

(assert (=> b!711215 m!668289))

(assert (=> b!710852 d!97619))

(declare-fun d!97637 () Bool)

(declare-fun lt!318426 () Bool)

(assert (=> d!97637 (= lt!318426 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!354 newAcc!49)))))

(declare-fun e!400196 () Bool)

(assert (=> d!97637 (= lt!318426 e!400196)))

(declare-fun res!474557 () Bool)

(assert (=> d!97637 (=> (not res!474557) (not e!400196))))

(assert (=> d!97637 (= res!474557 (is-Cons!13384 newAcc!49))))

(assert (=> d!97637 (= (contains!3965 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318426)))

(declare-fun b!711218 () Bool)

(declare-fun e!400197 () Bool)

(assert (=> b!711218 (= e!400196 e!400197)))

(declare-fun res!474556 () Bool)

(assert (=> b!711218 (=> res!474556 e!400197)))

(assert (=> b!711218 (= res!474556 (= (h!14429 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!711219 () Bool)

(assert (=> b!711219 (= e!400197 (contains!3965 (t!19691 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97637 res!474557) b!711218))

(assert (= (and b!711218 (not res!474556)) b!711219))

(declare-fun m!668297 () Bool)

(assert (=> d!97637 m!668297))

(declare-fun m!668299 () Bool)

(assert (=> d!97637 m!668299))

(declare-fun m!668303 () Bool)

(assert (=> b!711219 m!668303))

(assert (=> b!710853 d!97637))

(declare-fun d!97641 () Bool)

(declare-fun lt!318427 () Bool)

(assert (=> d!97641 (= lt!318427 (set.member k!2824 (content!354 lt!318383)))))

(declare-fun e!400202 () Bool)

(assert (=> d!97641 (= lt!318427 e!400202)))

(declare-fun res!474563 () Bool)

(assert (=> d!97641 (=> (not res!474563) (not e!400202))))

(assert (=> d!97641 (= res!474563 (is-Cons!13384 lt!318383))))

(assert (=> d!97641 (= (contains!3965 lt!318383 k!2824) lt!318427)))

(declare-fun b!711224 () Bool)

(declare-fun e!400203 () Bool)

(assert (=> b!711224 (= e!400202 e!400203)))

(declare-fun res!474562 () Bool)

(assert (=> b!711224 (=> res!474562 e!400203)))

(assert (=> b!711224 (= res!474562 (= (h!14429 lt!318383) k!2824))))

(declare-fun b!711225 () Bool)

(assert (=> b!711225 (= e!400203 (contains!3965 (t!19691 lt!318383) k!2824))))

(assert (= (and d!97641 res!474563) b!711224))

(assert (= (and b!711224 (not res!474562)) b!711225))

(assert (=> d!97641 m!668151))

(declare-fun m!668307 () Bool)

(assert (=> d!97641 m!668307))

(declare-fun m!668311 () Bool)

(assert (=> b!711225 m!668311))

(assert (=> b!710849 d!97641))

(declare-fun d!97647 () Bool)

(declare-fun lt!318429 () Bool)

(assert (=> d!97647 (= lt!318429 (set.member k!2824 (content!354 newAcc!49)))))

(declare-fun e!400206 () Bool)

(assert (=> d!97647 (= lt!318429 e!400206)))

(declare-fun res!474567 () Bool)

(assert (=> d!97647 (=> (not res!474567) (not e!400206))))

(assert (=> d!97647 (= res!474567 (is-Cons!13384 newAcc!49))))

(assert (=> d!97647 (= (contains!3965 newAcc!49 k!2824) lt!318429)))

(declare-fun b!711228 () Bool)

(declare-fun e!400207 () Bool)

(assert (=> b!711228 (= e!400206 e!400207)))

(declare-fun res!474566 () Bool)

(assert (=> b!711228 (=> res!474566 e!400207)))

(assert (=> b!711228 (= res!474566 (= (h!14429 newAcc!49) k!2824))))

(declare-fun b!711229 () Bool)

(assert (=> b!711229 (= e!400207 (contains!3965 (t!19691 newAcc!49) k!2824))))

(assert (= (and d!97647 res!474567) b!711228))

(assert (= (and b!711228 (not res!474566)) b!711229))

(assert (=> d!97647 m!668297))

(declare-fun m!668315 () Bool)

(assert (=> d!97647 m!668315))

(declare-fun m!668317 () Bool)

(assert (=> b!711229 m!668317))

(assert (=> b!710850 d!97647))

(declare-fun d!97649 () Bool)

(assert (=> d!97649 (= ($colon$colon!521 newAcc!49 (select (arr!19347 a!3591) from!2969)) (Cons!13384 (select (arr!19347 a!3591) from!2969) newAcc!49))))

(assert (=> b!710835 d!97649))

(declare-fun d!97651 () Bool)

(assert (=> d!97651 (= ($colon$colon!521 acc!652 (select (arr!19347 a!3591) from!2969)) (Cons!13384 (select (arr!19347 a!3591) from!2969) acc!652))))

(assert (=> b!710835 d!97651))

(declare-fun b!711230 () Bool)

(declare-fun e!400210 () Bool)

(declare-fun call!34509 () Bool)

(assert (=> b!711230 (= e!400210 call!34509)))

(declare-fun b!711231 () Bool)

(declare-fun e!400208 () Bool)

(assert (=> b!711231 (= e!400208 e!400210)))

(declare-fun c!78698 () Bool)

(assert (=> b!711231 (= c!78698 (validKeyInArray!0 (select (arr!19347 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun d!97653 () Bool)

(declare-fun res!474569 () Bool)

(declare-fun e!400209 () Bool)

(assert (=> d!97653 (=> res!474569 e!400209)))

(assert (=> d!97653 (= res!474569 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19748 a!3591)))))

(assert (=> d!97653 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318383) e!400209)))

(declare-fun b!711232 () Bool)

(assert (=> b!711232 (= e!400210 call!34509)))

(declare-fun b!711233 () Bool)

(assert (=> b!711233 (= e!400209 e!400208)))

(declare-fun res!474568 () Bool)

(assert (=> b!711233 (=> (not res!474568) (not e!400208))))

(declare-fun e!400211 () Bool)

(assert (=> b!711233 (= res!474568 (not e!400211))))

(declare-fun res!474570 () Bool)

(assert (=> b!711233 (=> (not res!474570) (not e!400211))))

(assert (=> b!711233 (= res!474570 (validKeyInArray!0 (select (arr!19347 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!711234 () Bool)

(assert (=> b!711234 (= e!400211 (contains!3965 lt!318383 (select (arr!19347 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun bm!34506 () Bool)

(assert (=> bm!34506 (= call!34509 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78698 (Cons!13384 (select (arr!19347 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318383) lt!318383)))))

(assert (= (and d!97653 (not res!474569)) b!711233))

(assert (= (and b!711233 res!474570) b!711234))

(assert (= (and b!711233 res!474568) b!711231))

(assert (= (and b!711231 c!78698) b!711230))

(assert (= (and b!711231 (not c!78698)) b!711232))

(assert (= (or b!711230 b!711232) bm!34506))

(declare-fun m!668319 () Bool)

(assert (=> b!711231 m!668319))

(assert (=> b!711231 m!668319))

(declare-fun m!668321 () Bool)

(assert (=> b!711231 m!668321))

(assert (=> b!711233 m!668319))

(assert (=> b!711233 m!668319))

(assert (=> b!711233 m!668321))

(assert (=> b!711234 m!668319))

(assert (=> b!711234 m!668319))

(declare-fun m!668323 () Bool)

(assert (=> b!711234 m!668323))

(assert (=> bm!34506 m!668319))

(declare-fun m!668325 () Bool)

(assert (=> bm!34506 m!668325))

(assert (=> b!710836 d!97653))

(declare-fun d!97655 () Bool)

(declare-fun res!474584 () Bool)

(declare-fun e!400233 () Bool)

(assert (=> d!97655 (=> res!474584 e!400233)))

(assert (=> d!97655 (= res!474584 (is-Nil!13385 acc!652))))

(assert (=> d!97655 (= (subseq!410 acc!652 newAcc!49) e!400233)))

(declare-fun b!711258 () Bool)

