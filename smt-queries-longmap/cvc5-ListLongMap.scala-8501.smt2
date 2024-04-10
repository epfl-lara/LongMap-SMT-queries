; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103614 () Bool)

(assert start!103614)

(declare-fun b!1241173 () Bool)

(declare-fun res!828033 () Bool)

(declare-fun e!703509 () Bool)

(assert (=> b!1241173 (=> (not res!828033) (not e!703509))))

(declare-datatypes ((B!1832 0))(
  ( (B!1833 (val!15678 Int)) )
))
(declare-datatypes ((tuple2!20228 0))(
  ( (tuple2!20229 (_1!10125 (_ BitVec 64)) (_2!10125 B!1832)) )
))
(declare-datatypes ((List!27343 0))(
  ( (Nil!27340) (Cons!27339 (h!28548 tuple2!20228) (t!40806 List!27343)) )
))
(declare-fun l!644 () List!27343)

(assert (=> b!1241173 (= res!828033 (is-Cons!27339 l!644))))

(declare-fun res!828032 () Bool)

(assert (=> start!103614 (=> (not res!828032) (not e!703509))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103614 (= res!828032 (not (= key1!25 key2!15)))))

(assert (=> start!103614 e!703509))

(assert (=> start!103614 true))

(declare-fun e!703508 () Bool)

(assert (=> start!103614 e!703508))

(declare-fun tp_is_empty!31231 () Bool)

(assert (=> start!103614 tp_is_empty!31231))

(declare-fun b!1241174 () Bool)

(declare-fun res!828034 () Bool)

(assert (=> b!1241174 (=> (not res!828034) (not e!703509))))

(declare-fun isStrictlySorted!745 (List!27343) Bool)

(assert (=> b!1241174 (= res!828034 (isStrictlySorted!745 l!644))))

(declare-fun v1!20 () B!1832)

(declare-fun b!1241175 () Bool)

(declare-fun insertStrictlySorted!431 (List!27343 (_ BitVec 64) B!1832) List!27343)

(assert (=> b!1241175 (= e!703509 (not (isStrictlySorted!745 (insertStrictlySorted!431 l!644 key1!25 v1!20))))))

(declare-fun removeStrictlySorted!124 (List!27343 (_ BitVec 64)) List!27343)

(assert (=> b!1241175 (= (insertStrictlySorted!431 (removeStrictlySorted!124 (t!40806 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!124 (insertStrictlySorted!431 (t!40806 l!644) key1!25 v1!20) key2!15))))

(declare-datatypes ((Unit!41255 0))(
  ( (Unit!41256) )
))
(declare-fun lt!562100 () Unit!41255)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!13 (List!27343 (_ BitVec 64) B!1832 (_ BitVec 64)) Unit!41255)

(assert (=> b!1241175 (= lt!562100 (lemmaInsertAndRemoveStrictlySortedCommutative!13 (t!40806 l!644) key1!25 v1!20 key2!15))))

(declare-fun b!1241176 () Bool)

(declare-fun tp!92609 () Bool)

(assert (=> b!1241176 (= e!703508 (and tp_is_empty!31231 tp!92609))))

(declare-fun b!1241177 () Bool)

(declare-fun res!828031 () Bool)

(assert (=> b!1241177 (=> (not res!828031) (not e!703509))))

(assert (=> b!1241177 (= res!828031 (isStrictlySorted!745 (t!40806 l!644)))))

(assert (= (and start!103614 res!828032) b!1241174))

(assert (= (and b!1241174 res!828034) b!1241173))

(assert (= (and b!1241173 res!828033) b!1241177))

(assert (= (and b!1241177 res!828031) b!1241175))

(assert (= (and start!103614 (is-Cons!27339 l!644)) b!1241176))

(declare-fun m!1144345 () Bool)

(assert (=> b!1241174 m!1144345))

(declare-fun m!1144347 () Bool)

(assert (=> b!1241175 m!1144347))

(declare-fun m!1144349 () Bool)

(assert (=> b!1241175 m!1144349))

(assert (=> b!1241175 m!1144347))

(declare-fun m!1144351 () Bool)

(assert (=> b!1241175 m!1144351))

(declare-fun m!1144353 () Bool)

(assert (=> b!1241175 m!1144353))

(assert (=> b!1241175 m!1144351))

(declare-fun m!1144355 () Bool)

(assert (=> b!1241175 m!1144355))

(declare-fun m!1144357 () Bool)

(assert (=> b!1241175 m!1144357))

(assert (=> b!1241175 m!1144355))

(declare-fun m!1144359 () Bool)

(assert (=> b!1241175 m!1144359))

(declare-fun m!1144361 () Bool)

(assert (=> b!1241177 m!1144361))

(push 1)

(assert (not b!1241174))

(assert (not b!1241177))

(assert (not b!1241176))

(assert (not b!1241175))

(assert tp_is_empty!31231)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136435 () Bool)

(declare-fun res!828073 () Bool)

(declare-fun e!703536 () Bool)

(assert (=> d!136435 (=> res!828073 e!703536)))

(assert (=> d!136435 (= res!828073 (or (is-Nil!27340 (t!40806 l!644)) (is-Nil!27340 (t!40806 (t!40806 l!644)))))))

(assert (=> d!136435 (= (isStrictlySorted!745 (t!40806 l!644)) e!703536)))

(declare-fun b!1241222 () Bool)

(declare-fun e!703537 () Bool)

(assert (=> b!1241222 (= e!703536 e!703537)))

(declare-fun res!828074 () Bool)

(assert (=> b!1241222 (=> (not res!828074) (not e!703537))))

(assert (=> b!1241222 (= res!828074 (bvslt (_1!10125 (h!28548 (t!40806 l!644))) (_1!10125 (h!28548 (t!40806 (t!40806 l!644))))))))

(declare-fun b!1241223 () Bool)

(assert (=> b!1241223 (= e!703537 (isStrictlySorted!745 (t!40806 (t!40806 l!644))))))

(assert (= (and d!136435 (not res!828073)) b!1241222))

(assert (= (and b!1241222 res!828074) b!1241223))

(declare-fun m!1144401 () Bool)

(assert (=> b!1241223 m!1144401))

(assert (=> b!1241177 d!136435))

(declare-fun e!703563 () List!27343)

(declare-fun b!1241261 () Bool)

(declare-fun $colon$colon!617 (List!27343 tuple2!20228) List!27343)

(assert (=> b!1241261 (= e!703563 ($colon$colon!617 (removeStrictlySorted!124 (t!40806 (insertStrictlySorted!431 (t!40806 l!644) key1!25 v1!20)) key2!15) (h!28548 (insertStrictlySorted!431 (t!40806 l!644) key1!25 v1!20))))))

(declare-fun b!1241262 () Bool)

(assert (=> b!1241262 (= e!703563 Nil!27340)))

(declare-fun b!1241263 () Bool)

(declare-fun e!703561 () Bool)

(declare-fun lt!562114 () List!27343)

(declare-fun containsKey!604 (List!27343 (_ BitVec 64)) Bool)

(assert (=> b!1241263 (= e!703561 (not (containsKey!604 lt!562114 key2!15)))))

(declare-fun b!1241264 () Bool)

(declare-fun e!703562 () List!27343)

(assert (=> b!1241264 (= e!703562 e!703563)))

(declare-fun c!121381 () Bool)

(assert (=> b!1241264 (= c!121381 (and (is-Cons!27339 (insertStrictlySorted!431 (t!40806 l!644) key1!25 v1!20)) (not (= (_1!10125 (h!28548 (insertStrictlySorted!431 (t!40806 l!644) key1!25 v1!20))) key2!15))))))

(declare-fun d!136441 () Bool)

(assert (=> d!136441 e!703561))

(declare-fun res!828084 () Bool)

(assert (=> d!136441 (=> (not res!828084) (not e!703561))))

(assert (=> d!136441 (= res!828084 (isStrictlySorted!745 lt!562114))))

(assert (=> d!136441 (= lt!562114 e!703562)))

(declare-fun c!121382 () Bool)

(assert (=> d!136441 (= c!121382 (and (is-Cons!27339 (insertStrictlySorted!431 (t!40806 l!644) key1!25 v1!20)) (= (_1!10125 (h!28548 (insertStrictlySorted!431 (t!40806 l!644) key1!25 v1!20))) key2!15)))))

(assert (=> d!136441 (isStrictlySorted!745 (insertStrictlySorted!431 (t!40806 l!644) key1!25 v1!20))))

(assert (=> d!136441 (= (removeStrictlySorted!124 (insertStrictlySorted!431 (t!40806 l!644) key1!25 v1!20) key2!15) lt!562114)))

(declare-fun b!1241265 () Bool)

(assert (=> b!1241265 (= e!703562 (t!40806 (insertStrictlySorted!431 (t!40806 l!644) key1!25 v1!20)))))

(assert (= (and d!136441 c!121382) b!1241265))

(assert (= (and d!136441 (not c!121382)) b!1241264))

(assert (= (and b!1241264 c!121381) b!1241261))

(assert (= (and b!1241264 (not c!121381)) b!1241262))

(assert (= (and d!136441 res!828084) b!1241263))

(declare-fun m!1144415 () Bool)

(assert (=> b!1241261 m!1144415))

(assert (=> b!1241261 m!1144415))

(declare-fun m!1144417 () Bool)

(assert (=> b!1241261 m!1144417))

(declare-fun m!1144419 () Bool)

(assert (=> b!1241263 m!1144419))

(declare-fun m!1144421 () Bool)

(assert (=> d!136441 m!1144421))

(assert (=> d!136441 m!1144351))

(declare-fun m!1144423 () Bool)

(assert (=> d!136441 m!1144423))

(assert (=> b!1241175 d!136441))

(declare-fun b!1241341 () Bool)

(declare-fun e!703603 () List!27343)

(declare-fun call!61224 () List!27343)

(assert (=> b!1241341 (= e!703603 call!61224)))

(declare-fun e!703606 () Bool)

(declare-fun lt!562123 () List!27343)

(declare-fun b!1241342 () Bool)

(declare-fun contains!7387 (List!27343 tuple2!20228) Bool)

(assert (=> b!1241342 (= e!703606 (contains!7387 lt!562123 (tuple2!20229 key1!25 v1!20)))))

(declare-fun c!121416 () Bool)

(declare-fun e!703605 () List!27343)

(declare-fun b!1241343 () Bool)

(declare-fun c!121414 () Bool)

(assert (=> b!1241343 (= e!703605 (ite c!121416 (t!40806 (removeStrictlySorted!124 (t!40806 l!644) key2!15)) (ite c!121414 (Cons!27339 (h!28548 (removeStrictlySorted!124 (t!40806 l!644) key2!15)) (t!40806 (removeStrictlySorted!124 (t!40806 l!644) key2!15))) Nil!27340)))))

(declare-fun c!121413 () Bool)

(declare-fun bm!61220 () Bool)

(declare-fun call!61225 () List!27343)

(assert (=> bm!61220 (= call!61225 ($colon$colon!617 e!703605 (ite c!121413 (h!28548 (removeStrictlySorted!124 (t!40806 l!644) key2!15)) (tuple2!20229 key1!25 v1!20))))))

(declare-fun c!121415 () Bool)

(assert (=> bm!61220 (= c!121415 c!121413)))

(declare-fun bm!61221 () Bool)

(assert (=> bm!61221 (= call!61224 call!61225)))

(declare-fun b!1241344 () Bool)

(declare-fun e!703604 () List!27343)

(declare-fun call!61223 () List!27343)

(assert (=> b!1241344 (= e!703604 call!61223)))

(declare-fun b!1241345 () Bool)

(assert (=> b!1241345 (= e!703604 call!61223)))

(declare-fun bm!61222 () Bool)

(assert (=> bm!61222 (= call!61223 call!61224)))

(declare-fun b!1241346 () Bool)

(declare-fun e!703602 () List!27343)

(assert (=> b!1241346 (= e!703602 e!703603)))

(assert (=> b!1241346 (= c!121416 (and (is-Cons!27339 (removeStrictlySorted!124 (t!40806 l!644) key2!15)) (= (_1!10125 (h!28548 (removeStrictlySorted!124 (t!40806 l!644) key2!15))) key1!25)))))

(declare-fun b!1241347 () Bool)

(assert (=> b!1241347 (= c!121414 (and (is-Cons!27339 (removeStrictlySorted!124 (t!40806 l!644) key2!15)) (bvsgt (_1!10125 (h!28548 (removeStrictlySorted!124 (t!40806 l!644) key2!15))) key1!25)))))

(assert (=> b!1241347 (= e!703603 e!703604)))

(declare-fun b!1241348 () Bool)

(assert (=> b!1241348 (= e!703602 call!61225)))

(declare-fun b!1241349 () Bool)

(assert (=> b!1241349 (= e!703605 (insertStrictlySorted!431 (t!40806 (removeStrictlySorted!124 (t!40806 l!644) key2!15)) key1!25 v1!20))))

(declare-fun b!1241350 () Bool)

(declare-fun res!828100 () Bool)

(assert (=> b!1241350 (=> (not res!828100) (not e!703606))))

(assert (=> b!1241350 (= res!828100 (containsKey!604 lt!562123 key1!25))))

(declare-fun d!136447 () Bool)

(assert (=> d!136447 e!703606))

(declare-fun res!828101 () Bool)

(assert (=> d!136447 (=> (not res!828101) (not e!703606))))

(assert (=> d!136447 (= res!828101 (isStrictlySorted!745 lt!562123))))

(assert (=> d!136447 (= lt!562123 e!703602)))

(assert (=> d!136447 (= c!121413 (and (is-Cons!27339 (removeStrictlySorted!124 (t!40806 l!644) key2!15)) (bvslt (_1!10125 (h!28548 (removeStrictlySorted!124 (t!40806 l!644) key2!15))) key1!25)))))

(assert (=> d!136447 (isStrictlySorted!745 (removeStrictlySorted!124 (t!40806 l!644) key2!15))))

(assert (=> d!136447 (= (insertStrictlySorted!431 (removeStrictlySorted!124 (t!40806 l!644) key2!15) key1!25 v1!20) lt!562123)))

(assert (= (and d!136447 c!121413) b!1241348))

(assert (= (and d!136447 (not c!121413)) b!1241346))

(assert (= (and b!1241346 c!121416) b!1241341))

(assert (= (and b!1241346 (not c!121416)) b!1241347))

(assert (= (and b!1241347 c!121414) b!1241345))

(assert (= (and b!1241347 (not c!121414)) b!1241344))

(assert (= (or b!1241345 b!1241344) bm!61222))

(assert (= (or b!1241341 bm!61222) bm!61221))

(assert (= (or b!1241348 bm!61221) bm!61220))

(assert (= (and bm!61220 c!121415) b!1241349))

(assert (= (and bm!61220 (not c!121415)) b!1241343))

(assert (= (and d!136447 res!828101) b!1241350))

(assert (= (and b!1241350 res!828100) b!1241342))

(declare-fun m!1144449 () Bool)

(assert (=> b!1241349 m!1144449))

(declare-fun m!1144451 () Bool)

(assert (=> b!1241350 m!1144451))

(declare-fun m!1144453 () Bool)

(assert (=> bm!61220 m!1144453))

(declare-fun m!1144455 () Bool)

(assert (=> d!136447 m!1144455))

(assert (=> d!136447 m!1144355))

(declare-fun m!1144457 () Bool)

(assert (=> d!136447 m!1144457))

(declare-fun m!1144459 () Bool)

(assert (=> b!1241342 m!1144459))

(assert (=> b!1241175 d!136447))

(declare-fun d!136455 () Bool)

(declare-fun res!828108 () Bool)

(declare-fun e!703619 () Bool)

(assert (=> d!136455 (=> res!828108 e!703619)))

(assert (=> d!136455 (= res!828108 (or (is-Nil!27340 (insertStrictlySorted!431 l!644 key1!25 v1!20)) (is-Nil!27340 (t!40806 (insertStrictlySorted!431 l!644 key1!25 v1!20)))))))

(assert (=> d!136455 (= (isStrictlySorted!745 (insertStrictlySorted!431 l!644 key1!25 v1!20)) e!703619)))

(declare-fun b!1241373 () Bool)

(declare-fun e!703620 () Bool)

(assert (=> b!1241373 (= e!703619 e!703620)))

(declare-fun res!828109 () Bool)

(assert (=> b!1241373 (=> (not res!828109) (not e!703620))))

(assert (=> b!1241373 (= res!828109 (bvslt (_1!10125 (h!28548 (insertStrictlySorted!431 l!644 key1!25 v1!20))) (_1!10125 (h!28548 (t!40806 (insertStrictlySorted!431 l!644 key1!25 v1!20))))))))

(declare-fun b!1241374 () Bool)

(assert (=> b!1241374 (= e!703620 (isStrictlySorted!745 (t!40806 (insertStrictlySorted!431 l!644 key1!25 v1!20))))))

(assert (= (and d!136455 (not res!828108)) b!1241373))

(assert (= (and b!1241373 res!828109) b!1241374))

(declare-fun m!1144461 () Bool)

(assert (=> b!1241374 m!1144461))

(assert (=> b!1241175 d!136455))

(declare-fun b!1241375 () Bool)

(declare-fun e!703622 () List!27343)

(declare-fun call!61233 () List!27343)

(assert (=> b!1241375 (= e!703622 call!61233)))

(declare-fun b!1241376 () Bool)

(declare-fun e!703625 () Bool)

(declare-fun lt!562126 () List!27343)

(assert (=> b!1241376 (= e!703625 (contains!7387 lt!562126 (tuple2!20229 key1!25 v1!20)))))

(declare-fun c!121428 () Bool)

(declare-fun e!703624 () List!27343)

(declare-fun b!1241377 () Bool)

(declare-fun c!121426 () Bool)

(assert (=> b!1241377 (= e!703624 (ite c!121428 (t!40806 l!644) (ite c!121426 (Cons!27339 (h!28548 l!644) (t!40806 l!644)) Nil!27340)))))

(declare-fun bm!61229 () Bool)

(declare-fun call!61234 () List!27343)

(declare-fun c!121425 () Bool)

(assert (=> bm!61229 (= call!61234 ($colon$colon!617 e!703624 (ite c!121425 (h!28548 l!644) (tuple2!20229 key1!25 v1!20))))))

(declare-fun c!121427 () Bool)

(assert (=> bm!61229 (= c!121427 c!121425)))

(declare-fun bm!61230 () Bool)

(assert (=> bm!61230 (= call!61233 call!61234)))

(declare-fun b!1241378 () Bool)

(declare-fun e!703623 () List!27343)

(declare-fun call!61232 () List!27343)

(assert (=> b!1241378 (= e!703623 call!61232)))

(declare-fun b!1241379 () Bool)

(assert (=> b!1241379 (= e!703623 call!61232)))

(declare-fun bm!61231 () Bool)

(assert (=> bm!61231 (= call!61232 call!61233)))

(declare-fun b!1241380 () Bool)

(declare-fun e!703621 () List!27343)

(assert (=> b!1241380 (= e!703621 e!703622)))

(assert (=> b!1241380 (= c!121428 (and (is-Cons!27339 l!644) (= (_1!10125 (h!28548 l!644)) key1!25)))))

(declare-fun b!1241381 () Bool)

(assert (=> b!1241381 (= c!121426 (and (is-Cons!27339 l!644) (bvsgt (_1!10125 (h!28548 l!644)) key1!25)))))

(assert (=> b!1241381 (= e!703622 e!703623)))

(declare-fun b!1241382 () Bool)

(assert (=> b!1241382 (= e!703621 call!61234)))

(declare-fun b!1241383 () Bool)

(assert (=> b!1241383 (= e!703624 (insertStrictlySorted!431 (t!40806 l!644) key1!25 v1!20))))

(declare-fun b!1241384 () Bool)

(declare-fun res!828110 () Bool)

(assert (=> b!1241384 (=> (not res!828110) (not e!703625))))

(assert (=> b!1241384 (= res!828110 (containsKey!604 lt!562126 key1!25))))

(declare-fun d!136457 () Bool)

(assert (=> d!136457 e!703625))

(declare-fun res!828111 () Bool)

(assert (=> d!136457 (=> (not res!828111) (not e!703625))))

(assert (=> d!136457 (= res!828111 (isStrictlySorted!745 lt!562126))))

(assert (=> d!136457 (= lt!562126 e!703621)))

(assert (=> d!136457 (= c!121425 (and (is-Cons!27339 l!644) (bvslt (_1!10125 (h!28548 l!644)) key1!25)))))

(assert (=> d!136457 (isStrictlySorted!745 l!644)))

(assert (=> d!136457 (= (insertStrictlySorted!431 l!644 key1!25 v1!20) lt!562126)))

(assert (= (and d!136457 c!121425) b!1241382))

(assert (= (and d!136457 (not c!121425)) b!1241380))

(assert (= (and b!1241380 c!121428) b!1241375))

(assert (= (and b!1241380 (not c!121428)) b!1241381))

(assert (= (and b!1241381 c!121426) b!1241379))

(assert (= (and b!1241381 (not c!121426)) b!1241378))

(assert (= (or b!1241379 b!1241378) bm!61231))

(assert (= (or b!1241375 bm!61231) bm!61230))

(assert (= (or b!1241382 bm!61230) bm!61229))

(assert (= (and bm!61229 c!121427) b!1241383))

(assert (= (and bm!61229 (not c!121427)) b!1241377))

(assert (= (and d!136457 res!828111) b!1241384))

(assert (= (and b!1241384 res!828110) b!1241376))

(assert (=> b!1241383 m!1144351))

(declare-fun m!1144485 () Bool)

(assert (=> b!1241384 m!1144485))

(declare-fun m!1144487 () Bool)

(assert (=> bm!61229 m!1144487))

(declare-fun m!1144489 () Bool)

(assert (=> d!136457 m!1144489))

(assert (=> d!136457 m!1144345))

(declare-fun m!1144491 () Bool)

(assert (=> b!1241376 m!1144491))

(assert (=> b!1241175 d!136457))

(declare-fun d!136465 () Bool)

(assert (=> d!136465 (= (insertStrictlySorted!431 (removeStrictlySorted!124 (t!40806 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!124 (insertStrictlySorted!431 (t!40806 l!644) key1!25 v1!20) key2!15))))

(declare-fun lt!562135 () Unit!41255)

(declare-fun choose!1838 (List!27343 (_ BitVec 64) B!1832 (_ BitVec 64)) Unit!41255)

(assert (=> d!136465 (= lt!562135 (choose!1838 (t!40806 l!644) key1!25 v1!20 key2!15))))

(assert (=> d!136465 (not (= key1!25 key2!15))))

(assert (=> d!136465 (= (lemmaInsertAndRemoveStrictlySortedCommutative!13 (t!40806 l!644) key1!25 v1!20 key2!15) lt!562135)))

(declare-fun bs!34947 () Bool)

(assert (= bs!34947 d!136465))

(assert (=> bs!34947 m!1144355))

(assert (=> bs!34947 m!1144351))

(declare-fun m!1144503 () Bool)

(assert (=> bs!34947 m!1144503))

(assert (=> bs!34947 m!1144351))

(assert (=> bs!34947 m!1144353))

(assert (=> bs!34947 m!1144355))

(assert (=> bs!34947 m!1144357))

(assert (=> b!1241175 d!136465))

(declare-fun b!1241407 () Bool)

(declare-fun e!703639 () List!27343)

(declare-fun call!61242 () List!27343)

(assert (=> b!1241407 (= e!703639 call!61242)))

(declare-fun lt!562137 () List!27343)

(declare-fun b!1241408 () Bool)

(declare-fun e!703642 () Bool)

(assert (=> b!1241408 (= e!703642 (contains!7387 lt!562137 (tuple2!20229 key1!25 v1!20)))))

(declare-fun c!121440 () Bool)

(declare-fun c!121438 () Bool)

(declare-fun e!703641 () List!27343)

(declare-fun b!1241409 () Bool)

(assert (=> b!1241409 (= e!703641 (ite c!121440 (t!40806 (t!40806 l!644)) (ite c!121438 (Cons!27339 (h!28548 (t!40806 l!644)) (t!40806 (t!40806 l!644))) Nil!27340)))))

(declare-fun bm!61238 () Bool)

(declare-fun c!121437 () Bool)

(declare-fun call!61243 () List!27343)

(assert (=> bm!61238 (= call!61243 ($colon$colon!617 e!703641 (ite c!121437 (h!28548 (t!40806 l!644)) (tuple2!20229 key1!25 v1!20))))))

(declare-fun c!121439 () Bool)

(assert (=> bm!61238 (= c!121439 c!121437)))

(declare-fun bm!61239 () Bool)

(assert (=> bm!61239 (= call!61242 call!61243)))

(declare-fun b!1241410 () Bool)

(declare-fun e!703640 () List!27343)

(declare-fun call!61241 () List!27343)

(assert (=> b!1241410 (= e!703640 call!61241)))

(declare-fun b!1241411 () Bool)

(assert (=> b!1241411 (= e!703640 call!61241)))

(declare-fun bm!61240 () Bool)

(assert (=> bm!61240 (= call!61241 call!61242)))

(declare-fun b!1241412 () Bool)

(declare-fun e!703638 () List!27343)

(assert (=> b!1241412 (= e!703638 e!703639)))

(assert (=> b!1241412 (= c!121440 (and (is-Cons!27339 (t!40806 l!644)) (= (_1!10125 (h!28548 (t!40806 l!644))) key1!25)))))

(declare-fun b!1241413 () Bool)

(assert (=> b!1241413 (= c!121438 (and (is-Cons!27339 (t!40806 l!644)) (bvsgt (_1!10125 (h!28548 (t!40806 l!644))) key1!25)))))

(assert (=> b!1241413 (= e!703639 e!703640)))

(declare-fun b!1241414 () Bool)

(assert (=> b!1241414 (= e!703638 call!61243)))

(declare-fun b!1241415 () Bool)

(assert (=> b!1241415 (= e!703641 (insertStrictlySorted!431 (t!40806 (t!40806 l!644)) key1!25 v1!20))))

(declare-fun b!1241416 () Bool)

(declare-fun res!828118 () Bool)

(assert (=> b!1241416 (=> (not res!828118) (not e!703642))))

(assert (=> b!1241416 (= res!828118 (containsKey!604 lt!562137 key1!25))))

(declare-fun d!136471 () Bool)

(assert (=> d!136471 e!703642))

(declare-fun res!828119 () Bool)

(assert (=> d!136471 (=> (not res!828119) (not e!703642))))

(assert (=> d!136471 (= res!828119 (isStrictlySorted!745 lt!562137))))

(assert (=> d!136471 (= lt!562137 e!703638)))

(assert (=> d!136471 (= c!121437 (and (is-Cons!27339 (t!40806 l!644)) (bvslt (_1!10125 (h!28548 (t!40806 l!644))) key1!25)))))

(assert (=> d!136471 (isStrictlySorted!745 (t!40806 l!644))))

(assert (=> d!136471 (= (insertStrictlySorted!431 (t!40806 l!644) key1!25 v1!20) lt!562137)))

(assert (= (and d!136471 c!121437) b!1241414))

(assert (= (and d!136471 (not c!121437)) b!1241412))

(assert (= (and b!1241412 c!121440) b!1241407))

(assert (= (and b!1241412 (not c!121440)) b!1241413))

(assert (= (and b!1241413 c!121438) b!1241411))

(assert (= (and b!1241413 (not c!121438)) b!1241410))

(assert (= (or b!1241411 b!1241410) bm!61240))

(assert (= (or b!1241407 bm!61240) bm!61239))

(assert (= (or b!1241414 bm!61239) bm!61238))

(assert (= (and bm!61238 c!121439) b!1241415))

(assert (= (and bm!61238 (not c!121439)) b!1241409))

(assert (= (and d!136471 res!828119) b!1241416))

(assert (= (and b!1241416 res!828118) b!1241408))

(declare-fun m!1144517 () Bool)

(assert (=> b!1241415 m!1144517))

(declare-fun m!1144519 () Bool)

(assert (=> b!1241416 m!1144519))

(declare-fun m!1144521 () Bool)

(assert (=> bm!61238 m!1144521))

(declare-fun m!1144523 () Bool)

(assert (=> d!136471 m!1144523))

(assert (=> d!136471 m!1144361))

(declare-fun m!1144525 () Bool)

(assert (=> b!1241408 m!1144525))

(assert (=> b!1241175 d!136471))

(declare-fun b!1241432 () Bool)

(declare-fun e!703653 () List!27343)

(assert (=> b!1241432 (= e!703653 ($colon$colon!617 (removeStrictlySorted!124 (t!40806 (t!40806 l!644)) key2!15) (h!28548 (t!40806 l!644))))))

(declare-fun b!1241433 () Bool)

(assert (=> b!1241433 (= e!703653 Nil!27340)))

(declare-fun b!1241434 () Bool)

(declare-fun e!703651 () Bool)

(declare-fun lt!562141 () List!27343)

(assert (=> b!1241434 (= e!703651 (not (containsKey!604 lt!562141 key2!15)))))

(declare-fun b!1241435 () Bool)

(declare-fun e!703652 () List!27343)

(assert (=> b!1241435 (= e!703652 e!703653)))

(declare-fun c!121447 () Bool)

(assert (=> b!1241435 (= c!121447 (and (is-Cons!27339 (t!40806 l!644)) (not (= (_1!10125 (h!28548 (t!40806 l!644))) key2!15))))))

(declare-fun d!136477 () Bool)

(assert (=> d!136477 e!703651))

(declare-fun res!828123 () Bool)

(assert (=> d!136477 (=> (not res!828123) (not e!703651))))

(assert (=> d!136477 (= res!828123 (isStrictlySorted!745 lt!562141))))

(assert (=> d!136477 (= lt!562141 e!703652)))

(declare-fun c!121448 () Bool)

(assert (=> d!136477 (= c!121448 (and (is-Cons!27339 (t!40806 l!644)) (= (_1!10125 (h!28548 (t!40806 l!644))) key2!15)))))

(assert (=> d!136477 (isStrictlySorted!745 (t!40806 l!644))))

(assert (=> d!136477 (= (removeStrictlySorted!124 (t!40806 l!644) key2!15) lt!562141)))

(declare-fun b!1241436 () Bool)

(assert (=> b!1241436 (= e!703652 (t!40806 (t!40806 l!644)))))

(assert (= (and d!136477 c!121448) b!1241436))

(assert (= (and d!136477 (not c!121448)) b!1241435))

(assert (= (and b!1241435 c!121447) b!1241432))

(assert (= (and b!1241435 (not c!121447)) b!1241433))

(assert (= (and d!136477 res!828123) b!1241434))

(declare-fun m!1144535 () Bool)

(assert (=> b!1241432 m!1144535))

(assert (=> b!1241432 m!1144535))

(declare-fun m!1144539 () Bool)

(assert (=> b!1241432 m!1144539))

(declare-fun m!1144543 () Bool)

(assert (=> b!1241434 m!1144543))

(declare-fun m!1144546 () Bool)

(assert (=> d!136477 m!1144546))

(assert (=> d!136477 m!1144361))

(assert (=> b!1241175 d!136477))

(declare-fun d!136481 () Bool)

(declare-fun res!828126 () Bool)

(declare-fun e!703658 () Bool)

(assert (=> d!136481 (=> res!828126 e!703658)))

(assert (=> d!136481 (= res!828126 (or (is-Nil!27340 l!644) (is-Nil!27340 (t!40806 l!644))))))

(assert (=> d!136481 (= (isStrictlySorted!745 l!644) e!703658)))

(declare-fun b!1241443 () Bool)

(declare-fun e!703659 () Bool)

(assert (=> b!1241443 (= e!703658 e!703659)))

(declare-fun res!828127 () Bool)

(assert (=> b!1241443 (=> (not res!828127) (not e!703659))))

(assert (=> b!1241443 (= res!828127 (bvslt (_1!10125 (h!28548 l!644)) (_1!10125 (h!28548 (t!40806 l!644)))))))

(declare-fun b!1241444 () Bool)

(assert (=> b!1241444 (= e!703659 (isStrictlySorted!745 (t!40806 l!644)))))

(assert (= (and d!136481 (not res!828126)) b!1241443))

(assert (= (and b!1241443 res!828127) b!1241444))

(assert (=> b!1241444 m!1144361))

(assert (=> b!1241174 d!136481))

(declare-fun b!1241457 () Bool)

(declare-fun e!703668 () Bool)

(declare-fun tp!92621 () Bool)

(assert (=> b!1241457 (= e!703668 (and tp_is_empty!31231 tp!92621))))

(assert (=> b!1241176 (= tp!92609 e!703668)))

(assert (= (and b!1241176 (is-Cons!27339 (t!40806 l!644))) b!1241457))

(push 1)

