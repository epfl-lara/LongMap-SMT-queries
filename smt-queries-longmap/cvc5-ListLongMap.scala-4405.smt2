; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60650 () Bool)

(assert start!60650)

(declare-fun b!681243 () Bool)

(declare-fun res!447417 () Bool)

(declare-fun e!388071 () Bool)

(assert (=> b!681243 (=> (not res!447417) (not e!388071))))

(declare-datatypes ((List!12986 0))(
  ( (Nil!12983) (Cons!12982 (h!14027 (_ BitVec 64)) (t!19220 List!12986)) )
))
(declare-fun acc!681 () List!12986)

(declare-fun contains!3563 (List!12986 (_ BitVec 64)) Bool)

(assert (=> b!681243 (= res!447417 (not (contains!3563 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!681244 () Bool)

(declare-fun res!447407 () Bool)

(assert (=> b!681244 (=> (not res!447407) (not e!388071))))

(declare-datatypes ((array!39517 0))(
  ( (array!39518 (arr!18945 (Array (_ BitVec 32) (_ BitVec 64))) (size!19309 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39517)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39517 (_ BitVec 32) List!12986) Bool)

(assert (=> b!681244 (= res!447407 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!681245 () Bool)

(declare-fun res!447421 () Bool)

(assert (=> b!681245 (=> (not res!447421) (not e!388071))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!681245 (= res!447421 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19309 a!3626))))))

(declare-fun b!681246 () Bool)

(declare-fun res!447409 () Bool)

(assert (=> b!681246 (=> (not res!447409) (not e!388071))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!681246 (= res!447409 (validKeyInArray!0 k!2843))))

(declare-fun b!681247 () Bool)

(declare-fun res!447412 () Bool)

(assert (=> b!681247 (=> (not res!447412) (not e!388071))))

(assert (=> b!681247 (= res!447412 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19309 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!681248 () Bool)

(declare-fun res!447425 () Bool)

(assert (=> b!681248 (=> (not res!447425) (not e!388071))))

(declare-fun e!388074 () Bool)

(assert (=> b!681248 (= res!447425 e!388074)))

(declare-fun res!447422 () Bool)

(assert (=> b!681248 (=> res!447422 e!388074)))

(declare-fun e!388070 () Bool)

(assert (=> b!681248 (= res!447422 e!388070)))

(declare-fun res!447419 () Bool)

(assert (=> b!681248 (=> (not res!447419) (not e!388070))))

(assert (=> b!681248 (= res!447419 (bvsgt from!3004 i!1382))))

(declare-fun b!681249 () Bool)

(declare-fun res!447410 () Bool)

(assert (=> b!681249 (=> (not res!447410) (not e!388071))))

(declare-fun arrayContainsKey!0 (array!39517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!681249 (= res!447410 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!681250 () Bool)

(declare-fun e!388076 () Bool)

(assert (=> b!681250 (= e!388074 e!388076)))

(declare-fun res!447414 () Bool)

(assert (=> b!681250 (=> (not res!447414) (not e!388076))))

(assert (=> b!681250 (= res!447414 (bvsle from!3004 i!1382))))

(declare-fun b!681251 () Bool)

(declare-fun res!447408 () Bool)

(assert (=> b!681251 (=> (not res!447408) (not e!388071))))

(assert (=> b!681251 (= res!447408 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12983))))

(declare-fun b!681252 () Bool)

(declare-fun res!447418 () Bool)

(declare-fun e!388075 () Bool)

(assert (=> b!681252 (=> res!447418 e!388075)))

(declare-fun lt!313251 () List!12986)

(declare-fun noDuplicate!810 (List!12986) Bool)

(assert (=> b!681252 (= res!447418 (not (noDuplicate!810 lt!313251)))))

(declare-fun res!447423 () Bool)

(assert (=> start!60650 (=> (not res!447423) (not e!388071))))

(assert (=> start!60650 (= res!447423 (and (bvslt (size!19309 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19309 a!3626))))))

(assert (=> start!60650 e!388071))

(assert (=> start!60650 true))

(declare-fun array_inv!14741 (array!39517) Bool)

(assert (=> start!60650 (array_inv!14741 a!3626)))

(declare-fun b!681253 () Bool)

(declare-fun subseq!149 (List!12986 List!12986) Bool)

(assert (=> b!681253 (= e!388075 (subseq!149 acc!681 lt!313251))))

(declare-fun b!681254 () Bool)

(declare-fun res!447415 () Bool)

(assert (=> b!681254 (=> (not res!447415) (not e!388071))))

(assert (=> b!681254 (= res!447415 (noDuplicate!810 acc!681))))

(declare-fun b!681255 () Bool)

(assert (=> b!681255 (= e!388070 (contains!3563 acc!681 k!2843))))

(declare-fun b!681256 () Bool)

(declare-fun res!447420 () Bool)

(assert (=> b!681256 (=> (not res!447420) (not e!388071))))

(assert (=> b!681256 (= res!447420 (not (contains!3563 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!681257 () Bool)

(declare-datatypes ((Unit!23898 0))(
  ( (Unit!23899) )
))
(declare-fun e!388073 () Unit!23898)

(declare-fun Unit!23900 () Unit!23898)

(assert (=> b!681257 (= e!388073 Unit!23900)))

(declare-fun b!681258 () Bool)

(assert (=> b!681258 (= e!388076 (not (contains!3563 acc!681 k!2843)))))

(declare-fun b!681259 () Bool)

(declare-fun res!447413 () Bool)

(assert (=> b!681259 (=> res!447413 e!388075)))

(assert (=> b!681259 (= res!447413 (contains!3563 lt!313251 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681260 () Bool)

(declare-fun Unit!23901 () Unit!23898)

(assert (=> b!681260 (= e!388073 Unit!23901)))

(declare-fun lt!313249 () Unit!23898)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39517 (_ BitVec 64) (_ BitVec 32)) Unit!23898)

(assert (=> b!681260 (= lt!313249 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!681260 false))

(declare-fun b!681261 () Bool)

(declare-fun e!388072 () Bool)

(assert (=> b!681261 (= e!388072 e!388075)))

(declare-fun res!447416 () Bool)

(assert (=> b!681261 (=> res!447416 e!388075)))

(assert (=> b!681261 (= res!447416 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!314 (List!12986 (_ BitVec 64)) List!12986)

(assert (=> b!681261 (= lt!313251 ($colon$colon!314 acc!681 (select (arr!18945 a!3626) from!3004)))))

(assert (=> b!681261 (subseq!149 acc!681 acc!681)))

(declare-fun lt!313252 () Unit!23898)

(declare-fun lemmaListSubSeqRefl!0 (List!12986) Unit!23898)

(assert (=> b!681261 (= lt!313252 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!681262 () Bool)

(declare-fun res!447411 () Bool)

(assert (=> b!681262 (=> res!447411 e!388075)))

(assert (=> b!681262 (= res!447411 (contains!3563 lt!313251 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681263 () Bool)

(assert (=> b!681263 (= e!388071 (not e!388072))))

(declare-fun res!447424 () Bool)

(assert (=> b!681263 (=> res!447424 e!388072)))

(assert (=> b!681263 (= res!447424 (not (validKeyInArray!0 (select (arr!18945 a!3626) from!3004))))))

(declare-fun lt!313250 () Unit!23898)

(assert (=> b!681263 (= lt!313250 e!388073)))

(declare-fun c!77285 () Bool)

(assert (=> b!681263 (= c!77285 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!681263 (arrayContainsKey!0 (array!39518 (store (arr!18945 a!3626) i!1382 k!2843) (size!19309 a!3626)) k!2843 from!3004)))

(assert (= (and start!60650 res!447423) b!681254))

(assert (= (and b!681254 res!447415) b!681243))

(assert (= (and b!681243 res!447417) b!681256))

(assert (= (and b!681256 res!447420) b!681248))

(assert (= (and b!681248 res!447419) b!681255))

(assert (= (and b!681248 (not res!447422)) b!681250))

(assert (= (and b!681250 res!447414) b!681258))

(assert (= (and b!681248 res!447425) b!681251))

(assert (= (and b!681251 res!447408) b!681244))

(assert (= (and b!681244 res!447407) b!681245))

(assert (= (and b!681245 res!447421) b!681246))

(assert (= (and b!681246 res!447409) b!681249))

(assert (= (and b!681249 res!447410) b!681247))

(assert (= (and b!681247 res!447412) b!681263))

(assert (= (and b!681263 c!77285) b!681260))

(assert (= (and b!681263 (not c!77285)) b!681257))

(assert (= (and b!681263 (not res!447424)) b!681261))

(assert (= (and b!681261 (not res!447416)) b!681252))

(assert (= (and b!681252 (not res!447418)) b!681262))

(assert (= (and b!681262 (not res!447411)) b!681259))

(assert (= (and b!681259 (not res!447413)) b!681253))

(declare-fun m!646133 () Bool)

(assert (=> b!681260 m!646133))

(declare-fun m!646135 () Bool)

(assert (=> b!681251 m!646135))

(declare-fun m!646137 () Bool)

(assert (=> b!681259 m!646137))

(declare-fun m!646139 () Bool)

(assert (=> b!681255 m!646139))

(assert (=> b!681258 m!646139))

(declare-fun m!646141 () Bool)

(assert (=> b!681253 m!646141))

(declare-fun m!646143 () Bool)

(assert (=> b!681261 m!646143))

(assert (=> b!681261 m!646143))

(declare-fun m!646145 () Bool)

(assert (=> b!681261 m!646145))

(declare-fun m!646147 () Bool)

(assert (=> b!681261 m!646147))

(declare-fun m!646149 () Bool)

(assert (=> b!681261 m!646149))

(declare-fun m!646151 () Bool)

(assert (=> b!681262 m!646151))

(declare-fun m!646153 () Bool)

(assert (=> b!681243 m!646153))

(declare-fun m!646155 () Bool)

(assert (=> b!681244 m!646155))

(declare-fun m!646157 () Bool)

(assert (=> b!681246 m!646157))

(assert (=> b!681263 m!646143))

(declare-fun m!646159 () Bool)

(assert (=> b!681263 m!646159))

(declare-fun m!646161 () Bool)

(assert (=> b!681263 m!646161))

(assert (=> b!681263 m!646143))

(declare-fun m!646163 () Bool)

(assert (=> b!681263 m!646163))

(declare-fun m!646165 () Bool)

(assert (=> b!681263 m!646165))

(declare-fun m!646167 () Bool)

(assert (=> b!681256 m!646167))

(declare-fun m!646169 () Bool)

(assert (=> b!681254 m!646169))

(declare-fun m!646171 () Bool)

(assert (=> b!681249 m!646171))

(declare-fun m!646173 () Bool)

(assert (=> start!60650 m!646173))

(declare-fun m!646175 () Bool)

(assert (=> b!681252 m!646175))

(push 1)

(assert (not b!681263))

(assert (not b!681261))

(assert (not b!681252))

(assert (not start!60650))

(assert (not b!681249))

(assert (not b!681258))

(assert (not b!681253))

(assert (not b!681255))

(assert (not b!681246))

(assert (not b!681254))

(assert (not b!681259))

(assert (not b!681243))

(assert (not b!681260))

(assert (not b!681244))

(assert (not b!681262))

(assert (not b!681251))

(assert (not b!681256))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93801 () Bool)

(declare-fun res!447564 () Bool)

(declare-fun e!388150 () Bool)

(assert (=> d!93801 (=> res!447564 e!388150)))

(assert (=> d!93801 (= res!447564 (= (select (arr!18945 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!93801 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!388150)))

(declare-fun b!681414 () Bool)

(declare-fun e!388151 () Bool)

(assert (=> b!681414 (= e!388150 e!388151)))

(declare-fun res!447565 () Bool)

(assert (=> b!681414 (=> (not res!447565) (not e!388151))))

(assert (=> b!681414 (= res!447565 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19309 a!3626)))))

(declare-fun b!681415 () Bool)

(assert (=> b!681415 (= e!388151 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93801 (not res!447564)) b!681414))

(assert (= (and b!681414 res!447565) b!681415))

(declare-fun m!646275 () Bool)

(assert (=> d!93801 m!646275))

(declare-fun m!646277 () Bool)

(assert (=> b!681415 m!646277))

(assert (=> b!681249 d!93801))

(declare-fun d!93803 () Bool)

(assert (=> d!93803 (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))

(declare-fun lt!313283 () Unit!23898)

(declare-fun choose!13 (array!39517 (_ BitVec 64) (_ BitVec 32)) Unit!23898)

(assert (=> d!93803 (= lt!313283 (choose!13 a!3626 k!2843 from!3004))))

(assert (=> d!93803 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!93803 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004) lt!313283)))

(declare-fun bs!19999 () Bool)

(assert (= bs!19999 d!93803))

(assert (=> bs!19999 m!646171))

(declare-fun m!646287 () Bool)

(assert (=> bs!19999 m!646287))

(assert (=> b!681260 d!93803))

(declare-fun b!681458 () Bool)

(declare-fun e!388193 () Bool)

(declare-fun call!33965 () Bool)

(assert (=> b!681458 (= e!388193 call!33965)))

(declare-fun d!93813 () Bool)

(declare-fun res!447605 () Bool)

(declare-fun e!388194 () Bool)

(assert (=> d!93813 (=> res!447605 e!388194)))

(assert (=> d!93813 (= res!447605 (bvsge #b00000000000000000000000000000000 (size!19309 a!3626)))))

(assert (=> d!93813 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12983) e!388194)))

(declare-fun b!681459 () Bool)

(declare-fun e!388195 () Bool)

(assert (=> b!681459 (= e!388195 (contains!3563 Nil!12983 (select (arr!18945 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!681460 () Bool)

(declare-fun e!388192 () Bool)

(assert (=> b!681460 (= e!388192 e!388193)))

(declare-fun c!77294 () Bool)

(assert (=> b!681460 (= c!77294 (validKeyInArray!0 (select (arr!18945 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!681461 () Bool)

(assert (=> b!681461 (= e!388194 e!388192)))

(declare-fun res!447606 () Bool)

(assert (=> b!681461 (=> (not res!447606) (not e!388192))))

(assert (=> b!681461 (= res!447606 (not e!388195))))

(declare-fun res!447604 () Bool)

(assert (=> b!681461 (=> (not res!447604) (not e!388195))))

(assert (=> b!681461 (= res!447604 (validKeyInArray!0 (select (arr!18945 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!33962 () Bool)

(assert (=> bm!33962 (= call!33965 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77294 (Cons!12982 (select (arr!18945 a!3626) #b00000000000000000000000000000000) Nil!12983) Nil!12983)))))

(declare-fun b!681462 () Bool)

(assert (=> b!681462 (= e!388193 call!33965)))

(assert (= (and d!93813 (not res!447605)) b!681461))

(assert (= (and b!681461 res!447604) b!681459))

(assert (= (and b!681461 res!447606) b!681460))

(assert (= (and b!681460 c!77294) b!681458))

(assert (= (and b!681460 (not c!77294)) b!681462))

(assert (= (or b!681458 b!681462) bm!33962))

(assert (=> b!681459 m!646275))

(assert (=> b!681459 m!646275))

(declare-fun m!646315 () Bool)

(assert (=> b!681459 m!646315))

(assert (=> b!681460 m!646275))

(assert (=> b!681460 m!646275))

(declare-fun m!646317 () Bool)

(assert (=> b!681460 m!646317))

(assert (=> b!681461 m!646275))

(assert (=> b!681461 m!646275))

(assert (=> b!681461 m!646317))

(assert (=> bm!33962 m!646275))

(declare-fun m!646319 () Bool)

(assert (=> bm!33962 m!646319))

(assert (=> b!681251 d!93813))

(declare-fun d!93833 () Bool)

(declare-fun lt!313296 () Bool)

(declare-fun content!275 (List!12986) (Set (_ BitVec 64)))

(assert (=> d!93833 (= lt!313296 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!275 lt!313251)))))

(declare-fun e!388217 () Bool)

(assert (=> d!93833 (= lt!313296 e!388217)))

(declare-fun res!447625 () Bool)

(assert (=> d!93833 (=> (not res!447625) (not e!388217))))

(assert (=> d!93833 (= res!447625 (is-Cons!12982 lt!313251))))

(assert (=> d!93833 (= (contains!3563 lt!313251 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313296)))

(declare-fun b!681485 () Bool)

(declare-fun e!388216 () Bool)

(assert (=> b!681485 (= e!388217 e!388216)))

(declare-fun res!447626 () Bool)

(assert (=> b!681485 (=> res!447626 e!388216)))

(assert (=> b!681485 (= res!447626 (= (h!14027 lt!313251) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681486 () Bool)

(assert (=> b!681486 (= e!388216 (contains!3563 (t!19220 lt!313251) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93833 res!447625) b!681485))

(assert (= (and b!681485 (not res!447626)) b!681486))

(declare-fun m!646323 () Bool)

(assert (=> d!93833 m!646323))

(declare-fun m!646325 () Bool)

(assert (=> d!93833 m!646325))

(declare-fun m!646327 () Bool)

(assert (=> b!681486 m!646327))

(assert (=> b!681262 d!93833))

(declare-fun d!93839 () Bool)

(assert (=> d!93839 (= ($colon$colon!314 acc!681 (select (arr!18945 a!3626) from!3004)) (Cons!12982 (select (arr!18945 a!3626) from!3004) acc!681))))

(assert (=> b!681261 d!93839))

(declare-fun b!681519 () Bool)

(declare-fun e!388246 () Bool)

(assert (=> b!681519 (= e!388246 (subseq!149 acc!681 (t!19220 acc!681)))))

(declare-fun b!681517 () Bool)

(declare-fun e!388248 () Bool)

(assert (=> b!681517 (= e!388248 e!388246)))

(declare-fun res!447657 () Bool)

(assert (=> b!681517 (=> res!447657 e!388246)))

(declare-fun e!388247 () Bool)

(assert (=> b!681517 (= res!447657 e!388247)))

(declare-fun res!447656 () Bool)

(assert (=> b!681517 (=> (not res!447656) (not e!388247))))

(assert (=> b!681517 (= res!447656 (= (h!14027 acc!681) (h!14027 acc!681)))))

(declare-fun d!93843 () Bool)

(declare-fun res!447655 () Bool)

(declare-fun e!388249 () Bool)

(assert (=> d!93843 (=> res!447655 e!388249)))

(assert (=> d!93843 (= res!447655 (is-Nil!12983 acc!681))))

(assert (=> d!93843 (= (subseq!149 acc!681 acc!681) e!388249)))

(declare-fun b!681516 () Bool)

(assert (=> b!681516 (= e!388249 e!388248)))

(declare-fun res!447654 () Bool)

(assert (=> b!681516 (=> (not res!447654) (not e!388248))))

(assert (=> b!681516 (= res!447654 (is-Cons!12982 acc!681))))

(declare-fun b!681518 () Bool)

(assert (=> b!681518 (= e!388247 (subseq!149 (t!19220 acc!681) (t!19220 acc!681)))))

(assert (= (and d!93843 (not res!447655)) b!681516))

(assert (= (and b!681516 res!447654) b!681517))

(assert (= (and b!681517 res!447656) b!681518))

(assert (= (and b!681517 (not res!447657)) b!681519))

(declare-fun m!646367 () Bool)

(assert (=> b!681519 m!646367))

(declare-fun m!646369 () Bool)

(assert (=> b!681518 m!646369))

(assert (=> b!681261 d!93843))

(declare-fun d!93865 () Bool)

(assert (=> d!93865 (subseq!149 acc!681 acc!681)))

(declare-fun lt!313307 () Unit!23898)

(declare-fun choose!36 (List!12986) Unit!23898)

(assert (=> d!93865 (= lt!313307 (choose!36 acc!681))))

(assert (=> d!93865 (= (lemmaListSubSeqRefl!0 acc!681) lt!313307)))

(declare-fun bs!20003 () Bool)

(assert (= bs!20003 d!93865))

(assert (=> bs!20003 m!646147))

(declare-fun m!646385 () Bool)

(assert (=> bs!20003 m!646385))

(assert (=> b!681261 d!93865))

(declare-fun d!93875 () Bool)

(assert (=> d!93875 (= (validKeyInArray!0 (select (arr!18945 a!3626) from!3004)) (and (not (= (select (arr!18945 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18945 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!681263 d!93875))

(declare-fun d!93879 () Bool)

(declare-fun res!447673 () Bool)

(declare-fun e!388266 () Bool)

(assert (=> d!93879 (=> res!447673 e!388266)))

(assert (=> d!93879 (= res!447673 (= (select (arr!18945 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k!2843))))

(assert (=> d!93879 (= (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!388266)))

(declare-fun b!681537 () Bool)

(declare-fun e!388267 () Bool)

(assert (=> b!681537 (= e!388266 e!388267)))

(declare-fun res!447674 () Bool)

(assert (=> b!681537 (=> (not res!447674) (not e!388267))))

(assert (=> b!681537 (= res!447674 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19309 a!3626)))))

(declare-fun b!681538 () Bool)

(assert (=> b!681538 (= e!388267 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93879 (not res!447673)) b!681537))

(assert (= (and b!681537 res!447674) b!681538))

(declare-fun m!646397 () Bool)

(assert (=> d!93879 m!646397))

(declare-fun m!646399 () Bool)

(assert (=> b!681538 m!646399))

(assert (=> b!681263 d!93879))

(declare-fun d!93881 () Bool)

(declare-fun res!447675 () Bool)

(declare-fun e!388268 () Bool)

(assert (=> d!93881 (=> res!447675 e!388268)))

(assert (=> d!93881 (= res!447675 (= (select (arr!18945 (array!39518 (store (arr!18945 a!3626) i!1382 k!2843) (size!19309 a!3626))) from!3004) k!2843))))

(assert (=> d!93881 (= (arrayContainsKey!0 (array!39518 (store (arr!18945 a!3626) i!1382 k!2843) (size!19309 a!3626)) k!2843 from!3004) e!388268)))

(declare-fun b!681539 () Bool)

(declare-fun e!388269 () Bool)

(assert (=> b!681539 (= e!388268 e!388269)))

(declare-fun res!447676 () Bool)

(assert (=> b!681539 (=> (not res!447676) (not e!388269))))

(assert (=> b!681539 (= res!447676 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19309 (array!39518 (store (arr!18945 a!3626) i!1382 k!2843) (size!19309 a!3626)))))))

(declare-fun b!681540 () Bool)

(assert (=> b!681540 (= e!388269 (arrayContainsKey!0 (array!39518 (store (arr!18945 a!3626) i!1382 k!2843) (size!19309 a!3626)) k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93881 (not res!447675)) b!681539))

(assert (= (and b!681539 res!447676) b!681540))

(declare-fun m!646401 () Bool)

(assert (=> d!93881 m!646401))

(declare-fun m!646403 () Bool)

(assert (=> b!681540 m!646403))

(assert (=> b!681263 d!93881))

(declare-fun d!93883 () Bool)

(declare-fun res!447687 () Bool)

(declare-fun e!388282 () Bool)

(assert (=> d!93883 (=> res!447687 e!388282)))

(assert (=> d!93883 (= res!447687 (is-Nil!12983 lt!313251))))

(assert (=> d!93883 (= (noDuplicate!810 lt!313251) e!388282)))

(declare-fun b!681555 () Bool)

(declare-fun e!388283 () Bool)

(assert (=> b!681555 (= e!388282 e!388283)))

(declare-fun res!447688 () Bool)

(assert (=> b!681555 (=> (not res!447688) (not e!388283))))

(assert (=> b!681555 (= res!447688 (not (contains!3563 (t!19220 lt!313251) (h!14027 lt!313251))))))

(declare-fun b!681556 () Bool)

(assert (=> b!681556 (= e!388283 (noDuplicate!810 (t!19220 lt!313251)))))

(assert (= (and d!93883 (not res!447687)) b!681555))

(assert (= (and b!681555 res!447688) b!681556))

(declare-fun m!646405 () Bool)

(assert (=> b!681555 m!646405))

(declare-fun m!646407 () Bool)

(assert (=> b!681556 m!646407))

(assert (=> b!681252 d!93883))

(declare-fun d!93885 () Bool)

(declare-fun lt!313309 () Bool)

(assert (=> d!93885 (= lt!313309 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!275 acc!681)))))

(declare-fun e!388285 () Bool)

(assert (=> d!93885 (= lt!313309 e!388285)))

(declare-fun res!447689 () Bool)

(assert (=> d!93885 (=> (not res!447689) (not e!388285))))

(assert (=> d!93885 (= res!447689 (is-Cons!12982 acc!681))))

(assert (=> d!93885 (= (contains!3563 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313309)))

(declare-fun b!681557 () Bool)

(declare-fun e!388284 () Bool)

(assert (=> b!681557 (= e!388285 e!388284)))

(declare-fun res!447690 () Bool)

(assert (=> b!681557 (=> res!447690 e!388284)))

(assert (=> b!681557 (= res!447690 (= (h!14027 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681558 () Bool)

(assert (=> b!681558 (= e!388284 (contains!3563 (t!19220 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93885 res!447689) b!681557))

(assert (= (and b!681557 (not res!447690)) b!681558))

(declare-fun m!646409 () Bool)

(assert (=> d!93885 m!646409))

(declare-fun m!646411 () Bool)

(assert (=> d!93885 m!646411))

(declare-fun m!646413 () Bool)

(assert (=> b!681558 m!646413))

(assert (=> b!681243 d!93885))

(declare-fun d!93887 () Bool)

(declare-fun res!447691 () Bool)

(declare-fun e!388286 () Bool)

(assert (=> d!93887 (=> res!447691 e!388286)))

(assert (=> d!93887 (= res!447691 (is-Nil!12983 acc!681))))

(assert (=> d!93887 (= (noDuplicate!810 acc!681) e!388286)))

(declare-fun b!681559 () Bool)

(declare-fun e!388287 () Bool)

(assert (=> b!681559 (= e!388286 e!388287)))

(declare-fun res!447692 () Bool)

(assert (=> b!681559 (=> (not res!447692) (not e!388287))))

(assert (=> b!681559 (= res!447692 (not (contains!3563 (t!19220 acc!681) (h!14027 acc!681))))))

(declare-fun b!681560 () Bool)

(assert (=> b!681560 (= e!388287 (noDuplicate!810 (t!19220 acc!681)))))

(assert (= (and d!93887 (not res!447691)) b!681559))

(assert (= (and b!681559 res!447692) b!681560))

(declare-fun m!646415 () Bool)

(assert (=> b!681559 m!646415))

(declare-fun m!646417 () Bool)

(assert (=> b!681560 m!646417))

(assert (=> b!681254 d!93887))

(declare-fun b!681564 () Bool)

(declare-fun e!388288 () Bool)

(assert (=> b!681564 (= e!388288 (subseq!149 acc!681 (t!19220 lt!313251)))))

(declare-fun b!681562 () Bool)

(declare-fun e!388290 () Bool)

(assert (=> b!681562 (= e!388290 e!388288)))

(declare-fun res!447696 () Bool)

(assert (=> b!681562 (=> res!447696 e!388288)))

(declare-fun e!388289 () Bool)

(assert (=> b!681562 (= res!447696 e!388289)))

(declare-fun res!447695 () Bool)

(assert (=> b!681562 (=> (not res!447695) (not e!388289))))

(assert (=> b!681562 (= res!447695 (= (h!14027 acc!681) (h!14027 lt!313251)))))

(declare-fun d!93889 () Bool)

(declare-fun res!447694 () Bool)

(declare-fun e!388291 () Bool)

(assert (=> d!93889 (=> res!447694 e!388291)))

(assert (=> d!93889 (= res!447694 (is-Nil!12983 acc!681))))

(assert (=> d!93889 (= (subseq!149 acc!681 lt!313251) e!388291)))

(declare-fun b!681561 () Bool)

(assert (=> b!681561 (= e!388291 e!388290)))

(declare-fun res!447693 () Bool)

(assert (=> b!681561 (=> (not res!447693) (not e!388290))))

(assert (=> b!681561 (= res!447693 (is-Cons!12982 lt!313251))))

(declare-fun b!681563 () Bool)

(assert (=> b!681563 (= e!388289 (subseq!149 (t!19220 acc!681) (t!19220 lt!313251)))))

(assert (= (and d!93889 (not res!447694)) b!681561))

(assert (= (and b!681561 res!447693) b!681562))

(assert (= (and b!681562 res!447695) b!681563))

(assert (= (and b!681562 (not res!447696)) b!681564))

(declare-fun m!646419 () Bool)

(assert (=> b!681564 m!646419))

(declare-fun m!646421 () Bool)

(assert (=> b!681563 m!646421))

(assert (=> b!681253 d!93889))

(declare-fun d!93891 () Bool)

(assert (=> d!93891 (= (array_inv!14741 a!3626) (bvsge (size!19309 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60650 d!93891))

(declare-fun d!93895 () Bool)

(declare-fun lt!313310 () Bool)

(assert (=> d!93895 (= lt!313310 (set.member k!2843 (content!275 acc!681)))))

(declare-fun e!388297 () Bool)

(assert (=> d!93895 (= lt!313310 e!388297)))

(declare-fun res!447700 () Bool)

(assert (=> d!93895 (=> (not res!447700) (not e!388297))))

(assert (=> d!93895 (= res!447700 (is-Cons!12982 acc!681))))

(assert (=> d!93895 (= (contains!3563 acc!681 k!2843) lt!313310)))

(declare-fun b!681570 () Bool)

(declare-fun e!388296 () Bool)

(assert (=> b!681570 (= e!388297 e!388296)))

(declare-fun res!447701 () Bool)

(assert (=> b!681570 (=> res!447701 e!388296)))

(assert (=> b!681570 (= res!447701 (= (h!14027 acc!681) k!2843))))

(declare-fun b!681571 () Bool)

(assert (=> b!681571 (= e!388296 (contains!3563 (t!19220 acc!681) k!2843))))

(assert (= (and d!93895 res!447700) b!681570))

(assert (= (and b!681570 (not res!447701)) b!681571))

(assert (=> d!93895 m!646409))

(declare-fun m!646429 () Bool)

(assert (=> d!93895 m!646429))

(declare-fun m!646433 () Bool)

(assert (=> b!681571 m!646433))

(assert (=> b!681255 d!93895))

(declare-fun b!681574 () Bool)

(declare-fun e!388301 () Bool)

(declare-fun call!33973 () Bool)

(assert (=> b!681574 (= e!388301 call!33973)))

(declare-fun d!93899 () Bool)

(declare-fun res!447705 () Bool)

(declare-fun e!388302 () Bool)

(assert (=> d!93899 (=> res!447705 e!388302)))

(assert (=> d!93899 (= res!447705 (bvsge from!3004 (size!19309 a!3626)))))

(assert (=> d!93899 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!388302)))

(declare-fun e!388303 () Bool)

(declare-fun b!681575 () Bool)

(assert (=> b!681575 (= e!388303 (contains!3563 acc!681 (select (arr!18945 a!3626) from!3004)))))

(declare-fun b!681576 () Bool)

(declare-fun e!388300 () Bool)

(assert (=> b!681576 (= e!388300 e!388301)))

(declare-fun c!77302 () Bool)

(assert (=> b!681576 (= c!77302 (validKeyInArray!0 (select (arr!18945 a!3626) from!3004)))))

(declare-fun b!681577 () Bool)

(assert (=> b!681577 (= e!388302 e!388300)))

(declare-fun res!447706 () Bool)

(assert (=> b!681577 (=> (not res!447706) (not e!388300))))

(assert (=> b!681577 (= res!447706 (not e!388303))))

(declare-fun res!447704 () Bool)

(assert (=> b!681577 (=> (not res!447704) (not e!388303))))

(assert (=> b!681577 (= res!447704 (validKeyInArray!0 (select (arr!18945 a!3626) from!3004)))))

(declare-fun bm!33970 () Bool)

(assert (=> bm!33970 (= call!33973 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77302 (Cons!12982 (select (arr!18945 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!681578 () Bool)

(assert (=> b!681578 (= e!388301 call!33973)))

(assert (= (and d!93899 (not res!447705)) b!681577))

(assert (= (and b!681577 res!447704) b!681575))

(assert (= (and b!681577 res!447706) b!681576))

(assert (= (and b!681576 c!77302) b!681574))

(assert (= (and b!681576 (not c!77302)) b!681578))

(assert (= (or b!681574 b!681578) bm!33970))

(assert (=> b!681575 m!646143))

(assert (=> b!681575 m!646143))

(declare-fun m!646441 () Bool)

(assert (=> b!681575 m!646441))

(assert (=> b!681576 m!646143))

(assert (=> b!681576 m!646143))

(assert (=> b!681576 m!646163))

(assert (=> b!681577 m!646143))

(assert (=> b!681577 m!646143))

(assert (=> b!681577 m!646163))

(assert (=> bm!33970 m!646143))

(declare-fun m!646443 () Bool)

(assert (=> bm!33970 m!646443))

(assert (=> b!681244 d!93899))

(declare-fun d!93905 () Bool)

(assert (=> d!93905 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!681246 d!93905))

(declare-fun d!93907 () Bool)

(declare-fun lt!313311 () Bool)

(assert (=> d!93907 (= lt!313311 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!275 acc!681)))))

(declare-fun e!388307 () Bool)

(assert (=> d!93907 (= lt!313311 e!388307)))

(declare-fun res!447709 () Bool)

(assert (=> d!93907 (=> (not res!447709) (not e!388307))))

(assert (=> d!93907 (= res!447709 (is-Cons!12982 acc!681))))

(assert (=> d!93907 (= (contains!3563 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313311)))

(declare-fun b!681581 () Bool)

(declare-fun e!388306 () Bool)

(assert (=> b!681581 (= e!388307 e!388306)))

(declare-fun res!447710 () Bool)

(assert (=> b!681581 (=> res!447710 e!388306)))

(assert (=> b!681581 (= res!447710 (= (h!14027 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681582 () Bool)

(assert (=> b!681582 (= e!388306 (contains!3563 (t!19220 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93907 res!447709) b!681581))

(assert (= (and b!681581 (not res!447710)) b!681582))

(assert (=> d!93907 m!646409))

(declare-fun m!646445 () Bool)

(assert (=> d!93907 m!646445))

(declare-fun m!646447 () Bool)

(assert (=> b!681582 m!646447))

(assert (=> b!681256 d!93907))

(assert (=> b!681258 d!93895))

(declare-fun d!93909 () Bool)

(declare-fun lt!313314 () Bool)

(assert (=> d!93909 (= lt!313314 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!275 lt!313251)))))

(declare-fun e!388309 () Bool)

(assert (=> d!93909 (= lt!313314 e!388309)))

(declare-fun res!447711 () Bool)

(assert (=> d!93909 (=> (not res!447711) (not e!388309))))

(assert (=> d!93909 (= res!447711 (is-Cons!12982 lt!313251))))

(assert (=> d!93909 (= (contains!3563 lt!313251 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313314)))

(declare-fun b!681583 () Bool)

(declare-fun e!388308 () Bool)

(assert (=> b!681583 (= e!388309 e!388308)))

(declare-fun res!447712 () Bool)

(assert (=> b!681583 (=> res!447712 e!388308)))

(assert (=> b!681583 (= res!447712 (= (h!14027 lt!313251) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681584 () Bool)

(assert (=> b!681584 (= e!388308 (contains!3563 (t!19220 lt!313251) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93909 res!447711) b!681583))

(assert (= (and b!681583 (not res!447712)) b!681584))

(assert (=> d!93909 m!646323))

(declare-fun m!646449 () Bool)

(assert (=> d!93909 m!646449))

(declare-fun m!646451 () Bool)

(assert (=> b!681584 m!646451))

(assert (=> b!681259 d!93909))

(push 1)

