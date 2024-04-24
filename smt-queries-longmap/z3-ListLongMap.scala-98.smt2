; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1554 () Bool)

(assert start!1554)

(declare-fun b_free!451 () Bool)

(declare-fun b_next!451 () Bool)

(assert (=> start!1554 (= b_free!451 (not b_next!451))))

(declare-fun tp!1896 () Bool)

(declare-fun b_and!783 () Bool)

(assert (=> start!1554 (= tp!1896 b_and!783)))

(declare-fun b!11483 () Bool)

(declare-fun res!9553 () Bool)

(declare-fun e!6794 () Bool)

(assert (=> b!11483 (=> (not res!9553) (not e!6794))))

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

(declare-fun p!216 () Int)

(declare-fun forall!62 (List!339 Int) Bool)

(assert (=> b!11483 (= res!9553 (forall!62 kvs!4 p!216))))

(declare-fun b!11484 () Bool)

(declare-fun res!9550 () Bool)

(assert (=> b!11484 (=> (not res!9550) (not e!6794))))

(declare-fun isEmpty!69 (List!339) Bool)

(assert (=> b!11484 (= res!9550 (not (isEmpty!69 kvs!4)))))

(declare-fun b!11485 () Bool)

(declare-fun e!6792 () Bool)

(declare-fun tp!1898 () Bool)

(assert (=> b!11485 (= e!6792 tp!1898)))

(declare-fun b!11486 () Bool)

(declare-fun e!6791 () Bool)

(assert (=> b!11486 (= e!6794 (not e!6791))))

(declare-fun res!9551 () Bool)

(assert (=> b!11486 (=> res!9551 e!6791)))

(declare-datatypes ((ListLongMap!359 0))(
  ( (ListLongMap!360 (toList!195 List!339)) )
))
(declare-fun lt!2946 () ListLongMap!359)

(assert (=> b!11486 (= res!9551 (not (forall!62 (toList!195 lt!2946) p!216)))))

(declare-fun lt!2942 () List!339)

(declare-fun tail!56 (List!339) List!339)

(assert (=> b!11486 (= lt!2942 (tail!56 kvs!4))))

(declare-fun lm!227 () ListLongMap!359)

(declare-fun lt!2945 () tuple2!378)

(declare-fun +!29 (ListLongMap!359 tuple2!378) ListLongMap!359)

(assert (=> b!11486 (= lt!2946 (+!29 lm!227 lt!2945))))

(assert (=> b!11486 (forall!62 (toList!195 (+!29 lm!227 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945)))) p!216)))

(declare-datatypes ((Unit!253 0))(
  ( (Unit!254) )
))
(declare-fun lt!2944 () Unit!253)

(declare-fun addValidProp!17 (ListLongMap!359 Int (_ BitVec 64) B!392) Unit!253)

(assert (=> b!11486 (= lt!2944 (addValidProp!17 lm!227 p!216 (_1!189 lt!2945) (_2!189 lt!2945)))))

(declare-fun head!776 (List!339) tuple2!378)

(assert (=> b!11486 (= lt!2945 (head!776 kvs!4))))

(declare-fun b!11487 () Bool)

(declare-fun res!9552 () Bool)

(assert (=> b!11487 (=> res!9552 e!6791)))

(assert (=> b!11487 (= res!9552 (not (forall!62 lt!2942 p!216)))))

(declare-fun b!11488 () Bool)

(declare-fun ++!4 (ListLongMap!359 List!339) ListLongMap!359)

(assert (=> b!11488 (= e!6791 (forall!62 (toList!195 (++!4 lm!227 kvs!4)) p!216))))

(assert (=> b!11488 (forall!62 (toList!195 (++!4 lt!2946 lt!2942)) p!216)))

(declare-fun lt!2943 () Unit!253)

(declare-fun insertAllValidProp!2 (ListLongMap!359 List!339 Int) Unit!253)

(assert (=> b!11488 (= lt!2943 (insertAllValidProp!2 lt!2946 lt!2942 p!216))))

(declare-fun b!11489 () Bool)

(declare-fun e!6793 () Bool)

(declare-fun tp_is_empty!565 () Bool)

(declare-fun tp!1897 () Bool)

(assert (=> b!11489 (= e!6793 (and tp_is_empty!565 tp!1897))))

(declare-fun res!9549 () Bool)

(assert (=> start!1554 (=> (not res!9549) (not e!6794))))

(assert (=> start!1554 (= res!9549 (forall!62 (toList!195 lm!227) p!216))))

(assert (=> start!1554 e!6794))

(declare-fun inv!566 (ListLongMap!359) Bool)

(assert (=> start!1554 (and (inv!566 lm!227) e!6792)))

(assert (=> start!1554 tp!1896))

(assert (=> start!1554 e!6793))

(assert (= (and start!1554 res!9549) b!11483))

(assert (= (and b!11483 res!9553) b!11484))

(assert (= (and b!11484 res!9550) b!11486))

(assert (= (and b!11486 (not res!9551)) b!11487))

(assert (= (and b!11487 (not res!9552)) b!11488))

(assert (= start!1554 b!11485))

(get-info :version)

(assert (= (and start!1554 ((_ is Cons!335) kvs!4)) b!11489))

(declare-fun m!7825 () Bool)

(assert (=> b!11486 m!7825))

(declare-fun m!7827 () Bool)

(assert (=> b!11486 m!7827))

(declare-fun m!7829 () Bool)

(assert (=> b!11486 m!7829))

(declare-fun m!7831 () Bool)

(assert (=> b!11486 m!7831))

(declare-fun m!7833 () Bool)

(assert (=> b!11486 m!7833))

(declare-fun m!7835 () Bool)

(assert (=> b!11486 m!7835))

(declare-fun m!7837 () Bool)

(assert (=> b!11486 m!7837))

(declare-fun m!7839 () Bool)

(assert (=> b!11487 m!7839))

(declare-fun m!7841 () Bool)

(assert (=> start!1554 m!7841))

(declare-fun m!7843 () Bool)

(assert (=> start!1554 m!7843))

(declare-fun m!7845 () Bool)

(assert (=> b!11484 m!7845))

(declare-fun m!7847 () Bool)

(assert (=> b!11488 m!7847))

(declare-fun m!7849 () Bool)

(assert (=> b!11488 m!7849))

(declare-fun m!7851 () Bool)

(assert (=> b!11488 m!7851))

(declare-fun m!7853 () Bool)

(assert (=> b!11488 m!7853))

(declare-fun m!7855 () Bool)

(assert (=> b!11488 m!7855))

(declare-fun m!7857 () Bool)

(assert (=> b!11483 m!7857))

(check-sat (not b!11485) (not start!1554) (not b!11484) (not b!11483) (not b_next!451) (not b!11487) (not b!11489) (not b!11486) b_and!783 tp_is_empty!565 (not b!11488))
(check-sat b_and!783 (not b_next!451))
(get-model)

(declare-fun d!1493 () Bool)

(declare-fun res!9588 () Bool)

(declare-fun e!6823 () Bool)

(assert (=> d!1493 (=> res!9588 e!6823)))

(assert (=> d!1493 (= res!9588 ((_ is Nil!336) lt!2942))))

(assert (=> d!1493 (= (forall!62 lt!2942 p!216) e!6823)))

(declare-fun b!11536 () Bool)

(declare-fun e!6824 () Bool)

(assert (=> b!11536 (= e!6823 e!6824)))

(declare-fun res!9589 () Bool)

(assert (=> b!11536 (=> (not res!9589) (not e!6824))))

(declare-fun dynLambda!73 (Int tuple2!378) Bool)

(assert (=> b!11536 (= res!9589 (dynLambda!73 p!216 (h!901 lt!2942)))))

(declare-fun b!11537 () Bool)

(assert (=> b!11537 (= e!6824 (forall!62 (t!2660 lt!2942) p!216))))

(assert (= (and d!1493 (not res!9588)) b!11536))

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

(declare-fun m!7927 () Bool)

(assert (=> b!11536 m!7927))

(declare-fun m!7929 () Bool)

(assert (=> b!11537 m!7929))

(assert (=> b!11487 d!1493))

(declare-fun d!1497 () Bool)

(declare-fun res!9590 () Bool)

(declare-fun e!6825 () Bool)

(assert (=> d!1497 (=> res!9590 e!6825)))

(assert (=> d!1497 (= res!9590 ((_ is Nil!336) (toList!195 (++!4 lm!227 kvs!4))))))

(assert (=> d!1497 (= (forall!62 (toList!195 (++!4 lm!227 kvs!4)) p!216) e!6825)))

(declare-fun b!11538 () Bool)

(declare-fun e!6826 () Bool)

(assert (=> b!11538 (= e!6825 e!6826)))

(declare-fun res!9591 () Bool)

(assert (=> b!11538 (=> (not res!9591) (not e!6826))))

(assert (=> b!11538 (= res!9591 (dynLambda!73 p!216 (h!901 (toList!195 (++!4 lm!227 kvs!4)))))))

(declare-fun b!11539 () Bool)

(assert (=> b!11539 (= e!6826 (forall!62 (t!2660 (toList!195 (++!4 lm!227 kvs!4))) p!216))))

(assert (= (and d!1497 (not res!9590)) b!11538))

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

(declare-fun m!7931 () Bool)

(assert (=> b!11538 m!7931))

(declare-fun m!7933 () Bool)

(assert (=> b!11539 m!7933))

(assert (=> b!11488 d!1497))

(declare-fun d!1499 () Bool)

(declare-fun res!9592 () Bool)

(declare-fun e!6827 () Bool)

(assert (=> d!1499 (=> res!9592 e!6827)))

(assert (=> d!1499 (= res!9592 ((_ is Nil!336) (toList!195 (++!4 lt!2946 lt!2942))))))

(assert (=> d!1499 (= (forall!62 (toList!195 (++!4 lt!2946 lt!2942)) p!216) e!6827)))

(declare-fun b!11540 () Bool)

(declare-fun e!6828 () Bool)

(assert (=> b!11540 (= e!6827 e!6828)))

(declare-fun res!9593 () Bool)

(assert (=> b!11540 (=> (not res!9593) (not e!6828))))

(assert (=> b!11540 (= res!9593 (dynLambda!73 p!216 (h!901 (toList!195 (++!4 lt!2946 lt!2942)))))))

(declare-fun b!11541 () Bool)

(assert (=> b!11541 (= e!6828 (forall!62 (t!2660 (toList!195 (++!4 lt!2946 lt!2942))) p!216))))

(assert (= (and d!1499 (not res!9592)) b!11540))

(assert (= (and b!11540 res!9593) b!11541))

(declare-fun b_lambda!711 () Bool)

(assert (=> (not b_lambda!711) (not b!11540)))

(declare-fun t!2668 () Bool)

(declare-fun tb!325 () Bool)

(assert (=> (and start!1554 (= p!216 p!216) t!2668) tb!325))

(declare-fun result!499 () Bool)

(assert (=> tb!325 (= result!499 true)))

(assert (=> b!11540 t!2668))

(declare-fun b_and!793 () Bool)

(assert (= b_and!791 (and (=> t!2668 result!499) b_and!793)))

(declare-fun m!7935 () Bool)

(assert (=> b!11540 m!7935))

(declare-fun m!7937 () Bool)

(assert (=> b!11541 m!7937))

(assert (=> b!11488 d!1499))

(declare-fun d!1501 () Bool)

(declare-fun c!968 () Bool)

(assert (=> d!1501 (= c!968 ((_ is Nil!336) lt!2942))))

(declare-fun e!6838 () ListLongMap!359)

(assert (=> d!1501 (= (++!4 lt!2946 lt!2942) e!6838)))

(declare-fun b!11556 () Bool)

(assert (=> b!11556 (= e!6838 lt!2946)))

(declare-fun b!11557 () Bool)

(assert (=> b!11557 (= e!6838 (++!4 (+!29 lt!2946 (h!901 lt!2942)) (t!2660 lt!2942)))))

(assert (= (and d!1501 c!968) b!11556))

(assert (= (and d!1501 (not c!968)) b!11557))

(declare-fun m!7945 () Bool)

(assert (=> b!11557 m!7945))

(assert (=> b!11557 m!7945))

(declare-fun m!7951 () Bool)

(assert (=> b!11557 m!7951))

(assert (=> b!11488 d!1501))

(declare-fun d!1505 () Bool)

(declare-fun c!969 () Bool)

(assert (=> d!1505 (= c!969 ((_ is Nil!336) kvs!4))))

(declare-fun e!6839 () ListLongMap!359)

(assert (=> d!1505 (= (++!4 lm!227 kvs!4) e!6839)))

(declare-fun b!11558 () Bool)

(assert (=> b!11558 (= e!6839 lm!227)))

(declare-fun b!11559 () Bool)

(assert (=> b!11559 (= e!6839 (++!4 (+!29 lm!227 (h!901 kvs!4)) (t!2660 kvs!4)))))

(assert (= (and d!1505 c!969) b!11558))

(assert (= (and d!1505 (not c!969)) b!11559))

(declare-fun m!7955 () Bool)

(assert (=> b!11559 m!7955))

(assert (=> b!11559 m!7955))

(declare-fun m!7957 () Bool)

(assert (=> b!11559 m!7957))

(assert (=> b!11488 d!1505))

(declare-fun d!1509 () Bool)

(assert (=> d!1509 (forall!62 (toList!195 (++!4 lt!2946 lt!2942)) p!216)))

(declare-fun lt!2995 () Unit!253)

(declare-fun choose!159 (ListLongMap!359 List!339 Int) Unit!253)

(assert (=> d!1509 (= lt!2995 (choose!159 lt!2946 lt!2942 p!216))))

(declare-fun e!6857 () Bool)

(assert (=> d!1509 e!6857))

(declare-fun res!9622 () Bool)

(assert (=> d!1509 (=> (not res!9622) (not e!6857))))

(assert (=> d!1509 (= res!9622 (forall!62 (toList!195 lt!2946) p!216))))

(assert (=> d!1509 (= (insertAllValidProp!2 lt!2946 lt!2942 p!216) lt!2995)))

(declare-fun b!11578 () Bool)

(assert (=> b!11578 (= e!6857 (forall!62 lt!2942 p!216))))

(assert (= (and d!1509 res!9622) b!11578))

(assert (=> d!1509 m!7851))

(assert (=> d!1509 m!7849))

(declare-fun m!7991 () Bool)

(assert (=> d!1509 m!7991))

(assert (=> d!1509 m!7833))

(assert (=> b!11578 m!7839))

(assert (=> b!11488 d!1509))

(declare-fun d!1527 () Bool)

(assert (=> d!1527 (forall!62 (toList!195 (+!29 lm!227 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945)))) p!216)))

(declare-fun lt!3004 () Unit!253)

(declare-fun choose!160 (ListLongMap!359 Int (_ BitVec 64) B!392) Unit!253)

(assert (=> d!1527 (= lt!3004 (choose!160 lm!227 p!216 (_1!189 lt!2945) (_2!189 lt!2945)))))

(declare-fun e!6866 () Bool)

(assert (=> d!1527 e!6866))

(declare-fun res!9631 () Bool)

(assert (=> d!1527 (=> (not res!9631) (not e!6866))))

(assert (=> d!1527 (= res!9631 (forall!62 (toList!195 lm!227) p!216))))

(assert (=> d!1527 (= (addValidProp!17 lm!227 p!216 (_1!189 lt!2945) (_2!189 lt!2945)) lt!3004)))

(declare-fun b!11590 () Bool)

(assert (=> b!11590 (= e!6866 (dynLambda!73 p!216 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945))))))

(assert (= (and d!1527 res!9631) b!11590))

(declare-fun b_lambda!727 () Bool)

(assert (=> (not b_lambda!727) (not b!11590)))

(declare-fun t!2684 () Bool)

(declare-fun tb!341 () Bool)

(assert (=> (and start!1554 (= p!216 p!216) t!2684) tb!341))

(declare-fun result!515 () Bool)

(assert (=> tb!341 (= result!515 true)))

(assert (=> b!11590 t!2684))

(declare-fun b_and!809 () Bool)

(assert (= b_and!793 (and (=> t!2684 result!515) b_and!809)))

(assert (=> d!1527 m!7829))

(assert (=> d!1527 m!7835))

(declare-fun m!8001 () Bool)

(assert (=> d!1527 m!8001))

(assert (=> d!1527 m!7841))

(declare-fun m!8003 () Bool)

(assert (=> b!11590 m!8003))

(assert (=> b!11486 d!1527))

(declare-fun d!1535 () Bool)

(declare-fun res!9634 () Bool)

(declare-fun e!6869 () Bool)

(assert (=> d!1535 (=> res!9634 e!6869)))

(assert (=> d!1535 (= res!9634 ((_ is Nil!336) (toList!195 (+!29 lm!227 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945))))))))

(assert (=> d!1535 (= (forall!62 (toList!195 (+!29 lm!227 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945)))) p!216) e!6869)))

(declare-fun b!11593 () Bool)

(declare-fun e!6870 () Bool)

(assert (=> b!11593 (= e!6869 e!6870)))

(declare-fun res!9635 () Bool)

(assert (=> b!11593 (=> (not res!9635) (not e!6870))))

(assert (=> b!11593 (= res!9635 (dynLambda!73 p!216 (h!901 (toList!195 (+!29 lm!227 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945)))))))))

(declare-fun b!11594 () Bool)

(assert (=> b!11594 (= e!6870 (forall!62 (t!2660 (toList!195 (+!29 lm!227 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945))))) p!216))))

(assert (= (and d!1535 (not res!9634)) b!11593))

(assert (= (and b!11593 res!9635) b!11594))

(declare-fun b_lambda!731 () Bool)

(assert (=> (not b_lambda!731) (not b!11593)))

(declare-fun t!2688 () Bool)

(declare-fun tb!345 () Bool)

(assert (=> (and start!1554 (= p!216 p!216) t!2688) tb!345))

(declare-fun result!519 () Bool)

(assert (=> tb!345 (= result!519 true)))

(assert (=> b!11593 t!2688))

(declare-fun b_and!813 () Bool)

(assert (= b_and!809 (and (=> t!2688 result!519) b_and!813)))

(declare-fun m!8009 () Bool)

(assert (=> b!11593 m!8009))

(declare-fun m!8011 () Bool)

(assert (=> b!11594 m!8011))

(assert (=> b!11486 d!1535))

(declare-fun d!1539 () Bool)

(assert (=> d!1539 (= (tail!56 kvs!4) (t!2660 kvs!4))))

(assert (=> b!11486 d!1539))

(declare-fun d!1541 () Bool)

(declare-fun res!9636 () Bool)

(declare-fun e!6871 () Bool)

(assert (=> d!1541 (=> res!9636 e!6871)))

(assert (=> d!1541 (= res!9636 ((_ is Nil!336) (toList!195 lt!2946)))))

(assert (=> d!1541 (= (forall!62 (toList!195 lt!2946) p!216) e!6871)))

(declare-fun b!11595 () Bool)

(declare-fun e!6872 () Bool)

(assert (=> b!11595 (= e!6871 e!6872)))

(declare-fun res!9637 () Bool)

(assert (=> b!11595 (=> (not res!9637) (not e!6872))))

(assert (=> b!11595 (= res!9637 (dynLambda!73 p!216 (h!901 (toList!195 lt!2946))))))

(declare-fun b!11596 () Bool)

(assert (=> b!11596 (= e!6872 (forall!62 (t!2660 (toList!195 lt!2946)) p!216))))

(assert (= (and d!1541 (not res!9636)) b!11595))

(assert (= (and b!11595 res!9637) b!11596))

(declare-fun b_lambda!733 () Bool)

(assert (=> (not b_lambda!733) (not b!11595)))

(declare-fun t!2690 () Bool)

(declare-fun tb!347 () Bool)

(assert (=> (and start!1554 (= p!216 p!216) t!2690) tb!347))

(declare-fun result!521 () Bool)

(assert (=> tb!347 (= result!521 true)))

(assert (=> b!11595 t!2690))

(declare-fun b_and!815 () Bool)

(assert (= b_and!813 (and (=> t!2690 result!521) b_and!815)))

(declare-fun m!8015 () Bool)

(assert (=> b!11595 m!8015))

(declare-fun m!8017 () Bool)

(assert (=> b!11596 m!8017))

(assert (=> b!11486 d!1541))

(declare-fun d!1545 () Bool)

(declare-fun e!6891 () Bool)

(assert (=> d!1545 e!6891))

(declare-fun res!9659 () Bool)

(assert (=> d!1545 (=> (not res!9659) (not e!6891))))

(declare-fun lt!3032 () ListLongMap!359)

(declare-fun contains!166 (ListLongMap!359 (_ BitVec 64)) Bool)

(assert (=> d!1545 (= res!9659 (contains!166 lt!3032 (_1!189 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945)))))))

(declare-fun lt!3031 () List!339)

(assert (=> d!1545 (= lt!3032 (ListLongMap!360 lt!3031))))

(declare-fun lt!3030 () Unit!253)

(declare-fun lt!3029 () Unit!253)

(assert (=> d!1545 (= lt!3030 lt!3029)))

(declare-datatypes ((Option!37 0))(
  ( (Some!36 (v!1351 B!392)) (None!35) )
))
(declare-fun getValueByKey!31 (List!339 (_ BitVec 64)) Option!37)

(assert (=> d!1545 (= (getValueByKey!31 lt!3031 (_1!189 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945)))) (Some!36 (_2!189 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!15 (List!339 (_ BitVec 64) B!392) Unit!253)

(assert (=> d!1545 (= lt!3029 (lemmaContainsTupThenGetReturnValue!15 lt!3031 (_1!189 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945))) (_2!189 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945)))))))

(declare-fun insertStrictlySorted!15 (List!339 (_ BitVec 64) B!392) List!339)

(assert (=> d!1545 (= lt!3031 (insertStrictlySorted!15 (toList!195 lm!227) (_1!189 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945))) (_2!189 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945)))))))

(assert (=> d!1545 (= (+!29 lm!227 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945))) lt!3032)))

(declare-fun b!11625 () Bool)

(declare-fun res!9658 () Bool)

(assert (=> b!11625 (=> (not res!9658) (not e!6891))))

(assert (=> b!11625 (= res!9658 (= (getValueByKey!31 (toList!195 lt!3032) (_1!189 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945)))) (Some!36 (_2!189 (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945))))))))

(declare-fun b!11626 () Bool)

(declare-fun contains!168 (List!339 tuple2!378) Bool)

(assert (=> b!11626 (= e!6891 (contains!168 (toList!195 lt!3032) (tuple2!379 (_1!189 lt!2945) (_2!189 lt!2945))))))

(assert (= (and d!1545 res!9659) b!11625))

(assert (= (and b!11625 res!9658) b!11626))

(declare-fun m!8067 () Bool)

(assert (=> d!1545 m!8067))

(declare-fun m!8069 () Bool)

(assert (=> d!1545 m!8069))

(declare-fun m!8071 () Bool)

(assert (=> d!1545 m!8071))

(declare-fun m!8073 () Bool)

(assert (=> d!1545 m!8073))

(declare-fun m!8075 () Bool)

(assert (=> b!11625 m!8075))

(declare-fun m!8077 () Bool)

(assert (=> b!11626 m!8077))

(assert (=> b!11486 d!1545))

(declare-fun d!1567 () Bool)

(assert (=> d!1567 (= (head!776 kvs!4) (h!901 kvs!4))))

(assert (=> b!11486 d!1567))

(declare-fun d!1571 () Bool)

(declare-fun e!6892 () Bool)

(assert (=> d!1571 e!6892))

(declare-fun res!9661 () Bool)

(assert (=> d!1571 (=> (not res!9661) (not e!6892))))

(declare-fun lt!3036 () ListLongMap!359)

(assert (=> d!1571 (= res!9661 (contains!166 lt!3036 (_1!189 lt!2945)))))

(declare-fun lt!3035 () List!339)

(assert (=> d!1571 (= lt!3036 (ListLongMap!360 lt!3035))))

(declare-fun lt!3034 () Unit!253)

(declare-fun lt!3033 () Unit!253)

(assert (=> d!1571 (= lt!3034 lt!3033)))

(assert (=> d!1571 (= (getValueByKey!31 lt!3035 (_1!189 lt!2945)) (Some!36 (_2!189 lt!2945)))))

(assert (=> d!1571 (= lt!3033 (lemmaContainsTupThenGetReturnValue!15 lt!3035 (_1!189 lt!2945) (_2!189 lt!2945)))))

(assert (=> d!1571 (= lt!3035 (insertStrictlySorted!15 (toList!195 lm!227) (_1!189 lt!2945) (_2!189 lt!2945)))))

(assert (=> d!1571 (= (+!29 lm!227 lt!2945) lt!3036)))

(declare-fun b!11627 () Bool)

(declare-fun res!9660 () Bool)

(assert (=> b!11627 (=> (not res!9660) (not e!6892))))

(assert (=> b!11627 (= res!9660 (= (getValueByKey!31 (toList!195 lt!3036) (_1!189 lt!2945)) (Some!36 (_2!189 lt!2945))))))

(declare-fun b!11628 () Bool)

(assert (=> b!11628 (= e!6892 (contains!168 (toList!195 lt!3036) lt!2945))))

(assert (= (and d!1571 res!9661) b!11627))

(assert (= (and b!11627 res!9660) b!11628))

(declare-fun m!8081 () Bool)

(assert (=> d!1571 m!8081))

(declare-fun m!8083 () Bool)

(assert (=> d!1571 m!8083))

(declare-fun m!8085 () Bool)

(assert (=> d!1571 m!8085))

(declare-fun m!8087 () Bool)

(assert (=> d!1571 m!8087))

(declare-fun m!8089 () Bool)

(assert (=> b!11627 m!8089))

(declare-fun m!8091 () Bool)

(assert (=> b!11628 m!8091))

(assert (=> b!11486 d!1571))

(declare-fun d!1573 () Bool)

(declare-fun res!9662 () Bool)

(declare-fun e!6893 () Bool)

(assert (=> d!1573 (=> res!9662 e!6893)))

(assert (=> d!1573 (= res!9662 ((_ is Nil!336) (toList!195 lm!227)))))

(assert (=> d!1573 (= (forall!62 (toList!195 lm!227) p!216) e!6893)))

(declare-fun b!11629 () Bool)

(declare-fun e!6894 () Bool)

(assert (=> b!11629 (= e!6893 e!6894)))

(declare-fun res!9663 () Bool)

(assert (=> b!11629 (=> (not res!9663) (not e!6894))))

(assert (=> b!11629 (= res!9663 (dynLambda!73 p!216 (h!901 (toList!195 lm!227))))))

(declare-fun b!11630 () Bool)

(assert (=> b!11630 (= e!6894 (forall!62 (t!2660 (toList!195 lm!227)) p!216))))

(assert (= (and d!1573 (not res!9662)) b!11629))

(assert (= (and b!11629 res!9663) b!11630))

(declare-fun b_lambda!743 () Bool)

(assert (=> (not b_lambda!743) (not b!11629)))

(declare-fun t!2700 () Bool)

(declare-fun tb!357 () Bool)

(assert (=> (and start!1554 (= p!216 p!216) t!2700) tb!357))

(declare-fun result!531 () Bool)

(assert (=> tb!357 (= result!531 true)))

(assert (=> b!11629 t!2700))

(declare-fun b_and!825 () Bool)

(assert (= b_and!815 (and (=> t!2700 result!531) b_and!825)))

(declare-fun m!8093 () Bool)

(assert (=> b!11629 m!8093))

(declare-fun m!8095 () Bool)

(assert (=> b!11630 m!8095))

(assert (=> start!1554 d!1573))

(declare-fun d!1575 () Bool)

(declare-fun isStrictlySorted!40 (List!339) Bool)

(assert (=> d!1575 (= (inv!566 lm!227) (isStrictlySorted!40 (toList!195 lm!227)))))

(declare-fun bs!440 () Bool)

(assert (= bs!440 d!1575))

(declare-fun m!8097 () Bool)

(assert (=> bs!440 m!8097))

(assert (=> start!1554 d!1575))

(declare-fun d!1577 () Bool)

(declare-fun res!9667 () Bool)

(declare-fun e!6901 () Bool)

(assert (=> d!1577 (=> res!9667 e!6901)))

(assert (=> d!1577 (= res!9667 ((_ is Nil!336) kvs!4))))

(assert (=> d!1577 (= (forall!62 kvs!4 p!216) e!6901)))

(declare-fun b!11640 () Bool)

(declare-fun e!6902 () Bool)

(assert (=> b!11640 (= e!6901 e!6902)))

(declare-fun res!9668 () Bool)

(assert (=> b!11640 (=> (not res!9668) (not e!6902))))

(assert (=> b!11640 (= res!9668 (dynLambda!73 p!216 (h!901 kvs!4)))))

(declare-fun b!11641 () Bool)

(assert (=> b!11641 (= e!6902 (forall!62 (t!2660 kvs!4) p!216))))

(assert (= (and d!1577 (not res!9667)) b!11640))

(assert (= (and b!11640 res!9668) b!11641))

(declare-fun b_lambda!745 () Bool)

(assert (=> (not b_lambda!745) (not b!11640)))

(declare-fun t!2702 () Bool)

(declare-fun tb!359 () Bool)

(assert (=> (and start!1554 (= p!216 p!216) t!2702) tb!359))

(declare-fun result!533 () Bool)

(assert (=> tb!359 (= result!533 true)))

(assert (=> b!11640 t!2702))

(declare-fun b_and!827 () Bool)

(assert (= b_and!825 (and (=> t!2702 result!533) b_and!827)))

(declare-fun m!8105 () Bool)

(assert (=> b!11640 m!8105))

(declare-fun m!8107 () Bool)

(assert (=> b!11641 m!8107))

(assert (=> b!11483 d!1577))

(declare-fun d!1583 () Bool)

(assert (=> d!1583 (= (isEmpty!69 kvs!4) ((_ is Nil!336) kvs!4))))

(assert (=> b!11484 d!1583))

(declare-fun b!11654 () Bool)

(declare-fun e!6911 () Bool)

(declare-fun tp!1921 () Bool)

(assert (=> b!11654 (= e!6911 (and tp_is_empty!565 tp!1921))))

(assert (=> b!11485 (= tp!1898 e!6911)))

(assert (= (and b!11485 ((_ is Cons!335) (toList!195 lm!227))) b!11654))

(declare-fun b!11656 () Bool)

(declare-fun e!6913 () Bool)

(declare-fun tp!1923 () Bool)

(assert (=> b!11656 (= e!6913 (and tp_is_empty!565 tp!1923))))

(assert (=> b!11489 (= tp!1897 e!6913)))

(assert (= (and b!11489 ((_ is Cons!335) (t!2660 kvs!4))) b!11656))

(declare-fun b_lambda!751 () Bool)

(assert (= b_lambda!731 (or (and start!1554 b_free!451) b_lambda!751)))

(declare-fun b_lambda!755 () Bool)

(assert (= b_lambda!745 (or (and start!1554 b_free!451) b_lambda!755)))

(declare-fun b_lambda!759 () Bool)

(assert (= b_lambda!733 (or (and start!1554 b_free!451) b_lambda!759)))

(declare-fun b_lambda!763 () Bool)

(assert (= b_lambda!711 (or (and start!1554 b_free!451) b_lambda!763)))

(declare-fun b_lambda!767 () Bool)

(assert (= b_lambda!743 (or (and start!1554 b_free!451) b_lambda!767)))

(declare-fun b_lambda!771 () Bool)

(assert (= b_lambda!727 (or (and start!1554 b_free!451) b_lambda!771)))

(declare-fun b_lambda!775 () Bool)

(assert (= b_lambda!709 (or (and start!1554 b_free!451) b_lambda!775)))

(declare-fun b_lambda!779 () Bool)

(assert (= b_lambda!707 (or (and start!1554 b_free!451) b_lambda!779)))

(check-sat (not d!1575) (not b!11654) (not b!11625) (not b_lambda!763) (not b!11559) (not b!11578) (not b!11594) (not d!1545) (not b!11541) b_and!827 (not b_lambda!755) (not b_lambda!779) (not d!1571) (not b!11537) (not b!11630) (not b!11627) (not b!11596) (not b_lambda!771) (not b_next!451) (not b!11557) (not b_lambda!775) (not b!11641) (not b_lambda!751) (not b!11656) (not d!1527) (not b_lambda!767) (not b!11626) (not b!11539) (not d!1509) (not b!11628) (not b_lambda!759) tp_is_empty!565)
(check-sat b_and!827 (not b_next!451))
