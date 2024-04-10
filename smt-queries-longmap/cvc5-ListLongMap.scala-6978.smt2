; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88408 () Bool)

(assert start!88408)

(declare-fun b!1017435 () Bool)

(declare-fun e!572423 () Bool)

(assert (=> b!1017435 (= e!572423 (not true))))

(declare-datatypes ((B!1574 0))(
  ( (B!1575 (val!11871 Int)) )
))
(declare-datatypes ((tuple2!15288 0))(
  ( (tuple2!15289 (_1!7655 (_ BitVec 64)) (_2!7655 B!1574)) )
))
(declare-datatypes ((List!21559 0))(
  ( (Nil!21556) (Cons!21555 (h!22753 tuple2!15288) (t!30560 List!21559)) )
))
(declare-fun l!1036 () List!21559)

(declare-fun key!271 () (_ BitVec 64))

(declare-fun containsKey!502 (List!21559 (_ BitVec 64)) Bool)

(assert (=> b!1017435 (containsKey!502 (t!30560 l!1036) key!271)))

(declare-datatypes ((Unit!33269 0))(
  ( (Unit!33270) )
))
(declare-fun lt!449451 () Unit!33269)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!22 (List!21559 (_ BitVec 64)) Unit!33269)

(assert (=> b!1017435 (= lt!449451 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!22 (t!30560 l!1036) key!271))))

(declare-fun res!682406 () Bool)

(assert (=> start!88408 (=> (not res!682406) (not e!572423))))

(declare-fun isStrictlySorted!633 (List!21559) Bool)

(assert (=> start!88408 (= res!682406 (isStrictlySorted!633 l!1036))))

(assert (=> start!88408 e!572423))

(declare-fun e!572424 () Bool)

(assert (=> start!88408 e!572424))

(assert (=> start!88408 true))

(declare-fun b!1017436 () Bool)

(declare-fun res!682409 () Bool)

(assert (=> b!1017436 (=> (not res!682409) (not e!572423))))

(assert (=> b!1017436 (= res!682409 (isStrictlySorted!633 (t!30560 l!1036)))))

(declare-fun b!1017437 () Bool)

(declare-fun res!682407 () Bool)

(assert (=> b!1017437 (=> (not res!682407) (not e!572423))))

(assert (=> b!1017437 (= res!682407 (and (is-Cons!21555 l!1036) (not (= (_1!7655 (h!22753 l!1036)) key!271))))))

(declare-fun b!1017438 () Bool)

(declare-fun tp_is_empty!23641 () Bool)

(declare-fun tp!70882 () Bool)

(assert (=> b!1017438 (= e!572424 (and tp_is_empty!23641 tp!70882))))

(declare-fun b!1017439 () Bool)

(declare-fun res!682405 () Bool)

(assert (=> b!1017439 (=> (not res!682405) (not e!572423))))

(declare-datatypes ((Option!617 0))(
  ( (Some!616 (v!14467 B!1574)) (None!615) )
))
(declare-fun isDefined!413 (Option!617) Bool)

(declare-fun getValueByKey!566 (List!21559 (_ BitVec 64)) Option!617)

(assert (=> b!1017439 (= res!682405 (isDefined!413 (getValueByKey!566 l!1036 key!271)))))

(declare-fun b!1017440 () Bool)

(declare-fun res!682408 () Bool)

(assert (=> b!1017440 (=> (not res!682408) (not e!572423))))

(assert (=> b!1017440 (= res!682408 (isDefined!413 (getValueByKey!566 (t!30560 l!1036) key!271)))))

(assert (= (and start!88408 res!682406) b!1017439))

(assert (= (and b!1017439 res!682405) b!1017437))

(assert (= (and b!1017437 res!682407) b!1017436))

(assert (= (and b!1017436 res!682409) b!1017440))

(assert (= (and b!1017440 res!682408) b!1017435))

(assert (= (and start!88408 (is-Cons!21555 l!1036)) b!1017438))

(declare-fun m!938785 () Bool)

(assert (=> b!1017436 m!938785))

(declare-fun m!938787 () Bool)

(assert (=> b!1017435 m!938787))

(declare-fun m!938789 () Bool)

(assert (=> b!1017435 m!938789))

(declare-fun m!938791 () Bool)

(assert (=> b!1017439 m!938791))

(assert (=> b!1017439 m!938791))

(declare-fun m!938793 () Bool)

(assert (=> b!1017439 m!938793))

(declare-fun m!938795 () Bool)

(assert (=> b!1017440 m!938795))

(assert (=> b!1017440 m!938795))

(declare-fun m!938797 () Bool)

(assert (=> b!1017440 m!938797))

(declare-fun m!938799 () Bool)

(assert (=> start!88408 m!938799))

(push 1)

(assert tp_is_empty!23641)

(assert (not b!1017435))

(assert (not b!1017436))

(assert (not start!88408))

(assert (not b!1017440))

(assert (not b!1017439))

(assert (not b!1017438))

(check-sat)

(pop 1)

