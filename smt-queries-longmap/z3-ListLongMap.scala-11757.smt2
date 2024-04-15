; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137910 () Bool)

(assert start!137910)

(declare-fun b!1583305 () Bool)

(declare-fun e!883785 () Bool)

(declare-fun tp_is_empty!39415 () Bool)

(declare-fun tp!115013 () Bool)

(assert (=> b!1583305 (= e!883785 (and tp_is_empty!39415 tp!115013))))

(declare-fun b!1583306 () Bool)

(declare-fun res!1081612 () Bool)

(declare-fun e!883786 () Bool)

(assert (=> b!1583306 (=> (not res!1081612) (not e!883786))))

(declare-datatypes ((B!2882 0))(
  ( (B!2883 (val!19803 Int)) )
))
(declare-datatypes ((tuple2!25842 0))(
  ( (tuple2!25843 (_1!12932 (_ BitVec 64)) (_2!12932 B!2882)) )
))
(declare-datatypes ((List!36964 0))(
  ( (Nil!36961) (Cons!36960 (h!38504 tuple2!25842) (t!51870 List!36964)) )
))
(declare-fun l!1251 () List!36964)

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-fun containsKey!983 (List!36964 (_ BitVec 64)) Bool)

(assert (=> b!1583306 (= res!1081612 (not (containsKey!983 (t!51870 l!1251) otherKey!56)))))

(declare-fun res!1081615 () Bool)

(assert (=> start!137910 (=> (not res!1081615) (not e!883786))))

(declare-fun isStrictlySorted!1149 (List!36964) Bool)

(assert (=> start!137910 (= res!1081615 (isStrictlySorted!1149 l!1251))))

(assert (=> start!137910 e!883786))

(assert (=> start!137910 e!883785))

(assert (=> start!137910 true))

(assert (=> start!137910 tp_is_empty!39415))

(declare-fun b!1583307 () Bool)

(declare-fun res!1081616 () Bool)

(assert (=> b!1583307 (=> (not res!1081616) (not e!883786))))

(declare-fun newKey!123 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1583307 (= res!1081616 (and (not (= otherKey!56 newKey!123)) ((_ is Cons!36960) l!1251)))))

(declare-fun b!1583308 () Bool)

(declare-fun res!1081614 () Bool)

(assert (=> b!1583308 (=> (not res!1081614) (not e!883786))))

(assert (=> b!1583308 (= res!1081614 (not (containsKey!983 l!1251 otherKey!56)))))

(declare-fun b!1583309 () Bool)

(declare-fun res!1081613 () Bool)

(assert (=> b!1583309 (=> (not res!1081613) (not e!883786))))

(assert (=> b!1583309 (= res!1081613 (isStrictlySorted!1149 (t!51870 l!1251)))))

(declare-fun b!1583310 () Bool)

(assert (=> b!1583310 (= e!883786 (not true))))

(declare-fun newValue!123 () B!2882)

(declare-fun insertStrictlySorted!618 (List!36964 (_ BitVec 64) B!2882) List!36964)

(assert (=> b!1583310 (not (containsKey!983 (insertStrictlySorted!618 (t!51870 l!1251) newKey!123 newValue!123) otherKey!56))))

(declare-datatypes ((Unit!52093 0))(
  ( (Unit!52094) )
))
(declare-fun lt!676907 () Unit!52093)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!4 (List!36964 (_ BitVec 64) B!2882 (_ BitVec 64)) Unit!52093)

(assert (=> b!1583310 (= lt!676907 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!4 (t!51870 l!1251) newKey!123 newValue!123 otherKey!56))))

(assert (= (and start!137910 res!1081615) b!1583308))

(assert (= (and b!1583308 res!1081614) b!1583307))

(assert (= (and b!1583307 res!1081616) b!1583309))

(assert (= (and b!1583309 res!1081613) b!1583306))

(assert (= (and b!1583306 res!1081612) b!1583310))

(assert (= (and start!137910 ((_ is Cons!36960) l!1251)) b!1583305))

(declare-fun m!1452481 () Bool)

(assert (=> start!137910 m!1452481))

(declare-fun m!1452483 () Bool)

(assert (=> b!1583308 m!1452483))

(declare-fun m!1452485 () Bool)

(assert (=> b!1583309 m!1452485))

(declare-fun m!1452487 () Bool)

(assert (=> b!1583306 m!1452487))

(declare-fun m!1452489 () Bool)

(assert (=> b!1583310 m!1452489))

(assert (=> b!1583310 m!1452489))

(declare-fun m!1452491 () Bool)

(assert (=> b!1583310 m!1452491))

(declare-fun m!1452493 () Bool)

(assert (=> b!1583310 m!1452493))

(check-sat (not b!1583305) (not b!1583308) tp_is_empty!39415 (not start!137910) (not b!1583309) (not b!1583306) (not b!1583310))
(check-sat)
