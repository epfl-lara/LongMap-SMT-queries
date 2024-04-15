; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7720 () Bool)

(assert start!7720)

(declare-fun b!49067 () Bool)

(declare-fun res!28472 () Bool)

(declare-fun e!31512 () Bool)

(assert (=> b!49067 (=> (not res!28472) (not e!31512))))

(declare-datatypes ((B!990 0))(
  ( (B!991 (val!1115 Int)) )
))
(declare-datatypes ((tuple2!1816 0))(
  ( (tuple2!1817 (_1!919 (_ BitVec 64)) (_2!919 B!990)) )
))
(declare-datatypes ((List!1308 0))(
  ( (Nil!1305) (Cons!1304 (h!1884 tuple2!1816) (t!4338 List!1308)) )
))
(declare-fun l!1333 () List!1308)

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!123 (List!1308 (_ BitVec 64)) Bool)

(assert (=> b!49067 (= res!28472 (not (containsKey!123 l!1333 newKey!147)))))

(declare-fun b!49068 () Bool)

(declare-fun res!28473 () Bool)

(assert (=> b!49068 (=> (not res!28473) (not e!31512))))

(assert (=> b!49068 (= res!28473 (not (is-Nil!1305 l!1333)))))

(declare-fun b!49069 () Bool)

(declare-fun newValue!147 () B!990)

(declare-fun content!54 (List!1308) (Set tuple2!1816))

(declare-fun insertStrictlySorted!40 (List!1308 (_ BitVec 64) B!990) List!1308)

(assert (=> b!49069 (= e!31512 (not (= (set.union (content!54 l!1333) (set.insert (tuple2!1817 newKey!147 newValue!147) (as set.empty (Set tuple2!1816)))) (content!54 (insertStrictlySorted!40 l!1333 newKey!147 newValue!147)))))))

(declare-datatypes ((Unit!1378 0))(
  ( (Unit!1379) )
))
(declare-fun lt!20707 () Unit!1378)

(declare-fun lemmaInsertStrictlySortedNotContainedContent!9 (List!1308 (_ BitVec 64) B!990) Unit!1378)

(assert (=> b!49069 (= lt!20707 (lemmaInsertStrictlySortedNotContainedContent!9 (t!4338 l!1333) newKey!147 newValue!147))))

(declare-fun b!49070 () Bool)

(declare-fun e!31511 () Bool)

(declare-fun tp_is_empty!2141 () Bool)

(declare-fun tp!6500 () Bool)

(assert (=> b!49070 (= e!31511 (and tp_is_empty!2141 tp!6500))))

(declare-fun res!28471 () Bool)

(assert (=> start!7720 (=> (not res!28471) (not e!31512))))

(declare-fun isStrictlySorted!271 (List!1308) Bool)

(assert (=> start!7720 (= res!28471 (isStrictlySorted!271 l!1333))))

(assert (=> start!7720 e!31512))

(assert (=> start!7720 e!31511))

(assert (=> start!7720 true))

(assert (=> start!7720 tp_is_empty!2141))

(assert (= (and start!7720 res!28471) b!49067))

(assert (= (and b!49067 res!28472) b!49068))

(assert (= (and b!49068 res!28473) b!49069))

(assert (= (and start!7720 (is-Cons!1304 l!1333)) b!49070))

(declare-fun m!42555 () Bool)

(assert (=> b!49067 m!42555))

(declare-fun m!42557 () Bool)

(assert (=> b!49069 m!42557))

(declare-fun m!42559 () Bool)

(assert (=> b!49069 m!42559))

(declare-fun m!42561 () Bool)

(assert (=> b!49069 m!42561))

(assert (=> b!49069 m!42561))

(declare-fun m!42563 () Bool)

(assert (=> b!49069 m!42563))

(declare-fun m!42565 () Bool)

(assert (=> b!49069 m!42565))

(declare-fun m!42567 () Bool)

(assert (=> start!7720 m!42567))

(push 1)

(assert (not start!7720))

(assert tp_is_empty!2141)

(assert (not b!49067))

(assert (not b!49069))

(assert (not b!49070))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9765 () Bool)

(declare-fun res!28484 () Bool)

(declare-fun e!31527 () Bool)

(assert (=> d!9765 (=> res!28484 e!31527)))

(assert (=> d!9765 (= res!28484 (and (is-Cons!1304 l!1333) (= (_1!919 (h!1884 l!1333)) newKey!147)))))

(assert (=> d!9765 (= (containsKey!123 l!1333 newKey!147) e!31527)))

(declare-fun b!49089 () Bool)

(declare-fun e!31528 () Bool)

(assert (=> b!49089 (= e!31527 e!31528)))

(declare-fun res!28485 () Bool)

(assert (=> b!49089 (=> (not res!28485) (not e!31528))))

(assert (=> b!49089 (= res!28485 (and (or (not (is-Cons!1304 l!1333)) (bvsle (_1!919 (h!1884 l!1333)) newKey!147)) (is-Cons!1304 l!1333) (bvslt (_1!919 (h!1884 l!1333)) newKey!147)))))

(declare-fun b!49090 () Bool)

(assert (=> b!49090 (= e!31528 (containsKey!123 (t!4338 l!1333) newKey!147))))

(assert (= (and d!9765 (not res!28484)) b!49089))

(assert (= (and b!49089 res!28485) b!49090))

(declare-fun m!42579 () Bool)

(assert (=> b!49090 m!42579))

(assert (=> b!49067 d!9765))

(declare-fun d!9773 () Bool)

(declare-fun res!28494 () Bool)

(declare-fun e!31537 () Bool)

(assert (=> d!9773 (=> res!28494 e!31537)))

(assert (=> d!9773 (= res!28494 (or (is-Nil!1305 l!1333) (is-Nil!1305 (t!4338 l!1333))))))

(assert (=> d!9773 (= (isStrictlySorted!271 l!1333) e!31537)))

(declare-fun b!49099 () Bool)

(declare-fun e!31538 () Bool)

(assert (=> b!49099 (= e!31537 e!31538)))

(declare-fun res!28495 () Bool)

(assert (=> b!49099 (=> (not res!28495) (not e!31538))))

(assert (=> b!49099 (= res!28495 (bvslt (_1!919 (h!1884 l!1333)) (_1!919 (h!1884 (t!4338 l!1333)))))))

(declare-fun b!49100 () Bool)

(assert (=> b!49100 (= e!31538 (isStrictlySorted!271 (t!4338 l!1333)))))

(assert (= (and d!9773 (not res!28494)) b!49099))

(assert (= (and b!49099 res!28495) b!49100))

(declare-fun m!42581 () Bool)

(assert (=> b!49100 m!42581))

(assert (=> start!7720 d!9773))

(declare-fun d!9775 () Bool)

(declare-fun c!6592 () Bool)

(assert (=> d!9775 (= c!6592 (is-Nil!1305 l!1333))))

(declare-fun e!31545 () (Set tuple2!1816))

(assert (=> d!9775 (= (content!54 l!1333) e!31545)))

(declare-fun b!49111 () Bool)

(assert (=> b!49111 (= e!31545 (as set.empty (Set tuple2!1816)))))

(declare-fun b!49112 () Bool)

(assert (=> b!49112 (= e!31545 (set.union (set.insert (h!1884 l!1333) (as set.empty (Set tuple2!1816))) (content!54 (t!4338 l!1333))))))

(assert (= (and d!9775 c!6592) b!49111))

(assert (= (and d!9775 (not c!6592)) b!49112))

(declare-fun m!42585 () Bool)

(assert (=> b!49112 m!42585))

(declare-fun m!42587 () Bool)

(assert (=> b!49112 m!42587))

(assert (=> b!49069 d!9775))

(declare-fun c!6594 () Bool)

(declare-fun d!9779 () Bool)

(assert (=> d!9779 (= c!6594 (is-Nil!1305 (insertStrictlySorted!40 l!1333 newKey!147 newValue!147)))))

(declare-fun e!31547 () (Set tuple2!1816))

(assert (=> d!9779 (= (content!54 (insertStrictlySorted!40 l!1333 newKey!147 newValue!147)) e!31547)))

(declare-fun b!49115 () Bool)

(assert (=> b!49115 (= e!31547 (as set.empty (Set tuple2!1816)))))

(declare-fun b!49116 () Bool)

(assert (=> b!49116 (= e!31547 (set.union (set.insert (h!1884 (insertStrictlySorted!40 l!1333 newKey!147 newValue!147)) (as set.empty (Set tuple2!1816))) (content!54 (t!4338 (insertStrictlySorted!40 l!1333 newKey!147 newValue!147)))))))

(assert (= (and d!9779 c!6594) b!49115))

(assert (= (and d!9779 (not c!6594)) b!49116))

(declare-fun m!42593 () Bool)

(assert (=> b!49116 m!42593))

(declare-fun m!42595 () Bool)

(assert (=> b!49116 m!42595))

(assert (=> b!49069 d!9779))

(declare-fun b!49189 () Bool)

(declare-fun e!31586 () List!1308)

(declare-fun e!31584 () List!1308)

(assert (=> b!49189 (= e!31586 e!31584)))

(declare-fun c!6626 () Bool)

(assert (=> b!49189 (= c!6626 (and (is-Cons!1304 l!1333) (= (_1!919 (h!1884 l!1333)) newKey!147)))))

(declare-fun b!49190 () Bool)

(declare-fun call!3831 () List!1308)

(assert (=> b!49190 (= e!31586 call!3831)))

(declare-fun b!49191 () Bool)

(declare-fun res!28513 () Bool)

(declare-fun e!31588 () Bool)

(assert (=> b!49191 (=> (not res!28513) (not e!31588))))

(declare-fun lt!20718 () List!1308)

(assert (=> b!49191 (= res!28513 (containsKey!123 lt!20718 newKey!147))))

(declare-fun b!49192 () Bool)

(declare-fun e!31587 () List!1308)

(declare-fun call!3830 () List!1308)

(assert (=> b!49192 (= e!31587 call!3830)))

(declare-fun bm!3826 () Bool)

(declare-fun call!3829 () List!1308)

(assert (=> bm!3826 (= call!3830 call!3829)))

(declare-fun b!49193 () Bool)

(declare-fun c!6625 () Bool)

(declare-fun e!31585 () List!1308)

(assert (=> b!49193 (= e!31585 (ite c!6626 (t!4338 l!1333) (ite c!6625 (Cons!1304 (h!1884 l!1333) (t!4338 l!1333)) Nil!1305)))))

(declare-fun d!9783 () Bool)

(assert (=> d!9783 e!31588))

(declare-fun res!28512 () Bool)

(assert (=> d!9783 (=> (not res!28512) (not e!31588))))

(assert (=> d!9783 (= res!28512 (isStrictlySorted!271 lt!20718))))

(assert (=> d!9783 (= lt!20718 e!31586)))

(declare-fun c!6627 () Bool)

(assert (=> d!9783 (= c!6627 (and (is-Cons!1304 l!1333) (bvslt (_1!919 (h!1884 l!1333)) newKey!147)))))

(assert (=> d!9783 (isStrictlySorted!271 l!1333)))

(assert (=> d!9783 (= (insertStrictlySorted!40 l!1333 newKey!147 newValue!147) lt!20718)))

(declare-fun b!49194 () Bool)

(assert (=> b!49194 (= e!31585 (insertStrictlySorted!40 (t!4338 l!1333) newKey!147 newValue!147))))

(declare-fun bm!3827 () Bool)

(assert (=> bm!3827 (= call!3829 call!3831)))

(declare-fun b!49195 () Bool)

(assert (=> b!49195 (= c!6625 (and (is-Cons!1304 l!1333) (bvsgt (_1!919 (h!1884 l!1333)) newKey!147)))))

(assert (=> b!49195 (= e!31584 e!31587)))

(declare-fun b!49196 () Bool)

(assert (=> b!49196 (= e!31584 call!3829)))

(declare-fun b!49197 () Bool)

(declare-fun contains!608 (List!1308 tuple2!1816) Bool)

(assert (=> b!49197 (= e!31588 (contains!608 lt!20718 (tuple2!1817 newKey!147 newValue!147)))))

(declare-fun b!49198 () Bool)

(assert (=> b!49198 (= e!31587 call!3830)))

(declare-fun bm!3828 () Bool)

(declare-fun $colon$colon!56 (List!1308 tuple2!1816) List!1308)

(assert (=> bm!3828 (= call!3831 ($colon$colon!56 e!31585 (ite c!6627 (h!1884 l!1333) (tuple2!1817 newKey!147 newValue!147))))))

(declare-fun c!6624 () Bool)

(assert (=> bm!3828 (= c!6624 c!6627)))

(assert (= (and d!9783 c!6627) b!49190))

(assert (= (and d!9783 (not c!6627)) b!49189))

(assert (= (and b!49189 c!6626) b!49196))

(assert (= (and b!49189 (not c!6626)) b!49195))

(assert (= (and b!49195 c!6625) b!49198))

(assert (= (and b!49195 (not c!6625)) b!49192))

(assert (= (or b!49198 b!49192) bm!3826))

(assert (= (or b!49196 bm!3826) bm!3827))

(assert (= (or b!49190 bm!3827) bm!3828))

(assert (= (and bm!3828 c!6624) b!49194))

(assert (= (and bm!3828 (not c!6624)) b!49193))

(assert (= (and d!9783 res!28512) b!49191))

(assert (= (and b!49191 res!28513) b!49197))

(declare-fun m!42617 () Bool)

(assert (=> b!49197 m!42617))

(declare-fun m!42619 () Bool)

(assert (=> b!49191 m!42619))

(declare-fun m!42623 () Bool)

(assert (=> bm!3828 m!42623))

(declare-fun m!42625 () Bool)

(assert (=> d!9783 m!42625))

(assert (=> d!9783 m!42567))

(declare-fun m!42629 () Bool)

(assert (=> b!49194 m!42629))

(assert (=> b!49069 d!9783))

(declare-fun d!9791 () Bool)

(assert (=> d!9791 (= (set.union (content!54 (t!4338 l!1333)) (set.insert (tuple2!1817 newKey!147 newValue!147) (as set.empty (Set tuple2!1816)))) (content!54 (insertStrictlySorted!40 (t!4338 l!1333) newKey!147 newValue!147)))))

(declare-fun lt!20724 () Unit!1378)

(declare-fun choose!291 (List!1308 (_ BitVec 64) B!990) Unit!1378)

(assert (=> d!9791 (= lt!20724 (choose!291 (t!4338 l!1333) newKey!147 newValue!147))))

(assert (=> d!9791 (isStrictlySorted!271 (t!4338 l!1333))))

(assert (=> d!9791 (= (lemmaInsertStrictlySortedNotContainedContent!9 (t!4338 l!1333) newKey!147 newValue!147) lt!20724)))

(declare-fun bs!2281 () Bool)

(assert (= bs!2281 d!9791))

(assert (=> bs!2281 m!42581))

(assert (=> bs!2281 m!42587))

(assert (=> bs!2281 m!42629))

(declare-fun m!42639 () Bool)

(assert (=> bs!2281 m!42639))

(assert (=> bs!2281 m!42629))

(assert (=> bs!2281 m!42557))

(declare-fun m!42641 () Bool)

(assert (=> bs!2281 m!42641))

(assert (=> b!49069 d!9791))

(declare-fun b!49234 () Bool)

(declare-fun e!31613 () Bool)

(declare-fun tp!6508 () Bool)

(assert (=> b!49234 (= e!31613 (and tp_is_empty!2141 tp!6508))))

(assert (=> b!49070 (= tp!6500 e!31613)))

(assert (= (and b!49070 (is-Cons!1304 (t!4338 l!1333))) b!49234))

(push 1)

(assert (not d!9783))

(assert (not b!49194))

(assert (not b!49090))

(assert (not b!49197))

(assert (not d!9791))

(assert (not b!49191))

(assert (not b!49116))

(assert tp_is_empty!2141)

(assert (not b!49100))

(assert (not b!49112))

(assert (not bm!3828))

(assert (not b!49234))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9819 () Bool)

(declare-fun lt!20732 () Bool)

(assert (=> d!9819 (= lt!20732 (set.member (tuple2!1817 newKey!147 newValue!147) (content!54 lt!20718)))))

(declare-fun e!31643 () Bool)

(assert (=> d!9819 (= lt!20732 e!31643)))

(declare-fun res!28548 () Bool)

(assert (=> d!9819 (=> (not res!28548) (not e!31643))))

(assert (=> d!9819 (= res!28548 (is-Cons!1304 lt!20718))))

(assert (=> d!9819 (= (contains!608 lt!20718 (tuple2!1817 newKey!147 newValue!147)) lt!20732)))

(declare-fun b!49271 () Bool)

(declare-fun e!31642 () Bool)

(assert (=> b!49271 (= e!31643 e!31642)))

(declare-fun res!28549 () Bool)

(assert (=> b!49271 (=> res!28549 e!31642)))

(assert (=> b!49271 (= res!28549 (= (h!1884 lt!20718) (tuple2!1817 newKey!147 newValue!147)))))

(declare-fun b!49272 () Bool)

(assert (=> b!49272 (= e!31642 (contains!608 (t!4338 lt!20718) (tuple2!1817 newKey!147 newValue!147)))))

(assert (= (and d!9819 res!28548) b!49271))

(assert (= (and b!49271 (not res!28549)) b!49272))

(declare-fun m!42683 () Bool)

(assert (=> d!9819 m!42683))

(declare-fun m!42685 () Bool)

(assert (=> d!9819 m!42685))

(declare-fun m!42687 () Bool)

(assert (=> b!49272 m!42687))

(assert (=> b!49197 d!9819))

(declare-fun d!9821 () Bool)

(declare-fun res!28550 () Bool)

(declare-fun e!31644 () Bool)

(assert (=> d!9821 (=> res!28550 e!31644)))

(assert (=> d!9821 (= res!28550 (or (is-Nil!1305 (t!4338 l!1333)) (is-Nil!1305 (t!4338 (t!4338 l!1333)))))))

(assert (=> d!9821 (= (isStrictlySorted!271 (t!4338 l!1333)) e!31644)))

(declare-fun b!49273 () Bool)

(declare-fun e!31645 () Bool)

(assert (=> b!49273 (= e!31644 e!31645)))

(declare-fun res!28551 () Bool)

(assert (=> b!49273 (=> (not res!28551) (not e!31645))))

(assert (=> b!49273 (= res!28551 (bvslt (_1!919 (h!1884 (t!4338 l!1333))) (_1!919 (h!1884 (t!4338 (t!4338 l!1333))))))))

(declare-fun b!49274 () Bool)

(assert (=> b!49274 (= e!31645 (isStrictlySorted!271 (t!4338 (t!4338 l!1333))))))

(assert (= (and d!9821 (not res!28550)) b!49273))

(assert (= (and b!49273 res!28551) b!49274))

(declare-fun m!42689 () Bool)

(assert (=> b!49274 m!42689))

(assert (=> b!49100 d!9821))

(declare-fun d!9823 () Bool)

(declare-fun res!28552 () Bool)

(declare-fun e!31646 () Bool)

(assert (=> d!9823 (=> res!28552 e!31646)))

(assert (=> d!9823 (= res!28552 (and (is-Cons!1304 (t!4338 l!1333)) (= (_1!919 (h!1884 (t!4338 l!1333))) newKey!147)))))

(assert (=> d!9823 (= (containsKey!123 (t!4338 l!1333) newKey!147) e!31646)))

(declare-fun b!49275 () Bool)

(declare-fun e!31647 () Bool)

(assert (=> b!49275 (= e!31646 e!31647)))

(declare-fun res!28553 () Bool)

(assert (=> b!49275 (=> (not res!28553) (not e!31647))))

(assert (=> b!49275 (= res!28553 (and (or (not (is-Cons!1304 (t!4338 l!1333))) (bvsle (_1!919 (h!1884 (t!4338 l!1333))) newKey!147)) (is-Cons!1304 (t!4338 l!1333)) (bvslt (_1!919 (h!1884 (t!4338 l!1333))) newKey!147)))))

(declare-fun b!49276 () Bool)

(assert (=> b!49276 (= e!31647 (containsKey!123 (t!4338 (t!4338 l!1333)) newKey!147))))

(assert (= (and d!9823 (not res!28552)) b!49275))

(assert (= (and b!49275 res!28553) b!49276))

(declare-fun m!42691 () Bool)

(assert (=> b!49276 m!42691))

(assert (=> b!49090 d!9823))

(declare-fun b!49277 () Bool)

(declare-fun e!31650 () List!1308)

(declare-fun e!31648 () List!1308)

(assert (=> b!49277 (= e!31650 e!31648)))

(declare-fun c!6641 () Bool)

(assert (=> b!49277 (= c!6641 (and (is-Cons!1304 (t!4338 l!1333)) (= (_1!919 (h!1884 (t!4338 l!1333))) newKey!147)))))

(declare-fun b!49278 () Bool)

(declare-fun call!3840 () List!1308)

(assert (=> b!49278 (= e!31650 call!3840)))

(declare-fun b!49279 () Bool)

(declare-fun res!28555 () Bool)

(declare-fun e!31652 () Bool)

(assert (=> b!49279 (=> (not res!28555) (not e!31652))))

(declare-fun lt!20733 () List!1308)

(assert (=> b!49279 (= res!28555 (containsKey!123 lt!20733 newKey!147))))

(declare-fun b!49280 () Bool)

(declare-fun e!31651 () List!1308)

(declare-fun call!3839 () List!1308)

(assert (=> b!49280 (= e!31651 call!3839)))

(declare-fun bm!3835 () Bool)

(declare-fun call!3838 () List!1308)

(assert (=> bm!3835 (= call!3839 call!3838)))

(declare-fun e!31649 () List!1308)

(declare-fun b!49281 () Bool)

(declare-fun c!6640 () Bool)

(assert (=> b!49281 (= e!31649 (ite c!6641 (t!4338 (t!4338 l!1333)) (ite c!6640 (Cons!1304 (h!1884 (t!4338 l!1333)) (t!4338 (t!4338 l!1333))) Nil!1305)))))

(declare-fun d!9825 () Bool)

(assert (=> d!9825 e!31652))

(declare-fun res!28554 () Bool)

(assert (=> d!9825 (=> (not res!28554) (not e!31652))))

(assert (=> d!9825 (= res!28554 (isStrictlySorted!271 lt!20733))))

(assert (=> d!9825 (= lt!20733 e!31650)))

(declare-fun c!6642 () Bool)

(assert (=> d!9825 (= c!6642 (and (is-Cons!1304 (t!4338 l!1333)) (bvslt (_1!919 (h!1884 (t!4338 l!1333))) newKey!147)))))

(assert (=> d!9825 (isStrictlySorted!271 (t!4338 l!1333))))

(assert (=> d!9825 (= (insertStrictlySorted!40 (t!4338 l!1333) newKey!147 newValue!147) lt!20733)))

(declare-fun b!49282 () Bool)

(assert (=> b!49282 (= e!31649 (insertStrictlySorted!40 (t!4338 (t!4338 l!1333)) newKey!147 newValue!147))))

(declare-fun bm!3836 () Bool)

(assert (=> bm!3836 (= call!3838 call!3840)))

(declare-fun b!49283 () Bool)

(assert (=> b!49283 (= c!6640 (and (is-Cons!1304 (t!4338 l!1333)) (bvsgt (_1!919 (h!1884 (t!4338 l!1333))) newKey!147)))))

(assert (=> b!49283 (= e!31648 e!31651)))

(declare-fun b!49284 () Bool)

(assert (=> b!49284 (= e!31648 call!3838)))

(declare-fun b!49285 () Bool)

(assert (=> b!49285 (= e!31652 (contains!608 lt!20733 (tuple2!1817 newKey!147 newValue!147)))))

(declare-fun b!49286 () Bool)

(assert (=> b!49286 (= e!31651 call!3839)))

(declare-fun bm!3837 () Bool)

(assert (=> bm!3837 (= call!3840 ($colon$colon!56 e!31649 (ite c!6642 (h!1884 (t!4338 l!1333)) (tuple2!1817 newKey!147 newValue!147))))))

(declare-fun c!6639 () Bool)

(assert (=> bm!3837 (= c!6639 c!6642)))

(assert (= (and d!9825 c!6642) b!49278))

(assert (= (and d!9825 (not c!6642)) b!49277))

(assert (= (and b!49277 c!6641) b!49284))

(assert (= (and b!49277 (not c!6641)) b!49283))

(assert (= (and b!49283 c!6640) b!49286))

(assert (= (and b!49283 (not c!6640)) b!49280))

(assert (= (or b!49286 b!49280) bm!3835))

(assert (= (or b!49284 bm!3835) bm!3836))

(assert (= (or b!49278 bm!3836) bm!3837))

(assert (= (and bm!3837 c!6639) b!49282))

(assert (= (and bm!3837 (not c!6639)) b!49281))

(assert (= (and d!9825 res!28554) b!49279))

(assert (= (and b!49279 res!28555) b!49285))

(declare-fun m!42693 () Bool)

(assert (=> b!49285 m!42693))

(declare-fun m!42695 () Bool)

(assert (=> b!49279 m!42695))

(declare-fun m!42697 () Bool)

(assert (=> bm!3837 m!42697))

(declare-fun m!42699 () Bool)

(assert (=> d!9825 m!42699))

(assert (=> d!9825 m!42581))

(declare-fun m!42701 () Bool)

(assert (=> b!49282 m!42701))

(assert (=> b!49194 d!9825))

(declare-fun d!9827 () Bool)

(declare-fun c!6643 () Bool)

(assert (=> d!9827 (= c!6643 (is-Nil!1305 (t!4338 (insertStrictlySorted!40 l!1333 newKey!147 newValue!147))))))

(declare-fun e!31653 () (Set tuple2!1816))

(assert (=> d!9827 (= (content!54 (t!4338 (insertStrictlySorted!40 l!1333 newKey!147 newValue!147))) e!31653)))

(declare-fun b!49287 () Bool)

(assert (=> b!49287 (= e!31653 (as set.empty (Set tuple2!1816)))))

(declare-fun b!49288 () Bool)

(assert (=> b!49288 (= e!31653 (set.union (set.insert (h!1884 (t!4338 (insertStrictlySorted!40 l!1333 newKey!147 newValue!147))) (as set.empty (Set tuple2!1816))) (content!54 (t!4338 (t!4338 (insertStrictlySorted!40 l!1333 newKey!147 newValue!147))))))))

(assert (= (and d!9827 c!6643) b!49287))

(assert (= (and d!9827 (not c!6643)) b!49288))

(declare-fun m!42703 () Bool)

(assert (=> b!49288 m!42703))

(declare-fun m!42705 () Bool)

(assert (=> b!49288 m!42705))

(assert (=> b!49116 d!9827))

(declare-fun d!9829 () Bool)

(assert (=> d!9829 (= (set.union (content!54 (t!4338 l!1333)) (set.insert (tuple2!1817 newKey!147 newValue!147) (as set.empty (Set tuple2!1816)))) (content!54 (insertStrictlySorted!40 (t!4338 l!1333) newKey!147 newValue!147)))))

(assert (=> d!9829 true))

(declare-fun _$19!26 () Unit!1378)

(assert (=> d!9829 (= (choose!291 (t!4338 l!1333) newKey!147 newValue!147) _$19!26)))

(declare-fun bs!2284 () Bool)

(assert (= bs!2284 d!9829))

(assert (=> bs!2284 m!42587))

(assert (=> bs!2284 m!42557))

(assert (=> bs!2284 m!42629))

(assert (=> bs!2284 m!42629))

(assert (=> bs!2284 m!42639))

(assert (=> d!9791 d!9829))

(declare-fun d!9831 () Bool)

(declare-fun c!6644 () Bool)

(assert (=> d!9831 (= c!6644 (is-Nil!1305 (t!4338 l!1333)))))

(declare-fun e!31654 () (Set tuple2!1816))

(assert (=> d!9831 (= (content!54 (t!4338 l!1333)) e!31654)))

(declare-fun b!49289 () Bool)

(assert (=> b!49289 (= e!31654 (as set.empty (Set tuple2!1816)))))

(declare-fun b!49290 () Bool)

(assert (=> b!49290 (= e!31654 (set.union (set.insert (h!1884 (t!4338 l!1333)) (as set.empty (Set tuple2!1816))) (content!54 (t!4338 (t!4338 l!1333)))))))

(assert (= (and d!9831 c!6644) b!49289))

(assert (= (and d!9831 (not c!6644)) b!49290))

(declare-fun m!42707 () Bool)

(assert (=> b!49290 m!42707))

(declare-fun m!42709 () Bool)

(assert (=> b!49290 m!42709))

(assert (=> d!9791 d!9831))

(assert (=> d!9791 d!9825))

(declare-fun d!9833 () Bool)

(declare-fun c!6645 () Bool)

(assert (=> d!9833 (= c!6645 (is-Nil!1305 (insertStrictlySorted!40 (t!4338 l!1333) newKey!147 newValue!147)))))

(declare-fun e!31655 () (Set tuple2!1816))

(assert (=> d!9833 (= (content!54 (insertStrictlySorted!40 (t!4338 l!1333) newKey!147 newValue!147)) e!31655)))

(declare-fun b!49291 () Bool)

(assert (=> b!49291 (= e!31655 (as set.empty (Set tuple2!1816)))))

(declare-fun b!49292 () Bool)

(assert (=> b!49292 (= e!31655 (set.union (set.insert (h!1884 (insertStrictlySorted!40 (t!4338 l!1333) newKey!147 newValue!147)) (as set.empty (Set tuple2!1816))) (content!54 (t!4338 (insertStrictlySorted!40 (t!4338 l!1333) newKey!147 newValue!147)))))))

(assert (= (and d!9833 c!6645) b!49291))

(assert (= (and d!9833 (not c!6645)) b!49292))

(declare-fun m!42711 () Bool)

(assert (=> b!49292 m!42711))

(declare-fun m!42713 () Bool)

(assert (=> b!49292 m!42713))

(assert (=> d!9791 d!9833))

(assert (=> d!9791 d!9821))

(declare-fun d!9835 () Bool)

(declare-fun res!28556 () Bool)

(declare-fun e!31656 () Bool)

(assert (=> d!9835 (=> res!28556 e!31656)))

(assert (=> d!9835 (= res!28556 (and (is-Cons!1304 lt!20718) (= (_1!919 (h!1884 lt!20718)) newKey!147)))))

(assert (=> d!9835 (= (containsKey!123 lt!20718 newKey!147) e!31656)))

(declare-fun b!49293 () Bool)

(declare-fun e!31657 () Bool)

(assert (=> b!49293 (= e!31656 e!31657)))

(declare-fun res!28557 () Bool)

(assert (=> b!49293 (=> (not res!28557) (not e!31657))))

(assert (=> b!49293 (= res!28557 (and (or (not (is-Cons!1304 lt!20718)) (bvsle (_1!919 (h!1884 lt!20718)) newKey!147)) (is-Cons!1304 lt!20718) (bvslt (_1!919 (h!1884 lt!20718)) newKey!147)))))

(declare-fun b!49294 () Bool)

(assert (=> b!49294 (= e!31657 (containsKey!123 (t!4338 lt!20718) newKey!147))))

(assert (= (and d!9835 (not res!28556)) b!49293))

(assert (= (and b!49293 res!28557) b!49294))

(declare-fun m!42715 () Bool)

(assert (=> b!49294 m!42715))

(assert (=> b!49191 d!9835))

(declare-fun d!9837 () Bool)

(declare-fun res!28558 () Bool)

(declare-fun e!31658 () Bool)

(assert (=> d!9837 (=> res!28558 e!31658)))

(assert (=> d!9837 (= res!28558 (or (is-Nil!1305 lt!20718) (is-Nil!1305 (t!4338 lt!20718))))))

(assert (=> d!9837 (= (isStrictlySorted!271 lt!20718) e!31658)))

(declare-fun b!49295 () Bool)

(declare-fun e!31659 () Bool)

(assert (=> b!49295 (= e!31658 e!31659)))

(declare-fun res!28559 () Bool)

(assert (=> b!49295 (=> (not res!28559) (not e!31659))))

(assert (=> b!49295 (= res!28559 (bvslt (_1!919 (h!1884 lt!20718)) (_1!919 (h!1884 (t!4338 lt!20718)))))))

(declare-fun b!49296 () Bool)

(assert (=> b!49296 (= e!31659 (isStrictlySorted!271 (t!4338 lt!20718)))))

(assert (= (and d!9837 (not res!28558)) b!49295))

(assert (= (and b!49295 res!28559) b!49296))

(declare-fun m!42717 () Bool)

(assert (=> b!49296 m!42717))

(assert (=> d!9783 d!9837))

(assert (=> d!9783 d!9773))

(declare-fun d!9839 () Bool)

(assert (=> d!9839 (= ($colon$colon!56 e!31585 (ite c!6627 (h!1884 l!1333) (tuple2!1817 newKey!147 newValue!147))) (Cons!1304 (ite c!6627 (h!1884 l!1333) (tuple2!1817 newKey!147 newValue!147)) e!31585))))

(assert (=> bm!3828 d!9839))

(assert (=> b!49112 d!9831))

(declare-fun b!49297 () Bool)

(declare-fun e!31660 () Bool)

(declare-fun tp!6511 () Bool)

(assert (=> b!49297 (= e!31660 (and tp_is_empty!2141 tp!6511))))

(assert (=> b!49234 (= tp!6508 e!31660)))

(assert (= (and b!49234 (is-Cons!1304 (t!4338 (t!4338 l!1333)))) b!49297))

(push 1)

(assert (not b!49282))

(assert (not bm!3837))

(assert (not b!49296))

(assert (not b!49292))

(assert (not d!9819))

(assert (not b!49290))

(assert (not b!49274))

(assert (not b!49294))

(assert (not d!9825))

(assert (not d!9829))

(assert tp_is_empty!2141)

(assert (not b!49297))

(assert (not b!49285))

(assert (not b!49272))

(assert (not b!49276))

(assert (not b!49279))

(assert (not b!49288))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

