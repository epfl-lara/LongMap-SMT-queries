; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133114 () Bool)

(assert start!133114)

(declare-fun b!1557651 () Bool)

(declare-fun res!1065397 () Bool)

(declare-fun e!867679 () Bool)

(assert (=> b!1557651 (=> (not res!1065397) (not e!867679))))

(declare-datatypes ((B!2398 0))(
  ( (B!2399 (val!19285 Int)) )
))
(declare-datatypes ((tuple2!24946 0))(
  ( (tuple2!24947 (_1!12484 (_ BitVec 64)) (_2!12484 B!2398)) )
))
(declare-datatypes ((List!36319 0))(
  ( (Nil!36316) (Cons!36315 (h!37761 tuple2!24946) (t!51046 List!36319)) )
))
(declare-fun l!1292 () List!36319)

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun containsKey!825 (List!36319 (_ BitVec 64)) Bool)

(assert (=> b!1557651 (= res!1065397 (containsKey!825 l!1292 otherKey!62))))

(declare-fun b!1557652 () Bool)

(declare-fun res!1065399 () Bool)

(assert (=> b!1557652 (=> (not res!1065399) (not e!867679))))

(declare-fun isStrictlySorted!962 (List!36319) Bool)

(assert (=> b!1557652 (= res!1065399 (isStrictlySorted!962 (t!51046 l!1292)))))

(declare-fun b!1557653 () Bool)

(declare-fun e!867680 () Bool)

(declare-fun tp_is_empty!38403 () Bool)

(declare-fun tp!112551 () Bool)

(assert (=> b!1557653 (= e!867680 (and tp_is_empty!38403 tp!112551))))

(declare-fun res!1065396 () Bool)

(assert (=> start!133114 (=> (not res!1065396) (not e!867679))))

(assert (=> start!133114 (= res!1065396 (isStrictlySorted!962 l!1292))))

(assert (=> start!133114 e!867679))

(assert (=> start!133114 e!867680))

(assert (=> start!133114 true))

(assert (=> start!133114 tp_is_empty!38403))

(declare-fun b!1557654 () Bool)

(declare-fun res!1065398 () Bool)

(assert (=> b!1557654 (=> (not res!1065398) (not e!867679))))

(assert (=> b!1557654 (= res!1065398 (containsKey!825 (t!51046 l!1292) otherKey!62))))

(declare-fun b!1557655 () Bool)

(declare-fun res!1065400 () Bool)

(assert (=> b!1557655 (=> (not res!1065400) (not e!867679))))

(declare-fun newKey!135 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1557655 (= res!1065400 (and (not (= otherKey!62 newKey!135)) ((_ is Cons!36315) l!1292) (not (= (_1!12484 (h!37761 l!1292)) otherKey!62))))))

(declare-fun b!1557656 () Bool)

(assert (=> b!1557656 (= e!867679 (not true))))

(declare-fun newValue!135 () B!2398)

(declare-fun insertStrictlySorted!562 (List!36319 (_ BitVec 64) B!2398) List!36319)

(assert (=> b!1557656 (containsKey!825 (insertStrictlySorted!562 (t!51046 l!1292) newKey!135 newValue!135) otherKey!62)))

(declare-datatypes ((Unit!51878 0))(
  ( (Unit!51879) )
))
(declare-fun lt!670721 () Unit!51878)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!5 (List!36319 (_ BitVec 64) B!2398 (_ BitVec 64)) Unit!51878)

(assert (=> b!1557656 (= lt!670721 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!5 (t!51046 l!1292) newKey!135 newValue!135 otherKey!62))))

(assert (= (and start!133114 res!1065396) b!1557651))

(assert (= (and b!1557651 res!1065397) b!1557655))

(assert (= (and b!1557655 res!1065400) b!1557652))

(assert (= (and b!1557652 res!1065399) b!1557654))

(assert (= (and b!1557654 res!1065398) b!1557656))

(assert (= (and start!133114 ((_ is Cons!36315) l!1292)) b!1557653))

(declare-fun m!1434731 () Bool)

(assert (=> start!133114 m!1434731))

(declare-fun m!1434733 () Bool)

(assert (=> b!1557652 m!1434733))

(declare-fun m!1434735 () Bool)

(assert (=> b!1557651 m!1434735))

(declare-fun m!1434737 () Bool)

(assert (=> b!1557654 m!1434737))

(declare-fun m!1434739 () Bool)

(assert (=> b!1557656 m!1434739))

(assert (=> b!1557656 m!1434739))

(declare-fun m!1434741 () Bool)

(assert (=> b!1557656 m!1434741))

(declare-fun m!1434743 () Bool)

(assert (=> b!1557656 m!1434743))

(check-sat (not start!133114) (not b!1557651) (not b!1557652) (not b!1557653) (not b!1557654) (not b!1557656) tp_is_empty!38403)
(check-sat)
