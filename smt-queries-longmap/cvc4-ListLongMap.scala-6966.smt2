; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87952 () Bool)

(assert start!87952)

(declare-fun b!1015760 () Bool)

(assert (=> b!1015760 true))

(assert (=> b!1015760 true))

(declare-fun b!1015759 () Bool)

(declare-fun res!681332 () Bool)

(declare-fun e!571410 () Bool)

(assert (=> b!1015759 (=> (not res!681332) (not e!571410))))

(declare-datatypes ((B!1506 0))(
  ( (B!1507 (val!11837 Int)) )
))
(declare-datatypes ((tuple2!15220 0))(
  ( (tuple2!15221 (_1!7621 (_ BitVec 64)) (_2!7621 B!1506)) )
))
(declare-datatypes ((List!21497 0))(
  ( (Nil!21494) (Cons!21493 (h!22691 tuple2!15220) (t!30498 List!21497)) )
))
(declare-fun l!1114 () List!21497)

(declare-fun isEmpty!864 (List!21497) Bool)

(assert (=> b!1015759 (= res!681332 (not (isEmpty!864 l!1114)))))

(declare-fun res!681333 () Bool)

(assert (=> b!1015760 (=> (not res!681333) (not e!571410))))

(declare-datatypes ((List!21498 0))(
  ( (Nil!21495) (Cons!21494 (h!22692 (_ BitVec 64)) (t!30499 List!21498)) )
))
(declare-fun keys!40 () List!21498)

(declare-fun lambda!947 () Int)

(declare-fun forall!267 (List!21498 Int) Bool)

(assert (=> b!1015760 (= res!681333 (forall!267 keys!40 lambda!947))))

(declare-fun res!681328 () Bool)

(assert (=> start!87952 (=> (not res!681328) (not e!571410))))

(declare-fun isStrictlySorted!605 (List!21497) Bool)

(assert (=> start!87952 (= res!681328 (isStrictlySorted!605 l!1114))))

(assert (=> start!87952 e!571410))

(declare-fun e!571409 () Bool)

(assert (=> start!87952 e!571409))

(assert (=> start!87952 true))

(declare-fun tp_is_empty!23573 () Bool)

(assert (=> start!87952 tp_is_empty!23573))

(declare-fun b!1015761 () Bool)

(declare-fun e!571411 () Bool)

(assert (=> b!1015761 (= e!571410 (not e!571411))))

(declare-fun res!681331 () Bool)

(assert (=> b!1015761 (=> res!681331 e!571411)))

(assert (=> b!1015761 (= res!681331 (not (forall!267 (t!30499 keys!40) lambda!947)))))

(declare-fun lt!449183 () List!21497)

(declare-datatypes ((Option!591 0))(
  ( (Some!590 (v!14441 B!1506)) (None!589) )
))
(declare-fun isDefined!394 (Option!591) Bool)

(declare-fun getValueByKey!540 (List!21497 (_ BitVec 64)) Option!591)

(assert (=> b!1015761 (isDefined!394 (getValueByKey!540 lt!449183 (h!22692 keys!40)))))

(declare-datatypes ((Unit!33237 0))(
  ( (Unit!33238) )
))
(declare-fun lt!449184 () Unit!33237)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!379 (List!21497 (_ BitVec 64)) Unit!33237)

(assert (=> b!1015761 (= lt!449184 (lemmaContainsKeyImpliesGetValueByKeyDefined!379 lt!449183 (h!22692 keys!40)))))

(declare-fun newHead!31 () tuple2!15220)

(assert (=> b!1015761 (= lt!449183 (Cons!21493 newHead!31 l!1114))))

(declare-fun containsKey!486 (List!21497 (_ BitVec 64)) Bool)

(assert (=> b!1015761 (containsKey!486 l!1114 (h!22692 keys!40))))

(declare-fun lt!449182 () Unit!33237)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!6 (List!21497 (_ BitVec 64)) Unit!33237)

(assert (=> b!1015761 (= lt!449182 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!6 l!1114 (h!22692 keys!40)))))

(declare-fun b!1015762 () Bool)

(assert (=> b!1015762 (= e!571411 (forall!267 (t!30499 keys!40) lambda!947))))

(declare-fun b!1015763 () Bool)

(declare-fun tp!70697 () Bool)

(assert (=> b!1015763 (= e!571409 (and tp_is_empty!23573 tp!70697))))

(declare-fun b!1015764 () Bool)

(declare-fun res!681330 () Bool)

(assert (=> b!1015764 (=> (not res!681330) (not e!571410))))

(declare-fun head!954 (List!21497) tuple2!15220)

(assert (=> b!1015764 (= res!681330 (bvslt (_1!7621 newHead!31) (_1!7621 (head!954 l!1114))))))

(declare-fun b!1015765 () Bool)

(declare-fun res!681329 () Bool)

(assert (=> b!1015765 (=> (not res!681329) (not e!571410))))

(assert (=> b!1015765 (= res!681329 (is-Cons!21494 keys!40))))

(assert (= (and start!87952 res!681328) b!1015759))

(assert (= (and b!1015759 res!681332) b!1015760))

(assert (= (and b!1015760 res!681333) b!1015764))

(assert (= (and b!1015764 res!681330) b!1015765))

(assert (= (and b!1015765 res!681329) b!1015761))

(assert (= (and b!1015761 (not res!681331)) b!1015762))

(assert (= (and start!87952 (is-Cons!21493 l!1114)) b!1015763))

(declare-fun m!937677 () Bool)

(assert (=> b!1015762 m!937677))

(declare-fun m!937679 () Bool)

(assert (=> start!87952 m!937679))

(assert (=> b!1015761 m!937677))

(declare-fun m!937681 () Bool)

(assert (=> b!1015761 m!937681))

(declare-fun m!937683 () Bool)

(assert (=> b!1015761 m!937683))

(declare-fun m!937685 () Bool)

(assert (=> b!1015761 m!937685))

(declare-fun m!937687 () Bool)

(assert (=> b!1015761 m!937687))

(assert (=> b!1015761 m!937685))

(declare-fun m!937689 () Bool)

(assert (=> b!1015761 m!937689))

(declare-fun m!937691 () Bool)

(assert (=> b!1015759 m!937691))

(declare-fun m!937693 () Bool)

(assert (=> b!1015760 m!937693))

(declare-fun m!937695 () Bool)

(assert (=> b!1015764 m!937695))

(push 1)

(assert (not b!1015760))

(assert tp_is_empty!23573)

(assert (not b!1015759))

(assert (not start!87952))

(assert (not b!1015762))

(assert (not b!1015763))

(assert (not b!1015764))

(assert (not b!1015761))

(check-sat)

(pop 1)

