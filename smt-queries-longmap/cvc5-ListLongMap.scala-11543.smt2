; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134360 () Bool)

(assert start!134360)

(declare-fun b!1568984 () Bool)

(declare-fun res!1072440 () Bool)

(declare-fun e!874645 () Bool)

(assert (=> b!1568984 (=> (not res!1072440) (not e!874645))))

(declare-datatypes ((B!2492 0))(
  ( (B!2493 (val!19608 Int)) )
))
(declare-datatypes ((tuple2!25318 0))(
  ( (tuple2!25319 (_1!12670 (_ BitVec 64)) (_2!12670 B!2492)) )
))
(declare-datatypes ((List!36728 0))(
  ( (Nil!36725) (Cons!36724 (h!38171 tuple2!25318) (t!51636 List!36728)) )
))
(declare-fun l!750 () List!36728)

(declare-fun isStrictlySorted!1001 (List!36728) Bool)

(assert (=> b!1568984 (= res!1072440 (isStrictlySorted!1001 l!750))))

(declare-fun b!1568985 () Bool)

(declare-fun res!1072441 () Bool)

(assert (=> b!1568985 (=> (not res!1072441) (not e!874645))))

(assert (=> b!1568985 (= res!1072441 (isStrictlySorted!1001 (t!51636 l!750)))))

(declare-fun b!1568986 () Bool)

(declare-fun res!1072443 () Bool)

(assert (=> b!1568986 (=> (not res!1072443) (not e!874645))))

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(assert (=> b!1568986 (= res!1072443 (and (is-Cons!36724 l!750) (bvslt (_1!12670 (h!38171 l!750)) key1!37) (bvslt (_1!12670 (h!38171 l!750)) key2!21)))))

(declare-fun res!1072442 () Bool)

(assert (=> start!134360 (=> (not res!1072442) (not e!874645))))

(assert (=> start!134360 (= res!1072442 (not (= key1!37 key2!21)))))

(assert (=> start!134360 e!874645))

(declare-fun tp_is_empty!39043 () Bool)

(assert (=> start!134360 tp_is_empty!39043))

(declare-fun e!874646 () Bool)

(assert (=> start!134360 e!874646))

(assert (=> start!134360 true))

(declare-fun v2!10 () B!2492)

(declare-fun b!1568987 () Bool)

(declare-fun insertStrictlySorted!587 (List!36728 (_ BitVec 64) B!2492) List!36728)

(assert (=> b!1568987 (= e!874645 (not (isStrictlySorted!1001 (insertStrictlySorted!587 l!750 key2!21 v2!10))))))

(declare-fun v1!32 () B!2492)

(assert (=> b!1568987 (= (insertStrictlySorted!587 (insertStrictlySorted!587 (t!51636 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!587 (insertStrictlySorted!587 (t!51636 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-datatypes ((Unit!52090 0))(
  ( (Unit!52091) )
))
(declare-fun lt!673261 () Unit!52090)

(declare-fun lemmaInsertStrictlySortedCommutative!13 (List!36728 (_ BitVec 64) B!2492 (_ BitVec 64) B!2492) Unit!52090)

(assert (=> b!1568987 (= lt!673261 (lemmaInsertStrictlySortedCommutative!13 (t!51636 l!750) key1!37 v1!32 key2!21 v2!10))))

(declare-fun b!1568988 () Bool)

(declare-fun tp!114075 () Bool)

(assert (=> b!1568988 (= e!874646 (and tp_is_empty!39043 tp!114075))))

(assert (= (and start!134360 res!1072442) b!1568984))

(assert (= (and b!1568984 res!1072440) b!1568986))

(assert (= (and b!1568986 res!1072443) b!1568985))

(assert (= (and b!1568985 res!1072441) b!1568987))

(assert (= (and start!134360 (is-Cons!36724 l!750)) b!1568988))

(declare-fun m!1443511 () Bool)

(assert (=> b!1568984 m!1443511))

(declare-fun m!1443513 () Bool)

(assert (=> b!1568985 m!1443513))

(declare-fun m!1443515 () Bool)

(assert (=> b!1568987 m!1443515))

(declare-fun m!1443517 () Bool)

(assert (=> b!1568987 m!1443517))

(declare-fun m!1443519 () Bool)

(assert (=> b!1568987 m!1443519))

(assert (=> b!1568987 m!1443517))

(declare-fun m!1443521 () Bool)

(assert (=> b!1568987 m!1443521))

(declare-fun m!1443523 () Bool)

(assert (=> b!1568987 m!1443523))

(declare-fun m!1443525 () Bool)

(assert (=> b!1568987 m!1443525))

(assert (=> b!1568987 m!1443523))

(assert (=> b!1568987 m!1443515))

(declare-fun m!1443527 () Bool)

(assert (=> b!1568987 m!1443527))

(push 1)

(assert (not b!1568987))

(assert tp_is_empty!39043)

(assert (not b!1568984))

(assert (not b!1568988))

(assert (not b!1568985))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163819 () Bool)

(declare-fun res!1072472 () Bool)

(declare-fun e!874663 () Bool)

(assert (=> d!163819 (=> res!1072472 e!874663)))

(assert (=> d!163819 (= res!1072472 (or (is-Nil!36725 l!750) (is-Nil!36725 (t!51636 l!750))))))

(assert (=> d!163819 (= (isStrictlySorted!1001 l!750) e!874663)))

(declare-fun b!1569023 () Bool)

(declare-fun e!874664 () Bool)

(assert (=> b!1569023 (= e!874663 e!874664)))

(declare-fun res!1072473 () Bool)

(assert (=> b!1569023 (=> (not res!1072473) (not e!874664))))

(assert (=> b!1569023 (= res!1072473 (bvslt (_1!12670 (h!38171 l!750)) (_1!12670 (h!38171 (t!51636 l!750)))))))

(declare-fun b!1569024 () Bool)

(assert (=> b!1569024 (= e!874664 (isStrictlySorted!1001 (t!51636 l!750)))))

(assert (= (and d!163819 (not res!1072472)) b!1569023))

(assert (= (and b!1569023 res!1072473) b!1569024))

(assert (=> b!1569024 m!1443513))

(assert (=> b!1568984 d!163819))

(declare-fun d!163823 () Bool)

(declare-fun res!1072474 () Bool)

(declare-fun e!874665 () Bool)

(assert (=> d!163823 (=> res!1072474 e!874665)))

(assert (=> d!163823 (= res!1072474 (or (is-Nil!36725 (t!51636 l!750)) (is-Nil!36725 (t!51636 (t!51636 l!750)))))))

(assert (=> d!163823 (= (isStrictlySorted!1001 (t!51636 l!750)) e!874665)))

(declare-fun b!1569025 () Bool)

(declare-fun e!874666 () Bool)

(assert (=> b!1569025 (= e!874665 e!874666)))

(declare-fun res!1072475 () Bool)

(assert (=> b!1569025 (=> (not res!1072475) (not e!874666))))

(assert (=> b!1569025 (= res!1072475 (bvslt (_1!12670 (h!38171 (t!51636 l!750))) (_1!12670 (h!38171 (t!51636 (t!51636 l!750))))))))

(declare-fun b!1569026 () Bool)

(assert (=> b!1569026 (= e!874666 (isStrictlySorted!1001 (t!51636 (t!51636 l!750))))))

(assert (= (and d!163823 (not res!1072474)) b!1569025))

(assert (= (and b!1569025 res!1072475) b!1569026))

(declare-fun m!1443567 () Bool)

(assert (=> b!1569026 m!1443567))

(assert (=> b!1568985 d!163823))

(declare-fun d!163825 () Bool)

(assert (=> d!163825 (= (insertStrictlySorted!587 (insertStrictlySorted!587 (t!51636 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!587 (insertStrictlySorted!587 (t!51636 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-fun lt!673275 () Unit!52090)

(declare-fun choose!2083 (List!36728 (_ BitVec 64) B!2492 (_ BitVec 64) B!2492) Unit!52090)

(assert (=> d!163825 (= lt!673275 (choose!2083 (t!51636 l!750) key1!37 v1!32 key2!21 v2!10))))

(assert (=> d!163825 (not (= key1!37 key2!21))))

(assert (=> d!163825 (= (lemmaInsertStrictlySortedCommutative!13 (t!51636 l!750) key1!37 v1!32 key2!21 v2!10) lt!673275)))

(declare-fun bs!45197 () Bool)

(assert (= bs!45197 d!163825))

(assert (=> bs!45197 m!1443515))

(assert (=> bs!45197 m!1443527))

(declare-fun m!1443569 () Bool)

(assert (=> bs!45197 m!1443569))

(assert (=> bs!45197 m!1443515))

(assert (=> bs!45197 m!1443517))

(assert (=> bs!45197 m!1443517))

(assert (=> bs!45197 m!1443519))

(assert (=> b!1568987 d!163825))

(declare-fun b!1569133 () Bool)

(declare-fun e!874726 () List!36728)

(declare-fun call!72035 () List!36728)

(assert (=> b!1569133 (= e!874726 call!72035)))

(declare-fun b!1569134 () Bool)

(declare-fun c!144660 () Bool)

(assert (=> b!1569134 (= c!144660 (and (is-Cons!36724 l!750) (bvsgt (_1!12670 (h!38171 l!750)) key2!21)))))

(declare-fun e!874723 () List!36728)

(assert (=> b!1569134 (= e!874723 e!874726)))

(declare-fun b!1569135 () Bool)

(declare-fun e!874724 () List!36728)

(assert (=> b!1569135 (= e!874724 e!874723)))

(declare-fun c!144661 () Bool)

(assert (=> b!1569135 (= c!144661 (and (is-Cons!36724 l!750) (= (_1!12670 (h!38171 l!750)) key2!21)))))

(declare-fun b!1569136 () Bool)

(assert (=> b!1569136 (= e!874726 call!72035)))

(declare-fun bm!72030 () Bool)

(declare-fun call!72034 () List!36728)

(assert (=> bm!72030 (= call!72035 call!72034)))

(declare-fun b!1569137 () Bool)

(declare-fun res!1072503 () Bool)

(declare-fun e!874725 () Bool)

(assert (=> b!1569137 (=> (not res!1072503) (not e!874725))))

(declare-fun lt!673287 () List!36728)

(declare-fun containsKey!861 (List!36728 (_ BitVec 64)) Bool)

(assert (=> b!1569137 (= res!1072503 (containsKey!861 lt!673287 key2!21))))

(declare-fun b!1569138 () Bool)

(declare-fun call!72033 () List!36728)

(assert (=> b!1569138 (= e!874724 call!72033)))

(declare-fun b!1569139 () Bool)

(assert (=> b!1569139 (= e!874723 call!72034)))

(declare-fun c!144662 () Bool)

(declare-fun bm!72031 () Bool)

(declare-fun e!874727 () List!36728)

(declare-fun $colon$colon!992 (List!36728 tuple2!25318) List!36728)

(assert (=> bm!72031 (= call!72033 ($colon$colon!992 e!874727 (ite c!144662 (h!38171 l!750) (tuple2!25319 key2!21 v2!10))))))

(declare-fun c!144659 () Bool)

(assert (=> bm!72031 (= c!144659 c!144662)))

(declare-fun b!1569140 () Bool)

(assert (=> b!1569140 (= e!874727 (ite c!144661 (t!51636 l!750) (ite c!144660 (Cons!36724 (h!38171 l!750) (t!51636 l!750)) Nil!36725)))))

(declare-fun b!1569141 () Bool)

(declare-fun contains!10419 (List!36728 tuple2!25318) Bool)

(assert (=> b!1569141 (= e!874725 (contains!10419 lt!673287 (tuple2!25319 key2!21 v2!10)))))

(declare-fun b!1569142 () Bool)

(assert (=> b!1569142 (= e!874727 (insertStrictlySorted!587 (t!51636 l!750) key2!21 v2!10))))

(declare-fun d!163829 () Bool)

(assert (=> d!163829 e!874725))

(declare-fun res!1072502 () Bool)

(assert (=> d!163829 (=> (not res!1072502) (not e!874725))))

(assert (=> d!163829 (= res!1072502 (isStrictlySorted!1001 lt!673287))))

(assert (=> d!163829 (= lt!673287 e!874724)))

(assert (=> d!163829 (= c!144662 (and (is-Cons!36724 l!750) (bvslt (_1!12670 (h!38171 l!750)) key2!21)))))

(assert (=> d!163829 (isStrictlySorted!1001 l!750)))

(assert (=> d!163829 (= (insertStrictlySorted!587 l!750 key2!21 v2!10) lt!673287)))

(declare-fun bm!72032 () Bool)

(assert (=> bm!72032 (= call!72034 call!72033)))

(assert (= (and d!163829 c!144662) b!1569138))

(assert (= (and d!163829 (not c!144662)) b!1569135))

(assert (= (and b!1569135 c!144661) b!1569139))

(assert (= (and b!1569135 (not c!144661)) b!1569134))

(assert (= (and b!1569134 c!144660) b!1569136))

(assert (= (and b!1569134 (not c!144660)) b!1569133))

(assert (= (or b!1569136 b!1569133) bm!72030))

(assert (= (or b!1569139 bm!72030) bm!72032))

(assert (= (or b!1569138 bm!72032) bm!72031))

(assert (= (and bm!72031 c!144659) b!1569142))

(assert (= (and bm!72031 (not c!144659)) b!1569140))

(assert (= (and d!163829 res!1072502) b!1569137))

(assert (= (and b!1569137 res!1072503) b!1569141))

(assert (=> b!1569142 m!1443515))

(declare-fun m!1443617 () Bool)

(assert (=> bm!72031 m!1443617))

(declare-fun m!1443619 () Bool)

(assert (=> b!1569137 m!1443619))

(declare-fun m!1443621 () Bool)

(assert (=> d!163829 m!1443621))

(assert (=> d!163829 m!1443511))

(declare-fun m!1443623 () Bool)

(assert (=> b!1569141 m!1443623))

(assert (=> b!1568987 d!163829))

(declare-fun b!1569163 () Bool)

(declare-fun e!874741 () List!36728)

(declare-fun call!72044 () List!36728)

(assert (=> b!1569163 (= e!874741 call!72044)))

(declare-fun b!1569164 () Bool)

(declare-fun c!144672 () Bool)

(assert (=> b!1569164 (= c!144672 (and (is-Cons!36724 (insertStrictlySorted!587 (t!51636 l!750) key1!37 v1!32)) (bvsgt (_1!12670 (h!38171 (insertStrictlySorted!587 (t!51636 l!750) key1!37 v1!32))) key2!21)))))

(declare-fun e!874738 () List!36728)

(assert (=> b!1569164 (= e!874738 e!874741)))

(declare-fun b!1569165 () Bool)

(declare-fun e!874739 () List!36728)

(assert (=> b!1569165 (= e!874739 e!874738)))

(declare-fun c!144673 () Bool)

(assert (=> b!1569165 (= c!144673 (and (is-Cons!36724 (insertStrictlySorted!587 (t!51636 l!750) key1!37 v1!32)) (= (_1!12670 (h!38171 (insertStrictlySorted!587 (t!51636 l!750) key1!37 v1!32))) key2!21)))))

(declare-fun b!1569166 () Bool)

(assert (=> b!1569166 (= e!874741 call!72044)))

(declare-fun bm!72039 () Bool)

(declare-fun call!72043 () List!36728)

(assert (=> bm!72039 (= call!72044 call!72043)))

(declare-fun b!1569167 () Bool)

(declare-fun res!1072509 () Bool)

(declare-fun e!874740 () Bool)

(assert (=> b!1569167 (=> (not res!1072509) (not e!874740))))

(declare-fun lt!673290 () List!36728)

(assert (=> b!1569167 (= res!1072509 (containsKey!861 lt!673290 key2!21))))

(declare-fun b!1569168 () Bool)

(declare-fun call!72042 () List!36728)

(assert (=> b!1569168 (= e!874739 call!72042)))

(declare-fun b!1569169 () Bool)

(assert (=> b!1569169 (= e!874738 call!72043)))

(declare-fun c!144674 () Bool)

(declare-fun e!874742 () List!36728)

(declare-fun bm!72040 () Bool)

(assert (=> bm!72040 (= call!72042 ($colon$colon!992 e!874742 (ite c!144674 (h!38171 (insertStrictlySorted!587 (t!51636 l!750) key1!37 v1!32)) (tuple2!25319 key2!21 v2!10))))))

(declare-fun c!144671 () Bool)

(assert (=> bm!72040 (= c!144671 c!144674)))

(declare-fun b!1569170 () Bool)

(assert (=> b!1569170 (= e!874742 (ite c!144673 (t!51636 (insertStrictlySorted!587 (t!51636 l!750) key1!37 v1!32)) (ite c!144672 (Cons!36724 (h!38171 (insertStrictlySorted!587 (t!51636 l!750) key1!37 v1!32)) (t!51636 (insertStrictlySorted!587 (t!51636 l!750) key1!37 v1!32))) Nil!36725)))))

(declare-fun b!1569171 () Bool)

(assert (=> b!1569171 (= e!874740 (contains!10419 lt!673290 (tuple2!25319 key2!21 v2!10)))))

(declare-fun b!1569172 () Bool)

(assert (=> b!1569172 (= e!874742 (insertStrictlySorted!587 (t!51636 (insertStrictlySorted!587 (t!51636 l!750) key1!37 v1!32)) key2!21 v2!10))))

(declare-fun d!163843 () Bool)

(assert (=> d!163843 e!874740))

(declare-fun res!1072508 () Bool)

(assert (=> d!163843 (=> (not res!1072508) (not e!874740))))

(assert (=> d!163843 (= res!1072508 (isStrictlySorted!1001 lt!673290))))

(assert (=> d!163843 (= lt!673290 e!874739)))

(assert (=> d!163843 (= c!144674 (and (is-Cons!36724 (insertStrictlySorted!587 (t!51636 l!750) key1!37 v1!32)) (bvslt (_1!12670 (h!38171 (insertStrictlySorted!587 (t!51636 l!750) key1!37 v1!32))) key2!21)))))

(assert (=> d!163843 (isStrictlySorted!1001 (insertStrictlySorted!587 (t!51636 l!750) key1!37 v1!32))))

(assert (=> d!163843 (= (insertStrictlySorted!587 (insertStrictlySorted!587 (t!51636 l!750) key1!37 v1!32) key2!21 v2!10) lt!673290)))

(declare-fun bm!72041 () Bool)

(assert (=> bm!72041 (= call!72043 call!72042)))

(assert (= (and d!163843 c!144674) b!1569168))

(assert (= (and d!163843 (not c!144674)) b!1569165))

(assert (= (and b!1569165 c!144673) b!1569169))

(assert (= (and b!1569165 (not c!144673)) b!1569164))

(assert (= (and b!1569164 c!144672) b!1569166))

(assert (= (and b!1569164 (not c!144672)) b!1569163))

(assert (= (or b!1569166 b!1569163) bm!72039))

(assert (= (or b!1569169 bm!72039) bm!72041))

(assert (= (or b!1569168 bm!72041) bm!72040))

(assert (= (and bm!72040 c!144671) b!1569172))

(assert (= (and bm!72040 (not c!144671)) b!1569170))

(assert (= (and d!163843 res!1072508) b!1569167))

(assert (= (and b!1569167 res!1072509) b!1569171))

(declare-fun m!1443645 () Bool)

(assert (=> b!1569172 m!1443645))

(declare-fun m!1443647 () Bool)

(assert (=> bm!72040 m!1443647))

(declare-fun m!1443649 () Bool)

(assert (=> b!1569167 m!1443649))

(declare-fun m!1443651 () Bool)

(assert (=> d!163843 m!1443651))

(assert (=> d!163843 m!1443517))

(declare-fun m!1443653 () Bool)

(assert (=> d!163843 m!1443653))

(declare-fun m!1443655 () Bool)

(assert (=> b!1569171 m!1443655))

(assert (=> b!1568987 d!163843))

(declare-fun b!1569191 () Bool)

(declare-fun e!874757 () List!36728)

(declare-fun call!72050 () List!36728)

(assert (=> b!1569191 (= e!874757 call!72050)))

(declare-fun b!1569192 () Bool)

(declare-fun c!144680 () Bool)

(assert (=> b!1569192 (= c!144680 (and (is-Cons!36724 (t!51636 l!750)) (bvsgt (_1!12670 (h!38171 (t!51636 l!750))) key2!21)))))

(declare-fun e!874752 () List!36728)

(assert (=> b!1569192 (= e!874752 e!874757)))

(declare-fun b!1569193 () Bool)

(declare-fun e!874755 () List!36728)

(assert (=> b!1569193 (= e!874755 e!874752)))

(declare-fun c!144681 () Bool)

(assert (=> b!1569193 (= c!144681 (and (is-Cons!36724 (t!51636 l!750)) (= (_1!12670 (h!38171 (t!51636 l!750))) key2!21)))))

(declare-fun b!1569194 () Bool)

(assert (=> b!1569194 (= e!874757 call!72050)))

(declare-fun bm!72045 () Bool)

(declare-fun call!72049 () List!36728)

(assert (=> bm!72045 (= call!72050 call!72049)))

(declare-fun b!1569195 () Bool)

(declare-fun res!1072517 () Bool)

(declare-fun e!874756 () Bool)

(assert (=> b!1569195 (=> (not res!1072517) (not e!874756))))

(declare-fun lt!673292 () List!36728)

(assert (=> b!1569195 (= res!1072517 (containsKey!861 lt!673292 key2!21))))

(declare-fun b!1569196 () Bool)

(declare-fun call!72048 () List!36728)

(assert (=> b!1569196 (= e!874755 call!72048)))

(declare-fun b!1569197 () Bool)

(assert (=> b!1569197 (= e!874752 call!72049)))

(declare-fun e!874758 () List!36728)

(declare-fun bm!72046 () Bool)

(declare-fun c!144682 () Bool)

(assert (=> bm!72046 (= call!72048 ($colon$colon!992 e!874758 (ite c!144682 (h!38171 (t!51636 l!750)) (tuple2!25319 key2!21 v2!10))))))

(declare-fun c!144679 () Bool)

(assert (=> bm!72046 (= c!144679 c!144682)))

(declare-fun b!1569198 () Bool)

(assert (=> b!1569198 (= e!874758 (ite c!144681 (t!51636 (t!51636 l!750)) (ite c!144680 (Cons!36724 (h!38171 (t!51636 l!750)) (t!51636 (t!51636 l!750))) Nil!36725)))))

(declare-fun b!1569199 () Bool)

(assert (=> b!1569199 (= e!874756 (contains!10419 lt!673292 (tuple2!25319 key2!21 v2!10)))))

(declare-fun b!1569200 () Bool)

(assert (=> b!1569200 (= e!874758 (insertStrictlySorted!587 (t!51636 (t!51636 l!750)) key2!21 v2!10))))

(declare-fun d!163851 () Bool)

(assert (=> d!163851 e!874756))

(declare-fun res!1072516 () Bool)

(assert (=> d!163851 (=> (not res!1072516) (not e!874756))))

(assert (=> d!163851 (= res!1072516 (isStrictlySorted!1001 lt!673292))))

(assert (=> d!163851 (= lt!673292 e!874755)))

(assert (=> d!163851 (= c!144682 (and (is-Cons!36724 (t!51636 l!750)) (bvslt (_1!12670 (h!38171 (t!51636 l!750))) key2!21)))))

(assert (=> d!163851 (isStrictlySorted!1001 (t!51636 l!750))))

(assert (=> d!163851 (= (insertStrictlySorted!587 (t!51636 l!750) key2!21 v2!10) lt!673292)))

(declare-fun bm!72047 () Bool)

(assert (=> bm!72047 (= call!72049 call!72048)))

(assert (= (and d!163851 c!144682) b!1569196))

(assert (= (and d!163851 (not c!144682)) b!1569193))

(assert (= (and b!1569193 c!144681) b!1569197))

(assert (= (and b!1569193 (not c!144681)) b!1569192))

(assert (= (and b!1569192 c!144680) b!1569194))

(assert (= (and b!1569192 (not c!144680)) b!1569191))

(assert (= (or b!1569194 b!1569191) bm!72045))

(assert (= (or b!1569197 bm!72045) bm!72047))

(assert (= (or b!1569196 bm!72047) bm!72046))

(assert (= (and bm!72046 c!144679) b!1569200))

(assert (= (and bm!72046 (not c!144679)) b!1569198))

(assert (= (and d!163851 res!1072516) b!1569195))

(assert (= (and b!1569195 res!1072517) b!1569199))

(declare-fun m!1443669 () Bool)

(assert (=> b!1569200 m!1443669))

(declare-fun m!1443671 () Bool)

(assert (=> bm!72046 m!1443671))

(declare-fun m!1443673 () Bool)

(assert (=> b!1569195 m!1443673))

(declare-fun m!1443675 () Bool)

(assert (=> d!163851 m!1443675))

(assert (=> d!163851 m!1443513))

(declare-fun m!1443677 () Bool)

(assert (=> b!1569199 m!1443677))

(assert (=> b!1568987 d!163851))

(declare-fun d!163855 () Bool)

(declare-fun res!1072520 () Bool)

(declare-fun e!874765 () Bool)

(assert (=> d!163855 (=> res!1072520 e!874765)))

(assert (=> d!163855 (= res!1072520 (or (is-Nil!36725 (insertStrictlySorted!587 l!750 key2!21 v2!10)) (is-Nil!36725 (t!51636 (insertStrictlySorted!587 l!750 key2!21 v2!10)))))))

(assert (=> d!163855 (= (isStrictlySorted!1001 (insertStrictlySorted!587 l!750 key2!21 v2!10)) e!874765)))

(declare-fun b!1569212 () Bool)

(declare-fun e!874766 () Bool)

(assert (=> b!1569212 (= e!874765 e!874766)))

(declare-fun res!1072521 () Bool)

(assert (=> b!1569212 (=> (not res!1072521) (not e!874766))))

(assert (=> b!1569212 (= res!1072521 (bvslt (_1!12670 (h!38171 (insertStrictlySorted!587 l!750 key2!21 v2!10))) (_1!12670 (h!38171 (t!51636 (insertStrictlySorted!587 l!750 key2!21 v2!10))))))))

(declare-fun b!1569213 () Bool)

(assert (=> b!1569213 (= e!874766 (isStrictlySorted!1001 (t!51636 (insertStrictlySorted!587 l!750 key2!21 v2!10))))))

(assert (= (and d!163855 (not res!1072520)) b!1569212))

(assert (= (and b!1569212 res!1072521) b!1569213))

(declare-fun m!1443679 () Bool)

(assert (=> b!1569213 m!1443679))

(assert (=> b!1568987 d!163855))

(declare-fun b!1569214 () Bool)

(declare-fun e!874770 () List!36728)

(declare-fun call!72056 () List!36728)

(assert (=> b!1569214 (= e!874770 call!72056)))

(declare-fun c!144688 () Bool)

(declare-fun b!1569215 () Bool)

(assert (=> b!1569215 (= c!144688 (and (is-Cons!36724 (insertStrictlySorted!587 (t!51636 l!750) key2!21 v2!10)) (bvsgt (_1!12670 (h!38171 (insertStrictlySorted!587 (t!51636 l!750) key2!21 v2!10))) key1!37)))))

(declare-fun e!874767 () List!36728)

(assert (=> b!1569215 (= e!874767 e!874770)))

(declare-fun b!1569216 () Bool)

(declare-fun e!874768 () List!36728)

(assert (=> b!1569216 (= e!874768 e!874767)))

(declare-fun c!144689 () Bool)

(assert (=> b!1569216 (= c!144689 (and (is-Cons!36724 (insertStrictlySorted!587 (t!51636 l!750) key2!21 v2!10)) (= (_1!12670 (h!38171 (insertStrictlySorted!587 (t!51636 l!750) key2!21 v2!10))) key1!37)))))

(declare-fun b!1569217 () Bool)

(assert (=> b!1569217 (= e!874770 call!72056)))

(declare-fun bm!72051 () Bool)

(declare-fun call!72055 () List!36728)

(assert (=> bm!72051 (= call!72056 call!72055)))

(declare-fun b!1569218 () Bool)

(declare-fun res!1072523 () Bool)

(declare-fun e!874769 () Bool)

(assert (=> b!1569218 (=> (not res!1072523) (not e!874769))))

(declare-fun lt!673294 () List!36728)

(assert (=> b!1569218 (= res!1072523 (containsKey!861 lt!673294 key1!37))))

(declare-fun b!1569219 () Bool)

(declare-fun call!72054 () List!36728)

(assert (=> b!1569219 (= e!874768 call!72054)))

(declare-fun b!1569220 () Bool)

(assert (=> b!1569220 (= e!874767 call!72055)))

(declare-fun c!144690 () Bool)

(declare-fun e!874771 () List!36728)

(declare-fun bm!72052 () Bool)

(assert (=> bm!72052 (= call!72054 ($colon$colon!992 e!874771 (ite c!144690 (h!38171 (insertStrictlySorted!587 (t!51636 l!750) key2!21 v2!10)) (tuple2!25319 key1!37 v1!32))))))

(declare-fun c!144687 () Bool)

(assert (=> bm!72052 (= c!144687 c!144690)))

(declare-fun b!1569221 () Bool)

(assert (=> b!1569221 (= e!874771 (ite c!144689 (t!51636 (insertStrictlySorted!587 (t!51636 l!750) key2!21 v2!10)) (ite c!144688 (Cons!36724 (h!38171 (insertStrictlySorted!587 (t!51636 l!750) key2!21 v2!10)) (t!51636 (insertStrictlySorted!587 (t!51636 l!750) key2!21 v2!10))) Nil!36725)))))

(declare-fun b!1569222 () Bool)

(assert (=> b!1569222 (= e!874769 (contains!10419 lt!673294 (tuple2!25319 key1!37 v1!32)))))

(declare-fun b!1569223 () Bool)

(assert (=> b!1569223 (= e!874771 (insertStrictlySorted!587 (t!51636 (insertStrictlySorted!587 (t!51636 l!750) key2!21 v2!10)) key1!37 v1!32))))

(declare-fun d!163857 () Bool)

(assert (=> d!163857 e!874769))

(declare-fun res!1072522 () Bool)

(assert (=> d!163857 (=> (not res!1072522) (not e!874769))))

(assert (=> d!163857 (= res!1072522 (isStrictlySorted!1001 lt!673294))))

(assert (=> d!163857 (= lt!673294 e!874768)))

(assert (=> d!163857 (= c!144690 (and (is-Cons!36724 (insertStrictlySorted!587 (t!51636 l!750) key2!21 v2!10)) (bvslt (_1!12670 (h!38171 (insertStrictlySorted!587 (t!51636 l!750) key2!21 v2!10))) key1!37)))))

(assert (=> d!163857 (isStrictlySorted!1001 (insertStrictlySorted!587 (t!51636 l!750) key2!21 v2!10))))

(assert (=> d!163857 (= (insertStrictlySorted!587 (insertStrictlySorted!587 (t!51636 l!750) key2!21 v2!10) key1!37 v1!32) lt!673294)))

(declare-fun bm!72053 () Bool)

(assert (=> bm!72053 (= call!72055 call!72054)))

(assert (= (and d!163857 c!144690) b!1569219))

(assert (= (and d!163857 (not c!144690)) b!1569216))

(assert (= (and b!1569216 c!144689) b!1569220))

(assert (= (and b!1569216 (not c!144689)) b!1569215))

(assert (= (and b!1569215 c!144688) b!1569217))

(assert (= (and b!1569215 (not c!144688)) b!1569214))

(assert (= (or b!1569217 b!1569214) bm!72051))

(assert (= (or b!1569220 bm!72051) bm!72053))

(assert (= (or b!1569219 bm!72053) bm!72052))

(assert (= (and bm!72052 c!144687) b!1569223))

(assert (= (and bm!72052 (not c!144687)) b!1569221))

(assert (= (and d!163857 res!1072522) b!1569218))

(assert (= (and b!1569218 res!1072523) b!1569222))

(declare-fun m!1443691 () Bool)

(assert (=> b!1569223 m!1443691))

(declare-fun m!1443693 () Bool)

(assert (=> bm!72052 m!1443693))

(declare-fun m!1443695 () Bool)

(assert (=> b!1569218 m!1443695))

(declare-fun m!1443697 () Bool)

(assert (=> d!163857 m!1443697))

(assert (=> d!163857 m!1443515))

(declare-fun m!1443699 () Bool)

(assert (=> d!163857 m!1443699))

(declare-fun m!1443701 () Bool)

(assert (=> b!1569222 m!1443701))

(assert (=> b!1568987 d!163857))

(declare-fun b!1569224 () Bool)

(declare-fun e!874775 () List!36728)

(declare-fun call!72059 () List!36728)

(assert (=> b!1569224 (= e!874775 call!72059)))

(declare-fun b!1569225 () Bool)

(declare-fun c!144692 () Bool)

(assert (=> b!1569225 (= c!144692 (and (is-Cons!36724 (t!51636 l!750)) (bvsgt (_1!12670 (h!38171 (t!51636 l!750))) key1!37)))))

(declare-fun e!874772 () List!36728)

(assert (=> b!1569225 (= e!874772 e!874775)))

(declare-fun b!1569226 () Bool)

(declare-fun e!874773 () List!36728)

(assert (=> b!1569226 (= e!874773 e!874772)))

(declare-fun c!144693 () Bool)

(assert (=> b!1569226 (= c!144693 (and (is-Cons!36724 (t!51636 l!750)) (= (_1!12670 (h!38171 (t!51636 l!750))) key1!37)))))

(declare-fun b!1569227 () Bool)

(assert (=> b!1569227 (= e!874775 call!72059)))

(declare-fun bm!72054 () Bool)

(declare-fun call!72058 () List!36728)

(assert (=> bm!72054 (= call!72059 call!72058)))

(declare-fun b!1569228 () Bool)

(declare-fun res!1072525 () Bool)

(declare-fun e!874774 () Bool)

(assert (=> b!1569228 (=> (not res!1072525) (not e!874774))))

(declare-fun lt!673295 () List!36728)

(assert (=> b!1569228 (= res!1072525 (containsKey!861 lt!673295 key1!37))))

(declare-fun b!1569229 () Bool)

(declare-fun call!72057 () List!36728)

(assert (=> b!1569229 (= e!874773 call!72057)))

(declare-fun b!1569230 () Bool)

(assert (=> b!1569230 (= e!874772 call!72058)))

(declare-fun c!144694 () Bool)

(declare-fun e!874776 () List!36728)

(declare-fun bm!72055 () Bool)

(assert (=> bm!72055 (= call!72057 ($colon$colon!992 e!874776 (ite c!144694 (h!38171 (t!51636 l!750)) (tuple2!25319 key1!37 v1!32))))))

(declare-fun c!144691 () Bool)

(assert (=> bm!72055 (= c!144691 c!144694)))

(declare-fun b!1569231 () Bool)

(assert (=> b!1569231 (= e!874776 (ite c!144693 (t!51636 (t!51636 l!750)) (ite c!144692 (Cons!36724 (h!38171 (t!51636 l!750)) (t!51636 (t!51636 l!750))) Nil!36725)))))

(declare-fun b!1569232 () Bool)

(assert (=> b!1569232 (= e!874774 (contains!10419 lt!673295 (tuple2!25319 key1!37 v1!32)))))

(declare-fun b!1569233 () Bool)

(assert (=> b!1569233 (= e!874776 (insertStrictlySorted!587 (t!51636 (t!51636 l!750)) key1!37 v1!32))))

(declare-fun d!163861 () Bool)

(assert (=> d!163861 e!874774))

(declare-fun res!1072524 () Bool)

(assert (=> d!163861 (=> (not res!1072524) (not e!874774))))

(assert (=> d!163861 (= res!1072524 (isStrictlySorted!1001 lt!673295))))

(assert (=> d!163861 (= lt!673295 e!874773)))

(assert (=> d!163861 (= c!144694 (and (is-Cons!36724 (t!51636 l!750)) (bvslt (_1!12670 (h!38171 (t!51636 l!750))) key1!37)))))

(assert (=> d!163861 (isStrictlySorted!1001 (t!51636 l!750))))

(assert (=> d!163861 (= (insertStrictlySorted!587 (t!51636 l!750) key1!37 v1!32) lt!673295)))

(declare-fun bm!72056 () Bool)

(assert (=> bm!72056 (= call!72058 call!72057)))

(assert (= (and d!163861 c!144694) b!1569229))

(assert (= (and d!163861 (not c!144694)) b!1569226))

(assert (= (and b!1569226 c!144693) b!1569230))

(assert (= (and b!1569226 (not c!144693)) b!1569225))

(assert (= (and b!1569225 c!144692) b!1569227))

(assert (= (and b!1569225 (not c!144692)) b!1569224))

(assert (= (or b!1569227 b!1569224) bm!72054))

(assert (= (or b!1569230 bm!72054) bm!72056))

(assert (= (or b!1569229 bm!72056) bm!72055))

(assert (= (and bm!72055 c!144691) b!1569233))

(assert (= (and bm!72055 (not c!144691)) b!1569231))

(assert (= (and d!163861 res!1072524) b!1569228))

(assert (= (and b!1569228 res!1072525) b!1569232))

(declare-fun m!1443703 () Bool)

(assert (=> b!1569233 m!1443703))

(declare-fun m!1443705 () Bool)

(assert (=> bm!72055 m!1443705))

(declare-fun m!1443707 () Bool)

(assert (=> b!1569228 m!1443707))

(declare-fun m!1443709 () Bool)

(assert (=> d!163861 m!1443709))

(assert (=> d!163861 m!1443513))

(declare-fun m!1443711 () Bool)

(assert (=> b!1569232 m!1443711))

(assert (=> b!1568987 d!163861))

(declare-fun b!1569242 () Bool)

(declare-fun e!874783 () Bool)

(declare-fun tp!114087 () Bool)

(assert (=> b!1569242 (= e!874783 (and tp_is_empty!39043 tp!114087))))

(assert (=> b!1568988 (= tp!114075 e!874783)))

(assert (= (and b!1568988 (is-Cons!36724 (t!51636 l!750))) b!1569242))

(push 1)

