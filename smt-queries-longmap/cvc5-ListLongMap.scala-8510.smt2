; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103742 () Bool)

(assert start!103742)

(declare-fun res!828395 () Bool)

(declare-fun e!704006 () Bool)

(assert (=> start!103742 (=> (not res!828395) (not e!704006))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103742 (= res!828395 (not (= key1!25 key2!15)))))

(assert (=> start!103742 e!704006))

(assert (=> start!103742 true))

(declare-fun e!704007 () Bool)

(assert (=> start!103742 e!704007))

(declare-fun tp_is_empty!31289 () Bool)

(assert (=> start!103742 tp_is_empty!31289))

(declare-fun b!1241988 () Bool)

(declare-fun res!828396 () Bool)

(assert (=> b!1241988 (=> (not res!828396) (not e!704006))))

(declare-datatypes ((B!1890 0))(
  ( (B!1891 (val!15707 Int)) )
))
(declare-datatypes ((tuple2!20370 0))(
  ( (tuple2!20371 (_1!10196 (_ BitVec 64)) (_2!10196 B!1890)) )
))
(declare-datatypes ((List!27434 0))(
  ( (Nil!27431) (Cons!27430 (h!28639 tuple2!20370) (t!40888 List!27434)) )
))
(declare-fun l!644 () List!27434)

(assert (=> b!1241988 (= res!828396 (is-Cons!27430 l!644))))

(declare-fun b!1241989 () Bool)

(declare-fun res!828394 () Bool)

(assert (=> b!1241989 (=> (not res!828394) (not e!704006))))

(declare-fun isStrictlySorted!761 (List!27434) Bool)

(assert (=> b!1241989 (= res!828394 (isStrictlySorted!761 (t!40888 l!644)))))

(declare-fun b!1241990 () Bool)

(declare-fun tp!92750 () Bool)

(assert (=> b!1241990 (= e!704007 (and tp_is_empty!31289 tp!92750))))

(declare-fun b!1241991 () Bool)

(declare-fun res!828393 () Bool)

(assert (=> b!1241991 (=> (not res!828393) (not e!704006))))

(assert (=> b!1241991 (= res!828393 (isStrictlySorted!761 l!644))))

(declare-fun v1!20 () B!1890)

(declare-fun b!1241992 () Bool)

(declare-fun insertStrictlySorted!440 (List!27434 (_ BitVec 64) B!1890) List!27434)

(declare-fun removeStrictlySorted!132 (List!27434 (_ BitVec 64)) List!27434)

(assert (=> b!1241992 (= e!704006 (not (= (insertStrictlySorted!440 (removeStrictlySorted!132 l!644 key2!15) key1!25 v1!20) (removeStrictlySorted!132 (insertStrictlySorted!440 l!644 key1!25 v1!20) key2!15))))))

(assert (=> b!1241992 (= (insertStrictlySorted!440 (removeStrictlySorted!132 (t!40888 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!132 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20) key2!15))))

(declare-datatypes ((Unit!41110 0))(
  ( (Unit!41111) )
))
(declare-fun lt!562011 () Unit!41110)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!18 (List!27434 (_ BitVec 64) B!1890 (_ BitVec 64)) Unit!41110)

(assert (=> b!1241992 (= lt!562011 (lemmaInsertAndRemoveStrictlySortedCommutative!18 (t!40888 l!644) key1!25 v1!20 key2!15))))

(assert (= (and start!103742 res!828395) b!1241991))

(assert (= (and b!1241991 res!828393) b!1241988))

(assert (= (and b!1241988 res!828396) b!1241989))

(assert (= (and b!1241989 res!828394) b!1241992))

(assert (= (and start!103742 (is-Cons!27430 l!644)) b!1241990))

(declare-fun m!1144263 () Bool)

(assert (=> b!1241989 m!1144263))

(declare-fun m!1144265 () Bool)

(assert (=> b!1241991 m!1144265))

(declare-fun m!1144267 () Bool)

(assert (=> b!1241992 m!1144267))

(declare-fun m!1144269 () Bool)

(assert (=> b!1241992 m!1144269))

(assert (=> b!1241992 m!1144267))

(declare-fun m!1144271 () Bool)

(assert (=> b!1241992 m!1144271))

(declare-fun m!1144273 () Bool)

(assert (=> b!1241992 m!1144273))

(declare-fun m!1144275 () Bool)

(assert (=> b!1241992 m!1144275))

(assert (=> b!1241992 m!1144273))

(declare-fun m!1144277 () Bool)

(assert (=> b!1241992 m!1144277))

(declare-fun m!1144279 () Bool)

(assert (=> b!1241992 m!1144279))

(assert (=> b!1241992 m!1144277))

(assert (=> b!1241992 m!1144271))

(declare-fun m!1144281 () Bool)

(assert (=> b!1241992 m!1144281))

(declare-fun m!1144283 () Bool)

(assert (=> b!1241992 m!1144283))

(push 1)

(assert (not b!1241990))

(assert (not b!1241991))

(assert (not b!1241989))

(assert tp_is_empty!31289)

(assert (not b!1241992))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136453 () Bool)

(declare-fun res!828405 () Bool)

(declare-fun e!704016 () Bool)

(assert (=> d!136453 (=> res!828405 e!704016)))

(assert (=> d!136453 (= res!828405 (or (is-Nil!27431 l!644) (is-Nil!27431 (t!40888 l!644))))))

(assert (=> d!136453 (= (isStrictlySorted!761 l!644) e!704016)))

(declare-fun b!1242001 () Bool)

(declare-fun e!704017 () Bool)

(assert (=> b!1242001 (= e!704016 e!704017)))

(declare-fun res!828406 () Bool)

(assert (=> b!1242001 (=> (not res!828406) (not e!704017))))

(assert (=> b!1242001 (= res!828406 (bvslt (_1!10196 (h!28639 l!644)) (_1!10196 (h!28639 (t!40888 l!644)))))))

(declare-fun b!1242002 () Bool)

(assert (=> b!1242002 (= e!704017 (isStrictlySorted!761 (t!40888 l!644)))))

(assert (= (and d!136453 (not res!828405)) b!1242001))

(assert (= (and b!1242001 res!828406) b!1242002))

(assert (=> b!1242002 m!1144263))

(assert (=> b!1241991 d!136453))

(declare-fun b!1242040 () Bool)

(declare-fun e!704042 () List!27434)

(assert (=> b!1242040 (= e!704042 (t!40888 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20)))))

(declare-fun b!1242041 () Bool)

(declare-fun e!704043 () List!27434)

(declare-fun $colon$colon!627 (List!27434 tuple2!20370) List!27434)

(assert (=> b!1242041 (= e!704043 ($colon$colon!627 (removeStrictlySorted!132 (t!40888 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20)) key2!15) (h!28639 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20))))))

(declare-fun b!1242042 () Bool)

(assert (=> b!1242042 (= e!704043 Nil!27431)))

(declare-fun b!1242043 () Bool)

(assert (=> b!1242043 (= e!704042 e!704043)))

(declare-fun c!121523 () Bool)

(assert (=> b!1242043 (= c!121523 (and (is-Cons!27430 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20)) (not (= (_1!10196 (h!28639 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20))) key2!15))))))

(declare-fun b!1242044 () Bool)

(declare-fun e!704041 () Bool)

(declare-fun lt!562019 () List!27434)

(declare-fun containsKey!610 (List!27434 (_ BitVec 64)) Bool)

(assert (=> b!1242044 (= e!704041 (not (containsKey!610 lt!562019 key2!15)))))

(declare-fun d!136459 () Bool)

(assert (=> d!136459 e!704041))

(declare-fun res!828416 () Bool)

(assert (=> d!136459 (=> (not res!828416) (not e!704041))))

(assert (=> d!136459 (= res!828416 (isStrictlySorted!761 lt!562019))))

(assert (=> d!136459 (= lt!562019 e!704042)))

(declare-fun c!121522 () Bool)

(assert (=> d!136459 (= c!121522 (and (is-Cons!27430 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20)) (= (_1!10196 (h!28639 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20))) key2!15)))))

(assert (=> d!136459 (isStrictlySorted!761 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20))))

(assert (=> d!136459 (= (removeStrictlySorted!132 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20) key2!15) lt!562019)))

(assert (= (and d!136459 c!121522) b!1242040))

(assert (= (and d!136459 (not c!121522)) b!1242043))

(assert (= (and b!1242043 c!121523) b!1242041))

(assert (= (and b!1242043 (not c!121523)) b!1242042))

(assert (= (and d!136459 res!828416) b!1242044))

(declare-fun m!1144295 () Bool)

(assert (=> b!1242041 m!1144295))

(assert (=> b!1242041 m!1144295))

(declare-fun m!1144297 () Bool)

(assert (=> b!1242041 m!1144297))

(declare-fun m!1144299 () Bool)

(assert (=> b!1242044 m!1144299))

(declare-fun m!1144301 () Bool)

(assert (=> d!136459 m!1144301))

(assert (=> d!136459 m!1144273))

(declare-fun m!1144303 () Bool)

(assert (=> d!136459 m!1144303))

(assert (=> b!1241992 d!136459))

(declare-fun b!1242140 () Bool)

(declare-fun res!828437 () Bool)

(declare-fun e!704094 () Bool)

(assert (=> b!1242140 (=> (not res!828437) (not e!704094))))

(declare-fun lt!562030 () List!27434)

(assert (=> b!1242140 (= res!828437 (containsKey!610 lt!562030 key1!25))))

(declare-fun b!1242141 () Bool)

(declare-fun contains!7364 (List!27434 tuple2!20370) Bool)

(assert (=> b!1242141 (= e!704094 (contains!7364 lt!562030 (tuple2!20371 key1!25 v1!20)))))

(declare-fun b!1242142 () Bool)

(declare-fun e!704093 () List!27434)

(declare-fun call!61282 () List!27434)

(assert (=> b!1242142 (= e!704093 call!61282)))

(declare-fun b!1242143 () Bool)

(declare-fun e!704096 () List!27434)

(declare-fun call!61284 () List!27434)

(assert (=> b!1242143 (= e!704096 call!61284)))

(declare-fun c!121565 () Bool)

(declare-fun call!61283 () List!27434)

(declare-fun bm!61279 () Bool)

(declare-fun e!704092 () List!27434)

(assert (=> bm!61279 (= call!61283 ($colon$colon!627 e!704092 (ite c!121565 (h!28639 (removeStrictlySorted!132 (t!40888 l!644) key2!15)) (tuple2!20371 key1!25 v1!20))))))

(declare-fun c!121562 () Bool)

(assert (=> bm!61279 (= c!121562 c!121565)))

(declare-fun c!121564 () Bool)

(declare-fun c!121563 () Bool)

(declare-fun b!1242144 () Bool)

(assert (=> b!1242144 (= e!704092 (ite c!121564 (t!40888 (removeStrictlySorted!132 (t!40888 l!644) key2!15)) (ite c!121563 (Cons!27430 (h!28639 (removeStrictlySorted!132 (t!40888 l!644) key2!15)) (t!40888 (removeStrictlySorted!132 (t!40888 l!644) key2!15))) Nil!27431)))))

(declare-fun b!1242145 () Bool)

(declare-fun e!704095 () List!27434)

(assert (=> b!1242145 (= e!704095 call!61283)))

(declare-fun b!1242146 () Bool)

(assert (=> b!1242146 (= e!704092 (insertStrictlySorted!440 (t!40888 (removeStrictlySorted!132 (t!40888 l!644) key2!15)) key1!25 v1!20))))

(declare-fun bm!61280 () Bool)

(assert (=> bm!61280 (= call!61282 call!61283)))

(declare-fun b!1242148 () Bool)

(assert (=> b!1242148 (= e!704096 call!61284)))

(declare-fun b!1242149 () Bool)

(assert (=> b!1242149 (= c!121563 (and (is-Cons!27430 (removeStrictlySorted!132 (t!40888 l!644) key2!15)) (bvsgt (_1!10196 (h!28639 (removeStrictlySorted!132 (t!40888 l!644) key2!15))) key1!25)))))

(assert (=> b!1242149 (= e!704093 e!704096)))

(declare-fun bm!61281 () Bool)

(assert (=> bm!61281 (= call!61284 call!61282)))

(declare-fun d!136465 () Bool)

(assert (=> d!136465 e!704094))

(declare-fun res!828436 () Bool)

(assert (=> d!136465 (=> (not res!828436) (not e!704094))))

(assert (=> d!136465 (= res!828436 (isStrictlySorted!761 lt!562030))))

(assert (=> d!136465 (= lt!562030 e!704095)))

(assert (=> d!136465 (= c!121565 (and (is-Cons!27430 (removeStrictlySorted!132 (t!40888 l!644) key2!15)) (bvslt (_1!10196 (h!28639 (removeStrictlySorted!132 (t!40888 l!644) key2!15))) key1!25)))))

(assert (=> d!136465 (isStrictlySorted!761 (removeStrictlySorted!132 (t!40888 l!644) key2!15))))

(assert (=> d!136465 (= (insertStrictlySorted!440 (removeStrictlySorted!132 (t!40888 l!644) key2!15) key1!25 v1!20) lt!562030)))

(declare-fun b!1242147 () Bool)

(assert (=> b!1242147 (= e!704095 e!704093)))

(assert (=> b!1242147 (= c!121564 (and (is-Cons!27430 (removeStrictlySorted!132 (t!40888 l!644) key2!15)) (= (_1!10196 (h!28639 (removeStrictlySorted!132 (t!40888 l!644) key2!15))) key1!25)))))

(assert (= (and d!136465 c!121565) b!1242145))

(assert (= (and d!136465 (not c!121565)) b!1242147))

(assert (= (and b!1242147 c!121564) b!1242142))

(assert (= (and b!1242147 (not c!121564)) b!1242149))

(assert (= (and b!1242149 c!121563) b!1242148))

(assert (= (and b!1242149 (not c!121563)) b!1242143))

(assert (= (or b!1242148 b!1242143) bm!61281))

(assert (= (or b!1242142 bm!61281) bm!61280))

(assert (= (or b!1242145 bm!61280) bm!61279))

(assert (= (and bm!61279 c!121562) b!1242146))

(assert (= (and bm!61279 (not c!121562)) b!1242144))

(assert (= (and d!136465 res!828436) b!1242140))

(assert (= (and b!1242140 res!828437) b!1242141))

(declare-fun m!1144347 () Bool)

(assert (=> b!1242141 m!1144347))

(declare-fun m!1144349 () Bool)

(assert (=> d!136465 m!1144349))

(assert (=> d!136465 m!1144277))

(declare-fun m!1144351 () Bool)

(assert (=> d!136465 m!1144351))

(declare-fun m!1144353 () Bool)

(assert (=> b!1242140 m!1144353))

(declare-fun m!1144357 () Bool)

(assert (=> bm!61279 m!1144357))

(declare-fun m!1144359 () Bool)

(assert (=> b!1242146 m!1144359))

(assert (=> b!1241992 d!136465))

(declare-fun b!1242165 () Bool)

(declare-fun res!828442 () Bool)

(declare-fun e!704107 () Bool)

(assert (=> b!1242165 (=> (not res!828442) (not e!704107))))

(declare-fun lt!562033 () List!27434)

(assert (=> b!1242165 (= res!828442 (containsKey!610 lt!562033 key1!25))))

(declare-fun b!1242166 () Bool)

(assert (=> b!1242166 (= e!704107 (contains!7364 lt!562033 (tuple2!20371 key1!25 v1!20)))))

(declare-fun b!1242167 () Bool)

(declare-fun e!704106 () List!27434)

(declare-fun call!61288 () List!27434)

(assert (=> b!1242167 (= e!704106 call!61288)))

(declare-fun b!1242168 () Bool)

(declare-fun e!704109 () List!27434)

(declare-fun call!61290 () List!27434)

(assert (=> b!1242168 (= e!704109 call!61290)))

(declare-fun bm!61285 () Bool)

(declare-fun e!704105 () List!27434)

(declare-fun call!61289 () List!27434)

(declare-fun c!121575 () Bool)

(assert (=> bm!61285 (= call!61289 ($colon$colon!627 e!704105 (ite c!121575 (h!28639 l!644) (tuple2!20371 key1!25 v1!20))))))

(declare-fun c!121572 () Bool)

(assert (=> bm!61285 (= c!121572 c!121575)))

(declare-fun c!121574 () Bool)

(declare-fun b!1242169 () Bool)

(declare-fun c!121573 () Bool)

(assert (=> b!1242169 (= e!704105 (ite c!121574 (t!40888 l!644) (ite c!121573 (Cons!27430 (h!28639 l!644) (t!40888 l!644)) Nil!27431)))))

(declare-fun b!1242170 () Bool)

(declare-fun e!704108 () List!27434)

(assert (=> b!1242170 (= e!704108 call!61289)))

(declare-fun b!1242171 () Bool)

(assert (=> b!1242171 (= e!704105 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20))))

(declare-fun bm!61286 () Bool)

(assert (=> bm!61286 (= call!61288 call!61289)))

(declare-fun b!1242173 () Bool)

(assert (=> b!1242173 (= e!704109 call!61290)))

(declare-fun b!1242174 () Bool)

(assert (=> b!1242174 (= c!121573 (and (is-Cons!27430 l!644) (bvsgt (_1!10196 (h!28639 l!644)) key1!25)))))

(assert (=> b!1242174 (= e!704106 e!704109)))

(declare-fun bm!61287 () Bool)

(assert (=> bm!61287 (= call!61290 call!61288)))

(declare-fun d!136475 () Bool)

(assert (=> d!136475 e!704107))

(declare-fun res!828441 () Bool)

(assert (=> d!136475 (=> (not res!828441) (not e!704107))))

(assert (=> d!136475 (= res!828441 (isStrictlySorted!761 lt!562033))))

(assert (=> d!136475 (= lt!562033 e!704108)))

(assert (=> d!136475 (= c!121575 (and (is-Cons!27430 l!644) (bvslt (_1!10196 (h!28639 l!644)) key1!25)))))

(assert (=> d!136475 (isStrictlySorted!761 l!644)))

(assert (=> d!136475 (= (insertStrictlySorted!440 l!644 key1!25 v1!20) lt!562033)))

(declare-fun b!1242172 () Bool)

(assert (=> b!1242172 (= e!704108 e!704106)))

(assert (=> b!1242172 (= c!121574 (and (is-Cons!27430 l!644) (= (_1!10196 (h!28639 l!644)) key1!25)))))

(assert (= (and d!136475 c!121575) b!1242170))

(assert (= (and d!136475 (not c!121575)) b!1242172))

(assert (= (and b!1242172 c!121574) b!1242167))

(assert (= (and b!1242172 (not c!121574)) b!1242174))

(assert (= (and b!1242174 c!121573) b!1242173))

(assert (= (and b!1242174 (not c!121573)) b!1242168))

(assert (= (or b!1242173 b!1242168) bm!61287))

(assert (= (or b!1242167 bm!61287) bm!61286))

(assert (= (or b!1242170 bm!61286) bm!61285))

(assert (= (and bm!61285 c!121572) b!1242171))

(assert (= (and bm!61285 (not c!121572)) b!1242169))

(assert (= (and d!136475 res!828441) b!1242165))

(assert (= (and b!1242165 res!828442) b!1242166))

(declare-fun m!1144377 () Bool)

(assert (=> b!1242166 m!1144377))

(declare-fun m!1144379 () Bool)

(assert (=> d!136475 m!1144379))

(assert (=> d!136475 m!1144265))

(declare-fun m!1144381 () Bool)

(assert (=> b!1242165 m!1144381))

(declare-fun m!1144383 () Bool)

(assert (=> bm!61285 m!1144383))

(assert (=> b!1242171 m!1144273))

(assert (=> b!1241992 d!136475))

(declare-fun b!1242185 () Bool)

(declare-fun res!828446 () Bool)

(declare-fun e!704117 () Bool)

(assert (=> b!1242185 (=> (not res!828446) (not e!704117))))

(declare-fun lt!562035 () List!27434)

(assert (=> b!1242185 (= res!828446 (containsKey!610 lt!562035 key1!25))))

(declare-fun b!1242186 () Bool)

(assert (=> b!1242186 (= e!704117 (contains!7364 lt!562035 (tuple2!20371 key1!25 v1!20)))))

(declare-fun b!1242187 () Bool)

(declare-fun e!704116 () List!27434)

(declare-fun call!61294 () List!27434)

(assert (=> b!1242187 (= e!704116 call!61294)))

(declare-fun b!1242188 () Bool)

(declare-fun e!704119 () List!27434)

(declare-fun call!61296 () List!27434)

(assert (=> b!1242188 (= e!704119 call!61296)))

(declare-fun e!704115 () List!27434)

(declare-fun c!121583 () Bool)

(declare-fun call!61295 () List!27434)

(declare-fun bm!61291 () Bool)

(assert (=> bm!61291 (= call!61295 ($colon$colon!627 e!704115 (ite c!121583 (h!28639 (removeStrictlySorted!132 l!644 key2!15)) (tuple2!20371 key1!25 v1!20))))))

(declare-fun c!121580 () Bool)

(assert (=> bm!61291 (= c!121580 c!121583)))

(declare-fun c!121581 () Bool)

(declare-fun c!121582 () Bool)

(declare-fun b!1242189 () Bool)

(assert (=> b!1242189 (= e!704115 (ite c!121582 (t!40888 (removeStrictlySorted!132 l!644 key2!15)) (ite c!121581 (Cons!27430 (h!28639 (removeStrictlySorted!132 l!644 key2!15)) (t!40888 (removeStrictlySorted!132 l!644 key2!15))) Nil!27431)))))

(declare-fun b!1242190 () Bool)

(declare-fun e!704118 () List!27434)

(assert (=> b!1242190 (= e!704118 call!61295)))

(declare-fun b!1242191 () Bool)

(assert (=> b!1242191 (= e!704115 (insertStrictlySorted!440 (t!40888 (removeStrictlySorted!132 l!644 key2!15)) key1!25 v1!20))))

(declare-fun bm!61292 () Bool)

(assert (=> bm!61292 (= call!61294 call!61295)))

(declare-fun b!1242193 () Bool)

(assert (=> b!1242193 (= e!704119 call!61296)))

(declare-fun b!1242194 () Bool)

(assert (=> b!1242194 (= c!121581 (and (is-Cons!27430 (removeStrictlySorted!132 l!644 key2!15)) (bvsgt (_1!10196 (h!28639 (removeStrictlySorted!132 l!644 key2!15))) key1!25)))))

(assert (=> b!1242194 (= e!704116 e!704119)))

(declare-fun bm!61293 () Bool)

(assert (=> bm!61293 (= call!61296 call!61294)))

(declare-fun d!136481 () Bool)

(assert (=> d!136481 e!704117))

(declare-fun res!828445 () Bool)

(assert (=> d!136481 (=> (not res!828445) (not e!704117))))

(assert (=> d!136481 (= res!828445 (isStrictlySorted!761 lt!562035))))

(assert (=> d!136481 (= lt!562035 e!704118)))

(assert (=> d!136481 (= c!121583 (and (is-Cons!27430 (removeStrictlySorted!132 l!644 key2!15)) (bvslt (_1!10196 (h!28639 (removeStrictlySorted!132 l!644 key2!15))) key1!25)))))

(assert (=> d!136481 (isStrictlySorted!761 (removeStrictlySorted!132 l!644 key2!15))))

(assert (=> d!136481 (= (insertStrictlySorted!440 (removeStrictlySorted!132 l!644 key2!15) key1!25 v1!20) lt!562035)))

(declare-fun b!1242192 () Bool)

(assert (=> b!1242192 (= e!704118 e!704116)))

(assert (=> b!1242192 (= c!121582 (and (is-Cons!27430 (removeStrictlySorted!132 l!644 key2!15)) (= (_1!10196 (h!28639 (removeStrictlySorted!132 l!644 key2!15))) key1!25)))))

(assert (= (and d!136481 c!121583) b!1242190))

(assert (= (and d!136481 (not c!121583)) b!1242192))

(assert (= (and b!1242192 c!121582) b!1242187))

(assert (= (and b!1242192 (not c!121582)) b!1242194))

(assert (= (and b!1242194 c!121581) b!1242193))

(assert (= (and b!1242194 (not c!121581)) b!1242188))

(assert (= (or b!1242193 b!1242188) bm!61293))

(assert (= (or b!1242187 bm!61293) bm!61292))

(assert (= (or b!1242190 bm!61292) bm!61291))

(assert (= (and bm!61291 c!121580) b!1242191))

(assert (= (and bm!61291 (not c!121580)) b!1242189))

(assert (= (and d!136481 res!828445) b!1242185))

(assert (= (and b!1242185 res!828446) b!1242186))

(declare-fun m!1144393 () Bool)

(assert (=> b!1242186 m!1144393))

(declare-fun m!1144395 () Bool)

(assert (=> d!136481 m!1144395))

(assert (=> d!136481 m!1144267))

(declare-fun m!1144397 () Bool)

(assert (=> d!136481 m!1144397))

(declare-fun m!1144399 () Bool)

(assert (=> b!1242185 m!1144399))

(declare-fun m!1144401 () Bool)

(assert (=> bm!61291 m!1144401))

(declare-fun m!1144403 () Bool)

(assert (=> b!1242191 m!1144403))

(assert (=> b!1241992 d!136481))

(declare-fun b!1242205 () Bool)

(declare-fun e!704126 () List!27434)

(assert (=> b!1242205 (= e!704126 (t!40888 l!644))))

(declare-fun b!1242206 () Bool)

(declare-fun e!704127 () List!27434)

(assert (=> b!1242206 (= e!704127 ($colon$colon!627 (removeStrictlySorted!132 (t!40888 l!644) key2!15) (h!28639 l!644)))))

(declare-fun b!1242207 () Bool)

(assert (=> b!1242207 (= e!704127 Nil!27431)))

(declare-fun b!1242208 () Bool)

(assert (=> b!1242208 (= e!704126 e!704127)))

(declare-fun c!121589 () Bool)

(assert (=> b!1242208 (= c!121589 (and (is-Cons!27430 l!644) (not (= (_1!10196 (h!28639 l!644)) key2!15))))))

(declare-fun b!1242209 () Bool)

(declare-fun e!704125 () Bool)

(declare-fun lt!562037 () List!27434)

(assert (=> b!1242209 (= e!704125 (not (containsKey!610 lt!562037 key2!15)))))

(declare-fun d!136485 () Bool)

(assert (=> d!136485 e!704125))

(declare-fun res!828449 () Bool)

(assert (=> d!136485 (=> (not res!828449) (not e!704125))))

(assert (=> d!136485 (= res!828449 (isStrictlySorted!761 lt!562037))))

(assert (=> d!136485 (= lt!562037 e!704126)))

(declare-fun c!121588 () Bool)

(assert (=> d!136485 (= c!121588 (and (is-Cons!27430 l!644) (= (_1!10196 (h!28639 l!644)) key2!15)))))

(assert (=> d!136485 (isStrictlySorted!761 l!644)))

(assert (=> d!136485 (= (removeStrictlySorted!132 l!644 key2!15) lt!562037)))

(assert (= (and d!136485 c!121588) b!1242205))

(assert (= (and d!136485 (not c!121588)) b!1242208))

(assert (= (and b!1242208 c!121589) b!1242206))

(assert (= (and b!1242208 (not c!121589)) b!1242207))

(assert (= (and d!136485 res!828449) b!1242209))

(assert (=> b!1242206 m!1144277))

(assert (=> b!1242206 m!1144277))

(declare-fun m!1144417 () Bool)

(assert (=> b!1242206 m!1144417))

(declare-fun m!1144419 () Bool)

(assert (=> b!1242209 m!1144419))

(declare-fun m!1144421 () Bool)

(assert (=> d!136485 m!1144421))

(assert (=> d!136485 m!1144265))

(assert (=> b!1241992 d!136485))

(declare-fun d!136489 () Bool)

(assert (=> d!136489 (= (insertStrictlySorted!440 (removeStrictlySorted!132 (t!40888 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!132 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20) key2!15))))

(declare-fun lt!562049 () Unit!41110)

(declare-fun choose!1850 (List!27434 (_ BitVec 64) B!1890 (_ BitVec 64)) Unit!41110)

(assert (=> d!136489 (= lt!562049 (choose!1850 (t!40888 l!644) key1!25 v1!20 key2!15))))

(assert (=> d!136489 (not (= key1!25 key2!15))))

(assert (=> d!136489 (= (lemmaInsertAndRemoveStrictlySortedCommutative!18 (t!40888 l!644) key1!25 v1!20 key2!15) lt!562049)))

(declare-fun bs!34949 () Bool)

(assert (= bs!34949 d!136489))

(assert (=> bs!34949 m!1144273))

(assert (=> bs!34949 m!1144275))

(assert (=> bs!34949 m!1144277))

(assert (=> bs!34949 m!1144273))

(assert (=> bs!34949 m!1144277))

(assert (=> bs!34949 m!1144279))

(declare-fun m!1144459 () Bool)

(assert (=> bs!34949 m!1144459))

(assert (=> b!1241992 d!136489))

(declare-fun b!1242235 () Bool)

(declare-fun res!828456 () Bool)

(declare-fun e!704144 () Bool)

(assert (=> b!1242235 (=> (not res!828456) (not e!704144))))

(declare-fun lt!562051 () List!27434)

(assert (=> b!1242235 (= res!828456 (containsKey!610 lt!562051 key1!25))))

(declare-fun b!1242236 () Bool)

(assert (=> b!1242236 (= e!704144 (contains!7364 lt!562051 (tuple2!20371 key1!25 v1!20)))))

(declare-fun b!1242237 () Bool)

(declare-fun e!704143 () List!27434)

(declare-fun call!61303 () List!27434)

(assert (=> b!1242237 (= e!704143 call!61303)))

(declare-fun b!1242238 () Bool)

(declare-fun e!704146 () List!27434)

(declare-fun call!61305 () List!27434)

(assert (=> b!1242238 (= e!704146 call!61305)))

(declare-fun bm!61300 () Bool)

(declare-fun e!704142 () List!27434)

(declare-fun call!61304 () List!27434)

(declare-fun c!121603 () Bool)

(assert (=> bm!61300 (= call!61304 ($colon$colon!627 e!704142 (ite c!121603 (h!28639 (t!40888 l!644)) (tuple2!20371 key1!25 v1!20))))))

(declare-fun c!121600 () Bool)

(assert (=> bm!61300 (= c!121600 c!121603)))

(declare-fun c!121602 () Bool)

(declare-fun b!1242239 () Bool)

(declare-fun c!121601 () Bool)

(assert (=> b!1242239 (= e!704142 (ite c!121602 (t!40888 (t!40888 l!644)) (ite c!121601 (Cons!27430 (h!28639 (t!40888 l!644)) (t!40888 (t!40888 l!644))) Nil!27431)))))

(declare-fun b!1242240 () Bool)

(declare-fun e!704145 () List!27434)

(assert (=> b!1242240 (= e!704145 call!61304)))

(declare-fun b!1242241 () Bool)

(assert (=> b!1242241 (= e!704142 (insertStrictlySorted!440 (t!40888 (t!40888 l!644)) key1!25 v1!20))))

(declare-fun bm!61301 () Bool)

(assert (=> bm!61301 (= call!61303 call!61304)))

(declare-fun b!1242243 () Bool)

(assert (=> b!1242243 (= e!704146 call!61305)))

(declare-fun b!1242244 () Bool)

(assert (=> b!1242244 (= c!121601 (and (is-Cons!27430 (t!40888 l!644)) (bvsgt (_1!10196 (h!28639 (t!40888 l!644))) key1!25)))))

(assert (=> b!1242244 (= e!704143 e!704146)))

(declare-fun bm!61302 () Bool)

(assert (=> bm!61302 (= call!61305 call!61303)))

(declare-fun d!136501 () Bool)

(assert (=> d!136501 e!704144))

(declare-fun res!828455 () Bool)

(assert (=> d!136501 (=> (not res!828455) (not e!704144))))

(assert (=> d!136501 (= res!828455 (isStrictlySorted!761 lt!562051))))

(assert (=> d!136501 (= lt!562051 e!704145)))

(assert (=> d!136501 (= c!121603 (and (is-Cons!27430 (t!40888 l!644)) (bvslt (_1!10196 (h!28639 (t!40888 l!644))) key1!25)))))

(assert (=> d!136501 (isStrictlySorted!761 (t!40888 l!644))))

(assert (=> d!136501 (= (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20) lt!562051)))

(declare-fun b!1242242 () Bool)

(assert (=> b!1242242 (= e!704145 e!704143)))

(assert (=> b!1242242 (= c!121602 (and (is-Cons!27430 (t!40888 l!644)) (= (_1!10196 (h!28639 (t!40888 l!644))) key1!25)))))

(assert (= (and d!136501 c!121603) b!1242240))

(assert (= (and d!136501 (not c!121603)) b!1242242))

(assert (= (and b!1242242 c!121602) b!1242237))

(assert (= (and b!1242242 (not c!121602)) b!1242244))

(assert (= (and b!1242244 c!121601) b!1242243))

(assert (= (and b!1242244 (not c!121601)) b!1242238))

(assert (= (or b!1242243 b!1242238) bm!61302))

(assert (= (or b!1242237 bm!61302) bm!61301))

(assert (= (or b!1242240 bm!61301) bm!61300))

(assert (= (and bm!61300 c!121600) b!1242241))

(assert (= (and bm!61300 (not c!121600)) b!1242239))

(assert (= (and d!136501 res!828455) b!1242235))

(assert (= (and b!1242235 res!828456) b!1242236))

(declare-fun m!1144463 () Bool)

(assert (=> b!1242236 m!1144463))

(declare-fun m!1144465 () Bool)

(assert (=> d!136501 m!1144465))

(assert (=> d!136501 m!1144263))

(declare-fun m!1144467 () Bool)

(assert (=> b!1242235 m!1144467))

(declare-fun m!1144469 () Bool)

(assert (=> bm!61300 m!1144469))

(declare-fun m!1144471 () Bool)

(assert (=> b!1242241 m!1144471))

(assert (=> b!1241992 d!136501))

(declare-fun e!704153 () List!27434)

(declare-fun b!1242255 () Bool)

(assert (=> b!1242255 (= e!704153 (t!40888 (insertStrictlySorted!440 l!644 key1!25 v1!20)))))

(declare-fun e!704154 () List!27434)

(declare-fun b!1242256 () Bool)

(assert (=> b!1242256 (= e!704154 ($colon$colon!627 (removeStrictlySorted!132 (t!40888 (insertStrictlySorted!440 l!644 key1!25 v1!20)) key2!15) (h!28639 (insertStrictlySorted!440 l!644 key1!25 v1!20))))))

(declare-fun b!1242257 () Bool)

(assert (=> b!1242257 (= e!704154 Nil!27431)))

(declare-fun b!1242258 () Bool)

(assert (=> b!1242258 (= e!704153 e!704154)))

(declare-fun c!121609 () Bool)

(assert (=> b!1242258 (= c!121609 (and (is-Cons!27430 (insertStrictlySorted!440 l!644 key1!25 v1!20)) (not (= (_1!10196 (h!28639 (insertStrictlySorted!440 l!644 key1!25 v1!20))) key2!15))))))

(declare-fun b!1242259 () Bool)

(declare-fun e!704152 () Bool)

(declare-fun lt!562053 () List!27434)

(assert (=> b!1242259 (= e!704152 (not (containsKey!610 lt!562053 key2!15)))))

(declare-fun d!136505 () Bool)

(assert (=> d!136505 e!704152))

(declare-fun res!828459 () Bool)

(assert (=> d!136505 (=> (not res!828459) (not e!704152))))

(assert (=> d!136505 (= res!828459 (isStrictlySorted!761 lt!562053))))

(assert (=> d!136505 (= lt!562053 e!704153)))

(declare-fun c!121608 () Bool)

(assert (=> d!136505 (= c!121608 (and (is-Cons!27430 (insertStrictlySorted!440 l!644 key1!25 v1!20)) (= (_1!10196 (h!28639 (insertStrictlySorted!440 l!644 key1!25 v1!20))) key2!15)))))

(assert (=> d!136505 (isStrictlySorted!761 (insertStrictlySorted!440 l!644 key1!25 v1!20))))

(assert (=> d!136505 (= (removeStrictlySorted!132 (insertStrictlySorted!440 l!644 key1!25 v1!20) key2!15) lt!562053)))

(assert (= (and d!136505 c!121608) b!1242255))

(assert (= (and d!136505 (not c!121608)) b!1242258))

(assert (= (and b!1242258 c!121609) b!1242256))

(assert (= (and b!1242258 (not c!121609)) b!1242257))

(assert (= (and d!136505 res!828459) b!1242259))

(declare-fun m!1144483 () Bool)

(assert (=> b!1242256 m!1144483))

(assert (=> b!1242256 m!1144483))

(declare-fun m!1144485 () Bool)

(assert (=> b!1242256 m!1144485))

(declare-fun m!1144487 () Bool)

(assert (=> b!1242259 m!1144487))

(declare-fun m!1144489 () Bool)

(assert (=> d!136505 m!1144489))

(assert (=> d!136505 m!1144271))

(declare-fun m!1144491 () Bool)

(assert (=> d!136505 m!1144491))

(assert (=> b!1241992 d!136505))

(declare-fun b!1242269 () Bool)

(declare-fun e!704163 () List!27434)

(assert (=> b!1242269 (= e!704163 (t!40888 (t!40888 l!644)))))

(declare-fun b!1242270 () Bool)

(declare-fun e!704164 () List!27434)

(assert (=> b!1242270 (= e!704164 ($colon$colon!627 (removeStrictlySorted!132 (t!40888 (t!40888 l!644)) key2!15) (h!28639 (t!40888 l!644))))))

(declare-fun b!1242271 () Bool)

(assert (=> b!1242271 (= e!704164 Nil!27431)))

(declare-fun b!1242272 () Bool)

(assert (=> b!1242272 (= e!704163 e!704164)))

(declare-fun c!121613 () Bool)

(assert (=> b!1242272 (= c!121613 (and (is-Cons!27430 (t!40888 l!644)) (not (= (_1!10196 (h!28639 (t!40888 l!644))) key2!15))))))

(declare-fun b!1242273 () Bool)

(declare-fun e!704162 () Bool)

(declare-fun lt!562055 () List!27434)

(assert (=> b!1242273 (= e!704162 (not (containsKey!610 lt!562055 key2!15)))))

(declare-fun d!136509 () Bool)

(assert (=> d!136509 e!704162))

(declare-fun res!828465 () Bool)

(assert (=> d!136509 (=> (not res!828465) (not e!704162))))

(assert (=> d!136509 (= res!828465 (isStrictlySorted!761 lt!562055))))

(assert (=> d!136509 (= lt!562055 e!704163)))

(declare-fun c!121612 () Bool)

(assert (=> d!136509 (= c!121612 (and (is-Cons!27430 (t!40888 l!644)) (= (_1!10196 (h!28639 (t!40888 l!644))) key2!15)))))

(assert (=> d!136509 (isStrictlySorted!761 (t!40888 l!644))))

(assert (=> d!136509 (= (removeStrictlySorted!132 (t!40888 l!644) key2!15) lt!562055)))

(assert (= (and d!136509 c!121612) b!1242269))

(assert (= (and d!136509 (not c!121612)) b!1242272))

(assert (= (and b!1242272 c!121613) b!1242270))

(assert (= (and b!1242272 (not c!121613)) b!1242271))

(assert (= (and d!136509 res!828465) b!1242273))

(declare-fun m!1144503 () Bool)

(assert (=> b!1242270 m!1144503))

(assert (=> b!1242270 m!1144503))

(declare-fun m!1144505 () Bool)

(assert (=> b!1242270 m!1144505))

(declare-fun m!1144507 () Bool)

(assert (=> b!1242273 m!1144507))

(declare-fun m!1144509 () Bool)

(assert (=> d!136509 m!1144509))

(assert (=> d!136509 m!1144263))

(assert (=> b!1241992 d!136509))

(declare-fun d!136513 () Bool)

(declare-fun res!828469 () Bool)

(declare-fun e!704170 () Bool)

(assert (=> d!136513 (=> res!828469 e!704170)))

(assert (=> d!136513 (= res!828469 (or (is-Nil!27431 (t!40888 l!644)) (is-Nil!27431 (t!40888 (t!40888 l!644)))))))

(assert (=> d!136513 (= (isStrictlySorted!761 (t!40888 l!644)) e!704170)))

(declare-fun b!1242281 () Bool)

(declare-fun e!704171 () Bool)

(assert (=> b!1242281 (= e!704170 e!704171)))

(declare-fun res!828470 () Bool)

(assert (=> b!1242281 (=> (not res!828470) (not e!704171))))

(assert (=> b!1242281 (= res!828470 (bvslt (_1!10196 (h!28639 (t!40888 l!644))) (_1!10196 (h!28639 (t!40888 (t!40888 l!644))))))))

(declare-fun b!1242282 () Bool)

(assert (=> b!1242282 (= e!704171 (isStrictlySorted!761 (t!40888 (t!40888 l!644))))))

(assert (= (and d!136513 (not res!828469)) b!1242281))

(assert (= (and b!1242281 res!828470) b!1242282))

(declare-fun m!1144519 () Bool)

(assert (=> b!1242282 m!1144519))

(assert (=> b!1241989 d!136513))

(declare-fun b!1242299 () Bool)

(declare-fun e!704182 () Bool)

(declare-fun tp!92757 () Bool)

(assert (=> b!1242299 (= e!704182 (and tp_is_empty!31289 tp!92757))))

(assert (=> b!1241990 (= tp!92750 e!704182)))

(assert (= (and b!1241990 (is-Cons!27430 (t!40888 l!644))) b!1242299))

(push 1)

(assert (not d!136465))

(assert (not b!1242282))

(assert (not b!1242270))

(assert (not b!1242185))

(assert (not d!136501))

(assert (not b!1242259))

(assert (not b!1242002))

(assert (not bm!61285))

(assert (not d!136505))

(assert (not d!136481))

(assert (not bm!61279))

(assert (not bm!61291))

(assert (not b!1242166))

(assert (not d!136509))

(assert (not b!1242273))

(assert (not b!1242299))

(assert (not d!136489))

(assert (not d!136475))

(assert (not d!136459))

(assert (not b!1242171))

(assert (not b!1242186))

(assert (not b!1242256))

(assert (not b!1242165))

(assert tp_is_empty!31289)

(assert (not d!136485))

(assert (not b!1242235))

(assert (not b!1242191))

(assert (not b!1242044))

(assert (not b!1242146))

(assert (not b!1242209))

(assert (not bm!61300))

(assert (not b!1242140))

(assert (not b!1242141))

(assert (not b!1242241))

(assert (not b!1242236))

(assert (not b!1242041))

(assert (not b!1242206))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136569 () Bool)

(declare-fun res!828524 () Bool)

(declare-fun e!704245 () Bool)

(assert (=> d!136569 (=> res!828524 e!704245)))

(assert (=> d!136569 (= res!828524 (or (is-Nil!27431 lt!562053) (is-Nil!27431 (t!40888 lt!562053))))))

(assert (=> d!136569 (= (isStrictlySorted!761 lt!562053) e!704245)))

(declare-fun b!1242379 () Bool)

(declare-fun e!704246 () Bool)

(assert (=> b!1242379 (= e!704245 e!704246)))

(declare-fun res!828525 () Bool)

(assert (=> b!1242379 (=> (not res!828525) (not e!704246))))

(assert (=> b!1242379 (= res!828525 (bvslt (_1!10196 (h!28639 lt!562053)) (_1!10196 (h!28639 (t!40888 lt!562053)))))))

(declare-fun b!1242380 () Bool)

(assert (=> b!1242380 (= e!704246 (isStrictlySorted!761 (t!40888 lt!562053)))))

(assert (= (and d!136569 (not res!828524)) b!1242379))

(assert (= (and b!1242379 res!828525) b!1242380))

(declare-fun m!1144609 () Bool)

(assert (=> b!1242380 m!1144609))

(assert (=> d!136505 d!136569))

(declare-fun d!136573 () Bool)

(declare-fun res!828526 () Bool)

(declare-fun e!704247 () Bool)

(assert (=> d!136573 (=> res!828526 e!704247)))

(assert (=> d!136573 (= res!828526 (or (is-Nil!27431 (insertStrictlySorted!440 l!644 key1!25 v1!20)) (is-Nil!27431 (t!40888 (insertStrictlySorted!440 l!644 key1!25 v1!20)))))))

(assert (=> d!136573 (= (isStrictlySorted!761 (insertStrictlySorted!440 l!644 key1!25 v1!20)) e!704247)))

(declare-fun b!1242381 () Bool)

(declare-fun e!704248 () Bool)

(assert (=> b!1242381 (= e!704247 e!704248)))

(declare-fun res!828527 () Bool)

(assert (=> b!1242381 (=> (not res!828527) (not e!704248))))

(assert (=> b!1242381 (= res!828527 (bvslt (_1!10196 (h!28639 (insertStrictlySorted!440 l!644 key1!25 v1!20))) (_1!10196 (h!28639 (t!40888 (insertStrictlySorted!440 l!644 key1!25 v1!20))))))))

(declare-fun b!1242382 () Bool)

(assert (=> b!1242382 (= e!704248 (isStrictlySorted!761 (t!40888 (insertStrictlySorted!440 l!644 key1!25 v1!20))))))

(assert (= (and d!136573 (not res!828526)) b!1242381))

(assert (= (and b!1242381 res!828527) b!1242382))

(declare-fun m!1144611 () Bool)

(assert (=> b!1242382 m!1144611))

(assert (=> d!136505 d!136573))

(assert (=> b!1242171 d!136501))

(declare-fun d!136577 () Bool)

(declare-fun res!828529 () Bool)

(declare-fun e!704252 () Bool)

(assert (=> d!136577 (=> res!828529 e!704252)))

(assert (=> d!136577 (= res!828529 (or (is-Nil!27431 lt!562037) (is-Nil!27431 (t!40888 lt!562037))))))

(assert (=> d!136577 (= (isStrictlySorted!761 lt!562037) e!704252)))

(declare-fun b!1242388 () Bool)

(declare-fun e!704253 () Bool)

(assert (=> b!1242388 (= e!704252 e!704253)))

(declare-fun res!828530 () Bool)

(assert (=> b!1242388 (=> (not res!828530) (not e!704253))))

(assert (=> b!1242388 (= res!828530 (bvslt (_1!10196 (h!28639 lt!562037)) (_1!10196 (h!28639 (t!40888 lt!562037)))))))

(declare-fun b!1242389 () Bool)

(assert (=> b!1242389 (= e!704253 (isStrictlySorted!761 (t!40888 lt!562037)))))

(assert (= (and d!136577 (not res!828529)) b!1242388))

(assert (= (and b!1242388 res!828530) b!1242389))

(declare-fun m!1144614 () Bool)

(assert (=> b!1242389 m!1144614))

(assert (=> d!136485 d!136577))

(assert (=> d!136485 d!136453))

(declare-fun d!136579 () Bool)

(assert (=> d!136579 (= (insertStrictlySorted!440 (removeStrictlySorted!132 (t!40888 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!132 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20) key2!15))))

(assert (=> d!136579 true))

(declare-fun _$3!72 () Unit!41110)

(assert (=> d!136579 (= (choose!1850 (t!40888 l!644) key1!25 v1!20 key2!15) _$3!72)))

(declare-fun bs!34951 () Bool)

(assert (= bs!34951 d!136579))

(assert (=> bs!34951 m!1144277))

(assert (=> bs!34951 m!1144277))

(assert (=> bs!34951 m!1144279))

(assert (=> bs!34951 m!1144273))

(assert (=> bs!34951 m!1144273))

(assert (=> bs!34951 m!1144275))

(assert (=> d!136489 d!136579))

(assert (=> d!136489 d!136459))

(assert (=> d!136489 d!136465))

(assert (=> d!136489 d!136501))

(assert (=> d!136489 d!136509))

(declare-fun d!136587 () Bool)

(assert (=> d!136587 (= ($colon$colon!627 (removeStrictlySorted!132 (t!40888 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20)) key2!15) (h!28639 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20))) (Cons!27430 (h!28639 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20)) (removeStrictlySorted!132 (t!40888 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20)) key2!15)))))

(assert (=> b!1242041 d!136587))

(declare-fun b!1242394 () Bool)

(declare-fun e!704259 () List!27434)

(assert (=> b!1242394 (= e!704259 (t!40888 (t!40888 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20))))))

(declare-fun e!704260 () List!27434)

(declare-fun b!1242395 () Bool)

(assert (=> b!1242395 (= e!704260 ($colon$colon!627 (removeStrictlySorted!132 (t!40888 (t!40888 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20))) key2!15) (h!28639 (t!40888 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20)))))))

(declare-fun b!1242396 () Bool)

(assert (=> b!1242396 (= e!704260 Nil!27431)))

(declare-fun b!1242397 () Bool)

(assert (=> b!1242397 (= e!704259 e!704260)))

(declare-fun c!121633 () Bool)

(assert (=> b!1242397 (= c!121633 (and (is-Cons!27430 (t!40888 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20))) (not (= (_1!10196 (h!28639 (t!40888 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20)))) key2!15))))))

(declare-fun b!1242398 () Bool)

(declare-fun e!704258 () Bool)

(declare-fun lt!562068 () List!27434)

(assert (=> b!1242398 (= e!704258 (not (containsKey!610 lt!562068 key2!15)))))

(declare-fun d!136591 () Bool)

(assert (=> d!136591 e!704258))

(declare-fun res!828535 () Bool)

(assert (=> d!136591 (=> (not res!828535) (not e!704258))))

(assert (=> d!136591 (= res!828535 (isStrictlySorted!761 lt!562068))))

(assert (=> d!136591 (= lt!562068 e!704259)))

(declare-fun c!121632 () Bool)

(assert (=> d!136591 (= c!121632 (and (is-Cons!27430 (t!40888 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20))) (= (_1!10196 (h!28639 (t!40888 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20)))) key2!15)))))

(assert (=> d!136591 (isStrictlySorted!761 (t!40888 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20)))))

(assert (=> d!136591 (= (removeStrictlySorted!132 (t!40888 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20)) key2!15) lt!562068)))

(assert (= (and d!136591 c!121632) b!1242394))

(assert (= (and d!136591 (not c!121632)) b!1242397))

(assert (= (and b!1242397 c!121633) b!1242395))

(assert (= (and b!1242397 (not c!121633)) b!1242396))

(assert (= (and d!136591 res!828535) b!1242398))

(declare-fun m!1144631 () Bool)

(assert (=> b!1242395 m!1144631))

(assert (=> b!1242395 m!1144631))

(declare-fun m!1144633 () Bool)

(assert (=> b!1242395 m!1144633))

(declare-fun m!1144637 () Bool)

(assert (=> b!1242398 m!1144637))

(declare-fun m!1144639 () Bool)

(assert (=> d!136591 m!1144639))

(declare-fun m!1144641 () Bool)

(assert (=> d!136591 m!1144641))

(assert (=> b!1242041 d!136591))

(assert (=> b!1242002 d!136513))

(declare-fun d!136599 () Bool)

(declare-fun res!828553 () Bool)

(declare-fun e!704281 () Bool)

(assert (=> d!136599 (=> res!828553 e!704281)))

(assert (=> d!136599 (= res!828553 (and (is-Cons!27430 lt!562035) (= (_1!10196 (h!28639 lt!562035)) key1!25)))))

(assert (=> d!136599 (= (containsKey!610 lt!562035 key1!25) e!704281)))

(declare-fun b!1242421 () Bool)

(declare-fun e!704282 () Bool)

(assert (=> b!1242421 (= e!704281 e!704282)))

(declare-fun res!828554 () Bool)

(assert (=> b!1242421 (=> (not res!828554) (not e!704282))))

(assert (=> b!1242421 (= res!828554 (and (or (not (is-Cons!27430 lt!562035)) (bvsle (_1!10196 (h!28639 lt!562035)) key1!25)) (is-Cons!27430 lt!562035) (bvslt (_1!10196 (h!28639 lt!562035)) key1!25)))))

(declare-fun b!1242422 () Bool)

(assert (=> b!1242422 (= e!704282 (containsKey!610 (t!40888 lt!562035) key1!25))))

(assert (= (and d!136599 (not res!828553)) b!1242421))

(assert (= (and b!1242421 res!828554) b!1242422))

(declare-fun m!1144661 () Bool)

(assert (=> b!1242422 m!1144661))

(assert (=> b!1242185 d!136599))

(declare-fun d!136613 () Bool)

(declare-fun res!828555 () Bool)

(declare-fun e!704283 () Bool)

(assert (=> d!136613 (=> res!828555 e!704283)))

(assert (=> d!136613 (= res!828555 (and (is-Cons!27430 lt!562051) (= (_1!10196 (h!28639 lt!562051)) key1!25)))))

(assert (=> d!136613 (= (containsKey!610 lt!562051 key1!25) e!704283)))

(declare-fun b!1242423 () Bool)

(declare-fun e!704284 () Bool)

(assert (=> b!1242423 (= e!704283 e!704284)))

(declare-fun res!828556 () Bool)

(assert (=> b!1242423 (=> (not res!828556) (not e!704284))))

(assert (=> b!1242423 (= res!828556 (and (or (not (is-Cons!27430 lt!562051)) (bvsle (_1!10196 (h!28639 lt!562051)) key1!25)) (is-Cons!27430 lt!562051) (bvslt (_1!10196 (h!28639 lt!562051)) key1!25)))))

(declare-fun b!1242424 () Bool)

(assert (=> b!1242424 (= e!704284 (containsKey!610 (t!40888 lt!562051) key1!25))))

(assert (= (and d!136613 (not res!828555)) b!1242423))

(assert (= (and b!1242423 res!828556) b!1242424))

(declare-fun m!1144663 () Bool)

(assert (=> b!1242424 m!1144663))

(assert (=> b!1242235 d!136613))

(declare-fun d!136615 () Bool)

(assert (=> d!136615 (= ($colon$colon!627 (removeStrictlySorted!132 (t!40888 (t!40888 l!644)) key2!15) (h!28639 (t!40888 l!644))) (Cons!27430 (h!28639 (t!40888 l!644)) (removeStrictlySorted!132 (t!40888 (t!40888 l!644)) key2!15)))))

(assert (=> b!1242270 d!136615))

(declare-fun b!1242425 () Bool)

(declare-fun e!704286 () List!27434)

(assert (=> b!1242425 (= e!704286 (t!40888 (t!40888 (t!40888 l!644))))))

(declare-fun b!1242426 () Bool)

(declare-fun e!704287 () List!27434)

(assert (=> b!1242426 (= e!704287 ($colon$colon!627 (removeStrictlySorted!132 (t!40888 (t!40888 (t!40888 l!644))) key2!15) (h!28639 (t!40888 (t!40888 l!644)))))))

(declare-fun b!1242427 () Bool)

(assert (=> b!1242427 (= e!704287 Nil!27431)))

(declare-fun b!1242428 () Bool)

(assert (=> b!1242428 (= e!704286 e!704287)))

(declare-fun c!121637 () Bool)

(assert (=> b!1242428 (= c!121637 (and (is-Cons!27430 (t!40888 (t!40888 l!644))) (not (= (_1!10196 (h!28639 (t!40888 (t!40888 l!644)))) key2!15))))))

(declare-fun b!1242429 () Bool)

(declare-fun e!704285 () Bool)

(declare-fun lt!562070 () List!27434)

(assert (=> b!1242429 (= e!704285 (not (containsKey!610 lt!562070 key2!15)))))

(declare-fun d!136617 () Bool)

(assert (=> d!136617 e!704285))

(declare-fun res!828557 () Bool)

(assert (=> d!136617 (=> (not res!828557) (not e!704285))))

(assert (=> d!136617 (= res!828557 (isStrictlySorted!761 lt!562070))))

(assert (=> d!136617 (= lt!562070 e!704286)))

(declare-fun c!121636 () Bool)

(assert (=> d!136617 (= c!121636 (and (is-Cons!27430 (t!40888 (t!40888 l!644))) (= (_1!10196 (h!28639 (t!40888 (t!40888 l!644)))) key2!15)))))

(assert (=> d!136617 (isStrictlySorted!761 (t!40888 (t!40888 l!644)))))

(assert (=> d!136617 (= (removeStrictlySorted!132 (t!40888 (t!40888 l!644)) key2!15) lt!562070)))

(assert (= (and d!136617 c!121636) b!1242425))

(assert (= (and d!136617 (not c!121636)) b!1242428))

(assert (= (and b!1242428 c!121637) b!1242426))

(assert (= (and b!1242428 (not c!121637)) b!1242427))

(assert (= (and d!136617 res!828557) b!1242429))

(declare-fun m!1144665 () Bool)

(assert (=> b!1242426 m!1144665))

(assert (=> b!1242426 m!1144665))

(declare-fun m!1144667 () Bool)

(assert (=> b!1242426 m!1144667))

(declare-fun m!1144669 () Bool)

(assert (=> b!1242429 m!1144669))

(declare-fun m!1144671 () Bool)

(assert (=> d!136617 m!1144671))

(assert (=> d!136617 m!1144519))

(assert (=> b!1242270 d!136617))

(declare-fun lt!562073 () Bool)

(declare-fun d!136619 () Bool)

(declare-fun content!602 (List!27434) (Set tuple2!20370))

(assert (=> d!136619 (= lt!562073 (set.member (tuple2!20371 key1!25 v1!20) (content!602 lt!562035)))))

(declare-fun e!704293 () Bool)

(assert (=> d!136619 (= lt!562073 e!704293)))

(declare-fun res!828563 () Bool)

(assert (=> d!136619 (=> (not res!828563) (not e!704293))))

(assert (=> d!136619 (= res!828563 (is-Cons!27430 lt!562035))))

(assert (=> d!136619 (= (contains!7364 lt!562035 (tuple2!20371 key1!25 v1!20)) lt!562073)))

(declare-fun b!1242434 () Bool)

(declare-fun e!704292 () Bool)

(assert (=> b!1242434 (= e!704293 e!704292)))

(declare-fun res!828562 () Bool)

(assert (=> b!1242434 (=> res!828562 e!704292)))

(assert (=> b!1242434 (= res!828562 (= (h!28639 lt!562035) (tuple2!20371 key1!25 v1!20)))))

(declare-fun b!1242435 () Bool)

(assert (=> b!1242435 (= e!704292 (contains!7364 (t!40888 lt!562035) (tuple2!20371 key1!25 v1!20)))))

(assert (= (and d!136619 res!828563) b!1242434))

(assert (= (and b!1242434 (not res!828562)) b!1242435))

(declare-fun m!1144673 () Bool)

(assert (=> d!136619 m!1144673))

(declare-fun m!1144675 () Bool)

(assert (=> d!136619 m!1144675))

(declare-fun m!1144677 () Bool)

(assert (=> b!1242435 m!1144677))

(assert (=> b!1242186 d!136619))

(declare-fun lt!562074 () Bool)

(declare-fun d!136621 () Bool)

(assert (=> d!136621 (= lt!562074 (set.member (tuple2!20371 key1!25 v1!20) (content!602 lt!562051)))))

(declare-fun e!704295 () Bool)

(assert (=> d!136621 (= lt!562074 e!704295)))

(declare-fun res!828565 () Bool)

(assert (=> d!136621 (=> (not res!828565) (not e!704295))))

(assert (=> d!136621 (= res!828565 (is-Cons!27430 lt!562051))))

(assert (=> d!136621 (= (contains!7364 lt!562051 (tuple2!20371 key1!25 v1!20)) lt!562074)))

(declare-fun b!1242436 () Bool)

(declare-fun e!704294 () Bool)

(assert (=> b!1242436 (= e!704295 e!704294)))

(declare-fun res!828564 () Bool)

(assert (=> b!1242436 (=> res!828564 e!704294)))

(assert (=> b!1242436 (= res!828564 (= (h!28639 lt!562051) (tuple2!20371 key1!25 v1!20)))))

(declare-fun b!1242437 () Bool)

(assert (=> b!1242437 (= e!704294 (contains!7364 (t!40888 lt!562051) (tuple2!20371 key1!25 v1!20)))))

(assert (= (and d!136621 res!828565) b!1242436))

(assert (= (and b!1242436 (not res!828564)) b!1242437))

(declare-fun m!1144679 () Bool)

(assert (=> d!136621 m!1144679))

(declare-fun m!1144681 () Bool)

(assert (=> d!136621 m!1144681))

(declare-fun m!1144683 () Bool)

(assert (=> b!1242437 m!1144683))

(assert (=> b!1242236 d!136621))

(declare-fun d!136623 () Bool)

(declare-fun res!828566 () Bool)

(declare-fun e!704296 () Bool)

(assert (=> d!136623 (=> res!828566 e!704296)))

(assert (=> d!136623 (= res!828566 (or (is-Nil!27431 lt!562035) (is-Nil!27431 (t!40888 lt!562035))))))

(assert (=> d!136623 (= (isStrictlySorted!761 lt!562035) e!704296)))

(declare-fun b!1242438 () Bool)

(declare-fun e!704297 () Bool)

(assert (=> b!1242438 (= e!704296 e!704297)))

(declare-fun res!828567 () Bool)

(assert (=> b!1242438 (=> (not res!828567) (not e!704297))))

(assert (=> b!1242438 (= res!828567 (bvslt (_1!10196 (h!28639 lt!562035)) (_1!10196 (h!28639 (t!40888 lt!562035)))))))

(declare-fun b!1242439 () Bool)

(assert (=> b!1242439 (= e!704297 (isStrictlySorted!761 (t!40888 lt!562035)))))

(assert (= (and d!136623 (not res!828566)) b!1242438))

(assert (= (and b!1242438 res!828567) b!1242439))

(declare-fun m!1144685 () Bool)

(assert (=> b!1242439 m!1144685))

(assert (=> d!136481 d!136623))

(declare-fun d!136625 () Bool)

(declare-fun res!828568 () Bool)

(declare-fun e!704298 () Bool)

(assert (=> d!136625 (=> res!828568 e!704298)))

(assert (=> d!136625 (= res!828568 (or (is-Nil!27431 (removeStrictlySorted!132 l!644 key2!15)) (is-Nil!27431 (t!40888 (removeStrictlySorted!132 l!644 key2!15)))))))

(assert (=> d!136625 (= (isStrictlySorted!761 (removeStrictlySorted!132 l!644 key2!15)) e!704298)))

(declare-fun b!1242440 () Bool)

(declare-fun e!704299 () Bool)

(assert (=> b!1242440 (= e!704298 e!704299)))

(declare-fun res!828569 () Bool)

(assert (=> b!1242440 (=> (not res!828569) (not e!704299))))

(assert (=> b!1242440 (= res!828569 (bvslt (_1!10196 (h!28639 (removeStrictlySorted!132 l!644 key2!15))) (_1!10196 (h!28639 (t!40888 (removeStrictlySorted!132 l!644 key2!15))))))))

(declare-fun b!1242441 () Bool)

(assert (=> b!1242441 (= e!704299 (isStrictlySorted!761 (t!40888 (removeStrictlySorted!132 l!644 key2!15))))))

(assert (= (and d!136625 (not res!828568)) b!1242440))

(assert (= (and b!1242440 res!828569) b!1242441))

(declare-fun m!1144687 () Bool)

(assert (=> b!1242441 m!1144687))

(assert (=> d!136481 d!136625))

(declare-fun d!136627 () Bool)

(declare-fun res!828570 () Bool)

(declare-fun e!704300 () Bool)

(assert (=> d!136627 (=> res!828570 e!704300)))

(assert (=> d!136627 (= res!828570 (and (is-Cons!27430 lt!562019) (= (_1!10196 (h!28639 lt!562019)) key2!15)))))

(assert (=> d!136627 (= (containsKey!610 lt!562019 key2!15) e!704300)))

(declare-fun b!1242442 () Bool)

(declare-fun e!704301 () Bool)

(assert (=> b!1242442 (= e!704300 e!704301)))

(declare-fun res!828571 () Bool)

(assert (=> b!1242442 (=> (not res!828571) (not e!704301))))

(assert (=> b!1242442 (= res!828571 (and (or (not (is-Cons!27430 lt!562019)) (bvsle (_1!10196 (h!28639 lt!562019)) key2!15)) (is-Cons!27430 lt!562019) (bvslt (_1!10196 (h!28639 lt!562019)) key2!15)))))

(declare-fun b!1242443 () Bool)

(assert (=> b!1242443 (= e!704301 (containsKey!610 (t!40888 lt!562019) key2!15))))

(assert (= (and d!136627 (not res!828570)) b!1242442))

(assert (= (and b!1242442 res!828571) b!1242443))

(declare-fun m!1144689 () Bool)

(assert (=> b!1242443 m!1144689))

(assert (=> b!1242044 d!136627))

(declare-fun d!136629 () Bool)

(assert (=> d!136629 (= ($colon$colon!627 (removeStrictlySorted!132 (t!40888 (insertStrictlySorted!440 l!644 key1!25 v1!20)) key2!15) (h!28639 (insertStrictlySorted!440 l!644 key1!25 v1!20))) (Cons!27430 (h!28639 (insertStrictlySorted!440 l!644 key1!25 v1!20)) (removeStrictlySorted!132 (t!40888 (insertStrictlySorted!440 l!644 key1!25 v1!20)) key2!15)))))

(assert (=> b!1242256 d!136629))

(declare-fun b!1242444 () Bool)

(declare-fun e!704303 () List!27434)

(assert (=> b!1242444 (= e!704303 (t!40888 (t!40888 (insertStrictlySorted!440 l!644 key1!25 v1!20))))))

(declare-fun e!704304 () List!27434)

(declare-fun b!1242445 () Bool)

(assert (=> b!1242445 (= e!704304 ($colon$colon!627 (removeStrictlySorted!132 (t!40888 (t!40888 (insertStrictlySorted!440 l!644 key1!25 v1!20))) key2!15) (h!28639 (t!40888 (insertStrictlySorted!440 l!644 key1!25 v1!20)))))))

(declare-fun b!1242446 () Bool)

(assert (=> b!1242446 (= e!704304 Nil!27431)))

(declare-fun b!1242447 () Bool)

(assert (=> b!1242447 (= e!704303 e!704304)))

(declare-fun c!121639 () Bool)

(assert (=> b!1242447 (= c!121639 (and (is-Cons!27430 (t!40888 (insertStrictlySorted!440 l!644 key1!25 v1!20))) (not (= (_1!10196 (h!28639 (t!40888 (insertStrictlySorted!440 l!644 key1!25 v1!20)))) key2!15))))))

(declare-fun b!1242448 () Bool)

(declare-fun e!704302 () Bool)

(declare-fun lt!562075 () List!27434)

(assert (=> b!1242448 (= e!704302 (not (containsKey!610 lt!562075 key2!15)))))

(declare-fun d!136631 () Bool)

(assert (=> d!136631 e!704302))

(declare-fun res!828572 () Bool)

(assert (=> d!136631 (=> (not res!828572) (not e!704302))))

(assert (=> d!136631 (= res!828572 (isStrictlySorted!761 lt!562075))))

(assert (=> d!136631 (= lt!562075 e!704303)))

(declare-fun c!121638 () Bool)

(assert (=> d!136631 (= c!121638 (and (is-Cons!27430 (t!40888 (insertStrictlySorted!440 l!644 key1!25 v1!20))) (= (_1!10196 (h!28639 (t!40888 (insertStrictlySorted!440 l!644 key1!25 v1!20)))) key2!15)))))

(assert (=> d!136631 (isStrictlySorted!761 (t!40888 (insertStrictlySorted!440 l!644 key1!25 v1!20)))))

(assert (=> d!136631 (= (removeStrictlySorted!132 (t!40888 (insertStrictlySorted!440 l!644 key1!25 v1!20)) key2!15) lt!562075)))

(assert (= (and d!136631 c!121638) b!1242444))

(assert (= (and d!136631 (not c!121638)) b!1242447))

(assert (= (and b!1242447 c!121639) b!1242445))

(assert (= (and b!1242447 (not c!121639)) b!1242446))

(assert (= (and d!136631 res!828572) b!1242448))

(declare-fun m!1144691 () Bool)

(assert (=> b!1242445 m!1144691))

(assert (=> b!1242445 m!1144691))

(declare-fun m!1144693 () Bool)

(assert (=> b!1242445 m!1144693))

(declare-fun m!1144695 () Bool)

(assert (=> b!1242448 m!1144695))

(declare-fun m!1144697 () Bool)

(assert (=> d!136631 m!1144697))

(assert (=> d!136631 m!1144611))

(assert (=> b!1242256 d!136631))

(declare-fun d!136633 () Bool)

(declare-fun res!828573 () Bool)

(declare-fun e!704305 () Bool)

(assert (=> d!136633 (=> res!828573 e!704305)))

(assert (=> d!136633 (= res!828573 (and (is-Cons!27430 lt!562055) (= (_1!10196 (h!28639 lt!562055)) key2!15)))))

(assert (=> d!136633 (= (containsKey!610 lt!562055 key2!15) e!704305)))

(declare-fun b!1242449 () Bool)

(declare-fun e!704306 () Bool)

(assert (=> b!1242449 (= e!704305 e!704306)))

(declare-fun res!828574 () Bool)

(assert (=> b!1242449 (=> (not res!828574) (not e!704306))))

(assert (=> b!1242449 (= res!828574 (and (or (not (is-Cons!27430 lt!562055)) (bvsle (_1!10196 (h!28639 lt!562055)) key2!15)) (is-Cons!27430 lt!562055) (bvslt (_1!10196 (h!28639 lt!562055)) key2!15)))))

(declare-fun b!1242450 () Bool)

(assert (=> b!1242450 (= e!704306 (containsKey!610 (t!40888 lt!562055) key2!15))))

(assert (= (and d!136633 (not res!828573)) b!1242449))

(assert (= (and b!1242449 res!828574) b!1242450))

(declare-fun m!1144699 () Bool)

(assert (=> b!1242450 m!1144699))

(assert (=> b!1242273 d!136633))

(declare-fun d!136635 () Bool)

(declare-fun res!828575 () Bool)

(declare-fun e!704307 () Bool)

(assert (=> d!136635 (=> res!828575 e!704307)))

(assert (=> d!136635 (= res!828575 (or (is-Nil!27431 lt!562051) (is-Nil!27431 (t!40888 lt!562051))))))

(assert (=> d!136635 (= (isStrictlySorted!761 lt!562051) e!704307)))

(declare-fun b!1242451 () Bool)

(declare-fun e!704308 () Bool)

(assert (=> b!1242451 (= e!704307 e!704308)))

(declare-fun res!828576 () Bool)

(assert (=> b!1242451 (=> (not res!828576) (not e!704308))))

(assert (=> b!1242451 (= res!828576 (bvslt (_1!10196 (h!28639 lt!562051)) (_1!10196 (h!28639 (t!40888 lt!562051)))))))

(declare-fun b!1242452 () Bool)

(assert (=> b!1242452 (= e!704308 (isStrictlySorted!761 (t!40888 lt!562051)))))

(assert (= (and d!136635 (not res!828575)) b!1242451))

(assert (= (and b!1242451 res!828576) b!1242452))

(declare-fun m!1144701 () Bool)

(assert (=> b!1242452 m!1144701))

(assert (=> d!136501 d!136635))

(assert (=> d!136501 d!136513))

(declare-fun d!136637 () Bool)

(declare-fun res!828577 () Bool)

(declare-fun e!704309 () Bool)

(assert (=> d!136637 (=> res!828577 e!704309)))

(assert (=> d!136637 (= res!828577 (and (is-Cons!27430 lt!562030) (= (_1!10196 (h!28639 lt!562030)) key1!25)))))

(assert (=> d!136637 (= (containsKey!610 lt!562030 key1!25) e!704309)))

(declare-fun b!1242453 () Bool)

(declare-fun e!704310 () Bool)

(assert (=> b!1242453 (= e!704309 e!704310)))

(declare-fun res!828578 () Bool)

(assert (=> b!1242453 (=> (not res!828578) (not e!704310))))

(assert (=> b!1242453 (= res!828578 (and (or (not (is-Cons!27430 lt!562030)) (bvsle (_1!10196 (h!28639 lt!562030)) key1!25)) (is-Cons!27430 lt!562030) (bvslt (_1!10196 (h!28639 lt!562030)) key1!25)))))

(declare-fun b!1242454 () Bool)

(assert (=> b!1242454 (= e!704310 (containsKey!610 (t!40888 lt!562030) key1!25))))

(assert (= (and d!136637 (not res!828577)) b!1242453))

(assert (= (and b!1242453 res!828578) b!1242454))

(declare-fun m!1144703 () Bool)

(assert (=> b!1242454 m!1144703))

(assert (=> b!1242140 d!136637))

(declare-fun d!136639 () Bool)

(assert (=> d!136639 (= ($colon$colon!627 e!704115 (ite c!121583 (h!28639 (removeStrictlySorted!132 l!644 key2!15)) (tuple2!20371 key1!25 v1!20))) (Cons!27430 (ite c!121583 (h!28639 (removeStrictlySorted!132 l!644 key2!15)) (tuple2!20371 key1!25 v1!20)) e!704115))))

(assert (=> bm!61291 d!136639))

(declare-fun d!136641 () Bool)

(assert (=> d!136641 (= ($colon$colon!627 e!704142 (ite c!121603 (h!28639 (t!40888 l!644)) (tuple2!20371 key1!25 v1!20))) (Cons!27430 (ite c!121603 (h!28639 (t!40888 l!644)) (tuple2!20371 key1!25 v1!20)) e!704142))))

(assert (=> bm!61300 d!136641))

(declare-fun lt!562076 () Bool)

(declare-fun d!136643 () Bool)

(assert (=> d!136643 (= lt!562076 (set.member (tuple2!20371 key1!25 v1!20) (content!602 lt!562030)))))

(declare-fun e!704312 () Bool)

(assert (=> d!136643 (= lt!562076 e!704312)))

(declare-fun res!828580 () Bool)

(assert (=> d!136643 (=> (not res!828580) (not e!704312))))

(assert (=> d!136643 (= res!828580 (is-Cons!27430 lt!562030))))

(assert (=> d!136643 (= (contains!7364 lt!562030 (tuple2!20371 key1!25 v1!20)) lt!562076)))

(declare-fun b!1242455 () Bool)

(declare-fun e!704311 () Bool)

(assert (=> b!1242455 (= e!704312 e!704311)))

(declare-fun res!828579 () Bool)

(assert (=> b!1242455 (=> res!828579 e!704311)))

(assert (=> b!1242455 (= res!828579 (= (h!28639 lt!562030) (tuple2!20371 key1!25 v1!20)))))

(declare-fun b!1242456 () Bool)

(assert (=> b!1242456 (= e!704311 (contains!7364 (t!40888 lt!562030) (tuple2!20371 key1!25 v1!20)))))

(assert (= (and d!136643 res!828580) b!1242455))

(assert (= (and b!1242455 (not res!828579)) b!1242456))

(declare-fun m!1144705 () Bool)

(assert (=> d!136643 m!1144705))

(declare-fun m!1144707 () Bool)

(assert (=> d!136643 m!1144707))

(declare-fun m!1144709 () Bool)

(assert (=> b!1242456 m!1144709))

(assert (=> b!1242141 d!136643))

(declare-fun d!136645 () Bool)

(declare-fun res!828581 () Bool)

(declare-fun e!704313 () Bool)

(assert (=> d!136645 (=> res!828581 e!704313)))

(assert (=> d!136645 (= res!828581 (and (is-Cons!27430 lt!562053) (= (_1!10196 (h!28639 lt!562053)) key2!15)))))

(assert (=> d!136645 (= (containsKey!610 lt!562053 key2!15) e!704313)))

(declare-fun b!1242457 () Bool)

(declare-fun e!704314 () Bool)

(assert (=> b!1242457 (= e!704313 e!704314)))

(declare-fun res!828582 () Bool)

(assert (=> b!1242457 (=> (not res!828582) (not e!704314))))

(assert (=> b!1242457 (= res!828582 (and (or (not (is-Cons!27430 lt!562053)) (bvsle (_1!10196 (h!28639 lt!562053)) key2!15)) (is-Cons!27430 lt!562053) (bvslt (_1!10196 (h!28639 lt!562053)) key2!15)))))

(declare-fun b!1242458 () Bool)

(assert (=> b!1242458 (= e!704314 (containsKey!610 (t!40888 lt!562053) key2!15))))

(assert (= (and d!136645 (not res!828581)) b!1242457))

(assert (= (and b!1242457 res!828582) b!1242458))

(declare-fun m!1144711 () Bool)

(assert (=> b!1242458 m!1144711))

(assert (=> b!1242259 d!136645))

(declare-fun d!136647 () Bool)

(declare-fun res!828583 () Bool)

(declare-fun e!704315 () Bool)

(assert (=> d!136647 (=> res!828583 e!704315)))

(assert (=> d!136647 (= res!828583 (or (is-Nil!27431 (t!40888 (t!40888 l!644))) (is-Nil!27431 (t!40888 (t!40888 (t!40888 l!644))))))))

(assert (=> d!136647 (= (isStrictlySorted!761 (t!40888 (t!40888 l!644))) e!704315)))

(declare-fun b!1242459 () Bool)

(declare-fun e!704316 () Bool)

(assert (=> b!1242459 (= e!704315 e!704316)))

(declare-fun res!828584 () Bool)

(assert (=> b!1242459 (=> (not res!828584) (not e!704316))))

(assert (=> b!1242459 (= res!828584 (bvslt (_1!10196 (h!28639 (t!40888 (t!40888 l!644)))) (_1!10196 (h!28639 (t!40888 (t!40888 (t!40888 l!644)))))))))

(declare-fun b!1242460 () Bool)

(assert (=> b!1242460 (= e!704316 (isStrictlySorted!761 (t!40888 (t!40888 (t!40888 l!644)))))))

(assert (= (and d!136647 (not res!828583)) b!1242459))

(assert (= (and b!1242459 res!828584) b!1242460))

(declare-fun m!1144713 () Bool)

(assert (=> b!1242460 m!1144713))

(assert (=> b!1242282 d!136647))

(declare-fun d!136649 () Bool)

(declare-fun res!828585 () Bool)

(declare-fun e!704317 () Bool)

(assert (=> d!136649 (=> res!828585 e!704317)))

(assert (=> d!136649 (= res!828585 (or (is-Nil!27431 lt!562030) (is-Nil!27431 (t!40888 lt!562030))))))

(assert (=> d!136649 (= (isStrictlySorted!761 lt!562030) e!704317)))

(declare-fun b!1242461 () Bool)

(declare-fun e!704318 () Bool)

(assert (=> b!1242461 (= e!704317 e!704318)))

(declare-fun res!828586 () Bool)

(assert (=> b!1242461 (=> (not res!828586) (not e!704318))))

(assert (=> b!1242461 (= res!828586 (bvslt (_1!10196 (h!28639 lt!562030)) (_1!10196 (h!28639 (t!40888 lt!562030)))))))

(declare-fun b!1242462 () Bool)

(assert (=> b!1242462 (= e!704318 (isStrictlySorted!761 (t!40888 lt!562030)))))

(assert (= (and d!136649 (not res!828585)) b!1242461))

(assert (= (and b!1242461 res!828586) b!1242462))

(declare-fun m!1144715 () Bool)

(assert (=> b!1242462 m!1144715))

(assert (=> d!136465 d!136649))

(declare-fun d!136651 () Bool)

(declare-fun res!828587 () Bool)

(declare-fun e!704319 () Bool)

(assert (=> d!136651 (=> res!828587 e!704319)))

(assert (=> d!136651 (= res!828587 (or (is-Nil!27431 (removeStrictlySorted!132 (t!40888 l!644) key2!15)) (is-Nil!27431 (t!40888 (removeStrictlySorted!132 (t!40888 l!644) key2!15)))))))

(assert (=> d!136651 (= (isStrictlySorted!761 (removeStrictlySorted!132 (t!40888 l!644) key2!15)) e!704319)))

(declare-fun b!1242463 () Bool)

(declare-fun e!704320 () Bool)

(assert (=> b!1242463 (= e!704319 e!704320)))

(declare-fun res!828588 () Bool)

(assert (=> b!1242463 (=> (not res!828588) (not e!704320))))

(assert (=> b!1242463 (= res!828588 (bvslt (_1!10196 (h!28639 (removeStrictlySorted!132 (t!40888 l!644) key2!15))) (_1!10196 (h!28639 (t!40888 (removeStrictlySorted!132 (t!40888 l!644) key2!15))))))))

(declare-fun b!1242464 () Bool)

(assert (=> b!1242464 (= e!704320 (isStrictlySorted!761 (t!40888 (removeStrictlySorted!132 (t!40888 l!644) key2!15))))))

(assert (= (and d!136651 (not res!828587)) b!1242463))

(assert (= (and b!1242463 res!828588) b!1242464))

(declare-fun m!1144717 () Bool)

(assert (=> b!1242464 m!1144717))

(assert (=> d!136465 d!136651))

(declare-fun d!136653 () Bool)

(declare-fun res!828589 () Bool)

(declare-fun e!704321 () Bool)

(assert (=> d!136653 (=> res!828589 e!704321)))

(assert (=> d!136653 (= res!828589 (or (is-Nil!27431 lt!562033) (is-Nil!27431 (t!40888 lt!562033))))))

(assert (=> d!136653 (= (isStrictlySorted!761 lt!562033) e!704321)))

(declare-fun b!1242465 () Bool)

(declare-fun e!704322 () Bool)

(assert (=> b!1242465 (= e!704321 e!704322)))

(declare-fun res!828590 () Bool)

(assert (=> b!1242465 (=> (not res!828590) (not e!704322))))

(assert (=> b!1242465 (= res!828590 (bvslt (_1!10196 (h!28639 lt!562033)) (_1!10196 (h!28639 (t!40888 lt!562033)))))))

(declare-fun b!1242466 () Bool)

(assert (=> b!1242466 (= e!704322 (isStrictlySorted!761 (t!40888 lt!562033)))))

(assert (= (and d!136653 (not res!828589)) b!1242465))

(assert (= (and b!1242465 res!828590) b!1242466))

(declare-fun m!1144719 () Bool)

(assert (=> b!1242466 m!1144719))

(assert (=> d!136475 d!136653))

(assert (=> d!136475 d!136453))

(declare-fun b!1242467 () Bool)

(declare-fun res!828592 () Bool)

(declare-fun e!704325 () Bool)

(assert (=> b!1242467 (=> (not res!828592) (not e!704325))))

(declare-fun lt!562077 () List!27434)

(assert (=> b!1242467 (= res!828592 (containsKey!610 lt!562077 key1!25))))

(declare-fun b!1242468 () Bool)

(assert (=> b!1242468 (= e!704325 (contains!7364 lt!562077 (tuple2!20371 key1!25 v1!20)))))

(declare-fun b!1242469 () Bool)

(declare-fun e!704324 () List!27434)

(declare-fun call!61318 () List!27434)

(assert (=> b!1242469 (= e!704324 call!61318)))

(declare-fun b!1242470 () Bool)

(declare-fun e!704327 () List!27434)

(declare-fun call!61320 () List!27434)

(assert (=> b!1242470 (= e!704327 call!61320)))

(declare-fun c!121643 () Bool)

(declare-fun e!704323 () List!27434)

(declare-fun call!61319 () List!27434)

(declare-fun bm!61315 () Bool)

(assert (=> bm!61315 (= call!61319 ($colon$colon!627 e!704323 (ite c!121643 (h!28639 (t!40888 (removeStrictlySorted!132 l!644 key2!15))) (tuple2!20371 key1!25 v1!20))))))

(declare-fun c!121640 () Bool)

(assert (=> bm!61315 (= c!121640 c!121643)))

(declare-fun c!121641 () Bool)

(declare-fun c!121642 () Bool)

(declare-fun b!1242471 () Bool)

(assert (=> b!1242471 (= e!704323 (ite c!121642 (t!40888 (t!40888 (removeStrictlySorted!132 l!644 key2!15))) (ite c!121641 (Cons!27430 (h!28639 (t!40888 (removeStrictlySorted!132 l!644 key2!15))) (t!40888 (t!40888 (removeStrictlySorted!132 l!644 key2!15)))) Nil!27431)))))

(declare-fun b!1242472 () Bool)

(declare-fun e!704326 () List!27434)

(assert (=> b!1242472 (= e!704326 call!61319)))

(declare-fun b!1242473 () Bool)

(assert (=> b!1242473 (= e!704323 (insertStrictlySorted!440 (t!40888 (t!40888 (removeStrictlySorted!132 l!644 key2!15))) key1!25 v1!20))))

(declare-fun bm!61316 () Bool)

(assert (=> bm!61316 (= call!61318 call!61319)))

(declare-fun b!1242475 () Bool)

(assert (=> b!1242475 (= e!704327 call!61320)))

(declare-fun b!1242476 () Bool)

(assert (=> b!1242476 (= c!121641 (and (is-Cons!27430 (t!40888 (removeStrictlySorted!132 l!644 key2!15))) (bvsgt (_1!10196 (h!28639 (t!40888 (removeStrictlySorted!132 l!644 key2!15)))) key1!25)))))

(assert (=> b!1242476 (= e!704324 e!704327)))

(declare-fun bm!61317 () Bool)

(assert (=> bm!61317 (= call!61320 call!61318)))

(declare-fun d!136655 () Bool)

(assert (=> d!136655 e!704325))

(declare-fun res!828591 () Bool)

(assert (=> d!136655 (=> (not res!828591) (not e!704325))))

(assert (=> d!136655 (= res!828591 (isStrictlySorted!761 lt!562077))))

(assert (=> d!136655 (= lt!562077 e!704326)))

(assert (=> d!136655 (= c!121643 (and (is-Cons!27430 (t!40888 (removeStrictlySorted!132 l!644 key2!15))) (bvslt (_1!10196 (h!28639 (t!40888 (removeStrictlySorted!132 l!644 key2!15)))) key1!25)))))

(assert (=> d!136655 (isStrictlySorted!761 (t!40888 (removeStrictlySorted!132 l!644 key2!15)))))

(assert (=> d!136655 (= (insertStrictlySorted!440 (t!40888 (removeStrictlySorted!132 l!644 key2!15)) key1!25 v1!20) lt!562077)))

(declare-fun b!1242474 () Bool)

(assert (=> b!1242474 (= e!704326 e!704324)))

(assert (=> b!1242474 (= c!121642 (and (is-Cons!27430 (t!40888 (removeStrictlySorted!132 l!644 key2!15))) (= (_1!10196 (h!28639 (t!40888 (removeStrictlySorted!132 l!644 key2!15)))) key1!25)))))

(assert (= (and d!136655 c!121643) b!1242472))

(assert (= (and d!136655 (not c!121643)) b!1242474))

(assert (= (and b!1242474 c!121642) b!1242469))

(assert (= (and b!1242474 (not c!121642)) b!1242476))

(assert (= (and b!1242476 c!121641) b!1242475))

(assert (= (and b!1242476 (not c!121641)) b!1242470))

(assert (= (or b!1242475 b!1242470) bm!61317))

(assert (= (or b!1242469 bm!61317) bm!61316))

(assert (= (or b!1242472 bm!61316) bm!61315))

(assert (= (and bm!61315 c!121640) b!1242473))

(assert (= (and bm!61315 (not c!121640)) b!1242471))

(assert (= (and d!136655 res!828591) b!1242467))

(assert (= (and b!1242467 res!828592) b!1242468))

(declare-fun m!1144721 () Bool)

(assert (=> b!1242468 m!1144721))

(declare-fun m!1144723 () Bool)

(assert (=> d!136655 m!1144723))

(assert (=> d!136655 m!1144687))

(declare-fun m!1144725 () Bool)

(assert (=> b!1242467 m!1144725))

(declare-fun m!1144727 () Bool)

(assert (=> bm!61315 m!1144727))

(declare-fun m!1144729 () Bool)

(assert (=> b!1242473 m!1144729))

(assert (=> b!1242191 d!136655))

(declare-fun b!1242477 () Bool)

(declare-fun res!828594 () Bool)

(declare-fun e!704330 () Bool)

(assert (=> b!1242477 (=> (not res!828594) (not e!704330))))

(declare-fun lt!562078 () List!27434)

(assert (=> b!1242477 (= res!828594 (containsKey!610 lt!562078 key1!25))))

(declare-fun b!1242478 () Bool)

(assert (=> b!1242478 (= e!704330 (contains!7364 lt!562078 (tuple2!20371 key1!25 v1!20)))))

(declare-fun b!1242479 () Bool)

(declare-fun e!704329 () List!27434)

(declare-fun call!61321 () List!27434)

(assert (=> b!1242479 (= e!704329 call!61321)))

(declare-fun b!1242480 () Bool)

(declare-fun e!704332 () List!27434)

(declare-fun call!61323 () List!27434)

(assert (=> b!1242480 (= e!704332 call!61323)))

(declare-fun e!704328 () List!27434)

(declare-fun c!121647 () Bool)

(declare-fun bm!61318 () Bool)

(declare-fun call!61322 () List!27434)

(assert (=> bm!61318 (= call!61322 ($colon$colon!627 e!704328 (ite c!121647 (h!28639 (t!40888 (t!40888 l!644))) (tuple2!20371 key1!25 v1!20))))))

(declare-fun c!121644 () Bool)

(assert (=> bm!61318 (= c!121644 c!121647)))

(declare-fun c!121646 () Bool)

(declare-fun b!1242481 () Bool)

(declare-fun c!121645 () Bool)

(assert (=> b!1242481 (= e!704328 (ite c!121646 (t!40888 (t!40888 (t!40888 l!644))) (ite c!121645 (Cons!27430 (h!28639 (t!40888 (t!40888 l!644))) (t!40888 (t!40888 (t!40888 l!644)))) Nil!27431)))))

(declare-fun b!1242482 () Bool)

(declare-fun e!704331 () List!27434)

(assert (=> b!1242482 (= e!704331 call!61322)))

(declare-fun b!1242483 () Bool)

(assert (=> b!1242483 (= e!704328 (insertStrictlySorted!440 (t!40888 (t!40888 (t!40888 l!644))) key1!25 v1!20))))

(declare-fun bm!61319 () Bool)

(assert (=> bm!61319 (= call!61321 call!61322)))

(declare-fun b!1242485 () Bool)

(assert (=> b!1242485 (= e!704332 call!61323)))

(declare-fun b!1242486 () Bool)

(assert (=> b!1242486 (= c!121645 (and (is-Cons!27430 (t!40888 (t!40888 l!644))) (bvsgt (_1!10196 (h!28639 (t!40888 (t!40888 l!644)))) key1!25)))))

(assert (=> b!1242486 (= e!704329 e!704332)))

(declare-fun bm!61320 () Bool)

(assert (=> bm!61320 (= call!61323 call!61321)))

(declare-fun d!136657 () Bool)

(assert (=> d!136657 e!704330))

(declare-fun res!828593 () Bool)

(assert (=> d!136657 (=> (not res!828593) (not e!704330))))

(assert (=> d!136657 (= res!828593 (isStrictlySorted!761 lt!562078))))

(assert (=> d!136657 (= lt!562078 e!704331)))

(assert (=> d!136657 (= c!121647 (and (is-Cons!27430 (t!40888 (t!40888 l!644))) (bvslt (_1!10196 (h!28639 (t!40888 (t!40888 l!644)))) key1!25)))))

(assert (=> d!136657 (isStrictlySorted!761 (t!40888 (t!40888 l!644)))))

(assert (=> d!136657 (= (insertStrictlySorted!440 (t!40888 (t!40888 l!644)) key1!25 v1!20) lt!562078)))

(declare-fun b!1242484 () Bool)

(assert (=> b!1242484 (= e!704331 e!704329)))

(assert (=> b!1242484 (= c!121646 (and (is-Cons!27430 (t!40888 (t!40888 l!644))) (= (_1!10196 (h!28639 (t!40888 (t!40888 l!644)))) key1!25)))))

(assert (= (and d!136657 c!121647) b!1242482))

(assert (= (and d!136657 (not c!121647)) b!1242484))

(assert (= (and b!1242484 c!121646) b!1242479))

(assert (= (and b!1242484 (not c!121646)) b!1242486))

(assert (= (and b!1242486 c!121645) b!1242485))

(assert (= (and b!1242486 (not c!121645)) b!1242480))

(assert (= (or b!1242485 b!1242480) bm!61320))

(assert (= (or b!1242479 bm!61320) bm!61319))

(assert (= (or b!1242482 bm!61319) bm!61318))

(assert (= (and bm!61318 c!121644) b!1242483))

(assert (= (and bm!61318 (not c!121644)) b!1242481))

(assert (= (and d!136657 res!828593) b!1242477))

(assert (= (and b!1242477 res!828594) b!1242478))

(declare-fun m!1144731 () Bool)

(assert (=> b!1242478 m!1144731))

(declare-fun m!1144733 () Bool)

(assert (=> d!136657 m!1144733))

(assert (=> d!136657 m!1144519))

(declare-fun m!1144735 () Bool)

(assert (=> b!1242477 m!1144735))

(declare-fun m!1144737 () Bool)

(assert (=> bm!61318 m!1144737))

(declare-fun m!1144739 () Bool)

(assert (=> b!1242483 m!1144739))

(assert (=> b!1242241 d!136657))

(declare-fun d!136659 () Bool)

(declare-fun res!828595 () Bool)

(declare-fun e!704333 () Bool)

(assert (=> d!136659 (=> res!828595 e!704333)))

(assert (=> d!136659 (= res!828595 (and (is-Cons!27430 lt!562033) (= (_1!10196 (h!28639 lt!562033)) key1!25)))))

(assert (=> d!136659 (= (containsKey!610 lt!562033 key1!25) e!704333)))

(declare-fun b!1242487 () Bool)

(declare-fun e!704334 () Bool)

(assert (=> b!1242487 (= e!704333 e!704334)))

(declare-fun res!828596 () Bool)

(assert (=> b!1242487 (=> (not res!828596) (not e!704334))))

(assert (=> b!1242487 (= res!828596 (and (or (not (is-Cons!27430 lt!562033)) (bvsle (_1!10196 (h!28639 lt!562033)) key1!25)) (is-Cons!27430 lt!562033) (bvslt (_1!10196 (h!28639 lt!562033)) key1!25)))))

(declare-fun b!1242488 () Bool)

(assert (=> b!1242488 (= e!704334 (containsKey!610 (t!40888 lt!562033) key1!25))))

(assert (= (and d!136659 (not res!828595)) b!1242487))

(assert (= (and b!1242487 res!828596) b!1242488))

(declare-fun m!1144741 () Bool)

(assert (=> b!1242488 m!1144741))

(assert (=> b!1242165 d!136659))

(declare-fun d!136661 () Bool)

(declare-fun res!828597 () Bool)

(declare-fun e!704335 () Bool)

(assert (=> d!136661 (=> res!828597 e!704335)))

(assert (=> d!136661 (= res!828597 (or (is-Nil!27431 lt!562019) (is-Nil!27431 (t!40888 lt!562019))))))

(assert (=> d!136661 (= (isStrictlySorted!761 lt!562019) e!704335)))

(declare-fun b!1242489 () Bool)

(declare-fun e!704336 () Bool)

(assert (=> b!1242489 (= e!704335 e!704336)))

(declare-fun res!828598 () Bool)

(assert (=> b!1242489 (=> (not res!828598) (not e!704336))))

(assert (=> b!1242489 (= res!828598 (bvslt (_1!10196 (h!28639 lt!562019)) (_1!10196 (h!28639 (t!40888 lt!562019)))))))

(declare-fun b!1242490 () Bool)

(assert (=> b!1242490 (= e!704336 (isStrictlySorted!761 (t!40888 lt!562019)))))

(assert (= (and d!136661 (not res!828597)) b!1242489))

(assert (= (and b!1242489 res!828598) b!1242490))

(declare-fun m!1144743 () Bool)

(assert (=> b!1242490 m!1144743))

(assert (=> d!136459 d!136661))

(declare-fun d!136663 () Bool)

(declare-fun res!828599 () Bool)

(declare-fun e!704337 () Bool)

(assert (=> d!136663 (=> res!828599 e!704337)))

(assert (=> d!136663 (= res!828599 (or (is-Nil!27431 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20)) (is-Nil!27431 (t!40888 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20)))))))

(assert (=> d!136663 (= (isStrictlySorted!761 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20)) e!704337)))

(declare-fun b!1242491 () Bool)

(declare-fun e!704338 () Bool)

(assert (=> b!1242491 (= e!704337 e!704338)))

(declare-fun res!828600 () Bool)

(assert (=> b!1242491 (=> (not res!828600) (not e!704338))))

(assert (=> b!1242491 (= res!828600 (bvslt (_1!10196 (h!28639 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20))) (_1!10196 (h!28639 (t!40888 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20))))))))

(declare-fun b!1242492 () Bool)

(assert (=> b!1242492 (= e!704338 (isStrictlySorted!761 (t!40888 (insertStrictlySorted!440 (t!40888 l!644) key1!25 v1!20))))))

(assert (= (and d!136663 (not res!828599)) b!1242491))

(assert (= (and b!1242491 res!828600) b!1242492))

(assert (=> b!1242492 m!1144641))

(assert (=> d!136459 d!136663))

(declare-fun d!136665 () Bool)

(assert (=> d!136665 (= ($colon$colon!627 e!704092 (ite c!121565 (h!28639 (removeStrictlySorted!132 (t!40888 l!644) key2!15)) (tuple2!20371 key1!25 v1!20))) (Cons!27430 (ite c!121565 (h!28639 (removeStrictlySorted!132 (t!40888 l!644) key2!15)) (tuple2!20371 key1!25 v1!20)) e!704092))))

(assert (=> bm!61279 d!136665))

(declare-fun lt!562079 () Bool)

(declare-fun d!136667 () Bool)

(assert (=> d!136667 (= lt!562079 (set.member (tuple2!20371 key1!25 v1!20) (content!602 lt!562033)))))

(declare-fun e!704340 () Bool)

(assert (=> d!136667 (= lt!562079 e!704340)))

(declare-fun res!828602 () Bool)

(assert (=> d!136667 (=> (not res!828602) (not e!704340))))

(assert (=> d!136667 (= res!828602 (is-Cons!27430 lt!562033))))

(assert (=> d!136667 (= (contains!7364 lt!562033 (tuple2!20371 key1!25 v1!20)) lt!562079)))

(declare-fun b!1242493 () Bool)

(declare-fun e!704339 () Bool)

(assert (=> b!1242493 (= e!704340 e!704339)))

(declare-fun res!828601 () Bool)

(assert (=> b!1242493 (=> res!828601 e!704339)))

(assert (=> b!1242493 (= res!828601 (= (h!28639 lt!562033) (tuple2!20371 key1!25 v1!20)))))

(declare-fun b!1242494 () Bool)

(assert (=> b!1242494 (= e!704339 (contains!7364 (t!40888 lt!562033) (tuple2!20371 key1!25 v1!20)))))

(assert (= (and d!136667 res!828602) b!1242493))

(assert (= (and b!1242493 (not res!828601)) b!1242494))

(declare-fun m!1144745 () Bool)

(assert (=> d!136667 m!1144745))

(declare-fun m!1144747 () Bool)

(assert (=> d!136667 m!1144747))

(declare-fun m!1144749 () Bool)

(assert (=> b!1242494 m!1144749))

(assert (=> b!1242166 d!136667))

(declare-fun d!136669 () Bool)

(assert (=> d!136669 (= ($colon$colon!627 (removeStrictlySorted!132 (t!40888 l!644) key2!15) (h!28639 l!644)) (Cons!27430 (h!28639 l!644) (removeStrictlySorted!132 (t!40888 l!644) key2!15)))))

(assert (=> b!1242206 d!136669))

(assert (=> b!1242206 d!136509))

(declare-fun d!136671 () Bool)

(declare-fun res!828603 () Bool)

(declare-fun e!704341 () Bool)

(assert (=> d!136671 (=> res!828603 e!704341)))

(assert (=> d!136671 (= res!828603 (or (is-Nil!27431 lt!562055) (is-Nil!27431 (t!40888 lt!562055))))))

(assert (=> d!136671 (= (isStrictlySorted!761 lt!562055) e!704341)))

(declare-fun b!1242495 () Bool)

(declare-fun e!704342 () Bool)

(assert (=> b!1242495 (= e!704341 e!704342)))

(declare-fun res!828604 () Bool)

(assert (=> b!1242495 (=> (not res!828604) (not e!704342))))

(assert (=> b!1242495 (= res!828604 (bvslt (_1!10196 (h!28639 lt!562055)) (_1!10196 (h!28639 (t!40888 lt!562055)))))))

(declare-fun b!1242496 () Bool)

(assert (=> b!1242496 (= e!704342 (isStrictlySorted!761 (t!40888 lt!562055)))))

(assert (= (and d!136671 (not res!828603)) b!1242495))

(assert (= (and b!1242495 res!828604) b!1242496))

(declare-fun m!1144751 () Bool)

(assert (=> b!1242496 m!1144751))

(assert (=> d!136509 d!136671))

(assert (=> d!136509 d!136513))

(declare-fun b!1242497 () Bool)

(declare-fun res!828606 () Bool)

(declare-fun e!704345 () Bool)

(assert (=> b!1242497 (=> (not res!828606) (not e!704345))))

(declare-fun lt!562080 () List!27434)

(assert (=> b!1242497 (= res!828606 (containsKey!610 lt!562080 key1!25))))

(declare-fun b!1242498 () Bool)

(assert (=> b!1242498 (= e!704345 (contains!7364 lt!562080 (tuple2!20371 key1!25 v1!20)))))

(declare-fun b!1242499 () Bool)

(declare-fun e!704344 () List!27434)

(declare-fun call!61324 () List!27434)

(assert (=> b!1242499 (= e!704344 call!61324)))

(declare-fun b!1242500 () Bool)

(declare-fun e!704347 () List!27434)

(declare-fun call!61326 () List!27434)

(assert (=> b!1242500 (= e!704347 call!61326)))

(declare-fun e!704343 () List!27434)

(declare-fun bm!61321 () Bool)

(declare-fun c!121651 () Bool)

(declare-fun call!61325 () List!27434)

(assert (=> bm!61321 (= call!61325 ($colon$colon!627 e!704343 (ite c!121651 (h!28639 (t!40888 (removeStrictlySorted!132 (t!40888 l!644) key2!15))) (tuple2!20371 key1!25 v1!20))))))

(declare-fun c!121648 () Bool)

(assert (=> bm!61321 (= c!121648 c!121651)))

(declare-fun b!1242501 () Bool)

(declare-fun c!121650 () Bool)

(declare-fun c!121649 () Bool)

(assert (=> b!1242501 (= e!704343 (ite c!121650 (t!40888 (t!40888 (removeStrictlySorted!132 (t!40888 l!644) key2!15))) (ite c!121649 (Cons!27430 (h!28639 (t!40888 (removeStrictlySorted!132 (t!40888 l!644) key2!15))) (t!40888 (t!40888 (removeStrictlySorted!132 (t!40888 l!644) key2!15)))) Nil!27431)))))

(declare-fun b!1242502 () Bool)

(declare-fun e!704346 () List!27434)

(assert (=> b!1242502 (= e!704346 call!61325)))

(declare-fun b!1242503 () Bool)

(assert (=> b!1242503 (= e!704343 (insertStrictlySorted!440 (t!40888 (t!40888 (removeStrictlySorted!132 (t!40888 l!644) key2!15))) key1!25 v1!20))))

(declare-fun bm!61322 () Bool)

(assert (=> bm!61322 (= call!61324 call!61325)))

(declare-fun b!1242505 () Bool)

(assert (=> b!1242505 (= e!704347 call!61326)))

(declare-fun b!1242506 () Bool)

(assert (=> b!1242506 (= c!121649 (and (is-Cons!27430 (t!40888 (removeStrictlySorted!132 (t!40888 l!644) key2!15))) (bvsgt (_1!10196 (h!28639 (t!40888 (removeStrictlySorted!132 (t!40888 l!644) key2!15)))) key1!25)))))

(assert (=> b!1242506 (= e!704344 e!704347)))

(declare-fun bm!61323 () Bool)

(assert (=> bm!61323 (= call!61326 call!61324)))

(declare-fun d!136673 () Bool)

(assert (=> d!136673 e!704345))

(declare-fun res!828605 () Bool)

(assert (=> d!136673 (=> (not res!828605) (not e!704345))))

(assert (=> d!136673 (= res!828605 (isStrictlySorted!761 lt!562080))))

(assert (=> d!136673 (= lt!562080 e!704346)))

(assert (=> d!136673 (= c!121651 (and (is-Cons!27430 (t!40888 (removeStrictlySorted!132 (t!40888 l!644) key2!15))) (bvslt (_1!10196 (h!28639 (t!40888 (removeStrictlySorted!132 (t!40888 l!644) key2!15)))) key1!25)))))

(assert (=> d!136673 (isStrictlySorted!761 (t!40888 (removeStrictlySorted!132 (t!40888 l!644) key2!15)))))

(assert (=> d!136673 (= (insertStrictlySorted!440 (t!40888 (removeStrictlySorted!132 (t!40888 l!644) key2!15)) key1!25 v1!20) lt!562080)))

(declare-fun b!1242504 () Bool)

(assert (=> b!1242504 (= e!704346 e!704344)))

(assert (=> b!1242504 (= c!121650 (and (is-Cons!27430 (t!40888 (removeStrictlySorted!132 (t!40888 l!644) key2!15))) (= (_1!10196 (h!28639 (t!40888 (removeStrictlySorted!132 (t!40888 l!644) key2!15)))) key1!25)))))

(assert (= (and d!136673 c!121651) b!1242502))

(assert (= (and d!136673 (not c!121651)) b!1242504))

(assert (= (and b!1242504 c!121650) b!1242499))

(assert (= (and b!1242504 (not c!121650)) b!1242506))

(assert (= (and b!1242506 c!121649) b!1242505))

(assert (= (and b!1242506 (not c!121649)) b!1242500))

(assert (= (or b!1242505 b!1242500) bm!61323))

(assert (= (or b!1242499 bm!61323) bm!61322))

(assert (= (or b!1242502 bm!61322) bm!61321))

(assert (= (and bm!61321 c!121648) b!1242503))

(assert (= (and bm!61321 (not c!121648)) b!1242501))

(assert (= (and d!136673 res!828605) b!1242497))

(assert (= (and b!1242497 res!828606) b!1242498))

(declare-fun m!1144753 () Bool)

(assert (=> b!1242498 m!1144753))

(declare-fun m!1144755 () Bool)

(assert (=> d!136673 m!1144755))

(assert (=> d!136673 m!1144717))

(declare-fun m!1144757 () Bool)

(assert (=> b!1242497 m!1144757))

(declare-fun m!1144759 () Bool)

(assert (=> bm!61321 m!1144759))

(declare-fun m!1144761 () Bool)

(assert (=> b!1242503 m!1144761))

(assert (=> b!1242146 d!136673))

(declare-fun d!136675 () Bool)

(declare-fun res!828607 () Bool)

(declare-fun e!704348 () Bool)

(assert (=> d!136675 (=> res!828607 e!704348)))

(assert (=> d!136675 (= res!828607 (and (is-Cons!27430 lt!562037) (= (_1!10196 (h!28639 lt!562037)) key2!15)))))

(assert (=> d!136675 (= (containsKey!610 lt!562037 key2!15) e!704348)))

(declare-fun b!1242507 () Bool)

(declare-fun e!704349 () Bool)

(assert (=> b!1242507 (= e!704348 e!704349)))

(declare-fun res!828608 () Bool)

(assert (=> b!1242507 (=> (not res!828608) (not e!704349))))

(assert (=> b!1242507 (= res!828608 (and (or (not (is-Cons!27430 lt!562037)) (bvsle (_1!10196 (h!28639 lt!562037)) key2!15)) (is-Cons!27430 lt!562037) (bvslt (_1!10196 (h!28639 lt!562037)) key2!15)))))

(declare-fun b!1242508 () Bool)

(assert (=> b!1242508 (= e!704349 (containsKey!610 (t!40888 lt!562037) key2!15))))

(assert (= (and d!136675 (not res!828607)) b!1242507))

(assert (= (and b!1242507 res!828608) b!1242508))

(declare-fun m!1144763 () Bool)

(assert (=> b!1242508 m!1144763))

(assert (=> b!1242209 d!136675))

(declare-fun d!136677 () Bool)

(assert (=> d!136677 (= ($colon$colon!627 e!704105 (ite c!121575 (h!28639 l!644) (tuple2!20371 key1!25 v1!20))) (Cons!27430 (ite c!121575 (h!28639 l!644) (tuple2!20371 key1!25 v1!20)) e!704105))))

(assert (=> bm!61285 d!136677))

(declare-fun b!1242509 () Bool)

(declare-fun e!704350 () Bool)

(declare-fun tp!92761 () Bool)

(assert (=> b!1242509 (= e!704350 (and tp_is_empty!31289 tp!92761))))

(assert (=> b!1242299 (= tp!92757 e!704350)))

(assert (= (and b!1242299 (is-Cons!27430 (t!40888 (t!40888 l!644)))) b!1242509))

(push 1)

(assert (not b!1242389))

(assert (not d!136621))

(assert (not d!136619))

(assert (not b!1242458))

(assert (not b!1242441))

(assert (not b!1242496))

(assert (not b!1242454))

(assert (not b!1242460))

(assert (not b!1242508))

(assert (not b!1242488))

(assert (not b!1242498))

(assert (not b!1242467))

(assert (not d!136657))

(assert (not b!1242398))

(assert (not b!1242448))

(assert (not b!1242450))

(assert (not b!1242477))

(assert (not d!136579))

(assert (not d!136643))

(assert (not b!1242424))

(assert (not b!1242437))

(assert (not b!1242468))

(assert (not bm!61321))

(assert (not b!1242435))

(assert (not d!136591))

(assert (not b!1242429))

(assert (not b!1242426))

(assert (not b!1242452))

(assert (not b!1242382))

(assert (not b!1242380))

(assert (not b!1242492))

(assert (not b!1242439))

(assert (not d!136673))

(assert (not bm!61315))

(assert (not b!1242478))

(assert (not d!136617))

(assert (not b!1242443))

(assert (not bm!61318))

(assert tp_is_empty!31289)

(assert (not b!1242483))

(assert (not d!136655))

(assert (not d!136667))

(assert (not b!1242509))

(assert (not b!1242473))

(assert (not b!1242503))

(assert (not b!1242490))

(assert (not b!1242466))

(assert (not b!1242494))

(assert (not b!1242456))

(assert (not b!1242462))

(assert (not b!1242497))

(assert (not b!1242395))

(assert (not d!136631))

(assert (not b!1242445))

(assert (not b!1242422))

(assert (not b!1242464))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

