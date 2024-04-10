; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132814 () Bool)

(assert start!132814)

(declare-fun res!1064451 () Bool)

(declare-fun e!866431 () Bool)

(assert (=> start!132814 (=> (not res!1064451) (not e!866431))))

(declare-datatypes ((B!2314 0))(
  ( (B!2315 (val!19243 Int)) )
))
(declare-datatypes ((tuple2!24862 0))(
  ( (tuple2!24863 (_1!12442 (_ BitVec 64)) (_2!12442 B!2314)) )
))
(declare-datatypes ((List!36277 0))(
  ( (Nil!36274) (Cons!36273 (h!37719 tuple2!24862) (t!50998 List!36277)) )
))
(declare-fun l!1177 () List!36277)

(declare-fun isStrictlySorted!930 (List!36277) Bool)

(assert (=> start!132814 (= res!1064451 (isStrictlySorted!930 l!1177))))

(assert (=> start!132814 e!866431))

(declare-fun e!866432 () Bool)

(assert (=> start!132814 e!866432))

(assert (=> start!132814 true))

(declare-fun tp_is_empty!38325 () Bool)

(assert (=> start!132814 tp_is_empty!38325))

(declare-fun b!1555779 () Bool)

(declare-fun res!1064452 () Bool)

(assert (=> b!1555779 (=> (not res!1064452) (not e!866431))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1555779 (= res!1064452 (and (not (= newKey!105 otherKey!50)) (or (not ((_ is Cons!36273) l!1177)) (= (_1!12442 (h!37719 l!1177)) otherKey!50))))))

(declare-fun b!1555780 () Bool)

(assert (=> b!1555780 (= e!866431 false)))

(declare-fun newValue!105 () B!2314)

(declare-fun lt!670340 () Bool)

(declare-fun containsKey!801 (List!36277 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!541 (List!36277 (_ BitVec 64) B!2314) List!36277)

(assert (=> b!1555780 (= lt!670340 (containsKey!801 (insertStrictlySorted!541 l!1177 newKey!105 newValue!105) otherKey!50))))

(declare-fun b!1555781 () Bool)

(declare-fun tp!112338 () Bool)

(assert (=> b!1555781 (= e!866432 (and tp_is_empty!38325 tp!112338))))

(assert (= (and start!132814 res!1064451) b!1555779))

(assert (= (and b!1555779 res!1064452) b!1555780))

(assert (= (and start!132814 ((_ is Cons!36273) l!1177)) b!1555781))

(declare-fun m!1433637 () Bool)

(assert (=> start!132814 m!1433637))

(declare-fun m!1433639 () Bool)

(assert (=> b!1555780 m!1433639))

(assert (=> b!1555780 m!1433639))

(declare-fun m!1433641 () Bool)

(assert (=> b!1555780 m!1433641))

(check-sat (not b!1555780) (not start!132814) (not b!1555781) tp_is_empty!38325)
(check-sat)
