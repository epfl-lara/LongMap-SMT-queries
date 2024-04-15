; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134436 () Bool)

(assert start!134436)

(declare-fun b!1569589 () Bool)

(declare-fun res!1072707 () Bool)

(declare-fun e!874996 () Bool)

(assert (=> b!1569589 (=> (not res!1072707) (not e!874996))))

(declare-datatypes ((B!2546 0))(
  ( (B!2547 (val!19635 Int)) )
))
(declare-datatypes ((tuple2!25440 0))(
  ( (tuple2!25441 (_1!12731 (_ BitVec 64)) (_2!12731 B!2546)) )
))
(declare-datatypes ((List!36796 0))(
  ( (Nil!36793) (Cons!36792 (h!38240 tuple2!25440) (t!51696 List!36796)) )
))
(declare-fun l!750 () List!36796)

(declare-fun isStrictlySorted!1017 (List!36796) Bool)

(assert (=> b!1569589 (= res!1072707 (isStrictlySorted!1017 l!750))))

(declare-fun b!1569590 () Bool)

(declare-fun e!874997 () Bool)

(declare-fun tp_is_empty!39097 () Bool)

(declare-fun tp!114211 () Bool)

(assert (=> b!1569590 (= e!874997 (and tp_is_empty!39097 tp!114211))))

(declare-fun v1!32 () B!2546)

(declare-fun v2!10 () B!2546)

(declare-fun b!1569591 () Bool)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun insertStrictlySorted!597 (List!36796 (_ BitVec 64) B!2546) List!36796)

(assert (=> b!1569591 (= e!874996 (not (= (insertStrictlySorted!597 (insertStrictlySorted!597 l!750 key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!597 (insertStrictlySorted!597 l!750 key2!21 v2!10) key1!37 v1!32))))))

(assert (=> b!1569591 (= (insertStrictlySorted!597 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!597 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-datatypes ((Unit!51905 0))(
  ( (Unit!51906) )
))
(declare-fun lt!673053 () Unit!51905)

(declare-fun lemmaInsertStrictlySortedCommutative!16 (List!36796 (_ BitVec 64) B!2546 (_ BitVec 64) B!2546) Unit!51905)

(assert (=> b!1569591 (= lt!673053 (lemmaInsertStrictlySortedCommutative!16 (t!51696 l!750) key1!37 v1!32 key2!21 v2!10))))

(declare-fun res!1072706 () Bool)

(assert (=> start!134436 (=> (not res!1072706) (not e!874996))))

(assert (=> start!134436 (= res!1072706 (not (= key1!37 key2!21)))))

(assert (=> start!134436 e!874996))

(assert (=> start!134436 tp_is_empty!39097))

(assert (=> start!134436 e!874997))

(assert (=> start!134436 true))

(declare-fun b!1569592 () Bool)

(declare-fun res!1072704 () Bool)

(assert (=> b!1569592 (=> (not res!1072704) (not e!874996))))

(get-info :version)

(assert (=> b!1569592 (= res!1072704 (and ((_ is Cons!36792) l!750) (bvslt (_1!12731 (h!38240 l!750)) key1!37) (bvslt (_1!12731 (h!38240 l!750)) key2!21)))))

(declare-fun b!1569593 () Bool)

(declare-fun res!1072705 () Bool)

(assert (=> b!1569593 (=> (not res!1072705) (not e!874996))))

(assert (=> b!1569593 (= res!1072705 (isStrictlySorted!1017 (t!51696 l!750)))))

(assert (= (and start!134436 res!1072706) b!1569589))

(assert (= (and b!1569589 res!1072707) b!1569592))

(assert (= (and b!1569592 res!1072704) b!1569593))

(assert (= (and b!1569593 res!1072705) b!1569591))

(assert (= (and start!134436 ((_ is Cons!36792) l!750)) b!1569590))

(declare-fun m!1443045 () Bool)

(assert (=> b!1569589 m!1443045))

(declare-fun m!1443047 () Bool)

(assert (=> b!1569591 m!1443047))

(declare-fun m!1443049 () Bool)

(assert (=> b!1569591 m!1443049))

(declare-fun m!1443051 () Bool)

(assert (=> b!1569591 m!1443051))

(declare-fun m!1443053 () Bool)

(assert (=> b!1569591 m!1443053))

(declare-fun m!1443055 () Bool)

(assert (=> b!1569591 m!1443055))

(assert (=> b!1569591 m!1443049))

(declare-fun m!1443057 () Bool)

(assert (=> b!1569591 m!1443057))

(assert (=> b!1569591 m!1443053))

(declare-fun m!1443059 () Bool)

(assert (=> b!1569591 m!1443059))

(declare-fun m!1443061 () Bool)

(assert (=> b!1569591 m!1443061))

(assert (=> b!1569591 m!1443059))

(assert (=> b!1569591 m!1443047))

(declare-fun m!1443063 () Bool)

(assert (=> b!1569591 m!1443063))

(declare-fun m!1443065 () Bool)

(assert (=> b!1569593 m!1443065))

(check-sat (not b!1569589) tp_is_empty!39097 (not b!1569591) (not b!1569593) (not b!1569590))
(check-sat)
(get-model)

(declare-fun d!163719 () Bool)

(declare-fun res!1072736 () Bool)

(declare-fun e!875014 () Bool)

(assert (=> d!163719 (=> res!1072736 e!875014)))

(assert (=> d!163719 (= res!1072736 (or ((_ is Nil!36793) (t!51696 l!750)) ((_ is Nil!36793) (t!51696 (t!51696 l!750)))))))

(assert (=> d!163719 (= (isStrictlySorted!1017 (t!51696 l!750)) e!875014)))

(declare-fun b!1569628 () Bool)

(declare-fun e!875015 () Bool)

(assert (=> b!1569628 (= e!875014 e!875015)))

(declare-fun res!1072737 () Bool)

(assert (=> b!1569628 (=> (not res!1072737) (not e!875015))))

(assert (=> b!1569628 (= res!1072737 (bvslt (_1!12731 (h!38240 (t!51696 l!750))) (_1!12731 (h!38240 (t!51696 (t!51696 l!750))))))))

(declare-fun b!1569629 () Bool)

(assert (=> b!1569629 (= e!875015 (isStrictlySorted!1017 (t!51696 (t!51696 l!750))))))

(assert (= (and d!163719 (not res!1072736)) b!1569628))

(assert (= (and b!1569628 res!1072737) b!1569629))

(declare-fun m!1443111 () Bool)

(assert (=> b!1569629 m!1443111))

(assert (=> b!1569593 d!163719))

(declare-fun bm!72088 () Bool)

(declare-fun call!72093 () List!36796)

(declare-fun call!72091 () List!36796)

(assert (=> bm!72088 (= call!72093 call!72091)))

(declare-fun c!144716 () Bool)

(declare-fun b!1569662 () Bool)

(assert (=> b!1569662 (= c!144716 (and ((_ is Cons!36792) (insertStrictlySorted!597 l!750 key2!21 v2!10)) (bvsgt (_1!12731 (h!38240 (insertStrictlySorted!597 l!750 key2!21 v2!10))) key1!37)))))

(declare-fun e!875039 () List!36796)

(declare-fun e!875042 () List!36796)

(assert (=> b!1569662 (= e!875039 e!875042)))

(declare-fun b!1569663 () Bool)

(assert (=> b!1569663 (= e!875039 call!72091)))

(declare-fun b!1569664 () Bool)

(assert (=> b!1569664 (= e!875042 call!72093)))

(declare-fun b!1569665 () Bool)

(declare-fun e!875038 () List!36796)

(assert (=> b!1569665 (= e!875038 e!875039)))

(declare-fun c!144718 () Bool)

(assert (=> b!1569665 (= c!144718 (and ((_ is Cons!36792) (insertStrictlySorted!597 l!750 key2!21 v2!10)) (= (_1!12731 (h!38240 (insertStrictlySorted!597 l!750 key2!21 v2!10))) key1!37)))))

(declare-fun bm!72089 () Bool)

(declare-fun call!72092 () List!36796)

(declare-fun c!144715 () Bool)

(declare-fun e!875040 () List!36796)

(declare-fun $colon$colon!1002 (List!36796 tuple2!25440) List!36796)

(assert (=> bm!72089 (= call!72092 ($colon$colon!1002 e!875040 (ite c!144715 (h!38240 (insertStrictlySorted!597 l!750 key2!21 v2!10)) (tuple2!25441 key1!37 v1!32))))))

(declare-fun c!144717 () Bool)

(assert (=> bm!72089 (= c!144717 c!144715)))

(declare-fun b!1569666 () Bool)

(assert (=> b!1569666 (= e!875038 call!72092)))

(declare-fun b!1569667 () Bool)

(assert (=> b!1569667 (= e!875042 call!72093)))

(declare-fun b!1569669 () Bool)

(declare-fun lt!673062 () List!36796)

(declare-fun e!875041 () Bool)

(declare-fun contains!10382 (List!36796 tuple2!25440) Bool)

(assert (=> b!1569669 (= e!875041 (contains!10382 lt!673062 (tuple2!25441 key1!37 v1!32)))))

(declare-fun b!1569670 () Bool)

(assert (=> b!1569670 (= e!875040 (insertStrictlySorted!597 (t!51696 (insertStrictlySorted!597 l!750 key2!21 v2!10)) key1!37 v1!32))))

(declare-fun b!1569671 () Bool)

(assert (=> b!1569671 (= e!875040 (ite c!144718 (t!51696 (insertStrictlySorted!597 l!750 key2!21 v2!10)) (ite c!144716 (Cons!36792 (h!38240 (insertStrictlySorted!597 l!750 key2!21 v2!10)) (t!51696 (insertStrictlySorted!597 l!750 key2!21 v2!10))) Nil!36793)))))

(declare-fun bm!72090 () Bool)

(assert (=> bm!72090 (= call!72091 call!72092)))

(declare-fun b!1569668 () Bool)

(declare-fun res!1072754 () Bool)

(assert (=> b!1569668 (=> (not res!1072754) (not e!875041))))

(declare-fun containsKey!866 (List!36796 (_ BitVec 64)) Bool)

(assert (=> b!1569668 (= res!1072754 (containsKey!866 lt!673062 key1!37))))

(declare-fun d!163721 () Bool)

(assert (=> d!163721 e!875041))

(declare-fun res!1072755 () Bool)

(assert (=> d!163721 (=> (not res!1072755) (not e!875041))))

(assert (=> d!163721 (= res!1072755 (isStrictlySorted!1017 lt!673062))))

(assert (=> d!163721 (= lt!673062 e!875038)))

(assert (=> d!163721 (= c!144715 (and ((_ is Cons!36792) (insertStrictlySorted!597 l!750 key2!21 v2!10)) (bvslt (_1!12731 (h!38240 (insertStrictlySorted!597 l!750 key2!21 v2!10))) key1!37)))))

(assert (=> d!163721 (isStrictlySorted!1017 (insertStrictlySorted!597 l!750 key2!21 v2!10))))

(assert (=> d!163721 (= (insertStrictlySorted!597 (insertStrictlySorted!597 l!750 key2!21 v2!10) key1!37 v1!32) lt!673062)))

(assert (= (and d!163721 c!144715) b!1569666))

(assert (= (and d!163721 (not c!144715)) b!1569665))

(assert (= (and b!1569665 c!144718) b!1569663))

(assert (= (and b!1569665 (not c!144718)) b!1569662))

(assert (= (and b!1569662 c!144716) b!1569667))

(assert (= (and b!1569662 (not c!144716)) b!1569664))

(assert (= (or b!1569667 b!1569664) bm!72088))

(assert (= (or b!1569663 bm!72088) bm!72090))

(assert (= (or b!1569666 bm!72090) bm!72089))

(assert (= (and bm!72089 c!144717) b!1569670))

(assert (= (and bm!72089 (not c!144717)) b!1569671))

(assert (= (and d!163721 res!1072755) b!1569668))

(assert (= (and b!1569668 res!1072754) b!1569669))

(declare-fun m!1443113 () Bool)

(assert (=> bm!72089 m!1443113))

(declare-fun m!1443115 () Bool)

(assert (=> b!1569670 m!1443115))

(declare-fun m!1443117 () Bool)

(assert (=> b!1569669 m!1443117))

(declare-fun m!1443119 () Bool)

(assert (=> b!1569668 m!1443119))

(declare-fun m!1443121 () Bool)

(assert (=> d!163721 m!1443121))

(assert (=> d!163721 m!1443059))

(declare-fun m!1443123 () Bool)

(assert (=> d!163721 m!1443123))

(assert (=> b!1569591 d!163721))

(declare-fun d!163731 () Bool)

(assert (=> d!163731 (= (insertStrictlySorted!597 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!597 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-fun lt!673069 () Unit!51905)

(declare-fun choose!2093 (List!36796 (_ BitVec 64) B!2546 (_ BitVec 64) B!2546) Unit!51905)

(assert (=> d!163731 (= lt!673069 (choose!2093 (t!51696 l!750) key1!37 v1!32 key2!21 v2!10))))

(assert (=> d!163731 (not (= key1!37 key2!21))))

(assert (=> d!163731 (= (lemmaInsertStrictlySortedCommutative!16 (t!51696 l!750) key1!37 v1!32 key2!21 v2!10) lt!673069)))

(declare-fun bs!45180 () Bool)

(assert (= bs!45180 d!163731))

(assert (=> bs!45180 m!1443047))

(assert (=> bs!45180 m!1443063))

(assert (=> bs!45180 m!1443047))

(assert (=> bs!45180 m!1443049))

(declare-fun m!1443125 () Bool)

(assert (=> bs!45180 m!1443125))

(assert (=> bs!45180 m!1443049))

(assert (=> bs!45180 m!1443051))

(assert (=> b!1569591 d!163731))

(declare-fun bm!72103 () Bool)

(declare-fun call!72108 () List!36796)

(declare-fun call!72106 () List!36796)

(assert (=> bm!72103 (= call!72108 call!72106)))

(declare-fun c!144736 () Bool)

(declare-fun b!1569712 () Bool)

(assert (=> b!1569712 (= c!144736 (and ((_ is Cons!36792) (insertStrictlySorted!597 l!750 key1!37 v1!32)) (bvsgt (_1!12731 (h!38240 (insertStrictlySorted!597 l!750 key1!37 v1!32))) key2!21)))))

(declare-fun e!875064 () List!36796)

(declare-fun e!875067 () List!36796)

(assert (=> b!1569712 (= e!875064 e!875067)))

(declare-fun b!1569713 () Bool)

(assert (=> b!1569713 (= e!875064 call!72106)))

(declare-fun b!1569714 () Bool)

(assert (=> b!1569714 (= e!875067 call!72108)))

(declare-fun b!1569715 () Bool)

(declare-fun e!875063 () List!36796)

(assert (=> b!1569715 (= e!875063 e!875064)))

(declare-fun c!144738 () Bool)

(assert (=> b!1569715 (= c!144738 (and ((_ is Cons!36792) (insertStrictlySorted!597 l!750 key1!37 v1!32)) (= (_1!12731 (h!38240 (insertStrictlySorted!597 l!750 key1!37 v1!32))) key2!21)))))

(declare-fun c!144735 () Bool)

(declare-fun e!875065 () List!36796)

(declare-fun call!72107 () List!36796)

(declare-fun bm!72104 () Bool)

(assert (=> bm!72104 (= call!72107 ($colon$colon!1002 e!875065 (ite c!144735 (h!38240 (insertStrictlySorted!597 l!750 key1!37 v1!32)) (tuple2!25441 key2!21 v2!10))))))

(declare-fun c!144737 () Bool)

(assert (=> bm!72104 (= c!144737 c!144735)))

(declare-fun b!1569716 () Bool)

(assert (=> b!1569716 (= e!875063 call!72107)))

(declare-fun b!1569717 () Bool)

(assert (=> b!1569717 (= e!875067 call!72108)))

(declare-fun b!1569719 () Bool)

(declare-fun e!875066 () Bool)

(declare-fun lt!673070 () List!36796)

(assert (=> b!1569719 (= e!875066 (contains!10382 lt!673070 (tuple2!25441 key2!21 v2!10)))))

(declare-fun b!1569720 () Bool)

(assert (=> b!1569720 (= e!875065 (insertStrictlySorted!597 (t!51696 (insertStrictlySorted!597 l!750 key1!37 v1!32)) key2!21 v2!10))))

(declare-fun b!1569721 () Bool)

(assert (=> b!1569721 (= e!875065 (ite c!144738 (t!51696 (insertStrictlySorted!597 l!750 key1!37 v1!32)) (ite c!144736 (Cons!36792 (h!38240 (insertStrictlySorted!597 l!750 key1!37 v1!32)) (t!51696 (insertStrictlySorted!597 l!750 key1!37 v1!32))) Nil!36793)))))

(declare-fun bm!72105 () Bool)

(assert (=> bm!72105 (= call!72106 call!72107)))

(declare-fun b!1569718 () Bool)

(declare-fun res!1072764 () Bool)

(assert (=> b!1569718 (=> (not res!1072764) (not e!875066))))

(assert (=> b!1569718 (= res!1072764 (containsKey!866 lt!673070 key2!21))))

(declare-fun d!163733 () Bool)

(assert (=> d!163733 e!875066))

(declare-fun res!1072765 () Bool)

(assert (=> d!163733 (=> (not res!1072765) (not e!875066))))

(assert (=> d!163733 (= res!1072765 (isStrictlySorted!1017 lt!673070))))

(assert (=> d!163733 (= lt!673070 e!875063)))

(assert (=> d!163733 (= c!144735 (and ((_ is Cons!36792) (insertStrictlySorted!597 l!750 key1!37 v1!32)) (bvslt (_1!12731 (h!38240 (insertStrictlySorted!597 l!750 key1!37 v1!32))) key2!21)))))

(assert (=> d!163733 (isStrictlySorted!1017 (insertStrictlySorted!597 l!750 key1!37 v1!32))))

(assert (=> d!163733 (= (insertStrictlySorted!597 (insertStrictlySorted!597 l!750 key1!37 v1!32) key2!21 v2!10) lt!673070)))

(assert (= (and d!163733 c!144735) b!1569716))

(assert (= (and d!163733 (not c!144735)) b!1569715))

(assert (= (and b!1569715 c!144738) b!1569713))

(assert (= (and b!1569715 (not c!144738)) b!1569712))

(assert (= (and b!1569712 c!144736) b!1569717))

(assert (= (and b!1569712 (not c!144736)) b!1569714))

(assert (= (or b!1569717 b!1569714) bm!72103))

(assert (= (or b!1569713 bm!72103) bm!72105))

(assert (= (or b!1569716 bm!72105) bm!72104))

(assert (= (and bm!72104 c!144737) b!1569720))

(assert (= (and bm!72104 (not c!144737)) b!1569721))

(assert (= (and d!163733 res!1072765) b!1569718))

(assert (= (and b!1569718 res!1072764) b!1569719))

(declare-fun m!1443127 () Bool)

(assert (=> bm!72104 m!1443127))

(declare-fun m!1443129 () Bool)

(assert (=> b!1569720 m!1443129))

(declare-fun m!1443131 () Bool)

(assert (=> b!1569719 m!1443131))

(declare-fun m!1443133 () Bool)

(assert (=> b!1569718 m!1443133))

(declare-fun m!1443135 () Bool)

(assert (=> d!163733 m!1443135))

(assert (=> d!163733 m!1443053))

(declare-fun m!1443137 () Bool)

(assert (=> d!163733 m!1443137))

(assert (=> b!1569591 d!163733))

(declare-fun bm!72106 () Bool)

(declare-fun call!72111 () List!36796)

(declare-fun call!72109 () List!36796)

(assert (=> bm!72106 (= call!72111 call!72109)))

(declare-fun b!1569722 () Bool)

(declare-fun c!144740 () Bool)

(assert (=> b!1569722 (= c!144740 (and ((_ is Cons!36792) l!750) (bvsgt (_1!12731 (h!38240 l!750)) key2!21)))))

(declare-fun e!875069 () List!36796)

(declare-fun e!875072 () List!36796)

(assert (=> b!1569722 (= e!875069 e!875072)))

(declare-fun b!1569723 () Bool)

(assert (=> b!1569723 (= e!875069 call!72109)))

(declare-fun b!1569724 () Bool)

(assert (=> b!1569724 (= e!875072 call!72111)))

(declare-fun b!1569725 () Bool)

(declare-fun e!875068 () List!36796)

(assert (=> b!1569725 (= e!875068 e!875069)))

(declare-fun c!144742 () Bool)

(assert (=> b!1569725 (= c!144742 (and ((_ is Cons!36792) l!750) (= (_1!12731 (h!38240 l!750)) key2!21)))))

(declare-fun c!144739 () Bool)

(declare-fun e!875070 () List!36796)

(declare-fun bm!72107 () Bool)

(declare-fun call!72110 () List!36796)

(assert (=> bm!72107 (= call!72110 ($colon$colon!1002 e!875070 (ite c!144739 (h!38240 l!750) (tuple2!25441 key2!21 v2!10))))))

(declare-fun c!144741 () Bool)

(assert (=> bm!72107 (= c!144741 c!144739)))

(declare-fun b!1569726 () Bool)

(assert (=> b!1569726 (= e!875068 call!72110)))

(declare-fun b!1569727 () Bool)

(assert (=> b!1569727 (= e!875072 call!72111)))

(declare-fun e!875071 () Bool)

(declare-fun lt!673071 () List!36796)

(declare-fun b!1569729 () Bool)

(assert (=> b!1569729 (= e!875071 (contains!10382 lt!673071 (tuple2!25441 key2!21 v2!10)))))

(declare-fun b!1569730 () Bool)

(assert (=> b!1569730 (= e!875070 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10))))

(declare-fun b!1569731 () Bool)

(assert (=> b!1569731 (= e!875070 (ite c!144742 (t!51696 l!750) (ite c!144740 (Cons!36792 (h!38240 l!750) (t!51696 l!750)) Nil!36793)))))

(declare-fun bm!72108 () Bool)

(assert (=> bm!72108 (= call!72109 call!72110)))

(declare-fun b!1569728 () Bool)

(declare-fun res!1072766 () Bool)

(assert (=> b!1569728 (=> (not res!1072766) (not e!875071))))

(assert (=> b!1569728 (= res!1072766 (containsKey!866 lt!673071 key2!21))))

(declare-fun d!163735 () Bool)

(assert (=> d!163735 e!875071))

(declare-fun res!1072767 () Bool)

(assert (=> d!163735 (=> (not res!1072767) (not e!875071))))

(assert (=> d!163735 (= res!1072767 (isStrictlySorted!1017 lt!673071))))

(assert (=> d!163735 (= lt!673071 e!875068)))

(assert (=> d!163735 (= c!144739 (and ((_ is Cons!36792) l!750) (bvslt (_1!12731 (h!38240 l!750)) key2!21)))))

(assert (=> d!163735 (isStrictlySorted!1017 l!750)))

(assert (=> d!163735 (= (insertStrictlySorted!597 l!750 key2!21 v2!10) lt!673071)))

(assert (= (and d!163735 c!144739) b!1569726))

(assert (= (and d!163735 (not c!144739)) b!1569725))

(assert (= (and b!1569725 c!144742) b!1569723))

(assert (= (and b!1569725 (not c!144742)) b!1569722))

(assert (= (and b!1569722 c!144740) b!1569727))

(assert (= (and b!1569722 (not c!144740)) b!1569724))

(assert (= (or b!1569727 b!1569724) bm!72106))

(assert (= (or b!1569723 bm!72106) bm!72108))

(assert (= (or b!1569726 bm!72108) bm!72107))

(assert (= (and bm!72107 c!144741) b!1569730))

(assert (= (and bm!72107 (not c!144741)) b!1569731))

(assert (= (and d!163735 res!1072767) b!1569728))

(assert (= (and b!1569728 res!1072766) b!1569729))

(declare-fun m!1443139 () Bool)

(assert (=> bm!72107 m!1443139))

(assert (=> b!1569730 m!1443047))

(declare-fun m!1443141 () Bool)

(assert (=> b!1569729 m!1443141))

(declare-fun m!1443143 () Bool)

(assert (=> b!1569728 m!1443143))

(declare-fun m!1443145 () Bool)

(assert (=> d!163735 m!1443145))

(assert (=> d!163735 m!1443045))

(assert (=> b!1569591 d!163735))

(declare-fun bm!72112 () Bool)

(declare-fun call!72117 () List!36796)

(declare-fun call!72115 () List!36796)

(assert (=> bm!72112 (= call!72117 call!72115)))

(declare-fun b!1569742 () Bool)

(declare-fun c!144748 () Bool)

(assert (=> b!1569742 (= c!144748 (and ((_ is Cons!36792) l!750) (bvsgt (_1!12731 (h!38240 l!750)) key1!37)))))

(declare-fun e!875079 () List!36796)

(declare-fun e!875082 () List!36796)

(assert (=> b!1569742 (= e!875079 e!875082)))

(declare-fun b!1569743 () Bool)

(assert (=> b!1569743 (= e!875079 call!72115)))

(declare-fun b!1569744 () Bool)

(assert (=> b!1569744 (= e!875082 call!72117)))

(declare-fun b!1569745 () Bool)

(declare-fun e!875078 () List!36796)

(assert (=> b!1569745 (= e!875078 e!875079)))

(declare-fun c!144750 () Bool)

(assert (=> b!1569745 (= c!144750 (and ((_ is Cons!36792) l!750) (= (_1!12731 (h!38240 l!750)) key1!37)))))

(declare-fun e!875080 () List!36796)

(declare-fun call!72116 () List!36796)

(declare-fun c!144747 () Bool)

(declare-fun bm!72113 () Bool)

(assert (=> bm!72113 (= call!72116 ($colon$colon!1002 e!875080 (ite c!144747 (h!38240 l!750) (tuple2!25441 key1!37 v1!32))))))

(declare-fun c!144749 () Bool)

(assert (=> bm!72113 (= c!144749 c!144747)))

(declare-fun b!1569746 () Bool)

(assert (=> b!1569746 (= e!875078 call!72116)))

(declare-fun b!1569747 () Bool)

(assert (=> b!1569747 (= e!875082 call!72117)))

(declare-fun b!1569749 () Bool)

(declare-fun e!875081 () Bool)

(declare-fun lt!673073 () List!36796)

(assert (=> b!1569749 (= e!875081 (contains!10382 lt!673073 (tuple2!25441 key1!37 v1!32)))))

(declare-fun b!1569750 () Bool)

(assert (=> b!1569750 (= e!875080 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32))))

(declare-fun b!1569751 () Bool)

(assert (=> b!1569751 (= e!875080 (ite c!144750 (t!51696 l!750) (ite c!144748 (Cons!36792 (h!38240 l!750) (t!51696 l!750)) Nil!36793)))))

(declare-fun bm!72114 () Bool)

(assert (=> bm!72114 (= call!72115 call!72116)))

(declare-fun b!1569748 () Bool)

(declare-fun res!1072770 () Bool)

(assert (=> b!1569748 (=> (not res!1072770) (not e!875081))))

(assert (=> b!1569748 (= res!1072770 (containsKey!866 lt!673073 key1!37))))

(declare-fun d!163737 () Bool)

(assert (=> d!163737 e!875081))

(declare-fun res!1072771 () Bool)

(assert (=> d!163737 (=> (not res!1072771) (not e!875081))))

(assert (=> d!163737 (= res!1072771 (isStrictlySorted!1017 lt!673073))))

(assert (=> d!163737 (= lt!673073 e!875078)))

(assert (=> d!163737 (= c!144747 (and ((_ is Cons!36792) l!750) (bvslt (_1!12731 (h!38240 l!750)) key1!37)))))

(assert (=> d!163737 (isStrictlySorted!1017 l!750)))

(assert (=> d!163737 (= (insertStrictlySorted!597 l!750 key1!37 v1!32) lt!673073)))

(assert (= (and d!163737 c!144747) b!1569746))

(assert (= (and d!163737 (not c!144747)) b!1569745))

(assert (= (and b!1569745 c!144750) b!1569743))

(assert (= (and b!1569745 (not c!144750)) b!1569742))

(assert (= (and b!1569742 c!144748) b!1569747))

(assert (= (and b!1569742 (not c!144748)) b!1569744))

(assert (= (or b!1569747 b!1569744) bm!72112))

(assert (= (or b!1569743 bm!72112) bm!72114))

(assert (= (or b!1569746 bm!72114) bm!72113))

(assert (= (and bm!72113 c!144749) b!1569750))

(assert (= (and bm!72113 (not c!144749)) b!1569751))

(assert (= (and d!163737 res!1072771) b!1569748))

(assert (= (and b!1569748 res!1072770) b!1569749))

(declare-fun m!1443159 () Bool)

(assert (=> bm!72113 m!1443159))

(assert (=> b!1569750 m!1443049))

(declare-fun m!1443161 () Bool)

(assert (=> b!1569749 m!1443161))

(declare-fun m!1443163 () Bool)

(assert (=> b!1569748 m!1443163))

(declare-fun m!1443165 () Bool)

(assert (=> d!163737 m!1443165))

(assert (=> d!163737 m!1443045))

(assert (=> b!1569591 d!163737))

(declare-fun bm!72118 () Bool)

(declare-fun call!72123 () List!36796)

(declare-fun call!72121 () List!36796)

(assert (=> bm!72118 (= call!72123 call!72121)))

(declare-fun b!1569762 () Bool)

(declare-fun c!144756 () Bool)

(assert (=> b!1569762 (= c!144756 (and ((_ is Cons!36792) (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32)) (bvsgt (_1!12731 (h!38240 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32))) key2!21)))))

(declare-fun e!875089 () List!36796)

(declare-fun e!875092 () List!36796)

(assert (=> b!1569762 (= e!875089 e!875092)))

(declare-fun b!1569763 () Bool)

(assert (=> b!1569763 (= e!875089 call!72121)))

(declare-fun b!1569764 () Bool)

(assert (=> b!1569764 (= e!875092 call!72123)))

(declare-fun b!1569765 () Bool)

(declare-fun e!875088 () List!36796)

(assert (=> b!1569765 (= e!875088 e!875089)))

(declare-fun c!144758 () Bool)

(assert (=> b!1569765 (= c!144758 (and ((_ is Cons!36792) (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32)) (= (_1!12731 (h!38240 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32))) key2!21)))))

(declare-fun call!72122 () List!36796)

(declare-fun bm!72119 () Bool)

(declare-fun e!875090 () List!36796)

(declare-fun c!144755 () Bool)

(assert (=> bm!72119 (= call!72122 ($colon$colon!1002 e!875090 (ite c!144755 (h!38240 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32)) (tuple2!25441 key2!21 v2!10))))))

(declare-fun c!144757 () Bool)

(assert (=> bm!72119 (= c!144757 c!144755)))

(declare-fun b!1569766 () Bool)

(assert (=> b!1569766 (= e!875088 call!72122)))

(declare-fun b!1569767 () Bool)

(assert (=> b!1569767 (= e!875092 call!72123)))

(declare-fun lt!673075 () List!36796)

(declare-fun b!1569769 () Bool)

(declare-fun e!875091 () Bool)

(assert (=> b!1569769 (= e!875091 (contains!10382 lt!673075 (tuple2!25441 key2!21 v2!10)))))

(declare-fun b!1569770 () Bool)

(assert (=> b!1569770 (= e!875090 (insertStrictlySorted!597 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32)) key2!21 v2!10))))

(declare-fun b!1569771 () Bool)

(assert (=> b!1569771 (= e!875090 (ite c!144758 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32)) (ite c!144756 (Cons!36792 (h!38240 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32)) (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32))) Nil!36793)))))

(declare-fun bm!72120 () Bool)

(assert (=> bm!72120 (= call!72121 call!72122)))

(declare-fun b!1569768 () Bool)

(declare-fun res!1072774 () Bool)

(assert (=> b!1569768 (=> (not res!1072774) (not e!875091))))

(assert (=> b!1569768 (= res!1072774 (containsKey!866 lt!673075 key2!21))))

(declare-fun d!163741 () Bool)

(assert (=> d!163741 e!875091))

(declare-fun res!1072775 () Bool)

(assert (=> d!163741 (=> (not res!1072775) (not e!875091))))

(assert (=> d!163741 (= res!1072775 (isStrictlySorted!1017 lt!673075))))

(assert (=> d!163741 (= lt!673075 e!875088)))

(assert (=> d!163741 (= c!144755 (and ((_ is Cons!36792) (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32)) (bvslt (_1!12731 (h!38240 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32))) key2!21)))))

(assert (=> d!163741 (isStrictlySorted!1017 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32))))

(assert (=> d!163741 (= (insertStrictlySorted!597 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32) key2!21 v2!10) lt!673075)))

(assert (= (and d!163741 c!144755) b!1569766))

(assert (= (and d!163741 (not c!144755)) b!1569765))

(assert (= (and b!1569765 c!144758) b!1569763))

(assert (= (and b!1569765 (not c!144758)) b!1569762))

(assert (= (and b!1569762 c!144756) b!1569767))

(assert (= (and b!1569762 (not c!144756)) b!1569764))

(assert (= (or b!1569767 b!1569764) bm!72118))

(assert (= (or b!1569763 bm!72118) bm!72120))

(assert (= (or b!1569766 bm!72120) bm!72119))

(assert (= (and bm!72119 c!144757) b!1569770))

(assert (= (and bm!72119 (not c!144757)) b!1569771))

(assert (= (and d!163741 res!1072775) b!1569768))

(assert (= (and b!1569768 res!1072774) b!1569769))

(declare-fun m!1443179 () Bool)

(assert (=> bm!72119 m!1443179))

(declare-fun m!1443181 () Bool)

(assert (=> b!1569770 m!1443181))

(declare-fun m!1443183 () Bool)

(assert (=> b!1569769 m!1443183))

(declare-fun m!1443185 () Bool)

(assert (=> b!1569768 m!1443185))

(declare-fun m!1443187 () Bool)

(assert (=> d!163741 m!1443187))

(assert (=> d!163741 m!1443049))

(declare-fun m!1443189 () Bool)

(assert (=> d!163741 m!1443189))

(assert (=> b!1569591 d!163741))

(declare-fun bm!72121 () Bool)

(declare-fun call!72126 () List!36796)

(declare-fun call!72124 () List!36796)

(assert (=> bm!72121 (= call!72126 call!72124)))

(declare-fun b!1569772 () Bool)

(declare-fun c!144760 () Bool)

(assert (=> b!1569772 (= c!144760 (and ((_ is Cons!36792) (t!51696 l!750)) (bvsgt (_1!12731 (h!38240 (t!51696 l!750))) key2!21)))))

(declare-fun e!875094 () List!36796)

(declare-fun e!875097 () List!36796)

(assert (=> b!1569772 (= e!875094 e!875097)))

(declare-fun b!1569773 () Bool)

(assert (=> b!1569773 (= e!875094 call!72124)))

(declare-fun b!1569774 () Bool)

(assert (=> b!1569774 (= e!875097 call!72126)))

(declare-fun b!1569775 () Bool)

(declare-fun e!875093 () List!36796)

(assert (=> b!1569775 (= e!875093 e!875094)))

(declare-fun c!144762 () Bool)

(assert (=> b!1569775 (= c!144762 (and ((_ is Cons!36792) (t!51696 l!750)) (= (_1!12731 (h!38240 (t!51696 l!750))) key2!21)))))

(declare-fun c!144759 () Bool)

(declare-fun bm!72122 () Bool)

(declare-fun e!875095 () List!36796)

(declare-fun call!72125 () List!36796)

(assert (=> bm!72122 (= call!72125 ($colon$colon!1002 e!875095 (ite c!144759 (h!38240 (t!51696 l!750)) (tuple2!25441 key2!21 v2!10))))))

(declare-fun c!144761 () Bool)

(assert (=> bm!72122 (= c!144761 c!144759)))

(declare-fun b!1569776 () Bool)

(assert (=> b!1569776 (= e!875093 call!72125)))

(declare-fun b!1569777 () Bool)

(assert (=> b!1569777 (= e!875097 call!72126)))

(declare-fun e!875096 () Bool)

(declare-fun b!1569779 () Bool)

(declare-fun lt!673076 () List!36796)

(assert (=> b!1569779 (= e!875096 (contains!10382 lt!673076 (tuple2!25441 key2!21 v2!10)))))

(declare-fun b!1569780 () Bool)

(assert (=> b!1569780 (= e!875095 (insertStrictlySorted!597 (t!51696 (t!51696 l!750)) key2!21 v2!10))))

(declare-fun b!1569781 () Bool)

(assert (=> b!1569781 (= e!875095 (ite c!144762 (t!51696 (t!51696 l!750)) (ite c!144760 (Cons!36792 (h!38240 (t!51696 l!750)) (t!51696 (t!51696 l!750))) Nil!36793)))))

(declare-fun bm!72123 () Bool)

(assert (=> bm!72123 (= call!72124 call!72125)))

(declare-fun b!1569778 () Bool)

(declare-fun res!1072776 () Bool)

(assert (=> b!1569778 (=> (not res!1072776) (not e!875096))))

(assert (=> b!1569778 (= res!1072776 (containsKey!866 lt!673076 key2!21))))

(declare-fun d!163745 () Bool)

(assert (=> d!163745 e!875096))

(declare-fun res!1072777 () Bool)

(assert (=> d!163745 (=> (not res!1072777) (not e!875096))))

(assert (=> d!163745 (= res!1072777 (isStrictlySorted!1017 lt!673076))))

(assert (=> d!163745 (= lt!673076 e!875093)))

(assert (=> d!163745 (= c!144759 (and ((_ is Cons!36792) (t!51696 l!750)) (bvslt (_1!12731 (h!38240 (t!51696 l!750))) key2!21)))))

(assert (=> d!163745 (isStrictlySorted!1017 (t!51696 l!750))))

(assert (=> d!163745 (= (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10) lt!673076)))

(assert (= (and d!163745 c!144759) b!1569776))

(assert (= (and d!163745 (not c!144759)) b!1569775))

(assert (= (and b!1569775 c!144762) b!1569773))

(assert (= (and b!1569775 (not c!144762)) b!1569772))

(assert (= (and b!1569772 c!144760) b!1569777))

(assert (= (and b!1569772 (not c!144760)) b!1569774))

(assert (= (or b!1569777 b!1569774) bm!72121))

(assert (= (or b!1569773 bm!72121) bm!72123))

(assert (= (or b!1569776 bm!72123) bm!72122))

(assert (= (and bm!72122 c!144761) b!1569780))

(assert (= (and bm!72122 (not c!144761)) b!1569781))

(assert (= (and d!163745 res!1072777) b!1569778))

(assert (= (and b!1569778 res!1072776) b!1569779))

(declare-fun m!1443191 () Bool)

(assert (=> bm!72122 m!1443191))

(declare-fun m!1443193 () Bool)

(assert (=> b!1569780 m!1443193))

(declare-fun m!1443195 () Bool)

(assert (=> b!1569779 m!1443195))

(declare-fun m!1443197 () Bool)

(assert (=> b!1569778 m!1443197))

(declare-fun m!1443199 () Bool)

(assert (=> d!163745 m!1443199))

(assert (=> d!163745 m!1443065))

(assert (=> b!1569591 d!163745))

(declare-fun bm!72124 () Bool)

(declare-fun call!72129 () List!36796)

(declare-fun call!72127 () List!36796)

(assert (=> bm!72124 (= call!72129 call!72127)))

(declare-fun b!1569782 () Bool)

(declare-fun c!144764 () Bool)

(assert (=> b!1569782 (= c!144764 (and ((_ is Cons!36792) (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10)) (bvsgt (_1!12731 (h!38240 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10))) key1!37)))))

(declare-fun e!875099 () List!36796)

(declare-fun e!875102 () List!36796)

(assert (=> b!1569782 (= e!875099 e!875102)))

(declare-fun b!1569783 () Bool)

(assert (=> b!1569783 (= e!875099 call!72127)))

(declare-fun b!1569784 () Bool)

(assert (=> b!1569784 (= e!875102 call!72129)))

(declare-fun b!1569785 () Bool)

(declare-fun e!875098 () List!36796)

(assert (=> b!1569785 (= e!875098 e!875099)))

(declare-fun c!144766 () Bool)

(assert (=> b!1569785 (= c!144766 (and ((_ is Cons!36792) (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10)) (= (_1!12731 (h!38240 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10))) key1!37)))))

(declare-fun e!875100 () List!36796)

(declare-fun c!144763 () Bool)

(declare-fun call!72128 () List!36796)

(declare-fun bm!72125 () Bool)

(assert (=> bm!72125 (= call!72128 ($colon$colon!1002 e!875100 (ite c!144763 (h!38240 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10)) (tuple2!25441 key1!37 v1!32))))))

(declare-fun c!144765 () Bool)

(assert (=> bm!72125 (= c!144765 c!144763)))

(declare-fun b!1569786 () Bool)

(assert (=> b!1569786 (= e!875098 call!72128)))

(declare-fun b!1569787 () Bool)

(assert (=> b!1569787 (= e!875102 call!72129)))

(declare-fun e!875101 () Bool)

(declare-fun lt!673077 () List!36796)

(declare-fun b!1569789 () Bool)

(assert (=> b!1569789 (= e!875101 (contains!10382 lt!673077 (tuple2!25441 key1!37 v1!32)))))

(declare-fun b!1569790 () Bool)

(assert (=> b!1569790 (= e!875100 (insertStrictlySorted!597 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10)) key1!37 v1!32))))

(declare-fun b!1569791 () Bool)

(assert (=> b!1569791 (= e!875100 (ite c!144766 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10)) (ite c!144764 (Cons!36792 (h!38240 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10)) (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10))) Nil!36793)))))

(declare-fun bm!72126 () Bool)

(assert (=> bm!72126 (= call!72127 call!72128)))

(declare-fun b!1569788 () Bool)

(declare-fun res!1072778 () Bool)

(assert (=> b!1569788 (=> (not res!1072778) (not e!875101))))

(assert (=> b!1569788 (= res!1072778 (containsKey!866 lt!673077 key1!37))))

(declare-fun d!163747 () Bool)

(assert (=> d!163747 e!875101))

(declare-fun res!1072779 () Bool)

(assert (=> d!163747 (=> (not res!1072779) (not e!875101))))

(assert (=> d!163747 (= res!1072779 (isStrictlySorted!1017 lt!673077))))

(assert (=> d!163747 (= lt!673077 e!875098)))

(assert (=> d!163747 (= c!144763 (and ((_ is Cons!36792) (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10)) (bvslt (_1!12731 (h!38240 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10))) key1!37)))))

(assert (=> d!163747 (isStrictlySorted!1017 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10))))

(assert (=> d!163747 (= (insertStrictlySorted!597 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10) key1!37 v1!32) lt!673077)))

(assert (= (and d!163747 c!144763) b!1569786))

(assert (= (and d!163747 (not c!144763)) b!1569785))

(assert (= (and b!1569785 c!144766) b!1569783))

(assert (= (and b!1569785 (not c!144766)) b!1569782))

(assert (= (and b!1569782 c!144764) b!1569787))

(assert (= (and b!1569782 (not c!144764)) b!1569784))

(assert (= (or b!1569787 b!1569784) bm!72124))

(assert (= (or b!1569783 bm!72124) bm!72126))

(assert (= (or b!1569786 bm!72126) bm!72125))

(assert (= (and bm!72125 c!144765) b!1569790))

(assert (= (and bm!72125 (not c!144765)) b!1569791))

(assert (= (and d!163747 res!1072779) b!1569788))

(assert (= (and b!1569788 res!1072778) b!1569789))

(declare-fun m!1443201 () Bool)

(assert (=> bm!72125 m!1443201))

(declare-fun m!1443203 () Bool)

(assert (=> b!1569790 m!1443203))

(declare-fun m!1443205 () Bool)

(assert (=> b!1569789 m!1443205))

(declare-fun m!1443207 () Bool)

(assert (=> b!1569788 m!1443207))

(declare-fun m!1443209 () Bool)

(assert (=> d!163747 m!1443209))

(assert (=> d!163747 m!1443047))

(declare-fun m!1443211 () Bool)

(assert (=> d!163747 m!1443211))

(assert (=> b!1569591 d!163747))

(declare-fun bm!72127 () Bool)

(declare-fun call!72132 () List!36796)

(declare-fun call!72130 () List!36796)

(assert (=> bm!72127 (= call!72132 call!72130)))

(declare-fun b!1569792 () Bool)

(declare-fun c!144768 () Bool)

(assert (=> b!1569792 (= c!144768 (and ((_ is Cons!36792) (t!51696 l!750)) (bvsgt (_1!12731 (h!38240 (t!51696 l!750))) key1!37)))))

(declare-fun e!875104 () List!36796)

(declare-fun e!875107 () List!36796)

(assert (=> b!1569792 (= e!875104 e!875107)))

(declare-fun b!1569793 () Bool)

(assert (=> b!1569793 (= e!875104 call!72130)))

(declare-fun b!1569794 () Bool)

(assert (=> b!1569794 (= e!875107 call!72132)))

(declare-fun b!1569795 () Bool)

(declare-fun e!875103 () List!36796)

(assert (=> b!1569795 (= e!875103 e!875104)))

(declare-fun c!144770 () Bool)

(assert (=> b!1569795 (= c!144770 (and ((_ is Cons!36792) (t!51696 l!750)) (= (_1!12731 (h!38240 (t!51696 l!750))) key1!37)))))

(declare-fun call!72131 () List!36796)

(declare-fun e!875105 () List!36796)

(declare-fun bm!72128 () Bool)

(declare-fun c!144767 () Bool)

(assert (=> bm!72128 (= call!72131 ($colon$colon!1002 e!875105 (ite c!144767 (h!38240 (t!51696 l!750)) (tuple2!25441 key1!37 v1!32))))))

(declare-fun c!144769 () Bool)

(assert (=> bm!72128 (= c!144769 c!144767)))

(declare-fun b!1569796 () Bool)

(assert (=> b!1569796 (= e!875103 call!72131)))

(declare-fun b!1569797 () Bool)

(assert (=> b!1569797 (= e!875107 call!72132)))

(declare-fun lt!673082 () List!36796)

(declare-fun b!1569799 () Bool)

(declare-fun e!875106 () Bool)

(assert (=> b!1569799 (= e!875106 (contains!10382 lt!673082 (tuple2!25441 key1!37 v1!32)))))

(declare-fun b!1569800 () Bool)

(assert (=> b!1569800 (= e!875105 (insertStrictlySorted!597 (t!51696 (t!51696 l!750)) key1!37 v1!32))))

(declare-fun b!1569801 () Bool)

(assert (=> b!1569801 (= e!875105 (ite c!144770 (t!51696 (t!51696 l!750)) (ite c!144768 (Cons!36792 (h!38240 (t!51696 l!750)) (t!51696 (t!51696 l!750))) Nil!36793)))))

(declare-fun bm!72129 () Bool)

(assert (=> bm!72129 (= call!72130 call!72131)))

(declare-fun b!1569798 () Bool)

(declare-fun res!1072780 () Bool)

(assert (=> b!1569798 (=> (not res!1072780) (not e!875106))))

(assert (=> b!1569798 (= res!1072780 (containsKey!866 lt!673082 key1!37))))

(declare-fun d!163749 () Bool)

(assert (=> d!163749 e!875106))

(declare-fun res!1072781 () Bool)

(assert (=> d!163749 (=> (not res!1072781) (not e!875106))))

(assert (=> d!163749 (= res!1072781 (isStrictlySorted!1017 lt!673082))))

(assert (=> d!163749 (= lt!673082 e!875103)))

(assert (=> d!163749 (= c!144767 (and ((_ is Cons!36792) (t!51696 l!750)) (bvslt (_1!12731 (h!38240 (t!51696 l!750))) key1!37)))))

(assert (=> d!163749 (isStrictlySorted!1017 (t!51696 l!750))))

(assert (=> d!163749 (= (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32) lt!673082)))

(assert (= (and d!163749 c!144767) b!1569796))

(assert (= (and d!163749 (not c!144767)) b!1569795))

(assert (= (and b!1569795 c!144770) b!1569793))

(assert (= (and b!1569795 (not c!144770)) b!1569792))

(assert (= (and b!1569792 c!144768) b!1569797))

(assert (= (and b!1569792 (not c!144768)) b!1569794))

(assert (= (or b!1569797 b!1569794) bm!72127))

(assert (= (or b!1569793 bm!72127) bm!72129))

(assert (= (or b!1569796 bm!72129) bm!72128))

(assert (= (and bm!72128 c!144769) b!1569800))

(assert (= (and bm!72128 (not c!144769)) b!1569801))

(assert (= (and d!163749 res!1072781) b!1569798))

(assert (= (and b!1569798 res!1072780) b!1569799))

(declare-fun m!1443215 () Bool)

(assert (=> bm!72128 m!1443215))

(declare-fun m!1443217 () Bool)

(assert (=> b!1569800 m!1443217))

(declare-fun m!1443219 () Bool)

(assert (=> b!1569799 m!1443219))

(declare-fun m!1443221 () Bool)

(assert (=> b!1569798 m!1443221))

(declare-fun m!1443223 () Bool)

(assert (=> d!163749 m!1443223))

(assert (=> d!163749 m!1443065))

(assert (=> b!1569591 d!163749))

(declare-fun d!163753 () Bool)

(declare-fun res!1072784 () Bool)

(declare-fun e!875113 () Bool)

(assert (=> d!163753 (=> res!1072784 e!875113)))

(assert (=> d!163753 (= res!1072784 (or ((_ is Nil!36793) l!750) ((_ is Nil!36793) (t!51696 l!750))))))

(assert (=> d!163753 (= (isStrictlySorted!1017 l!750) e!875113)))

(declare-fun b!1569812 () Bool)

(declare-fun e!875114 () Bool)

(assert (=> b!1569812 (= e!875113 e!875114)))

(declare-fun res!1072785 () Bool)

(assert (=> b!1569812 (=> (not res!1072785) (not e!875114))))

(assert (=> b!1569812 (= res!1072785 (bvslt (_1!12731 (h!38240 l!750)) (_1!12731 (h!38240 (t!51696 l!750)))))))

(declare-fun b!1569813 () Bool)

(assert (=> b!1569813 (= e!875114 (isStrictlySorted!1017 (t!51696 l!750)))))

(assert (= (and d!163753 (not res!1072784)) b!1569812))

(assert (= (and b!1569812 res!1072785) b!1569813))

(assert (=> b!1569813 m!1443065))

(assert (=> b!1569589 d!163753))

(declare-fun b!1569838 () Bool)

(declare-fun e!875127 () Bool)

(declare-fun tp!114220 () Bool)

(assert (=> b!1569838 (= e!875127 (and tp_is_empty!39097 tp!114220))))

(assert (=> b!1569590 (= tp!114211 e!875127)))

(assert (= (and b!1569590 ((_ is Cons!36792) (t!51696 l!750))) b!1569838))

(check-sat (not b!1569779) (not bm!72128) (not d!163737) (not b!1569813) (not bm!72122) (not b!1569718) (not b!1569800) (not b!1569769) (not bm!72113) (not b!1569668) (not b!1569670) (not b!1569719) (not b!1569790) (not b!1569799) (not b!1569798) (not b!1569749) (not bm!72107) (not d!163731) (not bm!72104) (not d!163741) (not d!163721) tp_is_empty!39097 (not d!163733) (not b!1569838) (not b!1569748) (not d!163747) (not b!1569780) (not b!1569720) (not b!1569750) (not b!1569730) (not d!163745) (not b!1569778) (not bm!72119) (not b!1569728) (not b!1569788) (not d!163735) (not b!1569789) (not d!163749) (not b!1569770) (not bm!72089) (not b!1569629) (not b!1569729) (not b!1569768) (not bm!72125) (not b!1569669))
(check-sat)
(get-model)

(declare-fun d!163785 () Bool)

(declare-fun res!1072816 () Bool)

(declare-fun e!875193 () Bool)

(assert (=> d!163785 (=> res!1072816 e!875193)))

(assert (=> d!163785 (= res!1072816 (or ((_ is Nil!36793) lt!673062) ((_ is Nil!36793) (t!51696 lt!673062))))))

(assert (=> d!163785 (= (isStrictlySorted!1017 lt!673062) e!875193)))

(declare-fun b!1569963 () Bool)

(declare-fun e!875194 () Bool)

(assert (=> b!1569963 (= e!875193 e!875194)))

(declare-fun res!1072817 () Bool)

(assert (=> b!1569963 (=> (not res!1072817) (not e!875194))))

(assert (=> b!1569963 (= res!1072817 (bvslt (_1!12731 (h!38240 lt!673062)) (_1!12731 (h!38240 (t!51696 lt!673062)))))))

(declare-fun b!1569964 () Bool)

(assert (=> b!1569964 (= e!875194 (isStrictlySorted!1017 (t!51696 lt!673062)))))

(assert (= (and d!163785 (not res!1072816)) b!1569963))

(assert (= (and b!1569963 res!1072817) b!1569964))

(declare-fun m!1443375 () Bool)

(assert (=> b!1569964 m!1443375))

(assert (=> d!163721 d!163785))

(declare-fun d!163787 () Bool)

(declare-fun res!1072818 () Bool)

(declare-fun e!875195 () Bool)

(assert (=> d!163787 (=> res!1072818 e!875195)))

(assert (=> d!163787 (= res!1072818 (or ((_ is Nil!36793) (insertStrictlySorted!597 l!750 key2!21 v2!10)) ((_ is Nil!36793) (t!51696 (insertStrictlySorted!597 l!750 key2!21 v2!10)))))))

(assert (=> d!163787 (= (isStrictlySorted!1017 (insertStrictlySorted!597 l!750 key2!21 v2!10)) e!875195)))

(declare-fun b!1569965 () Bool)

(declare-fun e!875196 () Bool)

(assert (=> b!1569965 (= e!875195 e!875196)))

(declare-fun res!1072819 () Bool)

(assert (=> b!1569965 (=> (not res!1072819) (not e!875196))))

(assert (=> b!1569965 (= res!1072819 (bvslt (_1!12731 (h!38240 (insertStrictlySorted!597 l!750 key2!21 v2!10))) (_1!12731 (h!38240 (t!51696 (insertStrictlySorted!597 l!750 key2!21 v2!10))))))))

(declare-fun b!1569966 () Bool)

(assert (=> b!1569966 (= e!875196 (isStrictlySorted!1017 (t!51696 (insertStrictlySorted!597 l!750 key2!21 v2!10))))))

(assert (= (and d!163787 (not res!1072818)) b!1569965))

(assert (= (and b!1569965 res!1072819) b!1569966))

(declare-fun m!1443377 () Bool)

(assert (=> b!1569966 m!1443377))

(assert (=> d!163721 d!163787))

(declare-fun d!163789 () Bool)

(assert (=> d!163789 (= ($colon$colon!1002 e!875095 (ite c!144759 (h!38240 (t!51696 l!750)) (tuple2!25441 key2!21 v2!10))) (Cons!36792 (ite c!144759 (h!38240 (t!51696 l!750)) (tuple2!25441 key2!21 v2!10)) e!875095))))

(assert (=> bm!72122 d!163789))

(declare-fun bm!72172 () Bool)

(declare-fun call!72177 () List!36796)

(declare-fun call!72175 () List!36796)

(assert (=> bm!72172 (= call!72177 call!72175)))

(declare-fun b!1569967 () Bool)

(declare-fun c!144828 () Bool)

(assert (=> b!1569967 (= c!144828 (and ((_ is Cons!36792) (t!51696 (t!51696 l!750))) (bvsgt (_1!12731 (h!38240 (t!51696 (t!51696 l!750)))) key1!37)))))

(declare-fun e!875198 () List!36796)

(declare-fun e!875201 () List!36796)

(assert (=> b!1569967 (= e!875198 e!875201)))

(declare-fun b!1569968 () Bool)

(assert (=> b!1569968 (= e!875198 call!72175)))

(declare-fun b!1569969 () Bool)

(assert (=> b!1569969 (= e!875201 call!72177)))

(declare-fun b!1569970 () Bool)

(declare-fun e!875197 () List!36796)

(assert (=> b!1569970 (= e!875197 e!875198)))

(declare-fun c!144830 () Bool)

(assert (=> b!1569970 (= c!144830 (and ((_ is Cons!36792) (t!51696 (t!51696 l!750))) (= (_1!12731 (h!38240 (t!51696 (t!51696 l!750)))) key1!37)))))

(declare-fun c!144827 () Bool)

(declare-fun bm!72173 () Bool)

(declare-fun call!72176 () List!36796)

(declare-fun e!875199 () List!36796)

(assert (=> bm!72173 (= call!72176 ($colon$colon!1002 e!875199 (ite c!144827 (h!38240 (t!51696 (t!51696 l!750))) (tuple2!25441 key1!37 v1!32))))))

(declare-fun c!144829 () Bool)

(assert (=> bm!72173 (= c!144829 c!144827)))

(declare-fun b!1569971 () Bool)

(assert (=> b!1569971 (= e!875197 call!72176)))

(declare-fun b!1569972 () Bool)

(assert (=> b!1569972 (= e!875201 call!72177)))

(declare-fun e!875200 () Bool)

(declare-fun b!1569974 () Bool)

(declare-fun lt!673099 () List!36796)

(assert (=> b!1569974 (= e!875200 (contains!10382 lt!673099 (tuple2!25441 key1!37 v1!32)))))

(declare-fun b!1569975 () Bool)

(assert (=> b!1569975 (= e!875199 (insertStrictlySorted!597 (t!51696 (t!51696 (t!51696 l!750))) key1!37 v1!32))))

(declare-fun b!1569976 () Bool)

(assert (=> b!1569976 (= e!875199 (ite c!144830 (t!51696 (t!51696 (t!51696 l!750))) (ite c!144828 (Cons!36792 (h!38240 (t!51696 (t!51696 l!750))) (t!51696 (t!51696 (t!51696 l!750)))) Nil!36793)))))

(declare-fun bm!72174 () Bool)

(assert (=> bm!72174 (= call!72175 call!72176)))

(declare-fun b!1569973 () Bool)

(declare-fun res!1072820 () Bool)

(assert (=> b!1569973 (=> (not res!1072820) (not e!875200))))

(assert (=> b!1569973 (= res!1072820 (containsKey!866 lt!673099 key1!37))))

(declare-fun d!163791 () Bool)

(assert (=> d!163791 e!875200))

(declare-fun res!1072821 () Bool)

(assert (=> d!163791 (=> (not res!1072821) (not e!875200))))

(assert (=> d!163791 (= res!1072821 (isStrictlySorted!1017 lt!673099))))

(assert (=> d!163791 (= lt!673099 e!875197)))

(assert (=> d!163791 (= c!144827 (and ((_ is Cons!36792) (t!51696 (t!51696 l!750))) (bvslt (_1!12731 (h!38240 (t!51696 (t!51696 l!750)))) key1!37)))))

(assert (=> d!163791 (isStrictlySorted!1017 (t!51696 (t!51696 l!750)))))

(assert (=> d!163791 (= (insertStrictlySorted!597 (t!51696 (t!51696 l!750)) key1!37 v1!32) lt!673099)))

(assert (= (and d!163791 c!144827) b!1569971))

(assert (= (and d!163791 (not c!144827)) b!1569970))

(assert (= (and b!1569970 c!144830) b!1569968))

(assert (= (and b!1569970 (not c!144830)) b!1569967))

(assert (= (and b!1569967 c!144828) b!1569972))

(assert (= (and b!1569967 (not c!144828)) b!1569969))

(assert (= (or b!1569972 b!1569969) bm!72172))

(assert (= (or b!1569968 bm!72172) bm!72174))

(assert (= (or b!1569971 bm!72174) bm!72173))

(assert (= (and bm!72173 c!144829) b!1569975))

(assert (= (and bm!72173 (not c!144829)) b!1569976))

(assert (= (and d!163791 res!1072821) b!1569973))

(assert (= (and b!1569973 res!1072820) b!1569974))

(declare-fun m!1443379 () Bool)

(assert (=> bm!72173 m!1443379))

(declare-fun m!1443381 () Bool)

(assert (=> b!1569975 m!1443381))

(declare-fun m!1443383 () Bool)

(assert (=> b!1569974 m!1443383))

(declare-fun m!1443385 () Bool)

(assert (=> b!1569973 m!1443385))

(declare-fun m!1443387 () Bool)

(assert (=> d!163791 m!1443387))

(assert (=> d!163791 m!1443111))

(assert (=> b!1569800 d!163791))

(declare-fun d!163793 () Bool)

(declare-fun res!1072822 () Bool)

(declare-fun e!875202 () Bool)

(assert (=> d!163793 (=> res!1072822 e!875202)))

(assert (=> d!163793 (= res!1072822 (or ((_ is Nil!36793) lt!673077) ((_ is Nil!36793) (t!51696 lt!673077))))))

(assert (=> d!163793 (= (isStrictlySorted!1017 lt!673077) e!875202)))

(declare-fun b!1569977 () Bool)

(declare-fun e!875203 () Bool)

(assert (=> b!1569977 (= e!875202 e!875203)))

(declare-fun res!1072823 () Bool)

(assert (=> b!1569977 (=> (not res!1072823) (not e!875203))))

(assert (=> b!1569977 (= res!1072823 (bvslt (_1!12731 (h!38240 lt!673077)) (_1!12731 (h!38240 (t!51696 lt!673077)))))))

(declare-fun b!1569978 () Bool)

(assert (=> b!1569978 (= e!875203 (isStrictlySorted!1017 (t!51696 lt!673077)))))

(assert (= (and d!163793 (not res!1072822)) b!1569977))

(assert (= (and b!1569977 res!1072823) b!1569978))

(declare-fun m!1443389 () Bool)

(assert (=> b!1569978 m!1443389))

(assert (=> d!163747 d!163793))

(declare-fun d!163795 () Bool)

(declare-fun res!1072824 () Bool)

(declare-fun e!875204 () Bool)

(assert (=> d!163795 (=> res!1072824 e!875204)))

(assert (=> d!163795 (= res!1072824 (or ((_ is Nil!36793) (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10)) ((_ is Nil!36793) (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10)))))))

(assert (=> d!163795 (= (isStrictlySorted!1017 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10)) e!875204)))

(declare-fun b!1569979 () Bool)

(declare-fun e!875205 () Bool)

(assert (=> b!1569979 (= e!875204 e!875205)))

(declare-fun res!1072825 () Bool)

(assert (=> b!1569979 (=> (not res!1072825) (not e!875205))))

(assert (=> b!1569979 (= res!1072825 (bvslt (_1!12731 (h!38240 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10))) (_1!12731 (h!38240 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10))))))))

(declare-fun b!1569980 () Bool)

(assert (=> b!1569980 (= e!875205 (isStrictlySorted!1017 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10))))))

(assert (= (and d!163795 (not res!1072824)) b!1569979))

(assert (= (and b!1569979 res!1072825) b!1569980))

(declare-fun m!1443391 () Bool)

(assert (=> b!1569980 m!1443391))

(assert (=> d!163747 d!163795))

(assert (=> b!1569750 d!163749))

(declare-fun d!163797 () Bool)

(assert (=> d!163797 (= ($colon$colon!1002 e!875100 (ite c!144763 (h!38240 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10)) (tuple2!25441 key1!37 v1!32))) (Cons!36792 (ite c!144763 (h!38240 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10)) (tuple2!25441 key1!37 v1!32)) e!875100))))

(assert (=> bm!72125 d!163797))

(declare-fun d!163799 () Bool)

(declare-fun lt!673102 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!806 (List!36796) (InoxSet tuple2!25440))

(assert (=> d!163799 (= lt!673102 (select (content!806 lt!673082) (tuple2!25441 key1!37 v1!32)))))

(declare-fun e!875210 () Bool)

(assert (=> d!163799 (= lt!673102 e!875210)))

(declare-fun res!1072831 () Bool)

(assert (=> d!163799 (=> (not res!1072831) (not e!875210))))

(assert (=> d!163799 (= res!1072831 ((_ is Cons!36792) lt!673082))))

(assert (=> d!163799 (= (contains!10382 lt!673082 (tuple2!25441 key1!37 v1!32)) lt!673102)))

(declare-fun b!1569985 () Bool)

(declare-fun e!875211 () Bool)

(assert (=> b!1569985 (= e!875210 e!875211)))

(declare-fun res!1072830 () Bool)

(assert (=> b!1569985 (=> res!1072830 e!875211)))

(assert (=> b!1569985 (= res!1072830 (= (h!38240 lt!673082) (tuple2!25441 key1!37 v1!32)))))

(declare-fun b!1569986 () Bool)

(assert (=> b!1569986 (= e!875211 (contains!10382 (t!51696 lt!673082) (tuple2!25441 key1!37 v1!32)))))

(assert (= (and d!163799 res!1072831) b!1569985))

(assert (= (and b!1569985 (not res!1072830)) b!1569986))

(declare-fun m!1443393 () Bool)

(assert (=> d!163799 m!1443393))

(declare-fun m!1443395 () Bool)

(assert (=> d!163799 m!1443395))

(declare-fun m!1443397 () Bool)

(assert (=> b!1569986 m!1443397))

(assert (=> b!1569799 d!163799))

(declare-fun d!163801 () Bool)

(declare-fun res!1072836 () Bool)

(declare-fun e!875216 () Bool)

(assert (=> d!163801 (=> res!1072836 e!875216)))

(assert (=> d!163801 (= res!1072836 (and ((_ is Cons!36792) lt!673082) (= (_1!12731 (h!38240 lt!673082)) key1!37)))))

(assert (=> d!163801 (= (containsKey!866 lt!673082 key1!37) e!875216)))

(declare-fun b!1569991 () Bool)

(declare-fun e!875217 () Bool)

(assert (=> b!1569991 (= e!875216 e!875217)))

(declare-fun res!1072837 () Bool)

(assert (=> b!1569991 (=> (not res!1072837) (not e!875217))))

(assert (=> b!1569991 (= res!1072837 (and (or (not ((_ is Cons!36792) lt!673082)) (bvsle (_1!12731 (h!38240 lt!673082)) key1!37)) ((_ is Cons!36792) lt!673082) (bvslt (_1!12731 (h!38240 lt!673082)) key1!37)))))

(declare-fun b!1569992 () Bool)

(assert (=> b!1569992 (= e!875217 (containsKey!866 (t!51696 lt!673082) key1!37))))

(assert (= (and d!163801 (not res!1072836)) b!1569991))

(assert (= (and b!1569991 res!1072837) b!1569992))

(declare-fun m!1443399 () Bool)

(assert (=> b!1569992 m!1443399))

(assert (=> b!1569798 d!163801))

(declare-fun lt!673103 () Bool)

(declare-fun d!163803 () Bool)

(assert (=> d!163803 (= lt!673103 (select (content!806 lt!673073) (tuple2!25441 key1!37 v1!32)))))

(declare-fun e!875218 () Bool)

(assert (=> d!163803 (= lt!673103 e!875218)))

(declare-fun res!1072839 () Bool)

(assert (=> d!163803 (=> (not res!1072839) (not e!875218))))

(assert (=> d!163803 (= res!1072839 ((_ is Cons!36792) lt!673073))))

(assert (=> d!163803 (= (contains!10382 lt!673073 (tuple2!25441 key1!37 v1!32)) lt!673103)))

(declare-fun b!1569993 () Bool)

(declare-fun e!875219 () Bool)

(assert (=> b!1569993 (= e!875218 e!875219)))

(declare-fun res!1072838 () Bool)

(assert (=> b!1569993 (=> res!1072838 e!875219)))

(assert (=> b!1569993 (= res!1072838 (= (h!38240 lt!673073) (tuple2!25441 key1!37 v1!32)))))

(declare-fun b!1569994 () Bool)

(assert (=> b!1569994 (= e!875219 (contains!10382 (t!51696 lt!673073) (tuple2!25441 key1!37 v1!32)))))

(assert (= (and d!163803 res!1072839) b!1569993))

(assert (= (and b!1569993 (not res!1072838)) b!1569994))

(declare-fun m!1443401 () Bool)

(assert (=> d!163803 m!1443401))

(declare-fun m!1443403 () Bool)

(assert (=> d!163803 m!1443403))

(declare-fun m!1443405 () Bool)

(assert (=> b!1569994 m!1443405))

(assert (=> b!1569749 d!163803))

(declare-fun d!163805 () Bool)

(declare-fun res!1072840 () Bool)

(declare-fun e!875220 () Bool)

(assert (=> d!163805 (=> res!1072840 e!875220)))

(assert (=> d!163805 (= res!1072840 (or ((_ is Nil!36793) (t!51696 (t!51696 l!750))) ((_ is Nil!36793) (t!51696 (t!51696 (t!51696 l!750))))))))

(assert (=> d!163805 (= (isStrictlySorted!1017 (t!51696 (t!51696 l!750))) e!875220)))

(declare-fun b!1569995 () Bool)

(declare-fun e!875221 () Bool)

(assert (=> b!1569995 (= e!875220 e!875221)))

(declare-fun res!1072841 () Bool)

(assert (=> b!1569995 (=> (not res!1072841) (not e!875221))))

(assert (=> b!1569995 (= res!1072841 (bvslt (_1!12731 (h!38240 (t!51696 (t!51696 l!750)))) (_1!12731 (h!38240 (t!51696 (t!51696 (t!51696 l!750)))))))))

(declare-fun b!1569996 () Bool)

(assert (=> b!1569996 (= e!875221 (isStrictlySorted!1017 (t!51696 (t!51696 (t!51696 l!750)))))))

(assert (= (and d!163805 (not res!1072840)) b!1569995))

(assert (= (and b!1569995 res!1072841) b!1569996))

(declare-fun m!1443407 () Bool)

(assert (=> b!1569996 m!1443407))

(assert (=> b!1569629 d!163805))

(declare-fun bm!72175 () Bool)

(declare-fun call!72180 () List!36796)

(declare-fun call!72178 () List!36796)

(assert (=> bm!72175 (= call!72180 call!72178)))

(declare-fun b!1569997 () Bool)

(declare-fun c!144832 () Bool)

(assert (=> b!1569997 (= c!144832 (and ((_ is Cons!36792) (t!51696 (insertStrictlySorted!597 l!750 key1!37 v1!32))) (bvsgt (_1!12731 (h!38240 (t!51696 (insertStrictlySorted!597 l!750 key1!37 v1!32)))) key2!21)))))

(declare-fun e!875223 () List!36796)

(declare-fun e!875226 () List!36796)

(assert (=> b!1569997 (= e!875223 e!875226)))

(declare-fun b!1569998 () Bool)

(assert (=> b!1569998 (= e!875223 call!72178)))

(declare-fun b!1569999 () Bool)

(assert (=> b!1569999 (= e!875226 call!72180)))

(declare-fun b!1570000 () Bool)

(declare-fun e!875222 () List!36796)

(assert (=> b!1570000 (= e!875222 e!875223)))

(declare-fun c!144834 () Bool)

(assert (=> b!1570000 (= c!144834 (and ((_ is Cons!36792) (t!51696 (insertStrictlySorted!597 l!750 key1!37 v1!32))) (= (_1!12731 (h!38240 (t!51696 (insertStrictlySorted!597 l!750 key1!37 v1!32)))) key2!21)))))

(declare-fun call!72179 () List!36796)

(declare-fun c!144831 () Bool)

(declare-fun bm!72176 () Bool)

(declare-fun e!875224 () List!36796)

(assert (=> bm!72176 (= call!72179 ($colon$colon!1002 e!875224 (ite c!144831 (h!38240 (t!51696 (insertStrictlySorted!597 l!750 key1!37 v1!32))) (tuple2!25441 key2!21 v2!10))))))

(declare-fun c!144833 () Bool)

(assert (=> bm!72176 (= c!144833 c!144831)))

(declare-fun b!1570001 () Bool)

(assert (=> b!1570001 (= e!875222 call!72179)))

(declare-fun b!1570002 () Bool)

(assert (=> b!1570002 (= e!875226 call!72180)))

(declare-fun e!875225 () Bool)

(declare-fun b!1570004 () Bool)

(declare-fun lt!673104 () List!36796)

(assert (=> b!1570004 (= e!875225 (contains!10382 lt!673104 (tuple2!25441 key2!21 v2!10)))))

(declare-fun b!1570005 () Bool)

(assert (=> b!1570005 (= e!875224 (insertStrictlySorted!597 (t!51696 (t!51696 (insertStrictlySorted!597 l!750 key1!37 v1!32))) key2!21 v2!10))))

(declare-fun b!1570006 () Bool)

(assert (=> b!1570006 (= e!875224 (ite c!144834 (t!51696 (t!51696 (insertStrictlySorted!597 l!750 key1!37 v1!32))) (ite c!144832 (Cons!36792 (h!38240 (t!51696 (insertStrictlySorted!597 l!750 key1!37 v1!32))) (t!51696 (t!51696 (insertStrictlySorted!597 l!750 key1!37 v1!32)))) Nil!36793)))))

(declare-fun bm!72177 () Bool)

(assert (=> bm!72177 (= call!72178 call!72179)))

(declare-fun b!1570003 () Bool)

(declare-fun res!1072842 () Bool)

(assert (=> b!1570003 (=> (not res!1072842) (not e!875225))))

(assert (=> b!1570003 (= res!1072842 (containsKey!866 lt!673104 key2!21))))

(declare-fun d!163807 () Bool)

(assert (=> d!163807 e!875225))

(declare-fun res!1072843 () Bool)

(assert (=> d!163807 (=> (not res!1072843) (not e!875225))))

(assert (=> d!163807 (= res!1072843 (isStrictlySorted!1017 lt!673104))))

(assert (=> d!163807 (= lt!673104 e!875222)))

(assert (=> d!163807 (= c!144831 (and ((_ is Cons!36792) (t!51696 (insertStrictlySorted!597 l!750 key1!37 v1!32))) (bvslt (_1!12731 (h!38240 (t!51696 (insertStrictlySorted!597 l!750 key1!37 v1!32)))) key2!21)))))

(assert (=> d!163807 (isStrictlySorted!1017 (t!51696 (insertStrictlySorted!597 l!750 key1!37 v1!32)))))

(assert (=> d!163807 (= (insertStrictlySorted!597 (t!51696 (insertStrictlySorted!597 l!750 key1!37 v1!32)) key2!21 v2!10) lt!673104)))

(assert (= (and d!163807 c!144831) b!1570001))

(assert (= (and d!163807 (not c!144831)) b!1570000))

(assert (= (and b!1570000 c!144834) b!1569998))

(assert (= (and b!1570000 (not c!144834)) b!1569997))

(assert (= (and b!1569997 c!144832) b!1570002))

(assert (= (and b!1569997 (not c!144832)) b!1569999))

(assert (= (or b!1570002 b!1569999) bm!72175))

(assert (= (or b!1569998 bm!72175) bm!72177))

(assert (= (or b!1570001 bm!72177) bm!72176))

(assert (= (and bm!72176 c!144833) b!1570005))

(assert (= (and bm!72176 (not c!144833)) b!1570006))

(assert (= (and d!163807 res!1072843) b!1570003))

(assert (= (and b!1570003 res!1072842) b!1570004))

(declare-fun m!1443409 () Bool)

(assert (=> bm!72176 m!1443409))

(declare-fun m!1443411 () Bool)

(assert (=> b!1570005 m!1443411))

(declare-fun m!1443413 () Bool)

(assert (=> b!1570004 m!1443413))

(declare-fun m!1443415 () Bool)

(assert (=> b!1570003 m!1443415))

(declare-fun m!1443417 () Bool)

(assert (=> d!163807 m!1443417))

(declare-fun m!1443419 () Bool)

(assert (=> d!163807 m!1443419))

(assert (=> b!1569720 d!163807))

(assert (=> b!1569730 d!163745))

(declare-fun d!163809 () Bool)

(declare-fun res!1072844 () Bool)

(declare-fun e!875227 () Bool)

(assert (=> d!163809 (=> res!1072844 e!875227)))

(assert (=> d!163809 (= res!1072844 (and ((_ is Cons!36792) lt!673073) (= (_1!12731 (h!38240 lt!673073)) key1!37)))))

(assert (=> d!163809 (= (containsKey!866 lt!673073 key1!37) e!875227)))

(declare-fun b!1570007 () Bool)

(declare-fun e!875228 () Bool)

(assert (=> b!1570007 (= e!875227 e!875228)))

(declare-fun res!1072845 () Bool)

(assert (=> b!1570007 (=> (not res!1072845) (not e!875228))))

(assert (=> b!1570007 (= res!1072845 (and (or (not ((_ is Cons!36792) lt!673073)) (bvsle (_1!12731 (h!38240 lt!673073)) key1!37)) ((_ is Cons!36792) lt!673073) (bvslt (_1!12731 (h!38240 lt!673073)) key1!37)))))

(declare-fun b!1570008 () Bool)

(assert (=> b!1570008 (= e!875228 (containsKey!866 (t!51696 lt!673073) key1!37))))

(assert (= (and d!163809 (not res!1072844)) b!1570007))

(assert (= (and b!1570007 res!1072845) b!1570008))

(declare-fun m!1443421 () Bool)

(assert (=> b!1570008 m!1443421))

(assert (=> b!1569748 d!163809))

(declare-fun lt!673105 () Bool)

(declare-fun d!163811 () Bool)

(assert (=> d!163811 (= lt!673105 (select (content!806 lt!673070) (tuple2!25441 key2!21 v2!10)))))

(declare-fun e!875229 () Bool)

(assert (=> d!163811 (= lt!673105 e!875229)))

(declare-fun res!1072847 () Bool)

(assert (=> d!163811 (=> (not res!1072847) (not e!875229))))

(assert (=> d!163811 (= res!1072847 ((_ is Cons!36792) lt!673070))))

(assert (=> d!163811 (= (contains!10382 lt!673070 (tuple2!25441 key2!21 v2!10)) lt!673105)))

(declare-fun b!1570009 () Bool)

(declare-fun e!875230 () Bool)

(assert (=> b!1570009 (= e!875229 e!875230)))

(declare-fun res!1072846 () Bool)

(assert (=> b!1570009 (=> res!1072846 e!875230)))

(assert (=> b!1570009 (= res!1072846 (= (h!38240 lt!673070) (tuple2!25441 key2!21 v2!10)))))

(declare-fun b!1570010 () Bool)

(assert (=> b!1570010 (= e!875230 (contains!10382 (t!51696 lt!673070) (tuple2!25441 key2!21 v2!10)))))

(assert (= (and d!163811 res!1072847) b!1570009))

(assert (= (and b!1570009 (not res!1072846)) b!1570010))

(declare-fun m!1443423 () Bool)

(assert (=> d!163811 m!1443423))

(declare-fun m!1443425 () Bool)

(assert (=> d!163811 m!1443425))

(declare-fun m!1443427 () Bool)

(assert (=> b!1570010 m!1443427))

(assert (=> b!1569719 d!163811))

(declare-fun lt!673106 () Bool)

(declare-fun d!163813 () Bool)

(assert (=> d!163813 (= lt!673106 (select (content!806 lt!673071) (tuple2!25441 key2!21 v2!10)))))

(declare-fun e!875231 () Bool)

(assert (=> d!163813 (= lt!673106 e!875231)))

(declare-fun res!1072849 () Bool)

(assert (=> d!163813 (=> (not res!1072849) (not e!875231))))

(assert (=> d!163813 (= res!1072849 ((_ is Cons!36792) lt!673071))))

(assert (=> d!163813 (= (contains!10382 lt!673071 (tuple2!25441 key2!21 v2!10)) lt!673106)))

(declare-fun b!1570011 () Bool)

(declare-fun e!875232 () Bool)

(assert (=> b!1570011 (= e!875231 e!875232)))

(declare-fun res!1072848 () Bool)

(assert (=> b!1570011 (=> res!1072848 e!875232)))

(assert (=> b!1570011 (= res!1072848 (= (h!38240 lt!673071) (tuple2!25441 key2!21 v2!10)))))

(declare-fun b!1570012 () Bool)

(assert (=> b!1570012 (= e!875232 (contains!10382 (t!51696 lt!673071) (tuple2!25441 key2!21 v2!10)))))

(assert (= (and d!163813 res!1072849) b!1570011))

(assert (= (and b!1570011 (not res!1072848)) b!1570012))

(declare-fun m!1443429 () Bool)

(assert (=> d!163813 m!1443429))

(declare-fun m!1443431 () Bool)

(assert (=> d!163813 m!1443431))

(declare-fun m!1443433 () Bool)

(assert (=> b!1570012 m!1443433))

(assert (=> b!1569729 d!163813))

(declare-fun bm!72178 () Bool)

(declare-fun call!72183 () List!36796)

(declare-fun call!72181 () List!36796)

(assert (=> bm!72178 (= call!72183 call!72181)))

(declare-fun b!1570013 () Bool)

(declare-fun c!144836 () Bool)

(assert (=> b!1570013 (= c!144836 (and ((_ is Cons!36792) (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32))) (bvsgt (_1!12731 (h!38240 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32)))) key2!21)))))

(declare-fun e!875234 () List!36796)

(declare-fun e!875237 () List!36796)

(assert (=> b!1570013 (= e!875234 e!875237)))

(declare-fun b!1570014 () Bool)

(assert (=> b!1570014 (= e!875234 call!72181)))

(declare-fun b!1570015 () Bool)

(assert (=> b!1570015 (= e!875237 call!72183)))

(declare-fun b!1570016 () Bool)

(declare-fun e!875233 () List!36796)

(assert (=> b!1570016 (= e!875233 e!875234)))

(declare-fun c!144838 () Bool)

(assert (=> b!1570016 (= c!144838 (and ((_ is Cons!36792) (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32))) (= (_1!12731 (h!38240 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32)))) key2!21)))))

(declare-fun e!875235 () List!36796)

(declare-fun c!144835 () Bool)

(declare-fun bm!72179 () Bool)

(declare-fun call!72182 () List!36796)

(assert (=> bm!72179 (= call!72182 ($colon$colon!1002 e!875235 (ite c!144835 (h!38240 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32))) (tuple2!25441 key2!21 v2!10))))))

(declare-fun c!144837 () Bool)

(assert (=> bm!72179 (= c!144837 c!144835)))

(declare-fun b!1570017 () Bool)

(assert (=> b!1570017 (= e!875233 call!72182)))

(declare-fun b!1570018 () Bool)

(assert (=> b!1570018 (= e!875237 call!72183)))

(declare-fun e!875236 () Bool)

(declare-fun lt!673107 () List!36796)

(declare-fun b!1570020 () Bool)

(assert (=> b!1570020 (= e!875236 (contains!10382 lt!673107 (tuple2!25441 key2!21 v2!10)))))

(declare-fun b!1570021 () Bool)

(assert (=> b!1570021 (= e!875235 (insertStrictlySorted!597 (t!51696 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32))) key2!21 v2!10))))

(declare-fun b!1570022 () Bool)

(assert (=> b!1570022 (= e!875235 (ite c!144838 (t!51696 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32))) (ite c!144836 (Cons!36792 (h!38240 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32))) (t!51696 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32)))) Nil!36793)))))

(declare-fun bm!72180 () Bool)

(assert (=> bm!72180 (= call!72181 call!72182)))

(declare-fun b!1570019 () Bool)

(declare-fun res!1072850 () Bool)

(assert (=> b!1570019 (=> (not res!1072850) (not e!875236))))

(assert (=> b!1570019 (= res!1072850 (containsKey!866 lt!673107 key2!21))))

(declare-fun d!163815 () Bool)

(assert (=> d!163815 e!875236))

(declare-fun res!1072851 () Bool)

(assert (=> d!163815 (=> (not res!1072851) (not e!875236))))

(assert (=> d!163815 (= res!1072851 (isStrictlySorted!1017 lt!673107))))

(assert (=> d!163815 (= lt!673107 e!875233)))

(assert (=> d!163815 (= c!144835 (and ((_ is Cons!36792) (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32))) (bvslt (_1!12731 (h!38240 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32)))) key2!21)))))

(assert (=> d!163815 (isStrictlySorted!1017 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32)))))

(assert (=> d!163815 (= (insertStrictlySorted!597 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32)) key2!21 v2!10) lt!673107)))

(assert (= (and d!163815 c!144835) b!1570017))

(assert (= (and d!163815 (not c!144835)) b!1570016))

(assert (= (and b!1570016 c!144838) b!1570014))

(assert (= (and b!1570016 (not c!144838)) b!1570013))

(assert (= (and b!1570013 c!144836) b!1570018))

(assert (= (and b!1570013 (not c!144836)) b!1570015))

(assert (= (or b!1570018 b!1570015) bm!72178))

(assert (= (or b!1570014 bm!72178) bm!72180))

(assert (= (or b!1570017 bm!72180) bm!72179))

(assert (= (and bm!72179 c!144837) b!1570021))

(assert (= (and bm!72179 (not c!144837)) b!1570022))

(assert (= (and d!163815 res!1072851) b!1570019))

(assert (= (and b!1570019 res!1072850) b!1570020))

(declare-fun m!1443435 () Bool)

(assert (=> bm!72179 m!1443435))

(declare-fun m!1443437 () Bool)

(assert (=> b!1570021 m!1443437))

(declare-fun m!1443439 () Bool)

(assert (=> b!1570020 m!1443439))

(declare-fun m!1443441 () Bool)

(assert (=> b!1570019 m!1443441))

(declare-fun m!1443443 () Bool)

(assert (=> d!163815 m!1443443))

(declare-fun m!1443445 () Bool)

(assert (=> d!163815 m!1443445))

(assert (=> b!1569770 d!163815))

(declare-fun d!163817 () Bool)

(declare-fun res!1072852 () Bool)

(declare-fun e!875238 () Bool)

(assert (=> d!163817 (=> res!1072852 e!875238)))

(assert (=> d!163817 (= res!1072852 (or ((_ is Nil!36793) lt!673082) ((_ is Nil!36793) (t!51696 lt!673082))))))

(assert (=> d!163817 (= (isStrictlySorted!1017 lt!673082) e!875238)))

(declare-fun b!1570023 () Bool)

(declare-fun e!875239 () Bool)

(assert (=> b!1570023 (= e!875238 e!875239)))

(declare-fun res!1072853 () Bool)

(assert (=> b!1570023 (=> (not res!1072853) (not e!875239))))

(assert (=> b!1570023 (= res!1072853 (bvslt (_1!12731 (h!38240 lt!673082)) (_1!12731 (h!38240 (t!51696 lt!673082)))))))

(declare-fun b!1570024 () Bool)

(assert (=> b!1570024 (= e!875239 (isStrictlySorted!1017 (t!51696 lt!673082)))))

(assert (= (and d!163817 (not res!1072852)) b!1570023))

(assert (= (and b!1570023 res!1072853) b!1570024))

(declare-fun m!1443447 () Bool)

(assert (=> b!1570024 m!1443447))

(assert (=> d!163749 d!163817))

(assert (=> d!163749 d!163719))

(declare-fun d!163819 () Bool)

(declare-fun res!1072854 () Bool)

(declare-fun e!875240 () Bool)

(assert (=> d!163819 (=> res!1072854 e!875240)))

(assert (=> d!163819 (= res!1072854 (and ((_ is Cons!36792) lt!673070) (= (_1!12731 (h!38240 lt!673070)) key2!21)))))

(assert (=> d!163819 (= (containsKey!866 lt!673070 key2!21) e!875240)))

(declare-fun b!1570025 () Bool)

(declare-fun e!875241 () Bool)

(assert (=> b!1570025 (= e!875240 e!875241)))

(declare-fun res!1072855 () Bool)

(assert (=> b!1570025 (=> (not res!1072855) (not e!875241))))

(assert (=> b!1570025 (= res!1072855 (and (or (not ((_ is Cons!36792) lt!673070)) (bvsle (_1!12731 (h!38240 lt!673070)) key2!21)) ((_ is Cons!36792) lt!673070) (bvslt (_1!12731 (h!38240 lt!673070)) key2!21)))))

(declare-fun b!1570026 () Bool)

(assert (=> b!1570026 (= e!875241 (containsKey!866 (t!51696 lt!673070) key2!21))))

(assert (= (and d!163819 (not res!1072854)) b!1570025))

(assert (= (and b!1570025 res!1072855) b!1570026))

(declare-fun m!1443449 () Bool)

(assert (=> b!1570026 m!1443449))

(assert (=> b!1569718 d!163819))

(declare-fun d!163821 () Bool)

(declare-fun res!1072856 () Bool)

(declare-fun e!875242 () Bool)

(assert (=> d!163821 (=> res!1072856 e!875242)))

(assert (=> d!163821 (= res!1072856 (and ((_ is Cons!36792) lt!673071) (= (_1!12731 (h!38240 lt!673071)) key2!21)))))

(assert (=> d!163821 (= (containsKey!866 lt!673071 key2!21) e!875242)))

(declare-fun b!1570027 () Bool)

(declare-fun e!875243 () Bool)

(assert (=> b!1570027 (= e!875242 e!875243)))

(declare-fun res!1072857 () Bool)

(assert (=> b!1570027 (=> (not res!1072857) (not e!875243))))

(assert (=> b!1570027 (= res!1072857 (and (or (not ((_ is Cons!36792) lt!673071)) (bvsle (_1!12731 (h!38240 lt!673071)) key2!21)) ((_ is Cons!36792) lt!673071) (bvslt (_1!12731 (h!38240 lt!673071)) key2!21)))))

(declare-fun b!1570028 () Bool)

(assert (=> b!1570028 (= e!875243 (containsKey!866 (t!51696 lt!673071) key2!21))))

(assert (= (and d!163821 (not res!1072856)) b!1570027))

(assert (= (and b!1570027 res!1072857) b!1570028))

(declare-fun m!1443451 () Bool)

(assert (=> b!1570028 m!1443451))

(assert (=> b!1569728 d!163821))

(declare-fun d!163823 () Bool)

(assert (=> d!163823 (= ($colon$colon!1002 e!875105 (ite c!144767 (h!38240 (t!51696 l!750)) (tuple2!25441 key1!37 v1!32))) (Cons!36792 (ite c!144767 (h!38240 (t!51696 l!750)) (tuple2!25441 key1!37 v1!32)) e!875105))))

(assert (=> bm!72128 d!163823))

(declare-fun d!163825 () Bool)

(declare-fun res!1072858 () Bool)

(declare-fun e!875244 () Bool)

(assert (=> d!163825 (=> res!1072858 e!875244)))

(assert (=> d!163825 (= res!1072858 (or ((_ is Nil!36793) lt!673073) ((_ is Nil!36793) (t!51696 lt!673073))))))

(assert (=> d!163825 (= (isStrictlySorted!1017 lt!673073) e!875244)))

(declare-fun b!1570029 () Bool)

(declare-fun e!875245 () Bool)

(assert (=> b!1570029 (= e!875244 e!875245)))

(declare-fun res!1072859 () Bool)

(assert (=> b!1570029 (=> (not res!1072859) (not e!875245))))

(assert (=> b!1570029 (= res!1072859 (bvslt (_1!12731 (h!38240 lt!673073)) (_1!12731 (h!38240 (t!51696 lt!673073)))))))

(declare-fun b!1570030 () Bool)

(assert (=> b!1570030 (= e!875245 (isStrictlySorted!1017 (t!51696 lt!673073)))))

(assert (= (and d!163825 (not res!1072858)) b!1570029))

(assert (= (and b!1570029 res!1072859) b!1570030))

(declare-fun m!1443453 () Bool)

(assert (=> b!1570030 m!1443453))

(assert (=> d!163737 d!163825))

(assert (=> d!163737 d!163753))

(declare-fun lt!673108 () Bool)

(declare-fun d!163827 () Bool)

(assert (=> d!163827 (= lt!673108 (select (content!806 lt!673075) (tuple2!25441 key2!21 v2!10)))))

(declare-fun e!875246 () Bool)

(assert (=> d!163827 (= lt!673108 e!875246)))

(declare-fun res!1072861 () Bool)

(assert (=> d!163827 (=> (not res!1072861) (not e!875246))))

(assert (=> d!163827 (= res!1072861 ((_ is Cons!36792) lt!673075))))

(assert (=> d!163827 (= (contains!10382 lt!673075 (tuple2!25441 key2!21 v2!10)) lt!673108)))

(declare-fun b!1570031 () Bool)

(declare-fun e!875247 () Bool)

(assert (=> b!1570031 (= e!875246 e!875247)))

(declare-fun res!1072860 () Bool)

(assert (=> b!1570031 (=> res!1072860 e!875247)))

(assert (=> b!1570031 (= res!1072860 (= (h!38240 lt!673075) (tuple2!25441 key2!21 v2!10)))))

(declare-fun b!1570032 () Bool)

(assert (=> b!1570032 (= e!875247 (contains!10382 (t!51696 lt!673075) (tuple2!25441 key2!21 v2!10)))))

(assert (= (and d!163827 res!1072861) b!1570031))

(assert (= (and b!1570031 (not res!1072860)) b!1570032))

(declare-fun m!1443455 () Bool)

(assert (=> d!163827 m!1443455))

(declare-fun m!1443457 () Bool)

(assert (=> d!163827 m!1443457))

(declare-fun m!1443459 () Bool)

(assert (=> b!1570032 m!1443459))

(assert (=> b!1569769 d!163827))

(declare-fun d!163829 () Bool)

(assert (=> d!163829 (= ($colon$colon!1002 e!875080 (ite c!144747 (h!38240 l!750) (tuple2!25441 key1!37 v1!32))) (Cons!36792 (ite c!144747 (h!38240 l!750) (tuple2!25441 key1!37 v1!32)) e!875080))))

(assert (=> bm!72113 d!163829))

(declare-fun d!163831 () Bool)

(declare-fun res!1072862 () Bool)

(declare-fun e!875248 () Bool)

(assert (=> d!163831 (=> res!1072862 e!875248)))

(assert (=> d!163831 (= res!1072862 (and ((_ is Cons!36792) lt!673075) (= (_1!12731 (h!38240 lt!673075)) key2!21)))))

(assert (=> d!163831 (= (containsKey!866 lt!673075 key2!21) e!875248)))

(declare-fun b!1570033 () Bool)

(declare-fun e!875249 () Bool)

(assert (=> b!1570033 (= e!875248 e!875249)))

(declare-fun res!1072863 () Bool)

(assert (=> b!1570033 (=> (not res!1072863) (not e!875249))))

(assert (=> b!1570033 (= res!1072863 (and (or (not ((_ is Cons!36792) lt!673075)) (bvsle (_1!12731 (h!38240 lt!673075)) key2!21)) ((_ is Cons!36792) lt!673075) (bvslt (_1!12731 (h!38240 lt!673075)) key2!21)))))

(declare-fun b!1570034 () Bool)

(assert (=> b!1570034 (= e!875249 (containsKey!866 (t!51696 lt!673075) key2!21))))

(assert (= (and d!163831 (not res!1072862)) b!1570033))

(assert (= (and b!1570033 res!1072863) b!1570034))

(declare-fun m!1443461 () Bool)

(assert (=> b!1570034 m!1443461))

(assert (=> b!1569768 d!163831))

(declare-fun d!163833 () Bool)

(declare-fun res!1072864 () Bool)

(declare-fun e!875250 () Bool)

(assert (=> d!163833 (=> res!1072864 e!875250)))

(assert (=> d!163833 (= res!1072864 (or ((_ is Nil!36793) lt!673070) ((_ is Nil!36793) (t!51696 lt!673070))))))

(assert (=> d!163833 (= (isStrictlySorted!1017 lt!673070) e!875250)))

(declare-fun b!1570035 () Bool)

(declare-fun e!875251 () Bool)

(assert (=> b!1570035 (= e!875250 e!875251)))

(declare-fun res!1072865 () Bool)

(assert (=> b!1570035 (=> (not res!1072865) (not e!875251))))

(assert (=> b!1570035 (= res!1072865 (bvslt (_1!12731 (h!38240 lt!673070)) (_1!12731 (h!38240 (t!51696 lt!673070)))))))

(declare-fun b!1570036 () Bool)

(assert (=> b!1570036 (= e!875251 (isStrictlySorted!1017 (t!51696 lt!673070)))))

(assert (= (and d!163833 (not res!1072864)) b!1570035))

(assert (= (and b!1570035 res!1072865) b!1570036))

(declare-fun m!1443463 () Bool)

(assert (=> b!1570036 m!1443463))

(assert (=> d!163733 d!163833))

(declare-fun d!163835 () Bool)

(declare-fun res!1072866 () Bool)

(declare-fun e!875252 () Bool)

(assert (=> d!163835 (=> res!1072866 e!875252)))

(assert (=> d!163835 (= res!1072866 (or ((_ is Nil!36793) (insertStrictlySorted!597 l!750 key1!37 v1!32)) ((_ is Nil!36793) (t!51696 (insertStrictlySorted!597 l!750 key1!37 v1!32)))))))

(assert (=> d!163835 (= (isStrictlySorted!1017 (insertStrictlySorted!597 l!750 key1!37 v1!32)) e!875252)))

(declare-fun b!1570037 () Bool)

(declare-fun e!875253 () Bool)

(assert (=> b!1570037 (= e!875252 e!875253)))

(declare-fun res!1072867 () Bool)

(assert (=> b!1570037 (=> (not res!1072867) (not e!875253))))

(assert (=> b!1570037 (= res!1072867 (bvslt (_1!12731 (h!38240 (insertStrictlySorted!597 l!750 key1!37 v1!32))) (_1!12731 (h!38240 (t!51696 (insertStrictlySorted!597 l!750 key1!37 v1!32))))))))

(declare-fun b!1570038 () Bool)

(assert (=> b!1570038 (= e!875253 (isStrictlySorted!1017 (t!51696 (insertStrictlySorted!597 l!750 key1!37 v1!32))))))

(assert (= (and d!163835 (not res!1072866)) b!1570037))

(assert (= (and b!1570037 res!1072867) b!1570038))

(assert (=> b!1570038 m!1443419))

(assert (=> d!163733 d!163835))

(declare-fun d!163837 () Bool)

(assert (=> d!163837 (= ($colon$colon!1002 e!875065 (ite c!144735 (h!38240 (insertStrictlySorted!597 l!750 key1!37 v1!32)) (tuple2!25441 key2!21 v2!10))) (Cons!36792 (ite c!144735 (h!38240 (insertStrictlySorted!597 l!750 key1!37 v1!32)) (tuple2!25441 key2!21 v2!10)) e!875065))))

(assert (=> bm!72104 d!163837))

(declare-fun d!163839 () Bool)

(declare-fun res!1072868 () Bool)

(declare-fun e!875254 () Bool)

(assert (=> d!163839 (=> res!1072868 e!875254)))

(assert (=> d!163839 (= res!1072868 (or ((_ is Nil!36793) lt!673071) ((_ is Nil!36793) (t!51696 lt!673071))))))

(assert (=> d!163839 (= (isStrictlySorted!1017 lt!673071) e!875254)))

(declare-fun b!1570039 () Bool)

(declare-fun e!875255 () Bool)

(assert (=> b!1570039 (= e!875254 e!875255)))

(declare-fun res!1072869 () Bool)

(assert (=> b!1570039 (=> (not res!1072869) (not e!875255))))

(assert (=> b!1570039 (= res!1072869 (bvslt (_1!12731 (h!38240 lt!673071)) (_1!12731 (h!38240 (t!51696 lt!673071)))))))

(declare-fun b!1570040 () Bool)

(assert (=> b!1570040 (= e!875255 (isStrictlySorted!1017 (t!51696 lt!673071)))))

(assert (= (and d!163839 (not res!1072868)) b!1570039))

(assert (= (and b!1570039 res!1072869) b!1570040))

(declare-fun m!1443465 () Bool)

(assert (=> b!1570040 m!1443465))

(assert (=> d!163735 d!163839))

(assert (=> d!163735 d!163753))

(declare-fun d!163841 () Bool)

(assert (=> d!163841 (= ($colon$colon!1002 e!875070 (ite c!144739 (h!38240 l!750) (tuple2!25441 key2!21 v2!10))) (Cons!36792 (ite c!144739 (h!38240 l!750) (tuple2!25441 key2!21 v2!10)) e!875070))))

(assert (=> bm!72107 d!163841))

(declare-fun d!163843 () Bool)

(assert (=> d!163843 (= (insertStrictlySorted!597 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!597 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10) key1!37 v1!32))))

(assert (=> d!163843 true))

(declare-fun _$5!161 () Unit!51905)

(assert (=> d!163843 (= (choose!2093 (t!51696 l!750) key1!37 v1!32 key2!21 v2!10) _$5!161)))

(declare-fun bs!45183 () Bool)

(assert (= bs!45183 d!163843))

(assert (=> bs!45183 m!1443049))

(assert (=> bs!45183 m!1443049))

(assert (=> bs!45183 m!1443051))

(assert (=> bs!45183 m!1443047))

(assert (=> bs!45183 m!1443047))

(assert (=> bs!45183 m!1443063))

(assert (=> d!163731 d!163843))

(assert (=> d!163731 d!163741))

(assert (=> d!163731 d!163745))

(assert (=> d!163731 d!163747))

(assert (=> d!163731 d!163749))

(assert (=> b!1569813 d!163719))

(declare-fun d!163845 () Bool)

(assert (=> d!163845 (= ($colon$colon!1002 e!875090 (ite c!144755 (h!38240 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32)) (tuple2!25441 key2!21 v2!10))) (Cons!36792 (ite c!144755 (h!38240 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32)) (tuple2!25441 key2!21 v2!10)) e!875090))))

(assert (=> bm!72119 d!163845))

(declare-fun bm!72181 () Bool)

(declare-fun call!72186 () List!36796)

(declare-fun call!72184 () List!36796)

(assert (=> bm!72181 (= call!72186 call!72184)))

(declare-fun c!144840 () Bool)

(declare-fun b!1570041 () Bool)

(assert (=> b!1570041 (= c!144840 (and ((_ is Cons!36792) (t!51696 (insertStrictlySorted!597 l!750 key2!21 v2!10))) (bvsgt (_1!12731 (h!38240 (t!51696 (insertStrictlySorted!597 l!750 key2!21 v2!10)))) key1!37)))))

(declare-fun e!875257 () List!36796)

(declare-fun e!875260 () List!36796)

(assert (=> b!1570041 (= e!875257 e!875260)))

(declare-fun b!1570042 () Bool)

(assert (=> b!1570042 (= e!875257 call!72184)))

(declare-fun b!1570043 () Bool)

(assert (=> b!1570043 (= e!875260 call!72186)))

(declare-fun b!1570044 () Bool)

(declare-fun e!875256 () List!36796)

(assert (=> b!1570044 (= e!875256 e!875257)))

(declare-fun c!144842 () Bool)

(assert (=> b!1570044 (= c!144842 (and ((_ is Cons!36792) (t!51696 (insertStrictlySorted!597 l!750 key2!21 v2!10))) (= (_1!12731 (h!38240 (t!51696 (insertStrictlySorted!597 l!750 key2!21 v2!10)))) key1!37)))))

(declare-fun call!72185 () List!36796)

(declare-fun e!875258 () List!36796)

(declare-fun c!144839 () Bool)

(declare-fun bm!72182 () Bool)

(assert (=> bm!72182 (= call!72185 ($colon$colon!1002 e!875258 (ite c!144839 (h!38240 (t!51696 (insertStrictlySorted!597 l!750 key2!21 v2!10))) (tuple2!25441 key1!37 v1!32))))))

(declare-fun c!144841 () Bool)

(assert (=> bm!72182 (= c!144841 c!144839)))

(declare-fun b!1570045 () Bool)

(assert (=> b!1570045 (= e!875256 call!72185)))

(declare-fun b!1570046 () Bool)

(assert (=> b!1570046 (= e!875260 call!72186)))

(declare-fun lt!673109 () List!36796)

(declare-fun e!875259 () Bool)

(declare-fun b!1570048 () Bool)

(assert (=> b!1570048 (= e!875259 (contains!10382 lt!673109 (tuple2!25441 key1!37 v1!32)))))

(declare-fun b!1570049 () Bool)

(assert (=> b!1570049 (= e!875258 (insertStrictlySorted!597 (t!51696 (t!51696 (insertStrictlySorted!597 l!750 key2!21 v2!10))) key1!37 v1!32))))

(declare-fun b!1570050 () Bool)

(assert (=> b!1570050 (= e!875258 (ite c!144842 (t!51696 (t!51696 (insertStrictlySorted!597 l!750 key2!21 v2!10))) (ite c!144840 (Cons!36792 (h!38240 (t!51696 (insertStrictlySorted!597 l!750 key2!21 v2!10))) (t!51696 (t!51696 (insertStrictlySorted!597 l!750 key2!21 v2!10)))) Nil!36793)))))

(declare-fun bm!72183 () Bool)

(assert (=> bm!72183 (= call!72184 call!72185)))

(declare-fun b!1570047 () Bool)

(declare-fun res!1072870 () Bool)

(assert (=> b!1570047 (=> (not res!1072870) (not e!875259))))

(assert (=> b!1570047 (= res!1072870 (containsKey!866 lt!673109 key1!37))))

(declare-fun d!163847 () Bool)

(assert (=> d!163847 e!875259))

(declare-fun res!1072871 () Bool)

(assert (=> d!163847 (=> (not res!1072871) (not e!875259))))

(assert (=> d!163847 (= res!1072871 (isStrictlySorted!1017 lt!673109))))

(assert (=> d!163847 (= lt!673109 e!875256)))

(assert (=> d!163847 (= c!144839 (and ((_ is Cons!36792) (t!51696 (insertStrictlySorted!597 l!750 key2!21 v2!10))) (bvslt (_1!12731 (h!38240 (t!51696 (insertStrictlySorted!597 l!750 key2!21 v2!10)))) key1!37)))))

(assert (=> d!163847 (isStrictlySorted!1017 (t!51696 (insertStrictlySorted!597 l!750 key2!21 v2!10)))))

(assert (=> d!163847 (= (insertStrictlySorted!597 (t!51696 (insertStrictlySorted!597 l!750 key2!21 v2!10)) key1!37 v1!32) lt!673109)))

(assert (= (and d!163847 c!144839) b!1570045))

(assert (= (and d!163847 (not c!144839)) b!1570044))

(assert (= (and b!1570044 c!144842) b!1570042))

(assert (= (and b!1570044 (not c!144842)) b!1570041))

(assert (= (and b!1570041 c!144840) b!1570046))

(assert (= (and b!1570041 (not c!144840)) b!1570043))

(assert (= (or b!1570046 b!1570043) bm!72181))

(assert (= (or b!1570042 bm!72181) bm!72183))

(assert (= (or b!1570045 bm!72183) bm!72182))

(assert (= (and bm!72182 c!144841) b!1570049))

(assert (= (and bm!72182 (not c!144841)) b!1570050))

(assert (= (and d!163847 res!1072871) b!1570047))

(assert (= (and b!1570047 res!1072870) b!1570048))

(declare-fun m!1443467 () Bool)

(assert (=> bm!72182 m!1443467))

(declare-fun m!1443469 () Bool)

(assert (=> b!1570049 m!1443469))

(declare-fun m!1443471 () Bool)

(assert (=> b!1570048 m!1443471))

(declare-fun m!1443473 () Bool)

(assert (=> b!1570047 m!1443473))

(declare-fun m!1443475 () Bool)

(assert (=> d!163847 m!1443475))

(assert (=> d!163847 m!1443377))

(assert (=> b!1569670 d!163847))

(declare-fun d!163849 () Bool)

(declare-fun res!1072872 () Bool)

(declare-fun e!875261 () Bool)

(assert (=> d!163849 (=> res!1072872 e!875261)))

(assert (=> d!163849 (= res!1072872 (or ((_ is Nil!36793) lt!673075) ((_ is Nil!36793) (t!51696 lt!673075))))))

(assert (=> d!163849 (= (isStrictlySorted!1017 lt!673075) e!875261)))

(declare-fun b!1570051 () Bool)

(declare-fun e!875262 () Bool)

(assert (=> b!1570051 (= e!875261 e!875262)))

(declare-fun res!1072873 () Bool)

(assert (=> b!1570051 (=> (not res!1072873) (not e!875262))))

(assert (=> b!1570051 (= res!1072873 (bvslt (_1!12731 (h!38240 lt!673075)) (_1!12731 (h!38240 (t!51696 lt!673075)))))))

(declare-fun b!1570052 () Bool)

(assert (=> b!1570052 (= e!875262 (isStrictlySorted!1017 (t!51696 lt!673075)))))

(assert (= (and d!163849 (not res!1072872)) b!1570051))

(assert (= (and b!1570051 res!1072873) b!1570052))

(declare-fun m!1443477 () Bool)

(assert (=> b!1570052 m!1443477))

(assert (=> d!163741 d!163849))

(declare-fun d!163851 () Bool)

(declare-fun res!1072874 () Bool)

(declare-fun e!875263 () Bool)

(assert (=> d!163851 (=> res!1072874 e!875263)))

(assert (=> d!163851 (= res!1072874 (or ((_ is Nil!36793) (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32)) ((_ is Nil!36793) (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32)))))))

(assert (=> d!163851 (= (isStrictlySorted!1017 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32)) e!875263)))

(declare-fun b!1570053 () Bool)

(declare-fun e!875264 () Bool)

(assert (=> b!1570053 (= e!875263 e!875264)))

(declare-fun res!1072875 () Bool)

(assert (=> b!1570053 (=> (not res!1072875) (not e!875264))))

(assert (=> b!1570053 (= res!1072875 (bvslt (_1!12731 (h!38240 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32))) (_1!12731 (h!38240 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32))))))))

(declare-fun b!1570054 () Bool)

(assert (=> b!1570054 (= e!875264 (isStrictlySorted!1017 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key1!37 v1!32))))))

(assert (= (and d!163851 (not res!1072874)) b!1570053))

(assert (= (and b!1570053 res!1072875) b!1570054))

(assert (=> b!1570054 m!1443445))

(assert (=> d!163741 d!163851))

(declare-fun d!163853 () Bool)

(declare-fun lt!673110 () Bool)

(assert (=> d!163853 (= lt!673110 (select (content!806 lt!673062) (tuple2!25441 key1!37 v1!32)))))

(declare-fun e!875265 () Bool)

(assert (=> d!163853 (= lt!673110 e!875265)))

(declare-fun res!1072877 () Bool)

(assert (=> d!163853 (=> (not res!1072877) (not e!875265))))

(assert (=> d!163853 (= res!1072877 ((_ is Cons!36792) lt!673062))))

(assert (=> d!163853 (= (contains!10382 lt!673062 (tuple2!25441 key1!37 v1!32)) lt!673110)))

(declare-fun b!1570055 () Bool)

(declare-fun e!875266 () Bool)

(assert (=> b!1570055 (= e!875265 e!875266)))

(declare-fun res!1072876 () Bool)

(assert (=> b!1570055 (=> res!1072876 e!875266)))

(assert (=> b!1570055 (= res!1072876 (= (h!38240 lt!673062) (tuple2!25441 key1!37 v1!32)))))

(declare-fun b!1570056 () Bool)

(assert (=> b!1570056 (= e!875266 (contains!10382 (t!51696 lt!673062) (tuple2!25441 key1!37 v1!32)))))

(assert (= (and d!163853 res!1072877) b!1570055))

(assert (= (and b!1570055 (not res!1072876)) b!1570056))

(declare-fun m!1443479 () Bool)

(assert (=> d!163853 m!1443479))

(declare-fun m!1443481 () Bool)

(assert (=> d!163853 m!1443481))

(declare-fun m!1443483 () Bool)

(assert (=> b!1570056 m!1443483))

(assert (=> b!1569669 d!163853))

(declare-fun d!163855 () Bool)

(declare-fun res!1072878 () Bool)

(declare-fun e!875267 () Bool)

(assert (=> d!163855 (=> res!1072878 e!875267)))

(assert (=> d!163855 (= res!1072878 (and ((_ is Cons!36792) lt!673062) (= (_1!12731 (h!38240 lt!673062)) key1!37)))))

(assert (=> d!163855 (= (containsKey!866 lt!673062 key1!37) e!875267)))

(declare-fun b!1570057 () Bool)

(declare-fun e!875268 () Bool)

(assert (=> b!1570057 (= e!875267 e!875268)))

(declare-fun res!1072879 () Bool)

(assert (=> b!1570057 (=> (not res!1072879) (not e!875268))))

(assert (=> b!1570057 (= res!1072879 (and (or (not ((_ is Cons!36792) lt!673062)) (bvsle (_1!12731 (h!38240 lt!673062)) key1!37)) ((_ is Cons!36792) lt!673062) (bvslt (_1!12731 (h!38240 lt!673062)) key1!37)))))

(declare-fun b!1570058 () Bool)

(assert (=> b!1570058 (= e!875268 (containsKey!866 (t!51696 lt!673062) key1!37))))

(assert (= (and d!163855 (not res!1072878)) b!1570057))

(assert (= (and b!1570057 res!1072879) b!1570058))

(declare-fun m!1443485 () Bool)

(assert (=> b!1570058 m!1443485))

(assert (=> b!1569668 d!163855))

(declare-fun bm!72184 () Bool)

(declare-fun call!72189 () List!36796)

(declare-fun call!72187 () List!36796)

(assert (=> bm!72184 (= call!72189 call!72187)))

(declare-fun b!1570059 () Bool)

(declare-fun c!144844 () Bool)

(assert (=> b!1570059 (= c!144844 (and ((_ is Cons!36792) (t!51696 (t!51696 l!750))) (bvsgt (_1!12731 (h!38240 (t!51696 (t!51696 l!750)))) key2!21)))))

(declare-fun e!875270 () List!36796)

(declare-fun e!875273 () List!36796)

(assert (=> b!1570059 (= e!875270 e!875273)))

(declare-fun b!1570060 () Bool)

(assert (=> b!1570060 (= e!875270 call!72187)))

(declare-fun b!1570061 () Bool)

(assert (=> b!1570061 (= e!875273 call!72189)))

(declare-fun b!1570062 () Bool)

(declare-fun e!875269 () List!36796)

(assert (=> b!1570062 (= e!875269 e!875270)))

(declare-fun c!144846 () Bool)

(assert (=> b!1570062 (= c!144846 (and ((_ is Cons!36792) (t!51696 (t!51696 l!750))) (= (_1!12731 (h!38240 (t!51696 (t!51696 l!750)))) key2!21)))))

(declare-fun call!72188 () List!36796)

(declare-fun bm!72185 () Bool)

(declare-fun e!875271 () List!36796)

(declare-fun c!144843 () Bool)

(assert (=> bm!72185 (= call!72188 ($colon$colon!1002 e!875271 (ite c!144843 (h!38240 (t!51696 (t!51696 l!750))) (tuple2!25441 key2!21 v2!10))))))

(declare-fun c!144845 () Bool)

(assert (=> bm!72185 (= c!144845 c!144843)))

(declare-fun b!1570063 () Bool)

(assert (=> b!1570063 (= e!875269 call!72188)))

(declare-fun b!1570064 () Bool)

(assert (=> b!1570064 (= e!875273 call!72189)))

(declare-fun b!1570066 () Bool)

(declare-fun lt!673111 () List!36796)

(declare-fun e!875272 () Bool)

(assert (=> b!1570066 (= e!875272 (contains!10382 lt!673111 (tuple2!25441 key2!21 v2!10)))))

(declare-fun b!1570067 () Bool)

(assert (=> b!1570067 (= e!875271 (insertStrictlySorted!597 (t!51696 (t!51696 (t!51696 l!750))) key2!21 v2!10))))

(declare-fun b!1570068 () Bool)

(assert (=> b!1570068 (= e!875271 (ite c!144846 (t!51696 (t!51696 (t!51696 l!750))) (ite c!144844 (Cons!36792 (h!38240 (t!51696 (t!51696 l!750))) (t!51696 (t!51696 (t!51696 l!750)))) Nil!36793)))))

(declare-fun bm!72186 () Bool)

(assert (=> bm!72186 (= call!72187 call!72188)))

(declare-fun b!1570065 () Bool)

(declare-fun res!1072880 () Bool)

(assert (=> b!1570065 (=> (not res!1072880) (not e!875272))))

(assert (=> b!1570065 (= res!1072880 (containsKey!866 lt!673111 key2!21))))

(declare-fun d!163857 () Bool)

(assert (=> d!163857 e!875272))

(declare-fun res!1072881 () Bool)

(assert (=> d!163857 (=> (not res!1072881) (not e!875272))))

(assert (=> d!163857 (= res!1072881 (isStrictlySorted!1017 lt!673111))))

(assert (=> d!163857 (= lt!673111 e!875269)))

(assert (=> d!163857 (= c!144843 (and ((_ is Cons!36792) (t!51696 (t!51696 l!750))) (bvslt (_1!12731 (h!38240 (t!51696 (t!51696 l!750)))) key2!21)))))

(assert (=> d!163857 (isStrictlySorted!1017 (t!51696 (t!51696 l!750)))))

(assert (=> d!163857 (= (insertStrictlySorted!597 (t!51696 (t!51696 l!750)) key2!21 v2!10) lt!673111)))

(assert (= (and d!163857 c!144843) b!1570063))

(assert (= (and d!163857 (not c!144843)) b!1570062))

(assert (= (and b!1570062 c!144846) b!1570060))

(assert (= (and b!1570062 (not c!144846)) b!1570059))

(assert (= (and b!1570059 c!144844) b!1570064))

(assert (= (and b!1570059 (not c!144844)) b!1570061))

(assert (= (or b!1570064 b!1570061) bm!72184))

(assert (= (or b!1570060 bm!72184) bm!72186))

(assert (= (or b!1570063 bm!72186) bm!72185))

(assert (= (and bm!72185 c!144845) b!1570067))

(assert (= (and bm!72185 (not c!144845)) b!1570068))

(assert (= (and d!163857 res!1072881) b!1570065))

(assert (= (and b!1570065 res!1072880) b!1570066))

(declare-fun m!1443487 () Bool)

(assert (=> bm!72185 m!1443487))

(declare-fun m!1443489 () Bool)

(assert (=> b!1570067 m!1443489))

(declare-fun m!1443491 () Bool)

(assert (=> b!1570066 m!1443491))

(declare-fun m!1443493 () Bool)

(assert (=> b!1570065 m!1443493))

(declare-fun m!1443495 () Bool)

(assert (=> d!163857 m!1443495))

(assert (=> d!163857 m!1443111))

(assert (=> b!1569780 d!163857))

(declare-fun d!163859 () Bool)

(assert (=> d!163859 (= ($colon$colon!1002 e!875040 (ite c!144715 (h!38240 (insertStrictlySorted!597 l!750 key2!21 v2!10)) (tuple2!25441 key1!37 v1!32))) (Cons!36792 (ite c!144715 (h!38240 (insertStrictlySorted!597 l!750 key2!21 v2!10)) (tuple2!25441 key1!37 v1!32)) e!875040))))

(assert (=> bm!72089 d!163859))

(declare-fun d!163861 () Bool)

(declare-fun lt!673112 () Bool)

(assert (=> d!163861 (= lt!673112 (select (content!806 lt!673076) (tuple2!25441 key2!21 v2!10)))))

(declare-fun e!875274 () Bool)

(assert (=> d!163861 (= lt!673112 e!875274)))

(declare-fun res!1072883 () Bool)

(assert (=> d!163861 (=> (not res!1072883) (not e!875274))))

(assert (=> d!163861 (= res!1072883 ((_ is Cons!36792) lt!673076))))

(assert (=> d!163861 (= (contains!10382 lt!673076 (tuple2!25441 key2!21 v2!10)) lt!673112)))

(declare-fun b!1570069 () Bool)

(declare-fun e!875275 () Bool)

(assert (=> b!1570069 (= e!875274 e!875275)))

(declare-fun res!1072882 () Bool)

(assert (=> b!1570069 (=> res!1072882 e!875275)))

(assert (=> b!1570069 (= res!1072882 (= (h!38240 lt!673076) (tuple2!25441 key2!21 v2!10)))))

(declare-fun b!1570070 () Bool)

(assert (=> b!1570070 (= e!875275 (contains!10382 (t!51696 lt!673076) (tuple2!25441 key2!21 v2!10)))))

(assert (= (and d!163861 res!1072883) b!1570069))

(assert (= (and b!1570069 (not res!1072882)) b!1570070))

(declare-fun m!1443497 () Bool)

(assert (=> d!163861 m!1443497))

(declare-fun m!1443499 () Bool)

(assert (=> d!163861 m!1443499))

(declare-fun m!1443501 () Bool)

(assert (=> b!1570070 m!1443501))

(assert (=> b!1569779 d!163861))

(declare-fun d!163863 () Bool)

(declare-fun res!1072884 () Bool)

(declare-fun e!875276 () Bool)

(assert (=> d!163863 (=> res!1072884 e!875276)))

(assert (=> d!163863 (= res!1072884 (and ((_ is Cons!36792) lt!673076) (= (_1!12731 (h!38240 lt!673076)) key2!21)))))

(assert (=> d!163863 (= (containsKey!866 lt!673076 key2!21) e!875276)))

(declare-fun b!1570071 () Bool)

(declare-fun e!875277 () Bool)

(assert (=> b!1570071 (= e!875276 e!875277)))

(declare-fun res!1072885 () Bool)

(assert (=> b!1570071 (=> (not res!1072885) (not e!875277))))

(assert (=> b!1570071 (= res!1072885 (and (or (not ((_ is Cons!36792) lt!673076)) (bvsle (_1!12731 (h!38240 lt!673076)) key2!21)) ((_ is Cons!36792) lt!673076) (bvslt (_1!12731 (h!38240 lt!673076)) key2!21)))))

(declare-fun b!1570072 () Bool)

(assert (=> b!1570072 (= e!875277 (containsKey!866 (t!51696 lt!673076) key2!21))))

(assert (= (and d!163863 (not res!1072884)) b!1570071))

(assert (= (and b!1570071 res!1072885) b!1570072))

(declare-fun m!1443503 () Bool)

(assert (=> b!1570072 m!1443503))

(assert (=> b!1569778 d!163863))

(declare-fun bm!72187 () Bool)

(declare-fun call!72192 () List!36796)

(declare-fun call!72190 () List!36796)

(assert (=> bm!72187 (= call!72192 call!72190)))

(declare-fun c!144848 () Bool)

(declare-fun b!1570073 () Bool)

(assert (=> b!1570073 (= c!144848 (and ((_ is Cons!36792) (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10))) (bvsgt (_1!12731 (h!38240 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10)))) key1!37)))))

(declare-fun e!875279 () List!36796)

(declare-fun e!875282 () List!36796)

(assert (=> b!1570073 (= e!875279 e!875282)))

(declare-fun b!1570074 () Bool)

(assert (=> b!1570074 (= e!875279 call!72190)))

(declare-fun b!1570075 () Bool)

(assert (=> b!1570075 (= e!875282 call!72192)))

(declare-fun b!1570076 () Bool)

(declare-fun e!875278 () List!36796)

(assert (=> b!1570076 (= e!875278 e!875279)))

(declare-fun c!144850 () Bool)

(assert (=> b!1570076 (= c!144850 (and ((_ is Cons!36792) (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10))) (= (_1!12731 (h!38240 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10)))) key1!37)))))

(declare-fun e!875280 () List!36796)

(declare-fun bm!72188 () Bool)

(declare-fun call!72191 () List!36796)

(declare-fun c!144847 () Bool)

(assert (=> bm!72188 (= call!72191 ($colon$colon!1002 e!875280 (ite c!144847 (h!38240 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10))) (tuple2!25441 key1!37 v1!32))))))

(declare-fun c!144849 () Bool)

(assert (=> bm!72188 (= c!144849 c!144847)))

(declare-fun b!1570077 () Bool)

(assert (=> b!1570077 (= e!875278 call!72191)))

(declare-fun b!1570078 () Bool)

(assert (=> b!1570078 (= e!875282 call!72192)))

(declare-fun lt!673113 () List!36796)

(declare-fun b!1570080 () Bool)

(declare-fun e!875281 () Bool)

(assert (=> b!1570080 (= e!875281 (contains!10382 lt!673113 (tuple2!25441 key1!37 v1!32)))))

(declare-fun b!1570081 () Bool)

(assert (=> b!1570081 (= e!875280 (insertStrictlySorted!597 (t!51696 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10))) key1!37 v1!32))))

(declare-fun b!1570082 () Bool)

(assert (=> b!1570082 (= e!875280 (ite c!144850 (t!51696 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10))) (ite c!144848 (Cons!36792 (h!38240 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10))) (t!51696 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10)))) Nil!36793)))))

(declare-fun bm!72189 () Bool)

(assert (=> bm!72189 (= call!72190 call!72191)))

(declare-fun b!1570079 () Bool)

(declare-fun res!1072886 () Bool)

(assert (=> b!1570079 (=> (not res!1072886) (not e!875281))))

(assert (=> b!1570079 (= res!1072886 (containsKey!866 lt!673113 key1!37))))

(declare-fun d!163865 () Bool)

(assert (=> d!163865 e!875281))

(declare-fun res!1072887 () Bool)

(assert (=> d!163865 (=> (not res!1072887) (not e!875281))))

(assert (=> d!163865 (= res!1072887 (isStrictlySorted!1017 lt!673113))))

(assert (=> d!163865 (= lt!673113 e!875278)))

(assert (=> d!163865 (= c!144847 (and ((_ is Cons!36792) (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10))) (bvslt (_1!12731 (h!38240 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10)))) key1!37)))))

(assert (=> d!163865 (isStrictlySorted!1017 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10)))))

(assert (=> d!163865 (= (insertStrictlySorted!597 (t!51696 (insertStrictlySorted!597 (t!51696 l!750) key2!21 v2!10)) key1!37 v1!32) lt!673113)))

(assert (= (and d!163865 c!144847) b!1570077))

(assert (= (and d!163865 (not c!144847)) b!1570076))

(assert (= (and b!1570076 c!144850) b!1570074))

(assert (= (and b!1570076 (not c!144850)) b!1570073))

(assert (= (and b!1570073 c!144848) b!1570078))

(assert (= (and b!1570073 (not c!144848)) b!1570075))

(assert (= (or b!1570078 b!1570075) bm!72187))

(assert (= (or b!1570074 bm!72187) bm!72189))

(assert (= (or b!1570077 bm!72189) bm!72188))

(assert (= (and bm!72188 c!144849) b!1570081))

(assert (= (and bm!72188 (not c!144849)) b!1570082))

(assert (= (and d!163865 res!1072887) b!1570079))

(assert (= (and b!1570079 res!1072886) b!1570080))

(declare-fun m!1443505 () Bool)

(assert (=> bm!72188 m!1443505))

(declare-fun m!1443507 () Bool)

(assert (=> b!1570081 m!1443507))

(declare-fun m!1443509 () Bool)

(assert (=> b!1570080 m!1443509))

(declare-fun m!1443511 () Bool)

(assert (=> b!1570079 m!1443511))

(declare-fun m!1443513 () Bool)

(assert (=> d!163865 m!1443513))

(assert (=> d!163865 m!1443391))

(assert (=> b!1569790 d!163865))

(declare-fun lt!673114 () Bool)

(declare-fun d!163867 () Bool)

(assert (=> d!163867 (= lt!673114 (select (content!806 lt!673077) (tuple2!25441 key1!37 v1!32)))))

(declare-fun e!875283 () Bool)

(assert (=> d!163867 (= lt!673114 e!875283)))

(declare-fun res!1072889 () Bool)

(assert (=> d!163867 (=> (not res!1072889) (not e!875283))))

(assert (=> d!163867 (= res!1072889 ((_ is Cons!36792) lt!673077))))

(assert (=> d!163867 (= (contains!10382 lt!673077 (tuple2!25441 key1!37 v1!32)) lt!673114)))

(declare-fun b!1570083 () Bool)

(declare-fun e!875284 () Bool)

(assert (=> b!1570083 (= e!875283 e!875284)))

(declare-fun res!1072888 () Bool)

(assert (=> b!1570083 (=> res!1072888 e!875284)))

(assert (=> b!1570083 (= res!1072888 (= (h!38240 lt!673077) (tuple2!25441 key1!37 v1!32)))))

(declare-fun b!1570084 () Bool)

(assert (=> b!1570084 (= e!875284 (contains!10382 (t!51696 lt!673077) (tuple2!25441 key1!37 v1!32)))))

(assert (= (and d!163867 res!1072889) b!1570083))

(assert (= (and b!1570083 (not res!1072888)) b!1570084))

(declare-fun m!1443515 () Bool)

(assert (=> d!163867 m!1443515))

(declare-fun m!1443517 () Bool)

(assert (=> d!163867 m!1443517))

(declare-fun m!1443519 () Bool)

(assert (=> b!1570084 m!1443519))

(assert (=> b!1569789 d!163867))

(declare-fun d!163869 () Bool)

(declare-fun res!1072890 () Bool)

(declare-fun e!875285 () Bool)

(assert (=> d!163869 (=> res!1072890 e!875285)))

(assert (=> d!163869 (= res!1072890 (or ((_ is Nil!36793) lt!673076) ((_ is Nil!36793) (t!51696 lt!673076))))))

(assert (=> d!163869 (= (isStrictlySorted!1017 lt!673076) e!875285)))

(declare-fun b!1570085 () Bool)

(declare-fun e!875286 () Bool)

(assert (=> b!1570085 (= e!875285 e!875286)))

(declare-fun res!1072891 () Bool)

(assert (=> b!1570085 (=> (not res!1072891) (not e!875286))))

(assert (=> b!1570085 (= res!1072891 (bvslt (_1!12731 (h!38240 lt!673076)) (_1!12731 (h!38240 (t!51696 lt!673076)))))))

(declare-fun b!1570086 () Bool)

(assert (=> b!1570086 (= e!875286 (isStrictlySorted!1017 (t!51696 lt!673076)))))

(assert (= (and d!163869 (not res!1072890)) b!1570085))

(assert (= (and b!1570085 res!1072891) b!1570086))

(declare-fun m!1443521 () Bool)

(assert (=> b!1570086 m!1443521))

(assert (=> d!163745 d!163869))

(assert (=> d!163745 d!163719))

(declare-fun d!163871 () Bool)

(declare-fun res!1072892 () Bool)

(declare-fun e!875287 () Bool)

(assert (=> d!163871 (=> res!1072892 e!875287)))

(assert (=> d!163871 (= res!1072892 (and ((_ is Cons!36792) lt!673077) (= (_1!12731 (h!38240 lt!673077)) key1!37)))))

(assert (=> d!163871 (= (containsKey!866 lt!673077 key1!37) e!875287)))

(declare-fun b!1570087 () Bool)

(declare-fun e!875288 () Bool)

(assert (=> b!1570087 (= e!875287 e!875288)))

(declare-fun res!1072893 () Bool)

(assert (=> b!1570087 (=> (not res!1072893) (not e!875288))))

(assert (=> b!1570087 (= res!1072893 (and (or (not ((_ is Cons!36792) lt!673077)) (bvsle (_1!12731 (h!38240 lt!673077)) key1!37)) ((_ is Cons!36792) lt!673077) (bvslt (_1!12731 (h!38240 lt!673077)) key1!37)))))

(declare-fun b!1570088 () Bool)

(assert (=> b!1570088 (= e!875288 (containsKey!866 (t!51696 lt!673077) key1!37))))

(assert (= (and d!163871 (not res!1072892)) b!1570087))

(assert (= (and b!1570087 res!1072893) b!1570088))

(declare-fun m!1443523 () Bool)

(assert (=> b!1570088 m!1443523))

(assert (=> b!1569788 d!163871))

(declare-fun b!1570089 () Bool)

(declare-fun e!875289 () Bool)

(declare-fun tp!114227 () Bool)

(assert (=> b!1570089 (= e!875289 (and tp_is_empty!39097 tp!114227))))

(assert (=> b!1569838 (= tp!114220 e!875289)))

(assert (= (and b!1569838 ((_ is Cons!36792) (t!51696 (t!51696 l!750)))) b!1570089))

(check-sat (not b!1570056) (not b!1570021) (not b!1570032) tp_is_empty!39097 (not b!1570066) (not b!1570038) (not b!1570036) (not b!1570049) (not d!163791) (not d!163861) (not b!1570079) (not b!1570054) (not b!1570048) (not b!1570084) (not b!1570089) (not d!163853) (not bm!72173) (not b!1570028) (not b!1569986) (not bm!72182) (not b!1570086) (not b!1570088) (not b!1570003) (not b!1570012) (not d!163827) (not b!1570065) (not d!163847) (not d!163857) (not b!1570070) (not b!1570034) (not b!1569975) (not b!1569964) (not b!1570019) (not b!1570026) (not b!1570004) (not b!1569966) (not d!163799) (not d!163843) (not d!163867) (not b!1570010) (not bm!72176) (not b!1570081) (not b!1570080) (not b!1569992) (not d!163865) (not d!163811) (not d!163815) (not b!1570052) (not b!1570072) (not d!163803) (not b!1569973) (not b!1569974) (not b!1570058) (not b!1569980) (not bm!72179) (not b!1570008) (not d!163807) (not b!1570020) (not b!1570047) (not bm!72188) (not b!1569994) (not d!163813) (not b!1570030) (not b!1570067) (not b!1570024) (not b!1569996) (not b!1570005) (not b!1570040) (not b!1569978) (not bm!72185))
(check-sat)
