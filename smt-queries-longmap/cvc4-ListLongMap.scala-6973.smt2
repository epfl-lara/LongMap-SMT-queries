; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88238 () Bool)

(assert start!88238)

(declare-fun b!1016867 () Bool)

(assert (=> b!1016867 true))

(assert (=> b!1016867 true))

(declare-fun b!1016864 () Bool)

(declare-fun e!572060 () Bool)

(declare-fun e!572059 () Bool)

(assert (=> b!1016864 (= e!572060 (not e!572059))))

(declare-fun res!682057 () Bool)

(assert (=> b!1016864 (=> res!682057 e!572059)))

(declare-datatypes ((List!21539 0))(
  ( (Nil!21536) (Cons!21535 (h!22733 (_ BitVec 64)) (t!30540 List!21539)) )
))
(declare-fun keys!40 () List!21539)

(declare-fun lambda!1055 () Int)

(declare-fun forall!288 (List!21539 Int) Bool)

(assert (=> b!1016864 (= res!682057 (not (forall!288 (t!30540 keys!40) lambda!1055)))))

(declare-datatypes ((B!1548 0))(
  ( (B!1549 (val!11858 Int)) )
))
(declare-datatypes ((tuple2!15262 0))(
  ( (tuple2!15263 (_1!7642 (_ BitVec 64)) (_2!7642 B!1548)) )
))
(declare-datatypes ((List!21540 0))(
  ( (Nil!21537) (Cons!21536 (h!22734 tuple2!15262) (t!30541 List!21540)) )
))
(declare-fun lt!449355 () List!21540)

(declare-datatypes ((Option!611 0))(
  ( (Some!610 (v!14461 B!1548)) (None!609) )
))
(declare-fun isDefined!409 (Option!611) Bool)

(declare-fun getValueByKey!560 (List!21540 (_ BitVec 64)) Option!611)

(assert (=> b!1016864 (isDefined!409 (getValueByKey!560 lt!449355 (h!22733 keys!40)))))

(declare-datatypes ((Unit!33261 0))(
  ( (Unit!33262) )
))
(declare-fun lt!449354 () Unit!33261)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!388 (List!21540 (_ BitVec 64)) Unit!33261)

(assert (=> b!1016864 (= lt!449354 (lemmaContainsKeyImpliesGetValueByKeyDefined!388 lt!449355 (h!22733 keys!40)))))

(declare-fun newHead!31 () tuple2!15262)

(declare-fun l!1114 () List!21540)

(assert (=> b!1016864 (= lt!449355 (Cons!21536 newHead!31 l!1114))))

(declare-fun containsKey!498 (List!21540 (_ BitVec 64)) Bool)

(assert (=> b!1016864 (containsKey!498 l!1114 (h!22733 keys!40))))

(declare-fun lt!449353 () Unit!33261)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!18 (List!21540 (_ BitVec 64)) Unit!33261)

(assert (=> b!1016864 (= lt!449353 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!18 l!1114 (h!22733 keys!40)))))

(declare-fun b!1016865 () Bool)

(declare-fun res!682053 () Bool)

(assert (=> b!1016865 (=> (not res!682053) (not e!572060))))

(assert (=> b!1016865 (= res!682053 (is-Cons!21535 keys!40))))

(declare-fun b!1016866 () Bool)

(declare-fun res!682056 () Bool)

(assert (=> b!1016866 (=> (not res!682056) (not e!572060))))

(declare-fun isEmpty!894 (List!21540) Bool)

(assert (=> b!1016866 (= res!682056 (not (isEmpty!894 l!1114)))))

(declare-fun res!682055 () Bool)

(assert (=> b!1016867 (=> (not res!682055) (not e!572060))))

(assert (=> b!1016867 (= res!682055 (forall!288 keys!40 lambda!1055))))

(declare-fun b!1016868 () Bool)

(declare-fun e!572061 () Bool)

(declare-fun tp_is_empty!23615 () Bool)

(declare-fun tp!70816 () Bool)

(assert (=> b!1016868 (= e!572061 (and tp_is_empty!23615 tp!70816))))

(declare-fun b!1016869 () Bool)

(declare-fun res!682054 () Bool)

(assert (=> b!1016869 (=> (not res!682054) (not e!572060))))

(declare-fun head!975 (List!21540) tuple2!15262)

(assert (=> b!1016869 (= res!682054 (bvslt (_1!7642 newHead!31) (_1!7642 (head!975 l!1114))))))

(declare-fun b!1016863 () Bool)

(declare-fun ListPrimitiveSize!126 (List!21539) Int)

(assert (=> b!1016863 (= e!572059 (< (ListPrimitiveSize!126 (t!30540 keys!40)) (ListPrimitiveSize!126 keys!40)))))

(declare-fun res!682058 () Bool)

(assert (=> start!88238 (=> (not res!682058) (not e!572060))))

(declare-fun isStrictlySorted!626 (List!21540) Bool)

(assert (=> start!88238 (= res!682058 (isStrictlySorted!626 l!1114))))

(assert (=> start!88238 e!572060))

(assert (=> start!88238 e!572061))

(assert (=> start!88238 true))

(assert (=> start!88238 tp_is_empty!23615))

(assert (= (and start!88238 res!682058) b!1016866))

(assert (= (and b!1016866 res!682056) b!1016867))

(assert (= (and b!1016867 res!682055) b!1016869))

(assert (= (and b!1016869 res!682054) b!1016865))

(assert (= (and b!1016865 res!682053) b!1016864))

(assert (= (and b!1016864 (not res!682057)) b!1016863))

(assert (= (and start!88238 (is-Cons!21536 l!1114)) b!1016868))

(declare-fun m!938395 () Bool)

(assert (=> b!1016864 m!938395))

(declare-fun m!938397 () Bool)

(assert (=> b!1016864 m!938397))

(declare-fun m!938399 () Bool)

(assert (=> b!1016864 m!938399))

(declare-fun m!938401 () Bool)

(assert (=> b!1016864 m!938401))

(assert (=> b!1016864 m!938397))

(declare-fun m!938403 () Bool)

(assert (=> b!1016864 m!938403))

(declare-fun m!938405 () Bool)

(assert (=> b!1016864 m!938405))

(declare-fun m!938407 () Bool)

(assert (=> b!1016866 m!938407))

(declare-fun m!938409 () Bool)

(assert (=> start!88238 m!938409))

(declare-fun m!938411 () Bool)

(assert (=> b!1016869 m!938411))

(declare-fun m!938413 () Bool)

(assert (=> b!1016867 m!938413))

(declare-fun m!938415 () Bool)

(assert (=> b!1016863 m!938415))

(declare-fun m!938417 () Bool)

(assert (=> b!1016863 m!938417))

(push 1)

(assert (not b!1016866))

(assert (not b!1016863))

(assert (not b!1016869))

(assert (not b!1016867))

(assert (not start!88238))

(assert (not b!1016868))

(assert tp_is_empty!23615)

(assert (not b!1016864))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121389 () Bool)

(declare-fun res!682083 () Bool)

(declare-fun e!572092 () Bool)

(assert (=> d!121389 (=> res!682083 e!572092)))

(assert (=> d!121389 (= res!682083 (or (is-Nil!21537 l!1114) (is-Nil!21537 (t!30541 l!1114))))))

(assert (=> d!121389 (= (isStrictlySorted!626 l!1114) e!572092)))

(declare-fun b!1016910 () Bool)

(declare-fun e!572093 () Bool)

(assert (=> b!1016910 (= e!572092 e!572093)))

(declare-fun res!682084 () Bool)

(assert (=> b!1016910 (=> (not res!682084) (not e!572093))))

(assert (=> b!1016910 (= res!682084 (bvslt (_1!7642 (h!22734 l!1114)) (_1!7642 (h!22734 (t!30541 l!1114)))))))

(declare-fun b!1016911 () Bool)

(assert (=> b!1016911 (= e!572093 (isStrictlySorted!626 (t!30541 l!1114)))))

(assert (= (and d!121389 (not res!682083)) b!1016910))

(assert (= (and b!1016910 res!682084) b!1016911))

(declare-fun m!938431 () Bool)

(assert (=> b!1016911 m!938431))

(assert (=> start!88238 d!121389))

(declare-fun d!121397 () Bool)

(declare-fun res!682095 () Bool)

(declare-fun e!572108 () Bool)

(assert (=> d!121397 (=> res!682095 e!572108)))

(assert (=> d!121397 (= res!682095 (and (is-Cons!21536 l!1114) (= (_1!7642 (h!22734 l!1114)) (h!22733 keys!40))))))

(assert (=> d!121397 (= (containsKey!498 l!1114 (h!22733 keys!40)) e!572108)))

(declare-fun b!1016930 () Bool)

(declare-fun e!572109 () Bool)

(assert (=> b!1016930 (= e!572108 e!572109)))

(declare-fun res!682096 () Bool)

(assert (=> b!1016930 (=> (not res!682096) (not e!572109))))

(assert (=> b!1016930 (= res!682096 (and (or (not (is-Cons!21536 l!1114)) (bvsle (_1!7642 (h!22734 l!1114)) (h!22733 keys!40))) (is-Cons!21536 l!1114) (bvslt (_1!7642 (h!22734 l!1114)) (h!22733 keys!40))))))

(declare-fun b!1016931 () Bool)

(assert (=> b!1016931 (= e!572109 (containsKey!498 (t!30541 l!1114) (h!22733 keys!40)))))

(assert (= (and d!121397 (not res!682095)) b!1016930))

(assert (= (and b!1016930 res!682096) b!1016931))

(declare-fun m!938445 () Bool)

(assert (=> b!1016931 m!938445))

(assert (=> b!1016864 d!121397))

(declare-fun d!121403 () Bool)

(declare-fun isEmpty!897 (Option!611) Bool)

(assert (=> d!121403 (= (isDefined!409 (getValueByKey!560 lt!449355 (h!22733 keys!40))) (not (isEmpty!897 (getValueByKey!560 lt!449355 (h!22733 keys!40)))))))

(declare-fun bs!29540 () Bool)

(assert (= bs!29540 d!121403))

(assert (=> bs!29540 m!938397))

(declare-fun m!938453 () Bool)

(assert (=> bs!29540 m!938453))

(assert (=> b!1016864 d!121403))

(declare-fun d!121407 () Bool)

(declare-fun res!682108 () Bool)

(declare-fun e!572123 () Bool)

(assert (=> d!121407 (=> res!682108 e!572123)))

(assert (=> d!121407 (= res!682108 (is-Nil!21536 (t!30540 keys!40)))))

(assert (=> d!121407 (= (forall!288 (t!30540 keys!40) lambda!1055) e!572123)))

(declare-fun b!1016947 () Bool)

(declare-fun e!572124 () Bool)

(assert (=> b!1016947 (= e!572123 e!572124)))

(declare-fun res!682109 () Bool)

(assert (=> b!1016947 (=> (not res!682109) (not e!572124))))

(declare-fun dynLambda!1923 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016947 (= res!682109 (dynLambda!1923 lambda!1055 (h!22733 (t!30540 keys!40))))))

(declare-fun b!1016948 () Bool)

(assert (=> b!1016948 (= e!572124 (forall!288 (t!30540 (t!30540 keys!40)) lambda!1055))))

(assert (= (and d!121407 (not res!682108)) b!1016947))

(assert (= (and b!1016947 res!682109) b!1016948))

(declare-fun b_lambda!15557 () Bool)

(assert (=> (not b_lambda!15557) (not b!1016947)))

(declare-fun m!938459 () Bool)

(assert (=> b!1016947 m!938459))

(declare-fun m!938461 () Bool)

(assert (=> b!1016948 m!938461))

(assert (=> b!1016864 d!121407))

(declare-fun d!121413 () Bool)

(assert (=> d!121413 (isDefined!409 (getValueByKey!560 lt!449355 (h!22733 keys!40)))))

(declare-fun lt!449369 () Unit!33261)

(declare-fun choose!1661 (List!21540 (_ BitVec 64)) Unit!33261)

(assert (=> d!121413 (= lt!449369 (choose!1661 lt!449355 (h!22733 keys!40)))))

(declare-fun e!572137 () Bool)

(assert (=> d!121413 e!572137))

(declare-fun res!682122 () Bool)

(assert (=> d!121413 (=> (not res!682122) (not e!572137))))

(assert (=> d!121413 (= res!682122 (isStrictlySorted!626 lt!449355))))

(assert (=> d!121413 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!388 lt!449355 (h!22733 keys!40)) lt!449369)))

(declare-fun b!1016961 () Bool)

(assert (=> b!1016961 (= e!572137 (containsKey!498 lt!449355 (h!22733 keys!40)))))

(assert (= (and d!121413 res!682122) b!1016961))

(assert (=> d!121413 m!938397))

(assert (=> d!121413 m!938397))

(assert (=> d!121413 m!938403))

(declare-fun m!938471 () Bool)

(assert (=> d!121413 m!938471))

(declare-fun m!938473 () Bool)

(assert (=> d!121413 m!938473))

(declare-fun m!938475 () Bool)

(assert (=> b!1016961 m!938475))

(assert (=> b!1016864 d!121413))

(declare-fun d!121425 () Bool)

(assert (=> d!121425 (containsKey!498 l!1114 (h!22733 keys!40))))

(declare-fun lt!449377 () Unit!33261)

(declare-fun choose!1662 (List!21540 (_ BitVec 64)) Unit!33261)

(assert (=> d!121425 (= lt!449377 (choose!1662 l!1114 (h!22733 keys!40)))))

(declare-fun e!572152 () Bool)

(assert (=> d!121425 e!572152))

(declare-fun res!682130 () Bool)

(assert (=> d!121425 (=> (not res!682130) (not e!572152))))

