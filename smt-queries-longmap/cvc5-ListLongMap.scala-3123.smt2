; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43980 () Bool)

(assert start!43980)

(declare-fun b!485246 () Bool)

(declare-fun e!285697 () Bool)

(declare-fun tp_is_empty!13969 () Bool)

(declare-fun tp!43600 () Bool)

(assert (=> b!485246 (= e!285697 (and tp_is_empty!13969 tp!43600))))

(declare-fun b!485244 () Bool)

(declare-fun e!285699 () Bool)

(declare-fun e!285698 () Bool)

(assert (=> b!485244 (= e!285699 e!285698)))

(declare-fun res!288991 () Bool)

(assert (=> b!485244 (=> (not res!288991) (not e!285698))))

(declare-datatypes ((B!1160 0))(
  ( (B!1161 (val!7032 Int)) )
))
(declare-datatypes ((tuple2!9266 0))(
  ( (tuple2!9267 (_1!4644 (_ BitVec 64)) (_2!4644 B!1160)) )
))
(declare-datatypes ((List!9296 0))(
  ( (Nil!9293) (Cons!9292 (h!10148 tuple2!9266) (t!15521 List!9296)) )
))
(declare-fun l!956 () List!9296)

(declare-fun key!251 () (_ BitVec 64))

(assert (=> b!485244 (= res!288991 (and (or (not (is-Cons!9292 l!956)) (bvsge (_1!4644 (h!10148 l!956)) key!251)) (or (not (is-Cons!9292 l!956)) (not (= (_1!4644 (h!10148 l!956)) key!251)))))))

(declare-fun lt!219508 () List!9296)

(declare-fun value!166 () B!1160)

(declare-fun insertStrictlySorted!250 (List!9296 (_ BitVec 64) B!1160) List!9296)

(assert (=> b!485244 (= lt!219508 (insertStrictlySorted!250 l!956 key!251 value!166))))

(declare-fun b!485243 () Bool)

(declare-fun res!288990 () Bool)

(assert (=> b!485243 (=> (not res!288990) (not e!285699))))

(declare-fun containsKey!398 (List!9296 (_ BitVec 64)) Bool)

(assert (=> b!485243 (= res!288990 (not (containsKey!398 l!956 key!251)))))

(declare-fun b!485245 () Bool)

(declare-fun length!14 (List!9296) Int)

(assert (=> b!485245 (= e!285698 (not (= (length!14 lt!219508) (+ 1 (length!14 l!956)))))))

(declare-fun res!288992 () Bool)

(assert (=> start!43980 (=> (not res!288992) (not e!285699))))

(declare-fun isStrictlySorted!435 (List!9296) Bool)

(assert (=> start!43980 (= res!288992 (isStrictlySorted!435 l!956))))

(assert (=> start!43980 e!285699))

(assert (=> start!43980 e!285697))

(assert (=> start!43980 true))

(assert (=> start!43980 tp_is_empty!13969))

(assert (= (and start!43980 res!288992) b!485243))

(assert (= (and b!485243 res!288990) b!485244))

(assert (= (and b!485244 res!288991) b!485245))

(assert (= (and start!43980 (is-Cons!9292 l!956)) b!485246))

(declare-fun m!465465 () Bool)

(assert (=> b!485244 m!465465))

(declare-fun m!465467 () Bool)

(assert (=> b!485243 m!465467))

(declare-fun m!465469 () Bool)

(assert (=> b!485245 m!465469))

(declare-fun m!465471 () Bool)

(assert (=> b!485245 m!465471))

(declare-fun m!465473 () Bool)

(assert (=> start!43980 m!465473))

(push 1)

(assert (not b!485245))

(assert (not start!43980))

(assert tp_is_empty!13969)

(assert (not b!485246))

(assert (not b!485243))

(assert (not b!485244))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!31230 () Bool)

(declare-fun call!31234 () List!9296)

(declare-fun call!31235 () List!9296)

(assert (=> bm!31230 (= call!31234 call!31235)))

(declare-fun b!485323 () Bool)

(declare-fun e!285754 () List!9296)

(assert (=> b!485323 (= e!285754 call!31234)))

(declare-fun c!58426 () Bool)

(declare-fun e!285752 () List!9296)

(declare-fun bm!31231 () Bool)

(declare-fun $colon$colon!131 (List!9296 tuple2!9266) List!9296)

(assert (=> bm!31231 (= call!31235 ($colon$colon!131 e!285752 (ite c!58426 (h!10148 l!956) (tuple2!9267 key!251 value!166))))))

(declare-fun c!58428 () Bool)

(assert (=> bm!31231 (= c!58428 c!58426)))

(declare-fun b!485324 () Bool)

(declare-fun e!285751 () List!9296)

(assert (=> b!485324 (= e!285751 e!285754)))

(declare-fun c!58427 () Bool)

(assert (=> b!485324 (= c!58427 (and (is-Cons!9292 l!956) (= (_1!4644 (h!10148 l!956)) key!251)))))

(declare-fun b!485325 () Bool)

(declare-fun e!285753 () List!9296)

(declare-fun call!31233 () List!9296)

(assert (=> b!485325 (= e!285753 call!31233)))

(declare-fun b!485326 () Bool)

(assert (=> b!485326 (= e!285751 call!31235)))

(declare-fun d!77333 () Bool)

(declare-fun e!285750 () Bool)

(assert (=> d!77333 e!285750))

(declare-fun res!289028 () Bool)

(assert (=> d!77333 (=> (not res!289028) (not e!285750))))

(declare-fun lt!219521 () List!9296)

(assert (=> d!77333 (= res!289028 (isStrictlySorted!435 lt!219521))))

(assert (=> d!77333 (= lt!219521 e!285751)))

(assert (=> d!77333 (= c!58426 (and (is-Cons!9292 l!956) (bvslt (_1!4644 (h!10148 l!956)) key!251)))))

(assert (=> d!77333 (isStrictlySorted!435 l!956)))

(assert (=> d!77333 (= (insertStrictlySorted!250 l!956 key!251 value!166) lt!219521)))

(declare-fun b!485327 () Bool)

(declare-fun contains!2690 (List!9296 tuple2!9266) Bool)

(assert (=> b!485327 (= e!285750 (contains!2690 lt!219521 (tuple2!9267 key!251 value!166)))))

(declare-fun b!485328 () Bool)

(assert (=> b!485328 (= e!285752 (insertStrictlySorted!250 (t!15521 l!956) key!251 value!166))))

(declare-fun b!485329 () Bool)

(declare-fun c!58425 () Bool)

(assert (=> b!485329 (= c!58425 (and (is-Cons!9292 l!956) (bvsgt (_1!4644 (h!10148 l!956)) key!251)))))

(assert (=> b!485329 (= e!285754 e!285753)))

(declare-fun bm!31232 () Bool)

(assert (=> bm!31232 (= call!31233 call!31234)))

(declare-fun b!485330 () Bool)

(declare-fun res!289027 () Bool)

(assert (=> b!485330 (=> (not res!289027) (not e!285750))))

(assert (=> b!485330 (= res!289027 (containsKey!398 lt!219521 key!251))))

(declare-fun b!485331 () Bool)

(assert (=> b!485331 (= e!285753 call!31233)))

(declare-fun b!485332 () Bool)

(assert (=> b!485332 (= e!285752 (ite c!58427 (t!15521 l!956) (ite c!58425 (Cons!9292 (h!10148 l!956) (t!15521 l!956)) Nil!9293)))))

(assert (= (and d!77333 c!58426) b!485326))

(assert (= (and d!77333 (not c!58426)) b!485324))

(assert (= (and b!485324 c!58427) b!485323))

(assert (= (and b!485324 (not c!58427)) b!485329))

(assert (= (and b!485329 c!58425) b!485331))

(assert (= (and b!485329 (not c!58425)) b!485325))

(assert (= (or b!485331 b!485325) bm!31232))

(assert (= (or b!485323 bm!31232) bm!31230))

(assert (= (or b!485326 bm!31230) bm!31231))

(assert (= (and bm!31231 c!58428) b!485328))

(assert (= (and bm!31231 (not c!58428)) b!485332))

(assert (= (and d!77333 res!289028) b!485330))

(assert (= (and b!485330 res!289027) b!485327))

(declare-fun m!465507 () Bool)

(assert (=> b!485327 m!465507))

(declare-fun m!465509 () Bool)

(assert (=> b!485328 m!465509))

(declare-fun m!465511 () Bool)

(assert (=> d!77333 m!465511))

(assert (=> d!77333 m!465473))

(declare-fun m!465513 () Bool)

(assert (=> bm!31231 m!465513))

(declare-fun m!465515 () Bool)

(assert (=> b!485330 m!465515))

(assert (=> b!485244 d!77333))

(declare-fun d!77351 () Bool)

(declare-fun res!289043 () Bool)

(declare-fun e!285774 () Bool)

(assert (=> d!77351 (=> res!289043 e!285774)))

(assert (=> d!77351 (= res!289043 (and (is-Cons!9292 l!956) (= (_1!4644 (h!10148 l!956)) key!251)))))

(assert (=> d!77351 (= (containsKey!398 l!956 key!251) e!285774)))

(declare-fun b!485367 () Bool)

(declare-fun e!285775 () Bool)

(assert (=> b!485367 (= e!285774 e!285775)))

(declare-fun res!289044 () Bool)

(assert (=> b!485367 (=> (not res!289044) (not e!285775))))

(assert (=> b!485367 (= res!289044 (and (or (not (is-Cons!9292 l!956)) (bvsle (_1!4644 (h!10148 l!956)) key!251)) (is-Cons!9292 l!956) (bvslt (_1!4644 (h!10148 l!956)) key!251)))))

(declare-fun b!485368 () Bool)

(assert (=> b!485368 (= e!285775 (containsKey!398 (t!15521 l!956) key!251))))

(assert (= (and d!77351 (not res!289043)) b!485367))

(assert (= (and b!485367 res!289044) b!485368))

(declare-fun m!465517 () Bool)

(assert (=> b!485368 m!465517))

(assert (=> b!485243 d!77351))

(declare-fun d!77353 () Bool)

(declare-fun res!289055 () Bool)

(declare-fun e!285789 () Bool)

(assert (=> d!77353 (=> res!289055 e!285789)))

(assert (=> d!77353 (= res!289055 (or (is-Nil!9293 l!956) (is-Nil!9293 (t!15521 l!956))))))

(assert (=> d!77353 (= (isStrictlySorted!435 l!956) e!285789)))

(declare-fun b!485385 () Bool)

(declare-fun e!285790 () Bool)

(assert (=> b!485385 (= e!285789 e!285790)))

(declare-fun res!289056 () Bool)

(assert (=> b!485385 (=> (not res!289056) (not e!285790))))

(assert (=> b!485385 (= res!289056 (bvslt (_1!4644 (h!10148 l!956)) (_1!4644 (h!10148 (t!15521 l!956)))))))

(declare-fun b!485386 () Bool)

(assert (=> b!485386 (= e!285790 (isStrictlySorted!435 (t!15521 l!956)))))

(assert (= (and d!77353 (not res!289055)) b!485385))

(assert (= (and b!485385 res!289056) b!485386))

(declare-fun m!465539 () Bool)

(assert (=> b!485386 m!465539))

(assert (=> start!43980 d!77353))

(declare-fun d!77359 () Bool)

(declare-fun size!15465 (List!9296) Int)

(assert (=> d!77359 (= (length!14 lt!219508) (size!15465 lt!219508))))

(declare-fun bs!15458 () Bool)

(assert (= bs!15458 d!77359))

(declare-fun m!465541 () Bool)

(assert (=> bs!15458 m!465541))

(assert (=> b!485245 d!77359))

(declare-fun d!77361 () Bool)

(assert (=> d!77361 (= (length!14 l!956) (size!15465 l!956))))

(declare-fun bs!15459 () Bool)

(assert (= bs!15459 d!77361))

(declare-fun m!465543 () Bool)

(assert (=> bs!15459 m!465543))

(assert (=> b!485245 d!77361))

(declare-fun b!485399 () Bool)

(declare-fun e!285797 () Bool)

(declare-fun tp!43611 () Bool)

(assert (=> b!485399 (= e!285797 (and tp_is_empty!13969 tp!43611))))

(assert (=> b!485246 (= tp!43600 e!285797)))

(assert (= (and b!485246 (is-Cons!9292 (t!15521 l!956))) b!485399))

(push 1)

(assert (not d!77359))

(assert (not b!485328))

(assert (not b!485330))

(assert (not bm!31231))

(assert tp_is_empty!13969)

(assert (not b!485399))

(assert (not b!485327))

(assert (not d!77361))

(assert (not d!77333))

(assert (not b!485368))

(assert (not b!485386))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77363 () Bool)

(declare-fun res!289065 () Bool)

(declare-fun e!285808 () Bool)

(assert (=> d!77363 (=> res!289065 e!285808)))

(assert (=> d!77363 (= res!289065 (and (is-Cons!9292 lt!219521) (= (_1!4644 (h!10148 lt!219521)) key!251)))))

(assert (=> d!77363 (= (containsKey!398 lt!219521 key!251) e!285808)))

(declare-fun b!485412 () Bool)

(declare-fun e!285809 () Bool)

(assert (=> b!485412 (= e!285808 e!285809)))

(declare-fun res!289066 () Bool)

(assert (=> b!485412 (=> (not res!289066) (not e!285809))))

(assert (=> b!485412 (= res!289066 (and (or (not (is-Cons!9292 lt!219521)) (bvsle (_1!4644 (h!10148 lt!219521)) key!251)) (is-Cons!9292 lt!219521) (bvslt (_1!4644 (h!10148 lt!219521)) key!251)))))

(declare-fun b!485413 () Bool)

(assert (=> b!485413 (= e!285809 (containsKey!398 (t!15521 lt!219521) key!251))))

(assert (= (and d!77363 (not res!289065)) b!485412))

(assert (= (and b!485412 res!289066) b!485413))

(declare-fun m!465549 () Bool)

(assert (=> b!485413 m!465549))

(assert (=> b!485330 d!77363))

(declare-fun d!77365 () Bool)

(declare-fun lt!219526 () Int)

(assert (=> d!77365 (>= lt!219526 0)))

(declare-fun e!285812 () Int)

(assert (=> d!77365 (= lt!219526 e!285812)))

(declare-fun c!58445 () Bool)

(assert (=> d!77365 (= c!58445 (is-Nil!9293 lt!219508))))

(assert (=> d!77365 (= (size!15465 lt!219508) lt!219526)))

(declare-fun b!485418 () Bool)

(assert (=> b!485418 (= e!285812 0)))

(declare-fun b!485419 () Bool)

(assert (=> b!485419 (= e!285812 (+ 1 (size!15465 (t!15521 lt!219508))))))

(assert (= (and d!77365 c!58445) b!485418))

(assert (= (and d!77365 (not c!58445)) b!485419))

(declare-fun m!465551 () Bool)

(assert (=> b!485419 m!465551))

(assert (=> d!77359 d!77365))

(declare-fun d!77367 () Bool)

(declare-fun res!289067 () Bool)

(declare-fun e!285813 () Bool)

(assert (=> d!77367 (=> res!289067 e!285813)))

(assert (=> d!77367 (= res!289067 (and (is-Cons!9292 (t!15521 l!956)) (= (_1!4644 (h!10148 (t!15521 l!956))) key!251)))))

(assert (=> d!77367 (= (containsKey!398 (t!15521 l!956) key!251) e!285813)))

(declare-fun b!485420 () Bool)

(declare-fun e!285814 () Bool)

(assert (=> b!485420 (= e!285813 e!285814)))

(declare-fun res!289068 () Bool)

(assert (=> b!485420 (=> (not res!289068) (not e!285814))))

(assert (=> b!485420 (= res!289068 (and (or (not (is-Cons!9292 (t!15521 l!956))) (bvsle (_1!4644 (h!10148 (t!15521 l!956))) key!251)) (is-Cons!9292 (t!15521 l!956)) (bvslt (_1!4644 (h!10148 (t!15521 l!956))) key!251)))))

(declare-fun b!485421 () Bool)

(assert (=> b!485421 (= e!285814 (containsKey!398 (t!15521 (t!15521 l!956)) key!251))))

(assert (= (and d!77367 (not res!289067)) b!485420))

(assert (= (and b!485420 res!289068) b!485421))

(declare-fun m!465553 () Bool)

(assert (=> b!485421 m!465553))

(assert (=> b!485368 d!77367))

(declare-fun d!77369 () Bool)

(assert (=> d!77369 (= ($colon$colon!131 e!285752 (ite c!58426 (h!10148 l!956) (tuple2!9267 key!251 value!166))) (Cons!9292 (ite c!58426 (h!10148 l!956) (tuple2!9267 key!251 value!166)) e!285752))))

(assert (=> bm!31231 d!77369))

(declare-fun bm!31245 () Bool)

(declare-fun call!31249 () List!9296)

(declare-fun call!31250 () List!9296)

(assert (=> bm!31245 (= call!31249 call!31250)))

(declare-fun b!485422 () Bool)

(declare-fun e!285819 () List!9296)

(assert (=> b!485422 (= e!285819 call!31249)))

(declare-fun c!58447 () Bool)

(declare-fun e!285817 () List!9296)

(declare-fun bm!31246 () Bool)

(assert (=> bm!31246 (= call!31250 ($colon$colon!131 e!285817 (ite c!58447 (h!10148 (t!15521 l!956)) (tuple2!9267 key!251 value!166))))))

(declare-fun c!58449 () Bool)

(assert (=> bm!31246 (= c!58449 c!58447)))

(declare-fun b!485423 () Bool)

(declare-fun e!285816 () List!9296)

(assert (=> b!485423 (= e!285816 e!285819)))

(declare-fun c!58448 () Bool)

(assert (=> b!485423 (= c!58448 (and (is-Cons!9292 (t!15521 l!956)) (= (_1!4644 (h!10148 (t!15521 l!956))) key!251)))))

(declare-fun b!485424 () Bool)

(declare-fun e!285818 () List!9296)

(declare-fun call!31248 () List!9296)

(assert (=> b!485424 (= e!285818 call!31248)))

(declare-fun b!485425 () Bool)

(assert (=> b!485425 (= e!285816 call!31250)))

(declare-fun d!77371 () Bool)

(declare-fun e!285815 () Bool)

(assert (=> d!77371 e!285815))

(declare-fun res!289070 () Bool)

(assert (=> d!77371 (=> (not res!289070) (not e!285815))))

(declare-fun lt!219527 () List!9296)

(assert (=> d!77371 (= res!289070 (isStrictlySorted!435 lt!219527))))

(assert (=> d!77371 (= lt!219527 e!285816)))

(assert (=> d!77371 (= c!58447 (and (is-Cons!9292 (t!15521 l!956)) (bvslt (_1!4644 (h!10148 (t!15521 l!956))) key!251)))))

(assert (=> d!77371 (isStrictlySorted!435 (t!15521 l!956))))

(assert (=> d!77371 (= (insertStrictlySorted!250 (t!15521 l!956) key!251 value!166) lt!219527)))

(declare-fun b!485426 () Bool)

(assert (=> b!485426 (= e!285815 (contains!2690 lt!219527 (tuple2!9267 key!251 value!166)))))

(declare-fun b!485427 () Bool)

(assert (=> b!485427 (= e!285817 (insertStrictlySorted!250 (t!15521 (t!15521 l!956)) key!251 value!166))))

(declare-fun b!485428 () Bool)

(declare-fun c!58446 () Bool)

(assert (=> b!485428 (= c!58446 (and (is-Cons!9292 (t!15521 l!956)) (bvsgt (_1!4644 (h!10148 (t!15521 l!956))) key!251)))))

(assert (=> b!485428 (= e!285819 e!285818)))

(declare-fun bm!31247 () Bool)

(assert (=> bm!31247 (= call!31248 call!31249)))

(declare-fun b!485429 () Bool)

(declare-fun res!289069 () Bool)

(assert (=> b!485429 (=> (not res!289069) (not e!285815))))

(assert (=> b!485429 (= res!289069 (containsKey!398 lt!219527 key!251))))

(declare-fun b!485430 () Bool)

(assert (=> b!485430 (= e!285818 call!31248)))

(declare-fun b!485431 () Bool)

(assert (=> b!485431 (= e!285817 (ite c!58448 (t!15521 (t!15521 l!956)) (ite c!58446 (Cons!9292 (h!10148 (t!15521 l!956)) (t!15521 (t!15521 l!956))) Nil!9293)))))

(assert (= (and d!77371 c!58447) b!485425))

(assert (= (and d!77371 (not c!58447)) b!485423))

(assert (= (and b!485423 c!58448) b!485422))

(assert (= (and b!485423 (not c!58448)) b!485428))

(assert (= (and b!485428 c!58446) b!485430))

(assert (= (and b!485428 (not c!58446)) b!485424))

(assert (= (or b!485430 b!485424) bm!31247))

(assert (= (or b!485422 bm!31247) bm!31245))

(assert (= (or b!485425 bm!31245) bm!31246))

(assert (= (and bm!31246 c!58449) b!485427))

(assert (= (and bm!31246 (not c!58449)) b!485431))

(assert (= (and d!77371 res!289070) b!485429))

(assert (= (and b!485429 res!289069) b!485426))

(declare-fun m!465555 () Bool)

(assert (=> b!485426 m!465555))

(declare-fun m!465557 () Bool)

(assert (=> b!485427 m!465557))

(declare-fun m!465559 () Bool)

(assert (=> d!77371 m!465559))

(assert (=> d!77371 m!465539))

(declare-fun m!465561 () Bool)

(assert (=> bm!31246 m!465561))

(declare-fun m!465563 () Bool)

(assert (=> b!485429 m!465563))

(assert (=> b!485328 d!77371))

(declare-fun d!77373 () Bool)

(declare-fun res!289071 () Bool)

(declare-fun e!285820 () Bool)

(assert (=> d!77373 (=> res!289071 e!285820)))

(assert (=> d!77373 (= res!289071 (or (is-Nil!9293 (t!15521 l!956)) (is-Nil!9293 (t!15521 (t!15521 l!956)))))))

(assert (=> d!77373 (= (isStrictlySorted!435 (t!15521 l!956)) e!285820)))

(declare-fun b!485432 () Bool)

(declare-fun e!285821 () Bool)

(assert (=> b!485432 (= e!285820 e!285821)))

(declare-fun res!289072 () Bool)

(assert (=> b!485432 (=> (not res!289072) (not e!285821))))

(assert (=> b!485432 (= res!289072 (bvslt (_1!4644 (h!10148 (t!15521 l!956))) (_1!4644 (h!10148 (t!15521 (t!15521 l!956))))))))

(declare-fun b!485433 () Bool)

(assert (=> b!485433 (= e!285821 (isStrictlySorted!435 (t!15521 (t!15521 l!956))))))

(assert (= (and d!77373 (not res!289071)) b!485432))

(assert (= (and b!485432 res!289072) b!485433))

(declare-fun m!465565 () Bool)

(assert (=> b!485433 m!465565))

(assert (=> b!485386 d!77373))

(declare-fun d!77375 () Bool)

(declare-fun res!289073 () Bool)

(declare-fun e!285822 () Bool)

(assert (=> d!77375 (=> res!289073 e!285822)))

(assert (=> d!77375 (= res!289073 (or (is-Nil!9293 lt!219521) (is-Nil!9293 (t!15521 lt!219521))))))

(assert (=> d!77375 (= (isStrictlySorted!435 lt!219521) e!285822)))

(declare-fun b!485434 () Bool)

(declare-fun e!285823 () Bool)

(assert (=> b!485434 (= e!285822 e!285823)))

(declare-fun res!289074 () Bool)

(assert (=> b!485434 (=> (not res!289074) (not e!285823))))

(assert (=> b!485434 (= res!289074 (bvslt (_1!4644 (h!10148 lt!219521)) (_1!4644 (h!10148 (t!15521 lt!219521)))))))

(declare-fun b!485435 () Bool)

(assert (=> b!485435 (= e!285823 (isStrictlySorted!435 (t!15521 lt!219521)))))

(assert (= (and d!77375 (not res!289073)) b!485434))

(assert (= (and b!485434 res!289074) b!485435))

(declare-fun m!465567 () Bool)

(assert (=> b!485435 m!465567))

(assert (=> d!77333 d!77375))

(assert (=> d!77333 d!77353))

(declare-fun d!77377 () Bool)

(declare-fun lt!219530 () Bool)

(declare-fun content!216 (List!9296) (Set tuple2!9266))

(assert (=> d!77377 (= lt!219530 (set.member (tuple2!9267 key!251 value!166) (content!216 lt!219521)))))

(declare-fun e!285829 () Bool)

(assert (=> d!77377 (= lt!219530 e!285829)))

(declare-fun res!289080 () Bool)

(assert (=> d!77377 (=> (not res!289080) (not e!285829))))

(assert (=> d!77377 (= res!289080 (is-Cons!9292 lt!219521))))

(assert (=> d!77377 (= (contains!2690 lt!219521 (tuple2!9267 key!251 value!166)) lt!219530)))

(declare-fun b!485440 () Bool)

(declare-fun e!285828 () Bool)

(assert (=> b!485440 (= e!285829 e!285828)))

(declare-fun res!289079 () Bool)

(assert (=> b!485440 (=> res!289079 e!285828)))

(assert (=> b!485440 (= res!289079 (= (h!10148 lt!219521) (tuple2!9267 key!251 value!166)))))

(declare-fun b!485441 () Bool)

(assert (=> b!485441 (= e!285828 (contains!2690 (t!15521 lt!219521) (tuple2!9267 key!251 value!166)))))

(assert (= (and d!77377 res!289080) b!485440))

(assert (= (and b!485440 (not res!289079)) b!485441))

(declare-fun m!465569 () Bool)

(assert (=> d!77377 m!465569))

(declare-fun m!465571 () Bool)

(assert (=> d!77377 m!465571))

(declare-fun m!465573 () Bool)

(assert (=> b!485441 m!465573))

(assert (=> b!485327 d!77377))

(declare-fun d!77379 () Bool)

(declare-fun lt!219531 () Int)

(assert (=> d!77379 (>= lt!219531 0)))

(declare-fun e!285830 () Int)

(assert (=> d!77379 (= lt!219531 e!285830)))

(declare-fun c!58450 () Bool)

(assert (=> d!77379 (= c!58450 (is-Nil!9293 l!956))))

(assert (=> d!77379 (= (size!15465 l!956) lt!219531)))

(declare-fun b!485442 () Bool)

(assert (=> b!485442 (= e!285830 0)))

(declare-fun b!485443 () Bool)

(assert (=> b!485443 (= e!285830 (+ 1 (size!15465 (t!15521 l!956))))))

(assert (= (and d!77379 c!58450) b!485442))

(assert (= (and d!77379 (not c!58450)) b!485443))

(declare-fun m!465575 () Bool)

(assert (=> b!485443 m!465575))

(assert (=> d!77361 d!77379))

(declare-fun b!485444 () Bool)

(declare-fun e!285831 () Bool)

(declare-fun tp!43616 () Bool)

(assert (=> b!485444 (= e!285831 (and tp_is_empty!13969 tp!43616))))

(assert (=> b!485399 (= tp!43611 e!285831)))

(assert (= (and b!485399 (is-Cons!9292 (t!15521 (t!15521 l!956)))) b!485444))

(push 1)

(assert (not b!485433))

(assert (not b!485419))

(assert (not b!485426))

(assert (not b!485444))

(assert (not b!485441))

(assert (not b!485427))

(assert (not b!485421))

(assert (not d!77377))

(assert (not b!485429))

(assert (not b!485443))

(assert (not d!77371))

(assert tp_is_empty!13969)

(assert (not b!485413))

(assert (not bm!31246))

(assert (not b!485435))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

