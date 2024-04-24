; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43972 () Bool)

(assert start!43972)

(declare-fun b!485209 () Bool)

(declare-fun e!285677 () Bool)

(declare-fun tp_is_empty!13973 () Bool)

(declare-fun tp!43606 () Bool)

(assert (=> b!485209 (= e!285677 (and tp_is_empty!13973 tp!43606))))

(declare-fun b!485208 () Bool)

(declare-fun e!285676 () Bool)

(declare-datatypes ((B!1164 0))(
  ( (B!1165 (val!7034 Int)) )
))
(declare-datatypes ((tuple2!9184 0))(
  ( (tuple2!9185 (_1!4603 (_ BitVec 64)) (_2!4603 B!1164)) )
))
(declare-datatypes ((List!9200 0))(
  ( (Nil!9197) (Cons!9196 (h!10052 tuple2!9184) (t!15417 List!9200)) )
))
(declare-fun lt!219526 () List!9200)

(declare-fun l!956 () List!9200)

(declare-fun length!16 (List!9200) Int)

(assert (=> b!485208 (= e!285676 (not (= (length!16 lt!219526) (+ 1 (length!16 l!956)))))))

(declare-fun b!485206 () Bool)

(declare-fun res!289002 () Bool)

(declare-fun e!285678 () Bool)

(assert (=> b!485206 (=> (not res!289002) (not e!285678))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!400 (List!9200 (_ BitVec 64)) Bool)

(assert (=> b!485206 (= res!289002 (not (containsKey!400 l!956 key!251)))))

(declare-fun b!485207 () Bool)

(assert (=> b!485207 (= e!285678 e!285676)))

(declare-fun res!289003 () Bool)

(assert (=> b!485207 (=> (not res!289003) (not e!285676))))

(assert (=> b!485207 (= res!289003 (and (or (not (is-Cons!9196 l!956)) (bvsge (_1!4603 (h!10052 l!956)) key!251)) (or (not (is-Cons!9196 l!956)) (not (= (_1!4603 (h!10052 l!956)) key!251)))))))

(declare-fun value!166 () B!1164)

(declare-fun insertStrictlySorted!253 (List!9200 (_ BitVec 64) B!1164) List!9200)

(assert (=> b!485207 (= lt!219526 (insertStrictlySorted!253 l!956 key!251 value!166))))

(declare-fun res!289001 () Bool)

(assert (=> start!43972 (=> (not res!289001) (not e!285678))))

(declare-fun isStrictlySorted!425 (List!9200) Bool)

(assert (=> start!43972 (= res!289001 (isStrictlySorted!425 l!956))))

(assert (=> start!43972 e!285678))

(assert (=> start!43972 e!285677))

(assert (=> start!43972 true))

(assert (=> start!43972 tp_is_empty!13973))

(assert (= (and start!43972 res!289001) b!485206))

(assert (= (and b!485206 res!289002) b!485207))

(assert (= (and b!485207 res!289003) b!485208))

(assert (= (and start!43972 (is-Cons!9196 l!956)) b!485209))

(declare-fun m!465669 () Bool)

(assert (=> b!485208 m!465669))

(declare-fun m!465671 () Bool)

(assert (=> b!485208 m!465671))

(declare-fun m!465673 () Bool)

(assert (=> b!485206 m!465673))

(declare-fun m!465675 () Bool)

(assert (=> b!485207 m!465675))

(declare-fun m!465677 () Bool)

(assert (=> start!43972 m!465677))

(push 1)

(assert (not b!485207))

(assert (not b!485206))

(assert (not b!485208))

(assert tp_is_empty!13973)

(assert (not start!43972))

(assert (not b!485209))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77365 () Bool)

(declare-fun res!289014 () Bool)

(declare-fun e!285689 () Bool)

(assert (=> d!77365 (=> res!289014 e!285689)))

(assert (=> d!77365 (= res!289014 (and (is-Cons!9196 l!956) (= (_1!4603 (h!10052 l!956)) key!251)))))

(assert (=> d!77365 (= (containsKey!400 l!956 key!251) e!285689)))

(declare-fun b!485220 () Bool)

(declare-fun e!285690 () Bool)

(assert (=> b!485220 (= e!285689 e!285690)))

(declare-fun res!289015 () Bool)

(assert (=> b!485220 (=> (not res!289015) (not e!285690))))

(assert (=> b!485220 (= res!289015 (and (or (not (is-Cons!9196 l!956)) (bvsle (_1!4603 (h!10052 l!956)) key!251)) (is-Cons!9196 l!956) (bvslt (_1!4603 (h!10052 l!956)) key!251)))))

(declare-fun b!485221 () Bool)

(assert (=> b!485221 (= e!285690 (containsKey!400 (t!15417 l!956) key!251))))

(assert (= (and d!77365 (not res!289014)) b!485220))

(assert (= (and b!485220 res!289015) b!485221))

(declare-fun m!465681 () Bool)

(assert (=> b!485221 m!465681))

(assert (=> b!485206 d!77365))

(declare-fun b!485302 () Bool)

(declare-fun e!285731 () List!9200)

(declare-fun call!31233 () List!9200)

(assert (=> b!485302 (= e!285731 call!31233)))

(declare-fun d!77371 () Bool)

(declare-fun e!285735 () Bool)

(assert (=> d!77371 e!285735))

(declare-fun res!289033 () Bool)

(assert (=> d!77371 (=> (not res!289033) (not e!285735))))

(declare-fun lt!219535 () List!9200)

(assert (=> d!77371 (= res!289033 (isStrictlySorted!425 lt!219535))))

(declare-fun e!285733 () List!9200)

(assert (=> d!77371 (= lt!219535 e!285733)))

(declare-fun c!58412 () Bool)

(assert (=> d!77371 (= c!58412 (and (is-Cons!9196 l!956) (bvslt (_1!4603 (h!10052 l!956)) key!251)))))

(assert (=> d!77371 (isStrictlySorted!425 l!956)))

(assert (=> d!77371 (= (insertStrictlySorted!253 l!956 key!251 value!166) lt!219535)))

(declare-fun e!285732 () List!9200)

(declare-fun b!485303 () Bool)

(assert (=> b!485303 (= e!285732 (insertStrictlySorted!253 (t!15417 l!956) key!251 value!166))))

(declare-fun b!485304 () Bool)

(declare-fun e!285734 () List!9200)

(declare-fun call!31231 () List!9200)

(assert (=> b!485304 (= e!285734 call!31231)))

(declare-fun b!485305 () Bool)

(declare-fun c!58414 () Bool)

(declare-fun c!58413 () Bool)

(assert (=> b!485305 (= e!285732 (ite c!58413 (t!15417 l!956) (ite c!58414 (Cons!9196 (h!10052 l!956) (t!15417 l!956)) Nil!9197)))))

(declare-fun b!485306 () Bool)

(declare-fun call!31232 () List!9200)

(assert (=> b!485306 (= e!285733 call!31232)))

(declare-fun bm!31228 () Bool)

(declare-fun $colon$colon!130 (List!9200 tuple2!9184) List!9200)

(assert (=> bm!31228 (= call!31232 ($colon$colon!130 e!285732 (ite c!58412 (h!10052 l!956) (tuple2!9185 key!251 value!166))))))

(declare-fun c!58415 () Bool)

(assert (=> bm!31228 (= c!58415 c!58412)))

(declare-fun bm!31229 () Bool)

(assert (=> bm!31229 (= call!31233 call!31231)))

(declare-fun b!485307 () Bool)

(assert (=> b!485307 (= e!285731 call!31233)))

(declare-fun b!485308 () Bool)

(declare-fun res!289032 () Bool)

(assert (=> b!485308 (=> (not res!289032) (not e!285735))))

(assert (=> b!485308 (= res!289032 (containsKey!400 lt!219535 key!251))))

(declare-fun b!485309 () Bool)

(assert (=> b!485309 (= e!285733 e!285734)))

(assert (=> b!485309 (= c!58413 (and (is-Cons!9196 l!956) (= (_1!4603 (h!10052 l!956)) key!251)))))

(declare-fun b!485310 () Bool)

(assert (=> b!485310 (= c!58414 (and (is-Cons!9196 l!956) (bvsgt (_1!4603 (h!10052 l!956)) key!251)))))

(assert (=> b!485310 (= e!285734 e!285731)))

(declare-fun bm!31230 () Bool)

(assert (=> bm!31230 (= call!31231 call!31232)))

(declare-fun b!485311 () Bool)

(declare-fun contains!2667 (List!9200 tuple2!9184) Bool)

(assert (=> b!485311 (= e!285735 (contains!2667 lt!219535 (tuple2!9185 key!251 value!166)))))

(assert (= (and d!77371 c!58412) b!485306))

(assert (= (and d!77371 (not c!58412)) b!485309))

(assert (= (and b!485309 c!58413) b!485304))

(assert (= (and b!485309 (not c!58413)) b!485310))

(assert (= (and b!485310 c!58414) b!485307))

(assert (= (and b!485310 (not c!58414)) b!485302))

(assert (= (or b!485307 b!485302) bm!31229))

(assert (= (or b!485304 bm!31229) bm!31230))

(assert (= (or b!485306 bm!31230) bm!31228))

(assert (= (and bm!31228 c!58415) b!485303))

(assert (= (and bm!31228 (not c!58415)) b!485305))

(assert (= (and d!77371 res!289033) b!485308))

(assert (= (and b!485308 res!289032) b!485311))

(declare-fun m!465711 () Bool)

(assert (=> b!485311 m!465711))

(declare-fun m!465713 () Bool)

(assert (=> bm!31228 m!465713))

(declare-fun m!465715 () Bool)

(assert (=> d!77371 m!465715))

(assert (=> d!77371 m!465677))

(declare-fun m!465717 () Bool)

(assert (=> b!485308 m!465717))

(declare-fun m!465719 () Bool)

(assert (=> b!485303 m!465719))

(assert (=> b!485207 d!77371))

(declare-fun d!77385 () Bool)

(declare-fun size!15459 (List!9200) Int)

(assert (=> d!77385 (= (length!16 lt!219526) (size!15459 lt!219526))))

(declare-fun bs!15474 () Bool)

(assert (= bs!15474 d!77385))

(declare-fun m!465721 () Bool)

(assert (=> bs!15474 m!465721))

(assert (=> b!485208 d!77385))

(declare-fun d!77387 () Bool)

(assert (=> d!77387 (= (length!16 l!956) (size!15459 l!956))))

(declare-fun bs!15475 () Bool)

(assert (= bs!15475 d!77387))

(declare-fun m!465725 () Bool)

(assert (=> bs!15475 m!465725))

(assert (=> b!485208 d!77387))

(declare-fun d!77391 () Bool)

(declare-fun res!289054 () Bool)

(declare-fun e!285759 () Bool)

(assert (=> d!77391 (=> res!289054 e!285759)))

(assert (=> d!77391 (= res!289054 (or (is-Nil!9197 l!956) (is-Nil!9197 (t!15417 l!956))))))

(assert (=> d!77391 (= (isStrictlySorted!425 l!956) e!285759)))

(declare-fun b!485337 () Bool)

(declare-fun e!285760 () Bool)

(assert (=> b!485337 (= e!285759 e!285760)))

(declare-fun res!289055 () Bool)

(assert (=> b!485337 (=> (not res!289055) (not e!285760))))

(assert (=> b!485337 (= res!289055 (bvslt (_1!4603 (h!10052 l!956)) (_1!4603 (h!10052 (t!15417 l!956)))))))

(declare-fun b!485338 () Bool)

(assert (=> b!485338 (= e!285760 (isStrictlySorted!425 (t!15417 l!956)))))

(assert (= (and d!77391 (not res!289054)) b!485337))

(assert (= (and b!485337 res!289055) b!485338))

(declare-fun m!465729 () Bool)

(assert (=> b!485338 m!465729))

(assert (=> start!43972 d!77391))

(declare-fun b!485347 () Bool)

(declare-fun e!285765 () Bool)

(declare-fun tp!43612 () Bool)

(assert (=> b!485347 (= e!285765 (and tp_is_empty!13973 tp!43612))))

(assert (=> b!485209 (= tp!43606 e!285765)))

(assert (= (and b!485209 (is-Cons!9196 (t!15417 l!956))) b!485347))

(push 1)

(assert (not b!485311))

(assert (not b!485347))

(assert (not b!485338))

(assert (not b!485303))

(assert (not d!77371))

(assert tp_is_empty!13973)

(assert (not b!485308))

(assert (not b!485221))

(assert (not d!77385))

(assert (not d!77387))

(assert (not bm!31228))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77393 () Bool)

(declare-fun lt!219538 () Int)

(assert (=> d!77393 (>= lt!219538 0)))

(declare-fun e!285771 () Int)

(assert (=> d!77393 (= lt!219538 e!285771)))

(declare-fun c!58418 () Bool)

(assert (=> d!77393 (= c!58418 (is-Nil!9197 lt!219526))))

(assert (=> d!77393 (= (size!15459 lt!219526) lt!219538)))

(declare-fun b!485355 () Bool)

(assert (=> b!485355 (= e!285771 0)))

(declare-fun b!485356 () Bool)

(assert (=> b!485356 (= e!285771 (+ 1 (size!15459 (t!15417 lt!219526))))))

(assert (= (and d!77393 c!58418) b!485355))

(assert (= (and d!77393 (not c!58418)) b!485356))

(declare-fun m!465733 () Bool)

(assert (=> b!485356 m!465733))

(assert (=> d!77385 d!77393))

(declare-fun d!77395 () Bool)

(declare-fun res!289058 () Bool)

(declare-fun e!285772 () Bool)

(assert (=> d!77395 (=> res!289058 e!285772)))

(assert (=> d!77395 (= res!289058 (and (is-Cons!9196 lt!219535) (= (_1!4603 (h!10052 lt!219535)) key!251)))))

(assert (=> d!77395 (= (containsKey!400 lt!219535 key!251) e!285772)))

(declare-fun b!485357 () Bool)

(declare-fun e!285773 () Bool)

(assert (=> b!485357 (= e!285772 e!285773)))

(declare-fun res!289059 () Bool)

(assert (=> b!485357 (=> (not res!289059) (not e!285773))))

(assert (=> b!485357 (= res!289059 (and (or (not (is-Cons!9196 lt!219535)) (bvsle (_1!4603 (h!10052 lt!219535)) key!251)) (is-Cons!9196 lt!219535) (bvslt (_1!4603 (h!10052 lt!219535)) key!251)))))

(declare-fun b!485358 () Bool)

(assert (=> b!485358 (= e!285773 (containsKey!400 (t!15417 lt!219535) key!251))))

(assert (= (and d!77395 (not res!289058)) b!485357))

(assert (= (and b!485357 res!289059) b!485358))

(declare-fun m!465735 () Bool)

(assert (=> b!485358 m!465735))

(assert (=> b!485308 d!77395))

(declare-fun d!77397 () Bool)

(declare-fun res!289060 () Bool)

(declare-fun e!285774 () Bool)

(assert (=> d!77397 (=> res!289060 e!285774)))

(assert (=> d!77397 (= res!289060 (or (is-Nil!9197 (t!15417 l!956)) (is-Nil!9197 (t!15417 (t!15417 l!956)))))))

(assert (=> d!77397 (= (isStrictlySorted!425 (t!15417 l!956)) e!285774)))

(declare-fun b!485359 () Bool)

(declare-fun e!285775 () Bool)

(assert (=> b!485359 (= e!285774 e!285775)))

(declare-fun res!289061 () Bool)

(assert (=> b!485359 (=> (not res!289061) (not e!285775))))

(assert (=> b!485359 (= res!289061 (bvslt (_1!4603 (h!10052 (t!15417 l!956))) (_1!4603 (h!10052 (t!15417 (t!15417 l!956))))))))

(declare-fun b!485360 () Bool)

(assert (=> b!485360 (= e!285775 (isStrictlySorted!425 (t!15417 (t!15417 l!956))))))

(assert (= (and d!77397 (not res!289060)) b!485359))

(assert (= (and b!485359 res!289061) b!485360))

(declare-fun m!465737 () Bool)

(assert (=> b!485360 m!465737))

(assert (=> b!485338 d!77397))

(declare-fun d!77399 () Bool)

(declare-fun lt!219539 () Int)

(assert (=> d!77399 (>= lt!219539 0)))

(declare-fun e!285776 () Int)

(assert (=> d!77399 (= lt!219539 e!285776)))

(declare-fun c!58419 () Bool)

(assert (=> d!77399 (= c!58419 (is-Nil!9197 l!956))))

(assert (=> d!77399 (= (size!15459 l!956) lt!219539)))

(declare-fun b!485361 () Bool)

(assert (=> b!485361 (= e!285776 0)))

(declare-fun b!485362 () Bool)

(assert (=> b!485362 (= e!285776 (+ 1 (size!15459 (t!15417 l!956))))))

(assert (= (and d!77399 c!58419) b!485361))

(assert (= (and d!77399 (not c!58419)) b!485362))

(declare-fun m!465739 () Bool)

(assert (=> b!485362 m!465739))

(assert (=> d!77387 d!77399))

(declare-fun d!77401 () Bool)

(declare-fun res!289062 () Bool)

(declare-fun e!285777 () Bool)

(assert (=> d!77401 (=> res!289062 e!285777)))

(assert (=> d!77401 (= res!289062 (or (is-Nil!9197 lt!219535) (is-Nil!9197 (t!15417 lt!219535))))))

(assert (=> d!77401 (= (isStrictlySorted!425 lt!219535) e!285777)))

(declare-fun b!485363 () Bool)

(declare-fun e!285778 () Bool)

(assert (=> b!485363 (= e!285777 e!285778)))

(declare-fun res!289063 () Bool)

(assert (=> b!485363 (=> (not res!289063) (not e!285778))))

(assert (=> b!485363 (= res!289063 (bvslt (_1!4603 (h!10052 lt!219535)) (_1!4603 (h!10052 (t!15417 lt!219535)))))))

(declare-fun b!485364 () Bool)

(assert (=> b!485364 (= e!285778 (isStrictlySorted!425 (t!15417 lt!219535)))))

(assert (= (and d!77401 (not res!289062)) b!485363))

(assert (= (and b!485363 res!289063) b!485364))

(declare-fun m!465741 () Bool)

(assert (=> b!485364 m!465741))

(assert (=> d!77371 d!77401))

(assert (=> d!77371 d!77391))

(declare-fun d!77403 () Bool)

(assert (=> d!77403 (= ($colon$colon!130 e!285732 (ite c!58412 (h!10052 l!956) (tuple2!9185 key!251 value!166))) (Cons!9196 (ite c!58412 (h!10052 l!956) (tuple2!9185 key!251 value!166)) e!285732))))

(assert (=> bm!31228 d!77403))

(declare-fun d!77405 () Bool)

(declare-fun res!289064 () Bool)

(declare-fun e!285779 () Bool)

(assert (=> d!77405 (=> res!289064 e!285779)))

(assert (=> d!77405 (= res!289064 (and (is-Cons!9196 (t!15417 l!956)) (= (_1!4603 (h!10052 (t!15417 l!956))) key!251)))))

(assert (=> d!77405 (= (containsKey!400 (t!15417 l!956) key!251) e!285779)))

(declare-fun b!485365 () Bool)

(declare-fun e!285780 () Bool)

(assert (=> b!485365 (= e!285779 e!285780)))

(declare-fun res!289065 () Bool)

(assert (=> b!485365 (=> (not res!289065) (not e!285780))))

(assert (=> b!485365 (= res!289065 (and (or (not (is-Cons!9196 (t!15417 l!956))) (bvsle (_1!4603 (h!10052 (t!15417 l!956))) key!251)) (is-Cons!9196 (t!15417 l!956)) (bvslt (_1!4603 (h!10052 (t!15417 l!956))) key!251)))))

(declare-fun b!485366 () Bool)

(assert (=> b!485366 (= e!285780 (containsKey!400 (t!15417 (t!15417 l!956)) key!251))))

(assert (= (and d!77405 (not res!289064)) b!485365))

(assert (= (and b!485365 res!289065) b!485366))

(declare-fun m!465743 () Bool)

(assert (=> b!485366 m!465743))

(assert (=> b!485221 d!77405))

(declare-fun b!485367 () Bool)

(declare-fun e!285781 () List!9200)

(declare-fun call!31236 () List!9200)

(assert (=> b!485367 (= e!285781 call!31236)))

(declare-fun d!77407 () Bool)

(declare-fun e!285785 () Bool)

(assert (=> d!77407 e!285785))

(declare-fun res!289067 () Bool)

(assert (=> d!77407 (=> (not res!289067) (not e!285785))))

(declare-fun lt!219540 () List!9200)

(assert (=> d!77407 (= res!289067 (isStrictlySorted!425 lt!219540))))

(declare-fun e!285783 () List!9200)

(assert (=> d!77407 (= lt!219540 e!285783)))

(declare-fun c!58420 () Bool)

(assert (=> d!77407 (= c!58420 (and (is-Cons!9196 (t!15417 l!956)) (bvslt (_1!4603 (h!10052 (t!15417 l!956))) key!251)))))

(assert (=> d!77407 (isStrictlySorted!425 (t!15417 l!956))))

(assert (=> d!77407 (= (insertStrictlySorted!253 (t!15417 l!956) key!251 value!166) lt!219540)))

(declare-fun b!485368 () Bool)

(declare-fun e!285782 () List!9200)

(assert (=> b!485368 (= e!285782 (insertStrictlySorted!253 (t!15417 (t!15417 l!956)) key!251 value!166))))

(declare-fun b!485369 () Bool)

(declare-fun e!285784 () List!9200)

(declare-fun call!31234 () List!9200)

(assert (=> b!485369 (= e!285784 call!31234)))

(declare-fun c!58422 () Bool)

(declare-fun c!58421 () Bool)

(declare-fun b!485370 () Bool)

(assert (=> b!485370 (= e!285782 (ite c!58421 (t!15417 (t!15417 l!956)) (ite c!58422 (Cons!9196 (h!10052 (t!15417 l!956)) (t!15417 (t!15417 l!956))) Nil!9197)))))

(declare-fun b!485371 () Bool)

(declare-fun call!31235 () List!9200)

(assert (=> b!485371 (= e!285783 call!31235)))

(declare-fun bm!31231 () Bool)

(assert (=> bm!31231 (= call!31235 ($colon$colon!130 e!285782 (ite c!58420 (h!10052 (t!15417 l!956)) (tuple2!9185 key!251 value!166))))))

(declare-fun c!58423 () Bool)

(assert (=> bm!31231 (= c!58423 c!58420)))

(declare-fun bm!31232 () Bool)

(assert (=> bm!31232 (= call!31236 call!31234)))

(declare-fun b!485372 () Bool)

(assert (=> b!485372 (= e!285781 call!31236)))

(declare-fun b!485373 () Bool)

(declare-fun res!289066 () Bool)

(assert (=> b!485373 (=> (not res!289066) (not e!285785))))

(assert (=> b!485373 (= res!289066 (containsKey!400 lt!219540 key!251))))

(declare-fun b!485374 () Bool)

(assert (=> b!485374 (= e!285783 e!285784)))

(assert (=> b!485374 (= c!58421 (and (is-Cons!9196 (t!15417 l!956)) (= (_1!4603 (h!10052 (t!15417 l!956))) key!251)))))

(declare-fun b!485375 () Bool)

(assert (=> b!485375 (= c!58422 (and (is-Cons!9196 (t!15417 l!956)) (bvsgt (_1!4603 (h!10052 (t!15417 l!956))) key!251)))))

(assert (=> b!485375 (= e!285784 e!285781)))

(declare-fun bm!31233 () Bool)

(assert (=> bm!31233 (= call!31234 call!31235)))

(declare-fun b!485376 () Bool)

(assert (=> b!485376 (= e!285785 (contains!2667 lt!219540 (tuple2!9185 key!251 value!166)))))

(assert (= (and d!77407 c!58420) b!485371))

(assert (= (and d!77407 (not c!58420)) b!485374))

(assert (= (and b!485374 c!58421) b!485369))

(assert (= (and b!485374 (not c!58421)) b!485375))

(assert (= (and b!485375 c!58422) b!485372))

(assert (= (and b!485375 (not c!58422)) b!485367))

(assert (= (or b!485372 b!485367) bm!31232))

(assert (= (or b!485369 bm!31232) bm!31233))

(assert (= (or b!485371 bm!31233) bm!31231))

(assert (= (and bm!31231 c!58423) b!485368))

(assert (= (and bm!31231 (not c!58423)) b!485370))

(assert (= (and d!77407 res!289067) b!485373))

(assert (= (and b!485373 res!289066) b!485376))

(declare-fun m!465745 () Bool)

(assert (=> b!485376 m!465745))

(declare-fun m!465747 () Bool)

(assert (=> bm!31231 m!465747))

(declare-fun m!465749 () Bool)

(assert (=> d!77407 m!465749))

(assert (=> d!77407 m!465729))

(declare-fun m!465751 () Bool)

(assert (=> b!485373 m!465751))

(declare-fun m!465753 () Bool)

(assert (=> b!485368 m!465753))

(assert (=> b!485303 d!77407))

(declare-fun d!77409 () Bool)

(declare-fun lt!219543 () Bool)

(declare-fun content!219 (List!9200) (Set tuple2!9184))

(assert (=> d!77409 (= lt!219543 (set.member (tuple2!9185 key!251 value!166) (content!219 lt!219535)))))

(declare-fun e!285790 () Bool)

(assert (=> d!77409 (= lt!219543 e!285790)))

(declare-fun res!289072 () Bool)

(assert (=> d!77409 (=> (not res!289072) (not e!285790))))

(assert (=> d!77409 (= res!289072 (is-Cons!9196 lt!219535))))

(assert (=> d!77409 (= (contains!2667 lt!219535 (tuple2!9185 key!251 value!166)) lt!219543)))

(declare-fun b!485381 () Bool)

(declare-fun e!285791 () Bool)

(assert (=> b!485381 (= e!285790 e!285791)))

(declare-fun res!289073 () Bool)

(assert (=> b!485381 (=> res!289073 e!285791)))

(assert (=> b!485381 (= res!289073 (= (h!10052 lt!219535) (tuple2!9185 key!251 value!166)))))

(declare-fun b!485382 () Bool)

(assert (=> b!485382 (= e!285791 (contains!2667 (t!15417 lt!219535) (tuple2!9185 key!251 value!166)))))

(assert (= (and d!77409 res!289072) b!485381))

(assert (= (and b!485381 (not res!289073)) b!485382))

(declare-fun m!465755 () Bool)

(assert (=> d!77409 m!465755))

(declare-fun m!465757 () Bool)

(assert (=> d!77409 m!465757))

(declare-fun m!465759 () Bool)

(assert (=> b!485382 m!465759))

(assert (=> b!485311 d!77409))

(declare-fun b!485383 () Bool)

(declare-fun e!285792 () Bool)

(declare-fun tp!43616 () Bool)

(assert (=> b!485383 (= e!285792 (and tp_is_empty!13973 tp!43616))))

(assert (=> b!485347 (= tp!43612 e!285792)))

(assert (= (and b!485347 (is-Cons!9196 (t!15417 (t!15417 l!956)))) b!485383))

(push 1)

(assert (not b!485383))

(assert (not b!485382))

(assert (not b!485376))

(assert (not b!485360))

(assert (not b!485373))

(assert (not d!77409))

(assert (not b!485362))

(assert (not b!485364))

(assert (not b!485366))

(assert (not b!485356))

(assert (not bm!31231))

(assert tp_is_empty!13973)

(assert (not b!485358))

(assert (not b!485368))

(assert (not d!77407))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

