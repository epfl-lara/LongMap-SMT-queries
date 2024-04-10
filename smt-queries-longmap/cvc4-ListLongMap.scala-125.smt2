; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2152 () Bool)

(assert start!2152)

(declare-fun b!14499 () Bool)

(assert (=> b!14499 true))

(declare-fun b!14495 () Bool)

(declare-fun e!8683 () Bool)

(declare-fun e!8682 () Bool)

(assert (=> b!14495 (= e!8683 e!8682)))

(declare-fun c!1355 () Bool)

(declare-datatypes ((B!552 0))(
  ( (B!553 (val!374 Int)) )
))
(declare-datatypes ((tuple2!548 0))(
  ( (tuple2!549 (_1!274 (_ BitVec 64)) (_2!274 B!552)) )
))
(declare-datatypes ((List!429 0))(
  ( (Nil!426) (Cons!425 (h!991 tuple2!548) (t!2828 List!429)) )
))
(declare-fun l!522 () List!429)

(declare-fun isEmpty!104 (List!429) Bool)

(assert (=> b!14495 (= c!1355 (isEmpty!104 l!522))))

(declare-fun b!14496 () Bool)

(declare-fun call!425 () Bool)

(assert (=> b!14496 (= e!8682 (not call!425))))

(declare-fun res!11195 () Bool)

(declare-fun e!8681 () Bool)

(assert (=> start!2152 (=> (not res!11195) (not e!8681))))

(declare-fun isStrictlySorted!116 (List!429) Bool)

(assert (=> start!2152 (= res!11195 (isStrictlySorted!116 l!522))))

(assert (=> start!2152 e!8681))

(declare-fun e!8680 () Bool)

(assert (=> start!2152 e!8680))

(declare-fun tp_is_empty!731 () Bool)

(assert (=> start!2152 tp_is_empty!731))

(declare-fun bm!422 () Bool)

(declare-fun lt!3615 () List!429)

(assert (=> bm!422 (= call!425 (isEmpty!104 lt!3615))))

(declare-fun b!14497 () Bool)

(declare-fun e!8684 () Bool)

(declare-fun head!793 (List!429) tuple2!548)

(assert (=> b!14497 (= e!8684 (bvslt (_1!274 (head!793 lt!3615)) (_1!274 (head!793 l!522))))))

(declare-fun b!14498 () Bool)

(assert (=> b!14498 (= e!8681 e!8683)))

(declare-fun res!11194 () Bool)

(assert (=> b!14498 (=> res!11194 e!8683)))

(assert (=> b!14498 (= res!11194 (not (isStrictlySorted!116 lt!3615)))))

(declare-fun value!159 () B!552)

(declare-fun filterByValue!18 (List!429 B!552) List!429)

(assert (=> b!14498 (= lt!3615 (filterByValue!18 (t!2828 l!522) value!159))))

(declare-fun res!11193 () Bool)

(assert (=> b!14499 (=> res!11193 e!8683)))

(declare-fun lambda!161 () Int)

(declare-fun forall!97 (List!429 Int) Bool)

(assert (=> b!14499 (= res!11193 (not (forall!97 lt!3615 lambda!161)))))

(declare-fun b!14500 () Bool)

(declare-fun res!11196 () Bool)

(assert (=> b!14500 (=> (not res!11196) (not e!8681))))

(assert (=> b!14500 (= res!11196 (and (not (= (_2!274 (h!991 l!522)) value!159)) (is-Cons!425 l!522)))))

(declare-fun b!14501 () Bool)

(assert (=> b!14501 (= e!8682 e!8684)))

(declare-fun res!11197 () Bool)

(assert (=> b!14501 (= res!11197 (not call!425))))

(assert (=> b!14501 (=> (not res!11197) (not e!8684))))

(declare-fun b!14502 () Bool)

(declare-fun tp!2348 () Bool)

(assert (=> b!14502 (= e!8680 (and tp_is_empty!731 tp!2348))))

(assert (= (and start!2152 res!11195) b!14500))

(assert (= (and b!14500 res!11196) b!14498))

(assert (= (and b!14498 (not res!11194)) b!14499))

(assert (= (and b!14499 (not res!11193)) b!14495))

(assert (= (and b!14495 c!1355) b!14496))

(assert (= (and b!14495 (not c!1355)) b!14501))

(assert (= (and b!14501 res!11197) b!14497))

(assert (= (or b!14496 b!14501) bm!422))

(assert (= (and start!2152 (is-Cons!425 l!522)) b!14502))

(declare-fun m!9673 () Bool)

(assert (=> start!2152 m!9673))

(declare-fun m!9675 () Bool)

(assert (=> bm!422 m!9675))

(declare-fun m!9677 () Bool)

(assert (=> b!14498 m!9677))

(declare-fun m!9679 () Bool)

(assert (=> b!14498 m!9679))

(declare-fun m!9681 () Bool)

(assert (=> b!14495 m!9681))

(declare-fun m!9683 () Bool)

(assert (=> b!14497 m!9683))

(declare-fun m!9685 () Bool)

(assert (=> b!14497 m!9685))

(declare-fun m!9687 () Bool)

(assert (=> b!14499 m!9687))

(push 1)

(assert (not b!14502))

(assert tp_is_empty!731)

(assert (not b!14499))

(assert (not start!2152))

(assert (not b!14495))

(assert (not b!14497))

(assert (not bm!422))

(assert (not b!14498))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2265 () Bool)

(declare-fun res!11208 () Bool)

(declare-fun e!8695 () Bool)

(assert (=> d!2265 (=> res!11208 e!8695)))

(assert (=> d!2265 (= res!11208 (or (is-Nil!426 lt!3615) (is-Nil!426 (t!2828 lt!3615))))))

(assert (=> d!2265 (= (isStrictlySorted!116 lt!3615) e!8695)))

(declare-fun b!14515 () Bool)

(declare-fun e!8696 () Bool)

(assert (=> b!14515 (= e!8695 e!8696)))

(declare-fun res!11209 () Bool)

(assert (=> b!14515 (=> (not res!11209) (not e!8696))))

(assert (=> b!14515 (= res!11209 (bvslt (_1!274 (h!991 lt!3615)) (_1!274 (h!991 (t!2828 lt!3615)))))))

(declare-fun b!14516 () Bool)

(assert (=> b!14516 (= e!8696 (isStrictlySorted!116 (t!2828 lt!3615)))))

(assert (= (and d!2265 (not res!11208)) b!14515))

(assert (= (and b!14515 res!11209) b!14516))

(declare-fun m!9691 () Bool)

(assert (=> b!14516 m!9691))

(assert (=> b!14498 d!2265))

(declare-fun bs!579 () Bool)

(declare-fun b!14577 () Bool)

(assert (= bs!579 (and b!14577 b!14499)))

(declare-fun lambda!166 () Int)

(assert (=> bs!579 (= lambda!166 lambda!161)))

(assert (=> b!14577 true))

(declare-fun b!14575 () Bool)

(declare-fun e!8742 () List!429)

(declare-fun call!434 () List!429)

(assert (=> b!14575 (= e!8742 call!434)))

(declare-fun res!11245 () Bool)

(declare-fun e!8739 () Bool)

(assert (=> b!14577 (=> (not res!11245) (not e!8739))))

(declare-fun lt!3620 () List!429)

(assert (=> b!14577 (= res!11245 (forall!97 lt!3620 lambda!166))))

(declare-fun bm!431 () Bool)

(declare-fun call!435 () Bool)

(assert (=> bm!431 (= call!435 (isEmpty!104 lt!3620))))

(declare-fun b!14578 () Bool)

(declare-fun e!8743 () Bool)

(assert (=> b!14578 (= e!8743 (bvsge (_1!274 (head!793 lt!3620)) (_1!274 (head!793 (t!2828 l!522)))))))

(declare-fun b!14579 () Bool)

(assert (=> b!14579 (= e!8742 Nil!426)))

(declare-fun bm!432 () Bool)

(assert (=> bm!432 (= call!434 (filterByValue!18 (t!2828 (t!2828 l!522)) value!159))))

(declare-fun b!14580 () Bool)

(declare-fun e!8741 () Bool)

(assert (=> b!14580 (= e!8741 e!8743)))

(declare-fun res!11244 () Bool)

(assert (=> b!14580 (= res!11244 call!435)))

(assert (=> b!14580 (=> res!11244 e!8743)))

(declare-fun b!14581 () Bool)

(declare-fun e!8740 () List!429)

(declare-fun $colon$colon!22 (List!429 tuple2!548) List!429)

(assert (=> b!14581 (= e!8740 ($colon$colon!22 call!434 (h!991 (t!2828 l!522))))))

(declare-fun b!14576 () Bool)

(assert (=> b!14576 (= e!8740 e!8742)))

(declare-fun c!1369 () Bool)

(assert (=> b!14576 (= c!1369 (and (is-Cons!425 (t!2828 l!522)) (not (= (_2!274 (h!991 (t!2828 l!522))) value!159))))))

(declare-fun d!2277 () Bool)

(assert (=> d!2277 e!8739))

(declare-fun res!11246 () Bool)

(assert (=> d!2277 (=> (not res!11246) (not e!8739))))

(assert (=> d!2277 (= res!11246 (isStrictlySorted!116 lt!3620))))

(assert (=> d!2277 (= lt!3620 e!8740)))

(declare-fun c!1368 () Bool)

(assert (=> d!2277 (= c!1368 (and (is-Cons!425 (t!2828 l!522)) (= (_2!274 (h!991 (t!2828 l!522))) value!159)))))

(assert (=> d!2277 (isStrictlySorted!116 (t!2828 l!522))))

(assert (=> d!2277 (= (filterByValue!18 (t!2828 l!522) value!159) lt!3620)))

(declare-fun b!14582 () Bool)

(assert (=> b!14582 (= e!8741 call!435)))

(declare-fun b!14583 () Bool)

(assert (=> b!14583 (= e!8739 e!8741)))

(declare-fun c!1370 () Bool)

(assert (=> b!14583 (= c!1370 (isEmpty!104 (t!2828 l!522)))))

(assert (= (and d!2277 c!1368) b!14581))

(assert (= (and d!2277 (not c!1368)) b!14576))

(assert (= (and b!14576 c!1369) b!14575))

(assert (= (and b!14576 (not c!1369)) b!14579))

(assert (= (or b!14581 b!14575) bm!432))

(assert (= (and d!2277 res!11246) b!14577))

(assert (= (and b!14577 res!11245) b!14583))

(assert (= (and b!14583 c!1370) b!14582))

(assert (= (and b!14583 (not c!1370)) b!14580))

(assert (= (and b!14580 (not res!11244)) b!14578))

(assert (= (or b!14582 b!14580) bm!431))

(declare-fun m!9707 () Bool)

(assert (=> b!14581 m!9707))

(declare-fun m!9709 () Bool)

(assert (=> b!14577 m!9709))

(declare-fun m!9711 () Bool)

(assert (=> bm!432 m!9711))

(declare-fun m!9713 () Bool)

(assert (=> b!14583 m!9713))

(declare-fun m!9715 () Bool)

(assert (=> d!2277 m!9715))

(declare-fun m!9717 () Bool)

(assert (=> d!2277 m!9717))

(declare-fun m!9719 () Bool)

(assert (=> b!14578 m!9719))

(declare-fun m!9721 () Bool)

(assert (=> b!14578 m!9721))

(declare-fun m!9723 () Bool)

(assert (=> bm!431 m!9723))

(assert (=> b!14498 d!2277))

(declare-fun d!2297 () Bool)

(declare-fun res!11260 () Bool)

(declare-fun e!8763 () Bool)

(assert (=> d!2297 (=> res!11260 e!8763)))

(assert (=> d!2297 (= res!11260 (is-Nil!426 lt!3615))))

(assert (=> d!2297 (= (forall!97 lt!3615 lambda!161) e!8763)))

(declare-fun b!14617 () Bool)

(declare-fun e!8764 () Bool)

(assert (=> b!14617 (= e!8763 e!8764)))

(declare-fun res!11261 () Bool)

(assert (=> b!14617 (=> (not res!11261) (not e!8764))))

(declare-fun dynLambda!93 (Int tuple2!548) Bool)

(assert (=> b!14617 (= res!11261 (dynLambda!93 lambda!161 (h!991 lt!3615)))))

(declare-fun b!14618 () Bool)

(assert (=> b!14618 (= e!8764 (forall!97 (t!2828 lt!3615) lambda!161))))

(assert (= (and d!2297 (not res!11260)) b!14617))

(assert (= (and b!14617 res!11261) b!14618))

(declare-fun b_lambda!927 () Bool)

(assert (=> (not b_lambda!927) (not b!14617)))

(declare-fun m!9741 () Bool)

(assert (=> b!14617 m!9741))

(declare-fun m!9743 () Bool)

(assert (=> b!14618 m!9743))

(assert (=> b!14499 d!2297))

(declare-fun d!2299 () Bool)

(declare-fun res!11262 () Bool)

(declare-fun e!8768 () Bool)

(assert (=> d!2299 (=> res!11262 e!8768)))

(assert (=> d!2299 (= res!11262 (or (is-Nil!426 l!522) (is-Nil!426 (t!2828 l!522))))))

(assert (=> d!2299 (= (isStrictlySorted!116 l!522) e!8768)))

(declare-fun b!14622 () Bool)

(declare-fun e!8769 () Bool)

(assert (=> b!14622 (= e!8768 e!8769)))

(declare-fun res!11263 () Bool)

(assert (=> b!14622 (=> (not res!11263) (not e!8769))))

(assert (=> b!14622 (= res!11263 (bvslt (_1!274 (h!991 l!522)) (_1!274 (h!991 (t!2828 l!522)))))))

(declare-fun b!14623 () Bool)

(assert (=> b!14623 (= e!8769 (isStrictlySorted!116 (t!2828 l!522)))))

(assert (= (and d!2299 (not res!11262)) b!14622))

(assert (= (and b!14622 res!11263) b!14623))

(assert (=> b!14623 m!9717))

(assert (=> start!2152 d!2299))

(declare-fun d!2301 () Bool)

(assert (=> d!2301 (= (head!793 lt!3615) (h!991 lt!3615))))

(assert (=> b!14497 d!2301))

(declare-fun d!2305 () Bool)

(assert (=> d!2305 (= (head!793 l!522) (h!991 l!522))))

(assert (=> b!14497 d!2305))

(declare-fun d!2307 () Bool)

(assert (=> d!2307 (= (isEmpty!104 lt!3615) (is-Nil!426 lt!3615))))

(assert (=> bm!422 d!2307))

(declare-fun d!2309 () Bool)

(assert (=> d!2309 (= (isEmpty!104 l!522) (is-Nil!426 l!522))))

(assert (=> b!14495 d!2309))

(declare-fun b!14637 () Bool)

(declare-fun e!8777 () Bool)

(declare-fun tp!2354 () Bool)

(assert (=> b!14637 (= e!8777 (and tp_is_empty!731 tp!2354))))

(assert (=> b!14502 (= tp!2348 e!8777)))

(assert (= (and b!14502 (is-Cons!425 (t!2828 l!522))) b!14637))

(declare-fun b_lambda!931 () Bool)

(assert (= b_lambda!927 (or b!14499 b_lambda!931)))

(declare-fun bs!583 () Bool)

(declare-fun d!2311 () Bool)

(assert (= bs!583 (and d!2311 b!14499)))

(assert (=> bs!583 (= (dynLambda!93 lambda!161 (h!991 lt!3615)) (= (_2!274 (h!991 lt!3615)) value!159))))

(assert (=> b!14617 d!2311))

(push 1)

(assert (not b!14637))

(assert (not bm!432))

(assert (not b!14583))

(assert (not b!14578))

(assert (not bm!431))

(assert (not b!14623))

(assert (not b_lambda!931))

(assert (not b!14516))

(assert tp_is_empty!731)

(assert (not b!14581))

(assert (not b!14618))

(assert (not d!2277))

(assert (not b!14577))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2367 () Bool)

(assert (=> d!2367 (= (isEmpty!104 lt!3620) (is-Nil!426 lt!3620))))

(assert (=> bm!431 d!2367))

(declare-fun d!2369 () Bool)

(declare-fun res!11293 () Bool)

(declare-fun e!8813 () Bool)

(assert (=> d!2369 (=> res!11293 e!8813)))

(assert (=> d!2369 (= res!11293 (or (is-Nil!426 (t!2828 lt!3615)) (is-Nil!426 (t!2828 (t!2828 lt!3615)))))))

(assert (=> d!2369 (= (isStrictlySorted!116 (t!2828 lt!3615)) e!8813)))

(declare-fun b!14683 () Bool)

(declare-fun e!8814 () Bool)

(assert (=> b!14683 (= e!8813 e!8814)))

(declare-fun res!11294 () Bool)

(assert (=> b!14683 (=> (not res!11294) (not e!8814))))

(assert (=> b!14683 (= res!11294 (bvslt (_1!274 (h!991 (t!2828 lt!3615))) (_1!274 (h!991 (t!2828 (t!2828 lt!3615))))))))

(declare-fun b!14684 () Bool)

(assert (=> b!14684 (= e!8814 (isStrictlySorted!116 (t!2828 (t!2828 lt!3615))))))

(assert (= (and d!2369 (not res!11293)) b!14683))

(assert (= (and b!14683 res!11294) b!14684))

(declare-fun m!9821 () Bool)

(assert (=> b!14684 m!9821))

(assert (=> b!14516 d!2369))

(declare-fun d!2371 () Bool)

(assert (=> d!2371 (= ($colon$colon!22 call!434 (h!991 (t!2828 l!522))) (Cons!425 (h!991 (t!2828 l!522)) call!434))))

(assert (=> b!14581 d!2371))

(declare-fun d!2373 () Bool)

(declare-fun res!11295 () Bool)

(declare-fun e!8815 () Bool)

(assert (=> d!2373 (=> res!11295 e!8815)))

(assert (=> d!2373 (= res!11295 (is-Nil!426 (t!2828 lt!3615)))))

(assert (=> d!2373 (= (forall!97 (t!2828 lt!3615) lambda!161) e!8815)))

(declare-fun b!14685 () Bool)

(declare-fun e!8816 () Bool)

(assert (=> b!14685 (= e!8815 e!8816)))

(declare-fun res!11296 () Bool)

(assert (=> b!14685 (=> (not res!11296) (not e!8816))))

(assert (=> b!14685 (= res!11296 (dynLambda!93 lambda!161 (h!991 (t!2828 lt!3615))))))

(declare-fun b!14686 () Bool)

(assert (=> b!14686 (= e!8816 (forall!97 (t!2828 (t!2828 lt!3615)) lambda!161))))

(assert (= (and d!2373 (not res!11295)) b!14685))

(assert (= (and b!14685 res!11296) b!14686))

(declare-fun b_lambda!951 () Bool)

(assert (=> (not b_lambda!951) (not b!14685)))

(declare-fun m!9823 () Bool)

(assert (=> b!14685 m!9823))

(declare-fun m!9825 () Bool)

(assert (=> b!14686 m!9825))

(assert (=> b!14618 d!2373))

(declare-fun d!2375 () Bool)

(declare-fun res!11297 () Bool)

(declare-fun e!8817 () Bool)

(assert (=> d!2375 (=> res!11297 e!8817)))

(assert (=> d!2375 (= res!11297 (is-Nil!426 lt!3620))))

(assert (=> d!2375 (= (forall!97 lt!3620 lambda!166) e!8817)))

(declare-fun b!14687 () Bool)

(declare-fun e!8818 () Bool)

(assert (=> b!14687 (= e!8817 e!8818)))

(declare-fun res!11298 () Bool)

(assert (=> b!14687 (=> (not res!11298) (not e!8818))))

(assert (=> b!14687 (= res!11298 (dynLambda!93 lambda!166 (h!991 lt!3620)))))

(declare-fun b!14688 () Bool)

(assert (=> b!14688 (= e!8818 (forall!97 (t!2828 lt!3620) lambda!166))))

(assert (= (and d!2375 (not res!11297)) b!14687))

(assert (= (and b!14687 res!11298) b!14688))

(declare-fun b_lambda!953 () Bool)

(assert (=> (not b_lambda!953) (not b!14687)))

(declare-fun m!9827 () Bool)

(assert (=> b!14687 m!9827))

(declare-fun m!9829 () Bool)

(assert (=> b!14688 m!9829))

(assert (=> b!14577 d!2375))

(declare-fun d!2377 () Bool)

(assert (=> d!2377 (= (head!793 lt!3620) (h!991 lt!3620))))

(assert (=> b!14578 d!2377))

(declare-fun d!2379 () Bool)

(assert (=> d!2379 (= (head!793 (t!2828 l!522)) (h!991 (t!2828 l!522)))))

(assert (=> b!14578 d!2379))

(declare-fun d!2381 () Bool)

(declare-fun res!11299 () Bool)

(declare-fun e!8819 () Bool)

(assert (=> d!2381 (=> res!11299 e!8819)))

(assert (=> d!2381 (= res!11299 (or (is-Nil!426 (t!2828 l!522)) (is-Nil!426 (t!2828 (t!2828 l!522)))))))

(assert (=> d!2381 (= (isStrictlySorted!116 (t!2828 l!522)) e!8819)))

(declare-fun b!14689 () Bool)

(declare-fun e!8820 () Bool)

(assert (=> b!14689 (= e!8819 e!8820)))

(declare-fun res!11300 () Bool)

(assert (=> b!14689 (=> (not res!11300) (not e!8820))))

(assert (=> b!14689 (= res!11300 (bvslt (_1!274 (h!991 (t!2828 l!522))) (_1!274 (h!991 (t!2828 (t!2828 l!522))))))))

(declare-fun b!14690 () Bool)

(assert (=> b!14690 (= e!8820 (isStrictlySorted!116 (t!2828 (t!2828 l!522))))))

(assert (= (and d!2381 (not res!11299)) b!14689))

(assert (= (and b!14689 res!11300) b!14690))

(declare-fun m!9831 () Bool)

(assert (=> b!14690 m!9831))

(assert (=> b!14623 d!2381))

(declare-fun d!2383 () Bool)

(assert (=> d!2383 (= (isEmpty!104 (t!2828 l!522)) (is-Nil!426 (t!2828 l!522)))))

(assert (=> b!14583 d!2383))

(declare-fun d!2385 () Bool)

(declare-fun res!11301 () Bool)

(declare-fun e!8821 () Bool)

(assert (=> d!2385 (=> res!11301 e!8821)))

(assert (=> d!2385 (= res!11301 (or (is-Nil!426 lt!3620) (is-Nil!426 (t!2828 lt!3620))))))

(assert (=> d!2385 (= (isStrictlySorted!116 lt!3620) e!8821)))

(declare-fun b!14691 () Bool)

(declare-fun e!8822 () Bool)

(assert (=> b!14691 (= e!8821 e!8822)))

(declare-fun res!11302 () Bool)

(assert (=> b!14691 (=> (not res!11302) (not e!8822))))

(assert (=> b!14691 (= res!11302 (bvslt (_1!274 (h!991 lt!3620)) (_1!274 (h!991 (t!2828 lt!3620)))))))

(declare-fun b!14692 () Bool)

(assert (=> b!14692 (= e!8822 (isStrictlySorted!116 (t!2828 lt!3620)))))

(assert (= (and d!2385 (not res!11301)) b!14691))

(assert (= (and b!14691 res!11302) b!14692))

(declare-fun m!9833 () Bool)

(assert (=> b!14692 m!9833))

(assert (=> d!2277 d!2385))

(assert (=> d!2277 d!2381))

(declare-fun bs!593 () Bool)

(declare-fun b!14695 () Bool)

(assert (= bs!593 (and b!14695 b!14499)))

(declare-fun lambda!173 () Int)

(assert (=> bs!593 (= lambda!173 lambda!161)))

(declare-fun bs!594 () Bool)

(assert (= bs!594 (and b!14695 b!14577)))

(assert (=> bs!594 (= lambda!173 lambda!166)))

(assert (=> b!14695 true))

(declare-fun b!14693 () Bool)

(declare-fun e!8826 () List!429)

(declare-fun call!448 () List!429)

(assert (=> b!14693 (= e!8826 call!448)))

(declare-fun res!11304 () Bool)

(declare-fun e!8823 () Bool)

(assert (=> b!14695 (=> (not res!11304) (not e!8823))))

(declare-fun lt!3627 () List!429)

(assert (=> b!14695 (= res!11304 (forall!97 lt!3627 lambda!173))))

(declare-fun bm!445 () Bool)

(declare-fun call!449 () Bool)

(assert (=> bm!445 (= call!449 (isEmpty!104 lt!3627))))

(declare-fun b!14696 () Bool)

(declare-fun e!8827 () Bool)

(assert (=> b!14696 (= e!8827 (bvsge (_1!274 (head!793 lt!3627)) (_1!274 (head!793 (t!2828 (t!2828 l!522))))))))

(declare-fun b!14697 () Bool)

(assert (=> b!14697 (= e!8826 Nil!426)))

(declare-fun bm!446 () Bool)

(assert (=> bm!446 (= call!448 (filterByValue!18 (t!2828 (t!2828 (t!2828 l!522))) value!159))))

(declare-fun b!14698 () Bool)

(declare-fun e!8825 () Bool)

(assert (=> b!14698 (= e!8825 e!8827)))

(declare-fun res!11303 () Bool)

(assert (=> b!14698 (= res!11303 call!449)))

(assert (=> b!14698 (=> res!11303 e!8827)))

(declare-fun b!14699 () Bool)

(declare-fun e!8824 () List!429)

(assert (=> b!14699 (= e!8824 ($colon$colon!22 call!448 (h!991 (t!2828 (t!2828 l!522)))))))

(declare-fun b!14694 () Bool)

(assert (=> b!14694 (= e!8824 e!8826)))

(declare-fun c!1390 () Bool)

(assert (=> b!14694 (= c!1390 (and (is-Cons!425 (t!2828 (t!2828 l!522))) (not (= (_2!274 (h!991 (t!2828 (t!2828 l!522)))) value!159))))))

(declare-fun d!2387 () Bool)

(assert (=> d!2387 e!8823))

(declare-fun res!11305 () Bool)

(assert (=> d!2387 (=> (not res!11305) (not e!8823))))

(assert (=> d!2387 (= res!11305 (isStrictlySorted!116 lt!3627))))

(assert (=> d!2387 (= lt!3627 e!8824)))

(declare-fun c!1389 () Bool)

(assert (=> d!2387 (= c!1389 (and (is-Cons!425 (t!2828 (t!2828 l!522))) (= (_2!274 (h!991 (t!2828 (t!2828 l!522)))) value!159)))))

(assert (=> d!2387 (isStrictlySorted!116 (t!2828 (t!2828 l!522)))))

(assert (=> d!2387 (= (filterByValue!18 (t!2828 (t!2828 l!522)) value!159) lt!3627)))

(declare-fun b!14700 () Bool)

(assert (=> b!14700 (= e!8825 call!449)))

(declare-fun b!14701 () Bool)

(assert (=> b!14701 (= e!8823 e!8825)))

(declare-fun c!1391 () Bool)

(assert (=> b!14701 (= c!1391 (isEmpty!104 (t!2828 (t!2828 l!522))))))

(assert (= (and d!2387 c!1389) b!14699))

(assert (= (and d!2387 (not c!1389)) b!14694))

(assert (= (and b!14694 c!1390) b!14693))

