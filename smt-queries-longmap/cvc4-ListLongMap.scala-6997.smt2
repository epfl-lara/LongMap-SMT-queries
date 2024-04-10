; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88760 () Bool)

(assert start!88760)

(declare-fun b!1019400 () Bool)

(declare-fun e!573674 () Bool)

(declare-fun tp_is_empty!23759 () Bool)

(declare-fun tp!71155 () Bool)

(assert (=> b!1019400 (= e!573674 (and tp_is_empty!23759 tp!71155))))

(declare-fun res!683416 () Bool)

(declare-fun e!573673 () Bool)

(assert (=> start!88760 (=> (not res!683416) (not e!573673))))

(declare-datatypes ((B!1692 0))(
  ( (B!1693 (val!11930 Int)) )
))
(declare-datatypes ((tuple2!15406 0))(
  ( (tuple2!15407 (_1!7714 (_ BitVec 64)) (_2!7714 B!1692)) )
))
(declare-datatypes ((List!21618 0))(
  ( (Nil!21615) (Cons!21614 (h!22812 tuple2!15406) (t!30622 List!21618)) )
))
(declare-fun l!996 () List!21618)

(declare-fun isStrictlySorted!683 (List!21618) Bool)

(assert (=> start!88760 (= res!683416 (isStrictlySorted!683 l!996))))

(assert (=> start!88760 e!573673))

(assert (=> start!88760 e!573674))

(assert (=> start!88760 true))

(assert (=> start!88760 tp_is_empty!23759))

(declare-fun b!1019401 () Bool)

(declare-fun res!683413 () Bool)

(declare-fun e!573675 () Bool)

(assert (=> b!1019401 (=> (not res!683413) (not e!573675))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!543 (List!21618 (_ BitVec 64)) Bool)

(assert (=> b!1019401 (= res!683413 (containsKey!543 (t!30622 l!996) key!261))))

(declare-fun b!1019402 () Bool)

(declare-fun res!683417 () Bool)

(assert (=> b!1019402 (=> (not res!683417) (not e!573673))))

(assert (=> b!1019402 (= res!683417 (containsKey!543 l!996 key!261))))

(declare-fun b!1019403 () Bool)

(assert (=> b!1019403 (= e!573673 e!573675)))

(declare-fun res!683414 () Bool)

(assert (=> b!1019403 (=> (not res!683414) (not e!573675))))

(assert (=> b!1019403 (= res!683414 (and (is-Cons!21614 l!996) (bvslt (_1!7714 (h!22812 l!996)) key!261)))))

(declare-fun value!172 () B!1692)

(declare-fun lt!449673 () List!21618)

(declare-fun insertStrictlySorted!361 (List!21618 (_ BitVec 64) B!1692) List!21618)

(assert (=> b!1019403 (= lt!449673 (insertStrictlySorted!361 l!996 key!261 value!172))))

(declare-fun b!1019404 () Bool)

(declare-fun res!683415 () Bool)

(assert (=> b!1019404 (=> (not res!683415) (not e!573675))))

(assert (=> b!1019404 (= res!683415 (isStrictlySorted!683 (t!30622 l!996)))))

(declare-fun b!1019405 () Bool)

(declare-fun length!46 (List!21618) Int)

(assert (=> b!1019405 (= e!573675 (not (= (length!46 lt!449673) (length!46 l!996))))))

(assert (=> b!1019405 (= (length!46 (insertStrictlySorted!361 (t!30622 l!996) key!261 value!172)) (length!46 (t!30622 l!996)))))

(declare-datatypes ((Unit!33291 0))(
  ( (Unit!33292) )
))
(declare-fun lt!449672 () Unit!33291)

(declare-fun lemmaAddExistingKeyPreservesSize!6 (List!21618 (_ BitVec 64) B!1692) Unit!33291)

(assert (=> b!1019405 (= lt!449672 (lemmaAddExistingKeyPreservesSize!6 (t!30622 l!996) key!261 value!172))))

(assert (= (and start!88760 res!683416) b!1019402))

(assert (= (and b!1019402 res!683417) b!1019403))

(assert (= (and b!1019403 res!683414) b!1019404))

(assert (= (and b!1019404 res!683415) b!1019401))

(assert (= (and b!1019401 res!683413) b!1019405))

(assert (= (and start!88760 (is-Cons!21614 l!996)) b!1019400))

(declare-fun m!939741 () Bool)

(assert (=> b!1019405 m!939741))

(declare-fun m!939743 () Bool)

(assert (=> b!1019405 m!939743))

(declare-fun m!939745 () Bool)

(assert (=> b!1019405 m!939745))

(declare-fun m!939747 () Bool)

(assert (=> b!1019405 m!939747))

(assert (=> b!1019405 m!939741))

(declare-fun m!939749 () Bool)

(assert (=> b!1019405 m!939749))

(declare-fun m!939751 () Bool)

(assert (=> b!1019405 m!939751))

(declare-fun m!939753 () Bool)

(assert (=> b!1019404 m!939753))

(declare-fun m!939755 () Bool)

(assert (=> b!1019402 m!939755))

(declare-fun m!939757 () Bool)

(assert (=> b!1019403 m!939757))

(declare-fun m!939759 () Bool)

(assert (=> start!88760 m!939759))

(declare-fun m!939761 () Bool)

(assert (=> b!1019401 m!939761))

(push 1)

(assert (not b!1019403))

(assert (not b!1019401))

(assert (not start!88760))

(assert (not b!1019404))

(assert (not b!1019405))

(assert (not b!1019402))

(assert tp_is_empty!23759)

(assert (not b!1019400))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122053 () Bool)

(declare-fun res!683442 () Bool)

(declare-fun e!573700 () Bool)

(assert (=> d!122053 (=> res!683442 e!573700)))

(assert (=> d!122053 (= res!683442 (and (is-Cons!21614 l!996) (= (_1!7714 (h!22812 l!996)) key!261)))))

(assert (=> d!122053 (= (containsKey!543 l!996 key!261) e!573700)))

(declare-fun b!1019430 () Bool)

(declare-fun e!573701 () Bool)

(assert (=> b!1019430 (= e!573700 e!573701)))

(declare-fun res!683443 () Bool)

(assert (=> b!1019430 (=> (not res!683443) (not e!573701))))

(assert (=> b!1019430 (= res!683443 (and (or (not (is-Cons!21614 l!996)) (bvsle (_1!7714 (h!22812 l!996)) key!261)) (is-Cons!21614 l!996) (bvslt (_1!7714 (h!22812 l!996)) key!261)))))

(declare-fun b!1019431 () Bool)

(assert (=> b!1019431 (= e!573701 (containsKey!543 (t!30622 l!996) key!261))))

(assert (= (and d!122053 (not res!683442)) b!1019430))

(assert (= (and b!1019430 res!683443) b!1019431))

(assert (=> b!1019431 m!939761))

(assert (=> b!1019402 d!122053))

(declare-fun bm!43099 () Bool)

(declare-fun call!43104 () List!21618)

(declare-fun call!43102 () List!21618)

(assert (=> bm!43099 (= call!43104 call!43102)))

(declare-fun b!1019530 () Bool)

(declare-fun e!573755 () List!21618)

(declare-fun call!43103 () List!21618)

(assert (=> b!1019530 (= e!573755 call!43103)))

(declare-fun c!103356 () Bool)

(declare-fun e!573754 () List!21618)

(declare-fun bm!43100 () Bool)

(declare-fun $colon$colon!590 (List!21618 tuple2!15406) List!21618)

(assert (=> bm!43100 (= call!43103 ($colon$colon!590 e!573754 (ite c!103356 (h!22812 l!996) (tuple2!15407 key!261 value!172))))))

(declare-fun c!103358 () Bool)

(assert (=> bm!43100 (= c!103358 c!103356)))

(declare-fun c!103355 () Bool)

(declare-fun c!103357 () Bool)

(declare-fun b!1019531 () Bool)

(assert (=> b!1019531 (= e!573754 (ite c!103355 (t!30622 l!996) (ite c!103357 (Cons!21614 (h!22812 l!996) (t!30622 l!996)) Nil!21615)))))

(declare-fun b!1019532 () Bool)

(assert (=> b!1019532 (= c!103357 (and (is-Cons!21614 l!996) (bvsgt (_1!7714 (h!22812 l!996)) key!261)))))

(declare-fun e!573757 () List!21618)

(declare-fun e!573753 () List!21618)

(assert (=> b!1019532 (= e!573757 e!573753)))

(declare-fun b!1019533 () Bool)

(assert (=> b!1019533 (= e!573753 call!43104)))

(declare-fun d!122057 () Bool)

(declare-fun e!573756 () Bool)

(assert (=> d!122057 e!573756))

(declare-fun res!683466 () Bool)

(assert (=> d!122057 (=> (not res!683466) (not e!573756))))

(declare-fun lt!449686 () List!21618)

(assert (=> d!122057 (= res!683466 (isStrictlySorted!683 lt!449686))))

(assert (=> d!122057 (= lt!449686 e!573755)))

(assert (=> d!122057 (= c!103356 (and (is-Cons!21614 l!996) (bvslt (_1!7714 (h!22812 l!996)) key!261)))))

(assert (=> d!122057 (isStrictlySorted!683 l!996)))

(assert (=> d!122057 (= (insertStrictlySorted!361 l!996 key!261 value!172) lt!449686)))

(declare-fun b!1019534 () Bool)

(assert (=> b!1019534 (= e!573757 call!43102)))

(declare-fun b!1019535 () Bool)

(declare-fun res!683467 () Bool)

(assert (=> b!1019535 (=> (not res!683467) (not e!573756))))

(assert (=> b!1019535 (= res!683467 (containsKey!543 lt!449686 key!261))))

(declare-fun b!1019536 () Bool)

(declare-fun contains!5910 (List!21618 tuple2!15406) Bool)

(assert (=> b!1019536 (= e!573756 (contains!5910 lt!449686 (tuple2!15407 key!261 value!172)))))

(declare-fun b!1019537 () Bool)

(assert (=> b!1019537 (= e!573753 call!43104)))

(declare-fun b!1019538 () Bool)

(assert (=> b!1019538 (= e!573755 e!573757)))

(assert (=> b!1019538 (= c!103355 (and (is-Cons!21614 l!996) (= (_1!7714 (h!22812 l!996)) key!261)))))

(declare-fun b!1019539 () Bool)

(assert (=> b!1019539 (= e!573754 (insertStrictlySorted!361 (t!30622 l!996) key!261 value!172))))

(declare-fun bm!43101 () Bool)

(assert (=> bm!43101 (= call!43102 call!43103)))

(assert (= (and d!122057 c!103356) b!1019530))

(assert (= (and d!122057 (not c!103356)) b!1019538))

(assert (= (and b!1019538 c!103355) b!1019534))

(assert (= (and b!1019538 (not c!103355)) b!1019532))

(assert (= (and b!1019532 c!103357) b!1019537))

(assert (= (and b!1019532 (not c!103357)) b!1019533))

(assert (= (or b!1019537 b!1019533) bm!43099))

(assert (= (or b!1019534 bm!43099) bm!43101))

(assert (= (or b!1019530 bm!43101) bm!43100))

(assert (= (and bm!43100 c!103358) b!1019539))

(assert (= (and bm!43100 (not c!103358)) b!1019531))

(assert (= (and d!122057 res!683466) b!1019535))

(assert (= (and b!1019535 res!683467) b!1019536))

(declare-fun m!939813 () Bool)

(assert (=> b!1019536 m!939813))

(assert (=> b!1019539 m!939741))

(declare-fun m!939815 () Bool)

(assert (=> d!122057 m!939815))

(assert (=> d!122057 m!939759))

(declare-fun m!939817 () Bool)

(assert (=> bm!43100 m!939817))

(declare-fun m!939819 () Bool)

(assert (=> b!1019535 m!939819))

(assert (=> b!1019403 d!122057))

(declare-fun d!122081 () Bool)

(declare-fun res!683476 () Bool)

(declare-fun e!573767 () Bool)

(assert (=> d!122081 (=> res!683476 e!573767)))

(assert (=> d!122081 (= res!683476 (or (is-Nil!21615 (t!30622 l!996)) (is-Nil!21615 (t!30622 (t!30622 l!996)))))))

(assert (=> d!122081 (= (isStrictlySorted!683 (t!30622 l!996)) e!573767)))

(declare-fun b!1019549 () Bool)

(declare-fun e!573768 () Bool)

(assert (=> b!1019549 (= e!573767 e!573768)))

(declare-fun res!683477 () Bool)

(assert (=> b!1019549 (=> (not res!683477) (not e!573768))))

(assert (=> b!1019549 (= res!683477 (bvslt (_1!7714 (h!22812 (t!30622 l!996))) (_1!7714 (h!22812 (t!30622 (t!30622 l!996))))))))

(declare-fun b!1019550 () Bool)

(assert (=> b!1019550 (= e!573768 (isStrictlySorted!683 (t!30622 (t!30622 l!996))))))

(assert (= (and d!122081 (not res!683476)) b!1019549))

(assert (= (and b!1019549 res!683477) b!1019550))

(declare-fun m!939825 () Bool)

(assert (=> b!1019550 m!939825))

(assert (=> b!1019404 d!122081))

(declare-fun bm!43102 () Bool)

(declare-fun call!43107 () List!21618)

(declare-fun call!43105 () List!21618)

(assert (=> bm!43102 (= call!43107 call!43105)))

(declare-fun b!1019553 () Bool)

(declare-fun e!573773 () List!21618)

(declare-fun call!43106 () List!21618)

(assert (=> b!1019553 (= e!573773 call!43106)))

(declare-fun e!573772 () List!21618)

(declare-fun bm!43103 () Bool)

(declare-fun c!103360 () Bool)

(assert (=> bm!43103 (= call!43106 ($colon$colon!590 e!573772 (ite c!103360 (h!22812 (t!30622 l!996)) (tuple2!15407 key!261 value!172))))))

(declare-fun c!103362 () Bool)

(assert (=> bm!43103 (= c!103362 c!103360)))

(declare-fun b!1019554 () Bool)

(declare-fun c!103361 () Bool)

(declare-fun c!103359 () Bool)

(assert (=> b!1019554 (= e!573772 (ite c!103359 (t!30622 (t!30622 l!996)) (ite c!103361 (Cons!21614 (h!22812 (t!30622 l!996)) (t!30622 (t!30622 l!996))) Nil!21615)))))

(declare-fun b!1019555 () Bool)

(assert (=> b!1019555 (= c!103361 (and (is-Cons!21614 (t!30622 l!996)) (bvsgt (_1!7714 (h!22812 (t!30622 l!996))) key!261)))))

(declare-fun e!573775 () List!21618)

(declare-fun e!573771 () List!21618)

(assert (=> b!1019555 (= e!573775 e!573771)))

(declare-fun b!1019556 () Bool)

(assert (=> b!1019556 (= e!573771 call!43107)))

(declare-fun d!122087 () Bool)

(declare-fun e!573774 () Bool)

(assert (=> d!122087 e!573774))

(declare-fun res!683480 () Bool)

(assert (=> d!122087 (=> (not res!683480) (not e!573774))))

(declare-fun lt!449690 () List!21618)

(assert (=> d!122087 (= res!683480 (isStrictlySorted!683 lt!449690))))

(assert (=> d!122087 (= lt!449690 e!573773)))

(assert (=> d!122087 (= c!103360 (and (is-Cons!21614 (t!30622 l!996)) (bvslt (_1!7714 (h!22812 (t!30622 l!996))) key!261)))))

(assert (=> d!122087 (isStrictlySorted!683 (t!30622 l!996))))

(assert (=> d!122087 (= (insertStrictlySorted!361 (t!30622 l!996) key!261 value!172) lt!449690)))

(declare-fun b!1019557 () Bool)

(assert (=> b!1019557 (= e!573775 call!43105)))

(declare-fun b!1019558 () Bool)

(declare-fun res!683481 () Bool)

(assert (=> b!1019558 (=> (not res!683481) (not e!573774))))

(assert (=> b!1019558 (= res!683481 (containsKey!543 lt!449690 key!261))))

(declare-fun b!1019559 () Bool)

(assert (=> b!1019559 (= e!573774 (contains!5910 lt!449690 (tuple2!15407 key!261 value!172)))))

(declare-fun b!1019560 () Bool)

(assert (=> b!1019560 (= e!573771 call!43107)))

(declare-fun b!1019561 () Bool)

(assert (=> b!1019561 (= e!573773 e!573775)))

(assert (=> b!1019561 (= c!103359 (and (is-Cons!21614 (t!30622 l!996)) (= (_1!7714 (h!22812 (t!30622 l!996))) key!261)))))

(declare-fun b!1019562 () Bool)

(assert (=> b!1019562 (= e!573772 (insertStrictlySorted!361 (t!30622 (t!30622 l!996)) key!261 value!172))))

(declare-fun bm!43104 () Bool)

(assert (=> bm!43104 (= call!43105 call!43106)))

(assert (= (and d!122087 c!103360) b!1019553))

(assert (= (and d!122087 (not c!103360)) b!1019561))

(assert (= (and b!1019561 c!103359) b!1019557))

(assert (= (and b!1019561 (not c!103359)) b!1019555))

(assert (= (and b!1019555 c!103361) b!1019560))

(assert (= (and b!1019555 (not c!103361)) b!1019556))

(assert (= (or b!1019560 b!1019556) bm!43102))

(assert (= (or b!1019557 bm!43102) bm!43104))

(assert (= (or b!1019553 bm!43104) bm!43103))

(assert (= (and bm!43103 c!103362) b!1019562))

(assert (= (and bm!43103 (not c!103362)) b!1019554))

(assert (= (and d!122087 res!683480) b!1019558))

(assert (= (and b!1019558 res!683481) b!1019559))

(declare-fun m!939829 () Bool)

(assert (=> b!1019559 m!939829))

(declare-fun m!939831 () Bool)

(assert (=> b!1019562 m!939831))

(declare-fun m!939833 () Bool)

(assert (=> d!122087 m!939833))

(assert (=> d!122087 m!939753))

(declare-fun m!939835 () Bool)

(assert (=> bm!43103 m!939835))

(declare-fun m!939837 () Bool)

(assert (=> b!1019558 m!939837))

(assert (=> b!1019405 d!122087))

(declare-fun d!122093 () Bool)

(declare-fun size!31159 (List!21618) Int)

(assert (=> d!122093 (= (length!46 (t!30622 l!996)) (size!31159 (t!30622 l!996)))))

(declare-fun bs!29696 () Bool)

(assert (= bs!29696 d!122093))

(declare-fun m!939847 () Bool)

(assert (=> bs!29696 m!939847))

(assert (=> b!1019405 d!122093))

(declare-fun d!122095 () Bool)

(assert (=> d!122095 (= (length!46 (insertStrictlySorted!361 (t!30622 l!996) key!261 value!172)) (length!46 (t!30622 l!996)))))

(declare-fun lt!449694 () Unit!33291)

(declare-fun choose!1677 (List!21618 (_ BitVec 64) B!1692) Unit!33291)

(assert (=> d!122095 (= lt!449694 (choose!1677 (t!30622 l!996) key!261 value!172))))

(assert (=> d!122095 (= (lemmaAddExistingKeyPreservesSize!6 (t!30622 l!996) key!261 value!172) lt!449694)))

(declare-fun bs!29697 () Bool)

(assert (= bs!29697 d!122095))

(assert (=> bs!29697 m!939741))

(assert (=> bs!29697 m!939741))

(assert (=> bs!29697 m!939743))

(assert (=> bs!29697 m!939751))

(declare-fun m!939849 () Bool)

(assert (=> bs!29697 m!939849))

(assert (=> b!1019405 d!122095))

(declare-fun d!122097 () Bool)

(assert (=> d!122097 (= (length!46 (insertStrictlySorted!361 (t!30622 l!996) key!261 value!172)) (size!31159 (insertStrictlySorted!361 (t!30622 l!996) key!261 value!172)))))

(declare-fun bs!29698 () Bool)

(assert (= bs!29698 d!122097))

(assert (=> bs!29698 m!939741))

(declare-fun m!939851 () Bool)

(assert (=> bs!29698 m!939851))

(assert (=> b!1019405 d!122097))

(declare-fun d!122099 () Bool)

(assert (=> d!122099 (= (length!46 l!996) (size!31159 l!996))))

(declare-fun bs!29699 () Bool)

(assert (= bs!29699 d!122099))

(declare-fun m!939853 () Bool)

(assert (=> bs!29699 m!939853))

(assert (=> b!1019405 d!122099))

(declare-fun d!122101 () Bool)

(assert (=> d!122101 (= (length!46 lt!449673) (size!31159 lt!449673))))

(declare-fun bs!29700 () Bool)

(assert (= bs!29700 d!122101))

(declare-fun m!939855 () Bool)

(assert (=> bs!29700 m!939855))

(assert (=> b!1019405 d!122101))

(declare-fun d!122103 () Bool)

(declare-fun res!683486 () Bool)

(declare-fun e!573786 () Bool)

(assert (=> d!122103 (=> res!683486 e!573786)))

(assert (=> d!122103 (= res!683486 (or (is-Nil!21615 l!996) (is-Nil!21615 (t!30622 l!996))))))

(assert (=> d!122103 (= (isStrictlySorted!683 l!996) e!573786)))

(declare-fun b!1019580 () Bool)

(declare-fun e!573787 () Bool)

(assert (=> b!1019580 (= e!573786 e!573787)))

(declare-fun res!683487 () Bool)

(assert (=> b!1019580 (=> (not res!683487) (not e!573787))))

(assert (=> b!1019580 (= res!683487 (bvslt (_1!7714 (h!22812 l!996)) (_1!7714 (h!22812 (t!30622 l!996)))))))

(declare-fun b!1019581 () Bool)

(assert (=> b!1019581 (= e!573787 (isStrictlySorted!683 (t!30622 l!996)))))

(assert (= (and d!122103 (not res!683486)) b!1019580))

(assert (= (and b!1019580 res!683487) b!1019581))

(assert (=> b!1019581 m!939753))

(assert (=> start!88760 d!122103))

(declare-fun d!122105 () Bool)

(declare-fun res!683488 () Bool)

(declare-fun e!573788 () Bool)

(assert (=> d!122105 (=> res!683488 e!573788)))

(assert (=> d!122105 (= res!683488 (and (is-Cons!21614 (t!30622 l!996)) (= (_1!7714 (h!22812 (t!30622 l!996))) key!261)))))

(assert (=> d!122105 (= (containsKey!543 (t!30622 l!996) key!261) e!573788)))

(declare-fun b!1019582 () Bool)

(declare-fun e!573789 () Bool)

(assert (=> b!1019582 (= e!573788 e!573789)))

(declare-fun res!683489 () Bool)

(assert (=> b!1019582 (=> (not res!683489) (not e!573789))))

(assert (=> b!1019582 (= res!683489 (and (or (not (is-Cons!21614 (t!30622 l!996))) (bvsle (_1!7714 (h!22812 (t!30622 l!996))) key!261)) (is-Cons!21614 (t!30622 l!996)) (bvslt (_1!7714 (h!22812 (t!30622 l!996))) key!261)))))

(declare-fun b!1019583 () Bool)

(assert (=> b!1019583 (= e!573789 (containsKey!543 (t!30622 (t!30622 l!996)) key!261))))

(assert (= (and d!122105 (not res!683488)) b!1019582))

(assert (= (and b!1019582 res!683489) b!1019583))

(declare-fun m!939857 () Bool)

(assert (=> b!1019583 m!939857))

(assert (=> b!1019401 d!122105))

(declare-fun b!1019588 () Bool)

(declare-fun e!573792 () Bool)

(declare-fun tp!71164 () Bool)

(assert (=> b!1019588 (= e!573792 (and tp_is_empty!23759 tp!71164))))

(assert (=> b!1019400 (= tp!71155 e!573792)))

(assert (= (and b!1019400 (is-Cons!21614 (t!30622 l!996))) b!1019588))

(push 1)

(assert (not d!122097))

(assert (not b!1019535))

(assert (not b!1019550))

(assert (not b!1019539))

(assert (not d!122101))

(assert (not b!1019559))

(assert (not b!1019536))

(assert (not b!1019558))

(assert (not d!122095))

(assert (not b!1019562))

(assert (not b!1019588))

(assert (not b!1019581))

(assert (not bm!43103))

(assert (not bm!43100))

(assert (not b!1019431))

(assert (not d!122099))

(assert (not d!122057))

(assert (not d!122087))

(assert (not b!1019583))

(assert tp_is_empty!23759)

(assert (not d!122093))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122171 () Bool)

(declare-fun lt!449719 () Int)

(assert (=> d!122171 (>= lt!449719 0)))

(declare-fun e!573859 () Int)

(assert (=> d!122171 (= lt!449719 e!573859)))

(declare-fun c!103389 () Bool)

(assert (=> d!122171 (= c!103389 (is-Nil!21615 lt!449673))))

(assert (=> d!122171 (= (size!31159 lt!449673) lt!449719)))

(declare-fun b!1019679 () Bool)

(assert (=> b!1019679 (= e!573859 0)))

(declare-fun b!1019680 () Bool)

(assert (=> b!1019680 (= e!573859 (+ 1 (size!31159 (t!30622 lt!449673))))))

(assert (= (and d!122171 c!103389) b!1019679))

(assert (= (and d!122171 (not c!103389)) b!1019680))

(declare-fun m!939939 () Bool)

(assert (=> b!1019680 m!939939))

(assert (=> d!122101 d!122171))

(declare-fun bm!43114 () Bool)

(declare-fun call!43119 () List!21618)

(declare-fun call!43117 () List!21618)

(assert (=> bm!43114 (= call!43119 call!43117)))

(declare-fun b!1019681 () Bool)

(declare-fun e!573862 () List!21618)

(declare-fun call!43118 () List!21618)

(assert (=> b!1019681 (= e!573862 call!43118)))

(declare-fun e!573861 () List!21618)

(declare-fun bm!43115 () Bool)

(declare-fun c!103391 () Bool)

(assert (=> bm!43115 (= call!43118 ($colon$colon!590 e!573861 (ite c!103391 (h!22812 (t!30622 (t!30622 l!996))) (tuple2!15407 key!261 value!172))))))

(declare-fun c!103393 () Bool)

(assert (=> bm!43115 (= c!103393 c!103391)))

(declare-fun b!1019682 () Bool)

(declare-fun c!103392 () Bool)

(declare-fun c!103390 () Bool)

(assert (=> b!1019682 (= e!573861 (ite c!103390 (t!30622 (t!30622 (t!30622 l!996))) (ite c!103392 (Cons!21614 (h!22812 (t!30622 (t!30622 l!996))) (t!30622 (t!30622 (t!30622 l!996)))) Nil!21615)))))

(declare-fun b!1019683 () Bool)

(assert (=> b!1019683 (= c!103392 (and (is-Cons!21614 (t!30622 (t!30622 l!996))) (bvsgt (_1!7714 (h!22812 (t!30622 (t!30622 l!996)))) key!261)))))

(declare-fun e!573864 () List!21618)

(declare-fun e!573860 () List!21618)

(assert (=> b!1019683 (= e!573864 e!573860)))

(declare-fun b!1019684 () Bool)

(assert (=> b!1019684 (= e!573860 call!43119)))

(declare-fun d!122173 () Bool)

(declare-fun e!573863 () Bool)

(assert (=> d!122173 e!573863))

(declare-fun res!683534 () Bool)

(assert (=> d!122173 (=> (not res!683534) (not e!573863))))

(declare-fun lt!449720 () List!21618)

(assert (=> d!122173 (= res!683534 (isStrictlySorted!683 lt!449720))))

(assert (=> d!122173 (= lt!449720 e!573862)))

(assert (=> d!122173 (= c!103391 (and (is-Cons!21614 (t!30622 (t!30622 l!996))) (bvslt (_1!7714 (h!22812 (t!30622 (t!30622 l!996)))) key!261)))))

(assert (=> d!122173 (isStrictlySorted!683 (t!30622 (t!30622 l!996)))))

(assert (=> d!122173 (= (insertStrictlySorted!361 (t!30622 (t!30622 l!996)) key!261 value!172) lt!449720)))

(declare-fun b!1019685 () Bool)

(assert (=> b!1019685 (= e!573864 call!43117)))

(declare-fun b!1019686 () Bool)

(declare-fun res!683535 () Bool)

(assert (=> b!1019686 (=> (not res!683535) (not e!573863))))

(assert (=> b!1019686 (= res!683535 (containsKey!543 lt!449720 key!261))))

(declare-fun b!1019687 () Bool)

(assert (=> b!1019687 (= e!573863 (contains!5910 lt!449720 (tuple2!15407 key!261 value!172)))))

(declare-fun b!1019688 () Bool)

(assert (=> b!1019688 (= e!573860 call!43119)))

(declare-fun b!1019689 () Bool)

(assert (=> b!1019689 (= e!573862 e!573864)))

(assert (=> b!1019689 (= c!103390 (and (is-Cons!21614 (t!30622 (t!30622 l!996))) (= (_1!7714 (h!22812 (t!30622 (t!30622 l!996)))) key!261)))))

(declare-fun b!1019690 () Bool)

(assert (=> b!1019690 (= e!573861 (insertStrictlySorted!361 (t!30622 (t!30622 (t!30622 l!996))) key!261 value!172))))

(declare-fun bm!43116 () Bool)

(assert (=> bm!43116 (= call!43117 call!43118)))

(assert (= (and d!122173 c!103391) b!1019681))

(assert (= (and d!122173 (not c!103391)) b!1019689))

(assert (= (and b!1019689 c!103390) b!1019685))

(assert (= (and b!1019689 (not c!103390)) b!1019683))

(assert (= (and b!1019683 c!103392) b!1019688))

(assert (= (and b!1019683 (not c!103392)) b!1019684))

(assert (= (or b!1019688 b!1019684) bm!43114))

(assert (= (or b!1019685 bm!43114) bm!43116))

(assert (= (or b!1019681 bm!43116) bm!43115))

(assert (= (and bm!43115 c!103393) b!1019690))

(assert (= (and bm!43115 (not c!103393)) b!1019682))

(assert (= (and d!122173 res!683534) b!1019686))

(assert (= (and b!1019686 res!683535) b!1019687))

(declare-fun m!939941 () Bool)

(assert (=> b!1019687 m!939941))

(declare-fun m!939943 () Bool)

(assert (=> b!1019690 m!939943))

(declare-fun m!939945 () Bool)

(assert (=> d!122173 m!939945))

(assert (=> d!122173 m!939825))

(declare-fun m!939947 () Bool)

(assert (=> bm!43115 m!939947))

(declare-fun m!939949 () Bool)

(assert (=> b!1019686 m!939949))

(assert (=> b!1019562 d!122173))

(declare-fun d!122175 () Bool)

(declare-fun lt!449721 () Int)

(assert (=> d!122175 (>= lt!449721 0)))

(declare-fun e!573865 () Int)

(assert (=> d!122175 (= lt!449721 e!573865)))

(declare-fun c!103394 () Bool)

(assert (=> d!122175 (= c!103394 (is-Nil!21615 (insertStrictlySorted!361 (t!30622 l!996) key!261 value!172)))))

(assert (=> d!122175 (= (size!31159 (insertStrictlySorted!361 (t!30622 l!996) key!261 value!172)) lt!449721)))

(declare-fun b!1019691 () Bool)

(assert (=> b!1019691 (= e!573865 0)))

(declare-fun b!1019692 () Bool)

(assert (=> b!1019692 (= e!573865 (+ 1 (size!31159 (t!30622 (insertStrictlySorted!361 (t!30622 l!996) key!261 value!172)))))))

(assert (= (and d!122175 c!103394) b!1019691))

(assert (= (and d!122175 (not c!103394)) b!1019692))

(declare-fun m!939951 () Bool)

(assert (=> b!1019692 m!939951))

(assert (=> d!122097 d!122175))

(assert (=> b!1019581 d!122081))

(declare-fun d!122177 () Bool)

(assert (=> d!122177 (= ($colon$colon!590 e!573772 (ite c!103360 (h!22812 (t!30622 l!996)) (tuple2!15407 key!261 value!172))) (Cons!21614 (ite c!103360 (h!22812 (t!30622 l!996)) (tuple2!15407 key!261 value!172)) e!573772))))

(assert (=> bm!43103 d!122177))

(assert (=> b!1019539 d!122087))

(assert (=> b!1019431 d!122105))

(declare-fun d!122179 () Bool)

(assert (=> d!122179 (= ($colon$colon!590 e!573754 (ite c!103356 (h!22812 l!996) (tuple2!15407 key!261 value!172))) (Cons!21614 (ite c!103356 (h!22812 l!996) (tuple2!15407 key!261 value!172)) e!573754))))

(assert (=> bm!43100 d!122179))

(assert (=> d!122095 d!122097))

(assert (=> d!122095 d!122087))

(assert (=> d!122095 d!122093))

(declare-fun d!122181 () Bool)

(assert (=> d!122181 (= (length!46 (insertStrictlySorted!361 (t!30622 l!996) key!261 value!172)) (length!46 (t!30622 l!996)))))

(assert (=> d!122181 true))

(declare-fun _$10!31 () Unit!33291)

(assert (=> d!122181 (= (choose!1677 (t!30622 l!996) key!261 value!172) _$10!31)))

(declare-fun bs!29703 () Bool)

(assert (= bs!29703 d!122181))

(assert (=> bs!29703 m!939741))

(assert (=> bs!29703 m!939741))

(assert (=> bs!29703 m!939743))

(assert (=> bs!29703 m!939751))

(assert (=> d!122095 d!122181))

(declare-fun d!122183 () Bool)

(declare-fun res!683536 () Bool)

(declare-fun e!573866 () Bool)

(assert (=> d!122183 (=> res!683536 e!573866)))

(assert (=> d!122183 (= res!683536 (or (is-Nil!21615 (t!30622 (t!30622 l!996))) (is-Nil!21615 (t!30622 (t!30622 (t!30622 l!996))))))))

(assert (=> d!122183 (= (isStrictlySorted!683 (t!30622 (t!30622 l!996))) e!573866)))

(declare-fun b!1019693 () Bool)

(declare-fun e!573867 () Bool)

(assert (=> b!1019693 (= e!573866 e!573867)))

(declare-fun res!683537 () Bool)

(assert (=> b!1019693 (=> (not res!683537) (not e!573867))))

(assert (=> b!1019693 (= res!683537 (bvslt (_1!7714 (h!22812 (t!30622 (t!30622 l!996)))) (_1!7714 (h!22812 (t!30622 (t!30622 (t!30622 l!996)))))))))

(declare-fun b!1019694 () Bool)

(assert (=> b!1019694 (= e!573867 (isStrictlySorted!683 (t!30622 (t!30622 (t!30622 l!996)))))))

(assert (= (and d!122183 (not res!683536)) b!1019693))

(assert (= (and b!1019693 res!683537) b!1019694))

(declare-fun m!939953 () Bool)

(assert (=> b!1019694 m!939953))

(assert (=> b!1019550 d!122183))

(declare-fun d!122185 () Bool)

(declare-fun lt!449722 () Int)

(assert (=> d!122185 (>= lt!449722 0)))

(declare-fun e!573868 () Int)

(assert (=> d!122185 (= lt!449722 e!573868)))

(declare-fun c!103395 () Bool)

(assert (=> d!122185 (= c!103395 (is-Nil!21615 l!996))))

(assert (=> d!122185 (= (size!31159 l!996) lt!449722)))

(declare-fun b!1019695 () Bool)

(assert (=> b!1019695 (= e!573868 0)))

(declare-fun b!1019696 () Bool)

(assert (=> b!1019696 (= e!573868 (+ 1 (size!31159 (t!30622 l!996))))))

(assert (= (and d!122185 c!103395) b!1019695))

(assert (= (and d!122185 (not c!103395)) b!1019696))

(assert (=> b!1019696 m!939847))

(assert (=> d!122099 d!122185))

(declare-fun d!122187 () Bool)

(declare-fun res!683538 () Bool)

(declare-fun e!573869 () Bool)

(assert (=> d!122187 (=> res!683538 e!573869)))

(assert (=> d!122187 (= res!683538 (and (is-Cons!21614 lt!449690) (= (_1!7714 (h!22812 lt!449690)) key!261)))))

