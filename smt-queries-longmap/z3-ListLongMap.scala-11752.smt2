; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138284 () Bool)

(assert start!138284)

(declare-fun b!1585728 () Bool)

(declare-fun e!885247 () Bool)

(declare-fun tp_is_empty!39373 () Bool)

(declare-fun tp!114912 () Bool)

(assert (=> b!1585728 (= e!885247 (and tp_is_empty!39373 tp!114912))))

(declare-fun res!1082474 () Bool)

(declare-fun e!885248 () Bool)

(assert (=> start!138284 (=> (not res!1082474) (not e!885248))))

(declare-datatypes ((B!2840 0))(
  ( (B!2841 (val!19782 Int)) )
))
(declare-datatypes ((tuple2!25792 0))(
  ( (tuple2!25793 (_1!12907 (_ BitVec 64)) (_2!12907 B!2840)) )
))
(declare-datatypes ((List!36934 0))(
  ( (Nil!36931) (Cons!36930 (h!38491 tuple2!25792) (t!51840 List!36934)) )
))
(declare-fun l!1065 () List!36934)

(declare-fun isStrictlySorted!1124 (List!36934) Bool)

(assert (=> start!138284 (= res!1082474 (isStrictlySorted!1124 l!1065))))

(assert (=> start!138284 e!885248))

(assert (=> start!138284 e!885247))

(assert (=> start!138284 true))

(declare-fun b!1585725 () Bool)

(declare-fun res!1082472 () Bool)

(assert (=> b!1585725 (=> (not res!1082472) (not e!885248))))

(declare-fun key!287 () (_ BitVec 64))

(declare-fun containsKey!983 (List!36934 (_ BitVec 64)) Bool)

(assert (=> b!1585725 (= res!1082472 (containsKey!983 l!1065 key!287))))

(declare-fun b!1585727 () Bool)

(declare-datatypes ((Option!939 0))(
  ( (Some!938 (v!22463 B!2840)) (None!937) )
))
(declare-fun isDefined!605 (Option!939) Bool)

(declare-fun getValueByKey!831 (List!36934 (_ BitVec 64)) Option!939)

(assert (=> b!1585727 (= e!885248 (not (isDefined!605 (getValueByKey!831 l!1065 key!287))))))

(declare-fun b!1585726 () Bool)

(declare-fun res!1082473 () Bool)

(assert (=> b!1585726 (=> (not res!1082473) (not e!885248))))

(get-info :version)

(assert (=> b!1585726 (= res!1082473 (or (not ((_ is Cons!36930) l!1065)) (= (_1!12907 (h!38491 l!1065)) key!287)))))

(assert (= (and start!138284 res!1082474) b!1585725))

(assert (= (and b!1585725 res!1082472) b!1585726))

(assert (= (and b!1585726 res!1082473) b!1585727))

(assert (= (and start!138284 ((_ is Cons!36930) l!1065)) b!1585728))

(declare-fun m!1455549 () Bool)

(assert (=> start!138284 m!1455549))

(declare-fun m!1455551 () Bool)

(assert (=> b!1585725 m!1455551))

(declare-fun m!1455553 () Bool)

(assert (=> b!1585727 m!1455553))

(assert (=> b!1585727 m!1455553))

(declare-fun m!1455555 () Bool)

(assert (=> b!1585727 m!1455555))

(check-sat (not b!1585727) (not b!1585728) (not b!1585725) (not start!138284) tp_is_empty!39373)
(check-sat)
(get-model)

(declare-fun d!167903 () Bool)

(declare-fun isEmpty!1193 (Option!939) Bool)

(assert (=> d!167903 (= (isDefined!605 (getValueByKey!831 l!1065 key!287)) (not (isEmpty!1193 (getValueByKey!831 l!1065 key!287))))))

(declare-fun bs!45918 () Bool)

(assert (= bs!45918 d!167903))

(assert (=> bs!45918 m!1455553))

(declare-fun m!1455573 () Bool)

(assert (=> bs!45918 m!1455573))

(assert (=> b!1585727 d!167903))

(declare-fun b!1585768 () Bool)

(declare-fun e!885270 () Option!939)

(assert (=> b!1585768 (= e!885270 None!937)))

(declare-fun d!167905 () Bool)

(declare-fun c!147517 () Bool)

(assert (=> d!167905 (= c!147517 (and ((_ is Cons!36930) l!1065) (= (_1!12907 (h!38491 l!1065)) key!287)))))

(declare-fun e!885269 () Option!939)

(assert (=> d!167905 (= (getValueByKey!831 l!1065 key!287) e!885269)))

(declare-fun b!1585767 () Bool)

(assert (=> b!1585767 (= e!885270 (getValueByKey!831 (t!51840 l!1065) key!287))))

(declare-fun b!1585766 () Bool)

(assert (=> b!1585766 (= e!885269 e!885270)))

(declare-fun c!147518 () Bool)

(assert (=> b!1585766 (= c!147518 (and ((_ is Cons!36930) l!1065) (not (= (_1!12907 (h!38491 l!1065)) key!287))))))

(declare-fun b!1585765 () Bool)

(assert (=> b!1585765 (= e!885269 (Some!938 (_2!12907 (h!38491 l!1065))))))

(assert (= (and d!167905 c!147517) b!1585765))

(assert (= (and d!167905 (not c!147517)) b!1585766))

(assert (= (and b!1585766 c!147518) b!1585767))

(assert (= (and b!1585766 (not c!147518)) b!1585768))

(declare-fun m!1455575 () Bool)

(assert (=> b!1585767 m!1455575))

(assert (=> b!1585727 d!167905))

(declare-fun d!167911 () Bool)

(declare-fun res!1082513 () Bool)

(declare-fun e!885287 () Bool)

(assert (=> d!167911 (=> res!1082513 e!885287)))

(assert (=> d!167911 (= res!1082513 (and ((_ is Cons!36930) l!1065) (= (_1!12907 (h!38491 l!1065)) key!287)))))

(assert (=> d!167911 (= (containsKey!983 l!1065 key!287) e!885287)))

(declare-fun b!1585787 () Bool)

(declare-fun e!885288 () Bool)

(assert (=> b!1585787 (= e!885287 e!885288)))

(declare-fun res!1082514 () Bool)

(assert (=> b!1585787 (=> (not res!1082514) (not e!885288))))

(assert (=> b!1585787 (= res!1082514 (and (or (not ((_ is Cons!36930) l!1065)) (bvsle (_1!12907 (h!38491 l!1065)) key!287)) ((_ is Cons!36930) l!1065) (bvslt (_1!12907 (h!38491 l!1065)) key!287)))))

(declare-fun b!1585789 () Bool)

(assert (=> b!1585789 (= e!885288 (containsKey!983 (t!51840 l!1065) key!287))))

(assert (= (and d!167911 (not res!1082513)) b!1585787))

(assert (= (and b!1585787 res!1082514) b!1585789))

(declare-fun m!1455583 () Bool)

(assert (=> b!1585789 m!1455583))

(assert (=> b!1585725 d!167911))

(declare-fun d!167919 () Bool)

(declare-fun res!1082521 () Bool)

(declare-fun e!885301 () Bool)

(assert (=> d!167919 (=> res!1082521 e!885301)))

(assert (=> d!167919 (= res!1082521 (or ((_ is Nil!36931) l!1065) ((_ is Nil!36931) (t!51840 l!1065))))))

(assert (=> d!167919 (= (isStrictlySorted!1124 l!1065) e!885301)))

(declare-fun b!1585805 () Bool)

(declare-fun e!885302 () Bool)

(assert (=> b!1585805 (= e!885301 e!885302)))

(declare-fun res!1082522 () Bool)

(assert (=> b!1585805 (=> (not res!1082522) (not e!885302))))

(assert (=> b!1585805 (= res!1082522 (bvslt (_1!12907 (h!38491 l!1065)) (_1!12907 (h!38491 (t!51840 l!1065)))))))

(declare-fun b!1585806 () Bool)

(assert (=> b!1585806 (= e!885302 (isStrictlySorted!1124 (t!51840 l!1065)))))

(assert (= (and d!167919 (not res!1082521)) b!1585805))

(assert (= (and b!1585805 res!1082522) b!1585806))

(declare-fun m!1455591 () Bool)

(assert (=> b!1585806 m!1455591))

(assert (=> start!138284 d!167919))

(declare-fun b!1585819 () Bool)

(declare-fun e!885309 () Bool)

(declare-fun tp!114921 () Bool)

(assert (=> b!1585819 (= e!885309 (and tp_is_empty!39373 tp!114921))))

(assert (=> b!1585728 (= tp!114912 e!885309)))

(assert (= (and b!1585728 ((_ is Cons!36930) (t!51840 l!1065))) b!1585819))

(check-sat (not b!1585819) (not d!167903) (not b!1585789) (not b!1585767) tp_is_empty!39373 (not b!1585806))
(check-sat)
(get-model)

(declare-fun d!167927 () Bool)

(declare-fun res!1082529 () Bool)

(declare-fun e!885324 () Bool)

(assert (=> d!167927 (=> res!1082529 e!885324)))

(assert (=> d!167927 (= res!1082529 (and ((_ is Cons!36930) (t!51840 l!1065)) (= (_1!12907 (h!38491 (t!51840 l!1065))) key!287)))))

(assert (=> d!167927 (= (containsKey!983 (t!51840 l!1065) key!287) e!885324)))

(declare-fun b!1585840 () Bool)

(declare-fun e!885325 () Bool)

(assert (=> b!1585840 (= e!885324 e!885325)))

(declare-fun res!1082530 () Bool)

(assert (=> b!1585840 (=> (not res!1082530) (not e!885325))))

(assert (=> b!1585840 (= res!1082530 (and (or (not ((_ is Cons!36930) (t!51840 l!1065))) (bvsle (_1!12907 (h!38491 (t!51840 l!1065))) key!287)) ((_ is Cons!36930) (t!51840 l!1065)) (bvslt (_1!12907 (h!38491 (t!51840 l!1065))) key!287)))))

(declare-fun b!1585841 () Bool)

(assert (=> b!1585841 (= e!885325 (containsKey!983 (t!51840 (t!51840 l!1065)) key!287))))

(assert (= (and d!167927 (not res!1082529)) b!1585840))

(assert (= (and b!1585840 res!1082530) b!1585841))

(declare-fun m!1455597 () Bool)

(assert (=> b!1585841 m!1455597))

(assert (=> b!1585789 d!167927))

(declare-fun d!167929 () Bool)

(assert (=> d!167929 (= (isEmpty!1193 (getValueByKey!831 l!1065 key!287)) (not ((_ is Some!938) (getValueByKey!831 l!1065 key!287))))))

(assert (=> d!167903 d!167929))

(declare-fun b!1585845 () Bool)

(declare-fun e!885327 () Option!939)

(assert (=> b!1585845 (= e!885327 None!937)))

(declare-fun d!167931 () Bool)

(declare-fun c!147531 () Bool)

(assert (=> d!167931 (= c!147531 (and ((_ is Cons!36930) (t!51840 l!1065)) (= (_1!12907 (h!38491 (t!51840 l!1065))) key!287)))))

(declare-fun e!885326 () Option!939)

(assert (=> d!167931 (= (getValueByKey!831 (t!51840 l!1065) key!287) e!885326)))

(declare-fun b!1585844 () Bool)

(assert (=> b!1585844 (= e!885327 (getValueByKey!831 (t!51840 (t!51840 l!1065)) key!287))))

(declare-fun b!1585843 () Bool)

(assert (=> b!1585843 (= e!885326 e!885327)))

(declare-fun c!147532 () Bool)

(assert (=> b!1585843 (= c!147532 (and ((_ is Cons!36930) (t!51840 l!1065)) (not (= (_1!12907 (h!38491 (t!51840 l!1065))) key!287))))))

(declare-fun b!1585842 () Bool)

(assert (=> b!1585842 (= e!885326 (Some!938 (_2!12907 (h!38491 (t!51840 l!1065)))))))

(assert (= (and d!167931 c!147531) b!1585842))

(assert (= (and d!167931 (not c!147531)) b!1585843))

(assert (= (and b!1585843 c!147532) b!1585844))

(assert (= (and b!1585843 (not c!147532)) b!1585845))

(declare-fun m!1455599 () Bool)

(assert (=> b!1585844 m!1455599))

(assert (=> b!1585767 d!167931))

(declare-fun d!167933 () Bool)

(declare-fun res!1082531 () Bool)

(declare-fun e!885328 () Bool)

(assert (=> d!167933 (=> res!1082531 e!885328)))

(assert (=> d!167933 (= res!1082531 (or ((_ is Nil!36931) (t!51840 l!1065)) ((_ is Nil!36931) (t!51840 (t!51840 l!1065)))))))

(assert (=> d!167933 (= (isStrictlySorted!1124 (t!51840 l!1065)) e!885328)))

(declare-fun b!1585846 () Bool)

(declare-fun e!885329 () Bool)

(assert (=> b!1585846 (= e!885328 e!885329)))

(declare-fun res!1082532 () Bool)

(assert (=> b!1585846 (=> (not res!1082532) (not e!885329))))

(assert (=> b!1585846 (= res!1082532 (bvslt (_1!12907 (h!38491 (t!51840 l!1065))) (_1!12907 (h!38491 (t!51840 (t!51840 l!1065))))))))

(declare-fun b!1585847 () Bool)

(assert (=> b!1585847 (= e!885329 (isStrictlySorted!1124 (t!51840 (t!51840 l!1065))))))

(assert (= (and d!167933 (not res!1082531)) b!1585846))

(assert (= (and b!1585846 res!1082532) b!1585847))

(declare-fun m!1455601 () Bool)

(assert (=> b!1585847 m!1455601))

(assert (=> b!1585806 d!167933))

(declare-fun b!1585848 () Bool)

(declare-fun e!885330 () Bool)

(declare-fun tp!114928 () Bool)

(assert (=> b!1585848 (= e!885330 (and tp_is_empty!39373 tp!114928))))

(assert (=> b!1585819 (= tp!114921 e!885330)))

(assert (= (and b!1585819 ((_ is Cons!36930) (t!51840 (t!51840 l!1065)))) b!1585848))

(check-sat (not b!1585847) (not b!1585844) (not b!1585841) (not b!1585848) tp_is_empty!39373)
(check-sat)
