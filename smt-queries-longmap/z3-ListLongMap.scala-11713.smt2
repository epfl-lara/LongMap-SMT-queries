; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137104 () Bool)

(assert start!137104)

(declare-fun res!1079342 () Bool)

(declare-fun e!881449 () Bool)

(assert (=> start!137104 (=> (not res!1079342) (not e!881449))))

(declare-datatypes ((B!2620 0))(
  ( (B!2621 (val!19672 Int)) )
))
(declare-datatypes ((tuple2!25452 0))(
  ( (tuple2!25453 (_1!12737 (_ BitVec 64)) (_2!12737 B!2620)) )
))
(declare-datatypes ((List!36792 0))(
  ( (Nil!36789) (Cons!36788 (h!38331 tuple2!25452) (t!51706 List!36792)) )
))
(declare-fun l!1390 () List!36792)

(declare-fun isStrictlySorted!1050 (List!36792) Bool)

(assert (=> start!137104 (= res!1079342 (isStrictlySorted!1050 l!1390))))

(assert (=> start!137104 e!881449))

(declare-fun e!881450 () Bool)

(assert (=> start!137104 e!881450))

(assert (=> start!137104 true))

(declare-fun tp_is_empty!39165 () Bool)

(assert (=> start!137104 tp_is_empty!39165))

(declare-fun b!1580023 () Bool)

(declare-fun res!1079343 () Bool)

(assert (=> b!1580023 (=> (not res!1079343) (not e!881449))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!896 (List!36792 (_ BitVec 64)) Bool)

(assert (=> b!1580023 (= res!1079343 (containsKey!896 l!1390 key!405))))

(declare-fun b!1580024 () Bool)

(assert (=> b!1580024 (= e!881449 false)))

(declare-fun lt!676663 () Bool)

(declare-fun value!194 () B!2620)

(declare-fun contains!10464 (List!36792 tuple2!25452) Bool)

(assert (=> b!1580024 (= lt!676663 (contains!10464 l!1390 (tuple2!25453 key!405 value!194)))))

(declare-fun b!1580025 () Bool)

(declare-fun tp!114408 () Bool)

(assert (=> b!1580025 (= e!881450 (and tp_is_empty!39165 tp!114408))))

(assert (= (and start!137104 res!1079342) b!1580023))

(assert (= (and b!1580023 res!1079343) b!1580024))

(get-info :version)

(assert (= (and start!137104 ((_ is Cons!36788) l!1390)) b!1580025))

(declare-fun m!1451587 () Bool)

(assert (=> start!137104 m!1451587))

(declare-fun m!1451589 () Bool)

(assert (=> b!1580023 m!1451589))

(declare-fun m!1451591 () Bool)

(assert (=> b!1580024 m!1451591))

(check-sat (not start!137104) tp_is_empty!39165 (not b!1580025) (not b!1580024) (not b!1580023))
(check-sat)
