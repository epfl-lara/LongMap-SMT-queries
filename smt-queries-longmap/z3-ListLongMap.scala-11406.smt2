; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132762 () Bool)

(assert start!132762)

(declare-fun res!1064316 () Bool)

(declare-fun e!866228 () Bool)

(assert (=> start!132762 (=> (not res!1064316) (not e!866228))))

(declare-datatypes ((B!2312 0))(
  ( (B!2313 (val!19242 Int)) )
))
(declare-datatypes ((tuple2!24932 0))(
  ( (tuple2!24933 (_1!12477 (_ BitVec 64)) (_2!12477 B!2312)) )
))
(declare-datatypes ((List!36321 0))(
  ( (Nil!36318) (Cons!36317 (h!37764 tuple2!24932) (t!51034 List!36321)) )
))
(declare-fun l!1177 () List!36321)

(declare-fun isStrictlySorted!927 (List!36321) Bool)

(assert (=> start!132762 (= res!1064316 (isStrictlySorted!927 l!1177))))

(assert (=> start!132762 e!866228))

(declare-fun e!866227 () Bool)

(assert (=> start!132762 e!866227))

(assert (=> start!132762 true))

(declare-fun tp_is_empty!38323 () Bool)

(assert (=> start!132762 tp_is_empty!38323))

(declare-fun b!1555457 () Bool)

(declare-fun res!1064317 () Bool)

(assert (=> b!1555457 (=> (not res!1064317) (not e!866228))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1555457 (= res!1064317 (and (not (= newKey!105 otherKey!50)) (or (not ((_ is Cons!36317) l!1177)) (= (_1!12477 (h!37764 l!1177)) otherKey!50))))))

(declare-fun b!1555458 () Bool)

(assert (=> b!1555458 (= e!866228 false)))

(declare-fun newValue!105 () B!2312)

(declare-fun lt!670051 () Bool)

(declare-fun containsKey!798 (List!36321 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!541 (List!36321 (_ BitVec 64) B!2312) List!36321)

(assert (=> b!1555458 (= lt!670051 (containsKey!798 (insertStrictlySorted!541 l!1177 newKey!105 newValue!105) otherKey!50))))

(declare-fun b!1555459 () Bool)

(declare-fun tp!112336 () Bool)

(assert (=> b!1555459 (= e!866227 (and tp_is_empty!38323 tp!112336))))

(assert (= (and start!132762 res!1064316) b!1555457))

(assert (= (and b!1555457 res!1064317) b!1555458))

(assert (= (and start!132762 ((_ is Cons!36317) l!1177)) b!1555459))

(declare-fun m!1432739 () Bool)

(assert (=> start!132762 m!1432739))

(declare-fun m!1432741 () Bool)

(assert (=> b!1555458 m!1432741))

(assert (=> b!1555458 m!1432741))

(declare-fun m!1432743 () Bool)

(assert (=> b!1555458 m!1432743))

(check-sat (not b!1555458) (not start!132762) (not b!1555459) tp_is_empty!38323)
(check-sat)
