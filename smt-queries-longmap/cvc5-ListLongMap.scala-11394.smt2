; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132560 () Bool)

(assert start!132560)

(declare-fun b!1554184 () Bool)

(declare-fun res!1063679 () Bool)

(declare-fun e!865399 () Bool)

(assert (=> b!1554184 (=> (not res!1063679) (not e!865399))))

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1554184 (= res!1063679 (not (= a0!49 a!523)))))

(declare-fun b!1554185 () Bool)

(declare-datatypes ((B!2240 0))(
  ( (B!2241 (val!19206 Int)) )
))
(declare-datatypes ((tuple2!24788 0))(
  ( (tuple2!24789 (_1!12405 (_ BitVec 64)) (_2!12405 B!2240)) )
))
(declare-datatypes ((List!36240 0))(
  ( (Nil!36237) (Cons!36236 (h!37682 tuple2!24788) (t!50961 List!36240)) )
))
(declare-datatypes ((ListLongMap!22397 0))(
  ( (ListLongMap!22398 (toList!11214 List!36240)) )
))
(declare-fun lm!249 () ListLongMap!22397)

(declare-fun lt!669956 () List!36240)

(declare-fun e!865398 () Bool)

(declare-datatypes ((Option!827 0))(
  ( (Some!826 (v!22011 B!2240)) (None!825) )
))
(declare-fun getValueByKey!751 (List!36240 (_ BitVec 64)) Option!827)

(assert (=> b!1554185 (= e!865398 (= (getValueByKey!751 lt!669956 a0!49) (getValueByKey!751 (toList!11214 lm!249) a0!49)))))

(declare-fun b!1554186 () Bool)

(declare-fun res!1063681 () Bool)

(assert (=> b!1554186 (=> (not res!1063681) (not e!865399))))

(declare-fun containsKey!773 (List!36240 (_ BitVec 64)) Bool)

(assert (=> b!1554186 (= res!1063681 (containsKey!773 (toList!11214 lm!249) a0!49))))

(declare-fun b!1554187 () Bool)

(declare-fun e!865400 () Bool)

(declare-fun tp!112182 () Bool)

(assert (=> b!1554187 (= e!865400 tp!112182)))

(declare-fun res!1063680 () Bool)

(assert (=> start!132560 (=> (not res!1063680) (not e!865399))))

(declare-fun contains!10159 (ListLongMap!22397 (_ BitVec 64)) Bool)

(assert (=> start!132560 (= res!1063680 (contains!10159 lm!249 a0!49))))

(assert (=> start!132560 e!865399))

(declare-fun inv!57343 (ListLongMap!22397) Bool)

(assert (=> start!132560 (and (inv!57343 lm!249) e!865400)))

(assert (=> start!132560 true))

(declare-fun tp_is_empty!38251 () Bool)

(assert (=> start!132560 tp_is_empty!38251))

(declare-fun b!1554188 () Bool)

(declare-fun isStrictlySorted!902 (List!36240) Bool)

(assert (=> b!1554188 (= e!865399 (not (isStrictlySorted!902 (toList!11214 lm!249))))))

(assert (=> b!1554188 e!865398))

(declare-fun res!1063678 () Bool)

(assert (=> b!1554188 (=> (not res!1063678) (not e!865398))))

(assert (=> b!1554188 (= res!1063678 (containsKey!773 lt!669956 a0!49))))

(declare-fun b!96 () B!2240)

(declare-fun insertStrictlySorted!513 (List!36240 (_ BitVec 64) B!2240) List!36240)

(assert (=> b!1554188 (= lt!669956 (insertStrictlySorted!513 (toList!11214 lm!249) a!523 b!96))))

(declare-datatypes ((Unit!51785 0))(
  ( (Unit!51786) )
))
(declare-fun lt!669955 () Unit!51785)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!10 (List!36240 (_ BitVec 64) B!2240 (_ BitVec 64)) Unit!51785)

(assert (=> b!1554188 (= lt!669955 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!10 (toList!11214 lm!249) a!523 b!96 a0!49))))

(assert (= (and start!132560 res!1063680) b!1554184))

(assert (= (and b!1554184 res!1063679) b!1554186))

(assert (= (and b!1554186 res!1063681) b!1554188))

(assert (= (and b!1554188 res!1063678) b!1554185))

(assert (= start!132560 b!1554187))

(declare-fun m!1432629 () Bool)

(assert (=> b!1554185 m!1432629))

(declare-fun m!1432631 () Bool)

(assert (=> b!1554185 m!1432631))

(declare-fun m!1432633 () Bool)

(assert (=> b!1554186 m!1432633))

(declare-fun m!1432635 () Bool)

(assert (=> start!132560 m!1432635))

(declare-fun m!1432637 () Bool)

(assert (=> start!132560 m!1432637))

(declare-fun m!1432639 () Bool)

(assert (=> b!1554188 m!1432639))

(declare-fun m!1432641 () Bool)

(assert (=> b!1554188 m!1432641))

(declare-fun m!1432643 () Bool)

(assert (=> b!1554188 m!1432643))

(declare-fun m!1432645 () Bool)

(assert (=> b!1554188 m!1432645))

(push 1)

(assert tp_is_empty!38251)

(assert (not b!1554188))

(assert (not start!132560))

(assert (not b!1554187))

(assert (not b!1554186))

(assert (not b!1554185))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!161705 () Bool)

(declare-fun e!865447 () Bool)

(assert (=> d!161705 e!865447))

(declare-fun res!1063732 () Bool)

(assert (=> d!161705 (=> res!1063732 e!865447)))

(declare-fun lt!669980 () Bool)

(assert (=> d!161705 (= res!1063732 (not lt!669980))))

(declare-fun lt!669979 () Bool)

(assert (=> d!161705 (= lt!669980 lt!669979)))

(declare-fun lt!669977 () Unit!51785)

(declare-fun e!865448 () Unit!51785)

(assert (=> d!161705 (= lt!669977 e!865448)))

(declare-fun c!143354 () Bool)

(assert (=> d!161705 (= c!143354 lt!669979)))

(assert (=> d!161705 (= lt!669979 (containsKey!773 (toList!11214 lm!249) a0!49))))

(assert (=> d!161705 (= (contains!10159 lm!249 a0!49) lt!669980)))

(declare-fun b!1554249 () Bool)

(declare-fun lt!669978 () Unit!51785)

(assert (=> b!1554249 (= e!865448 lt!669978)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!516 (List!36240 (_ BitVec 64)) Unit!51785)

(assert (=> b!1554249 (= lt!669978 (lemmaContainsKeyImpliesGetValueByKeyDefined!516 (toList!11214 lm!249) a0!49))))

(declare-fun isDefined!564 (Option!827) Bool)

(assert (=> b!1554249 (isDefined!564 (getValueByKey!751 (toList!11214 lm!249) a0!49))))

(declare-fun b!1554250 () Bool)

(declare-fun Unit!51791 () Unit!51785)

(assert (=> b!1554250 (= e!865448 Unit!51791)))

(declare-fun b!1554251 () Bool)

(assert (=> b!1554251 (= e!865447 (isDefined!564 (getValueByKey!751 (toList!11214 lm!249) a0!49)))))

(assert (= (and d!161705 c!143354) b!1554249))

(assert (= (and d!161705 (not c!143354)) b!1554250))

(assert (= (and d!161705 (not res!1063732)) b!1554251))

(assert (=> d!161705 m!1432633))

(declare-fun m!1432691 () Bool)

(assert (=> b!1554249 m!1432691))

(assert (=> b!1554249 m!1432631))

(assert (=> b!1554249 m!1432631))

(declare-fun m!1432693 () Bool)

(assert (=> b!1554249 m!1432693))

(assert (=> b!1554251 m!1432631))

(assert (=> b!1554251 m!1432631))

(assert (=> b!1554251 m!1432693))

(assert (=> start!132560 d!161705))

(declare-fun d!161715 () Bool)

(assert (=> d!161715 (= (inv!57343 lm!249) (isStrictlySorted!902 (toList!11214 lm!249)))))

(declare-fun bs!44681 () Bool)

(assert (= bs!44681 d!161715))

(assert (=> bs!44681 m!1432639))

(assert (=> start!132560 d!161715))

(declare-fun d!161717 () Bool)

(declare-fun res!1063737 () Bool)

(declare-fun e!865453 () Bool)

(assert (=> d!161717 (=> res!1063737 e!865453)))

(assert (=> d!161717 (= res!1063737 (or (is-Nil!36237 (toList!11214 lm!249)) (is-Nil!36237 (t!50961 (toList!11214 lm!249)))))))

(assert (=> d!161717 (= (isStrictlySorted!902 (toList!11214 lm!249)) e!865453)))

(declare-fun b!1554256 () Bool)

(declare-fun e!865454 () Bool)

(assert (=> b!1554256 (= e!865453 e!865454)))

(declare-fun res!1063738 () Bool)

(assert (=> b!1554256 (=> (not res!1063738) (not e!865454))))

(assert (=> b!1554256 (= res!1063738 (bvslt (_1!12405 (h!37682 (toList!11214 lm!249))) (_1!12405 (h!37682 (t!50961 (toList!11214 lm!249))))))))

(declare-fun b!1554257 () Bool)

(assert (=> b!1554257 (= e!865454 (isStrictlySorted!902 (t!50961 (toList!11214 lm!249))))))

(assert (= (and d!161717 (not res!1063737)) b!1554256))

(assert (= (and b!1554256 res!1063738) b!1554257))

(declare-fun m!1432695 () Bool)

(assert (=> b!1554257 m!1432695))

(assert (=> b!1554188 d!161717))

(declare-fun d!161719 () Bool)

(declare-fun res!1063743 () Bool)

(declare-fun e!865471 () Bool)

(assert (=> d!161719 (=> res!1063743 e!865471)))

(assert (=> d!161719 (= res!1063743 (and (is-Cons!36236 lt!669956) (= (_1!12405 (h!37682 lt!669956)) a0!49)))))

(assert (=> d!161719 (= (containsKey!773 lt!669956 a0!49) e!865471)))

(declare-fun b!1554286 () Bool)

(declare-fun e!865472 () Bool)

(assert (=> b!1554286 (= e!865471 e!865472)))

(declare-fun res!1063744 () Bool)

(assert (=> b!1554286 (=> (not res!1063744) (not e!865472))))

(assert (=> b!1554286 (= res!1063744 (and (or (not (is-Cons!36236 lt!669956)) (bvsle (_1!12405 (h!37682 lt!669956)) a0!49)) (is-Cons!36236 lt!669956) (bvslt (_1!12405 (h!37682 lt!669956)) a0!49)))))

(declare-fun b!1554287 () Bool)

(assert (=> b!1554287 (= e!865472 (containsKey!773 (t!50961 lt!669956) a0!49))))

(assert (= (and d!161719 (not res!1063743)) b!1554286))

(assert (= (and b!1554286 res!1063744) b!1554287))

(declare-fun m!1432697 () Bool)

(assert (=> b!1554287 m!1432697))

(assert (=> b!1554188 d!161719))

(declare-fun bm!71422 () Bool)

(declare-fun call!71427 () List!36240)

(declare-fun call!71425 () List!36240)

(assert (=> bm!71422 (= call!71427 call!71425)))

(declare-fun b!1554358 () Bool)

(declare-fun e!865516 () Bool)

(declare-fun lt!669995 () List!36240)

(declare-fun contains!10163 (List!36240 tuple2!24788) Bool)

(assert (=> b!1554358 (= e!865516 (contains!10163 lt!669995 (tuple2!24789 a!523 b!96)))))

(declare-fun b!1554359 () Bool)

(declare-fun e!865515 () List!36240)

(assert (=> b!1554359 (= e!865515 call!71427)))

(declare-fun b!1554360 () Bool)

(assert (=> b!1554360 (= e!865515 call!71427)))

(declare-fun b!1554361 () Bool)

(declare-fun c!143388 () Bool)

(assert (=> b!1554361 (= c!143388 (and (is-Cons!36236 (toList!11214 lm!249)) (bvsgt (_1!12405 (h!37682 (toList!11214 lm!249))) a!523)))))

(declare-fun e!865517 () List!36240)

(assert (=> b!1554361 (= e!865517 e!865515)))

(declare-fun d!161721 () Bool)

(assert (=> d!161721 e!865516))

(declare-fun res!1063776 () Bool)

(assert (=> d!161721 (=> (not res!1063776) (not e!865516))))

(assert (=> d!161721 (= res!1063776 (isStrictlySorted!902 lt!669995))))

(declare-fun e!865518 () List!36240)

(assert (=> d!161721 (= lt!669995 e!865518)))

(declare-fun c!143390 () Bool)

(assert (=> d!161721 (= c!143390 (and (is-Cons!36236 (toList!11214 lm!249)) (bvslt (_1!12405 (h!37682 (toList!11214 lm!249))) a!523)))))

(assert (=> d!161721 (isStrictlySorted!902 (toList!11214 lm!249))))

(assert (=> d!161721 (= (insertStrictlySorted!513 (toList!11214 lm!249) a!523 b!96) lt!669995)))

(declare-fun call!71426 () List!36240)

(declare-fun e!865519 () List!36240)

(declare-fun bm!71423 () Bool)

(declare-fun $colon$colon!950 (List!36240 tuple2!24788) List!36240)

(assert (=> bm!71423 (= call!71426 ($colon$colon!950 e!865519 (ite c!143390 (h!37682 (toList!11214 lm!249)) (tuple2!24789 a!523 b!96))))))

(declare-fun c!143387 () Bool)

(assert (=> bm!71423 (= c!143387 c!143390)))

(declare-fun b!1554362 () Bool)

(declare-fun res!1063775 () Bool)

(assert (=> b!1554362 (=> (not res!1063775) (not e!865516))))

(assert (=> b!1554362 (= res!1063775 (containsKey!773 lt!669995 a!523))))

(declare-fun b!1554363 () Bool)

(assert (=> b!1554363 (= e!865518 e!865517)))

(declare-fun c!143389 () Bool)

(assert (=> b!1554363 (= c!143389 (and (is-Cons!36236 (toList!11214 lm!249)) (= (_1!12405 (h!37682 (toList!11214 lm!249))) a!523)))))

(declare-fun b!1554364 () Bool)

(assert (=> b!1554364 (= e!865518 call!71426)))

(declare-fun bm!71424 () Bool)

(assert (=> bm!71424 (= call!71425 call!71426)))

(declare-fun b!1554365 () Bool)

(assert (=> b!1554365 (= e!865519 (insertStrictlySorted!513 (t!50961 (toList!11214 lm!249)) a!523 b!96))))

(declare-fun b!1554366 () Bool)

(assert (=> b!1554366 (= e!865519 (ite c!143389 (t!50961 (toList!11214 lm!249)) (ite c!143388 (Cons!36236 (h!37682 (toList!11214 lm!249)) (t!50961 (toList!11214 lm!249))) Nil!36237)))))

(declare-fun b!1554367 () Bool)

(assert (=> b!1554367 (= e!865517 call!71425)))

(assert (= (and d!161721 c!143390) b!1554364))

(assert (= (and d!161721 (not c!143390)) b!1554363))

(assert (= (and b!1554363 c!143389) b!1554367))

(assert (= (and b!1554363 (not c!143389)) b!1554361))

(assert (= (and b!1554361 c!143388) b!1554359))

(assert (= (and b!1554361 (not c!143388)) b!1554360))

(assert (= (or b!1554359 b!1554360) bm!71422))

(assert (= (or b!1554367 bm!71422) bm!71424))

(assert (= (or b!1554364 bm!71424) bm!71423))

(assert (= (and bm!71423 c!143387) b!1554365))

(assert (= (and bm!71423 (not c!143387)) b!1554366))

(assert (= (and d!161721 res!1063776) b!1554362))

(assert (= (and b!1554362 res!1063775) b!1554358))

(declare-fun m!1432733 () Bool)

(assert (=> b!1554358 m!1432733))

(declare-fun m!1432735 () Bool)

(assert (=> b!1554365 m!1432735))

(declare-fun m!1432737 () Bool)

(assert (=> d!161721 m!1432737))

(assert (=> d!161721 m!1432639))

(declare-fun m!1432739 () Bool)

(assert (=> bm!71423 m!1432739))

(declare-fun m!1432741 () Bool)

(assert (=> b!1554362 m!1432741))

(assert (=> b!1554188 d!161721))

(declare-fun d!161733 () Bool)

(declare-fun e!865536 () Bool)

(assert (=> d!161733 e!865536))

(declare-fun res!1063788 () Bool)

(assert (=> d!161733 (=> (not res!1063788) (not e!865536))))

(assert (=> d!161733 (= res!1063788 (= (containsKey!773 (insertStrictlySorted!513 (toList!11214 lm!249) a!523 b!96) a0!49) (containsKey!773 (toList!11214 lm!249) a0!49)))))

(declare-fun lt!670022 () Unit!51785)

(declare-fun choose!2047 (List!36240 (_ BitVec 64) B!2240 (_ BitVec 64)) Unit!51785)

(assert (=> d!161733 (= lt!670022 (choose!2047 (toList!11214 lm!249) a!523 b!96 a0!49))))

(declare-fun e!865537 () Bool)

(assert (=> d!161733 e!865537))

(declare-fun res!1063787 () Bool)

(assert (=> d!161733 (=> (not res!1063787) (not e!865537))))

(assert (=> d!161733 (= res!1063787 (isStrictlySorted!902 (toList!11214 lm!249)))))

(assert (=> d!161733 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!10 (toList!11214 lm!249) a!523 b!96 a0!49) lt!670022)))

(declare-fun b!1554390 () Bool)

(assert (=> b!1554390 (= e!865537 (not (= a!523 a0!49)))))

(declare-fun b!1554391 () Bool)

(assert (=> b!1554391 (= e!865536 (= (getValueByKey!751 (insertStrictlySorted!513 (toList!11214 lm!249) a!523 b!96) a0!49) (getValueByKey!751 (toList!11214 lm!249) a0!49)))))

(assert (= (and d!161733 res!1063787) b!1554390))

(assert (= (and d!161733 res!1063788) b!1554391))

(assert (=> d!161733 m!1432643))

(assert (=> d!161733 m!1432639))

(declare-fun m!1432751 () Bool)

(assert (=> d!161733 m!1432751))

(assert (=> d!161733 m!1432643))

(declare-fun m!1432753 () Bool)

(assert (=> d!161733 m!1432753))

(assert (=> d!161733 m!1432633))

(assert (=> b!1554391 m!1432643))

(assert (=> b!1554391 m!1432643))

(declare-fun m!1432755 () Bool)

(assert (=> b!1554391 m!1432755))

(assert (=> b!1554391 m!1432631))

(assert (=> b!1554188 d!161733))

(declare-fun d!161743 () Bool)

(declare-fun res!1063791 () Bool)

(declare-fun e!865540 () Bool)

(assert (=> d!161743 (=> res!1063791 e!865540)))

(assert (=> d!161743 (= res!1063791 (and (is-Cons!36236 (toList!11214 lm!249)) (= (_1!12405 (h!37682 (toList!11214 lm!249))) a0!49)))))

(assert (=> d!161743 (= (containsKey!773 (toList!11214 lm!249) a0!49) e!865540)))

(declare-fun b!1554394 () Bool)

(declare-fun e!865541 () Bool)

(assert (=> b!1554394 (= e!865540 e!865541)))

(declare-fun res!1063792 () Bool)

(assert (=> b!1554394 (=> (not res!1063792) (not e!865541))))

(assert (=> b!1554394 (= res!1063792 (and (or (not (is-Cons!36236 (toList!11214 lm!249))) (bvsle (_1!12405 (h!37682 (toList!11214 lm!249))) a0!49)) (is-Cons!36236 (toList!11214 lm!249)) (bvslt (_1!12405 (h!37682 (toList!11214 lm!249))) a0!49)))))

(declare-fun b!1554395 () Bool)

(assert (=> b!1554395 (= e!865541 (containsKey!773 (t!50961 (toList!11214 lm!249)) a0!49))))

(assert (= (and d!161743 (not res!1063791)) b!1554394))

(assert (= (and b!1554394 res!1063792) b!1554395))

(declare-fun m!1432759 () Bool)

(assert (=> b!1554395 m!1432759))

(assert (=> b!1554186 d!161743))

(declare-fun b!1554434 () Bool)

(declare-fun e!865561 () Option!827)

(assert (=> b!1554434 (= e!865561 (getValueByKey!751 (t!50961 lt!669956) a0!49))))

(declare-fun b!1554432 () Bool)

(declare-fun e!865560 () Option!827)

(assert (=> b!1554432 (= e!865560 (Some!826 (_2!12405 (h!37682 lt!669956))))))

(declare-fun d!161747 () Bool)

(declare-fun c!143415 () Bool)

(assert (=> d!161747 (= c!143415 (and (is-Cons!36236 lt!669956) (= (_1!12405 (h!37682 lt!669956)) a0!49)))))

(assert (=> d!161747 (= (getValueByKey!751 lt!669956 a0!49) e!865560)))

(declare-fun b!1554435 () Bool)

(assert (=> b!1554435 (= e!865561 None!825)))

(declare-fun b!1554433 () Bool)

(assert (=> b!1554433 (= e!865560 e!865561)))

(declare-fun c!143416 () Bool)

(assert (=> b!1554433 (= c!143416 (and (is-Cons!36236 lt!669956) (not (= (_1!12405 (h!37682 lt!669956)) a0!49))))))

(assert (= (and d!161747 c!143415) b!1554432))

(assert (= (and d!161747 (not c!143415)) b!1554433))

(assert (= (and b!1554433 c!143416) b!1554434))

(assert (= (and b!1554433 (not c!143416)) b!1554435))

(declare-fun m!1432767 () Bool)

(assert (=> b!1554434 m!1432767))

(assert (=> b!1554185 d!161747))

(declare-fun b!1554446 () Bool)

(declare-fun e!865567 () Option!827)

(assert (=> b!1554446 (= e!865567 (getValueByKey!751 (t!50961 (toList!11214 lm!249)) a0!49))))

(declare-fun b!1554444 () Bool)

(declare-fun e!865566 () Option!827)

(assert (=> b!1554444 (= e!865566 (Some!826 (_2!12405 (h!37682 (toList!11214 lm!249)))))))

(declare-fun d!161753 () Bool)

(declare-fun c!143419 () Bool)

(assert (=> d!161753 (= c!143419 (and (is-Cons!36236 (toList!11214 lm!249)) (= (_1!12405 (h!37682 (toList!11214 lm!249))) a0!49)))))

(assert (=> d!161753 (= (getValueByKey!751 (toList!11214 lm!249) a0!49) e!865566)))

(declare-fun b!1554447 () Bool)

(assert (=> b!1554447 (= e!865567 None!825)))

(declare-fun b!1554445 () Bool)

(assert (=> b!1554445 (= e!865566 e!865567)))

(declare-fun c!143420 () Bool)

(assert (=> b!1554445 (= c!143420 (and (is-Cons!36236 (toList!11214 lm!249)) (not (= (_1!12405 (h!37682 (toList!11214 lm!249))) a0!49))))))

(assert (= (and d!161753 c!143419) b!1554444))

(assert (= (and d!161753 (not c!143419)) b!1554445))

(assert (= (and b!1554445 c!143420) b!1554446))

(assert (= (and b!1554445 (not c!143420)) b!1554447))

(declare-fun m!1432771 () Bool)

(assert (=> b!1554446 m!1432771))

(assert (=> b!1554185 d!161753))

(declare-fun b!1554458 () Bool)

(declare-fun e!865574 () Bool)

(declare-fun tp!112197 () Bool)

(assert (=> b!1554458 (= e!865574 (and tp_is_empty!38251 tp!112197))))

(assert (=> b!1554187 (= tp!112182 e!865574)))

(assert (= (and b!1554187 (is-Cons!36236 (toList!11214 lm!249))) b!1554458))

(push 1)

(assert (not b!1554287))

(assert (not d!161721))

(assert tp_is_empty!38251)

(assert (not b!1554434))

(assert (not b!1554257))

(assert (not b!1554446))

(assert (not bm!71423))

(assert (not b!1554362))

(assert (not d!161733))

(assert (not d!161705))

(assert (not b!1554249))

(assert (not b!1554251))

(assert (not b!1554365))

(assert (not b!1554395))

(assert (not b!1554391))

(assert (not b!1554458))

(assert (not b!1554358))

(assert (not d!161715))

(check-sat)

(pop 1)

