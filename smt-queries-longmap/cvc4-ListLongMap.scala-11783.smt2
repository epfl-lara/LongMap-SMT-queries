; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138426 () Bool)

(assert start!138426)

(declare-fun res!1083359 () Bool)

(declare-fun e!885869 () Bool)

(assert (=> start!138426 (=> (not res!1083359) (not e!885869))))

(declare-datatypes ((B!3042 0))(
  ( (B!3043 (val!19883 Int)) )
))
(declare-datatypes ((tuple2!25934 0))(
  ( (tuple2!25935 (_1!12978 (_ BitVec 64)) (_2!12978 B!3042)) )
))
(declare-datatypes ((List!37003 0))(
  ( (Nil!37000) (Cons!36999 (h!38542 tuple2!25934) (t!51933 List!37003)) )
))
(declare-fun l!636 () List!37003)

(declare-fun isStrictlySorted!1225 (List!37003) Bool)

(assert (=> start!138426 (= res!1083359 (isStrictlySorted!1225 l!636))))

(assert (=> start!138426 e!885869))

(declare-fun e!885870 () Bool)

(assert (=> start!138426 e!885870))

(assert (=> start!138426 true))

(declare-fun b!1586356 () Bool)

(declare-fun key!185 () (_ BitVec 64))

(assert (=> b!1586356 (= e!885869 (and (or (not (is-Cons!36999 l!636)) (not (= (_1!12978 (h!38542 l!636)) key!185))) (or (not (is-Cons!36999 l!636)) (bvsle (_1!12978 (h!38542 l!636)) key!185)) (or (not (is-Cons!36999 l!636)) (bvsge (_1!12978 (h!38542 l!636)) key!185)) (not (is-Nil!37000 l!636))))))

(declare-fun b!1586357 () Bool)

(declare-fun tp_is_empty!39575 () Bool)

(declare-fun tp!115422 () Bool)

(assert (=> b!1586357 (= e!885870 (and tp_is_empty!39575 tp!115422))))

(assert (= (and start!138426 res!1083359) b!1586356))

(assert (= (and start!138426 (is-Cons!36999 l!636)) b!1586357))

(declare-fun m!1454737 () Bool)

(assert (=> start!138426 m!1454737))

(push 1)

(assert (not start!138426))

(assert (not b!1586357))

(assert tp_is_empty!39575)

(check-sat)

(pop 1)

(push 1)

(check-sat)

