; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117016 () Bool)

(assert start!117016)

(declare-fun res!920561 () Bool)

(declare-fun e!780583 () Bool)

(assert (=> start!117016 (=> (not res!920561) (not e!780583))))

(declare-fun to!360 () (_ BitVec 32))

(declare-datatypes ((array!93658 0))(
  ( (array!93659 (arr!45231 (Array (_ BitVec 32) (_ BitVec 64))) (size!45781 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93658)

(declare-fun from!3564 () (_ BitVec 32))

(assert (=> start!117016 (= res!920561 (and (bvslt (size!45781 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45781 a!4197))))))

(assert (=> start!117016 e!780583))

(declare-fun array_inv!34259 (array!93658) Bool)

(assert (=> start!117016 (array_inv!34259 a!4197)))

(assert (=> start!117016 true))

(declare-fun b!1377935 () Bool)

(declare-fun res!920563 () Bool)

(assert (=> b!1377935 (=> (not res!920563) (not e!780583))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377935 (= res!920563 (validKeyInArray!0 (select (arr!45231 a!4197) to!360)))))

(declare-fun b!1377936 () Bool)

(declare-fun res!920562 () Bool)

(assert (=> b!1377936 (=> (not res!920562) (not e!780583))))

(assert (=> b!1377936 (= res!920562 (and (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(declare-fun b!1377937 () Bool)

(declare-fun lt!606247 () (_ BitVec 32))

(declare-fun lt!606249 () (_ BitVec 32))

(assert (=> b!1377937 (= e!780583 (not (= lt!606247 (bvadd #b00000000000000000000000000000001 lt!606249))))))

(declare-fun lt!606248 () (_ BitVec 32))

(assert (=> b!1377937 (= (bvadd lt!606249 lt!606248) lt!606247)))

(declare-fun arrayCountValidKeys!0 (array!93658 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377937 (= lt!606247 (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> b!1377937 (= lt!606248 (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> b!1377937 (= lt!606249 (arrayCountValidKeys!0 a!4197 from!3564 to!360))))

(declare-datatypes ((Unit!45743 0))(
  ( (Unit!45744) )
))
(declare-fun lt!606250 () Unit!45743)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93658 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45743)

(assert (=> b!1377937 (= lt!606250 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (= (and start!117016 res!920561) b!1377935))

(assert (= (and b!1377935 res!920563) b!1377936))

(assert (= (and b!1377936 res!920562) b!1377937))

(declare-fun m!1262395 () Bool)

(assert (=> start!117016 m!1262395))

(declare-fun m!1262397 () Bool)

(assert (=> b!1377935 m!1262397))

(assert (=> b!1377935 m!1262397))

(declare-fun m!1262399 () Bool)

(assert (=> b!1377935 m!1262399))

(declare-fun m!1262401 () Bool)

(assert (=> b!1377937 m!1262401))

(declare-fun m!1262403 () Bool)

(assert (=> b!1377937 m!1262403))

(declare-fun m!1262405 () Bool)

(assert (=> b!1377937 m!1262405))

(declare-fun m!1262407 () Bool)

(assert (=> b!1377937 m!1262407))

(check-sat (not start!117016) (not b!1377937) (not b!1377935))
(check-sat)
(get-model)

(declare-fun d!148407 () Bool)

(assert (=> d!148407 (= (array_inv!34259 a!4197) (bvsge (size!45781 a!4197) #b00000000000000000000000000000000))))

(assert (=> start!117016 d!148407))

(declare-fun b!1377956 () Bool)

(declare-fun e!780594 () (_ BitVec 32))

(declare-fun call!66041 () (_ BitVec 32))

(assert (=> b!1377956 (= e!780594 call!66041)))

(declare-fun bm!66038 () Bool)

(assert (=> bm!66038 (= call!66041 (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-fun d!148409 () Bool)

(declare-fun lt!606265 () (_ BitVec 32))

(assert (=> d!148409 (and (bvsge lt!606265 #b00000000000000000000000000000000) (bvsle lt!606265 (bvsub (size!45781 a!4197) from!3564)))))

(declare-fun e!780595 () (_ BitVec 32))

(assert (=> d!148409 (= lt!606265 e!780595)))

(declare-fun c!128132 () Bool)

(assert (=> d!148409 (= c!128132 (bvsge from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148409 (and (bvsle from!3564 (bvadd #b00000000000000000000000000000001 to!360)) (bvsge from!3564 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!360) (size!45781 a!4197)))))

(assert (=> d!148409 (= (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)) lt!606265)))

(declare-fun b!1377955 () Bool)

(assert (=> b!1377955 (= e!780594 (bvadd #b00000000000000000000000000000001 call!66041))))

(declare-fun b!1377957 () Bool)

(assert (=> b!1377957 (= e!780595 e!780594)))

(declare-fun c!128131 () Bool)

(assert (=> b!1377957 (= c!128131 (validKeyInArray!0 (select (arr!45231 a!4197) from!3564)))))

(declare-fun b!1377958 () Bool)

(assert (=> b!1377958 (= e!780595 #b00000000000000000000000000000000)))

(assert (= (and d!148409 c!128132) b!1377958))

(assert (= (and d!148409 (not c!128132)) b!1377957))

(assert (= (and b!1377957 c!128131) b!1377955))

(assert (= (and b!1377957 (not c!128131)) b!1377956))

(assert (= (or b!1377955 b!1377956) bm!66038))

(declare-fun m!1262423 () Bool)

(assert (=> bm!66038 m!1262423))

(declare-fun m!1262425 () Bool)

(assert (=> b!1377957 m!1262425))

(assert (=> b!1377957 m!1262425))

(declare-fun m!1262427 () Bool)

(assert (=> b!1377957 m!1262427))

(assert (=> b!1377937 d!148409))

(declare-fun b!1377960 () Bool)

(declare-fun e!780596 () (_ BitVec 32))

(declare-fun call!66042 () (_ BitVec 32))

(assert (=> b!1377960 (= e!780596 call!66042)))

(declare-fun bm!66039 () Bool)

(assert (=> bm!66039 (= call!66042 (arrayCountValidKeys!0 a!4197 (bvadd to!360 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-fun d!148413 () Bool)

(declare-fun lt!606266 () (_ BitVec 32))

(assert (=> d!148413 (and (bvsge lt!606266 #b00000000000000000000000000000000) (bvsle lt!606266 (bvsub (size!45781 a!4197) to!360)))))

(declare-fun e!780597 () (_ BitVec 32))

(assert (=> d!148413 (= lt!606266 e!780597)))

(declare-fun c!128134 () Bool)

(assert (=> d!148413 (= c!128134 (bvsge to!360 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148413 (and (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360)) (bvsge to!360 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!360) (size!45781 a!4197)))))

(assert (=> d!148413 (= (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360)) lt!606266)))

(declare-fun b!1377959 () Bool)

(assert (=> b!1377959 (= e!780596 (bvadd #b00000000000000000000000000000001 call!66042))))

(declare-fun b!1377961 () Bool)

(assert (=> b!1377961 (= e!780597 e!780596)))

(declare-fun c!128133 () Bool)

(assert (=> b!1377961 (= c!128133 (validKeyInArray!0 (select (arr!45231 a!4197) to!360)))))

(declare-fun b!1377962 () Bool)

(assert (=> b!1377962 (= e!780597 #b00000000000000000000000000000000)))

(assert (= (and d!148413 c!128134) b!1377962))

(assert (= (and d!148413 (not c!128134)) b!1377961))

(assert (= (and b!1377961 c!128133) b!1377959))

(assert (= (and b!1377961 (not c!128133)) b!1377960))

(assert (= (or b!1377959 b!1377960) bm!66039))

(declare-fun m!1262429 () Bool)

(assert (=> bm!66039 m!1262429))

(assert (=> b!1377961 m!1262397))

(assert (=> b!1377961 m!1262397))

(assert (=> b!1377961 m!1262399))

(assert (=> b!1377937 d!148413))

(declare-fun b!1377964 () Bool)

(declare-fun e!780598 () (_ BitVec 32))

(declare-fun call!66043 () (_ BitVec 32))

(assert (=> b!1377964 (= e!780598 call!66043)))

(declare-fun bm!66040 () Bool)

(assert (=> bm!66040 (= call!66043 (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001) to!360))))

(declare-fun d!148417 () Bool)

(declare-fun lt!606267 () (_ BitVec 32))

(assert (=> d!148417 (and (bvsge lt!606267 #b00000000000000000000000000000000) (bvsle lt!606267 (bvsub (size!45781 a!4197) from!3564)))))

(declare-fun e!780599 () (_ BitVec 32))

(assert (=> d!148417 (= lt!606267 e!780599)))

(declare-fun c!128136 () Bool)

(assert (=> d!148417 (= c!128136 (bvsge from!3564 to!360))))

(assert (=> d!148417 (and (bvsle from!3564 to!360) (bvsge from!3564 #b00000000000000000000000000000000) (bvsle to!360 (size!45781 a!4197)))))

(assert (=> d!148417 (= (arrayCountValidKeys!0 a!4197 from!3564 to!360) lt!606267)))

(declare-fun b!1377963 () Bool)

(assert (=> b!1377963 (= e!780598 (bvadd #b00000000000000000000000000000001 call!66043))))

(declare-fun b!1377965 () Bool)

(assert (=> b!1377965 (= e!780599 e!780598)))

(declare-fun c!128135 () Bool)

(assert (=> b!1377965 (= c!128135 (validKeyInArray!0 (select (arr!45231 a!4197) from!3564)))))

(declare-fun b!1377966 () Bool)

(assert (=> b!1377966 (= e!780599 #b00000000000000000000000000000000)))

(assert (= (and d!148417 c!128136) b!1377966))

(assert (= (and d!148417 (not c!128136)) b!1377965))

(assert (= (and b!1377965 c!128135) b!1377963))

(assert (= (and b!1377965 (not c!128135)) b!1377964))

(assert (= (or b!1377963 b!1377964) bm!66040))

(declare-fun m!1262431 () Bool)

(assert (=> bm!66040 m!1262431))

(assert (=> b!1377965 m!1262425))

(assert (=> b!1377965 m!1262425))

(assert (=> b!1377965 m!1262427))

(assert (=> b!1377937 d!148417))

(declare-fun d!148419 () Bool)

(assert (=> d!148419 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-fun lt!606274 () Unit!45743)

(declare-fun choose!61 (array!93658 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45743)

(assert (=> d!148419 (= lt!606274 (choose!61 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (=> d!148419 (and (bvslt (size!45781 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle (bvadd #b00000000000000000000000000000001 to!360) (size!45781 a!4197)) (bvsge to!360 from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148419 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360) lt!606274)))

(declare-fun bs!39636 () Bool)

(assert (= bs!39636 d!148419))

(assert (=> bs!39636 m!1262405))

(assert (=> bs!39636 m!1262403))

(assert (=> bs!39636 m!1262401))

(declare-fun m!1262433 () Bool)

(assert (=> bs!39636 m!1262433))

(assert (=> b!1377937 d!148419))

(declare-fun d!148423 () Bool)

(assert (=> d!148423 (= (validKeyInArray!0 (select (arr!45231 a!4197) to!360)) (and (not (= (select (arr!45231 a!4197) to!360) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45231 a!4197) to!360) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1377935 d!148423))

(check-sat (not bm!66038) (not b!1377957) (not bm!66040) (not b!1377965) (not b!1377961) (not bm!66039) (not d!148419))
(check-sat)
(get-model)

(declare-fun b!1378008 () Bool)

(declare-fun e!780620 () (_ BitVec 32))

(declare-fun call!66054 () (_ BitVec 32))

(assert (=> b!1378008 (= e!780620 call!66054)))

(declare-fun bm!66051 () Bool)

(assert (=> bm!66051 (= call!66054 (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-fun d!148443 () Bool)

(declare-fun lt!606287 () (_ BitVec 32))

(assert (=> d!148443 (and (bvsge lt!606287 #b00000000000000000000000000000000) (bvsle lt!606287 (bvsub (size!45781 a!4197) (bvadd from!3564 #b00000000000000000000000000000001))))))

(declare-fun e!780621 () (_ BitVec 32))

(assert (=> d!148443 (= lt!606287 e!780621)))

(declare-fun c!128158 () Bool)

(assert (=> d!148443 (= c!128158 (bvsge (bvadd from!3564 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148443 (and (bvsle (bvadd from!3564 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)) (bvsge (bvadd from!3564 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!360) (size!45781 a!4197)))))

(assert (=> d!148443 (= (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)) lt!606287)))

(declare-fun b!1378007 () Bool)

(assert (=> b!1378007 (= e!780620 (bvadd #b00000000000000000000000000000001 call!66054))))

(declare-fun b!1378009 () Bool)

(assert (=> b!1378009 (= e!780621 e!780620)))

(declare-fun c!128157 () Bool)

(assert (=> b!1378009 (= c!128157 (validKeyInArray!0 (select (arr!45231 a!4197) (bvadd from!3564 #b00000000000000000000000000000001))))))

(declare-fun b!1378010 () Bool)

(assert (=> b!1378010 (= e!780621 #b00000000000000000000000000000000)))

(assert (= (and d!148443 c!128158) b!1378010))

(assert (= (and d!148443 (not c!128158)) b!1378009))

(assert (= (and b!1378009 c!128157) b!1378007))

(assert (= (and b!1378009 (not c!128157)) b!1378008))

(assert (= (or b!1378007 b!1378008) bm!66051))

(declare-fun m!1262459 () Bool)

(assert (=> bm!66051 m!1262459))

(declare-fun m!1262461 () Bool)

(assert (=> b!1378009 m!1262461))

(assert (=> b!1378009 m!1262461))

(declare-fun m!1262463 () Bool)

(assert (=> b!1378009 m!1262463))

(assert (=> bm!66038 d!148443))

(declare-fun d!148445 () Bool)

(assert (=> d!148445 (= (validKeyInArray!0 (select (arr!45231 a!4197) from!3564)) (and (not (= (select (arr!45231 a!4197) from!3564) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45231 a!4197) from!3564) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1377957 d!148445))

(assert (=> d!148419 d!148417))

(assert (=> d!148419 d!148413))

(assert (=> d!148419 d!148409))

(declare-fun d!148447 () Bool)

(assert (=> d!148447 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148447 true))

(declare-fun _$76!64 () Unit!45743)

(assert (=> d!148447 (= (choose!61 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360) _$76!64)))

(declare-fun bs!39639 () Bool)

(assert (= bs!39639 d!148447))

(assert (=> bs!39639 m!1262405))

(assert (=> bs!39639 m!1262403))

(assert (=> bs!39639 m!1262401))

(assert (=> d!148419 d!148447))

(assert (=> b!1377965 d!148445))

(declare-fun b!1378012 () Bool)

(declare-fun e!780622 () (_ BitVec 32))

(declare-fun call!66055 () (_ BitVec 32))

(assert (=> b!1378012 (= e!780622 call!66055)))

(declare-fun bm!66052 () Bool)

(assert (=> bm!66052 (= call!66055 (arrayCountValidKeys!0 a!4197 (bvadd to!360 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-fun d!148449 () Bool)

(declare-fun lt!606288 () (_ BitVec 32))

(assert (=> d!148449 (and (bvsge lt!606288 #b00000000000000000000000000000000) (bvsle lt!606288 (bvsub (size!45781 a!4197) (bvadd to!360 #b00000000000000000000000000000001))))))

(declare-fun e!780623 () (_ BitVec 32))

(assert (=> d!148449 (= lt!606288 e!780623)))

(declare-fun c!128160 () Bool)

(assert (=> d!148449 (= c!128160 (bvsge (bvadd to!360 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148449 (and (bvsle (bvadd to!360 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)) (bvsge (bvadd to!360 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!360) (size!45781 a!4197)))))

(assert (=> d!148449 (= (arrayCountValidKeys!0 a!4197 (bvadd to!360 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)) lt!606288)))

(declare-fun b!1378011 () Bool)

(assert (=> b!1378011 (= e!780622 (bvadd #b00000000000000000000000000000001 call!66055))))

(declare-fun b!1378013 () Bool)

(assert (=> b!1378013 (= e!780623 e!780622)))

(declare-fun c!128159 () Bool)

(assert (=> b!1378013 (= c!128159 (validKeyInArray!0 (select (arr!45231 a!4197) (bvadd to!360 #b00000000000000000000000000000001))))))

(declare-fun b!1378014 () Bool)

(assert (=> b!1378014 (= e!780623 #b00000000000000000000000000000000)))

(assert (= (and d!148449 c!128160) b!1378014))

(assert (= (and d!148449 (not c!128160)) b!1378013))

(assert (= (and b!1378013 c!128159) b!1378011))

(assert (= (and b!1378013 (not c!128159)) b!1378012))

(assert (= (or b!1378011 b!1378012) bm!66052))

(declare-fun m!1262465 () Bool)

(assert (=> bm!66052 m!1262465))

(declare-fun m!1262467 () Bool)

(assert (=> b!1378013 m!1262467))

(assert (=> b!1378013 m!1262467))

(declare-fun m!1262469 () Bool)

(assert (=> b!1378013 m!1262469))

(assert (=> bm!66039 d!148449))

(declare-fun b!1378016 () Bool)

(declare-fun e!780624 () (_ BitVec 32))

(declare-fun call!66056 () (_ BitVec 32))

(assert (=> b!1378016 (= e!780624 call!66056)))

(declare-fun bm!66053 () Bool)

(assert (=> bm!66053 (= call!66056 (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!360))))

(declare-fun d!148451 () Bool)

(declare-fun lt!606289 () (_ BitVec 32))

(assert (=> d!148451 (and (bvsge lt!606289 #b00000000000000000000000000000000) (bvsle lt!606289 (bvsub (size!45781 a!4197) (bvadd from!3564 #b00000000000000000000000000000001))))))

(declare-fun e!780625 () (_ BitVec 32))

(assert (=> d!148451 (= lt!606289 e!780625)))

(declare-fun c!128162 () Bool)

(assert (=> d!148451 (= c!128162 (bvsge (bvadd from!3564 #b00000000000000000000000000000001) to!360))))

(assert (=> d!148451 (and (bvsle (bvadd from!3564 #b00000000000000000000000000000001) to!360) (bvsge (bvadd from!3564 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle to!360 (size!45781 a!4197)))))

(assert (=> d!148451 (= (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001) to!360) lt!606289)))

(declare-fun b!1378015 () Bool)

(assert (=> b!1378015 (= e!780624 (bvadd #b00000000000000000000000000000001 call!66056))))

(declare-fun b!1378017 () Bool)

(assert (=> b!1378017 (= e!780625 e!780624)))

(declare-fun c!128161 () Bool)

(assert (=> b!1378017 (= c!128161 (validKeyInArray!0 (select (arr!45231 a!4197) (bvadd from!3564 #b00000000000000000000000000000001))))))

(declare-fun b!1378018 () Bool)

(assert (=> b!1378018 (= e!780625 #b00000000000000000000000000000000)))

(assert (= (and d!148451 c!128162) b!1378018))

(assert (= (and d!148451 (not c!128162)) b!1378017))

(assert (= (and b!1378017 c!128161) b!1378015))

(assert (= (and b!1378017 (not c!128161)) b!1378016))

(assert (= (or b!1378015 b!1378016) bm!66053))

(declare-fun m!1262471 () Bool)

(assert (=> bm!66053 m!1262471))

(assert (=> b!1378017 m!1262461))

(assert (=> b!1378017 m!1262461))

(assert (=> b!1378017 m!1262463))

(assert (=> bm!66040 d!148451))

(assert (=> b!1377961 d!148423))

(check-sat (not d!148447) (not bm!66053) (not bm!66052) (not bm!66051) (not b!1378013) (not b!1378017) (not b!1378009))
(check-sat)
