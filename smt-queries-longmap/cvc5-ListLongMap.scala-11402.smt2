; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132776 () Bool)

(assert start!132776)

(declare-fun res!1064356 () Bool)

(declare-fun e!866286 () Bool)

(assert (=> start!132776 (=> (not res!1064356) (not e!866286))))

(declare-datatypes ((B!2288 0))(
  ( (B!2289 (val!19230 Int)) )
))
(declare-datatypes ((tuple2!24836 0))(
  ( (tuple2!24837 (_1!12429 (_ BitVec 64)) (_2!12429 B!2288)) )
))
(declare-datatypes ((List!36264 0))(
  ( (Nil!36261) (Cons!36260 (h!37706 tuple2!24836) (t!50985 List!36264)) )
))
(declare-fun l!1177 () List!36264)

(declare-fun isStrictlySorted!923 (List!36264) Bool)

(assert (=> start!132776 (= res!1064356 (isStrictlySorted!923 l!1177))))

(assert (=> start!132776 e!866286))

(declare-fun e!866287 () Bool)

(assert (=> start!132776 e!866287))

(assert (=> start!132776 true))

(declare-fun tp_is_empty!38299 () Bool)

(assert (=> start!132776 tp_is_empty!38299))

(declare-fun b!1555555 () Bool)

(declare-fun tp!112290 () Bool)

(assert (=> b!1555555 (= e!866287 (and tp_is_empty!38299 tp!112290))))

(declare-fun e!866288 () Bool)

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-fun lt!670305 () List!36264)

(declare-fun b!1555556 () Bool)

(declare-datatypes ((Option!848 0))(
  ( (Some!847 (v!22032 B!2288)) (None!846) )
))
(declare-fun getValueByKey!772 (List!36264 (_ BitVec 64)) Option!848)

(assert (=> b!1555556 (= e!866288 (= (getValueByKey!772 lt!670305 otherKey!50) (getValueByKey!772 (t!50985 l!1177) otherKey!50)))))

(declare-fun b!1555557 () Bool)

(declare-fun res!1064353 () Bool)

(assert (=> b!1555557 (=> (not res!1064353) (not e!866286))))

(declare-fun newKey!105 () (_ BitVec 64))

(assert (=> b!1555557 (= res!1064353 (and (not (= newKey!105 otherKey!50)) (is-Cons!36260 l!1177) (not (= (_1!12429 (h!37706 l!1177)) otherKey!50))))))

(declare-fun b!1555558 () Bool)

(assert (=> b!1555558 (= e!866286 (not true))))

(declare-fun newValue!105 () B!2288)

(declare-fun lt!670307 () Bool)

(declare-fun containsKey!794 (List!36264 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!534 (List!36264 (_ BitVec 64) B!2288) List!36264)

(assert (=> b!1555558 (= lt!670307 (containsKey!794 (insertStrictlySorted!534 l!1177 newKey!105 newValue!105) otherKey!50))))

(assert (=> b!1555558 e!866288))

(declare-fun res!1064354 () Bool)

(assert (=> b!1555558 (=> (not res!1064354) (not e!866288))))

(assert (=> b!1555558 (= res!1064354 (= (containsKey!794 lt!670305 otherKey!50) (containsKey!794 (t!50985 l!1177) otherKey!50)))))

(assert (=> b!1555558 (= lt!670305 (insertStrictlySorted!534 (t!50985 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51832 0))(
  ( (Unit!51833) )
))
(declare-fun lt!670306 () Unit!51832)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!31 (List!36264 (_ BitVec 64) B!2288 (_ BitVec 64)) Unit!51832)

(assert (=> b!1555558 (= lt!670306 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!31 (t!50985 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1555559 () Bool)

(declare-fun res!1064355 () Bool)

(assert (=> b!1555559 (=> (not res!1064355) (not e!866286))))

(assert (=> b!1555559 (= res!1064355 (isStrictlySorted!923 (t!50985 l!1177)))))

(assert (= (and start!132776 res!1064356) b!1555557))

(assert (= (and b!1555557 res!1064353) b!1555559))

(assert (= (and b!1555559 res!1064355) b!1555558))

(assert (= (and b!1555558 res!1064354) b!1555556))

(assert (= (and start!132776 (is-Cons!36260 l!1177)) b!1555555))

(declare-fun m!1433511 () Bool)

(assert (=> start!132776 m!1433511))

(declare-fun m!1433513 () Bool)

(assert (=> b!1555556 m!1433513))

(declare-fun m!1433515 () Bool)

(assert (=> b!1555556 m!1433515))

(declare-fun m!1433517 () Bool)

(assert (=> b!1555558 m!1433517))

(declare-fun m!1433519 () Bool)

(assert (=> b!1555558 m!1433519))

(declare-fun m!1433521 () Bool)

(assert (=> b!1555558 m!1433521))

(declare-fun m!1433523 () Bool)

(assert (=> b!1555558 m!1433523))

(declare-fun m!1433525 () Bool)

(assert (=> b!1555558 m!1433525))

(assert (=> b!1555558 m!1433519))

(declare-fun m!1433527 () Bool)

(assert (=> b!1555558 m!1433527))

(declare-fun m!1433529 () Bool)

(assert (=> b!1555559 m!1433529))

(push 1)

(assert (not b!1555556))

(assert (not b!1555559))

(assert (not b!1555558))

(assert (not start!132776))

(assert (not b!1555555))

(assert tp_is_empty!38299)

(check-sat)

(pop 1)

