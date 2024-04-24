; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133098 () Bool)

(assert start!133098)

(declare-fun res!1064823 () Bool)

(declare-fun e!867311 () Bool)

(assert (=> start!133098 (=> (not res!1064823) (not e!867311))))

(declare-datatypes ((B!2258 0))(
  ( (B!2259 (val!19215 Int)) )
))
(declare-datatypes ((tuple2!24860 0))(
  ( (tuple2!24861 (_1!12441 (_ BitVec 64)) (_2!12441 B!2258)) )
))
(declare-datatypes ((List!36278 0))(
  ( (Nil!36275) (Cons!36274 (h!37738 tuple2!24860) (t!50991 List!36278)) )
))
(declare-fun l!1177 () List!36278)

(declare-fun isStrictlySorted!895 (List!36278) Bool)

(assert (=> start!133098 (= res!1064823 (isStrictlySorted!895 l!1177))))

(assert (=> start!133098 e!867311))

(declare-fun e!867310 () Bool)

(assert (=> start!133098 e!867310))

(assert (=> start!133098 true))

(declare-fun tp_is_empty!38269 () Bool)

(assert (=> start!133098 tp_is_empty!38269))

(declare-fun b!1557235 () Bool)

(declare-fun res!1064822 () Bool)

(assert (=> b!1557235 (=> (not res!1064822) (not e!867311))))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-fun newKey!105 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1557235 (= res!1064822 (and (not (= newKey!105 otherKey!50)) ((_ is Cons!36274) l!1177) (not (= (_1!12441 (h!37738 l!1177)) otherKey!50))))))

(declare-fun b!1557236 () Bool)

(assert (=> b!1557236 (= e!867311 (not true))))

(declare-fun e!867309 () Bool)

(assert (=> b!1557236 e!867309))

(declare-fun res!1064820 () Bool)

(assert (=> b!1557236 (=> (not res!1064820) (not e!867309))))

(declare-fun lt!671062 () List!36278)

(declare-fun containsKey!779 (List!36278 (_ BitVec 64)) Bool)

(assert (=> b!1557236 (= res!1064820 (= (containsKey!779 lt!671062 otherKey!50) (containsKey!779 (t!50991 l!1177) otherKey!50)))))

(declare-fun newValue!105 () B!2258)

(declare-fun insertStrictlySorted!520 (List!36278 (_ BitVec 64) B!2258) List!36278)

(assert (=> b!1557236 (= lt!671062 (insertStrictlySorted!520 (t!50991 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51713 0))(
  ( (Unit!51714) )
))
(declare-fun lt!671061 () Unit!51713)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!16 (List!36278 (_ BitVec 64) B!2258 (_ BitVec 64)) Unit!51713)

(assert (=> b!1557236 (= lt!671061 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!16 (t!50991 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1557237 () Bool)

(declare-fun res!1064821 () Bool)

(assert (=> b!1557237 (=> (not res!1064821) (not e!867311))))

(assert (=> b!1557237 (= res!1064821 (isStrictlySorted!895 (t!50991 l!1177)))))

(declare-fun b!1557238 () Bool)

(declare-datatypes ((Option!828 0))(
  ( (Some!827 (v!22009 B!2258)) (None!826) )
))
(declare-fun getValueByKey!753 (List!36278 (_ BitVec 64)) Option!828)

(assert (=> b!1557238 (= e!867309 (= (getValueByKey!753 lt!671062 otherKey!50) (getValueByKey!753 (t!50991 l!1177) otherKey!50)))))

(declare-fun b!1557239 () Bool)

(declare-fun tp!112227 () Bool)

(assert (=> b!1557239 (= e!867310 (and tp_is_empty!38269 tp!112227))))

(assert (= (and start!133098 res!1064823) b!1557235))

(assert (= (and b!1557235 res!1064822) b!1557237))

(assert (= (and b!1557237 res!1064821) b!1557236))

(assert (= (and b!1557236 res!1064820) b!1557238))

(assert (= (and start!133098 ((_ is Cons!36274) l!1177)) b!1557239))

(declare-fun m!1435259 () Bool)

(assert (=> start!133098 m!1435259))

(declare-fun m!1435261 () Bool)

(assert (=> b!1557236 m!1435261))

(declare-fun m!1435263 () Bool)

(assert (=> b!1557236 m!1435263))

(declare-fun m!1435265 () Bool)

(assert (=> b!1557236 m!1435265))

(declare-fun m!1435267 () Bool)

(assert (=> b!1557236 m!1435267))

(declare-fun m!1435269 () Bool)

(assert (=> b!1557237 m!1435269))

(declare-fun m!1435271 () Bool)

(assert (=> b!1557238 m!1435271))

(declare-fun m!1435273 () Bool)

(assert (=> b!1557238 m!1435273))

(check-sat (not b!1557239) (not b!1557236) (not b!1557238) (not b!1557237) tp_is_empty!38269 (not start!133098))
(check-sat)
