; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137742 () Bool)

(assert start!137742)

(declare-fun res!1081217 () Bool)

(declare-fun e!883340 () Bool)

(assert (=> start!137742 (=> (not res!1081217) (not e!883340))))

(declare-datatypes ((B!2816 0))(
  ( (B!2817 (val!19770 Int)) )
))
(declare-datatypes ((tuple2!25708 0))(
  ( (tuple2!25709 (_1!12865 (_ BitVec 64)) (_2!12865 B!2816)) )
))
(declare-datatypes ((List!36890 0))(
  ( (Nil!36887) (Cons!36886 (h!38429 tuple2!25708) (t!51804 List!36890)) )
))
(declare-fun l!1065 () List!36890)

(declare-fun isStrictlySorted!1124 (List!36890) Bool)

(assert (=> start!137742 (= res!1081217 (isStrictlySorted!1124 l!1065))))

(assert (=> start!137742 e!883340))

(declare-fun e!883339 () Bool)

(assert (=> start!137742 e!883339))

(assert (=> start!137742 true))

(declare-fun b!1582697 () Bool)

(declare-fun res!1081218 () Bool)

(assert (=> b!1582697 (=> (not res!1081218) (not e!883340))))

(declare-fun key!287 () (_ BitVec 64))

(declare-fun containsKey!970 (List!36890 (_ BitVec 64)) Bool)

(assert (=> b!1582697 (= res!1081218 (containsKey!970 l!1065 key!287))))

(declare-fun b!1582698 () Bool)

(declare-fun ListPrimitiveSize!205 (List!36890) Int)

(assert (=> b!1582698 (= e!883340 (< (ListPrimitiveSize!205 l!1065) 0))))

(declare-fun b!1582699 () Bool)

(declare-fun tp_is_empty!39349 () Bool)

(declare-fun tp!114839 () Bool)

(assert (=> b!1582699 (= e!883339 (and tp_is_empty!39349 tp!114839))))

(assert (= (and start!137742 res!1081217) b!1582697))

(assert (= (and b!1582697 res!1081218) b!1582698))

(assert (= (and start!137742 (is-Cons!36886 l!1065)) b!1582699))

(declare-fun m!1453007 () Bool)

(assert (=> start!137742 m!1453007))

(declare-fun m!1453009 () Bool)

(assert (=> b!1582697 m!1453009))

(declare-fun m!1453011 () Bool)

(assert (=> b!1582698 m!1453011))

(push 1)

(assert (not b!1582698))

(assert (not b!1582697))

(assert (not start!137742))

(assert (not b!1582699))

(assert tp_is_empty!39349)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167037 () Bool)

(declare-fun res!1081241 () Bool)

(declare-fun e!883366 () Bool)

(assert (=> d!167037 (=> res!1081241 e!883366)))

(assert (=> d!167037 (= res!1081241 (or (is-Nil!36887 l!1065) (is-Nil!36887 (t!51804 l!1065))))))

(assert (=> d!167037 (= (isStrictlySorted!1124 l!1065) e!883366)))

(declare-fun b!1582734 () Bool)

(declare-fun e!883367 () Bool)

(assert (=> b!1582734 (= e!883366 e!883367)))

(declare-fun res!1081242 () Bool)

(assert (=> b!1582734 (=> (not res!1081242) (not e!883367))))

(assert (=> b!1582734 (= res!1081242 (bvslt (_1!12865 (h!38429 l!1065)) (_1!12865 (h!38429 (t!51804 l!1065)))))))

(declare-fun b!1582735 () Bool)

(assert (=> b!1582735 (= e!883367 (isStrictlySorted!1124 (t!51804 l!1065)))))

(assert (= (and d!167037 (not res!1081241)) b!1582734))

(assert (= (and b!1582734 res!1081242) b!1582735))

(declare-fun m!1453029 () Bool)

(assert (=> b!1582735 m!1453029))

(assert (=> start!137742 d!167037))

(declare-fun d!167043 () Bool)

(declare-fun res!1081253 () Bool)

(declare-fun e!883381 () Bool)

(assert (=> d!167043 (=> res!1081253 e!883381)))

(assert (=> d!167043 (= res!1081253 (and (is-Cons!36886 l!1065) (= (_1!12865 (h!38429 l!1065)) key!287)))))

(assert (=> d!167043 (= (containsKey!970 l!1065 key!287) e!883381)))

(declare-fun b!1582752 () Bool)

(declare-fun e!883382 () Bool)

(assert (=> b!1582752 (= e!883381 e!883382)))

(declare-fun res!1081254 () Bool)

(assert (=> b!1582752 (=> (not res!1081254) (not e!883382))))

(assert (=> b!1582752 (= res!1081254 (and (or (not (is-Cons!36886 l!1065)) (bvsle (_1!12865 (h!38429 l!1065)) key!287)) (is-Cons!36886 l!1065) (bvslt (_1!12865 (h!38429 l!1065)) key!287)))))

(declare-fun b!1582753 () Bool)

(assert (=> b!1582753 (= e!883382 (containsKey!970 (t!51804 l!1065) key!287))))

(assert (= (and d!167043 (not res!1081253)) b!1582752))

(assert (= (and b!1582752 res!1081254) b!1582753))

(declare-fun m!1453035 () Bool)

(assert (=> b!1582753 m!1453035))

(assert (=> b!1582697 d!167043))

(declare-fun d!167049 () Bool)

(declare-fun lt!677136 () Int)

(assert (=> d!167049 (>= lt!677136 0)))

(declare-fun e!883399 () Int)

(assert (=> d!167049 (= lt!677136 e!883399)))

(declare-fun c!146671 () Bool)

(assert (=> d!167049 (= c!146671 (is-Nil!36887 l!1065))))

(assert (=> d!167049 (= (ListPrimitiveSize!205 l!1065) lt!677136)))

(declare-fun b!1582774 () Bool)

(assert (=> b!1582774 (= e!883399 0)))

(declare-fun b!1582775 () Bool)

(assert (=> b!1582775 (= e!883399 (+ 1 (ListPrimitiveSize!205 (t!51804 l!1065))))))

(assert (= (and d!167049 c!146671) b!1582774))

(assert (= (and d!167049 (not c!146671)) b!1582775))

(declare-fun m!1453039 () Bool)

(assert (=> b!1582775 m!1453039))

(assert (=> b!1582698 d!167049))

(declare-fun b!1582785 () Bool)

(declare-fun e!883405 () Bool)

(declare-fun tp!114853 () Bool)

(assert (=> b!1582785 (= e!883405 (and tp_is_empty!39349 tp!114853))))

(assert (=> b!1582699 (= tp!114839 e!883405)))

(assert (= (and b!1582699 (is-Cons!36886 (t!51804 l!1065))) b!1582785))

(push 1)

