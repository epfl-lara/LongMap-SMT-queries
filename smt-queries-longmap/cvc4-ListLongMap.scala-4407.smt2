; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60792 () Bool)

(assert start!60792)

(declare-fun b!682164 () Bool)

(declare-datatypes ((Unit!23932 0))(
  ( (Unit!23933) )
))
(declare-fun e!388659 () Unit!23932)

(declare-fun lt!313450 () Unit!23932)

(assert (=> b!682164 (= e!388659 lt!313450)))

(declare-fun lt!313451 () Unit!23932)

(declare-datatypes ((List!12994 0))(
  ( (Nil!12991) (Cons!12990 (h!14035 (_ BitVec 64)) (t!19234 List!12994)) )
))
(declare-fun acc!681 () List!12994)

(declare-fun lemmaListSubSeqRefl!0 (List!12994) Unit!23932)

(assert (=> b!682164 (= lt!313451 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!157 (List!12994 List!12994) Bool)

(assert (=> b!682164 (subseq!157 acc!681 acc!681)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((array!39539 0))(
  ( (array!39540 (arr!18953 (Array (_ BitVec 32) (_ BitVec 64))) (size!19317 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39539)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39539 List!12994 List!12994 (_ BitVec 32)) Unit!23932)

(declare-fun $colon$colon!322 (List!12994 (_ BitVec 64)) List!12994)

(assert (=> b!682164 (= lt!313450 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!322 acc!681 (select (arr!18953 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39539 (_ BitVec 32) List!12994) Bool)

(assert (=> b!682164 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!682165 () Bool)

(declare-fun res!448210 () Bool)

(declare-fun e!388662 () Bool)

(assert (=> b!682165 (=> (not res!448210) (not e!388662))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!682165 (= res!448210 (validKeyInArray!0 k!2843))))

(declare-fun b!682166 () Bool)

(declare-fun res!448220 () Bool)

(assert (=> b!682166 (=> (not res!448220) (not e!388662))))

(declare-fun contains!3571 (List!12994 (_ BitVec 64)) Bool)

(assert (=> b!682166 (= res!448220 (not (contains!3571 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682167 () Bool)

(declare-fun e!388664 () Unit!23932)

(declare-fun Unit!23934 () Unit!23932)

(assert (=> b!682167 (= e!388664 Unit!23934)))

(declare-fun lt!313453 () Unit!23932)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39539 (_ BitVec 64) (_ BitVec 32)) Unit!23932)

(assert (=> b!682167 (= lt!313453 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!682167 false))

(declare-fun b!682168 () Bool)

(declare-fun res!448216 () Bool)

(assert (=> b!682168 (=> (not res!448216) (not e!388662))))

(declare-fun noDuplicate!818 (List!12994) Bool)

(assert (=> b!682168 (= res!448216 (noDuplicate!818 acc!681))))

(declare-fun res!448213 () Bool)

(assert (=> start!60792 (=> (not res!448213) (not e!388662))))

(assert (=> start!60792 (= res!448213 (and (bvslt (size!19317 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19317 a!3626))))))

(assert (=> start!60792 e!388662))

(assert (=> start!60792 true))

(declare-fun array_inv!14749 (array!39539) Bool)

(assert (=> start!60792 (array_inv!14749 a!3626)))

(declare-fun b!682169 () Bool)

(declare-fun e!388665 () Bool)

(assert (=> b!682169 (= e!388665 (not (contains!3571 acc!681 k!2843)))))

(declare-fun b!682170 () Bool)

(declare-fun res!448211 () Bool)

(assert (=> b!682170 (=> (not res!448211) (not e!388662))))

(declare-fun e!388661 () Bool)

(assert (=> b!682170 (= res!448211 e!388661)))

(declare-fun res!448214 () Bool)

(assert (=> b!682170 (=> res!448214 e!388661)))

(declare-fun e!388663 () Bool)

(assert (=> b!682170 (= res!448214 e!388663)))

(declare-fun res!448218 () Bool)

(assert (=> b!682170 (=> (not res!448218) (not e!388663))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!682170 (= res!448218 (bvsgt from!3004 i!1382))))

(declare-fun b!682171 () Bool)

(declare-fun res!448221 () Bool)

(assert (=> b!682171 (=> (not res!448221) (not e!388662))))

(assert (=> b!682171 (= res!448221 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12991))))

(declare-fun b!682172 () Bool)

(declare-fun res!448223 () Bool)

(assert (=> b!682172 (=> (not res!448223) (not e!388662))))

(declare-fun arrayContainsKey!0 (array!39539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!682172 (= res!448223 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!682173 () Bool)

(declare-fun res!448219 () Bool)

(assert (=> b!682173 (=> (not res!448219) (not e!388662))))

(assert (=> b!682173 (= res!448219 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19317 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!682174 () Bool)

(assert (=> b!682174 (= e!388661 e!388665)))

(declare-fun res!448212 () Bool)

(assert (=> b!682174 (=> (not res!448212) (not e!388665))))

(assert (=> b!682174 (= res!448212 (bvsle from!3004 i!1382))))

(declare-fun b!682175 () Bool)

(assert (=> b!682175 (= e!388662 (not (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))))

(declare-fun lt!313449 () Unit!23932)

(assert (=> b!682175 (= lt!313449 e!388659)))

(declare-fun c!77345 () Bool)

(assert (=> b!682175 (= c!77345 (validKeyInArray!0 (select (arr!18953 a!3626) from!3004)))))

(declare-fun lt!313452 () Unit!23932)

(assert (=> b!682175 (= lt!313452 e!388664)))

(declare-fun c!77344 () Bool)

(assert (=> b!682175 (= c!77344 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682175 (arrayContainsKey!0 (array!39540 (store (arr!18953 a!3626) i!1382 k!2843) (size!19317 a!3626)) k!2843 from!3004)))

(declare-fun b!682176 () Bool)

(declare-fun res!448217 () Bool)

(assert (=> b!682176 (=> (not res!448217) (not e!388662))))

(assert (=> b!682176 (= res!448217 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19317 a!3626))))))

(declare-fun b!682177 () Bool)

(declare-fun Unit!23935 () Unit!23932)

(assert (=> b!682177 (= e!388664 Unit!23935)))

(declare-fun b!682178 () Bool)

(declare-fun res!448222 () Bool)

(assert (=> b!682178 (=> (not res!448222) (not e!388662))))

(assert (=> b!682178 (= res!448222 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!682179 () Bool)

(declare-fun res!448215 () Bool)

(assert (=> b!682179 (=> (not res!448215) (not e!388662))))

(assert (=> b!682179 (= res!448215 (not (contains!3571 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682180 () Bool)

(assert (=> b!682180 (= e!388663 (contains!3571 acc!681 k!2843))))

(declare-fun b!682181 () Bool)

(declare-fun Unit!23936 () Unit!23932)

(assert (=> b!682181 (= e!388659 Unit!23936)))

(assert (= (and start!60792 res!448213) b!682168))

(assert (= (and b!682168 res!448216) b!682179))

(assert (= (and b!682179 res!448215) b!682166))

(assert (= (and b!682166 res!448220) b!682170))

(assert (= (and b!682170 res!448218) b!682180))

(assert (= (and b!682170 (not res!448214)) b!682174))

(assert (= (and b!682174 res!448212) b!682169))

(assert (= (and b!682170 res!448211) b!682171))

(assert (= (and b!682171 res!448221) b!682178))

(assert (= (and b!682178 res!448222) b!682176))

(assert (= (and b!682176 res!448217) b!682165))

(assert (= (and b!682165 res!448210) b!682172))

(assert (= (and b!682172 res!448223) b!682173))

(assert (= (and b!682173 res!448219) b!682175))

(assert (= (and b!682175 c!77344) b!682167))

(assert (= (and b!682175 (not c!77344)) b!682177))

(assert (= (and b!682175 c!77345) b!682164))

(assert (= (and b!682175 (not c!77345)) b!682181))

(declare-fun m!646909 () Bool)

(assert (=> b!682178 m!646909))

(declare-fun m!646911 () Bool)

(assert (=> b!682166 m!646911))

(declare-fun m!646913 () Bool)

(assert (=> b!682167 m!646913))

(declare-fun m!646915 () Bool)

(assert (=> b!682165 m!646915))

(declare-fun m!646917 () Bool)

(assert (=> start!60792 m!646917))

(declare-fun m!646919 () Bool)

(assert (=> b!682164 m!646919))

(declare-fun m!646921 () Bool)

(assert (=> b!682164 m!646921))

(declare-fun m!646923 () Bool)

(assert (=> b!682164 m!646923))

(declare-fun m!646925 () Bool)

(assert (=> b!682164 m!646925))

(assert (=> b!682164 m!646921))

(assert (=> b!682164 m!646923))

(declare-fun m!646927 () Bool)

(assert (=> b!682164 m!646927))

(declare-fun m!646929 () Bool)

(assert (=> b!682164 m!646929))

(declare-fun m!646931 () Bool)

(assert (=> b!682179 m!646931))

(declare-fun m!646933 () Bool)

(assert (=> b!682180 m!646933))

(declare-fun m!646935 () Bool)

(assert (=> b!682172 m!646935))

(declare-fun m!646937 () Bool)

(assert (=> b!682168 m!646937))

(assert (=> b!682169 m!646933))

(assert (=> b!682175 m!646919))

(assert (=> b!682175 m!646921))

(declare-fun m!646939 () Bool)

(assert (=> b!682175 m!646939))

(declare-fun m!646941 () Bool)

(assert (=> b!682175 m!646941))

(assert (=> b!682175 m!646921))

(declare-fun m!646943 () Bool)

(assert (=> b!682175 m!646943))

(declare-fun m!646945 () Bool)

(assert (=> b!682175 m!646945))

(declare-fun m!646947 () Bool)

(assert (=> b!682171 m!646947))

(push 1)

(assert (not b!682171))

(assert (not b!682180))

(assert (not b!682178))

(assert (not b!682168))

(assert (not b!682166))

(assert (not b!682172))

(assert (not b!682179))

(assert (not start!60792))

(assert (not b!682169))

(assert (not b!682164))

(assert (not b!682167))

(assert (not b!682175))

(assert (not b!682165))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94061 () Bool)

(assert (=> d!94061 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!682165 d!94061))

(declare-fun b!682219 () Bool)

(declare-fun e!388701 () Bool)

(declare-fun call!33995 () Bool)

(assert (=> b!682219 (= e!388701 call!33995)))

(declare-fun b!682220 () Bool)

(declare-fun e!388700 () Bool)

(declare-fun e!388698 () Bool)

(assert (=> b!682220 (= e!388700 e!388698)))

(declare-fun res!448253 () Bool)

(assert (=> b!682220 (=> (not res!448253) (not e!388698))))

(declare-fun e!388699 () Bool)

(assert (=> b!682220 (= res!448253 (not e!388699))))

(declare-fun res!448252 () Bool)

(assert (=> b!682220 (=> (not res!448252) (not e!388699))))

(assert (=> b!682220 (= res!448252 (validKeyInArray!0 (select (arr!18953 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!94063 () Bool)

(declare-fun res!448251 () Bool)

(assert (=> d!94063 (=> res!448251 e!388700)))

(assert (=> d!94063 (= res!448251 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19317 a!3626)))))

(assert (=> d!94063 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!388700)))

(declare-fun bm!33992 () Bool)

(declare-fun c!77351 () Bool)

(assert (=> bm!33992 (= call!33995 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77351 (Cons!12990 (select (arr!18953 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!682221 () Bool)

(assert (=> b!682221 (= e!388699 (contains!3571 acc!681 (select (arr!18953 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!682222 () Bool)

(assert (=> b!682222 (= e!388701 call!33995)))

(declare-fun b!682223 () Bool)

(assert (=> b!682223 (= e!388698 e!388701)))

(assert (=> b!682223 (= c!77351 (validKeyInArray!0 (select (arr!18953 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!94063 (not res!448251)) b!682220))

(assert (= (and b!682220 res!448252) b!682221))

(assert (= (and b!682220 res!448253) b!682223))

(assert (= (and b!682223 c!77351) b!682219))

(assert (= (and b!682223 (not c!77351)) b!682222))

(assert (= (or b!682219 b!682222) bm!33992))

(declare-fun m!646969 () Bool)

(assert (=> b!682220 m!646969))

(assert (=> b!682220 m!646969))

(declare-fun m!646971 () Bool)

(assert (=> b!682220 m!646971))

(assert (=> bm!33992 m!646969))

(declare-fun m!646973 () Bool)

(assert (=> bm!33992 m!646973))

(assert (=> b!682221 m!646969))

(assert (=> b!682221 m!646969))

(declare-fun m!646975 () Bool)

(assert (=> b!682221 m!646975))

(assert (=> b!682223 m!646969))

(assert (=> b!682223 m!646969))

(assert (=> b!682223 m!646971))

(assert (=> b!682175 d!94063))

(declare-fun d!94069 () Bool)

(assert (=> d!94069 (= (validKeyInArray!0 (select (arr!18953 a!3626) from!3004)) (and (not (= (select (arr!18953 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18953 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!682175 d!94069))

(declare-fun d!94071 () Bool)

(declare-fun res!448271 () Bool)

(declare-fun e!388720 () Bool)

(assert (=> d!94071 (=> res!448271 e!388720)))

(assert (=> d!94071 (= res!448271 (= (select (arr!18953 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k!2843))))

(assert (=> d!94071 (= (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!388720)))

(declare-fun b!682243 () Bool)

(declare-fun e!388721 () Bool)

(assert (=> b!682243 (= e!388720 e!388721)))

(declare-fun res!448272 () Bool)

(assert (=> b!682243 (=> (not res!448272) (not e!388721))))

(assert (=> b!682243 (= res!448272 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19317 a!3626)))))

(declare-fun b!682244 () Bool)

(assert (=> b!682244 (= e!388721 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94071 (not res!448271)) b!682243))

(assert (= (and b!682243 res!448272) b!682244))

(assert (=> d!94071 m!646969))

(declare-fun m!646989 () Bool)

(assert (=> b!682244 m!646989))

(assert (=> b!682175 d!94071))

(declare-fun d!94081 () Bool)

(declare-fun res!448273 () Bool)

(declare-fun e!388722 () Bool)

(assert (=> d!94081 (=> res!448273 e!388722)))

(assert (=> d!94081 (= res!448273 (= (select (arr!18953 (array!39540 (store (arr!18953 a!3626) i!1382 k!2843) (size!19317 a!3626))) from!3004) k!2843))))

(assert (=> d!94081 (= (arrayContainsKey!0 (array!39540 (store (arr!18953 a!3626) i!1382 k!2843) (size!19317 a!3626)) k!2843 from!3004) e!388722)))

(declare-fun b!682245 () Bool)

(declare-fun e!388723 () Bool)

(assert (=> b!682245 (= e!388722 e!388723)))

(declare-fun res!448274 () Bool)

(assert (=> b!682245 (=> (not res!448274) (not e!388723))))

(assert (=> b!682245 (= res!448274 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19317 (array!39540 (store (arr!18953 a!3626) i!1382 k!2843) (size!19317 a!3626)))))))

(declare-fun b!682246 () Bool)

(assert (=> b!682246 (= e!388723 (arrayContainsKey!0 (array!39540 (store (arr!18953 a!3626) i!1382 k!2843) (size!19317 a!3626)) k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94081 (not res!448273)) b!682245))

(assert (= (and b!682245 res!448274) b!682246))

(declare-fun m!646993 () Bool)

(assert (=> d!94081 m!646993))

(declare-fun m!646995 () Bool)

(assert (=> b!682246 m!646995))

(assert (=> b!682175 d!94081))

(declare-fun d!94085 () Bool)

(assert (=> d!94085 (= ($colon$colon!322 acc!681 (select (arr!18953 a!3626) from!3004)) (Cons!12990 (select (arr!18953 a!3626) from!3004) acc!681))))

(assert (=> b!682164 d!94085))

(declare-fun b!682272 () Bool)

(declare-fun e!388747 () Bool)

(assert (=> b!682272 (= e!388747 (subseq!157 acc!681 (t!19234 acc!681)))))

(declare-fun d!94091 () Bool)

(declare-fun res!448299 () Bool)

(declare-fun e!388749 () Bool)

(assert (=> d!94091 (=> res!448299 e!388749)))

(assert (=> d!94091 (= res!448299 (is-Nil!12991 acc!681))))

(assert (=> d!94091 (= (subseq!157 acc!681 acc!681) e!388749)))

(declare-fun b!682270 () Bool)

(declare-fun e!388748 () Bool)

(assert (=> b!682270 (= e!388748 e!388747)))

(declare-fun res!448298 () Bool)

(assert (=> b!682270 (=> res!448298 e!388747)))

(declare-fun e!388746 () Bool)

(assert (=> b!682270 (= res!448298 e!388746)))

(declare-fun res!448300 () Bool)

(assert (=> b!682270 (=> (not res!448300) (not e!388746))))

(assert (=> b!682270 (= res!448300 (= (h!14035 acc!681) (h!14035 acc!681)))))

(declare-fun b!682269 () Bool)

(assert (=> b!682269 (= e!388749 e!388748)))

(declare-fun res!448297 () Bool)

(assert (=> b!682269 (=> (not res!448297) (not e!388748))))

(assert (=> b!682269 (= res!448297 (is-Cons!12990 acc!681))))

(declare-fun b!682271 () Bool)

(assert (=> b!682271 (= e!388746 (subseq!157 (t!19234 acc!681) (t!19234 acc!681)))))

(assert (= (and d!94091 (not res!448299)) b!682269))

(assert (= (and b!682269 res!448297) b!682270))

(assert (= (and b!682270 res!448300) b!682271))

(assert (= (and b!682270 (not res!448298)) b!682272))

(declare-fun m!647005 () Bool)

(assert (=> b!682272 m!647005))

(declare-fun m!647007 () Bool)

(assert (=> b!682271 m!647007))

(assert (=> b!682164 d!94091))

(declare-fun d!94097 () Bool)

(assert (=> d!94097 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313468 () Unit!23932)

(declare-fun choose!80 (array!39539 List!12994 List!12994 (_ BitVec 32)) Unit!23932)

(assert (=> d!94097 (= lt!313468 (choose!80 a!3626 ($colon$colon!322 acc!681 (select (arr!18953 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94097 (bvslt (size!19317 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94097 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!322 acc!681 (select (arr!18953 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!313468)))

(declare-fun bs!20018 () Bool)

(assert (= bs!20018 d!94097))

(assert (=> bs!20018 m!646919))

(assert (=> bs!20018 m!646923))

(declare-fun m!647019 () Bool)

(assert (=> bs!20018 m!647019))

(assert (=> b!682164 d!94097))

(declare-fun d!94103 () Bool)

(assert (=> d!94103 (subseq!157 acc!681 acc!681)))

(declare-fun lt!313473 () Unit!23932)

(declare-fun choose!36 (List!12994) Unit!23932)

(assert (=> d!94103 (= lt!313473 (choose!36 acc!681))))

(assert (=> d!94103 (= (lemmaListSubSeqRefl!0 acc!681) lt!313473)))

(declare-fun bs!20020 () Bool)

(assert (= bs!20020 d!94103))

(assert (=> bs!20020 m!646929))

(declare-fun m!647023 () Bool)

(assert (=> bs!20020 m!647023))

(assert (=> b!682164 d!94103))

(assert (=> b!682164 d!94063))

(declare-fun d!94107 () Bool)

(declare-fun res!448309 () Bool)

(declare-fun e!388758 () Bool)

(assert (=> d!94107 (=> res!448309 e!388758)))

(assert (=> d!94107 (= res!448309 (= (select (arr!18953 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!94107 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!388758)))

(declare-fun b!682281 () Bool)

(declare-fun e!388759 () Bool)

(assert (=> b!682281 (= e!388758 e!388759)))

(declare-fun res!448310 () Bool)

(assert (=> b!682281 (=> (not res!448310) (not e!388759))))

(assert (=> b!682281 (= res!448310 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19317 a!3626)))))

(declare-fun b!682282 () Bool)

(assert (=> b!682282 (= e!388759 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94107 (not res!448309)) b!682281))

(assert (= (and b!682281 res!448310) b!682282))

(declare-fun m!647025 () Bool)

(assert (=> d!94107 m!647025))

(declare-fun m!647027 () Bool)

(assert (=> b!682282 m!647027))

(assert (=> b!682172 d!94107))

(declare-fun b!682293 () Bool)

(declare-fun e!388771 () Bool)

(declare-fun call!33997 () Bool)

(assert (=> b!682293 (= e!388771 call!33997)))

(declare-fun b!682294 () Bool)

(declare-fun e!388770 () Bool)

(declare-fun e!388768 () Bool)

(assert (=> b!682294 (= e!388770 e!388768)))

(declare-fun res!448319 () Bool)

(assert (=> b!682294 (=> (not res!448319) (not e!388768))))

(declare-fun e!388769 () Bool)

(assert (=> b!682294 (= res!448319 (not e!388769))))

(declare-fun res!448318 () Bool)

(assert (=> b!682294 (=> (not res!448318) (not e!388769))))

(assert (=> b!682294 (= res!448318 (validKeyInArray!0 (select (arr!18953 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!94109 () Bool)

(declare-fun res!448317 () Bool)

(assert (=> d!94109 (=> res!448317 e!388770)))

(assert (=> d!94109 (= res!448317 (bvsge #b00000000000000000000000000000000 (size!19317 a!3626)))))

(assert (=> d!94109 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12991) e!388770)))

(declare-fun bm!33994 () Bool)

(declare-fun c!77355 () Bool)

(assert (=> bm!33994 (= call!33997 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77355 (Cons!12990 (select (arr!18953 a!3626) #b00000000000000000000000000000000) Nil!12991) Nil!12991)))))

(declare-fun b!682295 () Bool)

(assert (=> b!682295 (= e!388769 (contains!3571 Nil!12991 (select (arr!18953 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!682296 () Bool)

(assert (=> b!682296 (= e!388771 call!33997)))

(declare-fun b!682297 () Bool)

(assert (=> b!682297 (= e!388768 e!388771)))

(assert (=> b!682297 (= c!77355 (validKeyInArray!0 (select (arr!18953 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!94109 (not res!448317)) b!682294))

(assert (= (and b!682294 res!448318) b!682295))

(assert (= (and b!682294 res!448319) b!682297))

(assert (= (and b!682297 c!77355) b!682293))

(assert (= (and b!682297 (not c!77355)) b!682296))

(assert (= (or b!682293 b!682296) bm!33994))

(assert (=> b!682294 m!647025))

(assert (=> b!682294 m!647025))

(declare-fun m!647031 () Bool)

(assert (=> b!682294 m!647031))

(assert (=> bm!33994 m!647025))

(declare-fun m!647033 () Bool)

(assert (=> bm!33994 m!647033))

(assert (=> b!682295 m!647025))

(assert (=> b!682295 m!647025))

(declare-fun m!647037 () Bool)

(assert (=> b!682295 m!647037))

(assert (=> b!682297 m!647025))

(assert (=> b!682297 m!647025))

(assert (=> b!682297 m!647031))

(assert (=> b!682171 d!94109))

(declare-fun d!94113 () Bool)

(assert (=> d!94113 (= (array_inv!14749 a!3626) (bvsge (size!19317 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60792 d!94113))

(declare-fun d!94115 () Bool)

(declare-fun lt!313479 () Bool)

(declare-fun content!281 (List!12994) (Set (_ BitVec 64)))

(assert (=> d!94115 (= lt!313479 (member k!2843 (content!281 acc!681)))))

(declare-fun e!388784 () Bool)

(assert (=> d!94115 (= lt!313479 e!388784)))

(declare-fun res!448331 () Bool)

(assert (=> d!94115 (=> (not res!448331) (not e!388784))))

(assert (=> d!94115 (= res!448331 (is-Cons!12990 acc!681))))

(assert (=> d!94115 (= (contains!3571 acc!681 k!2843) lt!313479)))

(declare-fun b!682312 () Bool)

(declare-fun e!388785 () Bool)

(assert (=> b!682312 (= e!388784 e!388785)))

(declare-fun res!448330 () Bool)

(assert (=> b!682312 (=> res!448330 e!388785)))

(assert (=> b!682312 (= res!448330 (= (h!14035 acc!681) k!2843))))

(declare-fun b!682313 () Bool)

(assert (=> b!682313 (= e!388785 (contains!3571 (t!19234 acc!681) k!2843))))

(assert (= (and d!94115 res!448331) b!682312))

(assert (= (and b!682312 (not res!448330)) b!682313))

(declare-fun m!647051 () Bool)

(assert (=> d!94115 m!647051))

(declare-fun m!647053 () Bool)

(assert (=> d!94115 m!647053))

(declare-fun m!647055 () Bool)

(assert (=> b!682313 m!647055))

(assert (=> b!682169 d!94115))

(assert (=> b!682180 d!94115))

