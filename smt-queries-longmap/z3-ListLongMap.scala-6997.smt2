; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88758 () Bool)

(assert start!88758)

(declare-fun b!1019383 () Bool)

(declare-fun e!573664 () Bool)

(declare-fun tp_is_empty!23757 () Bool)

(declare-fun tp!71152 () Bool)

(assert (=> b!1019383 (= e!573664 (and tp_is_empty!23757 tp!71152))))

(declare-fun b!1019384 () Bool)

(declare-fun res!683398 () Bool)

(declare-fun e!573666 () Bool)

(assert (=> b!1019384 (=> (not res!683398) (not e!573666))))

(declare-datatypes ((B!1690 0))(
  ( (B!1691 (val!11929 Int)) )
))
(declare-datatypes ((tuple2!15404 0))(
  ( (tuple2!15405 (_1!7713 (_ BitVec 64)) (_2!7713 B!1690)) )
))
(declare-datatypes ((List!21617 0))(
  ( (Nil!21614) (Cons!21613 (h!22811 tuple2!15404) (t!30621 List!21617)) )
))
(declare-fun l!996 () List!21617)

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!542 (List!21617 (_ BitVec 64)) Bool)

(assert (=> b!1019384 (= res!683398 (containsKey!542 (t!30621 l!996) key!261))))

(declare-fun b!1019385 () Bool)

(declare-fun res!683400 () Bool)

(assert (=> b!1019385 (=> (not res!683400) (not e!573666))))

(declare-fun isStrictlySorted!682 (List!21617) Bool)

(assert (=> b!1019385 (= res!683400 (isStrictlySorted!682 (t!30621 l!996)))))

(declare-fun b!1019386 () Bool)

(declare-fun e!573665 () Bool)

(assert (=> b!1019386 (= e!573665 e!573666)))

(declare-fun res!683402 () Bool)

(assert (=> b!1019386 (=> (not res!683402) (not e!573666))))

(get-info :version)

(assert (=> b!1019386 (= res!683402 (and ((_ is Cons!21613) l!996) (bvslt (_1!7713 (h!22811 l!996)) key!261)))))

(declare-fun value!172 () B!1690)

(declare-fun lt!449667 () List!21617)

(declare-fun insertStrictlySorted!360 (List!21617 (_ BitVec 64) B!1690) List!21617)

(assert (=> b!1019386 (= lt!449667 (insertStrictlySorted!360 l!996 key!261 value!172))))

(declare-fun b!1019387 () Bool)

(declare-fun length!45 (List!21617) Int)

(assert (=> b!1019387 (= e!573666 (not (= (length!45 lt!449667) (length!45 l!996))))))

(assert (=> b!1019387 (= (length!45 (insertStrictlySorted!360 (t!30621 l!996) key!261 value!172)) (length!45 (t!30621 l!996)))))

(declare-datatypes ((Unit!33289 0))(
  ( (Unit!33290) )
))
(declare-fun lt!449666 () Unit!33289)

(declare-fun lemmaAddExistingKeyPreservesSize!5 (List!21617 (_ BitVec 64) B!1690) Unit!33289)

(assert (=> b!1019387 (= lt!449666 (lemmaAddExistingKeyPreservesSize!5 (t!30621 l!996) key!261 value!172))))

(declare-fun b!1019382 () Bool)

(declare-fun res!683399 () Bool)

(assert (=> b!1019382 (=> (not res!683399) (not e!573665))))

(assert (=> b!1019382 (= res!683399 (containsKey!542 l!996 key!261))))

(declare-fun res!683401 () Bool)

(assert (=> start!88758 (=> (not res!683401) (not e!573665))))

(assert (=> start!88758 (= res!683401 (isStrictlySorted!682 l!996))))

(assert (=> start!88758 e!573665))

(assert (=> start!88758 e!573664))

(assert (=> start!88758 true))

(assert (=> start!88758 tp_is_empty!23757))

(assert (= (and start!88758 res!683401) b!1019382))

(assert (= (and b!1019382 res!683399) b!1019386))

(assert (= (and b!1019386 res!683402) b!1019385))

(assert (= (and b!1019385 res!683400) b!1019384))

(assert (= (and b!1019384 res!683398) b!1019387))

(assert (= (and start!88758 ((_ is Cons!21613) l!996)) b!1019383))

(declare-fun m!939719 () Bool)

(assert (=> b!1019382 m!939719))

(declare-fun m!939721 () Bool)

(assert (=> b!1019387 m!939721))

(declare-fun m!939723 () Bool)

(assert (=> b!1019387 m!939723))

(declare-fun m!939725 () Bool)

(assert (=> b!1019387 m!939725))

(declare-fun m!939727 () Bool)

(assert (=> b!1019387 m!939727))

(assert (=> b!1019387 m!939721))

(declare-fun m!939729 () Bool)

(assert (=> b!1019387 m!939729))

(declare-fun m!939731 () Bool)

(assert (=> b!1019387 m!939731))

(declare-fun m!939733 () Bool)

(assert (=> b!1019386 m!939733))

(declare-fun m!939735 () Bool)

(assert (=> start!88758 m!939735))

(declare-fun m!939737 () Bool)

(assert (=> b!1019385 m!939737))

(declare-fun m!939739 () Bool)

(assert (=> b!1019384 m!939739))

(check-sat (not b!1019384) tp_is_empty!23757 (not b!1019383) (not b!1019382) (not b!1019386) (not b!1019387) (not start!88758) (not b!1019385))
(check-sat)
(get-model)

(declare-fun d!122041 () Bool)

(declare-fun res!683422 () Bool)

(declare-fun e!573680 () Bool)

(assert (=> d!122041 (=> res!683422 e!573680)))

(assert (=> d!122041 (= res!683422 (and ((_ is Cons!21613) (t!30621 l!996)) (= (_1!7713 (h!22811 (t!30621 l!996))) key!261)))))

(assert (=> d!122041 (= (containsKey!542 (t!30621 l!996) key!261) e!573680)))

(declare-fun b!1019410 () Bool)

(declare-fun e!573681 () Bool)

(assert (=> b!1019410 (= e!573680 e!573681)))

(declare-fun res!683423 () Bool)

(assert (=> b!1019410 (=> (not res!683423) (not e!573681))))

(assert (=> b!1019410 (= res!683423 (and (or (not ((_ is Cons!21613) (t!30621 l!996))) (bvsle (_1!7713 (h!22811 (t!30621 l!996))) key!261)) ((_ is Cons!21613) (t!30621 l!996)) (bvslt (_1!7713 (h!22811 (t!30621 l!996))) key!261)))))

(declare-fun b!1019411 () Bool)

(assert (=> b!1019411 (= e!573681 (containsKey!542 (t!30621 (t!30621 l!996)) key!261))))

(assert (= (and d!122041 (not res!683422)) b!1019410))

(assert (= (and b!1019410 res!683423) b!1019411))

(declare-fun m!939763 () Bool)

(assert (=> b!1019411 m!939763))

(assert (=> b!1019384 d!122041))

(declare-fun d!122043 () Bool)

(declare-fun res!683428 () Bool)

(declare-fun e!573686 () Bool)

(assert (=> d!122043 (=> res!683428 e!573686)))

(assert (=> d!122043 (= res!683428 (or ((_ is Nil!21614) (t!30621 l!996)) ((_ is Nil!21614) (t!30621 (t!30621 l!996)))))))

(assert (=> d!122043 (= (isStrictlySorted!682 (t!30621 l!996)) e!573686)))

(declare-fun b!1019416 () Bool)

(declare-fun e!573687 () Bool)

(assert (=> b!1019416 (= e!573686 e!573687)))

(declare-fun res!683429 () Bool)

(assert (=> b!1019416 (=> (not res!683429) (not e!573687))))

(assert (=> b!1019416 (= res!683429 (bvslt (_1!7713 (h!22811 (t!30621 l!996))) (_1!7713 (h!22811 (t!30621 (t!30621 l!996))))))))

(declare-fun b!1019417 () Bool)

(assert (=> b!1019417 (= e!573687 (isStrictlySorted!682 (t!30621 (t!30621 l!996))))))

(assert (= (and d!122043 (not res!683428)) b!1019416))

(assert (= (and b!1019416 res!683429) b!1019417))

(declare-fun m!939765 () Bool)

(assert (=> b!1019417 m!939765))

(assert (=> b!1019385 d!122043))

(declare-fun b!1019464 () Bool)

(declare-fun e!573720 () List!21617)

(declare-fun e!573722 () List!21617)

(assert (=> b!1019464 (= e!573720 e!573722)))

(declare-fun c!103335 () Bool)

(assert (=> b!1019464 (= c!103335 (and ((_ is Cons!21613) l!996) (= (_1!7713 (h!22811 l!996)) key!261)))))

(declare-fun b!1019465 () Bool)

(declare-fun c!103333 () Bool)

(assert (=> b!1019465 (= c!103333 (and ((_ is Cons!21613) l!996) (bvsgt (_1!7713 (h!22811 l!996)) key!261)))))

(declare-fun e!573721 () List!21617)

(assert (=> b!1019465 (= e!573722 e!573721)))

(declare-fun b!1019466 () Bool)

(declare-fun call!43086 () List!21617)

(assert (=> b!1019466 (= e!573722 call!43086)))

(declare-fun bm!43082 () Bool)

(declare-fun call!43087 () List!21617)

(assert (=> bm!43082 (= call!43086 call!43087)))

(declare-fun b!1019468 () Bool)

(declare-fun call!43085 () List!21617)

(assert (=> b!1019468 (= e!573721 call!43085)))

(declare-fun b!1019469 () Bool)

(assert (=> b!1019469 (= e!573721 call!43085)))

(declare-fun bm!43083 () Bool)

(assert (=> bm!43083 (= call!43085 call!43086)))

(declare-fun b!1019470 () Bool)

(assert (=> b!1019470 (= e!573720 call!43087)))

(declare-fun c!103334 () Bool)

(declare-fun e!573718 () List!21617)

(declare-fun bm!43084 () Bool)

(declare-fun $colon$colon!589 (List!21617 tuple2!15404) List!21617)

(assert (=> bm!43084 (= call!43087 ($colon$colon!589 e!573718 (ite c!103334 (h!22811 l!996) (tuple2!15405 key!261 value!172))))))

(declare-fun c!103336 () Bool)

(assert (=> bm!43084 (= c!103336 c!103334)))

(declare-fun b!1019471 () Bool)

(assert (=> b!1019471 (= e!573718 (insertStrictlySorted!360 (t!30621 l!996) key!261 value!172))))

(declare-fun b!1019472 () Bool)

(declare-fun lt!449678 () List!21617)

(declare-fun e!573719 () Bool)

(declare-fun contains!5908 (List!21617 tuple2!15404) Bool)

(assert (=> b!1019472 (= e!573719 (contains!5908 lt!449678 (tuple2!15405 key!261 value!172)))))

(declare-fun b!1019473 () Bool)

(assert (=> b!1019473 (= e!573718 (ite c!103335 (t!30621 l!996) (ite c!103333 (Cons!21613 (h!22811 l!996) (t!30621 l!996)) Nil!21614)))))

(declare-fun b!1019467 () Bool)

(declare-fun res!683449 () Bool)

(assert (=> b!1019467 (=> (not res!683449) (not e!573719))))

(assert (=> b!1019467 (= res!683449 (containsKey!542 lt!449678 key!261))))

(declare-fun d!122045 () Bool)

(assert (=> d!122045 e!573719))

(declare-fun res!683448 () Bool)

(assert (=> d!122045 (=> (not res!683448) (not e!573719))))

(assert (=> d!122045 (= res!683448 (isStrictlySorted!682 lt!449678))))

(assert (=> d!122045 (= lt!449678 e!573720)))

(assert (=> d!122045 (= c!103334 (and ((_ is Cons!21613) l!996) (bvslt (_1!7713 (h!22811 l!996)) key!261)))))

(assert (=> d!122045 (isStrictlySorted!682 l!996)))

(assert (=> d!122045 (= (insertStrictlySorted!360 l!996 key!261 value!172) lt!449678)))

(assert (= (and d!122045 c!103334) b!1019470))

(assert (= (and d!122045 (not c!103334)) b!1019464))

(assert (= (and b!1019464 c!103335) b!1019466))

(assert (= (and b!1019464 (not c!103335)) b!1019465))

(assert (= (and b!1019465 c!103333) b!1019468))

(assert (= (and b!1019465 (not c!103333)) b!1019469))

(assert (= (or b!1019468 b!1019469) bm!43083))

(assert (= (or b!1019466 bm!43083) bm!43082))

(assert (= (or b!1019470 bm!43082) bm!43084))

(assert (= (and bm!43084 c!103336) b!1019471))

(assert (= (and bm!43084 (not c!103336)) b!1019473))

(assert (= (and d!122045 res!683448) b!1019467))

(assert (= (and b!1019467 res!683449) b!1019472))

(declare-fun m!939771 () Bool)

(assert (=> bm!43084 m!939771))

(declare-fun m!939773 () Bool)

(assert (=> b!1019467 m!939773))

(declare-fun m!939775 () Bool)

(assert (=> d!122045 m!939775))

(assert (=> d!122045 m!939735))

(assert (=> b!1019471 m!939721))

(declare-fun m!939777 () Bool)

(assert (=> b!1019472 m!939777))

(assert (=> b!1019386 d!122045))

(declare-fun b!1019478 () Bool)

(declare-fun e!573727 () List!21617)

(declare-fun e!573729 () List!21617)

(assert (=> b!1019478 (= e!573727 e!573729)))

(declare-fun c!103341 () Bool)

(assert (=> b!1019478 (= c!103341 (and ((_ is Cons!21613) (t!30621 l!996)) (= (_1!7713 (h!22811 (t!30621 l!996))) key!261)))))

(declare-fun b!1019479 () Bool)

(declare-fun c!103339 () Bool)

(assert (=> b!1019479 (= c!103339 (and ((_ is Cons!21613) (t!30621 l!996)) (bvsgt (_1!7713 (h!22811 (t!30621 l!996))) key!261)))))

(declare-fun e!573728 () List!21617)

(assert (=> b!1019479 (= e!573729 e!573728)))

(declare-fun b!1019480 () Bool)

(declare-fun call!43091 () List!21617)

(assert (=> b!1019480 (= e!573729 call!43091)))

(declare-fun bm!43087 () Bool)

(declare-fun call!43092 () List!21617)

(assert (=> bm!43087 (= call!43091 call!43092)))

(declare-fun b!1019482 () Bool)

(declare-fun call!43090 () List!21617)

(assert (=> b!1019482 (= e!573728 call!43090)))

(declare-fun b!1019483 () Bool)

(assert (=> b!1019483 (= e!573728 call!43090)))

(declare-fun bm!43088 () Bool)

(assert (=> bm!43088 (= call!43090 call!43091)))

(declare-fun b!1019484 () Bool)

(assert (=> b!1019484 (= e!573727 call!43092)))

(declare-fun c!103340 () Bool)

(declare-fun bm!43089 () Bool)

(declare-fun e!573725 () List!21617)

(assert (=> bm!43089 (= call!43092 ($colon$colon!589 e!573725 (ite c!103340 (h!22811 (t!30621 l!996)) (tuple2!15405 key!261 value!172))))))

(declare-fun c!103342 () Bool)

(assert (=> bm!43089 (= c!103342 c!103340)))

(declare-fun b!1019485 () Bool)

(assert (=> b!1019485 (= e!573725 (insertStrictlySorted!360 (t!30621 (t!30621 l!996)) key!261 value!172))))

(declare-fun lt!449679 () List!21617)

(declare-fun b!1019486 () Bool)

(declare-fun e!573726 () Bool)

(assert (=> b!1019486 (= e!573726 (contains!5908 lt!449679 (tuple2!15405 key!261 value!172)))))

(declare-fun b!1019487 () Bool)

(assert (=> b!1019487 (= e!573725 (ite c!103341 (t!30621 (t!30621 l!996)) (ite c!103339 (Cons!21613 (h!22811 (t!30621 l!996)) (t!30621 (t!30621 l!996))) Nil!21614)))))

(declare-fun b!1019481 () Bool)

(declare-fun res!683451 () Bool)

(assert (=> b!1019481 (=> (not res!683451) (not e!573726))))

(assert (=> b!1019481 (= res!683451 (containsKey!542 lt!449679 key!261))))

(declare-fun d!122059 () Bool)

(assert (=> d!122059 e!573726))

(declare-fun res!683450 () Bool)

(assert (=> d!122059 (=> (not res!683450) (not e!573726))))

(assert (=> d!122059 (= res!683450 (isStrictlySorted!682 lt!449679))))

(assert (=> d!122059 (= lt!449679 e!573727)))

(assert (=> d!122059 (= c!103340 (and ((_ is Cons!21613) (t!30621 l!996)) (bvslt (_1!7713 (h!22811 (t!30621 l!996))) key!261)))))

(assert (=> d!122059 (isStrictlySorted!682 (t!30621 l!996))))

(assert (=> d!122059 (= (insertStrictlySorted!360 (t!30621 l!996) key!261 value!172) lt!449679)))

(assert (= (and d!122059 c!103340) b!1019484))

(assert (= (and d!122059 (not c!103340)) b!1019478))

(assert (= (and b!1019478 c!103341) b!1019480))

(assert (= (and b!1019478 (not c!103341)) b!1019479))

(assert (= (and b!1019479 c!103339) b!1019482))

(assert (= (and b!1019479 (not c!103339)) b!1019483))

(assert (= (or b!1019482 b!1019483) bm!43088))

(assert (= (or b!1019480 bm!43088) bm!43087))

(assert (= (or b!1019484 bm!43087) bm!43089))

(assert (= (and bm!43089 c!103342) b!1019485))

(assert (= (and bm!43089 (not c!103342)) b!1019487))

(assert (= (and d!122059 res!683450) b!1019481))

(assert (= (and b!1019481 res!683451) b!1019486))

(declare-fun m!939779 () Bool)

(assert (=> bm!43089 m!939779))

(declare-fun m!939781 () Bool)

(assert (=> b!1019481 m!939781))

(declare-fun m!939783 () Bool)

(assert (=> d!122059 m!939783))

(assert (=> d!122059 m!939737))

(declare-fun m!939785 () Bool)

(assert (=> b!1019485 m!939785))

(declare-fun m!939787 () Bool)

(assert (=> b!1019486 m!939787))

(assert (=> b!1019387 d!122059))

(declare-fun d!122061 () Bool)

(declare-fun size!31158 (List!21617) Int)

(assert (=> d!122061 (= (length!45 (t!30621 l!996)) (size!31158 (t!30621 l!996)))))

(declare-fun bs!29687 () Bool)

(assert (= bs!29687 d!122061))

(declare-fun m!939789 () Bool)

(assert (=> bs!29687 m!939789))

(assert (=> b!1019387 d!122061))

(declare-fun d!122063 () Bool)

(assert (=> d!122063 (= (length!45 l!996) (size!31158 l!996))))

(declare-fun bs!29688 () Bool)

(assert (= bs!29688 d!122063))

(declare-fun m!939791 () Bool)

(assert (=> bs!29688 m!939791))

(assert (=> b!1019387 d!122063))

(declare-fun d!122065 () Bool)

(assert (=> d!122065 (= (length!45 lt!449667) (size!31158 lt!449667))))

(declare-fun bs!29689 () Bool)

(assert (= bs!29689 d!122065))

(declare-fun m!939793 () Bool)

(assert (=> bs!29689 m!939793))

(assert (=> b!1019387 d!122065))

(declare-fun d!122067 () Bool)

(assert (=> d!122067 (= (length!45 (insertStrictlySorted!360 (t!30621 l!996) key!261 value!172)) (length!45 (t!30621 l!996)))))

(declare-fun lt!449685 () Unit!33289)

(declare-fun choose!1676 (List!21617 (_ BitVec 64) B!1690) Unit!33289)

(assert (=> d!122067 (= lt!449685 (choose!1676 (t!30621 l!996) key!261 value!172))))

(assert (=> d!122067 (= (lemmaAddExistingKeyPreservesSize!5 (t!30621 l!996) key!261 value!172) lt!449685)))

(declare-fun bs!29692 () Bool)

(assert (= bs!29692 d!122067))

(assert (=> bs!29692 m!939721))

(assert (=> bs!29692 m!939721))

(assert (=> bs!29692 m!939723))

(assert (=> bs!29692 m!939731))

(declare-fun m!939809 () Bool)

(assert (=> bs!29692 m!939809))

(assert (=> b!1019387 d!122067))

(declare-fun d!122075 () Bool)

(assert (=> d!122075 (= (length!45 (insertStrictlySorted!360 (t!30621 l!996) key!261 value!172)) (size!31158 (insertStrictlySorted!360 (t!30621 l!996) key!261 value!172)))))

(declare-fun bs!29693 () Bool)

(assert (= bs!29693 d!122075))

(assert (=> bs!29693 m!939721))

(declare-fun m!939811 () Bool)

(assert (=> bs!29693 m!939811))

(assert (=> b!1019387 d!122075))

(declare-fun d!122077 () Bool)

(declare-fun res!683462 () Bool)

(declare-fun e!573747 () Bool)

(assert (=> d!122077 (=> res!683462 e!573747)))

(assert (=> d!122077 (= res!683462 (and ((_ is Cons!21613) l!996) (= (_1!7713 (h!22811 l!996)) key!261)))))

(assert (=> d!122077 (= (containsKey!542 l!996 key!261) e!573747)))

(declare-fun b!1019522 () Bool)

(declare-fun e!573748 () Bool)

(assert (=> b!1019522 (= e!573747 e!573748)))

(declare-fun res!683463 () Bool)

(assert (=> b!1019522 (=> (not res!683463) (not e!573748))))

(assert (=> b!1019522 (= res!683463 (and (or (not ((_ is Cons!21613) l!996)) (bvsle (_1!7713 (h!22811 l!996)) key!261)) ((_ is Cons!21613) l!996) (bvslt (_1!7713 (h!22811 l!996)) key!261)))))

(declare-fun b!1019523 () Bool)

(assert (=> b!1019523 (= e!573748 (containsKey!542 (t!30621 l!996) key!261))))

(assert (= (and d!122077 (not res!683462)) b!1019522))

(assert (= (and b!1019522 res!683463) b!1019523))

(assert (=> b!1019523 m!939739))

(assert (=> b!1019382 d!122077))

(declare-fun d!122079 () Bool)

(declare-fun res!683464 () Bool)

(declare-fun e!573749 () Bool)

(assert (=> d!122079 (=> res!683464 e!573749)))

(assert (=> d!122079 (= res!683464 (or ((_ is Nil!21614) l!996) ((_ is Nil!21614) (t!30621 l!996))))))

(assert (=> d!122079 (= (isStrictlySorted!682 l!996) e!573749)))

(declare-fun b!1019524 () Bool)

(declare-fun e!573750 () Bool)

(assert (=> b!1019524 (= e!573749 e!573750)))

(declare-fun res!683465 () Bool)

(assert (=> b!1019524 (=> (not res!683465) (not e!573750))))

(assert (=> b!1019524 (= res!683465 (bvslt (_1!7713 (h!22811 l!996)) (_1!7713 (h!22811 (t!30621 l!996)))))))

(declare-fun b!1019525 () Bool)

(assert (=> b!1019525 (= e!573750 (isStrictlySorted!682 (t!30621 l!996)))))

(assert (= (and d!122079 (not res!683464)) b!1019524))

(assert (= (and b!1019524 res!683465) b!1019525))

(assert (=> b!1019525 m!939737))

(assert (=> start!88758 d!122079))

(declare-fun b!1019540 () Bool)

(declare-fun e!573758 () Bool)

(declare-fun tp!71158 () Bool)

(assert (=> b!1019540 (= e!573758 (and tp_is_empty!23757 tp!71158))))

(assert (=> b!1019383 (= tp!71152 e!573758)))

(assert (= (and b!1019383 ((_ is Cons!21613) (t!30621 l!996))) b!1019540))

(check-sat (not b!1019411) (not b!1019417) (not b!1019485) (not d!122045) (not d!122063) (not d!122061) (not b!1019481) (not b!1019486) (not bm!43084) (not b!1019523) (not d!122059) (not d!122065) (not b!1019540) (not b!1019467) (not d!122075) (not b!1019472) tp_is_empty!23757 (not d!122067) (not bm!43089) (not b!1019525) (not b!1019471))
(check-sat)
(get-model)

(declare-fun d!122107 () Bool)

(declare-fun res!683490 () Bool)

(declare-fun e!573793 () Bool)

(assert (=> d!122107 (=> res!683490 e!573793)))

(assert (=> d!122107 (= res!683490 (or ((_ is Nil!21614) lt!449678) ((_ is Nil!21614) (t!30621 lt!449678))))))

(assert (=> d!122107 (= (isStrictlySorted!682 lt!449678) e!573793)))

(declare-fun b!1019589 () Bool)

(declare-fun e!573794 () Bool)

(assert (=> b!1019589 (= e!573793 e!573794)))

(declare-fun res!683491 () Bool)

(assert (=> b!1019589 (=> (not res!683491) (not e!573794))))

(assert (=> b!1019589 (= res!683491 (bvslt (_1!7713 (h!22811 lt!449678)) (_1!7713 (h!22811 (t!30621 lt!449678)))))))

(declare-fun b!1019590 () Bool)

(assert (=> b!1019590 (= e!573794 (isStrictlySorted!682 (t!30621 lt!449678)))))

(assert (= (and d!122107 (not res!683490)) b!1019589))

(assert (= (and b!1019589 res!683491) b!1019590))

(declare-fun m!939859 () Bool)

(assert (=> b!1019590 m!939859))

(assert (=> d!122045 d!122107))

(assert (=> d!122045 d!122079))

(declare-fun d!122109 () Bool)

(assert (=> d!122109 (= ($colon$colon!589 e!573725 (ite c!103340 (h!22811 (t!30621 l!996)) (tuple2!15405 key!261 value!172))) (Cons!21613 (ite c!103340 (h!22811 (t!30621 l!996)) (tuple2!15405 key!261 value!172)) e!573725))))

(assert (=> bm!43089 d!122109))

(declare-fun b!1019591 () Bool)

(declare-fun e!573797 () List!21617)

(declare-fun e!573799 () List!21617)

(assert (=> b!1019591 (= e!573797 e!573799)))

(declare-fun c!103369 () Bool)

(assert (=> b!1019591 (= c!103369 (and ((_ is Cons!21613) (t!30621 (t!30621 l!996))) (= (_1!7713 (h!22811 (t!30621 (t!30621 l!996)))) key!261)))))

(declare-fun b!1019592 () Bool)

(declare-fun c!103367 () Bool)

(assert (=> b!1019592 (= c!103367 (and ((_ is Cons!21613) (t!30621 (t!30621 l!996))) (bvsgt (_1!7713 (h!22811 (t!30621 (t!30621 l!996)))) key!261)))))

(declare-fun e!573798 () List!21617)

(assert (=> b!1019592 (= e!573799 e!573798)))

(declare-fun b!1019593 () Bool)

(declare-fun call!43112 () List!21617)

(assert (=> b!1019593 (= e!573799 call!43112)))

(declare-fun bm!43108 () Bool)

(declare-fun call!43113 () List!21617)

(assert (=> bm!43108 (= call!43112 call!43113)))

(declare-fun b!1019595 () Bool)

(declare-fun call!43111 () List!21617)

(assert (=> b!1019595 (= e!573798 call!43111)))

(declare-fun b!1019596 () Bool)

(assert (=> b!1019596 (= e!573798 call!43111)))

(declare-fun bm!43109 () Bool)

(assert (=> bm!43109 (= call!43111 call!43112)))

(declare-fun b!1019597 () Bool)

(assert (=> b!1019597 (= e!573797 call!43113)))

(declare-fun bm!43110 () Bool)

(declare-fun c!103368 () Bool)

(declare-fun e!573795 () List!21617)

(assert (=> bm!43110 (= call!43113 ($colon$colon!589 e!573795 (ite c!103368 (h!22811 (t!30621 (t!30621 l!996))) (tuple2!15405 key!261 value!172))))))

(declare-fun c!103370 () Bool)

(assert (=> bm!43110 (= c!103370 c!103368)))

(declare-fun b!1019598 () Bool)

(assert (=> b!1019598 (= e!573795 (insertStrictlySorted!360 (t!30621 (t!30621 (t!30621 l!996))) key!261 value!172))))

(declare-fun lt!449695 () List!21617)

(declare-fun b!1019599 () Bool)

(declare-fun e!573796 () Bool)

(assert (=> b!1019599 (= e!573796 (contains!5908 lt!449695 (tuple2!15405 key!261 value!172)))))

(declare-fun b!1019600 () Bool)

(assert (=> b!1019600 (= e!573795 (ite c!103369 (t!30621 (t!30621 (t!30621 l!996))) (ite c!103367 (Cons!21613 (h!22811 (t!30621 (t!30621 l!996))) (t!30621 (t!30621 (t!30621 l!996)))) Nil!21614)))))

(declare-fun b!1019594 () Bool)

(declare-fun res!683493 () Bool)

(assert (=> b!1019594 (=> (not res!683493) (not e!573796))))

(assert (=> b!1019594 (= res!683493 (containsKey!542 lt!449695 key!261))))

(declare-fun d!122111 () Bool)

(assert (=> d!122111 e!573796))

(declare-fun res!683492 () Bool)

(assert (=> d!122111 (=> (not res!683492) (not e!573796))))

(assert (=> d!122111 (= res!683492 (isStrictlySorted!682 lt!449695))))

(assert (=> d!122111 (= lt!449695 e!573797)))

(assert (=> d!122111 (= c!103368 (and ((_ is Cons!21613) (t!30621 (t!30621 l!996))) (bvslt (_1!7713 (h!22811 (t!30621 (t!30621 l!996)))) key!261)))))

(assert (=> d!122111 (isStrictlySorted!682 (t!30621 (t!30621 l!996)))))

(assert (=> d!122111 (= (insertStrictlySorted!360 (t!30621 (t!30621 l!996)) key!261 value!172) lt!449695)))

(assert (= (and d!122111 c!103368) b!1019597))

(assert (= (and d!122111 (not c!103368)) b!1019591))

(assert (= (and b!1019591 c!103369) b!1019593))

(assert (= (and b!1019591 (not c!103369)) b!1019592))

(assert (= (and b!1019592 c!103367) b!1019595))

(assert (= (and b!1019592 (not c!103367)) b!1019596))

(assert (= (or b!1019595 b!1019596) bm!43109))

(assert (= (or b!1019593 bm!43109) bm!43108))

(assert (= (or b!1019597 bm!43108) bm!43110))

(assert (= (and bm!43110 c!103370) b!1019598))

(assert (= (and bm!43110 (not c!103370)) b!1019600))

(assert (= (and d!122111 res!683492) b!1019594))

(assert (= (and b!1019594 res!683493) b!1019599))

(declare-fun m!939861 () Bool)

(assert (=> bm!43110 m!939861))

(declare-fun m!939863 () Bool)

(assert (=> b!1019594 m!939863))

(declare-fun m!939865 () Bool)

(assert (=> d!122111 m!939865))

(assert (=> d!122111 m!939765))

(declare-fun m!939867 () Bool)

(assert (=> b!1019598 m!939867))

(declare-fun m!939869 () Bool)

(assert (=> b!1019599 m!939869))

(assert (=> b!1019485 d!122111))

(declare-fun d!122113 () Bool)

(declare-fun lt!449698 () Int)

(assert (=> d!122113 (>= lt!449698 0)))

(declare-fun e!573802 () Int)

(assert (=> d!122113 (= lt!449698 e!573802)))

(declare-fun c!103373 () Bool)

(assert (=> d!122113 (= c!103373 ((_ is Nil!21614) lt!449667))))

(assert (=> d!122113 (= (size!31158 lt!449667) lt!449698)))

(declare-fun b!1019605 () Bool)

(assert (=> b!1019605 (= e!573802 0)))

(declare-fun b!1019606 () Bool)

(assert (=> b!1019606 (= e!573802 (+ 1 (size!31158 (t!30621 lt!449667))))))

(assert (= (and d!122113 c!103373) b!1019605))

(assert (= (and d!122113 (not c!103373)) b!1019606))

(declare-fun m!939871 () Bool)

(assert (=> b!1019606 m!939871))

(assert (=> d!122065 d!122113))

(declare-fun lt!449701 () Bool)

(declare-fun d!122115 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!488 (List!21617) (InoxSet tuple2!15404))

(assert (=> d!122115 (= lt!449701 (select (content!488 lt!449679) (tuple2!15405 key!261 value!172)))))

(declare-fun e!573807 () Bool)

(assert (=> d!122115 (= lt!449701 e!573807)))

(declare-fun res!683498 () Bool)

(assert (=> d!122115 (=> (not res!683498) (not e!573807))))

(assert (=> d!122115 (= res!683498 ((_ is Cons!21613) lt!449679))))

(assert (=> d!122115 (= (contains!5908 lt!449679 (tuple2!15405 key!261 value!172)) lt!449701)))

(declare-fun b!1019611 () Bool)

(declare-fun e!573808 () Bool)

(assert (=> b!1019611 (= e!573807 e!573808)))

(declare-fun res!683499 () Bool)

(assert (=> b!1019611 (=> res!683499 e!573808)))

(assert (=> b!1019611 (= res!683499 (= (h!22811 lt!449679) (tuple2!15405 key!261 value!172)))))

(declare-fun b!1019612 () Bool)

(assert (=> b!1019612 (= e!573808 (contains!5908 (t!30621 lt!449679) (tuple2!15405 key!261 value!172)))))

(assert (= (and d!122115 res!683498) b!1019611))

(assert (= (and b!1019611 (not res!683499)) b!1019612))

(declare-fun m!939873 () Bool)

(assert (=> d!122115 m!939873))

(declare-fun m!939875 () Bool)

(assert (=> d!122115 m!939875))

(declare-fun m!939877 () Bool)

(assert (=> b!1019612 m!939877))

(assert (=> b!1019486 d!122115))

(declare-fun d!122117 () Bool)

(assert (=> d!122117 (= ($colon$colon!589 e!573718 (ite c!103334 (h!22811 l!996) (tuple2!15405 key!261 value!172))) (Cons!21613 (ite c!103334 (h!22811 l!996) (tuple2!15405 key!261 value!172)) e!573718))))

(assert (=> bm!43084 d!122117))

(declare-fun d!122119 () Bool)

(declare-fun res!683500 () Bool)

(declare-fun e!573809 () Bool)

(assert (=> d!122119 (=> res!683500 e!573809)))

(assert (=> d!122119 (= res!683500 (and ((_ is Cons!21613) (t!30621 (t!30621 l!996))) (= (_1!7713 (h!22811 (t!30621 (t!30621 l!996)))) key!261)))))

(assert (=> d!122119 (= (containsKey!542 (t!30621 (t!30621 l!996)) key!261) e!573809)))

(declare-fun b!1019613 () Bool)

(declare-fun e!573810 () Bool)

(assert (=> b!1019613 (= e!573809 e!573810)))

(declare-fun res!683501 () Bool)

(assert (=> b!1019613 (=> (not res!683501) (not e!573810))))

(assert (=> b!1019613 (= res!683501 (and (or (not ((_ is Cons!21613) (t!30621 (t!30621 l!996)))) (bvsle (_1!7713 (h!22811 (t!30621 (t!30621 l!996)))) key!261)) ((_ is Cons!21613) (t!30621 (t!30621 l!996))) (bvslt (_1!7713 (h!22811 (t!30621 (t!30621 l!996)))) key!261)))))

(declare-fun b!1019614 () Bool)

(assert (=> b!1019614 (= e!573810 (containsKey!542 (t!30621 (t!30621 (t!30621 l!996))) key!261))))

(assert (= (and d!122119 (not res!683500)) b!1019613))

(assert (= (and b!1019613 res!683501) b!1019614))

(declare-fun m!939879 () Bool)

(assert (=> b!1019614 m!939879))

(assert (=> b!1019411 d!122119))

(assert (=> b!1019471 d!122059))

(assert (=> b!1019525 d!122043))

(declare-fun d!122121 () Bool)

(declare-fun res!683502 () Bool)

(declare-fun e!573811 () Bool)

(assert (=> d!122121 (=> res!683502 e!573811)))

(assert (=> d!122121 (= res!683502 (and ((_ is Cons!21613) lt!449679) (= (_1!7713 (h!22811 lt!449679)) key!261)))))

(assert (=> d!122121 (= (containsKey!542 lt!449679 key!261) e!573811)))

(declare-fun b!1019615 () Bool)

(declare-fun e!573812 () Bool)

(assert (=> b!1019615 (= e!573811 e!573812)))

(declare-fun res!683503 () Bool)

(assert (=> b!1019615 (=> (not res!683503) (not e!573812))))

(assert (=> b!1019615 (= res!683503 (and (or (not ((_ is Cons!21613) lt!449679)) (bvsle (_1!7713 (h!22811 lt!449679)) key!261)) ((_ is Cons!21613) lt!449679) (bvslt (_1!7713 (h!22811 lt!449679)) key!261)))))

(declare-fun b!1019616 () Bool)

(assert (=> b!1019616 (= e!573812 (containsKey!542 (t!30621 lt!449679) key!261))))

(assert (= (and d!122121 (not res!683502)) b!1019615))

(assert (= (and b!1019615 res!683503) b!1019616))

(declare-fun m!939881 () Bool)

(assert (=> b!1019616 m!939881))

(assert (=> b!1019481 d!122121))

(declare-fun lt!449702 () Bool)

(declare-fun d!122123 () Bool)

(assert (=> d!122123 (= lt!449702 (select (content!488 lt!449678) (tuple2!15405 key!261 value!172)))))

(declare-fun e!573813 () Bool)

(assert (=> d!122123 (= lt!449702 e!573813)))

(declare-fun res!683504 () Bool)

(assert (=> d!122123 (=> (not res!683504) (not e!573813))))

(assert (=> d!122123 (= res!683504 ((_ is Cons!21613) lt!449678))))

(assert (=> d!122123 (= (contains!5908 lt!449678 (tuple2!15405 key!261 value!172)) lt!449702)))

(declare-fun b!1019617 () Bool)

(declare-fun e!573814 () Bool)

(assert (=> b!1019617 (= e!573813 e!573814)))

(declare-fun res!683505 () Bool)

(assert (=> b!1019617 (=> res!683505 e!573814)))

(assert (=> b!1019617 (= res!683505 (= (h!22811 lt!449678) (tuple2!15405 key!261 value!172)))))

(declare-fun b!1019618 () Bool)

(assert (=> b!1019618 (= e!573814 (contains!5908 (t!30621 lt!449678) (tuple2!15405 key!261 value!172)))))

(assert (= (and d!122123 res!683504) b!1019617))

(assert (= (and b!1019617 (not res!683505)) b!1019618))

(declare-fun m!939883 () Bool)

(assert (=> d!122123 m!939883))

(declare-fun m!939885 () Bool)

(assert (=> d!122123 m!939885))

(declare-fun m!939887 () Bool)

(assert (=> b!1019618 m!939887))

(assert (=> b!1019472 d!122123))

(declare-fun d!122125 () Bool)

(declare-fun lt!449703 () Int)

(assert (=> d!122125 (>= lt!449703 0)))

(declare-fun e!573815 () Int)

(assert (=> d!122125 (= lt!449703 e!573815)))

(declare-fun c!103374 () Bool)

(assert (=> d!122125 (= c!103374 ((_ is Nil!21614) (insertStrictlySorted!360 (t!30621 l!996) key!261 value!172)))))

(assert (=> d!122125 (= (size!31158 (insertStrictlySorted!360 (t!30621 l!996) key!261 value!172)) lt!449703)))

(declare-fun b!1019619 () Bool)

(assert (=> b!1019619 (= e!573815 0)))

(declare-fun b!1019620 () Bool)

(assert (=> b!1019620 (= e!573815 (+ 1 (size!31158 (t!30621 (insertStrictlySorted!360 (t!30621 l!996) key!261 value!172)))))))

(assert (= (and d!122125 c!103374) b!1019619))

(assert (= (and d!122125 (not c!103374)) b!1019620))

(declare-fun m!939889 () Bool)

(assert (=> b!1019620 m!939889))

(assert (=> d!122075 d!122125))

(declare-fun d!122127 () Bool)

(declare-fun res!683506 () Bool)

(declare-fun e!573816 () Bool)

(assert (=> d!122127 (=> res!683506 e!573816)))

(assert (=> d!122127 (= res!683506 (or ((_ is Nil!21614) lt!449679) ((_ is Nil!21614) (t!30621 lt!449679))))))

(assert (=> d!122127 (= (isStrictlySorted!682 lt!449679) e!573816)))

(declare-fun b!1019621 () Bool)

(declare-fun e!573817 () Bool)

(assert (=> b!1019621 (= e!573816 e!573817)))

(declare-fun res!683507 () Bool)

(assert (=> b!1019621 (=> (not res!683507) (not e!573817))))

(assert (=> b!1019621 (= res!683507 (bvslt (_1!7713 (h!22811 lt!449679)) (_1!7713 (h!22811 (t!30621 lt!449679)))))))

(declare-fun b!1019622 () Bool)

(assert (=> b!1019622 (= e!573817 (isStrictlySorted!682 (t!30621 lt!449679)))))

(assert (= (and d!122127 (not res!683506)) b!1019621))

(assert (= (and b!1019621 res!683507) b!1019622))

(declare-fun m!939891 () Bool)

(assert (=> b!1019622 m!939891))

(assert (=> d!122059 d!122127))

(assert (=> d!122059 d!122043))

(declare-fun d!122129 () Bool)

(declare-fun res!683508 () Bool)

(declare-fun e!573818 () Bool)

(assert (=> d!122129 (=> res!683508 e!573818)))

(assert (=> d!122129 (= res!683508 (or ((_ is Nil!21614) (t!30621 (t!30621 l!996))) ((_ is Nil!21614) (t!30621 (t!30621 (t!30621 l!996))))))))

(assert (=> d!122129 (= (isStrictlySorted!682 (t!30621 (t!30621 l!996))) e!573818)))

(declare-fun b!1019623 () Bool)

(declare-fun e!573819 () Bool)

(assert (=> b!1019623 (= e!573818 e!573819)))

(declare-fun res!683509 () Bool)

(assert (=> b!1019623 (=> (not res!683509) (not e!573819))))

(assert (=> b!1019623 (= res!683509 (bvslt (_1!7713 (h!22811 (t!30621 (t!30621 l!996)))) (_1!7713 (h!22811 (t!30621 (t!30621 (t!30621 l!996)))))))))

(declare-fun b!1019624 () Bool)

(assert (=> b!1019624 (= e!573819 (isStrictlySorted!682 (t!30621 (t!30621 (t!30621 l!996)))))))

(assert (= (and d!122129 (not res!683508)) b!1019623))

(assert (= (and b!1019623 res!683509) b!1019624))

(declare-fun m!939893 () Bool)

(assert (=> b!1019624 m!939893))

(assert (=> b!1019417 d!122129))

(declare-fun d!122131 () Bool)

(declare-fun lt!449704 () Int)

(assert (=> d!122131 (>= lt!449704 0)))

(declare-fun e!573820 () Int)

(assert (=> d!122131 (= lt!449704 e!573820)))

(declare-fun c!103375 () Bool)

(assert (=> d!122131 (= c!103375 ((_ is Nil!21614) (t!30621 l!996)))))

(assert (=> d!122131 (= (size!31158 (t!30621 l!996)) lt!449704)))

(declare-fun b!1019625 () Bool)

(assert (=> b!1019625 (= e!573820 0)))

(declare-fun b!1019626 () Bool)

(assert (=> b!1019626 (= e!573820 (+ 1 (size!31158 (t!30621 (t!30621 l!996)))))))

(assert (= (and d!122131 c!103375) b!1019625))

(assert (= (and d!122131 (not c!103375)) b!1019626))

(declare-fun m!939895 () Bool)

(assert (=> b!1019626 m!939895))

(assert (=> d!122061 d!122131))

(assert (=> b!1019523 d!122041))

(assert (=> d!122067 d!122075))

(assert (=> d!122067 d!122059))

(assert (=> d!122067 d!122061))

(declare-fun d!122133 () Bool)

(assert (=> d!122133 (= (length!45 (insertStrictlySorted!360 (t!30621 l!996) key!261 value!172)) (length!45 (t!30621 l!996)))))

(assert (=> d!122133 true))

(declare-fun _$10!25 () Unit!33289)

(assert (=> d!122133 (= (choose!1676 (t!30621 l!996) key!261 value!172) _$10!25)))

(declare-fun bs!29701 () Bool)

(assert (= bs!29701 d!122133))

(assert (=> bs!29701 m!939721))

(assert (=> bs!29701 m!939721))

(assert (=> bs!29701 m!939723))

(assert (=> bs!29701 m!939731))

(assert (=> d!122067 d!122133))

(declare-fun d!122135 () Bool)

(declare-fun lt!449705 () Int)

(assert (=> d!122135 (>= lt!449705 0)))

(declare-fun e!573821 () Int)

(assert (=> d!122135 (= lt!449705 e!573821)))

(declare-fun c!103376 () Bool)

(assert (=> d!122135 (= c!103376 ((_ is Nil!21614) l!996))))

(assert (=> d!122135 (= (size!31158 l!996) lt!449705)))

(declare-fun b!1019627 () Bool)

(assert (=> b!1019627 (= e!573821 0)))

(declare-fun b!1019628 () Bool)

(assert (=> b!1019628 (= e!573821 (+ 1 (size!31158 (t!30621 l!996))))))

(assert (= (and d!122135 c!103376) b!1019627))

(assert (= (and d!122135 (not c!103376)) b!1019628))

(assert (=> b!1019628 m!939789))

(assert (=> d!122063 d!122135))

(declare-fun d!122137 () Bool)

(declare-fun res!683510 () Bool)

(declare-fun e!573822 () Bool)

(assert (=> d!122137 (=> res!683510 e!573822)))

(assert (=> d!122137 (= res!683510 (and ((_ is Cons!21613) lt!449678) (= (_1!7713 (h!22811 lt!449678)) key!261)))))

(assert (=> d!122137 (= (containsKey!542 lt!449678 key!261) e!573822)))

(declare-fun b!1019629 () Bool)

(declare-fun e!573823 () Bool)

(assert (=> b!1019629 (= e!573822 e!573823)))

(declare-fun res!683511 () Bool)

(assert (=> b!1019629 (=> (not res!683511) (not e!573823))))

(assert (=> b!1019629 (= res!683511 (and (or (not ((_ is Cons!21613) lt!449678)) (bvsle (_1!7713 (h!22811 lt!449678)) key!261)) ((_ is Cons!21613) lt!449678) (bvslt (_1!7713 (h!22811 lt!449678)) key!261)))))

(declare-fun b!1019630 () Bool)

(assert (=> b!1019630 (= e!573823 (containsKey!542 (t!30621 lt!449678) key!261))))

(assert (= (and d!122137 (not res!683510)) b!1019629))

(assert (= (and b!1019629 res!683511) b!1019630))

(declare-fun m!939897 () Bool)

(assert (=> b!1019630 m!939897))

(assert (=> b!1019467 d!122137))

(declare-fun b!1019631 () Bool)

(declare-fun e!573824 () Bool)

(declare-fun tp!71165 () Bool)

(assert (=> b!1019631 (= e!573824 (and tp_is_empty!23757 tp!71165))))

(assert (=> b!1019540 (= tp!71158 e!573824)))

(assert (= (and b!1019540 ((_ is Cons!21613) (t!30621 (t!30621 l!996)))) b!1019631))

(check-sat (not b!1019618) tp_is_empty!23757 (not b!1019606) (not b!1019599) (not b!1019594) (not b!1019624) (not b!1019616) (not d!122115) (not b!1019626) (not b!1019612) (not b!1019622) (not b!1019630) (not bm!43110) (not d!122123) (not b!1019598) (not d!122111) (not d!122133) (not b!1019620) (not b!1019590) (not b!1019628) (not b!1019614) (not b!1019631))
(check-sat)
