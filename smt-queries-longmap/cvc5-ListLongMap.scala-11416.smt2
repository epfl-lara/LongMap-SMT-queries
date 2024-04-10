; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133028 () Bool)

(assert start!133028)

(declare-fun b!1557246 () Bool)

(declare-fun res!1065180 () Bool)

(declare-fun e!867439 () Bool)

(assert (=> b!1557246 (=> (not res!1065180) (not e!867439))))

(declare-fun a!524 () (_ BitVec 64))

(declare-fun a0!50 () (_ BitVec 64))

(assert (=> b!1557246 (= res!1065180 (not (= a!524 a0!50)))))

(declare-fun b!1557247 () Bool)

(declare-fun res!1065183 () Bool)

(assert (=> b!1557247 (=> (not res!1065183) (not e!867439))))

(declare-datatypes ((B!2372 0))(
  ( (B!2373 (val!19272 Int)) )
))
(declare-datatypes ((tuple2!24920 0))(
  ( (tuple2!24921 (_1!12471 (_ BitVec 64)) (_2!12471 B!2372)) )
))
(declare-datatypes ((List!36306 0))(
  ( (Nil!36303) (Cons!36302 (h!37748 tuple2!24920) (t!51033 List!36306)) )
))
(declare-datatypes ((ListLongMap!22421 0))(
  ( (ListLongMap!22422 (toList!11226 List!36306)) )
))
(declare-fun lm!250 () ListLongMap!22421)

(declare-fun containsKey!818 (List!36306 (_ BitVec 64)) Bool)

(assert (=> b!1557247 (= res!1065183 (containsKey!818 (toList!11226 lm!250) a0!50))))

(declare-fun res!1065181 () Bool)

(assert (=> start!133028 (=> (not res!1065181) (not e!867439))))

(declare-fun contains!10194 (ListLongMap!22421 (_ BitVec 64)) Bool)

(assert (=> start!133028 (= res!1065181 (contains!10194 lm!250 a0!50))))

(assert (=> start!133028 e!867439))

(declare-fun e!867440 () Bool)

(declare-fun inv!57465 (ListLongMap!22421) Bool)

(assert (=> start!133028 (and (inv!57465 lm!250) e!867440)))

(assert (=> start!133028 true))

(declare-fun tp_is_empty!38377 () Bool)

(assert (=> start!133028 tp_is_empty!38377))

(declare-fun b!1557248 () Bool)

(declare-fun res!1065184 () Bool)

(assert (=> b!1557248 (=> (not res!1065184) (not e!867439))))

(declare-fun isStrictlySorted!956 (List!36306) Bool)

(assert (=> b!1557248 (= res!1065184 (isStrictlySorted!956 (toList!11226 lm!250)))))

(declare-fun b!1557249 () Bool)

(declare-fun tp!112494 () Bool)

(assert (=> b!1557249 (= e!867440 tp!112494)))

(declare-fun b!1557250 () Bool)

(declare-fun res!1065182 () Bool)

(assert (=> b!1557250 (=> (not res!1065182) (not e!867439))))

(assert (=> b!1557250 (= res!1065182 (not (= a0!50 a!524)))))

(declare-fun b!97 () B!2372)

(declare-fun b!1557251 () Bool)

(declare-fun +!5018 (ListLongMap!22421 tuple2!24920) ListLongMap!22421)

(assert (=> b!1557251 (= e!867439 (not (contains!10194 (+!5018 lm!250 (tuple2!24921 a!524 b!97)) a0!50)))))

(declare-fun insertStrictlySorted!555 (List!36306 (_ BitVec 64) B!2372) List!36306)

(assert (=> b!1557251 (containsKey!818 (insertStrictlySorted!555 (toList!11226 lm!250) a!524 b!97) a0!50)))

(declare-datatypes ((Unit!51853 0))(
  ( (Unit!51854) )
))
(declare-fun lt!670523 () Unit!51853)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!1 (List!36306 (_ BitVec 64) B!2372 (_ BitVec 64)) Unit!51853)

(assert (=> b!1557251 (= lt!670523 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!1 (toList!11226 lm!250) a!524 b!97 a0!50))))

(assert (= (and start!133028 res!1065181) b!1557246))

(assert (= (and b!1557246 res!1065180) b!1557248))

(assert (= (and b!1557248 res!1065184) b!1557247))

(assert (= (and b!1557247 res!1065183) b!1557250))

(assert (= (and b!1557250 res!1065182) b!1557251))

(assert (= start!133028 b!1557249))

(declare-fun m!1434417 () Bool)

(assert (=> b!1557247 m!1434417))

(declare-fun m!1434419 () Bool)

(assert (=> start!133028 m!1434419))

(declare-fun m!1434421 () Bool)

(assert (=> start!133028 m!1434421))

(declare-fun m!1434423 () Bool)

(assert (=> b!1557248 m!1434423))

(declare-fun m!1434425 () Bool)

(assert (=> b!1557251 m!1434425))

(declare-fun m!1434427 () Bool)

(assert (=> b!1557251 m!1434427))

(declare-fun m!1434429 () Bool)

(assert (=> b!1557251 m!1434429))

(assert (=> b!1557251 m!1434427))

(assert (=> b!1557251 m!1434425))

(declare-fun m!1434431 () Bool)

(assert (=> b!1557251 m!1434431))

(declare-fun m!1434433 () Bool)

(assert (=> b!1557251 m!1434433))

(push 1)

(assert (not b!1557251))

(assert tp_is_empty!38377)

(assert (not b!1557247))

(assert (not b!1557249))

(assert (not start!133028))

(assert (not b!1557248))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162427 () Bool)

(declare-fun res!1065231 () Bool)

(declare-fun e!867469 () Bool)

(assert (=> d!162427 (=> res!1065231 e!867469)))

(assert (=> d!162427 (= res!1065231 (or (is-Nil!36303 (toList!11226 lm!250)) (is-Nil!36303 (t!51033 (toList!11226 lm!250)))))))

(assert (=> d!162427 (= (isStrictlySorted!956 (toList!11226 lm!250)) e!867469)))

(declare-fun b!1557304 () Bool)

(declare-fun e!867470 () Bool)

(assert (=> b!1557304 (= e!867469 e!867470)))

(declare-fun res!1065232 () Bool)

(assert (=> b!1557304 (=> (not res!1065232) (not e!867470))))

(assert (=> b!1557304 (= res!1065232 (bvslt (_1!12471 (h!37748 (toList!11226 lm!250))) (_1!12471 (h!37748 (t!51033 (toList!11226 lm!250))))))))

(declare-fun b!1557305 () Bool)

(assert (=> b!1557305 (= e!867470 (isStrictlySorted!956 (t!51033 (toList!11226 lm!250))))))

(assert (= (and d!162427 (not res!1065231)) b!1557304))

(assert (= (and b!1557304 res!1065232) b!1557305))

(declare-fun m!1434475 () Bool)

(assert (=> b!1557305 m!1434475))

(assert (=> b!1557248 d!162427))

(declare-fun d!162433 () Bool)

(declare-fun e!867490 () Bool)

(assert (=> d!162433 e!867490))

(declare-fun res!1065244 () Bool)

(assert (=> d!162433 (=> res!1065244 e!867490)))

(declare-fun lt!670558 () Bool)

(assert (=> d!162433 (= res!1065244 (not lt!670558))))

(declare-fun lt!670559 () Bool)

(assert (=> d!162433 (= lt!670558 lt!670559)))

(declare-fun lt!670561 () Unit!51853)

(declare-fun e!867489 () Unit!51853)

(assert (=> d!162433 (= lt!670561 e!867489)))

(declare-fun c!143947 () Bool)

(assert (=> d!162433 (= c!143947 lt!670559)))

(assert (=> d!162433 (= lt!670559 (containsKey!818 (toList!11226 lm!250) a0!50))))

(assert (=> d!162433 (= (contains!10194 lm!250 a0!50) lt!670558)))

(declare-fun b!1557331 () Bool)

(declare-fun lt!670560 () Unit!51853)

(assert (=> b!1557331 (= e!867489 lt!670560)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!526 (List!36306 (_ BitVec 64)) Unit!51853)

(assert (=> b!1557331 (= lt!670560 (lemmaContainsKeyImpliesGetValueByKeyDefined!526 (toList!11226 lm!250) a0!50))))

(declare-datatypes ((Option!861 0))(
  ( (Some!860 (v!22051 B!2372)) (None!859) )
))
(declare-fun isDefined!574 (Option!861) Bool)

(declare-fun getValueByKey!785 (List!36306 (_ BitVec 64)) Option!861)

(assert (=> b!1557331 (isDefined!574 (getValueByKey!785 (toList!11226 lm!250) a0!50))))

(declare-fun b!1557332 () Bool)

(declare-fun Unit!51860 () Unit!51853)

(assert (=> b!1557332 (= e!867489 Unit!51860)))

(declare-fun b!1557333 () Bool)

(assert (=> b!1557333 (= e!867490 (isDefined!574 (getValueByKey!785 (toList!11226 lm!250) a0!50)))))

(assert (= (and d!162433 c!143947) b!1557331))

(assert (= (and d!162433 (not c!143947)) b!1557332))

(assert (= (and d!162433 (not res!1065244)) b!1557333))

(assert (=> d!162433 m!1434417))

(declare-fun m!1434485 () Bool)

(assert (=> b!1557331 m!1434485))

(declare-fun m!1434487 () Bool)

(assert (=> b!1557331 m!1434487))

(assert (=> b!1557331 m!1434487))

(declare-fun m!1434489 () Bool)

(assert (=> b!1557331 m!1434489))

(assert (=> b!1557333 m!1434487))

(assert (=> b!1557333 m!1434487))

(assert (=> b!1557333 m!1434489))

(assert (=> start!133028 d!162433))

(declare-fun d!162441 () Bool)

(assert (=> d!162441 (= (inv!57465 lm!250) (isStrictlySorted!956 (toList!11226 lm!250)))))

(declare-fun bs!44766 () Bool)

(assert (= bs!44766 d!162441))

(assert (=> bs!44766 m!1434423))

(assert (=> start!133028 d!162441))

(declare-fun d!162443 () Bool)

(declare-fun res!1065252 () Bool)

(declare-fun e!867499 () Bool)

(assert (=> d!162443 (=> res!1065252 e!867499)))

(assert (=> d!162443 (= res!1065252 (and (is-Cons!36302 (toList!11226 lm!250)) (= (_1!12471 (h!37748 (toList!11226 lm!250))) a0!50)))))

(assert (=> d!162443 (= (containsKey!818 (toList!11226 lm!250) a0!50) e!867499)))

(declare-fun b!1557343 () Bool)

(declare-fun e!867500 () Bool)

(assert (=> b!1557343 (= e!867499 e!867500)))

(declare-fun res!1065253 () Bool)

(assert (=> b!1557343 (=> (not res!1065253) (not e!867500))))

(assert (=> b!1557343 (= res!1065253 (and (or (not (is-Cons!36302 (toList!11226 lm!250))) (bvsle (_1!12471 (h!37748 (toList!11226 lm!250))) a0!50)) (is-Cons!36302 (toList!11226 lm!250)) (bvslt (_1!12471 (h!37748 (toList!11226 lm!250))) a0!50)))))

(declare-fun b!1557344 () Bool)

(assert (=> b!1557344 (= e!867500 (containsKey!818 (t!51033 (toList!11226 lm!250)) a0!50))))

(assert (= (and d!162443 (not res!1065252)) b!1557343))

(assert (= (and b!1557343 res!1065253) b!1557344))

(declare-fun m!1434497 () Bool)

(assert (=> b!1557344 m!1434497))

(assert (=> b!1557247 d!162443))

(declare-fun b!1557431 () Bool)

(declare-fun e!867549 () List!36306)

(declare-fun call!71687 () List!36306)

(assert (=> b!1557431 (= e!867549 call!71687)))

(declare-fun b!1557432 () Bool)

(declare-fun e!867548 () List!36306)

(assert (=> b!1557432 (= e!867548 (insertStrictlySorted!555 (t!51033 (toList!11226 lm!250)) a!524 b!97))))

(declare-fun b!1557433 () Bool)

(declare-fun e!867546 () List!36306)

(declare-fun call!71688 () List!36306)

(assert (=> b!1557433 (= e!867546 call!71688)))

(declare-fun bm!71683 () Bool)

(declare-fun call!71686 () List!36306)

(assert (=> bm!71683 (= call!71686 call!71688)))

(declare-fun d!162449 () Bool)

(declare-fun e!867545 () Bool)

(assert (=> d!162449 e!867545))

(declare-fun res!1065273 () Bool)

(assert (=> d!162449 (=> (not res!1065273) (not e!867545))))

(declare-fun lt!670582 () List!36306)

(assert (=> d!162449 (= res!1065273 (isStrictlySorted!956 lt!670582))))

(assert (=> d!162449 (= lt!670582 e!867546)))

(declare-fun c!143986 () Bool)

(assert (=> d!162449 (= c!143986 (and (is-Cons!36302 (toList!11226 lm!250)) (bvslt (_1!12471 (h!37748 (toList!11226 lm!250))) a!524)))))

(assert (=> d!162449 (isStrictlySorted!956 (toList!11226 lm!250))))

(assert (=> d!162449 (= (insertStrictlySorted!555 (toList!11226 lm!250) a!524 b!97) lt!670582)))

(declare-fun b!1557434 () Bool)

(declare-fun res!1065272 () Bool)

(assert (=> b!1557434 (=> (not res!1065272) (not e!867545))))

(assert (=> b!1557434 (= res!1065272 (containsKey!818 lt!670582 a!524))))

(declare-fun b!1557435 () Bool)

(declare-fun contains!10198 (List!36306 tuple2!24920) Bool)

(assert (=> b!1557435 (= e!867545 (contains!10198 lt!670582 (tuple2!24921 a!524 b!97)))))

(declare-fun b!1557436 () Bool)

(declare-fun e!867547 () List!36306)

(assert (=> b!1557436 (= e!867546 e!867547)))

(declare-fun c!143985 () Bool)

(assert (=> b!1557436 (= c!143985 (and (is-Cons!36302 (toList!11226 lm!250)) (= (_1!12471 (h!37748 (toList!11226 lm!250))) a!524)))))

(declare-fun b!1557437 () Bool)

(assert (=> b!1557437 (= e!867547 call!71686)))

(declare-fun b!1557438 () Bool)

(assert (=> b!1557438 (= e!867549 call!71687)))

(declare-fun b!1557439 () Bool)

(declare-fun c!143983 () Bool)

(assert (=> b!1557439 (= e!867548 (ite c!143985 (t!51033 (toList!11226 lm!250)) (ite c!143983 (Cons!36302 (h!37748 (toList!11226 lm!250)) (t!51033 (toList!11226 lm!250))) Nil!36303)))))

(declare-fun bm!71684 () Bool)

(assert (=> bm!71684 (= call!71687 call!71686)))

(declare-fun bm!71685 () Bool)

(declare-fun $colon$colon!973 (List!36306 tuple2!24920) List!36306)

(assert (=> bm!71685 (= call!71688 ($colon$colon!973 e!867548 (ite c!143986 (h!37748 (toList!11226 lm!250)) (tuple2!24921 a!524 b!97))))))

(declare-fun c!143984 () Bool)

(assert (=> bm!71685 (= c!143984 c!143986)))

(declare-fun b!1557440 () Bool)

(assert (=> b!1557440 (= c!143983 (and (is-Cons!36302 (toList!11226 lm!250)) (bvsgt (_1!12471 (h!37748 (toList!11226 lm!250))) a!524)))))

(assert (=> b!1557440 (= e!867547 e!867549)))

(assert (= (and d!162449 c!143986) b!1557433))

(assert (= (and d!162449 (not c!143986)) b!1557436))

(assert (= (and b!1557436 c!143985) b!1557437))

(assert (= (and b!1557436 (not c!143985)) b!1557440))

(assert (= (and b!1557440 c!143983) b!1557438))

(assert (= (and b!1557440 (not c!143983)) b!1557431))

(assert (= (or b!1557438 b!1557431) bm!71684))

(assert (= (or b!1557437 bm!71684) bm!71683))

(assert (= (or b!1557433 bm!71683) bm!71685))

(assert (= (and bm!71685 c!143984) b!1557432))

(assert (= (and bm!71685 (not c!143984)) b!1557439))

(assert (= (and d!162449 res!1065273) b!1557434))

(assert (= (and b!1557434 res!1065272) b!1557435))

(declare-fun m!1434535 () Bool)

(assert (=> b!1557434 m!1434535))

(declare-fun m!1434537 () Bool)

(assert (=> b!1557435 m!1434537))

(declare-fun m!1434539 () Bool)

(assert (=> b!1557432 m!1434539))

(declare-fun m!1434541 () Bool)

(assert (=> bm!71685 m!1434541))

(declare-fun m!1434543 () Bool)

(assert (=> d!162449 m!1434543))

(assert (=> d!162449 m!1434423))

(assert (=> b!1557251 d!162449))

(declare-fun d!162459 () Bool)

(declare-fun e!867553 () Bool)

(assert (=> d!162459 e!867553))

(declare-fun res!1065278 () Bool)

(assert (=> d!162459 (=> res!1065278 e!867553)))

(declare-fun lt!670585 () Bool)

(assert (=> d!162459 (= res!1065278 (not lt!670585))))

(declare-fun lt!670586 () Bool)

(assert (=> d!162459 (= lt!670585 lt!670586)))

(declare-fun lt!670588 () Unit!51853)

(declare-fun e!867552 () Unit!51853)

(assert (=> d!162459 (= lt!670588 e!867552)))

(declare-fun c!143987 () Bool)

(assert (=> d!162459 (= c!143987 lt!670586)))

(assert (=> d!162459 (= lt!670586 (containsKey!818 (toList!11226 (+!5018 lm!250 (tuple2!24921 a!524 b!97))) a0!50))))

(assert (=> d!162459 (= (contains!10194 (+!5018 lm!250 (tuple2!24921 a!524 b!97)) a0!50) lt!670585)))

(declare-fun b!1557445 () Bool)

(declare-fun lt!670587 () Unit!51853)

(assert (=> b!1557445 (= e!867552 lt!670587)))

(assert (=> b!1557445 (= lt!670587 (lemmaContainsKeyImpliesGetValueByKeyDefined!526 (toList!11226 (+!5018 lm!250 (tuple2!24921 a!524 b!97))) a0!50))))

(assert (=> b!1557445 (isDefined!574 (getValueByKey!785 (toList!11226 (+!5018 lm!250 (tuple2!24921 a!524 b!97))) a0!50))))

(declare-fun b!1557446 () Bool)

(declare-fun Unit!51863 () Unit!51853)

(assert (=> b!1557446 (= e!867552 Unit!51863)))

(declare-fun b!1557447 () Bool)

(assert (=> b!1557447 (= e!867553 (isDefined!574 (getValueByKey!785 (toList!11226 (+!5018 lm!250 (tuple2!24921 a!524 b!97))) a0!50)))))

(assert (= (and d!162459 c!143987) b!1557445))

(assert (= (and d!162459 (not c!143987)) b!1557446))

(assert (= (and d!162459 (not res!1065278)) b!1557447))

(declare-fun m!1434545 () Bool)

(assert (=> d!162459 m!1434545))

(declare-fun m!1434547 () Bool)

(assert (=> b!1557445 m!1434547))

(declare-fun m!1434549 () Bool)

(assert (=> b!1557445 m!1434549))

(assert (=> b!1557445 m!1434549))

(declare-fun m!1434551 () Bool)

(assert (=> b!1557445 m!1434551))

(assert (=> b!1557447 m!1434549))

(assert (=> b!1557447 m!1434549))

(assert (=> b!1557447 m!1434551))

(assert (=> b!1557251 d!162459))

(declare-fun d!162461 () Bool)

(assert (=> d!162461 (containsKey!818 (insertStrictlySorted!555 (toList!11226 lm!250) a!524 b!97) a0!50)))

(declare-fun lt!670595 () Unit!51853)

(declare-fun choose!2065 (List!36306 (_ BitVec 64) B!2372 (_ BitVec 64)) Unit!51853)

(assert (=> d!162461 (= lt!670595 (choose!2065 (toList!11226 lm!250) a!524 b!97 a0!50))))

(declare-fun e!867568 () Bool)

(assert (=> d!162461 e!867568))

(declare-fun res!1065299 () Bool)

(assert (=> d!162461 (=> (not res!1065299) (not e!867568))))

(assert (=> d!162461 (= res!1065299 (isStrictlySorted!956 (toList!11226 lm!250)))))

(assert (=> d!162461 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!1 (toList!11226 lm!250) a!524 b!97 a0!50) lt!670595)))

(declare-fun b!1557468 () Bool)

(declare-fun res!1065300 () Bool)

(assert (=> b!1557468 (=> (not res!1065300) (not e!867568))))

(assert (=> b!1557468 (= res!1065300 (containsKey!818 (toList!11226 lm!250) a0!50))))

(declare-fun b!1557469 () Bool)

(assert (=> b!1557469 (= e!867568 (not (= a0!50 a!524)))))

(assert (= (and d!162461 res!1065299) b!1557468))

(assert (= (and b!1557468 res!1065300) b!1557469))

(assert (=> d!162461 m!1434427))

(assert (=> d!162461 m!1434427))

(assert (=> d!162461 m!1434429))

(declare-fun m!1434561 () Bool)

(assert (=> d!162461 m!1434561))

(assert (=> d!162461 m!1434423))

(assert (=> b!1557468 m!1434417))

(assert (=> b!1557251 d!162461))

(declare-fun d!162471 () Bool)

(declare-fun res!1065301 () Bool)

(declare-fun e!867569 () Bool)

(assert (=> d!162471 (=> res!1065301 e!867569)))

(assert (=> d!162471 (= res!1065301 (and (is-Cons!36302 (insertStrictlySorted!555 (toList!11226 lm!250) a!524 b!97)) (= (_1!12471 (h!37748 (insertStrictlySorted!555 (toList!11226 lm!250) a!524 b!97))) a0!50)))))

(assert (=> d!162471 (= (containsKey!818 (insertStrictlySorted!555 (toList!11226 lm!250) a!524 b!97) a0!50) e!867569)))

(declare-fun b!1557470 () Bool)

(declare-fun e!867570 () Bool)

(assert (=> b!1557470 (= e!867569 e!867570)))

(declare-fun res!1065302 () Bool)

(assert (=> b!1557470 (=> (not res!1065302) (not e!867570))))

(assert (=> b!1557470 (= res!1065302 (and (or (not (is-Cons!36302 (insertStrictlySorted!555 (toList!11226 lm!250) a!524 b!97))) (bvsle (_1!12471 (h!37748 (insertStrictlySorted!555 (toList!11226 lm!250) a!524 b!97))) a0!50)) (is-Cons!36302 (insertStrictlySorted!555 (toList!11226 lm!250) a!524 b!97)) (bvslt (_1!12471 (h!37748 (insertStrictlySorted!555 (toList!11226 lm!250) a!524 b!97))) a0!50)))))

(declare-fun b!1557471 () Bool)

(assert (=> b!1557471 (= e!867570 (containsKey!818 (t!51033 (insertStrictlySorted!555 (toList!11226 lm!250) a!524 b!97)) a0!50))))

(assert (= (and d!162471 (not res!1065301)) b!1557470))

(assert (= (and b!1557470 res!1065302) b!1557471))

(declare-fun m!1434563 () Bool)

(assert (=> b!1557471 m!1434563))

(assert (=> b!1557251 d!162471))

(declare-fun d!162473 () Bool)

(declare-fun e!867586 () Bool)

(assert (=> d!162473 e!867586))

(declare-fun res!1065321 () Bool)

(assert (=> d!162473 (=> (not res!1065321) (not e!867586))))

(declare-fun lt!670631 () ListLongMap!22421)

(assert (=> d!162473 (= res!1065321 (contains!10194 lt!670631 (_1!12471 (tuple2!24921 a!524 b!97))))))

(declare-fun lt!670629 () List!36306)

(assert (=> d!162473 (= lt!670631 (ListLongMap!22422 lt!670629))))

(declare-fun lt!670630 () Unit!51853)

(declare-fun lt!670628 () Unit!51853)

(assert (=> d!162473 (= lt!670630 lt!670628)))

(assert (=> d!162473 (= (getValueByKey!785 lt!670629 (_1!12471 (tuple2!24921 a!524 b!97))) (Some!860 (_2!12471 (tuple2!24921 a!524 b!97))))))

(declare-fun lemmaContainsTupThenGetReturnValue!382 (List!36306 (_ BitVec 64) B!2372) Unit!51853)

(assert (=> d!162473 (= lt!670628 (lemmaContainsTupThenGetReturnValue!382 lt!670629 (_1!12471 (tuple2!24921 a!524 b!97)) (_2!12471 (tuple2!24921 a!524 b!97))))))

(assert (=> d!162473 (= lt!670629 (insertStrictlySorted!555 (toList!11226 lm!250) (_1!12471 (tuple2!24921 a!524 b!97)) (_2!12471 (tuple2!24921 a!524 b!97))))))

(assert (=> d!162473 (= (+!5018 lm!250 (tuple2!24921 a!524 b!97)) lt!670631)))

(declare-fun b!1557499 () Bool)

(declare-fun res!1065322 () Bool)

(assert (=> b!1557499 (=> (not res!1065322) (not e!867586))))

(assert (=> b!1557499 (= res!1065322 (= (getValueByKey!785 (toList!11226 lt!670631) (_1!12471 (tuple2!24921 a!524 b!97))) (Some!860 (_2!12471 (tuple2!24921 a!524 b!97)))))))

(declare-fun b!1557500 () Bool)

(assert (=> b!1557500 (= e!867586 (contains!10198 (toList!11226 lt!670631) (tuple2!24921 a!524 b!97)))))

(assert (= (and d!162473 res!1065321) b!1557499))

(assert (= (and b!1557499 res!1065322) b!1557500))

(declare-fun m!1434591 () Bool)

(assert (=> d!162473 m!1434591))

(declare-fun m!1434593 () Bool)

(assert (=> d!162473 m!1434593))

(declare-fun m!1434595 () Bool)

(assert (=> d!162473 m!1434595))

(declare-fun m!1434597 () Bool)

(assert (=> d!162473 m!1434597))

(declare-fun m!1434599 () Bool)

(assert (=> b!1557499 m!1434599))

(declare-fun m!1434601 () Bool)

(assert (=> b!1557500 m!1434601))

(assert (=> b!1557251 d!162473))

(declare-fun b!1557506 () Bool)

(declare-fun e!867590 () Bool)

(declare-fun tp!112509 () Bool)

(assert (=> b!1557506 (= e!867590 (and tp_is_empty!38377 tp!112509))))

(assert (=> b!1557249 (= tp!112494 e!867590)))

(assert (= (and b!1557249 (is-Cons!36302 (toList!11226 lm!250))) b!1557506))

(push 1)

