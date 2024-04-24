; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138170 () Bool)

(assert start!138170)

(declare-fun res!1082100 () Bool)

(declare-fun e!884869 () Bool)

(assert (=> start!138170 (=> (not res!1082100) (not e!884869))))

(declare-datatypes ((B!2804 0))(
  ( (B!2805 (val!19764 Int)) )
))
(declare-datatypes ((tuple2!25756 0))(
  ( (tuple2!25757 (_1!12889 (_ BitVec 64)) (_2!12889 B!2804)) )
))
(declare-datatypes ((List!36916 0))(
  ( (Nil!36913) (Cons!36912 (h!38473 tuple2!25756) (t!51822 List!36916)) )
))
(declare-fun l!1065 () List!36916)

(declare-fun isStrictlySorted!1109 (List!36916) Bool)

(assert (=> start!138170 (= res!1082100 (isStrictlySorted!1109 l!1065))))

(assert (=> start!138170 e!884869))

(declare-fun e!884870 () Bool)

(assert (=> start!138170 e!884870))

(assert (=> start!138170 true))

(declare-fun b!1585147 () Bool)

(declare-fun res!1082098 () Bool)

(assert (=> b!1585147 (=> (not res!1082098) (not e!884869))))

(declare-fun key!287 () (_ BitVec 64))

(declare-fun containsKey!968 (List!36916 (_ BitVec 64)) Bool)

(assert (=> b!1585147 (= res!1082098 (containsKey!968 l!1065 key!287))))

(declare-fun b!1585148 () Bool)

(assert (=> b!1585148 (= e!884869 (not true))))

(declare-datatypes ((Option!933 0))(
  ( (Some!932 (v!22457 B!2804)) (None!931) )
))
(declare-fun isDefined!599 (Option!933) Bool)

(declare-fun getValueByKey!825 (List!36916 (_ BitVec 64)) Option!933)

(assert (=> b!1585148 (isDefined!599 (getValueByKey!825 (t!51822 l!1065) key!287))))

(declare-datatypes ((Unit!52180 0))(
  ( (Unit!52181) )
))
(declare-fun lt!678030 () Unit!52180)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!550 (List!36916 (_ BitVec 64)) Unit!52180)

(assert (=> b!1585148 (= lt!678030 (lemmaContainsKeyImpliesGetValueByKeyDefined!550 (t!51822 l!1065) key!287))))

(declare-fun b!1585149 () Bool)

(declare-fun res!1082099 () Bool)

(assert (=> b!1585149 (=> (not res!1082099) (not e!884869))))

(assert (=> b!1585149 (= res!1082099 (isStrictlySorted!1109 (t!51822 l!1065)))))

(declare-fun b!1585150 () Bool)

(declare-fun res!1082102 () Bool)

(assert (=> b!1585150 (=> (not res!1082102) (not e!884869))))

(assert (=> b!1585150 (= res!1082102 (containsKey!968 (t!51822 l!1065) key!287))))

(declare-fun b!1585151 () Bool)

(declare-fun res!1082101 () Bool)

(assert (=> b!1585151 (=> (not res!1082101) (not e!884869))))

(get-info :version)

(assert (=> b!1585151 (= res!1082101 (and ((_ is Cons!36912) l!1065) (not (= (_1!12889 (h!38473 l!1065)) key!287))))))

(declare-fun b!1585152 () Bool)

(declare-fun tp_is_empty!39337 () Bool)

(declare-fun tp!114822 () Bool)

(assert (=> b!1585152 (= e!884870 (and tp_is_empty!39337 tp!114822))))

(assert (= (and start!138170 res!1082100) b!1585147))

(assert (= (and b!1585147 res!1082098) b!1585151))

(assert (= (and b!1585151 res!1082101) b!1585149))

(assert (= (and b!1585149 res!1082099) b!1585150))

(assert (= (and b!1585150 res!1082102) b!1585148))

(assert (= (and start!138170 ((_ is Cons!36912) l!1065)) b!1585152))

(declare-fun m!1455291 () Bool)

(assert (=> b!1585148 m!1455291))

(assert (=> b!1585148 m!1455291))

(declare-fun m!1455293 () Bool)

(assert (=> b!1585148 m!1455293))

(declare-fun m!1455295 () Bool)

(assert (=> b!1585148 m!1455295))

(declare-fun m!1455297 () Bool)

(assert (=> start!138170 m!1455297))

(declare-fun m!1455299 () Bool)

(assert (=> b!1585147 m!1455299))

(declare-fun m!1455301 () Bool)

(assert (=> b!1585150 m!1455301))

(declare-fun m!1455303 () Bool)

(assert (=> b!1585149 m!1455303))

(check-sat (not b!1585152) (not start!138170) tp_is_empty!39337 (not b!1585148) (not b!1585150) (not b!1585149) (not b!1585147))
(check-sat)
