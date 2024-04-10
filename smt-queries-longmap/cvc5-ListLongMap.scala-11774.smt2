; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138230 () Bool)

(assert start!138230)

(declare-datatypes ((B!2984 0))(
  ( (B!2985 (val!19854 Int)) )
))
(declare-fun newValue!21 () B!2984)

(declare-datatypes ((tuple2!25876 0))(
  ( (tuple2!25877 (_1!12949 (_ BitVec 64)) (_2!12949 B!2984)) )
))
(declare-datatypes ((List!36974 0))(
  ( (Nil!36971) (Cons!36970 (h!38513 tuple2!25876) (t!51892 List!36974)) )
))
(declare-fun lt!677373 () List!36974)

(declare-fun e!885147 () Bool)

(declare-fun newKey!21 () (_ BitVec 64))

(declare-fun b!1585396 () Bool)

(declare-fun contains!10532 (List!36974 tuple2!25876) Bool)

(assert (=> b!1585396 (= e!885147 (not (contains!10532 lt!677373 (tuple2!25877 newKey!21 newValue!21))))))

(declare-fun b!1585397 () Bool)

(declare-fun e!885145 () Bool)

(assert (=> b!1585397 (= e!885145 e!885147)))

(declare-fun res!1082762 () Bool)

(assert (=> b!1585397 (=> res!1082762 e!885147)))

(declare-fun isStrictlySorted!1196 (List!36974) Bool)

(assert (=> b!1585397 (= res!1082762 (not (isStrictlySorted!1196 lt!677373)))))

(declare-fun l!556 () List!36974)

(declare-fun $colon$colon!1040 (List!36974 tuple2!25876) List!36974)

(declare-fun insertStrictlySorted!635 (List!36974 (_ BitVec 64) B!2984) List!36974)

(assert (=> b!1585397 (= lt!677373 ($colon$colon!1040 (insertStrictlySorted!635 (t!51892 l!556) newKey!21 newValue!21) (h!38513 l!556)))))

(declare-fun b!1585398 () Bool)

(declare-fun e!885146 () Bool)

(declare-fun tp_is_empty!39517 () Bool)

(declare-fun tp!115260 () Bool)

(assert (=> b!1585398 (= e!885146 (and tp_is_empty!39517 tp!115260))))

(declare-fun res!1082760 () Bool)

(assert (=> start!138230 (=> (not res!1082760) (not e!885145))))

(assert (=> start!138230 (= res!1082760 (isStrictlySorted!1196 l!556))))

(assert (=> start!138230 e!885145))

(assert (=> start!138230 e!885146))

(assert (=> start!138230 true))

(assert (=> start!138230 tp_is_empty!39517))

(declare-fun b!1585399 () Bool)

(declare-fun res!1082761 () Bool)

(assert (=> b!1585399 (=> res!1082761 e!885147)))

(declare-fun containsKey!1009 (List!36974 (_ BitVec 64)) Bool)

(assert (=> b!1585399 (= res!1082761 (not (containsKey!1009 lt!677373 newKey!21)))))

(declare-fun b!1585400 () Bool)

(declare-fun res!1082759 () Bool)

(assert (=> b!1585400 (=> (not res!1082759) (not e!885145))))

(assert (=> b!1585400 (= res!1082759 (and (is-Cons!36970 l!556) (bvslt (_1!12949 (h!38513 l!556)) newKey!21)))))

(assert (= (and start!138230 res!1082760) b!1585400))

(assert (= (and b!1585400 res!1082759) b!1585397))

(assert (= (and b!1585397 (not res!1082762)) b!1585399))

(assert (= (and b!1585399 (not res!1082761)) b!1585396))

(assert (= (and start!138230 (is-Cons!36970 l!556)) b!1585398))

(declare-fun m!1454229 () Bool)

(assert (=> b!1585396 m!1454229))

(declare-fun m!1454231 () Bool)

(assert (=> b!1585397 m!1454231))

(declare-fun m!1454233 () Bool)

(assert (=> b!1585397 m!1454233))

(assert (=> b!1585397 m!1454233))

(declare-fun m!1454235 () Bool)

(assert (=> b!1585397 m!1454235))

(declare-fun m!1454237 () Bool)

(assert (=> start!138230 m!1454237))

(declare-fun m!1454239 () Bool)

(assert (=> b!1585399 m!1454239))

(push 1)

(assert (not b!1585399))

(assert (not b!1585398))

(assert (not b!1585396))

(assert (not start!138230))

(assert (not b!1585397))

(assert tp_is_empty!39517)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167675 () Bool)

(declare-fun res!1082803 () Bool)

(declare-fun e!885182 () Bool)

(assert (=> d!167675 (=> res!1082803 e!885182)))

(assert (=> d!167675 (= res!1082803 (and (is-Cons!36970 lt!677373) (= (_1!12949 (h!38513 lt!677373)) newKey!21)))))

(assert (=> d!167675 (= (containsKey!1009 lt!677373 newKey!21) e!885182)))

(declare-fun b!1585447 () Bool)

(declare-fun e!885183 () Bool)

(assert (=> b!1585447 (= e!885182 e!885183)))

(declare-fun res!1082804 () Bool)

(assert (=> b!1585447 (=> (not res!1082804) (not e!885183))))

(assert (=> b!1585447 (= res!1082804 (and (or (not (is-Cons!36970 lt!677373)) (bvsle (_1!12949 (h!38513 lt!677373)) newKey!21)) (is-Cons!36970 lt!677373) (bvslt (_1!12949 (h!38513 lt!677373)) newKey!21)))))

(declare-fun b!1585448 () Bool)

(assert (=> b!1585448 (= e!885183 (containsKey!1009 (t!51892 lt!677373) newKey!21))))

(assert (= (and d!167675 (not res!1082803)) b!1585447))

(assert (= (and b!1585447 res!1082804) b!1585448))

(declare-fun m!1454269 () Bool)

(assert (=> b!1585448 m!1454269))

(assert (=> b!1585399 d!167675))

(declare-fun lt!677385 () Bool)

(declare-fun d!167679 () Bool)

(declare-fun content!865 (List!36974) (Set tuple2!25876))

(assert (=> d!167679 (= lt!677385 (set.member (tuple2!25877 newKey!21 newValue!21) (content!865 lt!677373)))))

(declare-fun e!885200 () Bool)

(assert (=> d!167679 (= lt!677385 e!885200)))

(declare-fun res!1082821 () Bool)

(assert (=> d!167679 (=> (not res!1082821) (not e!885200))))

(assert (=> d!167679 (= res!1082821 (is-Cons!36970 lt!677373))))

(assert (=> d!167679 (= (contains!10532 lt!677373 (tuple2!25877 newKey!21 newValue!21)) lt!677385)))

(declare-fun b!1585465 () Bool)

(declare-fun e!885201 () Bool)

(assert (=> b!1585465 (= e!885200 e!885201)))

(declare-fun res!1082822 () Bool)

(assert (=> b!1585465 (=> res!1082822 e!885201)))

(assert (=> b!1585465 (= res!1082822 (= (h!38513 lt!677373) (tuple2!25877 newKey!21 newValue!21)))))

(declare-fun b!1585466 () Bool)

(assert (=> b!1585466 (= e!885201 (contains!10532 (t!51892 lt!677373) (tuple2!25877 newKey!21 newValue!21)))))

(assert (= (and d!167679 res!1082821) b!1585465))

(assert (= (and b!1585465 (not res!1082822)) b!1585466))

(declare-fun m!1454279 () Bool)

(assert (=> d!167679 m!1454279))

(declare-fun m!1454281 () Bool)

(assert (=> d!167679 m!1454281))

(declare-fun m!1454283 () Bool)

(assert (=> b!1585466 m!1454283))

(assert (=> b!1585396 d!167679))

(declare-fun d!167689 () Bool)

(declare-fun res!1082831 () Bool)

(declare-fun e!885210 () Bool)

(assert (=> d!167689 (=> res!1082831 e!885210)))

(assert (=> d!167689 (= res!1082831 (or (is-Nil!36971 lt!677373) (is-Nil!36971 (t!51892 lt!677373))))))

(assert (=> d!167689 (= (isStrictlySorted!1196 lt!677373) e!885210)))

(declare-fun b!1585475 () Bool)

(declare-fun e!885211 () Bool)

(assert (=> b!1585475 (= e!885210 e!885211)))

(declare-fun res!1082832 () Bool)

(assert (=> b!1585475 (=> (not res!1082832) (not e!885211))))

(assert (=> b!1585475 (= res!1082832 (bvslt (_1!12949 (h!38513 lt!677373)) (_1!12949 (h!38513 (t!51892 lt!677373)))))))

(declare-fun b!1585476 () Bool)

(assert (=> b!1585476 (= e!885211 (isStrictlySorted!1196 (t!51892 lt!677373)))))

(assert (= (and d!167689 (not res!1082831)) b!1585475))

(assert (= (and b!1585475 res!1082832) b!1585476))

(declare-fun m!1454289 () Bool)

(assert (=> b!1585476 m!1454289))

(assert (=> b!1585397 d!167689))

(declare-fun d!167697 () Bool)

(assert (=> d!167697 (= ($colon$colon!1040 (insertStrictlySorted!635 (t!51892 l!556) newKey!21 newValue!21) (h!38513 l!556)) (Cons!36970 (h!38513 l!556) (insertStrictlySorted!635 (t!51892 l!556) newKey!21 newValue!21)))))

(assert (=> b!1585397 d!167697))

(declare-fun bm!72639 () Bool)

(declare-fun call!72642 () List!36974)

(declare-fun call!72644 () List!36974)

(assert (=> bm!72639 (= call!72642 call!72644)))

(declare-fun b!1585562 () Bool)

(declare-fun e!885257 () List!36974)

(assert (=> b!1585562 (= e!885257 call!72644)))

(declare-fun lt!677394 () List!36974)

(declare-fun e!885258 () Bool)

(declare-fun b!1585563 () Bool)

(assert (=> b!1585563 (= e!885258 (contains!10532 lt!677394 (tuple2!25877 newKey!21 newValue!21)))))

(declare-fun d!167699 () Bool)

(assert (=> d!167699 e!885258))

(declare-fun res!1082850 () Bool)

(assert (=> d!167699 (=> (not res!1082850) (not e!885258))))

(assert (=> d!167699 (= res!1082850 (isStrictlySorted!1196 lt!677394))))

(assert (=> d!167699 (= lt!677394 e!885257)))

(declare-fun c!147011 () Bool)

(assert (=> d!167699 (= c!147011 (and (is-Cons!36970 (t!51892 l!556)) (bvslt (_1!12949 (h!38513 (t!51892 l!556))) newKey!21)))))

(assert (=> d!167699 (isStrictlySorted!1196 (t!51892 l!556))))

(assert (=> d!167699 (= (insertStrictlySorted!635 (t!51892 l!556) newKey!21 newValue!21) lt!677394)))

(declare-fun e!885255 () List!36974)

(declare-fun bm!72640 () Bool)

(assert (=> bm!72640 (= call!72644 ($colon$colon!1040 e!885255 (ite c!147011 (h!38513 (t!51892 l!556)) (tuple2!25877 newKey!21 newValue!21))))))

(declare-fun c!147009 () Bool)

(assert (=> bm!72640 (= c!147009 c!147011)))

(declare-fun b!1585564 () Bool)

(assert (=> b!1585564 (= e!885255 (insertStrictlySorted!635 (t!51892 (t!51892 l!556)) newKey!21 newValue!21))))

(declare-fun b!1585565 () Bool)

(declare-fun c!147010 () Bool)

(assert (=> b!1585565 (= c!147010 (and (is-Cons!36970 (t!51892 l!556)) (bvsgt (_1!12949 (h!38513 (t!51892 l!556))) newKey!21)))))

(declare-fun e!885259 () List!36974)

(declare-fun e!885256 () List!36974)

(assert (=> b!1585565 (= e!885259 e!885256)))

(declare-fun b!1585566 () Bool)

(declare-fun call!72643 () List!36974)

(assert (=> b!1585566 (= e!885256 call!72643)))

(declare-fun bm!72641 () Bool)

(assert (=> bm!72641 (= call!72643 call!72642)))

(declare-fun b!1585567 () Bool)

(assert (=> b!1585567 (= e!885257 e!885259)))

(declare-fun c!147012 () Bool)

(assert (=> b!1585567 (= c!147012 (and (is-Cons!36970 (t!51892 l!556)) (= (_1!12949 (h!38513 (t!51892 l!556))) newKey!21)))))

(declare-fun b!1585568 () Bool)

(assert (=> b!1585568 (= e!885259 call!72642)))

(declare-fun b!1585569 () Bool)

(assert (=> b!1585569 (= e!885256 call!72643)))

(declare-fun b!1585570 () Bool)

(declare-fun res!1082849 () Bool)

(assert (=> b!1585570 (=> (not res!1082849) (not e!885258))))

(assert (=> b!1585570 (= res!1082849 (containsKey!1009 lt!677394 newKey!21))))

(declare-fun b!1585571 () Bool)

(assert (=> b!1585571 (= e!885255 (ite c!147012 (t!51892 (t!51892 l!556)) (ite c!147010 (Cons!36970 (h!38513 (t!51892 l!556)) (t!51892 (t!51892 l!556))) Nil!36971)))))

(assert (= (and d!167699 c!147011) b!1585562))

(assert (= (and d!167699 (not c!147011)) b!1585567))

(assert (= (and b!1585567 c!147012) b!1585568))

(assert (= (and b!1585567 (not c!147012)) b!1585565))

(assert (= (and b!1585565 c!147010) b!1585566))

(assert (= (and b!1585565 (not c!147010)) b!1585569))

(assert (= (or b!1585566 b!1585569) bm!72641))

(assert (= (or b!1585568 bm!72641) bm!72639))

(assert (= (or b!1585562 bm!72639) bm!72640))

(assert (= (and bm!72640 c!147009) b!1585564))

(assert (= (and bm!72640 (not c!147009)) b!1585571))

(assert (= (and d!167699 res!1082850) b!1585570))

(assert (= (and b!1585570 res!1082849) b!1585563))

(declare-fun m!1454311 () Bool)

(assert (=> bm!72640 m!1454311))

(declare-fun m!1454313 () Bool)

(assert (=> b!1585564 m!1454313))

(declare-fun m!1454315 () Bool)

(assert (=> b!1585563 m!1454315))

(declare-fun m!1454317 () Bool)

(assert (=> d!167699 m!1454317))

(declare-fun m!1454319 () Bool)

(assert (=> d!167699 m!1454319))

(declare-fun m!1454321 () Bool)

(assert (=> b!1585570 m!1454321))

(assert (=> b!1585397 d!167699))

(declare-fun d!167703 () Bool)

(declare-fun res!1082855 () Bool)

(declare-fun e!885264 () Bool)

(assert (=> d!167703 (=> res!1082855 e!885264)))

(assert (=> d!167703 (= res!1082855 (or (is-Nil!36971 l!556) (is-Nil!36971 (t!51892 l!556))))))

(assert (=> d!167703 (= (isStrictlySorted!1196 l!556) e!885264)))

(declare-fun b!1585576 () Bool)

(declare-fun e!885265 () Bool)

(assert (=> b!1585576 (= e!885264 e!885265)))

(declare-fun res!1082856 () Bool)

(assert (=> b!1585576 (=> (not res!1082856) (not e!885265))))

(assert (=> b!1585576 (= res!1082856 (bvslt (_1!12949 (h!38513 l!556)) (_1!12949 (h!38513 (t!51892 l!556)))))))

(declare-fun b!1585577 () Bool)

(assert (=> b!1585577 (= e!885265 (isStrictlySorted!1196 (t!51892 l!556)))))

(assert (= (and d!167703 (not res!1082855)) b!1585576))

(assert (= (and b!1585576 res!1082856) b!1585577))

(assert (=> b!1585577 m!1454319))

(assert (=> start!138230 d!167703))

(declare-fun b!1585584 () Bool)

(declare-fun e!885270 () Bool)

(declare-fun tp!115272 () Bool)

(assert (=> b!1585584 (= e!885270 (and tp_is_empty!39517 tp!115272))))

(assert (=> b!1585398 (= tp!115260 e!885270)))

(assert (= (and b!1585398 (is-Cons!36970 (t!51892 l!556))) b!1585584))

(push 1)

(assert (not b!1585448))

(assert (not b!1585577))

(assert (not b!1585563))

(assert (not b!1585564))

(assert (not b!1585584))

(assert (not d!167679))

(assert tp_is_empty!39517)

(assert (not b!1585570))

(assert (not b!1585476))

(assert (not bm!72640))

(assert (not d!167699))

(assert (not b!1585466))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167727 () Bool)

(declare-fun res!1082881 () Bool)

(declare-fun e!885303 () Bool)

(assert (=> d!167727 (=> res!1082881 e!885303)))

(assert (=> d!167727 (= res!1082881 (and (is-Cons!36970 (t!51892 lt!677373)) (= (_1!12949 (h!38513 (t!51892 lt!677373))) newKey!21)))))

(assert (=> d!167727 (= (containsKey!1009 (t!51892 lt!677373) newKey!21) e!885303)))

(declare-fun b!1585627 () Bool)

(declare-fun e!885304 () Bool)

(assert (=> b!1585627 (= e!885303 e!885304)))

(declare-fun res!1082882 () Bool)

(assert (=> b!1585627 (=> (not res!1082882) (not e!885304))))

(assert (=> b!1585627 (= res!1082882 (and (or (not (is-Cons!36970 (t!51892 lt!677373))) (bvsle (_1!12949 (h!38513 (t!51892 lt!677373))) newKey!21)) (is-Cons!36970 (t!51892 lt!677373)) (bvslt (_1!12949 (h!38513 (t!51892 lt!677373))) newKey!21)))))

(declare-fun b!1585628 () Bool)

(assert (=> b!1585628 (= e!885304 (containsKey!1009 (t!51892 (t!51892 lt!677373)) newKey!21))))

(assert (= (and d!167727 (not res!1082881)) b!1585627))

(assert (= (and b!1585627 res!1082882) b!1585628))

(declare-fun m!1454365 () Bool)

(assert (=> b!1585628 m!1454365))

(assert (=> b!1585448 d!167727))

(declare-fun d!167729 () Bool)

(declare-fun res!1082883 () Bool)

(declare-fun e!885305 () Bool)

(assert (=> d!167729 (=> res!1082883 e!885305)))

(assert (=> d!167729 (= res!1082883 (or (is-Nil!36971 lt!677394) (is-Nil!36971 (t!51892 lt!677394))))))

(assert (=> d!167729 (= (isStrictlySorted!1196 lt!677394) e!885305)))

(declare-fun b!1585629 () Bool)

(declare-fun e!885306 () Bool)

(assert (=> b!1585629 (= e!885305 e!885306)))

(declare-fun res!1082884 () Bool)

(assert (=> b!1585629 (=> (not res!1082884) (not e!885306))))

(assert (=> b!1585629 (= res!1082884 (bvslt (_1!12949 (h!38513 lt!677394)) (_1!12949 (h!38513 (t!51892 lt!677394)))))))

(declare-fun b!1585630 () Bool)

(assert (=> b!1585630 (= e!885306 (isStrictlySorted!1196 (t!51892 lt!677394)))))

(assert (= (and d!167729 (not res!1082883)) b!1585629))

(assert (= (and b!1585629 res!1082884) b!1585630))

(declare-fun m!1454367 () Bool)

(assert (=> b!1585630 m!1454367))

(assert (=> d!167699 d!167729))

(declare-fun d!167731 () Bool)

(declare-fun res!1082885 () Bool)

(declare-fun e!885307 () Bool)

(assert (=> d!167731 (=> res!1082885 e!885307)))

(assert (=> d!167731 (= res!1082885 (or (is-Nil!36971 (t!51892 l!556)) (is-Nil!36971 (t!51892 (t!51892 l!556)))))))

(assert (=> d!167731 (= (isStrictlySorted!1196 (t!51892 l!556)) e!885307)))

(declare-fun b!1585631 () Bool)

(declare-fun e!885308 () Bool)

(assert (=> b!1585631 (= e!885307 e!885308)))

(declare-fun res!1082886 () Bool)

(assert (=> b!1585631 (=> (not res!1082886) (not e!885308))))

(assert (=> b!1585631 (= res!1082886 (bvslt (_1!12949 (h!38513 (t!51892 l!556))) (_1!12949 (h!38513 (t!51892 (t!51892 l!556))))))))

(declare-fun b!1585632 () Bool)

(assert (=> b!1585632 (= e!885308 (isStrictlySorted!1196 (t!51892 (t!51892 l!556))))))

(assert (= (and d!167731 (not res!1082885)) b!1585631))

(assert (= (and b!1585631 res!1082886) b!1585632))

(declare-fun m!1454369 () Bool)

(assert (=> b!1585632 m!1454369))

(assert (=> d!167699 d!167731))

(declare-fun d!167733 () Bool)

(declare-fun res!1082887 () Bool)

(declare-fun e!885309 () Bool)

(assert (=> d!167733 (=> res!1082887 e!885309)))

(assert (=> d!167733 (= res!1082887 (and (is-Cons!36970 lt!677394) (= (_1!12949 (h!38513 lt!677394)) newKey!21)))))

(assert (=> d!167733 (= (containsKey!1009 lt!677394 newKey!21) e!885309)))

(declare-fun b!1585633 () Bool)

(declare-fun e!885310 () Bool)

(assert (=> b!1585633 (= e!885309 e!885310)))

(declare-fun res!1082888 () Bool)

(assert (=> b!1585633 (=> (not res!1082888) (not e!885310))))

(assert (=> b!1585633 (= res!1082888 (and (or (not (is-Cons!36970 lt!677394)) (bvsle (_1!12949 (h!38513 lt!677394)) newKey!21)) (is-Cons!36970 lt!677394) (bvslt (_1!12949 (h!38513 lt!677394)) newKey!21)))))

(declare-fun b!1585634 () Bool)

(assert (=> b!1585634 (= e!885310 (containsKey!1009 (t!51892 lt!677394) newKey!21))))

(assert (= (and d!167733 (not res!1082887)) b!1585633))

(assert (= (and b!1585633 res!1082888) b!1585634))

(declare-fun m!1454371 () Bool)

(assert (=> b!1585634 m!1454371))

(assert (=> b!1585570 d!167733))

(declare-fun d!167735 () Bool)

(declare-fun res!1082889 () Bool)

(declare-fun e!885311 () Bool)

(assert (=> d!167735 (=> res!1082889 e!885311)))

(assert (=> d!167735 (= res!1082889 (or (is-Nil!36971 (t!51892 lt!677373)) (is-Nil!36971 (t!51892 (t!51892 lt!677373)))))))

(assert (=> d!167735 (= (isStrictlySorted!1196 (t!51892 lt!677373)) e!885311)))

(declare-fun b!1585635 () Bool)

(declare-fun e!885312 () Bool)

(assert (=> b!1585635 (= e!885311 e!885312)))

(declare-fun res!1082890 () Bool)

(assert (=> b!1585635 (=> (not res!1082890) (not e!885312))))

(assert (=> b!1585635 (= res!1082890 (bvslt (_1!12949 (h!38513 (t!51892 lt!677373))) (_1!12949 (h!38513 (t!51892 (t!51892 lt!677373))))))))

(declare-fun b!1585636 () Bool)

(assert (=> b!1585636 (= e!885312 (isStrictlySorted!1196 (t!51892 (t!51892 lt!677373))))))

(assert (= (and d!167735 (not res!1082889)) b!1585635))

(assert (= (and b!1585635 res!1082890) b!1585636))

(declare-fun m!1454373 () Bool)

(assert (=> b!1585636 m!1454373))

(assert (=> b!1585476 d!167735))

(declare-fun d!167737 () Bool)

(declare-fun lt!677401 () Bool)

(assert (=> d!167737 (= lt!677401 (set.member (tuple2!25877 newKey!21 newValue!21) (content!865 lt!677394)))))

(declare-fun e!885313 () Bool)

(assert (=> d!167737 (= lt!677401 e!885313)))

(declare-fun res!1082891 () Bool)

(assert (=> d!167737 (=> (not res!1082891) (not e!885313))))

(assert (=> d!167737 (= res!1082891 (is-Cons!36970 lt!677394))))

(assert (=> d!167737 (= (contains!10532 lt!677394 (tuple2!25877 newKey!21 newValue!21)) lt!677401)))

(declare-fun b!1585637 () Bool)

(declare-fun e!885314 () Bool)

(assert (=> b!1585637 (= e!885313 e!885314)))

(declare-fun res!1082892 () Bool)

(assert (=> b!1585637 (=> res!1082892 e!885314)))

(assert (=> b!1585637 (= res!1082892 (= (h!38513 lt!677394) (tuple2!25877 newKey!21 newValue!21)))))

(declare-fun b!1585638 () Bool)

(assert (=> b!1585638 (= e!885314 (contains!10532 (t!51892 lt!677394) (tuple2!25877 newKey!21 newValue!21)))))

(assert (= (and d!167737 res!1082891) b!1585637))

(assert (= (and b!1585637 (not res!1082892)) b!1585638))

(declare-fun m!1454375 () Bool)

(assert (=> d!167737 m!1454375))

(declare-fun m!1454377 () Bool)

(assert (=> d!167737 m!1454377))

(declare-fun m!1454379 () Bool)

(assert (=> b!1585638 m!1454379))

(assert (=> b!1585563 d!167737))

(assert (=> b!1585577 d!167731))

(declare-fun bm!72645 () Bool)

(declare-fun call!72648 () List!36974)

(declare-fun call!72650 () List!36974)

(assert (=> bm!72645 (= call!72648 call!72650)))

(declare-fun b!1585639 () Bool)

(declare-fun e!885317 () List!36974)

(assert (=> b!1585639 (= e!885317 call!72650)))

(declare-fun e!885318 () Bool)

(declare-fun b!1585640 () Bool)

(declare-fun lt!677402 () List!36974)

(assert (=> b!1585640 (= e!885318 (contains!10532 lt!677402 (tuple2!25877 newKey!21 newValue!21)))))

(declare-fun d!167739 () Bool)

(assert (=> d!167739 e!885318))

(declare-fun res!1082894 () Bool)

(assert (=> d!167739 (=> (not res!1082894) (not e!885318))))

(assert (=> d!167739 (= res!1082894 (isStrictlySorted!1196 lt!677402))))

(assert (=> d!167739 (= lt!677402 e!885317)))

(declare-fun c!147022 () Bool)

(assert (=> d!167739 (= c!147022 (and (is-Cons!36970 (t!51892 (t!51892 l!556))) (bvslt (_1!12949 (h!38513 (t!51892 (t!51892 l!556)))) newKey!21)))))

(assert (=> d!167739 (isStrictlySorted!1196 (t!51892 (t!51892 l!556)))))

(assert (=> d!167739 (= (insertStrictlySorted!635 (t!51892 (t!51892 l!556)) newKey!21 newValue!21) lt!677402)))

(declare-fun e!885315 () List!36974)

(declare-fun bm!72646 () Bool)

(assert (=> bm!72646 (= call!72650 ($colon$colon!1040 e!885315 (ite c!147022 (h!38513 (t!51892 (t!51892 l!556))) (tuple2!25877 newKey!21 newValue!21))))))

(declare-fun c!147020 () Bool)

(assert (=> bm!72646 (= c!147020 c!147022)))

(declare-fun b!1585641 () Bool)

(assert (=> b!1585641 (= e!885315 (insertStrictlySorted!635 (t!51892 (t!51892 (t!51892 l!556))) newKey!21 newValue!21))))

(declare-fun b!1585642 () Bool)

(declare-fun c!147021 () Bool)

(assert (=> b!1585642 (= c!147021 (and (is-Cons!36970 (t!51892 (t!51892 l!556))) (bvsgt (_1!12949 (h!38513 (t!51892 (t!51892 l!556)))) newKey!21)))))

(declare-fun e!885319 () List!36974)

(declare-fun e!885316 () List!36974)

(assert (=> b!1585642 (= e!885319 e!885316)))

(declare-fun b!1585643 () Bool)

(declare-fun call!72649 () List!36974)

(assert (=> b!1585643 (= e!885316 call!72649)))

(declare-fun bm!72647 () Bool)

(assert (=> bm!72647 (= call!72649 call!72648)))

(declare-fun b!1585644 () Bool)

(assert (=> b!1585644 (= e!885317 e!885319)))

(declare-fun c!147023 () Bool)

(assert (=> b!1585644 (= c!147023 (and (is-Cons!36970 (t!51892 (t!51892 l!556))) (= (_1!12949 (h!38513 (t!51892 (t!51892 l!556)))) newKey!21)))))

(declare-fun b!1585645 () Bool)

(assert (=> b!1585645 (= e!885319 call!72648)))

(declare-fun b!1585646 () Bool)

(assert (=> b!1585646 (= e!885316 call!72649)))

(declare-fun b!1585647 () Bool)

(declare-fun res!1082893 () Bool)

(assert (=> b!1585647 (=> (not res!1082893) (not e!885318))))

(assert (=> b!1585647 (= res!1082893 (containsKey!1009 lt!677402 newKey!21))))

(declare-fun b!1585648 () Bool)

(assert (=> b!1585648 (= e!885315 (ite c!147023 (t!51892 (t!51892 (t!51892 l!556))) (ite c!147021 (Cons!36970 (h!38513 (t!51892 (t!51892 l!556))) (t!51892 (t!51892 (t!51892 l!556)))) Nil!36971)))))

(assert (= (and d!167739 c!147022) b!1585639))

(assert (= (and d!167739 (not c!147022)) b!1585644))

(assert (= (and b!1585644 c!147023) b!1585645))

(assert (= (and b!1585644 (not c!147023)) b!1585642))

(assert (= (and b!1585642 c!147021) b!1585643))

(assert (= (and b!1585642 (not c!147021)) b!1585646))

(assert (= (or b!1585643 b!1585646) bm!72647))

(assert (= (or b!1585645 bm!72647) bm!72645))

(assert (= (or b!1585639 bm!72645) bm!72646))

(assert (= (and bm!72646 c!147020) b!1585641))

(assert (= (and bm!72646 (not c!147020)) b!1585648))

(assert (= (and d!167739 res!1082894) b!1585647))

(assert (= (and b!1585647 res!1082893) b!1585640))

(declare-fun m!1454381 () Bool)

(assert (=> bm!72646 m!1454381))

(declare-fun m!1454383 () Bool)

(assert (=> b!1585641 m!1454383))

(declare-fun m!1454385 () Bool)

(assert (=> b!1585640 m!1454385))

(declare-fun m!1454387 () Bool)

(assert (=> d!167739 m!1454387))

(assert (=> d!167739 m!1454369))

(declare-fun m!1454389 () Bool)

(assert (=> b!1585647 m!1454389))

(assert (=> b!1585564 d!167739))

(declare-fun d!167741 () Bool)

(declare-fun lt!677403 () Bool)

(assert (=> d!167741 (= lt!677403 (set.member (tuple2!25877 newKey!21 newValue!21) (content!865 (t!51892 lt!677373))))))

(declare-fun e!885320 () Bool)

(assert (=> d!167741 (= lt!677403 e!885320)))

(declare-fun res!1082895 () Bool)

(assert (=> d!167741 (=> (not res!1082895) (not e!885320))))

(assert (=> d!167741 (= res!1082895 (is-Cons!36970 (t!51892 lt!677373)))))

(assert (=> d!167741 (= (contains!10532 (t!51892 lt!677373) (tuple2!25877 newKey!21 newValue!21)) lt!677403)))

(declare-fun b!1585649 () Bool)

(declare-fun e!885321 () Bool)

(assert (=> b!1585649 (= e!885320 e!885321)))

(declare-fun res!1082896 () Bool)

(assert (=> b!1585649 (=> res!1082896 e!885321)))

(assert (=> b!1585649 (= res!1082896 (= (h!38513 (t!51892 lt!677373)) (tuple2!25877 newKey!21 newValue!21)))))

(declare-fun b!1585650 () Bool)

(assert (=> b!1585650 (= e!885321 (contains!10532 (t!51892 (t!51892 lt!677373)) (tuple2!25877 newKey!21 newValue!21)))))

(assert (= (and d!167741 res!1082895) b!1585649))

(assert (= (and b!1585649 (not res!1082896)) b!1585650))

(declare-fun m!1454391 () Bool)

(assert (=> d!167741 m!1454391))

(declare-fun m!1454393 () Bool)

(assert (=> d!167741 m!1454393))

(declare-fun m!1454395 () Bool)

(assert (=> b!1585650 m!1454395))

(assert (=> b!1585466 d!167741))

(declare-fun d!167743 () Bool)

(assert (=> d!167743 (= ($colon$colon!1040 e!885255 (ite c!147011 (h!38513 (t!51892 l!556)) (tuple2!25877 newKey!21 newValue!21))) (Cons!36970 (ite c!147011 (h!38513 (t!51892 l!556)) (tuple2!25877 newKey!21 newValue!21)) e!885255))))

(assert (=> bm!72640 d!167743))

(declare-fun d!167745 () Bool)

(declare-fun c!147026 () Bool)

(assert (=> d!167745 (= c!147026 (is-Nil!36971 lt!677373))))

(declare-fun e!885324 () (Set tuple2!25876))

(assert (=> d!167745 (= (content!865 lt!677373) e!885324)))

(declare-fun b!1585655 () Bool)

(assert (=> b!1585655 (= e!885324 (as set.empty (Set tuple2!25876)))))

(declare-fun b!1585656 () Bool)

(assert (=> b!1585656 (= e!885324 (set.union (set.insert (h!38513 lt!677373) (as set.empty (Set tuple2!25876))) (content!865 (t!51892 lt!677373))))))

(assert (= (and d!167745 c!147026) b!1585655))

(assert (= (and d!167745 (not c!147026)) b!1585656))

(declare-fun m!1454397 () Bool)

(assert (=> b!1585656 m!1454397))

(assert (=> b!1585656 m!1454391))

(assert (=> d!167679 d!167745))

(declare-fun b!1585657 () Bool)

(declare-fun e!885325 () Bool)

(declare-fun tp!115277 () Bool)

(assert (=> b!1585657 (= e!885325 (and tp_is_empty!39517 tp!115277))))

(assert (=> b!1585584 (= tp!115272 e!885325)))

(assert (= (and b!1585584 (is-Cons!36970 (t!51892 (t!51892 l!556)))) b!1585657))

(push 1)

(assert (not b!1585641))

(assert (not b!1585647))

(assert (not b!1585640))

(assert (not bm!72646))

(assert tp_is_empty!39517)

(assert (not b!1585657))

(assert (not d!167739))

(assert (not b!1585630))

(assert (not b!1585632))

(assert (not b!1585638))

(assert (not b!1585650))

(assert (not b!1585636))

(assert (not d!167737))

(assert (not d!167741))

(assert (not b!1585634))

(assert (not b!1585628))

(assert (not b!1585656))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

