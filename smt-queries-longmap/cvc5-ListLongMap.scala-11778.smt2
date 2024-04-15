; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138330 () Bool)

(assert start!138330)

(declare-fun res!1083078 () Bool)

(declare-fun e!885452 () Bool)

(assert (=> start!138330 (=> (not res!1083078) (not e!885452))))

(declare-datatypes ((B!3012 0))(
  ( (B!3013 (val!19868 Int)) )
))
(declare-datatypes ((tuple2!25972 0))(
  ( (tuple2!25973 (_1!12997 (_ BitVec 64)) (_2!12997 B!3012)) )
))
(declare-datatypes ((List!37029 0))(
  ( (Nil!37026) (Cons!37025 (h!38569 tuple2!25972) (t!51951 List!37029)) )
))
(declare-fun l!556 () List!37029)

(declare-fun isStrictlySorted!1208 (List!37029) Bool)

(assert (=> start!138330 (= res!1083078 (isStrictlySorted!1208 l!556))))

(assert (=> start!138330 e!885452))

(declare-fun e!885453 () Bool)

(assert (=> start!138330 e!885453))

(assert (=> start!138330 true))

(declare-fun b!1585749 () Bool)

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1585749 (= e!885452 (and (or (not (is-Cons!37025 l!556)) (bvsge (_1!12997 (h!38569 l!556)) newKey!21)) (or (not (is-Cons!37025 l!556)) (not (= (_1!12997 (h!38569 l!556)) newKey!21))) (or (not (is-Cons!37025 l!556)) (bvsle (_1!12997 (h!38569 l!556)) newKey!21)) (not (is-Nil!37026 l!556))))))

(declare-fun b!1585750 () Bool)

(declare-fun tp_is_empty!39545 () Bool)

(declare-fun tp!115341 () Bool)

(assert (=> b!1585750 (= e!885453 (and tp_is_empty!39545 tp!115341))))

(assert (= (and start!138330 res!1083078) b!1585749))

(assert (= (and start!138330 (is-Cons!37025 l!556)) b!1585750))

(declare-fun m!1453753 () Bool)

(assert (=> start!138330 m!1453753))

(push 1)

(assert (not start!138330))

(assert (not b!1585750))

(assert tp_is_empty!39545)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

