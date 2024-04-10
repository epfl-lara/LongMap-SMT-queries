; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62968 () Bool)

(assert start!62968)

(declare-fun b!709860 () Bool)

(declare-fun res!473374 () Bool)

(declare-fun e!399437 () Bool)

(assert (=> b!709860 (=> (not res!473374) (not e!399437))))

(declare-datatypes ((List!13382 0))(
  ( (Nil!13379) (Cons!13378 (h!14423 (_ BitVec 64)) (t!19679 List!13382)) )
))
(declare-fun acc!652 () List!13382)

(declare-fun contains!3959 (List!13382 (_ BitVec 64)) Bool)

(assert (=> b!709860 (= res!473374 (not (contains!3959 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!473363 () Bool)

(assert (=> start!62968 (=> (not res!473363) (not e!399437))))

(declare-datatypes ((array!40384 0))(
  ( (array!40385 (arr!19341 (Array (_ BitVec 32) (_ BitVec 64))) (size!19737 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40384)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62968 (= res!473363 (and (bvslt (size!19737 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19737 a!3591))))))

(assert (=> start!62968 e!399437))

(assert (=> start!62968 true))

(declare-fun array_inv!15137 (array!40384) Bool)

(assert (=> start!62968 (array_inv!15137 a!3591)))

(declare-fun b!709861 () Bool)

(declare-fun res!473367 () Bool)

(declare-fun e!399435 () Bool)

(assert (=> b!709861 (=> (not res!473367) (not e!399435))))

(declare-fun lt!318269 () List!13382)

(declare-fun k!2824 () (_ BitVec 64))

(assert (=> b!709861 (= res!473367 (not (contains!3959 lt!318269 k!2824)))))

(declare-fun b!709862 () Bool)

(declare-fun res!473360 () Bool)

(assert (=> b!709862 (=> (not res!473360) (not e!399437))))

(declare-fun newAcc!49 () List!13382)

(assert (=> b!709862 (= res!473360 (not (contains!3959 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709863 () Bool)

(declare-fun res!473357 () Bool)

(assert (=> b!709863 (=> (not res!473357) (not e!399437))))

(assert (=> b!709863 (= res!473357 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19737 a!3591)))))

(declare-fun b!709864 () Bool)

(declare-fun res!473354 () Bool)

(assert (=> b!709864 (=> (not res!473354) (not e!399437))))

(declare-fun arrayNoDuplicates!0 (array!40384 (_ BitVec 32) List!13382) Bool)

(assert (=> b!709864 (= res!473354 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!709865 () Bool)

(declare-fun res!473371 () Bool)

(assert (=> b!709865 (=> (not res!473371) (not e!399437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!709865 (= res!473371 (validKeyInArray!0 (select (arr!19341 a!3591) from!2969)))))

(declare-fun b!709866 () Bool)

(declare-fun res!473352 () Bool)

(assert (=> b!709866 (=> (not res!473352) (not e!399437))))

(assert (=> b!709866 (= res!473352 (not (contains!3959 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709867 () Bool)

(declare-fun res!473372 () Bool)

(assert (=> b!709867 (=> (not res!473372) (not e!399437))))

(assert (=> b!709867 (= res!473372 (not (contains!3959 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709868 () Bool)

(declare-fun res!473361 () Bool)

(assert (=> b!709868 (=> (not res!473361) (not e!399435))))

(declare-fun noDuplicate!1206 (List!13382) Bool)

(declare-fun $colon$colon!515 (List!13382 (_ BitVec 64)) List!13382)

(assert (=> b!709868 (= res!473361 (noDuplicate!1206 ($colon$colon!515 newAcc!49 (select (arr!19341 a!3591) from!2969))))))

(declare-fun b!709869 () Bool)

(declare-fun res!473370 () Bool)

(assert (=> b!709869 (=> (not res!473370) (not e!399435))))

(declare-fun arrayContainsKey!0 (array!40384 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!709869 (= res!473370 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!709870 () Bool)

(assert (=> b!709870 (= e!399435 (not (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318269)))))

(declare-fun b!709871 () Bool)

(declare-fun res!473359 () Bool)

(assert (=> b!709871 (=> (not res!473359) (not e!399435))))

(assert (=> b!709871 (= res!473359 (not (contains!3959 lt!318269 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709872 () Bool)

(declare-fun res!473369 () Bool)

(assert (=> b!709872 (=> (not res!473369) (not e!399437))))

(assert (=> b!709872 (= res!473369 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!709873 () Bool)

(declare-fun res!473356 () Bool)

(assert (=> b!709873 (=> (not res!473356) (not e!399435))))

(assert (=> b!709873 (= res!473356 (not (contains!3959 lt!318269 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709874 () Bool)

(declare-fun res!473362 () Bool)

(assert (=> b!709874 (=> (not res!473362) (not e!399437))))

(assert (=> b!709874 (= res!473362 (noDuplicate!1206 acc!652))))

(declare-fun b!709875 () Bool)

(declare-fun res!473353 () Bool)

(assert (=> b!709875 (=> (not res!473353) (not e!399437))))

(assert (=> b!709875 (= res!473353 (contains!3959 newAcc!49 k!2824))))

(declare-fun b!709876 () Bool)

(declare-fun res!473373 () Bool)

(assert (=> b!709876 (=> (not res!473373) (not e!399437))))

(declare-fun -!369 (List!13382 (_ BitVec 64)) List!13382)

(assert (=> b!709876 (= res!473373 (= (-!369 newAcc!49 k!2824) acc!652))))

(declare-fun b!709877 () Bool)

(declare-fun res!473364 () Bool)

(assert (=> b!709877 (=> (not res!473364) (not e!399437))))

(assert (=> b!709877 (= res!473364 (noDuplicate!1206 newAcc!49))))

(declare-fun b!709878 () Bool)

(declare-fun res!473358 () Bool)

(assert (=> b!709878 (=> (not res!473358) (not e!399437))))

(assert (=> b!709878 (= res!473358 (not (contains!3959 acc!652 k!2824)))))

(declare-fun b!709879 () Bool)

(assert (=> b!709879 (= e!399437 e!399435)))

(declare-fun res!473368 () Bool)

(assert (=> b!709879 (=> (not res!473368) (not e!399435))))

(assert (=> b!709879 (= res!473368 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(assert (=> b!709879 (= lt!318269 ($colon$colon!515 acc!652 (select (arr!19341 a!3591) from!2969)))))

(declare-fun b!709880 () Bool)

(declare-fun res!473365 () Bool)

(assert (=> b!709880 (=> (not res!473365) (not e!399437))))

(declare-fun subseq!404 (List!13382 List!13382) Bool)

(assert (=> b!709880 (= res!473365 (subseq!404 acc!652 newAcc!49))))

(declare-fun b!709881 () Bool)

(declare-fun res!473366 () Bool)

(assert (=> b!709881 (=> (not res!473366) (not e!399435))))

(assert (=> b!709881 (= res!473366 (noDuplicate!1206 lt!318269))))

(declare-fun b!709882 () Bool)

(declare-fun res!473355 () Bool)

(assert (=> b!709882 (=> (not res!473355) (not e!399437))))

(assert (=> b!709882 (= res!473355 (validKeyInArray!0 k!2824))))

(assert (= (and start!62968 res!473363) b!709874))

(assert (= (and b!709874 res!473362) b!709877))

(assert (= (and b!709877 res!473364) b!709860))

(assert (= (and b!709860 res!473374) b!709866))

(assert (= (and b!709866 res!473352) b!709872))

(assert (= (and b!709872 res!473369) b!709878))

(assert (= (and b!709878 res!473358) b!709882))

(assert (= (and b!709882 res!473355) b!709864))

(assert (= (and b!709864 res!473354) b!709880))

(assert (= (and b!709880 res!473365) b!709875))

(assert (= (and b!709875 res!473353) b!709876))

(assert (= (and b!709876 res!473373) b!709867))

(assert (= (and b!709867 res!473372) b!709862))

(assert (= (and b!709862 res!473360) b!709863))

(assert (= (and b!709863 res!473357) b!709865))

(assert (= (and b!709865 res!473371) b!709879))

(assert (= (and b!709879 res!473368) b!709881))

(assert (= (and b!709881 res!473366) b!709868))

(assert (= (and b!709868 res!473361) b!709871))

(assert (= (and b!709871 res!473359) b!709873))

(assert (= (and b!709873 res!473356) b!709869))

(assert (= (and b!709869 res!473370) b!709861))

(assert (= (and b!709861 res!473367) b!709870))

(declare-fun m!667075 () Bool)

(assert (=> b!709873 m!667075))

(declare-fun m!667077 () Bool)

(assert (=> b!709867 m!667077))

(declare-fun m!667079 () Bool)

(assert (=> b!709864 m!667079))

(declare-fun m!667081 () Bool)

(assert (=> start!62968 m!667081))

(declare-fun m!667083 () Bool)

(assert (=> b!709882 m!667083))

(declare-fun m!667085 () Bool)

(assert (=> b!709869 m!667085))

(declare-fun m!667087 () Bool)

(assert (=> b!709877 m!667087))

(declare-fun m!667089 () Bool)

(assert (=> b!709862 m!667089))

(declare-fun m!667091 () Bool)

(assert (=> b!709878 m!667091))

(declare-fun m!667093 () Bool)

(assert (=> b!709860 m!667093))

(declare-fun m!667095 () Bool)

(assert (=> b!709876 m!667095))

(declare-fun m!667097 () Bool)

(assert (=> b!709881 m!667097))

(declare-fun m!667099 () Bool)

(assert (=> b!709872 m!667099))

(declare-fun m!667101 () Bool)

(assert (=> b!709865 m!667101))

(assert (=> b!709865 m!667101))

(declare-fun m!667103 () Bool)

(assert (=> b!709865 m!667103))

(declare-fun m!667105 () Bool)

(assert (=> b!709871 m!667105))

(assert (=> b!709879 m!667101))

(assert (=> b!709879 m!667101))

(declare-fun m!667107 () Bool)

(assert (=> b!709879 m!667107))

(declare-fun m!667109 () Bool)

(assert (=> b!709866 m!667109))

(declare-fun m!667111 () Bool)

(assert (=> b!709870 m!667111))

(declare-fun m!667113 () Bool)

(assert (=> b!709874 m!667113))

(declare-fun m!667115 () Bool)

(assert (=> b!709880 m!667115))

(declare-fun m!667117 () Bool)

(assert (=> b!709861 m!667117))

(declare-fun m!667119 () Bool)

(assert (=> b!709875 m!667119))

(assert (=> b!709868 m!667101))

(assert (=> b!709868 m!667101))

(declare-fun m!667121 () Bool)

(assert (=> b!709868 m!667121))

(assert (=> b!709868 m!667121))

(declare-fun m!667123 () Bool)

(assert (=> b!709868 m!667123))

(push 1)

(assert (not b!709876))

(assert (not b!709864))

(assert (not b!709881))

(assert (not start!62968))

(assert (not b!709871))

(assert (not b!709874))

(assert (not b!709878))

(assert (not b!709877))

(assert (not b!709869))

(assert (not b!709879))

(assert (not b!709870))

(assert (not b!709860))

(assert (not b!709862))

(assert (not b!709861))

(assert (not b!709873))

(assert (not b!709882))

(assert (not b!709867))

(assert (not b!709872))

(assert (not b!709865))

(assert (not b!709880))

(assert (not b!709868))

(assert (not b!709866))

(assert (not b!709875))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97241 () Bool)

(declare-fun lt!318281 () Bool)

(declare-fun content!347 (List!13382) (Set (_ BitVec 64)))

(assert (=> d!97241 (= lt!318281 (set.member k!2824 (content!347 newAcc!49)))))

(declare-fun e!399498 () Bool)

(assert (=> d!97241 (= lt!318281 e!399498)))

(declare-fun res!473552 () Bool)

(assert (=> d!97241 (=> (not res!473552) (not e!399498))))

(assert (=> d!97241 (= res!473552 (is-Cons!13378 newAcc!49))))

(assert (=> d!97241 (= (contains!3959 newAcc!49 k!2824) lt!318281)))

(declare-fun b!710067 () Bool)

(declare-fun e!399499 () Bool)

(assert (=> b!710067 (= e!399498 e!399499)))

(declare-fun res!473551 () Bool)

(assert (=> b!710067 (=> res!473551 e!399499)))

(assert (=> b!710067 (= res!473551 (= (h!14423 newAcc!49) k!2824))))

(declare-fun b!710068 () Bool)

(assert (=> b!710068 (= e!399499 (contains!3959 (t!19679 newAcc!49) k!2824))))

(assert (= (and d!97241 res!473552) b!710067))

(assert (= (and b!710067 (not res!473551)) b!710068))

(declare-fun m!667247 () Bool)

(assert (=> d!97241 m!667247))

(declare-fun m!667249 () Bool)

(assert (=> d!97241 m!667249))

(declare-fun m!667251 () Bool)

(assert (=> b!710068 m!667251))

(assert (=> b!709875 d!97241))

(declare-fun bm!34458 () Bool)

(declare-fun call!34461 () List!13382)

(assert (=> bm!34458 (= call!34461 (-!369 (t!19679 newAcc!49) k!2824))))

(declare-fun b!710111 () Bool)

(declare-fun e!399538 () List!13382)

(assert (=> b!710111 (= e!399538 (Cons!13378 (h!14423 newAcc!49) call!34461))))

(declare-fun b!710113 () Bool)

(assert (=> b!710113 (= e!399538 call!34461)))

(declare-fun e!399537 () Bool)

(declare-fun lt!318287 () List!13382)

(declare-fun b!710114 () Bool)

(assert (=> b!710114 (= e!399537 (= (content!347 lt!318287) (set.minus (content!347 newAcc!49) (set.insert k!2824 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun b!710115 () Bool)

(declare-fun e!399536 () List!13382)

(assert (=> b!710115 (= e!399536 e!399538)))

(declare-fun c!78634 () Bool)

(assert (=> b!710115 (= c!78634 (= k!2824 (h!14423 newAcc!49)))))

(declare-fun b!710112 () Bool)

(assert (=> b!710112 (= e!399536 Nil!13379)))

(declare-fun d!97245 () Bool)

(assert (=> d!97245 e!399537))

(declare-fun res!473579 () Bool)

(assert (=> d!97245 (=> (not res!473579) (not e!399537))))

(declare-fun size!19740 (List!13382) Int)

(assert (=> d!97245 (= res!473579 (<= (size!19740 lt!318287) (size!19740 newAcc!49)))))

(assert (=> d!97245 (= lt!318287 e!399536)))

(declare-fun c!78633 () Bool)

(assert (=> d!97245 (= c!78633 (is-Cons!13378 newAcc!49))))

(assert (=> d!97245 (= (-!369 newAcc!49 k!2824) lt!318287)))

(assert (= (and d!97245 c!78633) b!710115))

(assert (= (and d!97245 (not c!78633)) b!710112))

(assert (= (and b!710115 c!78634) b!710113))

(assert (= (and b!710115 (not c!78634)) b!710111))

(assert (= (or b!710113 b!710111) bm!34458))

(assert (= (and d!97245 res!473579) b!710114))

(declare-fun m!667265 () Bool)

(assert (=> bm!34458 m!667265))

(declare-fun m!667267 () Bool)

(assert (=> b!710114 m!667267))

(assert (=> b!710114 m!667247))

(declare-fun m!667271 () Bool)

(assert (=> b!710114 m!667271))

(declare-fun m!667273 () Bool)

(assert (=> d!97245 m!667273))

(declare-fun m!667277 () Bool)

(assert (=> d!97245 m!667277))

(assert (=> b!709876 d!97245))

(declare-fun d!97259 () Bool)

(assert (=> d!97259 (= (validKeyInArray!0 (select (arr!19341 a!3591) from!2969)) (and (not (= (select (arr!19341 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19341 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!709865 d!97259))

(declare-fun d!97267 () Bool)

(declare-fun res!473595 () Bool)

(declare-fun e!399556 () Bool)

(assert (=> d!97267 (=> res!473595 e!399556)))

(assert (=> d!97267 (= res!473595 (is-Nil!13379 acc!652))))

(assert (=> d!97267 (= (noDuplicate!1206 acc!652) e!399556)))

(declare-fun b!710135 () Bool)

(declare-fun e!399557 () Bool)

(assert (=> b!710135 (= e!399556 e!399557)))

(declare-fun res!473596 () Bool)

(assert (=> b!710135 (=> (not res!473596) (not e!399557))))

(assert (=> b!710135 (= res!473596 (not (contains!3959 (t!19679 acc!652) (h!14423 acc!652))))))

(declare-fun b!710136 () Bool)

(assert (=> b!710136 (= e!399557 (noDuplicate!1206 (t!19679 acc!652)))))

(assert (= (and d!97267 (not res!473595)) b!710135))

(assert (= (and b!710135 res!473596) b!710136))

(declare-fun m!667301 () Bool)

(assert (=> b!710135 m!667301))

(declare-fun m!667303 () Bool)

(assert (=> b!710136 m!667303))

(assert (=> b!709874 d!97267))

(declare-fun e!399612 () Bool)

(declare-fun b!710196 () Bool)

(assert (=> b!710196 (= e!399612 (contains!3959 acc!652 (select (arr!19341 a!3591) from!2969)))))

(declare-fun b!710198 () Bool)

(declare-fun e!399613 () Bool)

(declare-fun call!34468 () Bool)

(assert (=> b!710198 (= e!399613 call!34468)))

(declare-fun c!78642 () Bool)

(declare-fun bm!34465 () Bool)

(assert (=> bm!34465 (= call!34468 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78642 (Cons!13378 (select (arr!19341 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!710199 () Bool)

(declare-fun e!399614 () Bool)

(assert (=> b!710199 (= e!399614 e!399613)))

(assert (=> b!710199 (= c!78642 (validKeyInArray!0 (select (arr!19341 a!3591) from!2969)))))

(declare-fun b!710200 () Bool)

(declare-fun e!399615 () Bool)

(assert (=> b!710200 (= e!399615 e!399614)))

(declare-fun res!473646 () Bool)

(assert (=> b!710200 (=> (not res!473646) (not e!399614))))

(assert (=> b!710200 (= res!473646 (not e!399612))))

(declare-fun res!473648 () Bool)

(assert (=> b!710200 (=> (not res!473648) (not e!399612))))

(assert (=> b!710200 (= res!473648 (validKeyInArray!0 (select (arr!19341 a!3591) from!2969)))))

(declare-fun d!97269 () Bool)

(declare-fun res!473647 () Bool)

(assert (=> d!97269 (=> res!473647 e!399615)))

(assert (=> d!97269 (= res!473647 (bvsge from!2969 (size!19737 a!3591)))))

(assert (=> d!97269 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!399615)))

(declare-fun b!710197 () Bool)

(assert (=> b!710197 (= e!399613 call!34468)))

(assert (= (and d!97269 (not res!473647)) b!710200))

(assert (= (and b!710200 res!473648) b!710196))

(assert (= (and b!710200 res!473646) b!710199))

(assert (= (and b!710199 c!78642) b!710197))

(assert (= (and b!710199 (not c!78642)) b!710198))

(assert (= (or b!710197 b!710198) bm!34465))

(assert (=> b!710196 m!667101))

(assert (=> b!710196 m!667101))

(declare-fun m!667381 () Bool)

(assert (=> b!710196 m!667381))

(assert (=> bm!34465 m!667101))

(declare-fun m!667385 () Bool)

(assert (=> bm!34465 m!667385))

(assert (=> b!710199 m!667101))

(assert (=> b!710199 m!667101))

(assert (=> b!710199 m!667103))

(assert (=> b!710200 m!667101))

(assert (=> b!710200 m!667101))

(assert (=> b!710200 m!667103))

(assert (=> b!709864 d!97269))

(declare-fun d!97313 () Bool)

(declare-fun lt!318305 () Bool)

(assert (=> d!97313 (= lt!318305 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!347 newAcc!49)))))

(declare-fun e!399622 () Bool)

(assert (=> d!97313 (= lt!318305 e!399622)))

(declare-fun res!473656 () Bool)

(assert (=> d!97313 (=> (not res!473656) (not e!399622))))

(assert (=> d!97313 (= res!473656 (is-Cons!13378 newAcc!49))))

(assert (=> d!97313 (= (contains!3959 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318305)))

(declare-fun b!710207 () Bool)

(declare-fun e!399623 () Bool)

(assert (=> b!710207 (= e!399622 e!399623)))

(declare-fun res!473655 () Bool)

(assert (=> b!710207 (=> res!473655 e!399623)))

(assert (=> b!710207 (= res!473655 (= (h!14423 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710208 () Bool)

(assert (=> b!710208 (= e!399623 (contains!3959 (t!19679 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97313 res!473656) b!710207))

(assert (= (and b!710207 (not res!473655)) b!710208))

(assert (=> d!97313 m!667247))

(declare-fun m!667391 () Bool)

(assert (=> d!97313 m!667391))

(declare-fun m!667393 () Bool)

(assert (=> b!710208 m!667393))

(assert (=> b!709862 d!97313))

(declare-fun d!97315 () Bool)

(declare-fun lt!318306 () Bool)

(assert (=> d!97315 (= lt!318306 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!347 lt!318269)))))

(declare-fun e!399624 () Bool)

(assert (=> d!97315 (= lt!318306 e!399624)))

(declare-fun res!473658 () Bool)

(assert (=> d!97315 (=> (not res!473658) (not e!399624))))

(assert (=> d!97315 (= res!473658 (is-Cons!13378 lt!318269))))

(assert (=> d!97315 (= (contains!3959 lt!318269 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318306)))

(declare-fun b!710209 () Bool)

(declare-fun e!399625 () Bool)

(assert (=> b!710209 (= e!399624 e!399625)))

(declare-fun res!473657 () Bool)

(assert (=> b!710209 (=> res!473657 e!399625)))

(assert (=> b!710209 (= res!473657 (= (h!14423 lt!318269) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710210 () Bool)

(assert (=> b!710210 (= e!399625 (contains!3959 (t!19679 lt!318269) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97315 res!473658) b!710209))

(assert (= (and b!710209 (not res!473657)) b!710210))

(declare-fun m!667395 () Bool)

(assert (=> d!97315 m!667395))

(declare-fun m!667397 () Bool)

(assert (=> d!97315 m!667397))

(declare-fun m!667399 () Bool)

(assert (=> b!710210 m!667399))

(assert (=> b!709873 d!97315))

(declare-fun d!97317 () Bool)

(assert (=> d!97317 (= (validKeyInArray!0 k!2824) (and (not (= k!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!709882 d!97317))

(declare-fun d!97319 () Bool)

(declare-fun lt!318307 () Bool)

(assert (=> d!97319 (= lt!318307 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!347 lt!318269)))))

(declare-fun e!399626 () Bool)

(assert (=> d!97319 (= lt!318307 e!399626)))

(declare-fun res!473660 () Bool)

(assert (=> d!97319 (=> (not res!473660) (not e!399626))))

(assert (=> d!97319 (= res!473660 (is-Cons!13378 lt!318269))))

(assert (=> d!97319 (= (contains!3959 lt!318269 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318307)))

(declare-fun b!710211 () Bool)

(declare-fun e!399627 () Bool)

(assert (=> b!710211 (= e!399626 e!399627)))

(declare-fun res!473659 () Bool)

(assert (=> b!710211 (=> res!473659 e!399627)))

(assert (=> b!710211 (= res!473659 (= (h!14423 lt!318269) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710212 () Bool)

(assert (=> b!710212 (= e!399627 (contains!3959 (t!19679 lt!318269) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97319 res!473660) b!710211))

(assert (= (and b!710211 (not res!473659)) b!710212))

(assert (=> d!97319 m!667395))

(declare-fun m!667401 () Bool)

(assert (=> d!97319 m!667401))

(declare-fun m!667403 () Bool)

(assert (=> b!710212 m!667403))

(assert (=> b!709871 d!97319))

(declare-fun d!97321 () Bool)

(declare-fun res!473675 () Bool)

(declare-fun e!399642 () Bool)

(assert (=> d!97321 (=> res!473675 e!399642)))

(assert (=> d!97321 (= res!473675 (= (select (arr!19341 a!3591) from!2969) k!2824))))

(assert (=> d!97321 (= (arrayContainsKey!0 a!3591 k!2824 from!2969) e!399642)))

(declare-fun b!710227 () Bool)

(declare-fun e!399643 () Bool)

(assert (=> b!710227 (= e!399642 e!399643)))

(declare-fun res!473676 () Bool)

(assert (=> b!710227 (=> (not res!473676) (not e!399643))))

(assert (=> b!710227 (= res!473676 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19737 a!3591)))))

(declare-fun b!710228 () Bool)

(assert (=> b!710228 (= e!399643 (arrayContainsKey!0 a!3591 k!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97321 (not res!473675)) b!710227))

(assert (= (and b!710227 res!473676) b!710228))

(assert (=> d!97321 m!667101))

(declare-fun m!667415 () Bool)

(assert (=> b!710228 m!667415))

(assert (=> b!709872 d!97321))

(declare-fun d!97331 () Bool)

(declare-fun lt!318310 () Bool)

(assert (=> d!97331 (= lt!318310 (set.member k!2824 (content!347 lt!318269)))))

(declare-fun e!399644 () Bool)

(assert (=> d!97331 (= lt!318310 e!399644)))

(declare-fun res!473678 () Bool)

(assert (=> d!97331 (=> (not res!473678) (not e!399644))))

(assert (=> d!97331 (= res!473678 (is-Cons!13378 lt!318269))))

(assert (=> d!97331 (= (contains!3959 lt!318269 k!2824) lt!318310)))

(declare-fun b!710229 () Bool)

(declare-fun e!399645 () Bool)

(assert (=> b!710229 (= e!399644 e!399645)))

(declare-fun res!473677 () Bool)

(assert (=> b!710229 (=> res!473677 e!399645)))

(assert (=> b!710229 (= res!473677 (= (h!14423 lt!318269) k!2824))))

(declare-fun b!710230 () Bool)

(assert (=> b!710230 (= e!399645 (contains!3959 (t!19679 lt!318269) k!2824))))

(assert (= (and d!97331 res!473678) b!710229))

(assert (= (and b!710229 (not res!473677)) b!710230))

(assert (=> d!97331 m!667395))

(declare-fun m!667417 () Bool)

(assert (=> d!97331 m!667417))

(declare-fun m!667419 () Bool)

(assert (=> b!710230 m!667419))

(assert (=> b!709861 d!97331))

(declare-fun b!710231 () Bool)

(declare-fun e!399646 () Bool)

(assert (=> b!710231 (= e!399646 (contains!3959 lt!318269 (select (arr!19341 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!710233 () Bool)

(declare-fun e!399647 () Bool)

(declare-fun call!34469 () Bool)

(assert (=> b!710233 (= e!399647 call!34469)))

(declare-fun c!78643 () Bool)

(declare-fun bm!34466 () Bool)

(assert (=> bm!34466 (= call!34469 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78643 (Cons!13378 (select (arr!19341 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318269) lt!318269)))))

(declare-fun b!710234 () Bool)

(declare-fun e!399648 () Bool)

(assert (=> b!710234 (= e!399648 e!399647)))

(assert (=> b!710234 (= c!78643 (validKeyInArray!0 (select (arr!19341 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!710235 () Bool)

(declare-fun e!399649 () Bool)

(assert (=> b!710235 (= e!399649 e!399648)))

(declare-fun res!473679 () Bool)

(assert (=> b!710235 (=> (not res!473679) (not e!399648))))

(assert (=> b!710235 (= res!473679 (not e!399646))))

(declare-fun res!473681 () Bool)

(assert (=> b!710235 (=> (not res!473681) (not e!399646))))

(assert (=> b!710235 (= res!473681 (validKeyInArray!0 (select (arr!19341 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun d!97333 () Bool)

(declare-fun res!473680 () Bool)

(assert (=> d!97333 (=> res!473680 e!399649)))

(assert (=> d!97333 (= res!473680 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19737 a!3591)))))

(assert (=> d!97333 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318269) e!399649)))

(declare-fun b!710232 () Bool)

(assert (=> b!710232 (= e!399647 call!34469)))

(assert (= (and d!97333 (not res!473680)) b!710235))

(assert (= (and b!710235 res!473681) b!710231))

(assert (= (and b!710235 res!473679) b!710234))

(assert (= (and b!710234 c!78643) b!710232))

(assert (= (and b!710234 (not c!78643)) b!710233))

(assert (= (or b!710232 b!710233) bm!34466))

(declare-fun m!667421 () Bool)

(assert (=> b!710231 m!667421))

(assert (=> b!710231 m!667421))

(declare-fun m!667423 () Bool)

(assert (=> b!710231 m!667423))

(assert (=> bm!34466 m!667421))

(declare-fun m!667425 () Bool)

(assert (=> bm!34466 m!667425))

(assert (=> b!710234 m!667421))

(assert (=> b!710234 m!667421))

(declare-fun m!667427 () Bool)

(assert (=> b!710234 m!667427))

(assert (=> b!710235 m!667421))

(assert (=> b!710235 m!667421))

(assert (=> b!710235 m!667427))

(assert (=> b!709870 d!97333))

(declare-fun d!97335 () Bool)

(declare-fun lt!318311 () Bool)

(assert (=> d!97335 (= lt!318311 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!347 acc!652)))))

(declare-fun e!399650 () Bool)

(assert (=> d!97335 (= lt!318311 e!399650)))

(declare-fun res!473683 () Bool)

(assert (=> d!97335 (=> (not res!473683) (not e!399650))))

(assert (=> d!97335 (= res!473683 (is-Cons!13378 acc!652))))

(assert (=> d!97335 (= (contains!3959 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318311)))

(declare-fun b!710236 () Bool)

(declare-fun e!399651 () Bool)

(assert (=> b!710236 (= e!399650 e!399651)))

(declare-fun res!473682 () Bool)

(assert (=> b!710236 (=> res!473682 e!399651)))

(assert (=> b!710236 (= res!473682 (= (h!14423 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710237 () Bool)

(assert (=> b!710237 (= e!399651 (contains!3959 (t!19679 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97335 res!473683) b!710236))

(assert (= (and b!710236 (not res!473682)) b!710237))

(declare-fun m!667429 () Bool)

(assert (=> d!97335 m!667429))

(declare-fun m!667431 () Bool)

(assert (=> d!97335 m!667431))

(declare-fun m!667433 () Bool)

(assert (=> b!710237 m!667433))

(assert (=> b!709860 d!97335))

(declare-fun d!97337 () Bool)

(assert (=> d!97337 (= (array_inv!15137 a!3591) (bvsge (size!19737 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62968 d!97337))

(declare-fun d!97339 () Bool)

(declare-fun res!473684 () Bool)

(declare-fun e!399652 () Bool)

(assert (=> d!97339 (=> res!473684 e!399652)))

(assert (=> d!97339 (= res!473684 (is-Nil!13379 lt!318269))))

(assert (=> d!97339 (= (noDuplicate!1206 lt!318269) e!399652)))

(declare-fun b!710238 () Bool)

(declare-fun e!399653 () Bool)

(assert (=> b!710238 (= e!399652 e!399653)))

(declare-fun res!473685 () Bool)

(assert (=> b!710238 (=> (not res!473685) (not e!399653))))

(assert (=> b!710238 (= res!473685 (not (contains!3959 (t!19679 lt!318269) (h!14423 lt!318269))))))

(declare-fun b!710239 () Bool)

(assert (=> b!710239 (= e!399653 (noDuplicate!1206 (t!19679 lt!318269)))))

(assert (= (and d!97339 (not res!473684)) b!710238))

(assert (= (and b!710238 res!473685) b!710239))

(declare-fun m!667435 () Bool)

(assert (=> b!710238 m!667435))

(declare-fun m!667437 () Bool)

(assert (=> b!710239 m!667437))

(assert (=> b!709881 d!97339))

(declare-fun d!97341 () Bool)

(assert (=> d!97341 (= ($colon$colon!515 acc!652 (select (arr!19341 a!3591) from!2969)) (Cons!13378 (select (arr!19341 a!3591) from!2969) acc!652))))

(assert (=> b!709879 d!97341))

(declare-fun d!97343 () Bool)

(declare-fun res!473704 () Bool)

(declare-fun e!399678 () Bool)

(assert (=> d!97343 (=> res!473704 e!399678)))

(assert (=> d!97343 (= res!473704 (is-Nil!13379 acc!652))))

(assert (=> d!97343 (= (subseq!404 acc!652 newAcc!49) e!399678)))

(declare-fun b!710272 () Bool)

(declare-fun e!399680 () Bool)

(assert (=> b!710272 (= e!399680 (subseq!404 (t!19679 acc!652) (t!19679 newAcc!49)))))

(declare-fun b!710271 () Bool)

(declare-fun e!399681 () Bool)

(declare-fun e!399679 () Bool)

(assert (=> b!710271 (= e!399681 e!399679)))

(declare-fun res!473703 () Bool)

(assert (=> b!710271 (=> res!473703 e!399679)))

(assert (=> b!710271 (= res!473703 e!399680)))

(declare-fun res!473705 () Bool)

(assert (=> b!710271 (=> (not res!473705) (not e!399680))))

(assert (=> b!710271 (= res!473705 (= (h!14423 acc!652) (h!14423 newAcc!49)))))

(declare-fun b!710270 () Bool)

(assert (=> b!710270 (= e!399678 e!399681)))

(declare-fun res!473702 () Bool)

(assert (=> b!710270 (=> (not res!473702) (not e!399681))))

(assert (=> b!710270 (= res!473702 (is-Cons!13378 newAcc!49))))

(declare-fun b!710273 () Bool)

(assert (=> b!710273 (= e!399679 (subseq!404 acc!652 (t!19679 newAcc!49)))))

(assert (= (and d!97343 (not res!473704)) b!710270))

(assert (= (and b!710270 res!473702) b!710271))

(assert (= (and b!710271 res!473705) b!710272))

(assert (= (and b!710271 (not res!473703)) b!710273))

(declare-fun m!667457 () Bool)

(assert (=> b!710272 m!667457))

(declare-fun m!667460 () Bool)

(assert (=> b!710273 m!667460))

(assert (=> b!709880 d!97343))

(declare-fun d!97349 () Bool)

(declare-fun res!473706 () Bool)

(declare-fun e!399682 () Bool)

(assert (=> d!97349 (=> res!473706 e!399682)))

(assert (=> d!97349 (= res!473706 (= (select (arr!19341 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k!2824))))

(assert (=> d!97349 (= (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!399682)))

(declare-fun b!710274 () Bool)

(declare-fun e!399683 () Bool)

(assert (=> b!710274 (= e!399682 e!399683)))

(declare-fun res!473707 () Bool)

(assert (=> b!710274 (=> (not res!473707) (not e!399683))))

(assert (=> b!710274 (= res!473707 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19737 a!3591)))))

(declare-fun b!710275 () Bool)

(assert (=> b!710275 (= e!399683 (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97349 (not res!473706)) b!710274))

(assert (= (and b!710274 res!473707) b!710275))

(assert (=> d!97349 m!667421))

(declare-fun m!667463 () Bool)

(assert (=> b!710275 m!667463))

(assert (=> b!709869 d!97349))

(declare-fun d!97353 () Bool)

(declare-fun lt!318315 () Bool)

(assert (=> d!97353 (= lt!318315 (set.member k!2824 (content!347 acc!652)))))

(declare-fun e!399686 () Bool)

(assert (=> d!97353 (= lt!318315 e!399686)))

(declare-fun res!473711 () Bool)

(assert (=> d!97353 (=> (not res!473711) (not e!399686))))

(assert (=> d!97353 (= res!473711 (is-Cons!13378 acc!652))))

(assert (=> d!97353 (= (contains!3959 acc!652 k!2824) lt!318315)))

(declare-fun b!710278 () Bool)

(declare-fun e!399687 () Bool)

(assert (=> b!710278 (= e!399686 e!399687)))

(declare-fun res!473710 () Bool)

(assert (=> b!710278 (=> res!473710 e!399687)))

(assert (=> b!710278 (= res!473710 (= (h!14423 acc!652) k!2824))))

(declare-fun b!710279 () Bool)

(assert (=> b!710279 (= e!399687 (contains!3959 (t!19679 acc!652) k!2824))))

(assert (= (and d!97353 res!473711) b!710278))

(assert (= (and b!710278 (not res!473710)) b!710279))

(assert (=> d!97353 m!667429))

(declare-fun m!667469 () Bool)

(assert (=> d!97353 m!667469))

(declare-fun m!667471 () Bool)

(assert (=> b!710279 m!667471))

(assert (=> b!709878 d!97353))

(declare-fun d!97357 () Bool)

(declare-fun lt!318316 () Bool)

