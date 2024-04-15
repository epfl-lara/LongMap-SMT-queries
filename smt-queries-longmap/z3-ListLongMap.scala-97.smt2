; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1500 () Bool)

(assert start!1500)

(declare-fun b_free!445 () Bool)

(declare-fun b_next!445 () Bool)

(assert (=> start!1500 (= b_free!445 (not b_next!445))))

(declare-fun tp!1858 () Bool)

(declare-fun b_and!741 () Bool)

(assert (=> start!1500 (= tp!1858 b_and!741)))

(declare-fun b!11300 () Bool)

(declare-fun e!6670 () Bool)

(declare-fun tp_is_empty!559 () Bool)

(declare-fun tp!1857 () Bool)

(assert (=> b!11300 (= e!6670 (and tp_is_empty!559 tp!1857))))

(declare-fun b!11301 () Bool)

(declare-fun e!6669 () Bool)

(declare-fun e!6668 () Bool)

(assert (=> b!11301 (= e!6669 (not e!6668))))

(declare-fun res!9433 () Bool)

(assert (=> b!11301 (=> res!9433 e!6668)))

(declare-fun p!216 () Int)

(declare-datatypes ((B!386 0))(
  ( (B!387 (val!288 Int)) )
))
(declare-datatypes ((tuple2!372 0))(
  ( (tuple2!373 (_1!186 (_ BitVec 64)) (_2!186 B!386)) )
))
(declare-fun lt!2842 () tuple2!372)

(declare-datatypes ((List!336 0))(
  ( (Nil!333) (Cons!332 (h!898 tuple2!372) (t!2621 List!336)) )
))
(declare-datatypes ((ListLongMap!353 0))(
  ( (ListLongMap!354 (toList!192 List!336)) )
))
(declare-fun lm!227 () ListLongMap!353)

(declare-fun forall!59 (List!336 Int) Bool)

(declare-fun +!26 (ListLongMap!353 tuple2!372) ListLongMap!353)

(assert (=> b!11301 (= res!9433 (not (forall!59 (toList!192 (+!26 lm!227 lt!2842)) p!216)))))

(declare-fun lt!2844 () List!336)

(declare-fun kvs!4 () List!336)

(declare-fun tail!53 (List!336) List!336)

(assert (=> b!11301 (= lt!2844 (tail!53 kvs!4))))

(assert (=> b!11301 (forall!59 (toList!192 (+!26 lm!227 (tuple2!373 (_1!186 lt!2842) (_2!186 lt!2842)))) p!216)))

(declare-datatypes ((Unit!247 0))(
  ( (Unit!248) )
))
(declare-fun lt!2843 () Unit!247)

(declare-fun addValidProp!14 (ListLongMap!353 Int (_ BitVec 64) B!386) Unit!247)

(assert (=> b!11301 (= lt!2843 (addValidProp!14 lm!227 p!216 (_1!186 lt!2842) (_2!186 lt!2842)))))

(declare-fun head!773 (List!336) tuple2!372)

(assert (=> b!11301 (= lt!2842 (head!773 kvs!4))))

(declare-fun b!11302 () Bool)

(declare-fun res!9432 () Bool)

(assert (=> b!11302 (=> (not res!9432) (not e!6669))))

(declare-fun isEmpty!66 (List!336) Bool)

(assert (=> b!11302 (= res!9432 (not (isEmpty!66 kvs!4)))))

(declare-fun b!11303 () Bool)

(declare-fun res!9430 () Bool)

(assert (=> b!11303 (=> (not res!9430) (not e!6669))))

(assert (=> b!11303 (= res!9430 (forall!59 kvs!4 p!216))))

(declare-fun b!11304 () Bool)

(declare-fun e!6671 () Bool)

(declare-fun tp!1859 () Bool)

(assert (=> b!11304 (= e!6671 tp!1859)))

(declare-fun res!9429 () Bool)

(assert (=> start!1500 (=> (not res!9429) (not e!6669))))

(assert (=> start!1500 (= res!9429 (forall!59 (toList!192 lm!227) p!216))))

(assert (=> start!1500 e!6669))

(declare-fun inv!558 (ListLongMap!353) Bool)

(assert (=> start!1500 (and (inv!558 lm!227) e!6671)))

(assert (=> start!1500 tp!1858))

(assert (=> start!1500 e!6670))

(declare-fun b!11305 () Bool)

(declare-fun ListPrimitiveSize!10 (List!336) Int)

(assert (=> b!11305 (= e!6668 (< (ListPrimitiveSize!10 lt!2844) (ListPrimitiveSize!10 kvs!4)))))

(declare-fun b!11306 () Bool)

(declare-fun res!9431 () Bool)

(assert (=> b!11306 (=> res!9431 e!6668)))

(assert (=> b!11306 (= res!9431 (not (forall!59 lt!2844 p!216)))))

(assert (= (and start!1500 res!9429) b!11303))

(assert (= (and b!11303 res!9430) b!11302))

(assert (= (and b!11302 res!9432) b!11301))

(assert (= (and b!11301 (not res!9433)) b!11306))

(assert (= (and b!11306 (not res!9431)) b!11305))

(assert (= start!1500 b!11304))

(get-info :version)

(assert (= (and start!1500 ((_ is Cons!332) kvs!4)) b!11300))

(declare-fun m!7583 () Bool)

(assert (=> start!1500 m!7583))

(declare-fun m!7585 () Bool)

(assert (=> start!1500 m!7585))

(declare-fun m!7587 () Bool)

(assert (=> b!11301 m!7587))

(declare-fun m!7589 () Bool)

(assert (=> b!11301 m!7589))

(declare-fun m!7591 () Bool)

(assert (=> b!11301 m!7591))

(declare-fun m!7593 () Bool)

(assert (=> b!11301 m!7593))

(declare-fun m!7595 () Bool)

(assert (=> b!11301 m!7595))

(declare-fun m!7597 () Bool)

(assert (=> b!11301 m!7597))

(declare-fun m!7599 () Bool)

(assert (=> b!11301 m!7599))

(declare-fun m!7601 () Bool)

(assert (=> b!11303 m!7601))

(declare-fun m!7603 () Bool)

(assert (=> b!11306 m!7603))

(declare-fun m!7605 () Bool)

(assert (=> b!11302 m!7605))

(declare-fun m!7607 () Bool)

(assert (=> b!11305 m!7607))

(declare-fun m!7609 () Bool)

(assert (=> b!11305 m!7609))

(check-sat (not start!1500) (not b!11300) (not b!11301) (not b!11306) (not b!11303) (not b_next!445) tp_is_empty!559 (not b!11304) (not b!11302) b_and!741 (not b!11305))
(check-sat b_and!741 (not b_next!445))
(get-model)

(declare-fun d!1407 () Bool)

(assert (=> d!1407 (= (tail!53 kvs!4) (t!2621 kvs!4))))

(assert (=> b!11301 d!1407))

(declare-fun d!1409 () Bool)

(assert (=> d!1409 (forall!59 (toList!192 (+!26 lm!227 (tuple2!373 (_1!186 lt!2842) (_2!186 lt!2842)))) p!216)))

(declare-fun lt!2865 () Unit!247)

(declare-fun choose!155 (ListLongMap!353 Int (_ BitVec 64) B!386) Unit!247)

(assert (=> d!1409 (= lt!2865 (choose!155 lm!227 p!216 (_1!186 lt!2842) (_2!186 lt!2842)))))

(declare-fun e!6710 () Bool)

(assert (=> d!1409 e!6710))

(declare-fun res!9478 () Bool)

(assert (=> d!1409 (=> (not res!9478) (not e!6710))))

(assert (=> d!1409 (= res!9478 (forall!59 (toList!192 lm!227) p!216))))

(assert (=> d!1409 (= (addValidProp!14 lm!227 p!216 (_1!186 lt!2842) (_2!186 lt!2842)) lt!2865)))

(declare-fun b!11364 () Bool)

(declare-fun dynLambda!70 (Int tuple2!372) Bool)

(assert (=> b!11364 (= e!6710 (dynLambda!70 p!216 (tuple2!373 (_1!186 lt!2842) (_2!186 lt!2842))))))

(assert (= (and d!1409 res!9478) b!11364))

(declare-fun b_lambda!639 () Bool)

(assert (=> (not b_lambda!639) (not b!11364)))

(declare-fun t!2629 () Bool)

(declare-fun tb!289 () Bool)

(assert (=> (and start!1500 (= p!216 p!216) t!2629) tb!289))

(declare-fun result!457 () Bool)

(assert (=> tb!289 (= result!457 true)))

(assert (=> b!11364 t!2629))

(declare-fun b_and!751 () Bool)

(assert (= b_and!741 (and (=> t!2629 result!457) b_and!751)))

(assert (=> d!1409 m!7589))

(assert (=> d!1409 m!7595))

(declare-fun m!7675 () Bool)

(assert (=> d!1409 m!7675))

(assert (=> d!1409 m!7583))

(declare-fun m!7677 () Bool)

(assert (=> b!11364 m!7677))

(assert (=> b!11301 d!1409))

(declare-fun d!1421 () Bool)

(declare-fun e!6720 () Bool)

(assert (=> d!1421 e!6720))

(declare-fun res!9497 () Bool)

(assert (=> d!1421 (=> (not res!9497) (not e!6720))))

(declare-fun lt!2903 () ListLongMap!353)

(declare-fun contains!157 (ListLongMap!353 (_ BitVec 64)) Bool)

(assert (=> d!1421 (= res!9497 (contains!157 lt!2903 (_1!186 (tuple2!373 (_1!186 lt!2842) (_2!186 lt!2842)))))))

(declare-fun lt!2902 () List!336)

(assert (=> d!1421 (= lt!2903 (ListLongMap!354 lt!2902))))

(declare-fun lt!2904 () Unit!247)

(declare-fun lt!2905 () Unit!247)

(assert (=> d!1421 (= lt!2904 lt!2905)))

(declare-datatypes ((Option!32 0))(
  ( (Some!31 (v!1346 B!386)) (None!30) )
))
(declare-fun getValueByKey!26 (List!336 (_ BitVec 64)) Option!32)

(assert (=> d!1421 (= (getValueByKey!26 lt!2902 (_1!186 (tuple2!373 (_1!186 lt!2842) (_2!186 lt!2842)))) (Some!31 (_2!186 (tuple2!373 (_1!186 lt!2842) (_2!186 lt!2842)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!10 (List!336 (_ BitVec 64) B!386) Unit!247)

(assert (=> d!1421 (= lt!2905 (lemmaContainsTupThenGetReturnValue!10 lt!2902 (_1!186 (tuple2!373 (_1!186 lt!2842) (_2!186 lt!2842))) (_2!186 (tuple2!373 (_1!186 lt!2842) (_2!186 lt!2842)))))))

(declare-fun insertStrictlySorted!10 (List!336 (_ BitVec 64) B!386) List!336)

(assert (=> d!1421 (= lt!2902 (insertStrictlySorted!10 (toList!192 lm!227) (_1!186 (tuple2!373 (_1!186 lt!2842) (_2!186 lt!2842))) (_2!186 (tuple2!373 (_1!186 lt!2842) (_2!186 lt!2842)))))))

(assert (=> d!1421 (= (+!26 lm!227 (tuple2!373 (_1!186 lt!2842) (_2!186 lt!2842))) lt!2903)))

(declare-fun b!11383 () Bool)

(declare-fun res!9498 () Bool)

(assert (=> b!11383 (=> (not res!9498) (not e!6720))))

(assert (=> b!11383 (= res!9498 (= (getValueByKey!26 (toList!192 lt!2903) (_1!186 (tuple2!373 (_1!186 lt!2842) (_2!186 lt!2842)))) (Some!31 (_2!186 (tuple2!373 (_1!186 lt!2842) (_2!186 lt!2842))))))))

(declare-fun b!11384 () Bool)

(declare-fun contains!159 (List!336 tuple2!372) Bool)

(assert (=> b!11384 (= e!6720 (contains!159 (toList!192 lt!2903) (tuple2!373 (_1!186 lt!2842) (_2!186 lt!2842))))))

(assert (= (and d!1421 res!9497) b!11383))

(assert (= (and b!11383 res!9498) b!11384))

(declare-fun m!7715 () Bool)

(assert (=> d!1421 m!7715))

(declare-fun m!7717 () Bool)

(assert (=> d!1421 m!7717))

(declare-fun m!7719 () Bool)

(assert (=> d!1421 m!7719))

(declare-fun m!7721 () Bool)

(assert (=> d!1421 m!7721))

(declare-fun m!7723 () Bool)

(assert (=> b!11383 m!7723))

(declare-fun m!7725 () Bool)

(assert (=> b!11384 m!7725))

(assert (=> b!11301 d!1421))

(declare-fun d!1433 () Bool)

(assert (=> d!1433 (= (head!773 kvs!4) (h!898 kvs!4))))

(assert (=> b!11301 d!1433))

(declare-fun d!1435 () Bool)

(declare-fun res!9503 () Bool)

(declare-fun e!6725 () Bool)

(assert (=> d!1435 (=> res!9503 e!6725)))

(assert (=> d!1435 (= res!9503 ((_ is Nil!333) (toList!192 (+!26 lm!227 lt!2842))))))

(assert (=> d!1435 (= (forall!59 (toList!192 (+!26 lm!227 lt!2842)) p!216) e!6725)))

(declare-fun b!11390 () Bool)

(declare-fun e!6726 () Bool)

(assert (=> b!11390 (= e!6725 e!6726)))

(declare-fun res!9504 () Bool)

(assert (=> b!11390 (=> (not res!9504) (not e!6726))))

(assert (=> b!11390 (= res!9504 (dynLambda!70 p!216 (h!898 (toList!192 (+!26 lm!227 lt!2842)))))))

(declare-fun b!11391 () Bool)

(assert (=> b!11391 (= e!6726 (forall!59 (t!2621 (toList!192 (+!26 lm!227 lt!2842))) p!216))))

(assert (= (and d!1435 (not res!9503)) b!11390))

(assert (= (and b!11390 res!9504) b!11391))

(declare-fun b_lambda!641 () Bool)

(assert (=> (not b_lambda!641) (not b!11390)))

(declare-fun t!2631 () Bool)

(declare-fun tb!291 () Bool)

(assert (=> (and start!1500 (= p!216 p!216) t!2631) tb!291))

(declare-fun result!459 () Bool)

(assert (=> tb!291 (= result!459 true)))

(assert (=> b!11390 t!2631))

(declare-fun b_and!753 () Bool)

(assert (= b_and!751 (and (=> t!2631 result!459) b_and!753)))

(declare-fun m!7727 () Bool)

(assert (=> b!11390 m!7727))

(declare-fun m!7729 () Bool)

(assert (=> b!11391 m!7729))

(assert (=> b!11301 d!1435))

(declare-fun d!1437 () Bool)

(declare-fun e!6729 () Bool)

(assert (=> d!1437 e!6729))

(declare-fun res!9507 () Bool)

(assert (=> d!1437 (=> (not res!9507) (not e!6729))))

(declare-fun lt!2909 () ListLongMap!353)

(assert (=> d!1437 (= res!9507 (contains!157 lt!2909 (_1!186 lt!2842)))))

(declare-fun lt!2908 () List!336)

(assert (=> d!1437 (= lt!2909 (ListLongMap!354 lt!2908))))

(declare-fun lt!2910 () Unit!247)

(declare-fun lt!2911 () Unit!247)

(assert (=> d!1437 (= lt!2910 lt!2911)))

(assert (=> d!1437 (= (getValueByKey!26 lt!2908 (_1!186 lt!2842)) (Some!31 (_2!186 lt!2842)))))

(assert (=> d!1437 (= lt!2911 (lemmaContainsTupThenGetReturnValue!10 lt!2908 (_1!186 lt!2842) (_2!186 lt!2842)))))

(assert (=> d!1437 (= lt!2908 (insertStrictlySorted!10 (toList!192 lm!227) (_1!186 lt!2842) (_2!186 lt!2842)))))

(assert (=> d!1437 (= (+!26 lm!227 lt!2842) lt!2909)))

(declare-fun b!11394 () Bool)

(declare-fun res!9508 () Bool)

(assert (=> b!11394 (=> (not res!9508) (not e!6729))))

(assert (=> b!11394 (= res!9508 (= (getValueByKey!26 (toList!192 lt!2909) (_1!186 lt!2842)) (Some!31 (_2!186 lt!2842))))))

(declare-fun b!11395 () Bool)

(assert (=> b!11395 (= e!6729 (contains!159 (toList!192 lt!2909) lt!2842))))

(assert (= (and d!1437 res!9507) b!11394))

(assert (= (and b!11394 res!9508) b!11395))

(declare-fun m!7731 () Bool)

(assert (=> d!1437 m!7731))

(declare-fun m!7733 () Bool)

(assert (=> d!1437 m!7733))

(declare-fun m!7735 () Bool)

(assert (=> d!1437 m!7735))

(declare-fun m!7737 () Bool)

(assert (=> d!1437 m!7737))

(declare-fun m!7739 () Bool)

(assert (=> b!11394 m!7739))

(declare-fun m!7741 () Bool)

(assert (=> b!11395 m!7741))

(assert (=> b!11301 d!1437))

(declare-fun d!1439 () Bool)

(declare-fun res!9512 () Bool)

(declare-fun e!6733 () Bool)

(assert (=> d!1439 (=> res!9512 e!6733)))

(assert (=> d!1439 (= res!9512 ((_ is Nil!333) (toList!192 (+!26 lm!227 (tuple2!373 (_1!186 lt!2842) (_2!186 lt!2842))))))))

(assert (=> d!1439 (= (forall!59 (toList!192 (+!26 lm!227 (tuple2!373 (_1!186 lt!2842) (_2!186 lt!2842)))) p!216) e!6733)))

(declare-fun b!11400 () Bool)

(declare-fun e!6734 () Bool)

(assert (=> b!11400 (= e!6733 e!6734)))

(declare-fun res!9513 () Bool)

(assert (=> b!11400 (=> (not res!9513) (not e!6734))))

(assert (=> b!11400 (= res!9513 (dynLambda!70 p!216 (h!898 (toList!192 (+!26 lm!227 (tuple2!373 (_1!186 lt!2842) (_2!186 lt!2842)))))))))

(declare-fun b!11401 () Bool)

(assert (=> b!11401 (= e!6734 (forall!59 (t!2621 (toList!192 (+!26 lm!227 (tuple2!373 (_1!186 lt!2842) (_2!186 lt!2842))))) p!216))))

(assert (= (and d!1439 (not res!9512)) b!11400))

(assert (= (and b!11400 res!9513) b!11401))

(declare-fun b_lambda!645 () Bool)

(assert (=> (not b_lambda!645) (not b!11400)))

(declare-fun t!2635 () Bool)

(declare-fun tb!295 () Bool)

(assert (=> (and start!1500 (= p!216 p!216) t!2635) tb!295))

(declare-fun result!463 () Bool)

(assert (=> tb!295 (= result!463 true)))

(assert (=> b!11400 t!2635))

(declare-fun b_and!757 () Bool)

(assert (= b_and!753 (and (=> t!2635 result!463) b_and!757)))

(declare-fun m!7747 () Bool)

(assert (=> b!11400 m!7747))

(declare-fun m!7749 () Bool)

(assert (=> b!11401 m!7749))

(assert (=> b!11301 d!1439))

(declare-fun d!1443 () Bool)

(declare-fun res!9514 () Bool)

(declare-fun e!6735 () Bool)

(assert (=> d!1443 (=> res!9514 e!6735)))

(assert (=> d!1443 (= res!9514 ((_ is Nil!333) lt!2844))))

(assert (=> d!1443 (= (forall!59 lt!2844 p!216) e!6735)))

(declare-fun b!11402 () Bool)

(declare-fun e!6736 () Bool)

(assert (=> b!11402 (= e!6735 e!6736)))

(declare-fun res!9515 () Bool)

(assert (=> b!11402 (=> (not res!9515) (not e!6736))))

(assert (=> b!11402 (= res!9515 (dynLambda!70 p!216 (h!898 lt!2844)))))

(declare-fun b!11403 () Bool)

(assert (=> b!11403 (= e!6736 (forall!59 (t!2621 lt!2844) p!216))))

(assert (= (and d!1443 (not res!9514)) b!11402))

(assert (= (and b!11402 res!9515) b!11403))

(declare-fun b_lambda!647 () Bool)

(assert (=> (not b_lambda!647) (not b!11402)))

(declare-fun t!2637 () Bool)

(declare-fun tb!297 () Bool)

(assert (=> (and start!1500 (= p!216 p!216) t!2637) tb!297))

(declare-fun result!465 () Bool)

(assert (=> tb!297 (= result!465 true)))

(assert (=> b!11402 t!2637))

(declare-fun b_and!759 () Bool)

(assert (= b_and!757 (and (=> t!2637 result!465) b_and!759)))

(declare-fun m!7751 () Bool)

(assert (=> b!11402 m!7751))

(declare-fun m!7753 () Bool)

(assert (=> b!11403 m!7753))

(assert (=> b!11306 d!1443))

(declare-fun d!1447 () Bool)

(declare-fun lt!2922 () Int)

(assert (=> d!1447 (>= lt!2922 0)))

(declare-fun e!6749 () Int)

(assert (=> d!1447 (= lt!2922 e!6749)))

(declare-fun c!956 () Bool)

(assert (=> d!1447 (= c!956 ((_ is Nil!333) lt!2844))))

(assert (=> d!1447 (= (ListPrimitiveSize!10 lt!2844) lt!2922)))

(declare-fun b!11419 () Bool)

(assert (=> b!11419 (= e!6749 0)))

(declare-fun b!11420 () Bool)

(assert (=> b!11420 (= e!6749 (+ 1 (ListPrimitiveSize!10 (t!2621 lt!2844))))))

(assert (= (and d!1447 c!956) b!11419))

(assert (= (and d!1447 (not c!956)) b!11420))

(declare-fun m!7783 () Bool)

(assert (=> b!11420 m!7783))

(assert (=> b!11305 d!1447))

(declare-fun d!1459 () Bool)

(declare-fun lt!2923 () Int)

(assert (=> d!1459 (>= lt!2923 0)))

(declare-fun e!6750 () Int)

(assert (=> d!1459 (= lt!2923 e!6750)))

(declare-fun c!957 () Bool)

(assert (=> d!1459 (= c!957 ((_ is Nil!333) kvs!4))))

(assert (=> d!1459 (= (ListPrimitiveSize!10 kvs!4) lt!2923)))

(declare-fun b!11421 () Bool)

(assert (=> b!11421 (= e!6750 0)))

(declare-fun b!11422 () Bool)

(assert (=> b!11422 (= e!6750 (+ 1 (ListPrimitiveSize!10 (t!2621 kvs!4))))))

(assert (= (and d!1459 c!957) b!11421))

(assert (= (and d!1459 (not c!957)) b!11422))

(declare-fun m!7787 () Bool)

(assert (=> b!11422 m!7787))

(assert (=> b!11305 d!1459))

(declare-fun d!1461 () Bool)

(declare-fun res!9527 () Bool)

(declare-fun e!6751 () Bool)

(assert (=> d!1461 (=> res!9527 e!6751)))

(assert (=> d!1461 (= res!9527 ((_ is Nil!333) kvs!4))))

(assert (=> d!1461 (= (forall!59 kvs!4 p!216) e!6751)))

(declare-fun b!11423 () Bool)

(declare-fun e!6752 () Bool)

(assert (=> b!11423 (= e!6751 e!6752)))

(declare-fun res!9528 () Bool)

(assert (=> b!11423 (=> (not res!9528) (not e!6752))))

(assert (=> b!11423 (= res!9528 (dynLambda!70 p!216 (h!898 kvs!4)))))

(declare-fun b!11424 () Bool)

(assert (=> b!11424 (= e!6752 (forall!59 (t!2621 kvs!4) p!216))))

(assert (= (and d!1461 (not res!9527)) b!11423))

(assert (= (and b!11423 res!9528) b!11424))

(declare-fun b_lambda!659 () Bool)

(assert (=> (not b_lambda!659) (not b!11423)))

(declare-fun t!2649 () Bool)

(declare-fun tb!309 () Bool)

(assert (=> (and start!1500 (= p!216 p!216) t!2649) tb!309))

(declare-fun result!477 () Bool)

(assert (=> tb!309 (= result!477 true)))

(assert (=> b!11423 t!2649))

(declare-fun b_and!771 () Bool)

(assert (= b_and!759 (and (=> t!2649 result!477) b_and!771)))

(declare-fun m!7791 () Bool)

(assert (=> b!11423 m!7791))

(declare-fun m!7793 () Bool)

(assert (=> b!11424 m!7793))

(assert (=> b!11303 d!1461))

(declare-fun d!1469 () Bool)

(assert (=> d!1469 (= (isEmpty!66 kvs!4) ((_ is Nil!333) kvs!4))))

(assert (=> b!11302 d!1469))

(declare-fun d!1473 () Bool)

(declare-fun res!9533 () Bool)

(declare-fun e!6757 () Bool)

(assert (=> d!1473 (=> res!9533 e!6757)))

(assert (=> d!1473 (= res!9533 ((_ is Nil!333) (toList!192 lm!227)))))

(assert (=> d!1473 (= (forall!59 (toList!192 lm!227) p!216) e!6757)))

(declare-fun b!11429 () Bool)

(declare-fun e!6758 () Bool)

(assert (=> b!11429 (= e!6757 e!6758)))

(declare-fun res!9534 () Bool)

(assert (=> b!11429 (=> (not res!9534) (not e!6758))))

(assert (=> b!11429 (= res!9534 (dynLambda!70 p!216 (h!898 (toList!192 lm!227))))))

(declare-fun b!11430 () Bool)

(assert (=> b!11430 (= e!6758 (forall!59 (t!2621 (toList!192 lm!227)) p!216))))

(assert (= (and d!1473 (not res!9533)) b!11429))

(assert (= (and b!11429 res!9534) b!11430))

(declare-fun b_lambda!665 () Bool)

(assert (=> (not b_lambda!665) (not b!11429)))

(declare-fun t!2655 () Bool)

(declare-fun tb!315 () Bool)

(assert (=> (and start!1500 (= p!216 p!216) t!2655) tb!315))

(declare-fun result!483 () Bool)

(assert (=> tb!315 (= result!483 true)))

(assert (=> b!11429 t!2655))

(declare-fun b_and!777 () Bool)

(assert (= b_and!771 (and (=> t!2655 result!483) b_and!777)))

(declare-fun m!7803 () Bool)

(assert (=> b!11429 m!7803))

(declare-fun m!7805 () Bool)

(assert (=> b!11430 m!7805))

(assert (=> start!1500 d!1473))

(declare-fun d!1477 () Bool)

(declare-fun isStrictlySorted!42 (List!336) Bool)

(assert (=> d!1477 (= (inv!558 lm!227) (isStrictlySorted!42 (toList!192 lm!227)))))

(declare-fun bs!433 () Bool)

(assert (= bs!433 d!1477))

(declare-fun m!7809 () Bool)

(assert (=> bs!433 m!7809))

(assert (=> start!1500 d!1477))

(declare-fun b!11451 () Bool)

(declare-fun e!6770 () Bool)

(declare-fun tp!1880 () Bool)

(assert (=> b!11451 (= e!6770 (and tp_is_empty!559 tp!1880))))

(assert (=> b!11300 (= tp!1857 e!6770)))

(assert (= (and b!11300 ((_ is Cons!332) (t!2621 kvs!4))) b!11451))

(declare-fun b!11452 () Bool)

(declare-fun e!6771 () Bool)

(declare-fun tp!1881 () Bool)

(assert (=> b!11452 (= e!6771 (and tp_is_empty!559 tp!1881))))

(assert (=> b!11304 (= tp!1859 e!6771)))

(assert (= (and b!11304 ((_ is Cons!332) (toList!192 lm!227))) b!11452))

(declare-fun b_lambda!669 () Bool)

(assert (= b_lambda!641 (or (and start!1500 b_free!445) b_lambda!669)))

(declare-fun b_lambda!671 () Bool)

(assert (= b_lambda!639 (or (and start!1500 b_free!445) b_lambda!671)))

(declare-fun b_lambda!673 () Bool)

(assert (= b_lambda!647 (or (and start!1500 b_free!445) b_lambda!673)))

(declare-fun b_lambda!675 () Bool)

(assert (= b_lambda!659 (or (and start!1500 b_free!445) b_lambda!675)))

(declare-fun b_lambda!677 () Bool)

(assert (= b_lambda!645 (or (and start!1500 b_free!445) b_lambda!677)))

(declare-fun b_lambda!679 () Bool)

(assert (= b_lambda!665 (or (and start!1500 b_free!445) b_lambda!679)))

(check-sat (not d!1421) (not b!11403) (not b_lambda!677) (not b_lambda!675) (not b!11391) (not b_lambda!679) (not b!11401) (not d!1477) (not b!11383) (not b!11424) (not b_lambda!673) (not b_next!445) tp_is_empty!559 (not b!11395) (not b!11394) (not d!1409) (not b!11430) (not b_lambda!671) (not b!11422) (not d!1437) (not b!11420) (not b_lambda!669) (not b!11452) b_and!777 (not b!11451) (not b!11384))
(check-sat b_and!777 (not b_next!445))
