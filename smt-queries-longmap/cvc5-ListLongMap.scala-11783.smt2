; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138422 () Bool)

(assert start!138422)

(declare-fun res!1083353 () Bool)

(declare-fun e!885857 () Bool)

(assert (=> start!138422 (=> (not res!1083353) (not e!885857))))

(declare-datatypes ((B!3038 0))(
  ( (B!3039 (val!19881 Int)) )
))
(declare-datatypes ((tuple2!25930 0))(
  ( (tuple2!25931 (_1!12976 (_ BitVec 64)) (_2!12976 B!3038)) )
))
(declare-datatypes ((List!37001 0))(
  ( (Nil!36998) (Cons!36997 (h!38540 tuple2!25930) (t!51931 List!37001)) )
))
(declare-fun l!636 () List!37001)

(declare-fun isStrictlySorted!1223 (List!37001) Bool)

(assert (=> start!138422 (= res!1083353 (isStrictlySorted!1223 l!636))))

(assert (=> start!138422 e!885857))

(declare-fun e!885858 () Bool)

(assert (=> start!138422 e!885858))

(assert (=> start!138422 true))

(declare-fun b!1586344 () Bool)

(declare-fun key!185 () (_ BitVec 64))

(assert (=> b!1586344 (= e!885857 (and (or (not (is-Cons!36997 l!636)) (not (= (_1!12976 (h!38540 l!636)) key!185))) (or (not (is-Cons!36997 l!636)) (bvsle (_1!12976 (h!38540 l!636)) key!185)) (or (not (is-Cons!36997 l!636)) (bvsge (_1!12976 (h!38540 l!636)) key!185)) (not (is-Nil!36998 l!636))))))

(declare-fun b!1586345 () Bool)

(declare-fun tp_is_empty!39571 () Bool)

(declare-fun tp!115416 () Bool)

(assert (=> b!1586345 (= e!885858 (and tp_is_empty!39571 tp!115416))))

(assert (= (and start!138422 res!1083353) b!1586344))

(assert (= (and start!138422 (is-Cons!36997 l!636)) b!1586345))

(declare-fun m!1454733 () Bool)

(assert (=> start!138422 m!1454733))

(push 1)

(assert (not start!138422))

(assert (not b!1586345))

(assert tp_is_empty!39571)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

