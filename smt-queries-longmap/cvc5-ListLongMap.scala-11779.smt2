; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138368 () Bool)

(assert start!138368)

(declare-fun b!1586079 () Bool)

(declare-fun res!1083220 () Bool)

(declare-fun e!885664 () Bool)

(assert (=> b!1586079 (=> res!1083220 e!885664)))

(declare-datatypes ((B!3014 0))(
  ( (B!3015 (val!19869 Int)) )
))
(declare-datatypes ((tuple2!25906 0))(
  ( (tuple2!25907 (_1!12964 (_ BitVec 64)) (_2!12964 B!3014)) )
))
(declare-datatypes ((List!36989 0))(
  ( (Nil!36986) (Cons!36985 (h!38528 tuple2!25906) (t!51919 List!36989)) )
))
(declare-fun lt!677490 () List!36989)

(declare-fun newKey!21 () (_ BitVec 64))

(declare-fun containsKey!1021 (List!36989 (_ BitVec 64)) Bool)

(assert (=> b!1586079 (= res!1083220 (not (containsKey!1021 lt!677490 newKey!21)))))

(declare-fun b!1586080 () Bool)

(declare-fun res!1083218 () Bool)

(declare-fun e!885666 () Bool)

(assert (=> b!1586080 (=> (not res!1083218) (not e!885666))))

(declare-fun l!556 () List!36989)

(assert (=> b!1586080 (= res!1083218 (and (or (not (is-Cons!36985 l!556)) (bvsge (_1!12964 (h!38528 l!556)) newKey!21)) (or (not (is-Cons!36985 l!556)) (not (= (_1!12964 (h!38528 l!556)) newKey!21))) (or (not (is-Cons!36985 l!556)) (bvsle (_1!12964 (h!38528 l!556)) newKey!21)) (not (is-Nil!36986 l!556))))))

(declare-fun b!1586081 () Bool)

(declare-fun e!885663 () Bool)

(declare-fun tp_is_empty!39547 () Bool)

(declare-fun tp!115346 () Bool)

(assert (=> b!1586081 (= e!885663 (and tp_is_empty!39547 tp!115346))))

(declare-fun b!1586082 () Bool)

(declare-fun e!885665 () Bool)

(declare-fun tp!115347 () Bool)

(assert (=> b!1586082 (= e!885665 (and tp_is_empty!39547 tp!115347))))

(declare-fun res!1083219 () Bool)

(assert (=> start!138368 (=> (not res!1083219) (not e!885666))))

(declare-fun isStrictlySorted!1211 (List!36989) Bool)

(assert (=> start!138368 (= res!1083219 (isStrictlySorted!1211 l!556))))

(assert (=> start!138368 e!885666))

(assert (=> start!138368 e!885663))

(assert (=> start!138368 true))

(assert (=> start!138368 tp_is_empty!39547))

(declare-fun newValue!21 () B!3014)

(declare-fun b!1586083 () Bool)

(declare-fun contains!10544 (List!36989 tuple2!25906) Bool)

(assert (=> b!1586083 (= e!885664 (not (contains!10544 lt!677490 (tuple2!25907 newKey!21 newValue!21))))))

(declare-fun b!1586084 () Bool)

(assert (=> b!1586084 (= e!885666 e!885664)))

(declare-fun res!1083221 () Bool)

(assert (=> b!1586084 (=> res!1083221 e!885664)))

(assert (=> b!1586084 (= res!1083221 (not (isStrictlySorted!1211 lt!677490)))))

(declare-fun err!225 () List!36989)

(assert (=> b!1586084 (= lt!677490 err!225)))

(assert (=> b!1586084 true))

(assert (=> b!1586084 e!885665))

(assert (= (and start!138368 res!1083219) b!1586080))

(assert (= (and b!1586080 res!1083218) b!1586084))

(assert (= (and b!1586084 (is-Cons!36985 err!225)) b!1586082))

(assert (= (and b!1586084 (not res!1083221)) b!1586079))

(assert (= (and b!1586079 (not res!1083220)) b!1586083))

(assert (= (and start!138368 (is-Cons!36985 l!556)) b!1586081))

(declare-fun m!1454637 () Bool)

(assert (=> b!1586079 m!1454637))

(declare-fun m!1454639 () Bool)

(assert (=> start!138368 m!1454639))

(declare-fun m!1454641 () Bool)

(assert (=> b!1586083 m!1454641))

(declare-fun m!1454643 () Bool)

(assert (=> b!1586084 m!1454643))

(push 1)

(assert (not b!1586082))

(assert tp_is_empty!39547)

(assert (not start!138368))

(assert (not b!1586083))

(assert (not b!1586081))

(assert (not b!1586084))

(assert (not b!1586079))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

