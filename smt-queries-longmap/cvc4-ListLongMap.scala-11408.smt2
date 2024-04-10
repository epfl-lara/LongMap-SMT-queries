; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132846 () Bool)

(assert start!132846)

(declare-fun res!1064569 () Bool)

(declare-fun e!866584 () Bool)

(assert (=> start!132846 (=> (not res!1064569) (not e!866584))))

(declare-datatypes ((B!2328 0))(
  ( (B!2329 (val!19250 Int)) )
))
(declare-datatypes ((tuple2!24876 0))(
  ( (tuple2!24877 (_1!12449 (_ BitVec 64)) (_2!12449 B!2328)) )
))
(declare-datatypes ((List!36284 0))(
  ( (Nil!36281) (Cons!36280 (h!37726 tuple2!24876) (t!51005 List!36284)) )
))
(declare-fun l!1177 () List!36284)

(declare-fun isStrictlySorted!937 (List!36284) Bool)

(assert (=> start!132846 (= res!1064569 (isStrictlySorted!937 l!1177))))

(assert (=> start!132846 e!866584))

(declare-fun e!866585 () Bool)

(assert (=> start!132846 e!866585))

(assert (=> start!132846 true))

(declare-fun tp_is_empty!38339 () Bool)

(assert (=> start!132846 tp_is_empty!38339))

(declare-fun b!1556004 () Bool)

(declare-fun res!1064568 () Bool)

(assert (=> b!1556004 (=> (not res!1064568) (not e!866584))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(assert (=> b!1556004 (= res!1064568 (and (not (= newKey!105 otherKey!50)) (or (not (is-Cons!36280 l!1177)) (= (_1!12449 (h!37726 l!1177)) otherKey!50))))))

(declare-fun b!1556005 () Bool)

(assert (=> b!1556005 (= e!866584 false)))

(declare-fun newValue!105 () B!2328)

(declare-fun lt!670370 () Bool)

(declare-fun containsKey!808 (List!36284 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!548 (List!36284 (_ BitVec 64) B!2328) List!36284)

(assert (=> b!1556005 (= lt!670370 (containsKey!808 (insertStrictlySorted!548 l!1177 newKey!105 newValue!105) otherKey!50))))

(declare-fun b!1556006 () Bool)

(declare-fun tp!112368 () Bool)

(assert (=> b!1556006 (= e!866585 (and tp_is_empty!38339 tp!112368))))

(assert (= (and start!132846 res!1064569) b!1556004))

(assert (= (and b!1556004 res!1064568) b!1556005))

(assert (= (and start!132846 (is-Cons!36280 l!1177)) b!1556006))

(declare-fun m!1433745 () Bool)

(assert (=> start!132846 m!1433745))

(declare-fun m!1433747 () Bool)

(assert (=> b!1556005 m!1433747))

(assert (=> b!1556005 m!1433747))

(declare-fun m!1433749 () Bool)

(assert (=> b!1556005 m!1433749))

(push 1)

(assert (not start!132846))

(assert (not b!1556005))

(assert (not b!1556006))

(assert tp_is_empty!38339)

(check-sat)

(pop 1)

(push 1)

(check-sat)

