; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1456 () Bool)

(assert start!1456)

(declare-fun b_free!443 () Bool)

(declare-fun b_next!443 () Bool)

(assert (=> start!1456 (= b_free!443 (not b_next!443))))

(declare-fun tp!1837 () Bool)

(declare-fun b_and!703 () Bool)

(assert (=> start!1456 (= tp!1837 b_and!703)))

(declare-fun res!9342 () Bool)

(declare-fun e!6583 () Bool)

(assert (=> start!1456 (=> (not res!9342) (not e!6583))))

(declare-datatypes ((B!384 0))(
  ( (B!385 (val!287 Int)) )
))
(declare-datatypes ((tuple2!374 0))(
  ( (tuple2!375 (_1!187 (_ BitVec 64)) (_2!187 B!384)) )
))
(declare-datatypes ((List!339 0))(
  ( (Nil!336) (Cons!335 (h!901 tuple2!374) (t!2588 List!339)) )
))
(declare-datatypes ((ListLongMap!355 0))(
  ( (ListLongMap!356 (toList!193 List!339)) )
))
(declare-fun lm!227 () ListLongMap!355)

(declare-fun p!216 () Int)

(declare-fun forall!58 (List!339 Int) Bool)

(assert (=> start!1456 (= res!9342 (forall!58 (toList!193 lm!227) p!216))))

(assert (=> start!1456 e!6583))

(declare-fun e!6581 () Bool)

(declare-fun inv!552 (ListLongMap!355) Bool)

(assert (=> start!1456 (and (inv!552 lm!227) e!6581)))

(assert (=> start!1456 tp!1837))

(declare-fun e!6582 () Bool)

(assert (=> start!1456 e!6582))

(declare-fun b!11184 () Bool)

(declare-fun e!6584 () Bool)

(assert (=> b!11184 (= e!6583 (not e!6584))))

(declare-fun res!9341 () Bool)

(assert (=> b!11184 (=> (not res!9341) (not e!6584))))

(declare-fun lt!2778 () tuple2!374)

(declare-fun +!25 (ListLongMap!355 tuple2!374) ListLongMap!355)

(assert (=> b!11184 (= res!9341 (forall!58 (toList!193 (+!25 lm!227 lt!2778)) p!216))))

(assert (=> b!11184 (forall!58 (toList!193 (+!25 lm!227 (tuple2!375 (_1!187 lt!2778) (_2!187 lt!2778)))) p!216)))

(declare-datatypes ((Unit!235 0))(
  ( (Unit!236) )
))
(declare-fun lt!2777 () Unit!235)

(declare-fun addValidProp!13 (ListLongMap!355 Int (_ BitVec 64) B!384) Unit!235)

(assert (=> b!11184 (= lt!2777 (addValidProp!13 lm!227 p!216 (_1!187 lt!2778) (_2!187 lt!2778)))))

(declare-fun kvs!4 () List!339)

(declare-fun head!772 (List!339) tuple2!374)

(assert (=> b!11184 (= lt!2778 (head!772 kvs!4))))

(declare-fun b!11185 () Bool)

(declare-fun tail!52 (List!339) List!339)

(assert (=> b!11185 (= e!6584 (forall!58 (tail!52 kvs!4) p!216))))

(declare-fun b!11186 () Bool)

(declare-fun res!9343 () Bool)

(assert (=> b!11186 (=> (not res!9343) (not e!6583))))

(assert (=> b!11186 (= res!9343 (forall!58 kvs!4 p!216))))

(declare-fun b!11187 () Bool)

(declare-fun res!9340 () Bool)

(assert (=> b!11187 (=> (not res!9340) (not e!6583))))

(declare-fun isEmpty!65 (List!339) Bool)

(assert (=> b!11187 (= res!9340 (not (isEmpty!65 kvs!4)))))

(declare-fun b!11188 () Bool)

(declare-fun tp_is_empty!557 () Bool)

(declare-fun tp!1838 () Bool)

(assert (=> b!11188 (= e!6582 (and tp_is_empty!557 tp!1838))))

(declare-fun b!11189 () Bool)

(declare-fun tp!1836 () Bool)

(assert (=> b!11189 (= e!6581 tp!1836)))

(assert (= (and start!1456 res!9342) b!11186))

(assert (= (and b!11186 res!9343) b!11187))

(assert (= (and b!11187 res!9340) b!11184))

(assert (= (and b!11184 res!9341) b!11185))

(assert (= start!1456 b!11189))

(assert (= (and start!1456 (is-Cons!335 kvs!4)) b!11188))

(declare-fun m!7409 () Bool)

(assert (=> b!11185 m!7409))

(assert (=> b!11185 m!7409))

(declare-fun m!7411 () Bool)

(assert (=> b!11185 m!7411))

(declare-fun m!7413 () Bool)

(assert (=> b!11186 m!7413))

(declare-fun m!7415 () Bool)

(assert (=> b!11184 m!7415))

(declare-fun m!7417 () Bool)

(assert (=> b!11184 m!7417))

(declare-fun m!7419 () Bool)

(assert (=> b!11184 m!7419))

(declare-fun m!7421 () Bool)

(assert (=> b!11184 m!7421))

(declare-fun m!7423 () Bool)

(assert (=> b!11184 m!7423))

(declare-fun m!7425 () Bool)

(assert (=> b!11184 m!7425))

(declare-fun m!7427 () Bool)

(assert (=> start!1456 m!7427))

(declare-fun m!7429 () Bool)

(assert (=> start!1456 m!7429))

(declare-fun m!7431 () Bool)

(assert (=> b!11187 m!7431))

(push 1)

(assert (not start!1456))

(assert (not b!11187))

(assert b_and!703)

(assert (not b_next!443))

(assert tp_is_empty!557)

(assert (not b!11185))

(assert (not b!11186))

(assert (not b!11184))

(assert (not b!11188))

(assert (not b!11189))

(check-sat)

(pop 1)

(push 1)

(assert b_and!703)

(assert (not b_next!443))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1335 () Bool)

(declare-fun res!9354 () Bool)

(declare-fun e!6595 () Bool)

(assert (=> d!1335 (=> res!9354 e!6595)))

(assert (=> d!1335 (= res!9354 (is-Nil!336 (toList!193 lm!227)))))

(assert (=> d!1335 (= (forall!58 (toList!193 lm!227) p!216) e!6595)))

(declare-fun b!11200 () Bool)

(declare-fun e!6596 () Bool)

(assert (=> b!11200 (= e!6595 e!6596)))

(declare-fun res!9355 () Bool)

(assert (=> b!11200 (=> (not res!9355) (not e!6596))))

(declare-fun dynLambda!68 (Int tuple2!374) Bool)

(assert (=> b!11200 (= res!9355 (dynLambda!68 p!216 (h!901 (toList!193 lm!227))))))

(declare-fun b!11201 () Bool)

(assert (=> b!11201 (= e!6596 (forall!58 (t!2588 (toList!193 lm!227)) p!216))))

(assert (= (and d!1335 (not res!9354)) b!11200))

(assert (= (and b!11200 res!9355) b!11201))

(declare-fun b_lambda!565 () Bool)

(assert (=> (not b_lambda!565) (not b!11200)))

(declare-fun t!2592 () Bool)

(declare-fun tb!251 () Bool)

(assert (=> (and start!1456 (= p!216 p!216) t!2592) tb!251))

(declare-fun result!413 () Bool)

(assert (=> tb!251 (= result!413 true)))

(assert (=> b!11200 t!2592))

(declare-fun b_and!707 () Bool)

(assert (= b_and!703 (and (=> t!2592 result!413) b_and!707)))

(declare-fun m!7437 () Bool)

(assert (=> b!11200 m!7437))

(declare-fun m!7439 () Bool)

(assert (=> b!11201 m!7439))

(assert (=> start!1456 d!1335))

(declare-fun d!1341 () Bool)

(declare-fun isStrictlySorted!40 (List!339) Bool)

(assert (=> d!1341 (= (inv!552 lm!227) (isStrictlySorted!40 (toList!193 lm!227)))))

(declare-fun bs!426 () Bool)

(assert (= bs!426 d!1341))

(declare-fun m!7445 () Bool)

(assert (=> bs!426 m!7445))

(assert (=> start!1456 d!1341))

(declare-fun d!1345 () Bool)

(assert (=> d!1345 (forall!58 (toList!193 (+!25 lm!227 (tuple2!375 (_1!187 lt!2778) (_2!187 lt!2778)))) p!216)))

(declare-fun lt!2784 () Unit!235)

(declare-fun choose!154 (ListLongMap!355 Int (_ BitVec 64) B!384) Unit!235)

(assert (=> d!1345 (= lt!2784 (choose!154 lm!227 p!216 (_1!187 lt!2778) (_2!187 lt!2778)))))

(declare-fun e!6610 () Bool)

(assert (=> d!1345 e!6610))

(declare-fun res!9369 () Bool)

(assert (=> d!1345 (=> (not res!9369) (not e!6610))))

(assert (=> d!1345 (= res!9369 (forall!58 (toList!193 lm!227) p!216))))

(assert (=> d!1345 (= (addValidProp!13 lm!227 p!216 (_1!187 lt!2778) (_2!187 lt!2778)) lt!2784)))

(declare-fun b!11217 () Bool)

(assert (=> b!11217 (= e!6610 (dynLambda!68 p!216 (tuple2!375 (_1!187 lt!2778) (_2!187 lt!2778))))))

(assert (= (and d!1345 res!9369) b!11217))

(declare-fun b_lambda!573 () Bool)

(assert (=> (not b_lambda!573) (not b!11217)))

(declare-fun t!2600 () Bool)

(declare-fun tb!259 () Bool)

(assert (=> (and start!1456 (= p!216 p!216) t!2600) tb!259))

(declare-fun result!421 () Bool)

(assert (=> tb!259 (= result!421 true)))

(assert (=> b!11217 t!2600))

(declare-fun b_and!715 () Bool)

(assert (= b_and!707 (and (=> t!2600 result!421) b_and!715)))

(assert (=> d!1345 m!7419))

(assert (=> d!1345 m!7425))

(declare-fun m!7457 () Bool)

(assert (=> d!1345 m!7457))

(assert (=> d!1345 m!7427))

(declare-fun m!7461 () Bool)

(assert (=> b!11217 m!7461))

(assert (=> b!11184 d!1345))

(declare-fun d!1359 () Bool)

(declare-fun e!6620 () Bool)

(assert (=> d!1359 e!6620))

(declare-fun res!9383 () Bool)

(assert (=> d!1359 (=> (not res!9383) (not e!6620))))

(declare-fun lt!2814 () ListLongMap!355)

(declare-fun contains!154 (ListLongMap!355 (_ BitVec 64)) Bool)

(assert (=> d!1359 (= res!9383 (contains!154 lt!2814 (_1!187 lt!2778)))))

(declare-fun lt!2812 () List!339)

(assert (=> d!1359 (= lt!2814 (ListLongMap!356 lt!2812))))

(declare-fun lt!2815 () Unit!235)

(declare-fun lt!2813 () Unit!235)

(assert (=> d!1359 (= lt!2815 lt!2813)))

(declare-datatypes ((Option!30 0))(
  ( (Some!29 (v!1344 B!384)) (None!28) )
))
(declare-fun getValueByKey!24 (List!339 (_ BitVec 64)) Option!30)

(assert (=> d!1359 (= (getValueByKey!24 lt!2812 (_1!187 lt!2778)) (Some!29 (_2!187 lt!2778)))))

(declare-fun lemmaContainsTupThenGetReturnValue!8 (List!339 (_ BitVec 64) B!384) Unit!235)

(assert (=> d!1359 (= lt!2813 (lemmaContainsTupThenGetReturnValue!8 lt!2812 (_1!187 lt!2778) (_2!187 lt!2778)))))

(declare-fun insertStrictlySorted!8 (List!339 (_ BitVec 64) B!384) List!339)

(assert (=> d!1359 (= lt!2812 (insertStrictlySorted!8 (toList!193 lm!227) (_1!187 lt!2778) (_2!187 lt!2778)))))

(assert (=> d!1359 (= (+!25 lm!227 lt!2778) lt!2814)))

(declare-fun b!11232 () Bool)

(declare-fun res!9384 () Bool)

(assert (=> b!11232 (=> (not res!9384) (not e!6620))))

(assert (=> b!11232 (= res!9384 (= (getValueByKey!24 (toList!193 lt!2814) (_1!187 lt!2778)) (Some!29 (_2!187 lt!2778))))))

(declare-fun b!11233 () Bool)

(declare-fun contains!157 (List!339 tuple2!374) Bool)

(assert (=> b!11233 (= e!6620 (contains!157 (toList!193 lt!2814) lt!2778))))

(assert (= (and d!1359 res!9383) b!11232))

(assert (= (and b!11232 res!9384) b!11233))

(declare-fun m!7469 () Bool)

(assert (=> d!1359 m!7469))

(declare-fun m!7473 () Bool)

(assert (=> d!1359 m!7473))

(declare-fun m!7477 () Bool)

(assert (=> d!1359 m!7477))

(declare-fun m!7481 () Bool)

(assert (=> d!1359 m!7481))

(declare-fun m!7485 () Bool)

(assert (=> b!11232 m!7485))

(declare-fun m!7489 () Bool)

(assert (=> b!11233 m!7489))

(assert (=> b!11184 d!1359))

(declare-fun d!1365 () Bool)

(declare-fun e!6624 () Bool)

(assert (=> d!1365 e!6624))

(declare-fun res!9391 () Bool)

(assert (=> d!1365 (=> (not res!9391) (not e!6624))))

(declare-fun lt!2822 () ListLongMap!355)

(assert (=> d!1365 (= res!9391 (contains!154 lt!2822 (_1!187 (tuple2!375 (_1!187 lt!2778) (_2!187 lt!2778)))))))

(declare-fun lt!2820 () List!339)

(assert (=> d!1365 (= lt!2822 (ListLongMap!356 lt!2820))))

(declare-fun lt!2823 () Unit!235)

(declare-fun lt!2821 () Unit!235)

(assert (=> d!1365 (= lt!2823 lt!2821)))

(assert (=> d!1365 (= (getValueByKey!24 lt!2820 (_1!187 (tuple2!375 (_1!187 lt!2778) (_2!187 lt!2778)))) (Some!29 (_2!187 (tuple2!375 (_1!187 lt!2778) (_2!187 lt!2778)))))))

(assert (=> d!1365 (= lt!2821 (lemmaContainsTupThenGetReturnValue!8 lt!2820 (_1!187 (tuple2!375 (_1!187 lt!2778) (_2!187 lt!2778))) (_2!187 (tuple2!375 (_1!187 lt!2778) (_2!187 lt!2778)))))))

(assert (=> d!1365 (= lt!2820 (insertStrictlySorted!8 (toList!193 lm!227) (_1!187 (tuple2!375 (_1!187 lt!2778) (_2!187 lt!2778))) (_2!187 (tuple2!375 (_1!187 lt!2778) (_2!187 lt!2778)))))))

(assert (=> d!1365 (= (+!25 lm!227 (tuple2!375 (_1!187 lt!2778) (_2!187 lt!2778))) lt!2822)))

(declare-fun b!11240 () Bool)

(declare-fun res!9392 () Bool)

(assert (=> b!11240 (=> (not res!9392) (not e!6624))))

(assert (=> b!11240 (= res!9392 (= (getValueByKey!24 (toList!193 lt!2822) (_1!187 (tuple2!375 (_1!187 lt!2778) (_2!187 lt!2778)))) (Some!29 (_2!187 (tuple2!375 (_1!187 lt!2778) (_2!187 lt!2778))))))))

(declare-fun b!11241 () Bool)

(assert (=> b!11241 (= e!6624 (contains!157 (toList!193 lt!2822) (tuple2!375 (_1!187 lt!2778) (_2!187 lt!2778))))))

(assert (= (and d!1365 res!9391) b!11240))

(assert (= (and b!11240 res!9392) b!11241))

(declare-fun m!7493 () Bool)

(assert (=> d!1365 m!7493))

(declare-fun m!7495 () Bool)

(assert (=> d!1365 m!7495))

(declare-fun m!7497 () Bool)

(assert (=> d!1365 m!7497))

(declare-fun m!7499 () Bool)

(assert (=> d!1365 m!7499))

(declare-fun m!7501 () Bool)

(assert (=> b!11240 m!7501))

(declare-fun m!7503 () Bool)

(assert (=> b!11241 m!7503))

(assert (=> b!11184 d!1365))

(declare-fun d!1369 () Bool)

(declare-fun res!9395 () Bool)

(declare-fun e!6627 () Bool)

(assert (=> d!1369 (=> res!9395 e!6627)))

(assert (=> d!1369 (= res!9395 (is-Nil!336 (toList!193 (+!25 lm!227 (tuple2!375 (_1!187 lt!2778) (_2!187 lt!2778))))))))

(assert (=> d!1369 (= (forall!58 (toList!193 (+!25 lm!227 (tuple2!375 (_1!187 lt!2778) (_2!187 lt!2778)))) p!216) e!6627)))

(declare-fun b!11244 () Bool)

(declare-fun e!6628 () Bool)

(assert (=> b!11244 (= e!6627 e!6628)))

(declare-fun res!9396 () Bool)

(assert (=> b!11244 (=> (not res!9396) (not e!6628))))

(assert (=> b!11244 (= res!9396 (dynLambda!68 p!216 (h!901 (toList!193 (+!25 lm!227 (tuple2!375 (_1!187 lt!2778) (_2!187 lt!2778)))))))))

(declare-fun b!11245 () Bool)

(assert (=> b!11245 (= e!6628 (forall!58 (t!2588 (toList!193 (+!25 lm!227 (tuple2!375 (_1!187 lt!2778) (_2!187 lt!2778))))) p!216))))

(assert (= (and d!1369 (not res!9395)) b!11244))

(assert (= (and b!11244 res!9396) b!11245))

(declare-fun b_lambda!581 () Bool)

(assert (=> (not b_lambda!581) (not b!11244)))

(declare-fun t!2608 () Bool)

(declare-fun tb!267 () Bool)

(assert (=> (and start!1456 (= p!216 p!216) t!2608) tb!267))

(declare-fun result!429 () Bool)

(assert (=> tb!267 (= result!429 true)))

(assert (=> b!11244 t!2608))

(declare-fun b_and!723 () Bool)

(assert (= b_and!715 (and (=> t!2608 result!429) b_and!723)))

(declare-fun m!7517 () Bool)

(assert (=> b!11244 m!7517))

(declare-fun m!7523 () Bool)

(assert (=> b!11245 m!7523))

(assert (=> b!11184 d!1369))

(declare-fun d!1373 () Bool)

(declare-fun res!9401 () Bool)

(declare-fun e!6631 () Bool)

(assert (=> d!1373 (=> res!9401 e!6631)))

(assert (=> d!1373 (= res!9401 (is-Nil!336 (toList!193 (+!25 lm!227 lt!2778))))))

(assert (=> d!1373 (= (forall!58 (toList!193 (+!25 lm!227 lt!2778)) p!216) e!6631)))

(declare-fun b!11250 () Bool)

(declare-fun e!6632 () Bool)

(assert (=> b!11250 (= e!6631 e!6632)))

(declare-fun res!9402 () Bool)

(assert (=> b!11250 (=> (not res!9402) (not e!6632))))

(assert (=> b!11250 (= res!9402 (dynLambda!68 p!216 (h!901 (toList!193 (+!25 lm!227 lt!2778)))))))

(declare-fun b!11251 () Bool)

(assert (=> b!11251 (= e!6632 (forall!58 (t!2588 (toList!193 (+!25 lm!227 lt!2778))) p!216))))

(assert (= (and d!1373 (not res!9401)) b!11250))

(assert (= (and b!11250 res!9402) b!11251))

(declare-fun b_lambda!583 () Bool)

(assert (=> (not b_lambda!583) (not b!11250)))

(declare-fun t!2610 () Bool)

(declare-fun tb!269 () Bool)

(assert (=> (and start!1456 (= p!216 p!216) t!2610) tb!269))

(declare-fun result!431 () Bool)

(assert (=> tb!269 (= result!431 true)))

(assert (=> b!11250 t!2610))

(declare-fun b_and!725 () Bool)

(assert (= b_and!723 (and (=> t!2610 result!431) b_and!725)))

(declare-fun m!7537 () Bool)

(assert (=> b!11250 m!7537))

(declare-fun m!7539 () Bool)

(assert (=> b!11251 m!7539))

(assert (=> b!11184 d!1373))

(declare-fun d!1381 () Bool)

(assert (=> d!1381 (= (head!772 kvs!4) (h!901 kvs!4))))

(assert (=> b!11184 d!1381))

(declare-fun d!1385 () Bool)

(declare-fun res!9407 () Bool)

(declare-fun e!6637 () Bool)

(assert (=> d!1385 (=> res!9407 e!6637)))

(assert (=> d!1385 (= res!9407 (is-Nil!336 (tail!52 kvs!4)))))

(assert (=> d!1385 (= (forall!58 (tail!52 kvs!4) p!216) e!6637)))

(declare-fun b!11256 () Bool)

(declare-fun e!6638 () Bool)

(assert (=> b!11256 (= e!6637 e!6638)))

(declare-fun res!9408 () Bool)

(assert (=> b!11256 (=> (not res!9408) (not e!6638))))

(assert (=> b!11256 (= res!9408 (dynLambda!68 p!216 (h!901 (tail!52 kvs!4))))))

(declare-fun b!11257 () Bool)

(assert (=> b!11257 (= e!6638 (forall!58 (t!2588 (tail!52 kvs!4)) p!216))))

(assert (= (and d!1385 (not res!9407)) b!11256))

(assert (= (and b!11256 res!9408) b!11257))

(declare-fun b_lambda!589 () Bool)

(assert (=> (not b_lambda!589) (not b!11256)))

(declare-fun t!2616 () Bool)

(declare-fun tb!275 () Bool)

(assert (=> (and start!1456 (= p!216 p!216) t!2616) tb!275))

(declare-fun result!437 () Bool)

(assert (=> tb!275 (= result!437 true)))

(assert (=> b!11256 t!2616))

(declare-fun b_and!731 () Bool)

(assert (= b_and!725 (and (=> t!2616 result!437) b_and!731)))

(declare-fun m!7549 () Bool)

(assert (=> b!11256 m!7549))

(declare-fun m!7551 () Bool)

(assert (=> b!11257 m!7551))

(assert (=> b!11185 d!1385))

(declare-fun d!1391 () Bool)

(assert (=> d!1391 (= (tail!52 kvs!4) (t!2588 kvs!4))))

(assert (=> b!11185 d!1391))

(declare-fun d!1397 () Bool)

(declare-fun res!9415 () Bool)

(declare-fun e!6644 () Bool)

(assert (=> d!1397 (=> res!9415 e!6644)))

(assert (=> d!1397 (= res!9415 (is-Nil!336 kvs!4))))

(assert (=> d!1397 (= (forall!58 kvs!4 p!216) e!6644)))

(declare-fun b!11264 () Bool)

(declare-fun e!6645 () Bool)

(assert (=> b!11264 (= e!6644 e!6645)))

(declare-fun res!9416 () Bool)

(assert (=> b!11264 (=> (not res!9416) (not e!6645))))

(assert (=> b!11264 (= res!9416 (dynLambda!68 p!216 (h!901 kvs!4)))))

(declare-fun b!11265 () Bool)

(assert (=> b!11265 (= e!6645 (forall!58 (t!2588 kvs!4) p!216))))

(assert (= (and d!1397 (not res!9415)) b!11264))

(assert (= (and b!11264 res!9416) b!11265))

(declare-fun b_lambda!595 () Bool)

(assert (=> (not b_lambda!595) (not b!11264)))

(declare-fun t!2622 () Bool)

(declare-fun tb!281 () Bool)

(assert (=> (and start!1456 (= p!216 p!216) t!2622) tb!281))

(declare-fun result!443 () Bool)

(assert (=> tb!281 (= result!443 true)))

(assert (=> b!11264 t!2622))

