; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137576 () Bool)

(assert start!137576)

(declare-fun res!1080539 () Bool)

(declare-fun e!883178 () Bool)

(assert (=> start!137576 (=> (not res!1080539) (not e!883178))))

(declare-datatypes ((B!2654 0))(
  ( (B!2655 (val!19689 Int)) )
))
(declare-datatypes ((tuple2!25564 0))(
  ( (tuple2!25565 (_1!12793 (_ BitVec 64)) (_2!12793 B!2654)) )
))
(declare-datatypes ((List!36841 0))(
  ( (Nil!36838) (Cons!36837 (h!38398 tuple2!25564) (t!51747 List!36841)) )
))
(declare-fun l!1390 () List!36841)

(declare-fun isStrictlySorted!1055 (List!36841) Bool)

(assert (=> start!137576 (= res!1080539 (isStrictlySorted!1055 l!1390))))

(assert (=> start!137576 e!883178))

(declare-fun e!883177 () Bool)

(assert (=> start!137576 e!883177))

(assert (=> start!137576 true))

(declare-fun tp_is_empty!39199 () Bool)

(assert (=> start!137576 tp_is_empty!39199))

(declare-fun b!1582846 () Bool)

(declare-fun res!1080538 () Bool)

(assert (=> b!1582846 (=> (not res!1080538) (not e!883178))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!914 (List!36841 (_ BitVec 64)) Bool)

(assert (=> b!1582846 (= res!1080538 (containsKey!914 l!1390 key!405))))

(declare-fun b!1582847 () Bool)

(assert (=> b!1582847 (= e!883178 false)))

(declare-fun lt!677667 () Bool)

(declare-fun value!194 () B!2654)

(declare-fun contains!10526 (List!36841 tuple2!25564) Bool)

(assert (=> b!1582847 (= lt!677667 (contains!10526 l!1390 (tuple2!25565 key!405 value!194)))))

(declare-fun b!1582848 () Bool)

(declare-fun tp!114459 () Bool)

(assert (=> b!1582848 (= e!883177 (and tp_is_empty!39199 tp!114459))))

(assert (= (and start!137576 res!1080539) b!1582846))

(assert (= (and b!1582846 res!1080538) b!1582847))

(get-info :version)

(assert (= (and start!137576 ((_ is Cons!36837) l!1390)) b!1582848))

(declare-fun m!1454127 () Bool)

(assert (=> start!137576 m!1454127))

(declare-fun m!1454129 () Bool)

(assert (=> b!1582846 m!1454129))

(declare-fun m!1454131 () Bool)

(assert (=> b!1582847 m!1454131))

(check-sat (not b!1582846) (not start!137576) tp_is_empty!39199 (not b!1582847) (not b!1582848))
(check-sat)
