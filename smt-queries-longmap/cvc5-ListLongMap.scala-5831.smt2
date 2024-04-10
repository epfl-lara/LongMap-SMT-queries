; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75250 () Bool)

(assert start!75250)

(declare-fun res!601866 () Bool)

(declare-fun e!493538 () Bool)

(assert (=> start!75250 (=> (not res!601866) (not e!493538))))

(declare-datatypes ((B!1304 0))(
  ( (B!1305 (val!8958 Int)) )
))
(declare-datatypes ((tuple2!11910 0))(
  ( (tuple2!11911 (_1!5966 (_ BitVec 64)) (_2!5966 B!1304)) )
))
(declare-datatypes ((List!17674 0))(
  ( (Nil!17671) (Cons!17670 (h!18801 tuple2!11910) (t!24954 List!17674)) )
))
(declare-fun l!906 () List!17674)

(declare-fun isStrictlySorted!492 (List!17674) Bool)

(assert (=> start!75250 (= res!601866 (isStrictlySorted!492 l!906))))

(assert (=> start!75250 e!493538))

(declare-fun e!493539 () Bool)

(assert (=> start!75250 e!493539))

(assert (=> start!75250 true))

(declare-fun tp_is_empty!17815 () Bool)

(assert (=> start!75250 tp_is_empty!17815))

(declare-fun b!886592 () Bool)

(declare-fun res!601867 () Bool)

(assert (=> b!886592 (=> (not res!601867) (not e!493538))))

(declare-fun key1!49 () (_ BitVec 64))

(assert (=> b!886592 (= res!601867 (or (not (is-Cons!17670 l!906)) (bvsge (_1!5966 (h!18801 l!906)) key1!49)))))

(declare-fun v2!16 () B!1304)

(declare-fun v1!38 () B!1304)

(declare-fun b!886593 () Bool)

(declare-fun insertStrictlySorted!300 (List!17674 (_ BitVec 64) B!1304) List!17674)

(assert (=> b!886593 (= e!493538 (not (= (insertStrictlySorted!300 (insertStrictlySorted!300 l!906 key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!300 l!906 key1!49 v2!16))))))

(declare-fun b!886594 () Bool)

(declare-fun tp!54386 () Bool)

(assert (=> b!886594 (= e!493539 (and tp_is_empty!17815 tp!54386))))

(assert (= (and start!75250 res!601866) b!886592))

(assert (= (and b!886592 res!601867) b!886593))

(assert (= (and start!75250 (is-Cons!17670 l!906)) b!886594))

(declare-fun m!826483 () Bool)

(assert (=> start!75250 m!826483))

(declare-fun m!826485 () Bool)

(assert (=> b!886593 m!826485))

(assert (=> b!886593 m!826485))

(declare-fun m!826487 () Bool)

(assert (=> b!886593 m!826487))

(declare-fun m!826489 () Bool)

(assert (=> b!886593 m!826489))

(push 1)

(assert (not b!886593))

(assert (not start!75250))

(assert (not b!886594))

(assert tp_is_empty!17815)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!109747 () Bool)

(declare-fun e!493597 () Bool)

(assert (=> d!109747 e!493597))

(declare-fun res!601905 () Bool)

(assert (=> d!109747 (=> (not res!601905) (not e!493597))))

(declare-fun lt!401150 () List!17674)

(assert (=> d!109747 (= res!601905 (isStrictlySorted!492 lt!401150))))

(declare-fun e!493598 () List!17674)

(assert (=> d!109747 (= lt!401150 e!493598)))

(declare-fun c!93545 () Bool)

(assert (=> d!109747 (= c!93545 (and (is-Cons!17670 (insertStrictlySorted!300 l!906 key1!49 v1!38)) (bvslt (_1!5966 (h!18801 (insertStrictlySorted!300 l!906 key1!49 v1!38))) key1!49)))))

(assert (=> d!109747 (isStrictlySorted!492 (insertStrictlySorted!300 l!906 key1!49 v1!38))))

(assert (=> d!109747 (= (insertStrictlySorted!300 (insertStrictlySorted!300 l!906 key1!49 v1!38) key1!49 v2!16) lt!401150)))

(declare-fun b!886685 () Bool)

(declare-fun e!493595 () List!17674)

(assert (=> b!886685 (= e!493598 e!493595)))

(declare-fun c!93544 () Bool)

(assert (=> b!886685 (= c!93544 (and (is-Cons!17670 (insertStrictlySorted!300 l!906 key1!49 v1!38)) (= (_1!5966 (h!18801 (insertStrictlySorted!300 l!906 key1!49 v1!38))) key1!49)))))

(declare-fun b!886686 () Bool)

(declare-fun e!493596 () List!17674)

(declare-fun call!39275 () List!17674)

(assert (=> b!886686 (= e!493596 call!39275)))

(declare-fun e!493594 () List!17674)

(declare-fun b!886687 () Bool)

(assert (=> b!886687 (= e!493594 (insertStrictlySorted!300 (t!24954 (insertStrictlySorted!300 l!906 key1!49 v1!38)) key1!49 v2!16))))

(declare-fun b!886688 () Bool)

(declare-fun res!601904 () Bool)

(assert (=> b!886688 (=> (not res!601904) (not e!493597))))

(declare-fun containsKey!414 (List!17674 (_ BitVec 64)) Bool)

(assert (=> b!886688 (= res!601904 (containsKey!414 lt!401150 key1!49))))

(declare-fun b!886689 () Bool)

(assert (=> b!886689 (= e!493596 call!39275)))

(declare-fun b!886690 () Bool)

(declare-fun c!93543 () Bool)

(assert (=> b!886690 (= e!493594 (ite c!93544 (t!24954 (insertStrictlySorted!300 l!906 key1!49 v1!38)) (ite c!93543 (Cons!17670 (h!18801 (insertStrictlySorted!300 l!906 key1!49 v1!38)) (t!24954 (insertStrictlySorted!300 l!906 key1!49 v1!38))) Nil!17671)))))

(declare-fun b!886691 () Bool)

(declare-fun call!39276 () List!17674)

(assert (=> b!886691 (= e!493595 call!39276)))

(declare-fun bm!39272 () Bool)

(declare-fun call!39277 () List!17674)

(assert (=> bm!39272 (= call!39276 call!39277)))

(declare-fun b!886692 () Bool)

(declare-fun contains!4299 (List!17674 tuple2!11910) Bool)

(assert (=> b!886692 (= e!493597 (contains!4299 lt!401150 (tuple2!11911 key1!49 v2!16)))))

(declare-fun b!886693 () Bool)

(assert (=> b!886693 (= c!93543 (and (is-Cons!17670 (insertStrictlySorted!300 l!906 key1!49 v1!38)) (bvsgt (_1!5966 (h!18801 (insertStrictlySorted!300 l!906 key1!49 v1!38))) key1!49)))))

(assert (=> b!886693 (= e!493595 e!493596)))

(declare-fun b!886694 () Bool)

(assert (=> b!886694 (= e!493598 call!39277)))

(declare-fun bm!39273 () Bool)

(declare-fun $colon$colon!550 (List!17674 tuple2!11910) List!17674)

(assert (=> bm!39273 (= call!39277 ($colon$colon!550 e!493594 (ite c!93545 (h!18801 (insertStrictlySorted!300 l!906 key1!49 v1!38)) (tuple2!11911 key1!49 v2!16))))))

(declare-fun c!93546 () Bool)

(assert (=> bm!39273 (= c!93546 c!93545)))

(declare-fun bm!39274 () Bool)

(assert (=> bm!39274 (= call!39275 call!39276)))

(assert (= (and d!109747 c!93545) b!886694))

(assert (= (and d!109747 (not c!93545)) b!886685))

(assert (= (and b!886685 c!93544) b!886691))

(assert (= (and b!886685 (not c!93544)) b!886693))

(assert (= (and b!886693 c!93543) b!886686))

(assert (= (and b!886693 (not c!93543)) b!886689))

(assert (= (or b!886686 b!886689) bm!39274))

(assert (= (or b!886691 bm!39274) bm!39272))

(assert (= (or b!886694 bm!39272) bm!39273))

(assert (= (and bm!39273 c!93546) b!886687))

(assert (= (and bm!39273 (not c!93546)) b!886690))

(assert (= (and d!109747 res!601905) b!886688))

(assert (= (and b!886688 res!601904) b!886692))

(declare-fun m!826511 () Bool)

(assert (=> bm!39273 m!826511))

(declare-fun m!826513 () Bool)

(assert (=> b!886688 m!826513))

(declare-fun m!826515 () Bool)

(assert (=> b!886692 m!826515))

(declare-fun m!826517 () Bool)

(assert (=> d!109747 m!826517))

(assert (=> d!109747 m!826485))

(declare-fun m!826519 () Bool)

(assert (=> d!109747 m!826519))

(declare-fun m!826521 () Bool)

(assert (=> b!886687 m!826521))

(assert (=> b!886593 d!109747))

(declare-fun d!109755 () Bool)

(declare-fun e!493602 () Bool)

(assert (=> d!109755 e!493602))

(declare-fun res!601907 () Bool)

(assert (=> d!109755 (=> (not res!601907) (not e!493602))))

(declare-fun lt!401151 () List!17674)

(assert (=> d!109755 (= res!601907 (isStrictlySorted!492 lt!401151))))

(declare-fun e!493603 () List!17674)

(assert (=> d!109755 (= lt!401151 e!493603)))

(declare-fun c!93549 () Bool)

(assert (=> d!109755 (= c!93549 (and (is-Cons!17670 l!906) (bvslt (_1!5966 (h!18801 l!906)) key1!49)))))

(assert (=> d!109755 (isStrictlySorted!492 l!906)))

(assert (=> d!109755 (= (insertStrictlySorted!300 l!906 key1!49 v1!38) lt!401151)))

(declare-fun b!886695 () Bool)

(declare-fun e!493600 () List!17674)

(assert (=> b!886695 (= e!493603 e!493600)))

(declare-fun c!93548 () Bool)

(assert (=> b!886695 (= c!93548 (and (is-Cons!17670 l!906) (= (_1!5966 (h!18801 l!906)) key1!49)))))

(declare-fun b!886696 () Bool)

(declare-fun e!493601 () List!17674)

(declare-fun call!39278 () List!17674)

(assert (=> b!886696 (= e!493601 call!39278)))

(declare-fun e!493599 () List!17674)

(declare-fun b!886697 () Bool)

(assert (=> b!886697 (= e!493599 (insertStrictlySorted!300 (t!24954 l!906) key1!49 v1!38))))

(declare-fun b!886698 () Bool)

(declare-fun res!601906 () Bool)

(assert (=> b!886698 (=> (not res!601906) (not e!493602))))

(assert (=> b!886698 (= res!601906 (containsKey!414 lt!401151 key1!49))))

(declare-fun b!886699 () Bool)

(assert (=> b!886699 (= e!493601 call!39278)))

(declare-fun b!886700 () Bool)

(declare-fun c!93547 () Bool)

(assert (=> b!886700 (= e!493599 (ite c!93548 (t!24954 l!906) (ite c!93547 (Cons!17670 (h!18801 l!906) (t!24954 l!906)) Nil!17671)))))

(declare-fun b!886701 () Bool)

(declare-fun call!39279 () List!17674)

(assert (=> b!886701 (= e!493600 call!39279)))

(declare-fun bm!39275 () Bool)

(declare-fun call!39280 () List!17674)

(assert (=> bm!39275 (= call!39279 call!39280)))

(declare-fun b!886702 () Bool)

(assert (=> b!886702 (= e!493602 (contains!4299 lt!401151 (tuple2!11911 key1!49 v1!38)))))

(declare-fun b!886703 () Bool)

(assert (=> b!886703 (= c!93547 (and (is-Cons!17670 l!906) (bvsgt (_1!5966 (h!18801 l!906)) key1!49)))))

(assert (=> b!886703 (= e!493600 e!493601)))

(declare-fun b!886704 () Bool)

(assert (=> b!886704 (= e!493603 call!39280)))

(declare-fun bm!39276 () Bool)

(assert (=> bm!39276 (= call!39280 ($colon$colon!550 e!493599 (ite c!93549 (h!18801 l!906) (tuple2!11911 key1!49 v1!38))))))

(declare-fun c!93550 () Bool)

(assert (=> bm!39276 (= c!93550 c!93549)))

(declare-fun bm!39277 () Bool)

(assert (=> bm!39277 (= call!39278 call!39279)))

(assert (= (and d!109755 c!93549) b!886704))

(assert (= (and d!109755 (not c!93549)) b!886695))

(assert (= (and b!886695 c!93548) b!886701))

(assert (= (and b!886695 (not c!93548)) b!886703))

(assert (= (and b!886703 c!93547) b!886696))

(assert (= (and b!886703 (not c!93547)) b!886699))

(assert (= (or b!886696 b!886699) bm!39277))

(assert (= (or b!886701 bm!39277) bm!39275))

(assert (= (or b!886704 bm!39275) bm!39276))

(assert (= (and bm!39276 c!93550) b!886697))

(assert (= (and bm!39276 (not c!93550)) b!886700))

(assert (= (and d!109755 res!601907) b!886698))

(assert (= (and b!886698 res!601906) b!886702))

(declare-fun m!826523 () Bool)

(assert (=> bm!39276 m!826523))

(declare-fun m!826525 () Bool)

(assert (=> b!886698 m!826525))

(declare-fun m!826527 () Bool)

(assert (=> b!886702 m!826527))

(declare-fun m!826529 () Bool)

(assert (=> d!109755 m!826529))

(assert (=> d!109755 m!826483))

(declare-fun m!826531 () Bool)

(assert (=> b!886697 m!826531))

(assert (=> b!886593 d!109755))

(declare-fun d!109757 () Bool)

(declare-fun e!493612 () Bool)

(assert (=> d!109757 e!493612))

(declare-fun res!601911 () Bool)

(assert (=> d!109757 (=> (not res!601911) (not e!493612))))

(declare-fun lt!401153 () List!17674)

(assert (=> d!109757 (= res!601911 (isStrictlySorted!492 lt!401153))))

(declare-fun e!493613 () List!17674)

(assert (=> d!109757 (= lt!401153 e!493613)))

(declare-fun c!93557 () Bool)

(assert (=> d!109757 (= c!93557 (and (is-Cons!17670 l!906) (bvslt (_1!5966 (h!18801 l!906)) key1!49)))))

(assert (=> d!109757 (isStrictlySorted!492 l!906)))

(assert (=> d!109757 (= (insertStrictlySorted!300 l!906 key1!49 v2!16) lt!401153)))

(declare-fun b!886715 () Bool)

(declare-fun e!493610 () List!17674)

(assert (=> b!886715 (= e!493613 e!493610)))

(declare-fun c!93556 () Bool)

(assert (=> b!886715 (= c!93556 (and (is-Cons!17670 l!906) (= (_1!5966 (h!18801 l!906)) key1!49)))))

(declare-fun b!886716 () Bool)

(declare-fun e!493611 () List!17674)

(declare-fun call!39284 () List!17674)

(assert (=> b!886716 (= e!493611 call!39284)))

(declare-fun b!886717 () Bool)

(declare-fun e!493609 () List!17674)

(assert (=> b!886717 (= e!493609 (insertStrictlySorted!300 (t!24954 l!906) key1!49 v2!16))))

(declare-fun b!886718 () Bool)

(declare-fun res!601910 () Bool)

(assert (=> b!886718 (=> (not res!601910) (not e!493612))))

(assert (=> b!886718 (= res!601910 (containsKey!414 lt!401153 key1!49))))

(declare-fun b!886719 () Bool)

(assert (=> b!886719 (= e!493611 call!39284)))

(declare-fun b!886720 () Bool)

(declare-fun c!93555 () Bool)

(assert (=> b!886720 (= e!493609 (ite c!93556 (t!24954 l!906) (ite c!93555 (Cons!17670 (h!18801 l!906) (t!24954 l!906)) Nil!17671)))))

(declare-fun b!886721 () Bool)

(declare-fun call!39285 () List!17674)

(assert (=> b!886721 (= e!493610 call!39285)))

(declare-fun bm!39281 () Bool)

(declare-fun call!39286 () List!17674)

(assert (=> bm!39281 (= call!39285 call!39286)))

(declare-fun b!886722 () Bool)

(assert (=> b!886722 (= e!493612 (contains!4299 lt!401153 (tuple2!11911 key1!49 v2!16)))))

(declare-fun b!886723 () Bool)

(assert (=> b!886723 (= c!93555 (and (is-Cons!17670 l!906) (bvsgt (_1!5966 (h!18801 l!906)) key1!49)))))

(assert (=> b!886723 (= e!493610 e!493611)))

(declare-fun b!886724 () Bool)

(assert (=> b!886724 (= e!493613 call!39286)))

(declare-fun bm!39282 () Bool)

(assert (=> bm!39282 (= call!39286 ($colon$colon!550 e!493609 (ite c!93557 (h!18801 l!906) (tuple2!11911 key1!49 v2!16))))))

(declare-fun c!93558 () Bool)

(assert (=> bm!39282 (= c!93558 c!93557)))

(declare-fun bm!39283 () Bool)

(assert (=> bm!39283 (= call!39284 call!39285)))

(assert (= (and d!109757 c!93557) b!886724))

(assert (= (and d!109757 (not c!93557)) b!886715))

(assert (= (and b!886715 c!93556) b!886721))

(assert (= (and b!886715 (not c!93556)) b!886723))

(assert (= (and b!886723 c!93555) b!886716))

(assert (= (and b!886723 (not c!93555)) b!886719))

(assert (= (or b!886716 b!886719) bm!39283))

(assert (= (or b!886721 bm!39283) bm!39281))

(assert (= (or b!886724 bm!39281) bm!39282))

(assert (= (and bm!39282 c!93558) b!886717))

(assert (= (and bm!39282 (not c!93558)) b!886720))

(assert (= (and d!109757 res!601911) b!886718))

(assert (= (and b!886718 res!601910) b!886722))

(declare-fun m!826545 () Bool)

(assert (=> bm!39282 m!826545))

(declare-fun m!826547 () Bool)

(assert (=> b!886718 m!826547))

(declare-fun m!826549 () Bool)

(assert (=> b!886722 m!826549))

(declare-fun m!826551 () Bool)

(assert (=> d!109757 m!826551))

(assert (=> d!109757 m!826483))

(declare-fun m!826553 () Bool)

(assert (=> b!886717 m!826553))

(assert (=> b!886593 d!109757))

(declare-fun d!109761 () Bool)

(declare-fun res!601926 () Bool)

(declare-fun e!493646 () Bool)

(assert (=> d!109761 (=> res!601926 e!493646)))

(assert (=> d!109761 (= res!601926 (or (is-Nil!17671 l!906) (is-Nil!17671 (t!24954 l!906))))))

(assert (=> d!109761 (= (isStrictlySorted!492 l!906) e!493646)))

(declare-fun b!886784 () Bool)

(declare-fun e!493647 () Bool)

(assert (=> b!886784 (= e!493646 e!493647)))

(declare-fun res!601927 () Bool)

(assert (=> b!886784 (=> (not res!601927) (not e!493647))))

(assert (=> b!886784 (= res!601927 (bvslt (_1!5966 (h!18801 l!906)) (_1!5966 (h!18801 (t!24954 l!906)))))))

(declare-fun b!886785 () Bool)

(assert (=> b!886785 (= e!493647 (isStrictlySorted!492 (t!24954 l!906)))))

(assert (= (and d!109761 (not res!601926)) b!886784))

(assert (= (and b!886784 res!601927) b!886785))

(declare-fun m!826605 () Bool)

(assert (=> b!886785 m!826605))

(assert (=> start!75250 d!109761))

(declare-fun b!886794 () Bool)

(declare-fun e!493652 () Bool)

(declare-fun tp!54400 () Bool)

(assert (=> b!886794 (= e!493652 (and tp_is_empty!17815 tp!54400))))

(assert (=> b!886594 (= tp!54386 e!493652)))

(assert (= (and b!886594 (is-Cons!17670 (t!24954 l!906))) b!886794))

(push 1)

(assert (not b!886687))

(assert (not d!109747))

(assert (not b!886702))

(assert (not b!886718))

(assert (not b!886794))

(assert (not b!886692))

(assert (not d!109757))

(assert (not bm!39273))

(assert (not b!886697))

(assert (not bm!39276))

(assert (not b!886698))

(assert (not d!109755))

(assert (not bm!39282))

(assert tp_is_empty!17815)

(assert (not b!886722))

(assert (not b!886717))

(assert (not b!886688))

(assert (not b!886785))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!109799 () Bool)

(declare-fun lt!401169 () Bool)

(declare-fun content!397 (List!17674) (Set tuple2!11910))

(assert (=> d!109799 (= lt!401169 (set.member (tuple2!11911 key1!49 v2!16) (content!397 lt!401153)))))

(declare-fun e!493704 () Bool)

(assert (=> d!109799 (= lt!401169 e!493704)))

(declare-fun res!601968 () Bool)

(assert (=> d!109799 (=> (not res!601968) (not e!493704))))

(assert (=> d!109799 (= res!601968 (is-Cons!17670 lt!401153))))

(assert (=> d!109799 (= (contains!4299 lt!401153 (tuple2!11911 key1!49 v2!16)) lt!401169)))

(declare-fun b!886861 () Bool)

(declare-fun e!493705 () Bool)

(assert (=> b!886861 (= e!493704 e!493705)))

(declare-fun res!601969 () Bool)

(assert (=> b!886861 (=> res!601969 e!493705)))

(assert (=> b!886861 (= res!601969 (= (h!18801 lt!401153) (tuple2!11911 key1!49 v2!16)))))

(declare-fun b!886862 () Bool)

(assert (=> b!886862 (= e!493705 (contains!4299 (t!24954 lt!401153) (tuple2!11911 key1!49 v2!16)))))

(assert (= (and d!109799 res!601968) b!886861))

(assert (= (and b!886861 (not res!601969)) b!886862))

(declare-fun m!826673 () Bool)

(assert (=> d!109799 m!826673))

(declare-fun m!826675 () Bool)

(assert (=> d!109799 m!826675))

(declare-fun m!826677 () Bool)

(assert (=> b!886862 m!826677))

(assert (=> b!886722 d!109799))

(declare-fun d!109805 () Bool)

(assert (=> d!109805 (= ($colon$colon!550 e!493594 (ite c!93545 (h!18801 (insertStrictlySorted!300 l!906 key1!49 v1!38)) (tuple2!11911 key1!49 v2!16))) (Cons!17670 (ite c!93545 (h!18801 (insertStrictlySorted!300 l!906 key1!49 v1!38)) (tuple2!11911 key1!49 v2!16)) e!493594))))

(assert (=> bm!39273 d!109805))

(declare-fun d!109807 () Bool)

(assert (=> d!109807 (= ($colon$colon!550 e!493599 (ite c!93549 (h!18801 l!906) (tuple2!11911 key1!49 v1!38))) (Cons!17670 (ite c!93549 (h!18801 l!906) (tuple2!11911 key1!49 v1!38)) e!493599))))

(assert (=> bm!39276 d!109807))

(declare-fun d!109809 () Bool)

(declare-fun res!601970 () Bool)

(declare-fun e!493706 () Bool)

(assert (=> d!109809 (=> res!601970 e!493706)))

(assert (=> d!109809 (= res!601970 (or (is-Nil!17671 (t!24954 l!906)) (is-Nil!17671 (t!24954 (t!24954 l!906)))))))

(assert (=> d!109809 (= (isStrictlySorted!492 (t!24954 l!906)) e!493706)))

(declare-fun b!886863 () Bool)

(declare-fun e!493707 () Bool)

(assert (=> b!886863 (= e!493706 e!493707)))

(declare-fun res!601971 () Bool)

(assert (=> b!886863 (=> (not res!601971) (not e!493707))))

(assert (=> b!886863 (= res!601971 (bvslt (_1!5966 (h!18801 (t!24954 l!906))) (_1!5966 (h!18801 (t!24954 (t!24954 l!906))))))))

(declare-fun b!886864 () Bool)

(assert (=> b!886864 (= e!493707 (isStrictlySorted!492 (t!24954 (t!24954 l!906))))))

(assert (= (and d!109809 (not res!601970)) b!886863))

(assert (= (and b!886863 res!601971) b!886864))

(declare-fun m!826679 () Bool)

(assert (=> b!886864 m!826679))

(assert (=> b!886785 d!109809))

(declare-fun d!109811 () Bool)

(declare-fun res!601972 () Bool)

(declare-fun e!493708 () Bool)

(assert (=> d!109811 (=> res!601972 e!493708)))

(assert (=> d!109811 (= res!601972 (or (is-Nil!17671 lt!401153) (is-Nil!17671 (t!24954 lt!401153))))))

(assert (=> d!109811 (= (isStrictlySorted!492 lt!401153) e!493708)))

(declare-fun b!886865 () Bool)

(declare-fun e!493709 () Bool)

(assert (=> b!886865 (= e!493708 e!493709)))

(declare-fun res!601973 () Bool)

(assert (=> b!886865 (=> (not res!601973) (not e!493709))))

(assert (=> b!886865 (= res!601973 (bvslt (_1!5966 (h!18801 lt!401153)) (_1!5966 (h!18801 (t!24954 lt!401153)))))))

(declare-fun b!886866 () Bool)

(assert (=> b!886866 (= e!493709 (isStrictlySorted!492 (t!24954 lt!401153)))))

(assert (= (and d!109811 (not res!601972)) b!886865))

(assert (= (and b!886865 res!601973) b!886866))

(declare-fun m!826681 () Bool)

(assert (=> b!886866 m!826681))

(assert (=> d!109757 d!109811))

(assert (=> d!109757 d!109761))

(declare-fun d!109813 () Bool)

(declare-fun lt!401170 () Bool)

(assert (=> d!109813 (= lt!401170 (set.member (tuple2!11911 key1!49 v2!16) (content!397 lt!401150)))))

(declare-fun e!493710 () Bool)

(assert (=> d!109813 (= lt!401170 e!493710)))

(declare-fun res!601974 () Bool)

(assert (=> d!109813 (=> (not res!601974) (not e!493710))))

(assert (=> d!109813 (= res!601974 (is-Cons!17670 lt!401150))))

(assert (=> d!109813 (= (contains!4299 lt!401150 (tuple2!11911 key1!49 v2!16)) lt!401170)))

(declare-fun b!886867 () Bool)

(declare-fun e!493711 () Bool)

(assert (=> b!886867 (= e!493710 e!493711)))

(declare-fun res!601975 () Bool)

(assert (=> b!886867 (=> res!601975 e!493711)))

(assert (=> b!886867 (= res!601975 (= (h!18801 lt!401150) (tuple2!11911 key1!49 v2!16)))))

(declare-fun b!886868 () Bool)

(assert (=> b!886868 (= e!493711 (contains!4299 (t!24954 lt!401150) (tuple2!11911 key1!49 v2!16)))))

(assert (= (and d!109813 res!601974) b!886867))

(assert (= (and b!886867 (not res!601975)) b!886868))

(declare-fun m!826683 () Bool)

(assert (=> d!109813 m!826683))

(declare-fun m!826685 () Bool)

(assert (=> d!109813 m!826685))

(declare-fun m!826687 () Bool)

(assert (=> b!886868 m!826687))

(assert (=> b!886692 d!109813))

(declare-fun d!109815 () Bool)

(declare-fun lt!401171 () Bool)

(assert (=> d!109815 (= lt!401171 (set.member (tuple2!11911 key1!49 v1!38) (content!397 lt!401151)))))

(declare-fun e!493712 () Bool)

(assert (=> d!109815 (= lt!401171 e!493712)))

(declare-fun res!601976 () Bool)

(assert (=> d!109815 (=> (not res!601976) (not e!493712))))

(assert (=> d!109815 (= res!601976 (is-Cons!17670 lt!401151))))

(assert (=> d!109815 (= (contains!4299 lt!401151 (tuple2!11911 key1!49 v1!38)) lt!401171)))

(declare-fun b!886869 () Bool)

(declare-fun e!493713 () Bool)

(assert (=> b!886869 (= e!493712 e!493713)))

(declare-fun res!601977 () Bool)

(assert (=> b!886869 (=> res!601977 e!493713)))

(assert (=> b!886869 (= res!601977 (= (h!18801 lt!401151) (tuple2!11911 key1!49 v1!38)))))

(declare-fun b!886870 () Bool)

(assert (=> b!886870 (= e!493713 (contains!4299 (t!24954 lt!401151) (tuple2!11911 key1!49 v1!38)))))

(assert (= (and d!109815 res!601976) b!886869))

(assert (= (and b!886869 (not res!601977)) b!886870))

(declare-fun m!826689 () Bool)

(assert (=> d!109815 m!826689))

(declare-fun m!826691 () Bool)

(assert (=> d!109815 m!826691))

(declare-fun m!826693 () Bool)

(assert (=> b!886870 m!826693))

(assert (=> b!886702 d!109815))

(declare-fun d!109817 () Bool)

(declare-fun res!601982 () Bool)

(declare-fun e!493718 () Bool)

(assert (=> d!109817 (=> res!601982 e!493718)))

(assert (=> d!109817 (= res!601982 (and (is-Cons!17670 lt!401153) (= (_1!5966 (h!18801 lt!401153)) key1!49)))))

(assert (=> d!109817 (= (containsKey!414 lt!401153 key1!49) e!493718)))

(declare-fun b!886875 () Bool)

(declare-fun e!493719 () Bool)

(assert (=> b!886875 (= e!493718 e!493719)))

(declare-fun res!601983 () Bool)

(assert (=> b!886875 (=> (not res!601983) (not e!493719))))

(assert (=> b!886875 (= res!601983 (and (or (not (is-Cons!17670 lt!401153)) (bvsle (_1!5966 (h!18801 lt!401153)) key1!49)) (is-Cons!17670 lt!401153) (bvslt (_1!5966 (h!18801 lt!401153)) key1!49)))))

(declare-fun b!886876 () Bool)

(assert (=> b!886876 (= e!493719 (containsKey!414 (t!24954 lt!401153) key1!49))))

(assert (= (and d!109817 (not res!601982)) b!886875))

(assert (= (and b!886875 res!601983) b!886876))

(declare-fun m!826695 () Bool)

(assert (=> b!886876 m!826695))

(assert (=> b!886718 d!109817))

(declare-fun d!109819 () Bool)

(declare-fun e!493723 () Bool)

(assert (=> d!109819 e!493723))

(declare-fun res!601985 () Bool)

(assert (=> d!109819 (=> (not res!601985) (not e!493723))))

(declare-fun lt!401172 () List!17674)

(assert (=> d!109819 (= res!601985 (isStrictlySorted!492 lt!401172))))

(declare-fun e!493724 () List!17674)

(assert (=> d!109819 (= lt!401172 e!493724)))

(declare-fun c!93593 () Bool)

(assert (=> d!109819 (= c!93593 (and (is-Cons!17670 (t!24954 l!906)) (bvslt (_1!5966 (h!18801 (t!24954 l!906))) key1!49)))))

(assert (=> d!109819 (isStrictlySorted!492 (t!24954 l!906))))

(assert (=> d!109819 (= (insertStrictlySorted!300 (t!24954 l!906) key1!49 v2!16) lt!401172)))

(declare-fun b!886877 () Bool)

(declare-fun e!493721 () List!17674)

(assert (=> b!886877 (= e!493724 e!493721)))

(declare-fun c!93592 () Bool)

(assert (=> b!886877 (= c!93592 (and (is-Cons!17670 (t!24954 l!906)) (= (_1!5966 (h!18801 (t!24954 l!906))) key1!49)))))

(declare-fun b!886878 () Bool)

(declare-fun e!493722 () List!17674)

(declare-fun call!39311 () List!17674)

(assert (=> b!886878 (= e!493722 call!39311)))

(declare-fun b!886879 () Bool)

(declare-fun e!493720 () List!17674)

(assert (=> b!886879 (= e!493720 (insertStrictlySorted!300 (t!24954 (t!24954 l!906)) key1!49 v2!16))))

(declare-fun b!886880 () Bool)

(declare-fun res!601984 () Bool)

(assert (=> b!886880 (=> (not res!601984) (not e!493723))))

(assert (=> b!886880 (= res!601984 (containsKey!414 lt!401172 key1!49))))

(declare-fun b!886881 () Bool)

(assert (=> b!886881 (= e!493722 call!39311)))

(declare-fun c!93591 () Bool)

(declare-fun b!886882 () Bool)

(assert (=> b!886882 (= e!493720 (ite c!93592 (t!24954 (t!24954 l!906)) (ite c!93591 (Cons!17670 (h!18801 (t!24954 l!906)) (t!24954 (t!24954 l!906))) Nil!17671)))))

(declare-fun b!886883 () Bool)

(declare-fun call!39312 () List!17674)

(assert (=> b!886883 (= e!493721 call!39312)))

(declare-fun bm!39308 () Bool)

(declare-fun call!39313 () List!17674)

(assert (=> bm!39308 (= call!39312 call!39313)))

(declare-fun b!886884 () Bool)

(assert (=> b!886884 (= e!493723 (contains!4299 lt!401172 (tuple2!11911 key1!49 v2!16)))))

(declare-fun b!886885 () Bool)

(assert (=> b!886885 (= c!93591 (and (is-Cons!17670 (t!24954 l!906)) (bvsgt (_1!5966 (h!18801 (t!24954 l!906))) key1!49)))))

(assert (=> b!886885 (= e!493721 e!493722)))

(declare-fun b!886886 () Bool)

(assert (=> b!886886 (= e!493724 call!39313)))

(declare-fun bm!39309 () Bool)

(assert (=> bm!39309 (= call!39313 ($colon$colon!550 e!493720 (ite c!93593 (h!18801 (t!24954 l!906)) (tuple2!11911 key1!49 v2!16))))))

(declare-fun c!93594 () Bool)

(assert (=> bm!39309 (= c!93594 c!93593)))

(declare-fun bm!39310 () Bool)

(assert (=> bm!39310 (= call!39311 call!39312)))

(assert (= (and d!109819 c!93593) b!886886))

(assert (= (and d!109819 (not c!93593)) b!886877))

(assert (= (and b!886877 c!93592) b!886883))

(assert (= (and b!886877 (not c!93592)) b!886885))

(assert (= (and b!886885 c!93591) b!886878))

(assert (= (and b!886885 (not c!93591)) b!886881))

(assert (= (or b!886878 b!886881) bm!39310))

(assert (= (or b!886883 bm!39310) bm!39308))

(assert (= (or b!886886 bm!39308) bm!39309))

(assert (= (and bm!39309 c!93594) b!886879))

(assert (= (and bm!39309 (not c!93594)) b!886882))

(assert (= (and d!109819 res!601985) b!886880))

(assert (= (and b!886880 res!601984) b!886884))

(declare-fun m!826697 () Bool)

(assert (=> bm!39309 m!826697))

(declare-fun m!826699 () Bool)

(assert (=> b!886880 m!826699))

(declare-fun m!826701 () Bool)

(assert (=> b!886884 m!826701))

(declare-fun m!826703 () Bool)

(assert (=> d!109819 m!826703))

(assert (=> d!109819 m!826605))

(declare-fun m!826705 () Bool)

(assert (=> b!886879 m!826705))

(assert (=> b!886717 d!109819))

(declare-fun d!109821 () Bool)

(declare-fun res!601986 () Bool)

(declare-fun e!493725 () Bool)

(assert (=> d!109821 (=> res!601986 e!493725)))

(assert (=> d!109821 (= res!601986 (or (is-Nil!17671 lt!401150) (is-Nil!17671 (t!24954 lt!401150))))))

(assert (=> d!109821 (= (isStrictlySorted!492 lt!401150) e!493725)))

(declare-fun b!886887 () Bool)

(declare-fun e!493726 () Bool)

(assert (=> b!886887 (= e!493725 e!493726)))

(declare-fun res!601987 () Bool)

(assert (=> b!886887 (=> (not res!601987) (not e!493726))))

(assert (=> b!886887 (= res!601987 (bvslt (_1!5966 (h!18801 lt!401150)) (_1!5966 (h!18801 (t!24954 lt!401150)))))))

(declare-fun b!886888 () Bool)

(assert (=> b!886888 (= e!493726 (isStrictlySorted!492 (t!24954 lt!401150)))))

(assert (= (and d!109821 (not res!601986)) b!886887))

(assert (= (and b!886887 res!601987) b!886888))

(declare-fun m!826707 () Bool)

(assert (=> b!886888 m!826707))

(assert (=> d!109747 d!109821))

(declare-fun d!109823 () Bool)

(declare-fun res!601988 () Bool)

(declare-fun e!493727 () Bool)

(assert (=> d!109823 (=> res!601988 e!493727)))

(assert (=> d!109823 (= res!601988 (or (is-Nil!17671 (insertStrictlySorted!300 l!906 key1!49 v1!38)) (is-Nil!17671 (t!24954 (insertStrictlySorted!300 l!906 key1!49 v1!38)))))))

(assert (=> d!109823 (= (isStrictlySorted!492 (insertStrictlySorted!300 l!906 key1!49 v1!38)) e!493727)))

(declare-fun b!886889 () Bool)

(declare-fun e!493728 () Bool)

(assert (=> b!886889 (= e!493727 e!493728)))

(declare-fun res!601989 () Bool)

(assert (=> b!886889 (=> (not res!601989) (not e!493728))))

(assert (=> b!886889 (= res!601989 (bvslt (_1!5966 (h!18801 (insertStrictlySorted!300 l!906 key1!49 v1!38))) (_1!5966 (h!18801 (t!24954 (insertStrictlySorted!300 l!906 key1!49 v1!38))))))))

(declare-fun b!886890 () Bool)

(assert (=> b!886890 (= e!493728 (isStrictlySorted!492 (t!24954 (insertStrictlySorted!300 l!906 key1!49 v1!38))))))

(assert (= (and d!109823 (not res!601988)) b!886889))

(assert (= (and b!886889 res!601989) b!886890))

(declare-fun m!826709 () Bool)

(assert (=> b!886890 m!826709))

(assert (=> d!109747 d!109823))

(declare-fun d!109825 () Bool)

(declare-fun res!601990 () Bool)

(declare-fun e!493729 () Bool)

(assert (=> d!109825 (=> res!601990 e!493729)))

(assert (=> d!109825 (= res!601990 (or (is-Nil!17671 lt!401151) (is-Nil!17671 (t!24954 lt!401151))))))

(assert (=> d!109825 (= (isStrictlySorted!492 lt!401151) e!493729)))

(declare-fun b!886891 () Bool)

(declare-fun e!493730 () Bool)

(assert (=> b!886891 (= e!493729 e!493730)))

(declare-fun res!601991 () Bool)

(assert (=> b!886891 (=> (not res!601991) (not e!493730))))

(assert (=> b!886891 (= res!601991 (bvslt (_1!5966 (h!18801 lt!401151)) (_1!5966 (h!18801 (t!24954 lt!401151)))))))

(declare-fun b!886892 () Bool)

(assert (=> b!886892 (= e!493730 (isStrictlySorted!492 (t!24954 lt!401151)))))

(assert (= (and d!109825 (not res!601990)) b!886891))

(assert (= (and b!886891 res!601991) b!886892))

(declare-fun m!826711 () Bool)

(assert (=> b!886892 m!826711))

(assert (=> d!109755 d!109825))

(assert (=> d!109755 d!109761))

(declare-fun d!109827 () Bool)

(assert (=> d!109827 (= ($colon$colon!550 e!493609 (ite c!93557 (h!18801 l!906) (tuple2!11911 key1!49 v2!16))) (Cons!17670 (ite c!93557 (h!18801 l!906) (tuple2!11911 key1!49 v2!16)) e!493609))))

(assert (=> bm!39282 d!109827))

(declare-fun d!109829 () Bool)

(declare-fun res!601992 () Bool)

(declare-fun e!493731 () Bool)

(assert (=> d!109829 (=> res!601992 e!493731)))

(assert (=> d!109829 (= res!601992 (and (is-Cons!17670 lt!401150) (= (_1!5966 (h!18801 lt!401150)) key1!49)))))

(assert (=> d!109829 (= (containsKey!414 lt!401150 key1!49) e!493731)))

(declare-fun b!886893 () Bool)

(declare-fun e!493732 () Bool)

(assert (=> b!886893 (= e!493731 e!493732)))

(declare-fun res!601993 () Bool)

(assert (=> b!886893 (=> (not res!601993) (not e!493732))))

(assert (=> b!886893 (= res!601993 (and (or (not (is-Cons!17670 lt!401150)) (bvsle (_1!5966 (h!18801 lt!401150)) key1!49)) (is-Cons!17670 lt!401150) (bvslt (_1!5966 (h!18801 lt!401150)) key1!49)))))

(declare-fun b!886894 () Bool)

(assert (=> b!886894 (= e!493732 (containsKey!414 (t!24954 lt!401150) key1!49))))

(assert (= (and d!109829 (not res!601992)) b!886893))

(assert (= (and b!886893 res!601993) b!886894))

(declare-fun m!826713 () Bool)

(assert (=> b!886894 m!826713))

(assert (=> b!886688 d!109829))

(declare-fun d!109831 () Bool)

(declare-fun e!493736 () Bool)

(assert (=> d!109831 e!493736))

(declare-fun res!601995 () Bool)

(assert (=> d!109831 (=> (not res!601995) (not e!493736))))

(declare-fun lt!401173 () List!17674)

(assert (=> d!109831 (= res!601995 (isStrictlySorted!492 lt!401173))))

(declare-fun e!493737 () List!17674)

(assert (=> d!109831 (= lt!401173 e!493737)))

(declare-fun c!93597 () Bool)

(assert (=> d!109831 (= c!93597 (and (is-Cons!17670 (t!24954 (insertStrictlySorted!300 l!906 key1!49 v1!38))) (bvslt (_1!5966 (h!18801 (t!24954 (insertStrictlySorted!300 l!906 key1!49 v1!38)))) key1!49)))))

(assert (=> d!109831 (isStrictlySorted!492 (t!24954 (insertStrictlySorted!300 l!906 key1!49 v1!38)))))

(assert (=> d!109831 (= (insertStrictlySorted!300 (t!24954 (insertStrictlySorted!300 l!906 key1!49 v1!38)) key1!49 v2!16) lt!401173)))

(declare-fun b!886895 () Bool)

(declare-fun e!493734 () List!17674)

(assert (=> b!886895 (= e!493737 e!493734)))

(declare-fun c!93596 () Bool)

(assert (=> b!886895 (= c!93596 (and (is-Cons!17670 (t!24954 (insertStrictlySorted!300 l!906 key1!49 v1!38))) (= (_1!5966 (h!18801 (t!24954 (insertStrictlySorted!300 l!906 key1!49 v1!38)))) key1!49)))))

(declare-fun b!886896 () Bool)

(declare-fun e!493735 () List!17674)

(declare-fun call!39314 () List!17674)

(assert (=> b!886896 (= e!493735 call!39314)))

(declare-fun e!493733 () List!17674)

(declare-fun b!886897 () Bool)

(assert (=> b!886897 (= e!493733 (insertStrictlySorted!300 (t!24954 (t!24954 (insertStrictlySorted!300 l!906 key1!49 v1!38))) key1!49 v2!16))))

(declare-fun b!886898 () Bool)

(declare-fun res!601994 () Bool)

(assert (=> b!886898 (=> (not res!601994) (not e!493736))))

(assert (=> b!886898 (= res!601994 (containsKey!414 lt!401173 key1!49))))

(declare-fun b!886899 () Bool)

(assert (=> b!886899 (= e!493735 call!39314)))

(declare-fun b!886900 () Bool)

(declare-fun c!93595 () Bool)

(assert (=> b!886900 (= e!493733 (ite c!93596 (t!24954 (t!24954 (insertStrictlySorted!300 l!906 key1!49 v1!38))) (ite c!93595 (Cons!17670 (h!18801 (t!24954 (insertStrictlySorted!300 l!906 key1!49 v1!38))) (t!24954 (t!24954 (insertStrictlySorted!300 l!906 key1!49 v1!38)))) Nil!17671)))))

(declare-fun b!886901 () Bool)

(declare-fun call!39315 () List!17674)

(assert (=> b!886901 (= e!493734 call!39315)))

(declare-fun bm!39311 () Bool)

(declare-fun call!39316 () List!17674)

(assert (=> bm!39311 (= call!39315 call!39316)))

(declare-fun b!886902 () Bool)

(assert (=> b!886902 (= e!493736 (contains!4299 lt!401173 (tuple2!11911 key1!49 v2!16)))))

(declare-fun b!886903 () Bool)

(assert (=> b!886903 (= c!93595 (and (is-Cons!17670 (t!24954 (insertStrictlySorted!300 l!906 key1!49 v1!38))) (bvsgt (_1!5966 (h!18801 (t!24954 (insertStrictlySorted!300 l!906 key1!49 v1!38)))) key1!49)))))

(assert (=> b!886903 (= e!493734 e!493735)))

(declare-fun b!886904 () Bool)

(assert (=> b!886904 (= e!493737 call!39316)))

(declare-fun bm!39312 () Bool)

(assert (=> bm!39312 (= call!39316 ($colon$colon!550 e!493733 (ite c!93597 (h!18801 (t!24954 (insertStrictlySorted!300 l!906 key1!49 v1!38))) (tuple2!11911 key1!49 v2!16))))))

(declare-fun c!93598 () Bool)

(assert (=> bm!39312 (= c!93598 c!93597)))

(declare-fun bm!39313 () Bool)

(assert (=> bm!39313 (= call!39314 call!39315)))

(assert (= (and d!109831 c!93597) b!886904))

(assert (= (and d!109831 (not c!93597)) b!886895))

(assert (= (and b!886895 c!93596) b!886901))

(assert (= (and b!886895 (not c!93596)) b!886903))

(assert (= (and b!886903 c!93595) b!886896))

(assert (= (and b!886903 (not c!93595)) b!886899))

(assert (= (or b!886896 b!886899) bm!39313))

(assert (= (or b!886901 bm!39313) bm!39311))

(assert (= (or b!886904 bm!39311) bm!39312))

(assert (= (and bm!39312 c!93598) b!886897))

(assert (= (and bm!39312 (not c!93598)) b!886900))

(assert (= (and d!109831 res!601995) b!886898))

(assert (= (and b!886898 res!601994) b!886902))

(declare-fun m!826715 () Bool)

(assert (=> bm!39312 m!826715))

(declare-fun m!826717 () Bool)

(assert (=> b!886898 m!826717))

(declare-fun m!826719 () Bool)

(assert (=> b!886902 m!826719))

(declare-fun m!826721 () Bool)

(assert (=> d!109831 m!826721))

(assert (=> d!109831 m!826709))

(declare-fun m!826723 () Bool)

(assert (=> b!886897 m!826723))

(assert (=> b!886687 d!109831))

(declare-fun d!109833 () Bool)

(declare-fun res!601996 () Bool)

(declare-fun e!493738 () Bool)

(assert (=> d!109833 (=> res!601996 e!493738)))

(assert (=> d!109833 (= res!601996 (and (is-Cons!17670 lt!401151) (= (_1!5966 (h!18801 lt!401151)) key1!49)))))

(assert (=> d!109833 (= (containsKey!414 lt!401151 key1!49) e!493738)))

(declare-fun b!886905 () Bool)

(declare-fun e!493739 () Bool)

(assert (=> b!886905 (= e!493738 e!493739)))

(declare-fun res!601997 () Bool)

(assert (=> b!886905 (=> (not res!601997) (not e!493739))))

(assert (=> b!886905 (= res!601997 (and (or (not (is-Cons!17670 lt!401151)) (bvsle (_1!5966 (h!18801 lt!401151)) key1!49)) (is-Cons!17670 lt!401151) (bvslt (_1!5966 (h!18801 lt!401151)) key1!49)))))

(declare-fun b!886906 () Bool)

(assert (=> b!886906 (= e!493739 (containsKey!414 (t!24954 lt!401151) key1!49))))

(assert (= (and d!109833 (not res!601996)) b!886905))

(assert (= (and b!886905 res!601997) b!886906))

(declare-fun m!826725 () Bool)

(assert (=> b!886906 m!826725))

(assert (=> b!886698 d!109833))

(declare-fun d!109835 () Bool)

(declare-fun e!493743 () Bool)

(assert (=> d!109835 e!493743))

(declare-fun res!601999 () Bool)

(assert (=> d!109835 (=> (not res!601999) (not e!493743))))

(declare-fun lt!401174 () List!17674)

(assert (=> d!109835 (= res!601999 (isStrictlySorted!492 lt!401174))))

(declare-fun e!493744 () List!17674)

(assert (=> d!109835 (= lt!401174 e!493744)))

(declare-fun c!93601 () Bool)

(assert (=> d!109835 (= c!93601 (and (is-Cons!17670 (t!24954 l!906)) (bvslt (_1!5966 (h!18801 (t!24954 l!906))) key1!49)))))

(assert (=> d!109835 (isStrictlySorted!492 (t!24954 l!906))))

(assert (=> d!109835 (= (insertStrictlySorted!300 (t!24954 l!906) key1!49 v1!38) lt!401174)))

(declare-fun b!886907 () Bool)

(declare-fun e!493741 () List!17674)

(assert (=> b!886907 (= e!493744 e!493741)))

(declare-fun c!93600 () Bool)

(assert (=> b!886907 (= c!93600 (and (is-Cons!17670 (t!24954 l!906)) (= (_1!5966 (h!18801 (t!24954 l!906))) key1!49)))))

(declare-fun b!886908 () Bool)

(declare-fun e!493742 () List!17674)

(declare-fun call!39317 () List!17674)

(assert (=> b!886908 (= e!493742 call!39317)))

(declare-fun b!886909 () Bool)

(declare-fun e!493740 () List!17674)

(assert (=> b!886909 (= e!493740 (insertStrictlySorted!300 (t!24954 (t!24954 l!906)) key1!49 v1!38))))

(declare-fun b!886910 () Bool)

(declare-fun res!601998 () Bool)

(assert (=> b!886910 (=> (not res!601998) (not e!493743))))

(assert (=> b!886910 (= res!601998 (containsKey!414 lt!401174 key1!49))))

(declare-fun b!886911 () Bool)

(assert (=> b!886911 (= e!493742 call!39317)))

(declare-fun b!886912 () Bool)

(declare-fun c!93599 () Bool)

(assert (=> b!886912 (= e!493740 (ite c!93600 (t!24954 (t!24954 l!906)) (ite c!93599 (Cons!17670 (h!18801 (t!24954 l!906)) (t!24954 (t!24954 l!906))) Nil!17671)))))

(declare-fun b!886913 () Bool)

(declare-fun call!39318 () List!17674)

(assert (=> b!886913 (= e!493741 call!39318)))

(declare-fun bm!39314 () Bool)

(declare-fun call!39319 () List!17674)

(assert (=> bm!39314 (= call!39318 call!39319)))

(declare-fun b!886914 () Bool)

(assert (=> b!886914 (= e!493743 (contains!4299 lt!401174 (tuple2!11911 key1!49 v1!38)))))

(declare-fun b!886915 () Bool)

(assert (=> b!886915 (= c!93599 (and (is-Cons!17670 (t!24954 l!906)) (bvsgt (_1!5966 (h!18801 (t!24954 l!906))) key1!49)))))

(assert (=> b!886915 (= e!493741 e!493742)))

(declare-fun b!886916 () Bool)

(assert (=> b!886916 (= e!493744 call!39319)))

(declare-fun bm!39315 () Bool)

(assert (=> bm!39315 (= call!39319 ($colon$colon!550 e!493740 (ite c!93601 (h!18801 (t!24954 l!906)) (tuple2!11911 key1!49 v1!38))))))

(declare-fun c!93602 () Bool)

(assert (=> bm!39315 (= c!93602 c!93601)))

(declare-fun bm!39316 () Bool)

(assert (=> bm!39316 (= call!39317 call!39318)))

(assert (= (and d!109835 c!93601) b!886916))

(assert (= (and d!109835 (not c!93601)) b!886907))

(assert (= (and b!886907 c!93600) b!886913))

(assert (= (and b!886907 (not c!93600)) b!886915))

(assert (= (and b!886915 c!93599) b!886908))

(assert (= (and b!886915 (not c!93599)) b!886911))

(assert (= (or b!886908 b!886911) bm!39316))

(assert (= (or b!886913 bm!39316) bm!39314))

(assert (= (or b!886916 bm!39314) bm!39315))

(assert (= (and bm!39315 c!93602) b!886909))

(assert (= (and bm!39315 (not c!93602)) b!886912))

(assert (= (and d!109835 res!601999) b!886910))

(assert (= (and b!886910 res!601998) b!886914))

(declare-fun m!826727 () Bool)

(assert (=> bm!39315 m!826727))

(declare-fun m!826729 () Bool)

(assert (=> b!886910 m!826729))

(declare-fun m!826731 () Bool)

(assert (=> b!886914 m!826731))

(declare-fun m!826733 () Bool)

(assert (=> d!109835 m!826733))

(assert (=> d!109835 m!826605))

(declare-fun m!826735 () Bool)

(assert (=> b!886909 m!826735))

(assert (=> b!886697 d!109835))

(declare-fun b!886917 () Bool)

(declare-fun e!493745 () Bool)

(declare-fun tp!54403 () Bool)

(assert (=> b!886917 (= e!493745 (and tp_is_empty!17815 tp!54403))))

(assert (=> b!886794 (= tp!54400 e!493745)))

(assert (= (and b!886794 (is-Cons!17670 (t!24954 (t!24954 l!906)))) b!886917))

(push 1)

(assert (not b!886910))

(assert (not b!886914))

(assert (not d!109813))

(assert (not d!109831))

(assert (not d!109819))

(assert (not bm!39312))

(assert (not b!886864))

(assert (not b!886879))

(assert (not bm!39315))

(assert (not b!886888))

(assert (not b!886917))

(assert (not b!886884))

(assert (not b!886894))

(assert (not b!886897))

(assert (not b!886902))

(assert (not d!109799))

(assert (not b!886880))

(assert (not b!886862))

(assert (not b!886868))

(assert (not b!886906))

(assert tp_is_empty!17815)

(assert (not d!109835))

(assert (not b!886892))

(assert (not bm!39309))

(assert (not b!886870))

(assert (not d!109815))

(assert (not b!886866))

(assert (not b!886898))

(assert (not b!886909))

(assert (not b!886876))

(assert (not b!886890))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

