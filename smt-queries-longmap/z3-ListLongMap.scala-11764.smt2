; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138078 () Bool)

(assert start!138078)

(declare-fun b!1584503 () Bool)

(declare-fun res!1082275 () Bool)

(declare-fun e!884530 () Bool)

(assert (=> b!1584503 (=> (not res!1082275) (not e!884530))))

(declare-fun newKey!123 () (_ BitVec 64))

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-datatypes ((B!2926 0))(
  ( (B!2927 (val!19825 Int)) )
))
(declare-datatypes ((tuple2!25818 0))(
  ( (tuple2!25819 (_1!12920 (_ BitVec 64)) (_2!12920 B!2926)) )
))
(declare-datatypes ((List!36945 0))(
  ( (Nil!36942) (Cons!36941 (h!38484 tuple2!25818) (t!51859 List!36945)) )
))
(declare-fun l!1251 () List!36945)

(get-info :version)

(assert (=> b!1584503 (= res!1082275 (and (not (= otherKey!56 newKey!123)) ((_ is Cons!36941) l!1251)))))

(declare-fun b!1584504 () Bool)

(declare-fun e!884529 () Bool)

(declare-fun tp_is_empty!39459 () Bool)

(declare-fun tp!115123 () Bool)

(assert (=> b!1584504 (= e!884529 (and tp_is_empty!39459 tp!115123))))

(declare-fun b!1584505 () Bool)

(declare-fun res!1082277 () Bool)

(assert (=> b!1584505 (=> (not res!1082277) (not e!884530))))

(declare-fun containsKey!1004 (List!36945 (_ BitVec 64)) Bool)

(assert (=> b!1584505 (= res!1082277 (not (containsKey!1004 l!1251 otherKey!56)))))

(declare-fun b!1584506 () Bool)

(declare-fun res!1082279 () Bool)

(assert (=> b!1584506 (=> (not res!1082279) (not e!884530))))

(declare-fun isStrictlySorted!1170 (List!36945) Bool)

(assert (=> b!1584506 (= res!1082279 (isStrictlySorted!1170 (t!51859 l!1251)))))

(declare-fun res!1082278 () Bool)

(assert (=> start!138078 (=> (not res!1082278) (not e!884530))))

(assert (=> start!138078 (= res!1082278 (isStrictlySorted!1170 l!1251))))

(assert (=> start!138078 e!884530))

(assert (=> start!138078 e!884529))

(assert (=> start!138078 true))

(assert (=> start!138078 tp_is_empty!39459))

(declare-fun b!1584507 () Bool)

(declare-fun newValue!123 () B!2926)

(declare-fun insertStrictlySorted!627 (List!36945 (_ BitVec 64) B!2926) List!36945)

(assert (=> b!1584507 (= e!884530 (not (not (containsKey!1004 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123) otherKey!56))))))

(assert (=> b!1584507 (not (containsKey!1004 (insertStrictlySorted!627 (t!51859 l!1251) newKey!123 newValue!123) otherKey!56))))

(declare-datatypes ((Unit!52299 0))(
  ( (Unit!52300) )
))
(declare-fun lt!677262 () Unit!52299)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!11 (List!36945 (_ BitVec 64) B!2926 (_ BitVec 64)) Unit!52299)

(assert (=> b!1584507 (= lt!677262 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!11 (t!51859 l!1251) newKey!123 newValue!123 otherKey!56))))

(declare-fun b!1584508 () Bool)

(declare-fun res!1082276 () Bool)

(assert (=> b!1584508 (=> (not res!1082276) (not e!884530))))

(assert (=> b!1584508 (= res!1082276 (not (containsKey!1004 (t!51859 l!1251) otherKey!56)))))

(assert (= (and start!138078 res!1082278) b!1584505))

(assert (= (and b!1584505 res!1082277) b!1584503))

(assert (= (and b!1584503 res!1082275) b!1584506))

(assert (= (and b!1584506 res!1082279) b!1584508))

(assert (= (and b!1584508 res!1082276) b!1584507))

(assert (= (and start!138078 ((_ is Cons!36941) l!1251)) b!1584504))

(declare-fun m!1453757 () Bool)

(assert (=> b!1584507 m!1453757))

(declare-fun m!1453759 () Bool)

(assert (=> b!1584507 m!1453759))

(declare-fun m!1453761 () Bool)

(assert (=> b!1584507 m!1453761))

(declare-fun m!1453763 () Bool)

(assert (=> b!1584507 m!1453763))

(assert (=> b!1584507 m!1453759))

(declare-fun m!1453765 () Bool)

(assert (=> b!1584507 m!1453765))

(assert (=> b!1584507 m!1453761))

(declare-fun m!1453767 () Bool)

(assert (=> start!138078 m!1453767))

(declare-fun m!1453769 () Bool)

(assert (=> b!1584506 m!1453769))

(declare-fun m!1453771 () Bool)

(assert (=> b!1584505 m!1453771))

(declare-fun m!1453773 () Bool)

(assert (=> b!1584508 m!1453773))

(check-sat (not b!1584508) (not b!1584505) (not b!1584506) (not b!1584504) tp_is_empty!39459 (not b!1584507) (not start!138078))
(check-sat)
(get-model)

(declare-fun d!167439 () Bool)

(declare-fun res!1082305 () Bool)

(declare-fun e!884547 () Bool)

(assert (=> d!167439 (=> res!1082305 e!884547)))

(assert (=> d!167439 (= res!1082305 (and ((_ is Cons!36941) (t!51859 l!1251)) (= (_1!12920 (h!38484 (t!51859 l!1251))) otherKey!56)))))

(assert (=> d!167439 (= (containsKey!1004 (t!51859 l!1251) otherKey!56) e!884547)))

(declare-fun b!1584537 () Bool)

(declare-fun e!884548 () Bool)

(assert (=> b!1584537 (= e!884547 e!884548)))

(declare-fun res!1082306 () Bool)

(assert (=> b!1584537 (=> (not res!1082306) (not e!884548))))

(assert (=> b!1584537 (= res!1082306 (and (or (not ((_ is Cons!36941) (t!51859 l!1251))) (bvsle (_1!12920 (h!38484 (t!51859 l!1251))) otherKey!56)) ((_ is Cons!36941) (t!51859 l!1251)) (bvslt (_1!12920 (h!38484 (t!51859 l!1251))) otherKey!56)))))

(declare-fun b!1584538 () Bool)

(assert (=> b!1584538 (= e!884548 (containsKey!1004 (t!51859 (t!51859 l!1251)) otherKey!56))))

(assert (= (and d!167439 (not res!1082305)) b!1584537))

(assert (= (and b!1584537 res!1082306) b!1584538))

(declare-fun m!1453795 () Bool)

(assert (=> b!1584538 m!1453795))

(assert (=> b!1584508 d!167439))

(declare-fun d!167449 () Bool)

(declare-fun res!1082317 () Bool)

(declare-fun e!884565 () Bool)

(assert (=> d!167449 (=> res!1082317 e!884565)))

(assert (=> d!167449 (= res!1082317 (or ((_ is Nil!36942) l!1251) ((_ is Nil!36942) (t!51859 l!1251))))))

(assert (=> d!167449 (= (isStrictlySorted!1170 l!1251) e!884565)))

(declare-fun b!1584561 () Bool)

(declare-fun e!884566 () Bool)

(assert (=> b!1584561 (= e!884565 e!884566)))

(declare-fun res!1082318 () Bool)

(assert (=> b!1584561 (=> (not res!1082318) (not e!884566))))

(assert (=> b!1584561 (= res!1082318 (bvslt (_1!12920 (h!38484 l!1251)) (_1!12920 (h!38484 (t!51859 l!1251)))))))

(declare-fun b!1584562 () Bool)

(assert (=> b!1584562 (= e!884566 (isStrictlySorted!1170 (t!51859 l!1251)))))

(assert (= (and d!167449 (not res!1082317)) b!1584561))

(assert (= (and b!1584561 res!1082318) b!1584562))

(assert (=> b!1584562 m!1453769))

(assert (=> start!138078 d!167449))

(declare-fun d!167451 () Bool)

(declare-fun res!1082319 () Bool)

(declare-fun e!884567 () Bool)

(assert (=> d!167451 (=> res!1082319 e!884567)))

(assert (=> d!167451 (= res!1082319 (and ((_ is Cons!36941) l!1251) (= (_1!12920 (h!38484 l!1251)) otherKey!56)))))

(assert (=> d!167451 (= (containsKey!1004 l!1251 otherKey!56) e!884567)))

(declare-fun b!1584563 () Bool)

(declare-fun e!884568 () Bool)

(assert (=> b!1584563 (= e!884567 e!884568)))

(declare-fun res!1082320 () Bool)

(assert (=> b!1584563 (=> (not res!1082320) (not e!884568))))

(assert (=> b!1584563 (= res!1082320 (and (or (not ((_ is Cons!36941) l!1251)) (bvsle (_1!12920 (h!38484 l!1251)) otherKey!56)) ((_ is Cons!36941) l!1251) (bvslt (_1!12920 (h!38484 l!1251)) otherKey!56)))))

(declare-fun b!1584564 () Bool)

(assert (=> b!1584564 (= e!884568 (containsKey!1004 (t!51859 l!1251) otherKey!56))))

(assert (= (and d!167451 (not res!1082319)) b!1584563))

(assert (= (and b!1584563 res!1082320) b!1584564))

(assert (=> b!1584564 m!1453773))

(assert (=> b!1584505 d!167451))

(declare-fun d!167455 () Bool)

(declare-fun res!1082325 () Bool)

(declare-fun e!884573 () Bool)

(assert (=> d!167455 (=> res!1082325 e!884573)))

(assert (=> d!167455 (= res!1082325 (or ((_ is Nil!36942) (t!51859 l!1251)) ((_ is Nil!36942) (t!51859 (t!51859 l!1251)))))))

(assert (=> d!167455 (= (isStrictlySorted!1170 (t!51859 l!1251)) e!884573)))

(declare-fun b!1584569 () Bool)

(declare-fun e!884574 () Bool)

(assert (=> b!1584569 (= e!884573 e!884574)))

(declare-fun res!1082326 () Bool)

(assert (=> b!1584569 (=> (not res!1082326) (not e!884574))))

(assert (=> b!1584569 (= res!1082326 (bvslt (_1!12920 (h!38484 (t!51859 l!1251))) (_1!12920 (h!38484 (t!51859 (t!51859 l!1251))))))))

(declare-fun b!1584570 () Bool)

(assert (=> b!1584570 (= e!884574 (isStrictlySorted!1170 (t!51859 (t!51859 l!1251))))))

(assert (= (and d!167455 (not res!1082325)) b!1584569))

(assert (= (and b!1584569 res!1082326) b!1584570))

(declare-fun m!1453799 () Bool)

(assert (=> b!1584570 m!1453799))

(assert (=> b!1584506 d!167455))

(declare-fun e!884639 () List!36945)

(declare-fun c!146892 () Bool)

(declare-fun b!1584670 () Bool)

(declare-fun c!146888 () Bool)

(assert (=> b!1584670 (= e!884639 (ite c!146888 (t!51859 l!1251) (ite c!146892 (Cons!36941 (h!38484 l!1251) (t!51859 l!1251)) Nil!36942)))))

(declare-fun d!167457 () Bool)

(declare-fun e!884636 () Bool)

(assert (=> d!167457 e!884636))

(declare-fun res!1082370 () Bool)

(assert (=> d!167457 (=> (not res!1082370) (not e!884636))))

(declare-fun lt!677277 () List!36945)

(assert (=> d!167457 (= res!1082370 (isStrictlySorted!1170 lt!677277))))

(declare-fun e!884637 () List!36945)

(assert (=> d!167457 (= lt!677277 e!884637)))

(declare-fun c!146889 () Bool)

(assert (=> d!167457 (= c!146889 (and ((_ is Cons!36941) l!1251) (bvslt (_1!12920 (h!38484 l!1251)) newKey!123)))))

(assert (=> d!167457 (isStrictlySorted!1170 l!1251)))

(assert (=> d!167457 (= (insertStrictlySorted!627 l!1251 newKey!123 newValue!123) lt!677277)))

(declare-fun bm!72564 () Bool)

(declare-fun call!72568 () List!36945)

(declare-fun call!72569 () List!36945)

(assert (=> bm!72564 (= call!72568 call!72569)))

(declare-fun b!1584671 () Bool)

(declare-fun contains!10527 (List!36945 tuple2!25818) Bool)

(assert (=> b!1584671 (= e!884636 (contains!10527 lt!677277 (tuple2!25819 newKey!123 newValue!123)))))

(declare-fun b!1584672 () Bool)

(declare-fun call!72567 () List!36945)

(assert (=> b!1584672 (= e!884637 call!72567)))

(declare-fun b!1584673 () Bool)

(assert (=> b!1584673 (= e!884639 (insertStrictlySorted!627 (t!51859 l!1251) newKey!123 newValue!123))))

(declare-fun bm!72565 () Bool)

(declare-fun $colon$colon!1023 (List!36945 tuple2!25818) List!36945)

(assert (=> bm!72565 (= call!72567 ($colon$colon!1023 e!884639 (ite c!146889 (h!38484 l!1251) (tuple2!25819 newKey!123 newValue!123))))))

(declare-fun c!146891 () Bool)

(assert (=> bm!72565 (= c!146891 c!146889)))

(declare-fun b!1584674 () Bool)

(declare-fun e!884635 () List!36945)

(assert (=> b!1584674 (= e!884635 call!72568)))

(declare-fun b!1584675 () Bool)

(declare-fun e!884638 () List!36945)

(assert (=> b!1584675 (= e!884638 call!72569)))

(declare-fun b!1584676 () Bool)

(assert (=> b!1584676 (= e!884637 e!884638)))

(assert (=> b!1584676 (= c!146888 (and ((_ is Cons!36941) l!1251) (= (_1!12920 (h!38484 l!1251)) newKey!123)))))

(declare-fun bm!72566 () Bool)

(assert (=> bm!72566 (= call!72569 call!72567)))

(declare-fun b!1584677 () Bool)

(assert (=> b!1584677 (= c!146892 (and ((_ is Cons!36941) l!1251) (bvsgt (_1!12920 (h!38484 l!1251)) newKey!123)))))

(assert (=> b!1584677 (= e!884638 e!884635)))

(declare-fun b!1584678 () Bool)

(assert (=> b!1584678 (= e!884635 call!72568)))

(declare-fun b!1584679 () Bool)

(declare-fun res!1082369 () Bool)

(assert (=> b!1584679 (=> (not res!1082369) (not e!884636))))

(assert (=> b!1584679 (= res!1082369 (containsKey!1004 lt!677277 newKey!123))))

(assert (= (and d!167457 c!146889) b!1584672))

(assert (= (and d!167457 (not c!146889)) b!1584676))

(assert (= (and b!1584676 c!146888) b!1584675))

(assert (= (and b!1584676 (not c!146888)) b!1584677))

(assert (= (and b!1584677 c!146892) b!1584678))

(assert (= (and b!1584677 (not c!146892)) b!1584674))

(assert (= (or b!1584678 b!1584674) bm!72564))

(assert (= (or b!1584675 bm!72564) bm!72566))

(assert (= (or b!1584672 bm!72566) bm!72565))

(assert (= (and bm!72565 c!146891) b!1584673))

(assert (= (and bm!72565 (not c!146891)) b!1584670))

(assert (= (and d!167457 res!1082370) b!1584679))

(assert (= (and b!1584679 res!1082369) b!1584671))

(declare-fun m!1453830 () Bool)

(assert (=> d!167457 m!1453830))

(assert (=> d!167457 m!1453767))

(declare-fun m!1453835 () Bool)

(assert (=> b!1584671 m!1453835))

(declare-fun m!1453839 () Bool)

(assert (=> bm!72565 m!1453839))

(declare-fun m!1453841 () Bool)

(assert (=> b!1584679 m!1453841))

(assert (=> b!1584673 m!1453759))

(assert (=> b!1584507 d!167457))

(declare-fun b!1584690 () Bool)

(declare-fun e!884652 () List!36945)

(declare-fun c!146903 () Bool)

(declare-fun c!146896 () Bool)

(assert (=> b!1584690 (= e!884652 (ite c!146896 (t!51859 (t!51859 l!1251)) (ite c!146903 (Cons!36941 (h!38484 (t!51859 l!1251)) (t!51859 (t!51859 l!1251))) Nil!36942)))))

(declare-fun d!167479 () Bool)

(declare-fun e!884647 () Bool)

(assert (=> d!167479 e!884647))

(declare-fun res!1082374 () Bool)

(assert (=> d!167479 (=> (not res!1082374) (not e!884647))))

(declare-fun lt!677280 () List!36945)

(assert (=> d!167479 (= res!1082374 (isStrictlySorted!1170 lt!677280))))

(declare-fun e!884648 () List!36945)

(assert (=> d!167479 (= lt!677280 e!884648)))

(declare-fun c!146900 () Bool)

(assert (=> d!167479 (= c!146900 (and ((_ is Cons!36941) (t!51859 l!1251)) (bvslt (_1!12920 (h!38484 (t!51859 l!1251))) newKey!123)))))

(assert (=> d!167479 (isStrictlySorted!1170 (t!51859 l!1251))))

(assert (=> d!167479 (= (insertStrictlySorted!627 (t!51859 l!1251) newKey!123 newValue!123) lt!677280)))

(declare-fun bm!72570 () Bool)

(declare-fun call!72576 () List!36945)

(declare-fun call!72577 () List!36945)

(assert (=> bm!72570 (= call!72576 call!72577)))

(declare-fun b!1584691 () Bool)

(assert (=> b!1584691 (= e!884647 (contains!10527 lt!677280 (tuple2!25819 newKey!123 newValue!123)))))

(declare-fun b!1584693 () Bool)

(declare-fun call!72574 () List!36945)

(assert (=> b!1584693 (= e!884648 call!72574)))

(declare-fun b!1584695 () Bool)

(assert (=> b!1584695 (= e!884652 (insertStrictlySorted!627 (t!51859 (t!51859 l!1251)) newKey!123 newValue!123))))

(declare-fun bm!72572 () Bool)

(assert (=> bm!72572 (= call!72574 ($colon$colon!1023 e!884652 (ite c!146900 (h!38484 (t!51859 l!1251)) (tuple2!25819 newKey!123 newValue!123))))))

(declare-fun c!146902 () Bool)

(assert (=> bm!72572 (= c!146902 c!146900)))

(declare-fun b!1584697 () Bool)

(declare-fun e!884645 () List!36945)

(assert (=> b!1584697 (= e!884645 call!72576)))

(declare-fun b!1584699 () Bool)

(declare-fun e!884650 () List!36945)

(assert (=> b!1584699 (= e!884650 call!72577)))

(declare-fun b!1584701 () Bool)

(assert (=> b!1584701 (= e!884648 e!884650)))

(assert (=> b!1584701 (= c!146896 (and ((_ is Cons!36941) (t!51859 l!1251)) (= (_1!12920 (h!38484 (t!51859 l!1251))) newKey!123)))))

(declare-fun bm!72573 () Bool)

(assert (=> bm!72573 (= call!72577 call!72574)))

(declare-fun b!1584704 () Bool)

(assert (=> b!1584704 (= c!146903 (and ((_ is Cons!36941) (t!51859 l!1251)) (bvsgt (_1!12920 (h!38484 (t!51859 l!1251))) newKey!123)))))

(assert (=> b!1584704 (= e!884650 e!884645)))

(declare-fun b!1584706 () Bool)

(assert (=> b!1584706 (= e!884645 call!72576)))

(declare-fun b!1584707 () Bool)

(declare-fun res!1082373 () Bool)

(assert (=> b!1584707 (=> (not res!1082373) (not e!884647))))

(assert (=> b!1584707 (= res!1082373 (containsKey!1004 lt!677280 newKey!123))))

(assert (= (and d!167479 c!146900) b!1584693))

(assert (= (and d!167479 (not c!146900)) b!1584701))

(assert (= (and b!1584701 c!146896) b!1584699))

(assert (= (and b!1584701 (not c!146896)) b!1584704))

(assert (= (and b!1584704 c!146903) b!1584706))

(assert (= (and b!1584704 (not c!146903)) b!1584697))

(assert (= (or b!1584706 b!1584697) bm!72570))

(assert (= (or b!1584699 bm!72570) bm!72573))

(assert (= (or b!1584693 bm!72573) bm!72572))

(assert (= (and bm!72572 c!146902) b!1584695))

(assert (= (and bm!72572 (not c!146902)) b!1584690))

(assert (= (and d!167479 res!1082374) b!1584707))

(assert (= (and b!1584707 res!1082373) b!1584691))

(declare-fun m!1453846 () Bool)

(assert (=> d!167479 m!1453846))

(assert (=> d!167479 m!1453769))

(declare-fun m!1453851 () Bool)

(assert (=> b!1584691 m!1453851))

(declare-fun m!1453856 () Bool)

(assert (=> bm!72572 m!1453856))

(declare-fun m!1453859 () Bool)

(assert (=> b!1584707 m!1453859))

(declare-fun m!1453863 () Bool)

(assert (=> b!1584695 m!1453863))

(assert (=> b!1584507 d!167479))

(declare-fun d!167482 () Bool)

(assert (=> d!167482 (not (containsKey!1004 (insertStrictlySorted!627 (t!51859 l!1251) newKey!123 newValue!123) otherKey!56))))

(declare-fun lt!677286 () Unit!52299)

(declare-fun choose!2111 (List!36945 (_ BitVec 64) B!2926 (_ BitVec 64)) Unit!52299)

(assert (=> d!167482 (= lt!677286 (choose!2111 (t!51859 l!1251) newKey!123 newValue!123 otherKey!56))))

(declare-fun e!884660 () Bool)

(assert (=> d!167482 e!884660))

(declare-fun res!1082386 () Bool)

(assert (=> d!167482 (=> (not res!1082386) (not e!884660))))

(assert (=> d!167482 (= res!1082386 (isStrictlySorted!1170 (t!51859 l!1251)))))

(assert (=> d!167482 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!11 (t!51859 l!1251) newKey!123 newValue!123 otherKey!56) lt!677286)))

(declare-fun b!1584719 () Bool)

(declare-fun res!1082388 () Bool)

(assert (=> b!1584719 (=> (not res!1082388) (not e!884660))))

(assert (=> b!1584719 (= res!1082388 (not (containsKey!1004 (t!51859 l!1251) otherKey!56)))))

(declare-fun b!1584721 () Bool)

(assert (=> b!1584721 (= e!884660 (not (= otherKey!56 newKey!123)))))

(assert (= (and d!167482 res!1082386) b!1584719))

(assert (= (and b!1584719 res!1082388) b!1584721))

(assert (=> d!167482 m!1453759))

(assert (=> d!167482 m!1453759))

(assert (=> d!167482 m!1453765))

(declare-fun m!1453867 () Bool)

(assert (=> d!167482 m!1453867))

(assert (=> d!167482 m!1453769))

(assert (=> b!1584719 m!1453773))

(assert (=> b!1584507 d!167482))

(declare-fun d!167487 () Bool)

(declare-fun res!1082389 () Bool)

(declare-fun e!884661 () Bool)

(assert (=> d!167487 (=> res!1082389 e!884661)))

(assert (=> d!167487 (= res!1082389 (and ((_ is Cons!36941) (insertStrictlySorted!627 l!1251 newKey!123 newValue!123)) (= (_1!12920 (h!38484 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123))) otherKey!56)))))

(assert (=> d!167487 (= (containsKey!1004 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123) otherKey!56) e!884661)))

(declare-fun b!1584722 () Bool)

(declare-fun e!884663 () Bool)

(assert (=> b!1584722 (= e!884661 e!884663)))

(declare-fun res!1082391 () Bool)

(assert (=> b!1584722 (=> (not res!1082391) (not e!884663))))

(assert (=> b!1584722 (= res!1082391 (and (or (not ((_ is Cons!36941) (insertStrictlySorted!627 l!1251 newKey!123 newValue!123))) (bvsle (_1!12920 (h!38484 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123))) otherKey!56)) ((_ is Cons!36941) (insertStrictlySorted!627 l!1251 newKey!123 newValue!123)) (bvslt (_1!12920 (h!38484 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123))) otherKey!56)))))

(declare-fun b!1584724 () Bool)

(assert (=> b!1584724 (= e!884663 (containsKey!1004 (t!51859 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123)) otherKey!56))))

(assert (= (and d!167487 (not res!1082389)) b!1584722))

(assert (= (and b!1584722 res!1082391) b!1584724))

(declare-fun m!1453871 () Bool)

(assert (=> b!1584724 m!1453871))

(assert (=> b!1584507 d!167487))

(declare-fun d!167490 () Bool)

(declare-fun res!1082393 () Bool)

(declare-fun e!884665 () Bool)

(assert (=> d!167490 (=> res!1082393 e!884665)))

(assert (=> d!167490 (= res!1082393 (and ((_ is Cons!36941) (insertStrictlySorted!627 (t!51859 l!1251) newKey!123 newValue!123)) (= (_1!12920 (h!38484 (insertStrictlySorted!627 (t!51859 l!1251) newKey!123 newValue!123))) otherKey!56)))))

(assert (=> d!167490 (= (containsKey!1004 (insertStrictlySorted!627 (t!51859 l!1251) newKey!123 newValue!123) otherKey!56) e!884665)))

(declare-fun b!1584726 () Bool)

(declare-fun e!884667 () Bool)

(assert (=> b!1584726 (= e!884665 e!884667)))

(declare-fun res!1082395 () Bool)

(assert (=> b!1584726 (=> (not res!1082395) (not e!884667))))

(assert (=> b!1584726 (= res!1082395 (and (or (not ((_ is Cons!36941) (insertStrictlySorted!627 (t!51859 l!1251) newKey!123 newValue!123))) (bvsle (_1!12920 (h!38484 (insertStrictlySorted!627 (t!51859 l!1251) newKey!123 newValue!123))) otherKey!56)) ((_ is Cons!36941) (insertStrictlySorted!627 (t!51859 l!1251) newKey!123 newValue!123)) (bvslt (_1!12920 (h!38484 (insertStrictlySorted!627 (t!51859 l!1251) newKey!123 newValue!123))) otherKey!56)))))

(declare-fun b!1584728 () Bool)

(assert (=> b!1584728 (= e!884667 (containsKey!1004 (t!51859 (insertStrictlySorted!627 (t!51859 l!1251) newKey!123 newValue!123)) otherKey!56))))

(assert (= (and d!167490 (not res!1082393)) b!1584726))

(assert (= (and b!1584726 res!1082395) b!1584728))

(declare-fun m!1453874 () Bool)

(assert (=> b!1584728 m!1453874))

(assert (=> b!1584507 d!167490))

(declare-fun b!1584739 () Bool)

(declare-fun e!884674 () Bool)

(declare-fun tp!115135 () Bool)

(assert (=> b!1584739 (= e!884674 (and tp_is_empty!39459 tp!115135))))

(assert (=> b!1584504 (= tp!115123 e!884674)))

(assert (= (and b!1584504 ((_ is Cons!36941) (t!51859 l!1251))) b!1584739))

(check-sat (not b!1584671) (not b!1584538) (not b!1584679) (not bm!72572) (not d!167457) (not b!1584695) (not b!1584739) (not b!1584691) (not b!1584728) (not b!1584570) (not b!1584707) (not b!1584564) (not b!1584724) tp_is_empty!39459 (not b!1584673) (not d!167479) (not d!167482) (not b!1584719) (not bm!72565) (not b!1584562))
(check-sat)
(get-model)

(declare-fun d!167521 () Bool)

(declare-fun res!1082423 () Bool)

(declare-fun e!884705 () Bool)

(assert (=> d!167521 (=> res!1082423 e!884705)))

(assert (=> d!167521 (= res!1082423 (or ((_ is Nil!36942) (t!51859 (t!51859 l!1251))) ((_ is Nil!36942) (t!51859 (t!51859 (t!51859 l!1251))))))))

(assert (=> d!167521 (= (isStrictlySorted!1170 (t!51859 (t!51859 l!1251))) e!884705)))

(declare-fun b!1584775 () Bool)

(declare-fun e!884706 () Bool)

(assert (=> b!1584775 (= e!884705 e!884706)))

(declare-fun res!1082424 () Bool)

(assert (=> b!1584775 (=> (not res!1082424) (not e!884706))))

(assert (=> b!1584775 (= res!1082424 (bvslt (_1!12920 (h!38484 (t!51859 (t!51859 l!1251)))) (_1!12920 (h!38484 (t!51859 (t!51859 (t!51859 l!1251)))))))))

(declare-fun b!1584776 () Bool)

(assert (=> b!1584776 (= e!884706 (isStrictlySorted!1170 (t!51859 (t!51859 (t!51859 l!1251)))))))

(assert (= (and d!167521 (not res!1082423)) b!1584775))

(assert (= (and b!1584775 res!1082424) b!1584776))

(declare-fun m!1453915 () Bool)

(assert (=> b!1584776 m!1453915))

(assert (=> b!1584570 d!167521))

(assert (=> d!167482 d!167490))

(assert (=> d!167482 d!167479))

(declare-fun d!167523 () Bool)

(assert (=> d!167523 (not (containsKey!1004 (insertStrictlySorted!627 (t!51859 l!1251) newKey!123 newValue!123) otherKey!56))))

(assert (=> d!167523 true))

(declare-fun _$17!101 () Unit!52299)

(assert (=> d!167523 (= (choose!2111 (t!51859 l!1251) newKey!123 newValue!123 otherKey!56) _$17!101)))

(declare-fun bs!45940 () Bool)

(assert (= bs!45940 d!167523))

(assert (=> bs!45940 m!1453759))

(assert (=> bs!45940 m!1453759))

(assert (=> bs!45940 m!1453765))

(assert (=> d!167482 d!167523))

(assert (=> d!167482 d!167455))

(declare-fun e!884711 () List!36945)

(declare-fun c!146911 () Bool)

(declare-fun c!146908 () Bool)

(declare-fun b!1584777 () Bool)

(assert (=> b!1584777 (= e!884711 (ite c!146908 (t!51859 (t!51859 (t!51859 l!1251))) (ite c!146911 (Cons!36941 (h!38484 (t!51859 (t!51859 l!1251))) (t!51859 (t!51859 (t!51859 l!1251)))) Nil!36942)))))

(declare-fun d!167525 () Bool)

(declare-fun e!884708 () Bool)

(assert (=> d!167525 e!884708))

(declare-fun res!1082426 () Bool)

(assert (=> d!167525 (=> (not res!1082426) (not e!884708))))

(declare-fun lt!677292 () List!36945)

(assert (=> d!167525 (= res!1082426 (isStrictlySorted!1170 lt!677292))))

(declare-fun e!884709 () List!36945)

(assert (=> d!167525 (= lt!677292 e!884709)))

(declare-fun c!146909 () Bool)

(assert (=> d!167525 (= c!146909 (and ((_ is Cons!36941) (t!51859 (t!51859 l!1251))) (bvslt (_1!12920 (h!38484 (t!51859 (t!51859 l!1251)))) newKey!123)))))

(assert (=> d!167525 (isStrictlySorted!1170 (t!51859 (t!51859 l!1251)))))

(assert (=> d!167525 (= (insertStrictlySorted!627 (t!51859 (t!51859 l!1251)) newKey!123 newValue!123) lt!677292)))

(declare-fun bm!72579 () Bool)

(declare-fun call!72583 () List!36945)

(declare-fun call!72584 () List!36945)

(assert (=> bm!72579 (= call!72583 call!72584)))

(declare-fun b!1584778 () Bool)

(assert (=> b!1584778 (= e!884708 (contains!10527 lt!677292 (tuple2!25819 newKey!123 newValue!123)))))

(declare-fun b!1584779 () Bool)

(declare-fun call!72582 () List!36945)

(assert (=> b!1584779 (= e!884709 call!72582)))

(declare-fun b!1584780 () Bool)

(assert (=> b!1584780 (= e!884711 (insertStrictlySorted!627 (t!51859 (t!51859 (t!51859 l!1251))) newKey!123 newValue!123))))

(declare-fun bm!72580 () Bool)

(assert (=> bm!72580 (= call!72582 ($colon$colon!1023 e!884711 (ite c!146909 (h!38484 (t!51859 (t!51859 l!1251))) (tuple2!25819 newKey!123 newValue!123))))))

(declare-fun c!146910 () Bool)

(assert (=> bm!72580 (= c!146910 c!146909)))

(declare-fun b!1584781 () Bool)

(declare-fun e!884707 () List!36945)

(assert (=> b!1584781 (= e!884707 call!72583)))

(declare-fun b!1584782 () Bool)

(declare-fun e!884710 () List!36945)

(assert (=> b!1584782 (= e!884710 call!72584)))

(declare-fun b!1584783 () Bool)

(assert (=> b!1584783 (= e!884709 e!884710)))

(assert (=> b!1584783 (= c!146908 (and ((_ is Cons!36941) (t!51859 (t!51859 l!1251))) (= (_1!12920 (h!38484 (t!51859 (t!51859 l!1251)))) newKey!123)))))

(declare-fun bm!72581 () Bool)

(assert (=> bm!72581 (= call!72584 call!72582)))

(declare-fun b!1584784 () Bool)

(assert (=> b!1584784 (= c!146911 (and ((_ is Cons!36941) (t!51859 (t!51859 l!1251))) (bvsgt (_1!12920 (h!38484 (t!51859 (t!51859 l!1251)))) newKey!123)))))

(assert (=> b!1584784 (= e!884710 e!884707)))

(declare-fun b!1584785 () Bool)

(assert (=> b!1584785 (= e!884707 call!72583)))

(declare-fun b!1584786 () Bool)

(declare-fun res!1082425 () Bool)

(assert (=> b!1584786 (=> (not res!1082425) (not e!884708))))

(assert (=> b!1584786 (= res!1082425 (containsKey!1004 lt!677292 newKey!123))))

(assert (= (and d!167525 c!146909) b!1584779))

(assert (= (and d!167525 (not c!146909)) b!1584783))

(assert (= (and b!1584783 c!146908) b!1584782))

(assert (= (and b!1584783 (not c!146908)) b!1584784))

(assert (= (and b!1584784 c!146911) b!1584785))

(assert (= (and b!1584784 (not c!146911)) b!1584781))

(assert (= (or b!1584785 b!1584781) bm!72579))

(assert (= (or b!1584782 bm!72579) bm!72581))

(assert (= (or b!1584779 bm!72581) bm!72580))

(assert (= (and bm!72580 c!146910) b!1584780))

(assert (= (and bm!72580 (not c!146910)) b!1584777))

(assert (= (and d!167525 res!1082426) b!1584786))

(assert (= (and b!1584786 res!1082425) b!1584778))

(declare-fun m!1453917 () Bool)

(assert (=> d!167525 m!1453917))

(assert (=> d!167525 m!1453799))

(declare-fun m!1453919 () Bool)

(assert (=> b!1584778 m!1453919))

(declare-fun m!1453921 () Bool)

(assert (=> bm!72580 m!1453921))

(declare-fun m!1453923 () Bool)

(assert (=> b!1584786 m!1453923))

(declare-fun m!1453925 () Bool)

(assert (=> b!1584780 m!1453925))

(assert (=> b!1584695 d!167525))

(declare-fun d!167527 () Bool)

(assert (=> d!167527 (= ($colon$colon!1023 e!884639 (ite c!146889 (h!38484 l!1251) (tuple2!25819 newKey!123 newValue!123))) (Cons!36941 (ite c!146889 (h!38484 l!1251) (tuple2!25819 newKey!123 newValue!123)) e!884639))))

(assert (=> bm!72565 d!167527))

(assert (=> b!1584562 d!167455))

(declare-fun d!167529 () Bool)

(assert (=> d!167529 (= ($colon$colon!1023 e!884652 (ite c!146900 (h!38484 (t!51859 l!1251)) (tuple2!25819 newKey!123 newValue!123))) (Cons!36941 (ite c!146900 (h!38484 (t!51859 l!1251)) (tuple2!25819 newKey!123 newValue!123)) e!884652))))

(assert (=> bm!72572 d!167529))

(assert (=> b!1584564 d!167439))

(declare-fun d!167531 () Bool)

(declare-fun res!1082427 () Bool)

(declare-fun e!884712 () Bool)

(assert (=> d!167531 (=> res!1082427 e!884712)))

(assert (=> d!167531 (= res!1082427 (or ((_ is Nil!36942) lt!677277) ((_ is Nil!36942) (t!51859 lt!677277))))))

(assert (=> d!167531 (= (isStrictlySorted!1170 lt!677277) e!884712)))

(declare-fun b!1584787 () Bool)

(declare-fun e!884713 () Bool)

(assert (=> b!1584787 (= e!884712 e!884713)))

(declare-fun res!1082428 () Bool)

(assert (=> b!1584787 (=> (not res!1082428) (not e!884713))))

(assert (=> b!1584787 (= res!1082428 (bvslt (_1!12920 (h!38484 lt!677277)) (_1!12920 (h!38484 (t!51859 lt!677277)))))))

(declare-fun b!1584788 () Bool)

(assert (=> b!1584788 (= e!884713 (isStrictlySorted!1170 (t!51859 lt!677277)))))

(assert (= (and d!167531 (not res!1082427)) b!1584787))

(assert (= (and b!1584787 res!1082428) b!1584788))

(declare-fun m!1453927 () Bool)

(assert (=> b!1584788 m!1453927))

(assert (=> d!167457 d!167531))

(assert (=> d!167457 d!167449))

(declare-fun d!167533 () Bool)

(declare-fun res!1082429 () Bool)

(declare-fun e!884714 () Bool)

(assert (=> d!167533 (=> res!1082429 e!884714)))

(assert (=> d!167533 (= res!1082429 (and ((_ is Cons!36941) lt!677277) (= (_1!12920 (h!38484 lt!677277)) newKey!123)))))

(assert (=> d!167533 (= (containsKey!1004 lt!677277 newKey!123) e!884714)))

(declare-fun b!1584789 () Bool)

(declare-fun e!884715 () Bool)

(assert (=> b!1584789 (= e!884714 e!884715)))

(declare-fun res!1082430 () Bool)

(assert (=> b!1584789 (=> (not res!1082430) (not e!884715))))

(assert (=> b!1584789 (= res!1082430 (and (or (not ((_ is Cons!36941) lt!677277)) (bvsle (_1!12920 (h!38484 lt!677277)) newKey!123)) ((_ is Cons!36941) lt!677277) (bvslt (_1!12920 (h!38484 lt!677277)) newKey!123)))))

(declare-fun b!1584790 () Bool)

(assert (=> b!1584790 (= e!884715 (containsKey!1004 (t!51859 lt!677277) newKey!123))))

(assert (= (and d!167533 (not res!1082429)) b!1584789))

(assert (= (and b!1584789 res!1082430) b!1584790))

(declare-fun m!1453929 () Bool)

(assert (=> b!1584790 m!1453929))

(assert (=> b!1584679 d!167533))

(declare-fun d!167535 () Bool)

(declare-fun res!1082431 () Bool)

(declare-fun e!884716 () Bool)

(assert (=> d!167535 (=> res!1082431 e!884716)))

(assert (=> d!167535 (= res!1082431 (and ((_ is Cons!36941) (t!51859 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123))) (= (_1!12920 (h!38484 (t!51859 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123)))) otherKey!56)))))

(assert (=> d!167535 (= (containsKey!1004 (t!51859 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123)) otherKey!56) e!884716)))

(declare-fun b!1584791 () Bool)

(declare-fun e!884717 () Bool)

(assert (=> b!1584791 (= e!884716 e!884717)))

(declare-fun res!1082432 () Bool)

(assert (=> b!1584791 (=> (not res!1082432) (not e!884717))))

(assert (=> b!1584791 (= res!1082432 (and (or (not ((_ is Cons!36941) (t!51859 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123)))) (bvsle (_1!12920 (h!38484 (t!51859 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123)))) otherKey!56)) ((_ is Cons!36941) (t!51859 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123))) (bvslt (_1!12920 (h!38484 (t!51859 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123)))) otherKey!56)))))

(declare-fun b!1584792 () Bool)

(assert (=> b!1584792 (= e!884717 (containsKey!1004 (t!51859 (t!51859 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123))) otherKey!56))))

(assert (= (and d!167535 (not res!1082431)) b!1584791))

(assert (= (and b!1584791 res!1082432) b!1584792))

(declare-fun m!1453931 () Bool)

(assert (=> b!1584792 m!1453931))

(assert (=> b!1584724 d!167535))

(assert (=> b!1584719 d!167439))

(declare-fun d!167537 () Bool)

(declare-fun res!1082433 () Bool)

(declare-fun e!884718 () Bool)

(assert (=> d!167537 (=> res!1082433 e!884718)))

(assert (=> d!167537 (= res!1082433 (and ((_ is Cons!36941) (t!51859 (insertStrictlySorted!627 (t!51859 l!1251) newKey!123 newValue!123))) (= (_1!12920 (h!38484 (t!51859 (insertStrictlySorted!627 (t!51859 l!1251) newKey!123 newValue!123)))) otherKey!56)))))

(assert (=> d!167537 (= (containsKey!1004 (t!51859 (insertStrictlySorted!627 (t!51859 l!1251) newKey!123 newValue!123)) otherKey!56) e!884718)))

(declare-fun b!1584793 () Bool)

(declare-fun e!884719 () Bool)

(assert (=> b!1584793 (= e!884718 e!884719)))

(declare-fun res!1082434 () Bool)

(assert (=> b!1584793 (=> (not res!1082434) (not e!884719))))

(assert (=> b!1584793 (= res!1082434 (and (or (not ((_ is Cons!36941) (t!51859 (insertStrictlySorted!627 (t!51859 l!1251) newKey!123 newValue!123)))) (bvsle (_1!12920 (h!38484 (t!51859 (insertStrictlySorted!627 (t!51859 l!1251) newKey!123 newValue!123)))) otherKey!56)) ((_ is Cons!36941) (t!51859 (insertStrictlySorted!627 (t!51859 l!1251) newKey!123 newValue!123))) (bvslt (_1!12920 (h!38484 (t!51859 (insertStrictlySorted!627 (t!51859 l!1251) newKey!123 newValue!123)))) otherKey!56)))))

(declare-fun b!1584794 () Bool)

(assert (=> b!1584794 (= e!884719 (containsKey!1004 (t!51859 (t!51859 (insertStrictlySorted!627 (t!51859 l!1251) newKey!123 newValue!123))) otherKey!56))))

(assert (= (and d!167537 (not res!1082433)) b!1584793))

(assert (= (and b!1584793 res!1082434) b!1584794))

(declare-fun m!1453933 () Bool)

(assert (=> b!1584794 m!1453933))

(assert (=> b!1584728 d!167537))

(declare-fun d!167539 () Bool)

(declare-fun res!1082435 () Bool)

(declare-fun e!884720 () Bool)

(assert (=> d!167539 (=> res!1082435 e!884720)))

(assert (=> d!167539 (= res!1082435 (and ((_ is Cons!36941) (t!51859 (t!51859 l!1251))) (= (_1!12920 (h!38484 (t!51859 (t!51859 l!1251)))) otherKey!56)))))

(assert (=> d!167539 (= (containsKey!1004 (t!51859 (t!51859 l!1251)) otherKey!56) e!884720)))

(declare-fun b!1584795 () Bool)

(declare-fun e!884721 () Bool)

(assert (=> b!1584795 (= e!884720 e!884721)))

(declare-fun res!1082436 () Bool)

(assert (=> b!1584795 (=> (not res!1082436) (not e!884721))))

(assert (=> b!1584795 (= res!1082436 (and (or (not ((_ is Cons!36941) (t!51859 (t!51859 l!1251)))) (bvsle (_1!12920 (h!38484 (t!51859 (t!51859 l!1251)))) otherKey!56)) ((_ is Cons!36941) (t!51859 (t!51859 l!1251))) (bvslt (_1!12920 (h!38484 (t!51859 (t!51859 l!1251)))) otherKey!56)))))

(declare-fun b!1584796 () Bool)

(assert (=> b!1584796 (= e!884721 (containsKey!1004 (t!51859 (t!51859 (t!51859 l!1251))) otherKey!56))))

(assert (= (and d!167539 (not res!1082435)) b!1584795))

(assert (= (and b!1584795 res!1082436) b!1584796))

(declare-fun m!1453935 () Bool)

(assert (=> b!1584796 m!1453935))

(assert (=> b!1584538 d!167539))

(declare-fun d!167541 () Bool)

(declare-fun res!1082437 () Bool)

(declare-fun e!884722 () Bool)

(assert (=> d!167541 (=> res!1082437 e!884722)))

(assert (=> d!167541 (= res!1082437 (and ((_ is Cons!36941) lt!677280) (= (_1!12920 (h!38484 lt!677280)) newKey!123)))))

(assert (=> d!167541 (= (containsKey!1004 lt!677280 newKey!123) e!884722)))

(declare-fun b!1584797 () Bool)

(declare-fun e!884723 () Bool)

(assert (=> b!1584797 (= e!884722 e!884723)))

(declare-fun res!1082438 () Bool)

(assert (=> b!1584797 (=> (not res!1082438) (not e!884723))))

(assert (=> b!1584797 (= res!1082438 (and (or (not ((_ is Cons!36941) lt!677280)) (bvsle (_1!12920 (h!38484 lt!677280)) newKey!123)) ((_ is Cons!36941) lt!677280) (bvslt (_1!12920 (h!38484 lt!677280)) newKey!123)))))

(declare-fun b!1584798 () Bool)

(assert (=> b!1584798 (= e!884723 (containsKey!1004 (t!51859 lt!677280) newKey!123))))

(assert (= (and d!167541 (not res!1082437)) b!1584797))

(assert (= (and b!1584797 res!1082438) b!1584798))

(declare-fun m!1453937 () Bool)

(assert (=> b!1584798 m!1453937))

(assert (=> b!1584707 d!167541))

(declare-fun d!167543 () Bool)

(declare-fun res!1082439 () Bool)

(declare-fun e!884724 () Bool)

(assert (=> d!167543 (=> res!1082439 e!884724)))

(assert (=> d!167543 (= res!1082439 (or ((_ is Nil!36942) lt!677280) ((_ is Nil!36942) (t!51859 lt!677280))))))

(assert (=> d!167543 (= (isStrictlySorted!1170 lt!677280) e!884724)))

(declare-fun b!1584799 () Bool)

(declare-fun e!884725 () Bool)

(assert (=> b!1584799 (= e!884724 e!884725)))

(declare-fun res!1082440 () Bool)

(assert (=> b!1584799 (=> (not res!1082440) (not e!884725))))

(assert (=> b!1584799 (= res!1082440 (bvslt (_1!12920 (h!38484 lt!677280)) (_1!12920 (h!38484 (t!51859 lt!677280)))))))

(declare-fun b!1584800 () Bool)

(assert (=> b!1584800 (= e!884725 (isStrictlySorted!1170 (t!51859 lt!677280)))))

(assert (= (and d!167543 (not res!1082439)) b!1584799))

(assert (= (and b!1584799 res!1082440) b!1584800))

(declare-fun m!1453939 () Bool)

(assert (=> b!1584800 m!1453939))

(assert (=> d!167479 d!167543))

(assert (=> d!167479 d!167455))

(declare-fun d!167545 () Bool)

(declare-fun lt!677295 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!862 (List!36945) (InoxSet tuple2!25818))

(assert (=> d!167545 (= lt!677295 (select (content!862 lt!677277) (tuple2!25819 newKey!123 newValue!123)))))

(declare-fun e!884731 () Bool)

(assert (=> d!167545 (= lt!677295 e!884731)))

(declare-fun res!1082446 () Bool)

(assert (=> d!167545 (=> (not res!1082446) (not e!884731))))

(assert (=> d!167545 (= res!1082446 ((_ is Cons!36941) lt!677277))))

(assert (=> d!167545 (= (contains!10527 lt!677277 (tuple2!25819 newKey!123 newValue!123)) lt!677295)))

(declare-fun b!1584805 () Bool)

(declare-fun e!884730 () Bool)

(assert (=> b!1584805 (= e!884731 e!884730)))

(declare-fun res!1082445 () Bool)

(assert (=> b!1584805 (=> res!1082445 e!884730)))

(assert (=> b!1584805 (= res!1082445 (= (h!38484 lt!677277) (tuple2!25819 newKey!123 newValue!123)))))

(declare-fun b!1584806 () Bool)

(assert (=> b!1584806 (= e!884730 (contains!10527 (t!51859 lt!677277) (tuple2!25819 newKey!123 newValue!123)))))

(assert (= (and d!167545 res!1082446) b!1584805))

(assert (= (and b!1584805 (not res!1082445)) b!1584806))

(declare-fun m!1453941 () Bool)

(assert (=> d!167545 m!1453941))

(declare-fun m!1453943 () Bool)

(assert (=> d!167545 m!1453943))

(declare-fun m!1453945 () Bool)

(assert (=> b!1584806 m!1453945))

(assert (=> b!1584671 d!167545))

(declare-fun lt!677296 () Bool)

(declare-fun d!167547 () Bool)

(assert (=> d!167547 (= lt!677296 (select (content!862 lt!677280) (tuple2!25819 newKey!123 newValue!123)))))

(declare-fun e!884733 () Bool)

(assert (=> d!167547 (= lt!677296 e!884733)))

(declare-fun res!1082448 () Bool)

(assert (=> d!167547 (=> (not res!1082448) (not e!884733))))

(assert (=> d!167547 (= res!1082448 ((_ is Cons!36941) lt!677280))))

(assert (=> d!167547 (= (contains!10527 lt!677280 (tuple2!25819 newKey!123 newValue!123)) lt!677296)))

(declare-fun b!1584807 () Bool)

(declare-fun e!884732 () Bool)

(assert (=> b!1584807 (= e!884733 e!884732)))

(declare-fun res!1082447 () Bool)

(assert (=> b!1584807 (=> res!1082447 e!884732)))

(assert (=> b!1584807 (= res!1082447 (= (h!38484 lt!677280) (tuple2!25819 newKey!123 newValue!123)))))

(declare-fun b!1584808 () Bool)

(assert (=> b!1584808 (= e!884732 (contains!10527 (t!51859 lt!677280) (tuple2!25819 newKey!123 newValue!123)))))

(assert (= (and d!167547 res!1082448) b!1584807))

(assert (= (and b!1584807 (not res!1082447)) b!1584808))

(declare-fun m!1453947 () Bool)

(assert (=> d!167547 m!1453947))

(declare-fun m!1453949 () Bool)

(assert (=> d!167547 m!1453949))

(declare-fun m!1453951 () Bool)

(assert (=> b!1584808 m!1453951))

(assert (=> b!1584691 d!167547))

(assert (=> b!1584673 d!167479))

(declare-fun b!1584809 () Bool)

(declare-fun e!884734 () Bool)

(declare-fun tp!115137 () Bool)

(assert (=> b!1584809 (= e!884734 (and tp_is_empty!39459 tp!115137))))

(assert (=> b!1584739 (= tp!115135 e!884734)))

(assert (= (and b!1584739 ((_ is Cons!36941) (t!51859 (t!51859 l!1251)))) b!1584809))

(check-sat (not d!167545) (not b!1584809) (not d!167523) (not b!1584780) (not b!1584776) (not b!1584808) tp_is_empty!39459 (not b!1584778) (not b!1584794) (not b!1584788) (not b!1584790) (not d!167525) (not b!1584800) (not b!1584792) (not d!167547) (not bm!72580) (not b!1584798) (not b!1584786) (not b!1584796) (not b!1584806))
