; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2092 () Bool)

(assert start!2092)

(declare-fun b!14132 () Bool)

(assert (=> b!14132 true))

(declare-fun res!11002 () Bool)

(declare-fun e!8432 () Bool)

(assert (=> start!2092 (=> (not res!11002) (not e!8432))))

(declare-datatypes ((B!540 0))(
  ( (B!541 (val!368 Int)) )
))
(declare-datatypes ((tuple2!532 0))(
  ( (tuple2!533 (_1!266 (_ BitVec 64)) (_2!266 B!540)) )
))
(declare-datatypes ((List!419 0))(
  ( (Nil!416) (Cons!415 (h!981 tuple2!532) (t!2815 List!419)) )
))
(declare-fun l!522 () List!419)

(declare-fun isStrictlySorted!104 (List!419) Bool)

(assert (=> start!2092 (= res!11002 (isStrictlySorted!104 l!522))))

(assert (=> start!2092 e!8432))

(declare-fun e!8434 () Bool)

(assert (=> start!2092 e!8434))

(declare-fun tp_is_empty!719 () Bool)

(assert (=> start!2092 tp_is_empty!719))

(declare-fun bm!389 () Bool)

(declare-fun call!392 () Bool)

(declare-fun lt!3582 () List!419)

(declare-fun isEmpty!101 (List!419) Bool)

(assert (=> bm!389 (= call!392 (isEmpty!101 lt!3582))))

(declare-fun b!14129 () Bool)

(declare-fun tp!2309 () Bool)

(assert (=> b!14129 (= e!8434 (and tp_is_empty!719 tp!2309))))

(declare-fun b!14130 () Bool)

(declare-fun e!8433 () Bool)

(declare-fun e!8431 () Bool)

(assert (=> b!14130 (= e!8433 e!8431)))

(declare-fun c!1296 () Bool)

(assert (=> b!14130 (= c!1296 (isEmpty!101 l!522))))

(declare-fun b!14131 () Bool)

(assert (=> b!14131 (= e!8432 e!8433)))

(declare-fun res!11004 () Bool)

(assert (=> b!14131 (=> res!11004 e!8433)))

(assert (=> b!14131 (= res!11004 (not (isStrictlySorted!104 lt!3582)))))

(declare-fun value!159 () B!540)

(declare-fun $colon$colon!20 (List!419 tuple2!532) List!419)

(declare-fun filterByValue!15 (List!419 B!540) List!419)

(assert (=> b!14131 (= lt!3582 ($colon$colon!20 (filterByValue!15 (t!2815 l!522) value!159) (h!981 l!522)))))

(declare-fun res!11006 () Bool)

(assert (=> b!14132 (=> res!11006 e!8433)))

(declare-fun lambda!140 () Int)

(declare-fun forall!94 (List!419 Int) Bool)

(assert (=> b!14132 (= res!11006 (not (forall!94 lt!3582 lambda!140)))))

(declare-fun b!14133 () Bool)

(declare-fun e!8430 () Bool)

(assert (=> b!14133 (= e!8431 e!8430)))

(declare-fun res!11003 () Bool)

(assert (=> b!14133 (= res!11003 (not call!392))))

(assert (=> b!14133 (=> (not res!11003) (not e!8430))))

(declare-fun b!14134 () Bool)

(declare-fun res!11005 () Bool)

(assert (=> b!14134 (=> (not res!11005) (not e!8432))))

(assert (=> b!14134 (= res!11005 (and (is-Cons!415 l!522) (= (_2!266 (h!981 l!522)) value!159)))))

(declare-fun b!14135 () Bool)

(declare-fun head!788 (List!419) tuple2!532)

(assert (=> b!14135 (= e!8430 (bvslt (_1!266 (head!788 lt!3582)) (_1!266 (head!788 l!522))))))

(declare-fun b!14136 () Bool)

(assert (=> b!14136 (= e!8431 (not call!392))))

(assert (= (and start!2092 res!11002) b!14134))

(assert (= (and b!14134 res!11005) b!14131))

(assert (= (and b!14131 (not res!11004)) b!14132))

(assert (= (and b!14132 (not res!11006)) b!14130))

(assert (= (and b!14130 c!1296) b!14136))

(assert (= (and b!14130 (not c!1296)) b!14133))

(assert (= (and b!14133 res!11003) b!14135))

(assert (= (or b!14136 b!14133) bm!389))

(assert (= (and start!2092 (is-Cons!415 l!522)) b!14129))

(declare-fun m!9423 () Bool)

(assert (=> start!2092 m!9423))

(declare-fun m!9425 () Bool)

(assert (=> b!14132 m!9425))

(declare-fun m!9427 () Bool)

(assert (=> b!14131 m!9427))

(declare-fun m!9429 () Bool)

(assert (=> b!14131 m!9429))

(assert (=> b!14131 m!9429))

(declare-fun m!9431 () Bool)

(assert (=> b!14131 m!9431))

(declare-fun m!9433 () Bool)

(assert (=> b!14130 m!9433))

(declare-fun m!9435 () Bool)

(assert (=> b!14135 m!9435))

(declare-fun m!9437 () Bool)

(assert (=> b!14135 m!9437))

(declare-fun m!9439 () Bool)

(assert (=> bm!389 m!9439))

(push 1)

(assert (not b!14130))

(assert (not bm!389))

(assert (not start!2092))

(assert (not b!14132))

(assert tp_is_empty!719)

(assert (not b!14129))

(assert (not b!14131))

(assert (not b!14135))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2119 () Bool)

(assert (=> d!2119 (= (isEmpty!101 lt!3582) (is-Nil!416 lt!3582))))

(assert (=> bm!389 d!2119))

(declare-fun d!2121 () Bool)

(declare-fun res!11049 () Bool)

(declare-fun e!8485 () Bool)

(assert (=> d!2121 (=> res!11049 e!8485)))

(assert (=> d!2121 (= res!11049 (is-Nil!416 lt!3582))))

(assert (=> d!2121 (= (forall!94 lt!3582 lambda!140) e!8485)))

(declare-fun b!14205 () Bool)

(declare-fun e!8486 () Bool)

(assert (=> b!14205 (= e!8485 e!8486)))

(declare-fun res!11050 () Bool)

(assert (=> b!14205 (=> (not res!11050) (not e!8486))))

(declare-fun dynLambda!89 (Int tuple2!532) Bool)

(assert (=> b!14205 (= res!11050 (dynLambda!89 lambda!140 (h!981 lt!3582)))))

(declare-fun b!14206 () Bool)

(assert (=> b!14206 (= e!8486 (forall!94 (t!2815 lt!3582) lambda!140))))

(assert (= (and d!2121 (not res!11049)) b!14205))

(assert (= (and b!14205 res!11050) b!14206))

(declare-fun b_lambda!891 () Bool)

(assert (=> (not b_lambda!891) (not b!14205)))

(declare-fun m!9455 () Bool)

(assert (=> b!14205 m!9455))

(declare-fun m!9457 () Bool)

(assert (=> b!14206 m!9457))

(assert (=> b!14132 d!2121))

(declare-fun d!2123 () Bool)

(declare-fun res!11061 () Bool)

(declare-fun e!8501 () Bool)

(assert (=> d!2123 (=> res!11061 e!8501)))

(assert (=> d!2123 (= res!11061 (or (is-Nil!416 lt!3582) (is-Nil!416 (t!2815 lt!3582))))))

(assert (=> d!2123 (= (isStrictlySorted!104 lt!3582) e!8501)))

(declare-fun b!14229 () Bool)

(declare-fun e!8502 () Bool)

(assert (=> b!14229 (= e!8501 e!8502)))

(declare-fun res!11062 () Bool)

(assert (=> b!14229 (=> (not res!11062) (not e!8502))))

(assert (=> b!14229 (= res!11062 (bvslt (_1!266 (h!981 lt!3582)) (_1!266 (h!981 (t!2815 lt!3582)))))))

(declare-fun b!14230 () Bool)

(assert (=> b!14230 (= e!8502 (isStrictlySorted!104 (t!2815 lt!3582)))))

(assert (= (and d!2123 (not res!11061)) b!14229))

(assert (= (and b!14229 res!11062) b!14230))

(declare-fun m!9493 () Bool)

(assert (=> b!14230 m!9493))

(assert (=> b!14131 d!2123))

(declare-fun d!2133 () Bool)

(assert (=> d!2133 (= ($colon$colon!20 (filterByValue!15 (t!2815 l!522) value!159) (h!981 l!522)) (Cons!415 (h!981 l!522) (filterByValue!15 (t!2815 l!522) value!159)))))

(assert (=> b!14131 d!2133))

(declare-fun bs!559 () Bool)

(declare-fun b!14263 () Bool)

(assert (= bs!559 (and b!14263 b!14132)))

(declare-fun lambda!149 () Int)

(assert (=> bs!559 (= lambda!149 lambda!140)))

(assert (=> b!14263 true))

(declare-fun b!14261 () Bool)

(declare-fun e!8521 () Bool)

(declare-fun e!8523 () Bool)

(assert (=> b!14261 (= e!8521 e!8523)))

(declare-fun res!11073 () Bool)

(declare-fun call!410 () Bool)

(assert (=> b!14261 (= res!11073 call!410)))

(assert (=> b!14261 (=> res!11073 e!8523)))

(declare-fun bm!406 () Bool)

(declare-fun call!409 () List!419)

(assert (=> bm!406 (= call!409 (filterByValue!15 (t!2815 (t!2815 l!522)) value!159))))

(declare-fun b!14262 () Bool)

(declare-fun lt!3591 () List!419)

(assert (=> b!14262 (= e!8523 (bvsge (_1!266 (head!788 lt!3591)) (_1!266 (head!788 (t!2815 l!522)))))))

(declare-fun res!11071 () Bool)

(declare-fun e!8524 () Bool)

(assert (=> b!14263 (=> (not res!11071) (not e!8524))))

(assert (=> b!14263 (= res!11071 (forall!94 lt!3591 lambda!149))))

(declare-fun b!14264 () Bool)

(assert (=> b!14264 (= e!8524 e!8521)))

(declare-fun c!1321 () Bool)

(assert (=> b!14264 (= c!1321 (isEmpty!101 (t!2815 l!522)))))

(declare-fun b!14265 () Bool)

(declare-fun e!8525 () List!419)

(declare-fun e!8522 () List!419)

(assert (=> b!14265 (= e!8525 e!8522)))

(declare-fun c!1323 () Bool)

(assert (=> b!14265 (= c!1323 (and (is-Cons!415 (t!2815 l!522)) (not (= (_2!266 (h!981 (t!2815 l!522))) value!159))))))

(declare-fun b!14266 () Bool)

(assert (=> b!14266 (= e!8522 call!409)))

(declare-fun b!14267 () Bool)

(assert (=> b!14267 (= e!8525 ($colon$colon!20 call!409 (h!981 (t!2815 l!522))))))

(declare-fun b!14268 () Bool)

(assert (=> b!14268 (= e!8522 Nil!416)))

(declare-fun d!2143 () Bool)

(assert (=> d!2143 e!8524))

(declare-fun res!11072 () Bool)

(assert (=> d!2143 (=> (not res!11072) (not e!8524))))

(assert (=> d!2143 (= res!11072 (isStrictlySorted!104 lt!3591))))

(assert (=> d!2143 (= lt!3591 e!8525)))

(declare-fun c!1322 () Bool)

(assert (=> d!2143 (= c!1322 (and (is-Cons!415 (t!2815 l!522)) (= (_2!266 (h!981 (t!2815 l!522))) value!159)))))

(assert (=> d!2143 (isStrictlySorted!104 (t!2815 l!522))))

(assert (=> d!2143 (= (filterByValue!15 (t!2815 l!522) value!159) lt!3591)))

(declare-fun b!14269 () Bool)

(assert (=> b!14269 (= e!8521 call!410)))

(declare-fun bm!407 () Bool)

(assert (=> bm!407 (= call!410 (isEmpty!101 lt!3591))))

(assert (= (and d!2143 c!1322) b!14267))

(assert (= (and d!2143 (not c!1322)) b!14265))

(assert (= (and b!14265 c!1323) b!14266))

(assert (= (and b!14265 (not c!1323)) b!14268))

(assert (= (or b!14267 b!14266) bm!406))

(assert (= (and d!2143 res!11072) b!14263))

(assert (= (and b!14263 res!11071) b!14264))

(assert (= (and b!14264 c!1321) b!14269))

(assert (= (and b!14264 (not c!1321)) b!14261))

(assert (= (and b!14261 (not res!11073)) b!14262))

(assert (= (or b!14269 b!14261) bm!407))

(declare-fun m!9495 () Bool)

(assert (=> bm!407 m!9495))

(declare-fun m!9497 () Bool)

(assert (=> b!14262 m!9497))

(declare-fun m!9499 () Bool)

(assert (=> b!14262 m!9499))

(declare-fun m!9501 () Bool)

(assert (=> b!14264 m!9501))

(declare-fun m!9503 () Bool)

(assert (=> b!14267 m!9503))

(declare-fun m!9505 () Bool)

(assert (=> bm!406 m!9505))

(declare-fun m!9507 () Bool)

(assert (=> d!2143 m!9507))

(declare-fun m!9509 () Bool)

(assert (=> d!2143 m!9509))

(declare-fun m!9511 () Bool)

(assert (=> b!14263 m!9511))

(assert (=> b!14131 d!2143))

(declare-fun d!2147 () Bool)

(declare-fun res!11074 () Bool)

(declare-fun e!8526 () Bool)

(assert (=> d!2147 (=> res!11074 e!8526)))

(assert (=> d!2147 (= res!11074 (or (is-Nil!416 l!522) (is-Nil!416 (t!2815 l!522))))))

(assert (=> d!2147 (= (isStrictlySorted!104 l!522) e!8526)))

(declare-fun b!14270 () Bool)

(declare-fun e!8527 () Bool)

(assert (=> b!14270 (= e!8526 e!8527)))

(declare-fun res!11075 () Bool)

(assert (=> b!14270 (=> (not res!11075) (not e!8527))))

(assert (=> b!14270 (= res!11075 (bvslt (_1!266 (h!981 l!522)) (_1!266 (h!981 (t!2815 l!522)))))))

(declare-fun b!14271 () Bool)

(assert (=> b!14271 (= e!8527 (isStrictlySorted!104 (t!2815 l!522)))))

(assert (= (and d!2147 (not res!11074)) b!14270))

(assert (= (and b!14270 res!11075) b!14271))

(assert (=> b!14271 m!9509))

(assert (=> start!2092 d!2147))

(declare-fun d!2149 () Bool)

(assert (=> d!2149 (= (head!788 lt!3582) (h!981 lt!3582))))

(assert (=> b!14135 d!2149))

(declare-fun d!2151 () Bool)

(assert (=> d!2151 (= (head!788 l!522) (h!981 l!522))))

(assert (=> b!14135 d!2151))

(declare-fun d!2153 () Bool)

(assert (=> d!2153 (= (isEmpty!101 l!522) (is-Nil!416 l!522))))

(assert (=> b!14130 d!2153))

(declare-fun b!14276 () Bool)

(declare-fun e!8530 () Bool)

(declare-fun tp!2318 () Bool)

(assert (=> b!14276 (= e!8530 (and tp_is_empty!719 tp!2318))))

(assert (=> b!14129 (= tp!2309 e!8530)))

(assert (= (and b!14129 (is-Cons!415 (t!2815 l!522))) b!14276))

(declare-fun b_lambda!897 () Bool)

(assert (= b_lambda!891 (or b!14132 b_lambda!897)))

(declare-fun bs!560 () Bool)

(declare-fun d!2155 () Bool)

(assert (= bs!560 (and d!2155 b!14132)))

(assert (=> bs!560 (= (dynLambda!89 lambda!140 (h!981 lt!3582)) (= (_2!266 (h!981 lt!3582)) value!159))))

(assert (=> b!14205 d!2155))

(push 1)

(assert (not b!14264))

(assert (not b!14271))

(assert (not b!14262))

(assert (not b!14263))

(assert (not b!14267))

(assert (not b!14230))

(assert (not bm!406))

(assert (not bm!407))

(assert tp_is_empty!719)

(assert (not b!14276))

(assert (not d!2143))

(assert (not b_lambda!897))

(assert (not b!14206))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2183 () Bool)

(assert (=> d!2183 (= (head!788 lt!3591) (h!981 lt!3591))))

(assert (=> b!14262 d!2183))

(declare-fun d!2185 () Bool)

(assert (=> d!2185 (= (head!788 (t!2815 l!522)) (h!981 (t!2815 l!522)))))

(assert (=> b!14262 d!2185))

(declare-fun d!2187 () Bool)

(declare-fun res!11089 () Bool)

(declare-fun e!8547 () Bool)

(assert (=> d!2187 (=> res!11089 e!8547)))

(assert (=> d!2187 (= res!11089 (is-Nil!416 lt!3591))))

(assert (=> d!2187 (= (forall!94 lt!3591 lambda!149) e!8547)))

(declare-fun b!14297 () Bool)

(declare-fun e!8548 () Bool)

(assert (=> b!14297 (= e!8547 e!8548)))

(declare-fun res!11090 () Bool)

(assert (=> b!14297 (=> (not res!11090) (not e!8548))))

(assert (=> b!14297 (= res!11090 (dynLambda!89 lambda!149 (h!981 lt!3591)))))

(declare-fun b!14298 () Bool)

(assert (=> b!14298 (= e!8548 (forall!94 (t!2815 lt!3591) lambda!149))))

(assert (= (and d!2187 (not res!11089)) b!14297))

(assert (= (and b!14297 res!11090) b!14298))

(declare-fun b_lambda!907 () Bool)

(assert (=> (not b_lambda!907) (not b!14297)))

(declare-fun m!9543 () Bool)

(assert (=> b!14297 m!9543))

(declare-fun m!9545 () Bool)

(assert (=> b!14298 m!9545))

(assert (=> b!14263 d!2187))

(declare-fun d!2189 () Bool)

(declare-fun res!11091 () Bool)

(declare-fun e!8549 () Bool)

(assert (=> d!2189 (=> res!11091 e!8549)))

(assert (=> d!2189 (= res!11091 (is-Nil!416 (t!2815 lt!3582)))))

(assert (=> d!2189 (= (forall!94 (t!2815 lt!3582) lambda!140) e!8549)))

(declare-fun b!14299 () Bool)

(declare-fun e!8550 () Bool)

(assert (=> b!14299 (= e!8549 e!8550)))

(declare-fun res!11092 () Bool)

(assert (=> b!14299 (=> (not res!11092) (not e!8550))))

(assert (=> b!14299 (= res!11092 (dynLambda!89 lambda!140 (h!981 (t!2815 lt!3582))))))

(declare-fun b!14300 () Bool)

(assert (=> b!14300 (= e!8550 (forall!94 (t!2815 (t!2815 lt!3582)) lambda!140))))

(assert (= (and d!2189 (not res!11091)) b!14299))

(assert (= (and b!14299 res!11092) b!14300))

(declare-fun b_lambda!909 () Bool)

(assert (=> (not b_lambda!909) (not b!14299)))

(declare-fun m!9547 () Bool)

(assert (=> b!14299 m!9547))

(declare-fun m!9549 () Bool)

(assert (=> b!14300 m!9549))

(assert (=> b!14206 d!2189))

(declare-fun bs!565 () Bool)

(declare-fun b!14303 () Bool)

(assert (= bs!565 (and b!14303 b!14132)))

(declare-fun lambda!151 () Int)

(assert (=> bs!565 (= lambda!151 lambda!140)))

(declare-fun bs!566 () Bool)

(assert (= bs!566 (and b!14303 b!14263)))

(assert (=> bs!566 (= lambda!151 lambda!149)))

(assert (=> b!14303 true))

(declare-fun b!14301 () Bool)

(declare-fun e!8551 () Bool)

(declare-fun e!8553 () Bool)

(assert (=> b!14301 (= e!8551 e!8553)))

(declare-fun res!11095 () Bool)

(declare-fun call!414 () Bool)

(assert (=> b!14301 (= res!11095 call!414)))

(assert (=> b!14301 (=> res!11095 e!8553)))

(declare-fun bm!410 () Bool)

(declare-fun call!413 () List!419)

(assert (=> bm!410 (= call!413 (filterByValue!15 (t!2815 (t!2815 (t!2815 l!522))) value!159))))

(declare-fun b!14302 () Bool)

(declare-fun lt!3593 () List!419)

(assert (=> b!14302 (= e!8553 (bvsge (_1!266 (head!788 lt!3593)) (_1!266 (head!788 (t!2815 (t!2815 l!522))))))))

(declare-fun res!11093 () Bool)

(declare-fun e!8554 () Bool)

(assert (=> b!14303 (=> (not res!11093) (not e!8554))))

(assert (=> b!14303 (= res!11093 (forall!94 lt!3593 lambda!151))))

(declare-fun b!14304 () Bool)

(assert (=> b!14304 (= e!8554 e!8551)))

(declare-fun c!1327 () Bool)

(assert (=> b!14304 (= c!1327 (isEmpty!101 (t!2815 (t!2815 l!522))))))

(declare-fun b!14305 () Bool)

(declare-fun e!8555 () List!419)

(declare-fun e!8552 () List!419)

(assert (=> b!14305 (= e!8555 e!8552)))

(declare-fun c!1329 () Bool)

(assert (=> b!14305 (= c!1329 (and (is-Cons!415 (t!2815 (t!2815 l!522))) (not (= (_2!266 (h!981 (t!2815 (t!2815 l!522)))) value!159))))))

(declare-fun b!14306 () Bool)

(assert (=> b!14306 (= e!8552 call!413)))

(declare-fun b!14307 () Bool)

(assert (=> b!14307 (= e!8555 ($colon$colon!20 call!413 (h!981 (t!2815 (t!2815 l!522)))))))

(declare-fun b!14308 () Bool)

(assert (=> b!14308 (= e!8552 Nil!416)))

(declare-fun d!2191 () Bool)

(assert (=> d!2191 e!8554))

(declare-fun res!11094 () Bool)

(assert (=> d!2191 (=> (not res!11094) (not e!8554))))

(assert (=> d!2191 (= res!11094 (isStrictlySorted!104 lt!3593))))

(assert (=> d!2191 (= lt!3593 e!8555)))

(declare-fun c!1328 () Bool)

(assert (=> d!2191 (= c!1328 (and (is-Cons!415 (t!2815 (t!2815 l!522))) (= (_2!266 (h!981 (t!2815 (t!2815 l!522)))) value!159)))))

(assert (=> d!2191 (isStrictlySorted!104 (t!2815 (t!2815 l!522)))))

(assert (=> d!2191 (= (filterByValue!15 (t!2815 (t!2815 l!522)) value!159) lt!3593)))

(declare-fun b!14309 () Bool)

(assert (=> b!14309 (= e!8551 call!414)))

(declare-fun bm!411 () Bool)

(assert (=> bm!411 (= call!414 (isEmpty!101 lt!3593))))

(assert (= (and d!2191 c!1328) b!14307))

(assert (= (and d!2191 (not c!1328)) b!14305))

(assert (= (and b!14305 c!1329) b!14306))

(assert (= (and b!14305 (not c!1329)) b!14308))

(assert (= (or b!14307 b!14306) bm!410))

(assert (= (and d!2191 res!11094) b!14303))

(assert (= (and b!14303 res!11093) b!14304))

(assert (= (and b!14304 c!1327) b!14309))

(assert (= (and b!14304 (not c!1327)) b!14301))

(assert (= (and b!14301 (not res!11095)) b!14302))

(assert (= (or b!14309 b!14301) bm!411))

(declare-fun m!9551 () Bool)

(assert (=> bm!411 m!9551))

(declare-fun m!9553 () Bool)

(assert (=> b!14302 m!9553))

(declare-fun m!9555 () Bool)

(assert (=> b!14302 m!9555))

(declare-fun m!9557 () Bool)

(assert (=> b!14304 m!9557))

(declare-fun m!9559 () Bool)

(assert (=> b!14307 m!9559))

(declare-fun m!9561 () Bool)

(assert (=> bm!410 m!9561))

(declare-fun m!9563 () Bool)

(assert (=> d!2191 m!9563))

(declare-fun m!9565 () Bool)

(assert (=> d!2191 m!9565))

(declare-fun m!9567 () Bool)

(assert (=> b!14303 m!9567))

(assert (=> bm!406 d!2191))

(declare-fun d!2193 () Bool)

(declare-fun res!11096 () Bool)

(declare-fun e!8556 () Bool)

(assert (=> d!2193 (=> res!11096 e!8556)))

(assert (=> d!2193 (= res!11096 (or (is-Nil!416 (t!2815 l!522)) (is-Nil!416 (t!2815 (t!2815 l!522)))))))

(assert (=> d!2193 (= (isStrictlySorted!104 (t!2815 l!522)) e!8556)))

(declare-fun b!14310 () Bool)

(declare-fun e!8557 () Bool)

(assert (=> b!14310 (= e!8556 e!8557)))

(declare-fun res!11097 () Bool)

(assert (=> b!14310 (=> (not res!11097) (not e!8557))))

(assert (=> b!14310 (= res!11097 (bvslt (_1!266 (h!981 (t!2815 l!522))) (_1!266 (h!981 (t!2815 (t!2815 l!522))))))))

(declare-fun b!14311 () Bool)

(assert (=> b!14311 (= e!8557 (isStrictlySorted!104 (t!2815 (t!2815 l!522))))))

(assert (= (and d!2193 (not res!11096)) b!14310))

(assert (= (and b!14310 res!11097) b!14311))

(assert (=> b!14311 m!9565))

(assert (=> b!14271 d!2193))

(declare-fun d!2195 () Bool)

(assert (=> d!2195 (= ($colon$colon!20 call!409 (h!981 (t!2815 l!522))) (Cons!415 (h!981 (t!2815 l!522)) call!409))))

(assert (=> b!14267 d!2195))

(declare-fun d!2197 () Bool)

(declare-fun res!11098 () Bool)

(declare-fun e!8558 () Bool)

(assert (=> d!2197 (=> res!11098 e!8558)))

(assert (=> d!2197 (= res!11098 (or (is-Nil!416 lt!3591) (is-Nil!416 (t!2815 lt!3591))))))

(assert (=> d!2197 (= (isStrictlySorted!104 lt!3591) e!8558)))

(declare-fun b!14312 () Bool)

(declare-fun e!8559 () Bool)

(assert (=> b!14312 (= e!8558 e!8559)))

(declare-fun res!11099 () Bool)

(assert (=> b!14312 (=> (not res!11099) (not e!8559))))

(assert (=> b!14312 (= res!11099 (bvslt (_1!266 (h!981 lt!3591)) (_1!266 (h!981 (t!2815 lt!3591)))))))

(declare-fun b!14313 () Bool)

(assert (=> b!14313 (= e!8559 (isStrictlySorted!104 (t!2815 lt!3591)))))

(assert (= (and d!2197 (not res!11098)) b!14312))

(assert (= (and b!14312 res!11099) b!14313))

(declare-fun m!9569 () Bool)

(assert (=> b!14313 m!9569))

(assert (=> d!2143 d!2197))

(assert (=> d!2143 d!2193))

(declare-fun d!2199 () Bool)

(assert (=> d!2199 (= (isEmpty!101 lt!3591) (is-Nil!416 lt!3591))))

(assert (=> bm!407 d!2199))

(declare-fun d!2201 () Bool)

(declare-fun res!11100 () Bool)

(declare-fun e!8560 () Bool)

(assert (=> d!2201 (=> res!11100 e!8560)))

(assert (=> d!2201 (= res!11100 (or (is-Nil!416 (t!2815 lt!3582)) (is-Nil!416 (t!2815 (t!2815 lt!3582)))))))

(assert (=> d!2201 (= (isStrictlySorted!104 (t!2815 lt!3582)) e!8560)))

(declare-fun b!14314 () Bool)

(declare-fun e!8561 () Bool)

(assert (=> b!14314 (= e!8560 e!8561)))

(declare-fun res!11101 () Bool)

(assert (=> b!14314 (=> (not res!11101) (not e!8561))))

(assert (=> b!14314 (= res!11101 (bvslt (_1!266 (h!981 (t!2815 lt!3582))) (_1!266 (h!981 (t!2815 (t!2815 lt!3582))))))))

(declare-fun b!14315 () Bool)

(assert (=> b!14315 (= e!8561 (isStrictlySorted!104 (t!2815 (t!2815 lt!3582))))))

(assert (= (and d!2201 (not res!11100)) b!14314))

(assert (= (and b!14314 res!11101) b!14315))

(declare-fun m!9571 () Bool)

(assert (=> b!14315 m!9571))

(assert (=> b!14230 d!2201))

(declare-fun d!2203 () Bool)

(assert (=> d!2203 (= (isEmpty!101 (t!2815 l!522)) (is-Nil!416 (t!2815 l!522)))))

(assert (=> b!14264 d!2203))

(declare-fun b!14316 () Bool)

(declare-fun e!8562 () Bool)

(declare-fun tp!2320 () Bool)

(assert (=> b!14316 (= e!8562 (and tp_is_empty!719 tp!2320))))

(assert (=> b!14276 (= tp!2318 e!8562)))

(assert (= (and b!14276 (is-Cons!415 (t!2815 (t!2815 l!522)))) b!14316))

(declare-fun b_lambda!911 () Bool)

(assert (= b_lambda!909 (or b!14132 b_lambda!911)))

(declare-fun bs!567 () Bool)

(declare-fun d!2205 () Bool)

(assert (= bs!567 (and d!2205 b!14132)))

(assert (=> bs!567 (= (dynLambda!89 lambda!140 (h!981 (t!2815 lt!3582))) (= (_2!266 (h!981 (t!2815 lt!3582))) value!159))))

(assert (=> b!14299 d!2205))

(declare-fun b_lambda!913 () Bool)

(assert (= b_lambda!907 (or b!14263 b_lambda!913)))

(declare-fun bs!568 () Bool)

(declare-fun d!2207 () Bool)

(assert (= bs!568 (and d!2207 b!14263)))

(assert (=> bs!568 (= (dynLambda!89 lambda!149 (h!981 lt!3591)) (= (_2!266 (h!981 lt!3591)) value!159))))

(assert (=> b!14297 d!2207))

(push 1)

(assert (not b!14300))

(assert (not bm!411))

(assert tp_is_empty!719)

(assert (not b!14298))

(assert (not b_lambda!897))

(assert (not b!14313))

(assert (not b!14315))

(assert (not b_lambda!913))

(assert (not b!14302))

(assert (not b!14316))

(assert (not b!14311))

(assert (not b!14304))

(assert (not b_lambda!911))

(assert (not b!14303))

(assert (not bm!410))

(assert (not b!14307))

(assert (not d!2191))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

