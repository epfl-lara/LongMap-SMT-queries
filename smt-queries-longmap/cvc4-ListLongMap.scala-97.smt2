; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1504 () Bool)

(assert start!1504)

(declare-fun b_free!449 () Bool)

(declare-fun b_next!449 () Bool)

(assert (=> start!1504 (= b_free!449 (not b_next!449))))

(declare-fun tp!1875 () Bool)

(declare-fun b_and!745 () Bool)

(assert (=> start!1504 (= tp!1875 b_and!745)))

(declare-fun b!11342 () Bool)

(declare-fun e!6694 () Bool)

(declare-fun tp!1876 () Bool)

(assert (=> b!11342 (= e!6694 tp!1876)))

(declare-fun b!11343 () Bool)

(declare-fun e!6692 () Bool)

(declare-fun tp_is_empty!563 () Bool)

(declare-fun tp!1877 () Bool)

(assert (=> b!11343 (= e!6692 (and tp_is_empty!563 tp!1877))))

(declare-fun b!11344 () Bool)

(declare-fun res!9461 () Bool)

(declare-fun e!6693 () Bool)

(assert (=> b!11344 (=> res!9461 e!6693)))

(declare-datatypes ((B!390 0))(
  ( (B!391 (val!290 Int)) )
))
(declare-datatypes ((tuple2!380 0))(
  ( (tuple2!381 (_1!190 (_ BitVec 64)) (_2!190 B!390)) )
))
(declare-datatypes ((List!342 0))(
  ( (Nil!339) (Cons!338 (h!904 tuple2!380) (t!2627 List!342)) )
))
(declare-fun lt!2860 () List!342)

(declare-fun p!216 () Int)

(declare-fun forall!61 (List!342 Int) Bool)

(assert (=> b!11344 (= res!9461 (not (forall!61 lt!2860 p!216)))))

(declare-fun res!9459 () Bool)

(declare-fun e!6695 () Bool)

(assert (=> start!1504 (=> (not res!9459) (not e!6695))))

(declare-datatypes ((ListLongMap!361 0))(
  ( (ListLongMap!362 (toList!196 List!342)) )
))
(declare-fun lm!227 () ListLongMap!361)

(assert (=> start!1504 (= res!9459 (forall!61 (toList!196 lm!227) p!216))))

(assert (=> start!1504 e!6695))

(declare-fun inv!560 (ListLongMap!361) Bool)

(assert (=> start!1504 (and (inv!560 lm!227) e!6694)))

(assert (=> start!1504 tp!1875))

(assert (=> start!1504 e!6692))

(declare-fun b!11345 () Bool)

(assert (=> b!11345 (= e!6695 (not e!6693))))

(declare-fun res!9463 () Bool)

(assert (=> b!11345 (=> res!9463 e!6693)))

(declare-fun lt!2862 () tuple2!380)

(declare-fun +!28 (ListLongMap!361 tuple2!380) ListLongMap!361)

(assert (=> b!11345 (= res!9463 (not (forall!61 (toList!196 (+!28 lm!227 lt!2862)) p!216)))))

(declare-fun kvs!4 () List!342)

(declare-fun tail!55 (List!342) List!342)

(assert (=> b!11345 (= lt!2860 (tail!55 kvs!4))))

(assert (=> b!11345 (forall!61 (toList!196 (+!28 lm!227 (tuple2!381 (_1!190 lt!2862) (_2!190 lt!2862)))) p!216)))

(declare-datatypes ((Unit!241 0))(
  ( (Unit!242) )
))
(declare-fun lt!2861 () Unit!241)

(declare-fun addValidProp!16 (ListLongMap!361 Int (_ BitVec 64) B!390) Unit!241)

(assert (=> b!11345 (= lt!2861 (addValidProp!16 lm!227 p!216 (_1!190 lt!2862) (_2!190 lt!2862)))))

(declare-fun head!775 (List!342) tuple2!380)

(assert (=> b!11345 (= lt!2862 (head!775 kvs!4))))

(declare-fun b!11346 () Bool)

(declare-fun res!9462 () Bool)

(assert (=> b!11346 (=> (not res!9462) (not e!6695))))

(assert (=> b!11346 (= res!9462 (forall!61 kvs!4 p!216))))

(declare-fun b!11347 () Bool)

(declare-fun res!9460 () Bool)

(assert (=> b!11347 (=> (not res!9460) (not e!6695))))

(declare-fun isEmpty!68 (List!342) Bool)

(assert (=> b!11347 (= res!9460 (not (isEmpty!68 kvs!4)))))

(declare-fun b!11348 () Bool)

(declare-fun ListPrimitiveSize!12 (List!342) Int)

(assert (=> b!11348 (= e!6693 (< (ListPrimitiveSize!12 lt!2860) (ListPrimitiveSize!12 kvs!4)))))

(assert (= (and start!1504 res!9459) b!11346))

(assert (= (and b!11346 res!9462) b!11347))

(assert (= (and b!11347 res!9460) b!11345))

(assert (= (and b!11345 (not res!9463)) b!11344))

(assert (= (and b!11344 (not res!9461)) b!11348))

(assert (= start!1504 b!11342))

(assert (= (and start!1504 (is-Cons!338 kvs!4)) b!11343))

(declare-fun m!7639 () Bool)

(assert (=> b!11344 m!7639))

(declare-fun m!7641 () Bool)

(assert (=> b!11348 m!7641))

(declare-fun m!7643 () Bool)

(assert (=> b!11348 m!7643))

(declare-fun m!7645 () Bool)

(assert (=> start!1504 m!7645))

(declare-fun m!7647 () Bool)

(assert (=> start!1504 m!7647))

(declare-fun m!7649 () Bool)

(assert (=> b!11345 m!7649))

(declare-fun m!7651 () Bool)

(assert (=> b!11345 m!7651))

(declare-fun m!7653 () Bool)

(assert (=> b!11345 m!7653))

(declare-fun m!7655 () Bool)

(assert (=> b!11345 m!7655))

(declare-fun m!7657 () Bool)

(assert (=> b!11345 m!7657))

(declare-fun m!7659 () Bool)

(assert (=> b!11345 m!7659))

(declare-fun m!7661 () Bool)

(assert (=> b!11345 m!7661))

(declare-fun m!7663 () Bool)

(assert (=> b!11347 m!7663))

(declare-fun m!7665 () Bool)

(assert (=> b!11346 m!7665))

(push 1)

(assert (not b_next!449))

(assert b_and!745)

(assert (not start!1504))

(assert tp_is_empty!563)

(assert (not b!11346))

(assert (not b!11348))

(assert (not b!11347))

(assert (not b!11343))

(assert (not b!11345))

(assert (not b!11344))

(assert (not b!11342))

(check-sat)

(pop 1)

(push 1)

(assert b_and!745)

(assert (not b_next!449))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1408 () Bool)

(assert (=> d!1408 (= (isEmpty!68 kvs!4) (is-Nil!339 kvs!4))))

(assert (=> b!11347 d!1408))

(declare-fun d!1413 () Bool)

(declare-fun res!9480 () Bool)

(declare-fun e!6712 () Bool)

(assert (=> d!1413 (=> res!9480 e!6712)))

(assert (=> d!1413 (= res!9480 (is-Nil!339 kvs!4))))

(assert (=> d!1413 (= (forall!61 kvs!4 p!216) e!6712)))

(declare-fun b!11365 () Bool)

(declare-fun e!6713 () Bool)

(assert (=> b!11365 (= e!6712 e!6713)))

(declare-fun res!9481 () Bool)

(assert (=> b!11365 (=> (not res!9481) (not e!6713))))

(declare-fun dynLambda!72 (Int tuple2!380) Bool)

(assert (=> b!11365 (= res!9481 (dynLambda!72 p!216 (h!904 kvs!4)))))

(declare-fun b!11366 () Bool)

(assert (=> b!11366 (= e!6713 (forall!61 (t!2627 kvs!4) p!216))))

(assert (= (and d!1413 (not res!9480)) b!11365))

(assert (= (and b!11365 res!9481) b!11366))

(declare-fun b_lambda!639 () Bool)

(assert (=> (not b_lambda!639) (not b!11365)))

(declare-fun t!2635 () Bool)

(declare-fun tb!291 () Bool)

(assert (=> (and start!1504 (= p!216 p!216) t!2635) tb!291))

(declare-fun result!459 () Bool)

(assert (=> tb!291 (= result!459 true)))

(assert (=> b!11365 t!2635))

(declare-fun b_and!753 () Bool)

(assert (= b_and!745 (and (=> t!2635 result!459) b_and!753)))

(declare-fun m!7676 () Bool)

(assert (=> b!11365 m!7676))

(declare-fun m!7681 () Bool)

(assert (=> b!11366 m!7681))

(assert (=> b!11346 d!1413))

(declare-fun d!1421 () Bool)

(assert (=> d!1421 (= (tail!55 kvs!4) (t!2627 kvs!4))))

(assert (=> b!11345 d!1421))

(declare-fun d!1423 () Bool)

(assert (=> d!1423 (forall!61 (toList!196 (+!28 lm!227 (tuple2!381 (_1!190 lt!2862) (_2!190 lt!2862)))) p!216)))

(declare-fun lt!2873 () Unit!241)

(declare-fun choose!156 (ListLongMap!361 Int (_ BitVec 64) B!390) Unit!241)

(assert (=> d!1423 (= lt!2873 (choose!156 lm!227 p!216 (_1!190 lt!2862) (_2!190 lt!2862)))))

(declare-fun e!6736 () Bool)

(assert (=> d!1423 e!6736))

(declare-fun res!9496 () Bool)

(assert (=> d!1423 (=> (not res!9496) (not e!6736))))

(assert (=> d!1423 (= res!9496 (forall!61 (toList!196 lm!227) p!216))))

(assert (=> d!1423 (= (addValidProp!16 lm!227 p!216 (_1!190 lt!2862) (_2!190 lt!2862)) lt!2873)))

(declare-fun b!11398 () Bool)

(assert (=> b!11398 (= e!6736 (dynLambda!72 p!216 (tuple2!381 (_1!190 lt!2862) (_2!190 lt!2862))))))

(assert (= (and d!1423 res!9496) b!11398))

(declare-fun b_lambda!653 () Bool)

(assert (=> (not b_lambda!653) (not b!11398)))

(declare-fun t!2647 () Bool)

(declare-fun tb!303 () Bool)

(assert (=> (and start!1504 (= p!216 p!216) t!2647) tb!303))

(declare-fun result!471 () Bool)

(assert (=> tb!303 (= result!471 true)))

(assert (=> b!11398 t!2647))

(declare-fun b_and!765 () Bool)

(assert (= b_and!753 (and (=> t!2647 result!471) b_and!765)))

(assert (=> d!1423 m!7649))

(assert (=> d!1423 m!7659))

(declare-fun m!7715 () Bool)

(assert (=> d!1423 m!7715))

(assert (=> d!1423 m!7645))

(declare-fun m!7717 () Bool)

(assert (=> b!11398 m!7717))

(assert (=> b!11345 d!1423))

(declare-fun d!1453 () Bool)

(declare-fun res!9497 () Bool)

(declare-fun e!6737 () Bool)

(assert (=> d!1453 (=> res!9497 e!6737)))

(assert (=> d!1453 (= res!9497 (is-Nil!339 (toList!196 (+!28 lm!227 lt!2862))))))

(assert (=> d!1453 (= (forall!61 (toList!196 (+!28 lm!227 lt!2862)) p!216) e!6737)))

(declare-fun b!11399 () Bool)

(declare-fun e!6738 () Bool)

(assert (=> b!11399 (= e!6737 e!6738)))

(declare-fun res!9498 () Bool)

(assert (=> b!11399 (=> (not res!9498) (not e!6738))))

(assert (=> b!11399 (= res!9498 (dynLambda!72 p!216 (h!904 (toList!196 (+!28 lm!227 lt!2862)))))))

(declare-fun b!11400 () Bool)

(assert (=> b!11400 (= e!6738 (forall!61 (t!2627 (toList!196 (+!28 lm!227 lt!2862))) p!216))))

(assert (= (and d!1453 (not res!9497)) b!11399))

(assert (= (and b!11399 res!9498) b!11400))

(declare-fun b_lambda!655 () Bool)

(assert (=> (not b_lambda!655) (not b!11399)))

(declare-fun t!2649 () Bool)

(declare-fun tb!305 () Bool)

(assert (=> (and start!1504 (= p!216 p!216) t!2649) tb!305))

(declare-fun result!473 () Bool)

(assert (=> tb!305 (= result!473 true)))

(assert (=> b!11399 t!2649))

(declare-fun b_and!767 () Bool)

(assert (= b_and!765 (and (=> t!2649 result!473) b_and!767)))

(declare-fun m!7719 () Bool)

(assert (=> b!11399 m!7719))

(declare-fun m!7721 () Bool)

(assert (=> b!11400 m!7721))

(assert (=> b!11345 d!1453))

(declare-fun d!1455 () Bool)

(declare-fun e!6757 () Bool)

(assert (=> d!1455 e!6757))

(declare-fun res!9525 () Bool)

(assert (=> d!1455 (=> (not res!9525) (not e!6757))))

(declare-fun lt!2919 () ListLongMap!361)

(declare-fun contains!161 (ListLongMap!361 (_ BitVec 64)) Bool)

(assert (=> d!1455 (= res!9525 (contains!161 lt!2919 (_1!190 lt!2862)))))

(declare-fun lt!2918 () List!342)

(assert (=> d!1455 (= lt!2919 (ListLongMap!362 lt!2918))))

(declare-fun lt!2917 () Unit!241)

(declare-fun lt!2920 () Unit!241)

(assert (=> d!1455 (= lt!2917 lt!2920)))

(declare-datatypes ((Option!33 0))(
  ( (Some!32 (v!1347 B!390)) (None!31) )
))
(declare-fun getValueByKey!27 (List!342 (_ BitVec 64)) Option!33)

(assert (=> d!1455 (= (getValueByKey!27 lt!2918 (_1!190 lt!2862)) (Some!32 (_2!190 lt!2862)))))

(declare-fun lemmaContainsTupThenGetReturnValue!11 (List!342 (_ BitVec 64) B!390) Unit!241)

(assert (=> d!1455 (= lt!2920 (lemmaContainsTupThenGetReturnValue!11 lt!2918 (_1!190 lt!2862) (_2!190 lt!2862)))))

(declare-fun insertStrictlySorted!11 (List!342 (_ BitVec 64) B!390) List!342)

(assert (=> d!1455 (= lt!2918 (insertStrictlySorted!11 (toList!196 lm!227) (_1!190 lt!2862) (_2!190 lt!2862)))))

(assert (=> d!1455 (= (+!28 lm!227 lt!2862) lt!2919)))

(declare-fun b!11432 () Bool)

(declare-fun res!9524 () Bool)

(assert (=> b!11432 (=> (not res!9524) (not e!6757))))

(assert (=> b!11432 (= res!9524 (= (getValueByKey!27 (toList!196 lt!2919) (_1!190 lt!2862)) (Some!32 (_2!190 lt!2862))))))

(declare-fun b!11433 () Bool)

(declare-fun contains!164 (List!342 tuple2!380) Bool)

(assert (=> b!11433 (= e!6757 (contains!164 (toList!196 lt!2919) lt!2862))))

(assert (= (and d!1455 res!9525) b!11432))

(assert (= (and b!11432 res!9524) b!11433))

(declare-fun m!7779 () Bool)

(assert (=> d!1455 m!7779))

(declare-fun m!7781 () Bool)

(assert (=> d!1455 m!7781))

(declare-fun m!7783 () Bool)

(assert (=> d!1455 m!7783))

(declare-fun m!7785 () Bool)

(assert (=> d!1455 m!7785))

(declare-fun m!7787 () Bool)

(assert (=> b!11432 m!7787))

(declare-fun m!7789 () Bool)

(assert (=> b!11433 m!7789))

(assert (=> b!11345 d!1455))

(declare-fun d!1471 () Bool)

(declare-fun res!9528 () Bool)

(declare-fun e!6761 () Bool)

(assert (=> d!1471 (=> res!9528 e!6761)))

(assert (=> d!1471 (= res!9528 (is-Nil!339 (toList!196 (+!28 lm!227 (tuple2!381 (_1!190 lt!2862) (_2!190 lt!2862))))))))

(assert (=> d!1471 (= (forall!61 (toList!196 (+!28 lm!227 (tuple2!381 (_1!190 lt!2862) (_2!190 lt!2862)))) p!216) e!6761)))

(declare-fun b!11437 () Bool)

(declare-fun e!6762 () Bool)

(assert (=> b!11437 (= e!6761 e!6762)))

(declare-fun res!9529 () Bool)

(assert (=> b!11437 (=> (not res!9529) (not e!6762))))

(assert (=> b!11437 (= res!9529 (dynLambda!72 p!216 (h!904 (toList!196 (+!28 lm!227 (tuple2!381 (_1!190 lt!2862) (_2!190 lt!2862)))))))))

(declare-fun b!11438 () Bool)

(assert (=> b!11438 (= e!6762 (forall!61 (t!2627 (toList!196 (+!28 lm!227 (tuple2!381 (_1!190 lt!2862) (_2!190 lt!2862))))) p!216))))

(assert (= (and d!1471 (not res!9528)) b!11437))

(assert (= (and b!11437 res!9529) b!11438))

(declare-fun b_lambda!675 () Bool)

(assert (=> (not b_lambda!675) (not b!11437)))

(declare-fun t!2657 () Bool)

(declare-fun tb!313 () Bool)

(assert (=> (and start!1504 (= p!216 p!216) t!2657) tb!313))

(declare-fun result!483 () Bool)

(assert (=> tb!313 (= result!483 true)))

(assert (=> b!11437 t!2657))

(declare-fun b_and!775 () Bool)

(assert (= b_and!767 (and (=> t!2657 result!483) b_and!775)))

(declare-fun m!7795 () Bool)

(assert (=> b!11437 m!7795))

(declare-fun m!7797 () Bool)

(assert (=> b!11438 m!7797))

(assert (=> b!11345 d!1471))

(declare-fun d!1475 () Bool)

(assert (=> d!1475 (= (head!775 kvs!4) (h!904 kvs!4))))

(assert (=> b!11345 d!1475))

(declare-fun d!1479 () Bool)

(declare-fun e!6763 () Bool)

(assert (=> d!1479 e!6763))

(declare-fun res!9531 () Bool)

(assert (=> d!1479 (=> (not res!9531) (not e!6763))))

(declare-fun lt!2923 () ListLongMap!361)

(assert (=> d!1479 (= res!9531 (contains!161 lt!2923 (_1!190 (tuple2!381 (_1!190 lt!2862) (_2!190 lt!2862)))))))

(declare-fun lt!2922 () List!342)

(assert (=> d!1479 (= lt!2923 (ListLongMap!362 lt!2922))))

(declare-fun lt!2921 () Unit!241)

(declare-fun lt!2924 () Unit!241)

(assert (=> d!1479 (= lt!2921 lt!2924)))

(assert (=> d!1479 (= (getValueByKey!27 lt!2922 (_1!190 (tuple2!381 (_1!190 lt!2862) (_2!190 lt!2862)))) (Some!32 (_2!190 (tuple2!381 (_1!190 lt!2862) (_2!190 lt!2862)))))))

(assert (=> d!1479 (= lt!2924 (lemmaContainsTupThenGetReturnValue!11 lt!2922 (_1!190 (tuple2!381 (_1!190 lt!2862) (_2!190 lt!2862))) (_2!190 (tuple2!381 (_1!190 lt!2862) (_2!190 lt!2862)))))))

(assert (=> d!1479 (= lt!2922 (insertStrictlySorted!11 (toList!196 lm!227) (_1!190 (tuple2!381 (_1!190 lt!2862) (_2!190 lt!2862))) (_2!190 (tuple2!381 (_1!190 lt!2862) (_2!190 lt!2862)))))))

(assert (=> d!1479 (= (+!28 lm!227 (tuple2!381 (_1!190 lt!2862) (_2!190 lt!2862))) lt!2923)))

(declare-fun b!11439 () Bool)

(declare-fun res!9530 () Bool)

(assert (=> b!11439 (=> (not res!9530) (not e!6763))))

(assert (=> b!11439 (= res!9530 (= (getValueByKey!27 (toList!196 lt!2923) (_1!190 (tuple2!381 (_1!190 lt!2862) (_2!190 lt!2862)))) (Some!32 (_2!190 (tuple2!381 (_1!190 lt!2862) (_2!190 lt!2862))))))))

(declare-fun b!11440 () Bool)

(assert (=> b!11440 (= e!6763 (contains!164 (toList!196 lt!2923) (tuple2!381 (_1!190 lt!2862) (_2!190 lt!2862))))))

(assert (= (and d!1479 res!9531) b!11439))

(assert (= (and b!11439 res!9530) b!11440))

(declare-fun m!7799 () Bool)

(assert (=> d!1479 m!7799))

(declare-fun m!7801 () Bool)

(assert (=> d!1479 m!7801))

(declare-fun m!7803 () Bool)

(assert (=> d!1479 m!7803))

(declare-fun m!7805 () Bool)

(assert (=> d!1479 m!7805))

(declare-fun m!7807 () Bool)

(assert (=> b!11439 m!7807))

(declare-fun m!7809 () Bool)

(assert (=> b!11440 m!7809))

(assert (=> b!11345 d!1479))

(declare-fun d!1481 () Bool)

(declare-fun res!9532 () Bool)

(declare-fun e!6764 () Bool)

(assert (=> d!1481 (=> res!9532 e!6764)))

(assert (=> d!1481 (= res!9532 (is-Nil!339 lt!2860))))

(assert (=> d!1481 (= (forall!61 lt!2860 p!216) e!6764)))

(declare-fun b!11441 () Bool)

(declare-fun e!6765 () Bool)

(assert (=> b!11441 (= e!6764 e!6765)))

(declare-fun res!9533 () Bool)

(assert (=> b!11441 (=> (not res!9533) (not e!6765))))

(assert (=> b!11441 (= res!9533 (dynLambda!72 p!216 (h!904 lt!2860)))))

(declare-fun b!11442 () Bool)

