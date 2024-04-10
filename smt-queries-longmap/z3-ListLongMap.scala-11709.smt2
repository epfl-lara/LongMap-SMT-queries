; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136984 () Bool)

(assert start!136984)

(declare-datatypes ((B!2596 0))(
  ( (B!2597 (val!19660 Int)) )
))
(declare-datatypes ((tuple2!25422 0))(
  ( (tuple2!25423 (_1!12722 (_ BitVec 64)) (_2!12722 B!2596)) )
))
(declare-datatypes ((List!36780 0))(
  ( (Nil!36777) (Cons!36776 (h!38319 tuple2!25422) (t!51694 List!36780)) )
))
(declare-fun lt!676533 () List!36780)

(declare-fun keyValue!4 () tuple2!25422)

(declare-datatypes ((Option!882 0))(
  ( (Some!881 (v!22373 B!2596)) (None!880) )
))
(declare-fun getValueByKey!806 (List!36780 (_ BitVec 64)) Option!882)

(assert (=> start!136984 (= (getValueByKey!806 lt!676533 (_1!12722 keyValue!4)) (Some!881 (_2!12722 keyValue!4)))))

(declare-datatypes ((Unit!52221 0))(
  ( (Unit!52222) )
))
(declare-fun lt!676534 () Unit!52221)

(declare-fun lemmaContainsTupThenGetReturnValue!392 (List!36780 (_ BitVec 64) B!2596) Unit!52221)

(assert (=> start!136984 (= lt!676534 (lemmaContainsTupThenGetReturnValue!392 lt!676533 (_1!12722 keyValue!4) (_2!12722 keyValue!4)))))

(declare-datatypes ((ListLongMap!22761 0))(
  ( (ListLongMap!22762 (toList!11396 List!36780)) )
))
(declare-fun thiss!201 () ListLongMap!22761)

(declare-fun insertStrictlySorted!612 (List!36780 (_ BitVec 64) B!2596) List!36780)

(assert (=> start!136984 (= lt!676533 (insertStrictlySorted!612 (toList!11396 thiss!201) (_1!12722 keyValue!4) (_2!12722 keyValue!4)))))

(declare-fun inv!58961 (ListLongMap!22761) Bool)

(assert (=> start!136984 (not (inv!58961 (ListLongMap!22762 lt!676533)))))

(declare-fun e!881120 () Bool)

(assert (=> start!136984 (and (inv!58961 thiss!201) e!881120)))

(declare-fun tp_is_empty!39141 () Bool)

(assert (=> start!136984 tp_is_empty!39141))

(declare-fun b!1579500 () Bool)

(declare-fun tp!114345 () Bool)

(assert (=> b!1579500 (= e!881120 tp!114345)))

(assert (= start!136984 b!1579500))

(declare-fun m!1451279 () Bool)

(assert (=> start!136984 m!1451279))

(declare-fun m!1451281 () Bool)

(assert (=> start!136984 m!1451281))

(declare-fun m!1451283 () Bool)

(assert (=> start!136984 m!1451283))

(declare-fun m!1451285 () Bool)

(assert (=> start!136984 m!1451285))

(declare-fun m!1451287 () Bool)

(assert (=> start!136984 m!1451287))

(check-sat (not start!136984) (not b!1579500) tp_is_empty!39141)
(check-sat)
(get-model)

(declare-fun d!166289 () Bool)

(assert (=> d!166289 (= (getValueByKey!806 lt!676533 (_1!12722 keyValue!4)) (Some!881 (_2!12722 keyValue!4)))))

(declare-fun lt!676546 () Unit!52221)

(declare-fun choose!2091 (List!36780 (_ BitVec 64) B!2596) Unit!52221)

(assert (=> d!166289 (= lt!676546 (choose!2091 lt!676533 (_1!12722 keyValue!4) (_2!12722 keyValue!4)))))

(declare-fun e!881135 () Bool)

(assert (=> d!166289 e!881135))

(declare-fun res!1079143 () Bool)

(assert (=> d!166289 (=> (not res!1079143) (not e!881135))))

(declare-fun isStrictlySorted!1040 (List!36780) Bool)

(assert (=> d!166289 (= res!1079143 (isStrictlySorted!1040 lt!676533))))

(assert (=> d!166289 (= (lemmaContainsTupThenGetReturnValue!392 lt!676533 (_1!12722 keyValue!4) (_2!12722 keyValue!4)) lt!676546)))

(declare-fun b!1579525 () Bool)

(declare-fun res!1079145 () Bool)

(assert (=> b!1579525 (=> (not res!1079145) (not e!881135))))

(declare-fun containsKey!886 (List!36780 (_ BitVec 64)) Bool)

(assert (=> b!1579525 (= res!1079145 (containsKey!886 lt!676533 (_1!12722 keyValue!4)))))

(declare-fun b!1579527 () Bool)

(declare-fun contains!10451 (List!36780 tuple2!25422) Bool)

(assert (=> b!1579527 (= e!881135 (contains!10451 lt!676533 (tuple2!25423 (_1!12722 keyValue!4) (_2!12722 keyValue!4))))))

(assert (= (and d!166289 res!1079143) b!1579525))

(assert (= (and b!1579525 res!1079145) b!1579527))

(assert (=> d!166289 m!1451279))

(declare-fun m!1451303 () Bool)

(assert (=> d!166289 m!1451303))

(declare-fun m!1451307 () Bool)

(assert (=> d!166289 m!1451307))

(declare-fun m!1451311 () Bool)

(assert (=> b!1579525 m!1451311))

(declare-fun m!1451315 () Bool)

(assert (=> b!1579527 m!1451315))

(assert (=> start!136984 d!166289))

(declare-fun d!166295 () Bool)

(assert (=> d!166295 (= (inv!58961 thiss!201) (isStrictlySorted!1040 (toList!11396 thiss!201)))))

(declare-fun bs!45748 () Bool)

(assert (= bs!45748 d!166295))

(declare-fun m!1451319 () Bool)

(assert (=> bs!45748 m!1451319))

(assert (=> start!136984 d!166295))

(declare-fun b!1579602 () Bool)

(declare-fun e!881176 () List!36780)

(assert (=> b!1579602 (= e!881176 (insertStrictlySorted!612 (t!51694 (toList!11396 thiss!201)) (_1!12722 keyValue!4) (_2!12722 keyValue!4)))))

(declare-fun b!1579603 () Bool)

(declare-fun e!881177 () List!36780)

(declare-fun call!72444 () List!36780)

(assert (=> b!1579603 (= e!881177 call!72444)))

(declare-fun b!1579604 () Bool)

(declare-fun c!146445 () Bool)

(get-info :version)

(assert (=> b!1579604 (= c!146445 (and ((_ is Cons!36776) (toList!11396 thiss!201)) (bvsgt (_1!12722 (h!38319 (toList!11396 thiss!201))) (_1!12722 keyValue!4))))))

(declare-fun e!881175 () List!36780)

(declare-fun e!881173 () List!36780)

(assert (=> b!1579604 (= e!881175 e!881173)))

(declare-fun b!1579605 () Bool)

(declare-fun call!72446 () List!36780)

(assert (=> b!1579605 (= e!881173 call!72446)))

(declare-fun b!1579606 () Bool)

(assert (=> b!1579606 (= e!881177 e!881175)))

(declare-fun c!146443 () Bool)

(assert (=> b!1579606 (= c!146443 (and ((_ is Cons!36776) (toList!11396 thiss!201)) (= (_1!12722 (h!38319 (toList!11396 thiss!201))) (_1!12722 keyValue!4))))))

(declare-fun b!1579607 () Bool)

(assert (=> b!1579607 (= e!881173 call!72446)))

(declare-fun c!146444 () Bool)

(declare-fun bm!72441 () Bool)

(declare-fun $colon$colon!1010 (List!36780 tuple2!25422) List!36780)

(assert (=> bm!72441 (= call!72444 ($colon$colon!1010 e!881176 (ite c!146444 (h!38319 (toList!11396 thiss!201)) (tuple2!25423 (_1!12722 keyValue!4) (_2!12722 keyValue!4)))))))

(declare-fun c!146446 () Bool)

(assert (=> bm!72441 (= c!146446 c!146444)))

(declare-fun bm!72442 () Bool)

(declare-fun call!72445 () List!36780)

(assert (=> bm!72442 (= call!72446 call!72445)))

(declare-fun b!1579609 () Bool)

(assert (=> b!1579609 (= e!881175 call!72445)))

(declare-fun b!1579610 () Bool)

(assert (=> b!1579610 (= e!881176 (ite c!146443 (t!51694 (toList!11396 thiss!201)) (ite c!146445 (Cons!36776 (h!38319 (toList!11396 thiss!201)) (t!51694 (toList!11396 thiss!201))) Nil!36777)))))

(declare-fun b!1579611 () Bool)

(declare-fun e!881174 () Bool)

(declare-fun lt!676556 () List!36780)

(assert (=> b!1579611 (= e!881174 (contains!10451 lt!676556 (tuple2!25423 (_1!12722 keyValue!4) (_2!12722 keyValue!4))))))

(declare-fun bm!72443 () Bool)

(assert (=> bm!72443 (= call!72445 call!72444)))

(declare-fun b!1579608 () Bool)

(declare-fun res!1079161 () Bool)

(assert (=> b!1579608 (=> (not res!1079161) (not e!881174))))

(assert (=> b!1579608 (= res!1079161 (containsKey!886 lt!676556 (_1!12722 keyValue!4)))))

(declare-fun d!166299 () Bool)

(assert (=> d!166299 e!881174))

(declare-fun res!1079160 () Bool)

(assert (=> d!166299 (=> (not res!1079160) (not e!881174))))

(assert (=> d!166299 (= res!1079160 (isStrictlySorted!1040 lt!676556))))

(assert (=> d!166299 (= lt!676556 e!881177)))

(assert (=> d!166299 (= c!146444 (and ((_ is Cons!36776) (toList!11396 thiss!201)) (bvslt (_1!12722 (h!38319 (toList!11396 thiss!201))) (_1!12722 keyValue!4))))))

(assert (=> d!166299 (isStrictlySorted!1040 (toList!11396 thiss!201))))

(assert (=> d!166299 (= (insertStrictlySorted!612 (toList!11396 thiss!201) (_1!12722 keyValue!4) (_2!12722 keyValue!4)) lt!676556)))

(assert (= (and d!166299 c!146444) b!1579603))

(assert (= (and d!166299 (not c!146444)) b!1579606))

(assert (= (and b!1579606 c!146443) b!1579609))

(assert (= (and b!1579606 (not c!146443)) b!1579604))

(assert (= (and b!1579604 c!146445) b!1579607))

(assert (= (and b!1579604 (not c!146445)) b!1579605))

(assert (= (or b!1579607 b!1579605) bm!72442))

(assert (= (or b!1579609 bm!72442) bm!72443))

(assert (= (or b!1579603 bm!72443) bm!72441))

(assert (= (and bm!72441 c!146446) b!1579602))

(assert (= (and bm!72441 (not c!146446)) b!1579610))

(assert (= (and d!166299 res!1079160) b!1579608))

(assert (= (and b!1579608 res!1079161) b!1579611))

(declare-fun m!1451331 () Bool)

(assert (=> b!1579608 m!1451331))

(declare-fun m!1451333 () Bool)

(assert (=> bm!72441 m!1451333))

(declare-fun m!1451335 () Bool)

(assert (=> b!1579611 m!1451335))

(declare-fun m!1451337 () Bool)

(assert (=> d!166299 m!1451337))

(assert (=> d!166299 m!1451319))

(declare-fun m!1451339 () Bool)

(assert (=> b!1579602 m!1451339))

(assert (=> start!136984 d!166299))

(declare-fun d!166305 () Bool)

(assert (=> d!166305 (= (inv!58961 (ListLongMap!22762 lt!676533)) (isStrictlySorted!1040 (toList!11396 (ListLongMap!22762 lt!676533))))))

(declare-fun bs!45749 () Bool)

(assert (= bs!45749 d!166305))

(declare-fun m!1451341 () Bool)

(assert (=> bs!45749 m!1451341))

(assert (=> start!136984 d!166305))

(declare-fun b!1579649 () Bool)

(declare-fun e!881196 () Option!882)

(declare-fun e!881197 () Option!882)

(assert (=> b!1579649 (= e!881196 e!881197)))

(declare-fun c!146460 () Bool)

(assert (=> b!1579649 (= c!146460 (and ((_ is Cons!36776) lt!676533) (not (= (_1!12722 (h!38319 lt!676533)) (_1!12722 keyValue!4)))))))

(declare-fun b!1579650 () Bool)

(assert (=> b!1579650 (= e!881197 (getValueByKey!806 (t!51694 lt!676533) (_1!12722 keyValue!4)))))

(declare-fun b!1579648 () Bool)

(assert (=> b!1579648 (= e!881196 (Some!881 (_2!12722 (h!38319 lt!676533))))))

(declare-fun d!166307 () Bool)

(declare-fun c!146459 () Bool)

(assert (=> d!166307 (= c!146459 (and ((_ is Cons!36776) lt!676533) (= (_1!12722 (h!38319 lt!676533)) (_1!12722 keyValue!4))))))

(assert (=> d!166307 (= (getValueByKey!806 lt!676533 (_1!12722 keyValue!4)) e!881196)))

(declare-fun b!1579651 () Bool)

(assert (=> b!1579651 (= e!881197 None!880)))

(assert (= (and d!166307 c!146459) b!1579648))

(assert (= (and d!166307 (not c!146459)) b!1579649))

(assert (= (and b!1579649 c!146460) b!1579650))

(assert (= (and b!1579649 (not c!146460)) b!1579651))

(declare-fun m!1451369 () Bool)

(assert (=> b!1579650 m!1451369))

(assert (=> start!136984 d!166307))

(declare-fun b!1579662 () Bool)

(declare-fun e!881204 () Bool)

(declare-fun tp!114357 () Bool)

(assert (=> b!1579662 (= e!881204 (and tp_is_empty!39141 tp!114357))))

(assert (=> b!1579500 (= tp!114345 e!881204)))

(assert (= (and b!1579500 ((_ is Cons!36776) (toList!11396 thiss!201))) b!1579662))

(check-sat (not b!1579525) tp_is_empty!39141 (not b!1579608) (not b!1579662) (not d!166289) (not b!1579650) (not d!166295) (not b!1579611) (not bm!72441) (not d!166305) (not d!166299) (not b!1579527) (not b!1579602))
(check-sat)
