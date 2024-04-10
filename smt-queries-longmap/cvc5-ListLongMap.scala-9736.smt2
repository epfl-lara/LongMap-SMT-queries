; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115370 () Bool)

(assert start!115370)

(declare-fun res!908278 () Bool)

(declare-fun e!773986 () Bool)

(assert (=> start!115370 (=> (not res!908278) (not e!773986))))

(declare-datatypes ((List!31857 0))(
  ( (Nil!31854) (Cons!31853 (h!33062 (_ BitVec 64)) (t!46551 List!31857)) )
))
(declare-fun l!3677 () List!31857)

(declare-datatypes ((tuple2!24406 0))(
  ( (tuple2!24407 (_1!12214 (_ BitVec 64)) (_2!12214 List!31857)) )
))
(declare-datatypes ((Option!798 0))(
  ( (Some!797 (v!21597 tuple2!24406)) (None!796) )
))
(declare-fun isEmpty!1122 (Option!798) Bool)

(declare-fun unapply!64 (List!31857) Option!798)

(assert (=> start!115370 (= res!908278 (isEmpty!1122 (unapply!64 l!3677)))))

(assert (=> start!115370 e!773986))

(assert (=> start!115370 true))

(declare-fun b!1364704 () Bool)

(assert (=> b!1364704 (= e!773986 (not (is-Nil!31854 l!3677)))))

(assert (= (and start!115370 res!908278) b!1364704))

(declare-fun m!1249471 () Bool)

(assert (=> start!115370 m!1249471))

(assert (=> start!115370 m!1249471))

(declare-fun m!1249473 () Bool)

(assert (=> start!115370 m!1249473))

(push 1)

(assert (not start!115370))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!146568 () Bool)

(assert (=> d!146568 (= (isEmpty!1122 (unapply!64 l!3677)) (not (is-Some!797 (unapply!64 l!3677))))))

(assert (=> start!115370 d!146568))

(declare-fun d!146571 () Bool)

(assert (=> d!146571 (= (unapply!64 l!3677) (ite (is-Nil!31854 l!3677) None!796 (Some!797 (tuple2!24407 (h!33062 l!3677) (t!46551 l!3677)))))))

(assert (=> start!115370 d!146571))

(push 1)

