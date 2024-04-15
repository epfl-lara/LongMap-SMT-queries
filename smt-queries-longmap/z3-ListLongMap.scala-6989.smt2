; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88598 () Bool)

(assert start!88598)

(declare-fun b!1018160 () Bool)

(declare-fun e!572873 () Bool)

(assert (=> b!1018160 (= e!572873 (not true))))

(declare-datatypes ((B!1640 0))(
  ( (B!1641 (val!11904 Int)) )
))
(declare-datatypes ((tuple2!15434 0))(
  ( (tuple2!15435 (_1!7728 (_ BitVec 64)) (_2!7728 B!1640)) )
))
(declare-datatypes ((List!21627 0))(
  ( (Nil!21624) (Cons!21623 (h!22821 tuple2!15434) (t!30619 List!21627)) )
))
(declare-fun l!996 () List!21627)

(declare-fun key!261 () (_ BitVec 64))

(declare-fun value!172 () B!1640)

(declare-fun length!41 (List!21627) Int)

(declare-fun insertStrictlySorted!339 (List!21627 (_ BitVec 64) B!1640) List!21627)

(assert (=> b!1018160 (= (length!41 (insertStrictlySorted!339 (t!30619 l!996) key!261 value!172)) (length!41 (t!30619 l!996)))))

(declare-datatypes ((Unit!33177 0))(
  ( (Unit!33178) )
))
(declare-fun lt!449319 () Unit!33177)

(declare-fun lemmaAddExistingKeyPreservesSize!1 (List!21627 (_ BitVec 64) B!1640) Unit!33177)

(assert (=> b!1018160 (= lt!449319 (lemmaAddExistingKeyPreservesSize!1 (t!30619 l!996) key!261 value!172))))

(declare-fun b!1018161 () Bool)

(declare-fun e!572872 () Bool)

(assert (=> b!1018161 (= e!572872 e!572873)))

(declare-fun res!682765 () Bool)

(assert (=> b!1018161 (=> (not res!682765) (not e!572873))))

(get-info :version)

(assert (=> b!1018161 (= res!682765 (and ((_ is Cons!21623) l!996) (bvslt (_1!7728 (h!22821 l!996)) key!261)))))

(declare-fun lt!449320 () List!21627)

(assert (=> b!1018161 (= lt!449320 (insertStrictlySorted!339 l!996 key!261 value!172))))

(declare-fun b!1018163 () Bool)

(declare-fun res!682762 () Bool)

(assert (=> b!1018163 (=> (not res!682762) (not e!572873))))

(declare-fun isStrictlySorted!653 (List!21627) Bool)

(assert (=> b!1018163 (= res!682762 (isStrictlySorted!653 (t!30619 l!996)))))

(declare-fun res!682763 () Bool)

(assert (=> start!88598 (=> (not res!682763) (not e!572872))))

(assert (=> start!88598 (= res!682763 (isStrictlySorted!653 l!996))))

(assert (=> start!88598 e!572872))

(declare-fun e!572871 () Bool)

(assert (=> start!88598 e!572871))

(assert (=> start!88598 true))

(declare-fun tp_is_empty!23707 () Bool)

(assert (=> start!88598 tp_is_empty!23707))

(declare-fun b!1018162 () Bool)

(declare-fun res!682764 () Bool)

(assert (=> b!1018162 (=> (not res!682764) (not e!572873))))

(declare-fun containsKey!517 (List!21627 (_ BitVec 64)) Bool)

(assert (=> b!1018162 (= res!682764 (containsKey!517 (t!30619 l!996) key!261))))

(declare-fun b!1018164 () Bool)

(declare-fun res!682761 () Bool)

(assert (=> b!1018164 (=> (not res!682761) (not e!572872))))

(assert (=> b!1018164 (= res!682761 (containsKey!517 l!996 key!261))))

(declare-fun b!1018165 () Bool)

(declare-fun tp!71029 () Bool)

(assert (=> b!1018165 (= e!572871 (and tp_is_empty!23707 tp!71029))))

(assert (= (and start!88598 res!682763) b!1018164))

(assert (= (and b!1018164 res!682761) b!1018161))

(assert (= (and b!1018161 res!682765) b!1018163))

(assert (= (and b!1018163 res!682762) b!1018162))

(assert (= (and b!1018162 res!682764) b!1018160))

(assert (= (and start!88598 ((_ is Cons!21623) l!996)) b!1018165))

(declare-fun m!938593 () Bool)

(assert (=> b!1018161 m!938593))

(declare-fun m!938595 () Bool)

(assert (=> b!1018162 m!938595))

(declare-fun m!938597 () Bool)

(assert (=> b!1018163 m!938597))

(declare-fun m!938599 () Bool)

(assert (=> b!1018164 m!938599))

(declare-fun m!938601 () Bool)

(assert (=> b!1018160 m!938601))

(assert (=> b!1018160 m!938601))

(declare-fun m!938603 () Bool)

(assert (=> b!1018160 m!938603))

(declare-fun m!938605 () Bool)

(assert (=> b!1018160 m!938605))

(declare-fun m!938607 () Bool)

(assert (=> b!1018160 m!938607))

(declare-fun m!938609 () Bool)

(assert (=> start!88598 m!938609))

(check-sat (not b!1018165) (not b!1018163) (not start!88598) (not b!1018162) tp_is_empty!23707 (not b!1018160) (not b!1018164) (not b!1018161))
(check-sat)
