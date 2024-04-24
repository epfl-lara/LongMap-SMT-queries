; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103848 () Bool)

(assert start!103848)

(declare-fun b!1242482 () Bool)

(declare-fun e!704365 () Bool)

(assert (=> b!1242482 (= e!704365 (not true))))

(declare-datatypes ((B!1830 0))(
  ( (B!1831 (val!15677 Int)) )
))
(declare-fun v1!20 () B!1830)

(declare-fun key1!25 () (_ BitVec 64))

(declare-datatypes ((tuple2!20242 0))(
  ( (tuple2!20243 (_1!10132 (_ BitVec 64)) (_2!10132 B!1830)) )
))
(declare-datatypes ((List!27367 0))(
  ( (Nil!27364) (Cons!27363 (h!28581 tuple2!20242) (t!40822 List!27367)) )
))
(declare-fun l!644 () List!27367)

(declare-fun key2!15 () (_ BitVec 64))

(declare-fun insertStrictlySorted!431 (List!27367 (_ BitVec 64) B!1830) List!27367)

(declare-fun removeStrictlySorted!122 (List!27367 (_ BitVec 64)) List!27367)

(assert (=> b!1242482 (= (insertStrictlySorted!431 (removeStrictlySorted!122 (t!40822 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!122 (insertStrictlySorted!431 (t!40822 l!644) key1!25 v1!20) key2!15))))

(declare-datatypes ((Unit!41226 0))(
  ( (Unit!41227) )
))
(declare-fun lt!562583 () Unit!41226)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!12 (List!27367 (_ BitVec 64) B!1830 (_ BitVec 64)) Unit!41226)

(assert (=> b!1242482 (= lt!562583 (lemmaInsertAndRemoveStrictlySortedCommutative!12 (t!40822 l!644) key1!25 v1!20 key2!15))))

(declare-fun b!1242483 () Bool)

(declare-fun e!704366 () Bool)

(declare-fun tp_is_empty!31229 () Bool)

(declare-fun tp!92606 () Bool)

(assert (=> b!1242483 (= e!704366 (and tp_is_empty!31229 tp!92606))))

(declare-fun b!1242484 () Bool)

(declare-fun res!828555 () Bool)

(assert (=> b!1242484 (=> (not res!828555) (not e!704365))))

(assert (=> b!1242484 (= res!828555 (is-Cons!27363 l!644))))

(declare-fun res!828554 () Bool)

(assert (=> start!103848 (=> (not res!828554) (not e!704365))))

(assert (=> start!103848 (= res!828554 (not (= key1!25 key2!15)))))

(assert (=> start!103848 e!704365))

(assert (=> start!103848 true))

(assert (=> start!103848 e!704366))

(assert (=> start!103848 tp_is_empty!31229))

(declare-fun b!1242485 () Bool)

(declare-fun res!828552 () Bool)

(assert (=> b!1242485 (=> (not res!828552) (not e!704365))))

(declare-fun isStrictlySorted!732 (List!27367) Bool)

(assert (=> b!1242485 (= res!828552 (isStrictlySorted!732 l!644))))

(declare-fun b!1242486 () Bool)

(declare-fun res!828553 () Bool)

(assert (=> b!1242486 (=> (not res!828553) (not e!704365))))

(assert (=> b!1242486 (= res!828553 (isStrictlySorted!732 (t!40822 l!644)))))

(assert (= (and start!103848 res!828554) b!1242485))

(assert (= (and b!1242485 res!828552) b!1242484))

(assert (= (and b!1242484 res!828555) b!1242486))

(assert (= (and b!1242486 res!828553) b!1242482))

(assert (= (and start!103848 (is-Cons!27363 l!644)) b!1242483))

(declare-fun m!1145973 () Bool)

(assert (=> b!1242482 m!1145973))

(declare-fun m!1145975 () Bool)

(assert (=> b!1242482 m!1145975))

(assert (=> b!1242482 m!1145973))

(declare-fun m!1145977 () Bool)

(assert (=> b!1242482 m!1145977))

(declare-fun m!1145979 () Bool)

(assert (=> b!1242482 m!1145979))

(assert (=> b!1242482 m!1145977))

(declare-fun m!1145981 () Bool)

(assert (=> b!1242482 m!1145981))

(declare-fun m!1145983 () Bool)

(assert (=> b!1242485 m!1145983))

(declare-fun m!1145985 () Bool)

(assert (=> b!1242486 m!1145985))

(push 1)

(assert (not b!1242482))

(assert (not b!1242483))

(assert (not b!1242485))

(assert (not b!1242486))

(assert tp_is_empty!31229)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

