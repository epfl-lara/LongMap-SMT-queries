; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1554 () Bool)

(assert start!1554)

(declare-fun b_free!451 () Bool)

(declare-fun b_next!451 () Bool)

(assert (=> start!1554 (= b_free!451 (not b_next!451))))

(declare-fun tp!1897 () Bool)

(declare-fun b_and!783 () Bool)

(assert (=> start!1554 (= tp!1897 b_and!783)))

(declare-fun b!11483 () Bool)

(declare-fun res!9550 () Bool)

(declare-fun e!6794 () Bool)

(assert (=> b!11483 (=> (not res!9550) (not e!6794))))

(declare-datatypes ((B!392 0))(
  ( (B!393 (val!291 Int)) )
))
(declare-datatypes ((tuple2!378 0))(
  ( (tuple2!379 (_1!189 (_ BitVec 64)) (_2!189 B!392)) )
))
(declare-datatypes ((List!339 0))(
  ( (Nil!336) (Cons!335 (h!901 tuple2!378) (t!2660 List!339)) )
))
(declare-fun kvs!4 () List!339)

(declare-fun isEmpty!69 (List!339) Bool)

(assert (=> b!11483 (= res!9550 (not (isEmpty!69 kvs!4)))))

(declare-fun b!11484 () Bool)

(declare-fun e!6793 () Bool)

(declare-fun tp_is_empty!565 () Bool)

(declare-fun tp!1898 () Bool)

(assert (=> b!11484 (= e!6793 (and tp_is_empty!565 tp!1898))))

(declare-fun b!11485 () Bool)

(declare-fun res!9552 () Bool)

(assert (=> b!11485 (=> (not res!9552) (not e!6794))))

(declare-fun p!216 () Int)

(declare-fun forall!62 (List!339 Int) Bool)

(assert (=> b!11485 (= res!9552 (forall!62 kvs!4 p!216))))

(declare-fun b!11486 () Bool)

(declare-fun res!9549 () Bool)

(declare-fun e!6792 () Bool)

(assert (=> b!11486 (=> res!9549 e!6792)))

(declare-fun lt!2943 () List!339)

(assert (=> b!11486 (= res!9549 (not (forall!62 lt!2943 p!216)))))

(declare-fun b!11487 () Bool)

(assert (=> b!11487 (= e!6794 (not e!6792))))

(declare-fun res!9551 () Bool)

(assert (=> b!11487 (=> res!9551 e!6792)))

(declare-datatypes ((ListLongMap!359 0))(
  ( (ListLongMap!360 (toList!195 List!339)) )
))
(declare-fun lt!2944 () ListLongMap!359)

(assert (=> b!11487 (= res!9551 (not (forall!62 (toList!195 lt!2944) p!216)))))

(declare-fun tail!56 (List!339) List!339)

(assert (=> b!11487 (= lt!2943 (tail!56 kvs!4))))

(declare-fun lm!227 () ListLongMap!359)

(declare-fun lt!2945 () tuple2!378)

(declare-fun +!29 (ListLongMap!359 tuple2!378) ListLongMap!359)

(assert (=> b!11487 (= lt!2944 (+!29 lm!227 lt!2945))))

(assert (=> b!11487 (forall!62 (toList!195 (+!29 lm!227 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945)))) p!216)))

(declare-datatypes ((Unit!253 0))(
  ( (Unit!254) )
))
(declare-fun lt!2946 () Unit!253)

(declare-fun addValidProp!17 (ListLongMap!359 Int (_ BitVec 64) B!392) Unit!253)

(assert (=> b!11487 (= lt!2946 (addValidProp!17 lm!227 p!216 (_1!189 lt!2945) (_2!189 lt!2945)))))

(declare-fun head!776 (List!339) tuple2!378)

(assert (=> b!11487 (= lt!2945 (head!776 kvs!4))))

(declare-fun b!11488 () Bool)

(declare-fun e!6791 () Bool)

(declare-fun tp!1896 () Bool)

(assert (=> b!11488 (= e!6791 tp!1896)))

(declare-fun b!11489 () Bool)

(declare-fun ++!4 (ListLongMap!359 List!339) ListLongMap!359)

(assert (=> b!11489 (= e!6792 (forall!62 (toList!195 (++!4 lm!227 kvs!4)) p!216))))

(assert (=> b!11489 (forall!62 (toList!195 (++!4 lt!2944 lt!2943)) p!216)))

(declare-fun lt!2942 () Unit!253)

(declare-fun insertAllValidProp!2 (ListLongMap!359 List!339 Int) Unit!253)

(assert (=> b!11489 (= lt!2942 (insertAllValidProp!2 lt!2944 lt!2943 p!216))))

(declare-fun res!9553 () Bool)

(assert (=> start!1554 (=> (not res!9553) (not e!6794))))

(assert (=> start!1554 (= res!9553 (forall!62 (toList!195 lm!227) p!216))))

(assert (=> start!1554 e!6794))

(declare-fun inv!566 (ListLongMap!359) Bool)

(assert (=> start!1554 (and (inv!566 lm!227) e!6791)))

(assert (=> start!1554 tp!1897))

(assert (=> start!1554 e!6793))

(assert (= (and start!1554 res!9553) b!11485))

(assert (= (and b!11485 res!9552) b!11483))

(assert (= (and b!11483 res!9550) b!11487))

(assert (= (and b!11487 (not res!9551)) b!11486))

(assert (= (and b!11486 (not res!9549)) b!11489))

(assert (= start!1554 b!11488))

(get-info :version)

(assert (= (and start!1554 ((_ is Cons!335) kvs!4)) b!11484))

(declare-fun m!7829 () Bool)

(assert (=> b!11489 m!7829))

(declare-fun m!7831 () Bool)

(assert (=> b!11489 m!7831))

(declare-fun m!7833 () Bool)

(assert (=> b!11489 m!7833))

(declare-fun m!7835 () Bool)

(assert (=> b!11489 m!7835))

(declare-fun m!7837 () Bool)

(assert (=> b!11489 m!7837))

(declare-fun m!7839 () Bool)

(assert (=> start!1554 m!7839))

(declare-fun m!7841 () Bool)

(assert (=> start!1554 m!7841))

(declare-fun m!7843 () Bool)

(assert (=> b!11487 m!7843))

(declare-fun m!7845 () Bool)

(assert (=> b!11487 m!7845))

(declare-fun m!7847 () Bool)

(assert (=> b!11487 m!7847))

(declare-fun m!7849 () Bool)

(assert (=> b!11487 m!7849))

(declare-fun m!7851 () Bool)

(assert (=> b!11487 m!7851))

(declare-fun m!7853 () Bool)

(assert (=> b!11487 m!7853))

(declare-fun m!7855 () Bool)

(assert (=> b!11487 m!7855))

(declare-fun m!7857 () Bool)

(assert (=> b!11485 m!7857))

(declare-fun m!7859 () Bool)

(assert (=> b!11483 m!7859))

(declare-fun m!7861 () Bool)

(assert (=> b!11486 m!7861))

(check-sat (not b_next!451) b_and!783 tp_is_empty!565 (not b!11488) (not start!1554) (not b!11484) (not b!11485) (not b!11489) (not b!11487) (not b!11486) (not b!11483))
(check-sat b_and!783 (not b_next!451))
(get-model)

(declare-fun d!1495 () Bool)

(declare-fun res!9588 () Bool)

(declare-fun e!6823 () Bool)

(assert (=> d!1495 (=> res!9588 e!6823)))

(assert (=> d!1495 (= res!9588 ((_ is Nil!336) (toList!195 lm!227)))))

(assert (=> d!1495 (= (forall!62 (toList!195 lm!227) p!216) e!6823)))

(declare-fun b!11536 () Bool)

(declare-fun e!6824 () Bool)

(assert (=> b!11536 (= e!6823 e!6824)))

(declare-fun res!9589 () Bool)

(assert (=> b!11536 (=> (not res!9589) (not e!6824))))

(declare-fun dynLambda!73 (Int tuple2!378) Bool)

(assert (=> b!11536 (= res!9589 (dynLambda!73 p!216 (h!901 (toList!195 lm!227))))))

(declare-fun b!11537 () Bool)

(assert (=> b!11537 (= e!6824 (forall!62 (t!2660 (toList!195 lm!227)) p!216))))

(assert (= (and d!1495 (not res!9588)) b!11536))

(assert (= (and b!11536 res!9589) b!11537))

(declare-fun b_lambda!707 () Bool)

(assert (=> (not b_lambda!707) (not b!11536)))

(declare-fun t!2664 () Bool)

(declare-fun tb!321 () Bool)

(assert (=> (and start!1554 (= p!216 p!216) t!2664) tb!321))

(declare-fun result!495 () Bool)

(assert (=> tb!321 (= result!495 true)))

(assert (=> b!11536 t!2664))

(declare-fun b_and!789 () Bool)

(assert (= b_and!783 (and (=> t!2664 result!495) b_and!789)))

(declare-fun m!7931 () Bool)

(assert (=> b!11536 m!7931))

(declare-fun m!7933 () Bool)

(assert (=> b!11537 m!7933))

(assert (=> start!1554 d!1495))

(declare-fun d!1499 () Bool)

(declare-fun isStrictlySorted!44 (List!339) Bool)

(assert (=> d!1499 (= (inv!566 lm!227) (isStrictlySorted!44 (toList!195 lm!227)))))

(declare-fun bs!438 () Bool)

(assert (= bs!438 d!1499))

(declare-fun m!7935 () Bool)

(assert (=> bs!438 m!7935))

(assert (=> start!1554 d!1499))

(declare-fun d!1501 () Bool)

(declare-fun res!9590 () Bool)

(declare-fun e!6825 () Bool)

(assert (=> d!1501 (=> res!9590 e!6825)))

(assert (=> d!1501 (= res!9590 ((_ is Nil!336) kvs!4))))

(assert (=> d!1501 (= (forall!62 kvs!4 p!216) e!6825)))

(declare-fun b!11538 () Bool)

(declare-fun e!6826 () Bool)

(assert (=> b!11538 (= e!6825 e!6826)))

(declare-fun res!9591 () Bool)

(assert (=> b!11538 (=> (not res!9591) (not e!6826))))

(assert (=> b!11538 (= res!9591 (dynLambda!73 p!216 (h!901 kvs!4)))))

(declare-fun b!11539 () Bool)

(assert (=> b!11539 (= e!6826 (forall!62 (t!2660 kvs!4) p!216))))

(assert (= (and d!1501 (not res!9590)) b!11538))

(assert (= (and b!11538 res!9591) b!11539))

(declare-fun b_lambda!709 () Bool)

(assert (=> (not b_lambda!709) (not b!11538)))

(declare-fun t!2666 () Bool)

(declare-fun tb!323 () Bool)

(assert (=> (and start!1554 (= p!216 p!216) t!2666) tb!323))

(declare-fun result!497 () Bool)

(assert (=> tb!323 (= result!497 true)))

(assert (=> b!11538 t!2666))

(declare-fun b_and!791 () Bool)

(assert (= b_and!789 (and (=> t!2666 result!497) b_and!791)))

(declare-fun m!7937 () Bool)

(assert (=> b!11538 m!7937))

(declare-fun m!7939 () Bool)

(assert (=> b!11539 m!7939))

(assert (=> b!11485 d!1501))

(declare-fun d!1503 () Bool)

(assert (=> d!1503 (= (isEmpty!69 kvs!4) ((_ is Nil!336) kvs!4))))

(assert (=> b!11483 d!1503))

(declare-fun d!1505 () Bool)

(declare-fun c!968 () Bool)

(assert (=> d!1505 (= c!968 ((_ is Nil!336) kvs!4))))

(declare-fun e!6832 () ListLongMap!359)

(assert (=> d!1505 (= (++!4 lm!227 kvs!4) e!6832)))

(declare-fun b!11550 () Bool)

(assert (=> b!11550 (= e!6832 lm!227)))

(declare-fun b!11551 () Bool)

(assert (=> b!11551 (= e!6832 (++!4 (+!29 lm!227 (h!901 kvs!4)) (t!2660 kvs!4)))))

(assert (= (and d!1505 c!968) b!11550))

(assert (= (and d!1505 (not c!968)) b!11551))

(declare-fun m!7953 () Bool)

(assert (=> b!11551 m!7953))

(assert (=> b!11551 m!7953))

(declare-fun m!7955 () Bool)

(assert (=> b!11551 m!7955))

(assert (=> b!11489 d!1505))

(declare-fun d!1511 () Bool)

(declare-fun res!9598 () Bool)

(declare-fun e!6833 () Bool)

(assert (=> d!1511 (=> res!9598 e!6833)))

(assert (=> d!1511 (= res!9598 ((_ is Nil!336) (toList!195 (++!4 lm!227 kvs!4))))))

(assert (=> d!1511 (= (forall!62 (toList!195 (++!4 lm!227 kvs!4)) p!216) e!6833)))

(declare-fun b!11552 () Bool)

(declare-fun e!6834 () Bool)

(assert (=> b!11552 (= e!6833 e!6834)))

(declare-fun res!9599 () Bool)

(assert (=> b!11552 (=> (not res!9599) (not e!6834))))

(assert (=> b!11552 (= res!9599 (dynLambda!73 p!216 (h!901 (toList!195 (++!4 lm!227 kvs!4)))))))

(declare-fun b!11553 () Bool)

(assert (=> b!11553 (= e!6834 (forall!62 (t!2660 (toList!195 (++!4 lm!227 kvs!4))) p!216))))

(assert (= (and d!1511 (not res!9598)) b!11552))

(assert (= (and b!11552 res!9599) b!11553))

(declare-fun b_lambda!711 () Bool)

(assert (=> (not b_lambda!711) (not b!11552)))

(declare-fun t!2668 () Bool)

(declare-fun tb!325 () Bool)

(assert (=> (and start!1554 (= p!216 p!216) t!2668) tb!325))

(declare-fun result!499 () Bool)

(assert (=> tb!325 (= result!499 true)))

(assert (=> b!11552 t!2668))

(declare-fun b_and!793 () Bool)

(assert (= b_and!791 (and (=> t!2668 result!499) b_and!793)))

(declare-fun m!7957 () Bool)

(assert (=> b!11552 m!7957))

(declare-fun m!7959 () Bool)

(assert (=> b!11553 m!7959))

(assert (=> b!11489 d!1511))

(declare-fun d!1513 () Bool)

(declare-fun res!9600 () Bool)

(declare-fun e!6835 () Bool)

(assert (=> d!1513 (=> res!9600 e!6835)))

(assert (=> d!1513 (= res!9600 ((_ is Nil!336) (toList!195 (++!4 lt!2944 lt!2943))))))

(assert (=> d!1513 (= (forall!62 (toList!195 (++!4 lt!2944 lt!2943)) p!216) e!6835)))

(declare-fun b!11554 () Bool)

(declare-fun e!6836 () Bool)

(assert (=> b!11554 (= e!6835 e!6836)))

(declare-fun res!9601 () Bool)

(assert (=> b!11554 (=> (not res!9601) (not e!6836))))

(assert (=> b!11554 (= res!9601 (dynLambda!73 p!216 (h!901 (toList!195 (++!4 lt!2944 lt!2943)))))))

(declare-fun b!11555 () Bool)

(assert (=> b!11555 (= e!6836 (forall!62 (t!2660 (toList!195 (++!4 lt!2944 lt!2943))) p!216))))

(assert (= (and d!1513 (not res!9600)) b!11554))

(assert (= (and b!11554 res!9601) b!11555))

(declare-fun b_lambda!713 () Bool)

(assert (=> (not b_lambda!713) (not b!11554)))

(declare-fun t!2670 () Bool)

(declare-fun tb!327 () Bool)

(assert (=> (and start!1554 (= p!216 p!216) t!2670) tb!327))

(declare-fun result!501 () Bool)

(assert (=> tb!327 (= result!501 true)))

(assert (=> b!11554 t!2670))

(declare-fun b_and!795 () Bool)

(assert (= b_and!793 (and (=> t!2670 result!501) b_and!795)))

(declare-fun m!7961 () Bool)

(assert (=> b!11554 m!7961))

(declare-fun m!7963 () Bool)

(assert (=> b!11555 m!7963))

(assert (=> b!11489 d!1513))

(declare-fun d!1515 () Bool)

(assert (=> d!1515 (forall!62 (toList!195 (++!4 lt!2944 lt!2943)) p!216)))

(declare-fun lt!2994 () Unit!253)

(declare-fun choose!159 (ListLongMap!359 List!339 Int) Unit!253)

(assert (=> d!1515 (= lt!2994 (choose!159 lt!2944 lt!2943 p!216))))

(declare-fun e!6845 () Bool)

(assert (=> d!1515 e!6845))

(declare-fun res!9607 () Bool)

(assert (=> d!1515 (=> (not res!9607) (not e!6845))))

(assert (=> d!1515 (= res!9607 (forall!62 (toList!195 lt!2944) p!216))))

(assert (=> d!1515 (= (insertAllValidProp!2 lt!2944 lt!2943 p!216) lt!2994)))

(declare-fun b!11568 () Bool)

(assert (=> b!11568 (= e!6845 (forall!62 lt!2943 p!216))))

(assert (= (and d!1515 res!9607) b!11568))

(assert (=> d!1515 m!7833))

(assert (=> d!1515 m!7829))

(declare-fun m!7973 () Bool)

(assert (=> d!1515 m!7973))

(assert (=> d!1515 m!7847))

(assert (=> b!11568 m!7861))

(assert (=> b!11489 d!1515))

(declare-fun d!1521 () Bool)

(declare-fun c!972 () Bool)

(assert (=> d!1521 (= c!972 ((_ is Nil!336) lt!2943))))

(declare-fun e!6850 () ListLongMap!359)

(assert (=> d!1521 (= (++!4 lt!2944 lt!2943) e!6850)))

(declare-fun b!11573 () Bool)

(assert (=> b!11573 (= e!6850 lt!2944)))

(declare-fun b!11574 () Bool)

(assert (=> b!11574 (= e!6850 (++!4 (+!29 lt!2944 (h!901 lt!2943)) (t!2660 lt!2943)))))

(assert (= (and d!1521 c!972) b!11573))

(assert (= (and d!1521 (not c!972)) b!11574))

(declare-fun m!7975 () Bool)

(assert (=> b!11574 m!7975))

(assert (=> b!11574 m!7975))

(declare-fun m!7977 () Bool)

(assert (=> b!11574 m!7977))

(assert (=> b!11489 d!1521))

(declare-fun d!1523 () Bool)

(assert (=> d!1523 (= (tail!56 kvs!4) (t!2660 kvs!4))))

(assert (=> b!11487 d!1523))

(declare-fun d!1525 () Bool)

(declare-fun res!9614 () Bool)

(declare-fun e!6853 () Bool)

(assert (=> d!1525 (=> res!9614 e!6853)))

(assert (=> d!1525 (= res!9614 ((_ is Nil!336) (toList!195 lt!2944)))))

(assert (=> d!1525 (= (forall!62 (toList!195 lt!2944) p!216) e!6853)))

(declare-fun b!11577 () Bool)

(declare-fun e!6854 () Bool)

(assert (=> b!11577 (= e!6853 e!6854)))

(declare-fun res!9615 () Bool)

(assert (=> b!11577 (=> (not res!9615) (not e!6854))))

(assert (=> b!11577 (= res!9615 (dynLambda!73 p!216 (h!901 (toList!195 lt!2944))))))

(declare-fun b!11578 () Bool)

(assert (=> b!11578 (= e!6854 (forall!62 (t!2660 (toList!195 lt!2944)) p!216))))

(assert (= (and d!1525 (not res!9614)) b!11577))

(assert (= (and b!11577 res!9615) b!11578))

(declare-fun b_lambda!719 () Bool)

(assert (=> (not b_lambda!719) (not b!11577)))

(declare-fun t!2676 () Bool)

(declare-fun tb!333 () Bool)

(assert (=> (and start!1554 (= p!216 p!216) t!2676) tb!333))

(declare-fun result!507 () Bool)

(assert (=> tb!333 (= result!507 true)))

(assert (=> b!11577 t!2676))

(declare-fun b_and!801 () Bool)

(assert (= b_and!795 (and (=> t!2676 result!507) b_and!801)))

(declare-fun m!7983 () Bool)

(assert (=> b!11577 m!7983))

(declare-fun m!7985 () Bool)

(assert (=> b!11578 m!7985))

(assert (=> b!11487 d!1525))

(declare-fun d!1529 () Bool)

(assert (=> d!1529 (forall!62 (toList!195 (+!29 lm!227 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945)))) p!216)))

(declare-fun lt!3003 () Unit!253)

(declare-fun choose!161 (ListLongMap!359 Int (_ BitVec 64) B!392) Unit!253)

(assert (=> d!1529 (= lt!3003 (choose!161 lm!227 p!216 (_1!189 lt!2945) (_2!189 lt!2945)))))

(declare-fun e!6868 () Bool)

(assert (=> d!1529 e!6868))

(declare-fun res!9630 () Bool)

(assert (=> d!1529 (=> (not res!9630) (not e!6868))))

(assert (=> d!1529 (= res!9630 (forall!62 (toList!195 lm!227) p!216))))

(assert (=> d!1529 (= (addValidProp!17 lm!227 p!216 (_1!189 lt!2945) (_2!189 lt!2945)) lt!3003)))

(declare-fun b!11594 () Bool)

(assert (=> b!11594 (= e!6868 (dynLambda!73 p!216 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945))))))

(assert (= (and d!1529 res!9630) b!11594))

(declare-fun b_lambda!729 () Bool)

(assert (=> (not b_lambda!729) (not b!11594)))

(declare-fun t!2686 () Bool)

(declare-fun tb!343 () Bool)

(assert (=> (and start!1554 (= p!216 p!216) t!2686) tb!343))

(declare-fun result!517 () Bool)

(assert (=> tb!343 (= result!517 true)))

(assert (=> b!11594 t!2686))

(declare-fun b_and!811 () Bool)

(assert (= b_and!801 (and (=> t!2686 result!517) b_and!811)))

(assert (=> d!1529 m!7845))

(assert (=> d!1529 m!7849))

(declare-fun m!8017 () Bool)

(assert (=> d!1529 m!8017))

(assert (=> d!1529 m!7839))

(declare-fun m!8019 () Bool)

(assert (=> b!11594 m!8019))

(assert (=> b!11487 d!1529))

(declare-fun d!1547 () Bool)

(declare-fun res!9632 () Bool)

(declare-fun e!6870 () Bool)

(assert (=> d!1547 (=> res!9632 e!6870)))

(assert (=> d!1547 (= res!9632 ((_ is Nil!336) (toList!195 (+!29 lm!227 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945))))))))

(assert (=> d!1547 (= (forall!62 (toList!195 (+!29 lm!227 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945)))) p!216) e!6870)))

(declare-fun b!11596 () Bool)

(declare-fun e!6871 () Bool)

(assert (=> b!11596 (= e!6870 e!6871)))

(declare-fun res!9633 () Bool)

(assert (=> b!11596 (=> (not res!9633) (not e!6871))))

(assert (=> b!11596 (= res!9633 (dynLambda!73 p!216 (h!901 (toList!195 (+!29 lm!227 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945)))))))))

(declare-fun b!11597 () Bool)

(assert (=> b!11597 (= e!6871 (forall!62 (t!2660 (toList!195 (+!29 lm!227 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945))))) p!216))))

(assert (= (and d!1547 (not res!9632)) b!11596))

(assert (= (and b!11596 res!9633) b!11597))

(declare-fun b_lambda!731 () Bool)

(assert (=> (not b_lambda!731) (not b!11596)))

(declare-fun t!2688 () Bool)

(declare-fun tb!345 () Bool)

(assert (=> (and start!1554 (= p!216 p!216) t!2688) tb!345))

(declare-fun result!519 () Bool)

(assert (=> tb!345 (= result!519 true)))

(assert (=> b!11596 t!2688))

(declare-fun b_and!813 () Bool)

(assert (= b_and!811 (and (=> t!2688 result!519) b_and!813)))

(declare-fun m!8023 () Bool)

(assert (=> b!11596 m!8023))

(declare-fun m!8025 () Bool)

(assert (=> b!11597 m!8025))

(assert (=> b!11487 d!1547))

(declare-fun d!1551 () Bool)

(assert (=> d!1551 (= (head!776 kvs!4) (h!901 kvs!4))))

(assert (=> b!11487 d!1551))

(declare-fun d!1553 () Bool)

(declare-fun e!6895 () Bool)

(assert (=> d!1553 e!6895))

(declare-fun res!9654 () Bool)

(assert (=> d!1553 (=> (not res!9654) (not e!6895))))

(declare-fun lt!3015 () ListLongMap!359)

(declare-fun contains!165 (ListLongMap!359 (_ BitVec 64)) Bool)

(assert (=> d!1553 (= res!9654 (contains!165 lt!3015 (_1!189 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945)))))))

(declare-fun lt!3016 () List!339)

(assert (=> d!1553 (= lt!3015 (ListLongMap!360 lt!3016))))

(declare-fun lt!3014 () Unit!253)

(declare-fun lt!3013 () Unit!253)

(assert (=> d!1553 (= lt!3014 lt!3013)))

(declare-datatypes ((Option!36 0))(
  ( (Some!35 (v!1350 B!392)) (None!34) )
))
(declare-fun getValueByKey!30 (List!339 (_ BitVec 64)) Option!36)

(assert (=> d!1553 (= (getValueByKey!30 lt!3016 (_1!189 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945)))) (Some!35 (_2!189 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!14 (List!339 (_ BitVec 64) B!392) Unit!253)

(assert (=> d!1553 (= lt!3013 (lemmaContainsTupThenGetReturnValue!14 lt!3016 (_1!189 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945))) (_2!189 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945)))))))

(declare-fun insertStrictlySorted!14 (List!339 (_ BitVec 64) B!392) List!339)

(assert (=> d!1553 (= lt!3016 (insertStrictlySorted!14 (toList!195 lm!227) (_1!189 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945))) (_2!189 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945)))))))

(assert (=> d!1553 (= (+!29 lm!227 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945))) lt!3015)))

(declare-fun b!11628 () Bool)

(declare-fun res!9655 () Bool)

(assert (=> b!11628 (=> (not res!9655) (not e!6895))))

(assert (=> b!11628 (= res!9655 (= (getValueByKey!30 (toList!195 lt!3015) (_1!189 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945)))) (Some!35 (_2!189 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945))))))))

(declare-fun b!11629 () Bool)

(declare-fun contains!166 (List!339 tuple2!378) Bool)

(assert (=> b!11629 (= e!6895 (contains!166 (toList!195 lt!3015) (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945))))))

(assert (= (and d!1553 res!9654) b!11628))

(assert (= (and b!11628 res!9655) b!11629))

(declare-fun m!8063 () Bool)

(assert (=> d!1553 m!8063))

(declare-fun m!8065 () Bool)

(assert (=> d!1553 m!8065))

(declare-fun m!8067 () Bool)

(assert (=> d!1553 m!8067))

(declare-fun m!8069 () Bool)

(assert (=> d!1553 m!8069))

(declare-fun m!8071 () Bool)

(assert (=> b!11628 m!8071))

(declare-fun m!8073 () Bool)

(assert (=> b!11629 m!8073))

(assert (=> b!11487 d!1553))

(declare-fun d!1577 () Bool)

(declare-fun e!6898 () Bool)

(assert (=> d!1577 e!6898))

(declare-fun res!9658 () Bool)

(assert (=> d!1577 (=> (not res!9658) (not e!6898))))

(declare-fun lt!3021 () ListLongMap!359)

(assert (=> d!1577 (= res!9658 (contains!165 lt!3021 (_1!189 lt!2945)))))

(declare-fun lt!3022 () List!339)

(assert (=> d!1577 (= lt!3021 (ListLongMap!360 lt!3022))))

(declare-fun lt!3020 () Unit!253)

(declare-fun lt!3019 () Unit!253)

(assert (=> d!1577 (= lt!3020 lt!3019)))

(assert (=> d!1577 (= (getValueByKey!30 lt!3022 (_1!189 lt!2945)) (Some!35 (_2!189 lt!2945)))))

(assert (=> d!1577 (= lt!3019 (lemmaContainsTupThenGetReturnValue!14 lt!3022 (_1!189 lt!2945) (_2!189 lt!2945)))))

(assert (=> d!1577 (= lt!3022 (insertStrictlySorted!14 (toList!195 lm!227) (_1!189 lt!2945) (_2!189 lt!2945)))))

(assert (=> d!1577 (= (+!29 lm!227 lt!2945) lt!3021)))

(declare-fun b!11632 () Bool)

(declare-fun res!9659 () Bool)

(assert (=> b!11632 (=> (not res!9659) (not e!6898))))

(assert (=> b!11632 (= res!9659 (= (getValueByKey!30 (toList!195 lt!3021) (_1!189 lt!2945)) (Some!35 (_2!189 lt!2945))))))

(declare-fun b!11633 () Bool)

(assert (=> b!11633 (= e!6898 (contains!166 (toList!195 lt!3021) lt!2945))))

(assert (= (and d!1577 res!9658) b!11632))

(assert (= (and b!11632 res!9659) b!11633))

(declare-fun m!8075 () Bool)

(assert (=> d!1577 m!8075))

(declare-fun m!8077 () Bool)

(assert (=> d!1577 m!8077))

(declare-fun m!8079 () Bool)

(assert (=> d!1577 m!8079))

(declare-fun m!8081 () Bool)

(assert (=> d!1577 m!8081))

(declare-fun m!8083 () Bool)

(assert (=> b!11632 m!8083))

(declare-fun m!8085 () Bool)

(assert (=> b!11633 m!8085))

(assert (=> b!11487 d!1577))

(declare-fun d!1579 () Bool)

(declare-fun res!9660 () Bool)

(declare-fun e!6899 () Bool)

(assert (=> d!1579 (=> res!9660 e!6899)))

(assert (=> d!1579 (= res!9660 ((_ is Nil!336) lt!2943))))

(assert (=> d!1579 (= (forall!62 lt!2943 p!216) e!6899)))

(declare-fun b!11634 () Bool)

(declare-fun e!6900 () Bool)

(assert (=> b!11634 (= e!6899 e!6900)))

(declare-fun res!9661 () Bool)

(assert (=> b!11634 (=> (not res!9661) (not e!6900))))

(assert (=> b!11634 (= res!9661 (dynLambda!73 p!216 (h!901 lt!2943)))))

(declare-fun b!11635 () Bool)

(assert (=> b!11635 (= e!6900 (forall!62 (t!2660 lt!2943) p!216))))

(assert (= (and d!1579 (not res!9660)) b!11634))

(assert (= (and b!11634 res!9661) b!11635))

(declare-fun b_lambda!745 () Bool)

(assert (=> (not b_lambda!745) (not b!11634)))

(declare-fun t!2702 () Bool)

(declare-fun tb!359 () Bool)

(assert (=> (and start!1554 (= p!216 p!216) t!2702) tb!359))

(declare-fun result!533 () Bool)

(assert (=> tb!359 (= result!533 true)))

(assert (=> b!11634 t!2702))

(declare-fun b_and!827 () Bool)

(assert (= b_and!813 (and (=> t!2702 result!533) b_and!827)))

(declare-fun m!8089 () Bool)

(assert (=> b!11634 m!8089))

(declare-fun m!8091 () Bool)

(assert (=> b!11635 m!8091))

(assert (=> b!11486 d!1579))

(declare-fun b!11646 () Bool)

(declare-fun e!6907 () Bool)

(declare-fun tp!1922 () Bool)

(assert (=> b!11646 (= e!6907 (and tp_is_empty!565 tp!1922))))

(assert (=> b!11484 (= tp!1898 e!6907)))

(assert (= (and b!11484 ((_ is Cons!335) (t!2660 kvs!4))) b!11646))

(declare-fun b!11647 () Bool)

(declare-fun e!6908 () Bool)

(declare-fun tp!1923 () Bool)

(assert (=> b!11647 (= e!6908 (and tp_is_empty!565 tp!1923))))

(assert (=> b!11488 (= tp!1896 e!6908)))

(assert (= (and b!11488 ((_ is Cons!335) (toList!195 lm!227))) b!11647))

(declare-fun b_lambda!748 () Bool)

(assert (= b_lambda!707 (or (and start!1554 b_free!451) b_lambda!748)))

(declare-fun b_lambda!752 () Bool)

(assert (= b_lambda!731 (or (and start!1554 b_free!451) b_lambda!752)))

(declare-fun b_lambda!757 () Bool)

(assert (= b_lambda!745 (or (and start!1554 b_free!451) b_lambda!757)))

(declare-fun b_lambda!761 () Bool)

(assert (= b_lambda!719 (or (and start!1554 b_free!451) b_lambda!761)))

(declare-fun b_lambda!765 () Bool)

(assert (= b_lambda!711 (or (and start!1554 b_free!451) b_lambda!765)))

(declare-fun b_lambda!769 () Bool)

(assert (= b_lambda!709 (or (and start!1554 b_free!451) b_lambda!769)))

(declare-fun b_lambda!773 () Bool)

(assert (= b_lambda!713 (or (and start!1554 b_free!451) b_lambda!773)))

(declare-fun b_lambda!777 () Bool)

(assert (= b_lambda!729 (or (and start!1554 b_free!451) b_lambda!777)))

(check-sat (not b!11578) (not b!11647) tp_is_empty!565 b_and!827 (not b!11629) (not b_lambda!757) (not b!11553) (not b_lambda!748) (not d!1553) (not b_lambda!769) (not b!11539) (not b!11635) (not b!11537) (not b!11574) (not b!11568) (not b_lambda!752) (not b_lambda!777) (not b_next!451) (not d!1577) (not b!11632) (not b!11597) (not b!11633) (not b!11551) (not b_lambda!765) (not b!11646) (not d!1529) (not b!11628) (not b_lambda!773) (not d!1499) (not d!1515) (not b_lambda!761) (not b!11555))
(check-sat b_and!827 (not b_next!451))
