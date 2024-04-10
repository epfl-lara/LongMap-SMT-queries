; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137944 () Bool)

(assert start!137944)

(declare-fun res!1081743 () Bool)

(declare-fun e!883984 () Bool)

(assert (=> start!137944 (=> (not res!1081743) (not e!883984))))

(declare-datatypes ((B!2882 0))(
  ( (B!2883 (val!19803 Int)) )
))
(declare-datatypes ((tuple2!25774 0))(
  ( (tuple2!25775 (_1!12898 (_ BitVec 64)) (_2!12898 B!2882)) )
))
(declare-datatypes ((List!36923 0))(
  ( (Nil!36920) (Cons!36919 (h!38462 tuple2!25774) (t!51837 List!36923)) )
))
(declare-fun l!1251 () List!36923)

(declare-fun isStrictlySorted!1151 (List!36923) Bool)

(assert (=> start!137944 (= res!1081743 (isStrictlySorted!1151 l!1251))))

(assert (=> start!137944 e!883984))

(declare-fun e!883983 () Bool)

(assert (=> start!137944 e!883983))

(assert (=> start!137944 true))

(declare-fun tp_is_empty!39415 () Bool)

(assert (=> start!137944 tp_is_empty!39415))

(declare-fun b!1583618 () Bool)

(declare-fun res!1081742 () Bool)

(assert (=> b!1583618 (=> (not res!1081742) (not e!883984))))

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-fun containsKey!985 (List!36923 (_ BitVec 64)) Bool)

(assert (=> b!1583618 (= res!1081742 (not (containsKey!985 l!1251 otherKey!56)))))

(declare-fun b!1583619 () Bool)

(declare-fun res!1081744 () Bool)

(assert (=> b!1583619 (=> (not res!1081744) (not e!883984))))

(assert (=> b!1583619 (= res!1081744 (isStrictlySorted!1151 (t!51837 l!1251)))))

(declare-fun b!1583620 () Bool)

(declare-fun res!1081745 () Bool)

(assert (=> b!1583620 (=> (not res!1081745) (not e!883984))))

(declare-fun newKey!123 () (_ BitVec 64))

(assert (=> b!1583620 (= res!1081745 (and (not (= otherKey!56 newKey!123)) (is-Cons!36919 l!1251)))))

(declare-fun b!1583621 () Bool)

(assert (=> b!1583621 (= e!883984 (not true))))

(declare-fun newValue!123 () B!2882)

(declare-fun insertStrictlySorted!617 (List!36923 (_ BitVec 64) B!2882) List!36923)

(assert (=> b!1583621 (not (containsKey!985 (insertStrictlySorted!617 (t!51837 l!1251) newKey!123 newValue!123) otherKey!56))))

(declare-datatypes ((Unit!52285 0))(
  ( (Unit!52286) )
))
(declare-fun lt!677190 () Unit!52285)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!4 (List!36923 (_ BitVec 64) B!2882 (_ BitVec 64)) Unit!52285)

(assert (=> b!1583621 (= lt!677190 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!4 (t!51837 l!1251) newKey!123 newValue!123 otherKey!56))))

(declare-fun b!1583622 () Bool)

(declare-fun tp!115012 () Bool)

(assert (=> b!1583622 (= e!883983 (and tp_is_empty!39415 tp!115012))))

(declare-fun b!1583623 () Bool)

(declare-fun res!1081741 () Bool)

(assert (=> b!1583623 (=> (not res!1081741) (not e!883984))))

(assert (=> b!1583623 (= res!1081741 (not (containsKey!985 (t!51837 l!1251) otherKey!56)))))

(assert (= (and start!137944 res!1081743) b!1583618))

(assert (= (and b!1583618 res!1081742) b!1583620))

(assert (= (and b!1583620 res!1081745) b!1583619))

(assert (= (and b!1583619 res!1081744) b!1583623))

(assert (= (and b!1583623 res!1081741) b!1583621))

(assert (= (and start!137944 (is-Cons!36919 l!1251)) b!1583622))

(declare-fun m!1453361 () Bool)

(assert (=> b!1583621 m!1453361))

(assert (=> b!1583621 m!1453361))

(declare-fun m!1453363 () Bool)

(assert (=> b!1583621 m!1453363))

(declare-fun m!1453365 () Bool)

(assert (=> b!1583621 m!1453365))

(declare-fun m!1453367 () Bool)

(assert (=> b!1583618 m!1453367))

(declare-fun m!1453369 () Bool)

(assert (=> b!1583623 m!1453369))

(declare-fun m!1453371 () Bool)

(assert (=> b!1583619 m!1453371))

(declare-fun m!1453373 () Bool)

(assert (=> start!137944 m!1453373))

(push 1)

(assert (not b!1583619))

(assert (not b!1583622))

(assert (not start!137944))

(assert (not b!1583623))

(assert (not b!1583621))

(assert (not b!1583618))

(assert tp_is_empty!39415)

(check-sat)

(pop 1)

