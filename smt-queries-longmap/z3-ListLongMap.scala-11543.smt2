; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134362 () Bool)

(assert start!134362)

(declare-datatypes ((B!2494 0))(
  ( (B!2495 (val!19609 Int)) )
))
(declare-fun v2!10 () B!2494)

(declare-fun e!874651 () Bool)

(declare-datatypes ((tuple2!25320 0))(
  ( (tuple2!25321 (_1!12671 (_ BitVec 64)) (_2!12671 B!2494)) )
))
(declare-datatypes ((List!36729 0))(
  ( (Nil!36726) (Cons!36725 (h!38172 tuple2!25320) (t!51637 List!36729)) )
))
(declare-fun l!750 () List!36729)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun b!1568999 () Bool)

(declare-fun isStrictlySorted!1002 (List!36729) Bool)

(declare-fun insertStrictlySorted!588 (List!36729 (_ BitVec 64) B!2494) List!36729)

(assert (=> b!1568999 (= e!874651 (not (isStrictlySorted!1002 (insertStrictlySorted!588 l!750 key2!21 v2!10))))))

(declare-fun v1!32 () B!2494)

(declare-fun key1!37 () (_ BitVec 64))

(assert (=> b!1568999 (= (insertStrictlySorted!588 (insertStrictlySorted!588 (t!51637 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!588 (insertStrictlySorted!588 (t!51637 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-datatypes ((Unit!52092 0))(
  ( (Unit!52093) )
))
(declare-fun lt!673264 () Unit!52092)

(declare-fun lemmaInsertStrictlySortedCommutative!14 (List!36729 (_ BitVec 64) B!2494 (_ BitVec 64) B!2494) Unit!52092)

(assert (=> b!1568999 (= lt!673264 (lemmaInsertStrictlySortedCommutative!14 (t!51637 l!750) key1!37 v1!32 key2!21 v2!10))))

(declare-fun b!1569000 () Bool)

(declare-fun res!1072455 () Bool)

(assert (=> b!1569000 (=> (not res!1072455) (not e!874651))))

(assert (=> b!1569000 (= res!1072455 (isStrictlySorted!1002 (t!51637 l!750)))))

(declare-fun b!1569001 () Bool)

(declare-fun e!874652 () Bool)

(declare-fun tp_is_empty!39045 () Bool)

(declare-fun tp!114078 () Bool)

(assert (=> b!1569001 (= e!874652 (and tp_is_empty!39045 tp!114078))))

(declare-fun b!1569003 () Bool)

(declare-fun res!1072452 () Bool)

(assert (=> b!1569003 (=> (not res!1072452) (not e!874651))))

(assert (=> b!1569003 (= res!1072452 (isStrictlySorted!1002 l!750))))

(declare-fun res!1072454 () Bool)

(assert (=> start!134362 (=> (not res!1072454) (not e!874651))))

(assert (=> start!134362 (= res!1072454 (not (= key1!37 key2!21)))))

(assert (=> start!134362 e!874651))

(assert (=> start!134362 tp_is_empty!39045))

(assert (=> start!134362 e!874652))

(assert (=> start!134362 true))

(declare-fun b!1569002 () Bool)

(declare-fun res!1072453 () Bool)

(assert (=> b!1569002 (=> (not res!1072453) (not e!874651))))

(get-info :version)

(assert (=> b!1569002 (= res!1072453 (and ((_ is Cons!36725) l!750) (bvslt (_1!12671 (h!38172 l!750)) key1!37) (bvslt (_1!12671 (h!38172 l!750)) key2!21)))))

(assert (= (and start!134362 res!1072454) b!1569003))

(assert (= (and b!1569003 res!1072452) b!1569002))

(assert (= (and b!1569002 res!1072453) b!1569000))

(assert (= (and b!1569000 res!1072455) b!1568999))

(assert (= (and start!134362 ((_ is Cons!36725) l!750)) b!1569001))

(declare-fun m!1443529 () Bool)

(assert (=> b!1568999 m!1443529))

(declare-fun m!1443531 () Bool)

(assert (=> b!1568999 m!1443531))

(declare-fun m!1443533 () Bool)

(assert (=> b!1568999 m!1443533))

(assert (=> b!1568999 m!1443531))

(declare-fun m!1443535 () Bool)

(assert (=> b!1568999 m!1443535))

(declare-fun m!1443537 () Bool)

(assert (=> b!1568999 m!1443537))

(declare-fun m!1443539 () Bool)

(assert (=> b!1568999 m!1443539))

(assert (=> b!1568999 m!1443537))

(assert (=> b!1568999 m!1443529))

(declare-fun m!1443541 () Bool)

(assert (=> b!1568999 m!1443541))

(declare-fun m!1443543 () Bool)

(assert (=> b!1569000 m!1443543))

(declare-fun m!1443545 () Bool)

(assert (=> b!1569003 m!1443545))

(check-sat (not b!1569000) (not b!1569003) (not b!1569001) (not b!1568999) tp_is_empty!39045)
(check-sat)
(get-model)

(declare-fun d!163817 () Bool)

(assert (=> d!163817 (= (insertStrictlySorted!588 (insertStrictlySorted!588 (t!51637 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!588 (insertStrictlySorted!588 (t!51637 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-fun lt!673270 () Unit!52092)

(declare-fun choose!2081 (List!36729 (_ BitVec 64) B!2494 (_ BitVec 64) B!2494) Unit!52092)

(assert (=> d!163817 (= lt!673270 (choose!2081 (t!51637 l!750) key1!37 v1!32 key2!21 v2!10))))

(assert (=> d!163817 (not (= key1!37 key2!21))))

(assert (=> d!163817 (= (lemmaInsertStrictlySortedCommutative!14 (t!51637 l!750) key1!37 v1!32 key2!21 v2!10) lt!673270)))

(declare-fun bs!45196 () Bool)

(assert (= bs!45196 d!163817))

(assert (=> bs!45196 m!1443529))

(assert (=> bs!45196 m!1443541))

(assert (=> bs!45196 m!1443531))

(assert (=> bs!45196 m!1443529))

(declare-fun m!1443565 () Bool)

(assert (=> bs!45196 m!1443565))

(assert (=> bs!45196 m!1443531))

(assert (=> bs!45196 m!1443533))

(assert (=> b!1568999 d!163817))

(declare-fun e!874679 () List!36729)

(declare-fun b!1569047 () Bool)

(assert (=> b!1569047 (= e!874679 (insertStrictlySorted!588 (t!51637 l!750) key2!21 v2!10))))

(declare-fun d!163821 () Bool)

(declare-fun e!874680 () Bool)

(assert (=> d!163821 e!874680))

(declare-fun res!1072481 () Bool)

(assert (=> d!163821 (=> (not res!1072481) (not e!874680))))

(declare-fun lt!673279 () List!36729)

(assert (=> d!163821 (= res!1072481 (isStrictlySorted!1002 lt!673279))))

(declare-fun e!874678 () List!36729)

(assert (=> d!163821 (= lt!673279 e!874678)))

(declare-fun c!144630 () Bool)

(assert (=> d!163821 (= c!144630 (and ((_ is Cons!36725) l!750) (bvslt (_1!12671 (h!38172 l!750)) key2!21)))))

(assert (=> d!163821 (isStrictlySorted!1002 l!750)))

(assert (=> d!163821 (= (insertStrictlySorted!588 l!750 key2!21 v2!10) lt!673279)))

(declare-fun b!1569048 () Bool)

(declare-fun contains!10418 (List!36729 tuple2!25320) Bool)

(assert (=> b!1569048 (= e!874680 (contains!10418 lt!673279 (tuple2!25321 key2!21 v2!10)))))

(declare-fun b!1569049 () Bool)

(declare-fun e!874681 () List!36729)

(declare-fun call!72011 () List!36729)

(assert (=> b!1569049 (= e!874681 call!72011)))

(declare-fun b!1569050 () Bool)

(declare-fun res!1072480 () Bool)

(assert (=> b!1569050 (=> (not res!1072480) (not e!874680))))

(declare-fun containsKey!860 (List!36729 (_ BitVec 64)) Bool)

(assert (=> b!1569050 (= res!1072480 (containsKey!860 lt!673279 key2!21))))

(declare-fun c!144629 () Bool)

(declare-fun c!144628 () Bool)

(declare-fun b!1569051 () Bool)

(assert (=> b!1569051 (= e!874679 (ite c!144629 (t!51637 l!750) (ite c!144628 (Cons!36725 (h!38172 l!750) (t!51637 l!750)) Nil!36726)))))

(declare-fun b!1569052 () Bool)

(declare-fun e!874677 () List!36729)

(declare-fun call!72010 () List!36729)

(assert (=> b!1569052 (= e!874677 call!72010)))

(declare-fun bm!72006 () Bool)

(assert (=> bm!72006 (= call!72011 call!72010)))

(declare-fun bm!72007 () Bool)

(declare-fun call!72009 () List!36729)

(declare-fun $colon$colon!991 (List!36729 tuple2!25320) List!36729)

(assert (=> bm!72007 (= call!72009 ($colon$colon!991 e!874679 (ite c!144630 (h!38172 l!750) (tuple2!25321 key2!21 v2!10))))))

(declare-fun c!144627 () Bool)

(assert (=> bm!72007 (= c!144627 c!144630)))

(declare-fun b!1569053 () Bool)

(assert (=> b!1569053 (= e!874681 call!72011)))

(declare-fun b!1569054 () Bool)

(assert (=> b!1569054 (= c!144628 (and ((_ is Cons!36725) l!750) (bvsgt (_1!12671 (h!38172 l!750)) key2!21)))))

(assert (=> b!1569054 (= e!874677 e!874681)))

(declare-fun b!1569055 () Bool)

(assert (=> b!1569055 (= e!874678 call!72009)))

(declare-fun b!1569056 () Bool)

(assert (=> b!1569056 (= e!874678 e!874677)))

(assert (=> b!1569056 (= c!144629 (and ((_ is Cons!36725) l!750) (= (_1!12671 (h!38172 l!750)) key2!21)))))

(declare-fun bm!72008 () Bool)

(assert (=> bm!72008 (= call!72010 call!72009)))

(assert (= (and d!163821 c!144630) b!1569055))

(assert (= (and d!163821 (not c!144630)) b!1569056))

(assert (= (and b!1569056 c!144629) b!1569052))

(assert (= (and b!1569056 (not c!144629)) b!1569054))

(assert (= (and b!1569054 c!144628) b!1569053))

(assert (= (and b!1569054 (not c!144628)) b!1569049))

(assert (= (or b!1569053 b!1569049) bm!72006))

(assert (= (or b!1569052 bm!72006) bm!72008))

(assert (= (or b!1569055 bm!72008) bm!72007))

(assert (= (and bm!72007 c!144627) b!1569047))

(assert (= (and bm!72007 (not c!144627)) b!1569051))

(assert (= (and d!163821 res!1072481) b!1569050))

(assert (= (and b!1569050 res!1072480) b!1569048))

(declare-fun m!1443573 () Bool)

(assert (=> bm!72007 m!1443573))

(declare-fun m!1443575 () Bool)

(assert (=> b!1569050 m!1443575))

(declare-fun m!1443577 () Bool)

(assert (=> d!163821 m!1443577))

(assert (=> d!163821 m!1443545))

(declare-fun m!1443579 () Bool)

(assert (=> b!1569048 m!1443579))

(assert (=> b!1569047 m!1443529))

(assert (=> b!1568999 d!163821))

(declare-fun b!1569065 () Bool)

(declare-fun e!874688 () List!36729)

(assert (=> b!1569065 (= e!874688 (insertStrictlySorted!588 (t!51637 (insertStrictlySorted!588 (t!51637 l!750) key1!37 v1!32)) key2!21 v2!10))))

(declare-fun d!163833 () Bool)

(declare-fun e!874689 () Bool)

(assert (=> d!163833 e!874689))

(declare-fun res!1072483 () Bool)

(assert (=> d!163833 (=> (not res!1072483) (not e!874689))))

(declare-fun lt!673282 () List!36729)

(assert (=> d!163833 (= res!1072483 (isStrictlySorted!1002 lt!673282))))

(declare-fun e!874687 () List!36729)

(assert (=> d!163833 (= lt!673282 e!874687)))

(declare-fun c!144638 () Bool)

(assert (=> d!163833 (= c!144638 (and ((_ is Cons!36725) (insertStrictlySorted!588 (t!51637 l!750) key1!37 v1!32)) (bvslt (_1!12671 (h!38172 (insertStrictlySorted!588 (t!51637 l!750) key1!37 v1!32))) key2!21)))))

(assert (=> d!163833 (isStrictlySorted!1002 (insertStrictlySorted!588 (t!51637 l!750) key1!37 v1!32))))

(assert (=> d!163833 (= (insertStrictlySorted!588 (insertStrictlySorted!588 (t!51637 l!750) key1!37 v1!32) key2!21 v2!10) lt!673282)))

(declare-fun b!1569066 () Bool)

(assert (=> b!1569066 (= e!874689 (contains!10418 lt!673282 (tuple2!25321 key2!21 v2!10)))))

(declare-fun b!1569067 () Bool)

(declare-fun e!874690 () List!36729)

(declare-fun call!72014 () List!36729)

(assert (=> b!1569067 (= e!874690 call!72014)))

(declare-fun b!1569068 () Bool)

(declare-fun res!1072482 () Bool)

(assert (=> b!1569068 (=> (not res!1072482) (not e!874689))))

(assert (=> b!1569068 (= res!1072482 (containsKey!860 lt!673282 key2!21))))

(declare-fun c!144637 () Bool)

(declare-fun c!144636 () Bool)

(declare-fun b!1569069 () Bool)

(assert (=> b!1569069 (= e!874688 (ite c!144637 (t!51637 (insertStrictlySorted!588 (t!51637 l!750) key1!37 v1!32)) (ite c!144636 (Cons!36725 (h!38172 (insertStrictlySorted!588 (t!51637 l!750) key1!37 v1!32)) (t!51637 (insertStrictlySorted!588 (t!51637 l!750) key1!37 v1!32))) Nil!36726)))))

(declare-fun b!1569070 () Bool)

(declare-fun e!874686 () List!36729)

(declare-fun call!72013 () List!36729)

(assert (=> b!1569070 (= e!874686 call!72013)))

(declare-fun bm!72009 () Bool)

(assert (=> bm!72009 (= call!72014 call!72013)))

(declare-fun call!72012 () List!36729)

(declare-fun bm!72010 () Bool)

(assert (=> bm!72010 (= call!72012 ($colon$colon!991 e!874688 (ite c!144638 (h!38172 (insertStrictlySorted!588 (t!51637 l!750) key1!37 v1!32)) (tuple2!25321 key2!21 v2!10))))))

(declare-fun c!144635 () Bool)

(assert (=> bm!72010 (= c!144635 c!144638)))

(declare-fun b!1569071 () Bool)

(assert (=> b!1569071 (= e!874690 call!72014)))

(declare-fun b!1569072 () Bool)

(assert (=> b!1569072 (= c!144636 (and ((_ is Cons!36725) (insertStrictlySorted!588 (t!51637 l!750) key1!37 v1!32)) (bvsgt (_1!12671 (h!38172 (insertStrictlySorted!588 (t!51637 l!750) key1!37 v1!32))) key2!21)))))

(assert (=> b!1569072 (= e!874686 e!874690)))

(declare-fun b!1569073 () Bool)

(assert (=> b!1569073 (= e!874687 call!72012)))

(declare-fun b!1569074 () Bool)

(assert (=> b!1569074 (= e!874687 e!874686)))

(assert (=> b!1569074 (= c!144637 (and ((_ is Cons!36725) (insertStrictlySorted!588 (t!51637 l!750) key1!37 v1!32)) (= (_1!12671 (h!38172 (insertStrictlySorted!588 (t!51637 l!750) key1!37 v1!32))) key2!21)))))

(declare-fun bm!72011 () Bool)

(assert (=> bm!72011 (= call!72013 call!72012)))

(assert (= (and d!163833 c!144638) b!1569073))

(assert (= (and d!163833 (not c!144638)) b!1569074))

(assert (= (and b!1569074 c!144637) b!1569070))

(assert (= (and b!1569074 (not c!144637)) b!1569072))

(assert (= (and b!1569072 c!144636) b!1569071))

(assert (= (and b!1569072 (not c!144636)) b!1569067))

(assert (= (or b!1569071 b!1569067) bm!72009))

(assert (= (or b!1569070 bm!72009) bm!72011))

(assert (= (or b!1569073 bm!72011) bm!72010))

(assert (= (and bm!72010 c!144635) b!1569065))

(assert (= (and bm!72010 (not c!144635)) b!1569069))

(assert (= (and d!163833 res!1072483) b!1569068))

(assert (= (and b!1569068 res!1072482) b!1569066))

(declare-fun m!1443581 () Bool)

(assert (=> bm!72010 m!1443581))

(declare-fun m!1443583 () Bool)

(assert (=> b!1569068 m!1443583))

(declare-fun m!1443585 () Bool)

(assert (=> d!163833 m!1443585))

(assert (=> d!163833 m!1443531))

(declare-fun m!1443587 () Bool)

(assert (=> d!163833 m!1443587))

(declare-fun m!1443589 () Bool)

(assert (=> b!1569066 m!1443589))

(declare-fun m!1443591 () Bool)

(assert (=> b!1569065 m!1443591))

(assert (=> b!1568999 d!163833))

(declare-fun b!1569091 () Bool)

(declare-fun e!874701 () List!36729)

(assert (=> b!1569091 (= e!874701 (insertStrictlySorted!588 (t!51637 (t!51637 l!750)) key2!21 v2!10))))

(declare-fun d!163835 () Bool)

(declare-fun e!874702 () Bool)

(assert (=> d!163835 e!874702))

(declare-fun res!1072485 () Bool)

(assert (=> d!163835 (=> (not res!1072485) (not e!874702))))

(declare-fun lt!673285 () List!36729)

(assert (=> d!163835 (= res!1072485 (isStrictlySorted!1002 lt!673285))))

(declare-fun e!874700 () List!36729)

(assert (=> d!163835 (= lt!673285 e!874700)))

(declare-fun c!144650 () Bool)

(assert (=> d!163835 (= c!144650 (and ((_ is Cons!36725) (t!51637 l!750)) (bvslt (_1!12671 (h!38172 (t!51637 l!750))) key2!21)))))

(assert (=> d!163835 (isStrictlySorted!1002 (t!51637 l!750))))

(assert (=> d!163835 (= (insertStrictlySorted!588 (t!51637 l!750) key2!21 v2!10) lt!673285)))

(declare-fun b!1569092 () Bool)

(assert (=> b!1569092 (= e!874702 (contains!10418 lt!673285 (tuple2!25321 key2!21 v2!10)))))

(declare-fun b!1569093 () Bool)

(declare-fun e!874703 () List!36729)

(declare-fun call!72023 () List!36729)

(assert (=> b!1569093 (= e!874703 call!72023)))

(declare-fun b!1569094 () Bool)

(declare-fun res!1072484 () Bool)

(assert (=> b!1569094 (=> (not res!1072484) (not e!874702))))

(assert (=> b!1569094 (= res!1072484 (containsKey!860 lt!673285 key2!21))))

(declare-fun c!144649 () Bool)

(declare-fun c!144648 () Bool)

(declare-fun b!1569095 () Bool)

(assert (=> b!1569095 (= e!874701 (ite c!144649 (t!51637 (t!51637 l!750)) (ite c!144648 (Cons!36725 (h!38172 (t!51637 l!750)) (t!51637 (t!51637 l!750))) Nil!36726)))))

(declare-fun b!1569096 () Bool)

(declare-fun e!874699 () List!36729)

(declare-fun call!72022 () List!36729)

(assert (=> b!1569096 (= e!874699 call!72022)))

(declare-fun bm!72018 () Bool)

(assert (=> bm!72018 (= call!72023 call!72022)))

(declare-fun bm!72019 () Bool)

(declare-fun call!72021 () List!36729)

(assert (=> bm!72019 (= call!72021 ($colon$colon!991 e!874701 (ite c!144650 (h!38172 (t!51637 l!750)) (tuple2!25321 key2!21 v2!10))))))

(declare-fun c!144647 () Bool)

(assert (=> bm!72019 (= c!144647 c!144650)))

(declare-fun b!1569097 () Bool)

(assert (=> b!1569097 (= e!874703 call!72023)))

(declare-fun b!1569098 () Bool)

(assert (=> b!1569098 (= c!144648 (and ((_ is Cons!36725) (t!51637 l!750)) (bvsgt (_1!12671 (h!38172 (t!51637 l!750))) key2!21)))))

(assert (=> b!1569098 (= e!874699 e!874703)))

(declare-fun b!1569099 () Bool)

(assert (=> b!1569099 (= e!874700 call!72021)))

(declare-fun b!1569100 () Bool)

(assert (=> b!1569100 (= e!874700 e!874699)))

(assert (=> b!1569100 (= c!144649 (and ((_ is Cons!36725) (t!51637 l!750)) (= (_1!12671 (h!38172 (t!51637 l!750))) key2!21)))))

(declare-fun bm!72020 () Bool)

(assert (=> bm!72020 (= call!72022 call!72021)))

(assert (= (and d!163835 c!144650) b!1569099))

(assert (= (and d!163835 (not c!144650)) b!1569100))

(assert (= (and b!1569100 c!144649) b!1569096))

(assert (= (and b!1569100 (not c!144649)) b!1569098))

(assert (= (and b!1569098 c!144648) b!1569097))

(assert (= (and b!1569098 (not c!144648)) b!1569093))

(assert (= (or b!1569097 b!1569093) bm!72018))

(assert (= (or b!1569096 bm!72018) bm!72020))

(assert (= (or b!1569099 bm!72020) bm!72019))

(assert (= (and bm!72019 c!144647) b!1569091))

(assert (= (and bm!72019 (not c!144647)) b!1569095))

(assert (= (and d!163835 res!1072485) b!1569094))

(assert (= (and b!1569094 res!1072484) b!1569092))

(declare-fun m!1443593 () Bool)

(assert (=> bm!72019 m!1443593))

(declare-fun m!1443595 () Bool)

(assert (=> b!1569094 m!1443595))

(declare-fun m!1443597 () Bool)

(assert (=> d!163835 m!1443597))

(assert (=> d!163835 m!1443543))

(declare-fun m!1443599 () Bool)

(assert (=> b!1569092 m!1443599))

(declare-fun m!1443601 () Bool)

(assert (=> b!1569091 m!1443601))

(assert (=> b!1568999 d!163835))

(declare-fun d!163837 () Bool)

(declare-fun res!1072498 () Bool)

(declare-fun e!874716 () Bool)

(assert (=> d!163837 (=> res!1072498 e!874716)))

(assert (=> d!163837 (= res!1072498 (or ((_ is Nil!36726) (insertStrictlySorted!588 l!750 key2!21 v2!10)) ((_ is Nil!36726) (t!51637 (insertStrictlySorted!588 l!750 key2!21 v2!10)))))))

(assert (=> d!163837 (= (isStrictlySorted!1002 (insertStrictlySorted!588 l!750 key2!21 v2!10)) e!874716)))

(declare-fun b!1569121 () Bool)

(declare-fun e!874717 () Bool)

(assert (=> b!1569121 (= e!874716 e!874717)))

(declare-fun res!1072499 () Bool)

(assert (=> b!1569121 (=> (not res!1072499) (not e!874717))))

(assert (=> b!1569121 (= res!1072499 (bvslt (_1!12671 (h!38172 (insertStrictlySorted!588 l!750 key2!21 v2!10))) (_1!12671 (h!38172 (t!51637 (insertStrictlySorted!588 l!750 key2!21 v2!10))))))))

(declare-fun b!1569122 () Bool)

(assert (=> b!1569122 (= e!874717 (isStrictlySorted!1002 (t!51637 (insertStrictlySorted!588 l!750 key2!21 v2!10))))))

(assert (= (and d!163837 (not res!1072498)) b!1569121))

(assert (= (and b!1569121 res!1072499) b!1569122))

(declare-fun m!1443603 () Bool)

(assert (=> b!1569122 m!1443603))

(assert (=> b!1568999 d!163837))

(declare-fun e!874720 () List!36729)

(declare-fun b!1569123 () Bool)

(assert (=> b!1569123 (= e!874720 (insertStrictlySorted!588 (t!51637 (insertStrictlySorted!588 (t!51637 l!750) key2!21 v2!10)) key1!37 v1!32))))

(declare-fun d!163839 () Bool)

(declare-fun e!874721 () Bool)

(assert (=> d!163839 e!874721))

(declare-fun res!1072501 () Bool)

(assert (=> d!163839 (=> (not res!1072501) (not e!874721))))

(declare-fun lt!673286 () List!36729)

(assert (=> d!163839 (= res!1072501 (isStrictlySorted!1002 lt!673286))))

(declare-fun e!874719 () List!36729)

(assert (=> d!163839 (= lt!673286 e!874719)))

(declare-fun c!144658 () Bool)

(assert (=> d!163839 (= c!144658 (and ((_ is Cons!36725) (insertStrictlySorted!588 (t!51637 l!750) key2!21 v2!10)) (bvslt (_1!12671 (h!38172 (insertStrictlySorted!588 (t!51637 l!750) key2!21 v2!10))) key1!37)))))

(assert (=> d!163839 (isStrictlySorted!1002 (insertStrictlySorted!588 (t!51637 l!750) key2!21 v2!10))))

(assert (=> d!163839 (= (insertStrictlySorted!588 (insertStrictlySorted!588 (t!51637 l!750) key2!21 v2!10) key1!37 v1!32) lt!673286)))

(declare-fun b!1569124 () Bool)

(assert (=> b!1569124 (= e!874721 (contains!10418 lt!673286 (tuple2!25321 key1!37 v1!32)))))

(declare-fun b!1569125 () Bool)

(declare-fun e!874722 () List!36729)

(declare-fun call!72032 () List!36729)

(assert (=> b!1569125 (= e!874722 call!72032)))

(declare-fun b!1569126 () Bool)

(declare-fun res!1072500 () Bool)

(assert (=> b!1569126 (=> (not res!1072500) (not e!874721))))

(assert (=> b!1569126 (= res!1072500 (containsKey!860 lt!673286 key1!37))))

(declare-fun b!1569127 () Bool)

(declare-fun c!144656 () Bool)

(declare-fun c!144657 () Bool)

(assert (=> b!1569127 (= e!874720 (ite c!144657 (t!51637 (insertStrictlySorted!588 (t!51637 l!750) key2!21 v2!10)) (ite c!144656 (Cons!36725 (h!38172 (insertStrictlySorted!588 (t!51637 l!750) key2!21 v2!10)) (t!51637 (insertStrictlySorted!588 (t!51637 l!750) key2!21 v2!10))) Nil!36726)))))

(declare-fun b!1569128 () Bool)

(declare-fun e!874718 () List!36729)

(declare-fun call!72031 () List!36729)

(assert (=> b!1569128 (= e!874718 call!72031)))

(declare-fun bm!72027 () Bool)

(assert (=> bm!72027 (= call!72032 call!72031)))

(declare-fun bm!72028 () Bool)

(declare-fun call!72030 () List!36729)

(assert (=> bm!72028 (= call!72030 ($colon$colon!991 e!874720 (ite c!144658 (h!38172 (insertStrictlySorted!588 (t!51637 l!750) key2!21 v2!10)) (tuple2!25321 key1!37 v1!32))))))

(declare-fun c!144655 () Bool)

(assert (=> bm!72028 (= c!144655 c!144658)))

(declare-fun b!1569129 () Bool)

(assert (=> b!1569129 (= e!874722 call!72032)))

(declare-fun b!1569130 () Bool)

(assert (=> b!1569130 (= c!144656 (and ((_ is Cons!36725) (insertStrictlySorted!588 (t!51637 l!750) key2!21 v2!10)) (bvsgt (_1!12671 (h!38172 (insertStrictlySorted!588 (t!51637 l!750) key2!21 v2!10))) key1!37)))))

(assert (=> b!1569130 (= e!874718 e!874722)))

(declare-fun b!1569131 () Bool)

(assert (=> b!1569131 (= e!874719 call!72030)))

(declare-fun b!1569132 () Bool)

(assert (=> b!1569132 (= e!874719 e!874718)))

(assert (=> b!1569132 (= c!144657 (and ((_ is Cons!36725) (insertStrictlySorted!588 (t!51637 l!750) key2!21 v2!10)) (= (_1!12671 (h!38172 (insertStrictlySorted!588 (t!51637 l!750) key2!21 v2!10))) key1!37)))))

(declare-fun bm!72029 () Bool)

(assert (=> bm!72029 (= call!72031 call!72030)))

(assert (= (and d!163839 c!144658) b!1569131))

(assert (= (and d!163839 (not c!144658)) b!1569132))

(assert (= (and b!1569132 c!144657) b!1569128))

(assert (= (and b!1569132 (not c!144657)) b!1569130))

(assert (= (and b!1569130 c!144656) b!1569129))

(assert (= (and b!1569130 (not c!144656)) b!1569125))

(assert (= (or b!1569129 b!1569125) bm!72027))

(assert (= (or b!1569128 bm!72027) bm!72029))

(assert (= (or b!1569131 bm!72029) bm!72028))

(assert (= (and bm!72028 c!144655) b!1569123))

(assert (= (and bm!72028 (not c!144655)) b!1569127))

(assert (= (and d!163839 res!1072501) b!1569126))

(assert (= (and b!1569126 res!1072500) b!1569124))

(declare-fun m!1443605 () Bool)

(assert (=> bm!72028 m!1443605))

(declare-fun m!1443607 () Bool)

(assert (=> b!1569126 m!1443607))

(declare-fun m!1443609 () Bool)

(assert (=> d!163839 m!1443609))

(assert (=> d!163839 m!1443529))

(declare-fun m!1443611 () Bool)

(assert (=> d!163839 m!1443611))

(declare-fun m!1443613 () Bool)

(assert (=> b!1569124 m!1443613))

(declare-fun m!1443615 () Bool)

(assert (=> b!1569123 m!1443615))

(assert (=> b!1568999 d!163839))

(declare-fun b!1569143 () Bool)

(declare-fun e!874730 () List!36729)

(assert (=> b!1569143 (= e!874730 (insertStrictlySorted!588 (t!51637 (t!51637 l!750)) key1!37 v1!32))))

(declare-fun d!163841 () Bool)

(declare-fun e!874731 () Bool)

(assert (=> d!163841 e!874731))

(declare-fun res!1072505 () Bool)

(assert (=> d!163841 (=> (not res!1072505) (not e!874731))))

(declare-fun lt!673288 () List!36729)

(assert (=> d!163841 (= res!1072505 (isStrictlySorted!1002 lt!673288))))

(declare-fun e!874729 () List!36729)

(assert (=> d!163841 (= lt!673288 e!874729)))

(declare-fun c!144666 () Bool)

(assert (=> d!163841 (= c!144666 (and ((_ is Cons!36725) (t!51637 l!750)) (bvslt (_1!12671 (h!38172 (t!51637 l!750))) key1!37)))))

(assert (=> d!163841 (isStrictlySorted!1002 (t!51637 l!750))))

(assert (=> d!163841 (= (insertStrictlySorted!588 (t!51637 l!750) key1!37 v1!32) lt!673288)))

(declare-fun b!1569144 () Bool)

(assert (=> b!1569144 (= e!874731 (contains!10418 lt!673288 (tuple2!25321 key1!37 v1!32)))))

(declare-fun b!1569145 () Bool)

(declare-fun e!874732 () List!36729)

(declare-fun call!72038 () List!36729)

(assert (=> b!1569145 (= e!874732 call!72038)))

(declare-fun b!1569146 () Bool)

(declare-fun res!1072504 () Bool)

(assert (=> b!1569146 (=> (not res!1072504) (not e!874731))))

(assert (=> b!1569146 (= res!1072504 (containsKey!860 lt!673288 key1!37))))

(declare-fun c!144664 () Bool)

(declare-fun c!144665 () Bool)

(declare-fun b!1569147 () Bool)

(assert (=> b!1569147 (= e!874730 (ite c!144665 (t!51637 (t!51637 l!750)) (ite c!144664 (Cons!36725 (h!38172 (t!51637 l!750)) (t!51637 (t!51637 l!750))) Nil!36726)))))

(declare-fun b!1569148 () Bool)

(declare-fun e!874728 () List!36729)

(declare-fun call!72037 () List!36729)

(assert (=> b!1569148 (= e!874728 call!72037)))

(declare-fun bm!72033 () Bool)

(assert (=> bm!72033 (= call!72038 call!72037)))

(declare-fun bm!72034 () Bool)

(declare-fun call!72036 () List!36729)

(assert (=> bm!72034 (= call!72036 ($colon$colon!991 e!874730 (ite c!144666 (h!38172 (t!51637 l!750)) (tuple2!25321 key1!37 v1!32))))))

(declare-fun c!144663 () Bool)

(assert (=> bm!72034 (= c!144663 c!144666)))

(declare-fun b!1569149 () Bool)

(assert (=> b!1569149 (= e!874732 call!72038)))

(declare-fun b!1569150 () Bool)

(assert (=> b!1569150 (= c!144664 (and ((_ is Cons!36725) (t!51637 l!750)) (bvsgt (_1!12671 (h!38172 (t!51637 l!750))) key1!37)))))

(assert (=> b!1569150 (= e!874728 e!874732)))

(declare-fun b!1569151 () Bool)

(assert (=> b!1569151 (= e!874729 call!72036)))

(declare-fun b!1569152 () Bool)

(assert (=> b!1569152 (= e!874729 e!874728)))

(assert (=> b!1569152 (= c!144665 (and ((_ is Cons!36725) (t!51637 l!750)) (= (_1!12671 (h!38172 (t!51637 l!750))) key1!37)))))

(declare-fun bm!72035 () Bool)

(assert (=> bm!72035 (= call!72037 call!72036)))

(assert (= (and d!163841 c!144666) b!1569151))

(assert (= (and d!163841 (not c!144666)) b!1569152))

(assert (= (and b!1569152 c!144665) b!1569148))

(assert (= (and b!1569152 (not c!144665)) b!1569150))

(assert (= (and b!1569150 c!144664) b!1569149))

(assert (= (and b!1569150 (not c!144664)) b!1569145))

(assert (= (or b!1569149 b!1569145) bm!72033))

(assert (= (or b!1569148 bm!72033) bm!72035))

(assert (= (or b!1569151 bm!72035) bm!72034))

(assert (= (and bm!72034 c!144663) b!1569143))

(assert (= (and bm!72034 (not c!144663)) b!1569147))

(assert (= (and d!163841 res!1072505) b!1569146))

(assert (= (and b!1569146 res!1072504) b!1569144))

(declare-fun m!1443625 () Bool)

(assert (=> bm!72034 m!1443625))

(declare-fun m!1443627 () Bool)

(assert (=> b!1569146 m!1443627))

(declare-fun m!1443629 () Bool)

(assert (=> d!163841 m!1443629))

(assert (=> d!163841 m!1443543))

(declare-fun m!1443631 () Bool)

(assert (=> b!1569144 m!1443631))

(declare-fun m!1443633 () Bool)

(assert (=> b!1569143 m!1443633))

(assert (=> b!1568999 d!163841))

(declare-fun d!163845 () Bool)

(declare-fun res!1072510 () Bool)

(declare-fun e!874743 () Bool)

(assert (=> d!163845 (=> res!1072510 e!874743)))

(assert (=> d!163845 (= res!1072510 (or ((_ is Nil!36726) (t!51637 l!750)) ((_ is Nil!36726) (t!51637 (t!51637 l!750)))))))

(assert (=> d!163845 (= (isStrictlySorted!1002 (t!51637 l!750)) e!874743)))

(declare-fun b!1569173 () Bool)

(declare-fun e!874744 () Bool)

(assert (=> b!1569173 (= e!874743 e!874744)))

(declare-fun res!1072511 () Bool)

(assert (=> b!1569173 (=> (not res!1072511) (not e!874744))))

(assert (=> b!1569173 (= res!1072511 (bvslt (_1!12671 (h!38172 (t!51637 l!750))) (_1!12671 (h!38172 (t!51637 (t!51637 l!750))))))))

(declare-fun b!1569174 () Bool)

(assert (=> b!1569174 (= e!874744 (isStrictlySorted!1002 (t!51637 (t!51637 l!750))))))

(assert (= (and d!163845 (not res!1072510)) b!1569173))

(assert (= (and b!1569173 res!1072511) b!1569174))

(declare-fun m!1443643 () Bool)

(assert (=> b!1569174 m!1443643))

(assert (=> b!1569000 d!163845))

(declare-fun d!163849 () Bool)

(declare-fun res!1072514 () Bool)

(declare-fun e!874748 () Bool)

(assert (=> d!163849 (=> res!1072514 e!874748)))

(assert (=> d!163849 (= res!1072514 (or ((_ is Nil!36726) l!750) ((_ is Nil!36726) (t!51637 l!750))))))

(assert (=> d!163849 (= (isStrictlySorted!1002 l!750) e!874748)))

(declare-fun b!1569175 () Bool)

(declare-fun e!874750 () Bool)

(assert (=> b!1569175 (= e!874748 e!874750)))

(declare-fun res!1072515 () Bool)

(assert (=> b!1569175 (=> (not res!1072515) (not e!874750))))

(assert (=> b!1569175 (= res!1072515 (bvslt (_1!12671 (h!38172 l!750)) (_1!12671 (h!38172 (t!51637 l!750)))))))

(declare-fun b!1569176 () Bool)

(assert (=> b!1569176 (= e!874750 (isStrictlySorted!1002 (t!51637 l!750)))))

(assert (= (and d!163849 (not res!1072514)) b!1569175))

(assert (= (and b!1569175 res!1072515) b!1569176))

(assert (=> b!1569176 m!1443543))

(assert (=> b!1569003 d!163849))

(declare-fun b!1569201 () Bool)

(declare-fun e!874759 () Bool)

(declare-fun tp!114084 () Bool)

(assert (=> b!1569201 (= e!874759 (and tp_is_empty!39045 tp!114084))))

(assert (=> b!1569001 (= tp!114078 e!874759)))

(assert (= (and b!1569001 ((_ is Cons!36725) (t!51637 l!750))) b!1569201))

(check-sat (not b!1569048) (not b!1569068) (not b!1569144) (not d!163833) (not b!1569122) (not bm!72019) (not b!1569092) (not b!1569050) (not d!163835) (not b!1569143) (not b!1569174) (not d!163839) tp_is_empty!39045 (not bm!72007) (not bm!72034) (not b!1569126) (not bm!72010) (not d!163821) (not d!163841) (not b!1569047) (not bm!72028) (not b!1569176) (not b!1569065) (not b!1569201) (not b!1569066) (not b!1569124) (not b!1569123) (not b!1569146) (not b!1569091) (not b!1569094) (not d!163817))
(check-sat)
