; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138676 () Bool)

(assert start!138676)

(declare-fun b!1587941 () Bool)

(declare-fun res!1083712 () Bool)

(declare-fun e!886730 () Bool)

(assert (=> b!1587941 (=> (not res!1083712) (not e!886730))))

(declare-datatypes ((B!2988 0))(
  ( (B!2989 (val!19856 Int)) )
))
(declare-datatypes ((tuple2!25940 0))(
  ( (tuple2!25941 (_1!12981 (_ BitVec 64)) (_2!12981 B!2988)) )
))
(declare-datatypes ((List!37008 0))(
  ( (Nil!37005) (Cons!37004 (h!38565 tuple2!25940) (t!51919 List!37008)) )
))
(declare-fun l!556 () List!37008)

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1587941 (= res!1083712 (and (is-Cons!37004 l!556) (bvslt (_1!12981 (h!38565 l!556)) newKey!21)))))

(declare-fun res!1083711 () Bool)

(assert (=> start!138676 (=> (not res!1083711) (not e!886730))))

(declare-fun isStrictlySorted!1186 (List!37008) Bool)

(assert (=> start!138676 (= res!1083711 (isStrictlySorted!1186 l!556))))

(assert (=> start!138676 e!886730))

(declare-fun e!886729 () Bool)

(assert (=> start!138676 e!886729))

(assert (=> start!138676 true))

(declare-fun tp_is_empty!39521 () Bool)

(assert (=> start!138676 tp_is_empty!39521))

(declare-fun b!1587942 () Bool)

(declare-fun res!1083713 () Bool)

(declare-fun e!886728 () Bool)

(assert (=> b!1587942 (=> res!1083713 e!886728)))

(declare-fun lt!678291 () List!37008)

(declare-fun containsKey!1012 (List!37008 (_ BitVec 64)) Bool)

(assert (=> b!1587942 (= res!1083713 (not (containsKey!1012 lt!678291 newKey!21)))))

(declare-fun newValue!21 () B!2988)

(declare-fun b!1587943 () Bool)

(declare-fun contains!10579 (List!37008 tuple2!25940) Bool)

(assert (=> b!1587943 (= e!886728 (not (contains!10579 lt!678291 (tuple2!25941 newKey!21 newValue!21))))))

(declare-fun b!1587944 () Bool)

(assert (=> b!1587944 (= e!886730 e!886728)))

(declare-fun res!1083714 () Bool)

(assert (=> b!1587944 (=> res!1083714 e!886728)))

(assert (=> b!1587944 (= res!1083714 (not (isStrictlySorted!1186 lt!678291)))))

(declare-fun $colon$colon!1036 (List!37008 tuple2!25940) List!37008)

(declare-fun insertStrictlySorted!638 (List!37008 (_ BitVec 64) B!2988) List!37008)

(assert (=> b!1587944 (= lt!678291 ($colon$colon!1036 (insertStrictlySorted!638 (t!51919 l!556) newKey!21 newValue!21) (h!38565 l!556)))))

(declare-fun b!1587945 () Bool)

(declare-fun tp!115267 () Bool)

(assert (=> b!1587945 (= e!886729 (and tp_is_empty!39521 tp!115267))))

(assert (= (and start!138676 res!1083711) b!1587941))

(assert (= (and b!1587941 res!1083712) b!1587944))

(assert (= (and b!1587944 (not res!1083714)) b!1587942))

(assert (= (and b!1587942 (not res!1083713)) b!1587943))

(assert (= (and start!138676 (is-Cons!37004 l!556)) b!1587945))

(declare-fun m!1456581 () Bool)

(assert (=> start!138676 m!1456581))

(declare-fun m!1456583 () Bool)

(assert (=> b!1587942 m!1456583))

(declare-fun m!1456585 () Bool)

(assert (=> b!1587943 m!1456585))

(declare-fun m!1456587 () Bool)

(assert (=> b!1587944 m!1456587))

(declare-fun m!1456589 () Bool)

(assert (=> b!1587944 m!1456589))

(assert (=> b!1587944 m!1456589))

(declare-fun m!1456591 () Bool)

(assert (=> b!1587944 m!1456591))

(push 1)

(assert (not b!1587942))

(assert tp_is_empty!39521)

(assert (not b!1587945))

(assert (not start!138676))

(assert (not b!1587944))

(assert (not b!1587943))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!168409 () Bool)

(declare-fun lt!678297 () Bool)

(declare-fun content!852 (List!37008) (Set tuple2!25940))

(assert (=> d!168409 (= lt!678297 (set.member (tuple2!25941 newKey!21 newValue!21) (content!852 lt!678291)))))

(declare-fun e!886747 () Bool)

(assert (=> d!168409 (= lt!678297 e!886747)))

(declare-fun res!1083731 () Bool)

(assert (=> d!168409 (=> (not res!1083731) (not e!886747))))

(assert (=> d!168409 (= res!1083731 (is-Cons!37004 lt!678291))))

(assert (=> d!168409 (= (contains!10579 lt!678291 (tuple2!25941 newKey!21 newValue!21)) lt!678297)))

(declare-fun b!1587962 () Bool)

(declare-fun e!886748 () Bool)

(assert (=> b!1587962 (= e!886747 e!886748)))

(declare-fun res!1083732 () Bool)

(assert (=> b!1587962 (=> res!1083732 e!886748)))

(assert (=> b!1587962 (= res!1083732 (= (h!38565 lt!678291) (tuple2!25941 newKey!21 newValue!21)))))

(declare-fun b!1587963 () Bool)

(assert (=> b!1587963 (= e!886748 (contains!10579 (t!51919 lt!678291) (tuple2!25941 newKey!21 newValue!21)))))

(assert (= (and d!168409 res!1083731) b!1587962))

(assert (= (and b!1587962 (not res!1083732)) b!1587963))

(declare-fun m!1456601 () Bool)

(assert (=> d!168409 m!1456601))

(declare-fun m!1456603 () Bool)

(assert (=> d!168409 m!1456603))

(declare-fun m!1456605 () Bool)

(assert (=> b!1587963 m!1456605))

(assert (=> b!1587943 d!168409))

(declare-fun d!168413 () Bool)

(declare-fun res!1083743 () Bool)

(declare-fun e!886759 () Bool)

(assert (=> d!168413 (=> res!1083743 e!886759)))

(assert (=> d!168413 (= res!1083743 (or (is-Nil!37005 l!556) (is-Nil!37005 (t!51919 l!556))))))

(assert (=> d!168413 (= (isStrictlySorted!1186 l!556) e!886759)))

(declare-fun b!1587974 () Bool)

(declare-fun e!886760 () Bool)

(assert (=> b!1587974 (= e!886759 e!886760)))

(declare-fun res!1083744 () Bool)

(assert (=> b!1587974 (=> (not res!1083744) (not e!886760))))

(assert (=> b!1587974 (= res!1083744 (bvslt (_1!12981 (h!38565 l!556)) (_1!12981 (h!38565 (t!51919 l!556)))))))

(declare-fun b!1587975 () Bool)

(assert (=> b!1587975 (= e!886760 (isStrictlySorted!1186 (t!51919 l!556)))))

(assert (= (and d!168413 (not res!1083743)) b!1587974))

(assert (= (and b!1587974 res!1083744) b!1587975))

(declare-fun m!1456609 () Bool)

(assert (=> b!1587975 m!1456609))

(assert (=> start!138676 d!168413))

(declare-fun d!168419 () Bool)

(declare-fun res!1083751 () Bool)

(declare-fun e!886767 () Bool)

(assert (=> d!168419 (=> res!1083751 e!886767)))

(assert (=> d!168419 (= res!1083751 (or (is-Nil!37005 lt!678291) (is-Nil!37005 (t!51919 lt!678291))))))

(assert (=> d!168419 (= (isStrictlySorted!1186 lt!678291) e!886767)))

(declare-fun b!1587982 () Bool)

(declare-fun e!886768 () Bool)

(assert (=> b!1587982 (= e!886767 e!886768)))

(declare-fun res!1083752 () Bool)

(assert (=> b!1587982 (=> (not res!1083752) (not e!886768))))

(assert (=> b!1587982 (= res!1083752 (bvslt (_1!12981 (h!38565 lt!678291)) (_1!12981 (h!38565 (t!51919 lt!678291)))))))

(declare-fun b!1587983 () Bool)

(assert (=> b!1587983 (= e!886768 (isStrictlySorted!1186 (t!51919 lt!678291)))))

(assert (= (and d!168419 (not res!1083751)) b!1587982))

(assert (= (and b!1587982 res!1083752) b!1587983))

(declare-fun m!1456613 () Bool)

(assert (=> b!1587983 m!1456613))

(assert (=> b!1587944 d!168419))

(declare-fun d!168423 () Bool)

(assert (=> d!168423 (= ($colon$colon!1036 (insertStrictlySorted!638 (t!51919 l!556) newKey!21 newValue!21) (h!38565 l!556)) (Cons!37004 (h!38565 l!556) (insertStrictlySorted!638 (t!51919 l!556) newKey!21 newValue!21)))))

(assert (=> b!1587944 d!168423))

(declare-fun b!1588056 () Bool)

(declare-fun res!1083773 () Bool)

(declare-fun e!886810 () Bool)

(assert (=> b!1588056 (=> (not res!1083773) (not e!886810))))

(declare-fun lt!678308 () List!37008)

(assert (=> b!1588056 (= res!1083773 (containsKey!1012 lt!678308 newKey!21))))

(declare-fun b!1588057 () Bool)

(declare-fun c!147810 () Bool)

(assert (=> b!1588057 (= c!147810 (and (is-Cons!37004 (t!51919 l!556)) (bvsgt (_1!12981 (h!38565 (t!51919 l!556))) newKey!21)))))

(declare-fun e!886813 () List!37008)

(declare-fun e!886812 () List!37008)

(assert (=> b!1588057 (= e!886813 e!886812)))

(declare-fun b!1588058 () Bool)

(declare-fun e!886811 () List!37008)

(declare-fun call!72791 () List!37008)

(assert (=> b!1588058 (= e!886811 call!72791)))

(declare-fun b!1588059 () Bool)

(assert (=> b!1588059 (= e!886810 (contains!10579 lt!678308 (tuple2!25941 newKey!21 newValue!21)))))

(declare-fun b!1588060 () Bool)

(declare-fun call!72787 () List!37008)

(assert (=> b!1588060 (= e!886813 call!72787)))

(declare-fun d!168427 () Bool)

(assert (=> d!168427 e!886810))

(declare-fun res!1083774 () Bool)

(assert (=> d!168427 (=> (not res!1083774) (not e!886810))))

(assert (=> d!168427 (= res!1083774 (isStrictlySorted!1186 lt!678308))))

(assert (=> d!168427 (= lt!678308 e!886811)))

(declare-fun c!147809 () Bool)

(assert (=> d!168427 (= c!147809 (and (is-Cons!37004 (t!51919 l!556)) (bvslt (_1!12981 (h!38565 (t!51919 l!556))) newKey!21)))))

(assert (=> d!168427 (isStrictlySorted!1186 (t!51919 l!556))))

(assert (=> d!168427 (= (insertStrictlySorted!638 (t!51919 l!556) newKey!21 newValue!21) lt!678308)))

(declare-fun e!886814 () List!37008)

(declare-fun b!1588061 () Bool)

(assert (=> b!1588061 (= e!886814 (insertStrictlySorted!638 (t!51919 (t!51919 l!556)) newKey!21 newValue!21))))

(declare-fun bm!72784 () Bool)

(assert (=> bm!72784 (= call!72787 call!72791)))

(declare-fun c!147811 () Bool)

(declare-fun b!1588062 () Bool)

(assert (=> b!1588062 (= e!886814 (ite c!147811 (t!51919 (t!51919 l!556)) (ite c!147810 (Cons!37004 (h!38565 (t!51919 l!556)) (t!51919 (t!51919 l!556))) Nil!37005)))))

(declare-fun bm!72785 () Bool)

(declare-fun call!72790 () List!37008)

(assert (=> bm!72785 (= call!72790 call!72787)))

(declare-fun b!1588063 () Bool)

(assert (=> b!1588063 (= e!886812 call!72790)))

(declare-fun bm!72786 () Bool)

(assert (=> bm!72786 (= call!72791 ($colon$colon!1036 e!886814 (ite c!147809 (h!38565 (t!51919 l!556)) (tuple2!25941 newKey!21 newValue!21))))))

(declare-fun c!147808 () Bool)

(assert (=> bm!72786 (= c!147808 c!147809)))

(declare-fun b!1588064 () Bool)

(assert (=> b!1588064 (= e!886812 call!72790)))

(declare-fun b!1588065 () Bool)

(assert (=> b!1588065 (= e!886811 e!886813)))

(assert (=> b!1588065 (= c!147811 (and (is-Cons!37004 (t!51919 l!556)) (= (_1!12981 (h!38565 (t!51919 l!556))) newKey!21)))))

(assert (= (and d!168427 c!147809) b!1588058))

(assert (= (and d!168427 (not c!147809)) b!1588065))

(assert (= (and b!1588065 c!147811) b!1588060))

(assert (= (and b!1588065 (not c!147811)) b!1588057))

(assert (= (and b!1588057 c!147810) b!1588063))

(assert (= (and b!1588057 (not c!147810)) b!1588064))

(assert (= (or b!1588063 b!1588064) bm!72785))

(assert (= (or b!1588060 bm!72785) bm!72784))

(assert (= (or b!1588058 bm!72784) bm!72786))

(assert (= (and bm!72786 c!147808) b!1588061))

(assert (= (and bm!72786 (not c!147808)) b!1588062))

(assert (= (and d!168427 res!1083774) b!1588056))

(assert (= (and b!1588056 res!1083773) b!1588059))

(declare-fun m!1456635 () Bool)

(assert (=> bm!72786 m!1456635))

(declare-fun m!1456637 () Bool)

(assert (=> b!1588061 m!1456637))

(declare-fun m!1456639 () Bool)

(assert (=> b!1588056 m!1456639))

(declare-fun m!1456641 () Bool)

(assert (=> d!168427 m!1456641))

(assert (=> d!168427 m!1456609))

(declare-fun m!1456643 () Bool)

(assert (=> b!1588059 m!1456643))

(assert (=> b!1587944 d!168427))

(declare-fun d!168437 () Bool)

(declare-fun res!1083783 () Bool)

(declare-fun e!886826 () Bool)

(assert (=> d!168437 (=> res!1083783 e!886826)))

(assert (=> d!168437 (= res!1083783 (and (is-Cons!37004 lt!678291) (= (_1!12981 (h!38565 lt!678291)) newKey!21)))))

(assert (=> d!168437 (= (containsKey!1012 lt!678291 newKey!21) e!886826)))

(declare-fun b!1588083 () Bool)

(declare-fun e!886827 () Bool)

(assert (=> b!1588083 (= e!886826 e!886827)))

(declare-fun res!1083784 () Bool)

(assert (=> b!1588083 (=> (not res!1083784) (not e!886827))))

(assert (=> b!1588083 (= res!1083784 (and (or (not (is-Cons!37004 lt!678291)) (bvsle (_1!12981 (h!38565 lt!678291)) newKey!21)) (is-Cons!37004 lt!678291) (bvslt (_1!12981 (h!38565 lt!678291)) newKey!21)))))

(declare-fun b!1588084 () Bool)

(assert (=> b!1588084 (= e!886827 (containsKey!1012 (t!51919 lt!678291) newKey!21))))

(assert (= (and d!168437 (not res!1083783)) b!1588083))

(assert (= (and b!1588083 res!1083784) b!1588084))

(declare-fun m!1456645 () Bool)

(assert (=> b!1588084 m!1456645))

(assert (=> b!1587942 d!168437))

(declare-fun b!1588099 () Bool)

(declare-fun e!886835 () Bool)

(declare-fun tp!115273 () Bool)

(assert (=> b!1588099 (= e!886835 (and tp_is_empty!39521 tp!115273))))

(assert (=> b!1587945 (= tp!115267 e!886835)))

(assert (= (and b!1587945 (is-Cons!37004 (t!51919 l!556))) b!1588099))

(push 1)

(assert (not bm!72786))

(assert (not d!168409))

(assert (not b!1588099))

(assert tp_is_empty!39521)

(assert (not b!1588059))

(assert (not b!1588061))

(assert (not b!1588056))

(assert (not b!1587963))

(assert (not b!1587983))

(assert (not b!1587975))

(assert (not d!168427))

(assert (not b!1588084))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!168453 () Bool)

(declare-fun res!1083803 () Bool)

(declare-fun e!886858 () Bool)

(assert (=> d!168453 (=> res!1083803 e!886858)))

(assert (=> d!168453 (= res!1083803 (or (is-Nil!37005 (t!51919 lt!678291)) (is-Nil!37005 (t!51919 (t!51919 lt!678291)))))))

(assert (=> d!168453 (= (isStrictlySorted!1186 (t!51919 lt!678291)) e!886858)))

(declare-fun b!1588129 () Bool)

(declare-fun e!886859 () Bool)

(assert (=> b!1588129 (= e!886858 e!886859)))

(declare-fun res!1083804 () Bool)

(assert (=> b!1588129 (=> (not res!1083804) (not e!886859))))

(assert (=> b!1588129 (= res!1083804 (bvslt (_1!12981 (h!38565 (t!51919 lt!678291))) (_1!12981 (h!38565 (t!51919 (t!51919 lt!678291))))))))

(declare-fun b!1588130 () Bool)

(assert (=> b!1588130 (= e!886859 (isStrictlySorted!1186 (t!51919 (t!51919 lt!678291))))))

(assert (= (and d!168453 (not res!1083803)) b!1588129))

(assert (= (and b!1588129 res!1083804) b!1588130))

(declare-fun m!1456685 () Bool)

(assert (=> b!1588130 m!1456685))

(assert (=> b!1587983 d!168453))

(declare-fun d!168457 () Bool)

(declare-fun res!1083807 () Bool)

(declare-fun e!886862 () Bool)

(assert (=> d!168457 (=> res!1083807 e!886862)))

(assert (=> d!168457 (= res!1083807 (or (is-Nil!37005 lt!678308) (is-Nil!37005 (t!51919 lt!678308))))))

(assert (=> d!168457 (= (isStrictlySorted!1186 lt!678308) e!886862)))

(declare-fun b!1588133 () Bool)

(declare-fun e!886863 () Bool)

(assert (=> b!1588133 (= e!886862 e!886863)))

(declare-fun res!1083808 () Bool)

(assert (=> b!1588133 (=> (not res!1083808) (not e!886863))))

(assert (=> b!1588133 (= res!1083808 (bvslt (_1!12981 (h!38565 lt!678308)) (_1!12981 (h!38565 (t!51919 lt!678308)))))))

(declare-fun b!1588134 () Bool)

(assert (=> b!1588134 (= e!886863 (isStrictlySorted!1186 (t!51919 lt!678308)))))

(assert (= (and d!168457 (not res!1083807)) b!1588133))

(assert (= (and b!1588133 res!1083808) b!1588134))

(declare-fun m!1456689 () Bool)

(assert (=> b!1588134 m!1456689))

(assert (=> d!168427 d!168457))

(declare-fun d!168461 () Bool)

(declare-fun res!1083811 () Bool)

(declare-fun e!886866 () Bool)

(assert (=> d!168461 (=> res!1083811 e!886866)))

(assert (=> d!168461 (= res!1083811 (or (is-Nil!37005 (t!51919 l!556)) (is-Nil!37005 (t!51919 (t!51919 l!556)))))))

(assert (=> d!168461 (= (isStrictlySorted!1186 (t!51919 l!556)) e!886866)))

(declare-fun b!1588137 () Bool)

(declare-fun e!886867 () Bool)

(assert (=> b!1588137 (= e!886866 e!886867)))

(declare-fun res!1083812 () Bool)

(assert (=> b!1588137 (=> (not res!1083812) (not e!886867))))

(assert (=> b!1588137 (= res!1083812 (bvslt (_1!12981 (h!38565 (t!51919 l!556))) (_1!12981 (h!38565 (t!51919 (t!51919 l!556))))))))

(declare-fun b!1588138 () Bool)

(assert (=> b!1588138 (= e!886867 (isStrictlySorted!1186 (t!51919 (t!51919 l!556))))))

(assert (= (and d!168461 (not res!1083811)) b!1588137))

(assert (= (and b!1588137 res!1083812) b!1588138))

(declare-fun m!1456693 () Bool)

(assert (=> b!1588138 m!1456693))

(assert (=> d!168427 d!168461))

(declare-fun d!168465 () Bool)

(declare-fun lt!678313 () Bool)

(assert (=> d!168465 (= lt!678313 (set.member (tuple2!25941 newKey!21 newValue!21) (content!852 (t!51919 lt!678291))))))

(declare-fun e!886870 () Bool)

(assert (=> d!168465 (= lt!678313 e!886870)))

(declare-fun res!1083815 () Bool)

(assert (=> d!168465 (=> (not res!1083815) (not e!886870))))

(assert (=> d!168465 (= res!1083815 (is-Cons!37004 (t!51919 lt!678291)))))

(assert (=> d!168465 (= (contains!10579 (t!51919 lt!678291) (tuple2!25941 newKey!21 newValue!21)) lt!678313)))

(declare-fun b!1588141 () Bool)

(declare-fun e!886871 () Bool)

(assert (=> b!1588141 (= e!886870 e!886871)))

(declare-fun res!1083816 () Bool)

(assert (=> b!1588141 (=> res!1083816 e!886871)))

(assert (=> b!1588141 (= res!1083816 (= (h!38565 (t!51919 lt!678291)) (tuple2!25941 newKey!21 newValue!21)))))

(declare-fun b!1588142 () Bool)

(assert (=> b!1588142 (= e!886871 (contains!10579 (t!51919 (t!51919 lt!678291)) (tuple2!25941 newKey!21 newValue!21)))))

(assert (= (and d!168465 res!1083815) b!1588141))

(assert (= (and b!1588141 (not res!1083816)) b!1588142))

(declare-fun m!1456697 () Bool)

(assert (=> d!168465 m!1456697))

(declare-fun m!1456699 () Bool)

(assert (=> d!168465 m!1456699))

(declare-fun m!1456701 () Bool)

(assert (=> b!1588142 m!1456701))

(assert (=> b!1587963 d!168465))

(declare-fun d!168469 () Bool)

(assert (=> d!168469 (= ($colon$colon!1036 e!886814 (ite c!147809 (h!38565 (t!51919 l!556)) (tuple2!25941 newKey!21 newValue!21))) (Cons!37004 (ite c!147809 (h!38565 (t!51919 l!556)) (tuple2!25941 newKey!21 newValue!21)) e!886814))))

(assert (=> bm!72786 d!168469))

(declare-fun b!1588143 () Bool)

(declare-fun res!1083817 () Bool)

(declare-fun e!886872 () Bool)

(assert (=> b!1588143 (=> (not res!1083817) (not e!886872))))

(declare-fun lt!678314 () List!37008)

(assert (=> b!1588143 (= res!1083817 (containsKey!1012 lt!678314 newKey!21))))

(declare-fun b!1588144 () Bool)

(declare-fun c!147824 () Bool)

(assert (=> b!1588144 (= c!147824 (and (is-Cons!37004 (t!51919 (t!51919 l!556))) (bvsgt (_1!12981 (h!38565 (t!51919 (t!51919 l!556)))) newKey!21)))))

(declare-fun e!886875 () List!37008)

(declare-fun e!886874 () List!37008)

(assert (=> b!1588144 (= e!886875 e!886874)))

(declare-fun b!1588145 () Bool)

(declare-fun e!886873 () List!37008)

(declare-fun call!72800 () List!37008)

(assert (=> b!1588145 (= e!886873 call!72800)))

(declare-fun b!1588146 () Bool)

(assert (=> b!1588146 (= e!886872 (contains!10579 lt!678314 (tuple2!25941 newKey!21 newValue!21)))))

(declare-fun b!1588147 () Bool)

(declare-fun call!72798 () List!37008)

(assert (=> b!1588147 (= e!886875 call!72798)))

(declare-fun d!168471 () Bool)

(assert (=> d!168471 e!886872))

(declare-fun res!1083818 () Bool)

(assert (=> d!168471 (=> (not res!1083818) (not e!886872))))

(assert (=> d!168471 (= res!1083818 (isStrictlySorted!1186 lt!678314))))

(assert (=> d!168471 (= lt!678314 e!886873)))

(declare-fun c!147823 () Bool)

(assert (=> d!168471 (= c!147823 (and (is-Cons!37004 (t!51919 (t!51919 l!556))) (bvslt (_1!12981 (h!38565 (t!51919 (t!51919 l!556)))) newKey!21)))))

(assert (=> d!168471 (isStrictlySorted!1186 (t!51919 (t!51919 l!556)))))

(assert (=> d!168471 (= (insertStrictlySorted!638 (t!51919 (t!51919 l!556)) newKey!21 newValue!21) lt!678314)))

(declare-fun e!886876 () List!37008)

(declare-fun b!1588148 () Bool)

(assert (=> b!1588148 (= e!886876 (insertStrictlySorted!638 (t!51919 (t!51919 (t!51919 l!556))) newKey!21 newValue!21))))

(declare-fun bm!72795 () Bool)

(assert (=> bm!72795 (= call!72798 call!72800)))

(declare-fun c!147825 () Bool)

(declare-fun b!1588149 () Bool)

(assert (=> b!1588149 (= e!886876 (ite c!147825 (t!51919 (t!51919 (t!51919 l!556))) (ite c!147824 (Cons!37004 (h!38565 (t!51919 (t!51919 l!556))) (t!51919 (t!51919 (t!51919 l!556)))) Nil!37005)))))

(declare-fun bm!72796 () Bool)

(declare-fun call!72799 () List!37008)

(assert (=> bm!72796 (= call!72799 call!72798)))

(declare-fun b!1588150 () Bool)

(assert (=> b!1588150 (= e!886874 call!72799)))

(declare-fun bm!72797 () Bool)

(assert (=> bm!72797 (= call!72800 ($colon$colon!1036 e!886876 (ite c!147823 (h!38565 (t!51919 (t!51919 l!556))) (tuple2!25941 newKey!21 newValue!21))))))

(declare-fun c!147822 () Bool)

(assert (=> bm!72797 (= c!147822 c!147823)))

(declare-fun b!1588151 () Bool)

(assert (=> b!1588151 (= e!886874 call!72799)))

(declare-fun b!1588152 () Bool)

(assert (=> b!1588152 (= e!886873 e!886875)))

(assert (=> b!1588152 (= c!147825 (and (is-Cons!37004 (t!51919 (t!51919 l!556))) (= (_1!12981 (h!38565 (t!51919 (t!51919 l!556)))) newKey!21)))))

(assert (= (and d!168471 c!147823) b!1588145))

(assert (= (and d!168471 (not c!147823)) b!1588152))

(assert (= (and b!1588152 c!147825) b!1588147))

(assert (= (and b!1588152 (not c!147825)) b!1588144))

(assert (= (and b!1588144 c!147824) b!1588150))

(assert (= (and b!1588144 (not c!147824)) b!1588151))

(assert (= (or b!1588150 b!1588151) bm!72796))

(assert (= (or b!1588147 bm!72796) bm!72795))

(assert (= (or b!1588145 bm!72795) bm!72797))

(assert (= (and bm!72797 c!147822) b!1588148))

(assert (= (and bm!72797 (not c!147822)) b!1588149))

(assert (= (and d!168471 res!1083818) b!1588143))

(assert (= (and b!1588143 res!1083817) b!1588146))

(declare-fun m!1456703 () Bool)

(assert (=> bm!72797 m!1456703))

(declare-fun m!1456705 () Bool)

(assert (=> b!1588148 m!1456705))

(declare-fun m!1456707 () Bool)

(assert (=> b!1588143 m!1456707))

(declare-fun m!1456709 () Bool)

(assert (=> d!168471 m!1456709))

(assert (=> d!168471 m!1456693))

(declare-fun m!1456711 () Bool)

(assert (=> b!1588146 m!1456711))

(assert (=> b!1588061 d!168471))

(declare-fun d!168473 () Bool)

(declare-fun c!147831 () Bool)

(assert (=> d!168473 (= c!147831 (is-Nil!37005 lt!678291))))

(declare-fun e!886883 () (Set tuple2!25940))

(assert (=> d!168473 (= (content!852 lt!678291) e!886883)))

(declare-fun b!1588164 () Bool)

(assert (=> b!1588164 (= e!886883 (as set.empty (Set tuple2!25940)))))

(declare-fun b!1588165 () Bool)

(assert (=> b!1588165 (= e!886883 (set.union (set.insert (h!38565 lt!678291) (as set.empty (Set tuple2!25940))) (content!852 (t!51919 lt!678291))))))

(assert (= (and d!168473 c!147831) b!1588164))

(assert (= (and d!168473 (not c!147831)) b!1588165))

(declare-fun m!1456715 () Bool)

(assert (=> b!1588165 m!1456715))

(assert (=> b!1588165 m!1456697))

(assert (=> d!168409 d!168473))

(declare-fun d!168475 () Bool)

(declare-fun res!1083819 () Bool)

(declare-fun e!886884 () Bool)

(assert (=> d!168475 (=> res!1083819 e!886884)))

(assert (=> d!168475 (= res!1083819 (and (is-Cons!37004 lt!678308) (= (_1!12981 (h!38565 lt!678308)) newKey!21)))))

(assert (=> d!168475 (= (containsKey!1012 lt!678308 newKey!21) e!886884)))

(declare-fun b!1588166 () Bool)

(declare-fun e!886885 () Bool)

(assert (=> b!1588166 (= e!886884 e!886885)))

(declare-fun res!1083820 () Bool)

(assert (=> b!1588166 (=> (not res!1083820) (not e!886885))))

(assert (=> b!1588166 (= res!1083820 (and (or (not (is-Cons!37004 lt!678308)) (bvsle (_1!12981 (h!38565 lt!678308)) newKey!21)) (is-Cons!37004 lt!678308) (bvslt (_1!12981 (h!38565 lt!678308)) newKey!21)))))

(declare-fun b!1588167 () Bool)

(assert (=> b!1588167 (= e!886885 (containsKey!1012 (t!51919 lt!678308) newKey!21))))

(assert (= (and d!168475 (not res!1083819)) b!1588166))

(assert (= (and b!1588166 res!1083820) b!1588167))

(declare-fun m!1456717 () Bool)

(assert (=> b!1588167 m!1456717))

(assert (=> b!1588056 d!168475))

(declare-fun d!168477 () Bool)

(declare-fun res!1083821 () Bool)

(declare-fun e!886886 () Bool)

(assert (=> d!168477 (=> res!1083821 e!886886)))

(assert (=> d!168477 (= res!1083821 (and (is-Cons!37004 (t!51919 lt!678291)) (= (_1!12981 (h!38565 (t!51919 lt!678291))) newKey!21)))))

(assert (=> d!168477 (= (containsKey!1012 (t!51919 lt!678291) newKey!21) e!886886)))

(declare-fun b!1588168 () Bool)

(declare-fun e!886887 () Bool)

(assert (=> b!1588168 (= e!886886 e!886887)))

(declare-fun res!1083822 () Bool)

(assert (=> b!1588168 (=> (not res!1083822) (not e!886887))))

(assert (=> b!1588168 (= res!1083822 (and (or (not (is-Cons!37004 (t!51919 lt!678291))) (bvsle (_1!12981 (h!38565 (t!51919 lt!678291))) newKey!21)) (is-Cons!37004 (t!51919 lt!678291)) (bvslt (_1!12981 (h!38565 (t!51919 lt!678291))) newKey!21)))))

(declare-fun b!1588169 () Bool)

(assert (=> b!1588169 (= e!886887 (containsKey!1012 (t!51919 (t!51919 lt!678291)) newKey!21))))

(assert (= (and d!168477 (not res!1083821)) b!1588168))

(assert (= (and b!1588168 res!1083822) b!1588169))

(declare-fun m!1456719 () Bool)

(assert (=> b!1588169 m!1456719))

(assert (=> b!1588084 d!168477))

(assert (=> b!1587975 d!168461))

(declare-fun lt!678315 () Bool)

(declare-fun d!168479 () Bool)

(assert (=> d!168479 (= lt!678315 (set.member (tuple2!25941 newKey!21 newValue!21) (content!852 lt!678308)))))

(declare-fun e!886888 () Bool)

(assert (=> d!168479 (= lt!678315 e!886888)))

(declare-fun res!1083823 () Bool)

(assert (=> d!168479 (=> (not res!1083823) (not e!886888))))

(assert (=> d!168479 (= res!1083823 (is-Cons!37004 lt!678308))))

(assert (=> d!168479 (= (contains!10579 lt!678308 (tuple2!25941 newKey!21 newValue!21)) lt!678315)))

(declare-fun b!1588170 () Bool)

(declare-fun e!886889 () Bool)

(assert (=> b!1588170 (= e!886888 e!886889)))

(declare-fun res!1083824 () Bool)

(assert (=> b!1588170 (=> res!1083824 e!886889)))

(assert (=> b!1588170 (= res!1083824 (= (h!38565 lt!678308) (tuple2!25941 newKey!21 newValue!21)))))

(declare-fun b!1588171 () Bool)

(assert (=> b!1588171 (= e!886889 (contains!10579 (t!51919 lt!678308) (tuple2!25941 newKey!21 newValue!21)))))

(assert (= (and d!168479 res!1083823) b!1588170))

(assert (= (and b!1588170 (not res!1083824)) b!1588171))

(declare-fun m!1456721 () Bool)

(assert (=> d!168479 m!1456721))

(declare-fun m!1456723 () Bool)

(assert (=> d!168479 m!1456723))

(declare-fun m!1456725 () Bool)

(assert (=> b!1588171 m!1456725))

(assert (=> b!1588059 d!168479))

(declare-fun b!1588172 () Bool)

(declare-fun e!886890 () Bool)

(declare-fun tp!115278 () Bool)

(assert (=> b!1588172 (= e!886890 (and tp_is_empty!39521 tp!115278))))

(assert (=> b!1588099 (= tp!115273 e!886890)))

(assert (= (and b!1588099 (is-Cons!37004 (t!51919 (t!51919 l!556)))) b!1588172))

(push 1)

(assert (not b!1588146))

(assert (not b!1588142))

(assert (not bm!72797))

(assert (not b!1588165))

(assert tp_is_empty!39521)

(assert (not b!1588169))

(assert (not d!168471))

(assert (not b!1588148))

(assert (not b!1588138))

(assert (not d!168479))

(assert (not d!168465))

(assert (not b!1588134))

(assert (not b!1588130))

(assert (not b!1588171))

(assert (not b!1588172))

(assert (not b!1588143))

(assert (not b!1588167))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

