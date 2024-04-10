; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132778 () Bool)

(assert start!132778)

(declare-fun res!1064368 () Bool)

(declare-fun e!866295 () Bool)

(assert (=> start!132778 (=> (not res!1064368) (not e!866295))))

(declare-datatypes ((B!2290 0))(
  ( (B!2291 (val!19231 Int)) )
))
(declare-datatypes ((tuple2!24838 0))(
  ( (tuple2!24839 (_1!12430 (_ BitVec 64)) (_2!12430 B!2290)) )
))
(declare-datatypes ((List!36265 0))(
  ( (Nil!36262) (Cons!36261 (h!37707 tuple2!24838) (t!50986 List!36265)) )
))
(declare-fun l!1177 () List!36265)

(declare-fun isStrictlySorted!924 (List!36265) Bool)

(assert (=> start!132778 (= res!1064368 (isStrictlySorted!924 l!1177))))

(assert (=> start!132778 e!866295))

(declare-fun e!866296 () Bool)

(assert (=> start!132778 e!866296))

(assert (=> start!132778 true))

(declare-fun tp_is_empty!38301 () Bool)

(assert (=> start!132778 tp_is_empty!38301))

(declare-fun b!1555570 () Bool)

(assert (=> b!1555570 (= e!866295 (not true))))

(declare-fun lt!670314 () Bool)

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun newValue!105 () B!2290)

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-fun containsKey!795 (List!36265 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!535 (List!36265 (_ BitVec 64) B!2290) List!36265)

(assert (=> b!1555570 (= lt!670314 (containsKey!795 (insertStrictlySorted!535 l!1177 newKey!105 newValue!105) otherKey!50))))

(declare-fun e!866297 () Bool)

(assert (=> b!1555570 e!866297))

(declare-fun res!1064367 () Bool)

(assert (=> b!1555570 (=> (not res!1064367) (not e!866297))))

(declare-fun lt!670316 () List!36265)

(assert (=> b!1555570 (= res!1064367 (= (containsKey!795 lt!670316 otherKey!50) (containsKey!795 (t!50986 l!1177) otherKey!50)))))

(assert (=> b!1555570 (= lt!670316 (insertStrictlySorted!535 (t!50986 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51834 0))(
  ( (Unit!51835) )
))
(declare-fun lt!670315 () Unit!51834)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!32 (List!36265 (_ BitVec 64) B!2290 (_ BitVec 64)) Unit!51834)

(assert (=> b!1555570 (= lt!670315 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!32 (t!50986 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1555571 () Bool)

(declare-fun res!1064366 () Bool)

(assert (=> b!1555571 (=> (not res!1064366) (not e!866295))))

(assert (=> b!1555571 (= res!1064366 (isStrictlySorted!924 (t!50986 l!1177)))))

(declare-fun b!1555572 () Bool)

(declare-datatypes ((Option!849 0))(
  ( (Some!848 (v!22033 B!2290)) (None!847) )
))
(declare-fun getValueByKey!773 (List!36265 (_ BitVec 64)) Option!849)

(assert (=> b!1555572 (= e!866297 (= (getValueByKey!773 lt!670316 otherKey!50) (getValueByKey!773 (t!50986 l!1177) otherKey!50)))))

(declare-fun b!1555573 () Bool)

(declare-fun res!1064365 () Bool)

(assert (=> b!1555573 (=> (not res!1064365) (not e!866295))))

(get-info :version)

(assert (=> b!1555573 (= res!1064365 (and (not (= newKey!105 otherKey!50)) ((_ is Cons!36261) l!1177) (not (= (_1!12430 (h!37707 l!1177)) otherKey!50))))))

(declare-fun b!1555574 () Bool)

(declare-fun tp!112293 () Bool)

(assert (=> b!1555574 (= e!866296 (and tp_is_empty!38301 tp!112293))))

(assert (= (and start!132778 res!1064368) b!1555573))

(assert (= (and b!1555573 res!1064365) b!1555571))

(assert (= (and b!1555571 res!1064366) b!1555570))

(assert (= (and b!1555570 res!1064367) b!1555572))

(assert (= (and start!132778 ((_ is Cons!36261) l!1177)) b!1555574))

(declare-fun m!1433531 () Bool)

(assert (=> start!132778 m!1433531))

(declare-fun m!1433533 () Bool)

(assert (=> b!1555570 m!1433533))

(declare-fun m!1433535 () Bool)

(assert (=> b!1555570 m!1433535))

(declare-fun m!1433537 () Bool)

(assert (=> b!1555570 m!1433537))

(declare-fun m!1433539 () Bool)

(assert (=> b!1555570 m!1433539))

(declare-fun m!1433541 () Bool)

(assert (=> b!1555570 m!1433541))

(assert (=> b!1555570 m!1433535))

(declare-fun m!1433543 () Bool)

(assert (=> b!1555570 m!1433543))

(declare-fun m!1433545 () Bool)

(assert (=> b!1555571 m!1433545))

(declare-fun m!1433547 () Bool)

(assert (=> b!1555572 m!1433547))

(declare-fun m!1433549 () Bool)

(assert (=> b!1555572 m!1433549))

(check-sat (not b!1555574) (not b!1555572) (not start!132778) (not b!1555570) tp_is_empty!38301 (not b!1555571))
(check-sat)
