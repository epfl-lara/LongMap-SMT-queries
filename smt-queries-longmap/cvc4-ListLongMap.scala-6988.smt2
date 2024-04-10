; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88598 () Bool)

(assert start!88598)

(declare-fun res!682817 () Bool)

(declare-fun e!572951 () Bool)

(assert (=> start!88598 (=> (not res!682817) (not e!572951))))

(declare-datatypes ((B!1638 0))(
  ( (B!1639 (val!11903 Int)) )
))
(declare-datatypes ((tuple2!15352 0))(
  ( (tuple2!15353 (_1!7687 (_ BitVec 64)) (_2!7687 B!1638)) )
))
(declare-datatypes ((List!21591 0))(
  ( (Nil!21588) (Cons!21587 (h!22785 tuple2!15352) (t!30592 List!21591)) )
))
(declare-fun l!996 () List!21591)

(declare-fun isStrictlySorted!656 (List!21591) Bool)

(assert (=> start!88598 (= res!682817 (isStrictlySorted!656 l!996))))

(assert (=> start!88598 e!572951))

(declare-fun e!572952 () Bool)

(assert (=> start!88598 e!572952))

(assert (=> start!88598 true))

(declare-fun tp_is_empty!23705 () Bool)

(assert (=> start!88598 tp_is_empty!23705))

(declare-fun b!1018290 () Bool)

(declare-fun res!682816 () Bool)

(assert (=> b!1018290 (=> (not res!682816) (not e!572951))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!516 (List!21591 (_ BitVec 64)) Bool)

(assert (=> b!1018290 (= res!682816 (containsKey!516 l!996 key!261))))

(declare-fun b!1018291 () Bool)

(assert (=> b!1018291 (= e!572951 false)))

(declare-fun value!172 () B!1638)

(declare-fun lt!449514 () List!21591)

(declare-fun insertStrictlySorted!337 (List!21591 (_ BitVec 64) B!1638) List!21591)

(assert (=> b!1018291 (= lt!449514 (insertStrictlySorted!337 l!996 key!261 value!172))))

(declare-fun b!1018292 () Bool)

(declare-fun tp!71026 () Bool)

(assert (=> b!1018292 (= e!572952 (and tp_is_empty!23705 tp!71026))))

(assert (= (and start!88598 res!682817) b!1018290))

(assert (= (and b!1018290 res!682816) b!1018291))

(assert (= (and start!88598 (is-Cons!21587 l!996)) b!1018292))

(declare-fun m!939205 () Bool)

(assert (=> start!88598 m!939205))

(declare-fun m!939207 () Bool)

(assert (=> b!1018290 m!939207))

(declare-fun m!939209 () Bool)

(assert (=> b!1018291 m!939209))

(push 1)

(assert (not b!1018292))

(assert (not b!1018291))

(assert (not b!1018290))

(assert (not start!88598))

(assert tp_is_empty!23705)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

