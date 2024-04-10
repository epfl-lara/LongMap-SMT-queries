; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60890 () Bool)

(assert start!60890)

(declare-fun b!683219 () Bool)

(declare-fun res!449053 () Bool)

(declare-fun e!389173 () Bool)

(assert (=> b!683219 (=> (not res!449053) (not e!389173))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!683219 (= res!449053 (validKeyInArray!0 k!2843))))

(declare-fun b!683220 () Bool)

(declare-fun res!449049 () Bool)

(assert (=> b!683220 (=> (not res!449049) (not e!389173))))

(declare-datatypes ((List!13010 0))(
  ( (Nil!13007) (Cons!13006 (h!14051 (_ BitVec 64)) (t!19253 List!13010)) )
))
(declare-fun acc!681 () List!13010)

(declare-fun noDuplicate!834 (List!13010) Bool)

(assert (=> b!683220 (= res!449049 (noDuplicate!834 acc!681))))

(declare-fun b!683221 () Bool)

(declare-fun e!389174 () Bool)

(declare-fun contains!3587 (List!13010 (_ BitVec 64)) Bool)

(assert (=> b!683221 (= e!389174 (not (contains!3587 acc!681 k!2843)))))

(declare-fun b!683222 () Bool)

(declare-fun res!449048 () Bool)

(assert (=> b!683222 (=> (not res!449048) (not e!389173))))

(declare-datatypes ((array!39574 0))(
  ( (array!39575 (arr!18969 (Array (_ BitVec 32) (_ BitVec 64))) (size!19333 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39574)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39574 (_ BitVec 32) List!13010) Bool)

(assert (=> b!683222 (= res!449048 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!683224 () Bool)

(declare-fun res!449055 () Bool)

(assert (=> b!683224 (=> (not res!449055) (not e!389173))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!683224 (= res!449055 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19333 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!683225 () Bool)

(declare-fun res!449043 () Bool)

(assert (=> b!683225 (=> (not res!449043) (not e!389173))))

(declare-fun arrayContainsKey!0 (array!39574 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!683225 (= res!449043 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!683226 () Bool)

(declare-fun e!389176 () Bool)

(assert (=> b!683226 (= e!389173 (not e!389176))))

(declare-fun res!449052 () Bool)

(assert (=> b!683226 (=> res!449052 e!389176)))

(assert (=> b!683226 (= res!449052 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!313820 () List!13010)

(declare-fun -!138 (List!13010 (_ BitVec 64)) List!13010)

(assert (=> b!683226 (= (-!138 lt!313820 k!2843) acc!681)))

(declare-fun $colon$colon!338 (List!13010 (_ BitVec 64)) List!13010)

(assert (=> b!683226 (= lt!313820 ($colon$colon!338 acc!681 k!2843))))

(declare-datatypes ((Unit!24012 0))(
  ( (Unit!24013) )
))
(declare-fun lt!313823 () Unit!24012)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13010) Unit!24012)

(assert (=> b!683226 (= lt!313823 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!173 (List!13010 List!13010) Bool)

(assert (=> b!683226 (subseq!173 acc!681 acc!681)))

(declare-fun lt!313825 () Unit!24012)

(declare-fun lemmaListSubSeqRefl!0 (List!13010) Unit!24012)

(assert (=> b!683226 (= lt!313825 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683226 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313824 () Unit!24012)

(declare-fun e!389178 () Unit!24012)

(assert (=> b!683226 (= lt!313824 e!389178)))

(declare-fun c!77456 () Bool)

(assert (=> b!683226 (= c!77456 (validKeyInArray!0 (select (arr!18969 a!3626) from!3004)))))

(declare-fun lt!313821 () Unit!24012)

(declare-fun e!389177 () Unit!24012)

(assert (=> b!683226 (= lt!313821 e!389177)))

(declare-fun c!77455 () Bool)

(assert (=> b!683226 (= c!77455 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683226 (arrayContainsKey!0 (array!39575 (store (arr!18969 a!3626) i!1382 k!2843) (size!19333 a!3626)) k!2843 from!3004)))

(declare-fun b!683227 () Bool)

(declare-fun e!389175 () Bool)

(assert (=> b!683227 (= e!389175 e!389174)))

(declare-fun res!449044 () Bool)

(assert (=> b!683227 (=> (not res!449044) (not e!389174))))

(assert (=> b!683227 (= res!449044 (bvsle from!3004 i!1382))))

(declare-fun b!683228 () Bool)

(declare-fun Unit!24014 () Unit!24012)

(assert (=> b!683228 (= e!389177 Unit!24014)))

(declare-fun b!683229 () Bool)

(assert (=> b!683229 (= e!389176 (noDuplicate!834 lt!313820))))

(declare-fun b!683230 () Bool)

(declare-fun Unit!24015 () Unit!24012)

(assert (=> b!683230 (= e!389177 Unit!24015)))

(declare-fun lt!313818 () Unit!24012)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39574 (_ BitVec 64) (_ BitVec 32)) Unit!24012)

(assert (=> b!683230 (= lt!313818 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!683230 false))

(declare-fun b!683231 () Bool)

(declare-fun res!449050 () Bool)

(assert (=> b!683231 (=> (not res!449050) (not e!389173))))

(assert (=> b!683231 (= res!449050 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13007))))

(declare-fun b!683232 () Bool)

(declare-fun e!389172 () Bool)

(assert (=> b!683232 (= e!389172 (contains!3587 acc!681 k!2843))))

(declare-fun b!683233 () Bool)

(declare-fun Unit!24016 () Unit!24012)

(assert (=> b!683233 (= e!389178 Unit!24016)))

(declare-fun b!683234 () Bool)

(declare-fun res!449051 () Bool)

(assert (=> b!683234 (=> (not res!449051) (not e!389173))))

(assert (=> b!683234 (= res!449051 (not (contains!3587 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683235 () Bool)

(declare-fun res!449056 () Bool)

(assert (=> b!683235 (=> (not res!449056) (not e!389173))))

(assert (=> b!683235 (= res!449056 e!389175)))

(declare-fun res!449046 () Bool)

(assert (=> b!683235 (=> res!449046 e!389175)))

(assert (=> b!683235 (= res!449046 e!389172)))

(declare-fun res!449045 () Bool)

(assert (=> b!683235 (=> (not res!449045) (not e!389172))))

(assert (=> b!683235 (= res!449045 (bvsgt from!3004 i!1382))))

(declare-fun res!449057 () Bool)

(assert (=> start!60890 (=> (not res!449057) (not e!389173))))

(assert (=> start!60890 (= res!449057 (and (bvslt (size!19333 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19333 a!3626))))))

(assert (=> start!60890 e!389173))

(assert (=> start!60890 true))

(declare-fun array_inv!14765 (array!39574) Bool)

(assert (=> start!60890 (array_inv!14765 a!3626)))

(declare-fun b!683223 () Bool)

(declare-fun lt!313819 () Unit!24012)

(assert (=> b!683223 (= e!389178 lt!313819)))

(declare-fun lt!313822 () Unit!24012)

(assert (=> b!683223 (= lt!313822 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683223 (subseq!173 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39574 List!13010 List!13010 (_ BitVec 32)) Unit!24012)

(assert (=> b!683223 (= lt!313819 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!338 acc!681 (select (arr!18969 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683223 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!683236 () Bool)

(declare-fun res!449054 () Bool)

(assert (=> b!683236 (=> (not res!449054) (not e!389173))))

(assert (=> b!683236 (= res!449054 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19333 a!3626))))))

(declare-fun b!683237 () Bool)

(declare-fun res!449047 () Bool)

(assert (=> b!683237 (=> (not res!449047) (not e!389173))))

(assert (=> b!683237 (= res!449047 (not (contains!3587 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60890 res!449057) b!683220))

(assert (= (and b!683220 res!449049) b!683234))

(assert (= (and b!683234 res!449051) b!683237))

(assert (= (and b!683237 res!449047) b!683235))

(assert (= (and b!683235 res!449045) b!683232))

(assert (= (and b!683235 (not res!449046)) b!683227))

(assert (= (and b!683227 res!449044) b!683221))

(assert (= (and b!683235 res!449056) b!683231))

(assert (= (and b!683231 res!449050) b!683222))

(assert (= (and b!683222 res!449048) b!683236))

(assert (= (and b!683236 res!449054) b!683219))

(assert (= (and b!683219 res!449053) b!683225))

(assert (= (and b!683225 res!449043) b!683224))

(assert (= (and b!683224 res!449055) b!683226))

(assert (= (and b!683226 c!77455) b!683230))

(assert (= (and b!683226 (not c!77455)) b!683228))

(assert (= (and b!683226 c!77456) b!683223))

(assert (= (and b!683226 (not c!77456)) b!683233))

(assert (= (and b!683226 (not res!449052)) b!683229))

(declare-fun m!647789 () Bool)

(assert (=> b!683231 m!647789))

(declare-fun m!647791 () Bool)

(assert (=> b!683225 m!647791))

(declare-fun m!647793 () Bool)

(assert (=> b!683226 m!647793))

(declare-fun m!647795 () Bool)

(assert (=> b!683226 m!647795))

(declare-fun m!647797 () Bool)

(assert (=> b!683226 m!647797))

(declare-fun m!647799 () Bool)

(assert (=> b!683226 m!647799))

(declare-fun m!647801 () Bool)

(assert (=> b!683226 m!647801))

(declare-fun m!647803 () Bool)

(assert (=> b!683226 m!647803))

(declare-fun m!647805 () Bool)

(assert (=> b!683226 m!647805))

(declare-fun m!647807 () Bool)

(assert (=> b!683226 m!647807))

(assert (=> b!683226 m!647797))

(declare-fun m!647809 () Bool)

(assert (=> b!683226 m!647809))

(declare-fun m!647811 () Bool)

(assert (=> b!683226 m!647811))

(declare-fun m!647813 () Bool)

(assert (=> b!683226 m!647813))

(declare-fun m!647815 () Bool)

(assert (=> b!683232 m!647815))

(declare-fun m!647817 () Bool)

(assert (=> b!683222 m!647817))

(declare-fun m!647819 () Bool)

(assert (=> b!683229 m!647819))

(assert (=> b!683223 m!647795))

(assert (=> b!683223 m!647797))

(declare-fun m!647821 () Bool)

(assert (=> b!683223 m!647821))

(declare-fun m!647823 () Bool)

(assert (=> b!683223 m!647823))

(assert (=> b!683223 m!647797))

(assert (=> b!683223 m!647821))

(assert (=> b!683223 m!647803))

(assert (=> b!683223 m!647813))

(declare-fun m!647825 () Bool)

(assert (=> b!683234 m!647825))

(assert (=> b!683221 m!647815))

(declare-fun m!647827 () Bool)

(assert (=> b!683230 m!647827))

(declare-fun m!647829 () Bool)

(assert (=> b!683219 m!647829))

(declare-fun m!647831 () Bool)

(assert (=> b!683237 m!647831))

(declare-fun m!647833 () Bool)

(assert (=> start!60890 m!647833))

(declare-fun m!647835 () Bool)

(assert (=> b!683220 m!647835))

(push 1)

(assert (not b!683237))

(assert (not b!683230))

(assert (not b!683222))

(assert (not start!60890))

(assert (not b!683234))

(assert (not b!683221))

(assert (not b!683219))

(assert (not b!683231))

(assert (not b!683225))

(assert (not b!683226))

(assert (not b!683232))

(assert (not b!683220))

(assert (not b!683223))

(assert (not b!683229))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94183 () Bool)

(assert (=> d!94183 (= (array_inv!14765 a!3626) (bvsge (size!19333 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60890 d!94183))

(declare-fun d!94185 () Bool)

(assert (=> d!94185 (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))

(declare-fun lt!313876 () Unit!24012)

(declare-fun choose!13 (array!39574 (_ BitVec 64) (_ BitVec 32)) Unit!24012)

(assert (=> d!94185 (= lt!313876 (choose!13 a!3626 k!2843 from!3004))))

(assert (=> d!94185 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94185 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004) lt!313876)))

(declare-fun bs!20044 () Bool)

(assert (= bs!20044 d!94185))

(assert (=> bs!20044 m!647791))

(declare-fun m!647945 () Bool)

(assert (=> bs!20044 m!647945))

(assert (=> b!683230 d!94185))

(declare-fun bm!34012 () Bool)

(declare-fun call!34015 () Bool)

(declare-fun c!77482 () Bool)

(assert (=> bm!34012 (= call!34015 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77482 (Cons!13006 (select (arr!18969 a!3626) #b00000000000000000000000000000000) Nil!13007) Nil!13007)))))

(declare-fun b!683414 () Bool)

(declare-fun e!389279 () Bool)

(assert (=> b!683414 (= e!389279 (contains!3587 Nil!13007 (select (arr!18969 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!683415 () Bool)

(declare-fun e!389278 () Bool)

(declare-fun e!389280 () Bool)

(assert (=> b!683415 (= e!389278 e!389280)))

(declare-fun res!449185 () Bool)

(assert (=> b!683415 (=> (not res!449185) (not e!389280))))

(assert (=> b!683415 (= res!449185 (not e!389279))))

(declare-fun res!449184 () Bool)

(assert (=> b!683415 (=> (not res!449184) (not e!389279))))

(assert (=> b!683415 (= res!449184 (validKeyInArray!0 (select (arr!18969 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!94187 () Bool)

(declare-fun res!449186 () Bool)

(assert (=> d!94187 (=> res!449186 e!389278)))

(assert (=> d!94187 (= res!449186 (bvsge #b00000000000000000000000000000000 (size!19333 a!3626)))))

(assert (=> d!94187 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13007) e!389278)))

(declare-fun b!683416 () Bool)

(declare-fun e!389277 () Bool)

(assert (=> b!683416 (= e!389277 call!34015)))

(declare-fun b!683417 () Bool)

(assert (=> b!683417 (= e!389277 call!34015)))

(declare-fun b!683418 () Bool)

(assert (=> b!683418 (= e!389280 e!389277)))

(assert (=> b!683418 (= c!77482 (validKeyInArray!0 (select (arr!18969 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!94187 (not res!449186)) b!683415))

(assert (= (and b!683415 res!449184) b!683414))

(assert (= (and b!683415 res!449185) b!683418))

(assert (= (and b!683418 c!77482) b!683416))

(assert (= (and b!683418 (not c!77482)) b!683417))

(assert (= (or b!683416 b!683417) bm!34012))

(declare-fun m!647975 () Bool)

(assert (=> bm!34012 m!647975))

(declare-fun m!647977 () Bool)

(assert (=> bm!34012 m!647977))

(assert (=> b!683414 m!647975))

(assert (=> b!683414 m!647975))

(declare-fun m!647979 () Bool)

(assert (=> b!683414 m!647979))

(assert (=> b!683415 m!647975))

(assert (=> b!683415 m!647975))

(declare-fun m!647981 () Bool)

(assert (=> b!683415 m!647981))

(assert (=> b!683418 m!647975))

(assert (=> b!683418 m!647975))

(assert (=> b!683418 m!647981))

(assert (=> b!683231 d!94187))

(declare-fun d!94199 () Bool)

(declare-fun res!449205 () Bool)

(declare-fun e!389299 () Bool)

(assert (=> d!94199 (=> res!449205 e!389299)))

(assert (=> d!94199 (= res!449205 (is-Nil!13007 acc!681))))

(assert (=> d!94199 (= (noDuplicate!834 acc!681) e!389299)))

(declare-fun b!683437 () Bool)

(declare-fun e!389300 () Bool)

(assert (=> b!683437 (= e!389299 e!389300)))

(declare-fun res!449206 () Bool)

(assert (=> b!683437 (=> (not res!449206) (not e!389300))))

(assert (=> b!683437 (= res!449206 (not (contains!3587 (t!19253 acc!681) (h!14051 acc!681))))))

(declare-fun b!683438 () Bool)

(assert (=> b!683438 (= e!389300 (noDuplicate!834 (t!19253 acc!681)))))

(assert (= (and d!94199 (not res!449205)) b!683437))

(assert (= (and b!683437 res!449206) b!683438))

(declare-fun m!647987 () Bool)

(assert (=> b!683437 m!647987))

(declare-fun m!647989 () Bool)

(assert (=> b!683438 m!647989))

(assert (=> b!683220 d!94199))

(declare-fun d!94203 () Bool)

(declare-fun lt!313891 () Bool)

(declare-fun content!283 (List!13010) (Set (_ BitVec 64)))

(assert (=> d!94203 (= lt!313891 (set.member k!2843 (content!283 acc!681)))))

(declare-fun e!389319 () Bool)

(assert (=> d!94203 (= lt!313891 e!389319)))

(declare-fun res!449226 () Bool)

(assert (=> d!94203 (=> (not res!449226) (not e!389319))))

(assert (=> d!94203 (= res!449226 (is-Cons!13006 acc!681))))

(assert (=> d!94203 (= (contains!3587 acc!681 k!2843) lt!313891)))

(declare-fun b!683457 () Bool)

(declare-fun e!389320 () Bool)

(assert (=> b!683457 (= e!389319 e!389320)))

(declare-fun res!449225 () Bool)

(assert (=> b!683457 (=> res!449225 e!389320)))

(assert (=> b!683457 (= res!449225 (= (h!14051 acc!681) k!2843))))

(declare-fun b!683458 () Bool)

(assert (=> b!683458 (= e!389320 (contains!3587 (t!19253 acc!681) k!2843))))

(assert (= (and d!94203 res!449226) b!683457))

(assert (= (and b!683457 (not res!449225)) b!683458))

(declare-fun m!648001 () Bool)

(assert (=> d!94203 m!648001))

(declare-fun m!648003 () Bool)

(assert (=> d!94203 m!648003))

(declare-fun m!648005 () Bool)

(assert (=> b!683458 m!648005))

(assert (=> b!683221 d!94203))

(assert (=> b!683232 d!94203))

(declare-fun d!94209 () Bool)

(declare-fun res!449228 () Bool)

(declare-fun e!389322 () Bool)

(assert (=> d!94209 (=> res!449228 e!389322)))

(assert (=> d!94209 (= res!449228 (is-Nil!13007 lt!313820))))

(assert (=> d!94209 (= (noDuplicate!834 lt!313820) e!389322)))

(declare-fun b!683461 () Bool)

(declare-fun e!389324 () Bool)

(assert (=> b!683461 (= e!389322 e!389324)))

(declare-fun res!449230 () Bool)

(assert (=> b!683461 (=> (not res!449230) (not e!389324))))

(assert (=> b!683461 (= res!449230 (not (contains!3587 (t!19253 lt!313820) (h!14051 lt!313820))))))

(declare-fun b!683462 () Bool)

(assert (=> b!683462 (= e!389324 (noDuplicate!834 (t!19253 lt!313820)))))

(assert (= (and d!94209 (not res!449228)) b!683461))

(assert (= (and b!683461 res!449230) b!683462))

(declare-fun m!648007 () Bool)

(assert (=> b!683461 m!648007))

(declare-fun m!648011 () Bool)

(assert (=> b!683462 m!648011))

(assert (=> b!683229 d!94209))

(declare-fun d!94211 () Bool)

(assert (=> d!94211 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!683219 d!94211))

(declare-fun d!94215 () Bool)

(declare-fun res!449249 () Bool)

(declare-fun e!389343 () Bool)

(assert (=> d!94215 (=> res!449249 e!389343)))

(assert (=> d!94215 (= res!449249 (= (select (arr!18969 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!94215 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!389343)))

(declare-fun b!683481 () Bool)

(declare-fun e!389344 () Bool)

(assert (=> b!683481 (= e!389343 e!389344)))

(declare-fun res!449250 () Bool)

(assert (=> b!683481 (=> (not res!449250) (not e!389344))))

(assert (=> b!683481 (= res!449250 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19333 a!3626)))))

(declare-fun b!683482 () Bool)

(assert (=> b!683482 (= e!389344 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94215 (not res!449249)) b!683481))

(assert (= (and b!683481 res!449250) b!683482))

(assert (=> d!94215 m!647975))

(declare-fun m!648037 () Bool)

(assert (=> b!683482 m!648037))

(assert (=> b!683225 d!94215))

(declare-fun d!94231 () Bool)

(declare-fun lt!313897 () Bool)

(assert (=> d!94231 (= lt!313897 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!283 acc!681)))))

(declare-fun e!389345 () Bool)

(assert (=> d!94231 (= lt!313897 e!389345)))

(declare-fun res!449254 () Bool)

(assert (=> d!94231 (=> (not res!449254) (not e!389345))))

(assert (=> d!94231 (= res!449254 (is-Cons!13006 acc!681))))

(assert (=> d!94231 (= (contains!3587 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313897)))

(declare-fun b!683485 () Bool)

(declare-fun e!389348 () Bool)

(assert (=> b!683485 (= e!389345 e!389348)))

(declare-fun res!449251 () Bool)

(assert (=> b!683485 (=> res!449251 e!389348)))

(assert (=> b!683485 (= res!449251 (= (h!14051 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!683486 () Bool)

(assert (=> b!683486 (= e!389348 (contains!3587 (t!19253 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94231 res!449254) b!683485))

(assert (= (and b!683485 (not res!449251)) b!683486))

(assert (=> d!94231 m!648001))

(declare-fun m!648039 () Bool)

(assert (=> d!94231 m!648039))

(declare-fun m!648041 () Bool)

(assert (=> b!683486 m!648041))

(assert (=> b!683237 d!94231))

(declare-fun b!683515 () Bool)

(declare-fun e!389370 () List!13010)

(assert (=> b!683515 (= e!389370 Nil!13007)))

(declare-fun b!683516 () Bool)

(declare-fun e!389369 () List!13010)

(declare-fun call!34022 () List!13010)

(assert (=> b!683516 (= e!389369 call!34022)))

(declare-fun b!683517 () Bool)

(assert (=> b!683517 (= e!389369 (Cons!13006 (h!14051 lt!313820) call!34022))))

(declare-fun b!683518 () Bool)

(assert (=> b!683518 (= e!389370 e!389369)))

(declare-fun c!77494 () Bool)

(assert (=> b!683518 (= c!77494 (= k!2843 (h!14051 lt!313820)))))

(declare-fun bm!34019 () Bool)

(assert (=> bm!34019 (= call!34022 (-!138 (t!19253 lt!313820) k!2843))))

(declare-fun e!389371 () Bool)

(declare-fun b!683519 () Bool)

(declare-fun lt!313908 () List!13010)

(assert (=> b!683519 (= e!389371 (= (content!283 lt!313908) (set.minus (content!283 lt!313820) (set.insert k!2843 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun d!94233 () Bool)

(assert (=> d!94233 e!389371))

(declare-fun res!449263 () Bool)

(assert (=> d!94233 (=> (not res!449263) (not e!389371))))

(declare-fun size!19337 (List!13010) Int)

(assert (=> d!94233 (= res!449263 (<= (size!19337 lt!313908) (size!19337 lt!313820)))))

(assert (=> d!94233 (= lt!313908 e!389370)))

(declare-fun c!77493 () Bool)

(assert (=> d!94233 (= c!77493 (is-Cons!13006 lt!313820))))

(assert (=> d!94233 (= (-!138 lt!313820 k!2843) lt!313908)))

(assert (= (and d!94233 c!77493) b!683518))

(assert (= (and d!94233 (not c!77493)) b!683515))

(assert (= (and b!683518 c!77494) b!683516))

(assert (= (and b!683518 (not c!77494)) b!683517))

(assert (= (or b!683516 b!683517) bm!34019))

(assert (= (and d!94233 res!449263) b!683519))

(declare-fun m!648051 () Bool)

(assert (=> bm!34019 m!648051))

(declare-fun m!648053 () Bool)

(assert (=> b!683519 m!648053))

(declare-fun m!648055 () Bool)

(assert (=> b!683519 m!648055))

(declare-fun m!648057 () Bool)

(assert (=> b!683519 m!648057))

(declare-fun m!648059 () Bool)

(assert (=> d!94233 m!648059))

(declare-fun m!648061 () Bool)

(assert (=> d!94233 m!648061))

(assert (=> b!683226 d!94233))

(declare-fun b!683542 () Bool)

(declare-fun e!389391 () Bool)

(declare-fun e!389394 () Bool)

(assert (=> b!683542 (= e!389391 e!389394)))

(declare-fun res!449281 () Bool)

(assert (=> b!683542 (=> (not res!449281) (not e!389394))))

(assert (=> b!683542 (= res!449281 (is-Cons!13006 acc!681))))

(declare-fun d!94245 () Bool)

(declare-fun res!449280 () Bool)

(assert (=> d!94245 (=> res!449280 e!389391)))

(assert (=> d!94245 (= res!449280 (is-Nil!13007 acc!681))))

(assert (=> d!94245 (= (subseq!173 acc!681 acc!681) e!389391)))

(declare-fun b!683545 () Bool)

(declare-fun e!389392 () Bool)

(assert (=> b!683545 (= e!389392 (subseq!173 acc!681 (t!19253 acc!681)))))

(declare-fun b!683544 () Bool)

(declare-fun e!389393 () Bool)

(assert (=> b!683544 (= e!389393 (subseq!173 (t!19253 acc!681) (t!19253 acc!681)))))

(declare-fun b!683543 () Bool)

(assert (=> b!683543 (= e!389394 e!389392)))

(declare-fun res!449283 () Bool)

(assert (=> b!683543 (=> res!449283 e!389392)))

(assert (=> b!683543 (= res!449283 e!389393)))

(declare-fun res!449282 () Bool)

(assert (=> b!683543 (=> (not res!449282) (not e!389393))))

(assert (=> b!683543 (= res!449282 (= (h!14051 acc!681) (h!14051 acc!681)))))

(assert (= (and d!94245 (not res!449280)) b!683542))

(assert (= (and b!683542 res!449281) b!683543))

(assert (= (and b!683543 res!449282) b!683544))

(assert (= (and b!683543 (not res!449283)) b!683545))

(declare-fun m!648085 () Bool)

(assert (=> b!683545 m!648085))

(declare-fun m!648087 () Bool)

(assert (=> b!683544 m!648087))

(assert (=> b!683226 d!94245))

(declare-fun d!94259 () Bool)

(declare-fun res!449284 () Bool)

(declare-fun e!389395 () Bool)

(assert (=> d!94259 (=> res!449284 e!389395)))

(assert (=> d!94259 (= res!449284 (= (select (arr!18969 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k!2843))))

(assert (=> d!94259 (= (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!389395)))

(declare-fun b!683546 () Bool)

(declare-fun e!389396 () Bool)

(assert (=> b!683546 (= e!389395 e!389396)))

(declare-fun res!449285 () Bool)

(assert (=> b!683546 (=> (not res!449285) (not e!389396))))

(assert (=> b!683546 (= res!449285 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19333 a!3626)))))

(declare-fun b!683547 () Bool)

(assert (=> b!683547 (= e!389396 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94259 (not res!449284)) b!683546))

(assert (= (and b!683546 res!449285) b!683547))

(declare-fun m!648089 () Bool)

(assert (=> d!94259 m!648089))

(declare-fun m!648091 () Bool)

(assert (=> b!683547 m!648091))

(assert (=> b!683226 d!94259))

(declare-fun d!94261 () Bool)

(assert (=> d!94261 (= (-!138 ($colon$colon!338 acc!681 k!2843) k!2843) acc!681)))

(declare-fun lt!313918 () Unit!24012)

(declare-fun choose!16 ((_ BitVec 64) List!13010) Unit!24012)

(assert (=> d!94261 (= lt!313918 (choose!16 k!2843 acc!681))))

(assert (=> d!94261 (not (contains!3587 acc!681 k!2843))))

(assert (=> d!94261 (= (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681) lt!313918)))

(declare-fun bs!20052 () Bool)

(assert (= bs!20052 d!94261))

(assert (=> bs!20052 m!647807))

(assert (=> bs!20052 m!647807))

(declare-fun m!648105 () Bool)

(assert (=> bs!20052 m!648105))

(declare-fun m!648107 () Bool)

(assert (=> bs!20052 m!648107))

(assert (=> bs!20052 m!647815))

(assert (=> b!683226 d!94261))

(declare-fun d!94267 () Bool)

(declare-fun res!449293 () Bool)

(declare-fun e!389405 () Bool)

(assert (=> d!94267 (=> res!449293 e!389405)))

(assert (=> d!94267 (= res!449293 (= (select (arr!18969 (array!39575 (store (arr!18969 a!3626) i!1382 k!2843) (size!19333 a!3626))) from!3004) k!2843))))

(assert (=> d!94267 (= (arrayContainsKey!0 (array!39575 (store (arr!18969 a!3626) i!1382 k!2843) (size!19333 a!3626)) k!2843 from!3004) e!389405)))

(declare-fun b!683557 () Bool)

(declare-fun e!389406 () Bool)

(assert (=> b!683557 (= e!389405 e!389406)))

(declare-fun res!449294 () Bool)

(assert (=> b!683557 (=> (not res!449294) (not e!389406))))

(assert (=> b!683557 (= res!449294 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19333 (array!39575 (store (arr!18969 a!3626) i!1382 k!2843) (size!19333 a!3626)))))))

(declare-fun b!683558 () Bool)

(assert (=> b!683558 (= e!389406 (arrayContainsKey!0 (array!39575 (store (arr!18969 a!3626) i!1382 k!2843) (size!19333 a!3626)) k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94267 (not res!449293)) b!683557))

(assert (= (and b!683557 res!449294) b!683558))

(declare-fun m!648109 () Bool)

(assert (=> d!94267 m!648109))

(declare-fun m!648111 () Bool)

(assert (=> b!683558 m!648111))

(assert (=> b!683226 d!94267))

(declare-fun d!94269 () Bool)

(assert (=> d!94269 (subseq!173 acc!681 acc!681)))

(declare-fun lt!313921 () Unit!24012)

(declare-fun choose!36 (List!13010) Unit!24012)

(assert (=> d!94269 (= lt!313921 (choose!36 acc!681))))

(assert (=> d!94269 (= (lemmaListSubSeqRefl!0 acc!681) lt!313921)))

(declare-fun bs!20053 () Bool)

(assert (= bs!20053 d!94269))

(assert (=> bs!20053 m!647813))

(declare-fun m!648117 () Bool)

(assert (=> bs!20053 m!648117))

(assert (=> b!683226 d!94269))

(declare-fun d!94273 () Bool)

(assert (=> d!94273 (= (validKeyInArray!0 (select (arr!18969 a!3626) from!3004)) (and (not (= (select (arr!18969 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18969 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!683226 d!94273))

(declare-fun d!94275 () Bool)

(assert (=> d!94275 (= ($colon$colon!338 acc!681 k!2843) (Cons!13006 k!2843 acc!681))))

(assert (=> b!683226 d!94275))

(declare-fun c!77499 () Bool)

(declare-fun call!34026 () Bool)

(declare-fun bm!34023 () Bool)

(assert (=> bm!34023 (= call!34026 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77499 (Cons!13006 (select (arr!18969 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!683565 () Bool)

(declare-fun e!389415 () Bool)

(assert (=> b!683565 (= e!389415 (contains!3587 acc!681 (select (arr!18969 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!683566 () Bool)

(declare-fun e!389414 () Bool)

(declare-fun e!389416 () Bool)

(assert (=> b!683566 (= e!389414 e!389416)))

(declare-fun res!449302 () Bool)

(assert (=> b!683566 (=> (not res!449302) (not e!389416))))

(assert (=> b!683566 (= res!449302 (not e!389415))))

(declare-fun res!449301 () Bool)

(assert (=> b!683566 (=> (not res!449301) (not e!389415))))

(assert (=> b!683566 (= res!449301 (validKeyInArray!0 (select (arr!18969 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!94277 () Bool)

(declare-fun res!449303 () Bool)

(assert (=> d!94277 (=> res!449303 e!389414)))

(assert (=> d!94277 (= res!449303 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19333 a!3626)))))

