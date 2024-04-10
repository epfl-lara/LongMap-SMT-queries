; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132690 () Bool)

(assert start!132690)

(declare-fun b!1554829 () Bool)

(declare-fun e!865819 () Bool)

(assert (=> b!1554829 (= e!865819 (not true))))

(declare-fun e!865818 () Bool)

(assert (=> b!1554829 e!865818))

(declare-fun res!1063986 () Bool)

(assert (=> b!1554829 (=> (not res!1063986) (not e!865818))))

(declare-datatypes ((B!2262 0))(
  ( (B!2263 (val!19217 Int)) )
))
(declare-datatypes ((tuple2!24810 0))(
  ( (tuple2!24811 (_1!12416 (_ BitVec 64)) (_2!12416 B!2262)) )
))
(declare-datatypes ((List!36251 0))(
  ( (Nil!36248) (Cons!36247 (h!37693 tuple2!24810) (t!50972 List!36251)) )
))
(declare-fun lt!670166 () List!36251)

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-fun l!1177 () List!36251)

(declare-fun containsKey!781 (List!36251 (_ BitVec 64)) Bool)

(assert (=> b!1554829 (= res!1063986 (= (containsKey!781 lt!670166 otherKey!50) (containsKey!781 (t!50972 l!1177) otherKey!50)))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun newValue!105 () B!2262)

(declare-fun insertStrictlySorted!521 (List!36251 (_ BitVec 64) B!2262) List!36251)

(assert (=> b!1554829 (= lt!670166 (insertStrictlySorted!521 (t!50972 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51806 0))(
  ( (Unit!51807) )
))
(declare-fun lt!670165 () Unit!51806)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!18 (List!36251 (_ BitVec 64) B!2262 (_ BitVec 64)) Unit!51806)

(assert (=> b!1554829 (= lt!670165 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!18 (t!50972 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1554830 () Bool)

(declare-fun res!1063985 () Bool)

(assert (=> b!1554830 (=> (not res!1063985) (not e!865819))))

(declare-fun isStrictlySorted!910 (List!36251) Bool)

(assert (=> b!1554830 (= res!1063985 (isStrictlySorted!910 (t!50972 l!1177)))))

(declare-fun res!1063984 () Bool)

(assert (=> start!132690 (=> (not res!1063984) (not e!865819))))

(assert (=> start!132690 (= res!1063984 (isStrictlySorted!910 l!1177))))

(assert (=> start!132690 e!865819))

(declare-fun e!865820 () Bool)

(assert (=> start!132690 e!865820))

(assert (=> start!132690 true))

(declare-fun tp_is_empty!38273 () Bool)

(assert (=> start!132690 tp_is_empty!38273))

(declare-fun b!1554831 () Bool)

(declare-fun res!1063987 () Bool)

(assert (=> b!1554831 (=> (not res!1063987) (not e!865819))))

(assert (=> b!1554831 (= res!1063987 (and (not (= newKey!105 otherKey!50)) (is-Cons!36247 l!1177) (not (= (_1!12416 (h!37693 l!1177)) otherKey!50))))))

(declare-fun b!1554832 () Bool)

(declare-datatypes ((Option!835 0))(
  ( (Some!834 (v!22019 B!2262)) (None!833) )
))
(declare-fun getValueByKey!759 (List!36251 (_ BitVec 64)) Option!835)

(assert (=> b!1554832 (= e!865818 (= (getValueByKey!759 lt!670166 otherKey!50) (getValueByKey!759 (t!50972 l!1177) otherKey!50)))))

(declare-fun b!1554833 () Bool)

(declare-fun tp!112233 () Bool)

(assert (=> b!1554833 (= e!865820 (and tp_is_empty!38273 tp!112233))))

(assert (= (and start!132690 res!1063984) b!1554831))

(assert (= (and b!1554831 res!1063987) b!1554830))

(assert (= (and b!1554830 res!1063985) b!1554829))

(assert (= (and b!1554829 res!1063986) b!1554832))

(assert (= (and start!132690 (is-Cons!36247 l!1177)) b!1554833))

(declare-fun m!1433033 () Bool)

(assert (=> b!1554829 m!1433033))

(declare-fun m!1433035 () Bool)

(assert (=> b!1554829 m!1433035))

(declare-fun m!1433037 () Bool)

(assert (=> b!1554829 m!1433037))

(declare-fun m!1433039 () Bool)

(assert (=> b!1554829 m!1433039))

(declare-fun m!1433041 () Bool)

(assert (=> b!1554830 m!1433041))

(declare-fun m!1433043 () Bool)

(assert (=> start!132690 m!1433043))

(declare-fun m!1433045 () Bool)

(assert (=> b!1554832 m!1433045))

(declare-fun m!1433047 () Bool)

(assert (=> b!1554832 m!1433047))

(push 1)

(assert tp_is_empty!38273)

(assert (not start!132690))

(assert (not b!1554829))

(assert (not b!1554830))

(assert (not b!1554832))

(assert (not b!1554833))

(check-sat)

