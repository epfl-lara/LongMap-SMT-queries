; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134418 () Bool)

(assert start!134418)

(declare-datatypes ((B!2520 0))(
  ( (B!2521 (val!19622 Int)) )
))
(declare-datatypes ((tuple2!25346 0))(
  ( (tuple2!25347 (_1!12684 (_ BitVec 64)) (_2!12684 B!2520)) )
))
(declare-datatypes ((List!36742 0))(
  ( (Nil!36739) (Cons!36738 (h!38185 tuple2!25346) (t!51650 List!36742)) )
))
(declare-fun l!750 () List!36742)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun b!1569491 () Bool)

(declare-fun e!874933 () Bool)

(declare-fun v2!10 () B!2520)

(declare-fun isStrictlySorted!1009 (List!36742) Bool)

(declare-fun insertStrictlySorted!595 (List!36742 (_ BitVec 64) B!2520) List!36742)

(assert (=> b!1569491 (= e!874933 (not (isStrictlySorted!1009 (insertStrictlySorted!595 l!750 key2!21 v2!10))))))

(declare-fun b!1569492 () Bool)

(declare-fun e!874934 () Bool)

(declare-fun tp_is_empty!39071 () Bool)

(declare-fun tp!114135 () Bool)

(assert (=> b!1569492 (= e!874934 (and tp_is_empty!39071 tp!114135))))

(declare-fun b!1569489 () Bool)

(declare-fun res!1072633 () Bool)

(assert (=> b!1569489 (=> (not res!1072633) (not e!874933))))

(assert (=> b!1569489 (= res!1072633 (isStrictlySorted!1009 l!750))))

(declare-fun b!1569490 () Bool)

(declare-fun res!1072635 () Bool)

(assert (=> b!1569490 (=> (not res!1072635) (not e!874933))))

(declare-fun key1!37 () (_ BitVec 64))

(assert (=> b!1569490 (= res!1072635 (or (not (is-Cons!36738 l!750)) (bvsge (_1!12684 (h!38185 l!750)) key1!37) (bvsge (_1!12684 (h!38185 l!750)) key2!21)))))

(declare-fun res!1072634 () Bool)

(assert (=> start!134418 (=> (not res!1072634) (not e!874933))))

(assert (=> start!134418 (= res!1072634 (not (= key1!37 key2!21)))))

(assert (=> start!134418 e!874933))

(assert (=> start!134418 true))

(assert (=> start!134418 e!874934))

(assert (=> start!134418 tp_is_empty!39071))

(assert (= (and start!134418 res!1072634) b!1569489))

(assert (= (and b!1569489 res!1072633) b!1569490))

(assert (= (and b!1569490 res!1072635) b!1569491))

(assert (= (and start!134418 (is-Cons!36738 l!750)) b!1569492))

(declare-fun m!1443811 () Bool)

(assert (=> b!1569491 m!1443811))

(assert (=> b!1569491 m!1443811))

(declare-fun m!1443813 () Bool)

(assert (=> b!1569491 m!1443813))

(declare-fun m!1443815 () Bool)

(assert (=> b!1569489 m!1443815))

(push 1)

(assert (not b!1569489))

(assert (not b!1569491))

(assert (not b!1569492))

(assert tp_is_empty!39071)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163897 () Bool)

(declare-fun res!1072640 () Bool)

(declare-fun e!874939 () Bool)

(assert (=> d!163897 (=> res!1072640 e!874939)))

(assert (=> d!163897 (= res!1072640 (or (is-Nil!36739 l!750) (is-Nil!36739 (t!51650 l!750))))))

(assert (=> d!163897 (= (isStrictlySorted!1009 l!750) e!874939)))

(declare-fun b!1569497 () Bool)

(declare-fun e!874940 () Bool)

(assert (=> b!1569497 (= e!874939 e!874940)))

(declare-fun res!1072641 () Bool)

(assert (=> b!1569497 (=> (not res!1072641) (not e!874940))))

(assert (=> b!1569497 (= res!1072641 (bvslt (_1!12684 (h!38185 l!750)) (_1!12684 (h!38185 (t!51650 l!750)))))))

(declare-fun b!1569498 () Bool)

(assert (=> b!1569498 (= e!874940 (isStrictlySorted!1009 (t!51650 l!750)))))

(assert (= (and d!163897 (not res!1072640)) b!1569497))

(assert (= (and b!1569497 res!1072641) b!1569498))

(declare-fun m!1443817 () Bool)

(assert (=> b!1569498 m!1443817))

(assert (=> b!1569489 d!163897))

(declare-fun d!163903 () Bool)

(declare-fun res!1072642 () Bool)

(declare-fun e!874941 () Bool)

(assert (=> d!163903 (=> res!1072642 e!874941)))

(assert (=> d!163903 (= res!1072642 (or (is-Nil!36739 (insertStrictlySorted!595 l!750 key2!21 v2!10)) (is-Nil!36739 (t!51650 (insertStrictlySorted!595 l!750 key2!21 v2!10)))))))

(assert (=> d!163903 (= (isStrictlySorted!1009 (insertStrictlySorted!595 l!750 key2!21 v2!10)) e!874941)))

(declare-fun b!1569499 () Bool)

(declare-fun e!874942 () Bool)

(assert (=> b!1569499 (= e!874941 e!874942)))

(declare-fun res!1072643 () Bool)

(assert (=> b!1569499 (=> (not res!1072643) (not e!874942))))

(assert (=> b!1569499 (= res!1072643 (bvslt (_1!12684 (h!38185 (insertStrictlySorted!595 l!750 key2!21 v2!10))) (_1!12684 (h!38185 (t!51650 (insertStrictlySorted!595 l!750 key2!21 v2!10))))))))

(declare-fun b!1569500 () Bool)

(assert (=> b!1569500 (= e!874942 (isStrictlySorted!1009 (t!51650 (insertStrictlySorted!595 l!750 key2!21 v2!10))))))

(assert (= (and d!163903 (not res!1072642)) b!1569499))

(assert (= (and b!1569499 res!1072643) b!1569500))

(declare-fun m!1443819 () Bool)

(assert (=> b!1569500 m!1443819))

(assert (=> b!1569491 d!163903))

(declare-fun b!1569577 () Bool)

(declare-fun res!1072672 () Bool)

(declare-fun e!874991 () Bool)

(assert (=> b!1569577 (=> (not res!1072672) (not e!874991))))

(declare-fun lt!673313 () List!36742)

(declare-fun containsKey!865 (List!36742 (_ BitVec 64)) Bool)

(assert (=> b!1569577 (= res!1072672 (containsKey!865 lt!673313 key2!21))))

(declare-fun call!72113 () List!36742)

(declare-fun bm!72108 () Bool)

(declare-fun c!144766 () Bool)

(declare-fun e!874989 () List!36742)

(declare-fun $colon$colon!997 (List!36742 tuple2!25346) List!36742)

(assert (=> bm!72108 (= call!72113 ($colon$colon!997 e!874989 (ite c!144766 (h!38185 l!750) (tuple2!25347 key2!21 v2!10))))))

(declare-fun c!144764 () Bool)

(assert (=> bm!72108 (= c!144764 c!144766)))

(declare-fun bm!72109 () Bool)

(declare-fun call!72111 () List!36742)

(declare-fun call!72112 () List!36742)

(assert (=> bm!72109 (= call!72111 call!72112)))

(declare-fun b!1569578 () Bool)

(declare-fun e!874993 () List!36742)

(assert (=> b!1569578 (= e!874993 call!72111)))

(declare-fun b!1569579 () Bool)

(declare-fun e!874990 () List!36742)

(assert (=> b!1569579 (= e!874990 call!72112)))

(declare-fun d!163905 () Bool)

(assert (=> d!163905 e!874991))

(declare-fun res!1072673 () Bool)

(assert (=> d!163905 (=> (not res!1072673) (not e!874991))))

(assert (=> d!163905 (= res!1072673 (isStrictlySorted!1009 lt!673313))))

(declare-fun e!874992 () List!36742)

(assert (=> d!163905 (= lt!673313 e!874992)))

(assert (=> d!163905 (= c!144766 (and (is-Cons!36738 l!750) (bvslt (_1!12684 (h!38185 l!750)) key2!21)))))

(assert (=> d!163905 (isStrictlySorted!1009 l!750)))

(assert (=> d!163905 (= (insertStrictlySorted!595 l!750 key2!21 v2!10) lt!673313)))

(declare-fun b!1569580 () Bool)

(assert (=> b!1569580 (= e!874992 call!72113)))

(declare-fun b!1569581 () Bool)

(assert (=> b!1569581 (= e!874989 (insertStrictlySorted!595 (t!51650 l!750) key2!21 v2!10))))

(declare-fun b!1569582 () Bool)

(declare-fun contains!10426 (List!36742 tuple2!25346) Bool)

(assert (=> b!1569582 (= e!874991 (contains!10426 lt!673313 (tuple2!25347 key2!21 v2!10)))))

(declare-fun c!144763 () Bool)

(declare-fun b!1569583 () Bool)

(declare-fun c!144765 () Bool)

(assert (=> b!1569583 (= e!874989 (ite c!144765 (t!51650 l!750) (ite c!144763 (Cons!36738 (h!38185 l!750) (t!51650 l!750)) Nil!36739)))))

(declare-fun b!1569584 () Bool)

(assert (=> b!1569584 (= e!874993 call!72111)))

(declare-fun b!1569585 () Bool)

(assert (=> b!1569585 (= e!874992 e!874990)))

(assert (=> b!1569585 (= c!144765 (and (is-Cons!36738 l!750) (= (_1!12684 (h!38185 l!750)) key2!21)))))

(declare-fun bm!72110 () Bool)

(assert (=> bm!72110 (= call!72112 call!72113)))

(declare-fun b!1569586 () Bool)

(assert (=> b!1569586 (= c!144763 (and (is-Cons!36738 l!750) (bvsgt (_1!12684 (h!38185 l!750)) key2!21)))))

(assert (=> b!1569586 (= e!874990 e!874993)))

(assert (= (and d!163905 c!144766) b!1569580))

(assert (= (and d!163905 (not c!144766)) b!1569585))

(assert (= (and b!1569585 c!144765) b!1569579))

(assert (= (and b!1569585 (not c!144765)) b!1569586))

(assert (= (and b!1569586 c!144763) b!1569578))

(assert (= (and b!1569586 (not c!144763)) b!1569584))

(assert (= (or b!1569578 b!1569584) bm!72109))

(assert (= (or b!1569579 bm!72109) bm!72110))

(assert (= (or b!1569580 bm!72110) bm!72108))

(assert (= (and bm!72108 c!144764) b!1569581))

(assert (= (and bm!72108 (not c!144764)) b!1569583))

(assert (= (and d!163905 res!1072673) b!1569577))

(assert (= (and b!1569577 res!1072672) b!1569582))

(declare-fun m!1443829 () Bool)

(assert (=> b!1569577 m!1443829))

(declare-fun m!1443831 () Bool)

(assert (=> b!1569581 m!1443831))

(declare-fun m!1443833 () Bool)

(assert (=> d!163905 m!1443833))

(assert (=> d!163905 m!1443815))

(declare-fun m!1443835 () Bool)

(assert (=> bm!72108 m!1443835))

(declare-fun m!1443837 () Bool)

(assert (=> b!1569582 m!1443837))

(assert (=> b!1569491 d!163905))

(declare-fun b!1569601 () Bool)

(declare-fun e!875001 () Bool)

(declare-fun tp!114138 () Bool)

(assert (=> b!1569601 (= e!875001 (and tp_is_empty!39071 tp!114138))))

(assert (=> b!1569492 (= tp!114135 e!875001)))

(assert (= (and b!1569492 (is-Cons!36738 (t!51650 l!750))) b!1569601))

(push 1)

