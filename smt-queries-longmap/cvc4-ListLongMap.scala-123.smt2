; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2092 () Bool)

(assert start!2092)

(declare-fun b!14140 () Bool)

(assert (=> b!14140 true))

(declare-fun b!14135 () Bool)

(declare-fun res!11008 () Bool)

(declare-fun e!8437 () Bool)

(assert (=> b!14135 (=> (not res!11008) (not e!8437))))

(declare-datatypes ((B!540 0))(
  ( (B!541 (val!368 Int)) )
))
(declare-datatypes ((tuple2!536 0))(
  ( (tuple2!537 (_1!268 (_ BitVec 64)) (_2!268 B!540)) )
))
(declare-datatypes ((List!423 0))(
  ( (Nil!420) (Cons!419 (h!985 tuple2!536) (t!2819 List!423)) )
))
(declare-fun l!522 () List!423)

(declare-fun value!159 () B!540)

(assert (=> b!14135 (= res!11008 (and (is-Cons!419 l!522) (= (_2!268 (h!985 l!522)) value!159)))))

(declare-fun b!14136 () Bool)

(declare-fun e!8435 () Bool)

(assert (=> b!14136 (= e!8437 e!8435)))

(declare-fun res!11006 () Bool)

(assert (=> b!14136 (=> res!11006 e!8435)))

(declare-fun lt!3582 () List!423)

(declare-fun isStrictlySorted!110 (List!423) Bool)

(assert (=> b!14136 (= res!11006 (not (isStrictlySorted!110 lt!3582)))))

(declare-fun $colon$colon!20 (List!423 tuple2!536) List!423)

(declare-fun filterByValue!15 (List!423 B!540) List!423)

(assert (=> b!14136 (= lt!3582 ($colon$colon!20 (filterByValue!15 (t!2819 l!522) value!159) (h!985 l!522)))))

(declare-fun b!14137 () Bool)

(declare-fun e!8434 () Bool)

(declare-fun e!8438 () Bool)

(assert (=> b!14137 (= e!8434 e!8438)))

(declare-fun res!11007 () Bool)

(declare-fun call!392 () Bool)

(assert (=> b!14137 (= res!11007 (not call!392))))

(assert (=> b!14137 (=> (not res!11007) (not e!8438))))

(declare-fun b!14138 () Bool)

(assert (=> b!14138 (= e!8435 e!8434)))

(declare-fun c!1298 () Bool)

(declare-fun isEmpty!101 (List!423) Bool)

(assert (=> b!14138 (= c!1298 (isEmpty!101 l!522))))

(declare-fun b!14139 () Bool)

(assert (=> b!14139 (= e!8434 (not call!392))))

(declare-fun res!11004 () Bool)

(assert (=> b!14140 (=> res!11004 e!8435)))

(declare-fun lambda!140 () Int)

(declare-fun forall!94 (List!423 Int) Bool)

(assert (=> b!14140 (= res!11004 (not (forall!94 lt!3582 lambda!140)))))

(declare-fun bm!389 () Bool)

(assert (=> bm!389 (= call!392 (isEmpty!101 lt!3582))))

(declare-fun b!14141 () Bool)

(declare-fun head!790 (List!423) tuple2!536)

(assert (=> b!14141 (= e!8438 (bvslt (_1!268 (head!790 lt!3582)) (_1!268 (head!790 l!522))))))

(declare-fun b!14142 () Bool)

(declare-fun e!8436 () Bool)

(declare-fun tp_is_empty!719 () Bool)

(declare-fun tp!2309 () Bool)

(assert (=> b!14142 (= e!8436 (and tp_is_empty!719 tp!2309))))

(declare-fun res!11005 () Bool)

(assert (=> start!2092 (=> (not res!11005) (not e!8437))))

(assert (=> start!2092 (= res!11005 (isStrictlySorted!110 l!522))))

(assert (=> start!2092 e!8437))

(assert (=> start!2092 e!8436))

(assert (=> start!2092 tp_is_empty!719))

(assert (= (and start!2092 res!11005) b!14135))

(assert (= (and b!14135 res!11008) b!14136))

(assert (= (and b!14136 (not res!11006)) b!14140))

(assert (= (and b!14140 (not res!11004)) b!14138))

(assert (= (and b!14138 c!1298) b!14139))

(assert (= (and b!14138 (not c!1298)) b!14137))

(assert (= (and b!14137 res!11007) b!14141))

(assert (= (or b!14139 b!14137) bm!389))

(assert (= (and start!2092 (is-Cons!419 l!522)) b!14142))

(declare-fun m!9431 () Bool)

(assert (=> b!14136 m!9431))

(declare-fun m!9433 () Bool)

(assert (=> b!14136 m!9433))

(assert (=> b!14136 m!9433))

(declare-fun m!9435 () Bool)

(assert (=> b!14136 m!9435))

(declare-fun m!9437 () Bool)

(assert (=> b!14141 m!9437))

(declare-fun m!9439 () Bool)

(assert (=> b!14141 m!9439))

(declare-fun m!9441 () Bool)

(assert (=> b!14138 m!9441))

(declare-fun m!9443 () Bool)

(assert (=> b!14140 m!9443))

(declare-fun m!9445 () Bool)

(assert (=> bm!389 m!9445))

(declare-fun m!9447 () Bool)

(assert (=> start!2092 m!9447))

(push 1)

(assert (not b!14140))

(assert (not bm!389))

(assert tp_is_empty!719)

(assert (not b!14141))

(assert (not b!14138))

(assert (not b!14136))

(assert (not start!2092))

(assert (not b!14142))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2105 () Bool)

(declare-fun res!11019 () Bool)

(declare-fun e!8449 () Bool)

(assert (=> d!2105 (=> res!11019 e!8449)))

(assert (=> d!2105 (= res!11019 (is-Nil!420 lt!3582))))

(assert (=> d!2105 (= (forall!94 lt!3582 lambda!140) e!8449)))

(declare-fun b!14155 () Bool)

(declare-fun e!8450 () Bool)

(assert (=> b!14155 (= e!8449 e!8450)))

(declare-fun res!11020 () Bool)

(assert (=> b!14155 (=> (not res!11020) (not e!8450))))

(declare-fun dynLambda!89 (Int tuple2!536) Bool)

(assert (=> b!14155 (= res!11020 (dynLambda!89 lambda!140 (h!985 lt!3582)))))

(declare-fun b!14156 () Bool)

(assert (=> b!14156 (= e!8450 (forall!94 (t!2819 lt!3582) lambda!140))))

(assert (= (and d!2105 (not res!11019)) b!14155))

(assert (= (and b!14155 res!11020) b!14156))

(declare-fun b_lambda!889 () Bool)

(assert (=> (not b_lambda!889) (not b!14155)))

(declare-fun m!9453 () Bool)

(assert (=> b!14155 m!9453))

(declare-fun m!9455 () Bool)

(assert (=> b!14156 m!9455))

(assert (=> b!14140 d!2105))

(declare-fun d!2113 () Bool)

(assert (=> d!2113 (= (isEmpty!101 l!522) (is-Nil!420 l!522))))

(assert (=> b!14138 d!2113))

(declare-fun d!2115 () Bool)

(declare-fun res!11037 () Bool)

(declare-fun e!8467 () Bool)

(assert (=> d!2115 (=> res!11037 e!8467)))

(assert (=> d!2115 (= res!11037 (or (is-Nil!420 l!522) (is-Nil!420 (t!2819 l!522))))))

(assert (=> d!2115 (= (isStrictlySorted!110 l!522) e!8467)))

(declare-fun b!14173 () Bool)

(declare-fun e!8468 () Bool)

(assert (=> b!14173 (= e!8467 e!8468)))

(declare-fun res!11038 () Bool)

(assert (=> b!14173 (=> (not res!11038) (not e!8468))))

(assert (=> b!14173 (= res!11038 (bvslt (_1!268 (h!985 l!522)) (_1!268 (h!985 (t!2819 l!522)))))))

(declare-fun b!14174 () Bool)

(assert (=> b!14174 (= e!8468 (isStrictlySorted!110 (t!2819 l!522)))))

(assert (= (and d!2115 (not res!11037)) b!14173))

(assert (= (and b!14173 res!11038) b!14174))

(declare-fun m!9463 () Bool)

(assert (=> b!14174 m!9463))

(assert (=> start!2092 d!2115))

(declare-fun d!2127 () Bool)

(assert (=> d!2127 (= (head!790 lt!3582) (h!985 lt!3582))))

(assert (=> b!14141 d!2127))

(declare-fun d!2129 () Bool)

(assert (=> d!2129 (= (head!790 l!522) (h!985 l!522))))

(assert (=> b!14141 d!2129))

(declare-fun d!2131 () Bool)

(declare-fun res!11039 () Bool)

(declare-fun e!8469 () Bool)

(assert (=> d!2131 (=> res!11039 e!8469)))

(assert (=> d!2131 (= res!11039 (or (is-Nil!420 lt!3582) (is-Nil!420 (t!2819 lt!3582))))))

(assert (=> d!2131 (= (isStrictlySorted!110 lt!3582) e!8469)))

(declare-fun b!14175 () Bool)

(declare-fun e!8470 () Bool)

(assert (=> b!14175 (= e!8469 e!8470)))

(declare-fun res!11040 () Bool)

(assert (=> b!14175 (=> (not res!11040) (not e!8470))))

(assert (=> b!14175 (= res!11040 (bvslt (_1!268 (h!985 lt!3582)) (_1!268 (h!985 (t!2819 lt!3582)))))))

(declare-fun b!14176 () Bool)

(assert (=> b!14176 (= e!8470 (isStrictlySorted!110 (t!2819 lt!3582)))))

(assert (= (and d!2131 (not res!11039)) b!14175))

(assert (= (and b!14175 res!11040) b!14176))

(declare-fun m!9465 () Bool)

(assert (=> b!14176 m!9465))

(assert (=> b!14136 d!2131))

(declare-fun d!2133 () Bool)

(assert (=> d!2133 (= ($colon$colon!20 (filterByValue!15 (t!2819 l!522) value!159) (h!985 l!522)) (Cons!419 (h!985 l!522) (filterByValue!15 (t!2819 l!522) value!159)))))

(assert (=> b!14136 d!2133))

(declare-fun bs!556 () Bool)

(declare-fun b!14256 () Bool)

(assert (= bs!556 (and b!14256 b!14140)))

(declare-fun lambda!148 () Int)

(assert (=> bs!556 (= lambda!148 lambda!140)))

(assert (=> b!14256 true))

(declare-fun b!14250 () Bool)

(declare-fun e!8519 () List!423)

(declare-fun e!8520 () List!423)

(assert (=> b!14250 (= e!8519 e!8520)))

(declare-fun c!1322 () Bool)

(assert (=> b!14250 (= c!1322 (and (is-Cons!419 (t!2819 l!522)) (not (= (_2!268 (h!985 (t!2819 l!522))) value!159))))))

(declare-fun d!2135 () Bool)

(declare-fun e!8517 () Bool)

(assert (=> d!2135 e!8517))

(declare-fun res!11073 () Bool)

(assert (=> d!2135 (=> (not res!11073) (not e!8517))))

(declare-fun lt!3590 () List!423)

(assert (=> d!2135 (= res!11073 (isStrictlySorted!110 lt!3590))))

(assert (=> d!2135 (= lt!3590 e!8519)))

(declare-fun c!1321 () Bool)

(assert (=> d!2135 (= c!1321 (and (is-Cons!419 (t!2819 l!522)) (= (_2!268 (h!985 (t!2819 l!522))) value!159)))))

(assert (=> d!2135 (isStrictlySorted!110 (t!2819 l!522))))

(assert (=> d!2135 (= (filterByValue!15 (t!2819 l!522) value!159) lt!3590)))

(declare-fun b!14251 () Bool)

(declare-fun e!8518 () Bool)

(assert (=> b!14251 (= e!8518 (bvsge (_1!268 (head!790 lt!3590)) (_1!268 (head!790 (t!2819 l!522)))))))

(declare-fun b!14252 () Bool)

(declare-fun e!8516 () Bool)

(declare-fun call!408 () Bool)

(assert (=> b!14252 (= e!8516 call!408)))

(declare-fun b!14253 () Bool)

(declare-fun call!407 () List!423)

(assert (=> b!14253 (= e!8519 ($colon$colon!20 call!407 (h!985 (t!2819 l!522))))))

(declare-fun b!14254 () Bool)

(assert (=> b!14254 (= e!8520 Nil!420)))

(declare-fun b!14255 () Bool)

(assert (=> b!14255 (= e!8517 e!8516)))

(declare-fun c!1320 () Bool)

(assert (=> b!14255 (= c!1320 (isEmpty!101 (t!2819 l!522)))))

(declare-fun bm!404 () Bool)

(assert (=> bm!404 (= call!408 (isEmpty!101 lt!3590))))

(declare-fun res!11072 () Bool)

(assert (=> b!14256 (=> (not res!11072) (not e!8517))))

(assert (=> b!14256 (= res!11072 (forall!94 lt!3590 lambda!148))))

(declare-fun b!14257 () Bool)

(assert (=> b!14257 (= e!8516 e!8518)))

(declare-fun res!11074 () Bool)

(assert (=> b!14257 (= res!11074 call!408)))

(assert (=> b!14257 (=> res!11074 e!8518)))

(declare-fun bm!405 () Bool)

(assert (=> bm!405 (= call!407 (filterByValue!15 (t!2819 (t!2819 l!522)) value!159))))

(declare-fun b!14258 () Bool)

(assert (=> b!14258 (= e!8520 call!407)))

(assert (= (and d!2135 c!1321) b!14253))

(assert (= (and d!2135 (not c!1321)) b!14250))

(assert (= (and b!14250 c!1322) b!14258))

(assert (= (and b!14250 (not c!1322)) b!14254))

(assert (= (or b!14253 b!14258) bm!405))

(assert (= (and d!2135 res!11073) b!14256))

(assert (= (and b!14256 res!11072) b!14255))

(assert (= (and b!14255 c!1320) b!14252))

(assert (= (and b!14255 (not c!1320)) b!14257))

(assert (= (and b!14257 (not res!11074)) b!14251))

(assert (= (or b!14252 b!14257) bm!404))

(declare-fun m!9489 () Bool)

(assert (=> b!14255 m!9489))

(declare-fun m!9491 () Bool)

(assert (=> b!14251 m!9491))

(declare-fun m!9493 () Bool)

(assert (=> b!14251 m!9493))

(declare-fun m!9495 () Bool)

(assert (=> b!14253 m!9495))

(declare-fun m!9497 () Bool)

(assert (=> d!2135 m!9497))

(assert (=> d!2135 m!9463))

(declare-fun m!9499 () Bool)

(assert (=> bm!404 m!9499))

(declare-fun m!9501 () Bool)

(assert (=> b!14256 m!9501))

(declare-fun m!9503 () Bool)

(assert (=> bm!405 m!9503))

(assert (=> b!14136 d!2135))

(declare-fun d!2155 () Bool)

(assert (=> d!2155 (= (isEmpty!101 lt!3582) (is-Nil!420 lt!3582))))

(assert (=> bm!389 d!2155))

(declare-fun b!14277 () Bool)

(declare-fun e!8531 () Bool)

(declare-fun tp!2315 () Bool)

(assert (=> b!14277 (= e!8531 (and tp_is_empty!719 tp!2315))))

(assert (=> b!14142 (= tp!2309 e!8531)))

(assert (= (and b!14142 (is-Cons!419 (t!2819 l!522))) b!14277))

(declare-fun b_lambda!895 () Bool)

(assert (= b_lambda!889 (or b!14140 b_lambda!895)))

(declare-fun bs!558 () Bool)

(declare-fun d!2157 () Bool)

(assert (= bs!558 (and d!2157 b!14140)))

(assert (=> bs!558 (= (dynLambda!89 lambda!140 (h!985 lt!3582)) (= (_2!268 (h!985 lt!3582)) value!159))))

(assert (=> b!14155 d!2157))

(push 1)

(assert (not bm!404))

(assert (not b!14174))

(assert (not b!14253))

(assert (not d!2135))

(assert (not b_lambda!895))

(assert (not bm!405))

(assert tp_is_empty!719)

(assert (not b!14256))

(assert (not b!14255))

(assert (not b!14176))

(assert (not b!14277))

(assert (not b!14156))

(assert (not b!14251))

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

(assert (=> d!2213 (= res!11104 (or (is-Nil!420 (t!2819 lt!3582)) (is-Nil!420 (t!2819 (t!2819 lt!3582)))))))

(assert (=> d!2213 (= (isStrictlySorted!110 (t!2819 lt!3582)) e!8567)))

(declare-fun b!14323 () Bool)

(declare-fun e!8568 () Bool)

(assert (=> b!14323 (= e!8567 e!8568)))

(declare-fun res!11105 () Bool)

(assert (=> b!14323 (=> (not res!11105) (not e!8568))))

(assert (=> b!14323 (= res!11105 (bvslt (_1!268 (h!985 (t!2819 lt!3582))) (_1!268 (h!985 (t!2819 (t!2819 lt!3582))))))))

(declare-fun b!14324 () Bool)

(assert (=> b!14324 (= e!8568 (isStrictlySorted!110 (t!2819 (t!2819 lt!3582))))))

(assert (= (and d!2213 (not res!11104)) b!14323))

(assert (= (and b!14323 res!11105) b!14324))

(declare-fun m!9581 () Bool)

(assert (=> b!14324 m!9581))

(assert (=> b!14176 d!2213))

(declare-fun d!2215 () Bool)

(assert (=> d!2215 (= (head!790 lt!3590) (h!985 lt!3590))))

(assert (=> b!14251 d!2215))

(declare-fun d!2217 () Bool)

(assert (=> d!2217 (= (head!790 (t!2819 l!522)) (h!985 (t!2819 l!522)))))

(assert (=> b!14251 d!2217))

(declare-fun d!2219 () Bool)

(declare-fun res!11106 () Bool)

(declare-fun e!8569 () Bool)

(assert (=> d!2219 (=> res!11106 e!8569)))

(assert (=> d!2219 (= res!11106 (is-Nil!420 lt!3590))))

(assert (=> d!2219 (= (forall!94 lt!3590 lambda!148) e!8569)))

(declare-fun b!14325 () Bool)

(declare-fun e!8570 () Bool)

(assert (=> b!14325 (= e!8569 e!8570)))

(declare-fun res!11107 () Bool)

(assert (=> b!14325 (=> (not res!11107) (not e!8570))))

(assert (=> b!14325 (= res!11107 (dynLambda!89 lambda!148 (h!985 lt!3590)))))

(declare-fun b!14326 () Bool)

(assert (=> b!14326 (= e!8570 (forall!94 (t!2819 lt!3590) lambda!148))))

(assert (= (and d!2219 (not res!11106)) b!14325))

(assert (= (and b!14325 res!11107) b!14326))

(declare-fun b_lambda!915 () Bool)

(assert (=> (not b_lambda!915) (not b!14325)))

(declare-fun m!9583 () Bool)

(assert (=> b!14325 m!9583))

(declare-fun m!9585 () Bool)

(assert (=> b!14326 m!9585))

(assert (=> b!14256 d!2219))

(declare-fun d!2221 () Bool)

(assert (=> d!2221 (= (isEmpty!101 (t!2819 l!522)) (is-Nil!420 (t!2819 l!522)))))

(assert (=> b!14255 d!2221))

(declare-fun d!2223 () Bool)

(declare-fun res!11108 () Bool)

(declare-fun e!8571 () Bool)

(assert (=> d!2223 (=> res!11108 e!8571)))

(assert (=> d!2223 (= res!11108 (or (is-Nil!420 lt!3590) (is-Nil!420 (t!2819 lt!3590))))))

(assert (=> d!2223 (= (isStrictlySorted!110 lt!3590) e!8571)))

(declare-fun b!14327 () Bool)

(declare-fun e!8572 () Bool)

(assert (=> b!14327 (= e!8571 e!8572)))

(declare-fun res!11109 () Bool)

(assert (=> b!14327 (=> (not res!11109) (not e!8572))))

(assert (=> b!14327 (= res!11109 (bvslt (_1!268 (h!985 lt!3590)) (_1!268 (h!985 (t!2819 lt!3590)))))))

(declare-fun b!14328 () Bool)

(assert (=> b!14328 (= e!8572 (isStrictlySorted!110 (t!2819 lt!3590)))))

(assert (= (and d!2223 (not res!11108)) b!14327))

(assert (= (and b!14327 res!11109) b!14328))

(declare-fun m!9587 () Bool)

(assert (=> b!14328 m!9587))

(assert (=> d!2135 d!2223))

(declare-fun d!2225 () Bool)

(declare-fun res!11110 () Bool)

(declare-fun e!8573 () Bool)

(assert (=> d!2225 (=> res!11110 e!8573)))

(assert (=> d!2225 (= res!11110 (or (is-Nil!420 (t!2819 l!522)) (is-Nil!420 (t!2819 (t!2819 l!522)))))))

(assert (=> d!2225 (= (isStrictlySorted!110 (t!2819 l!522)) e!8573)))

(declare-fun b!14329 () Bool)

(declare-fun e!8574 () Bool)

(assert (=> b!14329 (= e!8573 e!8574)))

(declare-fun res!11111 () Bool)

(assert (=> b!14329 (=> (not res!11111) (not e!8574))))

(assert (=> b!14329 (= res!11111 (bvslt (_1!268 (h!985 (t!2819 l!522))) (_1!268 (h!985 (t!2819 (t!2819 l!522))))))))

(declare-fun b!14330 () Bool)

(assert (=> b!14330 (= e!8574 (isStrictlySorted!110 (t!2819 (t!2819 l!522))))))

(assert (= (and d!2225 (not res!11110)) b!14329))

(assert (= (and b!14329 res!11111) b!14330))

(declare-fun m!9589 () Bool)

(assert (=> b!14330 m!9589))

(assert (=> d!2135 d!2225))

(declare-fun d!2227 () Bool)

(assert (=> d!2227 (= (isEmpty!101 lt!3590) (is-Nil!420 lt!3590))))

(assert (=> bm!404 d!2227))

(declare-fun bs!569 () Bool)

(declare-fun b!14337 () Bool)

(assert (= bs!569 (and b!14337 b!14140)))

(declare-fun lambda!152 () Int)

(assert (=> bs!569 (= lambda!152 lambda!140)))

(declare-fun bs!570 () Bool)

(assert (= bs!570 (and b!14337 b!14256)))

(assert (=> bs!570 (= lambda!152 lambda!148)))

(assert (=> b!14337 true))

(declare-fun b!14331 () Bool)

(declare-fun e!8578 () List!423)

(declare-fun e!8579 () List!423)

(assert (=> b!14331 (= e!8578 e!8579)))

(declare-fun c!1334 () Bool)

(assert (=> b!14331 (= c!1334 (and (is-Cons!419 (t!2819 (t!2819 l!522))) (not (= (_2!268 (h!985 (t!2819 (t!2819 l!522)))) value!159))))))

(declare-fun d!2229 () Bool)

(declare-fun e!8576 () Bool)

(assert (=> d!2229 e!8576))

(declare-fun res!11113 () Bool)

(assert (=> d!2229 (=> (not res!11113) (not e!8576))))

(declare-fun lt!3594 () List!423)

(assert (=> d!2229 (= res!11113 (isStrictlySorted!110 lt!3594))))

(assert (=> d!2229 (= lt!3594 e!8578)))

(declare-fun c!1333 () Bool)

(assert (=> d!2229 (= c!1333 (and (is-Cons!419 (t!2819 (t!2819 l!522))) (= (_2!268 (h!985 (t!2819 (t!2819 l!522)))) value!159)))))

(assert (=> d!2229 (isStrictlySorted!110 (t!2819 (t!2819 l!522)))))

(assert (=> d!2229 (= (filterByValue!15 (t!2819 (t!2819 l!522)) value!159) lt!3594)))

(declare-fun b!14332 () Bool)

(declare-fun e!8577 () Bool)

(assert (=> b!14332 (= e!8577 (bvsge (_1!268 (head!790 lt!3594)) (_1!268 (head!790 (t!2819 (t!2819 l!522))))))))

(declare-fun b!14333 () Bool)

(declare-fun e!8575 () Bool)

(declare-fun call!416 () Bool)

(assert (=> b!14333 (= e!8575 call!416)))

(declare-fun b!14334 () Bool)

(declare-fun call!415 () List!423)

(assert (=> b!14334 (= e!8578 ($colon$colon!20 call!415 (h!985 (t!2819 (t!2819 l!522)))))))

