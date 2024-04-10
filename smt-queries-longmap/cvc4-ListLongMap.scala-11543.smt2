; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134364 () Bool)

(assert start!134364)

(declare-fun b!1569014 () Bool)

(declare-fun res!1072466 () Bool)

(declare-fun e!874657 () Bool)

(assert (=> b!1569014 (=> (not res!1072466) (not e!874657))))

(declare-datatypes ((B!2496 0))(
  ( (B!2497 (val!19610 Int)) )
))
(declare-datatypes ((tuple2!25322 0))(
  ( (tuple2!25323 (_1!12672 (_ BitVec 64)) (_2!12672 B!2496)) )
))
(declare-datatypes ((List!36730 0))(
  ( (Nil!36727) (Cons!36726 (h!38173 tuple2!25322) (t!51638 List!36730)) )
))
(declare-fun l!750 () List!36730)

(declare-fun isStrictlySorted!1003 (List!36730) Bool)

(assert (=> b!1569014 (= res!1072466 (isStrictlySorted!1003 (t!51638 l!750)))))

(declare-fun b!1569015 () Bool)

(declare-fun res!1072464 () Bool)

(assert (=> b!1569015 (=> (not res!1072464) (not e!874657))))

(assert (=> b!1569015 (= res!1072464 (isStrictlySorted!1003 l!750))))

(declare-fun v2!10 () B!2496)

(declare-fun b!1569016 () Bool)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun insertStrictlySorted!589 (List!36730 (_ BitVec 64) B!2496) List!36730)

(assert (=> b!1569016 (= e!874657 (not (isStrictlySorted!1003 (insertStrictlySorted!589 l!750 key2!21 v2!10))))))

(declare-fun v1!32 () B!2496)

(declare-fun key1!37 () (_ BitVec 64))

(assert (=> b!1569016 (= (insertStrictlySorted!589 (insertStrictlySorted!589 (t!51638 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!589 (insertStrictlySorted!589 (t!51638 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-datatypes ((Unit!52094 0))(
  ( (Unit!52095) )
))
(declare-fun lt!673267 () Unit!52094)

(declare-fun lemmaInsertStrictlySortedCommutative!15 (List!36730 (_ BitVec 64) B!2496 (_ BitVec 64) B!2496) Unit!52094)

(assert (=> b!1569016 (= lt!673267 (lemmaInsertStrictlySortedCommutative!15 (t!51638 l!750) key1!37 v1!32 key2!21 v2!10))))

(declare-fun b!1569017 () Bool)

(declare-fun res!1072465 () Bool)

(assert (=> b!1569017 (=> (not res!1072465) (not e!874657))))

(assert (=> b!1569017 (= res!1072465 (and (is-Cons!36726 l!750) (bvslt (_1!12672 (h!38173 l!750)) key1!37) (bvslt (_1!12672 (h!38173 l!750)) key2!21)))))

(declare-fun b!1569018 () Bool)

(declare-fun e!874658 () Bool)

(declare-fun tp_is_empty!39047 () Bool)

(declare-fun tp!114081 () Bool)

(assert (=> b!1569018 (= e!874658 (and tp_is_empty!39047 tp!114081))))

(declare-fun res!1072467 () Bool)

(assert (=> start!134364 (=> (not res!1072467) (not e!874657))))

(assert (=> start!134364 (= res!1072467 (not (= key1!37 key2!21)))))

(assert (=> start!134364 e!874657))

(assert (=> start!134364 tp_is_empty!39047))

(assert (=> start!134364 e!874658))

(assert (=> start!134364 true))

(assert (= (and start!134364 res!1072467) b!1569015))

(assert (= (and b!1569015 res!1072464) b!1569017))

(assert (= (and b!1569017 res!1072465) b!1569014))

(assert (= (and b!1569014 res!1072466) b!1569016))

(assert (= (and start!134364 (is-Cons!36726 l!750)) b!1569018))

(declare-fun m!1443547 () Bool)

(assert (=> b!1569014 m!1443547))

(declare-fun m!1443549 () Bool)

(assert (=> b!1569015 m!1443549))

(declare-fun m!1443551 () Bool)

(assert (=> b!1569016 m!1443551))

(declare-fun m!1443553 () Bool)

(assert (=> b!1569016 m!1443553))

(declare-fun m!1443555 () Bool)

(assert (=> b!1569016 m!1443555))

(assert (=> b!1569016 m!1443553))

(declare-fun m!1443557 () Bool)

(assert (=> b!1569016 m!1443557))

(declare-fun m!1443559 () Bool)

(assert (=> b!1569016 m!1443559))

(declare-fun m!1443561 () Bool)

(assert (=> b!1569016 m!1443561))

(assert (=> b!1569016 m!1443559))

(assert (=> b!1569016 m!1443551))

(declare-fun m!1443563 () Bool)

(assert (=> b!1569016 m!1443563))

(push 1)

(assert (not b!1569014))

(assert (not b!1569016))

(assert (not b!1569015))

(assert (not b!1569018))

(assert tp_is_empty!39047)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163827 () Bool)

(assert (=> d!163827 (= (insertStrictlySorted!589 (insertStrictlySorted!589 (t!51638 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!589 (insertStrictlySorted!589 (t!51638 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-fun lt!673276 () Unit!52094)

(declare-fun choose!2082 (List!36730 (_ BitVec 64) B!2496 (_ BitVec 64) B!2496) Unit!52094)

(assert (=> d!163827 (= lt!673276 (choose!2082 (t!51638 l!750) key1!37 v1!32 key2!21 v2!10))))

(assert (=> d!163827 (not (= key1!37 key2!21))))

(assert (=> d!163827 (= (lemmaInsertStrictlySortedCommutative!15 (t!51638 l!750) key1!37 v1!32 key2!21 v2!10) lt!673276)))

(declare-fun bs!45198 () Bool)

(assert (= bs!45198 d!163827))

(assert (=> bs!45198 m!1443551))

(assert (=> bs!45198 m!1443551))

(assert (=> bs!45198 m!1443563))

(assert (=> bs!45198 m!1443553))

(assert (=> bs!45198 m!1443553))

(assert (=> bs!45198 m!1443555))

(declare-fun m!1443571 () Bool)

(assert (=> bs!45198 m!1443571))

(assert (=> b!1569016 d!163827))

(declare-fun b!1569153 () Bool)

(declare-fun c!144669 () Bool)

(assert (=> b!1569153 (= c!144669 (and (is-Cons!36726 l!750) (bvsgt (_1!12672 (h!38173 l!750)) key2!21)))))

(declare-fun e!874736 () List!36730)

(declare-fun e!874733 () List!36730)

(assert (=> b!1569153 (= e!874736 e!874733)))

(declare-fun b!1569154 () Bool)

(declare-fun e!874737 () List!36730)

(assert (=> b!1569154 (= e!874737 e!874736)))

(declare-fun c!144670 () Bool)

(assert (=> b!1569154 (= c!144670 (and (is-Cons!36726 l!750) (= (_1!12672 (h!38173 l!750)) key2!21)))))

(declare-fun b!1569155 () Bool)

(declare-fun call!72039 () List!36730)

(assert (=> b!1569155 (= e!874736 call!72039)))

(declare-fun b!1569156 () Bool)

(declare-fun e!874734 () List!36730)

(assert (=> b!1569156 (= e!874734 (ite c!144670 (t!51638 l!750) (ite c!144669 (Cons!36726 (h!38173 l!750) (t!51638 l!750)) Nil!36727)))))

(declare-fun bm!72036 () Bool)

(declare-fun call!72041 () List!36730)

(assert (=> bm!72036 (= call!72039 call!72041)))

(declare-fun bm!72037 () Bool)

(declare-fun call!72040 () List!36730)

(assert (=> bm!72037 (= call!72040 call!72039)))

(declare-fun d!163831 () Bool)

(declare-fun e!874735 () Bool)

(assert (=> d!163831 e!874735))

(declare-fun res!1072506 () Bool)

(assert (=> d!163831 (=> (not res!1072506) (not e!874735))))

(declare-fun lt!673289 () List!36730)

(assert (=> d!163831 (= res!1072506 (isStrictlySorted!1003 lt!673289))))

(assert (=> d!163831 (= lt!673289 e!874737)))

(declare-fun c!144667 () Bool)

(assert (=> d!163831 (= c!144667 (and (is-Cons!36726 l!750) (bvslt (_1!12672 (h!38173 l!750)) key2!21)))))

(assert (=> d!163831 (isStrictlySorted!1003 l!750)))

(assert (=> d!163831 (= (insertStrictlySorted!589 l!750 key2!21 v2!10) lt!673289)))

(declare-fun b!1569157 () Bool)

(assert (=> b!1569157 (= e!874733 call!72040)))

(declare-fun b!1569158 () Bool)

(declare-fun contains!10420 (List!36730 tuple2!25322) Bool)

(assert (=> b!1569158 (= e!874735 (contains!10420 lt!673289 (tuple2!25323 key2!21 v2!10)))))

(declare-fun b!1569159 () Bool)

(assert (=> b!1569159 (= e!874734 (insertStrictlySorted!589 (t!51638 l!750) key2!21 v2!10))))

(declare-fun bm!72038 () Bool)

(declare-fun $colon$colon!993 (List!36730 tuple2!25322) List!36730)

(assert (=> bm!72038 (= call!72041 ($colon$colon!993 e!874734 (ite c!144667 (h!38173 l!750) (tuple2!25323 key2!21 v2!10))))))

(declare-fun c!144668 () Bool)

(assert (=> bm!72038 (= c!144668 c!144667)))

(declare-fun b!1569160 () Bool)

(declare-fun res!1072507 () Bool)

(assert (=> b!1569160 (=> (not res!1072507) (not e!874735))))

(declare-fun containsKey!862 (List!36730 (_ BitVec 64)) Bool)

(assert (=> b!1569160 (= res!1072507 (containsKey!862 lt!673289 key2!21))))

(declare-fun b!1569161 () Bool)

(assert (=> b!1569161 (= e!874737 call!72041)))

(declare-fun b!1569162 () Bool)

(assert (=> b!1569162 (= e!874733 call!72040)))

(assert (= (and d!163831 c!144667) b!1569161))

(assert (= (and d!163831 (not c!144667)) b!1569154))

(assert (= (and b!1569154 c!144670) b!1569155))

(assert (= (and b!1569154 (not c!144670)) b!1569153))

(assert (= (and b!1569153 c!144669) b!1569162))

(assert (= (and b!1569153 (not c!144669)) b!1569157))

(assert (= (or b!1569162 b!1569157) bm!72037))

(assert (= (or b!1569155 bm!72037) bm!72036))

(assert (= (or b!1569161 bm!72036) bm!72038))

(assert (= (and bm!72038 c!144668) b!1569159))

(assert (= (and bm!72038 (not c!144668)) b!1569156))

(assert (= (and d!163831 res!1072506) b!1569160))

(assert (= (and b!1569160 res!1072507) b!1569158))

(declare-fun m!1443635 () Bool)

(assert (=> bm!72038 m!1443635))

(declare-fun m!1443637 () Bool)

(assert (=> b!1569160 m!1443637))

(assert (=> b!1569159 m!1443551))

(declare-fun m!1443639 () Bool)

(assert (=> d!163831 m!1443639))

(assert (=> d!163831 m!1443549))

(declare-fun m!1443641 () Bool)

(assert (=> b!1569158 m!1443641))

(assert (=> b!1569016 d!163831))

(declare-fun b!1569177 () Bool)

(declare-fun c!144677 () Bool)

(assert (=> b!1569177 (= c!144677 (and (is-Cons!36726 (insertStrictlySorted!589 (t!51638 l!750) key1!37 v1!32)) (bvsgt (_1!12672 (h!38173 (insertStrictlySorted!589 (t!51638 l!750) key1!37 v1!32))) key2!21)))))

(declare-fun e!874749 () List!36730)

(declare-fun e!874745 () List!36730)

(assert (=> b!1569177 (= e!874749 e!874745)))

(declare-fun b!1569178 () Bool)

(declare-fun e!874751 () List!36730)

(assert (=> b!1569178 (= e!874751 e!874749)))

(declare-fun c!144678 () Bool)

(assert (=> b!1569178 (= c!144678 (and (is-Cons!36726 (insertStrictlySorted!589 (t!51638 l!750) key1!37 v1!32)) (= (_1!12672 (h!38173 (insertStrictlySorted!589 (t!51638 l!750) key1!37 v1!32))) key2!21)))))

(declare-fun b!1569179 () Bool)

(declare-fun call!72045 () List!36730)

(assert (=> b!1569179 (= e!874749 call!72045)))

(declare-fun e!874746 () List!36730)

(declare-fun b!1569180 () Bool)

(assert (=> b!1569180 (= e!874746 (ite c!144678 (t!51638 (insertStrictlySorted!589 (t!51638 l!750) key1!37 v1!32)) (ite c!144677 (Cons!36726 (h!38173 (insertStrictlySorted!589 (t!51638 l!750) key1!37 v1!32)) (t!51638 (insertStrictlySorted!589 (t!51638 l!750) key1!37 v1!32))) Nil!36727)))))

(declare-fun bm!72042 () Bool)

(declare-fun call!72047 () List!36730)

(assert (=> bm!72042 (= call!72045 call!72047)))

(declare-fun bm!72043 () Bool)

(declare-fun call!72046 () List!36730)

(assert (=> bm!72043 (= call!72046 call!72045)))

(declare-fun d!163847 () Bool)

(declare-fun e!874747 () Bool)

(assert (=> d!163847 e!874747))

(declare-fun res!1072512 () Bool)

(assert (=> d!163847 (=> (not res!1072512) (not e!874747))))

(declare-fun lt!673291 () List!36730)

(assert (=> d!163847 (= res!1072512 (isStrictlySorted!1003 lt!673291))))

(assert (=> d!163847 (= lt!673291 e!874751)))

(declare-fun c!144675 () Bool)

(assert (=> d!163847 (= c!144675 (and (is-Cons!36726 (insertStrictlySorted!589 (t!51638 l!750) key1!37 v1!32)) (bvslt (_1!12672 (h!38173 (insertStrictlySorted!589 (t!51638 l!750) key1!37 v1!32))) key2!21)))))

(assert (=> d!163847 (isStrictlySorted!1003 (insertStrictlySorted!589 (t!51638 l!750) key1!37 v1!32))))

(assert (=> d!163847 (= (insertStrictlySorted!589 (insertStrictlySorted!589 (t!51638 l!750) key1!37 v1!32) key2!21 v2!10) lt!673291)))

(declare-fun b!1569181 () Bool)

(assert (=> b!1569181 (= e!874745 call!72046)))

(declare-fun b!1569182 () Bool)

(assert (=> b!1569182 (= e!874747 (contains!10420 lt!673291 (tuple2!25323 key2!21 v2!10)))))

(declare-fun b!1569183 () Bool)

(assert (=> b!1569183 (= e!874746 (insertStrictlySorted!589 (t!51638 (insertStrictlySorted!589 (t!51638 l!750) key1!37 v1!32)) key2!21 v2!10))))

(declare-fun bm!72044 () Bool)

(assert (=> bm!72044 (= call!72047 ($colon$colon!993 e!874746 (ite c!144675 (h!38173 (insertStrictlySorted!589 (t!51638 l!750) key1!37 v1!32)) (tuple2!25323 key2!21 v2!10))))))

(declare-fun c!144676 () Bool)

(assert (=> bm!72044 (= c!144676 c!144675)))

(declare-fun b!1569184 () Bool)

(declare-fun res!1072513 () Bool)

(assert (=> b!1569184 (=> (not res!1072513) (not e!874747))))

(assert (=> b!1569184 (= res!1072513 (containsKey!862 lt!673291 key2!21))))

(declare-fun b!1569185 () Bool)

(assert (=> b!1569185 (= e!874751 call!72047)))

(declare-fun b!1569186 () Bool)

(assert (=> b!1569186 (= e!874745 call!72046)))

(assert (= (and d!163847 c!144675) b!1569185))

(assert (= (and d!163847 (not c!144675)) b!1569178))

(assert (= (and b!1569178 c!144678) b!1569179))

(assert (= (and b!1569178 (not c!144678)) b!1569177))

(assert (= (and b!1569177 c!144677) b!1569186))

(assert (= (and b!1569177 (not c!144677)) b!1569181))

(assert (= (or b!1569186 b!1569181) bm!72043))

(assert (= (or b!1569179 bm!72043) bm!72042))

(assert (= (or b!1569185 bm!72042) bm!72044))

(assert (= (and bm!72044 c!144676) b!1569183))

(assert (= (and bm!72044 (not c!144676)) b!1569180))

(assert (= (and d!163847 res!1072512) b!1569184))

(assert (= (and b!1569184 res!1072513) b!1569182))

(declare-fun m!1443657 () Bool)

(assert (=> bm!72044 m!1443657))

(declare-fun m!1443659 () Bool)

(assert (=> b!1569184 m!1443659))

(declare-fun m!1443661 () Bool)

(assert (=> b!1569183 m!1443661))

(declare-fun m!1443663 () Bool)

(assert (=> d!163847 m!1443663))

(assert (=> d!163847 m!1443553))

(declare-fun m!1443665 () Bool)

(assert (=> d!163847 m!1443665))

(declare-fun m!1443667 () Bool)

(assert (=> b!1569182 m!1443667))

(assert (=> b!1569016 d!163847))

(declare-fun b!1569202 () Bool)

(declare-fun c!144685 () Bool)

(assert (=> b!1569202 (= c!144685 (and (is-Cons!36726 (t!51638 l!750)) (bvsgt (_1!12672 (h!38173 (t!51638 l!750))) key2!21)))))

(declare-fun e!874763 () List!36730)

(declare-fun e!874760 () List!36730)

(assert (=> b!1569202 (= e!874763 e!874760)))

(declare-fun b!1569203 () Bool)

(declare-fun e!874764 () List!36730)

(assert (=> b!1569203 (= e!874764 e!874763)))

(declare-fun c!144686 () Bool)

(assert (=> b!1569203 (= c!144686 (and (is-Cons!36726 (t!51638 l!750)) (= (_1!12672 (h!38173 (t!51638 l!750))) key2!21)))))

(declare-fun b!1569204 () Bool)

(declare-fun call!72051 () List!36730)

(assert (=> b!1569204 (= e!874763 call!72051)))

(declare-fun b!1569205 () Bool)

(declare-fun e!874761 () List!36730)

(assert (=> b!1569205 (= e!874761 (ite c!144686 (t!51638 (t!51638 l!750)) (ite c!144685 (Cons!36726 (h!38173 (t!51638 l!750)) (t!51638 (t!51638 l!750))) Nil!36727)))))

(declare-fun bm!72048 () Bool)

(declare-fun call!72053 () List!36730)

(assert (=> bm!72048 (= call!72051 call!72053)))

(declare-fun bm!72049 () Bool)

(declare-fun call!72052 () List!36730)

(assert (=> bm!72049 (= call!72052 call!72051)))

(declare-fun d!163853 () Bool)

(declare-fun e!874762 () Bool)

(assert (=> d!163853 e!874762))

(declare-fun res!1072518 () Bool)

(assert (=> d!163853 (=> (not res!1072518) (not e!874762))))

(declare-fun lt!673293 () List!36730)

(assert (=> d!163853 (= res!1072518 (isStrictlySorted!1003 lt!673293))))

(assert (=> d!163853 (= lt!673293 e!874764)))

(declare-fun c!144683 () Bool)

(assert (=> d!163853 (= c!144683 (and (is-Cons!36726 (t!51638 l!750)) (bvslt (_1!12672 (h!38173 (t!51638 l!750))) key2!21)))))

(assert (=> d!163853 (isStrictlySorted!1003 (t!51638 l!750))))

(assert (=> d!163853 (= (insertStrictlySorted!589 (t!51638 l!750) key2!21 v2!10) lt!673293)))

(declare-fun b!1569206 () Bool)

(assert (=> b!1569206 (= e!874760 call!72052)))

(declare-fun b!1569207 () Bool)

(assert (=> b!1569207 (= e!874762 (contains!10420 lt!673293 (tuple2!25323 key2!21 v2!10)))))

(declare-fun b!1569208 () Bool)

(assert (=> b!1569208 (= e!874761 (insertStrictlySorted!589 (t!51638 (t!51638 l!750)) key2!21 v2!10))))

(declare-fun bm!72050 () Bool)

(assert (=> bm!72050 (= call!72053 ($colon$colon!993 e!874761 (ite c!144683 (h!38173 (t!51638 l!750)) (tuple2!25323 key2!21 v2!10))))))

(declare-fun c!144684 () Bool)

(assert (=> bm!72050 (= c!144684 c!144683)))

(declare-fun b!1569209 () Bool)

(declare-fun res!1072519 () Bool)

(assert (=> b!1569209 (=> (not res!1072519) (not e!874762))))

(assert (=> b!1569209 (= res!1072519 (containsKey!862 lt!673293 key2!21))))

(declare-fun b!1569210 () Bool)

(assert (=> b!1569210 (= e!874764 call!72053)))

(declare-fun b!1569211 () Bool)

(assert (=> b!1569211 (= e!874760 call!72052)))

(assert (= (and d!163853 c!144683) b!1569210))

(assert (= (and d!163853 (not c!144683)) b!1569203))

(assert (= (and b!1569203 c!144686) b!1569204))

(assert (= (and b!1569203 (not c!144686)) b!1569202))

(assert (= (and b!1569202 c!144685) b!1569211))

(assert (= (and b!1569202 (not c!144685)) b!1569206))

(assert (= (or b!1569211 b!1569206) bm!72049))

(assert (= (or b!1569204 bm!72049) bm!72048))

(assert (= (or b!1569210 bm!72048) bm!72050))

(assert (= (and bm!72050 c!144684) b!1569208))

(assert (= (and bm!72050 (not c!144684)) b!1569205))

(assert (= (and d!163853 res!1072518) b!1569209))

(assert (= (and b!1569209 res!1072519) b!1569207))

(declare-fun m!1443681 () Bool)

(assert (=> bm!72050 m!1443681))

(declare-fun m!1443683 () Bool)

(assert (=> b!1569209 m!1443683))

(declare-fun m!1443685 () Bool)

(assert (=> b!1569208 m!1443685))

(declare-fun m!1443687 () Bool)

(assert (=> d!163853 m!1443687))

(assert (=> d!163853 m!1443547))

(declare-fun m!1443689 () Bool)

(assert (=> b!1569207 m!1443689))

(assert (=> b!1569016 d!163853))

(declare-fun d!163859 () Bool)

(declare-fun res!1072530 () Bool)

(declare-fun e!874784 () Bool)

(assert (=> d!163859 (=> res!1072530 e!874784)))

(assert (=> d!163859 (= res!1072530 (or (is-Nil!36727 (insertStrictlySorted!589 l!750 key2!21 v2!10)) (is-Nil!36727 (t!51638 (insertStrictlySorted!589 l!750 key2!21 v2!10)))))))

(assert (=> d!163859 (= (isStrictlySorted!1003 (insertStrictlySorted!589 l!750 key2!21 v2!10)) e!874784)))

(declare-fun b!1569243 () Bool)

(declare-fun e!874785 () Bool)

(assert (=> b!1569243 (= e!874784 e!874785)))

(declare-fun res!1072531 () Bool)

(assert (=> b!1569243 (=> (not res!1072531) (not e!874785))))

(assert (=> b!1569243 (= res!1072531 (bvslt (_1!12672 (h!38173 (insertStrictlySorted!589 l!750 key2!21 v2!10))) (_1!12672 (h!38173 (t!51638 (insertStrictlySorted!589 l!750 key2!21 v2!10))))))))

(declare-fun b!1569244 () Bool)

(assert (=> b!1569244 (= e!874785 (isStrictlySorted!1003 (t!51638 (insertStrictlySorted!589 l!750 key2!21 v2!10))))))

(assert (= (and d!163859 (not res!1072530)) b!1569243))

(assert (= (and b!1569243 res!1072531) b!1569244))

(declare-fun m!1443713 () Bool)

(assert (=> b!1569244 m!1443713))

(assert (=> b!1569016 d!163859))

(declare-fun b!1569245 () Bool)

(declare-fun c!144697 () Bool)

(assert (=> b!1569245 (= c!144697 (and (is-Cons!36726 (insertStrictlySorted!589 (t!51638 l!750) key2!21 v2!10)) (bvsgt (_1!12672 (h!38173 (insertStrictlySorted!589 (t!51638 l!750) key2!21 v2!10))) key1!37)))))

(declare-fun e!874789 () List!36730)

(declare-fun e!874786 () List!36730)

(assert (=> b!1569245 (= e!874789 e!874786)))

(declare-fun b!1569246 () Bool)

(declare-fun e!874790 () List!36730)

(assert (=> b!1569246 (= e!874790 e!874789)))

(declare-fun c!144698 () Bool)

(assert (=> b!1569246 (= c!144698 (and (is-Cons!36726 (insertStrictlySorted!589 (t!51638 l!750) key2!21 v2!10)) (= (_1!12672 (h!38173 (insertStrictlySorted!589 (t!51638 l!750) key2!21 v2!10))) key1!37)))))

(declare-fun b!1569247 () Bool)

(declare-fun call!72060 () List!36730)

(assert (=> b!1569247 (= e!874789 call!72060)))

(declare-fun b!1569248 () Bool)

(declare-fun e!874787 () List!36730)

(assert (=> b!1569248 (= e!874787 (ite c!144698 (t!51638 (insertStrictlySorted!589 (t!51638 l!750) key2!21 v2!10)) (ite c!144697 (Cons!36726 (h!38173 (insertStrictlySorted!589 (t!51638 l!750) key2!21 v2!10)) (t!51638 (insertStrictlySorted!589 (t!51638 l!750) key2!21 v2!10))) Nil!36727)))))

(declare-fun bm!72057 () Bool)

(declare-fun call!72062 () List!36730)

(assert (=> bm!72057 (= call!72060 call!72062)))

(declare-fun bm!72058 () Bool)

(declare-fun call!72061 () List!36730)

(assert (=> bm!72058 (= call!72061 call!72060)))

(declare-fun d!163863 () Bool)

(declare-fun e!874788 () Bool)

(assert (=> d!163863 e!874788))

(declare-fun res!1072532 () Bool)

(assert (=> d!163863 (=> (not res!1072532) (not e!874788))))

(declare-fun lt!673296 () List!36730)

(assert (=> d!163863 (= res!1072532 (isStrictlySorted!1003 lt!673296))))

(assert (=> d!163863 (= lt!673296 e!874790)))

(declare-fun c!144695 () Bool)

(assert (=> d!163863 (= c!144695 (and (is-Cons!36726 (insertStrictlySorted!589 (t!51638 l!750) key2!21 v2!10)) (bvslt (_1!12672 (h!38173 (insertStrictlySorted!589 (t!51638 l!750) key2!21 v2!10))) key1!37)))))

(assert (=> d!163863 (isStrictlySorted!1003 (insertStrictlySorted!589 (t!51638 l!750) key2!21 v2!10))))

(assert (=> d!163863 (= (insertStrictlySorted!589 (insertStrictlySorted!589 (t!51638 l!750) key2!21 v2!10) key1!37 v1!32) lt!673296)))

(declare-fun b!1569249 () Bool)

(assert (=> b!1569249 (= e!874786 call!72061)))

(declare-fun b!1569250 () Bool)

(assert (=> b!1569250 (= e!874788 (contains!10420 lt!673296 (tuple2!25323 key1!37 v1!32)))))

(declare-fun b!1569251 () Bool)

(assert (=> b!1569251 (= e!874787 (insertStrictlySorted!589 (t!51638 (insertStrictlySorted!589 (t!51638 l!750) key2!21 v2!10)) key1!37 v1!32))))

(declare-fun bm!72059 () Bool)

(assert (=> bm!72059 (= call!72062 ($colon$colon!993 e!874787 (ite c!144695 (h!38173 (insertStrictlySorted!589 (t!51638 l!750) key2!21 v2!10)) (tuple2!25323 key1!37 v1!32))))))

(declare-fun c!144696 () Bool)

(assert (=> bm!72059 (= c!144696 c!144695)))

(declare-fun b!1569252 () Bool)

(declare-fun res!1072533 () Bool)

(assert (=> b!1569252 (=> (not res!1072533) (not e!874788))))

(assert (=> b!1569252 (= res!1072533 (containsKey!862 lt!673296 key1!37))))

(declare-fun b!1569253 () Bool)

(assert (=> b!1569253 (= e!874790 call!72062)))

(declare-fun b!1569254 () Bool)

(assert (=> b!1569254 (= e!874786 call!72061)))

(assert (= (and d!163863 c!144695) b!1569253))

(assert (= (and d!163863 (not c!144695)) b!1569246))

(assert (= (and b!1569246 c!144698) b!1569247))

(assert (= (and b!1569246 (not c!144698)) b!1569245))

(assert (= (and b!1569245 c!144697) b!1569254))

(assert (= (and b!1569245 (not c!144697)) b!1569249))

(assert (= (or b!1569254 b!1569249) bm!72058))

(assert (= (or b!1569247 bm!72058) bm!72057))

(assert (= (or b!1569253 bm!72057) bm!72059))

(assert (= (and bm!72059 c!144696) b!1569251))

(assert (= (and bm!72059 (not c!144696)) b!1569248))

(assert (= (and d!163863 res!1072532) b!1569252))

(assert (= (and b!1569252 res!1072533) b!1569250))

(declare-fun m!1443715 () Bool)

(assert (=> bm!72059 m!1443715))

(declare-fun m!1443717 () Bool)

(assert (=> b!1569252 m!1443717))

(declare-fun m!1443719 () Bool)

(assert (=> b!1569251 m!1443719))

(declare-fun m!1443721 () Bool)

(assert (=> d!163863 m!1443721))

(assert (=> d!163863 m!1443551))

(declare-fun m!1443723 () Bool)

(assert (=> d!163863 m!1443723))

(declare-fun m!1443725 () Bool)

(assert (=> b!1569250 m!1443725))

(assert (=> b!1569016 d!163863))

(declare-fun b!1569255 () Bool)

(declare-fun c!144701 () Bool)

(assert (=> b!1569255 (= c!144701 (and (is-Cons!36726 (t!51638 l!750)) (bvsgt (_1!12672 (h!38173 (t!51638 l!750))) key1!37)))))

(declare-fun e!874794 () List!36730)

(declare-fun e!874791 () List!36730)

(assert (=> b!1569255 (= e!874794 e!874791)))

(declare-fun b!1569256 () Bool)

(declare-fun e!874795 () List!36730)

(assert (=> b!1569256 (= e!874795 e!874794)))

(declare-fun c!144702 () Bool)

(assert (=> b!1569256 (= c!144702 (and (is-Cons!36726 (t!51638 l!750)) (= (_1!12672 (h!38173 (t!51638 l!750))) key1!37)))))

(declare-fun b!1569257 () Bool)

(declare-fun call!72063 () List!36730)

(assert (=> b!1569257 (= e!874794 call!72063)))

(declare-fun e!874792 () List!36730)

(declare-fun b!1569258 () Bool)

(assert (=> b!1569258 (= e!874792 (ite c!144702 (t!51638 (t!51638 l!750)) (ite c!144701 (Cons!36726 (h!38173 (t!51638 l!750)) (t!51638 (t!51638 l!750))) Nil!36727)))))

(declare-fun bm!72060 () Bool)

(declare-fun call!72065 () List!36730)

(assert (=> bm!72060 (= call!72063 call!72065)))

(declare-fun bm!72061 () Bool)

(declare-fun call!72064 () List!36730)

(assert (=> bm!72061 (= call!72064 call!72063)))

(declare-fun d!163865 () Bool)

(declare-fun e!874793 () Bool)

(assert (=> d!163865 e!874793))

(declare-fun res!1072534 () Bool)

(assert (=> d!163865 (=> (not res!1072534) (not e!874793))))

(declare-fun lt!673297 () List!36730)

(assert (=> d!163865 (= res!1072534 (isStrictlySorted!1003 lt!673297))))

(assert (=> d!163865 (= lt!673297 e!874795)))

(declare-fun c!144699 () Bool)

(assert (=> d!163865 (= c!144699 (and (is-Cons!36726 (t!51638 l!750)) (bvslt (_1!12672 (h!38173 (t!51638 l!750))) key1!37)))))

(assert (=> d!163865 (isStrictlySorted!1003 (t!51638 l!750))))

(assert (=> d!163865 (= (insertStrictlySorted!589 (t!51638 l!750) key1!37 v1!32) lt!673297)))

(declare-fun b!1569259 () Bool)

(assert (=> b!1569259 (= e!874791 call!72064)))

(declare-fun b!1569260 () Bool)

(assert (=> b!1569260 (= e!874793 (contains!10420 lt!673297 (tuple2!25323 key1!37 v1!32)))))

(declare-fun b!1569261 () Bool)

(assert (=> b!1569261 (= e!874792 (insertStrictlySorted!589 (t!51638 (t!51638 l!750)) key1!37 v1!32))))

(declare-fun bm!72062 () Bool)

(assert (=> bm!72062 (= call!72065 ($colon$colon!993 e!874792 (ite c!144699 (h!38173 (t!51638 l!750)) (tuple2!25323 key1!37 v1!32))))))

(declare-fun c!144700 () Bool)

(assert (=> bm!72062 (= c!144700 c!144699)))

(declare-fun b!1569262 () Bool)

(declare-fun res!1072535 () Bool)

(assert (=> b!1569262 (=> (not res!1072535) (not e!874793))))

(assert (=> b!1569262 (= res!1072535 (containsKey!862 lt!673297 key1!37))))

(declare-fun b!1569263 () Bool)

(assert (=> b!1569263 (= e!874795 call!72065)))

(declare-fun b!1569264 () Bool)

(assert (=> b!1569264 (= e!874791 call!72064)))

(assert (= (and d!163865 c!144699) b!1569263))

