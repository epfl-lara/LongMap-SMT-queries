; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138384 () Bool)

(assert start!138384)

(declare-fun b!1586125 () Bool)

(declare-fun e!885540 () Bool)

(declare-fun tp_is_empty!39415 () Bool)

(declare-fun tp!115013 () Bool)

(assert (=> b!1586125 (= e!885540 (and tp_is_empty!39415 tp!115013))))

(declare-fun b!1586126 () Bool)

(declare-fun e!885541 () Bool)

(assert (=> b!1586126 (= e!885541 (not true))))

(declare-fun newKey!123 () (_ BitVec 64))

(declare-datatypes ((B!2882 0))(
  ( (B!2883 (val!19803 Int)) )
))
(declare-fun newValue!123 () B!2882)

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-datatypes ((tuple2!25834 0))(
  ( (tuple2!25835 (_1!12928 (_ BitVec 64)) (_2!12928 B!2882)) )
))
(declare-datatypes ((List!36955 0))(
  ( (Nil!36952) (Cons!36951 (h!38512 tuple2!25834) (t!51861 List!36955)) )
))
(declare-fun l!1251 () List!36955)

(declare-fun containsKey!986 (List!36955 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!618 (List!36955 (_ BitVec 64) B!2882) List!36955)

(assert (=> b!1586126 (not (containsKey!986 (insertStrictlySorted!618 (t!51861 l!1251) newKey!123 newValue!123) otherKey!56))))

(declare-datatypes ((Unit!52192 0))(
  ( (Unit!52193) )
))
(declare-fun lt!678099 () Unit!52192)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!4 (List!36955 (_ BitVec 64) B!2882 (_ BitVec 64)) Unit!52192)

(assert (=> b!1586126 (= lt!678099 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!4 (t!51861 l!1251) newKey!123 newValue!123 otherKey!56))))

(declare-fun b!1586127 () Bool)

(declare-fun res!1082661 () Bool)

(assert (=> b!1586127 (=> (not res!1082661) (not e!885541))))

(declare-fun isStrictlySorted!1139 (List!36955) Bool)

(assert (=> b!1586127 (= res!1082661 (isStrictlySorted!1139 (t!51861 l!1251)))))

(declare-fun res!1082663 () Bool)

(assert (=> start!138384 (=> (not res!1082663) (not e!885541))))

(assert (=> start!138384 (= res!1082663 (isStrictlySorted!1139 l!1251))))

(assert (=> start!138384 e!885541))

(assert (=> start!138384 e!885540))

(assert (=> start!138384 true))

(assert (=> start!138384 tp_is_empty!39415))

(declare-fun b!1586128 () Bool)

(declare-fun res!1082664 () Bool)

(assert (=> b!1586128 (=> (not res!1082664) (not e!885541))))

(assert (=> b!1586128 (= res!1082664 (not (containsKey!986 l!1251 otherKey!56)))))

(declare-fun b!1586129 () Bool)

(declare-fun res!1082662 () Bool)

(assert (=> b!1586129 (=> (not res!1082662) (not e!885541))))

(get-info :version)

(assert (=> b!1586129 (= res!1082662 (and (not (= otherKey!56 newKey!123)) ((_ is Cons!36951) l!1251)))))

(declare-fun b!1586130 () Bool)

(declare-fun res!1082665 () Bool)

(assert (=> b!1586130 (=> (not res!1082665) (not e!885541))))

(assert (=> b!1586130 (= res!1082665 (not (containsKey!986 (t!51861 l!1251) otherKey!56)))))

(assert (= (and start!138384 res!1082663) b!1586128))

(assert (= (and b!1586128 res!1082664) b!1586129))

(assert (= (and b!1586129 res!1082662) b!1586127))

(assert (= (and b!1586127 res!1082661) b!1586130))

(assert (= (and b!1586130 res!1082665) b!1586126))

(assert (= (and start!138384 ((_ is Cons!36951) l!1251)) b!1586125))

(declare-fun m!1455687 () Bool)

(assert (=> b!1586126 m!1455687))

(assert (=> b!1586126 m!1455687))

(declare-fun m!1455689 () Bool)

(assert (=> b!1586126 m!1455689))

(declare-fun m!1455691 () Bool)

(assert (=> b!1586126 m!1455691))

(declare-fun m!1455693 () Bool)

(assert (=> b!1586130 m!1455693))

(declare-fun m!1455695 () Bool)

(assert (=> b!1586128 m!1455695))

(declare-fun m!1455697 () Bool)

(assert (=> start!138384 m!1455697))

(declare-fun m!1455699 () Bool)

(assert (=> b!1586127 m!1455699))

(check-sat (not b!1586128) (not b!1586127) tp_is_empty!39415 (not b!1586125) (not b!1586126) (not b!1586130) (not start!138384))
(check-sat)
