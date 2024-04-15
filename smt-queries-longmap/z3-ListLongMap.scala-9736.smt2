; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115360 () Bool)

(assert start!115360)

(declare-fun res!908249 () Bool)

(declare-fun e!773952 () Bool)

(assert (=> start!115360 (=> (not res!908249) (not e!773952))))

(declare-datatypes ((List!31910 0))(
  ( (Nil!31907) (Cons!31906 (h!33115 (_ BitVec 64)) (t!46596 List!31910)) )
))
(declare-fun l!3677 () List!31910)

(declare-datatypes ((tuple2!24480 0))(
  ( (tuple2!24481 (_1!12251 (_ BitVec 64)) (_2!12251 List!31910)) )
))
(declare-datatypes ((Option!800 0))(
  ( (Some!799 (v!21596 tuple2!24480)) (None!798) )
))
(declare-fun isEmpty!1127 (Option!800) Bool)

(declare-fun unapply!64 (List!31910) Option!800)

(assert (=> start!115360 (= res!908249 (isEmpty!1127 (unapply!64 l!3677)))))

(assert (=> start!115360 e!773952))

(assert (=> start!115360 true))

(declare-fun b!1364632 () Bool)

(get-info :version)

(assert (=> b!1364632 (= e!773952 (not ((_ is Nil!31907) l!3677)))))

(assert (= (and start!115360 res!908249) b!1364632))

(declare-fun m!1248949 () Bool)

(assert (=> start!115360 m!1248949))

(assert (=> start!115360 m!1248949))

(declare-fun m!1248951 () Bool)

(assert (=> start!115360 m!1248951))

(check-sat (not start!115360))
(check-sat)
(get-model)

(declare-fun d!146437 () Bool)

(assert (=> d!146437 (= (isEmpty!1127 (unapply!64 l!3677)) (not ((_ is Some!799) (unapply!64 l!3677))))))

(assert (=> start!115360 d!146437))

(declare-fun d!146439 () Bool)

(assert (=> d!146439 (= (unapply!64 l!3677) (ite ((_ is Nil!31907) l!3677) None!798 (Some!799 (tuple2!24481 (h!33115 l!3677) (t!46596 l!3677)))))))

(assert (=> start!115360 d!146439))

(check-sat)
