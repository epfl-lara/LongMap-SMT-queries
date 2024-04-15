; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115238 () Bool)

(assert start!115238)

(declare-fun res!908120 () Bool)

(declare-fun e!773812 () Bool)

(assert (=> start!115238 (=> (not res!908120) (not e!773812))))

(declare-datatypes ((List!31895 0))(
  ( (Nil!31892) (Cons!31891 (h!33100 (_ BitVec 64)) (t!46581 List!31895)) )
))
(declare-datatypes ((tuple2!24456 0))(
  ( (tuple2!24457 (_1!12239 (_ BitVec 64)) (_2!12239 List!31895)) )
))
(declare-datatypes ((Option!788 0))(
  ( (Some!787 (v!21584 tuple2!24456)) (None!786) )
))
(declare-fun lt!600889 () Option!788)

(declare-fun isEmpty!1115 (Option!788) Bool)

(assert (=> start!115238 (= res!908120 (not (isEmpty!1115 lt!600889)))))

(declare-fun l!3677 () List!31895)

(declare-fun unapply!52 (List!31895) Option!788)

(assert (=> start!115238 (= lt!600889 (unapply!52 l!3677))))

(assert (=> start!115238 e!773812))

(assert (=> start!115238 true))

(declare-fun b!1364463 () Bool)

(declare-fun isDefined!544 (Option!788) Bool)

(assert (=> b!1364463 (= e!773812 (not (isDefined!544 lt!600889)))))

(assert (= (and start!115238 res!908120) b!1364463))

(declare-fun m!1248787 () Bool)

(assert (=> start!115238 m!1248787))

(declare-fun m!1248789 () Bool)

(assert (=> start!115238 m!1248789))

(declare-fun m!1248791 () Bool)

(assert (=> b!1364463 m!1248791))

(check-sat (not b!1364463) (not start!115238))
(check-sat)
(get-model)

(declare-fun d!146325 () Bool)

(assert (=> d!146325 (= (isDefined!544 lt!600889) (not (isEmpty!1115 lt!600889)))))

(declare-fun bs!39107 () Bool)

(assert (= bs!39107 d!146325))

(assert (=> bs!39107 m!1248787))

(assert (=> b!1364463 d!146325))

(declare-fun d!146329 () Bool)

(get-info :version)

(assert (=> d!146329 (= (isEmpty!1115 lt!600889) (not ((_ is Some!787) lt!600889)))))

(assert (=> start!115238 d!146329))

(declare-fun d!146333 () Bool)

(assert (=> d!146333 (= (unapply!52 l!3677) (ite ((_ is Nil!31892) l!3677) None!786 (Some!787 (tuple2!24457 (h!33100 l!3677) (t!46581 l!3677)))))))

(assert (=> start!115238 d!146333))

(check-sat (not d!146325))
(check-sat)
