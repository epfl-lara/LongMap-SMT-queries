; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75096 () Bool)

(assert start!75096)

(declare-fun key1!49 () (_ BitVec 64))

(declare-fun e!492713 () Bool)

(declare-datatypes ((B!1252 0))(
  ( (B!1253 (val!8932 Int)) )
))
(declare-fun v1!38 () B!1252)

(declare-datatypes ((tuple2!11858 0))(
  ( (tuple2!11859 (_1!5940 (_ BitVec 64)) (_2!5940 B!1252)) )
))
(declare-datatypes ((List!17648 0))(
  ( (Nil!17645) (Cons!17644 (h!18775 tuple2!11858) (t!24925 List!17648)) )
))
(declare-fun l!906 () List!17648)

(declare-fun b!885315 () Bool)

(declare-fun isStrictlySorted!472 (List!17648) Bool)

(declare-fun insertStrictlySorted!289 (List!17648 (_ BitVec 64) B!1252) List!17648)

(assert (=> b!885315 (= e!492713 (not (isStrictlySorted!472 (insertStrictlySorted!289 l!906 key1!49 v1!38))))))

(declare-fun v2!16 () B!1252)

(assert (=> b!885315 (= (insertStrictlySorted!289 (insertStrictlySorted!289 (t!24925 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!289 (t!24925 l!906) key1!49 v2!16))))

(declare-datatypes ((Unit!30230 0))(
  ( (Unit!30231) )
))
(declare-fun lt!400996 () Unit!30230)

(declare-fun lemmaInsertStrictlySortedErasesIfSameKey!8 (List!17648 (_ BitVec 64) B!1252 B!1252) Unit!30230)

(assert (=> b!885315 (= lt!400996 (lemmaInsertStrictlySortedErasesIfSameKey!8 (t!24925 l!906) key1!49 v1!38 v2!16))))

(declare-fun b!885314 () Bool)

(declare-fun res!601306 () Bool)

(assert (=> b!885314 (=> (not res!601306) (not e!492713))))

(assert (=> b!885314 (= res!601306 (isStrictlySorted!472 (t!24925 l!906)))))

(declare-fun b!885313 () Bool)

(declare-fun res!601304 () Bool)

(assert (=> b!885313 (=> (not res!601304) (not e!492713))))

(get-info :version)

(assert (=> b!885313 (= res!601304 (and ((_ is Cons!17644) l!906) (bvslt (_1!5940 (h!18775 l!906)) key1!49)))))

(declare-fun b!885316 () Bool)

(declare-fun e!492714 () Bool)

(declare-fun tp_is_empty!17763 () Bool)

(declare-fun tp!54251 () Bool)

(assert (=> b!885316 (= e!492714 (and tp_is_empty!17763 tp!54251))))

(declare-fun res!601305 () Bool)

(assert (=> start!75096 (=> (not res!601305) (not e!492713))))

(assert (=> start!75096 (= res!601305 (isStrictlySorted!472 l!906))))

(assert (=> start!75096 e!492713))

(assert (=> start!75096 e!492714))

(assert (=> start!75096 true))

(assert (=> start!75096 tp_is_empty!17763))

(assert (= (and start!75096 res!601305) b!885313))

(assert (= (and b!885313 res!601304) b!885314))

(assert (= (and b!885314 res!601306) b!885315))

(assert (= (and start!75096 ((_ is Cons!17644) l!906)) b!885316))

(declare-fun m!825575 () Bool)

(assert (=> b!885315 m!825575))

(declare-fun m!825577 () Bool)

(assert (=> b!885315 m!825577))

(declare-fun m!825579 () Bool)

(assert (=> b!885315 m!825579))

(declare-fun m!825581 () Bool)

(assert (=> b!885315 m!825581))

(declare-fun m!825583 () Bool)

(assert (=> b!885315 m!825583))

(assert (=> b!885315 m!825581))

(declare-fun m!825585 () Bool)

(assert (=> b!885315 m!825585))

(assert (=> b!885315 m!825575))

(declare-fun m!825587 () Bool)

(assert (=> b!885314 m!825587))

(declare-fun m!825589 () Bool)

(assert (=> start!75096 m!825589))

(check-sat (not b!885314) (not b!885316) (not start!75096) tp_is_empty!17763 (not b!885315))
(check-sat)
(get-model)

(declare-fun d!109367 () Bool)

(assert (=> d!109367 (= (insertStrictlySorted!289 (insertStrictlySorted!289 (t!24925 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!289 (t!24925 l!906) key1!49 v2!16))))

(declare-fun lt!401002 () Unit!30230)

(declare-fun choose!1447 (List!17648 (_ BitVec 64) B!1252 B!1252) Unit!30230)

(assert (=> d!109367 (= lt!401002 (choose!1447 (t!24925 l!906) key1!49 v1!38 v2!16))))

(assert (=> d!109367 (isStrictlySorted!472 (t!24925 l!906))))

(assert (=> d!109367 (= (lemmaInsertStrictlySortedErasesIfSameKey!8 (t!24925 l!906) key1!49 v1!38 v2!16) lt!401002)))

(declare-fun bs!24822 () Bool)

(assert (= bs!24822 d!109367))

(assert (=> bs!24822 m!825585))

(assert (=> bs!24822 m!825575))

(assert (=> bs!24822 m!825575))

(assert (=> bs!24822 m!825577))

(assert (=> bs!24822 m!825587))

(declare-fun m!825607 () Bool)

(assert (=> bs!24822 m!825607))

(assert (=> b!885315 d!109367))

(declare-fun b!885382 () Bool)

(declare-fun e!492750 () List!17648)

(assert (=> b!885382 (= e!492750 (insertStrictlySorted!289 (t!24925 (insertStrictlySorted!289 (t!24925 l!906) key1!49 v1!38)) key1!49 v2!16))))

(declare-fun bm!39077 () Bool)

(declare-fun call!39081 () List!17648)

(declare-fun call!39080 () List!17648)

(assert (=> bm!39077 (= call!39081 call!39080)))

(declare-fun b!885383 () Bool)

(declare-fun res!601325 () Bool)

(declare-fun e!492751 () Bool)

(assert (=> b!885383 (=> (not res!601325) (not e!492751))))

(declare-fun lt!401015 () List!17648)

(declare-fun containsKey!407 (List!17648 (_ BitVec 64)) Bool)

(assert (=> b!885383 (= res!601325 (containsKey!407 lt!401015 key1!49))))

(declare-fun bm!39078 () Bool)

(declare-fun call!39082 () List!17648)

(assert (=> bm!39078 (= call!39082 call!39081)))

(declare-fun b!885384 () Bool)

(declare-fun e!492749 () List!17648)

(assert (=> b!885384 (= e!492749 call!39082)))

(declare-fun b!885385 () Bool)

(declare-fun c!93268 () Bool)

(declare-fun c!93271 () Bool)

(assert (=> b!885385 (= e!492750 (ite c!93271 (t!24925 (insertStrictlySorted!289 (t!24925 l!906) key1!49 v1!38)) (ite c!93268 (Cons!17644 (h!18775 (insertStrictlySorted!289 (t!24925 l!906) key1!49 v1!38)) (t!24925 (insertStrictlySorted!289 (t!24925 l!906) key1!49 v1!38))) Nil!17645)))))

(declare-fun b!885386 () Bool)

(assert (=> b!885386 (= e!492749 call!39082)))

(declare-fun b!885387 () Bool)

(assert (=> b!885387 (= c!93268 (and ((_ is Cons!17644) (insertStrictlySorted!289 (t!24925 l!906) key1!49 v1!38)) (bvsgt (_1!5940 (h!18775 (insertStrictlySorted!289 (t!24925 l!906) key1!49 v1!38))) key1!49)))))

(declare-fun e!492747 () List!17648)

(assert (=> b!885387 (= e!492747 e!492749)))

(declare-fun c!93270 () Bool)

(declare-fun bm!39079 () Bool)

(declare-fun $colon$colon!542 (List!17648 tuple2!11858) List!17648)

(assert (=> bm!39079 (= call!39080 ($colon$colon!542 e!492750 (ite c!93270 (h!18775 (insertStrictlySorted!289 (t!24925 l!906) key1!49 v1!38)) (tuple2!11859 key1!49 v2!16))))))

(declare-fun c!93269 () Bool)

(assert (=> bm!39079 (= c!93269 c!93270)))

(declare-fun b!885388 () Bool)

(declare-fun contains!4290 (List!17648 tuple2!11858) Bool)

(assert (=> b!885388 (= e!492751 (contains!4290 lt!401015 (tuple2!11859 key1!49 v2!16)))))

(declare-fun d!109371 () Bool)

(assert (=> d!109371 e!492751))

(declare-fun res!601324 () Bool)

(assert (=> d!109371 (=> (not res!601324) (not e!492751))))

(assert (=> d!109371 (= res!601324 (isStrictlySorted!472 lt!401015))))

(declare-fun e!492748 () List!17648)

(assert (=> d!109371 (= lt!401015 e!492748)))

(assert (=> d!109371 (= c!93270 (and ((_ is Cons!17644) (insertStrictlySorted!289 (t!24925 l!906) key1!49 v1!38)) (bvslt (_1!5940 (h!18775 (insertStrictlySorted!289 (t!24925 l!906) key1!49 v1!38))) key1!49)))))

(assert (=> d!109371 (isStrictlySorted!472 (insertStrictlySorted!289 (t!24925 l!906) key1!49 v1!38))))

(assert (=> d!109371 (= (insertStrictlySorted!289 (insertStrictlySorted!289 (t!24925 l!906) key1!49 v1!38) key1!49 v2!16) lt!401015)))

(declare-fun b!885381 () Bool)

(assert (=> b!885381 (= e!492748 call!39080)))

(declare-fun b!885389 () Bool)

(assert (=> b!885389 (= e!492748 e!492747)))

(assert (=> b!885389 (= c!93271 (and ((_ is Cons!17644) (insertStrictlySorted!289 (t!24925 l!906) key1!49 v1!38)) (= (_1!5940 (h!18775 (insertStrictlySorted!289 (t!24925 l!906) key1!49 v1!38))) key1!49)))))

(declare-fun b!885390 () Bool)

(assert (=> b!885390 (= e!492747 call!39081)))

(assert (= (and d!109371 c!93270) b!885381))

(assert (= (and d!109371 (not c!93270)) b!885389))

(assert (= (and b!885389 c!93271) b!885390))

(assert (= (and b!885389 (not c!93271)) b!885387))

(assert (= (and b!885387 c!93268) b!885384))

(assert (= (and b!885387 (not c!93268)) b!885386))

(assert (= (or b!885384 b!885386) bm!39078))

(assert (= (or b!885390 bm!39078) bm!39077))

(assert (= (or b!885381 bm!39077) bm!39079))

(assert (= (and bm!39079 c!93269) b!885382))

(assert (= (and bm!39079 (not c!93269)) b!885385))

(assert (= (and d!109371 res!601324) b!885383))

(assert (= (and b!885383 res!601325) b!885388))

(declare-fun m!825613 () Bool)

(assert (=> b!885383 m!825613))

(declare-fun m!825615 () Bool)

(assert (=> d!109371 m!825615))

(assert (=> d!109371 m!825575))

(declare-fun m!825617 () Bool)

(assert (=> d!109371 m!825617))

(declare-fun m!825619 () Bool)

(assert (=> b!885382 m!825619))

(declare-fun m!825621 () Bool)

(assert (=> bm!39079 m!825621))

(declare-fun m!825623 () Bool)

(assert (=> b!885388 m!825623))

(assert (=> b!885315 d!109371))

(declare-fun e!492755 () List!17648)

(declare-fun b!885392 () Bool)

(assert (=> b!885392 (= e!492755 (insertStrictlySorted!289 (t!24925 (t!24925 l!906)) key1!49 v2!16))))

(declare-fun bm!39084 () Bool)

(declare-fun call!39088 () List!17648)

(declare-fun call!39087 () List!17648)

(assert (=> bm!39084 (= call!39088 call!39087)))

(declare-fun b!885393 () Bool)

(declare-fun res!601327 () Bool)

(declare-fun e!492756 () Bool)

(assert (=> b!885393 (=> (not res!601327) (not e!492756))))

(declare-fun lt!401016 () List!17648)

(assert (=> b!885393 (= res!601327 (containsKey!407 lt!401016 key1!49))))

(declare-fun bm!39085 () Bool)

(declare-fun call!39089 () List!17648)

(assert (=> bm!39085 (= call!39089 call!39088)))

(declare-fun b!885394 () Bool)

(declare-fun e!492754 () List!17648)

(assert (=> b!885394 (= e!492754 call!39089)))

(declare-fun c!93275 () Bool)

(declare-fun b!885395 () Bool)

(declare-fun c!93272 () Bool)

(assert (=> b!885395 (= e!492755 (ite c!93275 (t!24925 (t!24925 l!906)) (ite c!93272 (Cons!17644 (h!18775 (t!24925 l!906)) (t!24925 (t!24925 l!906))) Nil!17645)))))

(declare-fun b!885396 () Bool)

(assert (=> b!885396 (= e!492754 call!39089)))

(declare-fun b!885397 () Bool)

(assert (=> b!885397 (= c!93272 (and ((_ is Cons!17644) (t!24925 l!906)) (bvsgt (_1!5940 (h!18775 (t!24925 l!906))) key1!49)))))

(declare-fun e!492752 () List!17648)

(assert (=> b!885397 (= e!492752 e!492754)))

(declare-fun c!93274 () Bool)

(declare-fun bm!39086 () Bool)

(assert (=> bm!39086 (= call!39087 ($colon$colon!542 e!492755 (ite c!93274 (h!18775 (t!24925 l!906)) (tuple2!11859 key1!49 v2!16))))))

(declare-fun c!93273 () Bool)

(assert (=> bm!39086 (= c!93273 c!93274)))

(declare-fun b!885398 () Bool)

(assert (=> b!885398 (= e!492756 (contains!4290 lt!401016 (tuple2!11859 key1!49 v2!16)))))

(declare-fun d!109379 () Bool)

(assert (=> d!109379 e!492756))

(declare-fun res!601326 () Bool)

(assert (=> d!109379 (=> (not res!601326) (not e!492756))))

(assert (=> d!109379 (= res!601326 (isStrictlySorted!472 lt!401016))))

(declare-fun e!492753 () List!17648)

(assert (=> d!109379 (= lt!401016 e!492753)))

(assert (=> d!109379 (= c!93274 (and ((_ is Cons!17644) (t!24925 l!906)) (bvslt (_1!5940 (h!18775 (t!24925 l!906))) key1!49)))))

(assert (=> d!109379 (isStrictlySorted!472 (t!24925 l!906))))

(assert (=> d!109379 (= (insertStrictlySorted!289 (t!24925 l!906) key1!49 v2!16) lt!401016)))

(declare-fun b!885391 () Bool)

(assert (=> b!885391 (= e!492753 call!39087)))

(declare-fun b!885399 () Bool)

(assert (=> b!885399 (= e!492753 e!492752)))

(assert (=> b!885399 (= c!93275 (and ((_ is Cons!17644) (t!24925 l!906)) (= (_1!5940 (h!18775 (t!24925 l!906))) key1!49)))))

(declare-fun b!885400 () Bool)

(assert (=> b!885400 (= e!492752 call!39088)))

(assert (= (and d!109379 c!93274) b!885391))

(assert (= (and d!109379 (not c!93274)) b!885399))

(assert (= (and b!885399 c!93275) b!885400))

(assert (= (and b!885399 (not c!93275)) b!885397))

(assert (= (and b!885397 c!93272) b!885394))

(assert (= (and b!885397 (not c!93272)) b!885396))

(assert (= (or b!885394 b!885396) bm!39085))

(assert (= (or b!885400 bm!39085) bm!39084))

(assert (= (or b!885391 bm!39084) bm!39086))

(assert (= (and bm!39086 c!93273) b!885392))

(assert (= (and bm!39086 (not c!93273)) b!885395))

(assert (= (and d!109379 res!601326) b!885393))

(assert (= (and b!885393 res!601327) b!885398))

(declare-fun m!825625 () Bool)

(assert (=> b!885393 m!825625))

(declare-fun m!825627 () Bool)

(assert (=> d!109379 m!825627))

(assert (=> d!109379 m!825587))

(declare-fun m!825629 () Bool)

(assert (=> b!885392 m!825629))

(declare-fun m!825631 () Bool)

(assert (=> bm!39086 m!825631))

(declare-fun m!825633 () Bool)

(assert (=> b!885398 m!825633))

(assert (=> b!885315 d!109379))

(declare-fun e!492767 () List!17648)

(declare-fun b!885416 () Bool)

(assert (=> b!885416 (= e!492767 (insertStrictlySorted!289 (t!24925 (t!24925 l!906)) key1!49 v1!38))))

(declare-fun bm!39092 () Bool)

(declare-fun call!39096 () List!17648)

(declare-fun call!39095 () List!17648)

(assert (=> bm!39092 (= call!39096 call!39095)))

(declare-fun b!885417 () Bool)

(declare-fun res!601331 () Bool)

(declare-fun e!492768 () Bool)

(assert (=> b!885417 (=> (not res!601331) (not e!492768))))

(declare-fun lt!401018 () List!17648)

(assert (=> b!885417 (= res!601331 (containsKey!407 lt!401018 key1!49))))

(declare-fun bm!39093 () Bool)

(declare-fun call!39097 () List!17648)

(assert (=> bm!39093 (= call!39097 call!39096)))

(declare-fun b!885418 () Bool)

(declare-fun e!492766 () List!17648)

(assert (=> b!885418 (= e!492766 call!39097)))

(declare-fun c!93282 () Bool)

(declare-fun c!93285 () Bool)

(declare-fun b!885419 () Bool)

(assert (=> b!885419 (= e!492767 (ite c!93285 (t!24925 (t!24925 l!906)) (ite c!93282 (Cons!17644 (h!18775 (t!24925 l!906)) (t!24925 (t!24925 l!906))) Nil!17645)))))

(declare-fun b!885420 () Bool)

(assert (=> b!885420 (= e!492766 call!39097)))

(declare-fun b!885421 () Bool)

(assert (=> b!885421 (= c!93282 (and ((_ is Cons!17644) (t!24925 l!906)) (bvsgt (_1!5940 (h!18775 (t!24925 l!906))) key1!49)))))

(declare-fun e!492764 () List!17648)

(assert (=> b!885421 (= e!492764 e!492766)))

(declare-fun c!93284 () Bool)

(declare-fun bm!39094 () Bool)

(assert (=> bm!39094 (= call!39095 ($colon$colon!542 e!492767 (ite c!93284 (h!18775 (t!24925 l!906)) (tuple2!11859 key1!49 v1!38))))))

(declare-fun c!93283 () Bool)

(assert (=> bm!39094 (= c!93283 c!93284)))

(declare-fun b!885422 () Bool)

(assert (=> b!885422 (= e!492768 (contains!4290 lt!401018 (tuple2!11859 key1!49 v1!38)))))

(declare-fun d!109381 () Bool)

(assert (=> d!109381 e!492768))

(declare-fun res!601330 () Bool)

(assert (=> d!109381 (=> (not res!601330) (not e!492768))))

(assert (=> d!109381 (= res!601330 (isStrictlySorted!472 lt!401018))))

(declare-fun e!492765 () List!17648)

(assert (=> d!109381 (= lt!401018 e!492765)))

(assert (=> d!109381 (= c!93284 (and ((_ is Cons!17644) (t!24925 l!906)) (bvslt (_1!5940 (h!18775 (t!24925 l!906))) key1!49)))))

(assert (=> d!109381 (isStrictlySorted!472 (t!24925 l!906))))

(assert (=> d!109381 (= (insertStrictlySorted!289 (t!24925 l!906) key1!49 v1!38) lt!401018)))

(declare-fun b!885415 () Bool)

(assert (=> b!885415 (= e!492765 call!39095)))

(declare-fun b!885423 () Bool)

(assert (=> b!885423 (= e!492765 e!492764)))

(assert (=> b!885423 (= c!93285 (and ((_ is Cons!17644) (t!24925 l!906)) (= (_1!5940 (h!18775 (t!24925 l!906))) key1!49)))))

(declare-fun b!885424 () Bool)

(assert (=> b!885424 (= e!492764 call!39096)))

(assert (= (and d!109381 c!93284) b!885415))

(assert (= (and d!109381 (not c!93284)) b!885423))

(assert (= (and b!885423 c!93285) b!885424))

(assert (= (and b!885423 (not c!93285)) b!885421))

(assert (= (and b!885421 c!93282) b!885418))

(assert (= (and b!885421 (not c!93282)) b!885420))

(assert (= (or b!885418 b!885420) bm!39093))

(assert (= (or b!885424 bm!39093) bm!39092))

(assert (= (or b!885415 bm!39092) bm!39094))

(assert (= (and bm!39094 c!93283) b!885416))

(assert (= (and bm!39094 (not c!93283)) b!885419))

(assert (= (and d!109381 res!601330) b!885417))

(assert (= (and b!885417 res!601331) b!885422))

(declare-fun m!825643 () Bool)

(assert (=> b!885417 m!825643))

(declare-fun m!825645 () Bool)

(assert (=> d!109381 m!825645))

(assert (=> d!109381 m!825587))

(declare-fun m!825649 () Bool)

(assert (=> b!885416 m!825649))

(declare-fun m!825653 () Bool)

(assert (=> bm!39094 m!825653))

(declare-fun m!825655 () Bool)

(assert (=> b!885422 m!825655))

(assert (=> b!885315 d!109381))

(declare-fun e!492779 () List!17648)

(declare-fun b!885440 () Bool)

(assert (=> b!885440 (= e!492779 (insertStrictlySorted!289 (t!24925 l!906) key1!49 v1!38))))

(declare-fun bm!39098 () Bool)

(declare-fun call!39102 () List!17648)

(declare-fun call!39101 () List!17648)

(assert (=> bm!39098 (= call!39102 call!39101)))

(declare-fun b!885441 () Bool)

(declare-fun res!601339 () Bool)

(declare-fun e!492780 () Bool)

(assert (=> b!885441 (=> (not res!601339) (not e!492780))))

(declare-fun lt!401020 () List!17648)

(assert (=> b!885441 (= res!601339 (containsKey!407 lt!401020 key1!49))))

(declare-fun bm!39099 () Bool)

(declare-fun call!39103 () List!17648)

(assert (=> bm!39099 (= call!39103 call!39102)))

(declare-fun b!885442 () Bool)

(declare-fun e!492778 () List!17648)

(assert (=> b!885442 (= e!492778 call!39103)))

(declare-fun c!93293 () Bool)

(declare-fun b!885443 () Bool)

(declare-fun c!93290 () Bool)

(assert (=> b!885443 (= e!492779 (ite c!93293 (t!24925 l!906) (ite c!93290 (Cons!17644 (h!18775 l!906) (t!24925 l!906)) Nil!17645)))))

(declare-fun b!885444 () Bool)

(assert (=> b!885444 (= e!492778 call!39103)))

(declare-fun b!885445 () Bool)

(assert (=> b!885445 (= c!93290 (and ((_ is Cons!17644) l!906) (bvsgt (_1!5940 (h!18775 l!906)) key1!49)))))

(declare-fun e!492776 () List!17648)

(assert (=> b!885445 (= e!492776 e!492778)))

(declare-fun bm!39100 () Bool)

(declare-fun c!93292 () Bool)

(assert (=> bm!39100 (= call!39101 ($colon$colon!542 e!492779 (ite c!93292 (h!18775 l!906) (tuple2!11859 key1!49 v1!38))))))

(declare-fun c!93291 () Bool)

(assert (=> bm!39100 (= c!93291 c!93292)))

(declare-fun b!885446 () Bool)

(assert (=> b!885446 (= e!492780 (contains!4290 lt!401020 (tuple2!11859 key1!49 v1!38)))))

(declare-fun d!109385 () Bool)

(assert (=> d!109385 e!492780))

(declare-fun res!601338 () Bool)

(assert (=> d!109385 (=> (not res!601338) (not e!492780))))

(assert (=> d!109385 (= res!601338 (isStrictlySorted!472 lt!401020))))

(declare-fun e!492777 () List!17648)

(assert (=> d!109385 (= lt!401020 e!492777)))

(assert (=> d!109385 (= c!93292 (and ((_ is Cons!17644) l!906) (bvslt (_1!5940 (h!18775 l!906)) key1!49)))))

(assert (=> d!109385 (isStrictlySorted!472 l!906)))

(assert (=> d!109385 (= (insertStrictlySorted!289 l!906 key1!49 v1!38) lt!401020)))

(declare-fun b!885439 () Bool)

(assert (=> b!885439 (= e!492777 call!39101)))

(declare-fun b!885447 () Bool)

(assert (=> b!885447 (= e!492777 e!492776)))

(assert (=> b!885447 (= c!93293 (and ((_ is Cons!17644) l!906) (= (_1!5940 (h!18775 l!906)) key1!49)))))

(declare-fun b!885448 () Bool)

(assert (=> b!885448 (= e!492776 call!39102)))

(assert (= (and d!109385 c!93292) b!885439))

(assert (= (and d!109385 (not c!93292)) b!885447))

(assert (= (and b!885447 c!93293) b!885448))

(assert (= (and b!885447 (not c!93293)) b!885445))

(assert (= (and b!885445 c!93290) b!885442))

(assert (= (and b!885445 (not c!93290)) b!885444))

(assert (= (or b!885442 b!885444) bm!39099))

(assert (= (or b!885448 bm!39099) bm!39098))

(assert (= (or b!885439 bm!39098) bm!39100))

(assert (= (and bm!39100 c!93291) b!885440))

(assert (= (and bm!39100 (not c!93291)) b!885443))

(assert (= (and d!109385 res!601338) b!885441))

(assert (= (and b!885441 res!601339) b!885446))

(declare-fun m!825663 () Bool)

(assert (=> b!885441 m!825663))

(declare-fun m!825665 () Bool)

(assert (=> d!109385 m!825665))

(assert (=> d!109385 m!825589))

(assert (=> b!885440 m!825575))

(declare-fun m!825671 () Bool)

(assert (=> bm!39100 m!825671))

(declare-fun m!825673 () Bool)

(assert (=> b!885446 m!825673))

(assert (=> b!885315 d!109385))

(declare-fun d!109389 () Bool)

(declare-fun res!601352 () Bool)

(declare-fun e!492805 () Bool)

(assert (=> d!109389 (=> res!601352 e!492805)))

(assert (=> d!109389 (= res!601352 (or ((_ is Nil!17645) (insertStrictlySorted!289 l!906 key1!49 v1!38)) ((_ is Nil!17645) (t!24925 (insertStrictlySorted!289 l!906 key1!49 v1!38)))))))

(assert (=> d!109389 (= (isStrictlySorted!472 (insertStrictlySorted!289 l!906 key1!49 v1!38)) e!492805)))

(declare-fun b!885493 () Bool)

(declare-fun e!492806 () Bool)

(assert (=> b!885493 (= e!492805 e!492806)))

(declare-fun res!601353 () Bool)

(assert (=> b!885493 (=> (not res!601353) (not e!492806))))

(assert (=> b!885493 (= res!601353 (bvslt (_1!5940 (h!18775 (insertStrictlySorted!289 l!906 key1!49 v1!38))) (_1!5940 (h!18775 (t!24925 (insertStrictlySorted!289 l!906 key1!49 v1!38))))))))

(declare-fun b!885494 () Bool)

(assert (=> b!885494 (= e!492806 (isStrictlySorted!472 (t!24925 (insertStrictlySorted!289 l!906 key1!49 v1!38))))))

(assert (= (and d!109389 (not res!601352)) b!885493))

(assert (= (and b!885493 res!601353) b!885494))

(declare-fun m!825705 () Bool)

(assert (=> b!885494 m!825705))

(assert (=> b!885315 d!109389))

(declare-fun d!109397 () Bool)

(declare-fun res!601354 () Bool)

(declare-fun e!492807 () Bool)

(assert (=> d!109397 (=> res!601354 e!492807)))

(assert (=> d!109397 (= res!601354 (or ((_ is Nil!17645) l!906) ((_ is Nil!17645) (t!24925 l!906))))))

(assert (=> d!109397 (= (isStrictlySorted!472 l!906) e!492807)))

(declare-fun b!885495 () Bool)

(declare-fun e!492808 () Bool)

(assert (=> b!885495 (= e!492807 e!492808)))

(declare-fun res!601355 () Bool)

(assert (=> b!885495 (=> (not res!601355) (not e!492808))))

(assert (=> b!885495 (= res!601355 (bvslt (_1!5940 (h!18775 l!906)) (_1!5940 (h!18775 (t!24925 l!906)))))))

(declare-fun b!885496 () Bool)

(assert (=> b!885496 (= e!492808 (isStrictlySorted!472 (t!24925 l!906)))))

(assert (= (and d!109397 (not res!601354)) b!885495))

(assert (= (and b!885495 res!601355) b!885496))

(assert (=> b!885496 m!825587))

(assert (=> start!75096 d!109397))

(declare-fun d!109399 () Bool)

(declare-fun res!601356 () Bool)

(declare-fun e!492809 () Bool)

(assert (=> d!109399 (=> res!601356 e!492809)))

(assert (=> d!109399 (= res!601356 (or ((_ is Nil!17645) (t!24925 l!906)) ((_ is Nil!17645) (t!24925 (t!24925 l!906)))))))

(assert (=> d!109399 (= (isStrictlySorted!472 (t!24925 l!906)) e!492809)))

(declare-fun b!885497 () Bool)

(declare-fun e!492810 () Bool)

(assert (=> b!885497 (= e!492809 e!492810)))

(declare-fun res!601357 () Bool)

(assert (=> b!885497 (=> (not res!601357) (not e!492810))))

(assert (=> b!885497 (= res!601357 (bvslt (_1!5940 (h!18775 (t!24925 l!906))) (_1!5940 (h!18775 (t!24925 (t!24925 l!906))))))))

(declare-fun b!885498 () Bool)

(assert (=> b!885498 (= e!492810 (isStrictlySorted!472 (t!24925 (t!24925 l!906))))))

(assert (= (and d!109399 (not res!601356)) b!885497))

(assert (= (and b!885497 res!601357) b!885498))

(declare-fun m!825717 () Bool)

(assert (=> b!885498 m!825717))

(assert (=> b!885314 d!109399))

(declare-fun b!885517 () Bool)

(declare-fun e!492822 () Bool)

(declare-fun tp!54257 () Bool)

(assert (=> b!885517 (= e!492822 (and tp_is_empty!17763 tp!54257))))

(assert (=> b!885316 (= tp!54251 e!492822)))

(assert (= (and b!885316 ((_ is Cons!17644) (t!24925 l!906))) b!885517))

(check-sat (not b!885382) (not b!885517) (not bm!39094) (not b!885393) (not d!109379) (not d!109381) (not b!885446) (not b!885398) (not bm!39100) (not b!885422) tp_is_empty!17763 (not b!885417) (not b!885416) (not b!885496) (not d!109385) (not b!885388) (not b!885441) (not d!109367) (not bm!39086) (not b!885494) (not d!109371) (not b!885383) (not bm!39079) (not b!885440) (not b!885498) (not b!885392))
(check-sat)
