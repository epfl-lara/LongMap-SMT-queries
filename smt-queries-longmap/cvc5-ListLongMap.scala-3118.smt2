; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43836 () Bool)

(assert start!43836)

(declare-fun b!484255 () Bool)

(declare-fun res!288507 () Bool)

(declare-fun e!285061 () Bool)

(assert (=> b!484255 (=> (not res!288507) (not e!285061))))

(declare-datatypes ((B!1130 0))(
  ( (B!1131 (val!7017 Int)) )
))
(declare-datatypes ((tuple2!9236 0))(
  ( (tuple2!9237 (_1!4629 (_ BitVec 64)) (_2!4629 B!1130)) )
))
(declare-datatypes ((List!9281 0))(
  ( (Nil!9278) (Cons!9277 (h!10133 tuple2!9236) (t!15503 List!9281)) )
))
(declare-fun l!956 () List!9281)

(declare-fun isStrictlySorted!420 (List!9281) Bool)

(assert (=> b!484255 (= res!288507 (isStrictlySorted!420 (t!15503 l!956)))))

(declare-fun b!484256 () Bool)

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!383 (List!9281 (_ BitVec 64)) Bool)

(assert (=> b!484256 (= e!285061 (containsKey!383 (t!15503 l!956) key!251))))

(declare-fun b!484257 () Bool)

(declare-fun e!285063 () Bool)

(assert (=> b!484257 (= e!285063 e!285061)))

(declare-fun res!288508 () Bool)

(assert (=> b!484257 (=> (not res!288508) (not e!285061))))

(assert (=> b!484257 (= res!288508 (and (is-Cons!9277 l!956) (bvslt (_1!4629 (h!10133 l!956)) key!251)))))

(declare-fun value!166 () B!1130)

(declare-fun lt!219361 () List!9281)

(declare-fun insertStrictlySorted!235 (List!9281 (_ BitVec 64) B!1130) List!9281)

(assert (=> b!484257 (= lt!219361 (insertStrictlySorted!235 l!956 key!251 value!166))))

(declare-fun b!484258 () Bool)

(declare-fun res!288509 () Bool)

(assert (=> b!484258 (=> (not res!288509) (not e!285063))))

(assert (=> b!484258 (= res!288509 (not (containsKey!383 l!956 key!251)))))

(declare-fun b!484259 () Bool)

(declare-fun e!285062 () Bool)

(declare-fun tp_is_empty!13939 () Bool)

(declare-fun tp!43516 () Bool)

(assert (=> b!484259 (= e!285062 (and tp_is_empty!13939 tp!43516))))

(declare-fun res!288506 () Bool)

(assert (=> start!43836 (=> (not res!288506) (not e!285063))))

(assert (=> start!43836 (= res!288506 (isStrictlySorted!420 l!956))))

(assert (=> start!43836 e!285063))

(assert (=> start!43836 e!285062))

(assert (=> start!43836 true))

(assert (=> start!43836 tp_is_empty!13939))

(assert (= (and start!43836 res!288506) b!484258))

(assert (= (and b!484258 res!288509) b!484257))

(assert (= (and b!484257 res!288508) b!484255))

(assert (= (and b!484255 res!288507) b!484256))

(assert (= (and start!43836 (is-Cons!9277 l!956)) b!484259))

(declare-fun m!464943 () Bool)

(assert (=> b!484255 m!464943))

(declare-fun m!464945 () Bool)

(assert (=> start!43836 m!464945))

(declare-fun m!464947 () Bool)

(assert (=> b!484256 m!464947))

(declare-fun m!464949 () Bool)

(assert (=> b!484257 m!464949))

(declare-fun m!464951 () Bool)

(assert (=> b!484258 m!464951))

(push 1)

(assert (not b!484256))

(assert (not b!484257))

(assert (not start!43836))

(assert (not b!484258))

(assert (not b!484259))

(assert (not b!484255))

(assert tp_is_empty!13939)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77073 () Bool)

(declare-fun res!288544 () Bool)

(declare-fun e!285092 () Bool)

(assert (=> d!77073 (=> res!288544 e!285092)))

(assert (=> d!77073 (= res!288544 (or (is-Nil!9278 l!956) (is-Nil!9278 (t!15503 l!956))))))

(assert (=> d!77073 (= (isStrictlySorted!420 l!956) e!285092)))

(declare-fun b!484300 () Bool)

(declare-fun e!285093 () Bool)

(assert (=> b!484300 (= e!285092 e!285093)))

(declare-fun res!288545 () Bool)

(assert (=> b!484300 (=> (not res!288545) (not e!285093))))

(assert (=> b!484300 (= res!288545 (bvslt (_1!4629 (h!10133 l!956)) (_1!4629 (h!10133 (t!15503 l!956)))))))

(declare-fun b!484301 () Bool)

(assert (=> b!484301 (= e!285093 (isStrictlySorted!420 (t!15503 l!956)))))

(assert (= (and d!77073 (not res!288544)) b!484300))

(assert (= (and b!484300 res!288545) b!484301))

(assert (=> b!484301 m!464943))

(assert (=> start!43836 d!77073))

(declare-fun d!77079 () Bool)

(declare-fun res!288562 () Bool)

(declare-fun e!285110 () Bool)

(assert (=> d!77079 (=> res!288562 e!285110)))

(assert (=> d!77079 (= res!288562 (and (is-Cons!9277 l!956) (= (_1!4629 (h!10133 l!956)) key!251)))))

(assert (=> d!77079 (= (containsKey!383 l!956 key!251) e!285110)))

(declare-fun b!484318 () Bool)

(declare-fun e!285111 () Bool)

(assert (=> b!484318 (= e!285110 e!285111)))

(declare-fun res!288563 () Bool)

(assert (=> b!484318 (=> (not res!288563) (not e!285111))))

(assert (=> b!484318 (= res!288563 (and (or (not (is-Cons!9277 l!956)) (bvsle (_1!4629 (h!10133 l!956)) key!251)) (is-Cons!9277 l!956) (bvslt (_1!4629 (h!10133 l!956)) key!251)))))

(declare-fun b!484319 () Bool)

(assert (=> b!484319 (= e!285111 (containsKey!383 (t!15503 l!956) key!251))))

(assert (= (and d!77079 (not res!288562)) b!484318))

(assert (= (and b!484318 res!288563) b!484319))

(assert (=> b!484319 m!464947))

(assert (=> b!484258 d!77079))

(declare-fun d!77085 () Bool)

(declare-fun res!288566 () Bool)

(declare-fun e!285114 () Bool)

(assert (=> d!77085 (=> res!288566 e!285114)))

(assert (=> d!77085 (= res!288566 (and (is-Cons!9277 (t!15503 l!956)) (= (_1!4629 (h!10133 (t!15503 l!956))) key!251)))))

(assert (=> d!77085 (= (containsKey!383 (t!15503 l!956) key!251) e!285114)))

(declare-fun b!484322 () Bool)

(declare-fun e!285115 () Bool)

(assert (=> b!484322 (= e!285114 e!285115)))

(declare-fun res!288567 () Bool)

(assert (=> b!484322 (=> (not res!288567) (not e!285115))))

(assert (=> b!484322 (= res!288567 (and (or (not (is-Cons!9277 (t!15503 l!956))) (bvsle (_1!4629 (h!10133 (t!15503 l!956))) key!251)) (is-Cons!9277 (t!15503 l!956)) (bvslt (_1!4629 (h!10133 (t!15503 l!956))) key!251)))))

(declare-fun b!484323 () Bool)

(assert (=> b!484323 (= e!285115 (containsKey!383 (t!15503 (t!15503 l!956)) key!251))))

(assert (= (and d!77085 (not res!288566)) b!484322))

(assert (= (and b!484322 res!288567) b!484323))

(declare-fun m!464977 () Bool)

(assert (=> b!484323 m!464977))

(assert (=> b!484256 d!77085))

(declare-fun d!77089 () Bool)

(declare-fun e!285161 () Bool)

(assert (=> d!77089 e!285161))

(declare-fun res!288589 () Bool)

(assert (=> d!77089 (=> (not res!288589) (not e!285161))))

(declare-fun lt!219375 () List!9281)

(assert (=> d!77089 (= res!288589 (isStrictlySorted!420 lt!219375))))

(declare-fun e!285160 () List!9281)

(assert (=> d!77089 (= lt!219375 e!285160)))

(declare-fun c!58240 () Bool)

(assert (=> d!77089 (= c!58240 (and (is-Cons!9277 l!956) (bvslt (_1!4629 (h!10133 l!956)) key!251)))))

(assert (=> d!77089 (isStrictlySorted!420 l!956)))

(assert (=> d!77089 (= (insertStrictlySorted!235 l!956 key!251 value!166) lt!219375)))

(declare-fun bm!31113 () Bool)

(declare-fun e!285157 () List!9281)

(declare-fun call!31117 () List!9281)

(declare-fun $colon$colon!119 (List!9281 tuple2!9236) List!9281)

(assert (=> bm!31113 (= call!31117 ($colon$colon!119 e!285157 (ite c!58240 (h!10133 l!956) (tuple2!9237 key!251 value!166))))))

(declare-fun c!58239 () Bool)

(assert (=> bm!31113 (= c!58239 c!58240)))

(declare-fun b!484400 () Bool)

(declare-fun res!288588 () Bool)

(assert (=> b!484400 (=> (not res!288588) (not e!285161))))

(assert (=> b!484400 (= res!288588 (containsKey!383 lt!219375 key!251))))

(declare-fun b!484401 () Bool)

(declare-fun e!285159 () List!9281)

(declare-fun call!31116 () List!9281)

(assert (=> b!484401 (= e!285159 call!31116)))

(declare-fun b!484402 () Bool)

(declare-fun e!285158 () List!9281)

(assert (=> b!484402 (= e!285160 e!285158)))

(declare-fun c!58237 () Bool)

(assert (=> b!484402 (= c!58237 (and (is-Cons!9277 l!956) (= (_1!4629 (h!10133 l!956)) key!251)))))

(declare-fun bm!31114 () Bool)

(declare-fun call!31118 () List!9281)

(assert (=> bm!31114 (= call!31116 call!31118)))

(declare-fun b!484403 () Bool)

(assert (=> b!484403 (= e!285160 call!31117)))

(declare-fun bm!31115 () Bool)

(assert (=> bm!31115 (= call!31118 call!31117)))

(declare-fun b!484404 () Bool)

(declare-fun c!58238 () Bool)

(assert (=> b!484404 (= c!58238 (and (is-Cons!9277 l!956) (bvsgt (_1!4629 (h!10133 l!956)) key!251)))))

(assert (=> b!484404 (= e!285158 e!285159)))

(declare-fun b!484405 () Bool)

(assert (=> b!484405 (= e!285158 call!31118)))

(declare-fun b!484406 () Bool)

(assert (=> b!484406 (= e!285157 (insertStrictlySorted!235 (t!15503 l!956) key!251 value!166))))

(declare-fun b!484407 () Bool)

(assert (=> b!484407 (= e!285159 call!31116)))

(declare-fun b!484408 () Bool)

(declare-fun contains!2679 (List!9281 tuple2!9236) Bool)

(assert (=> b!484408 (= e!285161 (contains!2679 lt!219375 (tuple2!9237 key!251 value!166)))))

(declare-fun b!484409 () Bool)

(assert (=> b!484409 (= e!285157 (ite c!58237 (t!15503 l!956) (ite c!58238 (Cons!9277 (h!10133 l!956) (t!15503 l!956)) Nil!9278)))))

(assert (= (and d!77089 c!58240) b!484403))

(assert (= (and d!77089 (not c!58240)) b!484402))

(assert (= (and b!484402 c!58237) b!484405))

(assert (= (and b!484402 (not c!58237)) b!484404))

(assert (= (and b!484404 c!58238) b!484401))

(assert (= (and b!484404 (not c!58238)) b!484407))

(assert (= (or b!484401 b!484407) bm!31114))

(assert (= (or b!484405 bm!31114) bm!31115))

(assert (= (or b!484403 bm!31115) bm!31113))

(assert (= (and bm!31113 c!58239) b!484406))

(assert (= (and bm!31113 (not c!58239)) b!484409))

(assert (= (and d!77089 res!288589) b!484400))

(assert (= (and b!484400 res!288588) b!484408))

(declare-fun m!464993 () Bool)

(assert (=> b!484406 m!464993))

(declare-fun m!464995 () Bool)

(assert (=> d!77089 m!464995))

(assert (=> d!77089 m!464945))

(declare-fun m!464997 () Bool)

(assert (=> bm!31113 m!464997))

(declare-fun m!464999 () Bool)

(assert (=> b!484400 m!464999))

(declare-fun m!465001 () Bool)

(assert (=> b!484408 m!465001))

(assert (=> b!484257 d!77089))

(declare-fun d!77095 () Bool)

(declare-fun res!288592 () Bool)

(declare-fun e!285167 () Bool)

(assert (=> d!77095 (=> res!288592 e!285167)))

(assert (=> d!77095 (= res!288592 (or (is-Nil!9278 (t!15503 l!956)) (is-Nil!9278 (t!15503 (t!15503 l!956)))))))

(assert (=> d!77095 (= (isStrictlySorted!420 (t!15503 l!956)) e!285167)))

(declare-fun b!484417 () Bool)

(declare-fun e!285168 () Bool)

(assert (=> b!484417 (= e!285167 e!285168)))

(declare-fun res!288593 () Bool)

(assert (=> b!484417 (=> (not res!288593) (not e!285168))))

(assert (=> b!484417 (= res!288593 (bvslt (_1!4629 (h!10133 (t!15503 l!956))) (_1!4629 (h!10133 (t!15503 (t!15503 l!956))))))))

(declare-fun b!484418 () Bool)

(assert (=> b!484418 (= e!285168 (isStrictlySorted!420 (t!15503 (t!15503 l!956))))))

(assert (= (and d!77095 (not res!288592)) b!484417))

(assert (= (and b!484417 res!288593) b!484418))

(declare-fun m!465003 () Bool)

(assert (=> b!484418 m!465003))

(assert (=> b!484255 d!77095))

(declare-fun b!484423 () Bool)

(declare-fun e!285171 () Bool)

(declare-fun tp!43528 () Bool)

(assert (=> b!484423 (= e!285171 (and tp_is_empty!13939 tp!43528))))

(assert (=> b!484259 (= tp!43516 e!285171)))

(assert (= (and b!484259 (is-Cons!9277 (t!15503 l!956))) b!484423))

(push 1)

(assert (not d!77089))

(assert (not b!484406))

(assert (not b!484323))

(assert (not b!484301))

(assert (not b!484423))

(assert (not b!484418))

(assert (not bm!31113))

(assert (not b!484408))

(assert (not b!484319))

(assert tp_is_empty!13939)

(assert (not b!484400))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

