; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88302 () Bool)

(assert start!88302)

(declare-fun b!1017071 () Bool)

(assert (=> b!1017071 true))

(assert (=> b!1017071 true))

(declare-fun bs!29552 () Bool)

(declare-fun b!1017068 () Bool)

(assert (= bs!29552 (and b!1017068 b!1017071)))

(declare-datatypes ((B!1552 0))(
  ( (B!1553 (val!11860 Int)) )
))
(declare-datatypes ((tuple2!15266 0))(
  ( (tuple2!15267 (_1!7644 (_ BitVec 64)) (_2!7644 B!1552)) )
))
(declare-datatypes ((List!21543 0))(
  ( (Nil!21540) (Cons!21539 (h!22737 tuple2!15266) (t!30544 List!21543)) )
))
(declare-fun lt!449409 () List!21543)

(declare-fun l!1114 () List!21543)

(declare-fun lambda!1074 () Int)

(declare-fun lambda!1075 () Int)

(assert (=> bs!29552 (= (= lt!449409 l!1114) (= lambda!1075 lambda!1074))))

(assert (=> b!1017068 true))

(assert (=> b!1017068 true))

(declare-fun b!1017066 () Bool)

(declare-fun e!572196 () Bool)

(declare-fun e!572194 () Bool)

(assert (=> b!1017066 (= e!572196 (not e!572194))))

(declare-fun res!682168 () Bool)

(assert (=> b!1017066 (=> res!682168 e!572194)))

(declare-datatypes ((List!21544 0))(
  ( (Nil!21541) (Cons!21540 (h!22738 (_ BitVec 64)) (t!30545 List!21544)) )
))
(declare-fun keys!40 () List!21544)

(declare-fun forall!290 (List!21544 Int) Bool)

(assert (=> b!1017066 (= res!682168 (not (forall!290 (t!30545 keys!40) lambda!1074)))))

(declare-datatypes ((Option!613 0))(
  ( (Some!612 (v!14463 B!1552)) (None!611) )
))
(declare-fun isDefined!411 (Option!613) Bool)

(declare-fun getValueByKey!562 (List!21543 (_ BitVec 64)) Option!613)

(assert (=> b!1017066 (isDefined!411 (getValueByKey!562 lt!449409 (h!22738 keys!40)))))

(declare-datatypes ((Unit!33265 0))(
  ( (Unit!33266) )
))
(declare-fun lt!449406 () Unit!33265)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!390 (List!21543 (_ BitVec 64)) Unit!33265)

(assert (=> b!1017066 (= lt!449406 (lemmaContainsKeyImpliesGetValueByKeyDefined!390 lt!449409 (h!22738 keys!40)))))

(declare-fun newHead!31 () tuple2!15266)

(assert (=> b!1017066 (= lt!449409 (Cons!21539 newHead!31 l!1114))))

(declare-fun containsKey!500 (List!21543 (_ BitVec 64)) Bool)

(assert (=> b!1017066 (containsKey!500 l!1114 (h!22738 keys!40))))

(declare-fun lt!449408 () Unit!33265)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!20 (List!21543 (_ BitVec 64)) Unit!33265)

(assert (=> b!1017066 (= lt!449408 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!20 l!1114 (h!22738 keys!40)))))

(declare-fun b!1017067 () Bool)

(declare-fun res!682169 () Bool)

(assert (=> b!1017067 (=> (not res!682169) (not e!572196))))

(get-info :version)

(assert (=> b!1017067 (= res!682169 ((_ is Cons!21540) keys!40))))

(assert (=> b!1017068 (= e!572194 (forall!290 keys!40 lambda!1075))))

(assert (=> b!1017068 (forall!290 (t!30545 keys!40) lambda!1075)))

(declare-fun value!178 () B!1552)

(declare-fun lt!449407 () Unit!33265)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!51 (List!21543 List!21544 B!1552 tuple2!15266) Unit!33265)

(assert (=> b!1017068 (= lt!449407 (lemmaForallGetValueByKeySameWithASmallerHead!51 l!1114 (t!30545 keys!40) value!178 newHead!31))))

(declare-fun b!1017069 () Bool)

(declare-fun res!682171 () Bool)

(assert (=> b!1017069 (=> (not res!682171) (not e!572196))))

(declare-fun isEmpty!899 (List!21543) Bool)

(assert (=> b!1017069 (= res!682171 (not (isEmpty!899 l!1114)))))

(declare-fun b!1017070 () Bool)

(declare-fun e!572195 () Bool)

(declare-fun tp_is_empty!23619 () Bool)

(declare-fun tp!70831 () Bool)

(assert (=> b!1017070 (= e!572195 (and tp_is_empty!23619 tp!70831))))

(declare-fun res!682167 () Bool)

(assert (=> b!1017071 (=> (not res!682167) (not e!572196))))

(assert (=> b!1017071 (= res!682167 (forall!290 keys!40 lambda!1074))))

(declare-fun res!682170 () Bool)

(assert (=> start!88302 (=> (not res!682170) (not e!572196))))

(declare-fun isStrictlySorted!628 (List!21543) Bool)

(assert (=> start!88302 (= res!682170 (isStrictlySorted!628 l!1114))))

(assert (=> start!88302 e!572196))

(assert (=> start!88302 e!572195))

(assert (=> start!88302 true))

(assert (=> start!88302 tp_is_empty!23619))

(declare-fun b!1017072 () Bool)

(declare-fun res!682172 () Bool)

(assert (=> b!1017072 (=> (not res!682172) (not e!572196))))

(declare-fun head!977 (List!21543) tuple2!15266)

(assert (=> b!1017072 (= res!682172 (bvslt (_1!7644 newHead!31) (_1!7644 (head!977 l!1114))))))

(assert (= (and start!88302 res!682170) b!1017069))

(assert (= (and b!1017069 res!682171) b!1017071))

(assert (= (and b!1017071 res!682167) b!1017072))

(assert (= (and b!1017072 res!682172) b!1017067))

(assert (= (and b!1017067 res!682169) b!1017066))

(assert (= (and b!1017066 (not res!682168)) b!1017068))

(assert (= (and start!88302 ((_ is Cons!21539) l!1114)) b!1017070))

(declare-fun m!938535 () Bool)

(assert (=> b!1017071 m!938535))

(declare-fun m!938537 () Bool)

(assert (=> start!88302 m!938537))

(declare-fun m!938539 () Bool)

(assert (=> b!1017068 m!938539))

(declare-fun m!938541 () Bool)

(assert (=> b!1017068 m!938541))

(declare-fun m!938543 () Bool)

(assert (=> b!1017068 m!938543))

(declare-fun m!938545 () Bool)

(assert (=> b!1017069 m!938545))

(declare-fun m!938547 () Bool)

(assert (=> b!1017066 m!938547))

(declare-fun m!938549 () Bool)

(assert (=> b!1017066 m!938549))

(declare-fun m!938551 () Bool)

(assert (=> b!1017066 m!938551))

(declare-fun m!938553 () Bool)

(assert (=> b!1017066 m!938553))

(assert (=> b!1017066 m!938549))

(declare-fun m!938555 () Bool)

(assert (=> b!1017066 m!938555))

(declare-fun m!938557 () Bool)

(assert (=> b!1017066 m!938557))

(declare-fun m!938559 () Bool)

(assert (=> b!1017072 m!938559))

(check-sat (not b!1017069) (not b!1017071) (not b!1017070) tp_is_empty!23619 (not b!1017068) (not start!88302) (not b!1017066) (not b!1017072))
(check-sat)
(get-model)

(declare-fun d!121467 () Bool)

(assert (=> d!121467 (= (isEmpty!899 l!1114) ((_ is Nil!21540) l!1114))))

(assert (=> b!1017069 d!121467))

(declare-fun d!121469 () Bool)

(declare-fun res!682195 () Bool)

(declare-fun e!572210 () Bool)

(assert (=> d!121469 (=> res!682195 e!572210)))

(assert (=> d!121469 (= res!682195 ((_ is Nil!21541) keys!40))))

(assert (=> d!121469 (= (forall!290 keys!40 lambda!1075) e!572210)))

(declare-fun b!1017106 () Bool)

(declare-fun e!572211 () Bool)

(assert (=> b!1017106 (= e!572210 e!572211)))

(declare-fun res!682196 () Bool)

(assert (=> b!1017106 (=> (not res!682196) (not e!572211))))

(declare-fun dynLambda!1924 (Int (_ BitVec 64)) Bool)

(assert (=> b!1017106 (= res!682196 (dynLambda!1924 lambda!1075 (h!22738 keys!40)))))

(declare-fun b!1017107 () Bool)

(assert (=> b!1017107 (= e!572211 (forall!290 (t!30545 keys!40) lambda!1075))))

(assert (= (and d!121469 (not res!682195)) b!1017106))

(assert (= (and b!1017106 res!682196) b!1017107))

(declare-fun b_lambda!15579 () Bool)

(assert (=> (not b_lambda!15579) (not b!1017106)))

(declare-fun m!938587 () Bool)

(assert (=> b!1017106 m!938587))

(assert (=> b!1017107 m!938541))

(assert (=> b!1017068 d!121469))

(declare-fun d!121471 () Bool)

(declare-fun res!682197 () Bool)

(declare-fun e!572212 () Bool)

(assert (=> d!121471 (=> res!682197 e!572212)))

(assert (=> d!121471 (= res!682197 ((_ is Nil!21541) (t!30545 keys!40)))))

(assert (=> d!121471 (= (forall!290 (t!30545 keys!40) lambda!1075) e!572212)))

(declare-fun b!1017108 () Bool)

(declare-fun e!572213 () Bool)

(assert (=> b!1017108 (= e!572212 e!572213)))

(declare-fun res!682198 () Bool)

(assert (=> b!1017108 (=> (not res!682198) (not e!572213))))

(assert (=> b!1017108 (= res!682198 (dynLambda!1924 lambda!1075 (h!22738 (t!30545 keys!40))))))

(declare-fun b!1017109 () Bool)

(assert (=> b!1017109 (= e!572213 (forall!290 (t!30545 (t!30545 keys!40)) lambda!1075))))

(assert (= (and d!121471 (not res!682197)) b!1017108))

(assert (= (and b!1017108 res!682198) b!1017109))

(declare-fun b_lambda!15581 () Bool)

(assert (=> (not b_lambda!15581) (not b!1017108)))

(declare-fun m!938589 () Bool)

(assert (=> b!1017108 m!938589))

(declare-fun m!938591 () Bool)

(assert (=> b!1017109 m!938591))

(assert (=> b!1017068 d!121471))

(declare-fun bs!29554 () Bool)

(declare-fun b!1017123 () Bool)

(assert (= bs!29554 (and b!1017123 b!1017071)))

(declare-fun lambda!1090 () Int)

(assert (=> bs!29554 (= lambda!1090 lambda!1074)))

(declare-fun bs!29555 () Bool)

(assert (= bs!29555 (and b!1017123 b!1017068)))

(assert (=> bs!29555 (= (= l!1114 lt!449409) (= lambda!1090 lambda!1075))))

(assert (=> b!1017123 true))

(assert (=> b!1017123 true))

(declare-fun bs!29556 () Bool)

(declare-fun d!121473 () Bool)

(assert (= bs!29556 (and d!121473 b!1017071)))

(declare-fun lambda!1091 () Int)

(assert (=> bs!29556 (= (= (Cons!21539 newHead!31 l!1114) l!1114) (= lambda!1091 lambda!1074))))

(declare-fun bs!29557 () Bool)

(assert (= bs!29557 (and d!121473 b!1017068)))

(assert (=> bs!29557 (= (= (Cons!21539 newHead!31 l!1114) lt!449409) (= lambda!1091 lambda!1075))))

(declare-fun bs!29558 () Bool)

(assert (= bs!29558 (and d!121473 b!1017123)))

(assert (=> bs!29558 (= (= (Cons!21539 newHead!31 l!1114) l!1114) (= lambda!1091 lambda!1090))))

(assert (=> d!121473 true))

(assert (=> d!121473 true))

(assert (=> d!121473 true))

(assert (=> d!121473 (forall!290 (t!30545 keys!40) lambda!1091)))

(declare-fun lt!449424 () Unit!33265)

(declare-fun choose!1663 (List!21543 List!21544 B!1552 tuple2!15266) Unit!33265)

(assert (=> d!121473 (= lt!449424 (choose!1663 l!1114 (t!30545 keys!40) value!178 newHead!31))))

(declare-fun e!572222 () Bool)

(assert (=> d!121473 e!572222))

(declare-fun res!682212 () Bool)

(assert (=> d!121473 (=> (not res!682212) (not e!572222))))

(assert (=> d!121473 (= res!682212 (isStrictlySorted!628 l!1114))))

(assert (=> d!121473 (= (lemmaForallGetValueByKeySameWithASmallerHead!51 l!1114 (t!30545 keys!40) value!178 newHead!31) lt!449424)))

(declare-fun b!1017122 () Bool)

(declare-fun res!682211 () Bool)

(assert (=> b!1017122 (=> (not res!682211) (not e!572222))))

(assert (=> b!1017122 (= res!682211 (not (isEmpty!899 l!1114)))))

(declare-fun res!682213 () Bool)

(assert (=> b!1017123 (=> (not res!682213) (not e!572222))))

(assert (=> b!1017123 (= res!682213 (forall!290 (t!30545 keys!40) lambda!1090))))

(declare-fun b!1017124 () Bool)

(assert (=> b!1017124 (= e!572222 (bvslt (_1!7644 newHead!31) (_1!7644 (head!977 l!1114))))))

(assert (= (and d!121473 res!682212) b!1017122))

(assert (= (and b!1017122 res!682211) b!1017123))

(assert (= (and b!1017123 res!682213) b!1017124))

(declare-fun m!938601 () Bool)

(assert (=> d!121473 m!938601))

(declare-fun m!938603 () Bool)

(assert (=> d!121473 m!938603))

(assert (=> d!121473 m!938537))

(assert (=> b!1017122 m!938545))

(declare-fun m!938605 () Bool)

(assert (=> b!1017123 m!938605))

(assert (=> b!1017124 m!938559))

(assert (=> b!1017068 d!121473))

(declare-fun d!121491 () Bool)

(assert (=> d!121491 (= (head!977 l!1114) (h!22737 l!1114))))

(assert (=> b!1017072 d!121491))

(declare-fun d!121495 () Bool)

(assert (=> d!121495 (isDefined!411 (getValueByKey!562 lt!449409 (h!22738 keys!40)))))

(declare-fun lt!449427 () Unit!33265)

(declare-fun choose!1664 (List!21543 (_ BitVec 64)) Unit!33265)

(assert (=> d!121495 (= lt!449427 (choose!1664 lt!449409 (h!22738 keys!40)))))

(declare-fun e!572243 () Bool)

(assert (=> d!121495 e!572243))

(declare-fun res!682238 () Bool)

(assert (=> d!121495 (=> (not res!682238) (not e!572243))))

(assert (=> d!121495 (= res!682238 (isStrictlySorted!628 lt!449409))))

(assert (=> d!121495 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!390 lt!449409 (h!22738 keys!40)) lt!449427)))

(declare-fun b!1017149 () Bool)

(assert (=> b!1017149 (= e!572243 (containsKey!500 lt!449409 (h!22738 keys!40)))))

(assert (= (and d!121495 res!682238) b!1017149))

(assert (=> d!121495 m!938549))

(assert (=> d!121495 m!938549))

(assert (=> d!121495 m!938555))

(declare-fun m!938613 () Bool)

(assert (=> d!121495 m!938613))

(declare-fun m!938615 () Bool)

(assert (=> d!121495 m!938615))

(declare-fun m!938617 () Bool)

(assert (=> b!1017149 m!938617))

(assert (=> b!1017066 d!121495))

(declare-fun d!121499 () Bool)

(declare-fun res!682249 () Bool)

(declare-fun e!572250 () Bool)

(assert (=> d!121499 (=> res!682249 e!572250)))

(assert (=> d!121499 (= res!682249 (and ((_ is Cons!21539) l!1114) (= (_1!7644 (h!22737 l!1114)) (h!22738 keys!40))))))

(assert (=> d!121499 (= (containsKey!500 l!1114 (h!22738 keys!40)) e!572250)))

(declare-fun b!1017162 () Bool)

(declare-fun e!572251 () Bool)

(assert (=> b!1017162 (= e!572250 e!572251)))

(declare-fun res!682250 () Bool)

(assert (=> b!1017162 (=> (not res!682250) (not e!572251))))

(assert (=> b!1017162 (= res!682250 (and (or (not ((_ is Cons!21539) l!1114)) (bvsle (_1!7644 (h!22737 l!1114)) (h!22738 keys!40))) ((_ is Cons!21539) l!1114) (bvslt (_1!7644 (h!22737 l!1114)) (h!22738 keys!40))))))

(declare-fun b!1017163 () Bool)

(assert (=> b!1017163 (= e!572251 (containsKey!500 (t!30544 l!1114) (h!22738 keys!40)))))

(assert (= (and d!121499 (not res!682249)) b!1017162))

(assert (= (and b!1017162 res!682250) b!1017163))

(declare-fun m!938619 () Bool)

(assert (=> b!1017163 m!938619))

(assert (=> b!1017066 d!121499))

(declare-fun d!121501 () Bool)

(declare-fun isEmpty!901 (Option!613) Bool)

(assert (=> d!121501 (= (isDefined!411 (getValueByKey!562 lt!449409 (h!22738 keys!40))) (not (isEmpty!901 (getValueByKey!562 lt!449409 (h!22738 keys!40)))))))

(declare-fun bs!29560 () Bool)

(assert (= bs!29560 d!121501))

(assert (=> bs!29560 m!938549))

(declare-fun m!938621 () Bool)

(assert (=> bs!29560 m!938621))

(assert (=> b!1017066 d!121501))

(declare-fun b!1017183 () Bool)

(declare-fun e!572258 () Option!613)

(declare-fun e!572259 () Option!613)

(assert (=> b!1017183 (= e!572258 e!572259)))

(declare-fun c!102994 () Bool)

(assert (=> b!1017183 (= c!102994 (and ((_ is Cons!21539) lt!449409) (not (= (_1!7644 (h!22737 lt!449409)) (h!22738 keys!40)))))))

(declare-fun b!1017185 () Bool)

(assert (=> b!1017185 (= e!572259 None!611)))

(declare-fun b!1017184 () Bool)

(assert (=> b!1017184 (= e!572259 (getValueByKey!562 (t!30544 lt!449409) (h!22738 keys!40)))))

(declare-fun d!121503 () Bool)

(declare-fun c!102993 () Bool)

(assert (=> d!121503 (= c!102993 (and ((_ is Cons!21539) lt!449409) (= (_1!7644 (h!22737 lt!449409)) (h!22738 keys!40))))))

(assert (=> d!121503 (= (getValueByKey!562 lt!449409 (h!22738 keys!40)) e!572258)))

(declare-fun b!1017182 () Bool)

(assert (=> b!1017182 (= e!572258 (Some!612 (_2!7644 (h!22737 lt!449409))))))

(assert (= (and d!121503 c!102993) b!1017182))

(assert (= (and d!121503 (not c!102993)) b!1017183))

(assert (= (and b!1017183 c!102994) b!1017184))

(assert (= (and b!1017183 (not c!102994)) b!1017185))

(declare-fun m!938635 () Bool)

(assert (=> b!1017184 m!938635))

(assert (=> b!1017066 d!121503))

(declare-fun d!121509 () Bool)

(assert (=> d!121509 (containsKey!500 l!1114 (h!22738 keys!40))))

(declare-fun lt!449436 () Unit!33265)

(declare-fun choose!1666 (List!21543 (_ BitVec 64)) Unit!33265)

(assert (=> d!121509 (= lt!449436 (choose!1666 l!1114 (h!22738 keys!40)))))

(declare-fun e!572276 () Bool)

(assert (=> d!121509 e!572276))

(declare-fun res!682273 () Bool)

(assert (=> d!121509 (=> (not res!682273) (not e!572276))))

(assert (=> d!121509 (= res!682273 (isStrictlySorted!628 l!1114))))

(assert (=> d!121509 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!20 l!1114 (h!22738 keys!40)) lt!449436)))

(declare-fun b!1017202 () Bool)

(assert (=> b!1017202 (= e!572276 (isDefined!411 (getValueByKey!562 l!1114 (h!22738 keys!40))))))

(assert (= (and d!121509 res!682273) b!1017202))

(assert (=> d!121509 m!938557))

(declare-fun m!938647 () Bool)

(assert (=> d!121509 m!938647))

(assert (=> d!121509 m!938537))

(declare-fun m!938649 () Bool)

(assert (=> b!1017202 m!938649))

(assert (=> b!1017202 m!938649))

(declare-fun m!938651 () Bool)

(assert (=> b!1017202 m!938651))

(assert (=> b!1017066 d!121509))

(declare-fun d!121519 () Bool)

(declare-fun res!682274 () Bool)

(declare-fun e!572277 () Bool)

(assert (=> d!121519 (=> res!682274 e!572277)))

(assert (=> d!121519 (= res!682274 ((_ is Nil!21541) (t!30545 keys!40)))))

(assert (=> d!121519 (= (forall!290 (t!30545 keys!40) lambda!1074) e!572277)))

(declare-fun b!1017203 () Bool)

(declare-fun e!572278 () Bool)

(assert (=> b!1017203 (= e!572277 e!572278)))

(declare-fun res!682275 () Bool)

(assert (=> b!1017203 (=> (not res!682275) (not e!572278))))

(assert (=> b!1017203 (= res!682275 (dynLambda!1924 lambda!1074 (h!22738 (t!30545 keys!40))))))

(declare-fun b!1017204 () Bool)

(assert (=> b!1017204 (= e!572278 (forall!290 (t!30545 (t!30545 keys!40)) lambda!1074))))

(assert (= (and d!121519 (not res!682274)) b!1017203))

(assert (= (and b!1017203 res!682275) b!1017204))

(declare-fun b_lambda!15593 () Bool)

(assert (=> (not b_lambda!15593) (not b!1017203)))

(declare-fun m!938653 () Bool)

(assert (=> b!1017203 m!938653))

(declare-fun m!938655 () Bool)

(assert (=> b!1017204 m!938655))

(assert (=> b!1017066 d!121519))

(declare-fun d!121523 () Bool)

(declare-fun res!682278 () Bool)

(declare-fun e!572281 () Bool)

(assert (=> d!121523 (=> res!682278 e!572281)))

(assert (=> d!121523 (= res!682278 ((_ is Nil!21541) keys!40))))

(assert (=> d!121523 (= (forall!290 keys!40 lambda!1074) e!572281)))

(declare-fun b!1017207 () Bool)

(declare-fun e!572282 () Bool)

(assert (=> b!1017207 (= e!572281 e!572282)))

(declare-fun res!682279 () Bool)

(assert (=> b!1017207 (=> (not res!682279) (not e!572282))))

(assert (=> b!1017207 (= res!682279 (dynLambda!1924 lambda!1074 (h!22738 keys!40)))))

(declare-fun b!1017208 () Bool)

(assert (=> b!1017208 (= e!572282 (forall!290 (t!30545 keys!40) lambda!1074))))

(assert (= (and d!121523 (not res!682278)) b!1017207))

(assert (= (and b!1017207 res!682279) b!1017208))

(declare-fun b_lambda!15597 () Bool)

(assert (=> (not b_lambda!15597) (not b!1017207)))

(declare-fun m!938659 () Bool)

(assert (=> b!1017207 m!938659))

(assert (=> b!1017208 m!938551))

(assert (=> b!1017071 d!121523))

(declare-fun d!121527 () Bool)

(declare-fun res!682288 () Bool)

(declare-fun e!572297 () Bool)

(assert (=> d!121527 (=> res!682288 e!572297)))

(assert (=> d!121527 (= res!682288 (or ((_ is Nil!21540) l!1114) ((_ is Nil!21540) (t!30544 l!1114))))))

(assert (=> d!121527 (= (isStrictlySorted!628 l!1114) e!572297)))

(declare-fun b!1017229 () Bool)

(declare-fun e!572298 () Bool)

(assert (=> b!1017229 (= e!572297 e!572298)))

(declare-fun res!682289 () Bool)

(assert (=> b!1017229 (=> (not res!682289) (not e!572298))))

(assert (=> b!1017229 (= res!682289 (bvslt (_1!7644 (h!22737 l!1114)) (_1!7644 (h!22737 (t!30544 l!1114)))))))

(declare-fun b!1017230 () Bool)

(assert (=> b!1017230 (= e!572298 (isStrictlySorted!628 (t!30544 l!1114)))))

(assert (= (and d!121527 (not res!682288)) b!1017229))

(assert (= (and b!1017229 res!682289) b!1017230))

(declare-fun m!938663 () Bool)

(assert (=> b!1017230 m!938663))

(assert (=> start!88302 d!121527))

(declare-fun b!1017237 () Bool)

(declare-fun e!572303 () Bool)

(declare-fun tp!70837 () Bool)

(assert (=> b!1017237 (= e!572303 (and tp_is_empty!23619 tp!70837))))

(assert (=> b!1017070 (= tp!70831 e!572303)))

(assert (= (and b!1017070 ((_ is Cons!21539) (t!30544 l!1114))) b!1017237))

(declare-fun b_lambda!15599 () Bool)

(assert (= b_lambda!15597 (or b!1017071 b_lambda!15599)))

(declare-fun bs!29571 () Bool)

(declare-fun d!121533 () Bool)

(assert (= bs!29571 (and d!121533 b!1017071)))

(assert (=> bs!29571 (= (dynLambda!1924 lambda!1074 (h!22738 keys!40)) (= (getValueByKey!562 l!1114 (h!22738 keys!40)) (Some!612 value!178)))))

(assert (=> bs!29571 m!938649))

(assert (=> b!1017207 d!121533))

(declare-fun b_lambda!15601 () Bool)

(assert (= b_lambda!15579 (or b!1017068 b_lambda!15601)))

(declare-fun bs!29572 () Bool)

(declare-fun d!121535 () Bool)

(assert (= bs!29572 (and d!121535 b!1017068)))

(assert (=> bs!29572 (= (dynLambda!1924 lambda!1075 (h!22738 keys!40)) (= (getValueByKey!562 lt!449409 (h!22738 keys!40)) (Some!612 value!178)))))

(assert (=> bs!29572 m!938549))

(assert (=> b!1017106 d!121535))

(declare-fun b_lambda!15603 () Bool)

(assert (= b_lambda!15593 (or b!1017071 b_lambda!15603)))

(declare-fun bs!29573 () Bool)

(declare-fun d!121537 () Bool)

(assert (= bs!29573 (and d!121537 b!1017071)))

(assert (=> bs!29573 (= (dynLambda!1924 lambda!1074 (h!22738 (t!30545 keys!40))) (= (getValueByKey!562 l!1114 (h!22738 (t!30545 keys!40))) (Some!612 value!178)))))

(declare-fun m!938667 () Bool)

(assert (=> bs!29573 m!938667))

(assert (=> b!1017203 d!121537))

(declare-fun b_lambda!15605 () Bool)

(assert (= b_lambda!15581 (or b!1017068 b_lambda!15605)))

(declare-fun bs!29574 () Bool)

(declare-fun d!121539 () Bool)

(assert (= bs!29574 (and d!121539 b!1017068)))

(assert (=> bs!29574 (= (dynLambda!1924 lambda!1075 (h!22738 (t!30545 keys!40))) (= (getValueByKey!562 lt!449409 (h!22738 (t!30545 keys!40))) (Some!612 value!178)))))

(declare-fun m!938669 () Bool)

(assert (=> bs!29574 m!938669))

(assert (=> b!1017108 d!121539))

(check-sat (not b!1017237) (not b!1017230) (not b_lambda!15599) (not b!1017208) (not d!121473) (not b!1017204) (not b!1017184) (not b_lambda!15605) (not b_lambda!15603) (not b!1017109) (not b!1017149) (not bs!29571) (not bs!29573) (not b!1017123) (not d!121509) (not b!1017202) (not bs!29574) (not b!1017107) (not b_lambda!15601) (not d!121495) (not bs!29572) (not b!1017124) (not b!1017122) (not b!1017163) tp_is_empty!23619 (not d!121501))
(check-sat)
