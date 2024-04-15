; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2880 () Bool)

(assert start!2880)

(declare-fun b_free!575 () Bool)

(declare-fun b_next!575 () Bool)

(assert (=> start!2880 (= b_free!575 (not b_next!575))))

(declare-fun tp!2899 () Bool)

(declare-fun b_and!1187 () Bool)

(assert (=> start!2880 (= tp!2899 b_and!1187)))

(declare-fun res!12285 () Bool)

(declare-fun e!10222 () Bool)

(assert (=> start!2880 (=> (not res!12285) (not e!10222))))

(declare-datatypes ((B!696 0))(
  ( (B!697 (val!446 Int)) )
))
(declare-datatypes ((tuple2!688 0))(
  ( (tuple2!689 (_1!344 (_ BitVec 64)) (_2!344 B!696)) )
))
(declare-datatypes ((List!527 0))(
  ( (Nil!524) (Cons!523 (h!1089 tuple2!688) (t!3133 List!527)) )
))
(declare-datatypes ((ListLongMap!519 0))(
  ( (ListLongMap!520 (toList!275 List!527)) )
))
(declare-fun lm!221 () ListLongMap!519)

(declare-fun p!191 () Int)

(declare-fun forall!148 (List!527 Int) Bool)

(assert (=> start!2880 (= res!12285 (forall!148 (toList!275 lm!221) p!191))))

(assert (=> start!2880 e!10222))

(declare-fun e!10221 () Bool)

(declare-fun inv!898 (ListLongMap!519) Bool)

(assert (=> start!2880 (and (inv!898 lm!221) e!10221)))

(assert (=> start!2880 tp!2899))

(assert (=> start!2880 true))

(declare-fun b!16538 () Bool)

(declare-fun res!12284 () Bool)

(assert (=> b!16538 (=> (not res!12284) (not e!10222))))

(declare-fun isEmpty!166 (ListLongMap!519) Bool)

(assert (=> b!16538 (= res!12284 (isEmpty!166 lm!221))))

(declare-fun a!507 () (_ BitVec 64))

(declare-fun b!16539 () Bool)

(declare-fun -!35 (ListLongMap!519 (_ BitVec 64)) ListLongMap!519)

(assert (=> b!16539 (= e!10222 (not (forall!148 (toList!275 (-!35 lm!221 a!507)) p!191)))))

(declare-fun b!16540 () Bool)

(declare-fun tp!2900 () Bool)

(assert (=> b!16540 (= e!10221 tp!2900)))

(assert (= (and start!2880 res!12285) b!16538))

(assert (= (and b!16538 res!12284) b!16539))

(assert (= start!2880 b!16540))

(declare-fun m!11629 () Bool)

(assert (=> start!2880 m!11629))

(declare-fun m!11631 () Bool)

(assert (=> start!2880 m!11631))

(declare-fun m!11633 () Bool)

(assert (=> b!16538 m!11633))

(declare-fun m!11635 () Bool)

(assert (=> b!16539 m!11635))

(declare-fun m!11637 () Bool)

(assert (=> b!16539 m!11637))

(push 1)

(assert b_and!1187)

(assert (not start!2880))

(assert (not b!16540))

(assert (not b!16539))

(assert (not b!16538))

(assert (not b_next!575))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1187)

(assert (not b_next!575))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!3255 () Bool)

(declare-fun res!12294 () Bool)

(declare-fun e!10231 () Bool)

(assert (=> d!3255 (=> res!12294 e!10231)))

(assert (=> d!3255 (= res!12294 (is-Nil!524 (toList!275 (-!35 lm!221 a!507))))))

(assert (=> d!3255 (= (forall!148 (toList!275 (-!35 lm!221 a!507)) p!191) e!10231)))

(declare-fun b!16549 () Bool)

(declare-fun e!10232 () Bool)

(assert (=> b!16549 (= e!10231 e!10232)))

(declare-fun res!12295 () Bool)

(assert (=> b!16549 (=> (not res!12295) (not e!10232))))

(declare-fun dynLambda!128 (Int tuple2!688) Bool)

(assert (=> b!16549 (= res!12295 (dynLambda!128 p!191 (h!1089 (toList!275 (-!35 lm!221 a!507)))))))

(declare-fun b!16550 () Bool)

(assert (=> b!16550 (= e!10232 (forall!148 (t!3133 (toList!275 (-!35 lm!221 a!507))) p!191))))

(assert (= (and d!3255 (not res!12294)) b!16549))

(assert (= (and b!16549 res!12295) b!16550))

(declare-fun b_lambda!1375 () Bool)

(assert (=> (not b_lambda!1375) (not b!16549)))

(declare-fun t!3135 () Bool)

(declare-fun tb!595 () Bool)

(assert (=> (and start!2880 (= p!191 p!191) t!3135) tb!595))

(declare-fun result!967 () Bool)

(assert (=> tb!595 (= result!967 true)))

(assert (=> b!16549 t!3135))

(declare-fun b_and!1189 () Bool)

(assert (= b_and!1187 (and (=> t!3135 result!967) b_and!1189)))

(declare-fun m!11639 () Bool)

(assert (=> b!16549 m!11639))

(declare-fun m!11641 () Bool)

(assert (=> b!16550 m!11641))

(assert (=> b!16539 d!3255))

(declare-fun d!3261 () Bool)

(declare-fun lt!4074 () ListLongMap!519)

(declare-fun contains!204 (ListLongMap!519 (_ BitVec 64)) Bool)

(assert (=> d!3261 (not (contains!204 lt!4074 a!507))))

(declare-fun removeStrictlySorted!18 (List!527 (_ BitVec 64)) List!527)

(assert (=> d!3261 (= lt!4074 (ListLongMap!520 (removeStrictlySorted!18 (toList!275 lm!221) a!507)))))

(assert (=> d!3261 (= (-!35 lm!221 a!507) lt!4074)))

(declare-fun bs!787 () Bool)

(assert (= bs!787 d!3261))

(declare-fun m!11651 () Bool)

(assert (=> bs!787 m!11651))

(declare-fun m!11653 () Bool)

(assert (=> bs!787 m!11653))

(assert (=> b!16539 d!3261))

(declare-fun d!3267 () Bool)

(declare-fun res!12304 () Bool)

(declare-fun e!10241 () Bool)

(assert (=> d!3267 (=> res!12304 e!10241)))

(assert (=> d!3267 (= res!12304 (is-Nil!524 (toList!275 lm!221)))))

(assert (=> d!3267 (= (forall!148 (toList!275 lm!221) p!191) e!10241)))

(declare-fun b!16559 () Bool)

(declare-fun e!10242 () Bool)

(assert (=> b!16559 (= e!10241 e!10242)))

(declare-fun res!12305 () Bool)

(assert (=> b!16559 (=> (not res!12305) (not e!10242))))

(assert (=> b!16559 (= res!12305 (dynLambda!128 p!191 (h!1089 (toList!275 lm!221))))))

(declare-fun b!16560 () Bool)

(assert (=> b!16560 (= e!10242 (forall!148 (t!3133 (toList!275 lm!221)) p!191))))

(assert (= (and d!3267 (not res!12304)) b!16559))

(assert (= (and b!16559 res!12305) b!16560))

(declare-fun b_lambda!1381 () Bool)

(assert (=> (not b_lambda!1381) (not b!16559)))

(declare-fun t!3141 () Bool)

(declare-fun tb!601 () Bool)

(assert (=> (and start!2880 (= p!191 p!191) t!3141) tb!601))

(declare-fun result!973 () Bool)

(assert (=> tb!601 (= result!973 true)))

(assert (=> b!16559 t!3141))

(declare-fun b_and!1195 () Bool)

(assert (= b_and!1189 (and (=> t!3141 result!973) b_and!1195)))

(declare-fun m!11655 () Bool)

(assert (=> b!16559 m!11655))

(declare-fun m!11657 () Bool)

(assert (=> b!16560 m!11657))

(assert (=> start!2880 d!3267))

(declare-fun d!3269 () Bool)

(declare-fun isStrictlySorted!161 (List!527) Bool)

(assert (=> d!3269 (= (inv!898 lm!221) (isStrictlySorted!161 (toList!275 lm!221)))))

(declare-fun bs!788 () Bool)

(assert (= bs!788 d!3269))

(declare-fun m!11659 () Bool)

(assert (=> bs!788 m!11659))

(assert (=> start!2880 d!3269))

(declare-fun d!3271 () Bool)

(declare-fun isEmpty!167 (List!527) Bool)

(assert (=> d!3271 (= (isEmpty!166 lm!221) (isEmpty!167 (toList!275 lm!221)))))

(declare-fun bs!789 () Bool)

(assert (= bs!789 d!3271))

(declare-fun m!11661 () Bool)

(assert (=> bs!789 m!11661))

(assert (=> b!16538 d!3271))

(declare-fun b!16567 () Bool)

(declare-fun e!10247 () Bool)

(declare-fun tp_is_empty!835 () Bool)

(declare-fun tp!2903 () Bool)

(assert (=> b!16567 (= e!10247 (and tp_is_empty!835 tp!2903))))

(assert (=> b!16540 (= tp!2900 e!10247)))

(assert (= (and b!16540 (is-Cons!523 (toList!275 lm!221))) b!16567))

(declare-fun b_lambda!1383 () Bool)

(assert (= b_lambda!1381 (or (and start!2880 b_free!575) b_lambda!1383)))

(declare-fun b_lambda!1385 () Bool)

(assert (= b_lambda!1375 (or (and start!2880 b_free!575) b_lambda!1385)))

(push 1)

(assert b_and!1195)

(assert (not d!3261))

(assert (not b!16550))

(assert tp_is_empty!835)

(assert (not b_lambda!1383))

(assert (not b!16567))

(assert (not b_next!575))

(assert (not b_lambda!1385))

(assert (not d!3269))

(assert (not b!16560))

(assert (not d!3271))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1195)

(assert (not b_next!575))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!3285 () Bool)

(declare-fun res!12314 () Bool)

(declare-fun e!10260 () Bool)

(assert (=> d!3285 (=> res!12314 e!10260)))

(assert (=> d!3285 (= res!12314 (or (is-Nil!524 (toList!275 lm!221)) (is-Nil!524 (t!3133 (toList!275 lm!221)))))))

(assert (=> d!3285 (= (isStrictlySorted!161 (toList!275 lm!221)) e!10260)))

(declare-fun b!16584 () Bool)

(declare-fun e!10261 () Bool)

(assert (=> b!16584 (= e!10260 e!10261)))

(declare-fun res!12315 () Bool)

(assert (=> b!16584 (=> (not res!12315) (not e!10261))))

(assert (=> b!16584 (= res!12315 (bvslt (_1!344 (h!1089 (toList!275 lm!221))) (_1!344 (h!1089 (t!3133 (toList!275 lm!221))))))))

(declare-fun b!16585 () Bool)

(assert (=> b!16585 (= e!10261 (isStrictlySorted!161 (t!3133 (toList!275 lm!221))))))

(assert (= (and d!3285 (not res!12314)) b!16584))

(assert (= (and b!16584 res!12315) b!16585))

(declare-fun m!11687 () Bool)

(assert (=> b!16585 m!11687))

(assert (=> d!3269 d!3285))

(declare-fun d!3287 () Bool)

(declare-fun res!12316 () Bool)

(declare-fun e!10262 () Bool)

(assert (=> d!3287 (=> res!12316 e!10262)))

(assert (=> d!3287 (= res!12316 (is-Nil!524 (t!3133 (toList!275 lm!221))))))

(assert (=> d!3287 (= (forall!148 (t!3133 (toList!275 lm!221)) p!191) e!10262)))

(declare-fun b!16586 () Bool)

(declare-fun e!10263 () Bool)

(assert (=> b!16586 (= e!10262 e!10263)))

(declare-fun res!12317 () Bool)

(assert (=> b!16586 (=> (not res!12317) (not e!10263))))

(assert (=> b!16586 (= res!12317 (dynLambda!128 p!191 (h!1089 (t!3133 (toList!275 lm!221)))))))

(declare-fun b!16587 () Bool)

(assert (=> b!16587 (= e!10263 (forall!148 (t!3133 (t!3133 (toList!275 lm!221))) p!191))))

(assert (= (and d!3287 (not res!12316)) b!16586))

(assert (= (and b!16586 res!12317) b!16587))

(declare-fun b_lambda!1399 () Bool)

(assert (=> (not b_lambda!1399) (not b!16586)))

(declare-fun t!3147 () Bool)

(declare-fun tb!607 () Bool)

(assert (=> (and start!2880 (= p!191 p!191) t!3147) tb!607))

(declare-fun result!985 () Bool)

(assert (=> tb!607 (= result!985 true)))

(assert (=> b!16586 t!3147))

(declare-fun b_and!1201 () Bool)

(assert (= b_and!1195 (and (=> t!3147 result!985) b_and!1201)))

(declare-fun m!11689 () Bool)

(assert (=> b!16586 m!11689))

(declare-fun m!11691 () Bool)

(assert (=> b!16587 m!11691))

(assert (=> b!16560 d!3287))

(declare-fun d!3289 () Bool)

(declare-fun e!10277 () Bool)

(assert (=> d!3289 e!10277))

(declare-fun res!12328 () Bool)

(assert (=> d!3289 (=> res!12328 e!10277)))

(declare-fun lt!4091 () Bool)

(assert (=> d!3289 (= res!12328 (not lt!4091))))

(declare-fun lt!4089 () Bool)

(assert (=> d!3289 (= lt!4091 lt!4089)))

(declare-datatypes ((Unit!340 0))(
  ( (Unit!341) )
))
(declare-fun lt!4092 () Unit!340)

(declare-fun e!10276 () Unit!340)

(assert (=> d!3289 (= lt!4092 e!10276)))

(declare-fun c!1583 () Bool)

(assert (=> d!3289 (= c!1583 lt!4089)))

(declare-fun containsKey!20 (List!527 (_ BitVec 64)) Bool)

(assert (=> d!3289 (= lt!4089 (containsKey!20 (toList!275 lt!4074) a!507))))

(assert (=> d!3289 (= (contains!204 lt!4074 a!507) lt!4091)))

(declare-fun b!16602 () Bool)

(declare-fun lt!4090 () Unit!340)

(assert (=> b!16602 (= e!10276 lt!4090)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!17 (List!527 (_ BitVec 64)) Unit!340)

(assert (=> b!16602 (= lt!4090 (lemmaContainsKeyImpliesGetValueByKeyDefined!17 (toList!275 lt!4074) a!507))))

(declare-datatypes ((Option!62 0))(
  ( (Some!61 (v!1391 B!696)) (None!60) )
))
(declare-fun isDefined!18 (Option!62) Bool)

(declare-fun getValueByKey!56 (List!527 (_ BitVec 64)) Option!62)

(assert (=> b!16602 (isDefined!18 (getValueByKey!56 (toList!275 lt!4074) a!507))))

(declare-fun b!16603 () Bool)

(declare-fun Unit!342 () Unit!340)

(assert (=> b!16603 (= e!10276 Unit!342)))

(declare-fun b!16604 () Bool)

(assert (=> b!16604 (= e!10277 (isDefined!18 (getValueByKey!56 (toList!275 lt!4074) a!507)))))

(assert (= (and d!3289 c!1583) b!16602))

(assert (= (and d!3289 (not c!1583)) b!16603))

(assert (= (and d!3289 (not res!12328)) b!16604))

(declare-fun m!11699 () Bool)

(assert (=> d!3289 m!11699))

(declare-fun m!11701 () Bool)

(assert (=> b!16602 m!11701))

(declare-fun m!11703 () Bool)

(assert (=> b!16602 m!11703))

(assert (=> b!16602 m!11703))

(declare-fun m!11705 () Bool)

(assert (=> b!16602 m!11705))

(assert (=> b!16604 m!11703))

(assert (=> b!16604 m!11703))

(assert (=> b!16604 m!11705))

(assert (=> d!3261 d!3289))

(declare-fun b!16619 () Bool)

(declare-fun e!10289 () List!527)

(declare-fun e!10290 () List!527)

(assert (=> b!16619 (= e!10289 e!10290)))

(declare-fun c!1589 () Bool)

(assert (=> b!16619 (= c!1589 (and (is-Cons!523 (toList!275 lm!221)) (not (= (_1!344 (h!1089 (toList!275 lm!221))) a!507))))))

(declare-fun b!16620 () Bool)

(declare-fun e!10288 () Bool)

(declare-fun lt!4095 () List!527)

(assert (=> b!16620 (= e!10288 (not (containsKey!20 lt!4095 a!507)))))

(declare-fun b!16621 () Bool)

(assert (=> b!16621 (= e!10289 (t!3133 (toList!275 lm!221)))))

(declare-fun d!3297 () Bool)

(assert (=> d!3297 e!10288))

(declare-fun res!12335 () Bool)

(assert (=> d!3297 (=> (not res!12335) (not e!10288))))

(assert (=> d!3297 (= res!12335 (isStrictlySorted!161 lt!4095))))

(assert (=> d!3297 (= lt!4095 e!10289)))

(declare-fun c!1588 () Bool)

(assert (=> d!3297 (= c!1588 (and (is-Cons!523 (toList!275 lm!221)) (= (_1!344 (h!1089 (toList!275 lm!221))) a!507)))))

(assert (=> d!3297 (isStrictlySorted!161 (toList!275 lm!221))))

(assert (=> d!3297 (= (removeStrictlySorted!18 (toList!275 lm!221) a!507) lt!4095)))

(declare-fun b!16622 () Bool)

(assert (=> b!16622 (= e!10290 Nil!524)))

(declare-fun b!16623 () Bool)

(declare-fun $colon$colon!27 (List!527 tuple2!688) List!527)

(assert (=> b!16623 (= e!10290 ($colon$colon!27 (removeStrictlySorted!18 (t!3133 (toList!275 lm!221)) a!507) (h!1089 (toList!275 lm!221))))))

(assert (= (and d!3297 c!1588) b!16621))

(assert (= (and d!3297 (not c!1588)) b!16619))

(assert (= (and b!16619 c!1589) b!16623))

(assert (= (and b!16619 (not c!1589)) b!16622))

(assert (= (and d!3297 res!12335) b!16620))

(declare-fun m!11711 () Bool)

(assert (=> b!16620 m!11711))

(declare-fun m!11713 () Bool)

(assert (=> d!3297 m!11713))

(assert (=> d!3297 m!11659))

(declare-fun m!11715 () Bool)

(assert (=> b!16623 m!11715))

(assert (=> b!16623 m!11715))

(declare-fun m!11717 () Bool)

(assert (=> b!16623 m!11717))

(assert (=> d!3261 d!3297))

(declare-fun d!3305 () Bool)

(assert (=> d!3305 (= (isEmpty!167 (toList!275 lm!221)) (is-Nil!524 (toList!275 lm!221)))))

(assert (=> d!3271 d!3305))

(declare-fun d!3307 () Bool)

(declare-fun res!12342 () Bool)

(declare-fun e!10299 () Bool)

(assert (=> d!3307 (=> res!12342 e!10299)))

(assert (=> d!3307 (= res!12342 (is-Nil!524 (t!3133 (toList!275 (-!35 lm!221 a!507)))))))

(assert (=> d!3307 (= (forall!148 (t!3133 (toList!275 (-!35 lm!221 a!507))) p!191) e!10299)))

(declare-fun b!16634 () Bool)

(declare-fun e!10300 () Bool)

(assert (=> b!16634 (= e!10299 e!10300)))

(declare-fun res!12343 () Bool)

(assert (=> b!16634 (=> (not res!12343) (not e!10300))))

(assert (=> b!16634 (= res!12343 (dynLambda!128 p!191 (h!1089 (t!3133 (toList!275 (-!35 lm!221 a!507))))))))

(declare-fun b!16635 () Bool)

(assert (=> b!16635 (= e!10300 (forall!148 (t!3133 (t!3133 (toList!275 (-!35 lm!221 a!507)))) p!191))))

(assert (= (and d!3307 (not res!12342)) b!16634))

(assert (= (and b!16634 res!12343) b!16635))

(declare-fun b_lambda!1405 () Bool)

(assert (=> (not b_lambda!1405) (not b!16634)))

(declare-fun t!3153 () Bool)

(declare-fun tb!613 () Bool)

(assert (=> (and start!2880 (= p!191 p!191) t!3153) tb!613))

(declare-fun result!991 () Bool)

(assert (=> tb!613 (= result!991 true)))

(assert (=> b!16634 t!3153))

(declare-fun b_and!1207 () Bool)

(assert (= b_and!1201 (and (=> t!3153 result!991) b_and!1207)))

(declare-fun m!11721 () Bool)

(assert (=> b!16634 m!11721))

(declare-fun m!11723 () Bool)

(assert (=> b!16635 m!11723))

(assert (=> b!16550 d!3307))

(declare-fun b!16636 () Bool)

(declare-fun e!10301 () Bool)

(declare-fun tp!2910 () Bool)

(assert (=> b!16636 (= e!10301 (and tp_is_empty!835 tp!2910))))

(assert (=> b!16567 (= tp!2903 e!10301)))

(assert (= (and b!16567 (is-Cons!523 (t!3133 (toList!275 lm!221)))) b!16636))

(declare-fun b_lambda!1407 () Bool)

(assert (= b_lambda!1405 (or (and start!2880 b_free!575) b_lambda!1407)))

(declare-fun b_lambda!1409 () Bool)

(assert (= b_lambda!1399 (or (and start!2880 b_free!575) b_lambda!1409)))

(push 1)

(assert (not b!16620))

(assert (not b!16587))

(assert (not b!16623))

(assert (not b_lambda!1409))

(assert b_and!1207)

(assert (not b!16585))

(assert (not d!3289))

(assert (not b!16636))

(assert (not b_next!575))

(assert (not d!3297))

(assert (not b_lambda!1385))

(assert (not b!16602))

(assert (not b!16635))

(assert tp_is_empty!835)

(assert (not b_lambda!1407))

(assert (not b!16604))

(assert (not b_lambda!1383))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1207)

(assert (not b_next!575))

(check-sat)

(pop 1)

