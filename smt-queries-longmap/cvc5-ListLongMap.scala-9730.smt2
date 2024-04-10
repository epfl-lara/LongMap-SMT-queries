; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115220 () Bool)

(assert start!115220)

(declare-fun res!908140 () Bool)

(declare-fun e!773836 () Bool)

(assert (=> start!115220 (=> (not res!908140) (not e!773836))))

(declare-datatypes ((List!31839 0))(
  ( (Nil!31836) (Cons!31835 (h!33044 (_ BitVec 64)) (t!46533 List!31839)) )
))
(declare-datatypes ((tuple2!24376 0))(
  ( (tuple2!24377 (_1!12199 (_ BitVec 64)) (_2!12199 List!31839)) )
))
(declare-datatypes ((Option!783 0))(
  ( (Some!782 (v!21582 tuple2!24376)) (None!781) )
))
(declare-fun lt!601066 () Option!783)

(declare-fun isEmpty!1107 (Option!783) Bool)

(assert (=> start!115220 (= res!908140 (not (isEmpty!1107 lt!601066)))))

(declare-fun l!3677 () List!31839)

(declare-fun unapply!49 (List!31839) Option!783)

(assert (=> start!115220 (= lt!601066 (unapply!49 l!3677))))

(assert (=> start!115220 e!773836))

(assert (=> start!115220 true))

(declare-fun b!1364524 () Bool)

(declare-fun isDefined!538 (Option!783) Bool)

(assert (=> b!1364524 (= e!773836 (not (isDefined!538 lt!601066)))))

(assert (= (and start!115220 res!908140) b!1364524))

(declare-fun m!1249285 () Bool)

(assert (=> start!115220 m!1249285))

(declare-fun m!1249287 () Bool)

(assert (=> start!115220 m!1249287))

(declare-fun m!1249289 () Bool)

(assert (=> b!1364524 m!1249289))

(push 1)

(assert (not start!115220))

(assert (not b!1364524))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!146431 () Bool)

(assert (=> d!146431 (= (isEmpty!1107 lt!601066) (not (is-Some!782 lt!601066)))))

(assert (=> start!115220 d!146431))

(declare-fun d!146435 () Bool)

(assert (=> d!146435 (= (unapply!49 l!3677) (ite (is-Nil!31836 l!3677) None!781 (Some!782 (tuple2!24377 (h!33044 l!3677) (t!46533 l!3677)))))))

(assert (=> start!115220 d!146435))

(declare-fun d!146441 () Bool)

(assert (=> d!146441 (= (isDefined!538 lt!601066) (not (isEmpty!1107 lt!601066)))))

(declare-fun bs!39130 () Bool)

(assert (= bs!39130 d!146441))

(assert (=> bs!39130 m!1249285))

(assert (=> b!1364524 d!146441))

(push 1)

