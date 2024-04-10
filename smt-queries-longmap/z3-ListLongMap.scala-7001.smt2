; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88902 () Bool)

(assert start!88902)

(declare-fun b!1020246 () Bool)

(declare-fun e!574238 () Bool)

(assert (=> b!1020246 (= e!574238 (not true))))

(declare-datatypes ((B!1714 0))(
  ( (B!1715 (val!11941 Int)) )
))
(declare-datatypes ((tuple2!15428 0))(
  ( (tuple2!15429 (_1!7725 (_ BitVec 64)) (_2!7725 B!1714)) )
))
(declare-datatypes ((List!21629 0))(
  ( (Nil!21626) (Cons!21625 (h!22823 tuple2!15428) (t!30639 List!21629)) )
))
(declare-fun l!1367 () List!21629)

(declare-fun key!393 () (_ BitVec 64))

(declare-fun containsKey!551 (List!21629 (_ BitVec 64)) Bool)

(assert (=> b!1020246 (containsKey!551 (t!30639 l!1367) key!393)))

(declare-fun value!188 () B!1714)

(declare-datatypes ((Unit!33295 0))(
  ( (Unit!33296) )
))
(declare-fun lt!449816 () Unit!33295)

(declare-fun lemmaContainsTupleThenContainsKey!11 (List!21629 (_ BitVec 64) B!1714) Unit!33295)

(assert (=> b!1020246 (= lt!449816 (lemmaContainsTupleThenContainsKey!11 (t!30639 l!1367) key!393 value!188))))

(declare-fun res!683829 () Bool)

(declare-fun e!574237 () Bool)

(assert (=> start!88902 (=> (not res!683829) (not e!574237))))

(declare-fun isStrictlySorted!694 (List!21629) Bool)

(assert (=> start!88902 (= res!683829 (isStrictlySorted!694 l!1367))))

(assert (=> start!88902 e!574237))

(declare-fun e!574239 () Bool)

(assert (=> start!88902 e!574239))

(assert (=> start!88902 true))

(declare-fun tp_is_empty!23781 () Bool)

(assert (=> start!88902 tp_is_empty!23781))

(declare-fun b!1020247 () Bool)

(declare-fun res!683827 () Bool)

(assert (=> b!1020247 (=> (not res!683827) (not e!574238))))

(declare-fun lt!449817 () tuple2!15428)

(declare-fun contains!5920 (List!21629 tuple2!15428) Bool)

(assert (=> b!1020247 (= res!683827 (contains!5920 (t!30639 l!1367) lt!449817))))

(declare-fun b!1020248 () Bool)

(declare-fun tp!71221 () Bool)

(assert (=> b!1020248 (= e!574239 (and tp_is_empty!23781 tp!71221))))

(declare-fun b!1020249 () Bool)

(assert (=> b!1020249 (= e!574237 e!574238)))

(declare-fun res!683830 () Bool)

(assert (=> b!1020249 (=> (not res!683830) (not e!574238))))

(assert (=> b!1020249 (= res!683830 (contains!5920 l!1367 lt!449817))))

(assert (=> b!1020249 (= lt!449817 (tuple2!15429 key!393 value!188))))

(declare-fun b!1020250 () Bool)

(declare-fun res!683831 () Bool)

(assert (=> b!1020250 (=> (not res!683831) (not e!574238))))

(assert (=> b!1020250 (= res!683831 (isStrictlySorted!694 (t!30639 l!1367)))))

(declare-fun b!1020251 () Bool)

(declare-fun res!683828 () Bool)

(assert (=> b!1020251 (=> (not res!683828) (not e!574238))))

(get-info :version)

(assert (=> b!1020251 (= res!683828 (and ((_ is Cons!21625) l!1367) (not (= (h!22823 l!1367) lt!449817))))))

(assert (= (and start!88902 res!683829) b!1020249))

(assert (= (and b!1020249 res!683830) b!1020251))

(assert (= (and b!1020251 res!683828) b!1020250))

(assert (= (and b!1020250 res!683831) b!1020247))

(assert (= (and b!1020247 res!683827) b!1020246))

(assert (= (and start!88902 ((_ is Cons!21625) l!1367)) b!1020248))

(declare-fun m!940267 () Bool)

(assert (=> b!1020247 m!940267))

(declare-fun m!940269 () Bool)

(assert (=> b!1020249 m!940269))

(declare-fun m!940271 () Bool)

(assert (=> start!88902 m!940271))

(declare-fun m!940273 () Bool)

(assert (=> b!1020246 m!940273))

(declare-fun m!940275 () Bool)

(assert (=> b!1020246 m!940275))

(declare-fun m!940277 () Bool)

(assert (=> b!1020250 m!940277))

(check-sat (not b!1020250) tp_is_empty!23781 (not b!1020247) (not start!88902) (not b!1020246) (not b!1020248) (not b!1020249))
(check-sat)
