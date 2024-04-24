; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133254 () Bool)

(assert start!133254)

(declare-fun res!1065417 () Bool)

(declare-fun e!868081 () Bool)

(assert (=> start!133254 (=> (not res!1065417) (not e!868081))))

(declare-datatypes ((B!2324 0))(
  ( (B!2325 (val!19248 Int)) )
))
(declare-datatypes ((tuple2!24926 0))(
  ( (tuple2!24927 (_1!12474 (_ BitVec 64)) (_2!12474 B!2324)) )
))
(declare-datatypes ((List!36311 0))(
  ( (Nil!36308) (Cons!36307 (h!37771 tuple2!24926) (t!51024 List!36311)) )
))
(declare-fun l!1177 () List!36311)

(declare-fun isStrictlySorted!922 (List!36311) Bool)

(assert (=> start!133254 (= res!1065417 (isStrictlySorted!922 l!1177))))

(assert (=> start!133254 e!868081))

(declare-fun e!868082 () Bool)

(assert (=> start!133254 e!868082))

(assert (=> start!133254 true))

(declare-fun tp_is_empty!38335 () Bool)

(assert (=> start!133254 tp_is_empty!38335))

(declare-fun b!1558422 () Bool)

(declare-fun res!1065416 () Bool)

(assert (=> b!1558422 (=> (not res!1065416) (not e!868081))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1558422 (= res!1065416 (and (not (= newKey!105 otherKey!50)) (or (not ((_ is Cons!36307) l!1177)) (= (_1!12474 (h!37771 l!1177)) otherKey!50))))))

(declare-fun b!1558423 () Bool)

(assert (=> b!1558423 (= e!868081 false)))

(declare-fun newValue!105 () B!2324)

(declare-fun lt!671272 () Bool)

(declare-fun containsKey!806 (List!36311 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!547 (List!36311 (_ BitVec 64) B!2324) List!36311)

(assert (=> b!1558423 (= lt!671272 (containsKey!806 (insertStrictlySorted!547 l!1177 newKey!105 newValue!105) otherKey!50))))

(declare-fun b!1558424 () Bool)

(declare-fun tp!112362 () Bool)

(assert (=> b!1558424 (= e!868082 (and tp_is_empty!38335 tp!112362))))

(assert (= (and start!133254 res!1065417) b!1558422))

(assert (= (and b!1558422 res!1065416) b!1558423))

(assert (= (and start!133254 ((_ is Cons!36307) l!1177)) b!1558424))

(declare-fun m!1435991 () Bool)

(assert (=> start!133254 m!1435991))

(declare-fun m!1435993 () Bool)

(assert (=> b!1558423 m!1435993))

(assert (=> b!1558423 m!1435993))

(declare-fun m!1435995 () Bool)

(assert (=> b!1558423 m!1435995))

(check-sat (not start!133254) (not b!1558423) (not b!1558424) tp_is_empty!38335)
(check-sat)
