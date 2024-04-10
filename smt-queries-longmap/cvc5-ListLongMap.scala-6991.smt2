; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88612 () Bool)

(assert start!88612)

(declare-fun res!682886 () Bool)

(declare-fun e!573003 () Bool)

(assert (=> start!88612 (=> (not res!682886) (not e!573003))))

(declare-datatypes ((B!1652 0))(
  ( (B!1653 (val!11910 Int)) )
))
(declare-datatypes ((tuple2!15366 0))(
  ( (tuple2!15367 (_1!7694 (_ BitVec 64)) (_2!7694 B!1652)) )
))
(declare-datatypes ((List!21598 0))(
  ( (Nil!21595) (Cons!21594 (h!22792 tuple2!15366) (t!30599 List!21598)) )
))
(declare-fun l!996 () List!21598)

(declare-fun isStrictlySorted!663 (List!21598) Bool)

(assert (=> start!88612 (= res!682886 (isStrictlySorted!663 l!996))))

(assert (=> start!88612 e!573003))

(declare-fun e!573002 () Bool)

(assert (=> start!88612 e!573002))

(assert (=> start!88612 true))

(declare-fun tp_is_empty!23719 () Bool)

(assert (=> start!88612 tp_is_empty!23719))

(declare-fun b!1018380 () Bool)

(declare-fun res!682885 () Bool)

(assert (=> b!1018380 (=> (not res!682885) (not e!573003))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!523 (List!21598 (_ BitVec 64)) Bool)

(assert (=> b!1018380 (= res!682885 (containsKey!523 l!996 key!261))))

(declare-fun b!1018381 () Bool)

(assert (=> b!1018381 (= e!573003 false)))

(declare-fun value!172 () B!1652)

(declare-fun lt!449544 () List!21598)

(declare-fun insertStrictlySorted!344 (List!21598 (_ BitVec 64) B!1652) List!21598)

(assert (=> b!1018381 (= lt!449544 (insertStrictlySorted!344 l!996 key!261 value!172))))

(declare-fun b!1018382 () Bool)

(declare-fun tp!71047 () Bool)

(assert (=> b!1018382 (= e!573002 (and tp_is_empty!23719 tp!71047))))

(assert (= (and start!88612 res!682886) b!1018380))

(assert (= (and b!1018380 res!682885) b!1018381))

(assert (= (and start!88612 (is-Cons!21594 l!996)) b!1018382))

(declare-fun m!939283 () Bool)

(assert (=> start!88612 m!939283))

(declare-fun m!939285 () Bool)

(assert (=> b!1018380 m!939285))

(declare-fun m!939287 () Bool)

(assert (=> b!1018381 m!939287))

(push 1)

(assert (not start!88612))

(assert (not b!1018380))

(assert (not b!1018382))

(assert tp_is_empty!23719)

(assert (not b!1018381))

(check-sat)

(pop 1)

