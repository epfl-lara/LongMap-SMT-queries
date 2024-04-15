; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2090 () Bool)

(assert start!2090)

(declare-fun b!14114 () Bool)

(assert (=> b!14114 true))

(declare-fun b!14109 () Bool)

(declare-fun e!8422 () Bool)

(declare-fun e!8423 () Bool)

(assert (=> b!14109 (= e!8422 e!8423)))

(declare-fun res!10992 () Bool)

(declare-fun call!389 () Bool)

(assert (=> b!14109 (= res!10992 (not call!389))))

(assert (=> b!14109 (=> (not res!10992) (not e!8423))))

(declare-fun b!14110 () Bool)

(declare-fun e!8421 () Bool)

(declare-fun e!8420 () Bool)

(assert (=> b!14110 (= e!8421 e!8420)))

(declare-fun res!10993 () Bool)

(assert (=> b!14110 (=> res!10993 e!8420)))

(declare-datatypes ((B!538 0))(
  ( (B!539 (val!367 Int)) )
))
(declare-datatypes ((tuple2!530 0))(
  ( (tuple2!531 (_1!265 (_ BitVec 64)) (_2!265 B!538)) )
))
(declare-datatypes ((List!418 0))(
  ( (Nil!415) (Cons!414 (h!980 tuple2!530) (t!2814 List!418)) )
))
(declare-fun lt!3579 () List!418)

(declare-fun isStrictlySorted!106 (List!418) Bool)

(assert (=> b!14110 (= res!10993 (not (isStrictlySorted!106 lt!3579)))))

(declare-fun l!522 () List!418)

(declare-fun value!159 () B!538)

(declare-fun $colon$colon!19 (List!418 tuple2!530) List!418)

(declare-fun filterByValue!14 (List!418 B!538) List!418)

(assert (=> b!14110 (= lt!3579 ($colon$colon!19 (filterByValue!14 (t!2814 l!522) value!159) (h!980 l!522)))))

(declare-fun b!14111 () Bool)

(assert (=> b!14111 (= e!8420 e!8422)))

(declare-fun c!1295 () Bool)

(declare-fun isEmpty!100 (List!418) Bool)

(assert (=> b!14111 (= c!1295 (isEmpty!100 l!522))))

(declare-fun b!14112 () Bool)

(assert (=> b!14112 (= e!8422 (not call!389))))

(declare-fun res!10991 () Bool)

(assert (=> start!2090 (=> (not res!10991) (not e!8421))))

(assert (=> start!2090 (= res!10991 (isStrictlySorted!106 l!522))))

(assert (=> start!2090 e!8421))

(declare-fun e!8419 () Bool)

(assert (=> start!2090 e!8419))

(declare-fun tp_is_empty!717 () Bool)

(assert (=> start!2090 tp_is_empty!717))

(declare-fun b!14113 () Bool)

(declare-fun head!789 (List!418) tuple2!530)

(assert (=> b!14113 (= e!8423 (bvslt (_1!265 (head!789 lt!3579)) (_1!265 (head!789 l!522))))))

(declare-fun res!10990 () Bool)

(assert (=> b!14114 (=> res!10990 e!8420)))

(declare-fun lambda!137 () Int)

(declare-fun forall!93 (List!418 Int) Bool)

(assert (=> b!14114 (= res!10990 (not (forall!93 lt!3579 lambda!137)))))

(declare-fun b!14115 () Bool)

(declare-fun res!10989 () Bool)

(assert (=> b!14115 (=> (not res!10989) (not e!8421))))

(assert (=> b!14115 (= res!10989 (and (is-Cons!414 l!522) (= (_2!265 (h!980 l!522)) value!159)))))

(declare-fun b!14116 () Bool)

(declare-fun tp!2306 () Bool)

(assert (=> b!14116 (= e!8419 (and tp_is_empty!717 tp!2306))))

(declare-fun bm!386 () Bool)

(assert (=> bm!386 (= call!389 (isEmpty!100 lt!3579))))

(assert (= (and start!2090 res!10991) b!14115))

(assert (= (and b!14115 res!10989) b!14110))

(assert (= (and b!14110 (not res!10993)) b!14114))

(assert (= (and b!14114 (not res!10990)) b!14111))

(assert (= (and b!14111 c!1295) b!14112))

(assert (= (and b!14111 (not c!1295)) b!14109))

(assert (= (and b!14109 res!10992) b!14113))

(assert (= (or b!14112 b!14109) bm!386))

(assert (= (and start!2090 (is-Cons!414 l!522)) b!14116))

(declare-fun m!9405 () Bool)

(assert (=> b!14114 m!9405))

(declare-fun m!9407 () Bool)

(assert (=> b!14111 m!9407))

(declare-fun m!9409 () Bool)

(assert (=> b!14113 m!9409))

(declare-fun m!9411 () Bool)

(assert (=> b!14113 m!9411))

(declare-fun m!9413 () Bool)

(assert (=> start!2090 m!9413))

(declare-fun m!9415 () Bool)

(assert (=> b!14110 m!9415))

(declare-fun m!9417 () Bool)

(assert (=> b!14110 m!9417))

(assert (=> b!14110 m!9417))

(declare-fun m!9419 () Bool)

(assert (=> b!14110 m!9419))

(declare-fun m!9421 () Bool)

(assert (=> bm!386 m!9421))

(push 1)

(assert (not b!14114))

(assert (not b!14110))

(assert (not b!14116))

(assert tp_is_empty!717)

(assert (not b!14111))

(assert (not b!14113))

(assert (not bm!386))

(assert (not start!2090))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2103 () Bool)

(declare-fun res!11019 () Bool)

(declare-fun e!8449 () Bool)

(assert (=> d!2103 (=> res!11019 e!8449)))

(assert (=> d!2103 (= res!11019 (or (is-Nil!415 lt!3579) (is-Nil!415 (t!2814 lt!3579))))))

(assert (=> d!2103 (= (isStrictlySorted!106 lt!3579) e!8449)))

(declare-fun b!14155 () Bool)

(declare-fun e!8450 () Bool)

(assert (=> b!14155 (= e!8449 e!8450)))

(declare-fun res!11020 () Bool)

(assert (=> b!14155 (=> (not res!11020) (not e!8450))))

(assert (=> b!14155 (= res!11020 (bvslt (_1!265 (h!980 lt!3579)) (_1!265 (h!980 (t!2814 lt!3579)))))))

(declare-fun b!14156 () Bool)

(assert (=> b!14156 (= e!8450 (isStrictlySorted!106 (t!2814 lt!3579)))))

(assert (= (and d!2103 (not res!11019)) b!14155))

(assert (= (and b!14155 res!11020) b!14156))

(declare-fun m!9443 () Bool)

(assert (=> b!14156 m!9443))

(assert (=> b!14110 d!2103))

(declare-fun d!2107 () Bool)

(assert (=> d!2107 (= ($colon$colon!19 (filterByValue!14 (t!2814 l!522) value!159) (h!980 l!522)) (Cons!414 (h!980 l!522) (filterByValue!14 (t!2814 l!522) value!159)))))

(assert (=> b!14110 d!2107))

(declare-fun bs!556 () Bool)

(declare-fun b!14227 () Bool)

(assert (= bs!556 (and b!14227 b!14114)))

(declare-fun lambda!148 () Int)

(assert (=> bs!556 (= lambda!148 lambda!137)))

(assert (=> b!14227 true))

(declare-fun b!14219 () Bool)

(declare-fun e!8494 () Bool)

(declare-fun e!8493 () Bool)

(assert (=> b!14219 (= e!8494 e!8493)))

(declare-fun c!1320 () Bool)

(assert (=> b!14219 (= c!1320 (isEmpty!100 (t!2814 l!522)))))

(declare-fun bm!402 () Bool)

(declare-fun call!405 () Bool)

(declare-fun lt!3590 () List!418)

(assert (=> bm!402 (= call!405 (isEmpty!100 lt!3590))))

(declare-fun b!14222 () Bool)

(declare-fun e!8490 () Bool)

(assert (=> b!14222 (= e!8490 (bvsge (_1!265 (head!789 lt!3590)) (_1!265 (head!789 (t!2814 l!522)))))))

(declare-fun b!14223 () Bool)

(declare-fun e!8491 () List!418)

(assert (=> b!14223 (= e!8491 Nil!415)))

(declare-fun b!14224 () Bool)

(declare-fun e!8492 () List!418)

(declare-fun call!406 () List!418)

(assert (=> b!14224 (= e!8492 ($colon$colon!19 call!406 (h!980 (t!2814 l!522))))))

(declare-fun b!14225 () Bool)

(assert (=> b!14225 (= e!8493 call!405)))

(declare-fun b!14226 () Bool)

(assert (=> b!14226 (= e!8492 e!8491)))

(declare-fun c!1319 () Bool)

(assert (=> b!14226 (= c!1319 (and (is-Cons!414 (t!2814 l!522)) (not (= (_2!265 (h!980 (t!2814 l!522))) value!159))))))

(declare-fun res!11049 () Bool)

(assert (=> b!14227 (=> (not res!11049) (not e!8494))))

(assert (=> b!14227 (= res!11049 (forall!93 lt!3590 lambda!148))))

(declare-fun b!14228 () Bool)

(assert (=> b!14228 (= e!8493 e!8490)))

(declare-fun res!11050 () Bool)

(assert (=> b!14228 (= res!11050 call!405)))

(assert (=> b!14228 (=> res!11050 e!8490)))

(declare-fun bm!403 () Bool)

(assert (=> bm!403 (= call!406 (filterByValue!14 (t!2814 (t!2814 l!522)) value!159))))

(declare-fun d!2111 () Bool)

(assert (=> d!2111 e!8494))

(declare-fun res!11048 () Bool)

(assert (=> d!2111 (=> (not res!11048) (not e!8494))))

(assert (=> d!2111 (= res!11048 (isStrictlySorted!106 lt!3590))))

(assert (=> d!2111 (= lt!3590 e!8492)))

(declare-fun c!1317 () Bool)

(assert (=> d!2111 (= c!1317 (and (is-Cons!414 (t!2814 l!522)) (= (_2!265 (h!980 (t!2814 l!522))) value!159)))))

(assert (=> d!2111 (isStrictlySorted!106 (t!2814 l!522))))

(assert (=> d!2111 (= (filterByValue!14 (t!2814 l!522) value!159) lt!3590)))

(declare-fun b!14221 () Bool)

(assert (=> b!14221 (= e!8491 call!406)))

(assert (= (and d!2111 c!1317) b!14224))

(assert (= (and d!2111 (not c!1317)) b!14226))

(assert (= (and b!14226 c!1319) b!14221))

(assert (= (and b!14226 (not c!1319)) b!14223))

(assert (= (or b!14224 b!14221) bm!403))

(assert (= (and d!2111 res!11048) b!14227))

(assert (= (and b!14227 res!11049) b!14219))

(assert (= (and b!14219 c!1320) b!14225))

(assert (= (and b!14219 (not c!1320)) b!14228))

(assert (= (and b!14228 (not res!11050)) b!14222))

(assert (= (or b!14225 b!14228) bm!402))

(declare-fun m!9451 () Bool)

(assert (=> b!14227 m!9451))

(declare-fun m!9455 () Bool)

(assert (=> bm!402 m!9455))

(declare-fun m!9459 () Bool)

(assert (=> bm!403 m!9459))

(declare-fun m!9461 () Bool)

(assert (=> b!14222 m!9461))

(declare-fun m!9465 () Bool)

(assert (=> b!14222 m!9465))

(declare-fun m!9471 () Bool)

(assert (=> b!14224 m!9471))

(declare-fun m!9475 () Bool)

(assert (=> d!2111 m!9475))

(declare-fun m!9478 () Bool)

(assert (=> d!2111 m!9478))

(declare-fun m!9481 () Bool)

(assert (=> b!14219 m!9481))

(assert (=> b!14110 d!2111))

(declare-fun d!2123 () Bool)

(declare-fun res!11061 () Bool)

(declare-fun e!8507 () Bool)

(assert (=> d!2123 (=> res!11061 e!8507)))

(assert (=> d!2123 (= res!11061 (is-Nil!415 lt!3579))))

(assert (=> d!2123 (= (forall!93 lt!3579 lambda!137) e!8507)))

(declare-fun b!14245 () Bool)

(declare-fun e!8508 () Bool)

(assert (=> b!14245 (= e!8507 e!8508)))

(declare-fun res!11062 () Bool)

(assert (=> b!14245 (=> (not res!11062) (not e!8508))))

(declare-fun dynLambda!87 (Int tuple2!530) Bool)

(assert (=> b!14245 (= res!11062 (dynLambda!87 lambda!137 (h!980 lt!3579)))))

(declare-fun b!14246 () Bool)

(assert (=> b!14246 (= e!8508 (forall!93 (t!2814 lt!3579) lambda!137))))

(assert (= (and d!2123 (not res!11061)) b!14245))

(assert (= (and b!14245 res!11062) b!14246))

(declare-fun b_lambda!887 () Bool)

(assert (=> (not b_lambda!887) (not b!14245)))

(declare-fun m!9485 () Bool)

(assert (=> b!14245 m!9485))

(declare-fun m!9487 () Bool)

(assert (=> b!14246 m!9487))

(assert (=> b!14114 d!2123))

(declare-fun d!2131 () Bool)

(assert (=> d!2131 (= (head!789 lt!3579) (h!980 lt!3579))))

(assert (=> b!14113 d!2131))

(declare-fun d!2133 () Bool)

(assert (=> d!2133 (= (head!789 l!522) (h!980 l!522))))

(assert (=> b!14113 d!2133))

(declare-fun d!2135 () Bool)

(declare-fun res!11068 () Bool)

(declare-fun e!8516 () Bool)

(assert (=> d!2135 (=> res!11068 e!8516)))

(assert (=> d!2135 (= res!11068 (or (is-Nil!415 l!522) (is-Nil!415 (t!2814 l!522))))))

(assert (=> d!2135 (= (isStrictlySorted!106 l!522) e!8516)))

(declare-fun b!14258 () Bool)

(declare-fun e!8517 () Bool)

(assert (=> b!14258 (= e!8516 e!8517)))

(declare-fun res!11069 () Bool)

(assert (=> b!14258 (=> (not res!11069) (not e!8517))))

(assert (=> b!14258 (= res!11069 (bvslt (_1!265 (h!980 l!522)) (_1!265 (h!980 (t!2814 l!522)))))))

(declare-fun b!14259 () Bool)

(assert (=> b!14259 (= e!8517 (isStrictlySorted!106 (t!2814 l!522)))))

(assert (= (and d!2135 (not res!11068)) b!14258))

(assert (= (and b!14258 res!11069) b!14259))

(assert (=> b!14259 m!9478))

(assert (=> start!2090 d!2135))

(declare-fun d!2139 () Bool)

(assert (=> d!2139 (= (isEmpty!100 lt!3579) (is-Nil!415 lt!3579))))

(assert (=> bm!386 d!2139))

(declare-fun d!2145 () Bool)

(assert (=> d!2145 (= (isEmpty!100 l!522) (is-Nil!415 l!522))))

(assert (=> b!14111 d!2145))

(declare-fun b!14270 () Bool)

(declare-fun e!8524 () Bool)

(declare-fun tp!2314 () Bool)

(assert (=> b!14270 (= e!8524 (and tp_is_empty!717 tp!2314))))

(assert (=> b!14116 (= tp!2306 e!8524)))

(assert (= (and b!14116 (is-Cons!414 (t!2814 l!522))) b!14270))

(declare-fun b_lambda!891 () Bool)

(assert (= b_lambda!887 (or b!14114 b_lambda!891)))

(declare-fun bs!558 () Bool)

(declare-fun d!2155 () Bool)

(assert (= bs!558 (and d!2155 b!14114)))

(assert (=> bs!558 (= (dynLambda!87 lambda!137 (h!980 lt!3579)) (= (_2!265 (h!980 lt!3579)) value!159))))

(assert (=> b!14245 d!2155))

(push 1)

(assert (not b!14246))

(assert tp_is_empty!717)

(assert (not b!14259))

(assert (not bm!402))

(assert (not b!14222))

(assert (not d!2111))

(assert (not b!14224))

(assert (not b!14227))

(assert (not b!14270))

(assert (not b!14156))

(assert (not b!14219))

(assert (not b_lambda!891))

(assert (not bm!403))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2213 () Bool)

(declare-fun res!11104 () Bool)

(declare-fun e!8567 () Bool)

(assert (=> d!2213 (=> res!11104 e!8567)))

(assert (=> d!2213 (= res!11104 (is-Nil!415 (t!2814 lt!3579)))))

(assert (=> d!2213 (= (forall!93 (t!2814 lt!3579) lambda!137) e!8567)))

(declare-fun b!14323 () Bool)

(declare-fun e!8568 () Bool)

(assert (=> b!14323 (= e!8567 e!8568)))

(declare-fun res!11105 () Bool)

(assert (=> b!14323 (=> (not res!11105) (not e!8568))))

(assert (=> b!14323 (= res!11105 (dynLambda!87 lambda!137 (h!980 (t!2814 lt!3579))))))

(declare-fun b!14324 () Bool)

(assert (=> b!14324 (= e!8568 (forall!93 (t!2814 (t!2814 lt!3579)) lambda!137))))

(assert (= (and d!2213 (not res!11104)) b!14323))

(assert (= (and b!14323 res!11105) b!14324))

(declare-fun b_lambda!915 () Bool)

(assert (=> (not b_lambda!915) (not b!14323)))

(declare-fun m!9573 () Bool)

(assert (=> b!14323 m!9573))

(declare-fun m!9575 () Bool)

(assert (=> b!14324 m!9575))

(assert (=> b!14246 d!2213))

(declare-fun d!2215 () Bool)

(declare-fun res!11106 () Bool)

(declare-fun e!8569 () Bool)

(assert (=> d!2215 (=> res!11106 e!8569)))

(assert (=> d!2215 (= res!11106 (is-Nil!415 lt!3590))))

(assert (=> d!2215 (= (forall!93 lt!3590 lambda!148) e!8569)))

(declare-fun b!14325 () Bool)

(declare-fun e!8570 () Bool)

(assert (=> b!14325 (= e!8569 e!8570)))

(declare-fun res!11107 () Bool)

(assert (=> b!14325 (=> (not res!11107) (not e!8570))))

(assert (=> b!14325 (= res!11107 (dynLambda!87 lambda!148 (h!980 lt!3590)))))

(declare-fun b!14326 () Bool)

(assert (=> b!14326 (= e!8570 (forall!93 (t!2814 lt!3590) lambda!148))))

(assert (= (and d!2215 (not res!11106)) b!14325))

(assert (= (and b!14325 res!11107) b!14326))

(declare-fun b_lambda!917 () Bool)

(assert (=> (not b_lambda!917) (not b!14325)))

(declare-fun m!9577 () Bool)

(assert (=> b!14325 m!9577))

(declare-fun m!9579 () Bool)

(assert (=> b!14326 m!9579))

(assert (=> b!14227 d!2215))

(declare-fun d!2217 () Bool)

(assert (=> d!2217 (= (head!789 lt!3590) (h!980 lt!3590))))

(assert (=> b!14222 d!2217))

(declare-fun d!2219 () Bool)

(assert (=> d!2219 (= (head!789 (t!2814 l!522)) (h!980 (t!2814 l!522)))))

(assert (=> b!14222 d!2219))

(declare-fun d!2221 () Bool)

(declare-fun res!11108 () Bool)

(declare-fun e!8571 () Bool)

(assert (=> d!2221 (=> res!11108 e!8571)))

(assert (=> d!2221 (= res!11108 (or (is-Nil!415 lt!3590) (is-Nil!415 (t!2814 lt!3590))))))

(assert (=> d!2221 (= (isStrictlySorted!106 lt!3590) e!8571)))

(declare-fun b!14327 () Bool)

(declare-fun e!8572 () Bool)

(assert (=> b!14327 (= e!8571 e!8572)))

(declare-fun res!11109 () Bool)

(assert (=> b!14327 (=> (not res!11109) (not e!8572))))

(assert (=> b!14327 (= res!11109 (bvslt (_1!265 (h!980 lt!3590)) (_1!265 (h!980 (t!2814 lt!3590)))))))

(declare-fun b!14328 () Bool)

(assert (=> b!14328 (= e!8572 (isStrictlySorted!106 (t!2814 lt!3590)))))

(assert (= (and d!2221 (not res!11108)) b!14327))

(assert (= (and b!14327 res!11109) b!14328))

(declare-fun m!9581 () Bool)

(assert (=> b!14328 m!9581))

(assert (=> d!2111 d!2221))

(declare-fun d!2223 () Bool)

(declare-fun res!11110 () Bool)

(declare-fun e!8573 () Bool)

(assert (=> d!2223 (=> res!11110 e!8573)))

(assert (=> d!2223 (= res!11110 (or (is-Nil!415 (t!2814 l!522)) (is-Nil!415 (t!2814 (t!2814 l!522)))))))

(assert (=> d!2223 (= (isStrictlySorted!106 (t!2814 l!522)) e!8573)))

(declare-fun b!14329 () Bool)

(declare-fun e!8574 () Bool)

(assert (=> b!14329 (= e!8573 e!8574)))

(declare-fun res!11111 () Bool)

(assert (=> b!14329 (=> (not res!11111) (not e!8574))))

(assert (=> b!14329 (= res!11111 (bvslt (_1!265 (h!980 (t!2814 l!522))) (_1!265 (h!980 (t!2814 (t!2814 l!522))))))))

(declare-fun b!14330 () Bool)

(assert (=> b!14330 (= e!8574 (isStrictlySorted!106 (t!2814 (t!2814 l!522))))))

(assert (= (and d!2223 (not res!11110)) b!14329))

(assert (= (and b!14329 res!11111) b!14330))

(declare-fun m!9583 () Bool)

(assert (=> b!14330 m!9583))

(assert (=> d!2111 d!2223))

(declare-fun d!2225 () Bool)

(assert (=> d!2225 (= (isEmpty!100 lt!3590) (is-Nil!415 lt!3590))))

(assert (=> bm!402 d!2225))

(assert (=> b!14259 d!2223))

(declare-fun d!2227 () Bool)

(assert (=> d!2227 (= ($colon$colon!19 call!406 (h!980 (t!2814 l!522))) (Cons!414 (h!980 (t!2814 l!522)) call!406))))

(assert (=> b!14224 d!2227))

(declare-fun bs!569 () Bool)

(declare-fun b!14338 () Bool)

(assert (= bs!569 (and b!14338 b!14114)))

(declare-fun lambda!152 () Int)

(assert (=> bs!569 (= lambda!152 lambda!137)))

(declare-fun bs!570 () Bool)

(assert (= bs!570 (and b!14338 b!14227)))

(assert (=> bs!570 (= lambda!152 lambda!148)))

(assert (=> b!14338 true))

(declare-fun b!14331 () Bool)

(declare-fun e!8579 () Bool)

(declare-fun e!8578 () Bool)

(assert (=> b!14331 (= e!8579 e!8578)))

(declare-fun c!1334 () Bool)

(assert (=> b!14331 (= c!1334 (isEmpty!100 (t!2814 (t!2814 l!522))))))

(declare-fun bm!412 () Bool)

(declare-fun call!415 () Bool)

(declare-fun lt!3594 () List!418)

(assert (=> bm!412 (= call!415 (isEmpty!100 lt!3594))))

(declare-fun b!14333 () Bool)

(declare-fun e!8575 () Bool)

(assert (=> b!14333 (= e!8575 (bvsge (_1!265 (head!789 lt!3594)) (_1!265 (head!789 (t!2814 (t!2814 l!522))))))))

(declare-fun b!14334 () Bool)

(declare-fun e!8576 () List!418)

(assert (=> b!14334 (= e!8576 Nil!415)))

(declare-fun b!14335 () Bool)

(declare-fun e!8577 () List!418)

(declare-fun call!416 () List!418)

(assert (=> b!14335 (= e!8577 ($colon$colon!19 call!416 (h!980 (t!2814 (t!2814 l!522)))))))

(declare-fun b!14336 () Bool)

(assert (=> b!14336 (= e!8578 call!415)))

(declare-fun b!14337 () Bool)

(assert (=> b!14337 (= e!8577 e!8576)))

(declare-fun c!1333 () Bool)

(assert (=> b!14337 (= c!1333 (and (is-Cons!414 (t!2814 (t!2814 l!522))) (not (= (_2!265 (h!980 (t!2814 (t!2814 l!522)))) value!159))))))

(declare-fun res!11113 () Bool)

(assert (=> b!14338 (=> (not res!11113) (not e!8579))))

(assert (=> b!14338 (= res!11113 (forall!93 lt!3594 lambda!152))))

(declare-fun b!14339 () Bool)

(assert (=> b!14339 (= e!8578 e!8575)))

(declare-fun res!11114 () Bool)

(assert (=> b!14339 (= res!11114 call!415)))

(assert (=> b!14339 (=> res!11114 e!8575)))

(declare-fun bm!413 () Bool)

(assert (=> bm!413 (= call!416 (filterByValue!14 (t!2814 (t!2814 (t!2814 l!522))) value!159))))

(declare-fun d!2229 () Bool)

(assert (=> d!2229 e!8579))

(declare-fun res!11112 () Bool)

(assert (=> d!2229 (=> (not res!11112) (not e!8579))))

(assert (=> d!2229 (= res!11112 (isStrictlySorted!106 lt!3594))))

(assert (=> d!2229 (= lt!3594 e!8577)))

(declare-fun c!1332 () Bool)

(assert (=> d!2229 (= c!1332 (and (is-Cons!414 (t!2814 (t!2814 l!522))) (= (_2!265 (h!980 (t!2814 (t!2814 l!522)))) value!159)))))

(assert (=> d!2229 (isStrictlySorted!106 (t!2814 (t!2814 l!522)))))

(assert (=> d!2229 (= (filterByValue!14 (t!2814 (t!2814 l!522)) value!159) lt!3594)))

(declare-fun b!14332 () Bool)

(assert (=> b!14332 (= e!8576 call!416)))

(assert (= (and d!2229 c!1332) b!14335))

(assert (= (and d!2229 (not c!1332)) b!14337))

(assert (= (and b!14337 c!1333) b!14332))

(assert (= (and b!14337 (not c!1333)) b!14334))

(assert (= (or b!14335 b!14332) bm!413))

(assert (= (and d!2229 res!11112) b!14338))

(assert (= (and b!14338 res!11113) b!14331))

(assert (= (and b!14331 c!1334) b!14336))

(assert (= (and b!14331 (not c!1334)) b!14339))

(assert (= (and b!14339 (not res!11114)) b!14333))

(assert (= (or b!14336 b!14339) bm!412))

(declare-fun m!9585 () Bool)

(assert (=> b!14338 m!9585))

(declare-fun m!9587 () Bool)

(assert (=> bm!412 m!9587))

(declare-fun m!9589 () Bool)

(assert (=> bm!413 m!9589))

(declare-fun m!9591 () Bool)

(assert (=> b!14333 m!9591))

(declare-fun m!9593 () Bool)

(assert (=> b!14333 m!9593))

(declare-fun m!9595 () Bool)

(assert (=> b!14335 m!9595))

(declare-fun m!9597 () Bool)

(assert (=> d!2229 m!9597))

(assert (=> d!2229 m!9583))

(declare-fun m!9599 () Bool)

(assert (=> b!14331 m!9599))

(assert (=> bm!403 d!2229))

(declare-fun d!2231 () Bool)

(declare-fun res!11115 () Bool)

(declare-fun e!8580 () Bool)

(assert (=> d!2231 (=> res!11115 e!8580)))

(assert (=> d!2231 (= res!11115 (or (is-Nil!415 (t!2814 lt!3579)) (is-Nil!415 (t!2814 (t!2814 lt!3579)))))))

(assert (=> d!2231 (= (isStrictlySorted!106 (t!2814 lt!3579)) e!8580)))

(declare-fun b!14340 () Bool)

(declare-fun e!8581 () Bool)

(assert (=> b!14340 (= e!8580 e!8581)))

(declare-fun res!11116 () Bool)

(assert (=> b!14340 (=> (not res!11116) (not e!8581))))

(assert (=> b!14340 (= res!11116 (bvslt (_1!265 (h!980 (t!2814 lt!3579))) (_1!265 (h!980 (t!2814 (t!2814 lt!3579))))))))

(declare-fun b!14341 () Bool)

(assert (=> b!14341 (= e!8581 (isStrictlySorted!106 (t!2814 (t!2814 lt!3579))))))

(assert (= (and d!2231 (not res!11115)) b!14340))

(assert (= (and b!14340 res!11116) b!14341))

(declare-fun m!9601 () Bool)

(assert (=> b!14341 m!9601))

(assert (=> b!14156 d!2231))

(declare-fun d!2233 () Bool)

(assert (=> d!2233 (= (isEmpty!100 (t!2814 l!522)) (is-Nil!415 (t!2814 l!522)))))

(assert (=> b!14219 d!2233))

(declare-fun b!14342 () Bool)

(declare-fun e!8582 () Bool)

(declare-fun tp!2321 () Bool)

(assert (=> b!14342 (= e!8582 (and tp_is_empty!717 tp!2321))))

(assert (=> b!14270 (= tp!2314 e!8582)))

(assert (= (and b!14270 (is-Cons!414 (t!2814 (t!2814 l!522)))) b!14342))

(declare-fun b_lambda!919 () Bool)

(assert (= b_lambda!915 (or b!14114 b_lambda!919)))

(declare-fun bs!571 () Bool)

(declare-fun d!2235 () Bool)

(assert (= bs!571 (and d!2235 b!14114)))

(assert (=> bs!571 (= (dynLambda!87 lambda!137 (h!980 (t!2814 lt!3579))) (= (_2!265 (h!980 (t!2814 lt!3579))) value!159))))

(assert (=> b!14323 d!2235))

(declare-fun b_lambda!921 () Bool)

(assert (= b_lambda!917 (or b!14227 b_lambda!921)))

(declare-fun bs!572 () Bool)

(declare-fun d!2237 () Bool)

(assert (= bs!572 (and d!2237 b!14227)))

(assert (=> bs!572 (= (dynLambda!87 lambda!148 (h!980 lt!3590)) (= (_2!265 (h!980 lt!3590)) value!159))))

(assert (=> b!14325 d!2237))

(push 1)

(assert (not bm!413))

(assert (not bm!412))

(assert (not b!14330))

(assert (not d!2229))

(assert (not b!14324))

(assert (not b_lambda!891))

(assert (not b_lambda!919))

(assert (not b!14326))

(assert (not b!14341))

(assert (not b!14342))

(assert tp_is_empty!717)

(assert (not b!14328))

(assert (not b!14333))

(assert (not b!14338))

(assert (not b!14335))

(assert (not b!14331))

(assert (not b_lambda!921))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

