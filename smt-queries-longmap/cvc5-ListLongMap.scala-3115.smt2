; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43782 () Bool)

(assert start!43782)

(declare-fun res!288343 () Bool)

(declare-fun e!284847 () Bool)

(assert (=> start!43782 (=> (not res!288343) (not e!284847))))

(declare-datatypes ((B!1112 0))(
  ( (B!1113 (val!7008 Int)) )
))
(declare-datatypes ((tuple2!9218 0))(
  ( (tuple2!9219 (_1!4620 (_ BitVec 64)) (_2!4620 B!1112)) )
))
(declare-datatypes ((List!9272 0))(
  ( (Nil!9269) (Cons!9268 (h!10124 tuple2!9218) (t!15494 List!9272)) )
))
(declare-fun l!956 () List!9272)

(declare-fun isStrictlySorted!411 (List!9272) Bool)

(assert (=> start!43782 (= res!288343 (isStrictlySorted!411 l!956))))

(assert (=> start!43782 e!284847))

(declare-fun e!284846 () Bool)

(assert (=> start!43782 e!284846))

(assert (=> start!43782 true))

(declare-fun tp_is_empty!13921 () Bool)

(assert (=> start!43782 tp_is_empty!13921))

(declare-fun b!483945 () Bool)

(declare-fun res!288344 () Bool)

(assert (=> b!483945 (=> (not res!288344) (not e!284847))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!374 (List!9272 (_ BitVec 64)) Bool)

(assert (=> b!483945 (= res!288344 (not (containsKey!374 l!956 key!251)))))

(declare-fun b!483946 () Bool)

(assert (=> b!483946 (= e!284847 false)))

(declare-fun lt!219325 () List!9272)

(declare-fun value!166 () B!1112)

(declare-fun insertStrictlySorted!229 (List!9272 (_ BitVec 64) B!1112) List!9272)

(assert (=> b!483946 (= lt!219325 (insertStrictlySorted!229 l!956 key!251 value!166))))

(declare-fun b!483947 () Bool)

(declare-fun tp!43471 () Bool)

(assert (=> b!483947 (= e!284846 (and tp_is_empty!13921 tp!43471))))

(assert (= (and start!43782 res!288343) b!483945))

(assert (= (and b!483945 res!288344) b!483946))

(assert (= (and start!43782 (is-Cons!9268 l!956)) b!483947))

(declare-fun m!464823 () Bool)

(assert (=> start!43782 m!464823))

(declare-fun m!464825 () Bool)

(assert (=> b!483945 m!464825))

(declare-fun m!464827 () Bool)

(assert (=> b!483946 m!464827))

(push 1)

(assert (not start!43782))

(assert tp_is_empty!13921)

(assert (not b!483945))

(assert (not b!483947))

(assert (not b!483946))

(check-sat)

