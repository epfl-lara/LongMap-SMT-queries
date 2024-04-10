; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137134 () Bool)

(assert start!137134)

(declare-fun res!1079613 () Bool)

(declare-fun e!881621 () Bool)

(assert (=> start!137134 (=> (not res!1079613) (not e!881621))))

(declare-datatypes ((B!2650 0))(
  ( (B!2651 (val!19687 Int)) )
))
(declare-datatypes ((tuple2!25500 0))(
  ( (tuple2!25501 (_1!12761 (_ BitVec 64)) (_2!12761 B!2650)) )
))
(declare-datatypes ((List!36807 0))(
  ( (Nil!36804) (Cons!36803 (h!38346 tuple2!25500) (t!51721 List!36807)) )
))
(declare-fun l!1390 () List!36807)

(declare-fun isStrictlySorted!1065 (List!36807) Bool)

(assert (=> start!137134 (= res!1079613 (isStrictlySorted!1065 l!1390))))

(assert (=> start!137134 e!881621))

(declare-fun e!881620 () Bool)

(assert (=> start!137134 e!881620))

(assert (=> start!137134 true))

(declare-fun tp_is_empty!39195 () Bool)

(assert (=> start!137134 tp_is_empty!39195))

(declare-fun b!1580338 () Bool)

(declare-fun res!1079612 () Bool)

(assert (=> b!1580338 (=> (not res!1079612) (not e!881621))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!911 (List!36807 (_ BitVec 64)) Bool)

(assert (=> b!1580338 (= res!1079612 (containsKey!911 l!1390 key!405))))

(declare-fun b!1580339 () Bool)

(assert (=> b!1580339 (= e!881621 false)))

(declare-fun value!194 () B!2650)

(declare-fun lt!676753 () Bool)

(declare-fun contains!10479 (List!36807 tuple2!25500) Bool)

(assert (=> b!1580339 (= lt!676753 (contains!10479 l!1390 (tuple2!25501 key!405 value!194)))))

(declare-fun b!1580340 () Bool)

(declare-fun tp!114453 () Bool)

(assert (=> b!1580340 (= e!881620 (and tp_is_empty!39195 tp!114453))))

(assert (= (and start!137134 res!1079613) b!1580338))

(assert (= (and b!1580338 res!1079612) b!1580339))

(get-info :version)

(assert (= (and start!137134 ((_ is Cons!36803) l!1390)) b!1580340))

(declare-fun m!1451803 () Bool)

(assert (=> start!137134 m!1451803))

(declare-fun m!1451805 () Bool)

(assert (=> b!1580338 m!1451805))

(declare-fun m!1451807 () Bool)

(assert (=> b!1580339 m!1451807))

(check-sat (not b!1580338) (not b!1580339) tp_is_empty!39195 (not start!137134) (not b!1580340))
(check-sat)
