; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43974 () Bool)

(assert start!43974)

(declare-fun res!288970 () Bool)

(declare-fun e!285678 () Bool)

(assert (=> start!43974 (=> (not res!288970) (not e!285678))))

(declare-datatypes ((B!1154 0))(
  ( (B!1155 (val!7029 Int)) )
))
(declare-datatypes ((tuple2!9260 0))(
  ( (tuple2!9261 (_1!4641 (_ BitVec 64)) (_2!4641 B!1154)) )
))
(declare-datatypes ((List!9293 0))(
  ( (Nil!9290) (Cons!9289 (h!10145 tuple2!9260) (t!15518 List!9293)) )
))
(declare-fun l!956 () List!9293)

(declare-fun isStrictlySorted!432 (List!9293) Bool)

(assert (=> start!43974 (= res!288970 (isStrictlySorted!432 l!956))))

(assert (=> start!43974 e!285678))

(declare-fun e!285677 () Bool)

(assert (=> start!43974 e!285677))

(assert (=> start!43974 true))

(declare-fun tp_is_empty!13963 () Bool)

(assert (=> start!43974 tp_is_empty!13963))

(declare-fun b!485214 () Bool)

(declare-fun res!288971 () Bool)

(assert (=> b!485214 (=> (not res!288971) (not e!285678))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!395 (List!9293 (_ BitVec 64)) Bool)

(assert (=> b!485214 (= res!288971 (not (containsKey!395 l!956 key!251)))))

(declare-fun b!485215 () Bool)

(assert (=> b!485215 (= e!285678 false)))

(declare-fun lt!219499 () List!9293)

(declare-fun value!166 () B!1154)

(declare-fun insertStrictlySorted!247 (List!9293 (_ BitVec 64) B!1154) List!9293)

(assert (=> b!485215 (= lt!219499 (insertStrictlySorted!247 l!956 key!251 value!166))))

(declare-fun b!485216 () Bool)

(declare-fun tp!43591 () Bool)

(assert (=> b!485216 (= e!285677 (and tp_is_empty!13963 tp!43591))))

(assert (= (and start!43974 res!288970) b!485214))

(assert (= (and b!485214 res!288971) b!485215))

(assert (= (and start!43974 (is-Cons!9289 l!956)) b!485216))

(declare-fun m!465447 () Bool)

(assert (=> start!43974 m!465447))

(declare-fun m!465449 () Bool)

(assert (=> b!485214 m!465449))

(declare-fun m!465451 () Bool)

(assert (=> b!485215 m!465451))

(push 1)

(assert tp_is_empty!13963)

(assert (not b!485214))

(assert (not b!485216))

(assert (not b!485215))

(assert (not start!43974))

(check-sat)

(pop 1)

(push 1)

(check-sat)

