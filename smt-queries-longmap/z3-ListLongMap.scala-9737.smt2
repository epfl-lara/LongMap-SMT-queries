; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115612 () Bool)

(assert start!115612)

(declare-fun res!908807 () Bool)

(declare-fun e!774838 () Bool)

(assert (=> start!115612 (=> (not res!908807) (not e!774838))))

(declare-datatypes ((List!31900 0))(
  ( (Nil!31897) (Cons!31896 (h!33114 (_ BitVec 64)) (t!46586 List!31900)) )
))
(declare-fun l!3677 () List!31900)

(declare-datatypes ((tuple2!24468 0))(
  ( (tuple2!24469 (_1!12245 (_ BitVec 64)) (_2!12245 List!31900)) )
))
(declare-datatypes ((Option!796 0))(
  ( (Some!795 (v!21595 tuple2!24468)) (None!794) )
))
(declare-fun isEmpty!1128 (Option!796) Bool)

(declare-fun unapply!67 (List!31900) Option!796)

(assert (=> start!115612 (= res!908807 (isEmpty!1128 (unapply!67 l!3677)))))

(assert (=> start!115612 e!774838))

(assert (=> start!115612 true))

(declare-fun b!1366014 () Bool)

(declare-fun res!908808 () Bool)

(assert (=> b!1366014 (=> (not res!908808) (not e!774838))))

(get-info :version)

(assert (=> b!1366014 (= res!908808 (not ((_ is Nil!31897) l!3677)))))

(declare-fun b!1366015 () Bool)

(declare-fun subseq!947 (List!31900 List!31900) Bool)

(assert (=> b!1366015 (= e!774838 (not (subseq!947 l!3677 l!3677)))))

(assert (= (and start!115612 res!908807) b!1366014))

(assert (= (and b!1366014 res!908808) b!1366015))

(declare-fun m!1251079 () Bool)

(assert (=> start!115612 m!1251079))

(assert (=> start!115612 m!1251079))

(declare-fun m!1251081 () Bool)

(assert (=> start!115612 m!1251081))

(declare-fun m!1251083 () Bool)

(assert (=> b!1366015 m!1251083))

(check-sat (not b!1366015) (not start!115612))
(check-sat)
(get-model)

(declare-fun b!1366048 () Bool)

(declare-fun e!774865 () Bool)

(declare-fun e!774867 () Bool)

(assert (=> b!1366048 (= e!774865 e!774867)))

(declare-fun res!908842 () Bool)

(assert (=> b!1366048 (=> (not res!908842) (not e!774867))))

(assert (=> b!1366048 (= res!908842 ((_ is Cons!31896) l!3677))))

(declare-fun b!1366049 () Bool)

(declare-fun e!774866 () Bool)

(assert (=> b!1366049 (= e!774867 e!774866)))

(declare-fun res!908844 () Bool)

(assert (=> b!1366049 (=> res!908844 e!774866)))

(declare-fun e!774868 () Bool)

(assert (=> b!1366049 (= res!908844 e!774868)))

(declare-fun res!908843 () Bool)

(assert (=> b!1366049 (=> (not res!908843) (not e!774868))))

(assert (=> b!1366049 (= res!908843 (= (h!33114 l!3677) (h!33114 l!3677)))))

(declare-fun b!1366050 () Bool)

(assert (=> b!1366050 (= e!774868 (subseq!947 (t!46586 l!3677) (t!46586 l!3677)))))

(declare-fun b!1366051 () Bool)

(assert (=> b!1366051 (= e!774866 (subseq!947 l!3677 (t!46586 l!3677)))))

(declare-fun d!147025 () Bool)

(declare-fun res!908841 () Bool)

(assert (=> d!147025 (=> res!908841 e!774865)))

(assert (=> d!147025 (= res!908841 ((_ is Nil!31897) l!3677))))

(assert (=> d!147025 (= (subseq!947 l!3677 l!3677) e!774865)))

(assert (= (and d!147025 (not res!908841)) b!1366048))

(assert (= (and b!1366048 res!908842) b!1366049))

(assert (= (and b!1366049 res!908843) b!1366050))

(assert (= (and b!1366049 (not res!908844)) b!1366051))

(declare-fun m!1251099 () Bool)

(assert (=> b!1366050 m!1251099))

(declare-fun m!1251103 () Bool)

(assert (=> b!1366051 m!1251103))

(assert (=> b!1366015 d!147025))

(declare-fun d!147035 () Bool)

(assert (=> d!147035 (= (isEmpty!1128 (unapply!67 l!3677)) (not ((_ is Some!795) (unapply!67 l!3677))))))

(assert (=> start!115612 d!147035))

(declare-fun d!147039 () Bool)

(assert (=> d!147039 (= (unapply!67 l!3677) (ite ((_ is Nil!31897) l!3677) None!794 (Some!795 (tuple2!24469 (h!33114 l!3677) (t!46586 l!3677)))))))

(assert (=> start!115612 d!147039))

(check-sat (not b!1366050) (not b!1366051))
(check-sat)
