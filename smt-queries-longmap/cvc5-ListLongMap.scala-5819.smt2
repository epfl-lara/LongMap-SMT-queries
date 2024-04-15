; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75032 () Bool)

(assert start!75032)

(declare-fun res!601073 () Bool)

(declare-fun e!492409 () Bool)

(assert (=> start!75032 (=> (not res!601073) (not e!492409))))

(declare-datatypes ((B!1236 0))(
  ( (B!1237 (val!8924 Int)) )
))
(declare-datatypes ((tuple2!11862 0))(
  ( (tuple2!11863 (_1!5942 (_ BitVec 64)) (_2!5942 B!1236)) )
))
(declare-datatypes ((List!17648 0))(
  ( (Nil!17645) (Cons!17644 (h!18775 tuple2!11862) (t!24916 List!17648)) )
))
(declare-datatypes ((ListLongMap!10621 0))(
  ( (ListLongMap!10622 (toList!5326 List!17648)) )
))
(declare-fun lm!210 () ListLongMap!10621)

(declare-fun isStrictlySorted!463 (List!17648) Bool)

(assert (=> start!75032 (= res!601073 (isStrictlySorted!463 (toList!5326 lm!210)))))

(assert (=> start!75032 e!492409))

(declare-fun e!492410 () Bool)

(declare-fun inv!29371 (ListLongMap!10621) Bool)

(assert (=> start!75032 (and (inv!29371 lm!210) e!492410)))

(assert (=> start!75032 true))

(declare-fun tp_is_empty!17747 () Bool)

(assert (=> start!75032 tp_is_empty!17747))

(declare-fun a!500 () (_ BitVec 64))

(declare-fun lt!400660 () tuple2!11862)

(declare-fun b1!76 () B!1236)

(declare-fun b!884794 () Bool)

(declare-fun +!2609 (ListLongMap!10621 tuple2!11862) ListLongMap!10621)

(assert (=> b!884794 (= e!492409 (not (= (+!2609 lm!210 lt!400660) (+!2609 (+!2609 lm!210 (tuple2!11863 a!500 b1!76)) lt!400660))))))

(declare-fun b2!54 () B!1236)

(assert (=> b!884794 (= lt!400660 (tuple2!11863 a!500 b2!54))))

(declare-fun insertStrictlySorted!285 (List!17648 (_ BitVec 64) B!1236) List!17648)

(assert (=> b!884794 (= (insertStrictlySorted!285 (insertStrictlySorted!285 (toList!5326 lm!210) a!500 b1!76) a!500 b2!54) (insertStrictlySorted!285 (toList!5326 lm!210) a!500 b2!54))))

(declare-datatypes ((Unit!30162 0))(
  ( (Unit!30163) )
))
(declare-fun lt!400661 () Unit!30162)

(declare-fun lemmaInsertStrictlySortedErasesIfSameKey!3 (List!17648 (_ BitVec 64) B!1236 B!1236) Unit!30162)

(assert (=> b!884794 (= lt!400661 (lemmaInsertStrictlySortedErasesIfSameKey!3 (toList!5326 lm!210) a!500 b1!76 b2!54))))

(declare-fun b!884795 () Bool)

(declare-fun tp!54219 () Bool)

(assert (=> b!884795 (= e!492410 tp!54219)))

(assert (= (and start!75032 res!601073) b!884794))

(assert (= start!75032 b!884795))

(declare-fun m!824531 () Bool)

(assert (=> start!75032 m!824531))

(declare-fun m!824533 () Bool)

(assert (=> start!75032 m!824533))

(declare-fun m!824535 () Bool)

(assert (=> b!884794 m!824535))

(declare-fun m!824537 () Bool)

(assert (=> b!884794 m!824537))

(declare-fun m!824539 () Bool)

(assert (=> b!884794 m!824539))

(assert (=> b!884794 m!824537))

(declare-fun m!824541 () Bool)

(assert (=> b!884794 m!824541))

(declare-fun m!824543 () Bool)

(assert (=> b!884794 m!824543))

(assert (=> b!884794 m!824541))

(declare-fun m!824545 () Bool)

(assert (=> b!884794 m!824545))

(declare-fun m!824547 () Bool)

(assert (=> b!884794 m!824547))

(push 1)

(assert (not start!75032))

(assert (not b!884794))

(assert (not b!884795))

(assert tp_is_empty!17747)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!109109 () Bool)

(declare-fun res!601078 () Bool)

(declare-fun e!492415 () Bool)

(assert (=> d!109109 (=> res!601078 e!492415)))

(assert (=> d!109109 (= res!601078 (or (is-Nil!17645 (toList!5326 lm!210)) (is-Nil!17645 (t!24916 (toList!5326 lm!210)))))))

(assert (=> d!109109 (= (isStrictlySorted!463 (toList!5326 lm!210)) e!492415)))

(declare-fun b!884800 () Bool)

(declare-fun e!492416 () Bool)

(assert (=> b!884800 (= e!492415 e!492416)))

(declare-fun res!601079 () Bool)

(assert (=> b!884800 (=> (not res!601079) (not e!492416))))

(assert (=> b!884800 (= res!601079 (bvslt (_1!5942 (h!18775 (toList!5326 lm!210))) (_1!5942 (h!18775 (t!24916 (toList!5326 lm!210))))))))

(declare-fun b!884801 () Bool)

(assert (=> b!884801 (= e!492416 (isStrictlySorted!463 (t!24916 (toList!5326 lm!210))))))

(assert (= (and d!109109 (not res!601078)) b!884800))

(assert (= (and b!884800 res!601079) b!884801))

(declare-fun m!824549 () Bool)

(assert (=> b!884801 m!824549))

(assert (=> start!75032 d!109109))

(declare-fun d!109115 () Bool)

(assert (=> d!109115 (= (inv!29371 lm!210) (isStrictlySorted!463 (toList!5326 lm!210)))))

(declare-fun bs!24774 () Bool)

(assert (= bs!24774 d!109115))

(assert (=> bs!24774 m!824531))

(assert (=> start!75032 d!109115))

(declare-fun d!109117 () Bool)

(declare-fun e!492446 () Bool)

(assert (=> d!109117 e!492446))

(declare-fun res!601085 () Bool)

(assert (=> d!109117 (=> (not res!601085) (not e!492446))))

(declare-fun lt!400668 () List!17648)

(assert (=> d!109117 (= res!601085 (isStrictlySorted!463 lt!400668))))

(declare-fun e!492447 () List!17648)

(assert (=> d!109117 (= lt!400668 e!492447)))

(declare-fun c!93145 () Bool)

(assert (=> d!109117 (= c!93145 (and (is-Cons!17644 (toList!5326 lm!210)) (bvslt (_1!5942 (h!18775 (toList!5326 lm!210))) a!500)))))

(assert (=> d!109117 (isStrictlySorted!463 (toList!5326 lm!210))))

(assert (=> d!109117 (= (insertStrictlySorted!285 (toList!5326 lm!210) a!500 b2!54) lt!400668)))

(declare-fun b!884854 () Bool)

(declare-fun call!39015 () List!17648)

(assert (=> b!884854 (= e!492447 call!39015)))

(declare-fun bm!39012 () Bool)

(declare-fun call!39016 () List!17648)

(declare-fun call!39017 () List!17648)

(assert (=> bm!39012 (= call!39016 call!39017)))

(declare-fun b!884855 () Bool)

(declare-fun e!492445 () List!17648)

(assert (=> b!884855 (= e!492447 e!492445)))

(declare-fun c!93147 () Bool)

(assert (=> b!884855 (= c!93147 (and (is-Cons!17644 (toList!5326 lm!210)) (= (_1!5942 (h!18775 (toList!5326 lm!210))) a!500)))))

(declare-fun e!492443 () List!17648)

(declare-fun b!884856 () Bool)

(assert (=> b!884856 (= e!492443 (insertStrictlySorted!285 (t!24916 (toList!5326 lm!210)) a!500 b2!54))))

(declare-fun b!884857 () Bool)

(declare-fun contains!4258 (List!17648 tuple2!11862) Bool)

(assert (=> b!884857 (= e!492446 (contains!4258 lt!400668 (tuple2!11863 a!500 b2!54)))))

(declare-fun bm!39013 () Bool)

(assert (=> bm!39013 (= call!39017 call!39015)))

(declare-fun b!884858 () Bool)

(declare-fun e!492444 () List!17648)

(assert (=> b!884858 (= e!492444 call!39016)))

(declare-fun c!93148 () Bool)

(declare-fun b!884859 () Bool)

(assert (=> b!884859 (= e!492443 (ite c!93147 (t!24916 (toList!5326 lm!210)) (ite c!93148 (Cons!17644 (h!18775 (toList!5326 lm!210)) (t!24916 (toList!5326 lm!210))) Nil!17645)))))

(declare-fun b!884860 () Bool)

(assert (=> b!884860 (= e!492445 call!39017)))

(declare-fun bm!39014 () Bool)

(declare-fun $colon$colon!538 (List!17648 tuple2!11862) List!17648)

(assert (=> bm!39014 (= call!39015 ($colon$colon!538 e!492443 (ite c!93145 (h!18775 (toList!5326 lm!210)) (tuple2!11863 a!500 b2!54))))))

(declare-fun c!93146 () Bool)

(assert (=> bm!39014 (= c!93146 c!93145)))

(declare-fun b!884861 () Bool)

(declare-fun res!601084 () Bool)

(assert (=> b!884861 (=> (not res!601084) (not e!492446))))

(declare-fun containsKey!402 (List!17648 (_ BitVec 64)) Bool)

(assert (=> b!884861 (= res!601084 (containsKey!402 lt!400668 a!500))))

(declare-fun b!884862 () Bool)

(assert (=> b!884862 (= c!93148 (and (is-Cons!17644 (toList!5326 lm!210)) (bvsgt (_1!5942 (h!18775 (toList!5326 lm!210))) a!500)))))

(assert (=> b!884862 (= e!492445 e!492444)))

(declare-fun b!884863 () Bool)

(assert (=> b!884863 (= e!492444 call!39016)))

(assert (= (and d!109117 c!93145) b!884854))

(assert (= (and d!109117 (not c!93145)) b!884855))

(assert (= (and b!884855 c!93147) b!884860))

(assert (= (and b!884855 (not c!93147)) b!884862))

(assert (= (and b!884862 c!93148) b!884863))

(assert (= (and b!884862 (not c!93148)) b!884858))

(assert (= (or b!884863 b!884858) bm!39012))

(assert (= (or b!884860 bm!39012) bm!39013))

(assert (= (or b!884854 bm!39013) bm!39014))

(assert (= (and bm!39014 c!93146) b!884856))

(assert (= (and bm!39014 (not c!93146)) b!884859))

(assert (= (and d!109117 res!601085) b!884861))

(assert (= (and b!884861 res!601084) b!884857))

(declare-fun m!824551 () Bool)

(assert (=> b!884856 m!824551))

(declare-fun m!824553 () Bool)

(assert (=> b!884857 m!824553))

(declare-fun m!824555 () Bool)

(assert (=> bm!39014 m!824555))

(declare-fun m!824557 () Bool)

(assert (=> d!109117 m!824557))

(assert (=> d!109117 m!824531))

(declare-fun m!824559 () Bool)

(assert (=> b!884861 m!824559))

(assert (=> b!884794 d!109117))

(declare-fun d!109119 () Bool)

(declare-fun e!492464 () Bool)

(assert (=> d!109119 e!492464))

(declare-fun res!601102 () Bool)

(assert (=> d!109119 (=> (not res!601102) (not e!492464))))

(declare-fun lt!400680 () ListLongMap!10621)

(declare-fun contains!4259 (ListLongMap!10621 (_ BitVec 64)) Bool)

(assert (=> d!109119 (= res!601102 (contains!4259 lt!400680 (_1!5942 (tuple2!11863 a!500 b1!76))))))

(declare-fun lt!400682 () List!17648)

(assert (=> d!109119 (= lt!400680 (ListLongMap!10622 lt!400682))))

(declare-fun lt!400681 () Unit!30162)

(declare-fun lt!400679 () Unit!30162)

(assert (=> d!109119 (= lt!400681 lt!400679)))

(declare-datatypes ((Option!433 0))(
  ( (Some!432 (v!11387 B!1236)) (None!431) )
))
(declare-fun getValueByKey!427 (List!17648 (_ BitVec 64)) Option!433)

(assert (=> d!109119 (= (getValueByKey!427 lt!400682 (_1!5942 (tuple2!11863 a!500 b1!76))) (Some!432 (_2!5942 (tuple2!11863 a!500 b1!76))))))

(declare-fun lemmaContainsTupThenGetReturnValue!244 (List!17648 (_ BitVec 64) B!1236) Unit!30162)

(assert (=> d!109119 (= lt!400679 (lemmaContainsTupThenGetReturnValue!244 lt!400682 (_1!5942 (tuple2!11863 a!500 b1!76)) (_2!5942 (tuple2!11863 a!500 b1!76))))))

(assert (=> d!109119 (= lt!400682 (insertStrictlySorted!285 (toList!5326 lm!210) (_1!5942 (tuple2!11863 a!500 b1!76)) (_2!5942 (tuple2!11863 a!500 b1!76))))))

(assert (=> d!109119 (= (+!2609 lm!210 (tuple2!11863 a!500 b1!76)) lt!400680)))

(declare-fun b!884896 () Bool)

(declare-fun res!601103 () Bool)

(assert (=> b!884896 (=> (not res!601103) (not e!492464))))

(assert (=> b!884896 (= res!601103 (= (getValueByKey!427 (toList!5326 lt!400680) (_1!5942 (tuple2!11863 a!500 b1!76))) (Some!432 (_2!5942 (tuple2!11863 a!500 b1!76)))))))

(declare-fun b!884897 () Bool)

(assert (=> b!884897 (= e!492464 (contains!4258 (toList!5326 lt!400680) (tuple2!11863 a!500 b1!76)))))

(assert (= (and d!109119 res!601102) b!884896))

(assert (= (and b!884896 res!601103) b!884897))

(declare-fun m!824581 () Bool)

(assert (=> d!109119 m!824581))

(declare-fun m!824583 () Bool)

(assert (=> d!109119 m!824583))

(declare-fun m!824585 () Bool)

(assert (=> d!109119 m!824585))

(declare-fun m!824587 () Bool)

(assert (=> d!109119 m!824587))

(declare-fun m!824589 () Bool)

(assert (=> b!884896 m!824589))

(declare-fun m!824591 () Bool)

(assert (=> b!884897 m!824591))

(assert (=> b!884794 d!109119))

(declare-fun d!109125 () Bool)

(assert (=> d!109125 (= (insertStrictlySorted!285 (insertStrictlySorted!285 (toList!5326 lm!210) a!500 b1!76) a!500 b2!54) (insertStrictlySorted!285 (toList!5326 lm!210) a!500 b2!54))))

(declare-fun lt!400685 () Unit!30162)

(declare-fun choose!1453 (List!17648 (_ BitVec 64) B!1236 B!1236) Unit!30162)

(assert (=> d!109125 (= lt!400685 (choose!1453 (toList!5326 lm!210) a!500 b1!76 b2!54))))

(assert (=> d!109125 (isStrictlySorted!463 (toList!5326 lm!210))))

(assert (=> d!109125 (= (lemmaInsertStrictlySortedErasesIfSameKey!3 (toList!5326 lm!210) a!500 b1!76 b2!54) lt!400685)))

(declare-fun bs!24775 () Bool)

(assert (= bs!24775 d!109125))

(assert (=> bs!24775 m!824547))

(assert (=> bs!24775 m!824537))

(declare-fun m!824593 () Bool)

(assert (=> bs!24775 m!824593))

(assert (=> bs!24775 m!824531))

(assert (=> bs!24775 m!824537))

(assert (=> bs!24775 m!824539))

(assert (=> b!884794 d!109125))

(declare-fun d!109127 () Bool)

(declare-fun e!492465 () Bool)

(assert (=> d!109127 e!492465))

(declare-fun res!601104 () Bool)

(assert (=> d!109127 (=> (not res!601104) (not e!492465))))

(declare-fun lt!400687 () ListLongMap!10621)

(assert (=> d!109127 (= res!601104 (contains!4259 lt!400687 (_1!5942 lt!400660)))))

(declare-fun lt!400689 () List!17648)

(assert (=> d!109127 (= lt!400687 (ListLongMap!10622 lt!400689))))

(declare-fun lt!400688 () Unit!30162)

(declare-fun lt!400686 () Unit!30162)

(assert (=> d!109127 (= lt!400688 lt!400686)))

(assert (=> d!109127 (= (getValueByKey!427 lt!400689 (_1!5942 lt!400660)) (Some!432 (_2!5942 lt!400660)))))

(assert (=> d!109127 (= lt!400686 (lemmaContainsTupThenGetReturnValue!244 lt!400689 (_1!5942 lt!400660) (_2!5942 lt!400660)))))

(assert (=> d!109127 (= lt!400689 (insertStrictlySorted!285 (toList!5326 (+!2609 lm!210 (tuple2!11863 a!500 b1!76))) (_1!5942 lt!400660) (_2!5942 lt!400660)))))

(assert (=> d!109127 (= (+!2609 (+!2609 lm!210 (tuple2!11863 a!500 b1!76)) lt!400660) lt!400687)))

(declare-fun b!884898 () Bool)

(declare-fun res!601105 () Bool)

(assert (=> b!884898 (=> (not res!601105) (not e!492465))))

(assert (=> b!884898 (= res!601105 (= (getValueByKey!427 (toList!5326 lt!400687) (_1!5942 lt!400660)) (Some!432 (_2!5942 lt!400660))))))

(declare-fun b!884899 () Bool)

(assert (=> b!884899 (= e!492465 (contains!4258 (toList!5326 lt!400687) lt!400660))))

(assert (= (and d!109127 res!601104) b!884898))

(assert (= (and b!884898 res!601105) b!884899))

(declare-fun m!824595 () Bool)

(assert (=> d!109127 m!824595))

(declare-fun m!824597 () Bool)

(assert (=> d!109127 m!824597))

(declare-fun m!824599 () Bool)

(assert (=> d!109127 m!824599))

(declare-fun m!824601 () Bool)

(assert (=> d!109127 m!824601))

(declare-fun m!824603 () Bool)

(assert (=> b!884898 m!824603))

(declare-fun m!824605 () Bool)

(assert (=> b!884899 m!824605))

(assert (=> b!884794 d!109127))

(declare-fun d!109129 () Bool)

(declare-fun e!492466 () Bool)

(assert (=> d!109129 e!492466))

(declare-fun res!601106 () Bool)

(assert (=> d!109129 (=> (not res!601106) (not e!492466))))

(declare-fun lt!400691 () ListLongMap!10621)

(assert (=> d!109129 (= res!601106 (contains!4259 lt!400691 (_1!5942 lt!400660)))))

(declare-fun lt!400693 () List!17648)

(assert (=> d!109129 (= lt!400691 (ListLongMap!10622 lt!400693))))

(declare-fun lt!400692 () Unit!30162)

(declare-fun lt!400690 () Unit!30162)

(assert (=> d!109129 (= lt!400692 lt!400690)))

(assert (=> d!109129 (= (getValueByKey!427 lt!400693 (_1!5942 lt!400660)) (Some!432 (_2!5942 lt!400660)))))

(assert (=> d!109129 (= lt!400690 (lemmaContainsTupThenGetReturnValue!244 lt!400693 (_1!5942 lt!400660) (_2!5942 lt!400660)))))

(assert (=> d!109129 (= lt!400693 (insertStrictlySorted!285 (toList!5326 lm!210) (_1!5942 lt!400660) (_2!5942 lt!400660)))))

(assert (=> d!109129 (= (+!2609 lm!210 lt!400660) lt!400691)))

(declare-fun b!884900 () Bool)

(declare-fun res!601107 () Bool)

(assert (=> b!884900 (=> (not res!601107) (not e!492466))))

(assert (=> b!884900 (= res!601107 (= (getValueByKey!427 (toList!5326 lt!400691) (_1!5942 lt!400660)) (Some!432 (_2!5942 lt!400660))))))

(declare-fun b!884901 () Bool)

(assert (=> b!884901 (= e!492466 (contains!4258 (toList!5326 lt!400691) lt!400660))))

(assert (= (and d!109129 res!601106) b!884900))

(assert (= (and b!884900 res!601107) b!884901))

(declare-fun m!824607 () Bool)

(assert (=> d!109129 m!824607))

(declare-fun m!824609 () Bool)

(assert (=> d!109129 m!824609))

(declare-fun m!824611 () Bool)

(assert (=> d!109129 m!824611))

(declare-fun m!824613 () Bool)

(assert (=> d!109129 m!824613))

(declare-fun m!824615 () Bool)

(assert (=> b!884900 m!824615))

(declare-fun m!824617 () Bool)

(assert (=> b!884901 m!824617))

(assert (=> b!884794 d!109129))

(declare-fun d!109131 () Bool)

(declare-fun e!492470 () Bool)

(assert (=> d!109131 e!492470))

(declare-fun res!601109 () Bool)

(assert (=> d!109131 (=> (not res!601109) (not e!492470))))

(declare-fun lt!400694 () List!17648)

(assert (=> d!109131 (= res!601109 (isStrictlySorted!463 lt!400694))))

(declare-fun e!492471 () List!17648)

(assert (=> d!109131 (= lt!400694 e!492471)))

(declare-fun c!93157 () Bool)

(assert (=> d!109131 (= c!93157 (and (is-Cons!17644 (toList!5326 lm!210)) (bvslt (_1!5942 (h!18775 (toList!5326 lm!210))) a!500)))))

(assert (=> d!109131 (isStrictlySorted!463 (toList!5326 lm!210))))

(assert (=> d!109131 (= (insertStrictlySorted!285 (toList!5326 lm!210) a!500 b1!76) lt!400694)))

(declare-fun b!884902 () Bool)

(declare-fun call!39024 () List!17648)

(assert (=> b!884902 (= e!492471 call!39024)))

(declare-fun bm!39021 () Bool)

(declare-fun call!39025 () List!17648)

(declare-fun call!39026 () List!17648)

(assert (=> bm!39021 (= call!39025 call!39026)))

(declare-fun b!884903 () Bool)

(declare-fun e!492469 () List!17648)

(assert (=> b!884903 (= e!492471 e!492469)))

(declare-fun c!93159 () Bool)

(assert (=> b!884903 (= c!93159 (and (is-Cons!17644 (toList!5326 lm!210)) (= (_1!5942 (h!18775 (toList!5326 lm!210))) a!500)))))

(declare-fun b!884904 () Bool)

(declare-fun e!492467 () List!17648)

(assert (=> b!884904 (= e!492467 (insertStrictlySorted!285 (t!24916 (toList!5326 lm!210)) a!500 b1!76))))

(declare-fun b!884905 () Bool)

(assert (=> b!884905 (= e!492470 (contains!4258 lt!400694 (tuple2!11863 a!500 b1!76)))))

(declare-fun bm!39022 () Bool)

(assert (=> bm!39022 (= call!39026 call!39024)))

(declare-fun b!884906 () Bool)

(declare-fun e!492468 () List!17648)

(assert (=> b!884906 (= e!492468 call!39025)))

(declare-fun c!93160 () Bool)

(declare-fun b!884907 () Bool)

(assert (=> b!884907 (= e!492467 (ite c!93159 (t!24916 (toList!5326 lm!210)) (ite c!93160 (Cons!17644 (h!18775 (toList!5326 lm!210)) (t!24916 (toList!5326 lm!210))) Nil!17645)))))

(declare-fun b!884908 () Bool)

(assert (=> b!884908 (= e!492469 call!39026)))

(declare-fun bm!39023 () Bool)

(assert (=> bm!39023 (= call!39024 ($colon$colon!538 e!492467 (ite c!93157 (h!18775 (toList!5326 lm!210)) (tuple2!11863 a!500 b1!76))))))

(declare-fun c!93158 () Bool)

(assert (=> bm!39023 (= c!93158 c!93157)))

(declare-fun b!884909 () Bool)

(declare-fun res!601108 () Bool)

(assert (=> b!884909 (=> (not res!601108) (not e!492470))))

(assert (=> b!884909 (= res!601108 (containsKey!402 lt!400694 a!500))))

(declare-fun b!884910 () Bool)

(assert (=> b!884910 (= c!93160 (and (is-Cons!17644 (toList!5326 lm!210)) (bvsgt (_1!5942 (h!18775 (toList!5326 lm!210))) a!500)))))

(assert (=> b!884910 (= e!492469 e!492468)))

(declare-fun b!884911 () Bool)

(assert (=> b!884911 (= e!492468 call!39025)))

(assert (= (and d!109131 c!93157) b!884902))

(assert (= (and d!109131 (not c!93157)) b!884903))

(assert (= (and b!884903 c!93159) b!884908))

(assert (= (and b!884903 (not c!93159)) b!884910))

(assert (= (and b!884910 c!93160) b!884911))

(assert (= (and b!884910 (not c!93160)) b!884906))

(assert (= (or b!884911 b!884906) bm!39021))

(assert (= (or b!884908 bm!39021) bm!39022))

(assert (= (or b!884902 bm!39022) bm!39023))

(assert (= (and bm!39023 c!93158) b!884904))

(assert (= (and bm!39023 (not c!93158)) b!884907))

(assert (= (and d!109131 res!601109) b!884909))

(assert (= (and b!884909 res!601108) b!884905))

(declare-fun m!824619 () Bool)

(assert (=> b!884904 m!824619))

(declare-fun m!824621 () Bool)

(assert (=> b!884905 m!824621))

(declare-fun m!824623 () Bool)

(assert (=> bm!39023 m!824623))

(declare-fun m!824625 () Bool)

(assert (=> d!109131 m!824625))

(assert (=> d!109131 m!824531))

(declare-fun m!824627 () Bool)

(assert (=> b!884909 m!824627))

(assert (=> b!884794 d!109131))

(declare-fun d!109133 () Bool)

(declare-fun e!492479 () Bool)

(assert (=> d!109133 e!492479))

(declare-fun res!601119 () Bool)

(assert (=> d!109133 (=> (not res!601119) (not e!492479))))

(declare-fun lt!400711 () List!17648)

(assert (=> d!109133 (= res!601119 (isStrictlySorted!463 lt!400711))))

(declare-fun e!492480 () List!17648)

(assert (=> d!109133 (= lt!400711 e!492480)))

(declare-fun c!93161 () Bool)

(assert (=> d!109133 (= c!93161 (and (is-Cons!17644 (insertStrictlySorted!285 (toList!5326 lm!210) a!500 b1!76)) (bvslt (_1!5942 (h!18775 (insertStrictlySorted!285 (toList!5326 lm!210) a!500 b1!76))) a!500)))))

(assert (=> d!109133 (isStrictlySorted!463 (insertStrictlySorted!285 (toList!5326 lm!210) a!500 b1!76))))

(assert (=> d!109133 (= (insertStrictlySorted!285 (insertStrictlySorted!285 (toList!5326 lm!210) a!500 b1!76) a!500 b2!54) lt!400711)))

(declare-fun b!884920 () Bool)

(declare-fun call!39027 () List!17648)

(assert (=> b!884920 (= e!492480 call!39027)))

(declare-fun bm!39024 () Bool)

(declare-fun call!39028 () List!17648)

(declare-fun call!39029 () List!17648)

(assert (=> bm!39024 (= call!39028 call!39029)))

(declare-fun b!884921 () Bool)

(declare-fun e!492478 () List!17648)

(assert (=> b!884921 (= e!492480 e!492478)))

(declare-fun c!93163 () Bool)

(assert (=> b!884921 (= c!93163 (and (is-Cons!17644 (insertStrictlySorted!285 (toList!5326 lm!210) a!500 b1!76)) (= (_1!5942 (h!18775 (insertStrictlySorted!285 (toList!5326 lm!210) a!500 b1!76))) a!500)))))

(declare-fun e!492476 () List!17648)

(declare-fun b!884922 () Bool)

(assert (=> b!884922 (= e!492476 (insertStrictlySorted!285 (t!24916 (insertStrictlySorted!285 (toList!5326 lm!210) a!500 b1!76)) a!500 b2!54))))

(declare-fun b!884923 () Bool)

(assert (=> b!884923 (= e!492479 (contains!4258 lt!400711 (tuple2!11863 a!500 b2!54)))))

(declare-fun bm!39025 () Bool)

(assert (=> bm!39025 (= call!39029 call!39027)))

(declare-fun b!884924 () Bool)

(declare-fun e!492477 () List!17648)

(assert (=> b!884924 (= e!492477 call!39028)))

(declare-fun b!884925 () Bool)

(declare-fun c!93164 () Bool)

(assert (=> b!884925 (= e!492476 (ite c!93163 (t!24916 (insertStrictlySorted!285 (toList!5326 lm!210) a!500 b1!76)) (ite c!93164 (Cons!17644 (h!18775 (insertStrictlySorted!285 (toList!5326 lm!210) a!500 b1!76)) (t!24916 (insertStrictlySorted!285 (toList!5326 lm!210) a!500 b1!76))) Nil!17645)))))

(declare-fun b!884926 () Bool)

(assert (=> b!884926 (= e!492478 call!39029)))

(declare-fun bm!39026 () Bool)

(assert (=> bm!39026 (= call!39027 ($colon$colon!538 e!492476 (ite c!93161 (h!18775 (insertStrictlySorted!285 (toList!5326 lm!210) a!500 b1!76)) (tuple2!11863 a!500 b2!54))))))

(declare-fun c!93162 () Bool)

(assert (=> bm!39026 (= c!93162 c!93161)))

(declare-fun b!884927 () Bool)

(declare-fun res!601118 () Bool)

(assert (=> b!884927 (=> (not res!601118) (not e!492479))))

(assert (=> b!884927 (= res!601118 (containsKey!402 lt!400711 a!500))))

(declare-fun b!884928 () Bool)

(assert (=> b!884928 (= c!93164 (and (is-Cons!17644 (insertStrictlySorted!285 (toList!5326 lm!210) a!500 b1!76)) (bvsgt (_1!5942 (h!18775 (insertStrictlySorted!285 (toList!5326 lm!210) a!500 b1!76))) a!500)))))

(assert (=> b!884928 (= e!492478 e!492477)))

(declare-fun b!884929 () Bool)

(assert (=> b!884929 (= e!492477 call!39028)))

(assert (= (and d!109133 c!93161) b!884920))

(assert (= (and d!109133 (not c!93161)) b!884921))

(assert (= (and b!884921 c!93163) b!884926))

(assert (= (and b!884921 (not c!93163)) b!884928))

(assert (= (and b!884928 c!93164) b!884929))

(assert (= (and b!884928 (not c!93164)) b!884924))

(assert (= (or b!884929 b!884924) bm!39024))

(assert (= (or b!884926 bm!39024) bm!39025))

(assert (= (or b!884920 bm!39025) bm!39026))

(assert (= (and bm!39026 c!93162) b!884922))

(assert (= (and bm!39026 (not c!93162)) b!884925))

(assert (= (and d!109133 res!601119) b!884927))

(assert (= (and b!884927 res!601118) b!884923))

(declare-fun m!824629 () Bool)

(assert (=> b!884922 m!824629))

(declare-fun m!824631 () Bool)

(assert (=> b!884923 m!824631))

(declare-fun m!824633 () Bool)

(assert (=> bm!39026 m!824633))

(declare-fun m!824635 () Bool)

(assert (=> d!109133 m!824635))

(assert (=> d!109133 m!824537))

(declare-fun m!824637 () Bool)

(assert (=> d!109133 m!824637))

(declare-fun m!824639 () Bool)

(assert (=> b!884927 m!824639))

(assert (=> b!884794 d!109133))

(declare-fun b!884934 () Bool)

(declare-fun e!492483 () Bool)

(declare-fun tp!54222 () Bool)

(assert (=> b!884934 (= e!492483 (and tp_is_empty!17747 tp!54222))))

(assert (=> b!884795 (= tp!54219 e!492483)))

(assert (= (and b!884795 (is-Cons!17644 (toList!5326 lm!210))) b!884934))

(push 1)

(assert (not b!884896))

(assert (not d!109133))

(assert (not b!884857))

(assert (not b!884900))

(assert (not b!884923))

(assert (not bm!39026))

(assert (not d!109129))

(assert (not b!884904))

(assert (not bm!39014))

(assert (not d!109125))

(assert (not d!109127))

(assert (not b!884897))

(assert (not b!884898))

(assert (not bm!39023))

(assert (not b!884861))

(assert (not b!884901))

(assert (not b!884899))

(assert (not b!884927))

(assert tp_is_empty!17747)

(assert (not b!884922))

(assert (not d!109131))

(assert (not b!884856))

(assert (not b!884801))

(assert (not d!109119))

(assert (not b!884905))

(assert (not d!109115))

(assert (not d!109117))

(assert (not b!884909))

(assert (not b!884934))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

