; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88610 () Bool)

(assert start!88610)

(declare-fun res!682880 () Bool)

(declare-fun e!572996 () Bool)

(assert (=> start!88610 (=> (not res!682880) (not e!572996))))

(declare-datatypes ((B!1650 0))(
  ( (B!1651 (val!11909 Int)) )
))
(declare-datatypes ((tuple2!15364 0))(
  ( (tuple2!15365 (_1!7693 (_ BitVec 64)) (_2!7693 B!1650)) )
))
(declare-datatypes ((List!21597 0))(
  ( (Nil!21594) (Cons!21593 (h!22791 tuple2!15364) (t!30598 List!21597)) )
))
(declare-fun l!996 () List!21597)

(declare-fun isStrictlySorted!662 (List!21597) Bool)

(assert (=> start!88610 (= res!682880 (isStrictlySorted!662 l!996))))

(assert (=> start!88610 e!572996))

(declare-fun e!572997 () Bool)

(assert (=> start!88610 e!572997))

(assert (=> start!88610 true))

(declare-fun tp_is_empty!23717 () Bool)

(assert (=> start!88610 tp_is_empty!23717))

(declare-fun b!1018371 () Bool)

(declare-fun res!682879 () Bool)

(assert (=> b!1018371 (=> (not res!682879) (not e!572996))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!522 (List!21597 (_ BitVec 64)) Bool)

(assert (=> b!1018371 (= res!682879 (containsKey!522 l!996 key!261))))

(declare-fun b!1018372 () Bool)

(assert (=> b!1018372 (= e!572996 false)))

(declare-fun lt!449541 () List!21597)

(declare-fun value!172 () B!1650)

(declare-fun insertStrictlySorted!343 (List!21597 (_ BitVec 64) B!1650) List!21597)

(assert (=> b!1018372 (= lt!449541 (insertStrictlySorted!343 l!996 key!261 value!172))))

(declare-fun b!1018373 () Bool)

(declare-fun tp!71044 () Bool)

(assert (=> b!1018373 (= e!572997 (and tp_is_empty!23717 tp!71044))))

(assert (= (and start!88610 res!682880) b!1018371))

(assert (= (and b!1018371 res!682879) b!1018372))

(assert (= (and start!88610 (is-Cons!21593 l!996)) b!1018373))

(declare-fun m!939277 () Bool)

(assert (=> start!88610 m!939277))

(declare-fun m!939279 () Bool)

(assert (=> b!1018371 m!939279))

(declare-fun m!939281 () Bool)

(assert (=> b!1018372 m!939281))

(push 1)

(assert tp_is_empty!23717)

(assert (not start!88610))

(assert (not b!1018371))

(assert (not b!1018372))

(assert (not b!1018373))

(check-sat)

(pop 1)

