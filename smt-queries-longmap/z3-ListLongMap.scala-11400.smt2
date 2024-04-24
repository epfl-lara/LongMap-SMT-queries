; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133146 () Bool)

(assert start!133146)

(declare-fun b!1557625 () Bool)

(declare-fun e!867557 () Bool)

(assert (=> b!1557625 (= e!867557 (not true))))

(declare-fun lt!671139 () Bool)

(declare-fun newKey!105 () (_ BitVec 64))

(declare-datatypes ((B!2276 0))(
  ( (B!2277 (val!19224 Int)) )
))
(declare-fun newValue!105 () B!2276)

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-datatypes ((tuple2!24878 0))(
  ( (tuple2!24879 (_1!12450 (_ BitVec 64)) (_2!12450 B!2276)) )
))
(declare-datatypes ((List!36287 0))(
  ( (Nil!36284) (Cons!36283 (h!37747 tuple2!24878) (t!51000 List!36287)) )
))
(declare-fun l!1177 () List!36287)

(declare-fun containsKey!788 (List!36287 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!529 (List!36287 (_ BitVec 64) B!2276) List!36287)

(assert (=> b!1557625 (= lt!671139 (containsKey!788 (insertStrictlySorted!529 l!1177 newKey!105 newValue!105) otherKey!50))))

(declare-fun e!867555 () Bool)

(assert (=> b!1557625 e!867555))

(declare-fun res!1065025 () Bool)

(assert (=> b!1557625 (=> (not res!1065025) (not e!867555))))

(declare-fun lt!671140 () List!36287)

(assert (=> b!1557625 (= res!1065025 (= (containsKey!788 lt!671140 otherKey!50) (containsKey!788 (t!51000 l!1177) otherKey!50)))))

(assert (=> b!1557625 (= lt!671140 (insertStrictlySorted!529 (t!51000 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51731 0))(
  ( (Unit!51732) )
))
(declare-fun lt!671138 () Unit!51731)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!25 (List!36287 (_ BitVec 64) B!2276 (_ BitVec 64)) Unit!51731)

(assert (=> b!1557625 (= lt!671138 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!25 (t!51000 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1557626 () Bool)

(declare-fun e!867556 () Bool)

(declare-fun tp_is_empty!38287 () Bool)

(declare-fun tp!112263 () Bool)

(assert (=> b!1557626 (= e!867556 (and tp_is_empty!38287 tp!112263))))

(declare-fun b!1557627 () Bool)

(declare-fun res!1065024 () Bool)

(assert (=> b!1557627 (=> (not res!1065024) (not e!867557))))

(declare-fun isStrictlySorted!904 (List!36287) Bool)

(assert (=> b!1557627 (= res!1065024 (isStrictlySorted!904 (t!51000 l!1177)))))

(declare-fun b!1557628 () Bool)

(declare-datatypes ((Option!837 0))(
  ( (Some!836 (v!22018 B!2276)) (None!835) )
))
(declare-fun getValueByKey!762 (List!36287 (_ BitVec 64)) Option!837)

(assert (=> b!1557628 (= e!867555 (= (getValueByKey!762 lt!671140 otherKey!50) (getValueByKey!762 (t!51000 l!1177) otherKey!50)))))

(declare-fun res!1065026 () Bool)

(assert (=> start!133146 (=> (not res!1065026) (not e!867557))))

(assert (=> start!133146 (= res!1065026 (isStrictlySorted!904 l!1177))))

(assert (=> start!133146 e!867557))

(assert (=> start!133146 e!867556))

(assert (=> start!133146 true))

(assert (=> start!133146 tp_is_empty!38287))

(declare-fun b!1557629 () Bool)

(declare-fun res!1065027 () Bool)

(assert (=> b!1557629 (=> (not res!1065027) (not e!867557))))

(get-info :version)

(assert (=> b!1557629 (= res!1065027 (and (not (= newKey!105 otherKey!50)) ((_ is Cons!36283) l!1177) (not (= (_1!12450 (h!37747 l!1177)) otherKey!50))))))

(assert (= (and start!133146 res!1065026) b!1557629))

(assert (= (and b!1557629 res!1065027) b!1557627))

(assert (= (and b!1557627 res!1065024) b!1557625))

(assert (= (and b!1557625 res!1065025) b!1557628))

(assert (= (and start!133146 ((_ is Cons!36283) l!1177)) b!1557626))

(declare-fun m!1435523 () Bool)

(assert (=> b!1557625 m!1435523))

(declare-fun m!1435525 () Bool)

(assert (=> b!1557625 m!1435525))

(declare-fun m!1435527 () Bool)

(assert (=> b!1557625 m!1435527))

(declare-fun m!1435529 () Bool)

(assert (=> b!1557625 m!1435529))

(declare-fun m!1435531 () Bool)

(assert (=> b!1557625 m!1435531))

(assert (=> b!1557625 m!1435525))

(declare-fun m!1435533 () Bool)

(assert (=> b!1557625 m!1435533))

(declare-fun m!1435535 () Bool)

(assert (=> b!1557627 m!1435535))

(declare-fun m!1435537 () Bool)

(assert (=> b!1557628 m!1435537))

(declare-fun m!1435539 () Bool)

(assert (=> b!1557628 m!1435539))

(declare-fun m!1435541 () Bool)

(assert (=> start!133146 m!1435541))

(check-sat (not b!1557628) (not start!133146) (not b!1557625) tp_is_empty!38287 (not b!1557626) (not b!1557627))
(check-sat)
