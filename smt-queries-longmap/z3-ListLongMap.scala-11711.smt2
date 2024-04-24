; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137420 () Bool)

(assert start!137420)

(declare-datatypes ((B!2594 0))(
  ( (B!2595 (val!19659 Int)) )
))
(declare-datatypes ((tuple2!25480 0))(
  ( (tuple2!25481 (_1!12751 (_ BitVec 64)) (_2!12751 B!2594)) )
))
(declare-datatypes ((List!36811 0))(
  ( (Nil!36808) (Cons!36807 (h!38368 tuple2!25480) (t!51717 List!36811)) )
))
(declare-fun lt!677435 () List!36811)

(declare-fun keyValue!4 () tuple2!25480)

(declare-datatypes ((Option!876 0))(
  ( (Some!875 (v!22364 B!2594)) (None!874) )
))
(declare-fun getValueByKey!801 (List!36811 (_ BitVec 64)) Option!876)

(assert (=> start!137420 (= (getValueByKey!801 lt!677435 (_1!12751 keyValue!4)) (Some!875 (_2!12751 keyValue!4)))))

(declare-datatypes ((Unit!52128 0))(
  ( (Unit!52129) )
))
(declare-fun lt!677436 () Unit!52128)

(declare-fun lemmaContainsTupThenGetReturnValue!390 (List!36811 (_ BitVec 64) B!2594) Unit!52128)

(assert (=> start!137420 (= lt!677436 (lemmaContainsTupThenGetReturnValue!390 lt!677435 (_1!12751 keyValue!4) (_2!12751 keyValue!4)))))

(declare-datatypes ((ListLongMap!22827 0))(
  ( (ListLongMap!22828 (toList!11429 List!36811)) )
))
(declare-fun thiss!201 () ListLongMap!22827)

(declare-fun insertStrictlySorted!612 (List!36811 (_ BitVec 64) B!2594) List!36811)

(assert (=> start!137420 (= lt!677435 (insertStrictlySorted!612 (toList!11429 thiss!201) (_1!12751 keyValue!4) (_2!12751 keyValue!4)))))

(declare-fun inv!58970 (ListLongMap!22827) Bool)

(assert (=> start!137420 (not (inv!58970 (ListLongMap!22828 lt!677435)))))

(declare-fun e!882662 () Bool)

(assert (=> start!137420 (and (inv!58970 thiss!201) e!882662)))

(declare-fun tp_is_empty!39139 () Bool)

(assert (=> start!137420 tp_is_empty!39139))

(declare-fun b!1581987 () Bool)

(declare-fun tp!114342 () Bool)

(assert (=> b!1581987 (= e!882662 tp!114342)))

(assert (= start!137420 b!1581987))

(declare-fun m!1453581 () Bool)

(assert (=> start!137420 m!1453581))

(declare-fun m!1453583 () Bool)

(assert (=> start!137420 m!1453583))

(declare-fun m!1453585 () Bool)

(assert (=> start!137420 m!1453585))

(declare-fun m!1453587 () Bool)

(assert (=> start!137420 m!1453587))

(declare-fun m!1453589 () Bool)

(assert (=> start!137420 m!1453589))

(check-sat (not start!137420) (not b!1581987) tp_is_empty!39139)
(check-sat)
(get-model)

(declare-fun d!167007 () Bool)

(declare-fun isStrictlySorted!1028 (List!36811) Bool)

(assert (=> d!167007 (= (inv!58970 (ListLongMap!22828 lt!677435)) (isStrictlySorted!1028 (toList!11429 (ListLongMap!22828 lt!677435))))))

(declare-fun bs!45771 () Bool)

(assert (= bs!45771 d!167007))

(declare-fun m!1453611 () Bool)

(assert (=> bs!45771 m!1453611))

(assert (=> start!137420 d!167007))

(declare-fun d!167011 () Bool)

(assert (=> d!167011 (= (inv!58970 thiss!201) (isStrictlySorted!1028 (toList!11429 thiss!201)))))

(declare-fun bs!45772 () Bool)

(assert (= bs!45772 d!167011))

(declare-fun m!1453613 () Bool)

(assert (=> bs!45772 m!1453613))

(assert (=> start!137420 d!167011))

(declare-fun b!1582004 () Bool)

(declare-fun e!882674 () Option!876)

(assert (=> b!1582004 (= e!882674 (getValueByKey!801 (t!51717 lt!677435) (_1!12751 keyValue!4)))))

(declare-fun d!167013 () Bool)

(declare-fun c!147211 () Bool)

(get-info :version)

(assert (=> d!167013 (= c!147211 (and ((_ is Cons!36807) lt!677435) (= (_1!12751 (h!38368 lt!677435)) (_1!12751 keyValue!4))))))

(declare-fun e!882673 () Option!876)

(assert (=> d!167013 (= (getValueByKey!801 lt!677435 (_1!12751 keyValue!4)) e!882673)))

(declare-fun b!1582005 () Bool)

(assert (=> b!1582005 (= e!882674 None!874)))

(declare-fun b!1582002 () Bool)

(assert (=> b!1582002 (= e!882673 (Some!875 (_2!12751 (h!38368 lt!677435))))))

(declare-fun b!1582003 () Bool)

(assert (=> b!1582003 (= e!882673 e!882674)))

(declare-fun c!147212 () Bool)

(assert (=> b!1582003 (= c!147212 (and ((_ is Cons!36807) lt!677435) (not (= (_1!12751 (h!38368 lt!677435)) (_1!12751 keyValue!4)))))))

(assert (= (and d!167013 c!147211) b!1582002))

(assert (= (and d!167013 (not c!147211)) b!1582003))

(assert (= (and b!1582003 c!147212) b!1582004))

(assert (= (and b!1582003 (not c!147212)) b!1582005))

(declare-fun m!1453619 () Bool)

(assert (=> b!1582004 m!1453619))

(assert (=> start!137420 d!167013))

(declare-fun d!167019 () Bool)

(assert (=> d!167019 (= (getValueByKey!801 lt!677435 (_1!12751 keyValue!4)) (Some!875 (_2!12751 keyValue!4)))))

(declare-fun lt!677457 () Unit!52128)

(declare-fun choose!2083 (List!36811 (_ BitVec 64) B!2594) Unit!52128)

(assert (=> d!167019 (= lt!677457 (choose!2083 lt!677435 (_1!12751 keyValue!4) (_2!12751 keyValue!4)))))

(declare-fun e!882683 () Bool)

(assert (=> d!167019 e!882683))

(declare-fun res!1080064 () Bool)

(assert (=> d!167019 (=> (not res!1080064) (not e!882683))))

(assert (=> d!167019 (= res!1080064 (isStrictlySorted!1028 lt!677435))))

(assert (=> d!167019 (= (lemmaContainsTupThenGetReturnValue!390 lt!677435 (_1!12751 keyValue!4) (_2!12751 keyValue!4)) lt!677457)))

(declare-fun b!1582022 () Bool)

(declare-fun res!1080065 () Bool)

(assert (=> b!1582022 (=> (not res!1080065) (not e!882683))))

(declare-fun containsKey!887 (List!36811 (_ BitVec 64)) Bool)

(assert (=> b!1582022 (= res!1080065 (containsKey!887 lt!677435 (_1!12751 keyValue!4)))))

(declare-fun b!1582023 () Bool)

(declare-fun contains!10496 (List!36811 tuple2!25480) Bool)

(assert (=> b!1582023 (= e!882683 (contains!10496 lt!677435 (tuple2!25481 (_1!12751 keyValue!4) (_2!12751 keyValue!4))))))

(assert (= (and d!167019 res!1080064) b!1582022))

(assert (= (and b!1582022 res!1080065) b!1582023))

(assert (=> d!167019 m!1453585))

(declare-fun m!1453631 () Bool)

(assert (=> d!167019 m!1453631))

(declare-fun m!1453633 () Bool)

(assert (=> d!167019 m!1453633))

(declare-fun m!1453637 () Bool)

(assert (=> b!1582022 m!1453637))

(declare-fun m!1453641 () Bool)

(assert (=> b!1582023 m!1453641))

(assert (=> start!137420 d!167019))

(declare-fun b!1582068 () Bool)

(declare-fun e!882707 () List!36811)

(assert (=> b!1582068 (= e!882707 (insertStrictlySorted!612 (t!51717 (toList!11429 thiss!201)) (_1!12751 keyValue!4) (_2!12751 keyValue!4)))))

(declare-fun b!1582069 () Bool)

(declare-fun c!147234 () Bool)

(assert (=> b!1582069 (= c!147234 (and ((_ is Cons!36807) (toList!11429 thiss!201)) (bvsgt (_1!12751 (h!38368 (toList!11429 thiss!201))) (_1!12751 keyValue!4))))))

(declare-fun e!882709 () List!36811)

(declare-fun e!882708 () List!36811)

(assert (=> b!1582069 (= e!882709 e!882708)))

(declare-fun b!1582070 () Bool)

(declare-fun call!72590 () List!36811)

(assert (=> b!1582070 (= e!882709 call!72590)))

(declare-fun b!1582071 () Bool)

(declare-fun call!72592 () List!36811)

(assert (=> b!1582071 (= e!882708 call!72592)))

(declare-fun b!1582072 () Bool)

(declare-fun e!882710 () List!36811)

(assert (=> b!1582072 (= e!882710 e!882709)))

(declare-fun c!147233 () Bool)

(assert (=> b!1582072 (= c!147233 (and ((_ is Cons!36807) (toList!11429 thiss!201)) (= (_1!12751 (h!38368 (toList!11429 thiss!201))) (_1!12751 keyValue!4))))))

(declare-fun b!1582073 () Bool)

(declare-fun res!1080070 () Bool)

(declare-fun e!882706 () Bool)

(assert (=> b!1582073 (=> (not res!1080070) (not e!882706))))

(declare-fun lt!677464 () List!36811)

(assert (=> b!1582073 (= res!1080070 (containsKey!887 lt!677464 (_1!12751 keyValue!4)))))

(declare-fun b!1582075 () Bool)

(assert (=> b!1582075 (= e!882708 call!72592)))

(declare-fun bm!72587 () Bool)

(declare-fun call!72591 () List!36811)

(assert (=> bm!72587 (= call!72590 call!72591)))

(declare-fun b!1582076 () Bool)

(assert (=> b!1582076 (= e!882707 (ite c!147233 (t!51717 (toList!11429 thiss!201)) (ite c!147234 (Cons!36807 (h!38368 (toList!11429 thiss!201)) (t!51717 (toList!11429 thiss!201))) Nil!36808)))))

(declare-fun bm!72588 () Bool)

(assert (=> bm!72588 (= call!72592 call!72590)))

(declare-fun bm!72589 () Bool)

(declare-fun c!147235 () Bool)

(declare-fun $colon$colon!1008 (List!36811 tuple2!25480) List!36811)

(assert (=> bm!72589 (= call!72591 ($colon$colon!1008 e!882707 (ite c!147235 (h!38368 (toList!11429 thiss!201)) (tuple2!25481 (_1!12751 keyValue!4) (_2!12751 keyValue!4)))))))

(declare-fun c!147236 () Bool)

(assert (=> bm!72589 (= c!147236 c!147235)))

(declare-fun b!1582077 () Bool)

(assert (=> b!1582077 (= e!882710 call!72591)))

(declare-fun d!167023 () Bool)

(assert (=> d!167023 e!882706))

(declare-fun res!1080071 () Bool)

(assert (=> d!167023 (=> (not res!1080071) (not e!882706))))

(assert (=> d!167023 (= res!1080071 (isStrictlySorted!1028 lt!677464))))

(assert (=> d!167023 (= lt!677464 e!882710)))

(assert (=> d!167023 (= c!147235 (and ((_ is Cons!36807) (toList!11429 thiss!201)) (bvslt (_1!12751 (h!38368 (toList!11429 thiss!201))) (_1!12751 keyValue!4))))))

(assert (=> d!167023 (isStrictlySorted!1028 (toList!11429 thiss!201))))

(assert (=> d!167023 (= (insertStrictlySorted!612 (toList!11429 thiss!201) (_1!12751 keyValue!4) (_2!12751 keyValue!4)) lt!677464)))

(declare-fun b!1582074 () Bool)

(assert (=> b!1582074 (= e!882706 (contains!10496 lt!677464 (tuple2!25481 (_1!12751 keyValue!4) (_2!12751 keyValue!4))))))

(assert (= (and d!167023 c!147235) b!1582077))

(assert (= (and d!167023 (not c!147235)) b!1582072))

(assert (= (and b!1582072 c!147233) b!1582070))

(assert (= (and b!1582072 (not c!147233)) b!1582069))

(assert (= (and b!1582069 c!147234) b!1582075))

(assert (= (and b!1582069 (not c!147234)) b!1582071))

(assert (= (or b!1582075 b!1582071) bm!72588))

(assert (= (or b!1582070 bm!72588) bm!72587))

(assert (= (or b!1582077 bm!72587) bm!72589))

(assert (= (and bm!72589 c!147236) b!1582068))

(assert (= (and bm!72589 (not c!147236)) b!1582076))

(assert (= (and d!167023 res!1080071) b!1582073))

(assert (= (and b!1582073 res!1080070) b!1582074))

(declare-fun m!1453647 () Bool)

(assert (=> d!167023 m!1453647))

(assert (=> d!167023 m!1453613))

(declare-fun m!1453649 () Bool)

(assert (=> bm!72589 m!1453649))

(declare-fun m!1453651 () Bool)

(assert (=> b!1582073 m!1453651))

(declare-fun m!1453653 () Bool)

(assert (=> b!1582068 m!1453653))

(declare-fun m!1453655 () Bool)

(assert (=> b!1582074 m!1453655))

(assert (=> start!137420 d!167023))

(declare-fun b!1582090 () Bool)

(declare-fun e!882717 () Bool)

(declare-fun tp!114351 () Bool)

(assert (=> b!1582090 (= e!882717 (and tp_is_empty!39139 tp!114351))))

(assert (=> b!1581987 (= tp!114342 e!882717)))

(assert (= (and b!1581987 ((_ is Cons!36807) (toList!11429 thiss!201))) b!1582090))

(check-sat (not b!1582022) (not d!167011) (not b!1582068) (not b!1582023) (not b!1582074) (not d!167007) (not d!167023) (not b!1582090) tp_is_empty!39139 (not b!1582073) (not d!167019) (not b!1582004) (not bm!72589))
(check-sat)
