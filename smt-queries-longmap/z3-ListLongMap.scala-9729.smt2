; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115420 () Bool)

(assert start!115420)

(declare-fun res!908649 () Bool)

(declare-fun e!774670 () Bool)

(assert (=> start!115420 (=> (not res!908649) (not e!774670))))

(declare-datatypes ((List!31876 0))(
  ( (Nil!31873) (Cons!31872 (h!33090 (_ BitVec 64)) (t!46562 List!31876)) )
))
(declare-datatypes ((tuple2!24426 0))(
  ( (tuple2!24427 (_1!12224 (_ BitVec 64)) (_2!12224 List!31876)) )
))
(declare-datatypes ((Option!775 0))(
  ( (Some!774 (v!21574 tuple2!24426)) (None!773) )
))
(declare-fun lt!601533 () Option!775)

(declare-fun isEmpty!1107 (Option!775) Bool)

(assert (=> start!115420 (= res!908649 (not (isEmpty!1107 lt!601533)))))

(declare-fun l!3677 () List!31876)

(declare-fun unapply!46 (List!31876) Option!775)

(assert (=> start!115420 (= lt!601533 (unapply!46 l!3677))))

(assert (=> start!115420 e!774670))

(assert (=> start!115420 true))

(declare-fun b!1365814 () Bool)

(declare-fun isDefined!533 (Option!775) Bool)

(assert (=> b!1365814 (= e!774670 (not (isDefined!533 lt!601533)))))

(assert (= (and start!115420 res!908649) b!1365814))

(declare-fun m!1250863 () Bool)

(assert (=> start!115420 m!1250863))

(declare-fun m!1250865 () Bool)

(assert (=> start!115420 m!1250865))

(declare-fun m!1250867 () Bool)

(assert (=> b!1365814 m!1250867))

(check-sat (not b!1365814) (not start!115420))
(check-sat)
(get-model)

(declare-fun d!146851 () Bool)

(assert (=> d!146851 (= (isDefined!533 lt!601533) (not (isEmpty!1107 lt!601533)))))

(declare-fun bs!39139 () Bool)

(assert (= bs!39139 d!146851))

(assert (=> bs!39139 m!1250863))

(assert (=> b!1365814 d!146851))

(declare-fun d!146857 () Bool)

(get-info :version)

(assert (=> d!146857 (= (isEmpty!1107 lt!601533) (not ((_ is Some!774) lt!601533)))))

(assert (=> start!115420 d!146857))

(declare-fun d!146863 () Bool)

(assert (=> d!146863 (= (unapply!46 l!3677) (ite ((_ is Nil!31873) l!3677) None!773 (Some!774 (tuple2!24427 (h!33090 l!3677) (t!46562 l!3677)))))))

(assert (=> start!115420 d!146863))

(check-sat (not d!146851))
(check-sat)
