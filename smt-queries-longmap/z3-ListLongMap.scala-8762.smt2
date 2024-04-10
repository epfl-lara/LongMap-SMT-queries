; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106398 () Bool)

(assert start!106398)

(declare-datatypes ((B!1966 0))(
  ( (B!1967 (val!16318 Int)) )
))
(declare-datatypes ((tuple2!21154 0))(
  ( (tuple2!21155 (_1!10588 (_ BitVec 64)) (_2!10588 B!1966)) )
))
(declare-datatypes ((List!28310 0))(
  ( (Nil!28307) (Cons!28306 (h!29515 tuple2!21154) (t!41831 List!28310)) )
))
(declare-fun l!706 () List!28310)

(declare-fun b!1265349 () Bool)

(declare-fun v1!26 () B!1966)

(declare-fun e!720590 () Bool)

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun isStrictlySorted!785 (List!28310) Bool)

(declare-fun insertStrictlySorted!463 (List!28310 (_ BitVec 64) B!1966) List!28310)

(assert (=> b!1265349 (= e!720590 (not (isStrictlySorted!785 (insertStrictlySorted!463 l!706 key1!31 v1!26))))))

(declare-fun res!842520 () Bool)

(assert (=> start!106398 (=> (not res!842520) (not e!720590))))

(assert (=> start!106398 (= res!842520 (isStrictlySorted!785 l!706))))

(assert (=> start!106398 e!720590))

(declare-fun e!720589 () Bool)

(assert (=> start!106398 e!720589))

(assert (=> start!106398 true))

(declare-fun tp_is_empty!32499 () Bool)

(assert (=> start!106398 tp_is_empty!32499))

(declare-fun b!1265350 () Bool)

(declare-fun tp!96323 () Bool)

(assert (=> b!1265350 (= e!720589 (and tp_is_empty!32499 tp!96323))))

(declare-fun b!1265347 () Bool)

(declare-fun res!842521 () Bool)

(assert (=> b!1265347 (=> (not res!842521) (not e!720590))))

(declare-fun containsKey!644 (List!28310 (_ BitVec 64)) Bool)

(assert (=> b!1265347 (= res!842521 (not (containsKey!644 l!706 key1!31)))))

(declare-fun b!1265348 () Bool)

(declare-fun res!842519 () Bool)

(assert (=> b!1265348 (=> (not res!842519) (not e!720590))))

(get-info :version)

(assert (=> b!1265348 (= res!842519 (not ((_ is Cons!28306) l!706)))))

(assert (= (and start!106398 res!842520) b!1265347))

(assert (= (and b!1265347 res!842521) b!1265348))

(assert (= (and b!1265348 res!842519) b!1265349))

(assert (= (and start!106398 ((_ is Cons!28306) l!706)) b!1265350))

(declare-fun m!1165583 () Bool)

(assert (=> b!1265349 m!1165583))

(assert (=> b!1265349 m!1165583))

(declare-fun m!1165585 () Bool)

(assert (=> b!1265349 m!1165585))

(declare-fun m!1165587 () Bool)

(assert (=> start!106398 m!1165587))

(declare-fun m!1165589 () Bool)

(assert (=> b!1265347 m!1165589))

(check-sat (not b!1265349) (not b!1265347) tp_is_empty!32499 (not start!106398) (not b!1265350))
(check-sat)
(get-model)

(declare-fun d!138901 () Bool)

(declare-fun res!842545 () Bool)

(declare-fun e!720611 () Bool)

(assert (=> d!138901 (=> res!842545 e!720611)))

(assert (=> d!138901 (= res!842545 (and ((_ is Cons!28306) l!706) (= (_1!10588 (h!29515 l!706)) key1!31)))))

(assert (=> d!138901 (= (containsKey!644 l!706 key1!31) e!720611)))

(declare-fun b!1265377 () Bool)

(declare-fun e!720612 () Bool)

(assert (=> b!1265377 (= e!720611 e!720612)))

(declare-fun res!842546 () Bool)

(assert (=> b!1265377 (=> (not res!842546) (not e!720612))))

(assert (=> b!1265377 (= res!842546 (and (or (not ((_ is Cons!28306) l!706)) (bvsle (_1!10588 (h!29515 l!706)) key1!31)) ((_ is Cons!28306) l!706) (bvslt (_1!10588 (h!29515 l!706)) key1!31)))))

(declare-fun b!1265378 () Bool)

(assert (=> b!1265378 (= e!720612 (containsKey!644 (t!41831 l!706) key1!31))))

(assert (= (and d!138901 (not res!842545)) b!1265377))

(assert (= (and b!1265377 res!842546) b!1265378))

(declare-fun m!1165601 () Bool)

(assert (=> b!1265378 m!1165601))

(assert (=> b!1265347 d!138901))

(declare-fun d!138909 () Bool)

(declare-fun res!842557 () Bool)

(declare-fun e!720623 () Bool)

(assert (=> d!138909 (=> res!842557 e!720623)))

(assert (=> d!138909 (= res!842557 (or ((_ is Nil!28307) (insertStrictlySorted!463 l!706 key1!31 v1!26)) ((_ is Nil!28307) (t!41831 (insertStrictlySorted!463 l!706 key1!31 v1!26)))))))

(assert (=> d!138909 (= (isStrictlySorted!785 (insertStrictlySorted!463 l!706 key1!31 v1!26)) e!720623)))

(declare-fun b!1265389 () Bool)

(declare-fun e!720624 () Bool)

(assert (=> b!1265389 (= e!720623 e!720624)))

(declare-fun res!842558 () Bool)

(assert (=> b!1265389 (=> (not res!842558) (not e!720624))))

(assert (=> b!1265389 (= res!842558 (bvslt (_1!10588 (h!29515 (insertStrictlySorted!463 l!706 key1!31 v1!26))) (_1!10588 (h!29515 (t!41831 (insertStrictlySorted!463 l!706 key1!31 v1!26))))))))

(declare-fun b!1265390 () Bool)

(assert (=> b!1265390 (= e!720624 (isStrictlySorted!785 (t!41831 (insertStrictlySorted!463 l!706 key1!31 v1!26))))))

(assert (= (and d!138909 (not res!842557)) b!1265389))

(assert (= (and b!1265389 res!842558) b!1265390))

(declare-fun m!1165605 () Bool)

(assert (=> b!1265390 m!1165605))

(assert (=> b!1265349 d!138909))

(declare-fun c!123313 () Bool)

(declare-fun call!62417 () List!28310)

(declare-fun bm!62414 () Bool)

(declare-fun e!720667 () List!28310)

(declare-fun $colon$colon!639 (List!28310 tuple2!21154) List!28310)

(assert (=> bm!62414 (= call!62417 ($colon$colon!639 e!720667 (ite c!123313 (h!29515 l!706) (tuple2!21155 key1!31 v1!26))))))

(declare-fun c!123315 () Bool)

(assert (=> bm!62414 (= c!123315 c!123313)))

(declare-fun bm!62415 () Bool)

(declare-fun call!62418 () List!28310)

(declare-fun call!62419 () List!28310)

(assert (=> bm!62415 (= call!62418 call!62419)))

(declare-fun b!1265467 () Bool)

(declare-fun e!720668 () List!28310)

(declare-fun e!720666 () List!28310)

(assert (=> b!1265467 (= e!720668 e!720666)))

(declare-fun c!123314 () Bool)

(assert (=> b!1265467 (= c!123314 (and ((_ is Cons!28306) l!706) (= (_1!10588 (h!29515 l!706)) key1!31)))))

(declare-fun bm!62416 () Bool)

(assert (=> bm!62416 (= call!62419 call!62417)))

(declare-fun b!1265468 () Bool)

(declare-fun e!720670 () List!28310)

(assert (=> b!1265468 (= e!720670 call!62418)))

(declare-fun b!1265469 () Bool)

(assert (=> b!1265469 (= e!720667 (insertStrictlySorted!463 (t!41831 l!706) key1!31 v1!26))))

(declare-fun b!1265470 () Bool)

(assert (=> b!1265470 (= e!720670 call!62418)))

(declare-fun c!123312 () Bool)

(declare-fun b!1265471 () Bool)

(assert (=> b!1265471 (= e!720667 (ite c!123314 (t!41831 l!706) (ite c!123312 (Cons!28306 (h!29515 l!706) (t!41831 l!706)) Nil!28307)))))

(declare-fun b!1265473 () Bool)

(assert (=> b!1265473 (= e!720668 call!62417)))

(declare-fun b!1265474 () Bool)

(assert (=> b!1265474 (= e!720666 call!62419)))

(declare-fun e!720669 () Bool)

(declare-fun lt!574049 () List!28310)

(declare-fun b!1265475 () Bool)

(declare-fun contains!7637 (List!28310 tuple2!21154) Bool)

(assert (=> b!1265475 (= e!720669 (contains!7637 lt!574049 (tuple2!21155 key1!31 v1!26)))))

(declare-fun b!1265476 () Bool)

(assert (=> b!1265476 (= c!123312 (and ((_ is Cons!28306) l!706) (bvsgt (_1!10588 (h!29515 l!706)) key1!31)))))

(assert (=> b!1265476 (= e!720666 e!720670)))

(declare-fun d!138913 () Bool)

(assert (=> d!138913 e!720669))

(declare-fun res!842580 () Bool)

(assert (=> d!138913 (=> (not res!842580) (not e!720669))))

(assert (=> d!138913 (= res!842580 (isStrictlySorted!785 lt!574049))))

(assert (=> d!138913 (= lt!574049 e!720668)))

(assert (=> d!138913 (= c!123313 (and ((_ is Cons!28306) l!706) (bvslt (_1!10588 (h!29515 l!706)) key1!31)))))

(assert (=> d!138913 (isStrictlySorted!785 l!706)))

(assert (=> d!138913 (= (insertStrictlySorted!463 l!706 key1!31 v1!26) lt!574049)))

(declare-fun b!1265472 () Bool)

(declare-fun res!842579 () Bool)

(assert (=> b!1265472 (=> (not res!842579) (not e!720669))))

(assert (=> b!1265472 (= res!842579 (containsKey!644 lt!574049 key1!31))))

(assert (= (and d!138913 c!123313) b!1265473))

(assert (= (and d!138913 (not c!123313)) b!1265467))

(assert (= (and b!1265467 c!123314) b!1265474))

(assert (= (and b!1265467 (not c!123314)) b!1265476))

(assert (= (and b!1265476 c!123312) b!1265468))

(assert (= (and b!1265476 (not c!123312)) b!1265470))

(assert (= (or b!1265468 b!1265470) bm!62415))

(assert (= (or b!1265474 bm!62415) bm!62416))

(assert (= (or b!1265473 bm!62416) bm!62414))

(assert (= (and bm!62414 c!123315) b!1265469))

(assert (= (and bm!62414 (not c!123315)) b!1265471))

(assert (= (and d!138913 res!842580) b!1265472))

(assert (= (and b!1265472 res!842579) b!1265475))

(declare-fun m!1165621 () Bool)

(assert (=> b!1265469 m!1165621))

(declare-fun m!1165623 () Bool)

(assert (=> b!1265475 m!1165623))

(declare-fun m!1165625 () Bool)

(assert (=> d!138913 m!1165625))

(assert (=> d!138913 m!1165587))

(declare-fun m!1165629 () Bool)

(assert (=> b!1265472 m!1165629))

(declare-fun m!1165633 () Bool)

(assert (=> bm!62414 m!1165633))

(assert (=> b!1265349 d!138913))

(declare-fun d!138921 () Bool)

(declare-fun res!842585 () Bool)

(declare-fun e!720678 () Bool)

(assert (=> d!138921 (=> res!842585 e!720678)))

(assert (=> d!138921 (= res!842585 (or ((_ is Nil!28307) l!706) ((_ is Nil!28307) (t!41831 l!706))))))

(assert (=> d!138921 (= (isStrictlySorted!785 l!706) e!720678)))

(declare-fun b!1265489 () Bool)

(declare-fun e!720679 () Bool)

(assert (=> b!1265489 (= e!720678 e!720679)))

(declare-fun res!842586 () Bool)

(assert (=> b!1265489 (=> (not res!842586) (not e!720679))))

(assert (=> b!1265489 (= res!842586 (bvslt (_1!10588 (h!29515 l!706)) (_1!10588 (h!29515 (t!41831 l!706)))))))

(declare-fun b!1265490 () Bool)

(assert (=> b!1265490 (= e!720679 (isStrictlySorted!785 (t!41831 l!706)))))

(assert (= (and d!138921 (not res!842585)) b!1265489))

(assert (= (and b!1265489 res!842586) b!1265490))

(declare-fun m!1165641 () Bool)

(assert (=> b!1265490 m!1165641))

(assert (=> start!106398 d!138921))

(declare-fun b!1265507 () Bool)

(declare-fun e!720690 () Bool)

(declare-fun tp!96333 () Bool)

(assert (=> b!1265507 (= e!720690 (and tp_is_empty!32499 tp!96333))))

(assert (=> b!1265350 (= tp!96323 e!720690)))

(assert (= (and b!1265350 ((_ is Cons!28306) (t!41831 l!706))) b!1265507))

(check-sat (not b!1265472) (not b!1265475) (not b!1265469) (not b!1265378) (not b!1265490) (not d!138913) (not b!1265507) tp_is_empty!32499 (not b!1265390) (not bm!62414))
(check-sat)
