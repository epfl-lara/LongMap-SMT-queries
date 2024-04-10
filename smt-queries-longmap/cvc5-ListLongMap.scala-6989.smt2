; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88600 () Bool)

(assert start!88600)

(declare-fun b!1018305 () Bool)

(declare-fun e!572961 () Bool)

(declare-fun e!572959 () Bool)

(assert (=> b!1018305 (= e!572961 e!572959)))

(declare-fun res!682830 () Bool)

(assert (=> b!1018305 (=> (not res!682830) (not e!572959))))

(declare-datatypes ((B!1640 0))(
  ( (B!1641 (val!11904 Int)) )
))
(declare-datatypes ((tuple2!15354 0))(
  ( (tuple2!15355 (_1!7688 (_ BitVec 64)) (_2!7688 B!1640)) )
))
(declare-datatypes ((List!21592 0))(
  ( (Nil!21589) (Cons!21588 (h!22786 tuple2!15354) (t!30593 List!21592)) )
))
(declare-fun l!996 () List!21592)

(declare-fun key!261 () (_ BitVec 64))

(assert (=> b!1018305 (= res!682830 (and (is-Cons!21588 l!996) (bvslt (_1!7688 (h!22786 l!996)) key!261)))))

(declare-fun value!172 () B!1640)

(declare-fun lt!449519 () List!21592)

(declare-fun insertStrictlySorted!338 (List!21592 (_ BitVec 64) B!1640) List!21592)

(assert (=> b!1018305 (= lt!449519 (insertStrictlySorted!338 l!996 key!261 value!172))))

(declare-fun b!1018306 () Bool)

(declare-fun e!572960 () Bool)

(declare-fun tp_is_empty!23707 () Bool)

(declare-fun tp!71029 () Bool)

(assert (=> b!1018306 (= e!572960 (and tp_is_empty!23707 tp!71029))))

(declare-fun b!1018307 () Bool)

(declare-fun res!682828 () Bool)

(assert (=> b!1018307 (=> (not res!682828) (not e!572959))))

(declare-fun isStrictlySorted!657 (List!21592) Bool)

(assert (=> b!1018307 (= res!682828 (isStrictlySorted!657 (t!30593 l!996)))))

(declare-fun b!1018308 () Bool)

(declare-fun res!682831 () Bool)

(assert (=> b!1018308 (=> (not res!682831) (not e!572961))))

(declare-fun containsKey!517 (List!21592 (_ BitVec 64)) Bool)

(assert (=> b!1018308 (= res!682831 (containsKey!517 l!996 key!261))))

(declare-fun res!682829 () Bool)

(assert (=> start!88600 (=> (not res!682829) (not e!572961))))

(assert (=> start!88600 (= res!682829 (isStrictlySorted!657 l!996))))

(assert (=> start!88600 e!572961))

(assert (=> start!88600 e!572960))

(assert (=> start!88600 true))

(assert (=> start!88600 tp_is_empty!23707))

(declare-fun b!1018309 () Bool)

(declare-fun res!682832 () Bool)

(assert (=> b!1018309 (=> (not res!682832) (not e!572959))))

(assert (=> b!1018309 (= res!682832 (containsKey!517 (t!30593 l!996) key!261))))

(declare-fun b!1018310 () Bool)

(assert (=> b!1018310 (= e!572959 (not true))))

(declare-fun length!41 (List!21592) Int)

(assert (=> b!1018310 (= (length!41 (insertStrictlySorted!338 (t!30593 l!996) key!261 value!172)) (length!41 (t!30593 l!996)))))

(declare-datatypes ((Unit!33281 0))(
  ( (Unit!33282) )
))
(declare-fun lt!449520 () Unit!33281)

(declare-fun lemmaAddExistingKeyPreservesSize!1 (List!21592 (_ BitVec 64) B!1640) Unit!33281)

(assert (=> b!1018310 (= lt!449520 (lemmaAddExistingKeyPreservesSize!1 (t!30593 l!996) key!261 value!172))))

(assert (= (and start!88600 res!682829) b!1018308))

(assert (= (and b!1018308 res!682831) b!1018305))

(assert (= (and b!1018305 res!682830) b!1018307))

(assert (= (and b!1018307 res!682828) b!1018309))

(assert (= (and b!1018309 res!682832) b!1018310))

(assert (= (and start!88600 (is-Cons!21588 l!996)) b!1018306))

(declare-fun m!939211 () Bool)

(assert (=> b!1018307 m!939211))

(declare-fun m!939213 () Bool)

(assert (=> start!88600 m!939213))

(declare-fun m!939215 () Bool)

(assert (=> b!1018308 m!939215))

(declare-fun m!939217 () Bool)

(assert (=> b!1018310 m!939217))

(assert (=> b!1018310 m!939217))

(declare-fun m!939219 () Bool)

(assert (=> b!1018310 m!939219))

(declare-fun m!939221 () Bool)

(assert (=> b!1018310 m!939221))

(declare-fun m!939223 () Bool)

(assert (=> b!1018310 m!939223))

(declare-fun m!939225 () Bool)

(assert (=> b!1018309 m!939225))

(declare-fun m!939227 () Bool)

(assert (=> b!1018305 m!939227))

(push 1)

