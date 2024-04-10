; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88594 () Bool)

(assert start!88594)

(declare-fun res!682804 () Bool)

(declare-fun e!572940 () Bool)

(assert (=> start!88594 (=> (not res!682804) (not e!572940))))

(declare-datatypes ((B!1634 0))(
  ( (B!1635 (val!11901 Int)) )
))
(declare-datatypes ((tuple2!15348 0))(
  ( (tuple2!15349 (_1!7685 (_ BitVec 64)) (_2!7685 B!1634)) )
))
(declare-datatypes ((List!21589 0))(
  ( (Nil!21586) (Cons!21585 (h!22783 tuple2!15348) (t!30590 List!21589)) )
))
(declare-fun l!996 () List!21589)

(declare-fun isStrictlySorted!654 (List!21589) Bool)

(assert (=> start!88594 (= res!682804 (isStrictlySorted!654 l!996))))

(assert (=> start!88594 e!572940))

(declare-fun e!572939 () Bool)

(assert (=> start!88594 e!572939))

(assert (=> start!88594 true))

(declare-fun tp_is_empty!23701 () Bool)

(assert (=> start!88594 tp_is_empty!23701))

(declare-fun b!1018272 () Bool)

(declare-fun res!682805 () Bool)

(assert (=> b!1018272 (=> (not res!682805) (not e!572940))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!514 (List!21589 (_ BitVec 64)) Bool)

(assert (=> b!1018272 (= res!682805 (containsKey!514 l!996 key!261))))

(declare-fun b!1018273 () Bool)

(assert (=> b!1018273 (= e!572940 false)))

(declare-fun value!172 () B!1634)

(declare-fun lt!449508 () List!21589)

(declare-fun insertStrictlySorted!335 (List!21589 (_ BitVec 64) B!1634) List!21589)

(assert (=> b!1018273 (= lt!449508 (insertStrictlySorted!335 l!996 key!261 value!172))))

(declare-fun b!1018274 () Bool)

(declare-fun tp!71020 () Bool)

(assert (=> b!1018274 (= e!572939 (and tp_is_empty!23701 tp!71020))))

(assert (= (and start!88594 res!682804) b!1018272))

(assert (= (and b!1018272 res!682805) b!1018273))

(assert (= (and start!88594 (is-Cons!21585 l!996)) b!1018274))

(declare-fun m!939193 () Bool)

(assert (=> start!88594 m!939193))

(declare-fun m!939195 () Bool)

(assert (=> b!1018272 m!939195))

(declare-fun m!939197 () Bool)

(assert (=> b!1018273 m!939197))

(push 1)

(assert (not b!1018272))

(assert (not b!1018273))

(assert (not b!1018274))

(assert tp_is_empty!23701)

(assert (not start!88594))

(check-sat)

(pop 1)

