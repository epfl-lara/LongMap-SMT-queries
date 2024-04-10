; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115348 () Bool)

(assert start!115348)

(declare-fun res!908232 () Bool)

(declare-fun e!773944 () Bool)

(assert (=> start!115348 (=> (not res!908232) (not e!773944))))

(declare-datatypes ((List!31855 0))(
  ( (Nil!31852) (Cons!31851 (h!33060 (_ BitVec 64)) (t!46549 List!31855)) )
))
(declare-fun l!3677 () List!31855)

(declare-datatypes ((tuple2!24402 0))(
  ( (tuple2!24403 (_1!12212 (_ BitVec 64)) (_2!12212 List!31855)) )
))
(declare-datatypes ((Option!796 0))(
  ( (Some!795 (v!21595 tuple2!24402)) (None!794) )
))
(declare-fun isEmpty!1120 (Option!796) Bool)

(declare-fun unapply!62 (List!31855) Option!796)

(assert (=> start!115348 (= res!908232 (isEmpty!1120 (unapply!62 l!3677)))))

(assert (=> start!115348 e!773944))

(assert (=> start!115348 true))

(declare-fun b!1364658 () Bool)

(declare-fun res!908233 () Bool)

(assert (=> b!1364658 (=> (not res!908233) (not e!773944))))

(get-info :version)

(assert (=> b!1364658 (= res!908233 ((_ is Nil!31852) l!3677))))

(declare-fun b!1364659 () Bool)

(declare-fun subseq!945 (List!31855 List!31855) Bool)

(assert (=> b!1364659 (= e!773944 (not (subseq!945 l!3677 l!3677)))))

(assert (= (and start!115348 res!908232) b!1364658))

(assert (= (and b!1364658 res!908233) b!1364659))

(declare-fun m!1249447 () Bool)

(assert (=> start!115348 m!1249447))

(assert (=> start!115348 m!1249447))

(declare-fun m!1249449 () Bool)

(assert (=> start!115348 m!1249449))

(declare-fun m!1249451 () Bool)

(assert (=> b!1364659 m!1249451))

(check-sat (not b!1364659) (not start!115348))
(check-sat)
(get-model)

(declare-fun b!1364682 () Bool)

(declare-fun e!773966 () Bool)

(declare-fun e!773964 () Bool)

(assert (=> b!1364682 (= e!773966 e!773964)))

(declare-fun res!908259 () Bool)

(assert (=> b!1364682 (=> (not res!908259) (not e!773964))))

(assert (=> b!1364682 (= res!908259 ((_ is Cons!31851) l!3677))))

(declare-fun b!1364683 () Bool)

(declare-fun e!773965 () Bool)

(assert (=> b!1364683 (= e!773964 e!773965)))

(declare-fun res!908256 () Bool)

(assert (=> b!1364683 (=> res!908256 e!773965)))

(declare-fun e!773967 () Bool)

(assert (=> b!1364683 (= res!908256 e!773967)))

(declare-fun res!908258 () Bool)

(assert (=> b!1364683 (=> (not res!908258) (not e!773967))))

(assert (=> b!1364683 (= res!908258 (= (h!33060 l!3677) (h!33060 l!3677)))))

(declare-fun b!1364684 () Bool)

(assert (=> b!1364684 (= e!773967 (subseq!945 (t!46549 l!3677) (t!46549 l!3677)))))

(declare-fun b!1364685 () Bool)

(assert (=> b!1364685 (= e!773965 (subseq!945 l!3677 (t!46549 l!3677)))))

(declare-fun d!146545 () Bool)

(declare-fun res!908257 () Bool)

(assert (=> d!146545 (=> res!908257 e!773966)))

(assert (=> d!146545 (= res!908257 ((_ is Nil!31852) l!3677))))

(assert (=> d!146545 (= (subseq!945 l!3677 l!3677) e!773966)))

(assert (= (and d!146545 (not res!908257)) b!1364682))

(assert (= (and b!1364682 res!908259) b!1364683))

(assert (= (and b!1364683 res!908258) b!1364684))

(assert (= (and b!1364683 (not res!908256)) b!1364685))

(declare-fun m!1249459 () Bool)

(assert (=> b!1364684 m!1249459))

(declare-fun m!1249461 () Bool)

(assert (=> b!1364685 m!1249461))

(assert (=> b!1364659 d!146545))

(declare-fun d!146555 () Bool)

(assert (=> d!146555 (= (isEmpty!1120 (unapply!62 l!3677)) (not ((_ is Some!795) (unapply!62 l!3677))))))

(assert (=> start!115348 d!146555))

(declare-fun d!146559 () Bool)

(assert (=> d!146559 (= (unapply!62 l!3677) (ite ((_ is Nil!31852) l!3677) None!794 (Some!795 (tuple2!24403 (h!33060 l!3677) (t!46549 l!3677)))))))

(assert (=> start!115348 d!146559))

(check-sat (not b!1364684) (not b!1364685))
(check-sat)
