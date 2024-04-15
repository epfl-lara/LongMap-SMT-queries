; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115378 () Bool)

(assert start!115378)

(declare-fun res!908260 () Bool)

(declare-fun e!773961 () Bool)

(assert (=> start!115378 (=> (not res!908260) (not e!773961))))

(declare-datatypes ((List!31913 0))(
  ( (Nil!31910) (Cons!31909 (h!33118 (_ BitVec 64)) (t!46599 List!31913)) )
))
(declare-fun l!3677 () List!31913)

(declare-datatypes ((tuple2!24486 0))(
  ( (tuple2!24487 (_1!12254 (_ BitVec 64)) (_2!12254 List!31913)) )
))
(declare-datatypes ((Option!803 0))(
  ( (Some!802 (v!21599 tuple2!24486)) (None!801) )
))
(declare-fun isEmpty!1130 (Option!803) Bool)

(declare-fun unapply!67 (List!31913) Option!803)

(assert (=> start!115378 (= res!908260 (isEmpty!1130 (unapply!67 l!3677)))))

(assert (=> start!115378 e!773961))

(assert (=> start!115378 true))

(declare-fun b!1364643 () Bool)

(declare-fun res!908261 () Bool)

(assert (=> b!1364643 (=> (not res!908261) (not e!773961))))

(get-info :version)

(assert (=> b!1364643 (= res!908261 (not ((_ is Nil!31910) l!3677)))))

(declare-fun b!1364644 () Bool)

(declare-fun subseq!947 (List!31913 List!31913) Bool)

(assert (=> b!1364644 (= e!773961 (not (subseq!947 l!3677 l!3677)))))

(assert (= (and start!115378 res!908260) b!1364643))

(assert (= (and b!1364643 res!908261) b!1364644))

(declare-fun m!1248961 () Bool)

(assert (=> start!115378 m!1248961))

(assert (=> start!115378 m!1248961))

(declare-fun m!1248963 () Bool)

(assert (=> start!115378 m!1248963))

(declare-fun m!1248965 () Bool)

(assert (=> b!1364644 m!1248965))

(check-sat (not b!1364644) (not start!115378))
(check-sat)
(get-model)

(declare-fun b!1364676 () Bool)

(declare-fun e!773984 () Bool)

(assert (=> b!1364676 (= e!773984 (subseq!947 l!3677 (t!46599 l!3677)))))

(declare-fun b!1364675 () Bool)

(declare-fun e!773987 () Bool)

(assert (=> b!1364675 (= e!773987 (subseq!947 (t!46599 l!3677) (t!46599 l!3677)))))

(declare-fun d!146452 () Bool)

(declare-fun res!908293 () Bool)

(declare-fun e!773986 () Bool)

(assert (=> d!146452 (=> res!908293 e!773986)))

(assert (=> d!146452 (= res!908293 ((_ is Nil!31910) l!3677))))

(assert (=> d!146452 (= (subseq!947 l!3677 l!3677) e!773986)))

(declare-fun b!1364673 () Bool)

(declare-fun e!773985 () Bool)

(assert (=> b!1364673 (= e!773986 e!773985)))

(declare-fun res!908290 () Bool)

(assert (=> b!1364673 (=> (not res!908290) (not e!773985))))

(assert (=> b!1364673 (= res!908290 ((_ is Cons!31909) l!3677))))

(declare-fun b!1364674 () Bool)

(assert (=> b!1364674 (= e!773985 e!773984)))

(declare-fun res!908292 () Bool)

(assert (=> b!1364674 (=> res!908292 e!773984)))

(assert (=> b!1364674 (= res!908292 e!773987)))

(declare-fun res!908291 () Bool)

(assert (=> b!1364674 (=> (not res!908291) (not e!773987))))

(assert (=> b!1364674 (= res!908291 (= (h!33118 l!3677) (h!33118 l!3677)))))

(assert (= (and d!146452 (not res!908293)) b!1364673))

(assert (= (and b!1364673 res!908290) b!1364674))

(assert (= (and b!1364674 res!908291) b!1364675))

(assert (= (and b!1364674 (not res!908292)) b!1364676))

(declare-fun m!1248979 () Bool)

(assert (=> b!1364676 m!1248979))

(declare-fun m!1248981 () Bool)

(assert (=> b!1364675 m!1248981))

(assert (=> b!1364644 d!146452))

(declare-fun d!146457 () Bool)

(assert (=> d!146457 (= (isEmpty!1130 (unapply!67 l!3677)) (not ((_ is Some!802) (unapply!67 l!3677))))))

(assert (=> start!115378 d!146457))

(declare-fun d!146461 () Bool)

(assert (=> d!146461 (= (unapply!67 l!3677) (ite ((_ is Nil!31910) l!3677) None!801 (Some!802 (tuple2!24487 (h!33118 l!3677) (t!46599 l!3677)))))))

(assert (=> start!115378 d!146461))

(check-sat (not b!1364675) (not b!1364676))
(check-sat)
