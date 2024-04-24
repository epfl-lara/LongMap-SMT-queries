; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7138 () Bool)

(assert start!7138)

(declare-fun b!45676 () Bool)

(declare-fun res!26771 () Bool)

(declare-fun e!29076 () Bool)

(assert (=> b!45676 (=> (not res!26771) (not e!29076))))

(declare-datatypes ((B!836 0))(
  ( (B!837 (val!1005 Int)) )
))
(declare-datatypes ((tuple2!1640 0))(
  ( (tuple2!1641 (_1!831 (_ BitVec 64)) (_2!831 B!836)) )
))
(declare-datatypes ((List!1209 0))(
  ( (Nil!1206) (Cons!1205 (h!1785 tuple2!1640) (t!4234 List!1209)) )
))
(declare-fun l!812 () List!1209)

(declare-fun isStrictlySorted!208 (List!1209) Bool)

(assert (=> b!45676 (= res!26771 (isStrictlySorted!208 (t!4234 l!812)))))

(declare-fun b!45675 () Bool)

(declare-fun res!26769 () Bool)

(assert (=> b!45675 (=> (not res!26769) (not e!29076))))

(get-info :version)

(assert (=> b!45675 (= res!26769 ((_ is Cons!1205) l!812))))

(declare-fun res!26770 () Bool)

(assert (=> start!7138 (=> (not res!26770) (not e!29076))))

(assert (=> start!7138 (= res!26770 (isStrictlySorted!208 l!812))))

(assert (=> start!7138 e!29076))

(declare-fun e!29077 () Bool)

(assert (=> start!7138 e!29077))

(assert (=> start!7138 true))

(declare-fun b!45677 () Bool)

(assert (=> b!45677 (= e!29076 (not true))))

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun removeStrictlySorted!29 (List!1209 (_ BitVec 64)) List!1209)

(assert (=> b!45677 (= (removeStrictlySorted!29 (removeStrictlySorted!29 (t!4234 l!812) key1!43) key2!27) (removeStrictlySorted!29 (removeStrictlySorted!29 (t!4234 l!812) key2!27) key1!43))))

(declare-datatypes ((Unit!1320 0))(
  ( (Unit!1321) )
))
(declare-fun lt!20169 () Unit!1320)

(declare-fun lemmaRemoveStrictlySortedCommutative!10 (List!1209 (_ BitVec 64) (_ BitVec 64)) Unit!1320)

(assert (=> b!45677 (= lt!20169 (lemmaRemoveStrictlySortedCommutative!10 (t!4234 l!812) key1!43 key2!27))))

(declare-fun b!45678 () Bool)

(declare-fun tp_is_empty!1933 () Bool)

(declare-fun tp!6002 () Bool)

(assert (=> b!45678 (= e!29077 (and tp_is_empty!1933 tp!6002))))

(assert (= (and start!7138 res!26770) b!45675))

(assert (= (and b!45675 res!26769) b!45676))

(assert (= (and b!45676 res!26771) b!45677))

(assert (= (and start!7138 ((_ is Cons!1205) l!812)) b!45678))

(declare-fun m!40163 () Bool)

(assert (=> b!45676 m!40163))

(declare-fun m!40165 () Bool)

(assert (=> start!7138 m!40165))

(declare-fun m!40167 () Bool)

(assert (=> b!45677 m!40167))

(declare-fun m!40169 () Bool)

(assert (=> b!45677 m!40169))

(declare-fun m!40171 () Bool)

(assert (=> b!45677 m!40171))

(assert (=> b!45677 m!40169))

(assert (=> b!45677 m!40167))

(declare-fun m!40173 () Bool)

(assert (=> b!45677 m!40173))

(declare-fun m!40175 () Bool)

(assert (=> b!45677 m!40175))

(check-sat (not start!7138) (not b!45676) tp_is_empty!1933 (not b!45677) (not b!45678))
(check-sat)
