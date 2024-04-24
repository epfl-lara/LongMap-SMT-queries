; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133706 () Bool)

(assert start!133706)

(declare-fun e!869975 () Bool)

(declare-fun newKey!135 () (_ BitVec 64))

(declare-fun b!1561318 () Bool)

(declare-datatypes ((B!2446 0))(
  ( (B!2447 (val!19309 Int)) )
))
(declare-datatypes ((tuple2!25048 0))(
  ( (tuple2!25049 (_1!12535 (_ BitVec 64)) (_2!12535 B!2446)) )
))
(declare-datatypes ((List!36372 0))(
  ( (Nil!36369) (Cons!36368 (h!37832 tuple2!25048) (t!51094 List!36372)) )
))
(declare-fun l!1292 () List!36372)

(declare-fun newValue!135 () B!2446)

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun containsKey!846 (List!36372 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!575 (List!36372 (_ BitVec 64) B!2446) List!36372)

(assert (=> b!1561318 (= e!869975 (not (containsKey!846 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135) otherKey!62)))))

(declare-fun b!1561319 () Bool)

(declare-fun e!869974 () Bool)

(declare-fun tp_is_empty!38451 () Bool)

(declare-fun tp!112680 () Bool)

(assert (=> b!1561319 (= e!869974 (and tp_is_empty!38451 tp!112680))))

(declare-fun res!1066992 () Bool)

(assert (=> start!133706 (=> (not res!1066992) (not e!869975))))

(declare-fun isStrictlySorted!970 (List!36372) Bool)

(assert (=> start!133706 (= res!1066992 (isStrictlySorted!970 l!1292))))

(assert (=> start!133706 e!869975))

(assert (=> start!133706 e!869974))

(assert (=> start!133706 true))

(assert (=> start!133706 tp_is_empty!38451))

(declare-fun b!1561317 () Bool)

(declare-fun res!1066990 () Bool)

(assert (=> b!1561317 (=> (not res!1066990) (not e!869975))))

(assert (=> b!1561317 (= res!1066990 (and (not (= otherKey!62 newKey!135)) (or (not (is-Cons!36368 l!1292)) (= (_1!12535 (h!37832 l!1292)) otherKey!62))))))

(declare-fun b!1561316 () Bool)

(declare-fun res!1066991 () Bool)

(assert (=> b!1561316 (=> (not res!1066991) (not e!869975))))

(assert (=> b!1561316 (= res!1066991 (containsKey!846 l!1292 otherKey!62))))

(assert (= (and start!133706 res!1066992) b!1561316))

(assert (= (and b!1561316 res!1066991) b!1561317))

(assert (= (and b!1561317 res!1066990) b!1561318))

(assert (= (and start!133706 (is-Cons!36368 l!1292)) b!1561319))

(declare-fun m!1437613 () Bool)

(assert (=> b!1561318 m!1437613))

(assert (=> b!1561318 m!1437613))

(declare-fun m!1437615 () Bool)

(assert (=> b!1561318 m!1437615))

(declare-fun m!1437617 () Bool)

(assert (=> start!133706 m!1437617))

(declare-fun m!1437619 () Bool)

(assert (=> b!1561316 m!1437619))

(push 1)

(assert tp_is_empty!38451)

(assert (not b!1561319))

(assert (not start!133706))

(assert (not b!1561318))

(assert (not b!1561316))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163521 () Bool)

(declare-fun res!1067012 () Bool)

(declare-fun e!869992 () Bool)

(assert (=> d!163521 (=> res!1067012 e!869992)))

(assert (=> d!163521 (= res!1067012 (or (is-Nil!36369 l!1292) (is-Nil!36369 (t!51094 l!1292))))))

(assert (=> d!163521 (= (isStrictlySorted!970 l!1292) e!869992)))

(declare-fun b!1561342 () Bool)

(declare-fun e!869993 () Bool)

(assert (=> b!1561342 (= e!869992 e!869993)))

(declare-fun res!1067013 () Bool)

(assert (=> b!1561342 (=> (not res!1067013) (not e!869993))))

(assert (=> b!1561342 (= res!1067013 (bvslt (_1!12535 (h!37832 l!1292)) (_1!12535 (h!37832 (t!51094 l!1292)))))))

(declare-fun b!1561343 () Bool)

(assert (=> b!1561343 (= e!869993 (isStrictlySorted!970 (t!51094 l!1292)))))

(assert (= (and d!163521 (not res!1067012)) b!1561342))

(assert (= (and b!1561342 res!1067013) b!1561343))

(declare-fun m!1437631 () Bool)

(assert (=> b!1561343 m!1437631))

(assert (=> start!133706 d!163521))

(declare-fun d!163527 () Bool)

(declare-fun res!1067026 () Bool)

(declare-fun e!870006 () Bool)

(assert (=> d!163527 (=> res!1067026 e!870006)))

(assert (=> d!163527 (= res!1067026 (and (is-Cons!36368 l!1292) (= (_1!12535 (h!37832 l!1292)) otherKey!62)))))

(assert (=> d!163527 (= (containsKey!846 l!1292 otherKey!62) e!870006)))

(declare-fun b!1561356 () Bool)

(declare-fun e!870007 () Bool)

(assert (=> b!1561356 (= e!870006 e!870007)))

(declare-fun res!1067027 () Bool)

(assert (=> b!1561356 (=> (not res!1067027) (not e!870007))))

(assert (=> b!1561356 (= res!1067027 (and (or (not (is-Cons!36368 l!1292)) (bvsle (_1!12535 (h!37832 l!1292)) otherKey!62)) (is-Cons!36368 l!1292) (bvslt (_1!12535 (h!37832 l!1292)) otherKey!62)))))

(declare-fun b!1561357 () Bool)

(assert (=> b!1561357 (= e!870007 (containsKey!846 (t!51094 l!1292) otherKey!62))))

(assert (= (and d!163527 (not res!1067026)) b!1561356))

(assert (= (and b!1561356 res!1067027) b!1561357))

(declare-fun m!1437637 () Bool)

(assert (=> b!1561357 m!1437637))

(assert (=> b!1561316 d!163527))

(declare-fun d!163533 () Bool)

(declare-fun res!1067028 () Bool)

(declare-fun e!870008 () Bool)

(assert (=> d!163533 (=> res!1067028 e!870008)))

(assert (=> d!163533 (= res!1067028 (and (is-Cons!36368 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135)) (= (_1!12535 (h!37832 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135))) otherKey!62)))))

(assert (=> d!163533 (= (containsKey!846 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135) otherKey!62) e!870008)))

(declare-fun b!1561358 () Bool)

(declare-fun e!870009 () Bool)

(assert (=> b!1561358 (= e!870008 e!870009)))

(declare-fun res!1067029 () Bool)

(assert (=> b!1561358 (=> (not res!1067029) (not e!870009))))

(assert (=> b!1561358 (= res!1067029 (and (or (not (is-Cons!36368 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135))) (bvsle (_1!12535 (h!37832 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135))) otherKey!62)) (is-Cons!36368 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135)) (bvslt (_1!12535 (h!37832 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135))) otherKey!62)))))

(declare-fun b!1561359 () Bool)

(assert (=> b!1561359 (= e!870009 (containsKey!846 (t!51094 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135)) otherKey!62))))

(assert (= (and d!163533 (not res!1067028)) b!1561358))

(assert (= (and b!1561358 res!1067029) b!1561359))

(declare-fun m!1437639 () Bool)

(assert (=> b!1561359 m!1437639))

(assert (=> b!1561318 d!163533))

(declare-fun e!870060 () List!36372)

(declare-fun call!71973 () List!36372)

(declare-fun bm!71968 () Bool)

(declare-fun c!145000 () Bool)

(declare-fun $colon$colon!983 (List!36372 tuple2!25048) List!36372)

(assert (=> bm!71968 (= call!71973 ($colon$colon!983 e!870060 (ite c!145000 (h!37832 l!1292) (tuple2!25049 newKey!135 newValue!135))))))

(declare-fun c!144998 () Bool)

(assert (=> bm!71968 (= c!144998 c!145000)))

(declare-fun b!1561452 () Bool)

(declare-fun res!1067054 () Bool)

(declare-fun e!870062 () Bool)

(assert (=> b!1561452 (=> (not res!1067054) (not e!870062))))

(declare-fun lt!671746 () List!36372)

(assert (=> b!1561452 (= res!1067054 (containsKey!846 lt!671746 newKey!135))))

(declare-fun bm!71969 () Bool)

(declare-fun call!71971 () List!36372)

(declare-fun call!71972 () List!36372)

(assert (=> bm!71969 (= call!71971 call!71972)))

(declare-fun b!1561453 () Bool)

(declare-fun e!870064 () List!36372)

(assert (=> b!1561453 (= e!870064 call!71972)))

(declare-fun b!1561454 () Bool)

(declare-fun e!870061 () List!36372)

(assert (=> b!1561454 (= e!870061 call!71971)))

(declare-fun b!1561455 () Bool)

(declare-fun contains!10260 (List!36372 tuple2!25048) Bool)

(assert (=> b!1561455 (= e!870062 (contains!10260 lt!671746 (tuple2!25049 newKey!135 newValue!135)))))

(declare-fun bm!71970 () Bool)

(assert (=> bm!71970 (= call!71972 call!71973)))

(declare-fun d!163535 () Bool)

(assert (=> d!163535 e!870062))

(declare-fun res!1067055 () Bool)

(assert (=> d!163535 (=> (not res!1067055) (not e!870062))))

(assert (=> d!163535 (= res!1067055 (isStrictlySorted!970 lt!671746))))

(declare-fun e!870063 () List!36372)

(assert (=> d!163535 (= lt!671746 e!870063)))

(assert (=> d!163535 (= c!145000 (and (is-Cons!36368 l!1292) (bvslt (_1!12535 (h!37832 l!1292)) newKey!135)))))

(assert (=> d!163535 (isStrictlySorted!970 l!1292)))

(assert (=> d!163535 (= (insertStrictlySorted!575 l!1292 newKey!135 newValue!135) lt!671746)))

(declare-fun b!1561456 () Bool)

(assert (=> b!1561456 (= e!870060 (insertStrictlySorted!575 (t!51094 l!1292) newKey!135 newValue!135))))

(declare-fun b!1561457 () Bool)

(assert (=> b!1561457 (= e!870063 call!71973)))

(declare-fun b!1561458 () Bool)

(declare-fun c!144999 () Bool)

(assert (=> b!1561458 (= c!144999 (and (is-Cons!36368 l!1292) (bvsgt (_1!12535 (h!37832 l!1292)) newKey!135)))))

(assert (=> b!1561458 (= e!870064 e!870061)))

(declare-fun b!1561459 () Bool)

(assert (=> b!1561459 (= e!870063 e!870064)))

(declare-fun c!144997 () Bool)

(assert (=> b!1561459 (= c!144997 (and (is-Cons!36368 l!1292) (= (_1!12535 (h!37832 l!1292)) newKey!135)))))

(declare-fun b!1561460 () Bool)

(assert (=> b!1561460 (= e!870060 (ite c!144997 (t!51094 l!1292) (ite c!144999 (Cons!36368 (h!37832 l!1292) (t!51094 l!1292)) Nil!36369)))))

(declare-fun b!1561461 () Bool)

(assert (=> b!1561461 (= e!870061 call!71971)))

(assert (= (and d!163535 c!145000) b!1561457))

(assert (= (and d!163535 (not c!145000)) b!1561459))

(assert (= (and b!1561459 c!144997) b!1561453))

(assert (= (and b!1561459 (not c!144997)) b!1561458))

(assert (= (and b!1561458 c!144999) b!1561461))

(assert (= (and b!1561458 (not c!144999)) b!1561454))

(assert (= (or b!1561461 b!1561454) bm!71969))

(assert (= (or b!1561453 bm!71969) bm!71970))

(assert (= (or b!1561457 bm!71970) bm!71968))

(assert (= (and bm!71968 c!144998) b!1561456))

(assert (= (and bm!71968 (not c!144998)) b!1561460))

(assert (= (and d!163535 res!1067055) b!1561452))

(assert (= (and b!1561452 res!1067054) b!1561455))

(declare-fun m!1437665 () Bool)

(assert (=> d!163535 m!1437665))

(assert (=> d!163535 m!1437617))

(declare-fun m!1437667 () Bool)

(assert (=> b!1561456 m!1437667))

(declare-fun m!1437669 () Bool)

(assert (=> bm!71968 m!1437669))

(declare-fun m!1437671 () Bool)

(assert (=> b!1561455 m!1437671))

(declare-fun m!1437673 () Bool)

(assert (=> b!1561452 m!1437673))

(assert (=> b!1561318 d!163535))

(declare-fun b!1561471 () Bool)

(declare-fun e!870072 () Bool)

(declare-fun tp!112689 () Bool)

(assert (=> b!1561471 (= e!870072 (and tp_is_empty!38451 tp!112689))))

(assert (=> b!1561319 (= tp!112680 e!870072)))

(assert (= (and b!1561319 (is-Cons!36368 (t!51094 l!1292))) b!1561471))

(push 1)

(assert (not b!1561343))

(assert (not b!1561455))

(assert (not b!1561357))

(assert (not b!1561452))

(assert (not b!1561456))

(assert (not b!1561471))

(assert (not bm!71968))

(assert tp_is_empty!38451)

(assert (not b!1561359))

(assert (not d!163535))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163575 () Bool)

(declare-fun res!1067098 () Bool)

(declare-fun e!870122 () Bool)

(assert (=> d!163575 (=> res!1067098 e!870122)))

(assert (=> d!163575 (= res!1067098 (and (is-Cons!36368 lt!671746) (= (_1!12535 (h!37832 lt!671746)) newKey!135)))))

(assert (=> d!163575 (= (containsKey!846 lt!671746 newKey!135) e!870122)))

(declare-fun b!1561533 () Bool)

(declare-fun e!870123 () Bool)

(assert (=> b!1561533 (= e!870122 e!870123)))

(declare-fun res!1067099 () Bool)

(assert (=> b!1561533 (=> (not res!1067099) (not e!870123))))

(assert (=> b!1561533 (= res!1067099 (and (or (not (is-Cons!36368 lt!671746)) (bvsle (_1!12535 (h!37832 lt!671746)) newKey!135)) (is-Cons!36368 lt!671746) (bvslt (_1!12535 (h!37832 lt!671746)) newKey!135)))))

(declare-fun b!1561534 () Bool)

(assert (=> b!1561534 (= e!870123 (containsKey!846 (t!51094 lt!671746) newKey!135))))

(assert (= (and d!163575 (not res!1067098)) b!1561533))

(assert (= (and b!1561533 res!1067099) b!1561534))

(declare-fun m!1437729 () Bool)

(assert (=> b!1561534 m!1437729))

(assert (=> b!1561452 d!163575))

(declare-fun d!163577 () Bool)

(assert (=> d!163577 (= ($colon$colon!983 e!870060 (ite c!145000 (h!37832 l!1292) (tuple2!25049 newKey!135 newValue!135))) (Cons!36368 (ite c!145000 (h!37832 l!1292) (tuple2!25049 newKey!135 newValue!135)) e!870060))))

(assert (=> bm!71968 d!163577))

(declare-fun d!163579 () Bool)

(declare-fun res!1067100 () Bool)

(declare-fun e!870124 () Bool)

(assert (=> d!163579 (=> res!1067100 e!870124)))

(assert (=> d!163579 (= res!1067100 (or (is-Nil!36369 (t!51094 l!1292)) (is-Nil!36369 (t!51094 (t!51094 l!1292)))))))

(assert (=> d!163579 (= (isStrictlySorted!970 (t!51094 l!1292)) e!870124)))

(declare-fun b!1561535 () Bool)

(declare-fun e!870125 () Bool)

(assert (=> b!1561535 (= e!870124 e!870125)))

(declare-fun res!1067101 () Bool)

(assert (=> b!1561535 (=> (not res!1067101) (not e!870125))))

(assert (=> b!1561535 (= res!1067101 (bvslt (_1!12535 (h!37832 (t!51094 l!1292))) (_1!12535 (h!37832 (t!51094 (t!51094 l!1292))))))))

(declare-fun b!1561536 () Bool)

(assert (=> b!1561536 (= e!870125 (isStrictlySorted!970 (t!51094 (t!51094 l!1292))))))

(assert (= (and d!163579 (not res!1067100)) b!1561535))

(assert (= (and b!1561535 res!1067101) b!1561536))

(declare-fun m!1437731 () Bool)

(assert (=> b!1561536 m!1437731))

(assert (=> b!1561343 d!163579))

(declare-fun d!163581 () Bool)

(declare-fun res!1067102 () Bool)

(declare-fun e!870126 () Bool)

(assert (=> d!163581 (=> res!1067102 e!870126)))

(assert (=> d!163581 (= res!1067102 (or (is-Nil!36369 lt!671746) (is-Nil!36369 (t!51094 lt!671746))))))

(assert (=> d!163581 (= (isStrictlySorted!970 lt!671746) e!870126)))

(declare-fun b!1561537 () Bool)

(declare-fun e!870127 () Bool)

(assert (=> b!1561537 (= e!870126 e!870127)))

(declare-fun res!1067103 () Bool)

(assert (=> b!1561537 (=> (not res!1067103) (not e!870127))))

(assert (=> b!1561537 (= res!1067103 (bvslt (_1!12535 (h!37832 lt!671746)) (_1!12535 (h!37832 (t!51094 lt!671746)))))))

(declare-fun b!1561538 () Bool)

(assert (=> b!1561538 (= e!870127 (isStrictlySorted!970 (t!51094 lt!671746)))))

(assert (= (and d!163581 (not res!1067102)) b!1561537))

(assert (= (and b!1561537 res!1067103) b!1561538))

(declare-fun m!1437733 () Bool)

(assert (=> b!1561538 m!1437733))

(assert (=> d!163535 d!163581))

(assert (=> d!163535 d!163521))

(declare-fun c!145012 () Bool)

(declare-fun call!71982 () List!36372)

(declare-fun bm!71977 () Bool)

(declare-fun e!870128 () List!36372)

(assert (=> bm!71977 (= call!71982 ($colon$colon!983 e!870128 (ite c!145012 (h!37832 (t!51094 l!1292)) (tuple2!25049 newKey!135 newValue!135))))))

(declare-fun c!145010 () Bool)

(assert (=> bm!71977 (= c!145010 c!145012)))

(declare-fun b!1561539 () Bool)

(declare-fun res!1067104 () Bool)

(declare-fun e!870130 () Bool)

(assert (=> b!1561539 (=> (not res!1067104) (not e!870130))))

(declare-fun lt!671755 () List!36372)

(assert (=> b!1561539 (= res!1067104 (containsKey!846 lt!671755 newKey!135))))

(declare-fun bm!71978 () Bool)

(declare-fun call!71980 () List!36372)

(declare-fun call!71981 () List!36372)

(assert (=> bm!71978 (= call!71980 call!71981)))

(declare-fun b!1561540 () Bool)

(declare-fun e!870132 () List!36372)

(assert (=> b!1561540 (= e!870132 call!71981)))

(declare-fun b!1561541 () Bool)

(declare-fun e!870129 () List!36372)

(assert (=> b!1561541 (= e!870129 call!71980)))

(declare-fun b!1561542 () Bool)

(assert (=> b!1561542 (= e!870130 (contains!10260 lt!671755 (tuple2!25049 newKey!135 newValue!135)))))

(declare-fun bm!71979 () Bool)

(assert (=> bm!71979 (= call!71981 call!71982)))

(declare-fun d!163583 () Bool)

(assert (=> d!163583 e!870130))

(declare-fun res!1067105 () Bool)

(assert (=> d!163583 (=> (not res!1067105) (not e!870130))))

(assert (=> d!163583 (= res!1067105 (isStrictlySorted!970 lt!671755))))

(declare-fun e!870131 () List!36372)

(assert (=> d!163583 (= lt!671755 e!870131)))

(assert (=> d!163583 (= c!145012 (and (is-Cons!36368 (t!51094 l!1292)) (bvslt (_1!12535 (h!37832 (t!51094 l!1292))) newKey!135)))))

(assert (=> d!163583 (isStrictlySorted!970 (t!51094 l!1292))))

(assert (=> d!163583 (= (insertStrictlySorted!575 (t!51094 l!1292) newKey!135 newValue!135) lt!671755)))

(declare-fun b!1561543 () Bool)

(assert (=> b!1561543 (= e!870128 (insertStrictlySorted!575 (t!51094 (t!51094 l!1292)) newKey!135 newValue!135))))

(declare-fun b!1561544 () Bool)

(assert (=> b!1561544 (= e!870131 call!71982)))

(declare-fun b!1561545 () Bool)

(declare-fun c!145011 () Bool)

(assert (=> b!1561545 (= c!145011 (and (is-Cons!36368 (t!51094 l!1292)) (bvsgt (_1!12535 (h!37832 (t!51094 l!1292))) newKey!135)))))

(assert (=> b!1561545 (= e!870132 e!870129)))

(declare-fun b!1561546 () Bool)

(assert (=> b!1561546 (= e!870131 e!870132)))

(declare-fun c!145009 () Bool)

(assert (=> b!1561546 (= c!145009 (and (is-Cons!36368 (t!51094 l!1292)) (= (_1!12535 (h!37832 (t!51094 l!1292))) newKey!135)))))

(declare-fun b!1561547 () Bool)

(assert (=> b!1561547 (= e!870128 (ite c!145009 (t!51094 (t!51094 l!1292)) (ite c!145011 (Cons!36368 (h!37832 (t!51094 l!1292)) (t!51094 (t!51094 l!1292))) Nil!36369)))))

(declare-fun b!1561548 () Bool)

(assert (=> b!1561548 (= e!870129 call!71980)))

(assert (= (and d!163583 c!145012) b!1561544))

(assert (= (and d!163583 (not c!145012)) b!1561546))

(assert (= (and b!1561546 c!145009) b!1561540))

(assert (= (and b!1561546 (not c!145009)) b!1561545))

(assert (= (and b!1561545 c!145011) b!1561548))

(assert (= (and b!1561545 (not c!145011)) b!1561541))

(assert (= (or b!1561548 b!1561541) bm!71978))

(assert (= (or b!1561540 bm!71978) bm!71979))

(assert (= (or b!1561544 bm!71979) bm!71977))

(assert (= (and bm!71977 c!145010) b!1561543))

(assert (= (and bm!71977 (not c!145010)) b!1561547))

(assert (= (and d!163583 res!1067105) b!1561539))

(assert (= (and b!1561539 res!1067104) b!1561542))

(declare-fun m!1437735 () Bool)

(assert (=> d!163583 m!1437735))

(assert (=> d!163583 m!1437631))

(declare-fun m!1437737 () Bool)

(assert (=> b!1561543 m!1437737))

(declare-fun m!1437739 () Bool)

(assert (=> bm!71977 m!1437739))

(declare-fun m!1437741 () Bool)

(assert (=> b!1561542 m!1437741))

(declare-fun m!1437743 () Bool)

(assert (=> b!1561539 m!1437743))

(assert (=> b!1561456 d!163583))

(declare-fun d!163585 () Bool)

(declare-fun res!1067106 () Bool)

(declare-fun e!870133 () Bool)

(assert (=> d!163585 (=> res!1067106 e!870133)))

(assert (=> d!163585 (= res!1067106 (and (is-Cons!36368 (t!51094 l!1292)) (= (_1!12535 (h!37832 (t!51094 l!1292))) otherKey!62)))))

(assert (=> d!163585 (= (containsKey!846 (t!51094 l!1292) otherKey!62) e!870133)))

(declare-fun b!1561549 () Bool)

(declare-fun e!870134 () Bool)

(assert (=> b!1561549 (= e!870133 e!870134)))

(declare-fun res!1067107 () Bool)

(assert (=> b!1561549 (=> (not res!1067107) (not e!870134))))

(assert (=> b!1561549 (= res!1067107 (and (or (not (is-Cons!36368 (t!51094 l!1292))) (bvsle (_1!12535 (h!37832 (t!51094 l!1292))) otherKey!62)) (is-Cons!36368 (t!51094 l!1292)) (bvslt (_1!12535 (h!37832 (t!51094 l!1292))) otherKey!62)))))

(declare-fun b!1561550 () Bool)

(assert (=> b!1561550 (= e!870134 (containsKey!846 (t!51094 (t!51094 l!1292)) otherKey!62))))

(assert (= (and d!163585 (not res!1067106)) b!1561549))

(assert (= (and b!1561549 res!1067107) b!1561550))

(declare-fun m!1437745 () Bool)

(assert (=> b!1561550 m!1437745))

(assert (=> b!1561357 d!163585))

(declare-fun d!163587 () Bool)

(declare-fun res!1067108 () Bool)

(declare-fun e!870135 () Bool)

(assert (=> d!163587 (=> res!1067108 e!870135)))

(assert (=> d!163587 (= res!1067108 (and (is-Cons!36368 (t!51094 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135))) (= (_1!12535 (h!37832 (t!51094 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135)))) otherKey!62)))))

(assert (=> d!163587 (= (containsKey!846 (t!51094 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135)) otherKey!62) e!870135)))

(declare-fun b!1561551 () Bool)

(declare-fun e!870136 () Bool)

(assert (=> b!1561551 (= e!870135 e!870136)))

(declare-fun res!1067109 () Bool)

(assert (=> b!1561551 (=> (not res!1067109) (not e!870136))))

(assert (=> b!1561551 (= res!1067109 (and (or (not (is-Cons!36368 (t!51094 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135)))) (bvsle (_1!12535 (h!37832 (t!51094 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135)))) otherKey!62)) (is-Cons!36368 (t!51094 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135))) (bvslt (_1!12535 (h!37832 (t!51094 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135)))) otherKey!62)))))

(declare-fun b!1561552 () Bool)

(assert (=> b!1561552 (= e!870136 (containsKey!846 (t!51094 (t!51094 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135))) otherKey!62))))

(assert (= (and d!163587 (not res!1067108)) b!1561551))

(assert (= (and b!1561551 res!1067109) b!1561552))

(declare-fun m!1437747 () Bool)

(assert (=> b!1561552 m!1437747))

(assert (=> b!1561359 d!163587))

(declare-fun lt!671758 () Bool)

(declare-fun d!163589 () Bool)

(declare-fun content!796 (List!36372) (Set tuple2!25048))

(assert (=> d!163589 (= lt!671758 (member (tuple2!25049 newKey!135 newValue!135) (content!796 lt!671746)))))

(declare-fun e!870141 () Bool)

(assert (=> d!163589 (= lt!671758 e!870141)))

(declare-fun res!1067114 () Bool)

(assert (=> d!163589 (=> (not res!1067114) (not e!870141))))

(assert (=> d!163589 (= res!1067114 (is-Cons!36368 lt!671746))))

(assert (=> d!163589 (= (contains!10260 lt!671746 (tuple2!25049 newKey!135 newValue!135)) lt!671758)))

(declare-fun b!1561557 () Bool)

(declare-fun e!870142 () Bool)

(assert (=> b!1561557 (= e!870141 e!870142)))

(declare-fun res!1067115 () Bool)

(assert (=> b!1561557 (=> res!1067115 e!870142)))

(assert (=> b!1561557 (= res!1067115 (= (h!37832 lt!671746) (tuple2!25049 newKey!135 newValue!135)))))

(declare-fun b!1561558 () Bool)

(assert (=> b!1561558 (= e!870142 (contains!10260 (t!51094 lt!671746) (tuple2!25049 newKey!135 newValue!135)))))

(assert (= (and d!163589 res!1067114) b!1561557))

(assert (= (and b!1561557 (not res!1067115)) b!1561558))

(declare-fun m!1437749 () Bool)

(assert (=> d!163589 m!1437749))

(declare-fun m!1437751 () Bool)

(assert (=> d!163589 m!1437751))

(declare-fun m!1437753 () Bool)

(assert (=> b!1561558 m!1437753))

(assert (=> b!1561455 d!163589))

(declare-fun b!1561559 () Bool)

(declare-fun e!870143 () Bool)

(declare-fun tp!112695 () Bool)

(assert (=> b!1561559 (= e!870143 (and tp_is_empty!38451 tp!112695))))

(assert (=> b!1561471 (= tp!112689 e!870143)))

(assert (= (and b!1561471 (is-Cons!36368 (t!51094 (t!51094 l!1292)))) b!1561559))

(push 1)

(assert tp_is_empty!38451)

(assert (not d!163589))

(assert (not b!1561550))

(assert (not b!1561534))

(assert (not b!1561558))

(assert (not bm!71977))

(assert (not b!1561559))

(assert (not b!1561542))

(assert (not b!1561539))

(assert (not b!1561538))

(assert (not b!1561536))

(assert (not d!163583))

(assert (not b!1561543))

(assert (not b!1561552))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

