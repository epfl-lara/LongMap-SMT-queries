; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2882 () Bool)

(assert start!2882)

(declare-fun b_free!571 () Bool)

(declare-fun b_next!571 () Bool)

(assert (=> start!2882 (= b_free!571 (not b_next!571))))

(declare-fun tp!2887 () Bool)

(declare-fun b_and!1183 () Bool)

(assert (=> start!2882 (= tp!2887 b_and!1183)))

(declare-fun res!12282 () Bool)

(declare-fun e!10220 () Bool)

(assert (=> start!2882 (=> (not res!12282) (not e!10220))))

(declare-datatypes ((B!692 0))(
  ( (B!693 (val!444 Int)) )
))
(declare-datatypes ((tuple2!684 0))(
  ( (tuple2!685 (_1!342 (_ BitVec 64)) (_2!342 B!692)) )
))
(declare-datatypes ((List!525 0))(
  ( (Nil!522) (Cons!521 (h!1087 tuple2!684) (t!3132 List!525)) )
))
(declare-datatypes ((ListLongMap!515 0))(
  ( (ListLongMap!516 (toList!273 List!525)) )
))
(declare-fun lm!221 () ListLongMap!515)

(declare-fun p!191 () Int)

(declare-fun forall!146 (List!525 Int) Bool)

(assert (=> start!2882 (= res!12282 (forall!146 (toList!273 lm!221) p!191))))

(assert (=> start!2882 e!10220))

(declare-fun e!10219 () Bool)

(declare-fun inv!896 (ListLongMap!515) Bool)

(assert (=> start!2882 (and (inv!896 lm!221) e!10219)))

(assert (=> start!2882 tp!2887))

(assert (=> start!2882 true))

(declare-fun b!16530 () Bool)

(declare-fun res!12283 () Bool)

(assert (=> b!16530 (=> (not res!12283) (not e!10220))))

(declare-fun isEmpty!164 (ListLongMap!515) Bool)

(assert (=> b!16530 (= res!12283 (isEmpty!164 lm!221))))

(declare-fun a!507 () (_ BitVec 64))

(declare-fun b!16531 () Bool)

(declare-fun -!32 (ListLongMap!515 (_ BitVec 64)) ListLongMap!515)

(assert (=> b!16531 (= e!10220 (not (forall!146 (toList!273 (-!32 lm!221 a!507)) p!191)))))

(declare-fun b!16532 () Bool)

(declare-fun tp!2888 () Bool)

(assert (=> b!16532 (= e!10219 tp!2888)))

(assert (= (and start!2882 res!12282) b!16530))

(assert (= (and b!16530 res!12283) b!16531))

(assert (= start!2882 b!16532))

(declare-fun m!11623 () Bool)

(assert (=> start!2882 m!11623))

(declare-fun m!11625 () Bool)

(assert (=> start!2882 m!11625))

(declare-fun m!11627 () Bool)

(assert (=> b!16530 m!11627))

(declare-fun m!11629 () Bool)

(assert (=> b!16531 m!11629))

(declare-fun m!11631 () Bool)

(assert (=> b!16531 m!11631))

(check-sat (not b!16530) (not start!2882) (not b_next!571) b_and!1183 (not b!16532) (not b!16531))
(check-sat b_and!1183 (not b_next!571))
(get-model)

(declare-fun d!3263 () Bool)

(declare-fun res!12306 () Bool)

(declare-fun e!10243 () Bool)

(assert (=> d!3263 (=> res!12306 e!10243)))

(get-info :version)

(assert (=> d!3263 (= res!12306 ((_ is Nil!522) (toList!273 (-!32 lm!221 a!507))))))

(assert (=> d!3263 (= (forall!146 (toList!273 (-!32 lm!221 a!507)) p!191) e!10243)))

(declare-fun b!16561 () Bool)

(declare-fun e!10244 () Bool)

(assert (=> b!16561 (= e!10243 e!10244)))

(declare-fun res!12307 () Bool)

(assert (=> b!16561 (=> (not res!12307) (not e!10244))))

(declare-fun dynLambda!125 (Int tuple2!684) Bool)

(assert (=> b!16561 (= res!12307 (dynLambda!125 p!191 (h!1087 (toList!273 (-!32 lm!221 a!507)))))))

(declare-fun b!16562 () Bool)

(assert (=> b!16562 (= e!10244 (forall!146 (t!3132 (toList!273 (-!32 lm!221 a!507))) p!191))))

(assert (= (and d!3263 (not res!12306)) b!16561))

(assert (= (and b!16561 res!12307) b!16562))

(declare-fun b_lambda!1377 () Bool)

(assert (=> (not b_lambda!1377) (not b!16561)))

(declare-fun t!3138 () Bool)

(declare-fun tb!597 () Bool)

(assert (=> (and start!2882 (= p!191 p!191) t!3138) tb!597))

(declare-fun result!969 () Bool)

(assert (=> tb!597 (= result!969 true)))

(assert (=> b!16561 t!3138))

(declare-fun b_and!1191 () Bool)

(assert (= b_and!1183 (and (=> t!3138 result!969) b_and!1191)))

(declare-fun m!11657 () Bool)

(assert (=> b!16561 m!11657))

(declare-fun m!11659 () Bool)

(assert (=> b!16562 m!11659))

(assert (=> b!16531 d!3263))

(declare-fun d!3269 () Bool)

(declare-fun lt!4080 () ListLongMap!515)

(declare-fun contains!203 (ListLongMap!515 (_ BitVec 64)) Bool)

(assert (=> d!3269 (not (contains!203 lt!4080 a!507))))

(declare-fun removeStrictlySorted!17 (List!525 (_ BitVec 64)) List!525)

(assert (=> d!3269 (= lt!4080 (ListLongMap!516 (removeStrictlySorted!17 (toList!273 lm!221) a!507)))))

(assert (=> d!3269 (= (-!32 lm!221 a!507) lt!4080)))

(declare-fun bs!787 () Bool)

(assert (= bs!787 d!3269))

(declare-fun m!11661 () Bool)

(assert (=> bs!787 m!11661))

(declare-fun m!11667 () Bool)

(assert (=> bs!787 m!11667))

(assert (=> b!16531 d!3269))

(declare-fun d!3272 () Bool)

(declare-fun isEmpty!167 (List!525) Bool)

(assert (=> d!3272 (= (isEmpty!164 lm!221) (isEmpty!167 (toList!273 lm!221)))))

(declare-fun bs!790 () Bool)

(assert (= bs!790 d!3272))

(declare-fun m!11671 () Bool)

(assert (=> bs!790 m!11671))

(assert (=> b!16530 d!3272))

(declare-fun d!3276 () Bool)

(declare-fun res!12315 () Bool)

(declare-fun e!10252 () Bool)

(assert (=> d!3276 (=> res!12315 e!10252)))

(assert (=> d!3276 (= res!12315 ((_ is Nil!522) (toList!273 lm!221)))))

(assert (=> d!3276 (= (forall!146 (toList!273 lm!221) p!191) e!10252)))

(declare-fun b!16570 () Bool)

(declare-fun e!10254 () Bool)

(assert (=> b!16570 (= e!10252 e!10254)))

(declare-fun res!12317 () Bool)

(assert (=> b!16570 (=> (not res!12317) (not e!10254))))

(assert (=> b!16570 (= res!12317 (dynLambda!125 p!191 (h!1087 (toList!273 lm!221))))))

(declare-fun b!16572 () Bool)

(assert (=> b!16572 (= e!10254 (forall!146 (t!3132 (toList!273 lm!221)) p!191))))

(assert (= (and d!3276 (not res!12315)) b!16570))

(assert (= (and b!16570 res!12317) b!16572))

(declare-fun b_lambda!1383 () Bool)

(assert (=> (not b_lambda!1383) (not b!16570)))

(declare-fun t!3144 () Bool)

(declare-fun tb!603 () Bool)

(assert (=> (and start!2882 (= p!191 p!191) t!3144) tb!603))

(declare-fun result!975 () Bool)

(assert (=> tb!603 (= result!975 true)))

(assert (=> b!16570 t!3144))

(declare-fun b_and!1196 () Bool)

(assert (= b_and!1191 (and (=> t!3144 result!975) b_and!1196)))

(declare-fun m!11678 () Bool)

(assert (=> b!16570 m!11678))

(declare-fun m!11681 () Bool)

(assert (=> b!16572 m!11681))

(assert (=> start!2882 d!3276))

(declare-fun d!3282 () Bool)

(declare-fun isStrictlySorted!154 (List!525) Bool)

(assert (=> d!3282 (= (inv!896 lm!221) (isStrictlySorted!154 (toList!273 lm!221)))))

(declare-fun bs!791 () Bool)

(assert (= bs!791 d!3282))

(declare-fun m!11685 () Bool)

(assert (=> bs!791 m!11685))

(assert (=> start!2882 d!3282))

(declare-fun b!16582 () Bool)

(declare-fun e!10260 () Bool)

(declare-fun tp_is_empty!837 () Bool)

(declare-fun tp!2906 () Bool)

(assert (=> b!16582 (= e!10260 (and tp_is_empty!837 tp!2906))))

(assert (=> b!16532 (= tp!2888 e!10260)))

(assert (= (and b!16532 ((_ is Cons!521) (toList!273 lm!221))) b!16582))

(declare-fun b_lambda!1386 () Bool)

(assert (= b_lambda!1383 (or (and start!2882 b_free!571) b_lambda!1386)))

(declare-fun b_lambda!1390 () Bool)

(assert (= b_lambda!1377 (or (and start!2882 b_free!571) b_lambda!1390)))

(check-sat tp_is_empty!837 (not d!3272) (not d!3282) (not b_next!571) b_and!1196 (not b_lambda!1386) (not d!3269) (not b!16582) (not b_lambda!1390) (not b!16562) (not b!16572))
(check-sat b_and!1196 (not b_next!571))
(get-model)

(declare-fun d!3291 () Bool)

(declare-fun res!12320 () Bool)

(declare-fun e!10266 () Bool)

(assert (=> d!3291 (=> res!12320 e!10266)))

(assert (=> d!3291 (= res!12320 ((_ is Nil!522) (t!3132 (toList!273 lm!221))))))

(assert (=> d!3291 (= (forall!146 (t!3132 (toList!273 lm!221)) p!191) e!10266)))

(declare-fun b!16590 () Bool)

(declare-fun e!10267 () Bool)

(assert (=> b!16590 (= e!10266 e!10267)))

(declare-fun res!12321 () Bool)

(assert (=> b!16590 (=> (not res!12321) (not e!10267))))

(assert (=> b!16590 (= res!12321 (dynLambda!125 p!191 (h!1087 (t!3132 (toList!273 lm!221)))))))

(declare-fun b!16591 () Bool)

(assert (=> b!16591 (= e!10267 (forall!146 (t!3132 (t!3132 (toList!273 lm!221))) p!191))))

(assert (= (and d!3291 (not res!12320)) b!16590))

(assert (= (and b!16590 res!12321) b!16591))

(declare-fun b_lambda!1399 () Bool)

(assert (=> (not b_lambda!1399) (not b!16590)))

(declare-fun t!3148 () Bool)

(declare-fun tb!607 () Bool)

(assert (=> (and start!2882 (= p!191 p!191) t!3148) tb!607))

(declare-fun result!985 () Bool)

(assert (=> tb!607 (= result!985 true)))

(assert (=> b!16590 t!3148))

(declare-fun b_and!1201 () Bool)

(assert (= b_and!1196 (and (=> t!3148 result!985) b_and!1201)))

(declare-fun m!11701 () Bool)

(assert (=> b!16590 m!11701))

(declare-fun m!11703 () Bool)

(assert (=> b!16591 m!11703))

(assert (=> b!16572 d!3291))

(declare-fun d!3293 () Bool)

(declare-fun res!12326 () Bool)

(declare-fun e!10272 () Bool)

(assert (=> d!3293 (=> res!12326 e!10272)))

(assert (=> d!3293 (= res!12326 (or ((_ is Nil!522) (toList!273 lm!221)) ((_ is Nil!522) (t!3132 (toList!273 lm!221)))))))

(assert (=> d!3293 (= (isStrictlySorted!154 (toList!273 lm!221)) e!10272)))

(declare-fun b!16596 () Bool)

(declare-fun e!10273 () Bool)

(assert (=> b!16596 (= e!10272 e!10273)))

(declare-fun res!12327 () Bool)

(assert (=> b!16596 (=> (not res!12327) (not e!10273))))

(assert (=> b!16596 (= res!12327 (bvslt (_1!342 (h!1087 (toList!273 lm!221))) (_1!342 (h!1087 (t!3132 (toList!273 lm!221))))))))

(declare-fun b!16597 () Bool)

(assert (=> b!16597 (= e!10273 (isStrictlySorted!154 (t!3132 (toList!273 lm!221))))))

(assert (= (and d!3293 (not res!12326)) b!16596))

(assert (= (and b!16596 res!12327) b!16597))

(declare-fun m!11705 () Bool)

(assert (=> b!16597 m!11705))

(assert (=> d!3282 d!3293))

(declare-fun d!3295 () Bool)

(declare-fun res!12328 () Bool)

(declare-fun e!10274 () Bool)

(assert (=> d!3295 (=> res!12328 e!10274)))

(assert (=> d!3295 (= res!12328 ((_ is Nil!522) (t!3132 (toList!273 (-!32 lm!221 a!507)))))))

(assert (=> d!3295 (= (forall!146 (t!3132 (toList!273 (-!32 lm!221 a!507))) p!191) e!10274)))

(declare-fun b!16598 () Bool)

(declare-fun e!10275 () Bool)

(assert (=> b!16598 (= e!10274 e!10275)))

(declare-fun res!12329 () Bool)

(assert (=> b!16598 (=> (not res!12329) (not e!10275))))

(assert (=> b!16598 (= res!12329 (dynLambda!125 p!191 (h!1087 (t!3132 (toList!273 (-!32 lm!221 a!507))))))))

(declare-fun b!16599 () Bool)

(assert (=> b!16599 (= e!10275 (forall!146 (t!3132 (t!3132 (toList!273 (-!32 lm!221 a!507)))) p!191))))

(assert (= (and d!3295 (not res!12328)) b!16598))

(assert (= (and b!16598 res!12329) b!16599))

(declare-fun b_lambda!1401 () Bool)

(assert (=> (not b_lambda!1401) (not b!16598)))

(declare-fun t!3150 () Bool)

(declare-fun tb!609 () Bool)

(assert (=> (and start!2882 (= p!191 p!191) t!3150) tb!609))

(declare-fun result!987 () Bool)

(assert (=> tb!609 (= result!987 true)))

(assert (=> b!16598 t!3150))

(declare-fun b_and!1203 () Bool)

(assert (= b_and!1201 (and (=> t!3150 result!987) b_and!1203)))

(declare-fun m!11707 () Bool)

(assert (=> b!16598 m!11707))

(declare-fun m!11709 () Bool)

(assert (=> b!16599 m!11709))

(assert (=> b!16562 d!3295))

(declare-fun d!3297 () Bool)

(declare-fun e!10288 () Bool)

(assert (=> d!3297 e!10288))

(declare-fun res!12340 () Bool)

(assert (=> d!3297 (=> res!12340 e!10288)))

(declare-fun lt!4095 () Bool)

(assert (=> d!3297 (= res!12340 (not lt!4095))))

(declare-fun lt!4096 () Bool)

(assert (=> d!3297 (= lt!4095 lt!4096)))

(declare-datatypes ((Unit!342 0))(
  ( (Unit!343) )
))
(declare-fun lt!4093 () Unit!342)

(declare-fun e!10289 () Unit!342)

(assert (=> d!3297 (= lt!4093 e!10289)))

(declare-fun c!1583 () Bool)

(assert (=> d!3297 (= c!1583 lt!4096)))

(declare-fun containsKey!21 (List!525 (_ BitVec 64)) Bool)

(assert (=> d!3297 (= lt!4096 (containsKey!21 (toList!273 lt!4080) a!507))))

(assert (=> d!3297 (= (contains!203 lt!4080 a!507) lt!4095)))

(declare-fun b!16614 () Bool)

(declare-fun lt!4094 () Unit!342)

(assert (=> b!16614 (= e!10289 lt!4094)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!18 (List!525 (_ BitVec 64)) Unit!342)

(assert (=> b!16614 (= lt!4094 (lemmaContainsKeyImpliesGetValueByKeyDefined!18 (toList!273 lt!4080) a!507))))

(declare-datatypes ((Option!63 0))(
  ( (Some!62 (v!1392 B!692)) (None!61) )
))
(declare-fun isDefined!19 (Option!63) Bool)

(declare-fun getValueByKey!57 (List!525 (_ BitVec 64)) Option!63)

(assert (=> b!16614 (isDefined!19 (getValueByKey!57 (toList!273 lt!4080) a!507))))

(declare-fun b!16615 () Bool)

(declare-fun Unit!345 () Unit!342)

(assert (=> b!16615 (= e!10289 Unit!345)))

(declare-fun b!16616 () Bool)

(assert (=> b!16616 (= e!10288 (isDefined!19 (getValueByKey!57 (toList!273 lt!4080) a!507)))))

(assert (= (and d!3297 c!1583) b!16614))

(assert (= (and d!3297 (not c!1583)) b!16615))

(assert (= (and d!3297 (not res!12340)) b!16616))

(declare-fun m!11717 () Bool)

(assert (=> d!3297 m!11717))

(declare-fun m!11719 () Bool)

(assert (=> b!16614 m!11719))

(declare-fun m!11721 () Bool)

(assert (=> b!16614 m!11721))

(assert (=> b!16614 m!11721))

(declare-fun m!11723 () Bool)

(assert (=> b!16614 m!11723))

(assert (=> b!16616 m!11721))

(assert (=> b!16616 m!11721))

(assert (=> b!16616 m!11723))

(assert (=> d!3269 d!3297))

(declare-fun b!16645 () Bool)

(declare-fun e!10310 () List!525)

(declare-fun $colon$colon!27 (List!525 tuple2!684) List!525)

(assert (=> b!16645 (= e!10310 ($colon$colon!27 (removeStrictlySorted!17 (t!3132 (toList!273 lm!221)) a!507) (h!1087 (toList!273 lm!221))))))

(declare-fun d!3307 () Bool)

(declare-fun e!10308 () Bool)

(assert (=> d!3307 e!10308))

(declare-fun res!12349 () Bool)

(assert (=> d!3307 (=> (not res!12349) (not e!10308))))

(declare-fun lt!4123 () List!525)

(assert (=> d!3307 (= res!12349 (isStrictlySorted!154 lt!4123))))

(declare-fun e!10309 () List!525)

(assert (=> d!3307 (= lt!4123 e!10309)))

(declare-fun c!1594 () Bool)

(assert (=> d!3307 (= c!1594 (and ((_ is Cons!521) (toList!273 lm!221)) (= (_1!342 (h!1087 (toList!273 lm!221))) a!507)))))

(assert (=> d!3307 (isStrictlySorted!154 (toList!273 lm!221))))

(assert (=> d!3307 (= (removeStrictlySorted!17 (toList!273 lm!221) a!507) lt!4123)))

(declare-fun b!16646 () Bool)

(assert (=> b!16646 (= e!10308 (not (containsKey!21 lt!4123 a!507)))))

(declare-fun b!16647 () Bool)

(assert (=> b!16647 (= e!10309 (t!3132 (toList!273 lm!221)))))

(declare-fun b!16648 () Bool)

(assert (=> b!16648 (= e!10309 e!10310)))

(declare-fun c!1595 () Bool)

(assert (=> b!16648 (= c!1595 (and ((_ is Cons!521) (toList!273 lm!221)) (not (= (_1!342 (h!1087 (toList!273 lm!221))) a!507))))))

(declare-fun b!16649 () Bool)

(assert (=> b!16649 (= e!10310 Nil!522)))

(assert (= (and d!3307 c!1594) b!16647))

(assert (= (and d!3307 (not c!1594)) b!16648))

(assert (= (and b!16648 c!1595) b!16645))

(assert (= (and b!16648 (not c!1595)) b!16649))

(assert (= (and d!3307 res!12349) b!16646))

(declare-fun m!11741 () Bool)

(assert (=> b!16645 m!11741))

(assert (=> b!16645 m!11741))

(declare-fun m!11743 () Bool)

(assert (=> b!16645 m!11743))

(declare-fun m!11745 () Bool)

(assert (=> d!3307 m!11745))

(assert (=> d!3307 m!11685))

(declare-fun m!11747 () Bool)

(assert (=> b!16646 m!11747))

(assert (=> d!3269 d!3307))

(declare-fun d!3313 () Bool)

(assert (=> d!3313 (= (isEmpty!167 (toList!273 lm!221)) ((_ is Nil!522) (toList!273 lm!221)))))

(assert (=> d!3272 d!3313))

(declare-fun b!16660 () Bool)

(declare-fun e!10317 () Bool)

(declare-fun tp!2910 () Bool)

(assert (=> b!16660 (= e!10317 (and tp_is_empty!837 tp!2910))))

(assert (=> b!16582 (= tp!2906 e!10317)))

(assert (= (and b!16582 ((_ is Cons!521) (t!3132 (toList!273 lm!221)))) b!16660))

(declare-fun b_lambda!1405 () Bool)

(assert (= b_lambda!1401 (or (and start!2882 b_free!571) b_lambda!1405)))

(declare-fun b_lambda!1407 () Bool)

(assert (= b_lambda!1399 (or (and start!2882 b_free!571) b_lambda!1407)))

(check-sat (not b!16591) (not b!16645) (not b!16599) (not b!16616) (not b_next!571) (not b!16614) (not b_lambda!1405) (not b_lambda!1407) (not b_lambda!1390) (not b!16646) (not b!16660) b_and!1203 (not b!16597) tp_is_empty!837 (not d!3307) (not d!3297) (not b_lambda!1386))
(check-sat b_and!1203 (not b_next!571))
