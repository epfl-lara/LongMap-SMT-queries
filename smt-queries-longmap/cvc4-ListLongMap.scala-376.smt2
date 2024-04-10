; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7136 () Bool)

(assert start!7136)

(declare-fun res!26812 () Bool)

(declare-fun e!29125 () Bool)

(assert (=> start!7136 (=> (not res!26812) (not e!29125))))

(declare-datatypes ((B!840 0))(
  ( (B!841 (val!1007 Int)) )
))
(declare-datatypes ((tuple2!1662 0))(
  ( (tuple2!1663 (_1!842 (_ BitVec 64)) (_2!842 B!840)) )
))
(declare-datatypes ((List!1225 0))(
  ( (Nil!1222) (Cons!1221 (h!1801 tuple2!1662) (t!4250 List!1225)) )
))
(declare-fun l!812 () List!1225)

(declare-fun isStrictlySorted!222 (List!1225) Bool)

(assert (=> start!7136 (= res!26812 (isStrictlySorted!222 l!812))))

(assert (=> start!7136 e!29125))

(declare-fun e!29126 () Bool)

(assert (=> start!7136 e!29126))

(assert (=> start!7136 true))

(declare-fun b!45759 () Bool)

(declare-fun tp_is_empty!1937 () Bool)

(declare-fun tp!6008 () Bool)

(assert (=> b!45759 (= e!29126 (and tp_is_empty!1937 tp!6008))))

(declare-fun b!45757 () Bool)

(declare-fun res!26813 () Bool)

(assert (=> b!45757 (=> (not res!26813) (not e!29125))))

(assert (=> b!45757 (= res!26813 (isStrictlySorted!222 (t!4250 l!812)))))

(declare-fun b!45756 () Bool)

(declare-fun res!26814 () Bool)

(assert (=> b!45756 (=> (not res!26814) (not e!29125))))

(assert (=> b!45756 (= res!26814 (is-Cons!1221 l!812))))

(declare-fun b!45758 () Bool)

(assert (=> b!45758 (= e!29125 (not true))))

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun removeStrictlySorted!32 (List!1225 (_ BitVec 64)) List!1225)

(assert (=> b!45758 (= (removeStrictlySorted!32 (removeStrictlySorted!32 (t!4250 l!812) key1!43) key2!27) (removeStrictlySorted!32 (removeStrictlySorted!32 (t!4250 l!812) key2!27) key1!43))))

(declare-datatypes ((Unit!1313 0))(
  ( (Unit!1314) )
))
(declare-fun lt!20218 () Unit!1313)

(declare-fun lemmaRemoveStrictlySortedCommutative!12 (List!1225 (_ BitVec 64) (_ BitVec 64)) Unit!1313)

(assert (=> b!45758 (= lt!20218 (lemmaRemoveStrictlySortedCommutative!12 (t!4250 l!812) key1!43 key2!27))))

(assert (= (and start!7136 res!26812) b!45756))

(assert (= (and b!45756 res!26814) b!45757))

(assert (= (and b!45757 res!26813) b!45758))

(assert (= (and start!7136 (is-Cons!1221 l!812)) b!45759))

(declare-fun m!40315 () Bool)

(assert (=> start!7136 m!40315))

(declare-fun m!40317 () Bool)

(assert (=> b!45757 m!40317))

(declare-fun m!40319 () Bool)

(assert (=> b!45758 m!40319))

(declare-fun m!40321 () Bool)

(assert (=> b!45758 m!40321))

(declare-fun m!40323 () Bool)

(assert (=> b!45758 m!40323))

(assert (=> b!45758 m!40321))

(assert (=> b!45758 m!40319))

(declare-fun m!40325 () Bool)

(assert (=> b!45758 m!40325))

(declare-fun m!40327 () Bool)

(assert (=> b!45758 m!40327))

(push 1)

(assert (not start!7136))

(assert (not b!45758))

(assert tp_is_empty!1937)

(assert (not b!45757))

(assert (not b!45759))

