; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103608 () Bool)

(assert start!103608)

(declare-fun b!1241128 () Bool)

(declare-fun res!827996 () Bool)

(declare-fun e!703491 () Bool)

(assert (=> b!1241128 (=> (not res!827996) (not e!703491))))

(declare-datatypes ((B!1826 0))(
  ( (B!1827 (val!15675 Int)) )
))
(declare-datatypes ((tuple2!20222 0))(
  ( (tuple2!20223 (_1!10122 (_ BitVec 64)) (_2!10122 B!1826)) )
))
(declare-datatypes ((List!27340 0))(
  ( (Nil!27337) (Cons!27336 (h!28545 tuple2!20222) (t!40803 List!27340)) )
))
(declare-fun l!644 () List!27340)

(assert (=> b!1241128 (= res!827996 (is-Cons!27336 l!644))))

(declare-fun b!1241129 () Bool)

(declare-fun e!703490 () Bool)

(declare-fun tp_is_empty!31225 () Bool)

(declare-fun tp!92600 () Bool)

(assert (=> b!1241129 (= e!703490 (and tp_is_empty!31225 tp!92600))))

(declare-fun res!827998 () Bool)

(assert (=> start!103608 (=> (not res!827998) (not e!703491))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103608 (= res!827998 (not (= key1!25 key2!15)))))

(assert (=> start!103608 e!703491))

(assert (=> start!103608 true))

(assert (=> start!103608 e!703490))

(assert (=> start!103608 tp_is_empty!31225))

(declare-fun b!1241130 () Bool)

(declare-fun res!827995 () Bool)

(assert (=> b!1241130 (=> (not res!827995) (not e!703491))))

(declare-fun isStrictlySorted!742 (List!27340) Bool)

(assert (=> b!1241130 (= res!827995 (isStrictlySorted!742 (t!40803 l!644)))))

(declare-fun b!1241131 () Bool)

(assert (=> b!1241131 (= e!703491 (not true))))

(declare-fun v1!20 () B!1826)

(declare-fun insertStrictlySorted!428 (List!27340 (_ BitVec 64) B!1826) List!27340)

(declare-fun removeStrictlySorted!121 (List!27340 (_ BitVec 64)) List!27340)

(assert (=> b!1241131 (= (insertStrictlySorted!428 (removeStrictlySorted!121 (t!40803 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!121 (insertStrictlySorted!428 (t!40803 l!644) key1!25 v1!20) key2!15))))

(declare-datatypes ((Unit!41249 0))(
  ( (Unit!41250) )
))
(declare-fun lt!562091 () Unit!41249)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!10 (List!27340 (_ BitVec 64) B!1826 (_ BitVec 64)) Unit!41249)

(assert (=> b!1241131 (= lt!562091 (lemmaInsertAndRemoveStrictlySortedCommutative!10 (t!40803 l!644) key1!25 v1!20 key2!15))))

(declare-fun b!1241132 () Bool)

(declare-fun res!827997 () Bool)

(assert (=> b!1241132 (=> (not res!827997) (not e!703491))))

(assert (=> b!1241132 (= res!827997 (isStrictlySorted!742 l!644))))

(assert (= (and start!103608 res!827998) b!1241132))

(assert (= (and b!1241132 res!827997) b!1241128))

(assert (= (and b!1241128 res!827996) b!1241130))

(assert (= (and b!1241130 res!827995) b!1241131))

(assert (= (and start!103608 (is-Cons!27336 l!644)) b!1241129))

(declare-fun m!1144303 () Bool)

(assert (=> b!1241130 m!1144303))

(declare-fun m!1144305 () Bool)

(assert (=> b!1241131 m!1144305))

(declare-fun m!1144307 () Bool)

(assert (=> b!1241131 m!1144307))

(assert (=> b!1241131 m!1144305))

(declare-fun m!1144309 () Bool)

(assert (=> b!1241131 m!1144309))

(declare-fun m!1144311 () Bool)

(assert (=> b!1241131 m!1144311))

(assert (=> b!1241131 m!1144309))

(declare-fun m!1144313 () Bool)

(assert (=> b!1241131 m!1144313))

(declare-fun m!1144315 () Bool)

(assert (=> b!1241132 m!1144315))

(push 1)

(assert (not b!1241131))

(assert (not b!1241129))

(assert tp_is_empty!31225)

(assert (not b!1241132))

(assert (not b!1241130))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

