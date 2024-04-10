; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115390 () Bool)

(assert start!115390)

(declare-fun res!908295 () Bool)

(declare-fun e!773998 () Bool)

(assert (=> start!115390 (=> (not res!908295) (not e!773998))))

(declare-datatypes ((List!31861 0))(
  ( (Nil!31858) (Cons!31857 (h!33066 (_ BitVec 64)) (t!46555 List!31861)) )
))
(declare-fun l!3677 () List!31861)

(declare-datatypes ((tuple2!24414 0))(
  ( (tuple2!24415 (_1!12218 (_ BitVec 64)) (_2!12218 List!31861)) )
))
(declare-datatypes ((Option!802 0))(
  ( (Some!801 (v!21601 tuple2!24414)) (None!800) )
))
(declare-fun isEmpty!1126 (Option!802) Bool)

(declare-fun unapply!68 (List!31861) Option!802)

(assert (=> start!115390 (= res!908295 (isEmpty!1126 (unapply!68 l!3677)))))

(assert (=> start!115390 e!773998))

(assert (=> start!115390 true))

(declare-fun b!1364721 () Bool)

(declare-fun res!908296 () Bool)

(assert (=> b!1364721 (=> (not res!908296) (not e!773998))))

(get-info :version)

(assert (=> b!1364721 (= res!908296 (not ((_ is Nil!31858) l!3677)))))

(declare-fun b!1364722 () Bool)

(declare-fun subseq!948 (List!31861 List!31861) Bool)

(assert (=> b!1364722 (= e!773998 (not (subseq!948 l!3677 l!3677)))))

(assert (= (and start!115390 res!908295) b!1364721))

(assert (= (and b!1364721 res!908296) b!1364722))

(declare-fun m!1249489 () Bool)

(assert (=> start!115390 m!1249489))

(assert (=> start!115390 m!1249489))

(declare-fun m!1249491 () Bool)

(assert (=> start!115390 m!1249491))

(declare-fun m!1249493 () Bool)

(assert (=> b!1364722 m!1249493))

(check-sat (not start!115390) (not b!1364722))
(check-sat)
(get-model)

(declare-fun d!146583 () Bool)

(assert (=> d!146583 (= (isEmpty!1126 (unapply!68 l!3677)) (not ((_ is Some!801) (unapply!68 l!3677))))))

(assert (=> start!115390 d!146583))

(declare-fun d!146585 () Bool)

(assert (=> d!146585 (= (unapply!68 l!3677) (ite ((_ is Nil!31858) l!3677) None!800 (Some!801 (tuple2!24415 (h!33066 l!3677) (t!46555 l!3677)))))))

(assert (=> start!115390 d!146585))

(declare-fun b!1364762 () Bool)

(declare-fun e!774035 () Bool)

(declare-fun e!774036 () Bool)

(assert (=> b!1364762 (= e!774035 e!774036)))

(declare-fun res!908335 () Bool)

(assert (=> b!1364762 (=> res!908335 e!774036)))

(declare-fun e!774037 () Bool)

(assert (=> b!1364762 (= res!908335 e!774037)))

(declare-fun res!908337 () Bool)

(assert (=> b!1364762 (=> (not res!908337) (not e!774037))))

(assert (=> b!1364762 (= res!908337 (= (h!33066 l!3677) (h!33066 l!3677)))))

(declare-fun b!1364761 () Bool)

(declare-fun e!774034 () Bool)

(assert (=> b!1364761 (= e!774034 e!774035)))

(declare-fun res!908338 () Bool)

(assert (=> b!1364761 (=> (not res!908338) (not e!774035))))

(assert (=> b!1364761 (= res!908338 ((_ is Cons!31857) l!3677))))

(declare-fun b!1364764 () Bool)

(assert (=> b!1364764 (= e!774036 (subseq!948 l!3677 (t!46555 l!3677)))))

(declare-fun b!1364763 () Bool)

(assert (=> b!1364763 (= e!774037 (subseq!948 (t!46555 l!3677) (t!46555 l!3677)))))

(declare-fun d!146587 () Bool)

(declare-fun res!908336 () Bool)

(assert (=> d!146587 (=> res!908336 e!774034)))

(assert (=> d!146587 (= res!908336 ((_ is Nil!31858) l!3677))))

(assert (=> d!146587 (= (subseq!948 l!3677 l!3677) e!774034)))

(assert (= (and d!146587 (not res!908336)) b!1364761))

(assert (= (and b!1364761 res!908338) b!1364762))

(assert (= (and b!1364762 res!908337) b!1364763))

(assert (= (and b!1364762 (not res!908335)) b!1364764))

(declare-fun m!1249509 () Bool)

(assert (=> b!1364764 m!1249509))

(declare-fun m!1249511 () Bool)

(assert (=> b!1364763 m!1249511))

(assert (=> b!1364722 d!146587))

(check-sat (not b!1364764) (not b!1364763))
(check-sat)
