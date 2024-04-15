; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115196 () Bool)

(assert start!115196)

(declare-fun res!908102 () Bool)

(declare-fun e!773794 () Bool)

(assert (=> start!115196 (=> (not res!908102) (not e!773794))))

(declare-datatypes ((List!31889 0))(
  ( (Nil!31886) (Cons!31885 (h!33094 (_ BitVec 64)) (t!46575 List!31889)) )
))
(declare-datatypes ((tuple2!24444 0))(
  ( (tuple2!24445 (_1!12233 (_ BitVec 64)) (_2!12233 List!31889)) )
))
(declare-datatypes ((Option!782 0))(
  ( (Some!781 (v!21578 tuple2!24444)) (None!780) )
))
(declare-fun lt!600871 () Option!782)

(declare-fun isEmpty!1109 (Option!782) Bool)

(assert (=> start!115196 (= res!908102 (not (isEmpty!1109 lt!600871)))))

(declare-fun l!3677 () List!31889)

(declare-fun unapply!46 (List!31889) Option!782)

(assert (=> start!115196 (= lt!600871 (unapply!46 l!3677))))

(assert (=> start!115196 e!773794))

(assert (=> start!115196 true))

(declare-fun b!1364445 () Bool)

(declare-fun isDefined!538 (Option!782) Bool)

(assert (=> b!1364445 (= e!773794 (not (isDefined!538 lt!600871)))))

(assert (= (and start!115196 res!908102) b!1364445))

(declare-fun m!1248751 () Bool)

(assert (=> start!115196 m!1248751))

(declare-fun m!1248753 () Bool)

(assert (=> start!115196 m!1248753))

(declare-fun m!1248755 () Bool)

(assert (=> b!1364445 m!1248755))

(check-sat (not start!115196) (not b!1364445))
(check-sat)
(get-model)

(declare-fun d!146291 () Bool)

(get-info :version)

(assert (=> d!146291 (= (isEmpty!1109 lt!600871) (not ((_ is Some!781) lt!600871)))))

(assert (=> start!115196 d!146291))

(declare-fun d!146295 () Bool)

(assert (=> d!146295 (= (unapply!46 l!3677) (ite ((_ is Nil!31886) l!3677) None!780 (Some!781 (tuple2!24445 (h!33094 l!3677) (t!46575 l!3677)))))))

(assert (=> start!115196 d!146295))

(declare-fun d!146299 () Bool)

(assert (=> d!146299 (= (isDefined!538 lt!600871) (not (isEmpty!1109 lt!600871)))))

(declare-fun bs!39097 () Bool)

(assert (= bs!39097 d!146299))

(assert (=> bs!39097 m!1248751))

(assert (=> b!1364445 d!146299))

(check-sat (not d!146299))
(check-sat)
