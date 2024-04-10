; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93254 () Bool)

(assert start!93254)

(declare-fun b!1057347 () Bool)

(declare-fun res!706053 () Bool)

(declare-fun e!601304 () Bool)

(assert (=> b!1057347 (=> (not res!706053) (not e!601304))))

(declare-datatypes ((array!66692 0))(
  ( (array!66693 (arr!32069 (Array (_ BitVec 32) (_ BitVec 64))) (size!32605 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66692)

(declare-datatypes ((List!22381 0))(
  ( (Nil!22378) (Cons!22377 (h!23586 (_ BitVec 64)) (t!31688 List!22381)) )
))
(declare-fun arrayNoDuplicates!0 (array!66692 (_ BitVec 32) List!22381) Bool)

(assert (=> b!1057347 (= res!706053 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22378))))

(declare-fun b!1057348 () Bool)

(declare-fun e!601306 () Bool)

(declare-fun e!601303 () Bool)

(assert (=> b!1057348 (= e!601306 e!601303)))

(declare-fun res!706048 () Bool)

(assert (=> b!1057348 (=> (not res!706048) (not e!601303))))

(declare-fun lt!466425 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057348 (= res!706048 (not (= lt!466425 i!1381)))))

(declare-fun lt!466427 () array!66692)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66692 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057348 (= lt!466425 (arrayScanForKey!0 lt!466427 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057349 () Bool)

(assert (=> b!1057349 (= e!601304 e!601306)))

(declare-fun res!706049 () Bool)

(assert (=> b!1057349 (=> (not res!706049) (not e!601306))))

(declare-fun arrayContainsKey!0 (array!66692 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057349 (= res!706049 (arrayContainsKey!0 lt!466427 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057349 (= lt!466427 (array!66693 (store (arr!32069 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32605 a!3488)))))

(declare-fun b!1057350 () Bool)

(declare-fun e!601302 () Bool)

(assert (=> b!1057350 (= e!601303 (not e!601302))))

(declare-fun res!706047 () Bool)

(assert (=> b!1057350 (=> res!706047 e!601302)))

(assert (=> b!1057350 (= res!706047 (or (bvsgt lt!466425 i!1381) (bvsle i!1381 lt!466425)))))

(declare-fun e!601301 () Bool)

(assert (=> b!1057350 e!601301))

(declare-fun res!706055 () Bool)

(assert (=> b!1057350 (=> (not res!706055) (not e!601301))))

(assert (=> b!1057350 (= res!706055 (= (select (store (arr!32069 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466425) k0!2747))))

(declare-fun b!1057351 () Bool)

(assert (=> b!1057351 (= e!601302 (bvsge lt!466425 #b00000000000000000000000000000000))))

(declare-fun lt!466426 () (_ BitVec 32))

(assert (=> b!1057351 (arrayContainsKey!0 a!3488 k0!2747 lt!466426)))

(declare-datatypes ((Unit!34660 0))(
  ( (Unit!34661) )
))
(declare-fun lt!466428 () Unit!34660)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66692 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34660)

(assert (=> b!1057351 (= lt!466428 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466426))))

(assert (=> b!1057351 (= lt!466426 (bvadd #b00000000000000000000000000000001 lt!466425))))

(assert (=> b!1057351 (arrayNoDuplicates!0 a!3488 lt!466425 Nil!22378)))

(declare-fun lt!466424 () Unit!34660)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66692 (_ BitVec 32) (_ BitVec 32)) Unit!34660)

(assert (=> b!1057351 (= lt!466424 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466425))))

(declare-fun b!1057352 () Bool)

(declare-fun res!706051 () Bool)

(assert (=> b!1057352 (=> (not res!706051) (not e!601304))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057352 (= res!706051 (validKeyInArray!0 k0!2747))))

(declare-fun b!1057353 () Bool)

(declare-fun e!601305 () Bool)

(assert (=> b!1057353 (= e!601301 e!601305)))

(declare-fun res!706052 () Bool)

(assert (=> b!1057353 (=> res!706052 e!601305)))

(assert (=> b!1057353 (= res!706052 (or (bvsgt lt!466425 i!1381) (bvsle i!1381 lt!466425)))))

(declare-fun res!706050 () Bool)

(assert (=> start!93254 (=> (not res!706050) (not e!601304))))

(assert (=> start!93254 (= res!706050 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32605 a!3488)) (bvslt (size!32605 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93254 e!601304))

(assert (=> start!93254 true))

(declare-fun array_inv!24849 (array!66692) Bool)

(assert (=> start!93254 (array_inv!24849 a!3488)))

(declare-fun b!1057354 () Bool)

(assert (=> b!1057354 (= e!601305 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1057355 () Bool)

(declare-fun res!706054 () Bool)

(assert (=> b!1057355 (=> (not res!706054) (not e!601304))))

(assert (=> b!1057355 (= res!706054 (= (select (arr!32069 a!3488) i!1381) k0!2747))))

(assert (= (and start!93254 res!706050) b!1057347))

(assert (= (and b!1057347 res!706053) b!1057352))

(assert (= (and b!1057352 res!706051) b!1057355))

(assert (= (and b!1057355 res!706054) b!1057349))

(assert (= (and b!1057349 res!706049) b!1057348))

(assert (= (and b!1057348 res!706048) b!1057350))

(assert (= (and b!1057350 res!706055) b!1057353))

(assert (= (and b!1057353 (not res!706052)) b!1057354))

(assert (= (and b!1057350 (not res!706047)) b!1057351))

(declare-fun m!977047 () Bool)

(assert (=> b!1057351 m!977047))

(declare-fun m!977049 () Bool)

(assert (=> b!1057351 m!977049))

(declare-fun m!977051 () Bool)

(assert (=> b!1057351 m!977051))

(declare-fun m!977053 () Bool)

(assert (=> b!1057351 m!977053))

(declare-fun m!977055 () Bool)

(assert (=> start!93254 m!977055))

(declare-fun m!977057 () Bool)

(assert (=> b!1057354 m!977057))

(declare-fun m!977059 () Bool)

(assert (=> b!1057348 m!977059))

(declare-fun m!977061 () Bool)

(assert (=> b!1057355 m!977061))

(declare-fun m!977063 () Bool)

(assert (=> b!1057350 m!977063))

(declare-fun m!977065 () Bool)

(assert (=> b!1057350 m!977065))

(declare-fun m!977067 () Bool)

(assert (=> b!1057349 m!977067))

(assert (=> b!1057349 m!977063))

(declare-fun m!977069 () Bool)

(assert (=> b!1057347 m!977069))

(declare-fun m!977071 () Bool)

(assert (=> b!1057352 m!977071))

(check-sat (not start!93254) (not b!1057351) (not b!1057347) (not b!1057354) (not b!1057352) (not b!1057349) (not b!1057348))
(check-sat)
(get-model)

(declare-fun d!128387 () Bool)

(declare-fun lt!466446 () (_ BitVec 32))

(assert (=> d!128387 (and (or (bvslt lt!466446 #b00000000000000000000000000000000) (bvsge lt!466446 (size!32605 lt!466427)) (and (bvsge lt!466446 #b00000000000000000000000000000000) (bvslt lt!466446 (size!32605 lt!466427)))) (bvsge lt!466446 #b00000000000000000000000000000000) (bvslt lt!466446 (size!32605 lt!466427)) (= (select (arr!32069 lt!466427) lt!466446) k0!2747))))

(declare-fun e!601330 () (_ BitVec 32))

(assert (=> d!128387 (= lt!466446 e!601330)))

(declare-fun c!107112 () Bool)

(assert (=> d!128387 (= c!107112 (= (select (arr!32069 lt!466427) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128387 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32605 lt!466427)) (bvslt (size!32605 lt!466427) #b01111111111111111111111111111111))))

(assert (=> d!128387 (= (arrayScanForKey!0 lt!466427 k0!2747 #b00000000000000000000000000000000) lt!466446)))

(declare-fun b!1057387 () Bool)

(assert (=> b!1057387 (= e!601330 #b00000000000000000000000000000000)))

(declare-fun b!1057388 () Bool)

(assert (=> b!1057388 (= e!601330 (arrayScanForKey!0 lt!466427 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128387 c!107112) b!1057387))

(assert (= (and d!128387 (not c!107112)) b!1057388))

(declare-fun m!977099 () Bool)

(assert (=> d!128387 m!977099))

(declare-fun m!977101 () Bool)

(assert (=> d!128387 m!977101))

(declare-fun m!977103 () Bool)

(assert (=> b!1057388 m!977103))

(assert (=> b!1057348 d!128387))

(declare-fun b!1057399 () Bool)

(declare-fun e!601341 () Bool)

(declare-fun e!601342 () Bool)

(assert (=> b!1057399 (= e!601341 e!601342)))

(declare-fun c!107115 () Bool)

(assert (=> b!1057399 (= c!107115 (validKeyInArray!0 (select (arr!32069 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1057400 () Bool)

(declare-fun e!601340 () Bool)

(declare-fun contains!6198 (List!22381 (_ BitVec 64)) Bool)

(assert (=> b!1057400 (= e!601340 (contains!6198 Nil!22378 (select (arr!32069 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1057402 () Bool)

(declare-fun e!601339 () Bool)

(assert (=> b!1057402 (= e!601339 e!601341)))

(declare-fun res!706090 () Bool)

(assert (=> b!1057402 (=> (not res!706090) (not e!601341))))

(assert (=> b!1057402 (= res!706090 (not e!601340))))

(declare-fun res!706091 () Bool)

(assert (=> b!1057402 (=> (not res!706091) (not e!601340))))

(assert (=> b!1057402 (= res!706091 (validKeyInArray!0 (select (arr!32069 a!3488) #b00000000000000000000000000000000)))))

(declare-fun bm!44836 () Bool)

(declare-fun call!44839 () Bool)

(assert (=> bm!44836 (= call!44839 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107115 (Cons!22377 (select (arr!32069 a!3488) #b00000000000000000000000000000000) Nil!22378) Nil!22378)))))

(declare-fun b!1057403 () Bool)

(assert (=> b!1057403 (= e!601342 call!44839)))

(declare-fun b!1057401 () Bool)

(assert (=> b!1057401 (= e!601342 call!44839)))

(declare-fun d!128389 () Bool)

(declare-fun res!706089 () Bool)

(assert (=> d!128389 (=> res!706089 e!601339)))

(assert (=> d!128389 (= res!706089 (bvsge #b00000000000000000000000000000000 (size!32605 a!3488)))))

(assert (=> d!128389 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22378) e!601339)))

(assert (= (and d!128389 (not res!706089)) b!1057402))

(assert (= (and b!1057402 res!706091) b!1057400))

(assert (= (and b!1057402 res!706090) b!1057399))

(assert (= (and b!1057399 c!107115) b!1057403))

(assert (= (and b!1057399 (not c!107115)) b!1057401))

(assert (= (or b!1057403 b!1057401) bm!44836))

(declare-fun m!977105 () Bool)

(assert (=> b!1057399 m!977105))

(assert (=> b!1057399 m!977105))

(declare-fun m!977107 () Bool)

(assert (=> b!1057399 m!977107))

(assert (=> b!1057400 m!977105))

(assert (=> b!1057400 m!977105))

(declare-fun m!977109 () Bool)

(assert (=> b!1057400 m!977109))

(assert (=> b!1057402 m!977105))

(assert (=> b!1057402 m!977105))

(assert (=> b!1057402 m!977107))

(assert (=> bm!44836 m!977105))

(declare-fun m!977111 () Bool)

(assert (=> bm!44836 m!977111))

(assert (=> b!1057347 d!128389))

(declare-fun d!128395 () Bool)

(assert (=> d!128395 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1057352 d!128395))

(declare-fun d!128397 () Bool)

(assert (=> d!128397 (= (array_inv!24849 a!3488) (bvsge (size!32605 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93254 d!128397))

(declare-fun d!128401 () Bool)

(declare-fun res!706106 () Bool)

(declare-fun e!601357 () Bool)

(assert (=> d!128401 (=> res!706106 e!601357)))

(assert (=> d!128401 (= res!706106 (= (select (arr!32069 a!3488) lt!466426) k0!2747))))

(assert (=> d!128401 (= (arrayContainsKey!0 a!3488 k0!2747 lt!466426) e!601357)))

(declare-fun b!1057418 () Bool)

(declare-fun e!601358 () Bool)

(assert (=> b!1057418 (= e!601357 e!601358)))

(declare-fun res!706107 () Bool)

(assert (=> b!1057418 (=> (not res!706107) (not e!601358))))

(assert (=> b!1057418 (= res!706107 (bvslt (bvadd lt!466426 #b00000000000000000000000000000001) (size!32605 a!3488)))))

(declare-fun b!1057419 () Bool)

(assert (=> b!1057419 (= e!601358 (arrayContainsKey!0 a!3488 k0!2747 (bvadd lt!466426 #b00000000000000000000000000000001)))))

(assert (= (and d!128401 (not res!706106)) b!1057418))

(assert (= (and b!1057418 res!706107) b!1057419))

(declare-fun m!977123 () Bool)

(assert (=> d!128401 m!977123))

(declare-fun m!977125 () Bool)

(assert (=> b!1057419 m!977125))

(assert (=> b!1057351 d!128401))

(declare-fun d!128411 () Bool)

(assert (=> d!128411 (arrayContainsKey!0 a!3488 k0!2747 lt!466426)))

(declare-fun lt!466452 () Unit!34660)

(declare-fun choose!114 (array!66692 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34660)

(assert (=> d!128411 (= lt!466452 (choose!114 a!3488 k0!2747 i!1381 lt!466426))))

(assert (=> d!128411 (bvsge i!1381 #b00000000000000000000000000000000)))

(assert (=> d!128411 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466426) lt!466452)))

(declare-fun bs!31004 () Bool)

(assert (= bs!31004 d!128411))

(assert (=> bs!31004 m!977047))

(declare-fun m!977133 () Bool)

(assert (=> bs!31004 m!977133))

(assert (=> b!1057351 d!128411))

(declare-fun b!1057426 () Bool)

(declare-fun e!601367 () Bool)

(declare-fun e!601368 () Bool)

(assert (=> b!1057426 (= e!601367 e!601368)))

(declare-fun c!107116 () Bool)

(assert (=> b!1057426 (= c!107116 (validKeyInArray!0 (select (arr!32069 a!3488) lt!466425)))))

(declare-fun b!1057427 () Bool)

(declare-fun e!601366 () Bool)

(assert (=> b!1057427 (= e!601366 (contains!6198 Nil!22378 (select (arr!32069 a!3488) lt!466425)))))

(declare-fun b!1057429 () Bool)

(declare-fun e!601365 () Bool)

(assert (=> b!1057429 (= e!601365 e!601367)))

(declare-fun res!706115 () Bool)

(assert (=> b!1057429 (=> (not res!706115) (not e!601367))))

(assert (=> b!1057429 (= res!706115 (not e!601366))))

(declare-fun res!706116 () Bool)

(assert (=> b!1057429 (=> (not res!706116) (not e!601366))))

(assert (=> b!1057429 (= res!706116 (validKeyInArray!0 (select (arr!32069 a!3488) lt!466425)))))

(declare-fun call!44840 () Bool)

(declare-fun bm!44837 () Bool)

(assert (=> bm!44837 (= call!44840 (arrayNoDuplicates!0 a!3488 (bvadd lt!466425 #b00000000000000000000000000000001) (ite c!107116 (Cons!22377 (select (arr!32069 a!3488) lt!466425) Nil!22378) Nil!22378)))))

(declare-fun b!1057430 () Bool)

(assert (=> b!1057430 (= e!601368 call!44840)))

(declare-fun b!1057428 () Bool)

(assert (=> b!1057428 (= e!601368 call!44840)))

(declare-fun d!128417 () Bool)

(declare-fun res!706114 () Bool)

(assert (=> d!128417 (=> res!706114 e!601365)))

(assert (=> d!128417 (= res!706114 (bvsge lt!466425 (size!32605 a!3488)))))

(assert (=> d!128417 (= (arrayNoDuplicates!0 a!3488 lt!466425 Nil!22378) e!601365)))

(assert (= (and d!128417 (not res!706114)) b!1057429))

(assert (= (and b!1057429 res!706116) b!1057427))

(assert (= (and b!1057429 res!706115) b!1057426))

(assert (= (and b!1057426 c!107116) b!1057430))

(assert (= (and b!1057426 (not c!107116)) b!1057428))

(assert (= (or b!1057430 b!1057428) bm!44837))

(declare-fun m!977135 () Bool)

(assert (=> b!1057426 m!977135))

(assert (=> b!1057426 m!977135))

(declare-fun m!977137 () Bool)

(assert (=> b!1057426 m!977137))

(assert (=> b!1057427 m!977135))

(assert (=> b!1057427 m!977135))

(declare-fun m!977139 () Bool)

(assert (=> b!1057427 m!977139))

(assert (=> b!1057429 m!977135))

(assert (=> b!1057429 m!977135))

(assert (=> b!1057429 m!977137))

(assert (=> bm!44837 m!977135))

(declare-fun m!977141 () Bool)

(assert (=> bm!44837 m!977141))

(assert (=> b!1057351 d!128417))

(declare-fun d!128419 () Bool)

(assert (=> d!128419 (arrayNoDuplicates!0 a!3488 lt!466425 Nil!22378)))

(declare-fun lt!466458 () Unit!34660)

(declare-fun choose!39 (array!66692 (_ BitVec 32) (_ BitVec 32)) Unit!34660)

(assert (=> d!128419 (= lt!466458 (choose!39 a!3488 #b00000000000000000000000000000000 lt!466425))))

(assert (=> d!128419 (bvslt (size!32605 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128419 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466425) lt!466458)))

(declare-fun bs!31006 () Bool)

(assert (= bs!31006 d!128419))

(assert (=> bs!31006 m!977051))

(declare-fun m!977145 () Bool)

(assert (=> bs!31006 m!977145))

(assert (=> b!1057351 d!128419))

(declare-fun d!128423 () Bool)

(declare-fun res!706123 () Bool)

(declare-fun e!601377 () Bool)

(assert (=> d!128423 (=> res!706123 e!601377)))

(assert (=> d!128423 (= res!706123 (= (select (arr!32069 lt!466427) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128423 (= (arrayContainsKey!0 lt!466427 k0!2747 #b00000000000000000000000000000000) e!601377)))

(declare-fun b!1057441 () Bool)

(declare-fun e!601378 () Bool)

(assert (=> b!1057441 (= e!601377 e!601378)))

(declare-fun res!706124 () Bool)

(assert (=> b!1057441 (=> (not res!706124) (not e!601378))))

(assert (=> b!1057441 (= res!706124 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32605 lt!466427)))))

(declare-fun b!1057442 () Bool)

(assert (=> b!1057442 (= e!601378 (arrayContainsKey!0 lt!466427 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128423 (not res!706123)) b!1057441))

(assert (= (and b!1057441 res!706124) b!1057442))

(assert (=> d!128423 m!977101))

(declare-fun m!977147 () Bool)

(assert (=> b!1057442 m!977147))

(assert (=> b!1057349 d!128423))

(declare-fun d!128425 () Bool)

(declare-fun res!706125 () Bool)

(declare-fun e!601379 () Bool)

(assert (=> d!128425 (=> res!706125 e!601379)))

(assert (=> d!128425 (= res!706125 (= (select (arr!32069 a!3488) i!1381) k0!2747))))

(assert (=> d!128425 (= (arrayContainsKey!0 a!3488 k0!2747 i!1381) e!601379)))

(declare-fun b!1057443 () Bool)

(declare-fun e!601380 () Bool)

(assert (=> b!1057443 (= e!601379 e!601380)))

(declare-fun res!706126 () Bool)

(assert (=> b!1057443 (=> (not res!706126) (not e!601380))))

(assert (=> b!1057443 (= res!706126 (bvslt (bvadd i!1381 #b00000000000000000000000000000001) (size!32605 a!3488)))))

(declare-fun b!1057444 () Bool)

(assert (=> b!1057444 (= e!601380 (arrayContainsKey!0 a!3488 k0!2747 (bvadd i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128425 (not res!706125)) b!1057443))

(assert (= (and b!1057443 res!706126) b!1057444))

(assert (=> d!128425 m!977061))

(declare-fun m!977149 () Bool)

(assert (=> b!1057444 m!977149))

(assert (=> b!1057354 d!128425))

(check-sat (not bm!44837) (not b!1057419) (not bm!44836) (not b!1057399) (not b!1057426) (not d!128411) (not b!1057427) (not b!1057402) (not b!1057442) (not b!1057388) (not b!1057444) (not b!1057429) (not b!1057400) (not d!128419))
(check-sat)
