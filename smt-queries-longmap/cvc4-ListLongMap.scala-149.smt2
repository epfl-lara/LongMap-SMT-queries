; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2890 () Bool)

(assert start!2890)

(declare-fun b_free!575 () Bool)

(declare-fun b_next!575 () Bool)

(assert (=> start!2890 (= b_free!575 (not b_next!575))))

(declare-fun tp!2899 () Bool)

(declare-fun b_and!1193 () Bool)

(assert (=> start!2890 (= tp!2899 b_and!1193)))

(declare-fun res!12316 () Bool)

(declare-fun e!10264 () Bool)

(assert (=> start!2890 (=> (not res!12316) (not e!10264))))

(declare-datatypes ((B!696 0))(
  ( (B!697 (val!446 Int)) )
))
(declare-datatypes ((tuple2!692 0))(
  ( (tuple2!693 (_1!346 (_ BitVec 64)) (_2!346 B!696)) )
))
(declare-datatypes ((List!531 0))(
  ( (Nil!528) (Cons!527 (h!1093 tuple2!692) (t!3144 List!531)) )
))
(declare-datatypes ((ListLongMap!523 0))(
  ( (ListLongMap!524 (toList!277 List!531)) )
))
(declare-fun lm!221 () ListLongMap!523)

(declare-fun p!191 () Int)

(declare-fun forall!148 (List!531 Int) Bool)

(assert (=> start!2890 (= res!12316 (forall!148 (toList!277 lm!221) p!191))))

(assert (=> start!2890 e!10264))

(declare-fun e!10263 () Bool)

(declare-fun inv!898 (ListLongMap!523) Bool)

(assert (=> start!2890 (and (inv!898 lm!221) e!10263)))

(assert (=> start!2890 tp!2899))

(assert (=> start!2890 true))

(declare-fun b!16590 () Bool)

(declare-fun res!12317 () Bool)

(assert (=> b!16590 (=> (not res!12317) (not e!10264))))

(declare-fun isEmpty!166 (ListLongMap!523) Bool)

(assert (=> b!16590 (= res!12317 (isEmpty!166 lm!221))))

(declare-fun b!16591 () Bool)

(declare-fun a!507 () (_ BitVec 64))

(declare-fun -!35 (ListLongMap!523 (_ BitVec 64)) ListLongMap!523)

(assert (=> b!16591 (= e!10264 (not (forall!148 (toList!277 (-!35 lm!221 a!507)) p!191)))))

(declare-fun b!16592 () Bool)

(declare-fun tp!2900 () Bool)

(assert (=> b!16592 (= e!10263 tp!2900)))

(assert (= (and start!2890 res!12316) b!16590))

(assert (= (and b!16590 res!12317) b!16591))

(assert (= start!2890 b!16592))

(declare-fun m!11691 () Bool)

(assert (=> start!2890 m!11691))

(declare-fun m!11693 () Bool)

(assert (=> start!2890 m!11693))

(declare-fun m!11695 () Bool)

(assert (=> b!16590 m!11695))

(declare-fun m!11697 () Bool)

(assert (=> b!16591 m!11697))

(declare-fun m!11699 () Bool)

(assert (=> b!16591 m!11699))

(push 1)

(assert b_and!1193)

(assert (not b!16592))

(assert (not start!2890))

(assert (not b_next!575))

(assert (not b!16591))

(assert (not b!16590))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1193)

(assert (not b_next!575))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!3295 () Bool)

(declare-fun isEmpty!168 (List!531) Bool)

(assert (=> d!3295 (= (isEmpty!166 lm!221) (isEmpty!168 (toList!277 lm!221)))))

(declare-fun bs!790 () Bool)

(assert (= bs!790 d!3295))

(declare-fun m!11703 () Bool)

(assert (=> bs!790 m!11703))

(assert (=> b!16590 d!3295))

(declare-fun d!3301 () Bool)

(declare-fun res!12332 () Bool)

(declare-fun e!10279 () Bool)

(assert (=> d!3301 (=> res!12332 e!10279)))

(assert (=> d!3301 (= res!12332 (is-Nil!528 (toList!277 lm!221)))))

(assert (=> d!3301 (= (forall!148 (toList!277 lm!221) p!191) e!10279)))

(declare-fun b!16607 () Bool)

(declare-fun e!10280 () Bool)

(assert (=> b!16607 (= e!10279 e!10280)))

(declare-fun res!12333 () Bool)

(assert (=> b!16607 (=> (not res!12333) (not e!10280))))

(declare-fun dynLambda!130 (Int tuple2!692) Bool)

(assert (=> b!16607 (= res!12333 (dynLambda!130 p!191 (h!1093 (toList!277 lm!221))))))

(declare-fun b!16608 () Bool)

(assert (=> b!16608 (= e!10280 (forall!148 (t!3144 (toList!277 lm!221)) p!191))))

(assert (= (and d!3301 (not res!12332)) b!16607))

(assert (= (and b!16607 res!12333) b!16608))

(declare-fun b_lambda!1389 () Bool)

(assert (=> (not b_lambda!1389) (not b!16607)))

(declare-fun t!3148 () Bool)

(declare-fun tb!603 () Bool)

(assert (=> (and start!2890 (= p!191 p!191) t!3148) tb!603))

(declare-fun result!975 () Bool)

(assert (=> tb!603 (= result!975 true)))

(assert (=> b!16607 t!3148))

(declare-fun b_and!1197 () Bool)

(assert (= b_and!1193 (and (=> t!3148 result!975) b_and!1197)))

(declare-fun m!11711 () Bool)

(assert (=> b!16607 m!11711))

(declare-fun m!11713 () Bool)

(assert (=> b!16608 m!11713))

(assert (=> start!2890 d!3301))

(declare-fun d!3307 () Bool)

(declare-fun isStrictlySorted!169 (List!531) Bool)

(assert (=> d!3307 (= (inv!898 lm!221) (isStrictlySorted!169 (toList!277 lm!221)))))

(declare-fun bs!793 () Bool)

(assert (= bs!793 d!3307))

(declare-fun m!11721 () Bool)

(assert (=> bs!793 m!11721))

(assert (=> start!2890 d!3307))

(declare-fun d!3313 () Bool)

(declare-fun res!12338 () Bool)

(declare-fun e!10285 () Bool)

(assert (=> d!3313 (=> res!12338 e!10285)))

(assert (=> d!3313 (= res!12338 (is-Nil!528 (toList!277 (-!35 lm!221 a!507))))))

(assert (=> d!3313 (= (forall!148 (toList!277 (-!35 lm!221 a!507)) p!191) e!10285)))

(declare-fun b!16613 () Bool)

(declare-fun e!10286 () Bool)

(assert (=> b!16613 (= e!10285 e!10286)))

(declare-fun res!12339 () Bool)

(assert (=> b!16613 (=> (not res!12339) (not e!10286))))

(assert (=> b!16613 (= res!12339 (dynLambda!130 p!191 (h!1093 (toList!277 (-!35 lm!221 a!507)))))))

(declare-fun b!16614 () Bool)

(assert (=> b!16614 (= e!10286 (forall!148 (t!3144 (toList!277 (-!35 lm!221 a!507))) p!191))))

(assert (= (and d!3313 (not res!12338)) b!16613))

(assert (= (and b!16613 res!12339) b!16614))

(declare-fun b_lambda!1395 () Bool)

(assert (=> (not b_lambda!1395) (not b!16613)))

(declare-fun t!3154 () Bool)

(declare-fun tb!609 () Bool)

(assert (=> (and start!2890 (= p!191 p!191) t!3154) tb!609))

(declare-fun result!981 () Bool)

(assert (=> tb!609 (= result!981 true)))

(assert (=> b!16613 t!3154))

(declare-fun b_and!1203 () Bool)

(assert (= b_and!1197 (and (=> t!3154 result!981) b_and!1203)))

(declare-fun m!11729 () Bool)

(assert (=> b!16613 m!11729))

(declare-fun m!11731 () Bool)

(assert (=> b!16614 m!11731))

(assert (=> b!16591 d!3313))

(declare-fun d!3319 () Bool)

(declare-fun lt!4083 () ListLongMap!523)

(declare-fun contains!208 (ListLongMap!523 (_ BitVec 64)) Bool)

(assert (=> d!3319 (not (contains!208 lt!4083 a!507))))

(declare-fun removeStrictlySorted!20 (List!531 (_ BitVec 64)) List!531)

(assert (=> d!3319 (= lt!4083 (ListLongMap!524 (removeStrictlySorted!20 (toList!277 lm!221) a!507)))))

(assert (=> d!3319 (= (-!35 lm!221 a!507) lt!4083)))

(declare-fun bs!796 () Bool)

(assert (= bs!796 d!3319))

(declare-fun m!11741 () Bool)

(assert (=> bs!796 m!11741))

(declare-fun m!11743 () Bool)

(assert (=> bs!796 m!11743))

(assert (=> b!16591 d!3319))

(declare-fun b!16630 () Bool)

(declare-fun e!10296 () Bool)

(declare-fun tp_is_empty!837 () Bool)

(declare-fun tp!2906 () Bool)

(assert (=> b!16630 (= e!10296 (and tp_is_empty!837 tp!2906))))

(assert (=> b!16592 (= tp!2900 e!10296)))

(assert (= (and b!16592 (is-Cons!527 (toList!277 lm!221))) b!16630))

(declare-fun b_lambda!1403 () Bool)

(assert (= b_lambda!1395 (or (and start!2890 b_free!575) b_lambda!1403)))

(declare-fun b_lambda!1405 () Bool)

(assert (= b_lambda!1389 (or (and start!2890 b_free!575) b_lambda!1405)))

(push 1)

(assert (not b!16608))

(assert (not b!16630))

(assert (not b!16614))

(assert (not d!3319))

(assert b_and!1203)

(assert (not b_lambda!1405))

(assert (not b_next!575))

(assert tp_is_empty!837)

(assert (not d!3307))

(assert (not d!3295))

(assert (not b_lambda!1403))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1203)

(assert (not b_next!575))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!3337 () Bool)

(declare-fun res!12359 () Bool)

(declare-fun e!10318 () Bool)

(assert (=> d!3337 (=> res!12359 e!10318)))

(assert (=> d!3337 (= res!12359 (is-Nil!528 (t!3144 (toList!277 (-!35 lm!221 a!507)))))))

(assert (=> d!3337 (= (forall!148 (t!3144 (toList!277 (-!35 lm!221 a!507))) p!191) e!10318)))

(declare-fun b!16655 () Bool)

(declare-fun e!10319 () Bool)

(assert (=> b!16655 (= e!10318 e!10319)))

(declare-fun res!12360 () Bool)

(assert (=> b!16655 (=> (not res!12360) (not e!10319))))

(assert (=> b!16655 (= res!12360 (dynLambda!130 p!191 (h!1093 (t!3144 (toList!277 (-!35 lm!221 a!507))))))))

(declare-fun b!16656 () Bool)

(assert (=> b!16656 (= e!10319 (forall!148 (t!3144 (t!3144 (toList!277 (-!35 lm!221 a!507)))) p!191))))

(assert (= (and d!3337 (not res!12359)) b!16655))

(assert (= (and b!16655 res!12360) b!16656))

(declare-fun b_lambda!1413 () Bool)

(assert (=> (not b_lambda!1413) (not b!16655)))

(declare-fun t!3160 () Bool)

(declare-fun tb!615 () Bool)

(assert (=> (and start!2890 (= p!191 p!191) t!3160) tb!615))

(declare-fun result!993 () Bool)

(assert (=> tb!615 (= result!993 true)))

(assert (=> b!16655 t!3160))

(declare-fun b_and!1209 () Bool)

(assert (= b_and!1203 (and (=> t!3160 result!993) b_and!1209)))

(declare-fun m!11765 () Bool)

(assert (=> b!16655 m!11765))

(declare-fun m!11767 () Bool)

(assert (=> b!16656 m!11767))

(assert (=> b!16614 d!3337))

(declare-fun d!3339 () Bool)

(declare-fun e!10342 () Bool)

(assert (=> d!3339 e!10342))

(declare-fun res!12371 () Bool)

(assert (=> d!3339 (=> res!12371 e!10342)))

(declare-fun lt!4121 () Bool)

(assert (=> d!3339 (= res!12371 (not lt!4121))))

(declare-fun lt!4120 () Bool)

(assert (=> d!3339 (= lt!4121 lt!4120)))

(declare-datatypes ((Unit!336 0))(
  ( (Unit!337) )
))
(declare-fun lt!4123 () Unit!336)

(declare-fun e!10343 () Unit!336)

(assert (=> d!3339 (= lt!4123 e!10343)))

(declare-fun c!1605 () Bool)

(assert (=> d!3339 (= c!1605 lt!4120)))

(declare-fun containsKey!22 (List!531 (_ BitVec 64)) Bool)

(assert (=> d!3339 (= lt!4120 (containsKey!22 (toList!277 lt!4083) a!507))))

(assert (=> d!3339 (= (contains!208 lt!4083 a!507) lt!4121)))

(declare-fun b!16690 () Bool)

(declare-fun lt!4122 () Unit!336)

(assert (=> b!16690 (= e!10343 lt!4122)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!19 (List!531 (_ BitVec 64)) Unit!336)

(assert (=> b!16690 (= lt!4122 (lemmaContainsKeyImpliesGetValueByKeyDefined!19 (toList!277 lt!4083) a!507))))

(declare-datatypes ((Option!64 0))(
  ( (Some!63 (v!1393 B!696)) (None!62) )
))
(declare-fun isDefined!20 (Option!64) Bool)

(declare-fun getValueByKey!58 (List!531 (_ BitVec 64)) Option!64)

(assert (=> b!16690 (isDefined!20 (getValueByKey!58 (toList!277 lt!4083) a!507))))

(declare-fun b!16691 () Bool)

(declare-fun Unit!338 () Unit!336)

(assert (=> b!16691 (= e!10343 Unit!338)))

(declare-fun b!16692 () Bool)

(assert (=> b!16692 (= e!10342 (isDefined!20 (getValueByKey!58 (toList!277 lt!4083) a!507)))))

(assert (= (and d!3339 c!1605) b!16690))

(assert (= (and d!3339 (not c!1605)) b!16691))

(assert (= (and d!3339 (not res!12371)) b!16692))

(declare-fun m!11789 () Bool)

(assert (=> d!3339 m!11789))

(declare-fun m!11791 () Bool)

(assert (=> b!16690 m!11791))

(declare-fun m!11793 () Bool)

(assert (=> b!16690 m!11793))

(assert (=> b!16690 m!11793))

(declare-fun m!11795 () Bool)

(assert (=> b!16690 m!11795))

(assert (=> b!16692 m!11793))

(assert (=> b!16692 m!11793))

(assert (=> b!16692 m!11795))

(assert (=> d!3319 d!3339))

(declare-fun b!16722 () Bool)

(declare-fun e!10365 () List!531)

(assert (=> b!16722 (= e!10365 Nil!528)))

(declare-fun b!16723 () Bool)

(declare-fun e!10364 () Bool)

(declare-fun lt!4129 () List!531)

(assert (=> b!16723 (= e!10364 (not (containsKey!22 lt!4129 a!507)))))

(declare-fun b!16724 () Bool)

(declare-fun e!10363 () List!531)

(assert (=> b!16724 (= e!10363 (t!3144 (toList!277 lm!221)))))

(declare-fun b!16725 () Bool)

(declare-fun $colon$colon!29 (List!531 tuple2!692) List!531)

(assert (=> b!16725 (= e!10365 ($colon$colon!29 (removeStrictlySorted!20 (t!3144 (toList!277 lm!221)) a!507) (h!1093 (toList!277 lm!221))))))

