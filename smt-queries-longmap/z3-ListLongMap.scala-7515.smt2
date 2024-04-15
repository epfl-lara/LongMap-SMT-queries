; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95272 () Bool)

(assert start!95272)

(declare-fun res!717519 () Bool)

(declare-fun e!615416 () Bool)

(assert (=> start!95272 (=> (not res!717519) (not e!615416))))

(declare-fun a1!69 () (_ BitVec 64))

(declare-fun a2!57 () (_ BitVec 64))

(assert (=> start!95272 (= res!717519 (not (= a1!69 a2!57)))))

(assert (=> start!95272 e!615416))

(declare-fun tp_is_empty!26065 () Bool)

(assert (=> start!95272 tp_is_empty!26065))

(assert (=> start!95272 true))

(declare-datatypes ((B!1772 0))(
  ( (B!1773 (val!13089 Int)) )
))
(declare-datatypes ((tuple2!16756 0))(
  ( (tuple2!16757 (_1!8389 (_ BitVec 64)) (_2!8389 B!1772)) )
))
(declare-datatypes ((List!23262 0))(
  ( (Nil!23259) (Cons!23258 (h!24467 tuple2!16756) (t!32612 List!23262)) )
))
(declare-datatypes ((ListLongMap!14725 0))(
  ( (ListLongMap!14726 (toList!7378 List!23262)) )
))
(declare-fun lm!214 () ListLongMap!14725)

(declare-fun e!615417 () Bool)

(declare-fun inv!37861 (ListLongMap!14725) Bool)

(assert (=> start!95272 (and (inv!37861 lm!214) e!615417)))

(declare-fun b!1076537 () Bool)

(declare-fun res!717518 () Bool)

(assert (=> b!1076537 (=> (not res!717518) (not e!615416))))

(declare-fun isStrictlySorted!720 (List!23262) Bool)

(assert (=> b!1076537 (= res!717518 (isStrictlySorted!720 (toList!7378 lm!214)))))

(declare-fun lt!478182 () tuple2!16756)

(declare-fun b!1076538 () Bool)

(declare-fun lt!478180 () tuple2!16756)

(declare-fun +!3267 (ListLongMap!14725 tuple2!16756) ListLongMap!14725)

(assert (=> b!1076538 (= e!615416 (not (= (+!3267 (+!3267 lm!214 lt!478182) lt!478180) (+!3267 (+!3267 lm!214 lt!478180) lt!478182))))))

(declare-fun b2!55 () B!1772)

(assert (=> b!1076538 (= lt!478180 (tuple2!16757 a2!57 b2!55))))

(declare-fun b1!79 () B!1772)

(assert (=> b!1076538 (= lt!478182 (tuple2!16757 a1!69 b1!79))))

(declare-fun insertStrictlySorted!386 (List!23262 (_ BitVec 64) B!1772) List!23262)

(assert (=> b!1076538 (= (insertStrictlySorted!386 (insertStrictlySorted!386 (toList!7378 lm!214) a1!69 b1!79) a2!57 b2!55) (insertStrictlySorted!386 (insertStrictlySorted!386 (toList!7378 lm!214) a2!57 b2!55) a1!69 b1!79))))

(declare-datatypes ((Unit!35289 0))(
  ( (Unit!35290) )
))
(declare-fun lt!478181 () Unit!35289)

(declare-fun lemmaInsertStrictlySortedCommutative!1 (List!23262 (_ BitVec 64) B!1772 (_ BitVec 64) B!1772) Unit!35289)

(assert (=> b!1076538 (= lt!478181 (lemmaInsertStrictlySortedCommutative!1 (toList!7378 lm!214) a1!69 b1!79 a2!57 b2!55))))

(declare-fun b!1076539 () Bool)

(declare-fun tp!78278 () Bool)

(assert (=> b!1076539 (= e!615417 tp!78278)))

(assert (= (and start!95272 res!717519) b!1076537))

(assert (= (and b!1076537 res!717518) b!1076538))

(assert (= start!95272 b!1076539))

(declare-fun m!995027 () Bool)

(assert (=> start!95272 m!995027))

(declare-fun m!995029 () Bool)

(assert (=> b!1076537 m!995029))

(declare-fun m!995031 () Bool)

(assert (=> b!1076538 m!995031))

(declare-fun m!995033 () Bool)

(assert (=> b!1076538 m!995033))

(declare-fun m!995035 () Bool)

(assert (=> b!1076538 m!995035))

(declare-fun m!995037 () Bool)

(assert (=> b!1076538 m!995037))

(declare-fun m!995039 () Bool)

(assert (=> b!1076538 m!995039))

(declare-fun m!995041 () Bool)

(assert (=> b!1076538 m!995041))

(assert (=> b!1076538 m!995039))

(declare-fun m!995043 () Bool)

(assert (=> b!1076538 m!995043))

(declare-fun m!995045 () Bool)

(assert (=> b!1076538 m!995045))

(assert (=> b!1076538 m!995031))

(assert (=> b!1076538 m!995035))

(assert (=> b!1076538 m!995045))

(declare-fun m!995047 () Bool)

(assert (=> b!1076538 m!995047))

(check-sat (not b!1076538) (not b!1076539) (not b!1076537) (not start!95272) tp_is_empty!26065)
(check-sat)
(get-model)

(declare-fun d!129575 () Bool)

(declare-fun res!717536 () Bool)

(declare-fun e!615440 () Bool)

(assert (=> d!129575 (=> res!717536 e!615440)))

(get-info :version)

(assert (=> d!129575 (= res!717536 (or ((_ is Nil!23259) (toList!7378 lm!214)) ((_ is Nil!23259) (t!32612 (toList!7378 lm!214)))))))

(assert (=> d!129575 (= (isStrictlySorted!720 (toList!7378 lm!214)) e!615440)))

(declare-fun b!1076574 () Bool)

(declare-fun e!615441 () Bool)

(assert (=> b!1076574 (= e!615440 e!615441)))

(declare-fun res!717537 () Bool)

(assert (=> b!1076574 (=> (not res!717537) (not e!615441))))

(assert (=> b!1076574 (= res!717537 (bvslt (_1!8389 (h!24467 (toList!7378 lm!214))) (_1!8389 (h!24467 (t!32612 (toList!7378 lm!214))))))))

(declare-fun b!1076575 () Bool)

(assert (=> b!1076575 (= e!615441 (isStrictlySorted!720 (t!32612 (toList!7378 lm!214))))))

(assert (= (and d!129575 (not res!717536)) b!1076574))

(assert (= (and b!1076574 res!717537) b!1076575))

(declare-fun m!995093 () Bool)

(assert (=> b!1076575 m!995093))

(assert (=> b!1076537 d!129575))

(declare-fun d!129577 () Bool)

(declare-fun e!615463 () Bool)

(assert (=> d!129577 e!615463))

(declare-fun res!717552 () Bool)

(assert (=> d!129577 (=> (not res!717552) (not e!615463))))

(declare-fun lt!478214 () ListLongMap!14725)

(declare-fun contains!6331 (ListLongMap!14725 (_ BitVec 64)) Bool)

(assert (=> d!129577 (= res!717552 (contains!6331 lt!478214 (_1!8389 lt!478182)))))

(declare-fun lt!478215 () List!23262)

(assert (=> d!129577 (= lt!478214 (ListLongMap!14726 lt!478215))))

(declare-fun lt!478217 () Unit!35289)

(declare-fun lt!478216 () Unit!35289)

(assert (=> d!129577 (= lt!478217 lt!478216)))

(declare-datatypes ((Option!668 0))(
  ( (Some!667 (v!15707 B!1772)) (None!666) )
))
(declare-fun getValueByKey!617 (List!23262 (_ BitVec 64)) Option!668)

(assert (=> d!129577 (= (getValueByKey!617 lt!478215 (_1!8389 lt!478182)) (Some!667 (_2!8389 lt!478182)))))

(declare-fun lemmaContainsTupThenGetReturnValue!293 (List!23262 (_ BitVec 64) B!1772) Unit!35289)

(assert (=> d!129577 (= lt!478216 (lemmaContainsTupThenGetReturnValue!293 lt!478215 (_1!8389 lt!478182) (_2!8389 lt!478182)))))

(assert (=> d!129577 (= lt!478215 (insertStrictlySorted!386 (toList!7378 (+!3267 lm!214 lt!478180)) (_1!8389 lt!478182) (_2!8389 lt!478182)))))

(assert (=> d!129577 (= (+!3267 (+!3267 lm!214 lt!478180) lt!478182) lt!478214)))

(declare-fun b!1076618 () Bool)

(declare-fun res!717553 () Bool)

(assert (=> b!1076618 (=> (not res!717553) (not e!615463))))

(assert (=> b!1076618 (= res!717553 (= (getValueByKey!617 (toList!7378 lt!478214) (_1!8389 lt!478182)) (Some!667 (_2!8389 lt!478182))))))

(declare-fun b!1076619 () Bool)

(declare-fun contains!6332 (List!23262 tuple2!16756) Bool)

(assert (=> b!1076619 (= e!615463 (contains!6332 (toList!7378 lt!478214) lt!478182))))

(assert (= (and d!129577 res!717552) b!1076618))

(assert (= (and b!1076618 res!717553) b!1076619))

(declare-fun m!995105 () Bool)

(assert (=> d!129577 m!995105))

(declare-fun m!995107 () Bool)

(assert (=> d!129577 m!995107))

(declare-fun m!995109 () Bool)

(assert (=> d!129577 m!995109))

(declare-fun m!995111 () Bool)

(assert (=> d!129577 m!995111))

(declare-fun m!995113 () Bool)

(assert (=> b!1076618 m!995113))

(declare-fun m!995115 () Bool)

(assert (=> b!1076619 m!995115))

(assert (=> b!1076538 d!129577))

(declare-fun d!129581 () Bool)

(declare-fun e!615469 () Bool)

(assert (=> d!129581 e!615469))

(declare-fun res!717556 () Bool)

(assert (=> d!129581 (=> (not res!717556) (not e!615469))))

(declare-fun lt!478219 () ListLongMap!14725)

(assert (=> d!129581 (= res!717556 (contains!6331 lt!478219 (_1!8389 lt!478182)))))

(declare-fun lt!478220 () List!23262)

(assert (=> d!129581 (= lt!478219 (ListLongMap!14726 lt!478220))))

(declare-fun lt!478222 () Unit!35289)

(declare-fun lt!478221 () Unit!35289)

(assert (=> d!129581 (= lt!478222 lt!478221)))

(assert (=> d!129581 (= (getValueByKey!617 lt!478220 (_1!8389 lt!478182)) (Some!667 (_2!8389 lt!478182)))))

(assert (=> d!129581 (= lt!478221 (lemmaContainsTupThenGetReturnValue!293 lt!478220 (_1!8389 lt!478182) (_2!8389 lt!478182)))))

(assert (=> d!129581 (= lt!478220 (insertStrictlySorted!386 (toList!7378 lm!214) (_1!8389 lt!478182) (_2!8389 lt!478182)))))

(assert (=> d!129581 (= (+!3267 lm!214 lt!478182) lt!478219)))

(declare-fun b!1076630 () Bool)

(declare-fun res!717557 () Bool)

(assert (=> b!1076630 (=> (not res!717557) (not e!615469))))

(assert (=> b!1076630 (= res!717557 (= (getValueByKey!617 (toList!7378 lt!478219) (_1!8389 lt!478182)) (Some!667 (_2!8389 lt!478182))))))

(declare-fun b!1076631 () Bool)

(assert (=> b!1076631 (= e!615469 (contains!6332 (toList!7378 lt!478219) lt!478182))))

(assert (= (and d!129581 res!717556) b!1076630))

(assert (= (and b!1076630 res!717557) b!1076631))

(declare-fun m!995117 () Bool)

(assert (=> d!129581 m!995117))

(declare-fun m!995119 () Bool)

(assert (=> d!129581 m!995119))

(declare-fun m!995121 () Bool)

(assert (=> d!129581 m!995121))

(declare-fun m!995123 () Bool)

(assert (=> d!129581 m!995123))

(declare-fun m!995126 () Bool)

(assert (=> b!1076630 m!995126))

(declare-fun m!995129 () Bool)

(assert (=> b!1076631 m!995129))

(assert (=> b!1076538 d!129581))

(declare-fun b!1076720 () Bool)

(declare-fun e!615514 () List!23262)

(declare-fun call!45672 () List!23262)

(assert (=> b!1076720 (= e!615514 call!45672)))

(declare-fun b!1076721 () Bool)

(declare-fun e!615516 () List!23262)

(assert (=> b!1076721 (= e!615516 (insertStrictlySorted!386 (t!32612 (toList!7378 lm!214)) a2!57 b2!55))))

(declare-fun c!108244 () Bool)

(declare-fun b!1076722 () Bool)

(declare-fun c!108245 () Bool)

(assert (=> b!1076722 (= e!615516 (ite c!108245 (t!32612 (toList!7378 lm!214)) (ite c!108244 (Cons!23258 (h!24467 (toList!7378 lm!214)) (t!32612 (toList!7378 lm!214))) Nil!23259)))))

(declare-fun bm!45667 () Bool)

(declare-fun call!45671 () List!23262)

(assert (=> bm!45667 (= call!45671 call!45672)))

(declare-fun b!1076723 () Bool)

(declare-fun e!615517 () List!23262)

(assert (=> b!1076723 (= e!615517 call!45671)))

(declare-fun b!1076724 () Bool)

(declare-fun e!615518 () List!23262)

(assert (=> b!1076724 (= e!615518 e!615514)))

(assert (=> b!1076724 (= c!108245 (and ((_ is Cons!23258) (toList!7378 lm!214)) (= (_1!8389 (h!24467 (toList!7378 lm!214))) a2!57)))))

(declare-fun bm!45668 () Bool)

(declare-fun call!45670 () List!23262)

(assert (=> bm!45668 (= call!45672 call!45670)))

(declare-fun d!129583 () Bool)

(declare-fun e!615515 () Bool)

(assert (=> d!129583 e!615515))

(declare-fun res!717590 () Bool)

(assert (=> d!129583 (=> (not res!717590) (not e!615515))))

(declare-fun lt!478269 () List!23262)

(assert (=> d!129583 (= res!717590 (isStrictlySorted!720 lt!478269))))

(assert (=> d!129583 (= lt!478269 e!615518)))

(declare-fun c!108243 () Bool)

(assert (=> d!129583 (= c!108243 (and ((_ is Cons!23258) (toList!7378 lm!214)) (bvslt (_1!8389 (h!24467 (toList!7378 lm!214))) a2!57)))))

(assert (=> d!129583 (isStrictlySorted!720 (toList!7378 lm!214))))

(assert (=> d!129583 (= (insertStrictlySorted!386 (toList!7378 lm!214) a2!57 b2!55) lt!478269)))

(declare-fun b!1076725 () Bool)

(assert (=> b!1076725 (= c!108244 (and ((_ is Cons!23258) (toList!7378 lm!214)) (bvsgt (_1!8389 (h!24467 (toList!7378 lm!214))) a2!57)))))

(assert (=> b!1076725 (= e!615514 e!615517)))

(declare-fun bm!45669 () Bool)

(declare-fun $colon$colon!609 (List!23262 tuple2!16756) List!23262)

(assert (=> bm!45669 (= call!45670 ($colon$colon!609 e!615516 (ite c!108243 (h!24467 (toList!7378 lm!214)) (tuple2!16757 a2!57 b2!55))))))

(declare-fun c!108246 () Bool)

(assert (=> bm!45669 (= c!108246 c!108243)))

(declare-fun b!1076726 () Bool)

(assert (=> b!1076726 (= e!615518 call!45670)))

(declare-fun b!1076727 () Bool)

(declare-fun res!717591 () Bool)

(assert (=> b!1076727 (=> (not res!717591) (not e!615515))))

(declare-fun containsKey!584 (List!23262 (_ BitVec 64)) Bool)

(assert (=> b!1076727 (= res!717591 (containsKey!584 lt!478269 a2!57))))

(declare-fun b!1076728 () Bool)

(assert (=> b!1076728 (= e!615517 call!45671)))

(declare-fun b!1076729 () Bool)

(assert (=> b!1076729 (= e!615515 (contains!6332 lt!478269 (tuple2!16757 a2!57 b2!55)))))

(assert (= (and d!129583 c!108243) b!1076726))

(assert (= (and d!129583 (not c!108243)) b!1076724))

(assert (= (and b!1076724 c!108245) b!1076720))

(assert (= (and b!1076724 (not c!108245)) b!1076725))

(assert (= (and b!1076725 c!108244) b!1076728))

(assert (= (and b!1076725 (not c!108244)) b!1076723))

(assert (= (or b!1076728 b!1076723) bm!45667))

(assert (= (or b!1076720 bm!45667) bm!45668))

(assert (= (or b!1076726 bm!45668) bm!45669))

(assert (= (and bm!45669 c!108246) b!1076721))

(assert (= (and bm!45669 (not c!108246)) b!1076722))

(assert (= (and d!129583 res!717590) b!1076727))

(assert (= (and b!1076727 res!717591) b!1076729))

(declare-fun m!995265 () Bool)

(assert (=> d!129583 m!995265))

(assert (=> d!129583 m!995029))

(declare-fun m!995269 () Bool)

(assert (=> b!1076727 m!995269))

(declare-fun m!995273 () Bool)

(assert (=> bm!45669 m!995273))

(declare-fun m!995275 () Bool)

(assert (=> b!1076729 m!995275))

(declare-fun m!995277 () Bool)

(assert (=> b!1076721 m!995277))

(assert (=> b!1076538 d!129583))

(declare-fun b!1076732 () Bool)

(declare-fun e!615520 () List!23262)

(declare-fun call!45675 () List!23262)

(assert (=> b!1076732 (= e!615520 call!45675)))

(declare-fun e!615522 () List!23262)

(declare-fun b!1076733 () Bool)

(assert (=> b!1076733 (= e!615522 (insertStrictlySorted!386 (t!32612 (toList!7378 lm!214)) a1!69 b1!79))))

(declare-fun c!108248 () Bool)

(declare-fun b!1076734 () Bool)

(declare-fun c!108249 () Bool)

(assert (=> b!1076734 (= e!615522 (ite c!108249 (t!32612 (toList!7378 lm!214)) (ite c!108248 (Cons!23258 (h!24467 (toList!7378 lm!214)) (t!32612 (toList!7378 lm!214))) Nil!23259)))))

(declare-fun bm!45670 () Bool)

(declare-fun call!45674 () List!23262)

(assert (=> bm!45670 (= call!45674 call!45675)))

(declare-fun b!1076735 () Bool)

(declare-fun e!615523 () List!23262)

(assert (=> b!1076735 (= e!615523 call!45674)))

(declare-fun b!1076736 () Bool)

(declare-fun e!615524 () List!23262)

(assert (=> b!1076736 (= e!615524 e!615520)))

(assert (=> b!1076736 (= c!108249 (and ((_ is Cons!23258) (toList!7378 lm!214)) (= (_1!8389 (h!24467 (toList!7378 lm!214))) a1!69)))))

(declare-fun bm!45671 () Bool)

(declare-fun call!45673 () List!23262)

(assert (=> bm!45671 (= call!45675 call!45673)))

(declare-fun d!129611 () Bool)

(declare-fun e!615521 () Bool)

(assert (=> d!129611 e!615521))

(declare-fun res!717594 () Bool)

(assert (=> d!129611 (=> (not res!717594) (not e!615521))))

(declare-fun lt!478276 () List!23262)

(assert (=> d!129611 (= res!717594 (isStrictlySorted!720 lt!478276))))

(assert (=> d!129611 (= lt!478276 e!615524)))

(declare-fun c!108247 () Bool)

(assert (=> d!129611 (= c!108247 (and ((_ is Cons!23258) (toList!7378 lm!214)) (bvslt (_1!8389 (h!24467 (toList!7378 lm!214))) a1!69)))))

(assert (=> d!129611 (isStrictlySorted!720 (toList!7378 lm!214))))

(assert (=> d!129611 (= (insertStrictlySorted!386 (toList!7378 lm!214) a1!69 b1!79) lt!478276)))

(declare-fun b!1076737 () Bool)

(assert (=> b!1076737 (= c!108248 (and ((_ is Cons!23258) (toList!7378 lm!214)) (bvsgt (_1!8389 (h!24467 (toList!7378 lm!214))) a1!69)))))

(assert (=> b!1076737 (= e!615520 e!615523)))

(declare-fun bm!45672 () Bool)

(assert (=> bm!45672 (= call!45673 ($colon$colon!609 e!615522 (ite c!108247 (h!24467 (toList!7378 lm!214)) (tuple2!16757 a1!69 b1!79))))))

(declare-fun c!108250 () Bool)

(assert (=> bm!45672 (= c!108250 c!108247)))

(declare-fun b!1076738 () Bool)

(assert (=> b!1076738 (= e!615524 call!45673)))

(declare-fun b!1076739 () Bool)

(declare-fun res!717595 () Bool)

(assert (=> b!1076739 (=> (not res!717595) (not e!615521))))

(assert (=> b!1076739 (= res!717595 (containsKey!584 lt!478276 a1!69))))

(declare-fun b!1076740 () Bool)

(assert (=> b!1076740 (= e!615523 call!45674)))

(declare-fun b!1076741 () Bool)

(assert (=> b!1076741 (= e!615521 (contains!6332 lt!478276 (tuple2!16757 a1!69 b1!79)))))

(assert (= (and d!129611 c!108247) b!1076738))

(assert (= (and d!129611 (not c!108247)) b!1076736))

(assert (= (and b!1076736 c!108249) b!1076732))

(assert (= (and b!1076736 (not c!108249)) b!1076737))

(assert (= (and b!1076737 c!108248) b!1076740))

(assert (= (and b!1076737 (not c!108248)) b!1076735))

(assert (= (or b!1076740 b!1076735) bm!45670))

(assert (= (or b!1076732 bm!45670) bm!45671))

(assert (= (or b!1076738 bm!45671) bm!45672))

(assert (= (and bm!45672 c!108250) b!1076733))

(assert (= (and bm!45672 (not c!108250)) b!1076734))

(assert (= (and d!129611 res!717594) b!1076739))

(assert (= (and b!1076739 res!717595) b!1076741))

(declare-fun m!995279 () Bool)

(assert (=> d!129611 m!995279))

(assert (=> d!129611 m!995029))

(declare-fun m!995281 () Bool)

(assert (=> b!1076739 m!995281))

(declare-fun m!995283 () Bool)

(assert (=> bm!45672 m!995283))

(declare-fun m!995285 () Bool)

(assert (=> b!1076741 m!995285))

(declare-fun m!995287 () Bool)

(assert (=> b!1076733 m!995287))

(assert (=> b!1076538 d!129611))

(declare-fun d!129615 () Bool)

(declare-fun e!615525 () Bool)

(assert (=> d!129615 e!615525))

(declare-fun res!717596 () Bool)

(assert (=> d!129615 (=> (not res!717596) (not e!615525))))

(declare-fun lt!478278 () ListLongMap!14725)

(assert (=> d!129615 (= res!717596 (contains!6331 lt!478278 (_1!8389 lt!478180)))))

(declare-fun lt!478279 () List!23262)

(assert (=> d!129615 (= lt!478278 (ListLongMap!14726 lt!478279))))

(declare-fun lt!478281 () Unit!35289)

(declare-fun lt!478280 () Unit!35289)

(assert (=> d!129615 (= lt!478281 lt!478280)))

(assert (=> d!129615 (= (getValueByKey!617 lt!478279 (_1!8389 lt!478180)) (Some!667 (_2!8389 lt!478180)))))

(assert (=> d!129615 (= lt!478280 (lemmaContainsTupThenGetReturnValue!293 lt!478279 (_1!8389 lt!478180) (_2!8389 lt!478180)))))

(assert (=> d!129615 (= lt!478279 (insertStrictlySorted!386 (toList!7378 (+!3267 lm!214 lt!478182)) (_1!8389 lt!478180) (_2!8389 lt!478180)))))

(assert (=> d!129615 (= (+!3267 (+!3267 lm!214 lt!478182) lt!478180) lt!478278)))

(declare-fun b!1076742 () Bool)

(declare-fun res!717597 () Bool)

(assert (=> b!1076742 (=> (not res!717597) (not e!615525))))

(assert (=> b!1076742 (= res!717597 (= (getValueByKey!617 (toList!7378 lt!478278) (_1!8389 lt!478180)) (Some!667 (_2!8389 lt!478180))))))

(declare-fun b!1076743 () Bool)

(assert (=> b!1076743 (= e!615525 (contains!6332 (toList!7378 lt!478278) lt!478180))))

(assert (= (and d!129615 res!717596) b!1076742))

(assert (= (and b!1076742 res!717597) b!1076743))

(declare-fun m!995291 () Bool)

(assert (=> d!129615 m!995291))

(declare-fun m!995293 () Bool)

(assert (=> d!129615 m!995293))

(declare-fun m!995295 () Bool)

(assert (=> d!129615 m!995295))

(declare-fun m!995297 () Bool)

(assert (=> d!129615 m!995297))

(declare-fun m!995299 () Bool)

(assert (=> b!1076742 m!995299))

(declare-fun m!995301 () Bool)

(assert (=> b!1076743 m!995301))

(assert (=> b!1076538 d!129615))

(declare-fun b!1076754 () Bool)

(declare-fun e!615531 () List!23262)

(declare-fun call!45681 () List!23262)

(assert (=> b!1076754 (= e!615531 call!45681)))

(declare-fun e!615533 () List!23262)

(declare-fun b!1076755 () Bool)

(assert (=> b!1076755 (= e!615533 (insertStrictlySorted!386 (t!32612 (insertStrictlySorted!386 (toList!7378 lm!214) a1!69 b1!79)) a2!57 b2!55))))

(declare-fun b!1076756 () Bool)

(declare-fun c!108257 () Bool)

(declare-fun c!108256 () Bool)

(assert (=> b!1076756 (= e!615533 (ite c!108257 (t!32612 (insertStrictlySorted!386 (toList!7378 lm!214) a1!69 b1!79)) (ite c!108256 (Cons!23258 (h!24467 (insertStrictlySorted!386 (toList!7378 lm!214) a1!69 b1!79)) (t!32612 (insertStrictlySorted!386 (toList!7378 lm!214) a1!69 b1!79))) Nil!23259)))))

(declare-fun bm!45676 () Bool)

(declare-fun call!45680 () List!23262)

(assert (=> bm!45676 (= call!45680 call!45681)))

(declare-fun b!1076757 () Bool)

(declare-fun e!615534 () List!23262)

(assert (=> b!1076757 (= e!615534 call!45680)))

(declare-fun b!1076758 () Bool)

(declare-fun e!615535 () List!23262)

(assert (=> b!1076758 (= e!615535 e!615531)))

(assert (=> b!1076758 (= c!108257 (and ((_ is Cons!23258) (insertStrictlySorted!386 (toList!7378 lm!214) a1!69 b1!79)) (= (_1!8389 (h!24467 (insertStrictlySorted!386 (toList!7378 lm!214) a1!69 b1!79))) a2!57)))))

(declare-fun bm!45677 () Bool)

(declare-fun call!45679 () List!23262)

(assert (=> bm!45677 (= call!45681 call!45679)))

(declare-fun d!129619 () Bool)

(declare-fun e!615532 () Bool)

(assert (=> d!129619 e!615532))

(declare-fun res!717600 () Bool)

(assert (=> d!129619 (=> (not res!717600) (not e!615532))))

(declare-fun lt!478283 () List!23262)

(assert (=> d!129619 (= res!717600 (isStrictlySorted!720 lt!478283))))

(assert (=> d!129619 (= lt!478283 e!615535)))

(declare-fun c!108255 () Bool)

(assert (=> d!129619 (= c!108255 (and ((_ is Cons!23258) (insertStrictlySorted!386 (toList!7378 lm!214) a1!69 b1!79)) (bvslt (_1!8389 (h!24467 (insertStrictlySorted!386 (toList!7378 lm!214) a1!69 b1!79))) a2!57)))))

(assert (=> d!129619 (isStrictlySorted!720 (insertStrictlySorted!386 (toList!7378 lm!214) a1!69 b1!79))))

(assert (=> d!129619 (= (insertStrictlySorted!386 (insertStrictlySorted!386 (toList!7378 lm!214) a1!69 b1!79) a2!57 b2!55) lt!478283)))

(declare-fun b!1076759 () Bool)

(assert (=> b!1076759 (= c!108256 (and ((_ is Cons!23258) (insertStrictlySorted!386 (toList!7378 lm!214) a1!69 b1!79)) (bvsgt (_1!8389 (h!24467 (insertStrictlySorted!386 (toList!7378 lm!214) a1!69 b1!79))) a2!57)))))

(assert (=> b!1076759 (= e!615531 e!615534)))

(declare-fun bm!45678 () Bool)

(assert (=> bm!45678 (= call!45679 ($colon$colon!609 e!615533 (ite c!108255 (h!24467 (insertStrictlySorted!386 (toList!7378 lm!214) a1!69 b1!79)) (tuple2!16757 a2!57 b2!55))))))

(declare-fun c!108258 () Bool)

(assert (=> bm!45678 (= c!108258 c!108255)))

(declare-fun b!1076760 () Bool)

(assert (=> b!1076760 (= e!615535 call!45679)))

(declare-fun b!1076761 () Bool)

(declare-fun res!717601 () Bool)

(assert (=> b!1076761 (=> (not res!717601) (not e!615532))))

(assert (=> b!1076761 (= res!717601 (containsKey!584 lt!478283 a2!57))))

(declare-fun b!1076762 () Bool)

(assert (=> b!1076762 (= e!615534 call!45680)))

(declare-fun b!1076763 () Bool)

(assert (=> b!1076763 (= e!615532 (contains!6332 lt!478283 (tuple2!16757 a2!57 b2!55)))))

(assert (= (and d!129619 c!108255) b!1076760))

(assert (= (and d!129619 (not c!108255)) b!1076758))

(assert (= (and b!1076758 c!108257) b!1076754))

(assert (= (and b!1076758 (not c!108257)) b!1076759))

(assert (= (and b!1076759 c!108256) b!1076762))

(assert (= (and b!1076759 (not c!108256)) b!1076757))

(assert (= (or b!1076762 b!1076757) bm!45676))

(assert (= (or b!1076754 bm!45676) bm!45677))

(assert (= (or b!1076760 bm!45677) bm!45678))

(assert (= (and bm!45678 c!108258) b!1076755))

(assert (= (and bm!45678 (not c!108258)) b!1076756))

(assert (= (and d!129619 res!717600) b!1076761))

(assert (= (and b!1076761 res!717601) b!1076763))

(declare-fun m!995315 () Bool)

(assert (=> d!129619 m!995315))

(assert (=> d!129619 m!995039))

(declare-fun m!995317 () Bool)

(assert (=> d!129619 m!995317))

(declare-fun m!995319 () Bool)

(assert (=> b!1076761 m!995319))

(declare-fun m!995321 () Bool)

(assert (=> bm!45678 m!995321))

(declare-fun m!995323 () Bool)

(assert (=> b!1076763 m!995323))

(declare-fun m!995325 () Bool)

(assert (=> b!1076755 m!995325))

(assert (=> b!1076538 d!129619))

(declare-fun d!129623 () Bool)

(assert (=> d!129623 (= (insertStrictlySorted!386 (insertStrictlySorted!386 (toList!7378 lm!214) a1!69 b1!79) a2!57 b2!55) (insertStrictlySorted!386 (insertStrictlySorted!386 (toList!7378 lm!214) a2!57 b2!55) a1!69 b1!79))))

(declare-fun lt!478294 () Unit!35289)

(declare-fun choose!1767 (List!23262 (_ BitVec 64) B!1772 (_ BitVec 64) B!1772) Unit!35289)

(assert (=> d!129623 (= lt!478294 (choose!1767 (toList!7378 lm!214) a1!69 b1!79 a2!57 b2!55))))

(assert (=> d!129623 (not (= a1!69 a2!57))))

(assert (=> d!129623 (= (lemmaInsertStrictlySortedCommutative!1 (toList!7378 lm!214) a1!69 b1!79 a2!57 b2!55) lt!478294)))

(declare-fun bs!31696 () Bool)

(assert (= bs!31696 d!129623))

(assert (=> bs!31696 m!995031))

(assert (=> bs!31696 m!995033))

(assert (=> bs!31696 m!995039))

(assert (=> bs!31696 m!995039))

(assert (=> bs!31696 m!995041))

(declare-fun m!995355 () Bool)

(assert (=> bs!31696 m!995355))

(assert (=> bs!31696 m!995031))

(assert (=> b!1076538 d!129623))

(declare-fun b!1076785 () Bool)

(declare-fun e!615553 () List!23262)

(declare-fun call!45684 () List!23262)

(assert (=> b!1076785 (= e!615553 call!45684)))

(declare-fun e!615555 () List!23262)

(declare-fun b!1076786 () Bool)

(assert (=> b!1076786 (= e!615555 (insertStrictlySorted!386 (t!32612 (insertStrictlySorted!386 (toList!7378 lm!214) a2!57 b2!55)) a1!69 b1!79))))

(declare-fun c!108261 () Bool)

(declare-fun c!108260 () Bool)

(declare-fun b!1076787 () Bool)

(assert (=> b!1076787 (= e!615555 (ite c!108261 (t!32612 (insertStrictlySorted!386 (toList!7378 lm!214) a2!57 b2!55)) (ite c!108260 (Cons!23258 (h!24467 (insertStrictlySorted!386 (toList!7378 lm!214) a2!57 b2!55)) (t!32612 (insertStrictlySorted!386 (toList!7378 lm!214) a2!57 b2!55))) Nil!23259)))))

(declare-fun bm!45679 () Bool)

(declare-fun call!45683 () List!23262)

(assert (=> bm!45679 (= call!45683 call!45684)))

(declare-fun b!1076788 () Bool)

(declare-fun e!615556 () List!23262)

(assert (=> b!1076788 (= e!615556 call!45683)))

(declare-fun b!1076789 () Bool)

(declare-fun e!615557 () List!23262)

(assert (=> b!1076789 (= e!615557 e!615553)))

(assert (=> b!1076789 (= c!108261 (and ((_ is Cons!23258) (insertStrictlySorted!386 (toList!7378 lm!214) a2!57 b2!55)) (= (_1!8389 (h!24467 (insertStrictlySorted!386 (toList!7378 lm!214) a2!57 b2!55))) a1!69)))))

(declare-fun bm!45680 () Bool)

(declare-fun call!45682 () List!23262)

(assert (=> bm!45680 (= call!45684 call!45682)))

(declare-fun d!129631 () Bool)

(declare-fun e!615554 () Bool)

(assert (=> d!129631 e!615554))

(declare-fun res!717618 () Bool)

(assert (=> d!129631 (=> (not res!717618) (not e!615554))))

(declare-fun lt!478295 () List!23262)

(assert (=> d!129631 (= res!717618 (isStrictlySorted!720 lt!478295))))

(assert (=> d!129631 (= lt!478295 e!615557)))

(declare-fun c!108259 () Bool)

(assert (=> d!129631 (= c!108259 (and ((_ is Cons!23258) (insertStrictlySorted!386 (toList!7378 lm!214) a2!57 b2!55)) (bvslt (_1!8389 (h!24467 (insertStrictlySorted!386 (toList!7378 lm!214) a2!57 b2!55))) a1!69)))))

(assert (=> d!129631 (isStrictlySorted!720 (insertStrictlySorted!386 (toList!7378 lm!214) a2!57 b2!55))))

(assert (=> d!129631 (= (insertStrictlySorted!386 (insertStrictlySorted!386 (toList!7378 lm!214) a2!57 b2!55) a1!69 b1!79) lt!478295)))

(declare-fun b!1076790 () Bool)

(assert (=> b!1076790 (= c!108260 (and ((_ is Cons!23258) (insertStrictlySorted!386 (toList!7378 lm!214) a2!57 b2!55)) (bvsgt (_1!8389 (h!24467 (insertStrictlySorted!386 (toList!7378 lm!214) a2!57 b2!55))) a1!69)))))

(assert (=> b!1076790 (= e!615553 e!615556)))

(declare-fun bm!45681 () Bool)

(assert (=> bm!45681 (= call!45682 ($colon$colon!609 e!615555 (ite c!108259 (h!24467 (insertStrictlySorted!386 (toList!7378 lm!214) a2!57 b2!55)) (tuple2!16757 a1!69 b1!79))))))

(declare-fun c!108262 () Bool)

(assert (=> bm!45681 (= c!108262 c!108259)))

(declare-fun b!1076791 () Bool)

(assert (=> b!1076791 (= e!615557 call!45682)))

(declare-fun b!1076792 () Bool)

(declare-fun res!717619 () Bool)

(assert (=> b!1076792 (=> (not res!717619) (not e!615554))))

(assert (=> b!1076792 (= res!717619 (containsKey!584 lt!478295 a1!69))))

(declare-fun b!1076793 () Bool)

(assert (=> b!1076793 (= e!615556 call!45683)))

(declare-fun b!1076794 () Bool)

(assert (=> b!1076794 (= e!615554 (contains!6332 lt!478295 (tuple2!16757 a1!69 b1!79)))))

(assert (= (and d!129631 c!108259) b!1076791))

(assert (= (and d!129631 (not c!108259)) b!1076789))

(assert (= (and b!1076789 c!108261) b!1076785))

(assert (= (and b!1076789 (not c!108261)) b!1076790))

(assert (= (and b!1076790 c!108260) b!1076793))

(assert (= (and b!1076790 (not c!108260)) b!1076788))

(assert (= (or b!1076793 b!1076788) bm!45679))

(assert (= (or b!1076785 bm!45679) bm!45680))

(assert (= (or b!1076791 bm!45680) bm!45681))

(assert (= (and bm!45681 c!108262) b!1076786))

(assert (= (and bm!45681 (not c!108262)) b!1076787))

(assert (= (and d!129631 res!717618) b!1076792))

(assert (= (and b!1076792 res!717619) b!1076794))

(declare-fun m!995357 () Bool)

(assert (=> d!129631 m!995357))

(assert (=> d!129631 m!995031))

(declare-fun m!995359 () Bool)

(assert (=> d!129631 m!995359))

(declare-fun m!995361 () Bool)

(assert (=> b!1076792 m!995361))

(declare-fun m!995363 () Bool)

(assert (=> bm!45681 m!995363))

(declare-fun m!995365 () Bool)

(assert (=> b!1076794 m!995365))

(declare-fun m!995367 () Bool)

(assert (=> b!1076786 m!995367))

(assert (=> b!1076538 d!129631))

(declare-fun d!129633 () Bool)

(declare-fun e!615561 () Bool)

(assert (=> d!129633 e!615561))

(declare-fun res!717620 () Bool)

(assert (=> d!129633 (=> (not res!717620) (not e!615561))))

(declare-fun lt!478296 () ListLongMap!14725)

(assert (=> d!129633 (= res!717620 (contains!6331 lt!478296 (_1!8389 lt!478180)))))

(declare-fun lt!478297 () List!23262)

(assert (=> d!129633 (= lt!478296 (ListLongMap!14726 lt!478297))))

(declare-fun lt!478299 () Unit!35289)

(declare-fun lt!478298 () Unit!35289)

(assert (=> d!129633 (= lt!478299 lt!478298)))

(assert (=> d!129633 (= (getValueByKey!617 lt!478297 (_1!8389 lt!478180)) (Some!667 (_2!8389 lt!478180)))))

(assert (=> d!129633 (= lt!478298 (lemmaContainsTupThenGetReturnValue!293 lt!478297 (_1!8389 lt!478180) (_2!8389 lt!478180)))))

(assert (=> d!129633 (= lt!478297 (insertStrictlySorted!386 (toList!7378 lm!214) (_1!8389 lt!478180) (_2!8389 lt!478180)))))

(assert (=> d!129633 (= (+!3267 lm!214 lt!478180) lt!478296)))

(declare-fun b!1076800 () Bool)

(declare-fun res!717621 () Bool)

(assert (=> b!1076800 (=> (not res!717621) (not e!615561))))

(assert (=> b!1076800 (= res!717621 (= (getValueByKey!617 (toList!7378 lt!478296) (_1!8389 lt!478180)) (Some!667 (_2!8389 lt!478180))))))

(declare-fun b!1076801 () Bool)

(assert (=> b!1076801 (= e!615561 (contains!6332 (toList!7378 lt!478296) lt!478180))))

(assert (= (and d!129633 res!717620) b!1076800))

(assert (= (and b!1076800 res!717621) b!1076801))

(declare-fun m!995369 () Bool)

(assert (=> d!129633 m!995369))

(declare-fun m!995371 () Bool)

(assert (=> d!129633 m!995371))

(declare-fun m!995373 () Bool)

(assert (=> d!129633 m!995373))

(declare-fun m!995375 () Bool)

(assert (=> d!129633 m!995375))

(declare-fun m!995377 () Bool)

(assert (=> b!1076800 m!995377))

(declare-fun m!995379 () Bool)

(assert (=> b!1076801 m!995379))

(assert (=> b!1076538 d!129633))

(declare-fun d!129635 () Bool)

(assert (=> d!129635 (= (inv!37861 lm!214) (isStrictlySorted!720 (toList!7378 lm!214)))))

(declare-fun bs!31698 () Bool)

(assert (= bs!31698 d!129635))

(assert (=> bs!31698 m!995029))

(assert (=> start!95272 d!129635))

(declare-fun b!1076806 () Bool)

(declare-fun e!615564 () Bool)

(declare-fun tp!78293 () Bool)

(assert (=> b!1076806 (= e!615564 (and tp_is_empty!26065 tp!78293))))

(assert (=> b!1076539 (= tp!78278 e!615564)))

(assert (= (and b!1076539 ((_ is Cons!23258) (toList!7378 lm!214))) b!1076806))

(check-sat (not d!129619) (not b!1076794) tp_is_empty!26065 (not b!1076806) (not d!129633) (not d!129583) (not b!1076618) (not b!1076786) (not bm!45678) (not b!1076739) (not d!129623) (not bm!45681) (not d!129635) (not bm!45669) (not b!1076792) (not b!1076729) (not b!1076800) (not b!1076733) (not d!129615) (not b!1076742) (not bm!45672) (not b!1076721) (not b!1076631) (not b!1076763) (not d!129577) (not b!1076630) (not b!1076755) (not b!1076761) (not b!1076801) (not b!1076619) (not d!129631) (not b!1076727) (not d!129581) (not b!1076741) (not b!1076575) (not b!1076743) (not d!129611))
(check-sat)
