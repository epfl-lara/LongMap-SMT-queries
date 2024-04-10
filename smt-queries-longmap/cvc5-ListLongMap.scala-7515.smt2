; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95278 () Bool)

(assert start!95278)

(declare-fun res!717587 () Bool)

(declare-fun e!615509 () Bool)

(assert (=> start!95278 (=> (not res!717587) (not e!615509))))

(declare-fun a1!69 () (_ BitVec 64))

(declare-fun a2!57 () (_ BitVec 64))

(assert (=> start!95278 (= res!717587 (not (= a1!69 a2!57)))))

(assert (=> start!95278 e!615509))

(declare-fun tp_is_empty!26065 () Bool)

(assert (=> start!95278 tp_is_empty!26065))

(assert (=> start!95278 true))

(declare-datatypes ((B!1772 0))(
  ( (B!1773 (val!13089 Int)) )
))
(declare-datatypes ((tuple2!16688 0))(
  ( (tuple2!16689 (_1!8355 (_ BitVec 64)) (_2!8355 B!1772)) )
))
(declare-datatypes ((List!23211 0))(
  ( (Nil!23208) (Cons!23207 (h!24416 tuple2!16688) (t!32570 List!23211)) )
))
(declare-datatypes ((ListLongMap!14657 0))(
  ( (ListLongMap!14658 (toList!7344 List!23211)) )
))
(declare-fun lm!214 () ListLongMap!14657)

(declare-fun e!615510 () Bool)

(declare-fun inv!37861 (ListLongMap!14657) Bool)

(assert (=> start!95278 (and (inv!37861 lm!214) e!615510)))

(declare-fun b!1076690 () Bool)

(declare-fun res!717588 () Bool)

(assert (=> b!1076690 (=> (not res!717588) (not e!615509))))

(declare-fun isStrictlySorted!724 (List!23211) Bool)

(assert (=> b!1076690 (= res!717588 (isStrictlySorted!724 (toList!7344 lm!214)))))

(declare-fun lt!478382 () tuple2!16688)

(declare-fun b!1076691 () Bool)

(declare-fun lt!478381 () tuple2!16688)

(declare-fun +!3239 (ListLongMap!14657 tuple2!16688) ListLongMap!14657)

(assert (=> b!1076691 (= e!615509 (not (= (+!3239 (+!3239 lm!214 lt!478381) lt!478382) (+!3239 (+!3239 lm!214 lt!478382) lt!478381))))))

(declare-fun b2!55 () B!1772)

(assert (=> b!1076691 (= lt!478382 (tuple2!16689 a2!57 b2!55))))

(declare-fun b1!79 () B!1772)

(assert (=> b!1076691 (= lt!478381 (tuple2!16689 a1!69 b1!79))))

(declare-fun insertStrictlySorted!385 (List!23211 (_ BitVec 64) B!1772) List!23211)

(assert (=> b!1076691 (= (insertStrictlySorted!385 (insertStrictlySorted!385 (toList!7344 lm!214) a1!69 b1!79) a2!57 b2!55) (insertStrictlySorted!385 (insertStrictlySorted!385 (toList!7344 lm!214) a2!57 b2!55) a1!69 b1!79))))

(declare-datatypes ((Unit!35446 0))(
  ( (Unit!35447) )
))
(declare-fun lt!478380 () Unit!35446)

(declare-fun lemmaInsertStrictlySortedCommutative!1 (List!23211 (_ BitVec 64) B!1772 (_ BitVec 64) B!1772) Unit!35446)

(assert (=> b!1076691 (= lt!478380 (lemmaInsertStrictlySortedCommutative!1 (toList!7344 lm!214) a1!69 b1!79 a2!57 b2!55))))

(declare-fun b!1076692 () Bool)

(declare-fun tp!78278 () Bool)

(assert (=> b!1076692 (= e!615510 tp!78278)))

(assert (= (and start!95278 res!717587) b!1076690))

(assert (= (and b!1076690 res!717588) b!1076691))

(assert (= start!95278 b!1076692))

(declare-fun m!995653 () Bool)

(assert (=> start!95278 m!995653))

(declare-fun m!995655 () Bool)

(assert (=> b!1076690 m!995655))

(declare-fun m!995657 () Bool)

(assert (=> b!1076691 m!995657))

(declare-fun m!995659 () Bool)

(assert (=> b!1076691 m!995659))

(declare-fun m!995661 () Bool)

(assert (=> b!1076691 m!995661))

(declare-fun m!995663 () Bool)

(assert (=> b!1076691 m!995663))

(assert (=> b!1076691 m!995661))

(assert (=> b!1076691 m!995657))

(declare-fun m!995665 () Bool)

(assert (=> b!1076691 m!995665))

(declare-fun m!995667 () Bool)

(assert (=> b!1076691 m!995667))

(declare-fun m!995669 () Bool)

(assert (=> b!1076691 m!995669))

(declare-fun m!995671 () Bool)

(assert (=> b!1076691 m!995671))

(assert (=> b!1076691 m!995669))

(assert (=> b!1076691 m!995665))

(declare-fun m!995673 () Bool)

(assert (=> b!1076691 m!995673))

(push 1)

(assert tp_is_empty!26065)

(assert (not b!1076692))

(assert (not b!1076691))

(assert (not b!1076690))

(assert (not start!95278))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!45669 () Bool)

(declare-fun call!45672 () List!23211)

(declare-fun call!45674 () List!23211)

(assert (=> bm!45669 (= call!45672 call!45674)))

(declare-fun b!1076773 () Bool)

(declare-fun e!615558 () List!23211)

(assert (=> b!1076773 (= e!615558 call!45674)))

(declare-fun d!129729 () Bool)

(declare-fun e!615557 () Bool)

(assert (=> d!129729 e!615557))

(declare-fun res!717615 () Bool)

(assert (=> d!129729 (=> (not res!717615) (not e!615557))))

(declare-fun lt!478407 () List!23211)

(assert (=> d!129729 (= res!717615 (isStrictlySorted!724 lt!478407))))

(assert (=> d!129729 (= lt!478407 e!615558)))

(declare-fun c!108256 () Bool)

(assert (=> d!129729 (= c!108256 (and (is-Cons!23207 (toList!7344 lm!214)) (bvslt (_1!8355 (h!24416 (toList!7344 lm!214))) a2!57)))))

(assert (=> d!129729 (isStrictlySorted!724 (toList!7344 lm!214))))

(assert (=> d!129729 (= (insertStrictlySorted!385 (toList!7344 lm!214) a2!57 b2!55) lt!478407)))

(declare-fun b!1076774 () Bool)

(declare-fun e!615560 () List!23211)

(declare-fun call!45673 () List!23211)

(assert (=> b!1076774 (= e!615560 call!45673)))

(declare-fun b!1076775 () Bool)

(declare-fun res!717616 () Bool)

(assert (=> b!1076775 (=> (not res!717616) (not e!615557))))

(declare-fun containsKey!582 (List!23211 (_ BitVec 64)) Bool)

(assert (=> b!1076775 (= res!717616 (containsKey!582 lt!478407 a2!57))))

(declare-fun b!1076776 () Bool)

(declare-fun c!108254 () Bool)

(assert (=> b!1076776 (= c!108254 (and (is-Cons!23207 (toList!7344 lm!214)) (bvsgt (_1!8355 (h!24416 (toList!7344 lm!214))) a2!57)))))

(declare-fun e!615561 () List!23211)

(assert (=> b!1076776 (= e!615561 e!615560)))

(declare-fun b!1076777 () Bool)

(assert (=> b!1076777 (= e!615560 call!45673)))

(declare-fun b!1076778 () Bool)

(assert (=> b!1076778 (= e!615561 call!45672)))

(declare-fun b!1076779 () Bool)

(declare-fun e!615559 () List!23211)

(assert (=> b!1076779 (= e!615559 (insertStrictlySorted!385 (t!32570 (toList!7344 lm!214)) a2!57 b2!55))))

(declare-fun b!1076780 () Bool)

(declare-fun contains!6360 (List!23211 tuple2!16688) Bool)

(assert (=> b!1076780 (= e!615557 (contains!6360 lt!478407 (tuple2!16689 a2!57 b2!55)))))

(declare-fun bm!45670 () Bool)

(assert (=> bm!45670 (= call!45673 call!45672)))

(declare-fun b!1076781 () Bool)

(declare-fun c!108255 () Bool)

(assert (=> b!1076781 (= e!615559 (ite c!108255 (t!32570 (toList!7344 lm!214)) (ite c!108254 (Cons!23207 (h!24416 (toList!7344 lm!214)) (t!32570 (toList!7344 lm!214))) Nil!23208)))))

(declare-fun bm!45671 () Bool)

(declare-fun $colon$colon!605 (List!23211 tuple2!16688) List!23211)

(assert (=> bm!45671 (= call!45674 ($colon$colon!605 e!615559 (ite c!108256 (h!24416 (toList!7344 lm!214)) (tuple2!16689 a2!57 b2!55))))))

(declare-fun c!108257 () Bool)

(assert (=> bm!45671 (= c!108257 c!108256)))

(declare-fun b!1076782 () Bool)

(assert (=> b!1076782 (= e!615558 e!615561)))

(assert (=> b!1076782 (= c!108255 (and (is-Cons!23207 (toList!7344 lm!214)) (= (_1!8355 (h!24416 (toList!7344 lm!214))) a2!57)))))

(assert (= (and d!129729 c!108256) b!1076773))

(assert (= (and d!129729 (not c!108256)) b!1076782))

(assert (= (and b!1076782 c!108255) b!1076778))

(assert (= (and b!1076782 (not c!108255)) b!1076776))

(assert (= (and b!1076776 c!108254) b!1076777))

(assert (= (and b!1076776 (not c!108254)) b!1076774))

(assert (= (or b!1076777 b!1076774) bm!45670))

(assert (= (or b!1076778 bm!45670) bm!45669))

(assert (= (or b!1076773 bm!45669) bm!45671))

(assert (= (and bm!45671 c!108257) b!1076779))

(assert (= (and bm!45671 (not c!108257)) b!1076781))

(assert (= (and d!129729 res!717615) b!1076775))

(assert (= (and b!1076775 res!717616) b!1076780))

(declare-fun m!995721 () Bool)

(assert (=> b!1076780 m!995721))

(declare-fun m!995723 () Bool)

(assert (=> b!1076775 m!995723))

(declare-fun m!995725 () Bool)

(assert (=> d!129729 m!995725))

(assert (=> d!129729 m!995655))

(declare-fun m!995727 () Bool)

(assert (=> b!1076779 m!995727))

(declare-fun m!995729 () Bool)

(assert (=> bm!45671 m!995729))

(assert (=> b!1076691 d!129729))

(declare-fun d!129737 () Bool)

(declare-fun e!615578 () Bool)

(assert (=> d!129737 e!615578))

(declare-fun res!717633 () Bool)

(assert (=> d!129737 (=> (not res!717633) (not e!615578))))

(declare-fun lt!478427 () ListLongMap!14657)

(declare-fun contains!6363 (ListLongMap!14657 (_ BitVec 64)) Bool)

(assert (=> d!129737 (= res!717633 (contains!6363 lt!478427 (_1!8355 lt!478382)))))

(declare-fun lt!478429 () List!23211)

(assert (=> d!129737 (= lt!478427 (ListLongMap!14658 lt!478429))))

(declare-fun lt!478426 () Unit!35446)

(declare-fun lt!478428 () Unit!35446)

(assert (=> d!129737 (= lt!478426 lt!478428)))

(declare-datatypes ((Option!666 0))(
  ( (Some!665 (v!15708 B!1772)) (None!664) )
))
(declare-fun getValueByKey!615 (List!23211 (_ BitVec 64)) Option!666)

(assert (=> d!129737 (= (getValueByKey!615 lt!478429 (_1!8355 lt!478382)) (Some!665 (_2!8355 lt!478382)))))

(declare-fun lemmaContainsTupThenGetReturnValue!292 (List!23211 (_ BitVec 64) B!1772) Unit!35446)

(assert (=> d!129737 (= lt!478428 (lemmaContainsTupThenGetReturnValue!292 lt!478429 (_1!8355 lt!478382) (_2!8355 lt!478382)))))

(assert (=> d!129737 (= lt!478429 (insertStrictlySorted!385 (toList!7344 lm!214) (_1!8355 lt!478382) (_2!8355 lt!478382)))))

(assert (=> d!129737 (= (+!3239 lm!214 lt!478382) lt!478427)))

(declare-fun b!1076815 () Bool)

(declare-fun res!717634 () Bool)

(assert (=> b!1076815 (=> (not res!717634) (not e!615578))))

(assert (=> b!1076815 (= res!717634 (= (getValueByKey!615 (toList!7344 lt!478427) (_1!8355 lt!478382)) (Some!665 (_2!8355 lt!478382))))))

(declare-fun b!1076816 () Bool)

(assert (=> b!1076816 (= e!615578 (contains!6360 (toList!7344 lt!478427) lt!478382))))

(assert (= (and d!129737 res!717633) b!1076815))

(assert (= (and b!1076815 res!717634) b!1076816))

(declare-fun m!995751 () Bool)

(assert (=> d!129737 m!995751))

(declare-fun m!995753 () Bool)

(assert (=> d!129737 m!995753))

(declare-fun m!995755 () Bool)

(assert (=> d!129737 m!995755))

(declare-fun m!995757 () Bool)

(assert (=> d!129737 m!995757))

(declare-fun m!995759 () Bool)

(assert (=> b!1076815 m!995759))

(declare-fun m!995761 () Bool)

(assert (=> b!1076816 m!995761))

(assert (=> b!1076691 d!129737))

(declare-fun bm!45678 () Bool)

(declare-fun call!45681 () List!23211)

(declare-fun call!45683 () List!23211)

(assert (=> bm!45678 (= call!45681 call!45683)))

(declare-fun b!1076819 () Bool)

(declare-fun e!615581 () List!23211)

(assert (=> b!1076819 (= e!615581 call!45683)))

(declare-fun d!129743 () Bool)

(declare-fun e!615580 () Bool)

(assert (=> d!129743 e!615580))

(declare-fun res!717637 () Bool)

(assert (=> d!129743 (=> (not res!717637) (not e!615580))))

(declare-fun lt!478434 () List!23211)

(assert (=> d!129743 (= res!717637 (isStrictlySorted!724 lt!478434))))

(assert (=> d!129743 (= lt!478434 e!615581)))

(declare-fun c!108268 () Bool)

(assert (=> d!129743 (= c!108268 (and (is-Cons!23207 (toList!7344 lm!214)) (bvslt (_1!8355 (h!24416 (toList!7344 lm!214))) a1!69)))))

(assert (=> d!129743 (isStrictlySorted!724 (toList!7344 lm!214))))

(assert (=> d!129743 (= (insertStrictlySorted!385 (toList!7344 lm!214) a1!69 b1!79) lt!478434)))

(declare-fun b!1076820 () Bool)

(declare-fun e!615583 () List!23211)

(declare-fun call!45682 () List!23211)

(assert (=> b!1076820 (= e!615583 call!45682)))

(declare-fun b!1076821 () Bool)

(declare-fun res!717638 () Bool)

(assert (=> b!1076821 (=> (not res!717638) (not e!615580))))

(assert (=> b!1076821 (= res!717638 (containsKey!582 lt!478434 a1!69))))

(declare-fun b!1076822 () Bool)

(declare-fun c!108266 () Bool)

(assert (=> b!1076822 (= c!108266 (and (is-Cons!23207 (toList!7344 lm!214)) (bvsgt (_1!8355 (h!24416 (toList!7344 lm!214))) a1!69)))))

(declare-fun e!615584 () List!23211)

(assert (=> b!1076822 (= e!615584 e!615583)))

(declare-fun b!1076823 () Bool)

(assert (=> b!1076823 (= e!615583 call!45682)))

(declare-fun b!1076824 () Bool)

(assert (=> b!1076824 (= e!615584 call!45681)))

(declare-fun e!615582 () List!23211)

(declare-fun b!1076825 () Bool)

(assert (=> b!1076825 (= e!615582 (insertStrictlySorted!385 (t!32570 (toList!7344 lm!214)) a1!69 b1!79))))

(declare-fun b!1076826 () Bool)

(assert (=> b!1076826 (= e!615580 (contains!6360 lt!478434 (tuple2!16689 a1!69 b1!79)))))

(declare-fun bm!45679 () Bool)

(assert (=> bm!45679 (= call!45682 call!45681)))

(declare-fun c!108267 () Bool)

(declare-fun b!1076827 () Bool)

(assert (=> b!1076827 (= e!615582 (ite c!108267 (t!32570 (toList!7344 lm!214)) (ite c!108266 (Cons!23207 (h!24416 (toList!7344 lm!214)) (t!32570 (toList!7344 lm!214))) Nil!23208)))))

(declare-fun bm!45680 () Bool)

(assert (=> bm!45680 (= call!45683 ($colon$colon!605 e!615582 (ite c!108268 (h!24416 (toList!7344 lm!214)) (tuple2!16689 a1!69 b1!79))))))

(declare-fun c!108269 () Bool)

(assert (=> bm!45680 (= c!108269 c!108268)))

(declare-fun b!1076828 () Bool)

(assert (=> b!1076828 (= e!615581 e!615584)))

(assert (=> b!1076828 (= c!108267 (and (is-Cons!23207 (toList!7344 lm!214)) (= (_1!8355 (h!24416 (toList!7344 lm!214))) a1!69)))))

(assert (= (and d!129743 c!108268) b!1076819))

(assert (= (and d!129743 (not c!108268)) b!1076828))

(assert (= (and b!1076828 c!108267) b!1076824))

(assert (= (and b!1076828 (not c!108267)) b!1076822))

(assert (= (and b!1076822 c!108266) b!1076823))

(assert (= (and b!1076822 (not c!108266)) b!1076820))

(assert (= (or b!1076823 b!1076820) bm!45679))

(assert (= (or b!1076824 bm!45679) bm!45678))

(assert (= (or b!1076819 bm!45678) bm!45680))

(assert (= (and bm!45680 c!108269) b!1076825))

(assert (= (and bm!45680 (not c!108269)) b!1076827))

(assert (= (and d!129743 res!717637) b!1076821))

(assert (= (and b!1076821 res!717638) b!1076826))

(declare-fun m!995775 () Bool)

(assert (=> b!1076826 m!995775))

(declare-fun m!995777 () Bool)

(assert (=> b!1076821 m!995777))

(declare-fun m!995779 () Bool)

(assert (=> d!129743 m!995779))

(assert (=> d!129743 m!995655))

(declare-fun m!995781 () Bool)

(assert (=> b!1076825 m!995781))

(declare-fun m!995783 () Bool)

(assert (=> bm!45680 m!995783))

(assert (=> b!1076691 d!129743))

(declare-fun d!129747 () Bool)

(assert (=> d!129747 (= (insertStrictlySorted!385 (insertStrictlySorted!385 (toList!7344 lm!214) a1!69 b1!79) a2!57 b2!55) (insertStrictlySorted!385 (insertStrictlySorted!385 (toList!7344 lm!214) a2!57 b2!55) a1!69 b1!79))))

(declare-fun lt!478464 () Unit!35446)

(declare-fun choose!1759 (List!23211 (_ BitVec 64) B!1772 (_ BitVec 64) B!1772) Unit!35446)

(assert (=> d!129747 (= lt!478464 (choose!1759 (toList!7344 lm!214) a1!69 b1!79 a2!57 b2!55))))

(assert (=> d!129747 (not (= a1!69 a2!57))))

(assert (=> d!129747 (= (lemmaInsertStrictlySortedCommutative!1 (toList!7344 lm!214) a1!69 b1!79 a2!57 b2!55) lt!478464)))

(declare-fun bs!31723 () Bool)

(assert (= bs!31723 d!129747))

(assert (=> bs!31723 m!995661))

(assert (=> bs!31723 m!995661))

(assert (=> bs!31723 m!995663))

(assert (=> bs!31723 m!995657))

(assert (=> bs!31723 m!995657))

(assert (=> bs!31723 m!995659))

(declare-fun m!995865 () Bool)

(assert (=> bs!31723 m!995865))

(assert (=> b!1076691 d!129747))

(declare-fun bm!45693 () Bool)

(declare-fun call!45696 () List!23211)

(declare-fun call!45698 () List!23211)

(assert (=> bm!45693 (= call!45696 call!45698)))

(declare-fun b!1076881 () Bool)

(declare-fun e!615612 () List!23211)

(assert (=> b!1076881 (= e!615612 call!45698)))

(declare-fun d!129763 () Bool)

(declare-fun e!615611 () Bool)

(assert (=> d!129763 e!615611))

(declare-fun res!717659 () Bool)

(assert (=> d!129763 (=> (not res!717659) (not e!615611))))

(declare-fun lt!478466 () List!23211)

(assert (=> d!129763 (= res!717659 (isStrictlySorted!724 lt!478466))))

(assert (=> d!129763 (= lt!478466 e!615612)))

(declare-fun c!108288 () Bool)

(assert (=> d!129763 (= c!108288 (and (is-Cons!23207 (insertStrictlySorted!385 (toList!7344 lm!214) a2!57 b2!55)) (bvslt (_1!8355 (h!24416 (insertStrictlySorted!385 (toList!7344 lm!214) a2!57 b2!55))) a1!69)))))

(assert (=> d!129763 (isStrictlySorted!724 (insertStrictlySorted!385 (toList!7344 lm!214) a2!57 b2!55))))

(assert (=> d!129763 (= (insertStrictlySorted!385 (insertStrictlySorted!385 (toList!7344 lm!214) a2!57 b2!55) a1!69 b1!79) lt!478466)))

(declare-fun b!1076882 () Bool)

(declare-fun e!615614 () List!23211)

(declare-fun call!45697 () List!23211)

(assert (=> b!1076882 (= e!615614 call!45697)))

(declare-fun b!1076883 () Bool)

(declare-fun res!717660 () Bool)

(assert (=> b!1076883 (=> (not res!717660) (not e!615611))))

(assert (=> b!1076883 (= res!717660 (containsKey!582 lt!478466 a1!69))))

(declare-fun c!108286 () Bool)

(declare-fun b!1076884 () Bool)

(assert (=> b!1076884 (= c!108286 (and (is-Cons!23207 (insertStrictlySorted!385 (toList!7344 lm!214) a2!57 b2!55)) (bvsgt (_1!8355 (h!24416 (insertStrictlySorted!385 (toList!7344 lm!214) a2!57 b2!55))) a1!69)))))

(declare-fun e!615615 () List!23211)

(assert (=> b!1076884 (= e!615615 e!615614)))

(declare-fun b!1076885 () Bool)

(assert (=> b!1076885 (= e!615614 call!45697)))

(declare-fun b!1076886 () Bool)

(assert (=> b!1076886 (= e!615615 call!45696)))

(declare-fun e!615613 () List!23211)

(declare-fun b!1076887 () Bool)

(assert (=> b!1076887 (= e!615613 (insertStrictlySorted!385 (t!32570 (insertStrictlySorted!385 (toList!7344 lm!214) a2!57 b2!55)) a1!69 b1!79))))

(declare-fun b!1076888 () Bool)

(assert (=> b!1076888 (= e!615611 (contains!6360 lt!478466 (tuple2!16689 a1!69 b1!79)))))

(declare-fun bm!45694 () Bool)

(assert (=> bm!45694 (= call!45697 call!45696)))

(declare-fun c!108287 () Bool)

(declare-fun b!1076889 () Bool)

(assert (=> b!1076889 (= e!615613 (ite c!108287 (t!32570 (insertStrictlySorted!385 (toList!7344 lm!214) a2!57 b2!55)) (ite c!108286 (Cons!23207 (h!24416 (insertStrictlySorted!385 (toList!7344 lm!214) a2!57 b2!55)) (t!32570 (insertStrictlySorted!385 (toList!7344 lm!214) a2!57 b2!55))) Nil!23208)))))

(declare-fun bm!45695 () Bool)

(assert (=> bm!45695 (= call!45698 ($colon$colon!605 e!615613 (ite c!108288 (h!24416 (insertStrictlySorted!385 (toList!7344 lm!214) a2!57 b2!55)) (tuple2!16689 a1!69 b1!79))))))

(declare-fun c!108289 () Bool)

(assert (=> bm!45695 (= c!108289 c!108288)))

(declare-fun b!1076890 () Bool)

(assert (=> b!1076890 (= e!615612 e!615615)))

(assert (=> b!1076890 (= c!108287 (and (is-Cons!23207 (insertStrictlySorted!385 (toList!7344 lm!214) a2!57 b2!55)) (= (_1!8355 (h!24416 (insertStrictlySorted!385 (toList!7344 lm!214) a2!57 b2!55))) a1!69)))))

(assert (= (and d!129763 c!108288) b!1076881))

(assert (= (and d!129763 (not c!108288)) b!1076890))

(assert (= (and b!1076890 c!108287) b!1076886))

(assert (= (and b!1076890 (not c!108287)) b!1076884))

(assert (= (and b!1076884 c!108286) b!1076885))

(assert (= (and b!1076884 (not c!108286)) b!1076882))

(assert (= (or b!1076885 b!1076882) bm!45694))

(assert (= (or b!1076886 bm!45694) bm!45693))

(assert (= (or b!1076881 bm!45693) bm!45695))

(assert (= (and bm!45695 c!108289) b!1076887))

(assert (= (and bm!45695 (not c!108289)) b!1076889))

(assert (= (and d!129763 res!717659) b!1076883))

(assert (= (and b!1076883 res!717660) b!1076888))

(declare-fun m!995879 () Bool)

(assert (=> b!1076888 m!995879))

(declare-fun m!995881 () Bool)

(assert (=> b!1076883 m!995881))

(declare-fun m!995883 () Bool)

(assert (=> d!129763 m!995883))

(assert (=> d!129763 m!995657))

(declare-fun m!995885 () Bool)

(assert (=> d!129763 m!995885))

(declare-fun m!995887 () Bool)

(assert (=> b!1076887 m!995887))

(declare-fun m!995889 () Bool)

(assert (=> bm!45695 m!995889))

(assert (=> b!1076691 d!129763))

(declare-fun bm!45696 () Bool)

(declare-fun call!45699 () List!23211)

(declare-fun call!45701 () List!23211)

(assert (=> bm!45696 (= call!45699 call!45701)))

(declare-fun b!1076891 () Bool)

(declare-fun e!615617 () List!23211)

(assert (=> b!1076891 (= e!615617 call!45701)))

(declare-fun d!129767 () Bool)

(declare-fun e!615616 () Bool)

(assert (=> d!129767 e!615616))

(declare-fun res!717661 () Bool)

(assert (=> d!129767 (=> (not res!717661) (not e!615616))))

(declare-fun lt!478467 () List!23211)

(assert (=> d!129767 (= res!717661 (isStrictlySorted!724 lt!478467))))

(assert (=> d!129767 (= lt!478467 e!615617)))

(declare-fun c!108292 () Bool)

(assert (=> d!129767 (= c!108292 (and (is-Cons!23207 (insertStrictlySorted!385 (toList!7344 lm!214) a1!69 b1!79)) (bvslt (_1!8355 (h!24416 (insertStrictlySorted!385 (toList!7344 lm!214) a1!69 b1!79))) a2!57)))))

(assert (=> d!129767 (isStrictlySorted!724 (insertStrictlySorted!385 (toList!7344 lm!214) a1!69 b1!79))))

(assert (=> d!129767 (= (insertStrictlySorted!385 (insertStrictlySorted!385 (toList!7344 lm!214) a1!69 b1!79) a2!57 b2!55) lt!478467)))

(declare-fun b!1076892 () Bool)

(declare-fun e!615619 () List!23211)

(declare-fun call!45700 () List!23211)

(assert (=> b!1076892 (= e!615619 call!45700)))

(declare-fun b!1076893 () Bool)

(declare-fun res!717662 () Bool)

(assert (=> b!1076893 (=> (not res!717662) (not e!615616))))

(assert (=> b!1076893 (= res!717662 (containsKey!582 lt!478467 a2!57))))

(declare-fun b!1076894 () Bool)

(declare-fun c!108290 () Bool)

(assert (=> b!1076894 (= c!108290 (and (is-Cons!23207 (insertStrictlySorted!385 (toList!7344 lm!214) a1!69 b1!79)) (bvsgt (_1!8355 (h!24416 (insertStrictlySorted!385 (toList!7344 lm!214) a1!69 b1!79))) a2!57)))))

(declare-fun e!615620 () List!23211)

(assert (=> b!1076894 (= e!615620 e!615619)))

(declare-fun b!1076895 () Bool)

(assert (=> b!1076895 (= e!615619 call!45700)))

(declare-fun b!1076896 () Bool)

(assert (=> b!1076896 (= e!615620 call!45699)))

(declare-fun b!1076897 () Bool)

(declare-fun e!615618 () List!23211)

(assert (=> b!1076897 (= e!615618 (insertStrictlySorted!385 (t!32570 (insertStrictlySorted!385 (toList!7344 lm!214) a1!69 b1!79)) a2!57 b2!55))))

(declare-fun b!1076898 () Bool)

(assert (=> b!1076898 (= e!615616 (contains!6360 lt!478467 (tuple2!16689 a2!57 b2!55)))))

(declare-fun bm!45697 () Bool)

(assert (=> bm!45697 (= call!45700 call!45699)))

(declare-fun b!1076899 () Bool)

(declare-fun c!108291 () Bool)

(assert (=> b!1076899 (= e!615618 (ite c!108291 (t!32570 (insertStrictlySorted!385 (toList!7344 lm!214) a1!69 b1!79)) (ite c!108290 (Cons!23207 (h!24416 (insertStrictlySorted!385 (toList!7344 lm!214) a1!69 b1!79)) (t!32570 (insertStrictlySorted!385 (toList!7344 lm!214) a1!69 b1!79))) Nil!23208)))))

(declare-fun bm!45698 () Bool)

(assert (=> bm!45698 (= call!45701 ($colon$colon!605 e!615618 (ite c!108292 (h!24416 (insertStrictlySorted!385 (toList!7344 lm!214) a1!69 b1!79)) (tuple2!16689 a2!57 b2!55))))))

(declare-fun c!108293 () Bool)

(assert (=> bm!45698 (= c!108293 c!108292)))

(declare-fun b!1076900 () Bool)

(assert (=> b!1076900 (= e!615617 e!615620)))

(assert (=> b!1076900 (= c!108291 (and (is-Cons!23207 (insertStrictlySorted!385 (toList!7344 lm!214) a1!69 b1!79)) (= (_1!8355 (h!24416 (insertStrictlySorted!385 (toList!7344 lm!214) a1!69 b1!79))) a2!57)))))

(assert (= (and d!129767 c!108292) b!1076891))

(assert (= (and d!129767 (not c!108292)) b!1076900))

(assert (= (and b!1076900 c!108291) b!1076896))

(assert (= (and b!1076900 (not c!108291)) b!1076894))

(assert (= (and b!1076894 c!108290) b!1076895))

(assert (= (and b!1076894 (not c!108290)) b!1076892))

(assert (= (or b!1076895 b!1076892) bm!45697))

(assert (= (or b!1076896 bm!45697) bm!45696))

(assert (= (or b!1076891 bm!45696) bm!45698))

(assert (= (and bm!45698 c!108293) b!1076897))

(assert (= (and bm!45698 (not c!108293)) b!1076899))

(assert (= (and d!129767 res!717661) b!1076893))

(assert (= (and b!1076893 res!717662) b!1076898))

(declare-fun m!995891 () Bool)

(assert (=> b!1076898 m!995891))

(declare-fun m!995893 () Bool)

(assert (=> b!1076893 m!995893))

(declare-fun m!995895 () Bool)

(assert (=> d!129767 m!995895))

(assert (=> d!129767 m!995661))

(declare-fun m!995897 () Bool)

(assert (=> d!129767 m!995897))

(declare-fun m!995899 () Bool)

(assert (=> b!1076897 m!995899))

(declare-fun m!995901 () Bool)

(assert (=> bm!45698 m!995901))

(assert (=> b!1076691 d!129767))

(declare-fun d!129769 () Bool)

(declare-fun e!615621 () Bool)

(assert (=> d!129769 e!615621))

(declare-fun res!717663 () Bool)

(assert (=> d!129769 (=> (not res!717663) (not e!615621))))

(declare-fun lt!478471 () ListLongMap!14657)

(assert (=> d!129769 (= res!717663 (contains!6363 lt!478471 (_1!8355 lt!478381)))))

(declare-fun lt!478473 () List!23211)

(assert (=> d!129769 (= lt!478471 (ListLongMap!14658 lt!478473))))

(declare-fun lt!478470 () Unit!35446)

(declare-fun lt!478472 () Unit!35446)

(assert (=> d!129769 (= lt!478470 lt!478472)))

(assert (=> d!129769 (= (getValueByKey!615 lt!478473 (_1!8355 lt!478381)) (Some!665 (_2!8355 lt!478381)))))

(assert (=> d!129769 (= lt!478472 (lemmaContainsTupThenGetReturnValue!292 lt!478473 (_1!8355 lt!478381) (_2!8355 lt!478381)))))

(assert (=> d!129769 (= lt!478473 (insertStrictlySorted!385 (toList!7344 (+!3239 lm!214 lt!478382)) (_1!8355 lt!478381) (_2!8355 lt!478381)))))

(assert (=> d!129769 (= (+!3239 (+!3239 lm!214 lt!478382) lt!478381) lt!478471)))

(declare-fun b!1076901 () Bool)

(declare-fun res!717664 () Bool)

(assert (=> b!1076901 (=> (not res!717664) (not e!615621))))

(assert (=> b!1076901 (= res!717664 (= (getValueByKey!615 (toList!7344 lt!478471) (_1!8355 lt!478381)) (Some!665 (_2!8355 lt!478381))))))

(declare-fun b!1076902 () Bool)

(assert (=> b!1076902 (= e!615621 (contains!6360 (toList!7344 lt!478471) lt!478381))))

(assert (= (and d!129769 res!717663) b!1076901))

(assert (= (and b!1076901 res!717664) b!1076902))

(declare-fun m!995903 () Bool)

(assert (=> d!129769 m!995903))

(declare-fun m!995905 () Bool)

(assert (=> d!129769 m!995905))

(declare-fun m!995907 () Bool)

(assert (=> d!129769 m!995907))

(declare-fun m!995911 () Bool)

(assert (=> d!129769 m!995911))

(declare-fun m!995913 () Bool)

(assert (=> b!1076901 m!995913))

(declare-fun m!995915 () Bool)

(assert (=> b!1076902 m!995915))

(assert (=> b!1076691 d!129769))

(declare-fun d!129771 () Bool)

(declare-fun e!615622 () Bool)

(assert (=> d!129771 e!615622))

(declare-fun res!717665 () Bool)

(assert (=> d!129771 (=> (not res!717665) (not e!615622))))

(declare-fun lt!478476 () ListLongMap!14657)

(assert (=> d!129771 (= res!717665 (contains!6363 lt!478476 (_1!8355 lt!478381)))))

(declare-fun lt!478478 () List!23211)

(assert (=> d!129771 (= lt!478476 (ListLongMap!14658 lt!478478))))

(declare-fun lt!478475 () Unit!35446)

(declare-fun lt!478477 () Unit!35446)

(assert (=> d!129771 (= lt!478475 lt!478477)))

(assert (=> d!129771 (= (getValueByKey!615 lt!478478 (_1!8355 lt!478381)) (Some!665 (_2!8355 lt!478381)))))

(assert (=> d!129771 (= lt!478477 (lemmaContainsTupThenGetReturnValue!292 lt!478478 (_1!8355 lt!478381) (_2!8355 lt!478381)))))

(assert (=> d!129771 (= lt!478478 (insertStrictlySorted!385 (toList!7344 lm!214) (_1!8355 lt!478381) (_2!8355 lt!478381)))))

(assert (=> d!129771 (= (+!3239 lm!214 lt!478381) lt!478476)))

(declare-fun b!1076903 () Bool)

(declare-fun res!717666 () Bool)

(assert (=> b!1076903 (=> (not res!717666) (not e!615622))))

(assert (=> b!1076903 (= res!717666 (= (getValueByKey!615 (toList!7344 lt!478476) (_1!8355 lt!478381)) (Some!665 (_2!8355 lt!478381))))))

(declare-fun b!1076904 () Bool)

(assert (=> b!1076904 (= e!615622 (contains!6360 (toList!7344 lt!478476) lt!478381))))

(assert (= (and d!129771 res!717665) b!1076903))

(assert (= (and b!1076903 res!717666) b!1076904))

(declare-fun m!995917 () Bool)

(assert (=> d!129771 m!995917))

(declare-fun m!995919 () Bool)

(assert (=> d!129771 m!995919))

(declare-fun m!995923 () Bool)

(assert (=> d!129771 m!995923))

(declare-fun m!995927 () Bool)

(assert (=> d!129771 m!995927))

(declare-fun m!995929 () Bool)

(assert (=> b!1076903 m!995929))

(declare-fun m!995933 () Bool)

(assert (=> b!1076904 m!995933))

(assert (=> b!1076691 d!129771))

(declare-fun d!129775 () Bool)

(declare-fun e!615624 () Bool)

(assert (=> d!129775 e!615624))

(declare-fun res!717669 () Bool)

(assert (=> d!129775 (=> (not res!717669) (not e!615624))))

(declare-fun lt!478484 () ListLongMap!14657)

(assert (=> d!129775 (= res!717669 (contains!6363 lt!478484 (_1!8355 lt!478382)))))

(declare-fun lt!478486 () List!23211)

(assert (=> d!129775 (= lt!478484 (ListLongMap!14658 lt!478486))))

(declare-fun lt!478483 () Unit!35446)

(declare-fun lt!478485 () Unit!35446)

(assert (=> d!129775 (= lt!478483 lt!478485)))

(assert (=> d!129775 (= (getValueByKey!615 lt!478486 (_1!8355 lt!478382)) (Some!665 (_2!8355 lt!478382)))))

(assert (=> d!129775 (= lt!478485 (lemmaContainsTupThenGetReturnValue!292 lt!478486 (_1!8355 lt!478382) (_2!8355 lt!478382)))))

(assert (=> d!129775 (= lt!478486 (insertStrictlySorted!385 (toList!7344 (+!3239 lm!214 lt!478381)) (_1!8355 lt!478382) (_2!8355 lt!478382)))))

(assert (=> d!129775 (= (+!3239 (+!3239 lm!214 lt!478381) lt!478382) lt!478484)))

(declare-fun b!1076907 () Bool)

(declare-fun res!717670 () Bool)

(assert (=> b!1076907 (=> (not res!717670) (not e!615624))))

(assert (=> b!1076907 (= res!717670 (= (getValueByKey!615 (toList!7344 lt!478484) (_1!8355 lt!478382)) (Some!665 (_2!8355 lt!478382))))))

(declare-fun b!1076908 () Bool)

(assert (=> b!1076908 (= e!615624 (contains!6360 (toList!7344 lt!478484) lt!478382))))

(assert (= (and d!129775 res!717669) b!1076907))

(assert (= (and b!1076907 res!717670) b!1076908))

(declare-fun m!995941 () Bool)

(assert (=> d!129775 m!995941))

(declare-fun m!995943 () Bool)

(assert (=> d!129775 m!995943))

(declare-fun m!995945 () Bool)

(assert (=> d!129775 m!995945))

(declare-fun m!995947 () Bool)

(assert (=> d!129775 m!995947))

(declare-fun m!995949 () Bool)

(assert (=> b!1076907 m!995949))

(declare-fun m!995951 () Bool)

(assert (=> b!1076908 m!995951))

(assert (=> b!1076691 d!129775))

(declare-fun d!129779 () Bool)

(assert (=> d!129779 (= (inv!37861 lm!214) (isStrictlySorted!724 (toList!7344 lm!214)))))

(declare-fun bs!31726 () Bool)

(assert (= bs!31726 d!129779))

(assert (=> bs!31726 m!995655))

(assert (=> start!95278 d!129779))

(declare-fun d!129783 () Bool)

(declare-fun res!717689 () Bool)

(declare-fun e!615647 () Bool)

(assert (=> d!129783 (=> res!717689 e!615647)))

(assert (=> d!129783 (= res!717689 (or (is-Nil!23208 (toList!7344 lm!214)) (is-Nil!23208 (t!32570 (toList!7344 lm!214)))))))

(assert (=> d!129783 (= (isStrictlySorted!724 (toList!7344 lm!214)) e!615647)))

(declare-fun b!1076943 () Bool)

(declare-fun e!615648 () Bool)

(assert (=> b!1076943 (= e!615647 e!615648)))

(declare-fun res!717690 () Bool)

(assert (=> b!1076943 (=> (not res!717690) (not e!615648))))

(assert (=> b!1076943 (= res!717690 (bvslt (_1!8355 (h!24416 (toList!7344 lm!214))) (_1!8355 (h!24416 (t!32570 (toList!7344 lm!214))))))))

(declare-fun b!1076944 () Bool)

(assert (=> b!1076944 (= e!615648 (isStrictlySorted!724 (t!32570 (toList!7344 lm!214))))))

(assert (= (and d!129783 (not res!717689)) b!1076943))

(assert (= (and b!1076943 res!717690) b!1076944))

(declare-fun m!996005 () Bool)

(assert (=> b!1076944 m!996005))

(assert (=> b!1076690 d!129783))

(declare-fun b!1076954 () Bool)

(declare-fun e!615654 () Bool)

(declare-fun tp!78290 () Bool)

(assert (=> b!1076954 (= e!615654 (and tp_is_empty!26065 tp!78290))))

(assert (=> b!1076692 (= tp!78278 e!615654)))

(assert (= (and b!1076692 (is-Cons!23207 (toList!7344 lm!214))) b!1076954))

(push 1)

