; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133032 () Bool)

(assert start!133032)

(declare-fun b!1557282 () Bool)

(declare-fun e!867452 () Bool)

(declare-fun tp!112500 () Bool)

(assert (=> b!1557282 (= e!867452 tp!112500)))

(declare-fun res!1065212 () Bool)

(declare-fun e!867451 () Bool)

(assert (=> start!133032 (=> (not res!1065212) (not e!867451))))

(declare-datatypes ((B!2376 0))(
  ( (B!2377 (val!19274 Int)) )
))
(declare-datatypes ((tuple2!24924 0))(
  ( (tuple2!24925 (_1!12473 (_ BitVec 64)) (_2!12473 B!2376)) )
))
(declare-datatypes ((List!36308 0))(
  ( (Nil!36305) (Cons!36304 (h!37750 tuple2!24924) (t!51035 List!36308)) )
))
(declare-datatypes ((ListLongMap!22425 0))(
  ( (ListLongMap!22426 (toList!11228 List!36308)) )
))
(declare-fun lm!250 () ListLongMap!22425)

(declare-fun a0!50 () (_ BitVec 64))

(declare-fun contains!10196 (ListLongMap!22425 (_ BitVec 64)) Bool)

(assert (=> start!133032 (= res!1065212 (contains!10196 lm!250 a0!50))))

(assert (=> start!133032 e!867451))

(declare-fun inv!57467 (ListLongMap!22425) Bool)

(assert (=> start!133032 (and (inv!57467 lm!250) e!867452)))

(assert (=> start!133032 true))

(declare-fun tp_is_empty!38381 () Bool)

(assert (=> start!133032 tp_is_empty!38381))

(declare-fun b!1557283 () Bool)

(declare-fun res!1065211 () Bool)

(assert (=> b!1557283 (=> (not res!1065211) (not e!867451))))

(declare-fun a!524 () (_ BitVec 64))

(assert (=> b!1557283 (= res!1065211 (not (= a!524 a0!50)))))

(declare-fun b!1557284 () Bool)

(declare-fun res!1065214 () Bool)

(assert (=> b!1557284 (=> (not res!1065214) (not e!867451))))

(declare-fun containsKey!820 (List!36308 (_ BitVec 64)) Bool)

(assert (=> b!1557284 (= res!1065214 (containsKey!820 (toList!11228 lm!250) a0!50))))

(declare-fun b!1557285 () Bool)

(declare-fun res!1065213 () Bool)

(assert (=> b!1557285 (=> (not res!1065213) (not e!867451))))

(assert (=> b!1557285 (= res!1065213 (not (= a0!50 a!524)))))

(declare-fun b!1557286 () Bool)

(declare-fun b!97 () B!2376)

(declare-fun +!5020 (ListLongMap!22425 tuple2!24924) ListLongMap!22425)

(assert (=> b!1557286 (= e!867451 (not (contains!10196 (+!5020 lm!250 (tuple2!24925 a!524 b!97)) a0!50)))))

(declare-fun insertStrictlySorted!557 (List!36308 (_ BitVec 64) B!2376) List!36308)

(assert (=> b!1557286 (containsKey!820 (insertStrictlySorted!557 (toList!11228 lm!250) a!524 b!97) a0!50)))

(declare-datatypes ((Unit!51857 0))(
  ( (Unit!51858) )
))
(declare-fun lt!670529 () Unit!51857)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!3 (List!36308 (_ BitVec 64) B!2376 (_ BitVec 64)) Unit!51857)

(assert (=> b!1557286 (= lt!670529 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!3 (toList!11228 lm!250) a!524 b!97 a0!50))))

(declare-fun b!1557287 () Bool)

(declare-fun res!1065210 () Bool)

(assert (=> b!1557287 (=> (not res!1065210) (not e!867451))))

(declare-fun isStrictlySorted!958 (List!36308) Bool)

(assert (=> b!1557287 (= res!1065210 (isStrictlySorted!958 (toList!11228 lm!250)))))

(assert (= (and start!133032 res!1065212) b!1557283))

(assert (= (and b!1557283 res!1065211) b!1557287))

(assert (= (and b!1557287 res!1065210) b!1557284))

(assert (= (and b!1557284 res!1065214) b!1557285))

(assert (= (and b!1557285 res!1065213) b!1557286))

(assert (= start!133032 b!1557282))

(declare-fun m!1434453 () Bool)

(assert (=> start!133032 m!1434453))

(declare-fun m!1434455 () Bool)

(assert (=> start!133032 m!1434455))

(declare-fun m!1434457 () Bool)

(assert (=> b!1557284 m!1434457))

(declare-fun m!1434459 () Bool)

(assert (=> b!1557286 m!1434459))

(declare-fun m!1434461 () Bool)

(assert (=> b!1557286 m!1434461))

(declare-fun m!1434463 () Bool)

(assert (=> b!1557286 m!1434463))

(assert (=> b!1557286 m!1434461))

(assert (=> b!1557286 m!1434459))

(declare-fun m!1434465 () Bool)

(assert (=> b!1557286 m!1434465))

(declare-fun m!1434467 () Bool)

(assert (=> b!1557286 m!1434467))

(declare-fun m!1434469 () Bool)

(assert (=> b!1557287 m!1434469))

(push 1)

(assert tp_is_empty!38381)

(assert (not b!1557286))

(assert (not b!1557284))

(assert (not b!1557287))

(assert (not start!133032))

(assert (not b!1557282))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162423 () Bool)

(declare-fun res!1065225 () Bool)

(declare-fun e!867463 () Bool)

(assert (=> d!162423 (=> res!1065225 e!867463)))

(assert (=> d!162423 (= res!1065225 (and (is-Cons!36304 (toList!11228 lm!250)) (= (_1!12473 (h!37750 (toList!11228 lm!250))) a0!50)))))

(assert (=> d!162423 (= (containsKey!820 (toList!11228 lm!250) a0!50) e!867463)))

(declare-fun b!1557298 () Bool)

(declare-fun e!867464 () Bool)

(assert (=> b!1557298 (= e!867463 e!867464)))

(declare-fun res!1065226 () Bool)

(assert (=> b!1557298 (=> (not res!1065226) (not e!867464))))

(assert (=> b!1557298 (= res!1065226 (and (or (not (is-Cons!36304 (toList!11228 lm!250))) (bvsle (_1!12473 (h!37750 (toList!11228 lm!250))) a0!50)) (is-Cons!36304 (toList!11228 lm!250)) (bvslt (_1!12473 (h!37750 (toList!11228 lm!250))) a0!50)))))

(declare-fun b!1557299 () Bool)

(assert (=> b!1557299 (= e!867464 (containsKey!820 (t!51035 (toList!11228 lm!250)) a0!50))))

(assert (= (and d!162423 (not res!1065225)) b!1557298))

(assert (= (and b!1557298 res!1065226) b!1557299))

(declare-fun m!1434473 () Bool)

(assert (=> b!1557299 m!1434473))

(assert (=> b!1557284 d!162423))

(declare-fun d!162431 () Bool)

(declare-fun res!1065237 () Bool)

(declare-fun e!867475 () Bool)

(assert (=> d!162431 (=> res!1065237 e!867475)))

(assert (=> d!162431 (= res!1065237 (or (is-Nil!36305 (toList!11228 lm!250)) (is-Nil!36305 (t!51035 (toList!11228 lm!250)))))))

(assert (=> d!162431 (= (isStrictlySorted!958 (toList!11228 lm!250)) e!867475)))

(declare-fun b!1557310 () Bool)

(declare-fun e!867476 () Bool)

(assert (=> b!1557310 (= e!867475 e!867476)))

(declare-fun res!1065238 () Bool)

(assert (=> b!1557310 (=> (not res!1065238) (not e!867476))))

(assert (=> b!1557310 (= res!1065238 (bvslt (_1!12473 (h!37750 (toList!11228 lm!250))) (_1!12473 (h!37750 (t!51035 (toList!11228 lm!250))))))))

(declare-fun b!1557311 () Bool)

(assert (=> b!1557311 (= e!867476 (isStrictlySorted!958 (t!51035 (toList!11228 lm!250))))))

(assert (= (and d!162431 (not res!1065237)) b!1557310))

(assert (= (and b!1557310 res!1065238) b!1557311))

(declare-fun m!1434477 () Bool)

(assert (=> b!1557311 m!1434477))

(assert (=> b!1557287 d!162431))

(declare-fun d!162435 () Bool)

(declare-fun e!867494 () Bool)

(assert (=> d!162435 e!867494))

(declare-fun res!1065247 () Bool)

(assert (=> d!162435 (=> res!1065247 e!867494)))

(declare-fun lt!670562 () Bool)

(assert (=> d!162435 (= res!1065247 (not lt!670562))))

(declare-fun lt!670565 () Bool)

(assert (=> d!162435 (= lt!670562 lt!670565)))

(declare-fun lt!670564 () Unit!51857)

(declare-fun e!867493 () Unit!51857)

(assert (=> d!162435 (= lt!670564 e!867493)))

(declare-fun c!143948 () Bool)

(assert (=> d!162435 (= c!143948 lt!670565)))

(assert (=> d!162435 (= lt!670565 (containsKey!820 (toList!11228 lm!250) a0!50))))

(assert (=> d!162435 (= (contains!10196 lm!250 a0!50) lt!670562)))

(declare-fun b!1557336 () Bool)

(declare-fun lt!670563 () Unit!51857)

(assert (=> b!1557336 (= e!867493 lt!670563)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!527 (List!36308 (_ BitVec 64)) Unit!51857)

(assert (=> b!1557336 (= lt!670563 (lemmaContainsKeyImpliesGetValueByKeyDefined!527 (toList!11228 lm!250) a0!50))))

(declare-datatypes ((Option!862 0))(
  ( (Some!861 (v!22052 B!2376)) (None!860) )
))
(declare-fun isDefined!575 (Option!862) Bool)

(declare-fun getValueByKey!786 (List!36308 (_ BitVec 64)) Option!862)

(assert (=> b!1557336 (isDefined!575 (getValueByKey!786 (toList!11228 lm!250) a0!50))))

(declare-fun b!1557337 () Bool)

(declare-fun Unit!51861 () Unit!51857)

(assert (=> b!1557337 (= e!867493 Unit!51861)))

(declare-fun b!1557338 () Bool)

(assert (=> b!1557338 (= e!867494 (isDefined!575 (getValueByKey!786 (toList!11228 lm!250) a0!50)))))

(assert (= (and d!162435 c!143948) b!1557336))

(assert (= (and d!162435 (not c!143948)) b!1557337))

(assert (= (and d!162435 (not res!1065247)) b!1557338))

(assert (=> d!162435 m!1434457))

(declare-fun m!1434491 () Bool)

(assert (=> b!1557336 m!1434491))

(declare-fun m!1434493 () Bool)

(assert (=> b!1557336 m!1434493))

(assert (=> b!1557336 m!1434493))

(declare-fun m!1434495 () Bool)

(assert (=> b!1557336 m!1434495))

(assert (=> b!1557338 m!1434493))

(assert (=> b!1557338 m!1434493))

(assert (=> b!1557338 m!1434495))

(assert (=> start!133032 d!162435))

(declare-fun d!162445 () Bool)

(assert (=> d!162445 (= (inv!57467 lm!250) (isStrictlySorted!958 (toList!11228 lm!250)))))

(declare-fun bs!44767 () Bool)

(assert (= bs!44767 d!162445))

(assert (=> bs!44767 m!1434469))

(assert (=> start!133032 d!162445))

(declare-fun e!867539 () List!36308)

(declare-fun b!1557418 () Bool)

(assert (=> b!1557418 (= e!867539 (insertStrictlySorted!557 (t!51035 (toList!11228 lm!250)) a!524 b!97))))

(declare-fun b!1557419 () Bool)

(declare-fun e!867542 () List!36308)

(declare-fun call!71685 () List!36308)

(assert (=> b!1557419 (= e!867542 call!71685)))

(declare-fun b!1557420 () Bool)

(assert (=> b!1557420 (= e!867542 call!71685)))

(declare-fun b!1557421 () Bool)

(declare-fun e!867541 () List!36308)

(declare-fun e!867538 () List!36308)

(assert (=> b!1557421 (= e!867541 e!867538)))

(declare-fun c!143978 () Bool)

(assert (=> b!1557421 (= c!143978 (and (is-Cons!36304 (toList!11228 lm!250)) (= (_1!12473 (h!37750 (toList!11228 lm!250))) a!524)))))

(declare-fun b!1557422 () Bool)

(declare-fun c!143979 () Bool)

(assert (=> b!1557422 (= c!143979 (and (is-Cons!36304 (toList!11228 lm!250)) (bvsgt (_1!12473 (h!37750 (toList!11228 lm!250))) a!524)))))

(assert (=> b!1557422 (= e!867538 e!867542)))

(declare-fun bm!71680 () Bool)

(declare-fun call!71683 () List!36308)

(declare-fun call!71684 () List!36308)

(assert (=> bm!71680 (= call!71683 call!71684)))

(declare-fun b!1557423 () Bool)

(assert (=> b!1557423 (= e!867541 call!71684)))

(declare-fun b!1557424 () Bool)

(declare-fun lt!670577 () List!36308)

(declare-fun e!867540 () Bool)

(declare-fun contains!10199 (List!36308 tuple2!24924) Bool)

(assert (=> b!1557424 (= e!867540 (contains!10199 lt!670577 (tuple2!24925 a!524 b!97)))))

(declare-fun b!1557425 () Bool)

(assert (=> b!1557425 (= e!867539 (ite c!143978 (t!51035 (toList!11228 lm!250)) (ite c!143979 (Cons!36304 (h!37750 (toList!11228 lm!250)) (t!51035 (toList!11228 lm!250))) Nil!36305)))))

(declare-fun b!1557426 () Bool)

(assert (=> b!1557426 (= e!867538 call!71683)))

(declare-fun c!143980 () Bool)

(declare-fun bm!71681 () Bool)

(declare-fun $colon$colon!974 (List!36308 tuple2!24924) List!36308)

(assert (=> bm!71681 (= call!71684 ($colon$colon!974 e!867539 (ite c!143980 (h!37750 (toList!11228 lm!250)) (tuple2!24925 a!524 b!97))))))

(declare-fun c!143981 () Bool)

(assert (=> bm!71681 (= c!143981 c!143980)))

(declare-fun d!162447 () Bool)

(assert (=> d!162447 e!867540))

(declare-fun res!1065269 () Bool)

(assert (=> d!162447 (=> (not res!1065269) (not e!867540))))

(assert (=> d!162447 (= res!1065269 (isStrictlySorted!958 lt!670577))))

(assert (=> d!162447 (= lt!670577 e!867541)))

(assert (=> d!162447 (= c!143980 (and (is-Cons!36304 (toList!11228 lm!250)) (bvslt (_1!12473 (h!37750 (toList!11228 lm!250))) a!524)))))

(assert (=> d!162447 (isStrictlySorted!958 (toList!11228 lm!250))))

(assert (=> d!162447 (= (insertStrictlySorted!557 (toList!11228 lm!250) a!524 b!97) lt!670577)))

(declare-fun bm!71682 () Bool)

(assert (=> bm!71682 (= call!71685 call!71683)))

(declare-fun b!1557427 () Bool)

(declare-fun res!1065270 () Bool)

(assert (=> b!1557427 (=> (not res!1065270) (not e!867540))))

(assert (=> b!1557427 (= res!1065270 (containsKey!820 lt!670577 a!524))))

(assert (= (and d!162447 c!143980) b!1557423))

(assert (= (and d!162447 (not c!143980)) b!1557421))

(assert (= (and b!1557421 c!143978) b!1557426))

(assert (= (and b!1557421 (not c!143978)) b!1557422))

(assert (= (and b!1557422 c!143979) b!1557419))

(assert (= (and b!1557422 (not c!143979)) b!1557420))

(assert (= (or b!1557419 b!1557420) bm!71682))

(assert (= (or b!1557426 bm!71682) bm!71680))

(assert (= (or b!1557423 bm!71680) bm!71681))

(assert (= (and bm!71681 c!143981) b!1557418))

(assert (= (and bm!71681 (not c!143981)) b!1557425))

(assert (= (and d!162447 res!1065269) b!1557427))

(assert (= (and b!1557427 res!1065270) b!1557424))

(declare-fun m!1434517 () Bool)

(assert (=> b!1557418 m!1434517))

(declare-fun m!1434519 () Bool)

(assert (=> b!1557427 m!1434519))

(declare-fun m!1434521 () Bool)

(assert (=> bm!71681 m!1434521))

(declare-fun m!1434523 () Bool)

(assert (=> b!1557424 m!1434523))

(declare-fun m!1434525 () Bool)

(assert (=> d!162447 m!1434525))

(assert (=> d!162447 m!1434469))

(assert (=> b!1557286 d!162447))

(declare-fun d!162455 () Bool)

(declare-fun e!867544 () Bool)

(assert (=> d!162455 e!867544))

(declare-fun res!1065271 () Bool)

(assert (=> d!162455 (=> res!1065271 e!867544)))

(declare-fun lt!670578 () Bool)

(assert (=> d!162455 (= res!1065271 (not lt!670578))))

(declare-fun lt!670581 () Bool)

(assert (=> d!162455 (= lt!670578 lt!670581)))

(declare-fun lt!670580 () Unit!51857)

(declare-fun e!867543 () Unit!51857)

(assert (=> d!162455 (= lt!670580 e!867543)))

(declare-fun c!143982 () Bool)

(assert (=> d!162455 (= c!143982 lt!670581)))

(assert (=> d!162455 (= lt!670581 (containsKey!820 (toList!11228 (+!5020 lm!250 (tuple2!24925 a!524 b!97))) a0!50))))

(assert (=> d!162455 (= (contains!10196 (+!5020 lm!250 (tuple2!24925 a!524 b!97)) a0!50) lt!670578)))

(declare-fun b!1557428 () Bool)

(declare-fun lt!670579 () Unit!51857)

(assert (=> b!1557428 (= e!867543 lt!670579)))

(assert (=> b!1557428 (= lt!670579 (lemmaContainsKeyImpliesGetValueByKeyDefined!527 (toList!11228 (+!5020 lm!250 (tuple2!24925 a!524 b!97))) a0!50))))

(assert (=> b!1557428 (isDefined!575 (getValueByKey!786 (toList!11228 (+!5020 lm!250 (tuple2!24925 a!524 b!97))) a0!50))))

(declare-fun b!1557429 () Bool)

(declare-fun Unit!51864 () Unit!51857)

(assert (=> b!1557429 (= e!867543 Unit!51864)))

(declare-fun b!1557430 () Bool)

(assert (=> b!1557430 (= e!867544 (isDefined!575 (getValueByKey!786 (toList!11228 (+!5020 lm!250 (tuple2!24925 a!524 b!97))) a0!50)))))

(assert (= (and d!162455 c!143982) b!1557428))

(assert (= (and d!162455 (not c!143982)) b!1557429))

(assert (= (and d!162455 (not res!1065271)) b!1557430))

(declare-fun m!1434527 () Bool)

(assert (=> d!162455 m!1434527))

(declare-fun m!1434529 () Bool)

(assert (=> b!1557428 m!1434529))

(declare-fun m!1434531 () Bool)

(assert (=> b!1557428 m!1434531))

(assert (=> b!1557428 m!1434531))

(declare-fun m!1434533 () Bool)

(assert (=> b!1557428 m!1434533))

(assert (=> b!1557430 m!1434531))

(assert (=> b!1557430 m!1434531))

(assert (=> b!1557430 m!1434533))

(assert (=> b!1557286 d!162455))

(declare-fun d!162457 () Bool)

(assert (=> d!162457 (containsKey!820 (insertStrictlySorted!557 (toList!11228 lm!250) a!524 b!97) a0!50)))

(declare-fun lt!670592 () Unit!51857)

(declare-fun choose!2066 (List!36308 (_ BitVec 64) B!2376 (_ BitVec 64)) Unit!51857)

(assert (=> d!162457 (= lt!670592 (choose!2066 (toList!11228 lm!250) a!524 b!97 a0!50))))

(declare-fun e!867561 () Bool)

(assert (=> d!162457 e!867561))

(declare-fun res!1065289 () Bool)

(assert (=> d!162457 (=> (not res!1065289) (not e!867561))))

(assert (=> d!162457 (= res!1065289 (isStrictlySorted!958 (toList!11228 lm!250)))))

(assert (=> d!162457 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!3 (toList!11228 lm!250) a!524 b!97 a0!50) lt!670592)))

(declare-fun b!1557458 () Bool)

(declare-fun res!1065290 () Bool)

(assert (=> b!1557458 (=> (not res!1065290) (not e!867561))))

(assert (=> b!1557458 (= res!1065290 (containsKey!820 (toList!11228 lm!250) a0!50))))

(declare-fun b!1557459 () Bool)

(assert (=> b!1557459 (= e!867561 (not (= a0!50 a!524)))))

(assert (= (and d!162457 res!1065289) b!1557458))

(assert (= (and b!1557458 res!1065290) b!1557459))

(assert (=> d!162457 m!1434461))

(assert (=> d!162457 m!1434461))

(assert (=> d!162457 m!1434463))

(declare-fun m!1434555 () Bool)

(assert (=> d!162457 m!1434555))

(assert (=> d!162457 m!1434469))

(assert (=> b!1557458 m!1434457))

(assert (=> b!1557286 d!162457))

(declare-fun d!162465 () Bool)

(declare-fun res!1065295 () Bool)

(declare-fun e!867564 () Bool)

(assert (=> d!162465 (=> res!1065295 e!867564)))

(assert (=> d!162465 (= res!1065295 (and (is-Cons!36304 (insertStrictlySorted!557 (toList!11228 lm!250) a!524 b!97)) (= (_1!12473 (h!37750 (insertStrictlySorted!557 (toList!11228 lm!250) a!524 b!97))) a0!50)))))

(assert (=> d!162465 (= (containsKey!820 (insertStrictlySorted!557 (toList!11228 lm!250) a!524 b!97) a0!50) e!867564)))

(declare-fun b!1557464 () Bool)

(declare-fun e!867565 () Bool)

(assert (=> b!1557464 (= e!867564 e!867565)))

(declare-fun res!1065296 () Bool)

(assert (=> b!1557464 (=> (not res!1065296) (not e!867565))))

(assert (=> b!1557464 (= res!1065296 (and (or (not (is-Cons!36304 (insertStrictlySorted!557 (toList!11228 lm!250) a!524 b!97))) (bvsle (_1!12473 (h!37750 (insertStrictlySorted!557 (toList!11228 lm!250) a!524 b!97))) a0!50)) (is-Cons!36304 (insertStrictlySorted!557 (toList!11228 lm!250) a!524 b!97)) (bvslt (_1!12473 (h!37750 (insertStrictlySorted!557 (toList!11228 lm!250) a!524 b!97))) a0!50)))))

