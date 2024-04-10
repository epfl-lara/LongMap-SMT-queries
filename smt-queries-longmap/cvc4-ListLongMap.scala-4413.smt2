; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60894 () Bool)

(assert start!60894)

(declare-fun b!683333 () Bool)

(declare-fun res!449136 () Bool)

(declare-fun e!389223 () Bool)

(assert (=> b!683333 (=> (not res!449136) (not e!389223))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39578 0))(
  ( (array!39579 (arr!18971 (Array (_ BitVec 32) (_ BitVec 64))) (size!19335 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39578)

(assert (=> b!683333 (= res!449136 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19335 a!3626))))))

(declare-fun b!683334 () Bool)

(declare-datatypes ((Unit!24022 0))(
  ( (Unit!24023) )
))
(declare-fun e!389219 () Unit!24022)

(declare-fun Unit!24024 () Unit!24022)

(assert (=> b!683334 (= e!389219 Unit!24024)))

(declare-fun lt!313866 () Unit!24022)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39578 (_ BitVec 64) (_ BitVec 32)) Unit!24022)

(assert (=> b!683334 (= lt!313866 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!683334 false))

(declare-fun b!683335 () Bool)

(declare-fun Unit!24025 () Unit!24022)

(assert (=> b!683335 (= e!389219 Unit!24025)))

(declare-fun b!683336 () Bool)

(declare-fun res!449134 () Bool)

(assert (=> b!683336 (=> (not res!449134) (not e!389223))))

(assert (=> b!683336 (= res!449134 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19335 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!683337 () Bool)

(declare-fun e!389221 () Unit!24022)

(declare-fun Unit!24026 () Unit!24022)

(assert (=> b!683337 (= e!389221 Unit!24026)))

(declare-fun b!683338 () Bool)

(declare-fun e!389220 () Bool)

(declare-datatypes ((List!13012 0))(
  ( (Nil!13009) (Cons!13008 (h!14053 (_ BitVec 64)) (t!19255 List!13012)) )
))
(declare-fun lt!313872 () List!13012)

(declare-fun noDuplicate!836 (List!13012) Bool)

(assert (=> b!683338 (= e!389220 (noDuplicate!836 lt!313872))))

(declare-fun b!683339 () Bool)

(declare-fun e!389225 () Bool)

(declare-fun acc!681 () List!13012)

(declare-fun contains!3589 (List!13012 (_ BitVec 64)) Bool)

(assert (=> b!683339 (= e!389225 (contains!3589 acc!681 k!2843))))

(declare-fun b!683340 () Bool)

(declare-fun lt!313869 () Unit!24022)

(assert (=> b!683340 (= e!389221 lt!313869)))

(declare-fun lt!313871 () Unit!24022)

(declare-fun lemmaListSubSeqRefl!0 (List!13012) Unit!24022)

(assert (=> b!683340 (= lt!313871 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!175 (List!13012 List!13012) Bool)

(assert (=> b!683340 (subseq!175 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39578 List!13012 List!13012 (_ BitVec 32)) Unit!24022)

(declare-fun $colon$colon!340 (List!13012 (_ BitVec 64)) List!13012)

(assert (=> b!683340 (= lt!313869 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!340 acc!681 (select (arr!18971 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39578 (_ BitVec 32) List!13012) Bool)

(assert (=> b!683340 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!683341 () Bool)

(declare-fun res!449138 () Bool)

(assert (=> b!683341 (=> (not res!449138) (not e!389223))))

(assert (=> b!683341 (= res!449138 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13009))))

(declare-fun b!683342 () Bool)

(declare-fun res!449140 () Bool)

(assert (=> b!683342 (=> (not res!449140) (not e!389223))))

(assert (=> b!683342 (= res!449140 (noDuplicate!836 acc!681))))

(declare-fun b!683343 () Bool)

(declare-fun res!449135 () Bool)

(assert (=> b!683343 (=> (not res!449135) (not e!389223))))

(declare-fun arrayContainsKey!0 (array!39578 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!683343 (= res!449135 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!449145 () Bool)

(assert (=> start!60894 (=> (not res!449145) (not e!389223))))

(assert (=> start!60894 (= res!449145 (and (bvslt (size!19335 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19335 a!3626))))))

(assert (=> start!60894 e!389223))

(assert (=> start!60894 true))

(declare-fun array_inv!14767 (array!39578) Bool)

(assert (=> start!60894 (array_inv!14767 a!3626)))

(declare-fun b!683344 () Bool)

(declare-fun e!389224 () Bool)

(assert (=> b!683344 (= e!389224 (not (contains!3589 acc!681 k!2843)))))

(declare-fun b!683345 () Bool)

(declare-fun res!449139 () Bool)

(assert (=> b!683345 (=> (not res!449139) (not e!389223))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!683345 (= res!449139 (validKeyInArray!0 k!2843))))

(declare-fun b!683346 () Bool)

(declare-fun res!449142 () Bool)

(assert (=> b!683346 (=> (not res!449142) (not e!389223))))

(assert (=> b!683346 (= res!449142 (not (contains!3589 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683347 () Bool)

(declare-fun res!449146 () Bool)

(assert (=> b!683347 (=> (not res!449146) (not e!389223))))

(assert (=> b!683347 (= res!449146 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!683348 () Bool)

(declare-fun res!449137 () Bool)

(assert (=> b!683348 (=> (not res!449137) (not e!389223))))

(assert (=> b!683348 (= res!449137 (not (contains!3589 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683349 () Bool)

(declare-fun res!449147 () Bool)

(assert (=> b!683349 (=> (not res!449147) (not e!389223))))

(declare-fun e!389222 () Bool)

(assert (=> b!683349 (= res!449147 e!389222)))

(declare-fun res!449133 () Bool)

(assert (=> b!683349 (=> res!449133 e!389222)))

(assert (=> b!683349 (= res!449133 e!389225)))

(declare-fun res!449143 () Bool)

(assert (=> b!683349 (=> (not res!449143) (not e!389225))))

(assert (=> b!683349 (= res!449143 (bvsgt from!3004 i!1382))))

(declare-fun b!683350 () Bool)

(assert (=> b!683350 (= e!389222 e!389224)))

(declare-fun res!449141 () Bool)

(assert (=> b!683350 (=> (not res!449141) (not e!389224))))

(assert (=> b!683350 (= res!449141 (bvsle from!3004 i!1382))))

(declare-fun b!683351 () Bool)

(assert (=> b!683351 (= e!389223 (not e!389220))))

(declare-fun res!449144 () Bool)

(assert (=> b!683351 (=> res!449144 e!389220)))

(assert (=> b!683351 (= res!449144 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!140 (List!13012 (_ BitVec 64)) List!13012)

(assert (=> b!683351 (= (-!140 lt!313872 k!2843) acc!681)))

(assert (=> b!683351 (= lt!313872 ($colon$colon!340 acc!681 k!2843))))

(declare-fun lt!313868 () Unit!24022)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13012) Unit!24022)

(assert (=> b!683351 (= lt!313868 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!683351 (subseq!175 acc!681 acc!681)))

(declare-fun lt!313870 () Unit!24022)

(assert (=> b!683351 (= lt!313870 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683351 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313867 () Unit!24022)

(assert (=> b!683351 (= lt!313867 e!389221)))

(declare-fun c!77468 () Bool)

(assert (=> b!683351 (= c!77468 (validKeyInArray!0 (select (arr!18971 a!3626) from!3004)))))

(declare-fun lt!313873 () Unit!24022)

(assert (=> b!683351 (= lt!313873 e!389219)))

(declare-fun c!77467 () Bool)

(assert (=> b!683351 (= c!77467 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683351 (arrayContainsKey!0 (array!39579 (store (arr!18971 a!3626) i!1382 k!2843) (size!19335 a!3626)) k!2843 from!3004)))

(assert (= (and start!60894 res!449145) b!683342))

(assert (= (and b!683342 res!449140) b!683346))

(assert (= (and b!683346 res!449142) b!683348))

(assert (= (and b!683348 res!449137) b!683349))

(assert (= (and b!683349 res!449143) b!683339))

(assert (= (and b!683349 (not res!449133)) b!683350))

(assert (= (and b!683350 res!449141) b!683344))

(assert (= (and b!683349 res!449147) b!683341))

(assert (= (and b!683341 res!449138) b!683347))

(assert (= (and b!683347 res!449146) b!683333))

(assert (= (and b!683333 res!449136) b!683345))

(assert (= (and b!683345 res!449139) b!683343))

(assert (= (and b!683343 res!449135) b!683336))

(assert (= (and b!683336 res!449134) b!683351))

(assert (= (and b!683351 c!77467) b!683334))

(assert (= (and b!683351 (not c!77467)) b!683335))

(assert (= (and b!683351 c!77468) b!683340))

(assert (= (and b!683351 (not c!77468)) b!683337))

(assert (= (and b!683351 (not res!449144)) b!683338))

(declare-fun m!647885 () Bool)

(assert (=> b!683341 m!647885))

(declare-fun m!647887 () Bool)

(assert (=> b!683346 m!647887))

(declare-fun m!647889 () Bool)

(assert (=> b!683345 m!647889))

(declare-fun m!647891 () Bool)

(assert (=> b!683339 m!647891))

(declare-fun m!647893 () Bool)

(assert (=> b!683340 m!647893))

(declare-fun m!647895 () Bool)

(assert (=> b!683340 m!647895))

(declare-fun m!647897 () Bool)

(assert (=> b!683340 m!647897))

(declare-fun m!647899 () Bool)

(assert (=> b!683340 m!647899))

(assert (=> b!683340 m!647895))

(assert (=> b!683340 m!647897))

(declare-fun m!647901 () Bool)

(assert (=> b!683340 m!647901))

(declare-fun m!647903 () Bool)

(assert (=> b!683340 m!647903))

(declare-fun m!647905 () Bool)

(assert (=> b!683351 m!647905))

(assert (=> b!683351 m!647893))

(assert (=> b!683351 m!647895))

(declare-fun m!647907 () Bool)

(assert (=> b!683351 m!647907))

(declare-fun m!647909 () Bool)

(assert (=> b!683351 m!647909))

(assert (=> b!683351 m!647901))

(declare-fun m!647911 () Bool)

(assert (=> b!683351 m!647911))

(declare-fun m!647913 () Bool)

(assert (=> b!683351 m!647913))

(assert (=> b!683351 m!647895))

(declare-fun m!647915 () Bool)

(assert (=> b!683351 m!647915))

(declare-fun m!647917 () Bool)

(assert (=> b!683351 m!647917))

(assert (=> b!683351 m!647903))

(assert (=> b!683344 m!647891))

(declare-fun m!647919 () Bool)

(assert (=> b!683347 m!647919))

(declare-fun m!647921 () Bool)

(assert (=> b!683334 m!647921))

(declare-fun m!647923 () Bool)

(assert (=> start!60894 m!647923))

(declare-fun m!647925 () Bool)

(assert (=> b!683342 m!647925))

(declare-fun m!647927 () Bool)

(assert (=> b!683343 m!647927))

(declare-fun m!647929 () Bool)

(assert (=> b!683338 m!647929))

(declare-fun m!647931 () Bool)

(assert (=> b!683348 m!647931))

(push 1)

(assert (not b!683341))

(assert (not b!683351))

(assert (not b!683344))

(assert (not b!683343))

(assert (not b!683345))

(assert (not b!683340))

(assert (not b!683347))

(assert (not b!683346))

(assert (not b!683339))

(assert (not b!683338))

(assert (not start!60894))

(assert (not b!683348))

(assert (not b!683334))

(assert (not b!683342))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!683409 () Bool)

(declare-fun e!389275 () List!13012)

(assert (=> b!683409 (= e!389275 Nil!13009)))

(declare-fun b!683410 () Bool)

(declare-fun e!389274 () List!13012)

(declare-fun call!34014 () List!13012)

(assert (=> b!683410 (= e!389274 call!34014)))

(declare-fun bm!34011 () Bool)

(assert (=> bm!34011 (= call!34014 (-!140 (t!19255 lt!313872) k!2843))))

(declare-fun e!389276 () Bool)

(declare-fun b!683412 () Bool)

(declare-fun lt!313885 () List!13012)

(declare-fun content!282 (List!13012) (Set (_ BitVec 64)))

(assert (=> b!683412 (= e!389276 (= (content!282 lt!313885) (setminus (content!282 lt!313872) (insert k!2843 (as emptyset (Set (_ BitVec 64)))))))))

(declare-fun b!683413 () Bool)

(assert (=> b!683413 (= e!389274 (Cons!13008 (h!14053 lt!313872) call!34014))))

(declare-fun b!683411 () Bool)

(assert (=> b!683411 (= e!389275 e!389274)))

(declare-fun c!77481 () Bool)

(assert (=> b!683411 (= c!77481 (= k!2843 (h!14053 lt!313872)))))

(declare-fun d!94181 () Bool)

(assert (=> d!94181 e!389276))

(declare-fun res!449183 () Bool)

(assert (=> d!94181 (=> (not res!449183) (not e!389276))))

(declare-fun size!19336 (List!13012) Int)

(assert (=> d!94181 (= res!449183 (<= (size!19336 lt!313885) (size!19336 lt!313872)))))

(assert (=> d!94181 (= lt!313885 e!389275)))

(declare-fun c!77480 () Bool)

(assert (=> d!94181 (= c!77480 (is-Cons!13008 lt!313872))))

(assert (=> d!94181 (= (-!140 lt!313872 k!2843) lt!313885)))

(assert (= (and d!94181 c!77480) b!683411))

(assert (= (and d!94181 (not c!77480)) b!683409))

(assert (= (and b!683411 c!77481) b!683410))

(assert (= (and b!683411 (not c!77481)) b!683413))

(assert (= (or b!683410 b!683413) bm!34011))

(assert (= (and d!94181 res!449183) b!683412))

(declare-fun m!647961 () Bool)

(assert (=> bm!34011 m!647961))

(declare-fun m!647963 () Bool)

(assert (=> b!683412 m!647963))

(declare-fun m!647967 () Bool)

(assert (=> b!683412 m!647967))

(declare-fun m!647969 () Bool)

(assert (=> b!683412 m!647969))

(declare-fun m!647971 () Bool)

(assert (=> d!94181 m!647971))

(declare-fun m!647973 () Bool)

(assert (=> d!94181 m!647973))

(assert (=> b!683351 d!94181))

(declare-fun b!683439 () Bool)

(declare-fun e!389301 () Bool)

(declare-fun e!389303 () Bool)

(assert (=> b!683439 (= e!389301 e!389303)))

(declare-fun res!449210 () Bool)

(assert (=> b!683439 (=> (not res!449210) (not e!389303))))

(assert (=> b!683439 (= res!449210 (is-Cons!13008 acc!681))))

(declare-fun d!94197 () Bool)

(declare-fun res!449209 () Bool)

(assert (=> d!94197 (=> res!449209 e!389301)))

(assert (=> d!94197 (= res!449209 (is-Nil!13009 acc!681))))

(assert (=> d!94197 (= (subseq!175 acc!681 acc!681) e!389301)))

(declare-fun b!683441 () Bool)

(declare-fun e!389304 () Bool)

(assert (=> b!683441 (= e!389304 (subseq!175 (t!19255 acc!681) (t!19255 acc!681)))))

(declare-fun b!683442 () Bool)

(declare-fun e!389302 () Bool)

(assert (=> b!683442 (= e!389302 (subseq!175 acc!681 (t!19255 acc!681)))))

(declare-fun b!683440 () Bool)

(assert (=> b!683440 (= e!389303 e!389302)))

(declare-fun res!449207 () Bool)

(assert (=> b!683440 (=> res!449207 e!389302)))

(assert (=> b!683440 (= res!449207 e!389304)))

(declare-fun res!449208 () Bool)

(assert (=> b!683440 (=> (not res!449208) (not e!389304))))

(assert (=> b!683440 (= res!449208 (= (h!14053 acc!681) (h!14053 acc!681)))))

(assert (= (and d!94197 (not res!449209)) b!683439))

(assert (= (and b!683439 res!449210) b!683440))

(assert (= (and b!683440 res!449208) b!683441))

(assert (= (and b!683440 (not res!449207)) b!683442))

(declare-fun m!647991 () Bool)

(assert (=> b!683441 m!647991))

(declare-fun m!647993 () Bool)

(assert (=> b!683442 m!647993))

(assert (=> b!683351 d!94197))

(declare-fun d!94205 () Bool)

(declare-fun res!449227 () Bool)

(declare-fun e!389321 () Bool)

(assert (=> d!94205 (=> res!449227 e!389321)))

(assert (=> d!94205 (= res!449227 (= (select (arr!18971 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k!2843))))

(assert (=> d!94205 (= (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!389321)))

(declare-fun b!683459 () Bool)

(declare-fun e!389323 () Bool)

(assert (=> b!683459 (= e!389321 e!389323)))

(declare-fun res!449229 () Bool)

(assert (=> b!683459 (=> (not res!449229) (not e!389323))))

(assert (=> b!683459 (= res!449229 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19335 a!3626)))))

(declare-fun b!683460 () Bool)

(assert (=> b!683460 (= e!389323 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94205 (not res!449227)) b!683459))

(assert (= (and b!683459 res!449229) b!683460))

(declare-fun m!648009 () Bool)

(assert (=> d!94205 m!648009))

(declare-fun m!648013 () Bool)

(assert (=> b!683460 m!648013))

(assert (=> b!683351 d!94205))

(declare-fun d!94213 () Bool)

(assert (=> d!94213 (= (-!140 ($colon$colon!340 acc!681 k!2843) k!2843) acc!681)))

(declare-fun lt!313895 () Unit!24022)

(declare-fun choose!16 ((_ BitVec 64) List!13012) Unit!24022)

(assert (=> d!94213 (= lt!313895 (choose!16 k!2843 acc!681))))

(assert (=> d!94213 (not (contains!3589 acc!681 k!2843))))

(assert (=> d!94213 (= (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681) lt!313895)))

(declare-fun bs!20047 () Bool)

(assert (= bs!20047 d!94213))

(assert (=> bs!20047 m!647913))

(assert (=> bs!20047 m!647913))

(declare-fun m!648025 () Bool)

(assert (=> bs!20047 m!648025))

(declare-fun m!648027 () Bool)

(assert (=> bs!20047 m!648027))

(assert (=> bs!20047 m!647891))

(assert (=> b!683351 d!94213))

(declare-fun d!94223 () Bool)

(declare-fun res!449245 () Bool)

(declare-fun e!389339 () Bool)

(assert (=> d!94223 (=> res!449245 e!389339)))

(assert (=> d!94223 (= res!449245 (= (select (arr!18971 (array!39579 (store (arr!18971 a!3626) i!1382 k!2843) (size!19335 a!3626))) from!3004) k!2843))))

(assert (=> d!94223 (= (arrayContainsKey!0 (array!39579 (store (arr!18971 a!3626) i!1382 k!2843) (size!19335 a!3626)) k!2843 from!3004) e!389339)))

(declare-fun b!683477 () Bool)

(declare-fun e!389340 () Bool)

(assert (=> b!683477 (= e!389339 e!389340)))

(declare-fun res!449246 () Bool)

(assert (=> b!683477 (=> (not res!449246) (not e!389340))))

(assert (=> b!683477 (= res!449246 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19335 (array!39579 (store (arr!18971 a!3626) i!1382 k!2843) (size!19335 a!3626)))))))

(declare-fun b!683478 () Bool)

(assert (=> b!683478 (= e!389340 (arrayContainsKey!0 (array!39579 (store (arr!18971 a!3626) i!1382 k!2843) (size!19335 a!3626)) k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94223 (not res!449245)) b!683477))

(assert (= (and b!683477 res!449246) b!683478))

(declare-fun m!648029 () Bool)

(assert (=> d!94223 m!648029))

(declare-fun m!648031 () Bool)

(assert (=> b!683478 m!648031))

(assert (=> b!683351 d!94223))

(declare-fun d!94227 () Bool)

(assert (=> d!94227 (subseq!175 acc!681 acc!681)))

(declare-fun lt!313900 () Unit!24022)

(declare-fun choose!36 (List!13012) Unit!24022)

(assert (=> d!94227 (= lt!313900 (choose!36 acc!681))))

(assert (=> d!94227 (= (lemmaListSubSeqRefl!0 acc!681) lt!313900)))

(declare-fun bs!20048 () Bool)

(assert (= bs!20048 d!94227))

(assert (=> bs!20048 m!647903))

(declare-fun m!648045 () Bool)

(assert (=> bs!20048 m!648045))

(assert (=> b!683351 d!94227))

(declare-fun d!94237 () Bool)

(assert (=> d!94237 (= (validKeyInArray!0 (select (arr!18971 a!3626) from!3004)) (and (not (= (select (arr!18971 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18971 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!683351 d!94237))

(declare-fun d!94239 () Bool)

(assert (=> d!94239 (= ($colon$colon!340 acc!681 k!2843) (Cons!13008 k!2843 acc!681))))

(assert (=> b!683351 d!94239))

(declare-fun b!683522 () Bool)

(declare-fun e!389376 () Bool)

(declare-fun call!34023 () Bool)

(assert (=> b!683522 (= e!389376 call!34023)))

(declare-fun b!683523 () Bool)

(declare-fun e!389375 () Bool)

(assert (=> b!683523 (= e!389375 (contains!3589 acc!681 (select (arr!18971 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!683524 () Bool)

(declare-fun e!389374 () Bool)

(assert (=> b!683524 (= e!389374 e!389376)))

(declare-fun c!77495 () Bool)

(assert (=> b!683524 (= c!77495 (validKeyInArray!0 (select (arr!18971 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34020 () Bool)

(assert (=> bm!34020 (= call!34023 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77495 (Cons!13008 (select (arr!18971 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun d!94241 () Bool)

(declare-fun res!449266 () Bool)

(declare-fun e!389377 () Bool)

(assert (=> d!94241 (=> res!449266 e!389377)))

(assert (=> d!94241 (= res!449266 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19335 a!3626)))))

(assert (=> d!94241 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!389377)))

(declare-fun b!683525 () Bool)

(assert (=> b!683525 (= e!389376 call!34023)))

(declare-fun b!683526 () Bool)

(assert (=> b!683526 (= e!389377 e!389374)))

(declare-fun res!449267 () Bool)

(assert (=> b!683526 (=> (not res!449267) (not e!389374))))

(assert (=> b!683526 (= res!449267 (not e!389375))))

(declare-fun res!449268 () Bool)

(assert (=> b!683526 (=> (not res!449268) (not e!389375))))

(assert (=> b!683526 (= res!449268 (validKeyInArray!0 (select (arr!18971 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!94241 (not res!449266)) b!683526))

(assert (= (and b!683526 res!449268) b!683523))

(assert (= (and b!683526 res!449267) b!683524))

(assert (= (and b!683524 c!77495) b!683522))

(assert (= (and b!683524 (not c!77495)) b!683525))

(assert (= (or b!683522 b!683525) bm!34020))

(assert (=> b!683523 m!648009))

(assert (=> b!683523 m!648009))

(declare-fun m!648063 () Bool)

(assert (=> b!683523 m!648063))

(assert (=> b!683524 m!648009))

(assert (=> b!683524 m!648009))

(declare-fun m!648065 () Bool)

(assert (=> b!683524 m!648065))

(assert (=> bm!34020 m!648009))

(declare-fun m!648067 () Bool)

(assert (=> bm!34020 m!648067))

(assert (=> b!683526 m!648009))

(assert (=> b!683526 m!648009))

(assert (=> b!683526 m!648065))

(assert (=> b!683351 d!94241))

(declare-fun d!94247 () Bool)

(assert (=> d!94247 (= ($colon$colon!340 acc!681 (select (arr!18971 a!3626) from!3004)) (Cons!13008 (select (arr!18971 a!3626) from!3004) acc!681))))

(assert (=> b!683340 d!94247))

(assert (=> b!683340 d!94197))

(declare-fun d!94249 () Bool)

(assert (=> d!94249 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313914 () Unit!24022)

(declare-fun choose!80 (array!39578 List!13012 List!13012 (_ BitVec 32)) Unit!24022)

(assert (=> d!94249 (= lt!313914 (choose!80 a!3626 ($colon$colon!340 acc!681 (select (arr!18971 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94249 (bvslt (size!19335 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94249 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!340 acc!681 (select (arr!18971 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!313914)))

(declare-fun bs!20050 () Bool)

(assert (= bs!20050 d!94249))

(assert (=> bs!20050 m!647893))

(assert (=> bs!20050 m!647897))

(declare-fun m!648093 () Bool)

(assert (=> bs!20050 m!648093))

(assert (=> b!683340 d!94249))

(assert (=> b!683340 d!94227))

(assert (=> b!683340 d!94241))

(declare-fun b!683548 () Bool)

(declare-fun e!389399 () Bool)

(declare-fun call!34025 () Bool)

(assert (=> b!683548 (= e!389399 call!34025)))

(declare-fun b!683549 () Bool)

(declare-fun e!389398 () Bool)

(assert (=> b!683549 (= e!389398 (contains!3589 Nil!13009 (select (arr!18971 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!683550 () Bool)

(declare-fun e!389397 () Bool)

(assert (=> b!683550 (= e!389397 e!389399)))

(declare-fun c!77498 () Bool)

(assert (=> b!683550 (= c!77498 (validKeyInArray!0 (select (arr!18971 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34022 () Bool)

(assert (=> bm!34022 (= call!34025 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77498 (Cons!13008 (select (arr!18971 a!3626) #b00000000000000000000000000000000) Nil!13009) Nil!13009)))))

(declare-fun d!94263 () Bool)

(declare-fun res!449286 () Bool)

(declare-fun e!389400 () Bool)

(assert (=> d!94263 (=> res!449286 e!389400)))

(assert (=> d!94263 (= res!449286 (bvsge #b00000000000000000000000000000000 (size!19335 a!3626)))))

(assert (=> d!94263 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13009) e!389400)))

(declare-fun b!683551 () Bool)

(assert (=> b!683551 (= e!389399 call!34025)))

(declare-fun b!683552 () Bool)

(assert (=> b!683552 (= e!389400 e!389397)))

(declare-fun res!449287 () Bool)

(assert (=> b!683552 (=> (not res!449287) (not e!389397))))

(assert (=> b!683552 (= res!449287 (not e!389398))))

(declare-fun res!449288 () Bool)

(assert (=> b!683552 (=> (not res!449288) (not e!389398))))

(assert (=> b!683552 (= res!449288 (validKeyInArray!0 (select (arr!18971 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!94263 (not res!449286)) b!683552))

(assert (= (and b!683552 res!449288) b!683549))

(assert (= (and b!683552 res!449287) b!683550))

(assert (= (and b!683550 c!77498) b!683548))

(assert (= (and b!683550 (not c!77498)) b!683551))

