; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103578 () Bool)

(assert start!103578)

(declare-fun b!1240843 () Bool)

(declare-fun res!827890 () Bool)

(declare-fun e!703328 () Bool)

(assert (=> b!1240843 (=> (not res!827890) (not e!703328))))

(declare-datatypes ((B!1820 0))(
  ( (B!1821 (val!15672 Int)) )
))
(declare-datatypes ((tuple2!20216 0))(
  ( (tuple2!20217 (_1!10119 (_ BitVec 64)) (_2!10119 B!1820)) )
))
(declare-datatypes ((List!27337 0))(
  ( (Nil!27334) (Cons!27333 (h!28542 tuple2!20216) (t!40800 List!27337)) )
))
(declare-fun l!644 () List!27337)

(assert (=> b!1240843 (= res!827890 (is-Cons!27333 l!644))))

(declare-fun b!1240844 () Bool)

(declare-fun key2!15 () (_ BitVec 64))

(declare-fun isStrictlySorted!739 (List!27337) Bool)

(declare-fun removeStrictlySorted!118 (List!27337 (_ BitVec 64)) List!27337)

(assert (=> b!1240844 (= e!703328 (not (isStrictlySorted!739 (removeStrictlySorted!118 l!644 key2!15))))))

(declare-fun v1!20 () B!1820)

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun insertStrictlySorted!425 (List!27337 (_ BitVec 64) B!1820) List!27337)

(assert (=> b!1240844 (= (insertStrictlySorted!425 (removeStrictlySorted!118 (t!40800 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!118 (insertStrictlySorted!425 (t!40800 l!644) key1!25 v1!20) key2!15))))

(declare-datatypes ((Unit!41243 0))(
  ( (Unit!41244) )
))
(declare-fun lt!562046 () Unit!41243)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!7 (List!27337 (_ BitVec 64) B!1820 (_ BitVec 64)) Unit!41243)

(assert (=> b!1240844 (= lt!562046 (lemmaInsertAndRemoveStrictlySortedCommutative!7 (t!40800 l!644) key1!25 v1!20 key2!15))))

(declare-fun b!1240845 () Bool)

(declare-fun res!827892 () Bool)

(assert (=> b!1240845 (=> (not res!827892) (not e!703328))))

(assert (=> b!1240845 (= res!827892 (isStrictlySorted!739 l!644))))

(declare-fun b!1240846 () Bool)

(declare-fun res!827893 () Bool)

(assert (=> b!1240846 (=> (not res!827893) (not e!703328))))

(assert (=> b!1240846 (= res!827893 (isStrictlySorted!739 (t!40800 l!644)))))

(declare-fun b!1240847 () Bool)

(declare-fun e!703329 () Bool)

(declare-fun tp_is_empty!31219 () Bool)

(declare-fun tp!92582 () Bool)

(assert (=> b!1240847 (= e!703329 (and tp_is_empty!31219 tp!92582))))

(declare-fun res!827891 () Bool)

(assert (=> start!103578 (=> (not res!827891) (not e!703328))))

(assert (=> start!103578 (= res!827891 (not (= key1!25 key2!15)))))

(assert (=> start!103578 e!703328))

(assert (=> start!103578 true))

(assert (=> start!103578 e!703329))

(assert (=> start!103578 tp_is_empty!31219))

(assert (= (and start!103578 res!827891) b!1240845))

(assert (= (and b!1240845 res!827892) b!1240843))

(assert (= (and b!1240843 res!827890) b!1240846))

(assert (= (and b!1240846 res!827893) b!1240844))

(assert (= (and start!103578 (is-Cons!27333 l!644)) b!1240847))

(declare-fun m!1144093 () Bool)

(assert (=> b!1240844 m!1144093))

(declare-fun m!1144095 () Bool)

(assert (=> b!1240844 m!1144095))

(declare-fun m!1144097 () Bool)

(assert (=> b!1240844 m!1144097))

(assert (=> b!1240844 m!1144095))

(declare-fun m!1144099 () Bool)

(assert (=> b!1240844 m!1144099))

(declare-fun m!1144101 () Bool)

(assert (=> b!1240844 m!1144101))

(assert (=> b!1240844 m!1144099))

(declare-fun m!1144103 () Bool)

(assert (=> b!1240844 m!1144103))

(assert (=> b!1240844 m!1144093))

(declare-fun m!1144105 () Bool)

(assert (=> b!1240844 m!1144105))

(declare-fun m!1144107 () Bool)

(assert (=> b!1240845 m!1144107))

(declare-fun m!1144109 () Bool)

(assert (=> b!1240846 m!1144109))

(push 1)

(assert (not b!1240844))

(assert (not b!1240845))

(assert tp_is_empty!31219)

(assert (not b!1240847))

(assert (not b!1240846))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136379 () Bool)

(declare-fun res!827938 () Bool)

(declare-fun e!703362 () Bool)

(assert (=> d!136379 (=> res!827938 e!703362)))

(assert (=> d!136379 (= res!827938 (or (is-Nil!27334 (t!40800 l!644)) (is-Nil!27334 (t!40800 (t!40800 l!644)))))))

(assert (=> d!136379 (= (isStrictlySorted!739 (t!40800 l!644)) e!703362)))

(declare-fun b!1240898 () Bool)

(declare-fun e!703363 () Bool)

(assert (=> b!1240898 (= e!703362 e!703363)))

(declare-fun res!827939 () Bool)

(assert (=> b!1240898 (=> (not res!827939) (not e!703363))))

(assert (=> b!1240898 (= res!827939 (bvslt (_1!10119 (h!28542 (t!40800 l!644))) (_1!10119 (h!28542 (t!40800 (t!40800 l!644))))))))

(declare-fun b!1240899 () Bool)

(assert (=> b!1240899 (= e!703363 (isStrictlySorted!739 (t!40800 (t!40800 l!644))))))

(assert (= (and d!136379 (not res!827938)) b!1240898))

(assert (= (and b!1240898 res!827939) b!1240899))

(declare-fun m!1144151 () Bool)

(assert (=> b!1240899 m!1144151))

(assert (=> b!1240846 d!136379))

(declare-fun d!136389 () Bool)

(declare-fun res!827940 () Bool)

(declare-fun e!703364 () Bool)

(assert (=> d!136389 (=> res!827940 e!703364)))

(assert (=> d!136389 (= res!827940 (or (is-Nil!27334 l!644) (is-Nil!27334 (t!40800 l!644))))))

(assert (=> d!136389 (= (isStrictlySorted!739 l!644) e!703364)))

(declare-fun b!1240900 () Bool)

(declare-fun e!703365 () Bool)

(assert (=> b!1240900 (= e!703364 e!703365)))

(declare-fun res!827941 () Bool)

(assert (=> b!1240900 (=> (not res!827941) (not e!703365))))

(assert (=> b!1240900 (= res!827941 (bvslt (_1!10119 (h!28542 l!644)) (_1!10119 (h!28542 (t!40800 l!644)))))))

(declare-fun b!1240901 () Bool)

(assert (=> b!1240901 (= e!703365 (isStrictlySorted!739 (t!40800 l!644)))))

(assert (= (and d!136389 (not res!827940)) b!1240900))

(assert (= (and b!1240900 res!827941) b!1240901))

(assert (=> b!1240901 m!1144109))

(assert (=> b!1240845 d!136389))

(declare-fun e!703390 () List!27337)

(declare-fun b!1240942 () Bool)

(assert (=> b!1240942 (= e!703390 (t!40800 (insertStrictlySorted!425 (t!40800 l!644) key1!25 v1!20)))))

(declare-fun b!1240943 () Bool)

(declare-fun e!703391 () List!27337)

(assert (=> b!1240943 (= e!703390 e!703391)))

(declare-fun c!121305 () Bool)

(assert (=> b!1240943 (= c!121305 (and (is-Cons!27333 (insertStrictlySorted!425 (t!40800 l!644) key1!25 v1!20)) (not (= (_1!10119 (h!28542 (insertStrictlySorted!425 (t!40800 l!644) key1!25 v1!20))) key2!15))))))

(declare-fun d!136391 () Bool)

(declare-fun e!703392 () Bool)

(assert (=> d!136391 e!703392))

(declare-fun res!827950 () Bool)

(assert (=> d!136391 (=> (not res!827950) (not e!703392))))

(declare-fun lt!562061 () List!27337)

(assert (=> d!136391 (= res!827950 (isStrictlySorted!739 lt!562061))))

(assert (=> d!136391 (= lt!562061 e!703390)))

(declare-fun c!121306 () Bool)

(assert (=> d!136391 (= c!121306 (and (is-Cons!27333 (insertStrictlySorted!425 (t!40800 l!644) key1!25 v1!20)) (= (_1!10119 (h!28542 (insertStrictlySorted!425 (t!40800 l!644) key1!25 v1!20))) key2!15)))))

(assert (=> d!136391 (isStrictlySorted!739 (insertStrictlySorted!425 (t!40800 l!644) key1!25 v1!20))))

(assert (=> d!136391 (= (removeStrictlySorted!118 (insertStrictlySorted!425 (t!40800 l!644) key1!25 v1!20) key2!15) lt!562061)))

(declare-fun b!1240944 () Bool)

(declare-fun $colon$colon!615 (List!27337 tuple2!20216) List!27337)

(assert (=> b!1240944 (= e!703391 ($colon$colon!615 (removeStrictlySorted!118 (t!40800 (insertStrictlySorted!425 (t!40800 l!644) key1!25 v1!20)) key2!15) (h!28542 (insertStrictlySorted!425 (t!40800 l!644) key1!25 v1!20))))))

(declare-fun b!1240945 () Bool)

(declare-fun containsKey!602 (List!27337 (_ BitVec 64)) Bool)

(assert (=> b!1240945 (= e!703392 (not (containsKey!602 lt!562061 key2!15)))))

(declare-fun b!1240946 () Bool)

(assert (=> b!1240946 (= e!703391 Nil!27334)))

(assert (= (and d!136391 c!121306) b!1240942))

(assert (= (and d!136391 (not c!121306)) b!1240943))

(assert (= (and b!1240943 c!121305) b!1240944))

(assert (= (and b!1240943 (not c!121305)) b!1240946))

(assert (= (and d!136391 res!827950) b!1240945))

(declare-fun m!1144173 () Bool)

(assert (=> d!136391 m!1144173))

(assert (=> d!136391 m!1144095))

(declare-fun m!1144175 () Bool)

(assert (=> d!136391 m!1144175))

(declare-fun m!1144177 () Bool)

(assert (=> b!1240944 m!1144177))

(assert (=> b!1240944 m!1144177))

(declare-fun m!1144179 () Bool)

(assert (=> b!1240944 m!1144179))

(declare-fun m!1144181 () Bool)

(assert (=> b!1240945 m!1144181))

(assert (=> b!1240844 d!136391))

(declare-fun bm!61187 () Bool)

(declare-fun call!61192 () List!27337)

(declare-fun call!61191 () List!27337)

(assert (=> bm!61187 (= call!61192 call!61191)))

(declare-fun d!136397 () Bool)

(declare-fun e!703436 () Bool)

(assert (=> d!136397 e!703436))

(declare-fun res!827968 () Bool)

(assert (=> d!136397 (=> (not res!827968) (not e!703436))))

(declare-fun lt!562070 () List!27337)

(assert (=> d!136397 (= res!827968 (isStrictlySorted!739 lt!562070))))

(declare-fun e!703435 () List!27337)

(assert (=> d!136397 (= lt!562070 e!703435)))

(declare-fun c!121342 () Bool)

(assert (=> d!136397 (= c!121342 (and (is-Cons!27333 (removeStrictlySorted!118 (t!40800 l!644) key2!15)) (bvslt (_1!10119 (h!28542 (removeStrictlySorted!118 (t!40800 l!644) key2!15))) key1!25)))))

(assert (=> d!136397 (isStrictlySorted!739 (removeStrictlySorted!118 (t!40800 l!644) key2!15))))

(assert (=> d!136397 (= (insertStrictlySorted!425 (removeStrictlySorted!118 (t!40800 l!644) key2!15) key1!25 v1!20) lt!562070)))

(declare-fun c!121340 () Bool)

(declare-fun b!1241027 () Bool)

(declare-fun e!703433 () List!27337)

(declare-fun c!121339 () Bool)

(assert (=> b!1241027 (= e!703433 (ite c!121340 (t!40800 (removeStrictlySorted!118 (t!40800 l!644) key2!15)) (ite c!121339 (Cons!27333 (h!28542 (removeStrictlySorted!118 (t!40800 l!644) key2!15)) (t!40800 (removeStrictlySorted!118 (t!40800 l!644) key2!15))) Nil!27334)))))

(declare-fun b!1241028 () Bool)

(declare-fun e!703437 () List!27337)

(assert (=> b!1241028 (= e!703437 call!61192)))

(declare-fun b!1241029 () Bool)

(declare-fun res!827967 () Bool)

(assert (=> b!1241029 (=> (not res!827967) (not e!703436))))

(assert (=> b!1241029 (= res!827967 (containsKey!602 lt!562070 key1!25))))

(declare-fun b!1241030 () Bool)

(declare-fun e!703434 () List!27337)

(assert (=> b!1241030 (= e!703434 call!61191)))

(declare-fun call!61190 () List!27337)

(declare-fun bm!61188 () Bool)

(assert (=> bm!61188 (= call!61190 ($colon$colon!615 e!703433 (ite c!121342 (h!28542 (removeStrictlySorted!118 (t!40800 l!644) key2!15)) (tuple2!20217 key1!25 v1!20))))))

(declare-fun c!121341 () Bool)

(assert (=> bm!61188 (= c!121341 c!121342)))

(declare-fun b!1241031 () Bool)

(assert (=> b!1241031 (= e!703437 call!61192)))

(declare-fun b!1241032 () Bool)

(declare-fun contains!7385 (List!27337 tuple2!20216) Bool)

(assert (=> b!1241032 (= e!703436 (contains!7385 lt!562070 (tuple2!20217 key1!25 v1!20)))))

(declare-fun b!1241033 () Bool)

(assert (=> b!1241033 (= e!703435 e!703434)))

(assert (=> b!1241033 (= c!121340 (and (is-Cons!27333 (removeStrictlySorted!118 (t!40800 l!644) key2!15)) (= (_1!10119 (h!28542 (removeStrictlySorted!118 (t!40800 l!644) key2!15))) key1!25)))))

(declare-fun b!1241034 () Bool)

(assert (=> b!1241034 (= e!703435 call!61190)))

(declare-fun b!1241035 () Bool)

(assert (=> b!1241035 (= e!703433 (insertStrictlySorted!425 (t!40800 (removeStrictlySorted!118 (t!40800 l!644) key2!15)) key1!25 v1!20))))

(declare-fun b!1241036 () Bool)

(assert (=> b!1241036 (= c!121339 (and (is-Cons!27333 (removeStrictlySorted!118 (t!40800 l!644) key2!15)) (bvsgt (_1!10119 (h!28542 (removeStrictlySorted!118 (t!40800 l!644) key2!15))) key1!25)))))

(assert (=> b!1241036 (= e!703434 e!703437)))

(declare-fun bm!61189 () Bool)

(assert (=> bm!61189 (= call!61191 call!61190)))

(assert (= (and d!136397 c!121342) b!1241034))

(assert (= (and d!136397 (not c!121342)) b!1241033))

(assert (= (and b!1241033 c!121340) b!1241030))

(assert (= (and b!1241033 (not c!121340)) b!1241036))

(assert (= (and b!1241036 c!121339) b!1241028))

(assert (= (and b!1241036 (not c!121339)) b!1241031))

(assert (= (or b!1241028 b!1241031) bm!61187))

(assert (= (or b!1241030 bm!61187) bm!61189))

(assert (= (or b!1241034 bm!61189) bm!61188))

(assert (= (and bm!61188 c!121341) b!1241035))

(assert (= (and bm!61188 (not c!121341)) b!1241027))

(assert (= (and d!136397 res!827968) b!1241029))

(assert (= (and b!1241029 res!827967) b!1241032))

(declare-fun m!1144195 () Bool)

(assert (=> d!136397 m!1144195))

(assert (=> d!136397 m!1144099))

(declare-fun m!1144201 () Bool)

(assert (=> d!136397 m!1144201))

(declare-fun m!1144207 () Bool)

(assert (=> b!1241029 m!1144207))

(declare-fun m!1144211 () Bool)

(assert (=> b!1241032 m!1144211))

(declare-fun m!1144215 () Bool)

(assert (=> b!1241035 m!1144215))

(declare-fun m!1144217 () Bool)

(assert (=> bm!61188 m!1144217))

(assert (=> b!1240844 d!136397))

(declare-fun b!1241047 () Bool)

(declare-fun e!703444 () List!27337)

(assert (=> b!1241047 (= e!703444 (t!40800 l!644))))

(declare-fun b!1241048 () Bool)

(declare-fun e!703445 () List!27337)

(assert (=> b!1241048 (= e!703444 e!703445)))

(declare-fun c!121347 () Bool)

(assert (=> b!1241048 (= c!121347 (and (is-Cons!27333 l!644) (not (= (_1!10119 (h!28542 l!644)) key2!15))))))

(declare-fun d!136403 () Bool)

(declare-fun e!703446 () Bool)

(assert (=> d!136403 e!703446))

(declare-fun res!827971 () Bool)

(assert (=> d!136403 (=> (not res!827971) (not e!703446))))

(declare-fun lt!562073 () List!27337)

(assert (=> d!136403 (= res!827971 (isStrictlySorted!739 lt!562073))))

(assert (=> d!136403 (= lt!562073 e!703444)))

(declare-fun c!121348 () Bool)

(assert (=> d!136403 (= c!121348 (and (is-Cons!27333 l!644) (= (_1!10119 (h!28542 l!644)) key2!15)))))

(assert (=> d!136403 (isStrictlySorted!739 l!644)))

(assert (=> d!136403 (= (removeStrictlySorted!118 l!644 key2!15) lt!562073)))

(declare-fun b!1241049 () Bool)

(assert (=> b!1241049 (= e!703445 ($colon$colon!615 (removeStrictlySorted!118 (t!40800 l!644) key2!15) (h!28542 l!644)))))

(declare-fun b!1241050 () Bool)

(assert (=> b!1241050 (= e!703446 (not (containsKey!602 lt!562073 key2!15)))))

(declare-fun b!1241051 () Bool)

(assert (=> b!1241051 (= e!703445 Nil!27334)))

(assert (= (and d!136403 c!121348) b!1241047))

(assert (= (and d!136403 (not c!121348)) b!1241048))

(assert (= (and b!1241048 c!121347) b!1241049))

(assert (= (and b!1241048 (not c!121347)) b!1241051))

(assert (= (and d!136403 res!827971) b!1241050))

(declare-fun m!1144229 () Bool)

(assert (=> d!136403 m!1144229))

(assert (=> d!136403 m!1144107))

(assert (=> b!1241049 m!1144099))

(assert (=> b!1241049 m!1144099))

(declare-fun m!1144233 () Bool)

(assert (=> b!1241049 m!1144233))

(declare-fun m!1144235 () Bool)

(assert (=> b!1241050 m!1144235))

(assert (=> b!1240844 d!136403))

(declare-fun d!136409 () Bool)

(assert (=> d!136409 (= (insertStrictlySorted!425 (removeStrictlySorted!118 (t!40800 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!118 (insertStrictlySorted!425 (t!40800 l!644) key1!25 v1!20) key2!15))))

(declare-fun lt!562082 () Unit!41243)

(declare-fun choose!1835 (List!27337 (_ BitVec 64) B!1820 (_ BitVec 64)) Unit!41243)

(assert (=> d!136409 (= lt!562082 (choose!1835 (t!40800 l!644) key1!25 v1!20 key2!15))))

(assert (=> d!136409 (not (= key1!25 key2!15))))

(assert (=> d!136409 (= (lemmaInsertAndRemoveStrictlySortedCommutative!7 (t!40800 l!644) key1!25 v1!20 key2!15) lt!562082)))

(declare-fun bs!34939 () Bool)

(assert (= bs!34939 d!136409))

(assert (=> bs!34939 m!1144099))

(assert (=> bs!34939 m!1144103))

(declare-fun m!1144239 () Bool)

(assert (=> bs!34939 m!1144239))

(assert (=> bs!34939 m!1144099))

(assert (=> bs!34939 m!1144095))

(assert (=> bs!34939 m!1144095))

(assert (=> bs!34939 m!1144097))

(assert (=> b!1240844 d!136409))

(declare-fun d!136415 () Bool)

(declare-fun res!827976 () Bool)

(declare-fun e!703451 () Bool)

(assert (=> d!136415 (=> res!827976 e!703451)))

(assert (=> d!136415 (= res!827976 (or (is-Nil!27334 (removeStrictlySorted!118 l!644 key2!15)) (is-Nil!27334 (t!40800 (removeStrictlySorted!118 l!644 key2!15)))))))

(assert (=> d!136415 (= (isStrictlySorted!739 (removeStrictlySorted!118 l!644 key2!15)) e!703451)))

(declare-fun b!1241056 () Bool)

(declare-fun e!703452 () Bool)

(assert (=> b!1241056 (= e!703451 e!703452)))

(declare-fun res!827977 () Bool)

(assert (=> b!1241056 (=> (not res!827977) (not e!703452))))

(assert (=> b!1241056 (= res!827977 (bvslt (_1!10119 (h!28542 (removeStrictlySorted!118 l!644 key2!15))) (_1!10119 (h!28542 (t!40800 (removeStrictlySorted!118 l!644 key2!15))))))))

(declare-fun b!1241057 () Bool)

(assert (=> b!1241057 (= e!703452 (isStrictlySorted!739 (t!40800 (removeStrictlySorted!118 l!644 key2!15))))))

(assert (= (and d!136415 (not res!827976)) b!1241056))

(assert (= (and b!1241056 res!827977) b!1241057))

(declare-fun m!1144247 () Bool)

(assert (=> b!1241057 m!1144247))

(assert (=> b!1240844 d!136415))

(declare-fun bm!61196 () Bool)

(declare-fun call!61201 () List!27337)

(declare-fun call!61200 () List!27337)

(assert (=> bm!61196 (= call!61201 call!61200)))

(declare-fun d!136421 () Bool)

(declare-fun e!703466 () Bool)

(assert (=> d!136421 e!703466))

(declare-fun res!827983 () Bool)

(assert (=> d!136421 (=> (not res!827983) (not e!703466))))

(declare-fun lt!562085 () List!27337)

(assert (=> d!136421 (= res!827983 (isStrictlySorted!739 lt!562085))))

(declare-fun e!703465 () List!27337)

(assert (=> d!136421 (= lt!562085 e!703465)))

(declare-fun c!121360 () Bool)

(assert (=> d!136421 (= c!121360 (and (is-Cons!27333 (t!40800 l!644)) (bvslt (_1!10119 (h!28542 (t!40800 l!644))) key1!25)))))

(assert (=> d!136421 (isStrictlySorted!739 (t!40800 l!644))))

(assert (=> d!136421 (= (insertStrictlySorted!425 (t!40800 l!644) key1!25 v1!20) lt!562085)))

(declare-fun b!1241078 () Bool)

(declare-fun c!121357 () Bool)

(declare-fun e!703463 () List!27337)

(declare-fun c!121358 () Bool)

(assert (=> b!1241078 (= e!703463 (ite c!121358 (t!40800 (t!40800 l!644)) (ite c!121357 (Cons!27333 (h!28542 (t!40800 l!644)) (t!40800 (t!40800 l!644))) Nil!27334)))))

(declare-fun b!1241079 () Bool)

(declare-fun e!703467 () List!27337)

(assert (=> b!1241079 (= e!703467 call!61201)))

(declare-fun b!1241080 () Bool)

(declare-fun res!827982 () Bool)

(assert (=> b!1241080 (=> (not res!827982) (not e!703466))))

(assert (=> b!1241080 (= res!827982 (containsKey!602 lt!562085 key1!25))))

(declare-fun b!1241081 () Bool)

(declare-fun e!703464 () List!27337)

(assert (=> b!1241081 (= e!703464 call!61200)))

(declare-fun bm!61197 () Bool)

(declare-fun call!61199 () List!27337)

(assert (=> bm!61197 (= call!61199 ($colon$colon!615 e!703463 (ite c!121360 (h!28542 (t!40800 l!644)) (tuple2!20217 key1!25 v1!20))))))

(declare-fun c!121359 () Bool)

(assert (=> bm!61197 (= c!121359 c!121360)))

(declare-fun b!1241082 () Bool)

(assert (=> b!1241082 (= e!703467 call!61201)))

(declare-fun b!1241083 () Bool)

(assert (=> b!1241083 (= e!703466 (contains!7385 lt!562085 (tuple2!20217 key1!25 v1!20)))))

(declare-fun b!1241084 () Bool)

(assert (=> b!1241084 (= e!703465 e!703464)))

(assert (=> b!1241084 (= c!121358 (and (is-Cons!27333 (t!40800 l!644)) (= (_1!10119 (h!28542 (t!40800 l!644))) key1!25)))))

(declare-fun b!1241085 () Bool)

(assert (=> b!1241085 (= e!703465 call!61199)))

(declare-fun b!1241086 () Bool)

(assert (=> b!1241086 (= e!703463 (insertStrictlySorted!425 (t!40800 (t!40800 l!644)) key1!25 v1!20))))

(declare-fun b!1241087 () Bool)

(assert (=> b!1241087 (= c!121357 (and (is-Cons!27333 (t!40800 l!644)) (bvsgt (_1!10119 (h!28542 (t!40800 l!644))) key1!25)))))

(assert (=> b!1241087 (= e!703464 e!703467)))

(declare-fun bm!61198 () Bool)

(assert (=> bm!61198 (= call!61200 call!61199)))

(assert (= (and d!136421 c!121360) b!1241085))

(assert (= (and d!136421 (not c!121360)) b!1241084))

(assert (= (and b!1241084 c!121358) b!1241081))

(assert (= (and b!1241084 (not c!121358)) b!1241087))

(assert (= (and b!1241087 c!121357) b!1241079))

(assert (= (and b!1241087 (not c!121357)) b!1241082))

(assert (= (or b!1241079 b!1241082) bm!61196))

(assert (= (or b!1241081 bm!61196) bm!61198))

(assert (= (or b!1241085 bm!61198) bm!61197))

(assert (= (and bm!61197 c!121359) b!1241086))

(assert (= (and bm!61197 (not c!121359)) b!1241078))

(assert (= (and d!136421 res!827983) b!1241080))

(assert (= (and b!1241080 res!827982) b!1241083))

(declare-fun m!1144255 () Bool)

(assert (=> d!136421 m!1144255))

(assert (=> d!136421 m!1144109))

(declare-fun m!1144261 () Bool)

(assert (=> b!1241080 m!1144261))

(declare-fun m!1144267 () Bool)

(assert (=> b!1241083 m!1144267))

(declare-fun m!1144273 () Bool)

(assert (=> b!1241086 m!1144273))

(declare-fun m!1144277 () Bool)

(assert (=> bm!61197 m!1144277))

(assert (=> b!1240844 d!136421))

(declare-fun b!1241098 () Bool)

(declare-fun e!703474 () List!27337)

(assert (=> b!1241098 (= e!703474 (t!40800 (t!40800 l!644)))))

(declare-fun b!1241099 () Bool)

(declare-fun e!703475 () List!27337)

(assert (=> b!1241099 (= e!703474 e!703475)))

(declare-fun c!121365 () Bool)

(assert (=> b!1241099 (= c!121365 (and (is-Cons!27333 (t!40800 l!644)) (not (= (_1!10119 (h!28542 (t!40800 l!644))) key2!15))))))

(declare-fun d!136427 () Bool)

(declare-fun e!703476 () Bool)

(assert (=> d!136427 e!703476))

(declare-fun res!827986 () Bool)

(assert (=> d!136427 (=> (not res!827986) (not e!703476))))

(declare-fun lt!562088 () List!27337)

(assert (=> d!136427 (= res!827986 (isStrictlySorted!739 lt!562088))))

(assert (=> d!136427 (= lt!562088 e!703474)))

(declare-fun c!121366 () Bool)

(assert (=> d!136427 (= c!121366 (and (is-Cons!27333 (t!40800 l!644)) (= (_1!10119 (h!28542 (t!40800 l!644))) key2!15)))))

(assert (=> d!136427 (isStrictlySorted!739 (t!40800 l!644))))

(assert (=> d!136427 (= (removeStrictlySorted!118 (t!40800 l!644) key2!15) lt!562088)))

(declare-fun b!1241100 () Bool)

(assert (=> b!1241100 (= e!703475 ($colon$colon!615 (removeStrictlySorted!118 (t!40800 (t!40800 l!644)) key2!15) (h!28542 (t!40800 l!644))))))

(declare-fun b!1241101 () Bool)

(assert (=> b!1241101 (= e!703476 (not (containsKey!602 lt!562088 key2!15)))))

(declare-fun b!1241102 () Bool)

(assert (=> b!1241102 (= e!703475 Nil!27334)))

(assert (= (and d!136427 c!121366) b!1241098))

(assert (= (and d!136427 (not c!121366)) b!1241099))

(assert (= (and b!1241099 c!121365) b!1241100))

(assert (= (and b!1241099 (not c!121365)) b!1241102))

(assert (= (and d!136427 res!827986) b!1241101))

(declare-fun m!1144283 () Bool)

(assert (=> d!136427 m!1144283))

(assert (=> d!136427 m!1144109))

(declare-fun m!1144293 () Bool)

(assert (=> b!1241100 m!1144293))

(assert (=> b!1241100 m!1144293))

(declare-fun m!1144299 () Bool)

(assert (=> b!1241100 m!1144299))

(declare-fun m!1144301 () Bool)

(assert (=> b!1241101 m!1144301))

(assert (=> b!1240844 d!136427))

(declare-fun b!1241117 () Bool)

(declare-fun e!703485 () Bool)

(declare-fun tp!92597 () Bool)

(assert (=> b!1241117 (= e!703485 (and tp_is_empty!31219 tp!92597))))

(assert (=> b!1240847 (= tp!92582 e!703485)))

(assert (= (and b!1240847 (is-Cons!27333 (t!40800 l!644))) b!1241117))

(push 1)

