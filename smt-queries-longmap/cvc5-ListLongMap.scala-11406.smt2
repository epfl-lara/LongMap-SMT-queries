; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132812 () Bool)

(assert start!132812)

(declare-fun res!1064446 () Bool)

(declare-fun e!866425 () Bool)

(assert (=> start!132812 (=> (not res!1064446) (not e!866425))))

(declare-datatypes ((B!2312 0))(
  ( (B!2313 (val!19242 Int)) )
))
(declare-datatypes ((tuple2!24860 0))(
  ( (tuple2!24861 (_1!12441 (_ BitVec 64)) (_2!12441 B!2312)) )
))
(declare-datatypes ((List!36276 0))(
  ( (Nil!36273) (Cons!36272 (h!37718 tuple2!24860) (t!50997 List!36276)) )
))
(declare-fun l!1177 () List!36276)

(declare-fun isStrictlySorted!929 (List!36276) Bool)

(assert (=> start!132812 (= res!1064446 (isStrictlySorted!929 l!1177))))

(assert (=> start!132812 e!866425))

(declare-fun e!866426 () Bool)

(assert (=> start!132812 e!866426))

(assert (=> start!132812 true))

(declare-fun tp_is_empty!38323 () Bool)

(assert (=> start!132812 tp_is_empty!38323))

(declare-fun b!1555770 () Bool)

(declare-fun res!1064445 () Bool)

(assert (=> b!1555770 (=> (not res!1064445) (not e!866425))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(assert (=> b!1555770 (= res!1064445 (and (not (= newKey!105 otherKey!50)) (or (not (is-Cons!36272 l!1177)) (= (_1!12441 (h!37718 l!1177)) otherKey!50))))))

(declare-fun b!1555771 () Bool)

(assert (=> b!1555771 (= e!866425 false)))

(declare-fun lt!670337 () Bool)

(declare-fun newValue!105 () B!2312)

(declare-fun containsKey!800 (List!36276 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!540 (List!36276 (_ BitVec 64) B!2312) List!36276)

(assert (=> b!1555771 (= lt!670337 (containsKey!800 (insertStrictlySorted!540 l!1177 newKey!105 newValue!105) otherKey!50))))

(declare-fun b!1555772 () Bool)

(declare-fun tp!112335 () Bool)

(assert (=> b!1555772 (= e!866426 (and tp_is_empty!38323 tp!112335))))

(assert (= (and start!132812 res!1064446) b!1555770))

(assert (= (and b!1555770 res!1064445) b!1555771))

(assert (= (and start!132812 (is-Cons!36272 l!1177)) b!1555772))

(declare-fun m!1433631 () Bool)

(assert (=> start!132812 m!1433631))

(declare-fun m!1433633 () Bool)

(assert (=> b!1555771 m!1433633))

(assert (=> b!1555771 m!1433633))

(declare-fun m!1433635 () Bool)

(assert (=> b!1555771 m!1433635))

(push 1)

(assert (not b!1555771))

(assert (not start!132812))

(assert (not b!1555772))

(assert tp_is_empty!38323)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

