; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115244 () Bool)

(assert start!115244)

(declare-fun res!908149 () Bool)

(declare-fun e!773845 () Bool)

(assert (=> start!115244 (=> (not res!908149) (not e!773845))))

(declare-datatypes ((List!31842 0))(
  ( (Nil!31839) (Cons!31838 (h!33047 (_ BitVec 64)) (t!46536 List!31842)) )
))
(declare-datatypes ((tuple2!24382 0))(
  ( (tuple2!24383 (_1!12202 (_ BitVec 64)) (_2!12202 List!31842)) )
))
(declare-datatypes ((Option!786 0))(
  ( (Some!785 (v!21585 tuple2!24382)) (None!784) )
))
(declare-fun lt!601075 () Option!786)

(declare-fun isEmpty!1110 (Option!786) Bool)

(assert (=> start!115244 (= res!908149 (not (isEmpty!1110 lt!601075)))))

(declare-fun l!3677 () List!31842)

(declare-fun unapply!52 (List!31842) Option!786)

(assert (=> start!115244 (= lt!601075 (unapply!52 l!3677))))

(assert (=> start!115244 e!773845))

(assert (=> start!115244 true))

(declare-fun b!1364533 () Bool)

(declare-fun isDefined!541 (Option!786) Bool)

(assert (=> b!1364533 (= e!773845 (not (isDefined!541 lt!601075)))))

(assert (= (and start!115244 res!908149) b!1364533))

(declare-fun m!1249303 () Bool)

(assert (=> start!115244 m!1249303))

(declare-fun m!1249305 () Bool)

(assert (=> start!115244 m!1249305))

(declare-fun m!1249307 () Bool)

(assert (=> b!1364533 m!1249307))

(push 1)

(assert (not start!115244))

(assert (not b!1364533))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!146449 () Bool)

(assert (=> d!146449 (= (isEmpty!1110 lt!601075) (not (is-Some!785 lt!601075)))))

(assert (=> start!115244 d!146449))

(declare-fun d!146455 () Bool)

(assert (=> d!146455 (= (unapply!52 l!3677) (ite (is-Nil!31839 l!3677) None!784 (Some!785 (tuple2!24383 (h!33047 l!3677) (t!46536 l!3677)))))))

(assert (=> start!115244 d!146455))

(declare-fun d!146461 () Bool)

(assert (=> d!146461 (= (isDefined!541 lt!601075) (not (isEmpty!1110 lt!601075)))))

(declare-fun bs!39136 () Bool)

(assert (= bs!39136 d!146461))

(assert (=> bs!39136 m!1249303))

(assert (=> b!1364533 d!146461))

(push 1)

