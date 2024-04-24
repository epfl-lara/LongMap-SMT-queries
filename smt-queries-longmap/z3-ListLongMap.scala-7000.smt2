; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89128 () Bool)

(assert start!89128)

(declare-fun b!1021502 () Bool)

(declare-fun e!575047 () Bool)

(declare-fun tp_is_empty!23773 () Bool)

(declare-fun tp!71209 () Bool)

(assert (=> b!1021502 (= e!575047 (and tp_is_empty!23773 tp!71209))))

(declare-fun b!1021503 () Bool)

(declare-fun res!684287 () Bool)

(declare-fun e!575048 () Bool)

(assert (=> b!1021503 (=> (not res!684287) (not e!575048))))

(declare-datatypes ((B!1706 0))(
  ( (B!1707 (val!11937 Int)) )
))
(declare-datatypes ((tuple2!15424 0))(
  ( (tuple2!15425 (_1!7723 (_ BitVec 64)) (_2!7723 B!1706)) )
))
(declare-datatypes ((List!21614 0))(
  ( (Nil!21611) (Cons!21610 (h!22817 tuple2!15424) (t!30616 List!21614)) )
))
(declare-fun l!1367 () List!21614)

(declare-fun lt!450308 () tuple2!15424)

(get-info :version)

(assert (=> b!1021503 (= res!684287 (and ((_ is Cons!21610) l!1367) (not (= (h!22817 l!1367) lt!450308))))))

(declare-fun b!1021504 () Bool)

(declare-fun e!575049 () Bool)

(assert (=> b!1021504 (= e!575049 e!575048)))

(declare-fun res!684286 () Bool)

(assert (=> b!1021504 (=> (not res!684286) (not e!575048))))

(declare-fun contains!5939 (List!21614 tuple2!15424) Bool)

(assert (=> b!1021504 (= res!684286 (contains!5939 l!1367 lt!450308))))

(declare-fun key!393 () (_ BitVec 64))

(declare-fun value!188 () B!1706)

(assert (=> b!1021504 (= lt!450308 (tuple2!15425 key!393 value!188))))

(declare-fun b!1021505 () Bool)

(assert (=> b!1021505 (= e!575048 false)))

(declare-fun lt!450307 () Bool)

(assert (=> b!1021505 (= lt!450307 (contains!5939 (t!30616 l!1367) lt!450308))))

(declare-fun b!1021506 () Bool)

(declare-fun res!684284 () Bool)

(assert (=> b!1021506 (=> (not res!684284) (not e!575048))))

(declare-fun isStrictlySorted!678 (List!21614) Bool)

(assert (=> b!1021506 (= res!684284 (isStrictlySorted!678 (t!30616 l!1367)))))

(declare-fun res!684285 () Bool)

(assert (=> start!89128 (=> (not res!684285) (not e!575049))))

(assert (=> start!89128 (= res!684285 (isStrictlySorted!678 l!1367))))

(assert (=> start!89128 e!575049))

(assert (=> start!89128 e!575047))

(assert (=> start!89128 true))

(assert (=> start!89128 tp_is_empty!23773))

(assert (= (and start!89128 res!684285) b!1021504))

(assert (= (and b!1021504 res!684286) b!1021503))

(assert (= (and b!1021503 res!684287) b!1021506))

(assert (= (and b!1021506 res!684284) b!1021505))

(assert (= (and start!89128 ((_ is Cons!21610) l!1367)) b!1021502))

(declare-fun m!941895 () Bool)

(assert (=> b!1021504 m!941895))

(declare-fun m!941897 () Bool)

(assert (=> b!1021505 m!941897))

(declare-fun m!941899 () Bool)

(assert (=> b!1021506 m!941899))

(declare-fun m!941901 () Bool)

(assert (=> start!89128 m!941901))

(check-sat (not b!1021504) (not b!1021502) (not b!1021505) tp_is_empty!23773 (not b!1021506) (not start!89128))
(check-sat)
