; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7134 () Bool)

(assert start!7134)

(declare-fun b!45747 () Bool)

(declare-fun e!29120 () Bool)

(declare-fun tp_is_empty!1935 () Bool)

(declare-fun tp!6005 () Bool)

(assert (=> b!45747 (= e!29120 (and tp_is_empty!1935 tp!6005))))

(declare-fun res!26805 () Bool)

(declare-fun e!29119 () Bool)

(assert (=> start!7134 (=> (not res!26805) (not e!29119))))

(declare-datatypes ((B!838 0))(
  ( (B!839 (val!1006 Int)) )
))
(declare-datatypes ((tuple2!1660 0))(
  ( (tuple2!1661 (_1!841 (_ BitVec 64)) (_2!841 B!838)) )
))
(declare-datatypes ((List!1224 0))(
  ( (Nil!1221) (Cons!1220 (h!1800 tuple2!1660) (t!4249 List!1224)) )
))
(declare-fun l!812 () List!1224)

(declare-fun isStrictlySorted!221 (List!1224) Bool)

(assert (=> start!7134 (= res!26805 (isStrictlySorted!221 l!812))))

(assert (=> start!7134 e!29119))

(assert (=> start!7134 e!29120))

(assert (=> start!7134 true))

(declare-fun b!45746 () Bool)

(assert (=> b!45746 (= e!29119 (not true))))

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun removeStrictlySorted!31 (List!1224 (_ BitVec 64)) List!1224)

(assert (=> b!45746 (= (removeStrictlySorted!31 (removeStrictlySorted!31 (t!4249 l!812) key1!43) key2!27) (removeStrictlySorted!31 (removeStrictlySorted!31 (t!4249 l!812) key2!27) key1!43))))

(declare-datatypes ((Unit!1311 0))(
  ( (Unit!1312) )
))
(declare-fun lt!20215 () Unit!1311)

(declare-fun lemmaRemoveStrictlySortedCommutative!11 (List!1224 (_ BitVec 64) (_ BitVec 64)) Unit!1311)

(assert (=> b!45746 (= lt!20215 (lemmaRemoveStrictlySortedCommutative!11 (t!4249 l!812) key1!43 key2!27))))

(declare-fun b!45745 () Bool)

(declare-fun res!26804 () Bool)

(assert (=> b!45745 (=> (not res!26804) (not e!29119))))

(assert (=> b!45745 (= res!26804 (isStrictlySorted!221 (t!4249 l!812)))))

(declare-fun b!45744 () Bool)

(declare-fun res!26803 () Bool)

(assert (=> b!45744 (=> (not res!26803) (not e!29119))))

(get-info :version)

(assert (=> b!45744 (= res!26803 ((_ is Cons!1220) l!812))))

(assert (= (and start!7134 res!26805) b!45744))

(assert (= (and b!45744 res!26803) b!45745))

(assert (= (and b!45745 res!26804) b!45746))

(assert (= (and start!7134 ((_ is Cons!1220) l!812)) b!45747))

(declare-fun m!40301 () Bool)

(assert (=> start!7134 m!40301))

(declare-fun m!40303 () Bool)

(assert (=> b!45746 m!40303))

(declare-fun m!40305 () Bool)

(assert (=> b!45746 m!40305))

(declare-fun m!40307 () Bool)

(assert (=> b!45746 m!40307))

(assert (=> b!45746 m!40305))

(assert (=> b!45746 m!40303))

(declare-fun m!40309 () Bool)

(assert (=> b!45746 m!40309))

(declare-fun m!40311 () Bool)

(assert (=> b!45746 m!40311))

(declare-fun m!40313 () Bool)

(assert (=> b!45745 m!40313))

(check-sat (not b!45745) (not start!7134) (not b!45747) (not b!45746) tp_is_empty!1935)
(check-sat)
