; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1452 () Bool)

(assert start!1452)

(declare-fun b_free!439 () Bool)

(declare-fun b_next!439 () Bool)

(assert (=> start!1452 (= b_free!439 (not b_next!439))))

(declare-fun tp!1819 () Bool)

(declare-fun b_and!699 () Bool)

(assert (=> start!1452 (= tp!1819 b_and!699)))

(declare-fun b!11148 () Bool)

(declare-fun e!6560 () Bool)

(declare-fun e!6559 () Bool)

(assert (=> b!11148 (= e!6560 (not e!6559))))

(declare-fun res!9316 () Bool)

(assert (=> b!11148 (=> (not res!9316) (not e!6559))))

(declare-datatypes ((B!380 0))(
  ( (B!381 (val!285 Int)) )
))
(declare-datatypes ((tuple2!370 0))(
  ( (tuple2!371 (_1!185 (_ BitVec 64)) (_2!185 B!380)) )
))
(declare-fun lt!2765 () tuple2!370)

(declare-datatypes ((List!337 0))(
  ( (Nil!334) (Cons!333 (h!899 tuple2!370) (t!2586 List!337)) )
))
(declare-datatypes ((ListLongMap!351 0))(
  ( (ListLongMap!352 (toList!191 List!337)) )
))
(declare-fun lm!227 () ListLongMap!351)

(declare-fun p!216 () Int)

(declare-fun forall!56 (List!337 Int) Bool)

(declare-fun +!23 (ListLongMap!351 tuple2!370) ListLongMap!351)

(assert (=> b!11148 (= res!9316 (forall!56 (toList!191 (+!23 lm!227 lt!2765)) p!216))))

(assert (=> b!11148 (forall!56 (toList!191 (+!23 lm!227 (tuple2!371 (_1!185 lt!2765) (_2!185 lt!2765)))) p!216)))

(declare-datatypes ((Unit!231 0))(
  ( (Unit!232) )
))
(declare-fun lt!2766 () Unit!231)

(declare-fun addValidProp!11 (ListLongMap!351 Int (_ BitVec 64) B!380) Unit!231)

(assert (=> b!11148 (= lt!2766 (addValidProp!11 lm!227 p!216 (_1!185 lt!2765) (_2!185 lt!2765)))))

(declare-fun kvs!4 () List!337)

(declare-fun head!770 (List!337) tuple2!370)

(assert (=> b!11148 (= lt!2765 (head!770 kvs!4))))

(declare-fun res!9317 () Bool)

(assert (=> start!1452 (=> (not res!9317) (not e!6560))))

(assert (=> start!1452 (= res!9317 (forall!56 (toList!191 lm!227) p!216))))

(assert (=> start!1452 e!6560))

(declare-fun e!6558 () Bool)

(declare-fun inv!550 (ListLongMap!351) Bool)

(assert (=> start!1452 (and (inv!550 lm!227) e!6558)))

(assert (=> start!1452 tp!1819))

(declare-fun e!6557 () Bool)

(assert (=> start!1452 e!6557))

(declare-fun b!11149 () Bool)

(declare-fun tp!1818 () Bool)

(assert (=> b!11149 (= e!6558 tp!1818)))

(declare-fun b!11150 () Bool)

(declare-fun tp_is_empty!553 () Bool)

(declare-fun tp!1820 () Bool)

(assert (=> b!11150 (= e!6557 (and tp_is_empty!553 tp!1820))))

(declare-fun b!11151 () Bool)

(declare-fun res!9318 () Bool)

(assert (=> b!11151 (=> (not res!9318) (not e!6560))))

(declare-fun isEmpty!63 (List!337) Bool)

(assert (=> b!11151 (= res!9318 (not (isEmpty!63 kvs!4)))))

(declare-fun b!11152 () Bool)

(declare-fun res!9319 () Bool)

(assert (=> b!11152 (=> (not res!9319) (not e!6560))))

(assert (=> b!11152 (= res!9319 (forall!56 kvs!4 p!216))))

(declare-fun b!11153 () Bool)

(declare-fun tail!50 (List!337) List!337)

(assert (=> b!11153 (= e!6559 (forall!56 (tail!50 kvs!4) p!216))))

(assert (= (and start!1452 res!9317) b!11152))

(assert (= (and b!11152 res!9319) b!11151))

(assert (= (and b!11151 res!9318) b!11148))

(assert (= (and b!11148 res!9316) b!11153))

(assert (= start!1452 b!11149))

(assert (= (and start!1452 (is-Cons!333 kvs!4)) b!11150))

(declare-fun m!7361 () Bool)

(assert (=> b!11148 m!7361))

(declare-fun m!7363 () Bool)

(assert (=> b!11148 m!7363))

(declare-fun m!7365 () Bool)

(assert (=> b!11148 m!7365))

(declare-fun m!7367 () Bool)

(assert (=> b!11148 m!7367))

(declare-fun m!7369 () Bool)

(assert (=> b!11148 m!7369))

(declare-fun m!7371 () Bool)

(assert (=> b!11148 m!7371))

(declare-fun m!7373 () Bool)

(assert (=> start!1452 m!7373))

(declare-fun m!7375 () Bool)

(assert (=> start!1452 m!7375))

(declare-fun m!7377 () Bool)

(assert (=> b!11153 m!7377))

(assert (=> b!11153 m!7377))

(declare-fun m!7379 () Bool)

(assert (=> b!11153 m!7379))

(declare-fun m!7381 () Bool)

(assert (=> b!11152 m!7381))

(declare-fun m!7383 () Bool)

(assert (=> b!11151 m!7383))

(push 1)

(assert (not b!11153))

(assert (not b!11151))

(assert (not b!11152))

(assert (not start!1452))

(assert tp_is_empty!553)

(assert (not b_next!439))

(assert b_and!699)

(assert (not b!11150))

(assert (not b!11149))

(assert (not b!11148))

(check-sat)

(pop 1)

(push 1)

(assert b_and!699)

(assert (not b_next!439))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1337 () Bool)

(assert (=> d!1337 (forall!56 (toList!191 (+!23 lm!227 (tuple2!371 (_1!185 lt!2765) (_2!185 lt!2765)))) p!216)))

(declare-fun lt!2781 () Unit!231)

(declare-fun choose!153 (ListLongMap!351 Int (_ BitVec 64) B!380) Unit!231)

(assert (=> d!1337 (= lt!2781 (choose!153 lm!227 p!216 (_1!185 lt!2765) (_2!185 lt!2765)))))

(declare-fun e!6603 () Bool)

(assert (=> d!1337 e!6603))

(declare-fun res!9362 () Bool)

(assert (=> d!1337 (=> (not res!9362) (not e!6603))))

(assert (=> d!1337 (= res!9362 (forall!56 (toList!191 lm!227) p!216))))

(assert (=> d!1337 (= (addValidProp!11 lm!227 p!216 (_1!185 lt!2765) (_2!185 lt!2765)) lt!2781)))

(declare-fun b!11209 () Bool)

(declare-fun dynLambda!69 (Int tuple2!370) Bool)

(assert (=> b!11209 (= e!6603 (dynLambda!69 p!216 (tuple2!371 (_1!185 lt!2765) (_2!185 lt!2765))))))

(assert (= (and d!1337 res!9362) b!11209))

(declare-fun b_lambda!571 () Bool)

(assert (=> (not b_lambda!571) (not b!11209)))

(declare-fun t!2598 () Bool)

(declare-fun tb!257 () Bool)

(assert (=> (and start!1452 (= p!216 p!216) t!2598) tb!257))

(declare-fun result!419 () Bool)

(assert (=> tb!257 (= result!419 true)))

(assert (=> b!11209 t!2598))

(declare-fun b_and!713 () Bool)

(assert (= b_and!699 (and (=> t!2598 result!419) b_and!713)))

(assert (=> d!1337 m!7365))

(assert (=> d!1337 m!7363))

(declare-fun m!7453 () Bool)

(assert (=> d!1337 m!7453))

(assert (=> d!1337 m!7373))

(declare-fun m!7455 () Bool)

(assert (=> b!11209 m!7455))

(assert (=> b!11148 d!1337))

(declare-fun d!1355 () Bool)

(assert (=> d!1355 (= (head!770 kvs!4) (h!899 kvs!4))))

(assert (=> b!11148 d!1355))

(declare-fun d!1357 () Bool)

(declare-fun res!9370 () Bool)

(declare-fun e!6611 () Bool)

(assert (=> d!1357 (=> res!9370 e!6611)))

(assert (=> d!1357 (= res!9370 (is-Nil!334 (toList!191 (+!23 lm!227 lt!2765))))))

(assert (=> d!1357 (= (forall!56 (toList!191 (+!23 lm!227 lt!2765)) p!216) e!6611)))

(declare-fun b!11218 () Bool)

(declare-fun e!6612 () Bool)

(assert (=> b!11218 (= e!6611 e!6612)))

(declare-fun res!9371 () Bool)

(assert (=> b!11218 (=> (not res!9371) (not e!6612))))

(assert (=> b!11218 (= res!9371 (dynLambda!69 p!216 (h!899 (toList!191 (+!23 lm!227 lt!2765)))))))

(declare-fun b!11219 () Bool)

(assert (=> b!11219 (= e!6612 (forall!56 (t!2586 (toList!191 (+!23 lm!227 lt!2765))) p!216))))

(assert (= (and d!1357 (not res!9370)) b!11218))

(assert (= (and b!11218 res!9371) b!11219))

(declare-fun b_lambda!575 () Bool)

(assert (=> (not b_lambda!575) (not b!11218)))

(declare-fun t!2602 () Bool)

(declare-fun tb!261 () Bool)

(assert (=> (and start!1452 (= p!216 p!216) t!2602) tb!261))

(declare-fun result!423 () Bool)

(assert (=> tb!261 (= result!423 true)))

(assert (=> b!11218 t!2602))

(declare-fun b_and!717 () Bool)

(assert (= b_and!713 (and (=> t!2602 result!423) b_and!717)))

(declare-fun m!7459 () Bool)

(assert (=> b!11218 m!7459))

(declare-fun m!7463 () Bool)

(assert (=> b!11219 m!7463))

(assert (=> b!11148 d!1357))

(declare-fun d!1361 () Bool)

(declare-fun e!6623 () Bool)

(assert (=> d!1361 e!6623))

(declare-fun res!9387 () Bool)

(assert (=> d!1361 (=> (not res!9387) (not e!6623))))

(declare-fun lt!2818 () ListLongMap!351)

(declare-fun contains!153 (ListLongMap!351 (_ BitVec 64)) Bool)

(assert (=> d!1361 (= res!9387 (contains!153 lt!2818 (_1!185 lt!2765)))))

(declare-fun lt!2816 () List!337)

(assert (=> d!1361 (= lt!2818 (ListLongMap!352 lt!2816))))

(declare-fun lt!2817 () Unit!231)

(declare-fun lt!2819 () Unit!231)

(assert (=> d!1361 (= lt!2817 lt!2819)))

(declare-datatypes ((Option!29 0))(
  ( (Some!28 (v!1343 B!380)) (None!27) )
))
(declare-fun getValueByKey!23 (List!337 (_ BitVec 64)) Option!29)

(assert (=> d!1361 (= (getValueByKey!23 lt!2816 (_1!185 lt!2765)) (Some!28 (_2!185 lt!2765)))))

(declare-fun lemmaContainsTupThenGetReturnValue!7 (List!337 (_ BitVec 64) B!380) Unit!231)

(assert (=> d!1361 (= lt!2819 (lemmaContainsTupThenGetReturnValue!7 lt!2816 (_1!185 lt!2765) (_2!185 lt!2765)))))

(declare-fun insertStrictlySorted!7 (List!337 (_ BitVec 64) B!380) List!337)

(assert (=> d!1361 (= lt!2816 (insertStrictlySorted!7 (toList!191 lm!227) (_1!185 lt!2765) (_2!185 lt!2765)))))

(assert (=> d!1361 (= (+!23 lm!227 lt!2765) lt!2818)))

(declare-fun b!11234 () Bool)

(declare-fun res!9388 () Bool)

(assert (=> b!11234 (=> (not res!9388) (not e!6623))))

(assert (=> b!11234 (= res!9388 (= (getValueByKey!23 (toList!191 lt!2818) (_1!185 lt!2765)) (Some!28 (_2!185 lt!2765))))))

(declare-fun b!11235 () Bool)

(declare-fun contains!155 (List!337 tuple2!370) Bool)

(assert (=> b!11235 (= e!6623 (contains!155 (toList!191 lt!2818) lt!2765))))

(assert (= (and d!1361 res!9387) b!11234))

(assert (= (and b!11234 res!9388) b!11235))

(declare-fun m!7471 () Bool)

(assert (=> d!1361 m!7471))

(declare-fun m!7475 () Bool)

(assert (=> d!1361 m!7475))

(declare-fun m!7479 () Bool)

(assert (=> d!1361 m!7479))

(declare-fun m!7483 () Bool)

(assert (=> d!1361 m!7483))

(declare-fun m!7487 () Bool)

(assert (=> b!11234 m!7487))

(declare-fun m!7491 () Bool)

(assert (=> b!11235 m!7491))

(assert (=> b!11148 d!1361))

(declare-fun d!1367 () Bool)

(declare-fun res!9393 () Bool)

(declare-fun e!6625 () Bool)

(assert (=> d!1367 (=> res!9393 e!6625)))

(assert (=> d!1367 (= res!9393 (is-Nil!334 (toList!191 (+!23 lm!227 (tuple2!371 (_1!185 lt!2765) (_2!185 lt!2765))))))))

(assert (=> d!1367 (= (forall!56 (toList!191 (+!23 lm!227 (tuple2!371 (_1!185 lt!2765) (_2!185 lt!2765)))) p!216) e!6625)))

(declare-fun b!11242 () Bool)

(declare-fun e!6626 () Bool)

(assert (=> b!11242 (= e!6625 e!6626)))

(declare-fun res!9394 () Bool)

(assert (=> b!11242 (=> (not res!9394) (not e!6626))))

(assert (=> b!11242 (= res!9394 (dynLambda!69 p!216 (h!899 (toList!191 (+!23 lm!227 (tuple2!371 (_1!185 lt!2765) (_2!185 lt!2765)))))))))

(declare-fun b!11243 () Bool)

(assert (=> b!11243 (= e!6626 (forall!56 (t!2586 (toList!191 (+!23 lm!227 (tuple2!371 (_1!185 lt!2765) (_2!185 lt!2765))))) p!216))))

(assert (= (and d!1367 (not res!9393)) b!11242))

(assert (= (and b!11242 res!9394) b!11243))

(declare-fun b_lambda!579 () Bool)

(assert (=> (not b_lambda!579) (not b!11242)))

(declare-fun t!2606 () Bool)

(declare-fun tb!265 () Bool)

(assert (=> (and start!1452 (= p!216 p!216) t!2606) tb!265))

(declare-fun result!427 () Bool)

(assert (=> tb!265 (= result!427 true)))

(assert (=> b!11242 t!2606))

(declare-fun b_and!721 () Bool)

(assert (= b_and!717 (and (=> t!2606 result!427) b_and!721)))

(declare-fun m!7505 () Bool)

(assert (=> b!11242 m!7505))

(declare-fun m!7507 () Bool)

(assert (=> b!11243 m!7507))

(assert (=> b!11148 d!1367))

(declare-fun d!1371 () Bool)

(declare-fun e!6629 () Bool)

(assert (=> d!1371 e!6629))

(declare-fun res!9397 () Bool)

(assert (=> d!1371 (=> (not res!9397) (not e!6629))))

(declare-fun lt!2826 () ListLongMap!351)

(assert (=> d!1371 (= res!9397 (contains!153 lt!2826 (_1!185 (tuple2!371 (_1!185 lt!2765) (_2!185 lt!2765)))))))

(declare-fun lt!2824 () List!337)

(assert (=> d!1371 (= lt!2826 (ListLongMap!352 lt!2824))))

(declare-fun lt!2825 () Unit!231)

(declare-fun lt!2827 () Unit!231)

(assert (=> d!1371 (= lt!2825 lt!2827)))

(assert (=> d!1371 (= (getValueByKey!23 lt!2824 (_1!185 (tuple2!371 (_1!185 lt!2765) (_2!185 lt!2765)))) (Some!28 (_2!185 (tuple2!371 (_1!185 lt!2765) (_2!185 lt!2765)))))))

(assert (=> d!1371 (= lt!2827 (lemmaContainsTupThenGetReturnValue!7 lt!2824 (_1!185 (tuple2!371 (_1!185 lt!2765) (_2!185 lt!2765))) (_2!185 (tuple2!371 (_1!185 lt!2765) (_2!185 lt!2765)))))))

(assert (=> d!1371 (= lt!2824 (insertStrictlySorted!7 (toList!191 lm!227) (_1!185 (tuple2!371 (_1!185 lt!2765) (_2!185 lt!2765))) (_2!185 (tuple2!371 (_1!185 lt!2765) (_2!185 lt!2765)))))))

(assert (=> d!1371 (= (+!23 lm!227 (tuple2!371 (_1!185 lt!2765) (_2!185 lt!2765))) lt!2826)))

(declare-fun b!11246 () Bool)

(declare-fun res!9398 () Bool)

(assert (=> b!11246 (=> (not res!9398) (not e!6629))))

(assert (=> b!11246 (= res!9398 (= (getValueByKey!23 (toList!191 lt!2826) (_1!185 (tuple2!371 (_1!185 lt!2765) (_2!185 lt!2765)))) (Some!28 (_2!185 (tuple2!371 (_1!185 lt!2765) (_2!185 lt!2765))))))))

(declare-fun b!11247 () Bool)

(assert (=> b!11247 (= e!6629 (contains!155 (toList!191 lt!2826) (tuple2!371 (_1!185 lt!2765) (_2!185 lt!2765))))))

(assert (= (and d!1371 res!9397) b!11246))

(assert (= (and b!11246 res!9398) b!11247))

(declare-fun m!7509 () Bool)

(assert (=> d!1371 m!7509))

(declare-fun m!7511 () Bool)

(assert (=> d!1371 m!7511))

(declare-fun m!7513 () Bool)

(assert (=> d!1371 m!7513))

(declare-fun m!7519 () Bool)

(assert (=> d!1371 m!7519))

(declare-fun m!7525 () Bool)

(assert (=> b!11246 m!7525))

(declare-fun m!7529 () Bool)

(assert (=> b!11247 m!7529))

(assert (=> b!11148 d!1371))

(declare-fun d!1375 () Bool)

(assert (=> d!1375 (= (isEmpty!63 kvs!4) (is-Nil!334 kvs!4))))

(assert (=> b!11151 d!1375))

(declare-fun d!1379 () Bool)

(declare-fun res!9405 () Bool)

(declare-fun e!6635 () Bool)

(assert (=> d!1379 (=> res!9405 e!6635)))

(assert (=> d!1379 (= res!9405 (is-Nil!334 kvs!4))))

(assert (=> d!1379 (= (forall!56 kvs!4 p!216) e!6635)))

(declare-fun b!11254 () Bool)

(declare-fun e!6636 () Bool)

(assert (=> b!11254 (= e!6635 e!6636)))

(declare-fun res!9406 () Bool)

(assert (=> b!11254 (=> (not res!9406) (not e!6636))))

(assert (=> b!11254 (= res!9406 (dynLambda!69 p!216 (h!899 kvs!4)))))

(declare-fun b!11255 () Bool)

(assert (=> b!11255 (= e!6636 (forall!56 (t!2586 kvs!4) p!216))))

(assert (= (and d!1379 (not res!9405)) b!11254))

(assert (= (and b!11254 res!9406) b!11255))

(declare-fun b_lambda!587 () Bool)

(assert (=> (not b_lambda!587) (not b!11254)))

(declare-fun t!2614 () Bool)

(declare-fun tb!273 () Bool)

(assert (=> (and start!1452 (= p!216 p!216) t!2614) tb!273))

(declare-fun result!435 () Bool)

(assert (=> tb!273 (= result!435 true)))

(assert (=> b!11254 t!2614))

(declare-fun b_and!729 () Bool)

(assert (= b_and!721 (and (=> t!2614 result!435) b_and!729)))

(declare-fun m!7545 () Bool)

(assert (=> b!11254 m!7545))

(declare-fun m!7547 () Bool)

(assert (=> b!11255 m!7547))

(assert (=> b!11152 d!1379))

(declare-fun d!1387 () Bool)

(declare-fun res!9409 () Bool)

(declare-fun e!6639 () Bool)

(assert (=> d!1387 (=> res!9409 e!6639)))

(assert (=> d!1387 (= res!9409 (is-Nil!334 (toList!191 lm!227)))))

(assert (=> d!1387 (= (forall!56 (toList!191 lm!227) p!216) e!6639)))

(declare-fun b!11258 () Bool)

(declare-fun e!6640 () Bool)

(assert (=> b!11258 (= e!6639 e!6640)))

(declare-fun res!9410 () Bool)

(assert (=> b!11258 (=> (not res!9410) (not e!6640))))

(assert (=> b!11258 (= res!9410 (dynLambda!69 p!216 (h!899 (toList!191 lm!227))))))

(declare-fun b!11259 () Bool)

(assert (=> b!11259 (= e!6640 (forall!56 (t!2586 (toList!191 lm!227)) p!216))))

(assert (= (and d!1387 (not res!9409)) b!11258))

(assert (= (and b!11258 res!9410) b!11259))

(declare-fun b_lambda!591 () Bool)

(assert (=> (not b_lambda!591) (not b!11258)))

(declare-fun t!2618 () Bool)

(declare-fun tb!277 () Bool)

(assert (=> (and start!1452 (= p!216 p!216) t!2618) tb!277))

(declare-fun result!439 () Bool)

(assert (=> tb!277 (= result!439 true)))

(assert (=> b!11258 t!2618))

(declare-fun b_and!733 () Bool)

(assert (= b_and!729 (and (=> t!2618 result!439) b_and!733)))

(declare-fun m!7553 () Bool)

(assert (=> b!11258 m!7553))

(declare-fun m!7555 () Bool)

(assert (=> b!11259 m!7555))

(assert (=> start!1452 d!1387))

(declare-fun d!1393 () Bool)

(declare-fun isStrictlySorted!42 (List!337) Bool)

(assert (=> d!1393 (= (inv!550 lm!227) (isStrictlySorted!42 (toList!191 lm!227)))))

(declare-fun bs!428 () Bool)

(assert (= bs!428 d!1393))

(declare-fun m!7577 () Bool)

(assert (=> bs!428 m!7577))

(assert (=> start!1452 d!1393))

(declare-fun d!1401 () Bool)

(declare-fun res!9417 () Bool)

(declare-fun e!6649 () Bool)

(assert (=> d!1401 (=> res!9417 e!6649)))

(assert (=> d!1401 (= res!9417 (is-Nil!334 (tail!50 kvs!4)))))

(assert (=> d!1401 (= (forall!56 (tail!50 kvs!4) p!216) e!6649)))

(declare-fun b!11271 () Bool)

(declare-fun e!6650 () Bool)

(assert (=> b!11271 (= e!6649 e!6650)))

(declare-fun res!9418 () Bool)

(assert (=> b!11271 (=> (not res!9418) (not e!6650))))

(assert (=> b!11271 (= res!9418 (dynLambda!69 p!216 (h!899 (tail!50 kvs!4))))))

(declare-fun b!11272 () Bool)

(assert (=> b!11272 (= e!6650 (forall!56 (t!2586 (tail!50 kvs!4)) p!216))))

(assert (= (and d!1401 (not res!9417)) b!11271))

(assert (= (and b!11271 res!9418) b!11272))

(declare-fun b_lambda!597 () Bool)

(assert (=> (not b_lambda!597) (not b!11271)))

(declare-fun t!2624 () Bool)

(declare-fun tb!283 () Bool)

(assert (=> (and start!1452 (= p!216 p!216) t!2624) tb!283))

(declare-fun result!449 () Bool)

(assert (=> tb!283 (= result!449 true)))

(assert (=> b!11271 t!2624))

(declare-fun b_and!739 () Bool)

(assert (= b_and!733 (and (=> t!2624 result!449) b_and!739)))

(declare-fun m!7579 () Bool)

(assert (=> b!11271 m!7579))

(declare-fun m!7581 () Bool)

(assert (=> b!11272 m!7581))

(assert (=> b!11153 d!1401))

(declare-fun d!1403 () Bool)

(assert (=> d!1403 (= (tail!50 kvs!4) (t!2586 kvs!4))))

(assert (=> b!11153 d!1403))

(declare-fun b!11284 () Bool)

(declare-fun e!6658 () Bool)

(declare-fun tp!1849 () Bool)

(assert (=> b!11284 (= e!6658 (and tp_is_empty!553 tp!1849))))

(assert (=> b!11149 (= tp!1818 e!6658)))

(assert (= (and b!11149 (is-Cons!333 (toList!191 lm!227))) b!11284))

(declare-fun b!11285 () Bool)

