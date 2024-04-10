; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88616 () Bool)

(assert start!88616)

(declare-fun res!682898 () Bool)

(declare-fun e!573015 () Bool)

(assert (=> start!88616 (=> (not res!682898) (not e!573015))))

(declare-datatypes ((B!1656 0))(
  ( (B!1657 (val!11912 Int)) )
))
(declare-datatypes ((tuple2!15370 0))(
  ( (tuple2!15371 (_1!7696 (_ BitVec 64)) (_2!7696 B!1656)) )
))
(declare-datatypes ((List!21600 0))(
  ( (Nil!21597) (Cons!21596 (h!22794 tuple2!15370) (t!30601 List!21600)) )
))
(declare-fun l!996 () List!21600)

(declare-fun isStrictlySorted!665 (List!21600) Bool)

(assert (=> start!88616 (= res!682898 (isStrictlySorted!665 l!996))))

(assert (=> start!88616 e!573015))

(declare-fun e!573014 () Bool)

(assert (=> start!88616 e!573014))

(assert (=> start!88616 true))

(declare-fun tp_is_empty!23723 () Bool)

(assert (=> start!88616 tp_is_empty!23723))

(declare-fun b!1018398 () Bool)

(declare-fun res!682897 () Bool)

(assert (=> b!1018398 (=> (not res!682897) (not e!573015))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!525 (List!21600 (_ BitVec 64)) Bool)

(assert (=> b!1018398 (= res!682897 (containsKey!525 l!996 key!261))))

(declare-fun b!1018399 () Bool)

(assert (=> b!1018399 (= e!573015 false)))

(declare-fun value!172 () B!1656)

(declare-fun lt!449550 () List!21600)

(declare-fun insertStrictlySorted!346 (List!21600 (_ BitVec 64) B!1656) List!21600)

(assert (=> b!1018399 (= lt!449550 (insertStrictlySorted!346 l!996 key!261 value!172))))

(declare-fun b!1018400 () Bool)

(declare-fun tp!71053 () Bool)

(assert (=> b!1018400 (= e!573014 (and tp_is_empty!23723 tp!71053))))

(assert (= (and start!88616 res!682898) b!1018398))

(assert (= (and b!1018398 res!682897) b!1018399))

(assert (= (and start!88616 (is-Cons!21596 l!996)) b!1018400))

(declare-fun m!939295 () Bool)

(assert (=> start!88616 m!939295))

(declare-fun m!939297 () Bool)

(assert (=> b!1018398 m!939297))

(declare-fun m!939299 () Bool)

(assert (=> b!1018399 m!939299))

(push 1)

(assert tp_is_empty!23723)

(assert (not b!1018400))

(assert (not start!88616))

(assert (not b!1018398))

(assert (not b!1018399))

(check-sat)

(pop 1)

(push 1)

(check-sat)

