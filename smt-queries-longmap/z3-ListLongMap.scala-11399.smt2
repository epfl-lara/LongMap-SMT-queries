; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133140 () Bool)

(assert start!133140)

(declare-fun b!1557580 () Bool)

(declare-fun e!867529 () Bool)

(assert (=> b!1557580 (= e!867529 (not true))))

(declare-fun e!867528 () Bool)

(assert (=> b!1557580 e!867528))

(declare-fun res!1064991 () Bool)

(assert (=> b!1557580 (=> (not res!1064991) (not e!867528))))

(declare-datatypes ((B!2270 0))(
  ( (B!2271 (val!19221 Int)) )
))
(declare-datatypes ((tuple2!24872 0))(
  ( (tuple2!24873 (_1!12447 (_ BitVec 64)) (_2!12447 B!2270)) )
))
(declare-datatypes ((List!36284 0))(
  ( (Nil!36281) (Cons!36280 (h!37744 tuple2!24872) (t!50997 List!36284)) )
))
(declare-fun lt!671119 () List!36284)

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-fun l!1177 () List!36284)

(declare-fun containsKey!785 (List!36284 (_ BitVec 64)) Bool)

(assert (=> b!1557580 (= res!1064991 (= (containsKey!785 lt!671119 otherKey!50) (containsKey!785 (t!50997 l!1177) otherKey!50)))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun newValue!105 () B!2270)

(declare-fun insertStrictlySorted!526 (List!36284 (_ BitVec 64) B!2270) List!36284)

(assert (=> b!1557580 (= lt!671119 (insertStrictlySorted!526 (t!50997 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51725 0))(
  ( (Unit!51726) )
))
(declare-fun lt!671118 () Unit!51725)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!22 (List!36284 (_ BitVec 64) B!2270 (_ BitVec 64)) Unit!51725)

(assert (=> b!1557580 (= lt!671118 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!22 (t!50997 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1557581 () Bool)

(declare-fun res!1064988 () Bool)

(assert (=> b!1557581 (=> (not res!1064988) (not e!867529))))

(declare-fun isStrictlySorted!901 (List!36284) Bool)

(assert (=> b!1557581 (= res!1064988 (isStrictlySorted!901 (t!50997 l!1177)))))

(declare-fun b!1557582 () Bool)

(declare-fun res!1064989 () Bool)

(assert (=> b!1557582 (=> (not res!1064989) (not e!867529))))

(get-info :version)

(assert (=> b!1557582 (= res!1064989 (and (not (= newKey!105 otherKey!50)) ((_ is Cons!36280) l!1177) (not (= (_1!12447 (h!37744 l!1177)) otherKey!50))))))

(declare-fun b!1557583 () Bool)

(declare-fun e!867530 () Bool)

(declare-fun tp_is_empty!38281 () Bool)

(declare-fun tp!112254 () Bool)

(assert (=> b!1557583 (= e!867530 (and tp_is_empty!38281 tp!112254))))

(declare-fun b!1557584 () Bool)

(declare-datatypes ((Option!834 0))(
  ( (Some!833 (v!22015 B!2270)) (None!832) )
))
(declare-fun getValueByKey!759 (List!36284 (_ BitVec 64)) Option!834)

(assert (=> b!1557584 (= e!867528 (= (getValueByKey!759 lt!671119 otherKey!50) (getValueByKey!759 (t!50997 l!1177) otherKey!50)))))

(declare-fun res!1064990 () Bool)

(assert (=> start!133140 (=> (not res!1064990) (not e!867529))))

(assert (=> start!133140 (= res!1064990 (isStrictlySorted!901 l!1177))))

(assert (=> start!133140 e!867529))

(assert (=> start!133140 e!867530))

(assert (=> start!133140 true))

(assert (=> start!133140 tp_is_empty!38281))

(assert (= (and start!133140 res!1064990) b!1557582))

(assert (= (and b!1557582 res!1064989) b!1557581))

(assert (= (and b!1557581 res!1064988) b!1557580))

(assert (= (and b!1557580 res!1064991) b!1557584))

(assert (= (and start!133140 ((_ is Cons!36280) l!1177)) b!1557583))

(declare-fun m!1435475 () Bool)

(assert (=> b!1557580 m!1435475))

(declare-fun m!1435477 () Bool)

(assert (=> b!1557580 m!1435477))

(declare-fun m!1435479 () Bool)

(assert (=> b!1557580 m!1435479))

(declare-fun m!1435481 () Bool)

(assert (=> b!1557580 m!1435481))

(declare-fun m!1435483 () Bool)

(assert (=> b!1557581 m!1435483))

(declare-fun m!1435485 () Bool)

(assert (=> b!1557584 m!1435485))

(declare-fun m!1435487 () Bool)

(assert (=> b!1557584 m!1435487))

(declare-fun m!1435489 () Bool)

(assert (=> start!133140 m!1435489))

(check-sat (not b!1557580) (not b!1557583) tp_is_empty!38281 (not b!1557581) (not start!133140) (not b!1557584))
(check-sat)
