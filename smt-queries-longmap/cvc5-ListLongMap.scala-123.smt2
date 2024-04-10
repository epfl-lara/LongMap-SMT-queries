; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2088 () Bool)

(assert start!2088)

(declare-fun b!14089 () Bool)

(assert (=> b!14089 true))

(declare-fun bm!383 () Bool)

(declare-fun call!386 () Bool)

(declare-datatypes ((B!536 0))(
  ( (B!537 (val!366 Int)) )
))
(declare-datatypes ((tuple2!532 0))(
  ( (tuple2!533 (_1!266 (_ BitVec 64)) (_2!266 B!536)) )
))
(declare-datatypes ((List!421 0))(
  ( (Nil!418) (Cons!417 (h!983 tuple2!532) (t!2817 List!421)) )
))
(declare-fun lt!3576 () List!421)

(declare-fun isEmpty!99 (List!421) Bool)

(assert (=> bm!383 (= call!386 (isEmpty!99 lt!3576))))

(declare-fun b!14083 () Bool)

(declare-fun res!10977 () Bool)

(declare-fun e!8408 () Bool)

(assert (=> b!14083 (=> (not res!10977) (not e!8408))))

(declare-fun l!522 () List!421)

(declare-fun value!159 () B!536)

(assert (=> b!14083 (= res!10977 (and (is-Cons!417 l!522) (= (_2!266 (h!983 l!522)) value!159)))))

(declare-fun b!14084 () Bool)

(declare-fun e!8407 () Bool)

(assert (=> b!14084 (= e!8408 e!8407)))

(declare-fun res!10978 () Bool)

(assert (=> b!14084 (=> res!10978 e!8407)))

(declare-fun isStrictlySorted!108 (List!421) Bool)

(assert (=> b!14084 (= res!10978 (not (isStrictlySorted!108 lt!3576)))))

(declare-fun $colon$colon!18 (List!421 tuple2!532) List!421)

(declare-fun filterByValue!13 (List!421 B!536) List!421)

(assert (=> b!14084 (= lt!3576 ($colon$colon!18 (filterByValue!13 (t!2817 l!522) value!159) (h!983 l!522)))))

(declare-fun b!14085 () Bool)

(declare-fun e!8404 () Bool)

(declare-fun head!788 (List!421) tuple2!532)

(assert (=> b!14085 (= e!8404 (bvslt (_1!266 (head!788 lt!3576)) (_1!266 (head!788 l!522))))))

(declare-fun b!14086 () Bool)

(declare-fun e!8406 () Bool)

(assert (=> b!14086 (= e!8406 (not call!386))))

(declare-fun b!14087 () Bool)

(assert (=> b!14087 (= e!8406 e!8404)))

(declare-fun res!10974 () Bool)

(assert (=> b!14087 (= res!10974 (not call!386))))

(assert (=> b!14087 (=> (not res!10974) (not e!8404))))

(declare-fun res!10975 () Bool)

(assert (=> start!2088 (=> (not res!10975) (not e!8408))))

(assert (=> start!2088 (= res!10975 (isStrictlySorted!108 l!522))))

(assert (=> start!2088 e!8408))

(declare-fun e!8405 () Bool)

(assert (=> start!2088 e!8405))

(declare-fun tp_is_empty!715 () Bool)

(assert (=> start!2088 tp_is_empty!715))

(declare-fun b!14088 () Bool)

(declare-fun tp!2303 () Bool)

(assert (=> b!14088 (= e!8405 (and tp_is_empty!715 tp!2303))))

(declare-fun res!10976 () Bool)

(assert (=> b!14089 (=> res!10976 e!8407)))

(declare-fun lambda!134 () Int)

(declare-fun forall!92 (List!421 Int) Bool)

(assert (=> b!14089 (= res!10976 (not (forall!92 lt!3576 lambda!134)))))

(declare-fun b!14090 () Bool)

(assert (=> b!14090 (= e!8407 e!8406)))

(declare-fun c!1292 () Bool)

(assert (=> b!14090 (= c!1292 (isEmpty!99 l!522))))

(assert (= (and start!2088 res!10975) b!14083))

(assert (= (and b!14083 res!10977) b!14084))

(assert (= (and b!14084 (not res!10978)) b!14089))

(assert (= (and b!14089 (not res!10976)) b!14090))

(assert (= (and b!14090 c!1292) b!14086))

(assert (= (and b!14090 (not c!1292)) b!14087))

(assert (= (and b!14087 res!10974) b!14085))

(assert (= (or b!14086 b!14087) bm!383))

(assert (= (and start!2088 (is-Cons!417 l!522)) b!14088))

(declare-fun m!9395 () Bool)

(assert (=> b!14085 m!9395))

(declare-fun m!9397 () Bool)

(assert (=> b!14085 m!9397))

(declare-fun m!9399 () Bool)

(assert (=> b!14090 m!9399))

(declare-fun m!9401 () Bool)

(assert (=> start!2088 m!9401))

(declare-fun m!9403 () Bool)

(assert (=> b!14084 m!9403))

(declare-fun m!9405 () Bool)

(assert (=> b!14084 m!9405))

(assert (=> b!14084 m!9405))

(declare-fun m!9407 () Bool)

(assert (=> b!14084 m!9407))

(declare-fun m!9409 () Bool)

(assert (=> bm!383 m!9409))

(declare-fun m!9411 () Bool)

(assert (=> b!14089 m!9411))

(push 1)

(assert (not bm!383))

(assert (not b!14084))

(assert (not start!2088))

(assert (not b!14089))

(assert (not b!14090))

(assert (not b!14088))

(assert tp_is_empty!715)

(assert (not b!14085))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2111 () Bool)

(declare-fun res!11031 () Bool)

(declare-fun e!8461 () Bool)

(assert (=> d!2111 (=> res!11031 e!8461)))

(assert (=> d!2111 (= res!11031 (is-Nil!418 lt!3576))))

(assert (=> d!2111 (= (forall!92 lt!3576 lambda!134) e!8461)))

(declare-fun b!14167 () Bool)

(declare-fun e!8462 () Bool)

(assert (=> b!14167 (= e!8461 e!8462)))

(declare-fun res!11032 () Bool)

(assert (=> b!14167 (=> (not res!11032) (not e!8462))))

(declare-fun dynLambda!90 (Int tuple2!532) Bool)

(assert (=> b!14167 (= res!11032 (dynLambda!90 lambda!134 (h!983 lt!3576)))))

(declare-fun b!14168 () Bool)

(assert (=> b!14168 (= e!8462 (forall!92 (t!2817 lt!3576) lambda!134))))

(assert (= (and d!2111 (not res!11031)) b!14167))

(assert (= (and b!14167 res!11032) b!14168))

(declare-fun b_lambda!891 () Bool)

(assert (=> (not b_lambda!891) (not b!14167)))

(declare-fun m!9459 () Bool)

(assert (=> b!14167 m!9459))

(declare-fun m!9461 () Bool)

(assert (=> b!14168 m!9461))

(assert (=> b!14089 d!2111))

(declare-fun d!2121 () Bool)

(assert (=> d!2121 (= (isEmpty!99 lt!3576) (is-Nil!418 lt!3576))))

(assert (=> bm!383 d!2121))

(declare-fun d!2123 () Bool)

(assert (=> d!2123 (= (isEmpty!99 l!522) (is-Nil!418 l!522))))

(assert (=> b!14090 d!2123))

(declare-fun d!2125 () Bool)

(declare-fun res!11045 () Bool)

(declare-fun e!8475 () Bool)

(assert (=> d!2125 (=> res!11045 e!8475)))

(assert (=> d!2125 (= res!11045 (or (is-Nil!418 l!522) (is-Nil!418 (t!2817 l!522))))))

(assert (=> d!2125 (= (isStrictlySorted!108 l!522) e!8475)))

(declare-fun b!14181 () Bool)

(declare-fun e!8476 () Bool)

(assert (=> b!14181 (= e!8475 e!8476)))

(declare-fun res!11046 () Bool)

(assert (=> b!14181 (=> (not res!11046) (not e!8476))))

(assert (=> b!14181 (= res!11046 (bvslt (_1!266 (h!983 l!522)) (_1!266 (h!983 (t!2817 l!522)))))))

(declare-fun b!14182 () Bool)

(assert (=> b!14182 (= e!8476 (isStrictlySorted!108 (t!2817 l!522)))))

(assert (= (and d!2125 (not res!11045)) b!14181))

(assert (= (and b!14181 res!11046) b!14182))

(declare-fun m!9467 () Bool)

(assert (=> b!14182 m!9467))

(assert (=> start!2088 d!2125))

(declare-fun d!2137 () Bool)

(assert (=> d!2137 (= (head!788 lt!3576) (h!983 lt!3576))))

(assert (=> b!14085 d!2137))

(declare-fun d!2139 () Bool)

(assert (=> d!2139 (= (head!788 l!522) (h!983 l!522))))

(assert (=> b!14085 d!2139))

(declare-fun d!2141 () Bool)

(declare-fun res!11047 () Bool)

(declare-fun e!8477 () Bool)

(assert (=> d!2141 (=> res!11047 e!8477)))

(assert (=> d!2141 (= res!11047 (or (is-Nil!418 lt!3576) (is-Nil!418 (t!2817 lt!3576))))))

(assert (=> d!2141 (= (isStrictlySorted!108 lt!3576) e!8477)))

(declare-fun b!14183 () Bool)

(declare-fun e!8478 () Bool)

(assert (=> b!14183 (= e!8477 e!8478)))

(declare-fun res!11048 () Bool)

(assert (=> b!14183 (=> (not res!11048) (not e!8478))))

(assert (=> b!14183 (= res!11048 (bvslt (_1!266 (h!983 lt!3576)) (_1!266 (h!983 (t!2817 lt!3576)))))))

(declare-fun b!14184 () Bool)

(assert (=> b!14184 (= e!8478 (isStrictlySorted!108 (t!2817 lt!3576)))))

(assert (= (and d!2141 (not res!11047)) b!14183))

(assert (= (and b!14183 res!11048) b!14184))

(declare-fun m!9469 () Bool)

(assert (=> b!14184 m!9469))

(assert (=> b!14084 d!2141))

(declare-fun d!2143 () Bool)

(assert (=> d!2143 (= ($colon$colon!18 (filterByValue!13 (t!2817 l!522) value!159) (h!983 l!522)) (Cons!417 (h!983 l!522) (filterByValue!13 (t!2817 l!522) value!159)))))

(assert (=> b!14084 d!2143))

(declare-fun bs!559 () Bool)

(declare-fun b!14276 () Bool)

(assert (= bs!559 (and b!14276 b!14089)))

(declare-fun lambda!149 () Int)

(assert (=> bs!559 (= lambda!149 lambda!134)))

(assert (=> b!14276 true))

(declare-fun b!14268 () Bool)

(declare-fun e!8528 () Bool)

(declare-fun e!8527 () Bool)

(assert (=> b!14268 (= e!8528 e!8527)))

(declare-fun res!11075 () Bool)

(declare-fun call!410 () Bool)

(assert (=> b!14268 (= res!11075 call!410)))

(assert (=> b!14268 (=> res!11075 e!8527)))

(declare-fun bm!406 () Bool)

(declare-fun lt!3591 () List!421)

(assert (=> bm!406 (= call!410 (isEmpty!99 lt!3591))))

(declare-fun b!14269 () Bool)

(declare-fun e!8529 () Bool)

(assert (=> b!14269 (= e!8529 e!8528)))

(declare-fun c!1324 () Bool)

(assert (=> b!14269 (= c!1324 (isEmpty!99 (t!2817 l!522)))))

(declare-fun bm!407 () Bool)

(declare-fun call!409 () List!421)

(assert (=> bm!407 (= call!409 (filterByValue!13 (t!2817 (t!2817 l!522)) value!159))))

(declare-fun b!14270 () Bool)

(declare-fun e!8526 () List!421)

(assert (=> b!14270 (= e!8526 call!409)))

(declare-fun b!14271 () Bool)

(assert (=> b!14271 (= e!8526 Nil!418)))

(declare-fun d!2145 () Bool)

(assert (=> d!2145 e!8529))

(declare-fun res!11076 () Bool)

(assert (=> d!2145 (=> (not res!11076) (not e!8529))))

(assert (=> d!2145 (= res!11076 (isStrictlySorted!108 lt!3591))))

(declare-fun e!8530 () List!421)

(assert (=> d!2145 (= lt!3591 e!8530)))

(declare-fun c!1325 () Bool)

(assert (=> d!2145 (= c!1325 (and (is-Cons!417 (t!2817 l!522)) (= (_2!266 (h!983 (t!2817 l!522))) value!159)))))

(assert (=> d!2145 (isStrictlySorted!108 (t!2817 l!522))))

(assert (=> d!2145 (= (filterByValue!13 (t!2817 l!522) value!159) lt!3591)))

(declare-fun b!14272 () Bool)

(assert (=> b!14272 (= e!8527 (bvsge (_1!266 (head!788 lt!3591)) (_1!266 (head!788 (t!2817 l!522)))))))

(declare-fun b!14273 () Bool)

(assert (=> b!14273 (= e!8528 call!410)))

(declare-fun b!14274 () Bool)

(assert (=> b!14274 (= e!8530 e!8526)))

(declare-fun c!1323 () Bool)

(assert (=> b!14274 (= c!1323 (and (is-Cons!417 (t!2817 l!522)) (not (= (_2!266 (h!983 (t!2817 l!522))) value!159))))))

(declare-fun b!14275 () Bool)

(assert (=> b!14275 (= e!8530 ($colon$colon!18 call!409 (h!983 (t!2817 l!522))))))

(declare-fun res!11077 () Bool)

(assert (=> b!14276 (=> (not res!11077) (not e!8529))))

(assert (=> b!14276 (= res!11077 (forall!92 lt!3591 lambda!149))))

(assert (= (and d!2145 c!1325) b!14275))

(assert (= (and d!2145 (not c!1325)) b!14274))

(assert (= (and b!14274 c!1323) b!14270))

(assert (= (and b!14274 (not c!1323)) b!14271))

(assert (= (or b!14275 b!14270) bm!407))

(assert (= (and d!2145 res!11076) b!14276))

(assert (= (and b!14276 res!11077) b!14269))

(assert (= (and b!14269 c!1324) b!14273))

(assert (= (and b!14269 (not c!1324)) b!14268))

(assert (= (and b!14268 (not res!11075)) b!14272))

(assert (= (or b!14273 b!14268) bm!406))

(declare-fun m!9505 () Bool)

(assert (=> b!14269 m!9505))

(declare-fun m!9507 () Bool)

(assert (=> b!14272 m!9507))

(declare-fun m!9509 () Bool)

(assert (=> b!14272 m!9509))

(declare-fun m!9511 () Bool)

(assert (=> b!14275 m!9511))

(declare-fun m!9513 () Bool)

(assert (=> bm!406 m!9513))

(declare-fun m!9515 () Bool)

(assert (=> bm!407 m!9515))

(declare-fun m!9517 () Bool)

(assert (=> d!2145 m!9517))

(assert (=> d!2145 m!9467))

(declare-fun m!9519 () Bool)

(assert (=> b!14276 m!9519))

(assert (=> b!14084 d!2145))

(declare-fun b!14282 () Bool)

(declare-fun e!8534 () Bool)

(declare-fun tp!2318 () Bool)

(assert (=> b!14282 (= e!8534 (and tp_is_empty!715 tp!2318))))

(assert (=> b!14088 (= tp!2303 e!8534)))

(assert (= (and b!14088 (is-Cons!417 (t!2817 l!522))) b!14282))

(declare-fun b_lambda!897 () Bool)

(assert (= b_lambda!891 (or b!14089 b_lambda!897)))

(declare-fun bs!560 () Bool)

(declare-fun d!2159 () Bool)

(assert (= bs!560 (and d!2159 b!14089)))

(assert (=> bs!560 (= (dynLambda!90 lambda!134 (h!983 lt!3576)) (= (_2!266 (h!983 lt!3576)) value!159))))

(assert (=> b!14167 d!2159))

(push 1)

(assert (not b!14184))

(assert (not b!14276))

(assert (not b!14168))

(assert (not b!14282))

(assert (not b_lambda!897))

(assert (not b!14275))

(assert (not d!2145))

(assert (not b!14269))

(assert (not b!14182))

(assert tp_is_empty!715)

(assert (not bm!406))

(assert (not bm!407))

(assert (not b!14272))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2187 () Bool)

(declare-fun res!11091 () Bool)

(declare-fun e!8551 () Bool)

(assert (=> d!2187 (=> res!11091 e!8551)))

(assert (=> d!2187 (= res!11091 (or (is-Nil!418 (t!2817 lt!3576)) (is-Nil!418 (t!2817 (t!2817 lt!3576)))))))

(assert (=> d!2187 (= (isStrictlySorted!108 (t!2817 lt!3576)) e!8551)))

(declare-fun b!14303 () Bool)

(declare-fun e!8552 () Bool)

(assert (=> b!14303 (= e!8551 e!8552)))

(declare-fun res!11092 () Bool)

(assert (=> b!14303 (=> (not res!11092) (not e!8552))))

(assert (=> b!14303 (= res!11092 (bvslt (_1!266 (h!983 (t!2817 lt!3576))) (_1!266 (h!983 (t!2817 (t!2817 lt!3576))))))))

(declare-fun b!14304 () Bool)

(assert (=> b!14304 (= e!8552 (isStrictlySorted!108 (t!2817 (t!2817 lt!3576))))))

(assert (= (and d!2187 (not res!11091)) b!14303))

(assert (= (and b!14303 res!11092) b!14304))

(declare-fun m!9551 () Bool)

(assert (=> b!14304 m!9551))

(assert (=> b!14184 d!2187))

(declare-fun d!2189 () Bool)

(assert (=> d!2189 (= (isEmpty!99 (t!2817 l!522)) (is-Nil!418 (t!2817 l!522)))))

(assert (=> b!14269 d!2189))

(declare-fun bs!565 () Bool)

(declare-fun b!14313 () Bool)

(assert (= bs!565 (and b!14313 b!14089)))

(declare-fun lambda!151 () Int)

(assert (=> bs!565 (= lambda!151 lambda!134)))

(declare-fun bs!566 () Bool)

(assert (= bs!566 (and b!14313 b!14276)))

(assert (=> bs!566 (= lambda!151 lambda!149)))

(assert (=> b!14313 true))

(declare-fun b!14305 () Bool)

(declare-fun e!8555 () Bool)

(declare-fun e!8554 () Bool)

(assert (=> b!14305 (= e!8555 e!8554)))

(declare-fun res!11093 () Bool)

(declare-fun call!414 () Bool)

(assert (=> b!14305 (= res!11093 call!414)))

(assert (=> b!14305 (=> res!11093 e!8554)))

(declare-fun bm!410 () Bool)

(declare-fun lt!3593 () List!421)

(assert (=> bm!410 (= call!414 (isEmpty!99 lt!3593))))

(declare-fun b!14306 () Bool)

(declare-fun e!8556 () Bool)

(assert (=> b!14306 (= e!8556 e!8555)))

(declare-fun c!1330 () Bool)

(assert (=> b!14306 (= c!1330 (isEmpty!99 (t!2817 (t!2817 l!522))))))

(declare-fun bm!411 () Bool)

(declare-fun call!413 () List!421)

(assert (=> bm!411 (= call!413 (filterByValue!13 (t!2817 (t!2817 (t!2817 l!522))) value!159))))

(declare-fun b!14307 () Bool)

(declare-fun e!8553 () List!421)

(assert (=> b!14307 (= e!8553 call!413)))

(declare-fun b!14308 () Bool)

(assert (=> b!14308 (= e!8553 Nil!418)))

(declare-fun d!2191 () Bool)

(assert (=> d!2191 e!8556))

(declare-fun res!11094 () Bool)

(assert (=> d!2191 (=> (not res!11094) (not e!8556))))

(assert (=> d!2191 (= res!11094 (isStrictlySorted!108 lt!3593))))

(declare-fun e!8557 () List!421)

(assert (=> d!2191 (= lt!3593 e!8557)))

(declare-fun c!1331 () Bool)

(assert (=> d!2191 (= c!1331 (and (is-Cons!417 (t!2817 (t!2817 l!522))) (= (_2!266 (h!983 (t!2817 (t!2817 l!522)))) value!159)))))

(assert (=> d!2191 (isStrictlySorted!108 (t!2817 (t!2817 l!522)))))

(assert (=> d!2191 (= (filterByValue!13 (t!2817 (t!2817 l!522)) value!159) lt!3593)))

(declare-fun b!14309 () Bool)

(assert (=> b!14309 (= e!8554 (bvsge (_1!266 (head!788 lt!3593)) (_1!266 (head!788 (t!2817 (t!2817 l!522))))))))

(declare-fun b!14310 () Bool)

(assert (=> b!14310 (= e!8555 call!414)))

(declare-fun b!14311 () Bool)

(assert (=> b!14311 (= e!8557 e!8553)))

(declare-fun c!1329 () Bool)

(assert (=> b!14311 (= c!1329 (and (is-Cons!417 (t!2817 (t!2817 l!522))) (not (= (_2!266 (h!983 (t!2817 (t!2817 l!522)))) value!159))))))

(declare-fun b!14312 () Bool)

(assert (=> b!14312 (= e!8557 ($colon$colon!18 call!413 (h!983 (t!2817 (t!2817 l!522)))))))

(declare-fun res!11095 () Bool)

(assert (=> b!14313 (=> (not res!11095) (not e!8556))))

(assert (=> b!14313 (= res!11095 (forall!92 lt!3593 lambda!151))))

(assert (= (and d!2191 c!1331) b!14312))

(assert (= (and d!2191 (not c!1331)) b!14311))

(assert (= (and b!14311 c!1329) b!14307))

(assert (= (and b!14311 (not c!1329)) b!14308))

(assert (= (or b!14312 b!14307) bm!411))

(assert (= (and d!2191 res!11094) b!14313))

(assert (= (and b!14313 res!11095) b!14306))

(assert (= (and b!14306 c!1330) b!14310))

(assert (= (and b!14306 (not c!1330)) b!14305))

(assert (= (and b!14305 (not res!11093)) b!14309))

(assert (= (or b!14310 b!14305) bm!410))

(declare-fun m!9553 () Bool)

(assert (=> b!14306 m!9553))

(declare-fun m!9555 () Bool)

(assert (=> b!14309 m!9555))

(declare-fun m!9557 () Bool)

(assert (=> b!14309 m!9557))

(declare-fun m!9559 () Bool)

(assert (=> b!14312 m!9559))

(declare-fun m!9561 () Bool)

(assert (=> bm!410 m!9561))

(declare-fun m!9563 () Bool)

(assert (=> bm!411 m!9563))

(declare-fun m!9565 () Bool)

(assert (=> d!2191 m!9565))

(declare-fun m!9567 () Bool)

(assert (=> d!2191 m!9567))

(declare-fun m!9569 () Bool)

(assert (=> b!14313 m!9569))

(assert (=> bm!407 d!2191))

(declare-fun d!2193 () Bool)

(assert (=> d!2193 (= (isEmpty!99 lt!3591) (is-Nil!418 lt!3591))))

(assert (=> bm!406 d!2193))

(declare-fun d!2195 () Bool)

(assert (=> d!2195 (= (head!788 lt!3591) (h!983 lt!3591))))

(assert (=> b!14272 d!2195))

(declare-fun d!2197 () Bool)

(assert (=> d!2197 (= (head!788 (t!2817 l!522)) (h!983 (t!2817 l!522)))))

(assert (=> b!14272 d!2197))

(declare-fun d!2199 () Bool)

(declare-fun res!11096 () Bool)

(declare-fun e!8558 () Bool)

(assert (=> d!2199 (=> res!11096 e!8558)))

(assert (=> d!2199 (= res!11096 (is-Nil!418 (t!2817 lt!3576)))))

(assert (=> d!2199 (= (forall!92 (t!2817 lt!3576) lambda!134) e!8558)))

(declare-fun b!14314 () Bool)

(declare-fun e!8559 () Bool)

(assert (=> b!14314 (= e!8558 e!8559)))

(declare-fun res!11097 () Bool)

(assert (=> b!14314 (=> (not res!11097) (not e!8559))))

(assert (=> b!14314 (= res!11097 (dynLambda!90 lambda!134 (h!983 (t!2817 lt!3576))))))

(declare-fun b!14315 () Bool)

(assert (=> b!14315 (= e!8559 (forall!92 (t!2817 (t!2817 lt!3576)) lambda!134))))

(assert (= (and d!2199 (not res!11096)) b!14314))

(assert (= (and b!14314 res!11097) b!14315))

(declare-fun b_lambda!907 () Bool)

(assert (=> (not b_lambda!907) (not b!14314)))

(declare-fun m!9571 () Bool)

(assert (=> b!14314 m!9571))

(declare-fun m!9573 () Bool)

(assert (=> b!14315 m!9573))

(assert (=> b!14168 d!2199))

(declare-fun d!2201 () Bool)

(declare-fun res!11098 () Bool)

(declare-fun e!8560 () Bool)

(assert (=> d!2201 (=> res!11098 e!8560)))

(assert (=> d!2201 (= res!11098 (or (is-Nil!418 (t!2817 l!522)) (is-Nil!418 (t!2817 (t!2817 l!522)))))))

(assert (=> d!2201 (= (isStrictlySorted!108 (t!2817 l!522)) e!8560)))

(declare-fun b!14316 () Bool)

(declare-fun e!8561 () Bool)

(assert (=> b!14316 (= e!8560 e!8561)))

(declare-fun res!11099 () Bool)

(assert (=> b!14316 (=> (not res!11099) (not e!8561))))

(assert (=> b!14316 (= res!11099 (bvslt (_1!266 (h!983 (t!2817 l!522))) (_1!266 (h!983 (t!2817 (t!2817 l!522))))))))

(declare-fun b!14317 () Bool)

(assert (=> b!14317 (= e!8561 (isStrictlySorted!108 (t!2817 (t!2817 l!522))))))

(assert (= (and d!2201 (not res!11098)) b!14316))

(assert (= (and b!14316 res!11099) b!14317))

(assert (=> b!14317 m!9567))

(assert (=> b!14182 d!2201))

(declare-fun d!2203 () Bool)

(declare-fun res!11100 () Bool)

(declare-fun e!8562 () Bool)

(assert (=> d!2203 (=> res!11100 e!8562)))

(assert (=> d!2203 (= res!11100 (is-Nil!418 lt!3591))))

(assert (=> d!2203 (= (forall!92 lt!3591 lambda!149) e!8562)))

(declare-fun b!14318 () Bool)

(declare-fun e!8563 () Bool)

(assert (=> b!14318 (= e!8562 e!8563)))

(declare-fun res!11101 () Bool)

(assert (=> b!14318 (=> (not res!11101) (not e!8563))))

(assert (=> b!14318 (= res!11101 (dynLambda!90 lambda!149 (h!983 lt!3591)))))

(declare-fun b!14319 () Bool)

(assert (=> b!14319 (= e!8563 (forall!92 (t!2817 lt!3591) lambda!149))))

(assert (= (and d!2203 (not res!11100)) b!14318))

(assert (= (and b!14318 res!11101) b!14319))

(declare-fun b_lambda!909 () Bool)

(assert (=> (not b_lambda!909) (not b!14318)))

(declare-fun m!9575 () Bool)

(assert (=> b!14318 m!9575))

(declare-fun m!9577 () Bool)

(assert (=> b!14319 m!9577))

(assert (=> b!14276 d!2203))

(declare-fun d!2205 () Bool)

(assert (=> d!2205 (= ($colon$colon!18 call!409 (h!983 (t!2817 l!522))) (Cons!417 (h!983 (t!2817 l!522)) call!409))))

(assert (=> b!14275 d!2205))

(declare-fun d!2207 () Bool)

(declare-fun res!11102 () Bool)

(declare-fun e!8564 () Bool)

(assert (=> d!2207 (=> res!11102 e!8564)))

(assert (=> d!2207 (= res!11102 (or (is-Nil!418 lt!3591) (is-Nil!418 (t!2817 lt!3591))))))

(assert (=> d!2207 (= (isStrictlySorted!108 lt!3591) e!8564)))

(declare-fun b!14320 () Bool)

(declare-fun e!8565 () Bool)

(assert (=> b!14320 (= e!8564 e!8565)))

(declare-fun res!11103 () Bool)

(assert (=> b!14320 (=> (not res!11103) (not e!8565))))

(assert (=> b!14320 (= res!11103 (bvslt (_1!266 (h!983 lt!3591)) (_1!266 (h!983 (t!2817 lt!3591)))))))

(declare-fun b!14321 () Bool)

(assert (=> b!14321 (= e!8565 (isStrictlySorted!108 (t!2817 lt!3591)))))

(assert (= (and d!2207 (not res!11102)) b!14320))

(assert (= (and b!14320 res!11103) b!14321))

(declare-fun m!9579 () Bool)

(assert (=> b!14321 m!9579))

(assert (=> d!2145 d!2207))

(assert (=> d!2145 d!2201))

(declare-fun b!14322 () Bool)

(declare-fun e!8566 () Bool)

(declare-fun tp!2320 () Bool)

(assert (=> b!14322 (= e!8566 (and tp_is_empty!715 tp!2320))))

(assert (=> b!14282 (= tp!2318 e!8566)))

(assert (= (and b!14282 (is-Cons!417 (t!2817 (t!2817 l!522)))) b!14322))

(declare-fun b_lambda!911 () Bool)

(assert (= b_lambda!907 (or b!14089 b_lambda!911)))

(declare-fun bs!567 () Bool)

(declare-fun d!2209 () Bool)

(assert (= bs!567 (and d!2209 b!14089)))

(assert (=> bs!567 (= (dynLambda!90 lambda!134 (h!983 (t!2817 lt!3576))) (= (_2!266 (h!983 (t!2817 lt!3576))) value!159))))

(assert (=> b!14314 d!2209))

(declare-fun b_lambda!913 () Bool)

(assert (= b_lambda!909 (or b!14276 b_lambda!913)))

(declare-fun bs!568 () Bool)

(declare-fun d!2211 () Bool)

(assert (= bs!568 (and d!2211 b!14276)))

(assert (=> bs!568 (= (dynLambda!90 lambda!149 (h!983 lt!3591)) (= (_2!266 (h!983 lt!3591)) value!159))))

(assert (=> b!14318 d!2211))

(push 1)

(assert (not b!14321))

(assert (not bm!410))

(assert (not b!14322))

(assert (not b!14304))

(assert (not b_lambda!897))

(assert (not b!14313))

(assert (not b!14306))

(assert tp_is_empty!715)

(assert (not b!14309))

(assert (not b!14317))

(assert (not b_lambda!911))

(assert (not b!14319))

(assert (not d!2191))

(assert (not b!14312))

(assert (not bm!411))

(assert (not b!14315))

(assert (not b_lambda!913))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

