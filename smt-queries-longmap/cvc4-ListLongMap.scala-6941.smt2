; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87394 () Bool)

(assert start!87394)

(declare-fun b!1012619 () Bool)

(declare-fun res!680092 () Bool)

(declare-fun e!569641 () Bool)

(assert (=> b!1012619 (=> (not res!680092) (not e!569641))))

(declare-datatypes ((B!1356 0))(
  ( (B!1357 (val!11762 Int)) )
))
(declare-datatypes ((tuple2!15070 0))(
  ( (tuple2!15071 (_1!7546 (_ BitVec 64)) (_2!7546 B!1356)) )
))
(declare-datatypes ((List!21371 0))(
  ( (Nil!21368) (Cons!21367 (h!22565 tuple2!15070) (t!30372 List!21371)) )
))
(declare-fun l!412 () List!21371)

(declare-fun value!115 () B!1356)

(assert (=> b!1012619 (= res!680092 (and (not (= (_2!7546 (h!22565 l!412)) value!115)) (is-Cons!21367 l!412)))))

(declare-fun b!1012621 () Bool)

(declare-fun isStrictlySorted!542 (List!21371) Bool)

(assert (=> b!1012621 (= e!569641 (not (isStrictlySorted!542 (t!30372 l!412))))))

(declare-fun res!680093 () Bool)

(assert (=> start!87394 (=> (not res!680093) (not e!569641))))

(assert (=> start!87394 (= res!680093 (isStrictlySorted!542 l!412))))

(assert (=> start!87394 e!569641))

(declare-fun e!569640 () Bool)

(assert (=> start!87394 e!569640))

(declare-fun tp_is_empty!23423 () Bool)

(assert (=> start!87394 tp_is_empty!23423))

(declare-fun b!1012622 () Bool)

(declare-fun tp!70325 () Bool)

(assert (=> b!1012622 (= e!569640 (and tp_is_empty!23423 tp!70325))))

(declare-fun b!1012620 () Bool)

(declare-fun res!680094 () Bool)

(assert (=> b!1012620 (=> (not res!680094) (not e!569641))))

(declare-datatypes ((List!21372 0))(
  ( (Nil!21369) (Cons!21368 (h!22566 (_ BitVec 64)) (t!30373 List!21372)) )
))
(declare-fun isEmpty!797 (List!21372) Bool)

(declare-fun getKeysOf!24 (List!21371 B!1356) List!21372)

(assert (=> b!1012620 (= res!680094 (not (isEmpty!797 (getKeysOf!24 (t!30372 l!412) value!115))))))

(assert (= (and start!87394 res!680093) b!1012619))

(assert (= (and b!1012619 res!680092) b!1012620))

(assert (= (and b!1012620 res!680094) b!1012621))

(assert (= (and start!87394 (is-Cons!21367 l!412)) b!1012622))

(declare-fun m!936077 () Bool)

(assert (=> b!1012621 m!936077))

(declare-fun m!936079 () Bool)

(assert (=> start!87394 m!936079))

(declare-fun m!936081 () Bool)

(assert (=> b!1012620 m!936081))

(assert (=> b!1012620 m!936081))

(declare-fun m!936083 () Bool)

(assert (=> b!1012620 m!936083))

(push 1)

(assert (not b!1012620))

(assert (not b!1012621))

(assert tp_is_empty!23423)

(assert (not start!87394))

(assert (not b!1012622))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

