; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115444 () Bool)

(assert start!115444)

(declare-fun res!908658 () Bool)

(declare-fun e!774679 () Bool)

(assert (=> start!115444 (=> (not res!908658) (not e!774679))))

(declare-datatypes ((List!31879 0))(
  ( (Nil!31876) (Cons!31875 (h!33093 (_ BitVec 64)) (t!46565 List!31879)) )
))
(declare-datatypes ((tuple2!24432 0))(
  ( (tuple2!24433 (_1!12227 (_ BitVec 64)) (_2!12227 List!31879)) )
))
(declare-datatypes ((Option!778 0))(
  ( (Some!777 (v!21577 tuple2!24432)) (None!776) )
))
(declare-fun lt!601542 () Option!778)

(declare-fun isEmpty!1110 (Option!778) Bool)

(assert (=> start!115444 (= res!908658 (not (isEmpty!1110 lt!601542)))))

(declare-fun l!3677 () List!31879)

(declare-fun unapply!49 (List!31879) Option!778)

(assert (=> start!115444 (= lt!601542 (unapply!49 l!3677))))

(assert (=> start!115444 e!774679))

(assert (=> start!115444 true))

(declare-fun b!1365823 () Bool)

(declare-fun isDefined!536 (Option!778) Bool)

(assert (=> b!1365823 (= e!774679 (not (isDefined!536 lt!601542)))))

(assert (= (and start!115444 res!908658) b!1365823))

(declare-fun m!1250881 () Bool)

(assert (=> start!115444 m!1250881))

(declare-fun m!1250883 () Bool)

(assert (=> start!115444 m!1250883))

(declare-fun m!1250885 () Bool)

(assert (=> b!1365823 m!1250885))

(check-sat (not start!115444) (not b!1365823))
(check-sat)
(get-model)

(declare-fun d!146871 () Bool)

(get-info :version)

(assert (=> d!146871 (= (isEmpty!1110 lt!601542) (not ((_ is Some!777) lt!601542)))))

(assert (=> start!115444 d!146871))

(declare-fun d!146875 () Bool)

(assert (=> d!146875 (= (unapply!49 l!3677) (ite ((_ is Nil!31876) l!3677) None!776 (Some!777 (tuple2!24433 (h!33093 l!3677) (t!46565 l!3677)))))))

(assert (=> start!115444 d!146875))

(declare-fun d!146883 () Bool)

(assert (=> d!146883 (= (isDefined!536 lt!601542) (not (isEmpty!1110 lt!601542)))))

(declare-fun bs!39147 () Bool)

(assert (= bs!39147 d!146883))

(assert (=> bs!39147 m!1250881))

(assert (=> b!1365823 d!146883))

(check-sat (not d!146883))
(check-sat)
