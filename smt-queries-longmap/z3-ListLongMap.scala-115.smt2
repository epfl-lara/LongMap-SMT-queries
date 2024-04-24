; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1992 () Bool)

(assert start!1992)

(declare-fun b!13389 () Bool)

(assert (=> b!13389 true))

(declare-fun b!13388 () Bool)

(declare-fun e!8028 () Bool)

(declare-fun tp_is_empty!667 () Bool)

(declare-fun tp!2186 () Bool)

(assert (=> b!13388 (= e!8028 (and tp_is_empty!667 tp!2186))))

(declare-fun res!10559 () Bool)

(declare-fun e!8027 () Bool)

(assert (=> b!13389 (=> (not res!10559) (not e!8027))))

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

(declare-fun lambda!71 () Int)

(declare-fun forall!74 (List!393 Int) Bool)

(assert (=> b!13389 (= res!10559 (forall!74 lt!3510 lambda!71))))

(declare-fun b!13390 () Bool)

(declare-fun e!8029 () Bool)

(assert (=> b!13390 (= e!8029 e!8027)))

(declare-fun res!10558 () Bool)

(assert (=> b!13390 (=> (not res!10558) (not e!8027))))

(declare-fun isStrictlySorted!78 (List!393) Bool)

(assert (=> b!13390 (= res!10558 (isStrictlySorted!78 lt!3510))))

(declare-fun l!522 () List!393)

(declare-fun value!159 () B!488)

(declare-fun filterByValue!7 (List!393 B!488) List!393)

(assert (=> b!13390 (= lt!3510 (filterByValue!7 (t!2789 l!522) value!159))))

(declare-fun res!10554 () Bool)

(assert (=> start!1992 (=> (not res!10554) (not e!8029))))

(assert (=> start!1992 (= res!10554 (isStrictlySorted!78 l!522))))

(assert (=> start!1992 e!8029))

(assert (=> start!1992 e!8028))

(assert (=> start!1992 tp_is_empty!667))

(declare-fun b!13391 () Bool)

(declare-fun res!10557 () Bool)

(assert (=> b!13391 (=> (not res!10557) (not e!8029))))

(get-info :version)

(assert (=> b!13391 (= res!10557 (and (not (= (_2!240 (h!955 l!522)) value!159)) ((_ is Cons!389) l!522)))))

(declare-fun b!13392 () Bool)

(assert (=> b!13392 (= e!8027 (= lt!3510 Nil!390))))

(declare-fun b!13393 () Bool)

(declare-fun res!10555 () Bool)

(assert (=> b!13393 (=> (not res!10555) (not e!8027))))

(declare-fun isEmpty!81 (List!393) Bool)

(assert (=> b!13393 (= res!10555 (not (isEmpty!81 l!522)))))

(declare-fun b!13394 () Bool)

(declare-fun res!10556 () Bool)

(assert (=> b!13394 (=> (not res!10556) (not e!8027))))

(assert (=> b!13394 (= res!10556 (not (isEmpty!81 lt!3510)))))

(assert (= (and start!1992 res!10554) b!13391))

(assert (= (and b!13391 res!10557) b!13390))

(assert (= (and b!13390 res!10558) b!13389))

(assert (= (and b!13389 res!10559) b!13393))

(assert (= (and b!13393 res!10555) b!13394))

(assert (= (and b!13394 res!10556) b!13392))

(assert (= (and start!1992 ((_ is Cons!389) l!522)) b!13388))

(declare-fun m!9093 () Bool)

(assert (=> b!13393 m!9093))

(declare-fun m!9095 () Bool)

(assert (=> b!13389 m!9095))

(declare-fun m!9097 () Bool)

(assert (=> b!13390 m!9097))

(declare-fun m!9099 () Bool)

(assert (=> b!13390 m!9099))

(declare-fun m!9101 () Bool)

(assert (=> b!13394 m!9101))

(declare-fun m!9103 () Bool)

(assert (=> start!1992 m!9103))

(check-sat (not b!13389) (not start!1992) (not b!13390) (not b!13388) (not b!13394) (not b!13393) tp_is_empty!667)
(check-sat)
(get-model)

(declare-fun d!2011 () Bool)

(assert (=> d!2011 (= (isEmpty!81 l!522) ((_ is Nil!390) l!522))))

(assert (=> b!13393 d!2011))

(declare-fun d!2013 () Bool)

(declare-fun res!10606 () Bool)

(declare-fun e!8058 () Bool)

(assert (=> d!2013 (=> res!10606 e!8058)))

(assert (=> d!2013 (= res!10606 (or ((_ is Nil!390) l!522) ((_ is Nil!390) (t!2789 l!522))))))

(assert (=> d!2013 (= (isStrictlySorted!78 l!522) e!8058)))

(declare-fun b!13453 () Bool)

(declare-fun e!8059 () Bool)

(assert (=> b!13453 (= e!8058 e!8059)))

(declare-fun res!10607 () Bool)

(assert (=> b!13453 (=> (not res!10607) (not e!8059))))

(assert (=> b!13453 (= res!10607 (bvslt (_1!240 (h!955 l!522)) (_1!240 (h!955 (t!2789 l!522)))))))

(declare-fun b!13454 () Bool)

(assert (=> b!13454 (= e!8059 (isStrictlySorted!78 (t!2789 l!522)))))

(assert (= (and d!2013 (not res!10606)) b!13453))

(assert (= (and b!13453 res!10607) b!13454))

(declare-fun m!9131 () Bool)

(assert (=> b!13454 m!9131))

(assert (=> start!1992 d!2013))

(declare-fun d!2017 () Bool)

(assert (=> d!2017 (= (isEmpty!81 lt!3510) ((_ is Nil!390) lt!3510))))

(assert (=> b!13394 d!2017))

(declare-fun d!2019 () Bool)

(declare-fun res!10618 () Bool)

(declare-fun e!8070 () Bool)

(assert (=> d!2019 (=> res!10618 e!8070)))

(assert (=> d!2019 (= res!10618 ((_ is Nil!390) lt!3510))))

(assert (=> d!2019 (= (forall!74 lt!3510 lambda!71) e!8070)))

(declare-fun b!13465 () Bool)

(declare-fun e!8071 () Bool)

(assert (=> b!13465 (= e!8070 e!8071)))

(declare-fun res!10619 () Bool)

(assert (=> b!13465 (=> (not res!10619) (not e!8071))))

(declare-fun dynLambda!86 (Int tuple2!480) Bool)

(assert (=> b!13465 (= res!10619 (dynLambda!86 lambda!71 (h!955 lt!3510)))))

(declare-fun b!13466 () Bool)

(assert (=> b!13466 (= e!8071 (forall!74 (t!2789 lt!3510) lambda!71))))

(assert (= (and d!2019 (not res!10618)) b!13465))

(assert (= (and b!13465 res!10619) b!13466))

(declare-fun b_lambda!877 () Bool)

(assert (=> (not b_lambda!877) (not b!13465)))

(declare-fun m!9137 () Bool)

(assert (=> b!13465 m!9137))

(declare-fun m!9139 () Bool)

(assert (=> b!13466 m!9139))

(assert (=> b!13389 d!2019))

(declare-fun d!2025 () Bool)

(declare-fun res!10622 () Bool)

(declare-fun e!8074 () Bool)

(assert (=> d!2025 (=> res!10622 e!8074)))

(assert (=> d!2025 (= res!10622 (or ((_ is Nil!390) lt!3510) ((_ is Nil!390) (t!2789 lt!3510))))))

(assert (=> d!2025 (= (isStrictlySorted!78 lt!3510) e!8074)))

(declare-fun b!13469 () Bool)

(declare-fun e!8075 () Bool)

(assert (=> b!13469 (= e!8074 e!8075)))

(declare-fun res!10623 () Bool)

(assert (=> b!13469 (=> (not res!10623) (not e!8075))))

(assert (=> b!13469 (= res!10623 (bvslt (_1!240 (h!955 lt!3510)) (_1!240 (h!955 (t!2789 lt!3510)))))))

(declare-fun b!13470 () Bool)

(assert (=> b!13470 (= e!8075 (isStrictlySorted!78 (t!2789 lt!3510)))))

(assert (= (and d!2025 (not res!10622)) b!13469))

(assert (= (and b!13469 res!10623) b!13470))

(declare-fun m!9143 () Bool)

(assert (=> b!13470 m!9143))

(assert (=> b!13390 d!2025))

(declare-fun bs!525 () Bool)

(declare-fun b!13520 () Bool)

(assert (= bs!525 (and b!13520 b!13389)))

(declare-fun lambda!82 () Int)

(assert (=> bs!525 (= lambda!82 lambda!71)))

(assert (=> b!13520 true))

(declare-fun bm!371 () Bool)

(declare-fun call!374 () Bool)

(declare-fun lt!3521 () List!393)

(assert (=> bm!371 (= call!374 (isEmpty!81 lt!3521))))

(declare-fun b!13513 () Bool)

(declare-fun e!8106 () List!393)

(declare-fun call!375 () List!393)

(declare-fun $colon$colon!15 (List!393 tuple2!480) List!393)

(assert (=> b!13513 (= e!8106 ($colon$colon!15 call!375 (h!955 (t!2789 l!522))))))

(declare-fun b!13514 () Bool)

(declare-fun e!8105 () List!393)

(assert (=> b!13514 (= e!8106 e!8105)))

(declare-fun c!1253 () Bool)

(assert (=> b!13514 (= c!1253 (and ((_ is Cons!389) (t!2789 l!522)) (not (= (_2!240 (h!955 (t!2789 l!522))) value!159))))))

(declare-fun b!13515 () Bool)

(declare-fun e!8104 () Bool)

(declare-fun e!8102 () Bool)

(assert (=> b!13515 (= e!8104 e!8102)))

(declare-fun c!1254 () Bool)

(assert (=> b!13515 (= c!1254 (isEmpty!81 (t!2789 l!522)))))

(declare-fun d!2029 () Bool)

(assert (=> d!2029 e!8104))

(declare-fun res!10644 () Bool)

(assert (=> d!2029 (=> (not res!10644) (not e!8104))))

(assert (=> d!2029 (= res!10644 (isStrictlySorted!78 lt!3521))))

(assert (=> d!2029 (= lt!3521 e!8106)))

(declare-fun c!1252 () Bool)

(assert (=> d!2029 (= c!1252 (and ((_ is Cons!389) (t!2789 l!522)) (= (_2!240 (h!955 (t!2789 l!522))) value!159)))))

(assert (=> d!2029 (isStrictlySorted!78 (t!2789 l!522))))

(assert (=> d!2029 (= (filterByValue!7 (t!2789 l!522) value!159) lt!3521)))

(declare-fun bm!372 () Bool)

(assert (=> bm!372 (= call!375 (filterByValue!7 (t!2789 (t!2789 l!522)) value!159))))

(declare-fun b!13516 () Bool)

(declare-fun e!8103 () Bool)

(assert (=> b!13516 (= e!8102 e!8103)))

(declare-fun res!10642 () Bool)

(assert (=> b!13516 (= res!10642 call!374)))

(assert (=> b!13516 (=> res!10642 e!8103)))

(declare-fun b!13517 () Bool)

(assert (=> b!13517 (= e!8105 call!375)))

(declare-fun b!13518 () Bool)

(assert (=> b!13518 (= e!8105 Nil!390)))

(declare-fun b!13519 () Bool)

(declare-fun head!784 (List!393) tuple2!480)

(assert (=> b!13519 (= e!8103 (bvsge (_1!240 (head!784 lt!3521)) (_1!240 (head!784 (t!2789 l!522)))))))

(declare-fun res!10643 () Bool)

(assert (=> b!13520 (=> (not res!10643) (not e!8104))))

(assert (=> b!13520 (= res!10643 (forall!74 lt!3521 lambda!82))))

(declare-fun b!13521 () Bool)

(assert (=> b!13521 (= e!8102 call!374)))

(assert (= (and d!2029 c!1252) b!13513))

(assert (= (and d!2029 (not c!1252)) b!13514))

(assert (= (and b!13514 c!1253) b!13517))

(assert (= (and b!13514 (not c!1253)) b!13518))

(assert (= (or b!13513 b!13517) bm!372))

(assert (= (and d!2029 res!10644) b!13520))

(assert (= (and b!13520 res!10643) b!13515))

(assert (= (and b!13515 c!1254) b!13521))

(assert (= (and b!13515 (not c!1254)) b!13516))

(assert (= (and b!13516 (not res!10642)) b!13519))

(assert (= (or b!13521 b!13516) bm!371))

(declare-fun m!9147 () Bool)

(assert (=> bm!372 m!9147))

(declare-fun m!9151 () Bool)

(assert (=> b!13515 m!9151))

(declare-fun m!9155 () Bool)

(assert (=> b!13520 m!9155))

(declare-fun m!9159 () Bool)

(assert (=> bm!371 m!9159))

(declare-fun m!9163 () Bool)

(assert (=> d!2029 m!9163))

(assert (=> d!2029 m!9131))

(declare-fun m!9167 () Bool)

(assert (=> b!13519 m!9167))

(declare-fun m!9171 () Bool)

(assert (=> b!13519 m!9171))

(declare-fun m!9175 () Bool)

(assert (=> b!13513 m!9175))

(assert (=> b!13390 d!2029))

(declare-fun b!13539 () Bool)

(declare-fun e!8116 () Bool)

(declare-fun tp!2197 () Bool)

(assert (=> b!13539 (= e!8116 (and tp_is_empty!667 tp!2197))))

(assert (=> b!13388 (= tp!2186 e!8116)))

(assert (= (and b!13388 ((_ is Cons!389) (t!2789 l!522))) b!13539))

(declare-fun b_lambda!881 () Bool)

(assert (= b_lambda!877 (or b!13389 b_lambda!881)))

(declare-fun bs!527 () Bool)

(declare-fun d!2038 () Bool)

(assert (= bs!527 (and d!2038 b!13389)))

(assert (=> bs!527 (= (dynLambda!86 lambda!71 (h!955 lt!3510)) (= (_2!240 (h!955 lt!3510)) value!159))))

(assert (=> b!13465 d!2038))

(check-sat (not b!13454) (not bm!371) (not b!13470) (not b!13515) (not b!13466) tp_is_empty!667 (not b!13519) (not b!13539) (not bm!372) (not b!13513) (not d!2029) (not b!13520) (not b_lambda!881))
(check-sat)
