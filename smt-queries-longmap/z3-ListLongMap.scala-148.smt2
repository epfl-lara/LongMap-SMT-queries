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

(declare-fun b!16175 () Bool)

(declare-fun res!12079 () Bool)

(declare-fun e!9939 () Bool)

(assert (=> b!16175 (=> (not res!12079) (not e!9939))))

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

(declare-fun isEmpty!156 (ListLongMap!509) Bool)

(assert (=> b!16175 (= res!12079 (not (isEmpty!156 lm!221)))))

(declare-fun p!191 () Int)

(declare-fun a!507 () (_ BitVec 64))

(declare-fun e!9941 () Bool)

(declare-fun b!16177 () Bool)

(declare-fun forall!143 (List!522 Int) Bool)

(declare-fun -!30 (ListLongMap!509 (_ BitVec 64)) ListLongMap!509)

(assert (=> b!16177 (= e!9941 (not (forall!143 (toList!270 (-!30 lm!221 a!507)) p!191)))))

(declare-fun lt!3965 () ListLongMap!509)

(assert (=> b!16177 (forall!143 (toList!270 (-!30 lt!3965 a!507)) p!191)))

(declare-datatypes ((Unit!328 0))(
  ( (Unit!329) )
))
(declare-fun lt!3966 () Unit!328)

(declare-fun removeValidProp!20 (ListLongMap!509 Int (_ BitVec 64)) Unit!328)

(assert (=> b!16177 (= lt!3966 (removeValidProp!20 lt!3965 p!191 a!507))))

(declare-fun b!16176 () Bool)

(assert (=> b!16176 (= e!9939 e!9941)))

(declare-fun res!12078 () Bool)

(assert (=> b!16176 (=> (not res!12078) (not e!9941))))

(assert (=> b!16176 (= res!12078 (forall!143 (toList!270 lt!3965) p!191))))

(declare-fun tail!80 (ListLongMap!509) ListLongMap!509)

(assert (=> b!16176 (= lt!3965 (tail!80 lm!221))))

(declare-fun b!16178 () Bool)

(declare-fun e!9940 () Bool)

(declare-fun tp!2855 () Bool)

(assert (=> b!16178 (= e!9940 tp!2855)))

(declare-fun res!12077 () Bool)

(assert (=> start!2778 (=> (not res!12077) (not e!9939))))

(assert (=> start!2778 (= res!12077 (forall!143 (toList!270 lm!221) p!191))))

(assert (=> start!2778 e!9939))

(declare-fun inv!888 (ListLongMap!509) Bool)

(assert (=> start!2778 (and (inv!888 lm!221) e!9940)))

(assert (=> start!2778 tp!2854))

(assert (=> start!2778 true))

(assert (= (and start!2778 res!12077) b!16175))

(assert (= (and b!16175 res!12079) b!16176))

(assert (= (and b!16176 res!12078) b!16177))

(assert (= start!2778 b!16178))

(declare-fun m!11169 () Bool)

(assert (=> b!16175 m!11169))

(declare-fun m!11171 () Bool)

(assert (=> b!16177 m!11171))

(declare-fun m!11173 () Bool)

(assert (=> b!16177 m!11173))

(declare-fun m!11175 () Bool)

(assert (=> b!16177 m!11175))

(declare-fun m!11177 () Bool)

(assert (=> b!16177 m!11177))

(declare-fun m!11179 () Bool)

(assert (=> b!16177 m!11179))

(declare-fun m!11181 () Bool)

(assert (=> b!16176 m!11181))

(declare-fun m!11183 () Bool)

(assert (=> b!16176 m!11183))

(declare-fun m!11185 () Bool)

(assert (=> start!2778 m!11185))

(declare-fun m!11187 () Bool)

(assert (=> start!2778 m!11187))

(check-sat (not b_next!565) (not b!16175) (not b!16178) (not b!16177) (not b!16176) (not start!2778) b_and!1113)
(check-sat b_and!1113 (not b_next!565))
(get-model)

(declare-fun d!3037 () Bool)

(declare-fun lt!3981 () ListLongMap!509)

(declare-fun contains!201 (ListLongMap!509 (_ BitVec 64)) Bool)

(assert (=> d!3037 (not (contains!201 lt!3981 a!507))))

(declare-fun removeStrictlySorted!15 (List!522 (_ BitVec 64)) List!522)

(assert (=> d!3037 (= lt!3981 (ListLongMap!510 (removeStrictlySorted!15 (toList!270 lm!221) a!507)))))

(assert (=> d!3037 (= (-!30 lm!221 a!507) lt!3981)))

(declare-fun bs!759 () Bool)

(assert (= bs!759 d!3037))

(declare-fun m!11237 () Bool)

(assert (=> bs!759 m!11237))

(declare-fun m!11239 () Bool)

(assert (=> bs!759 m!11239))

(assert (=> b!16177 d!3037))

(declare-fun d!3043 () Bool)

(declare-fun res!12116 () Bool)

(declare-fun e!9978 () Bool)

(assert (=> d!3043 (=> res!12116 e!9978)))

(get-info :version)

(assert (=> d!3043 (= res!12116 ((_ is Nil!519) (toList!270 (-!30 lm!221 a!507))))))

(assert (=> d!3043 (= (forall!143 (toList!270 (-!30 lm!221 a!507)) p!191) e!9978)))

(declare-fun b!16221 () Bool)

(declare-fun e!9979 () Bool)

(assert (=> b!16221 (= e!9978 e!9979)))

(declare-fun res!12117 () Bool)

(assert (=> b!16221 (=> (not res!12117) (not e!9979))))

(declare-fun dynLambda!125 (Int tuple2!678) Bool)

(assert (=> b!16221 (= res!12117 (dynLambda!125 p!191 (h!1084 (toList!270 (-!30 lm!221 a!507)))))))

(declare-fun b!16222 () Bool)

(assert (=> b!16222 (= e!9979 (forall!143 (t!3062 (toList!270 (-!30 lm!221 a!507))) p!191))))

(assert (= (and d!3043 (not res!12116)) b!16221))

(assert (= (and b!16221 res!12117) b!16222))

(declare-fun b_lambda!1253 () Bool)

(assert (=> (not b_lambda!1253) (not b!16221)))

(declare-fun t!3072 () Bool)

(declare-fun tb!537 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3072) tb!537))

(declare-fun result!903 () Bool)

(assert (=> tb!537 (= result!903 true)))

(assert (=> b!16221 t!3072))

(declare-fun b_and!1125 () Bool)

(assert (= b_and!1113 (and (=> t!3072 result!903) b_and!1125)))

(declare-fun m!11249 () Bool)

(assert (=> b!16221 m!11249))

(declare-fun m!11251 () Bool)

(assert (=> b!16222 m!11251))

(assert (=> b!16177 d!3043))

(declare-fun d!3051 () Bool)

(declare-fun lt!3982 () ListLongMap!509)

(assert (=> d!3051 (not (contains!201 lt!3982 a!507))))

(assert (=> d!3051 (= lt!3982 (ListLongMap!510 (removeStrictlySorted!15 (toList!270 lt!3965) a!507)))))

(assert (=> d!3051 (= (-!30 lt!3965 a!507) lt!3982)))

(declare-fun bs!763 () Bool)

(assert (= bs!763 d!3051))

(declare-fun m!11255 () Bool)

(assert (=> bs!763 m!11255))

(declare-fun m!11257 () Bool)

(assert (=> bs!763 m!11257))

(assert (=> b!16177 d!3051))

(declare-fun d!3055 () Bool)

(declare-fun res!12118 () Bool)

(declare-fun e!9980 () Bool)

(assert (=> d!3055 (=> res!12118 e!9980)))

(assert (=> d!3055 (= res!12118 ((_ is Nil!519) (toList!270 (-!30 lt!3965 a!507))))))

(assert (=> d!3055 (= (forall!143 (toList!270 (-!30 lt!3965 a!507)) p!191) e!9980)))

(declare-fun b!16223 () Bool)

(declare-fun e!9981 () Bool)

(assert (=> b!16223 (= e!9980 e!9981)))

(declare-fun res!12119 () Bool)

(assert (=> b!16223 (=> (not res!12119) (not e!9981))))

(assert (=> b!16223 (= res!12119 (dynLambda!125 p!191 (h!1084 (toList!270 (-!30 lt!3965 a!507)))))))

(declare-fun b!16224 () Bool)

(assert (=> b!16224 (= e!9981 (forall!143 (t!3062 (toList!270 (-!30 lt!3965 a!507))) p!191))))

(assert (= (and d!3055 (not res!12118)) b!16223))

(assert (= (and b!16223 res!12119) b!16224))

(declare-fun b_lambda!1255 () Bool)

(assert (=> (not b_lambda!1255) (not b!16223)))

(declare-fun t!3074 () Bool)

(declare-fun tb!539 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3074) tb!539))

(declare-fun result!905 () Bool)

(assert (=> tb!539 (= result!905 true)))

(assert (=> b!16223 t!3074))

(declare-fun b_and!1127 () Bool)

(assert (= b_and!1125 (and (=> t!3074 result!905) b_and!1127)))

(declare-fun m!11259 () Bool)

(assert (=> b!16223 m!11259))

(declare-fun m!11261 () Bool)

(assert (=> b!16224 m!11261))

(assert (=> b!16177 d!3055))

(declare-fun d!3057 () Bool)

(assert (=> d!3057 (forall!143 (toList!270 (-!30 lt!3965 a!507)) p!191)))

(declare-fun lt!3988 () Unit!328)

(declare-fun choose!182 (ListLongMap!509 Int (_ BitVec 64)) Unit!328)

(assert (=> d!3057 (= lt!3988 (choose!182 lt!3965 p!191 a!507))))

(assert (=> d!3057 (forall!143 (toList!270 lt!3965) p!191)))

(assert (=> d!3057 (= (removeValidProp!20 lt!3965 p!191 a!507) lt!3988)))

(declare-fun bs!766 () Bool)

(assert (= bs!766 d!3057))

(assert (=> bs!766 m!11173))

(assert (=> bs!766 m!11175))

(declare-fun m!11269 () Bool)

(assert (=> bs!766 m!11269))

(assert (=> bs!766 m!11181))

(assert (=> b!16177 d!3057))

(declare-fun d!3063 () Bool)

(declare-fun res!12122 () Bool)

(declare-fun e!9984 () Bool)

(assert (=> d!3063 (=> res!12122 e!9984)))

(assert (=> d!3063 (= res!12122 ((_ is Nil!519) (toList!270 lt!3965)))))

(assert (=> d!3063 (= (forall!143 (toList!270 lt!3965) p!191) e!9984)))

(declare-fun b!16227 () Bool)

(declare-fun e!9985 () Bool)

(assert (=> b!16227 (= e!9984 e!9985)))

(declare-fun res!12123 () Bool)

(assert (=> b!16227 (=> (not res!12123) (not e!9985))))

(assert (=> b!16227 (= res!12123 (dynLambda!125 p!191 (h!1084 (toList!270 lt!3965))))))

(declare-fun b!16228 () Bool)

(assert (=> b!16228 (= e!9985 (forall!143 (t!3062 (toList!270 lt!3965)) p!191))))

(assert (= (and d!3063 (not res!12122)) b!16227))

(assert (= (and b!16227 res!12123) b!16228))

(declare-fun b_lambda!1259 () Bool)

(assert (=> (not b_lambda!1259) (not b!16227)))

(declare-fun t!3078 () Bool)

(declare-fun tb!543 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3078) tb!543))

(declare-fun result!909 () Bool)

(assert (=> tb!543 (= result!909 true)))

(assert (=> b!16227 t!3078))

(declare-fun b_and!1131 () Bool)

(assert (= b_and!1127 (and (=> t!3078 result!909) b_and!1131)))

(declare-fun m!11275 () Bool)

(assert (=> b!16227 m!11275))

(declare-fun m!11277 () Bool)

(assert (=> b!16228 m!11277))

(assert (=> b!16176 d!3063))

(declare-fun d!3067 () Bool)

(declare-fun tail!83 (List!522) List!522)

(assert (=> d!3067 (= (tail!80 lm!221) (ListLongMap!510 (tail!83 (toList!270 lm!221))))))

(declare-fun bs!767 () Bool)

(assert (= bs!767 d!3067))

(declare-fun m!11283 () Bool)

(assert (=> bs!767 m!11283))

(assert (=> b!16176 d!3067))

(declare-fun d!3071 () Bool)

(declare-fun isEmpty!159 (List!522) Bool)

(assert (=> d!3071 (= (isEmpty!156 lm!221) (isEmpty!159 (toList!270 lm!221)))))

(declare-fun bs!768 () Bool)

(assert (= bs!768 d!3071))

(declare-fun m!11285 () Bool)

(assert (=> bs!768 m!11285))

(assert (=> b!16175 d!3071))

(declare-fun d!3073 () Bool)

(declare-fun res!12126 () Bool)

(declare-fun e!9988 () Bool)

(assert (=> d!3073 (=> res!12126 e!9988)))

(assert (=> d!3073 (= res!12126 ((_ is Nil!519) (toList!270 lm!221)))))

(assert (=> d!3073 (= (forall!143 (toList!270 lm!221) p!191) e!9988)))

(declare-fun b!16231 () Bool)

(declare-fun e!9989 () Bool)

(assert (=> b!16231 (= e!9988 e!9989)))

(declare-fun res!12127 () Bool)

(assert (=> b!16231 (=> (not res!12127) (not e!9989))))

(assert (=> b!16231 (= res!12127 (dynLambda!125 p!191 (h!1084 (toList!270 lm!221))))))

(declare-fun b!16232 () Bool)

(assert (=> b!16232 (= e!9989 (forall!143 (t!3062 (toList!270 lm!221)) p!191))))

(assert (= (and d!3073 (not res!12126)) b!16231))

(assert (= (and b!16231 res!12127) b!16232))

(declare-fun b_lambda!1263 () Bool)

(assert (=> (not b_lambda!1263) (not b!16231)))

(declare-fun t!3082 () Bool)

(declare-fun tb!547 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3082) tb!547))

(declare-fun result!913 () Bool)

(assert (=> tb!547 (= result!913 true)))

(assert (=> b!16231 t!3082))

(declare-fun b_and!1135 () Bool)

(assert (= b_and!1131 (and (=> t!3082 result!913) b_and!1135)))

(declare-fun m!11291 () Bool)

(assert (=> b!16231 m!11291))

(declare-fun m!11293 () Bool)

(assert (=> b!16232 m!11293))

(assert (=> start!2778 d!3073))

(declare-fun d!3077 () Bool)

(declare-fun isStrictlySorted!159 (List!522) Bool)

(assert (=> d!3077 (= (inv!888 lm!221) (isStrictlySorted!159 (toList!270 lm!221)))))

(declare-fun bs!770 () Bool)

(assert (= bs!770 d!3077))

(declare-fun m!11295 () Bool)

(assert (=> bs!770 m!11295))

(assert (=> start!2778 d!3077))

(declare-fun b!16241 () Bool)

(declare-fun e!9996 () Bool)

(declare-fun tp_is_empty!829 () Bool)

(declare-fun tp!2870 () Bool)

(assert (=> b!16241 (= e!9996 (and tp_is_empty!829 tp!2870))))

(assert (=> b!16178 (= tp!2855 e!9996)))

(assert (= (and b!16178 ((_ is Cons!518) (toList!270 lm!221))) b!16241))

(declare-fun b_lambda!1269 () Bool)

(assert (= b_lambda!1259 (or (and start!2778 b_free!565) b_lambda!1269)))

(declare-fun b_lambda!1271 () Bool)

(assert (= b_lambda!1263 (or (and start!2778 b_free!565) b_lambda!1271)))

(declare-fun b_lambda!1273 () Bool)

(assert (= b_lambda!1255 (or (and start!2778 b_free!565) b_lambda!1273)))

(declare-fun b_lambda!1275 () Bool)

(assert (= b_lambda!1253 (or (and start!2778 b_free!565) b_lambda!1275)))

(check-sat (not b_next!565) (not d!3067) (not b_lambda!1271) (not d!3037) (not b!16222) (not d!3071) (not b!16241) (not b_lambda!1269) (not b!16224) (not b_lambda!1275) (not b_lambda!1273) (not b!16228) b_and!1135 (not d!3077) tp_is_empty!829 (not d!3057) (not b!16232) (not d!3051))
(check-sat b_and!1135 (not b_next!565))
(get-model)

(declare-fun d!3093 () Bool)

(assert (=> d!3093 (= (isEmpty!159 (toList!270 lm!221)) ((_ is Nil!519) (toList!270 lm!221)))))

(assert (=> d!3071 d!3093))

(declare-fun d!3095 () Bool)

(declare-fun res!12134 () Bool)

(declare-fun e!10005 () Bool)

(assert (=> d!3095 (=> res!12134 e!10005)))

(assert (=> d!3095 (= res!12134 ((_ is Nil!519) (t!3062 (toList!270 lm!221))))))

(assert (=> d!3095 (= (forall!143 (t!3062 (toList!270 lm!221)) p!191) e!10005)))

(declare-fun b!16254 () Bool)

(declare-fun e!10006 () Bool)

(assert (=> b!16254 (= e!10005 e!10006)))

(declare-fun res!12135 () Bool)

(assert (=> b!16254 (=> (not res!12135) (not e!10006))))

(assert (=> b!16254 (= res!12135 (dynLambda!125 p!191 (h!1084 (t!3062 (toList!270 lm!221)))))))

(declare-fun b!16255 () Bool)

(assert (=> b!16255 (= e!10006 (forall!143 (t!3062 (t!3062 (toList!270 lm!221))) p!191))))

(assert (= (and d!3095 (not res!12134)) b!16254))

(assert (= (and b!16254 res!12135) b!16255))

(declare-fun b_lambda!1295 () Bool)

(assert (=> (not b_lambda!1295) (not b!16254)))

(declare-fun t!3090 () Bool)

(declare-fun tb!555 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3090) tb!555))

(declare-fun result!927 () Bool)

(assert (=> tb!555 (= result!927 true)))

(assert (=> b!16254 t!3090))

(declare-fun b_and!1143 () Bool)

(assert (= b_and!1135 (and (=> t!3090 result!927) b_and!1143)))

(declare-fun m!11325 () Bool)

(assert (=> b!16254 m!11325))

(declare-fun m!11327 () Bool)

(assert (=> b!16255 m!11327))

(assert (=> b!16232 d!3095))

(declare-fun d!3097 () Bool)

(declare-fun res!12136 () Bool)

(declare-fun e!10007 () Bool)

(assert (=> d!3097 (=> res!12136 e!10007)))

(assert (=> d!3097 (= res!12136 ((_ is Nil!519) (t!3062 (toList!270 (-!30 lm!221 a!507)))))))

(assert (=> d!3097 (= (forall!143 (t!3062 (toList!270 (-!30 lm!221 a!507))) p!191) e!10007)))

(declare-fun b!16256 () Bool)

(declare-fun e!10008 () Bool)

(assert (=> b!16256 (= e!10007 e!10008)))

(declare-fun res!12137 () Bool)

(assert (=> b!16256 (=> (not res!12137) (not e!10008))))

(assert (=> b!16256 (= res!12137 (dynLambda!125 p!191 (h!1084 (t!3062 (toList!270 (-!30 lm!221 a!507))))))))

(declare-fun b!16257 () Bool)

(assert (=> b!16257 (= e!10008 (forall!143 (t!3062 (t!3062 (toList!270 (-!30 lm!221 a!507)))) p!191))))

(assert (= (and d!3097 (not res!12136)) b!16256))

(assert (= (and b!16256 res!12137) b!16257))

(declare-fun b_lambda!1297 () Bool)

(assert (=> (not b_lambda!1297) (not b!16256)))

(declare-fun t!3092 () Bool)

(declare-fun tb!557 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3092) tb!557))

(declare-fun result!929 () Bool)

(assert (=> tb!557 (= result!929 true)))

(assert (=> b!16256 t!3092))

(declare-fun b_and!1145 () Bool)

(assert (= b_and!1143 (and (=> t!3092 result!929) b_and!1145)))

(declare-fun m!11329 () Bool)

(assert (=> b!16256 m!11329))

(declare-fun m!11331 () Bool)

(assert (=> b!16257 m!11331))

(assert (=> b!16222 d!3097))

(declare-fun d!3099 () Bool)

(declare-fun e!10013 () Bool)

(assert (=> d!3099 e!10013))

(declare-fun res!12140 () Bool)

(assert (=> d!3099 (=> res!12140 e!10013)))

(declare-fun lt!4011 () Bool)

(assert (=> d!3099 (= res!12140 (not lt!4011))))

(declare-fun lt!4008 () Bool)

(assert (=> d!3099 (= lt!4011 lt!4008)))

(declare-fun lt!4009 () Unit!328)

(declare-fun e!10014 () Unit!328)

(assert (=> d!3099 (= lt!4009 e!10014)))

(declare-fun c!1523 () Bool)

(assert (=> d!3099 (= c!1523 lt!4008)))

(declare-fun containsKey!17 (List!522 (_ BitVec 64)) Bool)

(assert (=> d!3099 (= lt!4008 (containsKey!17 (toList!270 lt!3982) a!507))))

(assert (=> d!3099 (= (contains!201 lt!3982 a!507) lt!4011)))

(declare-fun b!16264 () Bool)

(declare-fun lt!4010 () Unit!328)

(assert (=> b!16264 (= e!10014 lt!4010)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!14 (List!522 (_ BitVec 64)) Unit!328)

(assert (=> b!16264 (= lt!4010 (lemmaContainsKeyImpliesGetValueByKeyDefined!14 (toList!270 lt!3982) a!507))))

(declare-datatypes ((Option!59 0))(
  ( (Some!58 (v!1388 B!686)) (None!57) )
))
(declare-fun isDefined!15 (Option!59) Bool)

(declare-fun getValueByKey!53 (List!522 (_ BitVec 64)) Option!59)

(assert (=> b!16264 (isDefined!15 (getValueByKey!53 (toList!270 lt!3982) a!507))))

(declare-fun b!16265 () Bool)

(declare-fun Unit!334 () Unit!328)

(assert (=> b!16265 (= e!10014 Unit!334)))

(declare-fun b!16266 () Bool)

(assert (=> b!16266 (= e!10013 (isDefined!15 (getValueByKey!53 (toList!270 lt!3982) a!507)))))

(assert (= (and d!3099 c!1523) b!16264))

(assert (= (and d!3099 (not c!1523)) b!16265))

(assert (= (and d!3099 (not res!12140)) b!16266))

(declare-fun m!11333 () Bool)

(assert (=> d!3099 m!11333))

(declare-fun m!11335 () Bool)

(assert (=> b!16264 m!11335))

(declare-fun m!11337 () Bool)

(assert (=> b!16264 m!11337))

(assert (=> b!16264 m!11337))

(declare-fun m!11339 () Bool)

(assert (=> b!16264 m!11339))

(assert (=> b!16266 m!11337))

(assert (=> b!16266 m!11337))

(assert (=> b!16266 m!11339))

(assert (=> d!3051 d!3099))

(declare-fun b!16277 () Bool)

(declare-fun e!10022 () List!522)

(assert (=> b!16277 (= e!10022 Nil!519)))

(declare-fun d!3101 () Bool)

(declare-fun e!10021 () Bool)

(assert (=> d!3101 e!10021))

(declare-fun res!12143 () Bool)

(assert (=> d!3101 (=> (not res!12143) (not e!10021))))

(declare-fun lt!4014 () List!522)

(assert (=> d!3101 (= res!12143 (isStrictlySorted!159 lt!4014))))

(declare-fun e!10023 () List!522)

(assert (=> d!3101 (= lt!4014 e!10023)))

(declare-fun c!1528 () Bool)

(assert (=> d!3101 (= c!1528 (and ((_ is Cons!518) (toList!270 lt!3965)) (= (_1!339 (h!1084 (toList!270 lt!3965))) a!507)))))

(assert (=> d!3101 (isStrictlySorted!159 (toList!270 lt!3965))))

(assert (=> d!3101 (= (removeStrictlySorted!15 (toList!270 lt!3965) a!507) lt!4014)))

(declare-fun b!16278 () Bool)

(assert (=> b!16278 (= e!10021 (not (containsKey!17 lt!4014 a!507)))))

(declare-fun b!16279 () Bool)

(assert (=> b!16279 (= e!10023 (t!3062 (toList!270 lt!3965)))))

(declare-fun b!16280 () Bool)

(declare-fun $colon$colon!24 (List!522 tuple2!678) List!522)

(assert (=> b!16280 (= e!10022 ($colon$colon!24 (removeStrictlySorted!15 (t!3062 (toList!270 lt!3965)) a!507) (h!1084 (toList!270 lt!3965))))))

(declare-fun b!16281 () Bool)

(assert (=> b!16281 (= e!10023 e!10022)))

(declare-fun c!1529 () Bool)

(assert (=> b!16281 (= c!1529 (and ((_ is Cons!518) (toList!270 lt!3965)) (not (= (_1!339 (h!1084 (toList!270 lt!3965))) a!507))))))

(assert (= (and d!3101 c!1528) b!16279))

(assert (= (and d!3101 (not c!1528)) b!16281))

(assert (= (and b!16281 c!1529) b!16280))

(assert (= (and b!16281 (not c!1529)) b!16277))

(assert (= (and d!3101 res!12143) b!16278))

(declare-fun m!11341 () Bool)

(assert (=> d!3101 m!11341))

(declare-fun m!11343 () Bool)

(assert (=> d!3101 m!11343))

(declare-fun m!11345 () Bool)

(assert (=> b!16278 m!11345))

(declare-fun m!11347 () Bool)

(assert (=> b!16280 m!11347))

(assert (=> b!16280 m!11347))

(declare-fun m!11349 () Bool)

(assert (=> b!16280 m!11349))

(assert (=> d!3051 d!3101))

(declare-fun d!3105 () Bool)

(declare-fun res!12144 () Bool)

(declare-fun e!10024 () Bool)

(assert (=> d!3105 (=> res!12144 e!10024)))

(assert (=> d!3105 (= res!12144 ((_ is Nil!519) (t!3062 (toList!270 (-!30 lt!3965 a!507)))))))

(assert (=> d!3105 (= (forall!143 (t!3062 (toList!270 (-!30 lt!3965 a!507))) p!191) e!10024)))

(declare-fun b!16282 () Bool)

(declare-fun e!10025 () Bool)

(assert (=> b!16282 (= e!10024 e!10025)))

(declare-fun res!12145 () Bool)

(assert (=> b!16282 (=> (not res!12145) (not e!10025))))

(assert (=> b!16282 (= res!12145 (dynLambda!125 p!191 (h!1084 (t!3062 (toList!270 (-!30 lt!3965 a!507))))))))

(declare-fun b!16283 () Bool)

(assert (=> b!16283 (= e!10025 (forall!143 (t!3062 (t!3062 (toList!270 (-!30 lt!3965 a!507)))) p!191))))

(assert (= (and d!3105 (not res!12144)) b!16282))

(assert (= (and b!16282 res!12145) b!16283))

(declare-fun b_lambda!1299 () Bool)

(assert (=> (not b_lambda!1299) (not b!16282)))

(declare-fun t!3094 () Bool)

(declare-fun tb!559 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3094) tb!559))

(declare-fun result!931 () Bool)

(assert (=> tb!559 (= result!931 true)))

(assert (=> b!16282 t!3094))

(declare-fun b_and!1147 () Bool)

(assert (= b_and!1145 (and (=> t!3094 result!931) b_and!1147)))

(declare-fun m!11351 () Bool)

(assert (=> b!16282 m!11351))

(declare-fun m!11353 () Bool)

(assert (=> b!16283 m!11353))

(assert (=> b!16224 d!3105))

(assert (=> d!3057 d!3055))

(assert (=> d!3057 d!3051))

(declare-fun d!3107 () Bool)

(assert (=> d!3107 (forall!143 (toList!270 (-!30 lt!3965 a!507)) p!191)))

(assert (=> d!3107 true))

(declare-fun _$31!20 () Unit!328)

(assert (=> d!3107 (= (choose!182 lt!3965 p!191 a!507) _$31!20)))

(declare-fun bs!778 () Bool)

(assert (= bs!778 d!3107))

(assert (=> bs!778 m!11173))

(assert (=> bs!778 m!11175))

(assert (=> d!3057 d!3107))

(assert (=> d!3057 d!3063))

(declare-fun d!3111 () Bool)

(assert (=> d!3111 (= (tail!83 (toList!270 lm!221)) (t!3062 (toList!270 lm!221)))))

(assert (=> d!3067 d!3111))

(declare-fun d!3113 () Bool)

(declare-fun res!12146 () Bool)

(declare-fun e!10026 () Bool)

(assert (=> d!3113 (=> res!12146 e!10026)))

(assert (=> d!3113 (= res!12146 ((_ is Nil!519) (t!3062 (toList!270 lt!3965))))))

(assert (=> d!3113 (= (forall!143 (t!3062 (toList!270 lt!3965)) p!191) e!10026)))

(declare-fun b!16284 () Bool)

(declare-fun e!10027 () Bool)

(assert (=> b!16284 (= e!10026 e!10027)))

(declare-fun res!12147 () Bool)

(assert (=> b!16284 (=> (not res!12147) (not e!10027))))

(assert (=> b!16284 (= res!12147 (dynLambda!125 p!191 (h!1084 (t!3062 (toList!270 lt!3965)))))))

(declare-fun b!16285 () Bool)

(assert (=> b!16285 (= e!10027 (forall!143 (t!3062 (t!3062 (toList!270 lt!3965))) p!191))))

(assert (= (and d!3113 (not res!12146)) b!16284))

(assert (= (and b!16284 res!12147) b!16285))

(declare-fun b_lambda!1301 () Bool)

(assert (=> (not b_lambda!1301) (not b!16284)))

(declare-fun t!3096 () Bool)

(declare-fun tb!561 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3096) tb!561))

(declare-fun result!933 () Bool)

(assert (=> tb!561 (= result!933 true)))

(assert (=> b!16284 t!3096))

(declare-fun b_and!1149 () Bool)

(assert (= b_and!1147 (and (=> t!3096 result!933) b_and!1149)))

(declare-fun m!11355 () Bool)

(assert (=> b!16284 m!11355))

(declare-fun m!11357 () Bool)

(assert (=> b!16285 m!11357))

(assert (=> b!16228 d!3113))

(declare-fun d!3115 () Bool)

(declare-fun res!12152 () Bool)

(declare-fun e!10032 () Bool)

(assert (=> d!3115 (=> res!12152 e!10032)))

(assert (=> d!3115 (= res!12152 (or ((_ is Nil!519) (toList!270 lm!221)) ((_ is Nil!519) (t!3062 (toList!270 lm!221)))))))

(assert (=> d!3115 (= (isStrictlySorted!159 (toList!270 lm!221)) e!10032)))

(declare-fun b!16290 () Bool)

(declare-fun e!10033 () Bool)

(assert (=> b!16290 (= e!10032 e!10033)))

(declare-fun res!12153 () Bool)

(assert (=> b!16290 (=> (not res!12153) (not e!10033))))

(assert (=> b!16290 (= res!12153 (bvslt (_1!339 (h!1084 (toList!270 lm!221))) (_1!339 (h!1084 (t!3062 (toList!270 lm!221))))))))

(declare-fun b!16291 () Bool)

(assert (=> b!16291 (= e!10033 (isStrictlySorted!159 (t!3062 (toList!270 lm!221))))))

(assert (= (and d!3115 (not res!12152)) b!16290))

(assert (= (and b!16290 res!12153) b!16291))

(declare-fun m!11359 () Bool)

(assert (=> b!16291 m!11359))

(assert (=> d!3077 d!3115))

(declare-fun d!3117 () Bool)

(declare-fun e!10036 () Bool)

(assert (=> d!3117 e!10036))

(declare-fun res!12154 () Bool)

(assert (=> d!3117 (=> res!12154 e!10036)))

(declare-fun lt!4024 () Bool)

(assert (=> d!3117 (= res!12154 (not lt!4024))))

(declare-fun lt!4021 () Bool)

(assert (=> d!3117 (= lt!4024 lt!4021)))

(declare-fun lt!4022 () Unit!328)

(declare-fun e!10037 () Unit!328)

(assert (=> d!3117 (= lt!4022 e!10037)))

(declare-fun c!1532 () Bool)

(assert (=> d!3117 (= c!1532 lt!4021)))

(assert (=> d!3117 (= lt!4021 (containsKey!17 (toList!270 lt!3981) a!507))))

(assert (=> d!3117 (= (contains!201 lt!3981 a!507) lt!4024)))

(declare-fun b!16296 () Bool)

(declare-fun lt!4023 () Unit!328)

(assert (=> b!16296 (= e!10037 lt!4023)))

(assert (=> b!16296 (= lt!4023 (lemmaContainsKeyImpliesGetValueByKeyDefined!14 (toList!270 lt!3981) a!507))))

(assert (=> b!16296 (isDefined!15 (getValueByKey!53 (toList!270 lt!3981) a!507))))

(declare-fun b!16297 () Bool)

(declare-fun Unit!335 () Unit!328)

(assert (=> b!16297 (= e!10037 Unit!335)))

(declare-fun b!16298 () Bool)

(assert (=> b!16298 (= e!10036 (isDefined!15 (getValueByKey!53 (toList!270 lt!3981) a!507)))))

(assert (= (and d!3117 c!1532) b!16296))

(assert (= (and d!3117 (not c!1532)) b!16297))

(assert (= (and d!3117 (not res!12154)) b!16298))

(declare-fun m!11361 () Bool)

(assert (=> d!3117 m!11361))

(declare-fun m!11363 () Bool)

(assert (=> b!16296 m!11363))

(declare-fun m!11365 () Bool)

(assert (=> b!16296 m!11365))

(assert (=> b!16296 m!11365))

(declare-fun m!11367 () Bool)

(assert (=> b!16296 m!11367))

(assert (=> b!16298 m!11365))

(assert (=> b!16298 m!11365))

(assert (=> b!16298 m!11367))

(assert (=> d!3037 d!3117))

(declare-fun b!16301 () Bool)

(declare-fun e!10041 () List!522)

(assert (=> b!16301 (= e!10041 Nil!519)))

(declare-fun d!3119 () Bool)

(declare-fun e!10040 () Bool)

(assert (=> d!3119 e!10040))

(declare-fun res!12157 () Bool)

(assert (=> d!3119 (=> (not res!12157) (not e!10040))))

(declare-fun lt!4027 () List!522)

(assert (=> d!3119 (= res!12157 (isStrictlySorted!159 lt!4027))))

(declare-fun e!10042 () List!522)

(assert (=> d!3119 (= lt!4027 e!10042)))

(declare-fun c!1533 () Bool)

(assert (=> d!3119 (= c!1533 (and ((_ is Cons!518) (toList!270 lm!221)) (= (_1!339 (h!1084 (toList!270 lm!221))) a!507)))))

(assert (=> d!3119 (isStrictlySorted!159 (toList!270 lm!221))))

(assert (=> d!3119 (= (removeStrictlySorted!15 (toList!270 lm!221) a!507) lt!4027)))

(declare-fun b!16302 () Bool)

(assert (=> b!16302 (= e!10040 (not (containsKey!17 lt!4027 a!507)))))

(declare-fun b!16303 () Bool)

(assert (=> b!16303 (= e!10042 (t!3062 (toList!270 lm!221)))))

(declare-fun b!16304 () Bool)

(assert (=> b!16304 (= e!10041 ($colon$colon!24 (removeStrictlySorted!15 (t!3062 (toList!270 lm!221)) a!507) (h!1084 (toList!270 lm!221))))))

(declare-fun b!16305 () Bool)

(assert (=> b!16305 (= e!10042 e!10041)))

(declare-fun c!1534 () Bool)

(assert (=> b!16305 (= c!1534 (and ((_ is Cons!518) (toList!270 lm!221)) (not (= (_1!339 (h!1084 (toList!270 lm!221))) a!507))))))

(assert (= (and d!3119 c!1533) b!16303))

(assert (= (and d!3119 (not c!1533)) b!16305))

(assert (= (and b!16305 c!1534) b!16304))

(assert (= (and b!16305 (not c!1534)) b!16301))

(assert (= (and d!3119 res!12157) b!16302))

(declare-fun m!11369 () Bool)

(assert (=> d!3119 m!11369))

(assert (=> d!3119 m!11295))

(declare-fun m!11371 () Bool)

(assert (=> b!16302 m!11371))

(declare-fun m!11373 () Bool)

(assert (=> b!16304 m!11373))

(assert (=> b!16304 m!11373))

(declare-fun m!11375 () Bool)

(assert (=> b!16304 m!11375))

(assert (=> d!3037 d!3119))

(declare-fun b!16306 () Bool)

(declare-fun e!10043 () Bool)

(declare-fun tp!2877 () Bool)

(assert (=> b!16306 (= e!10043 (and tp_is_empty!829 tp!2877))))

(assert (=> b!16241 (= tp!2870 e!10043)))

(assert (= (and b!16241 ((_ is Cons!518) (t!3062 (toList!270 lm!221)))) b!16306))

(declare-fun b_lambda!1303 () Bool)

(assert (= b_lambda!1295 (or (and start!2778 b_free!565) b_lambda!1303)))

(declare-fun b_lambda!1305 () Bool)

(assert (= b_lambda!1297 (or (and start!2778 b_free!565) b_lambda!1305)))

(declare-fun b_lambda!1307 () Bool)

(assert (= b_lambda!1299 (or (and start!2778 b_free!565) b_lambda!1307)))

(declare-fun b_lambda!1309 () Bool)

(assert (= b_lambda!1301 (or (and start!2778 b_free!565) b_lambda!1309)))

(check-sat (not b_lambda!1303) b_and!1149 (not d!3119) (not b_lambda!1271) (not b!16266) (not b!16302) (not b!16304) (not b!16306) (not d!3099) (not d!3117) (not b!16285) (not b_lambda!1307) (not b!16298) (not b!16296) (not b_next!565) (not b!16278) tp_is_empty!829 (not d!3101) (not b!16257) (not b_lambda!1305) (not b!16291) (not d!3107) (not b_lambda!1309) (not b_lambda!1269) (not b!16280) (not b!16283) (not b_lambda!1275) (not b!16255) (not b_lambda!1273) (not b!16264))
(check-sat b_and!1149 (not b_next!565))
(get-model)

(declare-fun d!3165 () Bool)

(assert (=> d!3165 (isDefined!15 (getValueByKey!53 (toList!270 lt!3981) a!507))))

(declare-fun lt!4062 () Unit!328)

(declare-fun choose!185 (List!522 (_ BitVec 64)) Unit!328)

(assert (=> d!3165 (= lt!4062 (choose!185 (toList!270 lt!3981) a!507))))

(declare-fun e!10112 () Bool)

(assert (=> d!3165 e!10112))

(declare-fun res!12202 () Bool)

(assert (=> d!3165 (=> (not res!12202) (not e!10112))))

(assert (=> d!3165 (= res!12202 (isStrictlySorted!159 (toList!270 lt!3981)))))

(assert (=> d!3165 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!14 (toList!270 lt!3981) a!507) lt!4062)))

(declare-fun b!16397 () Bool)

(assert (=> b!16397 (= e!10112 (containsKey!17 (toList!270 lt!3981) a!507))))

(assert (= (and d!3165 res!12202) b!16397))

(assert (=> d!3165 m!11365))

(assert (=> d!3165 m!11365))

(assert (=> d!3165 m!11367))

(declare-fun m!11481 () Bool)

(assert (=> d!3165 m!11481))

(declare-fun m!11483 () Bool)

(assert (=> d!3165 m!11483))

(assert (=> b!16397 m!11361))

(assert (=> b!16296 d!3165))

(declare-fun d!3167 () Bool)

(declare-fun isEmpty!162 (Option!59) Bool)

(assert (=> d!3167 (= (isDefined!15 (getValueByKey!53 (toList!270 lt!3981) a!507)) (not (isEmpty!162 (getValueByKey!53 (toList!270 lt!3981) a!507))))))

(declare-fun bs!780 () Bool)

(assert (= bs!780 d!3167))

(assert (=> bs!780 m!11365))

(declare-fun m!11485 () Bool)

(assert (=> bs!780 m!11485))

(assert (=> b!16296 d!3167))

(declare-fun b!16406 () Bool)

(declare-fun e!10117 () Option!59)

(assert (=> b!16406 (= e!10117 (Some!58 (_2!339 (h!1084 (toList!270 lt!3981)))))))

(declare-fun b!16407 () Bool)

(declare-fun e!10118 () Option!59)

(assert (=> b!16407 (= e!10117 e!10118)))

(declare-fun c!1562 () Bool)

(assert (=> b!16407 (= c!1562 (and ((_ is Cons!518) (toList!270 lt!3981)) (not (= (_1!339 (h!1084 (toList!270 lt!3981))) a!507))))))

(declare-fun b!16409 () Bool)

(assert (=> b!16409 (= e!10118 None!57)))

(declare-fun b!16408 () Bool)

(assert (=> b!16408 (= e!10118 (getValueByKey!53 (t!3062 (toList!270 lt!3981)) a!507))))

(declare-fun d!3169 () Bool)

(declare-fun c!1561 () Bool)

(assert (=> d!3169 (= c!1561 (and ((_ is Cons!518) (toList!270 lt!3981)) (= (_1!339 (h!1084 (toList!270 lt!3981))) a!507)))))

(assert (=> d!3169 (= (getValueByKey!53 (toList!270 lt!3981) a!507) e!10117)))

(assert (= (and d!3169 c!1561) b!16406))

(assert (= (and d!3169 (not c!1561)) b!16407))

(assert (= (and b!16407 c!1562) b!16408))

(assert (= (and b!16407 (not c!1562)) b!16409))

(declare-fun m!11487 () Bool)

(assert (=> b!16408 m!11487))

(assert (=> b!16296 d!3169))

(declare-fun d!3171 () Bool)

(assert (=> d!3171 (= (isDefined!15 (getValueByKey!53 (toList!270 lt!3982) a!507)) (not (isEmpty!162 (getValueByKey!53 (toList!270 lt!3982) a!507))))))

(declare-fun bs!781 () Bool)

(assert (= bs!781 d!3171))

(assert (=> bs!781 m!11337))

(declare-fun m!11489 () Bool)

(assert (=> bs!781 m!11489))

(assert (=> b!16266 d!3171))

(declare-fun b!16410 () Bool)

(declare-fun e!10119 () Option!59)

(assert (=> b!16410 (= e!10119 (Some!58 (_2!339 (h!1084 (toList!270 lt!3982)))))))

(declare-fun b!16411 () Bool)

(declare-fun e!10120 () Option!59)

(assert (=> b!16411 (= e!10119 e!10120)))

(declare-fun c!1564 () Bool)

(assert (=> b!16411 (= c!1564 (and ((_ is Cons!518) (toList!270 lt!3982)) (not (= (_1!339 (h!1084 (toList!270 lt!3982))) a!507))))))

(declare-fun b!16413 () Bool)

(assert (=> b!16413 (= e!10120 None!57)))

(declare-fun b!16412 () Bool)

(assert (=> b!16412 (= e!10120 (getValueByKey!53 (t!3062 (toList!270 lt!3982)) a!507))))

(declare-fun d!3173 () Bool)

(declare-fun c!1563 () Bool)

(assert (=> d!3173 (= c!1563 (and ((_ is Cons!518) (toList!270 lt!3982)) (= (_1!339 (h!1084 (toList!270 lt!3982))) a!507)))))

(assert (=> d!3173 (= (getValueByKey!53 (toList!270 lt!3982) a!507) e!10119)))

(assert (= (and d!3173 c!1563) b!16410))

(assert (= (and d!3173 (not c!1563)) b!16411))

(assert (= (and b!16411 c!1564) b!16412))

(assert (= (and b!16411 (not c!1564)) b!16413))

(declare-fun m!11491 () Bool)

(assert (=> b!16412 m!11491))

(assert (=> b!16266 d!3173))

(declare-fun d!3175 () Bool)

(declare-fun res!12203 () Bool)

(declare-fun e!10121 () Bool)

(assert (=> d!3175 (=> res!12203 e!10121)))

(assert (=> d!3175 (= res!12203 ((_ is Nil!519) (t!3062 (t!3062 (toList!270 lm!221)))))))

(assert (=> d!3175 (= (forall!143 (t!3062 (t!3062 (toList!270 lm!221))) p!191) e!10121)))

(declare-fun b!16414 () Bool)

(declare-fun e!10122 () Bool)

(assert (=> b!16414 (= e!10121 e!10122)))

(declare-fun res!12204 () Bool)

(assert (=> b!16414 (=> (not res!12204) (not e!10122))))

(assert (=> b!16414 (= res!12204 (dynLambda!125 p!191 (h!1084 (t!3062 (t!3062 (toList!270 lm!221))))))))

(declare-fun b!16415 () Bool)

(assert (=> b!16415 (= e!10122 (forall!143 (t!3062 (t!3062 (t!3062 (toList!270 lm!221)))) p!191))))

(assert (= (and d!3175 (not res!12203)) b!16414))

(assert (= (and b!16414 res!12204) b!16415))

(declare-fun b_lambda!1343 () Bool)

(assert (=> (not b_lambda!1343) (not b!16414)))

(declare-fun t!3114 () Bool)

(declare-fun tb!579 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3114) tb!579))

(declare-fun result!951 () Bool)

(assert (=> tb!579 (= result!951 true)))

(assert (=> b!16414 t!3114))

(declare-fun b_and!1167 () Bool)

(assert (= b_and!1149 (and (=> t!3114 result!951) b_and!1167)))

(declare-fun m!11493 () Bool)

(assert (=> b!16414 m!11493))

(declare-fun m!11495 () Bool)

(assert (=> b!16415 m!11495))

(assert (=> b!16255 d!3175))

(declare-fun d!3177 () Bool)

(declare-fun res!12209 () Bool)

(declare-fun e!10127 () Bool)

(assert (=> d!3177 (=> res!12209 e!10127)))

(assert (=> d!3177 (= res!12209 (and ((_ is Cons!518) lt!4014) (= (_1!339 (h!1084 lt!4014)) a!507)))))

(assert (=> d!3177 (= (containsKey!17 lt!4014 a!507) e!10127)))

(declare-fun b!16420 () Bool)

(declare-fun e!10128 () Bool)

(assert (=> b!16420 (= e!10127 e!10128)))

(declare-fun res!12210 () Bool)

(assert (=> b!16420 (=> (not res!12210) (not e!10128))))

(assert (=> b!16420 (= res!12210 (and (or (not ((_ is Cons!518) lt!4014)) (bvsle (_1!339 (h!1084 lt!4014)) a!507)) ((_ is Cons!518) lt!4014) (bvslt (_1!339 (h!1084 lt!4014)) a!507)))))

(declare-fun b!16421 () Bool)

(assert (=> b!16421 (= e!10128 (containsKey!17 (t!3062 lt!4014) a!507))))

(assert (= (and d!3177 (not res!12209)) b!16420))

(assert (= (and b!16420 res!12210) b!16421))

(declare-fun m!11497 () Bool)

(assert (=> b!16421 m!11497))

(assert (=> b!16278 d!3177))

(declare-fun d!3179 () Bool)

(declare-fun res!12211 () Bool)

(declare-fun e!10129 () Bool)

(assert (=> d!3179 (=> res!12211 e!10129)))

(assert (=> d!3179 (= res!12211 ((_ is Nil!519) (t!3062 (t!3062 (toList!270 (-!30 lt!3965 a!507))))))))

(assert (=> d!3179 (= (forall!143 (t!3062 (t!3062 (toList!270 (-!30 lt!3965 a!507)))) p!191) e!10129)))

(declare-fun b!16422 () Bool)

(declare-fun e!10130 () Bool)

(assert (=> b!16422 (= e!10129 e!10130)))

(declare-fun res!12212 () Bool)

(assert (=> b!16422 (=> (not res!12212) (not e!10130))))

(assert (=> b!16422 (= res!12212 (dynLambda!125 p!191 (h!1084 (t!3062 (t!3062 (toList!270 (-!30 lt!3965 a!507)))))))))

(declare-fun b!16423 () Bool)

(assert (=> b!16423 (= e!10130 (forall!143 (t!3062 (t!3062 (t!3062 (toList!270 (-!30 lt!3965 a!507))))) p!191))))

(assert (= (and d!3179 (not res!12211)) b!16422))

(assert (= (and b!16422 res!12212) b!16423))

(declare-fun b_lambda!1345 () Bool)

(assert (=> (not b_lambda!1345) (not b!16422)))

(declare-fun t!3116 () Bool)

(declare-fun tb!581 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3116) tb!581))

(declare-fun result!953 () Bool)

(assert (=> tb!581 (= result!953 true)))

(assert (=> b!16422 t!3116))

(declare-fun b_and!1169 () Bool)

(assert (= b_and!1167 (and (=> t!3116 result!953) b_and!1169)))

(declare-fun m!11499 () Bool)

(assert (=> b!16422 m!11499))

(declare-fun m!11501 () Bool)

(assert (=> b!16423 m!11501))

(assert (=> b!16283 d!3179))

(declare-fun d!3181 () Bool)

(declare-fun res!12213 () Bool)

(declare-fun e!10131 () Bool)

(assert (=> d!3181 (=> res!12213 e!10131)))

(assert (=> d!3181 (= res!12213 ((_ is Nil!519) (t!3062 (t!3062 (toList!270 (-!30 lm!221 a!507))))))))

(assert (=> d!3181 (= (forall!143 (t!3062 (t!3062 (toList!270 (-!30 lm!221 a!507)))) p!191) e!10131)))

(declare-fun b!16424 () Bool)

(declare-fun e!10132 () Bool)

(assert (=> b!16424 (= e!10131 e!10132)))

(declare-fun res!12214 () Bool)

(assert (=> b!16424 (=> (not res!12214) (not e!10132))))

(assert (=> b!16424 (= res!12214 (dynLambda!125 p!191 (h!1084 (t!3062 (t!3062 (toList!270 (-!30 lm!221 a!507)))))))))

(declare-fun b!16425 () Bool)

(assert (=> b!16425 (= e!10132 (forall!143 (t!3062 (t!3062 (t!3062 (toList!270 (-!30 lm!221 a!507))))) p!191))))

(assert (= (and d!3181 (not res!12213)) b!16424))

(assert (= (and b!16424 res!12214) b!16425))

(declare-fun b_lambda!1347 () Bool)

(assert (=> (not b_lambda!1347) (not b!16424)))

(declare-fun t!3118 () Bool)

(declare-fun tb!583 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3118) tb!583))

(declare-fun result!955 () Bool)

(assert (=> tb!583 (= result!955 true)))

(assert (=> b!16424 t!3118))

(declare-fun b_and!1171 () Bool)

(assert (= b_and!1169 (and (=> t!3118 result!955) b_and!1171)))

(declare-fun m!11503 () Bool)

(assert (=> b!16424 m!11503))

(declare-fun m!11505 () Bool)

(assert (=> b!16425 m!11505))

(assert (=> b!16257 d!3181))

(declare-fun d!3183 () Bool)

(declare-fun res!12215 () Bool)

(declare-fun e!10133 () Bool)

(assert (=> d!3183 (=> res!12215 e!10133)))

(assert (=> d!3183 (= res!12215 (or ((_ is Nil!519) lt!4014) ((_ is Nil!519) (t!3062 lt!4014))))))

(assert (=> d!3183 (= (isStrictlySorted!159 lt!4014) e!10133)))

(declare-fun b!16426 () Bool)

(declare-fun e!10134 () Bool)

(assert (=> b!16426 (= e!10133 e!10134)))

(declare-fun res!12216 () Bool)

(assert (=> b!16426 (=> (not res!12216) (not e!10134))))

(assert (=> b!16426 (= res!12216 (bvslt (_1!339 (h!1084 lt!4014)) (_1!339 (h!1084 (t!3062 lt!4014)))))))

(declare-fun b!16427 () Bool)

(assert (=> b!16427 (= e!10134 (isStrictlySorted!159 (t!3062 lt!4014)))))

(assert (= (and d!3183 (not res!12215)) b!16426))

(assert (= (and b!16426 res!12216) b!16427))

(declare-fun m!11507 () Bool)

(assert (=> b!16427 m!11507))

(assert (=> d!3101 d!3183))

(declare-fun d!3185 () Bool)

(declare-fun res!12217 () Bool)

(declare-fun e!10135 () Bool)

(assert (=> d!3185 (=> res!12217 e!10135)))

(assert (=> d!3185 (= res!12217 (or ((_ is Nil!519) (toList!270 lt!3965)) ((_ is Nil!519) (t!3062 (toList!270 lt!3965)))))))

(assert (=> d!3185 (= (isStrictlySorted!159 (toList!270 lt!3965)) e!10135)))

(declare-fun b!16428 () Bool)

(declare-fun e!10136 () Bool)

(assert (=> b!16428 (= e!10135 e!10136)))

(declare-fun res!12218 () Bool)

(assert (=> b!16428 (=> (not res!12218) (not e!10136))))

(assert (=> b!16428 (= res!12218 (bvslt (_1!339 (h!1084 (toList!270 lt!3965))) (_1!339 (h!1084 (t!3062 (toList!270 lt!3965))))))))

(declare-fun b!16429 () Bool)

(assert (=> b!16429 (= e!10136 (isStrictlySorted!159 (t!3062 (toList!270 lt!3965))))))

(assert (= (and d!3185 (not res!12217)) b!16428))

(assert (= (and b!16428 res!12218) b!16429))

(declare-fun m!11509 () Bool)

(assert (=> b!16429 m!11509))

(assert (=> d!3101 d!3185))

(declare-fun d!3187 () Bool)

(assert (=> d!3187 (= ($colon$colon!24 (removeStrictlySorted!15 (t!3062 (toList!270 lm!221)) a!507) (h!1084 (toList!270 lm!221))) (Cons!518 (h!1084 (toList!270 lm!221)) (removeStrictlySorted!15 (t!3062 (toList!270 lm!221)) a!507)))))

(assert (=> b!16304 d!3187))

(declare-fun b!16430 () Bool)

(declare-fun e!10138 () List!522)

(assert (=> b!16430 (= e!10138 Nil!519)))

(declare-fun d!3189 () Bool)

(declare-fun e!10137 () Bool)

(assert (=> d!3189 e!10137))

(declare-fun res!12219 () Bool)

(assert (=> d!3189 (=> (not res!12219) (not e!10137))))

(declare-fun lt!4063 () List!522)

(assert (=> d!3189 (= res!12219 (isStrictlySorted!159 lt!4063))))

(declare-fun e!10139 () List!522)

(assert (=> d!3189 (= lt!4063 e!10139)))

(declare-fun c!1565 () Bool)

(assert (=> d!3189 (= c!1565 (and ((_ is Cons!518) (t!3062 (toList!270 lm!221))) (= (_1!339 (h!1084 (t!3062 (toList!270 lm!221)))) a!507)))))

(assert (=> d!3189 (isStrictlySorted!159 (t!3062 (toList!270 lm!221)))))

(assert (=> d!3189 (= (removeStrictlySorted!15 (t!3062 (toList!270 lm!221)) a!507) lt!4063)))

(declare-fun b!16431 () Bool)

(assert (=> b!16431 (= e!10137 (not (containsKey!17 lt!4063 a!507)))))

(declare-fun b!16432 () Bool)

(assert (=> b!16432 (= e!10139 (t!3062 (t!3062 (toList!270 lm!221))))))

(declare-fun b!16433 () Bool)

(assert (=> b!16433 (= e!10138 ($colon$colon!24 (removeStrictlySorted!15 (t!3062 (t!3062 (toList!270 lm!221))) a!507) (h!1084 (t!3062 (toList!270 lm!221)))))))

(declare-fun b!16434 () Bool)

(assert (=> b!16434 (= e!10139 e!10138)))

(declare-fun c!1566 () Bool)

(assert (=> b!16434 (= c!1566 (and ((_ is Cons!518) (t!3062 (toList!270 lm!221))) (not (= (_1!339 (h!1084 (t!3062 (toList!270 lm!221)))) a!507))))))

(assert (= (and d!3189 c!1565) b!16432))

(assert (= (and d!3189 (not c!1565)) b!16434))

(assert (= (and b!16434 c!1566) b!16433))

(assert (= (and b!16434 (not c!1566)) b!16430))

(assert (= (and d!3189 res!12219) b!16431))

(declare-fun m!11511 () Bool)

(assert (=> d!3189 m!11511))

(assert (=> d!3189 m!11359))

(declare-fun m!11513 () Bool)

(assert (=> b!16431 m!11513))

(declare-fun m!11515 () Bool)

(assert (=> b!16433 m!11515))

(assert (=> b!16433 m!11515))

(declare-fun m!11517 () Bool)

(assert (=> b!16433 m!11517))

(assert (=> b!16304 d!3189))

(declare-fun d!3191 () Bool)

(assert (=> d!3191 (= ($colon$colon!24 (removeStrictlySorted!15 (t!3062 (toList!270 lt!3965)) a!507) (h!1084 (toList!270 lt!3965))) (Cons!518 (h!1084 (toList!270 lt!3965)) (removeStrictlySorted!15 (t!3062 (toList!270 lt!3965)) a!507)))))

(assert (=> b!16280 d!3191))

(declare-fun b!16435 () Bool)

(declare-fun e!10141 () List!522)

(assert (=> b!16435 (= e!10141 Nil!519)))

(declare-fun d!3193 () Bool)

(declare-fun e!10140 () Bool)

(assert (=> d!3193 e!10140))

(declare-fun res!12220 () Bool)

(assert (=> d!3193 (=> (not res!12220) (not e!10140))))

(declare-fun lt!4064 () List!522)

(assert (=> d!3193 (= res!12220 (isStrictlySorted!159 lt!4064))))

(declare-fun e!10142 () List!522)

(assert (=> d!3193 (= lt!4064 e!10142)))

(declare-fun c!1567 () Bool)

(assert (=> d!3193 (= c!1567 (and ((_ is Cons!518) (t!3062 (toList!270 lt!3965))) (= (_1!339 (h!1084 (t!3062 (toList!270 lt!3965)))) a!507)))))

(assert (=> d!3193 (isStrictlySorted!159 (t!3062 (toList!270 lt!3965)))))

(assert (=> d!3193 (= (removeStrictlySorted!15 (t!3062 (toList!270 lt!3965)) a!507) lt!4064)))

(declare-fun b!16436 () Bool)

(assert (=> b!16436 (= e!10140 (not (containsKey!17 lt!4064 a!507)))))

(declare-fun b!16437 () Bool)

(assert (=> b!16437 (= e!10142 (t!3062 (t!3062 (toList!270 lt!3965))))))

(declare-fun b!16438 () Bool)

(assert (=> b!16438 (= e!10141 ($colon$colon!24 (removeStrictlySorted!15 (t!3062 (t!3062 (toList!270 lt!3965))) a!507) (h!1084 (t!3062 (toList!270 lt!3965)))))))

(declare-fun b!16439 () Bool)

(assert (=> b!16439 (= e!10142 e!10141)))

(declare-fun c!1568 () Bool)

(assert (=> b!16439 (= c!1568 (and ((_ is Cons!518) (t!3062 (toList!270 lt!3965))) (not (= (_1!339 (h!1084 (t!3062 (toList!270 lt!3965)))) a!507))))))

(assert (= (and d!3193 c!1567) b!16437))

(assert (= (and d!3193 (not c!1567)) b!16439))

(assert (= (and b!16439 c!1568) b!16438))

(assert (= (and b!16439 (not c!1568)) b!16435))

(assert (= (and d!3193 res!12220) b!16436))

(declare-fun m!11519 () Bool)

(assert (=> d!3193 m!11519))

(assert (=> d!3193 m!11509))

(declare-fun m!11521 () Bool)

(assert (=> b!16436 m!11521))

(declare-fun m!11523 () Bool)

(assert (=> b!16438 m!11523))

(assert (=> b!16438 m!11523))

(declare-fun m!11525 () Bool)

(assert (=> b!16438 m!11525))

(assert (=> b!16280 d!3193))

(declare-fun d!3195 () Bool)

(declare-fun res!12221 () Bool)

(declare-fun e!10143 () Bool)

(assert (=> d!3195 (=> res!12221 e!10143)))

(assert (=> d!3195 (= res!12221 (or ((_ is Nil!519) lt!4027) ((_ is Nil!519) (t!3062 lt!4027))))))

(assert (=> d!3195 (= (isStrictlySorted!159 lt!4027) e!10143)))

(declare-fun b!16440 () Bool)

(declare-fun e!10144 () Bool)

(assert (=> b!16440 (= e!10143 e!10144)))

(declare-fun res!12222 () Bool)

(assert (=> b!16440 (=> (not res!12222) (not e!10144))))

(assert (=> b!16440 (= res!12222 (bvslt (_1!339 (h!1084 lt!4027)) (_1!339 (h!1084 (t!3062 lt!4027)))))))

(declare-fun b!16441 () Bool)

(assert (=> b!16441 (= e!10144 (isStrictlySorted!159 (t!3062 lt!4027)))))

(assert (= (and d!3195 (not res!12221)) b!16440))

(assert (= (and b!16440 res!12222) b!16441))

(declare-fun m!11527 () Bool)

(assert (=> b!16441 m!11527))

(assert (=> d!3119 d!3195))

(assert (=> d!3119 d!3115))

(declare-fun d!3197 () Bool)

(declare-fun res!12223 () Bool)

(declare-fun e!10145 () Bool)

(assert (=> d!3197 (=> res!12223 e!10145)))

(assert (=> d!3197 (= res!12223 (or ((_ is Nil!519) (t!3062 (toList!270 lm!221))) ((_ is Nil!519) (t!3062 (t!3062 (toList!270 lm!221))))))))

(assert (=> d!3197 (= (isStrictlySorted!159 (t!3062 (toList!270 lm!221))) e!10145)))

(declare-fun b!16442 () Bool)

(declare-fun e!10146 () Bool)

(assert (=> b!16442 (= e!10145 e!10146)))

(declare-fun res!12224 () Bool)

(assert (=> b!16442 (=> (not res!12224) (not e!10146))))

(assert (=> b!16442 (= res!12224 (bvslt (_1!339 (h!1084 (t!3062 (toList!270 lm!221)))) (_1!339 (h!1084 (t!3062 (t!3062 (toList!270 lm!221)))))))))

(declare-fun b!16443 () Bool)

(assert (=> b!16443 (= e!10146 (isStrictlySorted!159 (t!3062 (t!3062 (toList!270 lm!221)))))))

(assert (= (and d!3197 (not res!12223)) b!16442))

(assert (= (and b!16442 res!12224) b!16443))

(declare-fun m!11529 () Bool)

(assert (=> b!16443 m!11529))

(assert (=> b!16291 d!3197))

(assert (=> b!16298 d!3167))

(assert (=> b!16298 d!3169))

(assert (=> d!3107 d!3055))

(assert (=> d!3107 d!3051))

(declare-fun d!3199 () Bool)

(declare-fun res!12225 () Bool)

(declare-fun e!10147 () Bool)

(assert (=> d!3199 (=> res!12225 e!10147)))

(assert (=> d!3199 (= res!12225 (and ((_ is Cons!518) (toList!270 lt!3982)) (= (_1!339 (h!1084 (toList!270 lt!3982))) a!507)))))

(assert (=> d!3199 (= (containsKey!17 (toList!270 lt!3982) a!507) e!10147)))

(declare-fun b!16444 () Bool)

(declare-fun e!10148 () Bool)

(assert (=> b!16444 (= e!10147 e!10148)))

(declare-fun res!12226 () Bool)

(assert (=> b!16444 (=> (not res!12226) (not e!10148))))

(assert (=> b!16444 (= res!12226 (and (or (not ((_ is Cons!518) (toList!270 lt!3982))) (bvsle (_1!339 (h!1084 (toList!270 lt!3982))) a!507)) ((_ is Cons!518) (toList!270 lt!3982)) (bvslt (_1!339 (h!1084 (toList!270 lt!3982))) a!507)))))

(declare-fun b!16445 () Bool)

(assert (=> b!16445 (= e!10148 (containsKey!17 (t!3062 (toList!270 lt!3982)) a!507))))

(assert (= (and d!3199 (not res!12225)) b!16444))

(assert (= (and b!16444 res!12226) b!16445))

(declare-fun m!11531 () Bool)

(assert (=> b!16445 m!11531))

(assert (=> d!3099 d!3199))

(declare-fun d!3201 () Bool)

(declare-fun res!12227 () Bool)

(declare-fun e!10149 () Bool)

(assert (=> d!3201 (=> res!12227 e!10149)))

(assert (=> d!3201 (= res!12227 (and ((_ is Cons!518) lt!4027) (= (_1!339 (h!1084 lt!4027)) a!507)))))

(assert (=> d!3201 (= (containsKey!17 lt!4027 a!507) e!10149)))

(declare-fun b!16446 () Bool)

(declare-fun e!10150 () Bool)

(assert (=> b!16446 (= e!10149 e!10150)))

(declare-fun res!12228 () Bool)

(assert (=> b!16446 (=> (not res!12228) (not e!10150))))

(assert (=> b!16446 (= res!12228 (and (or (not ((_ is Cons!518) lt!4027)) (bvsle (_1!339 (h!1084 lt!4027)) a!507)) ((_ is Cons!518) lt!4027) (bvslt (_1!339 (h!1084 lt!4027)) a!507)))))

(declare-fun b!16447 () Bool)

(assert (=> b!16447 (= e!10150 (containsKey!17 (t!3062 lt!4027) a!507))))

(assert (= (and d!3201 (not res!12227)) b!16446))

(assert (= (and b!16446 res!12228) b!16447))

(declare-fun m!11533 () Bool)

(assert (=> b!16447 m!11533))

(assert (=> b!16302 d!3201))

(declare-fun d!3203 () Bool)

(assert (=> d!3203 (isDefined!15 (getValueByKey!53 (toList!270 lt!3982) a!507))))

(declare-fun lt!4065 () Unit!328)

(assert (=> d!3203 (= lt!4065 (choose!185 (toList!270 lt!3982) a!507))))

(declare-fun e!10151 () Bool)

(assert (=> d!3203 e!10151))

(declare-fun res!12229 () Bool)

(assert (=> d!3203 (=> (not res!12229) (not e!10151))))

(assert (=> d!3203 (= res!12229 (isStrictlySorted!159 (toList!270 lt!3982)))))

(assert (=> d!3203 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!14 (toList!270 lt!3982) a!507) lt!4065)))

(declare-fun b!16448 () Bool)

(assert (=> b!16448 (= e!10151 (containsKey!17 (toList!270 lt!3982) a!507))))

(assert (= (and d!3203 res!12229) b!16448))

(assert (=> d!3203 m!11337))

(assert (=> d!3203 m!11337))

(assert (=> d!3203 m!11339))

(declare-fun m!11535 () Bool)

(assert (=> d!3203 m!11535))

(declare-fun m!11537 () Bool)

(assert (=> d!3203 m!11537))

(assert (=> b!16448 m!11333))

(assert (=> b!16264 d!3203))

(assert (=> b!16264 d!3171))

(assert (=> b!16264 d!3173))

(declare-fun d!3205 () Bool)

(declare-fun res!12230 () Bool)

(declare-fun e!10152 () Bool)

(assert (=> d!3205 (=> res!12230 e!10152)))

(assert (=> d!3205 (= res!12230 ((_ is Nil!519) (t!3062 (t!3062 (toList!270 lt!3965)))))))

(assert (=> d!3205 (= (forall!143 (t!3062 (t!3062 (toList!270 lt!3965))) p!191) e!10152)))

(declare-fun b!16449 () Bool)

(declare-fun e!10153 () Bool)

(assert (=> b!16449 (= e!10152 e!10153)))

(declare-fun res!12231 () Bool)

(assert (=> b!16449 (=> (not res!12231) (not e!10153))))

(assert (=> b!16449 (= res!12231 (dynLambda!125 p!191 (h!1084 (t!3062 (t!3062 (toList!270 lt!3965))))))))

(declare-fun b!16450 () Bool)

(assert (=> b!16450 (= e!10153 (forall!143 (t!3062 (t!3062 (t!3062 (toList!270 lt!3965)))) p!191))))

(assert (= (and d!3205 (not res!12230)) b!16449))

(assert (= (and b!16449 res!12231) b!16450))

(declare-fun b_lambda!1349 () Bool)

(assert (=> (not b_lambda!1349) (not b!16449)))

(declare-fun t!3121 () Bool)

(declare-fun tb!585 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3121) tb!585))

(declare-fun result!957 () Bool)

(assert (=> tb!585 (= result!957 true)))

(assert (=> b!16449 t!3121))

(declare-fun b_and!1173 () Bool)

(assert (= b_and!1171 (and (=> t!3121 result!957) b_and!1173)))

(declare-fun m!11539 () Bool)

(assert (=> b!16449 m!11539))

(declare-fun m!11541 () Bool)

(assert (=> b!16450 m!11541))

(assert (=> b!16285 d!3205))

(declare-fun d!3207 () Bool)

(declare-fun res!12232 () Bool)

(declare-fun e!10154 () Bool)

(assert (=> d!3207 (=> res!12232 e!10154)))

(assert (=> d!3207 (= res!12232 (and ((_ is Cons!518) (toList!270 lt!3981)) (= (_1!339 (h!1084 (toList!270 lt!3981))) a!507)))))

(assert (=> d!3207 (= (containsKey!17 (toList!270 lt!3981) a!507) e!10154)))

(declare-fun b!16451 () Bool)

(declare-fun e!10155 () Bool)

(assert (=> b!16451 (= e!10154 e!10155)))

(declare-fun res!12233 () Bool)

(assert (=> b!16451 (=> (not res!12233) (not e!10155))))

(assert (=> b!16451 (= res!12233 (and (or (not ((_ is Cons!518) (toList!270 lt!3981))) (bvsle (_1!339 (h!1084 (toList!270 lt!3981))) a!507)) ((_ is Cons!518) (toList!270 lt!3981)) (bvslt (_1!339 (h!1084 (toList!270 lt!3981))) a!507)))))

(declare-fun b!16452 () Bool)

(assert (=> b!16452 (= e!10155 (containsKey!17 (t!3062 (toList!270 lt!3981)) a!507))))

(assert (= (and d!3207 (not res!12232)) b!16451))

(assert (= (and b!16451 res!12233) b!16452))

(declare-fun m!11543 () Bool)

(assert (=> b!16452 m!11543))

(assert (=> d!3117 d!3207))

(declare-fun b!16453 () Bool)

(declare-fun e!10156 () Bool)

(declare-fun tp!2880 () Bool)

(assert (=> b!16453 (= e!10156 (and tp_is_empty!829 tp!2880))))

(assert (=> b!16306 (= tp!2877 e!10156)))

(assert (= (and b!16306 ((_ is Cons!518) (t!3062 (t!3062 (toList!270 lm!221))))) b!16453))

(declare-fun b_lambda!1351 () Bool)

(assert (= b_lambda!1347 (or (and start!2778 b_free!565) b_lambda!1351)))

(declare-fun b_lambda!1353 () Bool)

(assert (= b_lambda!1345 (or (and start!2778 b_free!565) b_lambda!1353)))

(declare-fun b_lambda!1355 () Bool)

(assert (= b_lambda!1343 (or (and start!2778 b_free!565) b_lambda!1355)))

(declare-fun b_lambda!1357 () Bool)

(assert (= b_lambda!1349 (or (and start!2778 b_free!565) b_lambda!1357)))

(check-sat (not b_next!565) (not b!16443) (not b!16447) (not d!3165) (not b!16448) (not b_lambda!1307) (not b_lambda!1269) (not d!3167) (not b_lambda!1275) (not b_lambda!1273) (not b!16412) (not b!16415) (not d!3189) (not b_lambda!1303) tp_is_empty!829 (not b!16441) b_and!1173 (not b!16431) (not b!16427) (not b_lambda!1305) (not b_lambda!1271) (not b!16433) (not b_lambda!1355) (not b!16452) (not d!3203) (not b!16453) (not b!16397) (not d!3171) (not b!16408) (not b!16423) (not b!16438) (not b!16429) (not b_lambda!1351) (not b_lambda!1353) (not b!16436) (not d!3193) (not b!16421) (not b_lambda!1357) (not b!16445) (not b!16450) (not b_lambda!1309) (not b!16425))
(check-sat b_and!1173 (not b_next!565))
