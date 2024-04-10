; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115374 () Bool)

(assert start!115374)

(declare-fun res!908284 () Bool)

(declare-fun e!773992 () Bool)

(assert (=> start!115374 (=> (not res!908284) (not e!773992))))

(declare-datatypes ((List!31859 0))(
  ( (Nil!31856) (Cons!31855 (h!33064 (_ BitVec 64)) (t!46553 List!31859)) )
))
(declare-fun l!3677 () List!31859)

(declare-datatypes ((tuple2!24410 0))(
  ( (tuple2!24411 (_1!12216 (_ BitVec 64)) (_2!12216 List!31859)) )
))
(declare-datatypes ((Option!800 0))(
  ( (Some!799 (v!21599 tuple2!24410)) (None!798) )
))
(declare-fun isEmpty!1124 (Option!800) Bool)

(declare-fun unapply!66 (List!31859) Option!800)

(assert (=> start!115374 (= res!908284 (isEmpty!1124 (unapply!66 l!3677)))))

(assert (=> start!115374 e!773992))

(assert (=> start!115374 true))

(declare-fun b!1364710 () Bool)

(assert (=> b!1364710 (= e!773992 (not (is-Nil!31856 l!3677)))))

(assert (= (and start!115374 res!908284) b!1364710))

(declare-fun m!1249479 () Bool)

(assert (=> start!115374 m!1249479))

(assert (=> start!115374 m!1249479))

(declare-fun m!1249481 () Bool)

(assert (=> start!115374 m!1249481))

(push 1)

(assert (not start!115374))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!146565 () Bool)

(assert (=> d!146565 (= (isEmpty!1124 (unapply!66 l!3677)) (not (is-Some!799 (unapply!66 l!3677))))))

(assert (=> start!115374 d!146565))

(declare-fun d!146575 () Bool)

(assert (=> d!146575 (= (unapply!66 l!3677) (ite (is-Nil!31856 l!3677) None!798 (Some!799 (tuple2!24411 (h!33064 l!3677) (t!46553 l!3677)))))))

(assert (=> start!115374 d!146575))

(push 1)

