; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132844 () Bool)

(assert start!132844)

(declare-fun res!1064563 () Bool)

(declare-fun e!866578 () Bool)

(assert (=> start!132844 (=> (not res!1064563) (not e!866578))))

(declare-datatypes ((B!2326 0))(
  ( (B!2327 (val!19249 Int)) )
))
(declare-datatypes ((tuple2!24874 0))(
  ( (tuple2!24875 (_1!12448 (_ BitVec 64)) (_2!12448 B!2326)) )
))
(declare-datatypes ((List!36283 0))(
  ( (Nil!36280) (Cons!36279 (h!37725 tuple2!24874) (t!51004 List!36283)) )
))
(declare-fun l!1177 () List!36283)

(declare-fun isStrictlySorted!936 (List!36283) Bool)

(assert (=> start!132844 (= res!1064563 (isStrictlySorted!936 l!1177))))

(assert (=> start!132844 e!866578))

(declare-fun e!866579 () Bool)

(assert (=> start!132844 e!866579))

(assert (=> start!132844 true))

(declare-fun tp_is_empty!38337 () Bool)

(assert (=> start!132844 tp_is_empty!38337))

(declare-fun b!1555995 () Bool)

(declare-fun res!1064562 () Bool)

(assert (=> b!1555995 (=> (not res!1064562) (not e!866578))))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-fun newKey!105 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1555995 (= res!1064562 (and (not (= newKey!105 otherKey!50)) (or (not ((_ is Cons!36279) l!1177)) (= (_1!12448 (h!37725 l!1177)) otherKey!50))))))

(declare-fun b!1555996 () Bool)

(assert (=> b!1555996 (= e!866578 false)))

(declare-fun lt!670367 () Bool)

(declare-fun newValue!105 () B!2326)

(declare-fun containsKey!807 (List!36283 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!547 (List!36283 (_ BitVec 64) B!2326) List!36283)

(assert (=> b!1555996 (= lt!670367 (containsKey!807 (insertStrictlySorted!547 l!1177 newKey!105 newValue!105) otherKey!50))))

(declare-fun b!1555997 () Bool)

(declare-fun tp!112365 () Bool)

(assert (=> b!1555997 (= e!866579 (and tp_is_empty!38337 tp!112365))))

(assert (= (and start!132844 res!1064563) b!1555995))

(assert (= (and b!1555995 res!1064562) b!1555996))

(assert (= (and start!132844 ((_ is Cons!36279) l!1177)) b!1555997))

(declare-fun m!1433739 () Bool)

(assert (=> start!132844 m!1433739))

(declare-fun m!1433741 () Bool)

(assert (=> b!1555996 m!1433741))

(assert (=> b!1555996 m!1433741))

(declare-fun m!1433743 () Bool)

(assert (=> b!1555996 m!1433743))

(check-sat (not b!1555996) (not start!132844) (not b!1555997) tp_is_empty!38337)
(check-sat)
