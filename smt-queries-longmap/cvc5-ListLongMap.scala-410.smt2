; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7654 () Bool)

(assert start!7654)

(declare-fun res!28279 () Bool)

(declare-fun e!31251 () Bool)

(assert (=> start!7654 (=> (not res!28279) (not e!31251))))

(declare-datatypes ((B!978 0))(
  ( (B!979 (val!1109 Int)) )
))
(declare-datatypes ((tuple2!1804 0))(
  ( (tuple2!1805 (_1!913 (_ BitVec 64)) (_2!913 B!978)) )
))
(declare-datatypes ((List!1302 0))(
  ( (Nil!1299) (Cons!1298 (h!1878 tuple2!1804) (t!4329 List!1302)) )
))
(declare-fun l!1333 () List!1302)

(declare-fun isStrictlySorted!265 (List!1302) Bool)

(assert (=> start!7654 (= res!28279 (isStrictlySorted!265 l!1333))))

(assert (=> start!7654 e!31251))

(declare-fun e!31250 () Bool)

(assert (=> start!7654 e!31250))

(assert (=> start!7654 true))

(declare-fun tp_is_empty!2129 () Bool)

(assert (=> start!7654 tp_is_empty!2129))

(declare-fun b!48669 () Bool)

(declare-fun res!28280 () Bool)

(assert (=> b!48669 (=> (not res!28280) (not e!31251))))

(assert (=> b!48669 (= res!28280 (is-Nil!1299 l!1333))))

(declare-fun b!48671 () Bool)

(declare-fun tp!6461 () Bool)

(assert (=> b!48671 (= e!31250 (and tp_is_empty!2129 tp!6461))))

(declare-fun b!48670 () Bool)

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun newValue!147 () B!978)

(declare-fun content!51 (List!1302) (Set tuple2!1804))

(declare-fun insertStrictlySorted!37 (List!1302 (_ BitVec 64) B!978) List!1302)

(assert (=> b!48670 (= e!31251 (not (= (set.union (content!51 l!1333) (set.insert (tuple2!1805 newKey!147 newValue!147) (as set.empty (Set tuple2!1804)))) (content!51 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147)))))))

(declare-fun b!48668 () Bool)

(declare-fun res!28281 () Bool)

(assert (=> b!48668 (=> (not res!28281) (not e!31251))))

(declare-fun containsKey!117 (List!1302 (_ BitVec 64)) Bool)

(assert (=> b!48668 (= res!28281 (not (containsKey!117 l!1333 newKey!147)))))

(assert (= (and start!7654 res!28279) b!48668))

(assert (= (and b!48668 res!28281) b!48669))

(assert (= (and b!48669 res!28280) b!48670))

(assert (= (and start!7654 (is-Cons!1298 l!1333)) b!48671))

(declare-fun m!42311 () Bool)

(assert (=> start!7654 m!42311))

(declare-fun m!42313 () Bool)

(assert (=> b!48670 m!42313))

(declare-fun m!42315 () Bool)

(assert (=> b!48670 m!42315))

(declare-fun m!42317 () Bool)

(assert (=> b!48670 m!42317))

(assert (=> b!48670 m!42317))

(declare-fun m!42319 () Bool)

(assert (=> b!48670 m!42319))

(declare-fun m!42321 () Bool)

(assert (=> b!48668 m!42321))

(push 1)

(assert (not start!7654))

(assert (not b!48668))

(assert (not b!48671))

(assert (not b!48670))

(assert tp_is_empty!2129)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9651 () Bool)

(declare-fun c!6511 () Bool)

(assert (=> d!9651 (= c!6511 (is-Nil!1299 l!1333))))

(declare-fun e!31261 () (Set tuple2!1804))

(assert (=> d!9651 (= (content!51 l!1333) e!31261)))

(declare-fun b!48686 () Bool)

(assert (=> b!48686 (= e!31261 (as set.empty (Set tuple2!1804)))))

(declare-fun b!48687 () Bool)

(assert (=> b!48687 (= e!31261 (set.union (set.insert (h!1878 l!1333) (as set.empty (Set tuple2!1804))) (content!51 (t!4329 l!1333))))))

(assert (= (and d!9651 c!6511) b!48686))

(assert (= (and d!9651 (not c!6511)) b!48687))

(declare-fun m!42327 () Bool)

(assert (=> b!48687 m!42327))

(declare-fun m!42329 () Bool)

(assert (=> b!48687 m!42329))

(assert (=> b!48670 d!9651))

(declare-fun d!9657 () Bool)

(declare-fun c!6513 () Bool)

(assert (=> d!9657 (= c!6513 (is-Nil!1299 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147)))))

(declare-fun e!31263 () (Set tuple2!1804))

(assert (=> d!9657 (= (content!51 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147)) e!31263)))

(declare-fun b!48690 () Bool)

(assert (=> b!48690 (= e!31263 (as set.empty (Set tuple2!1804)))))

(declare-fun b!48691 () Bool)

(assert (=> b!48691 (= e!31263 (set.union (set.insert (h!1878 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147)) (as set.empty (Set tuple2!1804))) (content!51 (t!4329 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147)))))))

(assert (= (and d!9657 c!6513) b!48690))

(assert (= (and d!9657 (not c!6513)) b!48691))

(declare-fun m!42335 () Bool)

(assert (=> b!48691 m!42335))

(declare-fun m!42337 () Bool)

(assert (=> b!48691 m!42337))

(assert (=> b!48670 d!9657))

(declare-fun b!48762 () Bool)

(declare-fun e!31306 () List!1302)

(declare-fun call!3789 () List!1302)

(assert (=> b!48762 (= e!31306 call!3789)))

(declare-fun bm!3784 () Bool)

(declare-fun call!3788 () List!1302)

(assert (=> bm!3784 (= call!3788 call!3789)))

(declare-fun bm!3785 () Bool)

(declare-fun call!3787 () List!1302)

(assert (=> bm!3785 (= call!3789 call!3787)))

(declare-fun b!48763 () Bool)

(declare-fun c!6543 () Bool)

(assert (=> b!48763 (= c!6543 (and (is-Cons!1298 l!1333) (bvsgt (_1!913 (h!1878 l!1333)) newKey!147)))))

(declare-fun e!31305 () List!1302)

(assert (=> b!48763 (= e!31306 e!31305)))

(declare-fun b!48764 () Bool)

(declare-fun res!28305 () Bool)

(declare-fun e!31301 () Bool)

(assert (=> b!48764 (=> (not res!28305) (not e!31301))))

(declare-fun lt!20673 () List!1302)

(assert (=> b!48764 (= res!28305 (containsKey!117 lt!20673 newKey!147))))

(declare-fun bm!3786 () Bool)

(declare-fun e!31304 () List!1302)

(declare-fun c!6542 () Bool)

(declare-fun $colon$colon!52 (List!1302 tuple2!1804) List!1302)

(assert (=> bm!3786 (= call!3787 ($colon$colon!52 e!31304 (ite c!6542 (h!1878 l!1333) (tuple2!1805 newKey!147 newValue!147))))))

(declare-fun c!6539 () Bool)

(assert (=> bm!3786 (= c!6539 c!6542)))

(declare-fun d!9661 () Bool)

(assert (=> d!9661 e!31301))

(declare-fun res!28304 () Bool)

(assert (=> d!9661 (=> (not res!28304) (not e!31301))))

(assert (=> d!9661 (= res!28304 (isStrictlySorted!265 lt!20673))))

(declare-fun e!31307 () List!1302)

(assert (=> d!9661 (= lt!20673 e!31307)))

(assert (=> d!9661 (= c!6542 (and (is-Cons!1298 l!1333) (bvslt (_1!913 (h!1878 l!1333)) newKey!147)))))

(assert (=> d!9661 (isStrictlySorted!265 l!1333)))

(assert (=> d!9661 (= (insertStrictlySorted!37 l!1333 newKey!147 newValue!147) lt!20673)))

(declare-fun b!48765 () Bool)

(assert (=> b!48765 (= e!31307 e!31306)))

(declare-fun c!6541 () Bool)

(assert (=> b!48765 (= c!6541 (and (is-Cons!1298 l!1333) (= (_1!913 (h!1878 l!1333)) newKey!147)))))

(declare-fun b!48766 () Bool)

(assert (=> b!48766 (= e!31307 call!3787)))

(declare-fun b!48767 () Bool)

(assert (=> b!48767 (= e!31304 (insertStrictlySorted!37 (t!4329 l!1333) newKey!147 newValue!147))))

(declare-fun b!48768 () Bool)

(declare-fun contains!604 (List!1302 tuple2!1804) Bool)

(assert (=> b!48768 (= e!31301 (contains!604 lt!20673 (tuple2!1805 newKey!147 newValue!147)))))

(declare-fun b!48769 () Bool)

(assert (=> b!48769 (= e!31304 (ite c!6541 (t!4329 l!1333) (ite c!6543 (Cons!1298 (h!1878 l!1333) (t!4329 l!1333)) Nil!1299)))))

(declare-fun b!48770 () Bool)

(assert (=> b!48770 (= e!31305 call!3788)))

(declare-fun b!48771 () Bool)

(assert (=> b!48771 (= e!31305 call!3788)))

(assert (= (and d!9661 c!6542) b!48766))

(assert (= (and d!9661 (not c!6542)) b!48765))

(assert (= (and b!48765 c!6541) b!48762))

(assert (= (and b!48765 (not c!6541)) b!48763))

(assert (= (and b!48763 c!6543) b!48770))

(assert (= (and b!48763 (not c!6543)) b!48771))

(assert (= (or b!48770 b!48771) bm!3784))

(assert (= (or b!48762 bm!3784) bm!3785))

(assert (= (or b!48766 bm!3785) bm!3786))

(assert (= (and bm!3786 c!6539) b!48767))

(assert (= (and bm!3786 (not c!6539)) b!48769))

(assert (= (and d!9661 res!28304) b!48764))

(assert (= (and b!48764 res!28305) b!48768))

(declare-fun m!42358 () Bool)

(assert (=> d!9661 m!42358))

(assert (=> d!9661 m!42311))

(declare-fun m!42363 () Bool)

(assert (=> b!48767 m!42363))

(declare-fun m!42365 () Bool)

(assert (=> bm!3786 m!42365))

(declare-fun m!42367 () Bool)

(assert (=> b!48764 m!42367))

(declare-fun m!42369 () Bool)

(assert (=> b!48768 m!42369))

(assert (=> b!48670 d!9661))

(declare-fun d!9673 () Bool)

(declare-fun res!28320 () Bool)

(declare-fun e!31326 () Bool)

(assert (=> d!9673 (=> res!28320 e!31326)))

(assert (=> d!9673 (= res!28320 (or (is-Nil!1299 l!1333) (is-Nil!1299 (t!4329 l!1333))))))

(assert (=> d!9673 (= (isStrictlySorted!265 l!1333) e!31326)))

(declare-fun b!48798 () Bool)

(declare-fun e!31327 () Bool)

(assert (=> b!48798 (= e!31326 e!31327)))

(declare-fun res!28321 () Bool)

(assert (=> b!48798 (=> (not res!28321) (not e!31327))))

(assert (=> b!48798 (= res!28321 (bvslt (_1!913 (h!1878 l!1333)) (_1!913 (h!1878 (t!4329 l!1333)))))))

(declare-fun b!48799 () Bool)

(assert (=> b!48799 (= e!31327 (isStrictlySorted!265 (t!4329 l!1333)))))

(assert (= (and d!9673 (not res!28320)) b!48798))

(assert (= (and b!48798 res!28321) b!48799))

(declare-fun m!42373 () Bool)

(assert (=> b!48799 m!42373))

(assert (=> start!7654 d!9673))

(declare-fun d!9677 () Bool)

(declare-fun res!28334 () Bool)

(declare-fun e!31343 () Bool)

(assert (=> d!9677 (=> res!28334 e!31343)))

(assert (=> d!9677 (= res!28334 (and (is-Cons!1298 l!1333) (= (_1!913 (h!1878 l!1333)) newKey!147)))))

(assert (=> d!9677 (= (containsKey!117 l!1333 newKey!147) e!31343)))

(declare-fun b!48820 () Bool)

(declare-fun e!31344 () Bool)

(assert (=> b!48820 (= e!31343 e!31344)))

(declare-fun res!28335 () Bool)

(assert (=> b!48820 (=> (not res!28335) (not e!31344))))

(assert (=> b!48820 (= res!28335 (and (or (not (is-Cons!1298 l!1333)) (bvsle (_1!913 (h!1878 l!1333)) newKey!147)) (is-Cons!1298 l!1333) (bvslt (_1!913 (h!1878 l!1333)) newKey!147)))))

(declare-fun b!48821 () Bool)

(assert (=> b!48821 (= e!31344 (containsKey!117 (t!4329 l!1333) newKey!147))))

(assert (= (and d!9677 (not res!28334)) b!48820))

(assert (= (and b!48820 res!28335) b!48821))

(declare-fun m!42387 () Bool)

(assert (=> b!48821 m!42387))

(assert (=> b!48668 d!9677))

(declare-fun b!48836 () Bool)

(declare-fun e!31353 () Bool)

(declare-fun tp!6470 () Bool)

(assert (=> b!48836 (= e!31353 (and tp_is_empty!2129 tp!6470))))

(assert (=> b!48671 (= tp!6461 e!31353)))

(assert (= (and b!48671 (is-Cons!1298 (t!4329 l!1333))) b!48836))

(push 1)

(assert (not b!48767))

(assert (not b!48768))

(assert (not b!48799))

(assert (not b!48764))

(assert (not b!48687))

(assert (not bm!3786))

(assert (not b!48821))

(assert tp_is_empty!2129)

(assert (not b!48836))

(assert (not d!9661))

(assert (not b!48691))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9679 () Bool)

(declare-fun res!28336 () Bool)

(declare-fun e!31354 () Bool)

(assert (=> d!9679 (=> res!28336 e!31354)))

(assert (=> d!9679 (= res!28336 (and (is-Cons!1298 (t!4329 l!1333)) (= (_1!913 (h!1878 (t!4329 l!1333))) newKey!147)))))

(assert (=> d!9679 (= (containsKey!117 (t!4329 l!1333) newKey!147) e!31354)))

(declare-fun b!48837 () Bool)

(declare-fun e!31355 () Bool)

(assert (=> b!48837 (= e!31354 e!31355)))

(declare-fun res!28337 () Bool)

(assert (=> b!48837 (=> (not res!28337) (not e!31355))))

(assert (=> b!48837 (= res!28337 (and (or (not (is-Cons!1298 (t!4329 l!1333))) (bvsle (_1!913 (h!1878 (t!4329 l!1333))) newKey!147)) (is-Cons!1298 (t!4329 l!1333)) (bvslt (_1!913 (h!1878 (t!4329 l!1333))) newKey!147)))))

(declare-fun b!48838 () Bool)

(assert (=> b!48838 (= e!31355 (containsKey!117 (t!4329 (t!4329 l!1333)) newKey!147))))

(assert (= (and d!9679 (not res!28336)) b!48837))

(assert (= (and b!48837 res!28337) b!48838))

(declare-fun m!42389 () Bool)

(assert (=> b!48838 m!42389))

(assert (=> b!48821 d!9679))

(declare-fun d!9681 () Bool)

(declare-fun res!28338 () Bool)

(declare-fun e!31356 () Bool)

(assert (=> d!9681 (=> res!28338 e!31356)))

(assert (=> d!9681 (= res!28338 (or (is-Nil!1299 lt!20673) (is-Nil!1299 (t!4329 lt!20673))))))

(assert (=> d!9681 (= (isStrictlySorted!265 lt!20673) e!31356)))

(declare-fun b!48839 () Bool)

(declare-fun e!31357 () Bool)

(assert (=> b!48839 (= e!31356 e!31357)))

(declare-fun res!28339 () Bool)

(assert (=> b!48839 (=> (not res!28339) (not e!31357))))

(assert (=> b!48839 (= res!28339 (bvslt (_1!913 (h!1878 lt!20673)) (_1!913 (h!1878 (t!4329 lt!20673)))))))

(declare-fun b!48840 () Bool)

(assert (=> b!48840 (= e!31357 (isStrictlySorted!265 (t!4329 lt!20673)))))

(assert (= (and d!9681 (not res!28338)) b!48839))

(assert (= (and b!48839 res!28339) b!48840))

(declare-fun m!42391 () Bool)

(assert (=> b!48840 m!42391))

(assert (=> d!9661 d!9681))

(assert (=> d!9661 d!9673))

(declare-fun d!9683 () Bool)

(declare-fun res!28340 () Bool)

(declare-fun e!31358 () Bool)

(assert (=> d!9683 (=> res!28340 e!31358)))

(assert (=> d!9683 (= res!28340 (or (is-Nil!1299 (t!4329 l!1333)) (is-Nil!1299 (t!4329 (t!4329 l!1333)))))))

(assert (=> d!9683 (= (isStrictlySorted!265 (t!4329 l!1333)) e!31358)))

(declare-fun b!48841 () Bool)

(declare-fun e!31359 () Bool)

(assert (=> b!48841 (= e!31358 e!31359)))

(declare-fun res!28341 () Bool)

(assert (=> b!48841 (=> (not res!28341) (not e!31359))))

(assert (=> b!48841 (= res!28341 (bvslt (_1!913 (h!1878 (t!4329 l!1333))) (_1!913 (h!1878 (t!4329 (t!4329 l!1333))))))))

(declare-fun b!48842 () Bool)

(assert (=> b!48842 (= e!31359 (isStrictlySorted!265 (t!4329 (t!4329 l!1333))))))

(assert (= (and d!9683 (not res!28340)) b!48841))

(assert (= (and b!48841 res!28341) b!48842))

(declare-fun m!42393 () Bool)

(assert (=> b!48842 m!42393))

(assert (=> b!48799 d!9683))

(declare-fun d!9685 () Bool)

(declare-fun lt!20677 () Bool)

(assert (=> d!9685 (= lt!20677 (set.member (tuple2!1805 newKey!147 newValue!147) (content!51 lt!20673)))))

(declare-fun e!31370 () Bool)

(assert (=> d!9685 (= lt!20677 e!31370)))

(declare-fun res!28350 () Bool)

(assert (=> d!9685 (=> (not res!28350) (not e!31370))))

(assert (=> d!9685 (= res!28350 (is-Cons!1298 lt!20673))))

(assert (=> d!9685 (= (contains!604 lt!20673 (tuple2!1805 newKey!147 newValue!147)) lt!20677)))

(declare-fun b!48853 () Bool)

(declare-fun e!31369 () Bool)

(assert (=> b!48853 (= e!31370 e!31369)))

(declare-fun res!28351 () Bool)

(assert (=> b!48853 (=> res!28351 e!31369)))

(assert (=> b!48853 (= res!28351 (= (h!1878 lt!20673) (tuple2!1805 newKey!147 newValue!147)))))

(declare-fun b!48854 () Bool)

(assert (=> b!48854 (= e!31369 (contains!604 (t!4329 lt!20673) (tuple2!1805 newKey!147 newValue!147)))))

(assert (= (and d!9685 res!28350) b!48853))

(assert (= (and b!48853 (not res!28351)) b!48854))

(declare-fun m!42403 () Bool)

(assert (=> d!9685 m!42403))

(declare-fun m!42405 () Bool)

(assert (=> d!9685 m!42405))

(declare-fun m!42407 () Bool)

(assert (=> b!48854 m!42407))

(assert (=> b!48768 d!9685))

(declare-fun d!9695 () Bool)

(declare-fun c!6555 () Bool)

(assert (=> d!9695 (= c!6555 (is-Nil!1299 (t!4329 l!1333)))))

(declare-fun e!31371 () (Set tuple2!1804))

(assert (=> d!9695 (= (content!51 (t!4329 l!1333)) e!31371)))

(declare-fun b!48855 () Bool)

(assert (=> b!48855 (= e!31371 (as set.empty (Set tuple2!1804)))))

(declare-fun b!48856 () Bool)

(assert (=> b!48856 (= e!31371 (set.union (set.insert (h!1878 (t!4329 l!1333)) (as set.empty (Set tuple2!1804))) (content!51 (t!4329 (t!4329 l!1333)))))))

(assert (= (and d!9695 c!6555) b!48855))

(assert (= (and d!9695 (not c!6555)) b!48856))

(declare-fun m!42409 () Bool)

(assert (=> b!48856 m!42409))

(declare-fun m!42411 () Bool)

(assert (=> b!48856 m!42411))

(assert (=> b!48687 d!9695))

(declare-fun b!48857 () Bool)

(declare-fun e!31375 () List!1302)

(declare-fun call!3801 () List!1302)

(assert (=> b!48857 (= e!31375 call!3801)))

(declare-fun bm!3796 () Bool)

(declare-fun call!3800 () List!1302)

(assert (=> bm!3796 (= call!3800 call!3801)))

(declare-fun bm!3797 () Bool)

(declare-fun call!3799 () List!1302)

(assert (=> bm!3797 (= call!3801 call!3799)))

(declare-fun b!48858 () Bool)

(declare-fun c!6559 () Bool)

(assert (=> b!48858 (= c!6559 (and (is-Cons!1298 (t!4329 l!1333)) (bvsgt (_1!913 (h!1878 (t!4329 l!1333))) newKey!147)))))

(declare-fun e!31374 () List!1302)

(assert (=> b!48858 (= e!31375 e!31374)))

(declare-fun b!48859 () Bool)

(declare-fun res!28353 () Bool)

(declare-fun e!31372 () Bool)

(assert (=> b!48859 (=> (not res!28353) (not e!31372))))

(declare-fun lt!20678 () List!1302)

(assert (=> b!48859 (= res!28353 (containsKey!117 lt!20678 newKey!147))))

(declare-fun c!6558 () Bool)

(declare-fun e!31373 () List!1302)

(declare-fun bm!3798 () Bool)

(assert (=> bm!3798 (= call!3799 ($colon$colon!52 e!31373 (ite c!6558 (h!1878 (t!4329 l!1333)) (tuple2!1805 newKey!147 newValue!147))))))

(declare-fun c!6556 () Bool)

(assert (=> bm!3798 (= c!6556 c!6558)))

(declare-fun d!9697 () Bool)

(assert (=> d!9697 e!31372))

(declare-fun res!28352 () Bool)

(assert (=> d!9697 (=> (not res!28352) (not e!31372))))

(assert (=> d!9697 (= res!28352 (isStrictlySorted!265 lt!20678))))

(declare-fun e!31376 () List!1302)

(assert (=> d!9697 (= lt!20678 e!31376)))

(assert (=> d!9697 (= c!6558 (and (is-Cons!1298 (t!4329 l!1333)) (bvslt (_1!913 (h!1878 (t!4329 l!1333))) newKey!147)))))

(assert (=> d!9697 (isStrictlySorted!265 (t!4329 l!1333))))

(assert (=> d!9697 (= (insertStrictlySorted!37 (t!4329 l!1333) newKey!147 newValue!147) lt!20678)))

(declare-fun b!48860 () Bool)

(assert (=> b!48860 (= e!31376 e!31375)))

(declare-fun c!6557 () Bool)

(assert (=> b!48860 (= c!6557 (and (is-Cons!1298 (t!4329 l!1333)) (= (_1!913 (h!1878 (t!4329 l!1333))) newKey!147)))))

(declare-fun b!48861 () Bool)

(assert (=> b!48861 (= e!31376 call!3799)))

(declare-fun b!48862 () Bool)

(assert (=> b!48862 (= e!31373 (insertStrictlySorted!37 (t!4329 (t!4329 l!1333)) newKey!147 newValue!147))))

(declare-fun b!48863 () Bool)

(assert (=> b!48863 (= e!31372 (contains!604 lt!20678 (tuple2!1805 newKey!147 newValue!147)))))

(declare-fun b!48864 () Bool)

(assert (=> b!48864 (= e!31373 (ite c!6557 (t!4329 (t!4329 l!1333)) (ite c!6559 (Cons!1298 (h!1878 (t!4329 l!1333)) (t!4329 (t!4329 l!1333))) Nil!1299)))))

(declare-fun b!48865 () Bool)

(assert (=> b!48865 (= e!31374 call!3800)))

(declare-fun b!48866 () Bool)

(assert (=> b!48866 (= e!31374 call!3800)))

(assert (= (and d!9697 c!6558) b!48861))

(assert (= (and d!9697 (not c!6558)) b!48860))

(assert (= (and b!48860 c!6557) b!48857))

(assert (= (and b!48860 (not c!6557)) b!48858))

(assert (= (and b!48858 c!6559) b!48865))

(assert (= (and b!48858 (not c!6559)) b!48866))

(assert (= (or b!48865 b!48866) bm!3796))

(assert (= (or b!48857 bm!3796) bm!3797))

(assert (= (or b!48861 bm!3797) bm!3798))

(assert (= (and bm!3798 c!6556) b!48862))

(assert (= (and bm!3798 (not c!6556)) b!48864))

(assert (= (and d!9697 res!28352) b!48859))

(assert (= (and b!48859 res!28353) b!48863))

(declare-fun m!42413 () Bool)

(assert (=> d!9697 m!42413))

(assert (=> d!9697 m!42373))

(declare-fun m!42415 () Bool)

(assert (=> b!48862 m!42415))

(declare-fun m!42417 () Bool)

(assert (=> bm!3798 m!42417))

(declare-fun m!42419 () Bool)

(assert (=> b!48859 m!42419))

(declare-fun m!42421 () Bool)

(assert (=> b!48863 m!42421))

(assert (=> b!48767 d!9697))

(declare-fun d!9699 () Bool)

(assert (=> d!9699 (= ($colon$colon!52 e!31304 (ite c!6542 (h!1878 l!1333) (tuple2!1805 newKey!147 newValue!147))) (Cons!1298 (ite c!6542 (h!1878 l!1333) (tuple2!1805 newKey!147 newValue!147)) e!31304))))

(assert (=> bm!3786 d!9699))

(declare-fun d!9701 () Bool)

(declare-fun res!28358 () Bool)

(declare-fun e!31381 () Bool)

(assert (=> d!9701 (=> res!28358 e!31381)))

(assert (=> d!9701 (= res!28358 (and (is-Cons!1298 lt!20673) (= (_1!913 (h!1878 lt!20673)) newKey!147)))))

(assert (=> d!9701 (= (containsKey!117 lt!20673 newKey!147) e!31381)))

(declare-fun b!48871 () Bool)

(declare-fun e!31382 () Bool)

(assert (=> b!48871 (= e!31381 e!31382)))

(declare-fun res!28359 () Bool)

(assert (=> b!48871 (=> (not res!28359) (not e!31382))))

(assert (=> b!48871 (= res!28359 (and (or (not (is-Cons!1298 lt!20673)) (bvsle (_1!913 (h!1878 lt!20673)) newKey!147)) (is-Cons!1298 lt!20673) (bvslt (_1!913 (h!1878 lt!20673)) newKey!147)))))

(declare-fun b!48872 () Bool)

(assert (=> b!48872 (= e!31382 (containsKey!117 (t!4329 lt!20673) newKey!147))))

(assert (= (and d!9701 (not res!28358)) b!48871))

(assert (= (and b!48871 res!28359) b!48872))

(declare-fun m!42423 () Bool)

(assert (=> b!48872 m!42423))

(assert (=> b!48764 d!9701))

(declare-fun c!6560 () Bool)

(declare-fun d!9705 () Bool)

(assert (=> d!9705 (= c!6560 (is-Nil!1299 (t!4329 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147))))))

(declare-fun e!31385 () (Set tuple2!1804))

(assert (=> d!9705 (= (content!51 (t!4329 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147))) e!31385)))

(declare-fun b!48875 () Bool)

(assert (=> b!48875 (= e!31385 (as set.empty (Set tuple2!1804)))))

(declare-fun b!48876 () Bool)

(assert (=> b!48876 (= e!31385 (set.union (set.insert (h!1878 (t!4329 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147))) (as set.empty (Set tuple2!1804))) (content!51 (t!4329 (t!4329 (insertStrictlySorted!37 l!1333 newKey!147 newValue!147))))))))

(assert (= (and d!9705 c!6560) b!48875))

(assert (= (and d!9705 (not c!6560)) b!48876))

(declare-fun m!42427 () Bool)

(assert (=> b!48876 m!42427))

(declare-fun m!42429 () Bool)

(assert (=> b!48876 m!42429))

(assert (=> b!48691 d!9705))

(declare-fun b!48877 () Bool)

(declare-fun e!31386 () Bool)

(declare-fun tp!6471 () Bool)

(assert (=> b!48877 (= e!31386 (and tp_is_empty!2129 tp!6471))))

(assert (=> b!48836 (= tp!6470 e!31386)))

(assert (= (and b!48836 (is-Cons!1298 (t!4329 (t!4329 l!1333)))) b!48877))

(push 1)

(assert (not b!48854))

(assert (not b!48863))

(assert (not b!48876))

(assert (not b!48840))

(assert (not b!48862))

(assert (not d!9685))

(assert (not b!48877))

(assert (not b!48859))

(assert (not bm!3798))

(assert (not b!48842))

(assert (not d!9697))

(assert tp_is_empty!2129)

(assert (not b!48856))

(assert (not b!48838))

(assert (not b!48872))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

