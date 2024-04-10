; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2090 () Bool)

(assert start!2090)

(declare-fun b!14113 () Bool)

(assert (=> b!14113 true))

(declare-fun b!14109 () Bool)

(declare-fun e!8420 () Bool)

(declare-fun tp_is_empty!717 () Bool)

(declare-fun tp!2306 () Bool)

(assert (=> b!14109 (= e!8420 (and tp_is_empty!717 tp!2306))))

(declare-fun res!10989 () Bool)

(declare-fun e!8422 () Bool)

(assert (=> start!2090 (=> (not res!10989) (not e!8422))))

(declare-datatypes ((B!538 0))(
  ( (B!539 (val!367 Int)) )
))
(declare-datatypes ((tuple2!534 0))(
  ( (tuple2!535 (_1!267 (_ BitVec 64)) (_2!267 B!538)) )
))
(declare-datatypes ((List!422 0))(
  ( (Nil!419) (Cons!418 (h!984 tuple2!534) (t!2818 List!422)) )
))
(declare-fun l!522 () List!422)

(declare-fun isStrictlySorted!109 (List!422) Bool)

(assert (=> start!2090 (= res!10989 (isStrictlySorted!109 l!522))))

(assert (=> start!2090 e!8422))

(assert (=> start!2090 e!8420))

(assert (=> start!2090 tp_is_empty!717))

(declare-fun b!14110 () Bool)

(declare-fun e!8421 () Bool)

(declare-fun lt!3579 () List!422)

(declare-fun head!789 (List!422) tuple2!534)

(assert (=> b!14110 (= e!8421 (bvslt (_1!267 (head!789 lt!3579)) (_1!267 (head!789 l!522))))))

(declare-fun b!14111 () Bool)

(declare-fun res!10992 () Bool)

(assert (=> b!14111 (=> (not res!10992) (not e!8422))))

(declare-fun value!159 () B!538)

(get-info :version)

(assert (=> b!14111 (= res!10992 (and ((_ is Cons!418) l!522) (= (_2!267 (h!984 l!522)) value!159)))))

(declare-fun b!14112 () Bool)

(declare-fun e!8423 () Bool)

(declare-fun e!8419 () Bool)

(assert (=> b!14112 (= e!8423 e!8419)))

(declare-fun c!1295 () Bool)

(declare-fun isEmpty!100 (List!422) Bool)

(assert (=> b!14112 (= c!1295 (isEmpty!100 l!522))))

(declare-fun res!10991 () Bool)

(assert (=> b!14113 (=> res!10991 e!8423)))

(declare-fun lambda!137 () Int)

(declare-fun forall!93 (List!422 Int) Bool)

(assert (=> b!14113 (= res!10991 (not (forall!93 lt!3579 lambda!137)))))

(declare-fun bm!386 () Bool)

(declare-fun call!389 () Bool)

(assert (=> bm!386 (= call!389 (isEmpty!100 lt!3579))))

(declare-fun b!14114 () Bool)

(assert (=> b!14114 (= e!8419 e!8421)))

(declare-fun res!10993 () Bool)

(assert (=> b!14114 (= res!10993 (not call!389))))

(assert (=> b!14114 (=> (not res!10993) (not e!8421))))

(declare-fun b!14115 () Bool)

(assert (=> b!14115 (= e!8419 (not call!389))))

(declare-fun b!14116 () Bool)

(assert (=> b!14116 (= e!8422 e!8423)))

(declare-fun res!10990 () Bool)

(assert (=> b!14116 (=> res!10990 e!8423)))

(assert (=> b!14116 (= res!10990 (not (isStrictlySorted!109 lt!3579)))))

(declare-fun $colon$colon!19 (List!422 tuple2!534) List!422)

(declare-fun filterByValue!14 (List!422 B!538) List!422)

(assert (=> b!14116 (= lt!3579 ($colon$colon!19 (filterByValue!14 (t!2818 l!522) value!159) (h!984 l!522)))))

(assert (= (and start!2090 res!10989) b!14111))

(assert (= (and b!14111 res!10992) b!14116))

(assert (= (and b!14116 (not res!10990)) b!14113))

(assert (= (and b!14113 (not res!10991)) b!14112))

(assert (= (and b!14112 c!1295) b!14115))

(assert (= (and b!14112 (not c!1295)) b!14114))

(assert (= (and b!14114 res!10993) b!14110))

(assert (= (or b!14115 b!14114) bm!386))

(assert (= (and start!2090 ((_ is Cons!418) l!522)) b!14109))

(declare-fun m!9413 () Bool)

(assert (=> b!14116 m!9413))

(declare-fun m!9415 () Bool)

(assert (=> b!14116 m!9415))

(assert (=> b!14116 m!9415))

(declare-fun m!9417 () Bool)

(assert (=> b!14116 m!9417))

(declare-fun m!9419 () Bool)

(assert (=> start!2090 m!9419))

(declare-fun m!9421 () Bool)

(assert (=> bm!386 m!9421))

(declare-fun m!9423 () Bool)

(assert (=> b!14110 m!9423))

(declare-fun m!9425 () Bool)

(assert (=> b!14110 m!9425))

(declare-fun m!9427 () Bool)

(assert (=> b!14112 m!9427))

(declare-fun m!9429 () Bool)

(assert (=> b!14113 m!9429))

(check-sat (not start!2090) (not b!14109) (not bm!386) (not b!14113) tp_is_empty!717 (not b!14110) (not b!14116) (not b!14112))
(check-sat)
(get-model)

(declare-fun d!2101 () Bool)

(assert (=> d!2101 (= (isEmpty!100 lt!3579) ((_ is Nil!419) lt!3579))))

(assert (=> bm!386 d!2101))

(declare-fun d!2103 () Bool)

(declare-fun res!11013 () Bool)

(declare-fun e!8443 () Bool)

(assert (=> d!2103 (=> res!11013 e!8443)))

(assert (=> d!2103 (= res!11013 ((_ is Nil!419) lt!3579))))

(assert (=> d!2103 (= (forall!93 lt!3579 lambda!137) e!8443)))

(declare-fun b!14149 () Bool)

(declare-fun e!8444 () Bool)

(assert (=> b!14149 (= e!8443 e!8444)))

(declare-fun res!11014 () Bool)

(assert (=> b!14149 (=> (not res!11014) (not e!8444))))

(declare-fun dynLambda!88 (Int tuple2!534) Bool)

(assert (=> b!14149 (= res!11014 (dynLambda!88 lambda!137 (h!984 lt!3579)))))

(declare-fun b!14150 () Bool)

(assert (=> b!14150 (= e!8444 (forall!93 (t!2818 lt!3579) lambda!137))))

(assert (= (and d!2103 (not res!11013)) b!14149))

(assert (= (and b!14149 res!11014) b!14150))

(declare-fun b_lambda!887 () Bool)

(assert (=> (not b_lambda!887) (not b!14149)))

(declare-fun m!9449 () Bool)

(assert (=> b!14149 m!9449))

(declare-fun m!9451 () Bool)

(assert (=> b!14150 m!9451))

(assert (=> b!14113 d!2103))

(declare-fun d!2107 () Bool)

(assert (=> d!2107 (= (isEmpty!100 l!522) ((_ is Nil!419) l!522))))

(assert (=> b!14112 d!2107))

(declare-fun d!2109 () Bool)

(declare-fun res!11029 () Bool)

(declare-fun e!8459 () Bool)

(assert (=> d!2109 (=> res!11029 e!8459)))

(assert (=> d!2109 (= res!11029 (or ((_ is Nil!419) lt!3579) ((_ is Nil!419) (t!2818 lt!3579))))))

(assert (=> d!2109 (= (isStrictlySorted!109 lt!3579) e!8459)))

(declare-fun b!14165 () Bool)

(declare-fun e!8460 () Bool)

(assert (=> b!14165 (= e!8459 e!8460)))

(declare-fun res!11030 () Bool)

(assert (=> b!14165 (=> (not res!11030) (not e!8460))))

(assert (=> b!14165 (= res!11030 (bvslt (_1!267 (h!984 lt!3579)) (_1!267 (h!984 (t!2818 lt!3579)))))))

(declare-fun b!14166 () Bool)

(assert (=> b!14166 (= e!8460 (isStrictlySorted!109 (t!2818 lt!3579)))))

(assert (= (and d!2109 (not res!11029)) b!14165))

(assert (= (and b!14165 res!11030) b!14166))

(declare-fun m!9457 () Bool)

(assert (=> b!14166 m!9457))

(assert (=> b!14116 d!2109))

(declare-fun d!2117 () Bool)

(assert (=> d!2117 (= ($colon$colon!19 (filterByValue!14 (t!2818 l!522) value!159) (h!984 l!522)) (Cons!418 (h!984 l!522) (filterByValue!14 (t!2818 l!522) value!159)))))

(assert (=> b!14116 d!2117))

(declare-fun bs!555 () Bool)

(declare-fun b!14236 () Bool)

(assert (= bs!555 (and b!14236 b!14113)))

(declare-fun lambda!145 () Int)

(assert (=> bs!555 (= lambda!145 lambda!137)))

(assert (=> b!14236 true))

(declare-fun d!2119 () Bool)

(declare-fun e!8503 () Bool)

(assert (=> d!2119 e!8503))

(declare-fun res!11063 () Bool)

(assert (=> d!2119 (=> (not res!11063) (not e!8503))))

(declare-fun lt!3589 () List!422)

(assert (=> d!2119 (= res!11063 (isStrictlySorted!109 lt!3589))))

(declare-fun e!8506 () List!422)

(assert (=> d!2119 (= lt!3589 e!8506)))

(declare-fun c!1316 () Bool)

(assert (=> d!2119 (= c!1316 (and ((_ is Cons!418) (t!2818 l!522)) (= (_2!267 (h!984 (t!2818 l!522))) value!159)))))

(assert (=> d!2119 (isStrictlySorted!109 (t!2818 l!522))))

(assert (=> d!2119 (= (filterByValue!14 (t!2818 l!522) value!159) lt!3589)))

(declare-fun b!14229 () Bool)

(declare-fun e!8505 () List!422)

(declare-fun call!402 () List!422)

(assert (=> b!14229 (= e!8505 call!402)))

(declare-fun b!14230 () Bool)

(declare-fun e!8504 () Bool)

(assert (=> b!14230 (= e!8503 e!8504)))

(declare-fun c!1317 () Bool)

(assert (=> b!14230 (= c!1317 (isEmpty!100 (t!2818 l!522)))))

(declare-fun b!14231 () Bool)

(assert (=> b!14231 (= e!8505 Nil!419)))

(declare-fun b!14232 () Bool)

(declare-fun e!8507 () Bool)

(assert (=> b!14232 (= e!8504 e!8507)))

(declare-fun res!11062 () Bool)

(declare-fun call!401 () Bool)

(assert (=> b!14232 (= res!11062 call!401)))

(assert (=> b!14232 (=> res!11062 e!8507)))

(declare-fun b!14233 () Bool)

(assert (=> b!14233 (= e!8507 (bvsge (_1!267 (head!789 lt!3589)) (_1!267 (head!789 (t!2818 l!522)))))))

(declare-fun b!14234 () Bool)

(assert (=> b!14234 (= e!8506 ($colon$colon!19 call!402 (h!984 (t!2818 l!522))))))

(declare-fun b!14235 () Bool)

(assert (=> b!14235 (= e!8506 e!8505)))

(declare-fun c!1315 () Bool)

(assert (=> b!14235 (= c!1315 (and ((_ is Cons!418) (t!2818 l!522)) (not (= (_2!267 (h!984 (t!2818 l!522))) value!159))))))

(declare-fun res!11061 () Bool)

(assert (=> b!14236 (=> (not res!11061) (not e!8503))))

(assert (=> b!14236 (= res!11061 (forall!93 lt!3589 lambda!145))))

(declare-fun bm!396 () Bool)

(assert (=> bm!396 (= call!402 (filterByValue!14 (t!2818 (t!2818 l!522)) value!159))))

(declare-fun b!14237 () Bool)

(assert (=> b!14237 (= e!8504 call!401)))

(declare-fun bm!398 () Bool)

(assert (=> bm!398 (= call!401 (isEmpty!100 lt!3589))))

(assert (= (and d!2119 c!1316) b!14234))

(assert (= (and d!2119 (not c!1316)) b!14235))

(assert (= (and b!14235 c!1315) b!14229))

(assert (= (and b!14235 (not c!1315)) b!14231))

(assert (= (or b!14234 b!14229) bm!396))

(assert (= (and d!2119 res!11063) b!14236))

(assert (= (and b!14236 res!11061) b!14230))

(assert (= (and b!14230 c!1317) b!14237))

(assert (= (and b!14230 (not c!1317)) b!14232))

(assert (= (and b!14232 (not res!11062)) b!14233))

(assert (= (or b!14237 b!14232) bm!398))

(declare-fun m!9471 () Bool)

(assert (=> b!14233 m!9471))

(declare-fun m!9473 () Bool)

(assert (=> b!14233 m!9473))

(declare-fun m!9475 () Bool)

(assert (=> bm!398 m!9475))

(declare-fun m!9477 () Bool)

(assert (=> bm!396 m!9477))

(declare-fun m!9479 () Bool)

(assert (=> d!2119 m!9479))

(declare-fun m!9481 () Bool)

(assert (=> d!2119 m!9481))

(declare-fun m!9483 () Bool)

(assert (=> b!14236 m!9483))

(declare-fun m!9485 () Bool)

(assert (=> b!14230 m!9485))

(declare-fun m!9487 () Bool)

(assert (=> b!14234 m!9487))

(assert (=> b!14116 d!2119))

(declare-fun d!2147 () Bool)

(declare-fun res!11068 () Bool)

(declare-fun e!8512 () Bool)

(assert (=> d!2147 (=> res!11068 e!8512)))

(assert (=> d!2147 (= res!11068 (or ((_ is Nil!419) l!522) ((_ is Nil!419) (t!2818 l!522))))))

(assert (=> d!2147 (= (isStrictlySorted!109 l!522) e!8512)))

(declare-fun b!14246 () Bool)

(declare-fun e!8513 () Bool)

(assert (=> b!14246 (= e!8512 e!8513)))

(declare-fun res!11069 () Bool)

(assert (=> b!14246 (=> (not res!11069) (not e!8513))))

(assert (=> b!14246 (= res!11069 (bvslt (_1!267 (h!984 l!522)) (_1!267 (h!984 (t!2818 l!522)))))))

(declare-fun b!14247 () Bool)

(assert (=> b!14247 (= e!8513 (isStrictlySorted!109 (t!2818 l!522)))))

(assert (= (and d!2147 (not res!11068)) b!14246))

(assert (= (and b!14246 res!11069) b!14247))

(assert (=> b!14247 m!9481))

(assert (=> start!2090 d!2147))

(declare-fun d!2149 () Bool)

(assert (=> d!2149 (= (head!789 lt!3579) (h!984 lt!3579))))

(assert (=> b!14110 d!2149))

(declare-fun d!2151 () Bool)

(assert (=> d!2151 (= (head!789 l!522) (h!984 l!522))))

(assert (=> b!14110 d!2151))

(declare-fun b!14263 () Bool)

(declare-fun e!8523 () Bool)

(declare-fun tp!2312 () Bool)

(assert (=> b!14263 (= e!8523 (and tp_is_empty!717 tp!2312))))

(assert (=> b!14109 (= tp!2306 e!8523)))

(assert (= (and b!14109 ((_ is Cons!418) (t!2818 l!522))) b!14263))

(declare-fun b_lambda!893 () Bool)

(assert (= b_lambda!887 (or b!14113 b_lambda!893)))

(declare-fun bs!557 () Bool)

(declare-fun d!2153 () Bool)

(assert (= bs!557 (and d!2153 b!14113)))

(assert (=> bs!557 (= (dynLambda!88 lambda!137 (h!984 lt!3579)) (= (_2!267 (h!984 lt!3579)) value!159))))

(assert (=> b!14149 d!2153))

(check-sat (not bm!398) (not d!2119) (not b!14150) (not b!14263) (not b!14234) (not b_lambda!893) (not b!14166) (not b!14247) (not b!14236) (not b!14233) tp_is_empty!717 (not bm!396) (not b!14230))
(check-sat)
(get-model)

(declare-fun d!2161 () Bool)

(declare-fun res!11078 () Bool)

(declare-fun e!8535 () Bool)

(assert (=> d!2161 (=> res!11078 e!8535)))

(assert (=> d!2161 (= res!11078 (or ((_ is Nil!419) (t!2818 l!522)) ((_ is Nil!419) (t!2818 (t!2818 l!522)))))))

(assert (=> d!2161 (= (isStrictlySorted!109 (t!2818 l!522)) e!8535)))

(declare-fun b!14283 () Bool)

(declare-fun e!8536 () Bool)

(assert (=> b!14283 (= e!8535 e!8536)))

(declare-fun res!11079 () Bool)

(assert (=> b!14283 (=> (not res!11079) (not e!8536))))

(assert (=> b!14283 (= res!11079 (bvslt (_1!267 (h!984 (t!2818 l!522))) (_1!267 (h!984 (t!2818 (t!2818 l!522))))))))

(declare-fun b!14284 () Bool)

(assert (=> b!14284 (= e!8536 (isStrictlySorted!109 (t!2818 (t!2818 l!522))))))

(assert (= (and d!2161 (not res!11078)) b!14283))

(assert (= (and b!14283 res!11079) b!14284))

(declare-fun m!9521 () Bool)

(assert (=> b!14284 m!9521))

(assert (=> b!14247 d!2161))

(declare-fun d!2163 () Bool)

(declare-fun res!11080 () Bool)

(declare-fun e!8537 () Bool)

(assert (=> d!2163 (=> res!11080 e!8537)))

(assert (=> d!2163 (= res!11080 (or ((_ is Nil!419) lt!3589) ((_ is Nil!419) (t!2818 lt!3589))))))

(assert (=> d!2163 (= (isStrictlySorted!109 lt!3589) e!8537)))

(declare-fun b!14285 () Bool)

(declare-fun e!8538 () Bool)

(assert (=> b!14285 (= e!8537 e!8538)))

(declare-fun res!11081 () Bool)

(assert (=> b!14285 (=> (not res!11081) (not e!8538))))

(assert (=> b!14285 (= res!11081 (bvslt (_1!267 (h!984 lt!3589)) (_1!267 (h!984 (t!2818 lt!3589)))))))

(declare-fun b!14286 () Bool)

(assert (=> b!14286 (= e!8538 (isStrictlySorted!109 (t!2818 lt!3589)))))

(assert (= (and d!2163 (not res!11080)) b!14285))

(assert (= (and b!14285 res!11081) b!14286))

(declare-fun m!9523 () Bool)

(assert (=> b!14286 m!9523))

(assert (=> d!2119 d!2163))

(assert (=> d!2119 d!2161))

(declare-fun bs!561 () Bool)

(declare-fun b!14294 () Bool)

(assert (= bs!561 (and b!14294 b!14113)))

(declare-fun lambda!150 () Int)

(assert (=> bs!561 (= lambda!150 lambda!137)))

(declare-fun bs!562 () Bool)

(assert (= bs!562 (and b!14294 b!14236)))

(assert (=> bs!562 (= lambda!150 lambda!145)))

(assert (=> b!14294 true))

(declare-fun d!2165 () Bool)

(declare-fun e!8539 () Bool)

(assert (=> d!2165 e!8539))

(declare-fun res!11084 () Bool)

(assert (=> d!2165 (=> (not res!11084) (not e!8539))))

(declare-fun lt!3592 () List!422)

(assert (=> d!2165 (= res!11084 (isStrictlySorted!109 lt!3592))))

(declare-fun e!8542 () List!422)

(assert (=> d!2165 (= lt!3592 e!8542)))

(declare-fun c!1327 () Bool)

(assert (=> d!2165 (= c!1327 (and ((_ is Cons!418) (t!2818 (t!2818 l!522))) (= (_2!267 (h!984 (t!2818 (t!2818 l!522)))) value!159)))))

(assert (=> d!2165 (isStrictlySorted!109 (t!2818 (t!2818 l!522)))))

(assert (=> d!2165 (= (filterByValue!14 (t!2818 (t!2818 l!522)) value!159) lt!3592)))

(declare-fun b!14287 () Bool)

(declare-fun e!8541 () List!422)

(declare-fun call!412 () List!422)

(assert (=> b!14287 (= e!8541 call!412)))

(declare-fun b!14288 () Bool)

(declare-fun e!8540 () Bool)

(assert (=> b!14288 (= e!8539 e!8540)))

(declare-fun c!1328 () Bool)

(assert (=> b!14288 (= c!1328 (isEmpty!100 (t!2818 (t!2818 l!522))))))

(declare-fun b!14289 () Bool)

(assert (=> b!14289 (= e!8541 Nil!419)))

(declare-fun b!14290 () Bool)

(declare-fun e!8543 () Bool)

(assert (=> b!14290 (= e!8540 e!8543)))

(declare-fun res!11083 () Bool)

(declare-fun call!411 () Bool)

(assert (=> b!14290 (= res!11083 call!411)))

(assert (=> b!14290 (=> res!11083 e!8543)))

(declare-fun b!14291 () Bool)

(assert (=> b!14291 (= e!8543 (bvsge (_1!267 (head!789 lt!3592)) (_1!267 (head!789 (t!2818 (t!2818 l!522))))))))

(declare-fun b!14292 () Bool)

(assert (=> b!14292 (= e!8542 ($colon$colon!19 call!412 (h!984 (t!2818 (t!2818 l!522)))))))

(declare-fun b!14293 () Bool)

(assert (=> b!14293 (= e!8542 e!8541)))

(declare-fun c!1326 () Bool)

(assert (=> b!14293 (= c!1326 (and ((_ is Cons!418) (t!2818 (t!2818 l!522))) (not (= (_2!267 (h!984 (t!2818 (t!2818 l!522)))) value!159))))))

(declare-fun res!11082 () Bool)

(assert (=> b!14294 (=> (not res!11082) (not e!8539))))

(assert (=> b!14294 (= res!11082 (forall!93 lt!3592 lambda!150))))

(declare-fun bm!408 () Bool)

(assert (=> bm!408 (= call!412 (filterByValue!14 (t!2818 (t!2818 (t!2818 l!522))) value!159))))

(declare-fun b!14295 () Bool)

(assert (=> b!14295 (= e!8540 call!411)))

(declare-fun bm!409 () Bool)

(assert (=> bm!409 (= call!411 (isEmpty!100 lt!3592))))

(assert (= (and d!2165 c!1327) b!14292))

(assert (= (and d!2165 (not c!1327)) b!14293))

(assert (= (and b!14293 c!1326) b!14287))

(assert (= (and b!14293 (not c!1326)) b!14289))

(assert (= (or b!14292 b!14287) bm!408))

(assert (= (and d!2165 res!11084) b!14294))

(assert (= (and b!14294 res!11082) b!14288))

(assert (= (and b!14288 c!1328) b!14295))

(assert (= (and b!14288 (not c!1328)) b!14290))

(assert (= (and b!14290 (not res!11083)) b!14291))

(assert (= (or b!14295 b!14290) bm!409))

(declare-fun m!9525 () Bool)

(assert (=> b!14291 m!9525))

(declare-fun m!9527 () Bool)

(assert (=> b!14291 m!9527))

(declare-fun m!9529 () Bool)

(assert (=> bm!409 m!9529))

(declare-fun m!9531 () Bool)

(assert (=> bm!408 m!9531))

(declare-fun m!9533 () Bool)

(assert (=> d!2165 m!9533))

(assert (=> d!2165 m!9521))

(declare-fun m!9535 () Bool)

(assert (=> b!14294 m!9535))

(declare-fun m!9537 () Bool)

(assert (=> b!14288 m!9537))

(declare-fun m!9539 () Bool)

(assert (=> b!14292 m!9539))

(assert (=> bm!396 d!2165))

(declare-fun d!2167 () Bool)

(declare-fun res!11085 () Bool)

(declare-fun e!8544 () Bool)

(assert (=> d!2167 (=> res!11085 e!8544)))

(assert (=> d!2167 (= res!11085 (or ((_ is Nil!419) (t!2818 lt!3579)) ((_ is Nil!419) (t!2818 (t!2818 lt!3579)))))))

(assert (=> d!2167 (= (isStrictlySorted!109 (t!2818 lt!3579)) e!8544)))

(declare-fun b!14296 () Bool)

(declare-fun e!8545 () Bool)

(assert (=> b!14296 (= e!8544 e!8545)))

(declare-fun res!11086 () Bool)

(assert (=> b!14296 (=> (not res!11086) (not e!8545))))

(assert (=> b!14296 (= res!11086 (bvslt (_1!267 (h!984 (t!2818 lt!3579))) (_1!267 (h!984 (t!2818 (t!2818 lt!3579))))))))

(declare-fun b!14297 () Bool)

(assert (=> b!14297 (= e!8545 (isStrictlySorted!109 (t!2818 (t!2818 lt!3579))))))

(assert (= (and d!2167 (not res!11085)) b!14296))

(assert (= (and b!14296 res!11086) b!14297))

(declare-fun m!9541 () Bool)

(assert (=> b!14297 m!9541))

(assert (=> b!14166 d!2167))

(declare-fun d!2169 () Bool)

(assert (=> d!2169 (= (isEmpty!100 (t!2818 l!522)) ((_ is Nil!419) (t!2818 l!522)))))

(assert (=> b!14230 d!2169))

(declare-fun d!2171 () Bool)

(declare-fun res!11087 () Bool)

(declare-fun e!8546 () Bool)

(assert (=> d!2171 (=> res!11087 e!8546)))

(assert (=> d!2171 (= res!11087 ((_ is Nil!419) lt!3589))))

(assert (=> d!2171 (= (forall!93 lt!3589 lambda!145) e!8546)))

(declare-fun b!14298 () Bool)

(declare-fun e!8547 () Bool)

(assert (=> b!14298 (= e!8546 e!8547)))

(declare-fun res!11088 () Bool)

(assert (=> b!14298 (=> (not res!11088) (not e!8547))))

(assert (=> b!14298 (= res!11088 (dynLambda!88 lambda!145 (h!984 lt!3589)))))

(declare-fun b!14299 () Bool)

(assert (=> b!14299 (= e!8547 (forall!93 (t!2818 lt!3589) lambda!145))))

(assert (= (and d!2171 (not res!11087)) b!14298))

(assert (= (and b!14298 res!11088) b!14299))

(declare-fun b_lambda!899 () Bool)

(assert (=> (not b_lambda!899) (not b!14298)))

(declare-fun m!9543 () Bool)

(assert (=> b!14298 m!9543))

(declare-fun m!9545 () Bool)

(assert (=> b!14299 m!9545))

(assert (=> b!14236 d!2171))

(declare-fun d!2173 () Bool)

(assert (=> d!2173 (= ($colon$colon!19 call!402 (h!984 (t!2818 l!522))) (Cons!418 (h!984 (t!2818 l!522)) call!402))))

(assert (=> b!14234 d!2173))

(declare-fun d!2175 () Bool)

(assert (=> d!2175 (= (isEmpty!100 lt!3589) ((_ is Nil!419) lt!3589))))

(assert (=> bm!398 d!2175))

(declare-fun d!2177 () Bool)

(declare-fun res!11089 () Bool)

(declare-fun e!8548 () Bool)

(assert (=> d!2177 (=> res!11089 e!8548)))

(assert (=> d!2177 (= res!11089 ((_ is Nil!419) (t!2818 lt!3579)))))

(assert (=> d!2177 (= (forall!93 (t!2818 lt!3579) lambda!137) e!8548)))

(declare-fun b!14300 () Bool)

(declare-fun e!8549 () Bool)

(assert (=> b!14300 (= e!8548 e!8549)))

(declare-fun res!11090 () Bool)

(assert (=> b!14300 (=> (not res!11090) (not e!8549))))

(assert (=> b!14300 (= res!11090 (dynLambda!88 lambda!137 (h!984 (t!2818 lt!3579))))))

(declare-fun b!14301 () Bool)

(assert (=> b!14301 (= e!8549 (forall!93 (t!2818 (t!2818 lt!3579)) lambda!137))))

(assert (= (and d!2177 (not res!11089)) b!14300))

(assert (= (and b!14300 res!11090) b!14301))

(declare-fun b_lambda!901 () Bool)

(assert (=> (not b_lambda!901) (not b!14300)))

(declare-fun m!9547 () Bool)

(assert (=> b!14300 m!9547))

(declare-fun m!9549 () Bool)

(assert (=> b!14301 m!9549))

(assert (=> b!14150 d!2177))

(declare-fun d!2179 () Bool)

(assert (=> d!2179 (= (head!789 lt!3589) (h!984 lt!3589))))

(assert (=> b!14233 d!2179))

(declare-fun d!2181 () Bool)

(assert (=> d!2181 (= (head!789 (t!2818 l!522)) (h!984 (t!2818 l!522)))))

(assert (=> b!14233 d!2181))

(declare-fun b!14302 () Bool)

(declare-fun e!8550 () Bool)

(declare-fun tp!2319 () Bool)

(assert (=> b!14302 (= e!8550 (and tp_is_empty!717 tp!2319))))

(assert (=> b!14263 (= tp!2312 e!8550)))

(assert (= (and b!14263 ((_ is Cons!418) (t!2818 (t!2818 l!522)))) b!14302))

(declare-fun b_lambda!903 () Bool)

(assert (= b_lambda!899 (or b!14236 b_lambda!903)))

(declare-fun bs!563 () Bool)

(declare-fun d!2183 () Bool)

(assert (= bs!563 (and d!2183 b!14236)))

(assert (=> bs!563 (= (dynLambda!88 lambda!145 (h!984 lt!3589)) (= (_2!267 (h!984 lt!3589)) value!159))))

(assert (=> b!14298 d!2183))

(declare-fun b_lambda!905 () Bool)

(assert (= b_lambda!901 (or b!14113 b_lambda!905)))

(declare-fun bs!564 () Bool)

(declare-fun d!2185 () Bool)

(assert (= bs!564 (and d!2185 b!14113)))

(assert (=> bs!564 (= (dynLambda!88 lambda!137 (h!984 (t!2818 lt!3579))) (= (_2!267 (h!984 (t!2818 lt!3579))) value!159))))

(assert (=> b!14300 d!2185))

(check-sat (not d!2165) (not b_lambda!905) (not b!14286) (not bm!408) (not b!14284) (not bm!409) (not b!14292) (not b!14291) (not b_lambda!893) (not b!14301) (not b!14288) (not b!14297) tp_is_empty!717 (not b!14299) (not b!14302) (not b!14294) (not b_lambda!903))
(check-sat)
