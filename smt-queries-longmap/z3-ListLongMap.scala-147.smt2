; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2724 () Bool)

(assert start!2724)

(declare-fun b_free!559 () Bool)

(declare-fun b_next!559 () Bool)

(assert (=> start!2724 (= b_free!559 (not b_next!559))))

(declare-fun tp!2824 () Bool)

(declare-fun b_and!1083 () Bool)

(assert (=> start!2724 (= tp!2824 b_and!1083)))

(declare-fun b!16027 () Bool)

(declare-fun e!9826 () Bool)

(declare-datatypes ((B!680 0))(
  ( (B!681 (val!438 Int)) )
))
(declare-datatypes ((tuple2!672 0))(
  ( (tuple2!673 (_1!336 (_ BitVec 64)) (_2!336 B!680)) )
))
(declare-datatypes ((List!519 0))(
  ( (Nil!516) (Cons!515 (h!1081 tuple2!672) (t!3035 List!519)) )
))
(declare-datatypes ((ListLongMap!503 0))(
  ( (ListLongMap!504 (toList!267 List!519)) )
))
(declare-fun lt!3936 () ListLongMap!503)

(declare-fun lm!221 () ListLongMap!503)

(declare-fun size!502 (List!519) Int)

(assert (=> b!16027 (= e!9826 (>= (size!502 (toList!267 lt!3936)) (size!502 (toList!267 lm!221))))))

(declare-fun b!16025 () Bool)

(declare-fun res!11996 () Bool)

(declare-fun e!9824 () Bool)

(assert (=> b!16025 (=> (not res!11996) (not e!9824))))

(declare-fun isEmpty!150 (ListLongMap!503) Bool)

(assert (=> b!16025 (= res!11996 (not (isEmpty!150 lm!221)))))

(declare-fun res!11995 () Bool)

(assert (=> start!2724 (=> (not res!11995) (not e!9824))))

(declare-fun p!191 () Int)

(declare-fun forall!140 (List!519 Int) Bool)

(assert (=> start!2724 (= res!11995 (forall!140 (toList!267 lm!221) p!191))))

(assert (=> start!2724 e!9824))

(declare-fun e!9825 () Bool)

(declare-fun inv!880 (ListLongMap!503) Bool)

(assert (=> start!2724 (and (inv!880 lm!221) e!9825)))

(assert (=> start!2724 tp!2824))

(declare-fun b!16026 () Bool)

(assert (=> b!16026 (= e!9824 e!9826)))

(declare-fun res!11994 () Bool)

(assert (=> b!16026 (=> (not res!11994) (not e!9826))))

(assert (=> b!16026 (= res!11994 (forall!140 (toList!267 lt!3936) p!191))))

(declare-fun tail!74 (ListLongMap!503) ListLongMap!503)

(assert (=> b!16026 (= lt!3936 (tail!74 lm!221))))

(declare-fun b!16028 () Bool)

(declare-fun tp!2825 () Bool)

(assert (=> b!16028 (= e!9825 tp!2825)))

(assert (= (and start!2724 res!11995) b!16025))

(assert (= (and b!16025 res!11996) b!16026))

(assert (= (and b!16026 res!11994) b!16027))

(assert (= start!2724 b!16028))

(declare-fun m!11031 () Bool)

(assert (=> b!16027 m!11031))

(declare-fun m!11033 () Bool)

(assert (=> b!16027 m!11033))

(declare-fun m!11035 () Bool)

(assert (=> b!16025 m!11035))

(declare-fun m!11037 () Bool)

(assert (=> start!2724 m!11037))

(declare-fun m!11039 () Bool)

(assert (=> start!2724 m!11039))

(declare-fun m!11041 () Bool)

(assert (=> b!16026 m!11041))

(declare-fun m!11043 () Bool)

(assert (=> b!16026 m!11043))

(check-sat (not b!16027) (not b!16025) (not start!2724) (not b!16026) (not b!16028) (not b_next!559) b_and!1083)
(check-sat b_and!1083 (not b_next!559))
(get-model)

(declare-fun d!2945 () Bool)

(declare-fun lt!3947 () Int)

(assert (=> d!2945 (>= lt!3947 0)))

(declare-fun e!9849 () Int)

(assert (=> d!2945 (= lt!3947 e!9849)))

(declare-fun c!1505 () Bool)

(get-info :version)

(assert (=> d!2945 (= c!1505 ((_ is Nil!516) (toList!267 lt!3936)))))

(assert (=> d!2945 (= (size!502 (toList!267 lt!3936)) lt!3947)))

(declare-fun b!16061 () Bool)

(assert (=> b!16061 (= e!9849 0)))

(declare-fun b!16062 () Bool)

(assert (=> b!16062 (= e!9849 (+ 1 (size!502 (t!3035 (toList!267 lt!3936)))))))

(assert (= (and d!2945 c!1505) b!16061))

(assert (= (and d!2945 (not c!1505)) b!16062))

(declare-fun m!11075 () Bool)

(assert (=> b!16062 m!11075))

(assert (=> b!16027 d!2945))

(declare-fun d!2949 () Bool)

(declare-fun lt!3948 () Int)

(assert (=> d!2949 (>= lt!3948 0)))

(declare-fun e!9850 () Int)

(assert (=> d!2949 (= lt!3948 e!9850)))

(declare-fun c!1506 () Bool)

(assert (=> d!2949 (= c!1506 ((_ is Nil!516) (toList!267 lm!221)))))

(assert (=> d!2949 (= (size!502 (toList!267 lm!221)) lt!3948)))

(declare-fun b!16063 () Bool)

(assert (=> b!16063 (= e!9850 0)))

(declare-fun b!16064 () Bool)

(assert (=> b!16064 (= e!9850 (+ 1 (size!502 (t!3035 (toList!267 lm!221)))))))

(assert (= (and d!2949 c!1506) b!16063))

(assert (= (and d!2949 (not c!1506)) b!16064))

(declare-fun m!11077 () Bool)

(assert (=> b!16064 m!11077))

(assert (=> b!16027 d!2949))

(declare-fun d!2951 () Bool)

(declare-fun res!12023 () Bool)

(declare-fun e!9861 () Bool)

(assert (=> d!2951 (=> res!12023 e!9861)))

(assert (=> d!2951 (= res!12023 ((_ is Nil!516) (toList!267 lm!221)))))

(assert (=> d!2951 (= (forall!140 (toList!267 lm!221) p!191) e!9861)))

(declare-fun b!16077 () Bool)

(declare-fun e!9862 () Bool)

(assert (=> b!16077 (= e!9861 e!9862)))

(declare-fun res!12024 () Bool)

(assert (=> b!16077 (=> (not res!12024) (not e!9862))))

(declare-fun dynLambda!119 (Int tuple2!672) Bool)

(assert (=> b!16077 (= res!12024 (dynLambda!119 p!191 (h!1081 (toList!267 lm!221))))))

(declare-fun b!16078 () Bool)

(assert (=> b!16078 (= e!9862 (forall!140 (t!3035 (toList!267 lm!221)) p!191))))

(assert (= (and d!2951 (not res!12023)) b!16077))

(assert (= (and b!16077 res!12024) b!16078))

(declare-fun b_lambda!1199 () Bool)

(assert (=> (not b_lambda!1199) (not b!16077)))

(declare-fun t!3039 () Bool)

(declare-fun tb!507 () Bool)

(assert (=> (and start!2724 (= p!191 p!191) t!3039) tb!507))

(declare-fun result!867 () Bool)

(assert (=> tb!507 (= result!867 true)))

(assert (=> b!16077 t!3039))

(declare-fun b_and!1089 () Bool)

(assert (= b_and!1083 (and (=> t!3039 result!867) b_and!1089)))

(declare-fun m!11083 () Bool)

(assert (=> b!16077 m!11083))

(declare-fun m!11085 () Bool)

(assert (=> b!16078 m!11085))

(assert (=> start!2724 d!2951))

(declare-fun d!2959 () Bool)

(declare-fun isStrictlySorted!148 (List!519) Bool)

(assert (=> d!2959 (= (inv!880 lm!221) (isStrictlySorted!148 (toList!267 lm!221)))))

(declare-fun bs!748 () Bool)

(assert (= bs!748 d!2959))

(declare-fun m!11091 () Bool)

(assert (=> bs!748 m!11091))

(assert (=> start!2724 d!2959))

(declare-fun d!2963 () Bool)

(declare-fun res!12027 () Bool)

(declare-fun e!9865 () Bool)

(assert (=> d!2963 (=> res!12027 e!9865)))

(assert (=> d!2963 (= res!12027 ((_ is Nil!516) (toList!267 lt!3936)))))

(assert (=> d!2963 (= (forall!140 (toList!267 lt!3936) p!191) e!9865)))

(declare-fun b!16081 () Bool)

(declare-fun e!9866 () Bool)

(assert (=> b!16081 (= e!9865 e!9866)))

(declare-fun res!12028 () Bool)

(assert (=> b!16081 (=> (not res!12028) (not e!9866))))

(assert (=> b!16081 (= res!12028 (dynLambda!119 p!191 (h!1081 (toList!267 lt!3936))))))

(declare-fun b!16082 () Bool)

(assert (=> b!16082 (= e!9866 (forall!140 (t!3035 (toList!267 lt!3936)) p!191))))

(assert (= (and d!2963 (not res!12027)) b!16081))

(assert (= (and b!16081 res!12028) b!16082))

(declare-fun b_lambda!1203 () Bool)

(assert (=> (not b_lambda!1203) (not b!16081)))

(declare-fun t!3043 () Bool)

(declare-fun tb!511 () Bool)

(assert (=> (and start!2724 (= p!191 p!191) t!3043) tb!511))

(declare-fun result!871 () Bool)

(assert (=> tb!511 (= result!871 true)))

(assert (=> b!16081 t!3043))

(declare-fun b_and!1093 () Bool)

(assert (= b_and!1089 (and (=> t!3043 result!871) b_and!1093)))

(declare-fun m!11093 () Bool)

(assert (=> b!16081 m!11093))

(declare-fun m!11097 () Bool)

(assert (=> b!16082 m!11097))

(assert (=> b!16026 d!2963))

(declare-fun d!2965 () Bool)

(declare-fun tail!78 (List!519) List!519)

(assert (=> d!2965 (= (tail!74 lm!221) (ListLongMap!504 (tail!78 (toList!267 lm!221))))))

(declare-fun bs!750 () Bool)

(assert (= bs!750 d!2965))

(declare-fun m!11103 () Bool)

(assert (=> bs!750 m!11103))

(assert (=> b!16026 d!2965))

(declare-fun d!2971 () Bool)

(declare-fun isEmpty!154 (List!519) Bool)

(assert (=> d!2971 (= (isEmpty!150 lm!221) (isEmpty!154 (toList!267 lm!221)))))

(declare-fun bs!752 () Bool)

(assert (= bs!752 d!2971))

(declare-fun m!11107 () Bool)

(assert (=> bs!752 m!11107))

(assert (=> b!16025 d!2971))

(declare-fun b!16100 () Bool)

(declare-fun e!9880 () Bool)

(declare-fun tp_is_empty!825 () Bool)

(declare-fun tp!2843 () Bool)

(assert (=> b!16100 (= e!9880 (and tp_is_empty!825 tp!2843))))

(assert (=> b!16028 (= tp!2825 e!9880)))

(assert (= (and b!16028 ((_ is Cons!515) (toList!267 lm!221))) b!16100))

(declare-fun b_lambda!1213 () Bool)

(assert (= b_lambda!1203 (or (and start!2724 b_free!559) b_lambda!1213)))

(declare-fun b_lambda!1215 () Bool)

(assert (= b_lambda!1199 (or (and start!2724 b_free!559) b_lambda!1215)))

(check-sat (not d!2971) b_and!1093 (not b!16082) tp_is_empty!825 (not d!2959) (not b_next!559) (not b!16064) (not d!2965) (not b_lambda!1213) (not b!16062) (not b_lambda!1215) (not b!16100) (not b!16078))
(check-sat b_and!1093 (not b_next!559))
(get-model)

(declare-fun d!2991 () Bool)

(declare-fun lt!3956 () Int)

(assert (=> d!2991 (>= lt!3956 0)))

(declare-fun e!9893 () Int)

(assert (=> d!2991 (= lt!3956 e!9893)))

(declare-fun c!1514 () Bool)

(assert (=> d!2991 (= c!1514 ((_ is Nil!516) (t!3035 (toList!267 lm!221))))))

(assert (=> d!2991 (= (size!502 (t!3035 (toList!267 lm!221))) lt!3956)))

(declare-fun b!16120 () Bool)

(assert (=> b!16120 (= e!9893 0)))

(declare-fun b!16121 () Bool)

(assert (=> b!16121 (= e!9893 (+ 1 (size!502 (t!3035 (t!3035 (toList!267 lm!221))))))))

(assert (= (and d!2991 c!1514) b!16120))

(assert (= (and d!2991 (not c!1514)) b!16121))

(declare-fun m!11129 () Bool)

(assert (=> b!16121 m!11129))

(assert (=> b!16064 d!2991))

(declare-fun d!2993 () Bool)

(declare-fun res!12041 () Bool)

(declare-fun e!9894 () Bool)

(assert (=> d!2993 (=> res!12041 e!9894)))

(assert (=> d!2993 (= res!12041 ((_ is Nil!516) (t!3035 (toList!267 lm!221))))))

(assert (=> d!2993 (= (forall!140 (t!3035 (toList!267 lm!221)) p!191) e!9894)))

(declare-fun b!16122 () Bool)

(declare-fun e!9895 () Bool)

(assert (=> b!16122 (= e!9894 e!9895)))

(declare-fun res!12042 () Bool)

(assert (=> b!16122 (=> (not res!12042) (not e!9895))))

(assert (=> b!16122 (= res!12042 (dynLambda!119 p!191 (h!1081 (t!3035 (toList!267 lm!221)))))))

(declare-fun b!16123 () Bool)

(assert (=> b!16123 (= e!9895 (forall!140 (t!3035 (t!3035 (toList!267 lm!221))) p!191))))

(assert (= (and d!2993 (not res!12041)) b!16122))

(assert (= (and b!16122 res!12042) b!16123))

(declare-fun b_lambda!1225 () Bool)

(assert (=> (not b_lambda!1225) (not b!16122)))

(declare-fun t!3053 () Bool)

(declare-fun tb!521 () Bool)

(assert (=> (and start!2724 (= p!191 p!191) t!3053) tb!521))

(declare-fun result!887 () Bool)

(assert (=> tb!521 (= result!887 true)))

(assert (=> b!16122 t!3053))

(declare-fun b_and!1103 () Bool)

(assert (= b_and!1093 (and (=> t!3053 result!887) b_and!1103)))

(declare-fun m!11135 () Bool)

(assert (=> b!16122 m!11135))

(declare-fun m!11137 () Bool)

(assert (=> b!16123 m!11137))

(assert (=> b!16078 d!2993))

(declare-fun d!2997 () Bool)

(declare-fun res!12055 () Bool)

(declare-fun e!9908 () Bool)

(assert (=> d!2997 (=> res!12055 e!9908)))

(assert (=> d!2997 (= res!12055 (or ((_ is Nil!516) (toList!267 lm!221)) ((_ is Nil!516) (t!3035 (toList!267 lm!221)))))))

(assert (=> d!2997 (= (isStrictlySorted!148 (toList!267 lm!221)) e!9908)))

(declare-fun b!16136 () Bool)

(declare-fun e!9909 () Bool)

(assert (=> b!16136 (= e!9908 e!9909)))

(declare-fun res!12056 () Bool)

(assert (=> b!16136 (=> (not res!12056) (not e!9909))))

(assert (=> b!16136 (= res!12056 (bvslt (_1!336 (h!1081 (toList!267 lm!221))) (_1!336 (h!1081 (t!3035 (toList!267 lm!221))))))))

(declare-fun b!16137 () Bool)

(assert (=> b!16137 (= e!9909 (isStrictlySorted!148 (t!3035 (toList!267 lm!221))))))

(assert (= (and d!2997 (not res!12055)) b!16136))

(assert (= (and b!16136 res!12056) b!16137))

(declare-fun m!11145 () Bool)

(assert (=> b!16137 m!11145))

(assert (=> d!2959 d!2997))

(declare-fun d!3003 () Bool)

(declare-fun lt!3957 () Int)

(assert (=> d!3003 (>= lt!3957 0)))

(declare-fun e!9910 () Int)

(assert (=> d!3003 (= lt!3957 e!9910)))

(declare-fun c!1515 () Bool)

(assert (=> d!3003 (= c!1515 ((_ is Nil!516) (t!3035 (toList!267 lt!3936))))))

(assert (=> d!3003 (= (size!502 (t!3035 (toList!267 lt!3936))) lt!3957)))

(declare-fun b!16138 () Bool)

(assert (=> b!16138 (= e!9910 0)))

(declare-fun b!16139 () Bool)

(assert (=> b!16139 (= e!9910 (+ 1 (size!502 (t!3035 (t!3035 (toList!267 lt!3936))))))))

(assert (= (and d!3003 c!1515) b!16138))

(assert (= (and d!3003 (not c!1515)) b!16139))

(declare-fun m!11147 () Bool)

(assert (=> b!16139 m!11147))

(assert (=> b!16062 d!3003))

(declare-fun d!3007 () Bool)

(assert (=> d!3007 (= (isEmpty!154 (toList!267 lm!221)) ((_ is Nil!516) (toList!267 lm!221)))))

(assert (=> d!2971 d!3007))

(declare-fun d!3009 () Bool)

(assert (=> d!3009 (= (tail!78 (toList!267 lm!221)) (t!3035 (toList!267 lm!221)))))

(assert (=> d!2965 d!3009))

(declare-fun d!3011 () Bool)

(declare-fun res!12057 () Bool)

(declare-fun e!9913 () Bool)

(assert (=> d!3011 (=> res!12057 e!9913)))

(assert (=> d!3011 (= res!12057 ((_ is Nil!516) (t!3035 (toList!267 lt!3936))))))

(assert (=> d!3011 (= (forall!140 (t!3035 (toList!267 lt!3936)) p!191) e!9913)))

(declare-fun b!16143 () Bool)

(declare-fun e!9914 () Bool)

(assert (=> b!16143 (= e!9913 e!9914)))

(declare-fun res!12058 () Bool)

(assert (=> b!16143 (=> (not res!12058) (not e!9914))))

(assert (=> b!16143 (= res!12058 (dynLambda!119 p!191 (h!1081 (t!3035 (toList!267 lt!3936)))))))

(declare-fun b!16144 () Bool)

(assert (=> b!16144 (= e!9914 (forall!140 (t!3035 (t!3035 (toList!267 lt!3936))) p!191))))

(assert (= (and d!3011 (not res!12057)) b!16143))

(assert (= (and b!16143 res!12058) b!16144))

(declare-fun b_lambda!1233 () Bool)

(assert (=> (not b_lambda!1233) (not b!16143)))

(declare-fun t!3057 () Bool)

(declare-fun tb!525 () Bool)

(assert (=> (and start!2724 (= p!191 p!191) t!3057) tb!525))

(declare-fun result!891 () Bool)

(assert (=> tb!525 (= result!891 true)))

(assert (=> b!16143 t!3057))

(declare-fun b_and!1107 () Bool)

(assert (= b_and!1103 (and (=> t!3057 result!891) b_and!1107)))

(declare-fun m!11151 () Bool)

(assert (=> b!16143 m!11151))

(declare-fun m!11153 () Bool)

(assert (=> b!16144 m!11153))

(assert (=> b!16082 d!3011))

(declare-fun b!16145 () Bool)

(declare-fun e!9915 () Bool)

(declare-fun tp!2848 () Bool)

(assert (=> b!16145 (= e!9915 (and tp_is_empty!825 tp!2848))))

(assert (=> b!16100 (= tp!2843 e!9915)))

(assert (= (and b!16100 ((_ is Cons!515) (t!3035 (toList!267 lm!221)))) b!16145))

(declare-fun b_lambda!1235 () Bool)

(assert (= b_lambda!1233 (or (and start!2724 b_free!559) b_lambda!1235)))

(declare-fun b_lambda!1237 () Bool)

(assert (= b_lambda!1225 (or (and start!2724 b_free!559) b_lambda!1237)))

(check-sat (not b_lambda!1237) (not b_lambda!1213) (not b_lambda!1215) (not b!16145) tp_is_empty!825 (not b_lambda!1235) (not b!16123) (not b_next!559) b_and!1107 (not b!16121) (not b!16139) (not b!16137) (not b!16144))
(check-sat b_and!1107 (not b_next!559))
