; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87948 () Bool)

(assert start!87948)

(declare-fun b!1015715 () Bool)

(assert (=> b!1015715 true))

(assert (=> b!1015715 true))

(declare-fun b!1015709 () Bool)

(declare-fun res!681294 () Bool)

(declare-fun e!571393 () Bool)

(assert (=> b!1015709 (=> (not res!681294) (not e!571393))))

(declare-datatypes ((B!1502 0))(
  ( (B!1503 (val!11835 Int)) )
))
(declare-datatypes ((tuple2!15216 0))(
  ( (tuple2!15217 (_1!7619 (_ BitVec 64)) (_2!7619 B!1502)) )
))
(declare-fun newHead!31 () tuple2!15216)

(declare-datatypes ((List!21493 0))(
  ( (Nil!21490) (Cons!21489 (h!22687 tuple2!15216) (t!30494 List!21493)) )
))
(declare-fun l!1114 () List!21493)

(declare-fun head!952 (List!21493) tuple2!15216)

(assert (=> b!1015709 (= res!681294 (bvslt (_1!7619 newHead!31) (_1!7619 (head!952 l!1114))))))

(declare-fun b!1015710 () Bool)

(declare-fun res!681296 () Bool)

(assert (=> b!1015710 (=> (not res!681296) (not e!571393))))

(declare-fun isEmpty!862 (List!21493) Bool)

(assert (=> b!1015710 (= res!681296 (not (isEmpty!862 l!1114)))))

(declare-fun b!1015711 () Bool)

(declare-fun e!571391 () Bool)

(declare-datatypes ((List!21494 0))(
  ( (Nil!21491) (Cons!21490 (h!22688 (_ BitVec 64)) (t!30495 List!21494)) )
))
(declare-fun keys!40 () List!21494)

(declare-fun lambda!933 () Int)

(declare-fun forall!265 (List!21494 Int) Bool)

(assert (=> b!1015711 (= e!571391 (forall!265 (t!30495 keys!40) lambda!933))))

(declare-fun b!1015712 () Bool)

(declare-fun e!571392 () Bool)

(declare-fun tp_is_empty!23569 () Bool)

(declare-fun tp!70691 () Bool)

(assert (=> b!1015712 (= e!571392 (and tp_is_empty!23569 tp!70691))))

(declare-fun b!1015714 () Bool)

(declare-fun res!681295 () Bool)

(assert (=> b!1015714 (=> (not res!681295) (not e!571393))))

(assert (=> b!1015714 (= res!681295 (is-Cons!21490 keys!40))))

(declare-fun res!681293 () Bool)

(assert (=> b!1015715 (=> (not res!681293) (not e!571393))))

(assert (=> b!1015715 (= res!681293 (forall!265 keys!40 lambda!933))))

(declare-fun res!681292 () Bool)

(assert (=> start!87948 (=> (not res!681292) (not e!571393))))

(declare-fun isStrictlySorted!603 (List!21493) Bool)

(assert (=> start!87948 (= res!681292 (isStrictlySorted!603 l!1114))))

(assert (=> start!87948 e!571393))

(assert (=> start!87948 e!571392))

(assert (=> start!87948 true))

(assert (=> start!87948 tp_is_empty!23569))

(declare-fun b!1015713 () Bool)

(assert (=> b!1015713 (= e!571393 (not e!571391))))

(declare-fun res!681297 () Bool)

(assert (=> b!1015713 (=> res!681297 e!571391)))

(assert (=> b!1015713 (= res!681297 (not (forall!265 (t!30495 keys!40) lambda!933)))))

(declare-fun lt!449164 () List!21493)

(declare-datatypes ((Option!589 0))(
  ( (Some!588 (v!14439 B!1502)) (None!587) )
))
(declare-fun isDefined!392 (Option!589) Bool)

(declare-fun getValueByKey!538 (List!21493 (_ BitVec 64)) Option!589)

(assert (=> b!1015713 (isDefined!392 (getValueByKey!538 lt!449164 (h!22688 keys!40)))))

(declare-datatypes ((Unit!33233 0))(
  ( (Unit!33234) )
))
(declare-fun lt!449165 () Unit!33233)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!377 (List!21493 (_ BitVec 64)) Unit!33233)

(assert (=> b!1015713 (= lt!449165 (lemmaContainsKeyImpliesGetValueByKeyDefined!377 lt!449164 (h!22688 keys!40)))))

(assert (=> b!1015713 (= lt!449164 (Cons!21489 newHead!31 l!1114))))

(declare-fun containsKey!484 (List!21493 (_ BitVec 64)) Bool)

(assert (=> b!1015713 (containsKey!484 l!1114 (h!22688 keys!40))))

(declare-fun lt!449166 () Unit!33233)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!4 (List!21493 (_ BitVec 64)) Unit!33233)

(assert (=> b!1015713 (= lt!449166 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!4 l!1114 (h!22688 keys!40)))))

(assert (= (and start!87948 res!681292) b!1015710))

(assert (= (and b!1015710 res!681296) b!1015715))

(assert (= (and b!1015715 res!681293) b!1015709))

(assert (= (and b!1015709 res!681294) b!1015714))

(assert (= (and b!1015714 res!681295) b!1015713))

(assert (= (and b!1015713 (not res!681297)) b!1015711))

(assert (= (and start!87948 (is-Cons!21489 l!1114)) b!1015712))

(declare-fun m!937637 () Bool)

(assert (=> start!87948 m!937637))

(declare-fun m!937639 () Bool)

(assert (=> b!1015713 m!937639))

(declare-fun m!937641 () Bool)

(assert (=> b!1015713 m!937641))

(declare-fun m!937643 () Bool)

(assert (=> b!1015713 m!937643))

(assert (=> b!1015713 m!937641))

(declare-fun m!937645 () Bool)

(assert (=> b!1015713 m!937645))

(declare-fun m!937647 () Bool)

(assert (=> b!1015713 m!937647))

(declare-fun m!937649 () Bool)

(assert (=> b!1015713 m!937649))

(declare-fun m!937651 () Bool)

(assert (=> b!1015710 m!937651))

(declare-fun m!937653 () Bool)

(assert (=> b!1015715 m!937653))

(assert (=> b!1015711 m!937643))

(declare-fun m!937655 () Bool)

(assert (=> b!1015709 m!937655))

(push 1)

(assert (not b!1015711))

(assert tp_is_empty!23569)

(assert (not b!1015709))

(assert (not b!1015712))

(assert (not b!1015710))

(assert (not start!87948))

(assert (not b!1015713))

(assert (not b!1015715))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

