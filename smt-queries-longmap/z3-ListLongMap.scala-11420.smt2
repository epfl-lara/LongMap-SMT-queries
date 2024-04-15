; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133062 () Bool)

(assert start!133062)

(declare-fun b!1557320 () Bool)

(declare-fun e!867475 () Bool)

(assert (=> b!1557320 (= e!867475 (not true))))

(declare-fun newKey!135 () (_ BitVec 64))

(declare-datatypes ((B!2396 0))(
  ( (B!2397 (val!19284 Int)) )
))
(declare-datatypes ((tuple2!25016 0))(
  ( (tuple2!25017 (_1!12519 (_ BitVec 64)) (_2!12519 B!2396)) )
))
(declare-datatypes ((List!36363 0))(
  ( (Nil!36360) (Cons!36359 (h!37806 tuple2!25016) (t!51082 List!36363)) )
))
(declare-fun l!1292 () List!36363)

(declare-fun newValue!135 () B!2396)

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun containsKey!822 (List!36363 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!562 (List!36363 (_ BitVec 64) B!2396) List!36363)

(assert (=> b!1557320 (containsKey!822 (insertStrictlySorted!562 (t!51082 l!1292) newKey!135 newValue!135) otherKey!62)))

(declare-datatypes ((Unit!51692 0))(
  ( (Unit!51693) )
))
(declare-fun lt!670432 () Unit!51692)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!4 (List!36363 (_ BitVec 64) B!2396 (_ BitVec 64)) Unit!51692)

(assert (=> b!1557320 (= lt!670432 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!4 (t!51082 l!1292) newKey!135 newValue!135 otherKey!62))))

(declare-fun b!1557321 () Bool)

(declare-fun res!1065256 () Bool)

(assert (=> b!1557321 (=> (not res!1065256) (not e!867475))))

(assert (=> b!1557321 (= res!1065256 (containsKey!822 (t!51082 l!1292) otherKey!62))))

(declare-fun b!1557322 () Bool)

(declare-fun res!1065253 () Bool)

(assert (=> b!1557322 (=> (not res!1065253) (not e!867475))))

(declare-fun isStrictlySorted!960 (List!36363) Bool)

(assert (=> b!1557322 (= res!1065253 (isStrictlySorted!960 (t!51082 l!1292)))))

(declare-fun res!1065255 () Bool)

(assert (=> start!133062 (=> (not res!1065255) (not e!867475))))

(assert (=> start!133062 (= res!1065255 (isStrictlySorted!960 l!1292))))

(assert (=> start!133062 e!867475))

(declare-fun e!867476 () Bool)

(assert (=> start!133062 e!867476))

(assert (=> start!133062 true))

(declare-fun tp_is_empty!38401 () Bool)

(assert (=> start!133062 tp_is_empty!38401))

(declare-fun b!1557323 () Bool)

(declare-fun res!1065254 () Bool)

(assert (=> b!1557323 (=> (not res!1065254) (not e!867475))))

(assert (=> b!1557323 (= res!1065254 (containsKey!822 l!1292 otherKey!62))))

(declare-fun b!1557324 () Bool)

(declare-fun res!1065252 () Bool)

(assert (=> b!1557324 (=> (not res!1065252) (not e!867475))))

(get-info :version)

(assert (=> b!1557324 (= res!1065252 (and (not (= otherKey!62 newKey!135)) ((_ is Cons!36359) l!1292) (not (= (_1!12519 (h!37806 l!1292)) otherKey!62))))))

(declare-fun b!1557325 () Bool)

(declare-fun tp!112549 () Bool)

(assert (=> b!1557325 (= e!867476 (and tp_is_empty!38401 tp!112549))))

(assert (= (and start!133062 res!1065255) b!1557323))

(assert (= (and b!1557323 res!1065254) b!1557324))

(assert (= (and b!1557324 res!1065252) b!1557322))

(assert (= (and b!1557322 res!1065253) b!1557321))

(assert (= (and b!1557321 res!1065256) b!1557320))

(assert (= (and start!133062 ((_ is Cons!36359) l!1292)) b!1557325))

(declare-fun m!1433825 () Bool)

(assert (=> b!1557321 m!1433825))

(declare-fun m!1433827 () Bool)

(assert (=> b!1557320 m!1433827))

(assert (=> b!1557320 m!1433827))

(declare-fun m!1433829 () Bool)

(assert (=> b!1557320 m!1433829))

(declare-fun m!1433831 () Bool)

(assert (=> b!1557320 m!1433831))

(declare-fun m!1433833 () Bool)

(assert (=> b!1557322 m!1433833))

(declare-fun m!1433835 () Bool)

(assert (=> start!133062 m!1433835))

(declare-fun m!1433837 () Bool)

(assert (=> b!1557323 m!1433837))

(check-sat (not b!1557320) (not b!1557322) tp_is_empty!38401 (not b!1557325) (not start!133062) (not b!1557321) (not b!1557323))
(check-sat)
