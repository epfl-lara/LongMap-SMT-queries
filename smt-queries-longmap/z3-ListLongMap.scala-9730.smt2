; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115218 () Bool)

(assert start!115218)

(declare-fun res!908111 () Bool)

(declare-fun e!773803 () Bool)

(assert (=> start!115218 (=> (not res!908111) (not e!773803))))

(declare-datatypes ((List!31892 0))(
  ( (Nil!31889) (Cons!31888 (h!33097 (_ BitVec 64)) (t!46578 List!31892)) )
))
(declare-datatypes ((tuple2!24450 0))(
  ( (tuple2!24451 (_1!12236 (_ BitVec 64)) (_2!12236 List!31892)) )
))
(declare-datatypes ((Option!785 0))(
  ( (Some!784 (v!21581 tuple2!24450)) (None!783) )
))
(declare-fun lt!600880 () Option!785)

(declare-fun isEmpty!1112 (Option!785) Bool)

(assert (=> start!115218 (= res!908111 (not (isEmpty!1112 lt!600880)))))

(declare-fun l!3677 () List!31892)

(declare-fun unapply!49 (List!31892) Option!785)

(assert (=> start!115218 (= lt!600880 (unapply!49 l!3677))))

(assert (=> start!115218 e!773803))

(assert (=> start!115218 true))

(declare-fun b!1364454 () Bool)

(declare-fun isDefined!541 (Option!785) Bool)

(assert (=> b!1364454 (= e!773803 (not (isDefined!541 lt!600880)))))

(assert (= (and start!115218 res!908111) b!1364454))

(declare-fun m!1248769 () Bool)

(assert (=> start!115218 m!1248769))

(declare-fun m!1248771 () Bool)

(assert (=> start!115218 m!1248771))

(declare-fun m!1248773 () Bool)

(assert (=> b!1364454 m!1248773))

(check-sat (not b!1364454) (not start!115218))
(check-sat)
(get-model)

(declare-fun d!146309 () Bool)

(assert (=> d!146309 (= (isDefined!541 lt!600880) (not (isEmpty!1112 lt!600880)))))

(declare-fun bs!39102 () Bool)

(assert (= bs!39102 d!146309))

(assert (=> bs!39102 m!1248769))

(assert (=> b!1364454 d!146309))

(declare-fun d!146313 () Bool)

(get-info :version)

(assert (=> d!146313 (= (isEmpty!1112 lt!600880) (not ((_ is Some!784) lt!600880)))))

(assert (=> start!115218 d!146313))

(declare-fun d!146317 () Bool)

(assert (=> d!146317 (= (unapply!49 l!3677) (ite ((_ is Nil!31889) l!3677) None!783 (Some!784 (tuple2!24451 (h!33097 l!3677) (t!46578 l!3677)))))))

(assert (=> start!115218 d!146317))

(check-sat (not d!146309))
(check-sat)
