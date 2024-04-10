; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93256 () Bool)

(assert start!93256)

(declare-fun b!1057374 () Bool)

(declare-fun e!601322 () Bool)

(declare-fun e!601321 () Bool)

(assert (=> b!1057374 (= e!601322 e!601321)))

(declare-fun res!706080 () Bool)

(assert (=> b!1057374 (=> (not res!706080) (not e!601321))))

(declare-datatypes ((array!66694 0))(
  ( (array!66695 (arr!32070 (Array (_ BitVec 32) (_ BitVec 64))) (size!32606 (_ BitVec 32))) )
))
(declare-fun lt!466439 () array!66694)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66694 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057374 (= res!706080 (arrayContainsKey!0 lt!466439 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66694)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057374 (= lt!466439 (array!66695 (store (arr!32070 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32606 a!3488)))))

(declare-fun b!1057375 () Bool)

(declare-fun res!706077 () Bool)

(assert (=> b!1057375 (=> (not res!706077) (not e!601322))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057375 (= res!706077 (validKeyInArray!0 k!2747))))

(declare-fun b!1057376 () Bool)

(declare-fun e!601327 () Bool)

(declare-fun e!601324 () Bool)

(assert (=> b!1057376 (= e!601327 e!601324)))

(declare-fun res!706074 () Bool)

(assert (=> b!1057376 (=> res!706074 e!601324)))

(declare-fun lt!466441 () (_ BitVec 32))

(assert (=> b!1057376 (= res!706074 (or (bvsgt lt!466441 i!1381) (bvsle i!1381 lt!466441)))))

(declare-fun b!1057377 () Bool)

(declare-fun e!601323 () Bool)

(declare-fun e!601325 () Bool)

(assert (=> b!1057377 (= e!601323 (not e!601325))))

(declare-fun res!706082 () Bool)

(assert (=> b!1057377 (=> res!706082 e!601325)))

(assert (=> b!1057377 (= res!706082 (or (bvsgt lt!466441 i!1381) (bvsle i!1381 lt!466441)))))

(assert (=> b!1057377 e!601327))

(declare-fun res!706075 () Bool)

(assert (=> b!1057377 (=> (not res!706075) (not e!601327))))

(assert (=> b!1057377 (= res!706075 (= (select (store (arr!32070 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466441) k!2747))))

(declare-fun b!1057378 () Bool)

(assert (=> b!1057378 (= e!601325 (bvsge lt!466441 #b00000000000000000000000000000000))))

(declare-fun lt!466442 () (_ BitVec 32))

(assert (=> b!1057378 (arrayContainsKey!0 a!3488 k!2747 lt!466442)))

(declare-datatypes ((Unit!34662 0))(
  ( (Unit!34663) )
))
(declare-fun lt!466443 () Unit!34662)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66694 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34662)

(assert (=> b!1057378 (= lt!466443 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466442))))

(assert (=> b!1057378 (= lt!466442 (bvadd #b00000000000000000000000000000001 lt!466441))))

(declare-datatypes ((List!22382 0))(
  ( (Nil!22379) (Cons!22378 (h!23587 (_ BitVec 64)) (t!31689 List!22382)) )
))
(declare-fun arrayNoDuplicates!0 (array!66694 (_ BitVec 32) List!22382) Bool)

(assert (=> b!1057378 (arrayNoDuplicates!0 a!3488 lt!466441 Nil!22379)))

(declare-fun lt!466440 () Unit!34662)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66694 (_ BitVec 32) (_ BitVec 32)) Unit!34662)

(assert (=> b!1057378 (= lt!466440 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466441))))

(declare-fun b!1057379 () Bool)

(declare-fun res!706076 () Bool)

(assert (=> b!1057379 (=> (not res!706076) (not e!601322))))

(assert (=> b!1057379 (= res!706076 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22379))))

(declare-fun b!1057380 () Bool)

(assert (=> b!1057380 (= e!601324 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1057381 () Bool)

(declare-fun res!706078 () Bool)

(assert (=> b!1057381 (=> (not res!706078) (not e!601322))))

(assert (=> b!1057381 (= res!706078 (= (select (arr!32070 a!3488) i!1381) k!2747))))

(declare-fun res!706081 () Bool)

(assert (=> start!93256 (=> (not res!706081) (not e!601322))))

(assert (=> start!93256 (= res!706081 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32606 a!3488)) (bvslt (size!32606 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93256 e!601322))

(assert (=> start!93256 true))

(declare-fun array_inv!24850 (array!66694) Bool)

(assert (=> start!93256 (array_inv!24850 a!3488)))

(declare-fun b!1057382 () Bool)

(assert (=> b!1057382 (= e!601321 e!601323)))

(declare-fun res!706079 () Bool)

(assert (=> b!1057382 (=> (not res!706079) (not e!601323))))

(assert (=> b!1057382 (= res!706079 (not (= lt!466441 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66694 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057382 (= lt!466441 (arrayScanForKey!0 lt!466439 k!2747 #b00000000000000000000000000000000))))

(assert (= (and start!93256 res!706081) b!1057379))

(assert (= (and b!1057379 res!706076) b!1057375))

(assert (= (and b!1057375 res!706077) b!1057381))

(assert (= (and b!1057381 res!706078) b!1057374))

(assert (= (and b!1057374 res!706080) b!1057382))

(assert (= (and b!1057382 res!706079) b!1057377))

(assert (= (and b!1057377 res!706075) b!1057376))

(assert (= (and b!1057376 (not res!706074)) b!1057380))

(assert (= (and b!1057377 (not res!706082)) b!1057378))

(declare-fun m!977073 () Bool)

(assert (=> b!1057381 m!977073))

(declare-fun m!977075 () Bool)

(assert (=> start!93256 m!977075))

(declare-fun m!977077 () Bool)

(assert (=> b!1057374 m!977077))

(declare-fun m!977079 () Bool)

(assert (=> b!1057374 m!977079))

(declare-fun m!977081 () Bool)

(assert (=> b!1057379 m!977081))

(declare-fun m!977083 () Bool)

(assert (=> b!1057378 m!977083))

(declare-fun m!977085 () Bool)

(assert (=> b!1057378 m!977085))

(declare-fun m!977087 () Bool)

(assert (=> b!1057378 m!977087))

(declare-fun m!977089 () Bool)

(assert (=> b!1057378 m!977089))

(declare-fun m!977091 () Bool)

(assert (=> b!1057382 m!977091))

(declare-fun m!977093 () Bool)

(assert (=> b!1057375 m!977093))

(declare-fun m!977095 () Bool)

(assert (=> b!1057380 m!977095))

(assert (=> b!1057377 m!977079))

(declare-fun m!977097 () Bool)

(assert (=> b!1057377 m!977097))

(push 1)

(assert (not b!1057382))

(assert (not b!1057375))

(assert (not b!1057378))

(assert (not start!93256))

(assert (not b!1057379))

(assert (not b!1057374))

(assert (not b!1057380))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!128409 () Bool)

(declare-fun res!706112 () Bool)

(declare-fun e!601363 () Bool)

(assert (=> d!128409 (=> res!706112 e!601363)))

(assert (=> d!128409 (= res!706112 (= (select (arr!32070 a!3488) lt!466442) k!2747))))

(assert (=> d!128409 (= (arrayContainsKey!0 a!3488 k!2747 lt!466442) e!601363)))

(declare-fun b!1057424 () Bool)

(declare-fun e!601364 () Bool)

(assert (=> b!1057424 (= e!601363 e!601364)))

(declare-fun res!706113 () Bool)

(assert (=> b!1057424 (=> (not res!706113) (not e!601364))))

(assert (=> b!1057424 (= res!706113 (bvslt (bvadd lt!466442 #b00000000000000000000000000000001) (size!32606 a!3488)))))

(declare-fun b!1057425 () Bool)

(assert (=> b!1057425 (= e!601364 (arrayContainsKey!0 a!3488 k!2747 (bvadd lt!466442 #b00000000000000000000000000000001)))))

(assert (= (and d!128409 (not res!706112)) b!1057424))

(assert (= (and b!1057424 res!706113) b!1057425))

(declare-fun m!977129 () Bool)

(assert (=> d!128409 m!977129))

(declare-fun m!977131 () Bool)

(assert (=> b!1057425 m!977131))

(assert (=> b!1057378 d!128409))

(declare-fun d!128415 () Bool)

(assert (=> d!128415 (arrayContainsKey!0 a!3488 k!2747 lt!466442)))

(declare-fun lt!466455 () Unit!34662)

(declare-fun choose!114 (array!66694 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34662)

(assert (=> d!128415 (= lt!466455 (choose!114 a!3488 k!2747 i!1381 lt!466442))))

(assert (=> d!128415 (bvsge i!1381 #b00000000000000000000000000000000)))

(assert (=> d!128415 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466442) lt!466455)))

(declare-fun bs!31005 () Bool)

(assert (= bs!31005 d!128415))

(assert (=> bs!31005 m!977083))

(declare-fun m!977143 () Bool)

(assert (=> bs!31005 m!977143))

(assert (=> b!1057378 d!128415))

(declare-fun d!128421 () Bool)

(declare-fun res!706136 () Bool)

(declare-fun e!601395 () Bool)

(assert (=> d!128421 (=> res!706136 e!601395)))

(assert (=> d!128421 (= res!706136 (bvsge lt!466441 (size!32606 a!3488)))))

(assert (=> d!128421 (= (arrayNoDuplicates!0 a!3488 lt!466441 Nil!22379) e!601395)))

(declare-fun b!1057460 () Bool)

(declare-fun e!601396 () Bool)

(declare-fun e!601394 () Bool)

(assert (=> b!1057460 (= e!601396 e!601394)))

(declare-fun c!107122 () Bool)

(assert (=> b!1057460 (= c!107122 (validKeyInArray!0 (select (arr!32070 a!3488) lt!466441)))))

(declare-fun b!1057461 () Bool)

(declare-fun call!44846 () Bool)

(assert (=> b!1057461 (= e!601394 call!44846)))

(declare-fun b!1057462 () Bool)

(assert (=> b!1057462 (= e!601395 e!601396)))

(declare-fun res!706138 () Bool)

(assert (=> b!1057462 (=> (not res!706138) (not e!601396))))

(declare-fun e!601393 () Bool)

(assert (=> b!1057462 (= res!706138 (not e!601393))))

(declare-fun res!706137 () Bool)

(assert (=> b!1057462 (=> (not res!706137) (not e!601393))))

(assert (=> b!1057462 (= res!706137 (validKeyInArray!0 (select (arr!32070 a!3488) lt!466441)))))

(declare-fun b!1057463 () Bool)

(assert (=> b!1057463 (= e!601394 call!44846)))

(declare-fun b!1057464 () Bool)

(declare-fun contains!6200 (List!22382 (_ BitVec 64)) Bool)

(assert (=> b!1057464 (= e!601393 (contains!6200 Nil!22379 (select (arr!32070 a!3488) lt!466441)))))

(declare-fun bm!44843 () Bool)

(assert (=> bm!44843 (= call!44846 (arrayNoDuplicates!0 a!3488 (bvadd lt!466441 #b00000000000000000000000000000001) (ite c!107122 (Cons!22378 (select (arr!32070 a!3488) lt!466441) Nil!22379) Nil!22379)))))

(assert (= (and d!128421 (not res!706136)) b!1057462))

(assert (= (and b!1057462 res!706137) b!1057464))

(assert (= (and b!1057462 res!706138) b!1057460))

(assert (= (and b!1057460 c!107122) b!1057461))

(assert (= (and b!1057460 (not c!107122)) b!1057463))

(assert (= (or b!1057461 b!1057463) bm!44843))

(declare-fun m!977159 () Bool)

(assert (=> b!1057460 m!977159))

(assert (=> b!1057460 m!977159))

(declare-fun m!977161 () Bool)

(assert (=> b!1057460 m!977161))

(assert (=> b!1057462 m!977159))

(assert (=> b!1057462 m!977159))

(assert (=> b!1057462 m!977161))

(assert (=> b!1057464 m!977159))

(assert (=> b!1057464 m!977159))

(declare-fun m!977165 () Bool)

(assert (=> b!1057464 m!977165))

(assert (=> bm!44843 m!977159))

(declare-fun m!977167 () Bool)

(assert (=> bm!44843 m!977167))

(assert (=> b!1057378 d!128421))

(declare-fun d!128431 () Bool)

(assert (=> d!128431 (arrayNoDuplicates!0 a!3488 lt!466441 Nil!22379)))

(declare-fun lt!466464 () Unit!34662)

(declare-fun choose!39 (array!66694 (_ BitVec 32) (_ BitVec 32)) Unit!34662)

(assert (=> d!128431 (= lt!466464 (choose!39 a!3488 #b00000000000000000000000000000000 lt!466441))))

