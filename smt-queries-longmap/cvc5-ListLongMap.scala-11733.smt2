; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137574 () Bool)

(assert start!137574)

(declare-fun b!1582114 () Bool)

(declare-fun res!1080869 () Bool)

(declare-fun e!882895 () Bool)

(assert (=> b!1582114 (=> (not res!1080869) (not e!882895))))

(declare-datatypes ((B!2738 0))(
  ( (B!2739 (val!19731 Int)) )
))
(declare-datatypes ((tuple2!25630 0))(
  ( (tuple2!25631 (_1!12826 (_ BitVec 64)) (_2!12826 B!2738)) )
))
(declare-datatypes ((List!36851 0))(
  ( (Nil!36848) (Cons!36847 (h!38390 tuple2!25630) (t!51765 List!36851)) )
))
(declare-fun l!1356 () List!36851)

(declare-fun key!387 () (_ BitVec 64))

(declare-fun containsKey!952 (List!36851 (_ BitVec 64)) Bool)

(assert (=> b!1582114 (= res!1080869 (not (containsKey!952 l!1356 key!387)))))

(declare-fun b!1582115 () Bool)

(declare-fun res!1080868 () Bool)

(assert (=> b!1582115 (=> (not res!1080868) (not e!882895))))

(assert (=> b!1582115 (= res!1080868 (is-Nil!36848 l!1356))))

(declare-fun b!1582116 () Bool)

(declare-fun value!184 () B!2738)

(declare-fun contains!10514 (List!36851 tuple2!25630) Bool)

(assert (=> b!1582116 (= e!882895 (contains!10514 l!1356 (tuple2!25631 key!387 value!184)))))

(declare-fun b!1582117 () Bool)

(declare-fun e!882896 () Bool)

(declare-fun tp_is_empty!39283 () Bool)

(declare-fun tp!114677 () Bool)

(assert (=> b!1582117 (= e!882896 (and tp_is_empty!39283 tp!114677))))

(declare-fun res!1080870 () Bool)

(assert (=> start!137574 (=> (not res!1080870) (not e!882895))))

(declare-fun isStrictlySorted!1106 (List!36851) Bool)

(assert (=> start!137574 (= res!1080870 (isStrictlySorted!1106 l!1356))))

(assert (=> start!137574 e!882895))

(assert (=> start!137574 e!882896))

(assert (=> start!137574 true))

(assert (=> start!137574 tp_is_empty!39283))

(assert (= (and start!137574 res!1080870) b!1582114))

(assert (= (and b!1582114 res!1080869) b!1582115))

(assert (= (and b!1582115 res!1080868) b!1582116))

(assert (= (and start!137574 (is-Cons!36847 l!1356)) b!1582117))

(declare-fun m!1452731 () Bool)

(assert (=> b!1582114 m!1452731))

(declare-fun m!1452733 () Bool)

(assert (=> b!1582116 m!1452733))

(declare-fun m!1452735 () Bool)

(assert (=> start!137574 m!1452735))

(push 1)

(assert (not b!1582117))

(assert (not start!137574))

(assert (not b!1582114))

(assert (not b!1582116))

(assert tp_is_empty!39283)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!677046 () Bool)

(declare-fun d!166915 () Bool)

(declare-fun content!855 (List!36851) (Set tuple2!25630))

(assert (=> d!166915 (= lt!677046 (set.member (tuple2!25631 key!387 value!184) (content!855 l!1356)))))

(declare-fun e!882926 () Bool)

(assert (=> d!166915 (= lt!677046 e!882926)))

(declare-fun res!1080906 () Bool)

(assert (=> d!166915 (=> (not res!1080906) (not e!882926))))

(assert (=> d!166915 (= res!1080906 (is-Cons!36847 l!1356))))

(assert (=> d!166915 (= (contains!10514 l!1356 (tuple2!25631 key!387 value!184)) lt!677046)))

(declare-fun b!1582158 () Bool)

(declare-fun e!882925 () Bool)

(assert (=> b!1582158 (= e!882926 e!882925)))

(declare-fun res!1080905 () Bool)

(assert (=> b!1582158 (=> res!1080905 e!882925)))

(assert (=> b!1582158 (= res!1080905 (= (h!38390 l!1356) (tuple2!25631 key!387 value!184)))))

(declare-fun b!1582159 () Bool)

(assert (=> b!1582159 (= e!882925 (contains!10514 (t!51765 l!1356) (tuple2!25631 key!387 value!184)))))

(assert (= (and d!166915 res!1080906) b!1582158))

(assert (= (and b!1582158 (not res!1080905)) b!1582159))

(declare-fun m!1452753 () Bool)

(assert (=> d!166915 m!1452753))

(declare-fun m!1452755 () Bool)

(assert (=> d!166915 m!1452755))

(declare-fun m!1452757 () Bool)

(assert (=> b!1582159 m!1452757))

(assert (=> b!1582116 d!166915))

(declare-fun d!166921 () Bool)

(declare-fun res!1080923 () Bool)

(declare-fun e!882943 () Bool)

(assert (=> d!166921 (=> res!1080923 e!882943)))

(assert (=> d!166921 (= res!1080923 (and (is-Cons!36847 l!1356) (= (_1!12826 (h!38390 l!1356)) key!387)))))

(assert (=> d!166921 (= (containsKey!952 l!1356 key!387) e!882943)))

(declare-fun b!1582176 () Bool)

(declare-fun e!882944 () Bool)

(assert (=> b!1582176 (= e!882943 e!882944)))

(declare-fun res!1080924 () Bool)

(assert (=> b!1582176 (=> (not res!1080924) (not e!882944))))

(assert (=> b!1582176 (= res!1080924 (and (or (not (is-Cons!36847 l!1356)) (bvsle (_1!12826 (h!38390 l!1356)) key!387)) (is-Cons!36847 l!1356) (bvslt (_1!12826 (h!38390 l!1356)) key!387)))))

(declare-fun b!1582177 () Bool)

(assert (=> b!1582177 (= e!882944 (containsKey!952 (t!51765 l!1356) key!387))))

(assert (= (and d!166921 (not res!1080923)) b!1582176))

(assert (= (and b!1582176 res!1080924) b!1582177))

(declare-fun m!1452767 () Bool)

(assert (=> b!1582177 m!1452767))

(assert (=> b!1582114 d!166921))

(declare-fun d!166927 () Bool)

(declare-fun res!1080941 () Bool)

(declare-fun e!882961 () Bool)

(assert (=> d!166927 (=> res!1080941 e!882961)))

(assert (=> d!166927 (= res!1080941 (or (is-Nil!36848 l!1356) (is-Nil!36848 (t!51765 l!1356))))))

(assert (=> d!166927 (= (isStrictlySorted!1106 l!1356) e!882961)))

(declare-fun b!1582196 () Bool)

(declare-fun e!882962 () Bool)

(assert (=> b!1582196 (= e!882961 e!882962)))

(declare-fun res!1080942 () Bool)

(assert (=> b!1582196 (=> (not res!1080942) (not e!882962))))

(assert (=> b!1582196 (= res!1080942 (bvslt (_1!12826 (h!38390 l!1356)) (_1!12826 (h!38390 (t!51765 l!1356)))))))

(declare-fun b!1582197 () Bool)

(assert (=> b!1582197 (= e!882962 (isStrictlySorted!1106 (t!51765 l!1356)))))

(assert (= (and d!166927 (not res!1080941)) b!1582196))

(assert (= (and b!1582196 res!1080942) b!1582197))

(declare-fun m!1452777 () Bool)

(assert (=> b!1582197 m!1452777))

(assert (=> start!137574 d!166927))

(declare-fun b!1582210 () Bool)

(declare-fun e!882971 () Bool)

(declare-fun tp!114692 () Bool)

(assert (=> b!1582210 (= e!882971 (and tp_is_empty!39283 tp!114692))))

(assert (=> b!1582117 (= tp!114677 e!882971)))

(assert (= (and b!1582117 (is-Cons!36847 (t!51765 l!1356))) b!1582210))

(push 1)

