; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75094 () Bool)

(assert start!75094)

(declare-fun b!885301 () Bool)

(declare-fun res!601295 () Bool)

(declare-fun e!492708 () Bool)

(assert (=> b!885301 (=> (not res!601295) (not e!492708))))

(declare-datatypes ((B!1250 0))(
  ( (B!1251 (val!8931 Int)) )
))
(declare-datatypes ((tuple2!11856 0))(
  ( (tuple2!11857 (_1!5939 (_ BitVec 64)) (_2!5939 B!1250)) )
))
(declare-datatypes ((List!17647 0))(
  ( (Nil!17644) (Cons!17643 (h!18774 tuple2!11856) (t!24924 List!17647)) )
))
(declare-fun l!906 () List!17647)

(declare-fun key1!49 () (_ BitVec 64))

(assert (=> b!885301 (= res!601295 (and (is-Cons!17643 l!906) (bvslt (_1!5939 (h!18774 l!906)) key1!49)))))

(declare-fun b!885304 () Bool)

(declare-fun e!492707 () Bool)

(declare-fun tp_is_empty!17761 () Bool)

(declare-fun tp!54248 () Bool)

(assert (=> b!885304 (= e!492707 (and tp_is_empty!17761 tp!54248))))

(declare-fun res!601296 () Bool)

(assert (=> start!75094 (=> (not res!601296) (not e!492708))))

(declare-fun isStrictlySorted!471 (List!17647) Bool)

(assert (=> start!75094 (= res!601296 (isStrictlySorted!471 l!906))))

(assert (=> start!75094 e!492708))

(assert (=> start!75094 e!492707))

(assert (=> start!75094 true))

(assert (=> start!75094 tp_is_empty!17761))

(declare-fun b!885302 () Bool)

(declare-fun res!601297 () Bool)

(assert (=> b!885302 (=> (not res!601297) (not e!492708))))

(assert (=> b!885302 (= res!601297 (isStrictlySorted!471 (t!24924 l!906)))))

(declare-fun b!885303 () Bool)

(declare-fun v1!38 () B!1250)

(declare-fun insertStrictlySorted!288 (List!17647 (_ BitVec 64) B!1250) List!17647)

(assert (=> b!885303 (= e!492708 (not (isStrictlySorted!471 (insertStrictlySorted!288 l!906 key1!49 v1!38))))))

(declare-fun v2!16 () B!1250)

(assert (=> b!885303 (= (insertStrictlySorted!288 (insertStrictlySorted!288 (t!24924 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!288 (t!24924 l!906) key1!49 v2!16))))

(declare-datatypes ((Unit!30228 0))(
  ( (Unit!30229) )
))
(declare-fun lt!400993 () Unit!30228)

(declare-fun lemmaInsertStrictlySortedErasesIfSameKey!7 (List!17647 (_ BitVec 64) B!1250 B!1250) Unit!30228)

(assert (=> b!885303 (= lt!400993 (lemmaInsertStrictlySortedErasesIfSameKey!7 (t!24924 l!906) key1!49 v1!38 v2!16))))

(assert (= (and start!75094 res!601296) b!885301))

(assert (= (and b!885301 res!601295) b!885302))

(assert (= (and b!885302 res!601297) b!885303))

(assert (= (and start!75094 (is-Cons!17643 l!906)) b!885304))

(declare-fun m!825559 () Bool)

(assert (=> start!75094 m!825559))

(declare-fun m!825561 () Bool)

(assert (=> b!885302 m!825561))

(declare-fun m!825563 () Bool)

(assert (=> b!885303 m!825563))

(declare-fun m!825565 () Bool)

(assert (=> b!885303 m!825565))

(declare-fun m!825567 () Bool)

(assert (=> b!885303 m!825567))

(declare-fun m!825569 () Bool)

(assert (=> b!885303 m!825569))

(declare-fun m!825571 () Bool)

(assert (=> b!885303 m!825571))

(assert (=> b!885303 m!825569))

(declare-fun m!825573 () Bool)

(assert (=> b!885303 m!825573))

(assert (=> b!885303 m!825563))

(push 1)

(assert tp_is_empty!17761)

(assert (not b!885304))

(assert (not b!885302))

(assert (not start!75094))

(assert (not b!885303))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!109369 () Bool)

(assert (=> d!109369 (= (insertStrictlySorted!288 (insertStrictlySorted!288 (t!24924 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!288 (t!24924 l!906) key1!49 v2!16))))

(declare-fun lt!401005 () Unit!30228)

(declare-fun choose!1448 (List!17647 (_ BitVec 64) B!1250 B!1250) Unit!30228)

(assert (=> d!109369 (= lt!401005 (choose!1448 (t!24924 l!906) key1!49 v1!38 v2!16))))

(assert (=> d!109369 (isStrictlySorted!471 (t!24924 l!906))))

(assert (=> d!109369 (= (lemmaInsertStrictlySortedErasesIfSameKey!7 (t!24924 l!906) key1!49 v1!38 v2!16) lt!401005)))

(declare-fun bs!24823 () Bool)

(assert (= bs!24823 d!109369))

(assert (=> bs!24823 m!825563))

(assert (=> bs!24823 m!825565))

(declare-fun m!825609 () Bool)

(assert (=> bs!24823 m!825609))

(assert (=> bs!24823 m!825561))

(assert (=> bs!24823 m!825573))

(assert (=> bs!24823 m!825563))

(assert (=> b!885303 d!109369))

(declare-fun b!885406 () Bool)

(declare-fun e!492763 () List!17647)

(declare-fun e!492762 () List!17647)

(assert (=> b!885406 (= e!492763 e!492762)))

(declare-fun c!93280 () Bool)

(assert (=> b!885406 (= c!93280 (and (is-Cons!17643 (insertStrictlySorted!288 (t!24924 l!906) key1!49 v1!38)) (= (_1!5939 (h!18774 (insertStrictlySorted!288 (t!24924 l!906) key1!49 v1!38))) key1!49)))))

(declare-fun b!885407 () Bool)

(declare-fun c!93281 () Bool)

(assert (=> b!885407 (= c!93281 (and (is-Cons!17643 (insertStrictlySorted!288 (t!24924 l!906) key1!49 v1!38)) (bvsgt (_1!5939 (h!18774 (insertStrictlySorted!288 (t!24924 l!906) key1!49 v1!38))) key1!49)))))

(declare-fun e!492761 () List!17647)

(assert (=> b!885407 (= e!492762 e!492761)))

(declare-fun bm!39089 () Bool)

(declare-fun call!39094 () List!17647)

(declare-fun call!39093 () List!17647)

(assert (=> bm!39089 (= call!39094 call!39093)))

(declare-fun b!885408 () Bool)

(declare-fun res!601329 () Bool)

(declare-fun e!492759 () Bool)

(assert (=> b!885408 (=> (not res!601329) (not e!492759))))

(declare-fun lt!401017 () List!17647)

(declare-fun containsKey!408 (List!17647 (_ BitVec 64)) Bool)

(assert (=> b!885408 (= res!601329 (containsKey!408 lt!401017 key1!49))))

(declare-fun bm!39090 () Bool)

(declare-fun call!39092 () List!17647)

(assert (=> bm!39090 (= call!39093 call!39092)))

(declare-fun b!885409 () Bool)

(declare-fun contains!4291 (List!17647 tuple2!11856) Bool)

(assert (=> b!885409 (= e!492759 (contains!4291 lt!401017 (tuple2!11857 key1!49 v2!16)))))

(declare-fun b!885410 () Bool)

(assert (=> b!885410 (= e!492762 call!39093)))

(declare-fun b!885411 () Bool)

(declare-fun e!492760 () List!17647)

(assert (=> b!885411 (= e!492760 (insertStrictlySorted!288 (t!24924 (insertStrictlySorted!288 (t!24924 l!906) key1!49 v1!38)) key1!49 v2!16))))

(declare-fun b!885412 () Bool)

(assert (=> b!885412 (= e!492760 (ite c!93280 (t!24924 (insertStrictlySorted!288 (t!24924 l!906) key1!49 v1!38)) (ite c!93281 (Cons!17643 (h!18774 (insertStrictlySorted!288 (t!24924 l!906) key1!49 v1!38)) (t!24924 (insertStrictlySorted!288 (t!24924 l!906) key1!49 v1!38))) Nil!17644)))))

(declare-fun b!885413 () Bool)

(assert (=> b!885413 (= e!492761 call!39094)))

(declare-fun b!885405 () Bool)

(assert (=> b!885405 (= e!492763 call!39092)))

(declare-fun d!109375 () Bool)

(assert (=> d!109375 e!492759))

(declare-fun res!601328 () Bool)

(assert (=> d!109375 (=> (not res!601328) (not e!492759))))

(assert (=> d!109375 (= res!601328 (isStrictlySorted!471 lt!401017))))

(assert (=> d!109375 (= lt!401017 e!492763)))

(declare-fun c!93278 () Bool)

(assert (=> d!109375 (= c!93278 (and (is-Cons!17643 (insertStrictlySorted!288 (t!24924 l!906) key1!49 v1!38)) (bvslt (_1!5939 (h!18774 (insertStrictlySorted!288 (t!24924 l!906) key1!49 v1!38))) key1!49)))))

(assert (=> d!109375 (isStrictlySorted!471 (insertStrictlySorted!288 (t!24924 l!906) key1!49 v1!38))))

(assert (=> d!109375 (= (insertStrictlySorted!288 (insertStrictlySorted!288 (t!24924 l!906) key1!49 v1!38) key1!49 v2!16) lt!401017)))

(declare-fun bm!39091 () Bool)

(declare-fun $colon$colon!543 (List!17647 tuple2!11856) List!17647)

(assert (=> bm!39091 (= call!39092 ($colon$colon!543 e!492760 (ite c!93278 (h!18774 (insertStrictlySorted!288 (t!24924 l!906) key1!49 v1!38)) (tuple2!11857 key1!49 v2!16))))))

(declare-fun c!93279 () Bool)

(assert (=> bm!39091 (= c!93279 c!93278)))

(declare-fun b!885414 () Bool)

(assert (=> b!885414 (= e!492761 call!39094)))

(assert (= (and d!109375 c!93278) b!885405))

(assert (= (and d!109375 (not c!93278)) b!885406))

(assert (= (and b!885406 c!93280) b!885410))

(assert (= (and b!885406 (not c!93280)) b!885407))

(assert (= (and b!885407 c!93281) b!885413))

(assert (= (and b!885407 (not c!93281)) b!885414))

(assert (= (or b!885413 b!885414) bm!39089))

(assert (= (or b!885410 bm!39089) bm!39090))

(assert (= (or b!885405 bm!39090) bm!39091))

(assert (= (and bm!39091 c!93279) b!885411))

(assert (= (and bm!39091 (not c!93279)) b!885412))

(assert (= (and d!109375 res!601328) b!885408))

(assert (= (and b!885408 res!601329) b!885409))

(declare-fun m!825635 () Bool)

(assert (=> b!885411 m!825635))

(declare-fun m!825637 () Bool)

(assert (=> b!885408 m!825637))

(declare-fun m!825639 () Bool)

(assert (=> d!109375 m!825639))

(assert (=> d!109375 m!825563))

(declare-fun m!825641 () Bool)

(assert (=> d!109375 m!825641))

(declare-fun m!825647 () Bool)

(assert (=> b!885409 m!825647))

(declare-fun m!825651 () Bool)

(assert (=> bm!39091 m!825651))

(assert (=> b!885303 d!109375))

(declare-fun b!885430 () Bool)

(declare-fun e!492775 () List!17647)

(declare-fun e!492774 () List!17647)

(assert (=> b!885430 (= e!492775 e!492774)))

(declare-fun c!93288 () Bool)

(assert (=> b!885430 (= c!93288 (and (is-Cons!17643 (t!24924 l!906)) (= (_1!5939 (h!18774 (t!24924 l!906))) key1!49)))))

(declare-fun b!885431 () Bool)

(declare-fun c!93289 () Bool)

(assert (=> b!885431 (= c!93289 (and (is-Cons!17643 (t!24924 l!906)) (bvsgt (_1!5939 (h!18774 (t!24924 l!906))) key1!49)))))

(declare-fun e!492773 () List!17647)

(assert (=> b!885431 (= e!492774 e!492773)))

(declare-fun bm!39095 () Bool)

(declare-fun call!39100 () List!17647)

(declare-fun call!39099 () List!17647)

(assert (=> bm!39095 (= call!39100 call!39099)))

(declare-fun b!885432 () Bool)

(declare-fun res!601337 () Bool)

(declare-fun e!492771 () Bool)

(assert (=> b!885432 (=> (not res!601337) (not e!492771))))

(declare-fun lt!401019 () List!17647)

(assert (=> b!885432 (= res!601337 (containsKey!408 lt!401019 key1!49))))

(declare-fun bm!39096 () Bool)

(declare-fun call!39098 () List!17647)

(assert (=> bm!39096 (= call!39099 call!39098)))

(declare-fun b!885433 () Bool)

(assert (=> b!885433 (= e!492771 (contains!4291 lt!401019 (tuple2!11857 key1!49 v2!16)))))

(declare-fun b!885434 () Bool)

(assert (=> b!885434 (= e!492774 call!39099)))

(declare-fun e!492772 () List!17647)

(declare-fun b!885435 () Bool)

(assert (=> b!885435 (= e!492772 (insertStrictlySorted!288 (t!24924 (t!24924 l!906)) key1!49 v2!16))))

(declare-fun b!885436 () Bool)

(assert (=> b!885436 (= e!492772 (ite c!93288 (t!24924 (t!24924 l!906)) (ite c!93289 (Cons!17643 (h!18774 (t!24924 l!906)) (t!24924 (t!24924 l!906))) Nil!17644)))))

(declare-fun b!885437 () Bool)

(assert (=> b!885437 (= e!492773 call!39100)))

(declare-fun b!885429 () Bool)

(assert (=> b!885429 (= e!492775 call!39098)))

(declare-fun d!109383 () Bool)

(assert (=> d!109383 e!492771))

(declare-fun res!601336 () Bool)

(assert (=> d!109383 (=> (not res!601336) (not e!492771))))

(assert (=> d!109383 (= res!601336 (isStrictlySorted!471 lt!401019))))

(assert (=> d!109383 (= lt!401019 e!492775)))

(declare-fun c!93286 () Bool)

(assert (=> d!109383 (= c!93286 (and (is-Cons!17643 (t!24924 l!906)) (bvslt (_1!5939 (h!18774 (t!24924 l!906))) key1!49)))))

(assert (=> d!109383 (isStrictlySorted!471 (t!24924 l!906))))

(assert (=> d!109383 (= (insertStrictlySorted!288 (t!24924 l!906) key1!49 v2!16) lt!401019)))

(declare-fun bm!39097 () Bool)

(assert (=> bm!39097 (= call!39098 ($colon$colon!543 e!492772 (ite c!93286 (h!18774 (t!24924 l!906)) (tuple2!11857 key1!49 v2!16))))))

(declare-fun c!93287 () Bool)

(assert (=> bm!39097 (= c!93287 c!93286)))

(declare-fun b!885438 () Bool)

(assert (=> b!885438 (= e!492773 call!39100)))

(assert (= (and d!109383 c!93286) b!885429))

(assert (= (and d!109383 (not c!93286)) b!885430))

(assert (= (and b!885430 c!93288) b!885434))

(assert (= (and b!885430 (not c!93288)) b!885431))

(assert (= (and b!885431 c!93289) b!885437))

(assert (= (and b!885431 (not c!93289)) b!885438))

(assert (= (or b!885437 b!885438) bm!39095))

(assert (= (or b!885434 bm!39095) bm!39096))

(assert (= (or b!885429 bm!39096) bm!39097))

(assert (= (and bm!39097 c!93287) b!885435))

(assert (= (and bm!39097 (not c!93287)) b!885436))

(assert (= (and d!109383 res!601336) b!885432))

(assert (= (and b!885432 res!601337) b!885433))

(declare-fun m!825657 () Bool)

(assert (=> b!885435 m!825657))

(declare-fun m!825659 () Bool)

(assert (=> b!885432 m!825659))

(declare-fun m!825661 () Bool)

(assert (=> d!109383 m!825661))

(assert (=> d!109383 m!825561))

(declare-fun m!825667 () Bool)

(assert (=> b!885433 m!825667))

(declare-fun m!825669 () Bool)

(assert (=> bm!39097 m!825669))

(assert (=> b!885303 d!109383))

(declare-fun b!885450 () Bool)

(declare-fun e!492785 () List!17647)

(declare-fun e!492784 () List!17647)

(assert (=> b!885450 (= e!492785 e!492784)))

(declare-fun c!93296 () Bool)

(assert (=> b!885450 (= c!93296 (and (is-Cons!17643 (t!24924 l!906)) (= (_1!5939 (h!18774 (t!24924 l!906))) key1!49)))))

(declare-fun b!885451 () Bool)

(declare-fun c!93297 () Bool)

(assert (=> b!885451 (= c!93297 (and (is-Cons!17643 (t!24924 l!906)) (bvsgt (_1!5939 (h!18774 (t!24924 l!906))) key1!49)))))

(declare-fun e!492783 () List!17647)

(assert (=> b!885451 (= e!492784 e!492783)))

(declare-fun bm!39101 () Bool)

(declare-fun call!39106 () List!17647)

(declare-fun call!39105 () List!17647)

(assert (=> bm!39101 (= call!39106 call!39105)))

(declare-fun b!885452 () Bool)

(declare-fun res!601341 () Bool)

(declare-fun e!492781 () Bool)

(assert (=> b!885452 (=> (not res!601341) (not e!492781))))

(declare-fun lt!401021 () List!17647)

(assert (=> b!885452 (= res!601341 (containsKey!408 lt!401021 key1!49))))

(declare-fun bm!39102 () Bool)

(declare-fun call!39104 () List!17647)

(assert (=> bm!39102 (= call!39105 call!39104)))

(declare-fun b!885453 () Bool)

(assert (=> b!885453 (= e!492781 (contains!4291 lt!401021 (tuple2!11857 key1!49 v1!38)))))

(declare-fun b!885454 () Bool)

(assert (=> b!885454 (= e!492784 call!39105)))

(declare-fun e!492782 () List!17647)

(declare-fun b!885455 () Bool)

(assert (=> b!885455 (= e!492782 (insertStrictlySorted!288 (t!24924 (t!24924 l!906)) key1!49 v1!38))))

(declare-fun b!885456 () Bool)

(assert (=> b!885456 (= e!492782 (ite c!93296 (t!24924 (t!24924 l!906)) (ite c!93297 (Cons!17643 (h!18774 (t!24924 l!906)) (t!24924 (t!24924 l!906))) Nil!17644)))))

(declare-fun b!885457 () Bool)

(assert (=> b!885457 (= e!492783 call!39106)))

(declare-fun b!885449 () Bool)

(assert (=> b!885449 (= e!492785 call!39104)))

(declare-fun d!109387 () Bool)

(assert (=> d!109387 e!492781))

(declare-fun res!601340 () Bool)

(assert (=> d!109387 (=> (not res!601340) (not e!492781))))

(assert (=> d!109387 (= res!601340 (isStrictlySorted!471 lt!401021))))

(assert (=> d!109387 (= lt!401021 e!492785)))

(declare-fun c!93294 () Bool)

(assert (=> d!109387 (= c!93294 (and (is-Cons!17643 (t!24924 l!906)) (bvslt (_1!5939 (h!18774 (t!24924 l!906))) key1!49)))))

(assert (=> d!109387 (isStrictlySorted!471 (t!24924 l!906))))

(assert (=> d!109387 (= (insertStrictlySorted!288 (t!24924 l!906) key1!49 v1!38) lt!401021)))

(declare-fun bm!39103 () Bool)

(assert (=> bm!39103 (= call!39104 ($colon$colon!543 e!492782 (ite c!93294 (h!18774 (t!24924 l!906)) (tuple2!11857 key1!49 v1!38))))))

(declare-fun c!93295 () Bool)

(assert (=> bm!39103 (= c!93295 c!93294)))

(declare-fun b!885458 () Bool)

(assert (=> b!885458 (= e!492783 call!39106)))

(assert (= (and d!109387 c!93294) b!885449))

(assert (= (and d!109387 (not c!93294)) b!885450))

(assert (= (and b!885450 c!93296) b!885454))

(assert (= (and b!885450 (not c!93296)) b!885451))

(assert (= (and b!885451 c!93297) b!885457))

(assert (= (and b!885451 (not c!93297)) b!885458))

(assert (= (or b!885457 b!885458) bm!39101))

(assert (= (or b!885454 bm!39101) bm!39102))

(assert (= (or b!885449 bm!39102) bm!39103))

(assert (= (and bm!39103 c!93295) b!885455))

(assert (= (and bm!39103 (not c!93295)) b!885456))

(assert (= (and d!109387 res!601340) b!885452))

(assert (= (and b!885452 res!601341) b!885453))

(declare-fun m!825675 () Bool)

(assert (=> b!885455 m!825675))

(declare-fun m!825677 () Bool)

(assert (=> b!885452 m!825677))

(declare-fun m!825679 () Bool)

(assert (=> d!109387 m!825679))

(assert (=> d!109387 m!825561))

(declare-fun m!825681 () Bool)

(assert (=> b!885453 m!825681))

(declare-fun m!825683 () Bool)

(assert (=> bm!39103 m!825683))

(assert (=> b!885303 d!109387))

(declare-fun b!885460 () Bool)

(declare-fun e!492790 () List!17647)

(declare-fun e!492789 () List!17647)

(assert (=> b!885460 (= e!492790 e!492789)))

(declare-fun c!93300 () Bool)

(assert (=> b!885460 (= c!93300 (and (is-Cons!17643 l!906) (= (_1!5939 (h!18774 l!906)) key1!49)))))

(declare-fun b!885461 () Bool)

(declare-fun c!93301 () Bool)

(assert (=> b!885461 (= c!93301 (and (is-Cons!17643 l!906) (bvsgt (_1!5939 (h!18774 l!906)) key1!49)))))

(declare-fun e!492788 () List!17647)

(assert (=> b!885461 (= e!492789 e!492788)))

(declare-fun bm!39104 () Bool)

(declare-fun call!39109 () List!17647)

(declare-fun call!39108 () List!17647)

(assert (=> bm!39104 (= call!39109 call!39108)))

(declare-fun b!885462 () Bool)

(declare-fun res!601343 () Bool)

(declare-fun e!492786 () Bool)

(assert (=> b!885462 (=> (not res!601343) (not e!492786))))

(declare-fun lt!401022 () List!17647)

(assert (=> b!885462 (= res!601343 (containsKey!408 lt!401022 key1!49))))

(declare-fun bm!39105 () Bool)

(declare-fun call!39107 () List!17647)

(assert (=> bm!39105 (= call!39108 call!39107)))

(declare-fun b!885463 () Bool)

(assert (=> b!885463 (= e!492786 (contains!4291 lt!401022 (tuple2!11857 key1!49 v1!38)))))

(declare-fun b!885464 () Bool)

(assert (=> b!885464 (= e!492789 call!39108)))

(declare-fun b!885465 () Bool)

(declare-fun e!492787 () List!17647)

(assert (=> b!885465 (= e!492787 (insertStrictlySorted!288 (t!24924 l!906) key1!49 v1!38))))

(declare-fun b!885466 () Bool)

(assert (=> b!885466 (= e!492787 (ite c!93300 (t!24924 l!906) (ite c!93301 (Cons!17643 (h!18774 l!906) (t!24924 l!906)) Nil!17644)))))

(declare-fun b!885467 () Bool)

(assert (=> b!885467 (= e!492788 call!39109)))

(declare-fun b!885459 () Bool)

(assert (=> b!885459 (= e!492790 call!39107)))

(declare-fun d!109391 () Bool)

(assert (=> d!109391 e!492786))

(declare-fun res!601342 () Bool)

(assert (=> d!109391 (=> (not res!601342) (not e!492786))))

(assert (=> d!109391 (= res!601342 (isStrictlySorted!471 lt!401022))))

(assert (=> d!109391 (= lt!401022 e!492790)))

(declare-fun c!93298 () Bool)

(assert (=> d!109391 (= c!93298 (and (is-Cons!17643 l!906) (bvslt (_1!5939 (h!18774 l!906)) key1!49)))))

(assert (=> d!109391 (isStrictlySorted!471 l!906)))

(assert (=> d!109391 (= (insertStrictlySorted!288 l!906 key1!49 v1!38) lt!401022)))

(declare-fun bm!39106 () Bool)

(assert (=> bm!39106 (= call!39107 ($colon$colon!543 e!492787 (ite c!93298 (h!18774 l!906) (tuple2!11857 key1!49 v1!38))))))

(declare-fun c!93299 () Bool)

(assert (=> bm!39106 (= c!93299 c!93298)))

(declare-fun b!885468 () Bool)

(assert (=> b!885468 (= e!492788 call!39109)))

(assert (= (and d!109391 c!93298) b!885459))

(assert (= (and d!109391 (not c!93298)) b!885460))

(assert (= (and b!885460 c!93300) b!885464))

(assert (= (and b!885460 (not c!93300)) b!885461))

(assert (= (and b!885461 c!93301) b!885467))

(assert (= (and b!885461 (not c!93301)) b!885468))

(assert (= (or b!885467 b!885468) bm!39104))

(assert (= (or b!885464 bm!39104) bm!39105))

(assert (= (or b!885459 bm!39105) bm!39106))

(assert (= (and bm!39106 c!93299) b!885465))

(assert (= (and bm!39106 (not c!93299)) b!885466))

(assert (= (and d!109391 res!601342) b!885462))

(assert (= (and b!885462 res!601343) b!885463))

(assert (=> b!885465 m!825563))

(declare-fun m!825685 () Bool)

(assert (=> b!885462 m!825685))

(declare-fun m!825687 () Bool)

(assert (=> d!109391 m!825687))

(assert (=> d!109391 m!825559))

(declare-fun m!825689 () Bool)

(assert (=> b!885463 m!825689))

(declare-fun m!825691 () Bool)

(assert (=> bm!39106 m!825691))

(assert (=> b!885303 d!109391))

(declare-fun d!109393 () Bool)

(declare-fun res!601366 () Bool)

(declare-fun e!492828 () Bool)

(assert (=> d!109393 (=> res!601366 e!492828)))

(assert (=> d!109393 (= res!601366 (or (is-Nil!17644 (insertStrictlySorted!288 l!906 key1!49 v1!38)) (is-Nil!17644 (t!24924 (insertStrictlySorted!288 l!906 key1!49 v1!38)))))))

(assert (=> d!109393 (= (isStrictlySorted!471 (insertStrictlySorted!288 l!906 key1!49 v1!38)) e!492828)))

(declare-fun b!885528 () Bool)

(declare-fun e!492829 () Bool)

(assert (=> b!885528 (= e!492828 e!492829)))

(declare-fun res!601367 () Bool)

(assert (=> b!885528 (=> (not res!601367) (not e!492829))))

(assert (=> b!885528 (= res!601367 (bvslt (_1!5939 (h!18774 (insertStrictlySorted!288 l!906 key1!49 v1!38))) (_1!5939 (h!18774 (t!24924 (insertStrictlySorted!288 l!906 key1!49 v1!38))))))))

(declare-fun b!885529 () Bool)

(assert (=> b!885529 (= e!492829 (isStrictlySorted!471 (t!24924 (insertStrictlySorted!288 l!906 key1!49 v1!38))))))

(assert (= (and d!109393 (not res!601366)) b!885528))

(assert (= (and b!885528 res!601367) b!885529))

(declare-fun m!825729 () Bool)

(assert (=> b!885529 m!825729))

(assert (=> b!885303 d!109393))

(declare-fun d!109405 () Bool)

(declare-fun res!601368 () Bool)

(declare-fun e!492830 () Bool)

(assert (=> d!109405 (=> res!601368 e!492830)))

(assert (=> d!109405 (= res!601368 (or (is-Nil!17644 (t!24924 l!906)) (is-Nil!17644 (t!24924 (t!24924 l!906)))))))

(assert (=> d!109405 (= (isStrictlySorted!471 (t!24924 l!906)) e!492830)))

(declare-fun b!885530 () Bool)

(declare-fun e!492831 () Bool)

(assert (=> b!885530 (= e!492830 e!492831)))

(declare-fun res!601369 () Bool)

(assert (=> b!885530 (=> (not res!601369) (not e!492831))))

(assert (=> b!885530 (= res!601369 (bvslt (_1!5939 (h!18774 (t!24924 l!906))) (_1!5939 (h!18774 (t!24924 (t!24924 l!906))))))))

(declare-fun b!885531 () Bool)

(assert (=> b!885531 (= e!492831 (isStrictlySorted!471 (t!24924 (t!24924 l!906))))))

(assert (= (and d!109405 (not res!601368)) b!885530))

(assert (= (and b!885530 res!601369) b!885531))

(declare-fun m!825731 () Bool)

(assert (=> b!885531 m!825731))

(assert (=> b!885302 d!109405))

(declare-fun d!109407 () Bool)

(declare-fun res!601370 () Bool)

(declare-fun e!492832 () Bool)

(assert (=> d!109407 (=> res!601370 e!492832)))

(assert (=> d!109407 (= res!601370 (or (is-Nil!17644 l!906) (is-Nil!17644 (t!24924 l!906))))))

(assert (=> d!109407 (= (isStrictlySorted!471 l!906) e!492832)))

(declare-fun b!885532 () Bool)

(declare-fun e!492833 () Bool)

(assert (=> b!885532 (= e!492832 e!492833)))

(declare-fun res!601371 () Bool)

(assert (=> b!885532 (=> (not res!601371) (not e!492833))))

(assert (=> b!885532 (= res!601371 (bvslt (_1!5939 (h!18774 l!906)) (_1!5939 (h!18774 (t!24924 l!906)))))))

(declare-fun b!885533 () Bool)

(assert (=> b!885533 (= e!492833 (isStrictlySorted!471 (t!24924 l!906)))))

(assert (= (and d!109407 (not res!601370)) b!885532))

(assert (= (and b!885532 res!601371) b!885533))

(assert (=> b!885533 m!825561))

(assert (=> start!75094 d!109407))

(declare-fun b!885538 () Bool)

(declare-fun e!492836 () Bool)

(declare-fun tp!54260 () Bool)

(assert (=> b!885538 (= e!492836 (and tp_is_empty!17761 tp!54260))))

(assert (=> b!885304 (= tp!54248 e!492836)))

(assert (= (and b!885304 (is-Cons!17643 (t!24924 l!906))) b!885538))

(push 1)

