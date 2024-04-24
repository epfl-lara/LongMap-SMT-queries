; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115570 () Bool)

(assert start!115570)

(declare-fun res!908744 () Bool)

(declare-fun e!774784 () Bool)

(assert (=> start!115570 (=> (not res!908744) (not e!774784))))

(declare-datatypes ((List!31894 0))(
  ( (Nil!31891) (Cons!31890 (h!33108 (_ BitVec 64)) (t!46580 List!31894)) )
))
(declare-fun l!3677 () List!31894)

(declare-datatypes ((tuple2!24456 0))(
  ( (tuple2!24457 (_1!12239 (_ BitVec 64)) (_2!12239 List!31894)) )
))
(declare-datatypes ((Option!790 0))(
  ( (Some!789 (v!21589 tuple2!24456)) (None!788) )
))
(declare-fun isEmpty!1122 (Option!790) Bool)

(declare-fun unapply!61 (List!31894) Option!790)

(assert (=> start!115570 (= res!908744 (isEmpty!1122 (unapply!61 l!3677)))))

(assert (=> start!115570 e!774784))

(assert (=> start!115570 true))

(declare-fun b!1365951 () Bool)

(declare-fun res!908745 () Bool)

(assert (=> b!1365951 (=> (not res!908745) (not e!774784))))

(get-info :version)

(assert (=> b!1365951 (= res!908745 ((_ is Nil!31891) l!3677))))

(declare-fun b!1365952 () Bool)

(declare-fun subseq!944 (List!31894 List!31894) Bool)

(assert (=> b!1365952 (= e!774784 (not (subseq!944 l!3677 l!3677)))))

(assert (= (and start!115570 res!908744) b!1365951))

(assert (= (and b!1365951 res!908745) b!1365952))

(declare-fun m!1251037 () Bool)

(assert (=> start!115570 m!1251037))

(assert (=> start!115570 m!1251037))

(declare-fun m!1251039 () Bool)

(assert (=> start!115570 m!1251039))

(declare-fun m!1251041 () Bool)

(assert (=> b!1365952 m!1251041))

(check-sat (not start!115570) (not b!1365952))
(check-sat)
(get-model)

(declare-fun d!146989 () Bool)

(assert (=> d!146989 (= (isEmpty!1122 (unapply!61 l!3677)) (not ((_ is Some!789) (unapply!61 l!3677))))))

(assert (=> start!115570 d!146989))

(declare-fun d!146995 () Bool)

(assert (=> d!146995 (= (unapply!61 l!3677) (ite ((_ is Nil!31891) l!3677) None!788 (Some!789 (tuple2!24457 (h!33108 l!3677) (t!46580 l!3677)))))))

(assert (=> start!115570 d!146995))

(declare-fun b!1365994 () Bool)

(declare-fun e!774821 () Bool)

(declare-fun e!774822 () Bool)

(assert (=> b!1365994 (= e!774821 e!774822)))

(declare-fun res!908789 () Bool)

(assert (=> b!1365994 (=> res!908789 e!774822)))

(declare-fun e!774819 () Bool)

(assert (=> b!1365994 (= res!908789 e!774819)))

(declare-fun res!908788 () Bool)

(assert (=> b!1365994 (=> (not res!908788) (not e!774819))))

(assert (=> b!1365994 (= res!908788 (= (h!33108 l!3677) (h!33108 l!3677)))))

(declare-fun b!1365993 () Bool)

(declare-fun e!774820 () Bool)

(assert (=> b!1365993 (= e!774820 e!774821)))

(declare-fun res!908786 () Bool)

(assert (=> b!1365993 (=> (not res!908786) (not e!774821))))

(assert (=> b!1365993 (= res!908786 ((_ is Cons!31890) l!3677))))

(declare-fun b!1365995 () Bool)

(assert (=> b!1365995 (= e!774819 (subseq!944 (t!46580 l!3677) (t!46580 l!3677)))))

(declare-fun b!1365996 () Bool)

(assert (=> b!1365996 (= e!774822 (subseq!944 l!3677 (t!46580 l!3677)))))

(declare-fun d!146999 () Bool)

(declare-fun res!908787 () Bool)

(assert (=> d!146999 (=> res!908787 e!774820)))

(assert (=> d!146999 (= res!908787 ((_ is Nil!31891) l!3677))))

(assert (=> d!146999 (= (subseq!944 l!3677 l!3677) e!774820)))

(assert (= (and d!146999 (not res!908787)) b!1365993))

(assert (= (and b!1365993 res!908786) b!1365994))

(assert (= (and b!1365994 res!908788) b!1365995))

(assert (= (and b!1365994 (not res!908789)) b!1365996))

(declare-fun m!1251059 () Bool)

(assert (=> b!1365995 m!1251059))

(declare-fun m!1251061 () Bool)

(assert (=> b!1365996 m!1251061))

(assert (=> b!1365952 d!146999))

(check-sat (not b!1365996) (not b!1365995))
(check-sat)
