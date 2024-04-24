; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104036 () Bool)

(assert start!104036)

(declare-fun b!1244036 () Bool)

(declare-datatypes ((B!1892 0))(
  ( (B!1893 (val!15708 Int)) )
))
(declare-fun v1!20 () B!1892)

(declare-fun key1!25 () (_ BitVec 64))

(declare-datatypes ((tuple2!20304 0))(
  ( (tuple2!20305 (_1!10163 (_ BitVec 64)) (_2!10163 B!1892)) )
))
(declare-datatypes ((List!27398 0))(
  ( (Nil!27395) (Cons!27394 (h!28612 tuple2!20304) (t!40856 List!27398)) )
))
(declare-fun l!644 () List!27398)

(declare-fun e!705353 () Bool)

(declare-fun key2!15 () (_ BitVec 64))

(declare-fun insertStrictlySorted!441 (List!27398 (_ BitVec 64) B!1892) List!27398)

(declare-fun removeStrictlySorted!132 (List!27398 (_ BitVec 64)) List!27398)

(assert (=> b!1244036 (= e!705353 (not (= (insertStrictlySorted!441 (removeStrictlySorted!132 l!644 key2!15) key1!25 v1!20) (removeStrictlySorted!132 (insertStrictlySorted!441 l!644 key1!25 v1!20) key2!15))))))

(declare-fun b!1244034 () Bool)

(declare-fun res!829261 () Bool)

(assert (=> b!1244034 (=> (not res!829261) (not e!705353))))

(declare-fun isStrictlySorted!754 (List!27398) Bool)

(assert (=> b!1244034 (= res!829261 (isStrictlySorted!754 l!644))))

(declare-fun res!829262 () Bool)

(assert (=> start!104036 (=> (not res!829262) (not e!705353))))

(assert (=> start!104036 (= res!829262 (not (= key1!25 key2!15)))))

(assert (=> start!104036 e!705353))

(assert (=> start!104036 true))

(declare-fun e!705352 () Bool)

(assert (=> start!104036 e!705352))

(declare-fun tp_is_empty!31291 () Bool)

(assert (=> start!104036 tp_is_empty!31291))

(declare-fun b!1244035 () Bool)

(declare-fun res!829263 () Bool)

(assert (=> b!1244035 (=> (not res!829263) (not e!705353))))

(get-info :version)

(assert (=> b!1244035 (= res!829263 (not ((_ is Cons!27394) l!644)))))

(declare-fun b!1244037 () Bool)

(declare-fun tp!92765 () Bool)

(assert (=> b!1244037 (= e!705352 (and tp_is_empty!31291 tp!92765))))

(assert (= (and start!104036 res!829262) b!1244034))

(assert (= (and b!1244034 res!829261) b!1244035))

(assert (= (and b!1244035 res!829263) b!1244036))

(assert (= (and start!104036 ((_ is Cons!27394) l!644)) b!1244037))

(declare-fun m!1147059 () Bool)

(assert (=> b!1244036 m!1147059))

(assert (=> b!1244036 m!1147059))

(declare-fun m!1147061 () Bool)

(assert (=> b!1244036 m!1147061))

(declare-fun m!1147063 () Bool)

(assert (=> b!1244036 m!1147063))

(assert (=> b!1244036 m!1147063))

(declare-fun m!1147065 () Bool)

(assert (=> b!1244036 m!1147065))

(declare-fun m!1147067 () Bool)

(assert (=> b!1244034 m!1147067))

(check-sat (not b!1244034) (not b!1244036) (not b!1244037) tp_is_empty!31291)
(check-sat)
(get-model)

(declare-fun d!137363 () Bool)

(declare-fun res!829292 () Bool)

(declare-fun e!705376 () Bool)

(assert (=> d!137363 (=> res!829292 e!705376)))

(assert (=> d!137363 (= res!829292 (or ((_ is Nil!27395) l!644) ((_ is Nil!27395) (t!40856 l!644))))))

(assert (=> d!137363 (= (isStrictlySorted!754 l!644) e!705376)))

(declare-fun b!1244072 () Bool)

(declare-fun e!705377 () Bool)

(assert (=> b!1244072 (= e!705376 e!705377)))

(declare-fun res!829293 () Bool)

(assert (=> b!1244072 (=> (not res!829293) (not e!705377))))

(assert (=> b!1244072 (= res!829293 (bvslt (_1!10163 (h!28612 l!644)) (_1!10163 (h!28612 (t!40856 l!644)))))))

(declare-fun b!1244073 () Bool)

(assert (=> b!1244073 (= e!705377 (isStrictlySorted!754 (t!40856 l!644)))))

(assert (= (and d!137363 (not res!829292)) b!1244072))

(assert (= (and b!1244072 res!829293) b!1244073))

(declare-fun m!1147091 () Bool)

(assert (=> b!1244073 m!1147091))

(assert (=> b!1244034 d!137363))

(declare-fun e!705418 () List!27398)

(declare-fun b!1244154 () Bool)

(declare-fun c!122126 () Bool)

(declare-fun c!122125 () Bool)

(assert (=> b!1244154 (= e!705418 (ite c!122125 (t!40856 (removeStrictlySorted!132 l!644 key2!15)) (ite c!122126 (Cons!27394 (h!28612 (removeStrictlySorted!132 l!644 key2!15)) (t!40856 (removeStrictlySorted!132 l!644 key2!15))) Nil!27395)))))

(declare-fun e!705419 () Bool)

(declare-fun b!1244155 () Bool)

(declare-fun lt!562766 () List!27398)

(declare-fun contains!7431 (List!27398 tuple2!20304) Bool)

(assert (=> b!1244155 (= e!705419 (contains!7431 lt!562766 (tuple2!20305 key1!25 v1!20)))))

(declare-fun b!1244156 () Bool)

(declare-fun e!705422 () List!27398)

(declare-fun e!705420 () List!27398)

(assert (=> b!1244156 (= e!705422 e!705420)))

(assert (=> b!1244156 (= c!122125 (and ((_ is Cons!27394) (removeStrictlySorted!132 l!644 key2!15)) (= (_1!10163 (h!28612 (removeStrictlySorted!132 l!644 key2!15))) key1!25)))))

(declare-fun b!1244157 () Bool)

(declare-fun call!61448 () List!27398)

(assert (=> b!1244157 (= e!705422 call!61448)))

(declare-fun b!1244158 () Bool)

(assert (=> b!1244158 (= c!122126 (and ((_ is Cons!27394) (removeStrictlySorted!132 l!644 key2!15)) (bvsgt (_1!10163 (h!28612 (removeStrictlySorted!132 l!644 key2!15))) key1!25)))))

(declare-fun e!705421 () List!27398)

(assert (=> b!1244158 (= e!705420 e!705421)))

(declare-fun d!137369 () Bool)

(assert (=> d!137369 e!705419))

(declare-fun res!829311 () Bool)

(assert (=> d!137369 (=> (not res!829311) (not e!705419))))

(assert (=> d!137369 (= res!829311 (isStrictlySorted!754 lt!562766))))

(assert (=> d!137369 (= lt!562766 e!705422)))

(declare-fun c!122124 () Bool)

(assert (=> d!137369 (= c!122124 (and ((_ is Cons!27394) (removeStrictlySorted!132 l!644 key2!15)) (bvslt (_1!10163 (h!28612 (removeStrictlySorted!132 l!644 key2!15))) key1!25)))))

(assert (=> d!137369 (isStrictlySorted!754 (removeStrictlySorted!132 l!644 key2!15))))

(assert (=> d!137369 (= (insertStrictlySorted!441 (removeStrictlySorted!132 l!644 key2!15) key1!25 v1!20) lt!562766)))

(declare-fun b!1244159 () Bool)

(assert (=> b!1244159 (= e!705418 (insertStrictlySorted!441 (t!40856 (removeStrictlySorted!132 l!644 key2!15)) key1!25 v1!20))))

(declare-fun b!1244160 () Bool)

(declare-fun call!61447 () List!27398)

(assert (=> b!1244160 (= e!705420 call!61447)))

(declare-fun b!1244161 () Bool)

(declare-fun call!61449 () List!27398)

(assert (=> b!1244161 (= e!705421 call!61449)))

(declare-fun bm!61444 () Bool)

(assert (=> bm!61444 (= call!61449 call!61447)))

(declare-fun bm!61445 () Bool)

(declare-fun $colon$colon!630 (List!27398 tuple2!20304) List!27398)

(assert (=> bm!61445 (= call!61448 ($colon$colon!630 e!705418 (ite c!122124 (h!28612 (removeStrictlySorted!132 l!644 key2!15)) (tuple2!20305 key1!25 v1!20))))))

(declare-fun c!122123 () Bool)

(assert (=> bm!61445 (= c!122123 c!122124)))

(declare-fun bm!61446 () Bool)

(assert (=> bm!61446 (= call!61447 call!61448)))

(declare-fun b!1244162 () Bool)

(declare-fun res!829310 () Bool)

(assert (=> b!1244162 (=> (not res!829310) (not e!705419))))

(declare-fun containsKey!617 (List!27398 (_ BitVec 64)) Bool)

(assert (=> b!1244162 (= res!829310 (containsKey!617 lt!562766 key1!25))))

(declare-fun b!1244163 () Bool)

(assert (=> b!1244163 (= e!705421 call!61449)))

(assert (= (and d!137369 c!122124) b!1244157))

(assert (= (and d!137369 (not c!122124)) b!1244156))

(assert (= (and b!1244156 c!122125) b!1244160))

(assert (= (and b!1244156 (not c!122125)) b!1244158))

(assert (= (and b!1244158 c!122126) b!1244161))

(assert (= (and b!1244158 (not c!122126)) b!1244163))

(assert (= (or b!1244161 b!1244163) bm!61444))

(assert (= (or b!1244160 bm!61444) bm!61446))

(assert (= (or b!1244157 bm!61446) bm!61445))

(assert (= (and bm!61445 c!122123) b!1244159))

(assert (= (and bm!61445 (not c!122123)) b!1244154))

(assert (= (and d!137369 res!829311) b!1244162))

(assert (= (and b!1244162 res!829310) b!1244155))

(declare-fun m!1147113 () Bool)

(assert (=> bm!61445 m!1147113))

(declare-fun m!1147117 () Bool)

(assert (=> b!1244162 m!1147117))

(declare-fun m!1147121 () Bool)

(assert (=> b!1244155 m!1147121))

(declare-fun m!1147123 () Bool)

(assert (=> d!137369 m!1147123))

(assert (=> d!137369 m!1147059))

(declare-fun m!1147125 () Bool)

(assert (=> d!137369 m!1147125))

(declare-fun m!1147127 () Bool)

(assert (=> b!1244159 m!1147127))

(assert (=> b!1244036 d!137369))

(declare-fun b!1244219 () Bool)

(declare-fun e!705456 () Bool)

(declare-fun lt!562777 () List!27398)

(assert (=> b!1244219 (= e!705456 (not (containsKey!617 lt!562777 key2!15)))))

(declare-fun b!1244220 () Bool)

(declare-fun e!705455 () List!27398)

(declare-fun e!705457 () List!27398)

(assert (=> b!1244220 (= e!705455 e!705457)))

(declare-fun c!122150 () Bool)

(assert (=> b!1244220 (= c!122150 (and ((_ is Cons!27394) l!644) (not (= (_1!10163 (h!28612 l!644)) key2!15))))))

(declare-fun b!1244221 () Bool)

(assert (=> b!1244221 (= e!705455 (t!40856 l!644))))

(declare-fun b!1244222 () Bool)

(assert (=> b!1244222 (= e!705457 ($colon$colon!630 (removeStrictlySorted!132 (t!40856 l!644) key2!15) (h!28612 l!644)))))

(declare-fun d!137375 () Bool)

(assert (=> d!137375 e!705456))

(declare-fun res!829323 () Bool)

(assert (=> d!137375 (=> (not res!829323) (not e!705456))))

(assert (=> d!137375 (= res!829323 (isStrictlySorted!754 lt!562777))))

(assert (=> d!137375 (= lt!562777 e!705455)))

(declare-fun c!122149 () Bool)

(assert (=> d!137375 (= c!122149 (and ((_ is Cons!27394) l!644) (= (_1!10163 (h!28612 l!644)) key2!15)))))

(assert (=> d!137375 (isStrictlySorted!754 l!644)))

(assert (=> d!137375 (= (removeStrictlySorted!132 l!644 key2!15) lt!562777)))

(declare-fun b!1244223 () Bool)

(assert (=> b!1244223 (= e!705457 Nil!27395)))

(assert (= (and d!137375 c!122149) b!1244221))

(assert (= (and d!137375 (not c!122149)) b!1244220))

(assert (= (and b!1244220 c!122150) b!1244222))

(assert (= (and b!1244220 (not c!122150)) b!1244223))

(assert (= (and d!137375 res!829323) b!1244219))

(declare-fun m!1147161 () Bool)

(assert (=> b!1244219 m!1147161))

(declare-fun m!1147163 () Bool)

(assert (=> b!1244222 m!1147163))

(assert (=> b!1244222 m!1147163))

(declare-fun m!1147169 () Bool)

(assert (=> b!1244222 m!1147169))

(declare-fun m!1147171 () Bool)

(assert (=> d!137375 m!1147171))

(assert (=> d!137375 m!1147067))

(assert (=> b!1244036 d!137375))

(declare-fun b!1244229 () Bool)

(declare-fun e!705462 () Bool)

(declare-fun lt!562779 () List!27398)

(assert (=> b!1244229 (= e!705462 (not (containsKey!617 lt!562779 key2!15)))))

(declare-fun b!1244230 () Bool)

(declare-fun e!705461 () List!27398)

(declare-fun e!705463 () List!27398)

(assert (=> b!1244230 (= e!705461 e!705463)))

(declare-fun c!122154 () Bool)

(assert (=> b!1244230 (= c!122154 (and ((_ is Cons!27394) (insertStrictlySorted!441 l!644 key1!25 v1!20)) (not (= (_1!10163 (h!28612 (insertStrictlySorted!441 l!644 key1!25 v1!20))) key2!15))))))

(declare-fun b!1244231 () Bool)

(assert (=> b!1244231 (= e!705461 (t!40856 (insertStrictlySorted!441 l!644 key1!25 v1!20)))))

(declare-fun b!1244232 () Bool)

(assert (=> b!1244232 (= e!705463 ($colon$colon!630 (removeStrictlySorted!132 (t!40856 (insertStrictlySorted!441 l!644 key1!25 v1!20)) key2!15) (h!28612 (insertStrictlySorted!441 l!644 key1!25 v1!20))))))

(declare-fun d!137385 () Bool)

(assert (=> d!137385 e!705462))

(declare-fun res!829325 () Bool)

(assert (=> d!137385 (=> (not res!829325) (not e!705462))))

(assert (=> d!137385 (= res!829325 (isStrictlySorted!754 lt!562779))))

(assert (=> d!137385 (= lt!562779 e!705461)))

(declare-fun c!122153 () Bool)

(assert (=> d!137385 (= c!122153 (and ((_ is Cons!27394) (insertStrictlySorted!441 l!644 key1!25 v1!20)) (= (_1!10163 (h!28612 (insertStrictlySorted!441 l!644 key1!25 v1!20))) key2!15)))))

(assert (=> d!137385 (isStrictlySorted!754 (insertStrictlySorted!441 l!644 key1!25 v1!20))))

(assert (=> d!137385 (= (removeStrictlySorted!132 (insertStrictlySorted!441 l!644 key1!25 v1!20) key2!15) lt!562779)))

(declare-fun b!1244233 () Bool)

(assert (=> b!1244233 (= e!705463 Nil!27395)))

(assert (= (and d!137385 c!122153) b!1244231))

(assert (= (and d!137385 (not c!122153)) b!1244230))

(assert (= (and b!1244230 c!122154) b!1244232))

(assert (= (and b!1244230 (not c!122154)) b!1244233))

(assert (= (and d!137385 res!829325) b!1244229))

(declare-fun m!1147177 () Bool)

(assert (=> b!1244229 m!1147177))

(declare-fun m!1147181 () Bool)

(assert (=> b!1244232 m!1147181))

(assert (=> b!1244232 m!1147181))

(declare-fun m!1147185 () Bool)

(assert (=> b!1244232 m!1147185))

(declare-fun m!1147189 () Bool)

(assert (=> d!137385 m!1147189))

(assert (=> d!137385 m!1147063))

(declare-fun m!1147191 () Bool)

(assert (=> d!137385 m!1147191))

(assert (=> b!1244036 d!137385))

(declare-fun c!122161 () Bool)

(declare-fun e!705469 () List!27398)

(declare-fun c!122162 () Bool)

(declare-fun b!1244244 () Bool)

(assert (=> b!1244244 (= e!705469 (ite c!122161 (t!40856 l!644) (ite c!122162 (Cons!27394 (h!28612 l!644) (t!40856 l!644)) Nil!27395)))))

(declare-fun b!1244245 () Bool)

(declare-fun lt!562781 () List!27398)

(declare-fun e!705470 () Bool)

(assert (=> b!1244245 (= e!705470 (contains!7431 lt!562781 (tuple2!20305 key1!25 v1!20)))))

(declare-fun b!1244246 () Bool)

(declare-fun e!705473 () List!27398)

(declare-fun e!705471 () List!27398)

(assert (=> b!1244246 (= e!705473 e!705471)))

(assert (=> b!1244246 (= c!122161 (and ((_ is Cons!27394) l!644) (= (_1!10163 (h!28612 l!644)) key1!25)))))

(declare-fun b!1244247 () Bool)

(declare-fun call!61457 () List!27398)

(assert (=> b!1244247 (= e!705473 call!61457)))

(declare-fun b!1244248 () Bool)

(assert (=> b!1244248 (= c!122162 (and ((_ is Cons!27394) l!644) (bvsgt (_1!10163 (h!28612 l!644)) key1!25)))))

(declare-fun e!705472 () List!27398)

(assert (=> b!1244248 (= e!705471 e!705472)))

(declare-fun d!137389 () Bool)

(assert (=> d!137389 e!705470))

(declare-fun res!829329 () Bool)

(assert (=> d!137389 (=> (not res!829329) (not e!705470))))

(assert (=> d!137389 (= res!829329 (isStrictlySorted!754 lt!562781))))

(assert (=> d!137389 (= lt!562781 e!705473)))

(declare-fun c!122160 () Bool)

(assert (=> d!137389 (= c!122160 (and ((_ is Cons!27394) l!644) (bvslt (_1!10163 (h!28612 l!644)) key1!25)))))

(assert (=> d!137389 (isStrictlySorted!754 l!644)))

(assert (=> d!137389 (= (insertStrictlySorted!441 l!644 key1!25 v1!20) lt!562781)))

(declare-fun b!1244249 () Bool)

(assert (=> b!1244249 (= e!705469 (insertStrictlySorted!441 (t!40856 l!644) key1!25 v1!20))))

(declare-fun b!1244250 () Bool)

(declare-fun call!61456 () List!27398)

(assert (=> b!1244250 (= e!705471 call!61456)))

(declare-fun b!1244251 () Bool)

(declare-fun call!61458 () List!27398)

(assert (=> b!1244251 (= e!705472 call!61458)))

(declare-fun bm!61453 () Bool)

(assert (=> bm!61453 (= call!61458 call!61456)))

(declare-fun bm!61454 () Bool)

(assert (=> bm!61454 (= call!61457 ($colon$colon!630 e!705469 (ite c!122160 (h!28612 l!644) (tuple2!20305 key1!25 v1!20))))))

(declare-fun c!122159 () Bool)

(assert (=> bm!61454 (= c!122159 c!122160)))

(declare-fun bm!61455 () Bool)

(assert (=> bm!61455 (= call!61456 call!61457)))

(declare-fun b!1244252 () Bool)

(declare-fun res!829328 () Bool)

(assert (=> b!1244252 (=> (not res!829328) (not e!705470))))

(assert (=> b!1244252 (= res!829328 (containsKey!617 lt!562781 key1!25))))

(declare-fun b!1244253 () Bool)

(assert (=> b!1244253 (= e!705472 call!61458)))

(assert (= (and d!137389 c!122160) b!1244247))

(assert (= (and d!137389 (not c!122160)) b!1244246))

(assert (= (and b!1244246 c!122161) b!1244250))

(assert (= (and b!1244246 (not c!122161)) b!1244248))

(assert (= (and b!1244248 c!122162) b!1244251))

(assert (= (and b!1244248 (not c!122162)) b!1244253))

(assert (= (or b!1244251 b!1244253) bm!61453))

(assert (= (or b!1244250 bm!61453) bm!61455))

(assert (= (or b!1244247 bm!61455) bm!61454))

(assert (= (and bm!61454 c!122159) b!1244249))

(assert (= (and bm!61454 (not c!122159)) b!1244244))

(assert (= (and d!137389 res!829329) b!1244252))

(assert (= (and b!1244252 res!829328) b!1244245))

(declare-fun m!1147197 () Bool)

(assert (=> bm!61454 m!1147197))

(declare-fun m!1147199 () Bool)

(assert (=> b!1244252 m!1147199))

(declare-fun m!1147205 () Bool)

(assert (=> b!1244245 m!1147205))

(declare-fun m!1147207 () Bool)

(assert (=> d!137389 m!1147207))

(assert (=> d!137389 m!1147067))

(declare-fun m!1147211 () Bool)

(assert (=> b!1244249 m!1147211))

(assert (=> b!1244036 d!137389))

(declare-fun b!1244268 () Bool)

(declare-fun e!705484 () Bool)

(declare-fun tp!92776 () Bool)

(assert (=> b!1244268 (= e!705484 (and tp_is_empty!31291 tp!92776))))

(assert (=> b!1244037 (= tp!92765 e!705484)))

(assert (= (and b!1244037 ((_ is Cons!27394) (t!40856 l!644))) b!1244268))

(check-sat (not d!137385) (not b!1244229) (not b!1244155) (not b!1244249) (not d!137375) (not b!1244222) (not b!1244219) (not b!1244268) (not d!137369) (not bm!61454) (not d!137389) (not b!1244245) (not b!1244073) (not b!1244232) tp_is_empty!31291 (not b!1244252) (not b!1244162) (not b!1244159) (not bm!61445))
(check-sat)
(get-model)

(declare-fun d!137391 () Bool)

(declare-fun res!829336 () Bool)

(declare-fun e!705489 () Bool)

(assert (=> d!137391 (=> res!829336 e!705489)))

(assert (=> d!137391 (= res!829336 (or ((_ is Nil!27395) lt!562781) ((_ is Nil!27395) (t!40856 lt!562781))))))

(assert (=> d!137391 (= (isStrictlySorted!754 lt!562781) e!705489)))

(declare-fun b!1244275 () Bool)

(declare-fun e!705490 () Bool)

(assert (=> b!1244275 (= e!705489 e!705490)))

(declare-fun res!829337 () Bool)

(assert (=> b!1244275 (=> (not res!829337) (not e!705490))))

(assert (=> b!1244275 (= res!829337 (bvslt (_1!10163 (h!28612 lt!562781)) (_1!10163 (h!28612 (t!40856 lt!562781)))))))

(declare-fun b!1244276 () Bool)

(assert (=> b!1244276 (= e!705490 (isStrictlySorted!754 (t!40856 lt!562781)))))

(assert (= (and d!137391 (not res!829336)) b!1244275))

(assert (= (and b!1244275 res!829337) b!1244276))

(declare-fun m!1147215 () Bool)

(assert (=> b!1244276 m!1147215))

(assert (=> d!137389 d!137391))

(assert (=> d!137389 d!137363))

(declare-fun d!137393 () Bool)

(assert (=> d!137393 (= ($colon$colon!630 e!705418 (ite c!122124 (h!28612 (removeStrictlySorted!132 l!644 key2!15)) (tuple2!20305 key1!25 v1!20))) (Cons!27394 (ite c!122124 (h!28612 (removeStrictlySorted!132 l!644 key2!15)) (tuple2!20305 key1!25 v1!20)) e!705418))))

(assert (=> bm!61445 d!137393))

(declare-fun d!137395 () Bool)

(declare-fun res!829338 () Bool)

(declare-fun e!705491 () Bool)

(assert (=> d!137395 (=> res!829338 e!705491)))

(assert (=> d!137395 (= res!829338 (or ((_ is Nil!27395) lt!562779) ((_ is Nil!27395) (t!40856 lt!562779))))))

(assert (=> d!137395 (= (isStrictlySorted!754 lt!562779) e!705491)))

(declare-fun b!1244277 () Bool)

(declare-fun e!705492 () Bool)

(assert (=> b!1244277 (= e!705491 e!705492)))

(declare-fun res!829339 () Bool)

(assert (=> b!1244277 (=> (not res!829339) (not e!705492))))

(assert (=> b!1244277 (= res!829339 (bvslt (_1!10163 (h!28612 lt!562779)) (_1!10163 (h!28612 (t!40856 lt!562779)))))))

(declare-fun b!1244278 () Bool)

(assert (=> b!1244278 (= e!705492 (isStrictlySorted!754 (t!40856 lt!562779)))))

(assert (= (and d!137395 (not res!829338)) b!1244277))

(assert (= (and b!1244277 res!829339) b!1244278))

(declare-fun m!1147217 () Bool)

(assert (=> b!1244278 m!1147217))

(assert (=> d!137385 d!137395))

(declare-fun d!137397 () Bool)

(declare-fun res!829340 () Bool)

(declare-fun e!705493 () Bool)

(assert (=> d!137397 (=> res!829340 e!705493)))

(assert (=> d!137397 (= res!829340 (or ((_ is Nil!27395) (insertStrictlySorted!441 l!644 key1!25 v1!20)) ((_ is Nil!27395) (t!40856 (insertStrictlySorted!441 l!644 key1!25 v1!20)))))))

(assert (=> d!137397 (= (isStrictlySorted!754 (insertStrictlySorted!441 l!644 key1!25 v1!20)) e!705493)))

(declare-fun b!1244279 () Bool)

(declare-fun e!705494 () Bool)

(assert (=> b!1244279 (= e!705493 e!705494)))

(declare-fun res!829341 () Bool)

(assert (=> b!1244279 (=> (not res!829341) (not e!705494))))

(assert (=> b!1244279 (= res!829341 (bvslt (_1!10163 (h!28612 (insertStrictlySorted!441 l!644 key1!25 v1!20))) (_1!10163 (h!28612 (t!40856 (insertStrictlySorted!441 l!644 key1!25 v1!20))))))))

(declare-fun b!1244280 () Bool)

(assert (=> b!1244280 (= e!705494 (isStrictlySorted!754 (t!40856 (insertStrictlySorted!441 l!644 key1!25 v1!20))))))

(assert (= (and d!137397 (not res!829340)) b!1244279))

(assert (= (and b!1244279 res!829341) b!1244280))

(declare-fun m!1147219 () Bool)

(assert (=> b!1244280 m!1147219))

(assert (=> d!137385 d!137397))

(declare-fun d!137399 () Bool)

(declare-fun res!829342 () Bool)

(declare-fun e!705495 () Bool)

(assert (=> d!137399 (=> res!829342 e!705495)))

(assert (=> d!137399 (= res!829342 (or ((_ is Nil!27395) lt!562766) ((_ is Nil!27395) (t!40856 lt!562766))))))

(assert (=> d!137399 (= (isStrictlySorted!754 lt!562766) e!705495)))

(declare-fun b!1244281 () Bool)

(declare-fun e!705496 () Bool)

(assert (=> b!1244281 (= e!705495 e!705496)))

(declare-fun res!829343 () Bool)

(assert (=> b!1244281 (=> (not res!829343) (not e!705496))))

(assert (=> b!1244281 (= res!829343 (bvslt (_1!10163 (h!28612 lt!562766)) (_1!10163 (h!28612 (t!40856 lt!562766)))))))

(declare-fun b!1244282 () Bool)

(assert (=> b!1244282 (= e!705496 (isStrictlySorted!754 (t!40856 lt!562766)))))

(assert (= (and d!137399 (not res!829342)) b!1244281))

(assert (= (and b!1244281 res!829343) b!1244282))

(declare-fun m!1147221 () Bool)

(assert (=> b!1244282 m!1147221))

(assert (=> d!137369 d!137399))

(declare-fun d!137401 () Bool)

(declare-fun res!829344 () Bool)

(declare-fun e!705497 () Bool)

(assert (=> d!137401 (=> res!829344 e!705497)))

(assert (=> d!137401 (= res!829344 (or ((_ is Nil!27395) (removeStrictlySorted!132 l!644 key2!15)) ((_ is Nil!27395) (t!40856 (removeStrictlySorted!132 l!644 key2!15)))))))

(assert (=> d!137401 (= (isStrictlySorted!754 (removeStrictlySorted!132 l!644 key2!15)) e!705497)))

(declare-fun b!1244283 () Bool)

(declare-fun e!705498 () Bool)

(assert (=> b!1244283 (= e!705497 e!705498)))

(declare-fun res!829345 () Bool)

(assert (=> b!1244283 (=> (not res!829345) (not e!705498))))

(assert (=> b!1244283 (= res!829345 (bvslt (_1!10163 (h!28612 (removeStrictlySorted!132 l!644 key2!15))) (_1!10163 (h!28612 (t!40856 (removeStrictlySorted!132 l!644 key2!15))))))))

(declare-fun b!1244284 () Bool)

(assert (=> b!1244284 (= e!705498 (isStrictlySorted!754 (t!40856 (removeStrictlySorted!132 l!644 key2!15))))))

(assert (= (and d!137401 (not res!829344)) b!1244283))

(assert (= (and b!1244283 res!829345) b!1244284))

(declare-fun m!1147223 () Bool)

(assert (=> b!1244284 m!1147223))

(assert (=> d!137369 d!137401))

(declare-fun d!137403 () Bool)

(declare-fun res!829346 () Bool)

(declare-fun e!705499 () Bool)

(assert (=> d!137403 (=> res!829346 e!705499)))

(assert (=> d!137403 (= res!829346 (or ((_ is Nil!27395) lt!562777) ((_ is Nil!27395) (t!40856 lt!562777))))))

(assert (=> d!137403 (= (isStrictlySorted!754 lt!562777) e!705499)))

(declare-fun b!1244285 () Bool)

(declare-fun e!705500 () Bool)

(assert (=> b!1244285 (= e!705499 e!705500)))

(declare-fun res!829347 () Bool)

(assert (=> b!1244285 (=> (not res!829347) (not e!705500))))

(assert (=> b!1244285 (= res!829347 (bvslt (_1!10163 (h!28612 lt!562777)) (_1!10163 (h!28612 (t!40856 lt!562777)))))))

(declare-fun b!1244286 () Bool)

(assert (=> b!1244286 (= e!705500 (isStrictlySorted!754 (t!40856 lt!562777)))))

(assert (= (and d!137403 (not res!829346)) b!1244285))

(assert (= (and b!1244285 res!829347) b!1244286))

(declare-fun m!1147225 () Bool)

(assert (=> b!1244286 m!1147225))

(assert (=> d!137375 d!137403))

(assert (=> d!137375 d!137363))

(declare-fun d!137405 () Bool)

(assert (=> d!137405 (= ($colon$colon!630 (removeStrictlySorted!132 (t!40856 l!644) key2!15) (h!28612 l!644)) (Cons!27394 (h!28612 l!644) (removeStrictlySorted!132 (t!40856 l!644) key2!15)))))

(assert (=> b!1244222 d!137405))

(declare-fun b!1244287 () Bool)

(declare-fun e!705502 () Bool)

(declare-fun lt!562782 () List!27398)

(assert (=> b!1244287 (= e!705502 (not (containsKey!617 lt!562782 key2!15)))))

(declare-fun b!1244288 () Bool)

(declare-fun e!705501 () List!27398)

(declare-fun e!705503 () List!27398)

(assert (=> b!1244288 (= e!705501 e!705503)))

(declare-fun c!122164 () Bool)

(assert (=> b!1244288 (= c!122164 (and ((_ is Cons!27394) (t!40856 l!644)) (not (= (_1!10163 (h!28612 (t!40856 l!644))) key2!15))))))

(declare-fun b!1244289 () Bool)

(assert (=> b!1244289 (= e!705501 (t!40856 (t!40856 l!644)))))

(declare-fun b!1244290 () Bool)

(assert (=> b!1244290 (= e!705503 ($colon$colon!630 (removeStrictlySorted!132 (t!40856 (t!40856 l!644)) key2!15) (h!28612 (t!40856 l!644))))))

(declare-fun d!137407 () Bool)

(assert (=> d!137407 e!705502))

(declare-fun res!829348 () Bool)

(assert (=> d!137407 (=> (not res!829348) (not e!705502))))

(assert (=> d!137407 (= res!829348 (isStrictlySorted!754 lt!562782))))

(assert (=> d!137407 (= lt!562782 e!705501)))

(declare-fun c!122163 () Bool)

(assert (=> d!137407 (= c!122163 (and ((_ is Cons!27394) (t!40856 l!644)) (= (_1!10163 (h!28612 (t!40856 l!644))) key2!15)))))

(assert (=> d!137407 (isStrictlySorted!754 (t!40856 l!644))))

(assert (=> d!137407 (= (removeStrictlySorted!132 (t!40856 l!644) key2!15) lt!562782)))

(declare-fun b!1244291 () Bool)

(assert (=> b!1244291 (= e!705503 Nil!27395)))

(assert (= (and d!137407 c!122163) b!1244289))

(assert (= (and d!137407 (not c!122163)) b!1244288))

(assert (= (and b!1244288 c!122164) b!1244290))

(assert (= (and b!1244288 (not c!122164)) b!1244291))

(assert (= (and d!137407 res!829348) b!1244287))

(declare-fun m!1147227 () Bool)

(assert (=> b!1244287 m!1147227))

(declare-fun m!1147229 () Bool)

(assert (=> b!1244290 m!1147229))

(assert (=> b!1244290 m!1147229))

(declare-fun m!1147231 () Bool)

(assert (=> b!1244290 m!1147231))

(declare-fun m!1147233 () Bool)

(assert (=> d!137407 m!1147233))

(assert (=> d!137407 m!1147091))

(assert (=> b!1244222 d!137407))

(declare-fun d!137409 () Bool)

(declare-fun res!829353 () Bool)

(declare-fun e!705508 () Bool)

(assert (=> d!137409 (=> res!829353 e!705508)))

(assert (=> d!137409 (= res!829353 (and ((_ is Cons!27394) lt!562779) (= (_1!10163 (h!28612 lt!562779)) key2!15)))))

(assert (=> d!137409 (= (containsKey!617 lt!562779 key2!15) e!705508)))

(declare-fun b!1244296 () Bool)

(declare-fun e!705509 () Bool)

(assert (=> b!1244296 (= e!705508 e!705509)))

(declare-fun res!829354 () Bool)

(assert (=> b!1244296 (=> (not res!829354) (not e!705509))))

(assert (=> b!1244296 (= res!829354 (and (or (not ((_ is Cons!27394) lt!562779)) (bvsle (_1!10163 (h!28612 lt!562779)) key2!15)) ((_ is Cons!27394) lt!562779) (bvslt (_1!10163 (h!28612 lt!562779)) key2!15)))))

(declare-fun b!1244297 () Bool)

(assert (=> b!1244297 (= e!705509 (containsKey!617 (t!40856 lt!562779) key2!15))))

(assert (= (and d!137409 (not res!829353)) b!1244296))

(assert (= (and b!1244296 res!829354) b!1244297))

(declare-fun m!1147235 () Bool)

(assert (=> b!1244297 m!1147235))

(assert (=> b!1244229 d!137409))

(declare-fun lt!562785 () Bool)

(declare-fun d!137411 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!605 (List!27398) (InoxSet tuple2!20304))

(assert (=> d!137411 (= lt!562785 (select (content!605 lt!562766) (tuple2!20305 key1!25 v1!20)))))

(declare-fun e!705520 () Bool)

(assert (=> d!137411 (= lt!562785 e!705520)))

(declare-fun res!829365 () Bool)

(assert (=> d!137411 (=> (not res!829365) (not e!705520))))

(assert (=> d!137411 (= res!829365 ((_ is Cons!27394) lt!562766))))

(assert (=> d!137411 (= (contains!7431 lt!562766 (tuple2!20305 key1!25 v1!20)) lt!562785)))

(declare-fun b!1244308 () Bool)

(declare-fun e!705521 () Bool)

(assert (=> b!1244308 (= e!705520 e!705521)))

(declare-fun res!829366 () Bool)

(assert (=> b!1244308 (=> res!829366 e!705521)))

(assert (=> b!1244308 (= res!829366 (= (h!28612 lt!562766) (tuple2!20305 key1!25 v1!20)))))

(declare-fun b!1244309 () Bool)

(assert (=> b!1244309 (= e!705521 (contains!7431 (t!40856 lt!562766) (tuple2!20305 key1!25 v1!20)))))

(assert (= (and d!137411 res!829365) b!1244308))

(assert (= (and b!1244308 (not res!829366)) b!1244309))

(declare-fun m!1147239 () Bool)

(assert (=> d!137411 m!1147239))

(declare-fun m!1147241 () Bool)

(assert (=> d!137411 m!1147241))

(declare-fun m!1147243 () Bool)

(assert (=> b!1244309 m!1147243))

(assert (=> b!1244155 d!137411))

(declare-fun d!137419 () Bool)

(declare-fun res!829369 () Bool)

(declare-fun e!705524 () Bool)

(assert (=> d!137419 (=> res!829369 e!705524)))

(assert (=> d!137419 (= res!829369 (or ((_ is Nil!27395) (t!40856 l!644)) ((_ is Nil!27395) (t!40856 (t!40856 l!644)))))))

(assert (=> d!137419 (= (isStrictlySorted!754 (t!40856 l!644)) e!705524)))

(declare-fun b!1244312 () Bool)

(declare-fun e!705525 () Bool)

(assert (=> b!1244312 (= e!705524 e!705525)))

(declare-fun res!829370 () Bool)

(assert (=> b!1244312 (=> (not res!829370) (not e!705525))))

(assert (=> b!1244312 (= res!829370 (bvslt (_1!10163 (h!28612 (t!40856 l!644))) (_1!10163 (h!28612 (t!40856 (t!40856 l!644))))))))

(declare-fun b!1244313 () Bool)

(assert (=> b!1244313 (= e!705525 (isStrictlySorted!754 (t!40856 (t!40856 l!644))))))

(assert (= (and d!137419 (not res!829369)) b!1244312))

(assert (= (and b!1244312 res!829370) b!1244313))

(declare-fun m!1147247 () Bool)

(assert (=> b!1244313 m!1147247))

(assert (=> b!1244073 d!137419))

(declare-fun d!137423 () Bool)

(declare-fun res!829371 () Bool)

(declare-fun e!705526 () Bool)

(assert (=> d!137423 (=> res!829371 e!705526)))

(assert (=> d!137423 (= res!829371 (and ((_ is Cons!27394) lt!562766) (= (_1!10163 (h!28612 lt!562766)) key1!25)))))

(assert (=> d!137423 (= (containsKey!617 lt!562766 key1!25) e!705526)))

(declare-fun b!1244314 () Bool)

(declare-fun e!705527 () Bool)

(assert (=> b!1244314 (= e!705526 e!705527)))

(declare-fun res!829372 () Bool)

(assert (=> b!1244314 (=> (not res!829372) (not e!705527))))

(assert (=> b!1244314 (= res!829372 (and (or (not ((_ is Cons!27394) lt!562766)) (bvsle (_1!10163 (h!28612 lt!562766)) key1!25)) ((_ is Cons!27394) lt!562766) (bvslt (_1!10163 (h!28612 lt!562766)) key1!25)))))

(declare-fun b!1244315 () Bool)

(assert (=> b!1244315 (= e!705527 (containsKey!617 (t!40856 lt!562766) key1!25))))

(assert (= (and d!137423 (not res!829371)) b!1244314))

(assert (= (and b!1244314 res!829372) b!1244315))

(declare-fun m!1147249 () Bool)

(assert (=> b!1244315 m!1147249))

(assert (=> b!1244162 d!137423))

(declare-fun d!137425 () Bool)

(assert (=> d!137425 (= ($colon$colon!630 (removeStrictlySorted!132 (t!40856 (insertStrictlySorted!441 l!644 key1!25 v1!20)) key2!15) (h!28612 (insertStrictlySorted!441 l!644 key1!25 v1!20))) (Cons!27394 (h!28612 (insertStrictlySorted!441 l!644 key1!25 v1!20)) (removeStrictlySorted!132 (t!40856 (insertStrictlySorted!441 l!644 key1!25 v1!20)) key2!15)))))

(assert (=> b!1244232 d!137425))

(declare-fun b!1244321 () Bool)

(declare-fun e!705532 () Bool)

(declare-fun lt!562787 () List!27398)

(assert (=> b!1244321 (= e!705532 (not (containsKey!617 lt!562787 key2!15)))))

(declare-fun b!1244322 () Bool)

(declare-fun e!705531 () List!27398)

(declare-fun e!705533 () List!27398)

(assert (=> b!1244322 (= e!705531 e!705533)))

(declare-fun c!122168 () Bool)

(assert (=> b!1244322 (= c!122168 (and ((_ is Cons!27394) (t!40856 (insertStrictlySorted!441 l!644 key1!25 v1!20))) (not (= (_1!10163 (h!28612 (t!40856 (insertStrictlySorted!441 l!644 key1!25 v1!20)))) key2!15))))))

(declare-fun b!1244323 () Bool)

(assert (=> b!1244323 (= e!705531 (t!40856 (t!40856 (insertStrictlySorted!441 l!644 key1!25 v1!20))))))

(declare-fun b!1244324 () Bool)

(assert (=> b!1244324 (= e!705533 ($colon$colon!630 (removeStrictlySorted!132 (t!40856 (t!40856 (insertStrictlySorted!441 l!644 key1!25 v1!20))) key2!15) (h!28612 (t!40856 (insertStrictlySorted!441 l!644 key1!25 v1!20)))))))

(declare-fun d!137429 () Bool)

(assert (=> d!137429 e!705532))

(declare-fun res!829374 () Bool)

(assert (=> d!137429 (=> (not res!829374) (not e!705532))))

(assert (=> d!137429 (= res!829374 (isStrictlySorted!754 lt!562787))))

(assert (=> d!137429 (= lt!562787 e!705531)))

(declare-fun c!122167 () Bool)

(assert (=> d!137429 (= c!122167 (and ((_ is Cons!27394) (t!40856 (insertStrictlySorted!441 l!644 key1!25 v1!20))) (= (_1!10163 (h!28612 (t!40856 (insertStrictlySorted!441 l!644 key1!25 v1!20)))) key2!15)))))

(assert (=> d!137429 (isStrictlySorted!754 (t!40856 (insertStrictlySorted!441 l!644 key1!25 v1!20)))))

(assert (=> d!137429 (= (removeStrictlySorted!132 (t!40856 (insertStrictlySorted!441 l!644 key1!25 v1!20)) key2!15) lt!562787)))

(declare-fun b!1244325 () Bool)

(assert (=> b!1244325 (= e!705533 Nil!27395)))

(assert (= (and d!137429 c!122167) b!1244323))

(assert (= (and d!137429 (not c!122167)) b!1244322))

(assert (= (and b!1244322 c!122168) b!1244324))

(assert (= (and b!1244322 (not c!122168)) b!1244325))

(assert (= (and d!137429 res!829374) b!1244321))

(declare-fun m!1147257 () Bool)

(assert (=> b!1244321 m!1147257))

(declare-fun m!1147259 () Bool)

(assert (=> b!1244324 m!1147259))

(assert (=> b!1244324 m!1147259))

(declare-fun m!1147265 () Bool)

(assert (=> b!1244324 m!1147265))

(declare-fun m!1147267 () Bool)

(assert (=> d!137429 m!1147267))

(assert (=> d!137429 m!1147219))

(assert (=> b!1244232 d!137429))

(declare-fun b!1244332 () Bool)

(declare-fun c!122171 () Bool)

(declare-fun c!122172 () Bool)

(declare-fun e!705540 () List!27398)

(assert (=> b!1244332 (= e!705540 (ite c!122171 (t!40856 (t!40856 l!644)) (ite c!122172 (Cons!27394 (h!28612 (t!40856 l!644)) (t!40856 (t!40856 l!644))) Nil!27395)))))

(declare-fun lt!562790 () List!27398)

(declare-fun e!705541 () Bool)

(declare-fun b!1244333 () Bool)

(assert (=> b!1244333 (= e!705541 (contains!7431 lt!562790 (tuple2!20305 key1!25 v1!20)))))

(declare-fun b!1244334 () Bool)

(declare-fun e!705544 () List!27398)

(declare-fun e!705542 () List!27398)

(assert (=> b!1244334 (= e!705544 e!705542)))

(assert (=> b!1244334 (= c!122171 (and ((_ is Cons!27394) (t!40856 l!644)) (= (_1!10163 (h!28612 (t!40856 l!644))) key1!25)))))

(declare-fun b!1244335 () Bool)

(declare-fun call!61460 () List!27398)

(assert (=> b!1244335 (= e!705544 call!61460)))

(declare-fun b!1244336 () Bool)

(assert (=> b!1244336 (= c!122172 (and ((_ is Cons!27394) (t!40856 l!644)) (bvsgt (_1!10163 (h!28612 (t!40856 l!644))) key1!25)))))

(declare-fun e!705543 () List!27398)

(assert (=> b!1244336 (= e!705542 e!705543)))

(declare-fun d!137433 () Bool)

(assert (=> d!137433 e!705541))

(declare-fun res!829382 () Bool)

(assert (=> d!137433 (=> (not res!829382) (not e!705541))))

(assert (=> d!137433 (= res!829382 (isStrictlySorted!754 lt!562790))))

(assert (=> d!137433 (= lt!562790 e!705544)))

(declare-fun c!122170 () Bool)

(assert (=> d!137433 (= c!122170 (and ((_ is Cons!27394) (t!40856 l!644)) (bvslt (_1!10163 (h!28612 (t!40856 l!644))) key1!25)))))

(assert (=> d!137433 (isStrictlySorted!754 (t!40856 l!644))))

(assert (=> d!137433 (= (insertStrictlySorted!441 (t!40856 l!644) key1!25 v1!20) lt!562790)))

(declare-fun b!1244337 () Bool)

(assert (=> b!1244337 (= e!705540 (insertStrictlySorted!441 (t!40856 (t!40856 l!644)) key1!25 v1!20))))

(declare-fun b!1244338 () Bool)

(declare-fun call!61459 () List!27398)

(assert (=> b!1244338 (= e!705542 call!61459)))

(declare-fun b!1244339 () Bool)

(declare-fun call!61461 () List!27398)

(assert (=> b!1244339 (= e!705543 call!61461)))

(declare-fun bm!61456 () Bool)

(assert (=> bm!61456 (= call!61461 call!61459)))

(declare-fun bm!61457 () Bool)

(assert (=> bm!61457 (= call!61460 ($colon$colon!630 e!705540 (ite c!122170 (h!28612 (t!40856 l!644)) (tuple2!20305 key1!25 v1!20))))))

(declare-fun c!122169 () Bool)

(assert (=> bm!61457 (= c!122169 c!122170)))

(declare-fun bm!61458 () Bool)

(assert (=> bm!61458 (= call!61459 call!61460)))

(declare-fun b!1244340 () Bool)

(declare-fun res!829381 () Bool)

(assert (=> b!1244340 (=> (not res!829381) (not e!705541))))

(assert (=> b!1244340 (= res!829381 (containsKey!617 lt!562790 key1!25))))

(declare-fun b!1244341 () Bool)

(assert (=> b!1244341 (= e!705543 call!61461)))

(assert (= (and d!137433 c!122170) b!1244335))

(assert (= (and d!137433 (not c!122170)) b!1244334))

(assert (= (and b!1244334 c!122171) b!1244338))

(assert (= (and b!1244334 (not c!122171)) b!1244336))

(assert (= (and b!1244336 c!122172) b!1244339))

(assert (= (and b!1244336 (not c!122172)) b!1244341))

(assert (= (or b!1244339 b!1244341) bm!61456))

(assert (= (or b!1244338 bm!61456) bm!61458))

(assert (= (or b!1244335 bm!61458) bm!61457))

(assert (= (and bm!61457 c!122169) b!1244337))

(assert (= (and bm!61457 (not c!122169)) b!1244332))

(assert (= (and d!137433 res!829382) b!1244340))

(assert (= (and b!1244340 res!829381) b!1244333))

(declare-fun m!1147273 () Bool)

(assert (=> bm!61457 m!1147273))

(declare-fun m!1147275 () Bool)

(assert (=> b!1244340 m!1147275))

(declare-fun m!1147277 () Bool)

(assert (=> b!1244333 m!1147277))

(declare-fun m!1147279 () Bool)

(assert (=> d!137433 m!1147279))

(assert (=> d!137433 m!1147091))

(declare-fun m!1147283 () Bool)

(assert (=> b!1244337 m!1147283))

(assert (=> b!1244249 d!137433))

(declare-fun d!137441 () Bool)

(assert (=> d!137441 (= ($colon$colon!630 e!705469 (ite c!122160 (h!28612 l!644) (tuple2!20305 key1!25 v1!20))) (Cons!27394 (ite c!122160 (h!28612 l!644) (tuple2!20305 key1!25 v1!20)) e!705469))))

(assert (=> bm!61454 d!137441))

(declare-fun lt!562792 () Bool)

(declare-fun d!137447 () Bool)

(assert (=> d!137447 (= lt!562792 (select (content!605 lt!562781) (tuple2!20305 key1!25 v1!20)))))

(declare-fun e!705555 () Bool)

(assert (=> d!137447 (= lt!562792 e!705555)))

(declare-fun res!829393 () Bool)

(assert (=> d!137447 (=> (not res!829393) (not e!705555))))

(assert (=> d!137447 (= res!829393 ((_ is Cons!27394) lt!562781))))

(assert (=> d!137447 (= (contains!7431 lt!562781 (tuple2!20305 key1!25 v1!20)) lt!562792)))

(declare-fun b!1244352 () Bool)

(declare-fun e!705556 () Bool)

(assert (=> b!1244352 (= e!705555 e!705556)))

(declare-fun res!829394 () Bool)

(assert (=> b!1244352 (=> res!829394 e!705556)))

(assert (=> b!1244352 (= res!829394 (= (h!28612 lt!562781) (tuple2!20305 key1!25 v1!20)))))

(declare-fun b!1244353 () Bool)

(assert (=> b!1244353 (= e!705556 (contains!7431 (t!40856 lt!562781) (tuple2!20305 key1!25 v1!20)))))

(assert (= (and d!137447 res!829393) b!1244352))

(assert (= (and b!1244352 (not res!829394)) b!1244353))

(declare-fun m!1147293 () Bool)

(assert (=> d!137447 m!1147293))

(declare-fun m!1147295 () Bool)

(assert (=> d!137447 m!1147295))

(declare-fun m!1147297 () Bool)

(assert (=> b!1244353 m!1147297))

(assert (=> b!1244245 d!137447))

(declare-fun b!1244364 () Bool)

(declare-fun e!705562 () List!27398)

(declare-fun c!122180 () Bool)

(declare-fun c!122179 () Bool)

(assert (=> b!1244364 (= e!705562 (ite c!122179 (t!40856 (t!40856 (removeStrictlySorted!132 l!644 key2!15))) (ite c!122180 (Cons!27394 (h!28612 (t!40856 (removeStrictlySorted!132 l!644 key2!15))) (t!40856 (t!40856 (removeStrictlySorted!132 l!644 key2!15)))) Nil!27395)))))

(declare-fun e!705563 () Bool)

(declare-fun lt!562794 () List!27398)

(declare-fun b!1244365 () Bool)

(assert (=> b!1244365 (= e!705563 (contains!7431 lt!562794 (tuple2!20305 key1!25 v1!20)))))

(declare-fun b!1244366 () Bool)

(declare-fun e!705566 () List!27398)

(declare-fun e!705564 () List!27398)

(assert (=> b!1244366 (= e!705566 e!705564)))

(assert (=> b!1244366 (= c!122179 (and ((_ is Cons!27394) (t!40856 (removeStrictlySorted!132 l!644 key2!15))) (= (_1!10163 (h!28612 (t!40856 (removeStrictlySorted!132 l!644 key2!15)))) key1!25)))))

(declare-fun b!1244367 () Bool)

(declare-fun call!61466 () List!27398)

(assert (=> b!1244367 (= e!705566 call!61466)))

(declare-fun b!1244368 () Bool)

(assert (=> b!1244368 (= c!122180 (and ((_ is Cons!27394) (t!40856 (removeStrictlySorted!132 l!644 key2!15))) (bvsgt (_1!10163 (h!28612 (t!40856 (removeStrictlySorted!132 l!644 key2!15)))) key1!25)))))

(declare-fun e!705565 () List!27398)

(assert (=> b!1244368 (= e!705564 e!705565)))

(declare-fun d!137451 () Bool)

(assert (=> d!137451 e!705563))

(declare-fun res!829398 () Bool)

(assert (=> d!137451 (=> (not res!829398) (not e!705563))))

(assert (=> d!137451 (= res!829398 (isStrictlySorted!754 lt!562794))))

(assert (=> d!137451 (= lt!562794 e!705566)))

(declare-fun c!122178 () Bool)

(assert (=> d!137451 (= c!122178 (and ((_ is Cons!27394) (t!40856 (removeStrictlySorted!132 l!644 key2!15))) (bvslt (_1!10163 (h!28612 (t!40856 (removeStrictlySorted!132 l!644 key2!15)))) key1!25)))))

(assert (=> d!137451 (isStrictlySorted!754 (t!40856 (removeStrictlySorted!132 l!644 key2!15)))))

(assert (=> d!137451 (= (insertStrictlySorted!441 (t!40856 (removeStrictlySorted!132 l!644 key2!15)) key1!25 v1!20) lt!562794)))

(declare-fun b!1244369 () Bool)

(assert (=> b!1244369 (= e!705562 (insertStrictlySorted!441 (t!40856 (t!40856 (removeStrictlySorted!132 l!644 key2!15))) key1!25 v1!20))))

(declare-fun b!1244370 () Bool)

(declare-fun call!61465 () List!27398)

(assert (=> b!1244370 (= e!705564 call!61465)))

(declare-fun b!1244371 () Bool)

(declare-fun call!61467 () List!27398)

(assert (=> b!1244371 (= e!705565 call!61467)))

(declare-fun bm!61462 () Bool)

(assert (=> bm!61462 (= call!61467 call!61465)))

(declare-fun bm!61463 () Bool)

(assert (=> bm!61463 (= call!61466 ($colon$colon!630 e!705562 (ite c!122178 (h!28612 (t!40856 (removeStrictlySorted!132 l!644 key2!15))) (tuple2!20305 key1!25 v1!20))))))

(declare-fun c!122177 () Bool)

(assert (=> bm!61463 (= c!122177 c!122178)))

(declare-fun bm!61464 () Bool)

(assert (=> bm!61464 (= call!61465 call!61466)))

(declare-fun b!1244372 () Bool)

(declare-fun res!829397 () Bool)

(assert (=> b!1244372 (=> (not res!829397) (not e!705563))))

(assert (=> b!1244372 (= res!829397 (containsKey!617 lt!562794 key1!25))))

(declare-fun b!1244373 () Bool)

(assert (=> b!1244373 (= e!705565 call!61467)))

(assert (= (and d!137451 c!122178) b!1244367))

(assert (= (and d!137451 (not c!122178)) b!1244366))

(assert (= (and b!1244366 c!122179) b!1244370))

(assert (= (and b!1244366 (not c!122179)) b!1244368))

(assert (= (and b!1244368 c!122180) b!1244371))

(assert (= (and b!1244368 (not c!122180)) b!1244373))

(assert (= (or b!1244371 b!1244373) bm!61462))

(assert (= (or b!1244370 bm!61462) bm!61464))

(assert (= (or b!1244367 bm!61464) bm!61463))

(assert (= (and bm!61463 c!122177) b!1244369))

(assert (= (and bm!61463 (not c!122177)) b!1244364))

(assert (= (and d!137451 res!829398) b!1244372))

(assert (= (and b!1244372 res!829397) b!1244365))

(declare-fun m!1147307 () Bool)

(assert (=> bm!61463 m!1147307))

(declare-fun m!1147311 () Bool)

(assert (=> b!1244372 m!1147311))

(declare-fun m!1147313 () Bool)

(assert (=> b!1244365 m!1147313))

(declare-fun m!1147315 () Bool)

(assert (=> d!137451 m!1147315))

(assert (=> d!137451 m!1147223))

(declare-fun m!1147317 () Bool)

(assert (=> b!1244369 m!1147317))

(assert (=> b!1244159 d!137451))

(declare-fun d!137455 () Bool)

(declare-fun res!829403 () Bool)

(declare-fun e!705574 () Bool)

(assert (=> d!137455 (=> res!829403 e!705574)))

(assert (=> d!137455 (= res!829403 (and ((_ is Cons!27394) lt!562781) (= (_1!10163 (h!28612 lt!562781)) key1!25)))))

(assert (=> d!137455 (= (containsKey!617 lt!562781 key1!25) e!705574)))

(declare-fun b!1244384 () Bool)

(declare-fun e!705575 () Bool)

(assert (=> b!1244384 (= e!705574 e!705575)))

(declare-fun res!829404 () Bool)

(assert (=> b!1244384 (=> (not res!829404) (not e!705575))))

(assert (=> b!1244384 (= res!829404 (and (or (not ((_ is Cons!27394) lt!562781)) (bvsle (_1!10163 (h!28612 lt!562781)) key1!25)) ((_ is Cons!27394) lt!562781) (bvslt (_1!10163 (h!28612 lt!562781)) key1!25)))))

(declare-fun b!1244385 () Bool)

(assert (=> b!1244385 (= e!705575 (containsKey!617 (t!40856 lt!562781) key1!25))))

(assert (= (and d!137455 (not res!829403)) b!1244384))

(assert (= (and b!1244384 res!829404) b!1244385))

(declare-fun m!1147319 () Bool)

(assert (=> b!1244385 m!1147319))

(assert (=> b!1244252 d!137455))

(declare-fun d!137457 () Bool)

(declare-fun res!829407 () Bool)

(declare-fun e!705578 () Bool)

(assert (=> d!137457 (=> res!829407 e!705578)))

(assert (=> d!137457 (= res!829407 (and ((_ is Cons!27394) lt!562777) (= (_1!10163 (h!28612 lt!562777)) key2!15)))))

(assert (=> d!137457 (= (containsKey!617 lt!562777 key2!15) e!705578)))

(declare-fun b!1244390 () Bool)

(declare-fun e!705579 () Bool)

(assert (=> b!1244390 (= e!705578 e!705579)))

(declare-fun res!829408 () Bool)

(assert (=> b!1244390 (=> (not res!829408) (not e!705579))))

(assert (=> b!1244390 (= res!829408 (and (or (not ((_ is Cons!27394) lt!562777)) (bvsle (_1!10163 (h!28612 lt!562777)) key2!15)) ((_ is Cons!27394) lt!562777) (bvslt (_1!10163 (h!28612 lt!562777)) key2!15)))))

(declare-fun b!1244391 () Bool)

(assert (=> b!1244391 (= e!705579 (containsKey!617 (t!40856 lt!562777) key2!15))))

(assert (= (and d!137457 (not res!829407)) b!1244390))

(assert (= (and b!1244390 res!829408) b!1244391))

(declare-fun m!1147321 () Bool)

(assert (=> b!1244391 m!1147321))

(assert (=> b!1244219 d!137457))

(declare-fun b!1244392 () Bool)

(declare-fun e!705580 () Bool)

(declare-fun tp!92781 () Bool)

(assert (=> b!1244392 (= e!705580 (and tp_is_empty!31291 tp!92781))))

(assert (=> b!1244268 (= tp!92776 e!705580)))

(assert (= (and b!1244268 ((_ is Cons!27394) (t!40856 (t!40856 l!644)))) b!1244392))

(check-sat (not d!137411) (not bm!61463) (not b!1244385) (not d!137447) (not b!1244372) (not b!1244315) (not b!1244278) (not b!1244365) (not b!1244391) (not b!1244280) (not b!1244286) (not b!1244369) (not d!137429) (not b!1244287) (not d!137433) tp_is_empty!31291 (not b!1244276) (not b!1244290) (not b!1244333) (not b!1244309) (not b!1244353) (not b!1244340) (not bm!61457) (not b!1244297) (not b!1244313) (not b!1244282) (not b!1244324) (not b!1244392) (not d!137451) (not b!1244284) (not b!1244337) (not b!1244321) (not d!137407))
(check-sat)
