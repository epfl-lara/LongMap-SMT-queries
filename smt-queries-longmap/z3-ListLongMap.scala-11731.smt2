; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137960 () Bool)

(assert start!137960)

(declare-fun res!1081630 () Bool)

(declare-fun e!884269 () Bool)

(assert (=> start!137960 (=> (not res!1081630) (not e!884269))))

(declare-datatypes ((B!2714 0))(
  ( (B!2715 (val!19719 Int)) )
))
(declare-datatypes ((tuple2!25666 0))(
  ( (tuple2!25667 (_1!12844 (_ BitVec 64)) (_2!12844 B!2714)) )
))
(declare-datatypes ((List!36871 0))(
  ( (Nil!36868) (Cons!36867 (h!38428 tuple2!25666) (t!51777 List!36871)) )
))
(declare-fun l!1390 () List!36871)

(declare-fun isStrictlySorted!1085 (List!36871) Bool)

(assert (=> start!137960 (= res!1081630 (isStrictlySorted!1085 l!1390))))

(assert (=> start!137960 e!884269))

(declare-fun e!884270 () Bool)

(assert (=> start!137960 e!884270))

(assert (=> start!137960 true))

(declare-fun tp_is_empty!39259 () Bool)

(assert (=> start!137960 tp_is_empty!39259))

(declare-fun b!1584379 () Bool)

(declare-fun res!1081631 () Bool)

(assert (=> b!1584379 (=> (not res!1081631) (not e!884269))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!944 (List!36871 (_ BitVec 64)) Bool)

(assert (=> b!1584379 (= res!1081631 (containsKey!944 l!1390 key!405))))

(declare-fun b!1584380 () Bool)

(assert (=> b!1584380 (= e!884269 false)))

(declare-fun lt!677937 () Bool)

(declare-fun value!194 () B!2714)

(declare-fun contains!10556 (List!36871 tuple2!25666) Bool)

(assert (=> b!1584380 (= lt!677937 (contains!10556 l!1390 (tuple2!25667 key!405 value!194)))))

(declare-fun b!1584381 () Bool)

(declare-fun tp!114624 () Bool)

(assert (=> b!1584381 (= e!884270 (and tp_is_empty!39259 tp!114624))))

(assert (= (and start!137960 res!1081630) b!1584379))

(assert (= (and b!1584379 res!1081631) b!1584380))

(get-info :version)

(assert (= (and start!137960 ((_ is Cons!36867) l!1390)) b!1584381))

(declare-fun m!1454967 () Bool)

(assert (=> start!137960 m!1454967))

(declare-fun m!1454969 () Bool)

(assert (=> b!1584379 m!1454969))

(declare-fun m!1454971 () Bool)

(assert (=> b!1584380 m!1454971))

(check-sat (not b!1584379) (not b!1584381) tp_is_empty!39259 (not start!137960) (not b!1584380))
(check-sat)
