; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95280 () Bool)

(assert start!95280)

(declare-fun res!717593 () Bool)

(declare-fun e!615515 () Bool)

(assert (=> start!95280 (=> (not res!717593) (not e!615515))))

(declare-fun a1!69 () (_ BitVec 64))

(declare-fun a2!57 () (_ BitVec 64))

(assert (=> start!95280 (= res!717593 (not (= a1!69 a2!57)))))

(assert (=> start!95280 e!615515))

(declare-fun tp_is_empty!26067 () Bool)

(assert (=> start!95280 tp_is_empty!26067))

(assert (=> start!95280 true))

(declare-datatypes ((B!1774 0))(
  ( (B!1775 (val!13090 Int)) )
))
(declare-datatypes ((tuple2!16690 0))(
  ( (tuple2!16691 (_1!8356 (_ BitVec 64)) (_2!8356 B!1774)) )
))
(declare-datatypes ((List!23212 0))(
  ( (Nil!23209) (Cons!23208 (h!24417 tuple2!16690) (t!32571 List!23212)) )
))
(declare-datatypes ((ListLongMap!14659 0))(
  ( (ListLongMap!14660 (toList!7345 List!23212)) )
))
(declare-fun lm!214 () ListLongMap!14659)

(declare-fun e!615516 () Bool)

(declare-fun inv!37862 (ListLongMap!14659) Bool)

(assert (=> start!95280 (and (inv!37862 lm!214) e!615516)))

(declare-fun b!1076699 () Bool)

(declare-fun res!717594 () Bool)

(assert (=> b!1076699 (=> (not res!717594) (not e!615515))))

(declare-fun isStrictlySorted!725 (List!23212) Bool)

(assert (=> b!1076699 (= res!717594 (isStrictlySorted!725 (toList!7345 lm!214)))))

(declare-fun b!1076700 () Bool)

(declare-fun lt!478391 () tuple2!16690)

(declare-fun lt!478390 () tuple2!16690)

(declare-fun +!3240 (ListLongMap!14659 tuple2!16690) ListLongMap!14659)

(assert (=> b!1076700 (= e!615515 (not (= (+!3240 (+!3240 lm!214 lt!478391) lt!478390) (+!3240 (+!3240 lm!214 lt!478390) lt!478391))))))

(declare-fun b2!55 () B!1774)

(assert (=> b!1076700 (= lt!478390 (tuple2!16691 a2!57 b2!55))))

(declare-fun b1!79 () B!1774)

(assert (=> b!1076700 (= lt!478391 (tuple2!16691 a1!69 b1!79))))

(declare-fun insertStrictlySorted!386 (List!23212 (_ BitVec 64) B!1774) List!23212)

(assert (=> b!1076700 (= (insertStrictlySorted!386 (insertStrictlySorted!386 (toList!7345 lm!214) a1!69 b1!79) a2!57 b2!55) (insertStrictlySorted!386 (insertStrictlySorted!386 (toList!7345 lm!214) a2!57 b2!55) a1!69 b1!79))))

(declare-datatypes ((Unit!35448 0))(
  ( (Unit!35449) )
))
(declare-fun lt!478389 () Unit!35448)

(declare-fun lemmaInsertStrictlySortedCommutative!2 (List!23212 (_ BitVec 64) B!1774 (_ BitVec 64) B!1774) Unit!35448)

(assert (=> b!1076700 (= lt!478389 (lemmaInsertStrictlySortedCommutative!2 (toList!7345 lm!214) a1!69 b1!79 a2!57 b2!55))))

(declare-fun b!1076701 () Bool)

(declare-fun tp!78281 () Bool)

(assert (=> b!1076701 (= e!615516 tp!78281)))

(assert (= (and start!95280 res!717593) b!1076699))

(assert (= (and b!1076699 res!717594) b!1076700))

(assert (= start!95280 b!1076701))

(declare-fun m!995675 () Bool)

(assert (=> start!95280 m!995675))

(declare-fun m!995677 () Bool)

(assert (=> b!1076699 m!995677))

(declare-fun m!995679 () Bool)

(assert (=> b!1076700 m!995679))

(declare-fun m!995681 () Bool)

(assert (=> b!1076700 m!995681))

(declare-fun m!995683 () Bool)

(assert (=> b!1076700 m!995683))

(declare-fun m!995685 () Bool)

(assert (=> b!1076700 m!995685))

(declare-fun m!995687 () Bool)

(assert (=> b!1076700 m!995687))

(assert (=> b!1076700 m!995685))

(declare-fun m!995689 () Bool)

(assert (=> b!1076700 m!995689))

(assert (=> b!1076700 m!995681))

(assert (=> b!1076700 m!995679))

(declare-fun m!995691 () Bool)

(assert (=> b!1076700 m!995691))

(declare-fun m!995693 () Bool)

(assert (=> b!1076700 m!995693))

(declare-fun m!995695 () Bool)

(assert (=> b!1076700 m!995695))

(assert (=> b!1076700 m!995693))

(check-sat (not start!95280) (not b!1076701) tp_is_empty!26067 (not b!1076699) (not b!1076700))
(check-sat)
(get-model)

(declare-fun d!129733 () Bool)

(declare-fun res!717605 () Bool)

(declare-fun e!615527 () Bool)

(assert (=> d!129733 (=> res!717605 e!615527)))

(get-info :version)

(assert (=> d!129733 (= res!717605 (or ((_ is Nil!23209) (toList!7345 lm!214)) ((_ is Nil!23209) (t!32571 (toList!7345 lm!214)))))))

(assert (=> d!129733 (= (isStrictlySorted!725 (toList!7345 lm!214)) e!615527)))

(declare-fun b!1076715 () Bool)

(declare-fun e!615528 () Bool)

(assert (=> b!1076715 (= e!615527 e!615528)))

(declare-fun res!717606 () Bool)

(assert (=> b!1076715 (=> (not res!717606) (not e!615528))))

(assert (=> b!1076715 (= res!717606 (bvslt (_1!8356 (h!24417 (toList!7345 lm!214))) (_1!8356 (h!24417 (t!32571 (toList!7345 lm!214))))))))

(declare-fun b!1076716 () Bool)

(assert (=> b!1076716 (= e!615528 (isStrictlySorted!725 (t!32571 (toList!7345 lm!214))))))

(assert (= (and d!129733 (not res!717605)) b!1076715))

(assert (= (and b!1076715 res!717606) b!1076716))

(declare-fun m!995719 () Bool)

(assert (=> b!1076716 m!995719))

(assert (=> b!1076699 d!129733))

(declare-fun b!1076797 () Bool)

(declare-fun e!615570 () List!23212)

(declare-fun call!45678 () List!23212)

(assert (=> b!1076797 (= e!615570 call!45678)))

(declare-fun d!129735 () Bool)

(declare-fun e!615571 () Bool)

(assert (=> d!129735 e!615571))

(declare-fun res!717623 () Bool)

(assert (=> d!129735 (=> (not res!717623) (not e!615571))))

(declare-fun lt!478409 () List!23212)

(assert (=> d!129735 (= res!717623 (isStrictlySorted!725 lt!478409))))

(declare-fun e!615572 () List!23212)

(assert (=> d!129735 (= lt!478409 e!615572)))

(declare-fun c!108265 () Bool)

(assert (=> d!129735 (= c!108265 (and ((_ is Cons!23208) (toList!7345 lm!214)) (bvslt (_1!8356 (h!24417 (toList!7345 lm!214))) a2!57)))))

(assert (=> d!129735 (isStrictlySorted!725 (toList!7345 lm!214))))

(assert (=> d!129735 (= (insertStrictlySorted!386 (toList!7345 lm!214) a2!57 b2!55) lt!478409)))

(declare-fun bm!45675 () Bool)

(declare-fun call!45680 () List!23212)

(assert (=> bm!45675 (= call!45678 call!45680)))

(declare-fun b!1076798 () Bool)

(declare-fun e!615569 () List!23212)

(assert (=> b!1076798 (= e!615572 e!615569)))

(declare-fun c!108262 () Bool)

(assert (=> b!1076798 (= c!108262 (and ((_ is Cons!23208) (toList!7345 lm!214)) (= (_1!8356 (h!24417 (toList!7345 lm!214))) a2!57)))))

(declare-fun b!1076799 () Bool)

(declare-fun contains!6361 (List!23212 tuple2!16690) Bool)

(assert (=> b!1076799 (= e!615571 (contains!6361 lt!478409 (tuple2!16691 a2!57 b2!55)))))

(declare-fun b!1076800 () Bool)

(declare-fun e!615573 () List!23212)

(assert (=> b!1076800 (= e!615573 (insertStrictlySorted!386 (t!32571 (toList!7345 lm!214)) a2!57 b2!55))))

(declare-fun b!1076801 () Bool)

(assert (=> b!1076801 (= e!615570 call!45678)))

(declare-fun c!108263 () Bool)

(declare-fun b!1076802 () Bool)

(assert (=> b!1076802 (= e!615573 (ite c!108262 (t!32571 (toList!7345 lm!214)) (ite c!108263 (Cons!23208 (h!24417 (toList!7345 lm!214)) (t!32571 (toList!7345 lm!214))) Nil!23209)))))

(declare-fun b!1076803 () Bool)

(assert (=> b!1076803 (= e!615569 call!45680)))

(declare-fun b!1076804 () Bool)

(declare-fun res!717624 () Bool)

(assert (=> b!1076804 (=> (not res!717624) (not e!615571))))

(declare-fun containsKey!583 (List!23212 (_ BitVec 64)) Bool)

(assert (=> b!1076804 (= res!717624 (containsKey!583 lt!478409 a2!57))))

(declare-fun b!1076805 () Bool)

(assert (=> b!1076805 (= c!108263 (and ((_ is Cons!23208) (toList!7345 lm!214)) (bvsgt (_1!8356 (h!24417 (toList!7345 lm!214))) a2!57)))))

(assert (=> b!1076805 (= e!615569 e!615570)))

(declare-fun b!1076806 () Bool)

(declare-fun call!45679 () List!23212)

(assert (=> b!1076806 (= e!615572 call!45679)))

(declare-fun bm!45676 () Bool)

(assert (=> bm!45676 (= call!45680 call!45679)))

(declare-fun bm!45677 () Bool)

(declare-fun $colon$colon!606 (List!23212 tuple2!16690) List!23212)

(assert (=> bm!45677 (= call!45679 ($colon$colon!606 e!615573 (ite c!108265 (h!24417 (toList!7345 lm!214)) (tuple2!16691 a2!57 b2!55))))))

(declare-fun c!108264 () Bool)

(assert (=> bm!45677 (= c!108264 c!108265)))

(assert (= (and d!129735 c!108265) b!1076806))

(assert (= (and d!129735 (not c!108265)) b!1076798))

(assert (= (and b!1076798 c!108262) b!1076803))

(assert (= (and b!1076798 (not c!108262)) b!1076805))

(assert (= (and b!1076805 c!108263) b!1076801))

(assert (= (and b!1076805 (not c!108263)) b!1076797))

(assert (= (or b!1076801 b!1076797) bm!45675))

(assert (= (or b!1076803 bm!45675) bm!45676))

(assert (= (or b!1076806 bm!45676) bm!45677))

(assert (= (and bm!45677 c!108264) b!1076800))

(assert (= (and bm!45677 (not c!108264)) b!1076802))

(assert (= (and d!129735 res!717623) b!1076804))

(assert (= (and b!1076804 res!717624) b!1076799))

(declare-fun m!995741 () Bool)

(assert (=> b!1076800 m!995741))

(declare-fun m!995743 () Bool)

(assert (=> b!1076799 m!995743))

(declare-fun m!995745 () Bool)

(assert (=> b!1076804 m!995745))

(declare-fun m!995747 () Bool)

(assert (=> d!129735 m!995747))

(assert (=> d!129735 m!995677))

(declare-fun m!995749 () Bool)

(assert (=> bm!45677 m!995749))

(assert (=> b!1076700 d!129735))

(declare-fun d!129741 () Bool)

(declare-fun e!615594 () Bool)

(assert (=> d!129741 e!615594))

(declare-fun res!717649 () Bool)

(assert (=> d!129741 (=> (not res!717649) (not e!615594))))

(declare-fun lt!478452 () ListLongMap!14659)

(declare-fun contains!6364 (ListLongMap!14659 (_ BitVec 64)) Bool)

(assert (=> d!129741 (= res!717649 (contains!6364 lt!478452 (_1!8356 lt!478390)))))

(declare-fun lt!478455 () List!23212)

(assert (=> d!129741 (= lt!478452 (ListLongMap!14660 lt!478455))))

(declare-fun lt!478454 () Unit!35448)

(declare-fun lt!478453 () Unit!35448)

(assert (=> d!129741 (= lt!478454 lt!478453)))

(declare-datatypes ((Option!667 0))(
  ( (Some!666 (v!15709 B!1774)) (None!665) )
))
(declare-fun getValueByKey!616 (List!23212 (_ BitVec 64)) Option!667)

(assert (=> d!129741 (= (getValueByKey!616 lt!478455 (_1!8356 lt!478390)) (Some!666 (_2!8356 lt!478390)))))

(declare-fun lemmaContainsTupThenGetReturnValue!293 (List!23212 (_ BitVec 64) B!1774) Unit!35448)

(assert (=> d!129741 (= lt!478453 (lemmaContainsTupThenGetReturnValue!293 lt!478455 (_1!8356 lt!478390) (_2!8356 lt!478390)))))

(assert (=> d!129741 (= lt!478455 (insertStrictlySorted!386 (toList!7345 (+!3240 lm!214 lt!478391)) (_1!8356 lt!478390) (_2!8356 lt!478390)))))

(assert (=> d!129741 (= (+!3240 (+!3240 lm!214 lt!478391) lt!478390) lt!478452)))

(declare-fun b!1076847 () Bool)

(declare-fun res!717650 () Bool)

(assert (=> b!1076847 (=> (not res!717650) (not e!615594))))

(assert (=> b!1076847 (= res!717650 (= (getValueByKey!616 (toList!7345 lt!478452) (_1!8356 lt!478390)) (Some!666 (_2!8356 lt!478390))))))

(declare-fun b!1076848 () Bool)

(assert (=> b!1076848 (= e!615594 (contains!6361 (toList!7345 lt!478452) lt!478390))))

(assert (= (and d!129741 res!717649) b!1076847))

(assert (= (and b!1076847 res!717650) b!1076848))

(declare-fun m!995819 () Bool)

(assert (=> d!129741 m!995819))

(declare-fun m!995821 () Bool)

(assert (=> d!129741 m!995821))

(declare-fun m!995823 () Bool)

(assert (=> d!129741 m!995823))

(declare-fun m!995825 () Bool)

(assert (=> d!129741 m!995825))

(declare-fun m!995827 () Bool)

(assert (=> b!1076847 m!995827))

(declare-fun m!995829 () Bool)

(assert (=> b!1076848 m!995829))

(assert (=> b!1076700 d!129741))

(declare-fun b!1076859 () Bool)

(declare-fun e!615601 () List!23212)

(declare-fun call!45690 () List!23212)

(assert (=> b!1076859 (= e!615601 call!45690)))

(declare-fun d!129755 () Bool)

(declare-fun e!615602 () Bool)

(assert (=> d!129755 e!615602))

(declare-fun res!717653 () Bool)

(assert (=> d!129755 (=> (not res!717653) (not e!615602))))

(declare-fun lt!478457 () List!23212)

(assert (=> d!129755 (= res!717653 (isStrictlySorted!725 lt!478457))))

(declare-fun e!615603 () List!23212)

(assert (=> d!129755 (= lt!478457 e!615603)))

(declare-fun c!108281 () Bool)

(assert (=> d!129755 (= c!108281 (and ((_ is Cons!23208) (toList!7345 lm!214)) (bvslt (_1!8356 (h!24417 (toList!7345 lm!214))) a1!69)))))

(assert (=> d!129755 (isStrictlySorted!725 (toList!7345 lm!214))))

(assert (=> d!129755 (= (insertStrictlySorted!386 (toList!7345 lm!214) a1!69 b1!79) lt!478457)))

(declare-fun bm!45687 () Bool)

(declare-fun call!45692 () List!23212)

(assert (=> bm!45687 (= call!45690 call!45692)))

(declare-fun b!1076860 () Bool)

(declare-fun e!615600 () List!23212)

(assert (=> b!1076860 (= e!615603 e!615600)))

(declare-fun c!108278 () Bool)

(assert (=> b!1076860 (= c!108278 (and ((_ is Cons!23208) (toList!7345 lm!214)) (= (_1!8356 (h!24417 (toList!7345 lm!214))) a1!69)))))

(declare-fun b!1076861 () Bool)

(assert (=> b!1076861 (= e!615602 (contains!6361 lt!478457 (tuple2!16691 a1!69 b1!79)))))

(declare-fun b!1076862 () Bool)

(declare-fun e!615604 () List!23212)

(assert (=> b!1076862 (= e!615604 (insertStrictlySorted!386 (t!32571 (toList!7345 lm!214)) a1!69 b1!79))))

(declare-fun b!1076863 () Bool)

(assert (=> b!1076863 (= e!615601 call!45690)))

(declare-fun c!108279 () Bool)

(declare-fun b!1076864 () Bool)

(assert (=> b!1076864 (= e!615604 (ite c!108278 (t!32571 (toList!7345 lm!214)) (ite c!108279 (Cons!23208 (h!24417 (toList!7345 lm!214)) (t!32571 (toList!7345 lm!214))) Nil!23209)))))

(declare-fun b!1076865 () Bool)

(assert (=> b!1076865 (= e!615600 call!45692)))

(declare-fun b!1076866 () Bool)

(declare-fun res!717654 () Bool)

(assert (=> b!1076866 (=> (not res!717654) (not e!615602))))

(assert (=> b!1076866 (= res!717654 (containsKey!583 lt!478457 a1!69))))

(declare-fun b!1076867 () Bool)

(assert (=> b!1076867 (= c!108279 (and ((_ is Cons!23208) (toList!7345 lm!214)) (bvsgt (_1!8356 (h!24417 (toList!7345 lm!214))) a1!69)))))

(assert (=> b!1076867 (= e!615600 e!615601)))

(declare-fun b!1076868 () Bool)

(declare-fun call!45691 () List!23212)

(assert (=> b!1076868 (= e!615603 call!45691)))

(declare-fun bm!45688 () Bool)

(assert (=> bm!45688 (= call!45692 call!45691)))

(declare-fun bm!45689 () Bool)

(assert (=> bm!45689 (= call!45691 ($colon$colon!606 e!615604 (ite c!108281 (h!24417 (toList!7345 lm!214)) (tuple2!16691 a1!69 b1!79))))))

(declare-fun c!108280 () Bool)

(assert (=> bm!45689 (= c!108280 c!108281)))

(assert (= (and d!129755 c!108281) b!1076868))

(assert (= (and d!129755 (not c!108281)) b!1076860))

(assert (= (and b!1076860 c!108278) b!1076865))

(assert (= (and b!1076860 (not c!108278)) b!1076867))

(assert (= (and b!1076867 c!108279) b!1076863))

(assert (= (and b!1076867 (not c!108279)) b!1076859))

(assert (= (or b!1076863 b!1076859) bm!45687))

(assert (= (or b!1076865 bm!45687) bm!45688))

(assert (= (or b!1076868 bm!45688) bm!45689))

(assert (= (and bm!45689 c!108280) b!1076862))

(assert (= (and bm!45689 (not c!108280)) b!1076864))

(assert (= (and d!129755 res!717653) b!1076866))

(assert (= (and b!1076866 res!717654) b!1076861))

(declare-fun m!995843 () Bool)

(assert (=> b!1076862 m!995843))

(declare-fun m!995845 () Bool)

(assert (=> b!1076861 m!995845))

(declare-fun m!995847 () Bool)

(assert (=> b!1076866 m!995847))

(declare-fun m!995849 () Bool)

(assert (=> d!129755 m!995849))

(assert (=> d!129755 m!995677))

(declare-fun m!995851 () Bool)

(assert (=> bm!45689 m!995851))

(assert (=> b!1076700 d!129755))

(declare-fun d!129759 () Bool)

(declare-fun e!615605 () Bool)

(assert (=> d!129759 e!615605))

(declare-fun res!717655 () Bool)

(assert (=> d!129759 (=> (not res!717655) (not e!615605))))

(declare-fun lt!478460 () ListLongMap!14659)

(assert (=> d!129759 (= res!717655 (contains!6364 lt!478460 (_1!8356 lt!478390)))))

(declare-fun lt!478463 () List!23212)

(assert (=> d!129759 (= lt!478460 (ListLongMap!14660 lt!478463))))

(declare-fun lt!478462 () Unit!35448)

(declare-fun lt!478461 () Unit!35448)

(assert (=> d!129759 (= lt!478462 lt!478461)))

(assert (=> d!129759 (= (getValueByKey!616 lt!478463 (_1!8356 lt!478390)) (Some!666 (_2!8356 lt!478390)))))

(assert (=> d!129759 (= lt!478461 (lemmaContainsTupThenGetReturnValue!293 lt!478463 (_1!8356 lt!478390) (_2!8356 lt!478390)))))

(assert (=> d!129759 (= lt!478463 (insertStrictlySorted!386 (toList!7345 lm!214) (_1!8356 lt!478390) (_2!8356 lt!478390)))))

(assert (=> d!129759 (= (+!3240 lm!214 lt!478390) lt!478460)))

(declare-fun b!1076869 () Bool)

(declare-fun res!717656 () Bool)

(assert (=> b!1076869 (=> (not res!717656) (not e!615605))))

(assert (=> b!1076869 (= res!717656 (= (getValueByKey!616 (toList!7345 lt!478460) (_1!8356 lt!478390)) (Some!666 (_2!8356 lt!478390))))))

(declare-fun b!1076870 () Bool)

(assert (=> b!1076870 (= e!615605 (contains!6361 (toList!7345 lt!478460) lt!478390))))

(assert (= (and d!129759 res!717655) b!1076869))

(assert (= (and b!1076869 res!717656) b!1076870))

(declare-fun m!995853 () Bool)

(assert (=> d!129759 m!995853))

(declare-fun m!995855 () Bool)

(assert (=> d!129759 m!995855))

(declare-fun m!995857 () Bool)

(assert (=> d!129759 m!995857))

(declare-fun m!995859 () Bool)

(assert (=> d!129759 m!995859))

(declare-fun m!995861 () Bool)

(assert (=> b!1076869 m!995861))

(declare-fun m!995863 () Bool)

(assert (=> b!1076870 m!995863))

(assert (=> b!1076700 d!129759))

(declare-fun b!1076871 () Bool)

(declare-fun e!615607 () List!23212)

(declare-fun call!45693 () List!23212)

(assert (=> b!1076871 (= e!615607 call!45693)))

(declare-fun d!129761 () Bool)

(declare-fun e!615608 () Bool)

(assert (=> d!129761 e!615608))

(declare-fun res!717657 () Bool)

(assert (=> d!129761 (=> (not res!717657) (not e!615608))))

(declare-fun lt!478465 () List!23212)

(assert (=> d!129761 (= res!717657 (isStrictlySorted!725 lt!478465))))

(declare-fun e!615609 () List!23212)

(assert (=> d!129761 (= lt!478465 e!615609)))

(declare-fun c!108285 () Bool)

(assert (=> d!129761 (= c!108285 (and ((_ is Cons!23208) (insertStrictlySorted!386 (toList!7345 lm!214) a1!69 b1!79)) (bvslt (_1!8356 (h!24417 (insertStrictlySorted!386 (toList!7345 lm!214) a1!69 b1!79))) a2!57)))))

(assert (=> d!129761 (isStrictlySorted!725 (insertStrictlySorted!386 (toList!7345 lm!214) a1!69 b1!79))))

(assert (=> d!129761 (= (insertStrictlySorted!386 (insertStrictlySorted!386 (toList!7345 lm!214) a1!69 b1!79) a2!57 b2!55) lt!478465)))

(declare-fun bm!45690 () Bool)

(declare-fun call!45695 () List!23212)

(assert (=> bm!45690 (= call!45693 call!45695)))

(declare-fun b!1076872 () Bool)

(declare-fun e!615606 () List!23212)

(assert (=> b!1076872 (= e!615609 e!615606)))

(declare-fun c!108282 () Bool)

(assert (=> b!1076872 (= c!108282 (and ((_ is Cons!23208) (insertStrictlySorted!386 (toList!7345 lm!214) a1!69 b1!79)) (= (_1!8356 (h!24417 (insertStrictlySorted!386 (toList!7345 lm!214) a1!69 b1!79))) a2!57)))))

(declare-fun b!1076873 () Bool)

(assert (=> b!1076873 (= e!615608 (contains!6361 lt!478465 (tuple2!16691 a2!57 b2!55)))))

(declare-fun b!1076874 () Bool)

(declare-fun e!615610 () List!23212)

(assert (=> b!1076874 (= e!615610 (insertStrictlySorted!386 (t!32571 (insertStrictlySorted!386 (toList!7345 lm!214) a1!69 b1!79)) a2!57 b2!55))))

(declare-fun b!1076875 () Bool)

(assert (=> b!1076875 (= e!615607 call!45693)))

(declare-fun c!108283 () Bool)

(declare-fun b!1076876 () Bool)

(assert (=> b!1076876 (= e!615610 (ite c!108282 (t!32571 (insertStrictlySorted!386 (toList!7345 lm!214) a1!69 b1!79)) (ite c!108283 (Cons!23208 (h!24417 (insertStrictlySorted!386 (toList!7345 lm!214) a1!69 b1!79)) (t!32571 (insertStrictlySorted!386 (toList!7345 lm!214) a1!69 b1!79))) Nil!23209)))))

(declare-fun b!1076877 () Bool)

(assert (=> b!1076877 (= e!615606 call!45695)))

(declare-fun b!1076878 () Bool)

(declare-fun res!717658 () Bool)

(assert (=> b!1076878 (=> (not res!717658) (not e!615608))))

(assert (=> b!1076878 (= res!717658 (containsKey!583 lt!478465 a2!57))))

(declare-fun b!1076879 () Bool)

(assert (=> b!1076879 (= c!108283 (and ((_ is Cons!23208) (insertStrictlySorted!386 (toList!7345 lm!214) a1!69 b1!79)) (bvsgt (_1!8356 (h!24417 (insertStrictlySorted!386 (toList!7345 lm!214) a1!69 b1!79))) a2!57)))))

(assert (=> b!1076879 (= e!615606 e!615607)))

(declare-fun b!1076880 () Bool)

(declare-fun call!45694 () List!23212)

(assert (=> b!1076880 (= e!615609 call!45694)))

(declare-fun bm!45691 () Bool)

(assert (=> bm!45691 (= call!45695 call!45694)))

(declare-fun bm!45692 () Bool)

(assert (=> bm!45692 (= call!45694 ($colon$colon!606 e!615610 (ite c!108285 (h!24417 (insertStrictlySorted!386 (toList!7345 lm!214) a1!69 b1!79)) (tuple2!16691 a2!57 b2!55))))))

(declare-fun c!108284 () Bool)

(assert (=> bm!45692 (= c!108284 c!108285)))

(assert (= (and d!129761 c!108285) b!1076880))

(assert (= (and d!129761 (not c!108285)) b!1076872))

(assert (= (and b!1076872 c!108282) b!1076877))

(assert (= (and b!1076872 (not c!108282)) b!1076879))

(assert (= (and b!1076879 c!108283) b!1076875))

(assert (= (and b!1076879 (not c!108283)) b!1076871))

(assert (= (or b!1076875 b!1076871) bm!45690))

(assert (= (or b!1076877 bm!45690) bm!45691))

(assert (= (or b!1076880 bm!45691) bm!45692))

(assert (= (and bm!45692 c!108284) b!1076874))

(assert (= (and bm!45692 (not c!108284)) b!1076876))

(assert (= (and d!129761 res!717657) b!1076878))

(assert (= (and b!1076878 res!717658) b!1076873))

(declare-fun m!995867 () Bool)

(assert (=> b!1076874 m!995867))

(declare-fun m!995869 () Bool)

(assert (=> b!1076873 m!995869))

(declare-fun m!995871 () Bool)

(assert (=> b!1076878 m!995871))

(declare-fun m!995873 () Bool)

(assert (=> d!129761 m!995873))

(assert (=> d!129761 m!995685))

(declare-fun m!995875 () Bool)

(assert (=> d!129761 m!995875))

(declare-fun m!995877 () Bool)

(assert (=> bm!45692 m!995877))

(assert (=> b!1076700 d!129761))

(declare-fun d!129765 () Bool)

(assert (=> d!129765 (= (insertStrictlySorted!386 (insertStrictlySorted!386 (toList!7345 lm!214) a1!69 b1!79) a2!57 b2!55) (insertStrictlySorted!386 (insertStrictlySorted!386 (toList!7345 lm!214) a2!57 b2!55) a1!69 b1!79))))

(declare-fun lt!478490 () Unit!35448)

(declare-fun choose!1760 (List!23212 (_ BitVec 64) B!1774 (_ BitVec 64) B!1774) Unit!35448)

(assert (=> d!129765 (= lt!478490 (choose!1760 (toList!7345 lm!214) a1!69 b1!79 a2!57 b2!55))))

(assert (=> d!129765 (not (= a1!69 a2!57))))

(assert (=> d!129765 (= (lemmaInsertStrictlySortedCommutative!2 (toList!7345 lm!214) a1!69 b1!79 a2!57 b2!55) lt!478490)))

(declare-fun bs!31725 () Bool)

(assert (= bs!31725 d!129765))

(assert (=> bs!31725 m!995685))

(assert (=> bs!31725 m!995685))

(assert (=> bs!31725 m!995687))

(declare-fun m!995965 () Bool)

(assert (=> bs!31725 m!995965))

(assert (=> bs!31725 m!995681))

(assert (=> bs!31725 m!995683))

(assert (=> bs!31725 m!995681))

(assert (=> b!1076700 d!129765))

(declare-fun b!1076919 () Bool)

(declare-fun e!615631 () List!23212)

(declare-fun call!45705 () List!23212)

(assert (=> b!1076919 (= e!615631 call!45705)))

(declare-fun d!129785 () Bool)

(declare-fun e!615632 () Bool)

(assert (=> d!129785 e!615632))

(declare-fun res!717673 () Bool)

(assert (=> d!129785 (=> (not res!717673) (not e!615632))))

(declare-fun lt!478491 () List!23212)

(assert (=> d!129785 (= res!717673 (isStrictlySorted!725 lt!478491))))

(declare-fun e!615633 () List!23212)

(assert (=> d!129785 (= lt!478491 e!615633)))

(declare-fun c!108301 () Bool)

(assert (=> d!129785 (= c!108301 (and ((_ is Cons!23208) (insertStrictlySorted!386 (toList!7345 lm!214) a2!57 b2!55)) (bvslt (_1!8356 (h!24417 (insertStrictlySorted!386 (toList!7345 lm!214) a2!57 b2!55))) a1!69)))))

(assert (=> d!129785 (isStrictlySorted!725 (insertStrictlySorted!386 (toList!7345 lm!214) a2!57 b2!55))))

(assert (=> d!129785 (= (insertStrictlySorted!386 (insertStrictlySorted!386 (toList!7345 lm!214) a2!57 b2!55) a1!69 b1!79) lt!478491)))

(declare-fun bm!45702 () Bool)

(declare-fun call!45707 () List!23212)

(assert (=> bm!45702 (= call!45705 call!45707)))

(declare-fun b!1076920 () Bool)

(declare-fun e!615630 () List!23212)

(assert (=> b!1076920 (= e!615633 e!615630)))

(declare-fun c!108298 () Bool)

(assert (=> b!1076920 (= c!108298 (and ((_ is Cons!23208) (insertStrictlySorted!386 (toList!7345 lm!214) a2!57 b2!55)) (= (_1!8356 (h!24417 (insertStrictlySorted!386 (toList!7345 lm!214) a2!57 b2!55))) a1!69)))))

(declare-fun b!1076921 () Bool)

(assert (=> b!1076921 (= e!615632 (contains!6361 lt!478491 (tuple2!16691 a1!69 b1!79)))))

(declare-fun e!615634 () List!23212)

(declare-fun b!1076922 () Bool)

(assert (=> b!1076922 (= e!615634 (insertStrictlySorted!386 (t!32571 (insertStrictlySorted!386 (toList!7345 lm!214) a2!57 b2!55)) a1!69 b1!79))))

(declare-fun b!1076923 () Bool)

(assert (=> b!1076923 (= e!615631 call!45705)))

(declare-fun b!1076924 () Bool)

(declare-fun c!108299 () Bool)

(assert (=> b!1076924 (= e!615634 (ite c!108298 (t!32571 (insertStrictlySorted!386 (toList!7345 lm!214) a2!57 b2!55)) (ite c!108299 (Cons!23208 (h!24417 (insertStrictlySorted!386 (toList!7345 lm!214) a2!57 b2!55)) (t!32571 (insertStrictlySorted!386 (toList!7345 lm!214) a2!57 b2!55))) Nil!23209)))))

(declare-fun b!1076925 () Bool)

(assert (=> b!1076925 (= e!615630 call!45707)))

(declare-fun b!1076926 () Bool)

(declare-fun res!717674 () Bool)

(assert (=> b!1076926 (=> (not res!717674) (not e!615632))))

(assert (=> b!1076926 (= res!717674 (containsKey!583 lt!478491 a1!69))))

(declare-fun b!1076927 () Bool)

(assert (=> b!1076927 (= c!108299 (and ((_ is Cons!23208) (insertStrictlySorted!386 (toList!7345 lm!214) a2!57 b2!55)) (bvsgt (_1!8356 (h!24417 (insertStrictlySorted!386 (toList!7345 lm!214) a2!57 b2!55))) a1!69)))))

(assert (=> b!1076927 (= e!615630 e!615631)))

(declare-fun b!1076928 () Bool)

(declare-fun call!45706 () List!23212)

(assert (=> b!1076928 (= e!615633 call!45706)))

(declare-fun bm!45703 () Bool)

(assert (=> bm!45703 (= call!45707 call!45706)))

(declare-fun bm!45704 () Bool)

(assert (=> bm!45704 (= call!45706 ($colon$colon!606 e!615634 (ite c!108301 (h!24417 (insertStrictlySorted!386 (toList!7345 lm!214) a2!57 b2!55)) (tuple2!16691 a1!69 b1!79))))))

(declare-fun c!108300 () Bool)

(assert (=> bm!45704 (= c!108300 c!108301)))

(assert (= (and d!129785 c!108301) b!1076928))

(assert (= (and d!129785 (not c!108301)) b!1076920))

(assert (= (and b!1076920 c!108298) b!1076925))

(assert (= (and b!1076920 (not c!108298)) b!1076927))

(assert (= (and b!1076927 c!108299) b!1076923))

(assert (= (and b!1076927 (not c!108299)) b!1076919))

(assert (= (or b!1076923 b!1076919) bm!45702))

(assert (= (or b!1076925 bm!45702) bm!45703))

(assert (= (or b!1076928 bm!45703) bm!45704))

(assert (= (and bm!45704 c!108300) b!1076922))

(assert (= (and bm!45704 (not c!108300)) b!1076924))

(assert (= (and d!129785 res!717673) b!1076926))

(assert (= (and b!1076926 res!717674) b!1076921))

(declare-fun m!995967 () Bool)

(assert (=> b!1076922 m!995967))

(declare-fun m!995969 () Bool)

(assert (=> b!1076921 m!995969))

(declare-fun m!995971 () Bool)

(assert (=> b!1076926 m!995971))

(declare-fun m!995973 () Bool)

(assert (=> d!129785 m!995973))

(assert (=> d!129785 m!995681))

(declare-fun m!995975 () Bool)

(assert (=> d!129785 m!995975))

(declare-fun m!995977 () Bool)

(assert (=> bm!45704 m!995977))

(assert (=> b!1076700 d!129785))

(declare-fun d!129787 () Bool)

(declare-fun e!615639 () Bool)

(assert (=> d!129787 e!615639))

(declare-fun res!717679 () Bool)

(assert (=> d!129787 (=> (not res!717679) (not e!615639))))

(declare-fun lt!478492 () ListLongMap!14659)

(assert (=> d!129787 (= res!717679 (contains!6364 lt!478492 (_1!8356 lt!478391)))))

(declare-fun lt!478495 () List!23212)

(assert (=> d!129787 (= lt!478492 (ListLongMap!14660 lt!478495))))

(declare-fun lt!478494 () Unit!35448)

(declare-fun lt!478493 () Unit!35448)

(assert (=> d!129787 (= lt!478494 lt!478493)))

(assert (=> d!129787 (= (getValueByKey!616 lt!478495 (_1!8356 lt!478391)) (Some!666 (_2!8356 lt!478391)))))

(assert (=> d!129787 (= lt!478493 (lemmaContainsTupThenGetReturnValue!293 lt!478495 (_1!8356 lt!478391) (_2!8356 lt!478391)))))

(assert (=> d!129787 (= lt!478495 (insertStrictlySorted!386 (toList!7345 (+!3240 lm!214 lt!478390)) (_1!8356 lt!478391) (_2!8356 lt!478391)))))

(assert (=> d!129787 (= (+!3240 (+!3240 lm!214 lt!478390) lt!478391) lt!478492)))

(declare-fun b!1076931 () Bool)

(declare-fun res!717680 () Bool)

(assert (=> b!1076931 (=> (not res!717680) (not e!615639))))

(assert (=> b!1076931 (= res!717680 (= (getValueByKey!616 (toList!7345 lt!478492) (_1!8356 lt!478391)) (Some!666 (_2!8356 lt!478391))))))

(declare-fun b!1076932 () Bool)

(assert (=> b!1076932 (= e!615639 (contains!6361 (toList!7345 lt!478492) lt!478391))))

(assert (= (and d!129787 res!717679) b!1076931))

(assert (= (and b!1076931 res!717680) b!1076932))

(declare-fun m!995979 () Bool)

(assert (=> d!129787 m!995979))

(declare-fun m!995981 () Bool)

(assert (=> d!129787 m!995981))

(declare-fun m!995983 () Bool)

(assert (=> d!129787 m!995983))

(declare-fun m!995985 () Bool)

(assert (=> d!129787 m!995985))

(declare-fun m!995987 () Bool)

(assert (=> b!1076931 m!995987))

(declare-fun m!995989 () Bool)

(assert (=> b!1076932 m!995989))

(assert (=> b!1076700 d!129787))

(declare-fun d!129789 () Bool)

(declare-fun e!615644 () Bool)

(assert (=> d!129789 e!615644))

(declare-fun res!717685 () Bool)

(assert (=> d!129789 (=> (not res!717685) (not e!615644))))

(declare-fun lt!478496 () ListLongMap!14659)

(assert (=> d!129789 (= res!717685 (contains!6364 lt!478496 (_1!8356 lt!478391)))))

(declare-fun lt!478499 () List!23212)

(assert (=> d!129789 (= lt!478496 (ListLongMap!14660 lt!478499))))

(declare-fun lt!478498 () Unit!35448)

(declare-fun lt!478497 () Unit!35448)

(assert (=> d!129789 (= lt!478498 lt!478497)))

(assert (=> d!129789 (= (getValueByKey!616 lt!478499 (_1!8356 lt!478391)) (Some!666 (_2!8356 lt!478391)))))

(assert (=> d!129789 (= lt!478497 (lemmaContainsTupThenGetReturnValue!293 lt!478499 (_1!8356 lt!478391) (_2!8356 lt!478391)))))

(assert (=> d!129789 (= lt!478499 (insertStrictlySorted!386 (toList!7345 lm!214) (_1!8356 lt!478391) (_2!8356 lt!478391)))))

(assert (=> d!129789 (= (+!3240 lm!214 lt!478391) lt!478496)))

(declare-fun b!1076939 () Bool)

(declare-fun res!717686 () Bool)

(assert (=> b!1076939 (=> (not res!717686) (not e!615644))))

(assert (=> b!1076939 (= res!717686 (= (getValueByKey!616 (toList!7345 lt!478496) (_1!8356 lt!478391)) (Some!666 (_2!8356 lt!478391))))))

(declare-fun b!1076940 () Bool)

(assert (=> b!1076940 (= e!615644 (contains!6361 (toList!7345 lt!478496) lt!478391))))

(assert (= (and d!129789 res!717685) b!1076939))

(assert (= (and b!1076939 res!717686) b!1076940))

(declare-fun m!995991 () Bool)

(assert (=> d!129789 m!995991))

(declare-fun m!995993 () Bool)

(assert (=> d!129789 m!995993))

(declare-fun m!995995 () Bool)

(assert (=> d!129789 m!995995))

(declare-fun m!995997 () Bool)

(assert (=> d!129789 m!995997))

(declare-fun m!996001 () Bool)

(assert (=> b!1076939 m!996001))

(declare-fun m!996003 () Bool)

(assert (=> b!1076940 m!996003))

(assert (=> b!1076700 d!129789))

(declare-fun d!129791 () Bool)

(assert (=> d!129791 (= (inv!37862 lm!214) (isStrictlySorted!725 (toList!7345 lm!214)))))

(declare-fun bs!31727 () Bool)

(assert (= bs!31727 d!129791))

(assert (=> bs!31727 m!995677))

(assert (=> start!95280 d!129791))

(declare-fun b!1076959 () Bool)

(declare-fun e!615657 () Bool)

(declare-fun tp!78293 () Bool)

(assert (=> b!1076959 (= e!615657 (and tp_is_empty!26067 tp!78293))))

(assert (=> b!1076701 (= tp!78281 e!615657)))

(assert (= (and b!1076701 ((_ is Cons!23208) (toList!7345 lm!214))) b!1076959))

(check-sat (not bm!45704) (not b!1076922) (not b!1076939) (not d!129755) (not bm!45692) (not d!129741) (not b!1076940) (not d!129761) (not bm!45677) (not b!1076716) (not b!1076874) (not b!1076800) (not bm!45689) (not b!1076870) (not b!1076921) (not b!1076799) (not d!129759) (not d!129785) (not d!129735) (not d!129789) (not b!1076866) (not d!129787) (not b!1076878) (not b!1076848) (not b!1076861) tp_is_empty!26067 (not b!1076869) (not b!1076804) (not b!1076932) (not b!1076862) (not d!129791) (not b!1076847) (not b!1076873) (not b!1076931) (not d!129765) (not b!1076959) (not b!1076926))
(check-sat)
