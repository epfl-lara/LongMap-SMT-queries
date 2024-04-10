; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92986 () Bool)

(assert start!92986)

(declare-fun b!1055334 () Bool)

(declare-fun e!599763 () Bool)

(declare-fun e!599760 () Bool)

(assert (=> b!1055334 (= e!599763 e!599760)))

(declare-fun res!704194 () Bool)

(assert (=> b!1055334 (=> (not res!704194) (not e!599760))))

(declare-datatypes ((array!66562 0))(
  ( (array!66563 (arr!32010 (Array (_ BitVec 32) (_ BitVec 64))) (size!32546 (_ BitVec 32))) )
))
(declare-fun lt!465736 () array!66562)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66562 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1055334 (= res!704194 (arrayContainsKey!0 lt!465736 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66562)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1055334 (= lt!465736 (array!66563 (store (arr!32010 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32546 a!3488)))))

(declare-fun b!1055335 () Bool)

(declare-fun e!599764 () Bool)

(declare-fun e!599759 () Bool)

(assert (=> b!1055335 (= e!599764 e!599759)))

(declare-fun res!704190 () Bool)

(assert (=> b!1055335 (=> res!704190 e!599759)))

(assert (=> b!1055335 (= res!704190 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32546 a!3488)))))

(assert (=> b!1055335 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34578 0))(
  ( (Unit!34579) )
))
(declare-fun lt!465735 () Unit!34578)

(declare-fun lt!465738 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66562 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34578)

(assert (=> b!1055335 (= lt!465735 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!465738 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-datatypes ((List!22322 0))(
  ( (Nil!22319) (Cons!22318 (h!23527 (_ BitVec 64)) (t!31629 List!22322)) )
))
(declare-fun arrayNoDuplicates!0 (array!66562 (_ BitVec 32) List!22322) Bool)

(assert (=> b!1055335 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22319)))

(declare-fun lt!465737 () Unit!34578)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66562 (_ BitVec 32) (_ BitVec 32)) Unit!34578)

(assert (=> b!1055335 (= lt!465737 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1055336 () Bool)

(declare-fun res!704192 () Bool)

(assert (=> b!1055336 (=> res!704192 e!599759)))

(declare-fun noDuplicate!1550 (List!22322) Bool)

(assert (=> b!1055336 (= res!704192 (not (noDuplicate!1550 Nil!22319)))))

(declare-fun b!1055337 () Bool)

(declare-fun res!704197 () Bool)

(assert (=> b!1055337 (=> (not res!704197) (not e!599763))))

(assert (=> b!1055337 (= res!704197 (= (select (arr!32010 a!3488) i!1381) k!2747))))

(declare-fun b!1055338 () Bool)

(declare-fun res!704199 () Bool)

(assert (=> b!1055338 (=> (not res!704199) (not e!599763))))

(assert (=> b!1055338 (= res!704199 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22319))))

(declare-fun b!1055339 () Bool)

(declare-fun e!599762 () Bool)

(assert (=> b!1055339 (= e!599760 e!599762)))

(declare-fun res!704195 () Bool)

(assert (=> b!1055339 (=> (not res!704195) (not e!599762))))

(assert (=> b!1055339 (= res!704195 (not (= lt!465738 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66562 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1055339 (= lt!465738 (arrayScanForKey!0 lt!465736 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1055340 () Bool)

(declare-fun res!704191 () Bool)

(assert (=> b!1055340 (=> (not res!704191) (not e!599763))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1055340 (= res!704191 (validKeyInArray!0 k!2747))))

(declare-fun res!704198 () Bool)

(assert (=> start!92986 (=> (not res!704198) (not e!599763))))

(assert (=> start!92986 (= res!704198 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32546 a!3488)) (bvslt (size!32546 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92986 e!599763))

(assert (=> start!92986 true))

(declare-fun array_inv!24790 (array!66562) Bool)

(assert (=> start!92986 (array_inv!24790 a!3488)))

(declare-fun b!1055341 () Bool)

(declare-fun e!599757 () Bool)

(assert (=> b!1055341 (= e!599759 e!599757)))

(declare-fun res!704193 () Bool)

(assert (=> b!1055341 (=> (not res!704193) (not e!599757))))

(declare-fun contains!6182 (List!22322 (_ BitVec 64)) Bool)

(assert (=> b!1055341 (= res!704193 (not (contains!6182 Nil!22319 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1055342 () Bool)

(assert (=> b!1055342 (= e!599757 (not (contains!6182 Nil!22319 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1055343 () Bool)

(declare-fun e!599761 () Bool)

(assert (=> b!1055343 (= e!599761 (arrayContainsKey!0 a!3488 k!2747 lt!465738))))

(declare-fun b!1055344 () Bool)

(declare-fun e!599756 () Bool)

(assert (=> b!1055344 (= e!599756 e!599761)))

(declare-fun res!704196 () Bool)

(assert (=> b!1055344 (=> res!704196 e!599761)))

(assert (=> b!1055344 (= res!704196 (bvsle lt!465738 i!1381))))

(declare-fun b!1055345 () Bool)

(assert (=> b!1055345 (= e!599762 (not e!599764))))

(declare-fun res!704201 () Bool)

(assert (=> b!1055345 (=> res!704201 e!599764)))

(assert (=> b!1055345 (= res!704201 (bvsle lt!465738 i!1381))))

(assert (=> b!1055345 e!599756))

(declare-fun res!704200 () Bool)

(assert (=> b!1055345 (=> (not res!704200) (not e!599756))))

(assert (=> b!1055345 (= res!704200 (= (select (store (arr!32010 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465738) k!2747))))

(assert (= (and start!92986 res!704198) b!1055338))

(assert (= (and b!1055338 res!704199) b!1055340))

(assert (= (and b!1055340 res!704191) b!1055337))

(assert (= (and b!1055337 res!704197) b!1055334))

(assert (= (and b!1055334 res!704194) b!1055339))

(assert (= (and b!1055339 res!704195) b!1055345))

(assert (= (and b!1055345 res!704200) b!1055344))

(assert (= (and b!1055344 (not res!704196)) b!1055343))

(assert (= (and b!1055345 (not res!704201)) b!1055335))

(assert (= (and b!1055335 (not res!704190)) b!1055336))

(assert (= (and b!1055336 (not res!704192)) b!1055341))

(assert (= (and b!1055341 res!704193) b!1055342))

(declare-fun m!975333 () Bool)

(assert (=> start!92986 m!975333))

(declare-fun m!975335 () Bool)

(assert (=> b!1055335 m!975335))

(declare-fun m!975337 () Bool)

(assert (=> b!1055335 m!975337))

(declare-fun m!975339 () Bool)

(assert (=> b!1055335 m!975339))

(declare-fun m!975341 () Bool)

(assert (=> b!1055335 m!975341))

(declare-fun m!975343 () Bool)

(assert (=> b!1055343 m!975343))

(declare-fun m!975345 () Bool)

(assert (=> b!1055337 m!975345))

(declare-fun m!975347 () Bool)

(assert (=> b!1055338 m!975347))

(declare-fun m!975349 () Bool)

(assert (=> b!1055345 m!975349))

(declare-fun m!975351 () Bool)

(assert (=> b!1055345 m!975351))

(declare-fun m!975353 () Bool)

(assert (=> b!1055334 m!975353))

(assert (=> b!1055334 m!975349))

(declare-fun m!975355 () Bool)

(assert (=> b!1055340 m!975355))

(declare-fun m!975357 () Bool)

(assert (=> b!1055341 m!975357))

(declare-fun m!975359 () Bool)

(assert (=> b!1055339 m!975359))

(declare-fun m!975361 () Bool)

(assert (=> b!1055336 m!975361))

(declare-fun m!975363 () Bool)

(assert (=> b!1055342 m!975363))

(push 1)

(assert (not b!1055338))

(assert (not b!1055334))

(assert (not start!92986))

(assert (not b!1055335))

(assert (not b!1055340))

(assert (not b!1055343))

(assert (not b!1055336))

(assert (not b!1055342))

(assert (not b!1055341))

(assert (not b!1055339))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1055425 () Bool)

(declare-fun e!599830 () Bool)

(declare-fun call!44804 () Bool)

(assert (=> b!1055425 (= e!599830 call!44804)))

(declare-fun b!1055426 () Bool)

(assert (=> b!1055426 (= e!599830 call!44804)))

(declare-fun b!1055427 () Bool)

(declare-fun e!599831 () Bool)

(declare-fun e!599833 () Bool)

(assert (=> b!1055427 (= e!599831 e!599833)))

(declare-fun res!704253 () Bool)

(assert (=> b!1055427 (=> (not res!704253) (not e!599833))))

(declare-fun e!599832 () Bool)

(assert (=> b!1055427 (= res!704253 (not e!599832))))

(declare-fun res!704254 () Bool)

(assert (=> b!1055427 (=> (not res!704254) (not e!599832))))

(assert (=> b!1055427 (= res!704254 (validKeyInArray!0 (select (arr!32010 a!3488) #b00000000000000000000000000000000)))))

(declare-fun bm!44801 () Bool)

(declare-fun c!107046 () Bool)

(assert (=> bm!44801 (= call!44804 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107046 (Cons!22318 (select (arr!32010 a!3488) #b00000000000000000000000000000000) Nil!22319) Nil!22319)))))

(declare-fun d!128173 () Bool)

(declare-fun res!704255 () Bool)

(assert (=> d!128173 (=> res!704255 e!599831)))

(assert (=> d!128173 (= res!704255 (bvsge #b00000000000000000000000000000000 (size!32546 a!3488)))))

(assert (=> d!128173 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22319) e!599831)))

(declare-fun b!1055428 () Bool)

(assert (=> b!1055428 (= e!599832 (contains!6182 Nil!22319 (select (arr!32010 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1055429 () Bool)

(assert (=> b!1055429 (= e!599833 e!599830)))

(assert (=> b!1055429 (= c!107046 (validKeyInArray!0 (select (arr!32010 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!128173 (not res!704255)) b!1055427))

(assert (= (and b!1055427 res!704254) b!1055428))

(assert (= (and b!1055427 res!704253) b!1055429))

(assert (= (and b!1055429 c!107046) b!1055425))

(assert (= (and b!1055429 (not c!107046)) b!1055426))

(assert (= (or b!1055425 b!1055426) bm!44801))

(declare-fun m!975417 () Bool)

(assert (=> b!1055427 m!975417))

(assert (=> b!1055427 m!975417))

(declare-fun m!975419 () Bool)

(assert (=> b!1055427 m!975419))

(assert (=> bm!44801 m!975417))

(declare-fun m!975427 () Bool)

(assert (=> bm!44801 m!975427))

(assert (=> b!1055428 m!975417))

(assert (=> b!1055428 m!975417))

(declare-fun m!975429 () Bool)

(assert (=> b!1055428 m!975429))

(assert (=> b!1055429 m!975417))

(assert (=> b!1055429 m!975417))

(assert (=> b!1055429 m!975419))

(assert (=> b!1055338 d!128173))

(declare-fun d!128183 () Bool)

(declare-fun res!704277 () Bool)

(declare-fun e!599857 () Bool)

(assert (=> d!128183 (=> res!704277 e!599857)))

(assert (=> d!128183 (= res!704277 (= (select (arr!32010 a!3488) lt!465738) k!2747))))

(assert (=> d!128183 (= (arrayContainsKey!0 a!3488 k!2747 lt!465738) e!599857)))

(declare-fun b!1055455 () Bool)

(declare-fun e!599858 () Bool)

(assert (=> b!1055455 (= e!599857 e!599858)))

(declare-fun res!704278 () Bool)

(assert (=> b!1055455 (=> (not res!704278) (not e!599858))))

(assert (=> b!1055455 (= res!704278 (bvslt (bvadd lt!465738 #b00000000000000000000000000000001) (size!32546 a!3488)))))

(declare-fun b!1055456 () Bool)

(assert (=> b!1055456 (= e!599858 (arrayContainsKey!0 a!3488 k!2747 (bvadd lt!465738 #b00000000000000000000000000000001)))))

(assert (= (and d!128183 (not res!704277)) b!1055455))

(assert (= (and b!1055455 res!704278) b!1055456))

(declare-fun m!975457 () Bool)

(assert (=> d!128183 m!975457))

(declare-fun m!975459 () Bool)

(assert (=> b!1055456 m!975459))

(assert (=> b!1055343 d!128183))

(declare-fun d!128197 () Bool)

(declare-fun res!704279 () Bool)

(declare-fun e!599859 () Bool)

(assert (=> d!128197 (=> res!704279 e!599859)))

(assert (=> d!128197 (= res!704279 (= (select (arr!32010 lt!465736) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128197 (= (arrayContainsKey!0 lt!465736 k!2747 #b00000000000000000000000000000000) e!599859)))

(declare-fun b!1055457 () Bool)

(declare-fun e!599860 () Bool)

(assert (=> b!1055457 (= e!599859 e!599860)))

(declare-fun res!704280 () Bool)

(assert (=> b!1055457 (=> (not res!704280) (not e!599860))))

(assert (=> b!1055457 (= res!704280 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32546 lt!465736)))))

(declare-fun b!1055458 () Bool)

(assert (=> b!1055458 (= e!599860 (arrayContainsKey!0 lt!465736 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128197 (not res!704279)) b!1055457))

(assert (= (and b!1055457 res!704280) b!1055458))

(declare-fun m!975461 () Bool)

(assert (=> d!128197 m!975461))

(declare-fun m!975463 () Bool)

(assert (=> b!1055458 m!975463))

(assert (=> b!1055334 d!128197))

(declare-fun d!128199 () Bool)

(declare-fun lt!465767 () (_ BitVec 32))

(assert (=> d!128199 (and (or (bvslt lt!465767 #b00000000000000000000000000000000) (bvsge lt!465767 (size!32546 lt!465736)) (and (bvsge lt!465767 #b00000000000000000000000000000000) (bvslt lt!465767 (size!32546 lt!465736)))) (bvsge lt!465767 #b00000000000000000000000000000000) (bvslt lt!465767 (size!32546 lt!465736)) (= (select (arr!32010 lt!465736) lt!465767) k!2747))))

(declare-fun e!599873 () (_ BitVec 32))

(assert (=> d!128199 (= lt!465767 e!599873)))

(declare-fun c!107051 () Bool)

(assert (=> d!128199 (= c!107051 (= (select (arr!32010 lt!465736) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128199 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32546 lt!465736)) (bvslt (size!32546 lt!465736) #b01111111111111111111111111111111))))

(assert (=> d!128199 (= (arrayScanForKey!0 lt!465736 k!2747 #b00000000000000000000000000000000) lt!465767)))

(declare-fun b!1055473 () Bool)

(assert (=> b!1055473 (= e!599873 #b00000000000000000000000000000000)))

(declare-fun b!1055474 () Bool)

(assert (=> b!1055474 (= e!599873 (arrayScanForKey!0 lt!465736 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128199 c!107051) b!1055473))

(assert (= (and d!128199 (not c!107051)) b!1055474))

(declare-fun m!975477 () Bool)

(assert (=> d!128199 m!975477))

(assert (=> d!128199 m!975461))

(declare-fun m!975479 () Bool)

(assert (=> b!1055474 m!975479))

(assert (=> b!1055339 d!128199))

(declare-fun d!128209 () Bool)

(assert (=> d!128209 (= (validKeyInArray!0 k!2747) (and (not (= k!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1055340 d!128209))

(declare-fun d!128211 () Bool)

