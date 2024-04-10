; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103610 () Bool)

(assert start!103610)

(declare-fun b!1241143 () Bool)

(declare-fun e!703497 () Bool)

(assert (=> b!1241143 (= e!703497 (not true))))

(declare-datatypes ((B!1828 0))(
  ( (B!1829 (val!15676 Int)) )
))
(declare-fun v1!20 () B!1828)

(declare-fun key1!25 () (_ BitVec 64))

(declare-datatypes ((tuple2!20224 0))(
  ( (tuple2!20225 (_1!10123 (_ BitVec 64)) (_2!10123 B!1828)) )
))
(declare-datatypes ((List!27341 0))(
  ( (Nil!27338) (Cons!27337 (h!28546 tuple2!20224) (t!40804 List!27341)) )
))
(declare-fun l!644 () List!27341)

(declare-fun key2!15 () (_ BitVec 64))

(declare-fun insertStrictlySorted!429 (List!27341 (_ BitVec 64) B!1828) List!27341)

(declare-fun removeStrictlySorted!122 (List!27341 (_ BitVec 64)) List!27341)

(assert (=> b!1241143 (= (insertStrictlySorted!429 (removeStrictlySorted!122 (t!40804 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!122 (insertStrictlySorted!429 (t!40804 l!644) key1!25 v1!20) key2!15))))

(declare-datatypes ((Unit!41251 0))(
  ( (Unit!41252) )
))
(declare-fun lt!562094 () Unit!41251)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!11 (List!27341 (_ BitVec 64) B!1828 (_ BitVec 64)) Unit!41251)

(assert (=> b!1241143 (= lt!562094 (lemmaInsertAndRemoveStrictlySortedCommutative!11 (t!40804 l!644) key1!25 v1!20 key2!15))))

(declare-fun b!1241144 () Bool)

(declare-fun res!828009 () Bool)

(assert (=> b!1241144 (=> (not res!828009) (not e!703497))))

(get-info :version)

(assert (=> b!1241144 (= res!828009 ((_ is Cons!27337) l!644))))

(declare-fun b!1241145 () Bool)

(declare-fun res!828010 () Bool)

(assert (=> b!1241145 (=> (not res!828010) (not e!703497))))

(declare-fun isStrictlySorted!743 (List!27341) Bool)

(assert (=> b!1241145 (= res!828010 (isStrictlySorted!743 (t!40804 l!644)))))

(declare-fun b!1241146 () Bool)

(declare-fun e!703496 () Bool)

(declare-fun tp_is_empty!31227 () Bool)

(declare-fun tp!92603 () Bool)

(assert (=> b!1241146 (= e!703496 (and tp_is_empty!31227 tp!92603))))

(declare-fun res!828007 () Bool)

(assert (=> start!103610 (=> (not res!828007) (not e!703497))))

(assert (=> start!103610 (= res!828007 (not (= key1!25 key2!15)))))

(assert (=> start!103610 e!703497))

(assert (=> start!103610 true))

(assert (=> start!103610 e!703496))

(assert (=> start!103610 tp_is_empty!31227))

(declare-fun b!1241147 () Bool)

(declare-fun res!828008 () Bool)

(assert (=> b!1241147 (=> (not res!828008) (not e!703497))))

(assert (=> b!1241147 (= res!828008 (isStrictlySorted!743 l!644))))

(assert (= (and start!103610 res!828007) b!1241147))

(assert (= (and b!1241147 res!828008) b!1241144))

(assert (= (and b!1241144 res!828009) b!1241145))

(assert (= (and b!1241145 res!828010) b!1241143))

(assert (= (and start!103610 ((_ is Cons!27337) l!644)) b!1241146))

(declare-fun m!1144317 () Bool)

(assert (=> b!1241143 m!1144317))

(declare-fun m!1144319 () Bool)

(assert (=> b!1241143 m!1144319))

(assert (=> b!1241143 m!1144317))

(declare-fun m!1144321 () Bool)

(assert (=> b!1241143 m!1144321))

(declare-fun m!1144323 () Bool)

(assert (=> b!1241143 m!1144323))

(assert (=> b!1241143 m!1144321))

(declare-fun m!1144325 () Bool)

(assert (=> b!1241143 m!1144325))

(declare-fun m!1144327 () Bool)

(assert (=> b!1241145 m!1144327))

(declare-fun m!1144329 () Bool)

(assert (=> b!1241147 m!1144329))

(check-sat (not b!1241146) (not b!1241145) (not b!1241143) tp_is_empty!31227 (not b!1241147))
