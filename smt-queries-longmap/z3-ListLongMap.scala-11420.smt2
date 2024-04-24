; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133524 () Bool)

(assert start!133524)

(declare-fun b!1560069 () Bool)

(declare-fun e!869182 () Bool)

(declare-fun tp_is_empty!38401 () Bool)

(declare-fun tp!112548 () Bool)

(assert (=> b!1560069 (= e!869182 (and tp_is_empty!38401 tp!112548))))

(declare-fun res!1066245 () Bool)

(declare-fun e!869183 () Bool)

(assert (=> start!133524 (=> (not res!1066245) (not e!869183))))

(declare-datatypes ((B!2396 0))(
  ( (B!2397 (val!19284 Int)) )
))
(declare-datatypes ((tuple2!24998 0))(
  ( (tuple2!24999 (_1!12510 (_ BitVec 64)) (_2!12510 B!2396)) )
))
(declare-datatypes ((List!36347 0))(
  ( (Nil!36344) (Cons!36343 (h!37807 tuple2!24998) (t!51066 List!36347)) )
))
(declare-fun l!1292 () List!36347)

(declare-fun isStrictlySorted!948 (List!36347) Bool)

(assert (=> start!133524 (= res!1066245 (isStrictlySorted!948 l!1292))))

(assert (=> start!133524 e!869183))

(assert (=> start!133524 e!869182))

(assert (=> start!133524 true))

(assert (=> start!133524 tp_is_empty!38401))

(declare-fun b!1560070 () Bool)

(declare-fun res!1066241 () Bool)

(assert (=> b!1560070 (=> (not res!1066241) (not e!869183))))

(assert (=> b!1560070 (= res!1066241 (isStrictlySorted!948 (t!51066 l!1292)))))

(declare-fun b!1560071 () Bool)

(assert (=> b!1560071 (= e!869183 (not true))))

(declare-fun newKey!135 () (_ BitVec 64))

(declare-fun newValue!135 () B!2396)

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun containsKey!824 (List!36347 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!562 (List!36347 (_ BitVec 64) B!2396) List!36347)

(assert (=> b!1560071 (containsKey!824 (insertStrictlySorted!562 (t!51066 l!1292) newKey!135 newValue!135) otherKey!62)))

(declare-datatypes ((Unit!51787 0))(
  ( (Unit!51788) )
))
(declare-fun lt!671626 () Unit!51787)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!4 (List!36347 (_ BitVec 64) B!2396 (_ BitVec 64)) Unit!51787)

(assert (=> b!1560071 (= lt!671626 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!4 (t!51066 l!1292) newKey!135 newValue!135 otherKey!62))))

(declare-fun b!1560072 () Bool)

(declare-fun res!1066243 () Bool)

(assert (=> b!1560072 (=> (not res!1066243) (not e!869183))))

(get-info :version)

(assert (=> b!1560072 (= res!1066243 (and (not (= otherKey!62 newKey!135)) ((_ is Cons!36343) l!1292) (not (= (_1!12510 (h!37807 l!1292)) otherKey!62))))))

(declare-fun b!1560073 () Bool)

(declare-fun res!1066242 () Bool)

(assert (=> b!1560073 (=> (not res!1066242) (not e!869183))))

(assert (=> b!1560073 (= res!1066242 (containsKey!824 l!1292 otherKey!62))))

(declare-fun b!1560074 () Bool)

(declare-fun res!1066244 () Bool)

(assert (=> b!1560074 (=> (not res!1066244) (not e!869183))))

(assert (=> b!1560074 (= res!1066244 (containsKey!824 (t!51066 l!1292) otherKey!62))))

(assert (= (and start!133524 res!1066245) b!1560073))

(assert (= (and b!1560073 res!1066242) b!1560072))

(assert (= (and b!1560072 res!1066243) b!1560070))

(assert (= (and b!1560070 res!1066241) b!1560074))

(assert (= (and b!1560074 res!1066244) b!1560071))

(assert (= (and start!133524 ((_ is Cons!36343) l!1292)) b!1560069))

(declare-fun m!1436975 () Bool)

(assert (=> start!133524 m!1436975))

(declare-fun m!1436977 () Bool)

(assert (=> b!1560073 m!1436977))

(declare-fun m!1436979 () Bool)

(assert (=> b!1560070 m!1436979))

(declare-fun m!1436981 () Bool)

(assert (=> b!1560071 m!1436981))

(assert (=> b!1560071 m!1436981))

(declare-fun m!1436983 () Bool)

(assert (=> b!1560071 m!1436983))

(declare-fun m!1436985 () Bool)

(assert (=> b!1560071 m!1436985))

(declare-fun m!1436987 () Bool)

(assert (=> b!1560074 m!1436987))

(check-sat tp_is_empty!38401 (not start!133524) (not b!1560070) (not b!1560071) (not b!1560073) (not b!1560069) (not b!1560074))
(check-sat)
