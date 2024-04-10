; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43860 () Bool)

(assert start!43860)

(declare-fun b!484455 () Bool)

(declare-fun res!288614 () Bool)

(declare-fun e!285192 () Bool)

(assert (=> b!484455 (=> (not res!288614) (not e!285192))))

(declare-datatypes ((B!1136 0))(
  ( (B!1137 (val!7020 Int)) )
))
(declare-datatypes ((tuple2!9242 0))(
  ( (tuple2!9243 (_1!4632 (_ BitVec 64)) (_2!4632 B!1136)) )
))
(declare-datatypes ((List!9284 0))(
  ( (Nil!9281) (Cons!9280 (h!10136 tuple2!9242) (t!15506 List!9284)) )
))
(declare-fun l!956 () List!9284)

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!386 (List!9284 (_ BitVec 64)) Bool)

(assert (=> b!484455 (= res!288614 (not (containsKey!386 (t!15506 l!956) key!251)))))

(declare-fun b!484456 () Bool)

(declare-fun res!288611 () Bool)

(assert (=> b!484456 (=> (not res!288611) (not e!285192))))

(declare-fun isStrictlySorted!423 (List!9284) Bool)

(assert (=> b!484456 (= res!288611 (isStrictlySorted!423 (t!15506 l!956)))))

(declare-fun res!288612 () Bool)

(declare-fun e!285191 () Bool)

(assert (=> start!43860 (=> (not res!288612) (not e!285191))))

(assert (=> start!43860 (= res!288612 (isStrictlySorted!423 l!956))))

(assert (=> start!43860 e!285191))

(declare-fun e!285190 () Bool)

(assert (=> start!43860 e!285190))

(assert (=> start!43860 true))

(declare-fun tp_is_empty!13945 () Bool)

(assert (=> start!43860 tp_is_empty!13945))

(declare-fun b!484457 () Bool)

(declare-fun ListPrimitiveSize!64 (List!9284) Int)

(assert (=> b!484457 (= e!285192 (>= (ListPrimitiveSize!64 (t!15506 l!956)) (ListPrimitiveSize!64 l!956)))))

(declare-fun b!484458 () Bool)

(assert (=> b!484458 (= e!285191 e!285192)))

(declare-fun res!288613 () Bool)

(assert (=> b!484458 (=> (not res!288613) (not e!285192))))

(assert (=> b!484458 (= res!288613 (and (is-Cons!9280 l!956) (bvslt (_1!4632 (h!10136 l!956)) key!251)))))

(declare-fun lt!219379 () List!9284)

(declare-fun value!166 () B!1136)

(declare-fun insertStrictlySorted!238 (List!9284 (_ BitVec 64) B!1136) List!9284)

(assert (=> b!484458 (= lt!219379 (insertStrictlySorted!238 l!956 key!251 value!166))))

(declare-fun b!484459 () Bool)

(declare-fun res!288610 () Bool)

(assert (=> b!484459 (=> (not res!288610) (not e!285191))))

(assert (=> b!484459 (= res!288610 (not (containsKey!386 l!956 key!251)))))

(declare-fun b!484460 () Bool)

(declare-fun tp!43534 () Bool)

(assert (=> b!484460 (= e!285190 (and tp_is_empty!13945 tp!43534))))

(assert (= (and start!43860 res!288612) b!484459))

(assert (= (and b!484459 res!288610) b!484458))

(assert (= (and b!484458 res!288613) b!484456))

(assert (= (and b!484456 res!288611) b!484455))

(assert (= (and b!484455 res!288614) b!484457))

(assert (= (and start!43860 (is-Cons!9280 l!956)) b!484460))

(declare-fun m!465015 () Bool)

(assert (=> b!484458 m!465015))

(declare-fun m!465017 () Bool)

(assert (=> b!484456 m!465017))

(declare-fun m!465019 () Bool)

(assert (=> b!484455 m!465019))

(declare-fun m!465021 () Bool)

(assert (=> start!43860 m!465021))

(declare-fun m!465023 () Bool)

(assert (=> b!484457 m!465023))

(declare-fun m!465025 () Bool)

(assert (=> b!484457 m!465025))

(declare-fun m!465027 () Bool)

(assert (=> b!484459 m!465027))

(push 1)

(assert (not b!484455))

(assert tp_is_empty!13945)

(assert (not b!484460))

(assert (not start!43860))

(assert (not b!484457))

(assert (not b!484458))

(assert (not b!484456))

(assert (not b!484459))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77105 () Bool)

(declare-fun e!285245 () Bool)

(assert (=> d!77105 e!285245))

(declare-fun res!288655 () Bool)

(assert (=> d!77105 (=> (not res!288655) (not e!285245))))

(declare-fun lt!219396 () List!9284)

(assert (=> d!77105 (= res!288655 (isStrictlySorted!423 lt!219396))))

(declare-fun e!285248 () List!9284)

(assert (=> d!77105 (= lt!219396 e!285248)))

(declare-fun c!58273 () Bool)

(assert (=> d!77105 (= c!58273 (and (is-Cons!9280 l!956) (bvslt (_1!4632 (h!10136 l!956)) key!251)))))

(assert (=> d!77105 (isStrictlySorted!423 l!956)))

(assert (=> d!77105 (= (insertStrictlySorted!238 l!956 key!251 value!166) lt!219396)))

(declare-fun b!484559 () Bool)

(declare-fun e!285247 () List!9284)

(declare-fun call!31138 () List!9284)

(assert (=> b!484559 (= e!285247 call!31138)))

(declare-fun c!58272 () Bool)

(declare-fun c!58274 () Bool)

(declare-fun e!285246 () List!9284)

(declare-fun b!484560 () Bool)

(assert (=> b!484560 (= e!285246 (ite c!58274 (t!15506 l!956) (ite c!58272 (Cons!9280 (h!10136 l!956) (t!15506 l!956)) Nil!9281)))))

(declare-fun bm!31135 () Bool)

(declare-fun call!31140 () List!9284)

(declare-fun call!31139 () List!9284)

(assert (=> bm!31135 (= call!31140 call!31139)))

(declare-fun bm!31136 () Bool)

(assert (=> bm!31136 (= call!31138 call!31140)))

(declare-fun b!484561 () Bool)

(assert (=> b!484561 (= e!285247 call!31138)))

(declare-fun b!484562 () Bool)

(declare-fun contains!2681 (List!9284 tuple2!9242) Bool)

(assert (=> b!484562 (= e!285245 (contains!2681 lt!219396 (tuple2!9243 key!251 value!166)))))

(declare-fun b!484563 () Bool)

(declare-fun e!285249 () List!9284)

(assert (=> b!484563 (= e!285249 call!31140)))

(declare-fun bm!31137 () Bool)

(declare-fun $colon$colon!122 (List!9284 tuple2!9242) List!9284)

(assert (=> bm!31137 (= call!31139 ($colon$colon!122 e!285246 (ite c!58273 (h!10136 l!956) (tuple2!9243 key!251 value!166))))))

(declare-fun c!58271 () Bool)

(assert (=> bm!31137 (= c!58271 c!58273)))

(declare-fun b!484564 () Bool)

(assert (=> b!484564 (= e!285246 (insertStrictlySorted!238 (t!15506 l!956) key!251 value!166))))

(declare-fun b!484565 () Bool)

(assert (=> b!484565 (= c!58272 (and (is-Cons!9280 l!956) (bvsgt (_1!4632 (h!10136 l!956)) key!251)))))

(assert (=> b!484565 (= e!285249 e!285247)))

(declare-fun b!484566 () Bool)

(assert (=> b!484566 (= e!285248 call!31139)))

(declare-fun b!484567 () Bool)

(assert (=> b!484567 (= e!285248 e!285249)))

(assert (=> b!484567 (= c!58274 (and (is-Cons!9280 l!956) (= (_1!4632 (h!10136 l!956)) key!251)))))

(declare-fun b!484568 () Bool)

(declare-fun res!288656 () Bool)

(assert (=> b!484568 (=> (not res!288656) (not e!285245))))

(assert (=> b!484568 (= res!288656 (containsKey!386 lt!219396 key!251))))

(assert (= (and d!77105 c!58273) b!484566))

(assert (= (and d!77105 (not c!58273)) b!484567))

(assert (= (and b!484567 c!58274) b!484563))

(assert (= (and b!484567 (not c!58274)) b!484565))

(assert (= (and b!484565 c!58272) b!484559))

(assert (= (and b!484565 (not c!58272)) b!484561))

(assert (= (or b!484559 b!484561) bm!31136))

(assert (= (or b!484563 bm!31136) bm!31135))

(assert (= (or b!484566 bm!31135) bm!31137))

(assert (= (and bm!31137 c!58271) b!484564))

(assert (= (and bm!31137 (not c!58271)) b!484560))

(assert (= (and d!77105 res!288655) b!484568))

(assert (= (and b!484568 res!288656) b!484562))

(declare-fun m!465061 () Bool)

(assert (=> bm!31137 m!465061))

(declare-fun m!465063 () Bool)

(assert (=> b!484562 m!465063))

(declare-fun m!465065 () Bool)

(assert (=> d!77105 m!465065))

(assert (=> d!77105 m!465021))

(declare-fun m!465067 () Bool)

(assert (=> b!484564 m!465067))

(declare-fun m!465069 () Bool)

(assert (=> b!484568 m!465069))

(assert (=> b!484458 d!77105))

(declare-fun d!77115 () Bool)

(declare-fun res!288669 () Bool)

(declare-fun e!285260 () Bool)

(assert (=> d!77115 (=> res!288669 e!285260)))

(assert (=> d!77115 (= res!288669 (or (is-Nil!9281 l!956) (is-Nil!9281 (t!15506 l!956))))))

(assert (=> d!77115 (= (isStrictlySorted!423 l!956) e!285260)))

(declare-fun b!484585 () Bool)

(declare-fun e!285261 () Bool)

(assert (=> b!484585 (= e!285260 e!285261)))

(declare-fun res!288670 () Bool)

(assert (=> b!484585 (=> (not res!288670) (not e!285261))))

(assert (=> b!484585 (= res!288670 (bvslt (_1!4632 (h!10136 l!956)) (_1!4632 (h!10136 (t!15506 l!956)))))))

(declare-fun b!484586 () Bool)

(assert (=> b!484586 (= e!285261 (isStrictlySorted!423 (t!15506 l!956)))))

(assert (= (and d!77115 (not res!288669)) b!484585))

(assert (= (and b!484585 res!288670) b!484586))

(assert (=> b!484586 m!465017))

(assert (=> start!43860 d!77115))

(declare-fun d!77117 () Bool)

(declare-fun res!288683 () Bool)

(declare-fun e!285282 () Bool)

(assert (=> d!77117 (=> res!288683 e!285282)))

(assert (=> d!77117 (= res!288683 (and (is-Cons!9280 l!956) (= (_1!4632 (h!10136 l!956)) key!251)))))

(assert (=> d!77117 (= (containsKey!386 l!956 key!251) e!285282)))

(declare-fun b!484617 () Bool)

(declare-fun e!285283 () Bool)

(assert (=> b!484617 (= e!285282 e!285283)))

(declare-fun res!288684 () Bool)

(assert (=> b!484617 (=> (not res!288684) (not e!285283))))

(assert (=> b!484617 (= res!288684 (and (or (not (is-Cons!9280 l!956)) (bvsle (_1!4632 (h!10136 l!956)) key!251)) (is-Cons!9280 l!956) (bvslt (_1!4632 (h!10136 l!956)) key!251)))))

(declare-fun b!484618 () Bool)

(assert (=> b!484618 (= e!285283 (containsKey!386 (t!15506 l!956) key!251))))

(assert (= (and d!77117 (not res!288683)) b!484617))

(assert (= (and b!484617 res!288684) b!484618))

(assert (=> b!484618 m!465019))

(assert (=> b!484459 d!77117))

(declare-fun d!77123 () Bool)

(declare-fun res!288685 () Bool)

(declare-fun e!285285 () Bool)

(assert (=> d!77123 (=> res!288685 e!285285)))

(assert (=> d!77123 (= res!288685 (and (is-Cons!9280 (t!15506 l!956)) (= (_1!4632 (h!10136 (t!15506 l!956))) key!251)))))

(assert (=> d!77123 (= (containsKey!386 (t!15506 l!956) key!251) e!285285)))

(declare-fun b!484623 () Bool)

(declare-fun e!285286 () Bool)

(assert (=> b!484623 (= e!285285 e!285286)))

(declare-fun res!288686 () Bool)

(assert (=> b!484623 (=> (not res!288686) (not e!285286))))

(assert (=> b!484623 (= res!288686 (and (or (not (is-Cons!9280 (t!15506 l!956))) (bvsle (_1!4632 (h!10136 (t!15506 l!956))) key!251)) (is-Cons!9280 (t!15506 l!956)) (bvslt (_1!4632 (h!10136 (t!15506 l!956))) key!251)))))

(declare-fun b!484624 () Bool)

(assert (=> b!484624 (= e!285286 (containsKey!386 (t!15506 (t!15506 l!956)) key!251))))

(assert (= (and d!77123 (not res!288685)) b!484623))

(assert (= (and b!484623 res!288686) b!484624))

(declare-fun m!465093 () Bool)

(assert (=> b!484624 m!465093))

(assert (=> b!484455 d!77123))

(declare-fun d!77127 () Bool)

(declare-fun lt!219405 () Int)

(assert (=> d!77127 (>= lt!219405 0)))

(declare-fun e!285303 () Int)

(assert (=> d!77127 (= lt!219405 e!285303)))

(declare-fun c!58291 () Bool)

(assert (=> d!77127 (= c!58291 (is-Nil!9281 (t!15506 l!956)))))

(assert (=> d!77127 (= (ListPrimitiveSize!64 (t!15506 l!956)) lt!219405)))

(declare-fun b!484646 () Bool)

(assert (=> b!484646 (= e!285303 0)))

(declare-fun b!484647 () Bool)

(assert (=> b!484647 (= e!285303 (+ 1 (ListPrimitiveSize!64 (t!15506 (t!15506 l!956)))))))

(assert (= (and d!77127 c!58291) b!484646))

(assert (= (and d!77127 (not c!58291)) b!484647))

(declare-fun m!465097 () Bool)

(assert (=> b!484647 m!465097))

(assert (=> b!484457 d!77127))

(declare-fun d!77135 () Bool)

(declare-fun lt!219406 () Int)

(assert (=> d!77135 (>= lt!219406 0)))

(declare-fun e!285304 () Int)

(assert (=> d!77135 (= lt!219406 e!285304)))

(declare-fun c!58292 () Bool)

(assert (=> d!77135 (= c!58292 (is-Nil!9281 l!956))))

(assert (=> d!77135 (= (ListPrimitiveSize!64 l!956) lt!219406)))

(declare-fun b!484648 () Bool)

(assert (=> b!484648 (= e!285304 0)))

(declare-fun b!484649 () Bool)

(assert (=> b!484649 (= e!285304 (+ 1 (ListPrimitiveSize!64 (t!15506 l!956))))))

(assert (= (and d!77135 c!58292) b!484648))

(assert (= (and d!77135 (not c!58292)) b!484649))

(assert (=> b!484649 m!465023))

(assert (=> b!484457 d!77135))

(declare-fun d!77137 () Bool)

(declare-fun res!288698 () Bool)

(declare-fun e!285306 () Bool)

(assert (=> d!77137 (=> res!288698 e!285306)))

(assert (=> d!77137 (= res!288698 (or (is-Nil!9281 (t!15506 l!956)) (is-Nil!9281 (t!15506 (t!15506 l!956)))))))

(assert (=> d!77137 (= (isStrictlySorted!423 (t!15506 l!956)) e!285306)))

(declare-fun b!484651 () Bool)

(declare-fun e!285308 () Bool)

(assert (=> b!484651 (= e!285306 e!285308)))

(declare-fun res!288700 () Bool)

(assert (=> b!484651 (=> (not res!288700) (not e!285308))))

(assert (=> b!484651 (= res!288700 (bvslt (_1!4632 (h!10136 (t!15506 l!956))) (_1!4632 (h!10136 (t!15506 (t!15506 l!956))))))))

(declare-fun b!484653 () Bool)

(assert (=> b!484653 (= e!285308 (isStrictlySorted!423 (t!15506 (t!15506 l!956))))))

(assert (= (and d!77137 (not res!288698)) b!484651))

(assert (= (and b!484651 res!288700) b!484653))

(declare-fun m!465099 () Bool)

(assert (=> b!484653 m!465099))

(assert (=> b!484456 d!77137))

(declare-fun b!484658 () Bool)

(declare-fun e!285311 () Bool)

(declare-fun tp!43546 () Bool)

(assert (=> b!484658 (= e!285311 (and tp_is_empty!13945 tp!43546))))

(assert (=> b!484460 (= tp!43534 e!285311)))

(assert (= (and b!484460 (is-Cons!9280 (t!15506 l!956))) b!484658))

(push 1)

(assert (not b!484649))

(assert tp_is_empty!13945)

(assert (not b!484647))

(assert (not b!484618))

(assert (not b!484658))

(assert (not b!484562))

(assert (not b!484586))

(assert (not b!484564))

(assert (not b!484624))

