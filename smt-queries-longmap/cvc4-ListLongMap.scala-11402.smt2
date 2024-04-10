; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132780 () Bool)

(assert start!132780)

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-fun b!1555585 () Bool)

(declare-datatypes ((B!2292 0))(
  ( (B!2293 (val!19232 Int)) )
))
(declare-datatypes ((tuple2!24840 0))(
  ( (tuple2!24841 (_1!12431 (_ BitVec 64)) (_2!12431 B!2292)) )
))
(declare-datatypes ((List!36266 0))(
  ( (Nil!36263) (Cons!36262 (h!37708 tuple2!24840) (t!50987 List!36266)) )
))
(declare-fun lt!670324 () List!36266)

(declare-fun e!866306 () Bool)

(declare-fun l!1177 () List!36266)

(declare-datatypes ((Option!850 0))(
  ( (Some!849 (v!22034 B!2292)) (None!848) )
))
(declare-fun getValueByKey!774 (List!36266 (_ BitVec 64)) Option!850)

(assert (=> b!1555585 (= e!866306 (= (getValueByKey!774 lt!670324 otherKey!50) (getValueByKey!774 (t!50987 l!1177) otherKey!50)))))

(declare-fun b!1555586 () Bool)

(declare-fun res!1064377 () Bool)

(declare-fun e!866305 () Bool)

(assert (=> b!1555586 (=> (not res!1064377) (not e!866305))))

(declare-fun newKey!105 () (_ BitVec 64))

(assert (=> b!1555586 (= res!1064377 (and (not (= newKey!105 otherKey!50)) (is-Cons!36262 l!1177) (not (= (_1!12431 (h!37708 l!1177)) otherKey!50))))))

(declare-fun b!1555587 () Bool)

(assert (=> b!1555587 (= e!866305 (not true))))

(declare-fun newValue!105 () B!2292)

(declare-fun lt!670325 () Bool)

(declare-fun containsKey!796 (List!36266 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!536 (List!36266 (_ BitVec 64) B!2292) List!36266)

(assert (=> b!1555587 (= lt!670325 (containsKey!796 (insertStrictlySorted!536 l!1177 newKey!105 newValue!105) otherKey!50))))

(assert (=> b!1555587 e!866306))

(declare-fun res!1064379 () Bool)

(assert (=> b!1555587 (=> (not res!1064379) (not e!866306))))

(assert (=> b!1555587 (= res!1064379 (= (containsKey!796 lt!670324 otherKey!50) (containsKey!796 (t!50987 l!1177) otherKey!50)))))

(assert (=> b!1555587 (= lt!670324 (insertStrictlySorted!536 (t!50987 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51836 0))(
  ( (Unit!51837) )
))
(declare-fun lt!670323 () Unit!51836)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!33 (List!36266 (_ BitVec 64) B!2292 (_ BitVec 64)) Unit!51836)

(assert (=> b!1555587 (= lt!670323 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!33 (t!50987 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1555588 () Bool)

(declare-fun e!866304 () Bool)

(declare-fun tp_is_empty!38303 () Bool)

(declare-fun tp!112296 () Bool)

(assert (=> b!1555588 (= e!866304 (and tp_is_empty!38303 tp!112296))))

(declare-fun b!1555589 () Bool)

(declare-fun res!1064378 () Bool)

(assert (=> b!1555589 (=> (not res!1064378) (not e!866305))))

(declare-fun isStrictlySorted!925 (List!36266) Bool)

(assert (=> b!1555589 (= res!1064378 (isStrictlySorted!925 (t!50987 l!1177)))))

(declare-fun res!1064380 () Bool)

(assert (=> start!132780 (=> (not res!1064380) (not e!866305))))

(assert (=> start!132780 (= res!1064380 (isStrictlySorted!925 l!1177))))

(assert (=> start!132780 e!866305))

(assert (=> start!132780 e!866304))

(assert (=> start!132780 true))

(assert (=> start!132780 tp_is_empty!38303))

(assert (= (and start!132780 res!1064380) b!1555586))

(assert (= (and b!1555586 res!1064377) b!1555589))

(assert (= (and b!1555589 res!1064378) b!1555587))

(assert (= (and b!1555587 res!1064379) b!1555585))

(assert (= (and start!132780 (is-Cons!36262 l!1177)) b!1555588))

(declare-fun m!1433551 () Bool)

(assert (=> b!1555585 m!1433551))

(declare-fun m!1433553 () Bool)

(assert (=> b!1555585 m!1433553))

(declare-fun m!1433555 () Bool)

(assert (=> b!1555587 m!1433555))

(declare-fun m!1433557 () Bool)

(assert (=> b!1555587 m!1433557))

(declare-fun m!1433559 () Bool)

(assert (=> b!1555587 m!1433559))

(declare-fun m!1433561 () Bool)

(assert (=> b!1555587 m!1433561))

(declare-fun m!1433563 () Bool)

(assert (=> b!1555587 m!1433563))

(assert (=> b!1555587 m!1433557))

(declare-fun m!1433565 () Bool)

(assert (=> b!1555587 m!1433565))

(declare-fun m!1433567 () Bool)

(assert (=> b!1555589 m!1433567))

(declare-fun m!1433569 () Bool)

(assert (=> start!132780 m!1433569))

(push 1)

(assert (not b!1555585))

(assert (not b!1555588))

(assert (not b!1555587))

(assert (not b!1555589))

(assert (not start!132780))

(assert tp_is_empty!38303)

(check-sat)

