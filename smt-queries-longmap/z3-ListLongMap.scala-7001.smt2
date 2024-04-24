; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89134 () Bool)

(assert start!89134)

(declare-fun b!1021549 () Bool)

(declare-fun res!684322 () Bool)

(declare-fun e!575075 () Bool)

(assert (=> b!1021549 (=> (not res!684322) (not e!575075))))

(declare-datatypes ((B!1712 0))(
  ( (B!1713 (val!11940 Int)) )
))
(declare-datatypes ((tuple2!15430 0))(
  ( (tuple2!15431 (_1!7726 (_ BitVec 64)) (_2!7726 B!1712)) )
))
(declare-datatypes ((List!21617 0))(
  ( (Nil!21614) (Cons!21613 (h!22820 tuple2!15430) (t!30619 List!21617)) )
))
(declare-fun l!1367 () List!21617)

(declare-fun lt!450325 () tuple2!15430)

(declare-fun contains!5942 (List!21617 tuple2!15430) Bool)

(assert (=> b!1021549 (= res!684322 (contains!5942 (t!30619 l!1367) lt!450325))))

(declare-fun b!1021550 () Bool)

(declare-fun res!684323 () Bool)

(assert (=> b!1021550 (=> (not res!684323) (not e!575075))))

(get-info :version)

(assert (=> b!1021550 (= res!684323 (and ((_ is Cons!21613) l!1367) (not (= (h!22820 l!1367) lt!450325))))))

(declare-fun b!1021551 () Bool)

(declare-fun e!575074 () Bool)

(assert (=> b!1021551 (= e!575074 e!575075)))

(declare-fun res!684324 () Bool)

(assert (=> b!1021551 (=> (not res!684324) (not e!575075))))

(assert (=> b!1021551 (= res!684324 (contains!5942 l!1367 lt!450325))))

(declare-fun key!393 () (_ BitVec 64))

(declare-fun value!188 () B!1712)

(assert (=> b!1021551 (= lt!450325 (tuple2!15431 key!393 value!188))))

(declare-fun res!684325 () Bool)

(assert (=> start!89134 (=> (not res!684325) (not e!575074))))

(declare-fun isStrictlySorted!681 (List!21617) Bool)

(assert (=> start!89134 (= res!684325 (isStrictlySorted!681 l!1367))))

(assert (=> start!89134 e!575074))

(declare-fun e!575076 () Bool)

(assert (=> start!89134 e!575076))

(assert (=> start!89134 true))

(declare-fun tp_is_empty!23779 () Bool)

(assert (=> start!89134 tp_is_empty!23779))

(declare-fun b!1021552 () Bool)

(declare-fun res!684326 () Bool)

(assert (=> b!1021552 (=> (not res!684326) (not e!575075))))

(assert (=> b!1021552 (= res!684326 (isStrictlySorted!681 (t!30619 l!1367)))))

(declare-fun b!1021553 () Bool)

(assert (=> b!1021553 (= e!575075 (not true))))

(declare-fun containsKey!552 (List!21617 (_ BitVec 64)) Bool)

(assert (=> b!1021553 (containsKey!552 (t!30619 l!1367) key!393)))

(declare-datatypes ((Unit!33294 0))(
  ( (Unit!33295) )
))
(declare-fun lt!450326 () Unit!33294)

(declare-fun lemmaContainsTupleThenContainsKey!10 (List!21617 (_ BitVec 64) B!1712) Unit!33294)

(assert (=> b!1021553 (= lt!450326 (lemmaContainsTupleThenContainsKey!10 (t!30619 l!1367) key!393 value!188))))

(declare-fun b!1021554 () Bool)

(declare-fun tp!71218 () Bool)

(assert (=> b!1021554 (= e!575076 (and tp_is_empty!23779 tp!71218))))

(assert (= (and start!89134 res!684325) b!1021551))

(assert (= (and b!1021551 res!684324) b!1021550))

(assert (= (and b!1021550 res!684323) b!1021552))

(assert (= (and b!1021552 res!684326) b!1021549))

(assert (= (and b!1021549 res!684322) b!1021553))

(assert (= (and start!89134 ((_ is Cons!21613) l!1367)) b!1021554))

(declare-fun m!941919 () Bool)

(assert (=> b!1021551 m!941919))

(declare-fun m!941921 () Bool)

(assert (=> start!89134 m!941921))

(declare-fun m!941923 () Bool)

(assert (=> b!1021553 m!941923))

(declare-fun m!941925 () Bool)

(assert (=> b!1021553 m!941925))

(declare-fun m!941927 () Bool)

(assert (=> b!1021549 m!941927))

(declare-fun m!941929 () Bool)

(assert (=> b!1021552 m!941929))

(check-sat (not b!1021553) (not b!1021554) (not b!1021549) tp_is_empty!23779 (not start!89134) (not b!1021552) (not b!1021551))
(check-sat)
