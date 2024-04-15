; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137104 () Bool)

(assert start!137104)

(declare-fun res!1079495 () Bool)

(declare-fun e!881435 () Bool)

(assert (=> start!137104 (=> (not res!1079495) (not e!881435))))

(declare-datatypes ((B!2654 0))(
  ( (B!2655 (val!19689 Int)) )
))
(declare-datatypes ((tuple2!25572 0))(
  ( (tuple2!25573 (_1!12797 (_ BitVec 64)) (_2!12797 B!2654)) )
))
(declare-datatypes ((List!36850 0))(
  ( (Nil!36847) (Cons!36846 (h!38390 tuple2!25572) (t!51756 List!36850)) )
))
(declare-fun l!1390 () List!36850)

(declare-fun isStrictlySorted!1065 (List!36850) Bool)

(assert (=> start!137104 (= res!1079495 (isStrictlySorted!1065 l!1390))))

(assert (=> start!137104 e!881435))

(declare-fun e!881434 () Bool)

(assert (=> start!137104 e!881434))

(assert (=> start!137104 true))

(declare-fun tp_is_empty!39199 () Bool)

(assert (=> start!137104 tp_is_empty!39199))

(declare-fun b!1580043 () Bool)

(declare-fun res!1079496 () Bool)

(assert (=> b!1580043 (=> (not res!1079496) (not e!881435))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!911 (List!36850 (_ BitVec 64)) Bool)

(assert (=> b!1580043 (= res!1079496 (containsKey!911 l!1390 key!405))))

(declare-fun b!1580044 () Bool)

(assert (=> b!1580044 (= e!881435 false)))

(declare-fun lt!676476 () Bool)

(declare-fun value!194 () B!2654)

(declare-fun contains!10436 (List!36850 tuple2!25572) Bool)

(assert (=> b!1580044 (= lt!676476 (contains!10436 l!1390 (tuple2!25573 key!405 value!194)))))

(declare-fun b!1580045 () Bool)

(declare-fun tp!114460 () Bool)

(assert (=> b!1580045 (= e!881434 (and tp_is_empty!39199 tp!114460))))

(assert (= (and start!137104 res!1079495) b!1580043))

(assert (= (and b!1580043 res!1079496) b!1580044))

(get-info :version)

(assert (= (and start!137104 ((_ is Cons!36846) l!1390)) b!1580045))

(declare-fun m!1450935 () Bool)

(assert (=> start!137104 m!1450935))

(declare-fun m!1450937 () Bool)

(assert (=> b!1580043 m!1450937))

(declare-fun m!1450939 () Bool)

(assert (=> b!1580044 m!1450939))

(check-sat (not start!137104) (not b!1580045) tp_is_empty!39199 (not b!1580044) (not b!1580043))
(check-sat)
