; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2678 () Bool)

(assert start!2678)

(declare-fun b_free!555 () Bool)

(declare-fun b_next!555 () Bool)

(assert (=> start!2678 (= b_free!555 (not b_next!555))))

(declare-fun tp!2800 () Bool)

(declare-fun b_and!1055 () Bool)

(assert (=> start!2678 (= tp!2800 b_and!1055)))

(declare-fun res!11928 () Bool)

(declare-fun e!9748 () Bool)

(assert (=> start!2678 (=> (not res!11928) (not e!9748))))

(declare-datatypes ((B!676 0))(
  ( (B!677 (val!436 Int)) )
))
(declare-datatypes ((tuple2!672 0))(
  ( (tuple2!673 (_1!336 (_ BitVec 64)) (_2!336 B!676)) )
))
(declare-datatypes ((List!521 0))(
  ( (Nil!518) (Cons!517 (h!1083 tuple2!672) (t!3013 List!521)) )
))
(declare-datatypes ((ListLongMap!503 0))(
  ( (ListLongMap!504 (toList!267 List!521)) )
))
(declare-fun lm!221 () ListLongMap!503)

(declare-fun p!191 () Int)

(declare-fun forall!138 (List!521 Int) Bool)

(assert (=> start!2678 (= res!11928 (forall!138 (toList!267 lm!221) p!191))))

(assert (=> start!2678 e!9748))

(declare-fun e!9749 () Bool)

(declare-fun inv!873 (ListLongMap!503) Bool)

(assert (=> start!2678 (and (inv!873 lm!221) e!9749)))

(assert (=> start!2678 tp!2800))

(declare-fun b!15939 () Bool)

(declare-fun res!11929 () Bool)

(assert (=> b!15939 (=> (not res!11929) (not e!9748))))

(declare-fun isEmpty!145 (ListLongMap!503) Bool)

(assert (=> b!15939 (= res!11929 (not (isEmpty!145 lm!221)))))

(declare-fun b!15940 () Bool)

(declare-fun tail!69 (ListLongMap!503) ListLongMap!503)

(assert (=> b!15940 (= e!9748 (not (forall!138 (toList!267 (tail!69 lm!221)) p!191)))))

(declare-fun b!15941 () Bool)

(declare-fun tp!2801 () Bool)

(assert (=> b!15941 (= e!9749 tp!2801)))

(assert (= (and start!2678 res!11928) b!15939))

(assert (= (and b!15939 res!11929) b!15940))

(assert (= start!2678 b!15941))

(declare-fun m!10947 () Bool)

(assert (=> start!2678 m!10947))

(declare-fun m!10949 () Bool)

(assert (=> start!2678 m!10949))

(declare-fun m!10951 () Bool)

(assert (=> b!15939 m!10951))

(declare-fun m!10953 () Bool)

(assert (=> b!15940 m!10953))

(declare-fun m!10955 () Bool)

(assert (=> b!15940 m!10955))

(check-sat (not start!2678) (not b_next!555) b_and!1055 (not b!15939) (not b!15941) (not b!15940))
(check-sat b_and!1055 (not b_next!555))
(get-model)

(declare-fun d!2889 () Bool)

(declare-fun isEmpty!149 (List!521) Bool)

(assert (=> d!2889 (= (isEmpty!145 lm!221) (isEmpty!149 (toList!267 lm!221)))))

(declare-fun bs!737 () Bool)

(assert (= bs!737 d!2889))

(declare-fun m!10971 () Bool)

(assert (=> bs!737 m!10971))

(assert (=> b!15939 d!2889))

(declare-fun d!2895 () Bool)

(declare-fun res!11952 () Bool)

(declare-fun e!9772 () Bool)

(assert (=> d!2895 (=> res!11952 e!9772)))

(get-info :version)

(assert (=> d!2895 (= res!11952 ((_ is Nil!518) (toList!267 (tail!69 lm!221))))))

(assert (=> d!2895 (= (forall!138 (toList!267 (tail!69 lm!221)) p!191) e!9772)))

(declare-fun b!15967 () Bool)

(declare-fun e!9773 () Bool)

(assert (=> b!15967 (= e!9772 e!9773)))

(declare-fun res!11953 () Bool)

(assert (=> b!15967 (=> (not res!11953) (not e!9773))))

(declare-fun dynLambda!122 (Int tuple2!672) Bool)

(assert (=> b!15967 (= res!11953 (dynLambda!122 p!191 (h!1083 (toList!267 (tail!69 lm!221)))))))

(declare-fun b!15968 () Bool)

(assert (=> b!15968 (= e!9773 (forall!138 (t!3013 (toList!267 (tail!69 lm!221))) p!191))))

(assert (= (and d!2895 (not res!11952)) b!15967))

(assert (= (and b!15967 res!11953) b!15968))

(declare-fun b_lambda!1155 () Bool)

(assert (=> (not b_lambda!1155) (not b!15967)))

(declare-fun t!3020 () Bool)

(declare-fun tb!487 () Bool)

(assert (=> (and start!2678 (= p!191 p!191) t!3020) tb!487))

(declare-fun result!841 () Bool)

(assert (=> tb!487 (= result!841 true)))

(assert (=> b!15967 t!3020))

(declare-fun b_and!1063 () Bool)

(assert (= b_and!1055 (and (=> t!3020 result!841) b_and!1063)))

(declare-fun m!10981 () Bool)

(assert (=> b!15967 m!10981))

(declare-fun m!10983 () Bool)

(assert (=> b!15968 m!10983))

(assert (=> b!15940 d!2895))

(declare-fun d!2901 () Bool)

(declare-fun tail!72 (List!521) List!521)

(assert (=> d!2901 (= (tail!69 lm!221) (ListLongMap!504 (tail!72 (toList!267 lm!221))))))

(declare-fun bs!740 () Bool)

(assert (= bs!740 d!2901))

(declare-fun m!10993 () Bool)

(assert (=> bs!740 m!10993))

(assert (=> b!15940 d!2901))

(declare-fun d!2909 () Bool)

(declare-fun res!11958 () Bool)

(declare-fun e!9778 () Bool)

(assert (=> d!2909 (=> res!11958 e!9778)))

(assert (=> d!2909 (= res!11958 ((_ is Nil!518) (toList!267 lm!221)))))

(assert (=> d!2909 (= (forall!138 (toList!267 lm!221) p!191) e!9778)))

(declare-fun b!15973 () Bool)

(declare-fun e!9779 () Bool)

(assert (=> b!15973 (= e!9778 e!9779)))

(declare-fun res!11959 () Bool)

(assert (=> b!15973 (=> (not res!11959) (not e!9779))))

(assert (=> b!15973 (= res!11959 (dynLambda!122 p!191 (h!1083 (toList!267 lm!221))))))

(declare-fun b!15974 () Bool)

(assert (=> b!15974 (= e!9779 (forall!138 (t!3013 (toList!267 lm!221)) p!191))))

(assert (= (and d!2909 (not res!11958)) b!15973))

(assert (= (and b!15973 res!11959) b!15974))

(declare-fun b_lambda!1161 () Bool)

(assert (=> (not b_lambda!1161) (not b!15973)))

(declare-fun t!3026 () Bool)

(declare-fun tb!493 () Bool)

(assert (=> (and start!2678 (= p!191 p!191) t!3026) tb!493))

(declare-fun result!847 () Bool)

(assert (=> tb!493 (= result!847 true)))

(assert (=> b!15973 t!3026))

(declare-fun b_and!1069 () Bool)

(assert (= b_and!1063 (and (=> t!3026 result!847) b_and!1069)))

(declare-fun m!10999 () Bool)

(assert (=> b!15973 m!10999))

(declare-fun m!11001 () Bool)

(assert (=> b!15974 m!11001))

(assert (=> start!2678 d!2909))

(declare-fun d!2913 () Bool)

(declare-fun isStrictlySorted!159 (List!521) Bool)

(assert (=> d!2913 (= (inv!873 lm!221) (isStrictlySorted!159 (toList!267 lm!221)))))

(declare-fun bs!743 () Bool)

(assert (= bs!743 d!2913))

(declare-fun m!11007 () Bool)

(assert (=> bs!743 m!11007))

(assert (=> start!2678 d!2913))

(declare-fun b!15989 () Bool)

(declare-fun e!9788 () Bool)

(declare-fun tp_is_empty!821 () Bool)

(declare-fun tp!2816 () Bool)

(assert (=> b!15989 (= e!9788 (and tp_is_empty!821 tp!2816))))

(assert (=> b!15941 (= tp!2801 e!9788)))

(assert (= (and b!15941 ((_ is Cons!517) (toList!267 lm!221))) b!15989))

(declare-fun b_lambda!1171 () Bool)

(assert (= b_lambda!1161 (or (and start!2678 b_free!555) b_lambda!1171)))

(declare-fun b_lambda!1173 () Bool)

(assert (= b_lambda!1155 (or (and start!2678 b_free!555) b_lambda!1173)))

(check-sat (not b_lambda!1171) (not b_lambda!1173) (not b_next!555) b_and!1069 (not d!2889) tp_is_empty!821 (not b!15974) (not d!2913) (not d!2901) (not b!15968) (not b!15989))
(check-sat b_and!1069 (not b_next!555))
(get-model)

(declare-fun d!2915 () Bool)

(declare-fun res!11964 () Bool)

(declare-fun e!9793 () Bool)

(assert (=> d!2915 (=> res!11964 e!9793)))

(assert (=> d!2915 (= res!11964 (or ((_ is Nil!518) (toList!267 lm!221)) ((_ is Nil!518) (t!3013 (toList!267 lm!221)))))))

(assert (=> d!2915 (= (isStrictlySorted!159 (toList!267 lm!221)) e!9793)))

(declare-fun b!15994 () Bool)

(declare-fun e!9794 () Bool)

(assert (=> b!15994 (= e!9793 e!9794)))

(declare-fun res!11965 () Bool)

(assert (=> b!15994 (=> (not res!11965) (not e!9794))))

(assert (=> b!15994 (= res!11965 (bvslt (_1!336 (h!1083 (toList!267 lm!221))) (_1!336 (h!1083 (t!3013 (toList!267 lm!221))))))))

(declare-fun b!15995 () Bool)

(assert (=> b!15995 (= e!9794 (isStrictlySorted!159 (t!3013 (toList!267 lm!221))))))

(assert (= (and d!2915 (not res!11964)) b!15994))

(assert (= (and b!15994 res!11965) b!15995))

(declare-fun m!11009 () Bool)

(assert (=> b!15995 m!11009))

(assert (=> d!2913 d!2915))

(declare-fun d!2921 () Bool)

(assert (=> d!2921 (= (isEmpty!149 (toList!267 lm!221)) ((_ is Nil!518) (toList!267 lm!221)))))

(assert (=> d!2889 d!2921))

(declare-fun d!2923 () Bool)

(assert (=> d!2923 (= (tail!72 (toList!267 lm!221)) (t!3013 (toList!267 lm!221)))))

(assert (=> d!2901 d!2923))

(declare-fun d!2925 () Bool)

(declare-fun res!11972 () Bool)

(declare-fun e!9801 () Bool)

(assert (=> d!2925 (=> res!11972 e!9801)))

(assert (=> d!2925 (= res!11972 ((_ is Nil!518) (t!3013 (toList!267 lm!221))))))

(assert (=> d!2925 (= (forall!138 (t!3013 (toList!267 lm!221)) p!191) e!9801)))

(declare-fun b!16002 () Bool)

(declare-fun e!9802 () Bool)

(assert (=> b!16002 (= e!9801 e!9802)))

(declare-fun res!11973 () Bool)

(assert (=> b!16002 (=> (not res!11973) (not e!9802))))

(assert (=> b!16002 (= res!11973 (dynLambda!122 p!191 (h!1083 (t!3013 (toList!267 lm!221)))))))

(declare-fun b!16003 () Bool)

(assert (=> b!16003 (= e!9802 (forall!138 (t!3013 (t!3013 (toList!267 lm!221))) p!191))))

(assert (= (and d!2925 (not res!11972)) b!16002))

(assert (= (and b!16002 res!11973) b!16003))

(declare-fun b_lambda!1175 () Bool)

(assert (=> (not b_lambda!1175) (not b!16002)))

(declare-fun t!3028 () Bool)

(declare-fun tb!495 () Bool)

(assert (=> (and start!2678 (= p!191 p!191) t!3028) tb!495))

(declare-fun result!855 () Bool)

(assert (=> tb!495 (= result!855 true)))

(assert (=> b!16002 t!3028))

(declare-fun b_and!1071 () Bool)

(assert (= b_and!1069 (and (=> t!3028 result!855) b_and!1071)))

(declare-fun m!11013 () Bool)

(assert (=> b!16002 m!11013))

(declare-fun m!11015 () Bool)

(assert (=> b!16003 m!11015))

(assert (=> b!15974 d!2925))

(declare-fun d!2931 () Bool)

(declare-fun res!11976 () Bool)

(declare-fun e!9805 () Bool)

(assert (=> d!2931 (=> res!11976 e!9805)))

(assert (=> d!2931 (= res!11976 ((_ is Nil!518) (t!3013 (toList!267 (tail!69 lm!221)))))))

(assert (=> d!2931 (= (forall!138 (t!3013 (toList!267 (tail!69 lm!221))) p!191) e!9805)))

(declare-fun b!16006 () Bool)

(declare-fun e!9806 () Bool)

(assert (=> b!16006 (= e!9805 e!9806)))

(declare-fun res!11977 () Bool)

(assert (=> b!16006 (=> (not res!11977) (not e!9806))))

(assert (=> b!16006 (= res!11977 (dynLambda!122 p!191 (h!1083 (t!3013 (toList!267 (tail!69 lm!221))))))))

(declare-fun b!16007 () Bool)

(assert (=> b!16007 (= e!9806 (forall!138 (t!3013 (t!3013 (toList!267 (tail!69 lm!221)))) p!191))))

(assert (= (and d!2931 (not res!11976)) b!16006))

(assert (= (and b!16006 res!11977) b!16007))

(declare-fun b_lambda!1179 () Bool)

(assert (=> (not b_lambda!1179) (not b!16006)))

(declare-fun t!3032 () Bool)

(declare-fun tb!499 () Bool)

(assert (=> (and start!2678 (= p!191 p!191) t!3032) tb!499))

(declare-fun result!859 () Bool)

(assert (=> tb!499 (= result!859 true)))

(assert (=> b!16006 t!3032))

(declare-fun b_and!1075 () Bool)

(assert (= b_and!1071 (and (=> t!3032 result!859) b_and!1075)))

(declare-fun m!11021 () Bool)

(assert (=> b!16006 m!11021))

(declare-fun m!11023 () Bool)

(assert (=> b!16007 m!11023))

(assert (=> b!15968 d!2931))

(declare-fun b!16010 () Bool)

(declare-fun e!9809 () Bool)

(declare-fun tp!2817 () Bool)

(assert (=> b!16010 (= e!9809 (and tp_is_empty!821 tp!2817))))

(assert (=> b!15989 (= tp!2816 e!9809)))

(assert (= (and b!15989 ((_ is Cons!517) (t!3013 (toList!267 lm!221)))) b!16010))

(declare-fun b_lambda!1183 () Bool)

(assert (= b_lambda!1179 (or (and start!2678 b_free!555) b_lambda!1183)))

(declare-fun b_lambda!1185 () Bool)

(assert (= b_lambda!1175 (or (and start!2678 b_free!555) b_lambda!1185)))

(check-sat (not b_lambda!1185) (not b_lambda!1171) (not b!15995) (not b_next!555) (not b!16007) tp_is_empty!821 (not b_lambda!1183) (not b!16003) b_and!1075 (not b_lambda!1173) (not b!16010))
(check-sat b_and!1075 (not b_next!555))
