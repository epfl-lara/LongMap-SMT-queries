; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2152 () Bool)

(assert start!2152)

(declare-fun b!14502 () Bool)

(assert (=> b!14502 true))

(declare-fun b!14495 () Bool)

(declare-fun e!8684 () Bool)

(declare-fun tp_is_empty!731 () Bool)

(declare-fun tp!2348 () Bool)

(assert (=> b!14495 (= e!8684 (and tp_is_empty!731 tp!2348))))

(declare-fun b!14496 () Bool)

(declare-fun e!8681 () Bool)

(declare-fun e!8682 () Bool)

(assert (=> b!14496 (= e!8681 e!8682)))

(declare-fun res!11196 () Bool)

(declare-fun call!425 () Bool)

(assert (=> b!14496 (= res!11196 (not call!425))))

(assert (=> b!14496 (=> (not res!11196) (not e!8682))))

(declare-fun bm!422 () Bool)

(declare-datatypes ((B!552 0))(
  ( (B!553 (val!374 Int)) )
))
(declare-datatypes ((tuple2!544 0))(
  ( (tuple2!545 (_1!272 (_ BitVec 64)) (_2!272 B!552)) )
))
(declare-datatypes ((List!425 0))(
  ( (Nil!422) (Cons!421 (h!987 tuple2!544) (t!2824 List!425)) )
))
(declare-fun lt!3615 () List!425)

(declare-fun isEmpty!104 (List!425) Bool)

(assert (=> bm!422 (= call!425 (isEmpty!104 lt!3615))))

(declare-fun b!14497 () Bool)

(assert (=> b!14497 (= e!8681 (not call!425))))

(declare-fun b!14498 () Bool)

(declare-fun res!11197 () Bool)

(declare-fun e!8683 () Bool)

(assert (=> b!14498 (=> (not res!11197) (not e!8683))))

(declare-fun l!522 () List!425)

(declare-fun value!159 () B!552)

(assert (=> b!14498 (= res!11197 (and (not (= (_2!272 (h!987 l!522)) value!159)) (is-Cons!421 l!522)))))

(declare-fun b!14499 () Bool)

(declare-fun e!8680 () Bool)

(assert (=> b!14499 (= e!8683 e!8680)))

(declare-fun res!11194 () Bool)

(assert (=> b!14499 (=> res!11194 e!8680)))

(declare-fun isStrictlySorted!113 (List!425) Bool)

(assert (=> b!14499 (= res!11194 (not (isStrictlySorted!113 lt!3615)))))

(declare-fun filterByValue!18 (List!425 B!552) List!425)

(assert (=> b!14499 (= lt!3615 (filterByValue!18 (t!2824 l!522) value!159))))

(declare-fun b!14500 () Bool)

(declare-fun head!793 (List!425) tuple2!544)

(assert (=> b!14500 (= e!8682 (bvslt (_1!272 (head!793 lt!3615)) (_1!272 (head!793 l!522))))))

(declare-fun res!11195 () Bool)

(assert (=> start!2152 (=> (not res!11195) (not e!8683))))

(assert (=> start!2152 (= res!11195 (isStrictlySorted!113 l!522))))

(assert (=> start!2152 e!8683))

(assert (=> start!2152 e!8684))

(assert (=> start!2152 tp_is_empty!731))

(declare-fun b!14501 () Bool)

(assert (=> b!14501 (= e!8680 e!8681)))

(declare-fun c!1355 () Bool)

(assert (=> b!14501 (= c!1355 (isEmpty!104 l!522))))

(declare-fun res!11193 () Bool)

(assert (=> b!14502 (=> res!11193 e!8680)))

(declare-fun lambda!161 () Int)

(declare-fun forall!97 (List!425 Int) Bool)

(assert (=> b!14502 (= res!11193 (not (forall!97 lt!3615 lambda!161)))))

(assert (= (and start!2152 res!11195) b!14498))

(assert (= (and b!14498 res!11197) b!14499))

(assert (= (and b!14499 (not res!11194)) b!14502))

(assert (= (and b!14502 (not res!11193)) b!14501))

(assert (= (and b!14501 c!1355) b!14497))

(assert (= (and b!14501 (not c!1355)) b!14496))

(assert (= (and b!14496 res!11196) b!14500))

(assert (= (or b!14497 b!14496) bm!422))

(assert (= (and start!2152 (is-Cons!421 l!522)) b!14495))

(declare-fun m!9665 () Bool)

(assert (=> b!14501 m!9665))

(declare-fun m!9667 () Bool)

(assert (=> b!14499 m!9667))

(declare-fun m!9669 () Bool)

(assert (=> b!14499 m!9669))

(declare-fun m!9671 () Bool)

(assert (=> start!2152 m!9671))

(declare-fun m!9673 () Bool)

(assert (=> b!14502 m!9673))

(declare-fun m!9675 () Bool)

(assert (=> bm!422 m!9675))

(declare-fun m!9677 () Bool)

(assert (=> b!14500 m!9677))

(declare-fun m!9679 () Bool)

(assert (=> b!14500 m!9679))

(push 1)

(assert (not b!14501))

(assert (not b!14499))

(assert (not bm!422))

(assert (not start!2152))

(assert (not b!14495))

(assert (not b!14500))

(assert tp_is_empty!731)

(assert (not b!14502))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2263 () Bool)

(declare-fun res!11202 () Bool)

(declare-fun e!8689 () Bool)

(assert (=> d!2263 (=> res!11202 e!8689)))

(assert (=> d!2263 (= res!11202 (or (is-Nil!422 lt!3615) (is-Nil!422 (t!2824 lt!3615))))))

(assert (=> d!2263 (= (isStrictlySorted!113 lt!3615) e!8689)))

(declare-fun b!14509 () Bool)

(declare-fun e!8690 () Bool)

(assert (=> b!14509 (= e!8689 e!8690)))

(declare-fun res!11203 () Bool)

(assert (=> b!14509 (=> (not res!11203) (not e!8690))))

(assert (=> b!14509 (= res!11203 (bvslt (_1!272 (h!987 lt!3615)) (_1!272 (h!987 (t!2824 lt!3615)))))))

(declare-fun b!14510 () Bool)

(assert (=> b!14510 (= e!8690 (isStrictlySorted!113 (t!2824 lt!3615)))))

(assert (= (and d!2263 (not res!11202)) b!14509))

(assert (= (and b!14509 res!11203) b!14510))

(declare-fun m!9681 () Bool)

(assert (=> b!14510 m!9681))

(assert (=> b!14499 d!2263))

(declare-fun bs!579 () Bool)

(declare-fun b!14563 () Bool)

(assert (= bs!579 (and b!14563 b!14502)))

(declare-fun lambda!164 () Int)

(assert (=> bs!579 (= lambda!164 lambda!161)))

(assert (=> b!14563 true))

(declare-fun b!14559 () Bool)

(declare-fun e!8727 () Bool)

(declare-fun e!8726 () Bool)

(assert (=> b!14559 (= e!8727 e!8726)))

(declare-fun c!1370 () Bool)

(assert (=> b!14559 (= c!1370 (isEmpty!104 (t!2824 l!522)))))

(declare-fun b!14560 () Bool)

(declare-fun e!8724 () List!425)

(assert (=> b!14560 (= e!8724 Nil!422)))

(declare-fun d!2275 () Bool)

(assert (=> d!2275 e!8727))

(declare-fun res!11225 () Bool)

(assert (=> d!2275 (=> (not res!11225) (not e!8727))))

(declare-fun lt!3622 () List!425)

(assert (=> d!2275 (= res!11225 (isStrictlySorted!113 lt!3622))))

(declare-fun e!8725 () List!425)

(assert (=> d!2275 (= lt!3622 e!8725)))

(declare-fun c!1371 () Bool)

(assert (=> d!2275 (= c!1371 (and (is-Cons!421 (t!2824 l!522)) (= (_2!272 (h!987 (t!2824 l!522))) value!159)))))

(assert (=> d!2275 (isStrictlySorted!113 (t!2824 l!522))))

(assert (=> d!2275 (= (filterByValue!18 (t!2824 l!522) value!159) lt!3622)))

(declare-fun b!14561 () Bool)

(declare-fun call!435 () Bool)

(assert (=> b!14561 (= e!8726 call!435)))

(declare-fun b!14562 () Bool)

(declare-fun call!434 () List!425)

(assert (=> b!14562 (= e!8724 call!434)))

(declare-fun res!11226 () Bool)

(assert (=> b!14563 (=> (not res!11226) (not e!8727))))

(assert (=> b!14563 (= res!11226 (forall!97 lt!3622 lambda!164))))

(declare-fun b!14564 () Bool)

(declare-fun e!8723 () Bool)

(assert (=> b!14564 (= e!8726 e!8723)))

(declare-fun res!11224 () Bool)

(assert (=> b!14564 (= res!11224 call!435)))

(assert (=> b!14564 (=> res!11224 e!8723)))

(declare-fun bm!431 () Bool)

(assert (=> bm!431 (= call!434 (filterByValue!18 (t!2824 (t!2824 l!522)) value!159))))

(declare-fun b!14565 () Bool)

(assert (=> b!14565 (= e!8725 e!8724)))

(declare-fun c!1372 () Bool)

(assert (=> b!14565 (= c!1372 (and (is-Cons!421 (t!2824 l!522)) (not (= (_2!272 (h!987 (t!2824 l!522))) value!159))))))

(declare-fun b!14566 () Bool)

(declare-fun $colon$colon!21 (List!425 tuple2!544) List!425)

(assert (=> b!14566 (= e!8725 ($colon$colon!21 call!434 (h!987 (t!2824 l!522))))))

(declare-fun b!14567 () Bool)

(assert (=> b!14567 (= e!8723 (bvsge (_1!272 (head!793 lt!3622)) (_1!272 (head!793 (t!2824 l!522)))))))

(declare-fun bm!432 () Bool)

(assert (=> bm!432 (= call!435 (isEmpty!104 lt!3622))))

(assert (= (and d!2275 c!1371) b!14566))

(assert (= (and d!2275 (not c!1371)) b!14565))

(assert (= (and b!14565 c!1372) b!14562))

(assert (= (and b!14565 (not c!1372)) b!14560))

(assert (= (or b!14566 b!14562) bm!431))

(assert (= (and d!2275 res!11225) b!14563))

(assert (= (and b!14563 res!11226) b!14559))

(assert (= (and b!14559 c!1370) b!14561))

(assert (= (and b!14559 (not c!1370)) b!14564))

(assert (= (and b!14564 (not res!11224)) b!14567))

(assert (= (or b!14561 b!14564) bm!432))

(declare-fun m!9689 () Bool)

(assert (=> b!14567 m!9689))

(declare-fun m!9691 () Bool)

(assert (=> b!14567 m!9691))

(declare-fun m!9693 () Bool)

(assert (=> bm!431 m!9693))

(declare-fun m!9695 () Bool)

(assert (=> b!14566 m!9695))

(declare-fun m!9697 () Bool)

(assert (=> b!14563 m!9697))

(declare-fun m!9699 () Bool)

(assert (=> bm!432 m!9699))

(declare-fun m!9701 () Bool)

(assert (=> b!14559 m!9701))

(declare-fun m!9703 () Bool)

(assert (=> d!2275 m!9703))

(declare-fun m!9705 () Bool)

(assert (=> d!2275 m!9705))

(assert (=> b!14499 d!2275))

(declare-fun d!2283 () Bool)

(assert (=> d!2283 (= (isEmpty!104 lt!3615) (is-Nil!422 lt!3615))))

(assert (=> bm!422 d!2283))

(declare-fun d!2285 () Bool)

(declare-fun res!11243 () Bool)

(declare-fun e!8744 () Bool)

(assert (=> d!2285 (=> res!11243 e!8744)))

(assert (=> d!2285 (= res!11243 (is-Nil!422 lt!3615))))

(assert (=> d!2285 (= (forall!97 lt!3615 lambda!161) e!8744)))

(declare-fun b!14592 () Bool)

(declare-fun e!8745 () Bool)

(assert (=> b!14592 (= e!8744 e!8745)))

(declare-fun res!11244 () Bool)

(assert (=> b!14592 (=> (not res!11244) (not e!8745))))

(declare-fun dynLambda!89 (Int tuple2!544) Bool)

(assert (=> b!14592 (= res!11244 (dynLambda!89 lambda!161 (h!987 lt!3615)))))

(declare-fun b!14593 () Bool)

(assert (=> b!14593 (= e!8745 (forall!97 (t!2824 lt!3615) lambda!161))))

(assert (= (and d!2285 (not res!11243)) b!14592))

(assert (= (and b!14592 res!11244) b!14593))

(declare-fun b_lambda!923 () Bool)

(assert (=> (not b_lambda!923) (not b!14592)))

(declare-fun m!9707 () Bool)

(assert (=> b!14592 m!9707))

(declare-fun m!9709 () Bool)

(assert (=> b!14593 m!9709))

(assert (=> b!14502 d!2285))

(declare-fun d!2287 () Bool)

(declare-fun res!11245 () Bool)

(declare-fun e!8746 () Bool)

(assert (=> d!2287 (=> res!11245 e!8746)))

(assert (=> d!2287 (= res!11245 (or (is-Nil!422 l!522) (is-Nil!422 (t!2824 l!522))))))

(assert (=> d!2287 (= (isStrictlySorted!113 l!522) e!8746)))

(declare-fun b!14594 () Bool)

(declare-fun e!8747 () Bool)

(assert (=> b!14594 (= e!8746 e!8747)))

(declare-fun res!11246 () Bool)

(assert (=> b!14594 (=> (not res!11246) (not e!8747))))

(assert (=> b!14594 (= res!11246 (bvslt (_1!272 (h!987 l!522)) (_1!272 (h!987 (t!2824 l!522)))))))

(declare-fun b!14595 () Bool)

(assert (=> b!14595 (= e!8747 (isStrictlySorted!113 (t!2824 l!522)))))

(assert (= (and d!2287 (not res!11245)) b!14594))

(assert (= (and b!14594 res!11246) b!14595))

(assert (=> b!14595 m!9705))

(assert (=> start!2152 d!2287))

(declare-fun d!2289 () Bool)

(assert (=> d!2289 (= (head!793 lt!3615) (h!987 lt!3615))))

(assert (=> b!14500 d!2289))

(declare-fun d!2291 () Bool)

(assert (=> d!2291 (= (head!793 l!522) (h!987 l!522))))

(assert (=> b!14500 d!2291))

(declare-fun d!2293 () Bool)

(assert (=> d!2293 (= (isEmpty!104 l!522) (is-Nil!422 l!522))))

(assert (=> b!14501 d!2293))

(declare-fun b!14618 () Bool)

(declare-fun e!8760 () Bool)

(declare-fun tp!2351 () Bool)

(assert (=> b!14618 (= e!8760 (and tp_is_empty!731 tp!2351))))

(assert (=> b!14495 (= tp!2348 e!8760)))

(assert (= (and b!14495 (is-Cons!421 (t!2824 l!522))) b!14618))

(declare-fun b_lambda!925 () Bool)

(assert (= b_lambda!923 (or b!14502 b_lambda!925)))

(declare-fun bs!582 () Bool)

(declare-fun d!2295 () Bool)

(assert (= bs!582 (and d!2295 b!14502)))

(assert (=> bs!582 (= (dynLambda!89 lambda!161 (h!987 lt!3615)) (= (_2!272 (h!987 lt!3615)) value!159))))

(assert (=> b!14592 d!2295))

(push 1)

(assert (not b!14566))

(assert (not bm!431))

(assert (not b!14563))

(assert (not b_lambda!925))

(assert (not d!2275))

(assert (not b!14510))

(assert (not b!14593))

(assert (not b!14559))

(assert tp_is_empty!731)

(assert (not b!14595))

(assert (not b!14618))

(assert (not b!14567))

(assert (not bm!432))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bs!589 () Bool)

(declare-fun b!14667 () Bool)

(assert (= bs!589 (and b!14667 b!14502)))

(declare-fun lambda!172 () Int)

(assert (=> bs!589 (= lambda!172 lambda!161)))

(declare-fun bs!590 () Bool)

(assert (= bs!590 (and b!14667 b!14563)))

(assert (=> bs!590 (= lambda!172 lambda!164)))

(assert (=> b!14667 true))

(declare-fun b!14663 () Bool)

(declare-fun e!8801 () Bool)

(declare-fun e!8800 () Bool)

(assert (=> b!14663 (= e!8801 e!8800)))

(declare-fun c!1386 () Bool)

(assert (=> b!14663 (= c!1386 (isEmpty!104 (t!2824 (t!2824 l!522))))))

(declare-fun b!14664 () Bool)

(declare-fun e!8798 () List!425)

(assert (=> b!14664 (= e!8798 Nil!422)))

(declare-fun d!2341 () Bool)

(assert (=> d!2341 e!8801))

(declare-fun res!11281 () Bool)

(assert (=> d!2341 (=> (not res!11281) (not e!8801))))

(declare-fun lt!3626 () List!425)

(assert (=> d!2341 (= res!11281 (isStrictlySorted!113 lt!3626))))

(declare-fun e!8799 () List!425)

(assert (=> d!2341 (= lt!3626 e!8799)))

(declare-fun c!1387 () Bool)

(assert (=> d!2341 (= c!1387 (and (is-Cons!421 (t!2824 (t!2824 l!522))) (= (_2!272 (h!987 (t!2824 (t!2824 l!522)))) value!159)))))

(assert (=> d!2341 (isStrictlySorted!113 (t!2824 (t!2824 l!522)))))

(assert (=> d!2341 (= (filterByValue!18 (t!2824 (t!2824 l!522)) value!159) lt!3626)))

(declare-fun b!14665 () Bool)

(declare-fun call!447 () Bool)

(assert (=> b!14665 (= e!8800 call!447)))

(declare-fun b!14666 () Bool)

(declare-fun call!446 () List!425)

(assert (=> b!14666 (= e!8798 call!446)))

(declare-fun res!11282 () Bool)

(assert (=> b!14667 (=> (not res!11282) (not e!8801))))

(assert (=> b!14667 (= res!11282 (forall!97 lt!3626 lambda!172))))

(declare-fun b!14668 () Bool)

(declare-fun e!8797 () Bool)

(assert (=> b!14668 (= e!8800 e!8797)))

(declare-fun res!11280 () Bool)

(assert (=> b!14668 (= res!11280 call!447)))

(assert (=> b!14668 (=> res!11280 e!8797)))

(declare-fun bm!443 () Bool)

(assert (=> bm!443 (= call!446 (filterByValue!18 (t!2824 (t!2824 (t!2824 l!522))) value!159))))

(declare-fun b!14669 () Bool)

(assert (=> b!14669 (= e!8799 e!8798)))

(declare-fun c!1388 () Bool)

(assert (=> b!14669 (= c!1388 (and (is-Cons!421 (t!2824 (t!2824 l!522))) (not (= (_2!272 (h!987 (t!2824 (t!2824 l!522)))) value!159))))))

(declare-fun b!14670 () Bool)

(assert (=> b!14670 (= e!8799 ($colon$colon!21 call!446 (h!987 (t!2824 (t!2824 l!522)))))))

(declare-fun b!14671 () Bool)

(assert (=> b!14671 (= e!8797 (bvsge (_1!272 (head!793 lt!3626)) (_1!272 (head!793 (t!2824 (t!2824 l!522))))))))

(declare-fun bm!444 () Bool)

(assert (=> bm!444 (= call!447 (isEmpty!104 lt!3626))))

(assert (= (and d!2341 c!1387) b!14670))

(assert (= (and d!2341 (not c!1387)) b!14669))

(assert (= (and b!14669 c!1388) b!14666))

(assert (= (and b!14669 (not c!1388)) b!14664))

(assert (= (or b!14670 b!14666) bm!443))

(assert (= (and d!2341 res!11281) b!14667))

(assert (= (and b!14667 res!11282) b!14663))

(assert (= (and b!14663 c!1386) b!14665))

(assert (= (and b!14663 (not c!1386)) b!14668))

(assert (= (and b!14668 (not res!11280)) b!14671))

(assert (= (or b!14665 b!14668) bm!444))

(declare-fun m!9783 () Bool)

(assert (=> b!14671 m!9783))

(declare-fun m!9785 () Bool)

(assert (=> b!14671 m!9785))

(declare-fun m!9787 () Bool)

(assert (=> bm!443 m!9787))

(declare-fun m!9789 () Bool)

(assert (=> b!14670 m!9789))

(declare-fun m!9791 () Bool)

(assert (=> b!14667 m!9791))

(declare-fun m!9793 () Bool)

(assert (=> bm!444 m!9793))

(declare-fun m!9795 () Bool)

(assert (=> b!14663 m!9795))

(declare-fun m!9797 () Bool)

(assert (=> d!2341 m!9797))

(declare-fun m!9799 () Bool)

(assert (=> d!2341 m!9799))

(assert (=> bm!431 d!2341))

(declare-fun d!2343 () Bool)

(declare-fun res!11283 () Bool)

(declare-fun e!8802 () Bool)

(assert (=> d!2343 (=> res!11283 e!8802)))

(assert (=> d!2343 (= res!11283 (or (is-Nil!422 (t!2824 lt!3615)) (is-Nil!422 (t!2824 (t!2824 lt!3615)))))))

(assert (=> d!2343 (= (isStrictlySorted!113 (t!2824 lt!3615)) e!8802)))

(declare-fun b!14672 () Bool)

(declare-fun e!8803 () Bool)

(assert (=> b!14672 (= e!8802 e!8803)))

(declare-fun res!11284 () Bool)

(assert (=> b!14672 (=> (not res!11284) (not e!8803))))

(assert (=> b!14672 (= res!11284 (bvslt (_1!272 (h!987 (t!2824 lt!3615))) (_1!272 (h!987 (t!2824 (t!2824 lt!3615))))))))

(declare-fun b!14673 () Bool)

(assert (=> b!14673 (= e!8803 (isStrictlySorted!113 (t!2824 (t!2824 lt!3615))))))

(assert (= (and d!2343 (not res!11283)) b!14672))

(assert (= (and b!14672 res!11284) b!14673))

(declare-fun m!9801 () Bool)

(assert (=> b!14673 m!9801))

(assert (=> b!14510 d!2343))

(declare-fun d!2345 () Bool)

(declare-fun res!11285 () Bool)

(declare-fun e!8804 () Bool)

(assert (=> d!2345 (=> res!11285 e!8804)))

(assert (=> d!2345 (= res!11285 (or (is-Nil!422 (t!2824 l!522)) (is-Nil!422 (t!2824 (t!2824 l!522)))))))

(assert (=> d!2345 (= (isStrictlySorted!113 (t!2824 l!522)) e!8804)))

(declare-fun b!14674 () Bool)

(declare-fun e!8805 () Bool)

(assert (=> b!14674 (= e!8804 e!8805)))

(declare-fun res!11286 () Bool)

(assert (=> b!14674 (=> (not res!11286) (not e!8805))))

(assert (=> b!14674 (= res!11286 (bvslt (_1!272 (h!987 (t!2824 l!522))) (_1!272 (h!987 (t!2824 (t!2824 l!522))))))))

(declare-fun b!14675 () Bool)

(assert (=> b!14675 (= e!8805 (isStrictlySorted!113 (t!2824 (t!2824 l!522))))))

(assert (= (and d!2345 (not res!11285)) b!14674))

(assert (= (and b!14674 res!11286) b!14675))

(assert (=> b!14675 m!9799))

(assert (=> b!14595 d!2345))

(declare-fun d!2347 () Bool)

(declare-fun res!11287 () Bool)

(declare-fun e!8806 () Bool)

(assert (=> d!2347 (=> res!11287 e!8806)))

(assert (=> d!2347 (= res!11287 (is-Nil!422 (t!2824 lt!3615)))))

(assert (=> d!2347 (= (forall!97 (t!2824 lt!3615) lambda!161) e!8806)))

(declare-fun b!14676 () Bool)

(declare-fun e!8807 () Bool)

(assert (=> b!14676 (= e!8806 e!8807)))

(declare-fun res!11288 () Bool)

(assert (=> b!14676 (=> (not res!11288) (not e!8807))))

(assert (=> b!14676 (= res!11288 (dynLambda!89 lambda!161 (h!987 (t!2824 lt!3615))))))

(declare-fun b!14677 () Bool)

(assert (=> b!14677 (= e!8807 (forall!97 (t!2824 (t!2824 lt!3615)) lambda!161))))

(assert (= (and d!2347 (not res!11287)) b!14676))

(assert (= (and b!14676 res!11288) b!14677))

(declare-fun b_lambda!943 () Bool)

(assert (=> (not b_lambda!943) (not b!14676)))

(declare-fun m!9803 () Bool)

(assert (=> b!14676 m!9803))

(declare-fun m!9805 () Bool)

(assert (=> b!14677 m!9805))

(assert (=> b!14593 d!2347))

(declare-fun d!2349 () Bool)

(declare-fun res!11289 () Bool)

(declare-fun e!8808 () Bool)

(assert (=> d!2349 (=> res!11289 e!8808)))

(assert (=> d!2349 (= res!11289 (or (is-Nil!422 lt!3622) (is-Nil!422 (t!2824 lt!3622))))))

(assert (=> d!2349 (= (isStrictlySorted!113 lt!3622) e!8808)))

(declare-fun b!14678 () Bool)

(declare-fun e!8809 () Bool)

(assert (=> b!14678 (= e!8808 e!8809)))

(declare-fun res!11290 () Bool)

(assert (=> b!14678 (=> (not res!11290) (not e!8809))))

(assert (=> b!14678 (= res!11290 (bvslt (_1!272 (h!987 lt!3622)) (_1!272 (h!987 (t!2824 lt!3622)))))))

(declare-fun b!14679 () Bool)

(assert (=> b!14679 (= e!8809 (isStrictlySorted!113 (t!2824 lt!3622)))))

(assert (= (and d!2349 (not res!11289)) b!14678))

(assert (= (and b!14678 res!11290) b!14679))

(declare-fun m!9807 () Bool)

(assert (=> b!14679 m!9807))

(assert (=> d!2275 d!2349))

(assert (=> d!2275 d!2345))

(declare-fun d!2351 () Bool)

(assert (=> d!2351 (= (head!793 lt!3622) (h!987 lt!3622))))

(assert (=> b!14567 d!2351))

(declare-fun d!2353 () Bool)

(assert (=> d!2353 (= (head!793 (t!2824 l!522)) (h!987 (t!2824 l!522)))))

(assert (=> b!14567 d!2353))

(declare-fun d!2355 () Bool)

(assert (=> d!2355 (= (isEmpty!104 (t!2824 l!522)) (is-Nil!422 (t!2824 l!522)))))

(assert (=> b!14559 d!2355))

(declare-fun d!2357 () Bool)

(assert (=> d!2357 (= ($colon$colon!21 call!434 (h!987 (t!2824 l!522))) (Cons!421 (h!987 (t!2824 l!522)) call!434))))

(assert (=> b!14566 d!2357))

(declare-fun d!2359 () Bool)

(assert (=> d!2359 (= (isEmpty!104 lt!3622) (is-Nil!422 lt!3622))))

(assert (=> bm!432 d!2359))

(declare-fun d!2361 () Bool)

(declare-fun res!11291 () Bool)

(declare-fun e!8810 () Bool)

(assert (=> d!2361 (=> res!11291 e!8810)))

(assert (=> d!2361 (= res!11291 (is-Nil!422 lt!3622))))

(assert (=> d!2361 (= (forall!97 lt!3622 lambda!164) e!8810)))

(declare-fun b!14680 () Bool)

(declare-fun e!8811 () Bool)

(assert (=> b!14680 (= e!8810 e!8811)))

(declare-fun res!11292 () Bool)

(assert (=> b!14680 (=> (not res!11292) (not e!8811))))

(assert (=> b!14680 (= res!11292 (dynLambda!89 lambda!164 (h!987 lt!3622)))))

(declare-fun b!14681 () Bool)

(assert (=> b!14681 (= e!8811 (forall!97 (t!2824 lt!3622) lambda!164))))

(assert (= (and d!2361 (not res!11291)) b!14680))

(assert (= (and b!14680 res!11292) b!14681))

(declare-fun b_lambda!945 () Bool)

(assert (=> (not b_lambda!945) (not b!14680)))

(declare-fun m!9809 () Bool)

(assert (=> b!14680 m!9809))

(declare-fun m!9811 () Bool)

(assert (=> b!14681 m!9811))

(assert (=> b!14563 d!2361))

(declare-fun b!14682 () Bool)

(declare-fun e!8812 () Bool)

(declare-fun tp!2359 () Bool)

(assert (=> b!14682 (= e!8812 (and tp_is_empty!731 tp!2359))))

(assert (=> b!14618 (= tp!2351 e!8812)))

(assert (= (and b!14618 (is-Cons!421 (t!2824 (t!2824 l!522)))) b!14682))

(declare-fun b_lambda!947 () Bool)

(assert (= b_lambda!943 (or b!14502 b_lambda!947)))

(declare-fun bs!591 () Bool)

(declare-fun d!2363 () Bool)

(assert (= bs!591 (and d!2363 b!14502)))

(assert (=> bs!591 (= (dynLambda!89 lambda!161 (h!987 (t!2824 lt!3615))) (= (_2!272 (h!987 (t!2824 lt!3615))) value!159))))

(assert (=> b!14676 d!2363))

(declare-fun b_lambda!949 () Bool)

(assert (= b_lambda!945 (or b!14563 b_lambda!949)))

(declare-fun bs!592 () Bool)

(declare-fun d!2365 () Bool)

(assert (= bs!592 (and d!2365 b!14563)))

(assert (=> bs!592 (= (dynLambda!89 lambda!164 (h!987 lt!3622)) (= (_2!272 (h!987 lt!3622)) value!159))))

(assert (=> b!14680 d!2365))

(push 1)

(assert (not d!2341))

(assert (not b!14675))

(assert (not b!14663))

(assert (not b!14679))

(assert (not b!14670))

(assert (not b!14682))

(assert (not b!14681))

(assert (not b_lambda!949))

(assert (not b!14671))

(assert (not b!14677))

(assert (not bm!444))

(assert (not b!14667))

(assert tp_is_empty!731)

(assert (not b_lambda!947))

(assert (not b!14673))

(assert (not bm!443))

(assert (not b_lambda!925))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

