; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133112 () Bool)

(assert start!133112)

(declare-fun res!1065384 () Bool)

(declare-fun e!867674 () Bool)

(assert (=> start!133112 (=> (not res!1065384) (not e!867674))))

(declare-datatypes ((B!2396 0))(
  ( (B!2397 (val!19284 Int)) )
))
(declare-datatypes ((tuple2!24944 0))(
  ( (tuple2!24945 (_1!12483 (_ BitVec 64)) (_2!12483 B!2396)) )
))
(declare-datatypes ((List!36318 0))(
  ( (Nil!36315) (Cons!36314 (h!37760 tuple2!24944) (t!51045 List!36318)) )
))
(declare-fun l!1292 () List!36318)

(declare-fun isStrictlySorted!961 (List!36318) Bool)

(assert (=> start!133112 (= res!1065384 (isStrictlySorted!961 l!1292))))

(assert (=> start!133112 e!867674))

(declare-fun e!867673 () Bool)

(assert (=> start!133112 e!867673))

(assert (=> start!133112 true))

(declare-fun tp_is_empty!38401 () Bool)

(assert (=> start!133112 tp_is_empty!38401))

(declare-fun b!1557633 () Bool)

(declare-fun tp!112548 () Bool)

(assert (=> b!1557633 (= e!867673 (and tp_is_empty!38401 tp!112548))))

(declare-fun b!1557634 () Bool)

(declare-fun res!1065383 () Bool)

(assert (=> b!1557634 (=> (not res!1065383) (not e!867674))))

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun newKey!135 () (_ BitVec 64))

(assert (=> b!1557634 (= res!1065383 (and (not (= otherKey!62 newKey!135)) (is-Cons!36314 l!1292) (not (= (_1!12483 (h!37760 l!1292)) otherKey!62))))))

(declare-fun b!1557635 () Bool)

(assert (=> b!1557635 (= e!867674 (not true))))

(declare-fun newValue!135 () B!2396)

(declare-fun containsKey!824 (List!36318 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!561 (List!36318 (_ BitVec 64) B!2396) List!36318)

(assert (=> b!1557635 (containsKey!824 (insertStrictlySorted!561 (t!51045 l!1292) newKey!135 newValue!135) otherKey!62)))

(declare-datatypes ((Unit!51876 0))(
  ( (Unit!51877) )
))
(declare-fun lt!670718 () Unit!51876)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!4 (List!36318 (_ BitVec 64) B!2396 (_ BitVec 64)) Unit!51876)

(assert (=> b!1557635 (= lt!670718 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!4 (t!51045 l!1292) newKey!135 newValue!135 otherKey!62))))

(declare-fun b!1557636 () Bool)

(declare-fun res!1065382 () Bool)

(assert (=> b!1557636 (=> (not res!1065382) (not e!867674))))

(assert (=> b!1557636 (= res!1065382 (isStrictlySorted!961 (t!51045 l!1292)))))

(declare-fun b!1557637 () Bool)

(declare-fun res!1065385 () Bool)

(assert (=> b!1557637 (=> (not res!1065385) (not e!867674))))

(assert (=> b!1557637 (= res!1065385 (containsKey!824 (t!51045 l!1292) otherKey!62))))

(declare-fun b!1557638 () Bool)

(declare-fun res!1065381 () Bool)

(assert (=> b!1557638 (=> (not res!1065381) (not e!867674))))

(assert (=> b!1557638 (= res!1065381 (containsKey!824 l!1292 otherKey!62))))

(assert (= (and start!133112 res!1065384) b!1557638))

(assert (= (and b!1557638 res!1065381) b!1557634))

(assert (= (and b!1557634 res!1065383) b!1557636))

(assert (= (and b!1557636 res!1065382) b!1557637))

(assert (= (and b!1557637 res!1065385) b!1557635))

(assert (= (and start!133112 (is-Cons!36314 l!1292)) b!1557633))

(declare-fun m!1434717 () Bool)

(assert (=> start!133112 m!1434717))

(declare-fun m!1434719 () Bool)

(assert (=> b!1557637 m!1434719))

(declare-fun m!1434721 () Bool)

(assert (=> b!1557636 m!1434721))

(declare-fun m!1434723 () Bool)

(assert (=> b!1557635 m!1434723))

(assert (=> b!1557635 m!1434723))

(declare-fun m!1434725 () Bool)

(assert (=> b!1557635 m!1434725))

(declare-fun m!1434727 () Bool)

(assert (=> b!1557635 m!1434727))

(declare-fun m!1434729 () Bool)

(assert (=> b!1557638 m!1434729))

(push 1)

(assert tp_is_empty!38401)

(assert (not b!1557633))

(assert (not b!1557638))

(assert (not start!133112))

(assert (not b!1557636))

(assert (not b!1557637))

(assert (not b!1557635))

(check-sat)

(pop 1)

