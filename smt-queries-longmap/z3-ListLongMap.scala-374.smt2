; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7104 () Bool)

(assert start!7104)

(declare-fun res!26671 () Bool)

(declare-fun e!28932 () Bool)

(assert (=> start!7104 (=> (not res!26671) (not e!28932))))

(declare-datatypes ((B!824 0))(
  ( (B!825 (val!999 Int)) )
))
(declare-datatypes ((tuple2!1650 0))(
  ( (tuple2!1651 (_1!836 (_ BitVec 64)) (_2!836 B!824)) )
))
(declare-datatypes ((List!1210 0))(
  ( (Nil!1207) (Cons!1206 (h!1786 tuple2!1650) (t!4234 List!1210)) )
))
(declare-fun l!812 () List!1210)

(declare-fun isStrictlySorted!209 (List!1210) Bool)

(assert (=> start!7104 (= res!26671 (isStrictlySorted!209 l!812))))

(assert (=> start!7104 e!28932))

(declare-fun e!28933 () Bool)

(assert (=> start!7104 e!28933))

(assert (=> start!7104 true))

(declare-fun b!45445 () Bool)

(declare-fun res!26670 () Bool)

(assert (=> b!45445 (=> (not res!26670) (not e!28932))))

(assert (=> b!45445 (= res!26670 (isStrictlySorted!209 (t!4234 l!812)))))

(declare-fun b!45446 () Bool)

(assert (=> b!45446 (= e!28932 (not true))))

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun removeStrictlySorted!24 (List!1210 (_ BitVec 64)) List!1210)

(assert (=> b!45446 (= (removeStrictlySorted!24 (removeStrictlySorted!24 (t!4234 l!812) key1!43) key2!27) (removeStrictlySorted!24 (removeStrictlySorted!24 (t!4234 l!812) key2!27) key1!43))))

(declare-datatypes ((Unit!1302 0))(
  ( (Unit!1303) )
))
(declare-fun lt!20148 () Unit!1302)

(declare-fun lemmaRemoveStrictlySortedCommutative!4 (List!1210 (_ BitVec 64) (_ BitVec 64)) Unit!1302)

(assert (=> b!45446 (= lt!20148 (lemmaRemoveStrictlySortedCommutative!4 (t!4234 l!812) key1!43 key2!27))))

(declare-fun b!45444 () Bool)

(declare-fun res!26669 () Bool)

(assert (=> b!45444 (=> (not res!26669) (not e!28932))))

(get-info :version)

(assert (=> b!45444 (= res!26669 ((_ is Cons!1206) l!812))))

(declare-fun b!45447 () Bool)

(declare-fun tp_is_empty!1921 () Bool)

(declare-fun tp!5975 () Bool)

(assert (=> b!45447 (= e!28933 (and tp_is_empty!1921 tp!5975))))

(assert (= (and start!7104 res!26671) b!45444))

(assert (= (and b!45444 res!26669) b!45445))

(assert (= (and b!45445 res!26670) b!45446))

(assert (= (and start!7104 ((_ is Cons!1206) l!812)) b!45447))

(declare-fun m!39965 () Bool)

(assert (=> start!7104 m!39965))

(declare-fun m!39967 () Bool)

(assert (=> b!45445 m!39967))

(declare-fun m!39969 () Bool)

(assert (=> b!45446 m!39969))

(declare-fun m!39971 () Bool)

(assert (=> b!45446 m!39971))

(declare-fun m!39973 () Bool)

(assert (=> b!45446 m!39973))

(assert (=> b!45446 m!39971))

(assert (=> b!45446 m!39969))

(declare-fun m!39975 () Bool)

(assert (=> b!45446 m!39975))

(declare-fun m!39977 () Bool)

(assert (=> b!45446 m!39977))

(check-sat (not start!7104) tp_is_empty!1921 (not b!45447) (not b!45446) (not b!45445))
(check-sat)
