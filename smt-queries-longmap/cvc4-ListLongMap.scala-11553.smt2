; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134948 () Bool)

(assert start!134948)

(declare-datatypes ((B!2554 0))(
  ( (B!2555 (val!19639 Int)) )
))
(declare-fun v1!32 () B!2554)

(declare-fun v2!10 () B!2554)

(declare-datatypes ((tuple2!25440 0))(
  ( (tuple2!25441 (_1!12731 (_ BitVec 64)) (_2!12731 B!2554)) )
))
(declare-datatypes ((List!36791 0))(
  ( (Nil!36788) (Cons!36787 (h!38252 tuple2!25440) (t!51694 List!36791)) )
))
(declare-fun l!750 () List!36791)

(declare-fun e!877202 () Bool)

(declare-fun b!1573115 () Bool)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun insertStrictlySorted!601 (List!36791 (_ BitVec 64) B!2554) List!36791)

(assert (=> b!1573115 (= e!877202 (not (= (insertStrictlySorted!601 (insertStrictlySorted!601 l!750 key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!601 (insertStrictlySorted!601 l!750 key2!21 v2!10) key1!37 v1!32))))))

(declare-fun b!1573113 () Bool)

(declare-fun res!1074054 () Bool)

(assert (=> b!1573113 (=> (not res!1074054) (not e!877202))))

(declare-fun isStrictlySorted!1011 (List!36791) Bool)

(assert (=> b!1573113 (= res!1074054 (isStrictlySorted!1011 l!750))))

(declare-fun b!1573114 () Bool)

(declare-fun res!1074055 () Bool)

(assert (=> b!1573114 (=> (not res!1074055) (not e!877202))))

(assert (=> b!1573114 (= res!1074055 (or (not (is-Cons!36787 l!750)) (bvsge (_1!12731 (h!38252 l!750)) key1!37) (bvsge (_1!12731 (h!38252 l!750)) key2!21)))))

(declare-fun b!1573116 () Bool)

(declare-fun e!877201 () Bool)

(declare-fun tp_is_empty!39105 () Bool)

(declare-fun tp!114234 () Bool)

(assert (=> b!1573116 (= e!877201 (and tp_is_empty!39105 tp!114234))))

(declare-fun res!1074056 () Bool)

(assert (=> start!134948 (=> (not res!1074056) (not e!877202))))

(assert (=> start!134948 (= res!1074056 (not (= key1!37 key2!21)))))

(assert (=> start!134948 e!877202))

(assert (=> start!134948 tp_is_empty!39105))

(assert (=> start!134948 e!877201))

(assert (=> start!134948 true))

(assert (= (and start!134948 res!1074056) b!1573113))

(assert (= (and b!1573113 res!1074054) b!1573114))

(assert (= (and b!1573114 res!1074055) b!1573115))

(assert (= (and start!134948 (is-Cons!36787 l!750)) b!1573116))

(declare-fun m!1446985 () Bool)

(assert (=> b!1573115 m!1446985))

(assert (=> b!1573115 m!1446985))

(declare-fun m!1446987 () Bool)

(assert (=> b!1573115 m!1446987))

(declare-fun m!1446989 () Bool)

(assert (=> b!1573115 m!1446989))

(assert (=> b!1573115 m!1446989))

(declare-fun m!1446991 () Bool)

(assert (=> b!1573115 m!1446991))

(declare-fun m!1446993 () Bool)

(assert (=> b!1573113 m!1446993))

(push 1)

(assert (not b!1573115))

(assert (not b!1573113))

(assert (not b!1573116))

(assert tp_is_empty!39105)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1573189 () Bool)

(declare-fun res!1074079 () Bool)

(declare-fun e!877240 () Bool)

(assert (=> b!1573189 (=> (not res!1074079) (not e!877240))))

(declare-fun lt!674347 () List!36791)

(declare-fun containsKey!872 (List!36791 (_ BitVec 64)) Bool)

(assert (=> b!1573189 (= res!1074079 (containsKey!872 lt!674347 key2!21))))

(declare-fun bm!72429 () Bool)

(declare-fun call!72433 () List!36791)

(declare-fun call!72434 () List!36791)

(assert (=> bm!72429 (= call!72433 call!72434)))

(declare-fun e!877242 () List!36791)

(declare-fun c!145812 () Bool)

(declare-fun b!1573190 () Bool)

(declare-fun c!145813 () Bool)

(assert (=> b!1573190 (= e!877242 (ite c!145813 (t!51694 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (ite c!145812 (Cons!36787 (h!38252 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (t!51694 (insertStrictlySorted!601 l!750 key1!37 v1!32))) Nil!36788)))))

(declare-fun bm!72430 () Bool)

(declare-fun call!72432 () List!36791)

(assert (=> bm!72430 (= call!72434 call!72432)))

(declare-fun b!1573191 () Bool)

(declare-fun e!877243 () List!36791)

(assert (=> b!1573191 (= e!877243 call!72433)))

(declare-fun d!165007 () Bool)

(assert (=> d!165007 e!877240))

(declare-fun res!1074078 () Bool)

(assert (=> d!165007 (=> (not res!1074078) (not e!877240))))

(assert (=> d!165007 (= res!1074078 (isStrictlySorted!1011 lt!674347))))

(declare-fun e!877239 () List!36791)

(assert (=> d!165007 (= lt!674347 e!877239)))

(declare-fun c!145815 () Bool)

(assert (=> d!165007 (= c!145815 (and (is-Cons!36787 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (bvslt (_1!12731 (h!38252 (insertStrictlySorted!601 l!750 key1!37 v1!32))) key2!21)))))

(assert (=> d!165007 (isStrictlySorted!1011 (insertStrictlySorted!601 l!750 key1!37 v1!32))))

(assert (=> d!165007 (= (insertStrictlySorted!601 (insertStrictlySorted!601 l!750 key1!37 v1!32) key2!21 v2!10) lt!674347)))

(declare-fun b!1573192 () Bool)

(declare-fun e!877241 () List!36791)

(assert (=> b!1573192 (= e!877241 call!72434)))

(declare-fun b!1573193 () Bool)

(assert (=> b!1573193 (= e!877239 call!72432)))

(declare-fun b!1573194 () Bool)

(assert (=> b!1573194 (= e!877243 call!72433)))

(declare-fun b!1573195 () Bool)

(assert (=> b!1573195 (= c!145812 (and (is-Cons!36787 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (bvsgt (_1!12731 (h!38252 (insertStrictlySorted!601 l!750 key1!37 v1!32))) key2!21)))))

(assert (=> b!1573195 (= e!877241 e!877243)))

(declare-fun b!1573196 () Bool)

(assert (=> b!1573196 (= e!877239 e!877241)))

(assert (=> b!1573196 (= c!145813 (and (is-Cons!36787 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (= (_1!12731 (h!38252 (insertStrictlySorted!601 l!750 key1!37 v1!32))) key2!21)))))

(declare-fun bm!72431 () Bool)

(declare-fun $colon$colon!1002 (List!36791 tuple2!25440) List!36791)

(assert (=> bm!72431 (= call!72432 ($colon$colon!1002 e!877242 (ite c!145815 (h!38252 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (tuple2!25441 key2!21 v2!10))))))

(declare-fun c!145814 () Bool)

(assert (=> bm!72431 (= c!145814 c!145815)))

(declare-fun b!1573197 () Bool)

(assert (=> b!1573197 (= e!877242 (insertStrictlySorted!601 (t!51694 (insertStrictlySorted!601 l!750 key1!37 v1!32)) key2!21 v2!10))))

(declare-fun b!1573198 () Bool)

(declare-fun contains!10477 (List!36791 tuple2!25440) Bool)

(assert (=> b!1573198 (= e!877240 (contains!10477 lt!674347 (tuple2!25441 key2!21 v2!10)))))

(assert (= (and d!165007 c!145815) b!1573193))

(assert (= (and d!165007 (not c!145815)) b!1573196))

(assert (= (and b!1573196 c!145813) b!1573192))

(assert (= (and b!1573196 (not c!145813)) b!1573195))

(assert (= (and b!1573195 c!145812) b!1573194))

(assert (= (and b!1573195 (not c!145812)) b!1573191))

(assert (= (or b!1573194 b!1573191) bm!72429))

(assert (= (or b!1573192 bm!72429) bm!72430))

(assert (= (or b!1573193 bm!72430) bm!72431))

(assert (= (and bm!72431 c!145814) b!1573197))

(assert (= (and bm!72431 (not c!145814)) b!1573190))

(assert (= (and d!165007 res!1074078) b!1573189))

(assert (= (and b!1573189 res!1074079) b!1573198))

(declare-fun m!1447005 () Bool)

(assert (=> bm!72431 m!1447005))

(declare-fun m!1447007 () Bool)

(assert (=> b!1573189 m!1447007))

(declare-fun m!1447011 () Bool)

(assert (=> b!1573197 m!1447011))

(declare-fun m!1447015 () Bool)

(assert (=> b!1573198 m!1447015))

(declare-fun m!1447017 () Bool)

(assert (=> d!165007 m!1447017))

(assert (=> d!165007 m!1446985))

(declare-fun m!1447021 () Bool)

(assert (=> d!165007 m!1447021))

(assert (=> b!1573115 d!165007))

(declare-fun b!1573219 () Bool)

(declare-fun res!1074085 () Bool)

(declare-fun e!877255 () Bool)

(assert (=> b!1573219 (=> (not res!1074085) (not e!877255))))

(declare-fun lt!674350 () List!36791)

(assert (=> b!1573219 (= res!1074085 (containsKey!872 lt!674350 key1!37))))

(declare-fun bm!72438 () Bool)

(declare-fun call!72442 () List!36791)

(declare-fun call!72443 () List!36791)

(assert (=> bm!72438 (= call!72442 call!72443)))

(declare-fun b!1573220 () Bool)

(declare-fun c!145825 () Bool)

(declare-fun c!145824 () Bool)

(declare-fun e!877257 () List!36791)

(assert (=> b!1573220 (= e!877257 (ite c!145825 (t!51694 l!750) (ite c!145824 (Cons!36787 (h!38252 l!750) (t!51694 l!750)) Nil!36788)))))

(declare-fun bm!72439 () Bool)

(declare-fun call!72441 () List!36791)

(assert (=> bm!72439 (= call!72443 call!72441)))

(declare-fun b!1573221 () Bool)

(declare-fun e!877258 () List!36791)

(assert (=> b!1573221 (= e!877258 call!72442)))

(declare-fun d!165013 () Bool)

(assert (=> d!165013 e!877255))

(declare-fun res!1074084 () Bool)

(assert (=> d!165013 (=> (not res!1074084) (not e!877255))))

(assert (=> d!165013 (= res!1074084 (isStrictlySorted!1011 lt!674350))))

(declare-fun e!877254 () List!36791)

(assert (=> d!165013 (= lt!674350 e!877254)))

(declare-fun c!145827 () Bool)

(assert (=> d!165013 (= c!145827 (and (is-Cons!36787 l!750) (bvslt (_1!12731 (h!38252 l!750)) key1!37)))))

(assert (=> d!165013 (isStrictlySorted!1011 l!750)))

(assert (=> d!165013 (= (insertStrictlySorted!601 l!750 key1!37 v1!32) lt!674350)))

(declare-fun b!1573222 () Bool)

(declare-fun e!877256 () List!36791)

(assert (=> b!1573222 (= e!877256 call!72443)))

(declare-fun b!1573223 () Bool)

(assert (=> b!1573223 (= e!877254 call!72441)))

(declare-fun b!1573224 () Bool)

(assert (=> b!1573224 (= e!877258 call!72442)))

(declare-fun b!1573225 () Bool)

(assert (=> b!1573225 (= c!145824 (and (is-Cons!36787 l!750) (bvsgt (_1!12731 (h!38252 l!750)) key1!37)))))

(assert (=> b!1573225 (= e!877256 e!877258)))

(declare-fun b!1573226 () Bool)

(assert (=> b!1573226 (= e!877254 e!877256)))

(assert (=> b!1573226 (= c!145825 (and (is-Cons!36787 l!750) (= (_1!12731 (h!38252 l!750)) key1!37)))))

(declare-fun bm!72440 () Bool)

(assert (=> bm!72440 (= call!72441 ($colon$colon!1002 e!877257 (ite c!145827 (h!38252 l!750) (tuple2!25441 key1!37 v1!32))))))

(declare-fun c!145826 () Bool)

(assert (=> bm!72440 (= c!145826 c!145827)))

(declare-fun b!1573227 () Bool)

(assert (=> b!1573227 (= e!877257 (insertStrictlySorted!601 (t!51694 l!750) key1!37 v1!32))))

(declare-fun b!1573228 () Bool)

(assert (=> b!1573228 (= e!877255 (contains!10477 lt!674350 (tuple2!25441 key1!37 v1!32)))))

(assert (= (and d!165013 c!145827) b!1573223))

(assert (= (and d!165013 (not c!145827)) b!1573226))

(assert (= (and b!1573226 c!145825) b!1573222))

(assert (= (and b!1573226 (not c!145825)) b!1573225))

(assert (= (and b!1573225 c!145824) b!1573224))

(assert (= (and b!1573225 (not c!145824)) b!1573221))

(assert (= (or b!1573224 b!1573221) bm!72438))

(assert (= (or b!1573222 bm!72438) bm!72439))

(assert (= (or b!1573223 bm!72439) bm!72440))

(assert (= (and bm!72440 c!145826) b!1573227))

(assert (= (and bm!72440 (not c!145826)) b!1573220))

(assert (= (and d!165013 res!1074084) b!1573219))

(assert (= (and b!1573219 res!1074085) b!1573228))

(declare-fun m!1447041 () Bool)

(assert (=> bm!72440 m!1447041))

(declare-fun m!1447043 () Bool)

(assert (=> b!1573219 m!1447043))

(declare-fun m!1447047 () Bool)

(assert (=> b!1573227 m!1447047))

(declare-fun m!1447051 () Bool)

(assert (=> b!1573228 m!1447051))

(declare-fun m!1447053 () Bool)

(assert (=> d!165013 m!1447053))

(assert (=> d!165013 m!1446993))

(assert (=> b!1573115 d!165013))

(declare-fun b!1573249 () Bool)

(declare-fun res!1074091 () Bool)

(declare-fun e!877270 () Bool)

(assert (=> b!1573249 (=> (not res!1074091) (not e!877270))))

(declare-fun lt!674353 () List!36791)

(assert (=> b!1573249 (= res!1074091 (containsKey!872 lt!674353 key1!37))))

(declare-fun bm!72447 () Bool)

(declare-fun call!72451 () List!36791)

(declare-fun call!72452 () List!36791)

(assert (=> bm!72447 (= call!72451 call!72452)))

(declare-fun b!1573250 () Bool)

(declare-fun c!145837 () Bool)

(declare-fun e!877272 () List!36791)

(declare-fun c!145836 () Bool)

(assert (=> b!1573250 (= e!877272 (ite c!145837 (t!51694 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (ite c!145836 (Cons!36787 (h!38252 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (t!51694 (insertStrictlySorted!601 l!750 key2!21 v2!10))) Nil!36788)))))

(declare-fun bm!72448 () Bool)

(declare-fun call!72450 () List!36791)

(assert (=> bm!72448 (= call!72452 call!72450)))

(declare-fun b!1573251 () Bool)

(declare-fun e!877273 () List!36791)

(assert (=> b!1573251 (= e!877273 call!72451)))

(declare-fun d!165019 () Bool)

(assert (=> d!165019 e!877270))

(declare-fun res!1074090 () Bool)

(assert (=> d!165019 (=> (not res!1074090) (not e!877270))))

(assert (=> d!165019 (= res!1074090 (isStrictlySorted!1011 lt!674353))))

(declare-fun e!877269 () List!36791)

(assert (=> d!165019 (= lt!674353 e!877269)))

(declare-fun c!145839 () Bool)

(assert (=> d!165019 (= c!145839 (and (is-Cons!36787 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (bvslt (_1!12731 (h!38252 (insertStrictlySorted!601 l!750 key2!21 v2!10))) key1!37)))))

(assert (=> d!165019 (isStrictlySorted!1011 (insertStrictlySorted!601 l!750 key2!21 v2!10))))

(assert (=> d!165019 (= (insertStrictlySorted!601 (insertStrictlySorted!601 l!750 key2!21 v2!10) key1!37 v1!32) lt!674353)))

(declare-fun b!1573252 () Bool)

(declare-fun e!877271 () List!36791)

(assert (=> b!1573252 (= e!877271 call!72452)))

(declare-fun b!1573253 () Bool)

(assert (=> b!1573253 (= e!877269 call!72450)))

(declare-fun b!1573254 () Bool)

(assert (=> b!1573254 (= e!877273 call!72451)))

(declare-fun b!1573255 () Bool)

(assert (=> b!1573255 (= c!145836 (and (is-Cons!36787 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (bvsgt (_1!12731 (h!38252 (insertStrictlySorted!601 l!750 key2!21 v2!10))) key1!37)))))

(assert (=> b!1573255 (= e!877271 e!877273)))

(declare-fun b!1573256 () Bool)

(assert (=> b!1573256 (= e!877269 e!877271)))

(assert (=> b!1573256 (= c!145837 (and (is-Cons!36787 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (= (_1!12731 (h!38252 (insertStrictlySorted!601 l!750 key2!21 v2!10))) key1!37)))))

(declare-fun bm!72449 () Bool)

(assert (=> bm!72449 (= call!72450 ($colon$colon!1002 e!877272 (ite c!145839 (h!38252 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (tuple2!25441 key1!37 v1!32))))))

(declare-fun c!145838 () Bool)

(assert (=> bm!72449 (= c!145838 c!145839)))

(declare-fun b!1573257 () Bool)

(assert (=> b!1573257 (= e!877272 (insertStrictlySorted!601 (t!51694 (insertStrictlySorted!601 l!750 key2!21 v2!10)) key1!37 v1!32))))

(declare-fun b!1573258 () Bool)

(assert (=> b!1573258 (= e!877270 (contains!10477 lt!674353 (tuple2!25441 key1!37 v1!32)))))

(assert (= (and d!165019 c!145839) b!1573253))

(assert (= (and d!165019 (not c!145839)) b!1573256))

(assert (= (and b!1573256 c!145837) b!1573252))

(assert (= (and b!1573256 (not c!145837)) b!1573255))

(assert (= (and b!1573255 c!145836) b!1573254))

(assert (= (and b!1573255 (not c!145836)) b!1573251))

(assert (= (or b!1573254 b!1573251) bm!72447))

(assert (= (or b!1573252 bm!72447) bm!72448))

(assert (= (or b!1573253 bm!72448) bm!72449))

(assert (= (and bm!72449 c!145838) b!1573257))

(assert (= (and bm!72449 (not c!145838)) b!1573250))

(assert (= (and d!165019 res!1074090) b!1573249))

(assert (= (and b!1573249 res!1074091) b!1573258))

(declare-fun m!1447071 () Bool)

(assert (=> bm!72449 m!1447071))

(declare-fun m!1447075 () Bool)

(assert (=> b!1573249 m!1447075))

(declare-fun m!1447079 () Bool)

(assert (=> b!1573257 m!1447079))

(declare-fun m!1447081 () Bool)

(assert (=> b!1573258 m!1447081))

(declare-fun m!1447085 () Bool)

(assert (=> d!165019 m!1447085))

(assert (=> d!165019 m!1446989))

(declare-fun m!1447087 () Bool)

(assert (=> d!165019 m!1447087))

(assert (=> b!1573115 d!165019))

(declare-fun b!1573279 () Bool)

(declare-fun res!1074097 () Bool)

(declare-fun e!877285 () Bool)

(assert (=> b!1573279 (=> (not res!1074097) (not e!877285))))

(declare-fun lt!674356 () List!36791)

(assert (=> b!1573279 (= res!1074097 (containsKey!872 lt!674356 key2!21))))

(declare-fun bm!72456 () Bool)

(declare-fun call!72460 () List!36791)

(declare-fun call!72461 () List!36791)

(assert (=> bm!72456 (= call!72460 call!72461)))

(declare-fun e!877287 () List!36791)

(declare-fun b!1573280 () Bool)

(declare-fun c!145848 () Bool)

(declare-fun c!145849 () Bool)

(assert (=> b!1573280 (= e!877287 (ite c!145849 (t!51694 l!750) (ite c!145848 (Cons!36787 (h!38252 l!750) (t!51694 l!750)) Nil!36788)))))

(declare-fun bm!72457 () Bool)

(declare-fun call!72459 () List!36791)

(assert (=> bm!72457 (= call!72461 call!72459)))

(declare-fun b!1573281 () Bool)

(declare-fun e!877288 () List!36791)

(assert (=> b!1573281 (= e!877288 call!72460)))

(declare-fun d!165025 () Bool)

(assert (=> d!165025 e!877285))

(declare-fun res!1074096 () Bool)

(assert (=> d!165025 (=> (not res!1074096) (not e!877285))))

(assert (=> d!165025 (= res!1074096 (isStrictlySorted!1011 lt!674356))))

(declare-fun e!877284 () List!36791)

(assert (=> d!165025 (= lt!674356 e!877284)))

(declare-fun c!145851 () Bool)

(assert (=> d!165025 (= c!145851 (and (is-Cons!36787 l!750) (bvslt (_1!12731 (h!38252 l!750)) key2!21)))))

(assert (=> d!165025 (isStrictlySorted!1011 l!750)))

(assert (=> d!165025 (= (insertStrictlySorted!601 l!750 key2!21 v2!10) lt!674356)))

(declare-fun b!1573282 () Bool)

(declare-fun e!877286 () List!36791)

(assert (=> b!1573282 (= e!877286 call!72461)))

(declare-fun b!1573283 () Bool)

(assert (=> b!1573283 (= e!877284 call!72459)))

(declare-fun b!1573284 () Bool)

(assert (=> b!1573284 (= e!877288 call!72460)))

(declare-fun b!1573285 () Bool)

(assert (=> b!1573285 (= c!145848 (and (is-Cons!36787 l!750) (bvsgt (_1!12731 (h!38252 l!750)) key2!21)))))

(assert (=> b!1573285 (= e!877286 e!877288)))

(declare-fun b!1573286 () Bool)

(assert (=> b!1573286 (= e!877284 e!877286)))

(assert (=> b!1573286 (= c!145849 (and (is-Cons!36787 l!750) (= (_1!12731 (h!38252 l!750)) key2!21)))))

(declare-fun bm!72458 () Bool)

(assert (=> bm!72458 (= call!72459 ($colon$colon!1002 e!877287 (ite c!145851 (h!38252 l!750) (tuple2!25441 key2!21 v2!10))))))

(declare-fun c!145850 () Bool)

(assert (=> bm!72458 (= c!145850 c!145851)))

(declare-fun b!1573287 () Bool)

(assert (=> b!1573287 (= e!877287 (insertStrictlySorted!601 (t!51694 l!750) key2!21 v2!10))))

(declare-fun b!1573288 () Bool)

(assert (=> b!1573288 (= e!877285 (contains!10477 lt!674356 (tuple2!25441 key2!21 v2!10)))))

(assert (= (and d!165025 c!145851) b!1573283))

(assert (= (and d!165025 (not c!145851)) b!1573286))

(assert (= (and b!1573286 c!145849) b!1573282))

(assert (= (and b!1573286 (not c!145849)) b!1573285))

(assert (= (and b!1573285 c!145848) b!1573284))

(assert (= (and b!1573285 (not c!145848)) b!1573281))

(assert (= (or b!1573284 b!1573281) bm!72456))

(assert (= (or b!1573282 bm!72456) bm!72457))

(assert (= (or b!1573283 bm!72457) bm!72458))

(assert (= (and bm!72458 c!145850) b!1573287))

(assert (= (and bm!72458 (not c!145850)) b!1573280))

(assert (= (and d!165025 res!1074096) b!1573279))

(assert (= (and b!1573279 res!1074097) b!1573288))

(declare-fun m!1447107 () Bool)

(assert (=> bm!72458 m!1447107))

(declare-fun m!1447111 () Bool)

(assert (=> b!1573279 m!1447111))

(declare-fun m!1447115 () Bool)

(assert (=> b!1573287 m!1447115))

(declare-fun m!1447117 () Bool)

(assert (=> b!1573288 m!1447117))

(declare-fun m!1447121 () Bool)

(assert (=> d!165025 m!1447121))

(assert (=> d!165025 m!1446993))

(assert (=> b!1573115 d!165025))

(declare-fun d!165031 () Bool)

(declare-fun res!1074114 () Bool)

(declare-fun e!877311 () Bool)

(assert (=> d!165031 (=> res!1074114 e!877311)))

(assert (=> d!165031 (= res!1074114 (or (is-Nil!36788 l!750) (is-Nil!36788 (t!51694 l!750))))))

(assert (=> d!165031 (= (isStrictlySorted!1011 l!750) e!877311)))

(declare-fun b!1573321 () Bool)

(declare-fun e!877312 () Bool)

(assert (=> b!1573321 (= e!877311 e!877312)))

(declare-fun res!1074115 () Bool)

(assert (=> b!1573321 (=> (not res!1074115) (not e!877312))))

(assert (=> b!1573321 (= res!1074115 (bvslt (_1!12731 (h!38252 l!750)) (_1!12731 (h!38252 (t!51694 l!750)))))))

(declare-fun b!1573322 () Bool)

(assert (=> b!1573322 (= e!877312 (isStrictlySorted!1011 (t!51694 l!750)))))

(assert (= (and d!165031 (not res!1074114)) b!1573321))

(assert (= (and b!1573321 res!1074115) b!1573322))

(declare-fun m!1447137 () Bool)

(assert (=> b!1573322 m!1447137))

(assert (=> b!1573113 d!165031))

(declare-fun b!1573340 () Bool)

(declare-fun e!877324 () Bool)

(declare-fun tp!114243 () Bool)

(assert (=> b!1573340 (= e!877324 (and tp_is_empty!39105 tp!114243))))

(assert (=> b!1573116 (= tp!114234 e!877324)))

(assert (= (and b!1573116 (is-Cons!36787 (t!51694 l!750))) b!1573340))

(push 1)

(assert (not d!165019))

(assert (not b!1573257))

(assert (not b!1573340))

(assert (not bm!72449))

(assert (not d!165013))

(assert (not bm!72440))

(assert (not b!1573219))

(assert (not b!1573227))

(assert (not b!1573228))

(assert (not b!1573322))

(assert (not b!1573258))

(assert (not b!1573198))

(assert (not bm!72431))

(assert (not d!165025))

(assert (not b!1573287))

(assert (not b!1573288))

(assert (not b!1573279))

(assert (not bm!72458))

(assert tp_is_empty!39105)

(assert (not b!1573189))

(assert (not b!1573197))

(assert (not d!165007))

(assert (not b!1573249))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165129 () Bool)

(declare-fun lt!674381 () Bool)

(declare-fun content!812 (List!36791) (Set tuple2!25440))

(assert (=> d!165129 (= lt!674381 (member (tuple2!25441 key1!37 v1!32) (content!812 lt!674353)))))

(declare-fun e!877449 () Bool)

(assert (=> d!165129 (= lt!674381 e!877449)))

(declare-fun res!1074217 () Bool)

(assert (=> d!165129 (=> (not res!1074217) (not e!877449))))

(assert (=> d!165129 (= res!1074217 (is-Cons!36787 lt!674353))))

(assert (=> d!165129 (= (contains!10477 lt!674353 (tuple2!25441 key1!37 v1!32)) lt!674381)))

(declare-fun b!1573504 () Bool)

(declare-fun e!877448 () Bool)

(assert (=> b!1573504 (= e!877449 e!877448)))

(declare-fun res!1074216 () Bool)

(assert (=> b!1573504 (=> res!1074216 e!877448)))

(assert (=> b!1573504 (= res!1074216 (= (h!38252 lt!674353) (tuple2!25441 key1!37 v1!32)))))

(declare-fun b!1573505 () Bool)

(assert (=> b!1573505 (= e!877448 (contains!10477 (t!51694 lt!674353) (tuple2!25441 key1!37 v1!32)))))

(assert (= (and d!165129 res!1074217) b!1573504))

(assert (= (and b!1573504 (not res!1074216)) b!1573505))

(declare-fun m!1447315 () Bool)

(assert (=> d!165129 m!1447315))

(declare-fun m!1447317 () Bool)

(assert (=> d!165129 m!1447317))

(declare-fun m!1447319 () Bool)

(assert (=> b!1573505 m!1447319))

(assert (=> b!1573258 d!165129))

(declare-fun b!1573506 () Bool)

(declare-fun res!1074219 () Bool)

(declare-fun e!877451 () Bool)

(assert (=> b!1573506 (=> (not res!1074219) (not e!877451))))

(declare-fun lt!674382 () List!36791)

(assert (=> b!1573506 (= res!1074219 (containsKey!872 lt!674382 key2!21))))

(declare-fun bm!72489 () Bool)

(declare-fun call!72493 () List!36791)

(declare-fun call!72494 () List!36791)

(assert (=> bm!72489 (= call!72493 call!72494)))

(declare-fun c!145893 () Bool)

(declare-fun e!877453 () List!36791)

(declare-fun c!145892 () Bool)

(declare-fun b!1573507 () Bool)

(assert (=> b!1573507 (= e!877453 (ite c!145893 (t!51694 (t!51694 (insertStrictlySorted!601 l!750 key1!37 v1!32))) (ite c!145892 (Cons!36787 (h!38252 (t!51694 (insertStrictlySorted!601 l!750 key1!37 v1!32))) (t!51694 (t!51694 (insertStrictlySorted!601 l!750 key1!37 v1!32)))) Nil!36788)))))

(declare-fun bm!72490 () Bool)

(declare-fun call!72492 () List!36791)

(assert (=> bm!72490 (= call!72494 call!72492)))

(declare-fun b!1573508 () Bool)

(declare-fun e!877454 () List!36791)

(assert (=> b!1573508 (= e!877454 call!72493)))

(declare-fun d!165131 () Bool)

(assert (=> d!165131 e!877451))

(declare-fun res!1074218 () Bool)

(assert (=> d!165131 (=> (not res!1074218) (not e!877451))))

(assert (=> d!165131 (= res!1074218 (isStrictlySorted!1011 lt!674382))))

(declare-fun e!877450 () List!36791)

(assert (=> d!165131 (= lt!674382 e!877450)))

(declare-fun c!145895 () Bool)

(assert (=> d!165131 (= c!145895 (and (is-Cons!36787 (t!51694 (insertStrictlySorted!601 l!750 key1!37 v1!32))) (bvslt (_1!12731 (h!38252 (t!51694 (insertStrictlySorted!601 l!750 key1!37 v1!32)))) key2!21)))))

(assert (=> d!165131 (isStrictlySorted!1011 (t!51694 (insertStrictlySorted!601 l!750 key1!37 v1!32)))))

(assert (=> d!165131 (= (insertStrictlySorted!601 (t!51694 (insertStrictlySorted!601 l!750 key1!37 v1!32)) key2!21 v2!10) lt!674382)))

(declare-fun b!1573509 () Bool)

(declare-fun e!877452 () List!36791)

(assert (=> b!1573509 (= e!877452 call!72494)))

(declare-fun b!1573510 () Bool)

(assert (=> b!1573510 (= e!877450 call!72492)))

(declare-fun b!1573511 () Bool)

(assert (=> b!1573511 (= e!877454 call!72493)))

(declare-fun b!1573512 () Bool)

(assert (=> b!1573512 (= c!145892 (and (is-Cons!36787 (t!51694 (insertStrictlySorted!601 l!750 key1!37 v1!32))) (bvsgt (_1!12731 (h!38252 (t!51694 (insertStrictlySorted!601 l!750 key1!37 v1!32)))) key2!21)))))

(assert (=> b!1573512 (= e!877452 e!877454)))

(declare-fun b!1573513 () Bool)

(assert (=> b!1573513 (= e!877450 e!877452)))

(assert (=> b!1573513 (= c!145893 (and (is-Cons!36787 (t!51694 (insertStrictlySorted!601 l!750 key1!37 v1!32))) (= (_1!12731 (h!38252 (t!51694 (insertStrictlySorted!601 l!750 key1!37 v1!32)))) key2!21)))))

(declare-fun bm!72491 () Bool)

(assert (=> bm!72491 (= call!72492 ($colon$colon!1002 e!877453 (ite c!145895 (h!38252 (t!51694 (insertStrictlySorted!601 l!750 key1!37 v1!32))) (tuple2!25441 key2!21 v2!10))))))

(declare-fun c!145894 () Bool)

(assert (=> bm!72491 (= c!145894 c!145895)))

(declare-fun b!1573514 () Bool)

(assert (=> b!1573514 (= e!877453 (insertStrictlySorted!601 (t!51694 (t!51694 (insertStrictlySorted!601 l!750 key1!37 v1!32))) key2!21 v2!10))))

(declare-fun b!1573515 () Bool)

(assert (=> b!1573515 (= e!877451 (contains!10477 lt!674382 (tuple2!25441 key2!21 v2!10)))))

(assert (= (and d!165131 c!145895) b!1573510))

(assert (= (and d!165131 (not c!145895)) b!1573513))

(assert (= (and b!1573513 c!145893) b!1573509))

(assert (= (and b!1573513 (not c!145893)) b!1573512))

(assert (= (and b!1573512 c!145892) b!1573511))

(assert (= (and b!1573512 (not c!145892)) b!1573508))

(assert (= (or b!1573511 b!1573508) bm!72489))

(assert (= (or b!1573509 bm!72489) bm!72490))

(assert (= (or b!1573510 bm!72490) bm!72491))

(assert (= (and bm!72491 c!145894) b!1573514))

(assert (= (and bm!72491 (not c!145894)) b!1573507))

(assert (= (and d!165131 res!1074218) b!1573506))

(assert (= (and b!1573506 res!1074219) b!1573515))

(declare-fun m!1447321 () Bool)

(assert (=> bm!72491 m!1447321))

(declare-fun m!1447323 () Bool)

(assert (=> b!1573506 m!1447323))

(declare-fun m!1447325 () Bool)

(assert (=> b!1573514 m!1447325))

(declare-fun m!1447327 () Bool)

(assert (=> b!1573515 m!1447327))

(declare-fun m!1447329 () Bool)

(assert (=> d!165131 m!1447329))

(declare-fun m!1447331 () Bool)

(assert (=> d!165131 m!1447331))

(assert (=> b!1573197 d!165131))

(declare-fun d!165133 () Bool)

(declare-fun res!1074224 () Bool)

(declare-fun e!877459 () Bool)

(assert (=> d!165133 (=> res!1074224 e!877459)))

(assert (=> d!165133 (= res!1074224 (and (is-Cons!36787 lt!674347) (= (_1!12731 (h!38252 lt!674347)) key2!21)))))

(assert (=> d!165133 (= (containsKey!872 lt!674347 key2!21) e!877459)))

(declare-fun b!1573520 () Bool)

(declare-fun e!877460 () Bool)

(assert (=> b!1573520 (= e!877459 e!877460)))

(declare-fun res!1074225 () Bool)

(assert (=> b!1573520 (=> (not res!1074225) (not e!877460))))

(assert (=> b!1573520 (= res!1074225 (and (or (not (is-Cons!36787 lt!674347)) (bvsle (_1!12731 (h!38252 lt!674347)) key2!21)) (is-Cons!36787 lt!674347) (bvslt (_1!12731 (h!38252 lt!674347)) key2!21)))))

(declare-fun b!1573521 () Bool)

(assert (=> b!1573521 (= e!877460 (containsKey!872 (t!51694 lt!674347) key2!21))))

(assert (= (and d!165133 (not res!1074224)) b!1573520))

(assert (= (and b!1573520 res!1074225) b!1573521))

(declare-fun m!1447333 () Bool)

(assert (=> b!1573521 m!1447333))

(assert (=> b!1573189 d!165133))

(declare-fun d!165135 () Bool)

(declare-fun res!1074226 () Bool)

(declare-fun e!877461 () Bool)

(assert (=> d!165135 (=> res!1074226 e!877461)))

(assert (=> d!165135 (= res!1074226 (or (is-Nil!36788 lt!674347) (is-Nil!36788 (t!51694 lt!674347))))))

(assert (=> d!165135 (= (isStrictlySorted!1011 lt!674347) e!877461)))

(declare-fun b!1573522 () Bool)

(declare-fun e!877462 () Bool)

(assert (=> b!1573522 (= e!877461 e!877462)))

(declare-fun res!1074227 () Bool)

(assert (=> b!1573522 (=> (not res!1074227) (not e!877462))))

(assert (=> b!1573522 (= res!1074227 (bvslt (_1!12731 (h!38252 lt!674347)) (_1!12731 (h!38252 (t!51694 lt!674347)))))))

(declare-fun b!1573523 () Bool)

(assert (=> b!1573523 (= e!877462 (isStrictlySorted!1011 (t!51694 lt!674347)))))

(assert (= (and d!165135 (not res!1074226)) b!1573522))

(assert (= (and b!1573522 res!1074227) b!1573523))

(declare-fun m!1447335 () Bool)

(assert (=> b!1573523 m!1447335))

(assert (=> d!165007 d!165135))

(declare-fun d!165137 () Bool)

(declare-fun res!1074228 () Bool)

(declare-fun e!877463 () Bool)

(assert (=> d!165137 (=> res!1074228 e!877463)))

(assert (=> d!165137 (= res!1074228 (or (is-Nil!36788 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (is-Nil!36788 (t!51694 (insertStrictlySorted!601 l!750 key1!37 v1!32)))))))

(assert (=> d!165137 (= (isStrictlySorted!1011 (insertStrictlySorted!601 l!750 key1!37 v1!32)) e!877463)))

(declare-fun b!1573524 () Bool)

(declare-fun e!877464 () Bool)

(assert (=> b!1573524 (= e!877463 e!877464)))

(declare-fun res!1074229 () Bool)

(assert (=> b!1573524 (=> (not res!1074229) (not e!877464))))

(assert (=> b!1573524 (= res!1074229 (bvslt (_1!12731 (h!38252 (insertStrictlySorted!601 l!750 key1!37 v1!32))) (_1!12731 (h!38252 (t!51694 (insertStrictlySorted!601 l!750 key1!37 v1!32))))))))

(declare-fun b!1573525 () Bool)

(assert (=> b!1573525 (= e!877464 (isStrictlySorted!1011 (t!51694 (insertStrictlySorted!601 l!750 key1!37 v1!32))))))

(assert (= (and d!165137 (not res!1074228)) b!1573524))

(assert (= (and b!1573524 res!1074229) b!1573525))

(assert (=> b!1573525 m!1447331))

(assert (=> d!165007 d!165137))

(declare-fun b!1573526 () Bool)

(declare-fun res!1074231 () Bool)

(declare-fun e!877466 () Bool)

(assert (=> b!1573526 (=> (not res!1074231) (not e!877466))))

(declare-fun lt!674383 () List!36791)

(assert (=> b!1573526 (= res!1074231 (containsKey!872 lt!674383 key1!37))))

(declare-fun bm!72492 () Bool)

(declare-fun call!72496 () List!36791)

(declare-fun call!72497 () List!36791)

(assert (=> bm!72492 (= call!72496 call!72497)))

(declare-fun c!145896 () Bool)

(declare-fun e!877468 () List!36791)

(declare-fun c!145897 () Bool)

(declare-fun b!1573527 () Bool)

(assert (=> b!1573527 (= e!877468 (ite c!145897 (t!51694 (t!51694 (insertStrictlySorted!601 l!750 key2!21 v2!10))) (ite c!145896 (Cons!36787 (h!38252 (t!51694 (insertStrictlySorted!601 l!750 key2!21 v2!10))) (t!51694 (t!51694 (insertStrictlySorted!601 l!750 key2!21 v2!10)))) Nil!36788)))))

(declare-fun bm!72493 () Bool)

(declare-fun call!72495 () List!36791)

(assert (=> bm!72493 (= call!72497 call!72495)))

(declare-fun b!1573528 () Bool)

(declare-fun e!877469 () List!36791)

(assert (=> b!1573528 (= e!877469 call!72496)))

(declare-fun d!165139 () Bool)

(assert (=> d!165139 e!877466))

(declare-fun res!1074230 () Bool)

(assert (=> d!165139 (=> (not res!1074230) (not e!877466))))

(assert (=> d!165139 (= res!1074230 (isStrictlySorted!1011 lt!674383))))

(declare-fun e!877465 () List!36791)

(assert (=> d!165139 (= lt!674383 e!877465)))

(declare-fun c!145899 () Bool)

(assert (=> d!165139 (= c!145899 (and (is-Cons!36787 (t!51694 (insertStrictlySorted!601 l!750 key2!21 v2!10))) (bvslt (_1!12731 (h!38252 (t!51694 (insertStrictlySorted!601 l!750 key2!21 v2!10)))) key1!37)))))

(assert (=> d!165139 (isStrictlySorted!1011 (t!51694 (insertStrictlySorted!601 l!750 key2!21 v2!10)))))

(assert (=> d!165139 (= (insertStrictlySorted!601 (t!51694 (insertStrictlySorted!601 l!750 key2!21 v2!10)) key1!37 v1!32) lt!674383)))

(declare-fun b!1573529 () Bool)

(declare-fun e!877467 () List!36791)

(assert (=> b!1573529 (= e!877467 call!72497)))

(declare-fun b!1573530 () Bool)

(assert (=> b!1573530 (= e!877465 call!72495)))

(declare-fun b!1573531 () Bool)

(assert (=> b!1573531 (= e!877469 call!72496)))

(declare-fun b!1573532 () Bool)

(assert (=> b!1573532 (= c!145896 (and (is-Cons!36787 (t!51694 (insertStrictlySorted!601 l!750 key2!21 v2!10))) (bvsgt (_1!12731 (h!38252 (t!51694 (insertStrictlySorted!601 l!750 key2!21 v2!10)))) key1!37)))))

(assert (=> b!1573532 (= e!877467 e!877469)))

(declare-fun b!1573533 () Bool)

(assert (=> b!1573533 (= e!877465 e!877467)))

(assert (=> b!1573533 (= c!145897 (and (is-Cons!36787 (t!51694 (insertStrictlySorted!601 l!750 key2!21 v2!10))) (= (_1!12731 (h!38252 (t!51694 (insertStrictlySorted!601 l!750 key2!21 v2!10)))) key1!37)))))

(declare-fun bm!72494 () Bool)

(assert (=> bm!72494 (= call!72495 ($colon$colon!1002 e!877468 (ite c!145899 (h!38252 (t!51694 (insertStrictlySorted!601 l!750 key2!21 v2!10))) (tuple2!25441 key1!37 v1!32))))))

(declare-fun c!145898 () Bool)

(assert (=> bm!72494 (= c!145898 c!145899)))

(declare-fun b!1573534 () Bool)

(assert (=> b!1573534 (= e!877468 (insertStrictlySorted!601 (t!51694 (t!51694 (insertStrictlySorted!601 l!750 key2!21 v2!10))) key1!37 v1!32))))

(declare-fun b!1573535 () Bool)

(assert (=> b!1573535 (= e!877466 (contains!10477 lt!674383 (tuple2!25441 key1!37 v1!32)))))

(assert (= (and d!165139 c!145899) b!1573530))

(assert (= (and d!165139 (not c!145899)) b!1573533))

(assert (= (and b!1573533 c!145897) b!1573529))

(assert (= (and b!1573533 (not c!145897)) b!1573532))

(assert (= (and b!1573532 c!145896) b!1573531))

(assert (= (and b!1573532 (not c!145896)) b!1573528))

(assert (= (or b!1573531 b!1573528) bm!72492))

(assert (= (or b!1573529 bm!72492) bm!72493))

(assert (= (or b!1573530 bm!72493) bm!72494))

(assert (= (and bm!72494 c!145898) b!1573534))

(assert (= (and bm!72494 (not c!145898)) b!1573527))

(assert (= (and d!165139 res!1074230) b!1573526))

(assert (= (and b!1573526 res!1074231) b!1573535))

(declare-fun m!1447337 () Bool)

(assert (=> bm!72494 m!1447337))

(declare-fun m!1447339 () Bool)

(assert (=> b!1573526 m!1447339))

(declare-fun m!1447341 () Bool)

(assert (=> b!1573534 m!1447341))

(declare-fun m!1447343 () Bool)

(assert (=> b!1573535 m!1447343))

(declare-fun m!1447345 () Bool)

(assert (=> d!165139 m!1447345))

(declare-fun m!1447347 () Bool)

(assert (=> d!165139 m!1447347))

(assert (=> b!1573257 d!165139))

(declare-fun d!165141 () Bool)

(assert (=> d!165141 (= ($colon$colon!1002 e!877242 (ite c!145815 (h!38252 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (tuple2!25441 key2!21 v2!10))) (Cons!36787 (ite c!145815 (h!38252 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (tuple2!25441 key2!21 v2!10)) e!877242))))

(assert (=> bm!72431 d!165141))

(declare-fun d!165143 () Bool)

(declare-fun res!1074232 () Bool)

(declare-fun e!877470 () Bool)

(assert (=> d!165143 (=> res!1074232 e!877470)))

(assert (=> d!165143 (= res!1074232 (and (is-Cons!36787 lt!674353) (= (_1!12731 (h!38252 lt!674353)) key1!37)))))

(assert (=> d!165143 (= (containsKey!872 lt!674353 key1!37) e!877470)))

(declare-fun b!1573536 () Bool)

(declare-fun e!877471 () Bool)

(assert (=> b!1573536 (= e!877470 e!877471)))

(declare-fun res!1074233 () Bool)

(assert (=> b!1573536 (=> (not res!1074233) (not e!877471))))

(assert (=> b!1573536 (= res!1074233 (and (or (not (is-Cons!36787 lt!674353)) (bvsle (_1!12731 (h!38252 lt!674353)) key1!37)) (is-Cons!36787 lt!674353) (bvslt (_1!12731 (h!38252 lt!674353)) key1!37)))))

(declare-fun b!1573537 () Bool)

(assert (=> b!1573537 (= e!877471 (containsKey!872 (t!51694 lt!674353) key1!37))))

(assert (= (and d!165143 (not res!1074232)) b!1573536))

(assert (= (and b!1573536 res!1074233) b!1573537))

(declare-fun m!1447349 () Bool)

(assert (=> b!1573537 m!1447349))

(assert (=> b!1573249 d!165143))

(declare-fun d!165145 () Bool)

(declare-fun res!1074234 () Bool)

(declare-fun e!877472 () Bool)

(assert (=> d!165145 (=> res!1074234 e!877472)))

(assert (=> d!165145 (= res!1074234 (or (is-Nil!36788 lt!674353) (is-Nil!36788 (t!51694 lt!674353))))))

(assert (=> d!165145 (= (isStrictlySorted!1011 lt!674353) e!877472)))

(declare-fun b!1573538 () Bool)

(declare-fun e!877473 () Bool)

(assert (=> b!1573538 (= e!877472 e!877473)))

(declare-fun res!1074235 () Bool)

(assert (=> b!1573538 (=> (not res!1074235) (not e!877473))))

(assert (=> b!1573538 (= res!1074235 (bvslt (_1!12731 (h!38252 lt!674353)) (_1!12731 (h!38252 (t!51694 lt!674353)))))))

(declare-fun b!1573539 () Bool)

(assert (=> b!1573539 (= e!877473 (isStrictlySorted!1011 (t!51694 lt!674353)))))

(assert (= (and d!165145 (not res!1074234)) b!1573538))

(assert (= (and b!1573538 res!1074235) b!1573539))

(declare-fun m!1447351 () Bool)

(assert (=> b!1573539 m!1447351))

(assert (=> d!165019 d!165145))

(declare-fun d!165147 () Bool)

(declare-fun res!1074236 () Bool)

(declare-fun e!877474 () Bool)

(assert (=> d!165147 (=> res!1074236 e!877474)))

(assert (=> d!165147 (= res!1074236 (or (is-Nil!36788 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (is-Nil!36788 (t!51694 (insertStrictlySorted!601 l!750 key2!21 v2!10)))))))

(assert (=> d!165147 (= (isStrictlySorted!1011 (insertStrictlySorted!601 l!750 key2!21 v2!10)) e!877474)))

(declare-fun b!1573540 () Bool)

(declare-fun e!877475 () Bool)

(assert (=> b!1573540 (= e!877474 e!877475)))

(declare-fun res!1074237 () Bool)

(assert (=> b!1573540 (=> (not res!1074237) (not e!877475))))

(assert (=> b!1573540 (= res!1074237 (bvslt (_1!12731 (h!38252 (insertStrictlySorted!601 l!750 key2!21 v2!10))) (_1!12731 (h!38252 (t!51694 (insertStrictlySorted!601 l!750 key2!21 v2!10))))))))

(declare-fun b!1573541 () Bool)

(assert (=> b!1573541 (= e!877475 (isStrictlySorted!1011 (t!51694 (insertStrictlySorted!601 l!750 key2!21 v2!10))))))

(assert (= (and d!165147 (not res!1074236)) b!1573540))

(assert (= (and b!1573540 res!1074237) b!1573541))

(assert (=> b!1573541 m!1447347))

(assert (=> d!165019 d!165147))

(declare-fun d!165149 () Bool)

(assert (=> d!165149 (= ($colon$colon!1002 e!877272 (ite c!145839 (h!38252 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (tuple2!25441 key1!37 v1!32))) (Cons!36787 (ite c!145839 (h!38252 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (tuple2!25441 key1!37 v1!32)) e!877272))))

(assert (=> bm!72449 d!165149))

(declare-fun d!165151 () Bool)

(declare-fun res!1074238 () Bool)

(declare-fun e!877476 () Bool)

(assert (=> d!165151 (=> res!1074238 e!877476)))

(assert (=> d!165151 (= res!1074238 (or (is-Nil!36788 lt!674356) (is-Nil!36788 (t!51694 lt!674356))))))

(assert (=> d!165151 (= (isStrictlySorted!1011 lt!674356) e!877476)))

(declare-fun b!1573542 () Bool)

(declare-fun e!877477 () Bool)

(assert (=> b!1573542 (= e!877476 e!877477)))

(declare-fun res!1074239 () Bool)

(assert (=> b!1573542 (=> (not res!1074239) (not e!877477))))

(assert (=> b!1573542 (= res!1074239 (bvslt (_1!12731 (h!38252 lt!674356)) (_1!12731 (h!38252 (t!51694 lt!674356)))))))

(declare-fun b!1573543 () Bool)

(assert (=> b!1573543 (= e!877477 (isStrictlySorted!1011 (t!51694 lt!674356)))))

(assert (= (and d!165151 (not res!1074238)) b!1573542))

(assert (= (and b!1573542 res!1074239) b!1573543))

(declare-fun m!1447353 () Bool)

(assert (=> b!1573543 m!1447353))

(assert (=> d!165025 d!165151))

(assert (=> d!165025 d!165031))

(declare-fun d!165153 () Bool)

(declare-fun lt!674384 () Bool)

(assert (=> d!165153 (= lt!674384 (member (tuple2!25441 key2!21 v2!10) (content!812 lt!674356)))))

(declare-fun e!877479 () Bool)

(assert (=> d!165153 (= lt!674384 e!877479)))

(declare-fun res!1074241 () Bool)

(assert (=> d!165153 (=> (not res!1074241) (not e!877479))))

(assert (=> d!165153 (= res!1074241 (is-Cons!36787 lt!674356))))

(assert (=> d!165153 (= (contains!10477 lt!674356 (tuple2!25441 key2!21 v2!10)) lt!674384)))

(declare-fun b!1573544 () Bool)

(declare-fun e!877478 () Bool)

(assert (=> b!1573544 (= e!877479 e!877478)))

(declare-fun res!1074240 () Bool)

(assert (=> b!1573544 (=> res!1074240 e!877478)))

(assert (=> b!1573544 (= res!1074240 (= (h!38252 lt!674356) (tuple2!25441 key2!21 v2!10)))))

(declare-fun b!1573545 () Bool)

(assert (=> b!1573545 (= e!877478 (contains!10477 (t!51694 lt!674356) (tuple2!25441 key2!21 v2!10)))))

(assert (= (and d!165153 res!1074241) b!1573544))

(assert (= (and b!1573544 (not res!1074240)) b!1573545))

(declare-fun m!1447355 () Bool)

(assert (=> d!165153 m!1447355))

(declare-fun m!1447357 () Bool)

(assert (=> d!165153 m!1447357))

(declare-fun m!1447359 () Bool)

(assert (=> b!1573545 m!1447359))

(assert (=> b!1573288 d!165153))

(declare-fun d!165155 () Bool)

(declare-fun lt!674385 () Bool)

(assert (=> d!165155 (= lt!674385 (member (tuple2!25441 key1!37 v1!32) (content!812 lt!674350)))))

(declare-fun e!877481 () Bool)

(assert (=> d!165155 (= lt!674385 e!877481)))

(declare-fun res!1074243 () Bool)

(assert (=> d!165155 (=> (not res!1074243) (not e!877481))))

(assert (=> d!165155 (= res!1074243 (is-Cons!36787 lt!674350))))

(assert (=> d!165155 (= (contains!10477 lt!674350 (tuple2!25441 key1!37 v1!32)) lt!674385)))

(declare-fun b!1573546 () Bool)

(declare-fun e!877480 () Bool)

(assert (=> b!1573546 (= e!877481 e!877480)))

(declare-fun res!1074242 () Bool)

(assert (=> b!1573546 (=> res!1074242 e!877480)))

(assert (=> b!1573546 (= res!1074242 (= (h!38252 lt!674350) (tuple2!25441 key1!37 v1!32)))))

(declare-fun b!1573547 () Bool)

(assert (=> b!1573547 (= e!877480 (contains!10477 (t!51694 lt!674350) (tuple2!25441 key1!37 v1!32)))))

(assert (= (and d!165155 res!1074243) b!1573546))

(assert (= (and b!1573546 (not res!1074242)) b!1573547))

(declare-fun m!1447361 () Bool)

(assert (=> d!165155 m!1447361))

(declare-fun m!1447363 () Bool)

(assert (=> d!165155 m!1447363))

(declare-fun m!1447365 () Bool)

(assert (=> b!1573547 m!1447365))

(assert (=> b!1573228 d!165155))

(declare-fun b!1573548 () Bool)

(declare-fun res!1074245 () Bool)

(declare-fun e!877483 () Bool)

(assert (=> b!1573548 (=> (not res!1074245) (not e!877483))))

(declare-fun lt!674386 () List!36791)

(assert (=> b!1573548 (= res!1074245 (containsKey!872 lt!674386 key2!21))))

(declare-fun bm!72495 () Bool)

(declare-fun call!72499 () List!36791)

(declare-fun call!72500 () List!36791)

(assert (=> bm!72495 (= call!72499 call!72500)))

(declare-fun c!145900 () Bool)

(declare-fun e!877485 () List!36791)

(declare-fun b!1573549 () Bool)

(declare-fun c!145901 () Bool)

(assert (=> b!1573549 (= e!877485 (ite c!145901 (t!51694 (t!51694 l!750)) (ite c!145900 (Cons!36787 (h!38252 (t!51694 l!750)) (t!51694 (t!51694 l!750))) Nil!36788)))))

(declare-fun bm!72496 () Bool)

(declare-fun call!72498 () List!36791)

(assert (=> bm!72496 (= call!72500 call!72498)))

(declare-fun b!1573550 () Bool)

(declare-fun e!877486 () List!36791)

(assert (=> b!1573550 (= e!877486 call!72499)))

(declare-fun d!165157 () Bool)

(assert (=> d!165157 e!877483))

(declare-fun res!1074244 () Bool)

(assert (=> d!165157 (=> (not res!1074244) (not e!877483))))

(assert (=> d!165157 (= res!1074244 (isStrictlySorted!1011 lt!674386))))

(declare-fun e!877482 () List!36791)

(assert (=> d!165157 (= lt!674386 e!877482)))

(declare-fun c!145903 () Bool)

(assert (=> d!165157 (= c!145903 (and (is-Cons!36787 (t!51694 l!750)) (bvslt (_1!12731 (h!38252 (t!51694 l!750))) key2!21)))))

(assert (=> d!165157 (isStrictlySorted!1011 (t!51694 l!750))))

(assert (=> d!165157 (= (insertStrictlySorted!601 (t!51694 l!750) key2!21 v2!10) lt!674386)))

(declare-fun b!1573551 () Bool)

(declare-fun e!877484 () List!36791)

(assert (=> b!1573551 (= e!877484 call!72500)))

(declare-fun b!1573552 () Bool)

(assert (=> b!1573552 (= e!877482 call!72498)))

(declare-fun b!1573553 () Bool)

(assert (=> b!1573553 (= e!877486 call!72499)))

(declare-fun b!1573554 () Bool)

(assert (=> b!1573554 (= c!145900 (and (is-Cons!36787 (t!51694 l!750)) (bvsgt (_1!12731 (h!38252 (t!51694 l!750))) key2!21)))))

(assert (=> b!1573554 (= e!877484 e!877486)))

(declare-fun b!1573555 () Bool)

(assert (=> b!1573555 (= e!877482 e!877484)))

(assert (=> b!1573555 (= c!145901 (and (is-Cons!36787 (t!51694 l!750)) (= (_1!12731 (h!38252 (t!51694 l!750))) key2!21)))))

(declare-fun bm!72497 () Bool)

(assert (=> bm!72497 (= call!72498 ($colon$colon!1002 e!877485 (ite c!145903 (h!38252 (t!51694 l!750)) (tuple2!25441 key2!21 v2!10))))))

(declare-fun c!145902 () Bool)

(assert (=> bm!72497 (= c!145902 c!145903)))

(declare-fun b!1573556 () Bool)

(assert (=> b!1573556 (= e!877485 (insertStrictlySorted!601 (t!51694 (t!51694 l!750)) key2!21 v2!10))))

(declare-fun b!1573557 () Bool)

(assert (=> b!1573557 (= e!877483 (contains!10477 lt!674386 (tuple2!25441 key2!21 v2!10)))))

(assert (= (and d!165157 c!145903) b!1573552))

(assert (= (and d!165157 (not c!145903)) b!1573555))

(assert (= (and b!1573555 c!145901) b!1573551))

(assert (= (and b!1573555 (not c!145901)) b!1573554))

(assert (= (and b!1573554 c!145900) b!1573553))

(assert (= (and b!1573554 (not c!145900)) b!1573550))

(assert (= (or b!1573553 b!1573550) bm!72495))

(assert (= (or b!1573551 bm!72495) bm!72496))

(assert (= (or b!1573552 bm!72496) bm!72497))

(assert (= (and bm!72497 c!145902) b!1573556))

(assert (= (and bm!72497 (not c!145902)) b!1573549))

(assert (= (and d!165157 res!1074244) b!1573548))

(assert (= (and b!1573548 res!1074245) b!1573557))

(declare-fun m!1447367 () Bool)

(assert (=> bm!72497 m!1447367))

(declare-fun m!1447369 () Bool)

(assert (=> b!1573548 m!1447369))

(declare-fun m!1447371 () Bool)

(assert (=> b!1573556 m!1447371))

(declare-fun m!1447373 () Bool)

(assert (=> b!1573557 m!1447373))

(declare-fun m!1447375 () Bool)

(assert (=> d!165157 m!1447375))

(assert (=> d!165157 m!1447137))

(assert (=> b!1573287 d!165157))

(declare-fun b!1573558 () Bool)

(declare-fun res!1074247 () Bool)

(declare-fun e!877488 () Bool)

(assert (=> b!1573558 (=> (not res!1074247) (not e!877488))))

(declare-fun lt!674387 () List!36791)

(assert (=> b!1573558 (= res!1074247 (containsKey!872 lt!674387 key1!37))))

(declare-fun bm!72498 () Bool)

(declare-fun call!72502 () List!36791)

(declare-fun call!72503 () List!36791)

(assert (=> bm!72498 (= call!72502 call!72503)))

(declare-fun e!877490 () List!36791)

(declare-fun c!145904 () Bool)

(declare-fun b!1573559 () Bool)

(declare-fun c!145905 () Bool)

(assert (=> b!1573559 (= e!877490 (ite c!145905 (t!51694 (t!51694 l!750)) (ite c!145904 (Cons!36787 (h!38252 (t!51694 l!750)) (t!51694 (t!51694 l!750))) Nil!36788)))))

(declare-fun bm!72499 () Bool)

(declare-fun call!72501 () List!36791)

(assert (=> bm!72499 (= call!72503 call!72501)))

(declare-fun b!1573560 () Bool)

(declare-fun e!877491 () List!36791)

(assert (=> b!1573560 (= e!877491 call!72502)))

(declare-fun d!165159 () Bool)

(assert (=> d!165159 e!877488))

(declare-fun res!1074246 () Bool)

(assert (=> d!165159 (=> (not res!1074246) (not e!877488))))

(assert (=> d!165159 (= res!1074246 (isStrictlySorted!1011 lt!674387))))

(declare-fun e!877487 () List!36791)

(assert (=> d!165159 (= lt!674387 e!877487)))

(declare-fun c!145907 () Bool)

(assert (=> d!165159 (= c!145907 (and (is-Cons!36787 (t!51694 l!750)) (bvslt (_1!12731 (h!38252 (t!51694 l!750))) key1!37)))))

(assert (=> d!165159 (isStrictlySorted!1011 (t!51694 l!750))))

(assert (=> d!165159 (= (insertStrictlySorted!601 (t!51694 l!750) key1!37 v1!32) lt!674387)))

(declare-fun b!1573561 () Bool)

(declare-fun e!877489 () List!36791)

(assert (=> b!1573561 (= e!877489 call!72503)))

(declare-fun b!1573562 () Bool)

(assert (=> b!1573562 (= e!877487 call!72501)))

(declare-fun b!1573563 () Bool)

(assert (=> b!1573563 (= e!877491 call!72502)))

(declare-fun b!1573564 () Bool)

(assert (=> b!1573564 (= c!145904 (and (is-Cons!36787 (t!51694 l!750)) (bvsgt (_1!12731 (h!38252 (t!51694 l!750))) key1!37)))))

(assert (=> b!1573564 (= e!877489 e!877491)))

(declare-fun b!1573565 () Bool)

(assert (=> b!1573565 (= e!877487 e!877489)))

(assert (=> b!1573565 (= c!145905 (and (is-Cons!36787 (t!51694 l!750)) (= (_1!12731 (h!38252 (t!51694 l!750))) key1!37)))))

(declare-fun bm!72500 () Bool)

(assert (=> bm!72500 (= call!72501 ($colon$colon!1002 e!877490 (ite c!145907 (h!38252 (t!51694 l!750)) (tuple2!25441 key1!37 v1!32))))))

(declare-fun c!145906 () Bool)

(assert (=> bm!72500 (= c!145906 c!145907)))

(declare-fun b!1573566 () Bool)

(assert (=> b!1573566 (= e!877490 (insertStrictlySorted!601 (t!51694 (t!51694 l!750)) key1!37 v1!32))))

(declare-fun b!1573567 () Bool)

(assert (=> b!1573567 (= e!877488 (contains!10477 lt!674387 (tuple2!25441 key1!37 v1!32)))))

(assert (= (and d!165159 c!145907) b!1573562))

(assert (= (and d!165159 (not c!145907)) b!1573565))

(assert (= (and b!1573565 c!145905) b!1573561))

(assert (= (and b!1573565 (not c!145905)) b!1573564))

(assert (= (and b!1573564 c!145904) b!1573563))

(assert (= (and b!1573564 (not c!145904)) b!1573560))

(assert (= (or b!1573563 b!1573560) bm!72498))

(assert (= (or b!1573561 bm!72498) bm!72499))

(assert (= (or b!1573562 bm!72499) bm!72500))

(assert (= (and bm!72500 c!145906) b!1573566))

(assert (= (and bm!72500 (not c!145906)) b!1573559))

(assert (= (and d!165159 res!1074246) b!1573558))

(assert (= (and b!1573558 res!1074247) b!1573567))

(declare-fun m!1447377 () Bool)

(assert (=> bm!72500 m!1447377))

(declare-fun m!1447379 () Bool)

(assert (=> b!1573558 m!1447379))

(declare-fun m!1447381 () Bool)

(assert (=> b!1573566 m!1447381))

(declare-fun m!1447383 () Bool)

(assert (=> b!1573567 m!1447383))

(declare-fun m!1447385 () Bool)

(assert (=> d!165159 m!1447385))

(assert (=> d!165159 m!1447137))

(assert (=> b!1573227 d!165159))

(declare-fun d!165161 () Bool)

(assert (=> d!165161 (= ($colon$colon!1002 e!877287 (ite c!145851 (h!38252 l!750) (tuple2!25441 key2!21 v2!10))) (Cons!36787 (ite c!145851 (h!38252 l!750) (tuple2!25441 key2!21 v2!10)) e!877287))))

(assert (=> bm!72458 d!165161))

(declare-fun d!165163 () Bool)

(assert (=> d!165163 (= ($colon$colon!1002 e!877257 (ite c!145827 (h!38252 l!750) (tuple2!25441 key1!37 v1!32))) (Cons!36787 (ite c!145827 (h!38252 l!750) (tuple2!25441 key1!37 v1!32)) e!877257))))

(assert (=> bm!72440 d!165163))

(declare-fun d!165165 () Bool)

(declare-fun res!1074248 () Bool)

(declare-fun e!877492 () Bool)

(assert (=> d!165165 (=> res!1074248 e!877492)))

(assert (=> d!165165 (= res!1074248 (or (is-Nil!36788 lt!674350) (is-Nil!36788 (t!51694 lt!674350))))))

(assert (=> d!165165 (= (isStrictlySorted!1011 lt!674350) e!877492)))

(declare-fun b!1573568 () Bool)

(declare-fun e!877493 () Bool)

(assert (=> b!1573568 (= e!877492 e!877493)))

(declare-fun res!1074249 () Bool)

(assert (=> b!1573568 (=> (not res!1074249) (not e!877493))))

(assert (=> b!1573568 (= res!1074249 (bvslt (_1!12731 (h!38252 lt!674350)) (_1!12731 (h!38252 (t!51694 lt!674350)))))))

(declare-fun b!1573569 () Bool)

(assert (=> b!1573569 (= e!877493 (isStrictlySorted!1011 (t!51694 lt!674350)))))

(assert (= (and d!165165 (not res!1074248)) b!1573568))

(assert (= (and b!1573568 res!1074249) b!1573569))

(declare-fun m!1447387 () Bool)

(assert (=> b!1573569 m!1447387))

(assert (=> d!165013 d!165165))

(assert (=> d!165013 d!165031))

(declare-fun d!165167 () Bool)

(declare-fun res!1074250 () Bool)

(declare-fun e!877494 () Bool)

(assert (=> d!165167 (=> res!1074250 e!877494)))

(assert (=> d!165167 (= res!1074250 (and (is-Cons!36787 lt!674356) (= (_1!12731 (h!38252 lt!674356)) key2!21)))))

(assert (=> d!165167 (= (containsKey!872 lt!674356 key2!21) e!877494)))

(declare-fun b!1573570 () Bool)

(declare-fun e!877495 () Bool)

(assert (=> b!1573570 (= e!877494 e!877495)))

(declare-fun res!1074251 () Bool)

(assert (=> b!1573570 (=> (not res!1074251) (not e!877495))))

(assert (=> b!1573570 (= res!1074251 (and (or (not (is-Cons!36787 lt!674356)) (bvsle (_1!12731 (h!38252 lt!674356)) key2!21)) (is-Cons!36787 lt!674356) (bvslt (_1!12731 (h!38252 lt!674356)) key2!21)))))

(declare-fun b!1573571 () Bool)

(assert (=> b!1573571 (= e!877495 (containsKey!872 (t!51694 lt!674356) key2!21))))

(assert (= (and d!165167 (not res!1074250)) b!1573570))

(assert (= (and b!1573570 res!1074251) b!1573571))

(declare-fun m!1447389 () Bool)

(assert (=> b!1573571 m!1447389))

(assert (=> b!1573279 d!165167))

(declare-fun d!165169 () Bool)

(declare-fun res!1074252 () Bool)

(declare-fun e!877496 () Bool)

(assert (=> d!165169 (=> res!1074252 e!877496)))

(assert (=> d!165169 (= res!1074252 (or (is-Nil!36788 (t!51694 l!750)) (is-Nil!36788 (t!51694 (t!51694 l!750)))))))

(assert (=> d!165169 (= (isStrictlySorted!1011 (t!51694 l!750)) e!877496)))

(declare-fun b!1573572 () Bool)

(declare-fun e!877497 () Bool)

(assert (=> b!1573572 (= e!877496 e!877497)))

(declare-fun res!1074253 () Bool)

(assert (=> b!1573572 (=> (not res!1074253) (not e!877497))))

(assert (=> b!1573572 (= res!1074253 (bvslt (_1!12731 (h!38252 (t!51694 l!750))) (_1!12731 (h!38252 (t!51694 (t!51694 l!750))))))))

(declare-fun b!1573573 () Bool)

(assert (=> b!1573573 (= e!877497 (isStrictlySorted!1011 (t!51694 (t!51694 l!750))))))

(assert (= (and d!165169 (not res!1074252)) b!1573572))

(assert (= (and b!1573572 res!1074253) b!1573573))

(declare-fun m!1447391 () Bool)

(assert (=> b!1573573 m!1447391))

(assert (=> b!1573322 d!165169))

(declare-fun d!165171 () Bool)

(declare-fun res!1074254 () Bool)

(declare-fun e!877498 () Bool)

(assert (=> d!165171 (=> res!1074254 e!877498)))

(assert (=> d!165171 (= res!1074254 (and (is-Cons!36787 lt!674350) (= (_1!12731 (h!38252 lt!674350)) key1!37)))))

(assert (=> d!165171 (= (containsKey!872 lt!674350 key1!37) e!877498)))

(declare-fun b!1573574 () Bool)

(declare-fun e!877499 () Bool)

(assert (=> b!1573574 (= e!877498 e!877499)))

(declare-fun res!1074255 () Bool)

(assert (=> b!1573574 (=> (not res!1074255) (not e!877499))))

(assert (=> b!1573574 (= res!1074255 (and (or (not (is-Cons!36787 lt!674350)) (bvsle (_1!12731 (h!38252 lt!674350)) key1!37)) (is-Cons!36787 lt!674350) (bvslt (_1!12731 (h!38252 lt!674350)) key1!37)))))

(declare-fun b!1573575 () Bool)

(assert (=> b!1573575 (= e!877499 (containsKey!872 (t!51694 lt!674350) key1!37))))

(assert (= (and d!165171 (not res!1074254)) b!1573574))

(assert (= (and b!1573574 res!1074255) b!1573575))

(declare-fun m!1447393 () Bool)

(assert (=> b!1573575 m!1447393))

(assert (=> b!1573219 d!165171))

(declare-fun lt!674388 () Bool)

(declare-fun d!165173 () Bool)

(assert (=> d!165173 (= lt!674388 (member (tuple2!25441 key2!21 v2!10) (content!812 lt!674347)))))

(declare-fun e!877501 () Bool)

(assert (=> d!165173 (= lt!674388 e!877501)))

(declare-fun res!1074257 () Bool)

(assert (=> d!165173 (=> (not res!1074257) (not e!877501))))

(assert (=> d!165173 (= res!1074257 (is-Cons!36787 lt!674347))))

(assert (=> d!165173 (= (contains!10477 lt!674347 (tuple2!25441 key2!21 v2!10)) lt!674388)))

(declare-fun b!1573576 () Bool)

(declare-fun e!877500 () Bool)

(assert (=> b!1573576 (= e!877501 e!877500)))

(declare-fun res!1074256 () Bool)

(assert (=> b!1573576 (=> res!1074256 e!877500)))

(assert (=> b!1573576 (= res!1074256 (= (h!38252 lt!674347) (tuple2!25441 key2!21 v2!10)))))

(declare-fun b!1573577 () Bool)

(assert (=> b!1573577 (= e!877500 (contains!10477 (t!51694 lt!674347) (tuple2!25441 key2!21 v2!10)))))

(assert (= (and d!165173 res!1074257) b!1573576))

(assert (= (and b!1573576 (not res!1074256)) b!1573577))

(declare-fun m!1447395 () Bool)

(assert (=> d!165173 m!1447395))

(declare-fun m!1447397 () Bool)

(assert (=> d!165173 m!1447397))

(declare-fun m!1447399 () Bool)

(assert (=> b!1573577 m!1447399))

(assert (=> b!1573198 d!165173))

(declare-fun b!1573578 () Bool)

(declare-fun e!877502 () Bool)

(declare-fun tp!114249 () Bool)

(assert (=> b!1573578 (= e!877502 (and tp_is_empty!39105 tp!114249))))

(assert (=> b!1573340 (= tp!114243 e!877502)))

(assert (= (and b!1573340 (is-Cons!36787 (t!51694 (t!51694 l!750)))) b!1573578))

(push 1)

(assert (not b!1573556))

(assert (not b!1573525))

(assert (not b!1573541))

(assert (not d!165139))

(assert (not b!1573506))

(assert (not b!1573515))

(assert (not b!1573547))

(assert (not b!1573571))

(assert (not b!1573569))

(assert (not bm!72494))

(assert (not b!1573535))

(assert (not b!1573523))

(assert (not b!1573567))

(assert (not b!1573548))

(assert (not d!165131))

(assert (not d!165159))

(assert (not b!1573575))

(assert (not b!1573505))

(assert (not b!1573557))

(assert (not b!1573578))

(assert (not d!165157))

(assert (not b!1573566))

(assert (not b!1573514))

(assert (not d!165173))

(assert (not b!1573537))

(assert tp_is_empty!39105)

(assert (not bm!72497))

(assert (not bm!72500))

(assert (not b!1573526))

(assert (not b!1573573))

(assert (not b!1573558))

(assert (not b!1573577))

(assert (not d!165129))

(assert (not d!165153))

(assert (not b!1573534))

(assert (not bm!72491))

(assert (not b!1573539))

(assert (not b!1573521))

(assert (not b!1573545))

(assert (not b!1573543))

(assert (not d!165155))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

