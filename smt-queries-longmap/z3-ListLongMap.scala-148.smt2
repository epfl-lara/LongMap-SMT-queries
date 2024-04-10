; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2780 () Bool)

(assert start!2780)

(declare-fun b_free!567 () Bool)

(declare-fun b_next!567 () Bool)

(assert (=> start!2780 (= b_free!567 (not b_next!567))))

(declare-fun tp!2861 () Bool)

(declare-fun b_and!1113 () Bool)

(assert (=> start!2780 (= tp!2861 b_and!1113)))

(declare-fun p!191 () Int)

(declare-datatypes ((B!688 0))(
  ( (B!689 (val!442 Int)) )
))
(declare-datatypes ((tuple2!684 0))(
  ( (tuple2!685 (_1!342 (_ BitVec 64)) (_2!342 B!688)) )
))
(declare-datatypes ((List!527 0))(
  ( (Nil!524) (Cons!523 (h!1089 tuple2!684) (t!3065 List!527)) )
))
(declare-datatypes ((ListLongMap!515 0))(
  ( (ListLongMap!516 (toList!273 List!527)) )
))
(declare-fun lm!221 () ListLongMap!515)

(declare-fun a!507 () (_ BitVec 64))

(declare-fun b!16183 () Bool)

(declare-fun e!9946 () Bool)

(declare-fun forall!144 (List!527 Int) Bool)

(declare-fun -!31 (ListLongMap!515 (_ BitVec 64)) ListLongMap!515)

(assert (=> b!16183 (= e!9946 (not (forall!144 (toList!273 (-!31 lm!221 a!507)) p!191)))))

(declare-fun lt!3969 () ListLongMap!515)

(assert (=> b!16183 (forall!144 (toList!273 (-!31 lt!3969 a!507)) p!191)))

(declare-datatypes ((Unit!320 0))(
  ( (Unit!321) )
))
(declare-fun lt!3970 () Unit!320)

(declare-fun removeValidProp!21 (ListLongMap!515 Int (_ BitVec 64)) Unit!320)

(assert (=> b!16183 (= lt!3970 (removeValidProp!21 lt!3969 p!191 a!507))))

(declare-fun b!16181 () Bool)

(declare-fun res!12085 () Bool)

(declare-fun e!9944 () Bool)

(assert (=> b!16181 (=> (not res!12085) (not e!9944))))

(declare-fun isEmpty!157 (ListLongMap!515) Bool)

(assert (=> b!16181 (= res!12085 (not (isEmpty!157 lm!221)))))

(declare-fun res!12084 () Bool)

(assert (=> start!2780 (=> (not res!12084) (not e!9944))))

(assert (=> start!2780 (= res!12084 (forall!144 (toList!273 lm!221) p!191))))

(assert (=> start!2780 e!9944))

(declare-fun e!9945 () Bool)

(declare-fun inv!889 (ListLongMap!515) Bool)

(assert (=> start!2780 (and (inv!889 lm!221) e!9945)))

(assert (=> start!2780 tp!2861))

(assert (=> start!2780 true))

(declare-fun b!16182 () Bool)

(assert (=> b!16182 (= e!9944 e!9946)))

(declare-fun res!12086 () Bool)

(assert (=> b!16182 (=> (not res!12086) (not e!9946))))

(assert (=> b!16182 (= res!12086 (forall!144 (toList!273 lt!3969) p!191))))

(declare-fun tail!81 (ListLongMap!515) ListLongMap!515)

(assert (=> b!16182 (= lt!3969 (tail!81 lm!221))))

(declare-fun b!16184 () Bool)

(declare-fun tp!2860 () Bool)

(assert (=> b!16184 (= e!9945 tp!2860)))

(assert (= (and start!2780 res!12084) b!16181))

(assert (= (and b!16181 res!12085) b!16182))

(assert (= (and b!16182 res!12086) b!16183))

(assert (= start!2780 b!16184))

(declare-fun m!11187 () Bool)

(assert (=> b!16183 m!11187))

(declare-fun m!11189 () Bool)

(assert (=> b!16183 m!11189))

(declare-fun m!11191 () Bool)

(assert (=> b!16183 m!11191))

(declare-fun m!11193 () Bool)

(assert (=> b!16183 m!11193))

(declare-fun m!11195 () Bool)

(assert (=> b!16183 m!11195))

(declare-fun m!11197 () Bool)

(assert (=> b!16181 m!11197))

(declare-fun m!11199 () Bool)

(assert (=> start!2780 m!11199))

(declare-fun m!11201 () Bool)

(assert (=> start!2780 m!11201))

(declare-fun m!11203 () Bool)

(assert (=> b!16182 m!11203))

(declare-fun m!11205 () Bool)

(assert (=> b!16182 m!11205))

(check-sat b_and!1113 (not b!16184) (not b!16183) (not start!2780) (not b!16181) (not b_next!567) (not b!16182))
(check-sat b_and!1113 (not b_next!567))
(get-model)

(declare-fun d!3031 () Bool)

(declare-fun isEmpty!159 (List!527) Bool)

(assert (=> d!3031 (= (isEmpty!157 lm!221) (isEmpty!159 (toList!273 lm!221)))))

(declare-fun bs!759 () Bool)

(assert (= bs!759 d!3031))

(declare-fun m!11227 () Bool)

(assert (=> bs!759 m!11227))

(assert (=> b!16181 d!3031))

(declare-fun d!3033 () Bool)

(declare-fun res!12106 () Bool)

(declare-fun e!9966 () Bool)

(assert (=> d!3033 (=> res!12106 e!9966)))

(get-info :version)

(assert (=> d!3033 (= res!12106 ((_ is Nil!524) (toList!273 lm!221)))))

(assert (=> d!3033 (= (forall!144 (toList!273 lm!221) p!191) e!9966)))

(declare-fun b!16207 () Bool)

(declare-fun e!9967 () Bool)

(assert (=> b!16207 (= e!9966 e!9967)))

(declare-fun res!12107 () Bool)

(assert (=> b!16207 (=> (not res!12107) (not e!9967))))

(declare-fun dynLambda!128 (Int tuple2!684) Bool)

(assert (=> b!16207 (= res!12107 (dynLambda!128 p!191 (h!1089 (toList!273 lm!221))))))

(declare-fun b!16208 () Bool)

(assert (=> b!16208 (= e!9967 (forall!144 (t!3065 (toList!273 lm!221)) p!191))))

(assert (= (and d!3033 (not res!12106)) b!16207))

(assert (= (and b!16207 res!12107) b!16208))

(declare-fun b_lambda!1245 () Bool)

(assert (=> (not b_lambda!1245) (not b!16207)))

(declare-fun t!3070 () Bool)

(declare-fun tb!531 () Bool)

(assert (=> (and start!2780 (= p!191 p!191) t!3070) tb!531))

(declare-fun result!897 () Bool)

(assert (=> tb!531 (= result!897 true)))

(assert (=> b!16207 t!3070))

(declare-fun b_and!1119 () Bool)

(assert (= b_and!1113 (and (=> t!3070 result!897) b_and!1119)))

(declare-fun m!11235 () Bool)

(assert (=> b!16207 m!11235))

(declare-fun m!11237 () Bool)

(assert (=> b!16208 m!11237))

(assert (=> start!2780 d!3033))

(declare-fun d!3039 () Bool)

(declare-fun isStrictlySorted!165 (List!527) Bool)

(assert (=> d!3039 (= (inv!889 lm!221) (isStrictlySorted!165 (toList!273 lm!221)))))

(declare-fun bs!762 () Bool)

(assert (= bs!762 d!3039))

(declare-fun m!11243 () Bool)

(assert (=> bs!762 m!11243))

(assert (=> start!2780 d!3039))

(declare-fun d!3043 () Bool)

(declare-fun res!12112 () Bool)

(declare-fun e!9972 () Bool)

(assert (=> d!3043 (=> res!12112 e!9972)))

(assert (=> d!3043 (= res!12112 ((_ is Nil!524) (toList!273 (-!31 lm!221 a!507))))))

(assert (=> d!3043 (= (forall!144 (toList!273 (-!31 lm!221 a!507)) p!191) e!9972)))

(declare-fun b!16213 () Bool)

(declare-fun e!9973 () Bool)

(assert (=> b!16213 (= e!9972 e!9973)))

(declare-fun res!12113 () Bool)

(assert (=> b!16213 (=> (not res!12113) (not e!9973))))

(assert (=> b!16213 (= res!12113 (dynLambda!128 p!191 (h!1089 (toList!273 (-!31 lm!221 a!507)))))))

(declare-fun b!16214 () Bool)

(assert (=> b!16214 (= e!9973 (forall!144 (t!3065 (toList!273 (-!31 lm!221 a!507))) p!191))))

(assert (= (and d!3043 (not res!12112)) b!16213))

(assert (= (and b!16213 res!12113) b!16214))

(declare-fun b_lambda!1247 () Bool)

(assert (=> (not b_lambda!1247) (not b!16213)))

(declare-fun t!3072 () Bool)

(declare-fun tb!533 () Bool)

(assert (=> (and start!2780 (= p!191 p!191) t!3072) tb!533))

(declare-fun result!899 () Bool)

(assert (=> tb!533 (= result!899 true)))

(assert (=> b!16213 t!3072))

(declare-fun b_and!1121 () Bool)

(assert (= b_and!1119 (and (=> t!3072 result!899) b_and!1121)))

(declare-fun m!11245 () Bool)

(assert (=> b!16213 m!11245))

(declare-fun m!11247 () Bool)

(assert (=> b!16214 m!11247))

(assert (=> b!16183 d!3043))

(declare-fun d!3045 () Bool)

(declare-fun res!12116 () Bool)

(declare-fun e!9976 () Bool)

(assert (=> d!3045 (=> res!12116 e!9976)))

(assert (=> d!3045 (= res!12116 ((_ is Nil!524) (toList!273 (-!31 lt!3969 a!507))))))

(assert (=> d!3045 (= (forall!144 (toList!273 (-!31 lt!3969 a!507)) p!191) e!9976)))

(declare-fun b!16217 () Bool)

(declare-fun e!9977 () Bool)

(assert (=> b!16217 (= e!9976 e!9977)))

(declare-fun res!12117 () Bool)

(assert (=> b!16217 (=> (not res!12117) (not e!9977))))

(assert (=> b!16217 (= res!12117 (dynLambda!128 p!191 (h!1089 (toList!273 (-!31 lt!3969 a!507)))))))

(declare-fun b!16218 () Bool)

(assert (=> b!16218 (= e!9977 (forall!144 (t!3065 (toList!273 (-!31 lt!3969 a!507))) p!191))))

(assert (= (and d!3045 (not res!12116)) b!16217))

(assert (= (and b!16217 res!12117) b!16218))

(declare-fun b_lambda!1251 () Bool)

(assert (=> (not b_lambda!1251) (not b!16217)))

(declare-fun t!3076 () Bool)

(declare-fun tb!537 () Bool)

(assert (=> (and start!2780 (= p!191 p!191) t!3076) tb!537))

(declare-fun result!903 () Bool)

(assert (=> tb!537 (= result!903 true)))

(assert (=> b!16217 t!3076))

(declare-fun b_and!1125 () Bool)

(assert (= b_and!1121 (and (=> t!3076 result!903) b_and!1125)))

(declare-fun m!11253 () Bool)

(assert (=> b!16217 m!11253))

(declare-fun m!11257 () Bool)

(assert (=> b!16218 m!11257))

(assert (=> b!16183 d!3045))

(declare-fun d!3049 () Bool)

(assert (=> d!3049 (forall!144 (toList!273 (-!31 lt!3969 a!507)) p!191)))

(declare-fun lt!3989 () Unit!320)

(declare-fun choose!182 (ListLongMap!515 Int (_ BitVec 64)) Unit!320)

(assert (=> d!3049 (= lt!3989 (choose!182 lt!3969 p!191 a!507))))

(assert (=> d!3049 (forall!144 (toList!273 lt!3969) p!191)))

(assert (=> d!3049 (= (removeValidProp!21 lt!3969 p!191 a!507) lt!3989)))

(declare-fun bs!766 () Bool)

(assert (= bs!766 d!3049))

(assert (=> bs!766 m!11191))

(assert (=> bs!766 m!11195))

(declare-fun m!11281 () Bool)

(assert (=> bs!766 m!11281))

(assert (=> bs!766 m!11203))

(assert (=> b!16183 d!3049))

(declare-fun d!3063 () Bool)

(declare-fun lt!3996 () ListLongMap!515)

(declare-fun contains!205 (ListLongMap!515 (_ BitVec 64)) Bool)

(assert (=> d!3063 (not (contains!205 lt!3996 a!507))))

(declare-fun removeStrictlySorted!17 (List!527 (_ BitVec 64)) List!527)

(assert (=> d!3063 (= lt!3996 (ListLongMap!516 (removeStrictlySorted!17 (toList!273 lt!3969) a!507)))))

(assert (=> d!3063 (= (-!31 lt!3969 a!507) lt!3996)))

(declare-fun bs!771 () Bool)

(assert (= bs!771 d!3063))

(declare-fun m!11303 () Bool)

(assert (=> bs!771 m!11303))

(declare-fun m!11305 () Bool)

(assert (=> bs!771 m!11305))

(assert (=> b!16183 d!3063))

(declare-fun d!3079 () Bool)

(declare-fun lt!3997 () ListLongMap!515)

(assert (=> d!3079 (not (contains!205 lt!3997 a!507))))

(assert (=> d!3079 (= lt!3997 (ListLongMap!516 (removeStrictlySorted!17 (toList!273 lm!221) a!507)))))

(assert (=> d!3079 (= (-!31 lm!221 a!507) lt!3997)))

(declare-fun bs!773 () Bool)

(assert (= bs!773 d!3079))

(declare-fun m!11309 () Bool)

(assert (=> bs!773 m!11309))

(declare-fun m!11311 () Bool)

(assert (=> bs!773 m!11311))

(assert (=> b!16183 d!3079))

(declare-fun d!3083 () Bool)

(declare-fun res!12130 () Bool)

(declare-fun e!9990 () Bool)

(assert (=> d!3083 (=> res!12130 e!9990)))

(assert (=> d!3083 (= res!12130 ((_ is Nil!524) (toList!273 lt!3969)))))

(assert (=> d!3083 (= (forall!144 (toList!273 lt!3969) p!191) e!9990)))

(declare-fun b!16231 () Bool)

(declare-fun e!9991 () Bool)

(assert (=> b!16231 (= e!9990 e!9991)))

(declare-fun res!12131 () Bool)

(assert (=> b!16231 (=> (not res!12131) (not e!9991))))

(assert (=> b!16231 (= res!12131 (dynLambda!128 p!191 (h!1089 (toList!273 lt!3969))))))

(declare-fun b!16232 () Bool)

(assert (=> b!16232 (= e!9991 (forall!144 (t!3065 (toList!273 lt!3969)) p!191))))

(assert (= (and d!3083 (not res!12130)) b!16231))

(assert (= (and b!16231 res!12131) b!16232))

(declare-fun b_lambda!1265 () Bool)

(assert (=> (not b_lambda!1265) (not b!16231)))

(declare-fun t!3090 () Bool)

(declare-fun tb!551 () Bool)

(assert (=> (and start!2780 (= p!191 p!191) t!3090) tb!551))

(declare-fun result!917 () Bool)

(assert (=> tb!551 (= result!917 true)))

(assert (=> b!16231 t!3090))

(declare-fun b_and!1139 () Bool)

(assert (= b_and!1125 (and (=> t!3090 result!917) b_and!1139)))

(declare-fun m!11315 () Bool)

(assert (=> b!16231 m!11315))

(declare-fun m!11317 () Bool)

(assert (=> b!16232 m!11317))

(assert (=> b!16182 d!3083))

(declare-fun d!3085 () Bool)

(declare-fun tail!84 (List!527) List!527)

(assert (=> d!3085 (= (tail!81 lm!221) (ListLongMap!516 (tail!84 (toList!273 lm!221))))))

(declare-fun bs!776 () Bool)

(assert (= bs!776 d!3085))

(declare-fun m!11321 () Bool)

(assert (=> bs!776 m!11321))

(assert (=> b!16182 d!3085))

(declare-fun b!16247 () Bool)

(declare-fun e!10000 () Bool)

(declare-fun tp_is_empty!833 () Bool)

(declare-fun tp!2876 () Bool)

(assert (=> b!16247 (= e!10000 (and tp_is_empty!833 tp!2876))))

(assert (=> b!16184 (= tp!2860 e!10000)))

(assert (= (and b!16184 ((_ is Cons!523) (toList!273 lm!221))) b!16247))

(declare-fun b_lambda!1283 () Bool)

(assert (= b_lambda!1245 (or (and start!2780 b_free!567) b_lambda!1283)))

(declare-fun b_lambda!1285 () Bool)

(assert (= b_lambda!1251 (or (and start!2780 b_free!567) b_lambda!1285)))

(declare-fun b_lambda!1287 () Bool)

(assert (= b_lambda!1247 (or (and start!2780 b_free!567) b_lambda!1287)))

(declare-fun b_lambda!1289 () Bool)

(assert (= b_lambda!1265 (or (and start!2780 b_free!567) b_lambda!1289)))

(check-sat (not b_lambda!1285) (not d!3063) b_and!1139 (not b!16247) (not d!3049) (not d!3039) (not b_lambda!1287) (not b_next!567) (not b!16218) (not b!16214) (not d!3085) (not d!3031) (not b_lambda!1289) (not d!3079) (not b_lambda!1283) (not b!16232) (not b!16208) tp_is_empty!833)
(check-sat b_and!1139 (not b_next!567))
(get-model)

(declare-fun d!3087 () Bool)

(declare-fun e!10014 () Bool)

(assert (=> d!3087 e!10014))

(declare-fun res!12142 () Bool)

(assert (=> d!3087 (=> res!12142 e!10014)))

(declare-fun lt!4009 () Bool)

(assert (=> d!3087 (= res!12142 (not lt!4009))))

(declare-fun lt!4008 () Bool)

(assert (=> d!3087 (= lt!4009 lt!4008)))

(declare-fun lt!4007 () Unit!320)

(declare-fun e!10013 () Unit!320)

(assert (=> d!3087 (= lt!4007 e!10013)))

(declare-fun c!1521 () Bool)

(assert (=> d!3087 (= c!1521 lt!4008)))

(declare-fun containsKey!17 (List!527 (_ BitVec 64)) Bool)

(assert (=> d!3087 (= lt!4008 (containsKey!17 (toList!273 lt!3997) a!507))))

(assert (=> d!3087 (= (contains!205 lt!3997 a!507) lt!4009)))

(declare-fun b!16262 () Bool)

(declare-fun lt!4006 () Unit!320)

(assert (=> b!16262 (= e!10013 lt!4006)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!14 (List!527 (_ BitVec 64)) Unit!320)

(assert (=> b!16262 (= lt!4006 (lemmaContainsKeyImpliesGetValueByKeyDefined!14 (toList!273 lt!3997) a!507))))

(declare-datatypes ((Option!59 0))(
  ( (Some!58 (v!1388 B!688)) (None!57) )
))
(declare-fun isDefined!15 (Option!59) Bool)

(declare-fun getValueByKey!53 (List!527 (_ BitVec 64)) Option!59)

(assert (=> b!16262 (isDefined!15 (getValueByKey!53 (toList!273 lt!3997) a!507))))

(declare-fun b!16263 () Bool)

(declare-fun Unit!324 () Unit!320)

(assert (=> b!16263 (= e!10013 Unit!324)))

(declare-fun b!16264 () Bool)

(assert (=> b!16264 (= e!10014 (isDefined!15 (getValueByKey!53 (toList!273 lt!3997) a!507)))))

(assert (= (and d!3087 c!1521) b!16262))

(assert (= (and d!3087 (not c!1521)) b!16263))

(assert (= (and d!3087 (not res!12142)) b!16264))

(declare-fun m!11335 () Bool)

(assert (=> d!3087 m!11335))

(declare-fun m!11337 () Bool)

(assert (=> b!16262 m!11337))

(declare-fun m!11341 () Bool)

(assert (=> b!16262 m!11341))

(assert (=> b!16262 m!11341))

(declare-fun m!11345 () Bool)

(assert (=> b!16262 m!11345))

(assert (=> b!16264 m!11341))

(assert (=> b!16264 m!11341))

(assert (=> b!16264 m!11345))

(assert (=> d!3079 d!3087))

(declare-fun d!3101 () Bool)

(declare-fun e!10027 () Bool)

(assert (=> d!3101 e!10027))

(declare-fun res!12147 () Bool)

(assert (=> d!3101 (=> (not res!12147) (not e!10027))))

(declare-fun lt!4020 () List!527)

(assert (=> d!3101 (= res!12147 (isStrictlySorted!165 lt!4020))))

(declare-fun e!10026 () List!527)

(assert (=> d!3101 (= lt!4020 e!10026)))

(declare-fun c!1529 () Bool)

(assert (=> d!3101 (= c!1529 (and ((_ is Cons!523) (toList!273 lm!221)) (= (_1!342 (h!1089 (toList!273 lm!221))) a!507)))))

(assert (=> d!3101 (isStrictlySorted!165 (toList!273 lm!221))))

(assert (=> d!3101 (= (removeStrictlySorted!17 (toList!273 lm!221) a!507) lt!4020)))

(declare-fun b!16281 () Bool)

(declare-fun e!10025 () List!527)

(declare-fun $colon$colon!24 (List!527 tuple2!684) List!527)

(assert (=> b!16281 (= e!10025 ($colon$colon!24 (removeStrictlySorted!17 (t!3065 (toList!273 lm!221)) a!507) (h!1089 (toList!273 lm!221))))))

(declare-fun b!16282 () Bool)

(assert (=> b!16282 (= e!10027 (not (containsKey!17 lt!4020 a!507)))))

(declare-fun b!16283 () Bool)

(assert (=> b!16283 (= e!10026 (t!3065 (toList!273 lm!221)))))

(declare-fun b!16284 () Bool)

(assert (=> b!16284 (= e!10025 Nil!524)))

(declare-fun b!16285 () Bool)

(assert (=> b!16285 (= e!10026 e!10025)))

(declare-fun c!1528 () Bool)

(assert (=> b!16285 (= c!1528 (and ((_ is Cons!523) (toList!273 lm!221)) (not (= (_1!342 (h!1089 (toList!273 lm!221))) a!507))))))

(assert (= (and d!3101 c!1529) b!16283))

(assert (= (and d!3101 (not c!1529)) b!16285))

(assert (= (and b!16285 c!1528) b!16281))

(assert (= (and b!16285 (not c!1528)) b!16284))

(assert (= (and d!3101 res!12147) b!16282))

(declare-fun m!11347 () Bool)

(assert (=> d!3101 m!11347))

(assert (=> d!3101 m!11243))

(declare-fun m!11349 () Bool)

(assert (=> b!16281 m!11349))

(assert (=> b!16281 m!11349))

(declare-fun m!11351 () Bool)

(assert (=> b!16281 m!11351))

(declare-fun m!11353 () Bool)

(assert (=> b!16282 m!11353))

(assert (=> d!3079 d!3101))

(declare-fun d!3103 () Bool)

(assert (=> d!3103 (= (tail!84 (toList!273 lm!221)) (t!3065 (toList!273 lm!221)))))

(assert (=> d!3085 d!3103))

(declare-fun d!3107 () Bool)

(declare-fun res!12149 () Bool)

(declare-fun e!10030 () Bool)

(assert (=> d!3107 (=> res!12149 e!10030)))

(assert (=> d!3107 (= res!12149 ((_ is Nil!524) (t!3065 (toList!273 lt!3969))))))

(assert (=> d!3107 (= (forall!144 (t!3065 (toList!273 lt!3969)) p!191) e!10030)))

(declare-fun b!16289 () Bool)

(declare-fun e!10031 () Bool)

(assert (=> b!16289 (= e!10030 e!10031)))

(declare-fun res!12150 () Bool)

(assert (=> b!16289 (=> (not res!12150) (not e!10031))))

(assert (=> b!16289 (= res!12150 (dynLambda!128 p!191 (h!1089 (t!3065 (toList!273 lt!3969)))))))

(declare-fun b!16290 () Bool)

(assert (=> b!16290 (= e!10031 (forall!144 (t!3065 (t!3065 (toList!273 lt!3969))) p!191))))

(assert (= (and d!3107 (not res!12149)) b!16289))

(assert (= (and b!16289 res!12150) b!16290))

(declare-fun b_lambda!1299 () Bool)

(assert (=> (not b_lambda!1299) (not b!16289)))

(declare-fun t!3100 () Bool)

(declare-fun tb!561 () Bool)

(assert (=> (and start!2780 (= p!191 p!191) t!3100) tb!561))

(declare-fun result!933 () Bool)

(assert (=> tb!561 (= result!933 true)))

(assert (=> b!16289 t!3100))

(declare-fun b_and!1149 () Bool)

(assert (= b_and!1139 (and (=> t!3100 result!933) b_and!1149)))

(declare-fun m!11363 () Bool)

(assert (=> b!16289 m!11363))

(declare-fun m!11365 () Bool)

(assert (=> b!16290 m!11365))

(assert (=> b!16232 d!3107))

(declare-fun d!3111 () Bool)

(declare-fun res!12151 () Bool)

(declare-fun e!10032 () Bool)

(assert (=> d!3111 (=> res!12151 e!10032)))

(assert (=> d!3111 (= res!12151 ((_ is Nil!524) (t!3065 (toList!273 (-!31 lt!3969 a!507)))))))

(assert (=> d!3111 (= (forall!144 (t!3065 (toList!273 (-!31 lt!3969 a!507))) p!191) e!10032)))

(declare-fun b!16291 () Bool)

(declare-fun e!10033 () Bool)

(assert (=> b!16291 (= e!10032 e!10033)))

(declare-fun res!12152 () Bool)

(assert (=> b!16291 (=> (not res!12152) (not e!10033))))

(assert (=> b!16291 (= res!12152 (dynLambda!128 p!191 (h!1089 (t!3065 (toList!273 (-!31 lt!3969 a!507))))))))

(declare-fun b!16292 () Bool)

(assert (=> b!16292 (= e!10033 (forall!144 (t!3065 (t!3065 (toList!273 (-!31 lt!3969 a!507)))) p!191))))

(assert (= (and d!3111 (not res!12151)) b!16291))

(assert (= (and b!16291 res!12152) b!16292))

(declare-fun b_lambda!1301 () Bool)

(assert (=> (not b_lambda!1301) (not b!16291)))

(declare-fun t!3102 () Bool)

(declare-fun tb!563 () Bool)

(assert (=> (and start!2780 (= p!191 p!191) t!3102) tb!563))

(declare-fun result!935 () Bool)

(assert (=> tb!563 (= result!935 true)))

(assert (=> b!16291 t!3102))

(declare-fun b_and!1151 () Bool)

(assert (= b_and!1149 (and (=> t!3102 result!935) b_and!1151)))

(declare-fun m!11367 () Bool)

(assert (=> b!16291 m!11367))

(declare-fun m!11369 () Bool)

(assert (=> b!16292 m!11369))

(assert (=> b!16218 d!3111))

(declare-fun d!3113 () Bool)

(declare-fun res!12167 () Bool)

(declare-fun e!10052 () Bool)

(assert (=> d!3113 (=> res!12167 e!10052)))

(assert (=> d!3113 (= res!12167 (or ((_ is Nil!524) (toList!273 lm!221)) ((_ is Nil!524) (t!3065 (toList!273 lm!221)))))))

(assert (=> d!3113 (= (isStrictlySorted!165 (toList!273 lm!221)) e!10052)))

(declare-fun b!16315 () Bool)

(declare-fun e!10053 () Bool)

(assert (=> b!16315 (= e!10052 e!10053)))

(declare-fun res!12168 () Bool)

(assert (=> b!16315 (=> (not res!12168) (not e!10053))))

(assert (=> b!16315 (= res!12168 (bvslt (_1!342 (h!1089 (toList!273 lm!221))) (_1!342 (h!1089 (t!3065 (toList!273 lm!221))))))))

(declare-fun b!16316 () Bool)

(assert (=> b!16316 (= e!10053 (isStrictlySorted!165 (t!3065 (toList!273 lm!221))))))

(assert (= (and d!3113 (not res!12167)) b!16315))

(assert (= (and b!16315 res!12168) b!16316))

(declare-fun m!11373 () Bool)

(assert (=> b!16316 m!11373))

(assert (=> d!3039 d!3113))

(declare-fun d!3117 () Bool)

(declare-fun res!12169 () Bool)

(declare-fun e!10054 () Bool)

(assert (=> d!3117 (=> res!12169 e!10054)))

(assert (=> d!3117 (= res!12169 ((_ is Nil!524) (t!3065 (toList!273 lm!221))))))

(assert (=> d!3117 (= (forall!144 (t!3065 (toList!273 lm!221)) p!191) e!10054)))

(declare-fun b!16317 () Bool)

(declare-fun e!10055 () Bool)

(assert (=> b!16317 (= e!10054 e!10055)))

(declare-fun res!12170 () Bool)

(assert (=> b!16317 (=> (not res!12170) (not e!10055))))

(assert (=> b!16317 (= res!12170 (dynLambda!128 p!191 (h!1089 (t!3065 (toList!273 lm!221)))))))

(declare-fun b!16318 () Bool)

(assert (=> b!16318 (= e!10055 (forall!144 (t!3065 (t!3065 (toList!273 lm!221))) p!191))))

(assert (= (and d!3117 (not res!12169)) b!16317))

(assert (= (and b!16317 res!12170) b!16318))

(declare-fun b_lambda!1305 () Bool)

(assert (=> (not b_lambda!1305) (not b!16317)))

(declare-fun t!3106 () Bool)

(declare-fun tb!567 () Bool)

(assert (=> (and start!2780 (= p!191 p!191) t!3106) tb!567))

(declare-fun result!939 () Bool)

(assert (=> tb!567 (= result!939 true)))

(assert (=> b!16317 t!3106))

(declare-fun b_and!1155 () Bool)

(assert (= b_and!1151 (and (=> t!3106 result!939) b_and!1155)))

(declare-fun m!11379 () Bool)

(assert (=> b!16317 m!11379))

(declare-fun m!11381 () Bool)

(assert (=> b!16318 m!11381))

(assert (=> b!16208 d!3117))

(declare-fun d!3121 () Bool)

(declare-fun e!10059 () Bool)

(assert (=> d!3121 e!10059))

(declare-fun res!12173 () Bool)

(assert (=> d!3121 (=> res!12173 e!10059)))

(declare-fun lt!4030 () Bool)

(assert (=> d!3121 (= res!12173 (not lt!4030))))

(declare-fun lt!4029 () Bool)

(assert (=> d!3121 (= lt!4030 lt!4029)))

(declare-fun lt!4028 () Unit!320)

(declare-fun e!10058 () Unit!320)

(assert (=> d!3121 (= lt!4028 e!10058)))

(declare-fun c!1535 () Bool)

(assert (=> d!3121 (= c!1535 lt!4029)))

(assert (=> d!3121 (= lt!4029 (containsKey!17 (toList!273 lt!3996) a!507))))

(assert (=> d!3121 (= (contains!205 lt!3996 a!507) lt!4030)))

(declare-fun b!16321 () Bool)

(declare-fun lt!4027 () Unit!320)

(assert (=> b!16321 (= e!10058 lt!4027)))

(assert (=> b!16321 (= lt!4027 (lemmaContainsKeyImpliesGetValueByKeyDefined!14 (toList!273 lt!3996) a!507))))

(assert (=> b!16321 (isDefined!15 (getValueByKey!53 (toList!273 lt!3996) a!507))))

(declare-fun b!16322 () Bool)

(declare-fun Unit!326 () Unit!320)

(assert (=> b!16322 (= e!10058 Unit!326)))

(declare-fun b!16323 () Bool)

(assert (=> b!16323 (= e!10059 (isDefined!15 (getValueByKey!53 (toList!273 lt!3996) a!507)))))

(assert (= (and d!3121 c!1535) b!16321))

(assert (= (and d!3121 (not c!1535)) b!16322))

(assert (= (and d!3121 (not res!12173)) b!16323))

(declare-fun m!11387 () Bool)

(assert (=> d!3121 m!11387))

(declare-fun m!11389 () Bool)

(assert (=> b!16321 m!11389))

(declare-fun m!11391 () Bool)

(assert (=> b!16321 m!11391))

(assert (=> b!16321 m!11391))

(declare-fun m!11393 () Bool)

(assert (=> b!16321 m!11393))

(assert (=> b!16323 m!11391))

(assert (=> b!16323 m!11391))

(assert (=> b!16323 m!11393))

(assert (=> d!3063 d!3121))

(declare-fun d!3125 () Bool)

(declare-fun e!10065 () Bool)

(assert (=> d!3125 e!10065))

(declare-fun res!12175 () Bool)

(assert (=> d!3125 (=> (not res!12175) (not e!10065))))

(declare-fun lt!4032 () List!527)

(assert (=> d!3125 (= res!12175 (isStrictlySorted!165 lt!4032))))

(declare-fun e!10064 () List!527)

(assert (=> d!3125 (= lt!4032 e!10064)))

(declare-fun c!1539 () Bool)

(assert (=> d!3125 (= c!1539 (and ((_ is Cons!523) (toList!273 lt!3969)) (= (_1!342 (h!1089 (toList!273 lt!3969))) a!507)))))

(assert (=> d!3125 (isStrictlySorted!165 (toList!273 lt!3969))))

(assert (=> d!3125 (= (removeStrictlySorted!17 (toList!273 lt!3969) a!507) lt!4032)))

(declare-fun b!16329 () Bool)

(declare-fun e!10063 () List!527)

(assert (=> b!16329 (= e!10063 ($colon$colon!24 (removeStrictlySorted!17 (t!3065 (toList!273 lt!3969)) a!507) (h!1089 (toList!273 lt!3969))))))

(declare-fun b!16330 () Bool)

(assert (=> b!16330 (= e!10065 (not (containsKey!17 lt!4032 a!507)))))

(declare-fun b!16331 () Bool)

(assert (=> b!16331 (= e!10064 (t!3065 (toList!273 lt!3969)))))

(declare-fun b!16332 () Bool)

(assert (=> b!16332 (= e!10063 Nil!524)))

(declare-fun b!16333 () Bool)

(assert (=> b!16333 (= e!10064 e!10063)))

(declare-fun c!1538 () Bool)

(assert (=> b!16333 (= c!1538 (and ((_ is Cons!523) (toList!273 lt!3969)) (not (= (_1!342 (h!1089 (toList!273 lt!3969))) a!507))))))

(assert (= (and d!3125 c!1539) b!16331))

(assert (= (and d!3125 (not c!1539)) b!16333))

(assert (= (and b!16333 c!1538) b!16329))

(assert (= (and b!16333 (not c!1538)) b!16332))

(assert (= (and d!3125 res!12175) b!16330))

(declare-fun m!11403 () Bool)

(assert (=> d!3125 m!11403))

(declare-fun m!11405 () Bool)

(assert (=> d!3125 m!11405))

(declare-fun m!11407 () Bool)

(assert (=> b!16329 m!11407))

(assert (=> b!16329 m!11407))

(declare-fun m!11409 () Bool)

(assert (=> b!16329 m!11409))

(declare-fun m!11411 () Bool)

(assert (=> b!16330 m!11411))

(assert (=> d!3063 d!3125))

(declare-fun d!3129 () Bool)

(declare-fun res!12177 () Bool)

(declare-fun e!10068 () Bool)

(assert (=> d!3129 (=> res!12177 e!10068)))

(assert (=> d!3129 (= res!12177 ((_ is Nil!524) (t!3065 (toList!273 (-!31 lm!221 a!507)))))))

(assert (=> d!3129 (= (forall!144 (t!3065 (toList!273 (-!31 lm!221 a!507))) p!191) e!10068)))

(declare-fun b!16337 () Bool)

(declare-fun e!10069 () Bool)

(assert (=> b!16337 (= e!10068 e!10069)))

(declare-fun res!12178 () Bool)

(assert (=> b!16337 (=> (not res!12178) (not e!10069))))

(assert (=> b!16337 (= res!12178 (dynLambda!128 p!191 (h!1089 (t!3065 (toList!273 (-!31 lm!221 a!507))))))))

(declare-fun b!16338 () Bool)

(assert (=> b!16338 (= e!10069 (forall!144 (t!3065 (t!3065 (toList!273 (-!31 lm!221 a!507)))) p!191))))

(assert (= (and d!3129 (not res!12177)) b!16337))

(assert (= (and b!16337 res!12178) b!16338))

(declare-fun b_lambda!1309 () Bool)

(assert (=> (not b_lambda!1309) (not b!16337)))

(declare-fun t!3110 () Bool)

(declare-fun tb!571 () Bool)

(assert (=> (and start!2780 (= p!191 p!191) t!3110) tb!571))

(declare-fun result!943 () Bool)

(assert (=> tb!571 (= result!943 true)))

(assert (=> b!16337 t!3110))

(declare-fun b_and!1159 () Bool)

(assert (= b_and!1155 (and (=> t!3110 result!943) b_and!1159)))

(declare-fun m!11421 () Bool)

(assert (=> b!16337 m!11421))

(declare-fun m!11423 () Bool)

(assert (=> b!16338 m!11423))

(assert (=> b!16214 d!3129))

(declare-fun d!3133 () Bool)

(assert (=> d!3133 (= (isEmpty!159 (toList!273 lm!221)) ((_ is Nil!524) (toList!273 lm!221)))))

(assert (=> d!3031 d!3133))

(assert (=> d!3049 d!3045))

(assert (=> d!3049 d!3063))

(declare-fun d!3139 () Bool)

(assert (=> d!3139 (forall!144 (toList!273 (-!31 lt!3969 a!507)) p!191)))

(assert (=> d!3139 true))

(declare-fun _$31!20 () Unit!320)

(assert (=> d!3139 (= (choose!182 lt!3969 p!191 a!507) _$31!20)))

(declare-fun bs!778 () Bool)

(assert (= bs!778 d!3139))

(assert (=> bs!778 m!11191))

(assert (=> bs!778 m!11195))

(assert (=> d!3049 d!3139))

(assert (=> d!3049 d!3083))

(declare-fun b!16350 () Bool)

(declare-fun e!10079 () Bool)

(declare-fun tp!2877 () Bool)

(assert (=> b!16350 (= e!10079 (and tp_is_empty!833 tp!2877))))

(assert (=> b!16247 (= tp!2876 e!10079)))

(assert (= (and b!16247 ((_ is Cons!523) (t!3065 (toList!273 lm!221)))) b!16350))

(declare-fun b_lambda!1311 () Bool)

(assert (= b_lambda!1299 (or (and start!2780 b_free!567) b_lambda!1311)))

(declare-fun b_lambda!1313 () Bool)

(assert (= b_lambda!1301 (or (and start!2780 b_free!567) b_lambda!1313)))

(declare-fun b_lambda!1315 () Bool)

(assert (= b_lambda!1305 (or (and start!2780 b_free!567) b_lambda!1315)))

(declare-fun b_lambda!1317 () Bool)

(assert (= b_lambda!1309 (or (and start!2780 b_free!567) b_lambda!1317)))

(check-sat (not b_lambda!1311) (not b_lambda!1315) (not b!16262) (not b!16264) (not b!16318) (not b!16282) (not b_lambda!1287) (not b!16323) (not d!3087) tp_is_empty!833 (not b!16281) (not d!3101) (not b!16321) (not b_lambda!1285) (not d!3125) (not d!3121) (not b!16330) (not b_lambda!1313) (not b!16329) (not b!16338) (not b!16350) (not b!16290) (not d!3139) (not b_next!567) (not b_lambda!1289) (not b_lambda!1283) b_and!1159 (not b_lambda!1317) (not b!16292) (not b!16316))
(check-sat b_and!1159 (not b_next!567))
(get-model)

(declare-fun d!3159 () Bool)

(declare-fun res!12202 () Bool)

(declare-fun e!10110 () Bool)

(assert (=> d!3159 (=> res!12202 e!10110)))

(assert (=> d!3159 (= res!12202 (and ((_ is Cons!523) (toList!273 lt!3997)) (= (_1!342 (h!1089 (toList!273 lt!3997))) a!507)))))

(assert (=> d!3159 (= (containsKey!17 (toList!273 lt!3997) a!507) e!10110)))

(declare-fun b!16393 () Bool)

(declare-fun e!10111 () Bool)

(assert (=> b!16393 (= e!10110 e!10111)))

(declare-fun res!12203 () Bool)

(assert (=> b!16393 (=> (not res!12203) (not e!10111))))

(assert (=> b!16393 (= res!12203 (and (or (not ((_ is Cons!523) (toList!273 lt!3997))) (bvsle (_1!342 (h!1089 (toList!273 lt!3997))) a!507)) ((_ is Cons!523) (toList!273 lt!3997)) (bvslt (_1!342 (h!1089 (toList!273 lt!3997))) a!507)))))

(declare-fun b!16394 () Bool)

(assert (=> b!16394 (= e!10111 (containsKey!17 (t!3065 (toList!273 lt!3997)) a!507))))

(assert (= (and d!3159 (not res!12202)) b!16393))

(assert (= (and b!16393 res!12203) b!16394))

(declare-fun m!11479 () Bool)

(assert (=> b!16394 m!11479))

(assert (=> d!3087 d!3159))

(declare-fun d!3161 () Bool)

(declare-fun res!12204 () Bool)

(declare-fun e!10112 () Bool)

(assert (=> d!3161 (=> res!12204 e!10112)))

(assert (=> d!3161 (= res!12204 ((_ is Nil!524) (t!3065 (t!3065 (toList!273 lm!221)))))))

(assert (=> d!3161 (= (forall!144 (t!3065 (t!3065 (toList!273 lm!221))) p!191) e!10112)))

(declare-fun b!16395 () Bool)

(declare-fun e!10113 () Bool)

(assert (=> b!16395 (= e!10112 e!10113)))

(declare-fun res!12205 () Bool)

(assert (=> b!16395 (=> (not res!12205) (not e!10113))))

(assert (=> b!16395 (= res!12205 (dynLambda!128 p!191 (h!1089 (t!3065 (t!3065 (toList!273 lm!221))))))))

(declare-fun b!16396 () Bool)

(assert (=> b!16396 (= e!10113 (forall!144 (t!3065 (t!3065 (t!3065 (toList!273 lm!221)))) p!191))))

(assert (= (and d!3161 (not res!12204)) b!16395))

(assert (= (and b!16395 res!12205) b!16396))

(declare-fun b_lambda!1339 () Bool)

(assert (=> (not b_lambda!1339) (not b!16395)))

(declare-fun t!3116 () Bool)

(declare-fun tb!577 () Bool)

(assert (=> (and start!2780 (= p!191 p!191) t!3116) tb!577))

(declare-fun result!949 () Bool)

(assert (=> tb!577 (= result!949 true)))

(assert (=> b!16395 t!3116))

(declare-fun b_and!1165 () Bool)

(assert (= b_and!1159 (and (=> t!3116 result!949) b_and!1165)))

(declare-fun m!11481 () Bool)

(assert (=> b!16395 m!11481))

(declare-fun m!11483 () Bool)

(assert (=> b!16396 m!11483))

(assert (=> b!16318 d!3161))

(declare-fun d!3163 () Bool)

(assert (=> d!3163 (= ($colon$colon!24 (removeStrictlySorted!17 (t!3065 (toList!273 lm!221)) a!507) (h!1089 (toList!273 lm!221))) (Cons!523 (h!1089 (toList!273 lm!221)) (removeStrictlySorted!17 (t!3065 (toList!273 lm!221)) a!507)))))

(assert (=> b!16281 d!3163))

(declare-fun d!3165 () Bool)

(declare-fun e!10116 () Bool)

(assert (=> d!3165 e!10116))

(declare-fun res!12206 () Bool)

(assert (=> d!3165 (=> (not res!12206) (not e!10116))))

(declare-fun lt!4058 () List!527)

(assert (=> d!3165 (= res!12206 (isStrictlySorted!165 lt!4058))))

(declare-fun e!10115 () List!527)

(assert (=> d!3165 (= lt!4058 e!10115)))

(declare-fun c!1556 () Bool)

(assert (=> d!3165 (= c!1556 (and ((_ is Cons!523) (t!3065 (toList!273 lm!221))) (= (_1!342 (h!1089 (t!3065 (toList!273 lm!221)))) a!507)))))

(assert (=> d!3165 (isStrictlySorted!165 (t!3065 (toList!273 lm!221)))))

(assert (=> d!3165 (= (removeStrictlySorted!17 (t!3065 (toList!273 lm!221)) a!507) lt!4058)))

(declare-fun b!16397 () Bool)

(declare-fun e!10114 () List!527)

(assert (=> b!16397 (= e!10114 ($colon$colon!24 (removeStrictlySorted!17 (t!3065 (t!3065 (toList!273 lm!221))) a!507) (h!1089 (t!3065 (toList!273 lm!221)))))))

(declare-fun b!16398 () Bool)

(assert (=> b!16398 (= e!10116 (not (containsKey!17 lt!4058 a!507)))))

(declare-fun b!16399 () Bool)

(assert (=> b!16399 (= e!10115 (t!3065 (t!3065 (toList!273 lm!221))))))

(declare-fun b!16400 () Bool)

(assert (=> b!16400 (= e!10114 Nil!524)))

(declare-fun b!16401 () Bool)

(assert (=> b!16401 (= e!10115 e!10114)))

(declare-fun c!1555 () Bool)

(assert (=> b!16401 (= c!1555 (and ((_ is Cons!523) (t!3065 (toList!273 lm!221))) (not (= (_1!342 (h!1089 (t!3065 (toList!273 lm!221)))) a!507))))))

(assert (= (and d!3165 c!1556) b!16399))

(assert (= (and d!3165 (not c!1556)) b!16401))

(assert (= (and b!16401 c!1555) b!16397))

(assert (= (and b!16401 (not c!1555)) b!16400))

(assert (= (and d!3165 res!12206) b!16398))

(declare-fun m!11485 () Bool)

(assert (=> d!3165 m!11485))

(assert (=> d!3165 m!11373))

(declare-fun m!11487 () Bool)

(assert (=> b!16397 m!11487))

(assert (=> b!16397 m!11487))

(declare-fun m!11489 () Bool)

(assert (=> b!16397 m!11489))

(declare-fun m!11491 () Bool)

(assert (=> b!16398 m!11491))

(assert (=> b!16281 d!3165))

(assert (=> d!3139 d!3045))

(assert (=> d!3139 d!3063))

(declare-fun d!3167 () Bool)

(assert (=> d!3167 (isDefined!15 (getValueByKey!53 (toList!273 lt!3996) a!507))))

(declare-fun lt!4061 () Unit!320)

(declare-fun choose!184 (List!527 (_ BitVec 64)) Unit!320)

(assert (=> d!3167 (= lt!4061 (choose!184 (toList!273 lt!3996) a!507))))

(declare-fun e!10119 () Bool)

(assert (=> d!3167 e!10119))

(declare-fun res!12209 () Bool)

(assert (=> d!3167 (=> (not res!12209) (not e!10119))))

(assert (=> d!3167 (= res!12209 (isStrictlySorted!165 (toList!273 lt!3996)))))

(assert (=> d!3167 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!14 (toList!273 lt!3996) a!507) lt!4061)))

(declare-fun b!16404 () Bool)

(assert (=> b!16404 (= e!10119 (containsKey!17 (toList!273 lt!3996) a!507))))

(assert (= (and d!3167 res!12209) b!16404))

(assert (=> d!3167 m!11391))

(assert (=> d!3167 m!11391))

(assert (=> d!3167 m!11393))

(declare-fun m!11493 () Bool)

(assert (=> d!3167 m!11493))

(declare-fun m!11495 () Bool)

(assert (=> d!3167 m!11495))

(assert (=> b!16404 m!11387))

(assert (=> b!16321 d!3167))

(declare-fun d!3169 () Bool)

(declare-fun isEmpty!162 (Option!59) Bool)

(assert (=> d!3169 (= (isDefined!15 (getValueByKey!53 (toList!273 lt!3996) a!507)) (not (isEmpty!162 (getValueByKey!53 (toList!273 lt!3996) a!507))))))

(declare-fun bs!780 () Bool)

(assert (= bs!780 d!3169))

(assert (=> bs!780 m!11391))

(declare-fun m!11497 () Bool)

(assert (=> bs!780 m!11497))

(assert (=> b!16321 d!3169))

(declare-fun d!3171 () Bool)

(declare-fun c!1563 () Bool)

(assert (=> d!3171 (= c!1563 (and ((_ is Cons!523) (toList!273 lt!3996)) (= (_1!342 (h!1089 (toList!273 lt!3996))) a!507)))))

(declare-fun e!10127 () Option!59)

(assert (=> d!3171 (= (getValueByKey!53 (toList!273 lt!3996) a!507) e!10127)))

(declare-fun b!16421 () Bool)

(declare-fun e!10128 () Option!59)

(assert (=> b!16421 (= e!10128 None!57)))

(declare-fun b!16419 () Bool)

(assert (=> b!16419 (= e!10127 e!10128)))

(declare-fun c!1564 () Bool)

(assert (=> b!16419 (= c!1564 (and ((_ is Cons!523) (toList!273 lt!3996)) (not (= (_1!342 (h!1089 (toList!273 lt!3996))) a!507))))))

(declare-fun b!16420 () Bool)

(assert (=> b!16420 (= e!10128 (getValueByKey!53 (t!3065 (toList!273 lt!3996)) a!507))))

(declare-fun b!16418 () Bool)

(assert (=> b!16418 (= e!10127 (Some!58 (_2!342 (h!1089 (toList!273 lt!3996)))))))

(assert (= (and d!3171 c!1563) b!16418))

(assert (= (and d!3171 (not c!1563)) b!16419))

(assert (= (and b!16419 c!1564) b!16420))

(assert (= (and b!16419 (not c!1564)) b!16421))

(declare-fun m!11499 () Bool)

(assert (=> b!16420 m!11499))

(assert (=> b!16321 d!3171))

(declare-fun d!3177 () Bool)

(declare-fun res!12211 () Bool)

(declare-fun e!10129 () Bool)

(assert (=> d!3177 (=> res!12211 e!10129)))

(assert (=> d!3177 (= res!12211 (and ((_ is Cons!523) (toList!273 lt!3996)) (= (_1!342 (h!1089 (toList!273 lt!3996))) a!507)))))

(assert (=> d!3177 (= (containsKey!17 (toList!273 lt!3996) a!507) e!10129)))

(declare-fun b!16422 () Bool)

(declare-fun e!10130 () Bool)

(assert (=> b!16422 (= e!10129 e!10130)))

(declare-fun res!12212 () Bool)

(assert (=> b!16422 (=> (not res!12212) (not e!10130))))

(assert (=> b!16422 (= res!12212 (and (or (not ((_ is Cons!523) (toList!273 lt!3996))) (bvsle (_1!342 (h!1089 (toList!273 lt!3996))) a!507)) ((_ is Cons!523) (toList!273 lt!3996)) (bvslt (_1!342 (h!1089 (toList!273 lt!3996))) a!507)))))

(declare-fun b!16423 () Bool)

(assert (=> b!16423 (= e!10130 (containsKey!17 (t!3065 (toList!273 lt!3996)) a!507))))

(assert (= (and d!3177 (not res!12211)) b!16422))

(assert (= (and b!16422 res!12212) b!16423))

(declare-fun m!11511 () Bool)

(assert (=> b!16423 m!11511))

(assert (=> d!3121 d!3177))

(declare-fun d!3181 () Bool)

(assert (=> d!3181 (= (isDefined!15 (getValueByKey!53 (toList!273 lt!3997) a!507)) (not (isEmpty!162 (getValueByKey!53 (toList!273 lt!3997) a!507))))))

(declare-fun bs!781 () Bool)

(assert (= bs!781 d!3181))

(assert (=> bs!781 m!11341))

(declare-fun m!11513 () Bool)

(assert (=> bs!781 m!11513))

(assert (=> b!16264 d!3181))

(declare-fun d!3183 () Bool)

(declare-fun c!1565 () Bool)

(assert (=> d!3183 (= c!1565 (and ((_ is Cons!523) (toList!273 lt!3997)) (= (_1!342 (h!1089 (toList!273 lt!3997))) a!507)))))

(declare-fun e!10131 () Option!59)

(assert (=> d!3183 (= (getValueByKey!53 (toList!273 lt!3997) a!507) e!10131)))

(declare-fun b!16427 () Bool)

(declare-fun e!10132 () Option!59)

(assert (=> b!16427 (= e!10132 None!57)))

(declare-fun b!16425 () Bool)

(assert (=> b!16425 (= e!10131 e!10132)))

(declare-fun c!1566 () Bool)

(assert (=> b!16425 (= c!1566 (and ((_ is Cons!523) (toList!273 lt!3997)) (not (= (_1!342 (h!1089 (toList!273 lt!3997))) a!507))))))

(declare-fun b!16426 () Bool)

(assert (=> b!16426 (= e!10132 (getValueByKey!53 (t!3065 (toList!273 lt!3997)) a!507))))

(declare-fun b!16424 () Bool)

(assert (=> b!16424 (= e!10131 (Some!58 (_2!342 (h!1089 (toList!273 lt!3997)))))))

(assert (= (and d!3183 c!1565) b!16424))

(assert (= (and d!3183 (not c!1565)) b!16425))

(assert (= (and b!16425 c!1566) b!16426))

(assert (= (and b!16425 (not c!1566)) b!16427))

(declare-fun m!11517 () Bool)

(assert (=> b!16426 m!11517))

(assert (=> b!16264 d!3183))

(declare-fun d!3187 () Bool)

(declare-fun res!12213 () Bool)

(declare-fun e!10133 () Bool)

(assert (=> d!3187 (=> res!12213 e!10133)))

(assert (=> d!3187 (= res!12213 (and ((_ is Cons!523) lt!4020) (= (_1!342 (h!1089 lt!4020)) a!507)))))

(assert (=> d!3187 (= (containsKey!17 lt!4020 a!507) e!10133)))

(declare-fun b!16428 () Bool)

(declare-fun e!10134 () Bool)

(assert (=> b!16428 (= e!10133 e!10134)))

(declare-fun res!12214 () Bool)

(assert (=> b!16428 (=> (not res!12214) (not e!10134))))

(assert (=> b!16428 (= res!12214 (and (or (not ((_ is Cons!523) lt!4020)) (bvsle (_1!342 (h!1089 lt!4020)) a!507)) ((_ is Cons!523) lt!4020) (bvslt (_1!342 (h!1089 lt!4020)) a!507)))))

(declare-fun b!16429 () Bool)

(assert (=> b!16429 (= e!10134 (containsKey!17 (t!3065 lt!4020) a!507))))

(assert (= (and d!3187 (not res!12213)) b!16428))

(assert (= (and b!16428 res!12214) b!16429))

(declare-fun m!11519 () Bool)

(assert (=> b!16429 m!11519))

(assert (=> b!16282 d!3187))

(declare-fun d!3189 () Bool)

(assert (=> d!3189 (isDefined!15 (getValueByKey!53 (toList!273 lt!3997) a!507))))

(declare-fun lt!4063 () Unit!320)

(assert (=> d!3189 (= lt!4063 (choose!184 (toList!273 lt!3997) a!507))))

(declare-fun e!10135 () Bool)

(assert (=> d!3189 e!10135))

(declare-fun res!12215 () Bool)

(assert (=> d!3189 (=> (not res!12215) (not e!10135))))

(assert (=> d!3189 (= res!12215 (isStrictlySorted!165 (toList!273 lt!3997)))))

(assert (=> d!3189 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!14 (toList!273 lt!3997) a!507) lt!4063)))

(declare-fun b!16430 () Bool)

(assert (=> b!16430 (= e!10135 (containsKey!17 (toList!273 lt!3997) a!507))))

(assert (= (and d!3189 res!12215) b!16430))

(assert (=> d!3189 m!11341))

(assert (=> d!3189 m!11341))

(assert (=> d!3189 m!11345))

(declare-fun m!11521 () Bool)

(assert (=> d!3189 m!11521))

(declare-fun m!11523 () Bool)

(assert (=> d!3189 m!11523))

(assert (=> b!16430 m!11335))

(assert (=> b!16262 d!3189))

(assert (=> b!16262 d!3181))

(assert (=> b!16262 d!3183))

(declare-fun d!3191 () Bool)

(declare-fun res!12216 () Bool)

(declare-fun e!10136 () Bool)

(assert (=> d!3191 (=> res!12216 e!10136)))

(assert (=> d!3191 (= res!12216 ((_ is Nil!524) (t!3065 (t!3065 (toList!273 (-!31 lm!221 a!507))))))))

(assert (=> d!3191 (= (forall!144 (t!3065 (t!3065 (toList!273 (-!31 lm!221 a!507)))) p!191) e!10136)))

(declare-fun b!16431 () Bool)

(declare-fun e!10137 () Bool)

(assert (=> b!16431 (= e!10136 e!10137)))

(declare-fun res!12217 () Bool)

(assert (=> b!16431 (=> (not res!12217) (not e!10137))))

(assert (=> b!16431 (= res!12217 (dynLambda!128 p!191 (h!1089 (t!3065 (t!3065 (toList!273 (-!31 lm!221 a!507)))))))))

(declare-fun b!16432 () Bool)

(assert (=> b!16432 (= e!10137 (forall!144 (t!3065 (t!3065 (t!3065 (toList!273 (-!31 lm!221 a!507))))) p!191))))

(assert (= (and d!3191 (not res!12216)) b!16431))

(assert (= (and b!16431 res!12217) b!16432))

(declare-fun b_lambda!1341 () Bool)

(assert (=> (not b_lambda!1341) (not b!16431)))

(declare-fun t!3120 () Bool)

(declare-fun tb!579 () Bool)

(assert (=> (and start!2780 (= p!191 p!191) t!3120) tb!579))

(declare-fun result!951 () Bool)

(assert (=> tb!579 (= result!951 true)))

(assert (=> b!16431 t!3120))

(declare-fun b_and!1167 () Bool)

(assert (= b_and!1165 (and (=> t!3120 result!951) b_and!1167)))

(declare-fun m!11525 () Bool)

(assert (=> b!16431 m!11525))

(declare-fun m!11527 () Bool)

(assert (=> b!16432 m!11527))

(assert (=> b!16338 d!3191))

(declare-fun d!3193 () Bool)

(declare-fun res!12218 () Bool)

(declare-fun e!10142 () Bool)

(assert (=> d!3193 (=> res!12218 e!10142)))

(assert (=> d!3193 (= res!12218 (and ((_ is Cons!523) lt!4032) (= (_1!342 (h!1089 lt!4032)) a!507)))))

(assert (=> d!3193 (= (containsKey!17 lt!4032 a!507) e!10142)))

(declare-fun b!16441 () Bool)

(declare-fun e!10143 () Bool)

(assert (=> b!16441 (= e!10142 e!10143)))

(declare-fun res!12219 () Bool)

(assert (=> b!16441 (=> (not res!12219) (not e!10143))))

(assert (=> b!16441 (= res!12219 (and (or (not ((_ is Cons!523) lt!4032)) (bvsle (_1!342 (h!1089 lt!4032)) a!507)) ((_ is Cons!523) lt!4032) (bvslt (_1!342 (h!1089 lt!4032)) a!507)))))

(declare-fun b!16442 () Bool)

(assert (=> b!16442 (= e!10143 (containsKey!17 (t!3065 lt!4032) a!507))))

(assert (= (and d!3193 (not res!12218)) b!16441))

(assert (= (and b!16441 res!12219) b!16442))

(declare-fun m!11529 () Bool)

(assert (=> b!16442 m!11529))

(assert (=> b!16330 d!3193))

(declare-fun d!3195 () Bool)

(declare-fun res!12220 () Bool)

(declare-fun e!10146 () Bool)

(assert (=> d!3195 (=> res!12220 e!10146)))

(assert (=> d!3195 (= res!12220 ((_ is Nil!524) (t!3065 (t!3065 (toList!273 lt!3969)))))))

(assert (=> d!3195 (= (forall!144 (t!3065 (t!3065 (toList!273 lt!3969))) p!191) e!10146)))

(declare-fun b!16447 () Bool)

(declare-fun e!10147 () Bool)

(assert (=> b!16447 (= e!10146 e!10147)))

(declare-fun res!12221 () Bool)

(assert (=> b!16447 (=> (not res!12221) (not e!10147))))

(assert (=> b!16447 (= res!12221 (dynLambda!128 p!191 (h!1089 (t!3065 (t!3065 (toList!273 lt!3969))))))))

(declare-fun b!16448 () Bool)

(assert (=> b!16448 (= e!10147 (forall!144 (t!3065 (t!3065 (t!3065 (toList!273 lt!3969)))) p!191))))

(assert (= (and d!3195 (not res!12220)) b!16447))

(assert (= (and b!16447 res!12221) b!16448))

(declare-fun b_lambda!1343 () Bool)

(assert (=> (not b_lambda!1343) (not b!16447)))

(declare-fun t!3122 () Bool)

(declare-fun tb!581 () Bool)

(assert (=> (and start!2780 (= p!191 p!191) t!3122) tb!581))

(declare-fun result!953 () Bool)

(assert (=> tb!581 (= result!953 true)))

(assert (=> b!16447 t!3122))

(declare-fun b_and!1169 () Bool)

(assert (= b_and!1167 (and (=> t!3122 result!953) b_and!1169)))

(declare-fun m!11533 () Bool)

(assert (=> b!16447 m!11533))

(declare-fun m!11535 () Bool)

(assert (=> b!16448 m!11535))

(assert (=> b!16290 d!3195))

(declare-fun d!3199 () Bool)

(assert (=> d!3199 (= ($colon$colon!24 (removeStrictlySorted!17 (t!3065 (toList!273 lt!3969)) a!507) (h!1089 (toList!273 lt!3969))) (Cons!523 (h!1089 (toList!273 lt!3969)) (removeStrictlySorted!17 (t!3065 (toList!273 lt!3969)) a!507)))))

(assert (=> b!16329 d!3199))

(declare-fun d!3201 () Bool)

(declare-fun e!10150 () Bool)

(assert (=> d!3201 e!10150))

(declare-fun res!12222 () Bool)

(assert (=> d!3201 (=> (not res!12222) (not e!10150))))

(declare-fun lt!4064 () List!527)

(assert (=> d!3201 (= res!12222 (isStrictlySorted!165 lt!4064))))

(declare-fun e!10149 () List!527)

(assert (=> d!3201 (= lt!4064 e!10149)))

(declare-fun c!1574 () Bool)

(assert (=> d!3201 (= c!1574 (and ((_ is Cons!523) (t!3065 (toList!273 lt!3969))) (= (_1!342 (h!1089 (t!3065 (toList!273 lt!3969)))) a!507)))))

(assert (=> d!3201 (isStrictlySorted!165 (t!3065 (toList!273 lt!3969)))))

(assert (=> d!3201 (= (removeStrictlySorted!17 (t!3065 (toList!273 lt!3969)) a!507) lt!4064)))

(declare-fun b!16449 () Bool)

(declare-fun e!10148 () List!527)

(assert (=> b!16449 (= e!10148 ($colon$colon!24 (removeStrictlySorted!17 (t!3065 (t!3065 (toList!273 lt!3969))) a!507) (h!1089 (t!3065 (toList!273 lt!3969)))))))

(declare-fun b!16450 () Bool)

(assert (=> b!16450 (= e!10150 (not (containsKey!17 lt!4064 a!507)))))

(declare-fun b!16451 () Bool)

(assert (=> b!16451 (= e!10149 (t!3065 (t!3065 (toList!273 lt!3969))))))

(declare-fun b!16452 () Bool)

(assert (=> b!16452 (= e!10148 Nil!524)))

(declare-fun b!16453 () Bool)

(assert (=> b!16453 (= e!10149 e!10148)))

(declare-fun c!1573 () Bool)

(assert (=> b!16453 (= c!1573 (and ((_ is Cons!523) (t!3065 (toList!273 lt!3969))) (not (= (_1!342 (h!1089 (t!3065 (toList!273 lt!3969)))) a!507))))))

(assert (= (and d!3201 c!1574) b!16451))

(assert (= (and d!3201 (not c!1574)) b!16453))

(assert (= (and b!16453 c!1573) b!16449))

(assert (= (and b!16453 (not c!1573)) b!16452))

(assert (= (and d!3201 res!12222) b!16450))

(declare-fun m!11537 () Bool)

(assert (=> d!3201 m!11537))

(declare-fun m!11539 () Bool)

(assert (=> d!3201 m!11539))

(declare-fun m!11541 () Bool)

(assert (=> b!16449 m!11541))

(assert (=> b!16449 m!11541))

(declare-fun m!11543 () Bool)

(assert (=> b!16449 m!11543))

(declare-fun m!11545 () Bool)

(assert (=> b!16450 m!11545))

(assert (=> b!16329 d!3201))

(assert (=> b!16323 d!3169))

(assert (=> b!16323 d!3171))

(declare-fun d!3203 () Bool)

(declare-fun res!12223 () Bool)

(declare-fun e!10151 () Bool)

(assert (=> d!3203 (=> res!12223 e!10151)))

(assert (=> d!3203 (= res!12223 (or ((_ is Nil!524) lt!4020) ((_ is Nil!524) (t!3065 lt!4020))))))

(assert (=> d!3203 (= (isStrictlySorted!165 lt!4020) e!10151)))

(declare-fun b!16454 () Bool)

(declare-fun e!10152 () Bool)

(assert (=> b!16454 (= e!10151 e!10152)))

(declare-fun res!12224 () Bool)

(assert (=> b!16454 (=> (not res!12224) (not e!10152))))

(assert (=> b!16454 (= res!12224 (bvslt (_1!342 (h!1089 lt!4020)) (_1!342 (h!1089 (t!3065 lt!4020)))))))

(declare-fun b!16455 () Bool)

(assert (=> b!16455 (= e!10152 (isStrictlySorted!165 (t!3065 lt!4020)))))

(assert (= (and d!3203 (not res!12223)) b!16454))

(assert (= (and b!16454 res!12224) b!16455))

(declare-fun m!11547 () Bool)

(assert (=> b!16455 m!11547))

(assert (=> d!3101 d!3203))

(assert (=> d!3101 d!3113))

(declare-fun d!3205 () Bool)

(declare-fun res!12229 () Bool)

(declare-fun e!10157 () Bool)

(assert (=> d!3205 (=> res!12229 e!10157)))

(assert (=> d!3205 (= res!12229 (or ((_ is Nil!524) (t!3065 (toList!273 lm!221))) ((_ is Nil!524) (t!3065 (t!3065 (toList!273 lm!221))))))))

(assert (=> d!3205 (= (isStrictlySorted!165 (t!3065 (toList!273 lm!221))) e!10157)))

(declare-fun b!16460 () Bool)

(declare-fun e!10158 () Bool)

(assert (=> b!16460 (= e!10157 e!10158)))

(declare-fun res!12230 () Bool)

(assert (=> b!16460 (=> (not res!12230) (not e!10158))))

(assert (=> b!16460 (= res!12230 (bvslt (_1!342 (h!1089 (t!3065 (toList!273 lm!221)))) (_1!342 (h!1089 (t!3065 (t!3065 (toList!273 lm!221)))))))))

(declare-fun b!16461 () Bool)

(assert (=> b!16461 (= e!10158 (isStrictlySorted!165 (t!3065 (t!3065 (toList!273 lm!221)))))))

(assert (= (and d!3205 (not res!12229)) b!16460))

(assert (= (and b!16460 res!12230) b!16461))

(declare-fun m!11549 () Bool)

(assert (=> b!16461 m!11549))

(assert (=> b!16316 d!3205))

(declare-fun d!3207 () Bool)

(declare-fun res!12231 () Bool)

(declare-fun e!10159 () Bool)

(assert (=> d!3207 (=> res!12231 e!10159)))

(assert (=> d!3207 (= res!12231 ((_ is Nil!524) (t!3065 (t!3065 (toList!273 (-!31 lt!3969 a!507))))))))

(assert (=> d!3207 (= (forall!144 (t!3065 (t!3065 (toList!273 (-!31 lt!3969 a!507)))) p!191) e!10159)))

(declare-fun b!16462 () Bool)

(declare-fun e!10160 () Bool)

(assert (=> b!16462 (= e!10159 e!10160)))

(declare-fun res!12232 () Bool)

(assert (=> b!16462 (=> (not res!12232) (not e!10160))))

(assert (=> b!16462 (= res!12232 (dynLambda!128 p!191 (h!1089 (t!3065 (t!3065 (toList!273 (-!31 lt!3969 a!507)))))))))

(declare-fun b!16463 () Bool)

(assert (=> b!16463 (= e!10160 (forall!144 (t!3065 (t!3065 (t!3065 (toList!273 (-!31 lt!3969 a!507))))) p!191))))

(assert (= (and d!3207 (not res!12231)) b!16462))

(assert (= (and b!16462 res!12232) b!16463))

(declare-fun b_lambda!1345 () Bool)

(assert (=> (not b_lambda!1345) (not b!16462)))

(declare-fun t!3124 () Bool)

(declare-fun tb!583 () Bool)

(assert (=> (and start!2780 (= p!191 p!191) t!3124) tb!583))

(declare-fun result!955 () Bool)

(assert (=> tb!583 (= result!955 true)))

(assert (=> b!16462 t!3124))

(declare-fun b_and!1171 () Bool)

(assert (= b_and!1169 (and (=> t!3124 result!955) b_and!1171)))

(declare-fun m!11551 () Bool)

(assert (=> b!16462 m!11551))

(declare-fun m!11553 () Bool)

(assert (=> b!16463 m!11553))

(assert (=> b!16292 d!3207))

(declare-fun d!3209 () Bool)

(declare-fun res!12235 () Bool)

(declare-fun e!10163 () Bool)

(assert (=> d!3209 (=> res!12235 e!10163)))

(assert (=> d!3209 (= res!12235 (or ((_ is Nil!524) lt!4032) ((_ is Nil!524) (t!3065 lt!4032))))))

(assert (=> d!3209 (= (isStrictlySorted!165 lt!4032) e!10163)))

(declare-fun b!16466 () Bool)

(declare-fun e!10164 () Bool)

(assert (=> b!16466 (= e!10163 e!10164)))

(declare-fun res!12236 () Bool)

(assert (=> b!16466 (=> (not res!12236) (not e!10164))))

(assert (=> b!16466 (= res!12236 (bvslt (_1!342 (h!1089 lt!4032)) (_1!342 (h!1089 (t!3065 lt!4032)))))))

(declare-fun b!16467 () Bool)

(assert (=> b!16467 (= e!10164 (isStrictlySorted!165 (t!3065 lt!4032)))))

(assert (= (and d!3209 (not res!12235)) b!16466))

(assert (= (and b!16466 res!12236) b!16467))

(declare-fun m!11557 () Bool)

(assert (=> b!16467 m!11557))

(assert (=> d!3125 d!3209))

(declare-fun d!3213 () Bool)

(declare-fun res!12237 () Bool)

(declare-fun e!10165 () Bool)

(assert (=> d!3213 (=> res!12237 e!10165)))

(assert (=> d!3213 (= res!12237 (or ((_ is Nil!524) (toList!273 lt!3969)) ((_ is Nil!524) (t!3065 (toList!273 lt!3969)))))))

(assert (=> d!3213 (= (isStrictlySorted!165 (toList!273 lt!3969)) e!10165)))

(declare-fun b!16468 () Bool)

(declare-fun e!10166 () Bool)

(assert (=> b!16468 (= e!10165 e!10166)))

(declare-fun res!12238 () Bool)

(assert (=> b!16468 (=> (not res!12238) (not e!10166))))

(assert (=> b!16468 (= res!12238 (bvslt (_1!342 (h!1089 (toList!273 lt!3969))) (_1!342 (h!1089 (t!3065 (toList!273 lt!3969))))))))

(declare-fun b!16469 () Bool)

(assert (=> b!16469 (= e!10166 (isStrictlySorted!165 (t!3065 (toList!273 lt!3969))))))

(assert (= (and d!3213 (not res!12237)) b!16468))

(assert (= (and b!16468 res!12238) b!16469))

(assert (=> b!16469 m!11539))

(assert (=> d!3125 d!3213))

(declare-fun b!16470 () Bool)

(declare-fun e!10167 () Bool)

(declare-fun tp!2880 () Bool)

(assert (=> b!16470 (= e!10167 (and tp_is_empty!833 tp!2880))))

(assert (=> b!16350 (= tp!2877 e!10167)))

(assert (= (and b!16350 ((_ is Cons!523) (t!3065 (t!3065 (toList!273 lm!221))))) b!16470))

(declare-fun b_lambda!1347 () Bool)

(assert (= b_lambda!1341 (or (and start!2780 b_free!567) b_lambda!1347)))

(declare-fun b_lambda!1349 () Bool)

(assert (= b_lambda!1345 (or (and start!2780 b_free!567) b_lambda!1349)))

(declare-fun b_lambda!1351 () Bool)

(assert (= b_lambda!1339 (or (and start!2780 b_free!567) b_lambda!1351)))

(declare-fun b_lambda!1353 () Bool)

(assert (= b_lambda!1343 (or (and start!2780 b_free!567) b_lambda!1353)))

(check-sat (not b!16394) b_and!1171 (not b!16423) (not b!16448) (not b!16450) (not b_lambda!1313) (not d!3167) (not b_lambda!1287) (not b_lambda!1353) (not b!16420) (not b!16426) (not b!16442) (not b_lambda!1311) (not b!16430) (not b!16467) (not b_lambda!1349) (not b_lambda!1285) (not b!16461) (not b!16432) (not b!16397) (not b_lambda!1315) (not b!16429) (not d!3169) (not d!3189) (not d!3201) (not b!16396) (not b!16455) (not b_lambda!1347) (not b_next!567) (not b_lambda!1289) (not b!16449) (not b_lambda!1283) (not b_lambda!1317) (not b!16404) (not b_lambda!1351) (not d!3165) tp_is_empty!833 (not b!16463) (not b!16398) (not d!3181) (not b!16469) (not b!16470))
(check-sat b_and!1171 (not b_next!567))
