; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43982 () Bool)

(assert start!43982)

(declare-fun b!485258 () Bool)

(declare-fun e!285708 () Bool)

(declare-fun tp_is_empty!13971 () Bool)

(declare-fun tp!43603 () Bool)

(assert (=> b!485258 (= e!285708 (and tp_is_empty!13971 tp!43603))))

(declare-fun b!485257 () Bool)

(declare-fun e!285707 () Bool)

(declare-datatypes ((B!1162 0))(
  ( (B!1163 (val!7033 Int)) )
))
(declare-datatypes ((tuple2!9268 0))(
  ( (tuple2!9269 (_1!4645 (_ BitVec 64)) (_2!4645 B!1162)) )
))
(declare-datatypes ((List!9297 0))(
  ( (Nil!9294) (Cons!9293 (h!10149 tuple2!9268) (t!15522 List!9297)) )
))
(declare-fun lt!219511 () List!9297)

(declare-fun l!956 () List!9297)

(declare-fun length!15 (List!9297) Int)

(assert (=> b!485257 (= e!285707 (not (= (length!15 lt!219511) (+ 1 (length!15 l!956)))))))

(declare-fun b!485255 () Bool)

(declare-fun res!289000 () Bool)

(declare-fun e!285706 () Bool)

(assert (=> b!485255 (=> (not res!289000) (not e!285706))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!399 (List!9297 (_ BitVec 64)) Bool)

(assert (=> b!485255 (= res!289000 (not (containsKey!399 l!956 key!251)))))

(declare-fun b!485256 () Bool)

(assert (=> b!485256 (= e!285706 e!285707)))

(declare-fun res!289001 () Bool)

(assert (=> b!485256 (=> (not res!289001) (not e!285707))))

(get-info :version)

(assert (=> b!485256 (= res!289001 (and (or (not ((_ is Cons!9293) l!956)) (bvsge (_1!4645 (h!10149 l!956)) key!251)) (or (not ((_ is Cons!9293) l!956)) (not (= (_1!4645 (h!10149 l!956)) key!251)))))))

(declare-fun value!166 () B!1162)

(declare-fun insertStrictlySorted!251 (List!9297 (_ BitVec 64) B!1162) List!9297)

(assert (=> b!485256 (= lt!219511 (insertStrictlySorted!251 l!956 key!251 value!166))))

(declare-fun res!288999 () Bool)

(assert (=> start!43982 (=> (not res!288999) (not e!285706))))

(declare-fun isStrictlySorted!436 (List!9297) Bool)

(assert (=> start!43982 (= res!288999 (isStrictlySorted!436 l!956))))

(assert (=> start!43982 e!285706))

(assert (=> start!43982 e!285708))

(assert (=> start!43982 true))

(assert (=> start!43982 tp_is_empty!13971))

(assert (= (and start!43982 res!288999) b!485255))

(assert (= (and b!485255 res!289000) b!485256))

(assert (= (and b!485256 res!289001) b!485257))

(assert (= (and start!43982 ((_ is Cons!9293) l!956)) b!485258))

(declare-fun m!465475 () Bool)

(assert (=> b!485257 m!465475))

(declare-fun m!465477 () Bool)

(assert (=> b!485257 m!465477))

(declare-fun m!465479 () Bool)

(assert (=> b!485255 m!465479))

(declare-fun m!465481 () Bool)

(assert (=> b!485256 m!465481))

(declare-fun m!465483 () Bool)

(assert (=> start!43982 m!465483))

(check-sat (not b!485257) (not start!43982) (not b!485258) (not b!485256) tp_is_empty!13971 (not b!485255))
(check-sat)
(get-model)

(declare-fun d!77335 () Bool)

(declare-fun res!289015 () Bool)

(declare-fun e!285722 () Bool)

(assert (=> d!77335 (=> res!289015 e!285722)))

(assert (=> d!77335 (= res!289015 (or ((_ is Nil!9294) l!956) ((_ is Nil!9294) (t!15522 l!956))))))

(assert (=> d!77335 (= (isStrictlySorted!436 l!956) e!285722)))

(declare-fun b!485275 () Bool)

(declare-fun e!285723 () Bool)

(assert (=> b!485275 (= e!285722 e!285723)))

(declare-fun res!289016 () Bool)

(assert (=> b!485275 (=> (not res!289016) (not e!285723))))

(assert (=> b!485275 (= res!289016 (bvslt (_1!4645 (h!10149 l!956)) (_1!4645 (h!10149 (t!15522 l!956)))))))

(declare-fun b!485276 () Bool)

(assert (=> b!485276 (= e!285723 (isStrictlySorted!436 (t!15522 l!956)))))

(assert (= (and d!77335 (not res!289015)) b!485275))

(assert (= (and b!485275 res!289016) b!485276))

(declare-fun m!465495 () Bool)

(assert (=> b!485276 m!465495))

(assert (=> start!43982 d!77335))

(declare-fun d!77339 () Bool)

(declare-fun size!15463 (List!9297) Int)

(assert (=> d!77339 (= (length!15 lt!219511) (size!15463 lt!219511))))

(declare-fun bs!15454 () Bool)

(assert (= bs!15454 d!77339))

(declare-fun m!465497 () Bool)

(assert (=> bs!15454 m!465497))

(assert (=> b!485257 d!77339))

(declare-fun d!77341 () Bool)

(assert (=> d!77341 (= (length!15 l!956) (size!15463 l!956))))

(declare-fun bs!15455 () Bool)

(assert (= bs!15455 d!77341))

(declare-fun m!465499 () Bool)

(assert (=> bs!15455 m!465499))

(assert (=> b!485257 d!77341))

(declare-fun b!485357 () Bool)

(declare-fun e!285771 () List!9297)

(declare-fun call!31244 () List!9297)

(assert (=> b!485357 (= e!285771 call!31244)))

(declare-fun b!485358 () Bool)

(declare-fun c!58437 () Bool)

(assert (=> b!485358 (= c!58437 (and ((_ is Cons!9293) l!956) (bvsgt (_1!4645 (h!10149 l!956)) key!251)))))

(declare-fun e!285772 () List!9297)

(assert (=> b!485358 (= e!285772 e!285771)))

(declare-fun b!485359 () Bool)

(declare-fun res!289042 () Bool)

(declare-fun e!285773 () Bool)

(assert (=> b!485359 (=> (not res!289042) (not e!285773))))

(declare-fun lt!219522 () List!9297)

(assert (=> b!485359 (= res!289042 (containsKey!399 lt!219522 key!251))))

(declare-fun bm!31239 () Bool)

(declare-fun call!31243 () List!9297)

(assert (=> bm!31239 (= call!31244 call!31243)))

(declare-fun d!77343 () Bool)

(assert (=> d!77343 e!285773))

(declare-fun res!289041 () Bool)

(assert (=> d!77343 (=> (not res!289041) (not e!285773))))

(assert (=> d!77343 (= res!289041 (isStrictlySorted!436 lt!219522))))

(declare-fun e!285769 () List!9297)

(assert (=> d!77343 (= lt!219522 e!285769)))

(declare-fun c!58438 () Bool)

(assert (=> d!77343 (= c!58438 (and ((_ is Cons!9293) l!956) (bvslt (_1!4645 (h!10149 l!956)) key!251)))))

(assert (=> d!77343 (isStrictlySorted!436 l!956)))

(assert (=> d!77343 (= (insertStrictlySorted!251 l!956 key!251 value!166) lt!219522)))

(declare-fun bm!31240 () Bool)

(declare-fun call!31242 () List!9297)

(assert (=> bm!31240 (= call!31243 call!31242)))

(declare-fun b!485360 () Bool)

(assert (=> b!485360 (= e!285769 call!31242)))

(declare-fun b!485361 () Bool)

(declare-fun contains!2691 (List!9297 tuple2!9268) Bool)

(assert (=> b!485361 (= e!285773 (contains!2691 lt!219522 (tuple2!9269 key!251 value!166)))))

(declare-fun b!485362 () Bool)

(assert (=> b!485362 (= e!285772 call!31243)))

(declare-fun b!485363 () Bool)

(declare-fun e!285770 () List!9297)

(assert (=> b!485363 (= e!285770 (insertStrictlySorted!251 (t!15522 l!956) key!251 value!166))))

(declare-fun b!485364 () Bool)

(assert (=> b!485364 (= e!285769 e!285772)))

(declare-fun c!58435 () Bool)

(assert (=> b!485364 (= c!58435 (and ((_ is Cons!9293) l!956) (= (_1!4645 (h!10149 l!956)) key!251)))))

(declare-fun bm!31241 () Bool)

(declare-fun $colon$colon!132 (List!9297 tuple2!9268) List!9297)

(assert (=> bm!31241 (= call!31242 ($colon$colon!132 e!285770 (ite c!58438 (h!10149 l!956) (tuple2!9269 key!251 value!166))))))

(declare-fun c!58436 () Bool)

(assert (=> bm!31241 (= c!58436 c!58438)))

(declare-fun b!485365 () Bool)

(assert (=> b!485365 (= e!285770 (ite c!58435 (t!15522 l!956) (ite c!58437 (Cons!9293 (h!10149 l!956) (t!15522 l!956)) Nil!9294)))))

(declare-fun b!485366 () Bool)

(assert (=> b!485366 (= e!285771 call!31244)))

(assert (= (and d!77343 c!58438) b!485360))

(assert (= (and d!77343 (not c!58438)) b!485364))

(assert (= (and b!485364 c!58435) b!485362))

(assert (= (and b!485364 (not c!58435)) b!485358))

(assert (= (and b!485358 c!58437) b!485357))

(assert (= (and b!485358 (not c!58437)) b!485366))

(assert (= (or b!485357 b!485366) bm!31239))

(assert (= (or b!485362 bm!31239) bm!31240))

(assert (= (or b!485360 bm!31240) bm!31241))

(assert (= (and bm!31241 c!58436) b!485363))

(assert (= (and bm!31241 (not c!58436)) b!485365))

(assert (= (and d!77343 res!289041) b!485359))

(assert (= (and b!485359 res!289042) b!485361))

(declare-fun m!465519 () Bool)

(assert (=> d!77343 m!465519))

(assert (=> d!77343 m!465483))

(declare-fun m!465521 () Bool)

(assert (=> bm!31241 m!465521))

(declare-fun m!465523 () Bool)

(assert (=> b!485361 m!465523))

(declare-fun m!465525 () Bool)

(assert (=> b!485363 m!465525))

(declare-fun m!465527 () Bool)

(assert (=> b!485359 m!465527))

(assert (=> b!485256 d!77343))

(declare-fun d!77355 () Bool)

(declare-fun res!289057 () Bool)

(declare-fun e!285791 () Bool)

(assert (=> d!77355 (=> res!289057 e!285791)))

(assert (=> d!77355 (= res!289057 (and ((_ is Cons!9293) l!956) (= (_1!4645 (h!10149 l!956)) key!251)))))

(assert (=> d!77355 (= (containsKey!399 l!956 key!251) e!285791)))

(declare-fun b!485389 () Bool)

(declare-fun e!285792 () Bool)

(assert (=> b!485389 (= e!285791 e!285792)))

(declare-fun res!289058 () Bool)

(assert (=> b!485389 (=> (not res!289058) (not e!285792))))

(assert (=> b!485389 (= res!289058 (and (or (not ((_ is Cons!9293) l!956)) (bvsle (_1!4645 (h!10149 l!956)) key!251)) ((_ is Cons!9293) l!956) (bvslt (_1!4645 (h!10149 l!956)) key!251)))))

(declare-fun b!485390 () Bool)

(assert (=> b!485390 (= e!285792 (containsKey!399 (t!15522 l!956) key!251))))

(assert (= (and d!77355 (not res!289057)) b!485389))

(assert (= (and b!485389 res!289058) b!485390))

(declare-fun m!465545 () Bool)

(assert (=> b!485390 m!465545))

(assert (=> b!485255 d!77355))

(declare-fun b!485400 () Bool)

(declare-fun e!285800 () Bool)

(declare-fun tp!43612 () Bool)

(assert (=> b!485400 (= e!285800 (and tp_is_empty!13971 tp!43612))))

(assert (=> b!485258 (= tp!43603 e!285800)))

(assert (= (and b!485258 ((_ is Cons!9293) (t!15522 l!956))) b!485400))

(check-sat (not d!77341) (not b!485363) (not bm!31241) (not d!77339) (not b!485361) (not b!485390) tp_is_empty!13971 (not b!485359) (not d!77343) (not b!485400) (not b!485276))
(check-sat)
(get-model)

(declare-fun d!77381 () Bool)

(assert (=> d!77381 (= ($colon$colon!132 e!285770 (ite c!58438 (h!10149 l!956) (tuple2!9269 key!251 value!166))) (Cons!9293 (ite c!58438 (h!10149 l!956) (tuple2!9269 key!251 value!166)) e!285770))))

(assert (=> bm!31241 d!77381))

(declare-fun d!77383 () Bool)

(declare-fun res!289081 () Bool)

(declare-fun e!285832 () Bool)

(assert (=> d!77383 (=> res!289081 e!285832)))

(assert (=> d!77383 (= res!289081 (or ((_ is Nil!9294) (t!15522 l!956)) ((_ is Nil!9294) (t!15522 (t!15522 l!956)))))))

(assert (=> d!77383 (= (isStrictlySorted!436 (t!15522 l!956)) e!285832)))

(declare-fun b!485445 () Bool)

(declare-fun e!285833 () Bool)

(assert (=> b!485445 (= e!285832 e!285833)))

(declare-fun res!289082 () Bool)

(assert (=> b!485445 (=> (not res!289082) (not e!285833))))

(assert (=> b!485445 (= res!289082 (bvslt (_1!4645 (h!10149 (t!15522 l!956))) (_1!4645 (h!10149 (t!15522 (t!15522 l!956))))))))

(declare-fun b!485446 () Bool)

(assert (=> b!485446 (= e!285833 (isStrictlySorted!436 (t!15522 (t!15522 l!956))))))

(assert (= (and d!77383 (not res!289081)) b!485445))

(assert (= (and b!485445 res!289082) b!485446))

(declare-fun m!465577 () Bool)

(assert (=> b!485446 m!465577))

(assert (=> b!485276 d!77383))

(declare-fun d!77385 () Bool)

(declare-fun res!289083 () Bool)

(declare-fun e!285834 () Bool)

(assert (=> d!77385 (=> res!289083 e!285834)))

(assert (=> d!77385 (= res!289083 (or ((_ is Nil!9294) lt!219522) ((_ is Nil!9294) (t!15522 lt!219522))))))

(assert (=> d!77385 (= (isStrictlySorted!436 lt!219522) e!285834)))

(declare-fun b!485447 () Bool)

(declare-fun e!285835 () Bool)

(assert (=> b!485447 (= e!285834 e!285835)))

(declare-fun res!289084 () Bool)

(assert (=> b!485447 (=> (not res!289084) (not e!285835))))

(assert (=> b!485447 (= res!289084 (bvslt (_1!4645 (h!10149 lt!219522)) (_1!4645 (h!10149 (t!15522 lt!219522)))))))

(declare-fun b!485448 () Bool)

(assert (=> b!485448 (= e!285835 (isStrictlySorted!436 (t!15522 lt!219522)))))

(assert (= (and d!77385 (not res!289083)) b!485447))

(assert (= (and b!485447 res!289084) b!485448))

(declare-fun m!465579 () Bool)

(assert (=> b!485448 m!465579))

(assert (=> d!77343 d!77385))

(assert (=> d!77343 d!77335))

(declare-fun d!77387 () Bool)

(declare-fun lt!219534 () Int)

(assert (=> d!77387 (>= lt!219534 0)))

(declare-fun e!285838 () Int)

(assert (=> d!77387 (= lt!219534 e!285838)))

(declare-fun c!58453 () Bool)

(assert (=> d!77387 (= c!58453 ((_ is Nil!9294) l!956))))

(assert (=> d!77387 (= (size!15463 l!956) lt!219534)))

(declare-fun b!485453 () Bool)

(assert (=> b!485453 (= e!285838 0)))

(declare-fun b!485454 () Bool)

(assert (=> b!485454 (= e!285838 (+ 1 (size!15463 (t!15522 l!956))))))

(assert (= (and d!77387 c!58453) b!485453))

(assert (= (and d!77387 (not c!58453)) b!485454))

(declare-fun m!465581 () Bool)

(assert (=> b!485454 m!465581))

(assert (=> d!77341 d!77387))

(declare-fun d!77389 () Bool)

(declare-fun res!289085 () Bool)

(declare-fun e!285839 () Bool)

(assert (=> d!77389 (=> res!289085 e!285839)))

(assert (=> d!77389 (= res!289085 (and ((_ is Cons!9293) (t!15522 l!956)) (= (_1!4645 (h!10149 (t!15522 l!956))) key!251)))))

(assert (=> d!77389 (= (containsKey!399 (t!15522 l!956) key!251) e!285839)))

(declare-fun b!485455 () Bool)

(declare-fun e!285840 () Bool)

(assert (=> b!485455 (= e!285839 e!285840)))

(declare-fun res!289086 () Bool)

(assert (=> b!485455 (=> (not res!289086) (not e!285840))))

(assert (=> b!485455 (= res!289086 (and (or (not ((_ is Cons!9293) (t!15522 l!956))) (bvsle (_1!4645 (h!10149 (t!15522 l!956))) key!251)) ((_ is Cons!9293) (t!15522 l!956)) (bvslt (_1!4645 (h!10149 (t!15522 l!956))) key!251)))))

(declare-fun b!485456 () Bool)

(assert (=> b!485456 (= e!285840 (containsKey!399 (t!15522 (t!15522 l!956)) key!251))))

(assert (= (and d!77389 (not res!289085)) b!485455))

(assert (= (and b!485455 res!289086) b!485456))

(declare-fun m!465583 () Bool)

(assert (=> b!485456 m!465583))

(assert (=> b!485390 d!77389))

(declare-fun d!77391 () Bool)

(declare-fun lt!219535 () Int)

(assert (=> d!77391 (>= lt!219535 0)))

(declare-fun e!285841 () Int)

(assert (=> d!77391 (= lt!219535 e!285841)))

(declare-fun c!58454 () Bool)

(assert (=> d!77391 (= c!58454 ((_ is Nil!9294) lt!219511))))

(assert (=> d!77391 (= (size!15463 lt!219511) lt!219535)))

(declare-fun b!485457 () Bool)

(assert (=> b!485457 (= e!285841 0)))

(declare-fun b!485458 () Bool)

(assert (=> b!485458 (= e!285841 (+ 1 (size!15463 (t!15522 lt!219511))))))

(assert (= (and d!77391 c!58454) b!485457))

(assert (= (and d!77391 (not c!58454)) b!485458))

(declare-fun m!465585 () Bool)

(assert (=> b!485458 m!465585))

(assert (=> d!77339 d!77391))

(declare-fun b!485459 () Bool)

(declare-fun e!285844 () List!9297)

(declare-fun call!31253 () List!9297)

(assert (=> b!485459 (= e!285844 call!31253)))

(declare-fun b!485460 () Bool)

(declare-fun c!58457 () Bool)

(assert (=> b!485460 (= c!58457 (and ((_ is Cons!9293) (t!15522 l!956)) (bvsgt (_1!4645 (h!10149 (t!15522 l!956))) key!251)))))

(declare-fun e!285845 () List!9297)

(assert (=> b!485460 (= e!285845 e!285844)))

(declare-fun b!485461 () Bool)

(declare-fun res!289088 () Bool)

(declare-fun e!285846 () Bool)

(assert (=> b!485461 (=> (not res!289088) (not e!285846))))

(declare-fun lt!219536 () List!9297)

(assert (=> b!485461 (= res!289088 (containsKey!399 lt!219536 key!251))))

(declare-fun bm!31248 () Bool)

(declare-fun call!31252 () List!9297)

(assert (=> bm!31248 (= call!31253 call!31252)))

(declare-fun d!77393 () Bool)

(assert (=> d!77393 e!285846))

(declare-fun res!289087 () Bool)

(assert (=> d!77393 (=> (not res!289087) (not e!285846))))

(assert (=> d!77393 (= res!289087 (isStrictlySorted!436 lt!219536))))

(declare-fun e!285842 () List!9297)

(assert (=> d!77393 (= lt!219536 e!285842)))

(declare-fun c!58458 () Bool)

(assert (=> d!77393 (= c!58458 (and ((_ is Cons!9293) (t!15522 l!956)) (bvslt (_1!4645 (h!10149 (t!15522 l!956))) key!251)))))

(assert (=> d!77393 (isStrictlySorted!436 (t!15522 l!956))))

(assert (=> d!77393 (= (insertStrictlySorted!251 (t!15522 l!956) key!251 value!166) lt!219536)))

(declare-fun bm!31249 () Bool)

(declare-fun call!31251 () List!9297)

(assert (=> bm!31249 (= call!31252 call!31251)))

(declare-fun b!485462 () Bool)

(assert (=> b!485462 (= e!285842 call!31251)))

(declare-fun b!485463 () Bool)

(assert (=> b!485463 (= e!285846 (contains!2691 lt!219536 (tuple2!9269 key!251 value!166)))))

(declare-fun b!485464 () Bool)

(assert (=> b!485464 (= e!285845 call!31252)))

(declare-fun e!285843 () List!9297)

(declare-fun b!485465 () Bool)

(assert (=> b!485465 (= e!285843 (insertStrictlySorted!251 (t!15522 (t!15522 l!956)) key!251 value!166))))

(declare-fun b!485466 () Bool)

(assert (=> b!485466 (= e!285842 e!285845)))

(declare-fun c!58455 () Bool)

(assert (=> b!485466 (= c!58455 (and ((_ is Cons!9293) (t!15522 l!956)) (= (_1!4645 (h!10149 (t!15522 l!956))) key!251)))))

(declare-fun bm!31250 () Bool)

(assert (=> bm!31250 (= call!31251 ($colon$colon!132 e!285843 (ite c!58458 (h!10149 (t!15522 l!956)) (tuple2!9269 key!251 value!166))))))

(declare-fun c!58456 () Bool)

(assert (=> bm!31250 (= c!58456 c!58458)))

(declare-fun b!485467 () Bool)

(assert (=> b!485467 (= e!285843 (ite c!58455 (t!15522 (t!15522 l!956)) (ite c!58457 (Cons!9293 (h!10149 (t!15522 l!956)) (t!15522 (t!15522 l!956))) Nil!9294)))))

(declare-fun b!485468 () Bool)

(assert (=> b!485468 (= e!285844 call!31253)))

(assert (= (and d!77393 c!58458) b!485462))

(assert (= (and d!77393 (not c!58458)) b!485466))

(assert (= (and b!485466 c!58455) b!485464))

(assert (= (and b!485466 (not c!58455)) b!485460))

(assert (= (and b!485460 c!58457) b!485459))

(assert (= (and b!485460 (not c!58457)) b!485468))

(assert (= (or b!485459 b!485468) bm!31248))

(assert (= (or b!485464 bm!31248) bm!31249))

(assert (= (or b!485462 bm!31249) bm!31250))

(assert (= (and bm!31250 c!58456) b!485465))

(assert (= (and bm!31250 (not c!58456)) b!485467))

(assert (= (and d!77393 res!289087) b!485461))

(assert (= (and b!485461 res!289088) b!485463))

(declare-fun m!465587 () Bool)

(assert (=> d!77393 m!465587))

(assert (=> d!77393 m!465495))

(declare-fun m!465589 () Bool)

(assert (=> bm!31250 m!465589))

(declare-fun m!465591 () Bool)

(assert (=> b!485463 m!465591))

(declare-fun m!465593 () Bool)

(assert (=> b!485465 m!465593))

(declare-fun m!465595 () Bool)

(assert (=> b!485461 m!465595))

(assert (=> b!485363 d!77393))

(declare-fun d!77395 () Bool)

(declare-fun res!289089 () Bool)

(declare-fun e!285847 () Bool)

(assert (=> d!77395 (=> res!289089 e!285847)))

(assert (=> d!77395 (= res!289089 (and ((_ is Cons!9293) lt!219522) (= (_1!4645 (h!10149 lt!219522)) key!251)))))

(assert (=> d!77395 (= (containsKey!399 lt!219522 key!251) e!285847)))

(declare-fun b!485469 () Bool)

(declare-fun e!285848 () Bool)

(assert (=> b!485469 (= e!285847 e!285848)))

(declare-fun res!289090 () Bool)

(assert (=> b!485469 (=> (not res!289090) (not e!285848))))

(assert (=> b!485469 (= res!289090 (and (or (not ((_ is Cons!9293) lt!219522)) (bvsle (_1!4645 (h!10149 lt!219522)) key!251)) ((_ is Cons!9293) lt!219522) (bvslt (_1!4645 (h!10149 lt!219522)) key!251)))))

(declare-fun b!485470 () Bool)

(assert (=> b!485470 (= e!285848 (containsKey!399 (t!15522 lt!219522) key!251))))

(assert (= (and d!77395 (not res!289089)) b!485469))

(assert (= (and b!485469 res!289090) b!485470))

(declare-fun m!465597 () Bool)

(assert (=> b!485470 m!465597))

(assert (=> b!485359 d!77395))

(declare-fun d!77397 () Bool)

(declare-fun lt!219541 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!218 (List!9297) (InoxSet tuple2!9268))

(assert (=> d!77397 (= lt!219541 (select (content!218 lt!219522) (tuple2!9269 key!251 value!166)))))

(declare-fun e!285860 () Bool)

(assert (=> d!77397 (= lt!219541 e!285860)))

(declare-fun res!289101 () Bool)

(assert (=> d!77397 (=> (not res!289101) (not e!285860))))

(assert (=> d!77397 (= res!289101 ((_ is Cons!9293) lt!219522))))

(assert (=> d!77397 (= (contains!2691 lt!219522 (tuple2!9269 key!251 value!166)) lt!219541)))

(declare-fun b!485481 () Bool)

(declare-fun e!285859 () Bool)

(assert (=> b!485481 (= e!285860 e!285859)))

(declare-fun res!289102 () Bool)

(assert (=> b!485481 (=> res!289102 e!285859)))

(assert (=> b!485481 (= res!289102 (= (h!10149 lt!219522) (tuple2!9269 key!251 value!166)))))

(declare-fun b!485482 () Bool)

(assert (=> b!485482 (= e!285859 (contains!2691 (t!15522 lt!219522) (tuple2!9269 key!251 value!166)))))

(assert (= (and d!77397 res!289101) b!485481))

(assert (= (and b!485481 (not res!289102)) b!485482))

(declare-fun m!465601 () Bool)

(assert (=> d!77397 m!465601))

(declare-fun m!465603 () Bool)

(assert (=> d!77397 m!465603))

(declare-fun m!465605 () Bool)

(assert (=> b!485482 m!465605))

(assert (=> b!485361 d!77397))

(declare-fun b!485483 () Bool)

(declare-fun e!285861 () Bool)

(declare-fun tp!43617 () Bool)

(assert (=> b!485483 (= e!285861 (and tp_is_empty!13971 tp!43617))))

(assert (=> b!485400 (= tp!43612 e!285861)))

(assert (= (and b!485400 ((_ is Cons!9293) (t!15522 (t!15522 l!956)))) b!485483))

(check-sat (not b!485448) (not b!485470) (not b!485465) (not b!485483) (not b!485461) (not b!485446) (not bm!31250) (not b!485456) (not b!485482) (not b!485454) (not d!77393) (not d!77397) (not b!485458) (not b!485463) tp_is_empty!13971)
(check-sat)
