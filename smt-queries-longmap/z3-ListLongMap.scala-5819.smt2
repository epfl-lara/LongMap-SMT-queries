; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75214 () Bool)

(assert start!75214)

(declare-fun res!601521 () Bool)

(declare-fun e!493127 () Bool)

(assert (=> start!75214 (=> (not res!601521) (not e!493127))))

(declare-datatypes ((B!1232 0))(
  ( (B!1233 (val!8922 Int)) )
))
(declare-datatypes ((tuple2!11768 0))(
  ( (tuple2!11769 (_1!5895 (_ BitVec 64)) (_2!5895 B!1232)) )
))
(declare-datatypes ((List!17593 0))(
  ( (Nil!17590) (Cons!17589 (h!18726 tuple2!11768) (t!24862 List!17593)) )
))
(declare-datatypes ((ListLongMap!10539 0))(
  ( (ListLongMap!10540 (toList!5285 List!17593)) )
))
(declare-fun lm!210 () ListLongMap!10539)

(declare-fun isStrictlySorted!453 (List!17593) Bool)

(assert (=> start!75214 (= res!601521 (isStrictlySorted!453 (toList!5285 lm!210)))))

(assert (=> start!75214 e!493127))

(declare-fun e!493128 () Bool)

(declare-fun inv!29369 (ListLongMap!10539) Bool)

(assert (=> start!75214 (and (inv!29369 lm!210) e!493128)))

(assert (=> start!75214 true))

(declare-fun tp_is_empty!17743 () Bool)

(assert (=> start!75214 tp_is_empty!17743))

(declare-fun b!885924 () Bool)

(declare-fun a!500 () (_ BitVec 64))

(declare-fun b1!76 () B!1232)

(declare-fun lt!401245 () tuple2!11768)

(declare-fun +!2591 (ListLongMap!10539 tuple2!11768) ListLongMap!10539)

(assert (=> b!885924 (= e!493127 (not (= (+!2591 lm!210 lt!401245) (+!2591 (+!2591 lm!210 (tuple2!11769 a!500 b1!76)) lt!401245))))))

(declare-fun b2!54 () B!1232)

(assert (=> b!885924 (= lt!401245 (tuple2!11769 a!500 b2!54))))

(declare-fun insertStrictlySorted!283 (List!17593 (_ BitVec 64) B!1232) List!17593)

(assert (=> b!885924 (= (insertStrictlySorted!283 (insertStrictlySorted!283 (toList!5285 lm!210) a!500 b1!76) a!500 b2!54) (insertStrictlySorted!283 (toList!5285 lm!210) a!500 b2!54))))

(declare-datatypes ((Unit!30196 0))(
  ( (Unit!30197) )
))
(declare-fun lt!401246 () Unit!30196)

(declare-fun lemmaInsertStrictlySortedErasesIfSameKey!1 (List!17593 (_ BitVec 64) B!1232 B!1232) Unit!30196)

(assert (=> b!885924 (= lt!401246 (lemmaInsertStrictlySortedErasesIfSameKey!1 (toList!5285 lm!210) a!500 b1!76 b2!54))))

(declare-fun b!885925 () Bool)

(declare-fun tp!54213 () Bool)

(assert (=> b!885925 (= e!493128 tp!54213)))

(assert (= (and start!75214 res!601521) b!885924))

(assert (= start!75214 b!885925))

(declare-fun m!826547 () Bool)

(assert (=> start!75214 m!826547))

(declare-fun m!826549 () Bool)

(assert (=> start!75214 m!826549))

(declare-fun m!826551 () Bool)

(assert (=> b!885924 m!826551))

(declare-fun m!826553 () Bool)

(assert (=> b!885924 m!826553))

(assert (=> b!885924 m!826551))

(declare-fun m!826555 () Bool)

(assert (=> b!885924 m!826555))

(declare-fun m!826557 () Bool)

(assert (=> b!885924 m!826557))

(declare-fun m!826559 () Bool)

(assert (=> b!885924 m!826559))

(assert (=> b!885924 m!826555))

(declare-fun m!826561 () Bool)

(assert (=> b!885924 m!826561))

(declare-fun m!826563 () Bool)

(assert (=> b!885924 m!826563))

(check-sat (not start!75214) (not b!885924) (not b!885925) tp_is_empty!17743)
(check-sat)
(get-model)

(declare-fun d!109633 () Bool)

(declare-fun res!601532 () Bool)

(declare-fun e!493145 () Bool)

(assert (=> d!109633 (=> res!601532 e!493145)))

(get-info :version)

(assert (=> d!109633 (= res!601532 (or ((_ is Nil!17590) (toList!5285 lm!210)) ((_ is Nil!17590) (t!24862 (toList!5285 lm!210)))))))

(assert (=> d!109633 (= (isStrictlySorted!453 (toList!5285 lm!210)) e!493145)))

(declare-fun b!885942 () Bool)

(declare-fun e!493146 () Bool)

(assert (=> b!885942 (= e!493145 e!493146)))

(declare-fun res!601533 () Bool)

(assert (=> b!885942 (=> (not res!601533) (not e!493146))))

(assert (=> b!885942 (= res!601533 (bvslt (_1!5895 (h!18726 (toList!5285 lm!210))) (_1!5895 (h!18726 (t!24862 (toList!5285 lm!210))))))))

(declare-fun b!885943 () Bool)

(assert (=> b!885943 (= e!493146 (isStrictlySorted!453 (t!24862 (toList!5285 lm!210))))))

(assert (= (and d!109633 (not res!601532)) b!885942))

(assert (= (and b!885942 res!601533) b!885943))

(declare-fun m!826601 () Bool)

(assert (=> b!885943 m!826601))

(assert (=> start!75214 d!109633))

(declare-fun d!109635 () Bool)

(assert (=> d!109635 (= (inv!29369 lm!210) (isStrictlySorted!453 (toList!5285 lm!210)))))

(declare-fun bs!24820 () Bool)

(assert (= bs!24820 d!109635))

(assert (=> bs!24820 m!826547))

(assert (=> start!75214 d!109635))

(declare-fun d!109637 () Bool)

(declare-fun e!493162 () Bool)

(assert (=> d!109637 e!493162))

(declare-fun res!601549 () Bool)

(assert (=> d!109637 (=> (not res!601549) (not e!493162))))

(declare-fun lt!401282 () ListLongMap!10539)

(declare-fun contains!4266 (ListLongMap!10539 (_ BitVec 64)) Bool)

(assert (=> d!109637 (= res!601549 (contains!4266 lt!401282 (_1!5895 lt!401245)))))

(declare-fun lt!401281 () List!17593)

(assert (=> d!109637 (= lt!401282 (ListLongMap!10540 lt!401281))))

(declare-fun lt!401284 () Unit!30196)

(declare-fun lt!401283 () Unit!30196)

(assert (=> d!109637 (= lt!401284 lt!401283)))

(declare-datatypes ((Option!437 0))(
  ( (Some!436 (v!11394 B!1232)) (None!435) )
))
(declare-fun getValueByKey!431 (List!17593 (_ BitVec 64)) Option!437)

(assert (=> d!109637 (= (getValueByKey!431 lt!401281 (_1!5895 lt!401245)) (Some!436 (_2!5895 lt!401245)))))

(declare-fun lemmaContainsTupThenGetReturnValue!245 (List!17593 (_ BitVec 64) B!1232) Unit!30196)

(assert (=> d!109637 (= lt!401283 (lemmaContainsTupThenGetReturnValue!245 lt!401281 (_1!5895 lt!401245) (_2!5895 lt!401245)))))

(assert (=> d!109637 (= lt!401281 (insertStrictlySorted!283 (toList!5285 lm!210) (_1!5895 lt!401245) (_2!5895 lt!401245)))))

(assert (=> d!109637 (= (+!2591 lm!210 lt!401245) lt!401282)))

(declare-fun b!885974 () Bool)

(declare-fun res!601548 () Bool)

(assert (=> b!885974 (=> (not res!601548) (not e!493162))))

(assert (=> b!885974 (= res!601548 (= (getValueByKey!431 (toList!5285 lt!401282) (_1!5895 lt!401245)) (Some!436 (_2!5895 lt!401245))))))

(declare-fun b!885975 () Bool)

(declare-fun contains!4267 (List!17593 tuple2!11768) Bool)

(assert (=> b!885975 (= e!493162 (contains!4267 (toList!5285 lt!401282) lt!401245))))

(assert (= (and d!109637 res!601549) b!885974))

(assert (= (and b!885974 res!601548) b!885975))

(declare-fun m!826615 () Bool)

(assert (=> d!109637 m!826615))

(declare-fun m!826617 () Bool)

(assert (=> d!109637 m!826617))

(declare-fun m!826619 () Bool)

(assert (=> d!109637 m!826619))

(declare-fun m!826621 () Bool)

(assert (=> d!109637 m!826621))

(declare-fun m!826623 () Bool)

(assert (=> b!885974 m!826623))

(declare-fun m!826625 () Bool)

(assert (=> b!885975 m!826625))

(assert (=> b!885924 d!109637))

(declare-fun b!886044 () Bool)

(declare-fun c!93503 () Bool)

(assert (=> b!886044 (= c!93503 (and ((_ is Cons!17589) (toList!5285 lm!210)) (bvsgt (_1!5895 (h!18726 (toList!5285 lm!210))) a!500)))))

(declare-fun e!493199 () List!17593)

(declare-fun e!493201 () List!17593)

(assert (=> b!886044 (= e!493199 e!493201)))

(declare-fun b!886045 () Bool)

(declare-fun e!493198 () List!17593)

(declare-fun call!39094 () List!17593)

(assert (=> b!886045 (= e!493198 call!39094)))

(declare-fun b!886047 () Bool)

(assert (=> b!886047 (= e!493198 e!493199)))

(declare-fun c!93502 () Bool)

(assert (=> b!886047 (= c!93502 (and ((_ is Cons!17589) (toList!5285 lm!210)) (= (_1!5895 (h!18726 (toList!5285 lm!210))) a!500)))))

(declare-fun b!886048 () Bool)

(declare-fun lt!401313 () List!17593)

(declare-fun e!493197 () Bool)

(assert (=> b!886048 (= e!493197 (contains!4267 lt!401313 (tuple2!11769 a!500 b2!54)))))

(declare-fun bm!39089 () Bool)

(declare-fun c!93501 () Bool)

(declare-fun e!493200 () List!17593)

(declare-fun $colon$colon!538 (List!17593 tuple2!11768) List!17593)

(assert (=> bm!39089 (= call!39094 ($colon$colon!538 e!493200 (ite c!93501 (h!18726 (toList!5285 lm!210)) (tuple2!11769 a!500 b2!54))))))

(declare-fun c!93500 () Bool)

(assert (=> bm!39089 (= c!93500 c!93501)))

(declare-fun b!886049 () Bool)

(declare-fun call!39093 () List!17593)

(assert (=> b!886049 (= e!493201 call!39093)))

(declare-fun b!886046 () Bool)

(declare-fun call!39092 () List!17593)

(assert (=> b!886046 (= e!493199 call!39092)))

(declare-fun d!109641 () Bool)

(assert (=> d!109641 e!493197))

(declare-fun res!601570 () Bool)

(assert (=> d!109641 (=> (not res!601570) (not e!493197))))

(assert (=> d!109641 (= res!601570 (isStrictlySorted!453 lt!401313))))

(assert (=> d!109641 (= lt!401313 e!493198)))

(assert (=> d!109641 (= c!93501 (and ((_ is Cons!17589) (toList!5285 lm!210)) (bvslt (_1!5895 (h!18726 (toList!5285 lm!210))) a!500)))))

(assert (=> d!109641 (isStrictlySorted!453 (toList!5285 lm!210))))

(assert (=> d!109641 (= (insertStrictlySorted!283 (toList!5285 lm!210) a!500 b2!54) lt!401313)))

(declare-fun bm!39090 () Bool)

(assert (=> bm!39090 (= call!39093 call!39092)))

(declare-fun b!886050 () Bool)

(assert (=> b!886050 (= e!493200 (ite c!93502 (t!24862 (toList!5285 lm!210)) (ite c!93503 (Cons!17589 (h!18726 (toList!5285 lm!210)) (t!24862 (toList!5285 lm!210))) Nil!17590)))))

(declare-fun b!886051 () Bool)

(declare-fun res!601571 () Bool)

(assert (=> b!886051 (=> (not res!601571) (not e!493197))))

(declare-fun containsKey!406 (List!17593 (_ BitVec 64)) Bool)

(assert (=> b!886051 (= res!601571 (containsKey!406 lt!401313 a!500))))

(declare-fun b!886052 () Bool)

(assert (=> b!886052 (= e!493201 call!39093)))

(declare-fun bm!39091 () Bool)

(assert (=> bm!39091 (= call!39092 call!39094)))

(declare-fun b!886053 () Bool)

(assert (=> b!886053 (= e!493200 (insertStrictlySorted!283 (t!24862 (toList!5285 lm!210)) a!500 b2!54))))

(assert (= (and d!109641 c!93501) b!886045))

(assert (= (and d!109641 (not c!93501)) b!886047))

(assert (= (and b!886047 c!93502) b!886046))

(assert (= (and b!886047 (not c!93502)) b!886044))

(assert (= (and b!886044 c!93503) b!886052))

(assert (= (and b!886044 (not c!93503)) b!886049))

(assert (= (or b!886052 b!886049) bm!39090))

(assert (= (or b!886046 bm!39090) bm!39091))

(assert (= (or b!886045 bm!39091) bm!39089))

(assert (= (and bm!39089 c!93500) b!886053))

(assert (= (and bm!39089 (not c!93500)) b!886050))

(assert (= (and d!109641 res!601570) b!886051))

(assert (= (and b!886051 res!601571) b!886048))

(declare-fun m!826695 () Bool)

(assert (=> bm!39089 m!826695))

(declare-fun m!826699 () Bool)

(assert (=> b!886048 m!826699))

(declare-fun m!826703 () Bool)

(assert (=> b!886051 m!826703))

(declare-fun m!826705 () Bool)

(assert (=> b!886053 m!826705))

(declare-fun m!826707 () Bool)

(assert (=> d!109641 m!826707))

(assert (=> d!109641 m!826547))

(assert (=> b!885924 d!109641))

(declare-fun d!109659 () Bool)

(declare-fun e!493214 () Bool)

(assert (=> d!109659 e!493214))

(declare-fun res!601581 () Bool)

(assert (=> d!109659 (=> (not res!601581) (not e!493214))))

(declare-fun lt!401325 () ListLongMap!10539)

(assert (=> d!109659 (= res!601581 (contains!4266 lt!401325 (_1!5895 lt!401245)))))

(declare-fun lt!401324 () List!17593)

(assert (=> d!109659 (= lt!401325 (ListLongMap!10540 lt!401324))))

(declare-fun lt!401327 () Unit!30196)

(declare-fun lt!401326 () Unit!30196)

(assert (=> d!109659 (= lt!401327 lt!401326)))

(assert (=> d!109659 (= (getValueByKey!431 lt!401324 (_1!5895 lt!401245)) (Some!436 (_2!5895 lt!401245)))))

(assert (=> d!109659 (= lt!401326 (lemmaContainsTupThenGetReturnValue!245 lt!401324 (_1!5895 lt!401245) (_2!5895 lt!401245)))))

(assert (=> d!109659 (= lt!401324 (insertStrictlySorted!283 (toList!5285 (+!2591 lm!210 (tuple2!11769 a!500 b1!76))) (_1!5895 lt!401245) (_2!5895 lt!401245)))))

(assert (=> d!109659 (= (+!2591 (+!2591 lm!210 (tuple2!11769 a!500 b1!76)) lt!401245) lt!401325)))

(declare-fun b!886078 () Bool)

(declare-fun res!601580 () Bool)

(assert (=> b!886078 (=> (not res!601580) (not e!493214))))

(assert (=> b!886078 (= res!601580 (= (getValueByKey!431 (toList!5285 lt!401325) (_1!5895 lt!401245)) (Some!436 (_2!5895 lt!401245))))))

(declare-fun b!886079 () Bool)

(assert (=> b!886079 (= e!493214 (contains!4267 (toList!5285 lt!401325) lt!401245))))

(assert (= (and d!109659 res!601581) b!886078))

(assert (= (and b!886078 res!601580) b!886079))

(declare-fun m!826709 () Bool)

(assert (=> d!109659 m!826709))

(declare-fun m!826713 () Bool)

(assert (=> d!109659 m!826713))

(declare-fun m!826717 () Bool)

(assert (=> d!109659 m!826717))

(declare-fun m!826719 () Bool)

(assert (=> d!109659 m!826719))

(declare-fun m!826723 () Bool)

(assert (=> b!886078 m!826723))

(declare-fun m!826727 () Bool)

(assert (=> b!886079 m!826727))

(assert (=> b!885924 d!109659))

(declare-fun d!109661 () Bool)

(declare-fun e!493215 () Bool)

(assert (=> d!109661 e!493215))

(declare-fun res!601583 () Bool)

(assert (=> d!109661 (=> (not res!601583) (not e!493215))))

(declare-fun lt!401329 () ListLongMap!10539)

(assert (=> d!109661 (= res!601583 (contains!4266 lt!401329 (_1!5895 (tuple2!11769 a!500 b1!76))))))

(declare-fun lt!401328 () List!17593)

(assert (=> d!109661 (= lt!401329 (ListLongMap!10540 lt!401328))))

(declare-fun lt!401331 () Unit!30196)

(declare-fun lt!401330 () Unit!30196)

(assert (=> d!109661 (= lt!401331 lt!401330)))

(assert (=> d!109661 (= (getValueByKey!431 lt!401328 (_1!5895 (tuple2!11769 a!500 b1!76))) (Some!436 (_2!5895 (tuple2!11769 a!500 b1!76))))))

(assert (=> d!109661 (= lt!401330 (lemmaContainsTupThenGetReturnValue!245 lt!401328 (_1!5895 (tuple2!11769 a!500 b1!76)) (_2!5895 (tuple2!11769 a!500 b1!76))))))

(assert (=> d!109661 (= lt!401328 (insertStrictlySorted!283 (toList!5285 lm!210) (_1!5895 (tuple2!11769 a!500 b1!76)) (_2!5895 (tuple2!11769 a!500 b1!76))))))

(assert (=> d!109661 (= (+!2591 lm!210 (tuple2!11769 a!500 b1!76)) lt!401329)))

(declare-fun b!886080 () Bool)

(declare-fun res!601582 () Bool)

(assert (=> b!886080 (=> (not res!601582) (not e!493215))))

(assert (=> b!886080 (= res!601582 (= (getValueByKey!431 (toList!5285 lt!401329) (_1!5895 (tuple2!11769 a!500 b1!76))) (Some!436 (_2!5895 (tuple2!11769 a!500 b1!76)))))))

(declare-fun b!886081 () Bool)

(assert (=> b!886081 (= e!493215 (contains!4267 (toList!5285 lt!401329) (tuple2!11769 a!500 b1!76)))))

(assert (= (and d!109661 res!601583) b!886080))

(assert (= (and b!886080 res!601582) b!886081))

(declare-fun m!826741 () Bool)

(assert (=> d!109661 m!826741))

(declare-fun m!826743 () Bool)

(assert (=> d!109661 m!826743))

(declare-fun m!826745 () Bool)

(assert (=> d!109661 m!826745))

(declare-fun m!826747 () Bool)

(assert (=> d!109661 m!826747))

(declare-fun m!826749 () Bool)

(assert (=> b!886080 m!826749))

(declare-fun m!826751 () Bool)

(assert (=> b!886081 m!826751))

(assert (=> b!885924 d!109661))

(declare-fun d!109667 () Bool)

(assert (=> d!109667 (= (insertStrictlySorted!283 (insertStrictlySorted!283 (toList!5285 lm!210) a!500 b1!76) a!500 b2!54) (insertStrictlySorted!283 (toList!5285 lm!210) a!500 b2!54))))

(declare-fun lt!401340 () Unit!30196)

(declare-fun choose!1452 (List!17593 (_ BitVec 64) B!1232 B!1232) Unit!30196)

(assert (=> d!109667 (= lt!401340 (choose!1452 (toList!5285 lm!210) a!500 b1!76 b2!54))))

(assert (=> d!109667 (isStrictlySorted!453 (toList!5285 lm!210))))

(assert (=> d!109667 (= (lemmaInsertStrictlySortedErasesIfSameKey!1 (toList!5285 lm!210) a!500 b1!76 b2!54) lt!401340)))

(declare-fun bs!24823 () Bool)

(assert (= bs!24823 d!109667))

(assert (=> bs!24823 m!826551))

(assert (=> bs!24823 m!826551))

(assert (=> bs!24823 m!826553))

(assert (=> bs!24823 m!826547))

(declare-fun m!826791 () Bool)

(assert (=> bs!24823 m!826791))

(assert (=> bs!24823 m!826559))

(assert (=> b!885924 d!109667))

(declare-fun b!886114 () Bool)

(declare-fun c!93523 () Bool)

(assert (=> b!886114 (= c!93523 (and ((_ is Cons!17589) (toList!5285 lm!210)) (bvsgt (_1!5895 (h!18726 (toList!5285 lm!210))) a!500)))))

(declare-fun e!493239 () List!17593)

(declare-fun e!493241 () List!17593)

(assert (=> b!886114 (= e!493239 e!493241)))

(declare-fun b!886115 () Bool)

(declare-fun e!493238 () List!17593)

(declare-fun call!39109 () List!17593)

(assert (=> b!886115 (= e!493238 call!39109)))

(declare-fun b!886117 () Bool)

(assert (=> b!886117 (= e!493238 e!493239)))

(declare-fun c!93522 () Bool)

(assert (=> b!886117 (= c!93522 (and ((_ is Cons!17589) (toList!5285 lm!210)) (= (_1!5895 (h!18726 (toList!5285 lm!210))) a!500)))))

(declare-fun b!886118 () Bool)

(declare-fun e!493237 () Bool)

(declare-fun lt!401341 () List!17593)

(assert (=> b!886118 (= e!493237 (contains!4267 lt!401341 (tuple2!11769 a!500 b1!76)))))

(declare-fun c!93521 () Bool)

(declare-fun bm!39104 () Bool)

(declare-fun e!493240 () List!17593)

(assert (=> bm!39104 (= call!39109 ($colon$colon!538 e!493240 (ite c!93521 (h!18726 (toList!5285 lm!210)) (tuple2!11769 a!500 b1!76))))))

(declare-fun c!93520 () Bool)

(assert (=> bm!39104 (= c!93520 c!93521)))

(declare-fun b!886119 () Bool)

(declare-fun call!39108 () List!17593)

(assert (=> b!886119 (= e!493241 call!39108)))

(declare-fun b!886116 () Bool)

(declare-fun call!39107 () List!17593)

(assert (=> b!886116 (= e!493239 call!39107)))

(declare-fun d!109677 () Bool)

(assert (=> d!109677 e!493237))

(declare-fun res!601600 () Bool)

(assert (=> d!109677 (=> (not res!601600) (not e!493237))))

(assert (=> d!109677 (= res!601600 (isStrictlySorted!453 lt!401341))))

(assert (=> d!109677 (= lt!401341 e!493238)))

(assert (=> d!109677 (= c!93521 (and ((_ is Cons!17589) (toList!5285 lm!210)) (bvslt (_1!5895 (h!18726 (toList!5285 lm!210))) a!500)))))

(assert (=> d!109677 (isStrictlySorted!453 (toList!5285 lm!210))))

(assert (=> d!109677 (= (insertStrictlySorted!283 (toList!5285 lm!210) a!500 b1!76) lt!401341)))

(declare-fun bm!39105 () Bool)

(assert (=> bm!39105 (= call!39108 call!39107)))

(declare-fun b!886120 () Bool)

(assert (=> b!886120 (= e!493240 (ite c!93522 (t!24862 (toList!5285 lm!210)) (ite c!93523 (Cons!17589 (h!18726 (toList!5285 lm!210)) (t!24862 (toList!5285 lm!210))) Nil!17590)))))

(declare-fun b!886121 () Bool)

(declare-fun res!601601 () Bool)

(assert (=> b!886121 (=> (not res!601601) (not e!493237))))

(assert (=> b!886121 (= res!601601 (containsKey!406 lt!401341 a!500))))

(declare-fun b!886122 () Bool)

(assert (=> b!886122 (= e!493241 call!39108)))

(declare-fun bm!39106 () Bool)

(assert (=> bm!39106 (= call!39107 call!39109)))

(declare-fun b!886123 () Bool)

(assert (=> b!886123 (= e!493240 (insertStrictlySorted!283 (t!24862 (toList!5285 lm!210)) a!500 b1!76))))

(assert (= (and d!109677 c!93521) b!886115))

(assert (= (and d!109677 (not c!93521)) b!886117))

(assert (= (and b!886117 c!93522) b!886116))

(assert (= (and b!886117 (not c!93522)) b!886114))

(assert (= (and b!886114 c!93523) b!886122))

(assert (= (and b!886114 (not c!93523)) b!886119))

(assert (= (or b!886122 b!886119) bm!39105))

(assert (= (or b!886116 bm!39105) bm!39106))

(assert (= (or b!886115 bm!39106) bm!39104))

(assert (= (and bm!39104 c!93520) b!886123))

(assert (= (and bm!39104 (not c!93520)) b!886120))

(assert (= (and d!109677 res!601600) b!886121))

(assert (= (and b!886121 res!601601) b!886118))

(declare-fun m!826795 () Bool)

(assert (=> bm!39104 m!826795))

(declare-fun m!826797 () Bool)

(assert (=> b!886118 m!826797))

(declare-fun m!826799 () Bool)

(assert (=> b!886121 m!826799))

(declare-fun m!826801 () Bool)

(assert (=> b!886123 m!826801))

(declare-fun m!826803 () Bool)

(assert (=> d!109677 m!826803))

(assert (=> d!109677 m!826547))

(assert (=> b!885924 d!109677))

(declare-fun b!886135 () Bool)

(declare-fun c!93527 () Bool)

(assert (=> b!886135 (= c!93527 (and ((_ is Cons!17589) (insertStrictlySorted!283 (toList!5285 lm!210) a!500 b1!76)) (bvsgt (_1!5895 (h!18726 (insertStrictlySorted!283 (toList!5285 lm!210) a!500 b1!76))) a!500)))))

(declare-fun e!493249 () List!17593)

(declare-fun e!493253 () List!17593)

(assert (=> b!886135 (= e!493249 e!493253)))

(declare-fun b!886136 () Bool)

(declare-fun e!493248 () List!17593)

(declare-fun call!39112 () List!17593)

(assert (=> b!886136 (= e!493248 call!39112)))

(declare-fun b!886138 () Bool)

(assert (=> b!886138 (= e!493248 e!493249)))

(declare-fun c!93526 () Bool)

(assert (=> b!886138 (= c!93526 (and ((_ is Cons!17589) (insertStrictlySorted!283 (toList!5285 lm!210) a!500 b1!76)) (= (_1!5895 (h!18726 (insertStrictlySorted!283 (toList!5285 lm!210) a!500 b1!76))) a!500)))))

(declare-fun e!493247 () Bool)

(declare-fun lt!401342 () List!17593)

(declare-fun b!886139 () Bool)

(assert (=> b!886139 (= e!493247 (contains!4267 lt!401342 (tuple2!11769 a!500 b2!54)))))

(declare-fun e!493250 () List!17593)

(declare-fun c!93525 () Bool)

(declare-fun bm!39107 () Bool)

(assert (=> bm!39107 (= call!39112 ($colon$colon!538 e!493250 (ite c!93525 (h!18726 (insertStrictlySorted!283 (toList!5285 lm!210) a!500 b1!76)) (tuple2!11769 a!500 b2!54))))))

(declare-fun c!93524 () Bool)

(assert (=> bm!39107 (= c!93524 c!93525)))

(declare-fun b!886140 () Bool)

(declare-fun call!39111 () List!17593)

(assert (=> b!886140 (= e!493253 call!39111)))

(declare-fun b!886137 () Bool)

(declare-fun call!39110 () List!17593)

(assert (=> b!886137 (= e!493249 call!39110)))

(declare-fun d!109681 () Bool)

(assert (=> d!109681 e!493247))

(declare-fun res!601604 () Bool)

(assert (=> d!109681 (=> (not res!601604) (not e!493247))))

(assert (=> d!109681 (= res!601604 (isStrictlySorted!453 lt!401342))))

(assert (=> d!109681 (= lt!401342 e!493248)))

(assert (=> d!109681 (= c!93525 (and ((_ is Cons!17589) (insertStrictlySorted!283 (toList!5285 lm!210) a!500 b1!76)) (bvslt (_1!5895 (h!18726 (insertStrictlySorted!283 (toList!5285 lm!210) a!500 b1!76))) a!500)))))

(assert (=> d!109681 (isStrictlySorted!453 (insertStrictlySorted!283 (toList!5285 lm!210) a!500 b1!76))))

(assert (=> d!109681 (= (insertStrictlySorted!283 (insertStrictlySorted!283 (toList!5285 lm!210) a!500 b1!76) a!500 b2!54) lt!401342)))

(declare-fun bm!39108 () Bool)

(assert (=> bm!39108 (= call!39111 call!39110)))

(declare-fun b!886141 () Bool)

(assert (=> b!886141 (= e!493250 (ite c!93526 (t!24862 (insertStrictlySorted!283 (toList!5285 lm!210) a!500 b1!76)) (ite c!93527 (Cons!17589 (h!18726 (insertStrictlySorted!283 (toList!5285 lm!210) a!500 b1!76)) (t!24862 (insertStrictlySorted!283 (toList!5285 lm!210) a!500 b1!76))) Nil!17590)))))

(declare-fun b!886142 () Bool)

(declare-fun res!601605 () Bool)

(assert (=> b!886142 (=> (not res!601605) (not e!493247))))

(assert (=> b!886142 (= res!601605 (containsKey!406 lt!401342 a!500))))

(declare-fun b!886143 () Bool)

(assert (=> b!886143 (= e!493253 call!39111)))

(declare-fun bm!39109 () Bool)

(assert (=> bm!39109 (= call!39110 call!39112)))

(declare-fun b!886144 () Bool)

(assert (=> b!886144 (= e!493250 (insertStrictlySorted!283 (t!24862 (insertStrictlySorted!283 (toList!5285 lm!210) a!500 b1!76)) a!500 b2!54))))

(assert (= (and d!109681 c!93525) b!886136))

(assert (= (and d!109681 (not c!93525)) b!886138))

(assert (= (and b!886138 c!93526) b!886137))

(assert (= (and b!886138 (not c!93526)) b!886135))

(assert (= (and b!886135 c!93527) b!886143))

(assert (= (and b!886135 (not c!93527)) b!886140))

(assert (= (or b!886143 b!886140) bm!39108))

(assert (= (or b!886137 bm!39108) bm!39109))

(assert (= (or b!886136 bm!39109) bm!39107))

(assert (= (and bm!39107 c!93524) b!886144))

(assert (= (and bm!39107 (not c!93524)) b!886141))

(assert (= (and d!109681 res!601604) b!886142))

(assert (= (and b!886142 res!601605) b!886139))

(declare-fun m!826805 () Bool)

(assert (=> bm!39107 m!826805))

(declare-fun m!826807 () Bool)

(assert (=> b!886139 m!826807))

(declare-fun m!826809 () Bool)

(assert (=> b!886142 m!826809))

(declare-fun m!826811 () Bool)

(assert (=> b!886144 m!826811))

(declare-fun m!826813 () Bool)

(assert (=> d!109681 m!826813))

(assert (=> d!109681 m!826551))

(declare-fun m!826815 () Bool)

(assert (=> d!109681 m!826815))

(assert (=> b!885924 d!109681))

(declare-fun b!886150 () Bool)

(declare-fun e!493257 () Bool)

(declare-fun tp!54228 () Bool)

(assert (=> b!886150 (= e!493257 (and tp_is_empty!17743 tp!54228))))

(assert (=> b!885925 (= tp!54213 e!493257)))

(assert (= (and b!885925 ((_ is Cons!17589) (toList!5285 lm!210))) b!886150))

(check-sat (not b!885975) (not bm!39107) (not b!886079) (not b!886081) (not b!886144) (not b!885974) (not b!885943) (not b!886080) (not d!109637) (not d!109667) (not bm!39089) (not b!886121) tp_is_empty!17743 (not b!886142) (not d!109659) (not d!109641) (not b!886123) (not b!886139) (not d!109677) (not d!109635) (not b!886150) (not d!109681) (not b!886118) (not b!886053) (not b!886048) (not b!886051) (not bm!39104) (not b!886078) (not d!109661))
(check-sat)
