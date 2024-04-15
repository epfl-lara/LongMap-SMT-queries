; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132678 () Bool)

(assert start!132678)

(declare-fun b!1554831 () Bool)

(declare-fun e!865821 () Bool)

(declare-fun tp_is_empty!38281 () Bool)

(declare-fun tp!112255 () Bool)

(assert (=> b!1554831 (= e!865821 (and tp_is_empty!38281 tp!112255))))

(declare-fun b!1554832 () Bool)

(declare-fun res!1064001 () Bool)

(declare-fun e!865822 () Bool)

(assert (=> b!1554832 (=> (not res!1064001) (not e!865822))))

(declare-datatypes ((B!2270 0))(
  ( (B!2271 (val!19221 Int)) )
))
(declare-datatypes ((tuple2!24890 0))(
  ( (tuple2!24891 (_1!12456 (_ BitVec 64)) (_2!12456 B!2270)) )
))
(declare-datatypes ((List!36300 0))(
  ( (Nil!36297) (Cons!36296 (h!37743 tuple2!24890) (t!51013 List!36300)) )
))
(declare-fun l!1177 () List!36300)

(declare-fun isStrictlySorted!912 (List!36300) Bool)

(assert (=> b!1554832 (= res!1064001 (isStrictlySorted!912 (t!51013 l!1177)))))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-fun b!1554833 () Bool)

(declare-fun lt!669925 () List!36300)

(declare-fun e!865823 () Bool)

(declare-datatypes ((Option!841 0))(
  ( (Some!840 (v!22019 B!2270)) (None!839) )
))
(declare-fun getValueByKey!766 (List!36300 (_ BitVec 64)) Option!841)

(assert (=> b!1554833 (= e!865823 (= (getValueByKey!766 lt!669925 otherKey!50) (getValueByKey!766 (t!51013 l!1177) otherKey!50)))))

(declare-fun res!1064000 () Bool)

(assert (=> start!132678 (=> (not res!1064000) (not e!865822))))

(assert (=> start!132678 (= res!1064000 (isStrictlySorted!912 l!1177))))

(assert (=> start!132678 e!865822))

(assert (=> start!132678 e!865821))

(assert (=> start!132678 true))

(assert (=> start!132678 tp_is_empty!38281))

(declare-fun b!1554834 () Bool)

(assert (=> b!1554834 (= e!865822 (not true))))

(assert (=> b!1554834 e!865823))

(declare-fun res!1063999 () Bool)

(assert (=> b!1554834 (=> (not res!1063999) (not e!865823))))

(declare-fun containsKey!783 (List!36300 (_ BitVec 64)) Bool)

(assert (=> b!1554834 (= res!1063999 (= (containsKey!783 lt!669925 otherKey!50) (containsKey!783 (t!51013 l!1177) otherKey!50)))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun newValue!105 () B!2270)

(declare-fun insertStrictlySorted!526 (List!36300 (_ BitVec 64) B!2270) List!36300)

(assert (=> b!1554834 (= lt!669925 (insertStrictlySorted!526 (t!51013 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51630 0))(
  ( (Unit!51631) )
))
(declare-fun lt!669924 () Unit!51630)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!22 (List!36300 (_ BitVec 64) B!2270 (_ BitVec 64)) Unit!51630)

(assert (=> b!1554834 (= lt!669924 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!22 (t!51013 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1554835 () Bool)

(declare-fun res!1064002 () Bool)

(assert (=> b!1554835 (=> (not res!1064002) (not e!865822))))

(get-info :version)

(assert (=> b!1554835 (= res!1064002 (and (not (= newKey!105 otherKey!50)) ((_ is Cons!36296) l!1177) (not (= (_1!12456 (h!37743 l!1177)) otherKey!50))))))

(assert (= (and start!132678 res!1064000) b!1554835))

(assert (= (and b!1554835 res!1064002) b!1554832))

(assert (= (and b!1554832 res!1064001) b!1554834))

(assert (= (and b!1554834 res!1063999) b!1554833))

(assert (= (and start!132678 ((_ is Cons!36296) l!1177)) b!1554831))

(declare-fun m!1432325 () Bool)

(assert (=> b!1554832 m!1432325))

(declare-fun m!1432327 () Bool)

(assert (=> b!1554833 m!1432327))

(declare-fun m!1432329 () Bool)

(assert (=> b!1554833 m!1432329))

(declare-fun m!1432331 () Bool)

(assert (=> start!132678 m!1432331))

(declare-fun m!1432333 () Bool)

(assert (=> b!1554834 m!1432333))

(declare-fun m!1432335 () Bool)

(assert (=> b!1554834 m!1432335))

(declare-fun m!1432337 () Bool)

(assert (=> b!1554834 m!1432337))

(declare-fun m!1432339 () Bool)

(assert (=> b!1554834 m!1432339))

(check-sat (not b!1554833) (not b!1554832) tp_is_empty!38281 (not b!1554834) (not b!1554831) (not start!132678))
(check-sat)
