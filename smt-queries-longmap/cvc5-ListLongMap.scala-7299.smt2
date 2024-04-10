; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93252 () Bool)

(assert start!93252)

(declare-fun b!1057320 () Bool)

(declare-fun e!601282 () Bool)

(declare-fun e!601279 () Bool)

(assert (=> b!1057320 (= e!601282 e!601279)))

(declare-fun res!706024 () Bool)

(assert (=> b!1057320 (=> (not res!706024) (not e!601279))))

(declare-fun lt!466409 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057320 (= res!706024 (not (= lt!466409 i!1381)))))

(declare-datatypes ((array!66690 0))(
  ( (array!66691 (arr!32068 (Array (_ BitVec 32) (_ BitVec 64))) (size!32604 (_ BitVec 32))) )
))
(declare-fun lt!466412 () array!66690)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66690 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057320 (= lt!466409 (arrayScanForKey!0 lt!466412 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057321 () Bool)

(declare-fun e!601281 () Bool)

(declare-fun a!3488 () array!66690)

(declare-fun arrayContainsKey!0 (array!66690 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057321 (= e!601281 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1057322 () Bool)

(declare-fun res!706026 () Bool)

(declare-fun e!601283 () Bool)

(assert (=> b!1057322 (=> (not res!706026) (not e!601283))))

(assert (=> b!1057322 (= res!706026 (= (select (arr!32068 a!3488) i!1381) k!2747))))

(declare-fun res!706023 () Bool)

(assert (=> start!93252 (=> (not res!706023) (not e!601283))))

(assert (=> start!93252 (= res!706023 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32604 a!3488)) (bvslt (size!32604 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93252 e!601283))

(assert (=> start!93252 true))

(declare-fun array_inv!24848 (array!66690) Bool)

(assert (=> start!93252 (array_inv!24848 a!3488)))

(declare-fun b!1057323 () Bool)

(declare-fun e!601280 () Bool)

(assert (=> b!1057323 (= e!601280 e!601281)))

(declare-fun res!706020 () Bool)

(assert (=> b!1057323 (=> res!706020 e!601281)))

(assert (=> b!1057323 (= res!706020 (or (bvsgt lt!466409 i!1381) (bvsle i!1381 lt!466409)))))

(declare-fun b!1057324 () Bool)

(declare-fun res!706028 () Bool)

(assert (=> b!1057324 (=> (not res!706028) (not e!601283))))

(declare-datatypes ((List!22380 0))(
  ( (Nil!22377) (Cons!22376 (h!23585 (_ BitVec 64)) (t!31687 List!22380)) )
))
(declare-fun arrayNoDuplicates!0 (array!66690 (_ BitVec 32) List!22380) Bool)

(assert (=> b!1057324 (= res!706028 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22377))))

(declare-fun b!1057325 () Bool)

(declare-fun e!601285 () Bool)

(assert (=> b!1057325 (= e!601285 (bvsge lt!466409 #b00000000000000000000000000000000))))

(declare-fun lt!466410 () (_ BitVec 32))

(assert (=> b!1057325 (arrayContainsKey!0 a!3488 k!2747 lt!466410)))

(declare-datatypes ((Unit!34658 0))(
  ( (Unit!34659) )
))
(declare-fun lt!466411 () Unit!34658)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66690 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34658)

(assert (=> b!1057325 (= lt!466411 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466410))))

(assert (=> b!1057325 (= lt!466410 (bvadd #b00000000000000000000000000000001 lt!466409))))

(assert (=> b!1057325 (arrayNoDuplicates!0 a!3488 lt!466409 Nil!22377)))

(declare-fun lt!466413 () Unit!34658)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66690 (_ BitVec 32) (_ BitVec 32)) Unit!34658)

(assert (=> b!1057325 (= lt!466413 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466409))))

(declare-fun b!1057326 () Bool)

(assert (=> b!1057326 (= e!601283 e!601282)))

(declare-fun res!706025 () Bool)

(assert (=> b!1057326 (=> (not res!706025) (not e!601282))))

(assert (=> b!1057326 (= res!706025 (arrayContainsKey!0 lt!466412 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057326 (= lt!466412 (array!66691 (store (arr!32068 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32604 a!3488)))))

(declare-fun b!1057327 () Bool)

(declare-fun res!706021 () Bool)

(assert (=> b!1057327 (=> (not res!706021) (not e!601283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057327 (= res!706021 (validKeyInArray!0 k!2747))))

(declare-fun b!1057328 () Bool)

(assert (=> b!1057328 (= e!601279 (not e!601285))))

(declare-fun res!706022 () Bool)

(assert (=> b!1057328 (=> res!706022 e!601285)))

(assert (=> b!1057328 (= res!706022 (or (bvsgt lt!466409 i!1381) (bvsle i!1381 lt!466409)))))

(assert (=> b!1057328 e!601280))

(declare-fun res!706027 () Bool)

(assert (=> b!1057328 (=> (not res!706027) (not e!601280))))

(assert (=> b!1057328 (= res!706027 (= (select (store (arr!32068 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466409) k!2747))))

(assert (= (and start!93252 res!706023) b!1057324))

(assert (= (and b!1057324 res!706028) b!1057327))

(assert (= (and b!1057327 res!706021) b!1057322))

(assert (= (and b!1057322 res!706026) b!1057326))

(assert (= (and b!1057326 res!706025) b!1057320))

(assert (= (and b!1057320 res!706024) b!1057328))

(assert (= (and b!1057328 res!706027) b!1057323))

(assert (= (and b!1057323 (not res!706020)) b!1057321))

(assert (= (and b!1057328 (not res!706022)) b!1057325))

(declare-fun m!977021 () Bool)

(assert (=> b!1057326 m!977021))

(declare-fun m!977023 () Bool)

(assert (=> b!1057326 m!977023))

(assert (=> b!1057328 m!977023))

(declare-fun m!977025 () Bool)

(assert (=> b!1057328 m!977025))

(declare-fun m!977027 () Bool)

(assert (=> b!1057327 m!977027))

(declare-fun m!977029 () Bool)

(assert (=> b!1057322 m!977029))

(declare-fun m!977031 () Bool)

(assert (=> b!1057325 m!977031))

(declare-fun m!977033 () Bool)

(assert (=> b!1057325 m!977033))

(declare-fun m!977035 () Bool)

(assert (=> b!1057325 m!977035))

(declare-fun m!977037 () Bool)

(assert (=> b!1057325 m!977037))

(declare-fun m!977039 () Bool)

(assert (=> b!1057321 m!977039))

(declare-fun m!977041 () Bool)

(assert (=> b!1057320 m!977041))

(declare-fun m!977043 () Bool)

(assert (=> b!1057324 m!977043))

(declare-fun m!977045 () Bool)

(assert (=> start!93252 m!977045))

(push 1)

(assert (not b!1057320))

(assert (not b!1057325))

(assert (not b!1057327))

(assert (not b!1057324))

(assert (not b!1057321))

(assert (not b!1057326))

(assert (not start!93252))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!128391 () Bool)

(assert (=> d!128391 (= (array_inv!24848 a!3488) (bvsge (size!32604 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93252 d!128391))

(declare-fun d!128393 () Bool)

(declare-fun res!706096 () Bool)

(declare-fun e!601347 () Bool)

(assert (=> d!128393 (=> res!706096 e!601347)))

(assert (=> d!128393 (= res!706096 (= (select (arr!32068 a!3488) i!1381) k!2747))))

(assert (=> d!128393 (= (arrayContainsKey!0 a!3488 k!2747 i!1381) e!601347)))

(declare-fun b!1057408 () Bool)

(declare-fun e!601348 () Bool)

(assert (=> b!1057408 (= e!601347 e!601348)))

(declare-fun res!706097 () Bool)

(assert (=> b!1057408 (=> (not res!706097) (not e!601348))))

(assert (=> b!1057408 (= res!706097 (bvslt (bvadd i!1381 #b00000000000000000000000000000001) (size!32604 a!3488)))))

(declare-fun b!1057409 () Bool)

(assert (=> b!1057409 (= e!601348 (arrayContainsKey!0 a!3488 k!2747 (bvadd i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128393 (not res!706096)) b!1057408))

(assert (= (and b!1057408 res!706097) b!1057409))

(assert (=> d!128393 m!977029))

(declare-fun m!977113 () Bool)

(assert (=> b!1057409 m!977113))

(assert (=> b!1057321 d!128393))

(declare-fun d!128399 () Bool)

(assert (=> d!128399 (= (validKeyInArray!0 k!2747) (and (not (= k!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1057327 d!128399))

(declare-fun d!128403 () Bool)

(declare-fun res!706098 () Bool)

(declare-fun e!601349 () Bool)

(assert (=> d!128403 (=> res!706098 e!601349)))

(assert (=> d!128403 (= res!706098 (= (select (arr!32068 lt!466412) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128403 (= (arrayContainsKey!0 lt!466412 k!2747 #b00000000000000000000000000000000) e!601349)))

(declare-fun b!1057410 () Bool)

(declare-fun e!601350 () Bool)

(assert (=> b!1057410 (= e!601349 e!601350)))

(declare-fun res!706099 () Bool)

(assert (=> b!1057410 (=> (not res!706099) (not e!601350))))

(assert (=> b!1057410 (= res!706099 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32604 lt!466412)))))

(declare-fun b!1057411 () Bool)

(assert (=> b!1057411 (= e!601350 (arrayContainsKey!0 lt!466412 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128403 (not res!706098)) b!1057410))

(assert (= (and b!1057410 res!706099) b!1057411))

(declare-fun m!977115 () Bool)

(assert (=> d!128403 m!977115))

(declare-fun m!977117 () Bool)

(assert (=> b!1057411 m!977117))

(assert (=> b!1057326 d!128403))

(declare-fun d!128405 () Bool)

(declare-fun res!706100 () Bool)

(declare-fun e!601351 () Bool)

(assert (=> d!128405 (=> res!706100 e!601351)))

(assert (=> d!128405 (= res!706100 (= (select (arr!32068 a!3488) lt!466410) k!2747))))

(assert (=> d!128405 (= (arrayContainsKey!0 a!3488 k!2747 lt!466410) e!601351)))

(declare-fun b!1057412 () Bool)

(declare-fun e!601352 () Bool)

(assert (=> b!1057412 (= e!601351 e!601352)))

(declare-fun res!706101 () Bool)

(assert (=> b!1057412 (=> (not res!706101) (not e!601352))))

(assert (=> b!1057412 (= res!706101 (bvslt (bvadd lt!466410 #b00000000000000000000000000000001) (size!32604 a!3488)))))

(declare-fun b!1057413 () Bool)

(assert (=> b!1057413 (= e!601352 (arrayContainsKey!0 a!3488 k!2747 (bvadd lt!466410 #b00000000000000000000000000000001)))))

(assert (= (and d!128405 (not res!706100)) b!1057412))

(assert (= (and b!1057412 res!706101) b!1057413))

(declare-fun m!977119 () Bool)

(assert (=> d!128405 m!977119))

(declare-fun m!977121 () Bool)

(assert (=> b!1057413 m!977121))

(assert (=> b!1057325 d!128405))

(declare-fun d!128407 () Bool)

(assert (=> d!128407 (arrayContainsKey!0 a!3488 k!2747 lt!466410)))

(declare-fun lt!466449 () Unit!34658)

(declare-fun choose!114 (array!66690 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34658)

(assert (=> d!128407 (= lt!466449 (choose!114 a!3488 k!2747 i!1381 lt!466410))))

(assert (=> d!128407 (bvsge i!1381 #b00000000000000000000000000000000)))

(assert (=> d!128407 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466410) lt!466449)))

(declare-fun bs!31003 () Bool)

(assert (= bs!31003 d!128407))

(assert (=> bs!31003 m!977031))

(declare-fun m!977127 () Bool)

(assert (=> bs!31003 m!977127))

(assert (=> b!1057325 d!128407))

(declare-fun d!128413 () Bool)

(declare-fun res!706134 () Bool)

(declare-fun e!601388 () Bool)

(assert (=> d!128413 (=> res!706134 e!601388)))

(assert (=> d!128413 (= res!706134 (bvsge lt!466409 (size!32604 a!3488)))))

(assert (=> d!128413 (= (arrayNoDuplicates!0 a!3488 lt!466409 Nil!22377) e!601388)))

(declare-fun b!1057447 () Bool)

(declare-fun e!601387 () Bool)

(declare-fun e!601389 () Bool)

(assert (=> b!1057447 (= e!601387 e!601389)))

(declare-fun c!107119 () Bool)

(assert (=> b!1057447 (= c!107119 (validKeyInArray!0 (select (arr!32068 a!3488) lt!466409)))))

(declare-fun b!1057448 () Bool)

(declare-fun call!44843 () Bool)

(assert (=> b!1057448 (= e!601389 call!44843)))

(declare-fun b!1057449 () Bool)

(assert (=> b!1057449 (= e!601388 e!601387)))

(declare-fun res!706135 () Bool)

(assert (=> b!1057449 (=> (not res!706135) (not e!601387))))

(declare-fun e!601390 () Bool)

(assert (=> b!1057449 (= res!706135 (not e!601390))))

(declare-fun res!706133 () Bool)

(assert (=> b!1057449 (=> (not res!706133) (not e!601390))))

(assert (=> b!1057449 (= res!706133 (validKeyInArray!0 (select (arr!32068 a!3488) lt!466409)))))

(declare-fun bm!44840 () Bool)

(assert (=> bm!44840 (= call!44843 (arrayNoDuplicates!0 a!3488 (bvadd lt!466409 #b00000000000000000000000000000001) (ite c!107119 (Cons!22376 (select (arr!32068 a!3488) lt!466409) Nil!22377) Nil!22377)))))

(declare-fun b!1057450 () Bool)

(assert (=> b!1057450 (= e!601389 call!44843)))

(declare-fun b!1057453 () Bool)

(declare-fun contains!6199 (List!22380 (_ BitVec 64)) Bool)

(assert (=> b!1057453 (= e!601390 (contains!6199 Nil!22377 (select (arr!32068 a!3488) lt!466409)))))

(assert (= (and d!128413 (not res!706134)) b!1057449))

(assert (= (and b!1057449 res!706133) b!1057453))

(assert (= (and b!1057449 res!706135) b!1057447))

(assert (= (and b!1057447 c!107119) b!1057448))

(assert (= (and b!1057447 (not c!107119)) b!1057450))

(assert (= (or b!1057448 b!1057450) bm!44840))

(declare-fun m!977151 () Bool)

(assert (=> b!1057447 m!977151))

(assert (=> b!1057447 m!977151))

(declare-fun m!977153 () Bool)

(assert (=> b!1057447 m!977153))

(assert (=> b!1057449 m!977151))

(assert (=> b!1057449 m!977151))

(assert (=> b!1057449 m!977153))

(assert (=> bm!44840 m!977151))

(declare-fun m!977155 () Bool)

(assert (=> bm!44840 m!977155))

(assert (=> b!1057453 m!977151))

(assert (=> b!1057453 m!977151))

(declare-fun m!977157 () Bool)

(assert (=> b!1057453 m!977157))

(assert (=> b!1057325 d!128413))

(declare-fun d!128427 () Bool)

(assert (=> d!128427 (arrayNoDuplicates!0 a!3488 lt!466409 Nil!22377)))

(declare-fun lt!466461 () Unit!34658)

(declare-fun choose!39 (array!66690 (_ BitVec 32) (_ BitVec 32)) Unit!34658)

(assert (=> d!128427 (= lt!466461 (choose!39 a!3488 #b00000000000000000000000000000000 lt!466409))))

(assert (=> d!128427 (bvslt (size!32604 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128427 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466409) lt!466461)))

(declare-fun bs!31007 () Bool)

(assert (= bs!31007 d!128427))

(assert (=> bs!31007 m!977035))

(declare-fun m!977163 () Bool)

(assert (=> bs!31007 m!977163))

(assert (=> b!1057325 d!128427))

(declare-fun d!128429 () Bool)

(declare-fun lt!466467 () (_ BitVec 32))

(assert (=> d!128429 (and (or (bvslt lt!466467 #b00000000000000000000000000000000) (bvsge lt!466467 (size!32604 lt!466412)) (and (bvsge lt!466467 #b00000000000000000000000000000000) (bvslt lt!466467 (size!32604 lt!466412)))) (bvsge lt!466467 #b00000000000000000000000000000000) (bvslt lt!466467 (size!32604 lt!466412)) (= (select (arr!32068 lt!466412) lt!466467) k!2747))))

(declare-fun e!601399 () (_ BitVec 32))

(assert (=> d!128429 (= lt!466467 e!601399)))

(declare-fun c!107125 () Bool)

(assert (=> d!128429 (= c!107125 (= (select (arr!32068 lt!466412) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128429 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32604 lt!466412)) (bvslt (size!32604 lt!466412) #b01111111111111111111111111111111))))

