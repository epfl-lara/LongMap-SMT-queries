; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138558 () Bool)

(assert start!138558)

(declare-fun res!1083375 () Bool)

(declare-fun e!886296 () Bool)

(assert (=> start!138558 (=> (not res!1083375) (not e!886296))))

(declare-datatypes ((B!2930 0))(
  ( (B!2931 (val!19827 Int)) )
))
(declare-datatypes ((tuple2!25882 0))(
  ( (tuple2!25883 (_1!12952 (_ BitVec 64)) (_2!12952 B!2930)) )
))
(declare-datatypes ((List!36979 0))(
  ( (Nil!36976) (Cons!36975 (h!38536 tuple2!25882) (t!51887 List!36979)) )
))
(declare-fun l!1251 () List!36979)

(declare-fun isStrictlySorted!1160 (List!36979) Bool)

(assert (=> start!138558 (= res!1083375 (isStrictlySorted!1160 l!1251))))

(assert (=> start!138558 e!886296))

(declare-fun e!886297 () Bool)

(assert (=> start!138558 e!886297))

(assert (=> start!138558 true))

(declare-fun tp_is_empty!39463 () Bool)

(assert (=> start!138558 tp_is_empty!39463))

(declare-fun b!1587328 () Bool)

(declare-fun tp!115141 () Bool)

(assert (=> b!1587328 (= e!886297 (and tp_is_empty!39463 tp!115141))))

(declare-fun b!1587327 () Bool)

(declare-fun newValue!123 () B!2930)

(declare-fun newKey!123 () (_ BitVec 64))

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-fun containsKey!1007 (List!36979 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!630 (List!36979 (_ BitVec 64) B!2930) List!36979)

(assert (=> b!1587327 (= e!886296 (containsKey!1007 (insertStrictlySorted!630 l!1251 newKey!123 newValue!123) otherKey!56))))

(declare-fun b!1587326 () Bool)

(declare-fun res!1083377 () Bool)

(assert (=> b!1587326 (=> (not res!1083377) (not e!886296))))

(get-info :version)

(assert (=> b!1587326 (= res!1083377 (and (not (= otherKey!56 newKey!123)) (not ((_ is Cons!36975) l!1251))))))

(declare-fun b!1587325 () Bool)

(declare-fun res!1083376 () Bool)

(assert (=> b!1587325 (=> (not res!1083376) (not e!886296))))

(assert (=> b!1587325 (= res!1083376 (not (containsKey!1007 l!1251 otherKey!56)))))

(assert (= (and start!138558 res!1083375) b!1587325))

(assert (= (and b!1587325 res!1083376) b!1587326))

(assert (= (and b!1587326 res!1083377) b!1587327))

(assert (= (and start!138558 ((_ is Cons!36975) l!1251)) b!1587328))

(declare-fun m!1456279 () Bool)

(assert (=> start!138558 m!1456279))

(declare-fun m!1456281 () Bool)

(assert (=> b!1587327 m!1456281))

(assert (=> b!1587327 m!1456281))

(declare-fun m!1456283 () Bool)

(assert (=> b!1587327 m!1456283))

(declare-fun m!1456285 () Bool)

(assert (=> b!1587325 m!1456285))

(check-sat (not b!1587328) (not b!1587325) (not start!138558) (not b!1587327) tp_is_empty!39463)
(check-sat)
(get-model)

(declare-fun d!168281 () Bool)

(declare-fun res!1083400 () Bool)

(declare-fun e!886314 () Bool)

(assert (=> d!168281 (=> res!1083400 e!886314)))

(assert (=> d!168281 (= res!1083400 (or ((_ is Nil!36976) l!1251) ((_ is Nil!36976) (t!51887 l!1251))))))

(assert (=> d!168281 (= (isStrictlySorted!1160 l!1251) e!886314)))

(declare-fun b!1587357 () Bool)

(declare-fun e!886315 () Bool)

(assert (=> b!1587357 (= e!886314 e!886315)))

(declare-fun res!1083401 () Bool)

(assert (=> b!1587357 (=> (not res!1083401) (not e!886315))))

(assert (=> b!1587357 (= res!1083401 (bvslt (_1!12952 (h!38536 l!1251)) (_1!12952 (h!38536 (t!51887 l!1251)))))))

(declare-fun b!1587358 () Bool)

(assert (=> b!1587358 (= e!886315 (isStrictlySorted!1160 (t!51887 l!1251)))))

(assert (= (and d!168281 (not res!1083400)) b!1587357))

(assert (= (and b!1587357 res!1083401) b!1587358))

(declare-fun m!1456303 () Bool)

(assert (=> b!1587358 m!1456303))

(assert (=> start!138558 d!168281))

(declare-fun d!168283 () Bool)

(declare-fun res!1083406 () Bool)

(declare-fun e!886320 () Bool)

(assert (=> d!168283 (=> res!1083406 e!886320)))

(assert (=> d!168283 (= res!1083406 (and ((_ is Cons!36975) (insertStrictlySorted!630 l!1251 newKey!123 newValue!123)) (= (_1!12952 (h!38536 (insertStrictlySorted!630 l!1251 newKey!123 newValue!123))) otherKey!56)))))

(assert (=> d!168283 (= (containsKey!1007 (insertStrictlySorted!630 l!1251 newKey!123 newValue!123) otherKey!56) e!886320)))

(declare-fun b!1587363 () Bool)

(declare-fun e!886321 () Bool)

(assert (=> b!1587363 (= e!886320 e!886321)))

(declare-fun res!1083407 () Bool)

(assert (=> b!1587363 (=> (not res!1083407) (not e!886321))))

(assert (=> b!1587363 (= res!1083407 (and (or (not ((_ is Cons!36975) (insertStrictlySorted!630 l!1251 newKey!123 newValue!123))) (bvsle (_1!12952 (h!38536 (insertStrictlySorted!630 l!1251 newKey!123 newValue!123))) otherKey!56)) ((_ is Cons!36975) (insertStrictlySorted!630 l!1251 newKey!123 newValue!123)) (bvslt (_1!12952 (h!38536 (insertStrictlySorted!630 l!1251 newKey!123 newValue!123))) otherKey!56)))))

(declare-fun b!1587364 () Bool)

(assert (=> b!1587364 (= e!886321 (containsKey!1007 (t!51887 (insertStrictlySorted!630 l!1251 newKey!123 newValue!123)) otherKey!56))))

(assert (= (and d!168283 (not res!1083406)) b!1587363))

(assert (= (and b!1587363 res!1083407) b!1587364))

(declare-fun m!1456305 () Bool)

(assert (=> b!1587364 m!1456305))

(assert (=> b!1587327 d!168283))

(declare-fun d!168287 () Bool)

(declare-fun e!886358 () Bool)

(assert (=> d!168287 e!886358))

(declare-fun res!1083439 () Bool)

(assert (=> d!168287 (=> (not res!1083439) (not e!886358))))

(declare-fun lt!678208 () List!36979)

(assert (=> d!168287 (= res!1083439 (isStrictlySorted!1160 lt!678208))))

(declare-fun e!886359 () List!36979)

(assert (=> d!168287 (= lt!678208 e!886359)))

(declare-fun c!147725 () Bool)

(assert (=> d!168287 (= c!147725 (and ((_ is Cons!36975) l!1251) (bvslt (_1!12952 (h!38536 l!1251)) newKey!123)))))

(assert (=> d!168287 (isStrictlySorted!1160 l!1251)))

(assert (=> d!168287 (= (insertStrictlySorted!630 l!1251 newKey!123 newValue!123) lt!678208)))

(declare-fun b!1587411 () Bool)

(declare-fun c!147727 () Bool)

(assert (=> b!1587411 (= c!147727 (and ((_ is Cons!36975) l!1251) (bvsgt (_1!12952 (h!38536 l!1251)) newKey!123)))))

(declare-fun e!886360 () List!36979)

(declare-fun e!886361 () List!36979)

(assert (=> b!1587411 (= e!886360 e!886361)))

(declare-fun call!72743 () List!36979)

(declare-fun bm!72738 () Bool)

(declare-fun e!886362 () List!36979)

(declare-fun $colon$colon!1019 (List!36979 tuple2!25882) List!36979)

(assert (=> bm!72738 (= call!72743 ($colon$colon!1019 e!886362 (ite c!147725 (h!38536 l!1251) (tuple2!25883 newKey!123 newValue!123))))))

(declare-fun c!147726 () Bool)

(assert (=> bm!72738 (= c!147726 c!147725)))

(declare-fun b!1587412 () Bool)

(declare-fun call!72741 () List!36979)

(assert (=> b!1587412 (= e!886361 call!72741)))

(declare-fun b!1587413 () Bool)

(assert (=> b!1587413 (= e!886359 e!886360)))

(declare-fun c!147728 () Bool)

(assert (=> b!1587413 (= c!147728 (and ((_ is Cons!36975) l!1251) (= (_1!12952 (h!38536 l!1251)) newKey!123)))))

(declare-fun bm!72739 () Bool)

(declare-fun call!72742 () List!36979)

(assert (=> bm!72739 (= call!72742 call!72743)))

(declare-fun b!1587414 () Bool)

(assert (=> b!1587414 (= e!886362 (ite c!147728 (t!51887 l!1251) (ite c!147727 (Cons!36975 (h!38536 l!1251) (t!51887 l!1251)) Nil!36976)))))

(declare-fun b!1587415 () Bool)

(declare-fun contains!10574 (List!36979 tuple2!25882) Bool)

(assert (=> b!1587415 (= e!886358 (contains!10574 lt!678208 (tuple2!25883 newKey!123 newValue!123)))))

(declare-fun b!1587416 () Bool)

(assert (=> b!1587416 (= e!886360 call!72742)))

(declare-fun b!1587417 () Bool)

(assert (=> b!1587417 (= e!886361 call!72741)))

(declare-fun b!1587418 () Bool)

(declare-fun res!1083438 () Bool)

(assert (=> b!1587418 (=> (not res!1083438) (not e!886358))))

(assert (=> b!1587418 (= res!1083438 (containsKey!1007 lt!678208 newKey!123))))

(declare-fun b!1587419 () Bool)

(assert (=> b!1587419 (= e!886362 (insertStrictlySorted!630 (t!51887 l!1251) newKey!123 newValue!123))))

(declare-fun b!1587420 () Bool)

(assert (=> b!1587420 (= e!886359 call!72743)))

(declare-fun bm!72740 () Bool)

(assert (=> bm!72740 (= call!72741 call!72742)))

(assert (= (and d!168287 c!147725) b!1587420))

(assert (= (and d!168287 (not c!147725)) b!1587413))

(assert (= (and b!1587413 c!147728) b!1587416))

(assert (= (and b!1587413 (not c!147728)) b!1587411))

(assert (= (and b!1587411 c!147727) b!1587412))

(assert (= (and b!1587411 (not c!147727)) b!1587417))

(assert (= (or b!1587412 b!1587417) bm!72740))

(assert (= (or b!1587416 bm!72740) bm!72739))

(assert (= (or b!1587420 bm!72739) bm!72738))

(assert (= (and bm!72738 c!147726) b!1587419))

(assert (= (and bm!72738 (not c!147726)) b!1587414))

(assert (= (and d!168287 res!1083439) b!1587418))

(assert (= (and b!1587418 res!1083438) b!1587415))

(declare-fun m!1456317 () Bool)

(assert (=> b!1587418 m!1456317))

(declare-fun m!1456319 () Bool)

(assert (=> d!168287 m!1456319))

(assert (=> d!168287 m!1456279))

(declare-fun m!1456321 () Bool)

(assert (=> bm!72738 m!1456321))

(declare-fun m!1456323 () Bool)

(assert (=> b!1587419 m!1456323))

(declare-fun m!1456325 () Bool)

(assert (=> b!1587415 m!1456325))

(assert (=> b!1587327 d!168287))

(declare-fun d!168301 () Bool)

(declare-fun res!1083440 () Bool)

(declare-fun e!886363 () Bool)

(assert (=> d!168301 (=> res!1083440 e!886363)))

(assert (=> d!168301 (= res!1083440 (and ((_ is Cons!36975) l!1251) (= (_1!12952 (h!38536 l!1251)) otherKey!56)))))

(assert (=> d!168301 (= (containsKey!1007 l!1251 otherKey!56) e!886363)))

(declare-fun b!1587421 () Bool)

(declare-fun e!886364 () Bool)

(assert (=> b!1587421 (= e!886363 e!886364)))

(declare-fun res!1083441 () Bool)

(assert (=> b!1587421 (=> (not res!1083441) (not e!886364))))

(assert (=> b!1587421 (= res!1083441 (and (or (not ((_ is Cons!36975) l!1251)) (bvsle (_1!12952 (h!38536 l!1251)) otherKey!56)) ((_ is Cons!36975) l!1251) (bvslt (_1!12952 (h!38536 l!1251)) otherKey!56)))))

(declare-fun b!1587422 () Bool)

(assert (=> b!1587422 (= e!886364 (containsKey!1007 (t!51887 l!1251) otherKey!56))))

(assert (= (and d!168301 (not res!1083440)) b!1587421))

(assert (= (and b!1587421 res!1083441) b!1587422))

(declare-fun m!1456327 () Bool)

(assert (=> b!1587422 m!1456327))

(assert (=> b!1587325 d!168301))

(declare-fun b!1587427 () Bool)

(declare-fun e!886367 () Bool)

(declare-fun tp!115150 () Bool)

(assert (=> b!1587427 (= e!886367 (and tp_is_empty!39463 tp!115150))))

(assert (=> b!1587328 (= tp!115141 e!886367)))

(assert (= (and b!1587328 ((_ is Cons!36975) (t!51887 l!1251))) b!1587427))

(check-sat (not b!1587364) (not b!1587418) (not bm!72738) (not b!1587422) (not b!1587419) tp_is_empty!39463 (not d!168287) (not b!1587415) (not b!1587427) (not b!1587358))
(check-sat)
(get-model)

(declare-fun lt!678220 () Bool)

(declare-fun d!168309 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!849 (List!36979) (InoxSet tuple2!25882))

(assert (=> d!168309 (= lt!678220 (select (content!849 lt!678208) (tuple2!25883 newKey!123 newValue!123)))))

(declare-fun e!886425 () Bool)

(assert (=> d!168309 (= lt!678220 e!886425)))

(declare-fun res!1083473 () Bool)

(assert (=> d!168309 (=> (not res!1083473) (not e!886425))))

(assert (=> d!168309 (= res!1083473 ((_ is Cons!36975) lt!678208))))

(assert (=> d!168309 (= (contains!10574 lt!678208 (tuple2!25883 newKey!123 newValue!123)) lt!678220)))

(declare-fun b!1587524 () Bool)

(declare-fun e!886426 () Bool)

(assert (=> b!1587524 (= e!886425 e!886426)))

(declare-fun res!1083472 () Bool)

(assert (=> b!1587524 (=> res!1083472 e!886426)))

(assert (=> b!1587524 (= res!1083472 (= (h!38536 lt!678208) (tuple2!25883 newKey!123 newValue!123)))))

(declare-fun b!1587525 () Bool)

(assert (=> b!1587525 (= e!886426 (contains!10574 (t!51887 lt!678208) (tuple2!25883 newKey!123 newValue!123)))))

(assert (= (and d!168309 res!1083473) b!1587524))

(assert (= (and b!1587524 (not res!1083472)) b!1587525))

(declare-fun m!1456367 () Bool)

(assert (=> d!168309 m!1456367))

(declare-fun m!1456369 () Bool)

(assert (=> d!168309 m!1456369))

(declare-fun m!1456371 () Bool)

(assert (=> b!1587525 m!1456371))

(assert (=> b!1587415 d!168309))

(declare-fun d!168319 () Bool)

(declare-fun res!1083474 () Bool)

(declare-fun e!886427 () Bool)

(assert (=> d!168319 (=> res!1083474 e!886427)))

(assert (=> d!168319 (= res!1083474 (or ((_ is Nil!36976) lt!678208) ((_ is Nil!36976) (t!51887 lt!678208))))))

(assert (=> d!168319 (= (isStrictlySorted!1160 lt!678208) e!886427)))

(declare-fun b!1587526 () Bool)

(declare-fun e!886428 () Bool)

(assert (=> b!1587526 (= e!886427 e!886428)))

(declare-fun res!1083475 () Bool)

(assert (=> b!1587526 (=> (not res!1083475) (not e!886428))))

(assert (=> b!1587526 (= res!1083475 (bvslt (_1!12952 (h!38536 lt!678208)) (_1!12952 (h!38536 (t!51887 lt!678208)))))))

(declare-fun b!1587527 () Bool)

(assert (=> b!1587527 (= e!886428 (isStrictlySorted!1160 (t!51887 lt!678208)))))

(assert (= (and d!168319 (not res!1083474)) b!1587526))

(assert (= (and b!1587526 res!1083475) b!1587527))

(declare-fun m!1456373 () Bool)

(assert (=> b!1587527 m!1456373))

(assert (=> d!168287 d!168319))

(assert (=> d!168287 d!168281))

(declare-fun d!168321 () Bool)

(declare-fun res!1083478 () Bool)

(declare-fun e!886431 () Bool)

(assert (=> d!168321 (=> res!1083478 e!886431)))

(assert (=> d!168321 (= res!1083478 (or ((_ is Nil!36976) (t!51887 l!1251)) ((_ is Nil!36976) (t!51887 (t!51887 l!1251)))))))

(assert (=> d!168321 (= (isStrictlySorted!1160 (t!51887 l!1251)) e!886431)))

(declare-fun b!1587530 () Bool)

(declare-fun e!886432 () Bool)

(assert (=> b!1587530 (= e!886431 e!886432)))

(declare-fun res!1083479 () Bool)

(assert (=> b!1587530 (=> (not res!1083479) (not e!886432))))

(assert (=> b!1587530 (= res!1083479 (bvslt (_1!12952 (h!38536 (t!51887 l!1251))) (_1!12952 (h!38536 (t!51887 (t!51887 l!1251))))))))

(declare-fun b!1587531 () Bool)

(assert (=> b!1587531 (= e!886432 (isStrictlySorted!1160 (t!51887 (t!51887 l!1251))))))

(assert (= (and d!168321 (not res!1083478)) b!1587530))

(assert (= (and b!1587530 res!1083479) b!1587531))

(declare-fun m!1456381 () Bool)

(assert (=> b!1587531 m!1456381))

(assert (=> b!1587358 d!168321))

(declare-fun d!168327 () Bool)

(assert (=> d!168327 (= ($colon$colon!1019 e!886362 (ite c!147725 (h!38536 l!1251) (tuple2!25883 newKey!123 newValue!123))) (Cons!36975 (ite c!147725 (h!38536 l!1251) (tuple2!25883 newKey!123 newValue!123)) e!886362))))

(assert (=> bm!72738 d!168327))

(declare-fun d!168329 () Bool)

(declare-fun e!886438 () Bool)

(assert (=> d!168329 e!886438))

(declare-fun res!1083485 () Bool)

(assert (=> d!168329 (=> (not res!1083485) (not e!886438))))

(declare-fun lt!678222 () List!36979)

(assert (=> d!168329 (= res!1083485 (isStrictlySorted!1160 lt!678222))))

(declare-fun e!886439 () List!36979)

(assert (=> d!168329 (= lt!678222 e!886439)))

(declare-fun c!147757 () Bool)

(assert (=> d!168329 (= c!147757 (and ((_ is Cons!36975) (t!51887 l!1251)) (bvslt (_1!12952 (h!38536 (t!51887 l!1251))) newKey!123)))))

(assert (=> d!168329 (isStrictlySorted!1160 (t!51887 l!1251))))

(assert (=> d!168329 (= (insertStrictlySorted!630 (t!51887 l!1251) newKey!123 newValue!123) lt!678222)))

(declare-fun b!1587537 () Bool)

(declare-fun c!147759 () Bool)

(assert (=> b!1587537 (= c!147759 (and ((_ is Cons!36975) (t!51887 l!1251)) (bvsgt (_1!12952 (h!38536 (t!51887 l!1251))) newKey!123)))))

(declare-fun e!886440 () List!36979)

(declare-fun e!886441 () List!36979)

(assert (=> b!1587537 (= e!886440 e!886441)))

(declare-fun bm!72762 () Bool)

(declare-fun e!886442 () List!36979)

(declare-fun call!72767 () List!36979)

(assert (=> bm!72762 (= call!72767 ($colon$colon!1019 e!886442 (ite c!147757 (h!38536 (t!51887 l!1251)) (tuple2!25883 newKey!123 newValue!123))))))

(declare-fun c!147758 () Bool)

(assert (=> bm!72762 (= c!147758 c!147757)))

(declare-fun b!1587538 () Bool)

(declare-fun call!72765 () List!36979)

(assert (=> b!1587538 (= e!886441 call!72765)))

(declare-fun b!1587539 () Bool)

(assert (=> b!1587539 (= e!886439 e!886440)))

(declare-fun c!147760 () Bool)

(assert (=> b!1587539 (= c!147760 (and ((_ is Cons!36975) (t!51887 l!1251)) (= (_1!12952 (h!38536 (t!51887 l!1251))) newKey!123)))))

(declare-fun bm!72763 () Bool)

(declare-fun call!72766 () List!36979)

(assert (=> bm!72763 (= call!72766 call!72767)))

(declare-fun b!1587540 () Bool)

(assert (=> b!1587540 (= e!886442 (ite c!147760 (t!51887 (t!51887 l!1251)) (ite c!147759 (Cons!36975 (h!38536 (t!51887 l!1251)) (t!51887 (t!51887 l!1251))) Nil!36976)))))

(declare-fun b!1587541 () Bool)

(assert (=> b!1587541 (= e!886438 (contains!10574 lt!678222 (tuple2!25883 newKey!123 newValue!123)))))

(declare-fun b!1587542 () Bool)

(assert (=> b!1587542 (= e!886440 call!72766)))

(declare-fun b!1587543 () Bool)

(assert (=> b!1587543 (= e!886441 call!72765)))

(declare-fun b!1587544 () Bool)

(declare-fun res!1083484 () Bool)

(assert (=> b!1587544 (=> (not res!1083484) (not e!886438))))

(assert (=> b!1587544 (= res!1083484 (containsKey!1007 lt!678222 newKey!123))))

(declare-fun b!1587545 () Bool)

(assert (=> b!1587545 (= e!886442 (insertStrictlySorted!630 (t!51887 (t!51887 l!1251)) newKey!123 newValue!123))))

(declare-fun b!1587546 () Bool)

(assert (=> b!1587546 (= e!886439 call!72767)))

(declare-fun bm!72764 () Bool)

(assert (=> bm!72764 (= call!72765 call!72766)))

(assert (= (and d!168329 c!147757) b!1587546))

(assert (= (and d!168329 (not c!147757)) b!1587539))

(assert (= (and b!1587539 c!147760) b!1587542))

(assert (= (and b!1587539 (not c!147760)) b!1587537))

(assert (= (and b!1587537 c!147759) b!1587538))

(assert (= (and b!1587537 (not c!147759)) b!1587543))

(assert (= (or b!1587538 b!1587543) bm!72764))

(assert (= (or b!1587542 bm!72764) bm!72763))

(assert (= (or b!1587546 bm!72763) bm!72762))

(assert (= (and bm!72762 c!147758) b!1587545))

(assert (= (and bm!72762 (not c!147758)) b!1587540))

(assert (= (and d!168329 res!1083485) b!1587544))

(assert (= (and b!1587544 res!1083484) b!1587541))

(declare-fun m!1456387 () Bool)

(assert (=> b!1587544 m!1456387))

(declare-fun m!1456389 () Bool)

(assert (=> d!168329 m!1456389))

(assert (=> d!168329 m!1456303))

(declare-fun m!1456391 () Bool)

(assert (=> bm!72762 m!1456391))

(declare-fun m!1456393 () Bool)

(assert (=> b!1587545 m!1456393))

(declare-fun m!1456395 () Bool)

(assert (=> b!1587541 m!1456395))

(assert (=> b!1587419 d!168329))

(declare-fun d!168331 () Bool)

(declare-fun res!1083486 () Bool)

(declare-fun e!886443 () Bool)

(assert (=> d!168331 (=> res!1083486 e!886443)))

(assert (=> d!168331 (= res!1083486 (and ((_ is Cons!36975) (t!51887 l!1251)) (= (_1!12952 (h!38536 (t!51887 l!1251))) otherKey!56)))))

(assert (=> d!168331 (= (containsKey!1007 (t!51887 l!1251) otherKey!56) e!886443)))

(declare-fun b!1587547 () Bool)

(declare-fun e!886444 () Bool)

(assert (=> b!1587547 (= e!886443 e!886444)))

(declare-fun res!1083487 () Bool)

(assert (=> b!1587547 (=> (not res!1083487) (not e!886444))))

(assert (=> b!1587547 (= res!1083487 (and (or (not ((_ is Cons!36975) (t!51887 l!1251))) (bvsle (_1!12952 (h!38536 (t!51887 l!1251))) otherKey!56)) ((_ is Cons!36975) (t!51887 l!1251)) (bvslt (_1!12952 (h!38536 (t!51887 l!1251))) otherKey!56)))))

(declare-fun b!1587548 () Bool)

(assert (=> b!1587548 (= e!886444 (containsKey!1007 (t!51887 (t!51887 l!1251)) otherKey!56))))

(assert (= (and d!168331 (not res!1083486)) b!1587547))

(assert (= (and b!1587547 res!1083487) b!1587548))

(declare-fun m!1456397 () Bool)

(assert (=> b!1587548 m!1456397))

(assert (=> b!1587422 d!168331))

(declare-fun d!168333 () Bool)

(declare-fun res!1083488 () Bool)

(declare-fun e!886445 () Bool)

(assert (=> d!168333 (=> res!1083488 e!886445)))

(assert (=> d!168333 (= res!1083488 (and ((_ is Cons!36975) lt!678208) (= (_1!12952 (h!38536 lt!678208)) newKey!123)))))

(assert (=> d!168333 (= (containsKey!1007 lt!678208 newKey!123) e!886445)))

(declare-fun b!1587549 () Bool)

(declare-fun e!886446 () Bool)

(assert (=> b!1587549 (= e!886445 e!886446)))

(declare-fun res!1083489 () Bool)

(assert (=> b!1587549 (=> (not res!1083489) (not e!886446))))

(assert (=> b!1587549 (= res!1083489 (and (or (not ((_ is Cons!36975) lt!678208)) (bvsle (_1!12952 (h!38536 lt!678208)) newKey!123)) ((_ is Cons!36975) lt!678208) (bvslt (_1!12952 (h!38536 lt!678208)) newKey!123)))))

(declare-fun b!1587550 () Bool)

(assert (=> b!1587550 (= e!886446 (containsKey!1007 (t!51887 lt!678208) newKey!123))))

(assert (= (and d!168333 (not res!1083488)) b!1587549))

(assert (= (and b!1587549 res!1083489) b!1587550))

(declare-fun m!1456399 () Bool)

(assert (=> b!1587550 m!1456399))

(assert (=> b!1587418 d!168333))

(declare-fun d!168335 () Bool)

(declare-fun res!1083490 () Bool)

(declare-fun e!886447 () Bool)

(assert (=> d!168335 (=> res!1083490 e!886447)))

(assert (=> d!168335 (= res!1083490 (and ((_ is Cons!36975) (t!51887 (insertStrictlySorted!630 l!1251 newKey!123 newValue!123))) (= (_1!12952 (h!38536 (t!51887 (insertStrictlySorted!630 l!1251 newKey!123 newValue!123)))) otherKey!56)))))

(assert (=> d!168335 (= (containsKey!1007 (t!51887 (insertStrictlySorted!630 l!1251 newKey!123 newValue!123)) otherKey!56) e!886447)))

(declare-fun b!1587551 () Bool)

(declare-fun e!886448 () Bool)

(assert (=> b!1587551 (= e!886447 e!886448)))

(declare-fun res!1083491 () Bool)

(assert (=> b!1587551 (=> (not res!1083491) (not e!886448))))

(assert (=> b!1587551 (= res!1083491 (and (or (not ((_ is Cons!36975) (t!51887 (insertStrictlySorted!630 l!1251 newKey!123 newValue!123)))) (bvsle (_1!12952 (h!38536 (t!51887 (insertStrictlySorted!630 l!1251 newKey!123 newValue!123)))) otherKey!56)) ((_ is Cons!36975) (t!51887 (insertStrictlySorted!630 l!1251 newKey!123 newValue!123))) (bvslt (_1!12952 (h!38536 (t!51887 (insertStrictlySorted!630 l!1251 newKey!123 newValue!123)))) otherKey!56)))))

(declare-fun b!1587552 () Bool)

(assert (=> b!1587552 (= e!886448 (containsKey!1007 (t!51887 (t!51887 (insertStrictlySorted!630 l!1251 newKey!123 newValue!123))) otherKey!56))))

(assert (= (and d!168335 (not res!1083490)) b!1587551))

(assert (= (and b!1587551 res!1083491) b!1587552))

(declare-fun m!1456401 () Bool)

(assert (=> b!1587552 m!1456401))

(assert (=> b!1587364 d!168335))

(declare-fun b!1587553 () Bool)

(declare-fun e!886449 () Bool)

(declare-fun tp!115158 () Bool)

(assert (=> b!1587553 (= e!886449 (and tp_is_empty!39463 tp!115158))))

(assert (=> b!1587427 (= tp!115150 e!886449)))

(assert (= (and b!1587427 ((_ is Cons!36975) (t!51887 (t!51887 l!1251)))) b!1587553))

(check-sat (not b!1587531) (not b!1587544) (not b!1587548) (not b!1587553) (not b!1587545) (not b!1587541) (not b!1587550) (not d!168329) (not b!1587552) (not b!1587525) (not bm!72762) (not b!1587527) (not d!168309) tp_is_empty!39463)
(check-sat)
