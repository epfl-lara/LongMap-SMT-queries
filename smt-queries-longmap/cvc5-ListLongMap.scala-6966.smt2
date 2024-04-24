; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88190 () Bool)

(assert start!88190)

(declare-fun b!1017099 () Bool)

(assert (=> b!1017099 true))

(assert (=> b!1017099 true))

(declare-fun b!1017093 () Bool)

(declare-fun res!681851 () Bool)

(declare-fun e!572268 () Bool)

(assert (=> b!1017093 (=> (not res!681851) (not e!572268))))

(declare-datatypes ((B!1506 0))(
  ( (B!1507 (val!11837 Int)) )
))
(declare-datatypes ((tuple2!15224 0))(
  ( (tuple2!15225 (_1!7623 (_ BitVec 64)) (_2!7623 B!1506)) )
))
(declare-fun newHead!31 () tuple2!15224)

(declare-datatypes ((List!21486 0))(
  ( (Nil!21483) (Cons!21482 (h!22689 tuple2!15224) (t!30479 List!21486)) )
))
(declare-fun l!1114 () List!21486)

(declare-fun head!950 (List!21486) tuple2!15224)

(assert (=> b!1017093 (= res!681851 (bvslt (_1!7623 newHead!31) (_1!7623 (head!950 l!1114))))))

(declare-fun b!1017095 () Bool)

(declare-fun e!572267 () Bool)

(assert (=> b!1017095 (= e!572268 (not e!572267))))

(declare-fun res!681846 () Bool)

(assert (=> b!1017095 (=> res!681846 e!572267)))

(declare-datatypes ((List!21487 0))(
  ( (Nil!21484) (Cons!21483 (h!22690 (_ BitVec 64)) (t!30480 List!21487)) )
))
(declare-fun keys!40 () List!21487)

(declare-fun lambda!947 () Int)

(declare-fun forall!269 (List!21487 Int) Bool)

(assert (=> b!1017095 (= res!681846 (not (forall!269 (t!30480 keys!40) lambda!947)))))

(declare-fun lt!449698 () List!21486)

(declare-datatypes ((Option!588 0))(
  ( (Some!587 (v!14438 B!1506)) (None!586) )
))
(declare-fun isDefined!393 (Option!588) Bool)

(declare-fun getValueByKey!537 (List!21486 (_ BitVec 64)) Option!588)

(assert (=> b!1017095 (isDefined!393 (getValueByKey!537 lt!449698 (h!22690 keys!40)))))

(declare-datatypes ((Unit!33238 0))(
  ( (Unit!33239) )
))
(declare-fun lt!449697 () Unit!33238)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!379 (List!21486 (_ BitVec 64)) Unit!33238)

(assert (=> b!1017095 (= lt!449697 (lemmaContainsKeyImpliesGetValueByKeyDefined!379 lt!449698 (h!22690 keys!40)))))

(assert (=> b!1017095 (= lt!449698 (Cons!21482 newHead!31 l!1114))))

(declare-fun containsKey!488 (List!21486 (_ BitVec 64)) Bool)

(assert (=> b!1017095 (containsKey!488 l!1114 (h!22690 keys!40))))

(declare-fun lt!449699 () Unit!33238)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!6 (List!21486 (_ BitVec 64)) Unit!33238)

(assert (=> b!1017095 (= lt!449699 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!6 l!1114 (h!22690 keys!40)))))

(declare-fun b!1017096 () Bool)

(assert (=> b!1017096 (= e!572267 (forall!269 (t!30480 keys!40) lambda!947))))

(declare-fun b!1017097 () Bool)

(declare-fun res!681848 () Bool)

(assert (=> b!1017097 (=> (not res!681848) (not e!572268))))

(declare-fun isEmpty!868 (List!21486) Bool)

(assert (=> b!1017097 (= res!681848 (not (isEmpty!868 l!1114)))))

(declare-fun b!1017094 () Bool)

(declare-fun res!681850 () Bool)

(assert (=> b!1017094 (=> (not res!681850) (not e!572268))))

(assert (=> b!1017094 (= res!681850 (is-Cons!21483 keys!40))))

(declare-fun res!681847 () Bool)

(assert (=> start!88190 (=> (not res!681847) (not e!572268))))

(declare-fun isStrictlySorted!593 (List!21486) Bool)

(assert (=> start!88190 (= res!681847 (isStrictlySorted!593 l!1114))))

(assert (=> start!88190 e!572268))

(declare-fun e!572266 () Bool)

(assert (=> start!88190 e!572266))

(assert (=> start!88190 true))

(declare-fun tp_is_empty!23573 () Bool)

(assert (=> start!88190 tp_is_empty!23573))

(declare-fun b!1017098 () Bool)

(declare-fun tp!70698 () Bool)

(assert (=> b!1017098 (= e!572266 (and tp_is_empty!23573 tp!70698))))

(declare-fun res!681849 () Bool)

(assert (=> b!1017099 (=> (not res!681849) (not e!572268))))

(assert (=> b!1017099 (= res!681849 (forall!269 keys!40 lambda!947))))

(assert (= (and start!88190 res!681847) b!1017097))

(assert (= (and b!1017097 res!681848) b!1017099))

(assert (= (and b!1017099 res!681849) b!1017093))

(assert (= (and b!1017093 res!681851) b!1017094))

(assert (= (and b!1017094 res!681850) b!1017095))

(assert (= (and b!1017095 (not res!681846)) b!1017096))

(assert (= (and start!88190 (is-Cons!21482 l!1114)) b!1017098))

(declare-fun m!939357 () Bool)

(assert (=> start!88190 m!939357))

(declare-fun m!939359 () Bool)

(assert (=> b!1017093 m!939359))

(declare-fun m!939361 () Bool)

(assert (=> b!1017097 m!939361))

(declare-fun m!939363 () Bool)

(assert (=> b!1017099 m!939363))

(declare-fun m!939365 () Bool)

(assert (=> b!1017095 m!939365))

(declare-fun m!939367 () Bool)

(assert (=> b!1017095 m!939367))

(assert (=> b!1017095 m!939367))

(declare-fun m!939369 () Bool)

(assert (=> b!1017095 m!939369))

(declare-fun m!939371 () Bool)

(assert (=> b!1017095 m!939371))

(declare-fun m!939373 () Bool)

(assert (=> b!1017095 m!939373))

(declare-fun m!939375 () Bool)

(assert (=> b!1017095 m!939375))

(assert (=> b!1017096 m!939373))

(push 1)

(assert (not b!1017096))

(assert (not b!1017098))

(assert tp_is_empty!23573)

(assert (not start!88190))

(assert (not b!1017097))

(assert (not b!1017093))

(assert (not b!1017099))

(assert (not b!1017095))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

