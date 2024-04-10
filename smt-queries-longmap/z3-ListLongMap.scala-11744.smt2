; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137732 () Bool)

(assert start!137732)

(declare-fun b!1582659 () Bool)

(declare-fun e!883318 () Bool)

(declare-fun tp_is_empty!39339 () Bool)

(declare-fun tp!114824 () Bool)

(assert (=> b!1582659 (= e!883318 (and tp_is_empty!39339 tp!114824))))

(declare-fun b!1582660 () Bool)

(declare-fun res!1081197 () Bool)

(declare-fun e!883319 () Bool)

(assert (=> b!1582660 (=> (not res!1081197) (not e!883319))))

(declare-datatypes ((B!2806 0))(
  ( (B!2807 (val!19765 Int)) )
))
(declare-datatypes ((tuple2!25698 0))(
  ( (tuple2!25699 (_1!12860 (_ BitVec 64)) (_2!12860 B!2806)) )
))
(declare-datatypes ((List!36885 0))(
  ( (Nil!36882) (Cons!36881 (h!38424 tuple2!25698) (t!51799 List!36885)) )
))
(declare-fun l!1065 () List!36885)

(declare-fun key!287 () (_ BitVec 64))

(declare-fun containsKey!968 (List!36885 (_ BitVec 64)) Bool)

(assert (=> b!1582660 (= res!1081197 (containsKey!968 (t!51799 l!1065) key!287))))

(declare-fun b!1582661 () Bool)

(assert (=> b!1582661 (= e!883319 (not true))))

(declare-datatypes ((Option!939 0))(
  ( (Some!938 (v!22466 B!2806)) (None!937) )
))
(declare-fun isDefined!604 (Option!939) Bool)

(declare-fun getValueByKey!830 (List!36885 (_ BitVec 64)) Option!939)

(assert (=> b!1582661 (isDefined!604 (getValueByKey!830 (t!51799 l!1065) key!287))))

(declare-datatypes ((Unit!52275 0))(
  ( (Unit!52276) )
))
(declare-fun lt!677124 () Unit!52275)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!553 (List!36885 (_ BitVec 64)) Unit!52275)

(assert (=> b!1582661 (= lt!677124 (lemmaContainsKeyImpliesGetValueByKeyDefined!553 (t!51799 l!1065) key!287))))

(declare-fun b!1582662 () Bool)

(declare-fun res!1081195 () Bool)

(assert (=> b!1582662 (=> (not res!1081195) (not e!883319))))

(get-info :version)

(assert (=> b!1582662 (= res!1081195 (and ((_ is Cons!36881) l!1065) (not (= (_1!12860 (h!38424 l!1065)) key!287))))))

(declare-fun b!1582663 () Bool)

(declare-fun res!1081193 () Bool)

(assert (=> b!1582663 (=> (not res!1081193) (not e!883319))))

(assert (=> b!1582663 (= res!1081193 (containsKey!968 l!1065 key!287))))

(declare-fun res!1081196 () Bool)

(assert (=> start!137732 (=> (not res!1081196) (not e!883319))))

(declare-fun isStrictlySorted!1122 (List!36885) Bool)

(assert (=> start!137732 (= res!1081196 (isStrictlySorted!1122 l!1065))))

(assert (=> start!137732 e!883319))

(assert (=> start!137732 e!883318))

(assert (=> start!137732 true))

(declare-fun b!1582658 () Bool)

(declare-fun res!1081194 () Bool)

(assert (=> b!1582658 (=> (not res!1081194) (not e!883319))))

(assert (=> b!1582658 (= res!1081194 (isStrictlySorted!1122 (t!51799 l!1065)))))

(assert (= (and start!137732 res!1081196) b!1582663))

(assert (= (and b!1582663 res!1081193) b!1582662))

(assert (= (and b!1582662 res!1081195) b!1582658))

(assert (= (and b!1582658 res!1081194) b!1582660))

(assert (= (and b!1582660 res!1081197) b!1582661))

(assert (= (and start!137732 ((_ is Cons!36881) l!1065)) b!1582659))

(declare-fun m!1452979 () Bool)

(assert (=> b!1582658 m!1452979))

(declare-fun m!1452981 () Bool)

(assert (=> b!1582660 m!1452981))

(declare-fun m!1452983 () Bool)

(assert (=> b!1582663 m!1452983))

(declare-fun m!1452985 () Bool)

(assert (=> b!1582661 m!1452985))

(assert (=> b!1582661 m!1452985))

(declare-fun m!1452987 () Bool)

(assert (=> b!1582661 m!1452987))

(declare-fun m!1452989 () Bool)

(assert (=> b!1582661 m!1452989))

(declare-fun m!1452991 () Bool)

(assert (=> start!137732 m!1452991))

(check-sat (not b!1582663) (not b!1582658) (not b!1582661) (not b!1582660) (not b!1582659) (not start!137732) tp_is_empty!39339)
(check-sat)
