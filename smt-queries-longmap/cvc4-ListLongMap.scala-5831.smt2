; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75254 () Bool)

(assert start!75254)

(declare-fun res!601878 () Bool)

(declare-fun e!493551 () Bool)

(assert (=> start!75254 (=> (not res!601878) (not e!493551))))

(declare-datatypes ((B!1308 0))(
  ( (B!1309 (val!8960 Int)) )
))
(declare-datatypes ((tuple2!11914 0))(
  ( (tuple2!11915 (_1!5968 (_ BitVec 64)) (_2!5968 B!1308)) )
))
(declare-datatypes ((List!17676 0))(
  ( (Nil!17673) (Cons!17672 (h!18803 tuple2!11914) (t!24956 List!17676)) )
))
(declare-fun l!906 () List!17676)

(declare-fun isStrictlySorted!494 (List!17676) Bool)

(assert (=> start!75254 (= res!601878 (isStrictlySorted!494 l!906))))

(assert (=> start!75254 e!493551))

(declare-fun e!493550 () Bool)

(assert (=> start!75254 e!493550))

(assert (=> start!75254 true))

(declare-fun tp_is_empty!17819 () Bool)

(assert (=> start!75254 tp_is_empty!17819))

(declare-fun b!886610 () Bool)

(declare-fun res!601879 () Bool)

(assert (=> b!886610 (=> (not res!601879) (not e!493551))))

(declare-fun key1!49 () (_ BitVec 64))

(assert (=> b!886610 (= res!601879 (or (not (is-Cons!17672 l!906)) (bvsge (_1!5968 (h!18803 l!906)) key1!49)))))

(declare-fun v2!16 () B!1308)

(declare-fun v1!38 () B!1308)

(declare-fun b!886611 () Bool)

(declare-fun insertStrictlySorted!302 (List!17676 (_ BitVec 64) B!1308) List!17676)

(assert (=> b!886611 (= e!493551 (not (= (insertStrictlySorted!302 (insertStrictlySorted!302 l!906 key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!302 l!906 key1!49 v2!16))))))

(declare-fun b!886612 () Bool)

(declare-fun tp!54392 () Bool)

(assert (=> b!886612 (= e!493550 (and tp_is_empty!17819 tp!54392))))

(assert (= (and start!75254 res!601878) b!886610))

(assert (= (and b!886610 res!601879) b!886611))

(assert (= (and start!75254 (is-Cons!17672 l!906)) b!886612))

(declare-fun m!826499 () Bool)

(assert (=> start!75254 m!826499))

(declare-fun m!826501 () Bool)

(assert (=> b!886611 m!826501))

(assert (=> b!886611 m!826501))

(declare-fun m!826503 () Bool)

(assert (=> b!886611 m!826503))

(declare-fun m!826505 () Bool)

(assert (=> b!886611 m!826505))

(push 1)

(assert (not start!75254))

(assert (not b!886611))

(assert (not b!886612))

(assert tp_is_empty!17819)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!109749 () Bool)

(declare-fun res!601890 () Bool)

(declare-fun e!493562 () Bool)

(assert (=> d!109749 (=> res!601890 e!493562)))

(assert (=> d!109749 (= res!601890 (or (is-Nil!17673 l!906) (is-Nil!17673 (t!24956 l!906))))))

(assert (=> d!109749 (= (isStrictlySorted!494 l!906) e!493562)))

(declare-fun b!886623 () Bool)

(declare-fun e!493563 () Bool)

(assert (=> b!886623 (= e!493562 e!493563)))

(declare-fun res!601891 () Bool)

(assert (=> b!886623 (=> (not res!601891) (not e!493563))))

(assert (=> b!886623 (= res!601891 (bvslt (_1!5968 (h!18803 l!906)) (_1!5968 (h!18803 (t!24956 l!906)))))))

(declare-fun b!886624 () Bool)

(assert (=> b!886624 (= e!493563 (isStrictlySorted!494 (t!24956 l!906)))))

(assert (= (and d!109749 (not res!601890)) b!886623))

(assert (= (and b!886623 res!601891) b!886624))

(declare-fun m!826509 () Bool)

(assert (=> b!886624 m!826509))

(assert (=> start!75254 d!109749))

(declare-fun bm!39284 () Bool)

(declare-fun call!39289 () List!17676)

(declare-fun call!39287 () List!17676)

(assert (=> bm!39284 (= call!39289 call!39287)))

(declare-fun bm!39285 () Bool)

(declare-fun call!39288 () List!17676)

(assert (=> bm!39285 (= call!39288 call!39289)))

(declare-fun c!93559 () Bool)

(declare-fun b!886725 () Bool)

(assert (=> b!886725 (= c!93559 (and (is-Cons!17672 (insertStrictlySorted!302 l!906 key1!49 v1!38)) (bvsgt (_1!5968 (h!18803 (insertStrictlySorted!302 l!906 key1!49 v1!38))) key1!49)))))

(declare-fun e!493614 () List!17676)

(declare-fun e!493617 () List!17676)

(assert (=> b!886725 (= e!493614 e!493617)))

(declare-fun b!886726 () Bool)

(declare-fun e!493618 () Bool)

(declare-fun lt!401154 () List!17676)

(declare-fun contains!4300 (List!17676 tuple2!11914) Bool)

(assert (=> b!886726 (= e!493618 (contains!4300 lt!401154 (tuple2!11915 key1!49 v2!16)))))

(declare-fun e!493616 () List!17676)

(declare-fun b!886727 () Bool)

(declare-fun c!93562 () Bool)

(assert (=> b!886727 (= e!493616 (ite c!93562 (t!24956 (insertStrictlySorted!302 l!906 key1!49 v1!38)) (ite c!93559 (Cons!17672 (h!18803 (insertStrictlySorted!302 l!906 key1!49 v1!38)) (t!24956 (insertStrictlySorted!302 l!906 key1!49 v1!38))) Nil!17673)))))

(declare-fun b!886728 () Bool)

(declare-fun res!601912 () Bool)

(assert (=> b!886728 (=> (not res!601912) (not e!493618))))

(declare-fun containsKey!416 (List!17676 (_ BitVec 64)) Bool)

(assert (=> b!886728 (= res!601912 (containsKey!416 lt!401154 key1!49))))

(declare-fun d!109753 () Bool)

(assert (=> d!109753 e!493618))

(declare-fun res!601913 () Bool)

(assert (=> d!109753 (=> (not res!601913) (not e!493618))))

(assert (=> d!109753 (= res!601913 (isStrictlySorted!494 lt!401154))))

(declare-fun e!493615 () List!17676)

(assert (=> d!109753 (= lt!401154 e!493615)))

(declare-fun c!93561 () Bool)

(assert (=> d!109753 (= c!93561 (and (is-Cons!17672 (insertStrictlySorted!302 l!906 key1!49 v1!38)) (bvslt (_1!5968 (h!18803 (insertStrictlySorted!302 l!906 key1!49 v1!38))) key1!49)))))

(assert (=> d!109753 (isStrictlySorted!494 (insertStrictlySorted!302 l!906 key1!49 v1!38))))

(assert (=> d!109753 (= (insertStrictlySorted!302 (insertStrictlySorted!302 l!906 key1!49 v1!38) key1!49 v2!16) lt!401154)))

(declare-fun bm!39286 () Bool)

(declare-fun $colon$colon!551 (List!17676 tuple2!11914) List!17676)

(assert (=> bm!39286 (= call!39287 ($colon$colon!551 e!493616 (ite c!93561 (h!18803 (insertStrictlySorted!302 l!906 key1!49 v1!38)) (tuple2!11915 key1!49 v2!16))))))

(declare-fun c!93560 () Bool)

(assert (=> bm!39286 (= c!93560 c!93561)))

(declare-fun b!886729 () Bool)

(assert (=> b!886729 (= e!493615 call!39287)))

(declare-fun b!886730 () Bool)

(assert (=> b!886730 (= e!493617 call!39288)))

(declare-fun b!886731 () Bool)

(assert (=> b!886731 (= e!493614 call!39289)))

(declare-fun b!886732 () Bool)

(assert (=> b!886732 (= e!493616 (insertStrictlySorted!302 (t!24956 (insertStrictlySorted!302 l!906 key1!49 v1!38)) key1!49 v2!16))))

(declare-fun b!886733 () Bool)

(assert (=> b!886733 (= e!493617 call!39288)))

(declare-fun b!886734 () Bool)

(assert (=> b!886734 (= e!493615 e!493614)))

(assert (=> b!886734 (= c!93562 (and (is-Cons!17672 (insertStrictlySorted!302 l!906 key1!49 v1!38)) (= (_1!5968 (h!18803 (insertStrictlySorted!302 l!906 key1!49 v1!38))) key1!49)))))

(assert (= (and d!109753 c!93561) b!886729))

(assert (= (and d!109753 (not c!93561)) b!886734))

(assert (= (and b!886734 c!93562) b!886731))

(assert (= (and b!886734 (not c!93562)) b!886725))

(assert (= (and b!886725 c!93559) b!886733))

(assert (= (and b!886725 (not c!93559)) b!886730))

(assert (= (or b!886733 b!886730) bm!39285))

(assert (= (or b!886731 bm!39285) bm!39284))

(assert (= (or b!886729 bm!39284) bm!39286))

(assert (= (and bm!39286 c!93560) b!886732))

(assert (= (and bm!39286 (not c!93560)) b!886727))

(assert (= (and d!109753 res!601913) b!886728))

(assert (= (and b!886728 res!601912) b!886726))

(declare-fun m!826555 () Bool)

(assert (=> b!886732 m!826555))

(declare-fun m!826559 () Bool)

(assert (=> b!886728 m!826559))

(declare-fun m!826563 () Bool)

(assert (=> b!886726 m!826563))

(declare-fun m!826569 () Bool)

(assert (=> bm!39286 m!826569))

(declare-fun m!826571 () Bool)

(assert (=> d!109753 m!826571))

(assert (=> d!109753 m!826501))

(declare-fun m!826575 () Bool)

(assert (=> d!109753 m!826575))

(assert (=> b!886611 d!109753))

(declare-fun bm!39293 () Bool)

(declare-fun call!39298 () List!17676)

(declare-fun call!39296 () List!17676)

(assert (=> bm!39293 (= call!39298 call!39296)))

(declare-fun bm!39294 () Bool)

(declare-fun call!39297 () List!17676)

(assert (=> bm!39294 (= call!39297 call!39298)))

(declare-fun b!886755 () Bool)

(declare-fun c!93570 () Bool)

(assert (=> b!886755 (= c!93570 (and (is-Cons!17672 l!906) (bvsgt (_1!5968 (h!18803 l!906)) key1!49)))))

(declare-fun e!493627 () List!17676)

(declare-fun e!493632 () List!17676)

(assert (=> b!886755 (= e!493627 e!493632)))

(declare-fun lt!401157 () List!17676)

(declare-fun b!886756 () Bool)

(declare-fun e!493633 () Bool)

(assert (=> b!886756 (= e!493633 (contains!4300 lt!401157 (tuple2!11915 key1!49 v1!38)))))

(declare-fun c!93574 () Bool)

(declare-fun e!493631 () List!17676)

(declare-fun b!886757 () Bool)

(assert (=> b!886757 (= e!493631 (ite c!93574 (t!24956 l!906) (ite c!93570 (Cons!17672 (h!18803 l!906) (t!24956 l!906)) Nil!17673)))))

(declare-fun b!886758 () Bool)

(declare-fun res!601917 () Bool)

(assert (=> b!886758 (=> (not res!601917) (not e!493633))))

(assert (=> b!886758 (= res!601917 (containsKey!416 lt!401157 key1!49))))

(declare-fun d!109765 () Bool)

(assert (=> d!109765 e!493633))

(declare-fun res!601919 () Bool)

(assert (=> d!109765 (=> (not res!601919) (not e!493633))))

(assert (=> d!109765 (= res!601919 (isStrictlySorted!494 lt!401157))))

(declare-fun e!493630 () List!17676)

(assert (=> d!109765 (= lt!401157 e!493630)))

(declare-fun c!93573 () Bool)

(assert (=> d!109765 (= c!93573 (and (is-Cons!17672 l!906) (bvslt (_1!5968 (h!18803 l!906)) key1!49)))))

(assert (=> d!109765 (isStrictlySorted!494 l!906)))

(assert (=> d!109765 (= (insertStrictlySorted!302 l!906 key1!49 v1!38) lt!401157)))

(declare-fun bm!39295 () Bool)

(assert (=> bm!39295 (= call!39296 ($colon$colon!551 e!493631 (ite c!93573 (h!18803 l!906) (tuple2!11915 key1!49 v1!38))))))

(declare-fun c!93572 () Bool)

(assert (=> bm!39295 (= c!93572 c!93573)))

(declare-fun b!886759 () Bool)

(assert (=> b!886759 (= e!493630 call!39296)))

(declare-fun b!886760 () Bool)

(assert (=> b!886760 (= e!493632 call!39297)))

(declare-fun b!886761 () Bool)

(assert (=> b!886761 (= e!493627 call!39298)))

(declare-fun b!886762 () Bool)

(assert (=> b!886762 (= e!493631 (insertStrictlySorted!302 (t!24956 l!906) key1!49 v1!38))))

(declare-fun b!886763 () Bool)

(assert (=> b!886763 (= e!493632 call!39297)))

(declare-fun b!886764 () Bool)

(assert (=> b!886764 (= e!493630 e!493627)))

(assert (=> b!886764 (= c!93574 (and (is-Cons!17672 l!906) (= (_1!5968 (h!18803 l!906)) key1!49)))))

(assert (= (and d!109765 c!93573) b!886759))

(assert (= (and d!109765 (not c!93573)) b!886764))

(assert (= (and b!886764 c!93574) b!886761))

(assert (= (and b!886764 (not c!93574)) b!886755))

(assert (= (and b!886755 c!93570) b!886763))

(assert (= (and b!886755 (not c!93570)) b!886760))

(assert (= (or b!886763 b!886760) bm!39294))

(assert (= (or b!886761 bm!39294) bm!39293))

(assert (= (or b!886759 bm!39293) bm!39295))

(assert (= (and bm!39295 c!93572) b!886762))

(assert (= (and bm!39295 (not c!93572)) b!886757))

(assert (= (and d!109765 res!601919) b!886758))

(assert (= (and b!886758 res!601917) b!886756))

(declare-fun m!826579 () Bool)

(assert (=> b!886762 m!826579))

(declare-fun m!826583 () Bool)

(assert (=> b!886758 m!826583))

(declare-fun m!826587 () Bool)

(assert (=> b!886756 m!826587))

(declare-fun m!826591 () Bool)

(assert (=> bm!39295 m!826591))

(declare-fun m!826595 () Bool)

(assert (=> d!109765 m!826595))

(assert (=> d!109765 m!826499))

(assert (=> b!886611 d!109765))

(declare-fun bm!39296 () Bool)

(declare-fun call!39301 () List!17676)

(declare-fun call!39299 () List!17676)

(assert (=> bm!39296 (= call!39301 call!39299)))

(declare-fun bm!39297 () Bool)

(declare-fun call!39300 () List!17676)

(assert (=> bm!39297 (= call!39300 call!39301)))

(declare-fun b!886770 () Bool)

(declare-fun c!93575 () Bool)

(assert (=> b!886770 (= c!93575 (and (is-Cons!17672 l!906) (bvsgt (_1!5968 (h!18803 l!906)) key1!49)))))

(declare-fun e!493638 () List!17676)

(declare-fun e!493641 () List!17676)

(assert (=> b!886770 (= e!493638 e!493641)))

(declare-fun b!886771 () Bool)

(declare-fun lt!401158 () List!17676)

(declare-fun e!493642 () Bool)

(assert (=> b!886771 (= e!493642 (contains!4300 lt!401158 (tuple2!11915 key1!49 v2!16)))))

(declare-fun e!493640 () List!17676)

(declare-fun c!93578 () Bool)

(declare-fun b!886772 () Bool)

(assert (=> b!886772 (= e!493640 (ite c!93578 (t!24956 l!906) (ite c!93575 (Cons!17672 (h!18803 l!906) (t!24956 l!906)) Nil!17673)))))

(declare-fun b!886773 () Bool)

(declare-fun res!601924 () Bool)

(assert (=> b!886773 (=> (not res!601924) (not e!493642))))

(assert (=> b!886773 (= res!601924 (containsKey!416 lt!401158 key1!49))))

(declare-fun d!109767 () Bool)

(assert (=> d!109767 e!493642))

(declare-fun res!601925 () Bool)

(assert (=> d!109767 (=> (not res!601925) (not e!493642))))

(assert (=> d!109767 (= res!601925 (isStrictlySorted!494 lt!401158))))

(declare-fun e!493639 () List!17676)

(assert (=> d!109767 (= lt!401158 e!493639)))

(declare-fun c!93577 () Bool)

(assert (=> d!109767 (= c!93577 (and (is-Cons!17672 l!906) (bvslt (_1!5968 (h!18803 l!906)) key1!49)))))

(assert (=> d!109767 (isStrictlySorted!494 l!906)))

(assert (=> d!109767 (= (insertStrictlySorted!302 l!906 key1!49 v2!16) lt!401158)))

(declare-fun bm!39298 () Bool)

(assert (=> bm!39298 (= call!39299 ($colon$colon!551 e!493640 (ite c!93577 (h!18803 l!906) (tuple2!11915 key1!49 v2!16))))))

(declare-fun c!93576 () Bool)

(assert (=> bm!39298 (= c!93576 c!93577)))

(declare-fun b!886774 () Bool)

(assert (=> b!886774 (= e!493639 call!39299)))

(declare-fun b!886776 () Bool)

(assert (=> b!886776 (= e!493641 call!39300)))

(declare-fun b!886777 () Bool)

(assert (=> b!886777 (= e!493638 call!39301)))

(declare-fun b!886778 () Bool)

(assert (=> b!886778 (= e!493640 (insertStrictlySorted!302 (t!24956 l!906) key1!49 v2!16))))

(declare-fun b!886779 () Bool)

(assert (=> b!886779 (= e!493641 call!39300)))

(declare-fun b!886780 () Bool)

(assert (=> b!886780 (= e!493639 e!493638)))

(assert (=> b!886780 (= c!93578 (and (is-Cons!17672 l!906) (= (_1!5968 (h!18803 l!906)) key1!49)))))

(assert (= (and d!109767 c!93577) b!886774))

(assert (= (and d!109767 (not c!93577)) b!886780))

(assert (= (and b!886780 c!93578) b!886777))

(assert (= (and b!886780 (not c!93578)) b!886770))

(assert (= (and b!886770 c!93575) b!886779))

(assert (= (and b!886770 (not c!93575)) b!886776))

(assert (= (or b!886779 b!886776) bm!39297))

(assert (= (or b!886777 bm!39297) bm!39296))

(assert (= (or b!886774 bm!39296) bm!39298))

(assert (= (and bm!39298 c!93576) b!886778))

(assert (= (and bm!39298 (not c!93576)) b!886772))

(assert (= (and d!109767 res!601925) b!886773))

(assert (= (and b!886773 res!601924) b!886771))

(declare-fun m!826597 () Bool)

(assert (=> b!886778 m!826597))

(declare-fun m!826599 () Bool)

(assert (=> b!886773 m!826599))

(declare-fun m!826601 () Bool)

(assert (=> b!886771 m!826601))

(declare-fun m!826603 () Bool)

(assert (=> bm!39298 m!826603))

(declare-fun m!826607 () Bool)

(assert (=> d!109767 m!826607))

(assert (=> d!109767 m!826499))

(assert (=> b!886611 d!109767))

(declare-fun b!886795 () Bool)

(declare-fun e!493653 () Bool)

(declare-fun tp!54401 () Bool)

(assert (=> b!886795 (= e!493653 (and tp_is_empty!17819 tp!54401))))

(assert (=> b!886612 (= tp!54392 e!493653)))

(assert (= (and b!886612 (is-Cons!17672 (t!24956 l!906))) b!886795))

(push 1)

(assert tp_is_empty!17819)

(assert (not bm!39286))

(assert (not b!886773))

(assert (not b!886795))

(assert (not b!886756))

(assert (not b!886778))

(assert (not b!886624))

(assert (not bm!39295))

(assert (not d!109767))

(assert (not d!109765))

(assert (not b!886762))

(assert (not d!109753))

(assert (not b!886728))

(assert (not b!886732))

(assert (not b!886726))

(assert (not b!886771))

(assert (not b!886758))

(assert (not bm!39298))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!39317 () Bool)

(declare-fun call!39322 () List!17676)

(declare-fun call!39320 () List!17676)

(assert (=> bm!39317 (= call!39322 call!39320)))

(declare-fun bm!39318 () Bool)

(declare-fun call!39321 () List!17676)

(assert (=> bm!39318 (= call!39321 call!39322)))

(declare-fun c!93603 () Bool)

(declare-fun b!886918 () Bool)

(assert (=> b!886918 (= c!93603 (and (is-Cons!17672 (t!24956 (insertStrictlySorted!302 l!906 key1!49 v1!38))) (bvsgt (_1!5968 (h!18803 (t!24956 (insertStrictlySorted!302 l!906 key1!49 v1!38)))) key1!49)))))

(declare-fun e!493746 () List!17676)

(declare-fun e!493749 () List!17676)

(assert (=> b!886918 (= e!493746 e!493749)))

(declare-fun lt!401175 () List!17676)

(declare-fun b!886919 () Bool)

(declare-fun e!493750 () Bool)

(assert (=> b!886919 (= e!493750 (contains!4300 lt!401175 (tuple2!11915 key1!49 v2!16)))))

(declare-fun e!493748 () List!17676)

(declare-fun c!93606 () Bool)

(declare-fun b!886920 () Bool)

(assert (=> b!886920 (= e!493748 (ite c!93606 (t!24956 (t!24956 (insertStrictlySorted!302 l!906 key1!49 v1!38))) (ite c!93603 (Cons!17672 (h!18803 (t!24956 (insertStrictlySorted!302 l!906 key1!49 v1!38))) (t!24956 (t!24956 (insertStrictlySorted!302 l!906 key1!49 v1!38)))) Nil!17673)))))

(declare-fun b!886921 () Bool)

(declare-fun res!602000 () Bool)

(assert (=> b!886921 (=> (not res!602000) (not e!493750))))

(assert (=> b!886921 (= res!602000 (containsKey!416 lt!401175 key1!49))))

(declare-fun d!109837 () Bool)

(assert (=> d!109837 e!493750))

(declare-fun res!602001 () Bool)

(assert (=> d!109837 (=> (not res!602001) (not e!493750))))

(assert (=> d!109837 (= res!602001 (isStrictlySorted!494 lt!401175))))

(declare-fun e!493747 () List!17676)

(assert (=> d!109837 (= lt!401175 e!493747)))

(declare-fun c!93605 () Bool)

(assert (=> d!109837 (= c!93605 (and (is-Cons!17672 (t!24956 (insertStrictlySorted!302 l!906 key1!49 v1!38))) (bvslt (_1!5968 (h!18803 (t!24956 (insertStrictlySorted!302 l!906 key1!49 v1!38)))) key1!49)))))

(assert (=> d!109837 (isStrictlySorted!494 (t!24956 (insertStrictlySorted!302 l!906 key1!49 v1!38)))))

(assert (=> d!109837 (= (insertStrictlySorted!302 (t!24956 (insertStrictlySorted!302 l!906 key1!49 v1!38)) key1!49 v2!16) lt!401175)))

(declare-fun bm!39319 () Bool)

(assert (=> bm!39319 (= call!39320 ($colon$colon!551 e!493748 (ite c!93605 (h!18803 (t!24956 (insertStrictlySorted!302 l!906 key1!49 v1!38))) (tuple2!11915 key1!49 v2!16))))))

(declare-fun c!93604 () Bool)

(assert (=> bm!39319 (= c!93604 c!93605)))

(declare-fun b!886922 () Bool)

(assert (=> b!886922 (= e!493747 call!39320)))

(declare-fun b!886923 () Bool)

(assert (=> b!886923 (= e!493749 call!39321)))

(declare-fun b!886924 () Bool)

(assert (=> b!886924 (= e!493746 call!39322)))

(declare-fun b!886925 () Bool)

(assert (=> b!886925 (= e!493748 (insertStrictlySorted!302 (t!24956 (t!24956 (insertStrictlySorted!302 l!906 key1!49 v1!38))) key1!49 v2!16))))

(declare-fun b!886926 () Bool)

(assert (=> b!886926 (= e!493749 call!39321)))

(declare-fun b!886927 () Bool)

(assert (=> b!886927 (= e!493747 e!493746)))

(assert (=> b!886927 (= c!93606 (and (is-Cons!17672 (t!24956 (insertStrictlySorted!302 l!906 key1!49 v1!38))) (= (_1!5968 (h!18803 (t!24956 (insertStrictlySorted!302 l!906 key1!49 v1!38)))) key1!49)))))

(assert (= (and d!109837 c!93605) b!886922))

(assert (= (and d!109837 (not c!93605)) b!886927))

(assert (= (and b!886927 c!93606) b!886924))

(assert (= (and b!886927 (not c!93606)) b!886918))

(assert (= (and b!886918 c!93603) b!886926))

(assert (= (and b!886918 (not c!93603)) b!886923))

(assert (= (or b!886926 b!886923) bm!39318))

(assert (= (or b!886924 bm!39318) bm!39317))

(assert (= (or b!886922 bm!39317) bm!39319))

(assert (= (and bm!39319 c!93604) b!886925))

(assert (= (and bm!39319 (not c!93604)) b!886920))

(assert (= (and d!109837 res!602001) b!886921))

(assert (= (and b!886921 res!602000) b!886919))

(declare-fun m!826737 () Bool)

(assert (=> b!886925 m!826737))

(declare-fun m!826739 () Bool)

(assert (=> b!886921 m!826739))

(declare-fun m!826741 () Bool)

(assert (=> b!886919 m!826741))

(declare-fun m!826743 () Bool)

(assert (=> bm!39319 m!826743))

(declare-fun m!826745 () Bool)

(assert (=> d!109837 m!826745))

(declare-fun m!826747 () Bool)

(assert (=> d!109837 m!826747))

(assert (=> b!886732 d!109837))

(declare-fun d!109839 () Bool)

(declare-fun lt!401178 () Bool)

(declare-fun content!399 (List!17676) (Set tuple2!11914))

(assert (=> d!109839 (= lt!401178 (member (tuple2!11915 key1!49 v1!38) (content!399 lt!401157)))))

(declare-fun e!493756 () Bool)

(assert (=> d!109839 (= lt!401178 e!493756)))

(declare-fun res!602007 () Bool)

(assert (=> d!109839 (=> (not res!602007) (not e!493756))))

(assert (=> d!109839 (= res!602007 (is-Cons!17672 lt!401157))))

(assert (=> d!109839 (= (contains!4300 lt!401157 (tuple2!11915 key1!49 v1!38)) lt!401178)))

(declare-fun b!886932 () Bool)

(declare-fun e!493755 () Bool)

(assert (=> b!886932 (= e!493756 e!493755)))

(declare-fun res!602006 () Bool)

(assert (=> b!886932 (=> res!602006 e!493755)))

(assert (=> b!886932 (= res!602006 (= (h!18803 lt!401157) (tuple2!11915 key1!49 v1!38)))))

(declare-fun b!886933 () Bool)

(assert (=> b!886933 (= e!493755 (contains!4300 (t!24956 lt!401157) (tuple2!11915 key1!49 v1!38)))))

(assert (= (and d!109839 res!602007) b!886932))

(assert (= (and b!886932 (not res!602006)) b!886933))

(declare-fun m!826749 () Bool)

(assert (=> d!109839 m!826749))

(declare-fun m!826751 () Bool)

(assert (=> d!109839 m!826751))

(declare-fun m!826753 () Bool)

(assert (=> b!886933 m!826753))

(assert (=> b!886756 d!109839))

(declare-fun d!109841 () Bool)

(declare-fun res!602008 () Bool)

(declare-fun e!493757 () Bool)

(assert (=> d!109841 (=> res!602008 e!493757)))

(assert (=> d!109841 (= res!602008 (or (is-Nil!17673 (t!24956 l!906)) (is-Nil!17673 (t!24956 (t!24956 l!906)))))))

(assert (=> d!109841 (= (isStrictlySorted!494 (t!24956 l!906)) e!493757)))

(declare-fun b!886934 () Bool)

(declare-fun e!493758 () Bool)

(assert (=> b!886934 (= e!493757 e!493758)))

(declare-fun res!602009 () Bool)

(assert (=> b!886934 (=> (not res!602009) (not e!493758))))

(assert (=> b!886934 (= res!602009 (bvslt (_1!5968 (h!18803 (t!24956 l!906))) (_1!5968 (h!18803 (t!24956 (t!24956 l!906))))))))

(declare-fun b!886935 () Bool)

(assert (=> b!886935 (= e!493758 (isStrictlySorted!494 (t!24956 (t!24956 l!906))))))

(assert (= (and d!109841 (not res!602008)) b!886934))

(assert (= (and b!886934 res!602009) b!886935))

(declare-fun m!826755 () Bool)

(assert (=> b!886935 m!826755))

(assert (=> b!886624 d!109841))

(declare-fun d!109843 () Bool)

(assert (=> d!109843 (= ($colon$colon!551 e!493640 (ite c!93577 (h!18803 l!906) (tuple2!11915 key1!49 v2!16))) (Cons!17672 (ite c!93577 (h!18803 l!906) (tuple2!11915 key1!49 v2!16)) e!493640))))

(assert (=> bm!39298 d!109843))

(declare-fun d!109845 () Bool)

(declare-fun res!602014 () Bool)

(declare-fun e!493763 () Bool)

(assert (=> d!109845 (=> res!602014 e!493763)))

(assert (=> d!109845 (= res!602014 (and (is-Cons!17672 lt!401158) (= (_1!5968 (h!18803 lt!401158)) key1!49)))))

(assert (=> d!109845 (= (containsKey!416 lt!401158 key1!49) e!493763)))

(declare-fun b!886940 () Bool)

(declare-fun e!493764 () Bool)

(assert (=> b!886940 (= e!493763 e!493764)))

(declare-fun res!602015 () Bool)

(assert (=> b!886940 (=> (not res!602015) (not e!493764))))

(assert (=> b!886940 (= res!602015 (and (or (not (is-Cons!17672 lt!401158)) (bvsle (_1!5968 (h!18803 lt!401158)) key1!49)) (is-Cons!17672 lt!401158) (bvslt (_1!5968 (h!18803 lt!401158)) key1!49)))))

(declare-fun b!886941 () Bool)

(assert (=> b!886941 (= e!493764 (containsKey!416 (t!24956 lt!401158) key1!49))))

(assert (= (and d!109845 (not res!602014)) b!886940))

(assert (= (and b!886940 res!602015) b!886941))

(declare-fun m!826757 () Bool)

(assert (=> b!886941 m!826757))

(assert (=> b!886773 d!109845))

(declare-fun bm!39320 () Bool)

(declare-fun call!39325 () List!17676)

(declare-fun call!39323 () List!17676)

(assert (=> bm!39320 (= call!39325 call!39323)))

(declare-fun bm!39321 () Bool)

(declare-fun call!39324 () List!17676)

(assert (=> bm!39321 (= call!39324 call!39325)))

(declare-fun b!886942 () Bool)

(declare-fun c!93607 () Bool)

(assert (=> b!886942 (= c!93607 (and (is-Cons!17672 (t!24956 l!906)) (bvsgt (_1!5968 (h!18803 (t!24956 l!906))) key1!49)))))

(declare-fun e!493765 () List!17676)

(declare-fun e!493768 () List!17676)

(assert (=> b!886942 (= e!493765 e!493768)))

(declare-fun lt!401179 () List!17676)

(declare-fun b!886943 () Bool)

(declare-fun e!493769 () Bool)

(assert (=> b!886943 (= e!493769 (contains!4300 lt!401179 (tuple2!11915 key1!49 v1!38)))))

(declare-fun c!93610 () Bool)

(declare-fun b!886944 () Bool)

(declare-fun e!493767 () List!17676)

(assert (=> b!886944 (= e!493767 (ite c!93610 (t!24956 (t!24956 l!906)) (ite c!93607 (Cons!17672 (h!18803 (t!24956 l!906)) (t!24956 (t!24956 l!906))) Nil!17673)))))

(declare-fun b!886945 () Bool)

(declare-fun res!602016 () Bool)

(assert (=> b!886945 (=> (not res!602016) (not e!493769))))

(assert (=> b!886945 (= res!602016 (containsKey!416 lt!401179 key1!49))))

(declare-fun d!109847 () Bool)

(assert (=> d!109847 e!493769))

(declare-fun res!602017 () Bool)

(assert (=> d!109847 (=> (not res!602017) (not e!493769))))

(assert (=> d!109847 (= res!602017 (isStrictlySorted!494 lt!401179))))

(declare-fun e!493766 () List!17676)

(assert (=> d!109847 (= lt!401179 e!493766)))

(declare-fun c!93609 () Bool)

(assert (=> d!109847 (= c!93609 (and (is-Cons!17672 (t!24956 l!906)) (bvslt (_1!5968 (h!18803 (t!24956 l!906))) key1!49)))))

(assert (=> d!109847 (isStrictlySorted!494 (t!24956 l!906))))

(assert (=> d!109847 (= (insertStrictlySorted!302 (t!24956 l!906) key1!49 v1!38) lt!401179)))

(declare-fun bm!39322 () Bool)

(assert (=> bm!39322 (= call!39323 ($colon$colon!551 e!493767 (ite c!93609 (h!18803 (t!24956 l!906)) (tuple2!11915 key1!49 v1!38))))))

(declare-fun c!93608 () Bool)

(assert (=> bm!39322 (= c!93608 c!93609)))

(declare-fun b!886946 () Bool)

(assert (=> b!886946 (= e!493766 call!39323)))

(declare-fun b!886947 () Bool)

(assert (=> b!886947 (= e!493768 call!39324)))

(declare-fun b!886948 () Bool)

(assert (=> b!886948 (= e!493765 call!39325)))

(declare-fun b!886949 () Bool)

(assert (=> b!886949 (= e!493767 (insertStrictlySorted!302 (t!24956 (t!24956 l!906)) key1!49 v1!38))))

(declare-fun b!886950 () Bool)

(assert (=> b!886950 (= e!493768 call!39324)))

(declare-fun b!886951 () Bool)

(assert (=> b!886951 (= e!493766 e!493765)))

(assert (=> b!886951 (= c!93610 (and (is-Cons!17672 (t!24956 l!906)) (= (_1!5968 (h!18803 (t!24956 l!906))) key1!49)))))

(assert (= (and d!109847 c!93609) b!886946))

(assert (= (and d!109847 (not c!93609)) b!886951))

(assert (= (and b!886951 c!93610) b!886948))

(assert (= (and b!886951 (not c!93610)) b!886942))

(assert (= (and b!886942 c!93607) b!886950))

(assert (= (and b!886942 (not c!93607)) b!886947))

(assert (= (or b!886950 b!886947) bm!39321))

(assert (= (or b!886948 bm!39321) bm!39320))

(assert (= (or b!886946 bm!39320) bm!39322))

(assert (= (and bm!39322 c!93608) b!886949))

(assert (= (and bm!39322 (not c!93608)) b!886944))

(assert (= (and d!109847 res!602017) b!886945))

(assert (= (and b!886945 res!602016) b!886943))

(declare-fun m!826759 () Bool)

(assert (=> b!886949 m!826759))

(declare-fun m!826761 () Bool)

(assert (=> b!886945 m!826761))

(declare-fun m!826763 () Bool)

(assert (=> b!886943 m!826763))

(declare-fun m!826765 () Bool)

(assert (=> bm!39322 m!826765))

(declare-fun m!826767 () Bool)

(assert (=> d!109847 m!826767))

(assert (=> d!109847 m!826509))

(assert (=> b!886762 d!109847))

(declare-fun d!109849 () Bool)

(assert (=> d!109849 (= ($colon$colon!551 e!493616 (ite c!93561 (h!18803 (insertStrictlySorted!302 l!906 key1!49 v1!38)) (tuple2!11915 key1!49 v2!16))) (Cons!17672 (ite c!93561 (h!18803 (insertStrictlySorted!302 l!906 key1!49 v1!38)) (tuple2!11915 key1!49 v2!16)) e!493616))))

(assert (=> bm!39286 d!109849))

(declare-fun d!109851 () Bool)

(declare-fun res!602018 () Bool)

(declare-fun e!493770 () Bool)

(assert (=> d!109851 (=> res!602018 e!493770)))

(assert (=> d!109851 (= res!602018 (or (is-Nil!17673 lt!401157) (is-Nil!17673 (t!24956 lt!401157))))))

(assert (=> d!109851 (= (isStrictlySorted!494 lt!401157) e!493770)))

(declare-fun b!886952 () Bool)

(declare-fun e!493771 () Bool)

(assert (=> b!886952 (= e!493770 e!493771)))

(declare-fun res!602019 () Bool)

(assert (=> b!886952 (=> (not res!602019) (not e!493771))))

(assert (=> b!886952 (= res!602019 (bvslt (_1!5968 (h!18803 lt!401157)) (_1!5968 (h!18803 (t!24956 lt!401157)))))))

(declare-fun b!886953 () Bool)

(assert (=> b!886953 (= e!493771 (isStrictlySorted!494 (t!24956 lt!401157)))))

(assert (= (and d!109851 (not res!602018)) b!886952))

(assert (= (and b!886952 res!602019) b!886953))

(declare-fun m!826769 () Bool)

(assert (=> b!886953 m!826769))

(assert (=> d!109765 d!109851))

(assert (=> d!109765 d!109749))

(declare-fun d!109853 () Bool)

(declare-fun res!602020 () Bool)

(declare-fun e!493772 () Bool)

(assert (=> d!109853 (=> res!602020 e!493772)))

(assert (=> d!109853 (= res!602020 (and (is-Cons!17672 lt!401154) (= (_1!5968 (h!18803 lt!401154)) key1!49)))))

(assert (=> d!109853 (= (containsKey!416 lt!401154 key1!49) e!493772)))

(declare-fun b!886954 () Bool)

(declare-fun e!493773 () Bool)

(assert (=> b!886954 (= e!493772 e!493773)))

(declare-fun res!602021 () Bool)

(assert (=> b!886954 (=> (not res!602021) (not e!493773))))

(assert (=> b!886954 (= res!602021 (and (or (not (is-Cons!17672 lt!401154)) (bvsle (_1!5968 (h!18803 lt!401154)) key1!49)) (is-Cons!17672 lt!401154) (bvslt (_1!5968 (h!18803 lt!401154)) key1!49)))))

(declare-fun b!886955 () Bool)

(assert (=> b!886955 (= e!493773 (containsKey!416 (t!24956 lt!401154) key1!49))))

(assert (= (and d!109853 (not res!602020)) b!886954))

(assert (= (and b!886954 res!602021) b!886955))

(declare-fun m!826771 () Bool)

(assert (=> b!886955 m!826771))

(assert (=> b!886728 d!109853))

(declare-fun lt!401180 () Bool)

(declare-fun d!109855 () Bool)

(assert (=> d!109855 (= lt!401180 (member (tuple2!11915 key1!49 v2!16) (content!399 lt!401158)))))

(declare-fun e!493775 () Bool)

(assert (=> d!109855 (= lt!401180 e!493775)))

(declare-fun res!602023 () Bool)

(assert (=> d!109855 (=> (not res!602023) (not e!493775))))

(assert (=> d!109855 (= res!602023 (is-Cons!17672 lt!401158))))

(assert (=> d!109855 (= (contains!4300 lt!401158 (tuple2!11915 key1!49 v2!16)) lt!401180)))

(declare-fun b!886956 () Bool)

(declare-fun e!493774 () Bool)

(assert (=> b!886956 (= e!493775 e!493774)))

(declare-fun res!602022 () Bool)

(assert (=> b!886956 (=> res!602022 e!493774)))

(assert (=> b!886956 (= res!602022 (= (h!18803 lt!401158) (tuple2!11915 key1!49 v2!16)))))

(declare-fun b!886957 () Bool)

(assert (=> b!886957 (= e!493774 (contains!4300 (t!24956 lt!401158) (tuple2!11915 key1!49 v2!16)))))

(assert (= (and d!109855 res!602023) b!886956))

(assert (= (and b!886956 (not res!602022)) b!886957))

(declare-fun m!826773 () Bool)

(assert (=> d!109855 m!826773))

(declare-fun m!826775 () Bool)

(assert (=> d!109855 m!826775))

(declare-fun m!826777 () Bool)

(assert (=> b!886957 m!826777))

(assert (=> b!886771 d!109855))

(declare-fun d!109857 () Bool)

(declare-fun lt!401181 () Bool)

(assert (=> d!109857 (= lt!401181 (member (tuple2!11915 key1!49 v2!16) (content!399 lt!401154)))))

(declare-fun e!493777 () Bool)

(assert (=> d!109857 (= lt!401181 e!493777)))

(declare-fun res!602025 () Bool)

(assert (=> d!109857 (=> (not res!602025) (not e!493777))))

(assert (=> d!109857 (= res!602025 (is-Cons!17672 lt!401154))))

(assert (=> d!109857 (= (contains!4300 lt!401154 (tuple2!11915 key1!49 v2!16)) lt!401181)))

(declare-fun b!886958 () Bool)

(declare-fun e!493776 () Bool)

(assert (=> b!886958 (= e!493777 e!493776)))

(declare-fun res!602024 () Bool)

(assert (=> b!886958 (=> res!602024 e!493776)))

(assert (=> b!886958 (= res!602024 (= (h!18803 lt!401154) (tuple2!11915 key1!49 v2!16)))))

(declare-fun b!886959 () Bool)

(assert (=> b!886959 (= e!493776 (contains!4300 (t!24956 lt!401154) (tuple2!11915 key1!49 v2!16)))))

(assert (= (and d!109857 res!602025) b!886958))

(assert (= (and b!886958 (not res!602024)) b!886959))

(declare-fun m!826779 () Bool)

(assert (=> d!109857 m!826779))

(declare-fun m!826781 () Bool)

(assert (=> d!109857 m!826781))

(declare-fun m!826783 () Bool)

(assert (=> b!886959 m!826783))

(assert (=> b!886726 d!109857))

(declare-fun d!109859 () Bool)

(declare-fun res!602026 () Bool)

(declare-fun e!493778 () Bool)

(assert (=> d!109859 (=> res!602026 e!493778)))

(assert (=> d!109859 (= res!602026 (or (is-Nil!17673 lt!401154) (is-Nil!17673 (t!24956 lt!401154))))))

(assert (=> d!109859 (= (isStrictlySorted!494 lt!401154) e!493778)))

(declare-fun b!886960 () Bool)

(declare-fun e!493779 () Bool)

(assert (=> b!886960 (= e!493778 e!493779)))

(declare-fun res!602027 () Bool)

(assert (=> b!886960 (=> (not res!602027) (not e!493779))))

(assert (=> b!886960 (= res!602027 (bvslt (_1!5968 (h!18803 lt!401154)) (_1!5968 (h!18803 (t!24956 lt!401154)))))))

(declare-fun b!886961 () Bool)

(assert (=> b!886961 (= e!493779 (isStrictlySorted!494 (t!24956 lt!401154)))))

(assert (= (and d!109859 (not res!602026)) b!886960))

(assert (= (and b!886960 res!602027) b!886961))

(declare-fun m!826785 () Bool)

(assert (=> b!886961 m!826785))

(assert (=> d!109753 d!109859))

(declare-fun d!109861 () Bool)

(declare-fun res!602028 () Bool)

(declare-fun e!493780 () Bool)

(assert (=> d!109861 (=> res!602028 e!493780)))

(assert (=> d!109861 (= res!602028 (or (is-Nil!17673 (insertStrictlySorted!302 l!906 key1!49 v1!38)) (is-Nil!17673 (t!24956 (insertStrictlySorted!302 l!906 key1!49 v1!38)))))))

(assert (=> d!109861 (= (isStrictlySorted!494 (insertStrictlySorted!302 l!906 key1!49 v1!38)) e!493780)))

(declare-fun b!886962 () Bool)

(declare-fun e!493781 () Bool)

(assert (=> b!886962 (= e!493780 e!493781)))

(declare-fun res!602029 () Bool)

(assert (=> b!886962 (=> (not res!602029) (not e!493781))))

(assert (=> b!886962 (= res!602029 (bvslt (_1!5968 (h!18803 (insertStrictlySorted!302 l!906 key1!49 v1!38))) (_1!5968 (h!18803 (t!24956 (insertStrictlySorted!302 l!906 key1!49 v1!38))))))))

(declare-fun b!886963 () Bool)

(assert (=> b!886963 (= e!493781 (isStrictlySorted!494 (t!24956 (insertStrictlySorted!302 l!906 key1!49 v1!38))))))

(assert (= (and d!109861 (not res!602028)) b!886962))

(assert (= (and b!886962 res!602029) b!886963))

(assert (=> b!886963 m!826747))

(assert (=> d!109753 d!109861))

(declare-fun d!109863 () Bool)

(assert (=> d!109863 (= ($colon$colon!551 e!493631 (ite c!93573 (h!18803 l!906) (tuple2!11915 key1!49 v1!38))) (Cons!17672 (ite c!93573 (h!18803 l!906) (tuple2!11915 key1!49 v1!38)) e!493631))))

(assert (=> bm!39295 d!109863))

(declare-fun bm!39323 () Bool)

(declare-fun call!39328 () List!17676)

(declare-fun call!39326 () List!17676)

(assert (=> bm!39323 (= call!39328 call!39326)))

(declare-fun bm!39324 () Bool)

(declare-fun call!39327 () List!17676)

(assert (=> bm!39324 (= call!39327 call!39328)))

(declare-fun b!886964 () Bool)

(declare-fun c!93611 () Bool)

(assert (=> b!886964 (= c!93611 (and (is-Cons!17672 (t!24956 l!906)) (bvsgt (_1!5968 (h!18803 (t!24956 l!906))) key1!49)))))

(declare-fun e!493782 () List!17676)

(declare-fun e!493785 () List!17676)

(assert (=> b!886964 (= e!493782 e!493785)))

(declare-fun b!886965 () Bool)

(declare-fun e!493786 () Bool)

(declare-fun lt!401182 () List!17676)

(assert (=> b!886965 (= e!493786 (contains!4300 lt!401182 (tuple2!11915 key1!49 v2!16)))))

(declare-fun e!493784 () List!17676)

(declare-fun b!886966 () Bool)

(declare-fun c!93614 () Bool)

(assert (=> b!886966 (= e!493784 (ite c!93614 (t!24956 (t!24956 l!906)) (ite c!93611 (Cons!17672 (h!18803 (t!24956 l!906)) (t!24956 (t!24956 l!906))) Nil!17673)))))

(declare-fun b!886967 () Bool)

(declare-fun res!602030 () Bool)

(assert (=> b!886967 (=> (not res!602030) (not e!493786))))

(assert (=> b!886967 (= res!602030 (containsKey!416 lt!401182 key1!49))))

(declare-fun d!109865 () Bool)

(assert (=> d!109865 e!493786))

(declare-fun res!602031 () Bool)

(assert (=> d!109865 (=> (not res!602031) (not e!493786))))

(assert (=> d!109865 (= res!602031 (isStrictlySorted!494 lt!401182))))

(declare-fun e!493783 () List!17676)

(assert (=> d!109865 (= lt!401182 e!493783)))

(declare-fun c!93613 () Bool)

(assert (=> d!109865 (= c!93613 (and (is-Cons!17672 (t!24956 l!906)) (bvslt (_1!5968 (h!18803 (t!24956 l!906))) key1!49)))))

(assert (=> d!109865 (isStrictlySorted!494 (t!24956 l!906))))

(assert (=> d!109865 (= (insertStrictlySorted!302 (t!24956 l!906) key1!49 v2!16) lt!401182)))

(declare-fun bm!39325 () Bool)

(assert (=> bm!39325 (= call!39326 ($colon$colon!551 e!493784 (ite c!93613 (h!18803 (t!24956 l!906)) (tuple2!11915 key1!49 v2!16))))))

(declare-fun c!93612 () Bool)

(assert (=> bm!39325 (= c!93612 c!93613)))

(declare-fun b!886968 () Bool)

(assert (=> b!886968 (= e!493783 call!39326)))

(declare-fun b!886969 () Bool)

(assert (=> b!886969 (= e!493785 call!39327)))

(declare-fun b!886970 () Bool)

(assert (=> b!886970 (= e!493782 call!39328)))

(declare-fun b!886971 () Bool)

(assert (=> b!886971 (= e!493784 (insertStrictlySorted!302 (t!24956 (t!24956 l!906)) key1!49 v2!16))))

(declare-fun b!886972 () Bool)

(assert (=> b!886972 (= e!493785 call!39327)))

(declare-fun b!886973 () Bool)

(assert (=> b!886973 (= e!493783 e!493782)))

(assert (=> b!886973 (= c!93614 (and (is-Cons!17672 (t!24956 l!906)) (= (_1!5968 (h!18803 (t!24956 l!906))) key1!49)))))

(assert (= (and d!109865 c!93613) b!886968))

(assert (= (and d!109865 (not c!93613)) b!886973))

(assert (= (and b!886973 c!93614) b!886970))

(assert (= (and b!886973 (not c!93614)) b!886964))

(assert (= (and b!886964 c!93611) b!886972))

(assert (= (and b!886964 (not c!93611)) b!886969))

(assert (= (or b!886972 b!886969) bm!39324))

(assert (= (or b!886970 bm!39324) bm!39323))

(assert (= (or b!886968 bm!39323) bm!39325))

(assert (= (and bm!39325 c!93612) b!886971))

(assert (= (and bm!39325 (not c!93612)) b!886966))

(assert (= (and d!109865 res!602031) b!886967))

(assert (= (and b!886967 res!602030) b!886965))

(declare-fun m!826787 () Bool)

(assert (=> b!886971 m!826787))

(declare-fun m!826789 () Bool)

(assert (=> b!886967 m!826789))

(declare-fun m!826791 () Bool)

(assert (=> b!886965 m!826791))

(declare-fun m!826793 () Bool)

(assert (=> bm!39325 m!826793))

(declare-fun m!826795 () Bool)

(assert (=> d!109865 m!826795))

(assert (=> d!109865 m!826509))

(assert (=> b!886778 d!109865))

(declare-fun d!109867 () Bool)

(declare-fun res!602032 () Bool)

(declare-fun e!493787 () Bool)

(assert (=> d!109867 (=> res!602032 e!493787)))

(assert (=> d!109867 (= res!602032 (or (is-Nil!17673 lt!401158) (is-Nil!17673 (t!24956 lt!401158))))))

(assert (=> d!109867 (= (isStrictlySorted!494 lt!401158) e!493787)))

(declare-fun b!886974 () Bool)

(declare-fun e!493788 () Bool)

(assert (=> b!886974 (= e!493787 e!493788)))

(declare-fun res!602033 () Bool)

(assert (=> b!886974 (=> (not res!602033) (not e!493788))))

(assert (=> b!886974 (= res!602033 (bvslt (_1!5968 (h!18803 lt!401158)) (_1!5968 (h!18803 (t!24956 lt!401158)))))))

(declare-fun b!886975 () Bool)

(assert (=> b!886975 (= e!493788 (isStrictlySorted!494 (t!24956 lt!401158)))))

(assert (= (and d!109867 (not res!602032)) b!886974))

(assert (= (and b!886974 res!602033) b!886975))

(declare-fun m!826797 () Bool)

(assert (=> b!886975 m!826797))

(assert (=> d!109767 d!109867))

(assert (=> d!109767 d!109749))

(declare-fun d!109869 () Bool)

(declare-fun res!602034 () Bool)

(declare-fun e!493789 () Bool)

(assert (=> d!109869 (=> res!602034 e!493789)))

(assert (=> d!109869 (= res!602034 (and (is-Cons!17672 lt!401157) (= (_1!5968 (h!18803 lt!401157)) key1!49)))))

(assert (=> d!109869 (= (containsKey!416 lt!401157 key1!49) e!493789)))

(declare-fun b!886976 () Bool)

(declare-fun e!493790 () Bool)

(assert (=> b!886976 (= e!493789 e!493790)))

(declare-fun res!602035 () Bool)

(assert (=> b!886976 (=> (not res!602035) (not e!493790))))

(assert (=> b!886976 (= res!602035 (and (or (not (is-Cons!17672 lt!401157)) (bvsle (_1!5968 (h!18803 lt!401157)) key1!49)) (is-Cons!17672 lt!401157) (bvslt (_1!5968 (h!18803 lt!401157)) key1!49)))))

(declare-fun b!886977 () Bool)

(assert (=> b!886977 (= e!493790 (containsKey!416 (t!24956 lt!401157) key1!49))))

(assert (= (and d!109869 (not res!602034)) b!886976))

(assert (= (and b!886976 res!602035) b!886977))

(declare-fun m!826799 () Bool)

(assert (=> b!886977 m!826799))

(assert (=> b!886758 d!109869))

(declare-fun b!886978 () Bool)

(declare-fun e!493791 () Bool)

(declare-fun tp!54404 () Bool)

(assert (=> b!886978 (= e!493791 (and tp_is_empty!17819 tp!54404))))

(assert (=> b!886795 (= tp!54401 e!493791)))

(assert (= (and b!886795 (is-Cons!17672 (t!24956 (t!24956 l!906)))) b!886978))

(push 1)

