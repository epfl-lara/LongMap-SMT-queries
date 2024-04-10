; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115246 () Bool)

(assert start!115246)

(declare-fun res!908152 () Bool)

(declare-fun e!773848 () Bool)

(assert (=> start!115246 (=> (not res!908152) (not e!773848))))

(declare-datatypes ((List!31843 0))(
  ( (Nil!31840) (Cons!31839 (h!33048 (_ BitVec 64)) (t!46537 List!31843)) )
))
(declare-datatypes ((tuple2!24384 0))(
  ( (tuple2!24385 (_1!12203 (_ BitVec 64)) (_2!12203 List!31843)) )
))
(declare-datatypes ((Option!787 0))(
  ( (Some!786 (v!21586 tuple2!24384)) (None!785) )
))
(declare-fun lt!601078 () Option!787)

(declare-fun isEmpty!1111 (Option!787) Bool)

(assert (=> start!115246 (= res!908152 (not (isEmpty!1111 lt!601078)))))

(declare-fun l!3677 () List!31843)

(declare-fun unapply!53 (List!31843) Option!787)

(assert (=> start!115246 (= lt!601078 (unapply!53 l!3677))))

(assert (=> start!115246 e!773848))

(assert (=> start!115246 true))

(declare-fun b!1364536 () Bool)

(declare-fun isDefined!542 (Option!787) Bool)

(assert (=> b!1364536 (= e!773848 (not (isDefined!542 lt!601078)))))

(assert (= (and start!115246 res!908152) b!1364536))

(declare-fun m!1249309 () Bool)

(assert (=> start!115246 m!1249309))

(declare-fun m!1249311 () Bool)

(assert (=> start!115246 m!1249311))

(declare-fun m!1249313 () Bool)

(assert (=> b!1364536 m!1249313))

(check-sat (not start!115246) (not b!1364536))
(check-sat)
(get-model)

(declare-fun d!146447 () Bool)

(get-info :version)

(assert (=> d!146447 (= (isEmpty!1111 lt!601078) (not ((_ is Some!786) lt!601078)))))

(assert (=> start!115246 d!146447))

(declare-fun d!146453 () Bool)

(assert (=> d!146453 (= (unapply!53 l!3677) (ite ((_ is Nil!31840) l!3677) None!785 (Some!786 (tuple2!24385 (h!33048 l!3677) (t!46537 l!3677)))))))

(assert (=> start!115246 d!146453))

(declare-fun d!146459 () Bool)

(assert (=> d!146459 (= (isDefined!542 lt!601078) (not (isEmpty!1111 lt!601078)))))

(declare-fun bs!39135 () Bool)

(assert (= bs!39135 d!146459))

(assert (=> bs!39135 m!1249309))

(assert (=> b!1364536 d!146459))

(check-sat (not d!146459))
(check-sat)
