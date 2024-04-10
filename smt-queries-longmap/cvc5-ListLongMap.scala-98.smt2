; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1554 () Bool)

(assert start!1554)

(declare-fun b_free!451 () Bool)

(declare-fun b_next!451 () Bool)

(assert (=> start!1554 (= b_free!451 (not b_next!451))))

(declare-fun tp!1897 () Bool)

(declare-fun b_and!783 () Bool)

(assert (=> start!1554 (= tp!1897 b_and!783)))

(declare-fun b!11483 () Bool)

(declare-fun e!6792 () Bool)

(declare-fun tp_is_empty!565 () Bool)

(declare-fun tp!1898 () Bool)

(assert (=> b!11483 (= e!6792 (and tp_is_empty!565 tp!1898))))

(declare-fun b!11484 () Bool)

(declare-fun e!6794 () Bool)

(declare-fun e!6791 () Bool)

(assert (=> b!11484 (= e!6794 (not e!6791))))

(declare-fun res!9549 () Bool)

(assert (=> b!11484 (=> res!9549 e!6791)))

(declare-datatypes ((B!392 0))(
  ( (B!393 (val!291 Int)) )
))
(declare-datatypes ((tuple2!382 0))(
  ( (tuple2!383 (_1!191 (_ BitVec 64)) (_2!191 B!392)) )
))
(declare-datatypes ((List!343 0))(
  ( (Nil!340) (Cons!339 (h!905 tuple2!382) (t!2664 List!343)) )
))
(declare-datatypes ((ListLongMap!363 0))(
  ( (ListLongMap!364 (toList!197 List!343)) )
))
(declare-fun lt!2945 () ListLongMap!363)

(declare-fun p!216 () Int)

(declare-fun forall!62 (List!343 Int) Bool)

(assert (=> b!11484 (= res!9549 (not (forall!62 (toList!197 lt!2945) p!216)))))

(declare-fun lt!2946 () List!343)

(declare-fun kvs!4 () List!343)

(declare-fun tail!56 (List!343) List!343)

(assert (=> b!11484 (= lt!2946 (tail!56 kvs!4))))

(declare-fun lm!227 () ListLongMap!363)

(declare-fun lt!2942 () tuple2!382)

(declare-fun +!29 (ListLongMap!363 tuple2!382) ListLongMap!363)

(assert (=> b!11484 (= lt!2945 (+!29 lm!227 lt!2942))))

(assert (=> b!11484 (forall!62 (toList!197 (+!29 lm!227 (tuple2!383 (_1!191 lt!2942) (_2!191 lt!2942)))) p!216)))

(declare-datatypes ((Unit!243 0))(
  ( (Unit!244) )
))
(declare-fun lt!2944 () Unit!243)

(declare-fun addValidProp!17 (ListLongMap!363 Int (_ BitVec 64) B!392) Unit!243)

(assert (=> b!11484 (= lt!2944 (addValidProp!17 lm!227 p!216 (_1!191 lt!2942) (_2!191 lt!2942)))))

(declare-fun head!776 (List!343) tuple2!382)

(assert (=> b!11484 (= lt!2942 (head!776 kvs!4))))

(declare-fun b!11485 () Bool)

(declare-fun res!9550 () Bool)

(assert (=> b!11485 (=> res!9550 e!6791)))

(assert (=> b!11485 (= res!9550 (not (forall!62 lt!2946 p!216)))))

(declare-fun res!9552 () Bool)

(assert (=> start!1554 (=> (not res!9552) (not e!6794))))

(assert (=> start!1554 (= res!9552 (forall!62 (toList!197 lm!227) p!216))))

(assert (=> start!1554 e!6794))

(declare-fun e!6793 () Bool)

(declare-fun inv!566 (ListLongMap!363) Bool)

(assert (=> start!1554 (and (inv!566 lm!227) e!6793)))

(assert (=> start!1554 tp!1897))

(assert (=> start!1554 e!6792))

(declare-fun b!11486 () Bool)

(declare-fun tp!1896 () Bool)

(assert (=> b!11486 (= e!6793 tp!1896)))

(declare-fun b!11487 () Bool)

(declare-fun ++!4 (ListLongMap!363 List!343) ListLongMap!363)

(assert (=> b!11487 (= e!6791 (forall!62 (toList!197 (++!4 lm!227 kvs!4)) p!216))))

(assert (=> b!11487 (forall!62 (toList!197 (++!4 lt!2945 lt!2946)) p!216)))

(declare-fun lt!2943 () Unit!243)

(declare-fun insertAllValidProp!2 (ListLongMap!363 List!343 Int) Unit!243)

(assert (=> b!11487 (= lt!2943 (insertAllValidProp!2 lt!2945 lt!2946 p!216))))

(declare-fun b!11488 () Bool)

(declare-fun res!9551 () Bool)

(assert (=> b!11488 (=> (not res!9551) (not e!6794))))

(assert (=> b!11488 (= res!9551 (forall!62 kvs!4 p!216))))

(declare-fun b!11489 () Bool)

(declare-fun res!9553 () Bool)

(assert (=> b!11489 (=> (not res!9553) (not e!6794))))

(declare-fun isEmpty!69 (List!343) Bool)

(assert (=> b!11489 (= res!9553 (not (isEmpty!69 kvs!4)))))

(assert (= (and start!1554 res!9552) b!11488))

(assert (= (and b!11488 res!9551) b!11489))

(assert (= (and b!11489 res!9553) b!11484))

(assert (= (and b!11484 (not res!9549)) b!11485))

(assert (= (and b!11485 (not res!9550)) b!11487))

(assert (= start!1554 b!11486))

(assert (= (and start!1554 (is-Cons!339 kvs!4)) b!11483))

(declare-fun m!7829 () Bool)

(assert (=> b!11488 m!7829))

(declare-fun m!7831 () Bool)

(assert (=> start!1554 m!7831))

(declare-fun m!7833 () Bool)

(assert (=> start!1554 m!7833))

(declare-fun m!7835 () Bool)

(assert (=> b!11487 m!7835))

(declare-fun m!7837 () Bool)

(assert (=> b!11487 m!7837))

(declare-fun m!7839 () Bool)

(assert (=> b!11487 m!7839))

(declare-fun m!7841 () Bool)

(assert (=> b!11487 m!7841))

(declare-fun m!7843 () Bool)

(assert (=> b!11487 m!7843))

(declare-fun m!7845 () Bool)

(assert (=> b!11485 m!7845))

(declare-fun m!7847 () Bool)

(assert (=> b!11484 m!7847))

(declare-fun m!7849 () Bool)

(assert (=> b!11484 m!7849))

(declare-fun m!7851 () Bool)

(assert (=> b!11484 m!7851))

(declare-fun m!7853 () Bool)

(assert (=> b!11484 m!7853))

(declare-fun m!7855 () Bool)

(assert (=> b!11484 m!7855))

(declare-fun m!7857 () Bool)

(assert (=> b!11484 m!7857))

(declare-fun m!7859 () Bool)

(assert (=> b!11484 m!7859))

(declare-fun m!7861 () Bool)

(assert (=> b!11489 m!7861))

(push 1)

(assert (not b!11486))

(assert (not b!11487))

(assert (not start!1554))

(assert (not b!11483))

(assert (not b!11488))

(assert b_and!783)

(assert (not b!11485))

(assert (not b!11489))

(assert tp_is_empty!565)

(assert (not b!11484))

(assert (not b_next!451))

(check-sat)

(pop 1)

(push 1)

(assert b_and!783)

(assert (not b_next!451))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1497 () Bool)

(declare-fun res!9596 () Bool)

(declare-fun e!6834 () Bool)

(assert (=> d!1497 (=> res!9596 e!6834)))

(assert (=> d!1497 (= res!9596 (is-Nil!340 lt!2946))))

(assert (=> d!1497 (= (forall!62 lt!2946 p!216) e!6834)))

(declare-fun b!11550 () Bool)

(declare-fun e!6835 () Bool)

(assert (=> b!11550 (= e!6834 e!6835)))

(declare-fun res!9597 () Bool)

(assert (=> b!11550 (=> (not res!9597) (not e!6835))))

(declare-fun dynLambda!74 (Int tuple2!382) Bool)

(assert (=> b!11550 (= res!9597 (dynLambda!74 p!216 (h!905 lt!2946)))))

(declare-fun b!11551 () Bool)

(assert (=> b!11551 (= e!6835 (forall!62 (t!2664 lt!2946) p!216))))

(assert (= (and d!1497 (not res!9596)) b!11550))

(assert (= (and b!11550 res!9597) b!11551))

(declare-fun b_lambda!711 () Bool)

(assert (=> (not b_lambda!711) (not b!11550)))

(declare-fun t!2672 () Bool)

(declare-fun tb!325 () Bool)

(assert (=> (and start!1554 (= p!216 p!216) t!2672) tb!325))

(declare-fun result!499 () Bool)

(assert (=> tb!325 (= result!499 true)))

(assert (=> b!11550 t!2672))

(declare-fun b_and!793 () Bool)

(assert (= b_and!783 (and (=> t!2672 result!499) b_and!793)))

(declare-fun m!7943 () Bool)

(assert (=> b!11550 m!7943))

(declare-fun m!7945 () Bool)

(assert (=> b!11551 m!7945))

(assert (=> b!11485 d!1497))

(declare-fun d!1507 () Bool)

(declare-fun res!9598 () Bool)

(declare-fun e!6836 () Bool)

(assert (=> d!1507 (=> res!9598 e!6836)))

(assert (=> d!1507 (= res!9598 (is-Nil!340 (toList!197 (+!29 lm!227 (tuple2!383 (_1!191 lt!2942) (_2!191 lt!2942))))))))

(assert (=> d!1507 (= (forall!62 (toList!197 (+!29 lm!227 (tuple2!383 (_1!191 lt!2942) (_2!191 lt!2942)))) p!216) e!6836)))

(declare-fun b!11552 () Bool)

(declare-fun e!6837 () Bool)

(assert (=> b!11552 (= e!6836 e!6837)))

(declare-fun res!9599 () Bool)

(assert (=> b!11552 (=> (not res!9599) (not e!6837))))

(assert (=> b!11552 (= res!9599 (dynLambda!74 p!216 (h!905 (toList!197 (+!29 lm!227 (tuple2!383 (_1!191 lt!2942) (_2!191 lt!2942)))))))))

(declare-fun b!11553 () Bool)

(assert (=> b!11553 (= e!6837 (forall!62 (t!2664 (toList!197 (+!29 lm!227 (tuple2!383 (_1!191 lt!2942) (_2!191 lt!2942))))) p!216))))

(assert (= (and d!1507 (not res!9598)) b!11552))

(assert (= (and b!11552 res!9599) b!11553))

(declare-fun b_lambda!713 () Bool)

(assert (=> (not b_lambda!713) (not b!11552)))

(declare-fun t!2674 () Bool)

(declare-fun tb!327 () Bool)

(assert (=> (and start!1554 (= p!216 p!216) t!2674) tb!327))

(declare-fun result!501 () Bool)

(assert (=> tb!327 (= result!501 true)))

(assert (=> b!11552 t!2674))

(declare-fun b_and!795 () Bool)

(assert (= b_and!793 (and (=> t!2674 result!501) b_and!795)))

(declare-fun m!7947 () Bool)

(assert (=> b!11552 m!7947))

(declare-fun m!7949 () Bool)

(assert (=> b!11553 m!7949))

(assert (=> b!11484 d!1507))

(declare-fun d!1509 () Bool)

(assert (=> d!1509 (= (tail!56 kvs!4) (t!2664 kvs!4))))

(assert (=> b!11484 d!1509))

(declare-fun d!1511 () Bool)

(assert (=> d!1511 (forall!62 (toList!197 (+!29 lm!227 (tuple2!383 (_1!191 lt!2942) (_2!191 lt!2942)))) p!216)))

(declare-fun lt!2990 () Unit!243)

(declare-fun choose!160 (ListLongMap!363 Int (_ BitVec 64) B!392) Unit!243)

(assert (=> d!1511 (= lt!2990 (choose!160 lm!227 p!216 (_1!191 lt!2942) (_2!191 lt!2942)))))

(declare-fun e!6854 () Bool)

(assert (=> d!1511 e!6854))

(declare-fun res!9617 () Bool)

(assert (=> d!1511 (=> (not res!9617) (not e!6854))))

(assert (=> d!1511 (= res!9617 (forall!62 (toList!197 lm!227) p!216))))

(assert (=> d!1511 (= (addValidProp!17 lm!227 p!216 (_1!191 lt!2942) (_2!191 lt!2942)) lt!2990)))

(declare-fun b!11574 () Bool)

(assert (=> b!11574 (= e!6854 (dynLambda!74 p!216 (tuple2!383 (_1!191 lt!2942) (_2!191 lt!2942))))))

(assert (= (and d!1511 res!9617) b!11574))

(declare-fun b_lambda!719 () Bool)

(assert (=> (not b_lambda!719) (not b!11574)))

(declare-fun t!2680 () Bool)

(declare-fun tb!333 () Bool)

(assert (=> (and start!1554 (= p!216 p!216) t!2680) tb!333))

(declare-fun result!507 () Bool)

(assert (=> tb!333 (= result!507 true)))

(assert (=> b!11574 t!2680))

(declare-fun b_and!801 () Bool)

(assert (= b_and!795 (and (=> t!2680 result!507) b_and!801)))

(assert (=> d!1511 m!7847))

(assert (=> d!1511 m!7857))

(declare-fun m!7969 () Bool)

(assert (=> d!1511 m!7969))

(assert (=> d!1511 m!7831))

(declare-fun m!7978 () Bool)

(assert (=> b!11574 m!7978))

(assert (=> b!11484 d!1511))

(declare-fun d!1523 () Bool)

(declare-fun res!9622 () Bool)

(declare-fun e!6858 () Bool)

(assert (=> d!1523 (=> res!9622 e!6858)))

(assert (=> d!1523 (= res!9622 (is-Nil!340 (toList!197 lt!2945)))))

(assert (=> d!1523 (= (forall!62 (toList!197 lt!2945) p!216) e!6858)))

(declare-fun b!11579 () Bool)

(declare-fun e!6859 () Bool)

(assert (=> b!11579 (= e!6858 e!6859)))

(declare-fun res!9623 () Bool)

(assert (=> b!11579 (=> (not res!9623) (not e!6859))))

(assert (=> b!11579 (= res!9623 (dynLambda!74 p!216 (h!905 (toList!197 lt!2945))))))

(declare-fun b!11580 () Bool)

(assert (=> b!11580 (= e!6859 (forall!62 (t!2664 (toList!197 lt!2945)) p!216))))

(assert (= (and d!1523 (not res!9622)) b!11579))

(assert (= (and b!11579 res!9623) b!11580))

(declare-fun b_lambda!723 () Bool)

(assert (=> (not b_lambda!723) (not b!11579)))

(declare-fun t!2684 () Bool)

(declare-fun tb!337 () Bool)

(assert (=> (and start!1554 (= p!216 p!216) t!2684) tb!337))

(declare-fun result!511 () Bool)

(assert (=> tb!337 (= result!511 true)))

(assert (=> b!11579 t!2684))

(declare-fun b_and!805 () Bool)

(assert (= b_and!801 (and (=> t!2684 result!511) b_and!805)))

(declare-fun m!7985 () Bool)

(assert (=> b!11579 m!7985))

(declare-fun m!7987 () Bool)

(assert (=> b!11580 m!7987))

(assert (=> b!11484 d!1523))

(declare-fun d!1527 () Bool)

(declare-fun e!6872 () Bool)

(assert (=> d!1527 e!6872))

(declare-fun res!9639 () Bool)

(assert (=> d!1527 (=> (not res!9639) (not e!6872))))

(declare-fun lt!3011 () ListLongMap!363)

(declare-fun contains!167 (ListLongMap!363 (_ BitVec 64)) Bool)

(assert (=> d!1527 (= res!9639 (contains!167 lt!3011 (_1!191 (tuple2!383 (_1!191 lt!2942) (_2!191 lt!2942)))))))

(declare-fun lt!3012 () List!343)

(assert (=> d!1527 (= lt!3011 (ListLongMap!364 lt!3012))))

(declare-fun lt!3010 () Unit!243)

(declare-fun lt!3013 () Unit!243)

(assert (=> d!1527 (= lt!3010 lt!3013)))

(declare-datatypes ((Option!36 0))(
  ( (Some!35 (v!1350 B!392)) (None!34) )
))
(declare-fun getValueByKey!30 (List!343 (_ BitVec 64)) Option!36)

(assert (=> d!1527 (= (getValueByKey!30 lt!3012 (_1!191 (tuple2!383 (_1!191 lt!2942) (_2!191 lt!2942)))) (Some!35 (_2!191 (tuple2!383 (_1!191 lt!2942) (_2!191 lt!2942)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!14 (List!343 (_ BitVec 64) B!392) Unit!243)

(assert (=> d!1527 (= lt!3013 (lemmaContainsTupThenGetReturnValue!14 lt!3012 (_1!191 (tuple2!383 (_1!191 lt!2942) (_2!191 lt!2942))) (_2!191 (tuple2!383 (_1!191 lt!2942) (_2!191 lt!2942)))))))

(declare-fun insertStrictlySorted!14 (List!343 (_ BitVec 64) B!392) List!343)

(assert (=> d!1527 (= lt!3012 (insertStrictlySorted!14 (toList!197 lm!227) (_1!191 (tuple2!383 (_1!191 lt!2942) (_2!191 lt!2942))) (_2!191 (tuple2!383 (_1!191 lt!2942) (_2!191 lt!2942)))))))

(assert (=> d!1527 (= (+!29 lm!227 (tuple2!383 (_1!191 lt!2942) (_2!191 lt!2942))) lt!3011)))

(declare-fun b!11597 () Bool)

(declare-fun res!9640 () Bool)

(assert (=> b!11597 (=> (not res!9640) (not e!6872))))

(assert (=> b!11597 (= res!9640 (= (getValueByKey!30 (toList!197 lt!3011) (_1!191 (tuple2!383 (_1!191 lt!2942) (_2!191 lt!2942)))) (Some!35 (_2!191 (tuple2!383 (_1!191 lt!2942) (_2!191 lt!2942))))))))

(declare-fun b!11598 () Bool)

(declare-fun contains!168 (List!343 tuple2!382) Bool)

(assert (=> b!11598 (= e!6872 (contains!168 (toList!197 lt!3011) (tuple2!383 (_1!191 lt!2942) (_2!191 lt!2942))))))

(assert (= (and d!1527 res!9639) b!11597))

(assert (= (and b!11597 res!9640) b!11598))

(declare-fun m!8019 () Bool)

(assert (=> d!1527 m!8019))

(declare-fun m!8021 () Bool)

(assert (=> d!1527 m!8021))

(declare-fun m!8023 () Bool)

(assert (=> d!1527 m!8023))

(declare-fun m!8025 () Bool)

(assert (=> d!1527 m!8025))

(declare-fun m!8027 () Bool)

(assert (=> b!11597 m!8027))

(declare-fun m!8029 () Bool)

(assert (=> b!11598 m!8029))

(assert (=> b!11484 d!1527))

(declare-fun d!1547 () Bool)

(assert (=> d!1547 (= (head!776 kvs!4) (h!905 kvs!4))))

(assert (=> b!11484 d!1547))

(declare-fun d!1551 () Bool)

(declare-fun e!6875 () Bool)

(assert (=> d!1551 e!6875))

(declare-fun res!9643 () Bool)

(assert (=> d!1551 (=> (not res!9643) (not e!6875))))

(declare-fun lt!3015 () ListLongMap!363)

(assert (=> d!1551 (= res!9643 (contains!167 lt!3015 (_1!191 lt!2942)))))

(declare-fun lt!3016 () List!343)

(assert (=> d!1551 (= lt!3015 (ListLongMap!364 lt!3016))))

(declare-fun lt!3014 () Unit!243)

(declare-fun lt!3017 () Unit!243)

(assert (=> d!1551 (= lt!3014 lt!3017)))

(assert (=> d!1551 (= (getValueByKey!30 lt!3016 (_1!191 lt!2942)) (Some!35 (_2!191 lt!2942)))))

(assert (=> d!1551 (= lt!3017 (lemmaContainsTupThenGetReturnValue!14 lt!3016 (_1!191 lt!2942) (_2!191 lt!2942)))))

(assert (=> d!1551 (= lt!3016 (insertStrictlySorted!14 (toList!197 lm!227) (_1!191 lt!2942) (_2!191 lt!2942)))))

(assert (=> d!1551 (= (+!29 lm!227 lt!2942) lt!3015)))

(declare-fun b!11601 () Bool)

(declare-fun res!9644 () Bool)

(assert (=> b!11601 (=> (not res!9644) (not e!6875))))

(assert (=> b!11601 (= res!9644 (= (getValueByKey!30 (toList!197 lt!3015) (_1!191 lt!2942)) (Some!35 (_2!191 lt!2942))))))

(declare-fun b!11602 () Bool)

(assert (=> b!11602 (= e!6875 (contains!168 (toList!197 lt!3015) lt!2942))))

(assert (= (and d!1551 res!9643) b!11601))

(assert (= (and b!11601 res!9644) b!11602))

(declare-fun m!8035 () Bool)

(assert (=> d!1551 m!8035))

(declare-fun m!8037 () Bool)

(assert (=> d!1551 m!8037))

(declare-fun m!8039 () Bool)

(assert (=> d!1551 m!8039))

(declare-fun m!8041 () Bool)

(assert (=> d!1551 m!8041))

(declare-fun m!8043 () Bool)

(assert (=> b!11601 m!8043))

(declare-fun m!8045 () Bool)

(assert (=> b!11602 m!8045))

(assert (=> b!11484 d!1551))

(declare-fun d!1553 () Bool)

(assert (=> d!1553 (= (isEmpty!69 kvs!4) (is-Nil!340 kvs!4))))

(assert (=> b!11489 d!1553))

(declare-fun d!1555 () Bool)

(declare-fun res!9649 () Bool)

(declare-fun e!6878 () Bool)

(assert (=> d!1555 (=> res!9649 e!6878)))

(assert (=> d!1555 (= res!9649 (is-Nil!340 (toList!197 lm!227)))))

(assert (=> d!1555 (= (forall!62 (toList!197 lm!227) p!216) e!6878)))

(declare-fun b!11607 () Bool)

(declare-fun e!6879 () Bool)

(assert (=> b!11607 (= e!6878 e!6879)))

(declare-fun res!9650 () Bool)

(assert (=> b!11607 (=> (not res!9650) (not e!6879))))

(assert (=> b!11607 (= res!9650 (dynLambda!74 p!216 (h!905 (toList!197 lm!227))))))

(declare-fun b!11608 () Bool)

(assert (=> b!11608 (= e!6879 (forall!62 (t!2664 (toList!197 lm!227)) p!216))))

(assert (= (and d!1555 (not res!9649)) b!11607))

(assert (= (and b!11607 res!9650) b!11608))

(declare-fun b_lambda!735 () Bool)

(assert (=> (not b_lambda!735) (not b!11607)))

(declare-fun t!2696 () Bool)

(declare-fun tb!349 () Bool)

(assert (=> (and start!1554 (= p!216 p!216) t!2696) tb!349))

(declare-fun result!523 () Bool)

(assert (=> tb!349 (= result!523 true)))

(assert (=> b!11607 t!2696))

(declare-fun b_and!817 () Bool)

(assert (= b_and!805 (and (=> t!2696 result!523) b_and!817)))

(declare-fun m!8049 () Bool)

(assert (=> b!11607 m!8049))

(declare-fun m!8051 () Bool)

(assert (=> b!11608 m!8051))

(assert (=> start!1554 d!1555))

(declare-fun d!1559 () Bool)

(declare-fun isStrictlySorted!47 (List!343) Bool)

(assert (=> d!1559 (= (inv!566 lm!227) (isStrictlySorted!47 (toList!197 lm!227)))))

(declare-fun bs!440 () Bool)

(assert (= bs!440 d!1559))

(declare-fun m!8065 () Bool)

(assert (=> bs!440 m!8065))

(assert (=> start!1554 d!1559))

(declare-fun d!1563 () Bool)

(declare-fun res!9655 () Bool)

(declare-fun e!6885 () Bool)

(assert (=> d!1563 (=> res!9655 e!6885)))

(assert (=> d!1563 (= res!9655 (is-Nil!340 kvs!4))))

(assert (=> d!1563 (= (forall!62 kvs!4 p!216) e!6885)))

(declare-fun b!11617 () Bool)

(declare-fun e!6886 () Bool)

(assert (=> b!11617 (= e!6885 e!6886)))

(declare-fun res!9656 () Bool)

(assert (=> b!11617 (=> (not res!9656) (not e!6886))))

(assert (=> b!11617 (= res!9656 (dynLambda!74 p!216 (h!905 kvs!4)))))

(declare-fun b!11618 () Bool)

(assert (=> b!11618 (= e!6886 (forall!62 (t!2664 kvs!4) p!216))))

(assert (= (and d!1563 (not res!9655)) b!11617))

(assert (= (and b!11617 res!9656) b!11618))

(declare-fun b_lambda!739 () Bool)

(assert (=> (not b_lambda!739) (not b!11617)))

(declare-fun t!2700 () Bool)

(declare-fun tb!353 () Bool)

(assert (=> (and start!1554 (= p!216 p!216) t!2700) tb!353))

(declare-fun result!527 () Bool)

(assert (=> tb!353 (= result!527 true)))

(assert (=> b!11617 t!2700))

(declare-fun b_and!821 () Bool)

(assert (= b_and!817 (and (=> t!2700 result!527) b_and!821)))

(declare-fun m!8071 () Bool)

(assert (=> b!11617 m!8071))

(declare-fun m!8073 () Bool)

(assert (=> b!11618 m!8073))

(assert (=> b!11488 d!1563))

(declare-fun d!1569 () Bool)

(declare-fun c!976 () Bool)

(assert (=> d!1569 (= c!976 (is-Nil!340 kvs!4))))

(declare-fun e!6894 () ListLongMap!363)

(assert (=> d!1569 (= (++!4 lm!227 kvs!4) e!6894)))

(declare-fun b!11631 () Bool)

(assert (=> b!11631 (= e!6894 lm!227)))

(declare-fun b!11632 () Bool)

(assert (=> b!11632 (= e!6894 (++!4 (+!29 lm!227 (h!905 kvs!4)) (t!2664 kvs!4)))))

(assert (= (and d!1569 c!976) b!11631))

(assert (= (and d!1569 (not c!976)) b!11632))

(declare-fun m!8099 () Bool)

(assert (=> b!11632 m!8099))

(assert (=> b!11632 m!8099))

(declare-fun m!8101 () Bool)

(assert (=> b!11632 m!8101))

(assert (=> b!11487 d!1569))

(declare-fun d!1579 () Bool)

(declare-fun res!9661 () Bool)

(declare-fun e!6895 () Bool)

(assert (=> d!1579 (=> res!9661 e!6895)))

(assert (=> d!1579 (= res!9661 (is-Nil!340 (toList!197 (++!4 lm!227 kvs!4))))))

(assert (=> d!1579 (= (forall!62 (toList!197 (++!4 lm!227 kvs!4)) p!216) e!6895)))

(declare-fun b!11633 () Bool)

(declare-fun e!6896 () Bool)

(assert (=> b!11633 (= e!6895 e!6896)))

(declare-fun res!9662 () Bool)

(assert (=> b!11633 (=> (not res!9662) (not e!6896))))

(assert (=> b!11633 (= res!9662 (dynLambda!74 p!216 (h!905 (toList!197 (++!4 lm!227 kvs!4)))))))

(declare-fun b!11634 () Bool)

(assert (=> b!11634 (= e!6896 (forall!62 (t!2664 (toList!197 (++!4 lm!227 kvs!4))) p!216))))

(assert (= (and d!1579 (not res!9661)) b!11633))

(assert (= (and b!11633 res!9662) b!11634))

(declare-fun b_lambda!743 () Bool)

(assert (=> (not b_lambda!743) (not b!11633)))

(declare-fun t!2704 () Bool)

(declare-fun tb!357 () Bool)

(assert (=> (and start!1554 (= p!216 p!216) t!2704) tb!357))

(declare-fun result!531 () Bool)

(assert (=> tb!357 (= result!531 true)))

(assert (=> b!11633 t!2704))

(declare-fun b_and!825 () Bool)

(assert (= b_and!821 (and (=> t!2704 result!531) b_and!825)))

(declare-fun m!8103 () Bool)

(assert (=> b!11633 m!8103))

(declare-fun m!8105 () Bool)

(assert (=> b!11634 m!8105))

(assert (=> b!11487 d!1579))

(declare-fun d!1581 () Bool)

(assert (=> d!1581 (forall!62 (toList!197 (++!4 lt!2945 lt!2946)) p!216)))

(declare-fun lt!3042 () Unit!243)

(declare-fun choose!163 (ListLongMap!363 List!343 Int) Unit!243)

(assert (=> d!1581 (= lt!3042 (choose!163 lt!2945 lt!2946 p!216))))

(declare-fun e!6915 () Bool)

(assert (=> d!1581 e!6915))

(declare-fun res!9677 () Bool)

(assert (=> d!1581 (=> (not res!9677) (not e!6915))))

(assert (=> d!1581 (= res!9677 (forall!62 (toList!197 lt!2945) p!216))))

(assert (=> d!1581 (= (insertAllValidProp!2 lt!2945 lt!2946 p!216) lt!3042)))

(declare-fun b!11656 () Bool)

(assert (=> b!11656 (= e!6915 (forall!62 lt!2946 p!216))))

(assert (= (and d!1581 res!9677) b!11656))

(assert (=> d!1581 m!7839))

(assert (=> d!1581 m!7843))

(declare-fun m!8125 () Bool)

(assert (=> d!1581 m!8125))

(assert (=> d!1581 m!7855))

(assert (=> b!11656 m!7845))

(assert (=> b!11487 d!1581))

(declare-fun d!1591 () Bool)

(declare-fun res!9678 () Bool)

(declare-fun e!6918 () Bool)

(assert (=> d!1591 (=> res!9678 e!6918)))

(assert (=> d!1591 (= res!9678 (is-Nil!340 (toList!197 (++!4 lt!2945 lt!2946))))))

(assert (=> d!1591 (= (forall!62 (toList!197 (++!4 lt!2945 lt!2946)) p!216) e!6918)))

(declare-fun b!11661 () Bool)

(declare-fun e!6919 () Bool)

(assert (=> b!11661 (= e!6918 e!6919)))

(declare-fun res!9679 () Bool)

(assert (=> b!11661 (=> (not res!9679) (not e!6919))))

(assert (=> b!11661 (= res!9679 (dynLambda!74 p!216 (h!905 (toList!197 (++!4 lt!2945 lt!2946)))))))

(declare-fun b!11662 () Bool)

(assert (=> b!11662 (= e!6919 (forall!62 (t!2664 (toList!197 (++!4 lt!2945 lt!2946))) p!216))))

(assert (= (and d!1591 (not res!9678)) b!11661))

(assert (= (and b!11661 res!9679) b!11662))

(declare-fun b_lambda!769 () Bool)

(assert (=> (not b_lambda!769) (not b!11661)))

(declare-fun t!2714 () Bool)

(declare-fun tb!367 () Bool)

(assert (=> (and start!1554 (= p!216 p!216) t!2714) tb!367))

(declare-fun result!545 () Bool)

(assert (=> tb!367 (= result!545 true)))

(assert (=> b!11661 t!2714))

(declare-fun b_and!835 () Bool)

(assert (= b_and!825 (and (=> t!2714 result!545) b_and!835)))

(declare-fun m!8127 () Bool)

(assert (=> b!11661 m!8127))

(declare-fun m!8129 () Bool)

(assert (=> b!11662 m!8129))

(assert (=> b!11487 d!1591))

(declare-fun d!1593 () Bool)

(declare-fun c!977 () Bool)

(assert (=> d!1593 (= c!977 (is-Nil!340 lt!2946))))

(declare-fun e!6922 () ListLongMap!363)

(assert (=> d!1593 (= (++!4 lt!2945 lt!2946) e!6922)))

(declare-fun b!11665 () Bool)

(assert (=> b!11665 (= e!6922 lt!2945)))

(declare-fun b!11666 () Bool)

(assert (=> b!11666 (= e!6922 (++!4 (+!29 lt!2945 (h!905 lt!2946)) (t!2664 lt!2946)))))

(assert (= (and d!1593 c!977) b!11665))

(assert (= (and d!1593 (not c!977)) b!11666))

(declare-fun m!8131 () Bool)

(assert (=> b!11666 m!8131))

(assert (=> b!11666 m!8131))

(declare-fun m!8133 () Bool)

(assert (=> b!11666 m!8133))

(assert (=> b!11487 d!1593))

(declare-fun b!11671 () Bool)

