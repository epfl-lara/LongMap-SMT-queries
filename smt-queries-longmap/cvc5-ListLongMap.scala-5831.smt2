; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75236 () Bool)

(assert start!75236)

(declare-fun res!601769 () Bool)

(declare-fun e!493403 () Bool)

(assert (=> start!75236 (=> (not res!601769) (not e!493403))))

(declare-datatypes ((B!1308 0))(
  ( (B!1309 (val!8960 Int)) )
))
(declare-datatypes ((tuple2!11934 0))(
  ( (tuple2!11935 (_1!5978 (_ BitVec 64)) (_2!5978 B!1308)) )
))
(declare-datatypes ((List!17684 0))(
  ( (Nil!17681) (Cons!17680 (h!18811 tuple2!11934) (t!24955 List!17684)) )
))
(declare-fun l!906 () List!17684)

(declare-fun isStrictlySorted!490 (List!17684) Bool)

(assert (=> start!75236 (= res!601769 (isStrictlySorted!490 l!906))))

(assert (=> start!75236 e!493403))

(declare-fun e!493402 () Bool)

(assert (=> start!75236 e!493402))

(assert (=> start!75236 true))

(declare-fun tp_is_empty!17819 () Bool)

(assert (=> start!75236 tp_is_empty!17819))

(declare-fun b!886371 () Bool)

(declare-fun res!601768 () Bool)

(assert (=> b!886371 (=> (not res!601768) (not e!493403))))

(declare-fun key1!49 () (_ BitVec 64))

(assert (=> b!886371 (= res!601768 (or (not (is-Cons!17680 l!906)) (bvsge (_1!5978 (h!18811 l!906)) key1!49)))))

(declare-fun b!886372 () Bool)

(declare-fun v2!16 () B!1308)

(declare-fun v1!38 () B!1308)

(declare-fun insertStrictlySorted!303 (List!17684 (_ BitVec 64) B!1308) List!17684)

(assert (=> b!886372 (= e!493403 (not (= (insertStrictlySorted!303 (insertStrictlySorted!303 l!906 key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!303 l!906 key1!49 v2!16))))))

(declare-fun b!886373 () Bool)

(declare-fun tp!54393 () Bool)

(assert (=> b!886373 (= e!493402 (and tp_is_empty!17819 tp!54393))))

(assert (= (and start!75236 res!601769) b!886371))

(assert (= (and b!886371 res!601768) b!886372))

(assert (= (and start!75236 (is-Cons!17680 l!906)) b!886373))

(declare-fun m!825741 () Bool)

(assert (=> start!75236 m!825741))

(declare-fun m!825743 () Bool)

(assert (=> b!886372 m!825743))

(assert (=> b!886372 m!825743))

(declare-fun m!825745 () Bool)

(assert (=> b!886372 m!825745))

(declare-fun m!825747 () Bool)

(assert (=> b!886372 m!825747))

(push 1)

(assert (not start!75236))

(assert (not b!886372))

(assert (not b!886373))

(assert tp_is_empty!17819)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!109549 () Bool)

(declare-fun res!601774 () Bool)

(declare-fun e!493408 () Bool)

(assert (=> d!109549 (=> res!601774 e!493408)))

(assert (=> d!109549 (= res!601774 (or (is-Nil!17681 l!906) (is-Nil!17681 (t!24955 l!906))))))

(assert (=> d!109549 (= (isStrictlySorted!490 l!906) e!493408)))

(declare-fun b!886378 () Bool)

(declare-fun e!493409 () Bool)

(assert (=> b!886378 (= e!493408 e!493409)))

(declare-fun res!601775 () Bool)

(assert (=> b!886378 (=> (not res!601775) (not e!493409))))

(assert (=> b!886378 (= res!601775 (bvslt (_1!5978 (h!18811 l!906)) (_1!5978 (h!18811 (t!24955 l!906)))))))

(declare-fun b!886379 () Bool)

(assert (=> b!886379 (= e!493409 (isStrictlySorted!490 (t!24955 l!906)))))

(assert (= (and d!109549 (not res!601774)) b!886378))

(assert (= (and b!886378 res!601775) b!886379))

(declare-fun m!825749 () Bool)

(assert (=> b!886379 m!825749))

(assert (=> start!75236 d!109549))

(declare-fun b!886500 () Bool)

(declare-fun e!493474 () List!17684)

(declare-fun call!39269 () List!17684)

(assert (=> b!886500 (= e!493474 call!39269)))

(declare-fun bm!39264 () Bool)

(declare-fun call!39268 () List!17684)

(declare-fun call!39267 () List!17684)

(assert (=> bm!39264 (= call!39268 call!39267)))

(declare-fun b!886501 () Bool)

(declare-fun e!493471 () List!17684)

(assert (=> b!886501 (= e!493474 e!493471)))

(declare-fun c!93505 () Bool)

(assert (=> b!886501 (= c!93505 (and (is-Cons!17680 (insertStrictlySorted!303 l!906 key1!49 v1!38)) (= (_1!5978 (h!18811 (insertStrictlySorted!303 l!906 key1!49 v1!38))) key1!49)))))

(declare-fun e!493472 () Bool)

(declare-fun b!886502 () Bool)

(declare-fun lt!400920 () List!17684)

(declare-fun contains!4274 (List!17684 tuple2!11934) Bool)

(assert (=> b!886502 (= e!493472 (contains!4274 lt!400920 (tuple2!11935 key1!49 v2!16)))))

(declare-fun b!886503 () Bool)

(declare-fun e!493473 () List!17684)

(assert (=> b!886503 (= e!493473 call!39268)))

(declare-fun b!886504 () Bool)

(assert (=> b!886504 (= e!493473 call!39268)))

(declare-fun bm!39265 () Bool)

(assert (=> bm!39265 (= call!39267 call!39269)))

(declare-fun c!93504 () Bool)

(declare-fun e!493470 () List!17684)

(declare-fun bm!39266 () Bool)

(declare-fun $colon$colon!550 (List!17684 tuple2!11934) List!17684)

(assert (=> bm!39266 (= call!39269 ($colon$colon!550 e!493470 (ite c!93504 (h!18811 (insertStrictlySorted!303 l!906 key1!49 v1!38)) (tuple2!11935 key1!49 v2!16))))))

(declare-fun c!93503 () Bool)

(assert (=> bm!39266 (= c!93503 c!93504)))

(declare-fun b!886505 () Bool)

(assert (=> b!886505 (= e!493470 (insertStrictlySorted!303 (t!24955 (insertStrictlySorted!303 l!906 key1!49 v1!38)) key1!49 v2!16))))

(declare-fun d!109553 () Bool)

(assert (=> d!109553 e!493472))

(declare-fun res!601800 () Bool)

(assert (=> d!109553 (=> (not res!601800) (not e!493472))))

(assert (=> d!109553 (= res!601800 (isStrictlySorted!490 lt!400920))))

(assert (=> d!109553 (= lt!400920 e!493474)))

(assert (=> d!109553 (= c!93504 (and (is-Cons!17680 (insertStrictlySorted!303 l!906 key1!49 v1!38)) (bvslt (_1!5978 (h!18811 (insertStrictlySorted!303 l!906 key1!49 v1!38))) key1!49)))))

(assert (=> d!109553 (isStrictlySorted!490 (insertStrictlySorted!303 l!906 key1!49 v1!38))))

(assert (=> d!109553 (= (insertStrictlySorted!303 (insertStrictlySorted!303 l!906 key1!49 v1!38) key1!49 v2!16) lt!400920)))

(declare-fun c!93502 () Bool)

(declare-fun b!886506 () Bool)

(assert (=> b!886506 (= c!93502 (and (is-Cons!17680 (insertStrictlySorted!303 l!906 key1!49 v1!38)) (bvsgt (_1!5978 (h!18811 (insertStrictlySorted!303 l!906 key1!49 v1!38))) key1!49)))))

(assert (=> b!886506 (= e!493471 e!493473)))

(declare-fun b!886507 () Bool)

(assert (=> b!886507 (= e!493470 (ite c!93505 (t!24955 (insertStrictlySorted!303 l!906 key1!49 v1!38)) (ite c!93502 (Cons!17680 (h!18811 (insertStrictlySorted!303 l!906 key1!49 v1!38)) (t!24955 (insertStrictlySorted!303 l!906 key1!49 v1!38))) Nil!17681)))))

(declare-fun b!886508 () Bool)

(declare-fun res!601801 () Bool)

(assert (=> b!886508 (=> (not res!601801) (not e!493472))))

(declare-fun containsKey!415 (List!17684 (_ BitVec 64)) Bool)

(assert (=> b!886508 (= res!601801 (containsKey!415 lt!400920 key1!49))))

(declare-fun b!886509 () Bool)

(assert (=> b!886509 (= e!493471 call!39267)))

(assert (= (and d!109553 c!93504) b!886500))

(assert (= (and d!109553 (not c!93504)) b!886501))

(assert (= (and b!886501 c!93505) b!886509))

(assert (= (and b!886501 (not c!93505)) b!886506))

(assert (= (and b!886506 c!93502) b!886504))

(assert (= (and b!886506 (not c!93502)) b!886503))

(assert (= (or b!886504 b!886503) bm!39264))

(assert (= (or b!886509 bm!39264) bm!39265))

(assert (= (or b!886500 bm!39265) bm!39266))

(assert (= (and bm!39266 c!93503) b!886505))

(assert (= (and bm!39266 (not c!93503)) b!886507))

(assert (= (and d!109553 res!601800) b!886508))

(assert (= (and b!886508 res!601801) b!886502))

(declare-fun m!825815 () Bool)

(assert (=> d!109553 m!825815))

(assert (=> d!109553 m!825743))

(declare-fun m!825817 () Bool)

(assert (=> d!109553 m!825817))

(declare-fun m!825819 () Bool)

(assert (=> bm!39266 m!825819))

(declare-fun m!825821 () Bool)

(assert (=> b!886508 m!825821))

(declare-fun m!825823 () Bool)

(assert (=> b!886502 m!825823))

(declare-fun m!825825 () Bool)

(assert (=> b!886505 m!825825))

(assert (=> b!886372 d!109553))

(declare-fun b!886510 () Bool)

(declare-fun e!493479 () List!17684)

(declare-fun call!39272 () List!17684)

(assert (=> b!886510 (= e!493479 call!39272)))

(declare-fun bm!39267 () Bool)

(declare-fun call!39271 () List!17684)

(declare-fun call!39270 () List!17684)

(assert (=> bm!39267 (= call!39271 call!39270)))

(declare-fun b!886511 () Bool)

(declare-fun e!493476 () List!17684)

(assert (=> b!886511 (= e!493479 e!493476)))

(declare-fun c!93509 () Bool)

(assert (=> b!886511 (= c!93509 (and (is-Cons!17680 l!906) (= (_1!5978 (h!18811 l!906)) key1!49)))))

(declare-fun e!493477 () Bool)

(declare-fun b!886512 () Bool)

(declare-fun lt!400921 () List!17684)

(assert (=> b!886512 (= e!493477 (contains!4274 lt!400921 (tuple2!11935 key1!49 v1!38)))))

(declare-fun b!886513 () Bool)

(declare-fun e!493478 () List!17684)

(assert (=> b!886513 (= e!493478 call!39271)))

(declare-fun b!886514 () Bool)

(assert (=> b!886514 (= e!493478 call!39271)))

(declare-fun bm!39268 () Bool)

(assert (=> bm!39268 (= call!39270 call!39272)))

(declare-fun e!493475 () List!17684)

(declare-fun c!93508 () Bool)

(declare-fun bm!39269 () Bool)

(assert (=> bm!39269 (= call!39272 ($colon$colon!550 e!493475 (ite c!93508 (h!18811 l!906) (tuple2!11935 key1!49 v1!38))))))

(declare-fun c!93507 () Bool)

(assert (=> bm!39269 (= c!93507 c!93508)))

(declare-fun b!886515 () Bool)

(assert (=> b!886515 (= e!493475 (insertStrictlySorted!303 (t!24955 l!906) key1!49 v1!38))))

(declare-fun d!109567 () Bool)

(assert (=> d!109567 e!493477))

(declare-fun res!601802 () Bool)

(assert (=> d!109567 (=> (not res!601802) (not e!493477))))

(assert (=> d!109567 (= res!601802 (isStrictlySorted!490 lt!400921))))

(assert (=> d!109567 (= lt!400921 e!493479)))

(assert (=> d!109567 (= c!93508 (and (is-Cons!17680 l!906) (bvslt (_1!5978 (h!18811 l!906)) key1!49)))))

(assert (=> d!109567 (isStrictlySorted!490 l!906)))

(assert (=> d!109567 (= (insertStrictlySorted!303 l!906 key1!49 v1!38) lt!400921)))

(declare-fun b!886516 () Bool)

(declare-fun c!93506 () Bool)

(assert (=> b!886516 (= c!93506 (and (is-Cons!17680 l!906) (bvsgt (_1!5978 (h!18811 l!906)) key1!49)))))

(assert (=> b!886516 (= e!493476 e!493478)))

(declare-fun b!886517 () Bool)

(assert (=> b!886517 (= e!493475 (ite c!93509 (t!24955 l!906) (ite c!93506 (Cons!17680 (h!18811 l!906) (t!24955 l!906)) Nil!17681)))))

(declare-fun b!886518 () Bool)

(declare-fun res!601803 () Bool)

(assert (=> b!886518 (=> (not res!601803) (not e!493477))))

(assert (=> b!886518 (= res!601803 (containsKey!415 lt!400921 key1!49))))

(declare-fun b!886519 () Bool)

(assert (=> b!886519 (= e!493476 call!39270)))

(assert (= (and d!109567 c!93508) b!886510))

(assert (= (and d!109567 (not c!93508)) b!886511))

(assert (= (and b!886511 c!93509) b!886519))

(assert (= (and b!886511 (not c!93509)) b!886516))

(assert (= (and b!886516 c!93506) b!886514))

(assert (= (and b!886516 (not c!93506)) b!886513))

(assert (= (or b!886514 b!886513) bm!39267))

(assert (= (or b!886519 bm!39267) bm!39268))

(assert (= (or b!886510 bm!39268) bm!39269))

(assert (= (and bm!39269 c!93507) b!886515))

(assert (= (and bm!39269 (not c!93507)) b!886517))

(assert (= (and d!109567 res!601802) b!886518))

(assert (= (and b!886518 res!601803) b!886512))

(declare-fun m!825827 () Bool)

(assert (=> d!109567 m!825827))

(assert (=> d!109567 m!825741))

(declare-fun m!825829 () Bool)

(assert (=> bm!39269 m!825829))

(declare-fun m!825831 () Bool)

(assert (=> b!886518 m!825831))

(declare-fun m!825833 () Bool)

(assert (=> b!886512 m!825833))

(declare-fun m!825835 () Bool)

(assert (=> b!886515 m!825835))

(assert (=> b!886372 d!109567))

(declare-fun b!886526 () Bool)

(declare-fun e!493490 () List!17684)

(declare-fun call!39275 () List!17684)

(assert (=> b!886526 (= e!493490 call!39275)))

(declare-fun bm!39270 () Bool)

(declare-fun call!39274 () List!17684)

(declare-fun call!39273 () List!17684)

(assert (=> bm!39270 (= call!39274 call!39273)))

(declare-fun b!886527 () Bool)

(declare-fun e!493487 () List!17684)

(assert (=> b!886527 (= e!493490 e!493487)))

(declare-fun c!93513 () Bool)

(assert (=> b!886527 (= c!93513 (and (is-Cons!17680 l!906) (= (_1!5978 (h!18811 l!906)) key1!49)))))

(declare-fun e!493488 () Bool)

(declare-fun lt!400922 () List!17684)

(declare-fun b!886528 () Bool)

(assert (=> b!886528 (= e!493488 (contains!4274 lt!400922 (tuple2!11935 key1!49 v2!16)))))

(declare-fun b!886529 () Bool)

(declare-fun e!493489 () List!17684)

(assert (=> b!886529 (= e!493489 call!39274)))

(declare-fun b!886530 () Bool)

(assert (=> b!886530 (= e!493489 call!39274)))

(declare-fun bm!39271 () Bool)

(assert (=> bm!39271 (= call!39273 call!39275)))

(declare-fun e!493486 () List!17684)

(declare-fun bm!39272 () Bool)

(declare-fun c!93512 () Bool)

(assert (=> bm!39272 (= call!39275 ($colon$colon!550 e!493486 (ite c!93512 (h!18811 l!906) (tuple2!11935 key1!49 v2!16))))))

(declare-fun c!93511 () Bool)

(assert (=> bm!39272 (= c!93511 c!93512)))

(declare-fun b!886531 () Bool)

(assert (=> b!886531 (= e!493486 (insertStrictlySorted!303 (t!24955 l!906) key1!49 v2!16))))

(declare-fun d!109569 () Bool)

(assert (=> d!109569 e!493488))

(declare-fun res!601810 () Bool)

(assert (=> d!109569 (=> (not res!601810) (not e!493488))))

(assert (=> d!109569 (= res!601810 (isStrictlySorted!490 lt!400922))))

(assert (=> d!109569 (= lt!400922 e!493490)))

(assert (=> d!109569 (= c!93512 (and (is-Cons!17680 l!906) (bvslt (_1!5978 (h!18811 l!906)) key1!49)))))

(assert (=> d!109569 (isStrictlySorted!490 l!906)))

(assert (=> d!109569 (= (insertStrictlySorted!303 l!906 key1!49 v2!16) lt!400922)))

(declare-fun b!886532 () Bool)

(declare-fun c!93510 () Bool)

(assert (=> b!886532 (= c!93510 (and (is-Cons!17680 l!906) (bvsgt (_1!5978 (h!18811 l!906)) key1!49)))))

(assert (=> b!886532 (= e!493487 e!493489)))

(declare-fun b!886533 () Bool)

(assert (=> b!886533 (= e!493486 (ite c!93513 (t!24955 l!906) (ite c!93510 (Cons!17680 (h!18811 l!906) (t!24955 l!906)) Nil!17681)))))

(declare-fun b!886534 () Bool)

(declare-fun res!601811 () Bool)

(assert (=> b!886534 (=> (not res!601811) (not e!493488))))

(assert (=> b!886534 (= res!601811 (containsKey!415 lt!400922 key1!49))))

(declare-fun b!886535 () Bool)

(assert (=> b!886535 (= e!493487 call!39273)))

(assert (= (and d!109569 c!93512) b!886526))

(assert (= (and d!109569 (not c!93512)) b!886527))

(assert (= (and b!886527 c!93513) b!886535))

(assert (= (and b!886527 (not c!93513)) b!886532))

(assert (= (and b!886532 c!93510) b!886530))

(assert (= (and b!886532 (not c!93510)) b!886529))

(assert (= (or b!886530 b!886529) bm!39270))

(assert (= (or b!886535 bm!39270) bm!39271))

(assert (= (or b!886526 bm!39271) bm!39272))

(assert (= (and bm!39272 c!93511) b!886531))

(assert (= (and bm!39272 (not c!93511)) b!886533))

(assert (= (and d!109569 res!601810) b!886534))

(assert (= (and b!886534 res!601811) b!886528))

(declare-fun m!825839 () Bool)

(assert (=> d!109569 m!825839))

(assert (=> d!109569 m!825741))

(declare-fun m!825841 () Bool)

(assert (=> bm!39272 m!825841))

(declare-fun m!825843 () Bool)

(assert (=> b!886534 m!825843))

(declare-fun m!825845 () Bool)

(assert (=> b!886528 m!825845))

(declare-fun m!825847 () Bool)

(assert (=> b!886531 m!825847))

(assert (=> b!886372 d!109569))

(declare-fun b!886553 () Bool)

(declare-fun e!493502 () Bool)

(declare-fun tp!54399 () Bool)

(assert (=> b!886553 (= e!493502 (and tp_is_empty!17819 tp!54399))))

(assert (=> b!886373 (= tp!54393 e!493502)))

(assert (= (and b!886373 (is-Cons!17680 (t!24955 l!906))) b!886553))

(push 1)

(assert (not d!109567))

(assert (not b!886379))

(assert (not d!109553))

(assert (not d!109569))

(assert (not bm!39269))

(assert (not b!886534))

(assert (not b!886518))

(assert (not b!886528))

(assert (not b!886531))

(assert (not bm!39272))

(assert (not b!886553))

(assert tp_is_empty!17819)

(assert (not b!886515))

(assert (not b!886505))

(assert (not b!886508))

(assert (not bm!39266))

(assert (not b!886512))

(assert (not b!886502))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!109579 () Bool)

(declare-fun res!601844 () Bool)

(declare-fun e!493538 () Bool)

(assert (=> d!109579 (=> res!601844 e!493538)))

(assert (=> d!109579 (= res!601844 (and (is-Cons!17680 lt!400922) (= (_1!5978 (h!18811 lt!400922)) key1!49)))))

(assert (=> d!109579 (= (containsKey!415 lt!400922 key1!49) e!493538)))

(declare-fun b!886599 () Bool)

(declare-fun e!493539 () Bool)

(assert (=> b!886599 (= e!493538 e!493539)))

(declare-fun res!601845 () Bool)

(assert (=> b!886599 (=> (not res!601845) (not e!493539))))

(assert (=> b!886599 (= res!601845 (and (or (not (is-Cons!17680 lt!400922)) (bvsle (_1!5978 (h!18811 lt!400922)) key1!49)) (is-Cons!17680 lt!400922) (bvslt (_1!5978 (h!18811 lt!400922)) key1!49)))))

(declare-fun b!886600 () Bool)

(assert (=> b!886600 (= e!493539 (containsKey!415 (t!24955 lt!400922) key1!49))))

(assert (= (and d!109579 (not res!601844)) b!886599))

(assert (= (and b!886599 res!601845) b!886600))

(declare-fun m!825887 () Bool)

(assert (=> b!886600 m!825887))

(assert (=> b!886534 d!109579))

(declare-fun b!886601 () Bool)

(declare-fun e!493544 () List!17684)

(declare-fun call!39284 () List!17684)

(assert (=> b!886601 (= e!493544 call!39284)))

(declare-fun bm!39279 () Bool)

(declare-fun call!39283 () List!17684)

(declare-fun call!39282 () List!17684)

(assert (=> bm!39279 (= call!39283 call!39282)))

(declare-fun b!886602 () Bool)

(declare-fun e!493541 () List!17684)

(assert (=> b!886602 (= e!493544 e!493541)))

(declare-fun c!93525 () Bool)

(assert (=> b!886602 (= c!93525 (and (is-Cons!17680 (t!24955 l!906)) (= (_1!5978 (h!18811 (t!24955 l!906))) key1!49)))))

(declare-fun lt!400928 () List!17684)

(declare-fun b!886603 () Bool)

(declare-fun e!493542 () Bool)

(assert (=> b!886603 (= e!493542 (contains!4274 lt!400928 (tuple2!11935 key1!49 v1!38)))))

(declare-fun b!886604 () Bool)

(declare-fun e!493543 () List!17684)

(assert (=> b!886604 (= e!493543 call!39283)))

(declare-fun b!886605 () Bool)

(assert (=> b!886605 (= e!493543 call!39283)))

(declare-fun bm!39280 () Bool)

(assert (=> bm!39280 (= call!39282 call!39284)))

(declare-fun e!493540 () List!17684)

(declare-fun c!93524 () Bool)

(declare-fun bm!39281 () Bool)

(assert (=> bm!39281 (= call!39284 ($colon$colon!550 e!493540 (ite c!93524 (h!18811 (t!24955 l!906)) (tuple2!11935 key1!49 v1!38))))))

(declare-fun c!93523 () Bool)

(assert (=> bm!39281 (= c!93523 c!93524)))

(declare-fun b!886606 () Bool)

(assert (=> b!886606 (= e!493540 (insertStrictlySorted!303 (t!24955 (t!24955 l!906)) key1!49 v1!38))))

(declare-fun d!109589 () Bool)

(assert (=> d!109589 e!493542))

(declare-fun res!601846 () Bool)

(assert (=> d!109589 (=> (not res!601846) (not e!493542))))

(assert (=> d!109589 (= res!601846 (isStrictlySorted!490 lt!400928))))

(assert (=> d!109589 (= lt!400928 e!493544)))

(assert (=> d!109589 (= c!93524 (and (is-Cons!17680 (t!24955 l!906)) (bvslt (_1!5978 (h!18811 (t!24955 l!906))) key1!49)))))

(assert (=> d!109589 (isStrictlySorted!490 (t!24955 l!906))))

(assert (=> d!109589 (= (insertStrictlySorted!303 (t!24955 l!906) key1!49 v1!38) lt!400928)))

(declare-fun b!886607 () Bool)

(declare-fun c!93522 () Bool)

(assert (=> b!886607 (= c!93522 (and (is-Cons!17680 (t!24955 l!906)) (bvsgt (_1!5978 (h!18811 (t!24955 l!906))) key1!49)))))

(assert (=> b!886607 (= e!493541 e!493543)))

(declare-fun b!886608 () Bool)

(assert (=> b!886608 (= e!493540 (ite c!93525 (t!24955 (t!24955 l!906)) (ite c!93522 (Cons!17680 (h!18811 (t!24955 l!906)) (t!24955 (t!24955 l!906))) Nil!17681)))))

(declare-fun b!886609 () Bool)

(declare-fun res!601847 () Bool)

(assert (=> b!886609 (=> (not res!601847) (not e!493542))))

(assert (=> b!886609 (= res!601847 (containsKey!415 lt!400928 key1!49))))

(declare-fun b!886610 () Bool)

(assert (=> b!886610 (= e!493541 call!39282)))

(assert (= (and d!109589 c!93524) b!886601))

(assert (= (and d!109589 (not c!93524)) b!886602))

(assert (= (and b!886602 c!93525) b!886610))

(assert (= (and b!886602 (not c!93525)) b!886607))

(assert (= (and b!886607 c!93522) b!886605))

(assert (= (and b!886607 (not c!93522)) b!886604))

(assert (= (or b!886605 b!886604) bm!39279))

(assert (= (or b!886610 bm!39279) bm!39280))

(assert (= (or b!886601 bm!39280) bm!39281))

(assert (= (and bm!39281 c!93523) b!886606))

(assert (= (and bm!39281 (not c!93523)) b!886608))

(assert (= (and d!109589 res!601846) b!886609))

(assert (= (and b!886609 res!601847) b!886603))

(declare-fun m!825891 () Bool)

(assert (=> d!109589 m!825891))

(assert (=> d!109589 m!825749))

(declare-fun m!825893 () Bool)

(assert (=> bm!39281 m!825893))

(declare-fun m!825895 () Bool)

(assert (=> b!886609 m!825895))

(declare-fun m!825897 () Bool)

(assert (=> b!886603 m!825897))

(declare-fun m!825899 () Bool)

(assert (=> b!886606 m!825899))

(assert (=> b!886515 d!109589))

(declare-fun d!109597 () Bool)

(declare-fun res!601852 () Bool)

(declare-fun e!493552 () Bool)

(assert (=> d!109597 (=> res!601852 e!493552)))

(assert (=> d!109597 (= res!601852 (or (is-Nil!17681 (t!24955 l!906)) (is-Nil!17681 (t!24955 (t!24955 l!906)))))))

(assert (=> d!109597 (= (isStrictlySorted!490 (t!24955 l!906)) e!493552)))

(declare-fun b!886623 () Bool)

(declare-fun e!493553 () Bool)

(assert (=> b!886623 (= e!493552 e!493553)))

(declare-fun res!601853 () Bool)

(assert (=> b!886623 (=> (not res!601853) (not e!493553))))

(assert (=> b!886623 (= res!601853 (bvslt (_1!5978 (h!18811 (t!24955 l!906))) (_1!5978 (h!18811 (t!24955 (t!24955 l!906))))))))

(declare-fun b!886624 () Bool)

(assert (=> b!886624 (= e!493553 (isStrictlySorted!490 (t!24955 (t!24955 l!906))))))

(assert (= (and d!109597 (not res!601852)) b!886623))

(assert (= (and b!886623 res!601853) b!886624))

(declare-fun m!825901 () Bool)

(assert (=> b!886624 m!825901))

(assert (=> b!886379 d!109597))

(declare-fun d!109599 () Bool)

(declare-fun lt!400934 () Bool)

(declare-fun content!396 (List!17684) (Set tuple2!11934))

(assert (=> d!109599 (= lt!400934 (set.member (tuple2!11935 key1!49 v2!16) (content!396 lt!400920)))))

(declare-fun e!493569 () Bool)

(assert (=> d!109599 (= lt!400934 e!493569)))

(declare-fun res!601869 () Bool)

(assert (=> d!109599 (=> (not res!601869) (not e!493569))))

(assert (=> d!109599 (= res!601869 (is-Cons!17680 lt!400920))))

(assert (=> d!109599 (= (contains!4274 lt!400920 (tuple2!11935 key1!49 v2!16)) lt!400934)))

(declare-fun b!886640 () Bool)

(declare-fun e!493570 () Bool)

(assert (=> b!886640 (= e!493569 e!493570)))

(declare-fun res!601868 () Bool)

(assert (=> b!886640 (=> res!601868 e!493570)))

(assert (=> b!886640 (= res!601868 (= (h!18811 lt!400920) (tuple2!11935 key1!49 v2!16)))))

(declare-fun b!886641 () Bool)

(assert (=> b!886641 (= e!493570 (contains!4274 (t!24955 lt!400920) (tuple2!11935 key1!49 v2!16)))))

(assert (= (and d!109599 res!601869) b!886640))

(assert (= (and b!886640 (not res!601868)) b!886641))

(declare-fun m!825929 () Bool)

(assert (=> d!109599 m!825929))

(declare-fun m!825931 () Bool)

(assert (=> d!109599 m!825931))

(declare-fun m!825933 () Bool)

(assert (=> b!886641 m!825933))

(assert (=> b!886502 d!109599))

(declare-fun d!109613 () Bool)

(declare-fun lt!400935 () Bool)

(assert (=> d!109613 (= lt!400935 (set.member (tuple2!11935 key1!49 v2!16) (content!396 lt!400922)))))

(declare-fun e!493571 () Bool)

(assert (=> d!109613 (= lt!400935 e!493571)))

(declare-fun res!601871 () Bool)

(assert (=> d!109613 (=> (not res!601871) (not e!493571))))

(assert (=> d!109613 (= res!601871 (is-Cons!17680 lt!400922))))

(assert (=> d!109613 (= (contains!4274 lt!400922 (tuple2!11935 key1!49 v2!16)) lt!400935)))

(declare-fun b!886642 () Bool)

(declare-fun e!493572 () Bool)

(assert (=> b!886642 (= e!493571 e!493572)))

(declare-fun res!601870 () Bool)

(assert (=> b!886642 (=> res!601870 e!493572)))

(assert (=> b!886642 (= res!601870 (= (h!18811 lt!400922) (tuple2!11935 key1!49 v2!16)))))

(declare-fun b!886643 () Bool)

(assert (=> b!886643 (= e!493572 (contains!4274 (t!24955 lt!400922) (tuple2!11935 key1!49 v2!16)))))

(assert (= (and d!109613 res!601871) b!886642))

(assert (= (and b!886642 (not res!601870)) b!886643))

(declare-fun m!825935 () Bool)

(assert (=> d!109613 m!825935))

(declare-fun m!825937 () Bool)

(assert (=> d!109613 m!825937))

(declare-fun m!825939 () Bool)

(assert (=> b!886643 m!825939))

(assert (=> b!886528 d!109613))

(declare-fun d!109615 () Bool)

(declare-fun res!601872 () Bool)

(declare-fun e!493573 () Bool)

(assert (=> d!109615 (=> res!601872 e!493573)))

(assert (=> d!109615 (= res!601872 (and (is-Cons!17680 lt!400921) (= (_1!5978 (h!18811 lt!400921)) key1!49)))))

(assert (=> d!109615 (= (containsKey!415 lt!400921 key1!49) e!493573)))

(declare-fun b!886644 () Bool)

(declare-fun e!493574 () Bool)

(assert (=> b!886644 (= e!493573 e!493574)))

(declare-fun res!601873 () Bool)

(assert (=> b!886644 (=> (not res!601873) (not e!493574))))

(assert (=> b!886644 (= res!601873 (and (or (not (is-Cons!17680 lt!400921)) (bvsle (_1!5978 (h!18811 lt!400921)) key1!49)) (is-Cons!17680 lt!400921) (bvslt (_1!5978 (h!18811 lt!400921)) key1!49)))))

(declare-fun b!886645 () Bool)

(assert (=> b!886645 (= e!493574 (containsKey!415 (t!24955 lt!400921) key1!49))))

(assert (= (and d!109615 (not res!601872)) b!886644))

(assert (= (and b!886644 res!601873) b!886645))

(declare-fun m!825941 () Bool)

(assert (=> b!886645 m!825941))

(assert (=> b!886518 d!109615))

(declare-fun d!109617 () Bool)

(declare-fun res!601874 () Bool)

(declare-fun e!493575 () Bool)

(assert (=> d!109617 (=> res!601874 e!493575)))

(assert (=> d!109617 (= res!601874 (or (is-Nil!17681 lt!400921) (is-Nil!17681 (t!24955 lt!400921))))))

(assert (=> d!109617 (= (isStrictlySorted!490 lt!400921) e!493575)))

(declare-fun b!886646 () Bool)

(declare-fun e!493576 () Bool)

(assert (=> b!886646 (= e!493575 e!493576)))

(declare-fun res!601875 () Bool)

(assert (=> b!886646 (=> (not res!601875) (not e!493576))))

(assert (=> b!886646 (= res!601875 (bvslt (_1!5978 (h!18811 lt!400921)) (_1!5978 (h!18811 (t!24955 lt!400921)))))))

(declare-fun b!886647 () Bool)

(assert (=> b!886647 (= e!493576 (isStrictlySorted!490 (t!24955 lt!400921)))))

(assert (= (and d!109617 (not res!601874)) b!886646))

(assert (= (and b!886646 res!601875) b!886647))

(declare-fun m!825943 () Bool)

(assert (=> b!886647 m!825943))

(assert (=> d!109567 d!109617))

(assert (=> d!109567 d!109549))

(declare-fun d!109619 () Bool)

(declare-fun res!601876 () Bool)

(declare-fun e!493577 () Bool)

(assert (=> d!109619 (=> res!601876 e!493577)))

(assert (=> d!109619 (= res!601876 (or (is-Nil!17681 lt!400920) (is-Nil!17681 (t!24955 lt!400920))))))

(assert (=> d!109619 (= (isStrictlySorted!490 lt!400920) e!493577)))

(declare-fun b!886648 () Bool)

(declare-fun e!493578 () Bool)

(assert (=> b!886648 (= e!493577 e!493578)))

(declare-fun res!601877 () Bool)

(assert (=> b!886648 (=> (not res!601877) (not e!493578))))

(assert (=> b!886648 (= res!601877 (bvslt (_1!5978 (h!18811 lt!400920)) (_1!5978 (h!18811 (t!24955 lt!400920)))))))

(declare-fun b!886649 () Bool)

(assert (=> b!886649 (= e!493578 (isStrictlySorted!490 (t!24955 lt!400920)))))

(assert (= (and d!109619 (not res!601876)) b!886648))

(assert (= (and b!886648 res!601877) b!886649))

(declare-fun m!825945 () Bool)

(assert (=> b!886649 m!825945))

(assert (=> d!109553 d!109619))

(declare-fun d!109621 () Bool)

(declare-fun res!601878 () Bool)

(declare-fun e!493579 () Bool)

(assert (=> d!109621 (=> res!601878 e!493579)))

(assert (=> d!109621 (= res!601878 (or (is-Nil!17681 (insertStrictlySorted!303 l!906 key1!49 v1!38)) (is-Nil!17681 (t!24955 (insertStrictlySorted!303 l!906 key1!49 v1!38)))))))

(assert (=> d!109621 (= (isStrictlySorted!490 (insertStrictlySorted!303 l!906 key1!49 v1!38)) e!493579)))

(declare-fun b!886650 () Bool)

(declare-fun e!493580 () Bool)

(assert (=> b!886650 (= e!493579 e!493580)))

(declare-fun res!601879 () Bool)

(assert (=> b!886650 (=> (not res!601879) (not e!493580))))

(assert (=> b!886650 (= res!601879 (bvslt (_1!5978 (h!18811 (insertStrictlySorted!303 l!906 key1!49 v1!38))) (_1!5978 (h!18811 (t!24955 (insertStrictlySorted!303 l!906 key1!49 v1!38))))))))

(declare-fun b!886651 () Bool)

(assert (=> b!886651 (= e!493580 (isStrictlySorted!490 (t!24955 (insertStrictlySorted!303 l!906 key1!49 v1!38))))))

(assert (= (and d!109621 (not res!601878)) b!886650))

(assert (= (and b!886650 res!601879) b!886651))

(declare-fun m!825947 () Bool)

(assert (=> b!886651 m!825947))

(assert (=> d!109553 d!109621))

(declare-fun d!109623 () Bool)

(declare-fun lt!400936 () Bool)

(assert (=> d!109623 (= lt!400936 (set.member (tuple2!11935 key1!49 v1!38) (content!396 lt!400921)))))

(declare-fun e!493581 () Bool)

(assert (=> d!109623 (= lt!400936 e!493581)))

(declare-fun res!601881 () Bool)

(assert (=> d!109623 (=> (not res!601881) (not e!493581))))

(assert (=> d!109623 (= res!601881 (is-Cons!17680 lt!400921))))

(assert (=> d!109623 (= (contains!4274 lt!400921 (tuple2!11935 key1!49 v1!38)) lt!400936)))

(declare-fun b!886652 () Bool)

(declare-fun e!493582 () Bool)

(assert (=> b!886652 (= e!493581 e!493582)))

(declare-fun res!601880 () Bool)

(assert (=> b!886652 (=> res!601880 e!493582)))

(assert (=> b!886652 (= res!601880 (= (h!18811 lt!400921) (tuple2!11935 key1!49 v1!38)))))

(declare-fun b!886653 () Bool)

(assert (=> b!886653 (= e!493582 (contains!4274 (t!24955 lt!400921) (tuple2!11935 key1!49 v1!38)))))

(assert (= (and d!109623 res!601881) b!886652))

(assert (= (and b!886652 (not res!601880)) b!886653))

(declare-fun m!825949 () Bool)

(assert (=> d!109623 m!825949))

(declare-fun m!825951 () Bool)

(assert (=> d!109623 m!825951))

(declare-fun m!825953 () Bool)

(assert (=> b!886653 m!825953))

(assert (=> b!886512 d!109623))

(declare-fun d!109625 () Bool)

(assert (=> d!109625 (= ($colon$colon!550 e!493470 (ite c!93504 (h!18811 (insertStrictlySorted!303 l!906 key1!49 v1!38)) (tuple2!11935 key1!49 v2!16))) (Cons!17680 (ite c!93504 (h!18811 (insertStrictlySorted!303 l!906 key1!49 v1!38)) (tuple2!11935 key1!49 v2!16)) e!493470))))

(assert (=> bm!39266 d!109625))

(declare-fun d!109627 () Bool)

(assert (=> d!109627 (= ($colon$colon!550 e!493486 (ite c!93512 (h!18811 l!906) (tuple2!11935 key1!49 v2!16))) (Cons!17680 (ite c!93512 (h!18811 l!906) (tuple2!11935 key1!49 v2!16)) e!493486))))

(assert (=> bm!39272 d!109627))

(declare-fun b!886654 () Bool)

(declare-fun e!493587 () List!17684)

(declare-fun call!39290 () List!17684)

(assert (=> b!886654 (= e!493587 call!39290)))

(declare-fun bm!39285 () Bool)

(declare-fun call!39289 () List!17684)

(declare-fun call!39288 () List!17684)

(assert (=> bm!39285 (= call!39289 call!39288)))

(declare-fun b!886655 () Bool)

(declare-fun e!493584 () List!17684)

(assert (=> b!886655 (= e!493587 e!493584)))

(declare-fun c!93533 () Bool)

(assert (=> b!886655 (= c!93533 (and (is-Cons!17680 (t!24955 (insertStrictlySorted!303 l!906 key1!49 v1!38))) (= (_1!5978 (h!18811 (t!24955 (insertStrictlySorted!303 l!906 key1!49 v1!38)))) key1!49)))))

(declare-fun e!493585 () Bool)

(declare-fun b!886656 () Bool)

(declare-fun lt!400937 () List!17684)

(assert (=> b!886656 (= e!493585 (contains!4274 lt!400937 (tuple2!11935 key1!49 v2!16)))))

(declare-fun b!886657 () Bool)

(declare-fun e!493586 () List!17684)

(assert (=> b!886657 (= e!493586 call!39289)))

(declare-fun b!886658 () Bool)

(assert (=> b!886658 (= e!493586 call!39289)))

(declare-fun bm!39286 () Bool)

(assert (=> bm!39286 (= call!39288 call!39290)))

(declare-fun e!493583 () List!17684)

(declare-fun bm!39287 () Bool)

(declare-fun c!93532 () Bool)

(assert (=> bm!39287 (= call!39290 ($colon$colon!550 e!493583 (ite c!93532 (h!18811 (t!24955 (insertStrictlySorted!303 l!906 key1!49 v1!38))) (tuple2!11935 key1!49 v2!16))))))

(declare-fun c!93531 () Bool)

(assert (=> bm!39287 (= c!93531 c!93532)))

(declare-fun b!886659 () Bool)

(assert (=> b!886659 (= e!493583 (insertStrictlySorted!303 (t!24955 (t!24955 (insertStrictlySorted!303 l!906 key1!49 v1!38))) key1!49 v2!16))))

(declare-fun d!109629 () Bool)

(assert (=> d!109629 e!493585))

(declare-fun res!601882 () Bool)

(assert (=> d!109629 (=> (not res!601882) (not e!493585))))

(assert (=> d!109629 (= res!601882 (isStrictlySorted!490 lt!400937))))

(assert (=> d!109629 (= lt!400937 e!493587)))

(assert (=> d!109629 (= c!93532 (and (is-Cons!17680 (t!24955 (insertStrictlySorted!303 l!906 key1!49 v1!38))) (bvslt (_1!5978 (h!18811 (t!24955 (insertStrictlySorted!303 l!906 key1!49 v1!38)))) key1!49)))))

(assert (=> d!109629 (isStrictlySorted!490 (t!24955 (insertStrictlySorted!303 l!906 key1!49 v1!38)))))

(assert (=> d!109629 (= (insertStrictlySorted!303 (t!24955 (insertStrictlySorted!303 l!906 key1!49 v1!38)) key1!49 v2!16) lt!400937)))

(declare-fun b!886660 () Bool)

(declare-fun c!93530 () Bool)

(assert (=> b!886660 (= c!93530 (and (is-Cons!17680 (t!24955 (insertStrictlySorted!303 l!906 key1!49 v1!38))) (bvsgt (_1!5978 (h!18811 (t!24955 (insertStrictlySorted!303 l!906 key1!49 v1!38)))) key1!49)))))

(assert (=> b!886660 (= e!493584 e!493586)))

(declare-fun b!886661 () Bool)

(assert (=> b!886661 (= e!493583 (ite c!93533 (t!24955 (t!24955 (insertStrictlySorted!303 l!906 key1!49 v1!38))) (ite c!93530 (Cons!17680 (h!18811 (t!24955 (insertStrictlySorted!303 l!906 key1!49 v1!38))) (t!24955 (t!24955 (insertStrictlySorted!303 l!906 key1!49 v1!38)))) Nil!17681)))))

(declare-fun b!886662 () Bool)

(declare-fun res!601883 () Bool)

(assert (=> b!886662 (=> (not res!601883) (not e!493585))))

(assert (=> b!886662 (= res!601883 (containsKey!415 lt!400937 key1!49))))

(declare-fun b!886663 () Bool)

(assert (=> b!886663 (= e!493584 call!39288)))

(assert (= (and d!109629 c!93532) b!886654))

(assert (= (and d!109629 (not c!93532)) b!886655))

(assert (= (and b!886655 c!93533) b!886663))

(assert (= (and b!886655 (not c!93533)) b!886660))

(assert (= (and b!886660 c!93530) b!886658))

(assert (= (and b!886660 (not c!93530)) b!886657))

(assert (= (or b!886658 b!886657) bm!39285))

(assert (= (or b!886663 bm!39285) bm!39286))

(assert (= (or b!886654 bm!39286) bm!39287))

(assert (= (and bm!39287 c!93531) b!886659))

(assert (= (and bm!39287 (not c!93531)) b!886661))

(assert (= (and d!109629 res!601882) b!886662))

(assert (= (and b!886662 res!601883) b!886656))

(declare-fun m!825955 () Bool)

(assert (=> d!109629 m!825955))

(assert (=> d!109629 m!825947))

(declare-fun m!825957 () Bool)

(assert (=> bm!39287 m!825957))

(declare-fun m!825959 () Bool)

(assert (=> b!886662 m!825959))

(declare-fun m!825961 () Bool)

(assert (=> b!886656 m!825961))

(declare-fun m!825963 () Bool)

(assert (=> b!886659 m!825963))

(assert (=> b!886505 d!109629))

(declare-fun b!886664 () Bool)

(declare-fun e!493592 () List!17684)

(declare-fun call!39293 () List!17684)

(assert (=> b!886664 (= e!493592 call!39293)))

(declare-fun bm!39288 () Bool)

(declare-fun call!39292 () List!17684)

(declare-fun call!39291 () List!17684)

(assert (=> bm!39288 (= call!39292 call!39291)))

(declare-fun b!886665 () Bool)

(declare-fun e!493589 () List!17684)

(assert (=> b!886665 (= e!493592 e!493589)))

(declare-fun c!93537 () Bool)

(assert (=> b!886665 (= c!93537 (and (is-Cons!17680 (t!24955 l!906)) (= (_1!5978 (h!18811 (t!24955 l!906))) key1!49)))))

(declare-fun b!886666 () Bool)

(declare-fun lt!400938 () List!17684)

(declare-fun e!493590 () Bool)

(assert (=> b!886666 (= e!493590 (contains!4274 lt!400938 (tuple2!11935 key1!49 v2!16)))))

(declare-fun b!886667 () Bool)

(declare-fun e!493591 () List!17684)

(assert (=> b!886667 (= e!493591 call!39292)))

(declare-fun b!886668 () Bool)

(assert (=> b!886668 (= e!493591 call!39292)))

(declare-fun bm!39289 () Bool)

(assert (=> bm!39289 (= call!39291 call!39293)))

(declare-fun c!93536 () Bool)

(declare-fun bm!39290 () Bool)

(declare-fun e!493588 () List!17684)

(assert (=> bm!39290 (= call!39293 ($colon$colon!550 e!493588 (ite c!93536 (h!18811 (t!24955 l!906)) (tuple2!11935 key1!49 v2!16))))))

(declare-fun c!93535 () Bool)

(assert (=> bm!39290 (= c!93535 c!93536)))

(declare-fun b!886669 () Bool)

(assert (=> b!886669 (= e!493588 (insertStrictlySorted!303 (t!24955 (t!24955 l!906)) key1!49 v2!16))))

(declare-fun d!109631 () Bool)

(assert (=> d!109631 e!493590))

(declare-fun res!601884 () Bool)

(assert (=> d!109631 (=> (not res!601884) (not e!493590))))

(assert (=> d!109631 (= res!601884 (isStrictlySorted!490 lt!400938))))

(assert (=> d!109631 (= lt!400938 e!493592)))

(assert (=> d!109631 (= c!93536 (and (is-Cons!17680 (t!24955 l!906)) (bvslt (_1!5978 (h!18811 (t!24955 l!906))) key1!49)))))

(assert (=> d!109631 (isStrictlySorted!490 (t!24955 l!906))))

(assert (=> d!109631 (= (insertStrictlySorted!303 (t!24955 l!906) key1!49 v2!16) lt!400938)))

(declare-fun b!886670 () Bool)

(declare-fun c!93534 () Bool)

(assert (=> b!886670 (= c!93534 (and (is-Cons!17680 (t!24955 l!906)) (bvsgt (_1!5978 (h!18811 (t!24955 l!906))) key1!49)))))

(assert (=> b!886670 (= e!493589 e!493591)))

(declare-fun b!886671 () Bool)

(assert (=> b!886671 (= e!493588 (ite c!93537 (t!24955 (t!24955 l!906)) (ite c!93534 (Cons!17680 (h!18811 (t!24955 l!906)) (t!24955 (t!24955 l!906))) Nil!17681)))))

(declare-fun b!886672 () Bool)

(declare-fun res!601885 () Bool)

(assert (=> b!886672 (=> (not res!601885) (not e!493590))))

(assert (=> b!886672 (= res!601885 (containsKey!415 lt!400938 key1!49))))

(declare-fun b!886673 () Bool)

(assert (=> b!886673 (= e!493589 call!39291)))

(assert (= (and d!109631 c!93536) b!886664))

(assert (= (and d!109631 (not c!93536)) b!886665))

(assert (= (and b!886665 c!93537) b!886673))

(assert (= (and b!886665 (not c!93537)) b!886670))

(assert (= (and b!886670 c!93534) b!886668))

(assert (= (and b!886670 (not c!93534)) b!886667))

(assert (= (or b!886668 b!886667) bm!39288))

(assert (= (or b!886673 bm!39288) bm!39289))

(assert (= (or b!886664 bm!39289) bm!39290))

(assert (= (and bm!39290 c!93535) b!886669))

(assert (= (and bm!39290 (not c!93535)) b!886671))

(assert (= (and d!109631 res!601884) b!886672))

(assert (= (and b!886672 res!601885) b!886666))

(declare-fun m!825965 () Bool)

(assert (=> d!109631 m!825965))

(assert (=> d!109631 m!825749))

(declare-fun m!825967 () Bool)

(assert (=> bm!39290 m!825967))

(declare-fun m!825969 () Bool)

(assert (=> b!886672 m!825969))

(declare-fun m!825971 () Bool)

(assert (=> b!886666 m!825971))

(declare-fun m!825973 () Bool)

(assert (=> b!886669 m!825973))

(assert (=> b!886531 d!109631))

(declare-fun d!109633 () Bool)

(assert (=> d!109633 (= ($colon$colon!550 e!493475 (ite c!93508 (h!18811 l!906) (tuple2!11935 key1!49 v1!38))) (Cons!17680 (ite c!93508 (h!18811 l!906) (tuple2!11935 key1!49 v1!38)) e!493475))))

(assert (=> bm!39269 d!109633))

(declare-fun d!109635 () Bool)

(declare-fun res!601886 () Bool)

(declare-fun e!493593 () Bool)

(assert (=> d!109635 (=> res!601886 e!493593)))

(assert (=> d!109635 (= res!601886 (or (is-Nil!17681 lt!400922) (is-Nil!17681 (t!24955 lt!400922))))))

(assert (=> d!109635 (= (isStrictlySorted!490 lt!400922) e!493593)))

(declare-fun b!886674 () Bool)

(declare-fun e!493594 () Bool)

(assert (=> b!886674 (= e!493593 e!493594)))

(declare-fun res!601887 () Bool)

(assert (=> b!886674 (=> (not res!601887) (not e!493594))))

(assert (=> b!886674 (= res!601887 (bvslt (_1!5978 (h!18811 lt!400922)) (_1!5978 (h!18811 (t!24955 lt!400922)))))))

(declare-fun b!886675 () Bool)

(assert (=> b!886675 (= e!493594 (isStrictlySorted!490 (t!24955 lt!400922)))))

(assert (= (and d!109635 (not res!601886)) b!886674))

(assert (= (and b!886674 res!601887) b!886675))

(declare-fun m!825975 () Bool)

(assert (=> b!886675 m!825975))

(assert (=> d!109569 d!109635))

(assert (=> d!109569 d!109549))

(declare-fun d!109637 () Bool)

(declare-fun res!601888 () Bool)

(declare-fun e!493595 () Bool)

(assert (=> d!109637 (=> res!601888 e!493595)))

(assert (=> d!109637 (= res!601888 (and (is-Cons!17680 lt!400920) (= (_1!5978 (h!18811 lt!400920)) key1!49)))))

(assert (=> d!109637 (= (containsKey!415 lt!400920 key1!49) e!493595)))

(declare-fun b!886676 () Bool)

(declare-fun e!493596 () Bool)

(assert (=> b!886676 (= e!493595 e!493596)))

(declare-fun res!601889 () Bool)

(assert (=> b!886676 (=> (not res!601889) (not e!493596))))

(assert (=> b!886676 (= res!601889 (and (or (not (is-Cons!17680 lt!400920)) (bvsle (_1!5978 (h!18811 lt!400920)) key1!49)) (is-Cons!17680 lt!400920) (bvslt (_1!5978 (h!18811 lt!400920)) key1!49)))))

(declare-fun b!886677 () Bool)

(assert (=> b!886677 (= e!493596 (containsKey!415 (t!24955 lt!400920) key1!49))))

(assert (= (and d!109637 (not res!601888)) b!886676))

(assert (= (and b!886676 res!601889) b!886677))

(declare-fun m!825977 () Bool)

(assert (=> b!886677 m!825977))

(assert (=> b!886508 d!109637))

(declare-fun b!886678 () Bool)

(declare-fun e!493597 () Bool)

(declare-fun tp!54404 () Bool)

(assert (=> b!886678 (= e!493597 (and tp_is_empty!17819 tp!54404))))

(assert (=> b!886553 (= tp!54399 e!493597)))

(assert (= (and b!886553 (is-Cons!17680 (t!24955 (t!24955 l!906)))) b!886678))

(push 1)

(assert (not b!886649))

(assert (not d!109629))

(assert (not b!886606))

(assert (not d!109589))

(assert (not b!886641))

(assert (not bm!39281))

(assert (not b!886609))

(assert (not bm!39290))

(assert tp_is_empty!17819)

(assert (not b!886624))

(assert (not d!109613))

(assert (not b!886647))

(assert (not b!886678))

(assert (not b!886677))

(assert (not b!886666))

(assert (not b!886651))

(assert (not b!886653))

(assert (not b!886659))

(assert (not b!886600))

(assert (not b!886645))

(assert (not b!886672))

(assert (not b!886643))

(assert (not d!109623))

(assert (not bm!39287))

(assert (not d!109631))

(assert (not b!886675))

(assert (not b!886669))

(assert (not b!886603))

(assert (not d!109599))

(assert (not b!886656))

(assert (not b!886662))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

