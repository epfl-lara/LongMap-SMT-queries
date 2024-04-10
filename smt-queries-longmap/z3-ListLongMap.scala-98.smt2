; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1556 () Bool)

(assert start!1556)

(declare-fun b_free!453 () Bool)

(declare-fun b_next!453 () Bool)

(assert (=> start!1556 (= b_free!453 (not b_next!453))))

(declare-fun tp!1906 () Bool)

(declare-fun b_and!785 () Bool)

(assert (=> start!1556 (= tp!1906 b_and!785)))

(declare-fun b!11504 () Bool)

(declare-fun res!9568 () Bool)

(declare-fun e!6803 () Bool)

(assert (=> b!11504 (=> (not res!9568) (not e!6803))))

(declare-datatypes ((B!394 0))(
  ( (B!395 (val!292 Int)) )
))
(declare-datatypes ((tuple2!384 0))(
  ( (tuple2!385 (_1!192 (_ BitVec 64)) (_2!192 B!394)) )
))
(declare-datatypes ((List!344 0))(
  ( (Nil!341) (Cons!340 (h!906 tuple2!384) (t!2665 List!344)) )
))
(declare-fun kvs!4 () List!344)

(declare-fun isEmpty!70 (List!344) Bool)

(assert (=> b!11504 (= res!9568 (not (isEmpty!70 kvs!4)))))

(declare-fun b!11505 () Bool)

(declare-fun res!9567 () Bool)

(declare-fun e!6805 () Bool)

(assert (=> b!11505 (=> res!9567 e!6805)))

(declare-fun lt!2960 () List!344)

(declare-fun p!216 () Int)

(declare-fun forall!63 (List!344 Int) Bool)

(assert (=> b!11505 (= res!9567 (not (forall!63 lt!2960 p!216)))))

(declare-datatypes ((ListLongMap!365 0))(
  ( (ListLongMap!366 (toList!198 List!344)) )
))
(declare-fun lm!227 () ListLongMap!365)

(declare-fun b!11506 () Bool)

(declare-fun ++!5 (ListLongMap!365 List!344) ListLongMap!365)

(assert (=> b!11506 (= e!6805 (forall!63 (toList!198 (++!5 lm!227 kvs!4)) p!216))))

(declare-fun lt!2958 () ListLongMap!365)

(assert (=> b!11506 (forall!63 (toList!198 (++!5 lt!2958 lt!2960)) p!216)))

(declare-datatypes ((Unit!245 0))(
  ( (Unit!246) )
))
(declare-fun lt!2957 () Unit!245)

(declare-fun insertAllValidProp!3 (ListLongMap!365 List!344 Int) Unit!245)

(assert (=> b!11506 (= lt!2957 (insertAllValidProp!3 lt!2958 lt!2960 p!216))))

(declare-fun res!9566 () Bool)

(assert (=> start!1556 (=> (not res!9566) (not e!6803))))

(assert (=> start!1556 (= res!9566 (forall!63 (toList!198 lm!227) p!216))))

(assert (=> start!1556 e!6803))

(declare-fun e!6804 () Bool)

(declare-fun inv!567 (ListLongMap!365) Bool)

(assert (=> start!1556 (and (inv!567 lm!227) e!6804)))

(assert (=> start!1556 tp!1906))

(declare-fun e!6806 () Bool)

(assert (=> start!1556 e!6806))

(declare-fun b!11507 () Bool)

(assert (=> b!11507 (= e!6803 (not e!6805))))

(declare-fun res!9564 () Bool)

(assert (=> b!11507 (=> res!9564 e!6805)))

(assert (=> b!11507 (= res!9564 (not (forall!63 (toList!198 lt!2958) p!216)))))

(declare-fun tail!57 (List!344) List!344)

(assert (=> b!11507 (= lt!2960 (tail!57 kvs!4))))

(declare-fun lt!2959 () tuple2!384)

(declare-fun +!30 (ListLongMap!365 tuple2!384) ListLongMap!365)

(assert (=> b!11507 (= lt!2958 (+!30 lm!227 lt!2959))))

(assert (=> b!11507 (forall!63 (toList!198 (+!30 lm!227 (tuple2!385 (_1!192 lt!2959) (_2!192 lt!2959)))) p!216)))

(declare-fun lt!2961 () Unit!245)

(declare-fun addValidProp!18 (ListLongMap!365 Int (_ BitVec 64) B!394) Unit!245)

(assert (=> b!11507 (= lt!2961 (addValidProp!18 lm!227 p!216 (_1!192 lt!2959) (_2!192 lt!2959)))))

(declare-fun head!777 (List!344) tuple2!384)

(assert (=> b!11507 (= lt!2959 (head!777 kvs!4))))

(declare-fun b!11508 () Bool)

(declare-fun tp_is_empty!567 () Bool)

(declare-fun tp!1907 () Bool)

(assert (=> b!11508 (= e!6806 (and tp_is_empty!567 tp!1907))))

(declare-fun b!11509 () Bool)

(declare-fun res!9565 () Bool)

(assert (=> b!11509 (=> (not res!9565) (not e!6803))))

(assert (=> b!11509 (= res!9565 (forall!63 kvs!4 p!216))))

(declare-fun b!11510 () Bool)

(declare-fun tp!1905 () Bool)

(assert (=> b!11510 (= e!6804 tp!1905)))

(assert (= (and start!1556 res!9566) b!11509))

(assert (= (and b!11509 res!9565) b!11504))

(assert (= (and b!11504 res!9568) b!11507))

(assert (= (and b!11507 (not res!9564)) b!11505))

(assert (= (and b!11505 (not res!9567)) b!11506))

(assert (= start!1556 b!11510))

(get-info :version)

(assert (= (and start!1556 ((_ is Cons!340) kvs!4)) b!11508))

(declare-fun m!7863 () Bool)

(assert (=> b!11507 m!7863))

(declare-fun m!7865 () Bool)

(assert (=> b!11507 m!7865))

(declare-fun m!7867 () Bool)

(assert (=> b!11507 m!7867))

(declare-fun m!7869 () Bool)

(assert (=> b!11507 m!7869))

(declare-fun m!7871 () Bool)

(assert (=> b!11507 m!7871))

(declare-fun m!7873 () Bool)

(assert (=> b!11507 m!7873))

(declare-fun m!7875 () Bool)

(assert (=> b!11507 m!7875))

(declare-fun m!7877 () Bool)

(assert (=> b!11509 m!7877))

(declare-fun m!7879 () Bool)

(assert (=> b!11504 m!7879))

(declare-fun m!7881 () Bool)

(assert (=> b!11505 m!7881))

(declare-fun m!7883 () Bool)

(assert (=> start!1556 m!7883))

(declare-fun m!7885 () Bool)

(assert (=> start!1556 m!7885))

(declare-fun m!7887 () Bool)

(assert (=> b!11506 m!7887))

(declare-fun m!7889 () Bool)

(assert (=> b!11506 m!7889))

(declare-fun m!7891 () Bool)

(assert (=> b!11506 m!7891))

(declare-fun m!7893 () Bool)

(assert (=> b!11506 m!7893))

(declare-fun m!7895 () Bool)

(assert (=> b!11506 m!7895))

(check-sat (not b_next!453) (not b!11504) (not b!11508) (not b!11507) tp_is_empty!567 (not b!11510) (not start!1556) (not b!11509) (not b!11506) b_and!785 (not b!11505))
(check-sat b_and!785 (not b_next!453))
(get-model)

(declare-fun d!1495 () Bool)

(declare-fun res!9588 () Bool)

(declare-fun e!6826 () Bool)

(assert (=> d!1495 (=> res!9588 e!6826)))

(assert (=> d!1495 (= res!9588 ((_ is Nil!341) kvs!4))))

(assert (=> d!1495 (= (forall!63 kvs!4 p!216) e!6826)))

(declare-fun b!11542 () Bool)

(declare-fun e!6827 () Bool)

(assert (=> b!11542 (= e!6826 e!6827)))

(declare-fun res!9589 () Bool)

(assert (=> b!11542 (=> (not res!9589) (not e!6827))))

(declare-fun dynLambda!73 (Int tuple2!384) Bool)

(assert (=> b!11542 (= res!9589 (dynLambda!73 p!216 (h!906 kvs!4)))))

(declare-fun b!11543 () Bool)

(assert (=> b!11543 (= e!6827 (forall!63 (t!2665 kvs!4) p!216))))

(assert (= (and d!1495 (not res!9588)) b!11542))

(assert (= (and b!11542 res!9589) b!11543))

(declare-fun b_lambda!707 () Bool)

(assert (=> (not b_lambda!707) (not b!11542)))

(declare-fun t!2668 () Bool)

(declare-fun tb!321 () Bool)

(assert (=> (and start!1556 (= p!216 p!216) t!2668) tb!321))

(declare-fun result!495 () Bool)

(assert (=> tb!321 (= result!495 true)))

(assert (=> b!11542 t!2668))

(declare-fun b_and!789 () Bool)

(assert (= b_and!785 (and (=> t!2668 result!495) b_and!789)))

(declare-fun m!7935 () Bool)

(assert (=> b!11542 m!7935))

(declare-fun m!7937 () Bool)

(assert (=> b!11543 m!7937))

(assert (=> b!11509 d!1495))

(declare-fun d!1501 () Bool)

(declare-fun res!9594 () Bool)

(declare-fun e!6832 () Bool)

(assert (=> d!1501 (=> res!9594 e!6832)))

(assert (=> d!1501 (= res!9594 ((_ is Nil!341) (toList!198 (+!30 lm!227 (tuple2!385 (_1!192 lt!2959) (_2!192 lt!2959))))))))

(assert (=> d!1501 (= (forall!63 (toList!198 (+!30 lm!227 (tuple2!385 (_1!192 lt!2959) (_2!192 lt!2959)))) p!216) e!6832)))

(declare-fun b!11548 () Bool)

(declare-fun e!6833 () Bool)

(assert (=> b!11548 (= e!6832 e!6833)))

(declare-fun res!9595 () Bool)

(assert (=> b!11548 (=> (not res!9595) (not e!6833))))

(assert (=> b!11548 (= res!9595 (dynLambda!73 p!216 (h!906 (toList!198 (+!30 lm!227 (tuple2!385 (_1!192 lt!2959) (_2!192 lt!2959)))))))))

(declare-fun b!11549 () Bool)

(assert (=> b!11549 (= e!6833 (forall!63 (t!2665 (toList!198 (+!30 lm!227 (tuple2!385 (_1!192 lt!2959) (_2!192 lt!2959))))) p!216))))

(assert (= (and d!1501 (not res!9594)) b!11548))

(assert (= (and b!11548 res!9595) b!11549))

(declare-fun b_lambda!709 () Bool)

(assert (=> (not b_lambda!709) (not b!11548)))

(declare-fun t!2670 () Bool)

(declare-fun tb!323 () Bool)

(assert (=> (and start!1556 (= p!216 p!216) t!2670) tb!323))

(declare-fun result!497 () Bool)

(assert (=> tb!323 (= result!497 true)))

(assert (=> b!11548 t!2670))

(declare-fun b_and!791 () Bool)

(assert (= b_and!789 (and (=> t!2670 result!497) b_and!791)))

(declare-fun m!7939 () Bool)

(assert (=> b!11548 m!7939))

(declare-fun m!7941 () Bool)

(assert (=> b!11549 m!7941))

(assert (=> b!11507 d!1501))

(declare-fun d!1503 () Bool)

(assert (=> d!1503 (= (tail!57 kvs!4) (t!2665 kvs!4))))

(assert (=> b!11507 d!1503))

(declare-fun d!1505 () Bool)

(declare-fun e!6857 () Bool)

(assert (=> d!1505 e!6857))

(declare-fun res!9620 () Bool)

(assert (=> d!1505 (=> (not res!9620) (not e!6857))))

(declare-fun lt!2992 () ListLongMap!365)

(declare-fun contains!165 (ListLongMap!365 (_ BitVec 64)) Bool)

(assert (=> d!1505 (= res!9620 (contains!165 lt!2992 (_1!192 (tuple2!385 (_1!192 lt!2959) (_2!192 lt!2959)))))))

(declare-fun lt!2991 () List!344)

(assert (=> d!1505 (= lt!2992 (ListLongMap!366 lt!2991))))

(declare-fun lt!2994 () Unit!245)

(declare-fun lt!2993 () Unit!245)

(assert (=> d!1505 (= lt!2994 lt!2993)))

(declare-datatypes ((Option!35 0))(
  ( (Some!34 (v!1349 B!394)) (None!33) )
))
(declare-fun getValueByKey!29 (List!344 (_ BitVec 64)) Option!35)

(assert (=> d!1505 (= (getValueByKey!29 lt!2991 (_1!192 (tuple2!385 (_1!192 lt!2959) (_2!192 lt!2959)))) (Some!34 (_2!192 (tuple2!385 (_1!192 lt!2959) (_2!192 lt!2959)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!13 (List!344 (_ BitVec 64) B!394) Unit!245)

(assert (=> d!1505 (= lt!2993 (lemmaContainsTupThenGetReturnValue!13 lt!2991 (_1!192 (tuple2!385 (_1!192 lt!2959) (_2!192 lt!2959))) (_2!192 (tuple2!385 (_1!192 lt!2959) (_2!192 lt!2959)))))))

(declare-fun insertStrictlySorted!13 (List!344 (_ BitVec 64) B!394) List!344)

(assert (=> d!1505 (= lt!2991 (insertStrictlySorted!13 (toList!198 lm!227) (_1!192 (tuple2!385 (_1!192 lt!2959) (_2!192 lt!2959))) (_2!192 (tuple2!385 (_1!192 lt!2959) (_2!192 lt!2959)))))))

(assert (=> d!1505 (= (+!30 lm!227 (tuple2!385 (_1!192 lt!2959) (_2!192 lt!2959))) lt!2992)))

(declare-fun b!11577 () Bool)

(declare-fun res!9621 () Bool)

(assert (=> b!11577 (=> (not res!9621) (not e!6857))))

(assert (=> b!11577 (= res!9621 (= (getValueByKey!29 (toList!198 lt!2992) (_1!192 (tuple2!385 (_1!192 lt!2959) (_2!192 lt!2959)))) (Some!34 (_2!192 (tuple2!385 (_1!192 lt!2959) (_2!192 lt!2959))))))))

(declare-fun b!11578 () Bool)

(declare-fun contains!166 (List!344 tuple2!384) Bool)

(assert (=> b!11578 (= e!6857 (contains!166 (toList!198 lt!2992) (tuple2!385 (_1!192 lt!2959) (_2!192 lt!2959))))))

(assert (= (and d!1505 res!9620) b!11577))

(assert (= (and b!11577 res!9621) b!11578))

(declare-fun m!7965 () Bool)

(assert (=> d!1505 m!7965))

(declare-fun m!7967 () Bool)

(assert (=> d!1505 m!7967))

(declare-fun m!7973 () Bool)

(assert (=> d!1505 m!7973))

(declare-fun m!7979 () Bool)

(assert (=> d!1505 m!7979))

(declare-fun m!7981 () Bool)

(assert (=> b!11577 m!7981))

(declare-fun m!7983 () Bool)

(assert (=> b!11578 m!7983))

(assert (=> b!11507 d!1505))

(declare-fun d!1525 () Bool)

(assert (=> d!1525 (forall!63 (toList!198 (+!30 lm!227 (tuple2!385 (_1!192 lt!2959) (_2!192 lt!2959)))) p!216)))

(declare-fun lt!2997 () Unit!245)

(declare-fun choose!161 (ListLongMap!365 Int (_ BitVec 64) B!394) Unit!245)

(assert (=> d!1525 (= lt!2997 (choose!161 lm!227 p!216 (_1!192 lt!2959) (_2!192 lt!2959)))))

(declare-fun e!6866 () Bool)

(assert (=> d!1525 e!6866))

(declare-fun res!9630 () Bool)

(assert (=> d!1525 (=> (not res!9630) (not e!6866))))

(assert (=> d!1525 (= res!9630 (forall!63 (toList!198 lm!227) p!216))))

(assert (=> d!1525 (= (addValidProp!18 lm!227 p!216 (_1!192 lt!2959) (_2!192 lt!2959)) lt!2997)))

(declare-fun b!11588 () Bool)

(assert (=> b!11588 (= e!6866 (dynLambda!73 p!216 (tuple2!385 (_1!192 lt!2959) (_2!192 lt!2959))))))

(assert (= (and d!1525 res!9630) b!11588))

(declare-fun b_lambda!729 () Bool)

(assert (=> (not b_lambda!729) (not b!11588)))

(declare-fun t!2690 () Bool)

(declare-fun tb!343 () Bool)

(assert (=> (and start!1556 (= p!216 p!216) t!2690) tb!343))

(declare-fun result!517 () Bool)

(assert (=> tb!343 (= result!517 true)))

(assert (=> b!11588 t!2690))

(declare-fun b_and!811 () Bool)

(assert (= b_and!791 (and (=> t!2690 result!517) b_and!811)))

(assert (=> d!1525 m!7867))

(assert (=> d!1525 m!7869))

(declare-fun m!7999 () Bool)

(assert (=> d!1525 m!7999))

(assert (=> d!1525 m!7883))

(declare-fun m!8001 () Bool)

(assert (=> b!11588 m!8001))

(assert (=> b!11507 d!1525))

(declare-fun d!1539 () Bool)

(assert (=> d!1539 (= (head!777 kvs!4) (h!906 kvs!4))))

(assert (=> b!11507 d!1539))

(declare-fun d!1541 () Bool)

(declare-fun e!6869 () Bool)

(assert (=> d!1541 e!6869))

(declare-fun res!9635 () Bool)

(assert (=> d!1541 (=> (not res!9635) (not e!6869))))

(declare-fun lt!3007 () ListLongMap!365)

(assert (=> d!1541 (= res!9635 (contains!165 lt!3007 (_1!192 lt!2959)))))

(declare-fun lt!3006 () List!344)

(assert (=> d!1541 (= lt!3007 (ListLongMap!366 lt!3006))))

(declare-fun lt!3009 () Unit!245)

(declare-fun lt!3008 () Unit!245)

(assert (=> d!1541 (= lt!3009 lt!3008)))

(assert (=> d!1541 (= (getValueByKey!29 lt!3006 (_1!192 lt!2959)) (Some!34 (_2!192 lt!2959)))))

(assert (=> d!1541 (= lt!3008 (lemmaContainsTupThenGetReturnValue!13 lt!3006 (_1!192 lt!2959) (_2!192 lt!2959)))))

(assert (=> d!1541 (= lt!3006 (insertStrictlySorted!13 (toList!198 lm!227) (_1!192 lt!2959) (_2!192 lt!2959)))))

(assert (=> d!1541 (= (+!30 lm!227 lt!2959) lt!3007)))

(declare-fun b!11593 () Bool)

(declare-fun res!9636 () Bool)

(assert (=> b!11593 (=> (not res!9636) (not e!6869))))

(assert (=> b!11593 (= res!9636 (= (getValueByKey!29 (toList!198 lt!3007) (_1!192 lt!2959)) (Some!34 (_2!192 lt!2959))))))

(declare-fun b!11594 () Bool)

(assert (=> b!11594 (= e!6869 (contains!166 (toList!198 lt!3007) lt!2959))))

(assert (= (and d!1541 res!9635) b!11593))

(assert (= (and b!11593 res!9636) b!11594))

(declare-fun m!8003 () Bool)

(assert (=> d!1541 m!8003))

(declare-fun m!8005 () Bool)

(assert (=> d!1541 m!8005))

(declare-fun m!8007 () Bool)

(assert (=> d!1541 m!8007))

(declare-fun m!8009 () Bool)

(assert (=> d!1541 m!8009))

(declare-fun m!8011 () Bool)

(assert (=> b!11593 m!8011))

(declare-fun m!8013 () Bool)

(assert (=> b!11594 m!8013))

(assert (=> b!11507 d!1541))

(declare-fun d!1543 () Bool)

(declare-fun res!9637 () Bool)

(declare-fun e!6870 () Bool)

(assert (=> d!1543 (=> res!9637 e!6870)))

(assert (=> d!1543 (= res!9637 ((_ is Nil!341) (toList!198 lt!2958)))))

(assert (=> d!1543 (= (forall!63 (toList!198 lt!2958) p!216) e!6870)))

(declare-fun b!11595 () Bool)

(declare-fun e!6871 () Bool)

(assert (=> b!11595 (= e!6870 e!6871)))

(declare-fun res!9638 () Bool)

(assert (=> b!11595 (=> (not res!9638) (not e!6871))))

(assert (=> b!11595 (= res!9638 (dynLambda!73 p!216 (h!906 (toList!198 lt!2958))))))

(declare-fun b!11596 () Bool)

(assert (=> b!11596 (= e!6871 (forall!63 (t!2665 (toList!198 lt!2958)) p!216))))

(assert (= (and d!1543 (not res!9637)) b!11595))

(assert (= (and b!11595 res!9638) b!11596))

(declare-fun b_lambda!731 () Bool)

(assert (=> (not b_lambda!731) (not b!11595)))

(declare-fun t!2692 () Bool)

(declare-fun tb!345 () Bool)

(assert (=> (and start!1556 (= p!216 p!216) t!2692) tb!345))

(declare-fun result!519 () Bool)

(assert (=> tb!345 (= result!519 true)))

(assert (=> b!11595 t!2692))

(declare-fun b_and!813 () Bool)

(assert (= b_and!811 (and (=> t!2692 result!519) b_and!813)))

(declare-fun m!8015 () Bool)

(assert (=> b!11595 m!8015))

(declare-fun m!8017 () Bool)

(assert (=> b!11596 m!8017))

(assert (=> b!11507 d!1543))

(declare-fun d!1545 () Bool)

(declare-fun res!9641 () Bool)

(declare-fun e!6873 () Bool)

(assert (=> d!1545 (=> res!9641 e!6873)))

(assert (=> d!1545 (= res!9641 ((_ is Nil!341) (toList!198 lm!227)))))

(assert (=> d!1545 (= (forall!63 (toList!198 lm!227) p!216) e!6873)))

(declare-fun b!11599 () Bool)

(declare-fun e!6874 () Bool)

(assert (=> b!11599 (= e!6873 e!6874)))

(declare-fun res!9642 () Bool)

(assert (=> b!11599 (=> (not res!9642) (not e!6874))))

(assert (=> b!11599 (= res!9642 (dynLambda!73 p!216 (h!906 (toList!198 lm!227))))))

(declare-fun b!11600 () Bool)

(assert (=> b!11600 (= e!6874 (forall!63 (t!2665 (toList!198 lm!227)) p!216))))

(assert (= (and d!1545 (not res!9641)) b!11599))

(assert (= (and b!11599 res!9642) b!11600))

(declare-fun b_lambda!733 () Bool)

(assert (=> (not b_lambda!733) (not b!11599)))

(declare-fun t!2694 () Bool)

(declare-fun tb!347 () Bool)

(assert (=> (and start!1556 (= p!216 p!216) t!2694) tb!347))

(declare-fun result!521 () Bool)

(assert (=> tb!347 (= result!521 true)))

(assert (=> b!11599 t!2694))

(declare-fun b_and!815 () Bool)

(assert (= b_and!813 (and (=> t!2694 result!521) b_and!815)))

(declare-fun m!8031 () Bool)

(assert (=> b!11599 m!8031))

(declare-fun m!8033 () Bool)

(assert (=> b!11600 m!8033))

(assert (=> start!1556 d!1545))

(declare-fun d!1549 () Bool)

(declare-fun isStrictlySorted!46 (List!344) Bool)

(assert (=> d!1549 (= (inv!567 lm!227) (isStrictlySorted!46 (toList!198 lm!227)))))

(declare-fun bs!439 () Bool)

(assert (= bs!439 d!1549))

(declare-fun m!8047 () Bool)

(assert (=> bs!439 m!8047))

(assert (=> start!1556 d!1549))

(declare-fun d!1557 () Bool)

(declare-fun c!972 () Bool)

(assert (=> d!1557 (= c!972 ((_ is Nil!341) kvs!4))))

(declare-fun e!6887 () ListLongMap!365)

(assert (=> d!1557 (= (++!5 lm!227 kvs!4) e!6887)))

(declare-fun b!11619 () Bool)

(assert (=> b!11619 (= e!6887 lm!227)))

(declare-fun b!11620 () Bool)

(assert (=> b!11620 (= e!6887 (++!5 (+!30 lm!227 (h!906 kvs!4)) (t!2665 kvs!4)))))

(assert (= (and d!1557 c!972) b!11619))

(assert (= (and d!1557 (not c!972)) b!11620))

(declare-fun m!8075 () Bool)

(assert (=> b!11620 m!8075))

(assert (=> b!11620 m!8075))

(declare-fun m!8077 () Bool)

(assert (=> b!11620 m!8077))

(assert (=> b!11506 d!1557))

(declare-fun d!1571 () Bool)

(declare-fun c!973 () Bool)

(assert (=> d!1571 (= c!973 ((_ is Nil!341) lt!2960))))

(declare-fun e!6889 () ListLongMap!365)

(assert (=> d!1571 (= (++!5 lt!2958 lt!2960) e!6889)))

(declare-fun b!11623 () Bool)

(assert (=> b!11623 (= e!6889 lt!2958)))

(declare-fun b!11624 () Bool)

(assert (=> b!11624 (= e!6889 (++!5 (+!30 lt!2958 (h!906 lt!2960)) (t!2665 lt!2960)))))

(assert (= (and d!1571 c!973) b!11623))

(assert (= (and d!1571 (not c!973)) b!11624))

(declare-fun m!8087 () Bool)

(assert (=> b!11624 m!8087))

(assert (=> b!11624 m!8087))

(declare-fun m!8093 () Bool)

(assert (=> b!11624 m!8093))

(assert (=> b!11506 d!1571))

(declare-fun d!1575 () Bool)

(declare-fun res!9659 () Bool)

(declare-fun e!6890 () Bool)

(assert (=> d!1575 (=> res!9659 e!6890)))

(assert (=> d!1575 (= res!9659 ((_ is Nil!341) (toList!198 (++!5 lm!227 kvs!4))))))

(assert (=> d!1575 (= (forall!63 (toList!198 (++!5 lm!227 kvs!4)) p!216) e!6890)))

(declare-fun b!11625 () Bool)

(declare-fun e!6891 () Bool)

(assert (=> b!11625 (= e!6890 e!6891)))

(declare-fun res!9660 () Bool)

(assert (=> b!11625 (=> (not res!9660) (not e!6891))))

(assert (=> b!11625 (= res!9660 (dynLambda!73 p!216 (h!906 (toList!198 (++!5 lm!227 kvs!4)))))))

(declare-fun b!11626 () Bool)

(assert (=> b!11626 (= e!6891 (forall!63 (t!2665 (toList!198 (++!5 lm!227 kvs!4))) p!216))))

(assert (= (and d!1575 (not res!9659)) b!11625))

(assert (= (and b!11625 res!9660) b!11626))

(declare-fun b_lambda!741 () Bool)

(assert (=> (not b_lambda!741) (not b!11625)))

(declare-fun t!2702 () Bool)

(declare-fun tb!355 () Bool)

(assert (=> (and start!1556 (= p!216 p!216) t!2702) tb!355))

(declare-fun result!529 () Bool)

(assert (=> tb!355 (= result!529 true)))

(assert (=> b!11625 t!2702))

(declare-fun b_and!823 () Bool)

(assert (= b_and!815 (and (=> t!2702 result!529) b_and!823)))

(declare-fun m!8095 () Bool)

(assert (=> b!11625 m!8095))

(declare-fun m!8097 () Bool)

(assert (=> b!11626 m!8097))

(assert (=> b!11506 d!1575))

(declare-fun d!1577 () Bool)

(assert (=> d!1577 (forall!63 (toList!198 (++!5 lt!2958 lt!2960)) p!216)))

(declare-fun lt!3039 () Unit!245)

(declare-fun choose!162 (ListLongMap!365 List!344 Int) Unit!245)

(assert (=> d!1577 (= lt!3039 (choose!162 lt!2958 lt!2960 p!216))))

(declare-fun e!6902 () Bool)

(assert (=> d!1577 e!6902))

(declare-fun res!9668 () Bool)

(assert (=> d!1577 (=> (not res!9668) (not e!6902))))

(assert (=> d!1577 (= res!9668 (forall!63 (toList!198 lt!2958) p!216))))

(assert (=> d!1577 (= (insertAllValidProp!3 lt!2958 lt!2960 p!216) lt!3039)))

(declare-fun b!11641 () Bool)

(assert (=> b!11641 (= e!6902 (forall!63 lt!2960 p!216))))

(assert (= (and d!1577 res!9668) b!11641))

(assert (=> d!1577 m!7887))

(assert (=> d!1577 m!7889))

(declare-fun m!8107 () Bool)

(assert (=> d!1577 m!8107))

(assert (=> d!1577 m!7871))

(assert (=> b!11641 m!7881))

(assert (=> b!11506 d!1577))

(declare-fun d!1583 () Bool)

(declare-fun res!9669 () Bool)

(declare-fun e!6903 () Bool)

(assert (=> d!1583 (=> res!9669 e!6903)))

(assert (=> d!1583 (= res!9669 ((_ is Nil!341) (toList!198 (++!5 lt!2958 lt!2960))))))

(assert (=> d!1583 (= (forall!63 (toList!198 (++!5 lt!2958 lt!2960)) p!216) e!6903)))

(declare-fun b!11642 () Bool)

(declare-fun e!6904 () Bool)

(assert (=> b!11642 (= e!6903 e!6904)))

(declare-fun res!9670 () Bool)

(assert (=> b!11642 (=> (not res!9670) (not e!6904))))

(assert (=> b!11642 (= res!9670 (dynLambda!73 p!216 (h!906 (toList!198 (++!5 lt!2958 lt!2960)))))))

(declare-fun b!11643 () Bool)

(assert (=> b!11643 (= e!6904 (forall!63 (t!2665 (toList!198 (++!5 lt!2958 lt!2960))) p!216))))

(assert (= (and d!1583 (not res!9669)) b!11642))

(assert (= (and b!11642 res!9670) b!11643))

(declare-fun b_lambda!747 () Bool)

(assert (=> (not b_lambda!747) (not b!11642)))

(declare-fun t!2708 () Bool)

(declare-fun tb!361 () Bool)

(assert (=> (and start!1556 (= p!216 p!216) t!2708) tb!361))

(declare-fun result!535 () Bool)

(assert (=> tb!361 (= result!535 true)))

(assert (=> b!11642 t!2708))

(declare-fun b_and!829 () Bool)

(assert (= b_and!823 (and (=> t!2708 result!535) b_and!829)))

(declare-fun m!8113 () Bool)

(assert (=> b!11642 m!8113))

(declare-fun m!8115 () Bool)

(assert (=> b!11643 m!8115))

(assert (=> b!11506 d!1583))

(declare-fun d!1587 () Bool)

(assert (=> d!1587 (= (isEmpty!70 kvs!4) ((_ is Nil!341) kvs!4))))

(assert (=> b!11504 d!1587))

(declare-fun d!1589 () Bool)

(declare-fun res!9675 () Bool)

(declare-fun e!6911 () Bool)

(assert (=> d!1589 (=> res!9675 e!6911)))

(assert (=> d!1589 (= res!9675 ((_ is Nil!341) lt!2960))))

(assert (=> d!1589 (= (forall!63 lt!2960 p!216) e!6911)))

(declare-fun b!11652 () Bool)

(declare-fun e!6912 () Bool)

(assert (=> b!11652 (= e!6911 e!6912)))

(declare-fun res!9676 () Bool)

(assert (=> b!11652 (=> (not res!9676) (not e!6912))))

(assert (=> b!11652 (= res!9676 (dynLambda!73 p!216 (h!906 lt!2960)))))

(declare-fun b!11653 () Bool)

(assert (=> b!11653 (= e!6912 (forall!63 (t!2665 lt!2960) p!216))))

(assert (= (and d!1589 (not res!9675)) b!11652))

(assert (= (and b!11652 res!9676) b!11653))

(declare-fun b_lambda!751 () Bool)

(assert (=> (not b_lambda!751) (not b!11652)))

(declare-fun t!2712 () Bool)

(declare-fun tb!365 () Bool)

(assert (=> (and start!1556 (= p!216 p!216) t!2712) tb!365))

(declare-fun result!541 () Bool)

(assert (=> tb!365 (= result!541 true)))

(assert (=> b!11652 t!2712))

(declare-fun b_and!833 () Bool)

(assert (= b_and!829 (and (=> t!2712 result!541) b_and!833)))

(declare-fun m!8121 () Bool)

(assert (=> b!11652 m!8121))

(declare-fun m!8123 () Bool)

(assert (=> b!11653 m!8123))

(assert (=> b!11505 d!1589))

(declare-fun b!11663 () Bool)

(declare-fun e!6920 () Bool)

(declare-fun tp!1923 () Bool)

(assert (=> b!11663 (= e!6920 (and tp_is_empty!567 tp!1923))))

(assert (=> b!11508 (= tp!1907 e!6920)))

(assert (= (and b!11508 ((_ is Cons!340) (t!2665 kvs!4))) b!11663))

(declare-fun b!11664 () Bool)

(declare-fun e!6921 () Bool)

(declare-fun tp!1924 () Bool)

(assert (=> b!11664 (= e!6921 (and tp_is_empty!567 tp!1924))))

(assert (=> b!11510 (= tp!1905 e!6921)))

(assert (= (and b!11510 ((_ is Cons!340) (toList!198 lm!227))) b!11664))

(declare-fun b_lambda!771 () Bool)

(assert (= b_lambda!709 (or (and start!1556 b_free!453) b_lambda!771)))

(declare-fun b_lambda!773 () Bool)

(assert (= b_lambda!729 (or (and start!1556 b_free!453) b_lambda!773)))

(declare-fun b_lambda!775 () Bool)

(assert (= b_lambda!731 (or (and start!1556 b_free!453) b_lambda!775)))

(declare-fun b_lambda!777 () Bool)

(assert (= b_lambda!733 (or (and start!1556 b_free!453) b_lambda!777)))

(declare-fun b_lambda!779 () Bool)

(assert (= b_lambda!747 (or (and start!1556 b_free!453) b_lambda!779)))

(declare-fun b_lambda!781 () Bool)

(assert (= b_lambda!707 (or (and start!1556 b_free!453) b_lambda!781)))

(declare-fun b_lambda!783 () Bool)

(assert (= b_lambda!751 (or (and start!1556 b_free!453) b_lambda!783)))

(declare-fun b_lambda!785 () Bool)

(assert (= b_lambda!741 (or (and start!1556 b_free!453) b_lambda!785)))

(check-sat (not b!11549) b_and!833 (not b_lambda!773) (not b_lambda!777) (not b!11600) (not b!11578) (not b!11641) (not b!11543) (not b!11663) (not b!11594) (not b!11596) (not d!1577) (not b_lambda!781) (not b!11577) (not b_next!453) (not d!1549) (not d!1541) (not d!1505) (not b!11643) (not b_lambda!775) (not b!11626) (not b!11620) tp_is_empty!567 (not d!1525) (not b_lambda!779) (not b!11624) (not b!11593) (not b_lambda!785) (not b_lambda!783) (not b!11653) (not b_lambda!771) (not b!11664))
(check-sat b_and!833 (not b_next!453))
