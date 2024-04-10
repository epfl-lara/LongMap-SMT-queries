; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137948 () Bool)

(assert start!137948)

(declare-fun res!1081775 () Bool)

(declare-fun e!883995 () Bool)

(assert (=> start!137948 (=> (not res!1081775) (not e!883995))))

(declare-datatypes ((B!2886 0))(
  ( (B!2887 (val!19805 Int)) )
))
(declare-datatypes ((tuple2!25778 0))(
  ( (tuple2!25779 (_1!12900 (_ BitVec 64)) (_2!12900 B!2886)) )
))
(declare-datatypes ((List!36925 0))(
  ( (Nil!36922) (Cons!36921 (h!38464 tuple2!25778) (t!51839 List!36925)) )
))
(declare-fun l!1251 () List!36925)

(declare-fun isStrictlySorted!1153 (List!36925) Bool)

(assert (=> start!137948 (= res!1081775 (isStrictlySorted!1153 l!1251))))

(assert (=> start!137948 e!883995))

(declare-fun e!883996 () Bool)

(assert (=> start!137948 e!883996))

(assert (=> start!137948 true))

(declare-fun tp_is_empty!39419 () Bool)

(assert (=> start!137948 tp_is_empty!39419))

(declare-fun b!1583654 () Bool)

(declare-fun res!1081772 () Bool)

(assert (=> b!1583654 (=> (not res!1081772) (not e!883995))))

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-fun containsKey!987 (List!36925 (_ BitVec 64)) Bool)

(assert (=> b!1583654 (= res!1081772 (not (containsKey!987 l!1251 otherKey!56)))))

(declare-fun b!1583655 () Bool)

(declare-fun res!1081771 () Bool)

(assert (=> b!1583655 (=> (not res!1081771) (not e!883995))))

(assert (=> b!1583655 (= res!1081771 (not (containsKey!987 (t!51839 l!1251) otherKey!56)))))

(declare-fun b!1583656 () Bool)

(assert (=> b!1583656 (= e!883995 (not true))))

(declare-fun newKey!123 () (_ BitVec 64))

(declare-fun newValue!123 () B!2886)

(declare-fun insertStrictlySorted!619 (List!36925 (_ BitVec 64) B!2886) List!36925)

(assert (=> b!1583656 (not (containsKey!987 (insertStrictlySorted!619 (t!51839 l!1251) newKey!123 newValue!123) otherKey!56))))

(declare-datatypes ((Unit!52289 0))(
  ( (Unit!52290) )
))
(declare-fun lt!677196 () Unit!52289)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!6 (List!36925 (_ BitVec 64) B!2886 (_ BitVec 64)) Unit!52289)

(assert (=> b!1583656 (= lt!677196 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!6 (t!51839 l!1251) newKey!123 newValue!123 otherKey!56))))

(declare-fun b!1583657 () Bool)

(declare-fun tp!115018 () Bool)

(assert (=> b!1583657 (= e!883996 (and tp_is_empty!39419 tp!115018))))

(declare-fun b!1583658 () Bool)

(declare-fun res!1081774 () Bool)

(assert (=> b!1583658 (=> (not res!1081774) (not e!883995))))

(assert (=> b!1583658 (= res!1081774 (and (not (= otherKey!56 newKey!123)) (is-Cons!36921 l!1251)))))

(declare-fun b!1583659 () Bool)

(declare-fun res!1081773 () Bool)

(assert (=> b!1583659 (=> (not res!1081773) (not e!883995))))

(assert (=> b!1583659 (= res!1081773 (isStrictlySorted!1153 (t!51839 l!1251)))))

(assert (= (and start!137948 res!1081775) b!1583654))

(assert (= (and b!1583654 res!1081772) b!1583658))

(assert (= (and b!1583658 res!1081774) b!1583659))

(assert (= (and b!1583659 res!1081773) b!1583655))

(assert (= (and b!1583655 res!1081771) b!1583656))

(assert (= (and start!137948 (is-Cons!36921 l!1251)) b!1583657))

(declare-fun m!1453389 () Bool)

(assert (=> b!1583659 m!1453389))

(declare-fun m!1453391 () Bool)

(assert (=> b!1583655 m!1453391))

(declare-fun m!1453393 () Bool)

(assert (=> b!1583656 m!1453393))

(assert (=> b!1583656 m!1453393))

(declare-fun m!1453395 () Bool)

(assert (=> b!1583656 m!1453395))

(declare-fun m!1453397 () Bool)

(assert (=> b!1583656 m!1453397))

(declare-fun m!1453399 () Bool)

(assert (=> start!137948 m!1453399))

(declare-fun m!1453401 () Bool)

(assert (=> b!1583654 m!1453401))

(push 1)

(assert (not b!1583659))

(assert (not b!1583657))

(assert (not start!137948))

(assert (not b!1583655))

(assert (not b!1583654))

(assert tp_is_empty!39419)

(assert (not b!1583656))

(check-sat)

