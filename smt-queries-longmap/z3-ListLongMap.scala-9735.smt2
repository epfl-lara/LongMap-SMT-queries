; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115336 () Bool)

(assert start!115336)

(declare-fun res!908197 () Bool)

(declare-fun e!773907 () Bool)

(assert (=> start!115336 (=> (not res!908197) (not e!773907))))

(declare-datatypes ((List!31907 0))(
  ( (Nil!31904) (Cons!31903 (h!33112 (_ BitVec 64)) (t!46593 List!31907)) )
))
(declare-fun l!3677 () List!31907)

(declare-datatypes ((tuple2!24474 0))(
  ( (tuple2!24475 (_1!12248 (_ BitVec 64)) (_2!12248 List!31907)) )
))
(declare-datatypes ((Option!797 0))(
  ( (Some!796 (v!21593 tuple2!24474)) (None!795) )
))
(declare-fun isEmpty!1124 (Option!797) Bool)

(declare-fun unapply!61 (List!31907) Option!797)

(assert (=> start!115336 (= res!908197 (isEmpty!1124 (unapply!61 l!3677)))))

(assert (=> start!115336 e!773907))

(assert (=> start!115336 true))

(declare-fun b!1364580 () Bool)

(declare-fun res!908198 () Bool)

(assert (=> b!1364580 (=> (not res!908198) (not e!773907))))

(get-info :version)

(assert (=> b!1364580 (= res!908198 ((_ is Nil!31904) l!3677))))

(declare-fun b!1364581 () Bool)

(declare-fun subseq!944 (List!31907 List!31907) Bool)

(assert (=> b!1364581 (= e!773907 (not (subseq!944 l!3677 l!3677)))))

(assert (= (and start!115336 res!908197) b!1364580))

(assert (= (and b!1364580 res!908198) b!1364581))

(declare-fun m!1248919 () Bool)

(assert (=> start!115336 m!1248919))

(assert (=> start!115336 m!1248919))

(declare-fun m!1248921 () Bool)

(assert (=> start!115336 m!1248921))

(declare-fun m!1248923 () Bool)

(assert (=> b!1364581 m!1248923))

(check-sat (not start!115336) (not b!1364581))
(check-sat)
(get-model)

(declare-fun d!146417 () Bool)

(assert (=> d!146417 (= (isEmpty!1124 (unapply!61 l!3677)) (not ((_ is Some!796) (unapply!61 l!3677))))))

(assert (=> start!115336 d!146417))

(declare-fun d!146423 () Bool)

(assert (=> d!146423 (= (unapply!61 l!3677) (ite ((_ is Nil!31904) l!3677) None!795 (Some!796 (tuple2!24475 (h!33112 l!3677) (t!46593 l!3677)))))))

(assert (=> start!115336 d!146423))

(declare-fun b!1364624 () Bool)

(declare-fun e!773942 () Bool)

(assert (=> b!1364624 (= e!773942 (subseq!944 (t!46593 l!3677) (t!46593 l!3677)))))

(declare-fun b!1364623 () Bool)

(declare-fun e!773943 () Bool)

(declare-fun e!773944 () Bool)

(assert (=> b!1364623 (= e!773943 e!773944)))

(declare-fun res!908240 () Bool)

(assert (=> b!1364623 (=> res!908240 e!773944)))

(assert (=> b!1364623 (= res!908240 e!773942)))

(declare-fun res!908241 () Bool)

(assert (=> b!1364623 (=> (not res!908241) (not e!773942))))

(assert (=> b!1364623 (= res!908241 (= (h!33112 l!3677) (h!33112 l!3677)))))

(declare-fun d!146427 () Bool)

(declare-fun res!908242 () Bool)

(declare-fun e!773945 () Bool)

(assert (=> d!146427 (=> res!908242 e!773945)))

(assert (=> d!146427 (= res!908242 ((_ is Nil!31904) l!3677))))

(assert (=> d!146427 (= (subseq!944 l!3677 l!3677) e!773945)))

(declare-fun b!1364622 () Bool)

(assert (=> b!1364622 (= e!773945 e!773943)))

(declare-fun res!908239 () Bool)

(assert (=> b!1364622 (=> (not res!908239) (not e!773943))))

(assert (=> b!1364622 (= res!908239 ((_ is Cons!31903) l!3677))))

(declare-fun b!1364625 () Bool)

(assert (=> b!1364625 (= e!773944 (subseq!944 l!3677 (t!46593 l!3677)))))

(assert (= (and d!146427 (not res!908242)) b!1364622))

(assert (= (and b!1364622 res!908239) b!1364623))

(assert (= (and b!1364623 res!908241) b!1364624))

(assert (= (and b!1364623 (not res!908240)) b!1364625))

(declare-fun m!1248941 () Bool)

(assert (=> b!1364624 m!1248941))

(declare-fun m!1248943 () Bool)

(assert (=> b!1364625 m!1248943))

(assert (=> b!1364581 d!146427))

(check-sat (not b!1364624) (not b!1364625))
(check-sat)
