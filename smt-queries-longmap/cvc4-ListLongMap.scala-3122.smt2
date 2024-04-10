; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43978 () Bool)

(assert start!43978)

(declare-fun res!288983 () Bool)

(declare-fun e!285690 () Bool)

(assert (=> start!43978 (=> (not res!288983) (not e!285690))))

(declare-datatypes ((B!1158 0))(
  ( (B!1159 (val!7031 Int)) )
))
(declare-datatypes ((tuple2!9264 0))(
  ( (tuple2!9265 (_1!4643 (_ BitVec 64)) (_2!4643 B!1158)) )
))
(declare-datatypes ((List!9295 0))(
  ( (Nil!9292) (Cons!9291 (h!10147 tuple2!9264) (t!15520 List!9295)) )
))
(declare-fun l!956 () List!9295)

(declare-fun isStrictlySorted!434 (List!9295) Bool)

(assert (=> start!43978 (= res!288983 (isStrictlySorted!434 l!956))))

(assert (=> start!43978 e!285690))

(declare-fun e!285689 () Bool)

(assert (=> start!43978 e!285689))

(assert (=> start!43978 true))

(declare-fun tp_is_empty!13967 () Bool)

(assert (=> start!43978 tp_is_empty!13967))

(declare-fun b!485232 () Bool)

(declare-fun res!288982 () Bool)

(assert (=> b!485232 (=> (not res!288982) (not e!285690))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!397 (List!9295 (_ BitVec 64)) Bool)

(assert (=> b!485232 (= res!288982 (not (containsKey!397 l!956 key!251)))))

(declare-fun b!485233 () Bool)

(assert (=> b!485233 (= e!285690 false)))

(declare-fun lt!219505 () List!9295)

(declare-fun value!166 () B!1158)

(declare-fun insertStrictlySorted!249 (List!9295 (_ BitVec 64) B!1158) List!9295)

(assert (=> b!485233 (= lt!219505 (insertStrictlySorted!249 l!956 key!251 value!166))))

(declare-fun b!485234 () Bool)

(declare-fun tp!43597 () Bool)

(assert (=> b!485234 (= e!285689 (and tp_is_empty!13967 tp!43597))))

(assert (= (and start!43978 res!288983) b!485232))

(assert (= (and b!485232 res!288982) b!485233))

(assert (= (and start!43978 (is-Cons!9291 l!956)) b!485234))

(declare-fun m!465459 () Bool)

(assert (=> start!43978 m!465459))

(declare-fun m!465461 () Bool)

(assert (=> b!485232 m!465461))

(declare-fun m!465463 () Bool)

(assert (=> b!485233 m!465463))

(push 1)

(assert (not start!43978))

(assert (not b!485232))

(assert (not b!485234))

(assert (not b!485233))

(assert tp_is_empty!13967)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

