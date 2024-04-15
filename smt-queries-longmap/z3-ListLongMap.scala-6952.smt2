; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87624 () Bool)

(assert start!87624)

(declare-fun b!1013794 () Bool)

(assert (=> b!1013794 true))

(assert (=> b!1013794 true))

(declare-fun bs!28972 () Bool)

(declare-fun b!1013793 () Bool)

(assert (= bs!28972 (and b!1013793 b!1013794)))

(declare-fun lambda!602 () Int)

(declare-fun lambda!601 () Int)

(assert (=> bs!28972 (= lambda!602 lambda!601)))

(assert (=> b!1013793 true))

(assert (=> b!1013793 true))

(declare-fun e!570293 () Bool)

(declare-datatypes ((List!21456 0))(
  ( (Nil!21453) (Cons!21452 (h!22650 (_ BitVec 64)) (t!30448 List!21456)) )
))
(declare-fun lt!448094 () List!21456)

(declare-datatypes ((B!1418 0))(
  ( (B!1419 (val!11793 Int)) )
))
(declare-datatypes ((tuple2!15212 0))(
  ( (tuple2!15213 (_1!7617 (_ BitVec 64)) (_2!7617 B!1418)) )
))
(declare-datatypes ((List!21457 0))(
  ( (Nil!21454) (Cons!21453 (h!22651 tuple2!15212) (t!30449 List!21457)) )
))
(declare-fun l!412 () List!21457)

(declare-fun forall!239 (List!21456 Int) Bool)

(assert (=> b!1013793 (= e!570293 (not (forall!239 (Cons!21452 (_1!7617 (h!22651 l!412)) lt!448094) lambda!602)))))

(declare-datatypes ((Unit!33040 0))(
  ( (Unit!33041) )
))
(declare-fun lt!448095 () Unit!33040)

(declare-fun e!570291 () Unit!33040)

(assert (=> b!1013793 (= lt!448095 e!570291)))

(declare-fun c!102535 () Bool)

(declare-fun isEmpty!833 (List!21456) Bool)

(assert (=> b!1013793 (= c!102535 (not (isEmpty!833 lt!448094)))))

(declare-fun value!115 () B!1418)

(declare-fun getKeysOf!43 (List!21457 B!1418) List!21456)

(assert (=> b!1013793 (= lt!448094 (getKeysOf!43 (t!30449 l!412) value!115))))

(declare-fun lt!448096 () Unit!33040)

(assert (=> b!1013794 (= e!570291 lt!448096)))

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!34 (List!21457 List!21456 B!1418 tuple2!15212) Unit!33040)

(assert (=> b!1013794 (= lt!448096 (lemmaForallGetValueByKeySameWithASmallerHead!34 (t!30449 l!412) lt!448094 value!115 (h!22651 l!412)))))

(assert (=> b!1013794 (forall!239 lt!448094 lambda!601)))

(declare-fun b!1013795 () Bool)

(declare-fun res!680516 () Bool)

(assert (=> b!1013795 (=> (not res!680516) (not e!570293))))

(get-info :version)

(assert (=> b!1013795 (= res!680516 (and ((_ is Cons!21453) l!412) (= (_2!7617 (h!22651 l!412)) value!115)))))

(declare-fun res!680515 () Bool)

(assert (=> start!87624 (=> (not res!680515) (not e!570293))))

(declare-fun isStrictlySorted!563 (List!21457) Bool)

(assert (=> start!87624 (= res!680515 (isStrictlySorted!563 l!412))))

(assert (=> start!87624 e!570293))

(declare-fun e!570292 () Bool)

(assert (=> start!87624 e!570292))

(declare-fun tp_is_empty!23485 () Bool)

(assert (=> start!87624 tp_is_empty!23485))

(declare-fun b!1013796 () Bool)

(declare-fun tp!70482 () Bool)

(assert (=> b!1013796 (= e!570292 (and tp_is_empty!23485 tp!70482))))

(declare-fun b!1013797 () Bool)

(declare-fun Unit!33042 () Unit!33040)

(assert (=> b!1013797 (= e!570291 Unit!33042)))

(assert (= (and start!87624 res!680515) b!1013795))

(assert (= (and b!1013795 res!680516) b!1013793))

(assert (= (and b!1013793 c!102535) b!1013794))

(assert (= (and b!1013793 (not c!102535)) b!1013797))

(assert (= (and start!87624 ((_ is Cons!21453) l!412)) b!1013796))

(declare-fun m!936049 () Bool)

(assert (=> b!1013793 m!936049))

(declare-fun m!936051 () Bool)

(assert (=> b!1013793 m!936051))

(declare-fun m!936053 () Bool)

(assert (=> b!1013793 m!936053))

(declare-fun m!936055 () Bool)

(assert (=> b!1013794 m!936055))

(declare-fun m!936057 () Bool)

(assert (=> b!1013794 m!936057))

(declare-fun m!936059 () Bool)

(assert (=> start!87624 m!936059))

(check-sat tp_is_empty!23485 (not b!1013796) (not start!87624) (not b!1013794) (not b!1013793))
(check-sat)
(get-model)

(declare-fun d!120421 () Bool)

(declare-fun res!680533 () Bool)

(declare-fun e!570316 () Bool)

(assert (=> d!120421 (=> res!680533 e!570316)))

(assert (=> d!120421 (= res!680533 (or ((_ is Nil!21454) l!412) ((_ is Nil!21454) (t!30449 l!412))))))

(assert (=> d!120421 (= (isStrictlySorted!563 l!412) e!570316)))

(declare-fun b!1013844 () Bool)

(declare-fun e!570317 () Bool)

(assert (=> b!1013844 (= e!570316 e!570317)))

(declare-fun res!680534 () Bool)

(assert (=> b!1013844 (=> (not res!680534) (not e!570317))))

(assert (=> b!1013844 (= res!680534 (bvslt (_1!7617 (h!22651 l!412)) (_1!7617 (h!22651 (t!30449 l!412)))))))

(declare-fun b!1013845 () Bool)

(assert (=> b!1013845 (= e!570317 (isStrictlySorted!563 (t!30449 l!412)))))

(assert (= (and d!120421 (not res!680533)) b!1013844))

(assert (= (and b!1013844 res!680534) b!1013845))

(declare-fun m!936085 () Bool)

(assert (=> b!1013845 m!936085))

(assert (=> start!87624 d!120421))

(declare-fun bs!28979 () Bool)

(declare-fun b!1013871 () Bool)

(assert (= bs!28979 (and b!1013871 b!1013794)))

(declare-fun lambda!629 () Int)

(assert (=> bs!28979 (= (= (t!30449 l!412) l!412) (= lambda!629 lambda!601))))

(declare-fun bs!28982 () Bool)

(assert (= bs!28982 (and b!1013871 b!1013793)))

(assert (=> bs!28982 (= (= (t!30449 l!412) l!412) (= lambda!629 lambda!602))))

(assert (=> b!1013871 true))

(assert (=> b!1013871 true))

(declare-fun bs!28987 () Bool)

(declare-fun d!120427 () Bool)

(assert (= bs!28987 (and d!120427 b!1013794)))

(declare-fun lambda!632 () Int)

(assert (=> bs!28987 (= (= (Cons!21453 (h!22651 l!412) (t!30449 l!412)) l!412) (= lambda!632 lambda!601))))

(declare-fun bs!28988 () Bool)

(assert (= bs!28988 (and d!120427 b!1013793)))

(assert (=> bs!28988 (= (= (Cons!21453 (h!22651 l!412) (t!30449 l!412)) l!412) (= lambda!632 lambda!602))))

(declare-fun bs!28989 () Bool)

(assert (= bs!28989 (and d!120427 b!1013871)))

(assert (=> bs!28989 (= (= (Cons!21453 (h!22651 l!412) (t!30449 l!412)) (t!30449 l!412)) (= lambda!632 lambda!629))))

(assert (=> d!120427 true))

(assert (=> d!120427 true))

(assert (=> d!120427 true))

(assert (=> d!120427 (forall!239 lt!448094 lambda!632)))

(declare-fun lt!448123 () Unit!33040)

(declare-fun choose!1643 (List!21457 List!21456 B!1418 tuple2!15212) Unit!33040)

(assert (=> d!120427 (= lt!448123 (choose!1643 (t!30449 l!412) lt!448094 value!115 (h!22651 l!412)))))

(declare-fun e!570326 () Bool)

(assert (=> d!120427 e!570326))

(declare-fun res!680561 () Bool)

(assert (=> d!120427 (=> (not res!680561) (not e!570326))))

(assert (=> d!120427 (= res!680561 (isStrictlySorted!563 (t!30449 l!412)))))

(assert (=> d!120427 (= (lemmaForallGetValueByKeySameWithASmallerHead!34 (t!30449 l!412) lt!448094 value!115 (h!22651 l!412)) lt!448123)))

(declare-fun b!1013870 () Bool)

(declare-fun res!680559 () Bool)

(assert (=> b!1013870 (=> (not res!680559) (not e!570326))))

(declare-fun isEmpty!837 (List!21457) Bool)

(assert (=> b!1013870 (= res!680559 (not (isEmpty!837 (t!30449 l!412))))))

(declare-fun res!680560 () Bool)

(assert (=> b!1013871 (=> (not res!680560) (not e!570326))))

(assert (=> b!1013871 (= res!680560 (forall!239 lt!448094 lambda!629))))

(declare-fun b!1013872 () Bool)

(declare-fun head!938 (List!21457) tuple2!15212)

(assert (=> b!1013872 (= e!570326 (bvslt (_1!7617 (h!22651 l!412)) (_1!7617 (head!938 (t!30449 l!412)))))))

(assert (= (and d!120427 res!680561) b!1013870))

(assert (= (and b!1013870 res!680559) b!1013871))

(assert (= (and b!1013871 res!680560) b!1013872))

(declare-fun m!936111 () Bool)

(assert (=> d!120427 m!936111))

(declare-fun m!936113 () Bool)

(assert (=> d!120427 m!936113))

(assert (=> d!120427 m!936085))

(declare-fun m!936115 () Bool)

(assert (=> b!1013870 m!936115))

(declare-fun m!936117 () Bool)

(assert (=> b!1013871 m!936117))

(declare-fun m!936119 () Bool)

(assert (=> b!1013872 m!936119))

(assert (=> b!1013794 d!120427))

(declare-fun d!120433 () Bool)

(declare-fun res!680584 () Bool)

(declare-fun e!570349 () Bool)

(assert (=> d!120433 (=> res!680584 e!570349)))

(assert (=> d!120433 (= res!680584 ((_ is Nil!21453) lt!448094))))

(assert (=> d!120433 (= (forall!239 lt!448094 lambda!601) e!570349)))

(declare-fun b!1013901 () Bool)

(declare-fun e!570350 () Bool)

(assert (=> b!1013901 (= e!570349 e!570350)))

(declare-fun res!680585 () Bool)

(assert (=> b!1013901 (=> (not res!680585) (not e!570350))))

(declare-fun dynLambda!1879 (Int (_ BitVec 64)) Bool)

(assert (=> b!1013901 (= res!680585 (dynLambda!1879 lambda!601 (h!22650 lt!448094)))))

(declare-fun b!1013902 () Bool)

(assert (=> b!1013902 (= e!570350 (forall!239 (t!30448 lt!448094) lambda!601))))

(assert (= (and d!120433 (not res!680584)) b!1013901))

(assert (= (and b!1013901 res!680585) b!1013902))

(declare-fun b_lambda!15265 () Bool)

(assert (=> (not b_lambda!15265) (not b!1013901)))

(declare-fun m!936133 () Bool)

(assert (=> b!1013901 m!936133))

(declare-fun m!936135 () Bool)

(assert (=> b!1013902 m!936135))

(assert (=> b!1013794 d!120433))

(declare-fun d!120443 () Bool)

(declare-fun res!680586 () Bool)

(declare-fun e!570351 () Bool)

(assert (=> d!120443 (=> res!680586 e!570351)))

(assert (=> d!120443 (= res!680586 ((_ is Nil!21453) (Cons!21452 (_1!7617 (h!22651 l!412)) lt!448094)))))

(assert (=> d!120443 (= (forall!239 (Cons!21452 (_1!7617 (h!22651 l!412)) lt!448094) lambda!602) e!570351)))

(declare-fun b!1013903 () Bool)

(declare-fun e!570352 () Bool)

(assert (=> b!1013903 (= e!570351 e!570352)))

(declare-fun res!680587 () Bool)

(assert (=> b!1013903 (=> (not res!680587) (not e!570352))))

(assert (=> b!1013903 (= res!680587 (dynLambda!1879 lambda!602 (h!22650 (Cons!21452 (_1!7617 (h!22651 l!412)) lt!448094))))))

(declare-fun b!1013904 () Bool)

(assert (=> b!1013904 (= e!570352 (forall!239 (t!30448 (Cons!21452 (_1!7617 (h!22651 l!412)) lt!448094)) lambda!602))))

(assert (= (and d!120443 (not res!680586)) b!1013903))

(assert (= (and b!1013903 res!680587) b!1013904))

(declare-fun b_lambda!15267 () Bool)

(assert (=> (not b_lambda!15267) (not b!1013903)))

(declare-fun m!936137 () Bool)

(assert (=> b!1013903 m!936137))

(declare-fun m!936139 () Bool)

(assert (=> b!1013904 m!936139))

(assert (=> b!1013793 d!120443))

(declare-fun d!120445 () Bool)

(assert (=> d!120445 (= (isEmpty!833 lt!448094) ((_ is Nil!21453) lt!448094))))

(assert (=> b!1013793 d!120445))

(declare-fun bs!28999 () Bool)

(declare-fun b!1013968 () Bool)

(assert (= bs!28999 (and b!1013968 b!1013794)))

(declare-fun lambda!653 () Int)

(declare-fun lt!448214 () List!21457)

(declare-fun lt!448209 () tuple2!15212)

(assert (=> bs!28999 (= (= (Cons!21453 lt!448209 lt!448214) l!412) (= lambda!653 lambda!601))))

(declare-fun bs!29000 () Bool)

(assert (= bs!29000 (and b!1013968 b!1013793)))

(assert (=> bs!29000 (= (= (Cons!21453 lt!448209 lt!448214) l!412) (= lambda!653 lambda!602))))

(declare-fun bs!29002 () Bool)

(assert (= bs!29002 (and b!1013968 b!1013871)))

(assert (=> bs!29002 (= (= (Cons!21453 lt!448209 lt!448214) (t!30449 l!412)) (= lambda!653 lambda!629))))

(declare-fun bs!29004 () Bool)

(assert (= bs!29004 (and b!1013968 d!120427)))

(assert (=> bs!29004 (= (= (Cons!21453 lt!448209 lt!448214) (Cons!21453 (h!22651 l!412) (t!30449 l!412))) (= lambda!653 lambda!632))))

(assert (=> b!1013968 true))

(assert (=> b!1013968 true))

(assert (=> b!1013968 true))

(declare-fun bs!29012 () Bool)

(declare-fun b!1013970 () Bool)

(assert (= bs!29012 (and b!1013970 b!1013968)))

(declare-fun lambda!656 () Int)

(declare-fun lt!448215 () List!21457)

(declare-fun lt!448218 () tuple2!15212)

(assert (=> bs!29012 (= (= (Cons!21453 lt!448218 lt!448215) (Cons!21453 lt!448209 lt!448214)) (= lambda!656 lambda!653))))

(declare-fun bs!29014 () Bool)

(assert (= bs!29014 (and b!1013970 b!1013793)))

(assert (=> bs!29014 (= (= (Cons!21453 lt!448218 lt!448215) l!412) (= lambda!656 lambda!602))))

(declare-fun bs!29016 () Bool)

(assert (= bs!29016 (and b!1013970 b!1013871)))

(assert (=> bs!29016 (= (= (Cons!21453 lt!448218 lt!448215) (t!30449 l!412)) (= lambda!656 lambda!629))))

(declare-fun bs!29018 () Bool)

(assert (= bs!29018 (and b!1013970 d!120427)))

(assert (=> bs!29018 (= (= (Cons!21453 lt!448218 lt!448215) (Cons!21453 (h!22651 l!412) (t!30449 l!412))) (= lambda!656 lambda!632))))

(declare-fun bs!29020 () Bool)

(assert (= bs!29020 (and b!1013970 b!1013794)))

(assert (=> bs!29020 (= (= (Cons!21453 lt!448218 lt!448215) l!412) (= lambda!656 lambda!601))))

(assert (=> b!1013970 true))

(assert (=> b!1013970 true))

(assert (=> b!1013970 true))

(declare-fun bs!29023 () Bool)

(declare-fun d!120449 () Bool)

(assert (= bs!29023 (and d!120449 b!1013968)))

(declare-fun lambda!658 () Int)

(assert (=> bs!29023 (= (= (t!30449 l!412) (Cons!21453 lt!448209 lt!448214)) (= lambda!658 lambda!653))))

(declare-fun bs!29024 () Bool)

(assert (= bs!29024 (and d!120449 b!1013793)))

(assert (=> bs!29024 (= (= (t!30449 l!412) l!412) (= lambda!658 lambda!602))))

(declare-fun bs!29026 () Bool)

(assert (= bs!29026 (and d!120449 b!1013871)))

(assert (=> bs!29026 (= lambda!658 lambda!629)))

(declare-fun bs!29027 () Bool)

(assert (= bs!29027 (and d!120449 b!1013970)))

(assert (=> bs!29027 (= (= (t!30449 l!412) (Cons!21453 lt!448218 lt!448215)) (= lambda!658 lambda!656))))

(declare-fun bs!29029 () Bool)

(assert (= bs!29029 (and d!120449 d!120427)))

(assert (=> bs!29029 (= (= (t!30449 l!412) (Cons!21453 (h!22651 l!412) (t!30449 l!412))) (= lambda!658 lambda!632))))

(declare-fun bs!29031 () Bool)

(assert (= bs!29031 (and d!120449 b!1013794)))

(assert (=> bs!29031 (= (= (t!30449 l!412) l!412) (= lambda!658 lambda!601))))

(assert (=> d!120449 true))

(assert (=> d!120449 true))

(declare-fun call!42735 () Bool)

(declare-fun lt!448210 () List!21456)

(declare-fun bm!42732 () Bool)

(declare-fun lt!448208 () List!21456)

(declare-fun c!102571 () Bool)

(assert (=> bm!42732 (= call!42735 (forall!239 (ite c!102571 lt!448210 lt!448208) (ite c!102571 lambda!653 lambda!656)))))

(declare-fun b!1013965 () Bool)

(declare-fun e!570387 () List!21456)

(declare-fun e!570386 () List!21456)

(assert (=> b!1013965 (= e!570387 e!570386)))

(declare-fun c!102570 () Bool)

(assert (=> b!1013965 (= c!102570 (and ((_ is Cons!21453) (t!30449 l!412)) (not (= (_2!7617 (h!22651 (t!30449 l!412))) value!115))))))

(declare-fun b!1013966 () Bool)

(declare-fun lt!448217 () Unit!33040)

(declare-fun e!570385 () Unit!33040)

(assert (=> b!1013966 (= lt!448217 e!570385)))

(declare-fun c!102573 () Bool)

(declare-fun call!42736 () Bool)

(assert (=> b!1013966 (= c!102573 (not call!42736))))

(declare-fun lt!448216 () List!21456)

(declare-fun call!42737 () List!21456)

(assert (=> b!1013966 (= lt!448216 call!42737)))

(assert (=> b!1013966 (= e!570386 call!42737)))

(declare-fun b!1013967 () Bool)

(declare-fun e!570388 () Unit!33040)

(declare-fun Unit!33049 () Unit!33040)

(assert (=> b!1013967 (= e!570388 Unit!33049)))

(declare-fun bm!42733 () Bool)

(declare-fun call!42738 () Unit!33040)

(assert (=> bm!42733 (= call!42738 (lemmaForallGetValueByKeySameWithASmallerHead!34 (ite c!102571 lt!448214 lt!448215) (ite c!102571 lt!448210 lt!448208) value!115 (ite c!102571 lt!448209 lt!448218)))))

(assert (=> b!1013968 call!42735))

(declare-fun lt!448213 () Unit!33040)

(assert (=> b!1013968 (= lt!448213 call!42738)))

(assert (=> b!1013968 (= lt!448209 (h!22651 (t!30449 l!412)))))

(assert (=> b!1013968 (= lt!448210 call!42737)))

(assert (=> b!1013968 (= lt!448214 (t!30449 (t!30449 l!412)))))

(assert (=> b!1013968 (= e!570388 lt!448213)))

(declare-fun b!1013969 () Bool)

(assert (=> b!1013969 (= e!570387 (Cons!21452 (_1!7617 (h!22651 (t!30449 l!412))) call!42737))))

(declare-fun c!102572 () Bool)

(assert (=> b!1013969 (= c!102572 (not call!42736))))

(declare-fun lt!448219 () Unit!33040)

(assert (=> b!1013969 (= lt!448219 e!570388)))

(declare-fun lt!448211 () List!21456)

(assert (=> d!120449 (forall!239 lt!448211 lambda!658)))

(assert (=> d!120449 (= lt!448211 e!570387)))

(assert (=> d!120449 (= c!102571 (and ((_ is Cons!21453) (t!30449 l!412)) (= (_2!7617 (h!22651 (t!30449 l!412))) value!115)))))

(assert (=> d!120449 (isStrictlySorted!563 (t!30449 l!412))))

(assert (=> d!120449 (= (getKeysOf!43 (t!30449 l!412) value!115) lt!448211)))

(declare-fun bm!42734 () Bool)

(assert (=> bm!42734 (= call!42737 (getKeysOf!43 (t!30449 (t!30449 l!412)) value!115))))

(declare-fun lt!448212 () Unit!33040)

(assert (=> b!1013970 (= e!570385 lt!448212)))

(assert (=> b!1013970 (= lt!448215 (t!30449 (t!30449 l!412)))))

(assert (=> b!1013970 (= lt!448208 call!42737)))

(assert (=> b!1013970 (= lt!448218 (h!22651 (t!30449 l!412)))))

(assert (=> b!1013970 (= lt!448212 call!42738)))

(assert (=> b!1013970 call!42735))

(declare-fun bm!42735 () Bool)

(assert (=> bm!42735 (= call!42736 (isEmpty!833 call!42737))))

(declare-fun b!1013971 () Bool)

(assert (=> b!1013971 (= e!570386 Nil!21453)))

(declare-fun b!1013972 () Bool)

(declare-fun Unit!33050 () Unit!33040)

(assert (=> b!1013972 (= e!570385 Unit!33050)))

(assert (= (and d!120449 c!102571) b!1013969))

(assert (= (and d!120449 (not c!102571)) b!1013965))

(assert (= (and b!1013969 c!102572) b!1013968))

(assert (= (and b!1013969 (not c!102572)) b!1013967))

(assert (= (and b!1013965 c!102570) b!1013966))

(assert (= (and b!1013965 (not c!102570)) b!1013971))

(assert (= (and b!1013966 c!102573) b!1013970))

(assert (= (and b!1013966 (not c!102573)) b!1013972))

(assert (= (or b!1013968 b!1013970) bm!42733))

(assert (= (or b!1013968 b!1013970) bm!42732))

(assert (= (or b!1013969 b!1013968 b!1013966 b!1013970) bm!42734))

(assert (= (or b!1013969 b!1013966) bm!42735))

(declare-fun m!936155 () Bool)

(assert (=> bm!42733 m!936155))

(declare-fun m!936157 () Bool)

(assert (=> bm!42734 m!936157))

(declare-fun m!936159 () Bool)

(assert (=> bm!42732 m!936159))

(declare-fun m!936161 () Bool)

(assert (=> bm!42735 m!936161))

(declare-fun m!936163 () Bool)

(assert (=> d!120449 m!936163))

(assert (=> d!120449 m!936085))

(assert (=> b!1013793 d!120449))

(declare-fun b!1013995 () Bool)

(declare-fun e!570403 () Bool)

(declare-fun tp!70493 () Bool)

(assert (=> b!1013995 (= e!570403 (and tp_is_empty!23485 tp!70493))))

(assert (=> b!1013796 (= tp!70482 e!570403)))

(assert (= (and b!1013796 ((_ is Cons!21453) (t!30449 l!412))) b!1013995))

(declare-fun b_lambda!15271 () Bool)

(assert (= b_lambda!15267 (or b!1013793 b_lambda!15271)))

(declare-fun bs!29035 () Bool)

(declare-fun d!120457 () Bool)

(assert (= bs!29035 (and d!120457 b!1013793)))

(declare-datatypes ((Option!579 0))(
  ( (Some!578 (v!14426 B!1418)) (None!577) )
))
(declare-fun getValueByKey!528 (List!21457 (_ BitVec 64)) Option!579)

(assert (=> bs!29035 (= (dynLambda!1879 lambda!602 (h!22650 (Cons!21452 (_1!7617 (h!22651 l!412)) lt!448094))) (= (getValueByKey!528 l!412 (h!22650 (Cons!21452 (_1!7617 (h!22651 l!412)) lt!448094))) (Some!578 value!115)))))

(declare-fun m!936175 () Bool)

(assert (=> bs!29035 m!936175))

(assert (=> b!1013903 d!120457))

(declare-fun b_lambda!15273 () Bool)

(assert (= b_lambda!15265 (or b!1013794 b_lambda!15273)))

(declare-fun bs!29037 () Bool)

(declare-fun d!120461 () Bool)

(assert (= bs!29037 (and d!120461 b!1013794)))

(assert (=> bs!29037 (= (dynLambda!1879 lambda!601 (h!22650 lt!448094)) (= (getValueByKey!528 l!412 (h!22650 lt!448094)) (Some!578 value!115)))))

(declare-fun m!936179 () Bool)

(assert (=> bs!29037 m!936179))

(assert (=> b!1013901 d!120461))

(check-sat (not bs!29035) (not b!1013995) (not b!1013902) (not b!1013904) (not bm!42734) (not b!1013872) (not d!120449) (not b!1013870) (not d!120427) (not bm!42732) (not bm!42735) tp_is_empty!23485 (not b!1013845) (not b_lambda!15273) (not b_lambda!15271) (not b!1013871) (not bs!29037) (not bm!42733))
(check-sat)
(get-model)

(declare-fun d!120469 () Bool)

(declare-fun res!680598 () Bool)

(declare-fun e!570408 () Bool)

(assert (=> d!120469 (=> res!680598 e!570408)))

(assert (=> d!120469 (= res!680598 ((_ is Nil!21453) lt!448211))))

(assert (=> d!120469 (= (forall!239 lt!448211 lambda!658) e!570408)))

(declare-fun b!1014002 () Bool)

(declare-fun e!570409 () Bool)

(assert (=> b!1014002 (= e!570408 e!570409)))

(declare-fun res!680599 () Bool)

(assert (=> b!1014002 (=> (not res!680599) (not e!570409))))

(assert (=> b!1014002 (= res!680599 (dynLambda!1879 lambda!658 (h!22650 lt!448211)))))

(declare-fun b!1014003 () Bool)

(assert (=> b!1014003 (= e!570409 (forall!239 (t!30448 lt!448211) lambda!658))))

(assert (= (and d!120469 (not res!680598)) b!1014002))

(assert (= (and b!1014002 res!680599) b!1014003))

(declare-fun b_lambda!15283 () Bool)

(assert (=> (not b_lambda!15283) (not b!1014002)))

(declare-fun m!936187 () Bool)

(assert (=> b!1014002 m!936187))

(declare-fun m!936189 () Bool)

(assert (=> b!1014003 m!936189))

(assert (=> d!120449 d!120469))

(declare-fun d!120471 () Bool)

(declare-fun res!680600 () Bool)

(declare-fun e!570410 () Bool)

(assert (=> d!120471 (=> res!680600 e!570410)))

(assert (=> d!120471 (= res!680600 (or ((_ is Nil!21454) (t!30449 l!412)) ((_ is Nil!21454) (t!30449 (t!30449 l!412)))))))

(assert (=> d!120471 (= (isStrictlySorted!563 (t!30449 l!412)) e!570410)))

(declare-fun b!1014004 () Bool)

(declare-fun e!570411 () Bool)

(assert (=> b!1014004 (= e!570410 e!570411)))

(declare-fun res!680601 () Bool)

(assert (=> b!1014004 (=> (not res!680601) (not e!570411))))

(assert (=> b!1014004 (= res!680601 (bvslt (_1!7617 (h!22651 (t!30449 l!412))) (_1!7617 (h!22651 (t!30449 (t!30449 l!412))))))))

(declare-fun b!1014005 () Bool)

(assert (=> b!1014005 (= e!570411 (isStrictlySorted!563 (t!30449 (t!30449 l!412))))))

(assert (= (and d!120471 (not res!680600)) b!1014004))

(assert (= (and b!1014004 res!680601) b!1014005))

(declare-fun m!936191 () Bool)

(assert (=> b!1014005 m!936191))

(assert (=> d!120449 d!120471))

(declare-fun d!120473 () Bool)

(declare-fun res!680602 () Bool)

(declare-fun e!570412 () Bool)

(assert (=> d!120473 (=> res!680602 e!570412)))

(assert (=> d!120473 (= res!680602 ((_ is Nil!21453) (t!30448 (Cons!21452 (_1!7617 (h!22651 l!412)) lt!448094))))))

(assert (=> d!120473 (= (forall!239 (t!30448 (Cons!21452 (_1!7617 (h!22651 l!412)) lt!448094)) lambda!602) e!570412)))

(declare-fun b!1014006 () Bool)

(declare-fun e!570413 () Bool)

(assert (=> b!1014006 (= e!570412 e!570413)))

(declare-fun res!680603 () Bool)

(assert (=> b!1014006 (=> (not res!680603) (not e!570413))))

(assert (=> b!1014006 (= res!680603 (dynLambda!1879 lambda!602 (h!22650 (t!30448 (Cons!21452 (_1!7617 (h!22651 l!412)) lt!448094)))))))

(declare-fun b!1014007 () Bool)

(assert (=> b!1014007 (= e!570413 (forall!239 (t!30448 (t!30448 (Cons!21452 (_1!7617 (h!22651 l!412)) lt!448094))) lambda!602))))

(assert (= (and d!120473 (not res!680602)) b!1014006))

(assert (= (and b!1014006 res!680603) b!1014007))

(declare-fun b_lambda!15285 () Bool)

(assert (=> (not b_lambda!15285) (not b!1014006)))

(declare-fun m!936193 () Bool)

(assert (=> b!1014006 m!936193))

(declare-fun m!936195 () Bool)

(assert (=> b!1014007 m!936195))

(assert (=> b!1013904 d!120473))

(assert (=> b!1013845 d!120471))

(declare-fun bs!29041 () Bool)

(declare-fun b!1014011 () Bool)

(assert (= bs!29041 (and b!1014011 b!1013968)))

(declare-fun lt!448233 () tuple2!15212)

(declare-fun lt!448238 () List!21457)

(declare-fun lambda!660 () Int)

(assert (=> bs!29041 (= (= (Cons!21453 lt!448233 lt!448238) (Cons!21453 lt!448209 lt!448214)) (= lambda!660 lambda!653))))

(declare-fun bs!29042 () Bool)

(assert (= bs!29042 (and b!1014011 b!1013793)))

(assert (=> bs!29042 (= (= (Cons!21453 lt!448233 lt!448238) l!412) (= lambda!660 lambda!602))))

(declare-fun bs!29043 () Bool)

(assert (= bs!29043 (and b!1014011 b!1013871)))

(assert (=> bs!29043 (= (= (Cons!21453 lt!448233 lt!448238) (t!30449 l!412)) (= lambda!660 lambda!629))))

(declare-fun bs!29044 () Bool)

(assert (= bs!29044 (and b!1014011 d!120449)))

(assert (=> bs!29044 (= (= (Cons!21453 lt!448233 lt!448238) (t!30449 l!412)) (= lambda!660 lambda!658))))

(declare-fun bs!29045 () Bool)

(assert (= bs!29045 (and b!1014011 b!1013970)))

(assert (=> bs!29045 (= (= (Cons!21453 lt!448233 lt!448238) (Cons!21453 lt!448218 lt!448215)) (= lambda!660 lambda!656))))

(declare-fun bs!29046 () Bool)

(assert (= bs!29046 (and b!1014011 d!120427)))

(assert (=> bs!29046 (= (= (Cons!21453 lt!448233 lt!448238) (Cons!21453 (h!22651 l!412) (t!30449 l!412))) (= lambda!660 lambda!632))))

(declare-fun bs!29047 () Bool)

(assert (= bs!29047 (and b!1014011 b!1013794)))

(assert (=> bs!29047 (= (= (Cons!21453 lt!448233 lt!448238) l!412) (= lambda!660 lambda!601))))

(assert (=> b!1014011 true))

(assert (=> b!1014011 true))

(assert (=> b!1014011 true))

(declare-fun bs!29048 () Bool)

(declare-fun b!1014013 () Bool)

(assert (= bs!29048 (and b!1014013 b!1013968)))

(declare-fun lt!448242 () tuple2!15212)

(declare-fun lt!448239 () List!21457)

(declare-fun lambda!661 () Int)

(assert (=> bs!29048 (= (= (Cons!21453 lt!448242 lt!448239) (Cons!21453 lt!448209 lt!448214)) (= lambda!661 lambda!653))))

(declare-fun bs!29049 () Bool)

(assert (= bs!29049 (and b!1014013 b!1013793)))

(assert (=> bs!29049 (= (= (Cons!21453 lt!448242 lt!448239) l!412) (= lambda!661 lambda!602))))

(declare-fun bs!29050 () Bool)

(assert (= bs!29050 (and b!1014013 b!1014011)))

(assert (=> bs!29050 (= (= (Cons!21453 lt!448242 lt!448239) (Cons!21453 lt!448233 lt!448238)) (= lambda!661 lambda!660))))

(declare-fun bs!29051 () Bool)

(assert (= bs!29051 (and b!1014013 b!1013871)))

(assert (=> bs!29051 (= (= (Cons!21453 lt!448242 lt!448239) (t!30449 l!412)) (= lambda!661 lambda!629))))

(declare-fun bs!29052 () Bool)

(assert (= bs!29052 (and b!1014013 d!120449)))

(assert (=> bs!29052 (= (= (Cons!21453 lt!448242 lt!448239) (t!30449 l!412)) (= lambda!661 lambda!658))))

(declare-fun bs!29053 () Bool)

(assert (= bs!29053 (and b!1014013 b!1013970)))

(assert (=> bs!29053 (= (= (Cons!21453 lt!448242 lt!448239) (Cons!21453 lt!448218 lt!448215)) (= lambda!661 lambda!656))))

(declare-fun bs!29054 () Bool)

(assert (= bs!29054 (and b!1014013 d!120427)))

(assert (=> bs!29054 (= (= (Cons!21453 lt!448242 lt!448239) (Cons!21453 (h!22651 l!412) (t!30449 l!412))) (= lambda!661 lambda!632))))

(declare-fun bs!29055 () Bool)

(assert (= bs!29055 (and b!1014013 b!1013794)))

(assert (=> bs!29055 (= (= (Cons!21453 lt!448242 lt!448239) l!412) (= lambda!661 lambda!601))))

(assert (=> b!1014013 true))

(assert (=> b!1014013 true))

(assert (=> b!1014013 true))

(declare-fun bs!29056 () Bool)

(declare-fun d!120475 () Bool)

(assert (= bs!29056 (and d!120475 b!1013968)))

(declare-fun lambda!662 () Int)

(assert (=> bs!29056 (= (= (t!30449 (t!30449 l!412)) (Cons!21453 lt!448209 lt!448214)) (= lambda!662 lambda!653))))

(declare-fun bs!29057 () Bool)

(assert (= bs!29057 (and d!120475 b!1013793)))

(assert (=> bs!29057 (= (= (t!30449 (t!30449 l!412)) l!412) (= lambda!662 lambda!602))))

(declare-fun bs!29058 () Bool)

(assert (= bs!29058 (and d!120475 b!1014011)))

(assert (=> bs!29058 (= (= (t!30449 (t!30449 l!412)) (Cons!21453 lt!448233 lt!448238)) (= lambda!662 lambda!660))))

(declare-fun bs!29059 () Bool)

(assert (= bs!29059 (and d!120475 b!1014013)))

(assert (=> bs!29059 (= (= (t!30449 (t!30449 l!412)) (Cons!21453 lt!448242 lt!448239)) (= lambda!662 lambda!661))))

(declare-fun bs!29060 () Bool)

(assert (= bs!29060 (and d!120475 b!1013871)))

(assert (=> bs!29060 (= (= (t!30449 (t!30449 l!412)) (t!30449 l!412)) (= lambda!662 lambda!629))))

(declare-fun bs!29061 () Bool)

(assert (= bs!29061 (and d!120475 d!120449)))

(assert (=> bs!29061 (= (= (t!30449 (t!30449 l!412)) (t!30449 l!412)) (= lambda!662 lambda!658))))

(declare-fun bs!29062 () Bool)

(assert (= bs!29062 (and d!120475 b!1013970)))

(assert (=> bs!29062 (= (= (t!30449 (t!30449 l!412)) (Cons!21453 lt!448218 lt!448215)) (= lambda!662 lambda!656))))

(declare-fun bs!29063 () Bool)

(assert (= bs!29063 (and d!120475 d!120427)))

(assert (=> bs!29063 (= (= (t!30449 (t!30449 l!412)) (Cons!21453 (h!22651 l!412) (t!30449 l!412))) (= lambda!662 lambda!632))))

(declare-fun bs!29064 () Bool)

(assert (= bs!29064 (and d!120475 b!1013794)))

(assert (=> bs!29064 (= (= (t!30449 (t!30449 l!412)) l!412) (= lambda!662 lambda!601))))

(assert (=> d!120475 true))

(assert (=> d!120475 true))

(declare-fun c!102579 () Bool)

(declare-fun call!42743 () Bool)

(declare-fun lt!448232 () List!21456)

(declare-fun lt!448234 () List!21456)

(declare-fun bm!42740 () Bool)

(assert (=> bm!42740 (= call!42743 (forall!239 (ite c!102579 lt!448234 lt!448232) (ite c!102579 lambda!660 lambda!661)))))

(declare-fun b!1014008 () Bool)

(declare-fun e!570416 () List!21456)

(declare-fun e!570415 () List!21456)

(assert (=> b!1014008 (= e!570416 e!570415)))

(declare-fun c!102578 () Bool)

(assert (=> b!1014008 (= c!102578 (and ((_ is Cons!21453) (t!30449 (t!30449 l!412))) (not (= (_2!7617 (h!22651 (t!30449 (t!30449 l!412)))) value!115))))))

(declare-fun b!1014009 () Bool)

(declare-fun lt!448241 () Unit!33040)

(declare-fun e!570414 () Unit!33040)

(assert (=> b!1014009 (= lt!448241 e!570414)))

(declare-fun c!102581 () Bool)

(declare-fun call!42744 () Bool)

(assert (=> b!1014009 (= c!102581 (not call!42744))))

(declare-fun lt!448240 () List!21456)

(declare-fun call!42745 () List!21456)

(assert (=> b!1014009 (= lt!448240 call!42745)))

(assert (=> b!1014009 (= e!570415 call!42745)))

(declare-fun b!1014010 () Bool)

(declare-fun e!570417 () Unit!33040)

(declare-fun Unit!33055 () Unit!33040)

(assert (=> b!1014010 (= e!570417 Unit!33055)))

(declare-fun bm!42741 () Bool)

(declare-fun call!42746 () Unit!33040)

(assert (=> bm!42741 (= call!42746 (lemmaForallGetValueByKeySameWithASmallerHead!34 (ite c!102579 lt!448238 lt!448239) (ite c!102579 lt!448234 lt!448232) value!115 (ite c!102579 lt!448233 lt!448242)))))

(assert (=> b!1014011 call!42743))

(declare-fun lt!448237 () Unit!33040)

(assert (=> b!1014011 (= lt!448237 call!42746)))

(assert (=> b!1014011 (= lt!448233 (h!22651 (t!30449 (t!30449 l!412))))))

(assert (=> b!1014011 (= lt!448234 call!42745)))

(assert (=> b!1014011 (= lt!448238 (t!30449 (t!30449 (t!30449 l!412))))))

(assert (=> b!1014011 (= e!570417 lt!448237)))

(declare-fun b!1014012 () Bool)

(assert (=> b!1014012 (= e!570416 (Cons!21452 (_1!7617 (h!22651 (t!30449 (t!30449 l!412)))) call!42745))))

(declare-fun c!102580 () Bool)

(assert (=> b!1014012 (= c!102580 (not call!42744))))

(declare-fun lt!448243 () Unit!33040)

(assert (=> b!1014012 (= lt!448243 e!570417)))

(declare-fun lt!448235 () List!21456)

(assert (=> d!120475 (forall!239 lt!448235 lambda!662)))

(assert (=> d!120475 (= lt!448235 e!570416)))

(assert (=> d!120475 (= c!102579 (and ((_ is Cons!21453) (t!30449 (t!30449 l!412))) (= (_2!7617 (h!22651 (t!30449 (t!30449 l!412)))) value!115)))))

(assert (=> d!120475 (isStrictlySorted!563 (t!30449 (t!30449 l!412)))))

(assert (=> d!120475 (= (getKeysOf!43 (t!30449 (t!30449 l!412)) value!115) lt!448235)))

(declare-fun bm!42742 () Bool)

(assert (=> bm!42742 (= call!42745 (getKeysOf!43 (t!30449 (t!30449 (t!30449 l!412))) value!115))))

(declare-fun lt!448236 () Unit!33040)

(assert (=> b!1014013 (= e!570414 lt!448236)))

(assert (=> b!1014013 (= lt!448239 (t!30449 (t!30449 (t!30449 l!412))))))

(assert (=> b!1014013 (= lt!448232 call!42745)))

(assert (=> b!1014013 (= lt!448242 (h!22651 (t!30449 (t!30449 l!412))))))

(assert (=> b!1014013 (= lt!448236 call!42746)))

(assert (=> b!1014013 call!42743))

(declare-fun bm!42743 () Bool)

(assert (=> bm!42743 (= call!42744 (isEmpty!833 call!42745))))

(declare-fun b!1014014 () Bool)

(assert (=> b!1014014 (= e!570415 Nil!21453)))

(declare-fun b!1014015 () Bool)

(declare-fun Unit!33056 () Unit!33040)

(assert (=> b!1014015 (= e!570414 Unit!33056)))

(assert (= (and d!120475 c!102579) b!1014012))

(assert (= (and d!120475 (not c!102579)) b!1014008))

(assert (= (and b!1014012 c!102580) b!1014011))

(assert (= (and b!1014012 (not c!102580)) b!1014010))

(assert (= (and b!1014008 c!102578) b!1014009))

(assert (= (and b!1014008 (not c!102578)) b!1014014))

(assert (= (and b!1014009 c!102581) b!1014013))

(assert (= (and b!1014009 (not c!102581)) b!1014015))

(assert (= (or b!1014011 b!1014013) bm!42741))

(assert (= (or b!1014011 b!1014013) bm!42740))

(assert (= (or b!1014012 b!1014011 b!1014009 b!1014013) bm!42742))

(assert (= (or b!1014012 b!1014009) bm!42743))

(declare-fun m!936197 () Bool)

(assert (=> bm!42741 m!936197))

(declare-fun m!936199 () Bool)

(assert (=> bm!42742 m!936199))

(declare-fun m!936201 () Bool)

(assert (=> bm!42740 m!936201))

(declare-fun m!936203 () Bool)

(assert (=> bm!42743 m!936203))

(declare-fun m!936205 () Bool)

(assert (=> d!120475 m!936205))

(assert (=> d!120475 m!936191))

(assert (=> bm!42734 d!120475))

(declare-fun b!1014027 () Bool)

(declare-fun e!570423 () Option!579)

(assert (=> b!1014027 (= e!570423 None!577)))

(declare-fun b!1014025 () Bool)

(declare-fun e!570422 () Option!579)

(assert (=> b!1014025 (= e!570422 e!570423)))

(declare-fun c!102587 () Bool)

(assert (=> b!1014025 (= c!102587 (and ((_ is Cons!21453) l!412) (not (= (_1!7617 (h!22651 l!412)) (h!22650 (Cons!21452 (_1!7617 (h!22651 l!412)) lt!448094))))))))

(declare-fun d!120477 () Bool)

(declare-fun c!102586 () Bool)

(assert (=> d!120477 (= c!102586 (and ((_ is Cons!21453) l!412) (= (_1!7617 (h!22651 l!412)) (h!22650 (Cons!21452 (_1!7617 (h!22651 l!412)) lt!448094)))))))

(assert (=> d!120477 (= (getValueByKey!528 l!412 (h!22650 (Cons!21452 (_1!7617 (h!22651 l!412)) lt!448094))) e!570422)))

(declare-fun b!1014024 () Bool)

(assert (=> b!1014024 (= e!570422 (Some!578 (_2!7617 (h!22651 l!412))))))

(declare-fun b!1014026 () Bool)

(assert (=> b!1014026 (= e!570423 (getValueByKey!528 (t!30449 l!412) (h!22650 (Cons!21452 (_1!7617 (h!22651 l!412)) lt!448094))))))

(assert (= (and d!120477 c!102586) b!1014024))

(assert (= (and d!120477 (not c!102586)) b!1014025))

(assert (= (and b!1014025 c!102587) b!1014026))

(assert (= (and b!1014025 (not c!102587)) b!1014027))

(declare-fun m!936207 () Bool)

(assert (=> b!1014026 m!936207))

(assert (=> bs!29035 d!120477))

(declare-fun d!120479 () Bool)

(assert (=> d!120479 (= (isEmpty!833 call!42737) ((_ is Nil!21453) call!42737))))

(assert (=> bm!42735 d!120479))

(declare-fun b!1014031 () Bool)

(declare-fun e!570425 () Option!579)

(assert (=> b!1014031 (= e!570425 None!577)))

(declare-fun b!1014029 () Bool)

(declare-fun e!570424 () Option!579)

(assert (=> b!1014029 (= e!570424 e!570425)))

(declare-fun c!102589 () Bool)

(assert (=> b!1014029 (= c!102589 (and ((_ is Cons!21453) l!412) (not (= (_1!7617 (h!22651 l!412)) (h!22650 lt!448094)))))))

(declare-fun d!120481 () Bool)

(declare-fun c!102588 () Bool)

(assert (=> d!120481 (= c!102588 (and ((_ is Cons!21453) l!412) (= (_1!7617 (h!22651 l!412)) (h!22650 lt!448094))))))

(assert (=> d!120481 (= (getValueByKey!528 l!412 (h!22650 lt!448094)) e!570424)))

(declare-fun b!1014028 () Bool)

(assert (=> b!1014028 (= e!570424 (Some!578 (_2!7617 (h!22651 l!412))))))

(declare-fun b!1014030 () Bool)

(assert (=> b!1014030 (= e!570425 (getValueByKey!528 (t!30449 l!412) (h!22650 lt!448094)))))

(assert (= (and d!120481 c!102588) b!1014028))

(assert (= (and d!120481 (not c!102588)) b!1014029))

(assert (= (and b!1014029 c!102589) b!1014030))

(assert (= (and b!1014029 (not c!102589)) b!1014031))

(declare-fun m!936209 () Bool)

(assert (=> b!1014030 m!936209))

(assert (=> bs!29037 d!120481))

(declare-fun d!120483 () Bool)

(declare-fun res!680604 () Bool)

(declare-fun e!570426 () Bool)

(assert (=> d!120483 (=> res!680604 e!570426)))

(assert (=> d!120483 (= res!680604 ((_ is Nil!21453) (ite c!102571 lt!448210 lt!448208)))))

(assert (=> d!120483 (= (forall!239 (ite c!102571 lt!448210 lt!448208) (ite c!102571 lambda!653 lambda!656)) e!570426)))

(declare-fun b!1014032 () Bool)

(declare-fun e!570427 () Bool)

(assert (=> b!1014032 (= e!570426 e!570427)))

(declare-fun res!680605 () Bool)

(assert (=> b!1014032 (=> (not res!680605) (not e!570427))))

(assert (=> b!1014032 (= res!680605 (dynLambda!1879 (ite c!102571 lambda!653 lambda!656) (h!22650 (ite c!102571 lt!448210 lt!448208))))))

(declare-fun b!1014033 () Bool)

(assert (=> b!1014033 (= e!570427 (forall!239 (t!30448 (ite c!102571 lt!448210 lt!448208)) (ite c!102571 lambda!653 lambda!656)))))

(assert (= (and d!120483 (not res!680604)) b!1014032))

(assert (= (and b!1014032 res!680605) b!1014033))

(declare-fun b_lambda!15287 () Bool)

(assert (=> (not b_lambda!15287) (not b!1014032)))

(declare-fun m!936211 () Bool)

(assert (=> b!1014032 m!936211))

(declare-fun m!936213 () Bool)

(assert (=> b!1014033 m!936213))

(assert (=> bm!42732 d!120483))

(declare-fun d!120485 () Bool)

(assert (=> d!120485 (= (isEmpty!837 (t!30449 l!412)) ((_ is Nil!21454) (t!30449 l!412)))))

(assert (=> b!1013870 d!120485))

(declare-fun d!120487 () Bool)

(declare-fun res!680606 () Bool)

(declare-fun e!570428 () Bool)

(assert (=> d!120487 (=> res!680606 e!570428)))

(assert (=> d!120487 (= res!680606 ((_ is Nil!21453) lt!448094))))

(assert (=> d!120487 (= (forall!239 lt!448094 lambda!632) e!570428)))

(declare-fun b!1014034 () Bool)

(declare-fun e!570429 () Bool)

(assert (=> b!1014034 (= e!570428 e!570429)))

(declare-fun res!680607 () Bool)

(assert (=> b!1014034 (=> (not res!680607) (not e!570429))))

(assert (=> b!1014034 (= res!680607 (dynLambda!1879 lambda!632 (h!22650 lt!448094)))))

(declare-fun b!1014035 () Bool)

(assert (=> b!1014035 (= e!570429 (forall!239 (t!30448 lt!448094) lambda!632))))

(assert (= (and d!120487 (not res!680606)) b!1014034))

(assert (= (and b!1014034 res!680607) b!1014035))

(declare-fun b_lambda!15289 () Bool)

(assert (=> (not b_lambda!15289) (not b!1014034)))

(declare-fun m!936215 () Bool)

(assert (=> b!1014034 m!936215))

(declare-fun m!936217 () Bool)

(assert (=> b!1014035 m!936217))

(assert (=> d!120427 d!120487))

(declare-fun bs!29065 () Bool)

(declare-fun d!120489 () Bool)

(assert (= bs!29065 (and d!120489 b!1013968)))

(declare-fun lambda!665 () Int)

(assert (=> bs!29065 (= (= (Cons!21453 (h!22651 l!412) (t!30449 l!412)) (Cons!21453 lt!448209 lt!448214)) (= lambda!665 lambda!653))))

(declare-fun bs!29066 () Bool)

(assert (= bs!29066 (and d!120489 b!1013793)))

(assert (=> bs!29066 (= (= (Cons!21453 (h!22651 l!412) (t!30449 l!412)) l!412) (= lambda!665 lambda!602))))

(declare-fun bs!29067 () Bool)

(assert (= bs!29067 (and d!120489 b!1014011)))

(assert (=> bs!29067 (= (= (Cons!21453 (h!22651 l!412) (t!30449 l!412)) (Cons!21453 lt!448233 lt!448238)) (= lambda!665 lambda!660))))

(declare-fun bs!29068 () Bool)

(assert (= bs!29068 (and d!120489 b!1014013)))

(assert (=> bs!29068 (= (= (Cons!21453 (h!22651 l!412) (t!30449 l!412)) (Cons!21453 lt!448242 lt!448239)) (= lambda!665 lambda!661))))

(declare-fun bs!29069 () Bool)

(assert (= bs!29069 (and d!120489 b!1013871)))

(assert (=> bs!29069 (= (= (Cons!21453 (h!22651 l!412) (t!30449 l!412)) (t!30449 l!412)) (= lambda!665 lambda!629))))

(declare-fun bs!29070 () Bool)

(assert (= bs!29070 (and d!120489 d!120449)))

(assert (=> bs!29070 (= (= (Cons!21453 (h!22651 l!412) (t!30449 l!412)) (t!30449 l!412)) (= lambda!665 lambda!658))))

(declare-fun bs!29071 () Bool)

(assert (= bs!29071 (and d!120489 b!1013970)))

(assert (=> bs!29071 (= (= (Cons!21453 (h!22651 l!412) (t!30449 l!412)) (Cons!21453 lt!448218 lt!448215)) (= lambda!665 lambda!656))))

(declare-fun bs!29072 () Bool)

(assert (= bs!29072 (and d!120489 d!120427)))

(assert (=> bs!29072 (= lambda!665 lambda!632)))

(declare-fun bs!29073 () Bool)

(assert (= bs!29073 (and d!120489 b!1013794)))

(assert (=> bs!29073 (= (= (Cons!21453 (h!22651 l!412) (t!30449 l!412)) l!412) (= lambda!665 lambda!601))))

(declare-fun bs!29074 () Bool)

(assert (= bs!29074 (and d!120489 d!120475)))

(assert (=> bs!29074 (= (= (Cons!21453 (h!22651 l!412) (t!30449 l!412)) (t!30449 (t!30449 l!412))) (= lambda!665 lambda!662))))

(assert (=> d!120489 true))

(assert (=> d!120489 true))

(assert (=> d!120489 true))

(assert (=> d!120489 (forall!239 lt!448094 lambda!665)))

(assert (=> d!120489 true))

(declare-fun _$15!110 () Unit!33040)

(assert (=> d!120489 (= (choose!1643 (t!30449 l!412) lt!448094 value!115 (h!22651 l!412)) _$15!110)))

(declare-fun bs!29075 () Bool)

(assert (= bs!29075 d!120489))

(declare-fun m!936219 () Bool)

(assert (=> bs!29075 m!936219))

(assert (=> d!120427 d!120489))

(assert (=> d!120427 d!120471))

(declare-fun d!120491 () Bool)

(declare-fun res!680608 () Bool)

(declare-fun e!570430 () Bool)

(assert (=> d!120491 (=> res!680608 e!570430)))

(assert (=> d!120491 (= res!680608 ((_ is Nil!21453) (t!30448 lt!448094)))))

(assert (=> d!120491 (= (forall!239 (t!30448 lt!448094) lambda!601) e!570430)))

(declare-fun b!1014036 () Bool)

(declare-fun e!570431 () Bool)

(assert (=> b!1014036 (= e!570430 e!570431)))

(declare-fun res!680609 () Bool)

(assert (=> b!1014036 (=> (not res!680609) (not e!570431))))

(assert (=> b!1014036 (= res!680609 (dynLambda!1879 lambda!601 (h!22650 (t!30448 lt!448094))))))

(declare-fun b!1014037 () Bool)

(assert (=> b!1014037 (= e!570431 (forall!239 (t!30448 (t!30448 lt!448094)) lambda!601))))

(assert (= (and d!120491 (not res!680608)) b!1014036))

(assert (= (and b!1014036 res!680609) b!1014037))

(declare-fun b_lambda!15291 () Bool)

(assert (=> (not b_lambda!15291) (not b!1014036)))

(declare-fun m!936221 () Bool)

(assert (=> b!1014036 m!936221))

(declare-fun m!936223 () Bool)

(assert (=> b!1014037 m!936223))

(assert (=> b!1013902 d!120491))

(declare-fun d!120493 () Bool)

(declare-fun res!680610 () Bool)

(declare-fun e!570432 () Bool)

(assert (=> d!120493 (=> res!680610 e!570432)))

(assert (=> d!120493 (= res!680610 ((_ is Nil!21453) lt!448094))))

(assert (=> d!120493 (= (forall!239 lt!448094 lambda!629) e!570432)))

(declare-fun b!1014038 () Bool)

(declare-fun e!570433 () Bool)

(assert (=> b!1014038 (= e!570432 e!570433)))

(declare-fun res!680611 () Bool)

(assert (=> b!1014038 (=> (not res!680611) (not e!570433))))

(assert (=> b!1014038 (= res!680611 (dynLambda!1879 lambda!629 (h!22650 lt!448094)))))

(declare-fun b!1014039 () Bool)

(assert (=> b!1014039 (= e!570433 (forall!239 (t!30448 lt!448094) lambda!629))))

(assert (= (and d!120493 (not res!680610)) b!1014038))

(assert (= (and b!1014038 res!680611) b!1014039))

(declare-fun b_lambda!15293 () Bool)

(assert (=> (not b_lambda!15293) (not b!1014038)))

(declare-fun m!936225 () Bool)

(assert (=> b!1014038 m!936225))

(declare-fun m!936227 () Bool)

(assert (=> b!1014039 m!936227))

(assert (=> b!1013871 d!120493))

(declare-fun bs!29076 () Bool)

(declare-fun b!1014041 () Bool)

(assert (= bs!29076 (and b!1014041 b!1013968)))

(declare-fun lambda!666 () Int)

(assert (=> bs!29076 (= (= (ite c!102571 lt!448214 lt!448215) (Cons!21453 lt!448209 lt!448214)) (= lambda!666 lambda!653))))

(declare-fun bs!29077 () Bool)

(assert (= bs!29077 (and b!1014041 b!1013793)))

(assert (=> bs!29077 (= (= (ite c!102571 lt!448214 lt!448215) l!412) (= lambda!666 lambda!602))))

(declare-fun bs!29078 () Bool)

(assert (= bs!29078 (and b!1014041 b!1014011)))

(assert (=> bs!29078 (= (= (ite c!102571 lt!448214 lt!448215) (Cons!21453 lt!448233 lt!448238)) (= lambda!666 lambda!660))))

(declare-fun bs!29079 () Bool)

(assert (= bs!29079 (and b!1014041 b!1014013)))

(assert (=> bs!29079 (= (= (ite c!102571 lt!448214 lt!448215) (Cons!21453 lt!448242 lt!448239)) (= lambda!666 lambda!661))))

(declare-fun bs!29080 () Bool)

(assert (= bs!29080 (and b!1014041 d!120489)))

(assert (=> bs!29080 (= (= (ite c!102571 lt!448214 lt!448215) (Cons!21453 (h!22651 l!412) (t!30449 l!412))) (= lambda!666 lambda!665))))

(declare-fun bs!29081 () Bool)

(assert (= bs!29081 (and b!1014041 b!1013871)))

(assert (=> bs!29081 (= (= (ite c!102571 lt!448214 lt!448215) (t!30449 l!412)) (= lambda!666 lambda!629))))

(declare-fun bs!29082 () Bool)

(assert (= bs!29082 (and b!1014041 d!120449)))

(assert (=> bs!29082 (= (= (ite c!102571 lt!448214 lt!448215) (t!30449 l!412)) (= lambda!666 lambda!658))))

(declare-fun bs!29083 () Bool)

(assert (= bs!29083 (and b!1014041 b!1013970)))

(assert (=> bs!29083 (= (= (ite c!102571 lt!448214 lt!448215) (Cons!21453 lt!448218 lt!448215)) (= lambda!666 lambda!656))))

(declare-fun bs!29084 () Bool)

(assert (= bs!29084 (and b!1014041 d!120427)))

(assert (=> bs!29084 (= (= (ite c!102571 lt!448214 lt!448215) (Cons!21453 (h!22651 l!412) (t!30449 l!412))) (= lambda!666 lambda!632))))

(declare-fun bs!29085 () Bool)

(assert (= bs!29085 (and b!1014041 b!1013794)))

(assert (=> bs!29085 (= (= (ite c!102571 lt!448214 lt!448215) l!412) (= lambda!666 lambda!601))))

(declare-fun bs!29086 () Bool)

(assert (= bs!29086 (and b!1014041 d!120475)))

(assert (=> bs!29086 (= (= (ite c!102571 lt!448214 lt!448215) (t!30449 (t!30449 l!412))) (= lambda!666 lambda!662))))

(assert (=> b!1014041 true))

(assert (=> b!1014041 true))

(declare-fun bs!29088 () Bool)

(declare-fun d!120495 () Bool)

(assert (= bs!29088 (and d!120495 b!1013793)))

(declare-fun lambda!668 () Int)

(assert (=> bs!29088 (= (= (Cons!21453 (ite c!102571 lt!448209 lt!448218) (ite c!102571 lt!448214 lt!448215)) l!412) (= lambda!668 lambda!602))))

(declare-fun bs!29090 () Bool)

(assert (= bs!29090 (and d!120495 b!1014011)))

(assert (=> bs!29090 (= (= (Cons!21453 (ite c!102571 lt!448209 lt!448218) (ite c!102571 lt!448214 lt!448215)) (Cons!21453 lt!448233 lt!448238)) (= lambda!668 lambda!660))))

(declare-fun bs!29092 () Bool)

(assert (= bs!29092 (and d!120495 b!1014013)))

(assert (=> bs!29092 (= (= (Cons!21453 (ite c!102571 lt!448209 lt!448218) (ite c!102571 lt!448214 lt!448215)) (Cons!21453 lt!448242 lt!448239)) (= lambda!668 lambda!661))))

(declare-fun bs!29093 () Bool)

(assert (= bs!29093 (and d!120495 d!120489)))

(assert (=> bs!29093 (= (= (Cons!21453 (ite c!102571 lt!448209 lt!448218) (ite c!102571 lt!448214 lt!448215)) (Cons!21453 (h!22651 l!412) (t!30449 l!412))) (= lambda!668 lambda!665))))

(declare-fun bs!29095 () Bool)

(assert (= bs!29095 (and d!120495 b!1013871)))

(assert (=> bs!29095 (= (= (Cons!21453 (ite c!102571 lt!448209 lt!448218) (ite c!102571 lt!448214 lt!448215)) (t!30449 l!412)) (= lambda!668 lambda!629))))

(declare-fun bs!29097 () Bool)

(assert (= bs!29097 (and d!120495 d!120449)))

(assert (=> bs!29097 (= (= (Cons!21453 (ite c!102571 lt!448209 lt!448218) (ite c!102571 lt!448214 lt!448215)) (t!30449 l!412)) (= lambda!668 lambda!658))))

(declare-fun bs!29099 () Bool)

(assert (= bs!29099 (and d!120495 b!1013970)))

(assert (=> bs!29099 (= (= (Cons!21453 (ite c!102571 lt!448209 lt!448218) (ite c!102571 lt!448214 lt!448215)) (Cons!21453 lt!448218 lt!448215)) (= lambda!668 lambda!656))))

(declare-fun bs!29101 () Bool)

(assert (= bs!29101 (and d!120495 d!120427)))

(assert (=> bs!29101 (= (= (Cons!21453 (ite c!102571 lt!448209 lt!448218) (ite c!102571 lt!448214 lt!448215)) (Cons!21453 (h!22651 l!412) (t!30449 l!412))) (= lambda!668 lambda!632))))

(declare-fun bs!29102 () Bool)

(assert (= bs!29102 (and d!120495 b!1013968)))

(assert (=> bs!29102 (= (= (Cons!21453 (ite c!102571 lt!448209 lt!448218) (ite c!102571 lt!448214 lt!448215)) (Cons!21453 lt!448209 lt!448214)) (= lambda!668 lambda!653))))

(declare-fun bs!29103 () Bool)

(assert (= bs!29103 (and d!120495 b!1014041)))

(assert (=> bs!29103 (= (= (Cons!21453 (ite c!102571 lt!448209 lt!448218) (ite c!102571 lt!448214 lt!448215)) (ite c!102571 lt!448214 lt!448215)) (= lambda!668 lambda!666))))

(declare-fun bs!29104 () Bool)

(assert (= bs!29104 (and d!120495 b!1013794)))

(assert (=> bs!29104 (= (= (Cons!21453 (ite c!102571 lt!448209 lt!448218) (ite c!102571 lt!448214 lt!448215)) l!412) (= lambda!668 lambda!601))))

(declare-fun bs!29105 () Bool)

(assert (= bs!29105 (and d!120495 d!120475)))

(assert (=> bs!29105 (= (= (Cons!21453 (ite c!102571 lt!448209 lt!448218) (ite c!102571 lt!448214 lt!448215)) (t!30449 (t!30449 l!412))) (= lambda!668 lambda!662))))

(assert (=> d!120495 true))

(assert (=> d!120495 true))

(assert (=> d!120495 true))

(assert (=> d!120495 (forall!239 (ite c!102571 lt!448210 lt!448208) lambda!668)))

(declare-fun lt!448244 () Unit!33040)

(assert (=> d!120495 (= lt!448244 (choose!1643 (ite c!102571 lt!448214 lt!448215) (ite c!102571 lt!448210 lt!448208) value!115 (ite c!102571 lt!448209 lt!448218)))))

(declare-fun e!570434 () Bool)

(assert (=> d!120495 e!570434))

(declare-fun res!680614 () Bool)

(assert (=> d!120495 (=> (not res!680614) (not e!570434))))

(assert (=> d!120495 (= res!680614 (isStrictlySorted!563 (ite c!102571 lt!448214 lt!448215)))))

(assert (=> d!120495 (= (lemmaForallGetValueByKeySameWithASmallerHead!34 (ite c!102571 lt!448214 lt!448215) (ite c!102571 lt!448210 lt!448208) value!115 (ite c!102571 lt!448209 lt!448218)) lt!448244)))

(declare-fun b!1014040 () Bool)

(declare-fun res!680612 () Bool)

(assert (=> b!1014040 (=> (not res!680612) (not e!570434))))

(assert (=> b!1014040 (= res!680612 (not (isEmpty!837 (ite c!102571 lt!448214 lt!448215))))))

(declare-fun res!680613 () Bool)

(assert (=> b!1014041 (=> (not res!680613) (not e!570434))))

(assert (=> b!1014041 (= res!680613 (forall!239 (ite c!102571 lt!448210 lt!448208) lambda!666))))

(declare-fun b!1014042 () Bool)

(assert (=> b!1014042 (= e!570434 (bvslt (_1!7617 (ite c!102571 lt!448209 lt!448218)) (_1!7617 (head!938 (ite c!102571 lt!448214 lt!448215)))))))

(assert (= (and d!120495 res!680614) b!1014040))

(assert (= (and b!1014040 res!680612) b!1014041))

(assert (= (and b!1014041 res!680613) b!1014042))

(declare-fun m!936233 () Bool)

(assert (=> d!120495 m!936233))

(declare-fun m!936235 () Bool)

(assert (=> d!120495 m!936235))

(declare-fun m!936237 () Bool)

(assert (=> d!120495 m!936237))

(declare-fun m!936239 () Bool)

(assert (=> b!1014040 m!936239))

(declare-fun m!936241 () Bool)

(assert (=> b!1014041 m!936241))

(declare-fun m!936243 () Bool)

(assert (=> b!1014042 m!936243))

(assert (=> bm!42733 d!120495))

(declare-fun d!120501 () Bool)

(assert (=> d!120501 (= (head!938 (t!30449 l!412)) (h!22651 (t!30449 l!412)))))

(assert (=> b!1013872 d!120501))

(declare-fun b!1014048 () Bool)

(declare-fun e!570438 () Bool)

(declare-fun tp!70498 () Bool)

(assert (=> b!1014048 (= e!570438 (and tp_is_empty!23485 tp!70498))))

(assert (=> b!1013995 (= tp!70493 e!570438)))

(assert (= (and b!1013995 ((_ is Cons!21453) (t!30449 (t!30449 l!412)))) b!1014048))

(declare-fun b_lambda!15297 () Bool)

(assert (= b_lambda!15289 (or d!120427 b_lambda!15297)))

(declare-fun bs!29114 () Bool)

(declare-fun d!120505 () Bool)

(assert (= bs!29114 (and d!120505 d!120427)))

(assert (=> bs!29114 (= (dynLambda!1879 lambda!632 (h!22650 lt!448094)) (= (getValueByKey!528 (Cons!21453 (h!22651 l!412) (t!30449 l!412)) (h!22650 lt!448094)) (Some!578 value!115)))))

(declare-fun m!936257 () Bool)

(assert (=> bs!29114 m!936257))

(assert (=> b!1014034 d!120505))

(declare-fun b_lambda!15299 () Bool)

(assert (= b_lambda!15283 (or d!120449 b_lambda!15299)))

(declare-fun bs!29115 () Bool)

(declare-fun d!120507 () Bool)

(assert (= bs!29115 (and d!120507 d!120449)))

(assert (=> bs!29115 (= (dynLambda!1879 lambda!658 (h!22650 lt!448211)) (= (getValueByKey!528 (t!30449 l!412) (h!22650 lt!448211)) (Some!578 value!115)))))

(declare-fun m!936259 () Bool)

(assert (=> bs!29115 m!936259))

(assert (=> b!1014002 d!120507))

(declare-fun b_lambda!15301 () Bool)

(assert (= b_lambda!15285 (or b!1013793 b_lambda!15301)))

(declare-fun bs!29116 () Bool)

(declare-fun d!120509 () Bool)

(assert (= bs!29116 (and d!120509 b!1013793)))

(assert (=> bs!29116 (= (dynLambda!1879 lambda!602 (h!22650 (t!30448 (Cons!21452 (_1!7617 (h!22651 l!412)) lt!448094)))) (= (getValueByKey!528 l!412 (h!22650 (t!30448 (Cons!21452 (_1!7617 (h!22651 l!412)) lt!448094)))) (Some!578 value!115)))))

(declare-fun m!936261 () Bool)

(assert (=> bs!29116 m!936261))

(assert (=> b!1014006 d!120509))

(declare-fun b_lambda!15303 () Bool)

(assert (= b_lambda!15291 (or b!1013794 b_lambda!15303)))

(declare-fun bs!29118 () Bool)

(declare-fun d!120511 () Bool)

(assert (= bs!29118 (and d!120511 b!1013794)))

(assert (=> bs!29118 (= (dynLambda!1879 lambda!601 (h!22650 (t!30448 lt!448094))) (= (getValueByKey!528 l!412 (h!22650 (t!30448 lt!448094))) (Some!578 value!115)))))

(declare-fun m!936263 () Bool)

(assert (=> bs!29118 m!936263))

(assert (=> b!1014036 d!120511))

(declare-fun b_lambda!15305 () Bool)

(assert (= b_lambda!15293 (or b!1013871 b_lambda!15305)))

(declare-fun bs!29120 () Bool)

(declare-fun d!120513 () Bool)

(assert (= bs!29120 (and d!120513 b!1013871)))

(assert (=> bs!29120 (= (dynLambda!1879 lambda!629 (h!22650 lt!448094)) (= (getValueByKey!528 (t!30449 l!412) (h!22650 lt!448094)) (Some!578 value!115)))))

(assert (=> bs!29120 m!936209))

(assert (=> b!1014038 d!120513))

(check-sat (not bm!42740) (not d!120489) (not bs!29118) tp_is_empty!23485 (not bm!42743) (not b!1014042) (not bs!29114) (not b_lambda!15273) (not b_lambda!15305) (not b_lambda!15299) (not bm!42741) (not b_lambda!15287) (not b!1014040) (not bm!42742) (not b!1014030) (not bs!29115) (not b!1014041) (not b_lambda!15303) (not b!1014048) (not b!1014007) (not b!1014003) (not bs!29116) (not bs!29120) (not b!1014039) (not b!1014026) (not b!1014005) (not b!1014035) (not b_lambda!15271) (not b_lambda!15297) (not b!1014033) (not d!120495) (not b_lambda!15301) (not b!1014037) (not d!120475))
(check-sat)
