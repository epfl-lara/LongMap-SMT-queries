; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88192 () Bool)

(assert start!88192)

(declare-fun b!1017124 () Bool)

(assert (=> b!1017124 true))

(assert (=> b!1017124 true))

(declare-fun bs!29486 () Bool)

(declare-fun b!1017122 () Bool)

(assert (= bs!29486 (and b!1017122 b!1017124)))

(declare-datatypes ((B!1508 0))(
  ( (B!1509 (val!11838 Int)) )
))
(declare-datatypes ((tuple2!15226 0))(
  ( (tuple2!15227 (_1!7624 (_ BitVec 64)) (_2!7624 B!1508)) )
))
(declare-datatypes ((List!21488 0))(
  ( (Nil!21485) (Cons!21484 (h!22691 tuple2!15226) (t!30481 List!21488)) )
))
(declare-fun lt!449710 () List!21488)

(declare-fun lambda!955 () Int)

(declare-fun lambda!954 () Int)

(declare-fun l!1114 () List!21488)

(assert (=> bs!29486 (= (= lt!449710 l!1114) (= lambda!955 lambda!954))))

(assert (=> b!1017122 true))

(assert (=> b!1017122 true))

(declare-fun b!1017118 () Bool)

(declare-fun e!572275 () Bool)

(declare-fun e!572276 () Bool)

(assert (=> b!1017118 (= e!572275 (not e!572276))))

(declare-fun res!681866 () Bool)

(assert (=> b!1017118 (=> res!681866 e!572276)))

(declare-datatypes ((List!21489 0))(
  ( (Nil!21486) (Cons!21485 (h!22692 (_ BitVec 64)) (t!30482 List!21489)) )
))
(declare-fun keys!40 () List!21489)

(declare-fun forall!270 (List!21489 Int) Bool)

(assert (=> b!1017118 (= res!681866 (not (forall!270 (t!30482 keys!40) lambda!954)))))

(declare-datatypes ((Option!589 0))(
  ( (Some!588 (v!14439 B!1508)) (None!587) )
))
(declare-fun isDefined!394 (Option!589) Bool)

(declare-fun getValueByKey!538 (List!21488 (_ BitVec 64)) Option!589)

(assert (=> b!1017118 (isDefined!394 (getValueByKey!538 lt!449710 (h!22692 keys!40)))))

(declare-datatypes ((Unit!33240 0))(
  ( (Unit!33241) )
))
(declare-fun lt!449709 () Unit!33240)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!380 (List!21488 (_ BitVec 64)) Unit!33240)

(assert (=> b!1017118 (= lt!449709 (lemmaContainsKeyImpliesGetValueByKeyDefined!380 lt!449710 (h!22692 keys!40)))))

(declare-fun newHead!31 () tuple2!15226)

(assert (=> b!1017118 (= lt!449710 (Cons!21484 newHead!31 l!1114))))

(declare-fun containsKey!489 (List!21488 (_ BitVec 64)) Bool)

(assert (=> b!1017118 (containsKey!489 l!1114 (h!22692 keys!40))))

(declare-fun lt!449711 () Unit!33240)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!7 (List!21488 (_ BitVec 64)) Unit!33240)

(assert (=> b!1017118 (= lt!449711 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!7 l!1114 (h!22692 keys!40)))))

(declare-fun b!1017119 () Bool)

(declare-fun e!572277 () Bool)

(declare-fun tp_is_empty!23575 () Bool)

(declare-fun tp!70701 () Bool)

(assert (=> b!1017119 (= e!572277 (and tp_is_empty!23575 tp!70701))))

(declare-fun res!681869 () Bool)

(assert (=> start!88192 (=> (not res!681869) (not e!572275))))

(declare-fun isStrictlySorted!594 (List!21488) Bool)

(assert (=> start!88192 (= res!681869 (isStrictlySorted!594 l!1114))))

(assert (=> start!88192 e!572275))

(assert (=> start!88192 e!572277))

(assert (=> start!88192 true))

(assert (=> start!88192 tp_is_empty!23575))

(declare-fun b!1017120 () Bool)

(declare-fun res!681865 () Bool)

(assert (=> b!1017120 (=> (not res!681865) (not e!572275))))

(declare-fun isEmpty!869 (List!21488) Bool)

(assert (=> b!1017120 (= res!681865 (not (isEmpty!869 l!1114)))))

(declare-fun b!1017121 () Bool)

(declare-fun res!681868 () Bool)

(assert (=> b!1017121 (=> (not res!681868) (not e!572275))))

(declare-fun head!951 (List!21488) tuple2!15226)

(assert (=> b!1017121 (= res!681868 (bvslt (_1!7624 newHead!31) (_1!7624 (head!951 l!1114))))))

(assert (=> b!1017122 (= e!572276 (isStrictlySorted!594 lt!449710))))

(assert (=> b!1017122 (forall!270 (t!30482 keys!40) lambda!955)))

(declare-fun lt!449708 () Unit!33240)

(declare-fun value!178 () B!1508)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!50 (List!21488 List!21489 B!1508 tuple2!15226) Unit!33240)

(assert (=> b!1017122 (= lt!449708 (lemmaForallGetValueByKeySameWithASmallerHead!50 l!1114 (t!30482 keys!40) value!178 newHead!31))))

(declare-fun b!1017123 () Bool)

(declare-fun res!681864 () Bool)

(assert (=> b!1017123 (=> (not res!681864) (not e!572275))))

(get-info :version)

(assert (=> b!1017123 (= res!681864 ((_ is Cons!21485) keys!40))))

(declare-fun res!681867 () Bool)

(assert (=> b!1017124 (=> (not res!681867) (not e!572275))))

(assert (=> b!1017124 (= res!681867 (forall!270 keys!40 lambda!954))))

(assert (= (and start!88192 res!681869) b!1017120))

(assert (= (and b!1017120 res!681865) b!1017124))

(assert (= (and b!1017124 res!681867) b!1017121))

(assert (= (and b!1017121 res!681868) b!1017123))

(assert (= (and b!1017123 res!681864) b!1017118))

(assert (= (and b!1017118 (not res!681866)) b!1017122))

(assert (= (and start!88192 ((_ is Cons!21484) l!1114)) b!1017119))

(declare-fun m!939377 () Bool)

(assert (=> b!1017120 m!939377))

(declare-fun m!939379 () Bool)

(assert (=> b!1017121 m!939379))

(declare-fun m!939381 () Bool)

(assert (=> b!1017122 m!939381))

(declare-fun m!939383 () Bool)

(assert (=> b!1017122 m!939383))

(declare-fun m!939385 () Bool)

(assert (=> b!1017122 m!939385))

(declare-fun m!939387 () Bool)

(assert (=> b!1017124 m!939387))

(declare-fun m!939389 () Bool)

(assert (=> b!1017118 m!939389))

(declare-fun m!939391 () Bool)

(assert (=> b!1017118 m!939391))

(declare-fun m!939393 () Bool)

(assert (=> b!1017118 m!939393))

(assert (=> b!1017118 m!939393))

(declare-fun m!939395 () Bool)

(assert (=> b!1017118 m!939395))

(declare-fun m!939397 () Bool)

(assert (=> b!1017118 m!939397))

(declare-fun m!939399 () Bool)

(assert (=> b!1017118 m!939399))

(declare-fun m!939401 () Bool)

(assert (=> start!88192 m!939401))

(check-sat (not b!1017120) (not b!1017119) (not b!1017121) tp_is_empty!23575 (not b!1017118) (not start!88192) (not b!1017124) (not b!1017122))
(check-sat)
(get-model)

(declare-fun d!121491 () Bool)

(declare-fun res!681910 () Bool)

(declare-fun e!572300 () Bool)

(assert (=> d!121491 (=> res!681910 e!572300)))

(assert (=> d!121491 (= res!681910 (or ((_ is Nil!21485) lt!449710) ((_ is Nil!21485) (t!30481 lt!449710))))))

(assert (=> d!121491 (= (isStrictlySorted!594 lt!449710) e!572300)))

(declare-fun b!1017183 () Bool)

(declare-fun e!572301 () Bool)

(assert (=> b!1017183 (= e!572300 e!572301)))

(declare-fun res!681911 () Bool)

(assert (=> b!1017183 (=> (not res!681911) (not e!572301))))

(assert (=> b!1017183 (= res!681911 (bvslt (_1!7624 (h!22691 lt!449710)) (_1!7624 (h!22691 (t!30481 lt!449710)))))))

(declare-fun b!1017184 () Bool)

(assert (=> b!1017184 (= e!572301 (isStrictlySorted!594 (t!30481 lt!449710)))))

(assert (= (and d!121491 (not res!681910)) b!1017183))

(assert (= (and b!1017183 res!681911) b!1017184))

(declare-fun m!939455 () Bool)

(assert (=> b!1017184 m!939455))

(assert (=> b!1017122 d!121491))

(declare-fun d!121493 () Bool)

(declare-fun res!681916 () Bool)

(declare-fun e!572306 () Bool)

(assert (=> d!121493 (=> res!681916 e!572306)))

(assert (=> d!121493 (= res!681916 ((_ is Nil!21486) (t!30482 keys!40)))))

(assert (=> d!121493 (= (forall!270 (t!30482 keys!40) lambda!955) e!572306)))

(declare-fun b!1017189 () Bool)

(declare-fun e!572307 () Bool)

(assert (=> b!1017189 (= e!572306 e!572307)))

(declare-fun res!681917 () Bool)

(assert (=> b!1017189 (=> (not res!681917) (not e!572307))))

(declare-fun dynLambda!1929 (Int (_ BitVec 64)) Bool)

(assert (=> b!1017189 (= res!681917 (dynLambda!1929 lambda!955 (h!22692 (t!30482 keys!40))))))

(declare-fun b!1017190 () Bool)

(assert (=> b!1017190 (= e!572307 (forall!270 (t!30482 (t!30482 keys!40)) lambda!955))))

(assert (= (and d!121493 (not res!681916)) b!1017189))

(assert (= (and b!1017189 res!681917) b!1017190))

(declare-fun b_lambda!15453 () Bool)

(assert (=> (not b_lambda!15453) (not b!1017189)))

(declare-fun m!939457 () Bool)

(assert (=> b!1017189 m!939457))

(declare-fun m!939459 () Bool)

(assert (=> b!1017190 m!939459))

(assert (=> b!1017122 d!121493))

(declare-fun bs!29489 () Bool)

(declare-fun b!1017222 () Bool)

(assert (= bs!29489 (and b!1017222 b!1017124)))

(declare-fun lambda!980 () Int)

(assert (=> bs!29489 (= lambda!980 lambda!954)))

(declare-fun bs!29490 () Bool)

(assert (= bs!29490 (and b!1017222 b!1017122)))

(assert (=> bs!29490 (= (= l!1114 lt!449710) (= lambda!980 lambda!955))))

(assert (=> b!1017222 true))

(assert (=> b!1017222 true))

(declare-fun bs!29493 () Bool)

(declare-fun d!121495 () Bool)

(assert (= bs!29493 (and d!121495 b!1017124)))

(declare-fun lambda!982 () Int)

(assert (=> bs!29493 (= (= (Cons!21484 newHead!31 l!1114) l!1114) (= lambda!982 lambda!954))))

(declare-fun bs!29494 () Bool)

(assert (= bs!29494 (and d!121495 b!1017122)))

(assert (=> bs!29494 (= (= (Cons!21484 newHead!31 l!1114) lt!449710) (= lambda!982 lambda!955))))

(declare-fun bs!29497 () Bool)

(assert (= bs!29497 (and d!121495 b!1017222)))

(assert (=> bs!29497 (= (= (Cons!21484 newHead!31 l!1114) l!1114) (= lambda!982 lambda!980))))

(assert (=> d!121495 true))

(assert (=> d!121495 true))

(assert (=> d!121495 true))

(assert (=> d!121495 (forall!270 (t!30482 keys!40) lambda!982)))

(declare-fun lt!449740 () Unit!33240)

(declare-fun choose!1645 (List!21488 List!21489 B!1508 tuple2!15226) Unit!33240)

(assert (=> d!121495 (= lt!449740 (choose!1645 l!1114 (t!30482 keys!40) value!178 newHead!31))))

(declare-fun e!572330 () Bool)

(assert (=> d!121495 e!572330))

(declare-fun res!681949 () Bool)

(assert (=> d!121495 (=> (not res!681949) (not e!572330))))

(assert (=> d!121495 (= res!681949 (isStrictlySorted!594 l!1114))))

(assert (=> d!121495 (= (lemmaForallGetValueByKeySameWithASmallerHead!50 l!1114 (t!30482 keys!40) value!178 newHead!31) lt!449740)))

(declare-fun b!1017221 () Bool)

(declare-fun res!681950 () Bool)

(assert (=> b!1017221 (=> (not res!681950) (not e!572330))))

(assert (=> b!1017221 (= res!681950 (not (isEmpty!869 l!1114)))))

(declare-fun res!681948 () Bool)

(assert (=> b!1017222 (=> (not res!681948) (not e!572330))))

(assert (=> b!1017222 (= res!681948 (forall!270 (t!30482 keys!40) lambda!980))))

(declare-fun b!1017223 () Bool)

(assert (=> b!1017223 (= e!572330 (bvslt (_1!7624 newHead!31) (_1!7624 (head!951 l!1114))))))

(assert (= (and d!121495 res!681949) b!1017221))

(assert (= (and b!1017221 res!681950) b!1017222))

(assert (= (and b!1017222 res!681948) b!1017223))

(declare-fun m!939477 () Bool)

(assert (=> d!121495 m!939477))

(declare-fun m!939479 () Bool)

(assert (=> d!121495 m!939479))

(assert (=> d!121495 m!939401))

(assert (=> b!1017221 m!939377))

(declare-fun m!939481 () Bool)

(assert (=> b!1017222 m!939481))

(assert (=> b!1017223 m!939379))

(assert (=> b!1017122 d!121495))

(declare-fun d!121515 () Bool)

(declare-fun res!681960 () Bool)

(declare-fun e!572338 () Bool)

(assert (=> d!121515 (=> res!681960 e!572338)))

(assert (=> d!121515 (= res!681960 (or ((_ is Nil!21485) l!1114) ((_ is Nil!21485) (t!30481 l!1114))))))

(assert (=> d!121515 (= (isStrictlySorted!594 l!1114) e!572338)))

(declare-fun b!1017237 () Bool)

(declare-fun e!572339 () Bool)

(assert (=> b!1017237 (= e!572338 e!572339)))

(declare-fun res!681961 () Bool)

(assert (=> b!1017237 (=> (not res!681961) (not e!572339))))

(assert (=> b!1017237 (= res!681961 (bvslt (_1!7624 (h!22691 l!1114)) (_1!7624 (h!22691 (t!30481 l!1114)))))))

(declare-fun b!1017238 () Bool)

(assert (=> b!1017238 (= e!572339 (isStrictlySorted!594 (t!30481 l!1114)))))

(assert (= (and d!121515 (not res!681960)) b!1017237))

(assert (= (and b!1017237 res!681961) b!1017238))

(declare-fun m!939483 () Bool)

(assert (=> b!1017238 m!939483))

(assert (=> start!88192 d!121515))

(declare-fun d!121519 () Bool)

(declare-fun isEmpty!872 (Option!589) Bool)

(assert (=> d!121519 (= (isDefined!394 (getValueByKey!538 lt!449710 (h!22692 keys!40))) (not (isEmpty!872 (getValueByKey!538 lt!449710 (h!22692 keys!40)))))))

(declare-fun bs!29499 () Bool)

(assert (= bs!29499 d!121519))

(assert (=> bs!29499 m!939393))

(declare-fun m!939485 () Bool)

(assert (=> bs!29499 m!939485))

(assert (=> b!1017118 d!121519))

(declare-fun d!121521 () Bool)

(declare-fun c!103311 () Bool)

(assert (=> d!121521 (= c!103311 (and ((_ is Cons!21484) lt!449710) (= (_1!7624 (h!22691 lt!449710)) (h!22692 keys!40))))))

(declare-fun e!572362 () Option!589)

(assert (=> d!121521 (= (getValueByKey!538 lt!449710 (h!22692 keys!40)) e!572362)))

(declare-fun b!1017267 () Bool)

(declare-fun e!572363 () Option!589)

(assert (=> b!1017267 (= e!572363 (getValueByKey!538 (t!30481 lt!449710) (h!22692 keys!40)))))

(declare-fun b!1017268 () Bool)

(assert (=> b!1017268 (= e!572363 None!587)))

(declare-fun b!1017265 () Bool)

(assert (=> b!1017265 (= e!572362 (Some!588 (_2!7624 (h!22691 lt!449710))))))

(declare-fun b!1017266 () Bool)

(assert (=> b!1017266 (= e!572362 e!572363)))

(declare-fun c!103312 () Bool)

(assert (=> b!1017266 (= c!103312 (and ((_ is Cons!21484) lt!449710) (not (= (_1!7624 (h!22691 lt!449710)) (h!22692 keys!40)))))))

(assert (= (and d!121521 c!103311) b!1017265))

(assert (= (and d!121521 (not c!103311)) b!1017266))

(assert (= (and b!1017266 c!103312) b!1017267))

(assert (= (and b!1017266 (not c!103312)) b!1017268))

(declare-fun m!939505 () Bool)

(assert (=> b!1017267 m!939505))

(assert (=> b!1017118 d!121521))

(declare-fun d!121533 () Bool)

(assert (=> d!121533 (containsKey!489 l!1114 (h!22692 keys!40))))

(declare-fun lt!449750 () Unit!33240)

(declare-fun choose!1647 (List!21488 (_ BitVec 64)) Unit!33240)

(assert (=> d!121533 (= lt!449750 (choose!1647 l!1114 (h!22692 keys!40)))))

(declare-fun e!572376 () Bool)

(assert (=> d!121533 e!572376))

(declare-fun res!681986 () Bool)

(assert (=> d!121533 (=> (not res!681986) (not e!572376))))

(assert (=> d!121533 (= res!681986 (isStrictlySorted!594 l!1114))))

(assert (=> d!121533 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!7 l!1114 (h!22692 keys!40)) lt!449750)))

(declare-fun b!1017287 () Bool)

(assert (=> b!1017287 (= e!572376 (isDefined!394 (getValueByKey!538 l!1114 (h!22692 keys!40))))))

(assert (= (and d!121533 res!681986) b!1017287))

(assert (=> d!121533 m!939391))

(declare-fun m!939517 () Bool)

(assert (=> d!121533 m!939517))

(assert (=> d!121533 m!939401))

(declare-fun m!939519 () Bool)

(assert (=> b!1017287 m!939519))

(assert (=> b!1017287 m!939519))

(declare-fun m!939521 () Bool)

(assert (=> b!1017287 m!939521))

(assert (=> b!1017118 d!121533))

(declare-fun d!121541 () Bool)

(assert (=> d!121541 (isDefined!394 (getValueByKey!538 lt!449710 (h!22692 keys!40)))))

(declare-fun lt!449756 () Unit!33240)

(declare-fun choose!1649 (List!21488 (_ BitVec 64)) Unit!33240)

(assert (=> d!121541 (= lt!449756 (choose!1649 lt!449710 (h!22692 keys!40)))))

(declare-fun e!572390 () Bool)

(assert (=> d!121541 e!572390))

(declare-fun res!681996 () Bool)

(assert (=> d!121541 (=> (not res!681996) (not e!572390))))

(assert (=> d!121541 (= res!681996 (isStrictlySorted!594 lt!449710))))

(assert (=> d!121541 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!380 lt!449710 (h!22692 keys!40)) lt!449756)))

(declare-fun b!1017305 () Bool)

(assert (=> b!1017305 (= e!572390 (containsKey!489 lt!449710 (h!22692 keys!40)))))

(assert (= (and d!121541 res!681996) b!1017305))

(assert (=> d!121541 m!939393))

(assert (=> d!121541 m!939393))

(assert (=> d!121541 m!939395))

(declare-fun m!939533 () Bool)

(assert (=> d!121541 m!939533))

(assert (=> d!121541 m!939381))

(declare-fun m!939535 () Bool)

(assert (=> b!1017305 m!939535))

(assert (=> b!1017118 d!121541))

(declare-fun d!121551 () Bool)

(declare-fun res!682004 () Bool)

(declare-fun e!572403 () Bool)

(assert (=> d!121551 (=> res!682004 e!572403)))

(assert (=> d!121551 (= res!682004 (and ((_ is Cons!21484) l!1114) (= (_1!7624 (h!22691 l!1114)) (h!22692 keys!40))))))

(assert (=> d!121551 (= (containsKey!489 l!1114 (h!22692 keys!40)) e!572403)))

(declare-fun b!1017322 () Bool)

(declare-fun e!572404 () Bool)

(assert (=> b!1017322 (= e!572403 e!572404)))

(declare-fun res!682005 () Bool)

(assert (=> b!1017322 (=> (not res!682005) (not e!572404))))

(assert (=> b!1017322 (= res!682005 (and (or (not ((_ is Cons!21484) l!1114)) (bvsle (_1!7624 (h!22691 l!1114)) (h!22692 keys!40))) ((_ is Cons!21484) l!1114) (bvslt (_1!7624 (h!22691 l!1114)) (h!22692 keys!40))))))

(declare-fun b!1017323 () Bool)

(assert (=> b!1017323 (= e!572404 (containsKey!489 (t!30481 l!1114) (h!22692 keys!40)))))

(assert (= (and d!121551 (not res!682004)) b!1017322))

(assert (= (and b!1017322 res!682005) b!1017323))

(declare-fun m!939543 () Bool)

(assert (=> b!1017323 m!939543))

(assert (=> b!1017118 d!121551))

(declare-fun d!121561 () Bool)

(declare-fun res!682006 () Bool)

(declare-fun e!572405 () Bool)

(assert (=> d!121561 (=> res!682006 e!572405)))

(assert (=> d!121561 (= res!682006 ((_ is Nil!21486) (t!30482 keys!40)))))

(assert (=> d!121561 (= (forall!270 (t!30482 keys!40) lambda!954) e!572405)))

(declare-fun b!1017324 () Bool)

(declare-fun e!572406 () Bool)

(assert (=> b!1017324 (= e!572405 e!572406)))

(declare-fun res!682007 () Bool)

(assert (=> b!1017324 (=> (not res!682007) (not e!572406))))

(assert (=> b!1017324 (= res!682007 (dynLambda!1929 lambda!954 (h!22692 (t!30482 keys!40))))))

(declare-fun b!1017325 () Bool)

(assert (=> b!1017325 (= e!572406 (forall!270 (t!30482 (t!30482 keys!40)) lambda!954))))

(assert (= (and d!121561 (not res!682006)) b!1017324))

(assert (= (and b!1017324 res!682007) b!1017325))

(declare-fun b_lambda!15471 () Bool)

(assert (=> (not b_lambda!15471) (not b!1017324)))

(declare-fun m!939551 () Bool)

(assert (=> b!1017324 m!939551))

(declare-fun m!939553 () Bool)

(assert (=> b!1017325 m!939553))

(assert (=> b!1017118 d!121561))

(declare-fun d!121567 () Bool)

(declare-fun res!682012 () Bool)

(declare-fun e!572411 () Bool)

(assert (=> d!121567 (=> res!682012 e!572411)))

(assert (=> d!121567 (= res!682012 ((_ is Nil!21486) keys!40))))

(assert (=> d!121567 (= (forall!270 keys!40 lambda!954) e!572411)))

(declare-fun b!1017330 () Bool)

(declare-fun e!572412 () Bool)

(assert (=> b!1017330 (= e!572411 e!572412)))

(declare-fun res!682013 () Bool)

(assert (=> b!1017330 (=> (not res!682013) (not e!572412))))

(assert (=> b!1017330 (= res!682013 (dynLambda!1929 lambda!954 (h!22692 keys!40)))))

(declare-fun b!1017331 () Bool)

(assert (=> b!1017331 (= e!572412 (forall!270 (t!30482 keys!40) lambda!954))))

(assert (= (and d!121567 (not res!682012)) b!1017330))

(assert (= (and b!1017330 res!682013) b!1017331))

(declare-fun b_lambda!15475 () Bool)

(assert (=> (not b_lambda!15475) (not b!1017330)))

(declare-fun m!939559 () Bool)

(assert (=> b!1017330 m!939559))

(assert (=> b!1017331 m!939389))

(assert (=> b!1017124 d!121567))

(declare-fun d!121571 () Bool)

(assert (=> d!121571 (= (isEmpty!869 l!1114) ((_ is Nil!21485) l!1114))))

(assert (=> b!1017120 d!121571))

(declare-fun d!121573 () Bool)

(assert (=> d!121573 (= (head!951 l!1114) (h!22691 l!1114))))

(assert (=> b!1017121 d!121573))

(declare-fun b!1017336 () Bool)

(declare-fun e!572415 () Bool)

(declare-fun tp!70713 () Bool)

(assert (=> b!1017336 (= e!572415 (and tp_is_empty!23575 tp!70713))))

(assert (=> b!1017119 (= tp!70701 e!572415)))

(assert (= (and b!1017119 ((_ is Cons!21484) (t!30481 l!1114))) b!1017336))

(declare-fun b_lambda!15477 () Bool)

(assert (= b_lambda!15453 (or b!1017122 b_lambda!15477)))

(declare-fun bs!29505 () Bool)

(declare-fun d!121575 () Bool)

(assert (= bs!29505 (and d!121575 b!1017122)))

(assert (=> bs!29505 (= (dynLambda!1929 lambda!955 (h!22692 (t!30482 keys!40))) (= (getValueByKey!538 lt!449710 (h!22692 (t!30482 keys!40))) (Some!588 value!178)))))

(declare-fun m!939561 () Bool)

(assert (=> bs!29505 m!939561))

(assert (=> b!1017189 d!121575))

(declare-fun b_lambda!15479 () Bool)

(assert (= b_lambda!15471 (or b!1017124 b_lambda!15479)))

(declare-fun bs!29506 () Bool)

(declare-fun d!121577 () Bool)

(assert (= bs!29506 (and d!121577 b!1017124)))

(assert (=> bs!29506 (= (dynLambda!1929 lambda!954 (h!22692 (t!30482 keys!40))) (= (getValueByKey!538 l!1114 (h!22692 (t!30482 keys!40))) (Some!588 value!178)))))

(declare-fun m!939563 () Bool)

(assert (=> bs!29506 m!939563))

(assert (=> b!1017324 d!121577))

(declare-fun b_lambda!15481 () Bool)

(assert (= b_lambda!15475 (or b!1017124 b_lambda!15481)))

(declare-fun bs!29507 () Bool)

(declare-fun d!121579 () Bool)

(assert (= bs!29507 (and d!121579 b!1017124)))

(assert (=> bs!29507 (= (dynLambda!1929 lambda!954 (h!22692 keys!40)) (= (getValueByKey!538 l!1114 (h!22692 keys!40)) (Some!588 value!178)))))

(assert (=> bs!29507 m!939519))

(assert (=> b!1017330 d!121579))

(check-sat (not b!1017222) (not d!121519) (not bs!29507) (not b!1017325) (not b_lambda!15481) (not b!1017336) (not bs!29505) tp_is_empty!23575 (not d!121533) (not b_lambda!15477) (not bs!29506) (not b!1017223) (not b!1017221) (not b!1017190) (not b!1017267) (not b!1017238) (not b!1017287) (not b_lambda!15479) (not d!121541) (not d!121495) (not b!1017305) (not b!1017323) (not b!1017331) (not b!1017184))
(check-sat)
