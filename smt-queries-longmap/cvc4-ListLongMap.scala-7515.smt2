; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95282 () Bool)

(assert start!95282)

(declare-fun res!717600 () Bool)

(declare-fun e!615522 () Bool)

(assert (=> start!95282 (=> (not res!717600) (not e!615522))))

(declare-fun a1!69 () (_ BitVec 64))

(declare-fun a2!57 () (_ BitVec 64))

(assert (=> start!95282 (= res!717600 (not (= a1!69 a2!57)))))

(assert (=> start!95282 e!615522))

(declare-fun tp_is_empty!26069 () Bool)

(assert (=> start!95282 tp_is_empty!26069))

(assert (=> start!95282 true))

(declare-datatypes ((B!1776 0))(
  ( (B!1777 (val!13091 Int)) )
))
(declare-datatypes ((tuple2!16692 0))(
  ( (tuple2!16693 (_1!8357 (_ BitVec 64)) (_2!8357 B!1776)) )
))
(declare-datatypes ((List!23213 0))(
  ( (Nil!23210) (Cons!23209 (h!24418 tuple2!16692) (t!32572 List!23213)) )
))
(declare-datatypes ((ListLongMap!14661 0))(
  ( (ListLongMap!14662 (toList!7346 List!23213)) )
))
(declare-fun lm!214 () ListLongMap!14661)

(declare-fun e!615521 () Bool)

(declare-fun inv!37863 (ListLongMap!14661) Bool)

(assert (=> start!95282 (and (inv!37863 lm!214) e!615521)))

(declare-fun b!1076708 () Bool)

(declare-fun res!717599 () Bool)

(assert (=> b!1076708 (=> (not res!717599) (not e!615522))))

(declare-fun isStrictlySorted!726 (List!23213) Bool)

(assert (=> b!1076708 (= res!717599 (isStrictlySorted!726 (toList!7346 lm!214)))))

(declare-fun b!1076709 () Bool)

(declare-fun lt!478399 () tuple2!16692)

(declare-fun lt!478400 () tuple2!16692)

(declare-fun +!3241 (ListLongMap!14661 tuple2!16692) ListLongMap!14661)

(assert (=> b!1076709 (= e!615522 (not (= (+!3241 (+!3241 lm!214 lt!478400) lt!478399) (+!3241 (+!3241 lm!214 lt!478399) lt!478400))))))

(declare-fun b2!55 () B!1776)

(assert (=> b!1076709 (= lt!478399 (tuple2!16693 a2!57 b2!55))))

(declare-fun b1!79 () B!1776)

(assert (=> b!1076709 (= lt!478400 (tuple2!16693 a1!69 b1!79))))

(declare-fun insertStrictlySorted!387 (List!23213 (_ BitVec 64) B!1776) List!23213)

(assert (=> b!1076709 (= (insertStrictlySorted!387 (insertStrictlySorted!387 (toList!7346 lm!214) a1!69 b1!79) a2!57 b2!55) (insertStrictlySorted!387 (insertStrictlySorted!387 (toList!7346 lm!214) a2!57 b2!55) a1!69 b1!79))))

(declare-datatypes ((Unit!35450 0))(
  ( (Unit!35451) )
))
(declare-fun lt!478398 () Unit!35450)

(declare-fun lemmaInsertStrictlySortedCommutative!3 (List!23213 (_ BitVec 64) B!1776 (_ BitVec 64) B!1776) Unit!35450)

(assert (=> b!1076709 (= lt!478398 (lemmaInsertStrictlySortedCommutative!3 (toList!7346 lm!214) a1!69 b1!79 a2!57 b2!55))))

(declare-fun b!1076710 () Bool)

(declare-fun tp!78284 () Bool)

(assert (=> b!1076710 (= e!615521 tp!78284)))

(assert (= (and start!95282 res!717600) b!1076708))

(assert (= (and b!1076708 res!717599) b!1076709))

(assert (= start!95282 b!1076710))

(declare-fun m!995697 () Bool)

(assert (=> start!95282 m!995697))

(declare-fun m!995699 () Bool)

(assert (=> b!1076708 m!995699))

(declare-fun m!995701 () Bool)

(assert (=> b!1076709 m!995701))

(declare-fun m!995703 () Bool)

(assert (=> b!1076709 m!995703))

(declare-fun m!995705 () Bool)

(assert (=> b!1076709 m!995705))

(declare-fun m!995707 () Bool)

(assert (=> b!1076709 m!995707))

(declare-fun m!995709 () Bool)

(assert (=> b!1076709 m!995709))

(declare-fun m!995711 () Bool)

(assert (=> b!1076709 m!995711))

(assert (=> b!1076709 m!995709))

(declare-fun m!995713 () Bool)

(assert (=> b!1076709 m!995713))

(declare-fun m!995715 () Bool)

(assert (=> b!1076709 m!995715))

(declare-fun m!995717 () Bool)

(assert (=> b!1076709 m!995717))

(assert (=> b!1076709 m!995705))

(assert (=> b!1076709 m!995715))

(assert (=> b!1076709 m!995701))

(push 1)

(assert (not start!95282))

(assert (not b!1076710))

(assert tp_is_empty!26069)

(assert (not b!1076709))

(assert (not b!1076708))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!129727 () Bool)

(assert (=> d!129727 (= (inv!37863 lm!214) (isStrictlySorted!726 (toList!7346 lm!214)))))

(declare-fun bs!31722 () Bool)

(assert (= bs!31722 d!129727))

(assert (=> bs!31722 m!995699))

(assert (=> start!95282 d!129727))

(declare-fun d!129731 () Bool)

(declare-fun e!615565 () Bool)

(assert (=> d!129731 e!615565))

(declare-fun res!717622 () Bool)

(assert (=> d!129731 (=> (not res!717622) (not e!615565))))

(declare-fun lt!478408 () List!23213)

(assert (=> d!129731 (= res!717622 (isStrictlySorted!726 lt!478408))))

(declare-fun e!615567 () List!23213)

(assert (=> d!129731 (= lt!478408 e!615567)))

(declare-fun c!108261 () Bool)

(assert (=> d!129731 (= c!108261 (and (is-Cons!23209 (toList!7346 lm!214)) (bvslt (_1!8357 (h!24418 (toList!7346 lm!214))) a2!57)))))

(assert (=> d!129731 (isStrictlySorted!726 (toList!7346 lm!214))))

(assert (=> d!129731 (= (insertStrictlySorted!387 (toList!7346 lm!214) a2!57 b2!55) lt!478408)))

(declare-fun b!1076787 () Bool)

(declare-fun call!45675 () List!23213)

(assert (=> b!1076787 (= e!615567 call!45675)))

(declare-fun b!1076788 () Bool)

(declare-fun e!615568 () List!23213)

(assert (=> b!1076788 (= e!615568 (insertStrictlySorted!387 (t!32572 (toList!7346 lm!214)) a2!57 b2!55))))

(declare-fun b!1076789 () Bool)

(declare-fun c!108258 () Bool)

(assert (=> b!1076789 (= c!108258 (and (is-Cons!23209 (toList!7346 lm!214)) (bvsgt (_1!8357 (h!24418 (toList!7346 lm!214))) a2!57)))))

(declare-fun e!615564 () List!23213)

(declare-fun e!615566 () List!23213)

(assert (=> b!1076789 (= e!615564 e!615566)))

(declare-fun b!1076790 () Bool)

(declare-fun contains!6362 (List!23213 tuple2!16692) Bool)

(assert (=> b!1076790 (= e!615565 (contains!6362 lt!478408 (tuple2!16693 a2!57 b2!55)))))

(declare-fun b!1076791 () Bool)

(declare-fun c!108260 () Bool)

(assert (=> b!1076791 (= e!615568 (ite c!108260 (t!32572 (toList!7346 lm!214)) (ite c!108258 (Cons!23209 (h!24418 (toList!7346 lm!214)) (t!32572 (toList!7346 lm!214))) Nil!23210)))))

(declare-fun b!1076792 () Bool)

(assert (=> b!1076792 (= e!615567 e!615564)))

(assert (=> b!1076792 (= c!108260 (and (is-Cons!23209 (toList!7346 lm!214)) (= (_1!8357 (h!24418 (toList!7346 lm!214))) a2!57)))))

(declare-fun b!1076793 () Bool)

(declare-fun call!45677 () List!23213)

(assert (=> b!1076793 (= e!615566 call!45677)))

(declare-fun b!1076794 () Bool)

(assert (=> b!1076794 (= e!615566 call!45677)))

(declare-fun b!1076795 () Bool)

(declare-fun call!45676 () List!23213)

(assert (=> b!1076795 (= e!615564 call!45676)))

(declare-fun bm!45672 () Bool)

(assert (=> bm!45672 (= call!45677 call!45676)))

(declare-fun b!1076796 () Bool)

(declare-fun res!717621 () Bool)

(assert (=> b!1076796 (=> (not res!717621) (not e!615565))))

(declare-fun containsKey!584 (List!23213 (_ BitVec 64)) Bool)

(assert (=> b!1076796 (= res!717621 (containsKey!584 lt!478408 a2!57))))

(declare-fun bm!45673 () Bool)

(assert (=> bm!45673 (= call!45676 call!45675)))

(declare-fun bm!45674 () Bool)

(declare-fun $colon$colon!607 (List!23213 tuple2!16692) List!23213)

(assert (=> bm!45674 (= call!45675 ($colon$colon!607 e!615568 (ite c!108261 (h!24418 (toList!7346 lm!214)) (tuple2!16693 a2!57 b2!55))))))

(declare-fun c!108259 () Bool)

(assert (=> bm!45674 (= c!108259 c!108261)))

(assert (= (and d!129731 c!108261) b!1076787))

(assert (= (and d!129731 (not c!108261)) b!1076792))

(assert (= (and b!1076792 c!108260) b!1076795))

(assert (= (and b!1076792 (not c!108260)) b!1076789))

(assert (= (and b!1076789 c!108258) b!1076793))

(assert (= (and b!1076789 (not c!108258)) b!1076794))

(assert (= (or b!1076793 b!1076794) bm!45672))

(assert (= (or b!1076795 bm!45672) bm!45673))

(assert (= (or b!1076787 bm!45673) bm!45674))

(assert (= (and bm!45674 c!108259) b!1076788))

(assert (= (and bm!45674 (not c!108259)) b!1076791))

(assert (= (and d!129731 res!717622) b!1076796))

(assert (= (and b!1076796 res!717621) b!1076790))

(declare-fun m!995731 () Bool)

(assert (=> bm!45674 m!995731))

(declare-fun m!995733 () Bool)

(assert (=> d!129731 m!995733))

(assert (=> d!129731 m!995699))

(declare-fun m!995735 () Bool)

(assert (=> b!1076790 m!995735))

(declare-fun m!995737 () Bool)

(assert (=> b!1076788 m!995737))

(declare-fun m!995739 () Bool)

(assert (=> b!1076796 m!995739))

(assert (=> b!1076709 d!129731))

(declare-fun d!129739 () Bool)

(declare-fun e!615579 () Bool)

(assert (=> d!129739 e!615579))

(declare-fun res!717635 () Bool)

(assert (=> d!129739 (=> (not res!717635) (not e!615579))))

(declare-fun lt!478432 () ListLongMap!14661)

(declare-fun contains!6365 (ListLongMap!14661 (_ BitVec 64)) Bool)

(assert (=> d!129739 (= res!717635 (contains!6365 lt!478432 (_1!8357 lt!478399)))))

(declare-fun lt!478431 () List!23213)

(assert (=> d!129739 (= lt!478432 (ListLongMap!14662 lt!478431))))

(declare-fun lt!478430 () Unit!35450)

(declare-fun lt!478433 () Unit!35450)

(assert (=> d!129739 (= lt!478430 lt!478433)))

(declare-datatypes ((Option!668 0))(
  ( (Some!667 (v!15710 B!1776)) (None!666) )
))
(declare-fun getValueByKey!617 (List!23213 (_ BitVec 64)) Option!668)

(assert (=> d!129739 (= (getValueByKey!617 lt!478431 (_1!8357 lt!478399)) (Some!667 (_2!8357 lt!478399)))))

(declare-fun lemmaContainsTupThenGetReturnValue!294 (List!23213 (_ BitVec 64) B!1776) Unit!35450)

(assert (=> d!129739 (= lt!478433 (lemmaContainsTupThenGetReturnValue!294 lt!478431 (_1!8357 lt!478399) (_2!8357 lt!478399)))))

(assert (=> d!129739 (= lt!478431 (insertStrictlySorted!387 (toList!7346 lm!214) (_1!8357 lt!478399) (_2!8357 lt!478399)))))

(assert (=> d!129739 (= (+!3241 lm!214 lt!478399) lt!478432)))

(declare-fun b!1076817 () Bool)

(declare-fun res!717636 () Bool)

(assert (=> b!1076817 (=> (not res!717636) (not e!615579))))

(assert (=> b!1076817 (= res!717636 (= (getValueByKey!617 (toList!7346 lt!478432) (_1!8357 lt!478399)) (Some!667 (_2!8357 lt!478399))))))

(declare-fun b!1076818 () Bool)

(assert (=> b!1076818 (= e!615579 (contains!6362 (toList!7346 lt!478432) lt!478399))))

(assert (= (and d!129739 res!717635) b!1076817))

(assert (= (and b!1076817 res!717636) b!1076818))

(declare-fun m!995763 () Bool)

(assert (=> d!129739 m!995763))

(declare-fun m!995765 () Bool)

(assert (=> d!129739 m!995765))

(declare-fun m!995767 () Bool)

(assert (=> d!129739 m!995767))

(declare-fun m!995769 () Bool)

(assert (=> d!129739 m!995769))

(declare-fun m!995771 () Bool)

(assert (=> b!1076817 m!995771))

(declare-fun m!995773 () Bool)

(assert (=> b!1076818 m!995773))

(assert (=> b!1076709 d!129739))

(declare-fun d!129745 () Bool)

(declare-fun e!615588 () Bool)

(assert (=> d!129745 e!615588))

(declare-fun res!717640 () Bool)

(assert (=> d!129745 (=> (not res!717640) (not e!615588))))

(declare-fun lt!478443 () List!23213)

(assert (=> d!129745 (= res!717640 (isStrictlySorted!726 lt!478443))))

(declare-fun e!615590 () List!23213)

(assert (=> d!129745 (= lt!478443 e!615590)))

(declare-fun c!108273 () Bool)

(assert (=> d!129745 (= c!108273 (and (is-Cons!23209 (toList!7346 lm!214)) (bvslt (_1!8357 (h!24418 (toList!7346 lm!214))) a1!69)))))

(assert (=> d!129745 (isStrictlySorted!726 (toList!7346 lm!214))))

(assert (=> d!129745 (= (insertStrictlySorted!387 (toList!7346 lm!214) a1!69 b1!79) lt!478443)))

(declare-fun b!1076829 () Bool)

(declare-fun call!45684 () List!23213)

(assert (=> b!1076829 (= e!615590 call!45684)))

(declare-fun e!615591 () List!23213)

(declare-fun b!1076830 () Bool)

(assert (=> b!1076830 (= e!615591 (insertStrictlySorted!387 (t!32572 (toList!7346 lm!214)) a1!69 b1!79))))

(declare-fun b!1076831 () Bool)

(declare-fun c!108270 () Bool)

(assert (=> b!1076831 (= c!108270 (and (is-Cons!23209 (toList!7346 lm!214)) (bvsgt (_1!8357 (h!24418 (toList!7346 lm!214))) a1!69)))))

(declare-fun e!615587 () List!23213)

(declare-fun e!615589 () List!23213)

(assert (=> b!1076831 (= e!615587 e!615589)))

(declare-fun b!1076833 () Bool)

(assert (=> b!1076833 (= e!615588 (contains!6362 lt!478443 (tuple2!16693 a1!69 b1!79)))))

(declare-fun c!108272 () Bool)

(declare-fun b!1076835 () Bool)

(assert (=> b!1076835 (= e!615591 (ite c!108272 (t!32572 (toList!7346 lm!214)) (ite c!108270 (Cons!23209 (h!24418 (toList!7346 lm!214)) (t!32572 (toList!7346 lm!214))) Nil!23210)))))

(declare-fun b!1076836 () Bool)

(assert (=> b!1076836 (= e!615590 e!615587)))

(assert (=> b!1076836 (= c!108272 (and (is-Cons!23209 (toList!7346 lm!214)) (= (_1!8357 (h!24418 (toList!7346 lm!214))) a1!69)))))

(declare-fun b!1076837 () Bool)

(declare-fun call!45686 () List!23213)

(assert (=> b!1076837 (= e!615589 call!45686)))

(declare-fun b!1076838 () Bool)

(assert (=> b!1076838 (= e!615589 call!45686)))

(declare-fun b!1076839 () Bool)

(declare-fun call!45685 () List!23213)

(assert (=> b!1076839 (= e!615587 call!45685)))

(declare-fun bm!45681 () Bool)

(assert (=> bm!45681 (= call!45686 call!45685)))

(declare-fun b!1076840 () Bool)

(declare-fun res!717639 () Bool)

(assert (=> b!1076840 (=> (not res!717639) (not e!615588))))

(assert (=> b!1076840 (= res!717639 (containsKey!584 lt!478443 a1!69))))

(declare-fun bm!45682 () Bool)

(assert (=> bm!45682 (= call!45685 call!45684)))

(declare-fun bm!45683 () Bool)

(assert (=> bm!45683 (= call!45684 ($colon$colon!607 e!615591 (ite c!108273 (h!24418 (toList!7346 lm!214)) (tuple2!16693 a1!69 b1!79))))))

(declare-fun c!108271 () Bool)

(assert (=> bm!45683 (= c!108271 c!108273)))

(assert (= (and d!129745 c!108273) b!1076829))

(assert (= (and d!129745 (not c!108273)) b!1076836))

(assert (= (and b!1076836 c!108272) b!1076839))

(assert (= (and b!1076836 (not c!108272)) b!1076831))

(assert (= (and b!1076831 c!108270) b!1076837))

(assert (= (and b!1076831 (not c!108270)) b!1076838))

(assert (= (or b!1076837 b!1076838) bm!45681))

(assert (= (or b!1076839 bm!45681) bm!45682))

(assert (= (or b!1076829 bm!45682) bm!45683))

(assert (= (and bm!45683 c!108271) b!1076830))

(assert (= (and bm!45683 (not c!108271)) b!1076835))

(assert (= (and d!129745 res!717640) b!1076840))

(assert (= (and b!1076840 res!717639) b!1076833))

(declare-fun m!995785 () Bool)

(assert (=> bm!45683 m!995785))

(declare-fun m!995787 () Bool)

(assert (=> d!129745 m!995787))

(assert (=> d!129745 m!995699))

(declare-fun m!995789 () Bool)

(assert (=> b!1076833 m!995789))

(declare-fun m!995791 () Bool)

(assert (=> b!1076830 m!995791))

(declare-fun m!995793 () Bool)

(assert (=> b!1076840 m!995793))

(assert (=> b!1076709 d!129745))

(declare-fun d!129749 () Bool)

(declare-fun e!615592 () Bool)

(assert (=> d!129749 e!615592))

(declare-fun res!717645 () Bool)

(assert (=> d!129749 (=> (not res!717645) (not e!615592))))

(declare-fun lt!478446 () ListLongMap!14661)

(assert (=> d!129749 (= res!717645 (contains!6365 lt!478446 (_1!8357 lt!478400)))))

(declare-fun lt!478445 () List!23213)

(assert (=> d!129749 (= lt!478446 (ListLongMap!14662 lt!478445))))

(declare-fun lt!478444 () Unit!35450)

(declare-fun lt!478447 () Unit!35450)

(assert (=> d!129749 (= lt!478444 lt!478447)))

(assert (=> d!129749 (= (getValueByKey!617 lt!478445 (_1!8357 lt!478400)) (Some!667 (_2!8357 lt!478400)))))

(assert (=> d!129749 (= lt!478447 (lemmaContainsTupThenGetReturnValue!294 lt!478445 (_1!8357 lt!478400) (_2!8357 lt!478400)))))

(assert (=> d!129749 (= lt!478445 (insertStrictlySorted!387 (toList!7346 lm!214) (_1!8357 lt!478400) (_2!8357 lt!478400)))))

(assert (=> d!129749 (= (+!3241 lm!214 lt!478400) lt!478446)))

(declare-fun b!1076843 () Bool)

(declare-fun res!717646 () Bool)

(assert (=> b!1076843 (=> (not res!717646) (not e!615592))))

(assert (=> b!1076843 (= res!717646 (= (getValueByKey!617 (toList!7346 lt!478446) (_1!8357 lt!478400)) (Some!667 (_2!8357 lt!478400))))))

(declare-fun b!1076844 () Bool)

(assert (=> b!1076844 (= e!615592 (contains!6362 (toList!7346 lt!478446) lt!478400))))

(assert (= (and d!129749 res!717645) b!1076843))

(assert (= (and b!1076843 res!717646) b!1076844))

(declare-fun m!995795 () Bool)

(assert (=> d!129749 m!995795))

(declare-fun m!995797 () Bool)

(assert (=> d!129749 m!995797))

(declare-fun m!995799 () Bool)

(assert (=> d!129749 m!995799))

(declare-fun m!995801 () Bool)

(assert (=> d!129749 m!995801))

(declare-fun m!995803 () Bool)

(assert (=> b!1076843 m!995803))

(declare-fun m!995805 () Bool)

(assert (=> b!1076844 m!995805))

(assert (=> b!1076709 d!129749))

(declare-fun d!129751 () Bool)

(declare-fun e!615593 () Bool)

(assert (=> d!129751 e!615593))

(declare-fun res!717647 () Bool)

(assert (=> d!129751 (=> (not res!717647) (not e!615593))))

(declare-fun lt!478450 () ListLongMap!14661)

(assert (=> d!129751 (= res!717647 (contains!6365 lt!478450 (_1!8357 lt!478400)))))

(declare-fun lt!478449 () List!23213)

(assert (=> d!129751 (= lt!478450 (ListLongMap!14662 lt!478449))))

(declare-fun lt!478448 () Unit!35450)

(declare-fun lt!478451 () Unit!35450)

(assert (=> d!129751 (= lt!478448 lt!478451)))

(assert (=> d!129751 (= (getValueByKey!617 lt!478449 (_1!8357 lt!478400)) (Some!667 (_2!8357 lt!478400)))))

(assert (=> d!129751 (= lt!478451 (lemmaContainsTupThenGetReturnValue!294 lt!478449 (_1!8357 lt!478400) (_2!8357 lt!478400)))))

(assert (=> d!129751 (= lt!478449 (insertStrictlySorted!387 (toList!7346 (+!3241 lm!214 lt!478399)) (_1!8357 lt!478400) (_2!8357 lt!478400)))))

(assert (=> d!129751 (= (+!3241 (+!3241 lm!214 lt!478399) lt!478400) lt!478450)))

(declare-fun b!1076845 () Bool)

(declare-fun res!717648 () Bool)

(assert (=> b!1076845 (=> (not res!717648) (not e!615593))))

(assert (=> b!1076845 (= res!717648 (= (getValueByKey!617 (toList!7346 lt!478450) (_1!8357 lt!478400)) (Some!667 (_2!8357 lt!478400))))))

(declare-fun b!1076846 () Bool)

(assert (=> b!1076846 (= e!615593 (contains!6362 (toList!7346 lt!478450) lt!478400))))

(assert (= (and d!129751 res!717647) b!1076845))

(assert (= (and b!1076845 res!717648) b!1076846))

(declare-fun m!995807 () Bool)

(assert (=> d!129751 m!995807))

(declare-fun m!995809 () Bool)

(assert (=> d!129751 m!995809))

(declare-fun m!995811 () Bool)

(assert (=> d!129751 m!995811))

(declare-fun m!995813 () Bool)

(assert (=> d!129751 m!995813))

(declare-fun m!995815 () Bool)

(assert (=> b!1076845 m!995815))

(declare-fun m!995817 () Bool)

(assert (=> b!1076846 m!995817))

(assert (=> b!1076709 d!129751))

(declare-fun d!129753 () Bool)

(declare-fun e!615596 () Bool)

(assert (=> d!129753 e!615596))

(declare-fun res!717652 () Bool)

(assert (=> d!129753 (=> (not res!717652) (not e!615596))))

(declare-fun lt!478456 () List!23213)

(assert (=> d!129753 (= res!717652 (isStrictlySorted!726 lt!478456))))

(declare-fun e!615598 () List!23213)

(assert (=> d!129753 (= lt!478456 e!615598)))

(declare-fun c!108277 () Bool)

(assert (=> d!129753 (= c!108277 (and (is-Cons!23209 (insertStrictlySorted!387 (toList!7346 lm!214) a1!69 b1!79)) (bvslt (_1!8357 (h!24418 (insertStrictlySorted!387 (toList!7346 lm!214) a1!69 b1!79))) a2!57)))))

(assert (=> d!129753 (isStrictlySorted!726 (insertStrictlySorted!387 (toList!7346 lm!214) a1!69 b1!79))))

(assert (=> d!129753 (= (insertStrictlySorted!387 (insertStrictlySorted!387 (toList!7346 lm!214) a1!69 b1!79) a2!57 b2!55) lt!478456)))

(declare-fun b!1076849 () Bool)

(declare-fun call!45687 () List!23213)

(assert (=> b!1076849 (= e!615598 call!45687)))

(declare-fun b!1076850 () Bool)

(declare-fun e!615599 () List!23213)

(assert (=> b!1076850 (= e!615599 (insertStrictlySorted!387 (t!32572 (insertStrictlySorted!387 (toList!7346 lm!214) a1!69 b1!79)) a2!57 b2!55))))

(declare-fun b!1076851 () Bool)

(declare-fun c!108274 () Bool)

(assert (=> b!1076851 (= c!108274 (and (is-Cons!23209 (insertStrictlySorted!387 (toList!7346 lm!214) a1!69 b1!79)) (bvsgt (_1!8357 (h!24418 (insertStrictlySorted!387 (toList!7346 lm!214) a1!69 b1!79))) a2!57)))))

(declare-fun e!615595 () List!23213)

(declare-fun e!615597 () List!23213)

(assert (=> b!1076851 (= e!615595 e!615597)))

(declare-fun b!1076852 () Bool)

(assert (=> b!1076852 (= e!615596 (contains!6362 lt!478456 (tuple2!16693 a2!57 b2!55)))))

(declare-fun b!1076853 () Bool)

(declare-fun c!108276 () Bool)

(assert (=> b!1076853 (= e!615599 (ite c!108276 (t!32572 (insertStrictlySorted!387 (toList!7346 lm!214) a1!69 b1!79)) (ite c!108274 (Cons!23209 (h!24418 (insertStrictlySorted!387 (toList!7346 lm!214) a1!69 b1!79)) (t!32572 (insertStrictlySorted!387 (toList!7346 lm!214) a1!69 b1!79))) Nil!23210)))))

(declare-fun b!1076854 () Bool)

(assert (=> b!1076854 (= e!615598 e!615595)))

(assert (=> b!1076854 (= c!108276 (and (is-Cons!23209 (insertStrictlySorted!387 (toList!7346 lm!214) a1!69 b1!79)) (= (_1!8357 (h!24418 (insertStrictlySorted!387 (toList!7346 lm!214) a1!69 b1!79))) a2!57)))))

(declare-fun b!1076855 () Bool)

(declare-fun call!45689 () List!23213)

(assert (=> b!1076855 (= e!615597 call!45689)))

(declare-fun b!1076856 () Bool)

(assert (=> b!1076856 (= e!615597 call!45689)))

(declare-fun b!1076857 () Bool)

(declare-fun call!45688 () List!23213)

(assert (=> b!1076857 (= e!615595 call!45688)))

(declare-fun bm!45684 () Bool)

(assert (=> bm!45684 (= call!45689 call!45688)))

(declare-fun b!1076858 () Bool)

(declare-fun res!717651 () Bool)

(assert (=> b!1076858 (=> (not res!717651) (not e!615596))))

(assert (=> b!1076858 (= res!717651 (containsKey!584 lt!478456 a2!57))))

(declare-fun bm!45685 () Bool)

(assert (=> bm!45685 (= call!45688 call!45687)))

(declare-fun bm!45686 () Bool)

(assert (=> bm!45686 (= call!45687 ($colon$colon!607 e!615599 (ite c!108277 (h!24418 (insertStrictlySorted!387 (toList!7346 lm!214) a1!69 b1!79)) (tuple2!16693 a2!57 b2!55))))))

(declare-fun c!108275 () Bool)

(assert (=> bm!45686 (= c!108275 c!108277)))

(assert (= (and d!129753 c!108277) b!1076849))

(assert (= (and d!129753 (not c!108277)) b!1076854))

(assert (= (and b!1076854 c!108276) b!1076857))

(assert (= (and b!1076854 (not c!108276)) b!1076851))

(assert (= (and b!1076851 c!108274) b!1076855))

(assert (= (and b!1076851 (not c!108274)) b!1076856))

(assert (= (or b!1076855 b!1076856) bm!45684))

(assert (= (or b!1076857 bm!45684) bm!45685))

(assert (= (or b!1076849 bm!45685) bm!45686))

(assert (= (and bm!45686 c!108275) b!1076850))

(assert (= (and bm!45686 (not c!108275)) b!1076853))

(assert (= (and d!129753 res!717652) b!1076858))

(assert (= (and b!1076858 res!717651) b!1076852))

(declare-fun m!995831 () Bool)

(assert (=> bm!45686 m!995831))

(declare-fun m!995833 () Bool)

(assert (=> d!129753 m!995833))

(assert (=> d!129753 m!995709))

(declare-fun m!995835 () Bool)

(assert (=> d!129753 m!995835))

