; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137550 () Bool)

(assert start!137550)

(declare-fun res!1080812 () Bool)

(declare-fun e!882824 () Bool)

(assert (=> start!137550 (=> (not res!1080812) (not e!882824))))

(declare-datatypes ((B!2732 0))(
  ( (B!2733 (val!19728 Int)) )
))
(declare-datatypes ((tuple2!25624 0))(
  ( (tuple2!25625 (_1!12823 (_ BitVec 64)) (_2!12823 B!2732)) )
))
(declare-datatypes ((List!36848 0))(
  ( (Nil!36845) (Cons!36844 (h!38387 tuple2!25624) (t!51762 List!36848)) )
))
(declare-fun l!1356 () List!36848)

(declare-fun isStrictlySorted!1103 (List!36848) Bool)

(assert (=> start!137550 (= res!1080812 (isStrictlySorted!1103 l!1356))))

(assert (=> start!137550 e!882824))

(declare-fun e!882823 () Bool)

(assert (=> start!137550 e!882823))

(assert (=> start!137550 true))

(declare-fun b!1582016 () Bool)

(declare-fun res!1080813 () Bool)

(assert (=> b!1582016 (=> (not res!1080813) (not e!882824))))

(declare-fun key!387 () (_ BitVec 64))

(declare-fun containsKey!949 (List!36848 (_ BitVec 64)) Bool)

(assert (=> b!1582016 (= res!1080813 (not (containsKey!949 l!1356 key!387)))))

(declare-fun b!1582017 () Bool)

(declare-fun ListPrimitiveSize!199 (List!36848) Int)

(assert (=> b!1582017 (= e!882824 (< (ListPrimitiveSize!199 l!1356) 0))))

(declare-fun b!1582018 () Bool)

(declare-fun tp_is_empty!39277 () Bool)

(declare-fun tp!114659 () Bool)

(assert (=> b!1582018 (= e!882823 (and tp_is_empty!39277 tp!114659))))

(assert (= (and start!137550 res!1080812) b!1582016))

(assert (= (and b!1582016 res!1080813) b!1582017))

(assert (= (and start!137550 (is-Cons!36844 l!1356)) b!1582018))

(declare-fun m!1452695 () Bool)

(assert (=> start!137550 m!1452695))

(declare-fun m!1452697 () Bool)

(assert (=> b!1582016 m!1452697))

(declare-fun m!1452699 () Bool)

(assert (=> b!1582017 m!1452699))

(push 1)

(assert tp_is_empty!39277)

(assert (not b!1582017))

(assert (not start!137550))

(assert (not b!1582016))

(assert (not b!1582018))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166895 () Bool)

(declare-fun lt!677037 () Int)

(assert (=> d!166895 (>= lt!677037 0)))

(declare-fun e!882847 () Int)

(assert (=> d!166895 (= lt!677037 e!882847)))

(declare-fun c!146635 () Bool)

(assert (=> d!166895 (= c!146635 (is-Nil!36845 l!1356))))

(assert (=> d!166895 (= (ListPrimitiveSize!199 l!1356) lt!677037)))

(declare-fun b!1582049 () Bool)

(assert (=> b!1582049 (= e!882847 0)))

(declare-fun b!1582050 () Bool)

(assert (=> b!1582050 (= e!882847 (+ 1 (ListPrimitiveSize!199 (t!51762 l!1356))))))

(assert (= (and d!166895 c!146635) b!1582049))

(assert (= (and d!166895 (not c!146635)) b!1582050))

(declare-fun m!1452713 () Bool)

(assert (=> b!1582050 m!1452713))

(assert (=> b!1582017 d!166895))

(declare-fun d!166897 () Bool)

(declare-fun res!1080846 () Bool)

(declare-fun e!882863 () Bool)

(assert (=> d!166897 (=> res!1080846 e!882863)))

(assert (=> d!166897 (= res!1080846 (and (is-Cons!36844 l!1356) (= (_1!12823 (h!38387 l!1356)) key!387)))))

(assert (=> d!166897 (= (containsKey!949 l!1356 key!387) e!882863)))

(declare-fun b!1582069 () Bool)

(declare-fun e!882864 () Bool)

(assert (=> b!1582069 (= e!882863 e!882864)))

(declare-fun res!1080847 () Bool)

(assert (=> b!1582069 (=> (not res!1080847) (not e!882864))))

(assert (=> b!1582069 (= res!1080847 (and (or (not (is-Cons!36844 l!1356)) (bvsle (_1!12823 (h!38387 l!1356)) key!387)) (is-Cons!36844 l!1356) (bvslt (_1!12823 (h!38387 l!1356)) key!387)))))

(declare-fun b!1582070 () Bool)

(assert (=> b!1582070 (= e!882864 (containsKey!949 (t!51762 l!1356) key!387))))

(assert (= (and d!166897 (not res!1080846)) b!1582069))

(assert (= (and b!1582069 res!1080847) b!1582070))

(declare-fun m!1452721 () Bool)

(assert (=> b!1582070 m!1452721))

(assert (=> b!1582016 d!166897))

(declare-fun d!166905 () Bool)

(declare-fun res!1080860 () Bool)

(declare-fun e!882880 () Bool)

(assert (=> d!166905 (=> res!1080860 e!882880)))

(assert (=> d!166905 (= res!1080860 (or (is-Nil!36845 l!1356) (is-Nil!36845 (t!51762 l!1356))))))

(assert (=> d!166905 (= (isStrictlySorted!1103 l!1356) e!882880)))

(declare-fun b!1582089 () Bool)

(declare-fun e!882881 () Bool)

(assert (=> b!1582089 (= e!882880 e!882881)))

(declare-fun res!1080861 () Bool)

(assert (=> b!1582089 (=> (not res!1080861) (not e!882881))))

(assert (=> b!1582089 (= res!1080861 (bvslt (_1!12823 (h!38387 l!1356)) (_1!12823 (h!38387 (t!51762 l!1356)))))))

(declare-fun b!1582090 () Bool)

(assert (=> b!1582090 (= e!882881 (isStrictlySorted!1103 (t!51762 l!1356)))))

(assert (= (and d!166905 (not res!1080860)) b!1582089))

(assert (= (and b!1582089 res!1080861) b!1582090))

(declare-fun m!1452729 () Bool)

(assert (=> b!1582090 m!1452729))

(assert (=> start!137550 d!166905))

(declare-fun b!1582105 () Bool)

(declare-fun e!882890 () Bool)

(declare-fun tp!114674 () Bool)

(assert (=> b!1582105 (= e!882890 (and tp_is_empty!39277 tp!114674))))

(assert (=> b!1582018 (= tp!114659 e!882890)))

(assert (= (and b!1582018 (is-Cons!36844 (t!51762 l!1356))) b!1582105))

(push 1)

(assert tp_is_empty!39277)

(assert (not b!1582050))

(assert (not b!1582090))

(assert (not b!1582070))

(assert (not b!1582105))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

