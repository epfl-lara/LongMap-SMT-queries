; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2778 () Bool)

(assert start!2778)

(declare-fun b_free!565 () Bool)

(declare-fun b_next!565 () Bool)

(assert (=> start!2778 (= b_free!565 (not b_next!565))))

(declare-fun tp!2855 () Bool)

(declare-fun b_and!1111 () Bool)

(assert (=> start!2778 (= tp!2855 b_and!1111)))

(declare-fun p!191 () Int)

(declare-datatypes ((B!686 0))(
  ( (B!687 (val!441 Int)) )
))
(declare-datatypes ((tuple2!682 0))(
  ( (tuple2!683 (_1!341 (_ BitVec 64)) (_2!341 B!686)) )
))
(declare-datatypes ((List!526 0))(
  ( (Nil!523) (Cons!522 (h!1088 tuple2!682) (t!3064 List!526)) )
))
(declare-datatypes ((ListLongMap!513 0))(
  ( (ListLongMap!514 (toList!272 List!526)) )
))
(declare-fun lm!221 () ListLongMap!513)

(declare-fun b!16171 () Bool)

(declare-fun a!507 () (_ BitVec 64))

(declare-fun e!9937 () Bool)

(declare-fun forall!143 (List!526 Int) Bool)

(declare-fun -!30 (ListLongMap!513 (_ BitVec 64)) ListLongMap!513)

(assert (=> b!16171 (= e!9937 (not (forall!143 (toList!272 (-!30 lm!221 a!507)) p!191)))))

(declare-fun lt!3963 () ListLongMap!513)

(assert (=> b!16171 (forall!143 (toList!272 (-!30 lt!3963 a!507)) p!191)))

(declare-datatypes ((Unit!318 0))(
  ( (Unit!319) )
))
(declare-fun lt!3964 () Unit!318)

(declare-fun removeValidProp!20 (ListLongMap!513 Int (_ BitVec 64)) Unit!318)

(assert (=> b!16171 (= lt!3964 (removeValidProp!20 lt!3963 p!191 a!507))))

(declare-fun res!12077 () Bool)

(declare-fun e!9935 () Bool)

(assert (=> start!2778 (=> (not res!12077) (not e!9935))))

(assert (=> start!2778 (= res!12077 (forall!143 (toList!272 lm!221) p!191))))

(assert (=> start!2778 e!9935))

(declare-fun e!9936 () Bool)

(declare-fun inv!888 (ListLongMap!513) Bool)

(assert (=> start!2778 (and (inv!888 lm!221) e!9936)))

(assert (=> start!2778 tp!2855))

(assert (=> start!2778 true))

(declare-fun b!16172 () Bool)

(declare-fun tp!2854 () Bool)

(assert (=> b!16172 (= e!9936 tp!2854)))

(declare-fun b!16170 () Bool)

(assert (=> b!16170 (= e!9935 e!9937)))

(declare-fun res!12076 () Bool)

(assert (=> b!16170 (=> (not res!12076) (not e!9937))))

(assert (=> b!16170 (= res!12076 (forall!143 (toList!272 lt!3963) p!191))))

(declare-fun tail!80 (ListLongMap!513) ListLongMap!513)

(assert (=> b!16170 (= lt!3963 (tail!80 lm!221))))

(declare-fun b!16169 () Bool)

(declare-fun res!12075 () Bool)

(assert (=> b!16169 (=> (not res!12075) (not e!9935))))

(declare-fun isEmpty!156 (ListLongMap!513) Bool)

(assert (=> b!16169 (= res!12075 (not (isEmpty!156 lm!221)))))

(assert (= (and start!2778 res!12077) b!16169))

(assert (= (and b!16169 res!12075) b!16170))

(assert (= (and b!16170 res!12076) b!16171))

(assert (= start!2778 b!16172))

(declare-fun m!11167 () Bool)

(assert (=> b!16171 m!11167))

(declare-fun m!11169 () Bool)

(assert (=> b!16171 m!11169))

(declare-fun m!11171 () Bool)

(assert (=> b!16171 m!11171))

(declare-fun m!11173 () Bool)

(assert (=> b!16171 m!11173))

(declare-fun m!11175 () Bool)

(assert (=> b!16171 m!11175))

(declare-fun m!11177 () Bool)

(assert (=> start!2778 m!11177))

(declare-fun m!11179 () Bool)

(assert (=> start!2778 m!11179))

(declare-fun m!11181 () Bool)

(assert (=> b!16170 m!11181))

(declare-fun m!11183 () Bool)

(assert (=> b!16170 m!11183))

(declare-fun m!11185 () Bool)

(assert (=> b!16169 m!11185))

(push 1)

(assert b_and!1111)

(assert (not b!16171))

(assert (not b!16169))

(assert (not b!16172))

(assert (not b!16170))

(assert (not b_next!565))

(assert (not start!2778))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1111)

(assert (not b_next!565))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!3029 () Bool)

(declare-fun lt!3979 () ListLongMap!513)

(declare-fun contains!203 (ListLongMap!513 (_ BitVec 64)) Bool)

(assert (=> d!3029 (not (contains!203 lt!3979 a!507))))

(declare-fun removeStrictlySorted!15 (List!526 (_ BitVec 64)) List!526)

(assert (=> d!3029 (= lt!3979 (ListLongMap!514 (removeStrictlySorted!15 (toList!272 lm!221) a!507)))))

(assert (=> d!3029 (= (-!30 lm!221 a!507) lt!3979)))

(declare-fun bs!761 () Bool)

(assert (= bs!761 d!3029))

(declare-fun m!11239 () Bool)

(assert (=> bs!761 m!11239))

(declare-fun m!11241 () Bool)

(assert (=> bs!761 m!11241))

(assert (=> b!16171 d!3029))

(declare-fun d!3041 () Bool)

(declare-fun res!12114 () Bool)

(declare-fun e!9974 () Bool)

(assert (=> d!3041 (=> res!12114 e!9974)))

(assert (=> d!3041 (= res!12114 (is-Nil!523 (toList!272 (-!30 lm!221 a!507))))))

(assert (=> d!3041 (= (forall!143 (toList!272 (-!30 lm!221 a!507)) p!191) e!9974)))

(declare-fun b!16215 () Bool)

(declare-fun e!9975 () Bool)

(assert (=> b!16215 (= e!9974 e!9975)))

(declare-fun res!12115 () Bool)

(assert (=> b!16215 (=> (not res!12115) (not e!9975))))

(declare-fun dynLambda!127 (Int tuple2!682) Bool)

(assert (=> b!16215 (= res!12115 (dynLambda!127 p!191 (h!1088 (toList!272 (-!30 lm!221 a!507)))))))

(declare-fun b!16216 () Bool)

(assert (=> b!16216 (= e!9975 (forall!143 (t!3064 (toList!272 (-!30 lm!221 a!507))) p!191))))

(assert (= (and d!3041 (not res!12114)) b!16215))

(assert (= (and b!16215 res!12115) b!16216))

(declare-fun b_lambda!1249 () Bool)

(assert (=> (not b_lambda!1249) (not b!16215)))

(declare-fun t!3074 () Bool)

(declare-fun tb!535 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3074) tb!535))

(declare-fun result!901 () Bool)

(assert (=> tb!535 (= result!901 true)))

(assert (=> b!16215 t!3074))

(declare-fun b_and!1123 () Bool)

(assert (= b_and!1111 (and (=> t!3074 result!901) b_and!1123)))

(declare-fun m!11249 () Bool)

(assert (=> b!16215 m!11249))

(declare-fun m!11251 () Bool)

(assert (=> b!16216 m!11251))

(assert (=> b!16171 d!3041))

(declare-fun d!3047 () Bool)

(declare-fun lt!3980 () ListLongMap!513)

(assert (=> d!3047 (not (contains!203 lt!3980 a!507))))

(assert (=> d!3047 (= lt!3980 (ListLongMap!514 (removeStrictlySorted!15 (toList!272 lt!3963) a!507)))))

(assert (=> d!3047 (= (-!30 lt!3963 a!507) lt!3980)))

(declare-fun bs!763 () Bool)

(assert (= bs!763 d!3047))

(declare-fun m!11255 () Bool)

(assert (=> bs!763 m!11255))

(declare-fun m!11259 () Bool)

(assert (=> bs!763 m!11259))

(assert (=> b!16171 d!3047))

(declare-fun d!3051 () Bool)

(declare-fun res!12118 () Bool)

(declare-fun e!9978 () Bool)

(assert (=> d!3051 (=> res!12118 e!9978)))

(assert (=> d!3051 (= res!12118 (is-Nil!523 (toList!272 (-!30 lt!3963 a!507))))))

(assert (=> d!3051 (= (forall!143 (toList!272 (-!30 lt!3963 a!507)) p!191) e!9978)))

(declare-fun b!16219 () Bool)

(declare-fun e!9979 () Bool)

(assert (=> b!16219 (= e!9978 e!9979)))

(declare-fun res!12119 () Bool)

(assert (=> b!16219 (=> (not res!12119) (not e!9979))))

(assert (=> b!16219 (= res!12119 (dynLambda!127 p!191 (h!1088 (toList!272 (-!30 lt!3963 a!507)))))))

(declare-fun b!16220 () Bool)

(assert (=> b!16220 (= e!9979 (forall!143 (t!3064 (toList!272 (-!30 lt!3963 a!507))) p!191))))

(assert (= (and d!3051 (not res!12118)) b!16219))

(assert (= (and b!16219 res!12119) b!16220))

(declare-fun b_lambda!1253 () Bool)

(assert (=> (not b_lambda!1253) (not b!16219)))

(declare-fun t!3078 () Bool)

(declare-fun tb!539 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3078) tb!539))

(declare-fun result!905 () Bool)

(assert (=> tb!539 (= result!905 true)))

(assert (=> b!16219 t!3078))

(declare-fun b_and!1127 () Bool)

(assert (= b_and!1123 (and (=> t!3078 result!905) b_and!1127)))

(declare-fun m!11265 () Bool)

(assert (=> b!16219 m!11265))

(declare-fun m!11267 () Bool)

(assert (=> b!16220 m!11267))

(assert (=> b!16171 d!3051))

(declare-fun d!3055 () Bool)

(assert (=> d!3055 (forall!143 (toList!272 (-!30 lt!3963 a!507)) p!191)))

(declare-fun lt!3990 () Unit!318)

(declare-fun choose!181 (ListLongMap!513 Int (_ BitVec 64)) Unit!318)

(assert (=> d!3055 (= lt!3990 (choose!181 lt!3963 p!191 a!507))))

(assert (=> d!3055 (forall!143 (toList!272 lt!3963) p!191)))

(assert (=> d!3055 (= (removeValidProp!20 lt!3963 p!191 a!507) lt!3990)))

(declare-fun bs!767 () Bool)

(assert (= bs!767 d!3055))

(assert (=> bs!767 m!11175))

(assert (=> bs!767 m!11173))

(declare-fun m!11283 () Bool)

(assert (=> bs!767 m!11283))

(assert (=> bs!767 m!11181))

(assert (=> b!16171 d!3055))

(declare-fun d!3065 () Bool)

(declare-fun res!12124 () Bool)

(declare-fun e!9984 () Bool)

(assert (=> d!3065 (=> res!12124 e!9984)))

(assert (=> d!3065 (= res!12124 (is-Nil!523 (toList!272 lt!3963)))))

(assert (=> d!3065 (= (forall!143 (toList!272 lt!3963) p!191) e!9984)))

(declare-fun b!16225 () Bool)

(declare-fun e!9985 () Bool)

(assert (=> b!16225 (= e!9984 e!9985)))

(declare-fun res!12125 () Bool)

(assert (=> b!16225 (=> (not res!12125) (not e!9985))))

(assert (=> b!16225 (= res!12125 (dynLambda!127 p!191 (h!1088 (toList!272 lt!3963))))))

(declare-fun b!16226 () Bool)

(assert (=> b!16226 (= e!9985 (forall!143 (t!3064 (toList!272 lt!3963)) p!191))))

(assert (= (and d!3065 (not res!12124)) b!16225))

(assert (= (and b!16225 res!12125) b!16226))

(declare-fun b_lambda!1259 () Bool)

(assert (=> (not b_lambda!1259) (not b!16225)))

(declare-fun t!3084 () Bool)

(declare-fun tb!545 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3084) tb!545))

(declare-fun result!911 () Bool)

(assert (=> tb!545 (= result!911 true)))

(assert (=> b!16225 t!3084))

(declare-fun b_and!1133 () Bool)

(assert (= b_and!1127 (and (=> t!3084 result!911) b_and!1133)))

(declare-fun m!11285 () Bool)

(assert (=> b!16225 m!11285))

(declare-fun m!11287 () Bool)

(assert (=> b!16226 m!11287))

(assert (=> b!16170 d!3065))

(declare-fun d!3067 () Bool)

(declare-fun tail!83 (List!526) List!526)

(assert (=> d!3067 (= (tail!80 lm!221) (ListLongMap!514 (tail!83 (toList!272 lm!221))))))

(declare-fun bs!768 () Bool)

(assert (= bs!768 d!3067))

(declare-fun m!11289 () Bool)

(assert (=> bs!768 m!11289))

(assert (=> b!16170 d!3067))

(declare-fun d!3069 () Bool)

(declare-fun isEmpty!160 (List!526) Bool)

(assert (=> d!3069 (= (isEmpty!156 lm!221) (isEmpty!160 (toList!272 lm!221)))))

(declare-fun bs!770 () Bool)

(assert (= bs!770 d!3069))

(declare-fun m!11297 () Bool)

(assert (=> bs!770 m!11297))

(assert (=> b!16169 d!3069))

(declare-fun d!3075 () Bool)

(declare-fun res!12128 () Bool)

(declare-fun e!9988 () Bool)

(assert (=> d!3075 (=> res!12128 e!9988)))

(assert (=> d!3075 (= res!12128 (is-Nil!523 (toList!272 lm!221)))))

(assert (=> d!3075 (= (forall!143 (toList!272 lm!221) p!191) e!9988)))

(declare-fun b!16229 () Bool)

(declare-fun e!9989 () Bool)

(assert (=> b!16229 (= e!9988 e!9989)))

(declare-fun res!12129 () Bool)

(assert (=> b!16229 (=> (not res!12129) (not e!9989))))

(assert (=> b!16229 (= res!12129 (dynLambda!127 p!191 (h!1088 (toList!272 lm!221))))))

(declare-fun b!16230 () Bool)

(assert (=> b!16230 (= e!9989 (forall!143 (t!3064 (toList!272 lm!221)) p!191))))

(assert (= (and d!3075 (not res!12128)) b!16229))

(assert (= (and b!16229 res!12129) b!16230))

(declare-fun b_lambda!1263 () Bool)

(assert (=> (not b_lambda!1263) (not b!16229)))

(declare-fun t!3088 () Bool)

(declare-fun tb!549 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3088) tb!549))

(declare-fun result!915 () Bool)

(assert (=> tb!549 (= result!915 true)))

(assert (=> b!16229 t!3088))

(declare-fun b_and!1137 () Bool)

(assert (= b_and!1133 (and (=> t!3088 result!915) b_and!1137)))

(declare-fun m!11299 () Bool)

(assert (=> b!16229 m!11299))

(declare-fun m!11301 () Bool)

(assert (=> b!16230 m!11301))

(assert (=> start!2778 d!3075))

(declare-fun d!3077 () Bool)

(declare-fun isStrictlySorted!166 (List!526) Bool)

(assert (=> d!3077 (= (inv!888 lm!221) (isStrictlySorted!166 (toList!272 lm!221)))))

(declare-fun bs!774 () Bool)

(assert (= bs!774 d!3077))

(declare-fun m!11313 () Bool)

(assert (=> bs!774 m!11313))

(assert (=> start!2778 d!3077))

(declare-fun b!16241 () Bool)

(declare-fun e!9996 () Bool)

(declare-fun tp_is_empty!829 () Bool)

(declare-fun tp!2872 () Bool)

(assert (=> b!16241 (= e!9996 (and tp_is_empty!829 tp!2872))))

(assert (=> b!16172 (= tp!2854 e!9996)))

(assert (= (and b!16172 (is-Cons!522 (toList!272 lm!221))) b!16241))

(declare-fun b_lambda!1267 () Bool)

(assert (= b_lambda!1249 (or (and start!2778 b_free!565) b_lambda!1267)))

(declare-fun b_lambda!1269 () Bool)

(assert (= b_lambda!1253 (or (and start!2778 b_free!565) b_lambda!1269)))

(declare-fun b_lambda!1271 () Bool)

(assert (= b_lambda!1263 (or (and start!2778 b_free!565) b_lambda!1271)))

(declare-fun b_lambda!1273 () Bool)

(assert (= b_lambda!1259 (or (and start!2778 b_free!565) b_lambda!1273)))

(push 1)

(assert (not d!3077))

(assert tp_is_empty!829)

(assert (not b_lambda!1269))

(assert (not b_lambda!1267))

(assert (not d!3067))

(assert (not b_lambda!1273))

(assert (not b!16230))

(assert b_and!1137)

(assert (not d!3055))

(assert (not b!16216))

(assert (not d!3029))

(assert (not b!16226))

(assert (not b!16220))

(assert (not b!16241))

(assert (not b_lambda!1271))

(assert (not b_next!565))

(assert (not d!3069))

(assert (not d!3047))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1137)

(assert (not b_next!565))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!3089 () Bool)

(assert (=> d!3089 (= (tail!83 (toList!272 lm!221)) (t!3064 (toList!272 lm!221)))))

(assert (=> d!3067 d!3089))

(declare-fun d!3091 () Bool)

(declare-fun res!12132 () Bool)

(declare-fun e!10001 () Bool)

(assert (=> d!3091 (=> res!12132 e!10001)))

(assert (=> d!3091 (= res!12132 (is-Nil!523 (t!3064 (toList!272 lt!3963))))))

(assert (=> d!3091 (= (forall!143 (t!3064 (toList!272 lt!3963)) p!191) e!10001)))

(declare-fun b!16248 () Bool)

(declare-fun e!10002 () Bool)

(assert (=> b!16248 (= e!10001 e!10002)))

(declare-fun res!12133 () Bool)

(assert (=> b!16248 (=> (not res!12133) (not e!10002))))

(assert (=> b!16248 (= res!12133 (dynLambda!127 p!191 (h!1088 (t!3064 (toList!272 lt!3963)))))))

(declare-fun b!16249 () Bool)

(assert (=> b!16249 (= e!10002 (forall!143 (t!3064 (t!3064 (toList!272 lt!3963))) p!191))))

(assert (= (and d!3091 (not res!12132)) b!16248))

(assert (= (and b!16248 res!12133) b!16249))

(declare-fun b_lambda!1291 () Bool)

(assert (=> (not b_lambda!1291) (not b!16248)))

(declare-fun t!3092 () Bool)

(declare-fun tb!553 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3092) tb!553))

(declare-fun result!925 () Bool)

(assert (=> tb!553 (= result!925 true)))

(assert (=> b!16248 t!3092))

(declare-fun b_and!1141 () Bool)

(assert (= b_and!1137 (and (=> t!3092 result!925) b_and!1141)))

(declare-fun m!11323 () Bool)

(assert (=> b!16248 m!11323))

(declare-fun m!11325 () Bool)

(assert (=> b!16249 m!11325))

(assert (=> b!16226 d!3091))

(declare-fun d!3093 () Bool)

(declare-fun res!12134 () Bool)

(declare-fun e!10005 () Bool)

(assert (=> d!3093 (=> res!12134 e!10005)))

(assert (=> d!3093 (= res!12134 (is-Nil!523 (t!3064 (toList!272 lm!221))))))

(assert (=> d!3093 (= (forall!143 (t!3064 (toList!272 lm!221)) p!191) e!10005)))

(declare-fun b!16254 () Bool)

(declare-fun e!10006 () Bool)

(assert (=> b!16254 (= e!10005 e!10006)))

(declare-fun res!12135 () Bool)

(assert (=> b!16254 (=> (not res!12135) (not e!10006))))

(assert (=> b!16254 (= res!12135 (dynLambda!127 p!191 (h!1088 (t!3064 (toList!272 lm!221)))))))

(declare-fun b!16255 () Bool)

(assert (=> b!16255 (= e!10006 (forall!143 (t!3064 (t!3064 (toList!272 lm!221))) p!191))))

(assert (= (and d!3093 (not res!12134)) b!16254))

(assert (= (and b!16254 res!12135) b!16255))

(declare-fun b_lambda!1293 () Bool)

(assert (=> (not b_lambda!1293) (not b!16254)))

(declare-fun t!3094 () Bool)

(declare-fun tb!555 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3094) tb!555))

(declare-fun result!927 () Bool)

(assert (=> tb!555 (= result!927 true)))

(assert (=> b!16254 t!3094))

(declare-fun b_and!1143 () Bool)

(assert (= b_and!1141 (and (=> t!3094 result!927) b_and!1143)))

(declare-fun m!11327 () Bool)

(assert (=> b!16254 m!11327))

(declare-fun m!11329 () Bool)

(assert (=> b!16255 m!11329))

(assert (=> b!16230 d!3093))

(declare-fun d!3095 () Bool)

(declare-fun res!12138 () Bool)

(declare-fun e!10009 () Bool)

(assert (=> d!3095 (=> res!12138 e!10009)))

(assert (=> d!3095 (= res!12138 (is-Nil!523 (t!3064 (toList!272 (-!30 lm!221 a!507)))))))

(assert (=> d!3095 (= (forall!143 (t!3064 (toList!272 (-!30 lm!221 a!507))) p!191) e!10009)))

(declare-fun b!16258 () Bool)

(declare-fun e!10010 () Bool)

(assert (=> b!16258 (= e!10009 e!10010)))

(declare-fun res!12139 () Bool)

(assert (=> b!16258 (=> (not res!12139) (not e!10010))))

(assert (=> b!16258 (= res!12139 (dynLambda!127 p!191 (h!1088 (t!3064 (toList!272 (-!30 lm!221 a!507))))))))

(declare-fun b!16259 () Bool)

(assert (=> b!16259 (= e!10010 (forall!143 (t!3064 (t!3064 (toList!272 (-!30 lm!221 a!507)))) p!191))))

(assert (= (and d!3095 (not res!12138)) b!16258))

(assert (= (and b!16258 res!12139) b!16259))

(declare-fun b_lambda!1295 () Bool)

(assert (=> (not b_lambda!1295) (not b!16258)))

(declare-fun t!3096 () Bool)

(declare-fun tb!557 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3096) tb!557))

(declare-fun result!929 () Bool)

(assert (=> tb!557 (= result!929 true)))

(assert (=> b!16258 t!3096))

(declare-fun b_and!1145 () Bool)

(assert (= b_and!1143 (and (=> t!3096 result!929) b_and!1145)))

(declare-fun m!11331 () Bool)

(assert (=> b!16258 m!11331))

(declare-fun m!11333 () Bool)

(assert (=> b!16259 m!11333))

(assert (=> b!16216 d!3095))

(declare-fun d!3097 () Bool)

(declare-fun res!12140 () Bool)

(declare-fun e!10011 () Bool)

(assert (=> d!3097 (=> res!12140 e!10011)))

(assert (=> d!3097 (= res!12140 (is-Nil!523 (t!3064 (toList!272 (-!30 lt!3963 a!507)))))))

(assert (=> d!3097 (= (forall!143 (t!3064 (toList!272 (-!30 lt!3963 a!507))) p!191) e!10011)))

(declare-fun b!16260 () Bool)

(declare-fun e!10012 () Bool)

(assert (=> b!16260 (= e!10011 e!10012)))

(declare-fun res!12141 () Bool)

(assert (=> b!16260 (=> (not res!12141) (not e!10012))))

(assert (=> b!16260 (= res!12141 (dynLambda!127 p!191 (h!1088 (t!3064 (toList!272 (-!30 lt!3963 a!507))))))))

(declare-fun b!16261 () Bool)

(assert (=> b!16261 (= e!10012 (forall!143 (t!3064 (t!3064 (toList!272 (-!30 lt!3963 a!507)))) p!191))))

(assert (= (and d!3097 (not res!12140)) b!16260))

(assert (= (and b!16260 res!12141) b!16261))

(declare-fun b_lambda!1297 () Bool)

(assert (=> (not b_lambda!1297) (not b!16260)))

(declare-fun t!3098 () Bool)

(declare-fun tb!559 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3098) tb!559))

(declare-fun result!931 () Bool)

(assert (=> tb!559 (= result!931 true)))

(assert (=> b!16260 t!3098))

(declare-fun b_and!1147 () Bool)

(assert (= b_and!1145 (and (=> t!3098 result!931) b_and!1147)))

(declare-fun m!11340 () Bool)

(assert (=> b!16260 m!11340))

(declare-fun m!11343 () Bool)

(assert (=> b!16261 m!11343))

(assert (=> b!16220 d!3097))

(declare-fun d!3099 () Bool)

(declare-fun e!10029 () Bool)

(assert (=> d!3099 e!10029))

(declare-fun res!12148 () Bool)

(assert (=> d!3099 (=> res!12148 e!10029)))

(declare-fun lt!4024 () Bool)

(assert (=> d!3099 (= res!12148 (not lt!4024))))

(declare-fun lt!4023 () Bool)

(assert (=> d!3099 (= lt!4024 lt!4023)))

(declare-fun lt!4022 () Unit!318)

(declare-fun e!10028 () Unit!318)

(assert (=> d!3099 (= lt!4022 e!10028)))

(declare-fun c!1530 () Bool)

(assert (=> d!3099 (= c!1530 lt!4023)))

(declare-fun containsKey!18 (List!526 (_ BitVec 64)) Bool)

(assert (=> d!3099 (= lt!4023 (containsKey!18 (toList!272 lt!3979) a!507))))

(assert (=> d!3099 (= (contains!203 lt!3979 a!507) lt!4024)))

(declare-fun b!16286 () Bool)

(declare-fun lt!4021 () Unit!318)

(assert (=> b!16286 (= e!10028 lt!4021)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!15 (List!526 (_ BitVec 64)) Unit!318)

(assert (=> b!16286 (= lt!4021 (lemmaContainsKeyImpliesGetValueByKeyDefined!15 (toList!272 lt!3979) a!507))))

(declare-datatypes ((Option!60 0))(
  ( (Some!59 (v!1389 B!686)) (None!58) )
))
(declare-fun isDefined!16 (Option!60) Bool)

(declare-fun getValueByKey!54 (List!526 (_ BitVec 64)) Option!60)

(assert (=> b!16286 (isDefined!16 (getValueByKey!54 (toList!272 lt!3979) a!507))))

(declare-fun b!16287 () Bool)

(declare-fun Unit!325 () Unit!318)

(assert (=> b!16287 (= e!10028 Unit!325)))

(declare-fun b!16288 () Bool)

(assert (=> b!16288 (= e!10029 (isDefined!16 (getValueByKey!54 (toList!272 lt!3979) a!507)))))

(assert (= (and d!3099 c!1530) b!16286))

(assert (= (and d!3099 (not c!1530)) b!16287))

(assert (= (and d!3099 (not res!12148)) b!16288))

(declare-fun m!11355 () Bool)

(assert (=> d!3099 m!11355))

(declare-fun m!11357 () Bool)

(assert (=> b!16286 m!11357))

(declare-fun m!11359 () Bool)

(assert (=> b!16286 m!11359))

(assert (=> b!16286 m!11359))

(declare-fun m!11361 () Bool)

(assert (=> b!16286 m!11361))

(assert (=> b!16288 m!11359))

(assert (=> b!16288 m!11359))

(assert (=> b!16288 m!11361))

(assert (=> d!3029 d!3099))

(declare-fun b!16324 () Bool)

(declare-fun e!10062 () List!526)

(declare-fun $colon$colon!25 (List!526 tuple2!682) List!526)

(assert (=> b!16324 (= e!10062 ($colon$colon!25 (removeStrictlySorted!15 (t!3064 (toList!272 lm!221)) a!507) (h!1088 (toList!272 lm!221))))))

(declare-fun d!3105 () Bool)

(declare-fun e!10060 () Bool)

(assert (=> d!3105 e!10060))

(declare-fun res!12174 () Bool)

(assert (=> d!3105 (=> (not res!12174) (not e!10060))))

(declare-fun lt!4031 () List!526)

(assert (=> d!3105 (= res!12174 (isStrictlySorted!166 lt!4031))))

(declare-fun e!10061 () List!526)

(assert (=> d!3105 (= lt!4031 e!10061)))

(declare-fun c!1536 () Bool)

(assert (=> d!3105 (= c!1536 (and (is-Cons!522 (toList!272 lm!221)) (= (_1!341 (h!1088 (toList!272 lm!221))) a!507)))))

(assert (=> d!3105 (isStrictlySorted!166 (toList!272 lm!221))))

(assert (=> d!3105 (= (removeStrictlySorted!15 (toList!272 lm!221) a!507) lt!4031)))

(declare-fun b!16325 () Bool)

(assert (=> b!16325 (= e!10061 (t!3064 (toList!272 lm!221)))))

(declare-fun b!16326 () Bool)

(assert (=> b!16326 (= e!10062 Nil!523)))

(declare-fun b!16327 () Bool)

(assert (=> b!16327 (= e!10060 (not (containsKey!18 lt!4031 a!507)))))

(declare-fun b!16328 () Bool)

(assert (=> b!16328 (= e!10061 e!10062)))

(declare-fun c!1537 () Bool)

(assert (=> b!16328 (= c!1537 (and (is-Cons!522 (toList!272 lm!221)) (not (= (_1!341 (h!1088 (toList!272 lm!221))) a!507))))))

(assert (= (and d!3105 c!1536) b!16325))

(assert (= (and d!3105 (not c!1536)) b!16328))

(assert (= (and b!16328 c!1537) b!16324))

(assert (= (and b!16328 (not c!1537)) b!16326))

(assert (= (and d!3105 res!12174) b!16327))

(declare-fun m!11395 () Bool)

(assert (=> b!16324 m!11395))

(assert (=> b!16324 m!11395))

(declare-fun m!11397 () Bool)

(assert (=> b!16324 m!11397))

(declare-fun m!11399 () Bool)

(assert (=> d!3105 m!11399))

(assert (=> d!3105 m!11313))

(declare-fun m!11401 () Bool)

(assert (=> b!16327 m!11401))

(assert (=> d!3029 d!3105))

(declare-fun d!3127 () Bool)

(declare-fun e!10067 () Bool)

(assert (=> d!3127 e!10067))

(declare-fun res!12176 () Bool)

(assert (=> d!3127 (=> res!12176 e!10067)))

(declare-fun lt!4036 () Bool)

(assert (=> d!3127 (= res!12176 (not lt!4036))))

(declare-fun lt!4035 () Bool)

(assert (=> d!3127 (= lt!4036 lt!4035)))

(declare-fun lt!4034 () Unit!318)

(declare-fun e!10066 () Unit!318)

(assert (=> d!3127 (= lt!4034 e!10066)))

(declare-fun c!1540 () Bool)

(assert (=> d!3127 (= c!1540 lt!4035)))

(assert (=> d!3127 (= lt!4035 (containsKey!18 (toList!272 lt!3980) a!507))))

(assert (=> d!3127 (= (contains!203 lt!3980 a!507) lt!4036)))

(declare-fun b!16334 () Bool)

(declare-fun lt!4033 () Unit!318)

(assert (=> b!16334 (= e!10066 lt!4033)))

(assert (=> b!16334 (= lt!4033 (lemmaContainsKeyImpliesGetValueByKeyDefined!15 (toList!272 lt!3980) a!507))))

(assert (=> b!16334 (isDefined!16 (getValueByKey!54 (toList!272 lt!3980) a!507))))

(declare-fun b!16335 () Bool)

(declare-fun Unit!327 () Unit!318)

(assert (=> b!16335 (= e!10066 Unit!327)))

(declare-fun b!16336 () Bool)

(assert (=> b!16336 (= e!10067 (isDefined!16 (getValueByKey!54 (toList!272 lt!3980) a!507)))))

(assert (= (and d!3127 c!1540) b!16334))

(assert (= (and d!3127 (not c!1540)) b!16335))

(assert (= (and d!3127 (not res!12176)) b!16336))

(declare-fun m!11413 () Bool)

(assert (=> d!3127 m!11413))

(declare-fun m!11415 () Bool)

(assert (=> b!16334 m!11415))

(declare-fun m!11417 () Bool)

(assert (=> b!16334 m!11417))

(assert (=> b!16334 m!11417))

(declare-fun m!11419 () Bool)

(assert (=> b!16334 m!11419))

(assert (=> b!16336 m!11417))

(assert (=> b!16336 m!11417))

(assert (=> b!16336 m!11419))

(assert (=> d!3047 d!3127))

(declare-fun b!16339 () Bool)

(declare-fun e!10072 () List!526)

(assert (=> b!16339 (= e!10072 ($colon$colon!25 (removeStrictlySorted!15 (t!3064 (toList!272 lt!3963)) a!507) (h!1088 (toList!272 lt!3963))))))

(declare-fun d!3131 () Bool)

(declare-fun e!10070 () Bool)

(assert (=> d!3131 e!10070))

(declare-fun res!12179 () Bool)

(assert (=> d!3131 (=> (not res!12179) (not e!10070))))

(declare-fun lt!4037 () List!526)

(assert (=> d!3131 (= res!12179 (isStrictlySorted!166 lt!4037))))

(declare-fun e!10071 () List!526)

(assert (=> d!3131 (= lt!4037 e!10071)))

(declare-fun c!1541 () Bool)

(assert (=> d!3131 (= c!1541 (and (is-Cons!522 (toList!272 lt!3963)) (= (_1!341 (h!1088 (toList!272 lt!3963))) a!507)))))

(assert (=> d!3131 (isStrictlySorted!166 (toList!272 lt!3963))))

(assert (=> d!3131 (= (removeStrictlySorted!15 (toList!272 lt!3963) a!507) lt!4037)))

(declare-fun b!16340 () Bool)

(assert (=> b!16340 (= e!10071 (t!3064 (toList!272 lt!3963)))))

(declare-fun b!16341 () Bool)

(assert (=> b!16341 (= e!10072 Nil!523)))

(declare-fun b!16342 () Bool)

(assert (=> b!16342 (= e!10070 (not (containsKey!18 lt!4037 a!507)))))

(declare-fun b!16343 () Bool)

(assert (=> b!16343 (= e!10071 e!10072)))

(declare-fun c!1542 () Bool)

(assert (=> b!16343 (= c!1542 (and (is-Cons!522 (toList!272 lt!3963)) (not (= (_1!341 (h!1088 (toList!272 lt!3963))) a!507))))))

(assert (= (and d!3131 c!1541) b!16340))

(assert (= (and d!3131 (not c!1541)) b!16343))

(assert (= (and b!16343 c!1542) b!16339))

(assert (= (and b!16343 (not c!1542)) b!16341))

(assert (= (and d!3131 res!12179) b!16342))

(declare-fun m!11425 () Bool)

(assert (=> b!16339 m!11425))

(assert (=> b!16339 m!11425))

(declare-fun m!11427 () Bool)

(assert (=> b!16339 m!11427))

(declare-fun m!11429 () Bool)

(assert (=> d!3131 m!11429))

(declare-fun m!11431 () Bool)

(assert (=> d!3131 m!11431))

(declare-fun m!11433 () Bool)

(assert (=> b!16342 m!11433))

(assert (=> d!3047 d!3131))

(declare-fun d!3135 () Bool)

(assert (=> d!3135 (= (isEmpty!160 (toList!272 lm!221)) (is-Nil!523 (toList!272 lm!221)))))

(assert (=> d!3069 d!3135))

(declare-fun d!3141 () Bool)

(declare-fun res!12184 () Bool)

(declare-fun e!10077 () Bool)

(assert (=> d!3141 (=> res!12184 e!10077)))

(assert (=> d!3141 (= res!12184 (or (is-Nil!523 (toList!272 lm!221)) (is-Nil!523 (t!3064 (toList!272 lm!221)))))))

(assert (=> d!3141 (= (isStrictlySorted!166 (toList!272 lm!221)) e!10077)))

(declare-fun b!16348 () Bool)

(declare-fun e!10078 () Bool)

(assert (=> b!16348 (= e!10077 e!10078)))

(declare-fun res!12185 () Bool)

(assert (=> b!16348 (=> (not res!12185) (not e!10078))))

(assert (=> b!16348 (= res!12185 (bvslt (_1!341 (h!1088 (toList!272 lm!221))) (_1!341 (h!1088 (t!3064 (toList!272 lm!221))))))))

(declare-fun b!16349 () Bool)

(assert (=> b!16349 (= e!10078 (isStrictlySorted!166 (t!3064 (toList!272 lm!221))))))

(assert (= (and d!3141 (not res!12184)) b!16348))

(assert (= (and b!16348 res!12185) b!16349))

(declare-fun m!11435 () Bool)

(assert (=> b!16349 m!11435))

(assert (=> d!3077 d!3141))

(assert (=> d!3055 d!3051))

(assert (=> d!3055 d!3047))

(declare-fun d!3145 () Bool)

(assert (=> d!3145 (forall!143 (toList!272 (-!30 lt!3963 a!507)) p!191)))

(assert (=> d!3145 true))

(declare-fun _$31!23 () Unit!318)

(assert (=> d!3145 (= (choose!181 lt!3963 p!191 a!507) _$31!23)))

(declare-fun bs!779 () Bool)

(assert (= bs!779 d!3145))

(assert (=> bs!779 m!11175))

(assert (=> bs!779 m!11173))

(assert (=> d!3055 d!3145))

(assert (=> d!3055 d!3065))

(declare-fun b!16357 () Bool)

(declare-fun e!10084 () Bool)

(declare-fun tp!2878 () Bool)

(assert (=> b!16357 (= e!10084 (and tp_is_empty!829 tp!2878))))

(assert (=> b!16241 (= tp!2872 e!10084)))

(assert (= (and b!16241 (is-Cons!522 (t!3064 (toList!272 lm!221)))) b!16357))

(declare-fun b_lambda!1319 () Bool)

(assert (= b_lambda!1293 (or (and start!2778 b_free!565) b_lambda!1319)))

(declare-fun b_lambda!1321 () Bool)

(assert (= b_lambda!1295 (or (and start!2778 b_free!565) b_lambda!1321)))

(declare-fun b_lambda!1323 () Bool)

(assert (= b_lambda!1297 (or (and start!2778 b_free!565) b_lambda!1323)))

(declare-fun b_lambda!1325 () Bool)

(assert (= b_lambda!1291 (or (and start!2778 b_free!565) b_lambda!1325)))

(push 1)

(assert (not d!3127))

(assert b_and!1147)

(assert (not b_lambda!1321))

(assert tp_is_empty!829)

(assert (not b!16261))

(assert (not b_lambda!1325))

(assert (not b!16259))

(assert (not b!16349))

(assert (not b!16357))

(assert (not d!3099))

(assert (not b_lambda!1273))

(assert (not b!16342))

(assert (not d!3105))

(assert (not b!16249))

(assert (not b_lambda!1319))

(assert (not b!16324))

(assert (not b_lambda!1269))

(assert (not b!16334))

(assert (not b_lambda!1323))

(assert (not b!16286))

(assert (not b!16339))

(assert (not b_lambda!1267))

(assert (not d!3145))

(assert (not b!16255))

(assert (not b!16327))

(assert (not b!16288))

(assert (not b_lambda!1271))

(assert (not b_next!565))

(assert (not b!16336))

(assert (not d!3131))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1147)

(assert (not b_next!565))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!3173 () Bool)

(assert (=> d!3173 (= ($colon$colon!25 (removeStrictlySorted!15 (t!3064 (toList!272 lt!3963)) a!507) (h!1088 (toList!272 lt!3963))) (Cons!522 (h!1088 (toList!272 lt!3963)) (removeStrictlySorted!15 (t!3064 (toList!272 lt!3963)) a!507)))))

(assert (=> b!16339 d!3173))

(declare-fun b!16413 () Bool)

(declare-fun e!10126 () List!526)

(assert (=> b!16413 (= e!10126 ($colon$colon!25 (removeStrictlySorted!15 (t!3064 (t!3064 (toList!272 lt!3963))) a!507) (h!1088 (t!3064 (toList!272 lt!3963)))))))

(declare-fun d!3175 () Bool)

(declare-fun e!10124 () Bool)

(assert (=> d!3175 e!10124))

(declare-fun res!12210 () Bool)

(assert (=> d!3175 (=> (not res!12210) (not e!10124))))

(declare-fun lt!4062 () List!526)

(assert (=> d!3175 (= res!12210 (isStrictlySorted!166 lt!4062))))

(declare-fun e!10125 () List!526)

(assert (=> d!3175 (= lt!4062 e!10125)))

(declare-fun c!1561 () Bool)

(assert (=> d!3175 (= c!1561 (and (is-Cons!522 (t!3064 (toList!272 lt!3963))) (= (_1!341 (h!1088 (t!3064 (toList!272 lt!3963)))) a!507)))))

(assert (=> d!3175 (isStrictlySorted!166 (t!3064 (toList!272 lt!3963)))))

(assert (=> d!3175 (= (removeStrictlySorted!15 (t!3064 (toList!272 lt!3963)) a!507) lt!4062)))

(declare-fun b!16414 () Bool)

(assert (=> b!16414 (= e!10125 (t!3064 (t!3064 (toList!272 lt!3963))))))

(declare-fun b!16415 () Bool)

(assert (=> b!16415 (= e!10126 Nil!523)))

(declare-fun b!16416 () Bool)

(assert (=> b!16416 (= e!10124 (not (containsKey!18 lt!4062 a!507)))))

(declare-fun b!16417 () Bool)

(assert (=> b!16417 (= e!10125 e!10126)))

(declare-fun c!1562 () Bool)

(assert (=> b!16417 (= c!1562 (and (is-Cons!522 (t!3064 (toList!272 lt!3963))) (not (= (_1!341 (h!1088 (t!3064 (toList!272 lt!3963)))) a!507))))))

(assert (= (and d!3175 c!1561) b!16414))

(assert (= (and d!3175 (not c!1561)) b!16417))

(assert (= (and b!16417 c!1562) b!16413))

(assert (= (and b!16417 (not c!1562)) b!16415))

(assert (= (and d!3175 res!12210) b!16416))

(declare-fun m!11501 () Bool)

(assert (=> b!16413 m!11501))

(assert (=> b!16413 m!11501))

(declare-fun m!11503 () Bool)

(assert (=> b!16413 m!11503))

(declare-fun m!11505 () Bool)

(assert (=> d!3175 m!11505))

(declare-fun m!11507 () Bool)

(assert (=> d!3175 m!11507))

(declare-fun m!11509 () Bool)

(assert (=> b!16416 m!11509))

(assert (=> b!16339 d!3175))

(declare-fun d!3179 () Bool)

(declare-fun isEmpty!163 (Option!60) Bool)

(assert (=> d!3179 (= (isDefined!16 (getValueByKey!54 (toList!272 lt!3980) a!507)) (not (isEmpty!163 (getValueByKey!54 (toList!272 lt!3980) a!507))))))

(declare-fun bs!782 () Bool)

(assert (= bs!782 d!3179))

(assert (=> bs!782 m!11417))

(declare-fun m!11515 () Bool)

(assert (=> bs!782 m!11515))

(assert (=> b!16336 d!3179))

(declare-fun d!3185 () Bool)

(declare-fun c!1571 () Bool)

(assert (=> d!3185 (= c!1571 (and (is-Cons!522 (toList!272 lt!3980)) (= (_1!341 (h!1088 (toList!272 lt!3980))) a!507)))))

(declare-fun e!10144 () Option!60)

(assert (=> d!3185 (= (getValueByKey!54 (toList!272 lt!3980) a!507) e!10144)))

(declare-fun b!16444 () Bool)

(declare-fun e!10145 () Option!60)

(assert (=> b!16444 (= e!10144 e!10145)))

(declare-fun c!1572 () Bool)

(assert (=> b!16444 (= c!1572 (and (is-Cons!522 (toList!272 lt!3980)) (not (= (_1!341 (h!1088 (toList!272 lt!3980))) a!507))))))

(declare-fun b!16446 () Bool)

(assert (=> b!16446 (= e!10145 None!58)))

(declare-fun b!16443 () Bool)

(assert (=> b!16443 (= e!10144 (Some!59 (_2!341 (h!1088 (toList!272 lt!3980)))))))

(declare-fun b!16445 () Bool)

(assert (=> b!16445 (= e!10145 (getValueByKey!54 (t!3064 (toList!272 lt!3980)) a!507))))

(assert (= (and d!3185 c!1571) b!16443))

(assert (= (and d!3185 (not c!1571)) b!16444))

(assert (= (and b!16444 c!1572) b!16445))

(assert (= (and b!16444 (not c!1572)) b!16446))

(declare-fun m!11531 () Bool)

(assert (=> b!16445 m!11531))

(assert (=> b!16336 d!3185))

(declare-fun d!3197 () Bool)

(declare-fun res!12233 () Bool)

(declare-fun e!10161 () Bool)

(assert (=> d!3197 (=> res!12233 e!10161)))

(assert (=> d!3197 (= res!12233 (and (is-Cons!522 lt!4031) (= (_1!341 (h!1088 lt!4031)) a!507)))))

(assert (=> d!3197 (= (containsKey!18 lt!4031 a!507) e!10161)))

(declare-fun b!16464 () Bool)

(declare-fun e!10162 () Bool)

(assert (=> b!16464 (= e!10161 e!10162)))

(declare-fun res!12234 () Bool)

(assert (=> b!16464 (=> (not res!12234) (not e!10162))))

(assert (=> b!16464 (= res!12234 (and (or (not (is-Cons!522 lt!4031)) (bvsle (_1!341 (h!1088 lt!4031)) a!507)) (is-Cons!522 lt!4031) (bvslt (_1!341 (h!1088 lt!4031)) a!507)))))

(declare-fun b!16465 () Bool)

(assert (=> b!16465 (= e!10162 (containsKey!18 (t!3064 lt!4031) a!507))))

(assert (= (and d!3197 (not res!12233)) b!16464))

(assert (= (and b!16464 res!12234) b!16465))

(declare-fun m!11555 () Bool)

(assert (=> b!16465 m!11555))

(assert (=> b!16327 d!3197))

(declare-fun d!3211 () Bool)

(assert (=> d!3211 (isDefined!16 (getValueByKey!54 (toList!272 lt!3979) a!507))))

(declare-fun lt!4067 () Unit!318)

(declare-fun choose!185 (List!526 (_ BitVec 64)) Unit!318)

(assert (=> d!3211 (= lt!4067 (choose!185 (toList!272 lt!3979) a!507))))

(declare-fun e!10170 () Bool)

(assert (=> d!3211 e!10170))

(declare-fun res!12241 () Bool)

(assert (=> d!3211 (=> (not res!12241) (not e!10170))))

(assert (=> d!3211 (= res!12241 (isStrictlySorted!166 (toList!272 lt!3979)))))

(assert (=> d!3211 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!15 (toList!272 lt!3979) a!507) lt!4067)))

(declare-fun b!16473 () Bool)

(assert (=> b!16473 (= e!10170 (containsKey!18 (toList!272 lt!3979) a!507))))

(assert (= (and d!3211 res!12241) b!16473))

(assert (=> d!3211 m!11359))

(assert (=> d!3211 m!11359))

(assert (=> d!3211 m!11361))

(declare-fun m!11559 () Bool)

(assert (=> d!3211 m!11559))

(declare-fun m!11561 () Bool)

(assert (=> d!3211 m!11561))

(assert (=> b!16473 m!11355))

(assert (=> b!16286 d!3211))

(declare-fun d!3215 () Bool)

(assert (=> d!3215 (= (isDefined!16 (getValueByKey!54 (toList!272 lt!3979) a!507)) (not (isEmpty!163 (getValueByKey!54 (toList!272 lt!3979) a!507))))))

(declare-fun bs!783 () Bool)

(assert (= bs!783 d!3215))

(assert (=> bs!783 m!11359))

(declare-fun m!11563 () Bool)

(assert (=> bs!783 m!11563))

(assert (=> b!16286 d!3215))

(declare-fun d!3217 () Bool)

(declare-fun c!1575 () Bool)

(assert (=> d!3217 (= c!1575 (and (is-Cons!522 (toList!272 lt!3979)) (= (_1!341 (h!1088 (toList!272 lt!3979))) a!507)))))

(declare-fun e!10171 () Option!60)

(assert (=> d!3217 (= (getValueByKey!54 (toList!272 lt!3979) a!507) e!10171)))

(declare-fun b!16475 () Bool)

(declare-fun e!10172 () Option!60)

(assert (=> b!16475 (= e!10171 e!10172)))

(declare-fun c!1576 () Bool)

(assert (=> b!16475 (= c!1576 (and (is-Cons!522 (toList!272 lt!3979)) (not (= (_1!341 (h!1088 (toList!272 lt!3979))) a!507))))))

(declare-fun b!16477 () Bool)

(assert (=> b!16477 (= e!10172 None!58)))

(declare-fun b!16474 () Bool)

(assert (=> b!16474 (= e!10171 (Some!59 (_2!341 (h!1088 (toList!272 lt!3979)))))))

(declare-fun b!16476 () Bool)

(assert (=> b!16476 (= e!10172 (getValueByKey!54 (t!3064 (toList!272 lt!3979)) a!507))))

(assert (= (and d!3217 c!1575) b!16474))

(assert (= (and d!3217 (not c!1575)) b!16475))

(assert (= (and b!16475 c!1576) b!16476))

(assert (= (and b!16475 (not c!1576)) b!16477))

(declare-fun m!11565 () Bool)

(assert (=> b!16476 m!11565))

(assert (=> b!16286 d!3217))

(declare-fun d!3219 () Bool)

(declare-fun res!12242 () Bool)

(declare-fun e!10173 () Bool)

(assert (=> d!3219 (=> res!12242 e!10173)))

(assert (=> d!3219 (= res!12242 (or (is-Nil!523 (t!3064 (toList!272 lm!221))) (is-Nil!523 (t!3064 (t!3064 (toList!272 lm!221))))))))

(assert (=> d!3219 (= (isStrictlySorted!166 (t!3064 (toList!272 lm!221))) e!10173)))

(declare-fun b!16478 () Bool)

(declare-fun e!10174 () Bool)

(assert (=> b!16478 (= e!10173 e!10174)))

(declare-fun res!12243 () Bool)

(assert (=> b!16478 (=> (not res!12243) (not e!10174))))

(assert (=> b!16478 (= res!12243 (bvslt (_1!341 (h!1088 (t!3064 (toList!272 lm!221)))) (_1!341 (h!1088 (t!3064 (t!3064 (toList!272 lm!221)))))))))

(declare-fun b!16479 () Bool)

(assert (=> b!16479 (= e!10174 (isStrictlySorted!166 (t!3064 (t!3064 (toList!272 lm!221)))))))

(assert (= (and d!3219 (not res!12242)) b!16478))

(assert (= (and b!16478 res!12243) b!16479))

(declare-fun m!11567 () Bool)

(assert (=> b!16479 m!11567))

(assert (=> b!16349 d!3219))

(declare-fun d!3221 () Bool)

(declare-fun res!12244 () Bool)

(declare-fun e!10175 () Bool)

(assert (=> d!3221 (=> res!12244 e!10175)))

(assert (=> d!3221 (= res!12244 (is-Nil!523 (t!3064 (t!3064 (toList!272 (-!30 lm!221 a!507))))))))

(assert (=> d!3221 (= (forall!143 (t!3064 (t!3064 (toList!272 (-!30 lm!221 a!507)))) p!191) e!10175)))

(declare-fun b!16480 () Bool)

(declare-fun e!10176 () Bool)

(assert (=> b!16480 (= e!10175 e!10176)))

(declare-fun res!12245 () Bool)

(assert (=> b!16480 (=> (not res!12245) (not e!10176))))

(assert (=> b!16480 (= res!12245 (dynLambda!127 p!191 (h!1088 (t!3064 (t!3064 (toList!272 (-!30 lm!221 a!507)))))))))

(declare-fun b!16481 () Bool)

(assert (=> b!16481 (= e!10176 (forall!143 (t!3064 (t!3064 (t!3064 (toList!272 (-!30 lm!221 a!507))))) p!191))))

(assert (= (and d!3221 (not res!12244)) b!16480))

(assert (= (and b!16480 res!12245) b!16481))

(declare-fun b_lambda!1355 () Bool)

(assert (=> (not b_lambda!1355) (not b!16480)))

(declare-fun t!3126 () Bool)

(declare-fun tb!585 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3126) tb!585))

(declare-fun result!957 () Bool)

(assert (=> tb!585 (= result!957 true)))

(assert (=> b!16480 t!3126))

(declare-fun b_and!1173 () Bool)

(assert (= b_and!1147 (and (=> t!3126 result!957) b_and!1173)))

(declare-fun m!11569 () Bool)

(assert (=> b!16480 m!11569))

(declare-fun m!11571 () Bool)

(assert (=> b!16481 m!11571))

(assert (=> b!16259 d!3221))

(declare-fun d!3223 () Bool)

(declare-fun res!12246 () Bool)

(declare-fun e!10177 () Bool)

(assert (=> d!3223 (=> res!12246 e!10177)))

(assert (=> d!3223 (= res!12246 (or (is-Nil!523 lt!4031) (is-Nil!523 (t!3064 lt!4031))))))

(assert (=> d!3223 (= (isStrictlySorted!166 lt!4031) e!10177)))

(declare-fun b!16482 () Bool)

(declare-fun e!10178 () Bool)

(assert (=> b!16482 (= e!10177 e!10178)))

(declare-fun res!12247 () Bool)

(assert (=> b!16482 (=> (not res!12247) (not e!10178))))

(assert (=> b!16482 (= res!12247 (bvslt (_1!341 (h!1088 lt!4031)) (_1!341 (h!1088 (t!3064 lt!4031)))))))

(declare-fun b!16483 () Bool)

(assert (=> b!16483 (= e!10178 (isStrictlySorted!166 (t!3064 lt!4031)))))

(assert (= (and d!3223 (not res!12246)) b!16482))

(assert (= (and b!16482 res!12247) b!16483))

(declare-fun m!11573 () Bool)

(assert (=> b!16483 m!11573))

(assert (=> d!3105 d!3223))

(assert (=> d!3105 d!3141))

(declare-fun d!3225 () Bool)

(declare-fun res!12248 () Bool)

(declare-fun e!10179 () Bool)

(assert (=> d!3225 (=> res!12248 e!10179)))

(assert (=> d!3225 (= res!12248 (and (is-Cons!522 lt!4037) (= (_1!341 (h!1088 lt!4037)) a!507)))))

(assert (=> d!3225 (= (containsKey!18 lt!4037 a!507) e!10179)))

(declare-fun b!16484 () Bool)

(declare-fun e!10180 () Bool)

(assert (=> b!16484 (= e!10179 e!10180)))

(declare-fun res!12249 () Bool)

(assert (=> b!16484 (=> (not res!12249) (not e!10180))))

(assert (=> b!16484 (= res!12249 (and (or (not (is-Cons!522 lt!4037)) (bvsle (_1!341 (h!1088 lt!4037)) a!507)) (is-Cons!522 lt!4037) (bvslt (_1!341 (h!1088 lt!4037)) a!507)))))

(declare-fun b!16485 () Bool)

(assert (=> b!16485 (= e!10180 (containsKey!18 (t!3064 lt!4037) a!507))))

(assert (= (and d!3225 (not res!12248)) b!16484))

(assert (= (and b!16484 res!12249) b!16485))

(declare-fun m!11575 () Bool)

(assert (=> b!16485 m!11575))

(assert (=> b!16342 d!3225))

(declare-fun d!3227 () Bool)

(declare-fun res!12250 () Bool)

(declare-fun e!10181 () Bool)

(assert (=> d!3227 (=> res!12250 e!10181)))

(assert (=> d!3227 (= res!12250 (is-Nil!523 (t!3064 (t!3064 (toList!272 (-!30 lt!3963 a!507))))))))

(assert (=> d!3227 (= (forall!143 (t!3064 (t!3064 (toList!272 (-!30 lt!3963 a!507)))) p!191) e!10181)))

(declare-fun b!16486 () Bool)

(declare-fun e!10182 () Bool)

(assert (=> b!16486 (= e!10181 e!10182)))

(declare-fun res!12251 () Bool)

(assert (=> b!16486 (=> (not res!12251) (not e!10182))))

(assert (=> b!16486 (= res!12251 (dynLambda!127 p!191 (h!1088 (t!3064 (t!3064 (toList!272 (-!30 lt!3963 a!507)))))))))

(declare-fun b!16487 () Bool)

(assert (=> b!16487 (= e!10182 (forall!143 (t!3064 (t!3064 (t!3064 (toList!272 (-!30 lt!3963 a!507))))) p!191))))

(assert (= (and d!3227 (not res!12250)) b!16486))

(assert (= (and b!16486 res!12251) b!16487))

(declare-fun b_lambda!1357 () Bool)

(assert (=> (not b_lambda!1357) (not b!16486)))

(declare-fun t!3128 () Bool)

(declare-fun tb!587 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3128) tb!587))

(declare-fun result!959 () Bool)

(assert (=> tb!587 (= result!959 true)))

(assert (=> b!16486 t!3128))

(declare-fun b_and!1175 () Bool)

(assert (= b_and!1173 (and (=> t!3128 result!959) b_and!1175)))

(declare-fun m!11577 () Bool)

(assert (=> b!16486 m!11577))

(declare-fun m!11579 () Bool)

(assert (=> b!16487 m!11579))

(assert (=> b!16261 d!3227))

(declare-fun d!3229 () Bool)

(assert (=> d!3229 (= ($colon$colon!25 (removeStrictlySorted!15 (t!3064 (toList!272 lm!221)) a!507) (h!1088 (toList!272 lm!221))) (Cons!522 (h!1088 (toList!272 lm!221)) (removeStrictlySorted!15 (t!3064 (toList!272 lm!221)) a!507)))))

(assert (=> b!16324 d!3229))

(declare-fun b!16488 () Bool)

(declare-fun e!10185 () List!526)

(assert (=> b!16488 (= e!10185 ($colon$colon!25 (removeStrictlySorted!15 (t!3064 (t!3064 (toList!272 lm!221))) a!507) (h!1088 (t!3064 (toList!272 lm!221)))))))

(declare-fun d!3231 () Bool)

(declare-fun e!10183 () Bool)

(assert (=> d!3231 e!10183))

(declare-fun res!12252 () Bool)

(assert (=> d!3231 (=> (not res!12252) (not e!10183))))

(declare-fun lt!4068 () List!526)

(assert (=> d!3231 (= res!12252 (isStrictlySorted!166 lt!4068))))

(declare-fun e!10184 () List!526)

(assert (=> d!3231 (= lt!4068 e!10184)))

(declare-fun c!1577 () Bool)

(assert (=> d!3231 (= c!1577 (and (is-Cons!522 (t!3064 (toList!272 lm!221))) (= (_1!341 (h!1088 (t!3064 (toList!272 lm!221)))) a!507)))))

(assert (=> d!3231 (isStrictlySorted!166 (t!3064 (toList!272 lm!221)))))

(assert (=> d!3231 (= (removeStrictlySorted!15 (t!3064 (toList!272 lm!221)) a!507) lt!4068)))

(declare-fun b!16489 () Bool)

(assert (=> b!16489 (= e!10184 (t!3064 (t!3064 (toList!272 lm!221))))))

(declare-fun b!16490 () Bool)

(assert (=> b!16490 (= e!10185 Nil!523)))

(declare-fun b!16491 () Bool)

(assert (=> b!16491 (= e!10183 (not (containsKey!18 lt!4068 a!507)))))

(declare-fun b!16492 () Bool)

(assert (=> b!16492 (= e!10184 e!10185)))

(declare-fun c!1578 () Bool)

(assert (=> b!16492 (= c!1578 (and (is-Cons!522 (t!3064 (toList!272 lm!221))) (not (= (_1!341 (h!1088 (t!3064 (toList!272 lm!221)))) a!507))))))

(assert (= (and d!3231 c!1577) b!16489))

(assert (= (and d!3231 (not c!1577)) b!16492))

(assert (= (and b!16492 c!1578) b!16488))

(assert (= (and b!16492 (not c!1578)) b!16490))

(assert (= (and d!3231 res!12252) b!16491))

(declare-fun m!11581 () Bool)

(assert (=> b!16488 m!11581))

(assert (=> b!16488 m!11581))

(declare-fun m!11583 () Bool)

(assert (=> b!16488 m!11583))

(declare-fun m!11585 () Bool)

(assert (=> d!3231 m!11585))

(assert (=> d!3231 m!11435))

(declare-fun m!11587 () Bool)

(assert (=> b!16491 m!11587))

(assert (=> b!16324 d!3231))

(declare-fun d!3233 () Bool)

(declare-fun res!12253 () Bool)

(declare-fun e!10186 () Bool)

(assert (=> d!3233 (=> res!12253 e!10186)))

(assert (=> d!3233 (= res!12253 (and (is-Cons!522 (toList!272 lt!3979)) (= (_1!341 (h!1088 (toList!272 lt!3979))) a!507)))))

(assert (=> d!3233 (= (containsKey!18 (toList!272 lt!3979) a!507) e!10186)))

(declare-fun b!16493 () Bool)

(declare-fun e!10187 () Bool)

(assert (=> b!16493 (= e!10186 e!10187)))

(declare-fun res!12254 () Bool)

(assert (=> b!16493 (=> (not res!12254) (not e!10187))))

(assert (=> b!16493 (= res!12254 (and (or (not (is-Cons!522 (toList!272 lt!3979))) (bvsle (_1!341 (h!1088 (toList!272 lt!3979))) a!507)) (is-Cons!522 (toList!272 lt!3979)) (bvslt (_1!341 (h!1088 (toList!272 lt!3979))) a!507)))))

(declare-fun b!16494 () Bool)

(assert (=> b!16494 (= e!10187 (containsKey!18 (t!3064 (toList!272 lt!3979)) a!507))))

(assert (= (and d!3233 (not res!12253)) b!16493))

(assert (= (and b!16493 res!12254) b!16494))

(declare-fun m!11589 () Bool)

(assert (=> b!16494 m!11589))

(assert (=> d!3099 d!3233))

(assert (=> b!16288 d!3215))

(assert (=> b!16288 d!3217))

(declare-fun d!3235 () Bool)

(declare-fun res!12255 () Bool)

(declare-fun e!10188 () Bool)

(assert (=> d!3235 (=> res!12255 e!10188)))

(assert (=> d!3235 (= res!12255 (or (is-Nil!523 lt!4037) (is-Nil!523 (t!3064 lt!4037))))))

(assert (=> d!3235 (= (isStrictlySorted!166 lt!4037) e!10188)))

(declare-fun b!16495 () Bool)

(declare-fun e!10189 () Bool)

(assert (=> b!16495 (= e!10188 e!10189)))

(declare-fun res!12256 () Bool)

(assert (=> b!16495 (=> (not res!12256) (not e!10189))))

(assert (=> b!16495 (= res!12256 (bvslt (_1!341 (h!1088 lt!4037)) (_1!341 (h!1088 (t!3064 lt!4037)))))))

(declare-fun b!16496 () Bool)

(assert (=> b!16496 (= e!10189 (isStrictlySorted!166 (t!3064 lt!4037)))))

(assert (= (and d!3235 (not res!12255)) b!16495))

(assert (= (and b!16495 res!12256) b!16496))

(declare-fun m!11591 () Bool)

(assert (=> b!16496 m!11591))

(assert (=> d!3131 d!3235))

(declare-fun d!3237 () Bool)

(declare-fun res!12257 () Bool)

(declare-fun e!10190 () Bool)

(assert (=> d!3237 (=> res!12257 e!10190)))

(assert (=> d!3237 (= res!12257 (or (is-Nil!523 (toList!272 lt!3963)) (is-Nil!523 (t!3064 (toList!272 lt!3963)))))))

(assert (=> d!3237 (= (isStrictlySorted!166 (toList!272 lt!3963)) e!10190)))

(declare-fun b!16497 () Bool)

(declare-fun e!10191 () Bool)

(assert (=> b!16497 (= e!10190 e!10191)))

(declare-fun res!12258 () Bool)

(assert (=> b!16497 (=> (not res!12258) (not e!10191))))

(assert (=> b!16497 (= res!12258 (bvslt (_1!341 (h!1088 (toList!272 lt!3963))) (_1!341 (h!1088 (t!3064 (toList!272 lt!3963))))))))

(declare-fun b!16498 () Bool)

(assert (=> b!16498 (= e!10191 (isStrictlySorted!166 (t!3064 (toList!272 lt!3963))))))

(assert (= (and d!3237 (not res!12257)) b!16497))

(assert (= (and b!16497 res!12258) b!16498))

(assert (=> b!16498 m!11507))

(assert (=> d!3131 d!3237))

(declare-fun d!3239 () Bool)

(declare-fun res!12259 () Bool)

(declare-fun e!10192 () Bool)

(assert (=> d!3239 (=> res!12259 e!10192)))

(assert (=> d!3239 (= res!12259 (and (is-Cons!522 (toList!272 lt!3980)) (= (_1!341 (h!1088 (toList!272 lt!3980))) a!507)))))

(assert (=> d!3239 (= (containsKey!18 (toList!272 lt!3980) a!507) e!10192)))

(declare-fun b!16499 () Bool)

(declare-fun e!10193 () Bool)

(assert (=> b!16499 (= e!10192 e!10193)))

(declare-fun res!12260 () Bool)

(assert (=> b!16499 (=> (not res!12260) (not e!10193))))

(assert (=> b!16499 (= res!12260 (and (or (not (is-Cons!522 (toList!272 lt!3980))) (bvsle (_1!341 (h!1088 (toList!272 lt!3980))) a!507)) (is-Cons!522 (toList!272 lt!3980)) (bvslt (_1!341 (h!1088 (toList!272 lt!3980))) a!507)))))

(declare-fun b!16500 () Bool)

(assert (=> b!16500 (= e!10193 (containsKey!18 (t!3064 (toList!272 lt!3980)) a!507))))

(assert (= (and d!3239 (not res!12259)) b!16499))

(assert (= (and b!16499 res!12260) b!16500))

(declare-fun m!11593 () Bool)

(assert (=> b!16500 m!11593))

(assert (=> d!3127 d!3239))

(assert (=> d!3145 d!3051))

(assert (=> d!3145 d!3047))

(declare-fun d!3241 () Bool)

(assert (=> d!3241 (isDefined!16 (getValueByKey!54 (toList!272 lt!3980) a!507))))

(declare-fun lt!4069 () Unit!318)

(assert (=> d!3241 (= lt!4069 (choose!185 (toList!272 lt!3980) a!507))))

(declare-fun e!10194 () Bool)

(assert (=> d!3241 e!10194))

(declare-fun res!12261 () Bool)

(assert (=> d!3241 (=> (not res!12261) (not e!10194))))

(assert (=> d!3241 (= res!12261 (isStrictlySorted!166 (toList!272 lt!3980)))))

(assert (=> d!3241 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!15 (toList!272 lt!3980) a!507) lt!4069)))

(declare-fun b!16501 () Bool)

(assert (=> b!16501 (= e!10194 (containsKey!18 (toList!272 lt!3980) a!507))))

(assert (= (and d!3241 res!12261) b!16501))

(assert (=> d!3241 m!11417))

(assert (=> d!3241 m!11417))

(assert (=> d!3241 m!11419))

(declare-fun m!11595 () Bool)

(assert (=> d!3241 m!11595))

(declare-fun m!11597 () Bool)

(assert (=> d!3241 m!11597))

(assert (=> b!16501 m!11413))

(assert (=> b!16334 d!3241))

(assert (=> b!16334 d!3179))

(assert (=> b!16334 d!3185))

(declare-fun d!3243 () Bool)

(declare-fun res!12262 () Bool)

(declare-fun e!10195 () Bool)

(assert (=> d!3243 (=> res!12262 e!10195)))

(assert (=> d!3243 (= res!12262 (is-Nil!523 (t!3064 (t!3064 (toList!272 lm!221)))))))

(assert (=> d!3243 (= (forall!143 (t!3064 (t!3064 (toList!272 lm!221))) p!191) e!10195)))

(declare-fun b!16502 () Bool)

(declare-fun e!10196 () Bool)

(assert (=> b!16502 (= e!10195 e!10196)))

(declare-fun res!12263 () Bool)

(assert (=> b!16502 (=> (not res!12263) (not e!10196))))

(assert (=> b!16502 (= res!12263 (dynLambda!127 p!191 (h!1088 (t!3064 (t!3064 (toList!272 lm!221))))))))

(declare-fun b!16503 () Bool)

(assert (=> b!16503 (= e!10196 (forall!143 (t!3064 (t!3064 (t!3064 (toList!272 lm!221)))) p!191))))

(assert (= (and d!3243 (not res!12262)) b!16502))

(assert (= (and b!16502 res!12263) b!16503))

(declare-fun b_lambda!1359 () Bool)

(assert (=> (not b_lambda!1359) (not b!16502)))

(declare-fun t!3130 () Bool)

(declare-fun tb!589 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3130) tb!589))

(declare-fun result!961 () Bool)

(assert (=> tb!589 (= result!961 true)))

(assert (=> b!16502 t!3130))

(declare-fun b_and!1177 () Bool)

(assert (= b_and!1175 (and (=> t!3130 result!961) b_and!1177)))

(declare-fun m!11599 () Bool)

(assert (=> b!16502 m!11599))

(declare-fun m!11601 () Bool)

(assert (=> b!16503 m!11601))

(assert (=> b!16255 d!3243))

(declare-fun d!3245 () Bool)

(declare-fun res!12264 () Bool)

(declare-fun e!10197 () Bool)

(assert (=> d!3245 (=> res!12264 e!10197)))

(assert (=> d!3245 (= res!12264 (is-Nil!523 (t!3064 (t!3064 (toList!272 lt!3963)))))))

(assert (=> d!3245 (= (forall!143 (t!3064 (t!3064 (toList!272 lt!3963))) p!191) e!10197)))

(declare-fun b!16504 () Bool)

(declare-fun e!10198 () Bool)

(assert (=> b!16504 (= e!10197 e!10198)))

(declare-fun res!12265 () Bool)

(assert (=> b!16504 (=> (not res!12265) (not e!10198))))

(assert (=> b!16504 (= res!12265 (dynLambda!127 p!191 (h!1088 (t!3064 (t!3064 (toList!272 lt!3963))))))))

(declare-fun b!16505 () Bool)

(assert (=> b!16505 (= e!10198 (forall!143 (t!3064 (t!3064 (t!3064 (toList!272 lt!3963)))) p!191))))

(assert (= (and d!3245 (not res!12264)) b!16504))

(assert (= (and b!16504 res!12265) b!16505))

(declare-fun b_lambda!1361 () Bool)

(assert (=> (not b_lambda!1361) (not b!16504)))

(declare-fun t!3132 () Bool)

(declare-fun tb!591 () Bool)

(assert (=> (and start!2778 (= p!191 p!191) t!3132) tb!591))

(declare-fun result!963 () Bool)

(assert (=> tb!591 (= result!963 true)))

