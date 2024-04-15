; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87952 () Bool)

(assert start!87952)

(declare-fun b!1015632 () Bool)

(assert (=> b!1015632 true))

(assert (=> b!1015632 true))

(declare-fun b!1015629 () Bool)

(declare-fun res!681270 () Bool)

(declare-fun e!571334 () Bool)

(assert (=> b!1015629 (=> (not res!681270) (not e!571334))))

(declare-datatypes ((B!1506 0))(
  ( (B!1507 (val!11837 Int)) )
))
(declare-datatypes ((tuple2!15300 0))(
  ( (tuple2!15301 (_1!7661 (_ BitVec 64)) (_2!7661 B!1506)) )
))
(declare-datatypes ((List!21532 0))(
  ( (Nil!21529) (Cons!21528 (h!22726 tuple2!15300) (t!30524 List!21532)) )
))
(declare-fun l!1114 () List!21532)

(declare-fun isEmpty!870 (List!21532) Bool)

(assert (=> b!1015629 (= res!681270 (not (isEmpty!870 l!1114)))))

(declare-fun b!1015630 () Bool)

(declare-fun e!571332 () Bool)

(declare-datatypes ((List!21533 0))(
  ( (Nil!21530) (Cons!21529 (h!22727 (_ BitVec 64)) (t!30525 List!21533)) )
))
(declare-fun keys!40 () List!21533)

(declare-fun lambda!947 () Int)

(declare-fun forall!271 (List!21533 Int) Bool)

(assert (=> b!1015630 (= e!571332 (forall!271 (t!30525 keys!40) lambda!947))))

(declare-fun res!681267 () Bool)

(assert (=> start!87952 (=> (not res!681267) (not e!571334))))

(declare-fun isStrictlySorted!601 (List!21532) Bool)

(assert (=> start!87952 (= res!681267 (isStrictlySorted!601 l!1114))))

(assert (=> start!87952 e!571334))

(declare-fun e!571333 () Bool)

(assert (=> start!87952 e!571333))

(assert (=> start!87952 true))

(declare-fun tp_is_empty!23573 () Bool)

(assert (=> start!87952 tp_is_empty!23573))

(declare-fun b!1015631 () Bool)

(declare-fun tp!70698 () Bool)

(assert (=> b!1015631 (= e!571333 (and tp_is_empty!23573 tp!70698))))

(declare-fun res!681272 () Bool)

(assert (=> b!1015632 (=> (not res!681272) (not e!571334))))

(assert (=> b!1015632 (= res!681272 (forall!271 keys!40 lambda!947))))

(declare-fun b!1015633 () Bool)

(declare-fun res!681268 () Bool)

(assert (=> b!1015633 (=> (not res!681268) (not e!571334))))

(assert (=> b!1015633 (= res!681268 (is-Cons!21529 keys!40))))

(declare-fun b!1015634 () Bool)

(assert (=> b!1015634 (= e!571334 (not e!571332))))

(declare-fun res!681271 () Bool)

(assert (=> b!1015634 (=> res!681271 e!571332)))

(assert (=> b!1015634 (= res!681271 (not (forall!271 (t!30525 keys!40) lambda!947)))))

(declare-fun lt!448983 () List!21532)

(declare-datatypes ((Option!595 0))(
  ( (Some!594 (v!14442 B!1506)) (None!593) )
))
(declare-fun isDefined!397 (Option!595) Bool)

(declare-fun getValueByKey!544 (List!21532 (_ BitVec 64)) Option!595)

(assert (=> b!1015634 (isDefined!397 (getValueByKey!544 lt!448983 (h!22727 keys!40)))))

(declare-datatypes ((Unit!33133 0))(
  ( (Unit!33134) )
))
(declare-fun lt!448984 () Unit!33133)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!378 (List!21532 (_ BitVec 64)) Unit!33133)

(assert (=> b!1015634 (= lt!448984 (lemmaContainsKeyImpliesGetValueByKeyDefined!378 lt!448983 (h!22727 keys!40)))))

(declare-fun newHead!31 () tuple2!15300)

(assert (=> b!1015634 (= lt!448983 (Cons!21528 newHead!31 l!1114))))

(declare-fun containsKey!486 (List!21532 (_ BitVec 64)) Bool)

(assert (=> b!1015634 (containsKey!486 l!1114 (h!22727 keys!40))))

(declare-fun lt!448982 () Unit!33133)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!6 (List!21532 (_ BitVec 64)) Unit!33133)

(assert (=> b!1015634 (= lt!448982 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!6 l!1114 (h!22727 keys!40)))))

(declare-fun b!1015635 () Bool)

(declare-fun res!681269 () Bool)

(assert (=> b!1015635 (=> (not res!681269) (not e!571334))))

(declare-fun head!953 (List!21532) tuple2!15300)

(assert (=> b!1015635 (= res!681269 (bvslt (_1!7661 newHead!31) (_1!7661 (head!953 l!1114))))))

(assert (= (and start!87952 res!681267) b!1015629))

(assert (= (and b!1015629 res!681270) b!1015632))

(assert (= (and b!1015632 res!681272) b!1015635))

(assert (= (and b!1015635 res!681269) b!1015633))

(assert (= (and b!1015633 res!681268) b!1015634))

(assert (= (and b!1015634 (not res!681271)) b!1015630))

(assert (= (and start!87952 (is-Cons!21528 l!1114)) b!1015631))

(declare-fun m!937073 () Bool)

(assert (=> b!1015632 m!937073))

(declare-fun m!937075 () Bool)

(assert (=> b!1015634 m!937075))

(declare-fun m!937077 () Bool)

(assert (=> b!1015634 m!937077))

(declare-fun m!937079 () Bool)

(assert (=> b!1015634 m!937079))

(declare-fun m!937081 () Bool)

(assert (=> b!1015634 m!937081))

(assert (=> b!1015634 m!937077))

(declare-fun m!937083 () Bool)

(assert (=> b!1015634 m!937083))

(declare-fun m!937085 () Bool)

(assert (=> b!1015634 m!937085))

(declare-fun m!937087 () Bool)

(assert (=> start!87952 m!937087))

(declare-fun m!937089 () Bool)

(assert (=> b!1015635 m!937089))

(declare-fun m!937091 () Bool)

(assert (=> b!1015629 m!937091))

(assert (=> b!1015630 m!937081))

(push 1)

(assert (not b!1015635))

(assert (not b!1015630))

(assert (not b!1015629))

(assert tp_is_empty!23573)

(assert (not b!1015631))

(assert (not b!1015632))

(assert (not b!1015634))

(assert (not start!87952))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

