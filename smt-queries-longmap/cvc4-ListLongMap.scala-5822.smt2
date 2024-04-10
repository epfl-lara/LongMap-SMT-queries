; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75098 () Bool)

(assert start!75098)

(declare-fun key1!49 () (_ BitVec 64))

(declare-fun e!492719 () Bool)

(declare-datatypes ((B!1254 0))(
  ( (B!1255 (val!8933 Int)) )
))
(declare-fun v1!38 () B!1254)

(declare-datatypes ((tuple2!11860 0))(
  ( (tuple2!11861 (_1!5941 (_ BitVec 64)) (_2!5941 B!1254)) )
))
(declare-datatypes ((List!17649 0))(
  ( (Nil!17646) (Cons!17645 (h!18776 tuple2!11860) (t!24926 List!17649)) )
))
(declare-fun l!906 () List!17649)

(declare-fun b!885327 () Bool)

(declare-fun isStrictlySorted!473 (List!17649) Bool)

(declare-fun insertStrictlySorted!290 (List!17649 (_ BitVec 64) B!1254) List!17649)

(assert (=> b!885327 (= e!492719 (not (isStrictlySorted!473 (insertStrictlySorted!290 l!906 key1!49 v1!38))))))

(declare-fun v2!16 () B!1254)

(assert (=> b!885327 (= (insertStrictlySorted!290 (insertStrictlySorted!290 (t!24926 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!290 (t!24926 l!906) key1!49 v2!16))))

(declare-datatypes ((Unit!30232 0))(
  ( (Unit!30233) )
))
(declare-fun lt!400999 () Unit!30232)

(declare-fun lemmaInsertStrictlySortedErasesIfSameKey!9 (List!17649 (_ BitVec 64) B!1254 B!1254) Unit!30232)

(assert (=> b!885327 (= lt!400999 (lemmaInsertStrictlySortedErasesIfSameKey!9 (t!24926 l!906) key1!49 v1!38 v2!16))))

(declare-fun res!601314 () Bool)

(assert (=> start!75098 (=> (not res!601314) (not e!492719))))

(assert (=> start!75098 (= res!601314 (isStrictlySorted!473 l!906))))

(assert (=> start!75098 e!492719))

(declare-fun e!492720 () Bool)

(assert (=> start!75098 e!492720))

(assert (=> start!75098 true))

(declare-fun tp_is_empty!17765 () Bool)

(assert (=> start!75098 tp_is_empty!17765))

(declare-fun b!885326 () Bool)

(declare-fun res!601313 () Bool)

(assert (=> b!885326 (=> (not res!601313) (not e!492719))))

(assert (=> b!885326 (= res!601313 (isStrictlySorted!473 (t!24926 l!906)))))

(declare-fun b!885325 () Bool)

(declare-fun res!601315 () Bool)

(assert (=> b!885325 (=> (not res!601315) (not e!492719))))

(assert (=> b!885325 (= res!601315 (and (is-Cons!17645 l!906) (bvslt (_1!5941 (h!18776 l!906)) key1!49)))))

(declare-fun b!885328 () Bool)

(declare-fun tp!54254 () Bool)

(assert (=> b!885328 (= e!492720 (and tp_is_empty!17765 tp!54254))))

(assert (= (and start!75098 res!601314) b!885325))

(assert (= (and b!885325 res!601315) b!885326))

(assert (= (and b!885326 res!601313) b!885327))

(assert (= (and start!75098 (is-Cons!17645 l!906)) b!885328))

(declare-fun m!825591 () Bool)

(assert (=> b!885327 m!825591))

(declare-fun m!825593 () Bool)

(assert (=> b!885327 m!825593))

(declare-fun m!825595 () Bool)

(assert (=> b!885327 m!825595))

(declare-fun m!825597 () Bool)

(assert (=> b!885327 m!825597))

(declare-fun m!825599 () Bool)

(assert (=> b!885327 m!825599))

(assert (=> b!885327 m!825597))

(declare-fun m!825601 () Bool)

(assert (=> b!885327 m!825601))

(assert (=> b!885327 m!825591))

(declare-fun m!825603 () Bool)

(assert (=> start!75098 m!825603))

(declare-fun m!825605 () Bool)

(assert (=> b!885326 m!825605))

(push 1)

(assert (not b!885328))

(assert (not b!885326))

(assert (not start!75098))

(assert (not b!885327))

(assert tp_is_empty!17765)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!109373 () Bool)

(assert (=> d!109373 (= (insertStrictlySorted!290 (insertStrictlySorted!290 (t!24926 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!290 (t!24926 l!906) key1!49 v2!16))))

(declare-fun lt!401008 () Unit!30232)

(declare-fun choose!1449 (List!17649 (_ BitVec 64) B!1254 B!1254) Unit!30232)

(assert (=> d!109373 (= lt!401008 (choose!1449 (t!24926 l!906) key1!49 v1!38 v2!16))))

(assert (=> d!109373 (isStrictlySorted!473 (t!24926 l!906))))

(assert (=> d!109373 (= (lemmaInsertStrictlySortedErasesIfSameKey!9 (t!24926 l!906) key1!49 v1!38 v2!16) lt!401008)))

(declare-fun bs!24824 () Bool)

(assert (= bs!24824 d!109373))

(assert (=> bs!24824 m!825605))

(assert (=> bs!24824 m!825591))

(assert (=> bs!24824 m!825601))

(declare-fun m!825611 () Bool)

(assert (=> bs!24824 m!825611))

(assert (=> bs!24824 m!825591))

(assert (=> bs!24824 m!825593))

(assert (=> b!885327 d!109373))

(declare-fun c!93302 () Bool)

(declare-fun e!492793 () List!17649)

(declare-fun b!885469 () Bool)

(declare-fun c!93303 () Bool)

(assert (=> b!885469 (= e!492793 (ite c!93302 (t!24926 (insertStrictlySorted!290 (t!24926 l!906) key1!49 v1!38)) (ite c!93303 (Cons!17645 (h!18776 (insertStrictlySorted!290 (t!24926 l!906) key1!49 v1!38)) (t!24926 (insertStrictlySorted!290 (t!24926 l!906) key1!49 v1!38))) Nil!17646)))))

(declare-fun b!885470 () Bool)

(assert (=> b!885470 (= e!492793 (insertStrictlySorted!290 (t!24926 (insertStrictlySorted!290 (t!24926 l!906) key1!49 v1!38)) key1!49 v2!16))))

(declare-fun bm!39107 () Bool)

(declare-fun call!39110 () List!17649)

(declare-fun call!39112 () List!17649)

(assert (=> bm!39107 (= call!39110 call!39112)))

(declare-fun b!885471 () Bool)

(declare-fun e!492791 () List!17649)

(declare-fun e!492794 () List!17649)

(assert (=> b!885471 (= e!492791 e!492794)))

(assert (=> b!885471 (= c!93302 (and (is-Cons!17645 (insertStrictlySorted!290 (t!24926 l!906) key1!49 v1!38)) (= (_1!5941 (h!18776 (insertStrictlySorted!290 (t!24926 l!906) key1!49 v1!38))) key1!49)))))

(declare-fun b!885472 () Bool)

(declare-fun e!492792 () List!17649)

(declare-fun call!39111 () List!17649)

(assert (=> b!885472 (= e!492792 call!39111)))

(declare-fun e!492795 () Bool)

(declare-fun b!885473 () Bool)

(declare-fun lt!401023 () List!17649)

(declare-fun contains!4292 (List!17649 tuple2!11860) Bool)

(assert (=> b!885473 (= e!492795 (contains!4292 lt!401023 (tuple2!11861 key1!49 v2!16)))))

(declare-fun b!885474 () Bool)

(assert (=> b!885474 (= e!492791 call!39112)))

(declare-fun b!885475 () Bool)

(assert (=> b!885475 (= c!93303 (and (is-Cons!17645 (insertStrictlySorted!290 (t!24926 l!906) key1!49 v1!38)) (bvsgt (_1!5941 (h!18776 (insertStrictlySorted!290 (t!24926 l!906) key1!49 v1!38))) key1!49)))))

(assert (=> b!885475 (= e!492794 e!492792)))

(declare-fun b!885476 () Bool)

(assert (=> b!885476 (= e!492792 call!39111)))

(declare-fun b!885477 () Bool)

(declare-fun res!601345 () Bool)

(assert (=> b!885477 (=> (not res!601345) (not e!492795))))

(declare-fun containsKey!409 (List!17649 (_ BitVec 64)) Bool)

(assert (=> b!885477 (= res!601345 (containsKey!409 lt!401023 key1!49))))

(declare-fun d!109377 () Bool)

(assert (=> d!109377 e!492795))

(declare-fun res!601344 () Bool)

(assert (=> d!109377 (=> (not res!601344) (not e!492795))))

(assert (=> d!109377 (= res!601344 (isStrictlySorted!473 lt!401023))))

(assert (=> d!109377 (= lt!401023 e!492791)))

(declare-fun c!93304 () Bool)

(assert (=> d!109377 (= c!93304 (and (is-Cons!17645 (insertStrictlySorted!290 (t!24926 l!906) key1!49 v1!38)) (bvslt (_1!5941 (h!18776 (insertStrictlySorted!290 (t!24926 l!906) key1!49 v1!38))) key1!49)))))

(assert (=> d!109377 (isStrictlySorted!473 (insertStrictlySorted!290 (t!24926 l!906) key1!49 v1!38))))

(assert (=> d!109377 (= (insertStrictlySorted!290 (insertStrictlySorted!290 (t!24926 l!906) key1!49 v1!38) key1!49 v2!16) lt!401023)))

(declare-fun bm!39108 () Bool)

(declare-fun $colon$colon!544 (List!17649 tuple2!11860) List!17649)

(assert (=> bm!39108 (= call!39112 ($colon$colon!544 e!492793 (ite c!93304 (h!18776 (insertStrictlySorted!290 (t!24926 l!906) key1!49 v1!38)) (tuple2!11861 key1!49 v2!16))))))

(declare-fun c!93305 () Bool)

(assert (=> bm!39108 (= c!93305 c!93304)))

(declare-fun bm!39109 () Bool)

(assert (=> bm!39109 (= call!39111 call!39110)))

(declare-fun b!885478 () Bool)

(assert (=> b!885478 (= e!492794 call!39110)))

(assert (= (and d!109377 c!93304) b!885474))

(assert (= (and d!109377 (not c!93304)) b!885471))

(assert (= (and b!885471 c!93302) b!885478))

(assert (= (and b!885471 (not c!93302)) b!885475))

(assert (= (and b!885475 c!93303) b!885476))

(assert (= (and b!885475 (not c!93303)) b!885472))

(assert (= (or b!885476 b!885472) bm!39109))

(assert (= (or b!885478 bm!39109) bm!39107))

(assert (= (or b!885474 bm!39107) bm!39108))

(assert (= (and bm!39108 c!93305) b!885470))

(assert (= (and bm!39108 (not c!93305)) b!885469))

(assert (= (and d!109377 res!601344) b!885477))

(assert (= (and b!885477 res!601345) b!885473))

(declare-fun m!825693 () Bool)

(assert (=> b!885470 m!825693))

(declare-fun m!825695 () Bool)

(assert (=> b!885477 m!825695))

(declare-fun m!825697 () Bool)

(assert (=> b!885473 m!825697))

(declare-fun m!825699 () Bool)

(assert (=> bm!39108 m!825699))

(declare-fun m!825701 () Bool)

(assert (=> d!109377 m!825701))

(assert (=> d!109377 m!825591))

(declare-fun m!825703 () Bool)

(assert (=> d!109377 m!825703))

(assert (=> b!885327 d!109377))

(declare-fun c!93307 () Bool)

(declare-fun b!885483 () Bool)

(declare-fun c!93306 () Bool)

(declare-fun e!492802 () List!17649)

(assert (=> b!885483 (= e!492802 (ite c!93306 (t!24926 (t!24926 l!906)) (ite c!93307 (Cons!17645 (h!18776 (t!24926 l!906)) (t!24926 (t!24926 l!906))) Nil!17646)))))

(declare-fun b!885484 () Bool)

(assert (=> b!885484 (= e!492802 (insertStrictlySorted!290 (t!24926 (t!24926 l!906)) key1!49 v2!16))))

(declare-fun bm!39110 () Bool)

(declare-fun call!39113 () List!17649)

(declare-fun call!39115 () List!17649)

(assert (=> bm!39110 (= call!39113 call!39115)))

(declare-fun b!885485 () Bool)

(declare-fun e!492800 () List!17649)

(declare-fun e!492803 () List!17649)

(assert (=> b!885485 (= e!492800 e!492803)))

(assert (=> b!885485 (= c!93306 (and (is-Cons!17645 (t!24926 l!906)) (= (_1!5941 (h!18776 (t!24926 l!906))) key1!49)))))

(declare-fun b!885486 () Bool)

(declare-fun e!492801 () List!17649)

(declare-fun call!39114 () List!17649)

(assert (=> b!885486 (= e!492801 call!39114)))

(declare-fun lt!401024 () List!17649)

(declare-fun e!492804 () Bool)

(declare-fun b!885487 () Bool)

(assert (=> b!885487 (= e!492804 (contains!4292 lt!401024 (tuple2!11861 key1!49 v2!16)))))

(declare-fun b!885488 () Bool)

(assert (=> b!885488 (= e!492800 call!39115)))

(declare-fun b!885489 () Bool)

(assert (=> b!885489 (= c!93307 (and (is-Cons!17645 (t!24926 l!906)) (bvsgt (_1!5941 (h!18776 (t!24926 l!906))) key1!49)))))

(assert (=> b!885489 (= e!492803 e!492801)))

(declare-fun b!885490 () Bool)

(assert (=> b!885490 (= e!492801 call!39114)))

(declare-fun b!885491 () Bool)

(declare-fun res!601351 () Bool)

(assert (=> b!885491 (=> (not res!601351) (not e!492804))))

(assert (=> b!885491 (= res!601351 (containsKey!409 lt!401024 key1!49))))

(declare-fun d!109395 () Bool)

(assert (=> d!109395 e!492804))

(declare-fun res!601350 () Bool)

(assert (=> d!109395 (=> (not res!601350) (not e!492804))))

(assert (=> d!109395 (= res!601350 (isStrictlySorted!473 lt!401024))))

(assert (=> d!109395 (= lt!401024 e!492800)))

(declare-fun c!93308 () Bool)

(assert (=> d!109395 (= c!93308 (and (is-Cons!17645 (t!24926 l!906)) (bvslt (_1!5941 (h!18776 (t!24926 l!906))) key1!49)))))

(assert (=> d!109395 (isStrictlySorted!473 (t!24926 l!906))))

(assert (=> d!109395 (= (insertStrictlySorted!290 (t!24926 l!906) key1!49 v2!16) lt!401024)))

(declare-fun bm!39111 () Bool)

(assert (=> bm!39111 (= call!39115 ($colon$colon!544 e!492802 (ite c!93308 (h!18776 (t!24926 l!906)) (tuple2!11861 key1!49 v2!16))))))

(declare-fun c!93309 () Bool)

(assert (=> bm!39111 (= c!93309 c!93308)))

(declare-fun bm!39112 () Bool)

(assert (=> bm!39112 (= call!39114 call!39113)))

(declare-fun b!885492 () Bool)

(assert (=> b!885492 (= e!492803 call!39113)))

(assert (= (and d!109395 c!93308) b!885488))

(assert (= (and d!109395 (not c!93308)) b!885485))

(assert (= (and b!885485 c!93306) b!885492))

(assert (= (and b!885485 (not c!93306)) b!885489))

(assert (= (and b!885489 c!93307) b!885490))

(assert (= (and b!885489 (not c!93307)) b!885486))

(assert (= (or b!885490 b!885486) bm!39112))

(assert (= (or b!885492 bm!39112) bm!39110))

(assert (= (or b!885488 bm!39110) bm!39111))

(assert (= (and bm!39111 c!93309) b!885484))

(assert (= (and bm!39111 (not c!93309)) b!885483))

(assert (= (and d!109395 res!601350) b!885491))

(assert (= (and b!885491 res!601351) b!885487))

(declare-fun m!825707 () Bool)

(assert (=> b!885484 m!825707))

(declare-fun m!825709 () Bool)

(assert (=> b!885491 m!825709))

(declare-fun m!825711 () Bool)

(assert (=> b!885487 m!825711))

(declare-fun m!825713 () Bool)

(assert (=> bm!39111 m!825713))

(declare-fun m!825715 () Bool)

(assert (=> d!109395 m!825715))

(assert (=> d!109395 m!825605))

(assert (=> b!885327 d!109395))

(declare-fun c!93310 () Bool)

(declare-fun e!492813 () List!17649)

(declare-fun b!885499 () Bool)

(declare-fun c!93311 () Bool)

(assert (=> b!885499 (= e!492813 (ite c!93310 (t!24926 (t!24926 l!906)) (ite c!93311 (Cons!17645 (h!18776 (t!24926 l!906)) (t!24926 (t!24926 l!906))) Nil!17646)))))

(declare-fun b!885500 () Bool)

(assert (=> b!885500 (= e!492813 (insertStrictlySorted!290 (t!24926 (t!24926 l!906)) key1!49 v1!38))))

(declare-fun bm!39113 () Bool)

(declare-fun call!39116 () List!17649)

(declare-fun call!39118 () List!17649)

(assert (=> bm!39113 (= call!39116 call!39118)))

(declare-fun b!885501 () Bool)

(declare-fun e!492811 () List!17649)

(declare-fun e!492814 () List!17649)

(assert (=> b!885501 (= e!492811 e!492814)))

(assert (=> b!885501 (= c!93310 (and (is-Cons!17645 (t!24926 l!906)) (= (_1!5941 (h!18776 (t!24926 l!906))) key1!49)))))

(declare-fun b!885502 () Bool)

(declare-fun e!492812 () List!17649)

(declare-fun call!39117 () List!17649)

(assert (=> b!885502 (= e!492812 call!39117)))

(declare-fun e!492815 () Bool)

(declare-fun lt!401025 () List!17649)

(declare-fun b!885503 () Bool)

(assert (=> b!885503 (= e!492815 (contains!4292 lt!401025 (tuple2!11861 key1!49 v1!38)))))

(declare-fun b!885504 () Bool)

(assert (=> b!885504 (= e!492811 call!39118)))

(declare-fun b!885505 () Bool)

(assert (=> b!885505 (= c!93311 (and (is-Cons!17645 (t!24926 l!906)) (bvsgt (_1!5941 (h!18776 (t!24926 l!906))) key1!49)))))

(assert (=> b!885505 (= e!492814 e!492812)))

(declare-fun b!885506 () Bool)

(assert (=> b!885506 (= e!492812 call!39117)))

(declare-fun b!885507 () Bool)

(declare-fun res!601359 () Bool)

(assert (=> b!885507 (=> (not res!601359) (not e!492815))))

(assert (=> b!885507 (= res!601359 (containsKey!409 lt!401025 key1!49))))

(declare-fun d!109401 () Bool)

(assert (=> d!109401 e!492815))

(declare-fun res!601358 () Bool)

(assert (=> d!109401 (=> (not res!601358) (not e!492815))))

(assert (=> d!109401 (= res!601358 (isStrictlySorted!473 lt!401025))))

(assert (=> d!109401 (= lt!401025 e!492811)))

(declare-fun c!93312 () Bool)

(assert (=> d!109401 (= c!93312 (and (is-Cons!17645 (t!24926 l!906)) (bvslt (_1!5941 (h!18776 (t!24926 l!906))) key1!49)))))

(assert (=> d!109401 (isStrictlySorted!473 (t!24926 l!906))))

(assert (=> d!109401 (= (insertStrictlySorted!290 (t!24926 l!906) key1!49 v1!38) lt!401025)))

(declare-fun bm!39114 () Bool)

(assert (=> bm!39114 (= call!39118 ($colon$colon!544 e!492813 (ite c!93312 (h!18776 (t!24926 l!906)) (tuple2!11861 key1!49 v1!38))))))

(declare-fun c!93313 () Bool)

(assert (=> bm!39114 (= c!93313 c!93312)))

(declare-fun bm!39115 () Bool)

(assert (=> bm!39115 (= call!39117 call!39116)))

(declare-fun b!885508 () Bool)

(assert (=> b!885508 (= e!492814 call!39116)))

(assert (= (and d!109401 c!93312) b!885504))

(assert (= (and d!109401 (not c!93312)) b!885501))

(assert (= (and b!885501 c!93310) b!885508))

(assert (= (and b!885501 (not c!93310)) b!885505))

(assert (= (and b!885505 c!93311) b!885506))

(assert (= (and b!885505 (not c!93311)) b!885502))

(assert (= (or b!885506 b!885502) bm!39115))

(assert (= (or b!885508 bm!39115) bm!39113))

(assert (= (or b!885504 bm!39113) bm!39114))

(assert (= (and bm!39114 c!93313) b!885500))

(assert (= (and bm!39114 (not c!93313)) b!885499))

(assert (= (and d!109401 res!601358) b!885507))

(assert (= (and b!885507 res!601359) b!885503))

(declare-fun m!825719 () Bool)

(assert (=> b!885500 m!825719))

(declare-fun m!825721 () Bool)

(assert (=> b!885507 m!825721))

(declare-fun m!825723 () Bool)

(assert (=> b!885503 m!825723))

(declare-fun m!825725 () Bool)

(assert (=> bm!39114 m!825725))

(declare-fun m!825727 () Bool)

(assert (=> d!109401 m!825727))

(assert (=> d!109401 m!825605))

(assert (=> b!885327 d!109401))

(declare-fun e!492825 () List!17649)

(declare-fun c!93314 () Bool)

(declare-fun b!885518 () Bool)

(declare-fun c!93315 () Bool)

(assert (=> b!885518 (= e!492825 (ite c!93314 (t!24926 l!906) (ite c!93315 (Cons!17645 (h!18776 l!906) (t!24926 l!906)) Nil!17646)))))

(declare-fun b!885519 () Bool)

(assert (=> b!885519 (= e!492825 (insertStrictlySorted!290 (t!24926 l!906) key1!49 v1!38))))

(declare-fun bm!39116 () Bool)

(declare-fun call!39119 () List!17649)

(declare-fun call!39121 () List!17649)

(assert (=> bm!39116 (= call!39119 call!39121)))

(declare-fun b!885520 () Bool)

(declare-fun e!492823 () List!17649)

(declare-fun e!492826 () List!17649)

(assert (=> b!885520 (= e!492823 e!492826)))

(assert (=> b!885520 (= c!93314 (and (is-Cons!17645 l!906) (= (_1!5941 (h!18776 l!906)) key1!49)))))

(declare-fun b!885521 () Bool)

(declare-fun e!492824 () List!17649)

(declare-fun call!39120 () List!17649)

(assert (=> b!885521 (= e!492824 call!39120)))

(declare-fun e!492827 () Bool)

(declare-fun b!885522 () Bool)

(declare-fun lt!401026 () List!17649)

(assert (=> b!885522 (= e!492827 (contains!4292 lt!401026 (tuple2!11861 key1!49 v1!38)))))

(declare-fun b!885523 () Bool)

(assert (=> b!885523 (= e!492823 call!39121)))

(declare-fun b!885524 () Bool)

(assert (=> b!885524 (= c!93315 (and (is-Cons!17645 l!906) (bvsgt (_1!5941 (h!18776 l!906)) key1!49)))))

(assert (=> b!885524 (= e!492826 e!492824)))

(declare-fun b!885525 () Bool)

(assert (=> b!885525 (= e!492824 call!39120)))

(declare-fun b!885526 () Bool)

(declare-fun res!601365 () Bool)

(assert (=> b!885526 (=> (not res!601365) (not e!492827))))

(assert (=> b!885526 (= res!601365 (containsKey!409 lt!401026 key1!49))))

