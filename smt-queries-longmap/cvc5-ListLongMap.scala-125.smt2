; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2152 () Bool)

(assert start!2152)

(declare-fun b!14493 () Bool)

(assert (=> b!14493 true))

(declare-fun b!14489 () Bool)

(declare-fun e!8679 () Bool)

(declare-fun tp_is_empty!731 () Bool)

(declare-fun tp!2348 () Bool)

(assert (=> b!14489 (= e!8679 (and tp_is_empty!731 tp!2348))))

(declare-fun b!14490 () Bool)

(declare-fun e!8676 () Bool)

(declare-fun e!8677 () Bool)

(assert (=> b!14490 (= e!8676 e!8677)))

(declare-fun c!1353 () Bool)

(declare-datatypes ((B!552 0))(
  ( (B!553 (val!374 Int)) )
))
(declare-datatypes ((tuple2!544 0))(
  ( (tuple2!545 (_1!272 (_ BitVec 64)) (_2!272 B!552)) )
))
(declare-datatypes ((List!425 0))(
  ( (Nil!422) (Cons!421 (h!987 tuple2!544) (t!2824 List!425)) )
))
(declare-fun l!522 () List!425)

(declare-fun isEmpty!104 (List!425) Bool)

(assert (=> b!14490 (= c!1353 (isEmpty!104 l!522))))

(declare-fun res!11192 () Bool)

(declare-fun e!8678 () Bool)

(assert (=> start!2152 (=> (not res!11192) (not e!8678))))

(declare-fun isStrictlySorted!110 (List!425) Bool)

(assert (=> start!2152 (= res!11192 (isStrictlySorted!110 l!522))))

(assert (=> start!2152 e!8678))

(assert (=> start!2152 e!8679))

(assert (=> start!2152 tp_is_empty!731))

(declare-fun b!14491 () Bool)

(declare-fun res!11191 () Bool)

(assert (=> b!14491 (=> (not res!11191) (not e!8678))))

(declare-fun value!159 () B!552)

(assert (=> b!14491 (= res!11191 (and (not (= (_2!272 (h!987 l!522)) value!159)) (is-Cons!421 l!522)))))

(declare-fun b!14492 () Bool)

(declare-fun e!8680 () Bool)

(assert (=> b!14492 (= e!8677 e!8680)))

(declare-fun res!11193 () Bool)

(declare-fun call!425 () Bool)

(assert (=> b!14492 (= res!11193 (not call!425))))

(assert (=> b!14492 (=> (not res!11193) (not e!8680))))

(declare-fun res!11194 () Bool)

(assert (=> b!14493 (=> res!11194 e!8676)))

(declare-fun lt!3615 () List!425)

(declare-fun lambda!161 () Int)

(declare-fun forall!97 (List!425 Int) Bool)

(assert (=> b!14493 (= res!11194 (not (forall!97 lt!3615 lambda!161)))))

(declare-fun b!14494 () Bool)

(assert (=> b!14494 (= e!8677 (not call!425))))

(declare-fun b!14495 () Bool)

(declare-fun head!791 (List!425) tuple2!544)

(assert (=> b!14495 (= e!8680 (bvslt (_1!272 (head!791 lt!3615)) (_1!272 (head!791 l!522))))))

(declare-fun b!14496 () Bool)

(assert (=> b!14496 (= e!8678 e!8676)))

(declare-fun res!11195 () Bool)

(assert (=> b!14496 (=> res!11195 e!8676)))

(assert (=> b!14496 (= res!11195 (not (isStrictlySorted!110 lt!3615)))))

(declare-fun filterByValue!18 (List!425 B!552) List!425)

(assert (=> b!14496 (= lt!3615 (filterByValue!18 (t!2824 l!522) value!159))))

(declare-fun bm!422 () Bool)

(assert (=> bm!422 (= call!425 (isEmpty!104 lt!3615))))

(assert (= (and start!2152 res!11192) b!14491))

(assert (= (and b!14491 res!11191) b!14496))

(assert (= (and b!14496 (not res!11195)) b!14493))

(assert (= (and b!14493 (not res!11194)) b!14490))

(assert (= (and b!14490 c!1353) b!14494))

(assert (= (and b!14490 (not c!1353)) b!14492))

(assert (= (and b!14492 res!11193) b!14495))

(assert (= (or b!14494 b!14492) bm!422))

(assert (= (and start!2152 (is-Cons!421 l!522)) b!14489))

(declare-fun m!9665 () Bool)

(assert (=> start!2152 m!9665))

(declare-fun m!9667 () Bool)

(assert (=> b!14493 m!9667))

(declare-fun m!9669 () Bool)

(assert (=> b!14496 m!9669))

(declare-fun m!9671 () Bool)

(assert (=> b!14496 m!9671))

(declare-fun m!9673 () Bool)

(assert (=> b!14495 m!9673))

(declare-fun m!9675 () Bool)

(assert (=> b!14495 m!9675))

(declare-fun m!9677 () Bool)

(assert (=> bm!422 m!9677))

(declare-fun m!9679 () Bool)

(assert (=> b!14490 m!9679))

(push 1)

(assert tp_is_empty!731)

(assert (not b!14493))

(assert (not b!14490))

(assert (not start!2152))

(assert (not b!14489))

(assert (not b!14496))

(assert (not bm!422))

(assert (not b!14495))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2263 () Bool)

(assert (=> d!2263 (= (head!791 lt!3615) (h!987 lt!3615))))

(assert (=> b!14495 d!2263))

(declare-fun d!2271 () Bool)

(assert (=> d!2271 (= (head!791 l!522) (h!987 l!522))))

(assert (=> b!14495 d!2271))

(declare-fun d!2273 () Bool)

(assert (=> d!2273 (= (isEmpty!104 l!522) (is-Nil!422 l!522))))

(assert (=> b!14490 d!2273))

(declare-fun d!2275 () Bool)

(declare-fun res!11214 () Bool)

(declare-fun e!8699 () Bool)

(assert (=> d!2275 (=> res!11214 e!8699)))

(assert (=> d!2275 (= res!11214 (is-Nil!422 lt!3615))))

(assert (=> d!2275 (= (forall!97 lt!3615 lambda!161) e!8699)))

(declare-fun b!14517 () Bool)

(declare-fun e!8700 () Bool)

(assert (=> b!14517 (= e!8699 e!8700)))

(declare-fun res!11215 () Bool)

(assert (=> b!14517 (=> (not res!11215) (not e!8700))))

(declare-fun dynLambda!90 (Int tuple2!544) Bool)

(assert (=> b!14517 (= res!11215 (dynLambda!90 lambda!161 (h!987 lt!3615)))))

(declare-fun b!14518 () Bool)

(assert (=> b!14518 (= e!8700 (forall!97 (t!2824 lt!3615) lambda!161))))

(assert (= (and d!2275 (not res!11214)) b!14517))

(assert (= (and b!14517 res!11215) b!14518))

(declare-fun b_lambda!923 () Bool)

(assert (=> (not b_lambda!923) (not b!14517)))

(declare-fun m!9687 () Bool)

(assert (=> b!14517 m!9687))

(declare-fun m!9689 () Bool)

(assert (=> b!14518 m!9689))

(assert (=> b!14493 d!2275))

(declare-fun d!2277 () Bool)

(declare-fun res!11220 () Bool)

(declare-fun e!8709 () Bool)

(assert (=> d!2277 (=> res!11220 e!8709)))

(assert (=> d!2277 (= res!11220 (or (is-Nil!422 lt!3615) (is-Nil!422 (t!2824 lt!3615))))))

(assert (=> d!2277 (= (isStrictlySorted!110 lt!3615) e!8709)))

(declare-fun b!14531 () Bool)

(declare-fun e!8710 () Bool)

(assert (=> b!14531 (= e!8709 e!8710)))

(declare-fun res!11221 () Bool)

(assert (=> b!14531 (=> (not res!11221) (not e!8710))))

(assert (=> b!14531 (= res!11221 (bvslt (_1!272 (h!987 lt!3615)) (_1!272 (h!987 (t!2824 lt!3615)))))))

(declare-fun b!14532 () Bool)

(assert (=> b!14532 (= e!8710 (isStrictlySorted!110 (t!2824 lt!3615)))))

(assert (= (and d!2277 (not res!11220)) b!14531))

(assert (= (and b!14531 res!11221) b!14532))

(declare-fun m!9691 () Bool)

(assert (=> b!14532 m!9691))

(assert (=> b!14496 d!2277))

(declare-fun bs!581 () Bool)

(declare-fun b!14619 () Bool)

(assert (= bs!581 (and b!14619 b!14493)))

(declare-fun lambda!170 () Int)

(assert (=> bs!581 (= lambda!170 lambda!161)))

(assert (=> b!14619 true))

(declare-fun b!14611 () Bool)

(declare-fun e!8761 () List!425)

(assert (=> b!14611 (= e!8761 Nil!422)))

(declare-fun b!14612 () Bool)

(declare-fun e!8765 () Bool)

(declare-fun lt!3624 () List!425)

(assert (=> b!14612 (= e!8765 (bvsge (_1!272 (head!791 lt!3624)) (_1!272 (head!791 (t!2824 l!522)))))))

(declare-fun b!14614 () Bool)

(declare-fun e!8762 () Bool)

(assert (=> b!14614 (= e!8762 e!8765)))

(declare-fun res!11261 () Bool)

(declare-fun call!442 () Bool)

(assert (=> b!14614 (= res!11261 call!442)))

(assert (=> b!14614 (=> res!11261 e!8765)))

(declare-fun b!14615 () Bool)

(declare-fun e!8764 () List!425)

(declare-fun call!443 () List!425)

(declare-fun $colon$colon!22 (List!425 tuple2!544) List!425)

(assert (=> b!14615 (= e!8764 ($colon$colon!22 call!443 (h!987 (t!2824 l!522))))))

(declare-fun b!14616 () Bool)

(assert (=> b!14616 (= e!8762 call!442)))

(declare-fun bm!439 () Bool)

(assert (=> bm!439 (= call!443 (filterByValue!18 (t!2824 (t!2824 l!522)) value!159))))

(declare-fun b!14617 () Bool)

(assert (=> b!14617 (= e!8761 call!443)))

(declare-fun b!14618 () Bool)

(assert (=> b!14618 (= e!8764 e!8761)))

(declare-fun c!1378 () Bool)

(assert (=> b!14618 (= c!1378 (and (is-Cons!421 (t!2824 l!522)) (not (= (_2!272 (h!987 (t!2824 l!522))) value!159))))))

(declare-fun b!14613 () Bool)

(declare-fun e!8763 () Bool)

(assert (=> b!14613 (= e!8763 e!8762)))

(declare-fun c!1379 () Bool)

(assert (=> b!14613 (= c!1379 (isEmpty!104 (t!2824 l!522)))))

(declare-fun d!2279 () Bool)

(assert (=> d!2279 e!8763))

(declare-fun res!11260 () Bool)

(assert (=> d!2279 (=> (not res!11260) (not e!8763))))

(assert (=> d!2279 (= res!11260 (isStrictlySorted!110 lt!3624))))

(assert (=> d!2279 (= lt!3624 e!8764)))

(declare-fun c!1380 () Bool)

(assert (=> d!2279 (= c!1380 (and (is-Cons!421 (t!2824 l!522)) (= (_2!272 (h!987 (t!2824 l!522))) value!159)))))

(assert (=> d!2279 (isStrictlySorted!110 (t!2824 l!522))))

(assert (=> d!2279 (= (filterByValue!18 (t!2824 l!522) value!159) lt!3624)))

(declare-fun res!11262 () Bool)

(assert (=> b!14619 (=> (not res!11262) (not e!8763))))

(assert (=> b!14619 (= res!11262 (forall!97 lt!3624 lambda!170))))

(declare-fun bm!440 () Bool)

(assert (=> bm!440 (= call!442 (isEmpty!104 lt!3624))))

(assert (= (and d!2279 c!1380) b!14615))

(assert (= (and d!2279 (not c!1380)) b!14618))

(assert (= (and b!14618 c!1378) b!14617))

(assert (= (and b!14618 (not c!1378)) b!14611))

(assert (= (or b!14615 b!14617) bm!439))

(assert (= (and d!2279 res!11260) b!14619))

(assert (= (and b!14619 res!11262) b!14613))

(assert (= (and b!14613 c!1379) b!14616))

(assert (= (and b!14613 (not c!1379)) b!14614))

(assert (= (and b!14614 (not res!11261)) b!14612))

(assert (= (or b!14616 b!14614) bm!440))

(declare-fun m!9735 () Bool)

(assert (=> d!2279 m!9735))

(declare-fun m!9737 () Bool)

(assert (=> d!2279 m!9737))

(declare-fun m!9739 () Bool)

(assert (=> b!14615 m!9739))

(declare-fun m!9741 () Bool)

(assert (=> b!14612 m!9741))

(declare-fun m!9743 () Bool)

(assert (=> b!14612 m!9743))

(declare-fun m!9745 () Bool)

(assert (=> b!14619 m!9745))

(declare-fun m!9747 () Bool)

(assert (=> bm!439 m!9747))

(declare-fun m!9749 () Bool)

(assert (=> b!14613 m!9749))

(declare-fun m!9751 () Bool)

(assert (=> bm!440 m!9751))

(assert (=> b!14496 d!2279))

(declare-fun d!2303 () Bool)

(declare-fun res!11263 () Bool)

(declare-fun e!8772 () Bool)

(assert (=> d!2303 (=> res!11263 e!8772)))

(assert (=> d!2303 (= res!11263 (or (is-Nil!422 l!522) (is-Nil!422 (t!2824 l!522))))))

(assert (=> d!2303 (= (isStrictlySorted!110 l!522) e!8772)))

(declare-fun b!14630 () Bool)

(declare-fun e!8773 () Bool)

(assert (=> b!14630 (= e!8772 e!8773)))

(declare-fun res!11264 () Bool)

(assert (=> b!14630 (=> (not res!11264) (not e!8773))))

(assert (=> b!14630 (= res!11264 (bvslt (_1!272 (h!987 l!522)) (_1!272 (h!987 (t!2824 l!522)))))))

(declare-fun b!14631 () Bool)

(assert (=> b!14631 (= e!8773 (isStrictlySorted!110 (t!2824 l!522)))))

(assert (= (and d!2303 (not res!11263)) b!14630))

(assert (= (and b!14630 res!11264) b!14631))

(assert (=> b!14631 m!9737))

(assert (=> start!2152 d!2303))

(declare-fun d!2307 () Bool)

(assert (=> d!2307 (= (isEmpty!104 lt!3615) (is-Nil!422 lt!3615))))

(assert (=> bm!422 d!2307))

(declare-fun b!14636 () Bool)

(declare-fun e!8776 () Bool)

(declare-fun tp!2357 () Bool)

(assert (=> b!14636 (= e!8776 (and tp_is_empty!731 tp!2357))))

(assert (=> b!14489 (= tp!2348 e!8776)))

(assert (= (and b!14489 (is-Cons!421 (t!2824 l!522))) b!14636))

(declare-fun b_lambda!933 () Bool)

(assert (= b_lambda!923 (or b!14493 b_lambda!933)))

(declare-fun bs!584 () Bool)

(declare-fun d!2309 () Bool)

(assert (= bs!584 (and d!2309 b!14493)))

(assert (=> bs!584 (= (dynLambda!90 lambda!161 (h!987 lt!3615)) (= (_2!272 (h!987 lt!3615)) value!159))))

(assert (=> b!14517 d!2309))

(push 1)

(assert (not b!14636))

(assert (not b!14518))

(assert (not bm!440))

(assert (not b!14615))

(assert (not d!2279))

(assert (not b_lambda!933))

(assert (not b!14532))

(assert (not b!14612))

(assert (not b!14619))

(assert (not b!14613))

(assert tp_is_empty!731)

(assert (not bm!439))

(assert (not b!14631))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2337 () Bool)

(declare-fun res!11278 () Bool)

(declare-fun e!8793 () Bool)

(assert (=> d!2337 (=> res!11278 e!8793)))

(assert (=> d!2337 (= res!11278 (or (is-Nil!422 (t!2824 lt!3615)) (is-Nil!422 (t!2824 (t!2824 lt!3615)))))))

(assert (=> d!2337 (= (isStrictlySorted!110 (t!2824 lt!3615)) e!8793)))

(declare-fun b!14657 () Bool)

(declare-fun e!8794 () Bool)

(assert (=> b!14657 (= e!8793 e!8794)))

(declare-fun res!11279 () Bool)

(assert (=> b!14657 (=> (not res!11279) (not e!8794))))

(assert (=> b!14657 (= res!11279 (bvslt (_1!272 (h!987 (t!2824 lt!3615))) (_1!272 (h!987 (t!2824 (t!2824 lt!3615))))))))

(declare-fun b!14658 () Bool)

(assert (=> b!14658 (= e!8794 (isStrictlySorted!110 (t!2824 (t!2824 lt!3615))))))

(assert (= (and d!2337 (not res!11278)) b!14657))

(assert (= (and b!14657 res!11279) b!14658))

(declare-fun m!9783 () Bool)

(assert (=> b!14658 m!9783))

(assert (=> b!14532 d!2337))

(declare-fun d!2339 () Bool)

(assert (=> d!2339 (= (isEmpty!104 (t!2824 l!522)) (is-Nil!422 (t!2824 l!522)))))

(assert (=> b!14613 d!2339))

(declare-fun d!2341 () Bool)

(declare-fun res!11280 () Bool)

(declare-fun e!8795 () Bool)

(assert (=> d!2341 (=> res!11280 e!8795)))

(assert (=> d!2341 (= res!11280 (or (is-Nil!422 (t!2824 l!522)) (is-Nil!422 (t!2824 (t!2824 l!522)))))))

(assert (=> d!2341 (= (isStrictlySorted!110 (t!2824 l!522)) e!8795)))

(declare-fun b!14659 () Bool)

(declare-fun e!8796 () Bool)

(assert (=> b!14659 (= e!8795 e!8796)))

(declare-fun res!11281 () Bool)

(assert (=> b!14659 (=> (not res!11281) (not e!8796))))

(assert (=> b!14659 (= res!11281 (bvslt (_1!272 (h!987 (t!2824 l!522))) (_1!272 (h!987 (t!2824 (t!2824 l!522))))))))

(declare-fun b!14660 () Bool)

(assert (=> b!14660 (= e!8796 (isStrictlySorted!110 (t!2824 (t!2824 l!522))))))

(assert (= (and d!2341 (not res!11280)) b!14659))

(assert (= (and b!14659 res!11281) b!14660))

(declare-fun m!9785 () Bool)

(assert (=> b!14660 m!9785))

(assert (=> b!14631 d!2341))

(declare-fun d!2343 () Bool)

(assert (=> d!2343 (= ($colon$colon!22 call!443 (h!987 (t!2824 l!522))) (Cons!421 (h!987 (t!2824 l!522)) call!443))))

(assert (=> b!14615 d!2343))

(declare-fun d!2345 () Bool)

(declare-fun res!11282 () Bool)

(declare-fun e!8797 () Bool)

(assert (=> d!2345 (=> res!11282 e!8797)))

(assert (=> d!2345 (= res!11282 (is-Nil!422 lt!3624))))

(assert (=> d!2345 (= (forall!97 lt!3624 lambda!170) e!8797)))

(declare-fun b!14661 () Bool)

(declare-fun e!8798 () Bool)

(assert (=> b!14661 (= e!8797 e!8798)))

(declare-fun res!11283 () Bool)

(assert (=> b!14661 (=> (not res!11283) (not e!8798))))

(assert (=> b!14661 (= res!11283 (dynLambda!90 lambda!170 (h!987 lt!3624)))))

(declare-fun b!14662 () Bool)

(assert (=> b!14662 (= e!8798 (forall!97 (t!2824 lt!3624) lambda!170))))

(assert (= (and d!2345 (not res!11282)) b!14661))

(assert (= (and b!14661 res!11283) b!14662))

(declare-fun b_lambda!943 () Bool)

(assert (=> (not b_lambda!943) (not b!14661)))

(declare-fun m!9787 () Bool)

(assert (=> b!14661 m!9787))

(declare-fun m!9789 () Bool)

(assert (=> b!14662 m!9789))

(assert (=> b!14619 d!2345))

(declare-fun d!2347 () Bool)

(declare-fun res!11284 () Bool)

(declare-fun e!8799 () Bool)

(assert (=> d!2347 (=> res!11284 e!8799)))

(assert (=> d!2347 (= res!11284 (is-Nil!422 (t!2824 lt!3615)))))

(assert (=> d!2347 (= (forall!97 (t!2824 lt!3615) lambda!161) e!8799)))

(declare-fun b!14663 () Bool)

(declare-fun e!8800 () Bool)

(assert (=> b!14663 (= e!8799 e!8800)))

(declare-fun res!11285 () Bool)

(assert (=> b!14663 (=> (not res!11285) (not e!8800))))

(assert (=> b!14663 (= res!11285 (dynLambda!90 lambda!161 (h!987 (t!2824 lt!3615))))))

(declare-fun b!14664 () Bool)

(assert (=> b!14664 (= e!8800 (forall!97 (t!2824 (t!2824 lt!3615)) lambda!161))))

(assert (= (and d!2347 (not res!11284)) b!14663))

(assert (= (and b!14663 res!11285) b!14664))

(declare-fun b_lambda!945 () Bool)

(assert (=> (not b_lambda!945) (not b!14663)))

(declare-fun m!9791 () Bool)

(assert (=> b!14663 m!9791))

(declare-fun m!9793 () Bool)

(assert (=> b!14664 m!9793))

(assert (=> b!14518 d!2347))

(declare-fun d!2349 () Bool)

(assert (=> d!2349 (= (isEmpty!104 lt!3624) (is-Nil!422 lt!3624))))

(assert (=> bm!440 d!2349))

(declare-fun d!2351 () Bool)

(declare-fun res!11286 () Bool)

(declare-fun e!8801 () Bool)

(assert (=> d!2351 (=> res!11286 e!8801)))

(assert (=> d!2351 (= res!11286 (or (is-Nil!422 lt!3624) (is-Nil!422 (t!2824 lt!3624))))))

(assert (=> d!2351 (= (isStrictlySorted!110 lt!3624) e!8801)))

(declare-fun b!14665 () Bool)

(declare-fun e!8802 () Bool)

(assert (=> b!14665 (= e!8801 e!8802)))

(declare-fun res!11287 () Bool)

(assert (=> b!14665 (=> (not res!11287) (not e!8802))))

(assert (=> b!14665 (= res!11287 (bvslt (_1!272 (h!987 lt!3624)) (_1!272 (h!987 (t!2824 lt!3624)))))))

(declare-fun b!14666 () Bool)

(assert (=> b!14666 (= e!8802 (isStrictlySorted!110 (t!2824 lt!3624)))))

(assert (= (and d!2351 (not res!11286)) b!14665))

(assert (= (and b!14665 res!11287) b!14666))

(declare-fun m!9795 () Bool)

(assert (=> b!14666 m!9795))

(assert (=> d!2279 d!2351))

(assert (=> d!2279 d!2341))

(declare-fun d!2353 () Bool)

(assert (=> d!2353 (= (head!791 lt!3624) (h!987 lt!3624))))

(assert (=> b!14612 d!2353))

(declare-fun d!2355 () Bool)

(assert (=> d!2355 (= (head!791 (t!2824 l!522)) (h!987 (t!2824 l!522)))))

(assert (=> b!14612 d!2355))

(declare-fun bs!589 () Bool)

(declare-fun b!14675 () Bool)

(assert (= bs!589 (and b!14675 b!14493)))

(declare-fun lambda!172 () Int)

(assert (=> bs!589 (= lambda!172 lambda!161)))

(declare-fun bs!590 () Bool)

(assert (= bs!590 (and b!14675 b!14619)))

(assert (=> bs!590 (= lambda!172 lambda!170)))

(assert (=> b!14675 true))

(declare-fun b!14667 () Bool)

(declare-fun e!8803 () List!425)

(assert (=> b!14667 (= e!8803 Nil!422)))

(declare-fun b!14668 () Bool)

(declare-fun e!8807 () Bool)

(declare-fun lt!3626 () List!425)

(assert (=> b!14668 (= e!8807 (bvsge (_1!272 (head!791 lt!3626)) (_1!272 (head!791 (t!2824 (t!2824 l!522))))))))

(declare-fun b!14670 () Bool)

(declare-fun e!8804 () Bool)

(assert (=> b!14670 (= e!8804 e!8807)))

(declare-fun res!11289 () Bool)

(declare-fun call!446 () Bool)

(assert (=> b!14670 (= res!11289 call!446)))

(assert (=> b!14670 (=> res!11289 e!8807)))

(declare-fun b!14671 () Bool)

(declare-fun e!8806 () List!425)

(declare-fun call!447 () List!425)

(assert (=> b!14671 (= e!8806 ($colon$colon!22 call!447 (h!987 (t!2824 (t!2824 l!522)))))))

(declare-fun b!14672 () Bool)

(assert (=> b!14672 (= e!8804 call!446)))

(declare-fun bm!443 () Bool)

(assert (=> bm!443 (= call!447 (filterByValue!18 (t!2824 (t!2824 (t!2824 l!522))) value!159))))

(declare-fun b!14673 () Bool)

(assert (=> b!14673 (= e!8803 call!447)))

(declare-fun b!14674 () Bool)

(assert (=> b!14674 (= e!8806 e!8803)))

(declare-fun c!1384 () Bool)

(assert (=> b!14674 (= c!1384 (and (is-Cons!421 (t!2824 (t!2824 l!522))) (not (= (_2!272 (h!987 (t!2824 (t!2824 l!522)))) value!159))))))

(declare-fun b!14669 () Bool)

(declare-fun e!8805 () Bool)

(assert (=> b!14669 (= e!8805 e!8804)))

(declare-fun c!1385 () Bool)

(assert (=> b!14669 (= c!1385 (isEmpty!104 (t!2824 (t!2824 l!522))))))

(declare-fun d!2357 () Bool)

(assert (=> d!2357 e!8805))

(declare-fun res!11288 () Bool)

(assert (=> d!2357 (=> (not res!11288) (not e!8805))))

(assert (=> d!2357 (= res!11288 (isStrictlySorted!110 lt!3626))))

(assert (=> d!2357 (= lt!3626 e!8806)))

(declare-fun c!1386 () Bool)

(assert (=> d!2357 (= c!1386 (and (is-Cons!421 (t!2824 (t!2824 l!522))) (= (_2!272 (h!987 (t!2824 (t!2824 l!522)))) value!159)))))

(assert (=> d!2357 (isStrictlySorted!110 (t!2824 (t!2824 l!522)))))

(assert (=> d!2357 (= (filterByValue!18 (t!2824 (t!2824 l!522)) value!159) lt!3626)))

(declare-fun res!11290 () Bool)

(assert (=> b!14675 (=> (not res!11290) (not e!8805))))

(assert (=> b!14675 (= res!11290 (forall!97 lt!3626 lambda!172))))

(declare-fun bm!444 () Bool)

(assert (=> bm!444 (= call!446 (isEmpty!104 lt!3626))))

(assert (= (and d!2357 c!1386) b!14671))

(assert (= (and d!2357 (not c!1386)) b!14674))

(assert (= (and b!14674 c!1384) b!14673))

(assert (= (and b!14674 (not c!1384)) b!14667))

(assert (= (or b!14671 b!14673) bm!443))

(assert (= (and d!2357 res!11288) b!14675))

(assert (= (and b!14675 res!11290) b!14669))

(assert (= (and b!14669 c!1385) b!14672))

(assert (= (and b!14669 (not c!1385)) b!14670))

(assert (= (and b!14670 (not res!11289)) b!14668))

(assert (= (or b!14672 b!14670) bm!444))

(declare-fun m!9797 () Bool)

(assert (=> d!2357 m!9797))

(assert (=> d!2357 m!9785))

(declare-fun m!9799 () Bool)

(assert (=> b!14671 m!9799))

(declare-fun m!9801 () Bool)

(assert (=> b!14668 m!9801))

(declare-fun m!9803 () Bool)

(assert (=> b!14668 m!9803))

(declare-fun m!9805 () Bool)

(assert (=> b!14675 m!9805))

(declare-fun m!9807 () Bool)

(assert (=> bm!443 m!9807))

(declare-fun m!9809 () Bool)

(assert (=> b!14669 m!9809))

(declare-fun m!9811 () Bool)

(assert (=> bm!444 m!9811))

(assert (=> bm!439 d!2357))

(declare-fun b!14676 () Bool)

(declare-fun e!8808 () Bool)

(declare-fun tp!2359 () Bool)

(assert (=> b!14676 (= e!8808 (and tp_is_empty!731 tp!2359))))

(assert (=> b!14636 (= tp!2357 e!8808)))

(assert (= (and b!14636 (is-Cons!421 (t!2824 (t!2824 l!522)))) b!14676))

(declare-fun b_lambda!947 () Bool)

(assert (= b_lambda!943 (or b!14619 b_lambda!947)))

(declare-fun bs!591 () Bool)

(declare-fun d!2359 () Bool)

(assert (= bs!591 (and d!2359 b!14619)))

(assert (=> bs!591 (= (dynLambda!90 lambda!170 (h!987 lt!3624)) (= (_2!272 (h!987 lt!3624)) value!159))))

(assert (=> b!14661 d!2359))

(declare-fun b_lambda!949 () Bool)

(assert (= b_lambda!945 (or b!14493 b_lambda!949)))

(declare-fun bs!592 () Bool)

(declare-fun d!2361 () Bool)

(assert (= bs!592 (and d!2361 b!14493)))

(assert (=> bs!592 (= (dynLambda!90 lambda!161 (h!987 (t!2824 lt!3615))) (= (_2!272 (h!987 (t!2824 lt!3615))) value!159))))

(assert (=> b!14663 d!2361))

(push 1)

(assert tp_is_empty!731)

(assert (not b!14664))

(assert (not b!14658))

(assert (not b!14676))

(assert (not b!14671))

(assert (not b!14675))

(assert (not b!14660))

(assert (not b_lambda!947))

(assert (not b!14669))

(assert (not b!14662))

(assert (not b!14666))

(assert (not b!14668))

(assert (not bm!444))

(assert (not bm!443))

(assert (not b_lambda!933))

(assert (not b_lambda!949))

(assert (not d!2357))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

