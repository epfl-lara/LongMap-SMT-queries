; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92718 () Bool)

(assert start!92718)

(declare-fun b!1053425 () Bool)

(declare-fun res!702448 () Bool)

(declare-fun e!598276 () Bool)

(assert (=> b!1053425 (=> (not res!702448) (not e!598276))))

(declare-datatypes ((array!66438 0))(
  ( (array!66439 (arr!31954 (Array (_ BitVec 32) (_ BitVec 64))) (size!32490 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66438)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053425 (= res!702448 (= (select (arr!31954 a!3488) i!1381) k!2747))))

(declare-fun b!1053426 () Bool)

(declare-fun res!702449 () Bool)

(assert (=> b!1053426 (=> (not res!702449) (not e!598276))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053426 (= res!702449 (validKeyInArray!0 k!2747))))

(declare-fun b!1053427 () Bool)

(declare-fun e!598272 () Bool)

(assert (=> b!1053427 (= e!598276 e!598272)))

(declare-fun res!702446 () Bool)

(assert (=> b!1053427 (=> (not res!702446) (not e!598272))))

(declare-fun lt!465141 () array!66438)

(declare-fun arrayContainsKey!0 (array!66438 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053427 (= res!702446 (arrayContainsKey!0 lt!465141 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053427 (= lt!465141 (array!66439 (store (arr!31954 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32490 a!3488)))))

(declare-fun b!1053428 () Bool)

(declare-fun res!702445 () Bool)

(assert (=> b!1053428 (=> (not res!702445) (not e!598276))))

(declare-datatypes ((List!22266 0))(
  ( (Nil!22263) (Cons!22262 (h!23471 (_ BitVec 64)) (t!31573 List!22266)) )
))
(declare-fun arrayNoDuplicates!0 (array!66438 (_ BitVec 32) List!22266) Bool)

(assert (=> b!1053428 (= res!702445 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22263))))

(declare-fun b!1053429 () Bool)

(declare-fun e!598275 () Bool)

(declare-fun e!598273 () Bool)

(assert (=> b!1053429 (= e!598275 (not e!598273))))

(declare-fun res!702444 () Bool)

(assert (=> b!1053429 (=> res!702444 e!598273)))

(declare-fun lt!465140 () (_ BitVec 32))

(assert (=> b!1053429 (= res!702444 (bvsle lt!465140 i!1381))))

(assert (=> b!1053429 (= (select (store (arr!31954 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465140) k!2747)))

(declare-fun res!702447 () Bool)

(assert (=> start!92718 (=> (not res!702447) (not e!598276))))

(assert (=> start!92718 (= res!702447 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32490 a!3488)) (bvslt (size!32490 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92718 e!598276))

(assert (=> start!92718 true))

(declare-fun array_inv!24734 (array!66438) Bool)

(assert (=> start!92718 (array_inv!24734 a!3488)))

(declare-fun b!1053430 () Bool)

(assert (=> b!1053430 (= e!598273 (arrayContainsKey!0 a!3488 k!2747 lt!465140))))

(declare-fun b!1053431 () Bool)

(assert (=> b!1053431 (= e!598272 e!598275)))

(declare-fun res!702443 () Bool)

(assert (=> b!1053431 (=> (not res!702443) (not e!598275))))

(assert (=> b!1053431 (= res!702443 (not (= lt!465140 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66438 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053431 (= lt!465140 (arrayScanForKey!0 lt!465141 k!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92718 res!702447) b!1053428))

(assert (= (and b!1053428 res!702445) b!1053426))

(assert (= (and b!1053426 res!702449) b!1053425))

(assert (= (and b!1053425 res!702448) b!1053427))

(assert (= (and b!1053427 res!702446) b!1053431))

(assert (= (and b!1053431 res!702443) b!1053429))

(assert (= (and b!1053429 (not res!702444)) b!1053430))

(declare-fun m!973715 () Bool)

(assert (=> b!1053430 m!973715))

(declare-fun m!973717 () Bool)

(assert (=> b!1053428 m!973717))

(declare-fun m!973719 () Bool)

(assert (=> start!92718 m!973719))

(declare-fun m!973721 () Bool)

(assert (=> b!1053431 m!973721))

(declare-fun m!973723 () Bool)

(assert (=> b!1053426 m!973723))

(declare-fun m!973725 () Bool)

(assert (=> b!1053425 m!973725))

(declare-fun m!973727 () Bool)

(assert (=> b!1053429 m!973727))

(declare-fun m!973729 () Bool)

(assert (=> b!1053429 m!973729))

(declare-fun m!973731 () Bool)

(assert (=> b!1053427 m!973731))

(assert (=> b!1053427 m!973727))

(push 1)

(assert (not b!1053430))

(assert (not b!1053427))

(assert (not b!1053431))

(assert (not start!92718))

(assert (not b!1053426))

(assert (not b!1053428))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!127907 () Bool)

(declare-fun res!702496 () Bool)

(declare-fun e!598314 () Bool)

(assert (=> d!127907 (=> res!702496 e!598314)))

(assert (=> d!127907 (= res!702496 (= (select (arr!31954 lt!465141) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!127907 (= (arrayContainsKey!0 lt!465141 k!2747 #b00000000000000000000000000000000) e!598314)))

(declare-fun b!1053484 () Bool)

(declare-fun e!598315 () Bool)

(assert (=> b!1053484 (= e!598314 e!598315)))

(declare-fun res!702497 () Bool)

(assert (=> b!1053484 (=> (not res!702497) (not e!598315))))

(assert (=> b!1053484 (= res!702497 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32490 lt!465141)))))

(declare-fun b!1053485 () Bool)

(assert (=> b!1053485 (= e!598315 (arrayContainsKey!0 lt!465141 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!127907 (not res!702496)) b!1053484))

(assert (= (and b!1053484 res!702497) b!1053485))

(declare-fun m!973775 () Bool)

(assert (=> d!127907 m!973775))

(declare-fun m!973777 () Bool)

(assert (=> b!1053485 m!973777))

(assert (=> b!1053427 d!127907))

(declare-fun d!127911 () Bool)

(assert (=> d!127911 (= (array_inv!24734 a!3488) (bvsge (size!32490 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!92718 d!127911))

(declare-fun d!127913 () Bool)

(declare-fun res!702513 () Bool)

(declare-fun e!598341 () Bool)

(assert (=> d!127913 (=> res!702513 e!598341)))

(assert (=> d!127913 (= res!702513 (bvsge #b00000000000000000000000000000000 (size!32490 a!3488)))))

(assert (=> d!127913 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22263) e!598341)))

(declare-fun b!1053515 () Bool)

(declare-fun e!598338 () Bool)

(declare-fun contains!6169 (List!22266 (_ BitVec 64)) Bool)

(assert (=> b!1053515 (= e!598338 (contains!6169 Nil!22263 (select (arr!31954 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1053516 () Bool)

(declare-fun e!598340 () Bool)

(declare-fun e!598339 () Bool)

(assert (=> b!1053516 (= e!598340 e!598339)))

(declare-fun c!106961 () Bool)

(assert (=> b!1053516 (= c!106961 (validKeyInArray!0 (select (arr!31954 a!3488) #b00000000000000000000000000000000)))))

(declare-fun bm!44752 () Bool)

(declare-fun call!44755 () Bool)

(assert (=> bm!44752 (= call!44755 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!106961 (Cons!22262 (select (arr!31954 a!3488) #b00000000000000000000000000000000) Nil!22263) Nil!22263)))))

(declare-fun b!1053517 () Bool)

(assert (=> b!1053517 (= e!598341 e!598340)))

(declare-fun res!702514 () Bool)

(assert (=> b!1053517 (=> (not res!702514) (not e!598340))))

(assert (=> b!1053517 (= res!702514 (not e!598338))))

(declare-fun res!702515 () Bool)

(assert (=> b!1053517 (=> (not res!702515) (not e!598338))))

(assert (=> b!1053517 (= res!702515 (validKeyInArray!0 (select (arr!31954 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1053518 () Bool)

(assert (=> b!1053518 (= e!598339 call!44755)))

(declare-fun b!1053519 () Bool)

(assert (=> b!1053519 (= e!598339 call!44755)))

(assert (= (and d!127913 (not res!702513)) b!1053517))

(assert (= (and b!1053517 res!702515) b!1053515))

(assert (= (and b!1053517 res!702514) b!1053516))

(assert (= (and b!1053516 c!106961) b!1053518))

(assert (= (and b!1053516 (not c!106961)) b!1053519))

(assert (= (or b!1053518 b!1053519) bm!44752))

(declare-fun m!973787 () Bool)

(assert (=> b!1053515 m!973787))

(assert (=> b!1053515 m!973787))

(declare-fun m!973789 () Bool)

(assert (=> b!1053515 m!973789))

(assert (=> b!1053516 m!973787))

(assert (=> b!1053516 m!973787))

(declare-fun m!973791 () Bool)

(assert (=> b!1053516 m!973791))

(assert (=> bm!44752 m!973787))

(declare-fun m!973793 () Bool)

(assert (=> bm!44752 m!973793))

(assert (=> b!1053517 m!973787))

(assert (=> b!1053517 m!973787))

(assert (=> b!1053517 m!973791))

(assert (=> b!1053428 d!127913))

(declare-fun d!127919 () Bool)

(declare-fun res!702520 () Bool)

(declare-fun e!598347 () Bool)

(assert (=> d!127919 (=> res!702520 e!598347)))

(assert (=> d!127919 (= res!702520 (= (select (arr!31954 a!3488) lt!465140) k!2747))))

(assert (=> d!127919 (= (arrayContainsKey!0 a!3488 k!2747 lt!465140) e!598347)))

(declare-fun b!1053526 () Bool)

(declare-fun e!598348 () Bool)

(assert (=> b!1053526 (= e!598347 e!598348)))

(declare-fun res!702521 () Bool)

(assert (=> b!1053526 (=> (not res!702521) (not e!598348))))

(assert (=> b!1053526 (= res!702521 (bvslt (bvadd lt!465140 #b00000000000000000000000000000001) (size!32490 a!3488)))))

(declare-fun b!1053527 () Bool)

(assert (=> b!1053527 (= e!598348 (arrayContainsKey!0 a!3488 k!2747 (bvadd lt!465140 #b00000000000000000000000000000001)))))

(assert (= (and d!127919 (not res!702520)) b!1053526))

(assert (= (and b!1053526 res!702521) b!1053527))

(declare-fun m!973801 () Bool)

(assert (=> d!127919 m!973801))

(declare-fun m!973803 () Bool)

(assert (=> b!1053527 m!973803))

(assert (=> b!1053430 d!127919))

(declare-fun d!127923 () Bool)

(assert (=> d!127923 (= (validKeyInArray!0 k!2747) (and (not (= k!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1053426 d!127923))

(declare-fun d!127927 () Bool)

(declare-fun lt!465162 () (_ BitVec 32))

(assert (=> d!127927 (and (or (bvslt lt!465162 #b00000000000000000000000000000000) (bvsge lt!465162 (size!32490 lt!465141)) (and (bvsge lt!465162 #b00000000000000000000000000000000) (bvslt lt!465162 (size!32490 lt!465141)))) (bvsge lt!465162 #b00000000000000000000000000000000) (bvslt lt!465162 (size!32490 lt!465141)) (= (select (arr!31954 lt!465141) lt!465162) k!2747))))

