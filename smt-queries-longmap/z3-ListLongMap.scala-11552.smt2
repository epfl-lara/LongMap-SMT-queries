; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134488 () Bool)

(assert start!134488)

(declare-fun b!1569917 () Bool)

(declare-fun res!1072848 () Bool)

(declare-fun e!875201 () Bool)

(assert (=> b!1569917 (=> (not res!1072848) (not e!875201))))

(declare-datatypes ((B!2548 0))(
  ( (B!2549 (val!19636 Int)) )
))
(declare-datatypes ((tuple2!25374 0))(
  ( (tuple2!25375 (_1!12698 (_ BitVec 64)) (_2!12698 B!2548)) )
))
(declare-datatypes ((List!36756 0))(
  ( (Nil!36753) (Cons!36752 (h!38199 tuple2!25374) (t!51664 List!36756)) )
))
(declare-fun l!750 () List!36756)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1569917 (= res!1072848 (and ((_ is Cons!36752) l!750) (bvslt (_1!12698 (h!38199 l!750)) key1!37) (bvslt (_1!12698 (h!38199 l!750)) key2!21)))))

(declare-fun res!1072845 () Bool)

(assert (=> start!134488 (=> (not res!1072845) (not e!875201))))

(assert (=> start!134488 (= res!1072845 (not (= key1!37 key2!21)))))

(assert (=> start!134488 e!875201))

(declare-fun tp_is_empty!39099 () Bool)

(assert (=> start!134488 tp_is_empty!39099))

(declare-fun e!875200 () Bool)

(assert (=> start!134488 e!875200))

(assert (=> start!134488 true))

(declare-fun b!1569918 () Bool)

(declare-fun res!1072846 () Bool)

(assert (=> b!1569918 (=> (not res!1072846) (not e!875201))))

(declare-fun isStrictlySorted!1020 (List!36756) Bool)

(assert (=> b!1569918 (= res!1072846 (isStrictlySorted!1020 l!750))))

(declare-fun b!1569919 () Bool)

(declare-fun res!1072847 () Bool)

(assert (=> b!1569919 (=> (not res!1072847) (not e!875201))))

(assert (=> b!1569919 (= res!1072847 (isStrictlySorted!1020 (t!51664 l!750)))))

(declare-fun v1!32 () B!2548)

(declare-fun v2!10 () B!2548)

(declare-fun b!1569920 () Bool)

(declare-fun insertStrictlySorted!597 (List!36756 (_ BitVec 64) B!2548) List!36756)

(assert (=> b!1569920 (= e!875201 (not (= (insertStrictlySorted!597 (insertStrictlySorted!597 l!750 key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!597 (insertStrictlySorted!597 l!750 key2!21 v2!10) key1!37 v1!32))))))

(assert (=> b!1569920 (= (insertStrictlySorted!597 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!597 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-datatypes ((Unit!52098 0))(
  ( (Unit!52099) )
))
(declare-fun lt!673342 () Unit!52098)

(declare-fun lemmaInsertStrictlySortedCommutative!17 (List!36756 (_ BitVec 64) B!2548 (_ BitVec 64) B!2548) Unit!52098)

(assert (=> b!1569920 (= lt!673342 (lemmaInsertStrictlySortedCommutative!17 (t!51664 l!750) key1!37 v1!32 key2!21 v2!10))))

(declare-fun b!1569921 () Bool)

(declare-fun tp!114213 () Bool)

(assert (=> b!1569921 (= e!875200 (and tp_is_empty!39099 tp!114213))))

(assert (= (and start!134488 res!1072845) b!1569918))

(assert (= (and b!1569918 res!1072846) b!1569917))

(assert (= (and b!1569917 res!1072848) b!1569919))

(assert (= (and b!1569919 res!1072847) b!1569920))

(assert (= (and start!134488 ((_ is Cons!36752) l!750)) b!1569921))

(declare-fun m!1443959 () Bool)

(assert (=> b!1569918 m!1443959))

(declare-fun m!1443961 () Bool)

(assert (=> b!1569919 m!1443961))

(declare-fun m!1443963 () Bool)

(assert (=> b!1569920 m!1443963))

(declare-fun m!1443965 () Bool)

(assert (=> b!1569920 m!1443965))

(declare-fun m!1443967 () Bool)

(assert (=> b!1569920 m!1443967))

(declare-fun m!1443969 () Bool)

(assert (=> b!1569920 m!1443969))

(declare-fun m!1443971 () Bool)

(assert (=> b!1569920 m!1443971))

(assert (=> b!1569920 m!1443965))

(declare-fun m!1443973 () Bool)

(assert (=> b!1569920 m!1443973))

(assert (=> b!1569920 m!1443969))

(declare-fun m!1443975 () Bool)

(assert (=> b!1569920 m!1443975))

(declare-fun m!1443977 () Bool)

(assert (=> b!1569920 m!1443977))

(assert (=> b!1569920 m!1443975))

(assert (=> b!1569920 m!1443963))

(declare-fun m!1443979 () Bool)

(assert (=> b!1569920 m!1443979))

(check-sat tp_is_empty!39099 (not b!1569918) (not b!1569921) (not b!1569919) (not b!1569920))
(check-sat)
(get-model)

(declare-fun b!1569995 () Bool)

(declare-fun res!1072871 () Bool)

(declare-fun e!875242 () Bool)

(assert (=> b!1569995 (=> (not res!1072871) (not e!875242))))

(declare-fun lt!673352 () List!36756)

(declare-fun containsKey!868 (List!36756 (_ BitVec 64)) Bool)

(assert (=> b!1569995 (= res!1072871 (containsKey!868 lt!673352 key1!37))))

(declare-fun c!144822 () Bool)

(declare-fun b!1569996 () Bool)

(assert (=> b!1569996 (= c!144822 (and ((_ is Cons!36752) (insertStrictlySorted!597 l!750 key2!21 v2!10)) (bvsgt (_1!12698 (h!38199 (insertStrictlySorted!597 l!750 key2!21 v2!10))) key1!37)))))

(declare-fun e!875240 () List!36756)

(declare-fun e!875243 () List!36756)

(assert (=> b!1569996 (= e!875240 e!875243)))

(declare-fun b!1569997 () Bool)

(declare-fun call!72140 () List!36756)

(assert (=> b!1569997 (= e!875243 call!72140)))

(declare-fun b!1569999 () Bool)

(declare-fun e!875244 () List!36756)

(declare-fun c!144823 () Bool)

(assert (=> b!1569999 (= e!875244 (ite c!144823 (t!51664 (insertStrictlySorted!597 l!750 key2!21 v2!10)) (ite c!144822 (Cons!36752 (h!38199 (insertStrictlySorted!597 l!750 key2!21 v2!10)) (t!51664 (insertStrictlySorted!597 l!750 key2!21 v2!10))) Nil!36753)))))

(declare-fun bm!72135 () Bool)

(declare-fun call!72138 () List!36756)

(declare-fun call!72139 () List!36756)

(assert (=> bm!72135 (= call!72138 call!72139)))

(declare-fun bm!72136 () Bool)

(assert (=> bm!72136 (= call!72140 call!72138)))

(declare-fun b!1570000 () Bool)

(declare-fun contains!10427 (List!36756 tuple2!25374) Bool)

(assert (=> b!1570000 (= e!875242 (contains!10427 lt!673352 (tuple2!25375 key1!37 v1!32)))))

(declare-fun b!1570001 () Bool)

(assert (=> b!1570001 (= e!875240 call!72138)))

(declare-fun b!1570002 () Bool)

(declare-fun e!875241 () List!36756)

(assert (=> b!1570002 (= e!875241 call!72139)))

(declare-fun bm!72137 () Bool)

(declare-fun c!144820 () Bool)

(declare-fun $colon$colon!999 (List!36756 tuple2!25374) List!36756)

(assert (=> bm!72137 (= call!72139 ($colon$colon!999 e!875244 (ite c!144820 (h!38199 (insertStrictlySorted!597 l!750 key2!21 v2!10)) (tuple2!25375 key1!37 v1!32))))))

(declare-fun c!144821 () Bool)

(assert (=> bm!72137 (= c!144821 c!144820)))

(declare-fun b!1570003 () Bool)

(assert (=> b!1570003 (= e!875244 (insertStrictlySorted!597 (t!51664 (insertStrictlySorted!597 l!750 key2!21 v2!10)) key1!37 v1!32))))

(declare-fun b!1570004 () Bool)

(assert (=> b!1570004 (= e!875243 call!72140)))

(declare-fun d!163973 () Bool)

(assert (=> d!163973 e!875242))

(declare-fun res!1072872 () Bool)

(assert (=> d!163973 (=> (not res!1072872) (not e!875242))))

(assert (=> d!163973 (= res!1072872 (isStrictlySorted!1020 lt!673352))))

(assert (=> d!163973 (= lt!673352 e!875241)))

(assert (=> d!163973 (= c!144820 (and ((_ is Cons!36752) (insertStrictlySorted!597 l!750 key2!21 v2!10)) (bvslt (_1!12698 (h!38199 (insertStrictlySorted!597 l!750 key2!21 v2!10))) key1!37)))))

(assert (=> d!163973 (isStrictlySorted!1020 (insertStrictlySorted!597 l!750 key2!21 v2!10))))

(assert (=> d!163973 (= (insertStrictlySorted!597 (insertStrictlySorted!597 l!750 key2!21 v2!10) key1!37 v1!32) lt!673352)))

(declare-fun b!1569998 () Bool)

(assert (=> b!1569998 (= e!875241 e!875240)))

(assert (=> b!1569998 (= c!144823 (and ((_ is Cons!36752) (insertStrictlySorted!597 l!750 key2!21 v2!10)) (= (_1!12698 (h!38199 (insertStrictlySorted!597 l!750 key2!21 v2!10))) key1!37)))))

(assert (= (and d!163973 c!144820) b!1570002))

(assert (= (and d!163973 (not c!144820)) b!1569998))

(assert (= (and b!1569998 c!144823) b!1570001))

(assert (= (and b!1569998 (not c!144823)) b!1569996))

(assert (= (and b!1569996 c!144822) b!1569997))

(assert (= (and b!1569996 (not c!144822)) b!1570004))

(assert (= (or b!1569997 b!1570004) bm!72136))

(assert (= (or b!1570001 bm!72136) bm!72135))

(assert (= (or b!1570002 bm!72135) bm!72137))

(assert (= (and bm!72137 c!144821) b!1570003))

(assert (= (and bm!72137 (not c!144821)) b!1569999))

(assert (= (and d!163973 res!1072872) b!1569995))

(assert (= (and b!1569995 res!1072871) b!1570000))

(declare-fun m!1444003 () Bool)

(assert (=> b!1569995 m!1444003))

(declare-fun m!1444005 () Bool)

(assert (=> d!163973 m!1444005))

(assert (=> d!163973 m!1443975))

(declare-fun m!1444007 () Bool)

(assert (=> d!163973 m!1444007))

(declare-fun m!1444009 () Bool)

(assert (=> bm!72137 m!1444009))

(declare-fun m!1444011 () Bool)

(assert (=> b!1570003 m!1444011))

(declare-fun m!1444013 () Bool)

(assert (=> b!1570000 m!1444013))

(assert (=> b!1569920 d!163973))

(declare-fun d!163981 () Bool)

(assert (=> d!163981 (= (insertStrictlySorted!597 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!597 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-fun lt!673357 () Unit!52098)

(declare-fun choose!2084 (List!36756 (_ BitVec 64) B!2548 (_ BitVec 64) B!2548) Unit!52098)

(assert (=> d!163981 (= lt!673357 (choose!2084 (t!51664 l!750) key1!37 v1!32 key2!21 v2!10))))

(assert (=> d!163981 (not (= key1!37 key2!21))))

(assert (=> d!163981 (= (lemmaInsertStrictlySortedCommutative!17 (t!51664 l!750) key1!37 v1!32 key2!21 v2!10) lt!673357)))

(declare-fun bs!45226 () Bool)

(assert (= bs!45226 d!163981))

(assert (=> bs!45226 m!1443965))

(assert (=> bs!45226 m!1443967))

(assert (=> bs!45226 m!1443965))

(declare-fun m!1444039 () Bool)

(assert (=> bs!45226 m!1444039))

(assert (=> bs!45226 m!1443963))

(assert (=> bs!45226 m!1443979))

(assert (=> bs!45226 m!1443963))

(assert (=> b!1569920 d!163981))

(declare-fun b!1570033 () Bool)

(declare-fun res!1072885 () Bool)

(declare-fun e!875261 () Bool)

(assert (=> b!1570033 (=> (not res!1072885) (not e!875261))))

(declare-fun lt!673358 () List!36756)

(assert (=> b!1570033 (= res!1072885 (containsKey!868 lt!673358 key2!21))))

(declare-fun c!144834 () Bool)

(declare-fun b!1570034 () Bool)

(assert (=> b!1570034 (= c!144834 (and ((_ is Cons!36752) (insertStrictlySorted!597 l!750 key1!37 v1!32)) (bvsgt (_1!12698 (h!38199 (insertStrictlySorted!597 l!750 key1!37 v1!32))) key2!21)))))

(declare-fun e!875259 () List!36756)

(declare-fun e!875262 () List!36756)

(assert (=> b!1570034 (= e!875259 e!875262)))

(declare-fun b!1570035 () Bool)

(declare-fun call!72149 () List!36756)

(assert (=> b!1570035 (= e!875262 call!72149)))

(declare-fun c!144835 () Bool)

(declare-fun e!875263 () List!36756)

(declare-fun b!1570037 () Bool)

(assert (=> b!1570037 (= e!875263 (ite c!144835 (t!51664 (insertStrictlySorted!597 l!750 key1!37 v1!32)) (ite c!144834 (Cons!36752 (h!38199 (insertStrictlySorted!597 l!750 key1!37 v1!32)) (t!51664 (insertStrictlySorted!597 l!750 key1!37 v1!32))) Nil!36753)))))

(declare-fun bm!72144 () Bool)

(declare-fun call!72147 () List!36756)

(declare-fun call!72148 () List!36756)

(assert (=> bm!72144 (= call!72147 call!72148)))

(declare-fun bm!72145 () Bool)

(assert (=> bm!72145 (= call!72149 call!72147)))

(declare-fun b!1570038 () Bool)

(assert (=> b!1570038 (= e!875261 (contains!10427 lt!673358 (tuple2!25375 key2!21 v2!10)))))

(declare-fun b!1570039 () Bool)

(assert (=> b!1570039 (= e!875259 call!72147)))

(declare-fun b!1570040 () Bool)

(declare-fun e!875260 () List!36756)

(assert (=> b!1570040 (= e!875260 call!72148)))

(declare-fun bm!72146 () Bool)

(declare-fun c!144832 () Bool)

(assert (=> bm!72146 (= call!72148 ($colon$colon!999 e!875263 (ite c!144832 (h!38199 (insertStrictlySorted!597 l!750 key1!37 v1!32)) (tuple2!25375 key2!21 v2!10))))))

(declare-fun c!144833 () Bool)

(assert (=> bm!72146 (= c!144833 c!144832)))

(declare-fun b!1570041 () Bool)

(assert (=> b!1570041 (= e!875263 (insertStrictlySorted!597 (t!51664 (insertStrictlySorted!597 l!750 key1!37 v1!32)) key2!21 v2!10))))

(declare-fun b!1570042 () Bool)

(assert (=> b!1570042 (= e!875262 call!72149)))

(declare-fun d!163987 () Bool)

(assert (=> d!163987 e!875261))

(declare-fun res!1072886 () Bool)

(assert (=> d!163987 (=> (not res!1072886) (not e!875261))))

(assert (=> d!163987 (= res!1072886 (isStrictlySorted!1020 lt!673358))))

(assert (=> d!163987 (= lt!673358 e!875260)))

(assert (=> d!163987 (= c!144832 (and ((_ is Cons!36752) (insertStrictlySorted!597 l!750 key1!37 v1!32)) (bvslt (_1!12698 (h!38199 (insertStrictlySorted!597 l!750 key1!37 v1!32))) key2!21)))))

(assert (=> d!163987 (isStrictlySorted!1020 (insertStrictlySorted!597 l!750 key1!37 v1!32))))

(assert (=> d!163987 (= (insertStrictlySorted!597 (insertStrictlySorted!597 l!750 key1!37 v1!32) key2!21 v2!10) lt!673358)))

(declare-fun b!1570036 () Bool)

(assert (=> b!1570036 (= e!875260 e!875259)))

(assert (=> b!1570036 (= c!144835 (and ((_ is Cons!36752) (insertStrictlySorted!597 l!750 key1!37 v1!32)) (= (_1!12698 (h!38199 (insertStrictlySorted!597 l!750 key1!37 v1!32))) key2!21)))))

(assert (= (and d!163987 c!144832) b!1570040))

(assert (= (and d!163987 (not c!144832)) b!1570036))

(assert (= (and b!1570036 c!144835) b!1570039))

(assert (= (and b!1570036 (not c!144835)) b!1570034))

(assert (= (and b!1570034 c!144834) b!1570035))

(assert (= (and b!1570034 (not c!144834)) b!1570042))

(assert (= (or b!1570035 b!1570042) bm!72145))

(assert (= (or b!1570039 bm!72145) bm!72144))

(assert (= (or b!1570040 bm!72144) bm!72146))

(assert (= (and bm!72146 c!144833) b!1570041))

(assert (= (and bm!72146 (not c!144833)) b!1570037))

(assert (= (and d!163987 res!1072886) b!1570033))

(assert (= (and b!1570033 res!1072885) b!1570038))

(declare-fun m!1444041 () Bool)

(assert (=> b!1570033 m!1444041))

(declare-fun m!1444043 () Bool)

(assert (=> d!163987 m!1444043))

(assert (=> d!163987 m!1443969))

(declare-fun m!1444045 () Bool)

(assert (=> d!163987 m!1444045))

(declare-fun m!1444047 () Bool)

(assert (=> bm!72146 m!1444047))

(declare-fun m!1444049 () Bool)

(assert (=> b!1570041 m!1444049))

(declare-fun m!1444051 () Bool)

(assert (=> b!1570038 m!1444051))

(assert (=> b!1569920 d!163987))

(declare-fun b!1570043 () Bool)

(declare-fun res!1072887 () Bool)

(declare-fun e!875266 () Bool)

(assert (=> b!1570043 (=> (not res!1072887) (not e!875266))))

(declare-fun lt!673359 () List!36756)

(assert (=> b!1570043 (= res!1072887 (containsKey!868 lt!673359 key2!21))))

(declare-fun b!1570044 () Bool)

(declare-fun c!144838 () Bool)

(assert (=> b!1570044 (= c!144838 (and ((_ is Cons!36752) l!750) (bvsgt (_1!12698 (h!38199 l!750)) key2!21)))))

(declare-fun e!875264 () List!36756)

(declare-fun e!875267 () List!36756)

(assert (=> b!1570044 (= e!875264 e!875267)))

(declare-fun b!1570045 () Bool)

(declare-fun call!72152 () List!36756)

(assert (=> b!1570045 (= e!875267 call!72152)))

(declare-fun b!1570047 () Bool)

(declare-fun c!144839 () Bool)

(declare-fun e!875268 () List!36756)

(assert (=> b!1570047 (= e!875268 (ite c!144839 (t!51664 l!750) (ite c!144838 (Cons!36752 (h!38199 l!750) (t!51664 l!750)) Nil!36753)))))

(declare-fun bm!72147 () Bool)

(declare-fun call!72150 () List!36756)

(declare-fun call!72151 () List!36756)

(assert (=> bm!72147 (= call!72150 call!72151)))

(declare-fun bm!72148 () Bool)

(assert (=> bm!72148 (= call!72152 call!72150)))

(declare-fun b!1570048 () Bool)

(assert (=> b!1570048 (= e!875266 (contains!10427 lt!673359 (tuple2!25375 key2!21 v2!10)))))

(declare-fun b!1570049 () Bool)

(assert (=> b!1570049 (= e!875264 call!72150)))

(declare-fun b!1570050 () Bool)

(declare-fun e!875265 () List!36756)

(assert (=> b!1570050 (= e!875265 call!72151)))

(declare-fun bm!72149 () Bool)

(declare-fun c!144836 () Bool)

(assert (=> bm!72149 (= call!72151 ($colon$colon!999 e!875268 (ite c!144836 (h!38199 l!750) (tuple2!25375 key2!21 v2!10))))))

(declare-fun c!144837 () Bool)

(assert (=> bm!72149 (= c!144837 c!144836)))

(declare-fun b!1570051 () Bool)

(assert (=> b!1570051 (= e!875268 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10))))

(declare-fun b!1570052 () Bool)

(assert (=> b!1570052 (= e!875267 call!72152)))

(declare-fun d!163989 () Bool)

(assert (=> d!163989 e!875266))

(declare-fun res!1072888 () Bool)

(assert (=> d!163989 (=> (not res!1072888) (not e!875266))))

(assert (=> d!163989 (= res!1072888 (isStrictlySorted!1020 lt!673359))))

(assert (=> d!163989 (= lt!673359 e!875265)))

(assert (=> d!163989 (= c!144836 (and ((_ is Cons!36752) l!750) (bvslt (_1!12698 (h!38199 l!750)) key2!21)))))

(assert (=> d!163989 (isStrictlySorted!1020 l!750)))

(assert (=> d!163989 (= (insertStrictlySorted!597 l!750 key2!21 v2!10) lt!673359)))

(declare-fun b!1570046 () Bool)

(assert (=> b!1570046 (= e!875265 e!875264)))

(assert (=> b!1570046 (= c!144839 (and ((_ is Cons!36752) l!750) (= (_1!12698 (h!38199 l!750)) key2!21)))))

(assert (= (and d!163989 c!144836) b!1570050))

(assert (= (and d!163989 (not c!144836)) b!1570046))

(assert (= (and b!1570046 c!144839) b!1570049))

(assert (= (and b!1570046 (not c!144839)) b!1570044))

(assert (= (and b!1570044 c!144838) b!1570045))

(assert (= (and b!1570044 (not c!144838)) b!1570052))

(assert (= (or b!1570045 b!1570052) bm!72148))

(assert (= (or b!1570049 bm!72148) bm!72147))

(assert (= (or b!1570050 bm!72147) bm!72149))

(assert (= (and bm!72149 c!144837) b!1570051))

(assert (= (and bm!72149 (not c!144837)) b!1570047))

(assert (= (and d!163989 res!1072888) b!1570043))

(assert (= (and b!1570043 res!1072887) b!1570048))

(declare-fun m!1444053 () Bool)

(assert (=> b!1570043 m!1444053))

(declare-fun m!1444055 () Bool)

(assert (=> d!163989 m!1444055))

(assert (=> d!163989 m!1443959))

(declare-fun m!1444057 () Bool)

(assert (=> bm!72149 m!1444057))

(assert (=> b!1570051 m!1443963))

(declare-fun m!1444059 () Bool)

(assert (=> b!1570048 m!1444059))

(assert (=> b!1569920 d!163989))

(declare-fun b!1570053 () Bool)

(declare-fun res!1072889 () Bool)

(declare-fun e!875271 () Bool)

(assert (=> b!1570053 (=> (not res!1072889) (not e!875271))))

(declare-fun lt!673362 () List!36756)

(assert (=> b!1570053 (= res!1072889 (containsKey!868 lt!673362 key1!37))))

(declare-fun b!1570054 () Bool)

(declare-fun c!144842 () Bool)

(assert (=> b!1570054 (= c!144842 (and ((_ is Cons!36752) l!750) (bvsgt (_1!12698 (h!38199 l!750)) key1!37)))))

(declare-fun e!875269 () List!36756)

(declare-fun e!875272 () List!36756)

(assert (=> b!1570054 (= e!875269 e!875272)))

(declare-fun b!1570055 () Bool)

(declare-fun call!72155 () List!36756)

(assert (=> b!1570055 (= e!875272 call!72155)))

(declare-fun e!875273 () List!36756)

(declare-fun b!1570057 () Bool)

(declare-fun c!144843 () Bool)

(assert (=> b!1570057 (= e!875273 (ite c!144843 (t!51664 l!750) (ite c!144842 (Cons!36752 (h!38199 l!750) (t!51664 l!750)) Nil!36753)))))

(declare-fun bm!72150 () Bool)

(declare-fun call!72153 () List!36756)

(declare-fun call!72154 () List!36756)

(assert (=> bm!72150 (= call!72153 call!72154)))

(declare-fun bm!72151 () Bool)

(assert (=> bm!72151 (= call!72155 call!72153)))

(declare-fun b!1570058 () Bool)

(assert (=> b!1570058 (= e!875271 (contains!10427 lt!673362 (tuple2!25375 key1!37 v1!32)))))

(declare-fun b!1570059 () Bool)

(assert (=> b!1570059 (= e!875269 call!72153)))

(declare-fun b!1570060 () Bool)

(declare-fun e!875270 () List!36756)

(assert (=> b!1570060 (= e!875270 call!72154)))

(declare-fun bm!72152 () Bool)

(declare-fun c!144840 () Bool)

(assert (=> bm!72152 (= call!72154 ($colon$colon!999 e!875273 (ite c!144840 (h!38199 l!750) (tuple2!25375 key1!37 v1!32))))))

(declare-fun c!144841 () Bool)

(assert (=> bm!72152 (= c!144841 c!144840)))

(declare-fun b!1570061 () Bool)

(assert (=> b!1570061 (= e!875273 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32))))

(declare-fun b!1570062 () Bool)

(assert (=> b!1570062 (= e!875272 call!72155)))

(declare-fun d!163991 () Bool)

(assert (=> d!163991 e!875271))

(declare-fun res!1072890 () Bool)

(assert (=> d!163991 (=> (not res!1072890) (not e!875271))))

(assert (=> d!163991 (= res!1072890 (isStrictlySorted!1020 lt!673362))))

(assert (=> d!163991 (= lt!673362 e!875270)))

(assert (=> d!163991 (= c!144840 (and ((_ is Cons!36752) l!750) (bvslt (_1!12698 (h!38199 l!750)) key1!37)))))

(assert (=> d!163991 (isStrictlySorted!1020 l!750)))

(assert (=> d!163991 (= (insertStrictlySorted!597 l!750 key1!37 v1!32) lt!673362)))

(declare-fun b!1570056 () Bool)

(assert (=> b!1570056 (= e!875270 e!875269)))

(assert (=> b!1570056 (= c!144843 (and ((_ is Cons!36752) l!750) (= (_1!12698 (h!38199 l!750)) key1!37)))))

(assert (= (and d!163991 c!144840) b!1570060))

(assert (= (and d!163991 (not c!144840)) b!1570056))

(assert (= (and b!1570056 c!144843) b!1570059))

(assert (= (and b!1570056 (not c!144843)) b!1570054))

(assert (= (and b!1570054 c!144842) b!1570055))

(assert (= (and b!1570054 (not c!144842)) b!1570062))

(assert (= (or b!1570055 b!1570062) bm!72151))

(assert (= (or b!1570059 bm!72151) bm!72150))

(assert (= (or b!1570060 bm!72150) bm!72152))

(assert (= (and bm!72152 c!144841) b!1570061))

(assert (= (and bm!72152 (not c!144841)) b!1570057))

(assert (= (and d!163991 res!1072890) b!1570053))

(assert (= (and b!1570053 res!1072889) b!1570058))

(declare-fun m!1444061 () Bool)

(assert (=> b!1570053 m!1444061))

(declare-fun m!1444063 () Bool)

(assert (=> d!163991 m!1444063))

(assert (=> d!163991 m!1443959))

(declare-fun m!1444065 () Bool)

(assert (=> bm!72152 m!1444065))

(assert (=> b!1570061 m!1443965))

(declare-fun m!1444067 () Bool)

(assert (=> b!1570058 m!1444067))

(assert (=> b!1569920 d!163991))

(declare-fun b!1570063 () Bool)

(declare-fun res!1072891 () Bool)

(declare-fun e!875276 () Bool)

(assert (=> b!1570063 (=> (not res!1072891) (not e!875276))))

(declare-fun lt!673367 () List!36756)

(assert (=> b!1570063 (= res!1072891 (containsKey!868 lt!673367 key2!21))))

(declare-fun c!144846 () Bool)

(declare-fun b!1570064 () Bool)

(assert (=> b!1570064 (= c!144846 (and ((_ is Cons!36752) (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32)) (bvsgt (_1!12698 (h!38199 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32))) key2!21)))))

(declare-fun e!875274 () List!36756)

(declare-fun e!875277 () List!36756)

(assert (=> b!1570064 (= e!875274 e!875277)))

(declare-fun b!1570065 () Bool)

(declare-fun call!72158 () List!36756)

(assert (=> b!1570065 (= e!875277 call!72158)))

(declare-fun e!875278 () List!36756)

(declare-fun b!1570067 () Bool)

(declare-fun c!144847 () Bool)

(assert (=> b!1570067 (= e!875278 (ite c!144847 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32)) (ite c!144846 (Cons!36752 (h!38199 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32)) (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32))) Nil!36753)))))

(declare-fun bm!72153 () Bool)

(declare-fun call!72156 () List!36756)

(declare-fun call!72157 () List!36756)

(assert (=> bm!72153 (= call!72156 call!72157)))

(declare-fun bm!72154 () Bool)

(assert (=> bm!72154 (= call!72158 call!72156)))

(declare-fun b!1570068 () Bool)

(assert (=> b!1570068 (= e!875276 (contains!10427 lt!673367 (tuple2!25375 key2!21 v2!10)))))

(declare-fun b!1570069 () Bool)

(assert (=> b!1570069 (= e!875274 call!72156)))

(declare-fun b!1570070 () Bool)

(declare-fun e!875275 () List!36756)

(assert (=> b!1570070 (= e!875275 call!72157)))

(declare-fun c!144844 () Bool)

(declare-fun bm!72155 () Bool)

(assert (=> bm!72155 (= call!72157 ($colon$colon!999 e!875278 (ite c!144844 (h!38199 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32)) (tuple2!25375 key2!21 v2!10))))))

(declare-fun c!144845 () Bool)

(assert (=> bm!72155 (= c!144845 c!144844)))

(declare-fun b!1570071 () Bool)

(assert (=> b!1570071 (= e!875278 (insertStrictlySorted!597 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32)) key2!21 v2!10))))

(declare-fun b!1570072 () Bool)

(assert (=> b!1570072 (= e!875277 call!72158)))

(declare-fun d!163993 () Bool)

(assert (=> d!163993 e!875276))

(declare-fun res!1072892 () Bool)

(assert (=> d!163993 (=> (not res!1072892) (not e!875276))))

(assert (=> d!163993 (= res!1072892 (isStrictlySorted!1020 lt!673367))))

(assert (=> d!163993 (= lt!673367 e!875275)))

(assert (=> d!163993 (= c!144844 (and ((_ is Cons!36752) (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32)) (bvslt (_1!12698 (h!38199 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32))) key2!21)))))

(assert (=> d!163993 (isStrictlySorted!1020 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32))))

(assert (=> d!163993 (= (insertStrictlySorted!597 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32) key2!21 v2!10) lt!673367)))

(declare-fun b!1570066 () Bool)

(assert (=> b!1570066 (= e!875275 e!875274)))

(assert (=> b!1570066 (= c!144847 (and ((_ is Cons!36752) (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32)) (= (_1!12698 (h!38199 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32))) key2!21)))))

(assert (= (and d!163993 c!144844) b!1570070))

(assert (= (and d!163993 (not c!144844)) b!1570066))

(assert (= (and b!1570066 c!144847) b!1570069))

(assert (= (and b!1570066 (not c!144847)) b!1570064))

(assert (= (and b!1570064 c!144846) b!1570065))

(assert (= (and b!1570064 (not c!144846)) b!1570072))

(assert (= (or b!1570065 b!1570072) bm!72154))

(assert (= (or b!1570069 bm!72154) bm!72153))

(assert (= (or b!1570070 bm!72153) bm!72155))

(assert (= (and bm!72155 c!144845) b!1570071))

(assert (= (and bm!72155 (not c!144845)) b!1570067))

(assert (= (and d!163993 res!1072892) b!1570063))

(assert (= (and b!1570063 res!1072891) b!1570068))

(declare-fun m!1444073 () Bool)

(assert (=> b!1570063 m!1444073))

(declare-fun m!1444075 () Bool)

(assert (=> d!163993 m!1444075))

(assert (=> d!163993 m!1443965))

(declare-fun m!1444077 () Bool)

(assert (=> d!163993 m!1444077))

(declare-fun m!1444079 () Bool)

(assert (=> bm!72155 m!1444079))

(declare-fun m!1444081 () Bool)

(assert (=> b!1570071 m!1444081))

(declare-fun m!1444083 () Bool)

(assert (=> b!1570068 m!1444083))

(assert (=> b!1569920 d!163993))

(declare-fun b!1570093 () Bool)

(declare-fun res!1072897 () Bool)

(declare-fun e!875291 () Bool)

(assert (=> b!1570093 (=> (not res!1072897) (not e!875291))))

(declare-fun lt!673370 () List!36756)

(assert (=> b!1570093 (= res!1072897 (containsKey!868 lt!673370 key2!21))))

(declare-fun b!1570094 () Bool)

(declare-fun c!144858 () Bool)

(assert (=> b!1570094 (= c!144858 (and ((_ is Cons!36752) (t!51664 l!750)) (bvsgt (_1!12698 (h!38199 (t!51664 l!750))) key2!21)))))

(declare-fun e!875289 () List!36756)

(declare-fun e!875292 () List!36756)

(assert (=> b!1570094 (= e!875289 e!875292)))

(declare-fun b!1570095 () Bool)

(declare-fun call!72167 () List!36756)

(assert (=> b!1570095 (= e!875292 call!72167)))

(declare-fun b!1570097 () Bool)

(declare-fun c!144859 () Bool)

(declare-fun e!875293 () List!36756)

(assert (=> b!1570097 (= e!875293 (ite c!144859 (t!51664 (t!51664 l!750)) (ite c!144858 (Cons!36752 (h!38199 (t!51664 l!750)) (t!51664 (t!51664 l!750))) Nil!36753)))))

(declare-fun bm!72162 () Bool)

(declare-fun call!72165 () List!36756)

(declare-fun call!72166 () List!36756)

(assert (=> bm!72162 (= call!72165 call!72166)))

(declare-fun bm!72163 () Bool)

(assert (=> bm!72163 (= call!72167 call!72165)))

(declare-fun b!1570098 () Bool)

(assert (=> b!1570098 (= e!875291 (contains!10427 lt!673370 (tuple2!25375 key2!21 v2!10)))))

(declare-fun b!1570099 () Bool)

(assert (=> b!1570099 (= e!875289 call!72165)))

(declare-fun b!1570100 () Bool)

(declare-fun e!875290 () List!36756)

(assert (=> b!1570100 (= e!875290 call!72166)))

(declare-fun bm!72164 () Bool)

(declare-fun c!144856 () Bool)

(assert (=> bm!72164 (= call!72166 ($colon$colon!999 e!875293 (ite c!144856 (h!38199 (t!51664 l!750)) (tuple2!25375 key2!21 v2!10))))))

(declare-fun c!144857 () Bool)

(assert (=> bm!72164 (= c!144857 c!144856)))

(declare-fun b!1570101 () Bool)

(assert (=> b!1570101 (= e!875293 (insertStrictlySorted!597 (t!51664 (t!51664 l!750)) key2!21 v2!10))))

(declare-fun b!1570102 () Bool)

(assert (=> b!1570102 (= e!875292 call!72167)))

(declare-fun d!163999 () Bool)

(assert (=> d!163999 e!875291))

(declare-fun res!1072898 () Bool)

(assert (=> d!163999 (=> (not res!1072898) (not e!875291))))

(assert (=> d!163999 (= res!1072898 (isStrictlySorted!1020 lt!673370))))

(assert (=> d!163999 (= lt!673370 e!875290)))

(assert (=> d!163999 (= c!144856 (and ((_ is Cons!36752) (t!51664 l!750)) (bvslt (_1!12698 (h!38199 (t!51664 l!750))) key2!21)))))

(assert (=> d!163999 (isStrictlySorted!1020 (t!51664 l!750))))

(assert (=> d!163999 (= (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10) lt!673370)))

(declare-fun b!1570096 () Bool)

(assert (=> b!1570096 (= e!875290 e!875289)))

(assert (=> b!1570096 (= c!144859 (and ((_ is Cons!36752) (t!51664 l!750)) (= (_1!12698 (h!38199 (t!51664 l!750))) key2!21)))))

(assert (= (and d!163999 c!144856) b!1570100))

(assert (= (and d!163999 (not c!144856)) b!1570096))

(assert (= (and b!1570096 c!144859) b!1570099))

(assert (= (and b!1570096 (not c!144859)) b!1570094))

(assert (= (and b!1570094 c!144858) b!1570095))

(assert (= (and b!1570094 (not c!144858)) b!1570102))

(assert (= (or b!1570095 b!1570102) bm!72163))

(assert (= (or b!1570099 bm!72163) bm!72162))

(assert (= (or b!1570100 bm!72162) bm!72164))

(assert (= (and bm!72164 c!144857) b!1570101))

(assert (= (and bm!72164 (not c!144857)) b!1570097))

(assert (= (and d!163999 res!1072898) b!1570093))

(assert (= (and b!1570093 res!1072897) b!1570098))

(declare-fun m!1444109 () Bool)

(assert (=> b!1570093 m!1444109))

(declare-fun m!1444111 () Bool)

(assert (=> d!163999 m!1444111))

(assert (=> d!163999 m!1443961))

(declare-fun m!1444113 () Bool)

(assert (=> bm!72164 m!1444113))

(declare-fun m!1444115 () Bool)

(assert (=> b!1570101 m!1444115))

(declare-fun m!1444117 () Bool)

(assert (=> b!1570098 m!1444117))

(assert (=> b!1569920 d!163999))

(declare-fun b!1570123 () Bool)

(declare-fun res!1072903 () Bool)

(declare-fun e!875306 () Bool)

(assert (=> b!1570123 (=> (not res!1072903) (not e!875306))))

(declare-fun lt!673373 () List!36756)

(assert (=> b!1570123 (= res!1072903 (containsKey!868 lt!673373 key1!37))))

(declare-fun b!1570124 () Bool)

(declare-fun c!144870 () Bool)

(assert (=> b!1570124 (= c!144870 (and ((_ is Cons!36752) (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10)) (bvsgt (_1!12698 (h!38199 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10))) key1!37)))))

(declare-fun e!875304 () List!36756)

(declare-fun e!875307 () List!36756)

(assert (=> b!1570124 (= e!875304 e!875307)))

(declare-fun b!1570125 () Bool)

(declare-fun call!72176 () List!36756)

(assert (=> b!1570125 (= e!875307 call!72176)))

(declare-fun b!1570127 () Bool)

(declare-fun e!875308 () List!36756)

(declare-fun c!144871 () Bool)

(assert (=> b!1570127 (= e!875308 (ite c!144871 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10)) (ite c!144870 (Cons!36752 (h!38199 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10)) (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10))) Nil!36753)))))

(declare-fun bm!72171 () Bool)

(declare-fun call!72174 () List!36756)

(declare-fun call!72175 () List!36756)

(assert (=> bm!72171 (= call!72174 call!72175)))

(declare-fun bm!72172 () Bool)

(assert (=> bm!72172 (= call!72176 call!72174)))

(declare-fun b!1570128 () Bool)

(assert (=> b!1570128 (= e!875306 (contains!10427 lt!673373 (tuple2!25375 key1!37 v1!32)))))

(declare-fun b!1570129 () Bool)

(assert (=> b!1570129 (= e!875304 call!72174)))

(declare-fun b!1570130 () Bool)

(declare-fun e!875305 () List!36756)

(assert (=> b!1570130 (= e!875305 call!72175)))

(declare-fun c!144868 () Bool)

(declare-fun bm!72173 () Bool)

(assert (=> bm!72173 (= call!72175 ($colon$colon!999 e!875308 (ite c!144868 (h!38199 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10)) (tuple2!25375 key1!37 v1!32))))))

(declare-fun c!144869 () Bool)

(assert (=> bm!72173 (= c!144869 c!144868)))

(declare-fun b!1570131 () Bool)

(assert (=> b!1570131 (= e!875308 (insertStrictlySorted!597 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10)) key1!37 v1!32))))

(declare-fun b!1570132 () Bool)

(assert (=> b!1570132 (= e!875307 call!72176)))

(declare-fun d!164005 () Bool)

(assert (=> d!164005 e!875306))

(declare-fun res!1072904 () Bool)

(assert (=> d!164005 (=> (not res!1072904) (not e!875306))))

(assert (=> d!164005 (= res!1072904 (isStrictlySorted!1020 lt!673373))))

(assert (=> d!164005 (= lt!673373 e!875305)))

(assert (=> d!164005 (= c!144868 (and ((_ is Cons!36752) (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10)) (bvslt (_1!12698 (h!38199 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10))) key1!37)))))

(assert (=> d!164005 (isStrictlySorted!1020 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10))))

(assert (=> d!164005 (= (insertStrictlySorted!597 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10) key1!37 v1!32) lt!673373)))

(declare-fun b!1570126 () Bool)

(assert (=> b!1570126 (= e!875305 e!875304)))

(assert (=> b!1570126 (= c!144871 (and ((_ is Cons!36752) (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10)) (= (_1!12698 (h!38199 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10))) key1!37)))))

(assert (= (and d!164005 c!144868) b!1570130))

(assert (= (and d!164005 (not c!144868)) b!1570126))

(assert (= (and b!1570126 c!144871) b!1570129))

(assert (= (and b!1570126 (not c!144871)) b!1570124))

(assert (= (and b!1570124 c!144870) b!1570125))

(assert (= (and b!1570124 (not c!144870)) b!1570132))

(assert (= (or b!1570125 b!1570132) bm!72172))

(assert (= (or b!1570129 bm!72172) bm!72171))

(assert (= (or b!1570130 bm!72171) bm!72173))

(assert (= (and bm!72173 c!144869) b!1570131))

(assert (= (and bm!72173 (not c!144869)) b!1570127))

(assert (= (and d!164005 res!1072904) b!1570123))

(assert (= (and b!1570123 res!1072903) b!1570128))

(declare-fun m!1444135 () Bool)

(assert (=> b!1570123 m!1444135))

(declare-fun m!1444137 () Bool)

(assert (=> d!164005 m!1444137))

(assert (=> d!164005 m!1443963))

(declare-fun m!1444139 () Bool)

(assert (=> d!164005 m!1444139))

(declare-fun m!1444141 () Bool)

(assert (=> bm!72173 m!1444141))

(declare-fun m!1444143 () Bool)

(assert (=> b!1570131 m!1444143))

(declare-fun m!1444145 () Bool)

(assert (=> b!1570128 m!1444145))

(assert (=> b!1569920 d!164005))

(declare-fun b!1570153 () Bool)

(declare-fun res!1072909 () Bool)

(declare-fun e!875321 () Bool)

(assert (=> b!1570153 (=> (not res!1072909) (not e!875321))))

(declare-fun lt!673376 () List!36756)

(assert (=> b!1570153 (= res!1072909 (containsKey!868 lt!673376 key1!37))))

(declare-fun b!1570154 () Bool)

(declare-fun c!144882 () Bool)

(assert (=> b!1570154 (= c!144882 (and ((_ is Cons!36752) (t!51664 l!750)) (bvsgt (_1!12698 (h!38199 (t!51664 l!750))) key1!37)))))

(declare-fun e!875319 () List!36756)

(declare-fun e!875322 () List!36756)

(assert (=> b!1570154 (= e!875319 e!875322)))

(declare-fun b!1570155 () Bool)

(declare-fun call!72185 () List!36756)

(assert (=> b!1570155 (= e!875322 call!72185)))

(declare-fun c!144883 () Bool)

(declare-fun e!875323 () List!36756)

(declare-fun b!1570157 () Bool)

(assert (=> b!1570157 (= e!875323 (ite c!144883 (t!51664 (t!51664 l!750)) (ite c!144882 (Cons!36752 (h!38199 (t!51664 l!750)) (t!51664 (t!51664 l!750))) Nil!36753)))))

(declare-fun bm!72180 () Bool)

(declare-fun call!72183 () List!36756)

(declare-fun call!72184 () List!36756)

(assert (=> bm!72180 (= call!72183 call!72184)))

(declare-fun bm!72181 () Bool)

(assert (=> bm!72181 (= call!72185 call!72183)))

(declare-fun b!1570158 () Bool)

(assert (=> b!1570158 (= e!875321 (contains!10427 lt!673376 (tuple2!25375 key1!37 v1!32)))))

(declare-fun b!1570159 () Bool)

(assert (=> b!1570159 (= e!875319 call!72183)))

(declare-fun b!1570160 () Bool)

(declare-fun e!875320 () List!36756)

(assert (=> b!1570160 (= e!875320 call!72184)))

(declare-fun bm!72182 () Bool)

(declare-fun c!144880 () Bool)

(assert (=> bm!72182 (= call!72184 ($colon$colon!999 e!875323 (ite c!144880 (h!38199 (t!51664 l!750)) (tuple2!25375 key1!37 v1!32))))))

(declare-fun c!144881 () Bool)

(assert (=> bm!72182 (= c!144881 c!144880)))

(declare-fun b!1570161 () Bool)

(assert (=> b!1570161 (= e!875323 (insertStrictlySorted!597 (t!51664 (t!51664 l!750)) key1!37 v1!32))))

(declare-fun b!1570162 () Bool)

(assert (=> b!1570162 (= e!875322 call!72185)))

(declare-fun d!164011 () Bool)

(assert (=> d!164011 e!875321))

(declare-fun res!1072910 () Bool)

(assert (=> d!164011 (=> (not res!1072910) (not e!875321))))

(assert (=> d!164011 (= res!1072910 (isStrictlySorted!1020 lt!673376))))

(assert (=> d!164011 (= lt!673376 e!875320)))

(assert (=> d!164011 (= c!144880 (and ((_ is Cons!36752) (t!51664 l!750)) (bvslt (_1!12698 (h!38199 (t!51664 l!750))) key1!37)))))

(assert (=> d!164011 (isStrictlySorted!1020 (t!51664 l!750))))

(assert (=> d!164011 (= (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32) lt!673376)))

(declare-fun b!1570156 () Bool)

(assert (=> b!1570156 (= e!875320 e!875319)))

(assert (=> b!1570156 (= c!144883 (and ((_ is Cons!36752) (t!51664 l!750)) (= (_1!12698 (h!38199 (t!51664 l!750))) key1!37)))))

(assert (= (and d!164011 c!144880) b!1570160))

(assert (= (and d!164011 (not c!144880)) b!1570156))

(assert (= (and b!1570156 c!144883) b!1570159))

(assert (= (and b!1570156 (not c!144883)) b!1570154))

(assert (= (and b!1570154 c!144882) b!1570155))

(assert (= (and b!1570154 (not c!144882)) b!1570162))

(assert (= (or b!1570155 b!1570162) bm!72181))

(assert (= (or b!1570159 bm!72181) bm!72180))

(assert (= (or b!1570160 bm!72180) bm!72182))

(assert (= (and bm!72182 c!144881) b!1570161))

(assert (= (and bm!72182 (not c!144881)) b!1570157))

(assert (= (and d!164011 res!1072910) b!1570153))

(assert (= (and b!1570153 res!1072909) b!1570158))

(declare-fun m!1444163 () Bool)

(assert (=> b!1570153 m!1444163))

(declare-fun m!1444165 () Bool)

(assert (=> d!164011 m!1444165))

(assert (=> d!164011 m!1443961))

(declare-fun m!1444167 () Bool)

(assert (=> bm!72182 m!1444167))

(declare-fun m!1444169 () Bool)

(assert (=> b!1570161 m!1444169))

(declare-fun m!1444171 () Bool)

(assert (=> b!1570158 m!1444171))

(assert (=> b!1569920 d!164011))

(declare-fun d!164017 () Bool)

(declare-fun res!1072927 () Bool)

(declare-fun e!875358 () Bool)

(assert (=> d!164017 (=> res!1072927 e!875358)))

(assert (=> d!164017 (= res!1072927 (or ((_ is Nil!36753) (t!51664 l!750)) ((_ is Nil!36753) (t!51664 (t!51664 l!750)))))))

(assert (=> d!164017 (= (isStrictlySorted!1020 (t!51664 l!750)) e!875358)))

(declare-fun b!1570227 () Bool)

(declare-fun e!875359 () Bool)

(assert (=> b!1570227 (= e!875358 e!875359)))

(declare-fun res!1072928 () Bool)

(assert (=> b!1570227 (=> (not res!1072928) (not e!875359))))

(assert (=> b!1570227 (= res!1072928 (bvslt (_1!12698 (h!38199 (t!51664 l!750))) (_1!12698 (h!38199 (t!51664 (t!51664 l!750))))))))

(declare-fun b!1570228 () Bool)

(assert (=> b!1570228 (= e!875359 (isStrictlySorted!1020 (t!51664 (t!51664 l!750))))))

(assert (= (and d!164017 (not res!1072927)) b!1570227))

(assert (= (and b!1570227 res!1072928) b!1570228))

(declare-fun m!1444241 () Bool)

(assert (=> b!1570228 m!1444241))

(assert (=> b!1569919 d!164017))

(declare-fun d!164031 () Bool)

(declare-fun res!1072933 () Bool)

(declare-fun e!875370 () Bool)

(assert (=> d!164031 (=> res!1072933 e!875370)))

(assert (=> d!164031 (= res!1072933 (or ((_ is Nil!36753) l!750) ((_ is Nil!36753) (t!51664 l!750))))))

(assert (=> d!164031 (= (isStrictlySorted!1020 l!750) e!875370)))

(declare-fun b!1570249 () Bool)

(declare-fun e!875371 () Bool)

(assert (=> b!1570249 (= e!875370 e!875371)))

(declare-fun res!1072934 () Bool)

(assert (=> b!1570249 (=> (not res!1072934) (not e!875371))))

(assert (=> b!1570249 (= res!1072934 (bvslt (_1!12698 (h!38199 l!750)) (_1!12698 (h!38199 (t!51664 l!750)))))))

(declare-fun b!1570250 () Bool)

(assert (=> b!1570250 (= e!875371 (isStrictlySorted!1020 (t!51664 l!750)))))

(assert (= (and d!164031 (not res!1072933)) b!1570249))

(assert (= (and b!1570249 res!1072934) b!1570250))

(assert (=> b!1570250 m!1443961))

(assert (=> b!1569918 d!164031))

(declare-fun b!1570255 () Bool)

(declare-fun e!875374 () Bool)

(declare-fun tp!114219 () Bool)

(assert (=> b!1570255 (= e!875374 (and tp_is_empty!39099 tp!114219))))

(assert (=> b!1569921 (= tp!114213 e!875374)))

(assert (= (and b!1569921 ((_ is Cons!36752) (t!51664 l!750))) b!1570255))

(check-sat (not bm!72173) tp_is_empty!39099 (not b!1570153) (not bm!72149) (not b!1570000) (not b!1570158) (not b!1570038) (not d!163989) (not b!1570068) (not bm!72164) (not b!1570161) (not b!1570048) (not b!1570041) (not b!1570098) (not bm!72152) (not bm!72155) (not d!163973) (not b!1570053) (not b!1570061) (not d!163993) (not b!1569995) (not b!1570063) (not b!1570093) (not d!164005) (not d!163999) (not b!1570250) (not b!1570071) (not b!1570051) (not b!1570101) (not d!163991) (not bm!72182) (not d!164011) (not bm!72137) (not b!1570123) (not b!1570128) (not b!1570033) (not b!1570058) (not b!1570003) (not d!163981) (not bm!72146) (not d!163987) (not b!1570043) (not b!1570228) (not b!1570131) (not b!1570255))
(check-sat)
(get-model)

(declare-fun d!164039 () Bool)

(declare-fun res!1072945 () Bool)

(declare-fun e!875391 () Bool)

(assert (=> d!164039 (=> res!1072945 e!875391)))

(assert (=> d!164039 (= res!1072945 (or ((_ is Nil!36753) lt!673373) ((_ is Nil!36753) (t!51664 lt!673373))))))

(assert (=> d!164039 (= (isStrictlySorted!1020 lt!673373) e!875391)))

(declare-fun b!1570276 () Bool)

(declare-fun e!875392 () Bool)

(assert (=> b!1570276 (= e!875391 e!875392)))

(declare-fun res!1072946 () Bool)

(assert (=> b!1570276 (=> (not res!1072946) (not e!875392))))

(assert (=> b!1570276 (= res!1072946 (bvslt (_1!12698 (h!38199 lt!673373)) (_1!12698 (h!38199 (t!51664 lt!673373)))))))

(declare-fun b!1570277 () Bool)

(assert (=> b!1570277 (= e!875392 (isStrictlySorted!1020 (t!51664 lt!673373)))))

(assert (= (and d!164039 (not res!1072945)) b!1570276))

(assert (= (and b!1570276 res!1072946) b!1570277))

(declare-fun m!1444267 () Bool)

(assert (=> b!1570277 m!1444267))

(assert (=> d!164005 d!164039))

(declare-fun d!164041 () Bool)

(declare-fun res!1072947 () Bool)

(declare-fun e!875393 () Bool)

(assert (=> d!164041 (=> res!1072947 e!875393)))

(assert (=> d!164041 (= res!1072947 (or ((_ is Nil!36753) (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10)) ((_ is Nil!36753) (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10)))))))

(assert (=> d!164041 (= (isStrictlySorted!1020 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10)) e!875393)))

(declare-fun b!1570278 () Bool)

(declare-fun e!875394 () Bool)

(assert (=> b!1570278 (= e!875393 e!875394)))

(declare-fun res!1072948 () Bool)

(assert (=> b!1570278 (=> (not res!1072948) (not e!875394))))

(assert (=> b!1570278 (= res!1072948 (bvslt (_1!12698 (h!38199 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10))) (_1!12698 (h!38199 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10))))))))

(declare-fun b!1570279 () Bool)

(assert (=> b!1570279 (= e!875394 (isStrictlySorted!1020 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10))))))

(assert (= (and d!164041 (not res!1072947)) b!1570278))

(assert (= (and b!1570278 res!1072948) b!1570279))

(declare-fun m!1444269 () Bool)

(assert (=> b!1570279 m!1444269))

(assert (=> d!164005 d!164041))

(assert (=> b!1570051 d!163999))

(declare-fun d!164043 () Bool)

(declare-fun lt!673387 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!818 (List!36756) (InoxSet tuple2!25374))

(assert (=> d!164043 (= lt!673387 (select (content!818 lt!673376) (tuple2!25375 key1!37 v1!32)))))

(declare-fun e!875399 () Bool)

(assert (=> d!164043 (= lt!673387 e!875399)))

(declare-fun res!1072954 () Bool)

(assert (=> d!164043 (=> (not res!1072954) (not e!875399))))

(assert (=> d!164043 (= res!1072954 ((_ is Cons!36752) lt!673376))))

(assert (=> d!164043 (= (contains!10427 lt!673376 (tuple2!25375 key1!37 v1!32)) lt!673387)))

(declare-fun b!1570284 () Bool)

(declare-fun e!875400 () Bool)

(assert (=> b!1570284 (= e!875399 e!875400)))

(declare-fun res!1072953 () Bool)

(assert (=> b!1570284 (=> res!1072953 e!875400)))

(assert (=> b!1570284 (= res!1072953 (= (h!38199 lt!673376) (tuple2!25375 key1!37 v1!32)))))

(declare-fun b!1570285 () Bool)

(assert (=> b!1570285 (= e!875400 (contains!10427 (t!51664 lt!673376) (tuple2!25375 key1!37 v1!32)))))

(assert (= (and d!164043 res!1072954) b!1570284))

(assert (= (and b!1570284 (not res!1072953)) b!1570285))

(declare-fun m!1444271 () Bool)

(assert (=> d!164043 m!1444271))

(declare-fun m!1444273 () Bool)

(assert (=> d!164043 m!1444273))

(declare-fun m!1444275 () Bool)

(assert (=> b!1570285 m!1444275))

(assert (=> b!1570158 d!164043))

(declare-fun d!164045 () Bool)

(declare-fun lt!673388 () Bool)

(assert (=> d!164045 (= lt!673388 (select (content!818 lt!673362) (tuple2!25375 key1!37 v1!32)))))

(declare-fun e!875401 () Bool)

(assert (=> d!164045 (= lt!673388 e!875401)))

(declare-fun res!1072956 () Bool)

(assert (=> d!164045 (=> (not res!1072956) (not e!875401))))

(assert (=> d!164045 (= res!1072956 ((_ is Cons!36752) lt!673362))))

(assert (=> d!164045 (= (contains!10427 lt!673362 (tuple2!25375 key1!37 v1!32)) lt!673388)))

(declare-fun b!1570286 () Bool)

(declare-fun e!875402 () Bool)

(assert (=> b!1570286 (= e!875401 e!875402)))

(declare-fun res!1072955 () Bool)

(assert (=> b!1570286 (=> res!1072955 e!875402)))

(assert (=> b!1570286 (= res!1072955 (= (h!38199 lt!673362) (tuple2!25375 key1!37 v1!32)))))

(declare-fun b!1570287 () Bool)

(assert (=> b!1570287 (= e!875402 (contains!10427 (t!51664 lt!673362) (tuple2!25375 key1!37 v1!32)))))

(assert (= (and d!164045 res!1072956) b!1570286))

(assert (= (and b!1570286 (not res!1072955)) b!1570287))

(declare-fun m!1444277 () Bool)

(assert (=> d!164045 m!1444277))

(declare-fun m!1444279 () Bool)

(assert (=> d!164045 m!1444279))

(declare-fun m!1444281 () Bool)

(assert (=> b!1570287 m!1444281))

(assert (=> b!1570058 d!164045))

(declare-fun b!1570288 () Bool)

(declare-fun res!1072957 () Bool)

(declare-fun e!875405 () Bool)

(assert (=> b!1570288 (=> (not res!1072957) (not e!875405))))

(declare-fun lt!673389 () List!36756)

(assert (=> b!1570288 (= res!1072957 (containsKey!868 lt!673389 key2!21))))

(declare-fun c!144918 () Bool)

(declare-fun b!1570289 () Bool)

(assert (=> b!1570289 (= c!144918 (and ((_ is Cons!36752) (t!51664 (insertStrictlySorted!597 l!750 key1!37 v1!32))) (bvsgt (_1!12698 (h!38199 (t!51664 (insertStrictlySorted!597 l!750 key1!37 v1!32)))) key2!21)))))

(declare-fun e!875403 () List!36756)

(declare-fun e!875406 () List!36756)

(assert (=> b!1570289 (= e!875403 e!875406)))

(declare-fun b!1570290 () Bool)

(declare-fun call!72212 () List!36756)

(assert (=> b!1570290 (= e!875406 call!72212)))

(declare-fun c!144919 () Bool)

(declare-fun e!875407 () List!36756)

(declare-fun b!1570292 () Bool)

(assert (=> b!1570292 (= e!875407 (ite c!144919 (t!51664 (t!51664 (insertStrictlySorted!597 l!750 key1!37 v1!32))) (ite c!144918 (Cons!36752 (h!38199 (t!51664 (insertStrictlySorted!597 l!750 key1!37 v1!32))) (t!51664 (t!51664 (insertStrictlySorted!597 l!750 key1!37 v1!32)))) Nil!36753)))))

(declare-fun bm!72207 () Bool)

(declare-fun call!72210 () List!36756)

(declare-fun call!72211 () List!36756)

(assert (=> bm!72207 (= call!72210 call!72211)))

(declare-fun bm!72208 () Bool)

(assert (=> bm!72208 (= call!72212 call!72210)))

(declare-fun b!1570293 () Bool)

(assert (=> b!1570293 (= e!875405 (contains!10427 lt!673389 (tuple2!25375 key2!21 v2!10)))))

(declare-fun b!1570294 () Bool)

(assert (=> b!1570294 (= e!875403 call!72210)))

(declare-fun b!1570295 () Bool)

(declare-fun e!875404 () List!36756)

(assert (=> b!1570295 (= e!875404 call!72211)))

(declare-fun c!144916 () Bool)

(declare-fun bm!72209 () Bool)

(assert (=> bm!72209 (= call!72211 ($colon$colon!999 e!875407 (ite c!144916 (h!38199 (t!51664 (insertStrictlySorted!597 l!750 key1!37 v1!32))) (tuple2!25375 key2!21 v2!10))))))

(declare-fun c!144917 () Bool)

(assert (=> bm!72209 (= c!144917 c!144916)))

(declare-fun b!1570296 () Bool)

(assert (=> b!1570296 (= e!875407 (insertStrictlySorted!597 (t!51664 (t!51664 (insertStrictlySorted!597 l!750 key1!37 v1!32))) key2!21 v2!10))))

(declare-fun b!1570297 () Bool)

(assert (=> b!1570297 (= e!875406 call!72212)))

(declare-fun d!164047 () Bool)

(assert (=> d!164047 e!875405))

(declare-fun res!1072958 () Bool)

(assert (=> d!164047 (=> (not res!1072958) (not e!875405))))

(assert (=> d!164047 (= res!1072958 (isStrictlySorted!1020 lt!673389))))

(assert (=> d!164047 (= lt!673389 e!875404)))

(assert (=> d!164047 (= c!144916 (and ((_ is Cons!36752) (t!51664 (insertStrictlySorted!597 l!750 key1!37 v1!32))) (bvslt (_1!12698 (h!38199 (t!51664 (insertStrictlySorted!597 l!750 key1!37 v1!32)))) key2!21)))))

(assert (=> d!164047 (isStrictlySorted!1020 (t!51664 (insertStrictlySorted!597 l!750 key1!37 v1!32)))))

(assert (=> d!164047 (= (insertStrictlySorted!597 (t!51664 (insertStrictlySorted!597 l!750 key1!37 v1!32)) key2!21 v2!10) lt!673389)))

(declare-fun b!1570291 () Bool)

(assert (=> b!1570291 (= e!875404 e!875403)))

(assert (=> b!1570291 (= c!144919 (and ((_ is Cons!36752) (t!51664 (insertStrictlySorted!597 l!750 key1!37 v1!32))) (= (_1!12698 (h!38199 (t!51664 (insertStrictlySorted!597 l!750 key1!37 v1!32)))) key2!21)))))

(assert (= (and d!164047 c!144916) b!1570295))

(assert (= (and d!164047 (not c!144916)) b!1570291))

(assert (= (and b!1570291 c!144919) b!1570294))

(assert (= (and b!1570291 (not c!144919)) b!1570289))

(assert (= (and b!1570289 c!144918) b!1570290))

(assert (= (and b!1570289 (not c!144918)) b!1570297))

(assert (= (or b!1570290 b!1570297) bm!72208))

(assert (= (or b!1570294 bm!72208) bm!72207))

(assert (= (or b!1570295 bm!72207) bm!72209))

(assert (= (and bm!72209 c!144917) b!1570296))

(assert (= (and bm!72209 (not c!144917)) b!1570292))

(assert (= (and d!164047 res!1072958) b!1570288))

(assert (= (and b!1570288 res!1072957) b!1570293))

(declare-fun m!1444283 () Bool)

(assert (=> b!1570288 m!1444283))

(declare-fun m!1444285 () Bool)

(assert (=> d!164047 m!1444285))

(declare-fun m!1444287 () Bool)

(assert (=> d!164047 m!1444287))

(declare-fun m!1444289 () Bool)

(assert (=> bm!72209 m!1444289))

(declare-fun m!1444291 () Bool)

(assert (=> b!1570296 m!1444291))

(declare-fun m!1444293 () Bool)

(assert (=> b!1570293 m!1444293))

(assert (=> b!1570041 d!164047))

(declare-fun d!164049 () Bool)

(declare-fun res!1072963 () Bool)

(declare-fun e!875412 () Bool)

(assert (=> d!164049 (=> res!1072963 e!875412)))

(assert (=> d!164049 (= res!1072963 (and ((_ is Cons!36752) lt!673367) (= (_1!12698 (h!38199 lt!673367)) key2!21)))))

(assert (=> d!164049 (= (containsKey!868 lt!673367 key2!21) e!875412)))

(declare-fun b!1570302 () Bool)

(declare-fun e!875413 () Bool)

(assert (=> b!1570302 (= e!875412 e!875413)))

(declare-fun res!1072964 () Bool)

(assert (=> b!1570302 (=> (not res!1072964) (not e!875413))))

(assert (=> b!1570302 (= res!1072964 (and (or (not ((_ is Cons!36752) lt!673367)) (bvsle (_1!12698 (h!38199 lt!673367)) key2!21)) ((_ is Cons!36752) lt!673367) (bvslt (_1!12698 (h!38199 lt!673367)) key2!21)))))

(declare-fun b!1570303 () Bool)

(assert (=> b!1570303 (= e!875413 (containsKey!868 (t!51664 lt!673367) key2!21))))

(assert (= (and d!164049 (not res!1072963)) b!1570302))

(assert (= (and b!1570302 res!1072964) b!1570303))

(declare-fun m!1444295 () Bool)

(assert (=> b!1570303 m!1444295))

(assert (=> b!1570063 d!164049))

(declare-fun d!164051 () Bool)

(declare-fun res!1072965 () Bool)

(declare-fun e!875414 () Bool)

(assert (=> d!164051 (=> res!1072965 e!875414)))

(assert (=> d!164051 (= res!1072965 (and ((_ is Cons!36752) lt!673370) (= (_1!12698 (h!38199 lt!673370)) key2!21)))))

(assert (=> d!164051 (= (containsKey!868 lt!673370 key2!21) e!875414)))

(declare-fun b!1570304 () Bool)

(declare-fun e!875415 () Bool)

(assert (=> b!1570304 (= e!875414 e!875415)))

(declare-fun res!1072966 () Bool)

(assert (=> b!1570304 (=> (not res!1072966) (not e!875415))))

(assert (=> b!1570304 (= res!1072966 (and (or (not ((_ is Cons!36752) lt!673370)) (bvsle (_1!12698 (h!38199 lt!673370)) key2!21)) ((_ is Cons!36752) lt!673370) (bvslt (_1!12698 (h!38199 lt!673370)) key2!21)))))

(declare-fun b!1570305 () Bool)

(assert (=> b!1570305 (= e!875415 (containsKey!868 (t!51664 lt!673370) key2!21))))

(assert (= (and d!164051 (not res!1072965)) b!1570304))

(assert (= (and b!1570304 res!1072966) b!1570305))

(declare-fun m!1444297 () Bool)

(assert (=> b!1570305 m!1444297))

(assert (=> b!1570093 d!164051))

(declare-fun d!164053 () Bool)

(assert (=> d!164053 (= ($colon$colon!999 e!875268 (ite c!144836 (h!38199 l!750) (tuple2!25375 key2!21 v2!10))) (Cons!36752 (ite c!144836 (h!38199 l!750) (tuple2!25375 key2!21 v2!10)) e!875268))))

(assert (=> bm!72149 d!164053))

(declare-fun d!164055 () Bool)

(declare-fun res!1072967 () Bool)

(declare-fun e!875416 () Bool)

(assert (=> d!164055 (=> res!1072967 e!875416)))

(assert (=> d!164055 (= res!1072967 (and ((_ is Cons!36752) lt!673352) (= (_1!12698 (h!38199 lt!673352)) key1!37)))))

(assert (=> d!164055 (= (containsKey!868 lt!673352 key1!37) e!875416)))

(declare-fun b!1570306 () Bool)

(declare-fun e!875417 () Bool)

(assert (=> b!1570306 (= e!875416 e!875417)))

(declare-fun res!1072968 () Bool)

(assert (=> b!1570306 (=> (not res!1072968) (not e!875417))))

(assert (=> b!1570306 (= res!1072968 (and (or (not ((_ is Cons!36752) lt!673352)) (bvsle (_1!12698 (h!38199 lt!673352)) key1!37)) ((_ is Cons!36752) lt!673352) (bvslt (_1!12698 (h!38199 lt!673352)) key1!37)))))

(declare-fun b!1570307 () Bool)

(assert (=> b!1570307 (= e!875417 (containsKey!868 (t!51664 lt!673352) key1!37))))

(assert (= (and d!164055 (not res!1072967)) b!1570306))

(assert (= (and b!1570306 res!1072968) b!1570307))

(declare-fun m!1444299 () Bool)

(assert (=> b!1570307 m!1444299))

(assert (=> b!1569995 d!164055))

(declare-fun d!164057 () Bool)

(assert (=> d!164057 (= ($colon$colon!999 e!875263 (ite c!144832 (h!38199 (insertStrictlySorted!597 l!750 key1!37 v1!32)) (tuple2!25375 key2!21 v2!10))) (Cons!36752 (ite c!144832 (h!38199 (insertStrictlySorted!597 l!750 key1!37 v1!32)) (tuple2!25375 key2!21 v2!10)) e!875263))))

(assert (=> bm!72146 d!164057))

(declare-fun d!164059 () Bool)

(declare-fun lt!673390 () Bool)

(assert (=> d!164059 (= lt!673390 (select (content!818 lt!673359) (tuple2!25375 key2!21 v2!10)))))

(declare-fun e!875418 () Bool)

(assert (=> d!164059 (= lt!673390 e!875418)))

(declare-fun res!1072970 () Bool)

(assert (=> d!164059 (=> (not res!1072970) (not e!875418))))

(assert (=> d!164059 (= res!1072970 ((_ is Cons!36752) lt!673359))))

(assert (=> d!164059 (= (contains!10427 lt!673359 (tuple2!25375 key2!21 v2!10)) lt!673390)))

(declare-fun b!1570308 () Bool)

(declare-fun e!875419 () Bool)

(assert (=> b!1570308 (= e!875418 e!875419)))

(declare-fun res!1072969 () Bool)

(assert (=> b!1570308 (=> res!1072969 e!875419)))

(assert (=> b!1570308 (= res!1072969 (= (h!38199 lt!673359) (tuple2!25375 key2!21 v2!10)))))

(declare-fun b!1570309 () Bool)

(assert (=> b!1570309 (= e!875419 (contains!10427 (t!51664 lt!673359) (tuple2!25375 key2!21 v2!10)))))

(assert (= (and d!164059 res!1072970) b!1570308))

(assert (= (and b!1570308 (not res!1072969)) b!1570309))

(declare-fun m!1444301 () Bool)

(assert (=> d!164059 m!1444301))

(declare-fun m!1444303 () Bool)

(assert (=> d!164059 m!1444303))

(declare-fun m!1444305 () Bool)

(assert (=> b!1570309 m!1444305))

(assert (=> b!1570048 d!164059))

(declare-fun d!164061 () Bool)

(declare-fun lt!673391 () Bool)

(assert (=> d!164061 (= lt!673391 (select (content!818 lt!673358) (tuple2!25375 key2!21 v2!10)))))

(declare-fun e!875420 () Bool)

(assert (=> d!164061 (= lt!673391 e!875420)))

(declare-fun res!1072972 () Bool)

(assert (=> d!164061 (=> (not res!1072972) (not e!875420))))

(assert (=> d!164061 (= res!1072972 ((_ is Cons!36752) lt!673358))))

(assert (=> d!164061 (= (contains!10427 lt!673358 (tuple2!25375 key2!21 v2!10)) lt!673391)))

(declare-fun b!1570310 () Bool)

(declare-fun e!875421 () Bool)

(assert (=> b!1570310 (= e!875420 e!875421)))

(declare-fun res!1072971 () Bool)

(assert (=> b!1570310 (=> res!1072971 e!875421)))

(assert (=> b!1570310 (= res!1072971 (= (h!38199 lt!673358) (tuple2!25375 key2!21 v2!10)))))

(declare-fun b!1570311 () Bool)

(assert (=> b!1570311 (= e!875421 (contains!10427 (t!51664 lt!673358) (tuple2!25375 key2!21 v2!10)))))

(assert (= (and d!164061 res!1072972) b!1570310))

(assert (= (and b!1570310 (not res!1072971)) b!1570311))

(declare-fun m!1444307 () Bool)

(assert (=> d!164061 m!1444307))

(declare-fun m!1444309 () Bool)

(assert (=> d!164061 m!1444309))

(declare-fun m!1444311 () Bool)

(assert (=> b!1570311 m!1444311))

(assert (=> b!1570038 d!164061))

(declare-fun d!164063 () Bool)

(declare-fun res!1072973 () Bool)

(declare-fun e!875422 () Bool)

(assert (=> d!164063 (=> res!1072973 e!875422)))

(assert (=> d!164063 (= res!1072973 (or ((_ is Nil!36753) lt!673362) ((_ is Nil!36753) (t!51664 lt!673362))))))

(assert (=> d!164063 (= (isStrictlySorted!1020 lt!673362) e!875422)))

(declare-fun b!1570312 () Bool)

(declare-fun e!875423 () Bool)

(assert (=> b!1570312 (= e!875422 e!875423)))

(declare-fun res!1072974 () Bool)

(assert (=> b!1570312 (=> (not res!1072974) (not e!875423))))

(assert (=> b!1570312 (= res!1072974 (bvslt (_1!12698 (h!38199 lt!673362)) (_1!12698 (h!38199 (t!51664 lt!673362)))))))

(declare-fun b!1570313 () Bool)

(assert (=> b!1570313 (= e!875423 (isStrictlySorted!1020 (t!51664 lt!673362)))))

(assert (= (and d!164063 (not res!1072973)) b!1570312))

(assert (= (and b!1570312 res!1072974) b!1570313))

(declare-fun m!1444313 () Bool)

(assert (=> b!1570313 m!1444313))

(assert (=> d!163991 d!164063))

(assert (=> d!163991 d!164031))

(declare-fun d!164065 () Bool)

(declare-fun res!1072975 () Bool)

(declare-fun e!875424 () Bool)

(assert (=> d!164065 (=> res!1072975 e!875424)))

(assert (=> d!164065 (= res!1072975 (and ((_ is Cons!36752) lt!673373) (= (_1!12698 (h!38199 lt!673373)) key1!37)))))

(assert (=> d!164065 (= (containsKey!868 lt!673373 key1!37) e!875424)))

(declare-fun b!1570314 () Bool)

(declare-fun e!875425 () Bool)

(assert (=> b!1570314 (= e!875424 e!875425)))

(declare-fun res!1072976 () Bool)

(assert (=> b!1570314 (=> (not res!1072976) (not e!875425))))

(assert (=> b!1570314 (= res!1072976 (and (or (not ((_ is Cons!36752) lt!673373)) (bvsle (_1!12698 (h!38199 lt!673373)) key1!37)) ((_ is Cons!36752) lt!673373) (bvslt (_1!12698 (h!38199 lt!673373)) key1!37)))))

(declare-fun b!1570315 () Bool)

(assert (=> b!1570315 (= e!875425 (containsKey!868 (t!51664 lt!673373) key1!37))))

(assert (= (and d!164065 (not res!1072975)) b!1570314))

(assert (= (and b!1570314 res!1072976) b!1570315))

(declare-fun m!1444315 () Bool)

(assert (=> b!1570315 m!1444315))

(assert (=> b!1570123 d!164065))

(declare-fun d!164067 () Bool)

(declare-fun res!1072977 () Bool)

(declare-fun e!875426 () Bool)

(assert (=> d!164067 (=> res!1072977 e!875426)))

(assert (=> d!164067 (= res!1072977 (or ((_ is Nil!36753) lt!673358) ((_ is Nil!36753) (t!51664 lt!673358))))))

(assert (=> d!164067 (= (isStrictlySorted!1020 lt!673358) e!875426)))

(declare-fun b!1570316 () Bool)

(declare-fun e!875427 () Bool)

(assert (=> b!1570316 (= e!875426 e!875427)))

(declare-fun res!1072978 () Bool)

(assert (=> b!1570316 (=> (not res!1072978) (not e!875427))))

(assert (=> b!1570316 (= res!1072978 (bvslt (_1!12698 (h!38199 lt!673358)) (_1!12698 (h!38199 (t!51664 lt!673358)))))))

(declare-fun b!1570317 () Bool)

(assert (=> b!1570317 (= e!875427 (isStrictlySorted!1020 (t!51664 lt!673358)))))

(assert (= (and d!164067 (not res!1072977)) b!1570316))

(assert (= (and b!1570316 res!1072978) b!1570317))

(declare-fun m!1444317 () Bool)

(assert (=> b!1570317 m!1444317))

(assert (=> d!163987 d!164067))

(declare-fun d!164069 () Bool)

(declare-fun res!1072979 () Bool)

(declare-fun e!875428 () Bool)

(assert (=> d!164069 (=> res!1072979 e!875428)))

(assert (=> d!164069 (= res!1072979 (or ((_ is Nil!36753) (insertStrictlySorted!597 l!750 key1!37 v1!32)) ((_ is Nil!36753) (t!51664 (insertStrictlySorted!597 l!750 key1!37 v1!32)))))))

(assert (=> d!164069 (= (isStrictlySorted!1020 (insertStrictlySorted!597 l!750 key1!37 v1!32)) e!875428)))

(declare-fun b!1570318 () Bool)

(declare-fun e!875429 () Bool)

(assert (=> b!1570318 (= e!875428 e!875429)))

(declare-fun res!1072980 () Bool)

(assert (=> b!1570318 (=> (not res!1072980) (not e!875429))))

(assert (=> b!1570318 (= res!1072980 (bvslt (_1!12698 (h!38199 (insertStrictlySorted!597 l!750 key1!37 v1!32))) (_1!12698 (h!38199 (t!51664 (insertStrictlySorted!597 l!750 key1!37 v1!32))))))))

(declare-fun b!1570319 () Bool)

(assert (=> b!1570319 (= e!875429 (isStrictlySorted!1020 (t!51664 (insertStrictlySorted!597 l!750 key1!37 v1!32))))))

(assert (= (and d!164069 (not res!1072979)) b!1570318))

(assert (= (and b!1570318 res!1072980) b!1570319))

(assert (=> b!1570319 m!1444287))

(assert (=> d!163987 d!164069))

(declare-fun d!164071 () Bool)

(declare-fun res!1072981 () Bool)

(declare-fun e!875430 () Bool)

(assert (=> d!164071 (=> res!1072981 e!875430)))

(assert (=> d!164071 (= res!1072981 (and ((_ is Cons!36752) lt!673362) (= (_1!12698 (h!38199 lt!673362)) key1!37)))))

(assert (=> d!164071 (= (containsKey!868 lt!673362 key1!37) e!875430)))

(declare-fun b!1570320 () Bool)

(declare-fun e!875431 () Bool)

(assert (=> b!1570320 (= e!875430 e!875431)))

(declare-fun res!1072982 () Bool)

(assert (=> b!1570320 (=> (not res!1072982) (not e!875431))))

(assert (=> b!1570320 (= res!1072982 (and (or (not ((_ is Cons!36752) lt!673362)) (bvsle (_1!12698 (h!38199 lt!673362)) key1!37)) ((_ is Cons!36752) lt!673362) (bvslt (_1!12698 (h!38199 lt!673362)) key1!37)))))

(declare-fun b!1570321 () Bool)

(assert (=> b!1570321 (= e!875431 (containsKey!868 (t!51664 lt!673362) key1!37))))

(assert (= (and d!164071 (not res!1072981)) b!1570320))

(assert (= (and b!1570320 res!1072982) b!1570321))

(declare-fun m!1444319 () Bool)

(assert (=> b!1570321 m!1444319))

(assert (=> b!1570053 d!164071))

(declare-fun d!164073 () Bool)

(declare-fun res!1072983 () Bool)

(declare-fun e!875432 () Bool)

(assert (=> d!164073 (=> res!1072983 e!875432)))

(assert (=> d!164073 (= res!1072983 (or ((_ is Nil!36753) lt!673359) ((_ is Nil!36753) (t!51664 lt!673359))))))

(assert (=> d!164073 (= (isStrictlySorted!1020 lt!673359) e!875432)))

(declare-fun b!1570322 () Bool)

(declare-fun e!875433 () Bool)

(assert (=> b!1570322 (= e!875432 e!875433)))

(declare-fun res!1072984 () Bool)

(assert (=> b!1570322 (=> (not res!1072984) (not e!875433))))

(assert (=> b!1570322 (= res!1072984 (bvslt (_1!12698 (h!38199 lt!673359)) (_1!12698 (h!38199 (t!51664 lt!673359)))))))

(declare-fun b!1570323 () Bool)

(assert (=> b!1570323 (= e!875433 (isStrictlySorted!1020 (t!51664 lt!673359)))))

(assert (= (and d!164073 (not res!1072983)) b!1570322))

(assert (= (and b!1570322 res!1072984) b!1570323))

(declare-fun m!1444321 () Bool)

(assert (=> b!1570323 m!1444321))

(assert (=> d!163989 d!164073))

(assert (=> d!163989 d!164031))

(declare-fun d!164075 () Bool)

(declare-fun res!1072985 () Bool)

(declare-fun e!875434 () Bool)

(assert (=> d!164075 (=> res!1072985 e!875434)))

(assert (=> d!164075 (= res!1072985 (or ((_ is Nil!36753) lt!673376) ((_ is Nil!36753) (t!51664 lt!673376))))))

(assert (=> d!164075 (= (isStrictlySorted!1020 lt!673376) e!875434)))

(declare-fun b!1570324 () Bool)

(declare-fun e!875435 () Bool)

(assert (=> b!1570324 (= e!875434 e!875435)))

(declare-fun res!1072986 () Bool)

(assert (=> b!1570324 (=> (not res!1072986) (not e!875435))))

(assert (=> b!1570324 (= res!1072986 (bvslt (_1!12698 (h!38199 lt!673376)) (_1!12698 (h!38199 (t!51664 lt!673376)))))))

(declare-fun b!1570325 () Bool)

(assert (=> b!1570325 (= e!875435 (isStrictlySorted!1020 (t!51664 lt!673376)))))

(assert (= (and d!164075 (not res!1072985)) b!1570324))

(assert (= (and b!1570324 res!1072986) b!1570325))

(declare-fun m!1444323 () Bool)

(assert (=> b!1570325 m!1444323))

(assert (=> d!164011 d!164075))

(assert (=> d!164011 d!164017))

(declare-fun b!1570326 () Bool)

(declare-fun res!1072987 () Bool)

(declare-fun e!875438 () Bool)

(assert (=> b!1570326 (=> (not res!1072987) (not e!875438))))

(declare-fun lt!673392 () List!36756)

(assert (=> b!1570326 (= res!1072987 (containsKey!868 lt!673392 key2!21))))

(declare-fun b!1570327 () Bool)

(declare-fun c!144922 () Bool)

(assert (=> b!1570327 (= c!144922 (and ((_ is Cons!36752) (t!51664 (t!51664 l!750))) (bvsgt (_1!12698 (h!38199 (t!51664 (t!51664 l!750)))) key2!21)))))

(declare-fun e!875436 () List!36756)

(declare-fun e!875439 () List!36756)

(assert (=> b!1570327 (= e!875436 e!875439)))

(declare-fun b!1570328 () Bool)

(declare-fun call!72215 () List!36756)

(assert (=> b!1570328 (= e!875439 call!72215)))

(declare-fun b!1570330 () Bool)

(declare-fun c!144923 () Bool)

(declare-fun e!875440 () List!36756)

(assert (=> b!1570330 (= e!875440 (ite c!144923 (t!51664 (t!51664 (t!51664 l!750))) (ite c!144922 (Cons!36752 (h!38199 (t!51664 (t!51664 l!750))) (t!51664 (t!51664 (t!51664 l!750)))) Nil!36753)))))

(declare-fun bm!72210 () Bool)

(declare-fun call!72213 () List!36756)

(declare-fun call!72214 () List!36756)

(assert (=> bm!72210 (= call!72213 call!72214)))

(declare-fun bm!72211 () Bool)

(assert (=> bm!72211 (= call!72215 call!72213)))

(declare-fun b!1570331 () Bool)

(assert (=> b!1570331 (= e!875438 (contains!10427 lt!673392 (tuple2!25375 key2!21 v2!10)))))

(declare-fun b!1570332 () Bool)

(assert (=> b!1570332 (= e!875436 call!72213)))

(declare-fun b!1570333 () Bool)

(declare-fun e!875437 () List!36756)

(assert (=> b!1570333 (= e!875437 call!72214)))

(declare-fun c!144920 () Bool)

(declare-fun bm!72212 () Bool)

(assert (=> bm!72212 (= call!72214 ($colon$colon!999 e!875440 (ite c!144920 (h!38199 (t!51664 (t!51664 l!750))) (tuple2!25375 key2!21 v2!10))))))

(declare-fun c!144921 () Bool)

(assert (=> bm!72212 (= c!144921 c!144920)))

(declare-fun b!1570334 () Bool)

(assert (=> b!1570334 (= e!875440 (insertStrictlySorted!597 (t!51664 (t!51664 (t!51664 l!750))) key2!21 v2!10))))

(declare-fun b!1570335 () Bool)

(assert (=> b!1570335 (= e!875439 call!72215)))

(declare-fun d!164077 () Bool)

(assert (=> d!164077 e!875438))

(declare-fun res!1072988 () Bool)

(assert (=> d!164077 (=> (not res!1072988) (not e!875438))))

(assert (=> d!164077 (= res!1072988 (isStrictlySorted!1020 lt!673392))))

(assert (=> d!164077 (= lt!673392 e!875437)))

(assert (=> d!164077 (= c!144920 (and ((_ is Cons!36752) (t!51664 (t!51664 l!750))) (bvslt (_1!12698 (h!38199 (t!51664 (t!51664 l!750)))) key2!21)))))

(assert (=> d!164077 (isStrictlySorted!1020 (t!51664 (t!51664 l!750)))))

(assert (=> d!164077 (= (insertStrictlySorted!597 (t!51664 (t!51664 l!750)) key2!21 v2!10) lt!673392)))

(declare-fun b!1570329 () Bool)

(assert (=> b!1570329 (= e!875437 e!875436)))

(assert (=> b!1570329 (= c!144923 (and ((_ is Cons!36752) (t!51664 (t!51664 l!750))) (= (_1!12698 (h!38199 (t!51664 (t!51664 l!750)))) key2!21)))))

(assert (= (and d!164077 c!144920) b!1570333))

(assert (= (and d!164077 (not c!144920)) b!1570329))

(assert (= (and b!1570329 c!144923) b!1570332))

(assert (= (and b!1570329 (not c!144923)) b!1570327))

(assert (= (and b!1570327 c!144922) b!1570328))

(assert (= (and b!1570327 (not c!144922)) b!1570335))

(assert (= (or b!1570328 b!1570335) bm!72211))

(assert (= (or b!1570332 bm!72211) bm!72210))

(assert (= (or b!1570333 bm!72210) bm!72212))

(assert (= (and bm!72212 c!144921) b!1570334))

(assert (= (and bm!72212 (not c!144921)) b!1570330))

(assert (= (and d!164077 res!1072988) b!1570326))

(assert (= (and b!1570326 res!1072987) b!1570331))

(declare-fun m!1444325 () Bool)

(assert (=> b!1570326 m!1444325))

(declare-fun m!1444327 () Bool)

(assert (=> d!164077 m!1444327))

(assert (=> d!164077 m!1444241))

(declare-fun m!1444329 () Bool)

(assert (=> bm!72212 m!1444329))

(declare-fun m!1444331 () Bool)

(assert (=> b!1570334 m!1444331))

(declare-fun m!1444333 () Bool)

(assert (=> b!1570331 m!1444333))

(assert (=> b!1570101 d!164077))

(declare-fun d!164079 () Bool)

(declare-fun res!1072989 () Bool)

(declare-fun e!875441 () Bool)

(assert (=> d!164079 (=> res!1072989 e!875441)))

(assert (=> d!164079 (= res!1072989 (and ((_ is Cons!36752) lt!673376) (= (_1!12698 (h!38199 lt!673376)) key1!37)))))

(assert (=> d!164079 (= (containsKey!868 lt!673376 key1!37) e!875441)))

(declare-fun b!1570336 () Bool)

(declare-fun e!875442 () Bool)

(assert (=> b!1570336 (= e!875441 e!875442)))

(declare-fun res!1072990 () Bool)

(assert (=> b!1570336 (=> (not res!1072990) (not e!875442))))

(assert (=> b!1570336 (= res!1072990 (and (or (not ((_ is Cons!36752) lt!673376)) (bvsle (_1!12698 (h!38199 lt!673376)) key1!37)) ((_ is Cons!36752) lt!673376) (bvslt (_1!12698 (h!38199 lt!673376)) key1!37)))))

(declare-fun b!1570337 () Bool)

(assert (=> b!1570337 (= e!875442 (containsKey!868 (t!51664 lt!673376) key1!37))))

(assert (= (and d!164079 (not res!1072989)) b!1570336))

(assert (= (and b!1570336 res!1072990) b!1570337))

(declare-fun m!1444335 () Bool)

(assert (=> b!1570337 m!1444335))

(assert (=> b!1570153 d!164079))

(declare-fun d!164081 () Bool)

(assert (=> d!164081 (= ($colon$colon!999 e!875293 (ite c!144856 (h!38199 (t!51664 l!750)) (tuple2!25375 key2!21 v2!10))) (Cons!36752 (ite c!144856 (h!38199 (t!51664 l!750)) (tuple2!25375 key2!21 v2!10)) e!875293))))

(assert (=> bm!72164 d!164081))

(declare-fun d!164083 () Bool)

(assert (=> d!164083 (= ($colon$colon!999 e!875278 (ite c!144844 (h!38199 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32)) (tuple2!25375 key2!21 v2!10))) (Cons!36752 (ite c!144844 (h!38199 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32)) (tuple2!25375 key2!21 v2!10)) e!875278))))

(assert (=> bm!72155 d!164083))

(declare-fun d!164085 () Bool)

(declare-fun res!1072991 () Bool)

(declare-fun e!875443 () Bool)

(assert (=> d!164085 (=> res!1072991 e!875443)))

(assert (=> d!164085 (= res!1072991 (and ((_ is Cons!36752) lt!673358) (= (_1!12698 (h!38199 lt!673358)) key2!21)))))

(assert (=> d!164085 (= (containsKey!868 lt!673358 key2!21) e!875443)))

(declare-fun b!1570338 () Bool)

(declare-fun e!875444 () Bool)

(assert (=> b!1570338 (= e!875443 e!875444)))

(declare-fun res!1072992 () Bool)

(assert (=> b!1570338 (=> (not res!1072992) (not e!875444))))

(assert (=> b!1570338 (= res!1072992 (and (or (not ((_ is Cons!36752) lt!673358)) (bvsle (_1!12698 (h!38199 lt!673358)) key2!21)) ((_ is Cons!36752) lt!673358) (bvslt (_1!12698 (h!38199 lt!673358)) key2!21)))))

(declare-fun b!1570339 () Bool)

(assert (=> b!1570339 (= e!875444 (containsKey!868 (t!51664 lt!673358) key2!21))))

(assert (= (and d!164085 (not res!1072991)) b!1570338))

(assert (= (and b!1570338 res!1072992) b!1570339))

(declare-fun m!1444337 () Bool)

(assert (=> b!1570339 m!1444337))

(assert (=> b!1570033 d!164085))

(declare-fun b!1570340 () Bool)

(declare-fun res!1072993 () Bool)

(declare-fun e!875447 () Bool)

(assert (=> b!1570340 (=> (not res!1072993) (not e!875447))))

(declare-fun lt!673393 () List!36756)

(assert (=> b!1570340 (= res!1072993 (containsKey!868 lt!673393 key2!21))))

(declare-fun b!1570341 () Bool)

(declare-fun c!144926 () Bool)

(assert (=> b!1570341 (= c!144926 (and ((_ is Cons!36752) (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32))) (bvsgt (_1!12698 (h!38199 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32)))) key2!21)))))

(declare-fun e!875445 () List!36756)

(declare-fun e!875448 () List!36756)

(assert (=> b!1570341 (= e!875445 e!875448)))

(declare-fun b!1570342 () Bool)

(declare-fun call!72218 () List!36756)

(assert (=> b!1570342 (= e!875448 call!72218)))

(declare-fun b!1570344 () Bool)

(declare-fun c!144927 () Bool)

(declare-fun e!875449 () List!36756)

(assert (=> b!1570344 (= e!875449 (ite c!144927 (t!51664 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32))) (ite c!144926 (Cons!36752 (h!38199 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32))) (t!51664 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32)))) Nil!36753)))))

(declare-fun bm!72213 () Bool)

(declare-fun call!72216 () List!36756)

(declare-fun call!72217 () List!36756)

(assert (=> bm!72213 (= call!72216 call!72217)))

(declare-fun bm!72214 () Bool)

(assert (=> bm!72214 (= call!72218 call!72216)))

(declare-fun b!1570345 () Bool)

(assert (=> b!1570345 (= e!875447 (contains!10427 lt!673393 (tuple2!25375 key2!21 v2!10)))))

(declare-fun b!1570346 () Bool)

(assert (=> b!1570346 (= e!875445 call!72216)))

(declare-fun b!1570347 () Bool)

(declare-fun e!875446 () List!36756)

(assert (=> b!1570347 (= e!875446 call!72217)))

(declare-fun c!144924 () Bool)

(declare-fun bm!72215 () Bool)

(assert (=> bm!72215 (= call!72217 ($colon$colon!999 e!875449 (ite c!144924 (h!38199 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32))) (tuple2!25375 key2!21 v2!10))))))

(declare-fun c!144925 () Bool)

(assert (=> bm!72215 (= c!144925 c!144924)))

(declare-fun b!1570348 () Bool)

(assert (=> b!1570348 (= e!875449 (insertStrictlySorted!597 (t!51664 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32))) key2!21 v2!10))))

(declare-fun b!1570349 () Bool)

(assert (=> b!1570349 (= e!875448 call!72218)))

(declare-fun d!164087 () Bool)

(assert (=> d!164087 e!875447))

(declare-fun res!1072994 () Bool)

(assert (=> d!164087 (=> (not res!1072994) (not e!875447))))

(assert (=> d!164087 (= res!1072994 (isStrictlySorted!1020 lt!673393))))

(assert (=> d!164087 (= lt!673393 e!875446)))

(assert (=> d!164087 (= c!144924 (and ((_ is Cons!36752) (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32))) (bvslt (_1!12698 (h!38199 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32)))) key2!21)))))

(assert (=> d!164087 (isStrictlySorted!1020 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32)))))

(assert (=> d!164087 (= (insertStrictlySorted!597 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32)) key2!21 v2!10) lt!673393)))

(declare-fun b!1570343 () Bool)

(assert (=> b!1570343 (= e!875446 e!875445)))

(assert (=> b!1570343 (= c!144927 (and ((_ is Cons!36752) (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32))) (= (_1!12698 (h!38199 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32)))) key2!21)))))

(assert (= (and d!164087 c!144924) b!1570347))

(assert (= (and d!164087 (not c!144924)) b!1570343))

(assert (= (and b!1570343 c!144927) b!1570346))

(assert (= (and b!1570343 (not c!144927)) b!1570341))

(assert (= (and b!1570341 c!144926) b!1570342))

(assert (= (and b!1570341 (not c!144926)) b!1570349))

(assert (= (or b!1570342 b!1570349) bm!72214))

(assert (= (or b!1570346 bm!72214) bm!72213))

(assert (= (or b!1570347 bm!72213) bm!72215))

(assert (= (and bm!72215 c!144925) b!1570348))

(assert (= (and bm!72215 (not c!144925)) b!1570344))

(assert (= (and d!164087 res!1072994) b!1570340))

(assert (= (and b!1570340 res!1072993) b!1570345))

(declare-fun m!1444339 () Bool)

(assert (=> b!1570340 m!1444339))

(declare-fun m!1444341 () Bool)

(assert (=> d!164087 m!1444341))

(declare-fun m!1444343 () Bool)

(assert (=> d!164087 m!1444343))

(declare-fun m!1444345 () Bool)

(assert (=> bm!72215 m!1444345))

(declare-fun m!1444347 () Bool)

(assert (=> b!1570348 m!1444347))

(declare-fun m!1444349 () Bool)

(assert (=> b!1570345 m!1444349))

(assert (=> b!1570071 d!164087))

(declare-fun d!164089 () Bool)

(assert (=> d!164089 (= ($colon$colon!999 e!875244 (ite c!144820 (h!38199 (insertStrictlySorted!597 l!750 key2!21 v2!10)) (tuple2!25375 key1!37 v1!32))) (Cons!36752 (ite c!144820 (h!38199 (insertStrictlySorted!597 l!750 key2!21 v2!10)) (tuple2!25375 key1!37 v1!32)) e!875244))))

(assert (=> bm!72137 d!164089))

(declare-fun b!1570350 () Bool)

(declare-fun res!1072995 () Bool)

(declare-fun e!875452 () Bool)

(assert (=> b!1570350 (=> (not res!1072995) (not e!875452))))

(declare-fun lt!673394 () List!36756)

(assert (=> b!1570350 (= res!1072995 (containsKey!868 lt!673394 key1!37))))

(declare-fun b!1570351 () Bool)

(declare-fun c!144930 () Bool)

(assert (=> b!1570351 (= c!144930 (and ((_ is Cons!36752) (t!51664 (insertStrictlySorted!597 l!750 key2!21 v2!10))) (bvsgt (_1!12698 (h!38199 (t!51664 (insertStrictlySorted!597 l!750 key2!21 v2!10)))) key1!37)))))

(declare-fun e!875450 () List!36756)

(declare-fun e!875453 () List!36756)

(assert (=> b!1570351 (= e!875450 e!875453)))

(declare-fun b!1570352 () Bool)

(declare-fun call!72221 () List!36756)

(assert (=> b!1570352 (= e!875453 call!72221)))

(declare-fun b!1570354 () Bool)

(declare-fun e!875454 () List!36756)

(declare-fun c!144931 () Bool)

(assert (=> b!1570354 (= e!875454 (ite c!144931 (t!51664 (t!51664 (insertStrictlySorted!597 l!750 key2!21 v2!10))) (ite c!144930 (Cons!36752 (h!38199 (t!51664 (insertStrictlySorted!597 l!750 key2!21 v2!10))) (t!51664 (t!51664 (insertStrictlySorted!597 l!750 key2!21 v2!10)))) Nil!36753)))))

(declare-fun bm!72216 () Bool)

(declare-fun call!72219 () List!36756)

(declare-fun call!72220 () List!36756)

(assert (=> bm!72216 (= call!72219 call!72220)))

(declare-fun bm!72217 () Bool)

(assert (=> bm!72217 (= call!72221 call!72219)))

(declare-fun b!1570355 () Bool)

(assert (=> b!1570355 (= e!875452 (contains!10427 lt!673394 (tuple2!25375 key1!37 v1!32)))))

(declare-fun b!1570356 () Bool)

(assert (=> b!1570356 (= e!875450 call!72219)))

(declare-fun b!1570357 () Bool)

(declare-fun e!875451 () List!36756)

(assert (=> b!1570357 (= e!875451 call!72220)))

(declare-fun bm!72218 () Bool)

(declare-fun c!144928 () Bool)

(assert (=> bm!72218 (= call!72220 ($colon$colon!999 e!875454 (ite c!144928 (h!38199 (t!51664 (insertStrictlySorted!597 l!750 key2!21 v2!10))) (tuple2!25375 key1!37 v1!32))))))

(declare-fun c!144929 () Bool)

(assert (=> bm!72218 (= c!144929 c!144928)))

(declare-fun b!1570358 () Bool)

(assert (=> b!1570358 (= e!875454 (insertStrictlySorted!597 (t!51664 (t!51664 (insertStrictlySorted!597 l!750 key2!21 v2!10))) key1!37 v1!32))))

(declare-fun b!1570359 () Bool)

(assert (=> b!1570359 (= e!875453 call!72221)))

(declare-fun d!164091 () Bool)

(assert (=> d!164091 e!875452))

(declare-fun res!1072996 () Bool)

(assert (=> d!164091 (=> (not res!1072996) (not e!875452))))

(assert (=> d!164091 (= res!1072996 (isStrictlySorted!1020 lt!673394))))

(assert (=> d!164091 (= lt!673394 e!875451)))

(assert (=> d!164091 (= c!144928 (and ((_ is Cons!36752) (t!51664 (insertStrictlySorted!597 l!750 key2!21 v2!10))) (bvslt (_1!12698 (h!38199 (t!51664 (insertStrictlySorted!597 l!750 key2!21 v2!10)))) key1!37)))))

(assert (=> d!164091 (isStrictlySorted!1020 (t!51664 (insertStrictlySorted!597 l!750 key2!21 v2!10)))))

(assert (=> d!164091 (= (insertStrictlySorted!597 (t!51664 (insertStrictlySorted!597 l!750 key2!21 v2!10)) key1!37 v1!32) lt!673394)))

(declare-fun b!1570353 () Bool)

(assert (=> b!1570353 (= e!875451 e!875450)))

(assert (=> b!1570353 (= c!144931 (and ((_ is Cons!36752) (t!51664 (insertStrictlySorted!597 l!750 key2!21 v2!10))) (= (_1!12698 (h!38199 (t!51664 (insertStrictlySorted!597 l!750 key2!21 v2!10)))) key1!37)))))

(assert (= (and d!164091 c!144928) b!1570357))

(assert (= (and d!164091 (not c!144928)) b!1570353))

(assert (= (and b!1570353 c!144931) b!1570356))

(assert (= (and b!1570353 (not c!144931)) b!1570351))

(assert (= (and b!1570351 c!144930) b!1570352))

(assert (= (and b!1570351 (not c!144930)) b!1570359))

(assert (= (or b!1570352 b!1570359) bm!72217))

(assert (= (or b!1570356 bm!72217) bm!72216))

(assert (= (or b!1570357 bm!72216) bm!72218))

(assert (= (and bm!72218 c!144929) b!1570358))

(assert (= (and bm!72218 (not c!144929)) b!1570354))

(assert (= (and d!164091 res!1072996) b!1570350))

(assert (= (and b!1570350 res!1072995) b!1570355))

(declare-fun m!1444351 () Bool)

(assert (=> b!1570350 m!1444351))

(declare-fun m!1444353 () Bool)

(assert (=> d!164091 m!1444353))

(declare-fun m!1444355 () Bool)

(assert (=> d!164091 m!1444355))

(declare-fun m!1444357 () Bool)

(assert (=> bm!72218 m!1444357))

(declare-fun m!1444359 () Bool)

(assert (=> b!1570358 m!1444359))

(declare-fun m!1444361 () Bool)

(assert (=> b!1570355 m!1444361))

(assert (=> b!1570003 d!164091))

(declare-fun d!164093 () Bool)

(declare-fun res!1072997 () Bool)

(declare-fun e!875455 () Bool)

(assert (=> d!164093 (=> res!1072997 e!875455)))

(assert (=> d!164093 (= res!1072997 (and ((_ is Cons!36752) lt!673359) (= (_1!12698 (h!38199 lt!673359)) key2!21)))))

(assert (=> d!164093 (= (containsKey!868 lt!673359 key2!21) e!875455)))

(declare-fun b!1570360 () Bool)

(declare-fun e!875456 () Bool)

(assert (=> b!1570360 (= e!875455 e!875456)))

(declare-fun res!1072998 () Bool)

(assert (=> b!1570360 (=> (not res!1072998) (not e!875456))))

(assert (=> b!1570360 (= res!1072998 (and (or (not ((_ is Cons!36752) lt!673359)) (bvsle (_1!12698 (h!38199 lt!673359)) key2!21)) ((_ is Cons!36752) lt!673359) (bvslt (_1!12698 (h!38199 lt!673359)) key2!21)))))

(declare-fun b!1570361 () Bool)

(assert (=> b!1570361 (= e!875456 (containsKey!868 (t!51664 lt!673359) key2!21))))

(assert (= (and d!164093 (not res!1072997)) b!1570360))

(assert (= (and b!1570360 res!1072998) b!1570361))

(declare-fun m!1444363 () Bool)

(assert (=> b!1570361 m!1444363))

(assert (=> b!1570043 d!164093))

(declare-fun lt!673395 () Bool)

(declare-fun d!164095 () Bool)

(assert (=> d!164095 (= lt!673395 (select (content!818 lt!673370) (tuple2!25375 key2!21 v2!10)))))

(declare-fun e!875457 () Bool)

(assert (=> d!164095 (= lt!673395 e!875457)))

(declare-fun res!1073000 () Bool)

(assert (=> d!164095 (=> (not res!1073000) (not e!875457))))

(assert (=> d!164095 (= res!1073000 ((_ is Cons!36752) lt!673370))))

(assert (=> d!164095 (= (contains!10427 lt!673370 (tuple2!25375 key2!21 v2!10)) lt!673395)))

(declare-fun b!1570362 () Bool)

(declare-fun e!875458 () Bool)

(assert (=> b!1570362 (= e!875457 e!875458)))

(declare-fun res!1072999 () Bool)

(assert (=> b!1570362 (=> res!1072999 e!875458)))

(assert (=> b!1570362 (= res!1072999 (= (h!38199 lt!673370) (tuple2!25375 key2!21 v2!10)))))

(declare-fun b!1570363 () Bool)

(assert (=> b!1570363 (= e!875458 (contains!10427 (t!51664 lt!673370) (tuple2!25375 key2!21 v2!10)))))

(assert (= (and d!164095 res!1073000) b!1570362))

(assert (= (and b!1570362 (not res!1072999)) b!1570363))

(declare-fun m!1444365 () Bool)

(assert (=> d!164095 m!1444365))

(declare-fun m!1444367 () Bool)

(assert (=> d!164095 m!1444367))

(declare-fun m!1444369 () Bool)

(assert (=> b!1570363 m!1444369))

(assert (=> b!1570098 d!164095))

(declare-fun b!1570364 () Bool)

(declare-fun res!1073001 () Bool)

(declare-fun e!875461 () Bool)

(assert (=> b!1570364 (=> (not res!1073001) (not e!875461))))

(declare-fun lt!673396 () List!36756)

(assert (=> b!1570364 (= res!1073001 (containsKey!868 lt!673396 key1!37))))

(declare-fun c!144934 () Bool)

(declare-fun b!1570365 () Bool)

(assert (=> b!1570365 (= c!144934 (and ((_ is Cons!36752) (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10))) (bvsgt (_1!12698 (h!38199 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10)))) key1!37)))))

(declare-fun e!875459 () List!36756)

(declare-fun e!875462 () List!36756)

(assert (=> b!1570365 (= e!875459 e!875462)))

(declare-fun b!1570366 () Bool)

(declare-fun call!72224 () List!36756)

(assert (=> b!1570366 (= e!875462 call!72224)))

(declare-fun e!875463 () List!36756)

(declare-fun c!144935 () Bool)

(declare-fun b!1570368 () Bool)

(assert (=> b!1570368 (= e!875463 (ite c!144935 (t!51664 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10))) (ite c!144934 (Cons!36752 (h!38199 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10))) (t!51664 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10)))) Nil!36753)))))

(declare-fun bm!72219 () Bool)

(declare-fun call!72222 () List!36756)

(declare-fun call!72223 () List!36756)

(assert (=> bm!72219 (= call!72222 call!72223)))

(declare-fun bm!72220 () Bool)

(assert (=> bm!72220 (= call!72224 call!72222)))

(declare-fun b!1570369 () Bool)

(assert (=> b!1570369 (= e!875461 (contains!10427 lt!673396 (tuple2!25375 key1!37 v1!32)))))

(declare-fun b!1570370 () Bool)

(assert (=> b!1570370 (= e!875459 call!72222)))

(declare-fun b!1570371 () Bool)

(declare-fun e!875460 () List!36756)

(assert (=> b!1570371 (= e!875460 call!72223)))

(declare-fun c!144932 () Bool)

(declare-fun bm!72221 () Bool)

(assert (=> bm!72221 (= call!72223 ($colon$colon!999 e!875463 (ite c!144932 (h!38199 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10))) (tuple2!25375 key1!37 v1!32))))))

(declare-fun c!144933 () Bool)

(assert (=> bm!72221 (= c!144933 c!144932)))

(declare-fun b!1570372 () Bool)

(assert (=> b!1570372 (= e!875463 (insertStrictlySorted!597 (t!51664 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10))) key1!37 v1!32))))

(declare-fun b!1570373 () Bool)

(assert (=> b!1570373 (= e!875462 call!72224)))

(declare-fun d!164097 () Bool)

(assert (=> d!164097 e!875461))

(declare-fun res!1073002 () Bool)

(assert (=> d!164097 (=> (not res!1073002) (not e!875461))))

(assert (=> d!164097 (= res!1073002 (isStrictlySorted!1020 lt!673396))))

(assert (=> d!164097 (= lt!673396 e!875460)))

(assert (=> d!164097 (= c!144932 (and ((_ is Cons!36752) (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10))) (bvslt (_1!12698 (h!38199 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10)))) key1!37)))))

(assert (=> d!164097 (isStrictlySorted!1020 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10)))))

(assert (=> d!164097 (= (insertStrictlySorted!597 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10)) key1!37 v1!32) lt!673396)))

(declare-fun b!1570367 () Bool)

(assert (=> b!1570367 (= e!875460 e!875459)))

(assert (=> b!1570367 (= c!144935 (and ((_ is Cons!36752) (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10))) (= (_1!12698 (h!38199 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10)))) key1!37)))))

(assert (= (and d!164097 c!144932) b!1570371))

(assert (= (and d!164097 (not c!144932)) b!1570367))

(assert (= (and b!1570367 c!144935) b!1570370))

(assert (= (and b!1570367 (not c!144935)) b!1570365))

(assert (= (and b!1570365 c!144934) b!1570366))

(assert (= (and b!1570365 (not c!144934)) b!1570373))

(assert (= (or b!1570366 b!1570373) bm!72220))

(assert (= (or b!1570370 bm!72220) bm!72219))

(assert (= (or b!1570371 bm!72219) bm!72221))

(assert (= (and bm!72221 c!144933) b!1570372))

(assert (= (and bm!72221 (not c!144933)) b!1570368))

(assert (= (and d!164097 res!1073002) b!1570364))

(assert (= (and b!1570364 res!1073001) b!1570369))

(declare-fun m!1444371 () Bool)

(assert (=> b!1570364 m!1444371))

(declare-fun m!1444373 () Bool)

(assert (=> d!164097 m!1444373))

(assert (=> d!164097 m!1444269))

(declare-fun m!1444375 () Bool)

(assert (=> bm!72221 m!1444375))

(declare-fun m!1444377 () Bool)

(assert (=> b!1570372 m!1444377))

(declare-fun m!1444379 () Bool)

(assert (=> b!1570369 m!1444379))

(assert (=> b!1570131 d!164097))

(declare-fun d!164099 () Bool)

(declare-fun res!1073003 () Bool)

(declare-fun e!875464 () Bool)

(assert (=> d!164099 (=> res!1073003 e!875464)))

(assert (=> d!164099 (= res!1073003 (or ((_ is Nil!36753) lt!673352) ((_ is Nil!36753) (t!51664 lt!673352))))))

(assert (=> d!164099 (= (isStrictlySorted!1020 lt!673352) e!875464)))

(declare-fun b!1570374 () Bool)

(declare-fun e!875465 () Bool)

(assert (=> b!1570374 (= e!875464 e!875465)))

(declare-fun res!1073004 () Bool)

(assert (=> b!1570374 (=> (not res!1073004) (not e!875465))))

(assert (=> b!1570374 (= res!1073004 (bvslt (_1!12698 (h!38199 lt!673352)) (_1!12698 (h!38199 (t!51664 lt!673352)))))))

(declare-fun b!1570375 () Bool)

(assert (=> b!1570375 (= e!875465 (isStrictlySorted!1020 (t!51664 lt!673352)))))

(assert (= (and d!164099 (not res!1073003)) b!1570374))

(assert (= (and b!1570374 res!1073004) b!1570375))

(declare-fun m!1444381 () Bool)

(assert (=> b!1570375 m!1444381))

(assert (=> d!163973 d!164099))

(declare-fun d!164101 () Bool)

(declare-fun res!1073005 () Bool)

(declare-fun e!875466 () Bool)

(assert (=> d!164101 (=> res!1073005 e!875466)))

(assert (=> d!164101 (= res!1073005 (or ((_ is Nil!36753) (insertStrictlySorted!597 l!750 key2!21 v2!10)) ((_ is Nil!36753) (t!51664 (insertStrictlySorted!597 l!750 key2!21 v2!10)))))))

(assert (=> d!164101 (= (isStrictlySorted!1020 (insertStrictlySorted!597 l!750 key2!21 v2!10)) e!875466)))

(declare-fun b!1570376 () Bool)

(declare-fun e!875467 () Bool)

(assert (=> b!1570376 (= e!875466 e!875467)))

(declare-fun res!1073006 () Bool)

(assert (=> b!1570376 (=> (not res!1073006) (not e!875467))))

(assert (=> b!1570376 (= res!1073006 (bvslt (_1!12698 (h!38199 (insertStrictlySorted!597 l!750 key2!21 v2!10))) (_1!12698 (h!38199 (t!51664 (insertStrictlySorted!597 l!750 key2!21 v2!10))))))))

(declare-fun b!1570377 () Bool)

(assert (=> b!1570377 (= e!875467 (isStrictlySorted!1020 (t!51664 (insertStrictlySorted!597 l!750 key2!21 v2!10))))))

(assert (= (and d!164101 (not res!1073005)) b!1570376))

(assert (= (and b!1570376 res!1073006) b!1570377))

(assert (=> b!1570377 m!1444355))

(assert (=> d!163973 d!164101))

(declare-fun d!164103 () Bool)

(assert (=> d!164103 (= ($colon$colon!999 e!875308 (ite c!144868 (h!38199 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10)) (tuple2!25375 key1!37 v1!32))) (Cons!36752 (ite c!144868 (h!38199 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10)) (tuple2!25375 key1!37 v1!32)) e!875308))))

(assert (=> bm!72173 d!164103))

(assert (=> b!1570061 d!164011))

(declare-fun lt!673397 () Bool)

(declare-fun d!164105 () Bool)

(assert (=> d!164105 (= lt!673397 (select (content!818 lt!673367) (tuple2!25375 key2!21 v2!10)))))

(declare-fun e!875468 () Bool)

(assert (=> d!164105 (= lt!673397 e!875468)))

(declare-fun res!1073008 () Bool)

(assert (=> d!164105 (=> (not res!1073008) (not e!875468))))

(assert (=> d!164105 (= res!1073008 ((_ is Cons!36752) lt!673367))))

(assert (=> d!164105 (= (contains!10427 lt!673367 (tuple2!25375 key2!21 v2!10)) lt!673397)))

(declare-fun b!1570378 () Bool)

(declare-fun e!875469 () Bool)

(assert (=> b!1570378 (= e!875468 e!875469)))

(declare-fun res!1073007 () Bool)

(assert (=> b!1570378 (=> res!1073007 e!875469)))

(assert (=> b!1570378 (= res!1073007 (= (h!38199 lt!673367) (tuple2!25375 key2!21 v2!10)))))

(declare-fun b!1570379 () Bool)

(assert (=> b!1570379 (= e!875469 (contains!10427 (t!51664 lt!673367) (tuple2!25375 key2!21 v2!10)))))

(assert (= (and d!164105 res!1073008) b!1570378))

(assert (= (and b!1570378 (not res!1073007)) b!1570379))

(declare-fun m!1444383 () Bool)

(assert (=> d!164105 m!1444383))

(declare-fun m!1444385 () Bool)

(assert (=> d!164105 m!1444385))

(declare-fun m!1444387 () Bool)

(assert (=> b!1570379 m!1444387))

(assert (=> b!1570068 d!164105))

(declare-fun d!164107 () Bool)

(assert (=> d!164107 (= ($colon$colon!999 e!875273 (ite c!144840 (h!38199 l!750) (tuple2!25375 key1!37 v1!32))) (Cons!36752 (ite c!144840 (h!38199 l!750) (tuple2!25375 key1!37 v1!32)) e!875273))))

(assert (=> bm!72152 d!164107))

(declare-fun d!164109 () Bool)

(declare-fun lt!673398 () Bool)

(assert (=> d!164109 (= lt!673398 (select (content!818 lt!673352) (tuple2!25375 key1!37 v1!32)))))

(declare-fun e!875470 () Bool)

(assert (=> d!164109 (= lt!673398 e!875470)))

(declare-fun res!1073010 () Bool)

(assert (=> d!164109 (=> (not res!1073010) (not e!875470))))

(assert (=> d!164109 (= res!1073010 ((_ is Cons!36752) lt!673352))))

(assert (=> d!164109 (= (contains!10427 lt!673352 (tuple2!25375 key1!37 v1!32)) lt!673398)))

(declare-fun b!1570380 () Bool)

(declare-fun e!875471 () Bool)

(assert (=> b!1570380 (= e!875470 e!875471)))

(declare-fun res!1073009 () Bool)

(assert (=> b!1570380 (=> res!1073009 e!875471)))

(assert (=> b!1570380 (= res!1073009 (= (h!38199 lt!673352) (tuple2!25375 key1!37 v1!32)))))

(declare-fun b!1570381 () Bool)

(assert (=> b!1570381 (= e!875471 (contains!10427 (t!51664 lt!673352) (tuple2!25375 key1!37 v1!32)))))

(assert (= (and d!164109 res!1073010) b!1570380))

(assert (= (and b!1570380 (not res!1073009)) b!1570381))

(declare-fun m!1444389 () Bool)

(assert (=> d!164109 m!1444389))

(declare-fun m!1444391 () Bool)

(assert (=> d!164109 m!1444391))

(declare-fun m!1444393 () Bool)

(assert (=> b!1570381 m!1444393))

(assert (=> b!1570000 d!164109))

(declare-fun d!164111 () Bool)

(declare-fun res!1073011 () Bool)

(declare-fun e!875472 () Bool)

(assert (=> d!164111 (=> res!1073011 e!875472)))

(assert (=> d!164111 (= res!1073011 (or ((_ is Nil!36753) lt!673370) ((_ is Nil!36753) (t!51664 lt!673370))))))

(assert (=> d!164111 (= (isStrictlySorted!1020 lt!673370) e!875472)))

(declare-fun b!1570382 () Bool)

(declare-fun e!875473 () Bool)

(assert (=> b!1570382 (= e!875472 e!875473)))

(declare-fun res!1073012 () Bool)

(assert (=> b!1570382 (=> (not res!1073012) (not e!875473))))

(assert (=> b!1570382 (= res!1073012 (bvslt (_1!12698 (h!38199 lt!673370)) (_1!12698 (h!38199 (t!51664 lt!673370)))))))

(declare-fun b!1570383 () Bool)

(assert (=> b!1570383 (= e!875473 (isStrictlySorted!1020 (t!51664 lt!673370)))))

(assert (= (and d!164111 (not res!1073011)) b!1570382))

(assert (= (and b!1570382 res!1073012) b!1570383))

(declare-fun m!1444395 () Bool)

(assert (=> b!1570383 m!1444395))

(assert (=> d!163999 d!164111))

(assert (=> d!163999 d!164017))

(declare-fun d!164113 () Bool)

(declare-fun lt!673399 () Bool)

(assert (=> d!164113 (= lt!673399 (select (content!818 lt!673373) (tuple2!25375 key1!37 v1!32)))))

(declare-fun e!875474 () Bool)

(assert (=> d!164113 (= lt!673399 e!875474)))

(declare-fun res!1073014 () Bool)

(assert (=> d!164113 (=> (not res!1073014) (not e!875474))))

(assert (=> d!164113 (= res!1073014 ((_ is Cons!36752) lt!673373))))

(assert (=> d!164113 (= (contains!10427 lt!673373 (tuple2!25375 key1!37 v1!32)) lt!673399)))

(declare-fun b!1570384 () Bool)

(declare-fun e!875475 () Bool)

(assert (=> b!1570384 (= e!875474 e!875475)))

(declare-fun res!1073013 () Bool)

(assert (=> b!1570384 (=> res!1073013 e!875475)))

(assert (=> b!1570384 (= res!1073013 (= (h!38199 lt!673373) (tuple2!25375 key1!37 v1!32)))))

(declare-fun b!1570385 () Bool)

(assert (=> b!1570385 (= e!875475 (contains!10427 (t!51664 lt!673373) (tuple2!25375 key1!37 v1!32)))))

(assert (= (and d!164113 res!1073014) b!1570384))

(assert (= (and b!1570384 (not res!1073013)) b!1570385))

(declare-fun m!1444397 () Bool)

(assert (=> d!164113 m!1444397))

(declare-fun m!1444399 () Bool)

(assert (=> d!164113 m!1444399))

(declare-fun m!1444401 () Bool)

(assert (=> b!1570385 m!1444401))

(assert (=> b!1570128 d!164113))

(declare-fun b!1570386 () Bool)

(declare-fun res!1073015 () Bool)

(declare-fun e!875478 () Bool)

(assert (=> b!1570386 (=> (not res!1073015) (not e!875478))))

(declare-fun lt!673400 () List!36756)

(assert (=> b!1570386 (= res!1073015 (containsKey!868 lt!673400 key1!37))))

(declare-fun b!1570387 () Bool)

(declare-fun c!144938 () Bool)

(assert (=> b!1570387 (= c!144938 (and ((_ is Cons!36752) (t!51664 (t!51664 l!750))) (bvsgt (_1!12698 (h!38199 (t!51664 (t!51664 l!750)))) key1!37)))))

(declare-fun e!875476 () List!36756)

(declare-fun e!875479 () List!36756)

(assert (=> b!1570387 (= e!875476 e!875479)))

(declare-fun b!1570388 () Bool)

(declare-fun call!72227 () List!36756)

(assert (=> b!1570388 (= e!875479 call!72227)))

(declare-fun b!1570390 () Bool)

(declare-fun c!144939 () Bool)

(declare-fun e!875480 () List!36756)

(assert (=> b!1570390 (= e!875480 (ite c!144939 (t!51664 (t!51664 (t!51664 l!750))) (ite c!144938 (Cons!36752 (h!38199 (t!51664 (t!51664 l!750))) (t!51664 (t!51664 (t!51664 l!750)))) Nil!36753)))))

(declare-fun bm!72222 () Bool)

(declare-fun call!72225 () List!36756)

(declare-fun call!72226 () List!36756)

(assert (=> bm!72222 (= call!72225 call!72226)))

(declare-fun bm!72223 () Bool)

(assert (=> bm!72223 (= call!72227 call!72225)))

(declare-fun b!1570391 () Bool)

(assert (=> b!1570391 (= e!875478 (contains!10427 lt!673400 (tuple2!25375 key1!37 v1!32)))))

(declare-fun b!1570392 () Bool)

(assert (=> b!1570392 (= e!875476 call!72225)))

(declare-fun b!1570393 () Bool)

(declare-fun e!875477 () List!36756)

(assert (=> b!1570393 (= e!875477 call!72226)))

(declare-fun bm!72224 () Bool)

(declare-fun c!144936 () Bool)

(assert (=> bm!72224 (= call!72226 ($colon$colon!999 e!875480 (ite c!144936 (h!38199 (t!51664 (t!51664 l!750))) (tuple2!25375 key1!37 v1!32))))))

(declare-fun c!144937 () Bool)

(assert (=> bm!72224 (= c!144937 c!144936)))

(declare-fun b!1570394 () Bool)

(assert (=> b!1570394 (= e!875480 (insertStrictlySorted!597 (t!51664 (t!51664 (t!51664 l!750))) key1!37 v1!32))))

(declare-fun b!1570395 () Bool)

(assert (=> b!1570395 (= e!875479 call!72227)))

(declare-fun d!164115 () Bool)

(assert (=> d!164115 e!875478))

(declare-fun res!1073016 () Bool)

(assert (=> d!164115 (=> (not res!1073016) (not e!875478))))

(assert (=> d!164115 (= res!1073016 (isStrictlySorted!1020 lt!673400))))

(assert (=> d!164115 (= lt!673400 e!875477)))

(assert (=> d!164115 (= c!144936 (and ((_ is Cons!36752) (t!51664 (t!51664 l!750))) (bvslt (_1!12698 (h!38199 (t!51664 (t!51664 l!750)))) key1!37)))))

(assert (=> d!164115 (isStrictlySorted!1020 (t!51664 (t!51664 l!750)))))

(assert (=> d!164115 (= (insertStrictlySorted!597 (t!51664 (t!51664 l!750)) key1!37 v1!32) lt!673400)))

(declare-fun b!1570389 () Bool)

(assert (=> b!1570389 (= e!875477 e!875476)))

(assert (=> b!1570389 (= c!144939 (and ((_ is Cons!36752) (t!51664 (t!51664 l!750))) (= (_1!12698 (h!38199 (t!51664 (t!51664 l!750)))) key1!37)))))

(assert (= (and d!164115 c!144936) b!1570393))

(assert (= (and d!164115 (not c!144936)) b!1570389))

(assert (= (and b!1570389 c!144939) b!1570392))

(assert (= (and b!1570389 (not c!144939)) b!1570387))

(assert (= (and b!1570387 c!144938) b!1570388))

(assert (= (and b!1570387 (not c!144938)) b!1570395))

(assert (= (or b!1570388 b!1570395) bm!72223))

(assert (= (or b!1570392 bm!72223) bm!72222))

(assert (= (or b!1570393 bm!72222) bm!72224))

(assert (= (and bm!72224 c!144937) b!1570394))

(assert (= (and bm!72224 (not c!144937)) b!1570390))

(assert (= (and d!164115 res!1073016) b!1570386))

(assert (= (and b!1570386 res!1073015) b!1570391))

(declare-fun m!1444403 () Bool)

(assert (=> b!1570386 m!1444403))

(declare-fun m!1444405 () Bool)

(assert (=> d!164115 m!1444405))

(assert (=> d!164115 m!1444241))

(declare-fun m!1444407 () Bool)

(assert (=> bm!72224 m!1444407))

(declare-fun m!1444409 () Bool)

(assert (=> b!1570394 m!1444409))

(declare-fun m!1444411 () Bool)

(assert (=> b!1570391 m!1444411))

(assert (=> b!1570161 d!164115))

(declare-fun d!164117 () Bool)

(declare-fun res!1073017 () Bool)

(declare-fun e!875481 () Bool)

(assert (=> d!164117 (=> res!1073017 e!875481)))

(assert (=> d!164117 (= res!1073017 (or ((_ is Nil!36753) (t!51664 (t!51664 l!750))) ((_ is Nil!36753) (t!51664 (t!51664 (t!51664 l!750))))))))

(assert (=> d!164117 (= (isStrictlySorted!1020 (t!51664 (t!51664 l!750))) e!875481)))

(declare-fun b!1570396 () Bool)

(declare-fun e!875482 () Bool)

(assert (=> b!1570396 (= e!875481 e!875482)))

(declare-fun res!1073018 () Bool)

(assert (=> b!1570396 (=> (not res!1073018) (not e!875482))))

(assert (=> b!1570396 (= res!1073018 (bvslt (_1!12698 (h!38199 (t!51664 (t!51664 l!750)))) (_1!12698 (h!38199 (t!51664 (t!51664 (t!51664 l!750)))))))))

(declare-fun b!1570397 () Bool)

(assert (=> b!1570397 (= e!875482 (isStrictlySorted!1020 (t!51664 (t!51664 (t!51664 l!750)))))))

(assert (= (and d!164117 (not res!1073017)) b!1570396))

(assert (= (and b!1570396 res!1073018) b!1570397))

(declare-fun m!1444413 () Bool)

(assert (=> b!1570397 m!1444413))

(assert (=> b!1570228 d!164117))

(declare-fun d!164119 () Bool)

(declare-fun res!1073019 () Bool)

(declare-fun e!875483 () Bool)

(assert (=> d!164119 (=> res!1073019 e!875483)))

(assert (=> d!164119 (= res!1073019 (or ((_ is Nil!36753) lt!673367) ((_ is Nil!36753) (t!51664 lt!673367))))))

(assert (=> d!164119 (= (isStrictlySorted!1020 lt!673367) e!875483)))

(declare-fun b!1570398 () Bool)

(declare-fun e!875484 () Bool)

(assert (=> b!1570398 (= e!875483 e!875484)))

(declare-fun res!1073020 () Bool)

(assert (=> b!1570398 (=> (not res!1073020) (not e!875484))))

(assert (=> b!1570398 (= res!1073020 (bvslt (_1!12698 (h!38199 lt!673367)) (_1!12698 (h!38199 (t!51664 lt!673367)))))))

(declare-fun b!1570399 () Bool)

(assert (=> b!1570399 (= e!875484 (isStrictlySorted!1020 (t!51664 lt!673367)))))

(assert (= (and d!164119 (not res!1073019)) b!1570398))

(assert (= (and b!1570398 res!1073020) b!1570399))

(declare-fun m!1444415 () Bool)

(assert (=> b!1570399 m!1444415))

(assert (=> d!163993 d!164119))

(declare-fun d!164121 () Bool)

(declare-fun res!1073021 () Bool)

(declare-fun e!875485 () Bool)

(assert (=> d!164121 (=> res!1073021 e!875485)))

(assert (=> d!164121 (= res!1073021 (or ((_ is Nil!36753) (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32)) ((_ is Nil!36753) (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32)))))))

(assert (=> d!164121 (= (isStrictlySorted!1020 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32)) e!875485)))

(declare-fun b!1570400 () Bool)

(declare-fun e!875486 () Bool)

(assert (=> b!1570400 (= e!875485 e!875486)))

(declare-fun res!1073022 () Bool)

(assert (=> b!1570400 (=> (not res!1073022) (not e!875486))))

(assert (=> b!1570400 (= res!1073022 (bvslt (_1!12698 (h!38199 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32))) (_1!12698 (h!38199 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32))))))))

(declare-fun b!1570401 () Bool)

(assert (=> b!1570401 (= e!875486 (isStrictlySorted!1020 (t!51664 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32))))))

(assert (= (and d!164121 (not res!1073021)) b!1570400))

(assert (= (and b!1570400 res!1073022) b!1570401))

(assert (=> b!1570401 m!1444343))

(assert (=> d!163993 d!164121))

(declare-fun d!164123 () Bool)

(assert (=> d!164123 (= (insertStrictlySorted!597 (insertStrictlySorted!597 (t!51664 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!597 (insertStrictlySorted!597 (t!51664 l!750) key2!21 v2!10) key1!37 v1!32))))

(assert (=> d!164123 true))

(declare-fun _$5!161 () Unit!52098)

(assert (=> d!164123 (= (choose!2084 (t!51664 l!750) key1!37 v1!32 key2!21 v2!10) _$5!161)))

(declare-fun bs!45229 () Bool)

(assert (= bs!45229 d!164123))

(assert (=> bs!45229 m!1443965))

(assert (=> bs!45229 m!1443965))

(assert (=> bs!45229 m!1443967))

(assert (=> bs!45229 m!1443963))

(assert (=> bs!45229 m!1443963))

(assert (=> bs!45229 m!1443979))

(assert (=> d!163981 d!164123))

(assert (=> d!163981 d!163993))

(assert (=> d!163981 d!163999))

(assert (=> d!163981 d!164005))

(assert (=> d!163981 d!164011))

(declare-fun d!164125 () Bool)

(assert (=> d!164125 (= ($colon$colon!999 e!875323 (ite c!144880 (h!38199 (t!51664 l!750)) (tuple2!25375 key1!37 v1!32))) (Cons!36752 (ite c!144880 (h!38199 (t!51664 l!750)) (tuple2!25375 key1!37 v1!32)) e!875323))))

(assert (=> bm!72182 d!164125))

(assert (=> b!1570250 d!164017))

(declare-fun b!1570402 () Bool)

(declare-fun e!875487 () Bool)

(declare-fun tp!114226 () Bool)

(assert (=> b!1570402 (= e!875487 (and tp_is_empty!39099 tp!114226))))

(assert (=> b!1570255 (= tp!114219 e!875487)))

(assert (= (and b!1570255 ((_ is Cons!36752) (t!51664 (t!51664 l!750)))) b!1570402))

(check-sat (not b!1570379) (not b!1570383) (not b!1570394) (not d!164097) (not d!164113) (not b!1570309) (not b!1570277) (not bm!72218) (not b!1570334) (not b!1570340) (not b!1570331) (not d!164087) (not b!1570303) (not d!164059) (not b!1570315) (not b!1570402) (not b!1570385) (not b!1570377) (not b!1570321) tp_is_empty!39099 (not b!1570391) (not b!1570296) (not b!1570397) (not b!1570317) (not b!1570279) (not b!1570287) (not b!1570369) (not b!1570339) (not b!1570305) (not b!1570401) (not b!1570361) (not bm!72221) (not d!164115) (not d!164061) (not d!164109) (not b!1570350) (not b!1570363) (not b!1570355) (not b!1570364) (not b!1570399) (not b!1570386) (not d!164091) (not b!1570372) (not d!164095) (not bm!72212) (not d!164077) (not d!164047) (not b!1570285) (not d!164043) (not b!1570307) (not b!1570311) (not b!1570381) (not b!1570358) (not b!1570325) (not bm!72224) (not b!1570293) (not b!1570337) (not b!1570348) (not b!1570375) (not d!164123) (not b!1570345) (not d!164045) (not b!1570288) (not bm!72215) (not b!1570313) (not b!1570326) (not b!1570323) (not bm!72209) (not d!164105) (not b!1570319))
(check-sat)
