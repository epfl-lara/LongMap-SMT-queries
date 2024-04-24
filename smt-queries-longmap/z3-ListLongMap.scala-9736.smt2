; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115594 () Bool)

(assert start!115594)

(declare-fun res!908796 () Bool)

(declare-fun e!774829 () Bool)

(assert (=> start!115594 (=> (not res!908796) (not e!774829))))

(declare-datatypes ((List!31897 0))(
  ( (Nil!31894) (Cons!31893 (h!33111 (_ BitVec 64)) (t!46583 List!31897)) )
))
(declare-fun l!3677 () List!31897)

(declare-datatypes ((tuple2!24462 0))(
  ( (tuple2!24463 (_1!12242 (_ BitVec 64)) (_2!12242 List!31897)) )
))
(declare-datatypes ((Option!793 0))(
  ( (Some!792 (v!21592 tuple2!24462)) (None!791) )
))
(declare-fun isEmpty!1125 (Option!793) Bool)

(declare-fun unapply!64 (List!31897) Option!793)

(assert (=> start!115594 (= res!908796 (isEmpty!1125 (unapply!64 l!3677)))))

(assert (=> start!115594 e!774829))

(assert (=> start!115594 true))

(declare-fun b!1366003 () Bool)

(get-info :version)

(assert (=> b!1366003 (= e!774829 (not ((_ is Nil!31894) l!3677)))))

(assert (= (and start!115594 res!908796) b!1366003))

(declare-fun m!1251067 () Bool)

(assert (=> start!115594 m!1251067))

(assert (=> start!115594 m!1251067))

(declare-fun m!1251069 () Bool)

(assert (=> start!115594 m!1251069))

(check-sat (not start!115594))
(check-sat)
(get-model)

(declare-fun d!147013 () Bool)

(assert (=> d!147013 (= (isEmpty!1125 (unapply!64 l!3677)) (not ((_ is Some!792) (unapply!64 l!3677))))))

(assert (=> start!115594 d!147013))

(declare-fun d!147016 () Bool)

(assert (=> d!147016 (= (unapply!64 l!3677) (ite ((_ is Nil!31894) l!3677) None!791 (Some!792 (tuple2!24463 (h!33111 l!3677) (t!46583 l!3677)))))))

(assert (=> start!115594 d!147016))

(check-sat)
