; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103612 () Bool)

(assert start!103612)

(declare-fun b!1241158 () Bool)

(declare-fun res!828020 () Bool)

(declare-fun e!703503 () Bool)

(assert (=> b!1241158 (=> (not res!828020) (not e!703503))))

(declare-datatypes ((B!1830 0))(
  ( (B!1831 (val!15677 Int)) )
))
(declare-datatypes ((tuple2!20226 0))(
  ( (tuple2!20227 (_1!10124 (_ BitVec 64)) (_2!10124 B!1830)) )
))
(declare-datatypes ((List!27342 0))(
  ( (Nil!27339) (Cons!27338 (h!28547 tuple2!20226) (t!40805 List!27342)) )
))
(declare-fun l!644 () List!27342)

(declare-fun isStrictlySorted!744 (List!27342) Bool)

(assert (=> b!1241158 (= res!828020 (isStrictlySorted!744 l!644))))

(declare-fun res!828022 () Bool)

(assert (=> start!103612 (=> (not res!828022) (not e!703503))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103612 (= res!828022 (not (= key1!25 key2!15)))))

(assert (=> start!103612 e!703503))

(assert (=> start!103612 true))

(declare-fun e!703502 () Bool)

(assert (=> start!103612 e!703502))

(declare-fun tp_is_empty!31229 () Bool)

(assert (=> start!103612 tp_is_empty!31229))

(declare-fun b!1241159 () Bool)

(assert (=> b!1241159 (= e!703503 (not true))))

(declare-fun v1!20 () B!1830)

(declare-fun insertStrictlySorted!430 (List!27342 (_ BitVec 64) B!1830) List!27342)

(declare-fun removeStrictlySorted!123 (List!27342 (_ BitVec 64)) List!27342)

(assert (=> b!1241159 (= (insertStrictlySorted!430 (removeStrictlySorted!123 (t!40805 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!123 (insertStrictlySorted!430 (t!40805 l!644) key1!25 v1!20) key2!15))))

(declare-datatypes ((Unit!41253 0))(
  ( (Unit!41254) )
))
(declare-fun lt!562097 () Unit!41253)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!12 (List!27342 (_ BitVec 64) B!1830 (_ BitVec 64)) Unit!41253)

(assert (=> b!1241159 (= lt!562097 (lemmaInsertAndRemoveStrictlySortedCommutative!12 (t!40805 l!644) key1!25 v1!20 key2!15))))

(declare-fun b!1241160 () Bool)

(declare-fun res!828019 () Bool)

(assert (=> b!1241160 (=> (not res!828019) (not e!703503))))

(assert (=> b!1241160 (= res!828019 (isStrictlySorted!744 (t!40805 l!644)))))

(declare-fun b!1241161 () Bool)

(declare-fun tp!92606 () Bool)

(assert (=> b!1241161 (= e!703502 (and tp_is_empty!31229 tp!92606))))

(declare-fun b!1241162 () Bool)

(declare-fun res!828021 () Bool)

(assert (=> b!1241162 (=> (not res!828021) (not e!703503))))

(assert (=> b!1241162 (= res!828021 (is-Cons!27338 l!644))))

(assert (= (and start!103612 res!828022) b!1241158))

(assert (= (and b!1241158 res!828020) b!1241162))

(assert (= (and b!1241162 res!828021) b!1241160))

(assert (= (and b!1241160 res!828019) b!1241159))

(assert (= (and start!103612 (is-Cons!27338 l!644)) b!1241161))

(declare-fun m!1144331 () Bool)

(assert (=> b!1241158 m!1144331))

(declare-fun m!1144333 () Bool)

(assert (=> b!1241159 m!1144333))

(declare-fun m!1144335 () Bool)

(assert (=> b!1241159 m!1144335))

(assert (=> b!1241159 m!1144333))

(declare-fun m!1144337 () Bool)

(assert (=> b!1241159 m!1144337))

(declare-fun m!1144339 () Bool)

(assert (=> b!1241159 m!1144339))

(assert (=> b!1241159 m!1144337))

(declare-fun m!1144341 () Bool)

(assert (=> b!1241159 m!1144341))

(declare-fun m!1144343 () Bool)

(assert (=> b!1241160 m!1144343))

(push 1)

(assert tp_is_empty!31229)

(assert (not b!1241159))

(assert (not b!1241161))

