; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87624 () Bool)

(assert start!87624)

(declare-fun b!1013925 () Bool)

(assert (=> b!1013925 true))

(assert (=> b!1013925 true))

(declare-fun bs!29001 () Bool)

(declare-fun b!1013926 () Bool)

(assert (= bs!29001 (and b!1013926 b!1013925)))

(declare-fun lambda!602 () Int)

(declare-fun lambda!601 () Int)

(assert (=> bs!29001 (= lambda!602 lambda!601)))

(assert (=> b!1013926 true))

(assert (=> b!1013926 true))

(declare-fun res!680577 () Bool)

(declare-fun e!570369 () Bool)

(assert (=> start!87624 (=> (not res!680577) (not e!570369))))

(declare-datatypes ((B!1418 0))(
  ( (B!1419 (val!11793 Int)) )
))
(declare-datatypes ((tuple2!15132 0))(
  ( (tuple2!15133 (_1!7577 (_ BitVec 64)) (_2!7577 B!1418)) )
))
(declare-datatypes ((List!21421 0))(
  ( (Nil!21418) (Cons!21417 (h!22615 tuple2!15132) (t!30422 List!21421)) )
))
(declare-fun l!412 () List!21421)

(declare-fun isStrictlySorted!567 (List!21421) Bool)

(assert (=> start!87624 (= res!680577 (isStrictlySorted!567 l!412))))

(assert (=> start!87624 e!570369))

(declare-fun e!570370 () Bool)

(assert (=> start!87624 e!570370))

(declare-fun tp_is_empty!23485 () Bool)

(assert (=> start!87624 tp_is_empty!23485))

(declare-fun b!1013923 () Bool)

(declare-fun res!680576 () Bool)

(assert (=> b!1013923 (=> (not res!680576) (not e!570369))))

(declare-fun value!115 () B!1418)

(assert (=> b!1013923 (= res!680576 (and (is-Cons!21417 l!412) (= (_2!7577 (h!22615 l!412)) value!115)))))

(declare-fun b!1013924 () Bool)

(declare-datatypes ((Unit!33147 0))(
  ( (Unit!33148) )
))
(declare-fun e!570368 () Unit!33147)

(declare-fun Unit!33149 () Unit!33147)

(assert (=> b!1013924 (= e!570368 Unit!33149)))

(declare-fun lt!448294 () Unit!33147)

(assert (=> b!1013925 (= e!570368 lt!448294)))

(declare-datatypes ((List!21422 0))(
  ( (Nil!21419) (Cons!21418 (h!22616 (_ BitVec 64)) (t!30423 List!21422)) )
))
(declare-fun lt!448295 () List!21422)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!31 (List!21421 List!21422 B!1418 tuple2!15132) Unit!33147)

(assert (=> b!1013925 (= lt!448294 (lemmaForallGetValueByKeySameWithASmallerHead!31 (t!30422 l!412) lt!448295 value!115 (h!22615 l!412)))))

(declare-fun forall!236 (List!21422 Int) Bool)

(assert (=> b!1013925 (forall!236 lt!448295 lambda!601)))

(assert (=> b!1013926 (= e!570369 (not (forall!236 (Cons!21418 (_1!7577 (h!22615 l!412)) lt!448295) lambda!602)))))

(declare-fun lt!448296 () Unit!33147)

(assert (=> b!1013926 (= lt!448296 e!570368)))

(declare-fun c!102567 () Bool)

(declare-fun isEmpty!828 (List!21422) Bool)

(assert (=> b!1013926 (= c!102567 (not (isEmpty!828 lt!448295)))))

(declare-fun getKeysOf!43 (List!21421 B!1418) List!21422)

(assert (=> b!1013926 (= lt!448295 (getKeysOf!43 (t!30422 l!412) value!115))))

(declare-fun b!1013927 () Bool)

(declare-fun tp!70481 () Bool)

(assert (=> b!1013927 (= e!570370 (and tp_is_empty!23485 tp!70481))))

(assert (= (and start!87624 res!680577) b!1013923))

(assert (= (and b!1013923 res!680576) b!1013926))

(assert (= (and b!1013926 c!102567) b!1013925))

(assert (= (and b!1013926 (not c!102567)) b!1013924))

(assert (= (and start!87624 (is-Cons!21417 l!412)) b!1013927))

(declare-fun m!936657 () Bool)

(assert (=> start!87624 m!936657))

(declare-fun m!936659 () Bool)

(assert (=> b!1013925 m!936659))

(declare-fun m!936661 () Bool)

(assert (=> b!1013925 m!936661))

(declare-fun m!936663 () Bool)

(assert (=> b!1013926 m!936663))

(declare-fun m!936665 () Bool)

(assert (=> b!1013926 m!936665))

(declare-fun m!936667 () Bool)

(assert (=> b!1013926 m!936667))

(push 1)

(assert (not b!1013925))

(assert tp_is_empty!23485)

(assert (not b!1013926))

(assert (not start!87624))

(assert (not b!1013927))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120559 () Bool)

(declare-fun res!680599 () Bool)

(declare-fun e!570398 () Bool)

(assert (=> d!120559 (=> res!680599 e!570398)))

(assert (=> d!120559 (= res!680599 (or (is-Nil!21418 l!412) (is-Nil!21418 (t!30422 l!412))))))

(assert (=> d!120559 (= (isStrictlySorted!567 l!412) e!570398)))

(declare-fun b!1013979 () Bool)

(declare-fun e!570400 () Bool)

(assert (=> b!1013979 (= e!570398 e!570400)))

(declare-fun res!680601 () Bool)

(assert (=> b!1013979 (=> (not res!680601) (not e!570400))))

(assert (=> b!1013979 (= res!680601 (bvslt (_1!7577 (h!22615 l!412)) (_1!7577 (h!22615 (t!30422 l!412)))))))

(declare-fun b!1013981 () Bool)

(assert (=> b!1013981 (= e!570400 (isStrictlySorted!567 (t!30422 l!412)))))

(assert (= (and d!120559 (not res!680599)) b!1013979))

(assert (= (and b!1013979 res!680601) b!1013981))

(declare-fun m!936694 () Bool)

(assert (=> b!1013981 m!936694))

(assert (=> start!87624 d!120559))

(declare-fun d!120565 () Bool)

(declare-fun res!680610 () Bool)

(declare-fun e!570409 () Bool)

(assert (=> d!120565 (=> res!680610 e!570409)))

(assert (=> d!120565 (= res!680610 (is-Nil!21419 (Cons!21418 (_1!7577 (h!22615 l!412)) lt!448295)))))

(assert (=> d!120565 (= (forall!236 (Cons!21418 (_1!7577 (h!22615 l!412)) lt!448295) lambda!602) e!570409)))

(declare-fun b!1013990 () Bool)

(declare-fun e!570411 () Bool)

(assert (=> b!1013990 (= e!570409 e!570411)))

(declare-fun res!680612 () Bool)

(assert (=> b!1013990 (=> (not res!680612) (not e!570411))))

(declare-fun dynLambda!1888 (Int (_ BitVec 64)) Bool)

(assert (=> b!1013990 (= res!680612 (dynLambda!1888 lambda!602 (h!22616 (Cons!21418 (_1!7577 (h!22615 l!412)) lt!448295))))))

(declare-fun b!1013992 () Bool)

(assert (=> b!1013992 (= e!570411 (forall!236 (t!30423 (Cons!21418 (_1!7577 (h!22615 l!412)) lt!448295)) lambda!602))))

(assert (= (and d!120565 (not res!680610)) b!1013990))

(assert (= (and b!1013990 res!680612) b!1013992))

(declare-fun b_lambda!15279 () Bool)

(assert (=> (not b_lambda!15279) (not b!1013990)))

(declare-fun m!936698 () Bool)

(assert (=> b!1013990 m!936698))

(declare-fun m!936701 () Bool)

(assert (=> b!1013992 m!936701))

(assert (=> b!1013926 d!120565))

(declare-fun d!120567 () Bool)

(assert (=> d!120567 (= (isEmpty!828 lt!448295) (is-Nil!21419 lt!448295))))

(assert (=> b!1013926 d!120567))

(declare-fun bs!29005 () Bool)

(declare-fun b!1014040 () Bool)

(assert (= bs!29005 (and b!1014040 b!1013925)))

(declare-fun lt!448380 () tuple2!15132)

(declare-fun lt!448369 () List!21421)

(declare-fun lambda!627 () Int)

(assert (=> bs!29005 (= (= (Cons!21417 lt!448380 lt!448369) l!412) (= lambda!627 lambda!601))))

(declare-fun bs!29007 () Bool)

(assert (= bs!29007 (and b!1014040 b!1013926)))

(assert (=> bs!29007 (= (= (Cons!21417 lt!448380 lt!448369) l!412) (= lambda!627 lambda!602))))

(assert (=> b!1014040 true))

(assert (=> b!1014040 true))

(assert (=> b!1014040 true))

(declare-fun bs!29009 () Bool)

(declare-fun b!1014044 () Bool)

(assert (= bs!29009 (and b!1014044 b!1013925)))

(declare-fun lt!448368 () tuple2!15132)

(declare-fun lambda!631 () Int)

(declare-fun lt!448374 () List!21421)

(assert (=> bs!29009 (= (= (Cons!21417 lt!448368 lt!448374) l!412) (= lambda!631 lambda!601))))

(declare-fun bs!29011 () Bool)

(assert (= bs!29011 (and b!1014044 b!1013926)))

(assert (=> bs!29011 (= (= (Cons!21417 lt!448368 lt!448374) l!412) (= lambda!631 lambda!602))))

(declare-fun bs!29013 () Bool)

(assert (= bs!29013 (and b!1014044 b!1014040)))

(assert (=> bs!29013 (= (= (Cons!21417 lt!448368 lt!448374) (Cons!21417 lt!448380 lt!448369)) (= lambda!631 lambda!627))))

(assert (=> b!1014044 true))

(assert (=> b!1014044 true))

(assert (=> b!1014044 true))

(declare-fun bs!29015 () Bool)

(declare-fun d!120573 () Bool)

(assert (= bs!29015 (and d!120573 b!1013925)))

(declare-fun lambda!634 () Int)

(assert (=> bs!29015 (= (= (t!30422 l!412) l!412) (= lambda!634 lambda!601))))

(declare-fun bs!29017 () Bool)

(assert (= bs!29017 (and d!120573 b!1013926)))

(assert (=> bs!29017 (= (= (t!30422 l!412) l!412) (= lambda!634 lambda!602))))

(declare-fun bs!29019 () Bool)

(assert (= bs!29019 (and d!120573 b!1014040)))

(assert (=> bs!29019 (= (= (t!30422 l!412) (Cons!21417 lt!448380 lt!448369)) (= lambda!634 lambda!627))))

(declare-fun bs!29020 () Bool)

(assert (= bs!29020 (and d!120573 b!1014044)))

(assert (=> bs!29020 (= (= (t!30422 l!412) (Cons!21417 lt!448368 lt!448374)) (= lambda!634 lambda!631))))

(assert (=> d!120573 true))

(assert (=> d!120573 true))

(declare-fun b!1014035 () Bool)

(declare-fun lt!448378 () Unit!33147)

(declare-fun e!570437 () Unit!33147)

(assert (=> b!1014035 (= lt!448378 e!570437)))

(declare-fun c!102597 () Bool)

(declare-fun call!42749 () Bool)

(assert (=> b!1014035 (= c!102597 (not call!42749))))

(declare-fun lt!448375 () List!21422)

(declare-fun call!42751 () List!21422)

(assert (=> b!1014035 (= lt!448375 call!42751)))

(declare-fun e!570440 () List!21422)

(assert (=> b!1014035 (= e!570440 call!42751)))

(declare-fun b!1014037 () Bool)

(declare-fun e!570441 () List!21422)

(assert (=> b!1014037 (= e!570441 (Cons!21418 (_1!7577 (h!22615 (t!30422 l!412))) call!42751))))

(declare-fun c!102592 () Bool)

(assert (=> b!1014037 (= c!102592 (not call!42749))))

(declare-fun lt!448367 () Unit!33147)

(declare-fun e!570442 () Unit!33147)

(assert (=> b!1014037 (= lt!448367 e!570442)))

(declare-fun b!1014038 () Bool)

(declare-fun Unit!33156 () Unit!33147)

(assert (=> b!1014038 (= e!570442 Unit!33156)))

(declare-fun call!42747 () Bool)

(assert (=> b!1014040 call!42747))

(declare-fun lt!448387 () Unit!33147)

(declare-fun call!42746 () Unit!33147)

(assert (=> b!1014040 (= lt!448387 call!42746)))

(assert (=> b!1014040 (= lt!448380 (h!22615 (t!30422 l!412)))))

(declare-fun lt!448376 () List!21422)

(assert (=> b!1014040 (= lt!448376 call!42751)))

(assert (=> b!1014040 (= lt!448369 (t!30422 (t!30422 l!412)))))

(assert (=> b!1014040 (= e!570442 lt!448387)))

(declare-fun b!1014042 () Bool)

(declare-fun Unit!33157 () Unit!33147)

(assert (=> b!1014042 (= e!570437 Unit!33157)))

(declare-fun lt!448366 () Unit!33147)

(assert (=> b!1014044 (= e!570437 lt!448366)))

(assert (=> b!1014044 (= lt!448374 (t!30422 (t!30422 l!412)))))

(declare-fun lt!448383 () List!21422)

(assert (=> b!1014044 (= lt!448383 call!42751)))

(assert (=> b!1014044 (= lt!448368 (h!22615 (t!30422 l!412)))))

(assert (=> b!1014044 (= lt!448366 call!42746)))

(assert (=> b!1014044 call!42747))

(declare-fun b!1014045 () Bool)

(assert (=> b!1014045 (= e!570441 e!570440)))

(declare-fun c!102594 () Bool)

(assert (=> b!1014045 (= c!102594 (and (is-Cons!21417 (t!30422 l!412)) (not (= (_2!7577 (h!22615 (t!30422 l!412))) value!115))))))

(declare-fun b!1014047 () Bool)

(assert (=> b!1014047 (= e!570440 Nil!21419)))

(declare-fun lt!448388 () List!21422)

(assert (=> d!120573 (forall!236 lt!448388 lambda!634)))

(assert (=> d!120573 (= lt!448388 e!570441)))

(declare-fun c!102595 () Bool)

(assert (=> d!120573 (= c!102595 (and (is-Cons!21417 (t!30422 l!412)) (= (_2!7577 (h!22615 (t!30422 l!412))) value!115)))))

(assert (=> d!120573 (isStrictlySorted!567 (t!30422 l!412))))

(assert (=> d!120573 (= (getKeysOf!43 (t!30422 l!412) value!115) lt!448388)))

(declare-fun bm!42745 () Bool)

(assert (=> bm!42745 (= call!42749 (isEmpty!828 call!42751))))

(declare-fun bm!42747 () Bool)

(assert (=> bm!42747 (= call!42751 (getKeysOf!43 (t!30422 (t!30422 l!412)) value!115))))

(declare-fun bm!42749 () Bool)

(assert (=> bm!42749 (= call!42746 (lemmaForallGetValueByKeySameWithASmallerHead!31 (ite c!102595 lt!448369 lt!448374) (ite c!102595 lt!448376 lt!448383) value!115 (ite c!102595 lt!448380 lt!448368)))))

(declare-fun bm!42750 () Bool)

(assert (=> bm!42750 (= call!42747 (forall!236 (ite c!102595 lt!448376 lt!448383) (ite c!102595 lambda!627 lambda!631)))))

(assert (= (and d!120573 c!102595) b!1014037))

(assert (= (and d!120573 (not c!102595)) b!1014045))

(assert (= (and b!1014037 c!102592) b!1014040))

(assert (= (and b!1014037 (not c!102592)) b!1014038))

(assert (= (and b!1014045 c!102594) b!1014035))

(assert (= (and b!1014045 (not c!102594)) b!1014047))

(assert (= (and b!1014035 c!102597) b!1014044))

(assert (= (and b!1014035 (not c!102597)) b!1014042))

(assert (= (or b!1014040 b!1014044) bm!42749))

(assert (= (or b!1014040 b!1014044) bm!42750))

(assert (= (or b!1014037 b!1014040 b!1014035 b!1014044) bm!42747))

(assert (= (or b!1014037 b!1014035) bm!42745))

(declare-fun m!936711 () Bool)

(assert (=> bm!42750 m!936711))

(declare-fun m!936713 () Bool)

(assert (=> bm!42745 m!936713))

(declare-fun m!936715 () Bool)

(assert (=> d!120573 m!936715))

(assert (=> d!120573 m!936694))

(declare-fun m!936721 () Bool)

(assert (=> bm!42747 m!936721))

(declare-fun m!936725 () Bool)

(assert (=> bm!42749 m!936725))

(assert (=> b!1013926 d!120573))

(declare-fun bs!29022 () Bool)

(declare-fun b!1014084 () Bool)

(assert (= bs!29022 (and b!1014084 d!120573)))

(declare-fun lambda!647 () Int)

(assert (=> bs!29022 (= lambda!647 lambda!634)))

(declare-fun bs!29024 () Bool)

(assert (= bs!29024 (and b!1014084 b!1013925)))

(assert (=> bs!29024 (= (= (t!30422 l!412) l!412) (= lambda!647 lambda!601))))

(declare-fun bs!29027 () Bool)

(assert (= bs!29027 (and b!1014084 b!1013926)))

(assert (=> bs!29027 (= (= (t!30422 l!412) l!412) (= lambda!647 lambda!602))))

(declare-fun bs!29029 () Bool)

(assert (= bs!29029 (and b!1014084 b!1014040)))

(assert (=> bs!29029 (= (= (t!30422 l!412) (Cons!21417 lt!448380 lt!448369)) (= lambda!647 lambda!627))))

(declare-fun bs!29031 () Bool)

(assert (= bs!29031 (and b!1014084 b!1014044)))

(assert (=> bs!29031 (= (= (t!30422 l!412) (Cons!21417 lt!448368 lt!448374)) (= lambda!647 lambda!631))))

(assert (=> b!1014084 true))

(assert (=> b!1014084 true))

(declare-fun bs!29035 () Bool)

(declare-fun d!120581 () Bool)

(assert (= bs!29035 (and d!120581 d!120573)))

(declare-fun lambda!651 () Int)

(assert (=> bs!29035 (= (= (Cons!21417 (h!22615 l!412) (t!30422 l!412)) (t!30422 l!412)) (= lambda!651 lambda!634))))

(declare-fun bs!29037 () Bool)

(assert (= bs!29037 (and d!120581 b!1013925)))

(assert (=> bs!29037 (= (= (Cons!21417 (h!22615 l!412) (t!30422 l!412)) l!412) (= lambda!651 lambda!601))))

(declare-fun bs!29039 () Bool)

(assert (= bs!29039 (and d!120581 b!1013926)))

(assert (=> bs!29039 (= (= (Cons!21417 (h!22615 l!412) (t!30422 l!412)) l!412) (= lambda!651 lambda!602))))

(declare-fun bs!29041 () Bool)

(assert (= bs!29041 (and d!120581 b!1014084)))

(assert (=> bs!29041 (= (= (Cons!21417 (h!22615 l!412) (t!30422 l!412)) (t!30422 l!412)) (= lambda!651 lambda!647))))

(declare-fun bs!29043 () Bool)

(assert (= bs!29043 (and d!120581 b!1014040)))

(assert (=> bs!29043 (= (= (Cons!21417 (h!22615 l!412) (t!30422 l!412)) (Cons!21417 lt!448380 lt!448369)) (= lambda!651 lambda!627))))

(declare-fun bs!29045 () Bool)

(assert (= bs!29045 (and d!120581 b!1014044)))

(assert (=> bs!29045 (= (= (Cons!21417 (h!22615 l!412) (t!30422 l!412)) (Cons!21417 lt!448368 lt!448374)) (= lambda!651 lambda!631))))

(assert (=> d!120581 true))

(assert (=> d!120581 true))

(assert (=> d!120581 true))

(assert (=> d!120581 (forall!236 lt!448295 lambda!651)))

(declare-fun lt!448415 () Unit!33147)

(declare-fun choose!1632 (List!21421 List!21422 B!1418 tuple2!15132) Unit!33147)

(assert (=> d!120581 (= lt!448415 (choose!1632 (t!30422 l!412) lt!448295 value!115 (h!22615 l!412)))))

(declare-fun e!570456 () Bool)

(assert (=> d!120581 e!570456))

(declare-fun res!680637 () Bool)

(assert (=> d!120581 (=> (not res!680637) (not e!570456))))

(assert (=> d!120581 (= res!680637 (isStrictlySorted!567 (t!30422 l!412)))))

(assert (=> d!120581 (= (lemmaForallGetValueByKeySameWithASmallerHead!31 (t!30422 l!412) lt!448295 value!115 (h!22615 l!412)) lt!448415)))

(declare-fun b!1014082 () Bool)

(declare-fun res!680635 () Bool)

(assert (=> b!1014082 (=> (not res!680635) (not e!570456))))

(declare-fun isEmpty!831 (List!21421) Bool)

(assert (=> b!1014082 (= res!680635 (not (isEmpty!831 (t!30422 l!412))))))

(declare-fun res!680633 () Bool)

(assert (=> b!1014084 (=> (not res!680633) (not e!570456))))

(assert (=> b!1014084 (= res!680633 (forall!236 lt!448295 lambda!647))))

(declare-fun b!1014085 () Bool)

(declare-fun head!938 (List!21421) tuple2!15132)

(assert (=> b!1014085 (= e!570456 (bvslt (_1!7577 (h!22615 l!412)) (_1!7577 (head!938 (t!30422 l!412)))))))

(assert (= (and d!120581 res!680637) b!1014082))

(assert (= (and b!1014082 res!680635) b!1014084))

(assert (= (and b!1014084 res!680633) b!1014085))

(declare-fun m!936733 () Bool)

(assert (=> d!120581 m!936733))

(declare-fun m!936737 () Bool)

(assert (=> d!120581 m!936737))

(assert (=> d!120581 m!936694))

(declare-fun m!936743 () Bool)

(assert (=> b!1014082 m!936743))

(declare-fun m!936745 () Bool)

(assert (=> b!1014084 m!936745))

(declare-fun m!936747 () Bool)

(assert (=> b!1014085 m!936747))

(assert (=> b!1013925 d!120581))

(declare-fun d!120587 () Bool)

(declare-fun res!680640 () Bool)

(declare-fun e!570463 () Bool)

(assert (=> d!120587 (=> res!680640 e!570463)))

(assert (=> d!120587 (= res!680640 (is-Nil!21419 lt!448295))))

(assert (=> d!120587 (= (forall!236 lt!448295 lambda!601) e!570463)))

(declare-fun b!1014098 () Bool)

(declare-fun e!570464 () Bool)

(assert (=> b!1014098 (= e!570463 e!570464)))

(declare-fun res!680641 () Bool)

(assert (=> b!1014098 (=> (not res!680641) (not e!570464))))

(assert (=> b!1014098 (= res!680641 (dynLambda!1888 lambda!601 (h!22616 lt!448295)))))

(declare-fun b!1014099 () Bool)

(assert (=> b!1014099 (= e!570464 (forall!236 (t!30423 lt!448295) lambda!601))))

(assert (= (and d!120587 (not res!680640)) b!1014098))

(assert (= (and b!1014098 res!680641) b!1014099))

(declare-fun b_lambda!15285 () Bool)

(assert (=> (not b_lambda!15285) (not b!1014098)))

(declare-fun m!936751 () Bool)

(assert (=> b!1014098 m!936751))

(declare-fun m!936755 () Bool)

(assert (=> b!1014099 m!936755))

(assert (=> b!1013925 d!120587))

(declare-fun b!1014108 () Bool)

(declare-fun e!570469 () Bool)

(declare-fun tp!70492 () Bool)

(assert (=> b!1014108 (= e!570469 (and tp_is_empty!23485 tp!70492))))

(assert (=> b!1013927 (= tp!70481 e!570469)))

(assert (= (and b!1013927 (is-Cons!21417 (t!30422 l!412))) b!1014108))

(declare-fun b_lambda!15289 () Bool)

(assert (= b_lambda!15285 (or b!1013925 b_lambda!15289)))

(declare-fun bs!29053 () Bool)

(declare-fun d!120591 () Bool)

(assert (= bs!29053 (and d!120591 b!1013925)))

(declare-datatypes ((Option!574 0))(
  ( (Some!573 (v!14424 B!1418)) (None!572) )
))
(declare-fun getValueByKey!523 (List!21421 (_ BitVec 64)) Option!574)

(assert (=> bs!29053 (= (dynLambda!1888 lambda!601 (h!22616 lt!448295)) (= (getValueByKey!523 l!412 (h!22616 lt!448295)) (Some!573 value!115)))))

(declare-fun m!936758 () Bool)

(assert (=> bs!29053 m!936758))

(assert (=> b!1014098 d!120591))

(declare-fun b_lambda!15293 () Bool)

(assert (= b_lambda!15279 (or b!1013926 b_lambda!15293)))

(declare-fun bs!29056 () Bool)

(declare-fun d!120595 () Bool)

(assert (= bs!29056 (and d!120595 b!1013926)))

(assert (=> bs!29056 (= (dynLambda!1888 lambda!602 (h!22616 (Cons!21418 (_1!7577 (h!22615 l!412)) lt!448295))) (= (getValueByKey!523 l!412 (h!22616 (Cons!21418 (_1!7577 (h!22615 l!412)) lt!448295))) (Some!573 value!115)))))

(declare-fun m!936763 () Bool)

(assert (=> bs!29056 m!936763))

(assert (=> b!1013990 d!120595))

(push 1)

(assert (not b_lambda!15289))

(assert (not b_lambda!15293))

(assert (not bm!42750))

(assert (not bm!42747))

(assert (not b!1013981))

(assert (not d!120573))

(assert (not d!120581))

(assert (not b!1014099))

(assert (not bs!29056))

(assert (not bm!42745))

(assert (not b!1013992))

(assert (not b!1014108))

(assert (not b!1014085))

(assert (not b!1014082))

(assert (not b!1014084))

(assert tp_is_empty!23485)

(assert (not bm!42749))

(assert (not bs!29053))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120607 () Bool)

(assert (=> d!120607 (= (isEmpty!831 (t!30422 l!412)) (is-Nil!21418 (t!30422 l!412)))))

(assert (=> b!1014082 d!120607))

(declare-fun d!120609 () Bool)

(declare-fun res!680659 () Bool)

(declare-fun e!570485 () Bool)

(assert (=> d!120609 (=> res!680659 e!570485)))

(assert (=> d!120609 (= res!680659 (is-Nil!21419 lt!448295))))

(assert (=> d!120609 (= (forall!236 lt!448295 lambda!651) e!570485)))

(declare-fun b!1014132 () Bool)

(declare-fun e!570486 () Bool)

(assert (=> b!1014132 (= e!570485 e!570486)))

(declare-fun res!680660 () Bool)

(assert (=> b!1014132 (=> (not res!680660) (not e!570486))))

(assert (=> b!1014132 (= res!680660 (dynLambda!1888 lambda!651 (h!22616 lt!448295)))))

(declare-fun b!1014133 () Bool)

(assert (=> b!1014133 (= e!570486 (forall!236 (t!30423 lt!448295) lambda!651))))

(assert (= (and d!120609 (not res!680659)) b!1014132))

(assert (= (and b!1014132 res!680660) b!1014133))

(declare-fun b_lambda!15301 () Bool)

(assert (=> (not b_lambda!15301) (not b!1014132)))

(declare-fun m!936795 () Bool)

(assert (=> b!1014132 m!936795))

(declare-fun m!936797 () Bool)

(assert (=> b!1014133 m!936797))

(assert (=> d!120581 d!120609))

(declare-fun bs!29070 () Bool)

(declare-fun d!120611 () Bool)

(assert (= bs!29070 (and d!120611 d!120581)))

(declare-fun lambda!662 () Int)

(assert (=> bs!29070 (= lambda!662 lambda!651)))

(declare-fun bs!29071 () Bool)

(assert (= bs!29071 (and d!120611 d!120573)))

(assert (=> bs!29071 (= (= (Cons!21417 (h!22615 l!412) (t!30422 l!412)) (t!30422 l!412)) (= lambda!662 lambda!634))))

(declare-fun bs!29072 () Bool)

(assert (= bs!29072 (and d!120611 b!1013925)))

(assert (=> bs!29072 (= (= (Cons!21417 (h!22615 l!412) (t!30422 l!412)) l!412) (= lambda!662 lambda!601))))

(declare-fun bs!29073 () Bool)

(assert (= bs!29073 (and d!120611 b!1013926)))

(assert (=> bs!29073 (= (= (Cons!21417 (h!22615 l!412) (t!30422 l!412)) l!412) (= lambda!662 lambda!602))))

(declare-fun bs!29074 () Bool)

(assert (= bs!29074 (and d!120611 b!1014084)))

(assert (=> bs!29074 (= (= (Cons!21417 (h!22615 l!412) (t!30422 l!412)) (t!30422 l!412)) (= lambda!662 lambda!647))))

(declare-fun bs!29075 () Bool)

(assert (= bs!29075 (and d!120611 b!1014040)))

(assert (=> bs!29075 (= (= (Cons!21417 (h!22615 l!412) (t!30422 l!412)) (Cons!21417 lt!448380 lt!448369)) (= lambda!662 lambda!627))))

(declare-fun bs!29076 () Bool)

(assert (= bs!29076 (and d!120611 b!1014044)))

(assert (=> bs!29076 (= (= (Cons!21417 (h!22615 l!412) (t!30422 l!412)) (Cons!21417 lt!448368 lt!448374)) (= lambda!662 lambda!631))))

(assert (=> d!120611 true))

(assert (=> d!120611 true))

(assert (=> d!120611 true))

(assert (=> d!120611 (forall!236 lt!448295 lambda!662)))

(assert (=> d!120611 true))

(declare-fun _$15!110 () Unit!33147)

(assert (=> d!120611 (= (choose!1632 (t!30422 l!412) lt!448295 value!115 (h!22615 l!412)) _$15!110)))

(declare-fun bs!29077 () Bool)

(assert (= bs!29077 d!120611))

(declare-fun m!936799 () Bool)

(assert (=> bs!29077 m!936799))

(assert (=> d!120581 d!120611))

(declare-fun d!120613 () Bool)

(declare-fun res!680661 () Bool)

(declare-fun e!570487 () Bool)

(assert (=> d!120613 (=> res!680661 e!570487)))

(assert (=> d!120613 (= res!680661 (or (is-Nil!21418 (t!30422 l!412)) (is-Nil!21418 (t!30422 (t!30422 l!412)))))))

(assert (=> d!120613 (= (isStrictlySorted!567 (t!30422 l!412)) e!570487)))

(declare-fun b!1014134 () Bool)

(declare-fun e!570488 () Bool)

(assert (=> b!1014134 (= e!570487 e!570488)))

(declare-fun res!680662 () Bool)

(assert (=> b!1014134 (=> (not res!680662) (not e!570488))))

(assert (=> b!1014134 (= res!680662 (bvslt (_1!7577 (h!22615 (t!30422 l!412))) (_1!7577 (h!22615 (t!30422 (t!30422 l!412))))))))

(declare-fun b!1014135 () Bool)

(assert (=> b!1014135 (= e!570488 (isStrictlySorted!567 (t!30422 (t!30422 l!412))))))

(assert (= (and d!120613 (not res!680661)) b!1014134))

(assert (= (and b!1014134 res!680662) b!1014135))

(declare-fun m!936801 () Bool)

(assert (=> b!1014135 m!936801))

(assert (=> d!120581 d!120613))

(declare-fun d!120615 () Bool)

(assert (=> d!120615 (= (isEmpty!828 call!42751) (is-Nil!21419 call!42751))))

(assert (=> bm!42745 d!120615))

(declare-fun d!120617 () Bool)

(declare-fun res!680663 () Bool)

(declare-fun e!570489 () Bool)

(assert (=> d!120617 (=> res!680663 e!570489)))

(assert (=> d!120617 (= res!680663 (is-Nil!21419 lt!448295))))

(assert (=> d!120617 (= (forall!236 lt!448295 lambda!647) e!570489)))

(declare-fun b!1014136 () Bool)

(declare-fun e!570490 () Bool)

(assert (=> b!1014136 (= e!570489 e!570490)))

(declare-fun res!680664 () Bool)

(assert (=> b!1014136 (=> (not res!680664) (not e!570490))))

(assert (=> b!1014136 (= res!680664 (dynLambda!1888 lambda!647 (h!22616 lt!448295)))))

(declare-fun b!1014137 () Bool)

(assert (=> b!1014137 (= e!570490 (forall!236 (t!30423 lt!448295) lambda!647))))

(assert (= (and d!120617 (not res!680663)) b!1014136))

(assert (= (and b!1014136 res!680664) b!1014137))

(declare-fun b_lambda!15303 () Bool)

(assert (=> (not b_lambda!15303) (not b!1014136)))

(declare-fun m!936803 () Bool)

(assert (=> b!1014136 m!936803))

(declare-fun m!936805 () Bool)

(assert (=> b!1014137 m!936805))

(assert (=> b!1014084 d!120617))

(declare-fun d!120619 () Bool)

(assert (=> d!120619 (= (head!938 (t!30422 l!412)) (h!22615 (t!30422 l!412)))))

(assert (=> b!1014085 d!120619))

(declare-fun b!1014149 () Bool)

(declare-fun e!570497 () Option!574)

(declare-fun e!570498 () Option!574)

(assert (=> b!1014149 (= e!570497 e!570498)))

(declare-fun c!102615 () Bool)

(assert (=> b!1014149 (= c!102615 (and (is-Cons!21417 l!412) (not (= (_1!7577 (h!22615 l!412)) (h!22616 (Cons!21418 (_1!7577 (h!22615 l!412)) lt!448295))))))))

(declare-fun b!1014148 () Bool)

(assert (=> b!1014148 (= e!570497 (Some!573 (_2!7577 (h!22615 l!412))))))

(declare-fun b!1014151 () Bool)

(assert (=> b!1014151 (= e!570498 None!572)))

(declare-fun d!120621 () Bool)

(declare-fun c!102614 () Bool)

(assert (=> d!120621 (= c!102614 (and (is-Cons!21417 l!412) (= (_1!7577 (h!22615 l!412)) (h!22616 (Cons!21418 (_1!7577 (h!22615 l!412)) lt!448295)))))))

(assert (=> d!120621 (= (getValueByKey!523 l!412 (h!22616 (Cons!21418 (_1!7577 (h!22615 l!412)) lt!448295))) e!570497)))

(declare-fun b!1014150 () Bool)

(assert (=> b!1014150 (= e!570498 (getValueByKey!523 (t!30422 l!412) (h!22616 (Cons!21418 (_1!7577 (h!22615 l!412)) lt!448295))))))

(assert (= (and d!120621 c!102614) b!1014148))

(assert (= (and d!120621 (not c!102614)) b!1014149))

(assert (= (and b!1014149 c!102615) b!1014150))

(assert (= (and b!1014149 (not c!102615)) b!1014151))

(declare-fun m!936809 () Bool)

(assert (=> b!1014150 m!936809))

(assert (=> bs!29056 d!120621))

(declare-fun bs!29078 () Bool)

(declare-fun b!1014155 () Bool)

(assert (= bs!29078 (and b!1014155 d!120581)))

(declare-fun lambda!663 () Int)

(declare-fun lt!448440 () tuple2!15132)

(declare-fun lt!448435 () List!21421)

(assert (=> bs!29078 (= (= (Cons!21417 lt!448440 lt!448435) (Cons!21417 (h!22615 l!412) (t!30422 l!412))) (= lambda!663 lambda!651))))

(declare-fun bs!29079 () Bool)

(assert (= bs!29079 (and b!1014155 d!120573)))

(assert (=> bs!29079 (= (= (Cons!21417 lt!448440 lt!448435) (t!30422 l!412)) (= lambda!663 lambda!634))))

(declare-fun bs!29080 () Bool)

(assert (= bs!29080 (and b!1014155 d!120611)))

(assert (=> bs!29080 (= (= (Cons!21417 lt!448440 lt!448435) (Cons!21417 (h!22615 l!412) (t!30422 l!412))) (= lambda!663 lambda!662))))

(declare-fun bs!29081 () Bool)

(assert (= bs!29081 (and b!1014155 b!1013925)))

(assert (=> bs!29081 (= (= (Cons!21417 lt!448440 lt!448435) l!412) (= lambda!663 lambda!601))))

(declare-fun bs!29082 () Bool)

(assert (= bs!29082 (and b!1014155 b!1013926)))

(assert (=> bs!29082 (= (= (Cons!21417 lt!448440 lt!448435) l!412) (= lambda!663 lambda!602))))

(declare-fun bs!29083 () Bool)

(assert (= bs!29083 (and b!1014155 b!1014084)))

(assert (=> bs!29083 (= (= (Cons!21417 lt!448440 lt!448435) (t!30422 l!412)) (= lambda!663 lambda!647))))

(declare-fun bs!29084 () Bool)

(assert (= bs!29084 (and b!1014155 b!1014040)))

(assert (=> bs!29084 (= (= (Cons!21417 lt!448440 lt!448435) (Cons!21417 lt!448380 lt!448369)) (= lambda!663 lambda!627))))

(declare-fun bs!29085 () Bool)

(assert (= bs!29085 (and b!1014155 b!1014044)))

(assert (=> bs!29085 (= (= (Cons!21417 lt!448440 lt!448435) (Cons!21417 lt!448368 lt!448374)) (= lambda!663 lambda!631))))

(assert (=> b!1014155 true))

(assert (=> b!1014155 true))

(assert (=> b!1014155 true))

(declare-fun bs!29086 () Bool)

(declare-fun b!1014157 () Bool)

(assert (= bs!29086 (and b!1014157 d!120581)))

(declare-fun lt!448434 () tuple2!15132)

(declare-fun lambda!664 () Int)

(declare-fun lt!448436 () List!21421)

(assert (=> bs!29086 (= (= (Cons!21417 lt!448434 lt!448436) (Cons!21417 (h!22615 l!412) (t!30422 l!412))) (= lambda!664 lambda!651))))

(declare-fun bs!29087 () Bool)

(assert (= bs!29087 (and b!1014157 d!120573)))

(assert (=> bs!29087 (= (= (Cons!21417 lt!448434 lt!448436) (t!30422 l!412)) (= lambda!664 lambda!634))))

(declare-fun bs!29088 () Bool)

(assert (= bs!29088 (and b!1014157 b!1013925)))

(assert (=> bs!29088 (= (= (Cons!21417 lt!448434 lt!448436) l!412) (= lambda!664 lambda!601))))

(declare-fun bs!29089 () Bool)

(assert (= bs!29089 (and b!1014157 b!1013926)))

(assert (=> bs!29089 (= (= (Cons!21417 lt!448434 lt!448436) l!412) (= lambda!664 lambda!602))))

(declare-fun bs!29090 () Bool)

(assert (= bs!29090 (and b!1014157 b!1014084)))

(assert (=> bs!29090 (= (= (Cons!21417 lt!448434 lt!448436) (t!30422 l!412)) (= lambda!664 lambda!647))))

(declare-fun bs!29091 () Bool)

(assert (= bs!29091 (and b!1014157 b!1014040)))

(assert (=> bs!29091 (= (= (Cons!21417 lt!448434 lt!448436) (Cons!21417 lt!448380 lt!448369)) (= lambda!664 lambda!627))))

(declare-fun bs!29092 () Bool)

(assert (= bs!29092 (and b!1014157 b!1014044)))

(assert (=> bs!29092 (= (= (Cons!21417 lt!448434 lt!448436) (Cons!21417 lt!448368 lt!448374)) (= lambda!664 lambda!631))))

(declare-fun bs!29093 () Bool)

(assert (= bs!29093 (and b!1014157 b!1014155)))

(assert (=> bs!29093 (= (= (Cons!21417 lt!448434 lt!448436) (Cons!21417 lt!448440 lt!448435)) (= lambda!664 lambda!663))))

(declare-fun bs!29094 () Bool)

(assert (= bs!29094 (and b!1014157 d!120611)))

(assert (=> bs!29094 (= (= (Cons!21417 lt!448434 lt!448436) (Cons!21417 (h!22615 l!412) (t!30422 l!412))) (= lambda!664 lambda!662))))

(assert (=> b!1014157 true))

(assert (=> b!1014157 true))

(assert (=> b!1014157 true))

(declare-fun bs!29095 () Bool)

(declare-fun d!120627 () Bool)

(assert (= bs!29095 (and d!120627 b!1014157)))

(declare-fun lambda!668 () Int)

(assert (=> bs!29095 (= (= (t!30422 (t!30422 l!412)) (Cons!21417 lt!448434 lt!448436)) (= lambda!668 lambda!664))))

(declare-fun bs!29097 () Bool)

(assert (= bs!29097 (and d!120627 d!120581)))

(assert (=> bs!29097 (= (= (t!30422 (t!30422 l!412)) (Cons!21417 (h!22615 l!412) (t!30422 l!412))) (= lambda!668 lambda!651))))

(declare-fun bs!29098 () Bool)

(assert (= bs!29098 (and d!120627 d!120573)))

(assert (=> bs!29098 (= (= (t!30422 (t!30422 l!412)) (t!30422 l!412)) (= lambda!668 lambda!634))))

(declare-fun bs!29100 () Bool)

(assert (= bs!29100 (and d!120627 b!1013925)))

(assert (=> bs!29100 (= (= (t!30422 (t!30422 l!412)) l!412) (= lambda!668 lambda!601))))

(declare-fun bs!29102 () Bool)

(assert (= bs!29102 (and d!120627 b!1013926)))

(assert (=> bs!29102 (= (= (t!30422 (t!30422 l!412)) l!412) (= lambda!668 lambda!602))))

(declare-fun bs!29104 () Bool)

(assert (= bs!29104 (and d!120627 b!1014084)))

(assert (=> bs!29104 (= (= (t!30422 (t!30422 l!412)) (t!30422 l!412)) (= lambda!668 lambda!647))))

(declare-fun bs!29106 () Bool)

(assert (= bs!29106 (and d!120627 b!1014040)))

(assert (=> bs!29106 (= (= (t!30422 (t!30422 l!412)) (Cons!21417 lt!448380 lt!448369)) (= lambda!668 lambda!627))))

(declare-fun bs!29108 () Bool)

(assert (= bs!29108 (and d!120627 b!1014044)))

(assert (=> bs!29108 (= (= (t!30422 (t!30422 l!412)) (Cons!21417 lt!448368 lt!448374)) (= lambda!668 lambda!631))))

(declare-fun bs!29110 () Bool)

(assert (= bs!29110 (and d!120627 b!1014155)))

(assert (=> bs!29110 (= (= (t!30422 (t!30422 l!412)) (Cons!21417 lt!448440 lt!448435)) (= lambda!668 lambda!663))))

(declare-fun bs!29111 () Bool)

(assert (= bs!29111 (and d!120627 d!120611)))

(assert (=> bs!29111 (= (= (t!30422 (t!30422 l!412)) (Cons!21417 (h!22615 l!412) (t!30422 l!412))) (= lambda!668 lambda!662))))

(assert (=> d!120627 true))

(assert (=> d!120627 true))

(declare-fun b!1014152 () Bool)

(declare-fun lt!448439 () Unit!33147)

(declare-fun e!570499 () Unit!33147)

(assert (=> b!1014152 (= lt!448439 e!570499)))

(declare-fun c!102619 () Bool)

(declare-fun call!42768 () Bool)

(assert (=> b!1014152 (= c!102619 (not call!42768))))

(declare-fun lt!448437 () List!21422)

(declare-fun call!42769 () List!21422)

(assert (=> b!1014152 (= lt!448437 call!42769)))

(declare-fun e!570500 () List!21422)

(assert (=> b!1014152 (= e!570500 call!42769)))

(declare-fun b!1014153 () Bool)

(declare-fun e!570501 () List!21422)

(assert (=> b!1014153 (= e!570501 (Cons!21418 (_1!7577 (h!22615 (t!30422 (t!30422 l!412)))) call!42769))))

(declare-fun c!102616 () Bool)

(assert (=> b!1014153 (= c!102616 (not call!42768))))

(declare-fun lt!448433 () Unit!33147)

(declare-fun e!570502 () Unit!33147)

(assert (=> b!1014153 (= lt!448433 e!570502)))

(declare-fun b!1014154 () Bool)

(declare-fun Unit!33162 () Unit!33147)

(assert (=> b!1014154 (= e!570502 Unit!33162)))

(declare-fun call!42767 () Bool)

(assert (=> b!1014155 call!42767))

(declare-fun lt!448442 () Unit!33147)

(declare-fun call!42766 () Unit!33147)

(assert (=> b!1014155 (= lt!448442 call!42766)))

(assert (=> b!1014155 (= lt!448440 (h!22615 (t!30422 (t!30422 l!412))))))

(declare-fun lt!448438 () List!21422)

(assert (=> b!1014155 (= lt!448438 call!42769)))

(assert (=> b!1014155 (= lt!448435 (t!30422 (t!30422 (t!30422 l!412))))))

(assert (=> b!1014155 (= e!570502 lt!448442)))

(declare-fun b!1014156 () Bool)

(declare-fun Unit!33163 () Unit!33147)

(assert (=> b!1014156 (= e!570499 Unit!33163)))

(declare-fun lt!448432 () Unit!33147)

(assert (=> b!1014157 (= e!570499 lt!448432)))

(assert (=> b!1014157 (= lt!448436 (t!30422 (t!30422 (t!30422 l!412))))))

(declare-fun lt!448441 () List!21422)

(assert (=> b!1014157 (= lt!448441 call!42769)))

(assert (=> b!1014157 (= lt!448434 (h!22615 (t!30422 (t!30422 l!412))))))

(assert (=> b!1014157 (= lt!448432 call!42766)))

(assert (=> b!1014157 call!42767))

(declare-fun b!1014158 () Bool)

(assert (=> b!1014158 (= e!570501 e!570500)))

(declare-fun c!102617 () Bool)

(assert (=> b!1014158 (= c!102617 (and (is-Cons!21417 (t!30422 (t!30422 l!412))) (not (= (_2!7577 (h!22615 (t!30422 (t!30422 l!412)))) value!115))))))

(declare-fun b!1014159 () Bool)

(assert (=> b!1014159 (= e!570500 Nil!21419)))

(declare-fun lt!448443 () List!21422)

(assert (=> d!120627 (forall!236 lt!448443 lambda!668)))

(assert (=> d!120627 (= lt!448443 e!570501)))

(declare-fun c!102618 () Bool)

(assert (=> d!120627 (= c!102618 (and (is-Cons!21417 (t!30422 (t!30422 l!412))) (= (_2!7577 (h!22615 (t!30422 (t!30422 l!412)))) value!115)))))

(assert (=> d!120627 (isStrictlySorted!567 (t!30422 (t!30422 l!412)))))

(assert (=> d!120627 (= (getKeysOf!43 (t!30422 (t!30422 l!412)) value!115) lt!448443)))

(declare-fun bm!42763 () Bool)

(assert (=> bm!42763 (= call!42768 (isEmpty!828 call!42769))))

(declare-fun bm!42764 () Bool)

(assert (=> bm!42764 (= call!42769 (getKeysOf!43 (t!30422 (t!30422 (t!30422 l!412))) value!115))))

(declare-fun bm!42765 () Bool)

(assert (=> bm!42765 (= call!42766 (lemmaForallGetValueByKeySameWithASmallerHead!31 (ite c!102618 lt!448435 lt!448436) (ite c!102618 lt!448438 lt!448441) value!115 (ite c!102618 lt!448440 lt!448434)))))

(declare-fun bm!42766 () Bool)

(assert (=> bm!42766 (= call!42767 (forall!236 (ite c!102618 lt!448438 lt!448441) (ite c!102618 lambda!663 lambda!664)))))

(assert (= (and d!120627 c!102618) b!1014153))

(assert (= (and d!120627 (not c!102618)) b!1014158))

(assert (= (and b!1014153 c!102616) b!1014155))

(assert (= (and b!1014153 (not c!102616)) b!1014154))

(assert (= (and b!1014158 c!102617) b!1014152))

(assert (= (and b!1014158 (not c!102617)) b!1014159))

(assert (= (and b!1014152 c!102619) b!1014157))

(assert (= (and b!1014152 (not c!102619)) b!1014156))

(assert (= (or b!1014155 b!1014157) bm!42765))

(assert (= (or b!1014155 b!1014157) bm!42766))

(assert (= (or b!1014153 b!1014155 b!1014152 b!1014157) bm!42764))

(assert (= (or b!1014153 b!1014152) bm!42763))

(declare-fun m!936817 () Bool)

(assert (=> bm!42766 m!936817))

(declare-fun m!936819 () Bool)

(assert (=> bm!42763 m!936819))

(declare-fun m!936821 () Bool)

(assert (=> d!120627 m!936821))

(assert (=> d!120627 m!936801))

(declare-fun m!936823 () Bool)

(assert (=> bm!42764 m!936823))

(declare-fun m!936825 () Bool)

(assert (=> bm!42765 m!936825))

(assert (=> bm!42747 d!120627))

(declare-fun b!1014171 () Bool)

(declare-fun e!570509 () Option!574)

(declare-fun e!570510 () Option!574)

(assert (=> b!1014171 (= e!570509 e!570510)))

(declare-fun c!102625 () Bool)

(assert (=> b!1014171 (= c!102625 (and (is-Cons!21417 l!412) (not (= (_1!7577 (h!22615 l!412)) (h!22616 lt!448295)))))))

(declare-fun b!1014170 () Bool)

(assert (=> b!1014170 (= e!570509 (Some!573 (_2!7577 (h!22615 l!412))))))

(declare-fun b!1014173 () Bool)

(assert (=> b!1014173 (= e!570510 None!572)))

(declare-fun d!120635 () Bool)

(declare-fun c!102624 () Bool)

(assert (=> d!120635 (= c!102624 (and (is-Cons!21417 l!412) (= (_1!7577 (h!22615 l!412)) (h!22616 lt!448295))))))

(assert (=> d!120635 (= (getValueByKey!523 l!412 (h!22616 lt!448295)) e!570509)))

(declare-fun b!1014172 () Bool)

(assert (=> b!1014172 (= e!570510 (getValueByKey!523 (t!30422 l!412) (h!22616 lt!448295)))))

(assert (= (and d!120635 c!102624) b!1014170))

(assert (= (and d!120635 (not c!102624)) b!1014171))

(assert (= (and b!1014171 c!102625) b!1014172))

(assert (= (and b!1014171 (not c!102625)) b!1014173))

(declare-fun m!936827 () Bool)

(assert (=> b!1014172 m!936827))

(assert (=> bs!29053 d!120635))

(declare-fun bs!29118 () Bool)

(declare-fun b!1014175 () Bool)

(assert (= bs!29118 (and b!1014175 b!1014157)))

(declare-fun lambda!670 () Int)

(assert (=> bs!29118 (= (= (ite c!102595 lt!448369 lt!448374) (Cons!21417 lt!448434 lt!448436)) (= lambda!670 lambda!664))))

(declare-fun bs!29120 () Bool)

(assert (= bs!29120 (and b!1014175 d!120581)))

(assert (=> bs!29120 (= (= (ite c!102595 lt!448369 lt!448374) (Cons!21417 (h!22615 l!412) (t!30422 l!412))) (= lambda!670 lambda!651))))

(declare-fun bs!29122 () Bool)

(assert (= bs!29122 (and b!1014175 d!120573)))

(assert (=> bs!29122 (= (= (ite c!102595 lt!448369 lt!448374) (t!30422 l!412)) (= lambda!670 lambda!634))))

(declare-fun bs!29123 () Bool)

(assert (= bs!29123 (and b!1014175 b!1013925)))

(assert (=> bs!29123 (= (= (ite c!102595 lt!448369 lt!448374) l!412) (= lambda!670 lambda!601))))

(declare-fun bs!29125 () Bool)

(assert (= bs!29125 (and b!1014175 b!1014084)))

(assert (=> bs!29125 (= (= (ite c!102595 lt!448369 lt!448374) (t!30422 l!412)) (= lambda!670 lambda!647))))

(declare-fun bs!29126 () Bool)

(assert (= bs!29126 (and b!1014175 b!1014040)))

(assert (=> bs!29126 (= (= (ite c!102595 lt!448369 lt!448374) (Cons!21417 lt!448380 lt!448369)) (= lambda!670 lambda!627))))

(declare-fun bs!29127 () Bool)

(assert (= bs!29127 (and b!1014175 b!1014044)))

(assert (=> bs!29127 (= (= (ite c!102595 lt!448369 lt!448374) (Cons!21417 lt!448368 lt!448374)) (= lambda!670 lambda!631))))

(declare-fun bs!29128 () Bool)

(assert (= bs!29128 (and b!1014175 b!1014155)))

(assert (=> bs!29128 (= (= (ite c!102595 lt!448369 lt!448374) (Cons!21417 lt!448440 lt!448435)) (= lambda!670 lambda!663))))

(declare-fun bs!29129 () Bool)

(assert (= bs!29129 (and b!1014175 d!120611)))

(assert (=> bs!29129 (= (= (ite c!102595 lt!448369 lt!448374) (Cons!21417 (h!22615 l!412) (t!30422 l!412))) (= lambda!670 lambda!662))))

(declare-fun bs!29130 () Bool)

(assert (= bs!29130 (and b!1014175 d!120627)))

(assert (=> bs!29130 (= (= (ite c!102595 lt!448369 lt!448374) (t!30422 (t!30422 l!412))) (= lambda!670 lambda!668))))

(declare-fun bs!29131 () Bool)

(assert (= bs!29131 (and b!1014175 b!1013926)))

(assert (=> bs!29131 (= (= (ite c!102595 lt!448369 lt!448374) l!412) (= lambda!670 lambda!602))))

(assert (=> b!1014175 true))

(assert (=> b!1014175 true))

(declare-fun bs!29137 () Bool)

(declare-fun d!120637 () Bool)

(assert (= bs!29137 (and d!120637 b!1014157)))

(declare-fun lambda!672 () Int)

(assert (=> bs!29137 (= (= (Cons!21417 (ite c!102595 lt!448380 lt!448368) (ite c!102595 lt!448369 lt!448374)) (Cons!21417 lt!448434 lt!448436)) (= lambda!672 lambda!664))))

(declare-fun bs!29139 () Bool)

(assert (= bs!29139 (and d!120637 d!120581)))

(assert (=> bs!29139 (= (= (Cons!21417 (ite c!102595 lt!448380 lt!448368) (ite c!102595 lt!448369 lt!448374)) (Cons!21417 (h!22615 l!412) (t!30422 l!412))) (= lambda!672 lambda!651))))

(declare-fun bs!29140 () Bool)

(assert (= bs!29140 (and d!120637 d!120573)))

(assert (=> bs!29140 (= (= (Cons!21417 (ite c!102595 lt!448380 lt!448368) (ite c!102595 lt!448369 lt!448374)) (t!30422 l!412)) (= lambda!672 lambda!634))))

(declare-fun bs!29142 () Bool)

(assert (= bs!29142 (and d!120637 b!1013925)))

(assert (=> bs!29142 (= (= (Cons!21417 (ite c!102595 lt!448380 lt!448368) (ite c!102595 lt!448369 lt!448374)) l!412) (= lambda!672 lambda!601))))

(declare-fun bs!29144 () Bool)

(assert (= bs!29144 (and d!120637 b!1014175)))

(assert (=> bs!29144 (= (= (Cons!21417 (ite c!102595 lt!448380 lt!448368) (ite c!102595 lt!448369 lt!448374)) (ite c!102595 lt!448369 lt!448374)) (= lambda!672 lambda!670))))

(declare-fun bs!29146 () Bool)

(assert (= bs!29146 (and d!120637 b!1014084)))

(assert (=> bs!29146 (= (= (Cons!21417 (ite c!102595 lt!448380 lt!448368) (ite c!102595 lt!448369 lt!448374)) (t!30422 l!412)) (= lambda!672 lambda!647))))

(declare-fun bs!29147 () Bool)

(assert (= bs!29147 (and d!120637 b!1014040)))

(assert (=> bs!29147 (= (= (Cons!21417 (ite c!102595 lt!448380 lt!448368) (ite c!102595 lt!448369 lt!448374)) (Cons!21417 lt!448380 lt!448369)) (= lambda!672 lambda!627))))

(declare-fun bs!29148 () Bool)

(assert (= bs!29148 (and d!120637 b!1014044)))

(assert (=> bs!29148 (= (= (Cons!21417 (ite c!102595 lt!448380 lt!448368) (ite c!102595 lt!448369 lt!448374)) (Cons!21417 lt!448368 lt!448374)) (= lambda!672 lambda!631))))

(declare-fun bs!29149 () Bool)

(assert (= bs!29149 (and d!120637 b!1014155)))

(assert (=> bs!29149 (= (= (Cons!21417 (ite c!102595 lt!448380 lt!448368) (ite c!102595 lt!448369 lt!448374)) (Cons!21417 lt!448440 lt!448435)) (= lambda!672 lambda!663))))

(declare-fun bs!29150 () Bool)

(assert (= bs!29150 (and d!120637 d!120611)))

(assert (=> bs!29150 (= (= (Cons!21417 (ite c!102595 lt!448380 lt!448368) (ite c!102595 lt!448369 lt!448374)) (Cons!21417 (h!22615 l!412) (t!30422 l!412))) (= lambda!672 lambda!662))))

(declare-fun bs!29152 () Bool)

(assert (= bs!29152 (and d!120637 d!120627)))

(assert (=> bs!29152 (= (= (Cons!21417 (ite c!102595 lt!448380 lt!448368) (ite c!102595 lt!448369 lt!448374)) (t!30422 (t!30422 l!412))) (= lambda!672 lambda!668))))

(declare-fun bs!29154 () Bool)

(assert (= bs!29154 (and d!120637 b!1013926)))

(assert (=> bs!29154 (= (= (Cons!21417 (ite c!102595 lt!448380 lt!448368) (ite c!102595 lt!448369 lt!448374)) l!412) (= lambda!672 lambda!602))))

(assert (=> d!120637 true))

(assert (=> d!120637 true))

(assert (=> d!120637 true))

(assert (=> d!120637 (forall!236 (ite c!102595 lt!448376 lt!448383) lambda!672)))

(declare-fun lt!448456 () Unit!33147)

(assert (=> d!120637 (= lt!448456 (choose!1632 (ite c!102595 lt!448369 lt!448374) (ite c!102595 lt!448376 lt!448383) value!115 (ite c!102595 lt!448380 lt!448368)))))

(declare-fun e!570511 () Bool)

(assert (=> d!120637 e!570511))

(declare-fun res!680671 () Bool)

(assert (=> d!120637 (=> (not res!680671) (not e!570511))))

(assert (=> d!120637 (= res!680671 (isStrictlySorted!567 (ite c!102595 lt!448369 lt!448374)))))

(assert (=> d!120637 (= (lemmaForallGetValueByKeySameWithASmallerHead!31 (ite c!102595 lt!448369 lt!448374) (ite c!102595 lt!448376 lt!448383) value!115 (ite c!102595 lt!448380 lt!448368)) lt!448456)))

(declare-fun b!1014174 () Bool)

(declare-fun res!680670 () Bool)

(assert (=> b!1014174 (=> (not res!680670) (not e!570511))))

(assert (=> b!1014174 (= res!680670 (not (isEmpty!831 (ite c!102595 lt!448369 lt!448374))))))

(declare-fun res!680669 () Bool)

(assert (=> b!1014175 (=> (not res!680669) (not e!570511))))

(assert (=> b!1014175 (= res!680669 (forall!236 (ite c!102595 lt!448376 lt!448383) lambda!670))))

(declare-fun b!1014176 () Bool)

(assert (=> b!1014176 (= e!570511 (bvslt (_1!7577 (ite c!102595 lt!448380 lt!448368)) (_1!7577 (head!938 (ite c!102595 lt!448369 lt!448374)))))))

(assert (= (and d!120637 res!680671) b!1014174))

(assert (= (and b!1014174 res!680670) b!1014175))

(assert (= (and b!1014175 res!680669) b!1014176))

(declare-fun m!936829 () Bool)

(assert (=> d!120637 m!936829))

(declare-fun m!936831 () Bool)

(assert (=> d!120637 m!936831))

(declare-fun m!936833 () Bool)

(assert (=> d!120637 m!936833))

(declare-fun m!936835 () Bool)

(assert (=> b!1014174 m!936835))

(declare-fun m!936837 () Bool)

(assert (=> b!1014175 m!936837))

(declare-fun m!936839 () Bool)

(assert (=> b!1014176 m!936839))

(assert (=> bm!42749 d!120637))

(declare-fun d!120639 () Bool)

(declare-fun res!680672 () Bool)

(declare-fun e!570512 () Bool)

(assert (=> d!120639 (=> res!680672 e!570512)))

(assert (=> d!120639 (= res!680672 (is-Nil!21419 lt!448388))))

(assert (=> d!120639 (= (forall!236 lt!448388 lambda!634) e!570512)))

(declare-fun b!1014177 () Bool)

(declare-fun e!570513 () Bool)

(assert (=> b!1014177 (= e!570512 e!570513)))

(declare-fun res!680673 () Bool)

(assert (=> b!1014177 (=> (not res!680673) (not e!570513))))

(assert (=> b!1014177 (= res!680673 (dynLambda!1888 lambda!634 (h!22616 lt!448388)))))

(declare-fun b!1014178 () Bool)

(assert (=> b!1014178 (= e!570513 (forall!236 (t!30423 lt!448388) lambda!634))))

(assert (= (and d!120639 (not res!680672)) b!1014177))

(assert (= (and b!1014177 res!680673) b!1014178))

(declare-fun b_lambda!15307 () Bool)

(assert (=> (not b_lambda!15307) (not b!1014177)))

(declare-fun m!936841 () Bool)

(assert (=> b!1014177 m!936841))

(declare-fun m!936843 () Bool)

(assert (=> b!1014178 m!936843))

(assert (=> d!120573 d!120639))

(assert (=> d!120573 d!120613))

(assert (=> b!1013981 d!120613))

(declare-fun d!120641 () Bool)

(declare-fun res!680674 () Bool)

(declare-fun e!570514 () Bool)

(assert (=> d!120641 (=> res!680674 e!570514)))

(assert (=> d!120641 (= res!680674 (is-Nil!21419 (ite c!102595 lt!448376 lt!448383)))))

(assert (=> d!120641 (= (forall!236 (ite c!102595 lt!448376 lt!448383) (ite c!102595 lambda!627 lambda!631)) e!570514)))

(declare-fun b!1014179 () Bool)

(declare-fun e!570515 () Bool)

(assert (=> b!1014179 (= e!570514 e!570515)))

(declare-fun res!680675 () Bool)

(assert (=> b!1014179 (=> (not res!680675) (not e!570515))))

(assert (=> b!1014179 (= res!680675 (dynLambda!1888 (ite c!102595 lambda!627 lambda!631) (h!22616 (ite c!102595 lt!448376 lt!448383))))))

(declare-fun b!1014180 () Bool)

(assert (=> b!1014180 (= e!570515 (forall!236 (t!30423 (ite c!102595 lt!448376 lt!448383)) (ite c!102595 lambda!627 lambda!631)))))

(assert (= (and d!120641 (not res!680674)) b!1014179))

(assert (= (and b!1014179 res!680675) b!1014180))

(declare-fun b_lambda!15309 () Bool)

(assert (=> (not b_lambda!15309) (not b!1014179)))

(declare-fun m!936855 () Bool)

(assert (=> b!1014179 m!936855))

(declare-fun m!936857 () Bool)

(assert (=> b!1014180 m!936857))

(assert (=> bm!42750 d!120641))

(declare-fun d!120645 () Bool)

(declare-fun res!680679 () Bool)

(declare-fun e!570517 () Bool)

(assert (=> d!120645 (=> res!680679 e!570517)))

(assert (=> d!120645 (= res!680679 (is-Nil!21419 (t!30423 lt!448295)))))

(assert (=> d!120645 (= (forall!236 (t!30423 lt!448295) lambda!601) e!570517)))

(declare-fun b!1014184 () Bool)

(declare-fun e!570518 () Bool)

(assert (=> b!1014184 (= e!570517 e!570518)))

(declare-fun res!680680 () Bool)

(assert (=> b!1014184 (=> (not res!680680) (not e!570518))))

(assert (=> b!1014184 (= res!680680 (dynLambda!1888 lambda!601 (h!22616 (t!30423 lt!448295))))))

(declare-fun b!1014185 () Bool)

(assert (=> b!1014185 (= e!570518 (forall!236 (t!30423 (t!30423 lt!448295)) lambda!601))))

(assert (= (and d!120645 (not res!680679)) b!1014184))

(assert (= (and b!1014184 res!680680) b!1014185))

(declare-fun b_lambda!15311 () Bool)

(assert (=> (not b_lambda!15311) (not b!1014184)))

(declare-fun m!936859 () Bool)

(assert (=> b!1014184 m!936859))

(declare-fun m!936861 () Bool)

(assert (=> b!1014185 m!936861))

(assert (=> b!1014099 d!120645))

(declare-fun d!120647 () Bool)

(declare-fun res!680681 () Bool)

(declare-fun e!570519 () Bool)

(assert (=> d!120647 (=> res!680681 e!570519)))

(assert (=> d!120647 (= res!680681 (is-Nil!21419 (t!30423 (Cons!21418 (_1!7577 (h!22615 l!412)) lt!448295))))))

(assert (=> d!120647 (= (forall!236 (t!30423 (Cons!21418 (_1!7577 (h!22615 l!412)) lt!448295)) lambda!602) e!570519)))

(declare-fun b!1014186 () Bool)

(declare-fun e!570520 () Bool)

(assert (=> b!1014186 (= e!570519 e!570520)))

(declare-fun res!680682 () Bool)

(assert (=> b!1014186 (=> (not res!680682) (not e!570520))))

(assert (=> b!1014186 (= res!680682 (dynLambda!1888 lambda!602 (h!22616 (t!30423 (Cons!21418 (_1!7577 (h!22615 l!412)) lt!448295)))))))

(declare-fun b!1014187 () Bool)

(assert (=> b!1014187 (= e!570520 (forall!236 (t!30423 (t!30423 (Cons!21418 (_1!7577 (h!22615 l!412)) lt!448295))) lambda!602))))

(assert (= (and d!120647 (not res!680681)) b!1014186))

(assert (= (and b!1014186 res!680682) b!1014187))

(declare-fun b_lambda!15313 () Bool)

(assert (=> (not b_lambda!15313) (not b!1014186)))

(declare-fun m!936863 () Bool)

(assert (=> b!1014186 m!936863))

(declare-fun m!936865 () Bool)

(assert (=> b!1014187 m!936865))

(assert (=> b!1013992 d!120647))

(declare-fun b!1014188 () Bool)

(declare-fun e!570521 () Bool)

(declare-fun tp!70497 () Bool)

(assert (=> b!1014188 (= e!570521 (and tp_is_empty!23485 tp!70497))))

(assert (=> b!1014108 (= tp!70492 e!570521)))

(assert (= (and b!1014108 (is-Cons!21417 (t!30422 (t!30422 l!412)))) b!1014188))

(declare-fun b_lambda!15315 () Bool)

(assert (= b_lambda!15303 (or b!1014084 b_lambda!15315)))

(declare-fun bs!29170 () Bool)

(declare-fun d!120649 () Bool)

(assert (= bs!29170 (and d!120649 b!1014084)))

(assert (=> bs!29170 (= (dynLambda!1888 lambda!647 (h!22616 lt!448295)) (= (getValueByKey!523 (t!30422 l!412) (h!22616 lt!448295)) (Some!573 value!115)))))

(assert (=> bs!29170 m!936827))

(assert (=> b!1014136 d!120649))

(declare-fun b_lambda!15317 () Bool)

(assert (= b_lambda!15301 (or d!120581 b_lambda!15317)))

(declare-fun bs!29172 () Bool)

(declare-fun d!120651 () Bool)

(assert (= bs!29172 (and d!120651 d!120581)))

(assert (=> bs!29172 (= (dynLambda!1888 lambda!651 (h!22616 lt!448295)) (= (getValueByKey!523 (Cons!21417 (h!22615 l!412) (t!30422 l!412)) (h!22616 lt!448295)) (Some!573 value!115)))))

(declare-fun m!936867 () Bool)

(assert (=> bs!29172 m!936867))

(assert (=> b!1014132 d!120651))

(declare-fun b_lambda!15319 () Bool)

(assert (= b_lambda!15307 (or d!120573 b_lambda!15319)))

(declare-fun bs!29175 () Bool)

(declare-fun d!120653 () Bool)

(assert (= bs!29175 (and d!120653 d!120573)))

(assert (=> bs!29175 (= (dynLambda!1888 lambda!634 (h!22616 lt!448388)) (= (getValueByKey!523 (t!30422 l!412) (h!22616 lt!448388)) (Some!573 value!115)))))

(declare-fun m!936869 () Bool)

(assert (=> bs!29175 m!936869))

(assert (=> b!1014177 d!120653))

(declare-fun b_lambda!15321 () Bool)

(assert (= b_lambda!15313 (or b!1013926 b_lambda!15321)))

(declare-fun bs!29177 () Bool)

(declare-fun d!120655 () Bool)

(assert (= bs!29177 (and d!120655 b!1013926)))

(assert (=> bs!29177 (= (dynLambda!1888 lambda!602 (h!22616 (t!30423 (Cons!21418 (_1!7577 (h!22615 l!412)) lt!448295)))) (= (getValueByKey!523 l!412 (h!22616 (t!30423 (Cons!21418 (_1!7577 (h!22615 l!412)) lt!448295)))) (Some!573 value!115)))))

(declare-fun m!936871 () Bool)

(assert (=> bs!29177 m!936871))

(assert (=> b!1014186 d!120655))

(declare-fun b_lambda!15323 () Bool)

(assert (= b_lambda!15311 (or b!1013925 b_lambda!15323)))

(declare-fun bs!29178 () Bool)

(declare-fun d!120657 () Bool)

(assert (= bs!29178 (and d!120657 b!1013925)))

(assert (=> bs!29178 (= (dynLambda!1888 lambda!601 (h!22616 (t!30423 lt!448295))) (= (getValueByKey!523 l!412 (h!22616 (t!30423 lt!448295))) (Some!573 value!115)))))

(declare-fun m!936873 () Bool)

(assert (=> bs!29178 m!936873))

(assert (=> b!1014184 d!120657))

(push 1)

