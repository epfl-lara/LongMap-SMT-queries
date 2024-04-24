; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2778 () Bool)

(assert start!2778)

(declare-fun b_free!565 () Bool)

(declare-fun b_next!565 () Bool)

(assert (=> start!2778 (= b_free!565 (not b_next!565))))

(declare-fun tp!2854 () Bool)

(declare-fun b_and!1113 () Bool)

(assert (=> start!2778 (= tp!2854 b_and!1113)))

(declare-fun p!191 () Int)

(declare-datatypes ((B!686 0))(
  ( (B!687 (val!441 Int)) )
))
(declare-datatypes ((tuple2!678 0))(
  ( (tuple2!679 (_1!339 (_ BitVec 64)) (_2!339 B!686)) )
))
(declare-datatypes ((List!522 0))(
  ( (Nil!519) (Cons!518 (h!1084 tuple2!678) (t!3062 List!522)) )
))
(declare-datatypes ((ListLongMap!509 0))(
  ( (ListLongMap!510 (toList!270 List!522)) )
))
(declare-fun lm!221 () ListLongMap!509)

(declare-fun a!507 () (_ BitVec 64))

(declare-fun e!9937 () Bool)

(declare-fun b!16171 () Bool)

(declare-fun forall!143 (List!522 Int) Bool)

(declare-fun -!29 (ListLongMap!509 (_ BitVec 64)) ListLongMap!509)

(assert (=> b!16171 (= e!9937 (not (forall!143 (toList!270 (-!29 lm!221 a!507)) p!191)))))

(declare-fun lt!3966 () ListLongMap!509)

(assert (=> b!16171 (forall!143 (toList!270 (-!29 lt!3966 a!507)) p!191)))

(declare-datatypes ((Unit!328 0))(
  ( (Unit!329) )
))
(declare-fun lt!3965 () Unit!328)

(declare-fun removeValidProp!20 (ListLongMap!509 Int (_ BitVec 64)) Unit!328)

(assert (=> b!16171 (= lt!3965 (removeValidProp!20 lt!3966 p!191 a!507))))

(declare-fun b!16172 () Bool)

(declare-fun e!9936 () Bool)

(declare-fun tp!2855 () Bool)

(assert (=> b!16172 (= e!9936 tp!2855)))

(declare-fun res!12076 () Bool)

(declare-fun e!9935 () Bool)

(assert (=> start!2778 (=> (not res!12076) (not e!9935))))

(assert (=> start!2778 (= res!12076 (forall!143 (toList!270 lm!221) p!191))))

(assert (=> start!2778 e!9935))

(declare-fun inv!888 (ListLongMap!509) Bool)

(assert (=> start!2778 (and (inv!888 lm!221) e!9936)))

(assert (=> start!2778 tp!2854))

(assert (=> start!2778 true))

(declare-fun b!16170 () Bool)

(assert (=> b!16170 (= e!9935 e!9937)))

(declare-fun res!12077 () Bool)

(assert (=> b!16170 (=> (not res!12077) (not e!9937))))

(assert (=> b!16170 (= res!12077 (forall!143 (toList!270 lt!3966) p!191))))

(declare-fun tail!80 (ListLongMap!509) ListLongMap!509)

(assert (=> b!16170 (= lt!3966 (tail!80 lm!221))))

(declare-fun b!16169 () Bool)

(declare-fun res!12075 () Bool)

(assert (=> b!16169 (=> (not res!12075) (not e!9935))))

(declare-fun isEmpty!156 (ListLongMap!509) Bool)

(assert (=> b!16169 (= res!12075 (not (isEmpty!156 lm!221)))))

(assert (= (and start!2778 res!12076) b!16169))

(assert (= (and b!16169 res!12075) b!16170))

(assert (= (and b!16170 res!12077) b!16171))

(assert (= start!2778 b!16172))

(declare-fun m!11169 () Bool)

(assert (=> b!16171 m!11169))

(declare-fun m!11171 () Bool)

(assert (=> b!16171 m!11171))

(declare-fun m!11173 () Bool)

(assert (=> b!16171 m!11173))

(declare-fun m!11175 () Bool)

(assert (=> b!16171 m!11175))

(declare-fun m!11177 () Bool)

(assert (=> b!16171 m!11177))

(declare-fun m!11179 () Bool)

(assert (=> start!2778 m!11179))

(declare-fun m!11181 () Bool)

(assert (=> start!2778 m!11181))

(declare-fun m!11183 () Bool)

(assert (=> b!16170 m!11183))

(declare-fun m!11185 () Bool)

(assert (=> b!16170 m!11185))

(declare-fun m!11187 () Bool)

(assert (=> b!16169 m!11187))

(check-sat (not b!16171) (not start!2778) b_and!1113 (not b!16172) (not b!16169) (not b!16170) (not b_next!565))
(check-sat b_and!1113 (not b_next!565))
(get-model)

(declare-fun d!3029 () Bool)

(declare-fun res!12100 () Bool)

(declare-fun e!9960 () Bool)

(assert (=> d!3029 (=> res!12100 e!9960)))

(get-info :version)

(assert (=> d!3029 (= res!12100 ((_ is Nil!519) (toList!270 lt!3966)))))

(assert (=> d!3029 (= (forall!143 (toList!270 lt!3966) p!191) e!9960)))

(declare-fun b!16201 () Bool)

(declare-fun e!9961 () Bool)

(assert (=> b!16201 (= e!9960 e!9961)))

(declare-fun res!12101 () Bool)

(assert (=> b!16201 (=> (not res!12101) (not e!9961))))

(declare-fun dynLambda!122 (Int tuple2!678) Bool)

(assert (=> b!16201 (= res!12101 (dynLambda!122 p!191 (h!1084 (toList!270 lt!3966))))))

(declare-fun b!16202 () Bool)

(assert (=> b!16202 (= e!9961 (forall!143 (t!3062 (toList!270 lt!3966)) p!191))))

(assert (= (and d!3029 (not res!12100)) b!16201))

(assert (= (and b!16201 res!12101) b!16202))

(declare-fun b_lambda!1247 () Bool)

(assert (=> (not b_lambda!1247) (not b!16201)))

(declare-fun t!3066 () Bool)

(declare-fun tb!531 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3066) tb!531))

(declare-fun result!897 () Bool)

(assert (=> tb!531 (= result!897 true)))

(assert (=> b!16201 t!3066))

(declare-fun b_and!1119 () Bool)

(assert (= b_and!1113 (and (=> t!3066 result!897) b_and!1119)))

(declare-fun m!11229 () Bool)

(assert (=> b!16201 m!11229))

(declare-fun m!11231 () Bool)

(assert (=> b!16202 m!11231))

(assert (=> b!16170 d!3029))

(declare-fun d!3035 () Bool)

(declare-fun tail!83 (List!522) List!522)

(assert (=> d!3035 (= (tail!80 lm!221) (ListLongMap!510 (tail!83 (toList!270 lm!221))))))

(declare-fun bs!759 () Bool)

(assert (= bs!759 d!3035))

(declare-fun m!11233 () Bool)

(assert (=> bs!759 m!11233))

(assert (=> b!16170 d!3035))

(declare-fun d!3037 () Bool)

(declare-fun isEmpty!159 (List!522) Bool)

(assert (=> d!3037 (= (isEmpty!156 lm!221) (isEmpty!159 (toList!270 lm!221)))))

(declare-fun bs!760 () Bool)

(assert (= bs!760 d!3037))

(declare-fun m!11235 () Bool)

(assert (=> bs!760 m!11235))

(assert (=> b!16169 d!3037))

(declare-fun d!3039 () Bool)

(declare-fun res!12108 () Bool)

(declare-fun e!9968 () Bool)

(assert (=> d!3039 (=> res!12108 e!9968)))

(assert (=> d!3039 (= res!12108 ((_ is Nil!519) (toList!270 lm!221)))))

(assert (=> d!3039 (= (forall!143 (toList!270 lm!221) p!191) e!9968)))

(declare-fun b!16209 () Bool)

(declare-fun e!9969 () Bool)

(assert (=> b!16209 (= e!9968 e!9969)))

(declare-fun res!12109 () Bool)

(assert (=> b!16209 (=> (not res!12109) (not e!9969))))

(assert (=> b!16209 (= res!12109 (dynLambda!122 p!191 (h!1084 (toList!270 lm!221))))))

(declare-fun b!16210 () Bool)

(assert (=> b!16210 (= e!9969 (forall!143 (t!3062 (toList!270 lm!221)) p!191))))

(assert (= (and d!3039 (not res!12108)) b!16209))

(assert (= (and b!16209 res!12109) b!16210))

(declare-fun b_lambda!1251 () Bool)

(assert (=> (not b_lambda!1251) (not b!16209)))

(declare-fun t!3070 () Bool)

(declare-fun tb!535 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3070) tb!535))

(declare-fun result!901 () Bool)

(assert (=> tb!535 (= result!901 true)))

(assert (=> b!16209 t!3070))

(declare-fun b_and!1123 () Bool)

(assert (= b_and!1119 (and (=> t!3070 result!901) b_and!1123)))

(declare-fun m!11241 () Bool)

(assert (=> b!16209 m!11241))

(declare-fun m!11243 () Bool)

(assert (=> b!16210 m!11243))

(assert (=> start!2778 d!3039))

(declare-fun d!3043 () Bool)

(declare-fun isStrictlySorted!152 (List!522) Bool)

(assert (=> d!3043 (= (inv!888 lm!221) (isStrictlySorted!152 (toList!270 lm!221)))))

(declare-fun bs!762 () Bool)

(assert (= bs!762 d!3043))

(declare-fun m!11247 () Bool)

(assert (=> bs!762 m!11247))

(assert (=> start!2778 d!3043))

(declare-fun d!3047 () Bool)

(declare-fun lt!3990 () ListLongMap!509)

(declare-fun contains!202 (ListLongMap!509 (_ BitVec 64)) Bool)

(assert (=> d!3047 (not (contains!202 lt!3990 a!507))))

(declare-fun removeStrictlySorted!16 (List!522 (_ BitVec 64)) List!522)

(assert (=> d!3047 (= lt!3990 (ListLongMap!510 (removeStrictlySorted!16 (toList!270 lm!221) a!507)))))

(assert (=> d!3047 (= (-!29 lm!221 a!507) lt!3990)))

(declare-fun bs!766 () Bool)

(assert (= bs!766 d!3047))

(declare-fun m!11257 () Bool)

(assert (=> bs!766 m!11257))

(declare-fun m!11259 () Bool)

(assert (=> bs!766 m!11259))

(assert (=> b!16171 d!3047))

(declare-fun d!3053 () Bool)

(declare-fun res!12112 () Bool)

(declare-fun e!9972 () Bool)

(assert (=> d!3053 (=> res!12112 e!9972)))

(assert (=> d!3053 (= res!12112 ((_ is Nil!519) (toList!270 (-!29 lm!221 a!507))))))

(assert (=> d!3053 (= (forall!143 (toList!270 (-!29 lm!221 a!507)) p!191) e!9972)))

(declare-fun b!16213 () Bool)

(declare-fun e!9973 () Bool)

(assert (=> b!16213 (= e!9972 e!9973)))

(declare-fun res!12113 () Bool)

(assert (=> b!16213 (=> (not res!12113) (not e!9973))))

(assert (=> b!16213 (= res!12113 (dynLambda!122 p!191 (h!1084 (toList!270 (-!29 lm!221 a!507)))))))

(declare-fun b!16214 () Bool)

(assert (=> b!16214 (= e!9973 (forall!143 (t!3062 (toList!270 (-!29 lm!221 a!507))) p!191))))

(assert (= (and d!3053 (not res!12112)) b!16213))

(assert (= (and b!16213 res!12113) b!16214))

(declare-fun b_lambda!1255 () Bool)

(assert (=> (not b_lambda!1255) (not b!16213)))

(declare-fun t!3074 () Bool)

(declare-fun tb!539 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3074) tb!539))

(declare-fun result!905 () Bool)

(assert (=> tb!539 (= result!905 true)))

(assert (=> b!16213 t!3074))

(declare-fun b_and!1127 () Bool)

(assert (= b_and!1123 (and (=> t!3074 result!905) b_and!1127)))

(declare-fun m!11267 () Bool)

(assert (=> b!16213 m!11267))

(declare-fun m!11269 () Bool)

(assert (=> b!16214 m!11269))

(assert (=> b!16171 d!3053))

(declare-fun d!3059 () Bool)

(declare-fun lt!3991 () ListLongMap!509)

(assert (=> d!3059 (not (contains!202 lt!3991 a!507))))

(assert (=> d!3059 (= lt!3991 (ListLongMap!510 (removeStrictlySorted!16 (toList!270 lt!3966) a!507)))))

(assert (=> d!3059 (= (-!29 lt!3966 a!507) lt!3991)))

(declare-fun bs!767 () Bool)

(assert (= bs!767 d!3059))

(declare-fun m!11271 () Bool)

(assert (=> bs!767 m!11271))

(declare-fun m!11273 () Bool)

(assert (=> bs!767 m!11273))

(assert (=> b!16171 d!3059))

(declare-fun d!3061 () Bool)

(declare-fun res!12120 () Bool)

(declare-fun e!9980 () Bool)

(assert (=> d!3061 (=> res!12120 e!9980)))

(assert (=> d!3061 (= res!12120 ((_ is Nil!519) (toList!270 (-!29 lt!3966 a!507))))))

(assert (=> d!3061 (= (forall!143 (toList!270 (-!29 lt!3966 a!507)) p!191) e!9980)))

(declare-fun b!16221 () Bool)

(declare-fun e!9981 () Bool)

(assert (=> b!16221 (= e!9980 e!9981)))

(declare-fun res!12121 () Bool)

(assert (=> b!16221 (=> (not res!12121) (not e!9981))))

(assert (=> b!16221 (= res!12121 (dynLambda!122 p!191 (h!1084 (toList!270 (-!29 lt!3966 a!507)))))))

(declare-fun b!16222 () Bool)

(assert (=> b!16222 (= e!9981 (forall!143 (t!3062 (toList!270 (-!29 lt!3966 a!507))) p!191))))

(assert (= (and d!3061 (not res!12120)) b!16221))

(assert (= (and b!16221 res!12121) b!16222))

(declare-fun b_lambda!1259 () Bool)

(assert (=> (not b_lambda!1259) (not b!16221)))

(declare-fun t!3078 () Bool)

(declare-fun tb!543 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3078) tb!543))

(declare-fun result!909 () Bool)

(assert (=> tb!543 (= result!909 true)))

(assert (=> b!16221 t!3078))

(declare-fun b_and!1131 () Bool)

(assert (= b_and!1127 (and (=> t!3078 result!909) b_and!1131)))

(declare-fun m!11283 () Bool)

(assert (=> b!16221 m!11283))

(declare-fun m!11285 () Bool)

(assert (=> b!16222 m!11285))

(assert (=> b!16171 d!3061))

(declare-fun d!3067 () Bool)

(assert (=> d!3067 (forall!143 (toList!270 (-!29 lt!3966 a!507)) p!191)))

(declare-fun lt!3999 () Unit!328)

(declare-fun choose!183 (ListLongMap!509 Int (_ BitVec 64)) Unit!328)

(assert (=> d!3067 (= lt!3999 (choose!183 lt!3966 p!191 a!507))))

(assert (=> d!3067 (forall!143 (toList!270 lt!3966) p!191)))

(assert (=> d!3067 (= (removeValidProp!20 lt!3966 p!191 a!507) lt!3999)))

(declare-fun bs!772 () Bool)

(assert (= bs!772 d!3067))

(assert (=> bs!772 m!11173))

(assert (=> bs!772 m!11175))

(declare-fun m!11307 () Bool)

(assert (=> bs!772 m!11307))

(assert (=> bs!772 m!11183))

(assert (=> b!16171 d!3067))

(declare-fun b!16237 () Bool)

(declare-fun e!9994 () Bool)

(declare-fun tp_is_empty!829 () Bool)

(declare-fun tp!2870 () Bool)

(assert (=> b!16237 (= e!9994 (and tp_is_empty!829 tp!2870))))

(assert (=> b!16172 (= tp!2855 e!9994)))

(assert (= (and b!16172 ((_ is Cons!518) (toList!270 lm!221))) b!16237))

(declare-fun b_lambda!1271 () Bool)

(assert (= b_lambda!1255 (or (and start!2778 b_free!565) b_lambda!1271)))

(declare-fun b_lambda!1273 () Bool)

(assert (= b_lambda!1251 (or (and start!2778 b_free!565) b_lambda!1273)))

(declare-fun b_lambda!1275 () Bool)

(assert (= b_lambda!1247 (or (and start!2778 b_free!565) b_lambda!1275)))

(declare-fun b_lambda!1277 () Bool)

(assert (= b_lambda!1259 (or (and start!2778 b_free!565) b_lambda!1277)))

(check-sat (not b!16237) (not b!16222) (not b_lambda!1277) (not d!3067) tp_is_empty!829 (not b_next!565) (not b_lambda!1275) b_and!1131 (not b_lambda!1273) (not d!3047) (not b!16202) (not d!3037) (not d!3035) (not d!3043) (not b!16210) (not d!3059) (not b_lambda!1271) (not b!16214))
(check-sat b_and!1131 (not b_next!565))
(get-model)

(declare-fun d!3089 () Bool)

(declare-fun res!12132 () Bool)

(declare-fun e!10001 () Bool)

(assert (=> d!3089 (=> res!12132 e!10001)))

(assert (=> d!3089 (= res!12132 ((_ is Nil!519) (t!3062 (toList!270 lm!221))))))

(assert (=> d!3089 (= (forall!143 (t!3062 (toList!270 lm!221)) p!191) e!10001)))

(declare-fun b!16248 () Bool)

(declare-fun e!10002 () Bool)

(assert (=> b!16248 (= e!10001 e!10002)))

(declare-fun res!12133 () Bool)

(assert (=> b!16248 (=> (not res!12133) (not e!10002))))

(assert (=> b!16248 (= res!12133 (dynLambda!122 p!191 (h!1084 (t!3062 (toList!270 lm!221)))))))

(declare-fun b!16249 () Bool)

(assert (=> b!16249 (= e!10002 (forall!143 (t!3062 (t!3062 (toList!270 lm!221))) p!191))))

(assert (= (and d!3089 (not res!12132)) b!16248))

(assert (= (and b!16248 res!12133) b!16249))

(declare-fun b_lambda!1295 () Bool)

(assert (=> (not b_lambda!1295) (not b!16248)))

(declare-fun t!3090 () Bool)

(declare-fun tb!555 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3090) tb!555))

(declare-fun result!927 () Bool)

(assert (=> tb!555 (= result!927 true)))

(assert (=> b!16248 t!3090))

(declare-fun b_and!1143 () Bool)

(assert (= b_and!1131 (and (=> t!3090 result!927) b_and!1143)))

(declare-fun m!11325 () Bool)

(assert (=> b!16248 m!11325))

(declare-fun m!11327 () Bool)

(assert (=> b!16249 m!11327))

(assert (=> b!16210 d!3089))

(declare-fun d!3091 () Bool)

(declare-fun res!12134 () Bool)

(declare-fun e!10003 () Bool)

(assert (=> d!3091 (=> res!12134 e!10003)))

(assert (=> d!3091 (= res!12134 ((_ is Nil!519) (t!3062 (toList!270 (-!29 lm!221 a!507)))))))

(assert (=> d!3091 (= (forall!143 (t!3062 (toList!270 (-!29 lm!221 a!507))) p!191) e!10003)))

(declare-fun b!16250 () Bool)

(declare-fun e!10004 () Bool)

(assert (=> b!16250 (= e!10003 e!10004)))

(declare-fun res!12135 () Bool)

(assert (=> b!16250 (=> (not res!12135) (not e!10004))))

(assert (=> b!16250 (= res!12135 (dynLambda!122 p!191 (h!1084 (t!3062 (toList!270 (-!29 lm!221 a!507))))))))

(declare-fun b!16251 () Bool)

(assert (=> b!16251 (= e!10004 (forall!143 (t!3062 (t!3062 (toList!270 (-!29 lm!221 a!507)))) p!191))))

(assert (= (and d!3091 (not res!12134)) b!16250))

(assert (= (and b!16250 res!12135) b!16251))

(declare-fun b_lambda!1297 () Bool)

(assert (=> (not b_lambda!1297) (not b!16250)))

(declare-fun t!3092 () Bool)

(declare-fun tb!557 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3092) tb!557))

(declare-fun result!929 () Bool)

(assert (=> tb!557 (= result!929 true)))

(assert (=> b!16250 t!3092))

(declare-fun b_and!1145 () Bool)

(assert (= b_and!1143 (and (=> t!3092 result!929) b_and!1145)))

(declare-fun m!11329 () Bool)

(assert (=> b!16250 m!11329))

(declare-fun m!11331 () Bool)

(assert (=> b!16251 m!11331))

(assert (=> b!16214 d!3091))

(declare-fun d!3093 () Bool)

(declare-fun res!12136 () Bool)

(declare-fun e!10005 () Bool)

(assert (=> d!3093 (=> res!12136 e!10005)))

(assert (=> d!3093 (= res!12136 ((_ is Nil!519) (t!3062 (toList!270 (-!29 lt!3966 a!507)))))))

(assert (=> d!3093 (= (forall!143 (t!3062 (toList!270 (-!29 lt!3966 a!507))) p!191) e!10005)))

(declare-fun b!16252 () Bool)

(declare-fun e!10006 () Bool)

(assert (=> b!16252 (= e!10005 e!10006)))

(declare-fun res!12137 () Bool)

(assert (=> b!16252 (=> (not res!12137) (not e!10006))))

(assert (=> b!16252 (= res!12137 (dynLambda!122 p!191 (h!1084 (t!3062 (toList!270 (-!29 lt!3966 a!507))))))))

(declare-fun b!16253 () Bool)

(assert (=> b!16253 (= e!10006 (forall!143 (t!3062 (t!3062 (toList!270 (-!29 lt!3966 a!507)))) p!191))))

(assert (= (and d!3093 (not res!12136)) b!16252))

(assert (= (and b!16252 res!12137) b!16253))

(declare-fun b_lambda!1299 () Bool)

(assert (=> (not b_lambda!1299) (not b!16252)))

(declare-fun t!3094 () Bool)

(declare-fun tb!559 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3094) tb!559))

(declare-fun result!931 () Bool)

(assert (=> tb!559 (= result!931 true)))

(assert (=> b!16252 t!3094))

(declare-fun b_and!1147 () Bool)

(assert (= b_and!1145 (and (=> t!3094 result!931) b_and!1147)))

(declare-fun m!11333 () Bool)

(assert (=> b!16252 m!11333))

(declare-fun m!11335 () Bool)

(assert (=> b!16253 m!11335))

(assert (=> b!16222 d!3093))

(declare-fun d!3095 () Bool)

(declare-fun res!12138 () Bool)

(declare-fun e!10007 () Bool)

(assert (=> d!3095 (=> res!12138 e!10007)))

(assert (=> d!3095 (= res!12138 ((_ is Nil!519) (t!3062 (toList!270 lt!3966))))))

(assert (=> d!3095 (= (forall!143 (t!3062 (toList!270 lt!3966)) p!191) e!10007)))

(declare-fun b!16254 () Bool)

(declare-fun e!10008 () Bool)

(assert (=> b!16254 (= e!10007 e!10008)))

(declare-fun res!12139 () Bool)

(assert (=> b!16254 (=> (not res!12139) (not e!10008))))

(assert (=> b!16254 (= res!12139 (dynLambda!122 p!191 (h!1084 (t!3062 (toList!270 lt!3966)))))))

(declare-fun b!16255 () Bool)

(assert (=> b!16255 (= e!10008 (forall!143 (t!3062 (t!3062 (toList!270 lt!3966))) p!191))))

(assert (= (and d!3095 (not res!12138)) b!16254))

(assert (= (and b!16254 res!12139) b!16255))

(declare-fun b_lambda!1301 () Bool)

(assert (=> (not b_lambda!1301) (not b!16254)))

(declare-fun t!3096 () Bool)

(declare-fun tb!561 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3096) tb!561))

(declare-fun result!933 () Bool)

(assert (=> tb!561 (= result!933 true)))

(assert (=> b!16254 t!3096))

(declare-fun b_and!1149 () Bool)

(assert (= b_and!1147 (and (=> t!3096 result!933) b_and!1149)))

(declare-fun m!11337 () Bool)

(assert (=> b!16254 m!11337))

(declare-fun m!11339 () Bool)

(assert (=> b!16255 m!11339))

(assert (=> b!16202 d!3095))

(declare-fun d!3097 () Bool)

(declare-fun res!12144 () Bool)

(declare-fun e!10013 () Bool)

(assert (=> d!3097 (=> res!12144 e!10013)))

(assert (=> d!3097 (= res!12144 (or ((_ is Nil!519) (toList!270 lm!221)) ((_ is Nil!519) (t!3062 (toList!270 lm!221)))))))

(assert (=> d!3097 (= (isStrictlySorted!152 (toList!270 lm!221)) e!10013)))

(declare-fun b!16260 () Bool)

(declare-fun e!10014 () Bool)

(assert (=> b!16260 (= e!10013 e!10014)))

(declare-fun res!12145 () Bool)

(assert (=> b!16260 (=> (not res!12145) (not e!10014))))

(assert (=> b!16260 (= res!12145 (bvslt (_1!339 (h!1084 (toList!270 lm!221))) (_1!339 (h!1084 (t!3062 (toList!270 lm!221))))))))

(declare-fun b!16261 () Bool)

(assert (=> b!16261 (= e!10014 (isStrictlySorted!152 (t!3062 (toList!270 lm!221))))))

(assert (= (and d!3097 (not res!12144)) b!16260))

(assert (= (and b!16260 res!12145) b!16261))

(declare-fun m!11341 () Bool)

(assert (=> b!16261 m!11341))

(assert (=> d!3043 d!3097))

(declare-fun d!3099 () Bool)

(declare-fun e!10023 () Bool)

(assert (=> d!3099 e!10023))

(declare-fun res!12152 () Bool)

(assert (=> d!3099 (=> res!12152 e!10023)))

(declare-fun lt!4011 () Bool)

(assert (=> d!3099 (= res!12152 (not lt!4011))))

(declare-fun lt!4009 () Bool)

(assert (=> d!3099 (= lt!4011 lt!4009)))

(declare-fun lt!4008 () Unit!328)

(declare-fun e!10024 () Unit!328)

(assert (=> d!3099 (= lt!4008 e!10024)))

(declare-fun c!1521 () Bool)

(assert (=> d!3099 (= c!1521 lt!4009)))

(declare-fun containsKey!17 (List!522 (_ BitVec 64)) Bool)

(assert (=> d!3099 (= lt!4009 (containsKey!17 (toList!270 lt!3991) a!507))))

(assert (=> d!3099 (= (contains!202 lt!3991 a!507) lt!4011)))

(declare-fun b!16272 () Bool)

(declare-fun lt!4010 () Unit!328)

(assert (=> b!16272 (= e!10024 lt!4010)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!14 (List!522 (_ BitVec 64)) Unit!328)

(assert (=> b!16272 (= lt!4010 (lemmaContainsKeyImpliesGetValueByKeyDefined!14 (toList!270 lt!3991) a!507))))

(declare-datatypes ((Option!59 0))(
  ( (Some!58 (v!1388 B!686)) (None!57) )
))
(declare-fun isDefined!15 (Option!59) Bool)

(declare-fun getValueByKey!53 (List!522 (_ BitVec 64)) Option!59)

(assert (=> b!16272 (isDefined!15 (getValueByKey!53 (toList!270 lt!3991) a!507))))

(declare-fun b!16273 () Bool)

(declare-fun Unit!334 () Unit!328)

(assert (=> b!16273 (= e!10024 Unit!334)))

(declare-fun b!16274 () Bool)

(assert (=> b!16274 (= e!10023 (isDefined!15 (getValueByKey!53 (toList!270 lt!3991) a!507)))))

(assert (= (and d!3099 c!1521) b!16272))

(assert (= (and d!3099 (not c!1521)) b!16273))

(assert (= (and d!3099 (not res!12152)) b!16274))

(declare-fun m!11351 () Bool)

(assert (=> d!3099 m!11351))

(declare-fun m!11353 () Bool)

(assert (=> b!16272 m!11353))

(declare-fun m!11355 () Bool)

(assert (=> b!16272 m!11355))

(assert (=> b!16272 m!11355))

(declare-fun m!11357 () Bool)

(assert (=> b!16272 m!11357))

(assert (=> b!16274 m!11355))

(assert (=> b!16274 m!11355))

(assert (=> b!16274 m!11357))

(assert (=> d!3059 d!3099))

(declare-fun b!16296 () Bool)

(declare-fun e!10041 () List!522)

(declare-fun e!10040 () List!522)

(assert (=> b!16296 (= e!10041 e!10040)))

(declare-fun c!1529 () Bool)

(assert (=> b!16296 (= c!1529 (and ((_ is Cons!518) (toList!270 lt!3966)) (not (= (_1!339 (h!1084 (toList!270 lt!3966))) a!507))))))

(declare-fun b!16297 () Bool)

(declare-fun $colon$colon!24 (List!522 tuple2!678) List!522)

(assert (=> b!16297 (= e!10040 ($colon$colon!24 (removeStrictlySorted!16 (t!3062 (toList!270 lt!3966)) a!507) (h!1084 (toList!270 lt!3966))))))

(declare-fun b!16298 () Bool)

(declare-fun e!10039 () Bool)

(declare-fun lt!4026 () List!522)

(assert (=> b!16298 (= e!10039 (not (containsKey!17 lt!4026 a!507)))))

(declare-fun d!3109 () Bool)

(assert (=> d!3109 e!10039))

(declare-fun res!12160 () Bool)

(assert (=> d!3109 (=> (not res!12160) (not e!10039))))

(assert (=> d!3109 (= res!12160 (isStrictlySorted!152 lt!4026))))

(assert (=> d!3109 (= lt!4026 e!10041)))

(declare-fun c!1530 () Bool)

(assert (=> d!3109 (= c!1530 (and ((_ is Cons!518) (toList!270 lt!3966)) (= (_1!339 (h!1084 (toList!270 lt!3966))) a!507)))))

(assert (=> d!3109 (isStrictlySorted!152 (toList!270 lt!3966))))

(assert (=> d!3109 (= (removeStrictlySorted!16 (toList!270 lt!3966) a!507) lt!4026)))

(declare-fun b!16299 () Bool)

(assert (=> b!16299 (= e!10040 Nil!519)))

(declare-fun b!16300 () Bool)

(assert (=> b!16300 (= e!10041 (t!3062 (toList!270 lt!3966)))))

(assert (= (and d!3109 c!1530) b!16300))

(assert (= (and d!3109 (not c!1530)) b!16296))

(assert (= (and b!16296 c!1529) b!16297))

(assert (= (and b!16296 (not c!1529)) b!16299))

(assert (= (and d!3109 res!12160) b!16298))

(declare-fun m!11371 () Bool)

(assert (=> b!16297 m!11371))

(assert (=> b!16297 m!11371))

(declare-fun m!11373 () Bool)

(assert (=> b!16297 m!11373))

(declare-fun m!11375 () Bool)

(assert (=> b!16298 m!11375))

(declare-fun m!11377 () Bool)

(assert (=> d!3109 m!11377))

(declare-fun m!11379 () Bool)

(assert (=> d!3109 m!11379))

(assert (=> d!3059 d!3109))

(declare-fun d!3117 () Bool)

(assert (=> d!3117 (= (tail!83 (toList!270 lm!221)) (t!3062 (toList!270 lm!221)))))

(assert (=> d!3035 d!3117))

(assert (=> d!3067 d!3061))

(assert (=> d!3067 d!3059))

(declare-fun d!3121 () Bool)

(assert (=> d!3121 (forall!143 (toList!270 (-!29 lt!3966 a!507)) p!191)))

(assert (=> d!3121 true))

(declare-fun _$31!17 () Unit!328)

(assert (=> d!3121 (= (choose!183 lt!3966 p!191 a!507) _$31!17)))

(declare-fun bs!777 () Bool)

(assert (= bs!777 d!3121))

(assert (=> bs!777 m!11173))

(assert (=> bs!777 m!11175))

(assert (=> d!3067 d!3121))

(assert (=> d!3067 d!3029))

(declare-fun d!3129 () Bool)

(declare-fun e!10052 () Bool)

(assert (=> d!3129 e!10052))

(declare-fun res!12167 () Bool)

(assert (=> d!3129 (=> res!12167 e!10052)))

(declare-fun lt!4032 () Bool)

(assert (=> d!3129 (= res!12167 (not lt!4032))))

(declare-fun lt!4030 () Bool)

(assert (=> d!3129 (= lt!4032 lt!4030)))

(declare-fun lt!4029 () Unit!328)

(declare-fun e!10053 () Unit!328)

(assert (=> d!3129 (= lt!4029 e!10053)))

(declare-fun c!1535 () Bool)

(assert (=> d!3129 (= c!1535 lt!4030)))

(assert (=> d!3129 (= lt!4030 (containsKey!17 (toList!270 lt!3990) a!507))))

(assert (=> d!3129 (= (contains!202 lt!3990 a!507) lt!4032)))

(declare-fun b!16315 () Bool)

(declare-fun lt!4031 () Unit!328)

(assert (=> b!16315 (= e!10053 lt!4031)))

(assert (=> b!16315 (= lt!4031 (lemmaContainsKeyImpliesGetValueByKeyDefined!14 (toList!270 lt!3990) a!507))))

(assert (=> b!16315 (isDefined!15 (getValueByKey!53 (toList!270 lt!3990) a!507))))

(declare-fun b!16316 () Bool)

(declare-fun Unit!336 () Unit!328)

(assert (=> b!16316 (= e!10053 Unit!336)))

(declare-fun b!16317 () Bool)

(assert (=> b!16317 (= e!10052 (isDefined!15 (getValueByKey!53 (toList!270 lt!3990) a!507)))))

(assert (= (and d!3129 c!1535) b!16315))

(assert (= (and d!3129 (not c!1535)) b!16316))

(assert (= (and d!3129 (not res!12167)) b!16317))

(declare-fun m!11389 () Bool)

(assert (=> d!3129 m!11389))

(declare-fun m!11391 () Bool)

(assert (=> b!16315 m!11391))

(declare-fun m!11393 () Bool)

(assert (=> b!16315 m!11393))

(assert (=> b!16315 m!11393))

(declare-fun m!11395 () Bool)

(assert (=> b!16315 m!11395))

(assert (=> b!16317 m!11393))

(assert (=> b!16317 m!11393))

(assert (=> b!16317 m!11395))

(assert (=> d!3047 d!3129))

(declare-fun b!16327 () Bool)

(declare-fun e!10063 () List!522)

(declare-fun e!10062 () List!522)

(assert (=> b!16327 (= e!10063 e!10062)))

(declare-fun c!1538 () Bool)

(assert (=> b!16327 (= c!1538 (and ((_ is Cons!518) (toList!270 lm!221)) (not (= (_1!339 (h!1084 (toList!270 lm!221))) a!507))))))

(declare-fun b!16328 () Bool)

(assert (=> b!16328 (= e!10062 ($colon$colon!24 (removeStrictlySorted!16 (t!3062 (toList!270 lm!221)) a!507) (h!1084 (toList!270 lm!221))))))

(declare-fun b!16329 () Bool)

(declare-fun e!10061 () Bool)

(declare-fun lt!4034 () List!522)

(assert (=> b!16329 (= e!10061 (not (containsKey!17 lt!4034 a!507)))))

(declare-fun d!3131 () Bool)

(assert (=> d!3131 e!10061))

(declare-fun res!12173 () Bool)

(assert (=> d!3131 (=> (not res!12173) (not e!10061))))

(assert (=> d!3131 (= res!12173 (isStrictlySorted!152 lt!4034))))

(assert (=> d!3131 (= lt!4034 e!10063)))

(declare-fun c!1539 () Bool)

(assert (=> d!3131 (= c!1539 (and ((_ is Cons!518) (toList!270 lm!221)) (= (_1!339 (h!1084 (toList!270 lm!221))) a!507)))))

(assert (=> d!3131 (isStrictlySorted!152 (toList!270 lm!221))))

(assert (=> d!3131 (= (removeStrictlySorted!16 (toList!270 lm!221) a!507) lt!4034)))

(declare-fun b!16330 () Bool)

(assert (=> b!16330 (= e!10062 Nil!519)))

(declare-fun b!16331 () Bool)

(assert (=> b!16331 (= e!10063 (t!3062 (toList!270 lm!221)))))

(assert (= (and d!3131 c!1539) b!16331))

(assert (= (and d!3131 (not c!1539)) b!16327))

(assert (= (and b!16327 c!1538) b!16328))

(assert (= (and b!16327 (not c!1538)) b!16330))

(assert (= (and d!3131 res!12173) b!16329))

(declare-fun m!11407 () Bool)

(assert (=> b!16328 m!11407))

(assert (=> b!16328 m!11407))

(declare-fun m!11409 () Bool)

(assert (=> b!16328 m!11409))

(declare-fun m!11411 () Bool)

(assert (=> b!16329 m!11411))

(declare-fun m!11413 () Bool)

(assert (=> d!3131 m!11413))

(assert (=> d!3131 m!11247))

(assert (=> d!3047 d!3131))

(declare-fun d!3135 () Bool)

(assert (=> d!3135 (= (isEmpty!159 (toList!270 lm!221)) ((_ is Nil!519) (toList!270 lm!221)))))

(assert (=> d!3037 d!3135))

(declare-fun b!16338 () Bool)

(declare-fun e!10070 () Bool)

(declare-fun tp!2877 () Bool)

(assert (=> b!16338 (= e!10070 (and tp_is_empty!829 tp!2877))))

(assert (=> b!16237 (= tp!2870 e!10070)))

(assert (= (and b!16237 ((_ is Cons!518) (t!3062 (toList!270 lm!221)))) b!16338))

(declare-fun b_lambda!1317 () Bool)

(assert (= b_lambda!1301 (or (and start!2778 b_free!565) b_lambda!1317)))

(declare-fun b_lambda!1319 () Bool)

(assert (= b_lambda!1295 (or (and start!2778 b_free!565) b_lambda!1319)))

(declare-fun b_lambda!1321 () Bool)

(assert (= b_lambda!1297 (or (and start!2778 b_free!565) b_lambda!1321)))

(declare-fun b_lambda!1323 () Bool)

(assert (= b_lambda!1299 (or (and start!2778 b_free!565) b_lambda!1323)))

(check-sat (not b_lambda!1323) (not b_lambda!1277) (not b!16317) tp_is_empty!829 (not b_lambda!1321) (not b!16315) b_and!1149 (not b!16251) (not b_lambda!1273) (not b!16272) (not b_lambda!1319) (not d!3099) (not b!16249) (not b!16329) (not d!3109) (not d!3131) (not b_next!565) (not b!16298) (not b!16253) (not b!16274) (not b!16338) (not b!16261) (not b_lambda!1317) (not d!3129) (not b!16328) (not d!3121) (not b_lambda!1271) (not b!16297) (not b!16255) (not b_lambda!1275))
(check-sat b_and!1149 (not b_next!565))
(get-model)

(declare-fun d!3161 () Bool)

(declare-fun res!12202 () Bool)

(declare-fun e!10110 () Bool)

(assert (=> d!3161 (=> res!12202 e!10110)))

(assert (=> d!3161 (= res!12202 (and ((_ is Cons!518) (toList!270 lt!3990)) (= (_1!339 (h!1084 (toList!270 lt!3990))) a!507)))))

(assert (=> d!3161 (= (containsKey!17 (toList!270 lt!3990) a!507) e!10110)))

(declare-fun b!16393 () Bool)

(declare-fun e!10111 () Bool)

(assert (=> b!16393 (= e!10110 e!10111)))

(declare-fun res!12203 () Bool)

(assert (=> b!16393 (=> (not res!12203) (not e!10111))))

(assert (=> b!16393 (= res!12203 (and (or (not ((_ is Cons!518) (toList!270 lt!3990))) (bvsle (_1!339 (h!1084 (toList!270 lt!3990))) a!507)) ((_ is Cons!518) (toList!270 lt!3990)) (bvslt (_1!339 (h!1084 (toList!270 lt!3990))) a!507)))))

(declare-fun b!16394 () Bool)

(assert (=> b!16394 (= e!10111 (containsKey!17 (t!3062 (toList!270 lt!3990)) a!507))))

(assert (= (and d!3161 (not res!12202)) b!16393))

(assert (= (and b!16393 res!12203) b!16394))

(declare-fun m!11481 () Bool)

(assert (=> b!16394 m!11481))

(assert (=> d!3129 d!3161))

(declare-fun d!3163 () Bool)

(declare-fun res!12204 () Bool)

(declare-fun e!10112 () Bool)

(assert (=> d!3163 (=> res!12204 e!10112)))

(assert (=> d!3163 (= res!12204 (or ((_ is Nil!519) lt!4026) ((_ is Nil!519) (t!3062 lt!4026))))))

(assert (=> d!3163 (= (isStrictlySorted!152 lt!4026) e!10112)))

(declare-fun b!16395 () Bool)

(declare-fun e!10113 () Bool)

(assert (=> b!16395 (= e!10112 e!10113)))

(declare-fun res!12205 () Bool)

(assert (=> b!16395 (=> (not res!12205) (not e!10113))))

(assert (=> b!16395 (= res!12205 (bvslt (_1!339 (h!1084 lt!4026)) (_1!339 (h!1084 (t!3062 lt!4026)))))))

(declare-fun b!16396 () Bool)

(assert (=> b!16396 (= e!10113 (isStrictlySorted!152 (t!3062 lt!4026)))))

(assert (= (and d!3163 (not res!12204)) b!16395))

(assert (= (and b!16395 res!12205) b!16396))

(declare-fun m!11483 () Bool)

(assert (=> b!16396 m!11483))

(assert (=> d!3109 d!3163))

(declare-fun d!3165 () Bool)

(declare-fun res!12206 () Bool)

(declare-fun e!10114 () Bool)

(assert (=> d!3165 (=> res!12206 e!10114)))

(assert (=> d!3165 (= res!12206 (or ((_ is Nil!519) (toList!270 lt!3966)) ((_ is Nil!519) (t!3062 (toList!270 lt!3966)))))))

(assert (=> d!3165 (= (isStrictlySorted!152 (toList!270 lt!3966)) e!10114)))

(declare-fun b!16397 () Bool)

(declare-fun e!10115 () Bool)

(assert (=> b!16397 (= e!10114 e!10115)))

(declare-fun res!12207 () Bool)

(assert (=> b!16397 (=> (not res!12207) (not e!10115))))

(assert (=> b!16397 (= res!12207 (bvslt (_1!339 (h!1084 (toList!270 lt!3966))) (_1!339 (h!1084 (t!3062 (toList!270 lt!3966))))))))

(declare-fun b!16398 () Bool)

(assert (=> b!16398 (= e!10115 (isStrictlySorted!152 (t!3062 (toList!270 lt!3966))))))

(assert (= (and d!3165 (not res!12206)) b!16397))

(assert (= (and b!16397 res!12207) b!16398))

(declare-fun m!11485 () Bool)

(assert (=> b!16398 m!11485))

(assert (=> d!3109 d!3165))

(declare-fun d!3167 () Bool)

(declare-fun isEmpty!162 (Option!59) Bool)

(assert (=> d!3167 (= (isDefined!15 (getValueByKey!53 (toList!270 lt!3991) a!507)) (not (isEmpty!162 (getValueByKey!53 (toList!270 lt!3991) a!507))))))

(declare-fun bs!780 () Bool)

(assert (= bs!780 d!3167))

(assert (=> bs!780 m!11355))

(declare-fun m!11487 () Bool)

(assert (=> bs!780 m!11487))

(assert (=> b!16274 d!3167))

(declare-fun b!16410 () Bool)

(declare-fun e!10121 () Option!59)

(assert (=> b!16410 (= e!10121 None!57)))

(declare-fun b!16407 () Bool)

(declare-fun e!10120 () Option!59)

(assert (=> b!16407 (= e!10120 (Some!58 (_2!339 (h!1084 (toList!270 lt!3991)))))))

(declare-fun b!16408 () Bool)

(assert (=> b!16408 (= e!10120 e!10121)))

(declare-fun c!1560 () Bool)

(assert (=> b!16408 (= c!1560 (and ((_ is Cons!518) (toList!270 lt!3991)) (not (= (_1!339 (h!1084 (toList!270 lt!3991))) a!507))))))

(declare-fun b!16409 () Bool)

(assert (=> b!16409 (= e!10121 (getValueByKey!53 (t!3062 (toList!270 lt!3991)) a!507))))

(declare-fun d!3169 () Bool)

(declare-fun c!1559 () Bool)

(assert (=> d!3169 (= c!1559 (and ((_ is Cons!518) (toList!270 lt!3991)) (= (_1!339 (h!1084 (toList!270 lt!3991))) a!507)))))

(assert (=> d!3169 (= (getValueByKey!53 (toList!270 lt!3991) a!507) e!10120)))

(assert (= (and d!3169 c!1559) b!16407))

(assert (= (and d!3169 (not c!1559)) b!16408))

(assert (= (and b!16408 c!1560) b!16409))

(assert (= (and b!16408 (not c!1560)) b!16410))

(declare-fun m!11489 () Bool)

(assert (=> b!16409 m!11489))

(assert (=> b!16274 d!3169))

(declare-fun d!3171 () Bool)

(assert (=> d!3171 (isDefined!15 (getValueByKey!53 (toList!270 lt!3990) a!507))))

(declare-fun lt!4062 () Unit!328)

(declare-fun choose!185 (List!522 (_ BitVec 64)) Unit!328)

(assert (=> d!3171 (= lt!4062 (choose!185 (toList!270 lt!3990) a!507))))

(declare-fun e!10124 () Bool)

(assert (=> d!3171 e!10124))

(declare-fun res!12210 () Bool)

(assert (=> d!3171 (=> (not res!12210) (not e!10124))))

(assert (=> d!3171 (= res!12210 (isStrictlySorted!152 (toList!270 lt!3990)))))

(assert (=> d!3171 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!14 (toList!270 lt!3990) a!507) lt!4062)))

(declare-fun b!16413 () Bool)

(assert (=> b!16413 (= e!10124 (containsKey!17 (toList!270 lt!3990) a!507))))

(assert (= (and d!3171 res!12210) b!16413))

(assert (=> d!3171 m!11393))

(assert (=> d!3171 m!11393))

(assert (=> d!3171 m!11395))

(declare-fun m!11491 () Bool)

(assert (=> d!3171 m!11491))

(declare-fun m!11493 () Bool)

(assert (=> d!3171 m!11493))

(assert (=> b!16413 m!11389))

(assert (=> b!16315 d!3171))

(declare-fun d!3173 () Bool)

(assert (=> d!3173 (= (isDefined!15 (getValueByKey!53 (toList!270 lt!3990) a!507)) (not (isEmpty!162 (getValueByKey!53 (toList!270 lt!3990) a!507))))))

(declare-fun bs!781 () Bool)

(assert (= bs!781 d!3173))

(assert (=> bs!781 m!11393))

(declare-fun m!11495 () Bool)

(assert (=> bs!781 m!11495))

(assert (=> b!16315 d!3173))

(declare-fun b!16417 () Bool)

(declare-fun e!10126 () Option!59)

(assert (=> b!16417 (= e!10126 None!57)))

(declare-fun b!16414 () Bool)

(declare-fun e!10125 () Option!59)

(assert (=> b!16414 (= e!10125 (Some!58 (_2!339 (h!1084 (toList!270 lt!3990)))))))

(declare-fun b!16415 () Bool)

(assert (=> b!16415 (= e!10125 e!10126)))

(declare-fun c!1562 () Bool)

(assert (=> b!16415 (= c!1562 (and ((_ is Cons!518) (toList!270 lt!3990)) (not (= (_1!339 (h!1084 (toList!270 lt!3990))) a!507))))))

(declare-fun b!16416 () Bool)

(assert (=> b!16416 (= e!10126 (getValueByKey!53 (t!3062 (toList!270 lt!3990)) a!507))))

(declare-fun d!3175 () Bool)

(declare-fun c!1561 () Bool)

(assert (=> d!3175 (= c!1561 (and ((_ is Cons!518) (toList!270 lt!3990)) (= (_1!339 (h!1084 (toList!270 lt!3990))) a!507)))))

(assert (=> d!3175 (= (getValueByKey!53 (toList!270 lt!3990) a!507) e!10125)))

(assert (= (and d!3175 c!1561) b!16414))

(assert (= (and d!3175 (not c!1561)) b!16415))

(assert (= (and b!16415 c!1562) b!16416))

(assert (= (and b!16415 (not c!1562)) b!16417))

(declare-fun m!11497 () Bool)

(assert (=> b!16416 m!11497))

(assert (=> b!16315 d!3175))

(declare-fun d!3177 () Bool)

(declare-fun res!12211 () Bool)

(declare-fun e!10127 () Bool)

(assert (=> d!3177 (=> res!12211 e!10127)))

(assert (=> d!3177 (= res!12211 (and ((_ is Cons!518) lt!4026) (= (_1!339 (h!1084 lt!4026)) a!507)))))

(assert (=> d!3177 (= (containsKey!17 lt!4026 a!507) e!10127)))

(declare-fun b!16418 () Bool)

(declare-fun e!10128 () Bool)

(assert (=> b!16418 (= e!10127 e!10128)))

(declare-fun res!12212 () Bool)

(assert (=> b!16418 (=> (not res!12212) (not e!10128))))

(assert (=> b!16418 (= res!12212 (and (or (not ((_ is Cons!518) lt!4026)) (bvsle (_1!339 (h!1084 lt!4026)) a!507)) ((_ is Cons!518) lt!4026) (bvslt (_1!339 (h!1084 lt!4026)) a!507)))))

(declare-fun b!16419 () Bool)

(assert (=> b!16419 (= e!10128 (containsKey!17 (t!3062 lt!4026) a!507))))

(assert (= (and d!3177 (not res!12211)) b!16418))

(assert (= (and b!16418 res!12212) b!16419))

(declare-fun m!11499 () Bool)

(assert (=> b!16419 m!11499))

(assert (=> b!16298 d!3177))

(declare-fun d!3179 () Bool)

(declare-fun res!12213 () Bool)

(declare-fun e!10129 () Bool)

(assert (=> d!3179 (=> res!12213 e!10129)))

(assert (=> d!3179 (= res!12213 ((_ is Nil!519) (t!3062 (t!3062 (toList!270 (-!29 lm!221 a!507))))))))

(assert (=> d!3179 (= (forall!143 (t!3062 (t!3062 (toList!270 (-!29 lm!221 a!507)))) p!191) e!10129)))

(declare-fun b!16420 () Bool)

(declare-fun e!10130 () Bool)

(assert (=> b!16420 (= e!10129 e!10130)))

(declare-fun res!12214 () Bool)

(assert (=> b!16420 (=> (not res!12214) (not e!10130))))

(assert (=> b!16420 (= res!12214 (dynLambda!122 p!191 (h!1084 (t!3062 (t!3062 (toList!270 (-!29 lm!221 a!507)))))))))

(declare-fun b!16421 () Bool)

(assert (=> b!16421 (= e!10130 (forall!143 (t!3062 (t!3062 (t!3062 (toList!270 (-!29 lm!221 a!507))))) p!191))))

(assert (= (and d!3179 (not res!12213)) b!16420))

(assert (= (and b!16420 res!12214) b!16421))

(declare-fun b_lambda!1343 () Bool)

(assert (=> (not b_lambda!1343) (not b!16420)))

(declare-fun t!3114 () Bool)

(declare-fun tb!579 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3114) tb!579))

(declare-fun result!951 () Bool)

(assert (=> tb!579 (= result!951 true)))

(assert (=> b!16420 t!3114))

(declare-fun b_and!1167 () Bool)

(assert (= b_and!1149 (and (=> t!3114 result!951) b_and!1167)))

(declare-fun m!11501 () Bool)

(assert (=> b!16420 m!11501))

(declare-fun m!11503 () Bool)

(assert (=> b!16421 m!11503))

(assert (=> b!16251 d!3179))

(declare-fun d!3181 () Bool)

(declare-fun res!12215 () Bool)

(declare-fun e!10131 () Bool)

(assert (=> d!3181 (=> res!12215 e!10131)))

(assert (=> d!3181 (= res!12215 (or ((_ is Nil!519) (t!3062 (toList!270 lm!221))) ((_ is Nil!519) (t!3062 (t!3062 (toList!270 lm!221))))))))

(assert (=> d!3181 (= (isStrictlySorted!152 (t!3062 (toList!270 lm!221))) e!10131)))

(declare-fun b!16422 () Bool)

(declare-fun e!10132 () Bool)

(assert (=> b!16422 (= e!10131 e!10132)))

(declare-fun res!12216 () Bool)

(assert (=> b!16422 (=> (not res!12216) (not e!10132))))

(assert (=> b!16422 (= res!12216 (bvslt (_1!339 (h!1084 (t!3062 (toList!270 lm!221)))) (_1!339 (h!1084 (t!3062 (t!3062 (toList!270 lm!221)))))))))

(declare-fun b!16423 () Bool)

(assert (=> b!16423 (= e!10132 (isStrictlySorted!152 (t!3062 (t!3062 (toList!270 lm!221)))))))

(assert (= (and d!3181 (not res!12215)) b!16422))

(assert (= (and b!16422 res!12216) b!16423))

(declare-fun m!11505 () Bool)

(assert (=> b!16423 m!11505))

(assert (=> b!16261 d!3181))

(declare-fun d!3183 () Bool)

(declare-fun res!12217 () Bool)

(declare-fun e!10133 () Bool)

(assert (=> d!3183 (=> res!12217 e!10133)))

(assert (=> d!3183 (= res!12217 ((_ is Nil!519) (t!3062 (t!3062 (toList!270 (-!29 lt!3966 a!507))))))))

(assert (=> d!3183 (= (forall!143 (t!3062 (t!3062 (toList!270 (-!29 lt!3966 a!507)))) p!191) e!10133)))

(declare-fun b!16424 () Bool)

(declare-fun e!10134 () Bool)

(assert (=> b!16424 (= e!10133 e!10134)))

(declare-fun res!12218 () Bool)

(assert (=> b!16424 (=> (not res!12218) (not e!10134))))

(assert (=> b!16424 (= res!12218 (dynLambda!122 p!191 (h!1084 (t!3062 (t!3062 (toList!270 (-!29 lt!3966 a!507)))))))))

(declare-fun b!16425 () Bool)

(assert (=> b!16425 (= e!10134 (forall!143 (t!3062 (t!3062 (t!3062 (toList!270 (-!29 lt!3966 a!507))))) p!191))))

(assert (= (and d!3183 (not res!12217)) b!16424))

(assert (= (and b!16424 res!12218) b!16425))

(declare-fun b_lambda!1345 () Bool)

(assert (=> (not b_lambda!1345) (not b!16424)))

(declare-fun t!3116 () Bool)

(declare-fun tb!581 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3116) tb!581))

(declare-fun result!953 () Bool)

(assert (=> tb!581 (= result!953 true)))

(assert (=> b!16424 t!3116))

(declare-fun b_and!1169 () Bool)

(assert (= b_and!1167 (and (=> t!3116 result!953) b_and!1169)))

(declare-fun m!11507 () Bool)

(assert (=> b!16424 m!11507))

(declare-fun m!11509 () Bool)

(assert (=> b!16425 m!11509))

(assert (=> b!16253 d!3183))

(assert (=> b!16317 d!3173))

(assert (=> b!16317 d!3175))

(declare-fun d!3185 () Bool)

(declare-fun res!12219 () Bool)

(declare-fun e!10135 () Bool)

(assert (=> d!3185 (=> res!12219 e!10135)))

(assert (=> d!3185 (= res!12219 ((_ is Nil!519) (t!3062 (t!3062 (toList!270 lm!221)))))))

(assert (=> d!3185 (= (forall!143 (t!3062 (t!3062 (toList!270 lm!221))) p!191) e!10135)))

(declare-fun b!16426 () Bool)

(declare-fun e!10136 () Bool)

(assert (=> b!16426 (= e!10135 e!10136)))

(declare-fun res!12220 () Bool)

(assert (=> b!16426 (=> (not res!12220) (not e!10136))))

(assert (=> b!16426 (= res!12220 (dynLambda!122 p!191 (h!1084 (t!3062 (t!3062 (toList!270 lm!221))))))))

(declare-fun b!16427 () Bool)

(assert (=> b!16427 (= e!10136 (forall!143 (t!3062 (t!3062 (t!3062 (toList!270 lm!221)))) p!191))))

(assert (= (and d!3185 (not res!12219)) b!16426))

(assert (= (and b!16426 res!12220) b!16427))

(declare-fun b_lambda!1347 () Bool)

(assert (=> (not b_lambda!1347) (not b!16426)))

(declare-fun t!3118 () Bool)

(declare-fun tb!583 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3118) tb!583))

(declare-fun result!955 () Bool)

(assert (=> tb!583 (= result!955 true)))

(assert (=> b!16426 t!3118))

(declare-fun b_and!1171 () Bool)

(assert (= b_and!1169 (and (=> t!3118 result!955) b_and!1171)))

(declare-fun m!11511 () Bool)

(assert (=> b!16426 m!11511))

(declare-fun m!11513 () Bool)

(assert (=> b!16427 m!11513))

(assert (=> b!16249 d!3185))

(declare-fun d!3187 () Bool)

(assert (=> d!3187 (= ($colon$colon!24 (removeStrictlySorted!16 (t!3062 (toList!270 lt!3966)) a!507) (h!1084 (toList!270 lt!3966))) (Cons!518 (h!1084 (toList!270 lt!3966)) (removeStrictlySorted!16 (t!3062 (toList!270 lt!3966)) a!507)))))

(assert (=> b!16297 d!3187))

(declare-fun b!16428 () Bool)

(declare-fun e!10139 () List!522)

(declare-fun e!10138 () List!522)

(assert (=> b!16428 (= e!10139 e!10138)))

(declare-fun c!1563 () Bool)

(assert (=> b!16428 (= c!1563 (and ((_ is Cons!518) (t!3062 (toList!270 lt!3966))) (not (= (_1!339 (h!1084 (t!3062 (toList!270 lt!3966)))) a!507))))))

(declare-fun b!16429 () Bool)

(assert (=> b!16429 (= e!10138 ($colon$colon!24 (removeStrictlySorted!16 (t!3062 (t!3062 (toList!270 lt!3966))) a!507) (h!1084 (t!3062 (toList!270 lt!3966)))))))

(declare-fun b!16430 () Bool)

(declare-fun e!10137 () Bool)

(declare-fun lt!4063 () List!522)

(assert (=> b!16430 (= e!10137 (not (containsKey!17 lt!4063 a!507)))))

(declare-fun d!3189 () Bool)

(assert (=> d!3189 e!10137))

(declare-fun res!12221 () Bool)

(assert (=> d!3189 (=> (not res!12221) (not e!10137))))

(assert (=> d!3189 (= res!12221 (isStrictlySorted!152 lt!4063))))

(assert (=> d!3189 (= lt!4063 e!10139)))

(declare-fun c!1564 () Bool)

(assert (=> d!3189 (= c!1564 (and ((_ is Cons!518) (t!3062 (toList!270 lt!3966))) (= (_1!339 (h!1084 (t!3062 (toList!270 lt!3966)))) a!507)))))

(assert (=> d!3189 (isStrictlySorted!152 (t!3062 (toList!270 lt!3966)))))

(assert (=> d!3189 (= (removeStrictlySorted!16 (t!3062 (toList!270 lt!3966)) a!507) lt!4063)))

(declare-fun b!16431 () Bool)

(assert (=> b!16431 (= e!10138 Nil!519)))

(declare-fun b!16432 () Bool)

(assert (=> b!16432 (= e!10139 (t!3062 (t!3062 (toList!270 lt!3966))))))

(assert (= (and d!3189 c!1564) b!16432))

(assert (= (and d!3189 (not c!1564)) b!16428))

(assert (= (and b!16428 c!1563) b!16429))

(assert (= (and b!16428 (not c!1563)) b!16431))

(assert (= (and d!3189 res!12221) b!16430))

(declare-fun m!11515 () Bool)

(assert (=> b!16429 m!11515))

(assert (=> b!16429 m!11515))

(declare-fun m!11517 () Bool)

(assert (=> b!16429 m!11517))

(declare-fun m!11519 () Bool)

(assert (=> b!16430 m!11519))

(declare-fun m!11521 () Bool)

(assert (=> d!3189 m!11521))

(assert (=> d!3189 m!11485))

(assert (=> b!16297 d!3189))

(declare-fun d!3191 () Bool)

(declare-fun res!12222 () Bool)

(declare-fun e!10140 () Bool)

(assert (=> d!3191 (=> res!12222 e!10140)))

(assert (=> d!3191 (= res!12222 (or ((_ is Nil!519) lt!4034) ((_ is Nil!519) (t!3062 lt!4034))))))

(assert (=> d!3191 (= (isStrictlySorted!152 lt!4034) e!10140)))

(declare-fun b!16433 () Bool)

(declare-fun e!10141 () Bool)

(assert (=> b!16433 (= e!10140 e!10141)))

(declare-fun res!12223 () Bool)

(assert (=> b!16433 (=> (not res!12223) (not e!10141))))

(assert (=> b!16433 (= res!12223 (bvslt (_1!339 (h!1084 lt!4034)) (_1!339 (h!1084 (t!3062 lt!4034)))))))

(declare-fun b!16434 () Bool)

(assert (=> b!16434 (= e!10141 (isStrictlySorted!152 (t!3062 lt!4034)))))

(assert (= (and d!3191 (not res!12222)) b!16433))

(assert (= (and b!16433 res!12223) b!16434))

(declare-fun m!11523 () Bool)

(assert (=> b!16434 m!11523))

(assert (=> d!3131 d!3191))

(assert (=> d!3131 d!3097))

(declare-fun d!3193 () Bool)

(declare-fun res!12224 () Bool)

(declare-fun e!10142 () Bool)

(assert (=> d!3193 (=> res!12224 e!10142)))

(assert (=> d!3193 (= res!12224 ((_ is Nil!519) (t!3062 (t!3062 (toList!270 lt!3966)))))))

(assert (=> d!3193 (= (forall!143 (t!3062 (t!3062 (toList!270 lt!3966))) p!191) e!10142)))

(declare-fun b!16435 () Bool)

(declare-fun e!10143 () Bool)

(assert (=> b!16435 (= e!10142 e!10143)))

(declare-fun res!12225 () Bool)

(assert (=> b!16435 (=> (not res!12225) (not e!10143))))

(assert (=> b!16435 (= res!12225 (dynLambda!122 p!191 (h!1084 (t!3062 (t!3062 (toList!270 lt!3966))))))))

(declare-fun b!16436 () Bool)

(assert (=> b!16436 (= e!10143 (forall!143 (t!3062 (t!3062 (t!3062 (toList!270 lt!3966)))) p!191))))

(assert (= (and d!3193 (not res!12224)) b!16435))

(assert (= (and b!16435 res!12225) b!16436))

(declare-fun b_lambda!1349 () Bool)

(assert (=> (not b_lambda!1349) (not b!16435)))

(declare-fun t!3121 () Bool)

(declare-fun tb!585 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3121) tb!585))

(declare-fun result!957 () Bool)

(assert (=> tb!585 (= result!957 true)))

(assert (=> b!16435 t!3121))

(declare-fun b_and!1173 () Bool)

(assert (= b_and!1171 (and (=> t!3121 result!957) b_and!1173)))

(declare-fun m!11525 () Bool)

(assert (=> b!16435 m!11525))

(declare-fun m!11527 () Bool)

(assert (=> b!16436 m!11527))

(assert (=> b!16255 d!3193))

(assert (=> d!3121 d!3061))

(assert (=> d!3121 d!3059))

(declare-fun d!3195 () Bool)

(assert (=> d!3195 (isDefined!15 (getValueByKey!53 (toList!270 lt!3991) a!507))))

(declare-fun lt!4064 () Unit!328)

(assert (=> d!3195 (= lt!4064 (choose!185 (toList!270 lt!3991) a!507))))

(declare-fun e!10144 () Bool)

(assert (=> d!3195 e!10144))

(declare-fun res!12226 () Bool)

(assert (=> d!3195 (=> (not res!12226) (not e!10144))))

(assert (=> d!3195 (= res!12226 (isStrictlySorted!152 (toList!270 lt!3991)))))

(assert (=> d!3195 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!14 (toList!270 lt!3991) a!507) lt!4064)))

(declare-fun b!16437 () Bool)

(assert (=> b!16437 (= e!10144 (containsKey!17 (toList!270 lt!3991) a!507))))

(assert (= (and d!3195 res!12226) b!16437))

(assert (=> d!3195 m!11355))

(assert (=> d!3195 m!11355))

(assert (=> d!3195 m!11357))

(declare-fun m!11529 () Bool)

(assert (=> d!3195 m!11529))

(declare-fun m!11531 () Bool)

(assert (=> d!3195 m!11531))

(assert (=> b!16437 m!11351))

(assert (=> b!16272 d!3195))

(assert (=> b!16272 d!3167))

(assert (=> b!16272 d!3169))

(declare-fun d!3197 () Bool)

(assert (=> d!3197 (= ($colon$colon!24 (removeStrictlySorted!16 (t!3062 (toList!270 lm!221)) a!507) (h!1084 (toList!270 lm!221))) (Cons!518 (h!1084 (toList!270 lm!221)) (removeStrictlySorted!16 (t!3062 (toList!270 lm!221)) a!507)))))

(assert (=> b!16328 d!3197))

(declare-fun b!16438 () Bool)

(declare-fun e!10147 () List!522)

(declare-fun e!10146 () List!522)

(assert (=> b!16438 (= e!10147 e!10146)))

(declare-fun c!1565 () Bool)

(assert (=> b!16438 (= c!1565 (and ((_ is Cons!518) (t!3062 (toList!270 lm!221))) (not (= (_1!339 (h!1084 (t!3062 (toList!270 lm!221)))) a!507))))))

(declare-fun b!16439 () Bool)

(assert (=> b!16439 (= e!10146 ($colon$colon!24 (removeStrictlySorted!16 (t!3062 (t!3062 (toList!270 lm!221))) a!507) (h!1084 (t!3062 (toList!270 lm!221)))))))

(declare-fun b!16440 () Bool)

(declare-fun e!10145 () Bool)

(declare-fun lt!4065 () List!522)

(assert (=> b!16440 (= e!10145 (not (containsKey!17 lt!4065 a!507)))))

(declare-fun d!3199 () Bool)

(assert (=> d!3199 e!10145))

(declare-fun res!12227 () Bool)

(assert (=> d!3199 (=> (not res!12227) (not e!10145))))

(assert (=> d!3199 (= res!12227 (isStrictlySorted!152 lt!4065))))

(assert (=> d!3199 (= lt!4065 e!10147)))

(declare-fun c!1566 () Bool)

(assert (=> d!3199 (= c!1566 (and ((_ is Cons!518) (t!3062 (toList!270 lm!221))) (= (_1!339 (h!1084 (t!3062 (toList!270 lm!221)))) a!507)))))

(assert (=> d!3199 (isStrictlySorted!152 (t!3062 (toList!270 lm!221)))))

(assert (=> d!3199 (= (removeStrictlySorted!16 (t!3062 (toList!270 lm!221)) a!507) lt!4065)))

(declare-fun b!16441 () Bool)

(assert (=> b!16441 (= e!10146 Nil!519)))

(declare-fun b!16442 () Bool)

(assert (=> b!16442 (= e!10147 (t!3062 (t!3062 (toList!270 lm!221))))))

(assert (= (and d!3199 c!1566) b!16442))

(assert (= (and d!3199 (not c!1566)) b!16438))

(assert (= (and b!16438 c!1565) b!16439))

(assert (= (and b!16438 (not c!1565)) b!16441))

(assert (= (and d!3199 res!12227) b!16440))

(declare-fun m!11533 () Bool)

(assert (=> b!16439 m!11533))

(assert (=> b!16439 m!11533))

(declare-fun m!11535 () Bool)

(assert (=> b!16439 m!11535))

(declare-fun m!11537 () Bool)

(assert (=> b!16440 m!11537))

(declare-fun m!11539 () Bool)

(assert (=> d!3199 m!11539))

(assert (=> d!3199 m!11341))

(assert (=> b!16328 d!3199))

(declare-fun d!3201 () Bool)

(declare-fun res!12228 () Bool)

(declare-fun e!10148 () Bool)

(assert (=> d!3201 (=> res!12228 e!10148)))

(assert (=> d!3201 (= res!12228 (and ((_ is Cons!518) lt!4034) (= (_1!339 (h!1084 lt!4034)) a!507)))))

(assert (=> d!3201 (= (containsKey!17 lt!4034 a!507) e!10148)))

(declare-fun b!16443 () Bool)

(declare-fun e!10149 () Bool)

(assert (=> b!16443 (= e!10148 e!10149)))

(declare-fun res!12229 () Bool)

(assert (=> b!16443 (=> (not res!12229) (not e!10149))))

(assert (=> b!16443 (= res!12229 (and (or (not ((_ is Cons!518) lt!4034)) (bvsle (_1!339 (h!1084 lt!4034)) a!507)) ((_ is Cons!518) lt!4034) (bvslt (_1!339 (h!1084 lt!4034)) a!507)))))

(declare-fun b!16444 () Bool)

(assert (=> b!16444 (= e!10149 (containsKey!17 (t!3062 lt!4034) a!507))))

(assert (= (and d!3201 (not res!12228)) b!16443))

(assert (= (and b!16443 res!12229) b!16444))

(declare-fun m!11541 () Bool)

(assert (=> b!16444 m!11541))

(assert (=> b!16329 d!3201))

(declare-fun d!3203 () Bool)

(declare-fun res!12230 () Bool)

(declare-fun e!10150 () Bool)

(assert (=> d!3203 (=> res!12230 e!10150)))

(assert (=> d!3203 (= res!12230 (and ((_ is Cons!518) (toList!270 lt!3991)) (= (_1!339 (h!1084 (toList!270 lt!3991))) a!507)))))

(assert (=> d!3203 (= (containsKey!17 (toList!270 lt!3991) a!507) e!10150)))

(declare-fun b!16445 () Bool)

(declare-fun e!10151 () Bool)

(assert (=> b!16445 (= e!10150 e!10151)))

(declare-fun res!12231 () Bool)

(assert (=> b!16445 (=> (not res!12231) (not e!10151))))

(assert (=> b!16445 (= res!12231 (and (or (not ((_ is Cons!518) (toList!270 lt!3991))) (bvsle (_1!339 (h!1084 (toList!270 lt!3991))) a!507)) ((_ is Cons!518) (toList!270 lt!3991)) (bvslt (_1!339 (h!1084 (toList!270 lt!3991))) a!507)))))

(declare-fun b!16446 () Bool)

(assert (=> b!16446 (= e!10151 (containsKey!17 (t!3062 (toList!270 lt!3991)) a!507))))

(assert (= (and d!3203 (not res!12230)) b!16445))

(assert (= (and b!16445 res!12231) b!16446))

(declare-fun m!11543 () Bool)

(assert (=> b!16446 m!11543))

(assert (=> d!3099 d!3203))

(declare-fun b!16447 () Bool)

(declare-fun e!10152 () Bool)

(declare-fun tp!2880 () Bool)

(assert (=> b!16447 (= e!10152 (and tp_is_empty!829 tp!2880))))

(assert (=> b!16338 (= tp!2877 e!10152)))

(assert (= (and b!16338 ((_ is Cons!518) (t!3062 (t!3062 (toList!270 lm!221))))) b!16447))

(declare-fun b_lambda!1351 () Bool)

(assert (= b_lambda!1347 (or (and start!2778 b_free!565) b_lambda!1351)))

(declare-fun b_lambda!1353 () Bool)

(assert (= b_lambda!1349 (or (and start!2778 b_free!565) b_lambda!1353)))

(declare-fun b_lambda!1355 () Bool)

(assert (= b_lambda!1345 (or (and start!2778 b_free!565) b_lambda!1355)))

(declare-fun b_lambda!1357 () Bool)

(assert (= b_lambda!1343 (or (and start!2778 b_free!565) b_lambda!1357)))

(check-sat (not d!3189) (not b!16398) (not b_lambda!1323) (not b!16425) (not d!3173) (not b!16421) tp_is_empty!829 (not b!16394) (not b!16430) (not b!16447) (not b!16446) (not b_lambda!1271) (not b_lambda!1275) (not b_lambda!1353) (not b!16416) (not b!16434) (not b_lambda!1273) (not b_lambda!1319) (not b!16444) (not b!16440) (not b!16423) (not b!16409) (not b_lambda!1277) (not b!16429) (not b!16427) (not d!3195) (not b!16436) (not b!16437) b_and!1173 (not b_lambda!1351) (not d!3167) (not b!16419) (not b_lambda!1355) (not b!16413) (not b_lambda!1321) (not b_lambda!1357) (not b_next!565) (not b!16439) (not d!3199) (not b!16396) (not b_lambda!1317) (not d!3171))
(check-sat b_and!1173 (not b_next!565))
