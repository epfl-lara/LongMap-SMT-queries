; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115350 () Bool)

(assert start!115350)

(declare-fun res!908238 () Bool)

(declare-fun e!773947 () Bool)

(assert (=> start!115350 (=> (not res!908238) (not e!773947))))

(declare-datatypes ((List!31856 0))(
  ( (Nil!31853) (Cons!31852 (h!33061 (_ BitVec 64)) (t!46550 List!31856)) )
))
(declare-fun l!3677 () List!31856)

(declare-datatypes ((tuple2!24404 0))(
  ( (tuple2!24405 (_1!12213 (_ BitVec 64)) (_2!12213 List!31856)) )
))
(declare-datatypes ((Option!797 0))(
  ( (Some!796 (v!21596 tuple2!24404)) (None!795) )
))
(declare-fun isEmpty!1121 (Option!797) Bool)

(declare-fun unapply!63 (List!31856) Option!797)

(assert (=> start!115350 (= res!908238 (isEmpty!1121 (unapply!63 l!3677)))))

(assert (=> start!115350 e!773947))

(assert (=> start!115350 true))

(declare-fun b!1364664 () Bool)

(declare-fun res!908239 () Bool)

(assert (=> b!1364664 (=> (not res!908239) (not e!773947))))

(assert (=> b!1364664 (= res!908239 (is-Nil!31853 l!3677))))

(declare-fun b!1364665 () Bool)

(declare-fun subseq!946 (List!31856 List!31856) Bool)

(assert (=> b!1364665 (= e!773947 (not (subseq!946 l!3677 l!3677)))))

(assert (= (and start!115350 res!908238) b!1364664))

(assert (= (and b!1364664 res!908239) b!1364665))

(declare-fun m!1249453 () Bool)

(assert (=> start!115350 m!1249453))

(assert (=> start!115350 m!1249453))

(declare-fun m!1249455 () Bool)

(assert (=> start!115350 m!1249455))

(declare-fun m!1249457 () Bool)

(assert (=> b!1364665 m!1249457))

(push 1)

(assert (not b!1364665))

(assert (not start!115350))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1364687 () Bool)

(declare-fun e!773970 () Bool)

(declare-fun e!773969 () Bool)

(assert (=> b!1364687 (= e!773970 e!773969)))

(declare-fun res!908261 () Bool)

(assert (=> b!1364687 (=> res!908261 e!773969)))

(declare-fun e!773971 () Bool)

(assert (=> b!1364687 (= res!908261 e!773971)))

(declare-fun res!908260 () Bool)

(assert (=> b!1364687 (=> (not res!908260) (not e!773971))))

(assert (=> b!1364687 (= res!908260 (= (h!33061 l!3677) (h!33061 l!3677)))))

(declare-fun b!1364686 () Bool)

(declare-fun e!773968 () Bool)

(assert (=> b!1364686 (= e!773968 e!773970)))

(declare-fun res!908263 () Bool)

(assert (=> b!1364686 (=> (not res!908263) (not e!773970))))

(assert (=> b!1364686 (= res!908263 (is-Cons!31852 l!3677))))

(declare-fun d!146547 () Bool)

(declare-fun res!908262 () Bool)

(assert (=> d!146547 (=> res!908262 e!773968)))

(assert (=> d!146547 (= res!908262 (is-Nil!31853 l!3677))))

(assert (=> d!146547 (= (subseq!946 l!3677 l!3677) e!773968)))

(declare-fun b!1364689 () Bool)

(assert (=> b!1364689 (= e!773969 (subseq!946 l!3677 (t!46550 l!3677)))))

(declare-fun b!1364688 () Bool)

(assert (=> b!1364688 (= e!773971 (subseq!946 (t!46550 l!3677) (t!46550 l!3677)))))

(assert (= (and d!146547 (not res!908262)) b!1364686))

(assert (= (and b!1364686 res!908263) b!1364687))

(assert (= (and b!1364687 res!908260) b!1364688))

(assert (= (and b!1364687 (not res!908261)) b!1364689))

(declare-fun m!1249463 () Bool)

(assert (=> b!1364689 m!1249463))

(declare-fun m!1249465 () Bool)

(assert (=> b!1364688 m!1249465))

