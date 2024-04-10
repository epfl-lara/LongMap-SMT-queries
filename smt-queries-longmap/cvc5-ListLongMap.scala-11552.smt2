; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134486 () Bool)

(assert start!134486)

(declare-fun b!1569902 () Bool)

(declare-fun res!1072833 () Bool)

(declare-fun e!875195 () Bool)

(assert (=> b!1569902 (=> (not res!1072833) (not e!875195))))

(declare-datatypes ((B!2546 0))(
  ( (B!2547 (val!19635 Int)) )
))
(declare-datatypes ((tuple2!25372 0))(
  ( (tuple2!25373 (_1!12697 (_ BitVec 64)) (_2!12697 B!2546)) )
))
(declare-datatypes ((List!36755 0))(
  ( (Nil!36752) (Cons!36751 (h!38198 tuple2!25372) (t!51663 List!36755)) )
))
(declare-fun l!750 () List!36755)

(declare-fun isStrictlySorted!1019 (List!36755) Bool)

(assert (=> b!1569902 (= res!1072833 (isStrictlySorted!1019 (t!51663 l!750)))))

(declare-fun res!1072836 () Bool)

(assert (=> start!134486 (=> (not res!1072836) (not e!875195))))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun key2!21 () (_ BitVec 64))

(assert (=> start!134486 (= res!1072836 (not (= key1!37 key2!21)))))

(assert (=> start!134486 e!875195))

(declare-fun tp_is_empty!39097 () Bool)

(assert (=> start!134486 tp_is_empty!39097))

(declare-fun e!875194 () Bool)

(assert (=> start!134486 e!875194))

(assert (=> start!134486 true))

(declare-fun v1!32 () B!2546)

(declare-fun v2!10 () B!2546)

(declare-fun b!1569903 () Bool)

(declare-fun insertStrictlySorted!596 (List!36755 (_ BitVec 64) B!2546) List!36755)

(assert (=> b!1569903 (= e!875195 (not (= (insertStrictlySorted!596 (insertStrictlySorted!596 l!750 key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!596 (insertStrictlySorted!596 l!750 key2!21 v2!10) key1!37 v1!32))))))

(assert (=> b!1569903 (= (insertStrictlySorted!596 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!596 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-datatypes ((Unit!52096 0))(
  ( (Unit!52097) )
))
(declare-fun lt!673339 () Unit!52096)

(declare-fun lemmaInsertStrictlySortedCommutative!16 (List!36755 (_ BitVec 64) B!2546 (_ BitVec 64) B!2546) Unit!52096)

(assert (=> b!1569903 (= lt!673339 (lemmaInsertStrictlySortedCommutative!16 (t!51663 l!750) key1!37 v1!32 key2!21 v2!10))))

(declare-fun b!1569904 () Bool)

(declare-fun tp!114210 () Bool)

(assert (=> b!1569904 (= e!875194 (and tp_is_empty!39097 tp!114210))))

(declare-fun b!1569905 () Bool)

(declare-fun res!1072834 () Bool)

(assert (=> b!1569905 (=> (not res!1072834) (not e!875195))))

(assert (=> b!1569905 (= res!1072834 (and (is-Cons!36751 l!750) (bvslt (_1!12697 (h!38198 l!750)) key1!37) (bvslt (_1!12697 (h!38198 l!750)) key2!21)))))

(declare-fun b!1569906 () Bool)

(declare-fun res!1072835 () Bool)

(assert (=> b!1569906 (=> (not res!1072835) (not e!875195))))

(assert (=> b!1569906 (= res!1072835 (isStrictlySorted!1019 l!750))))

(assert (= (and start!134486 res!1072836) b!1569906))

(assert (= (and b!1569906 res!1072835) b!1569905))

(assert (= (and b!1569905 res!1072834) b!1569902))

(assert (= (and b!1569902 res!1072833) b!1569903))

(assert (= (and start!134486 (is-Cons!36751 l!750)) b!1569904))

(declare-fun m!1443937 () Bool)

(assert (=> b!1569902 m!1443937))

(declare-fun m!1443939 () Bool)

(assert (=> b!1569903 m!1443939))

(declare-fun m!1443941 () Bool)

(assert (=> b!1569903 m!1443941))

(declare-fun m!1443943 () Bool)

(assert (=> b!1569903 m!1443943))

(declare-fun m!1443945 () Bool)

(assert (=> b!1569903 m!1443945))

(declare-fun m!1443947 () Bool)

(assert (=> b!1569903 m!1443947))

(assert (=> b!1569903 m!1443941))

(declare-fun m!1443949 () Bool)

(assert (=> b!1569903 m!1443949))

(assert (=> b!1569903 m!1443945))

(declare-fun m!1443951 () Bool)

(assert (=> b!1569903 m!1443951))

(declare-fun m!1443953 () Bool)

(assert (=> b!1569903 m!1443953))

(assert (=> b!1569903 m!1443951))

(assert (=> b!1569903 m!1443939))

(declare-fun m!1443955 () Bool)

(assert (=> b!1569903 m!1443955))

(declare-fun m!1443957 () Bool)

(assert (=> b!1569906 m!1443957))

(push 1)

(assert (not b!1569902))

(assert (not b!1569904))

(assert (not b!1569903))

(assert tp_is_empty!39097)

(assert (not b!1569906))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun c!144828 () Bool)

(declare-fun b!1570023 () Bool)

(assert (=> b!1570023 (= c!144828 (and (is-Cons!36751 (insertStrictlySorted!596 l!750 key2!21 v2!10)) (bvsgt (_1!12697 (h!38198 (insertStrictlySorted!596 l!750 key2!21 v2!10))) key1!37)))))

(declare-fun e!875254 () List!36755)

(declare-fun e!875257 () List!36755)

(assert (=> b!1570023 (= e!875254 e!875257)))

(declare-fun d!163977 () Bool)

(declare-fun e!875258 () Bool)

(assert (=> d!163977 e!875258))

(declare-fun res!1072884 () Bool)

(assert (=> d!163977 (=> (not res!1072884) (not e!875258))))

(declare-fun lt!673354 () List!36755)

(assert (=> d!163977 (= res!1072884 (isStrictlySorted!1019 lt!673354))))

(declare-fun e!875255 () List!36755)

(assert (=> d!163977 (= lt!673354 e!875255)))

(declare-fun c!144831 () Bool)

(assert (=> d!163977 (= c!144831 (and (is-Cons!36751 (insertStrictlySorted!596 l!750 key2!21 v2!10)) (bvslt (_1!12697 (h!38198 (insertStrictlySorted!596 l!750 key2!21 v2!10))) key1!37)))))

(assert (=> d!163977 (isStrictlySorted!1019 (insertStrictlySorted!596 l!750 key2!21 v2!10))))

(assert (=> d!163977 (= (insertStrictlySorted!596 (insertStrictlySorted!596 l!750 key2!21 v2!10) key1!37 v1!32) lt!673354)))

(declare-fun call!72146 () List!36755)

(declare-fun bm!72141 () Bool)

(declare-fun e!875256 () List!36755)

(declare-fun $colon$colon!1000 (List!36755 tuple2!25372) List!36755)

(assert (=> bm!72141 (= call!72146 ($colon$colon!1000 e!875256 (ite c!144831 (h!38198 (insertStrictlySorted!596 l!750 key2!21 v2!10)) (tuple2!25373 key1!37 v1!32))))))

(declare-fun c!144829 () Bool)

(assert (=> bm!72141 (= c!144829 c!144831)))

(declare-fun b!1570024 () Bool)

(assert (=> b!1570024 (= e!875256 (insertStrictlySorted!596 (t!51663 (insertStrictlySorted!596 l!750 key2!21 v2!10)) key1!37 v1!32))))

(declare-fun bm!72142 () Bool)

(declare-fun call!72145 () List!36755)

(declare-fun call!72144 () List!36755)

(assert (=> bm!72142 (= call!72145 call!72144)))

(declare-fun b!1570025 () Bool)

(declare-fun res!1072883 () Bool)

(assert (=> b!1570025 (=> (not res!1072883) (not e!875258))))

(declare-fun containsKey!869 (List!36755 (_ BitVec 64)) Bool)

(assert (=> b!1570025 (= res!1072883 (containsKey!869 lt!673354 key1!37))))

(declare-fun bm!72143 () Bool)

(assert (=> bm!72143 (= call!72144 call!72146)))

(declare-fun b!1570026 () Bool)

(declare-fun contains!10429 (List!36755 tuple2!25372) Bool)

(assert (=> b!1570026 (= e!875258 (contains!10429 lt!673354 (tuple2!25373 key1!37 v1!32)))))

(declare-fun b!1570027 () Bool)

(assert (=> b!1570027 (= e!875257 call!72145)))

(declare-fun b!1570028 () Bool)

(assert (=> b!1570028 (= e!875255 e!875254)))

(declare-fun c!144830 () Bool)

(assert (=> b!1570028 (= c!144830 (and (is-Cons!36751 (insertStrictlySorted!596 l!750 key2!21 v2!10)) (= (_1!12697 (h!38198 (insertStrictlySorted!596 l!750 key2!21 v2!10))) key1!37)))))

(declare-fun b!1570029 () Bool)

(assert (=> b!1570029 (= e!875254 call!72144)))

(declare-fun b!1570030 () Bool)

(assert (=> b!1570030 (= e!875256 (ite c!144830 (t!51663 (insertStrictlySorted!596 l!750 key2!21 v2!10)) (ite c!144828 (Cons!36751 (h!38198 (insertStrictlySorted!596 l!750 key2!21 v2!10)) (t!51663 (insertStrictlySorted!596 l!750 key2!21 v2!10))) Nil!36752)))))

(declare-fun b!1570031 () Bool)

(assert (=> b!1570031 (= e!875255 call!72146)))

(declare-fun b!1570032 () Bool)

(assert (=> b!1570032 (= e!875257 call!72145)))

(assert (= (and d!163977 c!144831) b!1570031))

(assert (= (and d!163977 (not c!144831)) b!1570028))

(assert (= (and b!1570028 c!144830) b!1570029))

(assert (= (and b!1570028 (not c!144830)) b!1570023))

(assert (= (and b!1570023 c!144828) b!1570032))

(assert (= (and b!1570023 (not c!144828)) b!1570027))

(assert (= (or b!1570032 b!1570027) bm!72142))

(assert (= (or b!1570029 bm!72142) bm!72143))

(assert (= (or b!1570031 bm!72143) bm!72141))

(assert (= (and bm!72141 c!144829) b!1570024))

(assert (= (and bm!72141 (not c!144829)) b!1570030))

(assert (= (and d!163977 res!1072884) b!1570025))

(assert (= (and b!1570025 res!1072883) b!1570026))

(declare-fun m!1444021 () Bool)

(assert (=> d!163977 m!1444021))

(assert (=> d!163977 m!1443951))

(declare-fun m!1444024 () Bool)

(assert (=> d!163977 m!1444024))

(declare-fun m!1444031 () Bool)

(assert (=> bm!72141 m!1444031))

(declare-fun m!1444033 () Bool)

(assert (=> b!1570026 m!1444033))

(declare-fun m!1444035 () Bool)

(assert (=> b!1570024 m!1444035))

(declare-fun m!1444037 () Bool)

(assert (=> b!1570025 m!1444037))

(assert (=> b!1569903 d!163977))

(declare-fun d!163985 () Bool)

(assert (=> d!163985 (= (insertStrictlySorted!596 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!596 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-fun lt!673366 () Unit!52096)

(declare-fun choose!2085 (List!36755 (_ BitVec 64) B!2546 (_ BitVec 64) B!2546) Unit!52096)

(assert (=> d!163985 (= lt!673366 (choose!2085 (t!51663 l!750) key1!37 v1!32 key2!21 v2!10))))

(assert (=> d!163985 (not (= key1!37 key2!21))))

(assert (=> d!163985 (= (lemmaInsertStrictlySortedCommutative!16 (t!51663 l!750) key1!37 v1!32 key2!21 v2!10) lt!673366)))

(declare-fun bs!45228 () Bool)

(assert (= bs!45228 d!163985))

(declare-fun m!1444070 () Bool)

(assert (=> bs!45228 m!1444070))

(assert (=> bs!45228 m!1443939))

(assert (=> bs!45228 m!1443955))

(assert (=> bs!45228 m!1443939))

(assert (=> bs!45228 m!1443941))

(assert (=> bs!45228 m!1443941))

(assert (=> bs!45228 m!1443943))

(assert (=> b!1569903 d!163985))

(declare-fun b!1570083 () Bool)

(declare-fun c!144852 () Bool)

(assert (=> b!1570083 (= c!144852 (and (is-Cons!36751 (insertStrictlySorted!596 l!750 key1!37 v1!32)) (bvsgt (_1!12697 (h!38198 (insertStrictlySorted!596 l!750 key1!37 v1!32))) key2!21)))))

(declare-fun e!875284 () List!36755)

(declare-fun e!875287 () List!36755)

(assert (=> b!1570083 (= e!875284 e!875287)))

(declare-fun d!163997 () Bool)

(declare-fun e!875288 () Bool)

(assert (=> d!163997 e!875288))

(declare-fun res!1072896 () Bool)

(assert (=> d!163997 (=> (not res!1072896) (not e!875288))))

(declare-fun lt!673369 () List!36755)

(assert (=> d!163997 (= res!1072896 (isStrictlySorted!1019 lt!673369))))

(declare-fun e!875285 () List!36755)

(assert (=> d!163997 (= lt!673369 e!875285)))

(declare-fun c!144855 () Bool)

(assert (=> d!163997 (= c!144855 (and (is-Cons!36751 (insertStrictlySorted!596 l!750 key1!37 v1!32)) (bvslt (_1!12697 (h!38198 (insertStrictlySorted!596 l!750 key1!37 v1!32))) key2!21)))))

(assert (=> d!163997 (isStrictlySorted!1019 (insertStrictlySorted!596 l!750 key1!37 v1!32))))

(assert (=> d!163997 (= (insertStrictlySorted!596 (insertStrictlySorted!596 l!750 key1!37 v1!32) key2!21 v2!10) lt!673369)))

(declare-fun e!875286 () List!36755)

(declare-fun bm!72159 () Bool)

(declare-fun call!72164 () List!36755)

(assert (=> bm!72159 (= call!72164 ($colon$colon!1000 e!875286 (ite c!144855 (h!38198 (insertStrictlySorted!596 l!750 key1!37 v1!32)) (tuple2!25373 key2!21 v2!10))))))

(declare-fun c!144853 () Bool)

(assert (=> bm!72159 (= c!144853 c!144855)))

(declare-fun b!1570084 () Bool)

(assert (=> b!1570084 (= e!875286 (insertStrictlySorted!596 (t!51663 (insertStrictlySorted!596 l!750 key1!37 v1!32)) key2!21 v2!10))))

(declare-fun bm!72160 () Bool)

(declare-fun call!72163 () List!36755)

(declare-fun call!72162 () List!36755)

(assert (=> bm!72160 (= call!72163 call!72162)))

(declare-fun b!1570085 () Bool)

(declare-fun res!1072895 () Bool)

(assert (=> b!1570085 (=> (not res!1072895) (not e!875288))))

(assert (=> b!1570085 (= res!1072895 (containsKey!869 lt!673369 key2!21))))

(declare-fun bm!72161 () Bool)

(assert (=> bm!72161 (= call!72162 call!72164)))

(declare-fun b!1570086 () Bool)

(assert (=> b!1570086 (= e!875288 (contains!10429 lt!673369 (tuple2!25373 key2!21 v2!10)))))

(declare-fun b!1570087 () Bool)

(assert (=> b!1570087 (= e!875287 call!72163)))

(declare-fun b!1570088 () Bool)

(assert (=> b!1570088 (= e!875285 e!875284)))

(declare-fun c!144854 () Bool)

(assert (=> b!1570088 (= c!144854 (and (is-Cons!36751 (insertStrictlySorted!596 l!750 key1!37 v1!32)) (= (_1!12697 (h!38198 (insertStrictlySorted!596 l!750 key1!37 v1!32))) key2!21)))))

(declare-fun b!1570089 () Bool)

(assert (=> b!1570089 (= e!875284 call!72162)))

(declare-fun b!1570090 () Bool)

(assert (=> b!1570090 (= e!875286 (ite c!144854 (t!51663 (insertStrictlySorted!596 l!750 key1!37 v1!32)) (ite c!144852 (Cons!36751 (h!38198 (insertStrictlySorted!596 l!750 key1!37 v1!32)) (t!51663 (insertStrictlySorted!596 l!750 key1!37 v1!32))) Nil!36752)))))

(declare-fun b!1570091 () Bool)

(assert (=> b!1570091 (= e!875285 call!72164)))

(declare-fun b!1570092 () Bool)

(assert (=> b!1570092 (= e!875287 call!72163)))

(assert (= (and d!163997 c!144855) b!1570091))

(assert (= (and d!163997 (not c!144855)) b!1570088))

(assert (= (and b!1570088 c!144854) b!1570089))

(assert (= (and b!1570088 (not c!144854)) b!1570083))

(assert (= (and b!1570083 c!144852) b!1570092))

(assert (= (and b!1570083 (not c!144852)) b!1570087))

(assert (= (or b!1570092 b!1570087) bm!72160))

(assert (= (or b!1570089 bm!72160) bm!72161))

(assert (= (or b!1570091 bm!72161) bm!72159))

(assert (= (and bm!72159 c!144853) b!1570084))

(assert (= (and bm!72159 (not c!144853)) b!1570090))

(assert (= (and d!163997 res!1072896) b!1570085))

(assert (= (and b!1570085 res!1072895) b!1570086))

(declare-fun m!1444091 () Bool)

(assert (=> d!163997 m!1444091))

(assert (=> d!163997 m!1443945))

(declare-fun m!1444093 () Bool)

(assert (=> d!163997 m!1444093))

(declare-fun m!1444099 () Bool)

(assert (=> bm!72159 m!1444099))

(declare-fun m!1444103 () Bool)

(assert (=> b!1570086 m!1444103))

(declare-fun m!1444105 () Bool)

(assert (=> b!1570084 m!1444105))

(declare-fun m!1444107 () Bool)

(assert (=> b!1570085 m!1444107))

(assert (=> b!1569903 d!163997))

(declare-fun b!1570113 () Bool)

(declare-fun c!144864 () Bool)

(assert (=> b!1570113 (= c!144864 (and (is-Cons!36751 l!750) (bvsgt (_1!12697 (h!38198 l!750)) key2!21)))))

(declare-fun e!875299 () List!36755)

(declare-fun e!875302 () List!36755)

(assert (=> b!1570113 (= e!875299 e!875302)))

(declare-fun d!164003 () Bool)

(declare-fun e!875303 () Bool)

(assert (=> d!164003 e!875303))

(declare-fun res!1072902 () Bool)

(assert (=> d!164003 (=> (not res!1072902) (not e!875303))))

(declare-fun lt!673372 () List!36755)

(assert (=> d!164003 (= res!1072902 (isStrictlySorted!1019 lt!673372))))

(declare-fun e!875300 () List!36755)

(assert (=> d!164003 (= lt!673372 e!875300)))

(declare-fun c!144867 () Bool)

(assert (=> d!164003 (= c!144867 (and (is-Cons!36751 l!750) (bvslt (_1!12697 (h!38198 l!750)) key2!21)))))

(assert (=> d!164003 (isStrictlySorted!1019 l!750)))

(assert (=> d!164003 (= (insertStrictlySorted!596 l!750 key2!21 v2!10) lt!673372)))

(declare-fun bm!72168 () Bool)

(declare-fun e!875301 () List!36755)

(declare-fun call!72173 () List!36755)

(assert (=> bm!72168 (= call!72173 ($colon$colon!1000 e!875301 (ite c!144867 (h!38198 l!750) (tuple2!25373 key2!21 v2!10))))))

(declare-fun c!144865 () Bool)

(assert (=> bm!72168 (= c!144865 c!144867)))

(declare-fun b!1570114 () Bool)

(assert (=> b!1570114 (= e!875301 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10))))

(declare-fun bm!72169 () Bool)

(declare-fun call!72172 () List!36755)

(declare-fun call!72171 () List!36755)

(assert (=> bm!72169 (= call!72172 call!72171)))

(declare-fun b!1570115 () Bool)

(declare-fun res!1072901 () Bool)

(assert (=> b!1570115 (=> (not res!1072901) (not e!875303))))

(assert (=> b!1570115 (= res!1072901 (containsKey!869 lt!673372 key2!21))))

(declare-fun bm!72170 () Bool)

(assert (=> bm!72170 (= call!72171 call!72173)))

(declare-fun b!1570116 () Bool)

(assert (=> b!1570116 (= e!875303 (contains!10429 lt!673372 (tuple2!25373 key2!21 v2!10)))))

(declare-fun b!1570117 () Bool)

(assert (=> b!1570117 (= e!875302 call!72172)))

(declare-fun b!1570118 () Bool)

(assert (=> b!1570118 (= e!875300 e!875299)))

(declare-fun c!144866 () Bool)

(assert (=> b!1570118 (= c!144866 (and (is-Cons!36751 l!750) (= (_1!12697 (h!38198 l!750)) key2!21)))))

(declare-fun b!1570119 () Bool)

(assert (=> b!1570119 (= e!875299 call!72171)))

(declare-fun b!1570120 () Bool)

(assert (=> b!1570120 (= e!875301 (ite c!144866 (t!51663 l!750) (ite c!144864 (Cons!36751 (h!38198 l!750) (t!51663 l!750)) Nil!36752)))))

(declare-fun b!1570121 () Bool)

(assert (=> b!1570121 (= e!875300 call!72173)))

(declare-fun b!1570122 () Bool)

(assert (=> b!1570122 (= e!875302 call!72172)))

(assert (= (and d!164003 c!144867) b!1570121))

(assert (= (and d!164003 (not c!144867)) b!1570118))

(assert (= (and b!1570118 c!144866) b!1570119))

(assert (= (and b!1570118 (not c!144866)) b!1570113))

(assert (= (and b!1570113 c!144864) b!1570122))

(assert (= (and b!1570113 (not c!144864)) b!1570117))

(assert (= (or b!1570122 b!1570117) bm!72169))

(assert (= (or b!1570119 bm!72169) bm!72170))

(assert (= (or b!1570121 bm!72170) bm!72168))

(assert (= (and bm!72168 c!144865) b!1570114))

(assert (= (and bm!72168 (not c!144865)) b!1570120))

(assert (= (and d!164003 res!1072902) b!1570115))

(assert (= (and b!1570115 res!1072901) b!1570116))

(declare-fun m!1444123 () Bool)

(assert (=> d!164003 m!1444123))

(assert (=> d!164003 m!1443957))

(declare-fun m!1444129 () Bool)

(assert (=> bm!72168 m!1444129))

(declare-fun m!1444131 () Bool)

(assert (=> b!1570116 m!1444131))

(assert (=> b!1570114 m!1443939))

(declare-fun m!1444133 () Bool)

(assert (=> b!1570115 m!1444133))

(assert (=> b!1569903 d!164003))

(declare-fun b!1570143 () Bool)

(declare-fun c!144876 () Bool)

(assert (=> b!1570143 (= c!144876 (and (is-Cons!36751 l!750) (bvsgt (_1!12697 (h!38198 l!750)) key1!37)))))

(declare-fun e!875314 () List!36755)

(declare-fun e!875317 () List!36755)

(assert (=> b!1570143 (= e!875314 e!875317)))

(declare-fun d!164009 () Bool)

(declare-fun e!875318 () Bool)

(assert (=> d!164009 e!875318))

(declare-fun res!1072908 () Bool)

(assert (=> d!164009 (=> (not res!1072908) (not e!875318))))

(declare-fun lt!673375 () List!36755)

(assert (=> d!164009 (= res!1072908 (isStrictlySorted!1019 lt!673375))))

(declare-fun e!875315 () List!36755)

(assert (=> d!164009 (= lt!673375 e!875315)))

(declare-fun c!144879 () Bool)

(assert (=> d!164009 (= c!144879 (and (is-Cons!36751 l!750) (bvslt (_1!12697 (h!38198 l!750)) key1!37)))))

(assert (=> d!164009 (isStrictlySorted!1019 l!750)))

(assert (=> d!164009 (= (insertStrictlySorted!596 l!750 key1!37 v1!32) lt!673375)))

(declare-fun bm!72177 () Bool)

(declare-fun e!875316 () List!36755)

(declare-fun call!72182 () List!36755)

(assert (=> bm!72177 (= call!72182 ($colon$colon!1000 e!875316 (ite c!144879 (h!38198 l!750) (tuple2!25373 key1!37 v1!32))))))

(declare-fun c!144877 () Bool)

(assert (=> bm!72177 (= c!144877 c!144879)))

(declare-fun b!1570144 () Bool)

(assert (=> b!1570144 (= e!875316 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32))))

(declare-fun bm!72178 () Bool)

(declare-fun call!72181 () List!36755)

(declare-fun call!72180 () List!36755)

(assert (=> bm!72178 (= call!72181 call!72180)))

(declare-fun b!1570145 () Bool)

(declare-fun res!1072907 () Bool)

(assert (=> b!1570145 (=> (not res!1072907) (not e!875318))))

(assert (=> b!1570145 (= res!1072907 (containsKey!869 lt!673375 key1!37))))

(declare-fun bm!72179 () Bool)

(assert (=> bm!72179 (= call!72180 call!72182)))

(declare-fun b!1570146 () Bool)

(assert (=> b!1570146 (= e!875318 (contains!10429 lt!673375 (tuple2!25373 key1!37 v1!32)))))

(declare-fun b!1570147 () Bool)

(assert (=> b!1570147 (= e!875317 call!72181)))

(declare-fun b!1570148 () Bool)

(assert (=> b!1570148 (= e!875315 e!875314)))

(declare-fun c!144878 () Bool)

(assert (=> b!1570148 (= c!144878 (and (is-Cons!36751 l!750) (= (_1!12697 (h!38198 l!750)) key1!37)))))

(declare-fun b!1570149 () Bool)

(assert (=> b!1570149 (= e!875314 call!72180)))

(declare-fun b!1570150 () Bool)

(assert (=> b!1570150 (= e!875316 (ite c!144878 (t!51663 l!750) (ite c!144876 (Cons!36751 (h!38198 l!750) (t!51663 l!750)) Nil!36752)))))

(declare-fun b!1570151 () Bool)

(assert (=> b!1570151 (= e!875315 call!72182)))

(declare-fun b!1570152 () Bool)

(assert (=> b!1570152 (= e!875317 call!72181)))

(assert (= (and d!164009 c!144879) b!1570151))

(assert (= (and d!164009 (not c!144879)) b!1570148))

(assert (= (and b!1570148 c!144878) b!1570149))

(assert (= (and b!1570148 (not c!144878)) b!1570143))

(assert (= (and b!1570143 c!144876) b!1570152))

(assert (= (and b!1570143 (not c!144876)) b!1570147))

(assert (= (or b!1570152 b!1570147) bm!72178))

(assert (= (or b!1570149 bm!72178) bm!72179))

(assert (= (or b!1570151 bm!72179) bm!72177))

(assert (= (and bm!72177 c!144877) b!1570144))

(assert (= (and bm!72177 (not c!144877)) b!1570150))

(assert (= (and d!164009 res!1072908) b!1570145))

(assert (= (and b!1570145 res!1072907) b!1570146))

(declare-fun m!1444151 () Bool)

(assert (=> d!164009 m!1444151))

(assert (=> d!164009 m!1443957))

(declare-fun m!1444155 () Bool)

(assert (=> bm!72177 m!1444155))

(declare-fun m!1444159 () Bool)

(assert (=> b!1570146 m!1444159))

(assert (=> b!1570144 m!1443941))

(declare-fun m!1444161 () Bool)

(assert (=> b!1570145 m!1444161))

(assert (=> b!1569903 d!164009))

(declare-fun c!144888 () Bool)

(declare-fun b!1570173 () Bool)

(assert (=> b!1570173 (= c!144888 (and (is-Cons!36751 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32)) (bvsgt (_1!12697 (h!38198 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32))) key2!21)))))

(declare-fun e!875329 () List!36755)

(declare-fun e!875332 () List!36755)

(assert (=> b!1570173 (= e!875329 e!875332)))

(declare-fun d!164015 () Bool)

(declare-fun e!875333 () Bool)

(assert (=> d!164015 e!875333))

(declare-fun res!1072914 () Bool)

(assert (=> d!164015 (=> (not res!1072914) (not e!875333))))

(declare-fun lt!673378 () List!36755)

(assert (=> d!164015 (= res!1072914 (isStrictlySorted!1019 lt!673378))))

(declare-fun e!875330 () List!36755)

(assert (=> d!164015 (= lt!673378 e!875330)))

(declare-fun c!144891 () Bool)

(assert (=> d!164015 (= c!144891 (and (is-Cons!36751 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32)) (bvslt (_1!12697 (h!38198 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32))) key2!21)))))

(assert (=> d!164015 (isStrictlySorted!1019 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32))))

(assert (=> d!164015 (= (insertStrictlySorted!596 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32) key2!21 v2!10) lt!673378)))

(declare-fun bm!72186 () Bool)

(declare-fun call!72191 () List!36755)

(declare-fun e!875331 () List!36755)

(assert (=> bm!72186 (= call!72191 ($colon$colon!1000 e!875331 (ite c!144891 (h!38198 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32)) (tuple2!25373 key2!21 v2!10))))))

(declare-fun c!144889 () Bool)

(assert (=> bm!72186 (= c!144889 c!144891)))

(declare-fun b!1570174 () Bool)

(assert (=> b!1570174 (= e!875331 (insertStrictlySorted!596 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32)) key2!21 v2!10))))

(declare-fun bm!72187 () Bool)

(declare-fun call!72190 () List!36755)

(declare-fun call!72189 () List!36755)

(assert (=> bm!72187 (= call!72190 call!72189)))

(declare-fun b!1570175 () Bool)

(declare-fun res!1072913 () Bool)

(assert (=> b!1570175 (=> (not res!1072913) (not e!875333))))

(assert (=> b!1570175 (= res!1072913 (containsKey!869 lt!673378 key2!21))))

(declare-fun bm!72188 () Bool)

(assert (=> bm!72188 (= call!72189 call!72191)))

(declare-fun b!1570176 () Bool)

(assert (=> b!1570176 (= e!875333 (contains!10429 lt!673378 (tuple2!25373 key2!21 v2!10)))))

(declare-fun b!1570177 () Bool)

(assert (=> b!1570177 (= e!875332 call!72190)))

(declare-fun b!1570178 () Bool)

(assert (=> b!1570178 (= e!875330 e!875329)))

(declare-fun c!144890 () Bool)

(assert (=> b!1570178 (= c!144890 (and (is-Cons!36751 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32)) (= (_1!12697 (h!38198 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32))) key2!21)))))

(declare-fun b!1570179 () Bool)

(assert (=> b!1570179 (= e!875329 call!72189)))

(declare-fun b!1570180 () Bool)

(assert (=> b!1570180 (= e!875331 (ite c!144890 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32)) (ite c!144888 (Cons!36751 (h!38198 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32)) (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32))) Nil!36752)))))

(declare-fun b!1570181 () Bool)

(assert (=> b!1570181 (= e!875330 call!72191)))

(declare-fun b!1570182 () Bool)

(assert (=> b!1570182 (= e!875332 call!72190)))

(assert (= (and d!164015 c!144891) b!1570181))

(assert (= (and d!164015 (not c!144891)) b!1570178))

(assert (= (and b!1570178 c!144890) b!1570179))

(assert (= (and b!1570178 (not c!144890)) b!1570173))

(assert (= (and b!1570173 c!144888) b!1570182))

(assert (= (and b!1570173 (not c!144888)) b!1570177))

(assert (= (or b!1570182 b!1570177) bm!72187))

(assert (= (or b!1570179 bm!72187) bm!72188))

(assert (= (or b!1570181 bm!72188) bm!72186))

(assert (= (and bm!72186 c!144889) b!1570174))

(assert (= (and bm!72186 (not c!144889)) b!1570180))

(assert (= (and d!164015 res!1072914) b!1570175))

(assert (= (and b!1570175 res!1072913) b!1570176))

(declare-fun m!1444177 () Bool)

(assert (=> d!164015 m!1444177))

(assert (=> d!164015 m!1443941))

(declare-fun m!1444181 () Bool)

(assert (=> d!164015 m!1444181))

(declare-fun m!1444185 () Bool)

(assert (=> bm!72186 m!1444185))

(declare-fun m!1444191 () Bool)

(assert (=> b!1570176 m!1444191))

(declare-fun m!1444193 () Bool)

(assert (=> b!1570174 m!1444193))

(declare-fun m!1444195 () Bool)

(assert (=> b!1570175 m!1444195))

(assert (=> b!1569903 d!164015))

(declare-fun b!1570193 () Bool)

(declare-fun c!144896 () Bool)

(assert (=> b!1570193 (= c!144896 (and (is-Cons!36751 (t!51663 l!750)) (bvsgt (_1!12697 (h!38198 (t!51663 l!750))) key2!21)))))

(declare-fun e!875339 () List!36755)

(declare-fun e!875342 () List!36755)

(assert (=> b!1570193 (= e!875339 e!875342)))

(declare-fun d!164021 () Bool)

(declare-fun e!875343 () Bool)

(assert (=> d!164021 e!875343))

(declare-fun res!1072918 () Bool)

(assert (=> d!164021 (=> (not res!1072918) (not e!875343))))

(declare-fun lt!673380 () List!36755)

(assert (=> d!164021 (= res!1072918 (isStrictlySorted!1019 lt!673380))))

(declare-fun e!875340 () List!36755)

(assert (=> d!164021 (= lt!673380 e!875340)))

(declare-fun c!144899 () Bool)

(assert (=> d!164021 (= c!144899 (and (is-Cons!36751 (t!51663 l!750)) (bvslt (_1!12697 (h!38198 (t!51663 l!750))) key2!21)))))

(assert (=> d!164021 (isStrictlySorted!1019 (t!51663 l!750))))

(assert (=> d!164021 (= (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10) lt!673380)))

(declare-fun call!72197 () List!36755)

(declare-fun bm!72192 () Bool)

(declare-fun e!875341 () List!36755)

(assert (=> bm!72192 (= call!72197 ($colon$colon!1000 e!875341 (ite c!144899 (h!38198 (t!51663 l!750)) (tuple2!25373 key2!21 v2!10))))))

(declare-fun c!144897 () Bool)

(assert (=> bm!72192 (= c!144897 c!144899)))

(declare-fun b!1570194 () Bool)

(assert (=> b!1570194 (= e!875341 (insertStrictlySorted!596 (t!51663 (t!51663 l!750)) key2!21 v2!10))))

(declare-fun bm!72193 () Bool)

(declare-fun call!72196 () List!36755)

(declare-fun call!72195 () List!36755)

(assert (=> bm!72193 (= call!72196 call!72195)))

(declare-fun b!1570195 () Bool)

(declare-fun res!1072917 () Bool)

(assert (=> b!1570195 (=> (not res!1072917) (not e!875343))))

(assert (=> b!1570195 (= res!1072917 (containsKey!869 lt!673380 key2!21))))

(declare-fun bm!72194 () Bool)

(assert (=> bm!72194 (= call!72195 call!72197)))

(declare-fun b!1570196 () Bool)

(assert (=> b!1570196 (= e!875343 (contains!10429 lt!673380 (tuple2!25373 key2!21 v2!10)))))

(declare-fun b!1570197 () Bool)

(assert (=> b!1570197 (= e!875342 call!72196)))

(declare-fun b!1570198 () Bool)

(assert (=> b!1570198 (= e!875340 e!875339)))

(declare-fun c!144898 () Bool)

(assert (=> b!1570198 (= c!144898 (and (is-Cons!36751 (t!51663 l!750)) (= (_1!12697 (h!38198 (t!51663 l!750))) key2!21)))))

(declare-fun b!1570199 () Bool)

(assert (=> b!1570199 (= e!875339 call!72195)))

(declare-fun b!1570200 () Bool)

(assert (=> b!1570200 (= e!875341 (ite c!144898 (t!51663 (t!51663 l!750)) (ite c!144896 (Cons!36751 (h!38198 (t!51663 l!750)) (t!51663 (t!51663 l!750))) Nil!36752)))))

(declare-fun b!1570201 () Bool)

(assert (=> b!1570201 (= e!875340 call!72197)))

(declare-fun b!1570202 () Bool)

(assert (=> b!1570202 (= e!875342 call!72196)))

(assert (= (and d!164021 c!144899) b!1570201))

(assert (= (and d!164021 (not c!144899)) b!1570198))

(assert (= (and b!1570198 c!144898) b!1570199))

(assert (= (and b!1570198 (not c!144898)) b!1570193))

(assert (= (and b!1570193 c!144896) b!1570202))

(assert (= (and b!1570193 (not c!144896)) b!1570197))

(assert (= (or b!1570202 b!1570197) bm!72193))

(assert (= (or b!1570199 bm!72193) bm!72194))

(assert (= (or b!1570201 bm!72194) bm!72192))

(assert (= (and bm!72192 c!144897) b!1570194))

(assert (= (and bm!72192 (not c!144897)) b!1570200))

(assert (= (and d!164021 res!1072918) b!1570195))

(assert (= (and b!1570195 res!1072917) b!1570196))

(declare-fun m!1444201 () Bool)

(assert (=> d!164021 m!1444201))

(assert (=> d!164021 m!1443937))

(declare-fun m!1444205 () Bool)

(assert (=> bm!72192 m!1444205))

(declare-fun m!1444211 () Bool)

(assert (=> b!1570196 m!1444211))

(declare-fun m!1444213 () Bool)

(assert (=> b!1570194 m!1444213))

(declare-fun m!1444215 () Bool)

(assert (=> b!1570195 m!1444215))

(assert (=> b!1569903 d!164021))

(declare-fun b!1570217 () Bool)

(declare-fun c!144904 () Bool)

(assert (=> b!1570217 (= c!144904 (and (is-Cons!36751 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10)) (bvsgt (_1!12697 (h!38198 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10))) key1!37)))))

(declare-fun e!875353 () List!36755)

(declare-fun e!875356 () List!36755)

(assert (=> b!1570217 (= e!875353 e!875356)))

(declare-fun d!164025 () Bool)

(declare-fun e!875357 () Bool)

(assert (=> d!164025 e!875357))

(declare-fun res!1072926 () Bool)

(assert (=> d!164025 (=> (not res!1072926) (not e!875357))))

(declare-fun lt!673382 () List!36755)

(assert (=> d!164025 (= res!1072926 (isStrictlySorted!1019 lt!673382))))

(declare-fun e!875354 () List!36755)

(assert (=> d!164025 (= lt!673382 e!875354)))

(declare-fun c!144907 () Bool)

(assert (=> d!164025 (= c!144907 (and (is-Cons!36751 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10)) (bvslt (_1!12697 (h!38198 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10))) key1!37)))))

(assert (=> d!164025 (isStrictlySorted!1019 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10))))

(assert (=> d!164025 (= (insertStrictlySorted!596 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10) key1!37 v1!32) lt!673382)))

(declare-fun bm!72198 () Bool)

(declare-fun e!875355 () List!36755)

(declare-fun call!72203 () List!36755)

(assert (=> bm!72198 (= call!72203 ($colon$colon!1000 e!875355 (ite c!144907 (h!38198 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10)) (tuple2!25373 key1!37 v1!32))))))

(declare-fun c!144905 () Bool)

(assert (=> bm!72198 (= c!144905 c!144907)))

(declare-fun b!1570218 () Bool)

(assert (=> b!1570218 (= e!875355 (insertStrictlySorted!596 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10)) key1!37 v1!32))))

(declare-fun bm!72199 () Bool)

(declare-fun call!72202 () List!36755)

(declare-fun call!72201 () List!36755)

(assert (=> bm!72199 (= call!72202 call!72201)))

(declare-fun b!1570219 () Bool)

(declare-fun res!1072925 () Bool)

(assert (=> b!1570219 (=> (not res!1072925) (not e!875357))))

(assert (=> b!1570219 (= res!1072925 (containsKey!869 lt!673382 key1!37))))

(declare-fun bm!72200 () Bool)

(assert (=> bm!72200 (= call!72201 call!72203)))

(declare-fun b!1570220 () Bool)

(assert (=> b!1570220 (= e!875357 (contains!10429 lt!673382 (tuple2!25373 key1!37 v1!32)))))

(declare-fun b!1570221 () Bool)

(assert (=> b!1570221 (= e!875356 call!72202)))

(declare-fun b!1570222 () Bool)

(assert (=> b!1570222 (= e!875354 e!875353)))

(declare-fun c!144906 () Bool)

(assert (=> b!1570222 (= c!144906 (and (is-Cons!36751 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10)) (= (_1!12697 (h!38198 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10))) key1!37)))))

(declare-fun b!1570223 () Bool)

(assert (=> b!1570223 (= e!875353 call!72201)))

(declare-fun b!1570224 () Bool)

(assert (=> b!1570224 (= e!875355 (ite c!144906 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10)) (ite c!144904 (Cons!36751 (h!38198 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10)) (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10))) Nil!36752)))))

(declare-fun b!1570225 () Bool)

(assert (=> b!1570225 (= e!875354 call!72203)))

(declare-fun b!1570226 () Bool)

(assert (=> b!1570226 (= e!875356 call!72202)))

(assert (= (and d!164025 c!144907) b!1570225))

(assert (= (and d!164025 (not c!144907)) b!1570222))

(assert (= (and b!1570222 c!144906) b!1570223))

(assert (= (and b!1570222 (not c!144906)) b!1570217))

(assert (= (and b!1570217 c!144904) b!1570226))

(assert (= (and b!1570217 (not c!144904)) b!1570221))

(assert (= (or b!1570226 b!1570221) bm!72199))

(assert (= (or b!1570223 bm!72199) bm!72200))

(assert (= (or b!1570225 bm!72200) bm!72198))

(assert (= (and bm!72198 c!144905) b!1570218))

(assert (= (and bm!72198 (not c!144905)) b!1570224))

(assert (= (and d!164025 res!1072926) b!1570219))

(assert (= (and b!1570219 res!1072925) b!1570220))

(declare-fun m!1444221 () Bool)

(assert (=> d!164025 m!1444221))

(assert (=> d!164025 m!1443939))

(declare-fun m!1444225 () Bool)

(assert (=> d!164025 m!1444225))

(declare-fun m!1444229 () Bool)

(assert (=> bm!72198 m!1444229))

(declare-fun m!1444233 () Bool)

(assert (=> b!1570220 m!1444233))

(declare-fun m!1444237 () Bool)

(assert (=> b!1570218 m!1444237))

(declare-fun m!1444239 () Bool)

(assert (=> b!1570219 m!1444239))

(assert (=> b!1569903 d!164025))

(declare-fun b!1570239 () Bool)

(declare-fun c!144912 () Bool)

(assert (=> b!1570239 (= c!144912 (and (is-Cons!36751 (t!51663 l!750)) (bvsgt (_1!12697 (h!38198 (t!51663 l!750))) key1!37)))))

(declare-fun e!875365 () List!36755)

(declare-fun e!875368 () List!36755)

(assert (=> b!1570239 (= e!875365 e!875368)))

(declare-fun d!164029 () Bool)

(declare-fun e!875369 () Bool)

(assert (=> d!164029 e!875369))

(declare-fun res!1072932 () Bool)

(assert (=> d!164029 (=> (not res!1072932) (not e!875369))))

(declare-fun lt!673384 () List!36755)

(assert (=> d!164029 (= res!1072932 (isStrictlySorted!1019 lt!673384))))

(declare-fun e!875366 () List!36755)

(assert (=> d!164029 (= lt!673384 e!875366)))

(declare-fun c!144915 () Bool)

(assert (=> d!164029 (= c!144915 (and (is-Cons!36751 (t!51663 l!750)) (bvslt (_1!12697 (h!38198 (t!51663 l!750))) key1!37)))))

(assert (=> d!164029 (isStrictlySorted!1019 (t!51663 l!750))))

(assert (=> d!164029 (= (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32) lt!673384)))

(declare-fun e!875367 () List!36755)

(declare-fun call!72209 () List!36755)

(declare-fun bm!72204 () Bool)

(assert (=> bm!72204 (= call!72209 ($colon$colon!1000 e!875367 (ite c!144915 (h!38198 (t!51663 l!750)) (tuple2!25373 key1!37 v1!32))))))

(declare-fun c!144913 () Bool)

(assert (=> bm!72204 (= c!144913 c!144915)))

(declare-fun b!1570240 () Bool)

(assert (=> b!1570240 (= e!875367 (insertStrictlySorted!596 (t!51663 (t!51663 l!750)) key1!37 v1!32))))

(declare-fun bm!72205 () Bool)

(declare-fun call!72208 () List!36755)

(declare-fun call!72207 () List!36755)

(assert (=> bm!72205 (= call!72208 call!72207)))

(declare-fun b!1570241 () Bool)

(declare-fun res!1072931 () Bool)

(assert (=> b!1570241 (=> (not res!1072931) (not e!875369))))

(assert (=> b!1570241 (= res!1072931 (containsKey!869 lt!673384 key1!37))))

(declare-fun bm!72206 () Bool)

(assert (=> bm!72206 (= call!72207 call!72209)))

(declare-fun b!1570242 () Bool)

(assert (=> b!1570242 (= e!875369 (contains!10429 lt!673384 (tuple2!25373 key1!37 v1!32)))))

(declare-fun b!1570243 () Bool)

(assert (=> b!1570243 (= e!875368 call!72208)))

(declare-fun b!1570244 () Bool)

(assert (=> b!1570244 (= e!875366 e!875365)))

(declare-fun c!144914 () Bool)

(assert (=> b!1570244 (= c!144914 (and (is-Cons!36751 (t!51663 l!750)) (= (_1!12697 (h!38198 (t!51663 l!750))) key1!37)))))

(declare-fun b!1570245 () Bool)

(assert (=> b!1570245 (= e!875365 call!72207)))

(declare-fun b!1570246 () Bool)

(assert (=> b!1570246 (= e!875367 (ite c!144914 (t!51663 (t!51663 l!750)) (ite c!144912 (Cons!36751 (h!38198 (t!51663 l!750)) (t!51663 (t!51663 l!750))) Nil!36752)))))

(declare-fun b!1570247 () Bool)

(assert (=> b!1570247 (= e!875366 call!72209)))

(declare-fun b!1570248 () Bool)

(assert (=> b!1570248 (= e!875368 call!72208)))

(assert (= (and d!164029 c!144915) b!1570247))

(assert (= (and d!164029 (not c!144915)) b!1570244))

(assert (= (and b!1570244 c!144914) b!1570245))

(assert (= (and b!1570244 (not c!144914)) b!1570239))

(assert (= (and b!1570239 c!144912) b!1570248))

(assert (= (and b!1570239 (not c!144912)) b!1570243))

(assert (= (or b!1570248 b!1570243) bm!72205))

(assert (= (or b!1570245 bm!72205) bm!72206))

(assert (= (or b!1570247 bm!72206) bm!72204))

(assert (= (and bm!72204 c!144913) b!1570240))

(assert (= (and bm!72204 (not c!144913)) b!1570246))

(assert (= (and d!164029 res!1072932) b!1570241))

(assert (= (and b!1570241 res!1072931) b!1570242))

(declare-fun m!1444247 () Bool)

(assert (=> d!164029 m!1444247))

(assert (=> d!164029 m!1443937))

(declare-fun m!1444251 () Bool)

(assert (=> bm!72204 m!1444251))

(declare-fun m!1444257 () Bool)

(assert (=> b!1570242 m!1444257))

(declare-fun m!1444259 () Bool)

(assert (=> b!1570240 m!1444259))

(declare-fun m!1444261 () Bool)

(assert (=> b!1570241 m!1444261))

(assert (=> b!1569903 d!164029))

(declare-fun d!164035 () Bool)

(declare-fun res!1072941 () Bool)

(declare-fun e!875384 () Bool)

(assert (=> d!164035 (=> res!1072941 e!875384)))

(assert (=> d!164035 (= res!1072941 (or (is-Nil!36752 (t!51663 l!750)) (is-Nil!36752 (t!51663 (t!51663 l!750)))))))

(assert (=> d!164035 (= (isStrictlySorted!1019 (t!51663 l!750)) e!875384)))

(declare-fun b!1570267 () Bool)

(declare-fun e!875385 () Bool)

(assert (=> b!1570267 (= e!875384 e!875385)))

(declare-fun res!1072942 () Bool)

(assert (=> b!1570267 (=> (not res!1072942) (not e!875385))))

(assert (=> b!1570267 (= res!1072942 (bvslt (_1!12697 (h!38198 (t!51663 l!750))) (_1!12697 (h!38198 (t!51663 (t!51663 l!750))))))))

(declare-fun b!1570268 () Bool)

(assert (=> b!1570268 (= e!875385 (isStrictlySorted!1019 (t!51663 (t!51663 l!750))))))

(assert (= (and d!164035 (not res!1072941)) b!1570267))

(assert (= (and b!1570267 res!1072942) b!1570268))

(declare-fun m!1444265 () Bool)

(assert (=> b!1570268 m!1444265))

(assert (=> b!1569902 d!164035))

(declare-fun d!164037 () Bool)

(declare-fun res!1072943 () Bool)

(declare-fun e!875386 () Bool)

(assert (=> d!164037 (=> res!1072943 e!875386)))

(assert (=> d!164037 (= res!1072943 (or (is-Nil!36752 l!750) (is-Nil!36752 (t!51663 l!750))))))

(assert (=> d!164037 (= (isStrictlySorted!1019 l!750) e!875386)))

(declare-fun b!1570269 () Bool)

(declare-fun e!875387 () Bool)

(assert (=> b!1570269 (= e!875386 e!875387)))

(declare-fun res!1072944 () Bool)

(assert (=> b!1570269 (=> (not res!1072944) (not e!875387))))

(assert (=> b!1570269 (= res!1072944 (bvslt (_1!12697 (h!38198 l!750)) (_1!12697 (h!38198 (t!51663 l!750)))))))

(declare-fun b!1570270 () Bool)

(assert (=> b!1570270 (= e!875387 (isStrictlySorted!1019 (t!51663 l!750)))))

(assert (= (and d!164037 (not res!1072943)) b!1570269))

(assert (= (and b!1570269 res!1072944) b!1570270))

(assert (=> b!1570270 m!1443937))

(assert (=> b!1569906 d!164037))

(declare-fun b!1570275 () Bool)

(declare-fun e!875390 () Bool)

(declare-fun tp!114225 () Bool)

(assert (=> b!1570275 (= e!875390 (and tp_is_empty!39097 tp!114225))))

(assert (=> b!1569904 (= tp!114210 e!875390)))

(assert (= (and b!1569904 (is-Cons!36751 (t!51663 l!750))) b!1570275))

(push 1)

(assert (not b!1570194))

(assert (not bm!72159))

(assert (not d!164015))

(assert (not b!1570241))

(assert (not b!1570195))

(assert (not b!1570174))

(assert (not d!164003))

(assert (not d!163997))

(assert (not b!1570114))

(assert (not bm!72192))

(assert (not b!1570086))

(assert (not b!1570116))

(assert (not bm!72186))

(assert (not b!1570146))

(assert (not b!1570084))

(assert (not b!1570218))

(assert (not d!164021))

(assert (not bm!72141))

(assert (not b!1570219))

(assert (not b!1570145))

(assert (not b!1570268))

(assert (not b!1570144))

(assert (not b!1570024))

(assert (not d!163985))

(assert (not b!1570220))

(assert (not b!1570196))

(assert (not d!164025))

(assert (not b!1570242))

(assert (not b!1570026))

(assert (not bm!72204))

(assert (not b!1570085))

(assert (not d!164029))

(assert (not b!1570275))

(assert (not b!1570175))

(assert tp_is_empty!39097)

(assert (not b!1570176))

(assert (not d!164009))

(assert (not b!1570025))

(assert (not b!1570240))

(assert (not b!1570270))

(assert (not bm!72168))

(assert (not b!1570115))

(assert (not bm!72198))

(assert (not bm!72177))

(assert (not d!163977))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> b!1570114 d!164021))

(declare-fun d!164127 () Bool)

(declare-fun res!1073027 () Bool)

(declare-fun e!875492 () Bool)

(assert (=> d!164127 (=> res!1073027 e!875492)))

(assert (=> d!164127 (= res!1073027 (and (is-Cons!36751 lt!673382) (= (_1!12697 (h!38198 lt!673382)) key1!37)))))

(assert (=> d!164127 (= (containsKey!869 lt!673382 key1!37) e!875492)))

(declare-fun b!1570407 () Bool)

(declare-fun e!875493 () Bool)

(assert (=> b!1570407 (= e!875492 e!875493)))

(declare-fun res!1073028 () Bool)

(assert (=> b!1570407 (=> (not res!1073028) (not e!875493))))

(assert (=> b!1570407 (= res!1073028 (and (or (not (is-Cons!36751 lt!673382)) (bvsle (_1!12697 (h!38198 lt!673382)) key1!37)) (is-Cons!36751 lt!673382) (bvslt (_1!12697 (h!38198 lt!673382)) key1!37)))))

(declare-fun b!1570408 () Bool)

(assert (=> b!1570408 (= e!875493 (containsKey!869 (t!51663 lt!673382) key1!37))))

(assert (= (and d!164127 (not res!1073027)) b!1570407))

(assert (= (and b!1570407 res!1073028) b!1570408))

(declare-fun m!1444417 () Bool)

(assert (=> b!1570408 m!1444417))

(assert (=> b!1570219 d!164127))

(declare-fun d!164129 () Bool)

(declare-fun res!1073029 () Bool)

(declare-fun e!875494 () Bool)

(assert (=> d!164129 (=> res!1073029 e!875494)))

(assert (=> d!164129 (= res!1073029 (or (is-Nil!36752 lt!673384) (is-Nil!36752 (t!51663 lt!673384))))))

(assert (=> d!164129 (= (isStrictlySorted!1019 lt!673384) e!875494)))

(declare-fun b!1570409 () Bool)

(declare-fun e!875495 () Bool)

(assert (=> b!1570409 (= e!875494 e!875495)))

(declare-fun res!1073030 () Bool)

(assert (=> b!1570409 (=> (not res!1073030) (not e!875495))))

(assert (=> b!1570409 (= res!1073030 (bvslt (_1!12697 (h!38198 lt!673384)) (_1!12697 (h!38198 (t!51663 lt!673384)))))))

(declare-fun b!1570410 () Bool)

(assert (=> b!1570410 (= e!875495 (isStrictlySorted!1019 (t!51663 lt!673384)))))

(assert (= (and d!164129 (not res!1073029)) b!1570409))

(assert (= (and b!1570409 res!1073030) b!1570410))

(declare-fun m!1444419 () Bool)

(assert (=> b!1570410 m!1444419))

(assert (=> d!164029 d!164129))

(assert (=> d!164029 d!164035))

(declare-fun d!164131 () Bool)

(assert (=> d!164131 (= ($colon$colon!1000 e!875331 (ite c!144891 (h!38198 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32)) (tuple2!25373 key2!21 v2!10))) (Cons!36751 (ite c!144891 (h!38198 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32)) (tuple2!25373 key2!21 v2!10)) e!875331))))

(assert (=> bm!72186 d!164131))

(declare-fun c!144940 () Bool)

(declare-fun b!1570411 () Bool)

(assert (=> b!1570411 (= c!144940 (and (is-Cons!36751 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10))) (bvsgt (_1!12697 (h!38198 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10)))) key1!37)))))

(declare-fun e!875496 () List!36755)

(declare-fun e!875499 () List!36755)

(assert (=> b!1570411 (= e!875496 e!875499)))

(declare-fun d!164133 () Bool)

(declare-fun e!875500 () Bool)

(assert (=> d!164133 e!875500))

(declare-fun res!1073032 () Bool)

(assert (=> d!164133 (=> (not res!1073032) (not e!875500))))

(declare-fun lt!673401 () List!36755)

(assert (=> d!164133 (= res!1073032 (isStrictlySorted!1019 lt!673401))))

(declare-fun e!875497 () List!36755)

(assert (=> d!164133 (= lt!673401 e!875497)))

(declare-fun c!144943 () Bool)

(assert (=> d!164133 (= c!144943 (and (is-Cons!36751 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10))) (bvslt (_1!12697 (h!38198 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10)))) key1!37)))))

(assert (=> d!164133 (isStrictlySorted!1019 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10)))))

(assert (=> d!164133 (= (insertStrictlySorted!596 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10)) key1!37 v1!32) lt!673401)))

(declare-fun e!875498 () List!36755)

(declare-fun bm!72225 () Bool)

(declare-fun call!72230 () List!36755)

(assert (=> bm!72225 (= call!72230 ($colon$colon!1000 e!875498 (ite c!144943 (h!38198 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10))) (tuple2!25373 key1!37 v1!32))))))

(declare-fun c!144941 () Bool)

(assert (=> bm!72225 (= c!144941 c!144943)))

(declare-fun b!1570412 () Bool)

(assert (=> b!1570412 (= e!875498 (insertStrictlySorted!596 (t!51663 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10))) key1!37 v1!32))))

(declare-fun bm!72226 () Bool)

(declare-fun call!72229 () List!36755)

(declare-fun call!72228 () List!36755)

(assert (=> bm!72226 (= call!72229 call!72228)))

(declare-fun b!1570413 () Bool)

(declare-fun res!1073031 () Bool)

(assert (=> b!1570413 (=> (not res!1073031) (not e!875500))))

(assert (=> b!1570413 (= res!1073031 (containsKey!869 lt!673401 key1!37))))

(declare-fun bm!72227 () Bool)

(assert (=> bm!72227 (= call!72228 call!72230)))

(declare-fun b!1570414 () Bool)

(assert (=> b!1570414 (= e!875500 (contains!10429 lt!673401 (tuple2!25373 key1!37 v1!32)))))

(declare-fun b!1570415 () Bool)

(assert (=> b!1570415 (= e!875499 call!72229)))

(declare-fun b!1570416 () Bool)

(assert (=> b!1570416 (= e!875497 e!875496)))

(declare-fun c!144942 () Bool)

(assert (=> b!1570416 (= c!144942 (and (is-Cons!36751 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10))) (= (_1!12697 (h!38198 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10)))) key1!37)))))

(declare-fun b!1570417 () Bool)

(assert (=> b!1570417 (= e!875496 call!72228)))

(declare-fun b!1570418 () Bool)

(assert (=> b!1570418 (= e!875498 (ite c!144942 (t!51663 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10))) (ite c!144940 (Cons!36751 (h!38198 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10))) (t!51663 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10)))) Nil!36752)))))

(declare-fun b!1570419 () Bool)

(assert (=> b!1570419 (= e!875497 call!72230)))

(declare-fun b!1570420 () Bool)

(assert (=> b!1570420 (= e!875499 call!72229)))

(assert (= (and d!164133 c!144943) b!1570419))

(assert (= (and d!164133 (not c!144943)) b!1570416))

(assert (= (and b!1570416 c!144942) b!1570417))

(assert (= (and b!1570416 (not c!144942)) b!1570411))

(assert (= (and b!1570411 c!144940) b!1570420))

(assert (= (and b!1570411 (not c!144940)) b!1570415))

(assert (= (or b!1570420 b!1570415) bm!72226))

(assert (= (or b!1570417 bm!72226) bm!72227))

(assert (= (or b!1570419 bm!72227) bm!72225))

(assert (= (and bm!72225 c!144941) b!1570412))

(assert (= (and bm!72225 (not c!144941)) b!1570418))

(assert (= (and d!164133 res!1073032) b!1570413))

(assert (= (and b!1570413 res!1073031) b!1570414))

(declare-fun m!1444421 () Bool)

(assert (=> d!164133 m!1444421))

(declare-fun m!1444423 () Bool)

(assert (=> d!164133 m!1444423))

(declare-fun m!1444425 () Bool)

(assert (=> bm!72225 m!1444425))

(declare-fun m!1444427 () Bool)

(assert (=> b!1570414 m!1444427))

(declare-fun m!1444429 () Bool)

(assert (=> b!1570412 m!1444429))

(declare-fun m!1444431 () Bool)

(assert (=> b!1570413 m!1444431))

(assert (=> b!1570218 d!164133))

(declare-fun d!164135 () Bool)

(declare-fun res!1073033 () Bool)

(declare-fun e!875501 () Bool)

(assert (=> d!164135 (=> res!1073033 e!875501)))

(assert (=> d!164135 (= res!1073033 (or (is-Nil!36752 (t!51663 (t!51663 l!750))) (is-Nil!36752 (t!51663 (t!51663 (t!51663 l!750))))))))

(assert (=> d!164135 (= (isStrictlySorted!1019 (t!51663 (t!51663 l!750))) e!875501)))

(declare-fun b!1570421 () Bool)

(declare-fun e!875502 () Bool)

(assert (=> b!1570421 (= e!875501 e!875502)))

(declare-fun res!1073034 () Bool)

(assert (=> b!1570421 (=> (not res!1073034) (not e!875502))))

(assert (=> b!1570421 (= res!1073034 (bvslt (_1!12697 (h!38198 (t!51663 (t!51663 l!750)))) (_1!12697 (h!38198 (t!51663 (t!51663 (t!51663 l!750)))))))))

(declare-fun b!1570422 () Bool)

(assert (=> b!1570422 (= e!875502 (isStrictlySorted!1019 (t!51663 (t!51663 (t!51663 l!750)))))))

(assert (= (and d!164135 (not res!1073033)) b!1570421))

(assert (= (and b!1570421 res!1073034) b!1570422))

(declare-fun m!1444433 () Bool)

(assert (=> b!1570422 m!1444433))

(assert (=> b!1570268 d!164135))

(declare-fun d!164139 () Bool)

(assert (=> d!164139 (= ($colon$colon!1000 e!875301 (ite c!144867 (h!38198 l!750) (tuple2!25373 key2!21 v2!10))) (Cons!36751 (ite c!144867 (h!38198 l!750) (tuple2!25373 key2!21 v2!10)) e!875301))))

(assert (=> bm!72168 d!164139))

(declare-fun c!144944 () Bool)

(declare-fun b!1570423 () Bool)

(assert (=> b!1570423 (= c!144944 (and (is-Cons!36751 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32))) (bvsgt (_1!12697 (h!38198 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32)))) key2!21)))))

(declare-fun e!875503 () List!36755)

(declare-fun e!875506 () List!36755)

(assert (=> b!1570423 (= e!875503 e!875506)))

(declare-fun d!164141 () Bool)

(declare-fun e!875507 () Bool)

(assert (=> d!164141 e!875507))

(declare-fun res!1073036 () Bool)

(assert (=> d!164141 (=> (not res!1073036) (not e!875507))))

(declare-fun lt!673402 () List!36755)

(assert (=> d!164141 (= res!1073036 (isStrictlySorted!1019 lt!673402))))

(declare-fun e!875504 () List!36755)

(assert (=> d!164141 (= lt!673402 e!875504)))

(declare-fun c!144947 () Bool)

(assert (=> d!164141 (= c!144947 (and (is-Cons!36751 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32))) (bvslt (_1!12697 (h!38198 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32)))) key2!21)))))

(assert (=> d!164141 (isStrictlySorted!1019 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32)))))

(assert (=> d!164141 (= (insertStrictlySorted!596 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32)) key2!21 v2!10) lt!673402)))

(declare-fun bm!72228 () Bool)

(declare-fun call!72233 () List!36755)

(declare-fun e!875505 () List!36755)

(assert (=> bm!72228 (= call!72233 ($colon$colon!1000 e!875505 (ite c!144947 (h!38198 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32))) (tuple2!25373 key2!21 v2!10))))))

(declare-fun c!144945 () Bool)

(assert (=> bm!72228 (= c!144945 c!144947)))

(declare-fun b!1570424 () Bool)

(assert (=> b!1570424 (= e!875505 (insertStrictlySorted!596 (t!51663 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32))) key2!21 v2!10))))

(declare-fun bm!72229 () Bool)

(declare-fun call!72232 () List!36755)

(declare-fun call!72231 () List!36755)

(assert (=> bm!72229 (= call!72232 call!72231)))

(declare-fun b!1570425 () Bool)

(declare-fun res!1073035 () Bool)

(assert (=> b!1570425 (=> (not res!1073035) (not e!875507))))

(assert (=> b!1570425 (= res!1073035 (containsKey!869 lt!673402 key2!21))))

(declare-fun bm!72230 () Bool)

(assert (=> bm!72230 (= call!72231 call!72233)))

(declare-fun b!1570426 () Bool)

(assert (=> b!1570426 (= e!875507 (contains!10429 lt!673402 (tuple2!25373 key2!21 v2!10)))))

(declare-fun b!1570427 () Bool)

(assert (=> b!1570427 (= e!875506 call!72232)))

(declare-fun b!1570428 () Bool)

(assert (=> b!1570428 (= e!875504 e!875503)))

(declare-fun c!144946 () Bool)

(assert (=> b!1570428 (= c!144946 (and (is-Cons!36751 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32))) (= (_1!12697 (h!38198 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32)))) key2!21)))))

(declare-fun b!1570429 () Bool)

(assert (=> b!1570429 (= e!875503 call!72231)))

(declare-fun b!1570430 () Bool)

(assert (=> b!1570430 (= e!875505 (ite c!144946 (t!51663 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32))) (ite c!144944 (Cons!36751 (h!38198 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32))) (t!51663 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32)))) Nil!36752)))))

(declare-fun b!1570431 () Bool)

(assert (=> b!1570431 (= e!875504 call!72233)))

(declare-fun b!1570432 () Bool)

(assert (=> b!1570432 (= e!875506 call!72232)))

(assert (= (and d!164141 c!144947) b!1570431))

(assert (= (and d!164141 (not c!144947)) b!1570428))

(assert (= (and b!1570428 c!144946) b!1570429))

(assert (= (and b!1570428 (not c!144946)) b!1570423))

(assert (= (and b!1570423 c!144944) b!1570432))

(assert (= (and b!1570423 (not c!144944)) b!1570427))

(assert (= (or b!1570432 b!1570427) bm!72229))

(assert (= (or b!1570429 bm!72229) bm!72230))

(assert (= (or b!1570431 bm!72230) bm!72228))

(assert (= (and bm!72228 c!144945) b!1570424))

(assert (= (and bm!72228 (not c!144945)) b!1570430))

(assert (= (and d!164141 res!1073036) b!1570425))

(assert (= (and b!1570425 res!1073035) b!1570426))

(declare-fun m!1444435 () Bool)

(assert (=> d!164141 m!1444435))

(declare-fun m!1444437 () Bool)

(assert (=> d!164141 m!1444437))

(declare-fun m!1444439 () Bool)

(assert (=> bm!72228 m!1444439))

(declare-fun m!1444441 () Bool)

(assert (=> b!1570426 m!1444441))

(declare-fun m!1444443 () Bool)

(assert (=> b!1570424 m!1444443))

(declare-fun m!1444445 () Bool)

(assert (=> b!1570425 m!1444445))

(assert (=> b!1570174 d!164141))

(declare-fun d!164145 () Bool)

(assert (=> d!164145 (= ($colon$colon!1000 e!875355 (ite c!144907 (h!38198 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10)) (tuple2!25373 key1!37 v1!32))) (Cons!36751 (ite c!144907 (h!38198 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10)) (tuple2!25373 key1!37 v1!32)) e!875355))))

(assert (=> bm!72198 d!164145))

(declare-fun d!164147 () Bool)

(declare-fun res!1073037 () Bool)

(declare-fun e!875508 () Bool)

(assert (=> d!164147 (=> res!1073037 e!875508)))

(assert (=> d!164147 (= res!1073037 (or (is-Nil!36752 lt!673378) (is-Nil!36752 (t!51663 lt!673378))))))

(assert (=> d!164147 (= (isStrictlySorted!1019 lt!673378) e!875508)))

(declare-fun b!1570433 () Bool)

(declare-fun e!875509 () Bool)

(assert (=> b!1570433 (= e!875508 e!875509)))

(declare-fun res!1073038 () Bool)

(assert (=> b!1570433 (=> (not res!1073038) (not e!875509))))

(assert (=> b!1570433 (= res!1073038 (bvslt (_1!12697 (h!38198 lt!673378)) (_1!12697 (h!38198 (t!51663 lt!673378)))))))

(declare-fun b!1570434 () Bool)

(assert (=> b!1570434 (= e!875509 (isStrictlySorted!1019 (t!51663 lt!673378)))))

(assert (= (and d!164147 (not res!1073037)) b!1570433))

(assert (= (and b!1570433 res!1073038) b!1570434))

(declare-fun m!1444447 () Bool)

(assert (=> b!1570434 m!1444447))

(assert (=> d!164015 d!164147))

(declare-fun d!164149 () Bool)

(declare-fun res!1073039 () Bool)

(declare-fun e!875510 () Bool)

(assert (=> d!164149 (=> res!1073039 e!875510)))

(assert (=> d!164149 (= res!1073039 (or (is-Nil!36752 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32)) (is-Nil!36752 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32)))))))

(assert (=> d!164149 (= (isStrictlySorted!1019 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32)) e!875510)))

(declare-fun b!1570435 () Bool)

(declare-fun e!875511 () Bool)

(assert (=> b!1570435 (= e!875510 e!875511)))

(declare-fun res!1073040 () Bool)

(assert (=> b!1570435 (=> (not res!1073040) (not e!875511))))

(assert (=> b!1570435 (= res!1073040 (bvslt (_1!12697 (h!38198 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32))) (_1!12697 (h!38198 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32))))))))

(declare-fun b!1570436 () Bool)

(assert (=> b!1570436 (= e!875511 (isStrictlySorted!1019 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32))))))

(assert (= (and d!164149 (not res!1073039)) b!1570435))

(assert (= (and b!1570435 res!1073040) b!1570436))

(assert (=> b!1570436 m!1444437))

(assert (=> d!164015 d!164149))

(declare-fun d!164151 () Bool)

(declare-fun lt!673405 () Bool)

(declare-fun content!820 (List!36755) (Set tuple2!25372))

(assert (=> d!164151 (= lt!673405 (set.member (tuple2!25373 key1!37 v1!32) (content!820 lt!673375)))))

(declare-fun e!875523 () Bool)

(assert (=> d!164151 (= lt!673405 e!875523)))

(declare-fun res!1073052 () Bool)

(assert (=> d!164151 (=> (not res!1073052) (not e!875523))))

(assert (=> d!164151 (= res!1073052 (is-Cons!36751 lt!673375))))

(assert (=> d!164151 (= (contains!10429 lt!673375 (tuple2!25373 key1!37 v1!32)) lt!673405)))

(declare-fun b!1570447 () Bool)

(declare-fun e!875522 () Bool)

(assert (=> b!1570447 (= e!875523 e!875522)))

(declare-fun res!1073051 () Bool)

(assert (=> b!1570447 (=> res!1073051 e!875522)))

(assert (=> b!1570447 (= res!1073051 (= (h!38198 lt!673375) (tuple2!25373 key1!37 v1!32)))))

(declare-fun b!1570448 () Bool)

(assert (=> b!1570448 (= e!875522 (contains!10429 (t!51663 lt!673375) (tuple2!25373 key1!37 v1!32)))))

(assert (= (and d!164151 res!1073052) b!1570447))

(assert (= (and b!1570447 (not res!1073051)) b!1570448))

(declare-fun m!1444451 () Bool)

(assert (=> d!164151 m!1444451))

(declare-fun m!1444453 () Bool)

(assert (=> d!164151 m!1444453))

(declare-fun m!1444455 () Bool)

(assert (=> b!1570448 m!1444455))

(assert (=> b!1570146 d!164151))

(declare-fun d!164155 () Bool)

(declare-fun lt!673406 () Bool)

(assert (=> d!164155 (= lt!673406 (set.member (tuple2!25373 key2!21 v2!10) (content!820 lt!673380)))))

(declare-fun e!875525 () Bool)

(assert (=> d!164155 (= lt!673406 e!875525)))

(declare-fun res!1073054 () Bool)

(assert (=> d!164155 (=> (not res!1073054) (not e!875525))))

(assert (=> d!164155 (= res!1073054 (is-Cons!36751 lt!673380))))

(assert (=> d!164155 (= (contains!10429 lt!673380 (tuple2!25373 key2!21 v2!10)) lt!673406)))

(declare-fun b!1570449 () Bool)

(declare-fun e!875524 () Bool)

(assert (=> b!1570449 (= e!875525 e!875524)))

(declare-fun res!1073053 () Bool)

(assert (=> b!1570449 (=> res!1073053 e!875524)))

(assert (=> b!1570449 (= res!1073053 (= (h!38198 lt!673380) (tuple2!25373 key2!21 v2!10)))))

(declare-fun b!1570450 () Bool)

(assert (=> b!1570450 (= e!875524 (contains!10429 (t!51663 lt!673380) (tuple2!25373 key2!21 v2!10)))))

(assert (= (and d!164155 res!1073054) b!1570449))

(assert (= (and b!1570449 (not res!1073053)) b!1570450))

(declare-fun m!1444457 () Bool)

(assert (=> d!164155 m!1444457))

(declare-fun m!1444459 () Bool)

(assert (=> d!164155 m!1444459))

(declare-fun m!1444461 () Bool)

(assert (=> b!1570450 m!1444461))

(assert (=> b!1570196 d!164155))

(declare-fun d!164159 () Bool)

(declare-fun res!1073057 () Bool)

(declare-fun e!875528 () Bool)

(assert (=> d!164159 (=> res!1073057 e!875528)))

(assert (=> d!164159 (= res!1073057 (and (is-Cons!36751 lt!673380) (= (_1!12697 (h!38198 lt!673380)) key2!21)))))

(assert (=> d!164159 (= (containsKey!869 lt!673380 key2!21) e!875528)))

(declare-fun b!1570453 () Bool)

(declare-fun e!875529 () Bool)

(assert (=> b!1570453 (= e!875528 e!875529)))

(declare-fun res!1073058 () Bool)

(assert (=> b!1570453 (=> (not res!1073058) (not e!875529))))

(assert (=> b!1570453 (= res!1073058 (and (or (not (is-Cons!36751 lt!673380)) (bvsle (_1!12697 (h!38198 lt!673380)) key2!21)) (is-Cons!36751 lt!673380) (bvslt (_1!12697 (h!38198 lt!673380)) key2!21)))))

(declare-fun b!1570454 () Bool)

(assert (=> b!1570454 (= e!875529 (containsKey!869 (t!51663 lt!673380) key2!21))))

(assert (= (and d!164159 (not res!1073057)) b!1570453))

(assert (= (and b!1570453 res!1073058) b!1570454))

(declare-fun m!1444465 () Bool)

(assert (=> b!1570454 m!1444465))

(assert (=> b!1570195 d!164159))

(declare-fun d!164163 () Bool)

(declare-fun res!1073059 () Bool)

(declare-fun e!875530 () Bool)

(assert (=> d!164163 (=> res!1073059 e!875530)))

(assert (=> d!164163 (= res!1073059 (or (is-Nil!36752 lt!673375) (is-Nil!36752 (t!51663 lt!673375))))))

(assert (=> d!164163 (= (isStrictlySorted!1019 lt!673375) e!875530)))

(declare-fun b!1570455 () Bool)

(declare-fun e!875531 () Bool)

(assert (=> b!1570455 (= e!875530 e!875531)))

(declare-fun res!1073060 () Bool)

(assert (=> b!1570455 (=> (not res!1073060) (not e!875531))))

(assert (=> b!1570455 (= res!1073060 (bvslt (_1!12697 (h!38198 lt!673375)) (_1!12697 (h!38198 (t!51663 lt!673375)))))))

(declare-fun b!1570456 () Bool)

(assert (=> b!1570456 (= e!875531 (isStrictlySorted!1019 (t!51663 lt!673375)))))

(assert (= (and d!164163 (not res!1073059)) b!1570455))

(assert (= (and b!1570455 res!1073060) b!1570456))

(declare-fun m!1444467 () Bool)

(assert (=> b!1570456 m!1444467))

(assert (=> d!164009 d!164163))

(assert (=> d!164009 d!164037))

(declare-fun d!164167 () Bool)

(declare-fun res!1073063 () Bool)

(declare-fun e!875537 () Bool)

(assert (=> d!164167 (=> res!1073063 e!875537)))

(assert (=> d!164167 (= res!1073063 (or (is-Nil!36752 lt!673382) (is-Nil!36752 (t!51663 lt!673382))))))

(assert (=> d!164167 (= (isStrictlySorted!1019 lt!673382) e!875537)))

(declare-fun b!1570467 () Bool)

(declare-fun e!875538 () Bool)

(assert (=> b!1570467 (= e!875537 e!875538)))

(declare-fun res!1073064 () Bool)

(assert (=> b!1570467 (=> (not res!1073064) (not e!875538))))

(assert (=> b!1570467 (= res!1073064 (bvslt (_1!12697 (h!38198 lt!673382)) (_1!12697 (h!38198 (t!51663 lt!673382)))))))

(declare-fun b!1570468 () Bool)

(assert (=> b!1570468 (= e!875538 (isStrictlySorted!1019 (t!51663 lt!673382)))))

(assert (= (and d!164167 (not res!1073063)) b!1570467))

(assert (= (and b!1570467 res!1073064) b!1570468))

(declare-fun m!1444469 () Bool)

(assert (=> b!1570468 m!1444469))

(assert (=> d!164025 d!164167))

(declare-fun d!164169 () Bool)

(declare-fun res!1073065 () Bool)

(declare-fun e!875539 () Bool)

(assert (=> d!164169 (=> res!1073065 e!875539)))

(assert (=> d!164169 (= res!1073065 (or (is-Nil!36752 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10)) (is-Nil!36752 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10)))))))

(assert (=> d!164169 (= (isStrictlySorted!1019 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10)) e!875539)))

(declare-fun b!1570469 () Bool)

(declare-fun e!875540 () Bool)

(assert (=> b!1570469 (= e!875539 e!875540)))

(declare-fun res!1073066 () Bool)

(assert (=> b!1570469 (=> (not res!1073066) (not e!875540))))

(assert (=> b!1570469 (= res!1073066 (bvslt (_1!12697 (h!38198 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10))) (_1!12697 (h!38198 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10))))))))

(declare-fun b!1570470 () Bool)

(assert (=> b!1570470 (= e!875540 (isStrictlySorted!1019 (t!51663 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10))))))

(assert (= (and d!164169 (not res!1073065)) b!1570469))

(assert (= (and b!1570469 res!1073066) b!1570470))

(assert (=> b!1570470 m!1444423))

(assert (=> d!164025 d!164169))

(declare-fun d!164171 () Bool)

(declare-fun res!1073067 () Bool)

(declare-fun e!875541 () Bool)

(assert (=> d!164171 (=> res!1073067 e!875541)))

(assert (=> d!164171 (= res!1073067 (or (is-Nil!36752 lt!673380) (is-Nil!36752 (t!51663 lt!673380))))))

(assert (=> d!164171 (= (isStrictlySorted!1019 lt!673380) e!875541)))

(declare-fun b!1570471 () Bool)

(declare-fun e!875542 () Bool)

(assert (=> b!1570471 (= e!875541 e!875542)))

(declare-fun res!1073068 () Bool)

(assert (=> b!1570471 (=> (not res!1073068) (not e!875542))))

(assert (=> b!1570471 (= res!1073068 (bvslt (_1!12697 (h!38198 lt!673380)) (_1!12697 (h!38198 (t!51663 lt!673380)))))))

(declare-fun b!1570472 () Bool)

(assert (=> b!1570472 (= e!875542 (isStrictlySorted!1019 (t!51663 lt!673380)))))

(assert (= (and d!164171 (not res!1073067)) b!1570471))

(assert (= (and b!1570471 res!1073068) b!1570472))

(declare-fun m!1444475 () Bool)

(assert (=> b!1570472 m!1444475))

(assert (=> d!164021 d!164171))

(assert (=> d!164021 d!164035))

(declare-fun d!164173 () Bool)

(declare-fun lt!673408 () Bool)

(assert (=> d!164173 (= lt!673408 (set.member (tuple2!25373 key1!37 v1!32) (content!820 lt!673384)))))

(declare-fun e!875544 () Bool)

(assert (=> d!164173 (= lt!673408 e!875544)))

(declare-fun res!1073070 () Bool)

(assert (=> d!164173 (=> (not res!1073070) (not e!875544))))

(assert (=> d!164173 (= res!1073070 (is-Cons!36751 lt!673384))))

(assert (=> d!164173 (= (contains!10429 lt!673384 (tuple2!25373 key1!37 v1!32)) lt!673408)))

(declare-fun b!1570473 () Bool)

(declare-fun e!875543 () Bool)

(assert (=> b!1570473 (= e!875544 e!875543)))

(declare-fun res!1073069 () Bool)

(assert (=> b!1570473 (=> res!1073069 e!875543)))

(assert (=> b!1570473 (= res!1073069 (= (h!38198 lt!673384) (tuple2!25373 key1!37 v1!32)))))

(declare-fun b!1570474 () Bool)

(assert (=> b!1570474 (= e!875543 (contains!10429 (t!51663 lt!673384) (tuple2!25373 key1!37 v1!32)))))

(assert (= (and d!164173 res!1073070) b!1570473))

(assert (= (and b!1570473 (not res!1073069)) b!1570474))

(declare-fun m!1444485 () Bool)

(assert (=> d!164173 m!1444485))

(declare-fun m!1444487 () Bool)

(assert (=> d!164173 m!1444487))

(declare-fun m!1444489 () Bool)

(assert (=> b!1570474 m!1444489))

(assert (=> b!1570242 d!164173))

(declare-fun d!164177 () Bool)

(declare-fun res!1073071 () Bool)

(declare-fun e!875545 () Bool)

(assert (=> d!164177 (=> res!1073071 e!875545)))

(assert (=> d!164177 (= res!1073071 (and (is-Cons!36751 lt!673375) (= (_1!12697 (h!38198 lt!673375)) key1!37)))))

(assert (=> d!164177 (= (containsKey!869 lt!673375 key1!37) e!875545)))

(declare-fun b!1570475 () Bool)

(declare-fun e!875546 () Bool)

(assert (=> b!1570475 (= e!875545 e!875546)))

(declare-fun res!1073072 () Bool)

(assert (=> b!1570475 (=> (not res!1073072) (not e!875546))))

(assert (=> b!1570475 (= res!1073072 (and (or (not (is-Cons!36751 lt!673375)) (bvsle (_1!12697 (h!38198 lt!673375)) key1!37)) (is-Cons!36751 lt!673375) (bvslt (_1!12697 (h!38198 lt!673375)) key1!37)))))

(declare-fun b!1570476 () Bool)

(assert (=> b!1570476 (= e!875546 (containsKey!869 (t!51663 lt!673375) key1!37))))

(assert (= (and d!164177 (not res!1073071)) b!1570475))

(assert (= (and b!1570475 res!1073072) b!1570476))

(declare-fun m!1444491 () Bool)

(assert (=> b!1570476 m!1444491))

(assert (=> b!1570145 d!164177))

(declare-fun d!164179 () Bool)

(assert (=> d!164179 (= ($colon$colon!1000 e!875341 (ite c!144899 (h!38198 (t!51663 l!750)) (tuple2!25373 key2!21 v2!10))) (Cons!36751 (ite c!144899 (h!38198 (t!51663 l!750)) (tuple2!25373 key2!21 v2!10)) e!875341))))

(assert (=> bm!72192 d!164179))

(declare-fun d!164181 () Bool)

(declare-fun res!1073073 () Bool)

(declare-fun e!875547 () Bool)

(assert (=> d!164181 (=> res!1073073 e!875547)))

(assert (=> d!164181 (= res!1073073 (and (is-Cons!36751 lt!673384) (= (_1!12697 (h!38198 lt!673384)) key1!37)))))

(assert (=> d!164181 (= (containsKey!869 lt!673384 key1!37) e!875547)))

(declare-fun b!1570477 () Bool)

(declare-fun e!875548 () Bool)

(assert (=> b!1570477 (= e!875547 e!875548)))

(declare-fun res!1073074 () Bool)

(assert (=> b!1570477 (=> (not res!1073074) (not e!875548))))

(assert (=> b!1570477 (= res!1073074 (and (or (not (is-Cons!36751 lt!673384)) (bvsle (_1!12697 (h!38198 lt!673384)) key1!37)) (is-Cons!36751 lt!673384) (bvslt (_1!12697 (h!38198 lt!673384)) key1!37)))))

(declare-fun b!1570478 () Bool)

(assert (=> b!1570478 (= e!875548 (containsKey!869 (t!51663 lt!673384) key1!37))))

(assert (= (and d!164181 (not res!1073073)) b!1570477))

(assert (= (and b!1570477 res!1073074) b!1570478))

(declare-fun m!1444493 () Bool)

(assert (=> b!1570478 m!1444493))

(assert (=> b!1570241 d!164181))

(assert (=> b!1570144 d!164029))

(declare-fun d!164183 () Bool)

(assert (=> d!164183 (= (insertStrictlySorted!596 (insertStrictlySorted!596 (t!51663 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!596 (insertStrictlySorted!596 (t!51663 l!750) key2!21 v2!10) key1!37 v1!32))))

(assert (=> d!164183 true))

(declare-fun _$5!167 () Unit!52096)

(assert (=> d!164183 (= (choose!2085 (t!51663 l!750) key1!37 v1!32 key2!21 v2!10) _$5!167)))

(declare-fun bs!45231 () Bool)

(assert (= bs!45231 d!164183))

(assert (=> bs!45231 m!1443941))

(assert (=> bs!45231 m!1443941))

(assert (=> bs!45231 m!1443943))

(assert (=> bs!45231 m!1443939))

(assert (=> bs!45231 m!1443939))

(assert (=> bs!45231 m!1443955))

(assert (=> d!163985 d!164183))

(assert (=> d!163985 d!164015))

(assert (=> d!163985 d!164021))

(assert (=> d!163985 d!164025))

(assert (=> d!163985 d!164029))

(declare-fun b!1570487 () Bool)

(declare-fun c!144952 () Bool)

(assert (=> b!1570487 (= c!144952 (and (is-Cons!36751 (t!51663 (t!51663 l!750))) (bvsgt (_1!12697 (h!38198 (t!51663 (t!51663 l!750)))) key2!21)))))

(declare-fun e!875557 () List!36755)

(declare-fun e!875560 () List!36755)

(assert (=> b!1570487 (= e!875557 e!875560)))

(declare-fun d!164185 () Bool)

(declare-fun e!875561 () Bool)

(assert (=> d!164185 e!875561))

(declare-fun res!1073084 () Bool)

(assert (=> d!164185 (=> (not res!1073084) (not e!875561))))

(declare-fun lt!673412 () List!36755)

(assert (=> d!164185 (= res!1073084 (isStrictlySorted!1019 lt!673412))))

(declare-fun e!875558 () List!36755)

(assert (=> d!164185 (= lt!673412 e!875558)))

(declare-fun c!144955 () Bool)

(assert (=> d!164185 (= c!144955 (and (is-Cons!36751 (t!51663 (t!51663 l!750))) (bvslt (_1!12697 (h!38198 (t!51663 (t!51663 l!750)))) key2!21)))))

(assert (=> d!164185 (isStrictlySorted!1019 (t!51663 (t!51663 l!750)))))

(assert (=> d!164185 (= (insertStrictlySorted!596 (t!51663 (t!51663 l!750)) key2!21 v2!10) lt!673412)))

(declare-fun call!72239 () List!36755)

(declare-fun e!875559 () List!36755)

(declare-fun bm!72234 () Bool)

(assert (=> bm!72234 (= call!72239 ($colon$colon!1000 e!875559 (ite c!144955 (h!38198 (t!51663 (t!51663 l!750))) (tuple2!25373 key2!21 v2!10))))))

(declare-fun c!144953 () Bool)

(assert (=> bm!72234 (= c!144953 c!144955)))

(declare-fun b!1570488 () Bool)

(assert (=> b!1570488 (= e!875559 (insertStrictlySorted!596 (t!51663 (t!51663 (t!51663 l!750))) key2!21 v2!10))))

(declare-fun bm!72235 () Bool)

(declare-fun call!72238 () List!36755)

(declare-fun call!72237 () List!36755)

(assert (=> bm!72235 (= call!72238 call!72237)))

(declare-fun b!1570489 () Bool)

(declare-fun res!1073082 () Bool)

(assert (=> b!1570489 (=> (not res!1073082) (not e!875561))))

(assert (=> b!1570489 (= res!1073082 (containsKey!869 lt!673412 key2!21))))

(declare-fun bm!72236 () Bool)

(assert (=> bm!72236 (= call!72237 call!72239)))

(declare-fun b!1570490 () Bool)

(assert (=> b!1570490 (= e!875561 (contains!10429 lt!673412 (tuple2!25373 key2!21 v2!10)))))

(declare-fun b!1570491 () Bool)

(assert (=> b!1570491 (= e!875560 call!72238)))

(declare-fun b!1570492 () Bool)

(assert (=> b!1570492 (= e!875558 e!875557)))

(declare-fun c!144954 () Bool)

(assert (=> b!1570492 (= c!144954 (and (is-Cons!36751 (t!51663 (t!51663 l!750))) (= (_1!12697 (h!38198 (t!51663 (t!51663 l!750)))) key2!21)))))

(declare-fun b!1570493 () Bool)

(assert (=> b!1570493 (= e!875557 call!72237)))

(declare-fun b!1570494 () Bool)

(assert (=> b!1570494 (= e!875559 (ite c!144954 (t!51663 (t!51663 (t!51663 l!750))) (ite c!144952 (Cons!36751 (h!38198 (t!51663 (t!51663 l!750))) (t!51663 (t!51663 (t!51663 l!750)))) Nil!36752)))))

(declare-fun b!1570495 () Bool)

(assert (=> b!1570495 (= e!875558 call!72239)))

(declare-fun b!1570496 () Bool)

(assert (=> b!1570496 (= e!875560 call!72238)))

(assert (= (and d!164185 c!144955) b!1570495))

(assert (= (and d!164185 (not c!144955)) b!1570492))

(assert (= (and b!1570492 c!144954) b!1570493))

(assert (= (and b!1570492 (not c!144954)) b!1570487))

(assert (= (and b!1570487 c!144952) b!1570496))

(assert (= (and b!1570487 (not c!144952)) b!1570491))

(assert (= (or b!1570496 b!1570491) bm!72235))

(assert (= (or b!1570493 bm!72235) bm!72236))

(assert (= (or b!1570495 bm!72236) bm!72234))

(assert (= (and bm!72234 c!144953) b!1570488))

(assert (= (and bm!72234 (not c!144953)) b!1570494))

(assert (= (and d!164185 res!1073084) b!1570489))

(assert (= (and b!1570489 res!1073082) b!1570490))

(declare-fun m!1444503 () Bool)

(assert (=> d!164185 m!1444503))

(assert (=> d!164185 m!1444265))

(declare-fun m!1444505 () Bool)

(assert (=> bm!72234 m!1444505))

(declare-fun m!1444507 () Bool)

(assert (=> b!1570490 m!1444507))

(declare-fun m!1444509 () Bool)

(assert (=> b!1570488 m!1444509))

(declare-fun m!1444511 () Bool)

(assert (=> b!1570489 m!1444511))

(assert (=> b!1570194 d!164185))

(assert (=> b!1570270 d!164035))

(declare-fun d!164191 () Bool)

(declare-fun res!1073087 () Bool)

(declare-fun e!875567 () Bool)

(assert (=> d!164191 (=> res!1073087 e!875567)))

(assert (=> d!164191 (= res!1073087 (or (is-Nil!36752 lt!673354) (is-Nil!36752 (t!51663 lt!673354))))))

(assert (=> d!164191 (= (isStrictlySorted!1019 lt!673354) e!875567)))

(declare-fun b!1570507 () Bool)

(declare-fun e!875568 () Bool)

(assert (=> b!1570507 (= e!875567 e!875568)))

(declare-fun res!1073088 () Bool)

(assert (=> b!1570507 (=> (not res!1073088) (not e!875568))))

(assert (=> b!1570507 (= res!1073088 (bvslt (_1!12697 (h!38198 lt!673354)) (_1!12697 (h!38198 (t!51663 lt!673354)))))))

(declare-fun b!1570508 () Bool)

(assert (=> b!1570508 (= e!875568 (isStrictlySorted!1019 (t!51663 lt!673354)))))

(assert (= (and d!164191 (not res!1073087)) b!1570507))

(assert (= (and b!1570507 res!1073088) b!1570508))

(declare-fun m!1444519 () Bool)

(assert (=> b!1570508 m!1444519))

(assert (=> d!163977 d!164191))

(declare-fun d!164193 () Bool)

(declare-fun res!1073089 () Bool)

(declare-fun e!875569 () Bool)

(assert (=> d!164193 (=> res!1073089 e!875569)))

(assert (=> d!164193 (= res!1073089 (or (is-Nil!36752 (insertStrictlySorted!596 l!750 key2!21 v2!10)) (is-Nil!36752 (t!51663 (insertStrictlySorted!596 l!750 key2!21 v2!10)))))))

(assert (=> d!164193 (= (isStrictlySorted!1019 (insertStrictlySorted!596 l!750 key2!21 v2!10)) e!875569)))

(declare-fun b!1570509 () Bool)

(declare-fun e!875570 () Bool)

(assert (=> b!1570509 (= e!875569 e!875570)))

(declare-fun res!1073090 () Bool)

(assert (=> b!1570509 (=> (not res!1073090) (not e!875570))))

(assert (=> b!1570509 (= res!1073090 (bvslt (_1!12697 (h!38198 (insertStrictlySorted!596 l!750 key2!21 v2!10))) (_1!12697 (h!38198 (t!51663 (insertStrictlySorted!596 l!750 key2!21 v2!10))))))))

(declare-fun b!1570510 () Bool)

(assert (=> b!1570510 (= e!875570 (isStrictlySorted!1019 (t!51663 (insertStrictlySorted!596 l!750 key2!21 v2!10))))))

(assert (= (and d!164193 (not res!1073089)) b!1570509))

(assert (= (and b!1570509 res!1073090) b!1570510))

(declare-fun m!1444525 () Bool)

(assert (=> b!1570510 m!1444525))

(assert (=> d!163977 d!164193))

(declare-fun d!164197 () Bool)

(declare-fun lt!673415 () Bool)

(assert (=> d!164197 (= lt!673415 (set.member (tuple2!25373 key1!37 v1!32) (content!820 lt!673354)))))

(declare-fun e!875574 () Bool)

(assert (=> d!164197 (= lt!673415 e!875574)))

(declare-fun res!1073094 () Bool)

(assert (=> d!164197 (=> (not res!1073094) (not e!875574))))

(assert (=> d!164197 (= res!1073094 (is-Cons!36751 lt!673354))))

(assert (=> d!164197 (= (contains!10429 lt!673354 (tuple2!25373 key1!37 v1!32)) lt!673415)))

(declare-fun b!1570513 () Bool)

(declare-fun e!875573 () Bool)

(assert (=> b!1570513 (= e!875574 e!875573)))

(declare-fun res!1073093 () Bool)

(assert (=> b!1570513 (=> res!1073093 e!875573)))

(assert (=> b!1570513 (= res!1073093 (= (h!38198 lt!673354) (tuple2!25373 key1!37 v1!32)))))

(declare-fun b!1570514 () Bool)

(assert (=> b!1570514 (= e!875573 (contains!10429 (t!51663 lt!673354) (tuple2!25373 key1!37 v1!32)))))

(assert (= (and d!164197 res!1073094) b!1570513))

(assert (= (and b!1570513 (not res!1073093)) b!1570514))

(declare-fun m!1444533 () Bool)

(assert (=> d!164197 m!1444533))

(declare-fun m!1444535 () Bool)

(assert (=> d!164197 m!1444535))

(declare-fun m!1444537 () Bool)

(assert (=> b!1570514 m!1444537))

(assert (=> b!1570026 d!164197))

(declare-fun d!164201 () Bool)

(assert (=> d!164201 (= ($colon$colon!1000 e!875316 (ite c!144879 (h!38198 l!750) (tuple2!25373 key1!37 v1!32))) (Cons!36751 (ite c!144879 (h!38198 l!750) (tuple2!25373 key1!37 v1!32)) e!875316))))

(assert (=> bm!72177 d!164201))

(declare-fun d!164205 () Bool)

(declare-fun res!1073099 () Bool)

(declare-fun e!875579 () Bool)

(assert (=> d!164205 (=> res!1073099 e!875579)))

(assert (=> d!164205 (= res!1073099 (and (is-Cons!36751 lt!673354) (= (_1!12697 (h!38198 lt!673354)) key1!37)))))

(assert (=> d!164205 (= (containsKey!869 lt!673354 key1!37) e!875579)))

(declare-fun b!1570519 () Bool)

(declare-fun e!875580 () Bool)

(assert (=> b!1570519 (= e!875579 e!875580)))

(declare-fun res!1073100 () Bool)

(assert (=> b!1570519 (=> (not res!1073100) (not e!875580))))

(assert (=> b!1570519 (= res!1073100 (and (or (not (is-Cons!36751 lt!673354)) (bvsle (_1!12697 (h!38198 lt!673354)) key1!37)) (is-Cons!36751 lt!673354) (bvslt (_1!12697 (h!38198 lt!673354)) key1!37)))))

(declare-fun b!1570520 () Bool)

(assert (=> b!1570520 (= e!875580 (containsKey!869 (t!51663 lt!673354) key1!37))))

(assert (= (and d!164205 (not res!1073099)) b!1570519))

(assert (= (and b!1570519 res!1073100) b!1570520))

(declare-fun m!1444543 () Bool)

(assert (=> b!1570520 m!1444543))

(assert (=> b!1570025 d!164205))

(declare-fun b!1570523 () Bool)

(declare-fun c!144960 () Bool)

(assert (=> b!1570523 (= c!144960 (and (is-Cons!36751 (t!51663 (t!51663 l!750))) (bvsgt (_1!12697 (h!38198 (t!51663 (t!51663 l!750)))) key1!37)))))

(declare-fun e!875583 () List!36755)

(declare-fun e!875586 () List!36755)

(assert (=> b!1570523 (= e!875583 e!875586)))

(declare-fun d!164209 () Bool)

(declare-fun e!875587 () Bool)

(assert (=> d!164209 e!875587))

(declare-fun res!1073104 () Bool)

(assert (=> d!164209 (=> (not res!1073104) (not e!875587))))

(declare-fun lt!673416 () List!36755)

(assert (=> d!164209 (= res!1073104 (isStrictlySorted!1019 lt!673416))))

(declare-fun e!875584 () List!36755)

(assert (=> d!164209 (= lt!673416 e!875584)))

(declare-fun c!144963 () Bool)

(assert (=> d!164209 (= c!144963 (and (is-Cons!36751 (t!51663 (t!51663 l!750))) (bvslt (_1!12697 (h!38198 (t!51663 (t!51663 l!750)))) key1!37)))))

(assert (=> d!164209 (isStrictlySorted!1019 (t!51663 (t!51663 l!750)))))

(assert (=> d!164209 (= (insertStrictlySorted!596 (t!51663 (t!51663 l!750)) key1!37 v1!32) lt!673416)))

(declare-fun bm!72240 () Bool)

(declare-fun e!875585 () List!36755)

(declare-fun call!72245 () List!36755)

(assert (=> bm!72240 (= call!72245 ($colon$colon!1000 e!875585 (ite c!144963 (h!38198 (t!51663 (t!51663 l!750))) (tuple2!25373 key1!37 v1!32))))))

(declare-fun c!144961 () Bool)

(assert (=> bm!72240 (= c!144961 c!144963)))

(declare-fun b!1570524 () Bool)

(assert (=> b!1570524 (= e!875585 (insertStrictlySorted!596 (t!51663 (t!51663 (t!51663 l!750))) key1!37 v1!32))))

(declare-fun bm!72241 () Bool)

(declare-fun call!72244 () List!36755)

(declare-fun call!72243 () List!36755)

(assert (=> bm!72241 (= call!72244 call!72243)))

(declare-fun b!1570525 () Bool)

(declare-fun res!1073103 () Bool)

(assert (=> b!1570525 (=> (not res!1073103) (not e!875587))))

(assert (=> b!1570525 (= res!1073103 (containsKey!869 lt!673416 key1!37))))

(declare-fun bm!72242 () Bool)

(assert (=> bm!72242 (= call!72243 call!72245)))

(declare-fun b!1570526 () Bool)

(assert (=> b!1570526 (= e!875587 (contains!10429 lt!673416 (tuple2!25373 key1!37 v1!32)))))

(declare-fun b!1570527 () Bool)

(assert (=> b!1570527 (= e!875586 call!72244)))

(declare-fun b!1570528 () Bool)

(assert (=> b!1570528 (= e!875584 e!875583)))

(declare-fun c!144962 () Bool)

(assert (=> b!1570528 (= c!144962 (and (is-Cons!36751 (t!51663 (t!51663 l!750))) (= (_1!12697 (h!38198 (t!51663 (t!51663 l!750)))) key1!37)))))

(declare-fun b!1570529 () Bool)

(assert (=> b!1570529 (= e!875583 call!72243)))

(declare-fun b!1570530 () Bool)

(assert (=> b!1570530 (= e!875585 (ite c!144962 (t!51663 (t!51663 (t!51663 l!750))) (ite c!144960 (Cons!36751 (h!38198 (t!51663 (t!51663 l!750))) (t!51663 (t!51663 (t!51663 l!750)))) Nil!36752)))))

(declare-fun b!1570531 () Bool)

(assert (=> b!1570531 (= e!875584 call!72245)))

(declare-fun b!1570532 () Bool)

(assert (=> b!1570532 (= e!875586 call!72244)))

(assert (= (and d!164209 c!144963) b!1570531))

(assert (= (and d!164209 (not c!144963)) b!1570528))

(assert (= (and b!1570528 c!144962) b!1570529))

(assert (= (and b!1570528 (not c!144962)) b!1570523))

(assert (= (and b!1570523 c!144960) b!1570532))

(assert (= (and b!1570523 (not c!144960)) b!1570527))

(assert (= (or b!1570532 b!1570527) bm!72241))

(assert (= (or b!1570529 bm!72241) bm!72242))

(assert (= (or b!1570531 bm!72242) bm!72240))

(assert (= (and bm!72240 c!144961) b!1570524))

(assert (= (and bm!72240 (not c!144961)) b!1570530))

(assert (= (and d!164209 res!1073104) b!1570525))

(assert (= (and b!1570525 res!1073103) b!1570526))

(declare-fun m!1444549 () Bool)

(assert (=> d!164209 m!1444549))

(assert (=> d!164209 m!1444265))

(declare-fun m!1444551 () Bool)

(assert (=> bm!72240 m!1444551))

(declare-fun m!1444553 () Bool)

(assert (=> b!1570526 m!1444553))

(declare-fun m!1444555 () Bool)

(assert (=> b!1570524 m!1444555))

(declare-fun m!1444557 () Bool)

(assert (=> b!1570525 m!1444557))

(assert (=> b!1570240 d!164209))

(declare-fun d!164215 () Bool)

(assert (=> d!164215 (= ($colon$colon!1000 e!875367 (ite c!144915 (h!38198 (t!51663 l!750)) (tuple2!25373 key1!37 v1!32))) (Cons!36751 (ite c!144915 (h!38198 (t!51663 l!750)) (tuple2!25373 key1!37 v1!32)) e!875367))))

(assert (=> bm!72204 d!164215))

(declare-fun d!164217 () Bool)

(declare-fun res!1073109 () Bool)

(declare-fun e!875595 () Bool)

(assert (=> d!164217 (=> res!1073109 e!875595)))

(assert (=> d!164217 (= res!1073109 (or (is-Nil!36752 lt!673369) (is-Nil!36752 (t!51663 lt!673369))))))

(assert (=> d!164217 (= (isStrictlySorted!1019 lt!673369) e!875595)))

(declare-fun b!1570545 () Bool)

(declare-fun e!875596 () Bool)

(assert (=> b!1570545 (= e!875595 e!875596)))

(declare-fun res!1073110 () Bool)

(assert (=> b!1570545 (=> (not res!1073110) (not e!875596))))

(assert (=> b!1570545 (= res!1073110 (bvslt (_1!12697 (h!38198 lt!673369)) (_1!12697 (h!38198 (t!51663 lt!673369)))))))

(declare-fun b!1570546 () Bool)

(assert (=> b!1570546 (= e!875596 (isStrictlySorted!1019 (t!51663 lt!673369)))))

(assert (= (and d!164217 (not res!1073109)) b!1570545))

(assert (= (and b!1570545 res!1073110) b!1570546))

(declare-fun m!1444565 () Bool)

(assert (=> b!1570546 m!1444565))

(assert (=> d!163997 d!164217))

(declare-fun d!164219 () Bool)

(declare-fun res!1073111 () Bool)

(declare-fun e!875597 () Bool)

(assert (=> d!164219 (=> res!1073111 e!875597)))

(assert (=> d!164219 (= res!1073111 (or (is-Nil!36752 (insertStrictlySorted!596 l!750 key1!37 v1!32)) (is-Nil!36752 (t!51663 (insertStrictlySorted!596 l!750 key1!37 v1!32)))))))

(assert (=> d!164219 (= (isStrictlySorted!1019 (insertStrictlySorted!596 l!750 key1!37 v1!32)) e!875597)))

(declare-fun b!1570547 () Bool)

(declare-fun e!875598 () Bool)

(assert (=> b!1570547 (= e!875597 e!875598)))

(declare-fun res!1073112 () Bool)

(assert (=> b!1570547 (=> (not res!1073112) (not e!875598))))

(assert (=> b!1570547 (= res!1073112 (bvslt (_1!12697 (h!38198 (insertStrictlySorted!596 l!750 key1!37 v1!32))) (_1!12697 (h!38198 (t!51663 (insertStrictlySorted!596 l!750 key1!37 v1!32))))))))

(declare-fun b!1570548 () Bool)

(assert (=> b!1570548 (= e!875598 (isStrictlySorted!1019 (t!51663 (insertStrictlySorted!596 l!750 key1!37 v1!32))))))

(assert (= (and d!164219 (not res!1073111)) b!1570547))

(assert (= (and b!1570547 res!1073112) b!1570548))

(declare-fun m!1444571 () Bool)

(assert (=> b!1570548 m!1444571))

(assert (=> d!163997 d!164219))

(declare-fun lt!673419 () Bool)

(declare-fun d!164223 () Bool)

(assert (=> d!164223 (= lt!673419 (set.member (tuple2!25373 key2!21 v2!10) (content!820 lt!673369)))))

(declare-fun e!875602 () Bool)

(assert (=> d!164223 (= lt!673419 e!875602)))

(declare-fun res!1073116 () Bool)

(assert (=> d!164223 (=> (not res!1073116) (not e!875602))))

(assert (=> d!164223 (= res!1073116 (is-Cons!36751 lt!673369))))

(assert (=> d!164223 (= (contains!10429 lt!673369 (tuple2!25373 key2!21 v2!10)) lt!673419)))

(declare-fun b!1570551 () Bool)

(declare-fun e!875601 () Bool)

(assert (=> b!1570551 (= e!875602 e!875601)))

(declare-fun res!1073115 () Bool)

(assert (=> b!1570551 (=> res!1073115 e!875601)))

(assert (=> b!1570551 (= res!1073115 (= (h!38198 lt!673369) (tuple2!25373 key2!21 v2!10)))))

(declare-fun b!1570552 () Bool)

(assert (=> b!1570552 (= e!875601 (contains!10429 (t!51663 lt!673369) (tuple2!25373 key2!21 v2!10)))))

(assert (= (and d!164223 res!1073116) b!1570551))

(assert (= (and b!1570551 (not res!1073115)) b!1570552))

(declare-fun m!1444579 () Bool)

(assert (=> d!164223 m!1444579))

(declare-fun m!1444581 () Bool)

(assert (=> d!164223 m!1444581))

(declare-fun m!1444583 () Bool)

(assert (=> b!1570552 m!1444583))

(assert (=> b!1570086 d!164223))

(declare-fun d!164229 () Bool)

(declare-fun res!1073117 () Bool)

(declare-fun e!875603 () Bool)

(assert (=> d!164229 (=> res!1073117 e!875603)))

(assert (=> d!164229 (= res!1073117 (and (is-Cons!36751 lt!673369) (= (_1!12697 (h!38198 lt!673369)) key2!21)))))

(assert (=> d!164229 (= (containsKey!869 lt!673369 key2!21) e!875603)))

(declare-fun b!1570553 () Bool)

(declare-fun e!875604 () Bool)

(assert (=> b!1570553 (= e!875603 e!875604)))

(declare-fun res!1073118 () Bool)

(assert (=> b!1570553 (=> (not res!1073118) (not e!875604))))

(assert (=> b!1570553 (= res!1073118 (and (or (not (is-Cons!36751 lt!673369)) (bvsle (_1!12697 (h!38198 lt!673369)) key2!21)) (is-Cons!36751 lt!673369) (bvslt (_1!12697 (h!38198 lt!673369)) key2!21)))))

(declare-fun b!1570554 () Bool)

(assert (=> b!1570554 (= e!875604 (containsKey!869 (t!51663 lt!673369) key2!21))))

(assert (= (and d!164229 (not res!1073117)) b!1570553))

(assert (= (and b!1570553 res!1073118) b!1570554))

(declare-fun m!1444585 () Bool)

(assert (=> b!1570554 m!1444585))

(assert (=> b!1570085 d!164229))

(declare-fun d!164233 () Bool)

(declare-fun lt!673420 () Bool)

(assert (=> d!164233 (= lt!673420 (set.member (tuple2!25373 key2!21 v2!10) (content!820 lt!673372)))))

(declare-fun e!875608 () Bool)

(assert (=> d!164233 (= lt!673420 e!875608)))

(declare-fun res!1073122 () Bool)

(assert (=> d!164233 (=> (not res!1073122) (not e!875608))))

(assert (=> d!164233 (= res!1073122 (is-Cons!36751 lt!673372))))

(assert (=> d!164233 (= (contains!10429 lt!673372 (tuple2!25373 key2!21 v2!10)) lt!673420)))

(declare-fun b!1570557 () Bool)

(declare-fun e!875607 () Bool)

(assert (=> b!1570557 (= e!875608 e!875607)))

(declare-fun res!1073121 () Bool)

(assert (=> b!1570557 (=> res!1073121 e!875607)))

(assert (=> b!1570557 (= res!1073121 (= (h!38198 lt!673372) (tuple2!25373 key2!21 v2!10)))))

(declare-fun b!1570558 () Bool)

(assert (=> b!1570558 (= e!875607 (contains!10429 (t!51663 lt!673372) (tuple2!25373 key2!21 v2!10)))))

(assert (= (and d!164233 res!1073122) b!1570557))

(assert (= (and b!1570557 (not res!1073121)) b!1570558))

(declare-fun m!1444589 () Bool)

(assert (=> d!164233 m!1444589))

(declare-fun m!1444591 () Bool)

(assert (=> d!164233 m!1444591))

(declare-fun m!1444593 () Bool)

(assert (=> b!1570558 m!1444593))

(assert (=> b!1570116 d!164233))

(declare-fun c!144972 () Bool)

(declare-fun b!1570569 () Bool)

(assert (=> b!1570569 (= c!144972 (and (is-Cons!36751 (t!51663 (insertStrictlySorted!596 l!750 key2!21 v2!10))) (bvsgt (_1!12697 (h!38198 (t!51663 (insertStrictlySorted!596 l!750 key2!21 v2!10)))) key1!37)))))

(declare-fun e!875614 () List!36755)

(declare-fun e!875617 () List!36755)

(assert (=> b!1570569 (= e!875614 e!875617)))

(declare-fun d!164239 () Bool)

(declare-fun e!875618 () Bool)

(assert (=> d!164239 e!875618))

(declare-fun res!1073126 () Bool)

(assert (=> d!164239 (=> (not res!1073126) (not e!875618))))

(declare-fun lt!673422 () List!36755)

(assert (=> d!164239 (= res!1073126 (isStrictlySorted!1019 lt!673422))))

(declare-fun e!875615 () List!36755)

(assert (=> d!164239 (= lt!673422 e!875615)))

(declare-fun c!144975 () Bool)

(assert (=> d!164239 (= c!144975 (and (is-Cons!36751 (t!51663 (insertStrictlySorted!596 l!750 key2!21 v2!10))) (bvslt (_1!12697 (h!38198 (t!51663 (insertStrictlySorted!596 l!750 key2!21 v2!10)))) key1!37)))))

(assert (=> d!164239 (isStrictlySorted!1019 (t!51663 (insertStrictlySorted!596 l!750 key2!21 v2!10)))))

(assert (=> d!164239 (= (insertStrictlySorted!596 (t!51663 (insertStrictlySorted!596 l!750 key2!21 v2!10)) key1!37 v1!32) lt!673422)))

(declare-fun e!875616 () List!36755)

(declare-fun bm!72249 () Bool)

(declare-fun call!72254 () List!36755)

(assert (=> bm!72249 (= call!72254 ($colon$colon!1000 e!875616 (ite c!144975 (h!38198 (t!51663 (insertStrictlySorted!596 l!750 key2!21 v2!10))) (tuple2!25373 key1!37 v1!32))))))

(declare-fun c!144973 () Bool)

(assert (=> bm!72249 (= c!144973 c!144975)))

(declare-fun b!1570570 () Bool)

(assert (=> b!1570570 (= e!875616 (insertStrictlySorted!596 (t!51663 (t!51663 (insertStrictlySorted!596 l!750 key2!21 v2!10))) key1!37 v1!32))))

(declare-fun bm!72250 () Bool)

(declare-fun call!72253 () List!36755)

(declare-fun call!72252 () List!36755)

(assert (=> bm!72250 (= call!72253 call!72252)))

(declare-fun b!1570571 () Bool)

(declare-fun res!1073125 () Bool)

(assert (=> b!1570571 (=> (not res!1073125) (not e!875618))))

(assert (=> b!1570571 (= res!1073125 (containsKey!869 lt!673422 key1!37))))

(declare-fun bm!72251 () Bool)

(assert (=> bm!72251 (= call!72252 call!72254)))

(declare-fun b!1570572 () Bool)

(assert (=> b!1570572 (= e!875618 (contains!10429 lt!673422 (tuple2!25373 key1!37 v1!32)))))

(declare-fun b!1570573 () Bool)

(assert (=> b!1570573 (= e!875617 call!72253)))

(declare-fun b!1570574 () Bool)

(assert (=> b!1570574 (= e!875615 e!875614)))

(declare-fun c!144974 () Bool)

(assert (=> b!1570574 (= c!144974 (and (is-Cons!36751 (t!51663 (insertStrictlySorted!596 l!750 key2!21 v2!10))) (= (_1!12697 (h!38198 (t!51663 (insertStrictlySorted!596 l!750 key2!21 v2!10)))) key1!37)))))

(declare-fun b!1570575 () Bool)

(assert (=> b!1570575 (= e!875614 call!72252)))

(declare-fun b!1570576 () Bool)

(assert (=> b!1570576 (= e!875616 (ite c!144974 (t!51663 (t!51663 (insertStrictlySorted!596 l!750 key2!21 v2!10))) (ite c!144972 (Cons!36751 (h!38198 (t!51663 (insertStrictlySorted!596 l!750 key2!21 v2!10))) (t!51663 (t!51663 (insertStrictlySorted!596 l!750 key2!21 v2!10)))) Nil!36752)))))

(declare-fun b!1570577 () Bool)

(assert (=> b!1570577 (= e!875615 call!72254)))

(declare-fun b!1570578 () Bool)

(assert (=> b!1570578 (= e!875617 call!72253)))

(assert (= (and d!164239 c!144975) b!1570577))

(assert (= (and d!164239 (not c!144975)) b!1570574))

(assert (= (and b!1570574 c!144974) b!1570575))

(assert (= (and b!1570574 (not c!144974)) b!1570569))

(assert (= (and b!1570569 c!144972) b!1570578))

(assert (= (and b!1570569 (not c!144972)) b!1570573))

(assert (= (or b!1570578 b!1570573) bm!72250))

(assert (= (or b!1570575 bm!72250) bm!72251))

(assert (= (or b!1570577 bm!72251) bm!72249))

(assert (= (and bm!72249 c!144973) b!1570570))

(assert (= (and bm!72249 (not c!144973)) b!1570576))

(assert (= (and d!164239 res!1073126) b!1570571))

(assert (= (and b!1570571 res!1073125) b!1570572))

(declare-fun m!1444607 () Bool)

(assert (=> d!164239 m!1444607))

(assert (=> d!164239 m!1444525))

(declare-fun m!1444609 () Bool)

(assert (=> bm!72249 m!1444609))

(declare-fun m!1444611 () Bool)

(assert (=> b!1570572 m!1444611))

(declare-fun m!1444613 () Bool)

(assert (=> b!1570570 m!1444613))

(declare-fun m!1444615 () Bool)

(assert (=> b!1570571 m!1444615))

(assert (=> b!1570024 d!164239))

(declare-fun lt!673423 () Bool)

(declare-fun d!164243 () Bool)

(assert (=> d!164243 (= lt!673423 (set.member (tuple2!25373 key1!37 v1!32) (content!820 lt!673382)))))

(declare-fun e!875622 () Bool)

(assert (=> d!164243 (= lt!673423 e!875622)))

(declare-fun res!1073130 () Bool)

(assert (=> d!164243 (=> (not res!1073130) (not e!875622))))

(assert (=> d!164243 (= res!1073130 (is-Cons!36751 lt!673382))))

(assert (=> d!164243 (= (contains!10429 lt!673382 (tuple2!25373 key1!37 v1!32)) lt!673423)))

(declare-fun b!1570581 () Bool)

(declare-fun e!875621 () Bool)

(assert (=> b!1570581 (= e!875622 e!875621)))

(declare-fun res!1073129 () Bool)

(assert (=> b!1570581 (=> res!1073129 e!875621)))

(assert (=> b!1570581 (= res!1073129 (= (h!38198 lt!673382) (tuple2!25373 key1!37 v1!32)))))

(declare-fun b!1570582 () Bool)

(assert (=> b!1570582 (= e!875621 (contains!10429 (t!51663 lt!673382) (tuple2!25373 key1!37 v1!32)))))

(assert (= (and d!164243 res!1073130) b!1570581))

(assert (= (and b!1570581 (not res!1073129)) b!1570582))

(declare-fun m!1444619 () Bool)

(assert (=> d!164243 m!1444619))

(declare-fun m!1444621 () Bool)

(assert (=> d!164243 m!1444621))

(declare-fun m!1444623 () Bool)

(assert (=> b!1570582 m!1444623))

(assert (=> b!1570220 d!164243))

(declare-fun d!164249 () Bool)

(assert (=> d!164249 (= ($colon$colon!1000 e!875256 (ite c!144831 (h!38198 (insertStrictlySorted!596 l!750 key2!21 v2!10)) (tuple2!25373 key1!37 v1!32))) (Cons!36751 (ite c!144831 (h!38198 (insertStrictlySorted!596 l!750 key2!21 v2!10)) (tuple2!25373 key1!37 v1!32)) e!875256))))

(assert (=> bm!72141 d!164249))

(declare-fun d!164251 () Bool)

(declare-fun res!1073133 () Bool)

(declare-fun e!875625 () Bool)

(assert (=> d!164251 (=> res!1073133 e!875625)))

(assert (=> d!164251 (= res!1073133 (or (is-Nil!36752 lt!673372) (is-Nil!36752 (t!51663 lt!673372))))))

(assert (=> d!164251 (= (isStrictlySorted!1019 lt!673372) e!875625)))

(declare-fun b!1570585 () Bool)

(declare-fun e!875626 () Bool)

(assert (=> b!1570585 (= e!875625 e!875626)))

(declare-fun res!1073134 () Bool)

(assert (=> b!1570585 (=> (not res!1073134) (not e!875626))))

(assert (=> b!1570585 (= res!1073134 (bvslt (_1!12697 (h!38198 lt!673372)) (_1!12697 (h!38198 (t!51663 lt!673372)))))))

(declare-fun b!1570586 () Bool)

(assert (=> b!1570586 (= e!875626 (isStrictlySorted!1019 (t!51663 lt!673372)))))

(assert (= (and d!164251 (not res!1073133)) b!1570585))

(assert (= (and b!1570585 res!1073134) b!1570586))

(declare-fun m!1444627 () Bool)

(assert (=> b!1570586 m!1444627))

(assert (=> d!164003 d!164251))

(assert (=> d!164003 d!164037))

(declare-fun lt!673424 () Bool)

(declare-fun d!164255 () Bool)

(assert (=> d!164255 (= lt!673424 (set.member (tuple2!25373 key2!21 v2!10) (content!820 lt!673378)))))

(declare-fun e!875630 () Bool)

(assert (=> d!164255 (= lt!673424 e!875630)))

(declare-fun res!1073138 () Bool)

(assert (=> d!164255 (=> (not res!1073138) (not e!875630))))

(assert (=> d!164255 (= res!1073138 (is-Cons!36751 lt!673378))))

(assert (=> d!164255 (= (contains!10429 lt!673378 (tuple2!25373 key2!21 v2!10)) lt!673424)))

(declare-fun b!1570589 () Bool)

(declare-fun e!875629 () Bool)

(assert (=> b!1570589 (= e!875630 e!875629)))

(declare-fun res!1073137 () Bool)

(assert (=> b!1570589 (=> res!1073137 e!875629)))

(assert (=> b!1570589 (= res!1073137 (= (h!38198 lt!673378) (tuple2!25373 key2!21 v2!10)))))

(declare-fun b!1570590 () Bool)

(assert (=> b!1570590 (= e!875629 (contains!10429 (t!51663 lt!673378) (tuple2!25373 key2!21 v2!10)))))

(assert (= (and d!164255 res!1073138) b!1570589))

(assert (= (and b!1570589 (not res!1073137)) b!1570590))

(declare-fun m!1444629 () Bool)

(assert (=> d!164255 m!1444629))

(declare-fun m!1444633 () Bool)

(assert (=> d!164255 m!1444633))

(declare-fun m!1444635 () Bool)

(assert (=> b!1570590 m!1444635))

(assert (=> b!1570176 d!164255))

(declare-fun d!164261 () Bool)

(assert (=> d!164261 (= ($colon$colon!1000 e!875286 (ite c!144855 (h!38198 (insertStrictlySorted!596 l!750 key1!37 v1!32)) (tuple2!25373 key2!21 v2!10))) (Cons!36751 (ite c!144855 (h!38198 (insertStrictlySorted!596 l!750 key1!37 v1!32)) (tuple2!25373 key2!21 v2!10)) e!875286))))

(assert (=> bm!72159 d!164261))

(declare-fun d!164263 () Bool)

(declare-fun res!1073143 () Bool)

(declare-fun e!875635 () Bool)

(assert (=> d!164263 (=> res!1073143 e!875635)))

(assert (=> d!164263 (= res!1073143 (and (is-Cons!36751 lt!673378) (= (_1!12697 (h!38198 lt!673378)) key2!21)))))

(assert (=> d!164263 (= (containsKey!869 lt!673378 key2!21) e!875635)))

(declare-fun b!1570595 () Bool)

(declare-fun e!875636 () Bool)

(assert (=> b!1570595 (= e!875635 e!875636)))

(declare-fun res!1073144 () Bool)

(assert (=> b!1570595 (=> (not res!1073144) (not e!875636))))

(assert (=> b!1570595 (= res!1073144 (and (or (not (is-Cons!36751 lt!673378)) (bvsle (_1!12697 (h!38198 lt!673378)) key2!21)) (is-Cons!36751 lt!673378) (bvslt (_1!12697 (h!38198 lt!673378)) key2!21)))))

(declare-fun b!1570596 () Bool)

(assert (=> b!1570596 (= e!875636 (containsKey!869 (t!51663 lt!673378) key2!21))))

(assert (= (and d!164263 (not res!1073143)) b!1570595))

(assert (= (and b!1570595 res!1073144) b!1570596))

(declare-fun m!1444643 () Bool)

(assert (=> b!1570596 m!1444643))

(assert (=> b!1570175 d!164263))

(declare-fun b!1570607 () Bool)

(declare-fun c!144980 () Bool)

(assert (=> b!1570607 (= c!144980 (and (is-Cons!36751 (t!51663 (insertStrictlySorted!596 l!750 key1!37 v1!32))) (bvsgt (_1!12697 (h!38198 (t!51663 (insertStrictlySorted!596 l!750 key1!37 v1!32)))) key2!21)))))

(declare-fun e!875642 () List!36755)

(declare-fun e!875645 () List!36755)

(assert (=> b!1570607 (= e!875642 e!875645)))

(declare-fun d!164267 () Bool)

(declare-fun e!875646 () Bool)

(assert (=> d!164267 e!875646))

(declare-fun res!1073148 () Bool)

(assert (=> d!164267 (=> (not res!1073148) (not e!875646))))

(declare-fun lt!673427 () List!36755)

(assert (=> d!164267 (= res!1073148 (isStrictlySorted!1019 lt!673427))))

(declare-fun e!875643 () List!36755)

(assert (=> d!164267 (= lt!673427 e!875643)))

(declare-fun c!144983 () Bool)

(assert (=> d!164267 (= c!144983 (and (is-Cons!36751 (t!51663 (insertStrictlySorted!596 l!750 key1!37 v1!32))) (bvslt (_1!12697 (h!38198 (t!51663 (insertStrictlySorted!596 l!750 key1!37 v1!32)))) key2!21)))))

(assert (=> d!164267 (isStrictlySorted!1019 (t!51663 (insertStrictlySorted!596 l!750 key1!37 v1!32)))))

(assert (=> d!164267 (= (insertStrictlySorted!596 (t!51663 (insertStrictlySorted!596 l!750 key1!37 v1!32)) key2!21 v2!10) lt!673427)))

(declare-fun bm!72255 () Bool)

(declare-fun e!875644 () List!36755)

(declare-fun call!72260 () List!36755)

(assert (=> bm!72255 (= call!72260 ($colon$colon!1000 e!875644 (ite c!144983 (h!38198 (t!51663 (insertStrictlySorted!596 l!750 key1!37 v1!32))) (tuple2!25373 key2!21 v2!10))))))

(declare-fun c!144981 () Bool)

(assert (=> bm!72255 (= c!144981 c!144983)))

(declare-fun b!1570608 () Bool)

(assert (=> b!1570608 (= e!875644 (insertStrictlySorted!596 (t!51663 (t!51663 (insertStrictlySorted!596 l!750 key1!37 v1!32))) key2!21 v2!10))))

(declare-fun bm!72256 () Bool)

(declare-fun call!72259 () List!36755)

(declare-fun call!72258 () List!36755)

(assert (=> bm!72256 (= call!72259 call!72258)))

(declare-fun b!1570609 () Bool)

(declare-fun res!1073147 () Bool)

(assert (=> b!1570609 (=> (not res!1073147) (not e!875646))))

(assert (=> b!1570609 (= res!1073147 (containsKey!869 lt!673427 key2!21))))

(declare-fun bm!72257 () Bool)

(assert (=> bm!72257 (= call!72258 call!72260)))

(declare-fun b!1570610 () Bool)

(assert (=> b!1570610 (= e!875646 (contains!10429 lt!673427 (tuple2!25373 key2!21 v2!10)))))

(declare-fun b!1570611 () Bool)

(assert (=> b!1570611 (= e!875645 call!72259)))

(declare-fun b!1570612 () Bool)

(assert (=> b!1570612 (= e!875643 e!875642)))

(declare-fun c!144982 () Bool)

(assert (=> b!1570612 (= c!144982 (and (is-Cons!36751 (t!51663 (insertStrictlySorted!596 l!750 key1!37 v1!32))) (= (_1!12697 (h!38198 (t!51663 (insertStrictlySorted!596 l!750 key1!37 v1!32)))) key2!21)))))

(declare-fun b!1570613 () Bool)

(assert (=> b!1570613 (= e!875642 call!72258)))

(declare-fun b!1570614 () Bool)

(assert (=> b!1570614 (= e!875644 (ite c!144982 (t!51663 (t!51663 (insertStrictlySorted!596 l!750 key1!37 v1!32))) (ite c!144980 (Cons!36751 (h!38198 (t!51663 (insertStrictlySorted!596 l!750 key1!37 v1!32))) (t!51663 (t!51663 (insertStrictlySorted!596 l!750 key1!37 v1!32)))) Nil!36752)))))

(declare-fun b!1570615 () Bool)

(assert (=> b!1570615 (= e!875643 call!72260)))

(declare-fun b!1570616 () Bool)

(assert (=> b!1570616 (= e!875645 call!72259)))

(assert (= (and d!164267 c!144983) b!1570615))

(assert (= (and d!164267 (not c!144983)) b!1570612))

(assert (= (and b!1570612 c!144982) b!1570613))

(assert (= (and b!1570612 (not c!144982)) b!1570607))

(assert (= (and b!1570607 c!144980) b!1570616))

(assert (= (and b!1570607 (not c!144980)) b!1570611))

(assert (= (or b!1570616 b!1570611) bm!72256))

(assert (= (or b!1570613 bm!72256) bm!72257))

(assert (= (or b!1570615 bm!72257) bm!72255))

(assert (= (and bm!72255 c!144981) b!1570608))

(assert (= (and bm!72255 (not c!144981)) b!1570614))

(assert (= (and d!164267 res!1073148) b!1570609))

(assert (= (and b!1570609 res!1073147) b!1570610))

(declare-fun m!1444651 () Bool)

(assert (=> d!164267 m!1444651))

(assert (=> d!164267 m!1444571))

(declare-fun m!1444659 () Bool)

(assert (=> bm!72255 m!1444659))

(declare-fun m!1444661 () Bool)

(assert (=> b!1570610 m!1444661))

(declare-fun m!1444663 () Bool)

(assert (=> b!1570608 m!1444663))

(declare-fun m!1444665 () Bool)

(assert (=> b!1570609 m!1444665))

(assert (=> b!1570084 d!164267))

(declare-fun d!164271 () Bool)

(declare-fun res!1073151 () Bool)

(declare-fun e!875649 () Bool)

(assert (=> d!164271 (=> res!1073151 e!875649)))

(assert (=> d!164271 (= res!1073151 (and (is-Cons!36751 lt!673372) (= (_1!12697 (h!38198 lt!673372)) key2!21)))))

(assert (=> d!164271 (= (containsKey!869 lt!673372 key2!21) e!875649)))

(declare-fun b!1570619 () Bool)

(declare-fun e!875650 () Bool)

(assert (=> b!1570619 (= e!875649 e!875650)))

(declare-fun res!1073152 () Bool)

(assert (=> b!1570619 (=> (not res!1073152) (not e!875650))))

(assert (=> b!1570619 (= res!1073152 (and (or (not (is-Cons!36751 lt!673372)) (bvsle (_1!12697 (h!38198 lt!673372)) key2!21)) (is-Cons!36751 lt!673372) (bvslt (_1!12697 (h!38198 lt!673372)) key2!21)))))

(declare-fun b!1570620 () Bool)

(assert (=> b!1570620 (= e!875650 (containsKey!869 (t!51663 lt!673372) key2!21))))

(assert (= (and d!164271 (not res!1073151)) b!1570619))

(assert (= (and b!1570619 res!1073152) b!1570620))

(declare-fun m!1444671 () Bool)

(assert (=> b!1570620 m!1444671))

(assert (=> b!1570115 d!164271))

(declare-fun b!1570623 () Bool)

(declare-fun e!875653 () Bool)

(declare-fun tp!114227 () Bool)

(assert (=> b!1570623 (= e!875653 (and tp_is_empty!39097 tp!114227))))

(assert (=> b!1570275 (= tp!114225 e!875653)))

(assert (= (and b!1570275 (is-Cons!36751 (t!51663 (t!51663 l!750)))) b!1570623))

(push 1)

(assert (not d!164255))

(assert (not b!1570412))

(assert (not b!1570546))

(assert (not b!1570520))

(assert (not b!1570490))

(assert (not b!1570570))

(assert (not b!1570525))

(assert (not d!164185))

(assert (not b!1570408))

(assert (not b!1570526))

(assert (not d!164267))

(assert (not b!1570623))

(assert (not b!1570413))

(assert (not d!164239))

(assert (not b!1570470))

(assert (not b!1570620))

(assert (not b!1570468))

(assert (not b!1570552))

(assert (not b!1570426))

(assert (not b!1570478))

(assert (not d!164183))

(assert (not b!1570410))

(assert (not b!1570454))

(assert (not b!1570572))

(assert (not b!1570456))

(assert (not bm!72225))

(assert (not b!1570488))

(assert (not b!1570448))

(assert (not b!1570554))

(assert (not d!164141))

(assert (not d!164233))

(assert (not b!1570424))

(assert (not d!164243))

(assert (not b!1570425))

(assert (not b!1570558))

(assert (not b!1570450))

(assert (not b!1570610))

(assert (not b!1570474))

(assert (not b!1570548))

(assert (not b!1570422))

(assert (not d!164223))

(assert (not bm!72255))

(assert (not b!1570508))

(assert (not d!164155))

(assert (not bm!72240))

(assert (not d!164197))

(assert (not b!1570434))

(assert (not bm!72249))

(assert tp_is_empty!39097)

(assert (not d!164209))

(assert (not b!1570608))

(assert (not b!1570489))

(assert (not b!1570571))

(assert (not b!1570596))

(assert (not d!164133))

(assert (not b!1570586))

(assert (not b!1570476))

(assert (not b!1570510))

(assert (not b!1570472))

(assert (not d!164173))

(assert (not b!1570609))

(assert (not b!1570582))

(assert (not d!164151))

(assert (not bm!72228))

(assert (not b!1570524))

(assert (not b!1570514))

(assert (not bm!72234))

(assert (not b!1570414))

(assert (not b!1570436))

(assert (not b!1570590))

(check-sat)

(pop 1)

(push 1)

(check-sat)

