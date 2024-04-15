; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7134 () Bool)

(assert start!7134)

(declare-fun res!26775 () Bool)

(declare-fun e!29071 () Bool)

(assert (=> start!7134 (=> (not res!26775) (not e!29071))))

(declare-datatypes ((B!836 0))(
  ( (B!837 (val!1005 Int)) )
))
(declare-datatypes ((tuple2!1662 0))(
  ( (tuple2!1663 (_1!842 (_ BitVec 64)) (_2!842 B!836)) )
))
(declare-datatypes ((List!1216 0))(
  ( (Nil!1213) (Cons!1212 (h!1792 tuple2!1662) (t!4240 List!1216)) )
))
(declare-fun l!812 () List!1216)

(declare-fun isStrictlySorted!215 (List!1216) Bool)

(assert (=> start!7134 (= res!26775 (isStrictlySorted!215 l!812))))

(assert (=> start!7134 e!29071))

(declare-fun e!29070 () Bool)

(assert (=> start!7134 e!29070))

(assert (=> start!7134 true))

(declare-fun b!45669 () Bool)

(declare-fun tp_is_empty!1933 () Bool)

(declare-fun tp!6002 () Bool)

(assert (=> b!45669 (= e!29070 (and tp_is_empty!1933 tp!6002))))

(declare-fun b!45668 () Bool)

(assert (=> b!45668 (= e!29071 (not true))))

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun removeStrictlySorted!30 (List!1216 (_ BitVec 64)) List!1216)

(assert (=> b!45668 (= (removeStrictlySorted!30 (removeStrictlySorted!30 (t!4240 l!812) key1!43) key2!27) (removeStrictlySorted!30 (removeStrictlySorted!30 (t!4240 l!812) key2!27) key1!43))))

(declare-datatypes ((Unit!1314 0))(
  ( (Unit!1315) )
))
(declare-fun lt!20196 () Unit!1314)

(declare-fun lemmaRemoveStrictlySortedCommutative!10 (List!1216 (_ BitVec 64) (_ BitVec 64)) Unit!1314)

(assert (=> b!45668 (= lt!20196 (lemmaRemoveStrictlySortedCommutative!10 (t!4240 l!812) key1!43 key2!27))))

(declare-fun b!45667 () Bool)

(declare-fun res!26774 () Bool)

(assert (=> b!45667 (=> (not res!26774) (not e!29071))))

(assert (=> b!45667 (= res!26774 (isStrictlySorted!215 (t!4240 l!812)))))

(declare-fun b!45666 () Bool)

(declare-fun res!26776 () Bool)

(assert (=> b!45666 (=> (not res!26776) (not e!29071))))

(get-info :version)

(assert (=> b!45666 (= res!26776 ((_ is Cons!1212) l!812))))

(assert (= (and start!7134 res!26775) b!45666))

(assert (= (and b!45666 res!26776) b!45667))

(assert (= (and b!45667 res!26774) b!45668))

(assert (= (and start!7134 ((_ is Cons!1212) l!812)) b!45669))

(declare-fun m!40205 () Bool)

(assert (=> start!7134 m!40205))

(declare-fun m!40207 () Bool)

(assert (=> b!45668 m!40207))

(declare-fun m!40209 () Bool)

(assert (=> b!45668 m!40209))

(declare-fun m!40211 () Bool)

(assert (=> b!45668 m!40211))

(assert (=> b!45668 m!40209))

(assert (=> b!45668 m!40207))

(declare-fun m!40213 () Bool)

(assert (=> b!45668 m!40213))

(declare-fun m!40215 () Bool)

(assert (=> b!45668 m!40215))

(declare-fun m!40217 () Bool)

(assert (=> b!45667 m!40217))

(check-sat tp_is_empty!1933 (not b!45669) (not b!45668) (not b!45667) (not start!7134))
(check-sat)
