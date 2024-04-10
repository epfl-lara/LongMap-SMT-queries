; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43864 () Bool)

(assert start!43864)

(declare-fun b!484491 () Bool)

(declare-fun e!285209 () Bool)

(declare-datatypes ((B!1140 0))(
  ( (B!1141 (val!7022 Int)) )
))
(declare-datatypes ((tuple2!9246 0))(
  ( (tuple2!9247 (_1!4634 (_ BitVec 64)) (_2!4634 B!1140)) )
))
(declare-datatypes ((List!9286 0))(
  ( (Nil!9283) (Cons!9282 (h!10138 tuple2!9246) (t!15508 List!9286)) )
))
(declare-fun l!956 () List!9286)

(declare-fun ListPrimitiveSize!66 (List!9286) Int)

(assert (=> b!484491 (= e!285209 (>= (ListPrimitiveSize!66 (t!15508 l!956)) (ListPrimitiveSize!66 l!956)))))

(declare-fun res!288641 () Bool)

(declare-fun e!285210 () Bool)

(assert (=> start!43864 (=> (not res!288641) (not e!285210))))

(declare-fun isStrictlySorted!425 (List!9286) Bool)

(assert (=> start!43864 (= res!288641 (isStrictlySorted!425 l!956))))

(assert (=> start!43864 e!285210))

(declare-fun e!285208 () Bool)

(assert (=> start!43864 e!285208))

(assert (=> start!43864 true))

(declare-fun tp_is_empty!13949 () Bool)

(assert (=> start!43864 tp_is_empty!13949))

(declare-fun b!484492 () Bool)

(declare-fun res!288643 () Bool)

(assert (=> b!484492 (=> (not res!288643) (not e!285209))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!388 (List!9286 (_ BitVec 64)) Bool)

(assert (=> b!484492 (= res!288643 (not (containsKey!388 (t!15508 l!956) key!251)))))

(declare-fun b!484493 () Bool)

(declare-fun res!288642 () Bool)

(assert (=> b!484493 (=> (not res!288642) (not e!285209))))

(assert (=> b!484493 (= res!288642 (isStrictlySorted!425 (t!15508 l!956)))))

(declare-fun b!484494 () Bool)

(declare-fun res!288640 () Bool)

(assert (=> b!484494 (=> (not res!288640) (not e!285210))))

(assert (=> b!484494 (= res!288640 (not (containsKey!388 l!956 key!251)))))

(declare-fun b!484495 () Bool)

(assert (=> b!484495 (= e!285210 e!285209)))

(declare-fun res!288644 () Bool)

(assert (=> b!484495 (=> (not res!288644) (not e!285209))))

(assert (=> b!484495 (= res!288644 (and (is-Cons!9282 l!956) (bvslt (_1!4634 (h!10138 l!956)) key!251)))))

(declare-fun lt!219385 () List!9286)

(declare-fun value!166 () B!1140)

(declare-fun insertStrictlySorted!240 (List!9286 (_ BitVec 64) B!1140) List!9286)

(assert (=> b!484495 (= lt!219385 (insertStrictlySorted!240 l!956 key!251 value!166))))

(declare-fun b!484496 () Bool)

(declare-fun tp!43540 () Bool)

(assert (=> b!484496 (= e!285208 (and tp_is_empty!13949 tp!43540))))

(assert (= (and start!43864 res!288641) b!484494))

(assert (= (and b!484494 res!288640) b!484495))

(assert (= (and b!484495 res!288644) b!484493))

(assert (= (and b!484493 res!288642) b!484492))

(assert (= (and b!484492 res!288643) b!484491))

(assert (= (and start!43864 (is-Cons!9282 l!956)) b!484496))

(declare-fun m!465043 () Bool)

(assert (=> start!43864 m!465043))

(declare-fun m!465045 () Bool)

(assert (=> b!484494 m!465045))

(declare-fun m!465047 () Bool)

(assert (=> b!484495 m!465047))

(declare-fun m!465049 () Bool)

(assert (=> b!484492 m!465049))

(declare-fun m!465051 () Bool)

(assert (=> b!484491 m!465051))

(declare-fun m!465053 () Bool)

(assert (=> b!484491 m!465053))

(declare-fun m!465055 () Bool)

(assert (=> b!484493 m!465055))

(push 1)

(assert (not b!484491))

(assert (not b!484492))

(assert (not b!484494))

(assert tp_is_empty!13949)

(assert (not start!43864))

(assert (not b!484495))

(assert (not b!484493))

(assert (not b!484496))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!484587 () Bool)

(declare-fun e!285262 () List!9286)

(declare-fun call!31144 () List!9286)

(assert (=> b!484587 (= e!285262 call!31144)))

(declare-fun d!77109 () Bool)

(declare-fun e!285266 () Bool)

(assert (=> d!77109 e!285266))

(declare-fun res!288672 () Bool)

(assert (=> d!77109 (=> (not res!288672) (not e!285266))))

(declare-fun lt!219397 () List!9286)

(assert (=> d!77109 (= res!288672 (isStrictlySorted!425 lt!219397))))

(declare-fun e!285263 () List!9286)

(assert (=> d!77109 (= lt!219397 e!285263)))

(declare-fun c!58280 () Bool)

(assert (=> d!77109 (= c!58280 (and (is-Cons!9282 l!956) (bvslt (_1!4634 (h!10138 l!956)) key!251)))))

(assert (=> d!77109 (isStrictlySorted!425 l!956)))

(assert (=> d!77109 (= (insertStrictlySorted!240 l!956 key!251 value!166) lt!219397)))

(declare-fun b!484588 () Bool)

(declare-fun contains!2682 (List!9286 tuple2!9246) Bool)

(assert (=> b!484588 (= e!285266 (contains!2682 lt!219397 (tuple2!9247 key!251 value!166)))))

(declare-fun bm!31140 () Bool)

(declare-fun call!31143 () List!9286)

(assert (=> bm!31140 (= call!31144 call!31143)))

(declare-fun b!484589 () Bool)

(declare-fun c!58279 () Bool)

(assert (=> b!484589 (= c!58279 (and (is-Cons!9282 l!956) (bvsgt (_1!4634 (h!10138 l!956)) key!251)))))

(declare-fun e!285264 () List!9286)

(assert (=> b!484589 (= e!285262 e!285264)))

(declare-fun b!484590 () Bool)

(declare-fun call!31145 () List!9286)

(assert (=> b!484590 (= e!285264 call!31145)))

(declare-fun b!484591 () Bool)

(declare-fun res!288671 () Bool)

(assert (=> b!484591 (=> (not res!288671) (not e!285266))))

(assert (=> b!484591 (= res!288671 (containsKey!388 lt!219397 key!251))))

(declare-fun b!484592 () Bool)

(declare-fun c!58277 () Bool)

(declare-fun e!285265 () List!9286)

(assert (=> b!484592 (= e!285265 (ite c!58277 (t!15508 l!956) (ite c!58279 (Cons!9282 (h!10138 l!956) (t!15508 l!956)) Nil!9283)))))

(declare-fun b!484593 () Bool)

(assert (=> b!484593 (= e!285264 call!31145)))

(declare-fun b!484594 () Bool)

(assert (=> b!484594 (= e!285265 (insertStrictlySorted!240 (t!15508 l!956) key!251 value!166))))

(declare-fun bm!31141 () Bool)

(assert (=> bm!31141 (= call!31145 call!31144)))

(declare-fun bm!31142 () Bool)

(declare-fun $colon$colon!124 (List!9286 tuple2!9246) List!9286)

(assert (=> bm!31142 (= call!31143 ($colon$colon!124 e!285265 (ite c!58280 (h!10138 l!956) (tuple2!9247 key!251 value!166))))))

(declare-fun c!58278 () Bool)

(assert (=> bm!31142 (= c!58278 c!58280)))

(declare-fun b!484595 () Bool)

(assert (=> b!484595 (= e!285263 e!285262)))

(assert (=> b!484595 (= c!58277 (and (is-Cons!9282 l!956) (= (_1!4634 (h!10138 l!956)) key!251)))))

(declare-fun b!484596 () Bool)

(assert (=> b!484596 (= e!285263 call!31143)))

(assert (= (and d!77109 c!58280) b!484596))

(assert (= (and d!77109 (not c!58280)) b!484595))

(assert (= (and b!484595 c!58277) b!484587))

(assert (= (and b!484595 (not c!58277)) b!484589))

(assert (= (and b!484589 c!58279) b!484593))

(assert (= (and b!484589 (not c!58279)) b!484590))

(assert (= (or b!484593 b!484590) bm!31141))

(assert (= (or b!484587 bm!31141) bm!31140))

(assert (= (or b!484596 bm!31140) bm!31142))

(assert (= (and bm!31142 c!58278) b!484594))

(assert (= (and bm!31142 (not c!58278)) b!484592))

(assert (= (and d!77109 res!288672) b!484591))

(assert (= (and b!484591 res!288671) b!484588))

(declare-fun m!465071 () Bool)

(assert (=> d!77109 m!465071))

(assert (=> d!77109 m!465043))

(declare-fun m!465073 () Bool)

(assert (=> b!484591 m!465073))

(declare-fun m!465075 () Bool)

(assert (=> b!484594 m!465075))

(declare-fun m!465077 () Bool)

(assert (=> b!484588 m!465077))

(declare-fun m!465079 () Bool)

(assert (=> bm!31142 m!465079))

(assert (=> b!484495 d!77109))

(declare-fun d!77119 () Bool)

(declare-fun lt!219401 () Int)

(assert (=> d!77119 (>= lt!219401 0)))

(declare-fun e!285284 () Int)

(assert (=> d!77119 (= lt!219401 e!285284)))

(declare-fun c!58287 () Bool)

(assert (=> d!77119 (= c!58287 (is-Nil!9283 (t!15508 l!956)))))

(assert (=> d!77119 (= (ListPrimitiveSize!66 (t!15508 l!956)) lt!219401)))

(declare-fun b!484621 () Bool)

(assert (=> b!484621 (= e!285284 0)))

(declare-fun b!484622 () Bool)

(assert (=> b!484622 (= e!285284 (+ 1 (ListPrimitiveSize!66 (t!15508 (t!15508 l!956)))))))

(assert (= (and d!77119 c!58287) b!484621))

(assert (= (and d!77119 (not c!58287)) b!484622))

(declare-fun m!465091 () Bool)

(assert (=> b!484622 m!465091))

(assert (=> b!484491 d!77119))

(declare-fun d!77125 () Bool)

(declare-fun lt!219402 () Int)

(assert (=> d!77125 (>= lt!219402 0)))

(declare-fun e!285287 () Int)

(assert (=> d!77125 (= lt!219402 e!285287)))

(declare-fun c!58288 () Bool)

(assert (=> d!77125 (= c!58288 (is-Nil!9283 l!956))))

(assert (=> d!77125 (= (ListPrimitiveSize!66 l!956) lt!219402)))

(declare-fun b!484625 () Bool)

(assert (=> b!484625 (= e!285287 0)))

(declare-fun b!484626 () Bool)

(assert (=> b!484626 (= e!285287 (+ 1 (ListPrimitiveSize!66 (t!15508 l!956))))))

(assert (= (and d!77125 c!58288) b!484625))

(assert (= (and d!77125 (not c!58288)) b!484626))

(assert (=> b!484626 m!465051))

(assert (=> b!484491 d!77125))

(declare-fun d!77129 () Bool)

(declare-fun res!288697 () Bool)

(declare-fun e!285305 () Bool)

(assert (=> d!77129 (=> res!288697 e!285305)))

(assert (=> d!77129 (= res!288697 (or (is-Nil!9283 (t!15508 l!956)) (is-Nil!9283 (t!15508 (t!15508 l!956)))))))

(assert (=> d!77129 (= (isStrictlySorted!425 (t!15508 l!956)) e!285305)))

(declare-fun b!484650 () Bool)

(declare-fun e!285307 () Bool)

(assert (=> b!484650 (= e!285305 e!285307)))

(declare-fun res!288699 () Bool)

(assert (=> b!484650 (=> (not res!288699) (not e!285307))))

(assert (=> b!484650 (= res!288699 (bvslt (_1!4634 (h!10138 (t!15508 l!956))) (_1!4634 (h!10138 (t!15508 (t!15508 l!956))))))))

(declare-fun b!484652 () Bool)

(assert (=> b!484652 (= e!285307 (isStrictlySorted!425 (t!15508 (t!15508 l!956))))))

(assert (= (and d!77129 (not res!288697)) b!484650))

(assert (= (and b!484650 res!288699) b!484652))

(declare-fun m!465101 () Bool)

(assert (=> b!484652 m!465101))

(assert (=> b!484493 d!77129))

(declare-fun d!77139 () Bool)

(declare-fun res!288705 () Bool)

(declare-fun e!285316 () Bool)

(assert (=> d!77139 (=> res!288705 e!285316)))

(assert (=> d!77139 (= res!288705 (and (is-Cons!9282 (t!15508 l!956)) (= (_1!4634 (h!10138 (t!15508 l!956))) key!251)))))

(assert (=> d!77139 (= (containsKey!388 (t!15508 l!956) key!251) e!285316)))

(declare-fun b!484663 () Bool)

(declare-fun e!285317 () Bool)

(assert (=> b!484663 (= e!285316 e!285317)))

(declare-fun res!288706 () Bool)

(assert (=> b!484663 (=> (not res!288706) (not e!285317))))

(assert (=> b!484663 (= res!288706 (and (or (not (is-Cons!9282 (t!15508 l!956))) (bvsle (_1!4634 (h!10138 (t!15508 l!956))) key!251)) (is-Cons!9282 (t!15508 l!956)) (bvslt (_1!4634 (h!10138 (t!15508 l!956))) key!251)))))

(declare-fun b!484664 () Bool)

(assert (=> b!484664 (= e!285317 (containsKey!388 (t!15508 (t!15508 l!956)) key!251))))

(assert (= (and d!77139 (not res!288705)) b!484663))

(assert (= (and b!484663 res!288706) b!484664))

(declare-fun m!465103 () Bool)

(assert (=> b!484664 m!465103))

(assert (=> b!484492 d!77139))

(declare-fun d!77141 () Bool)

