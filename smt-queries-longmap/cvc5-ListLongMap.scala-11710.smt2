; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137012 () Bool)

(assert start!137012)

(declare-fun res!1079172 () Bool)

(declare-fun e!881210 () Bool)

(assert (=> start!137012 (=> (not res!1079172) (not e!881210))))

(declare-datatypes ((B!2600 0))(
  ( (B!2601 (val!19662 Int)) )
))
(declare-datatypes ((tuple2!25426 0))(
  ( (tuple2!25427 (_1!12724 (_ BitVec 64)) (_2!12724 B!2600)) )
))
(declare-datatypes ((List!36782 0))(
  ( (Nil!36779) (Cons!36778 (h!38321 tuple2!25426) (t!51696 List!36782)) )
))
(declare-fun lt!676563 () List!36782)

(declare-fun keyValue!4 () tuple2!25426)

(declare-datatypes ((ListLongMap!22765 0))(
  ( (ListLongMap!22766 (toList!11398 List!36782)) )
))
(declare-fun contains!10454 (ListLongMap!22765 (_ BitVec 64)) Bool)

(assert (=> start!137012 (= res!1079172 (contains!10454 (ListLongMap!22766 lt!676563) (_1!12724 keyValue!4)))))

(declare-datatypes ((Option!884 0))(
  ( (Some!883 (v!22375 B!2600)) (None!882) )
))
(declare-fun getValueByKey!808 (List!36782 (_ BitVec 64)) Option!884)

(assert (=> start!137012 (= (getValueByKey!808 lt!676563 (_1!12724 keyValue!4)) (Some!883 (_2!12724 keyValue!4)))))

(declare-datatypes ((Unit!52225 0))(
  ( (Unit!52226) )
))
(declare-fun lt!676564 () Unit!52225)

(declare-fun lemmaContainsTupThenGetReturnValue!394 (List!36782 (_ BitVec 64) B!2600) Unit!52225)

(assert (=> start!137012 (= lt!676564 (lemmaContainsTupThenGetReturnValue!394 lt!676563 (_1!12724 keyValue!4) (_2!12724 keyValue!4)))))

(declare-fun thiss!201 () ListLongMap!22765)

(declare-fun insertStrictlySorted!614 (List!36782 (_ BitVec 64) B!2600) List!36782)

(assert (=> start!137012 (= lt!676563 (insertStrictlySorted!614 (toList!11398 thiss!201) (_1!12724 keyValue!4) (_2!12724 keyValue!4)))))

(assert (=> start!137012 (not e!881210)))

(declare-fun e!881209 () Bool)

(declare-fun inv!58968 (ListLongMap!22765) Bool)

(assert (=> start!137012 (and (inv!58968 thiss!201) e!881209)))

(declare-fun tp_is_empty!39145 () Bool)

(assert (=> start!137012 tp_is_empty!39145))

(declare-fun b!1579667 () Bool)

(declare-fun contains!10455 (List!36782 tuple2!25426) Bool)

(assert (=> b!1579667 (= e!881210 (contains!10455 lt!676563 keyValue!4))))

(declare-fun b!1579668 () Bool)

(declare-fun tp!114360 () Bool)

(assert (=> b!1579668 (= e!881209 tp!114360)))

(assert (= (and start!137012 res!1079172) b!1579667))

(assert (= start!137012 b!1579668))

(declare-fun m!1451371 () Bool)

(assert (=> start!137012 m!1451371))

(declare-fun m!1451373 () Bool)

(assert (=> start!137012 m!1451373))

(declare-fun m!1451375 () Bool)

(assert (=> start!137012 m!1451375))

(declare-fun m!1451377 () Bool)

(assert (=> start!137012 m!1451377))

(declare-fun m!1451379 () Bool)

(assert (=> start!137012 m!1451379))

(declare-fun m!1451381 () Bool)

(assert (=> b!1579667 m!1451381))

(push 1)

(assert (not start!137012))

(assert (not b!1579667))

(assert (not b!1579668))

(assert tp_is_empty!39145)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166321 () Bool)

(declare-fun isStrictlySorted!1044 (List!36782) Bool)

(assert (=> d!166321 (= (inv!58968 thiss!201) (isStrictlySorted!1044 (toList!11398 thiss!201)))))

(declare-fun bs!45757 () Bool)

(assert (= bs!45757 d!166321))

(declare-fun m!1451411 () Bool)

(assert (=> bs!45757 m!1451411))

(assert (=> start!137012 d!166321))

(declare-fun d!166327 () Bool)

(assert (=> d!166327 (= (getValueByKey!808 lt!676563 (_1!12724 keyValue!4)) (Some!883 (_2!12724 keyValue!4)))))

(declare-fun lt!676589 () Unit!52225)

(declare-fun choose!2094 (List!36782 (_ BitVec 64) B!2600) Unit!52225)

(assert (=> d!166327 (= lt!676589 (choose!2094 lt!676563 (_1!12724 keyValue!4) (_2!12724 keyValue!4)))))

(declare-fun e!881237 () Bool)

(assert (=> d!166327 e!881237))

(declare-fun res!1079189 () Bool)

(assert (=> d!166327 (=> (not res!1079189) (not e!881237))))

(assert (=> d!166327 (= res!1079189 (isStrictlySorted!1044 lt!676563))))

(assert (=> d!166327 (= (lemmaContainsTupThenGetReturnValue!394 lt!676563 (_1!12724 keyValue!4) (_2!12724 keyValue!4)) lt!676589)))

(declare-fun b!1579707 () Bool)

(declare-fun res!1079190 () Bool)

(assert (=> b!1579707 (=> (not res!1079190) (not e!881237))))

(declare-fun containsKey!891 (List!36782 (_ BitVec 64)) Bool)

(assert (=> b!1579707 (= res!1079190 (containsKey!891 lt!676563 (_1!12724 keyValue!4)))))

(declare-fun b!1579708 () Bool)

(assert (=> b!1579708 (= e!881237 (contains!10455 lt!676563 (tuple2!25427 (_1!12724 keyValue!4) (_2!12724 keyValue!4))))))

(assert (= (and d!166327 res!1079189) b!1579707))

(assert (= (and b!1579707 res!1079190) b!1579708))

(assert (=> d!166327 m!1451373))

(declare-fun m!1451415 () Bool)

(assert (=> d!166327 m!1451415))

(declare-fun m!1451417 () Bool)

(assert (=> d!166327 m!1451417))

(declare-fun m!1451419 () Bool)

(assert (=> b!1579707 m!1451419))

(declare-fun m!1451421 () Bool)

(assert (=> b!1579708 m!1451421))

(assert (=> start!137012 d!166327))

(declare-fun b!1579722 () Bool)

(declare-fun e!881246 () Option!884)

(assert (=> b!1579722 (= e!881246 (Some!883 (_2!12724 (h!38321 lt!676563))))))

(declare-fun b!1579724 () Bool)

(declare-fun e!881248 () Option!884)

(assert (=> b!1579724 (= e!881248 (getValueByKey!808 (t!51696 lt!676563) (_1!12724 keyValue!4)))))

(declare-fun b!1579723 () Bool)

(assert (=> b!1579723 (= e!881246 e!881248)))

(declare-fun c!146475 () Bool)

(assert (=> b!1579723 (= c!146475 (and (is-Cons!36778 lt!676563) (not (= (_1!12724 (h!38321 lt!676563)) (_1!12724 keyValue!4)))))))

(declare-fun d!166331 () Bool)

(declare-fun c!146474 () Bool)

(assert (=> d!166331 (= c!146474 (and (is-Cons!36778 lt!676563) (= (_1!12724 (h!38321 lt!676563)) (_1!12724 keyValue!4))))))

(assert (=> d!166331 (= (getValueByKey!808 lt!676563 (_1!12724 keyValue!4)) e!881246)))

(declare-fun b!1579725 () Bool)

(assert (=> b!1579725 (= e!881248 None!882)))

(assert (= (and d!166331 c!146474) b!1579722))

(assert (= (and d!166331 (not c!146474)) b!1579723))

(assert (= (and b!1579723 c!146475) b!1579724))

(assert (= (and b!1579723 (not c!146475)) b!1579725))

(declare-fun m!1451439 () Bool)

(assert (=> b!1579724 m!1451439))

(assert (=> start!137012 d!166331))

(declare-fun d!166337 () Bool)

(declare-fun e!881266 () Bool)

(assert (=> d!166337 e!881266))

(declare-fun res!1079202 () Bool)

(assert (=> d!166337 (=> res!1079202 e!881266)))

(declare-fun lt!676609 () Bool)

(assert (=> d!166337 (= res!1079202 (not lt!676609))))

(declare-fun lt!676610 () Bool)

(assert (=> d!166337 (= lt!676609 lt!676610)))

(declare-fun lt!676608 () Unit!52225)

(declare-fun e!881267 () Unit!52225)

(assert (=> d!166337 (= lt!676608 e!881267)))

(declare-fun c!146490 () Bool)

(assert (=> d!166337 (= c!146490 lt!676610)))

(assert (=> d!166337 (= lt!676610 (containsKey!891 (toList!11398 (ListLongMap!22766 lt!676563)) (_1!12724 keyValue!4)))))

(assert (=> d!166337 (= (contains!10454 (ListLongMap!22766 lt!676563) (_1!12724 keyValue!4)) lt!676609)))

(declare-fun b!1579762 () Bool)

(declare-fun lt!676611 () Unit!52225)

(assert (=> b!1579762 (= e!881267 lt!676611)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!547 (List!36782 (_ BitVec 64)) Unit!52225)

(assert (=> b!1579762 (= lt!676611 (lemmaContainsKeyImpliesGetValueByKeyDefined!547 (toList!11398 (ListLongMap!22766 lt!676563)) (_1!12724 keyValue!4)))))

(declare-fun isDefined!595 (Option!884) Bool)

(assert (=> b!1579762 (isDefined!595 (getValueByKey!808 (toList!11398 (ListLongMap!22766 lt!676563)) (_1!12724 keyValue!4)))))

(declare-fun b!1579763 () Bool)

(declare-fun Unit!52232 () Unit!52225)

(assert (=> b!1579763 (= e!881267 Unit!52232)))

(declare-fun b!1579764 () Bool)

(assert (=> b!1579764 (= e!881266 (isDefined!595 (getValueByKey!808 (toList!11398 (ListLongMap!22766 lt!676563)) (_1!12724 keyValue!4))))))

(assert (= (and d!166337 c!146490) b!1579762))

(assert (= (and d!166337 (not c!146490)) b!1579763))

(assert (= (and d!166337 (not res!1079202)) b!1579764))

(declare-fun m!1451451 () Bool)

(assert (=> d!166337 m!1451451))

(declare-fun m!1451453 () Bool)

(assert (=> b!1579762 m!1451453))

(declare-fun m!1451455 () Bool)

(assert (=> b!1579762 m!1451455))

(assert (=> b!1579762 m!1451455))

(declare-fun m!1451457 () Bool)

(assert (=> b!1579762 m!1451457))

(assert (=> b!1579764 m!1451455))

(assert (=> b!1579764 m!1451455))

(assert (=> b!1579764 m!1451457))

(assert (=> start!137012 d!166337))

(declare-fun b!1579842 () Bool)

(declare-fun e!881308 () Bool)

(declare-fun lt!676630 () List!36782)

(assert (=> b!1579842 (= e!881308 (contains!10455 lt!676630 (tuple2!25427 (_1!12724 keyValue!4) (_2!12724 keyValue!4))))))

(declare-fun c!146521 () Bool)

(declare-fun bm!72474 () Bool)

(declare-fun e!881309 () List!36782)

(declare-fun call!72477 () List!36782)

(declare-fun $colon$colon!1014 (List!36782 tuple2!25426) List!36782)

(assert (=> bm!72474 (= call!72477 ($colon$colon!1014 e!881309 (ite c!146521 (h!38321 (toList!11398 thiss!201)) (tuple2!25427 (_1!12724 keyValue!4) (_2!12724 keyValue!4)))))))

(declare-fun c!146523 () Bool)

(assert (=> bm!72474 (= c!146523 c!146521)))

(declare-fun b!1579843 () Bool)

(declare-fun e!881310 () List!36782)

(declare-fun e!881312 () List!36782)

(assert (=> b!1579843 (= e!881310 e!881312)))

(declare-fun c!146522 () Bool)

(assert (=> b!1579843 (= c!146522 (and (is-Cons!36778 (toList!11398 thiss!201)) (= (_1!12724 (h!38321 (toList!11398 thiss!201))) (_1!12724 keyValue!4))))))

(declare-fun bm!72475 () Bool)

(declare-fun call!72478 () List!36782)

(declare-fun call!72479 () List!36782)

(assert (=> bm!72475 (= call!72478 call!72479)))

(declare-fun b!1579845 () Bool)

(declare-fun res!1079222 () Bool)

(assert (=> b!1579845 (=> (not res!1079222) (not e!881308))))

(assert (=> b!1579845 (= res!1079222 (containsKey!891 lt!676630 (_1!12724 keyValue!4)))))

(declare-fun bm!72476 () Bool)

(assert (=> bm!72476 (= call!72479 call!72477)))

(declare-fun b!1579846 () Bool)

(assert (=> b!1579846 (= e!881310 call!72477)))

(declare-fun b!1579847 () Bool)

(assert (=> b!1579847 (= e!881309 (insertStrictlySorted!614 (t!51696 (toList!11398 thiss!201)) (_1!12724 keyValue!4) (_2!12724 keyValue!4)))))

(declare-fun b!1579848 () Bool)

(declare-fun e!881311 () List!36782)

(assert (=> b!1579848 (= e!881311 call!72478)))

(declare-fun b!1579849 () Bool)

(declare-fun c!146520 () Bool)

(assert (=> b!1579849 (= c!146520 (and (is-Cons!36778 (toList!11398 thiss!201)) (bvsgt (_1!12724 (h!38321 (toList!11398 thiss!201))) (_1!12724 keyValue!4))))))

(assert (=> b!1579849 (= e!881312 e!881311)))

(declare-fun d!166343 () Bool)

(assert (=> d!166343 e!881308))

(declare-fun res!1079223 () Bool)

(assert (=> d!166343 (=> (not res!1079223) (not e!881308))))

(assert (=> d!166343 (= res!1079223 (isStrictlySorted!1044 lt!676630))))

(assert (=> d!166343 (= lt!676630 e!881310)))

(assert (=> d!166343 (= c!146521 (and (is-Cons!36778 (toList!11398 thiss!201)) (bvslt (_1!12724 (h!38321 (toList!11398 thiss!201))) (_1!12724 keyValue!4))))))

(assert (=> d!166343 (isStrictlySorted!1044 (toList!11398 thiss!201))))

(assert (=> d!166343 (= (insertStrictlySorted!614 (toList!11398 thiss!201) (_1!12724 keyValue!4) (_2!12724 keyValue!4)) lt!676630)))

(declare-fun b!1579844 () Bool)

(assert (=> b!1579844 (= e!881309 (ite c!146522 (t!51696 (toList!11398 thiss!201)) (ite c!146520 (Cons!36778 (h!38321 (toList!11398 thiss!201)) (t!51696 (toList!11398 thiss!201))) Nil!36779)))))

