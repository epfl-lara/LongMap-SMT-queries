; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138366 () Bool)

(assert start!138366)

(declare-fun res!1083209 () Bool)

(declare-fun e!885653 () Bool)

(assert (=> start!138366 (=> (not res!1083209) (not e!885653))))

(declare-datatypes ((B!3012 0))(
  ( (B!3013 (val!19868 Int)) )
))
(declare-datatypes ((tuple2!25904 0))(
  ( (tuple2!25905 (_1!12963 (_ BitVec 64)) (_2!12963 B!3012)) )
))
(declare-datatypes ((List!36988 0))(
  ( (Nil!36985) (Cons!36984 (h!38527 tuple2!25904) (t!51918 List!36988)) )
))
(declare-fun l!556 () List!36988)

(declare-fun isStrictlySorted!1210 (List!36988) Bool)

(assert (=> start!138366 (= res!1083209 (isStrictlySorted!1210 l!556))))

(assert (=> start!138366 e!885653))

(declare-fun e!885654 () Bool)

(assert (=> start!138366 e!885654))

(assert (=> start!138366 true))

(declare-fun b!1586065 () Bool)

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1586065 (= e!885653 (and (or (not (is-Cons!36984 l!556)) (bvsge (_1!12963 (h!38527 l!556)) newKey!21)) (or (not (is-Cons!36984 l!556)) (not (= (_1!12963 (h!38527 l!556)) newKey!21))) (or (not (is-Cons!36984 l!556)) (bvsle (_1!12963 (h!38527 l!556)) newKey!21)) (not (is-Nil!36985 l!556))))))

(declare-fun b!1586066 () Bool)

(declare-fun tp_is_empty!39545 () Bool)

(declare-fun tp!115341 () Bool)

(assert (=> b!1586066 (= e!885654 (and tp_is_empty!39545 tp!115341))))

(assert (= (and start!138366 res!1083209) b!1586065))

(assert (= (and start!138366 (is-Cons!36984 l!556)) b!1586066))

(declare-fun m!1454635 () Bool)

(assert (=> start!138366 m!1454635))

(push 1)

(assert (not start!138366))

(assert (not b!1586066))

(assert tp_is_empty!39545)

(check-sat)

(pop 1)

(push 1)

(check-sat)

