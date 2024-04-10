; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137578 () Bool)

(assert start!137578)

(declare-fun res!1080886 () Bool)

(declare-fun e!882907 () Bool)

(assert (=> start!137578 (=> (not res!1080886) (not e!882907))))

(declare-datatypes ((B!2742 0))(
  ( (B!2743 (val!19733 Int)) )
))
(declare-datatypes ((tuple2!25634 0))(
  ( (tuple2!25635 (_1!12828 (_ BitVec 64)) (_2!12828 B!2742)) )
))
(declare-datatypes ((List!36853 0))(
  ( (Nil!36850) (Cons!36849 (h!38392 tuple2!25634) (t!51767 List!36853)) )
))
(declare-fun l!1356 () List!36853)

(declare-fun isStrictlySorted!1108 (List!36853) Bool)

(assert (=> start!137578 (= res!1080886 (isStrictlySorted!1108 l!1356))))

(assert (=> start!137578 e!882907))

(declare-fun e!882908 () Bool)

(assert (=> start!137578 e!882908))

(assert (=> start!137578 true))

(declare-fun tp_is_empty!39287 () Bool)

(assert (=> start!137578 tp_is_empty!39287))

(declare-fun b!1582141 () Bool)

(declare-fun tp!114683 () Bool)

(assert (=> b!1582141 (= e!882908 (and tp_is_empty!39287 tp!114683))))

(declare-fun b!1582138 () Bool)

(declare-fun res!1080887 () Bool)

(assert (=> b!1582138 (=> (not res!1080887) (not e!882907))))

(declare-fun key!387 () (_ BitVec 64))

(declare-fun containsKey!954 (List!36853 (_ BitVec 64)) Bool)

(assert (=> b!1582138 (= res!1080887 (not (containsKey!954 l!1356 key!387)))))

(declare-fun b!1582140 () Bool)

(declare-fun value!184 () B!2742)

(declare-fun contains!10516 (List!36853 tuple2!25634) Bool)

(assert (=> b!1582140 (= e!882907 (contains!10516 l!1356 (tuple2!25635 key!387 value!184)))))

(declare-fun b!1582139 () Bool)

(declare-fun res!1080888 () Bool)

(assert (=> b!1582139 (=> (not res!1080888) (not e!882907))))

(assert (=> b!1582139 (= res!1080888 (is-Nil!36850 l!1356))))

(assert (= (and start!137578 res!1080886) b!1582138))

(assert (= (and b!1582138 res!1080887) b!1582139))

(assert (= (and b!1582139 res!1080888) b!1582140))

(assert (= (and start!137578 (is-Cons!36849 l!1356)) b!1582141))

(declare-fun m!1452743 () Bool)

(assert (=> start!137578 m!1452743))

(declare-fun m!1452745 () Bool)

(assert (=> b!1582138 m!1452745))

(declare-fun m!1452747 () Bool)

(assert (=> b!1582140 m!1452747))

(push 1)

(assert (not b!1582138))

(assert (not start!137578))

(assert tp_is_empty!39287)

(assert (not b!1582140))

(assert (not b!1582141))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166913 () Bool)

(declare-fun res!1080901 () Bool)

(declare-fun e!882921 () Bool)

(assert (=> d!166913 (=> res!1080901 e!882921)))

(assert (=> d!166913 (= res!1080901 (or (is-Nil!36850 l!1356) (is-Nil!36850 (t!51767 l!1356))))))

(assert (=> d!166913 (= (isStrictlySorted!1108 l!1356) e!882921)))

(declare-fun b!1582154 () Bool)

(declare-fun e!882922 () Bool)

(assert (=> b!1582154 (= e!882921 e!882922)))

(declare-fun res!1080902 () Bool)

(assert (=> b!1582154 (=> (not res!1080902) (not e!882922))))

(assert (=> b!1582154 (= res!1080902 (bvslt (_1!12828 (h!38392 l!1356)) (_1!12828 (h!38392 (t!51767 l!1356)))))))

(declare-fun b!1582155 () Bool)

(assert (=> b!1582155 (= e!882922 (isStrictlySorted!1108 (t!51767 l!1356)))))

(assert (= (and d!166913 (not res!1080901)) b!1582154))

(assert (= (and b!1582154 res!1080902) b!1582155))

(declare-fun m!1452749 () Bool)

(assert (=> b!1582155 m!1452749))

(assert (=> start!137578 d!166913))

(declare-fun lt!677049 () Bool)

(declare-fun d!166917 () Bool)

(declare-fun content!856 (List!36853) (Set tuple2!25634))

(assert (=> d!166917 (= lt!677049 (member (tuple2!25635 key!387 value!184) (content!856 l!1356)))))

(declare-fun e!882942 () Bool)

(assert (=> d!166917 (= lt!677049 e!882942)))

(declare-fun res!1080921 () Bool)

(assert (=> d!166917 (=> (not res!1080921) (not e!882942))))

(assert (=> d!166917 (= res!1080921 (is-Cons!36849 l!1356))))

(assert (=> d!166917 (= (contains!10516 l!1356 (tuple2!25635 key!387 value!184)) lt!677049)))

(declare-fun b!1582174 () Bool)

(declare-fun e!882941 () Bool)

(assert (=> b!1582174 (= e!882942 e!882941)))

(declare-fun res!1080922 () Bool)

(assert (=> b!1582174 (=> res!1080922 e!882941)))

(assert (=> b!1582174 (= res!1080922 (= (h!38392 l!1356) (tuple2!25635 key!387 value!184)))))

(declare-fun b!1582175 () Bool)

(assert (=> b!1582175 (= e!882941 (contains!10516 (t!51767 l!1356) (tuple2!25635 key!387 value!184)))))

(assert (= (and d!166917 res!1080921) b!1582174))

(assert (= (and b!1582174 (not res!1080922)) b!1582175))

(declare-fun m!1452761 () Bool)

(assert (=> d!166917 m!1452761))

(declare-fun m!1452763 () Bool)

(assert (=> d!166917 m!1452763))

(declare-fun m!1452765 () Bool)

(assert (=> b!1582175 m!1452765))

(assert (=> b!1582140 d!166917))

(declare-fun d!166925 () Bool)

(declare-fun res!1080939 () Bool)

(declare-fun e!882959 () Bool)

(assert (=> d!166925 (=> res!1080939 e!882959)))

(assert (=> d!166925 (= res!1080939 (and (is-Cons!36849 l!1356) (= (_1!12828 (h!38392 l!1356)) key!387)))))

(assert (=> d!166925 (= (containsKey!954 l!1356 key!387) e!882959)))

(declare-fun b!1582192 () Bool)

(declare-fun e!882960 () Bool)

(assert (=> b!1582192 (= e!882959 e!882960)))

(declare-fun res!1080940 () Bool)

(assert (=> b!1582192 (=> (not res!1080940) (not e!882960))))

(assert (=> b!1582192 (= res!1080940 (and (or (not (is-Cons!36849 l!1356)) (bvsle (_1!12828 (h!38392 l!1356)) key!387)) (is-Cons!36849 l!1356) (bvslt (_1!12828 (h!38392 l!1356)) key!387)))))

(declare-fun b!1582193 () Bool)

(assert (=> b!1582193 (= e!882960 (containsKey!954 (t!51767 l!1356) key!387))))

