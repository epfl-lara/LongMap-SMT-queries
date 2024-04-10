; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87946 () Bool)

(assert start!87946)

(declare-fun b!1015689 () Bool)

(assert (=> b!1015689 true))

(assert (=> b!1015689 true))

(declare-fun b!1015685 () Bool)

(declare-fun e!571383 () Bool)

(declare-fun tp_is_empty!23567 () Bool)

(declare-fun tp!70688 () Bool)

(assert (=> b!1015685 (= e!571383 (and tp_is_empty!23567 tp!70688))))

(declare-fun b!1015686 () Bool)

(declare-fun res!681275 () Bool)

(declare-fun e!571384 () Bool)

(assert (=> b!1015686 (=> (not res!681275) (not e!571384))))

(declare-datatypes ((List!21491 0))(
  ( (Nil!21488) (Cons!21487 (h!22685 (_ BitVec 64)) (t!30492 List!21491)) )
))
(declare-fun keys!40 () List!21491)

(assert (=> b!1015686 (= res!681275 (is-Cons!21487 keys!40))))

(declare-fun b!1015687 () Bool)

(declare-fun res!681276 () Bool)

(assert (=> b!1015687 (=> (not res!681276) (not e!571384))))

(declare-datatypes ((B!1500 0))(
  ( (B!1501 (val!11834 Int)) )
))
(declare-datatypes ((tuple2!15214 0))(
  ( (tuple2!15215 (_1!7618 (_ BitVec 64)) (_2!7618 B!1500)) )
))
(declare-datatypes ((List!21492 0))(
  ( (Nil!21489) (Cons!21488 (h!22686 tuple2!15214) (t!30493 List!21492)) )
))
(declare-fun l!1114 () List!21492)

(declare-fun isEmpty!861 (List!21492) Bool)

(assert (=> b!1015687 (= res!681276 (not (isEmpty!861 l!1114)))))

(declare-fun b!1015688 () Bool)

(declare-fun res!681277 () Bool)

(assert (=> b!1015688 (=> (not res!681277) (not e!571384))))

(declare-fun newHead!31 () tuple2!15214)

(declare-fun head!951 (List!21492) tuple2!15214)

(assert (=> b!1015688 (= res!681277 (bvslt (_1!7618 newHead!31) (_1!7618 (head!951 l!1114))))))

(declare-fun res!681278 () Bool)

(assert (=> start!87946 (=> (not res!681278) (not e!571384))))

(declare-fun isStrictlySorted!602 (List!21492) Bool)

(assert (=> start!87946 (= res!681278 (isStrictlySorted!602 l!1114))))

(assert (=> start!87946 e!571384))

(assert (=> start!87946 e!571383))

(assert (=> start!87946 true))

(assert (=> start!87946 tp_is_empty!23567))

(declare-fun res!681279 () Bool)

(assert (=> b!1015689 (=> (not res!681279) (not e!571384))))

(declare-fun lambda!926 () Int)

(declare-fun forall!264 (List!21491 Int) Bool)

(assert (=> b!1015689 (= res!681279 (forall!264 keys!40 lambda!926))))

(declare-fun b!1015690 () Bool)

(assert (=> b!1015690 (= e!571384 (not true))))

(declare-fun containsKey!483 (List!21492 (_ BitVec 64)) Bool)

(assert (=> b!1015690 (containsKey!483 l!1114 (h!22685 keys!40))))

(declare-datatypes ((Unit!33231 0))(
  ( (Unit!33232) )
))
(declare-fun lt!449157 () Unit!33231)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!3 (List!21492 (_ BitVec 64)) Unit!33231)

(assert (=> b!1015690 (= lt!449157 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!3 l!1114 (h!22685 keys!40)))))

(assert (= (and start!87946 res!681278) b!1015687))

(assert (= (and b!1015687 res!681276) b!1015689))

(assert (= (and b!1015689 res!681279) b!1015688))

(assert (= (and b!1015688 res!681277) b!1015686))

(assert (= (and b!1015686 res!681275) b!1015690))

(assert (= (and start!87946 (is-Cons!21488 l!1114)) b!1015685))

(declare-fun m!937625 () Bool)

(assert (=> b!1015690 m!937625))

(declare-fun m!937627 () Bool)

(assert (=> b!1015690 m!937627))

(declare-fun m!937629 () Bool)

(assert (=> b!1015689 m!937629))

(declare-fun m!937631 () Bool)

(assert (=> b!1015688 m!937631))

(declare-fun m!937633 () Bool)

(assert (=> start!87946 m!937633))

(declare-fun m!937635 () Bool)

(assert (=> b!1015687 m!937635))

(push 1)

(assert tp_is_empty!23567)

(assert (not b!1015689))

(assert (not b!1015690))

(assert (not b!1015688))

(assert (not start!87946))

(assert (not b!1015687))

(assert (not b!1015685))

(check-sat)

