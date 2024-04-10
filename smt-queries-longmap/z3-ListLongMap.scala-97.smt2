; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1502 () Bool)

(assert start!1502)

(declare-fun b_free!447 () Bool)

(declare-fun b_next!447 () Bool)

(assert (=> start!1502 (= b_free!447 (not b_next!447))))

(declare-fun tp!1868 () Bool)

(declare-fun b_and!743 () Bool)

(assert (=> start!1502 (= tp!1868 b_and!743)))

(declare-fun b!11321 () Bool)

(declare-fun res!9444 () Bool)

(declare-fun e!6683 () Bool)

(assert (=> b!11321 (=> (not res!9444) (not e!6683))))

(declare-datatypes ((B!388 0))(
  ( (B!389 (val!289 Int)) )
))
(declare-datatypes ((tuple2!378 0))(
  ( (tuple2!379 (_1!189 (_ BitVec 64)) (_2!189 B!388)) )
))
(declare-datatypes ((List!341 0))(
  ( (Nil!338) (Cons!337 (h!903 tuple2!378) (t!2626 List!341)) )
))
(declare-fun kvs!4 () List!341)

(declare-fun p!216 () Int)

(declare-fun forall!60 (List!341 Int) Bool)

(assert (=> b!11321 (= res!9444 (forall!60 kvs!4 p!216))))

(declare-fun b!11322 () Bool)

(declare-fun e!6680 () Bool)

(assert (=> b!11322 (= e!6683 (not e!6680))))

(declare-fun res!9446 () Bool)

(assert (=> b!11322 (=> res!9446 e!6680)))

(declare-datatypes ((ListLongMap!359 0))(
  ( (ListLongMap!360 (toList!195 List!341)) )
))
(declare-fun lm!227 () ListLongMap!359)

(declare-fun lt!2852 () tuple2!378)

(declare-fun +!27 (ListLongMap!359 tuple2!378) ListLongMap!359)

(assert (=> b!11322 (= res!9446 (not (forall!60 (toList!195 (+!27 lm!227 lt!2852)) p!216)))))

(declare-fun lt!2851 () List!341)

(declare-fun tail!54 (List!341) List!341)

(assert (=> b!11322 (= lt!2851 (tail!54 kvs!4))))

(assert (=> b!11322 (forall!60 (toList!195 (+!27 lm!227 (tuple2!379 (_1!189 lt!2852) (_2!189 lt!2852)))) p!216)))

(declare-datatypes ((Unit!239 0))(
  ( (Unit!240) )
))
(declare-fun lt!2853 () Unit!239)

(declare-fun addValidProp!15 (ListLongMap!359 Int (_ BitVec 64) B!388) Unit!239)

(assert (=> b!11322 (= lt!2853 (addValidProp!15 lm!227 p!216 (_1!189 lt!2852) (_2!189 lt!2852)))))

(declare-fun head!774 (List!341) tuple2!378)

(assert (=> b!11322 (= lt!2852 (head!774 kvs!4))))

(declare-fun b!11323 () Bool)

(declare-fun e!6682 () Bool)

(declare-fun tp!1867 () Bool)

(assert (=> b!11323 (= e!6682 tp!1867)))

(declare-fun b!11324 () Bool)

(declare-fun ListPrimitiveSize!11 (List!341) Int)

(assert (=> b!11324 (= e!6680 (< (ListPrimitiveSize!11 lt!2851) (ListPrimitiveSize!11 kvs!4)))))

(declare-fun b!11325 () Bool)

(declare-fun e!6681 () Bool)

(declare-fun tp_is_empty!561 () Bool)

(declare-fun tp!1866 () Bool)

(assert (=> b!11325 (= e!6681 (and tp_is_empty!561 tp!1866))))

(declare-fun b!11326 () Bool)

(declare-fun res!9448 () Bool)

(assert (=> b!11326 (=> (not res!9448) (not e!6683))))

(declare-fun isEmpty!67 (List!341) Bool)

(assert (=> b!11326 (= res!9448 (not (isEmpty!67 kvs!4)))))

(declare-fun b!11327 () Bool)

(declare-fun res!9447 () Bool)

(assert (=> b!11327 (=> res!9447 e!6680)))

(assert (=> b!11327 (= res!9447 (not (forall!60 lt!2851 p!216)))))

(declare-fun res!9445 () Bool)

(assert (=> start!1502 (=> (not res!9445) (not e!6683))))

(assert (=> start!1502 (= res!9445 (forall!60 (toList!195 lm!227) p!216))))

(assert (=> start!1502 e!6683))

(declare-fun inv!559 (ListLongMap!359) Bool)

(assert (=> start!1502 (and (inv!559 lm!227) e!6682)))

(assert (=> start!1502 tp!1868))

(assert (=> start!1502 e!6681))

(assert (= (and start!1502 res!9445) b!11321))

(assert (= (and b!11321 res!9444) b!11326))

(assert (= (and b!11326 res!9448) b!11322))

(assert (= (and b!11322 (not res!9446)) b!11327))

(assert (= (and b!11327 (not res!9447)) b!11324))

(assert (= start!1502 b!11323))

(get-info :version)

(assert (= (and start!1502 ((_ is Cons!337) kvs!4)) b!11325))

(declare-fun m!7611 () Bool)

(assert (=> b!11322 m!7611))

(declare-fun m!7613 () Bool)

(assert (=> b!11322 m!7613))

(declare-fun m!7615 () Bool)

(assert (=> b!11322 m!7615))

(declare-fun m!7617 () Bool)

(assert (=> b!11322 m!7617))

(declare-fun m!7619 () Bool)

(assert (=> b!11322 m!7619))

(declare-fun m!7621 () Bool)

(assert (=> b!11322 m!7621))

(declare-fun m!7623 () Bool)

(assert (=> b!11322 m!7623))

(declare-fun m!7625 () Bool)

(assert (=> b!11324 m!7625))

(declare-fun m!7627 () Bool)

(assert (=> b!11324 m!7627))

(declare-fun m!7629 () Bool)

(assert (=> b!11327 m!7629))

(declare-fun m!7631 () Bool)

(assert (=> b!11326 m!7631))

(declare-fun m!7633 () Bool)

(assert (=> b!11321 m!7633))

(declare-fun m!7635 () Bool)

(assert (=> start!1502 m!7635))

(declare-fun m!7637 () Bool)

(assert (=> start!1502 m!7637))

(check-sat (not b!11321) (not b!11326) (not b!11323) (not b_next!447) (not b!11322) (not b!11324) tp_is_empty!561 b_and!743 (not b!11325) (not b!11327) (not start!1502))
(check-sat b_and!743 (not b_next!447))
(get-model)

(declare-fun d!1409 () Bool)

(declare-fun res!9478 () Bool)

(declare-fun e!6710 () Bool)

(assert (=> d!1409 (=> res!9478 e!6710)))

(assert (=> d!1409 (= res!9478 ((_ is Nil!338) lt!2851))))

(assert (=> d!1409 (= (forall!60 lt!2851 p!216) e!6710)))

(declare-fun b!11363 () Bool)

(declare-fun e!6711 () Bool)

(assert (=> b!11363 (= e!6710 e!6711)))

(declare-fun res!9479 () Bool)

(assert (=> b!11363 (=> (not res!9479) (not e!6711))))

(declare-fun dynLambda!71 (Int tuple2!378) Bool)

(assert (=> b!11363 (= res!9479 (dynLambda!71 p!216 (h!903 lt!2851)))))

(declare-fun b!11364 () Bool)

(assert (=> b!11364 (= e!6711 (forall!60 (t!2626 lt!2851) p!216))))

(assert (= (and d!1409 (not res!9478)) b!11363))

(assert (= (and b!11363 res!9479) b!11364))

(declare-fun b_lambda!637 () Bool)

(assert (=> (not b_lambda!637) (not b!11363)))

(declare-fun t!2631 () Bool)

(declare-fun tb!287 () Bool)

(assert (=> (and start!1502 (= p!216 p!216) t!2631) tb!287))

(declare-fun result!455 () Bool)

(assert (=> tb!287 (= result!455 true)))

(assert (=> b!11363 t!2631))

(declare-fun b_and!749 () Bool)

(assert (= b_and!743 (and (=> t!2631 result!455) b_and!749)))

(declare-fun m!7671 () Bool)

(assert (=> b!11363 m!7671))

(declare-fun m!7673 () Bool)

(assert (=> b!11364 m!7673))

(assert (=> b!11327 d!1409))

(declare-fun d!1417 () Bool)

(declare-fun res!9482 () Bool)

(declare-fun e!6714 () Bool)

(assert (=> d!1417 (=> res!9482 e!6714)))

(assert (=> d!1417 (= res!9482 ((_ is Nil!338) kvs!4))))

(assert (=> d!1417 (= (forall!60 kvs!4 p!216) e!6714)))

(declare-fun b!11367 () Bool)

(declare-fun e!6715 () Bool)

(assert (=> b!11367 (= e!6714 e!6715)))

(declare-fun res!9483 () Bool)

(assert (=> b!11367 (=> (not res!9483) (not e!6715))))

(assert (=> b!11367 (= res!9483 (dynLambda!71 p!216 (h!903 kvs!4)))))

(declare-fun b!11368 () Bool)

(assert (=> b!11368 (= e!6715 (forall!60 (t!2626 kvs!4) p!216))))

(assert (= (and d!1417 (not res!9482)) b!11367))

(assert (= (and b!11367 res!9483) b!11368))

(declare-fun b_lambda!641 () Bool)

(assert (=> (not b_lambda!641) (not b!11367)))

(declare-fun t!2634 () Bool)

(declare-fun tb!290 () Bool)

(assert (=> (and start!1502 (= p!216 p!216) t!2634) tb!290))

(declare-fun result!458 () Bool)

(assert (=> tb!290 (= result!458 true)))

(assert (=> b!11367 t!2634))

(declare-fun b_and!752 () Bool)

(assert (= b_and!749 (and (=> t!2634 result!458) b_and!752)))

(declare-fun m!7677 () Bool)

(assert (=> b!11367 m!7677))

(declare-fun m!7680 () Bool)

(assert (=> b!11368 m!7680))

(assert (=> b!11321 d!1417))

(declare-fun d!1420 () Bool)

(assert (=> d!1420 (= (isEmpty!67 kvs!4) ((_ is Nil!338) kvs!4))))

(assert (=> b!11326 d!1420))

(declare-fun d!1425 () Bool)

(declare-fun lt!2869 () Int)

(assert (=> d!1425 (>= lt!2869 0)))

(declare-fun e!6726 () Int)

(assert (=> d!1425 (= lt!2869 e!6726)))

(declare-fun c!960 () Bool)

(assert (=> d!1425 (= c!960 ((_ is Nil!338) lt!2851))))

(assert (=> d!1425 (= (ListPrimitiveSize!11 lt!2851) lt!2869)))

(declare-fun b!11385 () Bool)

(assert (=> b!11385 (= e!6726 0)))

(declare-fun b!11386 () Bool)

(assert (=> b!11386 (= e!6726 (+ 1 (ListPrimitiveSize!11 (t!2626 lt!2851))))))

(assert (= (and d!1425 c!960) b!11385))

(assert (= (and d!1425 (not c!960)) b!11386))

(declare-fun m!7695 () Bool)

(assert (=> b!11386 m!7695))

(assert (=> b!11324 d!1425))

(declare-fun d!1437 () Bool)

(declare-fun lt!2870 () Int)

(assert (=> d!1437 (>= lt!2870 0)))

(declare-fun e!6727 () Int)

(assert (=> d!1437 (= lt!2870 e!6727)))

(declare-fun c!961 () Bool)

(assert (=> d!1437 (= c!961 ((_ is Nil!338) kvs!4))))

(assert (=> d!1437 (= (ListPrimitiveSize!11 kvs!4) lt!2870)))

(declare-fun b!11387 () Bool)

(assert (=> b!11387 (= e!6727 0)))

(declare-fun b!11388 () Bool)

(assert (=> b!11388 (= e!6727 (+ 1 (ListPrimitiveSize!11 (t!2626 kvs!4))))))

(assert (= (and d!1437 c!961) b!11387))

(assert (= (and d!1437 (not c!961)) b!11388))

(declare-fun m!7697 () Bool)

(assert (=> b!11388 m!7697))

(assert (=> b!11324 d!1437))

(declare-fun d!1439 () Bool)

(declare-fun res!9488 () Bool)

(declare-fun e!6728 () Bool)

(assert (=> d!1439 (=> res!9488 e!6728)))

(assert (=> d!1439 (= res!9488 ((_ is Nil!338) (toList!195 lm!227)))))

(assert (=> d!1439 (= (forall!60 (toList!195 lm!227) p!216) e!6728)))

(declare-fun b!11389 () Bool)

(declare-fun e!6729 () Bool)

(assert (=> b!11389 (= e!6728 e!6729)))

(declare-fun res!9489 () Bool)

(assert (=> b!11389 (=> (not res!9489) (not e!6729))))

(assert (=> b!11389 (= res!9489 (dynLambda!71 p!216 (h!903 (toList!195 lm!227))))))

(declare-fun b!11390 () Bool)

(assert (=> b!11390 (= e!6729 (forall!60 (t!2626 (toList!195 lm!227)) p!216))))

(assert (= (and d!1439 (not res!9488)) b!11389))

(assert (= (and b!11389 res!9489) b!11390))

(declare-fun b_lambda!647 () Bool)

(assert (=> (not b_lambda!647) (not b!11389)))

(declare-fun t!2641 () Bool)

(declare-fun tb!297 () Bool)

(assert (=> (and start!1502 (= p!216 p!216) t!2641) tb!297))

(declare-fun result!465 () Bool)

(assert (=> tb!297 (= result!465 true)))

(assert (=> b!11389 t!2641))

(declare-fun b_and!759 () Bool)

(assert (= b_and!752 (and (=> t!2641 result!465) b_and!759)))

(declare-fun m!7701 () Bool)

(assert (=> b!11389 m!7701))

(declare-fun m!7703 () Bool)

(assert (=> b!11390 m!7703))

(assert (=> start!1502 d!1439))

(declare-fun d!1445 () Bool)

(declare-fun isStrictlySorted!44 (List!341) Bool)

(assert (=> d!1445 (= (inv!559 lm!227) (isStrictlySorted!44 (toList!195 lm!227)))))

(declare-fun bs!433 () Bool)

(assert (= bs!433 d!1445))

(declare-fun m!7709 () Bool)

(assert (=> bs!433 m!7709))

(assert (=> start!1502 d!1445))

(declare-fun d!1449 () Bool)

(declare-fun res!9494 () Bool)

(declare-fun e!6734 () Bool)

(assert (=> d!1449 (=> res!9494 e!6734)))

(assert (=> d!1449 (= res!9494 ((_ is Nil!338) (toList!195 (+!27 lm!227 lt!2852))))))

(assert (=> d!1449 (= (forall!60 (toList!195 (+!27 lm!227 lt!2852)) p!216) e!6734)))

(declare-fun b!11396 () Bool)

(declare-fun e!6735 () Bool)

(assert (=> b!11396 (= e!6734 e!6735)))

(declare-fun res!9495 () Bool)

(assert (=> b!11396 (=> (not res!9495) (not e!6735))))

(assert (=> b!11396 (= res!9495 (dynLambda!71 p!216 (h!903 (toList!195 (+!27 lm!227 lt!2852)))))))

(declare-fun b!11397 () Bool)

(assert (=> b!11397 (= e!6735 (forall!60 (t!2626 (toList!195 (+!27 lm!227 lt!2852))) p!216))))

(assert (= (and d!1449 (not res!9494)) b!11396))

(assert (= (and b!11396 res!9495) b!11397))

(declare-fun b_lambda!651 () Bool)

(assert (=> (not b_lambda!651) (not b!11396)))

(declare-fun t!2645 () Bool)

(declare-fun tb!301 () Bool)

(assert (=> (and start!1502 (= p!216 p!216) t!2645) tb!301))

(declare-fun result!469 () Bool)

(assert (=> tb!301 (= result!469 true)))

(assert (=> b!11396 t!2645))

(declare-fun b_and!763 () Bool)

(assert (= b_and!759 (and (=> t!2645 result!469) b_and!763)))

(declare-fun m!7711 () Bool)

(assert (=> b!11396 m!7711))

(declare-fun m!7713 () Bool)

(assert (=> b!11397 m!7713))

(assert (=> b!11322 d!1449))

(declare-fun d!1451 () Bool)

(declare-fun e!6749 () Bool)

(assert (=> d!1451 e!6749))

(declare-fun res!9518 () Bool)

(assert (=> d!1451 (=> (not res!9518) (not e!6749))))

(declare-fun lt!2908 () ListLongMap!359)

(declare-fun contains!162 (ListLongMap!359 (_ BitVec 64)) Bool)

(assert (=> d!1451 (= res!9518 (contains!162 lt!2908 (_1!189 lt!2852)))))

(declare-fun lt!2911 () List!341)

(assert (=> d!1451 (= lt!2908 (ListLongMap!360 lt!2911))))

(declare-fun lt!2909 () Unit!239)

(declare-fun lt!2910 () Unit!239)

(assert (=> d!1451 (= lt!2909 lt!2910)))

(declare-datatypes ((Option!34 0))(
  ( (Some!33 (v!1348 B!388)) (None!32) )
))
(declare-fun getValueByKey!28 (List!341 (_ BitVec 64)) Option!34)

(assert (=> d!1451 (= (getValueByKey!28 lt!2911 (_1!189 lt!2852)) (Some!33 (_2!189 lt!2852)))))

(declare-fun lemmaContainsTupThenGetReturnValue!12 (List!341 (_ BitVec 64) B!388) Unit!239)

(assert (=> d!1451 (= lt!2910 (lemmaContainsTupThenGetReturnValue!12 lt!2911 (_1!189 lt!2852) (_2!189 lt!2852)))))

(declare-fun insertStrictlySorted!12 (List!341 (_ BitVec 64) B!388) List!341)

(assert (=> d!1451 (= lt!2911 (insertStrictlySorted!12 (toList!195 lm!227) (_1!189 lt!2852) (_2!189 lt!2852)))))

(assert (=> d!1451 (= (+!27 lm!227 lt!2852) lt!2908)))

(declare-fun b!11420 () Bool)

(declare-fun res!9517 () Bool)

(assert (=> b!11420 (=> (not res!9517) (not e!6749))))

(assert (=> b!11420 (= res!9517 (= (getValueByKey!28 (toList!195 lt!2908) (_1!189 lt!2852)) (Some!33 (_2!189 lt!2852))))))

(declare-fun b!11421 () Bool)

(declare-fun contains!163 (List!341 tuple2!378) Bool)

(assert (=> b!11421 (= e!6749 (contains!163 (toList!195 lt!2908) lt!2852))))

(assert (= (and d!1451 res!9518) b!11420))

(assert (= (and b!11420 res!9517) b!11421))

(declare-fun m!7747 () Bool)

(assert (=> d!1451 m!7747))

(declare-fun m!7749 () Bool)

(assert (=> d!1451 m!7749))

(declare-fun m!7751 () Bool)

(assert (=> d!1451 m!7751))

(declare-fun m!7753 () Bool)

(assert (=> d!1451 m!7753))

(declare-fun m!7755 () Bool)

(assert (=> b!11420 m!7755))

(declare-fun m!7759 () Bool)

(assert (=> b!11421 m!7759))

(assert (=> b!11322 d!1451))

(declare-fun d!1463 () Bool)

(declare-fun e!6751 () Bool)

(assert (=> d!1463 e!6751))

(declare-fun res!9521 () Bool)

(assert (=> d!1463 (=> (not res!9521) (not e!6751))))

(declare-fun lt!2913 () ListLongMap!359)

(assert (=> d!1463 (= res!9521 (contains!162 lt!2913 (_1!189 (tuple2!379 (_1!189 lt!2852) (_2!189 lt!2852)))))))

(declare-fun lt!2916 () List!341)

(assert (=> d!1463 (= lt!2913 (ListLongMap!360 lt!2916))))

(declare-fun lt!2914 () Unit!239)

(declare-fun lt!2915 () Unit!239)

(assert (=> d!1463 (= lt!2914 lt!2915)))

(assert (=> d!1463 (= (getValueByKey!28 lt!2916 (_1!189 (tuple2!379 (_1!189 lt!2852) (_2!189 lt!2852)))) (Some!33 (_2!189 (tuple2!379 (_1!189 lt!2852) (_2!189 lt!2852)))))))

(assert (=> d!1463 (= lt!2915 (lemmaContainsTupThenGetReturnValue!12 lt!2916 (_1!189 (tuple2!379 (_1!189 lt!2852) (_2!189 lt!2852))) (_2!189 (tuple2!379 (_1!189 lt!2852) (_2!189 lt!2852)))))))

(assert (=> d!1463 (= lt!2916 (insertStrictlySorted!12 (toList!195 lm!227) (_1!189 (tuple2!379 (_1!189 lt!2852) (_2!189 lt!2852))) (_2!189 (tuple2!379 (_1!189 lt!2852) (_2!189 lt!2852)))))))

(assert (=> d!1463 (= (+!27 lm!227 (tuple2!379 (_1!189 lt!2852) (_2!189 lt!2852))) lt!2913)))

(declare-fun b!11423 () Bool)

(declare-fun res!9520 () Bool)

(assert (=> b!11423 (=> (not res!9520) (not e!6751))))

(assert (=> b!11423 (= res!9520 (= (getValueByKey!28 (toList!195 lt!2913) (_1!189 (tuple2!379 (_1!189 lt!2852) (_2!189 lt!2852)))) (Some!33 (_2!189 (tuple2!379 (_1!189 lt!2852) (_2!189 lt!2852))))))))

(declare-fun b!11424 () Bool)

(assert (=> b!11424 (= e!6751 (contains!163 (toList!195 lt!2913) (tuple2!379 (_1!189 lt!2852) (_2!189 lt!2852))))))

(assert (= (and d!1463 res!9521) b!11423))

(assert (= (and b!11423 res!9520) b!11424))

(declare-fun m!7767 () Bool)

(assert (=> d!1463 m!7767))

(declare-fun m!7769 () Bool)

(assert (=> d!1463 m!7769))

(declare-fun m!7771 () Bool)

(assert (=> d!1463 m!7771))

(declare-fun m!7773 () Bool)

(assert (=> d!1463 m!7773))

(declare-fun m!7775 () Bool)

(assert (=> b!11423 m!7775))

(declare-fun m!7777 () Bool)

(assert (=> b!11424 m!7777))

(assert (=> b!11322 d!1463))

(declare-fun d!1467 () Bool)

(assert (=> d!1467 (= (tail!54 kvs!4) (t!2626 kvs!4))))

(assert (=> b!11322 d!1467))

(declare-fun d!1469 () Bool)

(declare-fun res!9526 () Bool)

(declare-fun e!6759 () Bool)

(assert (=> d!1469 (=> res!9526 e!6759)))

(assert (=> d!1469 (= res!9526 ((_ is Nil!338) (toList!195 (+!27 lm!227 (tuple2!379 (_1!189 lt!2852) (_2!189 lt!2852))))))))

(assert (=> d!1469 (= (forall!60 (toList!195 (+!27 lm!227 (tuple2!379 (_1!189 lt!2852) (_2!189 lt!2852)))) p!216) e!6759)))

(declare-fun b!11435 () Bool)

(declare-fun e!6760 () Bool)

(assert (=> b!11435 (= e!6759 e!6760)))

(declare-fun res!9527 () Bool)

(assert (=> b!11435 (=> (not res!9527) (not e!6760))))

(assert (=> b!11435 (= res!9527 (dynLambda!71 p!216 (h!903 (toList!195 (+!27 lm!227 (tuple2!379 (_1!189 lt!2852) (_2!189 lt!2852)))))))))

(declare-fun b!11436 () Bool)

(assert (=> b!11436 (= e!6760 (forall!60 (t!2626 (toList!195 (+!27 lm!227 (tuple2!379 (_1!189 lt!2852) (_2!189 lt!2852))))) p!216))))

(assert (= (and d!1469 (not res!9526)) b!11435))

(assert (= (and b!11435 res!9527) b!11436))

(declare-fun b_lambda!673 () Bool)

(assert (=> (not b_lambda!673) (not b!11435)))

(declare-fun t!2655 () Bool)

(declare-fun tb!311 () Bool)

(assert (=> (and start!1502 (= p!216 p!216) t!2655) tb!311))

(declare-fun result!481 () Bool)

(assert (=> tb!311 (= result!481 true)))

(assert (=> b!11435 t!2655))

(declare-fun b_and!773 () Bool)

(assert (= b_and!763 (and (=> t!2655 result!481) b_and!773)))

(declare-fun m!7791 () Bool)

(assert (=> b!11435 m!7791))

(declare-fun m!7793 () Bool)

(assert (=> b!11436 m!7793))

(assert (=> b!11322 d!1469))

(declare-fun d!1473 () Bool)

(assert (=> d!1473 (= (head!774 kvs!4) (h!903 kvs!4))))

(assert (=> b!11322 d!1473))

(declare-fun d!1477 () Bool)

(assert (=> d!1477 (forall!60 (toList!195 (+!27 lm!227 (tuple2!379 (_1!189 lt!2852) (_2!189 lt!2852)))) p!216)))

(declare-fun lt!2929 () Unit!239)

(declare-fun choose!158 (ListLongMap!359 Int (_ BitVec 64) B!388) Unit!239)

(assert (=> d!1477 (= lt!2929 (choose!158 lm!227 p!216 (_1!189 lt!2852) (_2!189 lt!2852)))))

(declare-fun e!6772 () Bool)

(assert (=> d!1477 e!6772))

(declare-fun res!9538 () Bool)

(assert (=> d!1477 (=> (not res!9538) (not e!6772))))

(assert (=> d!1477 (= res!9538 (forall!60 (toList!195 lm!227) p!216))))

(assert (=> d!1477 (= (addValidProp!15 lm!227 p!216 (_1!189 lt!2852) (_2!189 lt!2852)) lt!2929)))

(declare-fun b!11452 () Bool)

(assert (=> b!11452 (= e!6772 (dynLambda!71 p!216 (tuple2!379 (_1!189 lt!2852) (_2!189 lt!2852))))))

(assert (= (and d!1477 res!9538) b!11452))

(declare-fun b_lambda!681 () Bool)

(assert (=> (not b_lambda!681) (not b!11452)))

(declare-fun t!2663 () Bool)

(declare-fun tb!319 () Bool)

(assert (=> (and start!1502 (= p!216 p!216) t!2663) tb!319))

(declare-fun result!489 () Bool)

(assert (=> tb!319 (= result!489 true)))

(assert (=> b!11452 t!2663))

(declare-fun b_and!781 () Bool)

(assert (= b_and!773 (and (=> t!2663 result!489) b_and!781)))

(assert (=> d!1477 m!7613))

(assert (=> d!1477 m!7611))

(declare-fun m!7821 () Bool)

(assert (=> d!1477 m!7821))

(assert (=> d!1477 m!7635))

(declare-fun m!7825 () Bool)

(assert (=> b!11452 m!7825))

(assert (=> b!11322 d!1477))

(declare-fun b!11465 () Bool)

(declare-fun e!6779 () Bool)

(declare-fun tp!1886 () Bool)

(assert (=> b!11465 (= e!6779 (and tp_is_empty!561 tp!1886))))

(assert (=> b!11325 (= tp!1866 e!6779)))

(assert (= (and b!11325 ((_ is Cons!337) (t!2626 kvs!4))) b!11465))

(declare-fun b!11466 () Bool)

(declare-fun e!6780 () Bool)

(declare-fun tp!1887 () Bool)

(assert (=> b!11466 (= e!6780 (and tp_is_empty!561 tp!1887))))

(assert (=> b!11323 (= tp!1867 e!6780)))

(assert (= (and b!11323 ((_ is Cons!337) (toList!195 lm!227))) b!11466))

(declare-fun b_lambda!683 () Bool)

(assert (= b_lambda!673 (or (and start!1502 b_free!447) b_lambda!683)))

(declare-fun b_lambda!685 () Bool)

(assert (= b_lambda!681 (or (and start!1502 b_free!447) b_lambda!685)))

(declare-fun b_lambda!687 () Bool)

(assert (= b_lambda!637 (or (and start!1502 b_free!447) b_lambda!687)))

(declare-fun b_lambda!689 () Bool)

(assert (= b_lambda!651 (or (and start!1502 b_free!447) b_lambda!689)))

(declare-fun b_lambda!691 () Bool)

(assert (= b_lambda!641 (or (and start!1502 b_free!447) b_lambda!691)))

(declare-fun b_lambda!693 () Bool)

(assert (= b_lambda!647 (or (and start!1502 b_free!447) b_lambda!693)))

(check-sat (not b!11368) (not b!11390) (not b!11397) (not b_lambda!691) (not d!1445) (not b!11423) tp_is_empty!561 (not b!11466) (not b!11421) (not d!1463) b_and!781 (not b_lambda!687) (not b_lambda!683) (not b!11386) (not b_lambda!693) (not b_lambda!685) (not b!11364) (not b!11465) (not d!1477) (not b!11388) (not b_next!447) (not b!11424) (not b!11436) (not d!1451) (not b!11420) (not b_lambda!689))
