; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132736 () Bool)

(assert start!132736)

(declare-fun b!1555204 () Bool)

(declare-fun res!1064179 () Bool)

(declare-fun e!866057 () Bool)

(assert (=> b!1555204 (=> (not res!1064179) (not e!866057))))

(declare-datatypes ((B!2278 0))(
  ( (B!2279 (val!19225 Int)) )
))
(declare-datatypes ((tuple2!24826 0))(
  ( (tuple2!24827 (_1!12424 (_ BitVec 64)) (_2!12424 B!2278)) )
))
(declare-datatypes ((List!36259 0))(
  ( (Nil!36256) (Cons!36255 (h!37701 tuple2!24826) (t!50980 List!36259)) )
))
(declare-fun l!1177 () List!36259)

(declare-fun isStrictlySorted!918 (List!36259) Bool)

(assert (=> b!1555204 (= res!1064179 (isStrictlySorted!918 (t!50980 l!1177)))))

(declare-fun b!1555205 () Bool)

(assert (=> b!1555205 (= e!866057 (not true))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-fun newValue!105 () B!2278)

(declare-fun lt!670240 () Bool)

(declare-fun containsKey!789 (List!36259 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!529 (List!36259 (_ BitVec 64) B!2278) List!36259)

(assert (=> b!1555205 (= lt!670240 (containsKey!789 (insertStrictlySorted!529 l!1177 newKey!105 newValue!105) otherKey!50))))

(declare-fun e!866055 () Bool)

(assert (=> b!1555205 e!866055))

(declare-fun res!1064178 () Bool)

(assert (=> b!1555205 (=> (not res!1064178) (not e!866055))))

(declare-fun lt!670241 () List!36259)

(assert (=> b!1555205 (= res!1064178 (= (containsKey!789 lt!670241 otherKey!50) (containsKey!789 (t!50980 l!1177) otherKey!50)))))

(assert (=> b!1555205 (= lt!670241 (insertStrictlySorted!529 (t!50980 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51822 0))(
  ( (Unit!51823) )
))
(declare-fun lt!670239 () Unit!51822)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!26 (List!36259 (_ BitVec 64) B!2278 (_ BitVec 64)) Unit!51822)

(assert (=> b!1555205 (= lt!670239 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!26 (t!50980 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1555206 () Bool)

(declare-datatypes ((Option!843 0))(
  ( (Some!842 (v!22027 B!2278)) (None!841) )
))
(declare-fun getValueByKey!767 (List!36259 (_ BitVec 64)) Option!843)

(assert (=> b!1555206 (= e!866055 (= (getValueByKey!767 lt!670241 otherKey!50) (getValueByKey!767 (t!50980 l!1177) otherKey!50)))))

(declare-fun b!1555207 () Bool)

(declare-fun e!866056 () Bool)

(declare-fun tp_is_empty!38289 () Bool)

(declare-fun tp!112266 () Bool)

(assert (=> b!1555207 (= e!866056 (and tp_is_empty!38289 tp!112266))))

(declare-fun b!1555208 () Bool)

(declare-fun res!1064177 () Bool)

(assert (=> b!1555208 (=> (not res!1064177) (not e!866057))))

(get-info :version)

(assert (=> b!1555208 (= res!1064177 (and (not (= newKey!105 otherKey!50)) ((_ is Cons!36255) l!1177) (not (= (_1!12424 (h!37701 l!1177)) otherKey!50))))))

(declare-fun res!1064176 () Bool)

(assert (=> start!132736 (=> (not res!1064176) (not e!866057))))

(assert (=> start!132736 (= res!1064176 (isStrictlySorted!918 l!1177))))

(assert (=> start!132736 e!866057))

(assert (=> start!132736 e!866056))

(assert (=> start!132736 true))

(assert (=> start!132736 tp_is_empty!38289))

(assert (= (and start!132736 res!1064176) b!1555208))

(assert (= (and b!1555208 res!1064177) b!1555204))

(assert (= (and b!1555204 res!1064179) b!1555205))

(assert (= (and b!1555205 res!1064178) b!1555206))

(assert (= (and start!132736 ((_ is Cons!36255) l!1177)) b!1555207))

(declare-fun m!1433285 () Bool)

(assert (=> b!1555204 m!1433285))

(declare-fun m!1433287 () Bool)

(assert (=> b!1555205 m!1433287))

(declare-fun m!1433289 () Bool)

(assert (=> b!1555205 m!1433289))

(declare-fun m!1433291 () Bool)

(assert (=> b!1555205 m!1433291))

(declare-fun m!1433293 () Bool)

(assert (=> b!1555205 m!1433293))

(declare-fun m!1433295 () Bool)

(assert (=> b!1555205 m!1433295))

(assert (=> b!1555205 m!1433289))

(declare-fun m!1433297 () Bool)

(assert (=> b!1555205 m!1433297))

(declare-fun m!1433299 () Bool)

(assert (=> b!1555206 m!1433299))

(declare-fun m!1433301 () Bool)

(assert (=> b!1555206 m!1433301))

(declare-fun m!1433303 () Bool)

(assert (=> start!132736 m!1433303))

(check-sat tp_is_empty!38289 (not start!132736) (not b!1555207) (not b!1555204) (not b!1555206) (not b!1555205))
(check-sat)
