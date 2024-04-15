; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1992 () Bool)

(assert start!1992)

(declare-fun b!13398 () Bool)

(assert (=> b!13398 true))

(declare-fun b!13394 () Bool)

(declare-fun e!8031 () Bool)

(declare-fun e!8032 () Bool)

(assert (=> b!13394 (= e!8031 e!8032)))

(declare-fun res!10557 () Bool)

(assert (=> b!13394 (=> (not res!10557) (not e!8032))))

(declare-datatypes ((B!488 0))(
  ( (B!489 (val!342 Int)) )
))
(declare-datatypes ((tuple2!480 0))(
  ( (tuple2!481 (_1!240 (_ BitVec 64)) (_2!240 B!488)) )
))
(declare-datatypes ((List!393 0))(
  ( (Nil!390) (Cons!389 (h!955 tuple2!480) (t!2789 List!393)) )
))
(declare-fun lt!3510 () List!393)

(declare-fun isStrictlySorted!81 (List!393) Bool)

(assert (=> b!13394 (= res!10557 (isStrictlySorted!81 lt!3510))))

(declare-fun l!522 () List!393)

(declare-fun value!159 () B!488)

(declare-fun filterByValue!7 (List!393 B!488) List!393)

(assert (=> b!13394 (= lt!3510 (filterByValue!7 (t!2789 l!522) value!159))))

(declare-fun res!10559 () Bool)

(assert (=> start!1992 (=> (not res!10559) (not e!8031))))

(assert (=> start!1992 (= res!10559 (isStrictlySorted!81 l!522))))

(assert (=> start!1992 e!8031))

(declare-fun e!8033 () Bool)

(assert (=> start!1992 e!8033))

(declare-fun tp_is_empty!667 () Bool)

(assert (=> start!1992 tp_is_empty!667))

(declare-fun b!13395 () Bool)

(assert (=> b!13395 (= e!8032 (= lt!3510 Nil!390))))

(declare-fun b!13396 () Bool)

(declare-fun res!10560 () Bool)

(assert (=> b!13396 (=> (not res!10560) (not e!8032))))

(declare-fun isEmpty!81 (List!393) Bool)

(assert (=> b!13396 (= res!10560 (not (isEmpty!81 l!522)))))

(declare-fun b!13397 () Bool)

(declare-fun res!10558 () Bool)

(assert (=> b!13397 (=> (not res!10558) (not e!8031))))

(get-info :version)

(assert (=> b!13397 (= res!10558 (and (not (= (_2!240 (h!955 l!522)) value!159)) ((_ is Cons!389) l!522)))))

(declare-fun res!10556 () Bool)

(assert (=> b!13398 (=> (not res!10556) (not e!8032))))

(declare-fun lambda!71 () Int)

(declare-fun forall!74 (List!393 Int) Bool)

(assert (=> b!13398 (= res!10556 (forall!74 lt!3510 lambda!71))))

(declare-fun b!13399 () Bool)

(declare-fun tp!2186 () Bool)

(assert (=> b!13399 (= e!8033 (and tp_is_empty!667 tp!2186))))

(declare-fun b!13400 () Bool)

(declare-fun res!10561 () Bool)

(assert (=> b!13400 (=> (not res!10561) (not e!8032))))

(assert (=> b!13400 (= res!10561 (not (isEmpty!81 lt!3510)))))

(assert (= (and start!1992 res!10559) b!13397))

(assert (= (and b!13397 res!10558) b!13394))

(assert (= (and b!13394 res!10557) b!13398))

(assert (= (and b!13398 res!10556) b!13396))

(assert (= (and b!13396 res!10560) b!13400))

(assert (= (and b!13400 res!10561) b!13395))

(assert (= (and start!1992 ((_ is Cons!389) l!522)) b!13399))

(declare-fun m!9093 () Bool)

(assert (=> b!13394 m!9093))

(declare-fun m!9095 () Bool)

(assert (=> b!13394 m!9095))

(declare-fun m!9097 () Bool)

(assert (=> b!13400 m!9097))

(declare-fun m!9099 () Bool)

(assert (=> b!13398 m!9099))

(declare-fun m!9101 () Bool)

(assert (=> b!13396 m!9101))

(declare-fun m!9103 () Bool)

(assert (=> start!1992 m!9103))

(check-sat tp_is_empty!667 (not start!1992) (not b!13398) (not b!13399) (not b!13400) (not b!13396) (not b!13394))
(check-sat)
(get-model)

(declare-fun d!2014 () Bool)

(declare-fun res!10606 () Bool)

(declare-fun e!8060 () Bool)

(assert (=> d!2014 (=> res!10606 e!8060)))

(assert (=> d!2014 (= res!10606 ((_ is Nil!390) lt!3510))))

(assert (=> d!2014 (= (forall!74 lt!3510 lambda!71) e!8060)))

(declare-fun b!13457 () Bool)

(declare-fun e!8061 () Bool)

(assert (=> b!13457 (= e!8060 e!8061)))

(declare-fun res!10607 () Bool)

(assert (=> b!13457 (=> (not res!10607) (not e!8061))))

(declare-fun dynLambda!83 (Int tuple2!480) Bool)

(assert (=> b!13457 (= res!10607 (dynLambda!83 lambda!71 (h!955 lt!3510)))))

(declare-fun b!13458 () Bool)

(assert (=> b!13458 (= e!8061 (forall!74 (t!2789 lt!3510) lambda!71))))

(assert (= (and d!2014 (not res!10606)) b!13457))

(assert (= (and b!13457 res!10607) b!13458))

(declare-fun b_lambda!875 () Bool)

(assert (=> (not b_lambda!875) (not b!13457)))

(declare-fun m!9131 () Bool)

(assert (=> b!13457 m!9131))

(declare-fun m!9133 () Bool)

(assert (=> b!13458 m!9133))

(assert (=> b!13398 d!2014))

(declare-fun d!2021 () Bool)

(assert (=> d!2021 (= (isEmpty!81 lt!3510) ((_ is Nil!390) lt!3510))))

(assert (=> b!13400 d!2021))

(declare-fun d!2025 () Bool)

(declare-fun res!10626 () Bool)

(declare-fun e!8080 () Bool)

(assert (=> d!2025 (=> res!10626 e!8080)))

(assert (=> d!2025 (= res!10626 (or ((_ is Nil!390) l!522) ((_ is Nil!390) (t!2789 l!522))))))

(assert (=> d!2025 (= (isStrictlySorted!81 l!522) e!8080)))

(declare-fun b!13477 () Bool)

(declare-fun e!8081 () Bool)

(assert (=> b!13477 (= e!8080 e!8081)))

(declare-fun res!10627 () Bool)

(assert (=> b!13477 (=> (not res!10627) (not e!8081))))

(assert (=> b!13477 (= res!10627 (bvslt (_1!240 (h!955 l!522)) (_1!240 (h!955 (t!2789 l!522)))))))

(declare-fun b!13478 () Bool)

(assert (=> b!13478 (= e!8081 (isStrictlySorted!81 (t!2789 l!522)))))

(assert (= (and d!2025 (not res!10626)) b!13477))

(assert (= (and b!13477 res!10627) b!13478))

(declare-fun m!9141 () Bool)

(assert (=> b!13478 m!9141))

(assert (=> start!1992 d!2025))

(declare-fun d!2031 () Bool)

(declare-fun res!10628 () Bool)

(declare-fun e!8082 () Bool)

(assert (=> d!2031 (=> res!10628 e!8082)))

(assert (=> d!2031 (= res!10628 (or ((_ is Nil!390) lt!3510) ((_ is Nil!390) (t!2789 lt!3510))))))

(assert (=> d!2031 (= (isStrictlySorted!81 lt!3510) e!8082)))

(declare-fun b!13479 () Bool)

(declare-fun e!8083 () Bool)

(assert (=> b!13479 (= e!8082 e!8083)))

(declare-fun res!10629 () Bool)

(assert (=> b!13479 (=> (not res!10629) (not e!8083))))

(assert (=> b!13479 (= res!10629 (bvslt (_1!240 (h!955 lt!3510)) (_1!240 (h!955 (t!2789 lt!3510)))))))

(declare-fun b!13480 () Bool)

(assert (=> b!13480 (= e!8083 (isStrictlySorted!81 (t!2789 lt!3510)))))

(assert (= (and d!2031 (not res!10628)) b!13479))

(assert (= (and b!13479 res!10629) b!13480))

(declare-fun m!9143 () Bool)

(assert (=> b!13480 m!9143))

(assert (=> b!13394 d!2031))

(declare-fun bs!525 () Bool)

(declare-fun b!13532 () Bool)

(assert (= bs!525 (and b!13532 b!13398)))

(declare-fun lambda!82 () Int)

(assert (=> bs!525 (= lambda!82 lambda!71)))

(assert (=> b!13532 true))

(declare-fun b!13529 () Bool)

(declare-fun e!8115 () List!393)

(declare-fun call!376 () List!393)

(assert (=> b!13529 (= e!8115 call!376)))

(declare-fun b!13531 () Bool)

(declare-fun e!8113 () Bool)

(declare-fun e!8116 () Bool)

(assert (=> b!13531 (= e!8113 e!8116)))

(declare-fun c!1258 () Bool)

(assert (=> b!13531 (= c!1258 (isEmpty!81 (t!2789 l!522)))))

(declare-fun res!10646 () Bool)

(assert (=> b!13532 (=> (not res!10646) (not e!8113))))

(declare-fun lt!3523 () List!393)

(assert (=> b!13532 (= res!10646 (forall!74 lt!3523 lambda!82))))

(declare-fun bm!373 () Bool)

(declare-fun call!377 () Bool)

(assert (=> bm!373 (= call!377 (isEmpty!81 lt!3523))))

(declare-fun bm!374 () Bool)

(assert (=> bm!374 (= call!376 (filterByValue!7 (t!2789 (t!2789 l!522)) value!159))))

(declare-fun b!13533 () Bool)

(declare-fun e!8114 () Bool)

(declare-fun head!785 (List!393) tuple2!480)

(assert (=> b!13533 (= e!8114 (bvsge (_1!240 (head!785 lt!3523)) (_1!240 (head!785 (t!2789 l!522)))))))

(declare-fun b!13534 () Bool)

(declare-fun e!8112 () List!393)

(declare-fun $colon$colon!15 (List!393 tuple2!480) List!393)

(assert (=> b!13534 (= e!8112 ($colon$colon!15 call!376 (h!955 (t!2789 l!522))))))

(declare-fun b!13535 () Bool)

(assert (=> b!13535 (= e!8116 call!377)))

(declare-fun b!13536 () Bool)

(assert (=> b!13536 (= e!8116 e!8114)))

(declare-fun res!10648 () Bool)

(assert (=> b!13536 (= res!10648 call!377)))

(assert (=> b!13536 (=> res!10648 e!8114)))

(declare-fun b!13537 () Bool)

(assert (=> b!13537 (= e!8112 e!8115)))

(declare-fun c!1259 () Bool)

(assert (=> b!13537 (= c!1259 (and ((_ is Cons!389) (t!2789 l!522)) (not (= (_2!240 (h!955 (t!2789 l!522))) value!159))))))

(declare-fun b!13530 () Bool)

(assert (=> b!13530 (= e!8115 Nil!390)))

(declare-fun d!2033 () Bool)

(assert (=> d!2033 e!8113))

(declare-fun res!10647 () Bool)

(assert (=> d!2033 (=> (not res!10647) (not e!8113))))

(assert (=> d!2033 (= res!10647 (isStrictlySorted!81 lt!3523))))

(assert (=> d!2033 (= lt!3523 e!8112)))

(declare-fun c!1260 () Bool)

(assert (=> d!2033 (= c!1260 (and ((_ is Cons!389) (t!2789 l!522)) (= (_2!240 (h!955 (t!2789 l!522))) value!159)))))

(assert (=> d!2033 (isStrictlySorted!81 (t!2789 l!522))))

(assert (=> d!2033 (= (filterByValue!7 (t!2789 l!522) value!159) lt!3523)))

(assert (= (and d!2033 c!1260) b!13534))

(assert (= (and d!2033 (not c!1260)) b!13537))

(assert (= (and b!13537 c!1259) b!13529))

(assert (= (and b!13537 (not c!1259)) b!13530))

(assert (= (or b!13534 b!13529) bm!374))

(assert (= (and d!2033 res!10647) b!13532))

(assert (= (and b!13532 res!10646) b!13531))

(assert (= (and b!13531 c!1258) b!13535))

(assert (= (and b!13531 (not c!1258)) b!13536))

(assert (= (and b!13536 (not res!10648)) b!13533))

(assert (= (or b!13535 b!13536) bm!373))

(declare-fun m!9149 () Bool)

(assert (=> b!13531 m!9149))

(declare-fun m!9151 () Bool)

(assert (=> d!2033 m!9151))

(assert (=> d!2033 m!9141))

(declare-fun m!9153 () Bool)

(assert (=> bm!374 m!9153))

(declare-fun m!9155 () Bool)

(assert (=> b!13533 m!9155))

(declare-fun m!9157 () Bool)

(assert (=> b!13533 m!9157))

(declare-fun m!9159 () Bool)

(assert (=> bm!373 m!9159))

(declare-fun m!9163 () Bool)

(assert (=> b!13532 m!9163))

(declare-fun m!9167 () Bool)

(assert (=> b!13534 m!9167))

(assert (=> b!13394 d!2033))

(declare-fun d!2039 () Bool)

(assert (=> d!2039 (= (isEmpty!81 l!522) ((_ is Nil!390) l!522))))

(assert (=> b!13396 d!2039))

(declare-fun b!13565 () Bool)

(declare-fun e!8132 () Bool)

(declare-fun tp!2197 () Bool)

(assert (=> b!13565 (= e!8132 (and tp_is_empty!667 tp!2197))))

(assert (=> b!13399 (= tp!2186 e!8132)))

(assert (= (and b!13399 ((_ is Cons!389) (t!2789 l!522))) b!13565))

(declare-fun b_lambda!881 () Bool)

(assert (= b_lambda!875 (or b!13398 b_lambda!881)))

(declare-fun bs!528 () Bool)

(declare-fun d!2045 () Bool)

(assert (= bs!528 (and d!2045 b!13398)))

(assert (=> bs!528 (= (dynLambda!83 lambda!71 (h!955 lt!3510)) (= (_2!240 (h!955 lt!3510)) value!159))))

(assert (=> b!13457 d!2045))

(check-sat (not b!13478) (not bm!374) (not b!13565) (not b_lambda!881) (not b!13531) (not bm!373) (not b!13534) tp_is_empty!667 (not b!13533) (not b!13480) (not d!2033) (not b!13458) (not b!13532))
(check-sat)
