; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75206 () Bool)

(assert start!75206)

(declare-fun b!886030 () Bool)

(declare-fun res!601613 () Bool)

(declare-fun e!493166 () Bool)

(assert (=> b!886030 (=> (not res!601613) (not e!493166))))

(declare-datatypes ((B!1302 0))(
  ( (B!1303 (val!8957 Int)) )
))
(declare-datatypes ((tuple2!11908 0))(
  ( (tuple2!11909 (_1!5965 (_ BitVec 64)) (_2!5965 B!1302)) )
))
(declare-datatypes ((List!17673 0))(
  ( (Nil!17670) (Cons!17669 (h!18800 tuple2!11908) (t!24950 List!17673)) )
))
(declare-fun l!906 () List!17673)

(declare-fun key1!49 () (_ BitVec 64))

(assert (=> b!886030 (= res!601613 (and (is-Cons!17669 l!906) (bvslt (_1!5965 (h!18800 l!906)) key1!49)))))

(declare-fun b!886033 () Bool)

(declare-fun e!493167 () Bool)

(declare-fun tp_is_empty!17813 () Bool)

(declare-fun tp!54371 () Bool)

(assert (=> b!886033 (= e!493167 (and tp_is_empty!17813 tp!54371))))

(declare-fun b!886031 () Bool)

(declare-fun res!601614 () Bool)

(assert (=> b!886031 (=> (not res!601614) (not e!493166))))

(declare-fun isStrictlySorted!491 (List!17673) Bool)

(assert (=> b!886031 (= res!601614 (isStrictlySorted!491 (t!24950 l!906)))))

(declare-fun v2!16 () B!1302)

(declare-fun b!886032 () Bool)

(declare-fun v1!38 () B!1302)

(declare-fun insertStrictlySorted!299 (List!17673 (_ BitVec 64) B!1302) List!17673)

(assert (=> b!886032 (= e!493166 (not (= (insertStrictlySorted!299 (insertStrictlySorted!299 l!906 key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!299 l!906 key1!49 v2!16))))))

(assert (=> b!886032 (= (insertStrictlySorted!299 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!299 (t!24950 l!906) key1!49 v2!16))))

(declare-datatypes ((Unit!30244 0))(
  ( (Unit!30245) )
))
(declare-fun lt!401074 () Unit!30244)

(declare-fun lemmaInsertStrictlySortedErasesIfSameKey!15 (List!17673 (_ BitVec 64) B!1302 B!1302) Unit!30244)

(assert (=> b!886032 (= lt!401074 (lemmaInsertStrictlySortedErasesIfSameKey!15 (t!24950 l!906) key1!49 v1!38 v2!16))))

(declare-fun res!601615 () Bool)

(assert (=> start!75206 (=> (not res!601615) (not e!493166))))

(assert (=> start!75206 (= res!601615 (isStrictlySorted!491 l!906))))

(assert (=> start!75206 e!493166))

(assert (=> start!75206 e!493167))

(assert (=> start!75206 true))

(assert (=> start!75206 tp_is_empty!17813))

(assert (= (and start!75206 res!601615) b!886030))

(assert (= (and b!886030 res!601613) b!886031))

(assert (= (and b!886031 res!601614) b!886032))

(assert (= (and start!75206 (is-Cons!17669 l!906)) b!886033))

(declare-fun m!825955 () Bool)

(assert (=> b!886031 m!825955))

(declare-fun m!825957 () Bool)

(assert (=> b!886032 m!825957))

(declare-fun m!825959 () Bool)

(assert (=> b!886032 m!825959))

(declare-fun m!825961 () Bool)

(assert (=> b!886032 m!825961))

(declare-fun m!825963 () Bool)

(assert (=> b!886032 m!825963))

(declare-fun m!825965 () Bool)

(assert (=> b!886032 m!825965))

(assert (=> b!886032 m!825963))

(declare-fun m!825967 () Bool)

(assert (=> b!886032 m!825967))

(assert (=> b!886032 m!825957))

(declare-fun m!825969 () Bool)

(assert (=> b!886032 m!825969))

(declare-fun m!825971 () Bool)

(assert (=> start!75206 m!825971))

(push 1)

(assert (not b!886031))

(assert (not b!886032))

(assert tp_is_empty!17813)

(assert (not b!886033))

(assert (not start!75206))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!109507 () Bool)

(declare-fun res!601628 () Bool)

(declare-fun e!493180 () Bool)

(assert (=> d!109507 (=> res!601628 e!493180)))

(assert (=> d!109507 (= res!601628 (or (is-Nil!17670 l!906) (is-Nil!17670 (t!24950 l!906))))))

(assert (=> d!109507 (= (isStrictlySorted!491 l!906) e!493180)))

(declare-fun b!886046 () Bool)

(declare-fun e!493181 () Bool)

(assert (=> b!886046 (= e!493180 e!493181)))

(declare-fun res!601629 () Bool)

(assert (=> b!886046 (=> (not res!601629) (not e!493181))))

(assert (=> b!886046 (= res!601629 (bvslt (_1!5965 (h!18800 l!906)) (_1!5965 (h!18800 (t!24950 l!906)))))))

(declare-fun b!886047 () Bool)

(assert (=> b!886047 (= e!493181 (isStrictlySorted!491 (t!24950 l!906)))))

(assert (= (and d!109507 (not res!601628)) b!886046))

(assert (= (and b!886046 res!601629) b!886047))

(assert (=> b!886047 m!825955))

(assert (=> start!75206 d!109507))

(declare-fun d!109511 () Bool)

(declare-fun res!601630 () Bool)

(declare-fun e!493182 () Bool)

(assert (=> d!109511 (=> res!601630 e!493182)))

(assert (=> d!109511 (= res!601630 (or (is-Nil!17670 (t!24950 l!906)) (is-Nil!17670 (t!24950 (t!24950 l!906)))))))

(assert (=> d!109511 (= (isStrictlySorted!491 (t!24950 l!906)) e!493182)))

(declare-fun b!886048 () Bool)

(declare-fun e!493183 () Bool)

(assert (=> b!886048 (= e!493182 e!493183)))

(declare-fun res!601631 () Bool)

(assert (=> b!886048 (=> (not res!601631) (not e!493183))))

(assert (=> b!886048 (= res!601631 (bvslt (_1!5965 (h!18800 (t!24950 l!906))) (_1!5965 (h!18800 (t!24950 (t!24950 l!906))))))))

(declare-fun b!886049 () Bool)

(assert (=> b!886049 (= e!493183 (isStrictlySorted!491 (t!24950 (t!24950 l!906))))))

(assert (= (and d!109511 (not res!601630)) b!886048))

(assert (= (and b!886048 res!601631) b!886049))

(declare-fun m!825979 () Bool)

(assert (=> b!886049 m!825979))

(assert (=> b!886031 d!109511))

(declare-fun d!109513 () Bool)

(assert (=> d!109513 (= (insertStrictlySorted!299 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!299 (t!24950 l!906) key1!49 v2!16))))

(declare-fun lt!401083 () Unit!30244)

(declare-fun choose!1452 (List!17673 (_ BitVec 64) B!1302 B!1302) Unit!30244)

(assert (=> d!109513 (= lt!401083 (choose!1452 (t!24950 l!906) key1!49 v1!38 v2!16))))

(assert (=> d!109513 (isStrictlySorted!491 (t!24950 l!906))))

(assert (=> d!109513 (= (lemmaInsertStrictlySortedErasesIfSameKey!15 (t!24950 l!906) key1!49 v1!38 v2!16) lt!401083)))

(declare-fun bs!24851 () Bool)

(assert (= bs!24851 d!109513))

(assert (=> bs!24851 m!825957))

(assert (=> bs!24851 m!825955))

(assert (=> bs!24851 m!825967))

(assert (=> bs!24851 m!825957))

(assert (=> bs!24851 m!825959))

(declare-fun m!825981 () Bool)

(assert (=> bs!24851 m!825981))

(assert (=> b!886032 d!109513))

(declare-fun b!886241 () Bool)

(declare-fun e!493286 () List!17673)

(declare-fun call!39204 () List!17673)

(assert (=> b!886241 (= e!493286 call!39204)))

(declare-fun b!886242 () Bool)

(declare-fun e!493287 () List!17673)

(assert (=> b!886242 (= e!493286 e!493287)))

(declare-fun c!93449 () Bool)

(assert (=> b!886242 (= c!93449 (and (is-Cons!17669 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38)) (= (_1!5965 (h!18800 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38))) key1!49)))))

(declare-fun d!109515 () Bool)

(declare-fun e!493283 () Bool)

(assert (=> d!109515 e!493283))

(declare-fun res!601675 () Bool)

(assert (=> d!109515 (=> (not res!601675) (not e!493283))))

(declare-fun lt!401102 () List!17673)

(assert (=> d!109515 (= res!601675 (isStrictlySorted!491 lt!401102))))

(assert (=> d!109515 (= lt!401102 e!493286)))

(declare-fun c!93447 () Bool)

(assert (=> d!109515 (= c!93447 (and (is-Cons!17669 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38)) (bvslt (_1!5965 (h!18800 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38))) key1!49)))))

(assert (=> d!109515 (isStrictlySorted!491 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38))))

(assert (=> d!109515 (= (insertStrictlySorted!299 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38) key1!49 v2!16) lt!401102)))

(declare-fun b!886243 () Bool)

(declare-fun contains!4297 (List!17673 tuple2!11908) Bool)

(assert (=> b!886243 (= e!493283 (contains!4297 lt!401102 (tuple2!11909 key1!49 v2!16)))))

(declare-fun bm!39200 () Bool)

(declare-fun e!493285 () List!17673)

(declare-fun $colon$colon!548 (List!17673 tuple2!11908) List!17673)

(assert (=> bm!39200 (= call!39204 ($colon$colon!548 e!493285 (ite c!93447 (h!18800 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38)) (tuple2!11909 key1!49 v2!16))))))

(declare-fun c!93448 () Bool)

(assert (=> bm!39200 (= c!93448 c!93447)))

(declare-fun b!886244 () Bool)

(assert (=> b!886244 (= e!493285 (insertStrictlySorted!299 (t!24950 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38)) key1!49 v2!16))))

(declare-fun c!93450 () Bool)

(declare-fun b!886245 () Bool)

(assert (=> b!886245 (= c!93450 (and (is-Cons!17669 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38)) (bvsgt (_1!5965 (h!18800 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38))) key1!49)))))

(declare-fun e!493284 () List!17673)

(assert (=> b!886245 (= e!493287 e!493284)))

(declare-fun b!886246 () Bool)

(declare-fun call!39203 () List!17673)

(assert (=> b!886246 (= e!493284 call!39203)))

(declare-fun b!886247 () Bool)

(assert (=> b!886247 (= e!493285 (ite c!93449 (t!24950 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38)) (ite c!93450 (Cons!17669 (h!18800 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38)) (t!24950 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38))) Nil!17670)))))

(declare-fun b!886248 () Bool)

(declare-fun res!601674 () Bool)

(assert (=> b!886248 (=> (not res!601674) (not e!493283))))

(declare-fun containsKey!413 (List!17673 (_ BitVec 64)) Bool)

(assert (=> b!886248 (= res!601674 (containsKey!413 lt!401102 key1!49))))

(declare-fun bm!39201 () Bool)

(declare-fun call!39205 () List!17673)

(assert (=> bm!39201 (= call!39203 call!39205)))

(declare-fun b!886249 () Bool)

(assert (=> b!886249 (= e!493284 call!39203)))

(declare-fun bm!39202 () Bool)

(assert (=> bm!39202 (= call!39205 call!39204)))

(declare-fun b!886250 () Bool)

(assert (=> b!886250 (= e!493287 call!39205)))

(assert (= (and d!109515 c!93447) b!886241))

(assert (= (and d!109515 (not c!93447)) b!886242))

(assert (= (and b!886242 c!93449) b!886250))

(assert (= (and b!886242 (not c!93449)) b!886245))

(assert (= (and b!886245 c!93450) b!886249))

(assert (= (and b!886245 (not c!93450)) b!886246))

(assert (= (or b!886249 b!886246) bm!39201))

(assert (= (or b!886250 bm!39201) bm!39202))

(assert (= (or b!886241 bm!39202) bm!39200))

(assert (= (and bm!39200 c!93448) b!886244))

(assert (= (and bm!39200 (not c!93448)) b!886247))

(assert (= (and d!109515 res!601675) b!886248))

(assert (= (and b!886248 res!601674) b!886243))

(declare-fun m!826105 () Bool)

(assert (=> b!886244 m!826105))

(declare-fun m!826107 () Bool)

(assert (=> b!886243 m!826107))

(declare-fun m!826109 () Bool)

(assert (=> bm!39200 m!826109))

(declare-fun m!826111 () Bool)

(assert (=> d!109515 m!826111))

(assert (=> d!109515 m!825957))

(declare-fun m!826113 () Bool)

(assert (=> d!109515 m!826113))

(declare-fun m!826115 () Bool)

(assert (=> b!886248 m!826115))

(assert (=> b!886032 d!109515))

(declare-fun b!886257 () Bool)

(declare-fun e!493295 () List!17673)

(declare-fun call!39207 () List!17673)

(assert (=> b!886257 (= e!493295 call!39207)))

(declare-fun b!886258 () Bool)

(declare-fun e!493296 () List!17673)

(assert (=> b!886258 (= e!493295 e!493296)))

(declare-fun c!93453 () Bool)

(assert (=> b!886258 (= c!93453 (and (is-Cons!17669 (insertStrictlySorted!299 l!906 key1!49 v1!38)) (= (_1!5965 (h!18800 (insertStrictlySorted!299 l!906 key1!49 v1!38))) key1!49)))))

(declare-fun d!109541 () Bool)

(declare-fun e!493292 () Bool)

(assert (=> d!109541 e!493292))

(declare-fun res!601679 () Bool)

(assert (=> d!109541 (=> (not res!601679) (not e!493292))))

(declare-fun lt!401103 () List!17673)

(assert (=> d!109541 (= res!601679 (isStrictlySorted!491 lt!401103))))

(assert (=> d!109541 (= lt!401103 e!493295)))

(declare-fun c!93451 () Bool)

(assert (=> d!109541 (= c!93451 (and (is-Cons!17669 (insertStrictlySorted!299 l!906 key1!49 v1!38)) (bvslt (_1!5965 (h!18800 (insertStrictlySorted!299 l!906 key1!49 v1!38))) key1!49)))))

(assert (=> d!109541 (isStrictlySorted!491 (insertStrictlySorted!299 l!906 key1!49 v1!38))))

(assert (=> d!109541 (= (insertStrictlySorted!299 (insertStrictlySorted!299 l!906 key1!49 v1!38) key1!49 v2!16) lt!401103)))

(declare-fun b!886259 () Bool)

(assert (=> b!886259 (= e!493292 (contains!4297 lt!401103 (tuple2!11909 key1!49 v2!16)))))

(declare-fun e!493294 () List!17673)

(declare-fun bm!39203 () Bool)

(assert (=> bm!39203 (= call!39207 ($colon$colon!548 e!493294 (ite c!93451 (h!18800 (insertStrictlySorted!299 l!906 key1!49 v1!38)) (tuple2!11909 key1!49 v2!16))))))

(declare-fun c!93452 () Bool)

(assert (=> bm!39203 (= c!93452 c!93451)))

(declare-fun b!886260 () Bool)

(assert (=> b!886260 (= e!493294 (insertStrictlySorted!299 (t!24950 (insertStrictlySorted!299 l!906 key1!49 v1!38)) key1!49 v2!16))))

(declare-fun b!886261 () Bool)

(declare-fun c!93454 () Bool)

(assert (=> b!886261 (= c!93454 (and (is-Cons!17669 (insertStrictlySorted!299 l!906 key1!49 v1!38)) (bvsgt (_1!5965 (h!18800 (insertStrictlySorted!299 l!906 key1!49 v1!38))) key1!49)))))

(declare-fun e!493293 () List!17673)

(assert (=> b!886261 (= e!493296 e!493293)))

(declare-fun b!886262 () Bool)

(declare-fun call!39206 () List!17673)

(assert (=> b!886262 (= e!493293 call!39206)))

(declare-fun b!886263 () Bool)

(assert (=> b!886263 (= e!493294 (ite c!93453 (t!24950 (insertStrictlySorted!299 l!906 key1!49 v1!38)) (ite c!93454 (Cons!17669 (h!18800 (insertStrictlySorted!299 l!906 key1!49 v1!38)) (t!24950 (insertStrictlySorted!299 l!906 key1!49 v1!38))) Nil!17670)))))

(declare-fun b!886264 () Bool)

(declare-fun res!601678 () Bool)

(assert (=> b!886264 (=> (not res!601678) (not e!493292))))

(assert (=> b!886264 (= res!601678 (containsKey!413 lt!401103 key1!49))))

(declare-fun bm!39204 () Bool)

(declare-fun call!39208 () List!17673)

(assert (=> bm!39204 (= call!39206 call!39208)))

(declare-fun b!886265 () Bool)

(assert (=> b!886265 (= e!493293 call!39206)))

(declare-fun bm!39205 () Bool)

(assert (=> bm!39205 (= call!39208 call!39207)))

(declare-fun b!886266 () Bool)

(assert (=> b!886266 (= e!493296 call!39208)))

(assert (= (and d!109541 c!93451) b!886257))

(assert (= (and d!109541 (not c!93451)) b!886258))

(assert (= (and b!886258 c!93453) b!886266))

(assert (= (and b!886258 (not c!93453)) b!886261))

(assert (= (and b!886261 c!93454) b!886265))

(assert (= (and b!886261 (not c!93454)) b!886262))

(assert (= (or b!886265 b!886262) bm!39204))

(assert (= (or b!886266 bm!39204) bm!39205))

(assert (= (or b!886257 bm!39205) bm!39203))

(assert (= (and bm!39203 c!93452) b!886260))

(assert (= (and bm!39203 (not c!93452)) b!886263))

(assert (= (and d!109541 res!601679) b!886264))

(assert (= (and b!886264 res!601678) b!886259))

(declare-fun m!826117 () Bool)

(assert (=> b!886260 m!826117))

(declare-fun m!826119 () Bool)

(assert (=> b!886259 m!826119))

(declare-fun m!826121 () Bool)

(assert (=> bm!39203 m!826121))

(declare-fun m!826123 () Bool)

(assert (=> d!109541 m!826123))

(assert (=> d!109541 m!825963))

(declare-fun m!826125 () Bool)

(assert (=> d!109541 m!826125))

(declare-fun m!826127 () Bool)

(assert (=> b!886264 m!826127))

(assert (=> b!886032 d!109541))

(declare-fun b!886268 () Bool)

(declare-fun e!493301 () List!17673)

(declare-fun call!39210 () List!17673)

(assert (=> b!886268 (= e!493301 call!39210)))

(declare-fun b!886269 () Bool)

(declare-fun e!493302 () List!17673)

(assert (=> b!886269 (= e!493301 e!493302)))

(declare-fun c!93457 () Bool)

(assert (=> b!886269 (= c!93457 (and (is-Cons!17669 (t!24950 l!906)) (= (_1!5965 (h!18800 (t!24950 l!906))) key1!49)))))

(declare-fun d!109543 () Bool)

(declare-fun e!493298 () Bool)

(assert (=> d!109543 e!493298))

(declare-fun res!601681 () Bool)

(assert (=> d!109543 (=> (not res!601681) (not e!493298))))

(declare-fun lt!401104 () List!17673)

(assert (=> d!109543 (= res!601681 (isStrictlySorted!491 lt!401104))))

(assert (=> d!109543 (= lt!401104 e!493301)))

(declare-fun c!93455 () Bool)

(assert (=> d!109543 (= c!93455 (and (is-Cons!17669 (t!24950 l!906)) (bvslt (_1!5965 (h!18800 (t!24950 l!906))) key1!49)))))

(assert (=> d!109543 (isStrictlySorted!491 (t!24950 l!906))))

(assert (=> d!109543 (= (insertStrictlySorted!299 (t!24950 l!906) key1!49 v2!16) lt!401104)))

(declare-fun b!886270 () Bool)

(assert (=> b!886270 (= e!493298 (contains!4297 lt!401104 (tuple2!11909 key1!49 v2!16)))))

(declare-fun e!493300 () List!17673)

(declare-fun bm!39206 () Bool)

(assert (=> bm!39206 (= call!39210 ($colon$colon!548 e!493300 (ite c!93455 (h!18800 (t!24950 l!906)) (tuple2!11909 key1!49 v2!16))))))

(declare-fun c!93456 () Bool)

(assert (=> bm!39206 (= c!93456 c!93455)))

(declare-fun b!886271 () Bool)

(assert (=> b!886271 (= e!493300 (insertStrictlySorted!299 (t!24950 (t!24950 l!906)) key1!49 v2!16))))

(declare-fun b!886272 () Bool)

(declare-fun c!93458 () Bool)

(assert (=> b!886272 (= c!93458 (and (is-Cons!17669 (t!24950 l!906)) (bvsgt (_1!5965 (h!18800 (t!24950 l!906))) key1!49)))))

(declare-fun e!493299 () List!17673)

(assert (=> b!886272 (= e!493302 e!493299)))

(declare-fun b!886273 () Bool)

(declare-fun call!39209 () List!17673)

(assert (=> b!886273 (= e!493299 call!39209)))

(declare-fun b!886274 () Bool)

(assert (=> b!886274 (= e!493300 (ite c!93457 (t!24950 (t!24950 l!906)) (ite c!93458 (Cons!17669 (h!18800 (t!24950 l!906)) (t!24950 (t!24950 l!906))) Nil!17670)))))

(declare-fun b!886275 () Bool)

(declare-fun res!601680 () Bool)

(assert (=> b!886275 (=> (not res!601680) (not e!493298))))

(assert (=> b!886275 (= res!601680 (containsKey!413 lt!401104 key1!49))))

(declare-fun bm!39207 () Bool)

(declare-fun call!39211 () List!17673)

(assert (=> bm!39207 (= call!39209 call!39211)))

(declare-fun b!886276 () Bool)

(assert (=> b!886276 (= e!493299 call!39209)))

(declare-fun bm!39208 () Bool)

(assert (=> bm!39208 (= call!39211 call!39210)))

(declare-fun b!886277 () Bool)

(assert (=> b!886277 (= e!493302 call!39211)))

(assert (= (and d!109543 c!93455) b!886268))

(assert (= (and d!109543 (not c!93455)) b!886269))

(assert (= (and b!886269 c!93457) b!886277))

(assert (= (and b!886269 (not c!93457)) b!886272))

(assert (= (and b!886272 c!93458) b!886276))

(assert (= (and b!886272 (not c!93458)) b!886273))

(assert (= (or b!886276 b!886273) bm!39207))

(assert (= (or b!886277 bm!39207) bm!39208))

(assert (= (or b!886268 bm!39208) bm!39206))

(assert (= (and bm!39206 c!93456) b!886271))

(assert (= (and bm!39206 (not c!93456)) b!886274))

(assert (= (and d!109543 res!601681) b!886275))

(assert (= (and b!886275 res!601680) b!886270))

(declare-fun m!826129 () Bool)

(assert (=> b!886271 m!826129))

(declare-fun m!826131 () Bool)

(assert (=> b!886270 m!826131))

(declare-fun m!826133 () Bool)

(assert (=> bm!39206 m!826133))

(declare-fun m!826135 () Bool)

(assert (=> d!109543 m!826135))

(assert (=> d!109543 m!825955))

(declare-fun m!826137 () Bool)

(assert (=> b!886275 m!826137))

(assert (=> b!886032 d!109543))

(declare-fun b!886278 () Bool)

(declare-fun e!493306 () List!17673)

(declare-fun call!39213 () List!17673)

(assert (=> b!886278 (= e!493306 call!39213)))

(declare-fun b!886279 () Bool)

(declare-fun e!493307 () List!17673)

(assert (=> b!886279 (= e!493306 e!493307)))

(declare-fun c!93461 () Bool)

(assert (=> b!886279 (= c!93461 (and (is-Cons!17669 (t!24950 l!906)) (= (_1!5965 (h!18800 (t!24950 l!906))) key1!49)))))

(declare-fun d!109545 () Bool)

(declare-fun e!493303 () Bool)

(assert (=> d!109545 e!493303))

(declare-fun res!601683 () Bool)

(assert (=> d!109545 (=> (not res!601683) (not e!493303))))

(declare-fun lt!401105 () List!17673)

(assert (=> d!109545 (= res!601683 (isStrictlySorted!491 lt!401105))))

(assert (=> d!109545 (= lt!401105 e!493306)))

(declare-fun c!93459 () Bool)

(assert (=> d!109545 (= c!93459 (and (is-Cons!17669 (t!24950 l!906)) (bvslt (_1!5965 (h!18800 (t!24950 l!906))) key1!49)))))

(assert (=> d!109545 (isStrictlySorted!491 (t!24950 l!906))))

(assert (=> d!109545 (= (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38) lt!401105)))

(declare-fun b!886280 () Bool)

(assert (=> b!886280 (= e!493303 (contains!4297 lt!401105 (tuple2!11909 key1!49 v1!38)))))

(declare-fun bm!39209 () Bool)

(declare-fun e!493305 () List!17673)

(assert (=> bm!39209 (= call!39213 ($colon$colon!548 e!493305 (ite c!93459 (h!18800 (t!24950 l!906)) (tuple2!11909 key1!49 v1!38))))))

(declare-fun c!93460 () Bool)

(assert (=> bm!39209 (= c!93460 c!93459)))

(declare-fun b!886281 () Bool)

(assert (=> b!886281 (= e!493305 (insertStrictlySorted!299 (t!24950 (t!24950 l!906)) key1!49 v1!38))))

(declare-fun b!886282 () Bool)

(declare-fun c!93462 () Bool)

(assert (=> b!886282 (= c!93462 (and (is-Cons!17669 (t!24950 l!906)) (bvsgt (_1!5965 (h!18800 (t!24950 l!906))) key1!49)))))

(declare-fun e!493304 () List!17673)

(assert (=> b!886282 (= e!493307 e!493304)))

(declare-fun b!886283 () Bool)

(declare-fun call!39212 () List!17673)

(assert (=> b!886283 (= e!493304 call!39212)))

(declare-fun b!886284 () Bool)

(assert (=> b!886284 (= e!493305 (ite c!93461 (t!24950 (t!24950 l!906)) (ite c!93462 (Cons!17669 (h!18800 (t!24950 l!906)) (t!24950 (t!24950 l!906))) Nil!17670)))))

(declare-fun b!886285 () Bool)

(declare-fun res!601682 () Bool)

(assert (=> b!886285 (=> (not res!601682) (not e!493303))))

(assert (=> b!886285 (= res!601682 (containsKey!413 lt!401105 key1!49))))

(declare-fun bm!39210 () Bool)

(declare-fun call!39214 () List!17673)

(assert (=> bm!39210 (= call!39212 call!39214)))

(declare-fun b!886286 () Bool)

(assert (=> b!886286 (= e!493304 call!39212)))

(declare-fun bm!39211 () Bool)

(assert (=> bm!39211 (= call!39214 call!39213)))

(declare-fun b!886287 () Bool)

(assert (=> b!886287 (= e!493307 call!39214)))

(assert (= (and d!109545 c!93459) b!886278))

(assert (= (and d!109545 (not c!93459)) b!886279))

(assert (= (and b!886279 c!93461) b!886287))

(assert (= (and b!886279 (not c!93461)) b!886282))

(assert (= (and b!886282 c!93462) b!886286))

(assert (= (and b!886282 (not c!93462)) b!886283))

(assert (= (or b!886286 b!886283) bm!39210))

(assert (= (or b!886287 bm!39210) bm!39211))

(assert (= (or b!886278 bm!39211) bm!39209))

(assert (= (and bm!39209 c!93460) b!886281))

(assert (= (and bm!39209 (not c!93460)) b!886284))

(assert (= (and d!109545 res!601683) b!886285))

(assert (= (and b!886285 res!601682) b!886280))

(declare-fun m!826139 () Bool)

(assert (=> b!886281 m!826139))

(declare-fun m!826141 () Bool)

(assert (=> b!886280 m!826141))

(declare-fun m!826143 () Bool)

(assert (=> bm!39209 m!826143))

(declare-fun m!826145 () Bool)

(assert (=> d!109545 m!826145))

(assert (=> d!109545 m!825955))

(declare-fun m!826147 () Bool)

(assert (=> b!886285 m!826147))

(assert (=> b!886032 d!109545))

(declare-fun b!886288 () Bool)

(declare-fun e!493311 () List!17673)

(declare-fun call!39216 () List!17673)

(assert (=> b!886288 (= e!493311 call!39216)))

(declare-fun b!886289 () Bool)

(declare-fun e!493312 () List!17673)

(assert (=> b!886289 (= e!493311 e!493312)))

(declare-fun c!93465 () Bool)

(assert (=> b!886289 (= c!93465 (and (is-Cons!17669 l!906) (= (_1!5965 (h!18800 l!906)) key1!49)))))

(declare-fun d!109547 () Bool)

(declare-fun e!493308 () Bool)

(assert (=> d!109547 e!493308))

(declare-fun res!601685 () Bool)

(assert (=> d!109547 (=> (not res!601685) (not e!493308))))

(declare-fun lt!401106 () List!17673)

(assert (=> d!109547 (= res!601685 (isStrictlySorted!491 lt!401106))))

(assert (=> d!109547 (= lt!401106 e!493311)))

(declare-fun c!93463 () Bool)

(assert (=> d!109547 (= c!93463 (and (is-Cons!17669 l!906) (bvslt (_1!5965 (h!18800 l!906)) key1!49)))))

(assert (=> d!109547 (isStrictlySorted!491 l!906)))

(assert (=> d!109547 (= (insertStrictlySorted!299 l!906 key1!49 v2!16) lt!401106)))

(declare-fun b!886290 () Bool)

(assert (=> b!886290 (= e!493308 (contains!4297 lt!401106 (tuple2!11909 key1!49 v2!16)))))

(declare-fun e!493310 () List!17673)

(declare-fun bm!39212 () Bool)

(assert (=> bm!39212 (= call!39216 ($colon$colon!548 e!493310 (ite c!93463 (h!18800 l!906) (tuple2!11909 key1!49 v2!16))))))

(declare-fun c!93464 () Bool)

(assert (=> bm!39212 (= c!93464 c!93463)))

(declare-fun b!886291 () Bool)

(assert (=> b!886291 (= e!493310 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v2!16))))

(declare-fun b!886292 () Bool)

(declare-fun c!93466 () Bool)

(assert (=> b!886292 (= c!93466 (and (is-Cons!17669 l!906) (bvsgt (_1!5965 (h!18800 l!906)) key1!49)))))

(declare-fun e!493309 () List!17673)

(assert (=> b!886292 (= e!493312 e!493309)))

(declare-fun b!886293 () Bool)

(declare-fun call!39215 () List!17673)

(assert (=> b!886293 (= e!493309 call!39215)))

(declare-fun b!886294 () Bool)

(assert (=> b!886294 (= e!493310 (ite c!93465 (t!24950 l!906) (ite c!93466 (Cons!17669 (h!18800 l!906) (t!24950 l!906)) Nil!17670)))))

(declare-fun b!886295 () Bool)

(declare-fun res!601684 () Bool)

(assert (=> b!886295 (=> (not res!601684) (not e!493308))))

(assert (=> b!886295 (= res!601684 (containsKey!413 lt!401106 key1!49))))

(declare-fun bm!39213 () Bool)

(declare-fun call!39217 () List!17673)

(assert (=> bm!39213 (= call!39215 call!39217)))

(declare-fun b!886296 () Bool)

(assert (=> b!886296 (= e!493309 call!39215)))

(declare-fun bm!39214 () Bool)

(assert (=> bm!39214 (= call!39217 call!39216)))

(declare-fun b!886297 () Bool)

(assert (=> b!886297 (= e!493312 call!39217)))

(assert (= (and d!109547 c!93463) b!886288))

(assert (= (and d!109547 (not c!93463)) b!886289))

(assert (= (and b!886289 c!93465) b!886297))

(assert (= (and b!886289 (not c!93465)) b!886292))

(assert (= (and b!886292 c!93466) b!886296))

(assert (= (and b!886292 (not c!93466)) b!886293))

(assert (= (or b!886296 b!886293) bm!39213))

(assert (= (or b!886297 bm!39213) bm!39214))

(assert (= (or b!886288 bm!39214) bm!39212))

(assert (= (and bm!39212 c!93464) b!886291))

(assert (= (and bm!39212 (not c!93464)) b!886294))

(assert (= (and d!109547 res!601685) b!886295))

(assert (= (and b!886295 res!601684) b!886290))

(assert (=> b!886291 m!825967))

(declare-fun m!826149 () Bool)

(assert (=> b!886290 m!826149))

(declare-fun m!826151 () Bool)

(assert (=> bm!39212 m!826151))

(declare-fun m!826153 () Bool)

(assert (=> d!109547 m!826153))

(assert (=> d!109547 m!825971))

(declare-fun m!826155 () Bool)

(assert (=> b!886295 m!826155))

(assert (=> b!886032 d!109547))

(declare-fun b!886298 () Bool)

(declare-fun e!493316 () List!17673)

(declare-fun call!39219 () List!17673)

(assert (=> b!886298 (= e!493316 call!39219)))

(declare-fun b!886299 () Bool)

(declare-fun e!493317 () List!17673)

(assert (=> b!886299 (= e!493316 e!493317)))

(declare-fun c!93469 () Bool)

(assert (=> b!886299 (= c!93469 (and (is-Cons!17669 l!906) (= (_1!5965 (h!18800 l!906)) key1!49)))))

(declare-fun d!109549 () Bool)

(declare-fun e!493313 () Bool)

(assert (=> d!109549 e!493313))

(declare-fun res!601687 () Bool)

(assert (=> d!109549 (=> (not res!601687) (not e!493313))))

(declare-fun lt!401107 () List!17673)

(assert (=> d!109549 (= res!601687 (isStrictlySorted!491 lt!401107))))

(assert (=> d!109549 (= lt!401107 e!493316)))

(declare-fun c!93467 () Bool)

(assert (=> d!109549 (= c!93467 (and (is-Cons!17669 l!906) (bvslt (_1!5965 (h!18800 l!906)) key1!49)))))

(assert (=> d!109549 (isStrictlySorted!491 l!906)))

(assert (=> d!109549 (= (insertStrictlySorted!299 l!906 key1!49 v1!38) lt!401107)))

(declare-fun b!886300 () Bool)

(assert (=> b!886300 (= e!493313 (contains!4297 lt!401107 (tuple2!11909 key1!49 v1!38)))))

(declare-fun bm!39215 () Bool)

(declare-fun e!493315 () List!17673)

(assert (=> bm!39215 (= call!39219 ($colon$colon!548 e!493315 (ite c!93467 (h!18800 l!906) (tuple2!11909 key1!49 v1!38))))))

(declare-fun c!93468 () Bool)

(assert (=> bm!39215 (= c!93468 c!93467)))

(declare-fun b!886301 () Bool)

(assert (=> b!886301 (= e!493315 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38))))

(declare-fun b!886302 () Bool)

(declare-fun c!93470 () Bool)

(assert (=> b!886302 (= c!93470 (and (is-Cons!17669 l!906) (bvsgt (_1!5965 (h!18800 l!906)) key1!49)))))

(declare-fun e!493314 () List!17673)

(assert (=> b!886302 (= e!493317 e!493314)))

(declare-fun b!886303 () Bool)

(declare-fun call!39218 () List!17673)

(assert (=> b!886303 (= e!493314 call!39218)))

(declare-fun b!886304 () Bool)

(assert (=> b!886304 (= e!493315 (ite c!93469 (t!24950 l!906) (ite c!93470 (Cons!17669 (h!18800 l!906) (t!24950 l!906)) Nil!17670)))))

(declare-fun b!886305 () Bool)

(declare-fun res!601686 () Bool)

(assert (=> b!886305 (=> (not res!601686) (not e!493313))))

(assert (=> b!886305 (= res!601686 (containsKey!413 lt!401107 key1!49))))

(declare-fun bm!39216 () Bool)

(declare-fun call!39220 () List!17673)

(assert (=> bm!39216 (= call!39218 call!39220)))

(declare-fun b!886306 () Bool)

(assert (=> b!886306 (= e!493314 call!39218)))

(declare-fun bm!39217 () Bool)

(assert (=> bm!39217 (= call!39220 call!39219)))

(declare-fun b!886307 () Bool)

(assert (=> b!886307 (= e!493317 call!39220)))

(assert (= (and d!109549 c!93467) b!886298))

(assert (= (and d!109549 (not c!93467)) b!886299))

(assert (= (and b!886299 c!93469) b!886307))

(assert (= (and b!886299 (not c!93469)) b!886302))

(assert (= (and b!886302 c!93470) b!886306))

(assert (= (and b!886302 (not c!93470)) b!886303))

(assert (= (or b!886306 b!886303) bm!39216))

(assert (= (or b!886307 bm!39216) bm!39217))

(assert (= (or b!886298 bm!39217) bm!39215))

(assert (= (and bm!39215 c!93468) b!886301))

(assert (= (and bm!39215 (not c!93468)) b!886304))

(assert (= (and d!109549 res!601687) b!886305))

(assert (= (and b!886305 res!601686) b!886300))

(assert (=> b!886301 m!825957))

(declare-fun m!826157 () Bool)

(assert (=> b!886300 m!826157))

(declare-fun m!826159 () Bool)

(assert (=> bm!39215 m!826159))

(declare-fun m!826161 () Bool)

(assert (=> d!109549 m!826161))

(assert (=> d!109549 m!825971))

(declare-fun m!826163 () Bool)

(assert (=> b!886305 m!826163))

(assert (=> b!886032 d!109549))

(declare-fun b!886312 () Bool)

(declare-fun e!493320 () Bool)

(declare-fun tp!54380 () Bool)

(assert (=> b!886312 (= e!493320 (and tp_is_empty!17813 tp!54380))))

(assert (=> b!886033 (= tp!54371 e!493320)))

(assert (= (and b!886033 (is-Cons!17669 (t!24950 l!906))) b!886312))

(push 1)

(assert (not bm!39203))

(assert (not b!886300))

(assert (not b!886291))

(assert (not d!109515))

(assert (not b!886285))

(assert (not d!109545))

(assert (not bm!39215))

(assert (not b!886244))

(assert (not b!886260))

(assert (not b!886312))

(assert (not b!886049))

(assert (not b!886305))

(assert (not d!109541))

(assert (not bm!39200))

(assert (not b!886290))

(assert (not b!886047))

(assert (not b!886270))

(assert (not d!109513))

(assert (not b!886259))

(assert (not b!886281))

(assert (not b!886280))

(assert (not b!886275))

(assert tp_is_empty!17813)

(assert (not b!886243))

(assert (not b!886301))

(assert (not b!886248))

(assert (not b!886264))

(assert (not b!886271))

(assert (not bm!39206))

(assert (not d!109549))

(assert (not b!886295))

(assert (not d!109543))

(assert (not d!109547))

(assert (not bm!39212))

(assert (not bm!39209))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!109679 () Bool)

(declare-fun res!601804 () Bool)

(declare-fun e!493463 () Bool)

(assert (=> d!109679 (=> res!601804 e!493463)))

(assert (=> d!109679 (= res!601804 (or (is-Nil!17670 lt!401104) (is-Nil!17670 (t!24950 lt!401104))))))

(assert (=> d!109679 (= (isStrictlySorted!491 lt!401104) e!493463)))

(declare-fun b!886495 () Bool)

(declare-fun e!493464 () Bool)

(assert (=> b!886495 (= e!493463 e!493464)))

(declare-fun res!601805 () Bool)

(assert (=> b!886495 (=> (not res!601805) (not e!493464))))

(assert (=> b!886495 (= res!601805 (bvslt (_1!5965 (h!18800 lt!401104)) (_1!5965 (h!18800 (t!24950 lt!401104)))))))

(declare-fun b!886496 () Bool)

(assert (=> b!886496 (= e!493464 (isStrictlySorted!491 (t!24950 lt!401104)))))

(assert (= (and d!109679 (not res!601804)) b!886495))

(assert (= (and b!886495 res!601805) b!886496))

(declare-fun m!826377 () Bool)

(assert (=> b!886496 m!826377))

(assert (=> d!109543 d!109679))

(assert (=> d!109543 d!109511))

(declare-fun d!109681 () Bool)

(declare-fun res!601810 () Bool)

(declare-fun e!493469 () Bool)

(assert (=> d!109681 (=> res!601810 e!493469)))

(assert (=> d!109681 (= res!601810 (and (is-Cons!17669 lt!401105) (= (_1!5965 (h!18800 lt!401105)) key1!49)))))

(assert (=> d!109681 (= (containsKey!413 lt!401105 key1!49) e!493469)))

(declare-fun b!886501 () Bool)

(declare-fun e!493470 () Bool)

(assert (=> b!886501 (= e!493469 e!493470)))

(declare-fun res!601811 () Bool)

(assert (=> b!886501 (=> (not res!601811) (not e!493470))))

(assert (=> b!886501 (= res!601811 (and (or (not (is-Cons!17669 lt!401105)) (bvsle (_1!5965 (h!18800 lt!401105)) key1!49)) (is-Cons!17669 lt!401105) (bvslt (_1!5965 (h!18800 lt!401105)) key1!49)))))

(declare-fun b!886502 () Bool)

(assert (=> b!886502 (= e!493470 (containsKey!413 (t!24950 lt!401105) key1!49))))

(assert (= (and d!109681 (not res!601810)) b!886501))

(assert (= (and b!886501 res!601811) b!886502))

(declare-fun m!826379 () Bool)

(assert (=> b!886502 m!826379))

(assert (=> b!886285 d!109681))

(declare-fun d!109683 () Bool)

(declare-fun res!601812 () Bool)

(declare-fun e!493471 () Bool)

(assert (=> d!109683 (=> res!601812 e!493471)))

(assert (=> d!109683 (= res!601812 (and (is-Cons!17669 lt!401104) (= (_1!5965 (h!18800 lt!401104)) key1!49)))))

(assert (=> d!109683 (= (containsKey!413 lt!401104 key1!49) e!493471)))

(declare-fun b!886503 () Bool)

(declare-fun e!493472 () Bool)

(assert (=> b!886503 (= e!493471 e!493472)))

(declare-fun res!601813 () Bool)

(assert (=> b!886503 (=> (not res!601813) (not e!493472))))

(assert (=> b!886503 (= res!601813 (and (or (not (is-Cons!17669 lt!401104)) (bvsle (_1!5965 (h!18800 lt!401104)) key1!49)) (is-Cons!17669 lt!401104) (bvslt (_1!5965 (h!18800 lt!401104)) key1!49)))))

(declare-fun b!886504 () Bool)

(assert (=> b!886504 (= e!493472 (containsKey!413 (t!24950 lt!401104) key1!49))))

(assert (= (and d!109683 (not res!601812)) b!886503))

(assert (= (and b!886503 res!601813) b!886504))

(declare-fun m!826381 () Bool)

(assert (=> b!886504 m!826381))

(assert (=> b!886275 d!109683))

(assert (=> b!886291 d!109543))

(declare-fun d!109685 () Bool)

(assert (=> d!109685 (= ($colon$colon!548 e!493294 (ite c!93451 (h!18800 (insertStrictlySorted!299 l!906 key1!49 v1!38)) (tuple2!11909 key1!49 v2!16))) (Cons!17669 (ite c!93451 (h!18800 (insertStrictlySorted!299 l!906 key1!49 v1!38)) (tuple2!11909 key1!49 v2!16)) e!493294))))

(assert (=> bm!39203 d!109685))

(declare-fun d!109687 () Bool)

(assert (=> d!109687 (= ($colon$colon!548 e!493285 (ite c!93447 (h!18800 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38)) (tuple2!11909 key1!49 v2!16))) (Cons!17669 (ite c!93447 (h!18800 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38)) (tuple2!11909 key1!49 v2!16)) e!493285))))

(assert (=> bm!39200 d!109687))

(declare-fun d!109689 () Bool)

(declare-fun lt!401134 () Bool)

(declare-fun content!396 (List!17673) (Set tuple2!11908))

(assert (=> d!109689 (= lt!401134 (member (tuple2!11909 key1!49 v1!38) (content!396 lt!401105)))))

(declare-fun e!493477 () Bool)

(assert (=> d!109689 (= lt!401134 e!493477)))

(declare-fun res!601818 () Bool)

(assert (=> d!109689 (=> (not res!601818) (not e!493477))))

(assert (=> d!109689 (= res!601818 (is-Cons!17669 lt!401105))))

(assert (=> d!109689 (= (contains!4297 lt!401105 (tuple2!11909 key1!49 v1!38)) lt!401134)))

(declare-fun b!886509 () Bool)

(declare-fun e!493478 () Bool)

(assert (=> b!886509 (= e!493477 e!493478)))

(declare-fun res!601819 () Bool)

(assert (=> b!886509 (=> res!601819 e!493478)))

(assert (=> b!886509 (= res!601819 (= (h!18800 lt!401105) (tuple2!11909 key1!49 v1!38)))))

(declare-fun b!886510 () Bool)

(assert (=> b!886510 (= e!493478 (contains!4297 (t!24950 lt!401105) (tuple2!11909 key1!49 v1!38)))))

(assert (= (and d!109689 res!601818) b!886509))

(assert (= (and b!886509 (not res!601819)) b!886510))

(declare-fun m!826383 () Bool)

(assert (=> d!109689 m!826383))

(declare-fun m!826385 () Bool)

(assert (=> d!109689 m!826385))

(declare-fun m!826387 () Bool)

(assert (=> b!886510 m!826387))

(assert (=> b!886280 d!109689))

(declare-fun b!886511 () Bool)

(declare-fun e!493482 () List!17673)

(declare-fun call!39246 () List!17673)

(assert (=> b!886511 (= e!493482 call!39246)))

(declare-fun b!886512 () Bool)

(declare-fun e!493483 () List!17673)

(assert (=> b!886512 (= e!493482 e!493483)))

(declare-fun c!93505 () Bool)

(assert (=> b!886512 (= c!93505 (and (is-Cons!17669 (t!24950 (insertStrictlySorted!299 l!906 key1!49 v1!38))) (= (_1!5965 (h!18800 (t!24950 (insertStrictlySorted!299 l!906 key1!49 v1!38)))) key1!49)))))

(declare-fun d!109691 () Bool)

(declare-fun e!493479 () Bool)

(assert (=> d!109691 e!493479))

(declare-fun res!601821 () Bool)

(assert (=> d!109691 (=> (not res!601821) (not e!493479))))

(declare-fun lt!401135 () List!17673)

(assert (=> d!109691 (= res!601821 (isStrictlySorted!491 lt!401135))))

(assert (=> d!109691 (= lt!401135 e!493482)))

(declare-fun c!93503 () Bool)

(assert (=> d!109691 (= c!93503 (and (is-Cons!17669 (t!24950 (insertStrictlySorted!299 l!906 key1!49 v1!38))) (bvslt (_1!5965 (h!18800 (t!24950 (insertStrictlySorted!299 l!906 key1!49 v1!38)))) key1!49)))))

(assert (=> d!109691 (isStrictlySorted!491 (t!24950 (insertStrictlySorted!299 l!906 key1!49 v1!38)))))

(assert (=> d!109691 (= (insertStrictlySorted!299 (t!24950 (insertStrictlySorted!299 l!906 key1!49 v1!38)) key1!49 v2!16) lt!401135)))

(declare-fun b!886513 () Bool)

(assert (=> b!886513 (= e!493479 (contains!4297 lt!401135 (tuple2!11909 key1!49 v2!16)))))

(declare-fun e!493481 () List!17673)

(declare-fun bm!39242 () Bool)

(assert (=> bm!39242 (= call!39246 ($colon$colon!548 e!493481 (ite c!93503 (h!18800 (t!24950 (insertStrictlySorted!299 l!906 key1!49 v1!38))) (tuple2!11909 key1!49 v2!16))))))

(declare-fun c!93504 () Bool)

(assert (=> bm!39242 (= c!93504 c!93503)))

(declare-fun b!886514 () Bool)

(assert (=> b!886514 (= e!493481 (insertStrictlySorted!299 (t!24950 (t!24950 (insertStrictlySorted!299 l!906 key1!49 v1!38))) key1!49 v2!16))))

(declare-fun b!886515 () Bool)

(declare-fun c!93506 () Bool)

(assert (=> b!886515 (= c!93506 (and (is-Cons!17669 (t!24950 (insertStrictlySorted!299 l!906 key1!49 v1!38))) (bvsgt (_1!5965 (h!18800 (t!24950 (insertStrictlySorted!299 l!906 key1!49 v1!38)))) key1!49)))))

(declare-fun e!493480 () List!17673)

(assert (=> b!886515 (= e!493483 e!493480)))

(declare-fun b!886516 () Bool)

(declare-fun call!39245 () List!17673)

(assert (=> b!886516 (= e!493480 call!39245)))

(declare-fun b!886517 () Bool)

(assert (=> b!886517 (= e!493481 (ite c!93505 (t!24950 (t!24950 (insertStrictlySorted!299 l!906 key1!49 v1!38))) (ite c!93506 (Cons!17669 (h!18800 (t!24950 (insertStrictlySorted!299 l!906 key1!49 v1!38))) (t!24950 (t!24950 (insertStrictlySorted!299 l!906 key1!49 v1!38)))) Nil!17670)))))

(declare-fun b!886518 () Bool)

(declare-fun res!601820 () Bool)

(assert (=> b!886518 (=> (not res!601820) (not e!493479))))

(assert (=> b!886518 (= res!601820 (containsKey!413 lt!401135 key1!49))))

(declare-fun bm!39243 () Bool)

(declare-fun call!39247 () List!17673)

(assert (=> bm!39243 (= call!39245 call!39247)))

(declare-fun b!886519 () Bool)

(assert (=> b!886519 (= e!493480 call!39245)))

(declare-fun bm!39244 () Bool)

(assert (=> bm!39244 (= call!39247 call!39246)))

(declare-fun b!886520 () Bool)

(assert (=> b!886520 (= e!493483 call!39247)))

(assert (= (and d!109691 c!93503) b!886511))

(assert (= (and d!109691 (not c!93503)) b!886512))

(assert (= (and b!886512 c!93505) b!886520))

(assert (= (and b!886512 (not c!93505)) b!886515))

(assert (= (and b!886515 c!93506) b!886519))

(assert (= (and b!886515 (not c!93506)) b!886516))

(assert (= (or b!886519 b!886516) bm!39243))

(assert (= (or b!886520 bm!39243) bm!39244))

(assert (= (or b!886511 bm!39244) bm!39242))

(assert (= (and bm!39242 c!93504) b!886514))

(assert (= (and bm!39242 (not c!93504)) b!886517))

(assert (= (and d!109691 res!601821) b!886518))

(assert (= (and b!886518 res!601820) b!886513))

(declare-fun m!826389 () Bool)

(assert (=> b!886514 m!826389))

(declare-fun m!826391 () Bool)

(assert (=> b!886513 m!826391))

(declare-fun m!826393 () Bool)

(assert (=> bm!39242 m!826393))

(declare-fun m!826395 () Bool)

(assert (=> d!109691 m!826395))

(declare-fun m!826397 () Bool)

(assert (=> d!109691 m!826397))

(declare-fun m!826399 () Bool)

(assert (=> b!886518 m!826399))

(assert (=> b!886260 d!109691))

(declare-fun b!886521 () Bool)

(declare-fun e!493487 () List!17673)

(declare-fun call!39249 () List!17673)

(assert (=> b!886521 (= e!493487 call!39249)))

(declare-fun b!886522 () Bool)

(declare-fun e!493488 () List!17673)

(assert (=> b!886522 (= e!493487 e!493488)))

(declare-fun c!93509 () Bool)

(assert (=> b!886522 (= c!93509 (and (is-Cons!17669 (t!24950 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38))) (= (_1!5965 (h!18800 (t!24950 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38)))) key1!49)))))

(declare-fun d!109693 () Bool)

(declare-fun e!493484 () Bool)

(assert (=> d!109693 e!493484))

(declare-fun res!601823 () Bool)

(assert (=> d!109693 (=> (not res!601823) (not e!493484))))

(declare-fun lt!401136 () List!17673)

(assert (=> d!109693 (= res!601823 (isStrictlySorted!491 lt!401136))))

(assert (=> d!109693 (= lt!401136 e!493487)))

(declare-fun c!93507 () Bool)

(assert (=> d!109693 (= c!93507 (and (is-Cons!17669 (t!24950 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38))) (bvslt (_1!5965 (h!18800 (t!24950 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38)))) key1!49)))))

(assert (=> d!109693 (isStrictlySorted!491 (t!24950 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38)))))

(assert (=> d!109693 (= (insertStrictlySorted!299 (t!24950 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38)) key1!49 v2!16) lt!401136)))

(declare-fun b!886523 () Bool)

(assert (=> b!886523 (= e!493484 (contains!4297 lt!401136 (tuple2!11909 key1!49 v2!16)))))

(declare-fun e!493486 () List!17673)

(declare-fun bm!39245 () Bool)

(assert (=> bm!39245 (= call!39249 ($colon$colon!548 e!493486 (ite c!93507 (h!18800 (t!24950 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38))) (tuple2!11909 key1!49 v2!16))))))

(declare-fun c!93508 () Bool)

(assert (=> bm!39245 (= c!93508 c!93507)))

(declare-fun b!886524 () Bool)

(assert (=> b!886524 (= e!493486 (insertStrictlySorted!299 (t!24950 (t!24950 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38))) key1!49 v2!16))))

(declare-fun c!93510 () Bool)

(declare-fun b!886525 () Bool)

(assert (=> b!886525 (= c!93510 (and (is-Cons!17669 (t!24950 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38))) (bvsgt (_1!5965 (h!18800 (t!24950 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38)))) key1!49)))))

(declare-fun e!493485 () List!17673)

(assert (=> b!886525 (= e!493488 e!493485)))

(declare-fun b!886526 () Bool)

(declare-fun call!39248 () List!17673)

(assert (=> b!886526 (= e!493485 call!39248)))

(declare-fun b!886527 () Bool)

(assert (=> b!886527 (= e!493486 (ite c!93509 (t!24950 (t!24950 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38))) (ite c!93510 (Cons!17669 (h!18800 (t!24950 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38))) (t!24950 (t!24950 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38)))) Nil!17670)))))

(declare-fun b!886528 () Bool)

(declare-fun res!601822 () Bool)

(assert (=> b!886528 (=> (not res!601822) (not e!493484))))

(assert (=> b!886528 (= res!601822 (containsKey!413 lt!401136 key1!49))))

(declare-fun bm!39246 () Bool)

(declare-fun call!39250 () List!17673)

(assert (=> bm!39246 (= call!39248 call!39250)))

(declare-fun b!886529 () Bool)

(assert (=> b!886529 (= e!493485 call!39248)))

(declare-fun bm!39247 () Bool)

(assert (=> bm!39247 (= call!39250 call!39249)))

(declare-fun b!886530 () Bool)

(assert (=> b!886530 (= e!493488 call!39250)))

(assert (= (and d!109693 c!93507) b!886521))

(assert (= (and d!109693 (not c!93507)) b!886522))

(assert (= (and b!886522 c!93509) b!886530))

(assert (= (and b!886522 (not c!93509)) b!886525))

(assert (= (and b!886525 c!93510) b!886529))

(assert (= (and b!886525 (not c!93510)) b!886526))

(assert (= (or b!886529 b!886526) bm!39246))

(assert (= (or b!886530 bm!39246) bm!39247))

(assert (= (or b!886521 bm!39247) bm!39245))

(assert (= (and bm!39245 c!93508) b!886524))

(assert (= (and bm!39245 (not c!93508)) b!886527))

(assert (= (and d!109693 res!601823) b!886528))

(assert (= (and b!886528 res!601822) b!886523))

(declare-fun m!826401 () Bool)

(assert (=> b!886524 m!826401))

(declare-fun m!826403 () Bool)

(assert (=> b!886523 m!826403))

(declare-fun m!826405 () Bool)

(assert (=> bm!39245 m!826405))

(declare-fun m!826407 () Bool)

(assert (=> d!109693 m!826407))

(declare-fun m!826409 () Bool)

(assert (=> d!109693 m!826409))

(declare-fun m!826411 () Bool)

(assert (=> b!886528 m!826411))

(assert (=> b!886244 d!109693))

(declare-fun d!109695 () Bool)

(declare-fun res!601824 () Bool)

(declare-fun e!493489 () Bool)

(assert (=> d!109695 (=> res!601824 e!493489)))

(assert (=> d!109695 (= res!601824 (and (is-Cons!17669 lt!401107) (= (_1!5965 (h!18800 lt!401107)) key1!49)))))

(assert (=> d!109695 (= (containsKey!413 lt!401107 key1!49) e!493489)))

(declare-fun b!886531 () Bool)

(declare-fun e!493490 () Bool)

(assert (=> b!886531 (= e!493489 e!493490)))

(declare-fun res!601825 () Bool)

(assert (=> b!886531 (=> (not res!601825) (not e!493490))))

(assert (=> b!886531 (= res!601825 (and (or (not (is-Cons!17669 lt!401107)) (bvsle (_1!5965 (h!18800 lt!401107)) key1!49)) (is-Cons!17669 lt!401107) (bvslt (_1!5965 (h!18800 lt!401107)) key1!49)))))

(declare-fun b!886532 () Bool)

(assert (=> b!886532 (= e!493490 (containsKey!413 (t!24950 lt!401107) key1!49))))

(assert (= (and d!109695 (not res!601824)) b!886531))

(assert (= (and b!886531 res!601825) b!886532))

(declare-fun m!826413 () Bool)

(assert (=> b!886532 m!826413))

(assert (=> b!886305 d!109695))

(declare-fun d!109697 () Bool)

(declare-fun res!601826 () Bool)

(declare-fun e!493491 () Bool)

(assert (=> d!109697 (=> res!601826 e!493491)))

(assert (=> d!109697 (= res!601826 (or (is-Nil!17670 lt!401106) (is-Nil!17670 (t!24950 lt!401106))))))

(assert (=> d!109697 (= (isStrictlySorted!491 lt!401106) e!493491)))

(declare-fun b!886533 () Bool)

(declare-fun e!493492 () Bool)

(assert (=> b!886533 (= e!493491 e!493492)))

(declare-fun res!601827 () Bool)

(assert (=> b!886533 (=> (not res!601827) (not e!493492))))

(assert (=> b!886533 (= res!601827 (bvslt (_1!5965 (h!18800 lt!401106)) (_1!5965 (h!18800 (t!24950 lt!401106)))))))

(declare-fun b!886534 () Bool)

(assert (=> b!886534 (= e!493492 (isStrictlySorted!491 (t!24950 lt!401106)))))

(assert (= (and d!109697 (not res!601826)) b!886533))

(assert (= (and b!886533 res!601827) b!886534))

(declare-fun m!826415 () Bool)

(assert (=> b!886534 m!826415))

(assert (=> d!109547 d!109697))

(assert (=> d!109547 d!109507))

(declare-fun d!109699 () Bool)

(assert (=> d!109699 (= ($colon$colon!548 e!493305 (ite c!93459 (h!18800 (t!24950 l!906)) (tuple2!11909 key1!49 v1!38))) (Cons!17669 (ite c!93459 (h!18800 (t!24950 l!906)) (tuple2!11909 key1!49 v1!38)) e!493305))))

(assert (=> bm!39209 d!109699))

(declare-fun d!109701 () Bool)

(declare-fun lt!401137 () Bool)

(assert (=> d!109701 (= lt!401137 (member (tuple2!11909 key1!49 v2!16) (content!396 lt!401104)))))

(declare-fun e!493493 () Bool)

(assert (=> d!109701 (= lt!401137 e!493493)))

(declare-fun res!601828 () Bool)

(assert (=> d!109701 (=> (not res!601828) (not e!493493))))

(assert (=> d!109701 (= res!601828 (is-Cons!17669 lt!401104))))

(assert (=> d!109701 (= (contains!4297 lt!401104 (tuple2!11909 key1!49 v2!16)) lt!401137)))

(declare-fun b!886535 () Bool)

(declare-fun e!493494 () Bool)

(assert (=> b!886535 (= e!493493 e!493494)))

(declare-fun res!601829 () Bool)

(assert (=> b!886535 (=> res!601829 e!493494)))

(assert (=> b!886535 (= res!601829 (= (h!18800 lt!401104) (tuple2!11909 key1!49 v2!16)))))

(declare-fun b!886536 () Bool)

(assert (=> b!886536 (= e!493494 (contains!4297 (t!24950 lt!401104) (tuple2!11909 key1!49 v2!16)))))

(assert (= (and d!109701 res!601828) b!886535))

(assert (= (and b!886535 (not res!601829)) b!886536))

(declare-fun m!826417 () Bool)

(assert (=> d!109701 m!826417))

(declare-fun m!826419 () Bool)

(assert (=> d!109701 m!826419))

(declare-fun m!826421 () Bool)

(assert (=> b!886536 m!826421))

(assert (=> b!886270 d!109701))

(declare-fun d!109703 () Bool)

(declare-fun res!601830 () Bool)

(declare-fun e!493495 () Bool)

(assert (=> d!109703 (=> res!601830 e!493495)))

(assert (=> d!109703 (= res!601830 (or (is-Nil!17670 lt!401103) (is-Nil!17670 (t!24950 lt!401103))))))

(assert (=> d!109703 (= (isStrictlySorted!491 lt!401103) e!493495)))

(declare-fun b!886537 () Bool)

(declare-fun e!493496 () Bool)

(assert (=> b!886537 (= e!493495 e!493496)))

(declare-fun res!601831 () Bool)

(assert (=> b!886537 (=> (not res!601831) (not e!493496))))

(assert (=> b!886537 (= res!601831 (bvslt (_1!5965 (h!18800 lt!401103)) (_1!5965 (h!18800 (t!24950 lt!401103)))))))

(declare-fun b!886538 () Bool)

(assert (=> b!886538 (= e!493496 (isStrictlySorted!491 (t!24950 lt!401103)))))

(assert (= (and d!109703 (not res!601830)) b!886537))

(assert (= (and b!886537 res!601831) b!886538))

(declare-fun m!826423 () Bool)

(assert (=> b!886538 m!826423))

(assert (=> d!109541 d!109703))

(declare-fun d!109705 () Bool)

(declare-fun res!601832 () Bool)

(declare-fun e!493497 () Bool)

(assert (=> d!109705 (=> res!601832 e!493497)))

(assert (=> d!109705 (= res!601832 (or (is-Nil!17670 (insertStrictlySorted!299 l!906 key1!49 v1!38)) (is-Nil!17670 (t!24950 (insertStrictlySorted!299 l!906 key1!49 v1!38)))))))

(assert (=> d!109705 (= (isStrictlySorted!491 (insertStrictlySorted!299 l!906 key1!49 v1!38)) e!493497)))

(declare-fun b!886539 () Bool)

(declare-fun e!493498 () Bool)

(assert (=> b!886539 (= e!493497 e!493498)))

(declare-fun res!601833 () Bool)

(assert (=> b!886539 (=> (not res!601833) (not e!493498))))

(assert (=> b!886539 (= res!601833 (bvslt (_1!5965 (h!18800 (insertStrictlySorted!299 l!906 key1!49 v1!38))) (_1!5965 (h!18800 (t!24950 (insertStrictlySorted!299 l!906 key1!49 v1!38))))))))

(declare-fun b!886540 () Bool)

(assert (=> b!886540 (= e!493498 (isStrictlySorted!491 (t!24950 (insertStrictlySorted!299 l!906 key1!49 v1!38))))))

(assert (= (and d!109705 (not res!601832)) b!886539))

(assert (= (and b!886539 res!601833) b!886540))

(assert (=> b!886540 m!826397))

(assert (=> d!109541 d!109705))

(declare-fun b!886541 () Bool)

(declare-fun e!493502 () List!17673)

(declare-fun call!39252 () List!17673)

(assert (=> b!886541 (= e!493502 call!39252)))

(declare-fun b!886542 () Bool)

(declare-fun e!493503 () List!17673)

(assert (=> b!886542 (= e!493502 e!493503)))

(declare-fun c!93513 () Bool)

(assert (=> b!886542 (= c!93513 (and (is-Cons!17669 (t!24950 (t!24950 l!906))) (= (_1!5965 (h!18800 (t!24950 (t!24950 l!906)))) key1!49)))))

(declare-fun d!109707 () Bool)

(declare-fun e!493499 () Bool)

(assert (=> d!109707 e!493499))

(declare-fun res!601835 () Bool)

(assert (=> d!109707 (=> (not res!601835) (not e!493499))))

(declare-fun lt!401138 () List!17673)

(assert (=> d!109707 (= res!601835 (isStrictlySorted!491 lt!401138))))

(assert (=> d!109707 (= lt!401138 e!493502)))

(declare-fun c!93511 () Bool)

(assert (=> d!109707 (= c!93511 (and (is-Cons!17669 (t!24950 (t!24950 l!906))) (bvslt (_1!5965 (h!18800 (t!24950 (t!24950 l!906)))) key1!49)))))

(assert (=> d!109707 (isStrictlySorted!491 (t!24950 (t!24950 l!906)))))

(assert (=> d!109707 (= (insertStrictlySorted!299 (t!24950 (t!24950 l!906)) key1!49 v1!38) lt!401138)))

(declare-fun b!886543 () Bool)

(assert (=> b!886543 (= e!493499 (contains!4297 lt!401138 (tuple2!11909 key1!49 v1!38)))))

(declare-fun e!493501 () List!17673)

(declare-fun bm!39248 () Bool)

(assert (=> bm!39248 (= call!39252 ($colon$colon!548 e!493501 (ite c!93511 (h!18800 (t!24950 (t!24950 l!906))) (tuple2!11909 key1!49 v1!38))))))

(declare-fun c!93512 () Bool)

(assert (=> bm!39248 (= c!93512 c!93511)))

(declare-fun b!886544 () Bool)

(assert (=> b!886544 (= e!493501 (insertStrictlySorted!299 (t!24950 (t!24950 (t!24950 l!906))) key1!49 v1!38))))

(declare-fun b!886545 () Bool)

(declare-fun c!93514 () Bool)

(assert (=> b!886545 (= c!93514 (and (is-Cons!17669 (t!24950 (t!24950 l!906))) (bvsgt (_1!5965 (h!18800 (t!24950 (t!24950 l!906)))) key1!49)))))

(declare-fun e!493500 () List!17673)

(assert (=> b!886545 (= e!493503 e!493500)))

(declare-fun b!886546 () Bool)

(declare-fun call!39251 () List!17673)

(assert (=> b!886546 (= e!493500 call!39251)))

(declare-fun b!886547 () Bool)

(assert (=> b!886547 (= e!493501 (ite c!93513 (t!24950 (t!24950 (t!24950 l!906))) (ite c!93514 (Cons!17669 (h!18800 (t!24950 (t!24950 l!906))) (t!24950 (t!24950 (t!24950 l!906)))) Nil!17670)))))

(declare-fun b!886548 () Bool)

(declare-fun res!601834 () Bool)

(assert (=> b!886548 (=> (not res!601834) (not e!493499))))

(assert (=> b!886548 (= res!601834 (containsKey!413 lt!401138 key1!49))))

(declare-fun bm!39249 () Bool)

(declare-fun call!39253 () List!17673)

(assert (=> bm!39249 (= call!39251 call!39253)))

(declare-fun b!886549 () Bool)

(assert (=> b!886549 (= e!493500 call!39251)))

(declare-fun bm!39250 () Bool)

(assert (=> bm!39250 (= call!39253 call!39252)))

(declare-fun b!886550 () Bool)

(assert (=> b!886550 (= e!493503 call!39253)))

(assert (= (and d!109707 c!93511) b!886541))

(assert (= (and d!109707 (not c!93511)) b!886542))

(assert (= (and b!886542 c!93513) b!886550))

(assert (= (and b!886542 (not c!93513)) b!886545))

(assert (= (and b!886545 c!93514) b!886549))

(assert (= (and b!886545 (not c!93514)) b!886546))

(assert (= (or b!886549 b!886546) bm!39249))

(assert (= (or b!886550 bm!39249) bm!39250))

(assert (= (or b!886541 bm!39250) bm!39248))

(assert (= (and bm!39248 c!93512) b!886544))

(assert (= (and bm!39248 (not c!93512)) b!886547))

(assert (= (and d!109707 res!601835) b!886548))

(assert (= (and b!886548 res!601834) b!886543))

(declare-fun m!826425 () Bool)

(assert (=> b!886544 m!826425))

(declare-fun m!826427 () Bool)

(assert (=> b!886543 m!826427))

(declare-fun m!826429 () Bool)

(assert (=> bm!39248 m!826429))

(declare-fun m!826431 () Bool)

(assert (=> d!109707 m!826431))

(assert (=> d!109707 m!825979))

(declare-fun m!826433 () Bool)

(assert (=> b!886548 m!826433))

(assert (=> b!886281 d!109707))

(declare-fun d!109709 () Bool)

(assert (=> d!109709 (= ($colon$colon!548 e!493300 (ite c!93455 (h!18800 (t!24950 l!906)) (tuple2!11909 key1!49 v2!16))) (Cons!17669 (ite c!93455 (h!18800 (t!24950 l!906)) (tuple2!11909 key1!49 v2!16)) e!493300))))

(assert (=> bm!39206 d!109709))

(declare-fun d!109711 () Bool)

(declare-fun res!601836 () Bool)

(declare-fun e!493504 () Bool)

(assert (=> d!109711 (=> res!601836 e!493504)))

(assert (=> d!109711 (= res!601836 (and (is-Cons!17669 lt!401106) (= (_1!5965 (h!18800 lt!401106)) key1!49)))))

(assert (=> d!109711 (= (containsKey!413 lt!401106 key1!49) e!493504)))

(declare-fun b!886551 () Bool)

(declare-fun e!493505 () Bool)

(assert (=> b!886551 (= e!493504 e!493505)))

(declare-fun res!601837 () Bool)

(assert (=> b!886551 (=> (not res!601837) (not e!493505))))

(assert (=> b!886551 (= res!601837 (and (or (not (is-Cons!17669 lt!401106)) (bvsle (_1!5965 (h!18800 lt!401106)) key1!49)) (is-Cons!17669 lt!401106) (bvslt (_1!5965 (h!18800 lt!401106)) key1!49)))))

(declare-fun b!886552 () Bool)

(assert (=> b!886552 (= e!493505 (containsKey!413 (t!24950 lt!401106) key1!49))))

(assert (= (and d!109711 (not res!601836)) b!886551))

(assert (= (and b!886551 res!601837) b!886552))

(declare-fun m!826435 () Bool)

(assert (=> b!886552 m!826435))

(assert (=> b!886295 d!109711))

(declare-fun d!109713 () Bool)

(declare-fun res!601838 () Bool)

(declare-fun e!493506 () Bool)

(assert (=> d!109713 (=> res!601838 e!493506)))

(assert (=> d!109713 (= res!601838 (or (is-Nil!17670 lt!401105) (is-Nil!17670 (t!24950 lt!401105))))))

(assert (=> d!109713 (= (isStrictlySorted!491 lt!401105) e!493506)))

(declare-fun b!886553 () Bool)

(declare-fun e!493507 () Bool)

(assert (=> b!886553 (= e!493506 e!493507)))

(declare-fun res!601839 () Bool)

(assert (=> b!886553 (=> (not res!601839) (not e!493507))))

(assert (=> b!886553 (= res!601839 (bvslt (_1!5965 (h!18800 lt!401105)) (_1!5965 (h!18800 (t!24950 lt!401105)))))))

(declare-fun b!886554 () Bool)

(assert (=> b!886554 (= e!493507 (isStrictlySorted!491 (t!24950 lt!401105)))))

(assert (= (and d!109713 (not res!601838)) b!886553))

(assert (= (and b!886553 res!601839) b!886554))

(declare-fun m!826437 () Bool)

(assert (=> b!886554 m!826437))

(assert (=> d!109545 d!109713))

(assert (=> d!109545 d!109511))

(declare-fun b!886555 () Bool)

(declare-fun e!493511 () List!17673)

(declare-fun call!39255 () List!17673)

(assert (=> b!886555 (= e!493511 call!39255)))

(declare-fun b!886556 () Bool)

(declare-fun e!493512 () List!17673)

(assert (=> b!886556 (= e!493511 e!493512)))

(declare-fun c!93517 () Bool)

(assert (=> b!886556 (= c!93517 (and (is-Cons!17669 (t!24950 (t!24950 l!906))) (= (_1!5965 (h!18800 (t!24950 (t!24950 l!906)))) key1!49)))))

(declare-fun d!109715 () Bool)

(declare-fun e!493508 () Bool)

(assert (=> d!109715 e!493508))

(declare-fun res!601841 () Bool)

(assert (=> d!109715 (=> (not res!601841) (not e!493508))))

(declare-fun lt!401139 () List!17673)

(assert (=> d!109715 (= res!601841 (isStrictlySorted!491 lt!401139))))

(assert (=> d!109715 (= lt!401139 e!493511)))

(declare-fun c!93515 () Bool)

(assert (=> d!109715 (= c!93515 (and (is-Cons!17669 (t!24950 (t!24950 l!906))) (bvslt (_1!5965 (h!18800 (t!24950 (t!24950 l!906)))) key1!49)))))

(assert (=> d!109715 (isStrictlySorted!491 (t!24950 (t!24950 l!906)))))

(assert (=> d!109715 (= (insertStrictlySorted!299 (t!24950 (t!24950 l!906)) key1!49 v2!16) lt!401139)))

(declare-fun b!886557 () Bool)

(assert (=> b!886557 (= e!493508 (contains!4297 lt!401139 (tuple2!11909 key1!49 v2!16)))))

(declare-fun e!493510 () List!17673)

(declare-fun bm!39251 () Bool)

(assert (=> bm!39251 (= call!39255 ($colon$colon!548 e!493510 (ite c!93515 (h!18800 (t!24950 (t!24950 l!906))) (tuple2!11909 key1!49 v2!16))))))

(declare-fun c!93516 () Bool)

(assert (=> bm!39251 (= c!93516 c!93515)))

(declare-fun b!886558 () Bool)

(assert (=> b!886558 (= e!493510 (insertStrictlySorted!299 (t!24950 (t!24950 (t!24950 l!906))) key1!49 v2!16))))

(declare-fun b!886559 () Bool)

(declare-fun c!93518 () Bool)

(assert (=> b!886559 (= c!93518 (and (is-Cons!17669 (t!24950 (t!24950 l!906))) (bvsgt (_1!5965 (h!18800 (t!24950 (t!24950 l!906)))) key1!49)))))

(declare-fun e!493509 () List!17673)

(assert (=> b!886559 (= e!493512 e!493509)))

(declare-fun b!886560 () Bool)

(declare-fun call!39254 () List!17673)

(assert (=> b!886560 (= e!493509 call!39254)))

(declare-fun b!886561 () Bool)

(assert (=> b!886561 (= e!493510 (ite c!93517 (t!24950 (t!24950 (t!24950 l!906))) (ite c!93518 (Cons!17669 (h!18800 (t!24950 (t!24950 l!906))) (t!24950 (t!24950 (t!24950 l!906)))) Nil!17670)))))

(declare-fun b!886562 () Bool)

(declare-fun res!601840 () Bool)

(assert (=> b!886562 (=> (not res!601840) (not e!493508))))

(assert (=> b!886562 (= res!601840 (containsKey!413 lt!401139 key1!49))))

(declare-fun bm!39252 () Bool)

(declare-fun call!39256 () List!17673)

(assert (=> bm!39252 (= call!39254 call!39256)))

(declare-fun b!886563 () Bool)

(assert (=> b!886563 (= e!493509 call!39254)))

(declare-fun bm!39253 () Bool)

(assert (=> bm!39253 (= call!39256 call!39255)))

(declare-fun b!886564 () Bool)

(assert (=> b!886564 (= e!493512 call!39256)))

(assert (= (and d!109715 c!93515) b!886555))

(assert (= (and d!109715 (not c!93515)) b!886556))

(assert (= (and b!886556 c!93517) b!886564))

(assert (= (and b!886556 (not c!93517)) b!886559))

(assert (= (and b!886559 c!93518) b!886563))

(assert (= (and b!886559 (not c!93518)) b!886560))

(assert (= (or b!886563 b!886560) bm!39252))

(assert (= (or b!886564 bm!39252) bm!39253))

(assert (= (or b!886555 bm!39253) bm!39251))

(assert (= (and bm!39251 c!93516) b!886558))

(assert (= (and bm!39251 (not c!93516)) b!886561))

(assert (= (and d!109715 res!601841) b!886562))

(assert (= (and b!886562 res!601840) b!886557))

(declare-fun m!826439 () Bool)

(assert (=> b!886558 m!826439))

(declare-fun m!826441 () Bool)

(assert (=> b!886557 m!826441))

(declare-fun m!826443 () Bool)

(assert (=> bm!39251 m!826443))

(declare-fun m!826445 () Bool)

(assert (=> d!109715 m!826445))

(assert (=> d!109715 m!825979))

(declare-fun m!826447 () Bool)

(assert (=> b!886562 m!826447))

(assert (=> b!886271 d!109715))

(assert (=> b!886047 d!109511))

(declare-fun d!109717 () Bool)

(declare-fun res!601842 () Bool)

(declare-fun e!493513 () Bool)

(assert (=> d!109717 (=> res!601842 e!493513)))

(assert (=> d!109717 (= res!601842 (and (is-Cons!17669 lt!401103) (= (_1!5965 (h!18800 lt!401103)) key1!49)))))

(assert (=> d!109717 (= (containsKey!413 lt!401103 key1!49) e!493513)))

(declare-fun b!886565 () Bool)

(declare-fun e!493514 () Bool)

(assert (=> b!886565 (= e!493513 e!493514)))

(declare-fun res!601843 () Bool)

(assert (=> b!886565 (=> (not res!601843) (not e!493514))))

(assert (=> b!886565 (= res!601843 (and (or (not (is-Cons!17669 lt!401103)) (bvsle (_1!5965 (h!18800 lt!401103)) key1!49)) (is-Cons!17669 lt!401103) (bvslt (_1!5965 (h!18800 lt!401103)) key1!49)))))

(declare-fun b!886566 () Bool)

(assert (=> b!886566 (= e!493514 (containsKey!413 (t!24950 lt!401103) key1!49))))

(assert (= (and d!109717 (not res!601842)) b!886565))

(assert (= (and b!886565 res!601843) b!886566))

(declare-fun m!826449 () Bool)

(assert (=> b!886566 m!826449))

(assert (=> b!886264 d!109717))

(declare-fun d!109719 () Bool)

(declare-fun res!601844 () Bool)

(declare-fun e!493515 () Bool)

(assert (=> d!109719 (=> res!601844 e!493515)))

(assert (=> d!109719 (= res!601844 (and (is-Cons!17669 lt!401102) (= (_1!5965 (h!18800 lt!401102)) key1!49)))))

(assert (=> d!109719 (= (containsKey!413 lt!401102 key1!49) e!493515)))

(declare-fun b!886567 () Bool)

(declare-fun e!493516 () Bool)

(assert (=> b!886567 (= e!493515 e!493516)))

(declare-fun res!601845 () Bool)

(assert (=> b!886567 (=> (not res!601845) (not e!493516))))

(assert (=> b!886567 (= res!601845 (and (or (not (is-Cons!17669 lt!401102)) (bvsle (_1!5965 (h!18800 lt!401102)) key1!49)) (is-Cons!17669 lt!401102) (bvslt (_1!5965 (h!18800 lt!401102)) key1!49)))))

(declare-fun b!886568 () Bool)

(assert (=> b!886568 (= e!493516 (containsKey!413 (t!24950 lt!401102) key1!49))))

(assert (= (and d!109719 (not res!601844)) b!886567))

(assert (= (and b!886567 res!601845) b!886568))

(declare-fun m!826451 () Bool)

(assert (=> b!886568 m!826451))

(assert (=> b!886248 d!109719))

(declare-fun lt!401140 () Bool)

(declare-fun d!109721 () Bool)

(assert (=> d!109721 (= lt!401140 (member (tuple2!11909 key1!49 v1!38) (content!396 lt!401107)))))

(declare-fun e!493517 () Bool)

(assert (=> d!109721 (= lt!401140 e!493517)))

(declare-fun res!601846 () Bool)

(assert (=> d!109721 (=> (not res!601846) (not e!493517))))

(assert (=> d!109721 (= res!601846 (is-Cons!17669 lt!401107))))

(assert (=> d!109721 (= (contains!4297 lt!401107 (tuple2!11909 key1!49 v1!38)) lt!401140)))

(declare-fun b!886569 () Bool)

(declare-fun e!493518 () Bool)

(assert (=> b!886569 (= e!493517 e!493518)))

(declare-fun res!601847 () Bool)

(assert (=> b!886569 (=> res!601847 e!493518)))

(assert (=> b!886569 (= res!601847 (= (h!18800 lt!401107) (tuple2!11909 key1!49 v1!38)))))

(declare-fun b!886570 () Bool)

(assert (=> b!886570 (= e!493518 (contains!4297 (t!24950 lt!401107) (tuple2!11909 key1!49 v1!38)))))

(assert (= (and d!109721 res!601846) b!886569))

(assert (= (and b!886569 (not res!601847)) b!886570))

(declare-fun m!826453 () Bool)

(assert (=> d!109721 m!826453))

(declare-fun m!826455 () Bool)

(assert (=> d!109721 m!826455))

(declare-fun m!826457 () Bool)

(assert (=> b!886570 m!826457))

(assert (=> b!886300 d!109721))

(assert (=> d!109513 d!109515))

(assert (=> d!109513 d!109511))

(assert (=> d!109513 d!109543))

(assert (=> d!109513 d!109545))

(declare-fun d!109723 () Bool)

(assert (=> d!109723 (= (insertStrictlySorted!299 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!299 (t!24950 l!906) key1!49 v2!16))))

(assert (=> d!109723 true))

(declare-fun _$8!139 () Unit!30244)

(assert (=> d!109723 (= (choose!1452 (t!24950 l!906) key1!49 v1!38 v2!16) _$8!139)))

(declare-fun bs!24854 () Bool)

(assert (= bs!24854 d!109723))

(assert (=> bs!24854 m!825957))

(assert (=> bs!24854 m!825957))

(assert (=> bs!24854 m!825959))

(assert (=> bs!24854 m!825967))

(assert (=> d!109513 d!109723))

(declare-fun d!109725 () Bool)

(assert (=> d!109725 (= ($colon$colon!548 e!493315 (ite c!93467 (h!18800 l!906) (tuple2!11909 key1!49 v1!38))) (Cons!17669 (ite c!93467 (h!18800 l!906) (tuple2!11909 key1!49 v1!38)) e!493315))))

(assert (=> bm!39215 d!109725))

(declare-fun d!109727 () Bool)

(declare-fun res!601848 () Bool)

(declare-fun e!493519 () Bool)

(assert (=> d!109727 (=> res!601848 e!493519)))

(assert (=> d!109727 (= res!601848 (or (is-Nil!17670 lt!401102) (is-Nil!17670 (t!24950 lt!401102))))))

(assert (=> d!109727 (= (isStrictlySorted!491 lt!401102) e!493519)))

(declare-fun b!886571 () Bool)

(declare-fun e!493520 () Bool)

(assert (=> b!886571 (= e!493519 e!493520)))

(declare-fun res!601849 () Bool)

(assert (=> b!886571 (=> (not res!601849) (not e!493520))))

(assert (=> b!886571 (= res!601849 (bvslt (_1!5965 (h!18800 lt!401102)) (_1!5965 (h!18800 (t!24950 lt!401102)))))))

(declare-fun b!886572 () Bool)

(assert (=> b!886572 (= e!493520 (isStrictlySorted!491 (t!24950 lt!401102)))))

(assert (= (and d!109727 (not res!601848)) b!886571))

(assert (= (and b!886571 res!601849) b!886572))

(declare-fun m!826459 () Bool)

(assert (=> b!886572 m!826459))

(assert (=> d!109515 d!109727))

(declare-fun d!109729 () Bool)

(declare-fun res!601850 () Bool)

(declare-fun e!493521 () Bool)

(assert (=> d!109729 (=> res!601850 e!493521)))

(assert (=> d!109729 (= res!601850 (or (is-Nil!17670 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38)) (is-Nil!17670 (t!24950 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38)))))))

(assert (=> d!109729 (= (isStrictlySorted!491 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38)) e!493521)))

(declare-fun b!886573 () Bool)

(declare-fun e!493522 () Bool)

(assert (=> b!886573 (= e!493521 e!493522)))

(declare-fun res!601851 () Bool)

(assert (=> b!886573 (=> (not res!601851) (not e!493522))))

(assert (=> b!886573 (= res!601851 (bvslt (_1!5965 (h!18800 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38))) (_1!5965 (h!18800 (t!24950 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38))))))))

(declare-fun b!886574 () Bool)

(assert (=> b!886574 (= e!493522 (isStrictlySorted!491 (t!24950 (insertStrictlySorted!299 (t!24950 l!906) key1!49 v1!38))))))

(assert (= (and d!109729 (not res!601850)) b!886573))

(assert (= (and b!886573 res!601851) b!886574))

(assert (=> b!886574 m!826409))

(assert (=> d!109515 d!109729))

(assert (=> b!886301 d!109545))

(declare-fun lt!401141 () Bool)

(declare-fun d!109731 () Bool)

(assert (=> d!109731 (= lt!401141 (member (tuple2!11909 key1!49 v2!16) (content!396 lt!401106)))))

(declare-fun e!493523 () Bool)

(assert (=> d!109731 (= lt!401141 e!493523)))

(declare-fun res!601852 () Bool)

(assert (=> d!109731 (=> (not res!601852) (not e!493523))))

(assert (=> d!109731 (= res!601852 (is-Cons!17669 lt!401106))))

(assert (=> d!109731 (= (contains!4297 lt!401106 (tuple2!11909 key1!49 v2!16)) lt!401141)))

(declare-fun b!886575 () Bool)

(declare-fun e!493524 () Bool)

(assert (=> b!886575 (= e!493523 e!493524)))

(declare-fun res!601853 () Bool)

(assert (=> b!886575 (=> res!601853 e!493524)))

(assert (=> b!886575 (= res!601853 (= (h!18800 lt!401106) (tuple2!11909 key1!49 v2!16)))))

(declare-fun b!886576 () Bool)

(assert (=> b!886576 (= e!493524 (contains!4297 (t!24950 lt!401106) (tuple2!11909 key1!49 v2!16)))))

(assert (= (and d!109731 res!601852) b!886575))

(assert (= (and b!886575 (not res!601853)) b!886576))

(declare-fun m!826461 () Bool)

(assert (=> d!109731 m!826461))

(declare-fun m!826463 () Bool)

(assert (=> d!109731 m!826463))

(declare-fun m!826465 () Bool)

(assert (=> b!886576 m!826465))

(assert (=> b!886290 d!109731))

(declare-fun d!109733 () Bool)

(declare-fun res!601854 () Bool)

(declare-fun e!493525 () Bool)

(assert (=> d!109733 (=> res!601854 e!493525)))

(assert (=> d!109733 (= res!601854 (or (is-Nil!17670 lt!401107) (is-Nil!17670 (t!24950 lt!401107))))))

(assert (=> d!109733 (= (isStrictlySorted!491 lt!401107) e!493525)))

(declare-fun b!886577 () Bool)

(declare-fun e!493526 () Bool)

(assert (=> b!886577 (= e!493525 e!493526)))

(declare-fun res!601855 () Bool)

(assert (=> b!886577 (=> (not res!601855) (not e!493526))))

(assert (=> b!886577 (= res!601855 (bvslt (_1!5965 (h!18800 lt!401107)) (_1!5965 (h!18800 (t!24950 lt!401107)))))))

(declare-fun b!886578 () Bool)

(assert (=> b!886578 (= e!493526 (isStrictlySorted!491 (t!24950 lt!401107)))))

(assert (= (and d!109733 (not res!601854)) b!886577))

(assert (= (and b!886577 res!601855) b!886578))

(declare-fun m!826467 () Bool)

(assert (=> b!886578 m!826467))

(assert (=> d!109549 d!109733))

(assert (=> d!109549 d!109507))

(declare-fun d!109735 () Bool)

(assert (=> d!109735 (= ($colon$colon!548 e!493310 (ite c!93463 (h!18800 l!906) (tuple2!11909 key1!49 v2!16))) (Cons!17669 (ite c!93463 (h!18800 l!906) (tuple2!11909 key1!49 v2!16)) e!493310))))

(assert (=> bm!39212 d!109735))

(declare-fun d!109737 () Bool)

(declare-fun lt!401142 () Bool)

(assert (=> d!109737 (= lt!401142 (member (tuple2!11909 key1!49 v2!16) (content!396 lt!401103)))))

(declare-fun e!493527 () Bool)

(assert (=> d!109737 (= lt!401142 e!493527)))

(declare-fun res!601856 () Bool)

(assert (=> d!109737 (=> (not res!601856) (not e!493527))))

(assert (=> d!109737 (= res!601856 (is-Cons!17669 lt!401103))))

(assert (=> d!109737 (= (contains!4297 lt!401103 (tuple2!11909 key1!49 v2!16)) lt!401142)))

(declare-fun b!886579 () Bool)

(declare-fun e!493528 () Bool)

(assert (=> b!886579 (= e!493527 e!493528)))

(declare-fun res!601857 () Bool)

(assert (=> b!886579 (=> res!601857 e!493528)))

(assert (=> b!886579 (= res!601857 (= (h!18800 lt!401103) (tuple2!11909 key1!49 v2!16)))))

(declare-fun b!886580 () Bool)

(assert (=> b!886580 (= e!493528 (contains!4297 (t!24950 lt!401103) (tuple2!11909 key1!49 v2!16)))))

(assert (= (and d!109737 res!601856) b!886579))

(assert (= (and b!886579 (not res!601857)) b!886580))

(declare-fun m!826469 () Bool)

(assert (=> d!109737 m!826469))

(declare-fun m!826471 () Bool)

(assert (=> d!109737 m!826471))

(declare-fun m!826473 () Bool)

(assert (=> b!886580 m!826473))

(assert (=> b!886259 d!109737))

(declare-fun lt!401143 () Bool)

(declare-fun d!109739 () Bool)

(assert (=> d!109739 (= lt!401143 (member (tuple2!11909 key1!49 v2!16) (content!396 lt!401102)))))

(declare-fun e!493529 () Bool)

(assert (=> d!109739 (= lt!401143 e!493529)))

(declare-fun res!601858 () Bool)

(assert (=> d!109739 (=> (not res!601858) (not e!493529))))

(assert (=> d!109739 (= res!601858 (is-Cons!17669 lt!401102))))

(assert (=> d!109739 (= (contains!4297 lt!401102 (tuple2!11909 key1!49 v2!16)) lt!401143)))

(declare-fun b!886581 () Bool)

(declare-fun e!493530 () Bool)

(assert (=> b!886581 (= e!493529 e!493530)))

(declare-fun res!601859 () Bool)

(assert (=> b!886581 (=> res!601859 e!493530)))

(assert (=> b!886581 (= res!601859 (= (h!18800 lt!401102) (tuple2!11909 key1!49 v2!16)))))

(declare-fun b!886582 () Bool)

(assert (=> b!886582 (= e!493530 (contains!4297 (t!24950 lt!401102) (tuple2!11909 key1!49 v2!16)))))

(assert (= (and d!109739 res!601858) b!886581))

(assert (= (and b!886581 (not res!601859)) b!886582))

(declare-fun m!826475 () Bool)

(assert (=> d!109739 m!826475))

(declare-fun m!826477 () Bool)

(assert (=> d!109739 m!826477))

(declare-fun m!826479 () Bool)

(assert (=> b!886582 m!826479))

(assert (=> b!886243 d!109739))

(declare-fun d!109741 () Bool)

(declare-fun res!601860 () Bool)

(declare-fun e!493531 () Bool)

(assert (=> d!109741 (=> res!601860 e!493531)))

(assert (=> d!109741 (= res!601860 (or (is-Nil!17670 (t!24950 (t!24950 l!906))) (is-Nil!17670 (t!24950 (t!24950 (t!24950 l!906))))))))

(assert (=> d!109741 (= (isStrictlySorted!491 (t!24950 (t!24950 l!906))) e!493531)))

(declare-fun b!886583 () Bool)

(declare-fun e!493532 () Bool)

(assert (=> b!886583 (= e!493531 e!493532)))

(declare-fun res!601861 () Bool)

(assert (=> b!886583 (=> (not res!601861) (not e!493532))))

(assert (=> b!886583 (= res!601861 (bvslt (_1!5965 (h!18800 (t!24950 (t!24950 l!906)))) (_1!5965 (h!18800 (t!24950 (t!24950 (t!24950 l!906)))))))))

(declare-fun b!886584 () Bool)

(assert (=> b!886584 (= e!493532 (isStrictlySorted!491 (t!24950 (t!24950 (t!24950 l!906)))))))

(assert (= (and d!109741 (not res!601860)) b!886583))

(assert (= (and b!886583 res!601861) b!886584))

(declare-fun m!826481 () Bool)

(assert (=> b!886584 m!826481))

(assert (=> b!886049 d!109741))

(declare-fun b!886585 () Bool)

(declare-fun e!493533 () Bool)

(declare-fun tp!54383 () Bool)

(assert (=> b!886585 (= e!493533 (and tp_is_empty!17813 tp!54383))))

(assert (=> b!886312 (= tp!54380 e!493533)))

(assert (= (and b!886312 (is-Cons!17669 (t!24950 (t!24950 l!906)))) b!886585))

(push 1)

(assert (not d!109731))

(assert (not b!886558))

(assert (not b!886502))

(assert (not d!109737))

(assert (not b!886514))

(assert (not b!886574))

(assert (not b!886584))

(assert (not b!886534))

(assert (not b!886523))

(assert (not b!886510))

(assert (not b!886566))

(assert (not bm!39242))

(assert (not b!886568))

(assert (not b!886554))

(assert (not b!886552))

(assert (not d!109739))

(assert (not b!886540))

(assert (not b!886548))

(assert (not b!886518))

(assert (not d!109707))

(assert (not d!109721))

(assert (not b!886578))

(assert (not bm!39251))

(assert (not b!886570))

(assert (not d!109723))

(assert (not bm!39245))

(assert (not b!886562))

(assert (not b!886543))

(assert (not b!886582))

(assert (not d!109715))

(assert (not b!886536))

(assert tp_is_empty!17813)

(assert (not b!886572))

(assert (not bm!39248))

(assert (not b!886557))

(assert (not d!109691))

(assert (not b!886524))

(assert (not d!109701))

(assert (not b!886544))

(assert (not b!886576))

(assert (not b!886513))

(assert (not b!886585))

(assert (not b!886538))

(assert (not b!886532))

(assert (not b!886504))

(assert (not b!886528))

(assert (not d!109693))

(assert (not b!886580))

(assert (not d!109689))

(assert (not b!886496))

(check-sat)

(pop 1)

(push 1)

(check-sat)

