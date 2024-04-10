; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137108 () Bool)

(assert start!137108)

(declare-fun b!1580044 () Bool)

(declare-fun res!1079357 () Bool)

(declare-fun e!881461 () Bool)

(assert (=> b!1580044 (=> (not res!1079357) (not e!881461))))

(declare-fun key!405 () (_ BitVec 64))

(declare-datatypes ((B!2624 0))(
  ( (B!2625 (val!19674 Int)) )
))
(declare-datatypes ((tuple2!25456 0))(
  ( (tuple2!25457 (_1!12739 (_ BitVec 64)) (_2!12739 B!2624)) )
))
(declare-datatypes ((List!36794 0))(
  ( (Nil!36791) (Cons!36790 (h!38333 tuple2!25456) (t!51708 List!36794)) )
))
(declare-fun l!1390 () List!36794)

(declare-fun value!194 () B!2624)

(declare-fun contains!10466 (List!36794 tuple2!25456) Bool)

(assert (=> b!1580044 (= res!1079357 (contains!10466 l!1390 (tuple2!25457 key!405 value!194)))))

(declare-fun b!1580043 () Bool)

(declare-fun res!1079356 () Bool)

(assert (=> b!1580043 (=> (not res!1079356) (not e!881461))))

(declare-fun containsKey!898 (List!36794 (_ BitVec 64)) Bool)

(assert (=> b!1580043 (= res!1079356 (containsKey!898 l!1390 key!405))))

(declare-fun b!1580045 () Bool)

(assert (=> b!1580045 (= e!881461 false)))

(declare-fun b!1580046 () Bool)

(declare-fun e!881462 () Bool)

(declare-fun tp_is_empty!39169 () Bool)

(declare-fun tp!114414 () Bool)

(assert (=> b!1580046 (= e!881462 (and tp_is_empty!39169 tp!114414))))

(declare-fun res!1079358 () Bool)

(assert (=> start!137108 (=> (not res!1079358) (not e!881461))))

(declare-fun isStrictlySorted!1052 (List!36794) Bool)

(assert (=> start!137108 (= res!1079358 (isStrictlySorted!1052 l!1390))))

(assert (=> start!137108 e!881461))

(assert (=> start!137108 e!881462))

(assert (=> start!137108 true))

(assert (=> start!137108 tp_is_empty!39169))

(assert (= (and start!137108 res!1079358) b!1580043))

(assert (= (and b!1580043 res!1079356) b!1580044))

(assert (= (and b!1580044 res!1079357) b!1580045))

(assert (= (and start!137108 (is-Cons!36790 l!1390)) b!1580046))

(declare-fun m!1451599 () Bool)

(assert (=> b!1580044 m!1451599))

(declare-fun m!1451601 () Bool)

(assert (=> b!1580043 m!1451601))

(declare-fun m!1451603 () Bool)

(assert (=> start!137108 m!1451603))

(push 1)

(assert (not b!1580046))

(assert (not b!1580043))

(assert (not b!1580044))

(assert tp_is_empty!39169)

(assert (not start!137108))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

