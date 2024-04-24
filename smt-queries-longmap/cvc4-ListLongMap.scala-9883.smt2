; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117246 () Bool)

(assert start!117246)

(declare-fun res!921084 () Bool)

(declare-fun e!781431 () Bool)

(assert (=> start!117246 (=> (not res!921084) (not e!781431))))

(declare-fun to!360 () (_ BitVec 32))

(declare-datatypes ((array!93774 0))(
  ( (array!93775 (arr!45284 (Array (_ BitVec 32) (_ BitVec 64))) (size!45835 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93774)

(declare-fun from!3564 () (_ BitVec 32))

(assert (=> start!117246 (= res!921084 (and (bvslt (size!45835 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45835 a!4197))))))

(assert (=> start!117246 e!781431))

(declare-fun array_inv!34565 (array!93774) Bool)

(assert (=> start!117246 (array_inv!34565 a!4197)))

(assert (=> start!117246 true))

(declare-fun b!1379241 () Bool)

(declare-fun res!921083 () Bool)

(assert (=> b!1379241 (=> (not res!921083) (not e!781431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379241 (= res!921083 (validKeyInArray!0 (select (arr!45284 a!4197) to!360)))))

(declare-fun b!1379242 () Bool)

(declare-fun res!921082 () Bool)

(assert (=> b!1379242 (=> (not res!921082) (not e!781431))))

(assert (=> b!1379242 (= res!921082 (and (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(declare-fun b!1379243 () Bool)

(declare-fun lt!606727 () (_ BitVec 32))

(declare-fun lt!606728 () (_ BitVec 32))

(assert (=> b!1379243 (= e!781431 (not (= lt!606727 (bvadd #b00000000000000000000000000000001 lt!606728))))))

(declare-fun lt!606729 () (_ BitVec 32))

(assert (=> b!1379243 (= (bvadd lt!606728 lt!606729) lt!606727)))

(declare-fun arrayCountValidKeys!0 (array!93774 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379243 (= lt!606727 (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> b!1379243 (= lt!606729 (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> b!1379243 (= lt!606728 (arrayCountValidKeys!0 a!4197 from!3564 to!360))))

(declare-datatypes ((Unit!45682 0))(
  ( (Unit!45683) )
))
(declare-fun lt!606730 () Unit!45682)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93774 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45682)

(assert (=> b!1379243 (= lt!606730 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (= (and start!117246 res!921084) b!1379241))

(assert (= (and b!1379241 res!921083) b!1379242))

(assert (= (and b!1379242 res!921082) b!1379243))

(declare-fun m!1264023 () Bool)

(assert (=> start!117246 m!1264023))

(declare-fun m!1264025 () Bool)

(assert (=> b!1379241 m!1264025))

(assert (=> b!1379241 m!1264025))

(declare-fun m!1264027 () Bool)

(assert (=> b!1379241 m!1264027))

(declare-fun m!1264029 () Bool)

(assert (=> b!1379243 m!1264029))

(declare-fun m!1264031 () Bool)

(assert (=> b!1379243 m!1264031))

(declare-fun m!1264033 () Bool)

(assert (=> b!1379243 m!1264033))

(declare-fun m!1264035 () Bool)

(assert (=> b!1379243 m!1264035))

(push 1)

(assert (not start!117246))

(assert (not b!1379243))

(assert (not b!1379241))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148863 () Bool)

(assert (=> d!148863 (= (array_inv!34565 a!4197) (bvsge (size!45835 a!4197) #b00000000000000000000000000000000))))

(assert (=> start!117246 d!148863))

(declare-fun d!148865 () Bool)

(declare-fun lt!606748 () (_ BitVec 32))

(assert (=> d!148865 (and (bvsge lt!606748 #b00000000000000000000000000000000) (bvsle lt!606748 (bvsub (size!45835 a!4197) from!3564)))))

(declare-fun e!781449 () (_ BitVec 32))

(assert (=> d!148865 (= lt!606748 e!781449)))

(declare-fun c!128537 () Bool)

(assert (=> d!148865 (= c!128537 (bvsge from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148865 (and (bvsle from!3564 (bvadd #b00000000000000000000000000000001 to!360)) (bvsge from!3564 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!360) (size!45835 a!4197)))))

(assert (=> d!148865 (= (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)) lt!606748)))

(declare-fun b!1379273 () Bool)

(declare-fun e!781448 () (_ BitVec 32))

(declare-fun call!66110 () (_ BitVec 32))

(assert (=> b!1379273 (= e!781448 call!66110)))

(declare-fun b!1379274 () Bool)

(assert (=> b!1379274 (= e!781449 e!781448)))

(declare-fun c!128538 () Bool)

(assert (=> b!1379274 (= c!128538 (validKeyInArray!0 (select (arr!45284 a!4197) from!3564)))))

(declare-fun b!1379275 () Bool)

(assert (=> b!1379275 (= e!781449 #b00000000000000000000000000000000)))

(declare-fun bm!66107 () Bool)

(assert (=> bm!66107 (= call!66110 (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-fun b!1379276 () Bool)

(assert (=> b!1379276 (= e!781448 (bvadd #b00000000000000000000000000000001 call!66110))))

(assert (= (and d!148865 c!128537) b!1379275))

(assert (= (and d!148865 (not c!128537)) b!1379274))

(assert (= (and b!1379274 c!128538) b!1379276))

(assert (= (and b!1379274 (not c!128538)) b!1379273))

(assert (= (or b!1379276 b!1379273) bm!66107))

(declare-fun m!1264051 () Bool)

(assert (=> b!1379274 m!1264051))

(assert (=> b!1379274 m!1264051))

(declare-fun m!1264053 () Bool)

(assert (=> b!1379274 m!1264053))

(declare-fun m!1264055 () Bool)

(assert (=> bm!66107 m!1264055))

(assert (=> b!1379243 d!148865))

(declare-fun d!148871 () Bool)

(declare-fun lt!606749 () (_ BitVec 32))

(assert (=> d!148871 (and (bvsge lt!606749 #b00000000000000000000000000000000) (bvsle lt!606749 (bvsub (size!45835 a!4197) to!360)))))

(declare-fun e!781451 () (_ BitVec 32))

(assert (=> d!148871 (= lt!606749 e!781451)))

(declare-fun c!128539 () Bool)

(assert (=> d!148871 (= c!128539 (bvsge to!360 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148871 (and (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360)) (bvsge to!360 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!360) (size!45835 a!4197)))))

(assert (=> d!148871 (= (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360)) lt!606749)))

(declare-fun b!1379277 () Bool)

(declare-fun e!781450 () (_ BitVec 32))

(declare-fun call!66111 () (_ BitVec 32))

(assert (=> b!1379277 (= e!781450 call!66111)))

(declare-fun b!1379278 () Bool)

(assert (=> b!1379278 (= e!781451 e!781450)))

(declare-fun c!128540 () Bool)

(assert (=> b!1379278 (= c!128540 (validKeyInArray!0 (select (arr!45284 a!4197) to!360)))))

(declare-fun b!1379279 () Bool)

(assert (=> b!1379279 (= e!781451 #b00000000000000000000000000000000)))

(declare-fun bm!66108 () Bool)

(assert (=> bm!66108 (= call!66111 (arrayCountValidKeys!0 a!4197 (bvadd to!360 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-fun b!1379280 () Bool)

(assert (=> b!1379280 (= e!781450 (bvadd #b00000000000000000000000000000001 call!66111))))

(assert (= (and d!148871 c!128539) b!1379279))

(assert (= (and d!148871 (not c!128539)) b!1379278))

(assert (= (and b!1379278 c!128540) b!1379280))

(assert (= (and b!1379278 (not c!128540)) b!1379277))

(assert (= (or b!1379280 b!1379277) bm!66108))

(assert (=> b!1379278 m!1264025))

(assert (=> b!1379278 m!1264025))

(assert (=> b!1379278 m!1264027))

(declare-fun m!1264063 () Bool)

(assert (=> bm!66108 m!1264063))

(assert (=> b!1379243 d!148871))

(declare-fun d!148875 () Bool)

(declare-fun lt!606751 () (_ BitVec 32))

(assert (=> d!148875 (and (bvsge lt!606751 #b00000000000000000000000000000000) (bvsle lt!606751 (bvsub (size!45835 a!4197) from!3564)))))

(declare-fun e!781455 () (_ BitVec 32))

(assert (=> d!148875 (= lt!606751 e!781455)))

(declare-fun c!128543 () Bool)

(assert (=> d!148875 (= c!128543 (bvsge from!3564 to!360))))

(assert (=> d!148875 (and (bvsle from!3564 to!360) (bvsge from!3564 #b00000000000000000000000000000000) (bvsle to!360 (size!45835 a!4197)))))

(assert (=> d!148875 (= (arrayCountValidKeys!0 a!4197 from!3564 to!360) lt!606751)))

(declare-fun b!1379285 () Bool)

(declare-fun e!781454 () (_ BitVec 32))

(declare-fun call!66113 () (_ BitVec 32))

(assert (=> b!1379285 (= e!781454 call!66113)))

(declare-fun b!1379286 () Bool)

(assert (=> b!1379286 (= e!781455 e!781454)))

(declare-fun c!128544 () Bool)

(assert (=> b!1379286 (= c!128544 (validKeyInArray!0 (select (arr!45284 a!4197) from!3564)))))

(declare-fun b!1379287 () Bool)

(assert (=> b!1379287 (= e!781455 #b00000000000000000000000000000000)))

(declare-fun bm!66110 () Bool)

(assert (=> bm!66110 (= call!66113 (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001) to!360))))

(declare-fun b!1379288 () Bool)

(assert (=> b!1379288 (= e!781454 (bvadd #b00000000000000000000000000000001 call!66113))))

(assert (= (and d!148875 c!128543) b!1379287))

(assert (= (and d!148875 (not c!128543)) b!1379286))

(assert (= (and b!1379286 c!128544) b!1379288))

(assert (= (and b!1379286 (not c!128544)) b!1379285))

(assert (= (or b!1379288 b!1379285) bm!66110))

(assert (=> b!1379286 m!1264051))

(assert (=> b!1379286 m!1264051))

(assert (=> b!1379286 m!1264053))

(declare-fun m!1264065 () Bool)

(assert (=> bm!66110 m!1264065))

(assert (=> b!1379243 d!148875))

(declare-fun d!148877 () Bool)

(assert (=> d!148877 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-fun lt!606757 () Unit!45682)

(declare-fun choose!61 (array!93774 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45682)

(assert (=> d!148877 (= lt!606757 (choose!61 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (=> d!148877 (and (bvslt (size!45835 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle (bvadd #b00000000000000000000000000000001 to!360) (size!45835 a!4197)) (bvsge to!360 from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148877 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360) lt!606757)))

(declare-fun bs!39652 () Bool)

(assert (= bs!39652 d!148877))

(assert (=> bs!39652 m!1264033))

(assert (=> bs!39652 m!1264031))

(assert (=> bs!39652 m!1264029))

(declare-fun m!1264071 () Bool)

(assert (=> bs!39652 m!1264071))

(assert (=> b!1379243 d!148877))

(declare-fun d!148883 () Bool)

(assert (=> d!148883 (= (validKeyInArray!0 (select (arr!45284 a!4197) to!360)) (and (not (= (select (arr!45284 a!4197) to!360) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45284 a!4197) to!360) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1379241 d!148883))

(push 1)

(assert (not b!1379278))

(assert (not bm!66107))

(assert (not bm!66108))

(assert (not d!148877))

(assert (not b!1379274))

(assert (not b!1379286))

(assert (not bm!66110))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148907 () Bool)

(declare-fun lt!606770 () (_ BitVec 32))

(assert (=> d!148907 (and (bvsge lt!606770 #b00000000000000000000000000000000) (bvsle lt!606770 (bvsub (size!45835 a!4197) (bvadd from!3564 #b00000000000000000000000000000001))))))

(declare-fun e!781475 () (_ BitVec 32))

(assert (=> d!148907 (= lt!606770 e!781475)))

(declare-fun c!128563 () Bool)

(assert (=> d!148907 (= c!128563 (bvsge (bvadd from!3564 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148907 (and (bvsle (bvadd from!3564 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)) (bvsge (bvadd from!3564 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!360) (size!45835 a!4197)))))

(assert (=> d!148907 (= (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)) lt!606770)))

(declare-fun b!1379325 () Bool)

(declare-fun e!781474 () (_ BitVec 32))

(declare-fun call!66123 () (_ BitVec 32))

(assert (=> b!1379325 (= e!781474 call!66123)))

(declare-fun b!1379326 () Bool)

(assert (=> b!1379326 (= e!781475 e!781474)))

(declare-fun c!128564 () Bool)

(assert (=> b!1379326 (= c!128564 (validKeyInArray!0 (select (arr!45284 a!4197) (bvadd from!3564 #b00000000000000000000000000000001))))))

(declare-fun b!1379327 () Bool)

(assert (=> b!1379327 (= e!781475 #b00000000000000000000000000000000)))

(declare-fun bm!66120 () Bool)

(assert (=> bm!66120 (= call!66123 (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-fun b!1379328 () Bool)

(assert (=> b!1379328 (= e!781474 (bvadd #b00000000000000000000000000000001 call!66123))))

(assert (= (and d!148907 c!128563) b!1379327))

(assert (= (and d!148907 (not c!128563)) b!1379326))

(assert (= (and b!1379326 c!128564) b!1379328))

(assert (= (and b!1379326 (not c!128564)) b!1379325))

(assert (= (or b!1379328 b!1379325) bm!66120))

(declare-fun m!1264101 () Bool)

(assert (=> b!1379326 m!1264101))

(assert (=> b!1379326 m!1264101))

(declare-fun m!1264103 () Bool)

(assert (=> b!1379326 m!1264103))

(declare-fun m!1264105 () Bool)

(assert (=> bm!66120 m!1264105))

(assert (=> bm!66107 d!148907))

(declare-fun d!148909 () Bool)

(declare-fun lt!606771 () (_ BitVec 32))

(assert (=> d!148909 (and (bvsge lt!606771 #b00000000000000000000000000000000) (bvsle lt!606771 (bvsub (size!45835 a!4197) (bvadd to!360 #b00000000000000000000000000000001))))))

(declare-fun e!781477 () (_ BitVec 32))

(assert (=> d!148909 (= lt!606771 e!781477)))

(declare-fun c!128565 () Bool)

(assert (=> d!148909 (= c!128565 (bvsge (bvadd to!360 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148909 (and (bvsle (bvadd to!360 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)) (bvsge (bvadd to!360 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!360) (size!45835 a!4197)))))

(assert (=> d!148909 (= (arrayCountValidKeys!0 a!4197 (bvadd to!360 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)) lt!606771)))

(declare-fun b!1379329 () Bool)

(declare-fun e!781476 () (_ BitVec 32))

(declare-fun call!66124 () (_ BitVec 32))

(assert (=> b!1379329 (= e!781476 call!66124)))

(declare-fun b!1379330 () Bool)

(assert (=> b!1379330 (= e!781477 e!781476)))

(declare-fun c!128566 () Bool)

(assert (=> b!1379330 (= c!128566 (validKeyInArray!0 (select (arr!45284 a!4197) (bvadd to!360 #b00000000000000000000000000000001))))))

(declare-fun b!1379331 () Bool)

(assert (=> b!1379331 (= e!781477 #b00000000000000000000000000000000)))

(declare-fun bm!66121 () Bool)

(assert (=> bm!66121 (= call!66124 (arrayCountValidKeys!0 a!4197 (bvadd to!360 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-fun b!1379332 () Bool)

(assert (=> b!1379332 (= e!781476 (bvadd #b00000000000000000000000000000001 call!66124))))

(assert (= (and d!148909 c!128565) b!1379331))

(assert (= (and d!148909 (not c!128565)) b!1379330))

(assert (= (and b!1379330 c!128566) b!1379332))

(assert (= (and b!1379330 (not c!128566)) b!1379329))

(assert (= (or b!1379332 b!1379329) bm!66121))

(declare-fun m!1264107 () Bool)

(assert (=> b!1379330 m!1264107))

(assert (=> b!1379330 m!1264107))

(declare-fun m!1264109 () Bool)

(assert (=> b!1379330 m!1264109))

(declare-fun m!1264111 () Bool)

(assert (=> bm!66121 m!1264111))

(assert (=> bm!66108 d!148909))

(declare-fun d!148911 () Bool)

(declare-fun lt!606772 () (_ BitVec 32))

(assert (=> d!148911 (and (bvsge lt!606772 #b00000000000000000000000000000000) (bvsle lt!606772 (bvsub (size!45835 a!4197) (bvadd from!3564 #b00000000000000000000000000000001))))))

(declare-fun e!781479 () (_ BitVec 32))

(assert (=> d!148911 (= lt!606772 e!781479)))

(declare-fun c!128567 () Bool)

(assert (=> d!148911 (= c!128567 (bvsge (bvadd from!3564 #b00000000000000000000000000000001) to!360))))

(assert (=> d!148911 (and (bvsle (bvadd from!3564 #b00000000000000000000000000000001) to!360) (bvsge (bvadd from!3564 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle to!360 (size!45835 a!4197)))))

(assert (=> d!148911 (= (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001) to!360) lt!606772)))

(declare-fun b!1379333 () Bool)

(declare-fun e!781478 () (_ BitVec 32))

(declare-fun call!66125 () (_ BitVec 32))

(assert (=> b!1379333 (= e!781478 call!66125)))

(declare-fun b!1379334 () Bool)

(assert (=> b!1379334 (= e!781479 e!781478)))

(declare-fun c!128568 () Bool)

(assert (=> b!1379334 (= c!128568 (validKeyInArray!0 (select (arr!45284 a!4197) (bvadd from!3564 #b00000000000000000000000000000001))))))

(declare-fun b!1379335 () Bool)

(assert (=> b!1379335 (= e!781479 #b00000000000000000000000000000000)))

(declare-fun bm!66122 () Bool)

(assert (=> bm!66122 (= call!66125 (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!360))))

(declare-fun b!1379336 () Bool)

(assert (=> b!1379336 (= e!781478 (bvadd #b00000000000000000000000000000001 call!66125))))

(assert (= (and d!148911 c!128567) b!1379335))

(assert (= (and d!148911 (not c!128567)) b!1379334))

(assert (= (and b!1379334 c!128568) b!1379336))

(assert (= (and b!1379334 (not c!128568)) b!1379333))

(assert (= (or b!1379336 b!1379333) bm!66122))

(assert (=> b!1379334 m!1264101))

(assert (=> b!1379334 m!1264101))

(assert (=> b!1379334 m!1264103))

(declare-fun m!1264113 () Bool)

(assert (=> bm!66122 m!1264113))

(assert (=> bm!66110 d!148911))

(assert (=> d!148877 d!148875))

(assert (=> d!148877 d!148871))

(assert (=> d!148877 d!148865))

(declare-fun d!148913 () Bool)

(assert (=> d!148913 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148913 true))

(declare-fun _$76!67 () Unit!45682)

(assert (=> d!148913 (= (choose!61 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360) _$76!67)))

(declare-fun bs!39656 () Bool)

(assert (= bs!39656 d!148913))

(assert (=> bs!39656 m!1264033))

(assert (=> bs!39656 m!1264031))

(assert (=> bs!39656 m!1264029))

(assert (=> d!148877 d!148913))

(declare-fun d!148915 () Bool)

(assert (=> d!148915 (= (validKeyInArray!0 (select (arr!45284 a!4197) from!3564)) (and (not (= (select (arr!45284 a!4197) from!3564) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45284 a!4197) from!3564) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1379274 d!148915))

(assert (=> b!1379278 d!148883))

(assert (=> b!1379286 d!148915))

(push 1)

(assert (not bm!66121))

(assert (not bm!66122))

(assert (not d!148913))

(assert (not b!1379326))

(assert (not b!1379334))

(assert (not b!1379330))

(assert (not bm!66120))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

