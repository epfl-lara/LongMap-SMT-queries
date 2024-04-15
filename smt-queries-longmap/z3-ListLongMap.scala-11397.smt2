; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132636 () Bool)

(assert start!132636)

(declare-fun b!1554486 () Bool)

(declare-fun e!865602 () Bool)

(assert (=> b!1554486 (= e!865602 (not true))))

(declare-fun e!865603 () Bool)

(assert (=> b!1554486 e!865603))

(declare-fun res!1063831 () Bool)

(assert (=> b!1554486 (=> (not res!1063831) (not e!865603))))

(declare-datatypes ((B!2258 0))(
  ( (B!2259 (val!19215 Int)) )
))
(declare-datatypes ((tuple2!24878 0))(
  ( (tuple2!24879 (_1!12450 (_ BitVec 64)) (_2!12450 B!2258)) )
))
(declare-datatypes ((List!36294 0))(
  ( (Nil!36291) (Cons!36290 (h!37737 tuple2!24878) (t!51007 List!36294)) )
))
(declare-fun lt!669868 () List!36294)

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-fun l!1177 () List!36294)

(declare-fun containsKey!777 (List!36294 (_ BitVec 64)) Bool)

(assert (=> b!1554486 (= res!1063831 (= (containsKey!777 lt!669868 otherKey!50) (containsKey!777 (t!51007 l!1177) otherKey!50)))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun newValue!105 () B!2258)

(declare-fun insertStrictlySorted!520 (List!36294 (_ BitVec 64) B!2258) List!36294)

(assert (=> b!1554486 (= lt!669868 (insertStrictlySorted!520 (t!51007 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51618 0))(
  ( (Unit!51619) )
))
(declare-fun lt!669867 () Unit!51618)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!16 (List!36294 (_ BitVec 64) B!2258 (_ BitVec 64)) Unit!51618)

(assert (=> b!1554486 (= lt!669867 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!16 (t!51007 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1554487 () Bool)

(declare-fun res!1063833 () Bool)

(assert (=> b!1554487 (=> (not res!1063833) (not e!865602))))

(declare-fun isStrictlySorted!906 (List!36294) Bool)

(assert (=> b!1554487 (= res!1063833 (isStrictlySorted!906 (t!51007 l!1177)))))

(declare-fun res!1063832 () Bool)

(assert (=> start!132636 (=> (not res!1063832) (not e!865602))))

(assert (=> start!132636 (= res!1063832 (isStrictlySorted!906 l!1177))))

(assert (=> start!132636 e!865602))

(declare-fun e!865604 () Bool)

(assert (=> start!132636 e!865604))

(assert (=> start!132636 true))

(declare-fun tp_is_empty!38269 () Bool)

(assert (=> start!132636 tp_is_empty!38269))

(declare-fun b!1554488 () Bool)

(declare-datatypes ((Option!835 0))(
  ( (Some!834 (v!22013 B!2258)) (None!833) )
))
(declare-fun getValueByKey!760 (List!36294 (_ BitVec 64)) Option!835)

(assert (=> b!1554488 (= e!865603 (= (getValueByKey!760 lt!669868 otherKey!50) (getValueByKey!760 (t!51007 l!1177) otherKey!50)))))

(declare-fun b!1554489 () Bool)

(declare-fun tp!112228 () Bool)

(assert (=> b!1554489 (= e!865604 (and tp_is_empty!38269 tp!112228))))

(declare-fun b!1554490 () Bool)

(declare-fun res!1063834 () Bool)

(assert (=> b!1554490 (=> (not res!1063834) (not e!865602))))

(get-info :version)

(assert (=> b!1554490 (= res!1063834 (and (not (= newKey!105 otherKey!50)) ((_ is Cons!36290) l!1177) (not (= (_1!12450 (h!37737 l!1177)) otherKey!50))))))

(assert (= (and start!132636 res!1063832) b!1554490))

(assert (= (and b!1554490 res!1063834) b!1554487))

(assert (= (and b!1554487 res!1063833) b!1554486))

(assert (= (and b!1554486 res!1063831) b!1554488))

(assert (= (and start!132636 ((_ is Cons!36290) l!1177)) b!1554489))

(declare-fun m!1432109 () Bool)

(assert (=> b!1554486 m!1432109))

(declare-fun m!1432111 () Bool)

(assert (=> b!1554486 m!1432111))

(declare-fun m!1432113 () Bool)

(assert (=> b!1554486 m!1432113))

(declare-fun m!1432115 () Bool)

(assert (=> b!1554486 m!1432115))

(declare-fun m!1432117 () Bool)

(assert (=> b!1554487 m!1432117))

(declare-fun m!1432119 () Bool)

(assert (=> start!132636 m!1432119))

(declare-fun m!1432121 () Bool)

(assert (=> b!1554488 m!1432121))

(declare-fun m!1432123 () Bool)

(assert (=> b!1554488 m!1432123))

(check-sat (not start!132636) (not b!1554488) (not b!1554489) (not b!1554487) (not b!1554486) tp_is_empty!38269)
(check-sat)
