; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137946 () Bool)

(assert start!137946)

(declare-fun res!1081758 () Bool)

(declare-fun e!883990 () Bool)

(assert (=> start!137946 (=> (not res!1081758) (not e!883990))))

(declare-datatypes ((B!2884 0))(
  ( (B!2885 (val!19804 Int)) )
))
(declare-datatypes ((tuple2!25776 0))(
  ( (tuple2!25777 (_1!12899 (_ BitVec 64)) (_2!12899 B!2884)) )
))
(declare-datatypes ((List!36924 0))(
  ( (Nil!36921) (Cons!36920 (h!38463 tuple2!25776) (t!51838 List!36924)) )
))
(declare-fun l!1251 () List!36924)

(declare-fun isStrictlySorted!1152 (List!36924) Bool)

(assert (=> start!137946 (= res!1081758 (isStrictlySorted!1152 l!1251))))

(assert (=> start!137946 e!883990))

(declare-fun e!883989 () Bool)

(assert (=> start!137946 e!883989))

(assert (=> start!137946 true))

(declare-fun tp_is_empty!39417 () Bool)

(assert (=> start!137946 tp_is_empty!39417))

(declare-fun b!1583636 () Bool)

(assert (=> b!1583636 (= e!883990 (not true))))

(declare-fun newKey!123 () (_ BitVec 64))

(declare-fun newValue!123 () B!2884)

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-fun containsKey!986 (List!36924 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!618 (List!36924 (_ BitVec 64) B!2884) List!36924)

(assert (=> b!1583636 (not (containsKey!986 (insertStrictlySorted!618 (t!51838 l!1251) newKey!123 newValue!123) otherKey!56))))

(declare-datatypes ((Unit!52287 0))(
  ( (Unit!52288) )
))
(declare-fun lt!677193 () Unit!52287)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!5 (List!36924 (_ BitVec 64) B!2884 (_ BitVec 64)) Unit!52287)

(assert (=> b!1583636 (= lt!677193 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!5 (t!51838 l!1251) newKey!123 newValue!123 otherKey!56))))

(declare-fun b!1583637 () Bool)

(declare-fun tp!115015 () Bool)

(assert (=> b!1583637 (= e!883989 (and tp_is_empty!39417 tp!115015))))

(declare-fun b!1583638 () Bool)

(declare-fun res!1081756 () Bool)

(assert (=> b!1583638 (=> (not res!1081756) (not e!883990))))

(assert (=> b!1583638 (= res!1081756 (isStrictlySorted!1152 (t!51838 l!1251)))))

(declare-fun b!1583639 () Bool)

(declare-fun res!1081760 () Bool)

(assert (=> b!1583639 (=> (not res!1081760) (not e!883990))))

(get-info :version)

(assert (=> b!1583639 (= res!1081760 (and (not (= otherKey!56 newKey!123)) ((_ is Cons!36920) l!1251)))))

(declare-fun b!1583640 () Bool)

(declare-fun res!1081757 () Bool)

(assert (=> b!1583640 (=> (not res!1081757) (not e!883990))))

(assert (=> b!1583640 (= res!1081757 (not (containsKey!986 (t!51838 l!1251) otherKey!56)))))

(declare-fun b!1583641 () Bool)

(declare-fun res!1081759 () Bool)

(assert (=> b!1583641 (=> (not res!1081759) (not e!883990))))

(assert (=> b!1583641 (= res!1081759 (not (containsKey!986 l!1251 otherKey!56)))))

(assert (= (and start!137946 res!1081758) b!1583641))

(assert (= (and b!1583641 res!1081759) b!1583639))

(assert (= (and b!1583639 res!1081760) b!1583638))

(assert (= (and b!1583638 res!1081756) b!1583640))

(assert (= (and b!1583640 res!1081757) b!1583636))

(assert (= (and start!137946 ((_ is Cons!36920) l!1251)) b!1583637))

(declare-fun m!1453375 () Bool)

(assert (=> b!1583641 m!1453375))

(declare-fun m!1453377 () Bool)

(assert (=> b!1583640 m!1453377))

(declare-fun m!1453379 () Bool)

(assert (=> start!137946 m!1453379))

(declare-fun m!1453381 () Bool)

(assert (=> b!1583638 m!1453381))

(declare-fun m!1453383 () Bool)

(assert (=> b!1583636 m!1453383))

(assert (=> b!1583636 m!1453383))

(declare-fun m!1453385 () Bool)

(assert (=> b!1583636 m!1453385))

(declare-fun m!1453387 () Bool)

(assert (=> b!1583636 m!1453387))

(check-sat tp_is_empty!39417 (not b!1583638) (not b!1583641) (not b!1583640) (not start!137946) (not b!1583637) (not b!1583636))
(check-sat)
