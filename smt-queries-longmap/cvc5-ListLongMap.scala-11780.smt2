; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138808 () Bool)

(assert start!138808)

(declare-fun res!1084137 () Bool)

(declare-fun e!887218 () Bool)

(assert (=> start!138808 (=> (not res!1084137) (not e!887218))))

(declare-datatypes ((B!3012 0))(
  ( (B!3013 (val!19868 Int)) )
))
(declare-datatypes ((tuple2!25964 0))(
  ( (tuple2!25965 (_1!12993 (_ BitVec 64)) (_2!12993 B!3012)) )
))
(declare-datatypes ((List!37020 0))(
  ( (Nil!37017) (Cons!37016 (h!38577 tuple2!25964) (t!51943 List!37020)) )
))
(declare-fun l!556 () List!37020)

(declare-fun isStrictlySorted!1198 (List!37020) Bool)

(assert (=> start!138808 (= res!1084137 (isStrictlySorted!1198 l!556))))

(assert (=> start!138808 e!887218))

(declare-fun e!887219 () Bool)

(assert (=> start!138808 e!887219))

(assert (=> start!138808 true))

(declare-fun b!1588580 () Bool)

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1588580 (= e!887218 (and (or (not (is-Cons!37016 l!556)) (bvsge (_1!12993 (h!38577 l!556)) newKey!21)) (or (not (is-Cons!37016 l!556)) (not (= (_1!12993 (h!38577 l!556)) newKey!21))) (or (not (is-Cons!37016 l!556)) (bvsle (_1!12993 (h!38577 l!556)) newKey!21)) (not (is-Nil!37017 l!556))))))

(declare-fun b!1588581 () Bool)

(declare-fun tp_is_empty!39545 () Bool)

(declare-fun tp!115342 () Bool)

(assert (=> b!1588581 (= e!887219 (and tp_is_empty!39545 tp!115342))))

(assert (= (and start!138808 res!1084137) b!1588580))

(assert (= (and start!138808 (is-Cons!37016 l!556)) b!1588581))

(declare-fun m!1456963 () Bool)

(assert (=> start!138808 m!1456963))

(push 1)

(assert (not start!138808))

(assert (not b!1588581))

(assert tp_is_empty!39545)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

