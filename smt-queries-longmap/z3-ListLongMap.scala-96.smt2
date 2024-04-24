; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1452 () Bool)

(assert start!1452)

(declare-fun b_free!439 () Bool)

(declare-fun b_next!439 () Bool)

(assert (=> start!1452 (= b_free!439 (not b_next!439))))

(declare-fun tp!1820 () Bool)

(declare-fun b_and!699 () Bool)

(assert (=> start!1452 (= tp!1820 b_and!699)))

(declare-fun b!11148 () Bool)

(declare-fun e!6558 () Bool)

(declare-fun tp_is_empty!553 () Bool)

(declare-fun tp!1819 () Bool)

(assert (=> b!11148 (= e!6558 (and tp_is_empty!553 tp!1819))))

(declare-fun b!11149 () Bool)

(declare-fun res!9317 () Bool)

(declare-fun e!6560 () Bool)

(assert (=> b!11149 (=> (not res!9317) (not e!6560))))

(declare-datatypes ((B!380 0))(
  ( (B!381 (val!285 Int)) )
))
(declare-datatypes ((tuple2!366 0))(
  ( (tuple2!367 (_1!183 (_ BitVec 64)) (_2!183 B!380)) )
))
(declare-datatypes ((List!333 0))(
  ( (Nil!330) (Cons!329 (h!895 tuple2!366) (t!2582 List!333)) )
))
(declare-fun kvs!4 () List!333)

(declare-fun p!216 () Int)

(declare-fun forall!56 (List!333 Int) Bool)

(assert (=> b!11149 (= res!9317 (forall!56 kvs!4 p!216))))

(declare-fun b!11151 () Bool)

(declare-fun e!6557 () Bool)

(assert (=> b!11151 (= e!6560 (not e!6557))))

(declare-fun res!9319 () Bool)

(assert (=> b!11151 (=> (not res!9319) (not e!6557))))

(declare-datatypes ((ListLongMap!347 0))(
  ( (ListLongMap!348 (toList!189 List!333)) )
))
(declare-fun lm!227 () ListLongMap!347)

(declare-fun lt!2765 () tuple2!366)

(declare-fun +!23 (ListLongMap!347 tuple2!366) ListLongMap!347)

(assert (=> b!11151 (= res!9319 (forall!56 (toList!189 (+!23 lm!227 lt!2765)) p!216))))

(assert (=> b!11151 (forall!56 (toList!189 (+!23 lm!227 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765)))) p!216)))

(declare-datatypes ((Unit!241 0))(
  ( (Unit!242) )
))
(declare-fun lt!2766 () Unit!241)

(declare-fun addValidProp!11 (ListLongMap!347 Int (_ BitVec 64) B!380) Unit!241)

(assert (=> b!11151 (= lt!2766 (addValidProp!11 lm!227 p!216 (_1!183 lt!2765) (_2!183 lt!2765)))))

(declare-fun head!770 (List!333) tuple2!366)

(assert (=> b!11151 (= lt!2765 (head!770 kvs!4))))

(declare-fun b!11152 () Bool)

(declare-fun res!9318 () Bool)

(assert (=> b!11152 (=> (not res!9318) (not e!6560))))

(declare-fun isEmpty!63 (List!333) Bool)

(assert (=> b!11152 (= res!9318 (not (isEmpty!63 kvs!4)))))

(declare-fun b!11153 () Bool)

(declare-fun e!6559 () Bool)

(declare-fun tp!1818 () Bool)

(assert (=> b!11153 (= e!6559 tp!1818)))

(declare-fun b!11150 () Bool)

(declare-fun tail!50 (List!333) List!333)

(assert (=> b!11150 (= e!6557 (forall!56 (tail!50 kvs!4) p!216))))

(declare-fun res!9316 () Bool)

(assert (=> start!1452 (=> (not res!9316) (not e!6560))))

(assert (=> start!1452 (= res!9316 (forall!56 (toList!189 lm!227) p!216))))

(assert (=> start!1452 e!6560))

(declare-fun inv!550 (ListLongMap!347) Bool)

(assert (=> start!1452 (and (inv!550 lm!227) e!6559)))

(assert (=> start!1452 tp!1820))

(assert (=> start!1452 e!6558))

(assert (= (and start!1452 res!9316) b!11149))

(assert (= (and b!11149 res!9317) b!11152))

(assert (= (and b!11152 res!9318) b!11151))

(assert (= (and b!11151 res!9319) b!11150))

(assert (= start!1452 b!11153))

(get-info :version)

(assert (= (and start!1452 ((_ is Cons!329) kvs!4)) b!11148))

(declare-fun m!7357 () Bool)

(assert (=> b!11151 m!7357))

(declare-fun m!7359 () Bool)

(assert (=> b!11151 m!7359))

(declare-fun m!7361 () Bool)

(assert (=> b!11151 m!7361))

(declare-fun m!7363 () Bool)

(assert (=> b!11151 m!7363))

(declare-fun m!7365 () Bool)

(assert (=> b!11151 m!7365))

(declare-fun m!7367 () Bool)

(assert (=> b!11151 m!7367))

(declare-fun m!7369 () Bool)

(assert (=> b!11149 m!7369))

(declare-fun m!7371 () Bool)

(assert (=> b!11152 m!7371))

(declare-fun m!7373 () Bool)

(assert (=> b!11150 m!7373))

(assert (=> b!11150 m!7373))

(declare-fun m!7375 () Bool)

(assert (=> b!11150 m!7375))

(declare-fun m!7377 () Bool)

(assert (=> start!1452 m!7377))

(declare-fun m!7379 () Bool)

(assert (=> start!1452 m!7379))

(check-sat (not b!11150) (not b!11151) (not b!11152) (not b!11153) (not b!11148) (not b!11149) (not b_next!439) b_and!699 tp_is_empty!553 (not start!1452))
(check-sat b_and!699 (not b_next!439))
(get-model)

(declare-fun d!1333 () Bool)

(declare-fun res!9352 () Bool)

(declare-fun e!6593 () Bool)

(assert (=> d!1333 (=> res!9352 e!6593)))

(assert (=> d!1333 (= res!9352 ((_ is Nil!330) kvs!4))))

(assert (=> d!1333 (= (forall!56 kvs!4 p!216) e!6593)))

(declare-fun b!11198 () Bool)

(declare-fun e!6594 () Bool)

(assert (=> b!11198 (= e!6593 e!6594)))

(declare-fun res!9353 () Bool)

(assert (=> b!11198 (=> (not res!9353) (not e!6594))))

(declare-fun dynLambda!67 (Int tuple2!366) Bool)

(assert (=> b!11198 (= res!9353 (dynLambda!67 p!216 (h!895 kvs!4)))))

(declare-fun b!11199 () Bool)

(assert (=> b!11199 (= e!6594 (forall!56 (t!2582 kvs!4) p!216))))

(assert (= (and d!1333 (not res!9352)) b!11198))

(assert (= (and b!11198 res!9353) b!11199))

(declare-fun b_lambda!563 () Bool)

(assert (=> (not b_lambda!563) (not b!11198)))

(declare-fun t!2586 () Bool)

(declare-fun tb!249 () Bool)

(assert (=> (and start!1452 (= p!216 p!216) t!2586) tb!249))

(declare-fun result!411 () Bool)

(assert (=> tb!249 (= result!411 true)))

(assert (=> b!11198 t!2586))

(declare-fun b_and!705 () Bool)

(assert (= b_and!699 (and (=> t!2586 result!411) b_and!705)))

(declare-fun m!7431 () Bool)

(assert (=> b!11198 m!7431))

(declare-fun m!7435 () Bool)

(assert (=> b!11199 m!7435))

(assert (=> b!11149 d!1333))

(declare-fun d!1339 () Bool)

(declare-fun res!9356 () Bool)

(declare-fun e!6597 () Bool)

(assert (=> d!1339 (=> res!9356 e!6597)))

(assert (=> d!1339 (= res!9356 ((_ is Nil!330) (tail!50 kvs!4)))))

(assert (=> d!1339 (= (forall!56 (tail!50 kvs!4) p!216) e!6597)))

(declare-fun b!11202 () Bool)

(declare-fun e!6598 () Bool)

(assert (=> b!11202 (= e!6597 e!6598)))

(declare-fun res!9357 () Bool)

(assert (=> b!11202 (=> (not res!9357) (not e!6598))))

(assert (=> b!11202 (= res!9357 (dynLambda!67 p!216 (h!895 (tail!50 kvs!4))))))

(declare-fun b!11203 () Bool)

(assert (=> b!11203 (= e!6598 (forall!56 (t!2582 (tail!50 kvs!4)) p!216))))

(assert (= (and d!1339 (not res!9356)) b!11202))

(assert (= (and b!11202 res!9357) b!11203))

(declare-fun b_lambda!567 () Bool)

(assert (=> (not b_lambda!567) (not b!11202)))

(declare-fun t!2590 () Bool)

(declare-fun tb!253 () Bool)

(assert (=> (and start!1452 (= p!216 p!216) t!2590) tb!253))

(declare-fun result!415 () Bool)

(assert (=> tb!253 (= result!415 true)))

(assert (=> b!11202 t!2590))

(declare-fun b_and!709 () Bool)

(assert (= b_and!705 (and (=> t!2590 result!415) b_and!709)))

(declare-fun m!7437 () Bool)

(assert (=> b!11202 m!7437))

(declare-fun m!7439 () Bool)

(assert (=> b!11203 m!7439))

(assert (=> b!11150 d!1339))

(declare-fun d!1341 () Bool)

(assert (=> d!1341 (= (tail!50 kvs!4) (t!2582 kvs!4))))

(assert (=> b!11150 d!1341))

(declare-fun d!1343 () Bool)

(declare-fun e!6611 () Bool)

(assert (=> d!1343 e!6611))

(declare-fun res!9373 () Bool)

(assert (=> d!1343 (=> (not res!9373) (not e!6611))))

(declare-fun lt!2789 () ListLongMap!347)

(declare-fun contains!151 (ListLongMap!347 (_ BitVec 64)) Bool)

(assert (=> d!1343 (= res!9373 (contains!151 lt!2789 (_1!183 lt!2765)))))

(declare-fun lt!2791 () List!333)

(assert (=> d!1343 (= lt!2789 (ListLongMap!348 lt!2791))))

(declare-fun lt!2790 () Unit!241)

(declare-fun lt!2792 () Unit!241)

(assert (=> d!1343 (= lt!2790 lt!2792)))

(declare-datatypes ((Option!29 0))(
  ( (Some!28 (v!1343 B!380)) (None!27) )
))
(declare-fun getValueByKey!23 (List!333 (_ BitVec 64)) Option!29)

(assert (=> d!1343 (= (getValueByKey!23 lt!2791 (_1!183 lt!2765)) (Some!28 (_2!183 lt!2765)))))

(declare-fun lemmaContainsTupThenGetReturnValue!7 (List!333 (_ BitVec 64) B!380) Unit!241)

(assert (=> d!1343 (= lt!2792 (lemmaContainsTupThenGetReturnValue!7 lt!2791 (_1!183 lt!2765) (_2!183 lt!2765)))))

(declare-fun insertStrictlySorted!7 (List!333 (_ BitVec 64) B!380) List!333)

(assert (=> d!1343 (= lt!2791 (insertStrictlySorted!7 (toList!189 lm!227) (_1!183 lt!2765) (_2!183 lt!2765)))))

(assert (=> d!1343 (= (+!23 lm!227 lt!2765) lt!2789)))

(declare-fun b!11219 () Bool)

(declare-fun res!9372 () Bool)

(assert (=> b!11219 (=> (not res!9372) (not e!6611))))

(assert (=> b!11219 (= res!9372 (= (getValueByKey!23 (toList!189 lt!2789) (_1!183 lt!2765)) (Some!28 (_2!183 lt!2765))))))

(declare-fun b!11220 () Bool)

(declare-fun contains!152 (List!333 tuple2!366) Bool)

(assert (=> b!11220 (= e!6611 (contains!152 (toList!189 lt!2789) lt!2765))))

(assert (= (and d!1343 res!9373) b!11219))

(assert (= (and b!11219 res!9372) b!11220))

(declare-fun m!7451 () Bool)

(assert (=> d!1343 m!7451))

(declare-fun m!7453 () Bool)

(assert (=> d!1343 m!7453))

(declare-fun m!7455 () Bool)

(assert (=> d!1343 m!7455))

(declare-fun m!7457 () Bool)

(assert (=> d!1343 m!7457))

(declare-fun m!7459 () Bool)

(assert (=> b!11219 m!7459))

(declare-fun m!7461 () Bool)

(assert (=> b!11220 m!7461))

(assert (=> b!11151 d!1343))

(declare-fun d!1357 () Bool)

(declare-fun res!9374 () Bool)

(declare-fun e!6612 () Bool)

(assert (=> d!1357 (=> res!9374 e!6612)))

(assert (=> d!1357 (= res!9374 ((_ is Nil!330) (toList!189 (+!23 lm!227 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765))))))))

(assert (=> d!1357 (= (forall!56 (toList!189 (+!23 lm!227 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765)))) p!216) e!6612)))

(declare-fun b!11221 () Bool)

(declare-fun e!6613 () Bool)

(assert (=> b!11221 (= e!6612 e!6613)))

(declare-fun res!9375 () Bool)

(assert (=> b!11221 (=> (not res!9375) (not e!6613))))

(assert (=> b!11221 (= res!9375 (dynLambda!67 p!216 (h!895 (toList!189 (+!23 lm!227 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765)))))))))

(declare-fun b!11222 () Bool)

(assert (=> b!11222 (= e!6613 (forall!56 (t!2582 (toList!189 (+!23 lm!227 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765))))) p!216))))

(assert (= (and d!1357 (not res!9374)) b!11221))

(assert (= (and b!11221 res!9375) b!11222))

(declare-fun b_lambda!573 () Bool)

(assert (=> (not b_lambda!573) (not b!11221)))

(declare-fun t!2596 () Bool)

(declare-fun tb!259 () Bool)

(assert (=> (and start!1452 (= p!216 p!216) t!2596) tb!259))

(declare-fun result!421 () Bool)

(assert (=> tb!259 (= result!421 true)))

(assert (=> b!11221 t!2596))

(declare-fun b_and!715 () Bool)

(assert (= b_and!709 (and (=> t!2596 result!421) b_and!715)))

(declare-fun m!7463 () Bool)

(assert (=> b!11221 m!7463))

(declare-fun m!7465 () Bool)

(assert (=> b!11222 m!7465))

(assert (=> b!11151 d!1357))

(declare-fun d!1359 () Bool)

(declare-fun e!6615 () Bool)

(assert (=> d!1359 e!6615))

(declare-fun res!9378 () Bool)

(assert (=> d!1359 (=> (not res!9378) (not e!6615))))

(declare-fun lt!2794 () ListLongMap!347)

(assert (=> d!1359 (= res!9378 (contains!151 lt!2794 (_1!183 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765)))))))

(declare-fun lt!2796 () List!333)

(assert (=> d!1359 (= lt!2794 (ListLongMap!348 lt!2796))))

(declare-fun lt!2795 () Unit!241)

(declare-fun lt!2797 () Unit!241)

(assert (=> d!1359 (= lt!2795 lt!2797)))

(assert (=> d!1359 (= (getValueByKey!23 lt!2796 (_1!183 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765)))) (Some!28 (_2!183 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765)))))))

(assert (=> d!1359 (= lt!2797 (lemmaContainsTupThenGetReturnValue!7 lt!2796 (_1!183 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765))) (_2!183 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765)))))))

(assert (=> d!1359 (= lt!2796 (insertStrictlySorted!7 (toList!189 lm!227) (_1!183 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765))) (_2!183 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765)))))))

(assert (=> d!1359 (= (+!23 lm!227 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765))) lt!2794)))

(declare-fun b!11224 () Bool)

(declare-fun res!9377 () Bool)

(assert (=> b!11224 (=> (not res!9377) (not e!6615))))

(assert (=> b!11224 (= res!9377 (= (getValueByKey!23 (toList!189 lt!2794) (_1!183 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765)))) (Some!28 (_2!183 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765))))))))

(declare-fun b!11225 () Bool)

(assert (=> b!11225 (= e!6615 (contains!152 (toList!189 lt!2794) (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765))))))

(assert (= (and d!1359 res!9378) b!11224))

(assert (= (and b!11224 res!9377) b!11225))

(declare-fun m!7471 () Bool)

(assert (=> d!1359 m!7471))

(declare-fun m!7473 () Bool)

(assert (=> d!1359 m!7473))

(declare-fun m!7475 () Bool)

(assert (=> d!1359 m!7475))

(declare-fun m!7477 () Bool)

(assert (=> d!1359 m!7477))

(declare-fun m!7479 () Bool)

(assert (=> b!11224 m!7479))

(declare-fun m!7481 () Bool)

(assert (=> b!11225 m!7481))

(assert (=> b!11151 d!1359))

(declare-fun d!1363 () Bool)

(assert (=> d!1363 (forall!56 (toList!189 (+!23 lm!227 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765)))) p!216)))

(declare-fun lt!2808 () Unit!241)

(declare-fun choose!155 (ListLongMap!347 Int (_ BitVec 64) B!380) Unit!241)

(assert (=> d!1363 (= lt!2808 (choose!155 lm!227 p!216 (_1!183 lt!2765) (_2!183 lt!2765)))))

(declare-fun e!6624 () Bool)

(assert (=> d!1363 e!6624))

(declare-fun res!9389 () Bool)

(assert (=> d!1363 (=> (not res!9389) (not e!6624))))

(assert (=> d!1363 (= res!9389 (forall!56 (toList!189 lm!227) p!216))))

(assert (=> d!1363 (= (addValidProp!11 lm!227 p!216 (_1!183 lt!2765) (_2!183 lt!2765)) lt!2808)))

(declare-fun b!11237 () Bool)

(assert (=> b!11237 (= e!6624 (dynLambda!67 p!216 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765))))))

(assert (= (and d!1363 res!9389) b!11237))

(declare-fun b_lambda!581 () Bool)

(assert (=> (not b_lambda!581) (not b!11237)))

(declare-fun t!2604 () Bool)

(declare-fun tb!267 () Bool)

(assert (=> (and start!1452 (= p!216 p!216) t!2604) tb!267))

(declare-fun result!429 () Bool)

(assert (=> tb!267 (= result!429 true)))

(assert (=> b!11237 t!2604))

(declare-fun b_and!723 () Bool)

(assert (= b_and!715 (and (=> t!2604 result!429) b_and!723)))

(assert (=> d!1363 m!7363))

(assert (=> d!1363 m!7357))

(declare-fun m!7491 () Bool)

(assert (=> d!1363 m!7491))

(assert (=> d!1363 m!7377))

(declare-fun m!7493 () Bool)

(assert (=> b!11237 m!7493))

(assert (=> b!11151 d!1363))

(declare-fun d!1371 () Bool)

(assert (=> d!1371 (= (head!770 kvs!4) (h!895 kvs!4))))

(assert (=> b!11151 d!1371))

(declare-fun d!1373 () Bool)

(declare-fun res!9392 () Bool)

(declare-fun e!6626 () Bool)

(assert (=> d!1373 (=> res!9392 e!6626)))

(assert (=> d!1373 (= res!9392 ((_ is Nil!330) (toList!189 (+!23 lm!227 lt!2765))))))

(assert (=> d!1373 (= (forall!56 (toList!189 (+!23 lm!227 lt!2765)) p!216) e!6626)))

(declare-fun b!11240 () Bool)

(declare-fun e!6627 () Bool)

(assert (=> b!11240 (= e!6626 e!6627)))

(declare-fun res!9393 () Bool)

(assert (=> b!11240 (=> (not res!9393) (not e!6627))))

(assert (=> b!11240 (= res!9393 (dynLambda!67 p!216 (h!895 (toList!189 (+!23 lm!227 lt!2765)))))))

(declare-fun b!11241 () Bool)

(assert (=> b!11241 (= e!6627 (forall!56 (t!2582 (toList!189 (+!23 lm!227 lt!2765))) p!216))))

(assert (= (and d!1373 (not res!9392)) b!11240))

(assert (= (and b!11240 res!9393) b!11241))

(declare-fun b_lambda!583 () Bool)

(assert (=> (not b_lambda!583) (not b!11240)))

(declare-fun t!2606 () Bool)

(declare-fun tb!269 () Bool)

(assert (=> (and start!1452 (= p!216 p!216) t!2606) tb!269))

(declare-fun result!431 () Bool)

(assert (=> tb!269 (= result!431 true)))

(assert (=> b!11240 t!2606))

(declare-fun b_and!725 () Bool)

(assert (= b_and!723 (and (=> t!2606 result!431) b_and!725)))

(declare-fun m!7507 () Bool)

(assert (=> b!11240 m!7507))

(declare-fun m!7509 () Bool)

(assert (=> b!11241 m!7509))

(assert (=> b!11151 d!1373))

(declare-fun d!1377 () Bool)

(assert (=> d!1377 (= (isEmpty!63 kvs!4) ((_ is Nil!330) kvs!4))))

(assert (=> b!11152 d!1377))

(declare-fun d!1381 () Bool)

(declare-fun res!9396 () Bool)

(declare-fun e!6630 () Bool)

(assert (=> d!1381 (=> res!9396 e!6630)))

(assert (=> d!1381 (= res!9396 ((_ is Nil!330) (toList!189 lm!227)))))

(assert (=> d!1381 (= (forall!56 (toList!189 lm!227) p!216) e!6630)))

(declare-fun b!11244 () Bool)

(declare-fun e!6631 () Bool)

(assert (=> b!11244 (= e!6630 e!6631)))

(declare-fun res!9397 () Bool)

(assert (=> b!11244 (=> (not res!9397) (not e!6631))))

(assert (=> b!11244 (= res!9397 (dynLambda!67 p!216 (h!895 (toList!189 lm!227))))))

(declare-fun b!11245 () Bool)

(assert (=> b!11245 (= e!6631 (forall!56 (t!2582 (toList!189 lm!227)) p!216))))

(assert (= (and d!1381 (not res!9396)) b!11244))

(assert (= (and b!11244 res!9397) b!11245))

(declare-fun b_lambda!587 () Bool)

(assert (=> (not b_lambda!587) (not b!11244)))

(declare-fun t!2610 () Bool)

(declare-fun tb!273 () Bool)

(assert (=> (and start!1452 (= p!216 p!216) t!2610) tb!273))

(declare-fun result!435 () Bool)

(assert (=> tb!273 (= result!435 true)))

(assert (=> b!11244 t!2610))

(declare-fun b_and!729 () Bool)

(assert (= b_and!725 (and (=> t!2610 result!435) b_and!729)))

(declare-fun m!7515 () Bool)

(assert (=> b!11244 m!7515))

(declare-fun m!7517 () Bool)

(assert (=> b!11245 m!7517))

(assert (=> start!1452 d!1381))

(declare-fun d!1385 () Bool)

(declare-fun isStrictlySorted!35 (List!333) Bool)

(assert (=> d!1385 (= (inv!550 lm!227) (isStrictlySorted!35 (toList!189 lm!227)))))

(declare-fun bs!427 () Bool)

(assert (= bs!427 d!1385))

(declare-fun m!7535 () Bool)

(assert (=> bs!427 m!7535))

(assert (=> start!1452 d!1385))

(declare-fun b!11263 () Bool)

(declare-fun e!6642 () Bool)

(declare-fun tp!1844 () Bool)

(assert (=> b!11263 (= e!6642 (and tp_is_empty!553 tp!1844))))

(assert (=> b!11153 (= tp!1818 e!6642)))

(assert (= (and b!11153 ((_ is Cons!329) (toList!189 lm!227))) b!11263))

(declare-fun b!11265 () Bool)

(declare-fun e!6644 () Bool)

(declare-fun tp!1846 () Bool)

(assert (=> b!11265 (= e!6644 (and tp_is_empty!553 tp!1846))))

(assert (=> b!11148 (= tp!1819 e!6644)))

(assert (= (and b!11148 ((_ is Cons!329) (t!2582 kvs!4))) b!11265))

(declare-fun b_lambda!601 () Bool)

(assert (= b_lambda!587 (or (and start!1452 b_free!439) b_lambda!601)))

(declare-fun b_lambda!605 () Bool)

(assert (= b_lambda!573 (or (and start!1452 b_free!439) b_lambda!605)))

(declare-fun b_lambda!607 () Bool)

(assert (= b_lambda!567 (or (and start!1452 b_free!439) b_lambda!607)))

(declare-fun b_lambda!609 () Bool)

(assert (= b_lambda!583 (or (and start!1452 b_free!439) b_lambda!609)))

(declare-fun b_lambda!611 () Bool)

(assert (= b_lambda!563 (or (and start!1452 b_free!439) b_lambda!611)))

(declare-fun b_lambda!613 () Bool)

(assert (= b_lambda!581 (or (and start!1452 b_free!439) b_lambda!613)))

(check-sat (not d!1363) (not b!11199) (not b!11263) (not d!1359) (not b_next!439) (not b!11219) (not b_lambda!609) b_and!729 (not b_lambda!605) (not b_lambda!613) (not b!11222) (not b_lambda!611) (not b!11203) (not b!11245) (not b_lambda!601) (not d!1385) tp_is_empty!553 (not b!11241) (not b_lambda!607) (not b!11220) (not b!11225) (not b!11224) (not d!1343) (not b!11265))
(check-sat b_and!729 (not b_next!439))
