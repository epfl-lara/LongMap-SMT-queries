; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43758 () Bool)

(assert start!43758)

(declare-fun res!288244 () Bool)

(declare-fun e!284765 () Bool)

(assert (=> start!43758 (=> (not res!288244) (not e!284765))))

(declare-datatypes ((B!1088 0))(
  ( (B!1089 (val!6996 Int)) )
))
(declare-datatypes ((tuple2!9194 0))(
  ( (tuple2!9195 (_1!4608 (_ BitVec 64)) (_2!4608 B!1088)) )
))
(declare-datatypes ((List!9260 0))(
  ( (Nil!9257) (Cons!9256 (h!10112 tuple2!9194) (t!15482 List!9260)) )
))
(declare-fun l!956 () List!9260)

(declare-fun isStrictlySorted!399 (List!9260) Bool)

(assert (=> start!43758 (= res!288244 (isStrictlySorted!399 l!956))))

(assert (=> start!43758 e!284765))

(declare-fun e!284766 () Bool)

(assert (=> start!43758 e!284766))

(assert (=> start!43758 true))

(declare-fun tp_is_empty!13897 () Bool)

(assert (=> start!43758 tp_is_empty!13897))

(declare-fun b!483810 () Bool)

(declare-fun res!288245 () Bool)

(assert (=> b!483810 (=> (not res!288245) (not e!284765))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!362 (List!9260 (_ BitVec 64)) Bool)

(assert (=> b!483810 (= res!288245 (not (containsKey!362 l!956 key!251)))))

(declare-fun b!483811 () Bool)

(assert (=> b!483811 (= e!284765 false)))

(declare-fun lt!219280 () List!9260)

(declare-fun value!166 () B!1088)

(declare-fun insertStrictlySorted!217 (List!9260 (_ BitVec 64) B!1088) List!9260)

(assert (=> b!483811 (= lt!219280 (insertStrictlySorted!217 l!956 key!251 value!166))))

(declare-fun b!483812 () Bool)

(declare-fun tp!43435 () Bool)

(assert (=> b!483812 (= e!284766 (and tp_is_empty!13897 tp!43435))))

(assert (= (and start!43758 res!288244) b!483810))

(assert (= (and b!483810 res!288245) b!483811))

(assert (= (and start!43758 (is-Cons!9256 l!956)) b!483812))

(declare-fun m!464715 () Bool)

(assert (=> start!43758 m!464715))

(declare-fun m!464717 () Bool)

(assert (=> b!483810 m!464717))

(declare-fun m!464719 () Bool)

(assert (=> b!483811 m!464719))

(push 1)

(assert (not b!483811))

(assert (not start!43758))

(assert (not b!483810))

(assert (not b!483812))

(assert tp_is_empty!13897)

(check-sat)

