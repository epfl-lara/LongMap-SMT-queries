; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133224 () Bool)

(assert start!133224)

(declare-fun res!1065305 () Bool)

(declare-fun e!867935 () Bool)

(assert (=> start!133224 (=> (not res!1065305) (not e!867935))))

(declare-datatypes ((B!2312 0))(
  ( (B!2313 (val!19242 Int)) )
))
(declare-datatypes ((tuple2!24914 0))(
  ( (tuple2!24915 (_1!12468 (_ BitVec 64)) (_2!12468 B!2312)) )
))
(declare-datatypes ((List!36305 0))(
  ( (Nil!36302) (Cons!36301 (h!37765 tuple2!24914) (t!51018 List!36305)) )
))
(declare-fun l!1177 () List!36305)

(declare-fun isStrictlySorted!916 (List!36305) Bool)

(assert (=> start!133224 (= res!1065305 (isStrictlySorted!916 l!1177))))

(assert (=> start!133224 e!867935))

(declare-fun e!867934 () Bool)

(assert (=> start!133224 e!867934))

(assert (=> start!133224 true))

(declare-fun tp_is_empty!38323 () Bool)

(assert (=> start!133224 tp_is_empty!38323))

(declare-fun b!1558206 () Bool)

(declare-fun res!1065306 () Bool)

(assert (=> b!1558206 (=> (not res!1065306) (not e!867935))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1558206 (= res!1065306 (and (not (= newKey!105 otherKey!50)) (or (not ((_ is Cons!36301) l!1177)) (= (_1!12468 (h!37765 l!1177)) otherKey!50))))))

(declare-fun b!1558207 () Bool)

(assert (=> b!1558207 (= e!867935 false)))

(declare-fun newValue!105 () B!2312)

(declare-fun lt!671245 () Bool)

(declare-fun containsKey!800 (List!36305 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!541 (List!36305 (_ BitVec 64) B!2312) List!36305)

(assert (=> b!1558207 (= lt!671245 (containsKey!800 (insertStrictlySorted!541 l!1177 newKey!105 newValue!105) otherKey!50))))

(declare-fun b!1558208 () Bool)

(declare-fun tp!112335 () Bool)

(assert (=> b!1558208 (= e!867934 (and tp_is_empty!38323 tp!112335))))

(assert (= (and start!133224 res!1065305) b!1558206))

(assert (= (and b!1558206 res!1065306) b!1558207))

(assert (= (and start!133224 ((_ is Cons!36301) l!1177)) b!1558208))

(declare-fun m!1435889 () Bool)

(assert (=> start!133224 m!1435889))

(declare-fun m!1435891 () Bool)

(assert (=> b!1558207 m!1435891))

(assert (=> b!1558207 m!1435891))

(declare-fun m!1435893 () Bool)

(assert (=> b!1558207 m!1435893))

(check-sat (not b!1558207) (not start!133224) (not b!1558208) tp_is_empty!38323)
(check-sat)
