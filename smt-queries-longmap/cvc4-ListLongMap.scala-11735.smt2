; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137626 () Bool)

(assert start!137626)

(declare-fun b!1582356 () Bool)

(declare-datatypes ((B!2754 0))(
  ( (B!2755 (val!19739 Int)) )
))
(declare-datatypes ((tuple2!25646 0))(
  ( (tuple2!25647 (_1!12834 (_ BitVec 64)) (_2!12834 B!2754)) )
))
(declare-datatypes ((List!36859 0))(
  ( (Nil!36856) (Cons!36855 (h!38398 tuple2!25646) (t!51773 List!36859)) )
))
(declare-fun l!1356 () List!36859)

(declare-fun value!184 () B!2754)

(declare-fun key!387 () (_ BitVec 64))

(declare-fun e!883063 () Bool)

(declare-fun contains!10519 (List!36859 tuple2!25646) Bool)

(assert (=> b!1582356 (= e!883063 (contains!10519 l!1356 (tuple2!25647 key!387 value!184)))))

(declare-datatypes ((Unit!52262 0))(
  ( (Unit!52263) )
))
(declare-fun lt!677073 () Unit!52262)

(declare-fun lemmaNotContainsKeyThenNotContainsTuple!9 (List!36859 (_ BitVec 64) B!2754) Unit!52262)

(assert (=> b!1582356 (= lt!677073 (lemmaNotContainsKeyThenNotContainsTuple!9 (t!51773 l!1356) key!387 value!184))))

(declare-fun b!1582355 () Bool)

(declare-fun res!1081032 () Bool)

(assert (=> b!1582355 (=> (not res!1081032) (not e!883063))))

(assert (=> b!1582355 (= res!1081032 (not (is-Nil!36856 l!1356)))))

(declare-fun res!1081031 () Bool)

(assert (=> start!137626 (=> (not res!1081031) (not e!883063))))

(declare-fun isStrictlySorted!1114 (List!36859) Bool)

(assert (=> start!137626 (= res!1081031 (isStrictlySorted!1114 l!1356))))

(assert (=> start!137626 e!883063))

(declare-fun e!883064 () Bool)

(assert (=> start!137626 e!883064))

(assert (=> start!137626 true))

(declare-fun tp_is_empty!39299 () Bool)

(assert (=> start!137626 tp_is_empty!39299))

(declare-fun b!1582354 () Bool)

(declare-fun res!1081030 () Bool)

(assert (=> b!1582354 (=> (not res!1081030) (not e!883063))))

(declare-fun containsKey!960 (List!36859 (_ BitVec 64)) Bool)

(assert (=> b!1582354 (= res!1081030 (not (containsKey!960 l!1356 key!387)))))

(declare-fun b!1582357 () Bool)

(declare-fun tp!114719 () Bool)

(assert (=> b!1582357 (= e!883064 (and tp_is_empty!39299 tp!114719))))

(assert (= (and start!137626 res!1081031) b!1582354))

(assert (= (and b!1582354 res!1081030) b!1582355))

(assert (= (and b!1582355 res!1081032) b!1582356))

(assert (= (and start!137626 (is-Cons!36855 l!1356)) b!1582357))

(declare-fun m!1452837 () Bool)

(assert (=> b!1582356 m!1452837))

(declare-fun m!1452839 () Bool)

(assert (=> b!1582356 m!1452839))

(declare-fun m!1452841 () Bool)

(assert (=> start!137626 m!1452841))

(declare-fun m!1452843 () Bool)

(assert (=> b!1582354 m!1452843))

(push 1)

(assert (not b!1582357))

(assert (not b!1582356))

(assert (not b!1582354))

(assert tp_is_empty!39299)

(assert (not start!137626))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!677079 () Bool)

(declare-fun d!166961 () Bool)

(declare-fun content!859 (List!36859) (Set tuple2!25646))

(assert (=> d!166961 (= lt!677079 (member (tuple2!25647 key!387 value!184) (content!859 l!1356)))))

(declare-fun e!883081 () Bool)

(assert (=> d!166961 (= lt!677079 e!883081)))

(declare-fun res!1081050 () Bool)

(assert (=> d!166961 (=> (not res!1081050) (not e!883081))))

(assert (=> d!166961 (= res!1081050 (is-Cons!36855 l!1356))))

(assert (=> d!166961 (= (contains!10519 l!1356 (tuple2!25647 key!387 value!184)) lt!677079)))

(declare-fun b!1582374 () Bool)

(declare-fun e!883082 () Bool)

(assert (=> b!1582374 (= e!883081 e!883082)))

(declare-fun res!1081049 () Bool)

(assert (=> b!1582374 (=> res!1081049 e!883082)))

(assert (=> b!1582374 (= res!1081049 (= (h!38398 l!1356) (tuple2!25647 key!387 value!184)))))

(declare-fun b!1582375 () Bool)

(assert (=> b!1582375 (= e!883082 (contains!10519 (t!51773 l!1356) (tuple2!25647 key!387 value!184)))))

(assert (= (and d!166961 res!1081050) b!1582374))

(assert (= (and b!1582374 (not res!1081049)) b!1582375))

(declare-fun m!1452853 () Bool)

(assert (=> d!166961 m!1452853))

(declare-fun m!1452855 () Bool)

(assert (=> d!166961 m!1452855))

(declare-fun m!1452857 () Bool)

(assert (=> b!1582375 m!1452857))

(assert (=> b!1582356 d!166961))

(declare-fun d!166967 () Bool)

(assert (=> d!166967 (not (contains!10519 (t!51773 l!1356) (tuple2!25647 key!387 value!184)))))

(declare-fun lt!677085 () Unit!52262)

(declare-fun choose!2102 (List!36859 (_ BitVec 64) B!2754) Unit!52262)

(assert (=> d!166967 (= lt!677085 (choose!2102 (t!51773 l!1356) key!387 value!184))))

(declare-fun e!883094 () Bool)

(assert (=> d!166967 e!883094))

(declare-fun res!1081062 () Bool)

(assert (=> d!166967 (=> (not res!1081062) (not e!883094))))

(assert (=> d!166967 (= res!1081062 (isStrictlySorted!1114 (t!51773 l!1356)))))

(assert (=> d!166967 (= (lemmaNotContainsKeyThenNotContainsTuple!9 (t!51773 l!1356) key!387 value!184) lt!677085)))

(declare-fun b!1582387 () Bool)

(assert (=> b!1582387 (= e!883094 (not (containsKey!960 (t!51773 l!1356) key!387)))))

(assert (= (and d!166967 res!1081062) b!1582387))

(assert (=> d!166967 m!1452857))

(declare-fun m!1452867 () Bool)

(assert (=> d!166967 m!1452867))

(declare-fun m!1452869 () Bool)

(assert (=> d!166967 m!1452869))

(declare-fun m!1452871 () Bool)

(assert (=> b!1582387 m!1452871))

(assert (=> b!1582356 d!166967))

(declare-fun d!166973 () Bool)

(declare-fun res!1081079 () Bool)

(declare-fun e!883111 () Bool)

(assert (=> d!166973 (=> res!1081079 e!883111)))

(assert (=> d!166973 (= res!1081079 (and (is-Cons!36855 l!1356) (= (_1!12834 (h!38398 l!1356)) key!387)))))

(assert (=> d!166973 (= (containsKey!960 l!1356 key!387) e!883111)))

(declare-fun b!1582404 () Bool)

(declare-fun e!883112 () Bool)

(assert (=> b!1582404 (= e!883111 e!883112)))

(declare-fun res!1081080 () Bool)

(assert (=> b!1582404 (=> (not res!1081080) (not e!883112))))

(assert (=> b!1582404 (= res!1081080 (and (or (not (is-Cons!36855 l!1356)) (bvsle (_1!12834 (h!38398 l!1356)) key!387)) (is-Cons!36855 l!1356) (bvslt (_1!12834 (h!38398 l!1356)) key!387)))))

(declare-fun b!1582405 () Bool)

(assert (=> b!1582405 (= e!883112 (containsKey!960 (t!51773 l!1356) key!387))))

(assert (= (and d!166973 (not res!1081079)) b!1582404))

(assert (= (and b!1582404 res!1081080) b!1582405))

(assert (=> b!1582405 m!1452871))

(assert (=> b!1582354 d!166973))

(declare-fun d!166979 () Bool)

