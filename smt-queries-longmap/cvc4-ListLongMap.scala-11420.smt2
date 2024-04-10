; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133116 () Bool)

(assert start!133116)

(declare-fun b!1557669 () Bool)

(declare-fun res!1065415 () Bool)

(declare-fun e!867685 () Bool)

(assert (=> b!1557669 (=> (not res!1065415) (not e!867685))))

(declare-datatypes ((B!2400 0))(
  ( (B!2401 (val!19286 Int)) )
))
(declare-datatypes ((tuple2!24948 0))(
  ( (tuple2!24949 (_1!12485 (_ BitVec 64)) (_2!12485 B!2400)) )
))
(declare-datatypes ((List!36320 0))(
  ( (Nil!36317) (Cons!36316 (h!37762 tuple2!24948) (t!51047 List!36320)) )
))
(declare-fun l!1292 () List!36320)

(declare-fun isStrictlySorted!963 (List!36320) Bool)

(assert (=> b!1557669 (= res!1065415 (isStrictlySorted!963 (t!51047 l!1292)))))

(declare-fun res!1065412 () Bool)

(assert (=> start!133116 (=> (not res!1065412) (not e!867685))))

(assert (=> start!133116 (= res!1065412 (isStrictlySorted!963 l!1292))))

(assert (=> start!133116 e!867685))

(declare-fun e!867686 () Bool)

(assert (=> start!133116 e!867686))

(assert (=> start!133116 true))

(declare-fun tp_is_empty!38405 () Bool)

(assert (=> start!133116 tp_is_empty!38405))

(declare-fun b!1557670 () Bool)

(declare-fun res!1065413 () Bool)

(assert (=> b!1557670 (=> (not res!1065413) (not e!867685))))

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun newKey!135 () (_ BitVec 64))

(assert (=> b!1557670 (= res!1065413 (and (not (= otherKey!62 newKey!135)) (is-Cons!36316 l!1292) (not (= (_1!12485 (h!37762 l!1292)) otherKey!62))))))

(declare-fun b!1557671 () Bool)

(assert (=> b!1557671 (= e!867685 (not true))))

(declare-fun newValue!135 () B!2400)

(declare-fun containsKey!826 (List!36320 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!563 (List!36320 (_ BitVec 64) B!2400) List!36320)

(assert (=> b!1557671 (containsKey!826 (insertStrictlySorted!563 (t!51047 l!1292) newKey!135 newValue!135) otherKey!62)))

(declare-datatypes ((Unit!51880 0))(
  ( (Unit!51881) )
))
(declare-fun lt!670724 () Unit!51880)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!6 (List!36320 (_ BitVec 64) B!2400 (_ BitVec 64)) Unit!51880)

(assert (=> b!1557671 (= lt!670724 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!6 (t!51047 l!1292) newKey!135 newValue!135 otherKey!62))))

(declare-fun b!1557672 () Bool)

(declare-fun res!1065411 () Bool)

(assert (=> b!1557672 (=> (not res!1065411) (not e!867685))))

(assert (=> b!1557672 (= res!1065411 (containsKey!826 (t!51047 l!1292) otherKey!62))))

(declare-fun b!1557673 () Bool)

(declare-fun res!1065414 () Bool)

(assert (=> b!1557673 (=> (not res!1065414) (not e!867685))))

(assert (=> b!1557673 (= res!1065414 (containsKey!826 l!1292 otherKey!62))))

(declare-fun b!1557674 () Bool)

(declare-fun tp!112554 () Bool)

(assert (=> b!1557674 (= e!867686 (and tp_is_empty!38405 tp!112554))))

(assert (= (and start!133116 res!1065412) b!1557673))

(assert (= (and b!1557673 res!1065414) b!1557670))

(assert (= (and b!1557670 res!1065413) b!1557669))

(assert (= (and b!1557669 res!1065415) b!1557672))

(assert (= (and b!1557672 res!1065411) b!1557671))

(assert (= (and start!133116 (is-Cons!36316 l!1292)) b!1557674))

(declare-fun m!1434745 () Bool)

(assert (=> b!1557669 m!1434745))

(declare-fun m!1434747 () Bool)

(assert (=> b!1557672 m!1434747))

(declare-fun m!1434749 () Bool)

(assert (=> b!1557671 m!1434749))

(assert (=> b!1557671 m!1434749))

(declare-fun m!1434751 () Bool)

(assert (=> b!1557671 m!1434751))

(declare-fun m!1434753 () Bool)

(assert (=> b!1557671 m!1434753))

(declare-fun m!1434755 () Bool)

(assert (=> b!1557673 m!1434755))

(declare-fun m!1434757 () Bool)

(assert (=> start!133116 m!1434757))

(push 1)

(assert (not b!1557674))

(assert (not b!1557672))

(assert (not b!1557669))

(assert tp_is_empty!38405)

(assert (not b!1557673))

(assert (not b!1557671))

(assert (not start!133116))

(check-sat)

