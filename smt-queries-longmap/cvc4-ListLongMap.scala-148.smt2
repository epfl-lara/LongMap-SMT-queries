; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2782 () Bool)

(assert start!2782)

(declare-fun b_free!569 () Bool)

(declare-fun b_next!569 () Bool)

(assert (=> start!2782 (= b_free!569 (not b_next!569))))

(declare-fun tp!2867 () Bool)

(declare-fun b_and!1115 () Bool)

(assert (=> start!2782 (= tp!2867 b_and!1115)))

(declare-fun b!16193 () Bool)

(declare-fun res!12093 () Bool)

(declare-fun e!9954 () Bool)

(assert (=> b!16193 (=> (not res!12093) (not e!9954))))

(declare-datatypes ((B!690 0))(
  ( (B!691 (val!443 Int)) )
))
(declare-datatypes ((tuple2!686 0))(
  ( (tuple2!687 (_1!343 (_ BitVec 64)) (_2!343 B!690)) )
))
(declare-datatypes ((List!528 0))(
  ( (Nil!525) (Cons!524 (h!1090 tuple2!686) (t!3066 List!528)) )
))
(declare-datatypes ((ListLongMap!517 0))(
  ( (ListLongMap!518 (toList!274 List!528)) )
))
(declare-fun lm!221 () ListLongMap!517)

(declare-fun isEmpty!158 (ListLongMap!517) Bool)

(assert (=> b!16193 (= res!12093 (not (isEmpty!158 lm!221)))))

(declare-fun b!16194 () Bool)

(declare-fun e!9955 () Bool)

(assert (=> b!16194 (= e!9954 e!9955)))

(declare-fun res!12095 () Bool)

(assert (=> b!16194 (=> (not res!12095) (not e!9955))))

(declare-fun lt!3976 () ListLongMap!517)

(declare-fun p!191 () Int)

(declare-fun forall!145 (List!528 Int) Bool)

(assert (=> b!16194 (= res!12095 (forall!145 (toList!274 lt!3976) p!191))))

(declare-fun tail!82 (ListLongMap!517) ListLongMap!517)

(assert (=> b!16194 (= lt!3976 (tail!82 lm!221))))

(declare-fun res!12094 () Bool)

(assert (=> start!2782 (=> (not res!12094) (not e!9954))))

(assert (=> start!2782 (= res!12094 (forall!145 (toList!274 lm!221) p!191))))

(assert (=> start!2782 e!9954))

(declare-fun e!9953 () Bool)

(declare-fun inv!890 (ListLongMap!517) Bool)

(assert (=> start!2782 (and (inv!890 lm!221) e!9953)))

(assert (=> start!2782 tp!2867))

(assert (=> start!2782 true))

(declare-fun a!507 () (_ BitVec 64))

(declare-fun b!16195 () Bool)

(declare-fun -!32 (ListLongMap!517 (_ BitVec 64)) ListLongMap!517)

(assert (=> b!16195 (= e!9955 (not (forall!145 (toList!274 (-!32 lm!221 a!507)) p!191)))))

(assert (=> b!16195 (forall!145 (toList!274 (-!32 lt!3976 a!507)) p!191)))

(declare-datatypes ((Unit!322 0))(
  ( (Unit!323) )
))
(declare-fun lt!3975 () Unit!322)

(declare-fun removeValidProp!22 (ListLongMap!517 Int (_ BitVec 64)) Unit!322)

(assert (=> b!16195 (= lt!3975 (removeValidProp!22 lt!3976 p!191 a!507))))

(declare-fun b!16196 () Bool)

(declare-fun tp!2866 () Bool)

(assert (=> b!16196 (= e!9953 tp!2866)))

(assert (= (and start!2782 res!12094) b!16193))

(assert (= (and b!16193 res!12093) b!16194))

(assert (= (and b!16194 res!12095) b!16195))

(assert (= start!2782 b!16196))

(declare-fun m!11207 () Bool)

(assert (=> b!16193 m!11207))

(declare-fun m!11209 () Bool)

(assert (=> b!16194 m!11209))

(declare-fun m!11211 () Bool)

(assert (=> b!16194 m!11211))

(declare-fun m!11213 () Bool)

(assert (=> start!2782 m!11213))

(declare-fun m!11215 () Bool)

(assert (=> start!2782 m!11215))

(declare-fun m!11217 () Bool)

(assert (=> b!16195 m!11217))

(declare-fun m!11219 () Bool)

(assert (=> b!16195 m!11219))

(declare-fun m!11221 () Bool)

(assert (=> b!16195 m!11221))

(declare-fun m!11223 () Bool)

(assert (=> b!16195 m!11223))

(declare-fun m!11225 () Bool)

(assert (=> b!16195 m!11225))

(push 1)

(assert (not b!16194))

(assert (not b!16195))

(assert (not start!2782))

(assert b_and!1115)

(assert (not b!16193))

(assert (not b!16196))

(assert (not b_next!569))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1115)

(assert (not b_next!569))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!3027 () Bool)

(declare-fun res!12100 () Bool)

(declare-fun e!9960 () Bool)

(assert (=> d!3027 (=> res!12100 e!9960)))

(assert (=> d!3027 (= res!12100 (is-Nil!525 (toList!274 lm!221)))))

(assert (=> d!3027 (= (forall!145 (toList!274 lm!221) p!191) e!9960)))

(declare-fun b!16201 () Bool)

(declare-fun e!9961 () Bool)

(assert (=> b!16201 (= e!9960 e!9961)))

(declare-fun res!12101 () Bool)

(assert (=> b!16201 (=> (not res!12101) (not e!9961))))

(declare-fun dynLambda!126 (Int tuple2!686) Bool)

(assert (=> b!16201 (= res!12101 (dynLambda!126 p!191 (h!1090 (toList!274 lm!221))))))

(declare-fun b!16202 () Bool)

(assert (=> b!16202 (= e!9961 (forall!145 (t!3066 (toList!274 lm!221)) p!191))))

(assert (= (and d!3027 (not res!12100)) b!16201))

(assert (= (and b!16201 res!12101) b!16202))

(declare-fun b_lambda!1243 () Bool)

(assert (=> (not b_lambda!1243) (not b!16201)))

(declare-fun t!3068 () Bool)

(declare-fun tb!529 () Bool)

(assert (=> (and start!2782 (= p!191 p!191) t!3068) tb!529))

(declare-fun result!895 () Bool)

(assert (=> tb!529 (= result!895 true)))

(assert (=> b!16201 t!3068))

(declare-fun b_and!1117 () Bool)

(assert (= b_and!1115 (and (=> t!3068 result!895) b_and!1117)))

(declare-fun m!11229 () Bool)

(assert (=> b!16201 m!11229))

(declare-fun m!11231 () Bool)

(assert (=> b!16202 m!11231))

(assert (=> start!2782 d!3027))

(declare-fun d!3035 () Bool)

(declare-fun isStrictlySorted!164 (List!528) Bool)

(assert (=> d!3035 (= (inv!890 lm!221) (isStrictlySorted!164 (toList!274 lm!221)))))

(declare-fun bs!760 () Bool)

(assert (= bs!760 d!3035))

(declare-fun m!11233 () Bool)

(assert (=> bs!760 m!11233))

(assert (=> start!2782 d!3035))

(declare-fun d!3037 () Bool)

(declare-fun lt!3983 () ListLongMap!517)

(declare-fun contains!204 (ListLongMap!517 (_ BitVec 64)) Bool)

(assert (=> d!3037 (not (contains!204 lt!3983 a!507))))

(declare-fun removeStrictlySorted!16 (List!528 (_ BitVec 64)) List!528)

(assert (=> d!3037 (= lt!3983 (ListLongMap!518 (removeStrictlySorted!16 (toList!274 lm!221) a!507)))))

(assert (=> d!3037 (= (-!32 lm!221 a!507) lt!3983)))

(declare-fun bs!764 () Bool)

(assert (= bs!764 d!3037))

(declare-fun m!11261 () Bool)

(assert (=> bs!764 m!11261))

(declare-fun m!11263 () Bool)

(assert (=> bs!764 m!11263))

(assert (=> b!16195 d!3037))

(declare-fun d!3053 () Bool)

(declare-fun res!12120 () Bool)

(declare-fun e!9980 () Bool)

(assert (=> d!3053 (=> res!12120 e!9980)))

(assert (=> d!3053 (= res!12120 (is-Nil!525 (toList!274 (-!32 lm!221 a!507))))))

(assert (=> d!3053 (= (forall!145 (toList!274 (-!32 lm!221 a!507)) p!191) e!9980)))

(declare-fun b!16221 () Bool)

(declare-fun e!9981 () Bool)

(assert (=> b!16221 (= e!9980 e!9981)))

(declare-fun res!12121 () Bool)

(assert (=> b!16221 (=> (not res!12121) (not e!9981))))

(assert (=> b!16221 (= res!12121 (dynLambda!126 p!191 (h!1090 (toList!274 (-!32 lm!221 a!507)))))))

(declare-fun b!16222 () Bool)

(assert (=> b!16222 (= e!9981 (forall!145 (t!3066 (toList!274 (-!32 lm!221 a!507))) p!191))))

(assert (= (and d!3053 (not res!12120)) b!16221))

(assert (= (and b!16221 res!12121) b!16222))

(declare-fun b_lambda!1255 () Bool)

(assert (=> (not b_lambda!1255) (not b!16221)))

(declare-fun t!3080 () Bool)

(declare-fun tb!541 () Bool)

(assert (=> (and start!2782 (= p!191 p!191) t!3080) tb!541))

(declare-fun result!907 () Bool)

(assert (=> tb!541 (= result!907 true)))

(assert (=> b!16221 t!3080))

(declare-fun b_and!1129 () Bool)

(assert (= b_and!1117 (and (=> t!3080 result!907) b_and!1129)))

(declare-fun m!11269 () Bool)

(assert (=> b!16221 m!11269))

(declare-fun m!11271 () Bool)

(assert (=> b!16222 m!11271))

(assert (=> b!16195 d!3053))

(declare-fun d!3057 () Bool)

(declare-fun res!12122 () Bool)

(declare-fun e!9982 () Bool)

(assert (=> d!3057 (=> res!12122 e!9982)))

(assert (=> d!3057 (= res!12122 (is-Nil!525 (toList!274 (-!32 lt!3976 a!507))))))

(assert (=> d!3057 (= (forall!145 (toList!274 (-!32 lt!3976 a!507)) p!191) e!9982)))

(declare-fun b!16223 () Bool)

(declare-fun e!9983 () Bool)

(assert (=> b!16223 (= e!9982 e!9983)))

(declare-fun res!12123 () Bool)

(assert (=> b!16223 (=> (not res!12123) (not e!9983))))

(assert (=> b!16223 (= res!12123 (dynLambda!126 p!191 (h!1090 (toList!274 (-!32 lt!3976 a!507)))))))

(declare-fun b!16224 () Bool)

(assert (=> b!16224 (= e!9983 (forall!145 (t!3066 (toList!274 (-!32 lt!3976 a!507))) p!191))))

(assert (= (and d!3057 (not res!12122)) b!16223))

(assert (= (and b!16223 res!12123) b!16224))

(declare-fun b_lambda!1257 () Bool)

(assert (=> (not b_lambda!1257) (not b!16223)))

(declare-fun t!3082 () Bool)

(declare-fun tb!543 () Bool)

(assert (=> (and start!2782 (= p!191 p!191) t!3082) tb!543))

(declare-fun result!909 () Bool)

(assert (=> tb!543 (= result!909 true)))

(assert (=> b!16223 t!3082))

(declare-fun b_and!1131 () Bool)

(assert (= b_and!1129 (and (=> t!3082 result!909) b_and!1131)))

(declare-fun m!11273 () Bool)

(assert (=> b!16223 m!11273))

(declare-fun m!11275 () Bool)

(assert (=> b!16224 m!11275))

(assert (=> b!16195 d!3057))

(declare-fun d!3059 () Bool)

(declare-fun lt!3984 () ListLongMap!517)

(assert (=> d!3059 (not (contains!204 lt!3984 a!507))))

(assert (=> d!3059 (= lt!3984 (ListLongMap!518 (removeStrictlySorted!16 (toList!274 lt!3976) a!507)))))

(assert (=> d!3059 (= (-!32 lt!3976 a!507) lt!3984)))

(declare-fun bs!765 () Bool)

(assert (= bs!765 d!3059))

(declare-fun m!11277 () Bool)

(assert (=> bs!765 m!11277))

(declare-fun m!11279 () Bool)

(assert (=> bs!765 m!11279))

(assert (=> b!16195 d!3059))

(declare-fun d!3061 () Bool)

(assert (=> d!3061 (forall!145 (toList!274 (-!32 lt!3976 a!507)) p!191)))

(declare-fun lt!3993 () Unit!322)

(declare-fun choose!183 (ListLongMap!517 Int (_ BitVec 64)) Unit!322)

(assert (=> d!3061 (= lt!3993 (choose!183 lt!3976 p!191 a!507))))

(assert (=> d!3061 (forall!145 (toList!274 lt!3976) p!191)))

(assert (=> d!3061 (= (removeValidProp!22 lt!3976 p!191 a!507) lt!3993)))

(declare-fun bs!769 () Bool)

(assert (= bs!769 d!3061))

(assert (=> bs!769 m!11225))

(assert (=> bs!769 m!11223))

(declare-fun m!11291 () Bool)

(assert (=> bs!769 m!11291))

(assert (=> bs!769 m!11209))

(assert (=> b!16195 d!3061))

(declare-fun d!3071 () Bool)

(declare-fun res!12126 () Bool)

(declare-fun e!9986 () Bool)

(assert (=> d!3071 (=> res!12126 e!9986)))

(assert (=> d!3071 (= res!12126 (is-Nil!525 (toList!274 lt!3976)))))

(assert (=> d!3071 (= (forall!145 (toList!274 lt!3976) p!191) e!9986)))

(declare-fun b!16227 () Bool)

(declare-fun e!9987 () Bool)

(assert (=> b!16227 (= e!9986 e!9987)))

(declare-fun res!12127 () Bool)

(assert (=> b!16227 (=> (not res!12127) (not e!9987))))

(assert (=> b!16227 (= res!12127 (dynLambda!126 p!191 (h!1090 (toList!274 lt!3976))))))

(declare-fun b!16228 () Bool)

(assert (=> b!16228 (= e!9987 (forall!145 (t!3066 (toList!274 lt!3976)) p!191))))

(assert (= (and d!3071 (not res!12126)) b!16227))

(assert (= (and b!16227 res!12127) b!16228))

(declare-fun b_lambda!1261 () Bool)

(assert (=> (not b_lambda!1261) (not b!16227)))

(declare-fun t!3086 () Bool)

(declare-fun tb!547 () Bool)

(assert (=> (and start!2782 (= p!191 p!191) t!3086) tb!547))

(declare-fun result!913 () Bool)

(assert (=> tb!547 (= result!913 true)))

(assert (=> b!16227 t!3086))

(declare-fun b_and!1135 () Bool)

(assert (= b_and!1131 (and (=> t!3086 result!913) b_and!1135)))

(declare-fun m!11293 () Bool)

(assert (=> b!16227 m!11293))

(declare-fun m!11295 () Bool)

(assert (=> b!16228 m!11295))

(assert (=> b!16194 d!3071))

(declare-fun d!3073 () Bool)

(declare-fun tail!85 (List!528) List!528)

(assert (=> d!3073 (= (tail!82 lm!221) (ListLongMap!518 (tail!85 (toList!274 lm!221))))))

(declare-fun bs!772 () Bool)

(assert (= bs!772 d!3073))

(declare-fun m!11307 () Bool)

(assert (=> bs!772 m!11307))

(assert (=> b!16194 d!3073))

(declare-fun d!3081 () Bool)

(declare-fun isEmpty!161 (List!528) Bool)

(assert (=> d!3081 (= (isEmpty!158 lm!221) (isEmpty!161 (toList!274 lm!221)))))

(declare-fun bs!775 () Bool)

(assert (= bs!775 d!3081))

(declare-fun m!11319 () Bool)

(assert (=> bs!775 m!11319))

(assert (=> b!16193 d!3081))

(declare-fun b!16242 () Bool)

(declare-fun e!9997 () Bool)

(declare-fun tp_is_empty!831 () Bool)

(declare-fun tp!2873 () Bool)

(assert (=> b!16242 (= e!9997 (and tp_is_empty!831 tp!2873))))

(assert (=> b!16196 (= tp!2866 e!9997)))

(assert (= (and b!16196 (is-Cons!524 (toList!274 lm!221))) b!16242))

(declare-fun b_lambda!1275 () Bool)

(assert (= b_lambda!1257 (or (and start!2782 b_free!569) b_lambda!1275)))

(declare-fun b_lambda!1277 () Bool)

(assert (= b_lambda!1261 (or (and start!2782 b_free!569) b_lambda!1277)))

(declare-fun b_lambda!1279 () Bool)

(assert (= b_lambda!1243 (or (and start!2782 b_free!569) b_lambda!1279)))

(declare-fun b_lambda!1281 () Bool)

(assert (= b_lambda!1255 (or (and start!2782 b_free!569) b_lambda!1281)))

(push 1)

(assert (not b_lambda!1277))

(assert (not d!3059))

(assert (not b!16222))

(assert (not b_lambda!1279))

(assert (not b!16224))

(assert (not b!16228))

(assert (not d!3035))

(assert (not d!3037))

(assert (not b_next!569))

(assert (not b!16242))

(assert (not d!3073))

(assert b_and!1135)

(assert (not b_lambda!1281))

(assert (not d!3081))

(assert tp_is_empty!831)

(assert (not b!16202))

(assert (not d!3061))

(assert (not b_lambda!1275))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1135)

(assert (not b_next!569))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!3109 () Bool)

(declare-fun res!12161 () Bool)

(declare-fun e!10044 () Bool)

(assert (=> d!3109 (=> res!12161 e!10044)))

(assert (=> d!3109 (= res!12161 (or (is-Nil!525 (toList!274 lm!221)) (is-Nil!525 (t!3066 (toList!274 lm!221)))))))

(assert (=> d!3109 (= (isStrictlySorted!164 (toList!274 lm!221)) e!10044)))

(declare-fun b!16305 () Bool)

(declare-fun e!10045 () Bool)

(assert (=> b!16305 (= e!10044 e!10045)))

(declare-fun res!12162 () Bool)

(assert (=> b!16305 (=> (not res!12162) (not e!10045))))

(assert (=> b!16305 (= res!12162 (bvslt (_1!343 (h!1090 (toList!274 lm!221))) (_1!343 (h!1090 (t!3066 (toList!274 lm!221))))))))

(declare-fun b!16306 () Bool)

(assert (=> b!16306 (= e!10045 (isStrictlySorted!164 (t!3066 (toList!274 lm!221))))))

(assert (= (and d!3109 (not res!12161)) b!16305))

(assert (= (and b!16305 res!12162) b!16306))

(declare-fun m!11371 () Bool)

(assert (=> b!16306 m!11371))

(assert (=> d!3035 d!3109))

(declare-fun d!3115 () Bool)

(declare-fun res!12163 () Bool)

(declare-fun e!10048 () Bool)

(assert (=> d!3115 (=> res!12163 e!10048)))

(assert (=> d!3115 (= res!12163 (is-Nil!525 (t!3066 (toList!274 lt!3976))))))

(assert (=> d!3115 (= (forall!145 (t!3066 (toList!274 lt!3976)) p!191) e!10048)))

(declare-fun b!16311 () Bool)

(declare-fun e!10049 () Bool)

(assert (=> b!16311 (= e!10048 e!10049)))

(declare-fun res!12164 () Bool)

(assert (=> b!16311 (=> (not res!12164) (not e!10049))))

(assert (=> b!16311 (= res!12164 (dynLambda!126 p!191 (h!1090 (t!3066 (toList!274 lt!3976)))))))

(declare-fun b!16312 () Bool)

(assert (=> b!16312 (= e!10049 (forall!145 (t!3066 (t!3066 (toList!274 lt!3976))) p!191))))

(assert (= (and d!3115 (not res!12163)) b!16311))

(assert (= (and b!16311 res!12164) b!16312))

(declare-fun b_lambda!1303 () Bool)

(assert (=> (not b_lambda!1303) (not b!16311)))

(declare-fun t!3104 () Bool)

(declare-fun tb!565 () Bool)

(assert (=> (and start!2782 (= p!191 p!191) t!3104) tb!565))

(declare-fun result!937 () Bool)

(assert (=> tb!565 (= result!937 true)))

(assert (=> b!16311 t!3104))

(declare-fun b_and!1153 () Bool)

(assert (= b_and!1135 (and (=> t!3104 result!937) b_and!1153)))

(declare-fun m!11375 () Bool)

(assert (=> b!16311 m!11375))

(declare-fun m!11377 () Bool)

(assert (=> b!16312 m!11377))

(assert (=> b!16228 d!3115))

(declare-fun d!3119 () Bool)

(declare-fun res!12171 () Bool)

(declare-fun e!10056 () Bool)

(assert (=> d!3119 (=> res!12171 e!10056)))

(assert (=> d!3119 (= res!12171 (is-Nil!525 (t!3066 (toList!274 lm!221))))))

(assert (=> d!3119 (= (forall!145 (t!3066 (toList!274 lm!221)) p!191) e!10056)))

(declare-fun b!16319 () Bool)

(declare-fun e!10057 () Bool)

(assert (=> b!16319 (= e!10056 e!10057)))

(declare-fun res!12172 () Bool)

(assert (=> b!16319 (=> (not res!12172) (not e!10057))))

(assert (=> b!16319 (= res!12172 (dynLambda!126 p!191 (h!1090 (t!3066 (toList!274 lm!221)))))))

(declare-fun b!16320 () Bool)

(assert (=> b!16320 (= e!10057 (forall!145 (t!3066 (t!3066 (toList!274 lm!221))) p!191))))

(assert (= (and d!3119 (not res!12171)) b!16319))

(assert (= (and b!16319 res!12172) b!16320))

(declare-fun b_lambda!1307 () Bool)

(assert (=> (not b_lambda!1307) (not b!16319)))

(declare-fun t!3108 () Bool)

(declare-fun tb!569 () Bool)

(assert (=> (and start!2782 (= p!191 p!191) t!3108) tb!569))

(declare-fun result!941 () Bool)

(assert (=> tb!569 (= result!941 true)))

(assert (=> b!16319 t!3108))

(declare-fun b_and!1157 () Bool)

(assert (= b_and!1153 (and (=> t!3108 result!941) b_and!1157)))

(declare-fun m!11383 () Bool)

(assert (=> b!16319 m!11383))

(declare-fun m!11385 () Bool)

(assert (=> b!16320 m!11385))

(assert (=> b!16202 d!3119))

(assert (=> d!3061 d!3057))

(assert (=> d!3061 d!3059))

(declare-fun d!3123 () Bool)

(assert (=> d!3123 (forall!145 (toList!274 (-!32 lt!3976 a!507)) p!191)))

(assert (=> d!3123 true))

(declare-fun _$31!17 () Unit!322)

(assert (=> d!3123 (= (choose!183 lt!3976 p!191 a!507) _$31!17)))

(declare-fun bs!777 () Bool)

(assert (= bs!777 d!3123))

(assert (=> bs!777 m!11225))

(assert (=> bs!777 m!11223))

(assert (=> d!3061 d!3123))

(assert (=> d!3061 d!3071))

(declare-fun d!3137 () Bool)

(assert (=> d!3137 (= (tail!85 (toList!274 lm!221)) (t!3066 (toList!274 lm!221)))))

(assert (=> d!3073 d!3137))

(declare-fun d!3143 () Bool)

(declare-fun e!10086 () Bool)

(assert (=> d!3143 e!10086))

(declare-fun res!12188 () Bool)

(assert (=> d!3143 (=> res!12188 e!10086)))

(declare-fun lt!4048 () Bool)

(assert (=> d!3143 (= res!12188 (not lt!4048))))

(declare-fun lt!4046 () Bool)

(assert (=> d!3143 (= lt!4048 lt!4046)))

(declare-fun lt!4047 () Unit!322)

(declare-fun e!10085 () Unit!322)

(assert (=> d!3143 (= lt!4047 e!10085)))

(declare-fun c!1545 () Bool)

(assert (=> d!3143 (= c!1545 lt!4046)))

(declare-fun containsKey!19 (List!528 (_ BitVec 64)) Bool)

(assert (=> d!3143 (= lt!4046 (containsKey!19 (toList!274 lt!3983) a!507))))

(assert (=> d!3143 (= (contains!204 lt!3983 a!507) lt!4048)))

(declare-fun b!16358 () Bool)

(declare-fun lt!4049 () Unit!322)

(assert (=> b!16358 (= e!10085 lt!4049)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!16 (List!528 (_ BitVec 64)) Unit!322)

(assert (=> b!16358 (= lt!4049 (lemmaContainsKeyImpliesGetValueByKeyDefined!16 (toList!274 lt!3983) a!507))))

(declare-datatypes ((Option!61 0))(
  ( (Some!60 (v!1390 B!690)) (None!59) )
))
(declare-fun isDefined!17 (Option!61) Bool)

(declare-fun getValueByKey!55 (List!528 (_ BitVec 64)) Option!61)

(assert (=> b!16358 (isDefined!17 (getValueByKey!55 (toList!274 lt!3983) a!507))))

(declare-fun b!16359 () Bool)

(declare-fun Unit!328 () Unit!322)

(assert (=> b!16359 (= e!10085 Unit!328)))

(declare-fun b!16360 () Bool)

(assert (=> b!16360 (= e!10086 (isDefined!17 (getValueByKey!55 (toList!274 lt!3983) a!507)))))

(assert (= (and d!3143 c!1545) b!16358))

(assert (= (and d!3143 (not c!1545)) b!16359))

(assert (= (and d!3143 (not res!12188)) b!16360))

(declare-fun m!11437 () Bool)

(assert (=> d!3143 m!11437))

(declare-fun m!11439 () Bool)

(assert (=> b!16358 m!11439))

(declare-fun m!11441 () Bool)

(assert (=> b!16358 m!11441))

(assert (=> b!16358 m!11441))

(declare-fun m!11443 () Bool)

(assert (=> b!16358 m!11443))

(assert (=> b!16360 m!11441))

(assert (=> b!16360 m!11441))

(assert (=> b!16360 m!11443))

(assert (=> d!3037 d!3143))

(declare-fun b!16371 () Bool)

(declare-fun e!10093 () List!528)

(declare-fun $colon$colon!26 (List!528 tuple2!686) List!528)

(assert (=> b!16371 (= e!10093 ($colon$colon!26 (removeStrictlySorted!16 (t!3066 (toList!274 lm!221)) a!507) (h!1090 (toList!274 lm!221))))))

(declare-fun d!3147 () Bool)

(declare-fun e!10095 () Bool)

(assert (=> d!3147 e!10095))

(declare-fun res!12191 () Bool)

(assert (=> d!3147 (=> (not res!12191) (not e!10095))))

(declare-fun lt!4052 () List!528)

(assert (=> d!3147 (= res!12191 (isStrictlySorted!164 lt!4052))))

(declare-fun e!10094 () List!528)

(assert (=> d!3147 (= lt!4052 e!10094)))

(declare-fun c!1550 () Bool)

(assert (=> d!3147 (= c!1550 (and (is-Cons!524 (toList!274 lm!221)) (= (_1!343 (h!1090 (toList!274 lm!221))) a!507)))))

(assert (=> d!3147 (isStrictlySorted!164 (toList!274 lm!221))))

(assert (=> d!3147 (= (removeStrictlySorted!16 (toList!274 lm!221) a!507) lt!4052)))

(declare-fun b!16372 () Bool)

(assert (=> b!16372 (= e!10094 e!10093)))

(declare-fun c!1551 () Bool)

(assert (=> b!16372 (= c!1551 (and (is-Cons!524 (toList!274 lm!221)) (not (= (_1!343 (h!1090 (toList!274 lm!221))) a!507))))))

(declare-fun b!16373 () Bool)

(assert (=> b!16373 (= e!10094 (t!3066 (toList!274 lm!221)))))

(declare-fun b!16374 () Bool)

(assert (=> b!16374 (= e!10093 Nil!525)))

(declare-fun b!16375 () Bool)

(assert (=> b!16375 (= e!10095 (not (containsKey!19 lt!4052 a!507)))))

(assert (= (and d!3147 c!1550) b!16373))

(assert (= (and d!3147 (not c!1550)) b!16372))

(assert (= (and b!16372 c!1551) b!16371))

(assert (= (and b!16372 (not c!1551)) b!16374))

(assert (= (and d!3147 res!12191) b!16375))

(declare-fun m!11445 () Bool)

(assert (=> b!16371 m!11445))

(assert (=> b!16371 m!11445))

(declare-fun m!11447 () Bool)

(assert (=> b!16371 m!11447))

(declare-fun m!11449 () Bool)

(assert (=> d!3147 m!11449))

(assert (=> d!3147 m!11233))

(declare-fun m!11451 () Bool)

(assert (=> b!16375 m!11451))

(assert (=> d!3037 d!3147))

(declare-fun d!3149 () Bool)

(assert (=> d!3149 (= (isEmpty!161 (toList!274 lm!221)) (is-Nil!525 (toList!274 lm!221)))))

(assert (=> d!3081 d!3149))

(declare-fun d!3151 () Bool)

(declare-fun res!12192 () Bool)

(declare-fun e!10096 () Bool)

(assert (=> d!3151 (=> res!12192 e!10096)))

(assert (=> d!3151 (= res!12192 (is-Nil!525 (t!3066 (toList!274 (-!32 lm!221 a!507)))))))

(assert (=> d!3151 (= (forall!145 (t!3066 (toList!274 (-!32 lm!221 a!507))) p!191) e!10096)))

(declare-fun b!16376 () Bool)

(declare-fun e!10097 () Bool)

(assert (=> b!16376 (= e!10096 e!10097)))

(declare-fun res!12193 () Bool)

(assert (=> b!16376 (=> (not res!12193) (not e!10097))))

(assert (=> b!16376 (= res!12193 (dynLambda!126 p!191 (h!1090 (t!3066 (toList!274 (-!32 lm!221 a!507))))))))

(declare-fun b!16377 () Bool)

(assert (=> b!16377 (= e!10097 (forall!145 (t!3066 (t!3066 (toList!274 (-!32 lm!221 a!507)))) p!191))))

(assert (= (and d!3151 (not res!12192)) b!16376))

(assert (= (and b!16376 res!12193) b!16377))

(declare-fun b_lambda!1327 () Bool)

(assert (=> (not b_lambda!1327) (not b!16376)))

(declare-fun t!3112 () Bool)

(declare-fun tb!573 () Bool)

(assert (=> (and start!2782 (= p!191 p!191) t!3112) tb!573))

(declare-fun result!945 () Bool)

(assert (=> tb!573 (= result!945 true)))

(assert (=> b!16376 t!3112))

(declare-fun b_and!1161 () Bool)

(assert (= b_and!1157 (and (=> t!3112 result!945) b_and!1161)))

(declare-fun m!11453 () Bool)

(assert (=> b!16376 m!11453))

(declare-fun m!11455 () Bool)

(assert (=> b!16377 m!11455))

(assert (=> b!16222 d!3151))

(declare-fun d!3153 () Bool)

(declare-fun res!12194 () Bool)

(declare-fun e!10098 () Bool)

(assert (=> d!3153 (=> res!12194 e!10098)))

(assert (=> d!3153 (= res!12194 (is-Nil!525 (t!3066 (toList!274 (-!32 lt!3976 a!507)))))))

(assert (=> d!3153 (= (forall!145 (t!3066 (toList!274 (-!32 lt!3976 a!507))) p!191) e!10098)))

(declare-fun b!16378 () Bool)

(declare-fun e!10099 () Bool)

(assert (=> b!16378 (= e!10098 e!10099)))

(declare-fun res!12195 () Bool)

(assert (=> b!16378 (=> (not res!12195) (not e!10099))))

(assert (=> b!16378 (= res!12195 (dynLambda!126 p!191 (h!1090 (t!3066 (toList!274 (-!32 lt!3976 a!507))))))))

(declare-fun b!16379 () Bool)

(assert (=> b!16379 (= e!10099 (forall!145 (t!3066 (t!3066 (toList!274 (-!32 lt!3976 a!507)))) p!191))))

(assert (= (and d!3153 (not res!12194)) b!16378))

(assert (= (and b!16378 res!12195) b!16379))

(declare-fun b_lambda!1329 () Bool)

(assert (=> (not b_lambda!1329) (not b!16378)))

(declare-fun t!3114 () Bool)

(declare-fun tb!575 () Bool)

(assert (=> (and start!2782 (= p!191 p!191) t!3114) tb!575))

(declare-fun result!947 () Bool)

(assert (=> tb!575 (= result!947 true)))

(assert (=> b!16378 t!3114))

(declare-fun b_and!1163 () Bool)

(assert (= b_and!1161 (and (=> t!3114 result!947) b_and!1163)))

(declare-fun m!11457 () Bool)

(assert (=> b!16378 m!11457))

(declare-fun m!11459 () Bool)

(assert (=> b!16379 m!11459))

(assert (=> b!16224 d!3153))

(declare-fun d!3155 () Bool)

(declare-fun e!10101 () Bool)

(assert (=> d!3155 e!10101))

(declare-fun res!12196 () Bool)

(assert (=> d!3155 (=> res!12196 e!10101)))

(declare-fun lt!4055 () Bool)

(assert (=> d!3155 (= res!12196 (not lt!4055))))

(declare-fun lt!4053 () Bool)

(assert (=> d!3155 (= lt!4055 lt!4053)))

(declare-fun lt!4054 () Unit!322)

(declare-fun e!10100 () Unit!322)

(assert (=> d!3155 (= lt!4054 e!10100)))

(declare-fun c!1552 () Bool)

(assert (=> d!3155 (= c!1552 lt!4053)))

(assert (=> d!3155 (= lt!4053 (containsKey!19 (toList!274 lt!3984) a!507))))

(assert (=> d!3155 (= (contains!204 lt!3984 a!507) lt!4055)))

(declare-fun b!16380 () Bool)

(declare-fun lt!4056 () Unit!322)

(assert (=> b!16380 (= e!10100 lt!4056)))

(assert (=> b!16380 (= lt!4056 (lemmaContainsKeyImpliesGetValueByKeyDefined!16 (toList!274 lt!3984) a!507))))

(assert (=> b!16380 (isDefined!17 (getValueByKey!55 (toList!274 lt!3984) a!507))))

(declare-fun b!16381 () Bool)

(declare-fun Unit!329 () Unit!322)

(assert (=> b!16381 (= e!10100 Unit!329)))

(declare-fun b!16382 () Bool)

(assert (=> b!16382 (= e!10101 (isDefined!17 (getValueByKey!55 (toList!274 lt!3984) a!507)))))

(assert (= (and d!3155 c!1552) b!16380))

(assert (= (and d!3155 (not c!1552)) b!16381))

(assert (= (and d!3155 (not res!12196)) b!16382))

(declare-fun m!11461 () Bool)

(assert (=> d!3155 m!11461))

(declare-fun m!11463 () Bool)

(assert (=> b!16380 m!11463))

(declare-fun m!11465 () Bool)

(assert (=> b!16380 m!11465))

(assert (=> b!16380 m!11465))

(declare-fun m!11467 () Bool)

(assert (=> b!16380 m!11467))

(assert (=> b!16382 m!11465))

(assert (=> b!16382 m!11465))

(assert (=> b!16382 m!11467))

(assert (=> d!3059 d!3155))

(declare-fun b!16383 () Bool)

(declare-fun e!10102 () List!528)

(assert (=> b!16383 (= e!10102 ($colon$colon!26 (removeStrictlySorted!16 (t!3066 (toList!274 lt!3976)) a!507) (h!1090 (toList!274 lt!3976))))))

(declare-fun d!3157 () Bool)

(declare-fun e!10104 () Bool)

(assert (=> d!3157 e!10104))

(declare-fun res!12197 () Bool)

(assert (=> d!3157 (=> (not res!12197) (not e!10104))))

(declare-fun lt!4057 () List!528)

(assert (=> d!3157 (= res!12197 (isStrictlySorted!164 lt!4057))))

(declare-fun e!10103 () List!528)

(assert (=> d!3157 (= lt!4057 e!10103)))

(declare-fun c!1553 () Bool)

(assert (=> d!3157 (= c!1553 (and (is-Cons!524 (toList!274 lt!3976)) (= (_1!343 (h!1090 (toList!274 lt!3976))) a!507)))))

(assert (=> d!3157 (isStrictlySorted!164 (toList!274 lt!3976))))

(assert (=> d!3157 (= (removeStrictlySorted!16 (toList!274 lt!3976) a!507) lt!4057)))

(declare-fun b!16384 () Bool)

(assert (=> b!16384 (= e!10103 e!10102)))

(declare-fun c!1554 () Bool)

(assert (=> b!16384 (= c!1554 (and (is-Cons!524 (toList!274 lt!3976)) (not (= (_1!343 (h!1090 (toList!274 lt!3976))) a!507))))))

(declare-fun b!16385 () Bool)

(assert (=> b!16385 (= e!10103 (t!3066 (toList!274 lt!3976)))))

(declare-fun b!16386 () Bool)

(assert (=> b!16386 (= e!10102 Nil!525)))

(declare-fun b!16387 () Bool)

(assert (=> b!16387 (= e!10104 (not (containsKey!19 lt!4057 a!507)))))

(assert (= (and d!3157 c!1553) b!16385))

(assert (= (and d!3157 (not c!1553)) b!16384))

(assert (= (and b!16384 c!1554) b!16383))

(assert (= (and b!16384 (not c!1554)) b!16386))

(assert (= (and d!3157 res!12197) b!16387))

(declare-fun m!11469 () Bool)

(assert (=> b!16383 m!11469))

(assert (=> b!16383 m!11469))

(declare-fun m!11471 () Bool)

(assert (=> b!16383 m!11471))

(declare-fun m!11473 () Bool)

(assert (=> d!3157 m!11473))

(declare-fun m!11475 () Bool)

(assert (=> d!3157 m!11475))

(declare-fun m!11477 () Bool)

(assert (=> b!16387 m!11477))

(assert (=> d!3059 d!3157))

(declare-fun b!16388 () Bool)

(declare-fun e!10105 () Bool)

(declare-fun tp!2879 () Bool)

(assert (=> b!16388 (= e!10105 (and tp_is_empty!831 tp!2879))))

(assert (=> b!16242 (= tp!2873 e!10105)))

(assert (= (and b!16242 (is-Cons!524 (t!3066 (toList!274 lm!221)))) b!16388))

(declare-fun b_lambda!1331 () Bool)

(assert (= b_lambda!1303 (or (and start!2782 b_free!569) b_lambda!1331)))

(declare-fun b_lambda!1333 () Bool)

(assert (= b_lambda!1329 (or (and start!2782 b_free!569) b_lambda!1333)))

(declare-fun b_lambda!1335 () Bool)

(assert (= b_lambda!1307 (or (and start!2782 b_free!569) b_lambda!1335)))

(declare-fun b_lambda!1337 () Bool)

(assert (= b_lambda!1327 (or (and start!2782 b_free!569) b_lambda!1337)))

(push 1)

(assert (not b!16312))

(assert (not b_lambda!1277))

(assert (not b_lambda!1333))

(assert (not b_lambda!1281))

(assert (not b!16377))

(assert tp_is_empty!831)

(assert (not d!3147))

(assert (not b!16387))

(assert (not b!16379))

(assert (not b_lambda!1335))

(assert (not b!16320))

(assert (not d!3157))

(assert (not b!16371))

(assert (not d!3143))

(assert (not b_lambda!1337))

(assert (not b!16383))

(assert (not b_lambda!1279))

(assert (not b!16388))

(assert (not d!3123))

(assert (not b!16380))

(assert b_and!1163)

(assert (not b_next!569))

(assert (not d!3155))

(assert (not b!16360))

(assert (not b!16382))

(assert (not b!16306))

(assert (not b_lambda!1275))

(assert (not b!16375))

(assert (not b_lambda!1331))

(assert (not b!16358))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1163)

(assert (not b_next!569))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!3247 () Bool)

(assert (=> d!3247 (= ($colon$colon!26 (removeStrictlySorted!16 (t!3066 (toList!274 lt!3976)) a!507) (h!1090 (toList!274 lt!3976))) (Cons!524 (h!1090 (toList!274 lt!3976)) (removeStrictlySorted!16 (t!3066 (toList!274 lt!3976)) a!507)))))

(assert (=> b!16383 d!3247))

(declare-fun b!16507 () Bool)

(declare-fun e!10200 () List!528)

(assert (=> b!16507 (= e!10200 ($colon$colon!26 (removeStrictlySorted!16 (t!3066 (t!3066 (toList!274 lt!3976))) a!507) (h!1090 (t!3066 (toList!274 lt!3976)))))))

(declare-fun d!3249 () Bool)

(declare-fun e!10202 () Bool)

(assert (=> d!3249 e!10202))

(declare-fun res!12266 () Bool)

(assert (=> d!3249 (=> (not res!12266) (not e!10202))))

(declare-fun lt!4070 () List!528)

(assert (=> d!3249 (= res!12266 (isStrictlySorted!164 lt!4070))))

(declare-fun e!10201 () List!528)

(assert (=> d!3249 (= lt!4070 e!10201)))

(declare-fun c!1579 () Bool)

(assert (=> d!3249 (= c!1579 (and (is-Cons!524 (t!3066 (toList!274 lt!3976))) (= (_1!343 (h!1090 (t!3066 (toList!274 lt!3976)))) a!507)))))

(assert (=> d!3249 (isStrictlySorted!164 (t!3066 (toList!274 lt!3976)))))

(assert (=> d!3249 (= (removeStrictlySorted!16 (t!3066 (toList!274 lt!3976)) a!507) lt!4070)))

(declare-fun b!16508 () Bool)

(assert (=> b!16508 (= e!10201 e!10200)))

(declare-fun c!1580 () Bool)

(assert (=> b!16508 (= c!1580 (and (is-Cons!524 (t!3066 (toList!274 lt!3976))) (not (= (_1!343 (h!1090 (t!3066 (toList!274 lt!3976)))) a!507))))))

(declare-fun b!16509 () Bool)

(assert (=> b!16509 (= e!10201 (t!3066 (t!3066 (toList!274 lt!3976))))))

(declare-fun b!16510 () Bool)

(assert (=> b!16510 (= e!10200 Nil!525)))

(declare-fun b!16511 () Bool)

(assert (=> b!16511 (= e!10202 (not (containsKey!19 lt!4070 a!507)))))

(assert (= (and d!3249 c!1579) b!16509))

(assert (= (and d!3249 (not c!1579)) b!16508))

(assert (= (and b!16508 c!1580) b!16507))

(assert (= (and b!16508 (not c!1580)) b!16510))

(assert (= (and d!3249 res!12266) b!16511))

(declare-fun m!11607 () Bool)

(assert (=> b!16507 m!11607))

(assert (=> b!16507 m!11607))

(declare-fun m!11609 () Bool)

(assert (=> b!16507 m!11609))

(declare-fun m!11611 () Bool)

(assert (=> d!3249 m!11611))

(declare-fun m!11613 () Bool)

(assert (=> d!3249 m!11613))

(declare-fun m!11615 () Bool)

(assert (=> b!16511 m!11615))

(assert (=> b!16383 d!3249))

