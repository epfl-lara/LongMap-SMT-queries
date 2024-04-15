; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103564 () Bool)

(assert start!103564)

(declare-fun b!1240710 () Bool)

(declare-fun e!703259 () Bool)

(assert (=> b!1240710 (= e!703259 (not true))))

(declare-datatypes ((B!1814 0))(
  ( (B!1815 (val!15669 Int)) )
))
(declare-fun v1!20 () B!1814)

(declare-fun key1!25 () (_ BitVec 64))

(declare-datatypes ((tuple2!20294 0))(
  ( (tuple2!20295 (_1!10158 (_ BitVec 64)) (_2!10158 B!1814)) )
))
(declare-datatypes ((List!27396 0))(
  ( (Nil!27393) (Cons!27392 (h!28601 tuple2!20294) (t!40850 List!27396)) )
))
(declare-fun l!644 () List!27396)

(declare-fun key2!15 () (_ BitVec 64))

(declare-fun insertStrictlySorted!423 (List!27396 (_ BitVec 64) B!1814) List!27396)

(declare-fun removeStrictlySorted!115 (List!27396 (_ BitVec 64)) List!27396)

(assert (=> b!1240710 (= (insertStrictlySorted!423 (removeStrictlySorted!115 (t!40850 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!115 (insertStrictlySorted!423 (t!40850 l!644) key1!25 v1!20) key2!15))))

(declare-datatypes ((Unit!41082 0))(
  ( (Unit!41083) )
))
(declare-fun lt!561858 () Unit!41082)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!4 (List!27396 (_ BitVec 64) B!1814 (_ BitVec 64)) Unit!41082)

(assert (=> b!1240710 (= lt!561858 (lemmaInsertAndRemoveStrictlySortedCommutative!4 (t!40850 l!644) key1!25 v1!20 key2!15))))

(declare-fun b!1240712 () Bool)

(declare-fun res!827808 () Bool)

(assert (=> b!1240712 (=> (not res!827808) (not e!703259))))

(get-info :version)

(assert (=> b!1240712 (= res!827808 ((_ is Cons!27392) l!644))))

(declare-fun b!1240713 () Bool)

(declare-fun res!827811 () Bool)

(assert (=> b!1240713 (=> (not res!827811) (not e!703259))))

(declare-fun isStrictlySorted!732 (List!27396) Bool)

(assert (=> b!1240713 (= res!827811 (isStrictlySorted!732 l!644))))

(declare-fun b!1240714 () Bool)

(declare-fun e!703260 () Bool)

(declare-fun tp_is_empty!31213 () Bool)

(declare-fun tp!92573 () Bool)

(assert (=> b!1240714 (= e!703260 (and tp_is_empty!31213 tp!92573))))

(declare-fun b!1240711 () Bool)

(declare-fun res!827810 () Bool)

(assert (=> b!1240711 (=> (not res!827810) (not e!703259))))

(assert (=> b!1240711 (= res!827810 (isStrictlySorted!732 (t!40850 l!644)))))

(declare-fun res!827809 () Bool)

(assert (=> start!103564 (=> (not res!827809) (not e!703259))))

(assert (=> start!103564 (= res!827809 (not (= key1!25 key2!15)))))

(assert (=> start!103564 e!703259))

(assert (=> start!103564 true))

(assert (=> start!103564 e!703260))

(assert (=> start!103564 tp_is_empty!31213))

(assert (= (and start!103564 res!827809) b!1240713))

(assert (= (and b!1240713 res!827811) b!1240712))

(assert (= (and b!1240712 res!827808) b!1240711))

(assert (= (and b!1240711 res!827810) b!1240710))

(assert (= (and start!103564 ((_ is Cons!27392) l!644)) b!1240714))

(declare-fun m!1143519 () Bool)

(assert (=> b!1240710 m!1143519))

(declare-fun m!1143521 () Bool)

(assert (=> b!1240710 m!1143521))

(assert (=> b!1240710 m!1143519))

(declare-fun m!1143523 () Bool)

(assert (=> b!1240710 m!1143523))

(declare-fun m!1143525 () Bool)

(assert (=> b!1240710 m!1143525))

(assert (=> b!1240710 m!1143523))

(declare-fun m!1143527 () Bool)

(assert (=> b!1240710 m!1143527))

(declare-fun m!1143529 () Bool)

(assert (=> b!1240713 m!1143529))

(declare-fun m!1143531 () Bool)

(assert (=> b!1240711 m!1143531))

(check-sat (not b!1240711) tp_is_empty!31213 (not b!1240714) (not b!1240710) (not b!1240713))
(check-sat)
