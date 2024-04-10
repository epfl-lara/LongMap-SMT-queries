; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115224 () Bool)

(assert start!115224)

(declare-fun res!908146 () Bool)

(declare-fun e!773842 () Bool)

(assert (=> start!115224 (=> (not res!908146) (not e!773842))))

(declare-datatypes ((List!31841 0))(
  ( (Nil!31838) (Cons!31837 (h!33046 (_ BitVec 64)) (t!46535 List!31841)) )
))
(declare-datatypes ((tuple2!24380 0))(
  ( (tuple2!24381 (_1!12201 (_ BitVec 64)) (_2!12201 List!31841)) )
))
(declare-datatypes ((Option!785 0))(
  ( (Some!784 (v!21584 tuple2!24380)) (None!783) )
))
(declare-fun lt!601072 () Option!785)

(declare-fun isEmpty!1109 (Option!785) Bool)

(assert (=> start!115224 (= res!908146 (not (isEmpty!1109 lt!601072)))))

(declare-fun l!3677 () List!31841)

(declare-fun unapply!51 (List!31841) Option!785)

(assert (=> start!115224 (= lt!601072 (unapply!51 l!3677))))

(assert (=> start!115224 e!773842))

(assert (=> start!115224 true))

(declare-fun b!1364530 () Bool)

(declare-fun isDefined!540 (Option!785) Bool)

(assert (=> b!1364530 (= e!773842 (not (isDefined!540 lt!601072)))))

(assert (= (and start!115224 res!908146) b!1364530))

(declare-fun m!1249297 () Bool)

(assert (=> start!115224 m!1249297))

(declare-fun m!1249299 () Bool)

(assert (=> start!115224 m!1249299))

(declare-fun m!1249301 () Bool)

(assert (=> b!1364530 m!1249301))

(push 1)

(assert (not b!1364530))

(assert (not start!115224))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!146427 () Bool)

(assert (=> d!146427 (= (isDefined!540 lt!601072) (not (isEmpty!1109 lt!601072)))))

(declare-fun bs!39129 () Bool)

(assert (= bs!39129 d!146427))

(assert (=> bs!39129 m!1249297))

(assert (=> b!1364530 d!146427))

(declare-fun d!146433 () Bool)

(assert (=> d!146433 (= (isEmpty!1109 lt!601072) (not (is-Some!784 lt!601072)))))

(assert (=> start!115224 d!146433))

(declare-fun d!146439 () Bool)

(assert (=> d!146439 (= (unapply!51 l!3677) (ite (is-Nil!31838 l!3677) None!783 (Some!784 (tuple2!24381 (h!33046 l!3677) (t!46535 l!3677)))))))

(assert (=> start!115224 d!146439))

(push 1)

