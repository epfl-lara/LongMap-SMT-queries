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

(declare-fun res!9318 () Bool)

(declare-fun e!6560 () Bool)

(assert (=> b!11148 (=> (not res!9318) (not e!6560))))

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

(declare-fun isEmpty!63 (List!333) Bool)

(assert (=> b!11148 (= res!9318 (not (isEmpty!63 kvs!4)))))

(declare-fun b!11149 () Bool)

(declare-fun e!6559 () Bool)

(declare-fun tp!1819 () Bool)

(assert (=> b!11149 (= e!6559 tp!1819)))

(declare-fun b!11151 () Bool)

(declare-fun e!6557 () Bool)

(assert (=> b!11151 (= e!6560 (not e!6557))))

(declare-fun res!9317 () Bool)

(assert (=> b!11151 (=> (not res!9317) (not e!6557))))

(declare-fun lt!2765 () tuple2!366)

(declare-datatypes ((ListLongMap!347 0))(
  ( (ListLongMap!348 (toList!189 List!333)) )
))
(declare-fun lm!227 () ListLongMap!347)

(declare-fun p!216 () Int)

(declare-fun forall!56 (List!333 Int) Bool)

(declare-fun +!23 (ListLongMap!347 tuple2!366) ListLongMap!347)

(assert (=> b!11151 (= res!9317 (forall!56 (toList!189 (+!23 lm!227 lt!2765)) p!216))))

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

(declare-fun e!6558 () Bool)

(declare-fun tp_is_empty!553 () Bool)

(declare-fun tp!1818 () Bool)

(assert (=> b!11152 (= e!6558 (and tp_is_empty!553 tp!1818))))

(declare-fun b!11153 () Bool)

(declare-fun tail!50 (List!333) List!333)

(assert (=> b!11153 (= e!6557 (forall!56 (tail!50 kvs!4) p!216))))

(declare-fun b!11150 () Bool)

(declare-fun res!9316 () Bool)

(assert (=> b!11150 (=> (not res!9316) (not e!6560))))

(assert (=> b!11150 (= res!9316 (forall!56 kvs!4 p!216))))

(declare-fun res!9319 () Bool)

(assert (=> start!1452 (=> (not res!9319) (not e!6560))))

(assert (=> start!1452 (= res!9319 (forall!56 (toList!189 lm!227) p!216))))

(assert (=> start!1452 e!6560))

(declare-fun inv!550 (ListLongMap!347) Bool)

(assert (=> start!1452 (and (inv!550 lm!227) e!6559)))

(assert (=> start!1452 tp!1820))

(assert (=> start!1452 e!6558))

(assert (= (and start!1452 res!9319) b!11150))

(assert (= (and b!11150 res!9316) b!11148))

(assert (= (and b!11148 res!9318) b!11151))

(assert (= (and b!11151 res!9317) b!11153))

(assert (= start!1452 b!11149))

(get-info :version)

(assert (= (and start!1452 ((_ is Cons!329) kvs!4)) b!11152))

(declare-fun m!7361 () Bool)

(assert (=> b!11151 m!7361))

(declare-fun m!7363 () Bool)

(assert (=> b!11151 m!7363))

(declare-fun m!7365 () Bool)

(assert (=> b!11151 m!7365))

(declare-fun m!7367 () Bool)

(assert (=> b!11151 m!7367))

(declare-fun m!7369 () Bool)

(assert (=> b!11151 m!7369))

(declare-fun m!7371 () Bool)

(assert (=> b!11151 m!7371))

(declare-fun m!7373 () Bool)

(assert (=> b!11153 m!7373))

(assert (=> b!11153 m!7373))

(declare-fun m!7375 () Bool)

(assert (=> b!11153 m!7375))

(declare-fun m!7377 () Bool)

(assert (=> b!11148 m!7377))

(declare-fun m!7379 () Bool)

(assert (=> b!11150 m!7379))

(declare-fun m!7381 () Bool)

(assert (=> start!1452 m!7381))

(declare-fun m!7383 () Bool)

(assert (=> start!1452 m!7383))

(check-sat (not b!11150) (not b!11151) (not b!11148) (not b_next!439) b_and!699 (not b!11149) (not start!1452) tp_is_empty!553 (not b!11153) (not b!11152))
(check-sat b_and!699 (not b_next!439))
(get-model)

(declare-fun d!1333 () Bool)

(declare-fun res!9348 () Bool)

(declare-fun e!6589 () Bool)

(assert (=> d!1333 (=> res!9348 e!6589)))

(assert (=> d!1333 (= res!9348 ((_ is Nil!330) (toList!189 lm!227)))))

(assert (=> d!1333 (= (forall!56 (toList!189 lm!227) p!216) e!6589)))

(declare-fun b!11194 () Bool)

(declare-fun e!6590 () Bool)

(assert (=> b!11194 (= e!6589 e!6590)))

(declare-fun res!9349 () Bool)

(assert (=> b!11194 (=> (not res!9349) (not e!6590))))

(declare-fun dynLambda!67 (Int tuple2!366) Bool)

(assert (=> b!11194 (= res!9349 (dynLambda!67 p!216 (h!895 (toList!189 lm!227))))))

(declare-fun b!11195 () Bool)

(assert (=> b!11195 (= e!6590 (forall!56 (t!2582 (toList!189 lm!227)) p!216))))

(assert (= (and d!1333 (not res!9348)) b!11194))

(assert (= (and b!11194 res!9349) b!11195))

(declare-fun b_lambda!563 () Bool)

(assert (=> (not b_lambda!563) (not b!11194)))

(declare-fun t!2586 () Bool)

(declare-fun tb!249 () Bool)

(assert (=> (and start!1452 (= p!216 p!216) t!2586) tb!249))

(declare-fun result!411 () Bool)

(assert (=> tb!249 (= result!411 true)))

(assert (=> b!11194 t!2586))

(declare-fun b_and!705 () Bool)

(assert (= b_and!699 (and (=> t!2586 result!411) b_and!705)))

(declare-fun m!7433 () Bool)

(assert (=> b!11194 m!7433))

(declare-fun m!7435 () Bool)

(assert (=> b!11195 m!7435))

(assert (=> start!1452 d!1333))

(declare-fun d!1335 () Bool)

(declare-fun isStrictlySorted!39 (List!333) Bool)

(assert (=> d!1335 (= (inv!550 lm!227) (isStrictlySorted!39 (toList!189 lm!227)))))

(declare-fun bs!426 () Bool)

(assert (= bs!426 d!1335))

(declare-fun m!7437 () Bool)

(assert (=> bs!426 m!7437))

(assert (=> start!1452 d!1335))

(declare-fun d!1341 () Bool)

(declare-fun res!9354 () Bool)

(declare-fun e!6595 () Bool)

(assert (=> d!1341 (=> res!9354 e!6595)))

(assert (=> d!1341 (= res!9354 ((_ is Nil!330) (tail!50 kvs!4)))))

(assert (=> d!1341 (= (forall!56 (tail!50 kvs!4) p!216) e!6595)))

(declare-fun b!11200 () Bool)

(declare-fun e!6596 () Bool)

(assert (=> b!11200 (= e!6595 e!6596)))

(declare-fun res!9355 () Bool)

(assert (=> b!11200 (=> (not res!9355) (not e!6596))))

(assert (=> b!11200 (= res!9355 (dynLambda!67 p!216 (h!895 (tail!50 kvs!4))))))

(declare-fun b!11201 () Bool)

(assert (=> b!11201 (= e!6596 (forall!56 (t!2582 (tail!50 kvs!4)) p!216))))

(assert (= (and d!1341 (not res!9354)) b!11200))

(assert (= (and b!11200 res!9355) b!11201))

(declare-fun b_lambda!565 () Bool)

(assert (=> (not b_lambda!565) (not b!11200)))

(declare-fun t!2588 () Bool)

(declare-fun tb!251 () Bool)

(assert (=> (and start!1452 (= p!216 p!216) t!2588) tb!251))

(declare-fun result!413 () Bool)

(assert (=> tb!251 (= result!413 true)))

(assert (=> b!11200 t!2588))

(declare-fun b_and!707 () Bool)

(assert (= b_and!705 (and (=> t!2588 result!413) b_and!707)))

(declare-fun m!7439 () Bool)

(assert (=> b!11200 m!7439))

(declare-fun m!7441 () Bool)

(assert (=> b!11201 m!7441))

(assert (=> b!11153 d!1341))

(declare-fun d!1343 () Bool)

(assert (=> d!1343 (= (tail!50 kvs!4) (t!2582 kvs!4))))

(assert (=> b!11153 d!1343))

(declare-fun d!1345 () Bool)

(assert (=> d!1345 (= (isEmpty!63 kvs!4) ((_ is Nil!330) kvs!4))))

(assert (=> b!11148 d!1345))

(declare-fun d!1347 () Bool)

(declare-fun res!9364 () Bool)

(declare-fun e!6605 () Bool)

(assert (=> d!1347 (=> res!9364 e!6605)))

(assert (=> d!1347 (= res!9364 ((_ is Nil!330) kvs!4))))

(assert (=> d!1347 (= (forall!56 kvs!4 p!216) e!6605)))

(declare-fun b!11210 () Bool)

(declare-fun e!6606 () Bool)

(assert (=> b!11210 (= e!6605 e!6606)))

(declare-fun res!9365 () Bool)

(assert (=> b!11210 (=> (not res!9365) (not e!6606))))

(assert (=> b!11210 (= res!9365 (dynLambda!67 p!216 (h!895 kvs!4)))))

(declare-fun b!11211 () Bool)

(assert (=> b!11211 (= e!6606 (forall!56 (t!2582 kvs!4) p!216))))

(assert (= (and d!1347 (not res!9364)) b!11210))

(assert (= (and b!11210 res!9365) b!11211))

(declare-fun b_lambda!571 () Bool)

(assert (=> (not b_lambda!571) (not b!11210)))

(declare-fun t!2594 () Bool)

(declare-fun tb!257 () Bool)

(assert (=> (and start!1452 (= p!216 p!216) t!2594) tb!257))

(declare-fun result!419 () Bool)

(assert (=> tb!257 (= result!419 true)))

(assert (=> b!11210 t!2594))

(declare-fun b_and!713 () Bool)

(assert (= b_and!707 (and (=> t!2594 result!419) b_and!713)))

(declare-fun m!7451 () Bool)

(assert (=> b!11210 m!7451))

(declare-fun m!7453 () Bool)

(assert (=> b!11211 m!7453))

(assert (=> b!11150 d!1347))

(declare-fun d!1353 () Bool)

(declare-fun res!9370 () Bool)

(declare-fun e!6611 () Bool)

(assert (=> d!1353 (=> res!9370 e!6611)))

(assert (=> d!1353 (= res!9370 ((_ is Nil!330) (toList!189 (+!23 lm!227 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765))))))))

(assert (=> d!1353 (= (forall!56 (toList!189 (+!23 lm!227 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765)))) p!216) e!6611)))

(declare-fun b!11216 () Bool)

(declare-fun e!6612 () Bool)

(assert (=> b!11216 (= e!6611 e!6612)))

(declare-fun res!9371 () Bool)

(assert (=> b!11216 (=> (not res!9371) (not e!6612))))

(assert (=> b!11216 (= res!9371 (dynLambda!67 p!216 (h!895 (toList!189 (+!23 lm!227 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765)))))))))

(declare-fun b!11217 () Bool)

(assert (=> b!11217 (= e!6612 (forall!56 (t!2582 (toList!189 (+!23 lm!227 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765))))) p!216))))

(assert (= (and d!1353 (not res!9370)) b!11216))

(assert (= (and b!11216 res!9371) b!11217))

(declare-fun b_lambda!577 () Bool)

(assert (=> (not b_lambda!577) (not b!11216)))

(declare-fun t!2600 () Bool)

(declare-fun tb!263 () Bool)

(assert (=> (and start!1452 (= p!216 p!216) t!2600) tb!263))

(declare-fun result!425 () Bool)

(assert (=> tb!263 (= result!425 true)))

(assert (=> b!11216 t!2600))

(declare-fun b_and!719 () Bool)

(assert (= b_and!713 (and (=> t!2600 result!425) b_and!719)))

(declare-fun m!7461 () Bool)

(assert (=> b!11216 m!7461))

(declare-fun m!7465 () Bool)

(assert (=> b!11217 m!7465))

(assert (=> b!11151 d!1353))

(declare-fun d!1361 () Bool)

(assert (=> d!1361 (forall!56 (toList!189 (+!23 lm!227 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765)))) p!216)))

(declare-fun lt!2781 () Unit!241)

(declare-fun choose!152 (ListLongMap!347 Int (_ BitVec 64) B!380) Unit!241)

(assert (=> d!1361 (= lt!2781 (choose!152 lm!227 p!216 (_1!183 lt!2765) (_2!183 lt!2765)))))

(declare-fun e!6617 () Bool)

(assert (=> d!1361 e!6617))

(declare-fun res!9376 () Bool)

(assert (=> d!1361 (=> (not res!9376) (not e!6617))))

(assert (=> d!1361 (= res!9376 (forall!56 (toList!189 lm!227) p!216))))

(assert (=> d!1361 (= (addValidProp!11 lm!227 p!216 (_1!183 lt!2765) (_2!183 lt!2765)) lt!2781)))

(declare-fun b!11223 () Bool)

(assert (=> b!11223 (= e!6617 (dynLambda!67 p!216 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765))))))

(assert (= (and d!1361 res!9376) b!11223))

(declare-fun b_lambda!581 () Bool)

(assert (=> (not b_lambda!581) (not b!11223)))

(declare-fun t!2604 () Bool)

(declare-fun tb!267 () Bool)

(assert (=> (and start!1452 (= p!216 p!216) t!2604) tb!267))

(declare-fun result!429 () Bool)

(assert (=> tb!267 (= result!429 true)))

(assert (=> b!11223 t!2604))

(declare-fun b_and!723 () Bool)

(assert (= b_and!719 (and (=> t!2604 result!429) b_and!723)))

(assert (=> d!1361 m!7369))

(assert (=> d!1361 m!7367))

(declare-fun m!7475 () Bool)

(assert (=> d!1361 m!7475))

(assert (=> d!1361 m!7381))

(declare-fun m!7477 () Bool)

(assert (=> b!11223 m!7477))

(assert (=> b!11151 d!1361))

(declare-fun d!1373 () Bool)

(declare-fun e!6630 () Bool)

(assert (=> d!1373 e!6630))

(declare-fun res!9395 () Bool)

(assert (=> d!1373 (=> (not res!9395) (not e!6630))))

(declare-fun lt!2807 () ListLongMap!347)

(declare-fun contains!153 (ListLongMap!347 (_ BitVec 64)) Bool)

(assert (=> d!1373 (= res!9395 (contains!153 lt!2807 (_1!183 lt!2765)))))

(declare-fun lt!2806 () List!333)

(assert (=> d!1373 (= lt!2807 (ListLongMap!348 lt!2806))))

(declare-fun lt!2808 () Unit!241)

(declare-fun lt!2805 () Unit!241)

(assert (=> d!1373 (= lt!2808 lt!2805)))

(declare-datatypes ((Option!30 0))(
  ( (Some!29 (v!1344 B!380)) (None!28) )
))
(declare-fun getValueByKey!24 (List!333 (_ BitVec 64)) Option!30)

(assert (=> d!1373 (= (getValueByKey!24 lt!2806 (_1!183 lt!2765)) (Some!29 (_2!183 lt!2765)))))

(declare-fun lemmaContainsTupThenGetReturnValue!8 (List!333 (_ BitVec 64) B!380) Unit!241)

(assert (=> d!1373 (= lt!2805 (lemmaContainsTupThenGetReturnValue!8 lt!2806 (_1!183 lt!2765) (_2!183 lt!2765)))))

(declare-fun insertStrictlySorted!8 (List!333 (_ BitVec 64) B!380) List!333)

(assert (=> d!1373 (= lt!2806 (insertStrictlySorted!8 (toList!189 lm!227) (_1!183 lt!2765) (_2!183 lt!2765)))))

(assert (=> d!1373 (= (+!23 lm!227 lt!2765) lt!2807)))

(declare-fun b!11242 () Bool)

(declare-fun res!9394 () Bool)

(assert (=> b!11242 (=> (not res!9394) (not e!6630))))

(assert (=> b!11242 (= res!9394 (= (getValueByKey!24 (toList!189 lt!2807) (_1!183 lt!2765)) (Some!29 (_2!183 lt!2765))))))

(declare-fun b!11243 () Bool)

(declare-fun contains!154 (List!333 tuple2!366) Bool)

(assert (=> b!11243 (= e!6630 (contains!154 (toList!189 lt!2807) lt!2765))))

(assert (= (and d!1373 res!9395) b!11242))

(assert (= (and b!11242 res!9394) b!11243))

(declare-fun m!7503 () Bool)

(assert (=> d!1373 m!7503))

(declare-fun m!7505 () Bool)

(assert (=> d!1373 m!7505))

(declare-fun m!7507 () Bool)

(assert (=> d!1373 m!7507))

(declare-fun m!7509 () Bool)

(assert (=> d!1373 m!7509))

(declare-fun m!7511 () Bool)

(assert (=> b!11242 m!7511))

(declare-fun m!7513 () Bool)

(assert (=> b!11243 m!7513))

(assert (=> b!11151 d!1373))

(declare-fun d!1385 () Bool)

(assert (=> d!1385 (= (head!770 kvs!4) (h!895 kvs!4))))

(assert (=> b!11151 d!1385))

(declare-fun d!1387 () Bool)

(declare-fun e!6631 () Bool)

(assert (=> d!1387 e!6631))

(declare-fun res!9397 () Bool)

(assert (=> d!1387 (=> (not res!9397) (not e!6631))))

(declare-fun lt!2811 () ListLongMap!347)

(assert (=> d!1387 (= res!9397 (contains!153 lt!2811 (_1!183 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765)))))))

(declare-fun lt!2810 () List!333)

(assert (=> d!1387 (= lt!2811 (ListLongMap!348 lt!2810))))

(declare-fun lt!2812 () Unit!241)

(declare-fun lt!2809 () Unit!241)

(assert (=> d!1387 (= lt!2812 lt!2809)))

(assert (=> d!1387 (= (getValueByKey!24 lt!2810 (_1!183 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765)))) (Some!29 (_2!183 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765)))))))

(assert (=> d!1387 (= lt!2809 (lemmaContainsTupThenGetReturnValue!8 lt!2810 (_1!183 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765))) (_2!183 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765)))))))

(assert (=> d!1387 (= lt!2810 (insertStrictlySorted!8 (toList!189 lm!227) (_1!183 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765))) (_2!183 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765)))))))

(assert (=> d!1387 (= (+!23 lm!227 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765))) lt!2811)))

(declare-fun b!11244 () Bool)

(declare-fun res!9396 () Bool)

(assert (=> b!11244 (=> (not res!9396) (not e!6631))))

(assert (=> b!11244 (= res!9396 (= (getValueByKey!24 (toList!189 lt!2811) (_1!183 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765)))) (Some!29 (_2!183 (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765))))))))

(declare-fun b!11245 () Bool)

(assert (=> b!11245 (= e!6631 (contains!154 (toList!189 lt!2811) (tuple2!367 (_1!183 lt!2765) (_2!183 lt!2765))))))

(assert (= (and d!1387 res!9397) b!11244))

(assert (= (and b!11244 res!9396) b!11245))

(declare-fun m!7515 () Bool)

(assert (=> d!1387 m!7515))

(declare-fun m!7517 () Bool)

(assert (=> d!1387 m!7517))

(declare-fun m!7519 () Bool)

(assert (=> d!1387 m!7519))

(declare-fun m!7521 () Bool)

(assert (=> d!1387 m!7521))

(declare-fun m!7523 () Bool)

(assert (=> b!11244 m!7523))

(declare-fun m!7525 () Bool)

(assert (=> b!11245 m!7525))

(assert (=> b!11151 d!1387))

(declare-fun d!1389 () Bool)

(declare-fun res!9400 () Bool)

(declare-fun e!6634 () Bool)

(assert (=> d!1389 (=> res!9400 e!6634)))

(assert (=> d!1389 (= res!9400 ((_ is Nil!330) (toList!189 (+!23 lm!227 lt!2765))))))

(assert (=> d!1389 (= (forall!56 (toList!189 (+!23 lm!227 lt!2765)) p!216) e!6634)))

(declare-fun b!11249 () Bool)

(declare-fun e!6635 () Bool)

(assert (=> b!11249 (= e!6634 e!6635)))

(declare-fun res!9401 () Bool)

(assert (=> b!11249 (=> (not res!9401) (not e!6635))))

(assert (=> b!11249 (= res!9401 (dynLambda!67 p!216 (h!895 (toList!189 (+!23 lm!227 lt!2765)))))))

(declare-fun b!11250 () Bool)

(assert (=> b!11250 (= e!6635 (forall!56 (t!2582 (toList!189 (+!23 lm!227 lt!2765))) p!216))))

(assert (= (and d!1389 (not res!9400)) b!11249))

(assert (= (and b!11249 res!9401) b!11250))

(declare-fun b_lambda!589 () Bool)

(assert (=> (not b_lambda!589) (not b!11249)))

(declare-fun t!2612 () Bool)

(declare-fun tb!275 () Bool)

(assert (=> (and start!1452 (= p!216 p!216) t!2612) tb!275))

(declare-fun result!437 () Bool)

(assert (=> tb!275 (= result!437 true)))

(assert (=> b!11249 t!2612))

(declare-fun b_and!731 () Bool)

(assert (= b_and!723 (and (=> t!2612 result!437) b_and!731)))

(declare-fun m!7527 () Bool)

(assert (=> b!11249 m!7527))

(declare-fun m!7529 () Bool)

(assert (=> b!11250 m!7529))

(assert (=> b!11151 d!1389))

(declare-fun b!11260 () Bool)

(declare-fun e!6641 () Bool)

(declare-fun tp!1841 () Bool)

(assert (=> b!11260 (= e!6641 (and tp_is_empty!553 tp!1841))))

(assert (=> b!11149 (= tp!1819 e!6641)))

(assert (= (and b!11149 ((_ is Cons!329) (toList!189 lm!227))) b!11260))

(declare-fun b!11261 () Bool)

(declare-fun e!6642 () Bool)

(declare-fun tp!1842 () Bool)

(assert (=> b!11261 (= e!6642 (and tp_is_empty!553 tp!1842))))

(assert (=> b!11152 (= tp!1818 e!6642)))

(assert (= (and b!11152 ((_ is Cons!329) (t!2582 kvs!4))) b!11261))

(declare-fun b_lambda!593 () Bool)

(assert (= b_lambda!571 (or (and start!1452 b_free!439) b_lambda!593)))

(declare-fun b_lambda!595 () Bool)

(assert (= b_lambda!581 (or (and start!1452 b_free!439) b_lambda!595)))

(declare-fun b_lambda!597 () Bool)

(assert (= b_lambda!565 (or (and start!1452 b_free!439) b_lambda!597)))

(declare-fun b_lambda!599 () Bool)

(assert (= b_lambda!589 (or (and start!1452 b_free!439) b_lambda!599)))

(declare-fun b_lambda!601 () Bool)

(assert (= b_lambda!563 (or (and start!1452 b_free!439) b_lambda!601)))

(declare-fun b_lambda!603 () Bool)

(assert (= b_lambda!577 (or (and start!1452 b_free!439) b_lambda!603)))

(check-sat (not b_lambda!593) (not b!11250) (not b!11217) (not b!11242) (not b!11245) (not d!1373) (not b!11244) (not b!11243) (not d!1335) (not b!11195) (not d!1387) (not d!1361) tp_is_empty!553 (not b_lambda!599) (not b_lambda!595) (not b_lambda!603) (not b_lambda!601) (not b!11260) (not b_next!439) (not b!11201) b_and!731 (not b!11261) (not b_lambda!597) (not b!11211))
(check-sat b_and!731 (not b_next!439))
