; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7106 () Bool)

(assert start!7106)

(declare-fun res!26708 () Bool)

(declare-fun e!28988 () Bool)

(assert (=> start!7106 (=> (not res!26708) (not e!28988))))

(declare-datatypes ((B!828 0))(
  ( (B!829 (val!1001 Int)) )
))
(declare-datatypes ((tuple2!1650 0))(
  ( (tuple2!1651 (_1!836 (_ BitVec 64)) (_2!836 B!828)) )
))
(declare-datatypes ((List!1219 0))(
  ( (Nil!1216) (Cons!1215 (h!1795 tuple2!1650) (t!4244 List!1219)) )
))
(declare-fun l!812 () List!1219)

(declare-fun isStrictlySorted!216 (List!1219) Bool)

(assert (=> start!7106 (= res!26708 (isStrictlySorted!216 l!812))))

(assert (=> start!7106 e!28988))

(declare-fun e!28987 () Bool)

(assert (=> start!7106 e!28987))

(assert (=> start!7106 true))

(declare-fun b!45535 () Bool)

(declare-fun res!26707 () Bool)

(assert (=> b!45535 (=> (not res!26707) (not e!28988))))

(assert (=> b!45535 (= res!26707 (isStrictlySorted!216 (t!4244 l!812)))))

(declare-fun b!45534 () Bool)

(declare-fun res!26709 () Bool)

(assert (=> b!45534 (=> (not res!26709) (not e!28988))))

(assert (=> b!45534 (= res!26709 (is-Cons!1215 l!812))))

(declare-fun b!45536 () Bool)

(assert (=> b!45536 (= e!28988 (not true))))

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun removeStrictlySorted!26 (List!1219 (_ BitVec 64)) List!1219)

(assert (=> b!45536 (= (removeStrictlySorted!26 (removeStrictlySorted!26 (t!4244 l!812) key1!43) key2!27) (removeStrictlySorted!26 (removeStrictlySorted!26 (t!4244 l!812) key2!27) key1!43))))

(declare-datatypes ((Unit!1301 0))(
  ( (Unit!1302) )
))
(declare-fun lt!20170 () Unit!1301)

(declare-fun lemmaRemoveStrictlySortedCommutative!6 (List!1219 (_ BitVec 64) (_ BitVec 64)) Unit!1301)

(assert (=> b!45536 (= lt!20170 (lemmaRemoveStrictlySortedCommutative!6 (t!4244 l!812) key1!43 key2!27))))

(declare-fun b!45537 () Bool)

(declare-fun tp_is_empty!1925 () Bool)

(declare-fun tp!5981 () Bool)

(assert (=> b!45537 (= e!28987 (and tp_is_empty!1925 tp!5981))))

(assert (= (and start!7106 res!26708) b!45534))

(assert (= (and b!45534 res!26709) b!45535))

(assert (= (and b!45535 res!26707) b!45536))

(assert (= (and start!7106 (is-Cons!1215 l!812)) b!45537))

(declare-fun m!40075 () Bool)

(assert (=> start!7106 m!40075))

(declare-fun m!40077 () Bool)

(assert (=> b!45535 m!40077))

(declare-fun m!40079 () Bool)

(assert (=> b!45536 m!40079))

(declare-fun m!40081 () Bool)

(assert (=> b!45536 m!40081))

(declare-fun m!40083 () Bool)

(assert (=> b!45536 m!40083))

(assert (=> b!45536 m!40081))

(assert (=> b!45536 m!40079))

(declare-fun m!40085 () Bool)

(assert (=> b!45536 m!40085))

(declare-fun m!40087 () Bool)

(assert (=> b!45536 m!40087))

(push 1)

(assert (not start!7106))

(assert (not b!45536))

(assert (not b!45535))

(assert (not b!45537))

(assert tp_is_empty!1925)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

