; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63212 () Bool)

(assert start!63212)

(declare-fun b!712051 () Bool)

(declare-fun e!400589 () Bool)

(declare-datatypes ((List!13396 0))(
  ( (Nil!13393) (Cons!13392 (h!14437 (_ BitVec 64)) (t!19705 List!13396)) )
))
(declare-fun lt!318524 () List!13396)

(declare-fun contains!3973 (List!13396 (_ BitVec 64)) Bool)

(assert (=> b!712051 (= e!400589 (contains!3973 lt!318524 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712052 () Bool)

(declare-fun res!475318 () Bool)

(declare-fun e!400587 () Bool)

(assert (=> b!712052 (=> (not res!475318) (not e!400587))))

(declare-fun newAcc!49 () List!13396)

(assert (=> b!712052 (= res!475318 (not (contains!3973 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712053 () Bool)

(declare-fun res!475307 () Bool)

(assert (=> b!712053 (=> (not res!475307) (not e!400587))))

(declare-fun acc!652 () List!13396)

(declare-fun noDuplicate!1220 (List!13396) Bool)

(assert (=> b!712053 (= res!475307 (noDuplicate!1220 acc!652))))

(declare-fun b!712054 () Bool)

(declare-fun res!475306 () Bool)

(assert (=> b!712054 (=> (not res!475306) (not e!400587))))

(declare-datatypes ((array!40424 0))(
  ( (array!40425 (arr!19355 (Array (_ BitVec 32) (_ BitVec 64))) (size!19760 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40424)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40424 (_ BitVec 32) List!13396) Bool)

(assert (=> b!712054 (= res!475306 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!712055 () Bool)

(declare-fun res!475301 () Bool)

(declare-fun e!400586 () Bool)

(assert (=> b!712055 (=> (not res!475301) (not e!400586))))

(declare-fun lt!318523 () List!13396)

(assert (=> b!712055 (= res!475301 (not (contains!3973 lt!318523 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712056 () Bool)

(declare-fun res!475291 () Bool)

(assert (=> b!712056 (=> (not res!475291) (not e!400587))))

(declare-fun subseq!418 (List!13396 List!13396) Bool)

(assert (=> b!712056 (= res!475291 (subseq!418 acc!652 newAcc!49))))

(declare-fun b!712057 () Bool)

(declare-fun res!475292 () Bool)

(assert (=> b!712057 (=> (not res!475292) (not e!400586))))

(declare-fun k!2824 () (_ BitVec 64))

(assert (=> b!712057 (= res!475292 (not (contains!3973 lt!318523 k!2824)))))

(declare-fun b!712058 () Bool)

(declare-fun res!475304 () Bool)

(assert (=> b!712058 (=> (not res!475304) (not e!400587))))

(assert (=> b!712058 (= res!475304 (not (contains!3973 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712059 () Bool)

(declare-fun res!475293 () Bool)

(assert (=> b!712059 (=> (not res!475293) (not e!400587))))

(declare-fun arrayContainsKey!0 (array!40424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!712059 (= res!475293 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!712060 () Bool)

(declare-fun res!475317 () Bool)

(assert (=> b!712060 (=> (not res!475317) (not e!400587))))

(declare-fun -!383 (List!13396 (_ BitVec 64)) List!13396)

(assert (=> b!712060 (= res!475317 (= (-!383 newAcc!49 k!2824) acc!652))))

(declare-fun b!712061 () Bool)

(declare-fun res!475299 () Bool)

(assert (=> b!712061 (=> (not res!475299) (not e!400587))))

(assert (=> b!712061 (= res!475299 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19760 a!3591)))))

(declare-fun b!712062 () Bool)

(declare-fun res!475297 () Bool)

(assert (=> b!712062 (=> (not res!475297) (not e!400587))))

(assert (=> b!712062 (= res!475297 (contains!3973 newAcc!49 k!2824))))

(declare-fun b!712063 () Bool)

(declare-fun res!475311 () Bool)

(assert (=> b!712063 (=> (not res!475311) (not e!400586))))

(assert (=> b!712063 (= res!475311 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318523))))

(declare-fun b!712064 () Bool)

(declare-fun res!475312 () Bool)

(assert (=> b!712064 (=> (not res!475312) (not e!400587))))

(assert (=> b!712064 (= res!475312 (not (contains!3973 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712065 () Bool)

(declare-fun res!475308 () Bool)

(assert (=> b!712065 (=> (not res!475308) (not e!400587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!712065 (= res!475308 (validKeyInArray!0 k!2824))))

(declare-fun b!712066 () Bool)

(declare-fun res!475315 () Bool)

(assert (=> b!712066 (=> (not res!475315) (not e!400586))))

(assert (=> b!712066 (= res!475315 (contains!3973 lt!318524 k!2824))))

(declare-fun b!712067 () Bool)

(declare-fun res!475300 () Bool)

(assert (=> b!712067 (=> (not res!475300) (not e!400586))))

(assert (=> b!712067 (= res!475300 (noDuplicate!1220 lt!318523))))

(declare-fun res!475305 () Bool)

(assert (=> start!63212 (=> (not res!475305) (not e!400587))))

(assert (=> start!63212 (= res!475305 (and (bvslt (size!19760 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19760 a!3591))))))

(assert (=> start!63212 e!400587))

(assert (=> start!63212 true))

(declare-fun array_inv!15151 (array!40424) Bool)

(assert (=> start!63212 (array_inv!15151 a!3591)))

(declare-fun b!712068 () Bool)

(declare-fun res!475313 () Bool)

(assert (=> b!712068 (=> (not res!475313) (not e!400586))))

(assert (=> b!712068 (= res!475313 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!712069 () Bool)

(declare-fun res!475294 () Bool)

(assert (=> b!712069 (=> (not res!475294) (not e!400586))))

(assert (=> b!712069 (= res!475294 (= (-!383 lt!318524 k!2824) lt!318523))))

(declare-fun b!712070 () Bool)

(declare-fun res!475298 () Bool)

(assert (=> b!712070 (=> (not res!475298) (not e!400587))))

(assert (=> b!712070 (= res!475298 (not (contains!3973 acc!652 k!2824)))))

(declare-fun b!712071 () Bool)

(declare-fun res!475295 () Bool)

(assert (=> b!712071 (=> (not res!475295) (not e!400587))))

(assert (=> b!712071 (= res!475295 (validKeyInArray!0 (select (arr!19355 a!3591) from!2969)))))

(declare-fun b!712072 () Bool)

(declare-fun res!475316 () Bool)

(assert (=> b!712072 (=> (not res!475316) (not e!400586))))

(assert (=> b!712072 (= res!475316 (subseq!418 lt!318523 lt!318524))))

(declare-fun b!712073 () Bool)

(assert (=> b!712073 (= e!400586 e!400589)))

(declare-fun res!475309 () Bool)

(assert (=> b!712073 (=> res!475309 e!400589)))

(assert (=> b!712073 (= res!475309 (contains!3973 lt!318524 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712074 () Bool)

(assert (=> b!712074 (= e!400587 e!400586)))

(declare-fun res!475296 () Bool)

(assert (=> b!712074 (=> (not res!475296) (not e!400586))))

(assert (=> b!712074 (= res!475296 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!529 (List!13396 (_ BitVec 64)) List!13396)

(assert (=> b!712074 (= lt!318524 ($colon$colon!529 newAcc!49 (select (arr!19355 a!3591) from!2969)))))

(assert (=> b!712074 (= lt!318523 ($colon$colon!529 acc!652 (select (arr!19355 a!3591) from!2969)))))

(declare-fun b!712075 () Bool)

(declare-fun res!475310 () Bool)

(assert (=> b!712075 (=> (not res!475310) (not e!400586))))

(assert (=> b!712075 (= res!475310 (not (contains!3973 lt!318523 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712076 () Bool)

(declare-fun res!475302 () Bool)

(assert (=> b!712076 (=> (not res!475302) (not e!400587))))

(assert (=> b!712076 (= res!475302 (not (contains!3973 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712077 () Bool)

(declare-fun res!475314 () Bool)

(assert (=> b!712077 (=> (not res!475314) (not e!400586))))

(assert (=> b!712077 (= res!475314 (noDuplicate!1220 lt!318524))))

(declare-fun b!712078 () Bool)

(declare-fun res!475303 () Bool)

(assert (=> b!712078 (=> (not res!475303) (not e!400587))))

(assert (=> b!712078 (= res!475303 (noDuplicate!1220 newAcc!49))))

(assert (= (and start!63212 res!475305) b!712053))

(assert (= (and b!712053 res!475307) b!712078))

(assert (= (and b!712078 res!475303) b!712064))

(assert (= (and b!712064 res!475312) b!712076))

(assert (= (and b!712076 res!475302) b!712059))

(assert (= (and b!712059 res!475293) b!712070))

(assert (= (and b!712070 res!475298) b!712065))

(assert (= (and b!712065 res!475308) b!712054))

(assert (= (and b!712054 res!475306) b!712056))

(assert (= (and b!712056 res!475291) b!712062))

(assert (= (and b!712062 res!475297) b!712060))

(assert (= (and b!712060 res!475317) b!712058))

(assert (= (and b!712058 res!475304) b!712052))

(assert (= (and b!712052 res!475318) b!712061))

(assert (= (and b!712061 res!475299) b!712071))

(assert (= (and b!712071 res!475295) b!712074))

(assert (= (and b!712074 res!475296) b!712067))

(assert (= (and b!712067 res!475300) b!712077))

(assert (= (and b!712077 res!475314) b!712075))

(assert (= (and b!712075 res!475310) b!712055))

(assert (= (and b!712055 res!475301) b!712068))

(assert (= (and b!712068 res!475313) b!712057))

(assert (= (and b!712057 res!475292) b!712063))

(assert (= (and b!712063 res!475311) b!712072))

(assert (= (and b!712072 res!475316) b!712066))

(assert (= (and b!712066 res!475315) b!712069))

(assert (= (and b!712069 res!475294) b!712073))

(assert (= (and b!712073 (not res!475309)) b!712051))

(declare-fun m!668983 () Bool)

(assert (=> b!712065 m!668983))

(declare-fun m!668985 () Bool)

(assert (=> b!712053 m!668985))

(declare-fun m!668987 () Bool)

(assert (=> b!712063 m!668987))

(declare-fun m!668989 () Bool)

(assert (=> b!712056 m!668989))

(declare-fun m!668991 () Bool)

(assert (=> b!712057 m!668991))

(declare-fun m!668993 () Bool)

(assert (=> b!712058 m!668993))

(declare-fun m!668995 () Bool)

(assert (=> b!712066 m!668995))

(declare-fun m!668997 () Bool)

(assert (=> b!712078 m!668997))

(declare-fun m!668999 () Bool)

(assert (=> b!712064 m!668999))

(declare-fun m!669001 () Bool)

(assert (=> b!712071 m!669001))

(assert (=> b!712071 m!669001))

(declare-fun m!669003 () Bool)

(assert (=> b!712071 m!669003))

(declare-fun m!669005 () Bool)

(assert (=> b!712062 m!669005))

(declare-fun m!669007 () Bool)

(assert (=> b!712073 m!669007))

(assert (=> b!712074 m!669001))

(assert (=> b!712074 m!669001))

(declare-fun m!669009 () Bool)

(assert (=> b!712074 m!669009))

(assert (=> b!712074 m!669001))

(declare-fun m!669011 () Bool)

(assert (=> b!712074 m!669011))

(declare-fun m!669013 () Bool)

(assert (=> b!712052 m!669013))

(declare-fun m!669015 () Bool)

(assert (=> b!712054 m!669015))

(declare-fun m!669017 () Bool)

(assert (=> b!712067 m!669017))

(declare-fun m!669019 () Bool)

(assert (=> b!712069 m!669019))

(declare-fun m!669021 () Bool)

(assert (=> b!712068 m!669021))

(declare-fun m!669023 () Bool)

(assert (=> b!712051 m!669023))

(declare-fun m!669025 () Bool)

(assert (=> start!63212 m!669025))

(declare-fun m!669027 () Bool)

(assert (=> b!712077 m!669027))

(declare-fun m!669029 () Bool)

(assert (=> b!712076 m!669029))

(declare-fun m!669031 () Bool)

(assert (=> b!712070 m!669031))

(declare-fun m!669033 () Bool)

(assert (=> b!712072 m!669033))

(declare-fun m!669035 () Bool)

(assert (=> b!712055 m!669035))

(declare-fun m!669037 () Bool)

(assert (=> b!712075 m!669037))

(declare-fun m!669039 () Bool)

(assert (=> b!712060 m!669039))

(declare-fun m!669041 () Bool)

(assert (=> b!712059 m!669041))

(push 1)

(assert (not b!712055))

(assert (not b!712066))

(assert (not b!712053))

(assert (not b!712060))

(assert (not b!712070))

(assert (not b!712062))

(assert (not b!712051))

(assert (not b!712068))

(assert (not start!63212))

(assert (not b!712078))

(assert (not b!712063))

(assert (not b!712056))

(assert (not b!712069))

(assert (not b!712064))

(assert (not b!712059))

(assert (not b!712058))

(assert (not b!712075))

(assert (not b!712065))

(assert (not b!712073))

(assert (not b!712077))

(assert (not b!712054))

(assert (not b!712076))

(assert (not b!712052))

(assert (not b!712074))

(assert (not b!712067))

(assert (not b!712071))

(assert (not b!712072))

(assert (not b!712057))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97851 () Bool)

(declare-fun lt!318534 () Bool)

(declare-fun content!359 (List!13396) (Set (_ BitVec 64)))

(assert (=> d!97851 (= lt!318534 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!359 acc!652)))))

(declare-fun e!400638 () Bool)

(assert (=> d!97851 (= lt!318534 e!400638)))

(declare-fun res!475360 () Bool)

(assert (=> d!97851 (=> (not res!475360) (not e!400638))))

(assert (=> d!97851 (= res!475360 (is-Cons!13392 acc!652))))

(assert (=> d!97851 (= (contains!3973 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318534)))

(declare-fun b!712132 () Bool)

(declare-fun e!400639 () Bool)

(assert (=> b!712132 (= e!400638 e!400639)))

(declare-fun res!475361 () Bool)

(assert (=> b!712132 (=> res!475361 e!400639)))

(assert (=> b!712132 (= res!475361 (= (h!14437 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712133 () Bool)

(assert (=> b!712133 (= e!400639 (contains!3973 (t!19705 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97851 res!475360) b!712132))

(assert (= (and b!712132 (not res!475361)) b!712133))

(declare-fun m!669079 () Bool)

(assert (=> d!97851 m!669079))

(declare-fun m!669081 () Bool)

(assert (=> d!97851 m!669081))

(declare-fun m!669083 () Bool)

(assert (=> b!712133 m!669083))

(assert (=> b!712064 d!97851))

(declare-fun d!97861 () Bool)

(assert (=> d!97861 (= (array_inv!15151 a!3591) (bvsge (size!19760 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63212 d!97861))

(declare-fun call!34548 () Bool)

(declare-fun c!78758 () Bool)

(declare-fun bm!34545 () Bool)

(assert (=> bm!34545 (= call!34548 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78758 (Cons!13392 (select (arr!19355 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318523) lt!318523)))))

(declare-fun e!400682 () Bool)

(declare-fun b!712181 () Bool)

(assert (=> b!712181 (= e!400682 (contains!3973 lt!318523 (select (arr!19355 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!712183 () Bool)

(declare-fun e!400683 () Bool)

(assert (=> b!712183 (= e!400683 call!34548)))

(declare-fun b!712184 () Bool)

(declare-fun e!400685 () Bool)

(declare-fun e!400684 () Bool)

(assert (=> b!712184 (= e!400685 e!400684)))

(declare-fun res!475400 () Bool)

(assert (=> b!712184 (=> (not res!475400) (not e!400684))))

(assert (=> b!712184 (= res!475400 (not e!400682))))

(declare-fun res!475399 () Bool)

(assert (=> b!712184 (=> (not res!475399) (not e!400682))))

(assert (=> b!712184 (= res!475399 (validKeyInArray!0 (select (arr!19355 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!712185 () Bool)

(assert (=> b!712185 (= e!400683 call!34548)))

(declare-fun b!712182 () Bool)

(assert (=> b!712182 (= e!400684 e!400683)))

(assert (=> b!712182 (= c!78758 (validKeyInArray!0 (select (arr!19355 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun d!97865 () Bool)

(declare-fun res!475401 () Bool)

(assert (=> d!97865 (=> res!475401 e!400685)))

(assert (=> d!97865 (= res!475401 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19760 a!3591)))))

(assert (=> d!97865 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318523) e!400685)))

(assert (= (and d!97865 (not res!475401)) b!712184))

(assert (= (and b!712184 res!475399) b!712181))

(assert (= (and b!712184 res!475400) b!712182))

(assert (= (and b!712182 c!78758) b!712185))

(assert (= (and b!712182 (not c!78758)) b!712183))

(assert (= (or b!712185 b!712183) bm!34545))

(declare-fun m!669131 () Bool)

(assert (=> bm!34545 m!669131))

(declare-fun m!669133 () Bool)

(assert (=> bm!34545 m!669133))

(assert (=> b!712181 m!669131))

(assert (=> b!712181 m!669131))

(declare-fun m!669135 () Bool)

(assert (=> b!712181 m!669135))

(assert (=> b!712184 m!669131))

(assert (=> b!712184 m!669131))

(declare-fun m!669141 () Bool)

(assert (=> b!712184 m!669141))

(assert (=> b!712182 m!669131))

(assert (=> b!712182 m!669131))

(assert (=> b!712182 m!669141))

(assert (=> b!712063 d!97865))

(declare-fun d!97889 () Bool)

(declare-fun res!475423 () Bool)

(declare-fun e!400710 () Bool)

(assert (=> d!97889 (=> res!475423 e!400710)))

(assert (=> d!97889 (= res!475423 (is-Nil!13393 lt!318523))))

(assert (=> d!97889 (= (noDuplicate!1220 lt!318523) e!400710)))

(declare-fun b!712213 () Bool)

(declare-fun e!400711 () Bool)

(assert (=> b!712213 (= e!400710 e!400711)))

(declare-fun res!475424 () Bool)

(assert (=> b!712213 (=> (not res!475424) (not e!400711))))

(assert (=> b!712213 (= res!475424 (not (contains!3973 (t!19705 lt!318523) (h!14437 lt!318523))))))

(declare-fun b!712214 () Bool)

(assert (=> b!712214 (= e!400711 (noDuplicate!1220 (t!19705 lt!318523)))))

(assert (= (and d!97889 (not res!475423)) b!712213))

(assert (= (and b!712213 res!475424) b!712214))

(declare-fun m!669157 () Bool)

(assert (=> b!712213 m!669157))

(declare-fun m!669161 () Bool)

(assert (=> b!712214 m!669161))

(assert (=> b!712067 d!97889))

(declare-fun d!97905 () Bool)

(assert (=> d!97905 (= (validKeyInArray!0 k!2824) (and (not (= k!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!712065 d!97905))

(declare-fun d!97911 () Bool)

(declare-fun lt!318547 () Bool)

(assert (=> d!97911 (= lt!318547 (member k!2824 (content!359 lt!318524)))))

(declare-fun e!400725 () Bool)

(assert (=> d!97911 (= lt!318547 e!400725)))

(declare-fun res!475435 () Bool)

(assert (=> d!97911 (=> (not res!475435) (not e!400725))))

(assert (=> d!97911 (= res!475435 (is-Cons!13392 lt!318524))))

(assert (=> d!97911 (= (contains!3973 lt!318524 k!2824) lt!318547)))

(declare-fun b!712231 () Bool)

(declare-fun e!400726 () Bool)

(assert (=> b!712231 (= e!400725 e!400726)))

(declare-fun res!475436 () Bool)

(assert (=> b!712231 (=> res!475436 e!400726)))

(assert (=> b!712231 (= res!475436 (= (h!14437 lt!318524) k!2824))))

(declare-fun b!712232 () Bool)

(assert (=> b!712232 (= e!400726 (contains!3973 (t!19705 lt!318524) k!2824))))

(assert (= (and d!97911 res!475435) b!712231))

(assert (= (and b!712231 (not res!475436)) b!712232))

(declare-fun m!669185 () Bool)

(assert (=> d!97911 m!669185))

(declare-fun m!669187 () Bool)

(assert (=> d!97911 m!669187))

(declare-fun m!669189 () Bool)

(assert (=> b!712232 m!669189))

(assert (=> b!712066 d!97911))

(declare-fun lt!318558 () List!13396)

(declare-fun e!400755 () Bool)

(declare-fun b!712263 () Bool)

(assert (=> b!712263 (= e!400755 (= (content!359 lt!318558) (setminus (content!359 lt!318524) (insert k!2824 (as emptyset (Set (_ BitVec 64)))))))))

(declare-fun b!712264 () Bool)

(declare-fun e!400754 () List!13396)

(declare-fun call!34556 () List!13396)

(assert (=> b!712264 (= e!400754 (Cons!13392 (h!14437 lt!318524) call!34556))))

(declare-fun b!712265 () Bool)

(declare-fun e!400756 () List!13396)

(assert (=> b!712265 (= e!400756 Nil!13393)))

(declare-fun b!712266 () Bool)

(assert (=> b!712266 (= e!400754 call!34556)))

(declare-fun bm!34553 () Bool)

(assert (=> bm!34553 (= call!34556 (-!383 (t!19705 lt!318524) k!2824))))

(declare-fun d!97917 () Bool)

(assert (=> d!97917 e!400755))

(declare-fun res!475459 () Bool)

(assert (=> d!97917 (=> (not res!475459) (not e!400755))))

(declare-fun size!19762 (List!13396) Int)

(assert (=> d!97917 (= res!475459 (<= (size!19762 lt!318558) (size!19762 lt!318524)))))

(assert (=> d!97917 (= lt!318558 e!400756)))

(declare-fun c!78769 () Bool)

(assert (=> d!97917 (= c!78769 (is-Cons!13392 lt!318524))))

(assert (=> d!97917 (= (-!383 lt!318524 k!2824) lt!318558)))

(declare-fun b!712267 () Bool)

(assert (=> b!712267 (= e!400756 e!400754)))

(declare-fun c!78770 () Bool)

(assert (=> b!712267 (= c!78770 (= k!2824 (h!14437 lt!318524)))))

(assert (= (and d!97917 c!78769) b!712267))

(assert (= (and d!97917 (not c!78769)) b!712265))

(assert (= (and b!712267 c!78770) b!712266))

(assert (= (and b!712267 (not c!78770)) b!712264))

(assert (= (or b!712266 b!712264) bm!34553))

(assert (= (and d!97917 res!475459) b!712263))

(declare-fun m!669231 () Bool)

(assert (=> b!712263 m!669231))

(assert (=> b!712263 m!669185))

(declare-fun m!669233 () Bool)

(assert (=> b!712263 m!669233))

(declare-fun m!669235 () Bool)

(assert (=> bm!34553 m!669235))

(declare-fun m!669237 () Bool)

(assert (=> d!97917 m!669237))

(declare-fun m!669239 () Bool)

(assert (=> d!97917 m!669239))

(assert (=> b!712069 d!97917))

(declare-fun d!97941 () Bool)

(declare-fun lt!318561 () Bool)

(assert (=> d!97941 (= lt!318561 (member k!2824 (content!359 acc!652)))))

(declare-fun e!400762 () Bool)

(assert (=> d!97941 (= lt!318561 e!400762)))

(declare-fun res!475460 () Bool)

(assert (=> d!97941 (=> (not res!475460) (not e!400762))))

(assert (=> d!97941 (= res!475460 (is-Cons!13392 acc!652))))

(assert (=> d!97941 (= (contains!3973 acc!652 k!2824) lt!318561)))

(declare-fun b!712276 () Bool)

(declare-fun e!400763 () Bool)

(assert (=> b!712276 (= e!400762 e!400763)))

(declare-fun res!475461 () Bool)

(assert (=> b!712276 (=> res!475461 e!400763)))

(assert (=> b!712276 (= res!475461 (= (h!14437 acc!652) k!2824))))

(declare-fun b!712277 () Bool)

(assert (=> b!712277 (= e!400763 (contains!3973 (t!19705 acc!652) k!2824))))

(assert (= (and d!97941 res!475460) b!712276))

(assert (= (and b!712276 (not res!475461)) b!712277))

(assert (=> d!97941 m!669079))

(declare-fun m!669241 () Bool)

(assert (=> d!97941 m!669241))

(declare-fun m!669243 () Bool)

(assert (=> b!712277 m!669243))

(assert (=> b!712070 d!97941))

(declare-fun d!97943 () Bool)

(declare-fun res!475469 () Bool)

(declare-fun e!400773 () Bool)

(assert (=> d!97943 (=> res!475469 e!400773)))

(assert (=> d!97943 (= res!475469 (= (select (arr!19355 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k!2824))))

(assert (=> d!97943 (= (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!400773)))

(declare-fun b!712289 () Bool)

(declare-fun e!400774 () Bool)

(assert (=> b!712289 (= e!400773 e!400774)))

(declare-fun res!475470 () Bool)

(assert (=> b!712289 (=> (not res!475470) (not e!400774))))

(assert (=> b!712289 (= res!475470 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19760 a!3591)))))

(declare-fun b!712290 () Bool)

(assert (=> b!712290 (= e!400774 (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97943 (not res!475469)) b!712289))

(assert (= (and b!712289 res!475470) b!712290))

(assert (=> d!97943 m!669131))

(declare-fun m!669245 () Bool)

(assert (=> b!712290 m!669245))

(assert (=> b!712068 d!97943))

(declare-fun b!712315 () Bool)

(declare-fun e!400797 () Bool)

(assert (=> b!712315 (= e!400797 (subseq!418 (t!19705 lt!318523) (t!19705 lt!318524)))))

(declare-fun b!712314 () Bool)

(declare-fun e!400795 () Bool)

(declare-fun e!400794 () Bool)

(assert (=> b!712314 (= e!400795 e!400794)))

(declare-fun res!475487 () Bool)

(assert (=> b!712314 (=> res!475487 e!400794)))

(assert (=> b!712314 (= res!475487 e!400797)))

(declare-fun res!475490 () Bool)

(assert (=> b!712314 (=> (not res!475490) (not e!400797))))

(assert (=> b!712314 (= res!475490 (= (h!14437 lt!318523) (h!14437 lt!318524)))))

(declare-fun d!97945 () Bool)

(declare-fun res!475489 () Bool)

(declare-fun e!400796 () Bool)

(assert (=> d!97945 (=> res!475489 e!400796)))

(assert (=> d!97945 (= res!475489 (is-Nil!13393 lt!318523))))

(assert (=> d!97945 (= (subseq!418 lt!318523 lt!318524) e!400796)))

(declare-fun b!712316 () Bool)

(assert (=> b!712316 (= e!400794 (subseq!418 lt!318523 (t!19705 lt!318524)))))

(declare-fun b!712313 () Bool)

(assert (=> b!712313 (= e!400796 e!400795)))

(declare-fun res!475488 () Bool)

(assert (=> b!712313 (=> (not res!475488) (not e!400795))))

(assert (=> b!712313 (= res!475488 (is-Cons!13392 lt!318524))))

(assert (= (and d!97945 (not res!475489)) b!712313))

(assert (= (and b!712313 res!475488) b!712314))

(assert (= (and b!712314 res!475490) b!712315))

(assert (= (and b!712314 (not res!475487)) b!712316))

(declare-fun m!669279 () Bool)

(assert (=> b!712315 m!669279))

(declare-fun m!669281 () Bool)

(assert (=> b!712316 m!669281))

(assert (=> b!712072 d!97945))

(declare-fun d!97957 () Bool)

(declare-fun lt!318566 () Bool)

(assert (=> d!97957 (= lt!318566 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!359 lt!318524)))))

(declare-fun e!400802 () Bool)

(assert (=> d!97957 (= lt!318566 e!400802)))

(declare-fun res!475495 () Bool)

(assert (=> d!97957 (=> (not res!475495) (not e!400802))))

(assert (=> d!97957 (= res!475495 (is-Cons!13392 lt!318524))))

(assert (=> d!97957 (= (contains!3973 lt!318524 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318566)))

(declare-fun b!712321 () Bool)

(declare-fun e!400803 () Bool)

(assert (=> b!712321 (= e!400802 e!400803)))

(declare-fun res!475496 () Bool)

(assert (=> b!712321 (=> res!475496 e!400803)))

(assert (=> b!712321 (= res!475496 (= (h!14437 lt!318524) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712322 () Bool)

(assert (=> b!712322 (= e!400803 (contains!3973 (t!19705 lt!318524) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97957 res!475495) b!712321))

(assert (= (and b!712321 (not res!475496)) b!712322))

(assert (=> d!97957 m!669185))

(declare-fun m!669283 () Bool)

(assert (=> d!97957 m!669283))

(declare-fun m!669285 () Bool)

(assert (=> b!712322 m!669285))

(assert (=> b!712051 d!97957))

(declare-fun d!97959 () Bool)

(assert (=> d!97959 (= (validKeyInArray!0 (select (arr!19355 a!3591) from!2969)) (and (not (= (select (arr!19355 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19355 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!712071 d!97959))

(declare-fun d!97961 () Bool)

(declare-fun res!475497 () Bool)

(declare-fun e!400804 () Bool)

(assert (=> d!97961 (=> res!475497 e!400804)))

(assert (=> d!97961 (= res!475497 (is-Nil!13393 acc!652))))

(assert (=> d!97961 (= (noDuplicate!1220 acc!652) e!400804)))

(declare-fun b!712323 () Bool)

(declare-fun e!400805 () Bool)

(assert (=> b!712323 (= e!400804 e!400805)))

(declare-fun res!475498 () Bool)

(assert (=> b!712323 (=> (not res!475498) (not e!400805))))

(assert (=> b!712323 (= res!475498 (not (contains!3973 (t!19705 acc!652) (h!14437 acc!652))))))

(declare-fun b!712324 () Bool)

(assert (=> b!712324 (= e!400805 (noDuplicate!1220 (t!19705 acc!652)))))

(assert (= (and d!97961 (not res!475497)) b!712323))

(assert (= (and b!712323 res!475498) b!712324))

(declare-fun m!669287 () Bool)

(assert (=> b!712323 m!669287))

(declare-fun m!669289 () Bool)

(assert (=> b!712324 m!669289))

(assert (=> b!712053 d!97961))

(declare-fun d!97963 () Bool)

(declare-fun lt!318567 () Bool)

(assert (=> d!97963 (= lt!318567 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!359 lt!318523)))))

(declare-fun e!400808 () Bool)

(assert (=> d!97963 (= lt!318567 e!400808)))

(declare-fun res!475501 () Bool)

(assert (=> d!97963 (=> (not res!475501) (not e!400808))))

(assert (=> d!97963 (= res!475501 (is-Cons!13392 lt!318523))))

(assert (=> d!97963 (= (contains!3973 lt!318523 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318567)))

(declare-fun b!712327 () Bool)

(declare-fun e!400809 () Bool)

(assert (=> b!712327 (= e!400808 e!400809)))

(declare-fun res!475502 () Bool)

(assert (=> b!712327 (=> res!475502 e!400809)))

(assert (=> b!712327 (= res!475502 (= (h!14437 lt!318523) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712328 () Bool)

(assert (=> b!712328 (= e!400809 (contains!3973 (t!19705 lt!318523) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97963 res!475501) b!712327))

(assert (= (and b!712327 (not res!475502)) b!712328))

(declare-fun m!669293 () Bool)

(assert (=> d!97963 m!669293))

(declare-fun m!669295 () Bool)

(assert (=> d!97963 m!669295))

(declare-fun m!669297 () Bool)

(assert (=> b!712328 m!669297))

(assert (=> b!712075 d!97963))

(declare-fun c!78780 () Bool)

(declare-fun call!34562 () Bool)

(declare-fun bm!34559 () Bool)

(assert (=> bm!34559 (= call!34562 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78780 (Cons!13392 (select (arr!19355 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun e!400812 () Bool)

(declare-fun b!712331 () Bool)

(assert (=> b!712331 (= e!400812 (contains!3973 acc!652 (select (arr!19355 a!3591) from!2969)))))

(declare-fun b!712333 () Bool)

(declare-fun e!400813 () Bool)

(assert (=> b!712333 (= e!400813 call!34562)))

(declare-fun b!712334 () Bool)

(declare-fun e!400815 () Bool)

(declare-fun e!400814 () Bool)

(assert (=> b!712334 (= e!400815 e!400814)))

(declare-fun res!475506 () Bool)

(assert (=> b!712334 (=> (not res!475506) (not e!400814))))

(assert (=> b!712334 (= res!475506 (not e!400812))))

(declare-fun res!475505 () Bool)

(assert (=> b!712334 (=> (not res!475505) (not e!400812))))

(assert (=> b!712334 (= res!475505 (validKeyInArray!0 (select (arr!19355 a!3591) from!2969)))))

(declare-fun b!712335 () Bool)

(assert (=> b!712335 (= e!400813 call!34562)))

(declare-fun b!712332 () Bool)

(assert (=> b!712332 (= e!400814 e!400813)))

(assert (=> b!712332 (= c!78780 (validKeyInArray!0 (select (arr!19355 a!3591) from!2969)))))

(declare-fun d!97967 () Bool)

(declare-fun res!475507 () Bool)

(assert (=> d!97967 (=> res!475507 e!400815)))

(assert (=> d!97967 (= res!475507 (bvsge from!2969 (size!19760 a!3591)))))

(assert (=> d!97967 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!400815)))

(assert (= (and d!97967 (not res!475507)) b!712334))

(assert (= (and b!712334 res!475505) b!712331))

(assert (= (and b!712334 res!475506) b!712332))

(assert (= (and b!712332 c!78780) b!712335))

(assert (= (and b!712332 (not c!78780)) b!712333))

(assert (= (or b!712335 b!712333) bm!34559))

(assert (=> bm!34559 m!669001))

(declare-fun m!669307 () Bool)

(assert (=> bm!34559 m!669307))

(assert (=> b!712331 m!669001))

(assert (=> b!712331 m!669001))

(declare-fun m!669309 () Bool)

(assert (=> b!712331 m!669309))

(assert (=> b!712334 m!669001))

(assert (=> b!712334 m!669001))

(assert (=> b!712334 m!669003))

(assert (=> b!712332 m!669001))

(assert (=> b!712332 m!669001))

(assert (=> b!712332 m!669003))

(assert (=> b!712054 d!97967))

(declare-fun d!97973 () Bool)

(declare-fun lt!318570 () Bool)

(assert (=> d!97973 (= lt!318570 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!359 lt!318524)))))

(declare-fun e!400820 () Bool)

(assert (=> d!97973 (= lt!318570 e!400820)))

(declare-fun res!475512 () Bool)

(assert (=> d!97973 (=> (not res!475512) (not e!400820))))

(assert (=> d!97973 (= res!475512 (is-Cons!13392 lt!318524))))

(assert (=> d!97973 (= (contains!3973 lt!318524 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318570)))

(declare-fun b!712340 () Bool)

(declare-fun e!400821 () Bool)

(assert (=> b!712340 (= e!400820 e!400821)))

(declare-fun res!475513 () Bool)

(assert (=> b!712340 (=> res!475513 e!400821)))

