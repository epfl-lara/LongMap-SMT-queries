; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106736 () Bool)

(assert start!106736)

(declare-fun b!1267187 () Bool)

(declare-fun res!843527 () Bool)

(declare-fun e!721852 () Bool)

(assert (=> b!1267187 (=> (not res!843527) (not e!721852))))

(declare-datatypes ((B!2058 0))(
  ( (B!2059 (val!16364 Int)) )
))
(declare-datatypes ((tuple2!21246 0))(
  ( (tuple2!21247 (_1!10634 (_ BitVec 64)) (_2!10634 B!2058)) )
))
(declare-datatypes ((List!28356 0))(
  ( (Nil!28353) (Cons!28352 (h!29561 tuple2!21246) (t!41883 List!28356)) )
))
(declare-fun l!874 () List!28356)

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!675 (List!28356 (_ BitVec 64)) Bool)

(assert (=> b!1267187 (= res!843527 (not (containsKey!675 (t!41883 l!874) key!235)))))

(declare-fun b!1267188 () Bool)

(assert (=> b!1267188 (= e!721852 (not true))))

(declare-fun removeStrictlySorted!166 (List!28356 (_ BitVec 64)) List!28356)

(assert (=> b!1267188 (= (removeStrictlySorted!166 (t!41883 l!874) key!235) (t!41883 l!874))))

(declare-datatypes ((Unit!42220 0))(
  ( (Unit!42221) )
))
(declare-fun lt!574320 () Unit!42220)

(declare-fun lemmaRemoveStrictlySortedNotPresentPreserves!6 (List!28356 (_ BitVec 64)) Unit!42220)

(assert (=> b!1267188 (= lt!574320 (lemmaRemoveStrictlySortedNotPresentPreserves!6 (t!41883 l!874) key!235))))

(declare-fun b!1267189 () Bool)

(declare-fun res!843528 () Bool)

(assert (=> b!1267189 (=> (not res!843528) (not e!721852))))

(declare-fun isStrictlySorted!816 (List!28356) Bool)

(assert (=> b!1267189 (= res!843528 (isStrictlySorted!816 (t!41883 l!874)))))

(declare-fun res!843525 () Bool)

(assert (=> start!106736 (=> (not res!843525) (not e!721852))))

(assert (=> start!106736 (= res!843525 (isStrictlySorted!816 l!874))))

(assert (=> start!106736 e!721852))

(declare-fun e!721853 () Bool)

(assert (=> start!106736 e!721853))

(assert (=> start!106736 true))

(declare-fun b!1267190 () Bool)

(declare-fun res!843526 () Bool)

(assert (=> b!1267190 (=> (not res!843526) (not e!721852))))

(assert (=> b!1267190 (= res!843526 (not (containsKey!675 l!874 key!235)))))

(declare-fun b!1267191 () Bool)

(declare-fun tp_is_empty!32579 () Bool)

(declare-fun tp!96557 () Bool)

(assert (=> b!1267191 (= e!721853 (and tp_is_empty!32579 tp!96557))))

(declare-fun b!1267192 () Bool)

(declare-fun res!843529 () Bool)

(assert (=> b!1267192 (=> (not res!843529) (not e!721852))))

(assert (=> b!1267192 (= res!843529 (is-Cons!28352 l!874))))

(assert (= (and start!106736 res!843525) b!1267190))

(assert (= (and b!1267190 res!843526) b!1267192))

(assert (= (and b!1267192 res!843529) b!1267189))

(assert (= (and b!1267189 res!843528) b!1267187))

(assert (= (and b!1267187 res!843527) b!1267188))

(assert (= (and start!106736 (is-Cons!28352 l!874)) b!1267191))

(declare-fun m!1166643 () Bool)

(assert (=> b!1267188 m!1166643))

(declare-fun m!1166645 () Bool)

(assert (=> b!1267188 m!1166645))

(declare-fun m!1166647 () Bool)

(assert (=> b!1267187 m!1166647))

(declare-fun m!1166649 () Bool)

(assert (=> start!106736 m!1166649))

(declare-fun m!1166651 () Bool)

(assert (=> b!1267189 m!1166651))

(declare-fun m!1166653 () Bool)

(assert (=> b!1267190 m!1166653))

(push 1)

(assert (not b!1267189))

(assert (not b!1267188))

(assert tp_is_empty!32579)

(assert (not start!106736))

(assert (not b!1267187))

(assert (not b!1267191))

(assert (not b!1267190))

