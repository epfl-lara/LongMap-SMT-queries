; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132732 () Bool)

(assert start!132732)

(declare-fun b!1555174 () Bool)

(declare-fun res!1064153 () Bool)

(declare-fun e!866038 () Bool)

(assert (=> b!1555174 (=> (not res!1064153) (not e!866038))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-datatypes ((B!2274 0))(
  ( (B!2275 (val!19223 Int)) )
))
(declare-datatypes ((tuple2!24822 0))(
  ( (tuple2!24823 (_1!12422 (_ BitVec 64)) (_2!12422 B!2274)) )
))
(declare-datatypes ((List!36257 0))(
  ( (Nil!36254) (Cons!36253 (h!37699 tuple2!24822) (t!50978 List!36257)) )
))
(declare-fun l!1177 () List!36257)

(declare-fun otherKey!50 () (_ BitVec 64))

(assert (=> b!1555174 (= res!1064153 (and (not (= newKey!105 otherKey!50)) (is-Cons!36253 l!1177) (not (= (_1!12422 (h!37699 l!1177)) otherKey!50))))))

(declare-fun b!1555175 () Bool)

(declare-fun res!1064154 () Bool)

(assert (=> b!1555175 (=> (not res!1064154) (not e!866038))))

(declare-fun isStrictlySorted!916 (List!36257) Bool)

(assert (=> b!1555175 (= res!1064154 (isStrictlySorted!916 (t!50978 l!1177)))))

(declare-fun lt!670222 () List!36257)

(declare-fun e!866037 () Bool)

(declare-fun b!1555176 () Bool)

(declare-datatypes ((Option!841 0))(
  ( (Some!840 (v!22025 B!2274)) (None!839) )
))
(declare-fun getValueByKey!765 (List!36257 (_ BitVec 64)) Option!841)

(assert (=> b!1555176 (= e!866037 (= (getValueByKey!765 lt!670222 otherKey!50) (getValueByKey!765 (t!50978 l!1177) otherKey!50)))))

(declare-fun res!1064155 () Bool)

(assert (=> start!132732 (=> (not res!1064155) (not e!866038))))

(assert (=> start!132732 (= res!1064155 (isStrictlySorted!916 l!1177))))

(assert (=> start!132732 e!866038))

(declare-fun e!866039 () Bool)

(assert (=> start!132732 e!866039))

(assert (=> start!132732 true))

(declare-fun tp_is_empty!38285 () Bool)

(assert (=> start!132732 tp_is_empty!38285))

(declare-fun b!1555177 () Bool)

(declare-fun tp!112260 () Bool)

(assert (=> b!1555177 (= e!866039 (and tp_is_empty!38285 tp!112260))))

(declare-fun b!1555178 () Bool)

(assert (=> b!1555178 (= e!866038 (not true))))

(assert (=> b!1555178 e!866037))

(declare-fun res!1064152 () Bool)

(assert (=> b!1555178 (=> (not res!1064152) (not e!866037))))

(declare-fun containsKey!787 (List!36257 (_ BitVec 64)) Bool)

(assert (=> b!1555178 (= res!1064152 (= (containsKey!787 lt!670222 otherKey!50) (containsKey!787 (t!50978 l!1177) otherKey!50)))))

(declare-fun newValue!105 () B!2274)

(declare-fun insertStrictlySorted!527 (List!36257 (_ BitVec 64) B!2274) List!36257)

(assert (=> b!1555178 (= lt!670222 (insertStrictlySorted!527 (t!50978 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51818 0))(
  ( (Unit!51819) )
))
(declare-fun lt!670223 () Unit!51818)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!24 (List!36257 (_ BitVec 64) B!2274 (_ BitVec 64)) Unit!51818)

(assert (=> b!1555178 (= lt!670223 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!24 (t!50978 l!1177) newKey!105 newValue!105 otherKey!50))))

(assert (= (and start!132732 res!1064155) b!1555174))

(assert (= (and b!1555174 res!1064153) b!1555175))

(assert (= (and b!1555175 res!1064154) b!1555178))

(assert (= (and b!1555178 res!1064152) b!1555176))

(assert (= (and start!132732 (is-Cons!36253 l!1177)) b!1555177))

(declare-fun m!1433249 () Bool)

(assert (=> b!1555175 m!1433249))

(declare-fun m!1433251 () Bool)

(assert (=> b!1555176 m!1433251))

(declare-fun m!1433253 () Bool)

(assert (=> b!1555176 m!1433253))

(declare-fun m!1433255 () Bool)

(assert (=> start!132732 m!1433255))

(declare-fun m!1433257 () Bool)

(assert (=> b!1555178 m!1433257))

(declare-fun m!1433259 () Bool)

(assert (=> b!1555178 m!1433259))

(declare-fun m!1433261 () Bool)

(assert (=> b!1555178 m!1433261))

(declare-fun m!1433263 () Bool)

(assert (=> b!1555178 m!1433263))

(push 1)

(assert (not b!1555177))

(assert tp_is_empty!38285)

(assert (not b!1555176))

(assert (not b!1555178))

(assert (not b!1555175))

(assert (not start!132732))

(check-sat)

