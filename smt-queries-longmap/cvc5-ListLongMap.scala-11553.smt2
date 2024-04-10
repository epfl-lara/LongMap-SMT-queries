; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134534 () Bool)

(assert start!134534)

(declare-datatypes ((B!2552 0))(
  ( (B!2553 (val!19638 Int)) )
))
(declare-fun v1!32 () B!2552)

(declare-fun v2!10 () B!2552)

(declare-fun e!875687 () Bool)

(declare-datatypes ((tuple2!25378 0))(
  ( (tuple2!25379 (_1!12700 (_ BitVec 64)) (_2!12700 B!2552)) )
))
(declare-datatypes ((List!36758 0))(
  ( (Nil!36755) (Cons!36754 (h!38201 tuple2!25378) (t!51669 List!36758)) )
))
(declare-fun l!750 () List!36758)

(declare-fun b!1570667 () Bool)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun insertStrictlySorted!599 (List!36758 (_ BitVec 64) B!2552) List!36758)

(assert (=> b!1570667 (= e!875687 (not (= (insertStrictlySorted!599 (insertStrictlySorted!599 l!750 key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!599 (insertStrictlySorted!599 l!750 key2!21 v2!10) key1!37 v1!32))))))

(declare-fun b!1570665 () Bool)

(declare-fun res!1073187 () Bool)

(assert (=> b!1570665 (=> (not res!1073187) (not e!875687))))

(declare-fun isStrictlySorted!1022 (List!36758) Bool)

(assert (=> b!1570665 (= res!1073187 (isStrictlySorted!1022 l!750))))

(declare-fun res!1073186 () Bool)

(assert (=> start!134534 (=> (not res!1073186) (not e!875687))))

(assert (=> start!134534 (= res!1073186 (not (= key1!37 key2!21)))))

(assert (=> start!134534 e!875687))

(declare-fun tp_is_empty!39103 () Bool)

(assert (=> start!134534 tp_is_empty!39103))

(declare-fun e!875686 () Bool)

(assert (=> start!134534 e!875686))

(assert (=> start!134534 true))

(declare-fun b!1570668 () Bool)

(declare-fun tp!114231 () Bool)

(assert (=> b!1570668 (= e!875686 (and tp_is_empty!39103 tp!114231))))

(declare-fun b!1570666 () Bool)

(declare-fun res!1073185 () Bool)

(assert (=> b!1570666 (=> (not res!1073185) (not e!875687))))

(assert (=> b!1570666 (= res!1073185 (or (not (is-Cons!36754 l!750)) (bvsge (_1!12700 (h!38201 l!750)) key1!37) (bvsge (_1!12700 (h!38201 l!750)) key2!21)))))

(assert (= (and start!134534 res!1073186) b!1570665))

(assert (= (and b!1570665 res!1073187) b!1570666))

(assert (= (and b!1570666 res!1073185) b!1570667))

(assert (= (and start!134534 (is-Cons!36754 l!750)) b!1570668))

(declare-fun m!1444717 () Bool)

(assert (=> b!1570667 m!1444717))

(assert (=> b!1570667 m!1444717))

(declare-fun m!1444719 () Bool)

(assert (=> b!1570667 m!1444719))

(declare-fun m!1444721 () Bool)

(assert (=> b!1570667 m!1444721))

(assert (=> b!1570667 m!1444721))

(declare-fun m!1444723 () Bool)

(assert (=> b!1570667 m!1444723))

(declare-fun m!1444725 () Bool)

(assert (=> b!1570665 m!1444725))

(push 1)

(assert (not b!1570665))

(assert (not b!1570667))

(assert (not b!1570668))

(assert tp_is_empty!39103)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164309 () Bool)

(declare-fun res!1073222 () Bool)

(declare-fun e!875716 () Bool)

(assert (=> d!164309 (=> res!1073222 e!875716)))

(assert (=> d!164309 (= res!1073222 (or (is-Nil!36755 l!750) (is-Nil!36755 (t!51669 l!750))))))

(assert (=> d!164309 (= (isStrictlySorted!1022 l!750) e!875716)))

(declare-fun b!1570709 () Bool)

(declare-fun e!875717 () Bool)

(assert (=> b!1570709 (= e!875716 e!875717)))

(declare-fun res!1073223 () Bool)

(assert (=> b!1570709 (=> (not res!1073223) (not e!875717))))

(assert (=> b!1570709 (= res!1073223 (bvslt (_1!12700 (h!38201 l!750)) (_1!12700 (h!38201 (t!51669 l!750)))))))

(declare-fun b!1570710 () Bool)

(assert (=> b!1570710 (= e!875717 (isStrictlySorted!1022 (t!51669 l!750)))))

(assert (= (and d!164309 (not res!1073222)) b!1570709))

(assert (= (and b!1570709 res!1073223) b!1570710))

(declare-fun m!1444751 () Bool)

(assert (=> b!1570710 m!1444751))

(assert (=> b!1570665 d!164309))

(declare-fun b!1570791 () Bool)

(declare-fun res!1073240 () Bool)

(declare-fun e!875760 () Bool)

(assert (=> b!1570791 (=> (not res!1073240) (not e!875760))))

(declare-fun lt!673441 () List!36758)

(declare-fun containsKey!871 (List!36758 (_ BitVec 64)) Bool)

(assert (=> b!1570791 (= res!1073240 (containsKey!871 lt!673441 key2!21))))

(declare-fun b!1570792 () Bool)

(declare-fun e!875759 () List!36758)

(declare-fun e!875758 () List!36758)

(assert (=> b!1570792 (= e!875759 e!875758)))

(declare-fun c!145022 () Bool)

(assert (=> b!1570792 (= c!145022 (and (is-Cons!36754 (insertStrictlySorted!599 l!750 key1!37 v1!32)) (= (_1!12700 (h!38201 (insertStrictlySorted!599 l!750 key1!37 v1!32))) key2!21)))))

(declare-fun bm!72285 () Bool)

(declare-fun call!72290 () List!36758)

(declare-fun call!72289 () List!36758)

(assert (=> bm!72285 (= call!72290 call!72289)))

(declare-fun bm!72286 () Bool)

(declare-fun call!72288 () List!36758)

(assert (=> bm!72286 (= call!72289 call!72288)))

(declare-fun b!1570793 () Bool)

(declare-fun contains!10432 (List!36758 tuple2!25378) Bool)

(assert (=> b!1570793 (= e!875760 (contains!10432 lt!673441 (tuple2!25379 key2!21 v2!10)))))

(declare-fun b!1570794 () Bool)

(declare-fun e!875762 () List!36758)

(assert (=> b!1570794 (= e!875762 call!72290)))

(declare-fun b!1570795 () Bool)

(declare-fun c!145023 () Bool)

(assert (=> b!1570795 (= c!145023 (and (is-Cons!36754 (insertStrictlySorted!599 l!750 key1!37 v1!32)) (bvsgt (_1!12700 (h!38201 (insertStrictlySorted!599 l!750 key1!37 v1!32))) key2!21)))))

(assert (=> b!1570795 (= e!875758 e!875762)))

(declare-fun b!1570796 () Bool)

(assert (=> b!1570796 (= e!875762 call!72290)))

(declare-fun d!164315 () Bool)

(assert (=> d!164315 e!875760))

(declare-fun res!1073241 () Bool)

(assert (=> d!164315 (=> (not res!1073241) (not e!875760))))

(assert (=> d!164315 (= res!1073241 (isStrictlySorted!1022 lt!673441))))

(assert (=> d!164315 (= lt!673441 e!875759)))

(declare-fun c!145020 () Bool)

(assert (=> d!164315 (= c!145020 (and (is-Cons!36754 (insertStrictlySorted!599 l!750 key1!37 v1!32)) (bvslt (_1!12700 (h!38201 (insertStrictlySorted!599 l!750 key1!37 v1!32))) key2!21)))))

(assert (=> d!164315 (isStrictlySorted!1022 (insertStrictlySorted!599 l!750 key1!37 v1!32))))

(assert (=> d!164315 (= (insertStrictlySorted!599 (insertStrictlySorted!599 l!750 key1!37 v1!32) key2!21 v2!10) lt!673441)))

(declare-fun b!1570797 () Bool)

(assert (=> b!1570797 (= e!875759 call!72288)))

(declare-fun b!1570798 () Bool)

(declare-fun e!875761 () List!36758)

(assert (=> b!1570798 (= e!875761 (insertStrictlySorted!599 (t!51669 (insertStrictlySorted!599 l!750 key1!37 v1!32)) key2!21 v2!10))))

(declare-fun b!1570799 () Bool)

(assert (=> b!1570799 (= e!875758 call!72289)))

(declare-fun bm!72287 () Bool)

(declare-fun $colon$colon!1004 (List!36758 tuple2!25378) List!36758)

(assert (=> bm!72287 (= call!72288 ($colon$colon!1004 e!875761 (ite c!145020 (h!38201 (insertStrictlySorted!599 l!750 key1!37 v1!32)) (tuple2!25379 key2!21 v2!10))))))

(declare-fun c!145021 () Bool)

(assert (=> bm!72287 (= c!145021 c!145020)))

(declare-fun b!1570800 () Bool)

(assert (=> b!1570800 (= e!875761 (ite c!145022 (t!51669 (insertStrictlySorted!599 l!750 key1!37 v1!32)) (ite c!145023 (Cons!36754 (h!38201 (insertStrictlySorted!599 l!750 key1!37 v1!32)) (t!51669 (insertStrictlySorted!599 l!750 key1!37 v1!32))) Nil!36755)))))

(assert (= (and d!164315 c!145020) b!1570797))

(assert (= (and d!164315 (not c!145020)) b!1570792))

(assert (= (and b!1570792 c!145022) b!1570799))

(assert (= (and b!1570792 (not c!145022)) b!1570795))

(assert (= (and b!1570795 c!145023) b!1570794))

(assert (= (and b!1570795 (not c!145023)) b!1570796))

(assert (= (or b!1570794 b!1570796) bm!72285))

(assert (= (or b!1570799 bm!72285) bm!72286))

(assert (= (or b!1570797 bm!72286) bm!72287))

(assert (= (and bm!72287 c!145021) b!1570798))

(assert (= (and bm!72287 (not c!145021)) b!1570800))

(assert (= (and d!164315 res!1073241) b!1570791))

(assert (= (and b!1570791 res!1073240) b!1570793))

(declare-fun m!1444777 () Bool)

(assert (=> b!1570793 m!1444777))

(declare-fun m!1444779 () Bool)

(assert (=> b!1570791 m!1444779))

(declare-fun m!1444781 () Bool)

(assert (=> b!1570798 m!1444781))

(declare-fun m!1444783 () Bool)

(assert (=> bm!72287 m!1444783))

(declare-fun m!1444785 () Bool)

(assert (=> d!164315 m!1444785))

(assert (=> d!164315 m!1444717))

(declare-fun m!1444787 () Bool)

(assert (=> d!164315 m!1444787))

(assert (=> b!1570667 d!164315))

(declare-fun b!1570821 () Bool)

(declare-fun res!1073246 () Bool)

(declare-fun e!875775 () Bool)

(assert (=> b!1570821 (=> (not res!1073246) (not e!875775))))

(declare-fun lt!673444 () List!36758)

(assert (=> b!1570821 (= res!1073246 (containsKey!871 lt!673444 key1!37))))

(declare-fun b!1570822 () Bool)

(declare-fun e!875774 () List!36758)

(declare-fun e!875773 () List!36758)

(assert (=> b!1570822 (= e!875774 e!875773)))

(declare-fun c!145034 () Bool)

(assert (=> b!1570822 (= c!145034 (and (is-Cons!36754 l!750) (= (_1!12700 (h!38201 l!750)) key1!37)))))

(declare-fun bm!72294 () Bool)

(declare-fun call!72299 () List!36758)

(declare-fun call!72298 () List!36758)

(assert (=> bm!72294 (= call!72299 call!72298)))

(declare-fun bm!72295 () Bool)

(declare-fun call!72297 () List!36758)

(assert (=> bm!72295 (= call!72298 call!72297)))

(declare-fun b!1570823 () Bool)

(assert (=> b!1570823 (= e!875775 (contains!10432 lt!673444 (tuple2!25379 key1!37 v1!32)))))

(declare-fun b!1570824 () Bool)

(declare-fun e!875777 () List!36758)

(assert (=> b!1570824 (= e!875777 call!72299)))

(declare-fun b!1570825 () Bool)

(declare-fun c!145035 () Bool)

(assert (=> b!1570825 (= c!145035 (and (is-Cons!36754 l!750) (bvsgt (_1!12700 (h!38201 l!750)) key1!37)))))

(assert (=> b!1570825 (= e!875773 e!875777)))

(declare-fun b!1570826 () Bool)

(assert (=> b!1570826 (= e!875777 call!72299)))

(declare-fun d!164321 () Bool)

(assert (=> d!164321 e!875775))

(declare-fun res!1073247 () Bool)

(assert (=> d!164321 (=> (not res!1073247) (not e!875775))))

(assert (=> d!164321 (= res!1073247 (isStrictlySorted!1022 lt!673444))))

(assert (=> d!164321 (= lt!673444 e!875774)))

(declare-fun c!145032 () Bool)

(assert (=> d!164321 (= c!145032 (and (is-Cons!36754 l!750) (bvslt (_1!12700 (h!38201 l!750)) key1!37)))))

(assert (=> d!164321 (isStrictlySorted!1022 l!750)))

(assert (=> d!164321 (= (insertStrictlySorted!599 l!750 key1!37 v1!32) lt!673444)))

(declare-fun b!1570827 () Bool)

(assert (=> b!1570827 (= e!875774 call!72297)))

(declare-fun b!1570828 () Bool)

(declare-fun e!875776 () List!36758)

(assert (=> b!1570828 (= e!875776 (insertStrictlySorted!599 (t!51669 l!750) key1!37 v1!32))))

(declare-fun b!1570829 () Bool)

(assert (=> b!1570829 (= e!875773 call!72298)))

(declare-fun bm!72296 () Bool)

(assert (=> bm!72296 (= call!72297 ($colon$colon!1004 e!875776 (ite c!145032 (h!38201 l!750) (tuple2!25379 key1!37 v1!32))))))

(declare-fun c!145033 () Bool)

(assert (=> bm!72296 (= c!145033 c!145032)))

(declare-fun b!1570830 () Bool)

(assert (=> b!1570830 (= e!875776 (ite c!145034 (t!51669 l!750) (ite c!145035 (Cons!36754 (h!38201 l!750) (t!51669 l!750)) Nil!36755)))))

(assert (= (and d!164321 c!145032) b!1570827))

(assert (= (and d!164321 (not c!145032)) b!1570822))

(assert (= (and b!1570822 c!145034) b!1570829))

(assert (= (and b!1570822 (not c!145034)) b!1570825))

(assert (= (and b!1570825 c!145035) b!1570824))

(assert (= (and b!1570825 (not c!145035)) b!1570826))

(assert (= (or b!1570824 b!1570826) bm!72294))

(assert (= (or b!1570829 bm!72294) bm!72295))

(assert (= (or b!1570827 bm!72295) bm!72296))

(assert (= (and bm!72296 c!145033) b!1570828))

(assert (= (and bm!72296 (not c!145033)) b!1570830))

(assert (= (and d!164321 res!1073247) b!1570821))

(assert (= (and b!1570821 res!1073246) b!1570823))

(declare-fun m!1444809 () Bool)

(assert (=> b!1570823 m!1444809))

(declare-fun m!1444811 () Bool)

(assert (=> b!1570821 m!1444811))

(declare-fun m!1444813 () Bool)

(assert (=> b!1570828 m!1444813))

(declare-fun m!1444815 () Bool)

(assert (=> bm!72296 m!1444815))

(declare-fun m!1444817 () Bool)

(assert (=> d!164321 m!1444817))

(assert (=> d!164321 m!1444725))

(assert (=> b!1570667 d!164321))

(declare-fun b!1570851 () Bool)

(declare-fun res!1073252 () Bool)

(declare-fun e!875790 () Bool)

(assert (=> b!1570851 (=> (not res!1073252) (not e!875790))))

(declare-fun lt!673447 () List!36758)

(assert (=> b!1570851 (= res!1073252 (containsKey!871 lt!673447 key1!37))))

(declare-fun b!1570852 () Bool)

(declare-fun e!875789 () List!36758)

(declare-fun e!875788 () List!36758)

(assert (=> b!1570852 (= e!875789 e!875788)))

(declare-fun c!145046 () Bool)

(assert (=> b!1570852 (= c!145046 (and (is-Cons!36754 (insertStrictlySorted!599 l!750 key2!21 v2!10)) (= (_1!12700 (h!38201 (insertStrictlySorted!599 l!750 key2!21 v2!10))) key1!37)))))

(declare-fun bm!72303 () Bool)

(declare-fun call!72308 () List!36758)

(declare-fun call!72307 () List!36758)

(assert (=> bm!72303 (= call!72308 call!72307)))

(declare-fun bm!72304 () Bool)

(declare-fun call!72306 () List!36758)

(assert (=> bm!72304 (= call!72307 call!72306)))

(declare-fun b!1570853 () Bool)

(assert (=> b!1570853 (= e!875790 (contains!10432 lt!673447 (tuple2!25379 key1!37 v1!32)))))

(declare-fun b!1570854 () Bool)

(declare-fun e!875792 () List!36758)

(assert (=> b!1570854 (= e!875792 call!72308)))

(declare-fun c!145047 () Bool)

(declare-fun b!1570855 () Bool)

(assert (=> b!1570855 (= c!145047 (and (is-Cons!36754 (insertStrictlySorted!599 l!750 key2!21 v2!10)) (bvsgt (_1!12700 (h!38201 (insertStrictlySorted!599 l!750 key2!21 v2!10))) key1!37)))))

(assert (=> b!1570855 (= e!875788 e!875792)))

(declare-fun b!1570856 () Bool)

(assert (=> b!1570856 (= e!875792 call!72308)))

(declare-fun d!164327 () Bool)

(assert (=> d!164327 e!875790))

(declare-fun res!1073253 () Bool)

(assert (=> d!164327 (=> (not res!1073253) (not e!875790))))

(assert (=> d!164327 (= res!1073253 (isStrictlySorted!1022 lt!673447))))

(assert (=> d!164327 (= lt!673447 e!875789)))

(declare-fun c!145044 () Bool)

(assert (=> d!164327 (= c!145044 (and (is-Cons!36754 (insertStrictlySorted!599 l!750 key2!21 v2!10)) (bvslt (_1!12700 (h!38201 (insertStrictlySorted!599 l!750 key2!21 v2!10))) key1!37)))))

(assert (=> d!164327 (isStrictlySorted!1022 (insertStrictlySorted!599 l!750 key2!21 v2!10))))

(assert (=> d!164327 (= (insertStrictlySorted!599 (insertStrictlySorted!599 l!750 key2!21 v2!10) key1!37 v1!32) lt!673447)))

(declare-fun b!1570857 () Bool)

(assert (=> b!1570857 (= e!875789 call!72306)))

(declare-fun b!1570858 () Bool)

(declare-fun e!875791 () List!36758)

(assert (=> b!1570858 (= e!875791 (insertStrictlySorted!599 (t!51669 (insertStrictlySorted!599 l!750 key2!21 v2!10)) key1!37 v1!32))))

(declare-fun b!1570859 () Bool)

(assert (=> b!1570859 (= e!875788 call!72307)))

(declare-fun bm!72305 () Bool)

(assert (=> bm!72305 (= call!72306 ($colon$colon!1004 e!875791 (ite c!145044 (h!38201 (insertStrictlySorted!599 l!750 key2!21 v2!10)) (tuple2!25379 key1!37 v1!32))))))

(declare-fun c!145045 () Bool)

(assert (=> bm!72305 (= c!145045 c!145044)))

(declare-fun b!1570860 () Bool)

(assert (=> b!1570860 (= e!875791 (ite c!145046 (t!51669 (insertStrictlySorted!599 l!750 key2!21 v2!10)) (ite c!145047 (Cons!36754 (h!38201 (insertStrictlySorted!599 l!750 key2!21 v2!10)) (t!51669 (insertStrictlySorted!599 l!750 key2!21 v2!10))) Nil!36755)))))

(assert (= (and d!164327 c!145044) b!1570857))

(assert (= (and d!164327 (not c!145044)) b!1570852))

(assert (= (and b!1570852 c!145046) b!1570859))

(assert (= (and b!1570852 (not c!145046)) b!1570855))

(assert (= (and b!1570855 c!145047) b!1570854))

(assert (= (and b!1570855 (not c!145047)) b!1570856))

(assert (= (or b!1570854 b!1570856) bm!72303))

(assert (= (or b!1570859 bm!72303) bm!72304))

(assert (= (or b!1570857 bm!72304) bm!72305))

(assert (= (and bm!72305 c!145045) b!1570858))

(assert (= (and bm!72305 (not c!145045)) b!1570860))

(assert (= (and d!164327 res!1073253) b!1570851))

(assert (= (and b!1570851 res!1073252) b!1570853))

(declare-fun m!1444843 () Bool)

(assert (=> b!1570853 m!1444843))

(declare-fun m!1444845 () Bool)

(assert (=> b!1570851 m!1444845))

(declare-fun m!1444847 () Bool)

(assert (=> b!1570858 m!1444847))

(declare-fun m!1444849 () Bool)

(assert (=> bm!72305 m!1444849))

(declare-fun m!1444851 () Bool)

(assert (=> d!164327 m!1444851))

(assert (=> d!164327 m!1444721))

(declare-fun m!1444853 () Bool)

(assert (=> d!164327 m!1444853))

(assert (=> b!1570667 d!164327))

(declare-fun b!1570881 () Bool)

(declare-fun res!1073258 () Bool)

(declare-fun e!875805 () Bool)

(assert (=> b!1570881 (=> (not res!1073258) (not e!875805))))

(declare-fun lt!673450 () List!36758)

(assert (=> b!1570881 (= res!1073258 (containsKey!871 lt!673450 key2!21))))

(declare-fun b!1570882 () Bool)

(declare-fun e!875804 () List!36758)

(declare-fun e!875803 () List!36758)

(assert (=> b!1570882 (= e!875804 e!875803)))

(declare-fun c!145058 () Bool)

(assert (=> b!1570882 (= c!145058 (and (is-Cons!36754 l!750) (= (_1!12700 (h!38201 l!750)) key2!21)))))

(declare-fun bm!72312 () Bool)

(declare-fun call!72317 () List!36758)

(declare-fun call!72316 () List!36758)

(assert (=> bm!72312 (= call!72317 call!72316)))

(declare-fun bm!72313 () Bool)

(declare-fun call!72315 () List!36758)

(assert (=> bm!72313 (= call!72316 call!72315)))

(declare-fun b!1570883 () Bool)

(assert (=> b!1570883 (= e!875805 (contains!10432 lt!673450 (tuple2!25379 key2!21 v2!10)))))

(declare-fun b!1570884 () Bool)

(declare-fun e!875807 () List!36758)

(assert (=> b!1570884 (= e!875807 call!72317)))

(declare-fun b!1570885 () Bool)

(declare-fun c!145059 () Bool)

(assert (=> b!1570885 (= c!145059 (and (is-Cons!36754 l!750) (bvsgt (_1!12700 (h!38201 l!750)) key2!21)))))

(assert (=> b!1570885 (= e!875803 e!875807)))

(declare-fun b!1570886 () Bool)

(assert (=> b!1570886 (= e!875807 call!72317)))

(declare-fun d!164333 () Bool)

(assert (=> d!164333 e!875805))

(declare-fun res!1073259 () Bool)

(assert (=> d!164333 (=> (not res!1073259) (not e!875805))))

(assert (=> d!164333 (= res!1073259 (isStrictlySorted!1022 lt!673450))))

(assert (=> d!164333 (= lt!673450 e!875804)))

(declare-fun c!145056 () Bool)

(assert (=> d!164333 (= c!145056 (and (is-Cons!36754 l!750) (bvslt (_1!12700 (h!38201 l!750)) key2!21)))))

(assert (=> d!164333 (isStrictlySorted!1022 l!750)))

(assert (=> d!164333 (= (insertStrictlySorted!599 l!750 key2!21 v2!10) lt!673450)))

(declare-fun b!1570887 () Bool)

(assert (=> b!1570887 (= e!875804 call!72315)))

(declare-fun b!1570888 () Bool)

(declare-fun e!875806 () List!36758)

(assert (=> b!1570888 (= e!875806 (insertStrictlySorted!599 (t!51669 l!750) key2!21 v2!10))))

(declare-fun b!1570889 () Bool)

(assert (=> b!1570889 (= e!875803 call!72316)))

(declare-fun bm!72314 () Bool)

(assert (=> bm!72314 (= call!72315 ($colon$colon!1004 e!875806 (ite c!145056 (h!38201 l!750) (tuple2!25379 key2!21 v2!10))))))

(declare-fun c!145057 () Bool)

(assert (=> bm!72314 (= c!145057 c!145056)))

(declare-fun b!1570890 () Bool)

(assert (=> b!1570890 (= e!875806 (ite c!145058 (t!51669 l!750) (ite c!145059 (Cons!36754 (h!38201 l!750) (t!51669 l!750)) Nil!36755)))))

(assert (= (and d!164333 c!145056) b!1570887))

(assert (= (and d!164333 (not c!145056)) b!1570882))

(assert (= (and b!1570882 c!145058) b!1570889))

(assert (= (and b!1570882 (not c!145058)) b!1570885))

(assert (= (and b!1570885 c!145059) b!1570884))

(assert (= (and b!1570885 (not c!145059)) b!1570886))

(assert (= (or b!1570884 b!1570886) bm!72312))

(assert (= (or b!1570889 bm!72312) bm!72313))

(assert (= (or b!1570887 bm!72313) bm!72314))

(assert (= (and bm!72314 c!145057) b!1570888))

(assert (= (and bm!72314 (not c!145057)) b!1570890))

(assert (= (and d!164333 res!1073259) b!1570881))

(assert (= (and b!1570881 res!1073258) b!1570883))

(declare-fun m!1444875 () Bool)

(assert (=> b!1570883 m!1444875))

(declare-fun m!1444877 () Bool)

(assert (=> b!1570881 m!1444877))

(declare-fun m!1444879 () Bool)

(assert (=> b!1570888 m!1444879))

(declare-fun m!1444881 () Bool)

(assert (=> bm!72314 m!1444881))

(declare-fun m!1444883 () Bool)

(assert (=> d!164333 m!1444883))

(assert (=> d!164333 m!1444725))

(assert (=> b!1570667 d!164333))

(declare-fun b!1570905 () Bool)

(declare-fun e!875816 () Bool)

(declare-fun tp!114246 () Bool)

(assert (=> b!1570905 (= e!875816 (and tp_is_empty!39103 tp!114246))))

(assert (=> b!1570668 (= tp!114231 e!875816)))

(assert (= (and b!1570668 (is-Cons!36754 (t!51669 l!750))) b!1570905))

(push 1)

(assert (not b!1570798))

(assert (not b!1570793))

(assert (not d!164327))

(assert (not b!1570883))

(assert (not b!1570791))

(assert (not bm!72314))

(assert (not b!1570881))

(assert (not b!1570858))

(assert (not bm!72287))

(assert (not b!1570823))

(assert tp_is_empty!39103)

(assert (not b!1570710))

(assert (not b!1570888))

(assert (not b!1570828))

(assert (not d!164315))

(assert (not b!1570853))

(assert (not b!1570851))

(assert (not b!1570905))

(assert (not b!1570821))

(assert (not d!164333))

(assert (not bm!72305))

(assert (not d!164321))

(assert (not bm!72296))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1570906 () Bool)

(declare-fun res!1073260 () Bool)

(declare-fun e!875819 () Bool)

(assert (=> b!1570906 (=> (not res!1073260) (not e!875819))))

(declare-fun lt!673451 () List!36758)

(assert (=> b!1570906 (= res!1073260 (containsKey!871 lt!673451 key1!37))))

(declare-fun b!1570907 () Bool)

(declare-fun e!875818 () List!36758)

(declare-fun e!875817 () List!36758)

(assert (=> b!1570907 (= e!875818 e!875817)))

(declare-fun c!145062 () Bool)

(assert (=> b!1570907 (= c!145062 (and (is-Cons!36754 (t!51669 l!750)) (= (_1!12700 (h!38201 (t!51669 l!750))) key1!37)))))

(declare-fun bm!72315 () Bool)

(declare-fun call!72320 () List!36758)

(declare-fun call!72319 () List!36758)

(assert (=> bm!72315 (= call!72320 call!72319)))

(declare-fun bm!72316 () Bool)

(declare-fun call!72318 () List!36758)

(assert (=> bm!72316 (= call!72319 call!72318)))

(declare-fun b!1570908 () Bool)

(assert (=> b!1570908 (= e!875819 (contains!10432 lt!673451 (tuple2!25379 key1!37 v1!32)))))

(declare-fun b!1570909 () Bool)

(declare-fun e!875821 () List!36758)

(assert (=> b!1570909 (= e!875821 call!72320)))

(declare-fun b!1570910 () Bool)

(declare-fun c!145063 () Bool)

(assert (=> b!1570910 (= c!145063 (and (is-Cons!36754 (t!51669 l!750)) (bvsgt (_1!12700 (h!38201 (t!51669 l!750))) key1!37)))))

(assert (=> b!1570910 (= e!875817 e!875821)))

(declare-fun b!1570911 () Bool)

(assert (=> b!1570911 (= e!875821 call!72320)))

(declare-fun d!164335 () Bool)

(assert (=> d!164335 e!875819))

(declare-fun res!1073261 () Bool)

(assert (=> d!164335 (=> (not res!1073261) (not e!875819))))

(assert (=> d!164335 (= res!1073261 (isStrictlySorted!1022 lt!673451))))

(assert (=> d!164335 (= lt!673451 e!875818)))

(declare-fun c!145060 () Bool)

(assert (=> d!164335 (= c!145060 (and (is-Cons!36754 (t!51669 l!750)) (bvslt (_1!12700 (h!38201 (t!51669 l!750))) key1!37)))))

(assert (=> d!164335 (isStrictlySorted!1022 (t!51669 l!750))))

(assert (=> d!164335 (= (insertStrictlySorted!599 (t!51669 l!750) key1!37 v1!32) lt!673451)))

(declare-fun b!1570912 () Bool)

(assert (=> b!1570912 (= e!875818 call!72318)))

(declare-fun b!1570913 () Bool)

(declare-fun e!875820 () List!36758)

(assert (=> b!1570913 (= e!875820 (insertStrictlySorted!599 (t!51669 (t!51669 l!750)) key1!37 v1!32))))

(declare-fun b!1570914 () Bool)

(assert (=> b!1570914 (= e!875817 call!72319)))

(declare-fun bm!72317 () Bool)

(assert (=> bm!72317 (= call!72318 ($colon$colon!1004 e!875820 (ite c!145060 (h!38201 (t!51669 l!750)) (tuple2!25379 key1!37 v1!32))))))

(declare-fun c!145061 () Bool)

(assert (=> bm!72317 (= c!145061 c!145060)))

(declare-fun b!1570915 () Bool)

(assert (=> b!1570915 (= e!875820 (ite c!145062 (t!51669 (t!51669 l!750)) (ite c!145063 (Cons!36754 (h!38201 (t!51669 l!750)) (t!51669 (t!51669 l!750))) Nil!36755)))))

(assert (= (and d!164335 c!145060) b!1570912))

(assert (= (and d!164335 (not c!145060)) b!1570907))

(assert (= (and b!1570907 c!145062) b!1570914))

(assert (= (and b!1570907 (not c!145062)) b!1570910))

(assert (= (and b!1570910 c!145063) b!1570909))

(assert (= (and b!1570910 (not c!145063)) b!1570911))

(assert (= (or b!1570909 b!1570911) bm!72315))

(assert (= (or b!1570914 bm!72315) bm!72316))

(assert (= (or b!1570912 bm!72316) bm!72317))

(assert (= (and bm!72317 c!145061) b!1570913))

(assert (= (and bm!72317 (not c!145061)) b!1570915))

(assert (= (and d!164335 res!1073261) b!1570906))

(assert (= (and b!1570906 res!1073260) b!1570908))

(declare-fun m!1444885 () Bool)

(assert (=> b!1570908 m!1444885))

(declare-fun m!1444887 () Bool)

(assert (=> b!1570906 m!1444887))

(declare-fun m!1444889 () Bool)

(assert (=> b!1570913 m!1444889))

(declare-fun m!1444891 () Bool)

(assert (=> bm!72317 m!1444891))

(declare-fun m!1444893 () Bool)

(assert (=> d!164335 m!1444893))

(assert (=> d!164335 m!1444751))

(assert (=> b!1570828 d!164335))

(declare-fun d!164337 () Bool)

(assert (=> d!164337 (= ($colon$colon!1004 e!875791 (ite c!145044 (h!38201 (insertStrictlySorted!599 l!750 key2!21 v2!10)) (tuple2!25379 key1!37 v1!32))) (Cons!36754 (ite c!145044 (h!38201 (insertStrictlySorted!599 l!750 key2!21 v2!10)) (tuple2!25379 key1!37 v1!32)) e!875791))))

(assert (=> bm!72305 d!164337))

(declare-fun b!1570916 () Bool)

(declare-fun res!1073262 () Bool)

(declare-fun e!875824 () Bool)

(assert (=> b!1570916 (=> (not res!1073262) (not e!875824))))

(declare-fun lt!673452 () List!36758)

(assert (=> b!1570916 (= res!1073262 (containsKey!871 lt!673452 key2!21))))

(declare-fun b!1570917 () Bool)

(declare-fun e!875823 () List!36758)

(declare-fun e!875822 () List!36758)

(assert (=> b!1570917 (= e!875823 e!875822)))

(declare-fun c!145066 () Bool)

(assert (=> b!1570917 (= c!145066 (and (is-Cons!36754 (t!51669 l!750)) (= (_1!12700 (h!38201 (t!51669 l!750))) key2!21)))))

(declare-fun bm!72318 () Bool)

(declare-fun call!72323 () List!36758)

(declare-fun call!72322 () List!36758)

(assert (=> bm!72318 (= call!72323 call!72322)))

(declare-fun bm!72319 () Bool)

(declare-fun call!72321 () List!36758)

(assert (=> bm!72319 (= call!72322 call!72321)))

(declare-fun b!1570918 () Bool)

(assert (=> b!1570918 (= e!875824 (contains!10432 lt!673452 (tuple2!25379 key2!21 v2!10)))))

(declare-fun b!1570919 () Bool)

(declare-fun e!875826 () List!36758)

(assert (=> b!1570919 (= e!875826 call!72323)))

(declare-fun b!1570920 () Bool)

(declare-fun c!145067 () Bool)

(assert (=> b!1570920 (= c!145067 (and (is-Cons!36754 (t!51669 l!750)) (bvsgt (_1!12700 (h!38201 (t!51669 l!750))) key2!21)))))

(assert (=> b!1570920 (= e!875822 e!875826)))

(declare-fun b!1570921 () Bool)

(assert (=> b!1570921 (= e!875826 call!72323)))

(declare-fun d!164339 () Bool)

(assert (=> d!164339 e!875824))

(declare-fun res!1073263 () Bool)

(assert (=> d!164339 (=> (not res!1073263) (not e!875824))))

(assert (=> d!164339 (= res!1073263 (isStrictlySorted!1022 lt!673452))))

(assert (=> d!164339 (= lt!673452 e!875823)))

(declare-fun c!145064 () Bool)

(assert (=> d!164339 (= c!145064 (and (is-Cons!36754 (t!51669 l!750)) (bvslt (_1!12700 (h!38201 (t!51669 l!750))) key2!21)))))

(assert (=> d!164339 (isStrictlySorted!1022 (t!51669 l!750))))

(assert (=> d!164339 (= (insertStrictlySorted!599 (t!51669 l!750) key2!21 v2!10) lt!673452)))

(declare-fun b!1570922 () Bool)

(assert (=> b!1570922 (= e!875823 call!72321)))

(declare-fun b!1570923 () Bool)

(declare-fun e!875825 () List!36758)

(assert (=> b!1570923 (= e!875825 (insertStrictlySorted!599 (t!51669 (t!51669 l!750)) key2!21 v2!10))))

(declare-fun b!1570924 () Bool)

(assert (=> b!1570924 (= e!875822 call!72322)))

(declare-fun bm!72320 () Bool)

(assert (=> bm!72320 (= call!72321 ($colon$colon!1004 e!875825 (ite c!145064 (h!38201 (t!51669 l!750)) (tuple2!25379 key2!21 v2!10))))))

(declare-fun c!145065 () Bool)

(assert (=> bm!72320 (= c!145065 c!145064)))

(declare-fun b!1570925 () Bool)

(assert (=> b!1570925 (= e!875825 (ite c!145066 (t!51669 (t!51669 l!750)) (ite c!145067 (Cons!36754 (h!38201 (t!51669 l!750)) (t!51669 (t!51669 l!750))) Nil!36755)))))

(assert (= (and d!164339 c!145064) b!1570922))

(assert (= (and d!164339 (not c!145064)) b!1570917))

(assert (= (and b!1570917 c!145066) b!1570924))

(assert (= (and b!1570917 (not c!145066)) b!1570920))

(assert (= (and b!1570920 c!145067) b!1570919))

(assert (= (and b!1570920 (not c!145067)) b!1570921))

(assert (= (or b!1570919 b!1570921) bm!72318))

(assert (= (or b!1570924 bm!72318) bm!72319))

(assert (= (or b!1570922 bm!72319) bm!72320))

(assert (= (and bm!72320 c!145065) b!1570923))

(assert (= (and bm!72320 (not c!145065)) b!1570925))

(assert (= (and d!164339 res!1073263) b!1570916))

(assert (= (and b!1570916 res!1073262) b!1570918))

(declare-fun m!1444895 () Bool)

(assert (=> b!1570918 m!1444895))

(declare-fun m!1444897 () Bool)

(assert (=> b!1570916 m!1444897))

(declare-fun m!1444899 () Bool)

(assert (=> b!1570923 m!1444899))

(declare-fun m!1444901 () Bool)

(assert (=> bm!72320 m!1444901))

(declare-fun m!1444903 () Bool)

(assert (=> d!164339 m!1444903))

(assert (=> d!164339 m!1444751))

(assert (=> b!1570888 d!164339))

(declare-fun lt!673455 () Bool)

(declare-fun d!164341 () Bool)

(declare-fun content!821 (List!36758) (Set tuple2!25378))

(assert (=> d!164341 (= lt!673455 (set.member (tuple2!25379 key2!21 v2!10) (content!821 lt!673441)))))

(declare-fun e!875832 () Bool)

(assert (=> d!164341 (= lt!673455 e!875832)))

(declare-fun res!1073269 () Bool)

(assert (=> d!164341 (=> (not res!1073269) (not e!875832))))

(assert (=> d!164341 (= res!1073269 (is-Cons!36754 lt!673441))))

(assert (=> d!164341 (= (contains!10432 lt!673441 (tuple2!25379 key2!21 v2!10)) lt!673455)))

(declare-fun b!1570930 () Bool)

(declare-fun e!875831 () Bool)

(assert (=> b!1570930 (= e!875832 e!875831)))

(declare-fun res!1073268 () Bool)

(assert (=> b!1570930 (=> res!1073268 e!875831)))

(assert (=> b!1570930 (= res!1073268 (= (h!38201 lt!673441) (tuple2!25379 key2!21 v2!10)))))

(declare-fun b!1570931 () Bool)

(assert (=> b!1570931 (= e!875831 (contains!10432 (t!51669 lt!673441) (tuple2!25379 key2!21 v2!10)))))

(assert (= (and d!164341 res!1073269) b!1570930))

(assert (= (and b!1570930 (not res!1073268)) b!1570931))

(declare-fun m!1444905 () Bool)

(assert (=> d!164341 m!1444905))

(declare-fun m!1444907 () Bool)

(assert (=> d!164341 m!1444907))

(declare-fun m!1444909 () Bool)

(assert (=> b!1570931 m!1444909))

(assert (=> b!1570793 d!164341))

(declare-fun d!164343 () Bool)

(declare-fun res!1073274 () Bool)

(declare-fun e!875837 () Bool)

(assert (=> d!164343 (=> res!1073274 e!875837)))

(assert (=> d!164343 (= res!1073274 (and (is-Cons!36754 lt!673444) (= (_1!12700 (h!38201 lt!673444)) key1!37)))))

(assert (=> d!164343 (= (containsKey!871 lt!673444 key1!37) e!875837)))

(declare-fun b!1570936 () Bool)

(declare-fun e!875838 () Bool)

(assert (=> b!1570936 (= e!875837 e!875838)))

(declare-fun res!1073275 () Bool)

(assert (=> b!1570936 (=> (not res!1073275) (not e!875838))))

(assert (=> b!1570936 (= res!1073275 (and (or (not (is-Cons!36754 lt!673444)) (bvsle (_1!12700 (h!38201 lt!673444)) key1!37)) (is-Cons!36754 lt!673444) (bvslt (_1!12700 (h!38201 lt!673444)) key1!37)))))

(declare-fun b!1570937 () Bool)

(assert (=> b!1570937 (= e!875838 (containsKey!871 (t!51669 lt!673444) key1!37))))

(assert (= (and d!164343 (not res!1073274)) b!1570936))

(assert (= (and b!1570936 res!1073275) b!1570937))

(declare-fun m!1444911 () Bool)

(assert (=> b!1570937 m!1444911))

(assert (=> b!1570821 d!164343))

(declare-fun d!164345 () Bool)

(declare-fun res!1073276 () Bool)

(declare-fun e!875839 () Bool)

(assert (=> d!164345 (=> res!1073276 e!875839)))

(assert (=> d!164345 (= res!1073276 (or (is-Nil!36755 lt!673447) (is-Nil!36755 (t!51669 lt!673447))))))

(assert (=> d!164345 (= (isStrictlySorted!1022 lt!673447) e!875839)))

(declare-fun b!1570938 () Bool)

(declare-fun e!875840 () Bool)

(assert (=> b!1570938 (= e!875839 e!875840)))

(declare-fun res!1073277 () Bool)

(assert (=> b!1570938 (=> (not res!1073277) (not e!875840))))

(assert (=> b!1570938 (= res!1073277 (bvslt (_1!12700 (h!38201 lt!673447)) (_1!12700 (h!38201 (t!51669 lt!673447)))))))

(declare-fun b!1570939 () Bool)

(assert (=> b!1570939 (= e!875840 (isStrictlySorted!1022 (t!51669 lt!673447)))))

(assert (= (and d!164345 (not res!1073276)) b!1570938))

(assert (= (and b!1570938 res!1073277) b!1570939))

(declare-fun m!1444913 () Bool)

(assert (=> b!1570939 m!1444913))

(assert (=> d!164327 d!164345))

(declare-fun d!164347 () Bool)

(declare-fun res!1073278 () Bool)

(declare-fun e!875841 () Bool)

(assert (=> d!164347 (=> res!1073278 e!875841)))

(assert (=> d!164347 (= res!1073278 (or (is-Nil!36755 (insertStrictlySorted!599 l!750 key2!21 v2!10)) (is-Nil!36755 (t!51669 (insertStrictlySorted!599 l!750 key2!21 v2!10)))))))

(assert (=> d!164347 (= (isStrictlySorted!1022 (insertStrictlySorted!599 l!750 key2!21 v2!10)) e!875841)))

(declare-fun b!1570940 () Bool)

(declare-fun e!875842 () Bool)

(assert (=> b!1570940 (= e!875841 e!875842)))

(declare-fun res!1073279 () Bool)

(assert (=> b!1570940 (=> (not res!1073279) (not e!875842))))

(assert (=> b!1570940 (= res!1073279 (bvslt (_1!12700 (h!38201 (insertStrictlySorted!599 l!750 key2!21 v2!10))) (_1!12700 (h!38201 (t!51669 (insertStrictlySorted!599 l!750 key2!21 v2!10))))))))

(declare-fun b!1570941 () Bool)

(assert (=> b!1570941 (= e!875842 (isStrictlySorted!1022 (t!51669 (insertStrictlySorted!599 l!750 key2!21 v2!10))))))

(assert (= (and d!164347 (not res!1073278)) b!1570940))

(assert (= (and b!1570940 res!1073279) b!1570941))

(declare-fun m!1444915 () Bool)

(assert (=> b!1570941 m!1444915))

(assert (=> d!164327 d!164347))

(declare-fun d!164349 () Bool)

(declare-fun res!1073280 () Bool)

(declare-fun e!875843 () Bool)

(assert (=> d!164349 (=> res!1073280 e!875843)))

(assert (=> d!164349 (= res!1073280 (or (is-Nil!36755 lt!673450) (is-Nil!36755 (t!51669 lt!673450))))))

(assert (=> d!164349 (= (isStrictlySorted!1022 lt!673450) e!875843)))

(declare-fun b!1570942 () Bool)

(declare-fun e!875844 () Bool)

(assert (=> b!1570942 (= e!875843 e!875844)))

(declare-fun res!1073281 () Bool)

(assert (=> b!1570942 (=> (not res!1073281) (not e!875844))))

(assert (=> b!1570942 (= res!1073281 (bvslt (_1!12700 (h!38201 lt!673450)) (_1!12700 (h!38201 (t!51669 lt!673450)))))))

(declare-fun b!1570943 () Bool)

(assert (=> b!1570943 (= e!875844 (isStrictlySorted!1022 (t!51669 lt!673450)))))

(assert (= (and d!164349 (not res!1073280)) b!1570942))

(assert (= (and b!1570942 res!1073281) b!1570943))

(declare-fun m!1444917 () Bool)

(assert (=> b!1570943 m!1444917))

(assert (=> d!164333 d!164349))

(assert (=> d!164333 d!164309))

(declare-fun d!164351 () Bool)

(declare-fun res!1073282 () Bool)

(declare-fun e!875845 () Bool)

(assert (=> d!164351 (=> res!1073282 e!875845)))

(assert (=> d!164351 (= res!1073282 (and (is-Cons!36754 lt!673450) (= (_1!12700 (h!38201 lt!673450)) key2!21)))))

(assert (=> d!164351 (= (containsKey!871 lt!673450 key2!21) e!875845)))

(declare-fun b!1570944 () Bool)

(declare-fun e!875846 () Bool)

(assert (=> b!1570944 (= e!875845 e!875846)))

(declare-fun res!1073283 () Bool)

(assert (=> b!1570944 (=> (not res!1073283) (not e!875846))))

(assert (=> b!1570944 (= res!1073283 (and (or (not (is-Cons!36754 lt!673450)) (bvsle (_1!12700 (h!38201 lt!673450)) key2!21)) (is-Cons!36754 lt!673450) (bvslt (_1!12700 (h!38201 lt!673450)) key2!21)))))

(declare-fun b!1570945 () Bool)

(assert (=> b!1570945 (= e!875846 (containsKey!871 (t!51669 lt!673450) key2!21))))

(assert (= (and d!164351 (not res!1073282)) b!1570944))

(assert (= (and b!1570944 res!1073283) b!1570945))

(declare-fun m!1444919 () Bool)

(assert (=> b!1570945 m!1444919))

(assert (=> b!1570881 d!164351))

(declare-fun d!164353 () Bool)

(assert (=> d!164353 (= ($colon$colon!1004 e!875776 (ite c!145032 (h!38201 l!750) (tuple2!25379 key1!37 v1!32))) (Cons!36754 (ite c!145032 (h!38201 l!750) (tuple2!25379 key1!37 v1!32)) e!875776))))

(assert (=> bm!72296 d!164353))

(declare-fun d!164355 () Bool)

(declare-fun res!1073284 () Bool)

(declare-fun e!875847 () Bool)

(assert (=> d!164355 (=> res!1073284 e!875847)))

(assert (=> d!164355 (= res!1073284 (and (is-Cons!36754 lt!673441) (= (_1!12700 (h!38201 lt!673441)) key2!21)))))

(assert (=> d!164355 (= (containsKey!871 lt!673441 key2!21) e!875847)))

(declare-fun b!1570946 () Bool)

(declare-fun e!875848 () Bool)

(assert (=> b!1570946 (= e!875847 e!875848)))

(declare-fun res!1073285 () Bool)

(assert (=> b!1570946 (=> (not res!1073285) (not e!875848))))

(assert (=> b!1570946 (= res!1073285 (and (or (not (is-Cons!36754 lt!673441)) (bvsle (_1!12700 (h!38201 lt!673441)) key2!21)) (is-Cons!36754 lt!673441) (bvslt (_1!12700 (h!38201 lt!673441)) key2!21)))))

(declare-fun b!1570947 () Bool)

(assert (=> b!1570947 (= e!875848 (containsKey!871 (t!51669 lt!673441) key2!21))))

(assert (= (and d!164355 (not res!1073284)) b!1570946))

(assert (= (and b!1570946 res!1073285) b!1570947))

(declare-fun m!1444921 () Bool)

(assert (=> b!1570947 m!1444921))

(assert (=> b!1570791 d!164355))

(declare-fun d!164357 () Bool)

(declare-fun res!1073286 () Bool)

(declare-fun e!875849 () Bool)

(assert (=> d!164357 (=> res!1073286 e!875849)))

(assert (=> d!164357 (= res!1073286 (and (is-Cons!36754 lt!673447) (= (_1!12700 (h!38201 lt!673447)) key1!37)))))

(assert (=> d!164357 (= (containsKey!871 lt!673447 key1!37) e!875849)))

(declare-fun b!1570948 () Bool)

(declare-fun e!875850 () Bool)

(assert (=> b!1570948 (= e!875849 e!875850)))

(declare-fun res!1073287 () Bool)

(assert (=> b!1570948 (=> (not res!1073287) (not e!875850))))

(assert (=> b!1570948 (= res!1073287 (and (or (not (is-Cons!36754 lt!673447)) (bvsle (_1!12700 (h!38201 lt!673447)) key1!37)) (is-Cons!36754 lt!673447) (bvslt (_1!12700 (h!38201 lt!673447)) key1!37)))))

(declare-fun b!1570949 () Bool)

(assert (=> b!1570949 (= e!875850 (containsKey!871 (t!51669 lt!673447) key1!37))))

(assert (= (and d!164357 (not res!1073286)) b!1570948))

(assert (= (and b!1570948 res!1073287) b!1570949))

(declare-fun m!1444923 () Bool)

(assert (=> b!1570949 m!1444923))

(assert (=> b!1570851 d!164357))

(declare-fun d!164359 () Bool)

(assert (=> d!164359 (= ($colon$colon!1004 e!875761 (ite c!145020 (h!38201 (insertStrictlySorted!599 l!750 key1!37 v1!32)) (tuple2!25379 key2!21 v2!10))) (Cons!36754 (ite c!145020 (h!38201 (insertStrictlySorted!599 l!750 key1!37 v1!32)) (tuple2!25379 key2!21 v2!10)) e!875761))))

(assert (=> bm!72287 d!164359))

(declare-fun d!164361 () Bool)

(declare-fun res!1073288 () Bool)

(declare-fun e!875851 () Bool)

(assert (=> d!164361 (=> res!1073288 e!875851)))

(assert (=> d!164361 (= res!1073288 (or (is-Nil!36755 lt!673444) (is-Nil!36755 (t!51669 lt!673444))))))

(assert (=> d!164361 (= (isStrictlySorted!1022 lt!673444) e!875851)))

(declare-fun b!1570950 () Bool)

(declare-fun e!875852 () Bool)

(assert (=> b!1570950 (= e!875851 e!875852)))

(declare-fun res!1073289 () Bool)

(assert (=> b!1570950 (=> (not res!1073289) (not e!875852))))

(assert (=> b!1570950 (= res!1073289 (bvslt (_1!12700 (h!38201 lt!673444)) (_1!12700 (h!38201 (t!51669 lt!673444)))))))

(declare-fun b!1570951 () Bool)

(assert (=> b!1570951 (= e!875852 (isStrictlySorted!1022 (t!51669 lt!673444)))))

(assert (= (and d!164361 (not res!1073288)) b!1570950))

(assert (= (and b!1570950 res!1073289) b!1570951))

(declare-fun m!1444925 () Bool)

(assert (=> b!1570951 m!1444925))

(assert (=> d!164321 d!164361))

(assert (=> d!164321 d!164309))

(declare-fun b!1570952 () Bool)

(declare-fun res!1073290 () Bool)

(declare-fun e!875855 () Bool)

(assert (=> b!1570952 (=> (not res!1073290) (not e!875855))))

(declare-fun lt!673456 () List!36758)

(assert (=> b!1570952 (= res!1073290 (containsKey!871 lt!673456 key1!37))))

(declare-fun b!1570953 () Bool)

(declare-fun e!875854 () List!36758)

(declare-fun e!875853 () List!36758)

(assert (=> b!1570953 (= e!875854 e!875853)))

(declare-fun c!145070 () Bool)

(assert (=> b!1570953 (= c!145070 (and (is-Cons!36754 (t!51669 (insertStrictlySorted!599 l!750 key2!21 v2!10))) (= (_1!12700 (h!38201 (t!51669 (insertStrictlySorted!599 l!750 key2!21 v2!10)))) key1!37)))))

(declare-fun bm!72321 () Bool)

(declare-fun call!72326 () List!36758)

(declare-fun call!72325 () List!36758)

(assert (=> bm!72321 (= call!72326 call!72325)))

(declare-fun bm!72322 () Bool)

(declare-fun call!72324 () List!36758)

(assert (=> bm!72322 (= call!72325 call!72324)))

(declare-fun b!1570954 () Bool)

(assert (=> b!1570954 (= e!875855 (contains!10432 lt!673456 (tuple2!25379 key1!37 v1!32)))))

(declare-fun b!1570955 () Bool)

(declare-fun e!875857 () List!36758)

(assert (=> b!1570955 (= e!875857 call!72326)))

(declare-fun c!145071 () Bool)

(declare-fun b!1570956 () Bool)

(assert (=> b!1570956 (= c!145071 (and (is-Cons!36754 (t!51669 (insertStrictlySorted!599 l!750 key2!21 v2!10))) (bvsgt (_1!12700 (h!38201 (t!51669 (insertStrictlySorted!599 l!750 key2!21 v2!10)))) key1!37)))))

(assert (=> b!1570956 (= e!875853 e!875857)))

(declare-fun b!1570957 () Bool)

(assert (=> b!1570957 (= e!875857 call!72326)))

(declare-fun d!164363 () Bool)

(assert (=> d!164363 e!875855))

(declare-fun res!1073291 () Bool)

(assert (=> d!164363 (=> (not res!1073291) (not e!875855))))

(assert (=> d!164363 (= res!1073291 (isStrictlySorted!1022 lt!673456))))

(assert (=> d!164363 (= lt!673456 e!875854)))

(declare-fun c!145068 () Bool)

(assert (=> d!164363 (= c!145068 (and (is-Cons!36754 (t!51669 (insertStrictlySorted!599 l!750 key2!21 v2!10))) (bvslt (_1!12700 (h!38201 (t!51669 (insertStrictlySorted!599 l!750 key2!21 v2!10)))) key1!37)))))

(assert (=> d!164363 (isStrictlySorted!1022 (t!51669 (insertStrictlySorted!599 l!750 key2!21 v2!10)))))

(assert (=> d!164363 (= (insertStrictlySorted!599 (t!51669 (insertStrictlySorted!599 l!750 key2!21 v2!10)) key1!37 v1!32) lt!673456)))

(declare-fun b!1570958 () Bool)

(assert (=> b!1570958 (= e!875854 call!72324)))

(declare-fun b!1570959 () Bool)

(declare-fun e!875856 () List!36758)

(assert (=> b!1570959 (= e!875856 (insertStrictlySorted!599 (t!51669 (t!51669 (insertStrictlySorted!599 l!750 key2!21 v2!10))) key1!37 v1!32))))

(declare-fun b!1570960 () Bool)

(assert (=> b!1570960 (= e!875853 call!72325)))

(declare-fun bm!72323 () Bool)

(assert (=> bm!72323 (= call!72324 ($colon$colon!1004 e!875856 (ite c!145068 (h!38201 (t!51669 (insertStrictlySorted!599 l!750 key2!21 v2!10))) (tuple2!25379 key1!37 v1!32))))))

(declare-fun c!145069 () Bool)

(assert (=> bm!72323 (= c!145069 c!145068)))

(declare-fun b!1570961 () Bool)

(assert (=> b!1570961 (= e!875856 (ite c!145070 (t!51669 (t!51669 (insertStrictlySorted!599 l!750 key2!21 v2!10))) (ite c!145071 (Cons!36754 (h!38201 (t!51669 (insertStrictlySorted!599 l!750 key2!21 v2!10))) (t!51669 (t!51669 (insertStrictlySorted!599 l!750 key2!21 v2!10)))) Nil!36755)))))

(assert (= (and d!164363 c!145068) b!1570958))

(assert (= (and d!164363 (not c!145068)) b!1570953))

(assert (= (and b!1570953 c!145070) b!1570960))

(assert (= (and b!1570953 (not c!145070)) b!1570956))

(assert (= (and b!1570956 c!145071) b!1570955))

(assert (= (and b!1570956 (not c!145071)) b!1570957))

(assert (= (or b!1570955 b!1570957) bm!72321))

(assert (= (or b!1570960 bm!72321) bm!72322))

(assert (= (or b!1570958 bm!72322) bm!72323))

(assert (= (and bm!72323 c!145069) b!1570959))

(assert (= (and bm!72323 (not c!145069)) b!1570961))

(assert (= (and d!164363 res!1073291) b!1570952))

(assert (= (and b!1570952 res!1073290) b!1570954))

(declare-fun m!1444927 () Bool)

(assert (=> b!1570954 m!1444927))

(declare-fun m!1444929 () Bool)

(assert (=> b!1570952 m!1444929))

(declare-fun m!1444931 () Bool)

(assert (=> b!1570959 m!1444931))

(declare-fun m!1444933 () Bool)

(assert (=> bm!72323 m!1444933))

(declare-fun m!1444935 () Bool)

(assert (=> d!164363 m!1444935))

(assert (=> d!164363 m!1444915))

(assert (=> b!1570858 d!164363))

(declare-fun d!164365 () Bool)

(declare-fun lt!673457 () Bool)

(assert (=> d!164365 (= lt!673457 (set.member (tuple2!25379 key1!37 v1!32) (content!821 lt!673444)))))

(declare-fun e!875859 () Bool)

(assert (=> d!164365 (= lt!673457 e!875859)))

(declare-fun res!1073293 () Bool)

(assert (=> d!164365 (=> (not res!1073293) (not e!875859))))

(assert (=> d!164365 (= res!1073293 (is-Cons!36754 lt!673444))))

(assert (=> d!164365 (= (contains!10432 lt!673444 (tuple2!25379 key1!37 v1!32)) lt!673457)))

(declare-fun b!1570962 () Bool)

(declare-fun e!875858 () Bool)

(assert (=> b!1570962 (= e!875859 e!875858)))

(declare-fun res!1073292 () Bool)

(assert (=> b!1570962 (=> res!1073292 e!875858)))

(assert (=> b!1570962 (= res!1073292 (= (h!38201 lt!673444) (tuple2!25379 key1!37 v1!32)))))

(declare-fun b!1570963 () Bool)

(assert (=> b!1570963 (= e!875858 (contains!10432 (t!51669 lt!673444) (tuple2!25379 key1!37 v1!32)))))

(assert (= (and d!164365 res!1073293) b!1570962))

(assert (= (and b!1570962 (not res!1073292)) b!1570963))

(declare-fun m!1444937 () Bool)

(assert (=> d!164365 m!1444937))

(declare-fun m!1444939 () Bool)

(assert (=> d!164365 m!1444939))

(declare-fun m!1444941 () Bool)

(assert (=> b!1570963 m!1444941))

(assert (=> b!1570823 d!164365))

(declare-fun lt!673458 () Bool)

(declare-fun d!164367 () Bool)

(assert (=> d!164367 (= lt!673458 (set.member (tuple2!25379 key2!21 v2!10) (content!821 lt!673450)))))

(declare-fun e!875861 () Bool)

(assert (=> d!164367 (= lt!673458 e!875861)))

(declare-fun res!1073295 () Bool)

(assert (=> d!164367 (=> (not res!1073295) (not e!875861))))

(assert (=> d!164367 (= res!1073295 (is-Cons!36754 lt!673450))))

(assert (=> d!164367 (= (contains!10432 lt!673450 (tuple2!25379 key2!21 v2!10)) lt!673458)))

(declare-fun b!1570964 () Bool)

(declare-fun e!875860 () Bool)

(assert (=> b!1570964 (= e!875861 e!875860)))

(declare-fun res!1073294 () Bool)

(assert (=> b!1570964 (=> res!1073294 e!875860)))

(assert (=> b!1570964 (= res!1073294 (= (h!38201 lt!673450) (tuple2!25379 key2!21 v2!10)))))

(declare-fun b!1570965 () Bool)

(assert (=> b!1570965 (= e!875860 (contains!10432 (t!51669 lt!673450) (tuple2!25379 key2!21 v2!10)))))

(assert (= (and d!164367 res!1073295) b!1570964))

(assert (= (and b!1570964 (not res!1073294)) b!1570965))

(declare-fun m!1444943 () Bool)

(assert (=> d!164367 m!1444943))

(declare-fun m!1444945 () Bool)

(assert (=> d!164367 m!1444945))

(declare-fun m!1444947 () Bool)

(assert (=> b!1570965 m!1444947))

(assert (=> b!1570883 d!164367))

(declare-fun b!1570966 () Bool)

(declare-fun res!1073296 () Bool)

(declare-fun e!875864 () Bool)

(assert (=> b!1570966 (=> (not res!1073296) (not e!875864))))

(declare-fun lt!673459 () List!36758)

(assert (=> b!1570966 (= res!1073296 (containsKey!871 lt!673459 key2!21))))

(declare-fun b!1570967 () Bool)

(declare-fun e!875863 () List!36758)

(declare-fun e!875862 () List!36758)

(assert (=> b!1570967 (= e!875863 e!875862)))

(declare-fun c!145074 () Bool)

(assert (=> b!1570967 (= c!145074 (and (is-Cons!36754 (t!51669 (insertStrictlySorted!599 l!750 key1!37 v1!32))) (= (_1!12700 (h!38201 (t!51669 (insertStrictlySorted!599 l!750 key1!37 v1!32)))) key2!21)))))

(declare-fun bm!72324 () Bool)

(declare-fun call!72329 () List!36758)

(declare-fun call!72328 () List!36758)

(assert (=> bm!72324 (= call!72329 call!72328)))

(declare-fun bm!72325 () Bool)

(declare-fun call!72327 () List!36758)

(assert (=> bm!72325 (= call!72328 call!72327)))

(declare-fun b!1570968 () Bool)

(assert (=> b!1570968 (= e!875864 (contains!10432 lt!673459 (tuple2!25379 key2!21 v2!10)))))

(declare-fun b!1570969 () Bool)

(declare-fun e!875866 () List!36758)

(assert (=> b!1570969 (= e!875866 call!72329)))

(declare-fun c!145075 () Bool)

(declare-fun b!1570970 () Bool)

(assert (=> b!1570970 (= c!145075 (and (is-Cons!36754 (t!51669 (insertStrictlySorted!599 l!750 key1!37 v1!32))) (bvsgt (_1!12700 (h!38201 (t!51669 (insertStrictlySorted!599 l!750 key1!37 v1!32)))) key2!21)))))

(assert (=> b!1570970 (= e!875862 e!875866)))

(declare-fun b!1570971 () Bool)

(assert (=> b!1570971 (= e!875866 call!72329)))

(declare-fun d!164369 () Bool)

(assert (=> d!164369 e!875864))

(declare-fun res!1073297 () Bool)

(assert (=> d!164369 (=> (not res!1073297) (not e!875864))))

(assert (=> d!164369 (= res!1073297 (isStrictlySorted!1022 lt!673459))))

(assert (=> d!164369 (= lt!673459 e!875863)))

(declare-fun c!145072 () Bool)

(assert (=> d!164369 (= c!145072 (and (is-Cons!36754 (t!51669 (insertStrictlySorted!599 l!750 key1!37 v1!32))) (bvslt (_1!12700 (h!38201 (t!51669 (insertStrictlySorted!599 l!750 key1!37 v1!32)))) key2!21)))))

(assert (=> d!164369 (isStrictlySorted!1022 (t!51669 (insertStrictlySorted!599 l!750 key1!37 v1!32)))))

(assert (=> d!164369 (= (insertStrictlySorted!599 (t!51669 (insertStrictlySorted!599 l!750 key1!37 v1!32)) key2!21 v2!10) lt!673459)))

(declare-fun b!1570972 () Bool)

(assert (=> b!1570972 (= e!875863 call!72327)))

(declare-fun e!875865 () List!36758)

(declare-fun b!1570973 () Bool)

(assert (=> b!1570973 (= e!875865 (insertStrictlySorted!599 (t!51669 (t!51669 (insertStrictlySorted!599 l!750 key1!37 v1!32))) key2!21 v2!10))))

(declare-fun b!1570974 () Bool)

(assert (=> b!1570974 (= e!875862 call!72328)))

(declare-fun bm!72326 () Bool)

(assert (=> bm!72326 (= call!72327 ($colon$colon!1004 e!875865 (ite c!145072 (h!38201 (t!51669 (insertStrictlySorted!599 l!750 key1!37 v1!32))) (tuple2!25379 key2!21 v2!10))))))

(declare-fun c!145073 () Bool)

(assert (=> bm!72326 (= c!145073 c!145072)))

(declare-fun b!1570975 () Bool)

(assert (=> b!1570975 (= e!875865 (ite c!145074 (t!51669 (t!51669 (insertStrictlySorted!599 l!750 key1!37 v1!32))) (ite c!145075 (Cons!36754 (h!38201 (t!51669 (insertStrictlySorted!599 l!750 key1!37 v1!32))) (t!51669 (t!51669 (insertStrictlySorted!599 l!750 key1!37 v1!32)))) Nil!36755)))))

(assert (= (and d!164369 c!145072) b!1570972))

(assert (= (and d!164369 (not c!145072)) b!1570967))

(assert (= (and b!1570967 c!145074) b!1570974))

(assert (= (and b!1570967 (not c!145074)) b!1570970))

(assert (= (and b!1570970 c!145075) b!1570969))

(assert (= (and b!1570970 (not c!145075)) b!1570971))

(assert (= (or b!1570969 b!1570971) bm!72324))

(assert (= (or b!1570974 bm!72324) bm!72325))

(assert (= (or b!1570972 bm!72325) bm!72326))

(assert (= (and bm!72326 c!145073) b!1570973))

(assert (= (and bm!72326 (not c!145073)) b!1570975))

(assert (= (and d!164369 res!1073297) b!1570966))

(assert (= (and b!1570966 res!1073296) b!1570968))

(declare-fun m!1444949 () Bool)

(assert (=> b!1570968 m!1444949))

(declare-fun m!1444951 () Bool)

(assert (=> b!1570966 m!1444951))

(declare-fun m!1444953 () Bool)

(assert (=> b!1570973 m!1444953))

(declare-fun m!1444955 () Bool)

(assert (=> bm!72326 m!1444955))

(declare-fun m!1444957 () Bool)

(assert (=> d!164369 m!1444957))

(declare-fun m!1444959 () Bool)

(assert (=> d!164369 m!1444959))

(assert (=> b!1570798 d!164369))

(declare-fun d!164373 () Bool)

(declare-fun res!1073300 () Bool)

(declare-fun e!875872 () Bool)

(assert (=> d!164373 (=> res!1073300 e!875872)))

(assert (=> d!164373 (= res!1073300 (or (is-Nil!36755 lt!673441) (is-Nil!36755 (t!51669 lt!673441))))))

(assert (=> d!164373 (= (isStrictlySorted!1022 lt!673441) e!875872)))

(declare-fun b!1570986 () Bool)

(declare-fun e!875873 () Bool)

(assert (=> b!1570986 (= e!875872 e!875873)))

(declare-fun res!1073301 () Bool)

(assert (=> b!1570986 (=> (not res!1073301) (not e!875873))))

(assert (=> b!1570986 (= res!1073301 (bvslt (_1!12700 (h!38201 lt!673441)) (_1!12700 (h!38201 (t!51669 lt!673441)))))))

(declare-fun b!1570987 () Bool)

(assert (=> b!1570987 (= e!875873 (isStrictlySorted!1022 (t!51669 lt!673441)))))

(assert (= (and d!164373 (not res!1073300)) b!1570986))

(assert (= (and b!1570986 res!1073301) b!1570987))

(declare-fun m!1444961 () Bool)

(assert (=> b!1570987 m!1444961))

(assert (=> d!164315 d!164373))

(declare-fun d!164375 () Bool)

(declare-fun res!1073302 () Bool)

(declare-fun e!875874 () Bool)

(assert (=> d!164375 (=> res!1073302 e!875874)))

(assert (=> d!164375 (= res!1073302 (or (is-Nil!36755 (insertStrictlySorted!599 l!750 key1!37 v1!32)) (is-Nil!36755 (t!51669 (insertStrictlySorted!599 l!750 key1!37 v1!32)))))))

(assert (=> d!164375 (= (isStrictlySorted!1022 (insertStrictlySorted!599 l!750 key1!37 v1!32)) e!875874)))

(declare-fun b!1570988 () Bool)

(declare-fun e!875875 () Bool)

(assert (=> b!1570988 (= e!875874 e!875875)))

(declare-fun res!1073303 () Bool)

(assert (=> b!1570988 (=> (not res!1073303) (not e!875875))))

(assert (=> b!1570988 (= res!1073303 (bvslt (_1!12700 (h!38201 (insertStrictlySorted!599 l!750 key1!37 v1!32))) (_1!12700 (h!38201 (t!51669 (insertStrictlySorted!599 l!750 key1!37 v1!32))))))))

(declare-fun b!1570989 () Bool)

(assert (=> b!1570989 (= e!875875 (isStrictlySorted!1022 (t!51669 (insertStrictlySorted!599 l!750 key1!37 v1!32))))))

(assert (= (and d!164375 (not res!1073302)) b!1570988))

(assert (= (and b!1570988 res!1073303) b!1570989))

(assert (=> b!1570989 m!1444959))

(assert (=> d!164315 d!164375))

(declare-fun d!164377 () Bool)

(assert (=> d!164377 (= ($colon$colon!1004 e!875806 (ite c!145056 (h!38201 l!750) (tuple2!25379 key2!21 v2!10))) (Cons!36754 (ite c!145056 (h!38201 l!750) (tuple2!25379 key2!21 v2!10)) e!875806))))

(assert (=> bm!72314 d!164377))

(declare-fun d!164379 () Bool)

(declare-fun res!1073304 () Bool)

(declare-fun e!875876 () Bool)

(assert (=> d!164379 (=> res!1073304 e!875876)))

(assert (=> d!164379 (= res!1073304 (or (is-Nil!36755 (t!51669 l!750)) (is-Nil!36755 (t!51669 (t!51669 l!750)))))))

(assert (=> d!164379 (= (isStrictlySorted!1022 (t!51669 l!750)) e!875876)))

(declare-fun b!1570990 () Bool)

(declare-fun e!875877 () Bool)

(assert (=> b!1570990 (= e!875876 e!875877)))

(declare-fun res!1073305 () Bool)

(assert (=> b!1570990 (=> (not res!1073305) (not e!875877))))

(assert (=> b!1570990 (= res!1073305 (bvslt (_1!12700 (h!38201 (t!51669 l!750))) (_1!12700 (h!38201 (t!51669 (t!51669 l!750))))))))

(declare-fun b!1570991 () Bool)

(assert (=> b!1570991 (= e!875877 (isStrictlySorted!1022 (t!51669 (t!51669 l!750))))))

(assert (= (and d!164379 (not res!1073304)) b!1570990))

(assert (= (and b!1570990 res!1073305) b!1570991))

(declare-fun m!1444975 () Bool)

(assert (=> b!1570991 m!1444975))

(assert (=> b!1570710 d!164379))

(declare-fun d!164383 () Bool)

(declare-fun lt!673461 () Bool)

(assert (=> d!164383 (= lt!673461 (set.member (tuple2!25379 key1!37 v1!32) (content!821 lt!673447)))))

(declare-fun e!875881 () Bool)

(assert (=> d!164383 (= lt!673461 e!875881)))

(declare-fun res!1073309 () Bool)

(assert (=> d!164383 (=> (not res!1073309) (not e!875881))))

(assert (=> d!164383 (= res!1073309 (is-Cons!36754 lt!673447))))

(assert (=> d!164383 (= (contains!10432 lt!673447 (tuple2!25379 key1!37 v1!32)) lt!673461)))

(declare-fun b!1570994 () Bool)

(declare-fun e!875880 () Bool)

(assert (=> b!1570994 (= e!875881 e!875880)))

(declare-fun res!1073308 () Bool)

(assert (=> b!1570994 (=> res!1073308 e!875880)))

(assert (=> b!1570994 (= res!1073308 (= (h!38201 lt!673447) (tuple2!25379 key1!37 v1!32)))))

(declare-fun b!1570995 () Bool)

(assert (=> b!1570995 (= e!875880 (contains!10432 (t!51669 lt!673447) (tuple2!25379 key1!37 v1!32)))))

(assert (= (and d!164383 res!1073309) b!1570994))

(assert (= (and b!1570994 (not res!1073308)) b!1570995))

(declare-fun m!1444979 () Bool)

(assert (=> d!164383 m!1444979))

(declare-fun m!1444981 () Bool)

(assert (=> d!164383 m!1444981))

(declare-fun m!1444983 () Bool)

(assert (=> b!1570995 m!1444983))

(assert (=> b!1570853 d!164383))

(declare-fun b!1570996 () Bool)

(declare-fun e!875882 () Bool)

(declare-fun tp!114247 () Bool)

(assert (=> b!1570996 (= e!875882 (and tp_is_empty!39103 tp!114247))))

(assert (=> b!1570905 (= tp!114246 e!875882)))

(assert (= (and b!1570905 (is-Cons!36754 (t!51669 (t!51669 l!750)))) b!1570996))

(push 1)

(assert (not b!1570949))

(assert (not d!164341))

(assert (not bm!72320))

(assert (not d!164365))

(assert (not bm!72317))

(assert (not b!1570959))

(assert (not d!164339))

(assert (not b!1570963))

(assert (not b!1570966))

(assert (not b!1570952))

(assert (not b!1570937))

(assert (not b!1570943))

(assert (not b!1570996))

(assert (not b!1570965))

(assert (not b!1570968))

(assert (not b!1570954))

(assert (not bm!72323))

(assert (not d!164335))

(assert (not d!164383))

(assert (not b!1570931))

(assert (not bm!72326))

(assert (not d!164367))

(assert (not b!1570939))

(assert (not b!1570908))

(assert (not b!1570916))

(assert (not b!1570995))

(assert (not b!1570947))

(assert (not b!1570987))

(assert (not b!1570913))

(assert (not b!1570951))

(assert (not b!1570989))

(assert (not b!1570973))

(assert (not d!164363))

(assert (not d!164369))

(assert (not b!1570941))

(assert (not b!1570906))

(assert tp_is_empty!39103)

(assert (not b!1570918))

(assert (not b!1570923))

(assert (not b!1570991))

(assert (not b!1570945))

(check-sat)

(pop 1)

(push 1)

(check-sat)

