; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87364 () Bool)

(assert start!87364)

(declare-fun res!680001 () Bool)

(declare-fun e!569503 () Bool)

(assert (=> start!87364 (=> (not res!680001) (not e!569503))))

(declare-datatypes ((B!1344 0))(
  ( (B!1345 (val!11756 Int)) )
))
(declare-datatypes ((tuple2!15058 0))(
  ( (tuple2!15059 (_1!7540 (_ BitVec 64)) (_2!7540 B!1344)) )
))
(declare-datatypes ((List!21360 0))(
  ( (Nil!21357) (Cons!21356 (h!22554 tuple2!15058) (t!30361 List!21360)) )
))
(declare-fun l!412 () List!21360)

(declare-fun isStrictlySorted!536 (List!21360) Bool)

(assert (=> start!87364 (= res!680001 (isStrictlySorted!536 l!412))))

(assert (=> start!87364 e!569503))

(declare-fun e!569502 () Bool)

(assert (=> start!87364 e!569502))

(declare-fun tp_is_empty!23411 () Bool)

(assert (=> start!87364 tp_is_empty!23411))

(declare-fun b!1012389 () Bool)

(declare-fun res!680000 () Bool)

(assert (=> b!1012389 (=> (not res!680000) (not e!569503))))

(declare-fun value!115 () B!1344)

(assert (=> b!1012389 (= res!680000 (and (not (= (_2!7540 (h!22554 l!412)) value!115)) (is-Cons!21356 l!412)))))

(declare-fun b!1012390 () Bool)

(assert (=> b!1012390 (= e!569503 (not (isStrictlySorted!536 (t!30361 l!412))))))

(declare-fun b!1012391 () Bool)

(declare-fun tp!70289 () Bool)

(assert (=> b!1012391 (= e!569502 (and tp_is_empty!23411 tp!70289))))

(assert (= (and start!87364 res!680001) b!1012389))

(assert (= (and b!1012389 res!680000) b!1012390))

(assert (= (and start!87364 (is-Cons!21356 l!412)) b!1012391))

(declare-fun m!935997 () Bool)

(assert (=> start!87364 m!935997))

(declare-fun m!935999 () Bool)

(assert (=> b!1012390 m!935999))

(push 1)

(assert (not b!1012390))

(assert (not start!87364))

(assert (not b!1012391))

(assert tp_is_empty!23411)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120285 () Bool)

(declare-fun res!680022 () Bool)

(declare-fun e!569527 () Bool)

(assert (=> d!120285 (=> res!680022 e!569527)))

(assert (=> d!120285 (= res!680022 (or (is-Nil!21357 (t!30361 l!412)) (is-Nil!21357 (t!30361 (t!30361 l!412)))))))

(assert (=> d!120285 (= (isStrictlySorted!536 (t!30361 l!412)) e!569527)))

(declare-fun b!1012419 () Bool)

(declare-fun e!569528 () Bool)

(assert (=> b!1012419 (= e!569527 e!569528)))

(declare-fun res!680023 () Bool)

(assert (=> b!1012419 (=> (not res!680023) (not e!569528))))

(assert (=> b!1012419 (= res!680023 (bvslt (_1!7540 (h!22554 (t!30361 l!412))) (_1!7540 (h!22554 (t!30361 (t!30361 l!412))))))))

(declare-fun b!1012420 () Bool)

(assert (=> b!1012420 (= e!569528 (isStrictlySorted!536 (t!30361 (t!30361 l!412))))))

(assert (= (and d!120285 (not res!680022)) b!1012419))

(assert (= (and b!1012419 res!680023) b!1012420))

(declare-fun m!936005 () Bool)

(assert (=> b!1012420 m!936005))

(assert (=> b!1012390 d!120285))

(declare-fun d!120291 () Bool)

(declare-fun res!680024 () Bool)

(declare-fun e!569531 () Bool)

(assert (=> d!120291 (=> res!680024 e!569531)))

(assert (=> d!120291 (= res!680024 (or (is-Nil!21357 l!412) (is-Nil!21357 (t!30361 l!412))))))

(assert (=> d!120291 (= (isStrictlySorted!536 l!412) e!569531)))

(declare-fun b!1012423 () Bool)

(declare-fun e!569532 () Bool)

(assert (=> b!1012423 (= e!569531 e!569532)))

(declare-fun res!680025 () Bool)

(assert (=> b!1012423 (=> (not res!680025) (not e!569532))))

(assert (=> b!1012423 (= res!680025 (bvslt (_1!7540 (h!22554 l!412)) (_1!7540 (h!22554 (t!30361 l!412)))))))

(declare-fun b!1012424 () Bool)

(assert (=> b!1012424 (= e!569532 (isStrictlySorted!536 (t!30361 l!412)))))

(assert (= (and d!120291 (not res!680024)) b!1012423))

(assert (= (and b!1012423 res!680025) b!1012424))

(assert (=> b!1012424 m!935999))

(assert (=> start!87364 d!120291))

(declare-fun b!1012430 () Bool)

(declare-fun e!569536 () Bool)

(declare-fun tp!70298 () Bool)

(assert (=> b!1012430 (= e!569536 (and tp_is_empty!23411 tp!70298))))

(assert (=> b!1012391 (= tp!70289 e!569536)))

