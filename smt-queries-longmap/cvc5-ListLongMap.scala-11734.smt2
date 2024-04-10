; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137598 () Bool)

(assert start!137598)

(declare-fun res!1080950 () Bool)

(declare-fun e!882976 () Bool)

(assert (=> start!137598 (=> (not res!1080950) (not e!882976))))

(declare-datatypes ((B!2744 0))(
  ( (B!2745 (val!19734 Int)) )
))
(declare-datatypes ((tuple2!25636 0))(
  ( (tuple2!25637 (_1!12829 (_ BitVec 64)) (_2!12829 B!2744)) )
))
(declare-datatypes ((List!36854 0))(
  ( (Nil!36851) (Cons!36850 (h!38393 tuple2!25636) (t!51768 List!36854)) )
))
(declare-fun l!1356 () List!36854)

(declare-fun isStrictlySorted!1109 (List!36854) Bool)

(assert (=> start!137598 (= res!1080950 (isStrictlySorted!1109 l!1356))))

(assert (=> start!137598 e!882976))

(declare-fun e!882977 () Bool)

(assert (=> start!137598 e!882977))

(assert (=> start!137598 true))

(declare-fun b!1582221 () Bool)

(declare-fun ListPrimitiveSize!202 (List!36854) Int)

(assert (=> b!1582221 (= e!882976 (>= (ListPrimitiveSize!202 (t!51768 l!1356)) (ListPrimitiveSize!202 l!1356)))))

(declare-fun b!1582219 () Bool)

(declare-fun res!1080951 () Bool)

(assert (=> b!1582219 (=> (not res!1080951) (not e!882976))))

(declare-fun key!387 () (_ BitVec 64))

(declare-fun containsKey!955 (List!36854 (_ BitVec 64)) Bool)

(assert (=> b!1582219 (= res!1080951 (not (containsKey!955 l!1356 key!387)))))

(declare-fun b!1582220 () Bool)

(declare-fun res!1080949 () Bool)

(assert (=> b!1582220 (=> (not res!1080949) (not e!882976))))

(assert (=> b!1582220 (= res!1080949 (not (is-Nil!36851 l!1356)))))

(declare-fun b!1582222 () Bool)

(declare-fun tp_is_empty!39289 () Bool)

(declare-fun tp!114695 () Bool)

(assert (=> b!1582222 (= e!882977 (and tp_is_empty!39289 tp!114695))))

(assert (= (and start!137598 res!1080950) b!1582219))

(assert (= (and b!1582219 res!1080951) b!1582220))

(assert (= (and b!1582220 res!1080949) b!1582221))

(assert (= (and start!137598 (is-Cons!36850 l!1356)) b!1582222))

(declare-fun m!1452779 () Bool)

(assert (=> start!137598 m!1452779))

(declare-fun m!1452781 () Bool)

(assert (=> b!1582221 m!1452781))

(declare-fun m!1452783 () Bool)

(assert (=> b!1582221 m!1452783))

(declare-fun m!1452785 () Bool)

(assert (=> b!1582219 m!1452785))

(push 1)

(assert (not b!1582219))

(assert (not b!1582222))

(assert tp_is_empty!39289)

(assert (not start!137598))

(assert (not b!1582221))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166933 () Bool)

(declare-fun res!1080986 () Bool)

(declare-fun e!883009 () Bool)

(assert (=> d!166933 (=> res!1080986 e!883009)))

(assert (=> d!166933 (= res!1080986 (and (is-Cons!36850 l!1356) (= (_1!12829 (h!38393 l!1356)) key!387)))))

(assert (=> d!166933 (= (containsKey!955 l!1356 key!387) e!883009)))

(declare-fun b!1582269 () Bool)

(declare-fun e!883010 () Bool)

(assert (=> b!1582269 (= e!883009 e!883010)))

(declare-fun res!1080987 () Bool)

(assert (=> b!1582269 (=> (not res!1080987) (not e!883010))))

(assert (=> b!1582269 (= res!1080987 (and (or (not (is-Cons!36850 l!1356)) (bvsle (_1!12829 (h!38393 l!1356)) key!387)) (is-Cons!36850 l!1356) (bvslt (_1!12829 (h!38393 l!1356)) key!387)))))

(declare-fun b!1582270 () Bool)

(assert (=> b!1582270 (= e!883010 (containsKey!955 (t!51768 l!1356) key!387))))

(assert (= (and d!166933 (not res!1080986)) b!1582269))

(assert (= (and b!1582269 res!1080987) b!1582270))

(declare-fun m!1452809 () Bool)

(assert (=> b!1582270 m!1452809))

(assert (=> b!1582219 d!166933))

(declare-fun d!166945 () Bool)

(declare-fun res!1080996 () Bool)

(declare-fun e!883024 () Bool)

(assert (=> d!166945 (=> res!1080996 e!883024)))

(assert (=> d!166945 (= res!1080996 (or (is-Nil!36851 l!1356) (is-Nil!36851 (t!51768 l!1356))))))

(assert (=> d!166945 (= (isStrictlySorted!1109 l!1356) e!883024)))

(declare-fun b!1582289 () Bool)

(declare-fun e!883025 () Bool)

(assert (=> b!1582289 (= e!883024 e!883025)))

(declare-fun res!1080997 () Bool)

(assert (=> b!1582289 (=> (not res!1080997) (not e!883025))))

(assert (=> b!1582289 (= res!1080997 (bvslt (_1!12829 (h!38393 l!1356)) (_1!12829 (h!38393 (t!51768 l!1356)))))))

(declare-fun b!1582290 () Bool)

(assert (=> b!1582290 (= e!883025 (isStrictlySorted!1109 (t!51768 l!1356)))))

(assert (= (and d!166945 (not res!1080996)) b!1582289))

(assert (= (and b!1582289 res!1080997) b!1582290))

(declare-fun m!1452813 () Bool)

(assert (=> b!1582290 m!1452813))

(assert (=> start!137598 d!166945))

(declare-fun d!166951 () Bool)

(declare-fun lt!677063 () Int)

(assert (=> d!166951 (>= lt!677063 0)))

(declare-fun e!883039 () Int)

(assert (=> d!166951 (= lt!677063 e!883039)))

(declare-fun c!146652 () Bool)

(assert (=> d!166951 (= c!146652 (is-Nil!36851 (t!51768 l!1356)))))

(assert (=> d!166951 (= (ListPrimitiveSize!202 (t!51768 l!1356)) lt!677063)))

(declare-fun b!1582308 () Bool)

(assert (=> b!1582308 (= e!883039 0)))

(declare-fun b!1582309 () Bool)

(assert (=> b!1582309 (= e!883039 (+ 1 (ListPrimitiveSize!202 (t!51768 (t!51768 l!1356)))))))

(assert (= (and d!166951 c!146652) b!1582308))

(assert (= (and d!166951 (not c!146652)) b!1582309))

(declare-fun m!1452819 () Bool)

(assert (=> b!1582309 m!1452819))

(assert (=> b!1582221 d!166951))

(declare-fun d!166953 () Bool)

(declare-fun lt!677064 () Int)

(assert (=> d!166953 (>= lt!677064 0)))

(declare-fun e!883042 () Int)

(assert (=> d!166953 (= lt!677064 e!883042)))

(declare-fun c!146653 () Bool)

(assert (=> d!166953 (= c!146653 (is-Nil!36851 l!1356))))

(assert (=> d!166953 (= (ListPrimitiveSize!202 l!1356) lt!677064)))

(declare-fun b!1582314 () Bool)

(assert (=> b!1582314 (= e!883042 0)))

(declare-fun b!1582315 () Bool)

(assert (=> b!1582315 (= e!883042 (+ 1 (ListPrimitiveSize!202 (t!51768 l!1356))))))

(assert (= (and d!166953 c!146653) b!1582314))

(assert (= (and d!166953 (not c!146653)) b!1582315))

(assert (=> b!1582315 m!1452781))

(assert (=> b!1582221 d!166953))

(declare-fun b!1582321 () Bool)

(declare-fun e!883046 () Bool)

(declare-fun tp!114710 () Bool)

(assert (=> b!1582321 (= e!883046 (and tp_is_empty!39289 tp!114710))))

(assert (=> b!1582222 (= tp!114695 e!883046)))

(assert (= (and b!1582222 (is-Cons!36850 (t!51768 l!1356))) b!1582321))

(push 1)

