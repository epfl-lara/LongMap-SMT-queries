; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134486 () Bool)

(assert start!134486)

(declare-fun b!1570367 () Bool)

(declare-fun e!875495 () Bool)

(declare-fun tp_is_empty!39105 () Bool)

(declare-fun tp!114235 () Bool)

(assert (=> b!1570367 (= e!875495 (and tp_is_empty!39105 tp!114235))))

(declare-datatypes ((B!2554 0))(
  ( (B!2555 (val!19639 Int)) )
))
(declare-fun v1!32 () B!2554)

(declare-fun v2!10 () B!2554)

(declare-datatypes ((tuple2!25448 0))(
  ( (tuple2!25449 (_1!12735 (_ BitVec 64)) (_2!12735 B!2554)) )
))
(declare-datatypes ((List!36800 0))(
  ( (Nil!36797) (Cons!36796 (h!38244 tuple2!25448) (t!51703 List!36800)) )
))
(declare-fun l!750 () List!36800)

(declare-fun e!875494 () Bool)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun b!1570366 () Bool)

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun insertStrictlySorted!601 (List!36800 (_ BitVec 64) B!2554) List!36800)

(assert (=> b!1570366 (= e!875494 (not (= (insertStrictlySorted!601 (insertStrictlySorted!601 l!750 key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!601 (insertStrictlySorted!601 l!750 key2!21 v2!10) key1!37 v1!32))))))

(declare-fun res!1073066 () Bool)

(assert (=> start!134486 (=> (not res!1073066) (not e!875494))))

(assert (=> start!134486 (= res!1073066 (not (= key1!37 key2!21)))))

(assert (=> start!134486 e!875494))

(assert (=> start!134486 tp_is_empty!39105))

(assert (=> start!134486 e!875495))

(assert (=> start!134486 true))

(declare-fun b!1570364 () Bool)

(declare-fun res!1073067 () Bool)

(assert (=> b!1570364 (=> (not res!1073067) (not e!875494))))

(declare-fun isStrictlySorted!1021 (List!36800) Bool)

(assert (=> b!1570364 (= res!1073067 (isStrictlySorted!1021 l!750))))

(declare-fun b!1570365 () Bool)

(declare-fun res!1073065 () Bool)

(assert (=> b!1570365 (=> (not res!1073065) (not e!875494))))

(assert (=> b!1570365 (= res!1073065 (or (not (is-Cons!36796 l!750)) (bvsge (_1!12735 (h!38244 l!750)) key1!37) (bvsge (_1!12735 (h!38244 l!750)) key2!21)))))

(assert (= (and start!134486 res!1073066) b!1570364))

(assert (= (and b!1570364 res!1073067) b!1570365))

(assert (= (and b!1570365 res!1073065) b!1570366))

(assert (= (and start!134486 (is-Cons!36796 l!750)) b!1570367))

(declare-fun m!1443835 () Bool)

(assert (=> b!1570366 m!1443835))

(assert (=> b!1570366 m!1443835))

(declare-fun m!1443837 () Bool)

(assert (=> b!1570366 m!1443837))

(declare-fun m!1443839 () Bool)

(assert (=> b!1570366 m!1443839))

(assert (=> b!1570366 m!1443839))

(declare-fun m!1443841 () Bool)

(assert (=> b!1570366 m!1443841))

(declare-fun m!1443843 () Bool)

(assert (=> b!1570364 m!1443843))

(push 1)

(assert (not b!1570366))

(assert (not b!1570364))

(assert (not b!1570367))

(assert tp_is_empty!39105)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!72247 () Bool)

(declare-fun call!72252 () List!36800)

(declare-fun call!72250 () List!36800)

(assert (=> bm!72247 (= call!72252 call!72250)))

(declare-fun b!1570450 () Bool)

(declare-fun res!1073091 () Bool)

(declare-fun e!875537 () Bool)

(assert (=> b!1570450 (=> (not res!1073091) (not e!875537))))

(declare-fun lt!673154 () List!36800)

(declare-fun containsKey!870 (List!36800 (_ BitVec 64)) Bool)

(assert (=> b!1570450 (= res!1073091 (containsKey!870 lt!673154 key2!21))))

(declare-fun b!1570451 () Bool)

(declare-fun e!875538 () List!36800)

(assert (=> b!1570451 (= e!875538 call!72250)))

(declare-fun bm!72248 () Bool)

(declare-fun call!72251 () List!36800)

(assert (=> bm!72248 (= call!72251 call!72252)))

(declare-fun e!875541 () List!36800)

(declare-fun b!1570452 () Bool)

(assert (=> b!1570452 (= e!875541 (insertStrictlySorted!601 (t!51703 (insertStrictlySorted!601 l!750 key1!37 v1!32)) key2!21 v2!10))))

(declare-fun d!164053 () Bool)

(assert (=> d!164053 e!875537))

(declare-fun res!1073092 () Bool)

(assert (=> d!164053 (=> (not res!1073092) (not e!875537))))

(assert (=> d!164053 (= res!1073092 (isStrictlySorted!1021 lt!673154))))

(assert (=> d!164053 (= lt!673154 e!875538)))

(declare-fun c!144930 () Bool)

(assert (=> d!164053 (= c!144930 (and (is-Cons!36796 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (bvslt (_1!12735 (h!38244 (insertStrictlySorted!601 l!750 key1!37 v1!32))) key2!21)))))

(assert (=> d!164053 (isStrictlySorted!1021 (insertStrictlySorted!601 l!750 key1!37 v1!32))))

(assert (=> d!164053 (= (insertStrictlySorted!601 (insertStrictlySorted!601 l!750 key1!37 v1!32) key2!21 v2!10) lt!673154)))

(declare-fun b!1570453 () Bool)

(declare-fun e!875540 () List!36800)

(assert (=> b!1570453 (= e!875540 call!72251)))

(declare-fun bm!72249 () Bool)

(declare-fun $colon$colon!1007 (List!36800 tuple2!25448) List!36800)

(assert (=> bm!72249 (= call!72250 ($colon$colon!1007 e!875541 (ite c!144930 (h!38244 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (tuple2!25449 key2!21 v2!10))))))

(declare-fun c!144929 () Bool)

(assert (=> bm!72249 (= c!144929 c!144930)))

(declare-fun b!1570454 () Bool)

(declare-fun e!875539 () List!36800)

(assert (=> b!1570454 (= e!875538 e!875539)))

(declare-fun c!144927 () Bool)

(assert (=> b!1570454 (= c!144927 (and (is-Cons!36796 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (= (_1!12735 (h!38244 (insertStrictlySorted!601 l!750 key1!37 v1!32))) key2!21)))))

(declare-fun b!1570455 () Bool)

(assert (=> b!1570455 (= e!875539 call!72252)))

(declare-fun b!1570456 () Bool)

(declare-fun c!144928 () Bool)

(assert (=> b!1570456 (= e!875541 (ite c!144927 (t!51703 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (ite c!144928 (Cons!36796 (h!38244 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (t!51703 (insertStrictlySorted!601 l!750 key1!37 v1!32))) Nil!36797)))))

(declare-fun b!1570457 () Bool)

(assert (=> b!1570457 (= e!875540 call!72251)))

(declare-fun b!1570458 () Bool)

(declare-fun contains!10387 (List!36800 tuple2!25448) Bool)

(assert (=> b!1570458 (= e!875537 (contains!10387 lt!673154 (tuple2!25449 key2!21 v2!10)))))

(declare-fun b!1570459 () Bool)

(assert (=> b!1570459 (= c!144928 (and (is-Cons!36796 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (bvsgt (_1!12735 (h!38244 (insertStrictlySorted!601 l!750 key1!37 v1!32))) key2!21)))))

(assert (=> b!1570459 (= e!875539 e!875540)))

(assert (= (and d!164053 c!144930) b!1570451))

(assert (= (and d!164053 (not c!144930)) b!1570454))

(assert (= (and b!1570454 c!144927) b!1570455))

(assert (= (and b!1570454 (not c!144927)) b!1570459))

(assert (= (and b!1570459 c!144928) b!1570453))

(assert (= (and b!1570459 (not c!144928)) b!1570457))

(assert (= (or b!1570453 b!1570457) bm!72248))

(assert (= (or b!1570455 bm!72248) bm!72247))

(assert (= (or b!1570451 bm!72247) bm!72249))

(assert (= (and bm!72249 c!144929) b!1570452))

(assert (= (and bm!72249 (not c!144929)) b!1570456))

(assert (= (and d!164053 res!1073092) b!1570450))

(assert (= (and b!1570450 res!1073091) b!1570458))

(declare-fun m!1443867 () Bool)

(assert (=> b!1570458 m!1443867))

(declare-fun m!1443869 () Bool)

(assert (=> b!1570450 m!1443869))

(declare-fun m!1443871 () Bool)

(assert (=> b!1570452 m!1443871))

(declare-fun m!1443873 () Bool)

(assert (=> d!164053 m!1443873))

(assert (=> d!164053 m!1443835))

(declare-fun m!1443875 () Bool)

(assert (=> d!164053 m!1443875))

(declare-fun m!1443877 () Bool)

(assert (=> bm!72249 m!1443877))

(assert (=> b!1570366 d!164053))

(declare-fun bm!72256 () Bool)

(declare-fun call!72261 () List!36800)

(declare-fun call!72259 () List!36800)

(assert (=> bm!72256 (= call!72261 call!72259)))

(declare-fun b!1570480 () Bool)

(declare-fun res!1073097 () Bool)

(declare-fun e!875552 () Bool)

(assert (=> b!1570480 (=> (not res!1073097) (not e!875552))))

(declare-fun lt!673157 () List!36800)

(assert (=> b!1570480 (= res!1073097 (containsKey!870 lt!673157 key1!37))))

(declare-fun b!1570481 () Bool)

(declare-fun e!875553 () List!36800)

(assert (=> b!1570481 (= e!875553 call!72259)))

(declare-fun bm!72257 () Bool)

(declare-fun call!72260 () List!36800)

(assert (=> bm!72257 (= call!72260 call!72261)))

(declare-fun e!875556 () List!36800)

(declare-fun b!1570482 () Bool)

(assert (=> b!1570482 (= e!875556 (insertStrictlySorted!601 (t!51703 l!750) key1!37 v1!32))))

(declare-fun d!164059 () Bool)

(assert (=> d!164059 e!875552))

(declare-fun res!1073098 () Bool)

(assert (=> d!164059 (=> (not res!1073098) (not e!875552))))

(assert (=> d!164059 (= res!1073098 (isStrictlySorted!1021 lt!673157))))

(assert (=> d!164059 (= lt!673157 e!875553)))

(declare-fun c!144942 () Bool)

(assert (=> d!164059 (= c!144942 (and (is-Cons!36796 l!750) (bvslt (_1!12735 (h!38244 l!750)) key1!37)))))

(assert (=> d!164059 (isStrictlySorted!1021 l!750)))

(assert (=> d!164059 (= (insertStrictlySorted!601 l!750 key1!37 v1!32) lt!673157)))

(declare-fun b!1570483 () Bool)

(declare-fun e!875555 () List!36800)

(assert (=> b!1570483 (= e!875555 call!72260)))

(declare-fun bm!72258 () Bool)

(assert (=> bm!72258 (= call!72259 ($colon$colon!1007 e!875556 (ite c!144942 (h!38244 l!750) (tuple2!25449 key1!37 v1!32))))))

(declare-fun c!144941 () Bool)

(assert (=> bm!72258 (= c!144941 c!144942)))

(declare-fun b!1570484 () Bool)

(declare-fun e!875554 () List!36800)

(assert (=> b!1570484 (= e!875553 e!875554)))

(declare-fun c!144939 () Bool)

(assert (=> b!1570484 (= c!144939 (and (is-Cons!36796 l!750) (= (_1!12735 (h!38244 l!750)) key1!37)))))

(declare-fun b!1570485 () Bool)

(assert (=> b!1570485 (= e!875554 call!72261)))

(declare-fun c!144940 () Bool)

(declare-fun b!1570486 () Bool)

(assert (=> b!1570486 (= e!875556 (ite c!144939 (t!51703 l!750) (ite c!144940 (Cons!36796 (h!38244 l!750) (t!51703 l!750)) Nil!36797)))))

(declare-fun b!1570487 () Bool)

(assert (=> b!1570487 (= e!875555 call!72260)))

(declare-fun b!1570488 () Bool)

(assert (=> b!1570488 (= e!875552 (contains!10387 lt!673157 (tuple2!25449 key1!37 v1!32)))))

(declare-fun b!1570489 () Bool)

(assert (=> b!1570489 (= c!144940 (and (is-Cons!36796 l!750) (bvsgt (_1!12735 (h!38244 l!750)) key1!37)))))

(assert (=> b!1570489 (= e!875554 e!875555)))

(assert (= (and d!164059 c!144942) b!1570481))

(assert (= (and d!164059 (not c!144942)) b!1570484))

(assert (= (and b!1570484 c!144939) b!1570485))

(assert (= (and b!1570484 (not c!144939)) b!1570489))

(assert (= (and b!1570489 c!144940) b!1570483))

(assert (= (and b!1570489 (not c!144940)) b!1570487))

(assert (= (or b!1570483 b!1570487) bm!72257))

(assert (= (or b!1570485 bm!72257) bm!72256))

(assert (= (or b!1570481 bm!72256) bm!72258))

(assert (= (and bm!72258 c!144941) b!1570482))

(assert (= (and bm!72258 (not c!144941)) b!1570486))

(assert (= (and d!164059 res!1073098) b!1570480))

(assert (= (and b!1570480 res!1073097) b!1570488))

(declare-fun m!1443897 () Bool)

(assert (=> b!1570488 m!1443897))

(declare-fun m!1443901 () Bool)

(assert (=> b!1570480 m!1443901))

(declare-fun m!1443905 () Bool)

(assert (=> b!1570482 m!1443905))

(declare-fun m!1443907 () Bool)

(assert (=> d!164059 m!1443907))

(assert (=> d!164059 m!1443843))

(declare-fun m!1443909 () Bool)

(assert (=> bm!72258 m!1443909))

(assert (=> b!1570366 d!164059))

(declare-fun bm!72265 () Bool)

(declare-fun call!72270 () List!36800)

(declare-fun call!72268 () List!36800)

(assert (=> bm!72265 (= call!72270 call!72268)))

(declare-fun b!1570510 () Bool)

(declare-fun res!1073103 () Bool)

(declare-fun e!875567 () Bool)

(assert (=> b!1570510 (=> (not res!1073103) (not e!875567))))

(declare-fun lt!673160 () List!36800)

(assert (=> b!1570510 (= res!1073103 (containsKey!870 lt!673160 key1!37))))

(declare-fun b!1570511 () Bool)

(declare-fun e!875568 () List!36800)

(assert (=> b!1570511 (= e!875568 call!72268)))

(declare-fun bm!72266 () Bool)

(declare-fun call!72269 () List!36800)

(assert (=> bm!72266 (= call!72269 call!72270)))

(declare-fun b!1570512 () Bool)

(declare-fun e!875571 () List!36800)

(assert (=> b!1570512 (= e!875571 (insertStrictlySorted!601 (t!51703 (insertStrictlySorted!601 l!750 key2!21 v2!10)) key1!37 v1!32))))

(declare-fun d!164065 () Bool)

(assert (=> d!164065 e!875567))

(declare-fun res!1073104 () Bool)

(assert (=> d!164065 (=> (not res!1073104) (not e!875567))))

(assert (=> d!164065 (= res!1073104 (isStrictlySorted!1021 lt!673160))))

(assert (=> d!164065 (= lt!673160 e!875568)))

(declare-fun c!144954 () Bool)

(assert (=> d!164065 (= c!144954 (and (is-Cons!36796 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (bvslt (_1!12735 (h!38244 (insertStrictlySorted!601 l!750 key2!21 v2!10))) key1!37)))))

(assert (=> d!164065 (isStrictlySorted!1021 (insertStrictlySorted!601 l!750 key2!21 v2!10))))

(assert (=> d!164065 (= (insertStrictlySorted!601 (insertStrictlySorted!601 l!750 key2!21 v2!10) key1!37 v1!32) lt!673160)))

(declare-fun b!1570513 () Bool)

(declare-fun e!875570 () List!36800)

(assert (=> b!1570513 (= e!875570 call!72269)))

(declare-fun bm!72267 () Bool)

(assert (=> bm!72267 (= call!72268 ($colon$colon!1007 e!875571 (ite c!144954 (h!38244 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (tuple2!25449 key1!37 v1!32))))))

(declare-fun c!144953 () Bool)

(assert (=> bm!72267 (= c!144953 c!144954)))

(declare-fun b!1570514 () Bool)

(declare-fun e!875569 () List!36800)

(assert (=> b!1570514 (= e!875568 e!875569)))

(declare-fun c!144951 () Bool)

(assert (=> b!1570514 (= c!144951 (and (is-Cons!36796 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (= (_1!12735 (h!38244 (insertStrictlySorted!601 l!750 key2!21 v2!10))) key1!37)))))

(declare-fun b!1570515 () Bool)

(assert (=> b!1570515 (= e!875569 call!72270)))

(declare-fun b!1570516 () Bool)

(declare-fun c!144952 () Bool)

(assert (=> b!1570516 (= e!875571 (ite c!144951 (t!51703 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (ite c!144952 (Cons!36796 (h!38244 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (t!51703 (insertStrictlySorted!601 l!750 key2!21 v2!10))) Nil!36797)))))

(declare-fun b!1570517 () Bool)

(assert (=> b!1570517 (= e!875570 call!72269)))

(declare-fun b!1570518 () Bool)

(assert (=> b!1570518 (= e!875567 (contains!10387 lt!673160 (tuple2!25449 key1!37 v1!32)))))

(declare-fun b!1570519 () Bool)

(assert (=> b!1570519 (= c!144952 (and (is-Cons!36796 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (bvsgt (_1!12735 (h!38244 (insertStrictlySorted!601 l!750 key2!21 v2!10))) key1!37)))))

(assert (=> b!1570519 (= e!875569 e!875570)))

(assert (= (and d!164065 c!144954) b!1570511))

(assert (= (and d!164065 (not c!144954)) b!1570514))

(assert (= (and b!1570514 c!144951) b!1570515))

(assert (= (and b!1570514 (not c!144951)) b!1570519))

(assert (= (and b!1570519 c!144952) b!1570513))

(assert (= (and b!1570519 (not c!144952)) b!1570517))

(assert (= (or b!1570513 b!1570517) bm!72266))

(assert (= (or b!1570515 bm!72266) bm!72265))

(assert (= (or b!1570511 bm!72265) bm!72267))

(assert (= (and bm!72267 c!144953) b!1570512))

(assert (= (and bm!72267 (not c!144953)) b!1570516))

(assert (= (and d!164065 res!1073104) b!1570510))

(assert (= (and b!1570510 res!1073103) b!1570518))

(declare-fun m!1443933 () Bool)

(assert (=> b!1570518 m!1443933))

(declare-fun m!1443935 () Bool)

(assert (=> b!1570510 m!1443935))

(declare-fun m!1443937 () Bool)

(assert (=> b!1570512 m!1443937))

(declare-fun m!1443939 () Bool)

(assert (=> d!164065 m!1443939))

(assert (=> d!164065 m!1443839))

(declare-fun m!1443941 () Bool)

(assert (=> d!164065 m!1443941))

(declare-fun m!1443943 () Bool)

(assert (=> bm!72267 m!1443943))

(assert (=> b!1570366 d!164065))

(declare-fun bm!72274 () Bool)

(declare-fun call!72279 () List!36800)

(declare-fun call!72277 () List!36800)

(assert (=> bm!72274 (= call!72279 call!72277)))

(declare-fun b!1570540 () Bool)

(declare-fun res!1073109 () Bool)

(declare-fun e!875582 () Bool)

(assert (=> b!1570540 (=> (not res!1073109) (not e!875582))))

(declare-fun lt!673163 () List!36800)

(assert (=> b!1570540 (= res!1073109 (containsKey!870 lt!673163 key2!21))))

(declare-fun b!1570541 () Bool)

(declare-fun e!875583 () List!36800)

(assert (=> b!1570541 (= e!875583 call!72277)))

(declare-fun bm!72275 () Bool)

(declare-fun call!72278 () List!36800)

(assert (=> bm!72275 (= call!72278 call!72279)))

(declare-fun e!875586 () List!36800)

(declare-fun b!1570542 () Bool)

(assert (=> b!1570542 (= e!875586 (insertStrictlySorted!601 (t!51703 l!750) key2!21 v2!10))))

(declare-fun d!164071 () Bool)

(assert (=> d!164071 e!875582))

(declare-fun res!1073110 () Bool)

(assert (=> d!164071 (=> (not res!1073110) (not e!875582))))

(assert (=> d!164071 (= res!1073110 (isStrictlySorted!1021 lt!673163))))

(assert (=> d!164071 (= lt!673163 e!875583)))

(declare-fun c!144966 () Bool)

(assert (=> d!164071 (= c!144966 (and (is-Cons!36796 l!750) (bvslt (_1!12735 (h!38244 l!750)) key2!21)))))

(assert (=> d!164071 (isStrictlySorted!1021 l!750)))

(assert (=> d!164071 (= (insertStrictlySorted!601 l!750 key2!21 v2!10) lt!673163)))

(declare-fun b!1570543 () Bool)

(declare-fun e!875585 () List!36800)

(assert (=> b!1570543 (= e!875585 call!72278)))

(declare-fun bm!72276 () Bool)

(assert (=> bm!72276 (= call!72277 ($colon$colon!1007 e!875586 (ite c!144966 (h!38244 l!750) (tuple2!25449 key2!21 v2!10))))))

(declare-fun c!144965 () Bool)

(assert (=> bm!72276 (= c!144965 c!144966)))

(declare-fun b!1570544 () Bool)

(declare-fun e!875584 () List!36800)

(assert (=> b!1570544 (= e!875583 e!875584)))

(declare-fun c!144963 () Bool)

(assert (=> b!1570544 (= c!144963 (and (is-Cons!36796 l!750) (= (_1!12735 (h!38244 l!750)) key2!21)))))

(declare-fun b!1570545 () Bool)

(assert (=> b!1570545 (= e!875584 call!72279)))

(declare-fun b!1570546 () Bool)

(declare-fun c!144964 () Bool)

(assert (=> b!1570546 (= e!875586 (ite c!144963 (t!51703 l!750) (ite c!144964 (Cons!36796 (h!38244 l!750) (t!51703 l!750)) Nil!36797)))))

(declare-fun b!1570547 () Bool)

(assert (=> b!1570547 (= e!875585 call!72278)))

(declare-fun b!1570548 () Bool)

(assert (=> b!1570548 (= e!875582 (contains!10387 lt!673163 (tuple2!25449 key2!21 v2!10)))))

(declare-fun b!1570549 () Bool)

(assert (=> b!1570549 (= c!144964 (and (is-Cons!36796 l!750) (bvsgt (_1!12735 (h!38244 l!750)) key2!21)))))

(assert (=> b!1570549 (= e!875584 e!875585)))

(assert (= (and d!164071 c!144966) b!1570541))

(assert (= (and d!164071 (not c!144966)) b!1570544))

(assert (= (and b!1570544 c!144963) b!1570545))

(assert (= (and b!1570544 (not c!144963)) b!1570549))

(assert (= (and b!1570549 c!144964) b!1570543))

(assert (= (and b!1570549 (not c!144964)) b!1570547))

(assert (= (or b!1570543 b!1570547) bm!72275))

(assert (= (or b!1570545 bm!72275) bm!72274))

(assert (= (or b!1570541 bm!72274) bm!72276))

(assert (= (and bm!72276 c!144965) b!1570542))

(assert (= (and bm!72276 (not c!144965)) b!1570546))

(assert (= (and d!164071 res!1073110) b!1570540))

(assert (= (and b!1570540 res!1073109) b!1570548))

(declare-fun m!1443963 () Bool)

(assert (=> b!1570548 m!1443963))

(declare-fun m!1443967 () Bool)

(assert (=> b!1570540 m!1443967))

(declare-fun m!1443971 () Bool)

(assert (=> b!1570542 m!1443971))

(declare-fun m!1443973 () Bool)

(assert (=> d!164071 m!1443973))

(assert (=> d!164071 m!1443843))

(declare-fun m!1443975 () Bool)

(assert (=> bm!72276 m!1443975))

(assert (=> b!1570366 d!164071))

(declare-fun d!164077 () Bool)

(declare-fun res!1073127 () Bool)

(declare-fun e!875606 () Bool)

(assert (=> d!164077 (=> res!1073127 e!875606)))

(assert (=> d!164077 (= res!1073127 (or (is-Nil!36797 l!750) (is-Nil!36797 (t!51703 l!750))))))

(assert (=> d!164077 (= (isStrictlySorted!1021 l!750) e!875606)))

(declare-fun b!1570574 () Bool)

(declare-fun e!875607 () Bool)

(assert (=> b!1570574 (= e!875606 e!875607)))

(declare-fun res!1073128 () Bool)

(assert (=> b!1570574 (=> (not res!1073128) (not e!875607))))

(assert (=> b!1570574 (= res!1073128 (bvslt (_1!12735 (h!38244 l!750)) (_1!12735 (h!38244 (t!51703 l!750)))))))

(declare-fun b!1570575 () Bool)

(assert (=> b!1570575 (= e!875607 (isStrictlySorted!1021 (t!51703 l!750)))))

(assert (= (and d!164077 (not res!1073127)) b!1570574))

(assert (= (and b!1570574 res!1073128) b!1570575))

(declare-fun m!1443989 () Bool)

(assert (=> b!1570575 m!1443989))

(assert (=> b!1570364 d!164077))

(declare-fun b!1570585 () Bool)

(declare-fun e!875613 () Bool)

(declare-fun tp!114244 () Bool)

(assert (=> b!1570585 (= e!875613 (and tp_is_empty!39105 tp!114244))))

(assert (=> b!1570367 (= tp!114235 e!875613)))

(assert (= (and b!1570367 (is-Cons!36796 (t!51703 l!750))) b!1570585))

(push 1)

(assert (not b!1570482))

(assert (not d!164065))

(assert (not b!1570510))

(assert (not b!1570575))

(assert (not b!1570480))

(assert (not d!164059))

(assert (not b!1570540))

(assert (not bm!72276))

(assert (not b!1570518))

(assert (not b!1570512))

(assert (not bm!72258))

(assert (not b!1570488))

(assert (not bm!72267))

(assert (not b!1570452))

(assert tp_is_empty!39105)

(assert (not d!164071))

(assert (not b!1570542))

(assert (not b!1570458))

(assert (not d!164053))

(assert (not b!1570548))

(assert (not b!1570450))

(assert (not b!1570585))

(assert (not bm!72249))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!72304 () Bool)

(declare-fun call!72309 () List!36800)

(declare-fun call!72307 () List!36800)

(assert (=> bm!72304 (= call!72309 call!72307)))

(declare-fun b!1570751 () Bool)

(declare-fun res!1073223 () Bool)

(declare-fun e!875737 () Bool)

(assert (=> b!1570751 (=> (not res!1073223) (not e!875737))))

(declare-fun lt!673185 () List!36800)

(assert (=> b!1570751 (= res!1073223 (containsKey!870 lt!673185 key2!21))))

(declare-fun b!1570752 () Bool)

(declare-fun e!875738 () List!36800)

(assert (=> b!1570752 (= e!875738 call!72307)))

(declare-fun bm!72305 () Bool)

(declare-fun call!72308 () List!36800)

(assert (=> bm!72305 (= call!72308 call!72309)))

(declare-fun b!1570753 () Bool)

(declare-fun e!875741 () List!36800)

(assert (=> b!1570753 (= e!875741 (insertStrictlySorted!601 (t!51703 (t!51703 l!750)) key2!21 v2!10))))

(declare-fun d!164173 () Bool)

(assert (=> d!164173 e!875737))

(declare-fun res!1073224 () Bool)

(assert (=> d!164173 (=> (not res!1073224) (not e!875737))))

(assert (=> d!164173 (= res!1073224 (isStrictlySorted!1021 lt!673185))))

(assert (=> d!164173 (= lt!673185 e!875738)))

(declare-fun c!145006 () Bool)

(assert (=> d!164173 (= c!145006 (and (is-Cons!36796 (t!51703 l!750)) (bvslt (_1!12735 (h!38244 (t!51703 l!750))) key2!21)))))

(assert (=> d!164173 (isStrictlySorted!1021 (t!51703 l!750))))

(assert (=> d!164173 (= (insertStrictlySorted!601 (t!51703 l!750) key2!21 v2!10) lt!673185)))

(declare-fun b!1570754 () Bool)

(declare-fun e!875740 () List!36800)

(assert (=> b!1570754 (= e!875740 call!72308)))

(declare-fun bm!72306 () Bool)

(assert (=> bm!72306 (= call!72307 ($colon$colon!1007 e!875741 (ite c!145006 (h!38244 (t!51703 l!750)) (tuple2!25449 key2!21 v2!10))))))

(declare-fun c!145005 () Bool)

(assert (=> bm!72306 (= c!145005 c!145006)))

(declare-fun b!1570755 () Bool)

(declare-fun e!875739 () List!36800)

(assert (=> b!1570755 (= e!875738 e!875739)))

(declare-fun c!145003 () Bool)

(assert (=> b!1570755 (= c!145003 (and (is-Cons!36796 (t!51703 l!750)) (= (_1!12735 (h!38244 (t!51703 l!750))) key2!21)))))

(declare-fun b!1570756 () Bool)

(assert (=> b!1570756 (= e!875739 call!72309)))

(declare-fun b!1570757 () Bool)

(declare-fun c!145004 () Bool)

(assert (=> b!1570757 (= e!875741 (ite c!145003 (t!51703 (t!51703 l!750)) (ite c!145004 (Cons!36796 (h!38244 (t!51703 l!750)) (t!51703 (t!51703 l!750))) Nil!36797)))))

(declare-fun b!1570758 () Bool)

(assert (=> b!1570758 (= e!875740 call!72308)))

(declare-fun b!1570759 () Bool)

(assert (=> b!1570759 (= e!875737 (contains!10387 lt!673185 (tuple2!25449 key2!21 v2!10)))))

(declare-fun b!1570760 () Bool)

(assert (=> b!1570760 (= c!145004 (and (is-Cons!36796 (t!51703 l!750)) (bvsgt (_1!12735 (h!38244 (t!51703 l!750))) key2!21)))))

(assert (=> b!1570760 (= e!875739 e!875740)))

(assert (= (and d!164173 c!145006) b!1570752))

(assert (= (and d!164173 (not c!145006)) b!1570755))

(assert (= (and b!1570755 c!145003) b!1570756))

(assert (= (and b!1570755 (not c!145003)) b!1570760))

(assert (= (and b!1570760 c!145004) b!1570754))

(assert (= (and b!1570760 (not c!145004)) b!1570758))

(assert (= (or b!1570754 b!1570758) bm!72305))

(assert (= (or b!1570756 bm!72305) bm!72304))

(assert (= (or b!1570752 bm!72304) bm!72306))

(assert (= (and bm!72306 c!145005) b!1570753))

(assert (= (and bm!72306 (not c!145005)) b!1570757))

(assert (= (and d!164173 res!1073224) b!1570751))

(assert (= (and b!1570751 res!1073223) b!1570759))

(declare-fun m!1444165 () Bool)

(assert (=> b!1570759 m!1444165))

(declare-fun m!1444167 () Bool)

(assert (=> b!1570751 m!1444167))

(declare-fun m!1444169 () Bool)

(assert (=> b!1570753 m!1444169))

(declare-fun m!1444171 () Bool)

(assert (=> d!164173 m!1444171))

(assert (=> d!164173 m!1443989))

(declare-fun m!1444173 () Bool)

(assert (=> bm!72306 m!1444173))

(assert (=> b!1570542 d!164173))

(declare-fun bm!72307 () Bool)

(declare-fun call!72312 () List!36800)

(declare-fun call!72310 () List!36800)

(assert (=> bm!72307 (= call!72312 call!72310)))

(declare-fun b!1570761 () Bool)

(declare-fun res!1073225 () Bool)

(declare-fun e!875742 () Bool)

(assert (=> b!1570761 (=> (not res!1073225) (not e!875742))))

(declare-fun lt!673186 () List!36800)

(assert (=> b!1570761 (= res!1073225 (containsKey!870 lt!673186 key1!37))))

(declare-fun b!1570762 () Bool)

(declare-fun e!875743 () List!36800)

(assert (=> b!1570762 (= e!875743 call!72310)))

(declare-fun bm!72308 () Bool)

(declare-fun call!72311 () List!36800)

(assert (=> bm!72308 (= call!72311 call!72312)))

(declare-fun b!1570763 () Bool)

(declare-fun e!875746 () List!36800)

(assert (=> b!1570763 (= e!875746 (insertStrictlySorted!601 (t!51703 (t!51703 l!750)) key1!37 v1!32))))

(declare-fun d!164175 () Bool)

(assert (=> d!164175 e!875742))

(declare-fun res!1073226 () Bool)

(assert (=> d!164175 (=> (not res!1073226) (not e!875742))))

(assert (=> d!164175 (= res!1073226 (isStrictlySorted!1021 lt!673186))))

(assert (=> d!164175 (= lt!673186 e!875743)))

(declare-fun c!145010 () Bool)

(assert (=> d!164175 (= c!145010 (and (is-Cons!36796 (t!51703 l!750)) (bvslt (_1!12735 (h!38244 (t!51703 l!750))) key1!37)))))

(assert (=> d!164175 (isStrictlySorted!1021 (t!51703 l!750))))

(assert (=> d!164175 (= (insertStrictlySorted!601 (t!51703 l!750) key1!37 v1!32) lt!673186)))

(declare-fun b!1570764 () Bool)

(declare-fun e!875745 () List!36800)

(assert (=> b!1570764 (= e!875745 call!72311)))

(declare-fun bm!72309 () Bool)

(assert (=> bm!72309 (= call!72310 ($colon$colon!1007 e!875746 (ite c!145010 (h!38244 (t!51703 l!750)) (tuple2!25449 key1!37 v1!32))))))

(declare-fun c!145009 () Bool)

(assert (=> bm!72309 (= c!145009 c!145010)))

(declare-fun b!1570765 () Bool)

(declare-fun e!875744 () List!36800)

(assert (=> b!1570765 (= e!875743 e!875744)))

(declare-fun c!145007 () Bool)

(assert (=> b!1570765 (= c!145007 (and (is-Cons!36796 (t!51703 l!750)) (= (_1!12735 (h!38244 (t!51703 l!750))) key1!37)))))

(declare-fun b!1570766 () Bool)

(assert (=> b!1570766 (= e!875744 call!72312)))

(declare-fun c!145008 () Bool)

(declare-fun b!1570767 () Bool)

(assert (=> b!1570767 (= e!875746 (ite c!145007 (t!51703 (t!51703 l!750)) (ite c!145008 (Cons!36796 (h!38244 (t!51703 l!750)) (t!51703 (t!51703 l!750))) Nil!36797)))))

(declare-fun b!1570768 () Bool)

(assert (=> b!1570768 (= e!875745 call!72311)))

(declare-fun b!1570769 () Bool)

(assert (=> b!1570769 (= e!875742 (contains!10387 lt!673186 (tuple2!25449 key1!37 v1!32)))))

(declare-fun b!1570770 () Bool)

(assert (=> b!1570770 (= c!145008 (and (is-Cons!36796 (t!51703 l!750)) (bvsgt (_1!12735 (h!38244 (t!51703 l!750))) key1!37)))))

(assert (=> b!1570770 (= e!875744 e!875745)))

(assert (= (and d!164175 c!145010) b!1570762))

(assert (= (and d!164175 (not c!145010)) b!1570765))

(assert (= (and b!1570765 c!145007) b!1570766))

(assert (= (and b!1570765 (not c!145007)) b!1570770))

(assert (= (and b!1570770 c!145008) b!1570764))

(assert (= (and b!1570770 (not c!145008)) b!1570768))

(assert (= (or b!1570764 b!1570768) bm!72308))

(assert (= (or b!1570766 bm!72308) bm!72307))

(assert (= (or b!1570762 bm!72307) bm!72309))

(assert (= (and bm!72309 c!145009) b!1570763))

(assert (= (and bm!72309 (not c!145009)) b!1570767))

(assert (= (and d!164175 res!1073226) b!1570761))

(assert (= (and b!1570761 res!1073225) b!1570769))

(declare-fun m!1444175 () Bool)

(assert (=> b!1570769 m!1444175))

(declare-fun m!1444177 () Bool)

(assert (=> b!1570761 m!1444177))

(declare-fun m!1444179 () Bool)

(assert (=> b!1570763 m!1444179))

(declare-fun m!1444181 () Bool)

(assert (=> d!164175 m!1444181))

(assert (=> d!164175 m!1443989))

(declare-fun m!1444183 () Bool)

(assert (=> bm!72309 m!1444183))

(assert (=> b!1570482 d!164175))

(declare-fun d!164177 () Bool)

(assert (=> d!164177 (= ($colon$colon!1007 e!875556 (ite c!144942 (h!38244 l!750) (tuple2!25449 key1!37 v1!32))) (Cons!36796 (ite c!144942 (h!38244 l!750) (tuple2!25449 key1!37 v1!32)) e!875556))))

(assert (=> bm!72258 d!164177))

(declare-fun d!164179 () Bool)

(declare-fun res!1073227 () Bool)

(declare-fun e!875747 () Bool)

(assert (=> d!164179 (=> res!1073227 e!875747)))

(assert (=> d!164179 (= res!1073227 (or (is-Nil!36797 lt!673163) (is-Nil!36797 (t!51703 lt!673163))))))

(assert (=> d!164179 (= (isStrictlySorted!1021 lt!673163) e!875747)))

(declare-fun b!1570771 () Bool)

(declare-fun e!875748 () Bool)

(assert (=> b!1570771 (= e!875747 e!875748)))

(declare-fun res!1073228 () Bool)

(assert (=> b!1570771 (=> (not res!1073228) (not e!875748))))

(assert (=> b!1570771 (= res!1073228 (bvslt (_1!12735 (h!38244 lt!673163)) (_1!12735 (h!38244 (t!51703 lt!673163)))))))

(declare-fun b!1570772 () Bool)

(assert (=> b!1570772 (= e!875748 (isStrictlySorted!1021 (t!51703 lt!673163)))))

(assert (= (and d!164179 (not res!1073227)) b!1570771))

(assert (= (and b!1570771 res!1073228) b!1570772))

(declare-fun m!1444185 () Bool)

(assert (=> b!1570772 m!1444185))

(assert (=> d!164071 d!164179))

(assert (=> d!164071 d!164077))

(declare-fun d!164181 () Bool)

(declare-fun lt!673189 () Bool)

(declare-fun content!811 (List!36800) (Set tuple2!25448))

(assert (=> d!164181 (= lt!673189 (member (tuple2!25449 key2!21 v2!10) (content!811 lt!673154)))))

(declare-fun e!875753 () Bool)

(assert (=> d!164181 (= lt!673189 e!875753)))

(declare-fun res!1073234 () Bool)

(assert (=> d!164181 (=> (not res!1073234) (not e!875753))))

(assert (=> d!164181 (= res!1073234 (is-Cons!36796 lt!673154))))

(assert (=> d!164181 (= (contains!10387 lt!673154 (tuple2!25449 key2!21 v2!10)) lt!673189)))

(declare-fun b!1570777 () Bool)

(declare-fun e!875754 () Bool)

(assert (=> b!1570777 (= e!875753 e!875754)))

(declare-fun res!1073233 () Bool)

(assert (=> b!1570777 (=> res!1073233 e!875754)))

(assert (=> b!1570777 (= res!1073233 (= (h!38244 lt!673154) (tuple2!25449 key2!21 v2!10)))))

(declare-fun b!1570778 () Bool)

(assert (=> b!1570778 (= e!875754 (contains!10387 (t!51703 lt!673154) (tuple2!25449 key2!21 v2!10)))))

(assert (= (and d!164181 res!1073234) b!1570777))

(assert (= (and b!1570777 (not res!1073233)) b!1570778))

(declare-fun m!1444187 () Bool)

(assert (=> d!164181 m!1444187))

(declare-fun m!1444189 () Bool)

(assert (=> d!164181 m!1444189))

(declare-fun m!1444191 () Bool)

(assert (=> b!1570778 m!1444191))

(assert (=> b!1570458 d!164181))

(declare-fun d!164183 () Bool)

(declare-fun res!1073239 () Bool)

(declare-fun e!875759 () Bool)

(assert (=> d!164183 (=> res!1073239 e!875759)))

(assert (=> d!164183 (= res!1073239 (and (is-Cons!36796 lt!673160) (= (_1!12735 (h!38244 lt!673160)) key1!37)))))

(assert (=> d!164183 (= (containsKey!870 lt!673160 key1!37) e!875759)))

(declare-fun b!1570783 () Bool)

(declare-fun e!875760 () Bool)

(assert (=> b!1570783 (= e!875759 e!875760)))

(declare-fun res!1073240 () Bool)

(assert (=> b!1570783 (=> (not res!1073240) (not e!875760))))

(assert (=> b!1570783 (= res!1073240 (and (or (not (is-Cons!36796 lt!673160)) (bvsle (_1!12735 (h!38244 lt!673160)) key1!37)) (is-Cons!36796 lt!673160) (bvslt (_1!12735 (h!38244 lt!673160)) key1!37)))))

(declare-fun b!1570784 () Bool)

(assert (=> b!1570784 (= e!875760 (containsKey!870 (t!51703 lt!673160) key1!37))))

(assert (= (and d!164183 (not res!1073239)) b!1570783))

(assert (= (and b!1570783 res!1073240) b!1570784))

(declare-fun m!1444193 () Bool)

(assert (=> b!1570784 m!1444193))

(assert (=> b!1570510 d!164183))

(declare-fun d!164185 () Bool)

(declare-fun res!1073241 () Bool)

(declare-fun e!875761 () Bool)

(assert (=> d!164185 (=> res!1073241 e!875761)))

(assert (=> d!164185 (= res!1073241 (or (is-Nil!36797 lt!673157) (is-Nil!36797 (t!51703 lt!673157))))))

(assert (=> d!164185 (= (isStrictlySorted!1021 lt!673157) e!875761)))

(declare-fun b!1570785 () Bool)

(declare-fun e!875762 () Bool)

(assert (=> b!1570785 (= e!875761 e!875762)))

(declare-fun res!1073242 () Bool)

(assert (=> b!1570785 (=> (not res!1073242) (not e!875762))))

(assert (=> b!1570785 (= res!1073242 (bvslt (_1!12735 (h!38244 lt!673157)) (_1!12735 (h!38244 (t!51703 lt!673157)))))))

(declare-fun b!1570786 () Bool)

(assert (=> b!1570786 (= e!875762 (isStrictlySorted!1021 (t!51703 lt!673157)))))

(assert (= (and d!164185 (not res!1073241)) b!1570785))

(assert (= (and b!1570785 res!1073242) b!1570786))

(declare-fun m!1444195 () Bool)

(assert (=> b!1570786 m!1444195))

(assert (=> d!164059 d!164185))

(assert (=> d!164059 d!164077))

(declare-fun lt!673190 () Bool)

(declare-fun d!164187 () Bool)

(assert (=> d!164187 (= lt!673190 (member (tuple2!25449 key1!37 v1!32) (content!811 lt!673160)))))

(declare-fun e!875763 () Bool)

(assert (=> d!164187 (= lt!673190 e!875763)))

(declare-fun res!1073244 () Bool)

(assert (=> d!164187 (=> (not res!1073244) (not e!875763))))

(assert (=> d!164187 (= res!1073244 (is-Cons!36796 lt!673160))))

(assert (=> d!164187 (= (contains!10387 lt!673160 (tuple2!25449 key1!37 v1!32)) lt!673190)))

(declare-fun b!1570787 () Bool)

(declare-fun e!875764 () Bool)

(assert (=> b!1570787 (= e!875763 e!875764)))

(declare-fun res!1073243 () Bool)

(assert (=> b!1570787 (=> res!1073243 e!875764)))

(assert (=> b!1570787 (= res!1073243 (= (h!38244 lt!673160) (tuple2!25449 key1!37 v1!32)))))

(declare-fun b!1570788 () Bool)

(assert (=> b!1570788 (= e!875764 (contains!10387 (t!51703 lt!673160) (tuple2!25449 key1!37 v1!32)))))

(assert (= (and d!164187 res!1073244) b!1570787))

(assert (= (and b!1570787 (not res!1073243)) b!1570788))

(declare-fun m!1444197 () Bool)

(assert (=> d!164187 m!1444197))

(declare-fun m!1444199 () Bool)

(assert (=> d!164187 m!1444199))

(declare-fun m!1444201 () Bool)

(assert (=> b!1570788 m!1444201))

(assert (=> b!1570518 d!164187))

(declare-fun d!164189 () Bool)

(declare-fun res!1073245 () Bool)

(declare-fun e!875765 () Bool)

(assert (=> d!164189 (=> res!1073245 e!875765)))

(assert (=> d!164189 (= res!1073245 (and (is-Cons!36796 lt!673163) (= (_1!12735 (h!38244 lt!673163)) key2!21)))))

(assert (=> d!164189 (= (containsKey!870 lt!673163 key2!21) e!875765)))

(declare-fun b!1570789 () Bool)

(declare-fun e!875766 () Bool)

(assert (=> b!1570789 (= e!875765 e!875766)))

(declare-fun res!1073246 () Bool)

(assert (=> b!1570789 (=> (not res!1073246) (not e!875766))))

(assert (=> b!1570789 (= res!1073246 (and (or (not (is-Cons!36796 lt!673163)) (bvsle (_1!12735 (h!38244 lt!673163)) key2!21)) (is-Cons!36796 lt!673163) (bvslt (_1!12735 (h!38244 lt!673163)) key2!21)))))

(declare-fun b!1570790 () Bool)

(assert (=> b!1570790 (= e!875766 (containsKey!870 (t!51703 lt!673163) key2!21))))

(assert (= (and d!164189 (not res!1073245)) b!1570789))

(assert (= (and b!1570789 res!1073246) b!1570790))

(declare-fun m!1444203 () Bool)

(assert (=> b!1570790 m!1444203))

(assert (=> b!1570540 d!164189))

(declare-fun d!164191 () Bool)

(declare-fun res!1073247 () Bool)

(declare-fun e!875767 () Bool)

(assert (=> d!164191 (=> res!1073247 e!875767)))

(assert (=> d!164191 (= res!1073247 (and (is-Cons!36796 lt!673157) (= (_1!12735 (h!38244 lt!673157)) key1!37)))))

(assert (=> d!164191 (= (containsKey!870 lt!673157 key1!37) e!875767)))

(declare-fun b!1570791 () Bool)

(declare-fun e!875768 () Bool)

(assert (=> b!1570791 (= e!875767 e!875768)))

(declare-fun res!1073248 () Bool)

(assert (=> b!1570791 (=> (not res!1073248) (not e!875768))))

(assert (=> b!1570791 (= res!1073248 (and (or (not (is-Cons!36796 lt!673157)) (bvsle (_1!12735 (h!38244 lt!673157)) key1!37)) (is-Cons!36796 lt!673157) (bvslt (_1!12735 (h!38244 lt!673157)) key1!37)))))

(declare-fun b!1570792 () Bool)

(assert (=> b!1570792 (= e!875768 (containsKey!870 (t!51703 lt!673157) key1!37))))

(assert (= (and d!164191 (not res!1073247)) b!1570791))

(assert (= (and b!1570791 res!1073248) b!1570792))

(declare-fun m!1444205 () Bool)

(assert (=> b!1570792 m!1444205))

(assert (=> b!1570480 d!164191))

(declare-fun lt!673191 () Bool)

(declare-fun d!164193 () Bool)

(assert (=> d!164193 (= lt!673191 (member (tuple2!25449 key2!21 v2!10) (content!811 lt!673163)))))

(declare-fun e!875769 () Bool)

(assert (=> d!164193 (= lt!673191 e!875769)))

(declare-fun res!1073250 () Bool)

(assert (=> d!164193 (=> (not res!1073250) (not e!875769))))

(assert (=> d!164193 (= res!1073250 (is-Cons!36796 lt!673163))))

(assert (=> d!164193 (= (contains!10387 lt!673163 (tuple2!25449 key2!21 v2!10)) lt!673191)))

(declare-fun b!1570793 () Bool)

(declare-fun e!875770 () Bool)

(assert (=> b!1570793 (= e!875769 e!875770)))

(declare-fun res!1073249 () Bool)

(assert (=> b!1570793 (=> res!1073249 e!875770)))

(assert (=> b!1570793 (= res!1073249 (= (h!38244 lt!673163) (tuple2!25449 key2!21 v2!10)))))

(declare-fun b!1570794 () Bool)

(assert (=> b!1570794 (= e!875770 (contains!10387 (t!51703 lt!673163) (tuple2!25449 key2!21 v2!10)))))

(assert (= (and d!164193 res!1073250) b!1570793))

(assert (= (and b!1570793 (not res!1073249)) b!1570794))

(declare-fun m!1444207 () Bool)

(assert (=> d!164193 m!1444207))

(declare-fun m!1444209 () Bool)

(assert (=> d!164193 m!1444209))

(declare-fun m!1444211 () Bool)

(assert (=> b!1570794 m!1444211))

(assert (=> b!1570548 d!164193))

(declare-fun d!164195 () Bool)

(declare-fun res!1073251 () Bool)

(declare-fun e!875771 () Bool)

(assert (=> d!164195 (=> res!1073251 e!875771)))

(assert (=> d!164195 (= res!1073251 (or (is-Nil!36797 lt!673160) (is-Nil!36797 (t!51703 lt!673160))))))

(assert (=> d!164195 (= (isStrictlySorted!1021 lt!673160) e!875771)))

(declare-fun b!1570795 () Bool)

(declare-fun e!875772 () Bool)

(assert (=> b!1570795 (= e!875771 e!875772)))

(declare-fun res!1073252 () Bool)

(assert (=> b!1570795 (=> (not res!1073252) (not e!875772))))

(assert (=> b!1570795 (= res!1073252 (bvslt (_1!12735 (h!38244 lt!673160)) (_1!12735 (h!38244 (t!51703 lt!673160)))))))

(declare-fun b!1570796 () Bool)

(assert (=> b!1570796 (= e!875772 (isStrictlySorted!1021 (t!51703 lt!673160)))))

(assert (= (and d!164195 (not res!1073251)) b!1570795))

(assert (= (and b!1570795 res!1073252) b!1570796))

(declare-fun m!1444213 () Bool)

(assert (=> b!1570796 m!1444213))

(assert (=> d!164065 d!164195))

(declare-fun d!164197 () Bool)

(declare-fun res!1073253 () Bool)

(declare-fun e!875773 () Bool)

(assert (=> d!164197 (=> res!1073253 e!875773)))

(assert (=> d!164197 (= res!1073253 (or (is-Nil!36797 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (is-Nil!36797 (t!51703 (insertStrictlySorted!601 l!750 key2!21 v2!10)))))))

(assert (=> d!164197 (= (isStrictlySorted!1021 (insertStrictlySorted!601 l!750 key2!21 v2!10)) e!875773)))

(declare-fun b!1570797 () Bool)

(declare-fun e!875774 () Bool)

(assert (=> b!1570797 (= e!875773 e!875774)))

(declare-fun res!1073254 () Bool)

(assert (=> b!1570797 (=> (not res!1073254) (not e!875774))))

(assert (=> b!1570797 (= res!1073254 (bvslt (_1!12735 (h!38244 (insertStrictlySorted!601 l!750 key2!21 v2!10))) (_1!12735 (h!38244 (t!51703 (insertStrictlySorted!601 l!750 key2!21 v2!10))))))))

(declare-fun b!1570798 () Bool)

(assert (=> b!1570798 (= e!875774 (isStrictlySorted!1021 (t!51703 (insertStrictlySorted!601 l!750 key2!21 v2!10))))))

(assert (= (and d!164197 (not res!1073253)) b!1570797))

(assert (= (and b!1570797 res!1073254) b!1570798))

(declare-fun m!1444215 () Bool)

(assert (=> b!1570798 m!1444215))

(assert (=> d!164065 d!164197))

(declare-fun d!164199 () Bool)

(declare-fun res!1073255 () Bool)

(declare-fun e!875775 () Bool)

(assert (=> d!164199 (=> res!1073255 e!875775)))

(assert (=> d!164199 (= res!1073255 (or (is-Nil!36797 lt!673154) (is-Nil!36797 (t!51703 lt!673154))))))

(assert (=> d!164199 (= (isStrictlySorted!1021 lt!673154) e!875775)))

(declare-fun b!1570799 () Bool)

(declare-fun e!875776 () Bool)

(assert (=> b!1570799 (= e!875775 e!875776)))

(declare-fun res!1073256 () Bool)

(assert (=> b!1570799 (=> (not res!1073256) (not e!875776))))

(assert (=> b!1570799 (= res!1073256 (bvslt (_1!12735 (h!38244 lt!673154)) (_1!12735 (h!38244 (t!51703 lt!673154)))))))

(declare-fun b!1570800 () Bool)

(assert (=> b!1570800 (= e!875776 (isStrictlySorted!1021 (t!51703 lt!673154)))))

(assert (= (and d!164199 (not res!1073255)) b!1570799))

(assert (= (and b!1570799 res!1073256) b!1570800))

(declare-fun m!1444217 () Bool)

(assert (=> b!1570800 m!1444217))

(assert (=> d!164053 d!164199))

(declare-fun d!164201 () Bool)

(declare-fun res!1073257 () Bool)

(declare-fun e!875777 () Bool)

(assert (=> d!164201 (=> res!1073257 e!875777)))

(assert (=> d!164201 (= res!1073257 (or (is-Nil!36797 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (is-Nil!36797 (t!51703 (insertStrictlySorted!601 l!750 key1!37 v1!32)))))))

(assert (=> d!164201 (= (isStrictlySorted!1021 (insertStrictlySorted!601 l!750 key1!37 v1!32)) e!875777)))

(declare-fun b!1570801 () Bool)

(declare-fun e!875778 () Bool)

(assert (=> b!1570801 (= e!875777 e!875778)))

(declare-fun res!1073258 () Bool)

(assert (=> b!1570801 (=> (not res!1073258) (not e!875778))))

(assert (=> b!1570801 (= res!1073258 (bvslt (_1!12735 (h!38244 (insertStrictlySorted!601 l!750 key1!37 v1!32))) (_1!12735 (h!38244 (t!51703 (insertStrictlySorted!601 l!750 key1!37 v1!32))))))))

(declare-fun b!1570802 () Bool)

(assert (=> b!1570802 (= e!875778 (isStrictlySorted!1021 (t!51703 (insertStrictlySorted!601 l!750 key1!37 v1!32))))))

(assert (= (and d!164201 (not res!1073257)) b!1570801))

(assert (= (and b!1570801 res!1073258) b!1570802))

(declare-fun m!1444219 () Bool)

(assert (=> b!1570802 m!1444219))

(assert (=> d!164053 d!164201))

(declare-fun bm!72310 () Bool)

(declare-fun call!72315 () List!36800)

(declare-fun call!72313 () List!36800)

(assert (=> bm!72310 (= call!72315 call!72313)))

(declare-fun b!1570803 () Bool)

(declare-fun res!1073259 () Bool)

(declare-fun e!875779 () Bool)

(assert (=> b!1570803 (=> (not res!1073259) (not e!875779))))

(declare-fun lt!673192 () List!36800)

(assert (=> b!1570803 (= res!1073259 (containsKey!870 lt!673192 key2!21))))

(declare-fun b!1570804 () Bool)

(declare-fun e!875780 () List!36800)

(assert (=> b!1570804 (= e!875780 call!72313)))

(declare-fun bm!72311 () Bool)

(declare-fun call!72314 () List!36800)

(assert (=> bm!72311 (= call!72314 call!72315)))

(declare-fun e!875783 () List!36800)

(declare-fun b!1570805 () Bool)

(assert (=> b!1570805 (= e!875783 (insertStrictlySorted!601 (t!51703 (t!51703 (insertStrictlySorted!601 l!750 key1!37 v1!32))) key2!21 v2!10))))

(declare-fun d!164203 () Bool)

(assert (=> d!164203 e!875779))

(declare-fun res!1073260 () Bool)

(assert (=> d!164203 (=> (not res!1073260) (not e!875779))))

(assert (=> d!164203 (= res!1073260 (isStrictlySorted!1021 lt!673192))))

(assert (=> d!164203 (= lt!673192 e!875780)))

(declare-fun c!145014 () Bool)

(assert (=> d!164203 (= c!145014 (and (is-Cons!36796 (t!51703 (insertStrictlySorted!601 l!750 key1!37 v1!32))) (bvslt (_1!12735 (h!38244 (t!51703 (insertStrictlySorted!601 l!750 key1!37 v1!32)))) key2!21)))))

(assert (=> d!164203 (isStrictlySorted!1021 (t!51703 (insertStrictlySorted!601 l!750 key1!37 v1!32)))))

(assert (=> d!164203 (= (insertStrictlySorted!601 (t!51703 (insertStrictlySorted!601 l!750 key1!37 v1!32)) key2!21 v2!10) lt!673192)))

(declare-fun b!1570806 () Bool)

(declare-fun e!875782 () List!36800)

(assert (=> b!1570806 (= e!875782 call!72314)))

(declare-fun bm!72312 () Bool)

(assert (=> bm!72312 (= call!72313 ($colon$colon!1007 e!875783 (ite c!145014 (h!38244 (t!51703 (insertStrictlySorted!601 l!750 key1!37 v1!32))) (tuple2!25449 key2!21 v2!10))))))

(declare-fun c!145013 () Bool)

(assert (=> bm!72312 (= c!145013 c!145014)))

(declare-fun b!1570807 () Bool)

(declare-fun e!875781 () List!36800)

(assert (=> b!1570807 (= e!875780 e!875781)))

(declare-fun c!145011 () Bool)

(assert (=> b!1570807 (= c!145011 (and (is-Cons!36796 (t!51703 (insertStrictlySorted!601 l!750 key1!37 v1!32))) (= (_1!12735 (h!38244 (t!51703 (insertStrictlySorted!601 l!750 key1!37 v1!32)))) key2!21)))))

(declare-fun b!1570808 () Bool)

(assert (=> b!1570808 (= e!875781 call!72315)))

(declare-fun b!1570809 () Bool)

(declare-fun c!145012 () Bool)

(assert (=> b!1570809 (= e!875783 (ite c!145011 (t!51703 (t!51703 (insertStrictlySorted!601 l!750 key1!37 v1!32))) (ite c!145012 (Cons!36796 (h!38244 (t!51703 (insertStrictlySorted!601 l!750 key1!37 v1!32))) (t!51703 (t!51703 (insertStrictlySorted!601 l!750 key1!37 v1!32)))) Nil!36797)))))

(declare-fun b!1570810 () Bool)

(assert (=> b!1570810 (= e!875782 call!72314)))

(declare-fun b!1570811 () Bool)

(assert (=> b!1570811 (= e!875779 (contains!10387 lt!673192 (tuple2!25449 key2!21 v2!10)))))

(declare-fun b!1570812 () Bool)

(assert (=> b!1570812 (= c!145012 (and (is-Cons!36796 (t!51703 (insertStrictlySorted!601 l!750 key1!37 v1!32))) (bvsgt (_1!12735 (h!38244 (t!51703 (insertStrictlySorted!601 l!750 key1!37 v1!32)))) key2!21)))))

(assert (=> b!1570812 (= e!875781 e!875782)))

(assert (= (and d!164203 c!145014) b!1570804))

(assert (= (and d!164203 (not c!145014)) b!1570807))

(assert (= (and b!1570807 c!145011) b!1570808))

(assert (= (and b!1570807 (not c!145011)) b!1570812))

(assert (= (and b!1570812 c!145012) b!1570806))

(assert (= (and b!1570812 (not c!145012)) b!1570810))

(assert (= (or b!1570806 b!1570810) bm!72311))

(assert (= (or b!1570808 bm!72311) bm!72310))

(assert (= (or b!1570804 bm!72310) bm!72312))

(assert (= (and bm!72312 c!145013) b!1570805))

(assert (= (and bm!72312 (not c!145013)) b!1570809))

(assert (= (and d!164203 res!1073260) b!1570803))

(assert (= (and b!1570803 res!1073259) b!1570811))

(declare-fun m!1444221 () Bool)

(assert (=> b!1570811 m!1444221))

(declare-fun m!1444223 () Bool)

(assert (=> b!1570803 m!1444223))

(declare-fun m!1444225 () Bool)

(assert (=> b!1570805 m!1444225))

(declare-fun m!1444227 () Bool)

(assert (=> d!164203 m!1444227))

(assert (=> d!164203 m!1444219))

(declare-fun m!1444229 () Bool)

(assert (=> bm!72312 m!1444229))

(assert (=> b!1570452 d!164203))

(declare-fun d!164205 () Bool)

(assert (=> d!164205 (= ($colon$colon!1007 e!875541 (ite c!144930 (h!38244 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (tuple2!25449 key2!21 v2!10))) (Cons!36796 (ite c!144930 (h!38244 (insertStrictlySorted!601 l!750 key1!37 v1!32)) (tuple2!25449 key2!21 v2!10)) e!875541))))

(assert (=> bm!72249 d!164205))

(declare-fun d!164207 () Bool)

(declare-fun lt!673193 () Bool)

(assert (=> d!164207 (= lt!673193 (member (tuple2!25449 key1!37 v1!32) (content!811 lt!673157)))))

(declare-fun e!875784 () Bool)

(assert (=> d!164207 (= lt!673193 e!875784)))

(declare-fun res!1073262 () Bool)

(assert (=> d!164207 (=> (not res!1073262) (not e!875784))))

(assert (=> d!164207 (= res!1073262 (is-Cons!36796 lt!673157))))

(assert (=> d!164207 (= (contains!10387 lt!673157 (tuple2!25449 key1!37 v1!32)) lt!673193)))

(declare-fun b!1570813 () Bool)

(declare-fun e!875785 () Bool)

(assert (=> b!1570813 (= e!875784 e!875785)))

(declare-fun res!1073261 () Bool)

(assert (=> b!1570813 (=> res!1073261 e!875785)))

(assert (=> b!1570813 (= res!1073261 (= (h!38244 lt!673157) (tuple2!25449 key1!37 v1!32)))))

(declare-fun b!1570814 () Bool)

(assert (=> b!1570814 (= e!875785 (contains!10387 (t!51703 lt!673157) (tuple2!25449 key1!37 v1!32)))))

(assert (= (and d!164207 res!1073262) b!1570813))

(assert (= (and b!1570813 (not res!1073261)) b!1570814))

(declare-fun m!1444231 () Bool)

(assert (=> d!164207 m!1444231))

(declare-fun m!1444233 () Bool)

(assert (=> d!164207 m!1444233))

(declare-fun m!1444235 () Bool)

(assert (=> b!1570814 m!1444235))

(assert (=> b!1570488 d!164207))

(declare-fun d!164209 () Bool)

(declare-fun res!1073263 () Bool)

(declare-fun e!875786 () Bool)

(assert (=> d!164209 (=> res!1073263 e!875786)))

(assert (=> d!164209 (= res!1073263 (or (is-Nil!36797 (t!51703 l!750)) (is-Nil!36797 (t!51703 (t!51703 l!750)))))))

(assert (=> d!164209 (= (isStrictlySorted!1021 (t!51703 l!750)) e!875786)))

(declare-fun b!1570815 () Bool)

(declare-fun e!875787 () Bool)

(assert (=> b!1570815 (= e!875786 e!875787)))

(declare-fun res!1073264 () Bool)

(assert (=> b!1570815 (=> (not res!1073264) (not e!875787))))

(assert (=> b!1570815 (= res!1073264 (bvslt (_1!12735 (h!38244 (t!51703 l!750))) (_1!12735 (h!38244 (t!51703 (t!51703 l!750))))))))

(declare-fun b!1570816 () Bool)

(assert (=> b!1570816 (= e!875787 (isStrictlySorted!1021 (t!51703 (t!51703 l!750))))))

(assert (= (and d!164209 (not res!1073263)) b!1570815))

(assert (= (and b!1570815 res!1073264) b!1570816))

(declare-fun m!1444237 () Bool)

(assert (=> b!1570816 m!1444237))

(assert (=> b!1570575 d!164209))

(declare-fun d!164211 () Bool)

(assert (=> d!164211 (= ($colon$colon!1007 e!875571 (ite c!144954 (h!38244 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (tuple2!25449 key1!37 v1!32))) (Cons!36796 (ite c!144954 (h!38244 (insertStrictlySorted!601 l!750 key2!21 v2!10)) (tuple2!25449 key1!37 v1!32)) e!875571))))

(assert (=> bm!72267 d!164211))

(declare-fun d!164213 () Bool)

(assert (=> d!164213 (= ($colon$colon!1007 e!875586 (ite c!144966 (h!38244 l!750) (tuple2!25449 key2!21 v2!10))) (Cons!36796 (ite c!144966 (h!38244 l!750) (tuple2!25449 key2!21 v2!10)) e!875586))))

(assert (=> bm!72276 d!164213))

(declare-fun d!164215 () Bool)

(declare-fun res!1073265 () Bool)

(declare-fun e!875788 () Bool)

(assert (=> d!164215 (=> res!1073265 e!875788)))

(assert (=> d!164215 (= res!1073265 (and (is-Cons!36796 lt!673154) (= (_1!12735 (h!38244 lt!673154)) key2!21)))))

(assert (=> d!164215 (= (containsKey!870 lt!673154 key2!21) e!875788)))

(declare-fun b!1570817 () Bool)

(declare-fun e!875789 () Bool)

(assert (=> b!1570817 (= e!875788 e!875789)))

(declare-fun res!1073266 () Bool)

(assert (=> b!1570817 (=> (not res!1073266) (not e!875789))))

(assert (=> b!1570817 (= res!1073266 (and (or (not (is-Cons!36796 lt!673154)) (bvsle (_1!12735 (h!38244 lt!673154)) key2!21)) (is-Cons!36796 lt!673154) (bvslt (_1!12735 (h!38244 lt!673154)) key2!21)))))

(declare-fun b!1570818 () Bool)

(assert (=> b!1570818 (= e!875789 (containsKey!870 (t!51703 lt!673154) key2!21))))

(assert (= (and d!164215 (not res!1073265)) b!1570817))

(assert (= (and b!1570817 res!1073266) b!1570818))

(declare-fun m!1444239 () Bool)

(assert (=> b!1570818 m!1444239))

(assert (=> b!1570450 d!164215))

(declare-fun bm!72313 () Bool)

(declare-fun call!72318 () List!36800)

(declare-fun call!72316 () List!36800)

(assert (=> bm!72313 (= call!72318 call!72316)))

(declare-fun b!1570819 () Bool)

(declare-fun res!1073267 () Bool)

(declare-fun e!875790 () Bool)

(assert (=> b!1570819 (=> (not res!1073267) (not e!875790))))

(declare-fun lt!673194 () List!36800)

(assert (=> b!1570819 (= res!1073267 (containsKey!870 lt!673194 key1!37))))

(declare-fun b!1570820 () Bool)

(declare-fun e!875791 () List!36800)

(assert (=> b!1570820 (= e!875791 call!72316)))

(declare-fun bm!72314 () Bool)

(declare-fun call!72317 () List!36800)

(assert (=> bm!72314 (= call!72317 call!72318)))

(declare-fun e!875794 () List!36800)

(declare-fun b!1570821 () Bool)

(assert (=> b!1570821 (= e!875794 (insertStrictlySorted!601 (t!51703 (t!51703 (insertStrictlySorted!601 l!750 key2!21 v2!10))) key1!37 v1!32))))

(declare-fun d!164217 () Bool)

(assert (=> d!164217 e!875790))

(declare-fun res!1073268 () Bool)

(assert (=> d!164217 (=> (not res!1073268) (not e!875790))))

(assert (=> d!164217 (= res!1073268 (isStrictlySorted!1021 lt!673194))))

(assert (=> d!164217 (= lt!673194 e!875791)))

(declare-fun c!145018 () Bool)

(assert (=> d!164217 (= c!145018 (and (is-Cons!36796 (t!51703 (insertStrictlySorted!601 l!750 key2!21 v2!10))) (bvslt (_1!12735 (h!38244 (t!51703 (insertStrictlySorted!601 l!750 key2!21 v2!10)))) key1!37)))))

(assert (=> d!164217 (isStrictlySorted!1021 (t!51703 (insertStrictlySorted!601 l!750 key2!21 v2!10)))))

(assert (=> d!164217 (= (insertStrictlySorted!601 (t!51703 (insertStrictlySorted!601 l!750 key2!21 v2!10)) key1!37 v1!32) lt!673194)))

(declare-fun b!1570822 () Bool)

(declare-fun e!875793 () List!36800)

(assert (=> b!1570822 (= e!875793 call!72317)))

(declare-fun bm!72315 () Bool)

(assert (=> bm!72315 (= call!72316 ($colon$colon!1007 e!875794 (ite c!145018 (h!38244 (t!51703 (insertStrictlySorted!601 l!750 key2!21 v2!10))) (tuple2!25449 key1!37 v1!32))))))

(declare-fun c!145017 () Bool)

(assert (=> bm!72315 (= c!145017 c!145018)))

(declare-fun b!1570823 () Bool)

(declare-fun e!875792 () List!36800)

(assert (=> b!1570823 (= e!875791 e!875792)))

(declare-fun c!145015 () Bool)

(assert (=> b!1570823 (= c!145015 (and (is-Cons!36796 (t!51703 (insertStrictlySorted!601 l!750 key2!21 v2!10))) (= (_1!12735 (h!38244 (t!51703 (insertStrictlySorted!601 l!750 key2!21 v2!10)))) key1!37)))))

(declare-fun b!1570824 () Bool)

(assert (=> b!1570824 (= e!875792 call!72318)))

(declare-fun c!145016 () Bool)

(declare-fun b!1570825 () Bool)

(assert (=> b!1570825 (= e!875794 (ite c!145015 (t!51703 (t!51703 (insertStrictlySorted!601 l!750 key2!21 v2!10))) (ite c!145016 (Cons!36796 (h!38244 (t!51703 (insertStrictlySorted!601 l!750 key2!21 v2!10))) (t!51703 (t!51703 (insertStrictlySorted!601 l!750 key2!21 v2!10)))) Nil!36797)))))

(declare-fun b!1570826 () Bool)

(assert (=> b!1570826 (= e!875793 call!72317)))

(declare-fun b!1570827 () Bool)

(assert (=> b!1570827 (= e!875790 (contains!10387 lt!673194 (tuple2!25449 key1!37 v1!32)))))

(declare-fun b!1570828 () Bool)

(assert (=> b!1570828 (= c!145016 (and (is-Cons!36796 (t!51703 (insertStrictlySorted!601 l!750 key2!21 v2!10))) (bvsgt (_1!12735 (h!38244 (t!51703 (insertStrictlySorted!601 l!750 key2!21 v2!10)))) key1!37)))))

(assert (=> b!1570828 (= e!875792 e!875793)))

(assert (= (and d!164217 c!145018) b!1570820))

(assert (= (and d!164217 (not c!145018)) b!1570823))

(assert (= (and b!1570823 c!145015) b!1570824))

(assert (= (and b!1570823 (not c!145015)) b!1570828))

(assert (= (and b!1570828 c!145016) b!1570822))

(assert (= (and b!1570828 (not c!145016)) b!1570826))

(assert (= (or b!1570822 b!1570826) bm!72314))

(assert (= (or b!1570824 bm!72314) bm!72313))

(assert (= (or b!1570820 bm!72313) bm!72315))

(assert (= (and bm!72315 c!145017) b!1570821))

(assert (= (and bm!72315 (not c!145017)) b!1570825))

(assert (= (and d!164217 res!1073268) b!1570819))

(assert (= (and b!1570819 res!1073267) b!1570827))

(declare-fun m!1444241 () Bool)

(assert (=> b!1570827 m!1444241))

(declare-fun m!1444243 () Bool)

(assert (=> b!1570819 m!1444243))

(declare-fun m!1444245 () Bool)

(assert (=> b!1570821 m!1444245))

(declare-fun m!1444247 () Bool)

(assert (=> d!164217 m!1444247))

(assert (=> d!164217 m!1444215))

(declare-fun m!1444249 () Bool)

(assert (=> bm!72315 m!1444249))

(assert (=> b!1570512 d!164217))

(declare-fun b!1570829 () Bool)

(declare-fun e!875795 () Bool)

(declare-fun tp!114250 () Bool)

(assert (=> b!1570829 (= e!875795 (and tp_is_empty!39105 tp!114250))))

(assert (=> b!1570585 (= tp!114244 e!875795)))

(assert (= (and b!1570585 (is-Cons!36796 (t!51703 (t!51703 l!750)))) b!1570829))

(push 1)

(assert (not d!164217))

(assert (not b!1570772))

(assert (not b!1570827))

(assert (not bm!72306))

(assert (not b!1570763))

(assert (not b!1570798))

(assert (not b!1570759))

(assert (not bm!72309))

(assert (not b!1570816))

(assert (not b!1570769))

(assert (not b!1570788))

(assert (not b!1570794))

(assert (not d!164187))

(assert (not b!1570786))

(assert tp_is_empty!39105)

(assert (not d!164181))

(assert (not b!1570751))

(assert (not b!1570790))

(assert (not b!1570819))

(assert (not b!1570821))

(assert (not b!1570800))

(assert (not b!1570818))

(assert (not b!1570796))

(assert (not b!1570778))

(assert (not d!164173))

(assert (not b!1570761))

(assert (not b!1570803))

(assert (not b!1570805))

(assert (not b!1570802))

(assert (not b!1570784))

(assert (not d!164207))

(assert (not b!1570829))

(assert (not b!1570792))

(assert (not b!1570814))

(assert (not d!164175))

(assert (not bm!72315))

(assert (not d!164193))

(assert (not b!1570753))

(assert (not bm!72312))

(assert (not d!164203))

(assert (not b!1570811))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

