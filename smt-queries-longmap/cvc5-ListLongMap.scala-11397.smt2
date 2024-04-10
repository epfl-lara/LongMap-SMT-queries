; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132686 () Bool)

(assert start!132686)

(declare-fun res!1063961 () Bool)

(declare-fun e!865802 () Bool)

(assert (=> start!132686 (=> (not res!1063961) (not e!865802))))

(declare-datatypes ((B!2258 0))(
  ( (B!2259 (val!19215 Int)) )
))
(declare-datatypes ((tuple2!24806 0))(
  ( (tuple2!24807 (_1!12414 (_ BitVec 64)) (_2!12414 B!2258)) )
))
(declare-datatypes ((List!36249 0))(
  ( (Nil!36246) (Cons!36245 (h!37691 tuple2!24806) (t!50970 List!36249)) )
))
(declare-fun l!1177 () List!36249)

(declare-fun isStrictlySorted!908 (List!36249) Bool)

(assert (=> start!132686 (= res!1063961 (isStrictlySorted!908 l!1177))))

(assert (=> start!132686 e!865802))

(declare-fun e!865801 () Bool)

(assert (=> start!132686 e!865801))

(assert (=> start!132686 true))

(declare-fun tp_is_empty!38269 () Bool)

(assert (=> start!132686 tp_is_empty!38269))

(declare-fun b!1554799 () Bool)

(assert (=> b!1554799 (= e!865802 (not true))))

(declare-fun e!865800 () Bool)

(assert (=> b!1554799 e!865800))

(declare-fun res!1063962 () Bool)

(assert (=> b!1554799 (=> (not res!1063962) (not e!865800))))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-fun lt!670154 () List!36249)

(declare-fun containsKey!779 (List!36249 (_ BitVec 64)) Bool)

(assert (=> b!1554799 (= res!1063962 (= (containsKey!779 lt!670154 otherKey!50) (containsKey!779 (t!50970 l!1177) otherKey!50)))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun newValue!105 () B!2258)

(declare-fun insertStrictlySorted!519 (List!36249 (_ BitVec 64) B!2258) List!36249)

(assert (=> b!1554799 (= lt!670154 (insertStrictlySorted!519 (t!50970 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51802 0))(
  ( (Unit!51803) )
))
(declare-fun lt!670153 () Unit!51802)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!16 (List!36249 (_ BitVec 64) B!2258 (_ BitVec 64)) Unit!51802)

(assert (=> b!1554799 (= lt!670153 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!16 (t!50970 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1554800 () Bool)

(declare-datatypes ((Option!833 0))(
  ( (Some!832 (v!22017 B!2258)) (None!831) )
))
(declare-fun getValueByKey!757 (List!36249 (_ BitVec 64)) Option!833)

(assert (=> b!1554800 (= e!865800 (= (getValueByKey!757 lt!670154 otherKey!50) (getValueByKey!757 (t!50970 l!1177) otherKey!50)))))

(declare-fun b!1554801 () Bool)

(declare-fun res!1063960 () Bool)

(assert (=> b!1554801 (=> (not res!1063960) (not e!865802))))

(assert (=> b!1554801 (= res!1063960 (and (not (= newKey!105 otherKey!50)) (is-Cons!36245 l!1177) (not (= (_1!12414 (h!37691 l!1177)) otherKey!50))))))

(declare-fun b!1554802 () Bool)

(declare-fun tp!112227 () Bool)

(assert (=> b!1554802 (= e!865801 (and tp_is_empty!38269 tp!112227))))

(declare-fun b!1554803 () Bool)

(declare-fun res!1063963 () Bool)

(assert (=> b!1554803 (=> (not res!1063963) (not e!865802))))

(assert (=> b!1554803 (= res!1063963 (isStrictlySorted!908 (t!50970 l!1177)))))

(assert (= (and start!132686 res!1063961) b!1554801))

(assert (= (and b!1554801 res!1063960) b!1554803))

(assert (= (and b!1554803 res!1063963) b!1554799))

(assert (= (and b!1554799 res!1063962) b!1554800))

(assert (= (and start!132686 (is-Cons!36245 l!1177)) b!1554802))

(declare-fun m!1433001 () Bool)

(assert (=> start!132686 m!1433001))

(declare-fun m!1433003 () Bool)

(assert (=> b!1554799 m!1433003))

(declare-fun m!1433005 () Bool)

(assert (=> b!1554799 m!1433005))

(declare-fun m!1433007 () Bool)

(assert (=> b!1554799 m!1433007))

(declare-fun m!1433009 () Bool)

(assert (=> b!1554799 m!1433009))

(declare-fun m!1433011 () Bool)

(assert (=> b!1554800 m!1433011))

(declare-fun m!1433013 () Bool)

(assert (=> b!1554800 m!1433013))

(declare-fun m!1433015 () Bool)

(assert (=> b!1554803 m!1433015))

(push 1)

(assert (not b!1554802))

(assert (not b!1554803))

(assert (not b!1554799))

(assert tp_is_empty!38269)

(assert (not start!132686))

(assert (not b!1554800))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

