; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133068 () Bool)

(assert start!133068)

(declare-fun b!1557374 () Bool)

(declare-fun res!1065300 () Bool)

(declare-fun e!867494 () Bool)

(assert (=> b!1557374 (=> (not res!1065300) (not e!867494))))

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun newKey!135 () (_ BitVec 64))

(declare-datatypes ((B!2402 0))(
  ( (B!2403 (val!19287 Int)) )
))
(declare-datatypes ((tuple2!25022 0))(
  ( (tuple2!25023 (_1!12522 (_ BitVec 64)) (_2!12522 B!2402)) )
))
(declare-datatypes ((List!36366 0))(
  ( (Nil!36363) (Cons!36362 (h!37809 tuple2!25022) (t!51085 List!36366)) )
))
(declare-fun l!1292 () List!36366)

(get-info :version)

(assert (=> b!1557374 (= res!1065300 (and (not (= otherKey!62 newKey!135)) ((_ is Cons!36362) l!1292) (not (= (_1!12522 (h!37809 l!1292)) otherKey!62))))))

(declare-fun b!1557375 () Bool)

(declare-fun e!867493 () Bool)

(declare-fun tp_is_empty!38407 () Bool)

(declare-fun tp!112558 () Bool)

(assert (=> b!1557375 (= e!867493 (and tp_is_empty!38407 tp!112558))))

(declare-fun b!1557376 () Bool)

(declare-fun res!1065301 () Bool)

(assert (=> b!1557376 (=> (not res!1065301) (not e!867494))))

(declare-fun containsKey!825 (List!36366 (_ BitVec 64)) Bool)

(assert (=> b!1557376 (= res!1065301 (containsKey!825 (t!51085 l!1292) otherKey!62))))

(declare-fun b!1557377 () Bool)

(declare-fun res!1065299 () Bool)

(assert (=> b!1557377 (=> (not res!1065299) (not e!867494))))

(assert (=> b!1557377 (= res!1065299 (containsKey!825 l!1292 otherKey!62))))

(declare-fun res!1065297 () Bool)

(assert (=> start!133068 (=> (not res!1065297) (not e!867494))))

(declare-fun isStrictlySorted!963 (List!36366) Bool)

(assert (=> start!133068 (= res!1065297 (isStrictlySorted!963 l!1292))))

(assert (=> start!133068 e!867494))

(assert (=> start!133068 e!867493))

(assert (=> start!133068 true))

(assert (=> start!133068 tp_is_empty!38407))

(declare-fun newValue!135 () B!2402)

(declare-fun b!1557378 () Bool)

(declare-fun insertStrictlySorted!565 (List!36366 (_ BitVec 64) B!2402) List!36366)

(assert (=> b!1557378 (= e!867494 (not (isStrictlySorted!963 (insertStrictlySorted!565 l!1292 newKey!135 newValue!135))))))

(assert (=> b!1557378 (containsKey!825 (insertStrictlySorted!565 (t!51085 l!1292) newKey!135 newValue!135) otherKey!62)))

(declare-datatypes ((Unit!51698 0))(
  ( (Unit!51699) )
))
(declare-fun lt!670441 () Unit!51698)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!7 (List!36366 (_ BitVec 64) B!2402 (_ BitVec 64)) Unit!51698)

(assert (=> b!1557378 (= lt!670441 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!7 (t!51085 l!1292) newKey!135 newValue!135 otherKey!62))))

(declare-fun b!1557379 () Bool)

(declare-fun res!1065298 () Bool)

(assert (=> b!1557379 (=> (not res!1065298) (not e!867494))))

(assert (=> b!1557379 (= res!1065298 (isStrictlySorted!963 (t!51085 l!1292)))))

(assert (= (and start!133068 res!1065297) b!1557377))

(assert (= (and b!1557377 res!1065299) b!1557374))

(assert (= (and b!1557374 res!1065300) b!1557379))

(assert (= (and b!1557379 res!1065298) b!1557376))

(assert (= (and b!1557376 res!1065301) b!1557378))

(assert (= (and start!133068 ((_ is Cons!36362) l!1292)) b!1557375))

(declare-fun m!1433867 () Bool)

(assert (=> b!1557377 m!1433867))

(declare-fun m!1433869 () Bool)

(assert (=> b!1557376 m!1433869))

(declare-fun m!1433871 () Bool)

(assert (=> b!1557378 m!1433871))

(declare-fun m!1433873 () Bool)

(assert (=> b!1557378 m!1433873))

(assert (=> b!1557378 m!1433871))

(declare-fun m!1433875 () Bool)

(assert (=> b!1557378 m!1433875))

(declare-fun m!1433877 () Bool)

(assert (=> b!1557378 m!1433877))

(assert (=> b!1557378 m!1433875))

(declare-fun m!1433879 () Bool)

(assert (=> b!1557378 m!1433879))

(declare-fun m!1433881 () Bool)

(assert (=> b!1557379 m!1433881))

(declare-fun m!1433883 () Bool)

(assert (=> start!133068 m!1433883))

(check-sat (not b!1557379) (not start!133068) (not b!1557375) (not b!1557378) (not b!1557376) (not b!1557377) tp_is_empty!38407)
(check-sat)
(get-model)

(declare-fun d!162259 () Bool)

(declare-fun res!1065346 () Bool)

(declare-fun e!867521 () Bool)

(assert (=> d!162259 (=> res!1065346 e!867521)))

(assert (=> d!162259 (= res!1065346 (and ((_ is Cons!36362) (t!51085 l!1292)) (= (_1!12522 (h!37809 (t!51085 l!1292))) otherKey!62)))))

(assert (=> d!162259 (= (containsKey!825 (t!51085 l!1292) otherKey!62) e!867521)))

(declare-fun b!1557430 () Bool)

(declare-fun e!867522 () Bool)

(assert (=> b!1557430 (= e!867521 e!867522)))

(declare-fun res!1065347 () Bool)

(assert (=> b!1557430 (=> (not res!1065347) (not e!867522))))

(assert (=> b!1557430 (= res!1065347 (and (or (not ((_ is Cons!36362) (t!51085 l!1292))) (bvsle (_1!12522 (h!37809 (t!51085 l!1292))) otherKey!62)) ((_ is Cons!36362) (t!51085 l!1292)) (bvslt (_1!12522 (h!37809 (t!51085 l!1292))) otherKey!62)))))

(declare-fun b!1557431 () Bool)

(assert (=> b!1557431 (= e!867522 (containsKey!825 (t!51085 (t!51085 l!1292)) otherKey!62))))

(assert (= (and d!162259 (not res!1065346)) b!1557430))

(assert (= (and b!1557430 res!1065347) b!1557431))

(declare-fun m!1433921 () Bool)

(assert (=> b!1557431 m!1433921))

(assert (=> b!1557376 d!162259))

(declare-fun d!162265 () Bool)

(declare-fun res!1065368 () Bool)

(declare-fun e!867543 () Bool)

(assert (=> d!162265 (=> res!1065368 e!867543)))

(assert (=> d!162265 (= res!1065368 (or ((_ is Nil!36363) l!1292) ((_ is Nil!36363) (t!51085 l!1292))))))

(assert (=> d!162265 (= (isStrictlySorted!963 l!1292) e!867543)))

(declare-fun b!1557452 () Bool)

(declare-fun e!867544 () Bool)

(assert (=> b!1557452 (= e!867543 e!867544)))

(declare-fun res!1065369 () Bool)

(assert (=> b!1557452 (=> (not res!1065369) (not e!867544))))

(assert (=> b!1557452 (= res!1065369 (bvslt (_1!12522 (h!37809 l!1292)) (_1!12522 (h!37809 (t!51085 l!1292)))))))

(declare-fun b!1557453 () Bool)

(assert (=> b!1557453 (= e!867544 (isStrictlySorted!963 (t!51085 l!1292)))))

(assert (= (and d!162265 (not res!1065368)) b!1557452))

(assert (= (and b!1557452 res!1065369) b!1557453))

(assert (=> b!1557453 m!1433881))

(assert (=> start!133068 d!162265))

(declare-fun d!162275 () Bool)

(declare-fun res!1065370 () Bool)

(declare-fun e!867545 () Bool)

(assert (=> d!162275 (=> res!1065370 e!867545)))

(assert (=> d!162275 (= res!1065370 (or ((_ is Nil!36363) (t!51085 l!1292)) ((_ is Nil!36363) (t!51085 (t!51085 l!1292)))))))

(assert (=> d!162275 (= (isStrictlySorted!963 (t!51085 l!1292)) e!867545)))

(declare-fun b!1557454 () Bool)

(declare-fun e!867546 () Bool)

(assert (=> b!1557454 (= e!867545 e!867546)))

(declare-fun res!1065371 () Bool)

(assert (=> b!1557454 (=> (not res!1065371) (not e!867546))))

(assert (=> b!1557454 (= res!1065371 (bvslt (_1!12522 (h!37809 (t!51085 l!1292))) (_1!12522 (h!37809 (t!51085 (t!51085 l!1292))))))))

(declare-fun b!1557455 () Bool)

(assert (=> b!1557455 (= e!867546 (isStrictlySorted!963 (t!51085 (t!51085 l!1292))))))

(assert (= (and d!162275 (not res!1065370)) b!1557454))

(assert (= (and b!1557454 res!1065371) b!1557455))

(declare-fun m!1433929 () Bool)

(assert (=> b!1557455 m!1433929))

(assert (=> b!1557379 d!162275))

(declare-fun d!162277 () Bool)

(declare-fun res!1065372 () Bool)

(declare-fun e!867547 () Bool)

(assert (=> d!162277 (=> res!1065372 e!867547)))

(assert (=> d!162277 (= res!1065372 (and ((_ is Cons!36362) l!1292) (= (_1!12522 (h!37809 l!1292)) otherKey!62)))))

(assert (=> d!162277 (= (containsKey!825 l!1292 otherKey!62) e!867547)))

(declare-fun b!1557456 () Bool)

(declare-fun e!867548 () Bool)

(assert (=> b!1557456 (= e!867547 e!867548)))

(declare-fun res!1065373 () Bool)

(assert (=> b!1557456 (=> (not res!1065373) (not e!867548))))

(assert (=> b!1557456 (= res!1065373 (and (or (not ((_ is Cons!36362) l!1292)) (bvsle (_1!12522 (h!37809 l!1292)) otherKey!62)) ((_ is Cons!36362) l!1292) (bvslt (_1!12522 (h!37809 l!1292)) otherKey!62)))))

(declare-fun b!1557457 () Bool)

(assert (=> b!1557457 (= e!867548 (containsKey!825 (t!51085 l!1292) otherKey!62))))

(assert (= (and d!162277 (not res!1065372)) b!1557456))

(assert (= (and b!1557456 res!1065373) b!1557457))

(assert (=> b!1557457 m!1433869))

(assert (=> b!1557377 d!162277))

(declare-fun d!162279 () Bool)

(declare-fun res!1065376 () Bool)

(declare-fun e!867551 () Bool)

(assert (=> d!162279 (=> res!1065376 e!867551)))

(assert (=> d!162279 (= res!1065376 (and ((_ is Cons!36362) (insertStrictlySorted!565 (t!51085 l!1292) newKey!135 newValue!135)) (= (_1!12522 (h!37809 (insertStrictlySorted!565 (t!51085 l!1292) newKey!135 newValue!135))) otherKey!62)))))

(assert (=> d!162279 (= (containsKey!825 (insertStrictlySorted!565 (t!51085 l!1292) newKey!135 newValue!135) otherKey!62) e!867551)))

(declare-fun b!1557460 () Bool)

(declare-fun e!867552 () Bool)

(assert (=> b!1557460 (= e!867551 e!867552)))

(declare-fun res!1065377 () Bool)

(assert (=> b!1557460 (=> (not res!1065377) (not e!867552))))

(assert (=> b!1557460 (= res!1065377 (and (or (not ((_ is Cons!36362) (insertStrictlySorted!565 (t!51085 l!1292) newKey!135 newValue!135))) (bvsle (_1!12522 (h!37809 (insertStrictlySorted!565 (t!51085 l!1292) newKey!135 newValue!135))) otherKey!62)) ((_ is Cons!36362) (insertStrictlySorted!565 (t!51085 l!1292) newKey!135 newValue!135)) (bvslt (_1!12522 (h!37809 (insertStrictlySorted!565 (t!51085 l!1292) newKey!135 newValue!135))) otherKey!62)))))

(declare-fun b!1557461 () Bool)

(assert (=> b!1557461 (= e!867552 (containsKey!825 (t!51085 (insertStrictlySorted!565 (t!51085 l!1292) newKey!135 newValue!135)) otherKey!62))))

(assert (= (and d!162279 (not res!1065376)) b!1557460))

(assert (= (and b!1557460 res!1065377) b!1557461))

(declare-fun m!1433933 () Bool)

(assert (=> b!1557461 m!1433933))

(assert (=> b!1557378 d!162279))

(declare-fun b!1557542 () Bool)

(declare-fun e!867597 () List!36366)

(declare-fun call!71679 () List!36366)

(assert (=> b!1557542 (= e!867597 call!71679)))

(declare-fun b!1557543 () Bool)

(declare-fun res!1065395 () Bool)

(declare-fun e!867594 () Bool)

(assert (=> b!1557543 (=> (not res!1065395) (not e!867594))))

(declare-fun lt!670456 () List!36366)

(assert (=> b!1557543 (= res!1065395 (containsKey!825 lt!670456 newKey!135))))

(declare-fun bm!71675 () Bool)

(declare-fun e!867596 () List!36366)

(declare-fun call!71678 () List!36366)

(declare-fun c!143946 () Bool)

(declare-fun $colon$colon!979 (List!36366 tuple2!25022) List!36366)

(assert (=> bm!71675 (= call!71678 ($colon$colon!979 e!867596 (ite c!143946 (h!37809 l!1292) (tuple2!25023 newKey!135 newValue!135))))))

(declare-fun c!143943 () Bool)

(assert (=> bm!71675 (= c!143943 c!143946)))

(declare-fun bm!71676 () Bool)

(declare-fun call!71680 () List!36366)

(assert (=> bm!71676 (= call!71679 call!71680)))

(declare-fun b!1557544 () Bool)

(declare-fun e!867593 () List!36366)

(assert (=> b!1557544 (= e!867593 call!71678)))

(declare-fun b!1557545 () Bool)

(declare-fun e!867595 () List!36366)

(assert (=> b!1557545 (= e!867593 e!867595)))

(declare-fun c!143944 () Bool)

(assert (=> b!1557545 (= c!143944 (and ((_ is Cons!36362) l!1292) (= (_1!12522 (h!37809 l!1292)) newKey!135)))))

(declare-fun b!1557546 () Bool)

(declare-fun c!143945 () Bool)

(assert (=> b!1557546 (= c!143945 (and ((_ is Cons!36362) l!1292) (bvsgt (_1!12522 (h!37809 l!1292)) newKey!135)))))

(assert (=> b!1557546 (= e!867595 e!867597)))

(declare-fun b!1557547 () Bool)

(assert (=> b!1557547 (= e!867596 (insertStrictlySorted!565 (t!51085 l!1292) newKey!135 newValue!135))))

(declare-fun bm!71677 () Bool)

(assert (=> bm!71677 (= call!71680 call!71678)))

(declare-fun b!1557548 () Bool)

(assert (=> b!1557548 (= e!867595 call!71680)))

(declare-fun b!1557549 () Bool)

(declare-fun contains!10166 (List!36366 tuple2!25022) Bool)

(assert (=> b!1557549 (= e!867594 (contains!10166 lt!670456 (tuple2!25023 newKey!135 newValue!135)))))

(declare-fun b!1557550 () Bool)

(assert (=> b!1557550 (= e!867597 call!71679)))

(declare-fun b!1557551 () Bool)

(assert (=> b!1557551 (= e!867596 (ite c!143944 (t!51085 l!1292) (ite c!143945 (Cons!36362 (h!37809 l!1292) (t!51085 l!1292)) Nil!36363)))))

(declare-fun d!162283 () Bool)

(assert (=> d!162283 e!867594))

(declare-fun res!1065394 () Bool)

(assert (=> d!162283 (=> (not res!1065394) (not e!867594))))

(assert (=> d!162283 (= res!1065394 (isStrictlySorted!963 lt!670456))))

(assert (=> d!162283 (= lt!670456 e!867593)))

(assert (=> d!162283 (= c!143946 (and ((_ is Cons!36362) l!1292) (bvslt (_1!12522 (h!37809 l!1292)) newKey!135)))))

(assert (=> d!162283 (isStrictlySorted!963 l!1292)))

(assert (=> d!162283 (= (insertStrictlySorted!565 l!1292 newKey!135 newValue!135) lt!670456)))

(assert (= (and d!162283 c!143946) b!1557544))

(assert (= (and d!162283 (not c!143946)) b!1557545))

(assert (= (and b!1557545 c!143944) b!1557548))

(assert (= (and b!1557545 (not c!143944)) b!1557546))

(assert (= (and b!1557546 c!143945) b!1557542))

(assert (= (and b!1557546 (not c!143945)) b!1557550))

(assert (= (or b!1557542 b!1557550) bm!71676))

(assert (= (or b!1557548 bm!71676) bm!71677))

(assert (= (or b!1557544 bm!71677) bm!71675))

(assert (= (and bm!71675 c!143943) b!1557547))

(assert (= (and bm!71675 (not c!143943)) b!1557551))

(assert (= (and d!162283 res!1065394) b!1557543))

(assert (= (and b!1557543 res!1065395) b!1557549))

(declare-fun m!1433951 () Bool)

(assert (=> b!1557549 m!1433951))

(declare-fun m!1433953 () Bool)

(assert (=> bm!71675 m!1433953))

(assert (=> b!1557547 m!1433871))

(declare-fun m!1433955 () Bool)

(assert (=> b!1557543 m!1433955))

(declare-fun m!1433957 () Bool)

(assert (=> d!162283 m!1433957))

(assert (=> d!162283 m!1433883))

(assert (=> b!1557378 d!162283))

(declare-fun d!162289 () Bool)

(assert (=> d!162289 (containsKey!825 (insertStrictlySorted!565 (t!51085 l!1292) newKey!135 newValue!135) otherKey!62)))

(declare-fun lt!670466 () Unit!51698)

(declare-fun choose!2077 (List!36366 (_ BitVec 64) B!2402 (_ BitVec 64)) Unit!51698)

(assert (=> d!162289 (= lt!670466 (choose!2077 (t!51085 l!1292) newKey!135 newValue!135 otherKey!62))))

(declare-fun e!867613 () Bool)

(assert (=> d!162289 e!867613))

(declare-fun res!1065416 () Bool)

(assert (=> d!162289 (=> (not res!1065416) (not e!867613))))

(assert (=> d!162289 (= res!1065416 (isStrictlySorted!963 (t!51085 l!1292)))))

(assert (=> d!162289 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!7 (t!51085 l!1292) newKey!135 newValue!135 otherKey!62) lt!670466)))

(declare-fun b!1557580 () Bool)

(declare-fun res!1065417 () Bool)

(assert (=> b!1557580 (=> (not res!1065417) (not e!867613))))

(assert (=> b!1557580 (= res!1065417 (containsKey!825 (t!51085 l!1292) otherKey!62))))

(declare-fun b!1557581 () Bool)

(assert (=> b!1557581 (= e!867613 (not (= otherKey!62 newKey!135)))))

(assert (= (and d!162289 res!1065416) b!1557580))

(assert (= (and b!1557580 res!1065417) b!1557581))

(assert (=> d!162289 m!1433871))

(assert (=> d!162289 m!1433871))

(assert (=> d!162289 m!1433873))

(declare-fun m!1433965 () Bool)

(assert (=> d!162289 m!1433965))

(assert (=> d!162289 m!1433881))

(assert (=> b!1557580 m!1433869))

(assert (=> b!1557378 d!162289))

(declare-fun d!162297 () Bool)

(declare-fun res!1065420 () Bool)

(declare-fun e!867616 () Bool)

(assert (=> d!162297 (=> res!1065420 e!867616)))

(assert (=> d!162297 (= res!1065420 (or ((_ is Nil!36363) (insertStrictlySorted!565 l!1292 newKey!135 newValue!135)) ((_ is Nil!36363) (t!51085 (insertStrictlySorted!565 l!1292 newKey!135 newValue!135)))))))

(assert (=> d!162297 (= (isStrictlySorted!963 (insertStrictlySorted!565 l!1292 newKey!135 newValue!135)) e!867616)))

(declare-fun b!1557584 () Bool)

(declare-fun e!867617 () Bool)

(assert (=> b!1557584 (= e!867616 e!867617)))

(declare-fun res!1065421 () Bool)

(assert (=> b!1557584 (=> (not res!1065421) (not e!867617))))

(assert (=> b!1557584 (= res!1065421 (bvslt (_1!12522 (h!37809 (insertStrictlySorted!565 l!1292 newKey!135 newValue!135))) (_1!12522 (h!37809 (t!51085 (insertStrictlySorted!565 l!1292 newKey!135 newValue!135))))))))

(declare-fun b!1557585 () Bool)

(assert (=> b!1557585 (= e!867617 (isStrictlySorted!963 (t!51085 (insertStrictlySorted!565 l!1292 newKey!135 newValue!135))))))

(assert (= (and d!162297 (not res!1065420)) b!1557584))

(assert (= (and b!1557584 res!1065421) b!1557585))

(declare-fun m!1433979 () Bool)

(assert (=> b!1557585 m!1433979))

(assert (=> b!1557378 d!162297))

(declare-fun b!1557598 () Bool)

(declare-fun e!867629 () List!36366)

(declare-fun call!71688 () List!36366)

(assert (=> b!1557598 (= e!867629 call!71688)))

(declare-fun b!1557599 () Bool)

(declare-fun res!1065427 () Bool)

(declare-fun e!867626 () Bool)

(assert (=> b!1557599 (=> (not res!1065427) (not e!867626))))

(declare-fun lt!670468 () List!36366)

(assert (=> b!1557599 (= res!1065427 (containsKey!825 lt!670468 newKey!135))))

(declare-fun c!143958 () Bool)

(declare-fun call!71687 () List!36366)

(declare-fun bm!71684 () Bool)

(declare-fun e!867628 () List!36366)

(assert (=> bm!71684 (= call!71687 ($colon$colon!979 e!867628 (ite c!143958 (h!37809 (t!51085 l!1292)) (tuple2!25023 newKey!135 newValue!135))))))

(declare-fun c!143955 () Bool)

(assert (=> bm!71684 (= c!143955 c!143958)))

(declare-fun bm!71685 () Bool)

(declare-fun call!71689 () List!36366)

(assert (=> bm!71685 (= call!71688 call!71689)))

(declare-fun b!1557600 () Bool)

(declare-fun e!867625 () List!36366)

(assert (=> b!1557600 (= e!867625 call!71687)))

(declare-fun b!1557601 () Bool)

(declare-fun e!867627 () List!36366)

(assert (=> b!1557601 (= e!867625 e!867627)))

(declare-fun c!143956 () Bool)

(assert (=> b!1557601 (= c!143956 (and ((_ is Cons!36362) (t!51085 l!1292)) (= (_1!12522 (h!37809 (t!51085 l!1292))) newKey!135)))))

(declare-fun b!1557602 () Bool)

(declare-fun c!143957 () Bool)

(assert (=> b!1557602 (= c!143957 (and ((_ is Cons!36362) (t!51085 l!1292)) (bvsgt (_1!12522 (h!37809 (t!51085 l!1292))) newKey!135)))))

(assert (=> b!1557602 (= e!867627 e!867629)))

(declare-fun b!1557603 () Bool)

(assert (=> b!1557603 (= e!867628 (insertStrictlySorted!565 (t!51085 (t!51085 l!1292)) newKey!135 newValue!135))))

(declare-fun bm!71686 () Bool)

(assert (=> bm!71686 (= call!71689 call!71687)))

(declare-fun b!1557604 () Bool)

(assert (=> b!1557604 (= e!867627 call!71689)))

(declare-fun b!1557605 () Bool)

(assert (=> b!1557605 (= e!867626 (contains!10166 lt!670468 (tuple2!25023 newKey!135 newValue!135)))))

(declare-fun b!1557606 () Bool)

(assert (=> b!1557606 (= e!867629 call!71688)))

(declare-fun b!1557607 () Bool)

(assert (=> b!1557607 (= e!867628 (ite c!143956 (t!51085 (t!51085 l!1292)) (ite c!143957 (Cons!36362 (h!37809 (t!51085 l!1292)) (t!51085 (t!51085 l!1292))) Nil!36363)))))

(declare-fun d!162303 () Bool)

(assert (=> d!162303 e!867626))

(declare-fun res!1065426 () Bool)

(assert (=> d!162303 (=> (not res!1065426) (not e!867626))))

(assert (=> d!162303 (= res!1065426 (isStrictlySorted!963 lt!670468))))

(assert (=> d!162303 (= lt!670468 e!867625)))

(assert (=> d!162303 (= c!143958 (and ((_ is Cons!36362) (t!51085 l!1292)) (bvslt (_1!12522 (h!37809 (t!51085 l!1292))) newKey!135)))))

(assert (=> d!162303 (isStrictlySorted!963 (t!51085 l!1292))))

(assert (=> d!162303 (= (insertStrictlySorted!565 (t!51085 l!1292) newKey!135 newValue!135) lt!670468)))

(assert (= (and d!162303 c!143958) b!1557600))

(assert (= (and d!162303 (not c!143958)) b!1557601))

(assert (= (and b!1557601 c!143956) b!1557604))

(assert (= (and b!1557601 (not c!143956)) b!1557602))

(assert (= (and b!1557602 c!143957) b!1557598))

(assert (= (and b!1557602 (not c!143957)) b!1557606))

(assert (= (or b!1557598 b!1557606) bm!71685))

(assert (= (or b!1557604 bm!71685) bm!71686))

(assert (= (or b!1557600 bm!71686) bm!71684))

(assert (= (and bm!71684 c!143955) b!1557603))

(assert (= (and bm!71684 (not c!143955)) b!1557607))

(assert (= (and d!162303 res!1065426) b!1557599))

(assert (= (and b!1557599 res!1065427) b!1557605))

(declare-fun m!1433993 () Bool)

(assert (=> b!1557605 m!1433993))

(declare-fun m!1433995 () Bool)

(assert (=> bm!71684 m!1433995))

(declare-fun m!1433997 () Bool)

(assert (=> b!1557603 m!1433997))

(declare-fun m!1433999 () Bool)

(assert (=> b!1557599 m!1433999))

(declare-fun m!1434001 () Bool)

(assert (=> d!162303 m!1434001))

(assert (=> d!162303 m!1433881))

(assert (=> b!1557378 d!162303))

(declare-fun b!1557623 () Bool)

(declare-fun e!867641 () Bool)

(declare-fun tp!112570 () Bool)

(assert (=> b!1557623 (= e!867641 (and tp_is_empty!38407 tp!112570))))

(assert (=> b!1557375 (= tp!112558 e!867641)))

(assert (= (and b!1557375 ((_ is Cons!36362) (t!51085 l!1292))) b!1557623))

(check-sat (not bm!71675) (not b!1557455) (not b!1557547) (not b!1557623) (not b!1557599) (not bm!71684) tp_is_empty!38407 (not b!1557543) (not b!1557453) (not b!1557461) (not d!162303) (not b!1557603) (not b!1557431) (not b!1557549) (not d!162283) (not b!1557580) (not b!1557585) (not b!1557457) (not b!1557605) (not d!162289))
(check-sat)
