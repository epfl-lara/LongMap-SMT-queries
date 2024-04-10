; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115346 () Bool)

(assert start!115346)

(declare-fun res!908226 () Bool)

(declare-fun e!773941 () Bool)

(assert (=> start!115346 (=> (not res!908226) (not e!773941))))

(declare-datatypes ((List!31854 0))(
  ( (Nil!31851) (Cons!31850 (h!33059 (_ BitVec 64)) (t!46548 List!31854)) )
))
(declare-fun l!3677 () List!31854)

(declare-datatypes ((tuple2!24400 0))(
  ( (tuple2!24401 (_1!12211 (_ BitVec 64)) (_2!12211 List!31854)) )
))
(declare-datatypes ((Option!795 0))(
  ( (Some!794 (v!21594 tuple2!24400)) (None!793) )
))
(declare-fun isEmpty!1119 (Option!795) Bool)

(declare-fun unapply!61 (List!31854) Option!795)

(assert (=> start!115346 (= res!908226 (isEmpty!1119 (unapply!61 l!3677)))))

(assert (=> start!115346 e!773941))

(assert (=> start!115346 true))

(declare-fun b!1364652 () Bool)

(declare-fun res!908227 () Bool)

(assert (=> b!1364652 (=> (not res!908227) (not e!773941))))

(assert (=> b!1364652 (= res!908227 (is-Nil!31851 l!3677))))

(declare-fun b!1364653 () Bool)

(declare-fun subseq!944 (List!31854 List!31854) Bool)

(assert (=> b!1364653 (= e!773941 (not (subseq!944 l!3677 l!3677)))))

(assert (= (and start!115346 res!908226) b!1364652))

(assert (= (and b!1364652 res!908227) b!1364653))

(declare-fun m!1249441 () Bool)

(assert (=> start!115346 m!1249441))

(assert (=> start!115346 m!1249441))

(declare-fun m!1249443 () Bool)

(assert (=> start!115346 m!1249443))

(declare-fun m!1249445 () Bool)

(assert (=> b!1364653 m!1249445))

(push 1)

(assert (not start!115346))

(assert (not b!1364653))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!146549 () Bool)

(assert (=> d!146549 (= (isEmpty!1119 (unapply!61 l!3677)) (not (is-Some!794 (unapply!61 l!3677))))))

(assert (=> start!115346 d!146549))

(declare-fun d!146551 () Bool)

(assert (=> d!146551 (= (unapply!61 l!3677) (ite (is-Nil!31851 l!3677) None!793 (Some!794 (tuple2!24401 (h!33059 l!3677) (t!46548 l!3677)))))))

(assert (=> start!115346 d!146551))

(declare-fun b!1364700 () Bool)

(declare-fun e!773983 () Bool)

(assert (=> b!1364700 (= e!773983 (subseq!944 (t!46548 l!3677) (t!46548 l!3677)))))

(declare-fun b!1364698 () Bool)

(declare-fun e!773981 () Bool)

(declare-fun e!773982 () Bool)

(assert (=> b!1364698 (= e!773981 e!773982)))

(declare-fun res!908273 () Bool)

(assert (=> b!1364698 (=> (not res!908273) (not e!773982))))

(assert (=> b!1364698 (= res!908273 (is-Cons!31850 l!3677))))

(declare-fun b!1364699 () Bool)

(declare-fun e!773980 () Bool)

(assert (=> b!1364699 (= e!773982 e!773980)))

(declare-fun res!908272 () Bool)

(assert (=> b!1364699 (=> res!908272 e!773980)))

(assert (=> b!1364699 (= res!908272 e!773983)))

(declare-fun res!908275 () Bool)

(assert (=> b!1364699 (=> (not res!908275) (not e!773983))))

(assert (=> b!1364699 (= res!908275 (= (h!33059 l!3677) (h!33059 l!3677)))))

(declare-fun b!1364701 () Bool)

(assert (=> b!1364701 (= e!773980 (subseq!944 l!3677 (t!46548 l!3677)))))

(declare-fun d!146553 () Bool)

(declare-fun res!908274 () Bool)

(assert (=> d!146553 (=> res!908274 e!773981)))

(assert (=> d!146553 (= res!908274 (is-Nil!31851 l!3677))))

(assert (=> d!146553 (= (subseq!944 l!3677 l!3677) e!773981)))

(assert (= (and d!146553 (not res!908274)) b!1364698))

(assert (= (and b!1364698 res!908273) b!1364699))

(assert (= (and b!1364699 res!908275) b!1364700))

(assert (= (and b!1364699 (not res!908272)) b!1364701))

(declare-fun m!1249467 () Bool)

(assert (=> b!1364700 m!1249467))

(declare-fun m!1249469 () Bool)

(assert (=> b!1364701 m!1249469))

(assert (=> b!1364653 d!146553))

