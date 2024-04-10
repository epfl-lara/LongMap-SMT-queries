; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137622 () Bool)

(assert start!137622)

(declare-datatypes ((B!2750 0))(
  ( (B!2751 (val!19737 Int)) )
))
(declare-fun value!184 () B!2750)

(declare-fun key!387 () (_ BitVec 64))

(declare-fun b!1582332 () Bool)

(declare-fun e!883051 () Bool)

(declare-datatypes ((tuple2!25642 0))(
  ( (tuple2!25643 (_1!12832 (_ BitVec 64)) (_2!12832 B!2750)) )
))
(declare-datatypes ((List!36857 0))(
  ( (Nil!36854) (Cons!36853 (h!38396 tuple2!25642) (t!51771 List!36857)) )
))
(declare-fun l!1356 () List!36857)

(declare-fun contains!10517 (List!36857 tuple2!25642) Bool)

(assert (=> b!1582332 (= e!883051 (contains!10517 l!1356 (tuple2!25643 key!387 value!184)))))

(declare-datatypes ((Unit!52258 0))(
  ( (Unit!52259) )
))
(declare-fun lt!677067 () Unit!52258)

(declare-fun lemmaNotContainsKeyThenNotContainsTuple!7 (List!36857 (_ BitVec 64) B!2750) Unit!52258)

(assert (=> b!1582332 (= lt!677067 (lemmaNotContainsKeyThenNotContainsTuple!7 (t!51771 l!1356) key!387 value!184))))

(declare-fun b!1582330 () Bool)

(declare-fun res!1081012 () Bool)

(assert (=> b!1582330 (=> (not res!1081012) (not e!883051))))

(declare-fun containsKey!958 (List!36857 (_ BitVec 64)) Bool)

(assert (=> b!1582330 (= res!1081012 (not (containsKey!958 l!1356 key!387)))))

(declare-fun res!1081013 () Bool)

(assert (=> start!137622 (=> (not res!1081013) (not e!883051))))

(declare-fun isStrictlySorted!1112 (List!36857) Bool)

(assert (=> start!137622 (= res!1081013 (isStrictlySorted!1112 l!1356))))

(assert (=> start!137622 e!883051))

(declare-fun e!883052 () Bool)

(assert (=> start!137622 e!883052))

(assert (=> start!137622 true))

(declare-fun tp_is_empty!39295 () Bool)

(assert (=> start!137622 tp_is_empty!39295))

(declare-fun b!1582333 () Bool)

(declare-fun tp!114713 () Bool)

(assert (=> b!1582333 (= e!883052 (and tp_is_empty!39295 tp!114713))))

(declare-fun b!1582331 () Bool)

(declare-fun res!1081014 () Bool)

(assert (=> b!1582331 (=> (not res!1081014) (not e!883051))))

(assert (=> b!1582331 (= res!1081014 (not (is-Nil!36854 l!1356)))))

(assert (= (and start!137622 res!1081013) b!1582330))

(assert (= (and b!1582330 res!1081012) b!1582331))

(assert (= (and b!1582331 res!1081014) b!1582332))

(assert (= (and start!137622 (is-Cons!36853 l!1356)) b!1582333))

(declare-fun m!1452821 () Bool)

(assert (=> b!1582332 m!1452821))

(declare-fun m!1452823 () Bool)

(assert (=> b!1582332 m!1452823))

(declare-fun m!1452825 () Bool)

(assert (=> b!1582330 m!1452825))

(declare-fun m!1452827 () Bool)

(assert (=> start!137622 m!1452827))

(push 1)

(assert (not start!137622))

(assert tp_is_empty!39295)

(assert (not b!1582330))

(assert (not b!1582333))

(assert (not b!1582332))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166957 () Bool)

(declare-fun res!1081045 () Bool)

(declare-fun e!883077 () Bool)

(assert (=> d!166957 (=> res!1081045 e!883077)))

(assert (=> d!166957 (= res!1081045 (or (is-Nil!36854 l!1356) (is-Nil!36854 (t!51771 l!1356))))))

(assert (=> d!166957 (= (isStrictlySorted!1112 l!1356) e!883077)))

(declare-fun b!1582370 () Bool)

(declare-fun e!883078 () Bool)

(assert (=> b!1582370 (= e!883077 e!883078)))

(declare-fun res!1081046 () Bool)

(assert (=> b!1582370 (=> (not res!1081046) (not e!883078))))

(assert (=> b!1582370 (= res!1081046 (bvslt (_1!12832 (h!38396 l!1356)) (_1!12832 (h!38396 (t!51771 l!1356)))))))

(declare-fun b!1582371 () Bool)

(assert (=> b!1582371 (= e!883078 (isStrictlySorted!1112 (t!51771 l!1356)))))

(assert (= (and d!166957 (not res!1081045)) b!1582370))

(assert (= (and b!1582370 res!1081046) b!1582371))

(declare-fun m!1452845 () Bool)

(assert (=> b!1582371 m!1452845))

(assert (=> start!137622 d!166957))

(declare-fun d!166963 () Bool)

(declare-fun res!1081055 () Bool)

(declare-fun e!883087 () Bool)

(assert (=> d!166963 (=> res!1081055 e!883087)))

(assert (=> d!166963 (= res!1081055 (and (is-Cons!36853 l!1356) (= (_1!12832 (h!38396 l!1356)) key!387)))))

(assert (=> d!166963 (= (containsKey!958 l!1356 key!387) e!883087)))

(declare-fun b!1582380 () Bool)

(declare-fun e!883088 () Bool)

(assert (=> b!1582380 (= e!883087 e!883088)))

(declare-fun res!1081056 () Bool)

(assert (=> b!1582380 (=> (not res!1081056) (not e!883088))))

(assert (=> b!1582380 (= res!1081056 (and (or (not (is-Cons!36853 l!1356)) (bvsle (_1!12832 (h!38396 l!1356)) key!387)) (is-Cons!36853 l!1356) (bvslt (_1!12832 (h!38396 l!1356)) key!387)))))

(declare-fun b!1582381 () Bool)

(assert (=> b!1582381 (= e!883088 (containsKey!958 (t!51771 l!1356) key!387))))

(assert (= (and d!166963 (not res!1081055)) b!1582380))

(assert (= (and b!1582380 res!1081056) b!1582381))

(declare-fun m!1452859 () Bool)

(assert (=> b!1582381 m!1452859))

(assert (=> b!1582330 d!166963))

(declare-fun d!166969 () Bool)

(declare-fun lt!677088 () Bool)

(declare-fun content!860 (List!36857) (Set tuple2!25642))

(assert (=> d!166969 (= lt!677088 (set.member (tuple2!25643 key!387 value!184) (content!860 l!1356)))))

(declare-fun e!883102 () Bool)

(assert (=> d!166969 (= lt!677088 e!883102)))

(declare-fun res!1081070 () Bool)

(assert (=> d!166969 (=> (not res!1081070) (not e!883102))))

(assert (=> d!166969 (= res!1081070 (is-Cons!36853 l!1356))))

(assert (=> d!166969 (= (contains!10517 l!1356 (tuple2!25643 key!387 value!184)) lt!677088)))

(declare-fun b!1582392 () Bool)

(declare-fun e!883101 () Bool)

(assert (=> b!1582392 (= e!883102 e!883101)))

(declare-fun res!1081069 () Bool)

(assert (=> b!1582392 (=> res!1081069 e!883101)))

(assert (=> b!1582392 (= res!1081069 (= (h!38396 l!1356) (tuple2!25643 key!387 value!184)))))

(declare-fun b!1582393 () Bool)

(assert (=> b!1582393 (= e!883101 (contains!10517 (t!51771 l!1356) (tuple2!25643 key!387 value!184)))))

(assert (= (and d!166969 res!1081070) b!1582392))

(assert (= (and b!1582392 (not res!1081069)) b!1582393))

(declare-fun m!1452873 () Bool)

(assert (=> d!166969 m!1452873))

(declare-fun m!1452875 () Bool)

(assert (=> d!166969 m!1452875))

(declare-fun m!1452877 () Bool)

(assert (=> b!1582393 m!1452877))

(assert (=> b!1582332 d!166969))

(declare-fun d!166975 () Bool)

(assert (=> d!166975 (not (contains!10517 (t!51771 l!1356) (tuple2!25643 key!387 value!184)))))

(declare-fun lt!677091 () Unit!52258)

(declare-fun choose!2103 (List!36857 (_ BitVec 64) B!2750) Unit!52258)

(assert (=> d!166975 (= lt!677091 (choose!2103 (t!51771 l!1356) key!387 value!184))))

(declare-fun e!883123 () Bool)

(assert (=> d!166975 e!883123))

(declare-fun res!1081091 () Bool)

(assert (=> d!166975 (=> (not res!1081091) (not e!883123))))

(assert (=> d!166975 (= res!1081091 (isStrictlySorted!1112 (t!51771 l!1356)))))

(assert (=> d!166975 (= (lemmaNotContainsKeyThenNotContainsTuple!7 (t!51771 l!1356) key!387 value!184) lt!677091)))

(declare-fun b!1582416 () Bool)

(assert (=> b!1582416 (= e!883123 (not (containsKey!958 (t!51771 l!1356) key!387)))))

(assert (= (and d!166975 res!1081091) b!1582416))

(assert (=> d!166975 m!1452877))

(declare-fun m!1452879 () Bool)

(assert (=> d!166975 m!1452879))

(assert (=> d!166975 m!1452845))

(assert (=> b!1582416 m!1452859))

(assert (=> b!1582332 d!166975))

(declare-fun b!1582429 () Bool)

(declare-fun e!883132 () Bool)

(declare-fun tp!114724 () Bool)

(assert (=> b!1582429 (= e!883132 (and tp_is_empty!39295 tp!114724))))

(assert (=> b!1582333 (= tp!114713 e!883132)))

(assert (= (and b!1582333 (is-Cons!36853 (t!51771 l!1356))) b!1582429))

(push 1)

