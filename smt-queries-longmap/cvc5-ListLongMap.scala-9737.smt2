; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115388 () Bool)

(assert start!115388)

(declare-fun res!908289 () Bool)

(declare-fun e!773995 () Bool)

(assert (=> start!115388 (=> (not res!908289) (not e!773995))))

(declare-datatypes ((List!31860 0))(
  ( (Nil!31857) (Cons!31856 (h!33065 (_ BitVec 64)) (t!46554 List!31860)) )
))
(declare-fun l!3677 () List!31860)

(declare-datatypes ((tuple2!24412 0))(
  ( (tuple2!24413 (_1!12217 (_ BitVec 64)) (_2!12217 List!31860)) )
))
(declare-datatypes ((Option!801 0))(
  ( (Some!800 (v!21600 tuple2!24412)) (None!799) )
))
(declare-fun isEmpty!1125 (Option!801) Bool)

(declare-fun unapply!67 (List!31860) Option!801)

(assert (=> start!115388 (= res!908289 (isEmpty!1125 (unapply!67 l!3677)))))

(assert (=> start!115388 e!773995))

(assert (=> start!115388 true))

(declare-fun b!1364715 () Bool)

(declare-fun res!908290 () Bool)

(assert (=> b!1364715 (=> (not res!908290) (not e!773995))))

(assert (=> b!1364715 (= res!908290 (not (is-Nil!31857 l!3677)))))

(declare-fun b!1364716 () Bool)

(declare-fun subseq!947 (List!31860 List!31860) Bool)

(assert (=> b!1364716 (= e!773995 (not (subseq!947 l!3677 l!3677)))))

(assert (= (and start!115388 res!908289) b!1364715))

(assert (= (and b!1364715 res!908290) b!1364716))

(declare-fun m!1249483 () Bool)

(assert (=> start!115388 m!1249483))

(assert (=> start!115388 m!1249483))

(declare-fun m!1249485 () Bool)

(assert (=> start!115388 m!1249485))

(declare-fun m!1249487 () Bool)

(assert (=> b!1364716 m!1249487))

(push 1)

(assert (not b!1364716))

(assert (not start!115388))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1364752 () Bool)

(declare-fun e!774025 () Bool)

(assert (=> b!1364752 (= e!774025 (subseq!947 l!3677 (t!46554 l!3677)))))

(declare-fun b!1364748 () Bool)

(declare-fun e!774019 () Bool)

(assert (=> b!1364748 (= e!774019 e!774025)))

(declare-fun res!908322 () Bool)

(assert (=> b!1364748 (=> res!908322 e!774025)))

(declare-fun e!774024 () Bool)

(assert (=> b!1364748 (= res!908322 e!774024)))

(declare-fun res!908324 () Bool)

(assert (=> b!1364748 (=> (not res!908324) (not e!774024))))

(assert (=> b!1364748 (= res!908324 (= (h!33065 l!3677) (h!33065 l!3677)))))

(declare-fun d!146581 () Bool)

(declare-fun res!908320 () Bool)

(declare-fun e!774021 () Bool)

(assert (=> d!146581 (=> res!908320 e!774021)))

(assert (=> d!146581 (= res!908320 (is-Nil!31857 l!3677))))

(assert (=> d!146581 (= (subseq!947 l!3677 l!3677) e!774021)))

(declare-fun b!1364750 () Bool)

(assert (=> b!1364750 (= e!774024 (subseq!947 (t!46554 l!3677) (t!46554 l!3677)))))

(declare-fun b!1364746 () Bool)

(assert (=> b!1364746 (= e!774021 e!774019)))

(declare-fun res!908325 () Bool)

(assert (=> b!1364746 (=> (not res!908325) (not e!774019))))

(assert (=> b!1364746 (= res!908325 (is-Cons!31856 l!3677))))

(assert (= (and d!146581 (not res!908320)) b!1364746))

(assert (= (and b!1364746 res!908325) b!1364748))

(assert (= (and b!1364748 res!908324) b!1364750))

(assert (= (and b!1364748 (not res!908322)) b!1364752))

(declare-fun m!1249502 () Bool)

(assert (=> b!1364752 m!1249502))

(declare-fun m!1249506 () Bool)

(assert (=> b!1364750 m!1249506))

(assert (=> b!1364716 d!146581))

(declare-fun d!146590 () Bool)

(assert (=> d!146590 (= (isEmpty!1125 (unapply!67 l!3677)) (not (is-Some!800 (unapply!67 l!3677))))))

(assert (=> start!115388 d!146590))

(declare-fun d!146595 () Bool)

(assert (=> d!146595 (= (unapply!67 l!3677) (ite (is-Nil!31857 l!3677) None!799 (Some!800 (tuple2!24413 (h!33065 l!3677) (t!46554 l!3677)))))))

(assert (=> start!115388 d!146595))

(push 1)

(assert (not b!1364752))

(assert (not b!1364750))

(check-sat)

