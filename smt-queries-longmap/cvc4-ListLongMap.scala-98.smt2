; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1558 () Bool)

(assert start!1558)

(declare-fun b_free!455 () Bool)

(declare-fun b_next!455 () Bool)

(assert (=> start!1558 (= b_free!455 (not b_next!455))))

(declare-fun tp!1915 () Bool)

(declare-fun b_and!787 () Bool)

(assert (=> start!1558 (= tp!1915 b_and!787)))

(declare-fun b!11525 () Bool)

(declare-fun res!9581 () Bool)

(declare-fun e!6817 () Bool)

(assert (=> b!11525 (=> (not res!9581) (not e!6817))))

(declare-datatypes ((B!396 0))(
  ( (B!397 (val!293 Int)) )
))
(declare-datatypes ((tuple2!386 0))(
  ( (tuple2!387 (_1!193 (_ BitVec 64)) (_2!193 B!396)) )
))
(declare-datatypes ((List!345 0))(
  ( (Nil!342) (Cons!341 (h!907 tuple2!386) (t!2666 List!345)) )
))
(declare-fun kvs!4 () List!345)

(declare-fun isEmpty!71 (List!345) Bool)

(assert (=> b!11525 (= res!9581 (not (isEmpty!71 kvs!4)))))

(declare-fun b!11526 () Bool)

(declare-fun e!6815 () Bool)

(declare-fun tp_is_empty!569 () Bool)

(declare-fun tp!1914 () Bool)

(assert (=> b!11526 (= e!6815 (and tp_is_empty!569 tp!1914))))

(declare-fun b!11527 () Bool)

(declare-fun res!9580 () Bool)

(declare-fun e!6816 () Bool)

(assert (=> b!11527 (=> res!9580 e!6816)))

(declare-fun lt!2972 () List!345)

(declare-fun p!216 () Int)

(declare-fun forall!64 (List!345 Int) Bool)

(assert (=> b!11527 (= res!9580 (not (forall!64 lt!2972 p!216)))))

(declare-fun b!11528 () Bool)

(assert (=> b!11528 (= e!6817 (not e!6816))))

(declare-fun res!9582 () Bool)

(assert (=> b!11528 (=> res!9582 e!6816)))

(declare-datatypes ((ListLongMap!367 0))(
  ( (ListLongMap!368 (toList!199 List!345)) )
))
(declare-fun lt!2975 () ListLongMap!367)

(assert (=> b!11528 (= res!9582 (not (forall!64 (toList!199 lt!2975) p!216)))))

(declare-fun tail!58 (List!345) List!345)

(assert (=> b!11528 (= lt!2972 (tail!58 kvs!4))))

(declare-fun lm!227 () ListLongMap!367)

(declare-fun lt!2973 () tuple2!386)

(declare-fun +!31 (ListLongMap!367 tuple2!386) ListLongMap!367)

(assert (=> b!11528 (= lt!2975 (+!31 lm!227 lt!2973))))

(assert (=> b!11528 (forall!64 (toList!199 (+!31 lm!227 (tuple2!387 (_1!193 lt!2973) (_2!193 lt!2973)))) p!216)))

(declare-datatypes ((Unit!247 0))(
  ( (Unit!248) )
))
(declare-fun lt!2976 () Unit!247)

(declare-fun addValidProp!19 (ListLongMap!367 Int (_ BitVec 64) B!396) Unit!247)

(assert (=> b!11528 (= lt!2976 (addValidProp!19 lm!227 p!216 (_1!193 lt!2973) (_2!193 lt!2973)))))

(declare-fun head!778 (List!345) tuple2!386)

(assert (=> b!11528 (= lt!2973 (head!778 kvs!4))))

(declare-fun b!11529 () Bool)

(declare-fun e!6818 () Bool)

(declare-fun tp!1916 () Bool)

(assert (=> b!11529 (= e!6818 tp!1916)))

(declare-fun b!11530 () Bool)

(declare-fun res!9579 () Bool)

(assert (=> b!11530 (=> (not res!9579) (not e!6817))))

(assert (=> b!11530 (= res!9579 (forall!64 kvs!4 p!216))))

(declare-fun b!11531 () Bool)

(declare-fun ++!6 (ListLongMap!367 List!345) ListLongMap!367)

(assert (=> b!11531 (= e!6816 (forall!64 (toList!199 (++!6 lm!227 kvs!4)) p!216))))

(assert (=> b!11531 (forall!64 (toList!199 (++!6 lt!2975 lt!2972)) p!216)))

(declare-fun lt!2974 () Unit!247)

(declare-fun insertAllValidProp!4 (ListLongMap!367 List!345 Int) Unit!247)

(assert (=> b!11531 (= lt!2974 (insertAllValidProp!4 lt!2975 lt!2972 p!216))))

(declare-fun res!9583 () Bool)

(assert (=> start!1558 (=> (not res!9583) (not e!6817))))

(assert (=> start!1558 (= res!9583 (forall!64 (toList!199 lm!227) p!216))))

(assert (=> start!1558 e!6817))

(declare-fun inv!568 (ListLongMap!367) Bool)

(assert (=> start!1558 (and (inv!568 lm!227) e!6818)))

(assert (=> start!1558 tp!1915))

(assert (=> start!1558 e!6815))

(assert (= (and start!1558 res!9583) b!11530))

(assert (= (and b!11530 res!9579) b!11525))

(assert (= (and b!11525 res!9581) b!11528))

(assert (= (and b!11528 (not res!9582)) b!11527))

(assert (= (and b!11527 (not res!9580)) b!11531))

(assert (= start!1558 b!11529))

(assert (= (and start!1558 (is-Cons!341 kvs!4)) b!11526))

(declare-fun m!7897 () Bool)

(assert (=> b!11531 m!7897))

(declare-fun m!7899 () Bool)

(assert (=> b!11531 m!7899))

(declare-fun m!7901 () Bool)

(assert (=> b!11531 m!7901))

(declare-fun m!7903 () Bool)

(assert (=> b!11531 m!7903))

(declare-fun m!7905 () Bool)

(assert (=> b!11531 m!7905))

(declare-fun m!7907 () Bool)

(assert (=> b!11525 m!7907))

(declare-fun m!7909 () Bool)

(assert (=> start!1558 m!7909))

(declare-fun m!7911 () Bool)

(assert (=> start!1558 m!7911))

(declare-fun m!7913 () Bool)

(assert (=> b!11527 m!7913))

(declare-fun m!7915 () Bool)

(assert (=> b!11528 m!7915))

(declare-fun m!7917 () Bool)

(assert (=> b!11528 m!7917))

(declare-fun m!7919 () Bool)

(assert (=> b!11528 m!7919))

(declare-fun m!7921 () Bool)

(assert (=> b!11528 m!7921))

(declare-fun m!7923 () Bool)

(assert (=> b!11528 m!7923))

(declare-fun m!7925 () Bool)

(assert (=> b!11528 m!7925))

(declare-fun m!7927 () Bool)

(assert (=> b!11528 m!7927))

(declare-fun m!7929 () Bool)

(assert (=> b!11530 m!7929))

(push 1)

(assert (not b!11529))

(assert (not b!11525))

(assert (not b_next!455))

(assert (not start!1558))

(assert b_and!787)

(assert (not b!11531))

(assert (not b!11527))

(assert (not b!11528))

(assert (not b!11530))

(assert (not b!11526))

(assert tp_is_empty!569)

(check-sat)

(pop 1)

(push 1)

(assert b_and!787)

(assert (not b_next!455))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1493 () Bool)

(declare-fun c!968 () Bool)

(assert (=> d!1493 (= c!968 (is-Nil!342 kvs!4))))

(declare-fun e!6825 () ListLongMap!367)

(assert (=> d!1493 (= (++!6 lm!227 kvs!4) e!6825)))

(declare-fun b!11540 () Bool)

(assert (=> b!11540 (= e!6825 lm!227)))

(declare-fun b!11541 () Bool)

(assert (=> b!11541 (= e!6825 (++!6 (+!31 lm!227 (h!907 kvs!4)) (t!2666 kvs!4)))))

(assert (= (and d!1493 c!968) b!11540))

(assert (= (and d!1493 (not c!968)) b!11541))

(declare-fun m!7931 () Bool)

(assert (=> b!11541 m!7931))

(assert (=> b!11541 m!7931))

(declare-fun m!7933 () Bool)

(assert (=> b!11541 m!7933))

(assert (=> b!11531 d!1493))

(declare-fun d!1499 () Bool)

(assert (=> d!1499 (forall!64 (toList!199 (++!6 lt!2975 lt!2972)) p!216)))

(declare-fun lt!2979 () Unit!247)

(declare-fun choose!159 (ListLongMap!367 List!345 Int) Unit!247)

(assert (=> d!1499 (= lt!2979 (choose!159 lt!2975 lt!2972 p!216))))

(declare-fun e!6840 () Bool)

(assert (=> d!1499 e!6840))

(declare-fun res!9602 () Bool)

(assert (=> d!1499 (=> (not res!9602) (not e!6840))))

(assert (=> d!1499 (= res!9602 (forall!64 (toList!199 lt!2975) p!216))))

(assert (=> d!1499 (= (insertAllValidProp!4 lt!2975 lt!2972 p!216) lt!2979)))

(declare-fun b!11556 () Bool)

(assert (=> b!11556 (= e!6840 (forall!64 lt!2972 p!216))))

(assert (= (and d!1499 res!9602) b!11556))

(assert (=> d!1499 m!7899))

(assert (=> d!1499 m!7897))

(declare-fun m!7951 () Bool)

(assert (=> d!1499 m!7951))

(assert (=> d!1499 m!7921))

(assert (=> b!11556 m!7913))

(assert (=> b!11531 d!1499))

(declare-fun d!1513 () Bool)

(declare-fun res!9607 () Bool)

(declare-fun e!6845 () Bool)

(assert (=> d!1513 (=> res!9607 e!6845)))

(assert (=> d!1513 (= res!9607 (is-Nil!342 (toList!199 (++!6 lm!227 kvs!4))))))

(assert (=> d!1513 (= (forall!64 (toList!199 (++!6 lm!227 kvs!4)) p!216) e!6845)))

(declare-fun b!11561 () Bool)

(declare-fun e!6846 () Bool)

(assert (=> b!11561 (= e!6845 e!6846)))

(declare-fun res!9608 () Bool)

(assert (=> b!11561 (=> (not res!9608) (not e!6846))))

(declare-fun dynLambda!75 (Int tuple2!386) Bool)

(assert (=> b!11561 (= res!9608 (dynLambda!75 p!216 (h!907 (toList!199 (++!6 lm!227 kvs!4)))))))

(declare-fun b!11562 () Bool)

(assert (=> b!11562 (= e!6846 (forall!64 (t!2666 (toList!199 (++!6 lm!227 kvs!4))) p!216))))

(assert (= (and d!1513 (not res!9607)) b!11561))

(assert (= (and b!11561 res!9608) b!11562))

(declare-fun b_lambda!715 () Bool)

(assert (=> (not b_lambda!715) (not b!11561)))

(declare-fun t!2676 () Bool)

(declare-fun tb!329 () Bool)

(assert (=> (and start!1558 (= p!216 p!216) t!2676) tb!329))

(declare-fun result!503 () Bool)

(assert (=> tb!329 (= result!503 true)))

(assert (=> b!11561 t!2676))

(declare-fun b_and!797 () Bool)

(assert (= b_and!787 (and (=> t!2676 result!503) b_and!797)))

(declare-fun m!7953 () Bool)

(assert (=> b!11561 m!7953))

(declare-fun m!7955 () Bool)

(assert (=> b!11562 m!7955))

(assert (=> b!11531 d!1513))

(declare-fun d!1515 () Bool)

(declare-fun c!969 () Bool)

(assert (=> d!1515 (= c!969 (is-Nil!342 lt!2972))))

(declare-fun e!6851 () ListLongMap!367)

(assert (=> d!1515 (= (++!6 lt!2975 lt!2972) e!6851)))

(declare-fun b!11570 () Bool)

(assert (=> b!11570 (= e!6851 lt!2975)))

(declare-fun b!11571 () Bool)

(assert (=> b!11571 (= e!6851 (++!6 (+!31 lt!2975 (h!907 lt!2972)) (t!2666 lt!2972)))))

(assert (= (and d!1515 c!969) b!11570))

(assert (= (and d!1515 (not c!969)) b!11571))

(declare-fun m!7957 () Bool)

(assert (=> b!11571 m!7957))

(assert (=> b!11571 m!7957))

(declare-fun m!7959 () Bool)

(assert (=> b!11571 m!7959))

(assert (=> b!11531 d!1515))

(declare-fun d!1517 () Bool)

(declare-fun res!9615 () Bool)

(declare-fun e!6852 () Bool)

(assert (=> d!1517 (=> res!9615 e!6852)))

(assert (=> d!1517 (= res!9615 (is-Nil!342 (toList!199 (++!6 lt!2975 lt!2972))))))

(assert (=> d!1517 (= (forall!64 (toList!199 (++!6 lt!2975 lt!2972)) p!216) e!6852)))

(declare-fun b!11572 () Bool)

(declare-fun e!6853 () Bool)

(assert (=> b!11572 (= e!6852 e!6853)))

(declare-fun res!9616 () Bool)

(assert (=> b!11572 (=> (not res!9616) (not e!6853))))

(assert (=> b!11572 (= res!9616 (dynLambda!75 p!216 (h!907 (toList!199 (++!6 lt!2975 lt!2972)))))))

(declare-fun b!11573 () Bool)

(assert (=> b!11573 (= e!6853 (forall!64 (t!2666 (toList!199 (++!6 lt!2975 lt!2972))) p!216))))

(assert (= (and d!1517 (not res!9615)) b!11572))

(assert (= (and b!11572 res!9616) b!11573))

(declare-fun b_lambda!717 () Bool)

(assert (=> (not b_lambda!717) (not b!11572)))

(declare-fun t!2678 () Bool)

(declare-fun tb!331 () Bool)

(assert (=> (and start!1558 (= p!216 p!216) t!2678) tb!331))

(declare-fun result!505 () Bool)

(assert (=> tb!331 (= result!505 true)))

(assert (=> b!11572 t!2678))

(declare-fun b_and!799 () Bool)

(assert (= b_and!797 (and (=> t!2678 result!505) b_and!799)))

(declare-fun m!7961 () Bool)

(assert (=> b!11572 m!7961))

(declare-fun m!7963 () Bool)

(assert (=> b!11573 m!7963))

(assert (=> b!11531 d!1517))

(declare-fun d!1519 () Bool)

(declare-fun res!9618 () Bool)

(declare-fun e!6855 () Bool)

(assert (=> d!1519 (=> res!9618 e!6855)))

(assert (=> d!1519 (= res!9618 (is-Nil!342 (toList!199 lm!227)))))

(assert (=> d!1519 (= (forall!64 (toList!199 lm!227) p!216) e!6855)))

(declare-fun b!11575 () Bool)

(declare-fun e!6856 () Bool)

(assert (=> b!11575 (= e!6855 e!6856)))

(declare-fun res!9619 () Bool)

(assert (=> b!11575 (=> (not res!9619) (not e!6856))))

(assert (=> b!11575 (= res!9619 (dynLambda!75 p!216 (h!907 (toList!199 lm!227))))))

(declare-fun b!11576 () Bool)

(assert (=> b!11576 (= e!6856 (forall!64 (t!2666 (toList!199 lm!227)) p!216))))

(assert (= (and d!1519 (not res!9618)) b!11575))

(assert (= (and b!11575 res!9619) b!11576))

(declare-fun b_lambda!721 () Bool)

(assert (=> (not b_lambda!721) (not b!11575)))

(declare-fun t!2682 () Bool)

(declare-fun tb!335 () Bool)

(assert (=> (and start!1558 (= p!216 p!216) t!2682) tb!335))

(declare-fun result!509 () Bool)

(assert (=> tb!335 (= result!509 true)))

(assert (=> b!11575 t!2682))

(declare-fun b_and!803 () Bool)

(assert (= b_and!799 (and (=> t!2682 result!509) b_and!803)))

(declare-fun m!7971 () Bool)

(assert (=> b!11575 m!7971))

(declare-fun m!7975 () Bool)

(assert (=> b!11576 m!7975))

(assert (=> start!1558 d!1519))

(declare-fun d!1521 () Bool)

(declare-fun isStrictlySorted!45 (List!345) Bool)

(assert (=> d!1521 (= (inv!568 lm!227) (isStrictlySorted!45 (toList!199 lm!227)))))

(declare-fun bs!438 () Bool)

(assert (= bs!438 d!1521))

(declare-fun m!7989 () Bool)

(assert (=> bs!438 m!7989))

(assert (=> start!1558 d!1521))

(declare-fun d!1529 () Bool)

(declare-fun res!9624 () Bool)

(declare-fun e!6860 () Bool)

(assert (=> d!1529 (=> res!9624 e!6860)))

(assert (=> d!1529 (= res!9624 (is-Nil!342 kvs!4))))

(assert (=> d!1529 (= (forall!64 kvs!4 p!216) e!6860)))

(declare-fun b!11581 () Bool)

(declare-fun e!6861 () Bool)

(assert (=> b!11581 (= e!6860 e!6861)))

(declare-fun res!9625 () Bool)

(assert (=> b!11581 (=> (not res!9625) (not e!6861))))

(assert (=> b!11581 (= res!9625 (dynLambda!75 p!216 (h!907 kvs!4)))))

(declare-fun b!11582 () Bool)

(assert (=> b!11582 (= e!6861 (forall!64 (t!2666 kvs!4) p!216))))

(assert (= (and d!1529 (not res!9624)) b!11581))

(assert (= (and b!11581 res!9625) b!11582))

(declare-fun b_lambda!725 () Bool)

(assert (=> (not b_lambda!725) (not b!11581)))

(declare-fun t!2686 () Bool)

(declare-fun tb!339 () Bool)

(assert (=> (and start!1558 (= p!216 p!216) t!2686) tb!339))

(declare-fun result!513 () Bool)

(assert (=> tb!339 (= result!513 true)))

(assert (=> b!11581 t!2686))

(declare-fun b_and!807 () Bool)

(assert (= b_and!803 (and (=> t!2686 result!513) b_and!807)))

(declare-fun m!7991 () Bool)

(assert (=> b!11581 m!7991))

(declare-fun m!7993 () Bool)

(assert (=> b!11582 m!7993))

(assert (=> b!11530 d!1529))

(declare-fun d!1531 () Bool)

(assert (=> d!1531 (= (isEmpty!71 kvs!4) (is-Nil!342 kvs!4))))

(assert (=> b!11525 d!1531))

(declare-fun d!1533 () Bool)

(declare-fun res!9626 () Bool)

(declare-fun e!6862 () Bool)

(assert (=> d!1533 (=> res!9626 e!6862)))

(assert (=> d!1533 (= res!9626 (is-Nil!342 lt!2972))))

(assert (=> d!1533 (= (forall!64 lt!2972 p!216) e!6862)))

(declare-fun b!11583 () Bool)

(declare-fun e!6863 () Bool)

(assert (=> b!11583 (= e!6862 e!6863)))

(declare-fun res!9627 () Bool)

(assert (=> b!11583 (=> (not res!9627) (not e!6863))))

(assert (=> b!11583 (= res!9627 (dynLambda!75 p!216 (h!907 lt!2972)))))

(declare-fun b!11584 () Bool)

(assert (=> b!11584 (= e!6863 (forall!64 (t!2666 lt!2972) p!216))))

(assert (= (and d!1533 (not res!9626)) b!11583))

(assert (= (and b!11583 res!9627) b!11584))

(declare-fun b_lambda!727 () Bool)

(assert (=> (not b_lambda!727) (not b!11583)))

(declare-fun t!2688 () Bool)

(declare-fun tb!341 () Bool)

(assert (=> (and start!1558 (= p!216 p!216) t!2688) tb!341))

(declare-fun result!515 () Bool)

(assert (=> tb!341 (= result!515 true)))

(assert (=> b!11583 t!2688))

(declare-fun b_and!809 () Bool)

(assert (= b_and!807 (and (=> t!2688 result!515) b_and!809)))

(declare-fun m!7995 () Bool)

(assert (=> b!11583 m!7995))

(declare-fun m!7997 () Bool)

(assert (=> b!11584 m!7997))

(assert (=> b!11527 d!1533))

(declare-fun d!1535 () Bool)

(assert (=> d!1535 (= (tail!58 kvs!4) (t!2666 kvs!4))))

(assert (=> b!11528 d!1535))

(declare-fun d!1537 () Bool)

(declare-fun e!6880 () Bool)

(assert (=> d!1537 e!6880))

(declare-fun res!9651 () Bool)

(assert (=> d!1537 (=> (not res!9651) (not e!6880))))

(declare-fun lt!3029 () ListLongMap!367)

(declare-fun contains!169 (ListLongMap!367 (_ BitVec 64)) Bool)

(assert (=> d!1537 (= res!9651 (contains!169 lt!3029 (_1!193 lt!2973)))))

(declare-fun lt!3027 () List!345)

(assert (=> d!1537 (= lt!3029 (ListLongMap!368 lt!3027))))

(declare-fun lt!3028 () Unit!247)

(declare-fun lt!3026 () Unit!247)

(assert (=> d!1537 (= lt!3028 lt!3026)))

(declare-datatypes ((Option!37 0))(
  ( (Some!36 (v!1351 B!396)) (None!35) )
))
(declare-fun getValueByKey!31 (List!345 (_ BitVec 64)) Option!37)

(assert (=> d!1537 (= (getValueByKey!31 lt!3027 (_1!193 lt!2973)) (Some!36 (_2!193 lt!2973)))))

(declare-fun lemmaContainsTupThenGetReturnValue!15 (List!345 (_ BitVec 64) B!396) Unit!247)

(assert (=> d!1537 (= lt!3026 (lemmaContainsTupThenGetReturnValue!15 lt!3027 (_1!193 lt!2973) (_2!193 lt!2973)))))

(declare-fun insertStrictlySorted!15 (List!345 (_ BitVec 64) B!396) List!345)

(assert (=> d!1537 (= lt!3027 (insertStrictlySorted!15 (toList!199 lm!227) (_1!193 lt!2973) (_2!193 lt!2973)))))

(assert (=> d!1537 (= (+!31 lm!227 lt!2973) lt!3029)))

(declare-fun b!11609 () Bool)

(declare-fun res!9652 () Bool)

(assert (=> b!11609 (=> (not res!9652) (not e!6880))))

(assert (=> b!11609 (= res!9652 (= (getValueByKey!31 (toList!199 lt!3029) (_1!193 lt!2973)) (Some!36 (_2!193 lt!2973))))))

(declare-fun b!11610 () Bool)

(declare-fun contains!170 (List!345 tuple2!386) Bool)

(assert (=> b!11610 (= e!6880 (contains!170 (toList!199 lt!3029) lt!2973))))

(assert (= (and d!1537 res!9651) b!11609))

(assert (= (and b!11609 res!9652) b!11610))

(declare-fun m!8053 () Bool)

(assert (=> d!1537 m!8053))

(declare-fun m!8055 () Bool)

(assert (=> d!1537 m!8055))

(declare-fun m!8057 () Bool)

(assert (=> d!1537 m!8057))

(declare-fun m!8059 () Bool)

(assert (=> d!1537 m!8059))

(declare-fun m!8061 () Bool)

(assert (=> b!11609 m!8061))

(declare-fun m!8063 () Bool)

(assert (=> b!11610 m!8063))

(assert (=> b!11528 d!1537))

(declare-fun d!1561 () Bool)

(declare-fun res!9653 () Bool)

(declare-fun e!6881 () Bool)

(assert (=> d!1561 (=> res!9653 e!6881)))

(assert (=> d!1561 (= res!9653 (is-Nil!342 (toList!199 (+!31 lm!227 (tuple2!387 (_1!193 lt!2973) (_2!193 lt!2973))))))))

(assert (=> d!1561 (= (forall!64 (toList!199 (+!31 lm!227 (tuple2!387 (_1!193 lt!2973) (_2!193 lt!2973)))) p!216) e!6881)))

(declare-fun b!11611 () Bool)

(declare-fun e!6882 () Bool)

(assert (=> b!11611 (= e!6881 e!6882)))

(declare-fun res!9654 () Bool)

(assert (=> b!11611 (=> (not res!9654) (not e!6882))))

(assert (=> b!11611 (= res!9654 (dynLambda!75 p!216 (h!907 (toList!199 (+!31 lm!227 (tuple2!387 (_1!193 lt!2973) (_2!193 lt!2973)))))))))

(declare-fun b!11612 () Bool)

(assert (=> b!11612 (= e!6882 (forall!64 (t!2666 (toList!199 (+!31 lm!227 (tuple2!387 (_1!193 lt!2973) (_2!193 lt!2973))))) p!216))))

(assert (= (and d!1561 (not res!9653)) b!11611))

(assert (= (and b!11611 res!9654) b!11612))

(declare-fun b_lambda!737 () Bool)

(assert (=> (not b_lambda!737) (not b!11611)))

(declare-fun t!2698 () Bool)

(declare-fun tb!351 () Bool)

(assert (=> (and start!1558 (= p!216 p!216) t!2698) tb!351))

(declare-fun result!525 () Bool)

(assert (=> tb!351 (= result!525 true)))

(assert (=> b!11611 t!2698))

(declare-fun b_and!819 () Bool)

(assert (= b_and!809 (and (=> t!2698 result!525) b_and!819)))

(declare-fun m!8067 () Bool)

(assert (=> b!11611 m!8067))

(declare-fun m!8069 () Bool)

(assert (=> b!11612 m!8069))

(assert (=> b!11528 d!1561))

(declare-fun d!1565 () Bool)

(assert (=> d!1565 (= (head!778 kvs!4) (h!907 kvs!4))))

(assert (=> b!11528 d!1565))

(declare-fun d!1567 () Bool)

(declare-fun e!6888 () Bool)

(assert (=> d!1567 e!6888))

(declare-fun res!9657 () Bool)

(assert (=> d!1567 (=> (not res!9657) (not e!6888))))

(declare-fun lt!3033 () ListLongMap!367)

(assert (=> d!1567 (= res!9657 (contains!169 lt!3033 (_1!193 (tuple2!387 (_1!193 lt!2973) (_2!193 lt!2973)))))))

(declare-fun lt!3031 () List!345)

(assert (=> d!1567 (= lt!3033 (ListLongMap!368 lt!3031))))

(declare-fun lt!3032 () Unit!247)

(declare-fun lt!3030 () Unit!247)

(assert (=> d!1567 (= lt!3032 lt!3030)))

(assert (=> d!1567 (= (getValueByKey!31 lt!3031 (_1!193 (tuple2!387 (_1!193 lt!2973) (_2!193 lt!2973)))) (Some!36 (_2!193 (tuple2!387 (_1!193 lt!2973) (_2!193 lt!2973)))))))

(assert (=> d!1567 (= lt!3030 (lemmaContainsTupThenGetReturnValue!15 lt!3031 (_1!193 (tuple2!387 (_1!193 lt!2973) (_2!193 lt!2973))) (_2!193 (tuple2!387 (_1!193 lt!2973) (_2!193 lt!2973)))))))

(assert (=> d!1567 (= lt!3031 (insertStrictlySorted!15 (toList!199 lm!227) (_1!193 (tuple2!387 (_1!193 lt!2973) (_2!193 lt!2973))) (_2!193 (tuple2!387 (_1!193 lt!2973) (_2!193 lt!2973)))))))

(assert (=> d!1567 (= (+!31 lm!227 (tuple2!387 (_1!193 lt!2973) (_2!193 lt!2973))) lt!3033)))

(declare-fun b!11621 () Bool)

(declare-fun res!9658 () Bool)

(assert (=> b!11621 (=> (not res!9658) (not e!6888))))

(assert (=> b!11621 (= res!9658 (= (getValueByKey!31 (toList!199 lt!3033) (_1!193 (tuple2!387 (_1!193 lt!2973) (_2!193 lt!2973)))) (Some!36 (_2!193 (tuple2!387 (_1!193 lt!2973) (_2!193 lt!2973))))))))

(declare-fun b!11622 () Bool)

(assert (=> b!11622 (= e!6888 (contains!170 (toList!199 lt!3033) (tuple2!387 (_1!193 lt!2973) (_2!193 lt!2973))))))

