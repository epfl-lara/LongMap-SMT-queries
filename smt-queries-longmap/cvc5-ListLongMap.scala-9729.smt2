; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115196 () Bool)

(assert start!115196)

(declare-fun res!908131 () Bool)

(declare-fun e!773827 () Bool)

(assert (=> start!115196 (=> (not res!908131) (not e!773827))))

(declare-datatypes ((List!31836 0))(
  ( (Nil!31833) (Cons!31832 (h!33041 (_ BitVec 64)) (t!46530 List!31836)) )
))
(declare-datatypes ((tuple2!24370 0))(
  ( (tuple2!24371 (_1!12196 (_ BitVec 64)) (_2!12196 List!31836)) )
))
(declare-datatypes ((Option!780 0))(
  ( (Some!779 (v!21579 tuple2!24370)) (None!778) )
))
(declare-fun lt!601057 () Option!780)

(declare-fun isEmpty!1104 (Option!780) Bool)

(assert (=> start!115196 (= res!908131 (not (isEmpty!1104 lt!601057)))))

(declare-fun l!3677 () List!31836)

(declare-fun unapply!46 (List!31836) Option!780)

(assert (=> start!115196 (= lt!601057 (unapply!46 l!3677))))

(assert (=> start!115196 e!773827))

(assert (=> start!115196 true))

(declare-fun b!1364515 () Bool)

(declare-fun isDefined!535 (Option!780) Bool)

(assert (=> b!1364515 (= e!773827 (not (isDefined!535 lt!601057)))))

(assert (= (and start!115196 res!908131) b!1364515))

(declare-fun m!1249267 () Bool)

(assert (=> start!115196 m!1249267))

(declare-fun m!1249269 () Bool)

(assert (=> start!115196 m!1249269))

(declare-fun m!1249271 () Bool)

(assert (=> b!1364515 m!1249271))

(push 1)

(assert (not b!1364515))

(assert (not start!115196))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!146411 () Bool)

(assert (=> d!146411 (= (isDefined!535 lt!601057) (not (isEmpty!1104 lt!601057)))))

(declare-fun bs!39124 () Bool)

(assert (= bs!39124 d!146411))

(assert (=> bs!39124 m!1249267))

(assert (=> b!1364515 d!146411))

(declare-fun d!146417 () Bool)

(assert (=> d!146417 (= (isEmpty!1104 lt!601057) (not (is-Some!779 lt!601057)))))

(assert (=> start!115196 d!146417))

(declare-fun d!146421 () Bool)

(assert (=> d!146421 (= (unapply!46 l!3677) (ite (is-Nil!31833 l!3677) None!778 (Some!779 (tuple2!24371 (h!33041 l!3677) (t!46530 l!3677)))))))

(assert (=> start!115196 d!146421))

(push 1)

