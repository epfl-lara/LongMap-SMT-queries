; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132726 () Bool)

(assert start!132726)

(declare-fun res!1064227 () Bool)

(declare-fun e!866088 () Bool)

(assert (=> start!132726 (=> (not res!1064227) (not e!866088))))

(declare-datatypes ((B!2288 0))(
  ( (B!2289 (val!19230 Int)) )
))
(declare-datatypes ((tuple2!24908 0))(
  ( (tuple2!24909 (_1!12465 (_ BitVec 64)) (_2!12465 B!2288)) )
))
(declare-datatypes ((List!36309 0))(
  ( (Nil!36306) (Cons!36305 (h!37752 tuple2!24908) (t!51022 List!36309)) )
))
(declare-fun l!1177 () List!36309)

(declare-fun isStrictlySorted!921 (List!36309) Bool)

(assert (=> start!132726 (= res!1064227 (isStrictlySorted!921 l!1177))))

(assert (=> start!132726 e!866088))

(declare-fun e!866090 () Bool)

(assert (=> start!132726 e!866090))

(assert (=> start!132726 true))

(declare-fun tp_is_empty!38299 () Bool)

(assert (=> start!132726 tp_is_empty!38299))

(declare-fun b!1555242 () Bool)

(declare-fun res!1064226 () Bool)

(assert (=> b!1555242 (=> (not res!1064226) (not e!866088))))

(assert (=> b!1555242 (= res!1064226 (isStrictlySorted!921 (t!51022 l!1177)))))

(declare-fun lt!670021 () List!36309)

(declare-fun b!1555243 () Bool)

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-fun e!866089 () Bool)

(declare-datatypes ((Option!850 0))(
  ( (Some!849 (v!22028 B!2288)) (None!848) )
))
(declare-fun getValueByKey!775 (List!36309 (_ BitVec 64)) Option!850)

(assert (=> b!1555243 (= e!866089 (= (getValueByKey!775 lt!670021 otherKey!50) (getValueByKey!775 (t!51022 l!1177) otherKey!50)))))

(declare-fun b!1555244 () Bool)

(declare-fun tp!112291 () Bool)

(assert (=> b!1555244 (= e!866090 (and tp_is_empty!38299 tp!112291))))

(declare-fun b!1555245 () Bool)

(declare-fun res!1064225 () Bool)

(assert (=> b!1555245 (=> (not res!1064225) (not e!866088))))

(declare-fun newKey!105 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1555245 (= res!1064225 (and (not (= newKey!105 otherKey!50)) ((_ is Cons!36305) l!1177) (not (= (_1!12465 (h!37752 l!1177)) otherKey!50))))))

(declare-fun b!1555246 () Bool)

(assert (=> b!1555246 (= e!866088 (not true))))

(declare-fun newValue!105 () B!2288)

(declare-fun lt!670020 () Bool)

(declare-fun containsKey!792 (List!36309 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!535 (List!36309 (_ BitVec 64) B!2288) List!36309)

(assert (=> b!1555246 (= lt!670020 (containsKey!792 (insertStrictlySorted!535 l!1177 newKey!105 newValue!105) otherKey!50))))

(assert (=> b!1555246 e!866089))

(declare-fun res!1064224 () Bool)

(assert (=> b!1555246 (=> (not res!1064224) (not e!866089))))

(assert (=> b!1555246 (= res!1064224 (= (containsKey!792 lt!670021 otherKey!50) (containsKey!792 (t!51022 l!1177) otherKey!50)))))

(assert (=> b!1555246 (= lt!670021 (insertStrictlySorted!535 (t!51022 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51648 0))(
  ( (Unit!51649) )
))
(declare-fun lt!670019 () Unit!51648)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!31 (List!36309 (_ BitVec 64) B!2288 (_ BitVec 64)) Unit!51648)

(assert (=> b!1555246 (= lt!670019 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!31 (t!51022 l!1177) newKey!105 newValue!105 otherKey!50))))

(assert (= (and start!132726 res!1064227) b!1555245))

(assert (= (and b!1555245 res!1064225) b!1555242))

(assert (= (and b!1555242 res!1064226) b!1555246))

(assert (= (and b!1555246 res!1064224) b!1555243))

(assert (= (and start!132726 ((_ is Cons!36305) l!1177)) b!1555244))

(declare-fun m!1432619 () Bool)

(assert (=> start!132726 m!1432619))

(declare-fun m!1432621 () Bool)

(assert (=> b!1555242 m!1432621))

(declare-fun m!1432623 () Bool)

(assert (=> b!1555243 m!1432623))

(declare-fun m!1432625 () Bool)

(assert (=> b!1555243 m!1432625))

(declare-fun m!1432627 () Bool)

(assert (=> b!1555246 m!1432627))

(declare-fun m!1432629 () Bool)

(assert (=> b!1555246 m!1432629))

(declare-fun m!1432631 () Bool)

(assert (=> b!1555246 m!1432631))

(declare-fun m!1432633 () Bool)

(assert (=> b!1555246 m!1432633))

(declare-fun m!1432635 () Bool)

(assert (=> b!1555246 m!1432635))

(assert (=> b!1555246 m!1432629))

(declare-fun m!1432637 () Bool)

(assert (=> b!1555246 m!1432637))

(check-sat (not b!1555243) (not b!1555244) (not b!1555242) tp_is_empty!38299 (not start!132726) (not b!1555246))
(check-sat)
