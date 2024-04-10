; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43984 () Bool)

(assert start!43984)

(declare-fun b!485267 () Bool)

(declare-fun res!289008 () Bool)

(declare-fun e!285716 () Bool)

(assert (=> b!485267 (=> (not res!289008) (not e!285716))))

(declare-datatypes ((B!1164 0))(
  ( (B!1165 (val!7034 Int)) )
))
(declare-datatypes ((tuple2!9270 0))(
  ( (tuple2!9271 (_1!4646 (_ BitVec 64)) (_2!4646 B!1164)) )
))
(declare-datatypes ((List!9298 0))(
  ( (Nil!9295) (Cons!9294 (h!10150 tuple2!9270) (t!15523 List!9298)) )
))
(declare-fun l!956 () List!9298)

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!400 (List!9298 (_ BitVec 64)) Bool)

(assert (=> b!485267 (= res!289008 (not (containsKey!400 l!956 key!251)))))

(declare-fun b!485270 () Bool)

(declare-fun e!285717 () Bool)

(declare-fun tp_is_empty!13973 () Bool)

(declare-fun tp!43606 () Bool)

(assert (=> b!485270 (= e!285717 (and tp_is_empty!13973 tp!43606))))

(declare-fun b!485268 () Bool)

(declare-fun e!285715 () Bool)

(assert (=> b!485268 (= e!285716 e!285715)))

(declare-fun res!289010 () Bool)

(assert (=> b!485268 (=> (not res!289010) (not e!285715))))

(assert (=> b!485268 (= res!289010 (and (or (not (is-Cons!9294 l!956)) (bvsge (_1!4646 (h!10150 l!956)) key!251)) (or (not (is-Cons!9294 l!956)) (not (= (_1!4646 (h!10150 l!956)) key!251)))))))

(declare-fun value!166 () B!1164)

(declare-fun lt!219514 () List!9298)

(declare-fun insertStrictlySorted!252 (List!9298 (_ BitVec 64) B!1164) List!9298)

(assert (=> b!485268 (= lt!219514 (insertStrictlySorted!252 l!956 key!251 value!166))))

(declare-fun res!289009 () Bool)

(assert (=> start!43984 (=> (not res!289009) (not e!285716))))

(declare-fun isStrictlySorted!437 (List!9298) Bool)

(assert (=> start!43984 (= res!289009 (isStrictlySorted!437 l!956))))

(assert (=> start!43984 e!285716))

(assert (=> start!43984 e!285717))

(assert (=> start!43984 true))

(assert (=> start!43984 tp_is_empty!13973))

(declare-fun b!485269 () Bool)

(declare-fun length!16 (List!9298) Int)

(assert (=> b!485269 (= e!285715 (not (= (length!16 lt!219514) (+ 1 (length!16 l!956)))))))

(assert (= (and start!43984 res!289009) b!485267))

(assert (= (and b!485267 res!289008) b!485268))

(assert (= (and b!485268 res!289010) b!485269))

(assert (= (and start!43984 (is-Cons!9294 l!956)) b!485270))

(declare-fun m!465485 () Bool)

(assert (=> b!485267 m!465485))

(declare-fun m!465487 () Bool)

(assert (=> b!485268 m!465487))

(declare-fun m!465489 () Bool)

(assert (=> start!43984 m!465489))

(declare-fun m!465491 () Bool)

(assert (=> b!485269 m!465491))

(declare-fun m!465493 () Bool)

(assert (=> b!485269 m!465493))

(push 1)

(assert (not b!485270))

(assert (not b!485267))

(assert (not start!43984))

(assert (not b!485268))

(assert tp_is_empty!13973)

(assert (not b!485269))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77337 () Bool)

(declare-fun res!289021 () Bool)

(declare-fun e!285728 () Bool)

(assert (=> d!77337 (=> res!289021 e!285728)))

(assert (=> d!77337 (= res!289021 (or (is-Nil!9295 l!956) (is-Nil!9295 (t!15523 l!956))))))

(assert (=> d!77337 (= (isStrictlySorted!437 l!956) e!285728)))

(declare-fun b!485281 () Bool)

(declare-fun e!285729 () Bool)

(assert (=> b!485281 (= e!285728 e!285729)))

(declare-fun res!289022 () Bool)

(assert (=> b!485281 (=> (not res!289022) (not e!285729))))

(assert (=> b!485281 (= res!289022 (bvslt (_1!4646 (h!10150 l!956)) (_1!4646 (h!10150 (t!15523 l!956)))))))

(declare-fun b!485282 () Bool)

(assert (=> b!485282 (= e!285729 (isStrictlySorted!437 (t!15523 l!956)))))

(assert (= (and d!77337 (not res!289021)) b!485281))

(assert (= (and b!485281 res!289022) b!485282))

(declare-fun m!465501 () Bool)

(assert (=> b!485282 m!465501))

(assert (=> start!43984 d!77337))

(declare-fun d!77345 () Bool)

(declare-fun size!15464 (List!9298) Int)

(assert (=> d!77345 (= (length!16 lt!219514) (size!15464 lt!219514))))

(declare-fun bs!15456 () Bool)

(assert (= bs!15456 d!77345))

(declare-fun m!465503 () Bool)

(assert (=> bs!15456 m!465503))

(assert (=> b!485269 d!77345))

(declare-fun d!77347 () Bool)

(assert (=> d!77347 (= (length!16 l!956) (size!15464 l!956))))

(declare-fun bs!15457 () Bool)

(assert (= bs!15457 d!77347))

(declare-fun m!465505 () Bool)

(assert (=> bs!15457 m!465505))

(assert (=> b!485269 d!77347))

(declare-fun d!77349 () Bool)

(declare-fun e!285784 () Bool)

(assert (=> d!77349 e!285784))

(declare-fun res!289049 () Bool)

(assert (=> d!77349 (=> (not res!289049) (not e!285784))))

(declare-fun lt!219523 () List!9298)

(assert (=> d!77349 (= res!289049 (isStrictlySorted!437 lt!219523))))

(declare-fun e!285780 () List!9298)

(assert (=> d!77349 (= lt!219523 e!285780)))

(declare-fun c!58440 () Bool)

(assert (=> d!77349 (= c!58440 (and (is-Cons!9294 l!956) (bvslt (_1!4646 (h!10150 l!956)) key!251)))))

(assert (=> d!77349 (isStrictlySorted!437 l!956)))

(assert (=> d!77349 (= (insertStrictlySorted!252 l!956 key!251 value!166) lt!219523)))

(declare-fun b!485373 () Bool)

(declare-fun c!58442 () Bool)

(assert (=> b!485373 (= c!58442 (and (is-Cons!9294 l!956) (bvsgt (_1!4646 (h!10150 l!956)) key!251)))))

(declare-fun e!285783 () List!9298)

(declare-fun e!285781 () List!9298)

(assert (=> b!485373 (= e!285783 e!285781)))

(declare-fun bm!31242 () Bool)

(declare-fun call!31246 () List!9298)

(declare-fun e!285782 () List!9298)

(declare-fun $colon$colon!133 (List!9298 tuple2!9270) List!9298)

(assert (=> bm!31242 (= call!31246 ($colon$colon!133 e!285782 (ite c!58440 (h!10150 l!956) (tuple2!9271 key!251 value!166))))))

(declare-fun c!58441 () Bool)

(assert (=> bm!31242 (= c!58441 c!58440)))

(declare-fun bm!31243 () Bool)

(declare-fun call!31245 () List!9298)

(assert (=> bm!31243 (= call!31245 call!31246)))

(declare-fun b!485374 () Bool)

(declare-fun contains!2692 (List!9298 tuple2!9270) Bool)

(assert (=> b!485374 (= e!285784 (contains!2692 lt!219523 (tuple2!9271 key!251 value!166)))))

(declare-fun b!485375 () Bool)

(declare-fun call!31247 () List!9298)

(assert (=> b!485375 (= e!285781 call!31247)))

(declare-fun bm!31244 () Bool)

(assert (=> bm!31244 (= call!31247 call!31245)))

(declare-fun b!485376 () Bool)

(assert (=> b!485376 (= e!285780 call!31246)))

(declare-fun b!485377 () Bool)

(assert (=> b!485377 (= e!285780 e!285783)))

(declare-fun c!58439 () Bool)

(assert (=> b!485377 (= c!58439 (and (is-Cons!9294 l!956) (= (_1!4646 (h!10150 l!956)) key!251)))))

(declare-fun b!485378 () Bool)

(assert (=> b!485378 (= e!285783 call!31245)))

(declare-fun b!485379 () Bool)

(assert (=> b!485379 (= e!285781 call!31247)))

(declare-fun b!485380 () Bool)

(assert (=> b!485380 (= e!285782 (ite c!58439 (t!15523 l!956) (ite c!58442 (Cons!9294 (h!10150 l!956) (t!15523 l!956)) Nil!9295)))))

(declare-fun b!485381 () Bool)

(assert (=> b!485381 (= e!285782 (insertStrictlySorted!252 (t!15523 l!956) key!251 value!166))))

(declare-fun b!485382 () Bool)

(declare-fun res!289050 () Bool)

(assert (=> b!485382 (=> (not res!289050) (not e!285784))))

(assert (=> b!485382 (= res!289050 (containsKey!400 lt!219523 key!251))))

(assert (= (and d!77349 c!58440) b!485376))

(assert (= (and d!77349 (not c!58440)) b!485377))

(assert (= (and b!485377 c!58439) b!485378))

(assert (= (and b!485377 (not c!58439)) b!485373))

(assert (= (and b!485373 c!58442) b!485379))

(assert (= (and b!485373 (not c!58442)) b!485375))

(assert (= (or b!485379 b!485375) bm!31244))

(assert (= (or b!485378 bm!31244) bm!31243))

(assert (= (or b!485376 bm!31243) bm!31242))

(assert (= (and bm!31242 c!58441) b!485381))

(assert (= (and bm!31242 (not c!58441)) b!485380))

(assert (= (and d!77349 res!289049) b!485382))

(assert (= (and b!485382 res!289050) b!485374))

(declare-fun m!465529 () Bool)

(assert (=> bm!31242 m!465529))

(declare-fun m!465531 () Bool)

(assert (=> b!485374 m!465531))

(declare-fun m!465533 () Bool)

(assert (=> b!485382 m!465533))

(declare-fun m!465535 () Bool)

(assert (=> d!77349 m!465535))

(assert (=> d!77349 m!465489))

(declare-fun m!465537 () Bool)

(assert (=> b!485381 m!465537))

(assert (=> b!485268 d!77349))

(declare-fun d!77357 () Bool)

(declare-fun res!289063 () Bool)

(declare-fun e!285803 () Bool)

(assert (=> d!77357 (=> res!289063 e!285803)))

(assert (=> d!77357 (= res!289063 (and (is-Cons!9294 l!956) (= (_1!4646 (h!10150 l!956)) key!251)))))

(assert (=> d!77357 (= (containsKey!400 l!956 key!251) e!285803)))

(declare-fun b!485405 () Bool)

(declare-fun e!285804 () Bool)

(assert (=> b!485405 (= e!285803 e!285804)))

(declare-fun res!289064 () Bool)

(assert (=> b!485405 (=> (not res!289064) (not e!285804))))

(assert (=> b!485405 (= res!289064 (and (or (not (is-Cons!9294 l!956)) (bvsle (_1!4646 (h!10150 l!956)) key!251)) (is-Cons!9294 l!956) (bvslt (_1!4646 (h!10150 l!956)) key!251)))))

(declare-fun b!485406 () Bool)

(assert (=> b!485406 (= e!285804 (containsKey!400 (t!15523 l!956) key!251))))

(assert (= (and d!77357 (not res!289063)) b!485405))

(assert (= (and b!485405 res!289064) b!485406))

(declare-fun m!465547 () Bool)

(assert (=> b!485406 m!465547))

(assert (=> b!485267 d!77357))

(declare-fun b!485411 () Bool)

(declare-fun e!285807 () Bool)

(declare-fun tp!43615 () Bool)

(assert (=> b!485411 (= e!285807 (and tp_is_empty!13973 tp!43615))))

(assert (=> b!485270 (= tp!43606 e!285807)))

(assert (= (and b!485270 (is-Cons!9294 (t!15523 l!956))) b!485411))

(push 1)

(assert (not b!485282))

(assert (not b!485406))

(assert (not d!77347))

(assert tp_is_empty!13973)

(assert (not bm!31242))

(assert (not b!485374))

(assert (not b!485411))

(assert (not d!77345))

(assert (not b!485381))

(assert (not b!485382))

(assert (not d!77349))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77399 () Bool)

(declare-fun res!289091 () Bool)

(declare-fun e!285849 () Bool)

(assert (=> d!77399 (=> res!289091 e!285849)))

(assert (=> d!77399 (= res!289091 (and (is-Cons!9294 (t!15523 l!956)) (= (_1!4646 (h!10150 (t!15523 l!956))) key!251)))))

(assert (=> d!77399 (= (containsKey!400 (t!15523 l!956) key!251) e!285849)))

(declare-fun b!485471 () Bool)

(declare-fun e!285850 () Bool)

(assert (=> b!485471 (= e!285849 e!285850)))

(declare-fun res!289092 () Bool)

(assert (=> b!485471 (=> (not res!289092) (not e!285850))))

(assert (=> b!485471 (= res!289092 (and (or (not (is-Cons!9294 (t!15523 l!956))) (bvsle (_1!4646 (h!10150 (t!15523 l!956))) key!251)) (is-Cons!9294 (t!15523 l!956)) (bvslt (_1!4646 (h!10150 (t!15523 l!956))) key!251)))))

(declare-fun b!485472 () Bool)

(assert (=> b!485472 (= e!285850 (containsKey!400 (t!15523 (t!15523 l!956)) key!251))))

(assert (= (and d!77399 (not res!289091)) b!485471))

(assert (= (and b!485471 res!289092) b!485472))

(declare-fun m!465599 () Bool)

(assert (=> b!485472 m!465599))

(assert (=> b!485406 d!77399))

(declare-fun lt!219542 () Bool)

(declare-fun d!77401 () Bool)

(declare-fun content!217 (List!9298) (Set tuple2!9270))

(assert (=> d!77401 (= lt!219542 (member (tuple2!9271 key!251 value!166) (content!217 lt!219523)))))

(declare-fun e!285862 () Bool)

(assert (=> d!77401 (= lt!219542 e!285862)))

(declare-fun res!289104 () Bool)

(assert (=> d!77401 (=> (not res!289104) (not e!285862))))

(assert (=> d!77401 (= res!289104 (is-Cons!9294 lt!219523))))

(assert (=> d!77401 (= (contains!2692 lt!219523 (tuple2!9271 key!251 value!166)) lt!219542)))

(declare-fun b!485484 () Bool)

(declare-fun e!285863 () Bool)

(assert (=> b!485484 (= e!285862 e!285863)))

(declare-fun res!289103 () Bool)

(assert (=> b!485484 (=> res!289103 e!285863)))

(assert (=> b!485484 (= res!289103 (= (h!10150 lt!219523) (tuple2!9271 key!251 value!166)))))

(declare-fun b!485485 () Bool)

(assert (=> b!485485 (= e!285863 (contains!2692 (t!15523 lt!219523) (tuple2!9271 key!251 value!166)))))

(assert (= (and d!77401 res!289104) b!485484))

(assert (= (and b!485484 (not res!289103)) b!485485))

(declare-fun m!465607 () Bool)

(assert (=> d!77401 m!465607))

(declare-fun m!465609 () Bool)

(assert (=> d!77401 m!465609))

(declare-fun m!465611 () Bool)

(assert (=> b!485485 m!465611))

(assert (=> b!485374 d!77401))

(declare-fun d!77403 () Bool)

(declare-fun lt!219545 () Int)

(assert (=> d!77403 (>= lt!219545 0)))

(declare-fun e!285866 () Int)

(assert (=> d!77403 (= lt!219545 e!285866)))

(declare-fun c!58461 () Bool)

(assert (=> d!77403 (= c!58461 (is-Nil!9295 lt!219514))))

(assert (=> d!77403 (= (size!15464 lt!219514) lt!219545)))

(declare-fun b!485490 () Bool)

(assert (=> b!485490 (= e!285866 0)))

(declare-fun b!485491 () Bool)

(assert (=> b!485491 (= e!285866 (+ 1 (size!15464 (t!15523 lt!219514))))))

(assert (= (and d!77403 c!58461) b!485490))

(assert (= (and d!77403 (not c!58461)) b!485491))

(declare-fun m!465613 () Bool)

(assert (=> b!485491 m!465613))

(assert (=> d!77345 d!77403))

(declare-fun d!77405 () Bool)

(declare-fun res!289105 () Bool)

(declare-fun e!285867 () Bool)

(assert (=> d!77405 (=> res!289105 e!285867)))

(assert (=> d!77405 (= res!289105 (and (is-Cons!9294 lt!219523) (= (_1!4646 (h!10150 lt!219523)) key!251)))))

(assert (=> d!77405 (= (containsKey!400 lt!219523 key!251) e!285867)))

(declare-fun b!485492 () Bool)

(declare-fun e!285868 () Bool)

(assert (=> b!485492 (= e!285867 e!285868)))

(declare-fun res!289106 () Bool)

(assert (=> b!485492 (=> (not res!289106) (not e!285868))))

(assert (=> b!485492 (= res!289106 (and (or (not (is-Cons!9294 lt!219523)) (bvsle (_1!4646 (h!10150 lt!219523)) key!251)) (is-Cons!9294 lt!219523) (bvslt (_1!4646 (h!10150 lt!219523)) key!251)))))

(declare-fun b!485493 () Bool)

(assert (=> b!485493 (= e!285868 (containsKey!400 (t!15523 lt!219523) key!251))))

(assert (= (and d!77405 (not res!289105)) b!485492))

(assert (= (and b!485492 res!289106) b!485493))

(declare-fun m!465615 () Bool)

(assert (=> b!485493 m!465615))

(assert (=> b!485382 d!77405))

(declare-fun d!77407 () Bool)

(assert (=> d!77407 (= ($colon$colon!133 e!285782 (ite c!58440 (h!10150 l!956) (tuple2!9271 key!251 value!166))) (Cons!9294 (ite c!58440 (h!10150 l!956) (tuple2!9271 key!251 value!166)) e!285782))))

(assert (=> bm!31242 d!77407))

(declare-fun d!77409 () Bool)

(declare-fun e!285873 () Bool)

(assert (=> d!77409 e!285873))

(declare-fun res!289107 () Bool)

(assert (=> d!77409 (=> (not res!289107) (not e!285873))))

(declare-fun lt!219546 () List!9298)

(assert (=> d!77409 (= res!289107 (isStrictlySorted!437 lt!219546))))

(declare-fun e!285869 () List!9298)

(assert (=> d!77409 (= lt!219546 e!285869)))

(declare-fun c!58463 () Bool)

(assert (=> d!77409 (= c!58463 (and (is-Cons!9294 (t!15523 l!956)) (bvslt (_1!4646 (h!10150 (t!15523 l!956))) key!251)))))

(assert (=> d!77409 (isStrictlySorted!437 (t!15523 l!956))))

(assert (=> d!77409 (= (insertStrictlySorted!252 (t!15523 l!956) key!251 value!166) lt!219546)))

(declare-fun b!485494 () Bool)

(declare-fun c!58465 () Bool)

(assert (=> b!485494 (= c!58465 (and (is-Cons!9294 (t!15523 l!956)) (bvsgt (_1!4646 (h!10150 (t!15523 l!956))) key!251)))))

(declare-fun e!285872 () List!9298)

(declare-fun e!285870 () List!9298)

(assert (=> b!485494 (= e!285872 e!285870)))

(declare-fun e!285871 () List!9298)

(declare-fun call!31255 () List!9298)

(declare-fun bm!31251 () Bool)

(assert (=> bm!31251 (= call!31255 ($colon$colon!133 e!285871 (ite c!58463 (h!10150 (t!15523 l!956)) (tuple2!9271 key!251 value!166))))))

(declare-fun c!58464 () Bool)

(assert (=> bm!31251 (= c!58464 c!58463)))

(declare-fun bm!31252 () Bool)

(declare-fun call!31254 () List!9298)

(assert (=> bm!31252 (= call!31254 call!31255)))

(declare-fun b!485495 () Bool)

(assert (=> b!485495 (= e!285873 (contains!2692 lt!219546 (tuple2!9271 key!251 value!166)))))

(declare-fun b!485496 () Bool)

(declare-fun call!31256 () List!9298)

(assert (=> b!485496 (= e!285870 call!31256)))

(declare-fun bm!31253 () Bool)

(assert (=> bm!31253 (= call!31256 call!31254)))

(declare-fun b!485497 () Bool)

(assert (=> b!485497 (= e!285869 call!31255)))

(declare-fun b!485498 () Bool)

(assert (=> b!485498 (= e!285869 e!285872)))

(declare-fun c!58462 () Bool)

(assert (=> b!485498 (= c!58462 (and (is-Cons!9294 (t!15523 l!956)) (= (_1!4646 (h!10150 (t!15523 l!956))) key!251)))))

(declare-fun b!485499 () Bool)

(assert (=> b!485499 (= e!285872 call!31254)))

(declare-fun b!485500 () Bool)

(assert (=> b!485500 (= e!285870 call!31256)))

(declare-fun b!485501 () Bool)

(assert (=> b!485501 (= e!285871 (ite c!58462 (t!15523 (t!15523 l!956)) (ite c!58465 (Cons!9294 (h!10150 (t!15523 l!956)) (t!15523 (t!15523 l!956))) Nil!9295)))))

(declare-fun b!485502 () Bool)

(assert (=> b!485502 (= e!285871 (insertStrictlySorted!252 (t!15523 (t!15523 l!956)) key!251 value!166))))

(declare-fun b!485503 () Bool)

(declare-fun res!289108 () Bool)

(assert (=> b!485503 (=> (not res!289108) (not e!285873))))

(assert (=> b!485503 (= res!289108 (containsKey!400 lt!219546 key!251))))

(assert (= (and d!77409 c!58463) b!485497))

(assert (= (and d!77409 (not c!58463)) b!485498))

(assert (= (and b!485498 c!58462) b!485499))

(assert (= (and b!485498 (not c!58462)) b!485494))

(assert (= (and b!485494 c!58465) b!485500))

(assert (= (and b!485494 (not c!58465)) b!485496))

(assert (= (or b!485500 b!485496) bm!31253))

(assert (= (or b!485499 bm!31253) bm!31252))

(assert (= (or b!485497 bm!31252) bm!31251))

(assert (= (and bm!31251 c!58464) b!485502))

(assert (= (and bm!31251 (not c!58464)) b!485501))

(assert (= (and d!77409 res!289107) b!485503))

(assert (= (and b!485503 res!289108) b!485495))

(declare-fun m!465617 () Bool)

(assert (=> bm!31251 m!465617))

(declare-fun m!465619 () Bool)

(assert (=> b!485495 m!465619))

(declare-fun m!465621 () Bool)

(assert (=> b!485503 m!465621))

(declare-fun m!465623 () Bool)

(assert (=> d!77409 m!465623))

(assert (=> d!77409 m!465501))

(declare-fun m!465625 () Bool)

(assert (=> b!485502 m!465625))

(assert (=> b!485381 d!77409))

(declare-fun d!77411 () Bool)

(declare-fun lt!219547 () Int)

(assert (=> d!77411 (>= lt!219547 0)))

(declare-fun e!285874 () Int)

(assert (=> d!77411 (= lt!219547 e!285874)))

(declare-fun c!58466 () Bool)

(assert (=> d!77411 (= c!58466 (is-Nil!9295 l!956))))

(assert (=> d!77411 (= (size!15464 l!956) lt!219547)))

(declare-fun b!485504 () Bool)

(assert (=> b!485504 (= e!285874 0)))

(declare-fun b!485505 () Bool)

(assert (=> b!485505 (= e!285874 (+ 1 (size!15464 (t!15523 l!956))))))

(assert (= (and d!77411 c!58466) b!485504))

(assert (= (and d!77411 (not c!58466)) b!485505))

(declare-fun m!465627 () Bool)

