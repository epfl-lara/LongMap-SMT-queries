; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88588 () Bool)

(assert start!88588)

(declare-fun res!682787 () Bool)

(declare-fun e!572921 () Bool)

(assert (=> start!88588 (=> (not res!682787) (not e!572921))))

(declare-datatypes ((B!1628 0))(
  ( (B!1629 (val!11898 Int)) )
))
(declare-datatypes ((tuple2!15342 0))(
  ( (tuple2!15343 (_1!7682 (_ BitVec 64)) (_2!7682 B!1628)) )
))
(declare-datatypes ((List!21586 0))(
  ( (Nil!21583) (Cons!21582 (h!22780 tuple2!15342) (t!30587 List!21586)) )
))
(declare-fun l!996 () List!21586)

(declare-fun isStrictlySorted!651 (List!21586) Bool)

(assert (=> start!88588 (= res!682787 (isStrictlySorted!651 l!996))))

(assert (=> start!88588 e!572921))

(declare-fun e!572922 () Bool)

(assert (=> start!88588 e!572922))

(assert (=> start!88588 true))

(declare-fun tp_is_empty!23695 () Bool)

(assert (=> start!88588 tp_is_empty!23695))

(declare-fun b!1018245 () Bool)

(declare-fun res!682786 () Bool)

(assert (=> b!1018245 (=> (not res!682786) (not e!572921))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!511 (List!21586 (_ BitVec 64)) Bool)

(assert (=> b!1018245 (= res!682786 (containsKey!511 l!996 key!261))))

(declare-fun b!1018246 () Bool)

(assert (=> b!1018246 (= e!572921 false)))

(declare-fun value!172 () B!1628)

(declare-fun lt!449499 () List!21586)

(declare-fun insertStrictlySorted!332 (List!21586 (_ BitVec 64) B!1628) List!21586)

(assert (=> b!1018246 (= lt!449499 (insertStrictlySorted!332 l!996 key!261 value!172))))

(declare-fun b!1018247 () Bool)

(declare-fun tp!71011 () Bool)

(assert (=> b!1018247 (= e!572922 (and tp_is_empty!23695 tp!71011))))

(assert (= (and start!88588 res!682787) b!1018245))

(assert (= (and b!1018245 res!682786) b!1018246))

(assert (= (and start!88588 (is-Cons!21582 l!996)) b!1018247))

(declare-fun m!939175 () Bool)

(assert (=> start!88588 m!939175))

(declare-fun m!939177 () Bool)

(assert (=> b!1018245 m!939177))

(declare-fun m!939179 () Bool)

(assert (=> b!1018246 m!939179))

(push 1)

(assert (not b!1018247))

(assert (not b!1018246))

(assert (not start!88588))

(assert tp_is_empty!23695)

(assert (not b!1018245))

(check-sat)

(pop 1)

