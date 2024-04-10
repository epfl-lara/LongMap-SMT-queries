; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115200 () Bool)

(assert start!115200)

(declare-fun res!908137 () Bool)

(declare-fun e!773833 () Bool)

(assert (=> start!115200 (=> (not res!908137) (not e!773833))))

(declare-datatypes ((List!31838 0))(
  ( (Nil!31835) (Cons!31834 (h!33043 (_ BitVec 64)) (t!46532 List!31838)) )
))
(declare-datatypes ((tuple2!24374 0))(
  ( (tuple2!24375 (_1!12198 (_ BitVec 64)) (_2!12198 List!31838)) )
))
(declare-datatypes ((Option!782 0))(
  ( (Some!781 (v!21581 tuple2!24374)) (None!780) )
))
(declare-fun lt!601063 () Option!782)

(declare-fun isEmpty!1106 (Option!782) Bool)

(assert (=> start!115200 (= res!908137 (not (isEmpty!1106 lt!601063)))))

(declare-fun l!3677 () List!31838)

(declare-fun unapply!48 (List!31838) Option!782)

(assert (=> start!115200 (= lt!601063 (unapply!48 l!3677))))

(assert (=> start!115200 e!773833))

(assert (=> start!115200 true))

(declare-fun b!1364521 () Bool)

(declare-fun isDefined!537 (Option!782) Bool)

(assert (=> b!1364521 (= e!773833 (not (isDefined!537 lt!601063)))))

(assert (= (and start!115200 res!908137) b!1364521))

(declare-fun m!1249279 () Bool)

(assert (=> start!115200 m!1249279))

(declare-fun m!1249281 () Bool)

(assert (=> start!115200 m!1249281))

(declare-fun m!1249283 () Bool)

(assert (=> b!1364521 m!1249283))

(push 1)

(assert (not start!115200))

(assert (not b!1364521))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!146409 () Bool)

(assert (=> d!146409 (= (isEmpty!1106 lt!601063) (not (is-Some!781 lt!601063)))))

(assert (=> start!115200 d!146409))

(declare-fun d!146415 () Bool)

(assert (=> d!146415 (= (unapply!48 l!3677) (ite (is-Nil!31835 l!3677) None!780 (Some!781 (tuple2!24375 (h!33043 l!3677) (t!46532 l!3677)))))))

(assert (=> start!115200 d!146415))

(declare-fun d!146423 () Bool)

(assert (=> d!146423 (= (isDefined!537 lt!601063) (not (isEmpty!1106 lt!601063)))))

(declare-fun bs!39125 () Bool)

(assert (= bs!39125 d!146423))

(assert (=> bs!39125 m!1249279))

(assert (=> b!1364521 d!146423))

(push 1)

(assert (not d!146423))

(check-sat)

(pop 1)

