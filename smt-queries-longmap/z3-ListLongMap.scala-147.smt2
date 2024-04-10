; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2726 () Bool)

(assert start!2726)

(declare-fun b_free!561 () Bool)

(declare-fun b_next!561 () Bool)

(assert (=> start!2726 (= b_free!561 (not b_next!561))))

(declare-fun tp!2830 () Bool)

(declare-fun b_and!1085 () Bool)

(assert (=> start!2726 (= tp!2830 b_and!1085)))

(declare-fun res!12006 () Bool)

(declare-fun e!9837 () Bool)

(assert (=> start!2726 (=> (not res!12006) (not e!9837))))

(declare-datatypes ((B!682 0))(
  ( (B!683 (val!439 Int)) )
))
(declare-datatypes ((tuple2!678 0))(
  ( (tuple2!679 (_1!339 (_ BitVec 64)) (_2!339 B!682)) )
))
(declare-datatypes ((List!524 0))(
  ( (Nil!521) (Cons!520 (h!1086 tuple2!678) (t!3040 List!524)) )
))
(declare-datatypes ((ListLongMap!509 0))(
  ( (ListLongMap!510 (toList!270 List!524)) )
))
(declare-fun lm!221 () ListLongMap!509)

(declare-fun p!191 () Int)

(declare-fun forall!141 (List!524 Int) Bool)

(assert (=> start!2726 (= res!12006 (forall!141 (toList!270 lm!221) p!191))))

(assert (=> start!2726 e!9837))

(declare-fun e!9839 () Bool)

(declare-fun inv!881 (ListLongMap!509) Bool)

(assert (=> start!2726 (and (inv!881 lm!221) e!9839)))

(assert (=> start!2726 tp!2830))

(declare-fun b!16046 () Bool)

(declare-fun tp!2831 () Bool)

(assert (=> b!16046 (= e!9839 tp!2831)))

(declare-fun b!16045 () Bool)

(declare-fun e!9838 () Bool)

(declare-fun lt!3939 () ListLongMap!509)

(declare-fun size!512 (List!524) Int)

(assert (=> b!16045 (= e!9838 (>= (size!512 (toList!270 lt!3939)) (size!512 (toList!270 lm!221))))))

(declare-fun b!16044 () Bool)

(assert (=> b!16044 (= e!9837 e!9838)))

(declare-fun res!12005 () Bool)

(assert (=> b!16044 (=> (not res!12005) (not e!9838))))

(assert (=> b!16044 (= res!12005 (forall!141 (toList!270 lt!3939) p!191))))

(declare-fun tail!75 (ListLongMap!509) ListLongMap!509)

(assert (=> b!16044 (= lt!3939 (tail!75 lm!221))))

(declare-fun b!16043 () Bool)

(declare-fun res!12007 () Bool)

(assert (=> b!16043 (=> (not res!12007) (not e!9837))))

(declare-fun isEmpty!151 (ListLongMap!509) Bool)

(assert (=> b!16043 (= res!12007 (not (isEmpty!151 lm!221)))))

(assert (= (and start!2726 res!12006) b!16043))

(assert (= (and b!16043 res!12007) b!16044))

(assert (= (and b!16044 res!12005) b!16045))

(assert (= start!2726 b!16046))

(declare-fun m!11053 () Bool)

(assert (=> start!2726 m!11053))

(declare-fun m!11055 () Bool)

(assert (=> start!2726 m!11055))

(declare-fun m!11057 () Bool)

(assert (=> b!16045 m!11057))

(declare-fun m!11059 () Bool)

(assert (=> b!16045 m!11059))

(declare-fun m!11061 () Bool)

(assert (=> b!16044 m!11061))

(declare-fun m!11063 () Bool)

(assert (=> b!16044 m!11063))

(declare-fun m!11065 () Bool)

(assert (=> b!16043 m!11065))

(check-sat (not b!16044) (not b!16046) b_and!1085 (not b_next!561) (not start!2726) (not b!16045) (not b!16043))
(check-sat b_and!1085 (not b_next!561))
(get-model)

(declare-fun d!2947 () Bool)

(declare-fun res!12021 () Bool)

(declare-fun e!9856 () Bool)

(assert (=> d!2947 (=> res!12021 e!9856)))

(get-info :version)

(assert (=> d!2947 (= res!12021 ((_ is Nil!521) (toList!270 lm!221)))))

(assert (=> d!2947 (= (forall!141 (toList!270 lm!221) p!191) e!9856)))

(declare-fun b!16069 () Bool)

(declare-fun e!9857 () Bool)

(assert (=> b!16069 (= e!9856 e!9857)))

(declare-fun res!12022 () Bool)

(assert (=> b!16069 (=> (not res!12022) (not e!9857))))

(declare-fun dynLambda!123 (Int tuple2!678) Bool)

(assert (=> b!16069 (= res!12022 (dynLambda!123 p!191 (h!1086 (toList!270 lm!221))))))

(declare-fun b!16070 () Bool)

(assert (=> b!16070 (= e!9857 (forall!141 (t!3040 (toList!270 lm!221)) p!191))))

(assert (= (and d!2947 (not res!12021)) b!16069))

(assert (= (and b!16069 res!12022) b!16070))

(declare-fun b_lambda!1199 () Bool)

(assert (=> (not b_lambda!1199) (not b!16069)))

(declare-fun t!3043 () Bool)

(declare-fun tb!507 () Bool)

(assert (=> (and start!2726 (= p!191 p!191) t!3043) tb!507))

(declare-fun result!867 () Bool)

(assert (=> tb!507 (= result!867 true)))

(assert (=> b!16069 t!3043))

(declare-fun b_and!1089 () Bool)

(assert (= b_and!1085 (and (=> t!3043 result!867) b_and!1089)))

(declare-fun m!11087 () Bool)

(assert (=> b!16069 m!11087))

(declare-fun m!11089 () Bool)

(assert (=> b!16070 m!11089))

(assert (=> start!2726 d!2947))

(declare-fun d!2959 () Bool)

(declare-fun isStrictlySorted!161 (List!524) Bool)

(assert (=> d!2959 (= (inv!881 lm!221) (isStrictlySorted!161 (toList!270 lm!221)))))

(declare-fun bs!748 () Bool)

(assert (= bs!748 d!2959))

(declare-fun m!11093 () Bool)

(assert (=> bs!748 m!11093))

(assert (=> start!2726 d!2959))

(declare-fun d!2963 () Bool)

(declare-fun res!12027 () Bool)

(declare-fun e!9867 () Bool)

(assert (=> d!2963 (=> res!12027 e!9867)))

(assert (=> d!2963 (= res!12027 ((_ is Nil!521) (toList!270 lt!3939)))))

(assert (=> d!2963 (= (forall!141 (toList!270 lt!3939) p!191) e!9867)))

(declare-fun b!16085 () Bool)

(declare-fun e!9868 () Bool)

(assert (=> b!16085 (= e!9867 e!9868)))

(declare-fun res!12028 () Bool)

(assert (=> b!16085 (=> (not res!12028) (not e!9868))))

(assert (=> b!16085 (= res!12028 (dynLambda!123 p!191 (h!1086 (toList!270 lt!3939))))))

(declare-fun b!16086 () Bool)

(assert (=> b!16086 (= e!9868 (forall!141 (t!3040 (toList!270 lt!3939)) p!191))))

(assert (= (and d!2963 (not res!12027)) b!16085))

(assert (= (and b!16085 res!12028) b!16086))

(declare-fun b_lambda!1201 () Bool)

(assert (=> (not b_lambda!1201) (not b!16085)))

(declare-fun t!3045 () Bool)

(declare-fun tb!509 () Bool)

(assert (=> (and start!2726 (= p!191 p!191) t!3045) tb!509))

(declare-fun result!869 () Bool)

(assert (=> tb!509 (= result!869 true)))

(assert (=> b!16085 t!3045))

(declare-fun b_and!1091 () Bool)

(assert (= b_and!1089 (and (=> t!3045 result!869) b_and!1091)))

(declare-fun m!11097 () Bool)

(assert (=> b!16085 m!11097))

(declare-fun m!11099 () Bool)

(assert (=> b!16086 m!11099))

(assert (=> b!16044 d!2963))

(declare-fun d!2967 () Bool)

(declare-fun tail!77 (List!524) List!524)

(assert (=> d!2967 (= (tail!75 lm!221) (ListLongMap!510 (tail!77 (toList!270 lm!221))))))

(declare-fun bs!749 () Bool)

(assert (= bs!749 d!2967))

(declare-fun m!11105 () Bool)

(assert (=> bs!749 m!11105))

(assert (=> b!16044 d!2967))

(declare-fun d!2971 () Bool)

(declare-fun isEmpty!154 (List!524) Bool)

(assert (=> d!2971 (= (isEmpty!151 lm!221) (isEmpty!154 (toList!270 lm!221)))))

(declare-fun bs!751 () Bool)

(assert (= bs!751 d!2971))

(declare-fun m!11109 () Bool)

(assert (=> bs!751 m!11109))

(assert (=> b!16043 d!2971))

(declare-fun d!2975 () Bool)

(declare-fun lt!3953 () Int)

(assert (=> d!2975 (>= lt!3953 0)))

(declare-fun e!9883 () Int)

(assert (=> d!2975 (= lt!3953 e!9883)))

(declare-fun c!1513 () Bool)

(assert (=> d!2975 (= c!1513 ((_ is Nil!521) (toList!270 lt!3939)))))

(assert (=> d!2975 (= (size!512 (toList!270 lt!3939)) lt!3953)))

(declare-fun b!16103 () Bool)

(assert (=> b!16103 (= e!9883 0)))

(declare-fun b!16104 () Bool)

(assert (=> b!16104 (= e!9883 (+ 1 (size!512 (t!3040 (toList!270 lt!3939)))))))

(assert (= (and d!2975 c!1513) b!16103))

(assert (= (and d!2975 (not c!1513)) b!16104))

(declare-fun m!11125 () Bool)

(assert (=> b!16104 m!11125))

(assert (=> b!16045 d!2975))

(declare-fun d!2985 () Bool)

(declare-fun lt!3954 () Int)

(assert (=> d!2985 (>= lt!3954 0)))

(declare-fun e!9886 () Int)

(assert (=> d!2985 (= lt!3954 e!9886)))

(declare-fun c!1514 () Bool)

(assert (=> d!2985 (= c!1514 ((_ is Nil!521) (toList!270 lm!221)))))

(assert (=> d!2985 (= (size!512 (toList!270 lm!221)) lt!3954)))

(declare-fun b!16109 () Bool)

(assert (=> b!16109 (= e!9886 0)))

(declare-fun b!16110 () Bool)

(assert (=> b!16110 (= e!9886 (+ 1 (size!512 (t!3040 (toList!270 lm!221)))))))

(assert (= (and d!2985 c!1514) b!16109))

(assert (= (and d!2985 (not c!1514)) b!16110))

(declare-fun m!11131 () Bool)

(assert (=> b!16110 m!11131))

(assert (=> b!16045 d!2985))

(declare-fun b!16116 () Bool)

(declare-fun e!9890 () Bool)

(declare-fun tp_is_empty!825 () Bool)

(declare-fun tp!2843 () Bool)

(assert (=> b!16116 (= e!9890 (and tp_is_empty!825 tp!2843))))

(assert (=> b!16046 (= tp!2831 e!9890)))

(assert (= (and b!16046 ((_ is Cons!520) (toList!270 lm!221))) b!16116))

(declare-fun b_lambda!1215 () Bool)

(assert (= b_lambda!1201 (or (and start!2726 b_free!561) b_lambda!1215)))

(declare-fun b_lambda!1217 () Bool)

(assert (= b_lambda!1199 (or (and start!2726 b_free!561) b_lambda!1217)))

(check-sat (not b!16086) (not b!16070) b_and!1091 (not b_lambda!1217) (not b!16110) (not d!2971) (not d!2967) (not d!2959) (not b_lambda!1215) (not b_next!561) tp_is_empty!825 (not b!16116) (not b!16104))
(check-sat b_and!1091 (not b_next!561))
(get-model)

(declare-fun d!2989 () Bool)

(assert (=> d!2989 (= (isEmpty!154 (toList!270 lm!221)) ((_ is Nil!521) (toList!270 lm!221)))))

(assert (=> d!2971 d!2989))

(declare-fun d!2991 () Bool)

(declare-fun res!12045 () Bool)

(declare-fun e!9898 () Bool)

(assert (=> d!2991 (=> res!12045 e!9898)))

(assert (=> d!2991 (= res!12045 (or ((_ is Nil!521) (toList!270 lm!221)) ((_ is Nil!521) (t!3040 (toList!270 lm!221)))))))

(assert (=> d!2991 (= (isStrictlySorted!161 (toList!270 lm!221)) e!9898)))

(declare-fun b!16126 () Bool)

(declare-fun e!9899 () Bool)

(assert (=> b!16126 (= e!9898 e!9899)))

(declare-fun res!12046 () Bool)

(assert (=> b!16126 (=> (not res!12046) (not e!9899))))

(assert (=> b!16126 (= res!12046 (bvslt (_1!339 (h!1086 (toList!270 lm!221))) (_1!339 (h!1086 (t!3040 (toList!270 lm!221))))))))

(declare-fun b!16127 () Bool)

(assert (=> b!16127 (= e!9899 (isStrictlySorted!161 (t!3040 (toList!270 lm!221))))))

(assert (= (and d!2991 (not res!12045)) b!16126))

(assert (= (and b!16126 res!12046) b!16127))

(declare-fun m!11135 () Bool)

(assert (=> b!16127 m!11135))

(assert (=> d!2959 d!2991))

(declare-fun d!2995 () Bool)

(assert (=> d!2995 (= (tail!77 (toList!270 lm!221)) (t!3040 (toList!270 lm!221)))))

(assert (=> d!2967 d!2995))

(declare-fun d!2999 () Bool)

(declare-fun lt!3955 () Int)

(assert (=> d!2999 (>= lt!3955 0)))

(declare-fun e!9902 () Int)

(assert (=> d!2999 (= lt!3955 e!9902)))

(declare-fun c!1515 () Bool)

(assert (=> d!2999 (= c!1515 ((_ is Nil!521) (t!3040 (toList!270 lm!221))))))

(assert (=> d!2999 (= (size!512 (t!3040 (toList!270 lm!221))) lt!3955)))

(declare-fun b!16130 () Bool)

(assert (=> b!16130 (= e!9902 0)))

(declare-fun b!16131 () Bool)

(assert (=> b!16131 (= e!9902 (+ 1 (size!512 (t!3040 (t!3040 (toList!270 lm!221))))))))

(assert (= (and d!2999 c!1515) b!16130))

(assert (= (and d!2999 (not c!1515)) b!16131))

(declare-fun m!11141 () Bool)

(assert (=> b!16131 m!11141))

(assert (=> b!16110 d!2999))

(declare-fun d!3003 () Bool)

(declare-fun res!12049 () Bool)

(declare-fun e!9904 () Bool)

(assert (=> d!3003 (=> res!12049 e!9904)))

(assert (=> d!3003 (= res!12049 ((_ is Nil!521) (t!3040 (toList!270 lt!3939))))))

(assert (=> d!3003 (= (forall!141 (t!3040 (toList!270 lt!3939)) p!191) e!9904)))

(declare-fun b!16134 () Bool)

(declare-fun e!9905 () Bool)

(assert (=> b!16134 (= e!9904 e!9905)))

(declare-fun res!12050 () Bool)

(assert (=> b!16134 (=> (not res!12050) (not e!9905))))

(assert (=> b!16134 (= res!12050 (dynLambda!123 p!191 (h!1086 (t!3040 (toList!270 lt!3939)))))))

(declare-fun b!16135 () Bool)

(assert (=> b!16135 (= e!9905 (forall!141 (t!3040 (t!3040 (toList!270 lt!3939))) p!191))))

(assert (= (and d!3003 (not res!12049)) b!16134))

(assert (= (and b!16134 res!12050) b!16135))

(declare-fun b_lambda!1225 () Bool)

(assert (=> (not b_lambda!1225) (not b!16134)))

(declare-fun t!3057 () Bool)

(declare-fun tb!521 () Bool)

(assert (=> (and start!2726 (= p!191 p!191) t!3057) tb!521))

(declare-fun result!887 () Bool)

(assert (=> tb!521 (= result!887 true)))

(assert (=> b!16134 t!3057))

(declare-fun b_and!1103 () Bool)

(assert (= b_and!1091 (and (=> t!3057 result!887) b_and!1103)))

(declare-fun m!11147 () Bool)

(assert (=> b!16134 m!11147))

(declare-fun m!11149 () Bool)

(assert (=> b!16135 m!11149))

(assert (=> b!16086 d!3003))

(declare-fun d!3011 () Bool)

(declare-fun lt!3958 () Int)

(assert (=> d!3011 (>= lt!3958 0)))

(declare-fun e!9907 () Int)

(assert (=> d!3011 (= lt!3958 e!9907)))

(declare-fun c!1518 () Bool)

(assert (=> d!3011 (= c!1518 ((_ is Nil!521) (t!3040 (toList!270 lt!3939))))))

(assert (=> d!3011 (= (size!512 (t!3040 (toList!270 lt!3939))) lt!3958)))

(declare-fun b!16138 () Bool)

(assert (=> b!16138 (= e!9907 0)))

(declare-fun b!16139 () Bool)

(assert (=> b!16139 (= e!9907 (+ 1 (size!512 (t!3040 (t!3040 (toList!270 lt!3939))))))))

(assert (= (and d!3011 c!1518) b!16138))

(assert (= (and d!3011 (not c!1518)) b!16139))

(declare-fun m!11151 () Bool)

(assert (=> b!16139 m!11151))

(assert (=> b!16104 d!3011))

(declare-fun d!3013 () Bool)

(declare-fun res!12053 () Bool)

(declare-fun e!9910 () Bool)

(assert (=> d!3013 (=> res!12053 e!9910)))

(assert (=> d!3013 (= res!12053 ((_ is Nil!521) (t!3040 (toList!270 lm!221))))))

(assert (=> d!3013 (= (forall!141 (t!3040 (toList!270 lm!221)) p!191) e!9910)))

(declare-fun b!16142 () Bool)

(declare-fun e!9911 () Bool)

(assert (=> b!16142 (= e!9910 e!9911)))

(declare-fun res!12054 () Bool)

(assert (=> b!16142 (=> (not res!12054) (not e!9911))))

(assert (=> b!16142 (= res!12054 (dynLambda!123 p!191 (h!1086 (t!3040 (toList!270 lm!221)))))))

(declare-fun b!16143 () Bool)

(assert (=> b!16143 (= e!9911 (forall!141 (t!3040 (t!3040 (toList!270 lm!221))) p!191))))

(assert (= (and d!3013 (not res!12053)) b!16142))

(assert (= (and b!16142 res!12054) b!16143))

(declare-fun b_lambda!1229 () Bool)

(assert (=> (not b_lambda!1229) (not b!16142)))

(declare-fun t!3061 () Bool)

(declare-fun tb!525 () Bool)

(assert (=> (and start!2726 (= p!191 p!191) t!3061) tb!525))

(declare-fun result!891 () Bool)

(assert (=> tb!525 (= result!891 true)))

(assert (=> b!16142 t!3061))

(declare-fun b_and!1107 () Bool)

(assert (= b_and!1103 (and (=> t!3061 result!891) b_and!1107)))

(declare-fun m!11157 () Bool)

(assert (=> b!16142 m!11157))

(declare-fun m!11159 () Bool)

(assert (=> b!16143 m!11159))

(assert (=> b!16070 d!3013))

(declare-fun b!16144 () Bool)

(declare-fun e!9912 () Bool)

(declare-fun tp!2847 () Bool)

(assert (=> b!16144 (= e!9912 (and tp_is_empty!825 tp!2847))))

(assert (=> b!16116 (= tp!2843 e!9912)))

(assert (= (and b!16116 ((_ is Cons!520) (t!3040 (toList!270 lm!221)))) b!16144))

(declare-fun b_lambda!1231 () Bool)

(assert (= b_lambda!1225 (or (and start!2726 b_free!561) b_lambda!1231)))

(declare-fun b_lambda!1233 () Bool)

(assert (= b_lambda!1229 (or (and start!2726 b_free!561) b_lambda!1233)))

(check-sat (not b_lambda!1215) (not b_lambda!1233) (not b!16131) (not b!16144) (not b_lambda!1217) (not b!16135) b_and!1107 (not b_lambda!1231) (not b!16127) (not b!16143) (not b!16139) (not b_next!561) tp_is_empty!825)
(check-sat b_and!1107 (not b_next!561))
