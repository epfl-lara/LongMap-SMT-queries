; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7102 () Bool)

(assert start!7102)

(declare-fun b!45513 () Bool)

(declare-fun e!28976 () Bool)

(declare-fun tp_is_empty!1921 () Bool)

(declare-fun tp!5975 () Bool)

(assert (=> b!45513 (= e!28976 (and tp_is_empty!1921 tp!5975))))

(declare-fun res!26690 () Bool)

(declare-fun e!28975 () Bool)

(assert (=> start!7102 (=> (not res!26690) (not e!28975))))

(declare-datatypes ((B!824 0))(
  ( (B!825 (val!999 Int)) )
))
(declare-datatypes ((tuple2!1646 0))(
  ( (tuple2!1647 (_1!834 (_ BitVec 64)) (_2!834 B!824)) )
))
(declare-datatypes ((List!1217 0))(
  ( (Nil!1214) (Cons!1213 (h!1793 tuple2!1646) (t!4242 List!1217)) )
))
(declare-fun l!812 () List!1217)

(declare-fun isStrictlySorted!214 (List!1217) Bool)

(assert (=> start!7102 (= res!26690 (isStrictlySorted!214 l!812))))

(assert (=> start!7102 e!28975))

(assert (=> start!7102 e!28976))

(assert (=> start!7102 true))

(declare-fun b!45510 () Bool)

(declare-fun res!26691 () Bool)

(assert (=> b!45510 (=> (not res!26691) (not e!28975))))

(assert (=> b!45510 (= res!26691 (is-Cons!1213 l!812))))

(declare-fun b!45512 () Bool)

(assert (=> b!45512 (= e!28975 (not true))))

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun removeStrictlySorted!24 (List!1217 (_ BitVec 64)) List!1217)

(assert (=> b!45512 (= (removeStrictlySorted!24 (removeStrictlySorted!24 (t!4242 l!812) key1!43) key2!27) (removeStrictlySorted!24 (removeStrictlySorted!24 (t!4242 l!812) key2!27) key1!43))))

(declare-datatypes ((Unit!1297 0))(
  ( (Unit!1298) )
))
(declare-fun lt!20164 () Unit!1297)

(declare-fun lemmaRemoveStrictlySortedCommutative!4 (List!1217 (_ BitVec 64) (_ BitVec 64)) Unit!1297)

(assert (=> b!45512 (= lt!20164 (lemmaRemoveStrictlySortedCommutative!4 (t!4242 l!812) key1!43 key2!27))))

(declare-fun b!45511 () Bool)

(declare-fun res!26689 () Bool)

(assert (=> b!45511 (=> (not res!26689) (not e!28975))))

(assert (=> b!45511 (= res!26689 (isStrictlySorted!214 (t!4242 l!812)))))

(assert (= (and start!7102 res!26690) b!45510))

(assert (= (and b!45510 res!26691) b!45511))

(assert (= (and b!45511 res!26689) b!45512))

(assert (= (and start!7102 (is-Cons!1213 l!812)) b!45513))

(declare-fun m!40047 () Bool)

(assert (=> start!7102 m!40047))

(declare-fun m!40049 () Bool)

(assert (=> b!45512 m!40049))

(declare-fun m!40051 () Bool)

(assert (=> b!45512 m!40051))

(declare-fun m!40053 () Bool)

(assert (=> b!45512 m!40053))

(assert (=> b!45512 m!40051))

(assert (=> b!45512 m!40049))

(declare-fun m!40055 () Bool)

(assert (=> b!45512 m!40055))

(declare-fun m!40057 () Bool)

(assert (=> b!45512 m!40057))

(declare-fun m!40059 () Bool)

(assert (=> b!45511 m!40059))

(push 1)

(assert (not b!45513))

(assert tp_is_empty!1921)

(assert (not b!45512))

(assert (not start!7102))

(assert (not b!45511))

(check-sat)

(pop 1)

