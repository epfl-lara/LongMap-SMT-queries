; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134280 () Bool)

(assert start!134280)

(declare-fun b!1568326 () Bool)

(declare-fun res!1072168 () Bool)

(declare-fun e!874267 () Bool)

(assert (=> b!1568326 (=> (not res!1072168) (not e!874267))))

(declare-datatypes ((B!2480 0))(
  ( (B!2481 (val!19602 Int)) )
))
(declare-datatypes ((tuple2!25374 0))(
  ( (tuple2!25375 (_1!12698 (_ BitVec 64)) (_2!12698 B!2480)) )
))
(declare-datatypes ((List!36763 0))(
  ( (Nil!36760) (Cons!36759 (h!38207 tuple2!25374) (t!51663 List!36763)) )
))
(declare-fun l!750 () List!36763)

(declare-fun isStrictlySorted!993 (List!36763) Bool)

(assert (=> b!1568326 (= res!1072168 (isStrictlySorted!993 l!750))))

(declare-fun b!1568327 () Bool)

(declare-fun res!1072167 () Bool)

(assert (=> b!1568327 (=> (not res!1072167) (not e!874267))))

(assert (=> b!1568327 (= res!1072167 (isStrictlySorted!993 (t!51663 l!750)))))

(declare-fun b!1568328 () Bool)

(declare-fun e!874268 () Bool)

(declare-fun tp_is_empty!39031 () Bool)

(declare-fun tp!114049 () Bool)

(assert (=> b!1568328 (= e!874268 (and tp_is_empty!39031 tp!114049))))

(declare-fun res!1072170 () Bool)

(assert (=> start!134280 (=> (not res!1072170) (not e!874267))))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun key2!21 () (_ BitVec 64))

(assert (=> start!134280 (= res!1072170 (not (= key1!37 key2!21)))))

(assert (=> start!134280 e!874267))

(assert (=> start!134280 tp_is_empty!39031))

(assert (=> start!134280 e!874268))

(assert (=> start!134280 true))

(declare-fun v1!32 () B!2480)

(declare-fun b!1568329 () Bool)

(declare-fun insertStrictlySorted!582 (List!36763 (_ BitVec 64) B!2480) List!36763)

(assert (=> b!1568329 (= e!874267 (not (isStrictlySorted!993 (insertStrictlySorted!582 l!750 key1!37 v1!32))))))

(declare-fun v2!10 () B!2480)

(assert (=> b!1568329 (= (insertStrictlySorted!582 (insertStrictlySorted!582 (t!51663 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!582 (insertStrictlySorted!582 (t!51663 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-datatypes ((Unit!51887 0))(
  ( (Unit!51888) )
))
(declare-fun lt!672927 () Unit!51887)

(declare-fun lemmaInsertStrictlySortedCommutative!7 (List!36763 (_ BitVec 64) B!2480 (_ BitVec 64) B!2480) Unit!51887)

(assert (=> b!1568329 (= lt!672927 (lemmaInsertStrictlySortedCommutative!7 (t!51663 l!750) key1!37 v1!32 key2!21 v2!10))))

(declare-fun b!1568330 () Bool)

(declare-fun res!1072169 () Bool)

(assert (=> b!1568330 (=> (not res!1072169) (not e!874267))))

(get-info :version)

(assert (=> b!1568330 (= res!1072169 (and ((_ is Cons!36759) l!750) (bvslt (_1!12698 (h!38207 l!750)) key1!37) (bvslt (_1!12698 (h!38207 l!750)) key2!21)))))

(assert (= (and start!134280 res!1072170) b!1568326))

(assert (= (and b!1568326 res!1072168) b!1568330))

(assert (= (and b!1568330 res!1072169) b!1568327))

(assert (= (and b!1568327 res!1072167) b!1568329))

(assert (= (and start!134280 ((_ is Cons!36759) l!750)) b!1568328))

(declare-fun m!1442349 () Bool)

(assert (=> b!1568326 m!1442349))

(declare-fun m!1442351 () Bool)

(assert (=> b!1568327 m!1442351))

(declare-fun m!1442353 () Bool)

(assert (=> b!1568329 m!1442353))

(assert (=> b!1568329 m!1442353))

(declare-fun m!1442355 () Bool)

(assert (=> b!1568329 m!1442355))

(declare-fun m!1442357 () Bool)

(assert (=> b!1568329 m!1442357))

(declare-fun m!1442359 () Bool)

(assert (=> b!1568329 m!1442359))

(assert (=> b!1568329 m!1442357))

(declare-fun m!1442361 () Bool)

(assert (=> b!1568329 m!1442361))

(declare-fun m!1442363 () Bool)

(assert (=> b!1568329 m!1442363))

(assert (=> b!1568329 m!1442363))

(declare-fun m!1442365 () Bool)

(assert (=> b!1568329 m!1442365))

(check-sat (not b!1568329) (not b!1568327) (not b!1568328) (not b!1568326) tp_is_empty!39031)
(check-sat)
(get-model)

(declare-fun d!163505 () Bool)

(assert (=> d!163505 (= (insertStrictlySorted!582 (insertStrictlySorted!582 (t!51663 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!582 (insertStrictlySorted!582 (t!51663 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-fun lt!672936 () Unit!51887)

(declare-fun choose!2087 (List!36763 (_ BitVec 64) B!2480 (_ BitVec 64) B!2480) Unit!51887)

(assert (=> d!163505 (= lt!672936 (choose!2087 (t!51663 l!750) key1!37 v1!32 key2!21 v2!10))))

(assert (=> d!163505 (not (= key1!37 key2!21))))

(assert (=> d!163505 (= (lemmaInsertStrictlySortedCommutative!7 (t!51663 l!750) key1!37 v1!32 key2!21 v2!10) lt!672936)))

(declare-fun bs!45141 () Bool)

(assert (= bs!45141 d!163505))

(declare-fun m!1442403 () Bool)

(assert (=> bs!45141 m!1442403))

(assert (=> bs!45141 m!1442357))

(assert (=> bs!45141 m!1442353))

(assert (=> bs!45141 m!1442355))

(assert (=> bs!45141 m!1442357))

(assert (=> bs!45141 m!1442359))

(assert (=> bs!45141 m!1442353))

(assert (=> b!1568329 d!163505))

(declare-fun d!163509 () Bool)

(declare-fun res!1072207 () Bool)

(declare-fun e!874293 () Bool)

(assert (=> d!163509 (=> res!1072207 e!874293)))

(assert (=> d!163509 (= res!1072207 (or ((_ is Nil!36760) (insertStrictlySorted!582 l!750 key1!37 v1!32)) ((_ is Nil!36760) (t!51663 (insertStrictlySorted!582 l!750 key1!37 v1!32)))))))

(assert (=> d!163509 (= (isStrictlySorted!993 (insertStrictlySorted!582 l!750 key1!37 v1!32)) e!874293)))

(declare-fun b!1568373 () Bool)

(declare-fun e!874294 () Bool)

(assert (=> b!1568373 (= e!874293 e!874294)))

(declare-fun res!1072208 () Bool)

(assert (=> b!1568373 (=> (not res!1072208) (not e!874294))))

(assert (=> b!1568373 (= res!1072208 (bvslt (_1!12698 (h!38207 (insertStrictlySorted!582 l!750 key1!37 v1!32))) (_1!12698 (h!38207 (t!51663 (insertStrictlySorted!582 l!750 key1!37 v1!32))))))))

(declare-fun b!1568374 () Bool)

(assert (=> b!1568374 (= e!874294 (isStrictlySorted!993 (t!51663 (insertStrictlySorted!582 l!750 key1!37 v1!32))))))

(assert (= (and d!163509 (not res!1072207)) b!1568373))

(assert (= (and b!1568373 res!1072208) b!1568374))

(declare-fun m!1442407 () Bool)

(assert (=> b!1568374 m!1442407))

(assert (=> b!1568329 d!163509))

(declare-fun c!144461 () Bool)

(declare-fun e!874326 () List!36763)

(declare-fun b!1568419 () Bool)

(declare-fun c!144462 () Bool)

(assert (=> b!1568419 (= e!874326 (ite c!144462 (t!51663 l!750) (ite c!144461 (Cons!36759 (h!38207 l!750) (t!51663 l!750)) Nil!36760)))))

(declare-fun e!874323 () Bool)

(declare-fun b!1568420 () Bool)

(declare-fun lt!672947 () List!36763)

(declare-fun contains!10370 (List!36763 tuple2!25374) Bool)

(assert (=> b!1568420 (= e!874323 (contains!10370 lt!672947 (tuple2!25375 key1!37 v1!32)))))

(declare-fun b!1568421 () Bool)

(assert (=> b!1568421 (= e!874326 (insertStrictlySorted!582 (t!51663 l!750) key1!37 v1!32))))

(declare-fun bm!71912 () Bool)

(declare-fun call!71915 () List!36763)

(declare-fun call!71916 () List!36763)

(assert (=> bm!71912 (= call!71915 call!71916)))

(declare-fun c!144460 () Bool)

(declare-fun bm!71913 () Bool)

(declare-fun $colon$colon!990 (List!36763 tuple2!25374) List!36763)

(assert (=> bm!71913 (= call!71916 ($colon$colon!990 e!874326 (ite c!144460 (h!38207 l!750) (tuple2!25375 key1!37 v1!32))))))

(declare-fun c!144463 () Bool)

(assert (=> bm!71913 (= c!144463 c!144460)))

(declare-fun b!1568422 () Bool)

(declare-fun e!874325 () List!36763)

(assert (=> b!1568422 (= e!874325 call!71916)))

(declare-fun d!163515 () Bool)

(assert (=> d!163515 e!874323))

(declare-fun res!1072226 () Bool)

(assert (=> d!163515 (=> (not res!1072226) (not e!874323))))

(assert (=> d!163515 (= res!1072226 (isStrictlySorted!993 lt!672947))))

(assert (=> d!163515 (= lt!672947 e!874325)))

(assert (=> d!163515 (= c!144460 (and ((_ is Cons!36759) l!750) (bvslt (_1!12698 (h!38207 l!750)) key1!37)))))

(assert (=> d!163515 (isStrictlySorted!993 l!750)))

(assert (=> d!163515 (= (insertStrictlySorted!582 l!750 key1!37 v1!32) lt!672947)))

(declare-fun b!1568423 () Bool)

(declare-fun res!1072225 () Bool)

(assert (=> b!1568423 (=> (not res!1072225) (not e!874323))))

(declare-fun containsKey!854 (List!36763 (_ BitVec 64)) Bool)

(assert (=> b!1568423 (= res!1072225 (containsKey!854 lt!672947 key1!37))))

(declare-fun b!1568424 () Bool)

(declare-fun e!874324 () List!36763)

(declare-fun call!71917 () List!36763)

(assert (=> b!1568424 (= e!874324 call!71917)))

(declare-fun bm!71914 () Bool)

(assert (=> bm!71914 (= call!71917 call!71915)))

(declare-fun b!1568425 () Bool)

(assert (=> b!1568425 (= c!144461 (and ((_ is Cons!36759) l!750) (bvsgt (_1!12698 (h!38207 l!750)) key1!37)))))

(declare-fun e!874327 () List!36763)

(assert (=> b!1568425 (= e!874327 e!874324)))

(declare-fun b!1568426 () Bool)

(assert (=> b!1568426 (= e!874324 call!71917)))

(declare-fun b!1568427 () Bool)

(assert (=> b!1568427 (= e!874325 e!874327)))

(assert (=> b!1568427 (= c!144462 (and ((_ is Cons!36759) l!750) (= (_1!12698 (h!38207 l!750)) key1!37)))))

(declare-fun b!1568428 () Bool)

(assert (=> b!1568428 (= e!874327 call!71915)))

(assert (= (and d!163515 c!144460) b!1568422))

(assert (= (and d!163515 (not c!144460)) b!1568427))

(assert (= (and b!1568427 c!144462) b!1568428))

(assert (= (and b!1568427 (not c!144462)) b!1568425))

(assert (= (and b!1568425 c!144461) b!1568426))

(assert (= (and b!1568425 (not c!144461)) b!1568424))

(assert (= (or b!1568426 b!1568424) bm!71914))

(assert (= (or b!1568428 bm!71914) bm!71912))

(assert (= (or b!1568422 bm!71912) bm!71913))

(assert (= (and bm!71913 c!144463) b!1568421))

(assert (= (and bm!71913 (not c!144463)) b!1568419))

(assert (= (and d!163515 res!1072226) b!1568423))

(assert (= (and b!1568423 res!1072225) b!1568420))

(declare-fun m!1442419 () Bool)

(assert (=> bm!71913 m!1442419))

(declare-fun m!1442421 () Bool)

(assert (=> b!1568420 m!1442421))

(assert (=> b!1568421 m!1442357))

(declare-fun m!1442423 () Bool)

(assert (=> b!1568423 m!1442423))

(declare-fun m!1442425 () Bool)

(assert (=> d!163515 m!1442425))

(assert (=> d!163515 m!1442349))

(assert (=> b!1568329 d!163515))

(declare-fun c!144468 () Bool)

(declare-fun b!1568433 () Bool)

(declare-fun e!874333 () List!36763)

(declare-fun c!144467 () Bool)

(assert (=> b!1568433 (= e!874333 (ite c!144468 (t!51663 (insertStrictlySorted!582 (t!51663 l!750) key1!37 v1!32)) (ite c!144467 (Cons!36759 (h!38207 (insertStrictlySorted!582 (t!51663 l!750) key1!37 v1!32)) (t!51663 (insertStrictlySorted!582 (t!51663 l!750) key1!37 v1!32))) Nil!36760)))))

(declare-fun e!874330 () Bool)

(declare-fun lt!672948 () List!36763)

(declare-fun b!1568434 () Bool)

(assert (=> b!1568434 (= e!874330 (contains!10370 lt!672948 (tuple2!25375 key2!21 v2!10)))))

(declare-fun b!1568435 () Bool)

(assert (=> b!1568435 (= e!874333 (insertStrictlySorted!582 (t!51663 (insertStrictlySorted!582 (t!51663 l!750) key1!37 v1!32)) key2!21 v2!10))))

(declare-fun bm!71917 () Bool)

(declare-fun call!71920 () List!36763)

(declare-fun call!71921 () List!36763)

(assert (=> bm!71917 (= call!71920 call!71921)))

(declare-fun bm!71918 () Bool)

(declare-fun c!144466 () Bool)

(assert (=> bm!71918 (= call!71921 ($colon$colon!990 e!874333 (ite c!144466 (h!38207 (insertStrictlySorted!582 (t!51663 l!750) key1!37 v1!32)) (tuple2!25375 key2!21 v2!10))))))

(declare-fun c!144469 () Bool)

(assert (=> bm!71918 (= c!144469 c!144466)))

(declare-fun b!1568436 () Bool)

(declare-fun e!874332 () List!36763)

(assert (=> b!1568436 (= e!874332 call!71921)))

(declare-fun d!163531 () Bool)

(assert (=> d!163531 e!874330))

(declare-fun res!1072228 () Bool)

(assert (=> d!163531 (=> (not res!1072228) (not e!874330))))

(assert (=> d!163531 (= res!1072228 (isStrictlySorted!993 lt!672948))))

(assert (=> d!163531 (= lt!672948 e!874332)))

(assert (=> d!163531 (= c!144466 (and ((_ is Cons!36759) (insertStrictlySorted!582 (t!51663 l!750) key1!37 v1!32)) (bvslt (_1!12698 (h!38207 (insertStrictlySorted!582 (t!51663 l!750) key1!37 v1!32))) key2!21)))))

(assert (=> d!163531 (isStrictlySorted!993 (insertStrictlySorted!582 (t!51663 l!750) key1!37 v1!32))))

(assert (=> d!163531 (= (insertStrictlySorted!582 (insertStrictlySorted!582 (t!51663 l!750) key1!37 v1!32) key2!21 v2!10) lt!672948)))

(declare-fun b!1568437 () Bool)

(declare-fun res!1072227 () Bool)

(assert (=> b!1568437 (=> (not res!1072227) (not e!874330))))

(assert (=> b!1568437 (= res!1072227 (containsKey!854 lt!672948 key2!21))))

(declare-fun b!1568438 () Bool)

(declare-fun e!874331 () List!36763)

(declare-fun call!71922 () List!36763)

(assert (=> b!1568438 (= e!874331 call!71922)))

(declare-fun bm!71919 () Bool)

(assert (=> bm!71919 (= call!71922 call!71920)))

(declare-fun b!1568439 () Bool)

(assert (=> b!1568439 (= c!144467 (and ((_ is Cons!36759) (insertStrictlySorted!582 (t!51663 l!750) key1!37 v1!32)) (bvsgt (_1!12698 (h!38207 (insertStrictlySorted!582 (t!51663 l!750) key1!37 v1!32))) key2!21)))))

(declare-fun e!874334 () List!36763)

(assert (=> b!1568439 (= e!874334 e!874331)))

(declare-fun b!1568440 () Bool)

(assert (=> b!1568440 (= e!874331 call!71922)))

(declare-fun b!1568441 () Bool)

(assert (=> b!1568441 (= e!874332 e!874334)))

(assert (=> b!1568441 (= c!144468 (and ((_ is Cons!36759) (insertStrictlySorted!582 (t!51663 l!750) key1!37 v1!32)) (= (_1!12698 (h!38207 (insertStrictlySorted!582 (t!51663 l!750) key1!37 v1!32))) key2!21)))))

(declare-fun b!1568442 () Bool)

(assert (=> b!1568442 (= e!874334 call!71920)))

(assert (= (and d!163531 c!144466) b!1568436))

(assert (= (and d!163531 (not c!144466)) b!1568441))

(assert (= (and b!1568441 c!144468) b!1568442))

(assert (= (and b!1568441 (not c!144468)) b!1568439))

(assert (= (and b!1568439 c!144467) b!1568440))

(assert (= (and b!1568439 (not c!144467)) b!1568438))

(assert (= (or b!1568440 b!1568438) bm!71919))

(assert (= (or b!1568442 bm!71919) bm!71917))

(assert (= (or b!1568436 bm!71917) bm!71918))

(assert (= (and bm!71918 c!144469) b!1568435))

(assert (= (and bm!71918 (not c!144469)) b!1568433))

(assert (= (and d!163531 res!1072228) b!1568437))

(assert (= (and b!1568437 res!1072227) b!1568434))

(declare-fun m!1442427 () Bool)

(assert (=> bm!71918 m!1442427))

(declare-fun m!1442429 () Bool)

(assert (=> b!1568434 m!1442429))

(declare-fun m!1442431 () Bool)

(assert (=> b!1568435 m!1442431))

(declare-fun m!1442433 () Bool)

(assert (=> b!1568437 m!1442433))

(declare-fun m!1442435 () Bool)

(assert (=> d!163531 m!1442435))

(assert (=> d!163531 m!1442357))

(declare-fun m!1442437 () Bool)

(assert (=> d!163531 m!1442437))

(assert (=> b!1568329 d!163531))

(declare-fun c!144471 () Bool)

(declare-fun e!874340 () List!36763)

(declare-fun c!144472 () Bool)

(declare-fun b!1568447 () Bool)

(assert (=> b!1568447 (= e!874340 (ite c!144472 (t!51663 (t!51663 l!750)) (ite c!144471 (Cons!36759 (h!38207 (t!51663 l!750)) (t!51663 (t!51663 l!750))) Nil!36760)))))

(declare-fun b!1568448 () Bool)

(declare-fun lt!672949 () List!36763)

(declare-fun e!874337 () Bool)

(assert (=> b!1568448 (= e!874337 (contains!10370 lt!672949 (tuple2!25375 key2!21 v2!10)))))

(declare-fun b!1568449 () Bool)

(assert (=> b!1568449 (= e!874340 (insertStrictlySorted!582 (t!51663 (t!51663 l!750)) key2!21 v2!10))))

(declare-fun bm!71920 () Bool)

(declare-fun call!71923 () List!36763)

(declare-fun call!71924 () List!36763)

(assert (=> bm!71920 (= call!71923 call!71924)))

(declare-fun c!144470 () Bool)

(declare-fun bm!71921 () Bool)

(assert (=> bm!71921 (= call!71924 ($colon$colon!990 e!874340 (ite c!144470 (h!38207 (t!51663 l!750)) (tuple2!25375 key2!21 v2!10))))))

(declare-fun c!144473 () Bool)

(assert (=> bm!71921 (= c!144473 c!144470)))

(declare-fun b!1568450 () Bool)

(declare-fun e!874339 () List!36763)

(assert (=> b!1568450 (= e!874339 call!71924)))

(declare-fun d!163533 () Bool)

(assert (=> d!163533 e!874337))

(declare-fun res!1072234 () Bool)

(assert (=> d!163533 (=> (not res!1072234) (not e!874337))))

(assert (=> d!163533 (= res!1072234 (isStrictlySorted!993 lt!672949))))

(assert (=> d!163533 (= lt!672949 e!874339)))

(assert (=> d!163533 (= c!144470 (and ((_ is Cons!36759) (t!51663 l!750)) (bvslt (_1!12698 (h!38207 (t!51663 l!750))) key2!21)))))

(assert (=> d!163533 (isStrictlySorted!993 (t!51663 l!750))))

(assert (=> d!163533 (= (insertStrictlySorted!582 (t!51663 l!750) key2!21 v2!10) lt!672949)))

(declare-fun b!1568451 () Bool)

(declare-fun res!1072233 () Bool)

(assert (=> b!1568451 (=> (not res!1072233) (not e!874337))))

(assert (=> b!1568451 (= res!1072233 (containsKey!854 lt!672949 key2!21))))

(declare-fun b!1568452 () Bool)

(declare-fun e!874338 () List!36763)

(declare-fun call!71925 () List!36763)

(assert (=> b!1568452 (= e!874338 call!71925)))

(declare-fun bm!71922 () Bool)

(assert (=> bm!71922 (= call!71925 call!71923)))

(declare-fun b!1568453 () Bool)

(assert (=> b!1568453 (= c!144471 (and ((_ is Cons!36759) (t!51663 l!750)) (bvsgt (_1!12698 (h!38207 (t!51663 l!750))) key2!21)))))

(declare-fun e!874341 () List!36763)

(assert (=> b!1568453 (= e!874341 e!874338)))

(declare-fun b!1568454 () Bool)

(assert (=> b!1568454 (= e!874338 call!71925)))

(declare-fun b!1568455 () Bool)

(assert (=> b!1568455 (= e!874339 e!874341)))

(assert (=> b!1568455 (= c!144472 (and ((_ is Cons!36759) (t!51663 l!750)) (= (_1!12698 (h!38207 (t!51663 l!750))) key2!21)))))

(declare-fun b!1568456 () Bool)

(assert (=> b!1568456 (= e!874341 call!71923)))

(assert (= (and d!163533 c!144470) b!1568450))

(assert (= (and d!163533 (not c!144470)) b!1568455))

(assert (= (and b!1568455 c!144472) b!1568456))

(assert (= (and b!1568455 (not c!144472)) b!1568453))

(assert (= (and b!1568453 c!144471) b!1568454))

(assert (= (and b!1568453 (not c!144471)) b!1568452))

(assert (= (or b!1568454 b!1568452) bm!71922))

(assert (= (or b!1568456 bm!71922) bm!71920))

(assert (= (or b!1568450 bm!71920) bm!71921))

(assert (= (and bm!71921 c!144473) b!1568449))

(assert (= (and bm!71921 (not c!144473)) b!1568447))

(assert (= (and d!163533 res!1072234) b!1568451))

(assert (= (and b!1568451 res!1072233) b!1568448))

(declare-fun m!1442439 () Bool)

(assert (=> bm!71921 m!1442439))

(declare-fun m!1442441 () Bool)

(assert (=> b!1568448 m!1442441))

(declare-fun m!1442443 () Bool)

(assert (=> b!1568449 m!1442443))

(declare-fun m!1442445 () Bool)

(assert (=> b!1568451 m!1442445))

(declare-fun m!1442447 () Bool)

(assert (=> d!163533 m!1442447))

(assert (=> d!163533 m!1442351))

(assert (=> b!1568329 d!163533))

(declare-fun b!1568457 () Bool)

(declare-fun c!144475 () Bool)

(declare-fun e!874345 () List!36763)

(declare-fun c!144476 () Bool)

(assert (=> b!1568457 (= e!874345 (ite c!144476 (t!51663 (insertStrictlySorted!582 (t!51663 l!750) key2!21 v2!10)) (ite c!144475 (Cons!36759 (h!38207 (insertStrictlySorted!582 (t!51663 l!750) key2!21 v2!10)) (t!51663 (insertStrictlySorted!582 (t!51663 l!750) key2!21 v2!10))) Nil!36760)))))

(declare-fun e!874342 () Bool)

(declare-fun b!1568458 () Bool)

(declare-fun lt!672950 () List!36763)

(assert (=> b!1568458 (= e!874342 (contains!10370 lt!672950 (tuple2!25375 key1!37 v1!32)))))

(declare-fun b!1568459 () Bool)

(assert (=> b!1568459 (= e!874345 (insertStrictlySorted!582 (t!51663 (insertStrictlySorted!582 (t!51663 l!750) key2!21 v2!10)) key1!37 v1!32))))

(declare-fun bm!71923 () Bool)

(declare-fun call!71926 () List!36763)

(declare-fun call!71927 () List!36763)

(assert (=> bm!71923 (= call!71926 call!71927)))

(declare-fun c!144474 () Bool)

(declare-fun bm!71924 () Bool)

(assert (=> bm!71924 (= call!71927 ($colon$colon!990 e!874345 (ite c!144474 (h!38207 (insertStrictlySorted!582 (t!51663 l!750) key2!21 v2!10)) (tuple2!25375 key1!37 v1!32))))))

(declare-fun c!144477 () Bool)

(assert (=> bm!71924 (= c!144477 c!144474)))

(declare-fun b!1568460 () Bool)

(declare-fun e!874344 () List!36763)

(assert (=> b!1568460 (= e!874344 call!71927)))

(declare-fun d!163535 () Bool)

(assert (=> d!163535 e!874342))

(declare-fun res!1072236 () Bool)

(assert (=> d!163535 (=> (not res!1072236) (not e!874342))))

(assert (=> d!163535 (= res!1072236 (isStrictlySorted!993 lt!672950))))

(assert (=> d!163535 (= lt!672950 e!874344)))

(assert (=> d!163535 (= c!144474 (and ((_ is Cons!36759) (insertStrictlySorted!582 (t!51663 l!750) key2!21 v2!10)) (bvslt (_1!12698 (h!38207 (insertStrictlySorted!582 (t!51663 l!750) key2!21 v2!10))) key1!37)))))

(assert (=> d!163535 (isStrictlySorted!993 (insertStrictlySorted!582 (t!51663 l!750) key2!21 v2!10))))

(assert (=> d!163535 (= (insertStrictlySorted!582 (insertStrictlySorted!582 (t!51663 l!750) key2!21 v2!10) key1!37 v1!32) lt!672950)))

(declare-fun b!1568461 () Bool)

(declare-fun res!1072235 () Bool)

(assert (=> b!1568461 (=> (not res!1072235) (not e!874342))))

(assert (=> b!1568461 (= res!1072235 (containsKey!854 lt!672950 key1!37))))

(declare-fun b!1568462 () Bool)

(declare-fun e!874343 () List!36763)

(declare-fun call!71928 () List!36763)

(assert (=> b!1568462 (= e!874343 call!71928)))

(declare-fun bm!71925 () Bool)

(assert (=> bm!71925 (= call!71928 call!71926)))

(declare-fun b!1568463 () Bool)

(assert (=> b!1568463 (= c!144475 (and ((_ is Cons!36759) (insertStrictlySorted!582 (t!51663 l!750) key2!21 v2!10)) (bvsgt (_1!12698 (h!38207 (insertStrictlySorted!582 (t!51663 l!750) key2!21 v2!10))) key1!37)))))

(declare-fun e!874346 () List!36763)

(assert (=> b!1568463 (= e!874346 e!874343)))

(declare-fun b!1568464 () Bool)

(assert (=> b!1568464 (= e!874343 call!71928)))

(declare-fun b!1568465 () Bool)

(assert (=> b!1568465 (= e!874344 e!874346)))

(assert (=> b!1568465 (= c!144476 (and ((_ is Cons!36759) (insertStrictlySorted!582 (t!51663 l!750) key2!21 v2!10)) (= (_1!12698 (h!38207 (insertStrictlySorted!582 (t!51663 l!750) key2!21 v2!10))) key1!37)))))

(declare-fun b!1568466 () Bool)

(assert (=> b!1568466 (= e!874346 call!71926)))

(assert (= (and d!163535 c!144474) b!1568460))

(assert (= (and d!163535 (not c!144474)) b!1568465))

(assert (= (and b!1568465 c!144476) b!1568466))

(assert (= (and b!1568465 (not c!144476)) b!1568463))

(assert (= (and b!1568463 c!144475) b!1568464))

(assert (= (and b!1568463 (not c!144475)) b!1568462))

(assert (= (or b!1568464 b!1568462) bm!71925))

(assert (= (or b!1568466 bm!71925) bm!71923))

(assert (= (or b!1568460 bm!71923) bm!71924))

(assert (= (and bm!71924 c!144477) b!1568459))

(assert (= (and bm!71924 (not c!144477)) b!1568457))

(assert (= (and d!163535 res!1072236) b!1568461))

(assert (= (and b!1568461 res!1072235) b!1568458))

(declare-fun m!1442449 () Bool)

(assert (=> bm!71924 m!1442449))

(declare-fun m!1442451 () Bool)

(assert (=> b!1568458 m!1442451))

(declare-fun m!1442453 () Bool)

(assert (=> b!1568459 m!1442453))

(declare-fun m!1442455 () Bool)

(assert (=> b!1568461 m!1442455))

(declare-fun m!1442457 () Bool)

(assert (=> d!163535 m!1442457))

(assert (=> d!163535 m!1442353))

(declare-fun m!1442459 () Bool)

(assert (=> d!163535 m!1442459))

(assert (=> b!1568329 d!163535))

(declare-fun b!1568477 () Bool)

(declare-fun e!874355 () List!36763)

(declare-fun c!144484 () Bool)

(declare-fun c!144483 () Bool)

(assert (=> b!1568477 (= e!874355 (ite c!144484 (t!51663 (t!51663 l!750)) (ite c!144483 (Cons!36759 (h!38207 (t!51663 l!750)) (t!51663 (t!51663 l!750))) Nil!36760)))))

(declare-fun lt!672952 () List!36763)

(declare-fun e!874352 () Bool)

(declare-fun b!1568478 () Bool)

(assert (=> b!1568478 (= e!874352 (contains!10370 lt!672952 (tuple2!25375 key1!37 v1!32)))))

(declare-fun b!1568479 () Bool)

(assert (=> b!1568479 (= e!874355 (insertStrictlySorted!582 (t!51663 (t!51663 l!750)) key1!37 v1!32))))

(declare-fun bm!71929 () Bool)

(declare-fun call!71932 () List!36763)

(declare-fun call!71933 () List!36763)

(assert (=> bm!71929 (= call!71932 call!71933)))

(declare-fun bm!71930 () Bool)

(declare-fun c!144482 () Bool)

(assert (=> bm!71930 (= call!71933 ($colon$colon!990 e!874355 (ite c!144482 (h!38207 (t!51663 l!750)) (tuple2!25375 key1!37 v1!32))))))

(declare-fun c!144485 () Bool)

(assert (=> bm!71930 (= c!144485 c!144482)))

(declare-fun b!1568480 () Bool)

(declare-fun e!874354 () List!36763)

(assert (=> b!1568480 (= e!874354 call!71933)))

(declare-fun d!163537 () Bool)

(assert (=> d!163537 e!874352))

(declare-fun res!1072240 () Bool)

(assert (=> d!163537 (=> (not res!1072240) (not e!874352))))

(assert (=> d!163537 (= res!1072240 (isStrictlySorted!993 lt!672952))))

(assert (=> d!163537 (= lt!672952 e!874354)))

(assert (=> d!163537 (= c!144482 (and ((_ is Cons!36759) (t!51663 l!750)) (bvslt (_1!12698 (h!38207 (t!51663 l!750))) key1!37)))))

(assert (=> d!163537 (isStrictlySorted!993 (t!51663 l!750))))

(assert (=> d!163537 (= (insertStrictlySorted!582 (t!51663 l!750) key1!37 v1!32) lt!672952)))

(declare-fun b!1568481 () Bool)

(declare-fun res!1072239 () Bool)

(assert (=> b!1568481 (=> (not res!1072239) (not e!874352))))

(assert (=> b!1568481 (= res!1072239 (containsKey!854 lt!672952 key1!37))))

(declare-fun b!1568482 () Bool)

(declare-fun e!874353 () List!36763)

(declare-fun call!71934 () List!36763)

(assert (=> b!1568482 (= e!874353 call!71934)))

(declare-fun bm!71931 () Bool)

(assert (=> bm!71931 (= call!71934 call!71932)))

(declare-fun b!1568483 () Bool)

(assert (=> b!1568483 (= c!144483 (and ((_ is Cons!36759) (t!51663 l!750)) (bvsgt (_1!12698 (h!38207 (t!51663 l!750))) key1!37)))))

(declare-fun e!874356 () List!36763)

(assert (=> b!1568483 (= e!874356 e!874353)))

(declare-fun b!1568484 () Bool)

(assert (=> b!1568484 (= e!874353 call!71934)))

(declare-fun b!1568485 () Bool)

(assert (=> b!1568485 (= e!874354 e!874356)))

(assert (=> b!1568485 (= c!144484 (and ((_ is Cons!36759) (t!51663 l!750)) (= (_1!12698 (h!38207 (t!51663 l!750))) key1!37)))))

(declare-fun b!1568486 () Bool)

(assert (=> b!1568486 (= e!874356 call!71932)))

(assert (= (and d!163537 c!144482) b!1568480))

(assert (= (and d!163537 (not c!144482)) b!1568485))

(assert (= (and b!1568485 c!144484) b!1568486))

(assert (= (and b!1568485 (not c!144484)) b!1568483))

(assert (= (and b!1568483 c!144483) b!1568484))

(assert (= (and b!1568483 (not c!144483)) b!1568482))

(assert (= (or b!1568484 b!1568482) bm!71931))

(assert (= (or b!1568486 bm!71931) bm!71929))

(assert (= (or b!1568480 bm!71929) bm!71930))

(assert (= (and bm!71930 c!144485) b!1568479))

(assert (= (and bm!71930 (not c!144485)) b!1568477))

(assert (= (and d!163537 res!1072240) b!1568481))

(assert (= (and b!1568481 res!1072239) b!1568478))

(declare-fun m!1442463 () Bool)

(assert (=> bm!71930 m!1442463))

(declare-fun m!1442467 () Bool)

(assert (=> b!1568478 m!1442467))

(declare-fun m!1442469 () Bool)

(assert (=> b!1568479 m!1442469))

(declare-fun m!1442473 () Bool)

(assert (=> b!1568481 m!1442473))

(declare-fun m!1442475 () Bool)

(assert (=> d!163537 m!1442475))

(assert (=> d!163537 m!1442351))

(assert (=> b!1568329 d!163537))

(declare-fun d!163539 () Bool)

(declare-fun res!1072241 () Bool)

(declare-fun e!874357 () Bool)

(assert (=> d!163539 (=> res!1072241 e!874357)))

(assert (=> d!163539 (= res!1072241 (or ((_ is Nil!36760) (t!51663 l!750)) ((_ is Nil!36760) (t!51663 (t!51663 l!750)))))))

(assert (=> d!163539 (= (isStrictlySorted!993 (t!51663 l!750)) e!874357)))

(declare-fun b!1568487 () Bool)

(declare-fun e!874358 () Bool)

(assert (=> b!1568487 (= e!874357 e!874358)))

(declare-fun res!1072242 () Bool)

(assert (=> b!1568487 (=> (not res!1072242) (not e!874358))))

(assert (=> b!1568487 (= res!1072242 (bvslt (_1!12698 (h!38207 (t!51663 l!750))) (_1!12698 (h!38207 (t!51663 (t!51663 l!750))))))))

(declare-fun b!1568488 () Bool)

(assert (=> b!1568488 (= e!874358 (isStrictlySorted!993 (t!51663 (t!51663 l!750))))))

(assert (= (and d!163539 (not res!1072241)) b!1568487))

(assert (= (and b!1568487 res!1072242) b!1568488))

(declare-fun m!1442479 () Bool)

(assert (=> b!1568488 m!1442479))

(assert (=> b!1568327 d!163539))

(declare-fun d!163543 () Bool)

(declare-fun res!1072245 () Bool)

(declare-fun e!874364 () Bool)

(assert (=> d!163543 (=> res!1072245 e!874364)))

(assert (=> d!163543 (= res!1072245 (or ((_ is Nil!36760) l!750) ((_ is Nil!36760) (t!51663 l!750))))))

(assert (=> d!163543 (= (isStrictlySorted!993 l!750) e!874364)))

(declare-fun b!1568501 () Bool)

(declare-fun e!874365 () Bool)

(assert (=> b!1568501 (= e!874364 e!874365)))

(declare-fun res!1072246 () Bool)

(assert (=> b!1568501 (=> (not res!1072246) (not e!874365))))

(assert (=> b!1568501 (= res!1072246 (bvslt (_1!12698 (h!38207 l!750)) (_1!12698 (h!38207 (t!51663 l!750)))))))

(declare-fun b!1568502 () Bool)

(assert (=> b!1568502 (= e!874365 (isStrictlySorted!993 (t!51663 l!750)))))

(assert (= (and d!163543 (not res!1072245)) b!1568501))

(assert (= (and b!1568501 res!1072246) b!1568502))

(assert (=> b!1568502 m!1442351))

(assert (=> b!1568326 d!163543))

(declare-fun b!1568517 () Bool)

(declare-fun e!874374 () Bool)

(declare-fun tp!114058 () Bool)

(assert (=> b!1568517 (= e!874374 (and tp_is_empty!39031 tp!114058))))

(assert (=> b!1568328 (= tp!114049 e!874374)))

(assert (= (and b!1568328 ((_ is Cons!36759) (t!51663 l!750))) b!1568517))

(check-sat (not d!163537) (not b!1568423) (not b!1568448) (not b!1568451) (not b!1568517) (not b!1568420) (not bm!71921) (not b!1568488) (not b!1568479) (not b!1568459) (not d!163531) (not bm!71913) (not bm!71924) (not b!1568502) (not bm!71930) (not b!1568421) (not b!1568435) tp_is_empty!39031 (not b!1568434) (not bm!71918) (not b!1568478) (not d!163515) (not b!1568437) (not b!1568481) (not b!1568374) (not d!163535) (not b!1568458) (not b!1568449) (not d!163533) (not b!1568461) (not d!163505))
(check-sat)
