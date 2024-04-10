; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134416 () Bool)

(assert start!134416)

(declare-datatypes ((B!2518 0))(
  ( (B!2519 (val!19621 Int)) )
))
(declare-fun v2!10 () B!2518)

(declare-fun e!874928 () Bool)

(declare-fun b!1569479 () Bool)

(declare-datatypes ((tuple2!25344 0))(
  ( (tuple2!25345 (_1!12683 (_ BitVec 64)) (_2!12683 B!2518)) )
))
(declare-datatypes ((List!36741 0))(
  ( (Nil!36738) (Cons!36737 (h!38184 tuple2!25344) (t!51649 List!36741)) )
))
(declare-fun l!750 () List!36741)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun isStrictlySorted!1008 (List!36741) Bool)

(declare-fun insertStrictlySorted!594 (List!36741 (_ BitVec 64) B!2518) List!36741)

(assert (=> b!1569479 (= e!874928 (not (isStrictlySorted!1008 (insertStrictlySorted!594 l!750 key2!21 v2!10))))))

(declare-fun res!1072625 () Bool)

(assert (=> start!134416 (=> (not res!1072625) (not e!874928))))

(declare-fun key1!37 () (_ BitVec 64))

(assert (=> start!134416 (= res!1072625 (not (= key1!37 key2!21)))))

(assert (=> start!134416 e!874928))

(assert (=> start!134416 true))

(declare-fun e!874927 () Bool)

(assert (=> start!134416 e!874927))

(declare-fun tp_is_empty!39069 () Bool)

(assert (=> start!134416 tp_is_empty!39069))

(declare-fun b!1569480 () Bool)

(declare-fun tp!114132 () Bool)

(assert (=> b!1569480 (= e!874927 (and tp_is_empty!39069 tp!114132))))

(declare-fun b!1569477 () Bool)

(declare-fun res!1072624 () Bool)

(assert (=> b!1569477 (=> (not res!1072624) (not e!874928))))

(assert (=> b!1569477 (= res!1072624 (isStrictlySorted!1008 l!750))))

(declare-fun b!1569478 () Bool)

(declare-fun res!1072626 () Bool)

(assert (=> b!1569478 (=> (not res!1072626) (not e!874928))))

(get-info :version)

(assert (=> b!1569478 (= res!1072626 (or (not ((_ is Cons!36737) l!750)) (bvsge (_1!12683 (h!38184 l!750)) key1!37) (bvsge (_1!12683 (h!38184 l!750)) key2!21)))))

(assert (= (and start!134416 res!1072625) b!1569477))

(assert (= (and b!1569477 res!1072624) b!1569478))

(assert (= (and b!1569478 res!1072626) b!1569479))

(assert (= (and start!134416 ((_ is Cons!36737) l!750)) b!1569480))

(declare-fun m!1443805 () Bool)

(assert (=> b!1569479 m!1443805))

(assert (=> b!1569479 m!1443805))

(declare-fun m!1443807 () Bool)

(assert (=> b!1569479 m!1443807))

(declare-fun m!1443809 () Bool)

(assert (=> b!1569477 m!1443809))

(check-sat (not b!1569477) (not b!1569479) (not b!1569480) tp_is_empty!39069)
(check-sat)
(get-model)

(declare-fun d!163901 () Bool)

(declare-fun res!1072656 () Bool)

(declare-fun e!874955 () Bool)

(assert (=> d!163901 (=> res!1072656 e!874955)))

(assert (=> d!163901 (= res!1072656 (or ((_ is Nil!36738) l!750) ((_ is Nil!36738) (t!51649 l!750))))))

(assert (=> d!163901 (= (isStrictlySorted!1008 l!750) e!874955)))

(declare-fun b!1569513 () Bool)

(declare-fun e!874956 () Bool)

(assert (=> b!1569513 (= e!874955 e!874956)))

(declare-fun res!1072657 () Bool)

(assert (=> b!1569513 (=> (not res!1072657) (not e!874956))))

(assert (=> b!1569513 (= res!1072657 (bvslt (_1!12683 (h!38184 l!750)) (_1!12683 (h!38184 (t!51649 l!750)))))))

(declare-fun b!1569514 () Bool)

(assert (=> b!1569514 (= e!874956 (isStrictlySorted!1008 (t!51649 l!750)))))

(assert (= (and d!163901 (not res!1072656)) b!1569513))

(assert (= (and b!1569513 res!1072657) b!1569514))

(declare-fun m!1443825 () Bool)

(assert (=> b!1569514 m!1443825))

(assert (=> b!1569477 d!163901))

(declare-fun d!163911 () Bool)

(declare-fun res!1072658 () Bool)

(declare-fun e!874957 () Bool)

(assert (=> d!163911 (=> res!1072658 e!874957)))

(assert (=> d!163911 (= res!1072658 (or ((_ is Nil!36738) (insertStrictlySorted!594 l!750 key2!21 v2!10)) ((_ is Nil!36738) (t!51649 (insertStrictlySorted!594 l!750 key2!21 v2!10)))))))

(assert (=> d!163911 (= (isStrictlySorted!1008 (insertStrictlySorted!594 l!750 key2!21 v2!10)) e!874957)))

(declare-fun b!1569515 () Bool)

(declare-fun e!874958 () Bool)

(assert (=> b!1569515 (= e!874957 e!874958)))

(declare-fun res!1072659 () Bool)

(assert (=> b!1569515 (=> (not res!1072659) (not e!874958))))

(assert (=> b!1569515 (= res!1072659 (bvslt (_1!12683 (h!38184 (insertStrictlySorted!594 l!750 key2!21 v2!10))) (_1!12683 (h!38184 (t!51649 (insertStrictlySorted!594 l!750 key2!21 v2!10))))))))

(declare-fun b!1569516 () Bool)

(assert (=> b!1569516 (= e!874958 (isStrictlySorted!1008 (t!51649 (insertStrictlySorted!594 l!750 key2!21 v2!10))))))

(assert (= (and d!163911 (not res!1072658)) b!1569515))

(assert (= (and b!1569515 res!1072659) b!1569516))

(declare-fun m!1443827 () Bool)

(assert (=> b!1569516 m!1443827))

(assert (=> b!1569479 d!163911))

(declare-fun b!1569602 () Bool)

(declare-fun e!875002 () List!36741)

(declare-fun e!875005 () List!36741)

(assert (=> b!1569602 (= e!875002 e!875005)))

(declare-fun c!144774 () Bool)

(assert (=> b!1569602 (= c!144774 (and ((_ is Cons!36737) l!750) (= (_1!12683 (h!38184 l!750)) key2!21)))))

(declare-fun b!1569604 () Bool)

(declare-fun call!72117 () List!36741)

(assert (=> b!1569604 (= e!875002 call!72117)))

(declare-fun b!1569605 () Bool)

(declare-fun res!1072677 () Bool)

(declare-fun e!875006 () Bool)

(assert (=> b!1569605 (=> (not res!1072677) (not e!875006))))

(declare-fun lt!673315 () List!36741)

(declare-fun containsKey!866 (List!36741 (_ BitVec 64)) Bool)

(assert (=> b!1569605 (= res!1072677 (containsKey!866 lt!673315 key2!21))))

(declare-fun bm!72114 () Bool)

(declare-fun call!72119 () List!36741)

(assert (=> bm!72114 (= call!72119 call!72117)))

(declare-fun b!1569607 () Bool)

(declare-fun c!144772 () Bool)

(assert (=> b!1569607 (= c!144772 (and ((_ is Cons!36737) l!750) (bvsgt (_1!12683 (h!38184 l!750)) key2!21)))))

(declare-fun e!875003 () List!36741)

(assert (=> b!1569607 (= e!875005 e!875003)))

(declare-fun b!1569608 () Bool)

(assert (=> b!1569608 (= e!875005 call!72119)))

(declare-fun b!1569609 () Bool)

(declare-fun call!72118 () List!36741)

(assert (=> b!1569609 (= e!875003 call!72118)))

(declare-fun d!163913 () Bool)

(assert (=> d!163913 e!875006))

(declare-fun res!1072676 () Bool)

(assert (=> d!163913 (=> (not res!1072676) (not e!875006))))

(assert (=> d!163913 (= res!1072676 (isStrictlySorted!1008 lt!673315))))

(assert (=> d!163913 (= lt!673315 e!875002)))

(declare-fun c!144771 () Bool)

(assert (=> d!163913 (= c!144771 (and ((_ is Cons!36737) l!750) (bvslt (_1!12683 (h!38184 l!750)) key2!21)))))

(assert (=> d!163913 (isStrictlySorted!1008 l!750)))

(assert (=> d!163913 (= (insertStrictlySorted!594 l!750 key2!21 v2!10) lt!673315)))

(declare-fun b!1569610 () Bool)

(declare-fun contains!10425 (List!36741 tuple2!25344) Bool)

(assert (=> b!1569610 (= e!875006 (contains!10425 lt!673315 (tuple2!25345 key2!21 v2!10)))))

(declare-fun bm!72115 () Bool)

(declare-fun e!875004 () List!36741)

(declare-fun $colon$colon!998 (List!36741 tuple2!25344) List!36741)

(assert (=> bm!72115 (= call!72117 ($colon$colon!998 e!875004 (ite c!144771 (h!38184 l!750) (tuple2!25345 key2!21 v2!10))))))

(declare-fun c!144773 () Bool)

(assert (=> bm!72115 (= c!144773 c!144771)))

(declare-fun bm!72116 () Bool)

(assert (=> bm!72116 (= call!72118 call!72119)))

(declare-fun b!1569611 () Bool)

(assert (=> b!1569611 (= e!875004 (ite c!144774 (t!51649 l!750) (ite c!144772 (Cons!36737 (h!38184 l!750) (t!51649 l!750)) Nil!36738)))))

(declare-fun b!1569612 () Bool)

(assert (=> b!1569612 (= e!875004 (insertStrictlySorted!594 (t!51649 l!750) key2!21 v2!10))))

(declare-fun b!1569613 () Bool)

(assert (=> b!1569613 (= e!875003 call!72118)))

(assert (= (and d!163913 c!144771) b!1569604))

(assert (= (and d!163913 (not c!144771)) b!1569602))

(assert (= (and b!1569602 c!144774) b!1569608))

(assert (= (and b!1569602 (not c!144774)) b!1569607))

(assert (= (and b!1569607 c!144772) b!1569609))

(assert (= (and b!1569607 (not c!144772)) b!1569613))

(assert (= (or b!1569609 b!1569613) bm!72116))

(assert (= (or b!1569608 bm!72116) bm!72114))

(assert (= (or b!1569604 bm!72114) bm!72115))

(assert (= (and bm!72115 c!144773) b!1569612))

(assert (= (and bm!72115 (not c!144773)) b!1569611))

(assert (= (and d!163913 res!1072676) b!1569605))

(assert (= (and b!1569605 res!1072677) b!1569610))

(declare-fun m!1443849 () Bool)

(assert (=> b!1569605 m!1443849))

(declare-fun m!1443851 () Bool)

(assert (=> b!1569610 m!1443851))

(declare-fun m!1443853 () Bool)

(assert (=> bm!72115 m!1443853))

(declare-fun m!1443855 () Bool)

(assert (=> d!163913 m!1443855))

(assert (=> d!163913 m!1443809))

(declare-fun m!1443857 () Bool)

(assert (=> b!1569612 m!1443857))

(assert (=> b!1569479 d!163913))

(declare-fun b!1569621 () Bool)

(declare-fun e!875012 () Bool)

(declare-fun tp!114144 () Bool)

(assert (=> b!1569621 (= e!875012 (and tp_is_empty!39069 tp!114144))))

(assert (=> b!1569480 (= tp!114132 e!875012)))

(assert (= (and b!1569480 ((_ is Cons!36737) (t!51649 l!750))) b!1569621))

(check-sat (not d!163913) (not b!1569612) (not b!1569514) (not b!1569621) tp_is_empty!39069 (not b!1569605) (not b!1569516) (not b!1569610) (not bm!72115))
(check-sat)
