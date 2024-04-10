; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2886 () Bool)

(assert start!2886)

(declare-fun b_free!571 () Bool)

(declare-fun b_next!571 () Bool)

(assert (=> start!2886 (= b_free!571 (not b_next!571))))

(declare-fun tp!2888 () Bool)

(declare-fun b_and!1189 () Bool)

(assert (=> start!2886 (= tp!2888 b_and!1189)))

(declare-fun res!12305 () Bool)

(declare-fun e!10252 () Bool)

(assert (=> start!2886 (=> (not res!12305) (not e!10252))))

(declare-datatypes ((B!692 0))(
  ( (B!693 (val!444 Int)) )
))
(declare-datatypes ((tuple2!688 0))(
  ( (tuple2!689 (_1!344 (_ BitVec 64)) (_2!344 B!692)) )
))
(declare-datatypes ((List!529 0))(
  ( (Nil!526) (Cons!525 (h!1091 tuple2!688) (t!3142 List!529)) )
))
(declare-datatypes ((ListLongMap!519 0))(
  ( (ListLongMap!520 (toList!275 List!529)) )
))
(declare-fun lm!221 () ListLongMap!519)

(declare-fun p!191 () Int)

(declare-fun forall!146 (List!529 Int) Bool)

(assert (=> start!2886 (= res!12305 (forall!146 (toList!275 lm!221) p!191))))

(assert (=> start!2886 e!10252))

(declare-fun e!10251 () Bool)

(declare-fun inv!896 (ListLongMap!519) Bool)

(assert (=> start!2886 (and (inv!896 lm!221) e!10251)))

(assert (=> start!2886 tp!2888))

(assert (=> start!2886 true))

(declare-fun b!16572 () Bool)

(declare-fun res!12304 () Bool)

(assert (=> b!16572 (=> (not res!12304) (not e!10252))))

(declare-fun isEmpty!164 (ListLongMap!519) Bool)

(assert (=> b!16572 (= res!12304 (isEmpty!164 lm!221))))

(declare-fun a!507 () (_ BitVec 64))

(declare-fun b!16573 () Bool)

(declare-fun -!33 (ListLongMap!519 (_ BitVec 64)) ListLongMap!519)

(assert (=> b!16573 (= e!10252 (not (forall!146 (toList!275 (-!33 lm!221 a!507)) p!191)))))

(declare-fun b!16574 () Bool)

(declare-fun tp!2887 () Bool)

(assert (=> b!16574 (= e!10251 tp!2887)))

(assert (= (and start!2886 res!12305) b!16572))

(assert (= (and b!16572 res!12304) b!16573))

(assert (= start!2886 b!16574))

(declare-fun m!11671 () Bool)

(assert (=> start!2886 m!11671))

(declare-fun m!11673 () Bool)

(assert (=> start!2886 m!11673))

(declare-fun m!11675 () Bool)

(assert (=> b!16572 m!11675))

(declare-fun m!11677 () Bool)

(assert (=> b!16573 m!11677))

(declare-fun m!11679 () Bool)

(assert (=> b!16573 m!11679))

(push 1)

(assert (not b_next!571))

(assert (not b!16572))

(assert b_and!1189)

(assert (not b!16574))

(assert (not b!16573))

(assert (not start!2886))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1189)

(assert (not b_next!571))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!3293 () Bool)

(declare-fun isEmpty!167 (List!529) Bool)

(assert (=> d!3293 (= (isEmpty!164 lm!221) (isEmpty!167 (toList!275 lm!221)))))

(declare-fun bs!789 () Bool)

(assert (= bs!789 d!3293))

(declare-fun m!11701 () Bool)

(assert (=> bs!789 m!11701))

(assert (=> b!16572 d!3293))

(declare-fun d!3297 () Bool)

(declare-fun res!12326 () Bool)

(declare-fun e!10273 () Bool)

(assert (=> d!3297 (=> res!12326 e!10273)))

(assert (=> d!3297 (= res!12326 (is-Nil!526 (toList!275 lm!221)))))

(assert (=> d!3297 (= (forall!146 (toList!275 lm!221) p!191) e!10273)))

(declare-fun b!16601 () Bool)

(declare-fun e!10274 () Bool)

(assert (=> b!16601 (= e!10273 e!10274)))

(declare-fun res!12327 () Bool)

(assert (=> b!16601 (=> (not res!12327) (not e!10274))))

(declare-fun dynLambda!129 (Int tuple2!688) Bool)

(assert (=> b!16601 (= res!12327 (dynLambda!129 p!191 (h!1091 (toList!275 lm!221))))))

(declare-fun b!16602 () Bool)

(assert (=> b!16602 (= e!10274 (forall!146 (t!3142 (toList!275 lm!221)) p!191))))

(assert (= (and d!3297 (not res!12326)) b!16601))

(assert (= (and b!16601 res!12327) b!16602))

(declare-fun b_lambda!1387 () Bool)

(assert (=> (not b_lambda!1387) (not b!16601)))

(declare-fun t!3146 () Bool)

(declare-fun tb!601 () Bool)

(assert (=> (and start!2886 (= p!191 p!191) t!3146) tb!601))

(declare-fun result!973 () Bool)

(assert (=> tb!601 (= result!973 true)))

(assert (=> b!16601 t!3146))

(declare-fun b_and!1195 () Bool)

(assert (= b_and!1189 (and (=> t!3146 result!973) b_and!1195)))

(declare-fun m!11707 () Bool)

(assert (=> b!16601 m!11707))

(declare-fun m!11709 () Bool)

(assert (=> b!16602 m!11709))

(assert (=> start!2886 d!3297))

(declare-fun d!3305 () Bool)

(declare-fun isStrictlySorted!167 (List!529) Bool)

(assert (=> d!3305 (= (inv!896 lm!221) (isStrictlySorted!167 (toList!275 lm!221)))))

(declare-fun bs!792 () Bool)

(assert (= bs!792 d!3305))

(declare-fun m!11719 () Bool)

(assert (=> bs!792 m!11719))

(assert (=> start!2886 d!3305))

(declare-fun d!3311 () Bool)

(declare-fun res!12336 () Bool)

(declare-fun e!10283 () Bool)

(assert (=> d!3311 (=> res!12336 e!10283)))

(assert (=> d!3311 (= res!12336 (is-Nil!526 (toList!275 (-!33 lm!221 a!507))))))

(assert (=> d!3311 (= (forall!146 (toList!275 (-!33 lm!221 a!507)) p!191) e!10283)))

(declare-fun b!16611 () Bool)

(declare-fun e!10284 () Bool)

(assert (=> b!16611 (= e!10283 e!10284)))

(declare-fun res!12337 () Bool)

(assert (=> b!16611 (=> (not res!12337) (not e!10284))))

(assert (=> b!16611 (= res!12337 (dynLambda!129 p!191 (h!1091 (toList!275 (-!33 lm!221 a!507)))))))

(declare-fun b!16612 () Bool)

(assert (=> b!16612 (= e!10284 (forall!146 (t!3142 (toList!275 (-!33 lm!221 a!507))) p!191))))

(assert (= (and d!3311 (not res!12336)) b!16611))

(assert (= (and b!16611 res!12337) b!16612))

(declare-fun b_lambda!1393 () Bool)

(assert (=> (not b_lambda!1393) (not b!16611)))

(declare-fun t!3152 () Bool)

(declare-fun tb!607 () Bool)

(assert (=> (and start!2886 (= p!191 p!191) t!3152) tb!607))

(declare-fun result!979 () Bool)

(assert (=> tb!607 (= result!979 true)))

(assert (=> b!16611 t!3152))

(declare-fun b_and!1201 () Bool)

(assert (= b_and!1195 (and (=> t!3152 result!979) b_and!1201)))

(declare-fun m!11723 () Bool)

(assert (=> b!16611 m!11723))

(declare-fun m!11725 () Bool)

(assert (=> b!16612 m!11725))

(assert (=> b!16573 d!3311))

(declare-fun d!3315 () Bool)

(declare-fun lt!4078 () ListLongMap!519)

(declare-fun contains!206 (ListLongMap!519 (_ BitVec 64)) Bool)

(assert (=> d!3315 (not (contains!206 lt!4078 a!507))))

(declare-fun removeStrictlySorted!18 (List!529 (_ BitVec 64)) List!529)

(assert (=> d!3315 (= lt!4078 (ListLongMap!520 (removeStrictlySorted!18 (toList!275 lm!221) a!507)))))

(assert (=> d!3315 (= (-!33 lm!221 a!507) lt!4078)))

(declare-fun bs!795 () Bool)

(assert (= bs!795 d!3315))

(declare-fun m!11737 () Bool)

(assert (=> bs!795 m!11737))

(declare-fun m!11739 () Bool)

(assert (=> bs!795 m!11739))

(assert (=> b!16573 d!3315))

(declare-fun b!16623 () Bool)

(declare-fun e!10291 () Bool)

(declare-fun tp_is_empty!835 () Bool)

(declare-fun tp!2903 () Bool)

(assert (=> b!16623 (= e!10291 (and tp_is_empty!835 tp!2903))))

(assert (=> b!16574 (= tp!2887 e!10291)))

(assert (= (and b!16574 (is-Cons!525 (toList!275 lm!221))) b!16623))

(declare-fun b_lambda!1399 () Bool)

(assert (= b_lambda!1387 (or (and start!2886 b_free!571) b_lambda!1399)))

(declare-fun b_lambda!1401 () Bool)

(assert (= b_lambda!1393 (or (and start!2886 b_free!571) b_lambda!1401)))

(push 1)

(assert (not b!16612))

(assert (not b!16602))

(assert b_and!1201)

(assert (not b_next!571))

(assert (not d!3315))

(assert (not b!16623))

(assert (not b_lambda!1399))

(assert (not d!3293))

(assert (not d!3305))

(assert (not b_lambda!1401))

(assert tp_is_empty!835)

(check-sat)

(pop 1)

(push 1)

(assert b_and!1201)

(assert (not b_next!571))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!3323 () Bool)

(declare-fun res!12342 () Bool)

(declare-fun e!10298 () Bool)

(assert (=> d!3323 (=> res!12342 e!10298)))

(assert (=> d!3323 (= res!12342 (is-Nil!526 (t!3142 (toList!275 (-!33 lm!221 a!507)))))))

(assert (=> d!3323 (= (forall!146 (t!3142 (toList!275 (-!33 lm!221 a!507))) p!191) e!10298)))

(declare-fun b!16632 () Bool)

(declare-fun e!10299 () Bool)

(assert (=> b!16632 (= e!10298 e!10299)))

(declare-fun res!12343 () Bool)

(assert (=> b!16632 (=> (not res!12343) (not e!10299))))

(assert (=> b!16632 (= res!12343 (dynLambda!129 p!191 (h!1091 (t!3142 (toList!275 (-!33 lm!221 a!507))))))))

(declare-fun b!16633 () Bool)

(assert (=> b!16633 (= e!10299 (forall!146 (t!3142 (t!3142 (toList!275 (-!33 lm!221 a!507)))) p!191))))

(assert (= (and d!3323 (not res!12342)) b!16632))

(assert (= (and b!16632 res!12343) b!16633))

(declare-fun b_lambda!1411 () Bool)

(assert (=> (not b_lambda!1411) (not b!16632)))

(declare-fun t!3158 () Bool)

(declare-fun tb!613 () Bool)

(assert (=> (and start!2886 (= p!191 p!191) t!3158) tb!613))

(declare-fun result!991 () Bool)

(assert (=> tb!613 (= result!991 true)))

(assert (=> b!16632 t!3158))

(declare-fun b_and!1207 () Bool)

(assert (= b_and!1201 (and (=> t!3158 result!991) b_and!1207)))

(declare-fun m!11749 () Bool)

(assert (=> b!16632 m!11749))

(declare-fun m!11751 () Bool)

(assert (=> b!16633 m!11751))

(assert (=> b!16612 d!3323))

(declare-fun d!3325 () Bool)

(assert (=> d!3325 (= (isEmpty!167 (toList!275 lm!221)) (is-Nil!526 (toList!275 lm!221)))))

(assert (=> d!3293 d!3325))

(declare-fun d!3327 () Bool)

(declare-fun res!12348 () Bool)

(declare-fun e!10304 () Bool)

(assert (=> d!3327 (=> res!12348 e!10304)))

(assert (=> d!3327 (= res!12348 (or (is-Nil!526 (toList!275 lm!221)) (is-Nil!526 (t!3142 (toList!275 lm!221)))))))

(assert (=> d!3327 (= (isStrictlySorted!167 (toList!275 lm!221)) e!10304)))

(declare-fun b!16638 () Bool)

(declare-fun e!10305 () Bool)

(assert (=> b!16638 (= e!10304 e!10305)))

(declare-fun res!12349 () Bool)

(assert (=> b!16638 (=> (not res!12349) (not e!10305))))

(assert (=> b!16638 (= res!12349 (bvslt (_1!344 (h!1091 (toList!275 lm!221))) (_1!344 (h!1091 (t!3142 (toList!275 lm!221))))))))

(declare-fun b!16639 () Bool)

(assert (=> b!16639 (= e!10305 (isStrictlySorted!167 (t!3142 (toList!275 lm!221))))))

(assert (= (and d!3327 (not res!12348)) b!16638))

(assert (= (and b!16638 res!12349) b!16639))

(declare-fun m!11753 () Bool)

(assert (=> b!16639 m!11753))

(assert (=> d!3305 d!3327))

(declare-fun d!3329 () Bool)

(declare-fun e!10315 () Bool)

(assert (=> d!3329 e!10315))

(declare-fun res!12356 () Bool)

(assert (=> d!3329 (=> res!12356 e!10315)))

(declare-fun lt!4096 () Bool)

(assert (=> d!3329 (= res!12356 (not lt!4096))))

(declare-fun lt!4095 () Bool)

(assert (=> d!3329 (= lt!4096 lt!4095)))

(declare-datatypes ((Unit!330 0))(
  ( (Unit!331) )
))
(declare-fun lt!4093 () Unit!330)

(declare-fun e!10314 () Unit!330)

(assert (=> d!3329 (= lt!4093 e!10314)))

(declare-fun c!1593 () Bool)

(assert (=> d!3329 (= c!1593 lt!4095)))

(declare-fun containsKey!20 (List!529 (_ BitVec 64)) Bool)

(assert (=> d!3329 (= lt!4095 (containsKey!20 (toList!275 lt!4078) a!507))))

(assert (=> d!3329 (= (contains!206 lt!4078 a!507) lt!4096)))

(declare-fun b!16650 () Bool)

(declare-fun lt!4094 () Unit!330)

(assert (=> b!16650 (= e!10314 lt!4094)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!17 (List!529 (_ BitVec 64)) Unit!330)

(assert (=> b!16650 (= lt!4094 (lemmaContainsKeyImpliesGetValueByKeyDefined!17 (toList!275 lt!4078) a!507))))

(declare-datatypes ((Option!62 0))(
  ( (Some!61 (v!1391 B!692)) (None!60) )
))
(declare-fun isDefined!18 (Option!62) Bool)

(declare-fun getValueByKey!56 (List!529 (_ BitVec 64)) Option!62)

(assert (=> b!16650 (isDefined!18 (getValueByKey!56 (toList!275 lt!4078) a!507))))

(declare-fun b!16651 () Bool)

(declare-fun Unit!332 () Unit!330)

(assert (=> b!16651 (= e!10314 Unit!332)))

(declare-fun b!16652 () Bool)

(assert (=> b!16652 (= e!10315 (isDefined!18 (getValueByKey!56 (toList!275 lt!4078) a!507)))))

(assert (= (and d!3329 c!1593) b!16650))

(assert (= (and d!3329 (not c!1593)) b!16651))

(assert (= (and d!3329 (not res!12356)) b!16652))

(declare-fun m!11755 () Bool)

(assert (=> d!3329 m!11755))

(declare-fun m!11757 () Bool)

(assert (=> b!16650 m!11757))

(declare-fun m!11759 () Bool)

(assert (=> b!16650 m!11759))

(assert (=> b!16650 m!11759))

(declare-fun m!11761 () Bool)

(assert (=> b!16650 m!11761))

(assert (=> b!16652 m!11759))

(assert (=> b!16652 m!11759))

(assert (=> b!16652 m!11761))

(assert (=> d!3315 d!3329))

(declare-fun d!3333 () Bool)

(declare-fun e!10332 () Bool)

(assert (=> d!3333 e!10332))

(declare-fun res!12365 () Bool)

(assert (=> d!3333 (=> (not res!12365) (not e!10332))))

(declare-fun lt!4107 () List!529)

(assert (=> d!3333 (= res!12365 (isStrictlySorted!167 lt!4107))))

(declare-fun e!10331 () List!529)

(assert (=> d!3333 (= lt!4107 e!10331)))

(declare-fun c!1600 () Bool)

(assert (=> d!3333 (= c!1600 (and (is-Cons!525 (toList!275 lm!221)) (= (_1!344 (h!1091 (toList!275 lm!221))) a!507)))))

(assert (=> d!3333 (isStrictlySorted!167 (toList!275 lm!221))))

(assert (=> d!3333 (= (removeStrictlySorted!18 (toList!275 lm!221) a!507) lt!4107)))

(declare-fun b!16673 () Bool)

(declare-fun e!10330 () List!529)

(declare-fun $colon$colon!27 (List!529 tuple2!688) List!529)

(assert (=> b!16673 (= e!10330 ($colon$colon!27 (removeStrictlySorted!18 (t!3142 (toList!275 lm!221)) a!507) (h!1091 (toList!275 lm!221))))))

(declare-fun b!16674 () Bool)

(assert (=> b!16674 (= e!10331 e!10330)))

(declare-fun c!1601 () Bool)

(assert (=> b!16674 (= c!1601 (and (is-Cons!525 (toList!275 lm!221)) (not (= (_1!344 (h!1091 (toList!275 lm!221))) a!507))))))

(declare-fun b!16675 () Bool)

(assert (=> b!16675 (= e!10330 Nil!526)))

(declare-fun b!16676 () Bool)

(assert (=> b!16676 (= e!10332 (not (containsKey!20 lt!4107 a!507)))))

(declare-fun b!16677 () Bool)

(assert (=> b!16677 (= e!10331 (t!3142 (toList!275 lm!221)))))

(assert (= (and d!3333 c!1600) b!16677))

(assert (= (and d!3333 (not c!1600)) b!16674))

(assert (= (and b!16674 c!1601) b!16673))

(assert (= (and b!16674 (not c!1601)) b!16675))

(assert (= (and d!3333 res!12365) b!16676))

(declare-fun m!11769 () Bool)

(assert (=> d!3333 m!11769))

(assert (=> d!3333 m!11719))

(declare-fun m!11771 () Bool)

(assert (=> b!16673 m!11771))

(assert (=> b!16673 m!11771))

(declare-fun m!11773 () Bool)

(assert (=> b!16673 m!11773))

(declare-fun m!11775 () Bool)

(assert (=> b!16676 m!11775))

(assert (=> d!3315 d!3333))

(declare-fun d!3341 () Bool)

(declare-fun res!12366 () Bool)

(declare-fun e!10333 () Bool)

(assert (=> d!3341 (=> res!12366 e!10333)))

(assert (=> d!3341 (= res!12366 (is-Nil!526 (t!3142 (toList!275 lm!221))))))

(assert (=> d!3341 (= (forall!146 (t!3142 (toList!275 lm!221)) p!191) e!10333)))

(declare-fun b!16678 () Bool)

(declare-fun e!10334 () Bool)

(assert (=> b!16678 (= e!10333 e!10334)))

(declare-fun res!12367 () Bool)

(assert (=> b!16678 (=> (not res!12367) (not e!10334))))

(assert (=> b!16678 (= res!12367 (dynLambda!129 p!191 (h!1091 (t!3142 (toList!275 lm!221)))))))

(declare-fun b!16679 () Bool)

(assert (=> b!16679 (= e!10334 (forall!146 (t!3142 (t!3142 (toList!275 lm!221))) p!191))))

(assert (= (and d!3341 (not res!12366)) b!16678))

(assert (= (and b!16678 res!12367) b!16679))

(declare-fun b_lambda!1415 () Bool)

(assert (=> (not b_lambda!1415) (not b!16678)))

(declare-fun t!3162 () Bool)

(declare-fun tb!617 () Bool)

(assert (=> (and start!2886 (= p!191 p!191) t!3162) tb!617))

(declare-fun result!995 () Bool)

(assert (=> tb!617 (= result!995 true)))

(assert (=> b!16678 t!3162))

(declare-fun b_and!1211 () Bool)

(assert (= b_and!1207 (and (=> t!3162 result!995) b_and!1211)))

(declare-fun m!11779 () Bool)

(assert (=> b!16678 m!11779))

(declare-fun m!11783 () Bool)

(assert (=> b!16679 m!11783))

(assert (=> b!16602 d!3341))

(declare-fun b!16687 () Bool)

(declare-fun e!10339 () Bool)

(declare-fun tp!2910 () Bool)

(assert (=> b!16687 (= e!10339 (and tp_is_empty!835 tp!2910))))

(assert (=> b!16623 (= tp!2903 e!10339)))

(assert (= (and b!16623 (is-Cons!525 (t!3142 (toList!275 lm!221)))) b!16687))

(declare-fun b_lambda!1417 () Bool)

(assert (= b_lambda!1415 (or (and start!2886 b_free!571) b_lambda!1417)))

(declare-fun b_lambda!1419 () Bool)

(assert (= b_lambda!1411 (or (and start!2886 b_free!571) b_lambda!1419)))

(push 1)

(assert (not b!16652))

(assert (not b_lambda!1399))

(assert (not d!3333))

(assert (not b_next!571))

(assert (not b!16679))

(assert (not b_lambda!1417))

(assert (not b!16650))

(assert (not b!16673))

(assert (not d!3329))

(assert (not b_lambda!1419))

(assert b_and!1211)

(assert (not b!16676))

(assert (not b!16687))

(assert (not b_lambda!1401))

(assert tp_is_empty!835)

(assert (not b!16639))

(assert (not b!16633))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1211)

(assert (not b_next!571))

(check-sat)

(pop 1)

