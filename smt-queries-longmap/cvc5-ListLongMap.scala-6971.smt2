; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88132 () Bool)

(assert start!88132)

(declare-fun b!1016458 () Bool)

(assert (=> b!1016458 true))

(assert (=> b!1016458 true))

(declare-fun res!681769 () Bool)

(declare-fun e!571807 () Bool)

(assert (=> start!88132 (=> (not res!681769) (not e!571807))))

(declare-datatypes ((B!1532 0))(
  ( (B!1533 (val!11850 Int)) )
))
(declare-datatypes ((tuple2!15246 0))(
  ( (tuple2!15247 (_1!7634 (_ BitVec 64)) (_2!7634 B!1532)) )
))
(declare-datatypes ((List!21523 0))(
  ( (Nil!21520) (Cons!21519 (h!22717 tuple2!15246) (t!30524 List!21523)) )
))
(declare-fun l!1114 () List!21523)

(declare-fun isStrictlySorted!618 (List!21523) Bool)

(assert (=> start!88132 (= res!681769 (isStrictlySorted!618 l!1114))))

(assert (=> start!88132 e!571807))

(declare-fun e!571809 () Bool)

(assert (=> start!88132 e!571809))

(assert (=> start!88132 true))

(declare-fun tp_is_empty!23599 () Bool)

(assert (=> start!88132 tp_is_empty!23599))

(declare-fun b!1016453 () Bool)

(declare-fun res!681768 () Bool)

(assert (=> b!1016453 (=> (not res!681768) (not e!571807))))

(declare-datatypes ((List!21524 0))(
  ( (Nil!21521) (Cons!21520 (h!22718 (_ BitVec 64)) (t!30525 List!21524)) )
))
(declare-fun keys!40 () List!21524)

(assert (=> b!1016453 (= res!681768 (is-Cons!21520 keys!40))))

(declare-fun b!1016454 () Bool)

(declare-fun e!571808 () Bool)

(assert (=> b!1016454 (= e!571807 (not e!571808))))

(declare-fun res!681765 () Bool)

(assert (=> b!1016454 (=> (not res!681765) (not e!571808))))

(declare-fun lt!449262 () List!21523)

(assert (=> b!1016454 (= res!681765 (isStrictlySorted!618 lt!449262))))

(declare-fun newHead!31 () tuple2!15246)

(assert (=> b!1016454 (= lt!449262 (Cons!21519 newHead!31 l!1114))))

(declare-fun containsKey!490 (List!21523 (_ BitVec 64)) Bool)

(assert (=> b!1016454 (containsKey!490 l!1114 (h!22718 keys!40))))

(declare-datatypes ((Unit!33245 0))(
  ( (Unit!33246) )
))
(declare-fun lt!449261 () Unit!33245)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!10 (List!21523 (_ BitVec 64)) Unit!33245)

(assert (=> b!1016454 (= lt!449261 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!10 l!1114 (h!22718 keys!40)))))

(declare-fun b!1016455 () Bool)

(assert (=> b!1016455 (= e!571808 (containsKey!490 lt!449262 (h!22718 keys!40)))))

(declare-fun b!1016456 () Bool)

(declare-fun res!681766 () Bool)

(assert (=> b!1016456 (=> (not res!681766) (not e!571807))))

(declare-fun isEmpty!883 (List!21523) Bool)

(assert (=> b!1016456 (= res!681766 (not (isEmpty!883 l!1114)))))

(declare-fun b!1016457 () Bool)

(declare-fun tp!70774 () Bool)

(assert (=> b!1016457 (= e!571809 (and tp_is_empty!23599 tp!70774))))

(declare-fun res!681770 () Bool)

(assert (=> b!1016458 (=> (not res!681770) (not e!571807))))

(declare-fun lambda!1019 () Int)

(declare-fun forall!280 (List!21524 Int) Bool)

(assert (=> b!1016458 (= res!681770 (forall!280 keys!40 lambda!1019))))

(declare-fun b!1016459 () Bool)

(declare-fun res!681767 () Bool)

(assert (=> b!1016459 (=> (not res!681767) (not e!571807))))

(declare-fun head!967 (List!21523) tuple2!15246)

(assert (=> b!1016459 (= res!681767 (bvslt (_1!7634 newHead!31) (_1!7634 (head!967 l!1114))))))

(assert (= (and start!88132 res!681769) b!1016456))

(assert (= (and b!1016456 res!681766) b!1016458))

(assert (= (and b!1016458 res!681770) b!1016459))

(assert (= (and b!1016459 res!681767) b!1016453))

(assert (= (and b!1016453 res!681768) b!1016454))

(assert (= (and b!1016454 res!681765) b!1016455))

(assert (= (and start!88132 (is-Cons!21519 l!1114)) b!1016457))

(declare-fun m!938101 () Bool)

(assert (=> b!1016458 m!938101))

(declare-fun m!938103 () Bool)

(assert (=> start!88132 m!938103))

(declare-fun m!938105 () Bool)

(assert (=> b!1016454 m!938105))

(declare-fun m!938107 () Bool)

(assert (=> b!1016454 m!938107))

(declare-fun m!938109 () Bool)

(assert (=> b!1016454 m!938109))

(declare-fun m!938111 () Bool)

(assert (=> b!1016456 m!938111))

(declare-fun m!938113 () Bool)

(assert (=> b!1016455 m!938113))

(declare-fun m!938115 () Bool)

(assert (=> b!1016459 m!938115))

(push 1)

(assert (not b!1016454))

(assert (not b!1016459))

(assert (not b!1016457))

(assert (not b!1016455))

(assert tp_is_empty!23599)

(assert (not b!1016458))

(assert (not b!1016456))

(assert (not start!88132))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121255 () Bool)

(declare-fun res!681823 () Bool)

(declare-fun e!571844 () Bool)

(assert (=> d!121255 (=> res!681823 e!571844)))

(assert (=> d!121255 (= res!681823 (is-Nil!21521 keys!40))))

(assert (=> d!121255 (= (forall!280 keys!40 lambda!1019) e!571844)))

(declare-fun b!1016530 () Bool)

(declare-fun e!571845 () Bool)

(assert (=> b!1016530 (= e!571844 e!571845)))

(declare-fun res!681824 () Bool)

(assert (=> b!1016530 (=> (not res!681824) (not e!571845))))

(declare-fun dynLambda!1916 (Int (_ BitVec 64)) Bool)

(assert (=> b!1016530 (= res!681824 (dynLambda!1916 lambda!1019 (h!22718 keys!40)))))

(declare-fun b!1016531 () Bool)

(assert (=> b!1016531 (= e!571845 (forall!280 (t!30525 keys!40) lambda!1019))))

(assert (= (and d!121255 (not res!681823)) b!1016530))

(assert (= (and b!1016530 res!681824) b!1016531))

(declare-fun b_lambda!15521 () Bool)

(assert (=> (not b_lambda!15521) (not b!1016530)))

(declare-fun m!938155 () Bool)

(assert (=> b!1016530 m!938155))

(declare-fun m!938157 () Bool)

(assert (=> b!1016531 m!938157))

(assert (=> b!1016458 d!121255))

(declare-fun d!121261 () Bool)

(assert (=> d!121261 (= (head!967 l!1114) (h!22717 l!1114))))

(assert (=> b!1016459 d!121261))

(declare-fun d!121263 () Bool)

(declare-fun res!681845 () Bool)

(declare-fun e!571866 () Bool)

(assert (=> d!121263 (=> res!681845 e!571866)))

(assert (=> d!121263 (= res!681845 (or (is-Nil!21520 lt!449262) (is-Nil!21520 (t!30524 lt!449262))))))

(assert (=> d!121263 (= (isStrictlySorted!618 lt!449262) e!571866)))

(declare-fun b!1016552 () Bool)

(declare-fun e!571867 () Bool)

(assert (=> b!1016552 (= e!571866 e!571867)))

(declare-fun res!681846 () Bool)

(assert (=> b!1016552 (=> (not res!681846) (not e!571867))))

(assert (=> b!1016552 (= res!681846 (bvslt (_1!7634 (h!22717 lt!449262)) (_1!7634 (h!22717 (t!30524 lt!449262)))))))

(declare-fun b!1016553 () Bool)

(assert (=> b!1016553 (= e!571867 (isStrictlySorted!618 (t!30524 lt!449262)))))

(assert (= (and d!121263 (not res!681845)) b!1016552))

(assert (= (and b!1016552 res!681846) b!1016553))

(declare-fun m!938167 () Bool)

(assert (=> b!1016553 m!938167))

(assert (=> b!1016454 d!121263))

(declare-fun d!121273 () Bool)

(declare-fun res!681860 () Bool)

(declare-fun e!571884 () Bool)

(assert (=> d!121273 (=> res!681860 e!571884)))

(assert (=> d!121273 (= res!681860 (and (is-Cons!21519 l!1114) (= (_1!7634 (h!22717 l!1114)) (h!22718 keys!40))))))

(assert (=> d!121273 (= (containsKey!490 l!1114 (h!22718 keys!40)) e!571884)))

(declare-fun b!1016572 () Bool)

(declare-fun e!571885 () Bool)

(assert (=> b!1016572 (= e!571884 e!571885)))

(declare-fun res!681861 () Bool)

(assert (=> b!1016572 (=> (not res!681861) (not e!571885))))

(assert (=> b!1016572 (= res!681861 (and (or (not (is-Cons!21519 l!1114)) (bvsle (_1!7634 (h!22717 l!1114)) (h!22718 keys!40))) (is-Cons!21519 l!1114) (bvslt (_1!7634 (h!22717 l!1114)) (h!22718 keys!40))))))

(declare-fun b!1016573 () Bool)

(assert (=> b!1016573 (= e!571885 (containsKey!490 (t!30524 l!1114) (h!22718 keys!40)))))

(assert (= (and d!121273 (not res!681860)) b!1016572))

(assert (= (and b!1016572 res!681861) b!1016573))

(declare-fun m!938179 () Bool)

(assert (=> b!1016573 m!938179))

(assert (=> b!1016454 d!121273))

(declare-fun d!121283 () Bool)

(assert (=> d!121283 (containsKey!490 l!1114 (h!22718 keys!40))))

(declare-fun lt!449280 () Unit!33245)

(declare-fun choose!1649 (List!21523 (_ BitVec 64)) Unit!33245)

(assert (=> d!121283 (= lt!449280 (choose!1649 l!1114 (h!22718 keys!40)))))

(declare-fun e!571894 () Bool)

(assert (=> d!121283 e!571894))

(declare-fun res!681870 () Bool)

(assert (=> d!121283 (=> (not res!681870) (not e!571894))))

(assert (=> d!121283 (= res!681870 (isStrictlySorted!618 l!1114))))

(assert (=> d!121283 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!10 l!1114 (h!22718 keys!40)) lt!449280)))

(declare-fun b!1016582 () Bool)

(declare-datatypes ((Option!604 0))(
  ( (Some!603 (v!14454 B!1532)) (None!602) )
))
(declare-fun isDefined!402 (Option!604) Bool)

(declare-fun getValueByKey!553 (List!21523 (_ BitVec 64)) Option!604)

(assert (=> b!1016582 (= e!571894 (isDefined!402 (getValueByKey!553 l!1114 (h!22718 keys!40))))))

(assert (= (and d!121283 res!681870) b!1016582))

(assert (=> d!121283 m!938107))

(declare-fun m!938183 () Bool)

(assert (=> d!121283 m!938183))

(assert (=> d!121283 m!938103))

(declare-fun m!938185 () Bool)

(assert (=> b!1016582 m!938185))

(assert (=> b!1016582 m!938185))

(declare-fun m!938187 () Bool)

(assert (=> b!1016582 m!938187))

(assert (=> b!1016454 d!121283))

(declare-fun d!121287 () Bool)

(declare-fun res!681871 () Bool)

(declare-fun e!571895 () Bool)

(assert (=> d!121287 (=> res!681871 e!571895)))

(assert (=> d!121287 (= res!681871 (or (is-Nil!21520 l!1114) (is-Nil!21520 (t!30524 l!1114))))))

(assert (=> d!121287 (= (isStrictlySorted!618 l!1114) e!571895)))

(declare-fun b!1016583 () Bool)

(declare-fun e!571896 () Bool)

(assert (=> b!1016583 (= e!571895 e!571896)))

(declare-fun res!681872 () Bool)

(assert (=> b!1016583 (=> (not res!681872) (not e!571896))))

(assert (=> b!1016583 (= res!681872 (bvslt (_1!7634 (h!22717 l!1114)) (_1!7634 (h!22717 (t!30524 l!1114)))))))

(declare-fun b!1016584 () Bool)

(assert (=> b!1016584 (= e!571896 (isStrictlySorted!618 (t!30524 l!1114)))))

(assert (= (and d!121287 (not res!681871)) b!1016583))

(assert (= (and b!1016583 res!681872) b!1016584))

(declare-fun m!938189 () Bool)

(assert (=> b!1016584 m!938189))

(assert (=> start!88132 d!121287))

(declare-fun d!121289 () Bool)

(declare-fun res!681873 () Bool)

(declare-fun e!571897 () Bool)

(assert (=> d!121289 (=> res!681873 e!571897)))

(assert (=> d!121289 (= res!681873 (and (is-Cons!21519 lt!449262) (= (_1!7634 (h!22717 lt!449262)) (h!22718 keys!40))))))

(assert (=> d!121289 (= (containsKey!490 lt!449262 (h!22718 keys!40)) e!571897)))

(declare-fun b!1016585 () Bool)

(declare-fun e!571898 () Bool)

(assert (=> b!1016585 (= e!571897 e!571898)))

(declare-fun res!681874 () Bool)

(assert (=> b!1016585 (=> (not res!681874) (not e!571898))))

(assert (=> b!1016585 (= res!681874 (and (or (not (is-Cons!21519 lt!449262)) (bvsle (_1!7634 (h!22717 lt!449262)) (h!22718 keys!40))) (is-Cons!21519 lt!449262) (bvslt (_1!7634 (h!22717 lt!449262)) (h!22718 keys!40))))))

(declare-fun b!1016586 () Bool)

(assert (=> b!1016586 (= e!571898 (containsKey!490 (t!30524 lt!449262) (h!22718 keys!40)))))

(assert (= (and d!121289 (not res!681873)) b!1016585))

(assert (= (and b!1016585 res!681874) b!1016586))

(declare-fun m!938191 () Bool)

(assert (=> b!1016586 m!938191))

(assert (=> b!1016455 d!121289))

(declare-fun d!121291 () Bool)

(assert (=> d!121291 (= (isEmpty!883 l!1114) (is-Nil!21520 l!1114))))

(assert (=> b!1016456 d!121291))

(declare-fun b!1016594 () Bool)

(declare-fun e!571904 () Bool)

(declare-fun tp!70786 () Bool)

(assert (=> b!1016594 (= e!571904 (and tp_is_empty!23599 tp!70786))))

(assert (=> b!1016457 (= tp!70774 e!571904)))

(assert (= (and b!1016457 (is-Cons!21519 (t!30524 l!1114))) b!1016594))

(declare-fun b_lambda!15527 () Bool)

(assert (= b_lambda!15521 (or b!1016458 b_lambda!15527)))

(declare-fun bs!29522 () Bool)

(declare-fun d!121295 () Bool)

(assert (= bs!29522 (and d!121295 b!1016458)))

(declare-fun value!178 () B!1532)

(assert (=> bs!29522 (= (dynLambda!1916 lambda!1019 (h!22718 keys!40)) (= (getValueByKey!553 l!1114 (h!22718 keys!40)) (Some!603 value!178)))))

(assert (=> bs!29522 m!938185))

(assert (=> b!1016530 d!121295))

(push 1)

(assert (not b!1016582))

(assert (not bs!29522))

(assert tp_is_empty!23599)

(assert (not b!1016553))

(assert (not d!121283))

(assert (not b!1016594))

(assert (not b!1016573))

(assert (not b!1016531))

(assert (not b_lambda!15527))

(assert (not b!1016586))

(assert (not b!1016584))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

