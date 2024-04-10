; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87360 () Bool)

(assert start!87360)

(declare-fun res!679989 () Bool)

(declare-fun e!569491 () Bool)

(assert (=> start!87360 (=> (not res!679989) (not e!569491))))

(declare-datatypes ((B!1340 0))(
  ( (B!1341 (val!11754 Int)) )
))
(declare-datatypes ((tuple2!15054 0))(
  ( (tuple2!15055 (_1!7538 (_ BitVec 64)) (_2!7538 B!1340)) )
))
(declare-datatypes ((List!21358 0))(
  ( (Nil!21355) (Cons!21354 (h!22552 tuple2!15054) (t!30359 List!21358)) )
))
(declare-fun l!412 () List!21358)

(declare-fun isStrictlySorted!534 (List!21358) Bool)

(assert (=> start!87360 (= res!679989 (isStrictlySorted!534 l!412))))

(assert (=> start!87360 e!569491))

(declare-fun e!569490 () Bool)

(assert (=> start!87360 e!569490))

(declare-fun tp_is_empty!23407 () Bool)

(assert (=> start!87360 tp_is_empty!23407))

(declare-fun b!1012371 () Bool)

(declare-fun res!679988 () Bool)

(assert (=> b!1012371 (=> (not res!679988) (not e!569491))))

(declare-fun value!115 () B!1340)

(assert (=> b!1012371 (= res!679988 (and (not (= (_2!7538 (h!22552 l!412)) value!115)) (is-Cons!21354 l!412)))))

(declare-fun b!1012372 () Bool)

(assert (=> b!1012372 (= e!569491 (not (isStrictlySorted!534 (t!30359 l!412))))))

(declare-fun b!1012373 () Bool)

(declare-fun tp!70283 () Bool)

(assert (=> b!1012373 (= e!569490 (and tp_is_empty!23407 tp!70283))))

(assert (= (and start!87360 res!679989) b!1012371))

(assert (= (and b!1012371 res!679988) b!1012372))

(assert (= (and start!87360 (is-Cons!21354 l!412)) b!1012373))

(declare-fun m!935989 () Bool)

(assert (=> start!87360 m!935989))

(declare-fun m!935991 () Bool)

(assert (=> b!1012372 m!935991))

(push 1)

(assert (not b!1012372))

(assert (not start!87360))

(assert (not b!1012373))

(assert tp_is_empty!23407)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120283 () Bool)

(declare-fun res!680018 () Bool)

(declare-fun e!569520 () Bool)

(assert (=> d!120283 (=> res!680018 e!569520)))

(assert (=> d!120283 (= res!680018 (or (is-Nil!21355 (t!30359 l!412)) (is-Nil!21355 (t!30359 (t!30359 l!412)))))))

(assert (=> d!120283 (= (isStrictlySorted!534 (t!30359 l!412)) e!569520)))

(declare-fun b!1012408 () Bool)

(declare-fun e!569521 () Bool)

(assert (=> b!1012408 (= e!569520 e!569521)))

(declare-fun res!680019 () Bool)

(assert (=> b!1012408 (=> (not res!680019) (not e!569521))))

(assert (=> b!1012408 (= res!680019 (bvslt (_1!7538 (h!22552 (t!30359 l!412))) (_1!7538 (h!22552 (t!30359 (t!30359 l!412))))))))

(declare-fun b!1012409 () Bool)

(assert (=> b!1012409 (= e!569521 (isStrictlySorted!534 (t!30359 (t!30359 l!412))))))

(assert (= (and d!120283 (not res!680018)) b!1012408))

(assert (= (and b!1012408 res!680019) b!1012409))

(declare-fun m!936003 () Bool)

(assert (=> b!1012409 m!936003))

(assert (=> b!1012372 d!120283))

(declare-fun d!120289 () Bool)

(declare-fun res!680020 () Bool)

(declare-fun e!569524 () Bool)

(assert (=> d!120289 (=> res!680020 e!569524)))

(assert (=> d!120289 (= res!680020 (or (is-Nil!21355 l!412) (is-Nil!21355 (t!30359 l!412))))))

(assert (=> d!120289 (= (isStrictlySorted!534 l!412) e!569524)))

(declare-fun b!1012414 () Bool)

(declare-fun e!569525 () Bool)

(assert (=> b!1012414 (= e!569524 e!569525)))

(declare-fun res!680021 () Bool)

(assert (=> b!1012414 (=> (not res!680021) (not e!569525))))

(assert (=> b!1012414 (= res!680021 (bvslt (_1!7538 (h!22552 l!412)) (_1!7538 (h!22552 (t!30359 l!412)))))))

(declare-fun b!1012415 () Bool)

(assert (=> b!1012415 (= e!569525 (isStrictlySorted!534 (t!30359 l!412)))))

(assert (= (and d!120289 (not res!680020)) b!1012414))

(assert (= (and b!1012414 res!680021) b!1012415))

(assert (=> b!1012415 m!935991))

(assert (=> start!87360 d!120289))

(declare-fun b!1012425 () Bool)

(declare-fun e!569533 () Bool)

(declare-fun tp!70295 () Bool)

(assert (=> b!1012425 (= e!569533 (and tp_is_empty!23407 tp!70295))))

(assert (=> b!1012373 (= tp!70283 e!569533)))

(assert (= (and b!1012373 (is-Cons!21354 (t!30359 l!412))) b!1012425))

(push 1)

