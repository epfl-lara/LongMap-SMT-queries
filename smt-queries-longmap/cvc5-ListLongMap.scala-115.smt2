; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1992 () Bool)

(assert start!1992)

(declare-fun b!13395 () Bool)

(assert (=> b!13395 true))

(declare-fun b!13394 () Bool)

(declare-fun res!10560 () Bool)

(declare-fun e!8033 () Bool)

(assert (=> b!13394 (=> (not res!10560) (not e!8033))))

(declare-datatypes ((B!488 0))(
  ( (B!489 (val!342 Int)) )
))
(declare-datatypes ((tuple2!484 0))(
  ( (tuple2!485 (_1!242 (_ BitVec 64)) (_2!242 B!488)) )
))
(declare-datatypes ((List!397 0))(
  ( (Nil!394) (Cons!393 (h!959 tuple2!484) (t!2793 List!397)) )
))
(declare-fun l!522 () List!397)

(declare-fun isEmpty!81 (List!397) Bool)

(assert (=> b!13394 (= res!10560 (not (isEmpty!81 l!522)))))

(declare-fun res!10558 () Bool)

(declare-fun e!8031 () Bool)

(assert (=> start!1992 (=> (not res!10558) (not e!8031))))

(declare-fun isStrictlySorted!84 (List!397) Bool)

(assert (=> start!1992 (= res!10558 (isStrictlySorted!84 l!522))))

(assert (=> start!1992 e!8031))

(declare-fun e!8032 () Bool)

(assert (=> start!1992 e!8032))

(declare-fun tp_is_empty!667 () Bool)

(assert (=> start!1992 tp_is_empty!667))

(declare-fun res!10561 () Bool)

(assert (=> b!13395 (=> (not res!10561) (not e!8033))))

(declare-fun lt!3510 () List!397)

(declare-fun lambda!71 () Int)

(declare-fun forall!74 (List!397 Int) Bool)

(assert (=> b!13395 (= res!10561 (forall!74 lt!3510 lambda!71))))

(declare-fun b!13396 () Bool)

(assert (=> b!13396 (= e!8033 (= lt!3510 Nil!394))))

(declare-fun b!13397 () Bool)

(assert (=> b!13397 (= e!8031 e!8033)))

(declare-fun res!10559 () Bool)

(assert (=> b!13397 (=> (not res!10559) (not e!8033))))

(assert (=> b!13397 (= res!10559 (isStrictlySorted!84 lt!3510))))

(declare-fun value!159 () B!488)

(declare-fun filterByValue!7 (List!397 B!488) List!397)

(assert (=> b!13397 (= lt!3510 (filterByValue!7 (t!2793 l!522) value!159))))

(declare-fun b!13398 () Bool)

(declare-fun tp!2186 () Bool)

(assert (=> b!13398 (= e!8032 (and tp_is_empty!667 tp!2186))))

(declare-fun b!13399 () Bool)

(declare-fun res!10556 () Bool)

(assert (=> b!13399 (=> (not res!10556) (not e!8031))))

(assert (=> b!13399 (= res!10556 (and (not (= (_2!242 (h!959 l!522)) value!159)) (is-Cons!393 l!522)))))

(declare-fun b!13400 () Bool)

(declare-fun res!10557 () Bool)

(assert (=> b!13400 (=> (not res!10557) (not e!8033))))

(assert (=> b!13400 (= res!10557 (not (isEmpty!81 lt!3510)))))

(assert (= (and start!1992 res!10558) b!13399))

(assert (= (and b!13399 res!10556) b!13397))

(assert (= (and b!13397 res!10559) b!13395))

(assert (= (and b!13395 res!10561) b!13394))

(assert (= (and b!13394 res!10560) b!13400))

(assert (= (and b!13400 res!10557) b!13396))

(assert (= (and start!1992 (is-Cons!393 l!522)) b!13398))

(declare-fun m!9101 () Bool)

(assert (=> start!1992 m!9101))

(declare-fun m!9103 () Bool)

(assert (=> b!13400 m!9103))

(declare-fun m!9105 () Bool)

(assert (=> b!13395 m!9105))

(declare-fun m!9107 () Bool)

(assert (=> b!13397 m!9107))

(declare-fun m!9109 () Bool)

(assert (=> b!13397 m!9109))

(declare-fun m!9111 () Bool)

(assert (=> b!13394 m!9111))

(push 1)

(assert tp_is_empty!667)

(assert (not b!13395))

(assert (not start!1992))

(assert (not b!13394))

(assert (not b!13397))

(assert (not b!13400))

(assert (not b!13398))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2013 () Bool)

(declare-fun res!10606 () Bool)

(declare-fun e!8060 () Bool)

(assert (=> d!2013 (=> res!10606 e!8060)))

(assert (=> d!2013 (= res!10606 (or (is-Nil!394 lt!3510) (is-Nil!394 (t!2793 lt!3510))))))

(assert (=> d!2013 (= (isStrictlySorted!84 lt!3510) e!8060)))

(declare-fun b!13457 () Bool)

(declare-fun e!8061 () Bool)

(assert (=> b!13457 (= e!8060 e!8061)))

(declare-fun res!10607 () Bool)

(assert (=> b!13457 (=> (not res!10607) (not e!8061))))

(assert (=> b!13457 (= res!10607 (bvslt (_1!242 (h!959 lt!3510)) (_1!242 (h!959 (t!2793 lt!3510)))))))

(declare-fun b!13458 () Bool)

(assert (=> b!13458 (= e!8061 (isStrictlySorted!84 (t!2793 lt!3510)))))

(assert (= (and d!2013 (not res!10606)) b!13457))

(assert (= (and b!13457 res!10607) b!13458))

(declare-fun m!9137 () Bool)

(assert (=> b!13458 m!9137))

(assert (=> b!13397 d!2013))

(declare-fun bs!525 () Bool)

(declare-fun b!13529 () Bool)

(assert (= bs!525 (and b!13529 b!13395)))

(declare-fun lambda!84 () Int)

(assert (=> bs!525 (= lambda!84 lambda!71)))

(assert (=> b!13529 true))

(declare-fun d!2021 () Bool)

(declare-fun e!8109 () Bool)

(assert (=> d!2021 e!8109))

(declare-fun res!10643 () Bool)

(assert (=> d!2021 (=> (not res!10643) (not e!8109))))

(declare-fun lt!3523 () List!397)

(assert (=> d!2021 (= res!10643 (isStrictlySorted!84 lt!3523))))

(declare-fun e!8111 () List!397)

(assert (=> d!2021 (= lt!3523 e!8111)))

(declare-fun c!1260 () Bool)

(assert (=> d!2021 (= c!1260 (and (is-Cons!393 (t!2793 l!522)) (= (_2!242 (h!959 (t!2793 l!522))) value!159)))))

(assert (=> d!2021 (isStrictlySorted!84 (t!2793 l!522))))

(assert (=> d!2021 (= (filterByValue!7 (t!2793 l!522) value!159) lt!3523)))

(declare-fun res!10644 () Bool)

(assert (=> b!13529 (=> (not res!10644) (not e!8109))))

(assert (=> b!13529 (= res!10644 (forall!74 lt!3523 lambda!84))))

(declare-fun b!13530 () Bool)

(declare-fun e!8108 () Bool)

(declare-fun call!377 () Bool)

(assert (=> b!13530 (= e!8108 call!377)))

(declare-fun b!13531 () Bool)

(declare-fun e!8110 () List!397)

(assert (=> b!13531 (= e!8110 Nil!394)))

(declare-fun b!13532 () Bool)

(declare-fun e!8112 () Bool)

(assert (=> b!13532 (= e!8108 e!8112)))

(declare-fun res!10642 () Bool)

(assert (=> b!13532 (= res!10642 call!377)))

(assert (=> b!13532 (=> res!10642 e!8112)))

(declare-fun b!13533 () Bool)

(assert (=> b!13533 (= e!8109 e!8108)))

(declare-fun c!1261 () Bool)

(assert (=> b!13533 (= c!1261 (isEmpty!81 (t!2793 l!522)))))

(declare-fun b!13534 () Bool)

(declare-fun call!376 () List!397)

(assert (=> b!13534 (= e!8110 call!376)))

(declare-fun b!13535 () Bool)

(declare-fun $colon$colon!15 (List!397 tuple2!484) List!397)

(assert (=> b!13535 (= e!8111 ($colon$colon!15 call!376 (h!959 (t!2793 l!522))))))

(declare-fun bm!373 () Bool)

(assert (=> bm!373 (= call!377 (isEmpty!81 lt!3523))))

(declare-fun b!13536 () Bool)

(assert (=> b!13536 (= e!8111 e!8110)))

(declare-fun c!1262 () Bool)

(assert (=> b!13536 (= c!1262 (and (is-Cons!393 (t!2793 l!522)) (not (= (_2!242 (h!959 (t!2793 l!522))) value!159))))))

(declare-fun bm!374 () Bool)

(assert (=> bm!374 (= call!376 (filterByValue!7 (t!2793 (t!2793 l!522)) value!159))))

(declare-fun b!13537 () Bool)

(declare-fun head!785 (List!397) tuple2!484)

(assert (=> b!13537 (= e!8112 (bvsge (_1!242 (head!785 lt!3523)) (_1!242 (head!785 (t!2793 l!522)))))))

(assert (= (and d!2021 c!1260) b!13535))

(assert (= (and d!2021 (not c!1260)) b!13536))

(assert (= (and b!13536 c!1262) b!13534))

(assert (= (and b!13536 (not c!1262)) b!13531))

(assert (= (or b!13535 b!13534) bm!374))

(assert (= (and d!2021 res!10643) b!13529))

(assert (= (and b!13529 res!10644) b!13533))

(assert (= (and b!13533 c!1261) b!13530))

(assert (= (and b!13533 (not c!1261)) b!13532))

(assert (= (and b!13532 (not res!10642)) b!13537))

(assert (= (or b!13530 b!13532) bm!373))

(declare-fun m!9151 () Bool)

(assert (=> b!13533 m!9151))

(declare-fun m!9153 () Bool)

(assert (=> bm!374 m!9153))

(declare-fun m!9155 () Bool)

(assert (=> b!13535 m!9155))

(declare-fun m!9157 () Bool)

(assert (=> b!13529 m!9157))

(declare-fun m!9159 () Bool)

(assert (=> bm!373 m!9159))

(declare-fun m!9161 () Bool)

(assert (=> b!13537 m!9161))

(declare-fun m!9163 () Bool)

(assert (=> b!13537 m!9163))

(declare-fun m!9165 () Bool)

(assert (=> d!2021 m!9165))

(declare-fun m!9167 () Bool)

(assert (=> d!2021 m!9167))

(assert (=> b!13397 d!2021))

(declare-fun d!2037 () Bool)

(declare-fun res!10647 () Bool)

(declare-fun e!8115 () Bool)

(assert (=> d!2037 (=> res!10647 e!8115)))

(assert (=> d!2037 (= res!10647 (or (is-Nil!394 l!522) (is-Nil!394 (t!2793 l!522))))))

(assert (=> d!2037 (= (isStrictlySorted!84 l!522) e!8115)))

(declare-fun b!13540 () Bool)

(declare-fun e!8116 () Bool)

(assert (=> b!13540 (= e!8115 e!8116)))

(declare-fun res!10648 () Bool)

(assert (=> b!13540 (=> (not res!10648) (not e!8116))))

(assert (=> b!13540 (= res!10648 (bvslt (_1!242 (h!959 l!522)) (_1!242 (h!959 (t!2793 l!522)))))))

(declare-fun b!13541 () Bool)

(assert (=> b!13541 (= e!8116 (isStrictlySorted!84 (t!2793 l!522)))))

(assert (= (and d!2037 (not res!10647)) b!13540))

(assert (= (and b!13540 res!10648) b!13541))

(assert (=> b!13541 m!9167))

(assert (=> start!1992 d!2037))

(declare-fun d!2039 () Bool)

(assert (=> d!2039 (= (isEmpty!81 l!522) (is-Nil!394 l!522))))

(assert (=> b!13394 d!2039))

(declare-fun d!2041 () Bool)

(declare-fun res!10663 () Bool)

(declare-fun e!8135 () Bool)

(assert (=> d!2041 (=> res!10663 e!8135)))

(assert (=> d!2041 (= res!10663 (is-Nil!394 lt!3510))))

(assert (=> d!2041 (= (forall!74 lt!3510 lambda!71) e!8135)))

(declare-fun b!13566 () Bool)

(declare-fun e!8136 () Bool)

(assert (=> b!13566 (= e!8135 e!8136)))

(declare-fun res!10664 () Bool)

(assert (=> b!13566 (=> (not res!10664) (not e!8136))))

(declare-fun dynLambda!87 (Int tuple2!484) Bool)

(assert (=> b!13566 (= res!10664 (dynLambda!87 lambda!71 (h!959 lt!3510)))))

(declare-fun b!13567 () Bool)

(assert (=> b!13567 (= e!8136 (forall!74 (t!2793 lt!3510) lambda!71))))

(assert (= (and d!2041 (not res!10663)) b!13566))

(assert (= (and b!13566 res!10664) b!13567))

(declare-fun b_lambda!877 () Bool)

(assert (=> (not b_lambda!877) (not b!13566)))

(declare-fun m!9201 () Bool)

(assert (=> b!13566 m!9201))

(declare-fun m!9203 () Bool)

(assert (=> b!13567 m!9203))

(assert (=> b!13395 d!2041))

(declare-fun d!2047 () Bool)

(assert (=> d!2047 (= (isEmpty!81 lt!3510) (is-Nil!394 lt!3510))))

(assert (=> b!13400 d!2047))

(declare-fun b!13581 () Bool)

(declare-fun e!8144 () Bool)

(declare-fun tp!2198 () Bool)

(assert (=> b!13581 (= e!8144 (and tp_is_empty!667 tp!2198))))

(assert (=> b!13398 (= tp!2186 e!8144)))

(assert (= (and b!13398 (is-Cons!393 (t!2793 l!522))) b!13581))

(declare-fun b_lambda!883 () Bool)

(assert (= b_lambda!877 (or b!13395 b_lambda!883)))

(declare-fun bs!529 () Bool)

(declare-fun d!2051 () Bool)

(assert (= bs!529 (and d!2051 b!13395)))

(assert (=> bs!529 (= (dynLambda!87 lambda!71 (h!959 lt!3510)) (= (_2!242 (h!959 lt!3510)) value!159))))

(assert (=> b!13566 d!2051))

(push 1)

