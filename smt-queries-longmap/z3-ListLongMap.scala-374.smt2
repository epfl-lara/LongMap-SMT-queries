; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7108 () Bool)

(assert start!7108)

(declare-fun b!45456 () Bool)

(declare-fun e!28939 () Bool)

(declare-fun tp_is_empty!1921 () Bool)

(declare-fun tp!5975 () Bool)

(assert (=> b!45456 (= e!28939 (and tp_is_empty!1921 tp!5975))))

(declare-fun b!45455 () Bool)

(declare-fun e!28938 () Bool)

(assert (=> b!45455 (= e!28938 (not true))))

(declare-datatypes ((B!824 0))(
  ( (B!825 (val!999 Int)) )
))
(declare-datatypes ((tuple2!1628 0))(
  ( (tuple2!1629 (_1!825 (_ BitVec 64)) (_2!825 B!824)) )
))
(declare-datatypes ((List!1203 0))(
  ( (Nil!1200) (Cons!1199 (h!1779 tuple2!1628) (t!4228 List!1203)) )
))
(declare-fun l!812 () List!1203)

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun removeStrictlySorted!23 (List!1203 (_ BitVec 64)) List!1203)

(assert (=> b!45455 (= (removeStrictlySorted!23 (removeStrictlySorted!23 (t!4228 l!812) key1!43) key2!27) (removeStrictlySorted!23 (removeStrictlySorted!23 (t!4228 l!812) key2!27) key1!43))))

(declare-datatypes ((Unit!1308 0))(
  ( (Unit!1309) )
))
(declare-fun lt!20121 () Unit!1308)

(declare-fun lemmaRemoveStrictlySortedCommutative!4 (List!1203 (_ BitVec 64) (_ BitVec 64)) Unit!1308)

(assert (=> b!45455 (= lt!20121 (lemmaRemoveStrictlySortedCommutative!4 (t!4228 l!812) key1!43 key2!27))))

(declare-fun res!26665 () Bool)

(assert (=> start!7108 (=> (not res!26665) (not e!28938))))

(declare-fun isStrictlySorted!202 (List!1203) Bool)

(assert (=> start!7108 (= res!26665 (isStrictlySorted!202 l!812))))

(assert (=> start!7108 e!28938))

(assert (=> start!7108 e!28939))

(assert (=> start!7108 true))

(declare-fun b!45454 () Bool)

(declare-fun res!26666 () Bool)

(assert (=> b!45454 (=> (not res!26666) (not e!28938))))

(assert (=> b!45454 (= res!26666 (isStrictlySorted!202 (t!4228 l!812)))))

(declare-fun b!45453 () Bool)

(declare-fun res!26664 () Bool)

(assert (=> b!45453 (=> (not res!26664) (not e!28938))))

(get-info :version)

(assert (=> b!45453 (= res!26664 ((_ is Cons!1199) l!812))))

(assert (= (and start!7108 res!26665) b!45453))

(assert (= (and b!45453 res!26664) b!45454))

(assert (= (and b!45454 res!26666) b!45455))

(assert (= (and start!7108 ((_ is Cons!1199) l!812)) b!45456))

(declare-fun m!39923 () Bool)

(assert (=> b!45455 m!39923))

(declare-fun m!39925 () Bool)

(assert (=> b!45455 m!39925))

(declare-fun m!39927 () Bool)

(assert (=> b!45455 m!39927))

(assert (=> b!45455 m!39925))

(assert (=> b!45455 m!39923))

(declare-fun m!39929 () Bool)

(assert (=> b!45455 m!39929))

(declare-fun m!39931 () Bool)

(assert (=> b!45455 m!39931))

(declare-fun m!39933 () Bool)

(assert (=> start!7108 m!39933))

(declare-fun m!39935 () Bool)

(assert (=> b!45454 m!39935))

(check-sat (not start!7108) tp_is_empty!1921 (not b!45455) (not b!45454) (not b!45456))
(check-sat)
