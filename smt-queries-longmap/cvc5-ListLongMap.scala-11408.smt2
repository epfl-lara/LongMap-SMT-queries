; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132842 () Bool)

(assert start!132842)

(declare-fun res!1064556 () Bool)

(declare-fun e!866572 () Bool)

(assert (=> start!132842 (=> (not res!1064556) (not e!866572))))

(declare-datatypes ((B!2324 0))(
  ( (B!2325 (val!19248 Int)) )
))
(declare-datatypes ((tuple2!24872 0))(
  ( (tuple2!24873 (_1!12447 (_ BitVec 64)) (_2!12447 B!2324)) )
))
(declare-datatypes ((List!36282 0))(
  ( (Nil!36279) (Cons!36278 (h!37724 tuple2!24872) (t!51003 List!36282)) )
))
(declare-fun l!1177 () List!36282)

(declare-fun isStrictlySorted!935 (List!36282) Bool)

(assert (=> start!132842 (= res!1064556 (isStrictlySorted!935 l!1177))))

(assert (=> start!132842 e!866572))

(declare-fun e!866573 () Bool)

(assert (=> start!132842 e!866573))

(assert (=> start!132842 true))

(declare-fun tp_is_empty!38335 () Bool)

(assert (=> start!132842 tp_is_empty!38335))

(declare-fun b!1555986 () Bool)

(declare-fun res!1064557 () Bool)

(assert (=> b!1555986 (=> (not res!1064557) (not e!866572))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(assert (=> b!1555986 (= res!1064557 (and (not (= newKey!105 otherKey!50)) (or (not (is-Cons!36278 l!1177)) (= (_1!12447 (h!37724 l!1177)) otherKey!50))))))

(declare-fun b!1555987 () Bool)

(assert (=> b!1555987 (= e!866572 false)))

(declare-fun lt!670364 () Bool)

(declare-fun newValue!105 () B!2324)

(declare-fun containsKey!806 (List!36282 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!546 (List!36282 (_ BitVec 64) B!2324) List!36282)

(assert (=> b!1555987 (= lt!670364 (containsKey!806 (insertStrictlySorted!546 l!1177 newKey!105 newValue!105) otherKey!50))))

(declare-fun b!1555988 () Bool)

(declare-fun tp!112362 () Bool)

(assert (=> b!1555988 (= e!866573 (and tp_is_empty!38335 tp!112362))))

(assert (= (and start!132842 res!1064556) b!1555986))

(assert (= (and b!1555986 res!1064557) b!1555987))

(assert (= (and start!132842 (is-Cons!36278 l!1177)) b!1555988))

(declare-fun m!1433733 () Bool)

(assert (=> start!132842 m!1433733))

(declare-fun m!1433735 () Bool)

(assert (=> b!1555987 m!1433735))

(assert (=> b!1555987 m!1433735))

(declare-fun m!1433737 () Bool)

(assert (=> b!1555987 m!1433737))

(push 1)

(assert (not b!1555987))

(assert (not start!132842))

(assert (not b!1555988))

(assert tp_is_empty!38335)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

