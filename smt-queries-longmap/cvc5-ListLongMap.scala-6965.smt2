; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87942 () Bool)

(assert start!87942)

(declare-fun b!1015641 () Bool)

(assert (=> b!1015641 true))

(assert (=> b!1015641 true))

(declare-fun res!681245 () Bool)

(declare-fun e!571372 () Bool)

(assert (=> b!1015641 (=> (not res!681245) (not e!571372))))

(declare-datatypes ((List!21487 0))(
  ( (Nil!21484) (Cons!21483 (h!22681 (_ BitVec 64)) (t!30488 List!21487)) )
))
(declare-fun keys!40 () List!21487)

(declare-fun lambda!920 () Int)

(declare-fun forall!262 (List!21487 Int) Bool)

(assert (=> b!1015641 (= res!681245 (forall!262 keys!40 lambda!920))))

(declare-fun b!1015642 () Bool)

(declare-fun e!571371 () Bool)

(declare-fun tp_is_empty!23563 () Bool)

(declare-fun tp!70682 () Bool)

(assert (=> b!1015642 (= e!571371 (and tp_is_empty!23563 tp!70682))))

(declare-fun b!1015643 () Bool)

(declare-fun res!681248 () Bool)

(assert (=> b!1015643 (=> (not res!681248) (not e!571372))))

(assert (=> b!1015643 (= res!681248 (is-Cons!21483 keys!40))))

(declare-fun res!681246 () Bool)

(assert (=> start!87942 (=> (not res!681246) (not e!571372))))

(declare-datatypes ((B!1496 0))(
  ( (B!1497 (val!11832 Int)) )
))
(declare-datatypes ((tuple2!15210 0))(
  ( (tuple2!15211 (_1!7616 (_ BitVec 64)) (_2!7616 B!1496)) )
))
(declare-datatypes ((List!21488 0))(
  ( (Nil!21485) (Cons!21484 (h!22682 tuple2!15210) (t!30489 List!21488)) )
))
(declare-fun l!1114 () List!21488)

(declare-fun isStrictlySorted!600 (List!21488) Bool)

(assert (=> start!87942 (= res!681246 (isStrictlySorted!600 l!1114))))

(assert (=> start!87942 e!571372))

(assert (=> start!87942 e!571371))

(assert (=> start!87942 true))

(assert (=> start!87942 tp_is_empty!23563))

(declare-fun b!1015644 () Bool)

(declare-fun res!681249 () Bool)

(assert (=> b!1015644 (=> (not res!681249) (not e!571372))))

(declare-fun newHead!31 () tuple2!15210)

(declare-fun head!949 (List!21488) tuple2!15210)

(assert (=> b!1015644 (= res!681249 (bvslt (_1!7616 newHead!31) (_1!7616 (head!949 l!1114))))))

(declare-fun b!1015645 () Bool)

(declare-fun res!681247 () Bool)

(assert (=> b!1015645 (=> (not res!681247) (not e!571372))))

(declare-fun isEmpty!859 (List!21488) Bool)

(assert (=> b!1015645 (= res!681247 (not (isEmpty!859 l!1114)))))

(declare-fun b!1015646 () Bool)

(assert (=> b!1015646 (= e!571372 (not true))))

(declare-fun containsKey!481 (List!21488 (_ BitVec 64)) Bool)

(assert (=> b!1015646 (containsKey!481 l!1114 (h!22681 keys!40))))

(declare-datatypes ((Unit!33227 0))(
  ( (Unit!33228) )
))
(declare-fun lt!449151 () Unit!33227)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!1 (List!21488 (_ BitVec 64)) Unit!33227)

(assert (=> b!1015646 (= lt!449151 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!1 l!1114 (h!22681 keys!40)))))

(assert (= (and start!87942 res!681246) b!1015645))

(assert (= (and b!1015645 res!681247) b!1015641))

(assert (= (and b!1015641 res!681245) b!1015644))

(assert (= (and b!1015644 res!681249) b!1015643))

(assert (= (and b!1015643 res!681248) b!1015646))

(assert (= (and start!87942 (is-Cons!21484 l!1114)) b!1015642))

(declare-fun m!937601 () Bool)

(assert (=> b!1015646 m!937601))

(declare-fun m!937603 () Bool)

(assert (=> b!1015646 m!937603))

(declare-fun m!937605 () Bool)

(assert (=> start!87942 m!937605))

(declare-fun m!937607 () Bool)

(assert (=> b!1015641 m!937607))

(declare-fun m!937609 () Bool)

(assert (=> b!1015644 m!937609))

(declare-fun m!937611 () Bool)

(assert (=> b!1015645 m!937611))

(push 1)

(assert (not b!1015646))

(assert (not start!87942))

(assert tp_is_empty!23563)

(assert (not b!1015645))

(assert (not b!1015644))

(assert (not b!1015641))

(assert (not b!1015642))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

