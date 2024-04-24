; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88184 () Bool)

(assert start!88184)

(declare-fun b!1017024 () Bool)

(assert (=> b!1017024 true))

(assert (=> b!1017024 true))

(declare-fun b!1017019 () Bool)

(declare-fun res!681796 () Bool)

(declare-fun e!572240 () Bool)

(assert (=> b!1017019 (=> (not res!681796) (not e!572240))))

(declare-datatypes ((B!1500 0))(
  ( (B!1501 (val!11834 Int)) )
))
(declare-datatypes ((tuple2!15218 0))(
  ( (tuple2!15219 (_1!7620 (_ BitVec 64)) (_2!7620 B!1500)) )
))
(declare-datatypes ((List!21480 0))(
  ( (Nil!21477) (Cons!21476 (h!22683 tuple2!15218) (t!30473 List!21480)) )
))
(declare-fun l!1114 () List!21480)

(declare-fun isEmpty!865 (List!21480) Bool)

(assert (=> b!1017019 (= res!681796 (not (isEmpty!865 l!1114)))))

(declare-fun b!1017020 () Bool)

(assert (=> b!1017020 (= e!572240 (not true))))

(declare-datatypes ((List!21481 0))(
  ( (Nil!21478) (Cons!21477 (h!22684 (_ BitVec 64)) (t!30474 List!21481)) )
))
(declare-fun keys!40 () List!21481)

(declare-fun containsKey!485 (List!21480 (_ BitVec 64)) Bool)

(assert (=> b!1017020 (containsKey!485 l!1114 (h!22684 keys!40))))

(declare-datatypes ((Unit!33232 0))(
  ( (Unit!33233) )
))
(declare-fun lt!449672 () Unit!33232)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!3 (List!21480 (_ BitVec 64)) Unit!33232)

(assert (=> b!1017020 (= lt!449672 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!3 l!1114 (h!22684 keys!40)))))

(declare-fun b!1017021 () Bool)

(declare-fun res!681797 () Bool)

(assert (=> b!1017021 (=> (not res!681797) (not e!572240))))

(declare-fun newHead!31 () tuple2!15218)

(declare-fun head!947 (List!21480) tuple2!15218)

(assert (=> b!1017021 (= res!681797 (bvslt (_1!7620 newHead!31) (_1!7620 (head!947 l!1114))))))

(declare-fun b!1017023 () Bool)

(declare-fun res!681795 () Bool)

(assert (=> b!1017023 (=> (not res!681795) (not e!572240))))

(assert (=> b!1017023 (= res!681795 (is-Cons!21477 keys!40))))

(declare-fun res!681794 () Bool)

(assert (=> b!1017024 (=> (not res!681794) (not e!572240))))

(declare-fun lambda!926 () Int)

(declare-fun forall!266 (List!21481 Int) Bool)

(assert (=> b!1017024 (= res!681794 (forall!266 keys!40 lambda!926))))

(declare-fun b!1017022 () Bool)

(declare-fun e!572241 () Bool)

(declare-fun tp_is_empty!23567 () Bool)

(declare-fun tp!70689 () Bool)

(assert (=> b!1017022 (= e!572241 (and tp_is_empty!23567 tp!70689))))

(declare-fun res!681793 () Bool)

(assert (=> start!88184 (=> (not res!681793) (not e!572240))))

(declare-fun isStrictlySorted!590 (List!21480) Bool)

(assert (=> start!88184 (= res!681793 (isStrictlySorted!590 l!1114))))

(assert (=> start!88184 e!572240))

(assert (=> start!88184 e!572241))

(assert (=> start!88184 true))

(assert (=> start!88184 tp_is_empty!23567))

(assert (= (and start!88184 res!681793) b!1017019))

(assert (= (and b!1017019 res!681796) b!1017024))

(assert (= (and b!1017024 res!681794) b!1017021))

(assert (= (and b!1017021 res!681797) b!1017023))

(assert (= (and b!1017023 res!681795) b!1017020))

(assert (= (and start!88184 (is-Cons!21476 l!1114)) b!1017022))

(declare-fun m!939305 () Bool)

(assert (=> start!88184 m!939305))

(declare-fun m!939307 () Bool)

(assert (=> b!1017021 m!939307))

(declare-fun m!939309 () Bool)

(assert (=> b!1017024 m!939309))

(declare-fun m!939311 () Bool)

(assert (=> b!1017020 m!939311))

(declare-fun m!939313 () Bool)

(assert (=> b!1017020 m!939313))

(declare-fun m!939315 () Bool)

(assert (=> b!1017019 m!939315))

(push 1)

(assert (not b!1017024))

(assert (not b!1017019))

(assert (not start!88184))

(assert (not b!1017022))

(assert (not b!1017021))

(assert tp_is_empty!23567)

(assert (not b!1017020))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

