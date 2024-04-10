; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115392 () Bool)

(assert start!115392)

(declare-fun res!908301 () Bool)

(declare-fun e!774001 () Bool)

(assert (=> start!115392 (=> (not res!908301) (not e!774001))))

(declare-datatypes ((List!31862 0))(
  ( (Nil!31859) (Cons!31858 (h!33067 (_ BitVec 64)) (t!46556 List!31862)) )
))
(declare-fun l!3677 () List!31862)

(declare-datatypes ((tuple2!24416 0))(
  ( (tuple2!24417 (_1!12219 (_ BitVec 64)) (_2!12219 List!31862)) )
))
(declare-datatypes ((Option!803 0))(
  ( (Some!802 (v!21602 tuple2!24416)) (None!801) )
))
(declare-fun isEmpty!1127 (Option!803) Bool)

(declare-fun unapply!69 (List!31862) Option!803)

(assert (=> start!115392 (= res!908301 (isEmpty!1127 (unapply!69 l!3677)))))

(assert (=> start!115392 e!774001))

(assert (=> start!115392 true))

(declare-fun b!1364727 () Bool)

(declare-fun res!908302 () Bool)

(assert (=> b!1364727 (=> (not res!908302) (not e!774001))))

(assert (=> b!1364727 (= res!908302 (not (is-Nil!31859 l!3677)))))

(declare-fun b!1364728 () Bool)

(declare-fun subseq!949 (List!31862 List!31862) Bool)

(assert (=> b!1364728 (= e!774001 (not (subseq!949 l!3677 l!3677)))))

(assert (= (and start!115392 res!908301) b!1364727))

(assert (= (and b!1364727 res!908302) b!1364728))

(declare-fun m!1249495 () Bool)

(assert (=> start!115392 m!1249495))

(assert (=> start!115392 m!1249495))

(declare-fun m!1249497 () Bool)

(assert (=> start!115392 m!1249497))

(declare-fun m!1249499 () Bool)

(assert (=> b!1364728 m!1249499))

(push 1)

(assert (not b!1364728))

(assert (not start!115392))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!146580 () Bool)

(declare-fun res!908323 () Bool)

(declare-fun e!774020 () Bool)

(assert (=> d!146580 (=> res!908323 e!774020)))

(assert (=> d!146580 (= res!908323 (is-Nil!31859 l!3677))))

(assert (=> d!146580 (= (subseq!949 l!3677 l!3677) e!774020)))

(declare-fun b!1364747 () Bool)

(declare-fun e!774018 () Bool)

(declare-fun e!774023 () Bool)

(assert (=> b!1364747 (= e!774018 e!774023)))

(declare-fun res!908321 () Bool)

(assert (=> b!1364747 (=> res!908321 e!774023)))

(declare-fun e!774022 () Bool)

(assert (=> b!1364747 (= res!908321 e!774022)))

(declare-fun res!908326 () Bool)

(assert (=> b!1364747 (=> (not res!908326) (not e!774022))))

(assert (=> b!1364747 (= res!908326 (= (h!33067 l!3677) (h!33067 l!3677)))))

(declare-fun b!1364751 () Bool)

(assert (=> b!1364751 (= e!774023 (subseq!949 l!3677 (t!46556 l!3677)))))

(declare-fun b!1364749 () Bool)

(assert (=> b!1364749 (= e!774022 (subseq!949 (t!46556 l!3677) (t!46556 l!3677)))))

(declare-fun b!1364745 () Bool)

(assert (=> b!1364745 (= e!774020 e!774018)))

(declare-fun res!908319 () Bool)

(assert (=> b!1364745 (=> (not res!908319) (not e!774018))))

(assert (=> b!1364745 (= res!908319 (is-Cons!31858 l!3677))))

(assert (= (and d!146580 (not res!908323)) b!1364745))

(assert (= (and b!1364745 res!908319) b!1364747))

(assert (= (and b!1364747 res!908326) b!1364749))

(assert (= (and b!1364747 (not res!908321)) b!1364751))

(declare-fun m!1249503 () Bool)

(assert (=> b!1364751 m!1249503))

(declare-fun m!1249507 () Bool)

(assert (=> b!1364749 m!1249507))

(assert (=> b!1364728 d!146580))

(declare-fun d!146591 () Bool)

(assert (=> d!146591 (= (isEmpty!1127 (unapply!69 l!3677)) (not (is-Some!802 (unapply!69 l!3677))))))

(assert (=> start!115392 d!146591))

(declare-fun d!146593 () Bool)

