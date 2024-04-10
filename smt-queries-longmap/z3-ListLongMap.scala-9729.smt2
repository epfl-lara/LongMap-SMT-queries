; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115198 () Bool)

(assert start!115198)

(declare-fun res!908134 () Bool)

(declare-fun e!773830 () Bool)

(assert (=> start!115198 (=> (not res!908134) (not e!773830))))

(declare-datatypes ((List!31837 0))(
  ( (Nil!31834) (Cons!31833 (h!33042 (_ BitVec 64)) (t!46531 List!31837)) )
))
(declare-datatypes ((tuple2!24372 0))(
  ( (tuple2!24373 (_1!12197 (_ BitVec 64)) (_2!12197 List!31837)) )
))
(declare-datatypes ((Option!781 0))(
  ( (Some!780 (v!21580 tuple2!24372)) (None!779) )
))
(declare-fun lt!601060 () Option!781)

(declare-fun isEmpty!1105 (Option!781) Bool)

(assert (=> start!115198 (= res!908134 (not (isEmpty!1105 lt!601060)))))

(declare-fun l!3677 () List!31837)

(declare-fun unapply!47 (List!31837) Option!781)

(assert (=> start!115198 (= lt!601060 (unapply!47 l!3677))))

(assert (=> start!115198 e!773830))

(assert (=> start!115198 true))

(declare-fun b!1364518 () Bool)

(declare-fun isDefined!536 (Option!781) Bool)

(assert (=> b!1364518 (= e!773830 (not (isDefined!536 lt!601060)))))

(assert (= (and start!115198 res!908134) b!1364518))

(declare-fun m!1249273 () Bool)

(assert (=> start!115198 m!1249273))

(declare-fun m!1249275 () Bool)

(assert (=> start!115198 m!1249275))

(declare-fun m!1249277 () Bool)

(assert (=> b!1364518 m!1249277))

(check-sat (not b!1364518) (not start!115198))
(check-sat)
(get-model)

(declare-fun d!146407 () Bool)

(assert (=> d!146407 (= (isDefined!536 lt!601060) (not (isEmpty!1105 lt!601060)))))

(declare-fun bs!39123 () Bool)

(assert (= bs!39123 d!146407))

(assert (=> bs!39123 m!1249273))

(assert (=> b!1364518 d!146407))

(declare-fun d!146413 () Bool)

(get-info :version)

(assert (=> d!146413 (= (isEmpty!1105 lt!601060) (not ((_ is Some!780) lt!601060)))))

(assert (=> start!115198 d!146413))

(declare-fun d!146419 () Bool)

(assert (=> d!146419 (= (unapply!47 l!3677) (ite ((_ is Nil!31834) l!3677) None!779 (Some!780 (tuple2!24373 (h!33042 l!3677) (t!46531 l!3677)))))))

(assert (=> start!115198 d!146419))

(check-sat (not d!146407))
(check-sat)
