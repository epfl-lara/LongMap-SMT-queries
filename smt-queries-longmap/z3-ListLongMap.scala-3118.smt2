; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43838 () Bool)

(assert start!43838)

(declare-fun res!288519 () Bool)

(declare-fun e!285070 () Bool)

(assert (=> start!43838 (=> (not res!288519) (not e!285070))))

(declare-datatypes ((B!1132 0))(
  ( (B!1133 (val!7018 Int)) )
))
(declare-datatypes ((tuple2!9238 0))(
  ( (tuple2!9239 (_1!4630 (_ BitVec 64)) (_2!4630 B!1132)) )
))
(declare-datatypes ((List!9282 0))(
  ( (Nil!9279) (Cons!9278 (h!10134 tuple2!9238) (t!15504 List!9282)) )
))
(declare-fun l!956 () List!9282)

(declare-fun isStrictlySorted!421 (List!9282) Bool)

(assert (=> start!43838 (= res!288519 (isStrictlySorted!421 l!956))))

(assert (=> start!43838 e!285070))

(declare-fun e!285072 () Bool)

(assert (=> start!43838 e!285072))

(assert (=> start!43838 true))

(declare-fun tp_is_empty!13941 () Bool)

(assert (=> start!43838 tp_is_empty!13941))

(declare-fun b!484270 () Bool)

(declare-fun e!285071 () Bool)

(assert (=> b!484270 (= e!285070 e!285071)))

(declare-fun res!288518 () Bool)

(assert (=> b!484270 (=> (not res!288518) (not e!285071))))

(declare-fun key!251 () (_ BitVec 64))

(get-info :version)

(assert (=> b!484270 (= res!288518 (and ((_ is Cons!9278) l!956) (bvslt (_1!4630 (h!10134 l!956)) key!251)))))

(declare-fun lt!219364 () List!9282)

(declare-fun value!166 () B!1132)

(declare-fun insertStrictlySorted!236 (List!9282 (_ BitVec 64) B!1132) List!9282)

(assert (=> b!484270 (= lt!219364 (insertStrictlySorted!236 l!956 key!251 value!166))))

(declare-fun b!484271 () Bool)

(declare-fun tp!43519 () Bool)

(assert (=> b!484271 (= e!285072 (and tp_is_empty!13941 tp!43519))))

(declare-fun b!484272 () Bool)

(declare-fun res!288520 () Bool)

(assert (=> b!484272 (=> (not res!288520) (not e!285070))))

(declare-fun containsKey!384 (List!9282 (_ BitVec 64)) Bool)

(assert (=> b!484272 (= res!288520 (not (containsKey!384 l!956 key!251)))))

(declare-fun b!484273 () Bool)

(declare-fun res!288521 () Bool)

(assert (=> b!484273 (=> (not res!288521) (not e!285071))))

(assert (=> b!484273 (= res!288521 (isStrictlySorted!421 (t!15504 l!956)))))

(declare-fun b!484274 () Bool)

(assert (=> b!484274 (= e!285071 (containsKey!384 (t!15504 l!956) key!251))))

(assert (= (and start!43838 res!288519) b!484272))

(assert (= (and b!484272 res!288520) b!484270))

(assert (= (and b!484270 res!288518) b!484273))

(assert (= (and b!484273 res!288521) b!484274))

(assert (= (and start!43838 ((_ is Cons!9278) l!956)) b!484271))

(declare-fun m!464953 () Bool)

(assert (=> b!484273 m!464953))

(declare-fun m!464955 () Bool)

(assert (=> b!484274 m!464955))

(declare-fun m!464957 () Bool)

(assert (=> b!484270 m!464957))

(declare-fun m!464959 () Bool)

(assert (=> start!43838 m!464959))

(declare-fun m!464961 () Bool)

(assert (=> b!484272 m!464961))

(check-sat tp_is_empty!13941 (not b!484274) (not b!484272) (not b!484273) (not b!484270) (not b!484271) (not start!43838))
(check-sat)
(get-model)

(declare-fun d!77071 () Bool)

(declare-fun res!288542 () Bool)

(declare-fun e!285090 () Bool)

(assert (=> d!77071 (=> res!288542 e!285090)))

(assert (=> d!77071 (= res!288542 (and ((_ is Cons!9278) l!956) (= (_1!4630 (h!10134 l!956)) key!251)))))

(assert (=> d!77071 (= (containsKey!384 l!956 key!251) e!285090)))

(declare-fun b!484298 () Bool)

(declare-fun e!285091 () Bool)

(assert (=> b!484298 (= e!285090 e!285091)))

(declare-fun res!288543 () Bool)

(assert (=> b!484298 (=> (not res!288543) (not e!285091))))

(assert (=> b!484298 (= res!288543 (and (or (not ((_ is Cons!9278) l!956)) (bvsle (_1!4630 (h!10134 l!956)) key!251)) ((_ is Cons!9278) l!956) (bvslt (_1!4630 (h!10134 l!956)) key!251)))))

(declare-fun b!484299 () Bool)

(assert (=> b!484299 (= e!285091 (containsKey!384 (t!15504 l!956) key!251))))

(assert (= (and d!77071 (not res!288542)) b!484298))

(assert (= (and b!484298 res!288543) b!484299))

(assert (=> b!484299 m!464955))

(assert (=> b!484272 d!77071))

(declare-fun d!77075 () Bool)

(declare-fun res!288558 () Bool)

(declare-fun e!285106 () Bool)

(assert (=> d!77075 (=> res!288558 e!285106)))

(assert (=> d!77075 (= res!288558 (or ((_ is Nil!9279) l!956) ((_ is Nil!9279) (t!15504 l!956))))))

(assert (=> d!77075 (= (isStrictlySorted!421 l!956) e!285106)))

(declare-fun b!484314 () Bool)

(declare-fun e!285107 () Bool)

(assert (=> b!484314 (= e!285106 e!285107)))

(declare-fun res!288559 () Bool)

(assert (=> b!484314 (=> (not res!288559) (not e!285107))))

(assert (=> b!484314 (= res!288559 (bvslt (_1!4630 (h!10134 l!956)) (_1!4630 (h!10134 (t!15504 l!956)))))))

(declare-fun b!484315 () Bool)

(assert (=> b!484315 (= e!285107 (isStrictlySorted!421 (t!15504 l!956)))))

(assert (= (and d!77075 (not res!288558)) b!484314))

(assert (= (and b!484314 res!288559) b!484315))

(assert (=> b!484315 m!464953))

(assert (=> start!43838 d!77075))

(declare-fun d!77081 () Bool)

(declare-fun res!288560 () Bool)

(declare-fun e!285108 () Bool)

(assert (=> d!77081 (=> res!288560 e!285108)))

(assert (=> d!77081 (= res!288560 (or ((_ is Nil!9279) (t!15504 l!956)) ((_ is Nil!9279) (t!15504 (t!15504 l!956)))))))

(assert (=> d!77081 (= (isStrictlySorted!421 (t!15504 l!956)) e!285108)))

(declare-fun b!484316 () Bool)

(declare-fun e!285109 () Bool)

(assert (=> b!484316 (= e!285108 e!285109)))

(declare-fun res!288561 () Bool)

(assert (=> b!484316 (=> (not res!288561) (not e!285109))))

(assert (=> b!484316 (= res!288561 (bvslt (_1!4630 (h!10134 (t!15504 l!956))) (_1!4630 (h!10134 (t!15504 (t!15504 l!956))))))))

(declare-fun b!484317 () Bool)

(assert (=> b!484317 (= e!285109 (isStrictlySorted!421 (t!15504 (t!15504 l!956))))))

(assert (= (and d!77081 (not res!288560)) b!484316))

(assert (= (and b!484316 res!288561) b!484317))

(declare-fun m!464973 () Bool)

(assert (=> b!484317 m!464973))

(assert (=> b!484273 d!77081))

(declare-fun b!484386 () Bool)

(declare-fun c!58235 () Bool)

(assert (=> b!484386 (= c!58235 (and ((_ is Cons!9278) l!956) (bvsgt (_1!4630 (h!10134 l!956)) key!251)))))

(declare-fun e!285153 () List!9282)

(declare-fun e!285154 () List!9282)

(assert (=> b!484386 (= e!285153 e!285154)))

(declare-fun bm!31110 () Bool)

(declare-fun call!31113 () List!9282)

(declare-fun call!31115 () List!9282)

(assert (=> bm!31110 (= call!31113 call!31115)))

(declare-fun b!484387 () Bool)

(declare-fun lt!219374 () List!9282)

(declare-fun e!285151 () Bool)

(declare-fun contains!2678 (List!9282 tuple2!9238) Bool)

(assert (=> b!484387 (= e!285151 (contains!2678 lt!219374 (tuple2!9239 key!251 value!166)))))

(declare-fun bm!31111 () Bool)

(declare-fun call!31114 () List!9282)

(assert (=> bm!31111 (= call!31114 call!31113)))

(declare-fun d!77083 () Bool)

(assert (=> d!77083 e!285151))

(declare-fun res!288582 () Bool)

(assert (=> d!77083 (=> (not res!288582) (not e!285151))))

(assert (=> d!77083 (= res!288582 (isStrictlySorted!421 lt!219374))))

(declare-fun e!285152 () List!9282)

(assert (=> d!77083 (= lt!219374 e!285152)))

(declare-fun c!58234 () Bool)

(assert (=> d!77083 (= c!58234 (and ((_ is Cons!9278) l!956) (bvslt (_1!4630 (h!10134 l!956)) key!251)))))

(assert (=> d!77083 (isStrictlySorted!421 l!956)))

(assert (=> d!77083 (= (insertStrictlySorted!236 l!956 key!251 value!166) lt!219374)))

(declare-fun b!484388 () Bool)

(declare-fun res!288583 () Bool)

(assert (=> b!484388 (=> (not res!288583) (not e!285151))))

(assert (=> b!484388 (= res!288583 (containsKey!384 lt!219374 key!251))))

(declare-fun e!285150 () List!9282)

(declare-fun b!484389 () Bool)

(assert (=> b!484389 (= e!285150 (insertStrictlySorted!236 (t!15504 l!956) key!251 value!166))))

(declare-fun b!484390 () Bool)

(assert (=> b!484390 (= e!285152 call!31115)))

(declare-fun b!484391 () Bool)

(assert (=> b!484391 (= e!285152 e!285153)))

(declare-fun c!58233 () Bool)

(assert (=> b!484391 (= c!58233 (and ((_ is Cons!9278) l!956) (= (_1!4630 (h!10134 l!956)) key!251)))))

(declare-fun b!484392 () Bool)

(assert (=> b!484392 (= e!285153 call!31113)))

(declare-fun b!484393 () Bool)

(assert (=> b!484393 (= e!285154 call!31114)))

(declare-fun b!484394 () Bool)

(assert (=> b!484394 (= e!285154 call!31114)))

(declare-fun b!484395 () Bool)

(assert (=> b!484395 (= e!285150 (ite c!58233 (t!15504 l!956) (ite c!58235 (Cons!9278 (h!10134 l!956) (t!15504 l!956)) Nil!9279)))))

(declare-fun bm!31112 () Bool)

(declare-fun $colon$colon!120 (List!9282 tuple2!9238) List!9282)

(assert (=> bm!31112 (= call!31115 ($colon$colon!120 e!285150 (ite c!58234 (h!10134 l!956) (tuple2!9239 key!251 value!166))))))

(declare-fun c!58236 () Bool)

(assert (=> bm!31112 (= c!58236 c!58234)))

(assert (= (and d!77083 c!58234) b!484390))

(assert (= (and d!77083 (not c!58234)) b!484391))

(assert (= (and b!484391 c!58233) b!484392))

(assert (= (and b!484391 (not c!58233)) b!484386))

(assert (= (and b!484386 c!58235) b!484394))

(assert (= (and b!484386 (not c!58235)) b!484393))

(assert (= (or b!484394 b!484393) bm!31111))

(assert (= (or b!484392 bm!31111) bm!31110))

(assert (= (or b!484390 bm!31110) bm!31112))

(assert (= (and bm!31112 c!58236) b!484389))

(assert (= (and bm!31112 (not c!58236)) b!484395))

(assert (= (and d!77083 res!288582) b!484388))

(assert (= (and b!484388 res!288583) b!484387))

(declare-fun m!464981 () Bool)

(assert (=> b!484389 m!464981))

(declare-fun m!464983 () Bool)

(assert (=> bm!31112 m!464983))

(declare-fun m!464985 () Bool)

(assert (=> d!77083 m!464985))

(assert (=> d!77083 m!464959))

(declare-fun m!464987 () Bool)

(assert (=> b!484387 m!464987))

(declare-fun m!464989 () Bool)

(assert (=> b!484388 m!464989))

(assert (=> b!484270 d!77083))

(declare-fun d!77093 () Bool)

(declare-fun res!288590 () Bool)

(declare-fun e!285162 () Bool)

(assert (=> d!77093 (=> res!288590 e!285162)))

(assert (=> d!77093 (= res!288590 (and ((_ is Cons!9278) (t!15504 l!956)) (= (_1!4630 (h!10134 (t!15504 l!956))) key!251)))))

(assert (=> d!77093 (= (containsKey!384 (t!15504 l!956) key!251) e!285162)))

(declare-fun b!484410 () Bool)

(declare-fun e!285163 () Bool)

(assert (=> b!484410 (= e!285162 e!285163)))

(declare-fun res!288591 () Bool)

(assert (=> b!484410 (=> (not res!288591) (not e!285163))))

(assert (=> b!484410 (= res!288591 (and (or (not ((_ is Cons!9278) (t!15504 l!956))) (bvsle (_1!4630 (h!10134 (t!15504 l!956))) key!251)) ((_ is Cons!9278) (t!15504 l!956)) (bvslt (_1!4630 (h!10134 (t!15504 l!956))) key!251)))))

(declare-fun b!484411 () Bool)

(assert (=> b!484411 (= e!285163 (containsKey!384 (t!15504 (t!15504 l!956)) key!251))))

(assert (= (and d!77093 (not res!288590)) b!484410))

(assert (= (and b!484410 res!288591) b!484411))

(declare-fun m!464991 () Bool)

(assert (=> b!484411 m!464991))

(assert (=> b!484274 d!77093))

(declare-fun b!484416 () Bool)

(declare-fun e!285166 () Bool)

(declare-fun tp!43525 () Bool)

(assert (=> b!484416 (= e!285166 (and tp_is_empty!13941 tp!43525))))

(assert (=> b!484271 (= tp!43519 e!285166)))

(assert (= (and b!484271 ((_ is Cons!9278) (t!15504 l!956))) b!484416))

(check-sat tp_is_empty!13941 (not b!484389) (not b!484317) (not bm!31112) (not b!484416) (not d!77083) (not b!484387) (not b!484411) (not b!484299) (not b!484315) (not b!484388))
(check-sat)
