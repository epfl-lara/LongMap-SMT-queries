; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137068 () Bool)

(assert start!137068)

(declare-fun res!1079207 () Bool)

(declare-fun e!881245 () Bool)

(assert (=> start!137068 (=> (not res!1079207) (not e!881245))))

(declare-datatypes ((B!2618 0))(
  ( (B!2619 (val!19671 Int)) )
))
(declare-datatypes ((tuple2!25518 0))(
  ( (tuple2!25519 (_1!12770 (_ BitVec 64)) (_2!12770 B!2618)) )
))
(declare-datatypes ((List!36832 0))(
  ( (Nil!36829) (Cons!36828 (h!38372 tuple2!25518) (t!51738 List!36832)) )
))
(declare-fun l!1390 () List!36832)

(declare-fun isStrictlySorted!1047 (List!36832) Bool)

(assert (=> start!137068 (= res!1079207 (isStrictlySorted!1047 l!1390))))

(assert (=> start!137068 e!881245))

(declare-fun e!881246 () Bool)

(assert (=> start!137068 e!881246))

(assert (=> start!137068 true))

(declare-fun tp_is_empty!39163 () Bool)

(assert (=> start!137068 tp_is_empty!39163))

(declare-fun b!1579701 () Bool)

(declare-fun res!1079208 () Bool)

(assert (=> b!1579701 (=> (not res!1079208) (not e!881245))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!893 (List!36832 (_ BitVec 64)) Bool)

(assert (=> b!1579701 (= res!1079208 (containsKey!893 l!1390 key!405))))

(declare-fun b!1579702 () Bool)

(assert (=> b!1579702 (= e!881245 false)))

(declare-fun lt!676377 () Bool)

(declare-fun value!194 () B!2618)

(declare-fun contains!10418 (List!36832 tuple2!25518) Bool)

(assert (=> b!1579702 (= lt!676377 (contains!10418 l!1390 (tuple2!25519 key!405 value!194)))))

(declare-fun b!1579703 () Bool)

(declare-fun tp!114406 () Bool)

(assert (=> b!1579703 (= e!881246 (and tp_is_empty!39163 tp!114406))))

(assert (= (and start!137068 res!1079207) b!1579701))

(assert (= (and b!1579701 res!1079208) b!1579702))

(get-info :version)

(assert (= (and start!137068 ((_ is Cons!36828) l!1390)) b!1579703))

(declare-fun m!1450701 () Bool)

(assert (=> start!137068 m!1450701))

(declare-fun m!1450703 () Bool)

(assert (=> b!1579701 m!1450703))

(declare-fun m!1450705 () Bool)

(assert (=> b!1579702 m!1450705))

(check-sat (not start!137068) (not b!1579701) tp_is_empty!39163 (not b!1579703) (not b!1579702))
(check-sat)
