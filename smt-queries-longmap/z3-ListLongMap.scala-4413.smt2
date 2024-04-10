; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60892 () Bool)

(assert start!60892)

(declare-fun b!683276 () Bool)

(declare-fun res!449099 () Bool)

(declare-fun e!389202 () Bool)

(assert (=> b!683276 (=> (not res!449099) (not e!389202))))

(declare-datatypes ((array!39576 0))(
  ( (array!39577 (arr!18970 (Array (_ BitVec 32) (_ BitVec 64))) (size!19334 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39576)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13011 0))(
  ( (Nil!13008) (Cons!13007 (h!14052 (_ BitVec 64)) (t!19254 List!13011)) )
))
(declare-fun acc!681 () List!13011)

(declare-fun arrayNoDuplicates!0 (array!39576 (_ BitVec 32) List!13011) Bool)

(assert (=> b!683276 (= res!449099 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!683277 () Bool)

(declare-fun e!389200 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3588 (List!13011 (_ BitVec 64)) Bool)

(assert (=> b!683277 (= e!389200 (not (contains!3588 acc!681 k0!2843)))))

(declare-fun b!683278 () Bool)

(declare-datatypes ((Unit!24017 0))(
  ( (Unit!24018) )
))
(declare-fun e!389196 () Unit!24017)

(declare-fun Unit!24019 () Unit!24017)

(assert (=> b!683278 (= e!389196 Unit!24019)))

(declare-fun b!683279 () Bool)

(declare-fun res!449095 () Bool)

(assert (=> b!683279 (=> (not res!449095) (not e!389202))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!683279 (= res!449095 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19334 a!3626))))))

(declare-fun b!683280 () Bool)

(declare-fun res!449100 () Bool)

(assert (=> b!683280 (=> (not res!449100) (not e!389202))))

(declare-fun arrayContainsKey!0 (array!39576 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!683280 (= res!449100 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!683282 () Bool)

(declare-fun res!449090 () Bool)

(assert (=> b!683282 (=> (not res!449090) (not e!389202))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!683282 (= res!449090 (validKeyInArray!0 k0!2843))))

(declare-fun b!683283 () Bool)

(declare-fun res!449089 () Bool)

(assert (=> b!683283 (=> (not res!449089) (not e!389202))))

(declare-fun e!389201 () Bool)

(assert (=> b!683283 (= res!449089 e!389201)))

(declare-fun res!449096 () Bool)

(assert (=> b!683283 (=> res!449096 e!389201)))

(declare-fun e!389197 () Bool)

(assert (=> b!683283 (= res!449096 e!389197)))

(declare-fun res!449101 () Bool)

(assert (=> b!683283 (=> (not res!449101) (not e!389197))))

(assert (=> b!683283 (= res!449101 (bvsgt from!3004 i!1382))))

(declare-fun b!683284 () Bool)

(declare-fun e!389198 () Unit!24017)

(declare-fun Unit!24020 () Unit!24017)

(assert (=> b!683284 (= e!389198 Unit!24020)))

(declare-fun b!683285 () Bool)

(declare-fun res!449094 () Bool)

(assert (=> b!683285 (=> (not res!449094) (not e!389202))))

(assert (=> b!683285 (= res!449094 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13008))))

(declare-fun b!683286 () Bool)

(assert (=> b!683286 (= e!389201 e!389200)))

(declare-fun res!449093 () Bool)

(assert (=> b!683286 (=> (not res!449093) (not e!389200))))

(assert (=> b!683286 (= res!449093 (bvsle from!3004 i!1382))))

(declare-fun b!683287 () Bool)

(declare-fun lt!313845 () Unit!24017)

(assert (=> b!683287 (= e!389198 lt!313845)))

(declare-fun lt!313847 () Unit!24017)

(declare-fun lemmaListSubSeqRefl!0 (List!13011) Unit!24017)

(assert (=> b!683287 (= lt!313847 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!174 (List!13011 List!13011) Bool)

(assert (=> b!683287 (subseq!174 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39576 List!13011 List!13011 (_ BitVec 32)) Unit!24017)

(declare-fun $colon$colon!339 (List!13011 (_ BitVec 64)) List!13011)

(assert (=> b!683287 (= lt!313845 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!339 acc!681 (select (arr!18970 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683287 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!683288 () Bool)

(declare-fun res!449102 () Bool)

(assert (=> b!683288 (=> (not res!449102) (not e!389202))))

(assert (=> b!683288 (= res!449102 (not (contains!3588 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683281 () Bool)

(declare-fun res!449097 () Bool)

(assert (=> b!683281 (=> (not res!449097) (not e!389202))))

(declare-fun noDuplicate!835 (List!13011) Bool)

(assert (=> b!683281 (= res!449097 (noDuplicate!835 acc!681))))

(declare-fun res!449092 () Bool)

(assert (=> start!60892 (=> (not res!449092) (not e!389202))))

(assert (=> start!60892 (= res!449092 (and (bvslt (size!19334 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19334 a!3626))))))

(assert (=> start!60892 e!389202))

(assert (=> start!60892 true))

(declare-fun array_inv!14766 (array!39576) Bool)

(assert (=> start!60892 (array_inv!14766 a!3626)))

(declare-fun b!683289 () Bool)

(declare-fun e!389195 () Bool)

(assert (=> b!683289 (= e!389202 (not e!389195))))

(declare-fun res!449091 () Bool)

(assert (=> b!683289 (=> res!449091 e!389195)))

(assert (=> b!683289 (= res!449091 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!313846 () List!13011)

(declare-fun -!139 (List!13011 (_ BitVec 64)) List!13011)

(assert (=> b!683289 (= (-!139 lt!313846 k0!2843) acc!681)))

(assert (=> b!683289 (= lt!313846 ($colon$colon!339 acc!681 k0!2843))))

(declare-fun lt!313844 () Unit!24017)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13011) Unit!24017)

(assert (=> b!683289 (= lt!313844 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!683289 (subseq!174 acc!681 acc!681)))

(declare-fun lt!313849 () Unit!24017)

(assert (=> b!683289 (= lt!313849 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683289 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313848 () Unit!24017)

(assert (=> b!683289 (= lt!313848 e!389198)))

(declare-fun c!77461 () Bool)

(assert (=> b!683289 (= c!77461 (validKeyInArray!0 (select (arr!18970 a!3626) from!3004)))))

(declare-fun lt!313842 () Unit!24017)

(assert (=> b!683289 (= lt!313842 e!389196)))

(declare-fun c!77462 () Bool)

(assert (=> b!683289 (= c!77462 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683289 (arrayContainsKey!0 (array!39577 (store (arr!18970 a!3626) i!1382 k0!2843) (size!19334 a!3626)) k0!2843 from!3004)))

(declare-fun b!683290 () Bool)

(declare-fun Unit!24021 () Unit!24017)

(assert (=> b!683290 (= e!389196 Unit!24021)))

(declare-fun lt!313843 () Unit!24017)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39576 (_ BitVec 64) (_ BitVec 32)) Unit!24017)

(assert (=> b!683290 (= lt!313843 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!683290 false))

(declare-fun b!683291 () Bool)

(declare-fun res!449098 () Bool)

(assert (=> b!683291 (=> (not res!449098) (not e!389202))))

(assert (=> b!683291 (= res!449098 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19334 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!683292 () Bool)

(declare-fun res!449088 () Bool)

(assert (=> b!683292 (=> (not res!449088) (not e!389202))))

(assert (=> b!683292 (= res!449088 (not (contains!3588 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683293 () Bool)

(assert (=> b!683293 (= e!389195 (noDuplicate!835 lt!313846))))

(declare-fun b!683294 () Bool)

(assert (=> b!683294 (= e!389197 (contains!3588 acc!681 k0!2843))))

(assert (= (and start!60892 res!449092) b!683281))

(assert (= (and b!683281 res!449097) b!683288))

(assert (= (and b!683288 res!449102) b!683292))

(assert (= (and b!683292 res!449088) b!683283))

(assert (= (and b!683283 res!449101) b!683294))

(assert (= (and b!683283 (not res!449096)) b!683286))

(assert (= (and b!683286 res!449093) b!683277))

(assert (= (and b!683283 res!449089) b!683285))

(assert (= (and b!683285 res!449094) b!683276))

(assert (= (and b!683276 res!449099) b!683279))

(assert (= (and b!683279 res!449095) b!683282))

(assert (= (and b!683282 res!449090) b!683280))

(assert (= (and b!683280 res!449100) b!683291))

(assert (= (and b!683291 res!449098) b!683289))

(assert (= (and b!683289 c!77462) b!683290))

(assert (= (and b!683289 (not c!77462)) b!683278))

(assert (= (and b!683289 c!77461) b!683287))

(assert (= (and b!683289 (not c!77461)) b!683284))

(assert (= (and b!683289 (not res!449091)) b!683293))

(declare-fun m!647837 () Bool)

(assert (=> b!683281 m!647837))

(declare-fun m!647839 () Bool)

(assert (=> b!683288 m!647839))

(declare-fun m!647841 () Bool)

(assert (=> b!683294 m!647841))

(declare-fun m!647843 () Bool)

(assert (=> b!683292 m!647843))

(declare-fun m!647845 () Bool)

(assert (=> b!683276 m!647845))

(declare-fun m!647847 () Bool)

(assert (=> b!683287 m!647847))

(declare-fun m!647849 () Bool)

(assert (=> b!683287 m!647849))

(declare-fun m!647851 () Bool)

(assert (=> b!683287 m!647851))

(declare-fun m!647853 () Bool)

(assert (=> b!683287 m!647853))

(assert (=> b!683287 m!647849))

(assert (=> b!683287 m!647851))

(declare-fun m!647855 () Bool)

(assert (=> b!683287 m!647855))

(declare-fun m!647857 () Bool)

(assert (=> b!683287 m!647857))

(declare-fun m!647859 () Bool)

(assert (=> b!683293 m!647859))

(declare-fun m!647861 () Bool)

(assert (=> start!60892 m!647861))

(declare-fun m!647863 () Bool)

(assert (=> b!683280 m!647863))

(assert (=> b!683277 m!647841))

(declare-fun m!647865 () Bool)

(assert (=> b!683290 m!647865))

(declare-fun m!647867 () Bool)

(assert (=> b!683282 m!647867))

(assert (=> b!683289 m!647847))

(assert (=> b!683289 m!647849))

(declare-fun m!647869 () Bool)

(assert (=> b!683289 m!647869))

(declare-fun m!647871 () Bool)

(assert (=> b!683289 m!647871))

(assert (=> b!683289 m!647855))

(declare-fun m!647873 () Bool)

(assert (=> b!683289 m!647873))

(assert (=> b!683289 m!647849))

(declare-fun m!647875 () Bool)

(assert (=> b!683289 m!647875))

(declare-fun m!647877 () Bool)

(assert (=> b!683289 m!647877))

(declare-fun m!647879 () Bool)

(assert (=> b!683289 m!647879))

(declare-fun m!647881 () Bool)

(assert (=> b!683289 m!647881))

(assert (=> b!683289 m!647857))

(declare-fun m!647883 () Bool)

(assert (=> b!683285 m!647883))

(check-sat (not b!683292) (not start!60892) (not b!683282) (not b!683290) (not b!683287) (not b!683280) (not b!683293) (not b!683289) (not b!683281) (not b!683276) (not b!683294) (not b!683288) (not b!683277) (not b!683285))
(check-sat)
(get-model)

(declare-fun bm!34004 () Bool)

(declare-fun call!34007 () Bool)

(declare-fun c!77471 () Bool)

(assert (=> bm!34004 (= call!34007 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77471 (Cons!13007 (select (arr!18970 a!3626) #b00000000000000000000000000000000) Nil!13008) Nil!13008)))))

(declare-fun b!683362 () Bool)

(declare-fun e!389238 () Bool)

(assert (=> b!683362 (= e!389238 call!34007)))

(declare-fun b!683363 () Bool)

(declare-fun e!389235 () Bool)

(assert (=> b!683363 (= e!389235 (contains!3588 Nil!13008 (select (arr!18970 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!94171 () Bool)

(declare-fun res!449155 () Bool)

(declare-fun e!389236 () Bool)

(assert (=> d!94171 (=> res!449155 e!389236)))

(assert (=> d!94171 (= res!449155 (bvsge #b00000000000000000000000000000000 (size!19334 a!3626)))))

(assert (=> d!94171 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13008) e!389236)))

(declare-fun b!683364 () Bool)

(assert (=> b!683364 (= e!389238 call!34007)))

(declare-fun b!683365 () Bool)

(declare-fun e!389237 () Bool)

(assert (=> b!683365 (= e!389236 e!389237)))

(declare-fun res!449156 () Bool)

(assert (=> b!683365 (=> (not res!449156) (not e!389237))))

(assert (=> b!683365 (= res!449156 (not e!389235))))

(declare-fun res!449154 () Bool)

(assert (=> b!683365 (=> (not res!449154) (not e!389235))))

(assert (=> b!683365 (= res!449154 (validKeyInArray!0 (select (arr!18970 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!683366 () Bool)

(assert (=> b!683366 (= e!389237 e!389238)))

(assert (=> b!683366 (= c!77471 (validKeyInArray!0 (select (arr!18970 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!94171 (not res!449155)) b!683365))

(assert (= (and b!683365 res!449154) b!683363))

(assert (= (and b!683365 res!449156) b!683366))

(assert (= (and b!683366 c!77471) b!683364))

(assert (= (and b!683366 (not c!77471)) b!683362))

(assert (= (or b!683364 b!683362) bm!34004))

(declare-fun m!647933 () Bool)

(assert (=> bm!34004 m!647933))

(declare-fun m!647935 () Bool)

(assert (=> bm!34004 m!647935))

(assert (=> b!683363 m!647933))

(assert (=> b!683363 m!647933))

(declare-fun m!647937 () Bool)

(assert (=> b!683363 m!647937))

(assert (=> b!683365 m!647933))

(assert (=> b!683365 m!647933))

(declare-fun m!647939 () Bool)

(assert (=> b!683365 m!647939))

(assert (=> b!683366 m!647933))

(assert (=> b!683366 m!647933))

(assert (=> b!683366 m!647939))

(assert (=> b!683285 d!94171))

(declare-fun c!77472 () Bool)

(declare-fun bm!34005 () Bool)

(declare-fun call!34008 () Bool)

(assert (=> bm!34005 (= call!34008 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77472 (Cons!13007 (select (arr!18970 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!683367 () Bool)

(declare-fun e!389242 () Bool)

(assert (=> b!683367 (= e!389242 call!34008)))

(declare-fun b!683368 () Bool)

(declare-fun e!389239 () Bool)

(assert (=> b!683368 (= e!389239 (contains!3588 acc!681 (select (arr!18970 a!3626) from!3004)))))

(declare-fun d!94173 () Bool)

(declare-fun res!449158 () Bool)

(declare-fun e!389240 () Bool)

(assert (=> d!94173 (=> res!449158 e!389240)))

(assert (=> d!94173 (= res!449158 (bvsge from!3004 (size!19334 a!3626)))))

(assert (=> d!94173 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!389240)))

(declare-fun b!683369 () Bool)

(assert (=> b!683369 (= e!389242 call!34008)))

(declare-fun b!683370 () Bool)

(declare-fun e!389241 () Bool)

(assert (=> b!683370 (= e!389240 e!389241)))

(declare-fun res!449159 () Bool)

(assert (=> b!683370 (=> (not res!449159) (not e!389241))))

(assert (=> b!683370 (= res!449159 (not e!389239))))

(declare-fun res!449157 () Bool)

(assert (=> b!683370 (=> (not res!449157) (not e!389239))))

(assert (=> b!683370 (= res!449157 (validKeyInArray!0 (select (arr!18970 a!3626) from!3004)))))

(declare-fun b!683371 () Bool)

(assert (=> b!683371 (= e!389241 e!389242)))

(assert (=> b!683371 (= c!77472 (validKeyInArray!0 (select (arr!18970 a!3626) from!3004)))))

(assert (= (and d!94173 (not res!449158)) b!683370))

(assert (= (and b!683370 res!449157) b!683368))

(assert (= (and b!683370 res!449159) b!683371))

(assert (= (and b!683371 c!77472) b!683369))

(assert (= (and b!683371 (not c!77472)) b!683367))

(assert (= (or b!683369 b!683367) bm!34005))

(assert (=> bm!34005 m!647849))

(declare-fun m!647941 () Bool)

(assert (=> bm!34005 m!647941))

(assert (=> b!683368 m!647849))

(assert (=> b!683368 m!647849))

(declare-fun m!647943 () Bool)

(assert (=> b!683368 m!647943))

(assert (=> b!683370 m!647849))

(assert (=> b!683370 m!647849))

(assert (=> b!683370 m!647875))

(assert (=> b!683371 m!647849))

(assert (=> b!683371 m!647849))

(assert (=> b!683371 m!647875))

(assert (=> b!683276 d!94173))

(declare-fun d!94175 () Bool)

(assert (=> d!94175 (= (array_inv!14766 a!3626) (bvsge (size!19334 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60892 d!94175))

(declare-fun d!94177 () Bool)

(assert (=> d!94177 (= ($colon$colon!339 acc!681 (select (arr!18970 a!3626) from!3004)) (Cons!13007 (select (arr!18970 a!3626) from!3004) acc!681))))

(assert (=> b!683287 d!94177))

(declare-fun b!683382 () Bool)

(declare-fun e!389254 () Bool)

(assert (=> b!683382 (= e!389254 (subseq!174 (t!19254 acc!681) (t!19254 acc!681)))))

(declare-fun b!683380 () Bool)

(declare-fun e!389252 () Bool)

(declare-fun e!389253 () Bool)

(assert (=> b!683380 (= e!389252 e!389253)))

(declare-fun res!449171 () Bool)

(assert (=> b!683380 (=> (not res!449171) (not e!389253))))

(get-info :version)

(assert (=> b!683380 (= res!449171 ((_ is Cons!13007) acc!681))))

(declare-fun b!683381 () Bool)

(declare-fun e!389251 () Bool)

(assert (=> b!683381 (= e!389253 e!389251)))

(declare-fun res!449170 () Bool)

(assert (=> b!683381 (=> res!449170 e!389251)))

(assert (=> b!683381 (= res!449170 e!389254)))

(declare-fun res!449168 () Bool)

(assert (=> b!683381 (=> (not res!449168) (not e!389254))))

(assert (=> b!683381 (= res!449168 (= (h!14052 acc!681) (h!14052 acc!681)))))

(declare-fun d!94179 () Bool)

(declare-fun res!449169 () Bool)

(assert (=> d!94179 (=> res!449169 e!389252)))

(assert (=> d!94179 (= res!449169 ((_ is Nil!13008) acc!681))))

(assert (=> d!94179 (= (subseq!174 acc!681 acc!681) e!389252)))

(declare-fun b!683383 () Bool)

(assert (=> b!683383 (= e!389251 (subseq!174 acc!681 (t!19254 acc!681)))))

(assert (= (and d!94179 (not res!449169)) b!683380))

(assert (= (and b!683380 res!449171) b!683381))

(assert (= (and b!683381 res!449168) b!683382))

(assert (= (and b!683381 (not res!449170)) b!683383))

(declare-fun m!647947 () Bool)

(assert (=> b!683382 m!647947))

(declare-fun m!647949 () Bool)

(assert (=> b!683383 m!647949))

(assert (=> b!683287 d!94179))

(declare-fun d!94189 () Bool)

(assert (=> d!94189 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313881 () Unit!24017)

(declare-fun choose!80 (array!39576 List!13011 List!13011 (_ BitVec 32)) Unit!24017)

(assert (=> d!94189 (= lt!313881 (choose!80 a!3626 ($colon$colon!339 acc!681 (select (arr!18970 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94189 (bvslt (size!19334 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94189 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!339 acc!681 (select (arr!18970 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!313881)))

(declare-fun bs!20045 () Bool)

(assert (= bs!20045 d!94189))

(assert (=> bs!20045 m!647847))

(assert (=> bs!20045 m!647851))

(declare-fun m!647951 () Bool)

(assert (=> bs!20045 m!647951))

(assert (=> b!683287 d!94189))

(declare-fun d!94191 () Bool)

(assert (=> d!94191 (subseq!174 acc!681 acc!681)))

(declare-fun lt!313884 () Unit!24017)

(declare-fun choose!36 (List!13011) Unit!24017)

(assert (=> d!94191 (= lt!313884 (choose!36 acc!681))))

(assert (=> d!94191 (= (lemmaListSubSeqRefl!0 acc!681) lt!313884)))

(declare-fun bs!20046 () Bool)

(assert (= bs!20046 d!94191))

(assert (=> bs!20046 m!647857))

(declare-fun m!647953 () Bool)

(assert (=> bs!20046 m!647953))

(assert (=> b!683287 d!94191))

(declare-fun bm!34010 () Bool)

(declare-fun call!34013 () Bool)

(declare-fun c!77479 () Bool)

(assert (=> bm!34010 (= call!34013 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77479 (Cons!13007 (select (arr!18970 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!683404 () Bool)

(declare-fun e!389273 () Bool)

(assert (=> b!683404 (= e!389273 call!34013)))

(declare-fun b!683405 () Bool)

(declare-fun e!389270 () Bool)

(assert (=> b!683405 (= e!389270 (contains!3588 acc!681 (select (arr!18970 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!94193 () Bool)

(declare-fun res!449181 () Bool)

(declare-fun e!389271 () Bool)

(assert (=> d!94193 (=> res!449181 e!389271)))

(assert (=> d!94193 (= res!449181 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19334 a!3626)))))

(assert (=> d!94193 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!389271)))

(declare-fun b!683406 () Bool)

(assert (=> b!683406 (= e!389273 call!34013)))

(declare-fun b!683407 () Bool)

(declare-fun e!389272 () Bool)

(assert (=> b!683407 (= e!389271 e!389272)))

(declare-fun res!449182 () Bool)

(assert (=> b!683407 (=> (not res!449182) (not e!389272))))

(assert (=> b!683407 (= res!449182 (not e!389270))))

(declare-fun res!449180 () Bool)

(assert (=> b!683407 (=> (not res!449180) (not e!389270))))

(assert (=> b!683407 (= res!449180 (validKeyInArray!0 (select (arr!18970 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!683408 () Bool)

(assert (=> b!683408 (= e!389272 e!389273)))

(assert (=> b!683408 (= c!77479 (validKeyInArray!0 (select (arr!18970 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!94193 (not res!449181)) b!683407))

(assert (= (and b!683407 res!449180) b!683405))

(assert (= (and b!683407 res!449182) b!683408))

(assert (= (and b!683408 c!77479) b!683406))

(assert (= (and b!683408 (not c!77479)) b!683404))

(assert (= (or b!683406 b!683404) bm!34010))

(declare-fun m!647955 () Bool)

(assert (=> bm!34010 m!647955))

(declare-fun m!647957 () Bool)

(assert (=> bm!34010 m!647957))

(assert (=> b!683405 m!647955))

(assert (=> b!683405 m!647955))

(declare-fun m!647959 () Bool)

(assert (=> b!683405 m!647959))

(assert (=> b!683407 m!647955))

(assert (=> b!683407 m!647955))

(declare-fun m!647965 () Bool)

(assert (=> b!683407 m!647965))

(assert (=> b!683408 m!647955))

(assert (=> b!683408 m!647955))

(assert (=> b!683408 m!647965))

(assert (=> b!683287 d!94193))

(declare-fun d!94195 () Bool)

(declare-fun res!449195 () Bool)

(declare-fun e!389289 () Bool)

(assert (=> d!94195 (=> res!449195 e!389289)))

(assert (=> d!94195 (= res!449195 ((_ is Nil!13008) lt!313846))))

(assert (=> d!94195 (= (noDuplicate!835 lt!313846) e!389289)))

(declare-fun b!683427 () Bool)

(declare-fun e!389290 () Bool)

(assert (=> b!683427 (= e!389289 e!389290)))

(declare-fun res!449196 () Bool)

(assert (=> b!683427 (=> (not res!449196) (not e!389290))))

(assert (=> b!683427 (= res!449196 (not (contains!3588 (t!19254 lt!313846) (h!14052 lt!313846))))))

(declare-fun b!683428 () Bool)

(assert (=> b!683428 (= e!389290 (noDuplicate!835 (t!19254 lt!313846)))))

(assert (= (and d!94195 (not res!449195)) b!683427))

(assert (= (and b!683427 res!449196) b!683428))

(declare-fun m!647983 () Bool)

(assert (=> b!683427 m!647983))

(declare-fun m!647985 () Bool)

(assert (=> b!683428 m!647985))

(assert (=> b!683293 d!94195))

(declare-fun d!94201 () Bool)

(declare-fun lt!313890 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!284 (List!13011) (InoxSet (_ BitVec 64)))

(assert (=> d!94201 (= lt!313890 (select (content!284 acc!681) k0!2843))))

(declare-fun e!389313 () Bool)

(assert (=> d!94201 (= lt!313890 e!389313)))

(declare-fun res!449219 () Bool)

(assert (=> d!94201 (=> (not res!449219) (not e!389313))))

(assert (=> d!94201 (= res!449219 ((_ is Cons!13007) acc!681))))

(assert (=> d!94201 (= (contains!3588 acc!681 k0!2843) lt!313890)))

(declare-fun b!683451 () Bool)

(declare-fun e!389314 () Bool)

(assert (=> b!683451 (= e!389313 e!389314)))

(declare-fun res!449220 () Bool)

(assert (=> b!683451 (=> res!449220 e!389314)))

(assert (=> b!683451 (= res!449220 (= (h!14052 acc!681) k0!2843))))

(declare-fun b!683452 () Bool)

(assert (=> b!683452 (= e!389314 (contains!3588 (t!19254 acc!681) k0!2843))))

(assert (= (and d!94201 res!449219) b!683451))

(assert (= (and b!683451 (not res!449220)) b!683452))

(declare-fun m!647995 () Bool)

(assert (=> d!94201 m!647995))

(declare-fun m!647997 () Bool)

(assert (=> d!94201 m!647997))

(declare-fun m!647999 () Bool)

(assert (=> b!683452 m!647999))

(assert (=> b!683294 d!94201))

(declare-fun d!94207 () Bool)

(declare-fun res!449235 () Bool)

(declare-fun e!389329 () Bool)

(assert (=> d!94207 (=> res!449235 e!389329)))

(assert (=> d!94207 (= res!449235 (= (select (arr!18970 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!94207 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!389329)))

(declare-fun b!683467 () Bool)

(declare-fun e!389330 () Bool)

(assert (=> b!683467 (= e!389329 e!389330)))

(declare-fun res!449236 () Bool)

(assert (=> b!683467 (=> (not res!449236) (not e!389330))))

(assert (=> b!683467 (= res!449236 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19334 a!3626)))))

(declare-fun b!683468 () Bool)

(assert (=> b!683468 (= e!389330 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94207 (not res!449235)) b!683467))

(assert (= (and b!683467 res!449236) b!683468))

(assert (=> d!94207 m!647933))

(declare-fun m!648015 () Bool)

(assert (=> b!683468 m!648015))

(assert (=> b!683280 d!94207))

(declare-fun d!94217 () Bool)

(declare-fun lt!313892 () Bool)

(assert (=> d!94217 (= lt!313892 (select (content!284 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!389331 () Bool)

(assert (=> d!94217 (= lt!313892 e!389331)))

(declare-fun res!449237 () Bool)

(assert (=> d!94217 (=> (not res!449237) (not e!389331))))

(assert (=> d!94217 (= res!449237 ((_ is Cons!13007) acc!681))))

(assert (=> d!94217 (= (contains!3588 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313892)))

(declare-fun b!683469 () Bool)

(declare-fun e!389332 () Bool)

(assert (=> b!683469 (= e!389331 e!389332)))

(declare-fun res!449238 () Bool)

(assert (=> b!683469 (=> res!449238 e!389332)))

(assert (=> b!683469 (= res!449238 (= (h!14052 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!683470 () Bool)

(assert (=> b!683470 (= e!389332 (contains!3588 (t!19254 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94217 res!449237) b!683469))

(assert (= (and b!683469 (not res!449238)) b!683470))

(assert (=> d!94217 m!647995))

(declare-fun m!648017 () Bool)

(assert (=> d!94217 m!648017))

(declare-fun m!648019 () Bool)

(assert (=> b!683470 m!648019))

(assert (=> b!683292 d!94217))

(declare-fun d!94219 () Bool)

(declare-fun res!449239 () Bool)

(declare-fun e!389333 () Bool)

(assert (=> d!94219 (=> res!449239 e!389333)))

(assert (=> d!94219 (= res!449239 ((_ is Nil!13008) acc!681))))

(assert (=> d!94219 (= (noDuplicate!835 acc!681) e!389333)))

(declare-fun b!683471 () Bool)

(declare-fun e!389334 () Bool)

(assert (=> b!683471 (= e!389333 e!389334)))

(declare-fun res!449240 () Bool)

(assert (=> b!683471 (=> (not res!449240) (not e!389334))))

(assert (=> b!683471 (= res!449240 (not (contains!3588 (t!19254 acc!681) (h!14052 acc!681))))))

(declare-fun b!683472 () Bool)

(assert (=> b!683472 (= e!389334 (noDuplicate!835 (t!19254 acc!681)))))

(assert (= (and d!94219 (not res!449239)) b!683471))

(assert (= (and b!683471 res!449240) b!683472))

(declare-fun m!648021 () Bool)

(assert (=> b!683471 m!648021))

(declare-fun m!648023 () Bool)

(assert (=> b!683472 m!648023))

(assert (=> b!683281 d!94219))

(declare-fun d!94221 () Bool)

(assert (=> d!94221 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!683282 d!94221))

(declare-fun d!94225 () Bool)

(declare-fun lt!313896 () Bool)

(assert (=> d!94225 (= lt!313896 (select (content!284 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!389341 () Bool)

(assert (=> d!94225 (= lt!313896 e!389341)))

(declare-fun res!449247 () Bool)

(assert (=> d!94225 (=> (not res!449247) (not e!389341))))

(assert (=> d!94225 (= res!449247 ((_ is Cons!13007) acc!681))))

(assert (=> d!94225 (= (contains!3588 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313896)))

(declare-fun b!683479 () Bool)

(declare-fun e!389342 () Bool)

(assert (=> b!683479 (= e!389341 e!389342)))

(declare-fun res!449248 () Bool)

(assert (=> b!683479 (=> res!449248 e!389342)))

(assert (=> b!683479 (= res!449248 (= (h!14052 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!683480 () Bool)

(assert (=> b!683480 (= e!389342 (contains!3588 (t!19254 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94225 res!449247) b!683479))

(assert (= (and b!683479 (not res!449248)) b!683480))

(assert (=> d!94225 m!647995))

(declare-fun m!648033 () Bool)

(assert (=> d!94225 m!648033))

(declare-fun m!648035 () Bool)

(assert (=> b!683480 m!648035))

(assert (=> b!683288 d!94225))

(assert (=> b!683277 d!94201))

(assert (=> b!683289 d!94179))

(declare-fun d!94229 () Bool)

(declare-fun res!449252 () Bool)

(declare-fun e!389346 () Bool)

(assert (=> d!94229 (=> res!449252 e!389346)))

(assert (=> d!94229 (= res!449252 (= (select (arr!18970 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!94229 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!389346)))

(declare-fun b!683483 () Bool)

(declare-fun e!389347 () Bool)

(assert (=> b!683483 (= e!389346 e!389347)))

(declare-fun res!449253 () Bool)

(assert (=> b!683483 (=> (not res!449253) (not e!389347))))

(assert (=> b!683483 (= res!449253 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19334 a!3626)))))

(declare-fun b!683484 () Bool)

(assert (=> b!683484 (= e!389347 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94229 (not res!449252)) b!683483))

(assert (= (and b!683483 res!449253) b!683484))

(assert (=> d!94229 m!647955))

(declare-fun m!648043 () Bool)

(assert (=> b!683484 m!648043))

(assert (=> b!683289 d!94229))

(declare-fun d!94235 () Bool)

(assert (=> d!94235 (= (-!139 ($colon$colon!339 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!313903 () Unit!24017)

(declare-fun choose!16 ((_ BitVec 64) List!13011) Unit!24017)

(assert (=> d!94235 (= lt!313903 (choose!16 k0!2843 acc!681))))

(assert (=> d!94235 (not (contains!3588 acc!681 k0!2843))))

(assert (=> d!94235 (= (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681) lt!313903)))

(declare-fun bs!20049 () Bool)

(assert (= bs!20049 d!94235))

(assert (=> bs!20049 m!647873))

(assert (=> bs!20049 m!647873))

(declare-fun m!648047 () Bool)

(assert (=> bs!20049 m!648047))

(declare-fun m!648049 () Bool)

(assert (=> bs!20049 m!648049))

(assert (=> bs!20049 m!647841))

(assert (=> b!683289 d!94235))

(declare-fun d!94243 () Bool)

(declare-fun e!389378 () Bool)

(assert (=> d!94243 e!389378))

(declare-fun res!449269 () Bool)

(assert (=> d!94243 (=> (not res!449269) (not e!389378))))

(declare-fun lt!313909 () List!13011)

(declare-fun size!19338 (List!13011) Int)

(assert (=> d!94243 (= res!449269 (<= (size!19338 lt!313909) (size!19338 lt!313846)))))

(declare-fun e!389380 () List!13011)

(assert (=> d!94243 (= lt!313909 e!389380)))

(declare-fun c!77496 () Bool)

(assert (=> d!94243 (= c!77496 ((_ is Cons!13007) lt!313846))))

(assert (=> d!94243 (= (-!139 lt!313846 k0!2843) lt!313909)))

(declare-fun b!683527 () Bool)

(declare-fun e!389379 () List!13011)

(assert (=> b!683527 (= e!389380 e!389379)))

(declare-fun c!77497 () Bool)

(assert (=> b!683527 (= c!77497 (= k0!2843 (h!14052 lt!313846)))))

(declare-fun b!683528 () Bool)

(declare-fun call!34024 () List!13011)

(assert (=> b!683528 (= e!389379 (Cons!13007 (h!14052 lt!313846) call!34024))))

(declare-fun b!683529 () Bool)

(assert (=> b!683529 (= e!389379 call!34024)))

(declare-fun bm!34021 () Bool)

(assert (=> bm!34021 (= call!34024 (-!139 (t!19254 lt!313846) k0!2843))))

(declare-fun b!683530 () Bool)

(assert (=> b!683530 (= e!389380 Nil!13008)))

(declare-fun b!683531 () Bool)

(assert (=> b!683531 (= e!389378 (= (content!284 lt!313909) ((_ map and) (content!284 lt!313846) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2843 true)))))))

(assert (= (and d!94243 c!77496) b!683527))

(assert (= (and d!94243 (not c!77496)) b!683530))

(assert (= (and b!683527 c!77497) b!683529))

(assert (= (and b!683527 (not c!77497)) b!683528))

(assert (= (or b!683529 b!683528) bm!34021))

(assert (= (and d!94243 res!449269) b!683531))

(declare-fun m!648069 () Bool)

(assert (=> d!94243 m!648069))

(declare-fun m!648071 () Bool)

(assert (=> d!94243 m!648071))

(declare-fun m!648073 () Bool)

(assert (=> bm!34021 m!648073))

(declare-fun m!648075 () Bool)

(assert (=> b!683531 m!648075))

(declare-fun m!648077 () Bool)

(assert (=> b!683531 m!648077))

(declare-fun m!648079 () Bool)

(assert (=> b!683531 m!648079))

(assert (=> b!683289 d!94243))

(declare-fun d!94251 () Bool)

(declare-fun res!449278 () Bool)

(declare-fun e!389389 () Bool)

(assert (=> d!94251 (=> res!449278 e!389389)))

(assert (=> d!94251 (= res!449278 (= (select (arr!18970 (array!39577 (store (arr!18970 a!3626) i!1382 k0!2843) (size!19334 a!3626))) from!3004) k0!2843))))

(assert (=> d!94251 (= (arrayContainsKey!0 (array!39577 (store (arr!18970 a!3626) i!1382 k0!2843) (size!19334 a!3626)) k0!2843 from!3004) e!389389)))

(declare-fun b!683540 () Bool)

(declare-fun e!389390 () Bool)

(assert (=> b!683540 (= e!389389 e!389390)))

(declare-fun res!449279 () Bool)

(assert (=> b!683540 (=> (not res!449279) (not e!389390))))

(assert (=> b!683540 (= res!449279 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19334 (array!39577 (store (arr!18970 a!3626) i!1382 k0!2843) (size!19334 a!3626)))))))

(declare-fun b!683541 () Bool)

(assert (=> b!683541 (= e!389390 (arrayContainsKey!0 (array!39577 (store (arr!18970 a!3626) i!1382 k0!2843) (size!19334 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94251 (not res!449278)) b!683540))

(assert (= (and b!683540 res!449279) b!683541))

(declare-fun m!648081 () Bool)

(assert (=> d!94251 m!648081))

(declare-fun m!648083 () Bool)

(assert (=> b!683541 m!648083))

(assert (=> b!683289 d!94251))

(assert (=> b!683289 d!94191))

(declare-fun d!94253 () Bool)

(assert (=> d!94253 (= (validKeyInArray!0 (select (arr!18970 a!3626) from!3004)) (and (not (= (select (arr!18970 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18970 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!683289 d!94253))

(declare-fun d!94255 () Bool)

(assert (=> d!94255 (= ($colon$colon!339 acc!681 k0!2843) (Cons!13007 k0!2843 acc!681))))

(assert (=> b!683289 d!94255))

(assert (=> b!683289 d!94193))

(declare-fun d!94257 () Bool)

(assert (=> d!94257 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!313915 () Unit!24017)

(declare-fun choose!13 (array!39576 (_ BitVec 64) (_ BitVec 32)) Unit!24017)

(assert (=> d!94257 (= lt!313915 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!94257 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94257 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!313915)))

(declare-fun bs!20051 () Bool)

(assert (= bs!20051 d!94257))

(assert (=> bs!20051 m!647863))

(declare-fun m!648095 () Bool)

(assert (=> bs!20051 m!648095))

(assert (=> b!683290 d!94257))

(check-sat (not b!683366) (not b!683428) (not bm!34021) (not d!94225) (not d!94201) (not d!94243) (not b!683365) (not bm!34004) (not b!683531) (not b!683408) (not b!683484) (not b!683468) (not b!683383) (not b!683370) (not d!94217) (not b!683407) (not bm!34010) (not b!683368) (not d!94191) (not b!683405) (not b!683471) (not b!683480) (not b!683427) (not b!683470) (not b!683452) (not d!94189) (not bm!34005) (not d!94257) (not d!94235) (not b!683382) (not b!683541) (not b!683363) (not b!683371) (not b!683472))
(check-sat)
