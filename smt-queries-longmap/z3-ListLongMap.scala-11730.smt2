; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137954 () Bool)

(assert start!137954)

(declare-fun res!1081613 () Bool)

(declare-fun e!884251 () Bool)

(assert (=> start!137954 (=> (not res!1081613) (not e!884251))))

(declare-datatypes ((B!2708 0))(
  ( (B!2709 (val!19716 Int)) )
))
(declare-datatypes ((tuple2!25660 0))(
  ( (tuple2!25661 (_1!12841 (_ BitVec 64)) (_2!12841 B!2708)) )
))
(declare-datatypes ((List!36868 0))(
  ( (Nil!36865) (Cons!36864 (h!38425 tuple2!25660) (t!51774 List!36868)) )
))
(declare-fun l!1390 () List!36868)

(declare-fun isStrictlySorted!1082 (List!36868) Bool)

(assert (=> start!137954 (= res!1081613 (isStrictlySorted!1082 l!1390))))

(assert (=> start!137954 e!884251))

(declare-fun e!884252 () Bool)

(assert (=> start!137954 e!884252))

(assert (=> start!137954 true))

(declare-fun tp_is_empty!39253 () Bool)

(assert (=> start!137954 tp_is_empty!39253))

(declare-fun b!1584352 () Bool)

(declare-fun res!1081612 () Bool)

(assert (=> b!1584352 (=> (not res!1081612) (not e!884251))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!941 (List!36868 (_ BitVec 64)) Bool)

(assert (=> b!1584352 (= res!1081612 (containsKey!941 l!1390 key!405))))

(declare-fun b!1584353 () Bool)

(assert (=> b!1584353 (= e!884251 false)))

(declare-fun lt!677928 () Bool)

(declare-fun value!194 () B!2708)

(declare-fun contains!10553 (List!36868 tuple2!25660) Bool)

(assert (=> b!1584353 (= lt!677928 (contains!10553 l!1390 (tuple2!25661 key!405 value!194)))))

(declare-fun b!1584354 () Bool)

(declare-fun tp!114615 () Bool)

(assert (=> b!1584354 (= e!884252 (and tp_is_empty!39253 tp!114615))))

(assert (= (and start!137954 res!1081613) b!1584352))

(assert (= (and b!1584352 res!1081612) b!1584353))

(get-info :version)

(assert (= (and start!137954 ((_ is Cons!36864) l!1390)) b!1584354))

(declare-fun m!1454949 () Bool)

(assert (=> start!137954 m!1454949))

(declare-fun m!1454951 () Bool)

(assert (=> b!1584352 m!1454951))

(declare-fun m!1454953 () Bool)

(assert (=> b!1584353 m!1454953))

(check-sat (not start!137954) (not b!1584353) (not b!1584352) tp_is_empty!39253 (not b!1584354))
(check-sat)
