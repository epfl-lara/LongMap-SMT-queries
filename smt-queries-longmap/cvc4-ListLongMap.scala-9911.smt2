; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117214 () Bool)

(assert start!117214)

(declare-fun b!1379285 () Bool)

(declare-fun e!781344 () Bool)

(declare-fun e!781345 () Bool)

(assert (=> b!1379285 (= e!781344 e!781345)))

(declare-fun res!921822 () Bool)

(assert (=> b!1379285 (=> (not res!921822) (not e!781345))))

(declare-fun lt!607352 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!607355 () (_ BitVec 32))

(assert (=> b!1379285 (= res!921822 (and (= lt!607355 (bvsub lt!607352 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!93831 0))(
  ( (array!93832 (arr!45316 (Array (_ BitVec 32) (_ BitVec 64))) (size!45866 (_ BitVec 32))) )
))
(declare-fun lt!607356 () array!93831)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93831 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379285 (= lt!607355 (arrayCountValidKeys!0 lt!607356 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun a!4094 () array!93831)

(assert (=> b!1379285 (= lt!607352 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1379285 (= lt!607356 (array!93832 (store (arr!45316 a!4094) i!1451 k!2953) (size!45866 a!4094)))))

(declare-fun b!1379286 () Bool)

(declare-fun res!921820 () Bool)

(assert (=> b!1379286 (=> (not res!921820) (not e!781344))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379286 (= res!921820 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379287 () Bool)

(declare-fun lt!607351 () (_ BitVec 32))

(declare-fun lt!607353 () (_ BitVec 32))

(assert (=> b!1379287 (= e!781345 (not (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45866 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (= lt!607351 (bvsub lt!607353 #b00000000000000000000000000000001)))))))

(declare-fun lt!607354 () (_ BitVec 32))

(assert (=> b!1379287 (= (bvadd lt!607354 lt!607355) lt!607351)))

(assert (=> b!1379287 (= lt!607351 (arrayCountValidKeys!0 lt!607356 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379287 (= lt!607354 (arrayCountValidKeys!0 lt!607356 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45859 0))(
  ( (Unit!45860) )
))
(declare-fun lt!607350 () Unit!45859)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93831 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45859)

(assert (=> b!1379287 (= lt!607350 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607356 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607348 () (_ BitVec 32))

(assert (=> b!1379287 (= (bvadd lt!607348 lt!607352) lt!607353)))

(assert (=> b!1379287 (= lt!607353 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379287 (= lt!607348 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607349 () Unit!45859)

(assert (=> b!1379287 (= lt!607349 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun res!921819 () Bool)

(assert (=> start!117214 (=> (not res!921819) (not e!781344))))

(assert (=> start!117214 (= res!921819 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45866 a!4094))))))

(assert (=> start!117214 e!781344))

(assert (=> start!117214 true))

(declare-fun array_inv!34344 (array!93831) Bool)

(assert (=> start!117214 (array_inv!34344 a!4094)))

(declare-fun b!1379288 () Bool)

(declare-fun res!921823 () Bool)

(assert (=> b!1379288 (=> (not res!921823) (not e!781344))))

(assert (=> b!1379288 (= res!921823 (validKeyInArray!0 (select (arr!45316 a!4094) i!1451)))))

(declare-fun b!1379289 () Bool)

(declare-fun res!921821 () Bool)

(assert (=> b!1379289 (=> (not res!921821) (not e!781344))))

(assert (=> b!1379289 (= res!921821 (and (bvslt (size!45866 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45866 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117214 res!921819) b!1379288))

(assert (= (and b!1379288 res!921823) b!1379286))

(assert (= (and b!1379286 res!921820) b!1379289))

(assert (= (and b!1379289 res!921821) b!1379285))

(assert (= (and b!1379285 res!921822) b!1379287))

(declare-fun m!1264309 () Bool)

(assert (=> b!1379288 m!1264309))

(assert (=> b!1379288 m!1264309))

(declare-fun m!1264311 () Bool)

(assert (=> b!1379288 m!1264311))

(declare-fun m!1264313 () Bool)

(assert (=> b!1379285 m!1264313))

(declare-fun m!1264315 () Bool)

(assert (=> b!1379285 m!1264315))

(declare-fun m!1264317 () Bool)

(assert (=> b!1379285 m!1264317))

(declare-fun m!1264319 () Bool)

(assert (=> b!1379287 m!1264319))

(declare-fun m!1264321 () Bool)

(assert (=> b!1379287 m!1264321))

(declare-fun m!1264323 () Bool)

(assert (=> b!1379287 m!1264323))

(declare-fun m!1264325 () Bool)

(assert (=> b!1379287 m!1264325))

(declare-fun m!1264327 () Bool)

(assert (=> b!1379287 m!1264327))

(declare-fun m!1264329 () Bool)

(assert (=> b!1379287 m!1264329))

(declare-fun m!1264331 () Bool)

(assert (=> start!117214 m!1264331))

(declare-fun m!1264333 () Bool)

(assert (=> b!1379286 m!1264333))

(push 1)

(assert (not b!1379287))

(assert (not b!1379288))

(assert (not start!117214))

(assert (not b!1379286))

(assert (not b!1379285))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148547 () Bool)

(declare-fun lt!607379 () (_ BitVec 32))

(assert (=> d!148547 (and (bvsge lt!607379 #b00000000000000000000000000000000) (bvsle lt!607379 (bvsub (size!45866 lt!607356) from!3466)))))

(declare-fun e!781380 () (_ BitVec 32))

(assert (=> d!148547 (= lt!607379 e!781380)))

(declare-fun c!128206 () Bool)

(assert (=> d!148547 (= c!128206 (bvsge from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!148547 (and (bvsle from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45866 lt!607356)))))

(assert (=> d!148547 (= (arrayCountValidKeys!0 lt!607356 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) lt!607379)))

(declare-fun call!66078 () (_ BitVec 32))

(declare-fun bm!66075 () Bool)

(assert (=> bm!66075 (= call!66078 (arrayCountValidKeys!0 lt!607356 (bvadd from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1379354 () Bool)

(declare-fun e!781379 () (_ BitVec 32))

(assert (=> b!1379354 (= e!781379 call!66078)))

(declare-fun b!1379355 () Bool)

(assert (=> b!1379355 (= e!781379 (bvadd #b00000000000000000000000000000001 call!66078))))

(declare-fun b!1379356 () Bool)

(assert (=> b!1379356 (= e!781380 e!781379)))

(declare-fun c!128205 () Bool)

(assert (=> b!1379356 (= c!128205 (validKeyInArray!0 (select (arr!45316 lt!607356) from!3466)))))

(declare-fun b!1379357 () Bool)

(assert (=> b!1379357 (= e!781380 #b00000000000000000000000000000000)))

(assert (= (and d!148547 c!128206) b!1379357))

(assert (= (and d!148547 (not c!128206)) b!1379356))

(assert (= (and b!1379356 c!128205) b!1379355))

(assert (= (and b!1379356 (not c!128205)) b!1379354))

(assert (= (or b!1379355 b!1379354) bm!66075))

(declare-fun m!1264383 () Bool)

(assert (=> bm!66075 m!1264383))

(declare-fun m!1264385 () Bool)

(assert (=> b!1379356 m!1264385))

(assert (=> b!1379356 m!1264385))

(declare-fun m!1264387 () Bool)

(assert (=> b!1379356 m!1264387))

(assert (=> b!1379285 d!148547))

(declare-fun d!148557 () Bool)

(declare-fun lt!607381 () (_ BitVec 32))

(assert (=> d!148557 (and (bvsge lt!607381 #b00000000000000000000000000000000) (bvsle lt!607381 (bvsub (size!45866 a!4094) from!3466)))))

(declare-fun e!781382 () (_ BitVec 32))

(assert (=> d!148557 (= lt!607381 e!781382)))

(declare-fun c!128208 () Bool)

(assert (=> d!148557 (= c!128208 (bvsge from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!148557 (and (bvsle from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45866 a!4094)))))

(assert (=> d!148557 (= (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) lt!607381)))

(declare-fun bm!66076 () Bool)

(declare-fun call!66079 () (_ BitVec 32))

(assert (=> bm!66076 (= call!66079 (arrayCountValidKeys!0 a!4094 (bvadd from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1379358 () Bool)

(declare-fun e!781381 () (_ BitVec 32))

(assert (=> b!1379358 (= e!781381 call!66079)))

(declare-fun b!1379359 () Bool)

(assert (=> b!1379359 (= e!781381 (bvadd #b00000000000000000000000000000001 call!66079))))

(declare-fun b!1379360 () Bool)

(assert (=> b!1379360 (= e!781382 e!781381)))

(declare-fun c!128207 () Bool)

(assert (=> b!1379360 (= c!128207 (validKeyInArray!0 (select (arr!45316 a!4094) from!3466)))))

(declare-fun b!1379361 () Bool)

(assert (=> b!1379361 (= e!781382 #b00000000000000000000000000000000)))

(assert (= (and d!148557 c!128208) b!1379361))

(assert (= (and d!148557 (not c!128208)) b!1379360))

(assert (= (and b!1379360 c!128207) b!1379359))

(assert (= (and b!1379360 (not c!128207)) b!1379358))

(assert (= (or b!1379359 b!1379358) bm!66076))

(declare-fun m!1264391 () Bool)

(assert (=> bm!66076 m!1264391))

(declare-fun m!1264393 () Bool)

(assert (=> b!1379360 m!1264393))

(assert (=> b!1379360 m!1264393))

(declare-fun m!1264395 () Bool)

(assert (=> b!1379360 m!1264395))

(assert (=> b!1379285 d!148557))

(declare-fun d!148561 () Bool)

(assert (=> d!148561 (= (array_inv!34344 a!4094) (bvsge (size!45866 a!4094) #b00000000000000000000000000000000))))

(assert (=> start!117214 d!148561))

(declare-fun d!148565 () Bool)

(declare-fun lt!607384 () (_ BitVec 32))

(assert (=> d!148565 (and (bvsge lt!607384 #b00000000000000000000000000000000) (bvsle lt!607384 (bvsub (size!45866 a!4094) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun e!781386 () (_ BitVec 32))

(assert (=> d!148565 (= lt!607384 e!781386)))

(declare-fun c!128212 () Bool)

(assert (=> d!148565 (= c!128212 (bvsge (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!148565 (and (bvsle (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45866 a!4094)))))

(assert (=> d!148565 (= (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)) lt!607384)))

(declare-fun call!66081 () (_ BitVec 32))

(declare-fun bm!66078 () Bool)

(assert (=> bm!66078 (= call!66081 (arrayCountValidKeys!0 a!4094 (bvadd (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1379366 () Bool)

(declare-fun e!781385 () (_ BitVec 32))

(assert (=> b!1379366 (= e!781385 call!66081)))

(declare-fun b!1379367 () Bool)

(assert (=> b!1379367 (= e!781385 (bvadd #b00000000000000000000000000000001 call!66081))))

(declare-fun b!1379368 () Bool)

(assert (=> b!1379368 (= e!781386 e!781385)))

(declare-fun c!128211 () Bool)

(assert (=> b!1379368 (= c!128211 (validKeyInArray!0 (select (arr!45316 a!4094) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun b!1379369 () Bool)

(assert (=> b!1379369 (= e!781386 #b00000000000000000000000000000000)))

(assert (= (and d!148565 c!128212) b!1379369))

(assert (= (and d!148565 (not c!128212)) b!1379368))

(assert (= (and b!1379368 c!128211) b!1379367))

(assert (= (and b!1379368 (not c!128211)) b!1379366))

(assert (= (or b!1379367 b!1379366) bm!66078))

(declare-fun m!1264405 () Bool)

(assert (=> bm!66078 m!1264405))

(declare-fun m!1264407 () Bool)

(assert (=> b!1379368 m!1264407))

(assert (=> b!1379368 m!1264407))

(declare-fun m!1264409 () Bool)

(assert (=> b!1379368 m!1264409))

(assert (=> b!1379287 d!148565))

(declare-fun d!148569 () Bool)

(assert (=> d!148569 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451))) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607388 () Unit!45859)

(declare-fun choose!61 (array!93831 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45859)

(assert (=> d!148569 (= lt!607388 (choose!61 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> d!148569 (and (bvslt (size!45866 a!4094) #b01111111111111111111111111111111) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1451) (bvsub from!3466 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45866 a!4094)) (bvsge from!3466 (bvsub from!3466 #b00000000000000000000000000000001)) (bvsle from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!148569 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466) lt!607388)))

(declare-fun bs!39729 () Bool)

(assert (= bs!39729 d!148569))

(assert (=> bs!39729 m!1264321))

(assert (=> bs!39729 m!1264315))

(assert (=> bs!39729 m!1264325))

(declare-fun m!1264417 () Bool)

(assert (=> bs!39729 m!1264417))

(assert (=> b!1379287 d!148569))

(declare-fun d!148577 () Bool)

(declare-fun lt!607389 () (_ BitVec 32))

(assert (=> d!148577 (and (bvsge lt!607389 #b00000000000000000000000000000000) (bvsle lt!607389 (bvsub (size!45866 lt!607356) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun e!781390 () (_ BitVec 32))

(assert (=> d!148577 (= lt!607389 e!781390)))

(declare-fun c!128216 () Bool)

(assert (=> d!148577 (= c!128216 (bvsge (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(assert (=> d!148577 (and (bvsle (bvsub from!3466 #b00000000000000000000000000000001) from!3466) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle from!3466 (size!45866 lt!607356)))))

(assert (=> d!148577 (= (arrayCountValidKeys!0 lt!607356 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607389)))

(declare-fun bm!66080 () Bool)

(declare-fun call!66083 () (_ BitVec 32))

(assert (=> bm!66080 (= call!66083 (arrayCountValidKeys!0 lt!607356 (bvadd (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000001) from!3466))))

(declare-fun b!1379374 () Bool)

(declare-fun e!781389 () (_ BitVec 32))

(assert (=> b!1379374 (= e!781389 call!66083)))

(declare-fun b!1379375 () Bool)

(assert (=> b!1379375 (= e!781389 (bvadd #b00000000000000000000000000000001 call!66083))))

(declare-fun b!1379376 () Bool)

(assert (=> b!1379376 (= e!781390 e!781389)))

(declare-fun c!128215 () Bool)

(assert (=> b!1379376 (= c!128215 (validKeyInArray!0 (select (arr!45316 lt!607356) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun b!1379377 () Bool)

(assert (=> b!1379377 (= e!781390 #b00000000000000000000000000000000)))

(assert (= (and d!148577 c!128216) b!1379377))

(assert (= (and d!148577 (not c!128216)) b!1379376))

(assert (= (and b!1379376 c!128215) b!1379375))

(assert (= (and b!1379376 (not c!128215)) b!1379374))

(assert (= (or b!1379375 b!1379374) bm!66080))

(declare-fun m!1264419 () Bool)

(assert (=> bm!66080 m!1264419))

(declare-fun m!1264421 () Bool)

(assert (=> b!1379376 m!1264421))

(assert (=> b!1379376 m!1264421))

(declare-fun m!1264423 () Bool)

(assert (=> b!1379376 m!1264423))

(assert (=> b!1379287 d!148577))

(declare-fun d!148579 () Bool)

(assert (=> d!148579 (= (bvadd (arrayCountValidKeys!0 lt!607356 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) (arrayCountValidKeys!0 lt!607356 from!3466 (bvadd #b00000000000000000000000000000001 i!1451))) (arrayCountValidKeys!0 lt!607356 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607390 () Unit!45859)

(assert (=> d!148579 (= lt!607390 (choose!61 lt!607356 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> d!148579 (and (bvslt (size!45866 lt!607356) #b01111111111111111111111111111111) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1451) (bvsub from!3466 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45866 lt!607356)) (bvsge from!3466 (bvsub from!3466 #b00000000000000000000000000000001)) (bvsle from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!148579 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607356 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466) lt!607390)))

(declare-fun bs!39730 () Bool)

(assert (= bs!39730 d!148579))

(assert (=> bs!39730 m!1264319))

(assert (=> bs!39730 m!1264313))

(assert (=> bs!39730 m!1264323))

(declare-fun m!1264425 () Bool)

(assert (=> bs!39730 m!1264425))

(assert (=> b!1379287 d!148579))

(declare-fun d!148581 () Bool)

(declare-fun lt!607391 () (_ BitVec 32))

(assert (=> d!148581 (and (bvsge lt!607391 #b00000000000000000000000000000000) (bvsle lt!607391 (bvsub (size!45866 a!4094) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun e!781392 () (_ BitVec 32))

(assert (=> d!148581 (= lt!607391 e!781392)))

(declare-fun c!128218 () Bool)

(assert (=> d!148581 (= c!128218 (bvsge (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(assert (=> d!148581 (and (bvsle (bvsub from!3466 #b00000000000000000000000000000001) from!3466) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle from!3466 (size!45866 a!4094)))))

(assert (=> d!148581 (= (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607391)))

(declare-fun bm!66081 () Bool)

(declare-fun call!66084 () (_ BitVec 32))

(assert (=> bm!66081 (= call!66084 (arrayCountValidKeys!0 a!4094 (bvadd (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000001) from!3466))))

(declare-fun b!1379378 () Bool)

(declare-fun e!781391 () (_ BitVec 32))

(assert (=> b!1379378 (= e!781391 call!66084)))

(declare-fun b!1379379 () Bool)

(assert (=> b!1379379 (= e!781391 (bvadd #b00000000000000000000000000000001 call!66084))))

(declare-fun b!1379380 () Bool)

(assert (=> b!1379380 (= e!781392 e!781391)))

(declare-fun c!128217 () Bool)

(assert (=> b!1379380 (= c!128217 (validKeyInArray!0 (select (arr!45316 a!4094) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun b!1379381 () Bool)

(assert (=> b!1379381 (= e!781392 #b00000000000000000000000000000000)))

(assert (= (and d!148581 c!128218) b!1379381))

(assert (= (and d!148581 (not c!128218)) b!1379380))

(assert (= (and b!1379380 c!128217) b!1379379))

(assert (= (and b!1379380 (not c!128217)) b!1379378))

(assert (= (or b!1379379 b!1379378) bm!66081))

(declare-fun m!1264427 () Bool)

(assert (=> bm!66081 m!1264427))

(assert (=> b!1379380 m!1264407))

(assert (=> b!1379380 m!1264407))

(assert (=> b!1379380 m!1264409))

(assert (=> b!1379287 d!148581))

(declare-fun d!148583 () Bool)

(declare-fun lt!607392 () (_ BitVec 32))

(assert (=> d!148583 (and (bvsge lt!607392 #b00000000000000000000000000000000) (bvsle lt!607392 (bvsub (size!45866 lt!607356) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun e!781394 () (_ BitVec 32))

(assert (=> d!148583 (= lt!607392 e!781394)))

(declare-fun c!128220 () Bool)

(assert (=> d!148583 (= c!128220 (bvsge (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!148583 (and (bvsle (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45866 lt!607356)))))

(assert (=> d!148583 (= (arrayCountValidKeys!0 lt!607356 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)) lt!607392)))

(declare-fun call!66085 () (_ BitVec 32))

(declare-fun bm!66082 () Bool)

(assert (=> bm!66082 (= call!66085 (arrayCountValidKeys!0 lt!607356 (bvadd (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1379382 () Bool)

(declare-fun e!781393 () (_ BitVec 32))

(assert (=> b!1379382 (= e!781393 call!66085)))

(declare-fun b!1379383 () Bool)

(assert (=> b!1379383 (= e!781393 (bvadd #b00000000000000000000000000000001 call!66085))))

(declare-fun b!1379384 () Bool)

(assert (=> b!1379384 (= e!781394 e!781393)))

(declare-fun c!128219 () Bool)

(assert (=> b!1379384 (= c!128219 (validKeyInArray!0 (select (arr!45316 lt!607356) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun b!1379385 () Bool)

(assert (=> b!1379385 (= e!781394 #b00000000000000000000000000000000)))

(assert (= (and d!148583 c!128220) b!1379385))

(assert (= (and d!148583 (not c!128220)) b!1379384))

(assert (= (and b!1379384 c!128219) b!1379383))

(assert (= (and b!1379384 (not c!128219)) b!1379382))

(assert (= (or b!1379383 b!1379382) bm!66082))

(declare-fun m!1264429 () Bool)

(assert (=> bm!66082 m!1264429))

(assert (=> b!1379384 m!1264421))

(assert (=> b!1379384 m!1264421))

(assert (=> b!1379384 m!1264423))

(assert (=> b!1379287 d!148583))

(declare-fun d!148585 () Bool)

(assert (=> d!148585 (= (validKeyInArray!0 k!2953) (and (not (= k!2953 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2953 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1379286 d!148585))

(declare-fun d!148587 () Bool)

(assert (=> d!148587 (= (validKeyInArray!0 (select (arr!45316 a!4094) i!1451)) (and (not (= (select (arr!45316 a!4094) i!1451) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45316 a!4094) i!1451) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1379288 d!148587))

(push 1)

(assert (not bm!66081))

(assert (not b!1379360))

(assert (not d!148579))

(assert (not b!1379368))

(assert (not bm!66080))

(assert (not b!1379380))

(assert (not b!1379376))

(assert (not bm!66076))

(assert (not b!1379356))

(assert (not bm!66078))

(assert (not bm!66082))

(assert (not bm!66075))

(assert (not d!148569))

(assert (not b!1379384))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

