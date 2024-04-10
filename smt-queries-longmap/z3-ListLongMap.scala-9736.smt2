; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115372 () Bool)

(assert start!115372)

(declare-fun res!908281 () Bool)

(declare-fun e!773989 () Bool)

(assert (=> start!115372 (=> (not res!908281) (not e!773989))))

(declare-datatypes ((List!31858 0))(
  ( (Nil!31855) (Cons!31854 (h!33063 (_ BitVec 64)) (t!46552 List!31858)) )
))
(declare-fun l!3677 () List!31858)

(declare-datatypes ((tuple2!24408 0))(
  ( (tuple2!24409 (_1!12215 (_ BitVec 64)) (_2!12215 List!31858)) )
))
(declare-datatypes ((Option!799 0))(
  ( (Some!798 (v!21598 tuple2!24408)) (None!797) )
))
(declare-fun isEmpty!1123 (Option!799) Bool)

(declare-fun unapply!65 (List!31858) Option!799)

(assert (=> start!115372 (= res!908281 (isEmpty!1123 (unapply!65 l!3677)))))

(assert (=> start!115372 e!773989))

(assert (=> start!115372 true))

(declare-fun b!1364707 () Bool)

(get-info :version)

(assert (=> b!1364707 (= e!773989 (not ((_ is Nil!31855) l!3677)))))

(assert (= (and start!115372 res!908281) b!1364707))

(declare-fun m!1249475 () Bool)

(assert (=> start!115372 m!1249475))

(assert (=> start!115372 m!1249475))

(declare-fun m!1249477 () Bool)

(assert (=> start!115372 m!1249477))

(check-sat (not start!115372))
(check-sat)
(get-model)

(declare-fun d!146569 () Bool)

(assert (=> d!146569 (= (isEmpty!1123 (unapply!65 l!3677)) (not ((_ is Some!798) (unapply!65 l!3677))))))

(assert (=> start!115372 d!146569))

(declare-fun d!146573 () Bool)

(assert (=> d!146573 (= (unapply!65 l!3677) (ite ((_ is Nil!31855) l!3677) None!797 (Some!798 (tuple2!24409 (h!33063 l!3677) (t!46552 l!3677)))))))

(assert (=> start!115372 d!146573))

(check-sat)
