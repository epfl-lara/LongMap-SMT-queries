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

(declare-fun b!16034 () Bool)

(declare-fun e!9829 () Bool)

(declare-fun tp!2825 () Bool)

(assert (=> b!16034 (= e!9829 tp!2825)))

(declare-fun b!16032 () Bool)

(declare-fun e!9830 () Bool)

(declare-fun e!9828 () Bool)

(assert (=> b!16032 (= e!9830 e!9828)))

(declare-fun res!11997 () Bool)

(assert (=> b!16032 (=> (not res!11997) (not e!9828))))

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

(declare-fun p!191 () Int)

(declare-fun forall!140 (List!519 Int) Bool)

(assert (=> b!16032 (= res!11997 (forall!140 (toList!267 lt!3936) p!191))))

(declare-fun lm!221 () ListLongMap!503)

(declare-fun tail!74 (ListLongMap!503) ListLongMap!503)

(assert (=> b!16032 (= lt!3936 (tail!74 lm!221))))

(declare-fun b!16031 () Bool)

(declare-fun res!11998 () Bool)

(assert (=> b!16031 (=> (not res!11998) (not e!9830))))

(declare-fun isEmpty!150 (ListLongMap!503) Bool)

(assert (=> b!16031 (= res!11998 (not (isEmpty!150 lm!221)))))

(declare-fun res!11996 () Bool)

(assert (=> start!2724 (=> (not res!11996) (not e!9830))))

(assert (=> start!2724 (= res!11996 (forall!140 (toList!267 lm!221) p!191))))

(assert (=> start!2724 e!9830))

(declare-fun inv!880 (ListLongMap!503) Bool)

(assert (=> start!2724 (and (inv!880 lm!221) e!9829)))

(assert (=> start!2724 tp!2824))

(declare-fun b!16033 () Bool)

(declare-fun size!502 (List!519) Int)

(assert (=> b!16033 (= e!9828 (>= (size!502 (toList!267 lt!3936)) (size!502 (toList!267 lm!221))))))

(assert (= (and start!2724 res!11996) b!16031))

(assert (= (and b!16031 res!11998) b!16032))

(assert (= (and b!16032 res!11997) b!16033))

(assert (= start!2724 b!16034))

(declare-fun m!11031 () Bool)

(assert (=> b!16032 m!11031))

(declare-fun m!11033 () Bool)

(assert (=> b!16032 m!11033))

(declare-fun m!11035 () Bool)

(assert (=> b!16031 m!11035))

(declare-fun m!11037 () Bool)

(assert (=> start!2724 m!11037))

(declare-fun m!11039 () Bool)

(assert (=> start!2724 m!11039))

(declare-fun m!11041 () Bool)

(assert (=> b!16033 m!11041))

(declare-fun m!11043 () Bool)

(assert (=> b!16033 m!11043))

(check-sat b_and!1083 (not b!16034) (not b!16032) (not b!16033) (not b!16031) (not b_next!559) (not start!2724))
(check-sat b_and!1083 (not b_next!559))
(get-model)

(declare-fun d!2948 () Bool)

(declare-fun lt!3949 () Int)

(assert (=> d!2948 (>= lt!3949 0)))

(declare-fun e!9855 () Int)

(assert (=> d!2948 (= lt!3949 e!9855)))

(declare-fun c!1509 () Bool)

(get-info :version)

(assert (=> d!2948 (= c!1509 ((_ is Nil!516) (toList!267 lt!3936)))))

(assert (=> d!2948 (= (size!502 (toList!267 lt!3936)) lt!3949)))

(declare-fun b!16071 () Bool)

(assert (=> b!16071 (= e!9855 0)))

(declare-fun b!16072 () Bool)

(assert (=> b!16072 (= e!9855 (+ 1 (size!502 (t!3035 (toList!267 lt!3936)))))))

(assert (= (and d!2948 c!1509) b!16071))

(assert (= (and d!2948 (not c!1509)) b!16072))

(declare-fun m!11077 () Bool)

(assert (=> b!16072 m!11077))

(assert (=> b!16033 d!2948))

(declare-fun d!2957 () Bool)

(declare-fun lt!3952 () Int)

(assert (=> d!2957 (>= lt!3952 0)))

(declare-fun e!9858 () Int)

(assert (=> d!2957 (= lt!3952 e!9858)))

(declare-fun c!1512 () Bool)

(assert (=> d!2957 (= c!1512 ((_ is Nil!516) (toList!267 lm!221)))))

(assert (=> d!2957 (= (size!502 (toList!267 lm!221)) lt!3952)))

(declare-fun b!16077 () Bool)

(assert (=> b!16077 (= e!9858 0)))

(declare-fun b!16078 () Bool)

(assert (=> b!16078 (= e!9858 (+ 1 (size!502 (t!3035 (toList!267 lm!221)))))))

(assert (= (and d!2957 c!1512) b!16077))

(assert (= (and d!2957 (not c!1512)) b!16078))

(declare-fun m!11079 () Bool)

(assert (=> b!16078 m!11079))

(assert (=> b!16033 d!2957))

(declare-fun d!2959 () Bool)

(declare-fun res!12027 () Bool)

(declare-fun e!9871 () Bool)

(assert (=> d!2959 (=> res!12027 e!9871)))

(assert (=> d!2959 (= res!12027 ((_ is Nil!516) (toList!267 lm!221)))))

(assert (=> d!2959 (= (forall!140 (toList!267 lm!221) p!191) e!9871)))

(declare-fun b!16093 () Bool)

(declare-fun e!9872 () Bool)

(assert (=> b!16093 (= e!9871 e!9872)))

(declare-fun res!12028 () Bool)

(assert (=> b!16093 (=> (not res!12028) (not e!9872))))

(declare-fun dynLambda!123 (Int tuple2!672) Bool)

(assert (=> b!16093 (= res!12028 (dynLambda!123 p!191 (h!1081 (toList!267 lm!221))))))

(declare-fun b!16094 () Bool)

(assert (=> b!16094 (= e!9872 (forall!140 (t!3035 (toList!267 lm!221)) p!191))))

(assert (= (and d!2959 (not res!12027)) b!16093))

(assert (= (and b!16093 res!12028) b!16094))

(declare-fun b_lambda!1201 () Bool)

(assert (=> (not b_lambda!1201) (not b!16093)))

(declare-fun t!3041 () Bool)

(declare-fun tb!509 () Bool)

(assert (=> (and start!2724 (= p!191 p!191) t!3041) tb!509))

(declare-fun result!869 () Bool)

(assert (=> tb!509 (= result!869 true)))

(assert (=> b!16093 t!3041))

(declare-fun b_and!1091 () Bool)

(assert (= b_and!1083 (and (=> t!3041 result!869) b_and!1091)))

(declare-fun m!11091 () Bool)

(assert (=> b!16093 m!11091))

(declare-fun m!11093 () Bool)

(assert (=> b!16094 m!11093))

(assert (=> start!2724 d!2959))

(declare-fun d!2969 () Bool)

(declare-fun isStrictlySorted!156 (List!519) Bool)

(assert (=> d!2969 (= (inv!880 lm!221) (isStrictlySorted!156 (toList!267 lm!221)))))

(declare-fun bs!749 () Bool)

(assert (= bs!749 d!2969))

(declare-fun m!11105 () Bool)

(assert (=> bs!749 m!11105))

(assert (=> start!2724 d!2969))

(declare-fun d!2977 () Bool)

(declare-fun res!12037 () Bool)

(declare-fun e!9881 () Bool)

(assert (=> d!2977 (=> res!12037 e!9881)))

(assert (=> d!2977 (= res!12037 ((_ is Nil!516) (toList!267 lt!3936)))))

(assert (=> d!2977 (= (forall!140 (toList!267 lt!3936) p!191) e!9881)))

(declare-fun b!16103 () Bool)

(declare-fun e!9882 () Bool)

(assert (=> b!16103 (= e!9881 e!9882)))

(declare-fun res!12038 () Bool)

(assert (=> b!16103 (=> (not res!12038) (not e!9882))))

(assert (=> b!16103 (= res!12038 (dynLambda!123 p!191 (h!1081 (toList!267 lt!3936))))))

(declare-fun b!16104 () Bool)

(assert (=> b!16104 (= e!9882 (forall!140 (t!3035 (toList!267 lt!3936)) p!191))))

(assert (= (and d!2977 (not res!12037)) b!16103))

(assert (= (and b!16103 res!12038) b!16104))

(declare-fun b_lambda!1207 () Bool)

(assert (=> (not b_lambda!1207) (not b!16103)))

(declare-fun t!3047 () Bool)

(declare-fun tb!515 () Bool)

(assert (=> (and start!2724 (= p!191 p!191) t!3047) tb!515))

(declare-fun result!877 () Bool)

(assert (=> tb!515 (= result!877 true)))

(assert (=> b!16103 t!3047))

(declare-fun b_and!1097 () Bool)

(assert (= b_and!1091 (and (=> t!3047 result!877) b_and!1097)))

(declare-fun m!11109 () Bool)

(assert (=> b!16103 m!11109))

(declare-fun m!11111 () Bool)

(assert (=> b!16104 m!11111))

(assert (=> b!16032 d!2977))

(declare-fun d!2979 () Bool)

(declare-fun tail!78 (List!519) List!519)

(assert (=> d!2979 (= (tail!74 lm!221) (ListLongMap!504 (tail!78 (toList!267 lm!221))))))

(declare-fun bs!752 () Bool)

(assert (= bs!752 d!2979))

(declare-fun m!11115 () Bool)

(assert (=> bs!752 m!11115))

(assert (=> b!16032 d!2979))

(declare-fun d!2983 () Bool)

(declare-fun isEmpty!154 (List!519) Bool)

(assert (=> d!2983 (= (isEmpty!150 lm!221) (isEmpty!154 (toList!267 lm!221)))))

(declare-fun bs!753 () Bool)

(assert (= bs!753 d!2983))

(declare-fun m!11121 () Bool)

(assert (=> bs!753 m!11121))

(assert (=> b!16031 d!2983))

(declare-fun b!16116 () Bool)

(declare-fun e!9890 () Bool)

(declare-fun tp_is_empty!825 () Bool)

(declare-fun tp!2843 () Bool)

(assert (=> b!16116 (= e!9890 (and tp_is_empty!825 tp!2843))))

(assert (=> b!16034 (= tp!2825 e!9890)))

(assert (= (and b!16034 ((_ is Cons!515) (toList!267 lm!221))) b!16116))

(declare-fun b_lambda!1215 () Bool)

(assert (= b_lambda!1201 (or (and start!2724 b_free!559) b_lambda!1215)))

(declare-fun b_lambda!1217 () Bool)

(assert (= b_lambda!1207 (or (and start!2724 b_free!559) b_lambda!1217)))

(check-sat (not b_lambda!1215) (not b!16116) (not b!16104) b_and!1097 (not d!2969) (not b_lambda!1217) (not b!16072) (not b!16094) (not d!2983) (not b!16078) tp_is_empty!825 (not d!2979) (not b_next!559))
(check-sat b_and!1097 (not b_next!559))
(get-model)

(declare-fun d!2995 () Bool)

(declare-fun lt!3956 () Int)

(assert (=> d!2995 (>= lt!3956 0)))

(declare-fun e!9897 () Int)

(assert (=> d!2995 (= lt!3956 e!9897)))

(declare-fun c!1516 () Bool)

(assert (=> d!2995 (= c!1516 ((_ is Nil!516) (t!3035 (toList!267 lt!3936))))))

(assert (=> d!2995 (= (size!502 (t!3035 (toList!267 lt!3936))) lt!3956)))

(declare-fun b!16126 () Bool)

(assert (=> b!16126 (= e!9897 0)))

(declare-fun b!16127 () Bool)

(assert (=> b!16127 (= e!9897 (+ 1 (size!502 (t!3035 (t!3035 (toList!267 lt!3936))))))))

(assert (= (and d!2995 c!1516) b!16126))

(assert (= (and d!2995 (not c!1516)) b!16127))

(declare-fun m!11133 () Bool)

(assert (=> b!16127 m!11133))

(assert (=> b!16072 d!2995))

(declare-fun d!2997 () Bool)

(declare-fun res!12043 () Bool)

(declare-fun e!9898 () Bool)

(assert (=> d!2997 (=> res!12043 e!9898)))

(assert (=> d!2997 (= res!12043 ((_ is Nil!516) (t!3035 (toList!267 lt!3936))))))

(assert (=> d!2997 (= (forall!140 (t!3035 (toList!267 lt!3936)) p!191) e!9898)))

(declare-fun b!16128 () Bool)

(declare-fun e!9899 () Bool)

(assert (=> b!16128 (= e!9898 e!9899)))

(declare-fun res!12044 () Bool)

(assert (=> b!16128 (=> (not res!12044) (not e!9899))))

(assert (=> b!16128 (= res!12044 (dynLambda!123 p!191 (h!1081 (t!3035 (toList!267 lt!3936)))))))

(declare-fun b!16129 () Bool)

(assert (=> b!16129 (= e!9899 (forall!140 (t!3035 (t!3035 (toList!267 lt!3936))) p!191))))

(assert (= (and d!2997 (not res!12043)) b!16128))

(assert (= (and b!16128 res!12044) b!16129))

(declare-fun b_lambda!1225 () Bool)

(assert (=> (not b_lambda!1225) (not b!16128)))

(declare-fun t!3053 () Bool)

(declare-fun tb!521 () Bool)

(assert (=> (and start!2724 (= p!191 p!191) t!3053) tb!521))

(declare-fun result!887 () Bool)

(assert (=> tb!521 (= result!887 true)))

(assert (=> b!16128 t!3053))

(declare-fun b_and!1103 () Bool)

(assert (= b_and!1097 (and (=> t!3053 result!887) b_and!1103)))

(declare-fun m!11135 () Bool)

(assert (=> b!16128 m!11135))

(declare-fun m!11137 () Bool)

(assert (=> b!16129 m!11137))

(assert (=> b!16104 d!2997))

(declare-fun d!2999 () Bool)

(assert (=> d!2999 (= (isEmpty!154 (toList!267 lm!221)) ((_ is Nil!516) (toList!267 lm!221)))))

(assert (=> d!2983 d!2999))

(declare-fun d!3001 () Bool)

(declare-fun res!12049 () Bool)

(declare-fun e!9904 () Bool)

(assert (=> d!3001 (=> res!12049 e!9904)))

(assert (=> d!3001 (= res!12049 ((_ is Nil!516) (t!3035 (toList!267 lm!221))))))

(assert (=> d!3001 (= (forall!140 (t!3035 (toList!267 lm!221)) p!191) e!9904)))

(declare-fun b!16134 () Bool)

(declare-fun e!9905 () Bool)

(assert (=> b!16134 (= e!9904 e!9905)))

(declare-fun res!12050 () Bool)

(assert (=> b!16134 (=> (not res!12050) (not e!9905))))

(assert (=> b!16134 (= res!12050 (dynLambda!123 p!191 (h!1081 (t!3035 (toList!267 lm!221)))))))

(declare-fun b!16135 () Bool)

(assert (=> b!16135 (= e!9905 (forall!140 (t!3035 (t!3035 (toList!267 lm!221))) p!191))))

(assert (= (and d!3001 (not res!12049)) b!16134))

(assert (= (and b!16134 res!12050) b!16135))

(declare-fun b_lambda!1227 () Bool)

(assert (=> (not b_lambda!1227) (not b!16134)))

(declare-fun t!3055 () Bool)

(declare-fun tb!523 () Bool)

(assert (=> (and start!2724 (= p!191 p!191) t!3055) tb!523))

(declare-fun result!889 () Bool)

(assert (=> tb!523 (= result!889 true)))

(assert (=> b!16134 t!3055))

(declare-fun b_and!1105 () Bool)

(assert (= b_and!1103 (and (=> t!3055 result!889) b_and!1105)))

(declare-fun m!11139 () Bool)

(assert (=> b!16134 m!11139))

(declare-fun m!11141 () Bool)

(assert (=> b!16135 m!11141))

(assert (=> b!16094 d!3001))

(declare-fun d!3003 () Bool)

(assert (=> d!3003 (= (tail!78 (toList!267 lm!221)) (t!3035 (toList!267 lm!221)))))

(assert (=> d!2979 d!3003))

(declare-fun d!3007 () Bool)

(declare-fun res!12059 () Bool)

(declare-fun e!9916 () Bool)

(assert (=> d!3007 (=> res!12059 e!9916)))

(assert (=> d!3007 (= res!12059 (or ((_ is Nil!516) (toList!267 lm!221)) ((_ is Nil!516) (t!3035 (toList!267 lm!221)))))))

(assert (=> d!3007 (= (isStrictlySorted!156 (toList!267 lm!221)) e!9916)))

(declare-fun b!16147 () Bool)

(declare-fun e!9917 () Bool)

(assert (=> b!16147 (= e!9916 e!9917)))

(declare-fun res!12060 () Bool)

(assert (=> b!16147 (=> (not res!12060) (not e!9917))))

(assert (=> b!16147 (= res!12060 (bvslt (_1!336 (h!1081 (toList!267 lm!221))) (_1!336 (h!1081 (t!3035 (toList!267 lm!221))))))))

(declare-fun b!16148 () Bool)

(assert (=> b!16148 (= e!9917 (isStrictlySorted!156 (t!3035 (toList!267 lm!221))))))

(assert (= (and d!3007 (not res!12059)) b!16147))

(assert (= (and b!16147 res!12060) b!16148))

(declare-fun m!11151 () Bool)

(assert (=> b!16148 m!11151))

(assert (=> d!2969 d!3007))

(declare-fun d!3015 () Bool)

(declare-fun lt!3958 () Int)

(assert (=> d!3015 (>= lt!3958 0)))

(declare-fun e!9918 () Int)

(assert (=> d!3015 (= lt!3958 e!9918)))

(declare-fun c!1518 () Bool)

(assert (=> d!3015 (= c!1518 ((_ is Nil!516) (t!3035 (toList!267 lm!221))))))

(assert (=> d!3015 (= (size!502 (t!3035 (toList!267 lm!221))) lt!3958)))

(declare-fun b!16149 () Bool)

(assert (=> b!16149 (= e!9918 0)))

(declare-fun b!16150 () Bool)

(assert (=> b!16150 (= e!9918 (+ 1 (size!502 (t!3035 (t!3035 (toList!267 lm!221))))))))

(assert (= (and d!3015 c!1518) b!16149))

(assert (= (and d!3015 (not c!1518)) b!16150))

(declare-fun m!11153 () Bool)

(assert (=> b!16150 m!11153))

(assert (=> b!16078 d!3015))

(declare-fun b!16151 () Bool)

(declare-fun e!9919 () Bool)

(declare-fun tp!2848 () Bool)

(assert (=> b!16151 (= e!9919 (and tp_is_empty!825 tp!2848))))

(assert (=> b!16116 (= tp!2843 e!9919)))

(assert (= (and b!16116 ((_ is Cons!515) (t!3035 (toList!267 lm!221)))) b!16151))

(declare-fun b_lambda!1235 () Bool)

(assert (= b_lambda!1227 (or (and start!2724 b_free!559) b_lambda!1235)))

(declare-fun b_lambda!1237 () Bool)

(assert (= b_lambda!1225 (or (and start!2724 b_free!559) b_lambda!1237)))

(check-sat (not b_lambda!1235) (not b_lambda!1237) (not b!16129) (not b_lambda!1217) (not b!16127) tp_is_empty!825 (not b_next!559) (not b_lambda!1215) (not b!16135) (not b!16151) b_and!1105 (not b!16148) (not b!16150))
(check-sat b_and!1105 (not b_next!559))
