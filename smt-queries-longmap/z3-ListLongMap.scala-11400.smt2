; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132684 () Bool)

(assert start!132684)

(declare-fun b!1554876 () Bool)

(declare-fun e!865849 () Bool)

(declare-fun tp_is_empty!38287 () Bool)

(declare-fun tp!112264 () Bool)

(assert (=> b!1554876 (= e!865849 (and tp_is_empty!38287 tp!112264))))

(declare-fun res!1064037 () Bool)

(declare-fun e!865848 () Bool)

(assert (=> start!132684 (=> (not res!1064037) (not e!865848))))

(declare-datatypes ((B!2276 0))(
  ( (B!2277 (val!19224 Int)) )
))
(declare-datatypes ((tuple2!24896 0))(
  ( (tuple2!24897 (_1!12459 (_ BitVec 64)) (_2!12459 B!2276)) )
))
(declare-datatypes ((List!36303 0))(
  ( (Nil!36300) (Cons!36299 (h!37746 tuple2!24896) (t!51016 List!36303)) )
))
(declare-fun l!1177 () List!36303)

(declare-fun isStrictlySorted!915 (List!36303) Bool)

(assert (=> start!132684 (= res!1064037 (isStrictlySorted!915 l!1177))))

(assert (=> start!132684 e!865848))

(assert (=> start!132684 e!865849))

(assert (=> start!132684 true))

(assert (=> start!132684 tp_is_empty!38287))

(declare-fun b!1554877 () Bool)

(declare-fun res!1064035 () Bool)

(assert (=> b!1554877 (=> (not res!1064035) (not e!865848))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1554877 (= res!1064035 (and (not (= newKey!105 otherKey!50)) ((_ is Cons!36299) l!1177) (not (= (_1!12459 (h!37746 l!1177)) otherKey!50))))))

(declare-fun e!865850 () Bool)

(declare-fun lt!669945 () List!36303)

(declare-fun b!1554878 () Bool)

(declare-datatypes ((Option!844 0))(
  ( (Some!843 (v!22022 B!2276)) (None!842) )
))
(declare-fun getValueByKey!769 (List!36303 (_ BitVec 64)) Option!844)

(assert (=> b!1554878 (= e!865850 (= (getValueByKey!769 lt!669945 otherKey!50) (getValueByKey!769 (t!51016 l!1177) otherKey!50)))))

(declare-fun b!1554879 () Bool)

(declare-fun res!1064038 () Bool)

(assert (=> b!1554879 (=> (not res!1064038) (not e!865848))))

(assert (=> b!1554879 (= res!1064038 (isStrictlySorted!915 (t!51016 l!1177)))))

(declare-fun b!1554880 () Bool)

(assert (=> b!1554880 (= e!865848 (not true))))

(declare-fun newValue!105 () B!2276)

(declare-fun lt!669946 () Bool)

(declare-fun containsKey!786 (List!36303 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!529 (List!36303 (_ BitVec 64) B!2276) List!36303)

(assert (=> b!1554880 (= lt!669946 (containsKey!786 (insertStrictlySorted!529 l!1177 newKey!105 newValue!105) otherKey!50))))

(assert (=> b!1554880 e!865850))

(declare-fun res!1064036 () Bool)

(assert (=> b!1554880 (=> (not res!1064036) (not e!865850))))

(assert (=> b!1554880 (= res!1064036 (= (containsKey!786 lt!669945 otherKey!50) (containsKey!786 (t!51016 l!1177) otherKey!50)))))

(assert (=> b!1554880 (= lt!669945 (insertStrictlySorted!529 (t!51016 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51636 0))(
  ( (Unit!51637) )
))
(declare-fun lt!669944 () Unit!51636)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!25 (List!36303 (_ BitVec 64) B!2276 (_ BitVec 64)) Unit!51636)

(assert (=> b!1554880 (= lt!669944 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!25 (t!51016 l!1177) newKey!105 newValue!105 otherKey!50))))

(assert (= (and start!132684 res!1064037) b!1554877))

(assert (= (and b!1554877 res!1064035) b!1554879))

(assert (= (and b!1554879 res!1064038) b!1554880))

(assert (= (and b!1554880 res!1064036) b!1554878))

(assert (= (and start!132684 ((_ is Cons!36299) l!1177)) b!1554876))

(declare-fun m!1432373 () Bool)

(assert (=> start!132684 m!1432373))

(declare-fun m!1432375 () Bool)

(assert (=> b!1554878 m!1432375))

(declare-fun m!1432377 () Bool)

(assert (=> b!1554878 m!1432377))

(declare-fun m!1432379 () Bool)

(assert (=> b!1554879 m!1432379))

(declare-fun m!1432381 () Bool)

(assert (=> b!1554880 m!1432381))

(declare-fun m!1432383 () Bool)

(assert (=> b!1554880 m!1432383))

(declare-fun m!1432385 () Bool)

(assert (=> b!1554880 m!1432385))

(declare-fun m!1432387 () Bool)

(assert (=> b!1554880 m!1432387))

(declare-fun m!1432389 () Bool)

(assert (=> b!1554880 m!1432389))

(assert (=> b!1554880 m!1432385))

(declare-fun m!1432391 () Bool)

(assert (=> b!1554880 m!1432391))

(check-sat (not b!1554879) tp_is_empty!38287 (not b!1554880) (not start!132684) (not b!1554876) (not b!1554878))
(check-sat)
