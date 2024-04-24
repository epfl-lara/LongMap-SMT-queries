; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115468 () Bool)

(assert start!115468)

(declare-fun res!908667 () Bool)

(declare-fun e!774688 () Bool)

(assert (=> start!115468 (=> (not res!908667) (not e!774688))))

(declare-datatypes ((List!31882 0))(
  ( (Nil!31879) (Cons!31878 (h!33096 (_ BitVec 64)) (t!46568 List!31882)) )
))
(declare-datatypes ((tuple2!24438 0))(
  ( (tuple2!24439 (_1!12230 (_ BitVec 64)) (_2!12230 List!31882)) )
))
(declare-datatypes ((Option!781 0))(
  ( (Some!780 (v!21580 tuple2!24438)) (None!779) )
))
(declare-fun lt!601551 () Option!781)

(declare-fun isEmpty!1113 (Option!781) Bool)

(assert (=> start!115468 (= res!908667 (not (isEmpty!1113 lt!601551)))))

(declare-fun l!3677 () List!31882)

(declare-fun unapply!52 (List!31882) Option!781)

(assert (=> start!115468 (= lt!601551 (unapply!52 l!3677))))

(assert (=> start!115468 e!774688))

(assert (=> start!115468 true))

(declare-fun b!1365832 () Bool)

(declare-fun isDefined!539 (Option!781) Bool)

(assert (=> b!1365832 (= e!774688 (not (isDefined!539 lt!601551)))))

(assert (= (and start!115468 res!908667) b!1365832))

(declare-fun m!1250899 () Bool)

(assert (=> start!115468 m!1250899))

(declare-fun m!1250901 () Bool)

(assert (=> start!115468 m!1250901))

(declare-fun m!1250903 () Bool)

(assert (=> b!1365832 m!1250903))

(check-sat (not b!1365832) (not start!115468))
(check-sat)
(get-model)

(declare-fun d!146891 () Bool)

(assert (=> d!146891 (= (isDefined!539 lt!601551) (not (isEmpty!1113 lt!601551)))))

(declare-fun bs!39151 () Bool)

(assert (= bs!39151 d!146891))

(assert (=> bs!39151 m!1250899))

(assert (=> b!1365832 d!146891))

(declare-fun d!146895 () Bool)

(get-info :version)

(assert (=> d!146895 (= (isEmpty!1113 lt!601551) (not ((_ is Some!780) lt!601551)))))

(assert (=> start!115468 d!146895))

(declare-fun d!146901 () Bool)

(assert (=> d!146901 (= (unapply!52 l!3677) (ite ((_ is Nil!31879) l!3677) None!779 (Some!780 (tuple2!24439 (h!33096 l!3677) (t!46568 l!3677)))))))

(assert (=> start!115468 d!146901))

(check-sat (not d!146891))
(check-sat)
