; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115222 () Bool)

(assert start!115222)

(declare-fun res!908143 () Bool)

(declare-fun e!773839 () Bool)

(assert (=> start!115222 (=> (not res!908143) (not e!773839))))

(declare-datatypes ((List!31840 0))(
  ( (Nil!31837) (Cons!31836 (h!33045 (_ BitVec 64)) (t!46534 List!31840)) )
))
(declare-datatypes ((tuple2!24378 0))(
  ( (tuple2!24379 (_1!12200 (_ BitVec 64)) (_2!12200 List!31840)) )
))
(declare-datatypes ((Option!784 0))(
  ( (Some!783 (v!21583 tuple2!24378)) (None!782) )
))
(declare-fun lt!601069 () Option!784)

(declare-fun isEmpty!1108 (Option!784) Bool)

(assert (=> start!115222 (= res!908143 (not (isEmpty!1108 lt!601069)))))

(declare-fun l!3677 () List!31840)

(declare-fun unapply!50 (List!31840) Option!784)

(assert (=> start!115222 (= lt!601069 (unapply!50 l!3677))))

(assert (=> start!115222 e!773839))

(assert (=> start!115222 true))

(declare-fun b!1364527 () Bool)

(declare-fun isDefined!539 (Option!784) Bool)

(assert (=> b!1364527 (= e!773839 (not (isDefined!539 lt!601069)))))

(assert (= (and start!115222 res!908143) b!1364527))

(declare-fun m!1249291 () Bool)

(assert (=> start!115222 m!1249291))

(declare-fun m!1249293 () Bool)

(assert (=> start!115222 m!1249293))

(declare-fun m!1249295 () Bool)

(assert (=> b!1364527 m!1249295))

(check-sat (not start!115222) (not b!1364527))
(check-sat)
(get-model)

(declare-fun d!146429 () Bool)

(get-info :version)

(assert (=> d!146429 (= (isEmpty!1108 lt!601069) (not ((_ is Some!783) lt!601069)))))

(assert (=> start!115222 d!146429))

(declare-fun d!146437 () Bool)

(assert (=> d!146437 (= (unapply!50 l!3677) (ite ((_ is Nil!31837) l!3677) None!782 (Some!783 (tuple2!24379 (h!33045 l!3677) (t!46534 l!3677)))))))

(assert (=> start!115222 d!146437))

(declare-fun d!146443 () Bool)

(assert (=> d!146443 (= (isDefined!539 lt!601069) (not (isEmpty!1108 lt!601069)))))

(declare-fun bs!39131 () Bool)

(assert (= bs!39131 d!146443))

(assert (=> bs!39131 m!1249291))

(assert (=> b!1364527 d!146443))

(check-sat (not d!146443))
(check-sat)
