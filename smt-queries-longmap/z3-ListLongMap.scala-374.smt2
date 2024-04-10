; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7104 () Bool)

(assert start!7104)

(declare-fun b!45523 () Bool)

(declare-fun res!26699 () Bool)

(declare-fun e!28982 () Bool)

(assert (=> b!45523 (=> (not res!26699) (not e!28982))))

(declare-datatypes ((B!826 0))(
  ( (B!827 (val!1000 Int)) )
))
(declare-datatypes ((tuple2!1648 0))(
  ( (tuple2!1649 (_1!835 (_ BitVec 64)) (_2!835 B!826)) )
))
(declare-datatypes ((List!1218 0))(
  ( (Nil!1215) (Cons!1214 (h!1794 tuple2!1648) (t!4243 List!1218)) )
))
(declare-fun l!812 () List!1218)

(declare-fun isStrictlySorted!215 (List!1218) Bool)

(assert (=> b!45523 (= res!26699 (isStrictlySorted!215 (t!4243 l!812)))))

(declare-fun b!45525 () Bool)

(declare-fun e!28981 () Bool)

(declare-fun tp_is_empty!1923 () Bool)

(declare-fun tp!5978 () Bool)

(assert (=> b!45525 (= e!28981 (and tp_is_empty!1923 tp!5978))))

(declare-fun b!45524 () Bool)

(assert (=> b!45524 (= e!28982 (not true))))

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun removeStrictlySorted!25 (List!1218 (_ BitVec 64)) List!1218)

(assert (=> b!45524 (= (removeStrictlySorted!25 (removeStrictlySorted!25 (t!4243 l!812) key1!43) key2!27) (removeStrictlySorted!25 (removeStrictlySorted!25 (t!4243 l!812) key2!27) key1!43))))

(declare-datatypes ((Unit!1299 0))(
  ( (Unit!1300) )
))
(declare-fun lt!20167 () Unit!1299)

(declare-fun lemmaRemoveStrictlySortedCommutative!5 (List!1218 (_ BitVec 64) (_ BitVec 64)) Unit!1299)

(assert (=> b!45524 (= lt!20167 (lemmaRemoveStrictlySortedCommutative!5 (t!4243 l!812) key1!43 key2!27))))

(declare-fun res!26700 () Bool)

(assert (=> start!7104 (=> (not res!26700) (not e!28982))))

(assert (=> start!7104 (= res!26700 (isStrictlySorted!215 l!812))))

(assert (=> start!7104 e!28982))

(assert (=> start!7104 e!28981))

(assert (=> start!7104 true))

(declare-fun b!45522 () Bool)

(declare-fun res!26698 () Bool)

(assert (=> b!45522 (=> (not res!26698) (not e!28982))))

(get-info :version)

(assert (=> b!45522 (= res!26698 ((_ is Cons!1214) l!812))))

(assert (= (and start!7104 res!26700) b!45522))

(assert (= (and b!45522 res!26698) b!45523))

(assert (= (and b!45523 res!26699) b!45524))

(assert (= (and start!7104 ((_ is Cons!1214) l!812)) b!45525))

(declare-fun m!40061 () Bool)

(assert (=> b!45523 m!40061))

(declare-fun m!40063 () Bool)

(assert (=> b!45524 m!40063))

(declare-fun m!40065 () Bool)

(assert (=> b!45524 m!40065))

(declare-fun m!40067 () Bool)

(assert (=> b!45524 m!40067))

(assert (=> b!45524 m!40065))

(assert (=> b!45524 m!40063))

(declare-fun m!40069 () Bool)

(assert (=> b!45524 m!40069))

(declare-fun m!40071 () Bool)

(assert (=> b!45524 m!40071))

(declare-fun m!40073 () Bool)

(assert (=> start!7104 m!40073))

(check-sat tp_is_empty!1923 (not b!45525) (not b!45524) (not b!45523) (not start!7104))
(check-sat)
