; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132868 () Bool)

(assert start!132868)

(declare-fun res!1064616 () Bool)

(declare-fun e!866650 () Bool)

(assert (=> start!132868 (=> (not res!1064616) (not e!866650))))

(declare-datatypes ((B!2338 0))(
  ( (B!2339 (val!19255 Int)) )
))
(declare-datatypes ((tuple2!24886 0))(
  ( (tuple2!24887 (_1!12454 (_ BitVec 64)) (_2!12454 B!2338)) )
))
(declare-datatypes ((List!36289 0))(
  ( (Nil!36286) (Cons!36285 (h!37731 tuple2!24886) (t!51010 List!36289)) )
))
(declare-fun l!1177 () List!36289)

(declare-fun isStrictlySorted!942 (List!36289) Bool)

(assert (=> start!132868 (= res!1064616 (isStrictlySorted!942 l!1177))))

(assert (=> start!132868 e!866650))

(declare-fun e!866651 () Bool)

(assert (=> start!132868 e!866651))

(assert (=> start!132868 true))

(declare-fun b!1556100 () Bool)

(declare-fun res!1064617 () Bool)

(assert (=> b!1556100 (=> (not res!1064617) (not e!866650))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1556100 (= res!1064617 (and (not (= newKey!105 otherKey!50)) ((_ is Cons!36285) l!1177) (not (= (_1!12454 (h!37731 l!1177)) otherKey!50))))))

(declare-fun b!1556101 () Bool)

(assert (=> b!1556101 (= e!866650 (not (isStrictlySorted!942 (t!51010 l!1177))))))

(declare-fun b!1556102 () Bool)

(declare-fun tp_is_empty!38349 () Bool)

(declare-fun tp!112392 () Bool)

(assert (=> b!1556102 (= e!866651 (and tp_is_empty!38349 tp!112392))))

(assert (= (and start!132868 res!1064616) b!1556100))

(assert (= (and b!1556100 res!1064617) b!1556101))

(assert (= (and start!132868 ((_ is Cons!36285) l!1177)) b!1556102))

(declare-fun m!1433779 () Bool)

(assert (=> start!132868 m!1433779))

(declare-fun m!1433781 () Bool)

(assert (=> b!1556101 m!1433781))

(check-sat (not b!1556101) (not start!132868) (not b!1556102) tp_is_empty!38349)
(check-sat)
(get-model)

(declare-fun d!162063 () Bool)

(declare-fun res!1064628 () Bool)

(declare-fun e!866662 () Bool)

(assert (=> d!162063 (=> res!1064628 e!866662)))

(assert (=> d!162063 (= res!1064628 (or ((_ is Nil!36286) (t!51010 l!1177)) ((_ is Nil!36286) (t!51010 (t!51010 l!1177)))))))

(assert (=> d!162063 (= (isStrictlySorted!942 (t!51010 l!1177)) e!866662)))

(declare-fun b!1556116 () Bool)

(declare-fun e!866663 () Bool)

(assert (=> b!1556116 (= e!866662 e!866663)))

(declare-fun res!1064629 () Bool)

(assert (=> b!1556116 (=> (not res!1064629) (not e!866663))))

(assert (=> b!1556116 (= res!1064629 (bvslt (_1!12454 (h!37731 (t!51010 l!1177))) (_1!12454 (h!37731 (t!51010 (t!51010 l!1177))))))))

(declare-fun b!1556117 () Bool)

(assert (=> b!1556117 (= e!866663 (isStrictlySorted!942 (t!51010 (t!51010 l!1177))))))

(assert (= (and d!162063 (not res!1064628)) b!1556116))

(assert (= (and b!1556116 res!1064629) b!1556117))

(declare-fun m!1433787 () Bool)

(assert (=> b!1556117 m!1433787))

(assert (=> b!1556101 d!162063))

(declare-fun d!162069 () Bool)

(declare-fun res!1064630 () Bool)

(declare-fun e!866664 () Bool)

(assert (=> d!162069 (=> res!1064630 e!866664)))

(assert (=> d!162069 (= res!1064630 (or ((_ is Nil!36286) l!1177) ((_ is Nil!36286) (t!51010 l!1177))))))

(assert (=> d!162069 (= (isStrictlySorted!942 l!1177) e!866664)))

(declare-fun b!1556118 () Bool)

(declare-fun e!866665 () Bool)

(assert (=> b!1556118 (= e!866664 e!866665)))

(declare-fun res!1064631 () Bool)

(assert (=> b!1556118 (=> (not res!1064631) (not e!866665))))

(assert (=> b!1556118 (= res!1064631 (bvslt (_1!12454 (h!37731 l!1177)) (_1!12454 (h!37731 (t!51010 l!1177)))))))

(declare-fun b!1556119 () Bool)

(assert (=> b!1556119 (= e!866665 (isStrictlySorted!942 (t!51010 l!1177)))))

(assert (= (and d!162069 (not res!1064630)) b!1556118))

(assert (= (and b!1556118 res!1064631) b!1556119))

(assert (=> b!1556119 m!1433781))

(assert (=> start!132868 d!162069))

(declare-fun b!1556128 () Bool)

(declare-fun e!866672 () Bool)

(declare-fun tp!112398 () Bool)

(assert (=> b!1556128 (= e!866672 (and tp_is_empty!38349 tp!112398))))

(assert (=> b!1556102 (= tp!112392 e!866672)))

(assert (= (and b!1556102 ((_ is Cons!36285) (t!51010 l!1177))) b!1556128))

(check-sat (not b!1556117) (not b!1556119) (not b!1556128) tp_is_empty!38349)
(check-sat)
