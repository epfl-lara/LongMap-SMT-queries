; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132738 () Bool)

(assert start!132738)

(declare-fun b!1555219 () Bool)

(declare-fun res!1064188 () Bool)

(declare-fun e!866065 () Bool)

(assert (=> b!1555219 (=> (not res!1064188) (not e!866065))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-datatypes ((B!2280 0))(
  ( (B!2281 (val!19226 Int)) )
))
(declare-datatypes ((tuple2!24828 0))(
  ( (tuple2!24829 (_1!12425 (_ BitVec 64)) (_2!12425 B!2280)) )
))
(declare-datatypes ((List!36260 0))(
  ( (Nil!36257) (Cons!36256 (h!37702 tuple2!24828) (t!50981 List!36260)) )
))
(declare-fun l!1177 () List!36260)

(assert (=> b!1555219 (= res!1064188 (and (not (= newKey!105 otherKey!50)) (is-Cons!36256 l!1177) (not (= (_1!12425 (h!37702 l!1177)) otherKey!50))))))

(declare-fun b!1555220 () Bool)

(declare-fun lt!670250 () List!36260)

(declare-fun e!866064 () Bool)

(declare-datatypes ((Option!844 0))(
  ( (Some!843 (v!22028 B!2280)) (None!842) )
))
(declare-fun getValueByKey!768 (List!36260 (_ BitVec 64)) Option!844)

(assert (=> b!1555220 (= e!866064 (= (getValueByKey!768 lt!670250 otherKey!50) (getValueByKey!768 (t!50981 l!1177) otherKey!50)))))

(declare-fun b!1555221 () Bool)

(assert (=> b!1555221 (= e!866065 (not true))))

(declare-fun lt!670248 () Bool)

(declare-fun newValue!105 () B!2280)

(declare-fun containsKey!790 (List!36260 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!530 (List!36260 (_ BitVec 64) B!2280) List!36260)

(assert (=> b!1555221 (= lt!670248 (containsKey!790 (insertStrictlySorted!530 l!1177 newKey!105 newValue!105) otherKey!50))))

(assert (=> b!1555221 e!866064))

(declare-fun res!1064190 () Bool)

(assert (=> b!1555221 (=> (not res!1064190) (not e!866064))))

(assert (=> b!1555221 (= res!1064190 (= (containsKey!790 lt!670250 otherKey!50) (containsKey!790 (t!50981 l!1177) otherKey!50)))))

(assert (=> b!1555221 (= lt!670250 (insertStrictlySorted!530 (t!50981 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51824 0))(
  ( (Unit!51825) )
))
(declare-fun lt!670249 () Unit!51824)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!27 (List!36260 (_ BitVec 64) B!2280 (_ BitVec 64)) Unit!51824)

(assert (=> b!1555221 (= lt!670249 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!27 (t!50981 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1555222 () Bool)

(declare-fun res!1064191 () Bool)

(assert (=> b!1555222 (=> (not res!1064191) (not e!866065))))

(declare-fun isStrictlySorted!919 (List!36260) Bool)

(assert (=> b!1555222 (= res!1064191 (isStrictlySorted!919 (t!50981 l!1177)))))

(declare-fun res!1064189 () Bool)

(assert (=> start!132738 (=> (not res!1064189) (not e!866065))))

(assert (=> start!132738 (= res!1064189 (isStrictlySorted!919 l!1177))))

(assert (=> start!132738 e!866065))

(declare-fun e!866066 () Bool)

(assert (=> start!132738 e!866066))

(assert (=> start!132738 true))

(declare-fun tp_is_empty!38291 () Bool)

(assert (=> start!132738 tp_is_empty!38291))

(declare-fun b!1555223 () Bool)

(declare-fun tp!112269 () Bool)

(assert (=> b!1555223 (= e!866066 (and tp_is_empty!38291 tp!112269))))

(assert (= (and start!132738 res!1064189) b!1555219))

(assert (= (and b!1555219 res!1064188) b!1555222))

(assert (= (and b!1555222 res!1064191) b!1555221))

(assert (= (and b!1555221 res!1064190) b!1555220))

(assert (= (and start!132738 (is-Cons!36256 l!1177)) b!1555223))

(declare-fun m!1433305 () Bool)

(assert (=> b!1555220 m!1433305))

(declare-fun m!1433307 () Bool)

(assert (=> b!1555220 m!1433307))

(declare-fun m!1433309 () Bool)

(assert (=> b!1555221 m!1433309))

(declare-fun m!1433311 () Bool)

(assert (=> b!1555221 m!1433311))

(declare-fun m!1433313 () Bool)

(assert (=> b!1555221 m!1433313))

(declare-fun m!1433315 () Bool)

(assert (=> b!1555221 m!1433315))

(declare-fun m!1433317 () Bool)

(assert (=> b!1555221 m!1433317))

(assert (=> b!1555221 m!1433313))

(declare-fun m!1433319 () Bool)

(assert (=> b!1555221 m!1433319))

(declare-fun m!1433321 () Bool)

(assert (=> b!1555222 m!1433321))

(declare-fun m!1433323 () Bool)

(assert (=> start!132738 m!1433323))

(push 1)

(assert tp_is_empty!38291)

(assert (not start!132738))

(assert (not b!1555221))

(assert (not b!1555222))

(assert (not b!1555220))

(assert (not b!1555223))

(check-sat)

