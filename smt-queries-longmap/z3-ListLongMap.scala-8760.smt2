; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106578 () Bool)

(assert start!106578)

(declare-fun b!1266347 () Bool)

(declare-fun res!842904 () Bool)

(declare-fun e!721254 () Bool)

(assert (=> b!1266347 (=> (not res!842904) (not e!721254))))

(declare-datatypes ((B!1952 0))(
  ( (B!1953 (val!16311 Int)) )
))
(declare-datatypes ((tuple2!21150 0))(
  ( (tuple2!21151 (_1!10586 (_ BitVec 64)) (_2!10586 B!1952)) )
))
(declare-datatypes ((List!28339 0))(
  ( (Nil!28336) (Cons!28335 (h!29553 tuple2!21150) (t!41852 List!28339)) )
))
(declare-fun l!706 () List!28339)

(declare-fun isStrictlySorted!769 (List!28339) Bool)

(assert (=> b!1266347 (= res!842904 (isStrictlySorted!769 (t!41852 l!706)))))

(declare-fun res!842905 () Bool)

(assert (=> start!106578 (=> (not res!842905) (not e!721254))))

(assert (=> start!106578 (= res!842905 (isStrictlySorted!769 l!706))))

(assert (=> start!106578 e!721254))

(declare-fun e!721253 () Bool)

(assert (=> start!106578 e!721253))

(assert (=> start!106578 true))

(declare-fun tp_is_empty!32485 () Bool)

(assert (=> start!106578 tp_is_empty!32485))

(declare-fun b!1266348 () Bool)

(declare-fun res!842906 () Bool)

(assert (=> b!1266348 (=> (not res!842906) (not e!721254))))

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!640 (List!28339 (_ BitVec 64)) Bool)

(assert (=> b!1266348 (= res!842906 (not (containsKey!640 (t!41852 l!706) key1!31)))))

(declare-fun v1!26 () B!1952)

(declare-fun b!1266349 () Bool)

(declare-fun insertStrictlySorted!460 (List!28339 (_ BitVec 64) B!1952) List!28339)

(assert (=> b!1266349 (= e!721254 (not (isStrictlySorted!769 (insertStrictlySorted!460 l!706 key1!31 v1!26))))))

(declare-fun removeStrictlySorted!151 (List!28339 (_ BitVec 64)) List!28339)

(assert (=> b!1266349 (= (removeStrictlySorted!151 (insertStrictlySorted!460 (t!41852 l!706) key1!31 v1!26) key1!31) (t!41852 l!706))))

(declare-datatypes ((Unit!42151 0))(
  ( (Unit!42152) )
))
(declare-fun lt!574489 () Unit!42151)

(declare-fun lemmaInsertStrictlySortedThenRemoveIsSame!7 (List!28339 (_ BitVec 64) B!1952) Unit!42151)

(assert (=> b!1266349 (= lt!574489 (lemmaInsertStrictlySortedThenRemoveIsSame!7 (t!41852 l!706) key1!31 v1!26))))

(declare-fun b!1266350 () Bool)

(declare-fun res!842903 () Bool)

(assert (=> b!1266350 (=> (not res!842903) (not e!721254))))

(get-info :version)

(assert (=> b!1266350 (= res!842903 ((_ is Cons!28335) l!706))))

(declare-fun b!1266351 () Bool)

(declare-fun tp!96293 () Bool)

(assert (=> b!1266351 (= e!721253 (and tp_is_empty!32485 tp!96293))))

(declare-fun b!1266352 () Bool)

(declare-fun res!842902 () Bool)

(assert (=> b!1266352 (=> (not res!842902) (not e!721254))))

(assert (=> b!1266352 (= res!842902 (not (containsKey!640 l!706 key1!31)))))

(assert (= (and start!106578 res!842905) b!1266352))

(assert (= (and b!1266352 res!842902) b!1266350))

(assert (= (and b!1266350 res!842903) b!1266347))

(assert (= (and b!1266347 res!842904) b!1266348))

(assert (= (and b!1266348 res!842906) b!1266349))

(assert (= (and start!106578 ((_ is Cons!28335) l!706)) b!1266351))

(declare-fun m!1167025 () Bool)

(assert (=> start!106578 m!1167025))

(declare-fun m!1167027 () Bool)

(assert (=> b!1266348 m!1167027))

(declare-fun m!1167029 () Bool)

(assert (=> b!1266352 m!1167029))

(declare-fun m!1167031 () Bool)

(assert (=> b!1266347 m!1167031))

(declare-fun m!1167033 () Bool)

(assert (=> b!1266349 m!1167033))

(declare-fun m!1167035 () Bool)

(assert (=> b!1266349 m!1167035))

(declare-fun m!1167037 () Bool)

(assert (=> b!1266349 m!1167037))

(declare-fun m!1167039 () Bool)

(assert (=> b!1266349 m!1167039))

(assert (=> b!1266349 m!1167037))

(declare-fun m!1167041 () Bool)

(assert (=> b!1266349 m!1167041))

(assert (=> b!1266349 m!1167033))

(check-sat (not b!1266349) (not b!1266348) (not start!106578) tp_is_empty!32485 (not b!1266347) (not b!1266352) (not b!1266351))
(check-sat)
(get-model)

(declare-fun b!1266422 () Bool)

(declare-fun e!721285 () Bool)

(declare-fun lt!574503 () List!28339)

(assert (=> b!1266422 (= e!721285 (not (containsKey!640 lt!574503 key1!31)))))

(declare-fun b!1266424 () Bool)

(declare-fun e!721286 () List!28339)

(declare-fun e!721290 () List!28339)

(assert (=> b!1266424 (= e!721286 e!721290)))

(declare-fun c!123633 () Bool)

(assert (=> b!1266424 (= c!123633 (and ((_ is Cons!28335) (insertStrictlySorted!460 (t!41852 l!706) key1!31 v1!26)) (not (= (_1!10586 (h!29553 (insertStrictlySorted!460 (t!41852 l!706) key1!31 v1!26))) key1!31))))))

(declare-fun b!1266426 () Bool)

(assert (=> b!1266426 (= e!721286 (t!41852 (insertStrictlySorted!460 (t!41852 l!706) key1!31 v1!26)))))

(declare-fun b!1266427 () Bool)

(assert (=> b!1266427 (= e!721290 Nil!28336)))

(declare-fun d!139292 () Bool)

(assert (=> d!139292 e!721285))

(declare-fun res!842944 () Bool)

(assert (=> d!139292 (=> (not res!842944) (not e!721285))))

(assert (=> d!139292 (= res!842944 (isStrictlySorted!769 lt!574503))))

(assert (=> d!139292 (= lt!574503 e!721286)))

(declare-fun c!123632 () Bool)

(assert (=> d!139292 (= c!123632 (and ((_ is Cons!28335) (insertStrictlySorted!460 (t!41852 l!706) key1!31 v1!26)) (= (_1!10586 (h!29553 (insertStrictlySorted!460 (t!41852 l!706) key1!31 v1!26))) key1!31)))))

(assert (=> d!139292 (isStrictlySorted!769 (insertStrictlySorted!460 (t!41852 l!706) key1!31 v1!26))))

(assert (=> d!139292 (= (removeStrictlySorted!151 (insertStrictlySorted!460 (t!41852 l!706) key1!31 v1!26) key1!31) lt!574503)))

(declare-fun b!1266428 () Bool)

(declare-fun $colon$colon!636 (List!28339 tuple2!21150) List!28339)

(assert (=> b!1266428 (= e!721290 ($colon$colon!636 (removeStrictlySorted!151 (t!41852 (insertStrictlySorted!460 (t!41852 l!706) key1!31 v1!26)) key1!31) (h!29553 (insertStrictlySorted!460 (t!41852 l!706) key1!31 v1!26))))))

(assert (= (and d!139292 c!123632) b!1266426))

(assert (= (and d!139292 (not c!123632)) b!1266424))

(assert (= (and b!1266424 c!123633) b!1266428))

(assert (= (and b!1266424 (not c!123633)) b!1266427))

(assert (= (and d!139292 res!842944) b!1266422))

(declare-fun m!1167079 () Bool)

(assert (=> b!1266422 m!1167079))

(declare-fun m!1167083 () Bool)

(assert (=> d!139292 m!1167083))

(assert (=> d!139292 m!1167037))

(declare-fun m!1167085 () Bool)

(assert (=> d!139292 m!1167085))

(declare-fun m!1167089 () Bool)

(assert (=> b!1266428 m!1167089))

(assert (=> b!1266428 m!1167089))

(declare-fun m!1167096 () Bool)

(assert (=> b!1266428 m!1167096))

(assert (=> b!1266349 d!139292))

(declare-fun bm!62440 () Bool)

(declare-fun call!62448 () List!28339)

(declare-fun call!62444 () List!28339)

(assert (=> bm!62440 (= call!62448 call!62444)))

(declare-fun d!139299 () Bool)

(declare-fun e!721324 () Bool)

(assert (=> d!139299 e!721324))

(declare-fun res!842961 () Bool)

(assert (=> d!139299 (=> (not res!842961) (not e!721324))))

(declare-fun lt!574512 () List!28339)

(assert (=> d!139299 (= res!842961 (isStrictlySorted!769 lt!574512))))

(declare-fun e!721329 () List!28339)

(assert (=> d!139299 (= lt!574512 e!721329)))

(declare-fun c!123663 () Bool)

(assert (=> d!139299 (= c!123663 (and ((_ is Cons!28335) l!706) (bvslt (_1!10586 (h!29553 l!706)) key1!31)))))

(assert (=> d!139299 (isStrictlySorted!769 l!706)))

(assert (=> d!139299 (= (insertStrictlySorted!460 l!706 key1!31 v1!26) lt!574512)))

(declare-fun e!721331 () List!28339)

(declare-fun bm!62441 () Bool)

(assert (=> bm!62441 (= call!62444 ($colon$colon!636 e!721331 (ite c!123663 (h!29553 l!706) (tuple2!21151 key1!31 v1!26))))))

(declare-fun c!123666 () Bool)

(assert (=> bm!62441 (= c!123666 c!123663)))

(declare-fun b!1266497 () Bool)

(declare-fun e!721326 () List!28339)

(declare-fun call!62446 () List!28339)

(assert (=> b!1266497 (= e!721326 call!62446)))

(declare-fun b!1266499 () Bool)

(declare-fun e!721328 () List!28339)

(assert (=> b!1266499 (= e!721328 call!62448)))

(declare-fun b!1266501 () Bool)

(assert (=> b!1266501 (= e!721326 call!62446)))

(declare-fun b!1266502 () Bool)

(assert (=> b!1266502 (= e!721331 (insertStrictlySorted!460 (t!41852 l!706) key1!31 v1!26))))

(declare-fun bm!62444 () Bool)

(assert (=> bm!62444 (= call!62446 call!62448)))

(declare-fun b!1266504 () Bool)

(assert (=> b!1266504 (= e!721329 e!721328)))

(declare-fun c!123661 () Bool)

(assert (=> b!1266504 (= c!123661 (and ((_ is Cons!28335) l!706) (= (_1!10586 (h!29553 l!706)) key1!31)))))

(declare-fun b!1266506 () Bool)

(declare-fun c!123667 () Bool)

(assert (=> b!1266506 (= e!721331 (ite c!123661 (t!41852 l!706) (ite c!123667 (Cons!28335 (h!29553 l!706) (t!41852 l!706)) Nil!28336)))))

(declare-fun b!1266508 () Bool)

(declare-fun res!842958 () Bool)

(assert (=> b!1266508 (=> (not res!842958) (not e!721324))))

(assert (=> b!1266508 (= res!842958 (containsKey!640 lt!574512 key1!31))))

(declare-fun b!1266510 () Bool)

(assert (=> b!1266510 (= e!721329 call!62444)))

(declare-fun b!1266511 () Bool)

(assert (=> b!1266511 (= c!123667 (and ((_ is Cons!28335) l!706) (bvsgt (_1!10586 (h!29553 l!706)) key1!31)))))

(assert (=> b!1266511 (= e!721328 e!721326)))

(declare-fun b!1266513 () Bool)

(declare-fun contains!7660 (List!28339 tuple2!21150) Bool)

(assert (=> b!1266513 (= e!721324 (contains!7660 lt!574512 (tuple2!21151 key1!31 v1!26)))))

(assert (= (and d!139299 c!123663) b!1266510))

(assert (= (and d!139299 (not c!123663)) b!1266504))

(assert (= (and b!1266504 c!123661) b!1266499))

(assert (= (and b!1266504 (not c!123661)) b!1266511))

(assert (= (and b!1266511 c!123667) b!1266501))

(assert (= (and b!1266511 (not c!123667)) b!1266497))

(assert (= (or b!1266501 b!1266497) bm!62444))

(assert (= (or b!1266499 bm!62444) bm!62440))

(assert (= (or b!1266510 bm!62440) bm!62441))

(assert (= (and bm!62441 c!123666) b!1266502))

(assert (= (and bm!62441 (not c!123666)) b!1266506))

(assert (= (and d!139299 res!842961) b!1266508))

(assert (= (and b!1266508 res!842958) b!1266513))

(declare-fun m!1167111 () Bool)

(assert (=> bm!62441 m!1167111))

(assert (=> b!1266502 m!1167037))

(declare-fun m!1167113 () Bool)

(assert (=> d!139299 m!1167113))

(assert (=> d!139299 m!1167025))

(declare-fun m!1167119 () Bool)

(assert (=> b!1266513 m!1167119))

(declare-fun m!1167123 () Bool)

(assert (=> b!1266508 m!1167123))

(assert (=> b!1266349 d!139299))

(declare-fun d!139305 () Bool)

(assert (=> d!139305 (= (removeStrictlySorted!151 (insertStrictlySorted!460 (t!41852 l!706) key1!31 v1!26) key1!31) (t!41852 l!706))))

(declare-fun lt!574521 () Unit!42151)

(declare-fun choose!1888 (List!28339 (_ BitVec 64) B!1952) Unit!42151)

(assert (=> d!139305 (= lt!574521 (choose!1888 (t!41852 l!706) key1!31 v1!26))))

(assert (=> d!139305 (isStrictlySorted!769 (t!41852 l!706))))

(assert (=> d!139305 (= (lemmaInsertStrictlySortedThenRemoveIsSame!7 (t!41852 l!706) key1!31 v1!26) lt!574521)))

(declare-fun bs!35827 () Bool)

(assert (= bs!35827 d!139305))

(assert (=> bs!35827 m!1167037))

(assert (=> bs!35827 m!1167037))

(assert (=> bs!35827 m!1167041))

(declare-fun m!1167135 () Bool)

(assert (=> bs!35827 m!1167135))

(assert (=> bs!35827 m!1167031))

(assert (=> b!1266349 d!139305))

(declare-fun bm!62449 () Bool)

(declare-fun call!62456 () List!28339)

(declare-fun call!62453 () List!28339)

(assert (=> bm!62449 (= call!62456 call!62453)))

(declare-fun d!139310 () Bool)

(declare-fun e!721339 () Bool)

(assert (=> d!139310 e!721339))

(declare-fun res!842967 () Bool)

(assert (=> d!139310 (=> (not res!842967) (not e!721339))))

(declare-fun lt!574524 () List!28339)

(assert (=> d!139310 (= res!842967 (isStrictlySorted!769 lt!574524))))

(declare-fun e!721344 () List!28339)

(assert (=> d!139310 (= lt!574524 e!721344)))

(declare-fun c!123675 () Bool)

(assert (=> d!139310 (= c!123675 (and ((_ is Cons!28335) (t!41852 l!706)) (bvslt (_1!10586 (h!29553 (t!41852 l!706))) key1!31)))))

(assert (=> d!139310 (isStrictlySorted!769 (t!41852 l!706))))

(assert (=> d!139310 (= (insertStrictlySorted!460 (t!41852 l!706) key1!31 v1!26) lt!574524)))

(declare-fun e!721345 () List!28339)

(declare-fun bm!62450 () Bool)

(assert (=> bm!62450 (= call!62453 ($colon$colon!636 e!721345 (ite c!123675 (h!29553 (t!41852 l!706)) (tuple2!21151 key1!31 v1!26))))))

(declare-fun c!123677 () Bool)

(assert (=> bm!62450 (= c!123677 c!123675)))

(declare-fun b!1266524 () Bool)

(declare-fun e!721340 () List!28339)

(declare-fun call!62455 () List!28339)

(assert (=> b!1266524 (= e!721340 call!62455)))

(declare-fun b!1266525 () Bool)

(declare-fun e!721342 () List!28339)

(assert (=> b!1266525 (= e!721342 call!62456)))

(declare-fun b!1266526 () Bool)

(assert (=> b!1266526 (= e!721340 call!62455)))

(declare-fun b!1266527 () Bool)

(assert (=> b!1266527 (= e!721345 (insertStrictlySorted!460 (t!41852 (t!41852 l!706)) key1!31 v1!26))))

(declare-fun bm!62451 () Bool)

(assert (=> bm!62451 (= call!62455 call!62456)))

(declare-fun b!1266528 () Bool)

(assert (=> b!1266528 (= e!721344 e!721342)))

(declare-fun c!123673 () Bool)

(assert (=> b!1266528 (= c!123673 (and ((_ is Cons!28335) (t!41852 l!706)) (= (_1!10586 (h!29553 (t!41852 l!706))) key1!31)))))

(declare-fun c!123678 () Bool)

(declare-fun b!1266529 () Bool)

(assert (=> b!1266529 (= e!721345 (ite c!123673 (t!41852 (t!41852 l!706)) (ite c!123678 (Cons!28335 (h!29553 (t!41852 l!706)) (t!41852 (t!41852 l!706))) Nil!28336)))))

(declare-fun b!1266531 () Bool)

(declare-fun res!842964 () Bool)

(assert (=> b!1266531 (=> (not res!842964) (not e!721339))))

(assert (=> b!1266531 (= res!842964 (containsKey!640 lt!574524 key1!31))))

(declare-fun b!1266533 () Bool)

(assert (=> b!1266533 (= e!721344 call!62453)))

(declare-fun b!1266535 () Bool)

(assert (=> b!1266535 (= c!123678 (and ((_ is Cons!28335) (t!41852 l!706)) (bvsgt (_1!10586 (h!29553 (t!41852 l!706))) key1!31)))))

(assert (=> b!1266535 (= e!721342 e!721340)))

(declare-fun b!1266537 () Bool)

(assert (=> b!1266537 (= e!721339 (contains!7660 lt!574524 (tuple2!21151 key1!31 v1!26)))))

(assert (= (and d!139310 c!123675) b!1266533))

(assert (= (and d!139310 (not c!123675)) b!1266528))

(assert (= (and b!1266528 c!123673) b!1266525))

(assert (= (and b!1266528 (not c!123673)) b!1266535))

(assert (= (and b!1266535 c!123678) b!1266526))

(assert (= (and b!1266535 (not c!123678)) b!1266524))

(assert (= (or b!1266526 b!1266524) bm!62451))

(assert (= (or b!1266525 bm!62451) bm!62449))

(assert (= (or b!1266533 bm!62449) bm!62450))

(assert (= (and bm!62450 c!123677) b!1266527))

(assert (= (and bm!62450 (not c!123677)) b!1266529))

(assert (= (and d!139310 res!842967) b!1266531))

(assert (= (and b!1266531 res!842964) b!1266537))

(declare-fun m!1167141 () Bool)

(assert (=> bm!62450 m!1167141))

(declare-fun m!1167145 () Bool)

(assert (=> b!1266527 m!1167145))

(declare-fun m!1167147 () Bool)

(assert (=> d!139310 m!1167147))

(assert (=> d!139310 m!1167031))

(declare-fun m!1167157 () Bool)

(assert (=> b!1266537 m!1167157))

(declare-fun m!1167159 () Bool)

(assert (=> b!1266531 m!1167159))

(assert (=> b!1266349 d!139310))

(declare-fun d!139315 () Bool)

(declare-fun res!842982 () Bool)

(declare-fun e!721366 () Bool)

(assert (=> d!139315 (=> res!842982 e!721366)))

(assert (=> d!139315 (= res!842982 (or ((_ is Nil!28336) (insertStrictlySorted!460 l!706 key1!31 v1!26)) ((_ is Nil!28336) (t!41852 (insertStrictlySorted!460 l!706 key1!31 v1!26)))))))

(assert (=> d!139315 (= (isStrictlySorted!769 (insertStrictlySorted!460 l!706 key1!31 v1!26)) e!721366)))

(declare-fun b!1266566 () Bool)

(declare-fun e!721367 () Bool)

(assert (=> b!1266566 (= e!721366 e!721367)))

(declare-fun res!842983 () Bool)

(assert (=> b!1266566 (=> (not res!842983) (not e!721367))))

(assert (=> b!1266566 (= res!842983 (bvslt (_1!10586 (h!29553 (insertStrictlySorted!460 l!706 key1!31 v1!26))) (_1!10586 (h!29553 (t!41852 (insertStrictlySorted!460 l!706 key1!31 v1!26))))))))

(declare-fun b!1266567 () Bool)

(assert (=> b!1266567 (= e!721367 (isStrictlySorted!769 (t!41852 (insertStrictlySorted!460 l!706 key1!31 v1!26))))))

(assert (= (and d!139315 (not res!842982)) b!1266566))

(assert (= (and b!1266566 res!842983) b!1266567))

(declare-fun m!1167170 () Bool)

(assert (=> b!1266567 m!1167170))

(assert (=> b!1266349 d!139315))

(declare-fun d!139323 () Bool)

(declare-fun res!843004 () Bool)

(declare-fun e!721388 () Bool)

(assert (=> d!139323 (=> res!843004 e!721388)))

(assert (=> d!139323 (= res!843004 (and ((_ is Cons!28335) (t!41852 l!706)) (= (_1!10586 (h!29553 (t!41852 l!706))) key1!31)))))

(assert (=> d!139323 (= (containsKey!640 (t!41852 l!706) key1!31) e!721388)))

(declare-fun b!1266588 () Bool)

(declare-fun e!721389 () Bool)

(assert (=> b!1266588 (= e!721388 e!721389)))

(declare-fun res!843005 () Bool)

(assert (=> b!1266588 (=> (not res!843005) (not e!721389))))

(assert (=> b!1266588 (= res!843005 (and (or (not ((_ is Cons!28335) (t!41852 l!706))) (bvsle (_1!10586 (h!29553 (t!41852 l!706))) key1!31)) ((_ is Cons!28335) (t!41852 l!706)) (bvslt (_1!10586 (h!29553 (t!41852 l!706))) key1!31)))))

(declare-fun b!1266589 () Bool)

(assert (=> b!1266589 (= e!721389 (containsKey!640 (t!41852 (t!41852 l!706)) key1!31))))

(assert (= (and d!139323 (not res!843004)) b!1266588))

(assert (= (and b!1266588 res!843005) b!1266589))

(declare-fun m!1167177 () Bool)

(assert (=> b!1266589 m!1167177))

(assert (=> b!1266348 d!139323))

(declare-fun d!139331 () Bool)

(declare-fun res!843008 () Bool)

(declare-fun e!721392 () Bool)

(assert (=> d!139331 (=> res!843008 e!721392)))

(assert (=> d!139331 (= res!843008 (or ((_ is Nil!28336) l!706) ((_ is Nil!28336) (t!41852 l!706))))))

(assert (=> d!139331 (= (isStrictlySorted!769 l!706) e!721392)))

(declare-fun b!1266592 () Bool)

(declare-fun e!721393 () Bool)

(assert (=> b!1266592 (= e!721392 e!721393)))

(declare-fun res!843009 () Bool)

(assert (=> b!1266592 (=> (not res!843009) (not e!721393))))

(assert (=> b!1266592 (= res!843009 (bvslt (_1!10586 (h!29553 l!706)) (_1!10586 (h!29553 (t!41852 l!706)))))))

(declare-fun b!1266593 () Bool)

(assert (=> b!1266593 (= e!721393 (isStrictlySorted!769 (t!41852 l!706)))))

(assert (= (and d!139331 (not res!843008)) b!1266592))

(assert (= (and b!1266592 res!843009) b!1266593))

(assert (=> b!1266593 m!1167031))

(assert (=> start!106578 d!139331))

(declare-fun d!139335 () Bool)

(declare-fun res!843014 () Bool)

(declare-fun e!721398 () Bool)

(assert (=> d!139335 (=> res!843014 e!721398)))

(assert (=> d!139335 (= res!843014 (or ((_ is Nil!28336) (t!41852 l!706)) ((_ is Nil!28336) (t!41852 (t!41852 l!706)))))))

(assert (=> d!139335 (= (isStrictlySorted!769 (t!41852 l!706)) e!721398)))

(declare-fun b!1266598 () Bool)

(declare-fun e!721399 () Bool)

(assert (=> b!1266598 (= e!721398 e!721399)))

(declare-fun res!843015 () Bool)

(assert (=> b!1266598 (=> (not res!843015) (not e!721399))))

(assert (=> b!1266598 (= res!843015 (bvslt (_1!10586 (h!29553 (t!41852 l!706))) (_1!10586 (h!29553 (t!41852 (t!41852 l!706))))))))

(declare-fun b!1266599 () Bool)

(assert (=> b!1266599 (= e!721399 (isStrictlySorted!769 (t!41852 (t!41852 l!706))))))

(assert (= (and d!139335 (not res!843014)) b!1266598))

(assert (= (and b!1266598 res!843015) b!1266599))

(declare-fun m!1167183 () Bool)

(assert (=> b!1266599 m!1167183))

(assert (=> b!1266347 d!139335))

(declare-fun d!139341 () Bool)

(declare-fun res!843020 () Bool)

(declare-fun e!721404 () Bool)

(assert (=> d!139341 (=> res!843020 e!721404)))

(assert (=> d!139341 (= res!843020 (and ((_ is Cons!28335) l!706) (= (_1!10586 (h!29553 l!706)) key1!31)))))

(assert (=> d!139341 (= (containsKey!640 l!706 key1!31) e!721404)))

(declare-fun b!1266604 () Bool)

(declare-fun e!721405 () Bool)

(assert (=> b!1266604 (= e!721404 e!721405)))

(declare-fun res!843021 () Bool)

(assert (=> b!1266604 (=> (not res!843021) (not e!721405))))

(assert (=> b!1266604 (= res!843021 (and (or (not ((_ is Cons!28335) l!706)) (bvsle (_1!10586 (h!29553 l!706)) key1!31)) ((_ is Cons!28335) l!706) (bvslt (_1!10586 (h!29553 l!706)) key1!31)))))

(declare-fun b!1266605 () Bool)

(assert (=> b!1266605 (= e!721405 (containsKey!640 (t!41852 l!706) key1!31))))

(assert (= (and d!139341 (not res!843020)) b!1266604))

(assert (= (and b!1266604 res!843021) b!1266605))

(assert (=> b!1266605 m!1167027))

(assert (=> b!1266352 d!139341))

(declare-fun b!1266621 () Bool)

(declare-fun e!721415 () Bool)

(declare-fun tp!96307 () Bool)

(assert (=> b!1266621 (= e!721415 (and tp_is_empty!32485 tp!96307))))

(assert (=> b!1266351 (= tp!96293 e!721415)))

(assert (= (and b!1266351 ((_ is Cons!28335) (t!41852 l!706))) b!1266621))

(check-sat (not b!1266599) (not b!1266531) (not d!139292) (not b!1266422) (not b!1266527) (not b!1266502) tp_is_empty!32485 (not d!139310) (not b!1266593) (not b!1266513) (not b!1266567) (not bm!62450) (not b!1266428) (not d!139305) (not bm!62441) (not b!1266605) (not b!1266621) (not d!139299) (not b!1266537) (not b!1266589) (not b!1266508))
(check-sat)
