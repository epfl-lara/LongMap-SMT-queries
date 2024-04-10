; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87292 () Bool)

(assert start!87292)

(declare-fun b!1011875 () Bool)

(declare-fun e!569238 () Bool)

(declare-fun tp_is_empty!23387 () Bool)

(declare-fun tp!70235 () Bool)

(assert (=> b!1011875 (= e!569238 (and tp_is_empty!23387 tp!70235))))

(declare-fun b!1011874 () Bool)

(declare-fun e!569239 () Bool)

(declare-datatypes ((B!1320 0))(
  ( (B!1321 (val!11744 Int)) )
))
(declare-datatypes ((tuple2!15034 0))(
  ( (tuple2!15035 (_1!7528 (_ BitVec 64)) (_2!7528 B!1320)) )
))
(declare-datatypes ((List!21338 0))(
  ( (Nil!21335) (Cons!21334 (h!22532 tuple2!15034) (t!30339 List!21338)) )
))
(declare-fun l!412 () List!21338)

(declare-fun isStrictlySorted!524 (List!21338) Bool)

(assert (=> b!1011874 (= e!569239 (not (isStrictlySorted!524 (t!30339 l!412))))))

(declare-fun b!1011873 () Bool)

(declare-fun res!679791 () Bool)

(assert (=> b!1011873 (=> (not res!679791) (not e!569239))))

(declare-fun value!115 () B!1320)

(declare-datatypes ((List!21339 0))(
  ( (Nil!21336) (Cons!21335 (h!22533 (_ BitVec 64)) (t!30340 List!21339)) )
))
(declare-fun isEmpty!776 (List!21339) Bool)

(declare-fun getKeysOf!9 (List!21338 B!1320) List!21339)

(assert (=> b!1011873 (= res!679791 (not (isEmpty!776 (getKeysOf!9 (t!30339 l!412) value!115))))))

(declare-fun b!1011872 () Bool)

(declare-fun res!679789 () Bool)

(assert (=> b!1011872 (=> (not res!679789) (not e!569239))))

(assert (=> b!1011872 (= res!679789 (and (is-Cons!21334 l!412) (= (_2!7528 (h!22532 l!412)) value!115)))))

(declare-fun res!679790 () Bool)

(assert (=> start!87292 (=> (not res!679790) (not e!569239))))

(assert (=> start!87292 (= res!679790 (isStrictlySorted!524 l!412))))

(assert (=> start!87292 e!569239))

(assert (=> start!87292 e!569238))

(assert (=> start!87292 tp_is_empty!23387))

(assert (= (and start!87292 res!679790) b!1011872))

(assert (= (and b!1011872 res!679789) b!1011873))

(assert (= (and b!1011873 res!679791) b!1011874))

(assert (= (and start!87292 (is-Cons!21334 l!412)) b!1011875))

(declare-fun m!935773 () Bool)

(assert (=> b!1011874 m!935773))

(declare-fun m!935775 () Bool)

(assert (=> b!1011873 m!935775))

(assert (=> b!1011873 m!935775))

(declare-fun m!935777 () Bool)

(assert (=> b!1011873 m!935777))

(declare-fun m!935779 () Bool)

(assert (=> start!87292 m!935779))

(push 1)

(assert (not start!87292))

(assert (not b!1011874))

(assert (not b!1011873))

(assert (not b!1011875))

(assert tp_is_empty!23387)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

