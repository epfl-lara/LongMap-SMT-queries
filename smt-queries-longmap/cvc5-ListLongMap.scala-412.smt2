; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7714 () Bool)

(assert start!7714)

(declare-fun b!49109 () Bool)

(declare-fun res!28473 () Bool)

(declare-fun e!31542 () Bool)

(assert (=> b!49109 (=> (not res!28473) (not e!31542))))

(declare-datatypes ((B!986 0))(
  ( (B!987 (val!1113 Int)) )
))
(declare-datatypes ((tuple2!1808 0))(
  ( (tuple2!1809 (_1!915 (_ BitVec 64)) (_2!915 B!986)) )
))
(declare-datatypes ((List!1310 0))(
  ( (Nil!1307) (Cons!1306 (h!1886 tuple2!1808) (t!4341 List!1310)) )
))
(declare-fun l!1333 () List!1310)

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!123 (List!1310 (_ BitVec 64)) Bool)

(assert (=> b!49109 (= res!28473 (not (containsKey!123 l!1333 newKey!147)))))

(declare-fun res!28475 () Bool)

(assert (=> start!7714 (=> (not res!28475) (not e!31542))))

(declare-fun isStrictlySorted!274 (List!1310) Bool)

(assert (=> start!7714 (= res!28475 (isStrictlySorted!274 l!1333))))

(assert (=> start!7714 e!31542))

(declare-fun e!31543 () Bool)

(assert (=> start!7714 e!31543))

(assert (=> start!7714 true))

(declare-fun tp_is_empty!2137 () Bool)

(assert (=> start!7714 tp_is_empty!2137))

(declare-fun b!49112 () Bool)

(declare-fun tp!6494 () Bool)

(assert (=> b!49112 (= e!31543 (and tp_is_empty!2137 tp!6494))))

(declare-fun b!49110 () Bool)

(declare-fun res!28474 () Bool)

(assert (=> b!49110 (=> (not res!28474) (not e!31542))))

(assert (=> b!49110 (= res!28474 (not (is-Nil!1307 l!1333)))))

(declare-fun newValue!147 () B!986)

(declare-fun b!49111 () Bool)

(declare-fun content!52 (List!1310) (Set tuple2!1808))

(declare-fun insertStrictlySorted!37 (List!1310 (_ BitVec 64) B!986) List!1310)

(assert (=> b!49111 (= e!31542 (not (= (set.union (content!52 l!1333) (set.insert (tuple2!1809 newKey!147 newValue!147) (as set.empty (Set tuple2!1808)))) (content!52 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147)))))))

(declare-datatypes ((Unit!1369 0))(
  ( (Unit!1370) )
))
(declare-fun lt!20717 () Unit!1369)

(declare-fun lemmaInsertStrictlySortedNotContainedContent!7 (List!1310 (_ BitVec 64) B!986) Unit!1369)

(assert (=> b!49111 (= lt!20717 (lemmaInsertStrictlySortedNotContainedContent!7 (t!4341 l!1333) newKey!147 newValue!147))))

(assert (= (and start!7714 res!28475) b!49109))

(assert (= (and b!49109 res!28473) b!49110))

(assert (= (and b!49110 res!28474) b!49111))

(assert (= (and start!7714 (is-Cons!1306 l!1333)) b!49112))

(declare-fun m!42609 () Bool)

(assert (=> b!49109 m!42609))

(declare-fun m!42611 () Bool)

(assert (=> start!7714 m!42611))

(declare-fun m!42613 () Bool)

(assert (=> b!49111 m!42613))

(declare-fun m!42615 () Bool)

(assert (=> b!49111 m!42615))

(declare-fun m!42617 () Bool)

(assert (=> b!49111 m!42617))

(assert (=> b!49111 m!42617))

(declare-fun m!42619 () Bool)

(assert (=> b!49111 m!42619))

(declare-fun m!42621 () Bool)

(assert (=> b!49111 m!42621))

(push 1)

(assert (not b!49111))

(assert (not start!7714))

(assert (not b!49109))

(assert tp_is_empty!2137)

(assert (not b!49112))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9791 () Bool)

(declare-fun c!6616 () Bool)

(assert (=> d!9791 (= c!6616 (is-Nil!1307 l!1333))))

(declare-fun e!31565 () (Set tuple2!1808))

(assert (=> d!9791 (= (content!52 l!1333) e!31565)))

(declare-fun b!49155 () Bool)

(assert (=> b!49155 (= e!31565 (as set.empty (Set tuple2!1808)))))

(declare-fun b!49156 () Bool)

(assert (=> b!49156 (= e!31565 (set.union (set.insert (h!1886 l!1333) (as set.empty (Set tuple2!1808))) (content!52 (t!4341 l!1333))))))

(assert (= (and d!9791 c!6616) b!49155))

(assert (= (and d!9791 (not c!6616)) b!49156))

(declare-fun m!42663 () Bool)

(assert (=> b!49156 m!42663))

(declare-fun m!42665 () Bool)

(assert (=> b!49156 m!42665))

(assert (=> b!49111 d!9791))

(declare-fun d!9799 () Bool)

(declare-fun c!6618 () Bool)

(assert (=> d!9799 (= c!6618 (is-Nil!1307 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147)))))

(declare-fun e!31567 () (Set tuple2!1808))

(assert (=> d!9799 (= (content!52 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147)) e!31567)))

(declare-fun b!49159 () Bool)

(assert (=> b!49159 (= e!31567 (as set.empty (Set tuple2!1808)))))

(declare-fun b!49160 () Bool)

(assert (=> b!49160 (= e!31567 (set.union (set.insert (h!1886 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147)) (as set.empty (Set tuple2!1808))) (content!52 (t!4341 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147)))))))

(assert (= (and d!9799 c!6618) b!49159))

(assert (= (and d!9799 (not c!6618)) b!49160))

(declare-fun m!42671 () Bool)

(assert (=> b!49160 m!42671))

(declare-fun m!42673 () Bool)

(assert (=> b!49160 m!42673))

(assert (=> b!49111 d!9799))

(declare-fun b!49241 () Bool)

(declare-fun e!31608 () List!1310)

(declare-fun call!3835 () List!1310)

(assert (=> b!49241 (= e!31608 call!3835)))

(declare-fun b!49242 () Bool)

(declare-fun e!31612 () Bool)

(declare-fun lt!20732 () List!1310)

(declare-fun contains!609 (List!1310 tuple2!1808) Bool)

(assert (=> b!49242 (= e!31612 (contains!609 lt!20732 (tuple2!1809 newKey!147 newValue!147)))))

(declare-fun c!6651 () Bool)

(declare-fun b!49243 () Bool)

(declare-fun c!6653 () Bool)

(declare-fun e!31610 () List!1310)

(assert (=> b!49243 (= e!31610 (ite c!6653 (t!4341 l!1333) (ite c!6651 (Cons!1306 (h!1886 l!1333) (t!4341 l!1333)) Nil!1307)))))

(declare-fun b!49244 () Bool)

(assert (=> b!49244 (= c!6651 (and (is-Cons!1306 l!1333) (bvsgt (_1!915 (h!1886 l!1333)) newKey!147)))))

(declare-fun e!31609 () List!1310)

(declare-fun e!31611 () List!1310)

(assert (=> b!49244 (= e!31609 e!31611)))

(declare-fun bm!3830 () Bool)

(declare-fun call!3834 () List!1310)

(assert (=> bm!3830 (= call!3834 call!3835)))

(declare-fun b!49245 () Bool)

(declare-fun call!3833 () List!1310)

(assert (=> b!49245 (= e!31611 call!3833)))

(declare-fun b!49246 () Bool)

(assert (=> b!49246 (= e!31609 call!3834)))

(declare-fun c!6652 () Bool)

(declare-fun bm!3831 () Bool)

(declare-fun $colon$colon!57 (List!1310 tuple2!1808) List!1310)

(assert (=> bm!3831 (= call!3835 ($colon$colon!57 e!31610 (ite c!6652 (h!1886 l!1333) (tuple2!1809 newKey!147 newValue!147))))))

(declare-fun c!6654 () Bool)

(assert (=> bm!3831 (= c!6654 c!6652)))

(declare-fun d!9803 () Bool)

(assert (=> d!9803 e!31612))

(declare-fun res!28510 () Bool)

(assert (=> d!9803 (=> (not res!28510) (not e!31612))))

(assert (=> d!9803 (= res!28510 (isStrictlySorted!274 lt!20732))))

(assert (=> d!9803 (= lt!20732 e!31608)))

(assert (=> d!9803 (= c!6652 (and (is-Cons!1306 l!1333) (bvslt (_1!915 (h!1886 l!1333)) newKey!147)))))

(assert (=> d!9803 (isStrictlySorted!274 l!1333)))

(assert (=> d!9803 (= (insertStrictlySorted!37 l!1333 newKey!147 newValue!147) lt!20732)))

(declare-fun b!49247 () Bool)

(assert (=> b!49247 (= e!31608 e!31609)))

(assert (=> b!49247 (= c!6653 (and (is-Cons!1306 l!1333) (= (_1!915 (h!1886 l!1333)) newKey!147)))))

(declare-fun b!49248 () Bool)

(assert (=> b!49248 (= e!31611 call!3833)))

(declare-fun b!49249 () Bool)

(declare-fun res!28511 () Bool)

(assert (=> b!49249 (=> (not res!28511) (not e!31612))))

(assert (=> b!49249 (= res!28511 (containsKey!123 lt!20732 newKey!147))))

(declare-fun b!49250 () Bool)

(assert (=> b!49250 (= e!31610 (insertStrictlySorted!37 (t!4341 l!1333) newKey!147 newValue!147))))

(declare-fun bm!3832 () Bool)

(assert (=> bm!3832 (= call!3833 call!3834)))

(assert (= (and d!9803 c!6652) b!49241))

(assert (= (and d!9803 (not c!6652)) b!49247))

(assert (= (and b!49247 c!6653) b!49246))

(assert (= (and b!49247 (not c!6653)) b!49244))

(assert (= (and b!49244 c!6651) b!49245))

(assert (= (and b!49244 (not c!6651)) b!49248))

(assert (= (or b!49245 b!49248) bm!3832))

(assert (= (or b!49246 bm!3832) bm!3830))

(assert (= (or b!49241 bm!3830) bm!3831))

(assert (= (and bm!3831 c!6654) b!49250))

(assert (= (and bm!3831 (not c!6654)) b!49243))

(assert (= (and d!9803 res!28510) b!49249))

(assert (= (and b!49249 res!28511) b!49242))

(declare-fun m!42690 () Bool)

(assert (=> b!49249 m!42690))

(declare-fun m!42695 () Bool)

(assert (=> b!49250 m!42695))

(declare-fun m!42699 () Bool)

(assert (=> bm!3831 m!42699))

(declare-fun m!42701 () Bool)

(assert (=> d!9803 m!42701))

(assert (=> d!9803 m!42611))

(declare-fun m!42703 () Bool)

(assert (=> b!49242 m!42703))

(assert (=> b!49111 d!9803))

(declare-fun d!9809 () Bool)

(assert (=> d!9809 (= (set.union (content!52 (t!4341 l!1333)) (set.insert (tuple2!1809 newKey!147 newValue!147) (as set.empty (Set tuple2!1808)))) (content!52 (insertStrictlySorted!37 (t!4341 l!1333) newKey!147 newValue!147)))))

(declare-fun lt!20741 () Unit!1369)

(declare-fun choose!284 (List!1310 (_ BitVec 64) B!986) Unit!1369)

(assert (=> d!9809 (= lt!20741 (choose!284 (t!4341 l!1333) newKey!147 newValue!147))))

(assert (=> d!9809 (isStrictlySorted!274 (t!4341 l!1333))))

(assert (=> d!9809 (= (lemmaInsertStrictlySortedNotContainedContent!7 (t!4341 l!1333) newKey!147 newValue!147) lt!20741)))

(declare-fun bs!2283 () Bool)

(assert (= bs!2283 d!9809))

(assert (=> bs!2283 m!42695))

(declare-fun m!42709 () Bool)

(assert (=> bs!2283 m!42709))

(declare-fun m!42713 () Bool)

(assert (=> bs!2283 m!42713))

(assert (=> bs!2283 m!42613))

(assert (=> bs!2283 m!42665))

(assert (=> bs!2283 m!42695))

(declare-fun m!42719 () Bool)

(assert (=> bs!2283 m!42719))

(assert (=> b!49111 d!9809))

(declare-fun d!9813 () Bool)

(declare-fun res!28526 () Bool)

(declare-fun e!31627 () Bool)

(assert (=> d!9813 (=> res!28526 e!31627)))

(assert (=> d!9813 (= res!28526 (and (is-Cons!1306 l!1333) (= (_1!915 (h!1886 l!1333)) newKey!147)))))

(assert (=> d!9813 (= (containsKey!123 l!1333 newKey!147) e!31627)))

(declare-fun b!49265 () Bool)

(declare-fun e!31629 () Bool)

(assert (=> b!49265 (= e!31627 e!31629)))

(declare-fun res!28528 () Bool)

(assert (=> b!49265 (=> (not res!28528) (not e!31629))))

(assert (=> b!49265 (= res!28528 (and (or (not (is-Cons!1306 l!1333)) (bvsle (_1!915 (h!1886 l!1333)) newKey!147)) (is-Cons!1306 l!1333) (bvslt (_1!915 (h!1886 l!1333)) newKey!147)))))

(declare-fun b!49266 () Bool)

(assert (=> b!49266 (= e!31629 (containsKey!123 (t!4341 l!1333) newKey!147))))

(assert (= (and d!9813 (not res!28526)) b!49265))

(assert (= (and b!49265 res!28528) b!49266))

(declare-fun m!42724 () Bool)

(assert (=> b!49266 m!42724))

(assert (=> b!49109 d!9813))

(declare-fun d!9819 () Bool)

(declare-fun res!28544 () Bool)

(declare-fun e!31645 () Bool)

(assert (=> d!9819 (=> res!28544 e!31645)))

(assert (=> d!9819 (= res!28544 (or (is-Nil!1307 l!1333) (is-Nil!1307 (t!4341 l!1333))))))

(assert (=> d!9819 (= (isStrictlySorted!274 l!1333) e!31645)))

(declare-fun b!49283 () Bool)

(declare-fun e!31646 () Bool)

(assert (=> b!49283 (= e!31645 e!31646)))

(declare-fun res!28545 () Bool)

(assert (=> b!49283 (=> (not res!28545) (not e!31646))))

(assert (=> b!49283 (= res!28545 (bvslt (_1!915 (h!1886 l!1333)) (_1!915 (h!1886 (t!4341 l!1333)))))))

(declare-fun b!49284 () Bool)

(assert (=> b!49284 (= e!31646 (isStrictlySorted!274 (t!4341 l!1333)))))

(assert (= (and d!9819 (not res!28544)) b!49283))

(assert (= (and b!49283 res!28545) b!49284))

(assert (=> b!49284 m!42719))

(assert (=> start!7714 d!9819))

(declare-fun b!49300 () Bool)

(declare-fun e!31656 () Bool)

(declare-fun tp!6508 () Bool)

(assert (=> b!49300 (= e!31656 (and tp_is_empty!2137 tp!6508))))

(assert (=> b!49112 (= tp!6494 e!31656)))

(assert (= (and b!49112 (is-Cons!1306 (t!4341 l!1333))) b!49300))

(push 1)

(assert (not b!49300))

(assert (not b!49156))

(assert (not bm!3831))

(assert (not b!49250))

(assert (not b!49284))

(assert (not b!49249))

(assert (not d!9803))

(assert (not b!49160))

(assert (not d!9809))

(assert (not b!49242))

(assert tp_is_empty!2137)

(assert (not b!49266))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9831 () Bool)

(assert (=> d!9831 (= (set.union (content!52 (t!4341 l!1333)) (set.insert (tuple2!1809 newKey!147 newValue!147) (as set.empty (Set tuple2!1808)))) (content!52 (insertStrictlySorted!37 (t!4341 l!1333) newKey!147 newValue!147)))))

(assert (=> d!9831 true))

(declare-fun _$19!26 () Unit!1369)

(assert (=> d!9831 (= (choose!284 (t!4341 l!1333) newKey!147 newValue!147) _$19!26)))

(declare-fun bs!2285 () Bool)

(assert (= bs!2285 d!9831))

(assert (=> bs!2285 m!42665))

(assert (=> bs!2285 m!42613))

(assert (=> bs!2285 m!42695))

(assert (=> bs!2285 m!42695))

(assert (=> bs!2285 m!42709))

(assert (=> d!9809 d!9831))

(declare-fun d!9843 () Bool)

(declare-fun c!6662 () Bool)

(assert (=> d!9843 (= c!6662 (is-Nil!1307 (t!4341 l!1333)))))

(declare-fun e!31672 () (Set tuple2!1808))

(assert (=> d!9843 (= (content!52 (t!4341 l!1333)) e!31672)))

(declare-fun b!49324 () Bool)

(assert (=> b!49324 (= e!31672 (as set.empty (Set tuple2!1808)))))

(declare-fun b!49325 () Bool)

(assert (=> b!49325 (= e!31672 (set.union (set.insert (h!1886 (t!4341 l!1333)) (as set.empty (Set tuple2!1808))) (content!52 (t!4341 (t!4341 l!1333)))))))

(assert (= (and d!9843 c!6662) b!49324))

(assert (= (and d!9843 (not c!6662)) b!49325))

(declare-fun m!42757 () Bool)

(assert (=> b!49325 m!42757))

(declare-fun m!42759 () Bool)

(assert (=> b!49325 m!42759))

(assert (=> d!9809 d!9843))

(declare-fun b!49326 () Bool)

(declare-fun e!31673 () List!1310)

(declare-fun call!3841 () List!1310)

(assert (=> b!49326 (= e!31673 call!3841)))

(declare-fun b!49327 () Bool)

(declare-fun e!31677 () Bool)

(declare-fun lt!20743 () List!1310)

(assert (=> b!49327 (= e!31677 (contains!609 lt!20743 (tuple2!1809 newKey!147 newValue!147)))))

(declare-fun b!49328 () Bool)

(declare-fun c!6665 () Bool)

(declare-fun c!6663 () Bool)

(declare-fun e!31675 () List!1310)

(assert (=> b!49328 (= e!31675 (ite c!6665 (t!4341 (t!4341 l!1333)) (ite c!6663 (Cons!1306 (h!1886 (t!4341 l!1333)) (t!4341 (t!4341 l!1333))) Nil!1307)))))

(declare-fun b!49329 () Bool)

(assert (=> b!49329 (= c!6663 (and (is-Cons!1306 (t!4341 l!1333)) (bvsgt (_1!915 (h!1886 (t!4341 l!1333))) newKey!147)))))

(declare-fun e!31674 () List!1310)

(declare-fun e!31676 () List!1310)

(assert (=> b!49329 (= e!31674 e!31676)))

(declare-fun bm!3836 () Bool)

(declare-fun call!3840 () List!1310)

(assert (=> bm!3836 (= call!3840 call!3841)))

(declare-fun b!49330 () Bool)

(declare-fun call!3839 () List!1310)

(assert (=> b!49330 (= e!31676 call!3839)))

(declare-fun b!49331 () Bool)

(assert (=> b!49331 (= e!31674 call!3840)))

(declare-fun bm!3837 () Bool)

(declare-fun c!6664 () Bool)

(assert (=> bm!3837 (= call!3841 ($colon$colon!57 e!31675 (ite c!6664 (h!1886 (t!4341 l!1333)) (tuple2!1809 newKey!147 newValue!147))))))

(declare-fun c!6666 () Bool)

(assert (=> bm!3837 (= c!6666 c!6664)))

(declare-fun d!9847 () Bool)

(assert (=> d!9847 e!31677))

(declare-fun res!28556 () Bool)

(assert (=> d!9847 (=> (not res!28556) (not e!31677))))

(assert (=> d!9847 (= res!28556 (isStrictlySorted!274 lt!20743))))

(assert (=> d!9847 (= lt!20743 e!31673)))

(assert (=> d!9847 (= c!6664 (and (is-Cons!1306 (t!4341 l!1333)) (bvslt (_1!915 (h!1886 (t!4341 l!1333))) newKey!147)))))

(assert (=> d!9847 (isStrictlySorted!274 (t!4341 l!1333))))

(assert (=> d!9847 (= (insertStrictlySorted!37 (t!4341 l!1333) newKey!147 newValue!147) lt!20743)))

(declare-fun b!49332 () Bool)

(assert (=> b!49332 (= e!31673 e!31674)))

(assert (=> b!49332 (= c!6665 (and (is-Cons!1306 (t!4341 l!1333)) (= (_1!915 (h!1886 (t!4341 l!1333))) newKey!147)))))

(declare-fun b!49333 () Bool)

(assert (=> b!49333 (= e!31676 call!3839)))

(declare-fun b!49334 () Bool)

(declare-fun res!28557 () Bool)

(assert (=> b!49334 (=> (not res!28557) (not e!31677))))

(assert (=> b!49334 (= res!28557 (containsKey!123 lt!20743 newKey!147))))

(declare-fun b!49335 () Bool)

(assert (=> b!49335 (= e!31675 (insertStrictlySorted!37 (t!4341 (t!4341 l!1333)) newKey!147 newValue!147))))

(declare-fun bm!3838 () Bool)

(assert (=> bm!3838 (= call!3839 call!3840)))

(assert (= (and d!9847 c!6664) b!49326))

(assert (= (and d!9847 (not c!6664)) b!49332))

(assert (= (and b!49332 c!6665) b!49331))

(assert (= (and b!49332 (not c!6665)) b!49329))

(assert (= (and b!49329 c!6663) b!49330))

(assert (= (and b!49329 (not c!6663)) b!49333))

(assert (= (or b!49330 b!49333) bm!3838))

(assert (= (or b!49331 bm!3838) bm!3836))

(assert (= (or b!49326 bm!3836) bm!3837))

(assert (= (and bm!3837 c!6666) b!49335))

(assert (= (and bm!3837 (not c!6666)) b!49328))

(assert (= (and d!9847 res!28556) b!49334))

(assert (= (and b!49334 res!28557) b!49327))

(declare-fun m!42761 () Bool)

(assert (=> b!49334 m!42761))

(declare-fun m!42763 () Bool)

(assert (=> b!49335 m!42763))

(declare-fun m!42765 () Bool)

(assert (=> bm!3837 m!42765))

(declare-fun m!42767 () Bool)

(assert (=> d!9847 m!42767))

(assert (=> d!9847 m!42719))

(declare-fun m!42769 () Bool)

(assert (=> b!49327 m!42769))

(assert (=> d!9809 d!9847))

(declare-fun c!6667 () Bool)

(declare-fun d!9849 () Bool)

(assert (=> d!9849 (= c!6667 (is-Nil!1307 (insertStrictlySorted!37 (t!4341 l!1333) newKey!147 newValue!147)))))

(declare-fun e!31678 () (Set tuple2!1808))

(assert (=> d!9849 (= (content!52 (insertStrictlySorted!37 (t!4341 l!1333) newKey!147 newValue!147)) e!31678)))

(declare-fun b!49336 () Bool)

(assert (=> b!49336 (= e!31678 (as set.empty (Set tuple2!1808)))))

(declare-fun b!49337 () Bool)

(assert (=> b!49337 (= e!31678 (set.union (set.insert (h!1886 (insertStrictlySorted!37 (t!4341 l!1333) newKey!147 newValue!147)) (as set.empty (Set tuple2!1808))) (content!52 (t!4341 (insertStrictlySorted!37 (t!4341 l!1333) newKey!147 newValue!147)))))))

(assert (= (and d!9849 c!6667) b!49336))

(assert (= (and d!9849 (not c!6667)) b!49337))

(declare-fun m!42771 () Bool)

(assert (=> b!49337 m!42771))

(declare-fun m!42773 () Bool)

(assert (=> b!49337 m!42773))

(assert (=> d!9809 d!9849))

(declare-fun d!9851 () Bool)

(declare-fun res!28562 () Bool)

(declare-fun e!31683 () Bool)

(assert (=> d!9851 (=> res!28562 e!31683)))

(assert (=> d!9851 (= res!28562 (or (is-Nil!1307 (t!4341 l!1333)) (is-Nil!1307 (t!4341 (t!4341 l!1333)))))))

(assert (=> d!9851 (= (isStrictlySorted!274 (t!4341 l!1333)) e!31683)))

(declare-fun b!49342 () Bool)

(declare-fun e!31684 () Bool)

(assert (=> b!49342 (= e!31683 e!31684)))

(declare-fun res!28563 () Bool)

(assert (=> b!49342 (=> (not res!28563) (not e!31684))))

(assert (=> b!49342 (= res!28563 (bvslt (_1!915 (h!1886 (t!4341 l!1333))) (_1!915 (h!1886 (t!4341 (t!4341 l!1333))))))))

(declare-fun b!49343 () Bool)

(assert (=> b!49343 (= e!31684 (isStrictlySorted!274 (t!4341 (t!4341 l!1333))))))

(assert (= (and d!9851 (not res!28562)) b!49342))

(assert (= (and b!49342 res!28563) b!49343))

(declare-fun m!42775 () Bool)

(assert (=> b!49343 m!42775))

(assert (=> d!9809 d!9851))

(assert (=> b!49250 d!9847))

(declare-fun d!9853 () Bool)

(declare-fun lt!20749 () Bool)

(assert (=> d!9853 (= lt!20749 (set.member (tuple2!1809 newKey!147 newValue!147) (content!52 lt!20732)))))

(declare-fun e!31695 () Bool)

(assert (=> d!9853 (= lt!20749 e!31695)))

(declare-fun res!28572 () Bool)

(assert (=> d!9853 (=> (not res!28572) (not e!31695))))

(assert (=> d!9853 (= res!28572 (is-Cons!1306 lt!20732))))

(assert (=> d!9853 (= (contains!609 lt!20732 (tuple2!1809 newKey!147 newValue!147)) lt!20749)))

(declare-fun b!49353 () Bool)

(declare-fun e!31694 () Bool)

(assert (=> b!49353 (= e!31695 e!31694)))

(declare-fun res!28573 () Bool)

(assert (=> b!49353 (=> res!28573 e!31694)))

(assert (=> b!49353 (= res!28573 (= (h!1886 lt!20732) (tuple2!1809 newKey!147 newValue!147)))))

(declare-fun b!49354 () Bool)

(assert (=> b!49354 (= e!31694 (contains!609 (t!4341 lt!20732) (tuple2!1809 newKey!147 newValue!147)))))

(assert (= (and d!9853 res!28572) b!49353))

(assert (= (and b!49353 (not res!28573)) b!49354))

(declare-fun m!42785 () Bool)

(assert (=> d!9853 m!42785))

(declare-fun m!42787 () Bool)

(assert (=> d!9853 m!42787))

(declare-fun m!42789 () Bool)

(assert (=> b!49354 m!42789))

(assert (=> b!49242 d!9853))

(declare-fun d!9857 () Bool)

(declare-fun res!28574 () Bool)

(declare-fun e!31696 () Bool)

(assert (=> d!9857 (=> res!28574 e!31696)))

(assert (=> d!9857 (= res!28574 (or (is-Nil!1307 lt!20732) (is-Nil!1307 (t!4341 lt!20732))))))

(assert (=> d!9857 (= (isStrictlySorted!274 lt!20732) e!31696)))

(declare-fun b!49355 () Bool)

(declare-fun e!31697 () Bool)

(assert (=> b!49355 (= e!31696 e!31697)))

(declare-fun res!28575 () Bool)

(assert (=> b!49355 (=> (not res!28575) (not e!31697))))

(assert (=> b!49355 (= res!28575 (bvslt (_1!915 (h!1886 lt!20732)) (_1!915 (h!1886 (t!4341 lt!20732)))))))

(declare-fun b!49356 () Bool)

(assert (=> b!49356 (= e!31697 (isStrictlySorted!274 (t!4341 lt!20732)))))

(assert (= (and d!9857 (not res!28574)) b!49355))

(assert (= (and b!49355 res!28575) b!49356))

(declare-fun m!42791 () Bool)

(assert (=> b!49356 m!42791))

(assert (=> d!9803 d!9857))

(assert (=> d!9803 d!9819))

(declare-fun d!9859 () Bool)

(assert (=> d!9859 (= ($colon$colon!57 e!31610 (ite c!6652 (h!1886 l!1333) (tuple2!1809 newKey!147 newValue!147))) (Cons!1306 (ite c!6652 (h!1886 l!1333) (tuple2!1809 newKey!147 newValue!147)) e!31610))))

(assert (=> bm!3831 d!9859))

(assert (=> b!49284 d!9851))

(assert (=> b!49156 d!9843))

(declare-fun d!9861 () Bool)

(declare-fun res!28576 () Bool)

(declare-fun e!31698 () Bool)

(assert (=> d!9861 (=> res!28576 e!31698)))

(assert (=> d!9861 (= res!28576 (and (is-Cons!1306 (t!4341 l!1333)) (= (_1!915 (h!1886 (t!4341 l!1333))) newKey!147)))))

(assert (=> d!9861 (= (containsKey!123 (t!4341 l!1333) newKey!147) e!31698)))

(declare-fun b!49357 () Bool)

(declare-fun e!31699 () Bool)

(assert (=> b!49357 (= e!31698 e!31699)))

(declare-fun res!28577 () Bool)

(assert (=> b!49357 (=> (not res!28577) (not e!31699))))

(assert (=> b!49357 (= res!28577 (and (or (not (is-Cons!1306 (t!4341 l!1333))) (bvsle (_1!915 (h!1886 (t!4341 l!1333))) newKey!147)) (is-Cons!1306 (t!4341 l!1333)) (bvslt (_1!915 (h!1886 (t!4341 l!1333))) newKey!147)))))

(declare-fun b!49358 () Bool)

(assert (=> b!49358 (= e!31699 (containsKey!123 (t!4341 (t!4341 l!1333)) newKey!147))))

(assert (= (and d!9861 (not res!28576)) b!49357))

(assert (= (and b!49357 res!28577) b!49358))

(declare-fun m!42793 () Bool)

(assert (=> b!49358 m!42793))

(assert (=> b!49266 d!9861))

(declare-fun c!6668 () Bool)

(declare-fun d!9863 () Bool)

(assert (=> d!9863 (= c!6668 (is-Nil!1307 (t!4341 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147))))))

(declare-fun e!31700 () (Set tuple2!1808))

(assert (=> d!9863 (= (content!52 (t!4341 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147))) e!31700)))

(declare-fun b!49359 () Bool)

(assert (=> b!49359 (= e!31700 (as set.empty (Set tuple2!1808)))))

(declare-fun b!49360 () Bool)

(assert (=> b!49360 (= e!31700 (set.union (set.insert (h!1886 (t!4341 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147))) (as set.empty (Set tuple2!1808))) (content!52 (t!4341 (t!4341 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147))))))))

(assert (= (and d!9863 c!6668) b!49359))

(assert (= (and d!9863 (not c!6668)) b!49360))

(declare-fun m!42795 () Bool)

(assert (=> b!49360 m!42795))

(declare-fun m!42797 () Bool)

(assert (=> b!49360 m!42797))

(assert (=> b!49160 d!9863))

(declare-fun d!9865 () Bool)

(declare-fun res!28578 () Bool)

(declare-fun e!31701 () Bool)

(assert (=> d!9865 (=> res!28578 e!31701)))

(assert (=> d!9865 (= res!28578 (and (is-Cons!1306 lt!20732) (= (_1!915 (h!1886 lt!20732)) newKey!147)))))

(assert (=> d!9865 (= (containsKey!123 lt!20732 newKey!147) e!31701)))

(declare-fun b!49361 () Bool)

(declare-fun e!31702 () Bool)

(assert (=> b!49361 (= e!31701 e!31702)))

(declare-fun res!28579 () Bool)

(assert (=> b!49361 (=> (not res!28579) (not e!31702))))

(assert (=> b!49361 (= res!28579 (and (or (not (is-Cons!1306 lt!20732)) (bvsle (_1!915 (h!1886 lt!20732)) newKey!147)) (is-Cons!1306 lt!20732) (bvslt (_1!915 (h!1886 lt!20732)) newKey!147)))))

(declare-fun b!49362 () Bool)

(assert (=> b!49362 (= e!31702 (containsKey!123 (t!4341 lt!20732) newKey!147))))

(assert (= (and d!9865 (not res!28578)) b!49361))

(assert (= (and b!49361 res!28579) b!49362))

(declare-fun m!42799 () Bool)

(assert (=> b!49362 m!42799))

(assert (=> b!49249 d!9865))

(declare-fun b!49363 () Bool)

(declare-fun e!31703 () Bool)

(declare-fun tp!6511 () Bool)

(assert (=> b!49363 (= e!31703 (and tp_is_empty!2137 tp!6511))))

(assert (=> b!49300 (= tp!6508 e!31703)))

(assert (= (and b!49300 (is-Cons!1306 (t!4341 (t!4341 l!1333)))) b!49363))

(push 1)

(assert (not d!9853))

(assert (not b!49337))

(assert (not b!49325))

(assert (not d!9847))

(assert (not b!49334))

(assert (not b!49360))

(assert (not bm!3837))

(assert (not b!49363))

(assert (not b!49343))

(assert (not b!49358))

(assert (not b!49356))

(assert (not b!49354))

(assert (not b!49362))

(assert (not b!49327))

(assert tp_is_empty!2137)

(assert (not d!9831))

(assert (not b!49335))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

