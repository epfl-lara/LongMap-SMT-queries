; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137516 () Bool)

(assert start!137516)

(declare-fun res!1080699 () Bool)

(declare-fun e!882700 () Bool)

(assert (=> start!137516 (=> (not res!1080699) (not e!882700))))

(declare-datatypes ((B!2710 0))(
  ( (B!2711 (val!19717 Int)) )
))
(declare-datatypes ((tuple2!25602 0))(
  ( (tuple2!25603 (_1!12812 (_ BitVec 64)) (_2!12812 B!2710)) )
))
(declare-datatypes ((List!36837 0))(
  ( (Nil!36834) (Cons!36833 (h!38376 tuple2!25602) (t!51751 List!36837)) )
))
(declare-fun l!1390 () List!36837)

(declare-fun isStrictlySorted!1095 (List!36837) Bool)

(assert (=> start!137516 (= res!1080699 (isStrictlySorted!1095 l!1390))))

(assert (=> start!137516 e!882700))

(declare-fun e!882701 () Bool)

(assert (=> start!137516 e!882701))

(assert (=> start!137516 true))

(declare-fun tp_is_empty!39255 () Bool)

(assert (=> start!137516 tp_is_empty!39255))

(declare-fun b!1581854 () Bool)

(declare-fun res!1080698 () Bool)

(assert (=> b!1581854 (=> (not res!1080698) (not e!882700))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!941 (List!36837 (_ BitVec 64)) Bool)

(assert (=> b!1581854 (= res!1080698 (containsKey!941 l!1390 key!405))))

(declare-fun b!1581855 () Bool)

(assert (=> b!1581855 (= e!882700 false)))

(declare-fun value!194 () B!2710)

(declare-fun lt!677022 () Bool)

(declare-fun contains!10509 (List!36837 tuple2!25602) Bool)

(assert (=> b!1581855 (= lt!677022 (contains!10509 l!1390 (tuple2!25603 key!405 value!194)))))

(declare-fun b!1581856 () Bool)

(declare-fun tp!114617 () Bool)

(assert (=> b!1581856 (= e!882701 (and tp_is_empty!39255 tp!114617))))

(assert (= (and start!137516 res!1080699) b!1581854))

(assert (= (and b!1581854 res!1080698) b!1581855))

(get-info :version)

(assert (= (and start!137516 ((_ is Cons!36833) l!1390)) b!1581856))

(declare-fun m!1452629 () Bool)

(assert (=> start!137516 m!1452629))

(declare-fun m!1452631 () Bool)

(assert (=> b!1581854 m!1452631))

(declare-fun m!1452633 () Bool)

(assert (=> b!1581855 m!1452633))

(check-sat (not b!1581854) (not start!137516) tp_is_empty!39255 (not b!1581855) (not b!1581856))
(check-sat)
