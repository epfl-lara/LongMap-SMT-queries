; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87954 () Bool)

(assert start!87954)

(declare-fun b!1015789 () Bool)

(assert (=> b!1015789 true))

(assert (=> b!1015789 true))

(declare-fun bs!29465 () Bool)

(declare-fun b!1015787 () Bool)

(assert (= bs!29465 (and b!1015787 b!1015789)))

(declare-fun lambda!954 () Int)

(declare-datatypes ((B!1508 0))(
  ( (B!1509 (val!11838 Int)) )
))
(declare-datatypes ((tuple2!15222 0))(
  ( (tuple2!15223 (_1!7622 (_ BitVec 64)) (_2!7622 B!1508)) )
))
(declare-datatypes ((List!21499 0))(
  ( (Nil!21496) (Cons!21495 (h!22693 tuple2!15222) (t!30500 List!21499)) )
))
(declare-fun lt!449196 () List!21499)

(declare-fun lambda!955 () Int)

(declare-fun l!1114 () List!21499)

(assert (=> bs!29465 (= (= lt!449196 l!1114) (= lambda!955 lambda!954))))

(assert (=> b!1015787 true))

(assert (=> b!1015787 true))

(declare-fun b!1015784 () Bool)

(declare-fun e!571418 () Bool)

(declare-fun tp_is_empty!23575 () Bool)

(declare-fun tp!70700 () Bool)

(assert (=> b!1015784 (= e!571418 (and tp_is_empty!23575 tp!70700))))

(declare-fun b!1015785 () Bool)

(declare-fun e!571420 () Bool)

(declare-fun e!571419 () Bool)

(assert (=> b!1015785 (= e!571420 (not e!571419))))

(declare-fun res!681348 () Bool)

(assert (=> b!1015785 (=> res!681348 e!571419)))

(declare-datatypes ((List!21500 0))(
  ( (Nil!21497) (Cons!21496 (h!22694 (_ BitVec 64)) (t!30501 List!21500)) )
))
(declare-fun keys!40 () List!21500)

(declare-fun forall!268 (List!21500 Int) Bool)

(assert (=> b!1015785 (= res!681348 (not (forall!268 (t!30501 keys!40) lambda!954)))))

(declare-datatypes ((Option!592 0))(
  ( (Some!591 (v!14442 B!1508)) (None!590) )
))
(declare-fun isDefined!395 (Option!592) Bool)

(declare-fun getValueByKey!541 (List!21499 (_ BitVec 64)) Option!592)

(assert (=> b!1015785 (isDefined!395 (getValueByKey!541 lt!449196 (h!22694 keys!40)))))

(declare-datatypes ((Unit!33239 0))(
  ( (Unit!33240) )
))
(declare-fun lt!449195 () Unit!33239)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!380 (List!21499 (_ BitVec 64)) Unit!33239)

(assert (=> b!1015785 (= lt!449195 (lemmaContainsKeyImpliesGetValueByKeyDefined!380 lt!449196 (h!22694 keys!40)))))

(declare-fun newHead!31 () tuple2!15222)

(assert (=> b!1015785 (= lt!449196 (Cons!21495 newHead!31 l!1114))))

(declare-fun containsKey!487 (List!21499 (_ BitVec 64)) Bool)

(assert (=> b!1015785 (containsKey!487 l!1114 (h!22694 keys!40))))

(declare-fun lt!449194 () Unit!33239)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!7 (List!21499 (_ BitVec 64)) Unit!33239)

(assert (=> b!1015785 (= lt!449194 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!7 l!1114 (h!22694 keys!40)))))

(declare-fun b!1015786 () Bool)

(declare-fun res!681350 () Bool)

(assert (=> b!1015786 (=> (not res!681350) (not e!571420))))

(declare-fun head!955 (List!21499) tuple2!15222)

(assert (=> b!1015786 (= res!681350 (bvslt (_1!7622 newHead!31) (_1!7622 (head!955 l!1114))))))

(declare-fun res!681349 () Bool)

(assert (=> start!87954 (=> (not res!681349) (not e!571420))))

(declare-fun isStrictlySorted!606 (List!21499) Bool)

(assert (=> start!87954 (= res!681349 (isStrictlySorted!606 l!1114))))

(assert (=> start!87954 e!571420))

(assert (=> start!87954 e!571418))

(assert (=> start!87954 true))

(assert (=> start!87954 tp_is_empty!23575))

(assert (=> b!1015787 (= e!571419 (isStrictlySorted!606 lt!449196))))

(assert (=> b!1015787 (forall!268 (t!30501 keys!40) lambda!955)))

(declare-fun lt!449193 () Unit!33239)

(declare-fun value!178 () B!1508)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!47 (List!21499 List!21500 B!1508 tuple2!15222) Unit!33239)

(assert (=> b!1015787 (= lt!449193 (lemmaForallGetValueByKeySameWithASmallerHead!47 l!1114 (t!30501 keys!40) value!178 newHead!31))))

(declare-fun b!1015788 () Bool)

(declare-fun res!681347 () Bool)

(assert (=> b!1015788 (=> (not res!681347) (not e!571420))))

(assert (=> b!1015788 (= res!681347 (is-Cons!21496 keys!40))))

(declare-fun res!681351 () Bool)

(assert (=> b!1015789 (=> (not res!681351) (not e!571420))))

(assert (=> b!1015789 (= res!681351 (forall!268 keys!40 lambda!954))))

(declare-fun b!1015790 () Bool)

(declare-fun res!681346 () Bool)

(assert (=> b!1015790 (=> (not res!681346) (not e!571420))))

(declare-fun isEmpty!865 (List!21499) Bool)

(assert (=> b!1015790 (= res!681346 (not (isEmpty!865 l!1114)))))

(assert (= (and start!87954 res!681349) b!1015790))

(assert (= (and b!1015790 res!681346) b!1015789))

(assert (= (and b!1015789 res!681351) b!1015786))

(assert (= (and b!1015786 res!681350) b!1015788))

(assert (= (and b!1015788 res!681347) b!1015785))

(assert (= (and b!1015785 (not res!681348)) b!1015787))

(assert (= (and start!87954 (is-Cons!21495 l!1114)) b!1015784))

(declare-fun m!937697 () Bool)

(assert (=> b!1015785 m!937697))

(declare-fun m!937699 () Bool)

(assert (=> b!1015785 m!937699))

(declare-fun m!937701 () Bool)

(assert (=> b!1015785 m!937701))

(declare-fun m!937703 () Bool)

(assert (=> b!1015785 m!937703))

(assert (=> b!1015785 m!937701))

(declare-fun m!937705 () Bool)

(assert (=> b!1015785 m!937705))

(declare-fun m!937707 () Bool)

(assert (=> b!1015785 m!937707))

(declare-fun m!937709 () Bool)

(assert (=> b!1015790 m!937709))

(declare-fun m!937711 () Bool)

(assert (=> b!1015786 m!937711))

(declare-fun m!937713 () Bool)

(assert (=> b!1015787 m!937713))

(declare-fun m!937715 () Bool)

(assert (=> b!1015787 m!937715))

(declare-fun m!937717 () Bool)

(assert (=> b!1015787 m!937717))

(declare-fun m!937719 () Bool)

(assert (=> b!1015789 m!937719))

(declare-fun m!937721 () Bool)

(assert (=> start!87954 m!937721))

(push 1)

(assert (not b!1015785))

(assert (not b!1015786))

(assert (not b!1015790))

(assert (not start!87954))

(assert (not b!1015789))

(assert (not b!1015784))

(assert tp_is_empty!23575)

(assert (not b!1015787))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121019 () Bool)

(assert (=> d!121019 (= (head!955 l!1114) (h!22693 l!1114))))

(assert (=> b!1015786 d!121019))

(declare-fun d!121021 () Bool)

(declare-fun res!681404 () Bool)

(declare-fun e!571455 () Bool)

(assert (=> d!121021 (=> res!681404 e!571455)))

(assert (=> d!121021 (= res!681404 (and (is-Cons!21495 l!1114) (= (_1!7622 (h!22693 l!1114)) (h!22694 keys!40))))))

(assert (=> d!121021 (= (containsKey!487 l!1114 (h!22694 keys!40)) e!571455)))

(declare-fun b!1015861 () Bool)

(declare-fun e!571456 () Bool)

(assert (=> b!1015861 (= e!571455 e!571456)))

(declare-fun res!681405 () Bool)

(assert (=> b!1015861 (=> (not res!681405) (not e!571456))))

(assert (=> b!1015861 (= res!681405 (and (or (not (is-Cons!21495 l!1114)) (bvsle (_1!7622 (h!22693 l!1114)) (h!22694 keys!40))) (is-Cons!21495 l!1114) (bvslt (_1!7622 (h!22693 l!1114)) (h!22694 keys!40))))))

(declare-fun b!1015862 () Bool)

(assert (=> b!1015862 (= e!571456 (containsKey!487 (t!30500 l!1114) (h!22694 keys!40)))))

(assert (= (and d!121021 (not res!681404)) b!1015861))

(assert (= (and b!1015861 res!681405) b!1015862))

(declare-fun m!937781 () Bool)

(assert (=> b!1015862 m!937781))

(assert (=> b!1015785 d!121021))

(declare-fun d!121027 () Bool)

(declare-fun res!681412 () Bool)

(declare-fun e!571463 () Bool)

(assert (=> d!121027 (=> res!681412 e!571463)))

(assert (=> d!121027 (= res!681412 (is-Nil!21497 (t!30501 keys!40)))))

(assert (=> d!121027 (= (forall!268 (t!30501 keys!40) lambda!954) e!571463)))

(declare-fun b!1015869 () Bool)

(declare-fun e!571464 () Bool)

(assert (=> b!1015869 (= e!571463 e!571464)))

(declare-fun res!681413 () Bool)

(assert (=> b!1015869 (=> (not res!681413) (not e!571464))))

(declare-fun dynLambda!1905 (Int (_ BitVec 64)) Bool)

(assert (=> b!1015869 (= res!681413 (dynLambda!1905 lambda!954 (h!22694 (t!30501 keys!40))))))

(declare-fun b!1015870 () Bool)

(assert (=> b!1015870 (= e!571464 (forall!268 (t!30501 (t!30501 keys!40)) lambda!954))))

(assert (= (and d!121027 (not res!681412)) b!1015869))

(assert (= (and b!1015869 res!681413) b!1015870))

(declare-fun b_lambda!15441 () Bool)

(assert (=> (not b_lambda!15441) (not b!1015869)))

(declare-fun m!937783 () Bool)

(assert (=> b!1015869 m!937783))

(declare-fun m!937785 () Bool)

(assert (=> b!1015870 m!937785))

(assert (=> b!1015785 d!121027))

(declare-fun b!1015897 () Bool)

(declare-fun e!571481 () Option!592)

(assert (=> b!1015897 (= e!571481 None!590)))

(declare-fun b!1015895 () Bool)

(declare-fun e!571480 () Option!592)

(assert (=> b!1015895 (= e!571480 e!571481)))

(declare-fun c!102901 () Bool)

(assert (=> b!1015895 (= c!102901 (and (is-Cons!21495 lt!449196) (not (= (_1!7622 (h!22693 lt!449196)) (h!22694 keys!40)))))))

(declare-fun b!1015894 () Bool)

(assert (=> b!1015894 (= e!571480 (Some!591 (_2!7622 (h!22693 lt!449196))))))

(declare-fun d!121033 () Bool)

(declare-fun c!102900 () Bool)

(assert (=> d!121033 (= c!102900 (and (is-Cons!21495 lt!449196) (= (_1!7622 (h!22693 lt!449196)) (h!22694 keys!40))))))

(assert (=> d!121033 (= (getValueByKey!541 lt!449196 (h!22694 keys!40)) e!571480)))

(declare-fun b!1015896 () Bool)

(assert (=> b!1015896 (= e!571481 (getValueByKey!541 (t!30500 lt!449196) (h!22694 keys!40)))))

(assert (= (and d!121033 c!102900) b!1015894))

(assert (= (and d!121033 (not c!102900)) b!1015895))

(assert (= (and b!1015895 c!102901) b!1015896))

(assert (= (and b!1015895 (not c!102901)) b!1015897))

(declare-fun m!937793 () Bool)

(assert (=> b!1015896 m!937793))

(assert (=> b!1015785 d!121033))

(declare-fun d!121041 () Bool)

(declare-fun isEmpty!869 (Option!592) Bool)

(assert (=> d!121041 (= (isDefined!395 (getValueByKey!541 lt!449196 (h!22694 keys!40))) (not (isEmpty!869 (getValueByKey!541 lt!449196 (h!22694 keys!40)))))))

(declare-fun bs!29469 () Bool)

(assert (= bs!29469 d!121041))

(assert (=> bs!29469 m!937701))

(declare-fun m!937797 () Bool)

(assert (=> bs!29469 m!937797))

(assert (=> b!1015785 d!121041))

(declare-fun d!121045 () Bool)

(assert (=> d!121045 (containsKey!487 l!1114 (h!22694 keys!40))))

(declare-fun lt!449228 () Unit!33239)

(declare-fun choose!1641 (List!21499 (_ BitVec 64)) Unit!33239)

(assert (=> d!121045 (= lt!449228 (choose!1641 l!1114 (h!22694 keys!40)))))

(declare-fun e!571496 () Bool)

(assert (=> d!121045 e!571496))

(declare-fun res!681433 () Bool)

(assert (=> d!121045 (=> (not res!681433) (not e!571496))))

(assert (=> d!121045 (= res!681433 (isStrictlySorted!606 l!1114))))

(assert (=> d!121045 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!7 l!1114 (h!22694 keys!40)) lt!449228)))

(declare-fun b!1015914 () Bool)

(assert (=> b!1015914 (= e!571496 (isDefined!395 (getValueByKey!541 l!1114 (h!22694 keys!40))))))

(assert (= (and d!121045 res!681433) b!1015914))

(assert (=> d!121045 m!937699))

(declare-fun m!937805 () Bool)

(assert (=> d!121045 m!937805))

(assert (=> d!121045 m!937721))

(declare-fun m!937807 () Bool)

(assert (=> b!1015914 m!937807))

(assert (=> b!1015914 m!937807))

(declare-fun m!937809 () Bool)

(assert (=> b!1015914 m!937809))

(assert (=> b!1015785 d!121045))

(declare-fun d!121051 () Bool)

(assert (=> d!121051 (isDefined!395 (getValueByKey!541 lt!449196 (h!22694 keys!40)))))

(declare-fun lt!449232 () Unit!33239)

(declare-fun choose!1643 (List!21499 (_ BitVec 64)) Unit!33239)

(assert (=> d!121051 (= lt!449232 (choose!1643 lt!449196 (h!22694 keys!40)))))

(declare-fun e!571514 () Bool)

(assert (=> d!121051 e!571514))

(declare-fun res!681451 () Bool)

(assert (=> d!121051 (=> (not res!681451) (not e!571514))))

(assert (=> d!121051 (= res!681451 (isStrictlySorted!606 lt!449196))))

(assert (=> d!121051 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!380 lt!449196 (h!22694 keys!40)) lt!449232)))

(declare-fun b!1015932 () Bool)

(assert (=> b!1015932 (= e!571514 (containsKey!487 lt!449196 (h!22694 keys!40)))))

(assert (= (and d!121051 res!681451) b!1015932))

(assert (=> d!121051 m!937701))

(assert (=> d!121051 m!937701))

(assert (=> d!121051 m!937705))

(declare-fun m!937827 () Bool)

(assert (=> d!121051 m!937827))

(assert (=> d!121051 m!937713))

(declare-fun m!937829 () Bool)

(assert (=> b!1015932 m!937829))

(assert (=> b!1015785 d!121051))

(declare-fun d!121063 () Bool)

(assert (=> d!121063 (= (isEmpty!865 l!1114) (is-Nil!21496 l!1114))))

(assert (=> b!1015790 d!121063))

(declare-fun d!121067 () Bool)

(declare-fun res!681454 () Bool)

(declare-fun e!571517 () Bool)

(assert (=> d!121067 (=> res!681454 e!571517)))

(assert (=> d!121067 (= res!681454 (is-Nil!21497 keys!40))))

(assert (=> d!121067 (= (forall!268 keys!40 lambda!954) e!571517)))

(declare-fun b!1015935 () Bool)

(declare-fun e!571518 () Bool)

(assert (=> b!1015935 (= e!571517 e!571518)))

(declare-fun res!681455 () Bool)

(assert (=> b!1015935 (=> (not res!681455) (not e!571518))))

(assert (=> b!1015935 (= res!681455 (dynLambda!1905 lambda!954 (h!22694 keys!40)))))

(declare-fun b!1015936 () Bool)

(assert (=> b!1015936 (= e!571518 (forall!268 (t!30501 keys!40) lambda!954))))

(assert (= (and d!121067 (not res!681454)) b!1015935))

(assert (= (and b!1015935 res!681455) b!1015936))

(declare-fun b_lambda!15449 () Bool)

(assert (=> (not b_lambda!15449) (not b!1015935)))

(declare-fun m!937833 () Bool)

(assert (=> b!1015935 m!937833))

(assert (=> b!1015936 m!937697))

(assert (=> b!1015789 d!121067))

(declare-fun d!121071 () Bool)

(declare-fun res!681465 () Bool)

(declare-fun e!571528 () Bool)

(assert (=> d!121071 (=> res!681465 e!571528)))

(assert (=> d!121071 (= res!681465 (or (is-Nil!21496 l!1114) (is-Nil!21496 (t!30500 l!1114))))))

(assert (=> d!121071 (= (isStrictlySorted!606 l!1114) e!571528)))

(declare-fun b!1015946 () Bool)

(declare-fun e!571529 () Bool)

(assert (=> b!1015946 (= e!571528 e!571529)))

(declare-fun res!681466 () Bool)

(assert (=> b!1015946 (=> (not res!681466) (not e!571529))))

(assert (=> b!1015946 (= res!681466 (bvslt (_1!7622 (h!22693 l!1114)) (_1!7622 (h!22693 (t!30500 l!1114)))))))

(declare-fun b!1015947 () Bool)

(assert (=> b!1015947 (= e!571529 (isStrictlySorted!606 (t!30500 l!1114)))))

(assert (= (and d!121071 (not res!681465)) b!1015946))

(assert (= (and b!1015946 res!681466) b!1015947))

(declare-fun m!937845 () Bool)

(assert (=> b!1015947 m!937845))

(assert (=> start!87954 d!121071))

(declare-fun d!121077 () Bool)

(declare-fun res!681467 () Bool)

(declare-fun e!571530 () Bool)

(assert (=> d!121077 (=> res!681467 e!571530)))

(assert (=> d!121077 (= res!681467 (or (is-Nil!21496 lt!449196) (is-Nil!21496 (t!30500 lt!449196))))))

(assert (=> d!121077 (= (isStrictlySorted!606 lt!449196) e!571530)))

(declare-fun b!1015948 () Bool)

(declare-fun e!571531 () Bool)

(assert (=> b!1015948 (= e!571530 e!571531)))

(declare-fun res!681468 () Bool)

(assert (=> b!1015948 (=> (not res!681468) (not e!571531))))

(assert (=> b!1015948 (= res!681468 (bvslt (_1!7622 (h!22693 lt!449196)) (_1!7622 (h!22693 (t!30500 lt!449196)))))))

(declare-fun b!1015949 () Bool)

(assert (=> b!1015949 (= e!571531 (isStrictlySorted!606 (t!30500 lt!449196)))))

(assert (= (and d!121077 (not res!681467)) b!1015948))

(assert (= (and b!1015948 res!681468) b!1015949))

(declare-fun m!937847 () Bool)

(assert (=> b!1015949 m!937847))

(assert (=> b!1015787 d!121077))

(declare-fun d!121079 () Bool)

(declare-fun res!681469 () Bool)

(declare-fun e!571532 () Bool)

(assert (=> d!121079 (=> res!681469 e!571532)))

(assert (=> d!121079 (= res!681469 (is-Nil!21497 (t!30501 keys!40)))))

(assert (=> d!121079 (= (forall!268 (t!30501 keys!40) lambda!955) e!571532)))

(declare-fun b!1015950 () Bool)

(declare-fun e!571533 () Bool)

(assert (=> b!1015950 (= e!571532 e!571533)))

(declare-fun res!681470 () Bool)

(assert (=> b!1015950 (=> (not res!681470) (not e!571533))))

(assert (=> b!1015950 (= res!681470 (dynLambda!1905 lambda!955 (h!22694 (t!30501 keys!40))))))

(declare-fun b!1015951 () Bool)

(assert (=> b!1015951 (= e!571533 (forall!268 (t!30501 (t!30501 keys!40)) lambda!955))))

(assert (= (and d!121079 (not res!681469)) b!1015950))

(assert (= (and b!1015950 res!681470) b!1015951))

(declare-fun b_lambda!15453 () Bool)

(assert (=> (not b_lambda!15453) (not b!1015950)))

(declare-fun m!937849 () Bool)

(assert (=> b!1015950 m!937849))

(declare-fun m!937851 () Bool)

(assert (=> b!1015951 m!937851))

(assert (=> b!1015787 d!121079))

(declare-fun bs!29476 () Bool)

(declare-fun b!1015991 () Bool)

(assert (= bs!29476 (and b!1015991 b!1015789)))

(declare-fun lambda!982 () Int)

(assert (=> bs!29476 (= lambda!982 lambda!954)))

(declare-fun bs!29477 () Bool)

(assert (= bs!29477 (and b!1015991 b!1015787)))

(assert (=> bs!29477 (= (= l!1114 lt!449196) (= lambda!982 lambda!955))))

(assert (=> b!1015991 true))

(assert (=> b!1015991 true))

(declare-fun bs!29481 () Bool)

(declare-fun d!121081 () Bool)

(assert (= bs!29481 (and d!121081 b!1015789)))

(declare-fun lambda!983 () Int)

(assert (=> bs!29481 (= (= (Cons!21495 newHead!31 l!1114) l!1114) (= lambda!983 lambda!954))))

(declare-fun bs!29482 () Bool)

(assert (= bs!29482 (and d!121081 b!1015787)))

(assert (=> bs!29482 (= (= (Cons!21495 newHead!31 l!1114) lt!449196) (= lambda!983 lambda!955))))

(declare-fun bs!29483 () Bool)

(assert (= bs!29483 (and d!121081 b!1015991)))

(assert (=> bs!29483 (= (= (Cons!21495 newHead!31 l!1114) l!1114) (= lambda!983 lambda!982))))

(assert (=> d!121081 true))

(assert (=> d!121081 true))

(assert (=> d!121081 true))

(assert (=> d!121081 (forall!268 (t!30501 keys!40) lambda!983)))

(declare-fun lt!449244 () Unit!33239)

(declare-fun choose!1647 (List!21499 List!21500 B!1508 tuple2!15222) Unit!33239)

(assert (=> d!121081 (= lt!449244 (choose!1647 l!1114 (t!30501 keys!40) value!178 newHead!31))))

(declare-fun e!571552 () Bool)

(assert (=> d!121081 e!571552))

(declare-fun res!681493 () Bool)

(assert (=> d!121081 (=> (not res!681493) (not e!571552))))

(assert (=> d!121081 (= res!681493 (isStrictlySorted!606 l!1114))))

(assert (=> d!121081 (= (lemmaForallGetValueByKeySameWithASmallerHead!47 l!1114 (t!30501 keys!40) value!178 newHead!31) lt!449244)))

(declare-fun b!1015990 () Bool)

(declare-fun res!681494 () Bool)

(assert (=> b!1015990 (=> (not res!681494) (not e!571552))))

(assert (=> b!1015990 (= res!681494 (not (isEmpty!865 l!1114)))))

(declare-fun res!681495 () Bool)

(assert (=> b!1015991 (=> (not res!681495) (not e!571552))))

(assert (=> b!1015991 (= res!681495 (forall!268 (t!30501 keys!40) lambda!982))))

(declare-fun b!1015992 () Bool)

(assert (=> b!1015992 (= e!571552 (bvslt (_1!7622 newHead!31) (_1!7622 (head!955 l!1114))))))

(assert (= (and d!121081 res!681493) b!1015990))

(assert (= (and b!1015990 res!681494) b!1015991))

(assert (= (and b!1015991 res!681495) b!1015992))

(declare-fun m!937875 () Bool)

(assert (=> d!121081 m!937875))

(declare-fun m!937877 () Bool)

(assert (=> d!121081 m!937877))

(assert (=> d!121081 m!937721))

(assert (=> b!1015990 m!937709))

(declare-fun m!937879 () Bool)

(assert (=> b!1015991 m!937879))

(assert (=> b!1015992 m!937711))

(assert (=> b!1015787 d!121081))

(declare-fun b!1016008 () Bool)

(declare-fun e!571560 () Bool)

(declare-fun tp!70712 () Bool)

(assert (=> b!1016008 (= e!571560 (and tp_is_empty!23575 tp!70712))))

(assert (=> b!1015784 (= tp!70700 e!571560)))

(assert (= (and b!1015784 (is-Cons!21495 (t!30500 l!1114))) b!1016008))

(declare-fun b_lambda!15463 () Bool)

(assert (= b_lambda!15441 (or b!1015789 b_lambda!15463)))

(declare-fun bs!29484 () Bool)

(declare-fun d!121097 () Bool)

(assert (= bs!29484 (and d!121097 b!1015789)))

(assert (=> bs!29484 (= (dynLambda!1905 lambda!954 (h!22694 (t!30501 keys!40))) (= (getValueByKey!541 l!1114 (h!22694 (t!30501 keys!40))) (Some!591 value!178)))))

(declare-fun m!937881 () Bool)

(assert (=> bs!29484 m!937881))

(assert (=> b!1015869 d!121097))

(declare-fun b_lambda!15465 () Bool)

(assert (= b_lambda!15449 (or b!1015789 b_lambda!15465)))

(declare-fun bs!29485 () Bool)

(declare-fun d!121099 () Bool)

(assert (= bs!29485 (and d!121099 b!1015789)))

(assert (=> bs!29485 (= (dynLambda!1905 lambda!954 (h!22694 keys!40)) (= (getValueByKey!541 l!1114 (h!22694 keys!40)) (Some!591 value!178)))))

(assert (=> bs!29485 m!937807))

(assert (=> b!1015935 d!121099))

(declare-fun b_lambda!15467 () Bool)

(assert (= b_lambda!15453 (or b!1015787 b_lambda!15467)))

(declare-fun bs!29486 () Bool)

(declare-fun d!121101 () Bool)

(assert (= bs!29486 (and d!121101 b!1015787)))

(assert (=> bs!29486 (= (dynLambda!1905 lambda!955 (h!22694 (t!30501 keys!40))) (= (getValueByKey!541 lt!449196 (h!22694 (t!30501 keys!40))) (Some!591 value!178)))))

(declare-fun m!937883 () Bool)

(assert (=> bs!29486 m!937883))

(assert (=> b!1015950 d!121101))

(push 1)

