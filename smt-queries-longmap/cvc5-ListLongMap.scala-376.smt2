; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7132 () Bool)

(assert start!7132)

(declare-fun b!45734 () Bool)

(declare-fun e!29113 () Bool)

(assert (=> b!45734 (= e!29113 (not true))))

(declare-datatypes ((B!836 0))(
  ( (B!837 (val!1005 Int)) )
))
(declare-datatypes ((tuple2!1658 0))(
  ( (tuple2!1659 (_1!840 (_ BitVec 64)) (_2!840 B!836)) )
))
(declare-datatypes ((List!1223 0))(
  ( (Nil!1220) (Cons!1219 (h!1799 tuple2!1658) (t!4248 List!1223)) )
))
(declare-fun l!812 () List!1223)

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun removeStrictlySorted!30 (List!1223 (_ BitVec 64)) List!1223)

(assert (=> b!45734 (= (removeStrictlySorted!30 (removeStrictlySorted!30 (t!4248 l!812) key1!43) key2!27) (removeStrictlySorted!30 (removeStrictlySorted!30 (t!4248 l!812) key2!27) key1!43))))

(declare-datatypes ((Unit!1309 0))(
  ( (Unit!1310) )
))
(declare-fun lt!20212 () Unit!1309)

(declare-fun lemmaRemoveStrictlySortedCommutative!10 (List!1223 (_ BitVec 64) (_ BitVec 64)) Unit!1309)

(assert (=> b!45734 (= lt!20212 (lemmaRemoveStrictlySortedCommutative!10 (t!4248 l!812) key1!43 key2!27))))

(declare-fun b!45733 () Bool)

(declare-fun res!26794 () Bool)

(assert (=> b!45733 (=> (not res!26794) (not e!29113))))

(declare-fun isStrictlySorted!220 (List!1223) Bool)

(assert (=> b!45733 (= res!26794 (isStrictlySorted!220 (t!4248 l!812)))))

(declare-fun res!26795 () Bool)

(assert (=> start!7132 (=> (not res!26795) (not e!29113))))

(assert (=> start!7132 (= res!26795 (isStrictlySorted!220 l!812))))

(assert (=> start!7132 e!29113))

(declare-fun e!29114 () Bool)

(assert (=> start!7132 e!29114))

(assert (=> start!7132 true))

(declare-fun b!45735 () Bool)

(declare-fun tp_is_empty!1933 () Bool)

(declare-fun tp!6002 () Bool)

(assert (=> b!45735 (= e!29114 (and tp_is_empty!1933 tp!6002))))

(declare-fun b!45732 () Bool)

(declare-fun res!26796 () Bool)

(assert (=> b!45732 (=> (not res!26796) (not e!29113))))

(assert (=> b!45732 (= res!26796 (is-Cons!1219 l!812))))

(assert (= (and start!7132 res!26795) b!45732))

(assert (= (and b!45732 res!26796) b!45733))

(assert (= (and b!45733 res!26794) b!45734))

(assert (= (and start!7132 (is-Cons!1219 l!812)) b!45735))

(declare-fun m!40287 () Bool)

(assert (=> b!45734 m!40287))

(declare-fun m!40289 () Bool)

(assert (=> b!45734 m!40289))

(declare-fun m!40291 () Bool)

(assert (=> b!45734 m!40291))

(assert (=> b!45734 m!40289))

(assert (=> b!45734 m!40287))

(declare-fun m!40293 () Bool)

(assert (=> b!45734 m!40293))

(declare-fun m!40295 () Bool)

(assert (=> b!45734 m!40295))

(declare-fun m!40297 () Bool)

(assert (=> b!45733 m!40297))

(declare-fun m!40299 () Bool)

(assert (=> start!7132 m!40299))

(push 1)

(assert (not b!45733))

(assert (not b!45735))

(assert (not start!7132))

(assert (not b!45734))

(assert tp_is_empty!1933)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

