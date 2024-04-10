; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1500 () Bool)

(assert start!1500)

(declare-fun b_free!445 () Bool)

(declare-fun b_next!445 () Bool)

(assert (=> start!1500 (= b_free!445 (not b_next!445))))

(declare-fun tp!1857 () Bool)

(declare-fun b_and!741 () Bool)

(assert (=> start!1500 (= tp!1857 b_and!741)))

(declare-fun b!11301 () Bool)

(declare-fun res!9431 () Bool)

(declare-fun e!6670 () Bool)

(assert (=> b!11301 (=> res!9431 e!6670)))

(declare-datatypes ((B!386 0))(
  ( (B!387 (val!288 Int)) )
))
(declare-datatypes ((tuple2!376 0))(
  ( (tuple2!377 (_1!188 (_ BitVec 64)) (_2!188 B!386)) )
))
(declare-datatypes ((List!340 0))(
  ( (Nil!337) (Cons!336 (h!902 tuple2!376) (t!2625 List!340)) )
))
(declare-fun lt!2842 () List!340)

(declare-fun p!216 () Int)

(declare-fun forall!59 (List!340 Int) Bool)

(assert (=> b!11301 (= res!9431 (not (forall!59 lt!2842 p!216)))))

(declare-fun b!11302 () Bool)

(declare-fun e!6671 () Bool)

(assert (=> b!11302 (= e!6671 (not e!6670))))

(declare-fun res!9430 () Bool)

(assert (=> b!11302 (=> res!9430 e!6670)))

(declare-datatypes ((ListLongMap!357 0))(
  ( (ListLongMap!358 (toList!194 List!340)) )
))
(declare-fun lm!227 () ListLongMap!357)

(declare-fun lt!2844 () tuple2!376)

(declare-fun +!26 (ListLongMap!357 tuple2!376) ListLongMap!357)

(assert (=> b!11302 (= res!9430 (not (forall!59 (toList!194 (+!26 lm!227 lt!2844)) p!216)))))

(declare-fun kvs!4 () List!340)

(declare-fun tail!53 (List!340) List!340)

(assert (=> b!11302 (= lt!2842 (tail!53 kvs!4))))

(assert (=> b!11302 (forall!59 (toList!194 (+!26 lm!227 (tuple2!377 (_1!188 lt!2844) (_2!188 lt!2844)))) p!216)))

(declare-datatypes ((Unit!237 0))(
  ( (Unit!238) )
))
(declare-fun lt!2843 () Unit!237)

(declare-fun addValidProp!14 (ListLongMap!357 Int (_ BitVec 64) B!386) Unit!237)

(assert (=> b!11302 (= lt!2843 (addValidProp!14 lm!227 p!216 (_1!188 lt!2844) (_2!188 lt!2844)))))

(declare-fun head!773 (List!340) tuple2!376)

(assert (=> b!11302 (= lt!2844 (head!773 kvs!4))))

(declare-fun b!11303 () Bool)

(declare-fun res!9433 () Bool)

(assert (=> b!11303 (=> (not res!9433) (not e!6671))))

(assert (=> b!11303 (= res!9433 (forall!59 kvs!4 p!216))))

(declare-fun b!11304 () Bool)

(declare-fun e!6669 () Bool)

(declare-fun tp!1858 () Bool)

(assert (=> b!11304 (= e!6669 tp!1858)))

(declare-fun b!11305 () Bool)

(declare-fun e!6668 () Bool)

(declare-fun tp_is_empty!559 () Bool)

(declare-fun tp!1859 () Bool)

(assert (=> b!11305 (= e!6668 (and tp_is_empty!559 tp!1859))))

(declare-fun b!11306 () Bool)

(declare-fun ListPrimitiveSize!10 (List!340) Int)

(assert (=> b!11306 (= e!6670 (< (ListPrimitiveSize!10 lt!2842) (ListPrimitiveSize!10 kvs!4)))))

(declare-fun b!11300 () Bool)

(declare-fun res!9432 () Bool)

(assert (=> b!11300 (=> (not res!9432) (not e!6671))))

(declare-fun isEmpty!66 (List!340) Bool)

(assert (=> b!11300 (= res!9432 (not (isEmpty!66 kvs!4)))))

(declare-fun res!9429 () Bool)

(assert (=> start!1500 (=> (not res!9429) (not e!6671))))

(assert (=> start!1500 (= res!9429 (forall!59 (toList!194 lm!227) p!216))))

(assert (=> start!1500 e!6671))

(declare-fun inv!558 (ListLongMap!357) Bool)

(assert (=> start!1500 (and (inv!558 lm!227) e!6669)))

(assert (=> start!1500 tp!1857))

(assert (=> start!1500 e!6668))

(assert (= (and start!1500 res!9429) b!11303))

(assert (= (and b!11303 res!9433) b!11300))

(assert (= (and b!11300 res!9432) b!11302))

(assert (= (and b!11302 (not res!9430)) b!11301))

(assert (= (and b!11301 (not res!9431)) b!11306))

(assert (= start!1500 b!11304))

(assert (= (and start!1500 (is-Cons!336 kvs!4)) b!11305))

(declare-fun m!7583 () Bool)

(assert (=> b!11302 m!7583))

(declare-fun m!7585 () Bool)

(assert (=> b!11302 m!7585))

(declare-fun m!7587 () Bool)

(assert (=> b!11302 m!7587))

(declare-fun m!7589 () Bool)

(assert (=> b!11302 m!7589))

(declare-fun m!7591 () Bool)

(assert (=> b!11302 m!7591))

(declare-fun m!7593 () Bool)

(assert (=> b!11302 m!7593))

(declare-fun m!7595 () Bool)

(assert (=> b!11302 m!7595))

(declare-fun m!7597 () Bool)

(assert (=> b!11300 m!7597))

(declare-fun m!7599 () Bool)

(assert (=> start!1500 m!7599))

(declare-fun m!7601 () Bool)

(assert (=> start!1500 m!7601))

(declare-fun m!7603 () Bool)

(assert (=> b!11301 m!7603))

(declare-fun m!7605 () Bool)

(assert (=> b!11306 m!7605))

(declare-fun m!7607 () Bool)

(assert (=> b!11306 m!7607))

(declare-fun m!7609 () Bool)

(assert (=> b!11303 m!7609))

(push 1)

(assert b_and!741)

(assert (not b!11303))

(assert (not b!11300))

(assert (not b_next!445))

(assert tp_is_empty!559)

(assert (not b!11306))

(assert (not b!11302))

(assert (not b!11301))

(assert (not start!1500))

(assert (not b!11305))

(assert (not b!11304))

(check-sat)

(pop 1)

(push 1)

(assert b_and!741)

(assert (not b_next!445))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1411 () Bool)

(declare-fun res!9474 () Bool)

(declare-fun e!6707 () Bool)

(assert (=> d!1411 (=> res!9474 e!6707)))

(assert (=> d!1411 (= res!9474 (is-Nil!337 lt!2842))))

(assert (=> d!1411 (= (forall!59 lt!2842 p!216) e!6707)))

(declare-fun b!11359 () Bool)

(declare-fun e!6709 () Bool)

(assert (=> b!11359 (= e!6707 e!6709)))

(declare-fun res!9476 () Bool)

(assert (=> b!11359 (=> (not res!9476) (not e!6709))))

(declare-fun dynLambda!70 (Int tuple2!376) Bool)

(assert (=> b!11359 (= res!9476 (dynLambda!70 p!216 (h!902 lt!2842)))))

(declare-fun b!11360 () Bool)

(assert (=> b!11360 (= e!6709 (forall!59 (t!2625 lt!2842) p!216))))

(assert (= (and d!1411 (not res!9474)) b!11359))

(assert (= (and b!11359 res!9476) b!11360))

(declare-fun b_lambda!635 () Bool)

(assert (=> (not b_lambda!635) (not b!11359)))

(declare-fun t!2629 () Bool)

(declare-fun tb!285 () Bool)

(assert (=> (and start!1500 (= p!216 p!216) t!2629) tb!285))

(declare-fun result!453 () Bool)

(assert (=> tb!285 (= result!453 true)))

(assert (=> b!11359 t!2629))

(declare-fun b_and!747 () Bool)

(assert (= b_and!741 (and (=> t!2629 result!453) b_and!747)))

(declare-fun m!7667 () Bool)

(assert (=> b!11359 m!7667))

(declare-fun m!7669 () Bool)

(assert (=> b!11360 m!7669))

(assert (=> b!11301 d!1411))

(declare-fun d!1415 () Bool)

(declare-fun lt!2865 () Int)

(assert (=> d!1415 (>= lt!2865 0)))

(declare-fun e!6718 () Int)

(assert (=> d!1415 (= lt!2865 e!6718)))

(declare-fun c!956 () Bool)

(assert (=> d!1415 (= c!956 (is-Nil!337 lt!2842))))

(assert (=> d!1415 (= (ListPrimitiveSize!10 lt!2842) lt!2865)))

(declare-fun b!11373 () Bool)

(assert (=> b!11373 (= e!6718 0)))

(declare-fun b!11374 () Bool)

(assert (=> b!11374 (= e!6718 (+ 1 (ListPrimitiveSize!10 (t!2625 lt!2842))))))

(assert (= (and d!1415 c!956) b!11373))

(assert (= (and d!1415 (not c!956)) b!11374))

(declare-fun m!7683 () Bool)

(assert (=> b!11374 m!7683))

(assert (=> b!11306 d!1415))

(declare-fun d!1427 () Bool)

(declare-fun lt!2866 () Int)

(assert (=> d!1427 (>= lt!2866 0)))

(declare-fun e!6719 () Int)

(assert (=> d!1427 (= lt!2866 e!6719)))

(declare-fun c!957 () Bool)

(assert (=> d!1427 (= c!957 (is-Nil!337 kvs!4))))

(assert (=> d!1427 (= (ListPrimitiveSize!10 kvs!4) lt!2866)))

(declare-fun b!11375 () Bool)

(assert (=> b!11375 (= e!6719 0)))

(declare-fun b!11376 () Bool)

(assert (=> b!11376 (= e!6719 (+ 1 (ListPrimitiveSize!10 (t!2625 kvs!4))))))

(assert (= (and d!1427 c!957) b!11375))

(assert (= (and d!1427 (not c!957)) b!11376))

(declare-fun m!7685 () Bool)

(assert (=> b!11376 m!7685))

(assert (=> b!11306 d!1427))

(declare-fun d!1429 () Bool)

(assert (=> d!1429 (= (isEmpty!66 kvs!4) (is-Nil!337 kvs!4))))

(assert (=> b!11300 d!1429))

(declare-fun d!1431 () Bool)

(declare-fun res!9484 () Bool)

(declare-fun e!6720 () Bool)

(assert (=> d!1431 (=> res!9484 e!6720)))

(assert (=> d!1431 (= res!9484 (is-Nil!337 kvs!4))))

(assert (=> d!1431 (= (forall!59 kvs!4 p!216) e!6720)))

(declare-fun b!11377 () Bool)

(declare-fun e!6721 () Bool)

(assert (=> b!11377 (= e!6720 e!6721)))

(declare-fun res!9485 () Bool)

(assert (=> b!11377 (=> (not res!9485) (not e!6721))))

(assert (=> b!11377 (= res!9485 (dynLambda!70 p!216 (h!902 kvs!4)))))

(declare-fun b!11378 () Bool)

(assert (=> b!11378 (= e!6721 (forall!59 (t!2625 kvs!4) p!216))))

(assert (= (and d!1431 (not res!9484)) b!11377))

(assert (= (and b!11377 res!9485) b!11378))

(declare-fun b_lambda!643 () Bool)

(assert (=> (not b_lambda!643) (not b!11377)))

(declare-fun t!2637 () Bool)

(declare-fun tb!293 () Bool)

(assert (=> (and start!1500 (= p!216 p!216) t!2637) tb!293))

(declare-fun result!461 () Bool)

(assert (=> tb!293 (= result!461 true)))

(assert (=> b!11377 t!2637))

(declare-fun b_and!755 () Bool)

(assert (= b_and!747 (and (=> t!2637 result!461) b_and!755)))

(declare-fun m!7687 () Bool)

(assert (=> b!11377 m!7687))

(declare-fun m!7689 () Bool)

(assert (=> b!11378 m!7689))

(assert (=> b!11303 d!1431))

(declare-fun d!1433 () Bool)

(declare-fun res!9486 () Bool)

(declare-fun e!6724 () Bool)

(assert (=> d!1433 (=> res!9486 e!6724)))

(assert (=> d!1433 (= res!9486 (is-Nil!337 (toList!194 lm!227)))))

(assert (=> d!1433 (= (forall!59 (toList!194 lm!227) p!216) e!6724)))

(declare-fun b!11383 () Bool)

(declare-fun e!6725 () Bool)

(assert (=> b!11383 (= e!6724 e!6725)))

(declare-fun res!9487 () Bool)

(assert (=> b!11383 (=> (not res!9487) (not e!6725))))

(assert (=> b!11383 (= res!9487 (dynLambda!70 p!216 (h!902 (toList!194 lm!227))))))

(declare-fun b!11384 () Bool)

(assert (=> b!11384 (= e!6725 (forall!59 (t!2625 (toList!194 lm!227)) p!216))))

(assert (= (and d!1433 (not res!9486)) b!11383))

(assert (= (and b!11383 res!9487) b!11384))

(declare-fun b_lambda!645 () Bool)

(assert (=> (not b_lambda!645) (not b!11383)))

(declare-fun t!2639 () Bool)

(declare-fun tb!295 () Bool)

(assert (=> (and start!1500 (= p!216 p!216) t!2639) tb!295))

(declare-fun result!463 () Bool)

(assert (=> tb!295 (= result!463 true)))

(assert (=> b!11383 t!2639))

(declare-fun b_and!757 () Bool)

(assert (= b_and!755 (and (=> t!2639 result!463) b_and!757)))

(declare-fun m!7691 () Bool)

(assert (=> b!11383 m!7691))

(declare-fun m!7693 () Bool)

(assert (=> b!11384 m!7693))

(assert (=> start!1500 d!1433))

(declare-fun d!1435 () Bool)

(declare-fun isStrictlySorted!43 (List!340) Bool)

(assert (=> d!1435 (= (inv!558 lm!227) (isStrictlySorted!43 (toList!194 lm!227)))))

(declare-fun bs!432 () Bool)

(assert (= bs!432 d!1435))

(declare-fun m!7699 () Bool)

(assert (=> bs!432 m!7699))

(assert (=> start!1500 d!1435))

(declare-fun d!1441 () Bool)

(assert (=> d!1441 (= (tail!53 kvs!4) (t!2625 kvs!4))))

(assert (=> b!11302 d!1441))

(declare-fun d!1443 () Bool)

(declare-fun res!9490 () Bool)

(declare-fun e!6730 () Bool)

(assert (=> d!1443 (=> res!9490 e!6730)))

(assert (=> d!1443 (= res!9490 (is-Nil!337 (toList!194 (+!26 lm!227 (tuple2!377 (_1!188 lt!2844) (_2!188 lt!2844))))))))

(assert (=> d!1443 (= (forall!59 (toList!194 (+!26 lm!227 (tuple2!377 (_1!188 lt!2844) (_2!188 lt!2844)))) p!216) e!6730)))

(declare-fun b!11391 () Bool)

(declare-fun e!6731 () Bool)

(assert (=> b!11391 (= e!6730 e!6731)))

(declare-fun res!9491 () Bool)

(assert (=> b!11391 (=> (not res!9491) (not e!6731))))

(assert (=> b!11391 (= res!9491 (dynLambda!70 p!216 (h!902 (toList!194 (+!26 lm!227 (tuple2!377 (_1!188 lt!2844) (_2!188 lt!2844)))))))))

(declare-fun b!11392 () Bool)

(assert (=> b!11392 (= e!6731 (forall!59 (t!2625 (toList!194 (+!26 lm!227 (tuple2!377 (_1!188 lt!2844) (_2!188 lt!2844))))) p!216))))

(assert (= (and d!1443 (not res!9490)) b!11391))

(assert (= (and b!11391 res!9491) b!11392))

(declare-fun b_lambda!649 () Bool)

(assert (=> (not b_lambda!649) (not b!11391)))

(declare-fun t!2643 () Bool)

(declare-fun tb!299 () Bool)

(assert (=> (and start!1500 (= p!216 p!216) t!2643) tb!299))

(declare-fun result!467 () Bool)

(assert (=> tb!299 (= result!467 true)))

(assert (=> b!11391 t!2643))

(declare-fun b_and!761 () Bool)

(assert (= b_and!757 (and (=> t!2643 result!467) b_and!761)))

(declare-fun m!7705 () Bool)

(assert (=> b!11391 m!7705))

(declare-fun m!7707 () Bool)

(assert (=> b!11392 m!7707))

(assert (=> b!11302 d!1443))

(declare-fun d!1447 () Bool)

(declare-fun e!6741 () Bool)

(assert (=> d!1447 e!6741))

(declare-fun res!9503 () Bool)

(assert (=> d!1447 (=> (not res!9503) (not e!6741))))

(declare-fun lt!2882 () ListLongMap!357)

(declare-fun contains!159 (ListLongMap!357 (_ BitVec 64)) Bool)

(assert (=> d!1447 (= res!9503 (contains!159 lt!2882 (_1!188 lt!2844)))))

(declare-fun lt!2884 () List!340)

(assert (=> d!1447 (= lt!2882 (ListLongMap!358 lt!2884))))

(declare-fun lt!2883 () Unit!237)

(declare-fun lt!2885 () Unit!237)

(assert (=> d!1447 (= lt!2883 lt!2885)))

(declare-datatypes ((Option!32 0))(
  ( (Some!31 (v!1346 B!386)) (None!30) )
))
(declare-fun getValueByKey!26 (List!340 (_ BitVec 64)) Option!32)

(assert (=> d!1447 (= (getValueByKey!26 lt!2884 (_1!188 lt!2844)) (Some!31 (_2!188 lt!2844)))))

(declare-fun lemmaContainsTupThenGetReturnValue!10 (List!340 (_ BitVec 64) B!386) Unit!237)

(assert (=> d!1447 (= lt!2885 (lemmaContainsTupThenGetReturnValue!10 lt!2884 (_1!188 lt!2844) (_2!188 lt!2844)))))

(declare-fun insertStrictlySorted!10 (List!340 (_ BitVec 64) B!386) List!340)

(assert (=> d!1447 (= lt!2884 (insertStrictlySorted!10 (toList!194 lm!227) (_1!188 lt!2844) (_2!188 lt!2844)))))

(assert (=> d!1447 (= (+!26 lm!227 lt!2844) lt!2882)))

(declare-fun b!11405 () Bool)

(declare-fun res!9504 () Bool)

(assert (=> b!11405 (=> (not res!9504) (not e!6741))))

(assert (=> b!11405 (= res!9504 (= (getValueByKey!26 (toList!194 lt!2882) (_1!188 lt!2844)) (Some!31 (_2!188 lt!2844))))))

(declare-fun b!11406 () Bool)

(declare-fun contains!160 (List!340 tuple2!376) Bool)

(assert (=> b!11406 (= e!6741 (contains!160 (toList!194 lt!2882) lt!2844))))

(assert (= (and d!1447 res!9503) b!11405))

(assert (= (and b!11405 res!9504) b!11406))

(declare-fun m!7723 () Bool)

(assert (=> d!1447 m!7723))

(declare-fun m!7725 () Bool)

(assert (=> d!1447 m!7725))

(declare-fun m!7727 () Bool)

(assert (=> d!1447 m!7727))

(declare-fun m!7729 () Bool)

(assert (=> d!1447 m!7729))

(declare-fun m!7731 () Bool)

(assert (=> b!11405 m!7731))

(declare-fun m!7733 () Bool)

(assert (=> b!11406 m!7733))

(assert (=> b!11302 d!1447))

(declare-fun d!1457 () Bool)

(declare-fun e!6742 () Bool)

(assert (=> d!1457 e!6742))

(declare-fun res!9505 () Bool)

(assert (=> d!1457 (=> (not res!9505) (not e!6742))))

(declare-fun lt!2886 () ListLongMap!357)

(assert (=> d!1457 (= res!9505 (contains!159 lt!2886 (_1!188 (tuple2!377 (_1!188 lt!2844) (_2!188 lt!2844)))))))

(declare-fun lt!2888 () List!340)

(assert (=> d!1457 (= lt!2886 (ListLongMap!358 lt!2888))))

(declare-fun lt!2887 () Unit!237)

(declare-fun lt!2889 () Unit!237)

(assert (=> d!1457 (= lt!2887 lt!2889)))

(assert (=> d!1457 (= (getValueByKey!26 lt!2888 (_1!188 (tuple2!377 (_1!188 lt!2844) (_2!188 lt!2844)))) (Some!31 (_2!188 (tuple2!377 (_1!188 lt!2844) (_2!188 lt!2844)))))))

(assert (=> d!1457 (= lt!2889 (lemmaContainsTupThenGetReturnValue!10 lt!2888 (_1!188 (tuple2!377 (_1!188 lt!2844) (_2!188 lt!2844))) (_2!188 (tuple2!377 (_1!188 lt!2844) (_2!188 lt!2844)))))))

(assert (=> d!1457 (= lt!2888 (insertStrictlySorted!10 (toList!194 lm!227) (_1!188 (tuple2!377 (_1!188 lt!2844) (_2!188 lt!2844))) (_2!188 (tuple2!377 (_1!188 lt!2844) (_2!188 lt!2844)))))))

(assert (=> d!1457 (= (+!26 lm!227 (tuple2!377 (_1!188 lt!2844) (_2!188 lt!2844))) lt!2886)))

(declare-fun b!11407 () Bool)

(declare-fun res!9506 () Bool)

(assert (=> b!11407 (=> (not res!9506) (not e!6742))))

(assert (=> b!11407 (= res!9506 (= (getValueByKey!26 (toList!194 lt!2886) (_1!188 (tuple2!377 (_1!188 lt!2844) (_2!188 lt!2844)))) (Some!31 (_2!188 (tuple2!377 (_1!188 lt!2844) (_2!188 lt!2844))))))))

(declare-fun b!11408 () Bool)

(assert (=> b!11408 (= e!6742 (contains!160 (toList!194 lt!2886) (tuple2!377 (_1!188 lt!2844) (_2!188 lt!2844))))))

(assert (= (and d!1457 res!9505) b!11407))

(assert (= (and b!11407 res!9506) b!11408))

(declare-fun m!7735 () Bool)

(assert (=> d!1457 m!7735))

(declare-fun m!7737 () Bool)

(assert (=> d!1457 m!7737))

(declare-fun m!7739 () Bool)

(assert (=> d!1457 m!7739))

(declare-fun m!7741 () Bool)

(assert (=> d!1457 m!7741))

(declare-fun m!7743 () Bool)

(assert (=> b!11407 m!7743))

(declare-fun m!7745 () Bool)

(assert (=> b!11408 m!7745))

(assert (=> b!11302 d!1457))

(declare-fun d!1459 () Bool)

(assert (=> d!1459 (= (head!773 kvs!4) (h!902 kvs!4))))

(assert (=> b!11302 d!1459))

(declare-fun d!1461 () Bool)

(assert (=> d!1461 (forall!59 (toList!194 (+!26 lm!227 (tuple2!377 (_1!188 lt!2844) (_2!188 lt!2844)))) p!216)))

(declare-fun lt!2912 () Unit!237)

(declare-fun choose!157 (ListLongMap!357 Int (_ BitVec 64) B!386) Unit!237)

(assert (=> d!1461 (= lt!2912 (choose!157 lm!227 p!216 (_1!188 lt!2844) (_2!188 lt!2844)))))

(declare-fun e!6750 () Bool)

(assert (=> d!1461 e!6750))

(declare-fun res!9519 () Bool)

(assert (=> d!1461 (=> (not res!9519) (not e!6750))))

(assert (=> d!1461 (= res!9519 (forall!59 (toList!194 lm!227) p!216))))

(assert (=> d!1461 (= (addValidProp!14 lm!227 p!216 (_1!188 lt!2844) (_2!188 lt!2844)) lt!2912)))

(declare-fun b!11422 () Bool)

(assert (=> b!11422 (= e!6750 (dynLambda!70 p!216 (tuple2!377 (_1!188 lt!2844) (_2!188 lt!2844))))))

(assert (= (and d!1461 res!9519) b!11422))

(declare-fun b_lambda!657 () Bool)

(assert (=> (not b_lambda!657) (not b!11422)))

(declare-fun t!2651 () Bool)

(declare-fun tb!307 () Bool)

(assert (=> (and start!1500 (= p!216 p!216) t!2651) tb!307))

(declare-fun result!475 () Bool)

(assert (=> tb!307 (= result!475 true)))

(assert (=> b!11422 t!2651))

(declare-fun b_and!769 () Bool)

(assert (= b_and!761 (and (=> t!2651 result!475) b_and!769)))

(assert (=> d!1461 m!7591))

(assert (=> d!1461 m!7587))

(declare-fun m!7757 () Bool)

(assert (=> d!1461 m!7757))

(assert (=> d!1461 m!7599))

(declare-fun m!7761 () Bool)

(assert (=> b!11422 m!7761))

(assert (=> b!11302 d!1461))

(declare-fun d!1465 () Bool)

(declare-fun res!9522 () Bool)

(declare-fun e!6752 () Bool)

(assert (=> d!1465 (=> res!9522 e!6752)))

(assert (=> d!1465 (= res!9522 (is-Nil!337 (toList!194 (+!26 lm!227 lt!2844))))))

(assert (=> d!1465 (= (forall!59 (toList!194 (+!26 lm!227 lt!2844)) p!216) e!6752)))

(declare-fun b!11425 () Bool)

(declare-fun e!6753 () Bool)

(assert (=> b!11425 (= e!6752 e!6753)))

(declare-fun res!9523 () Bool)

(assert (=> b!11425 (=> (not res!9523) (not e!6753))))

(assert (=> b!11425 (= res!9523 (dynLambda!70 p!216 (h!902 (toList!194 (+!26 lm!227 lt!2844)))))))

(declare-fun b!11426 () Bool)

(assert (=> b!11426 (= e!6753 (forall!59 (t!2625 (toList!194 (+!26 lm!227 lt!2844))) p!216))))

(assert (= (and d!1465 (not res!9522)) b!11425))

(assert (= (and b!11425 res!9523) b!11426))

(declare-fun b_lambda!659 () Bool)

(assert (=> (not b_lambda!659) (not b!11425)))

(declare-fun t!2653 () Bool)

(declare-fun tb!309 () Bool)

(assert (=> (and start!1500 (= p!216 p!216) t!2653) tb!309))

(declare-fun result!477 () Bool)

(assert (=> tb!309 (= result!477 true)))

(assert (=> b!11425 t!2653))

(declare-fun b_and!771 () Bool)

(assert (= b_and!769 (and (=> t!2653 result!477) b_and!771)))

(declare-fun m!7763 () Bool)

(assert (=> b!11425 m!7763))

(declare-fun m!7765 () Bool)

(assert (=> b!11426 m!7765))

(assert (=> b!11302 d!1465))

(declare-fun b!11431 () Bool)

(declare-fun e!6756 () Bool)

(declare-fun tp!1880 () Bool)

(assert (=> b!11431 (= e!6756 (and tp_is_empty!559 tp!1880))))

(assert (=> b!11305 (= tp!1859 e!6756)))

(assert (= (and b!11305 (is-Cons!336 (t!2625 kvs!4))) b!11431))

(declare-fun b!11434 () Bool)

(declare-fun e!6758 () Bool)

(declare-fun tp!1881 () Bool)

(assert (=> b!11434 (= e!6758 (and tp_is_empty!559 tp!1881))))

(assert (=> b!11304 (= tp!1858 e!6758)))

(assert (= (and b!11304 (is-Cons!336 (toList!194 lm!227))) b!11434))

(declare-fun b_lambda!661 () Bool)

(assert (= b_lambda!649 (or (and start!1500 b_free!445) b_lambda!661)))

(declare-fun b_lambda!663 () Bool)

(assert (= b_lambda!657 (or (and start!1500 b_free!445) b_lambda!663)))

(declare-fun b_lambda!665 () Bool)

(assert (= b_lambda!635 (or (and start!1500 b_free!445) b_lambda!665)))

(declare-fun b_lambda!667 () Bool)

(assert (= b_lambda!659 (or (and start!1500 b_free!445) b_lambda!667)))

(declare-fun b_lambda!669 () Bool)

(assert (= b_lambda!645 (or (and start!1500 b_free!445) b_lambda!669)))

(declare-fun b_lambda!671 () Bool)

(assert (= b_lambda!643 (or (and start!1500 b_free!445) b_lambda!671)))

(push 1)

(assert (not d!1435))

(assert (not d!1461))

(assert (not b!11384))

(assert (not b!11376))

(assert (not b!11374))

(assert (not b!11405))

(assert (not b_lambda!671))

(assert (not b!11392))

(assert b_and!771)

(assert (not b_lambda!669))

(assert (not b!11426))

(assert (not b!11434))

(assert (not b!11407))

(assert (not b!11406))

(assert (not d!1457))

(assert (not b_lambda!663))

(assert (not b_lambda!661))

(assert (not b!11360))

(assert (not d!1447))

(assert (not b_next!445))

(assert (not b!11378))

(assert tp_is_empty!559)

(assert (not b_lambda!667))

(assert (not b_lambda!665))

(assert (not b!11431))

(assert (not b!11408))

(check-sat)

(pop 1)

(push 1)

(assert b_and!771)

(assert (not b_next!445))

(check-sat)

(pop 1)

