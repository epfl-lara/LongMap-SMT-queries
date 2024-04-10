; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87894 () Bool)

(assert start!87894)

(declare-fun res!681147 () Bool)

(declare-fun e!571254 () Bool)

(assert (=> start!87894 (=> (not res!681147) (not e!571254))))

(declare-datatypes ((B!1466 0))(
  ( (B!1467 (val!11817 Int)) )
))
(declare-datatypes ((tuple2!15180 0))(
  ( (tuple2!15181 (_1!7601 (_ BitVec 64)) (_2!7601 B!1466)) )
))
(declare-datatypes ((List!21466 0))(
  ( (Nil!21463) (Cons!21462 (h!22660 tuple2!15180) (t!30467 List!21466)) )
))
(declare-fun l!412 () List!21466)

(declare-fun isStrictlySorted!591 (List!21466) Bool)

(assert (=> start!87894 (= res!681147 (isStrictlySorted!591 l!412))))

(assert (=> start!87894 e!571254))

(declare-fun e!571255 () Bool)

(assert (=> start!87894 e!571255))

(declare-fun tp_is_empty!23533 () Bool)

(assert (=> start!87894 tp_is_empty!23533))

(declare-fun b!1015459 () Bool)

(declare-fun value!115 () B!1466)

(assert (=> b!1015459 (= e!571254 (and (or (not (is-Cons!21462 l!412)) (not (= (_2!7601 (h!22660 l!412)) value!115))) (or (not (is-Cons!21462 l!412)) (= (_2!7601 (h!22660 l!412)) value!115)) (not (is-Nil!21463 l!412))))))

(declare-fun b!1015460 () Bool)

(declare-fun tp!70628 () Bool)

(assert (=> b!1015460 (= e!571255 (and tp_is_empty!23533 tp!70628))))

(assert (= (and start!87894 res!681147) b!1015459))

(assert (= (and start!87894 (is-Cons!21462 l!412)) b!1015460))

(declare-fun m!937541 () Bool)

(assert (=> start!87894 m!937541))

(push 1)

(assert (not start!87894))

(assert (not b!1015460))

(assert tp_is_empty!23533)

