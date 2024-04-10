; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115248 () Bool)

(assert start!115248)

(declare-fun res!908155 () Bool)

(declare-fun e!773851 () Bool)

(assert (=> start!115248 (=> (not res!908155) (not e!773851))))

(declare-datatypes ((List!31844 0))(
  ( (Nil!31841) (Cons!31840 (h!33049 (_ BitVec 64)) (t!46538 List!31844)) )
))
(declare-datatypes ((tuple2!24386 0))(
  ( (tuple2!24387 (_1!12204 (_ BitVec 64)) (_2!12204 List!31844)) )
))
(declare-datatypes ((Option!788 0))(
  ( (Some!787 (v!21587 tuple2!24386)) (None!786) )
))
(declare-fun lt!601081 () Option!788)

(declare-fun isEmpty!1112 (Option!788) Bool)

(assert (=> start!115248 (= res!908155 (not (isEmpty!1112 lt!601081)))))

(declare-fun l!3677 () List!31844)

(declare-fun unapply!54 (List!31844) Option!788)

(assert (=> start!115248 (= lt!601081 (unapply!54 l!3677))))

(assert (=> start!115248 e!773851))

(assert (=> start!115248 true))

(declare-fun b!1364539 () Bool)

(declare-fun isDefined!543 (Option!788) Bool)

(assert (=> b!1364539 (= e!773851 (not (isDefined!543 lt!601081)))))

(assert (= (and start!115248 res!908155) b!1364539))

(declare-fun m!1249315 () Bool)

(assert (=> start!115248 m!1249315))

(declare-fun m!1249317 () Bool)

(assert (=> start!115248 m!1249317))

(declare-fun m!1249319 () Bool)

(assert (=> b!1364539 m!1249319))

(push 1)

(assert (not start!115248))

(assert (not b!1364539))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!146451 () Bool)

(assert (=> d!146451 (= (isEmpty!1112 lt!601081) (not (is-Some!787 lt!601081)))))

(assert (=> start!115248 d!146451))

(declare-fun d!146457 () Bool)

(assert (=> d!146457 (= (unapply!54 l!3677) (ite (is-Nil!31841 l!3677) None!786 (Some!787 (tuple2!24387 (h!33049 l!3677) (t!46538 l!3677)))))))

(assert (=> start!115248 d!146457))

(declare-fun d!146463 () Bool)

(assert (=> d!146463 (= (isDefined!543 lt!601081) (not (isEmpty!1112 lt!601081)))))

(declare-fun bs!39137 () Bool)

(assert (= bs!39137 d!146463))

(assert (=> bs!39137 m!1249315))

(assert (=> b!1364539 d!146463))

(push 1)

