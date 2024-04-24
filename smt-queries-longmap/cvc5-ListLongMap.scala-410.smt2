; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7658 () Bool)

(assert start!7658)

(declare-fun b!48677 () Bool)

(declare-fun res!28276 () Bool)

(declare-fun e!31256 () Bool)

(assert (=> b!48677 (=> (not res!28276) (not e!31256))))

(declare-datatypes ((B!978 0))(
  ( (B!979 (val!1109 Int)) )
))
(declare-datatypes ((tuple2!1782 0))(
  ( (tuple2!1783 (_1!902 (_ BitVec 64)) (_2!902 B!978)) )
))
(declare-datatypes ((List!1292 0))(
  ( (Nil!1289) (Cons!1288 (h!1868 tuple2!1782) (t!4320 List!1292)) )
))
(declare-fun l!1333 () List!1292)

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!119 (List!1292 (_ BitVec 64)) Bool)

(assert (=> b!48677 (= res!28276 (not (containsKey!119 l!1333 newKey!147)))))

(declare-fun b!48680 () Bool)

(declare-fun e!31257 () Bool)

(declare-fun tp_is_empty!2129 () Bool)

(declare-fun tp!6461 () Bool)

(assert (=> b!48680 (= e!31257 (and tp_is_empty!2129 tp!6461))))

(declare-fun b!48678 () Bool)

(declare-fun res!28275 () Bool)

(assert (=> b!48678 (=> (not res!28275) (not e!31256))))

(assert (=> b!48678 (= res!28275 (is-Nil!1289 l!1333))))

(declare-fun b!48679 () Bool)

(declare-fun newValue!147 () B!978)

(declare-fun content!52 (List!1292) (Set tuple2!1782))

(declare-fun insertStrictlySorted!37 (List!1292 (_ BitVec 64) B!978) List!1292)

(assert (=> b!48679 (= e!31256 (not (= (set.union (content!52 l!1333) (set.insert (tuple2!1783 newKey!147 newValue!147) (as set.empty (Set tuple2!1782)))) (content!52 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147)))))))

(declare-fun res!28274 () Bool)

(assert (=> start!7658 (=> (not res!28274) (not e!31256))))

(declare-fun isStrictlySorted!258 (List!1292) Bool)

(assert (=> start!7658 (= res!28274 (isStrictlySorted!258 l!1333))))

(assert (=> start!7658 e!31256))

(assert (=> start!7658 e!31257))

(assert (=> start!7658 true))

(assert (=> start!7658 tp_is_empty!2129))

(assert (= (and start!7658 res!28274) b!48677))

(assert (= (and b!48677 res!28276) b!48678))

(assert (= (and b!48678 res!28275) b!48679))

(assert (= (and start!7658 (is-Cons!1288 l!1333)) b!48680))

(declare-fun m!42269 () Bool)

(assert (=> b!48677 m!42269))

(declare-fun m!42271 () Bool)

(assert (=> b!48679 m!42271))

(declare-fun m!42273 () Bool)

(assert (=> b!48679 m!42273))

(declare-fun m!42275 () Bool)

(assert (=> b!48679 m!42275))

(assert (=> b!48679 m!42275))

(declare-fun m!42277 () Bool)

(assert (=> b!48679 m!42277))

(declare-fun m!42279 () Bool)

(assert (=> start!7658 m!42279))

(push 1)

(assert (not b!48677))

(assert (not b!48680))

(assert (not start!7658))

(assert (not b!48679))

(assert tp_is_empty!2129)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9665 () Bool)

(declare-fun res!28287 () Bool)

(declare-fun e!31272 () Bool)

(assert (=> d!9665 (=> res!28287 e!31272)))

(assert (=> d!9665 (= res!28287 (and (is-Cons!1288 l!1333) (= (_1!902 (h!1868 l!1333)) newKey!147)))))

(assert (=> d!9665 (= (containsKey!119 l!1333 newKey!147) e!31272)))

(declare-fun b!48699 () Bool)

(declare-fun e!31273 () Bool)

(assert (=> b!48699 (= e!31272 e!31273)))

(declare-fun res!28288 () Bool)

(assert (=> b!48699 (=> (not res!28288) (not e!31273))))

(assert (=> b!48699 (= res!28288 (and (or (not (is-Cons!1288 l!1333)) (bvsle (_1!902 (h!1868 l!1333)) newKey!147)) (is-Cons!1288 l!1333) (bvslt (_1!902 (h!1868 l!1333)) newKey!147)))))

(declare-fun b!48700 () Bool)

(assert (=> b!48700 (= e!31273 (containsKey!119 (t!4320 l!1333) newKey!147))))

(assert (= (and d!9665 (not res!28287)) b!48699))

(assert (= (and b!48699 res!28288) b!48700))

(declare-fun m!42291 () Bool)

(assert (=> b!48700 m!42291))

(assert (=> b!48677 d!9665))

(declare-fun d!9675 () Bool)

(declare-fun c!6522 () Bool)

(assert (=> d!9675 (= c!6522 (is-Nil!1289 l!1333))))

(declare-fun e!31279 () (Set tuple2!1782))

(assert (=> d!9675 (= (content!52 l!1333) e!31279)))

(declare-fun b!48711 () Bool)

(assert (=> b!48711 (= e!31279 (as set.empty (Set tuple2!1782)))))

(declare-fun b!48712 () Bool)

(assert (=> b!48712 (= e!31279 (set.union (set.insert (h!1868 l!1333) (as set.empty (Set tuple2!1782))) (content!52 (t!4320 l!1333))))))

(assert (= (and d!9675 c!6522) b!48711))

(assert (= (and d!9675 (not c!6522)) b!48712))

(declare-fun m!42297 () Bool)

(assert (=> b!48712 m!42297))

(declare-fun m!42299 () Bool)

(assert (=> b!48712 m!42299))

(assert (=> b!48679 d!9675))

(declare-fun d!9679 () Bool)

(declare-fun c!6524 () Bool)

(assert (=> d!9679 (= c!6524 (is-Nil!1289 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147)))))

(declare-fun e!31281 () (Set tuple2!1782))

(assert (=> d!9679 (= (content!52 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147)) e!31281)))

(declare-fun b!48715 () Bool)

(assert (=> b!48715 (= e!31281 (as set.empty (Set tuple2!1782)))))

(declare-fun b!48716 () Bool)

(assert (=> b!48716 (= e!31281 (set.union (set.insert (h!1868 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147)) (as set.empty (Set tuple2!1782))) (content!52 (t!4320 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147)))))))

(assert (= (and d!9679 c!6524) b!48715))

(assert (= (and d!9679 (not c!6524)) b!48716))

(declare-fun m!42305 () Bool)

(assert (=> b!48716 m!42305))

(declare-fun m!42307 () Bool)

(assert (=> b!48716 m!42307))

(assert (=> b!48679 d!9679))

(declare-fun b!48803 () Bool)

(declare-fun e!31331 () List!1292)

(declare-fun call!3785 () List!1292)

(assert (=> b!48803 (= e!31331 call!3785)))

(declare-fun b!48804 () Bool)

(declare-fun e!31328 () List!1292)

(declare-fun call!3783 () List!1292)

(assert (=> b!48804 (= e!31328 call!3783)))

(declare-fun d!9683 () Bool)

(declare-fun e!31332 () Bool)

(assert (=> d!9683 e!31332))

(declare-fun res!28312 () Bool)

(assert (=> d!9683 (=> (not res!28312) (not e!31332))))

(declare-fun lt!20647 () List!1292)

(assert (=> d!9683 (= res!28312 (isStrictlySorted!258 lt!20647))))

(assert (=> d!9683 (= lt!20647 e!31328)))

(declare-fun c!6557 () Bool)

(assert (=> d!9683 (= c!6557 (and (is-Cons!1288 l!1333) (bvslt (_1!902 (h!1868 l!1333)) newKey!147)))))

(assert (=> d!9683 (isStrictlySorted!258 l!1333)))

(assert (=> d!9683 (= (insertStrictlySorted!37 l!1333 newKey!147 newValue!147) lt!20647)))

(declare-fun bm!3780 () Bool)

(declare-fun e!31329 () List!1292)

(declare-fun $colon$colon!52 (List!1292 tuple2!1782) List!1292)

(assert (=> bm!3780 (= call!3783 ($colon$colon!52 e!31329 (ite c!6557 (h!1868 l!1333) (tuple2!1783 newKey!147 newValue!147))))))

(declare-fun c!6558 () Bool)

(assert (=> bm!3780 (= c!6558 c!6557)))

(declare-fun b!48805 () Bool)

(declare-fun contains!597 (List!1292 tuple2!1782) Bool)

(assert (=> b!48805 (= e!31332 (contains!597 lt!20647 (tuple2!1783 newKey!147 newValue!147)))))

(declare-fun b!48806 () Bool)

(declare-fun c!6559 () Bool)

(assert (=> b!48806 (= c!6559 (and (is-Cons!1288 l!1333) (bvsgt (_1!902 (h!1868 l!1333)) newKey!147)))))

(declare-fun e!31330 () List!1292)

(assert (=> b!48806 (= e!31331 e!31330)))

(declare-fun b!48807 () Bool)

(declare-fun call!3784 () List!1292)

(assert (=> b!48807 (= e!31330 call!3784)))

(declare-fun b!48808 () Bool)

(declare-fun res!28311 () Bool)

(assert (=> b!48808 (=> (not res!28311) (not e!31332))))

(assert (=> b!48808 (= res!28311 (containsKey!119 lt!20647 newKey!147))))

(declare-fun b!48809 () Bool)

(declare-fun c!6560 () Bool)

(assert (=> b!48809 (= e!31329 (ite c!6560 (t!4320 l!1333) (ite c!6559 (Cons!1288 (h!1868 l!1333) (t!4320 l!1333)) Nil!1289)))))

(declare-fun b!48810 () Bool)

(assert (=> b!48810 (= e!31330 call!3784)))

(declare-fun bm!3781 () Bool)

(assert (=> bm!3781 (= call!3785 call!3783)))

(declare-fun b!48811 () Bool)

(assert (=> b!48811 (= e!31329 (insertStrictlySorted!37 (t!4320 l!1333) newKey!147 newValue!147))))

(declare-fun b!48812 () Bool)

(assert (=> b!48812 (= e!31328 e!31331)))

(assert (=> b!48812 (= c!6560 (and (is-Cons!1288 l!1333) (= (_1!902 (h!1868 l!1333)) newKey!147)))))

(declare-fun bm!3782 () Bool)

(assert (=> bm!3782 (= call!3784 call!3785)))

(assert (= (and d!9683 c!6557) b!48804))

(assert (= (and d!9683 (not c!6557)) b!48812))

(assert (= (and b!48812 c!6560) b!48803))

(assert (= (and b!48812 (not c!6560)) b!48806))

(assert (= (and b!48806 c!6559) b!48810))

(assert (= (and b!48806 (not c!6559)) b!48807))

(assert (= (or b!48810 b!48807) bm!3782))

(assert (= (or b!48803 bm!3782) bm!3781))

(assert (= (or b!48804 bm!3781) bm!3780))

(assert (= (and bm!3780 c!6558) b!48811))

(assert (= (and bm!3780 (not c!6558)) b!48809))

(assert (= (and d!9683 res!28312) b!48808))

(assert (= (and b!48808 res!28311) b!48805))

(declare-fun m!42331 () Bool)

(assert (=> bm!3780 m!42331))

(declare-fun m!42333 () Bool)

(assert (=> d!9683 m!42333))

(assert (=> d!9683 m!42279))

(declare-fun m!42335 () Bool)

(assert (=> b!48808 m!42335))

(declare-fun m!42337 () Bool)

(assert (=> b!48811 m!42337))

(declare-fun m!42339 () Bool)

(assert (=> b!48805 m!42339))

(assert (=> b!48679 d!9683))

(declare-fun d!9691 () Bool)

(declare-fun res!28329 () Bool)

(declare-fun e!31349 () Bool)

(assert (=> d!9691 (=> res!28329 e!31349)))

(assert (=> d!9691 (= res!28329 (or (is-Nil!1289 l!1333) (is-Nil!1289 (t!4320 l!1333))))))

(assert (=> d!9691 (= (isStrictlySorted!258 l!1333) e!31349)))

(declare-fun b!48829 () Bool)

(declare-fun e!31350 () Bool)

(assert (=> b!48829 (= e!31349 e!31350)))

(declare-fun res!28330 () Bool)

(assert (=> b!48829 (=> (not res!28330) (not e!31350))))

(assert (=> b!48829 (= res!28330 (bvslt (_1!902 (h!1868 l!1333)) (_1!902 (h!1868 (t!4320 l!1333)))))))

(declare-fun b!48830 () Bool)

(assert (=> b!48830 (= e!31350 (isStrictlySorted!258 (t!4320 l!1333)))))

(assert (= (and d!9691 (not res!28329)) b!48829))

(assert (= (and b!48829 res!28330) b!48830))

(declare-fun m!42345 () Bool)

(assert (=> b!48830 m!42345))

(assert (=> start!7658 d!9691))

(declare-fun b!48845 () Bool)

(declare-fun e!31359 () Bool)

(declare-fun tp!6470 () Bool)

(assert (=> b!48845 (= e!31359 (and tp_is_empty!2129 tp!6470))))

(assert (=> b!48680 (= tp!6461 e!31359)))

(assert (= (and b!48680 (is-Cons!1288 (t!4320 l!1333))) b!48845))

(push 1)

(assert (not b!48830))

(assert (not b!48712))

(assert (not b!48716))

(assert (not bm!3780))

(assert tp_is_empty!2129)

(assert (not b!48700))

(assert (not d!9683))

(assert (not b!48845))

(assert (not b!48811))

(assert (not b!48808))

(assert (not b!48805))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9693 () Bool)

(assert (=> d!9693 (= ($colon$colon!52 e!31329 (ite c!6557 (h!1868 l!1333) (tuple2!1783 newKey!147 newValue!147))) (Cons!1288 (ite c!6557 (h!1868 l!1333) (tuple2!1783 newKey!147 newValue!147)) e!31329))))

(assert (=> bm!3780 d!9693))

(declare-fun d!9695 () Bool)

(declare-fun c!6561 () Bool)

(assert (=> d!9695 (= c!6561 (is-Nil!1289 (t!4320 l!1333)))))

(declare-fun e!31360 () (Set tuple2!1782))

(assert (=> d!9695 (= (content!52 (t!4320 l!1333)) e!31360)))

(declare-fun b!48846 () Bool)

(assert (=> b!48846 (= e!31360 (as set.empty (Set tuple2!1782)))))

(declare-fun b!48847 () Bool)

(assert (=> b!48847 (= e!31360 (set.union (set.insert (h!1868 (t!4320 l!1333)) (as set.empty (Set tuple2!1782))) (content!52 (t!4320 (t!4320 l!1333)))))))

(assert (= (and d!9695 c!6561) b!48846))

(assert (= (and d!9695 (not c!6561)) b!48847))

(declare-fun m!42347 () Bool)

(assert (=> b!48847 m!42347))

(declare-fun m!42349 () Bool)

(assert (=> b!48847 m!42349))

(assert (=> b!48712 d!9695))

(declare-fun d!9699 () Bool)

(declare-fun res!28331 () Bool)

(declare-fun e!31362 () Bool)

(assert (=> d!9699 (=> res!28331 e!31362)))

(assert (=> d!9699 (= res!28331 (or (is-Nil!1289 lt!20647) (is-Nil!1289 (t!4320 lt!20647))))))

(assert (=> d!9699 (= (isStrictlySorted!258 lt!20647) e!31362)))

(declare-fun b!48850 () Bool)

(declare-fun e!31363 () Bool)

(assert (=> b!48850 (= e!31362 e!31363)))

(declare-fun res!28332 () Bool)

(assert (=> b!48850 (=> (not res!28332) (not e!31363))))

(assert (=> b!48850 (= res!28332 (bvslt (_1!902 (h!1868 lt!20647)) (_1!902 (h!1868 (t!4320 lt!20647)))))))

(declare-fun b!48851 () Bool)

(assert (=> b!48851 (= e!31363 (isStrictlySorted!258 (t!4320 lt!20647)))))

(assert (= (and d!9699 (not res!28331)) b!48850))

(assert (= (and b!48850 res!28332) b!48851))

(declare-fun m!42355 () Bool)

(assert (=> b!48851 m!42355))

(assert (=> d!9683 d!9699))

(assert (=> d!9683 d!9691))

(declare-fun d!9703 () Bool)

(declare-fun res!28333 () Bool)

(declare-fun e!31364 () Bool)

(assert (=> d!9703 (=> res!28333 e!31364)))

(assert (=> d!9703 (= res!28333 (or (is-Nil!1289 (t!4320 l!1333)) (is-Nil!1289 (t!4320 (t!4320 l!1333)))))))

(assert (=> d!9703 (= (isStrictlySorted!258 (t!4320 l!1333)) e!31364)))

(declare-fun b!48852 () Bool)

(declare-fun e!31365 () Bool)

(assert (=> b!48852 (= e!31364 e!31365)))

(declare-fun res!28334 () Bool)

(assert (=> b!48852 (=> (not res!28334) (not e!31365))))

(assert (=> b!48852 (= res!28334 (bvslt (_1!902 (h!1868 (t!4320 l!1333))) (_1!902 (h!1868 (t!4320 (t!4320 l!1333))))))))

(declare-fun b!48853 () Bool)

(assert (=> b!48853 (= e!31365 (isStrictlySorted!258 (t!4320 (t!4320 l!1333))))))

(assert (= (and d!9703 (not res!28333)) b!48852))

(assert (= (and b!48852 res!28334) b!48853))

(declare-fun m!42357 () Bool)

(assert (=> b!48853 m!42357))

(assert (=> b!48830 d!9703))

(declare-fun d!9705 () Bool)

(declare-fun res!28335 () Bool)

(declare-fun e!31366 () Bool)

(assert (=> d!9705 (=> res!28335 e!31366)))

(assert (=> d!9705 (= res!28335 (and (is-Cons!1288 lt!20647) (= (_1!902 (h!1868 lt!20647)) newKey!147)))))

(assert (=> d!9705 (= (containsKey!119 lt!20647 newKey!147) e!31366)))

(declare-fun b!48854 () Bool)

(declare-fun e!31367 () Bool)

(assert (=> b!48854 (= e!31366 e!31367)))

(declare-fun res!28336 () Bool)

(assert (=> b!48854 (=> (not res!28336) (not e!31367))))

(assert (=> b!48854 (= res!28336 (and (or (not (is-Cons!1288 lt!20647)) (bvsle (_1!902 (h!1868 lt!20647)) newKey!147)) (is-Cons!1288 lt!20647) (bvslt (_1!902 (h!1868 lt!20647)) newKey!147)))))

(declare-fun b!48855 () Bool)

(assert (=> b!48855 (= e!31367 (containsKey!119 (t!4320 lt!20647) newKey!147))))

(assert (= (and d!9705 (not res!28335)) b!48854))

(assert (= (and b!48854 res!28336) b!48855))

(declare-fun m!42359 () Bool)

(assert (=> b!48855 m!42359))

(assert (=> b!48808 d!9705))

(declare-fun b!48856 () Bool)

(declare-fun e!31371 () List!1292)

(declare-fun call!3788 () List!1292)

(assert (=> b!48856 (= e!31371 call!3788)))

(declare-fun b!48857 () Bool)

(declare-fun e!31368 () List!1292)

(declare-fun call!3786 () List!1292)

(assert (=> b!48857 (= e!31368 call!3786)))

(declare-fun d!9707 () Bool)

(declare-fun e!31372 () Bool)

(assert (=> d!9707 e!31372))

(declare-fun res!28338 () Bool)

(assert (=> d!9707 (=> (not res!28338) (not e!31372))))

(declare-fun lt!20648 () List!1292)

(assert (=> d!9707 (= res!28338 (isStrictlySorted!258 lt!20648))))

(assert (=> d!9707 (= lt!20648 e!31368)))

(declare-fun c!6563 () Bool)

(assert (=> d!9707 (= c!6563 (and (is-Cons!1288 (t!4320 l!1333)) (bvslt (_1!902 (h!1868 (t!4320 l!1333))) newKey!147)))))

(assert (=> d!9707 (isStrictlySorted!258 (t!4320 l!1333))))

(assert (=> d!9707 (= (insertStrictlySorted!37 (t!4320 l!1333) newKey!147 newValue!147) lt!20648)))

(declare-fun e!31369 () List!1292)

(declare-fun bm!3783 () Bool)

(assert (=> bm!3783 (= call!3786 ($colon$colon!52 e!31369 (ite c!6563 (h!1868 (t!4320 l!1333)) (tuple2!1783 newKey!147 newValue!147))))))

(declare-fun c!6564 () Bool)

(assert (=> bm!3783 (= c!6564 c!6563)))

(declare-fun b!48858 () Bool)

(assert (=> b!48858 (= e!31372 (contains!597 lt!20648 (tuple2!1783 newKey!147 newValue!147)))))

(declare-fun b!48859 () Bool)

(declare-fun c!6565 () Bool)

(assert (=> b!48859 (= c!6565 (and (is-Cons!1288 (t!4320 l!1333)) (bvsgt (_1!902 (h!1868 (t!4320 l!1333))) newKey!147)))))

(declare-fun e!31370 () List!1292)

(assert (=> b!48859 (= e!31371 e!31370)))

(declare-fun b!48860 () Bool)

(declare-fun call!3787 () List!1292)

(assert (=> b!48860 (= e!31370 call!3787)))

(declare-fun b!48861 () Bool)

(declare-fun res!28337 () Bool)

(assert (=> b!48861 (=> (not res!28337) (not e!31372))))

(assert (=> b!48861 (= res!28337 (containsKey!119 lt!20648 newKey!147))))

(declare-fun c!6566 () Bool)

(declare-fun b!48862 () Bool)

(assert (=> b!48862 (= e!31369 (ite c!6566 (t!4320 (t!4320 l!1333)) (ite c!6565 (Cons!1288 (h!1868 (t!4320 l!1333)) (t!4320 (t!4320 l!1333))) Nil!1289)))))

(declare-fun b!48863 () Bool)

(assert (=> b!48863 (= e!31370 call!3787)))

(declare-fun bm!3784 () Bool)

(assert (=> bm!3784 (= call!3788 call!3786)))

(declare-fun b!48864 () Bool)

(assert (=> b!48864 (= e!31369 (insertStrictlySorted!37 (t!4320 (t!4320 l!1333)) newKey!147 newValue!147))))

(declare-fun b!48865 () Bool)

(assert (=> b!48865 (= e!31368 e!31371)))

(assert (=> b!48865 (= c!6566 (and (is-Cons!1288 (t!4320 l!1333)) (= (_1!902 (h!1868 (t!4320 l!1333))) newKey!147)))))

(declare-fun bm!3785 () Bool)

(assert (=> bm!3785 (= call!3787 call!3788)))

(assert (= (and d!9707 c!6563) b!48857))

(assert (= (and d!9707 (not c!6563)) b!48865))

(assert (= (and b!48865 c!6566) b!48856))

(assert (= (and b!48865 (not c!6566)) b!48859))

(assert (= (and b!48859 c!6565) b!48863))

(assert (= (and b!48859 (not c!6565)) b!48860))

(assert (= (or b!48863 b!48860) bm!3785))

(assert (= (or b!48856 bm!3785) bm!3784))

(assert (= (or b!48857 bm!3784) bm!3783))

(assert (= (and bm!3783 c!6564) b!48864))

(assert (= (and bm!3783 (not c!6564)) b!48862))

(assert (= (and d!9707 res!28338) b!48861))

(assert (= (and b!48861 res!28337) b!48858))

(declare-fun m!42361 () Bool)

(assert (=> bm!3783 m!42361))

(declare-fun m!42363 () Bool)

(assert (=> d!9707 m!42363))

(assert (=> d!9707 m!42345))

(declare-fun m!42365 () Bool)

(assert (=> b!48861 m!42365))

(declare-fun m!42367 () Bool)

(assert (=> b!48864 m!42367))

(declare-fun m!42369 () Bool)

(assert (=> b!48858 m!42369))

(assert (=> b!48811 d!9707))

(declare-fun d!9709 () Bool)

(declare-fun res!28339 () Bool)

(declare-fun e!31373 () Bool)

(assert (=> d!9709 (=> res!28339 e!31373)))

(assert (=> d!9709 (= res!28339 (and (is-Cons!1288 (t!4320 l!1333)) (= (_1!902 (h!1868 (t!4320 l!1333))) newKey!147)))))

(assert (=> d!9709 (= (containsKey!119 (t!4320 l!1333) newKey!147) e!31373)))

(declare-fun b!48866 () Bool)

(declare-fun e!31374 () Bool)

(assert (=> b!48866 (= e!31373 e!31374)))

(declare-fun res!28340 () Bool)

(assert (=> b!48866 (=> (not res!28340) (not e!31374))))

(assert (=> b!48866 (= res!28340 (and (or (not (is-Cons!1288 (t!4320 l!1333))) (bvsle (_1!902 (h!1868 (t!4320 l!1333))) newKey!147)) (is-Cons!1288 (t!4320 l!1333)) (bvslt (_1!902 (h!1868 (t!4320 l!1333))) newKey!147)))))

(declare-fun b!48867 () Bool)

(assert (=> b!48867 (= e!31374 (containsKey!119 (t!4320 (t!4320 l!1333)) newKey!147))))

(assert (= (and d!9709 (not res!28339)) b!48866))

(assert (= (and b!48866 res!28340) b!48867))

(declare-fun m!42371 () Bool)

(assert (=> b!48867 m!42371))

(assert (=> b!48700 d!9709))

(declare-fun d!9711 () Bool)

(declare-fun c!6567 () Bool)

(assert (=> d!9711 (= c!6567 (is-Nil!1289 (t!4320 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147))))))

(declare-fun e!31375 () (Set tuple2!1782))

(assert (=> d!9711 (= (content!52 (t!4320 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147))) e!31375)))

(declare-fun b!48868 () Bool)

(assert (=> b!48868 (= e!31375 (as set.empty (Set tuple2!1782)))))

(declare-fun b!48869 () Bool)

(assert (=> b!48869 (= e!31375 (set.union (set.insert (h!1868 (t!4320 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147))) (as set.empty (Set tuple2!1782))) (content!52 (t!4320 (t!4320 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147))))))))

(assert (= (and d!9711 c!6567) b!48868))

(assert (= (and d!9711 (not c!6567)) b!48869))

(declare-fun m!42373 () Bool)

(assert (=> b!48869 m!42373))

(declare-fun m!42375 () Bool)

(assert (=> b!48869 m!42375))

(assert (=> b!48716 d!9711))

(declare-fun lt!20655 () Bool)

(declare-fun d!9713 () Bool)

(assert (=> d!9713 (= lt!20655 (set.member (tuple2!1783 newKey!147 newValue!147) (content!52 lt!20647)))))

(declare-fun e!31392 () Bool)

(assert (=> d!9713 (= lt!20655 e!31392)))

(declare-fun res!28353 () Bool)

(assert (=> d!9713 (=> (not res!28353) (not e!31392))))

(assert (=> d!9713 (= res!28353 (is-Cons!1288 lt!20647))))

(assert (=> d!9713 (= (contains!597 lt!20647 (tuple2!1783 newKey!147 newValue!147)) lt!20655)))

(declare-fun b!48892 () Bool)

(declare-fun e!31393 () Bool)

(assert (=> b!48892 (= e!31392 e!31393)))

(declare-fun res!28354 () Bool)

(assert (=> b!48892 (=> res!28354 e!31393)))

(assert (=> b!48892 (= res!28354 (= (h!1868 lt!20647) (tuple2!1783 newKey!147 newValue!147)))))

(declare-fun b!48893 () Bool)

(assert (=> b!48893 (= e!31393 (contains!597 (t!4320 lt!20647) (tuple2!1783 newKey!147 newValue!147)))))

(assert (= (and d!9713 res!28353) b!48892))

(assert (= (and b!48892 (not res!28354)) b!48893))

(declare-fun m!42391 () Bool)

(assert (=> d!9713 m!42391))

(declare-fun m!42397 () Bool)

(assert (=> d!9713 m!42397))

(declare-fun m!42401 () Bool)

(assert (=> b!48893 m!42401))

(assert (=> b!48805 d!9713))

(declare-fun b!48898 () Bool)

(declare-fun e!31398 () Bool)

(declare-fun tp!6471 () Bool)

(assert (=> b!48898 (= e!31398 (and tp_is_empty!2129 tp!6471))))

(assert (=> b!48845 (= tp!6470 e!31398)))

(assert (= (and b!48845 (is-Cons!1288 (t!4320 (t!4320 l!1333)))) b!48898))

(push 1)

(assert (not b!48869))

(assert (not b!48867))

(assert (not b!48864))

(assert (not bm!3783))

(assert (not d!9713))

(assert (not b!48855))

(assert (not b!48861))

(assert (not d!9707))

(assert (not b!48858))

(assert (not b!48853))

(assert (not b!48898))

(assert tp_is_empty!2129)

(assert (not b!48847))

(assert (not b!48851))

(assert (not b!48893))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

