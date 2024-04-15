; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136978 () Bool)

(assert start!136978)

(declare-fun res!1079043 () Bool)

(declare-fun e!881012 () Bool)

(assert (=> start!136978 (=> (not res!1079043) (not e!881012))))

(declare-datatypes ((B!2600 0))(
  ( (B!2601 (val!19662 Int)) )
))
(declare-datatypes ((tuple2!25494 0))(
  ( (tuple2!25495 (_1!12758 (_ BitVec 64)) (_2!12758 B!2600)) )
))
(declare-datatypes ((List!36823 0))(
  ( (Nil!36820) (Cons!36819 (h!38363 tuple2!25494) (t!51729 List!36823)) )
))
(declare-fun lt!676280 () List!36823)

(declare-fun keyValue!4 () tuple2!25494)

(declare-datatypes ((ListLongMap!22833 0))(
  ( (ListLongMap!22834 (toList!11432 List!36823)) )
))
(declare-fun contains!10409 (ListLongMap!22833 (_ BitVec 64)) Bool)

(assert (=> start!136978 (= res!1079043 (contains!10409 (ListLongMap!22834 lt!676280) (_1!12758 keyValue!4)))))

(declare-datatypes ((Option!886 0))(
  ( (Some!885 (v!22371 B!2600)) (None!884) )
))
(declare-fun getValueByKey!811 (List!36823 (_ BitVec 64)) Option!886)

(assert (=> start!136978 (= (getValueByKey!811 lt!676280 (_1!12758 keyValue!4)) (Some!885 (_2!12758 keyValue!4)))))

(declare-datatypes ((Unit!52033 0))(
  ( (Unit!52034) )
))
(declare-fun lt!676281 () Unit!52033)

(declare-fun lemmaContainsTupThenGetReturnValue!395 (List!36823 (_ BitVec 64) B!2600) Unit!52033)

(assert (=> start!136978 (= lt!676281 (lemmaContainsTupThenGetReturnValue!395 lt!676280 (_1!12758 keyValue!4) (_2!12758 keyValue!4)))))

(declare-fun thiss!201 () ListLongMap!22833)

(declare-fun insertStrictlySorted!615 (List!36823 (_ BitVec 64) B!2600) List!36823)

(assert (=> start!136978 (= lt!676280 (insertStrictlySorted!615 (toList!11432 thiss!201) (_1!12758 keyValue!4) (_2!12758 keyValue!4)))))

(assert (=> start!136978 (not e!881012)))

(declare-fun e!881011 () Bool)

(declare-fun inv!58968 (ListLongMap!22833) Bool)

(assert (=> start!136978 (and (inv!58968 thiss!201) e!881011)))

(declare-fun tp_is_empty!39145 () Bool)

(assert (=> start!136978 tp_is_empty!39145))

(declare-fun b!1579354 () Bool)

(declare-fun contains!10410 (List!36823 tuple2!25494) Bool)

(assert (=> b!1579354 (= e!881012 (contains!10410 lt!676280 keyValue!4))))

(declare-fun b!1579355 () Bool)

(declare-fun tp!114361 () Bool)

(assert (=> b!1579355 (= e!881011 tp!114361)))

(assert (= (and start!136978 res!1079043) b!1579354))

(assert (= start!136978 b!1579355))

(declare-fun m!1450491 () Bool)

(assert (=> start!136978 m!1450491))

(declare-fun m!1450493 () Bool)

(assert (=> start!136978 m!1450493))

(declare-fun m!1450495 () Bool)

(assert (=> start!136978 m!1450495))

(declare-fun m!1450497 () Bool)

(assert (=> start!136978 m!1450497))

(declare-fun m!1450499 () Bool)

(assert (=> start!136978 m!1450499))

(declare-fun m!1450501 () Bool)

(assert (=> b!1579354 m!1450501))

(check-sat (not start!136978) (not b!1579354) (not b!1579355) tp_is_empty!39145)
(check-sat)
(get-model)

(declare-fun d!166079 () Bool)

(assert (=> d!166079 (= (getValueByKey!811 lt!676280 (_1!12758 keyValue!4)) (Some!885 (_2!12758 keyValue!4)))))

(declare-fun lt!676299 () Unit!52033)

(declare-fun choose!2102 (List!36823 (_ BitVec 64) B!2600) Unit!52033)

(assert (=> d!166079 (= lt!676299 (choose!2102 lt!676280 (_1!12758 keyValue!4) (_2!12758 keyValue!4)))))

(declare-fun e!881033 () Bool)

(assert (=> d!166079 e!881033))

(declare-fun res!1079060 () Bool)

(assert (=> d!166079 (=> (not res!1079060) (not e!881033))))

(declare-fun isStrictlySorted!1041 (List!36823) Bool)

(assert (=> d!166079 (= res!1079060 (isStrictlySorted!1041 lt!676280))))

(assert (=> d!166079 (= (lemmaContainsTupThenGetReturnValue!395 lt!676280 (_1!12758 keyValue!4) (_2!12758 keyValue!4)) lt!676299)))

(declare-fun b!1579378 () Bool)

(declare-fun res!1079061 () Bool)

(assert (=> b!1579378 (=> (not res!1079061) (not e!881033))))

(declare-fun containsKey!887 (List!36823 (_ BitVec 64)) Bool)

(assert (=> b!1579378 (= res!1079061 (containsKey!887 lt!676280 (_1!12758 keyValue!4)))))

(declare-fun b!1579379 () Bool)

(assert (=> b!1579379 (= e!881033 (contains!10410 lt!676280 (tuple2!25495 (_1!12758 keyValue!4) (_2!12758 keyValue!4))))))

(assert (= (and d!166079 res!1079060) b!1579378))

(assert (= (and b!1579378 res!1079061) b!1579379))

(assert (=> d!166079 m!1450493))

(declare-fun m!1450535 () Bool)

(assert (=> d!166079 m!1450535))

(declare-fun m!1450537 () Bool)

(assert (=> d!166079 m!1450537))

(declare-fun m!1450539 () Bool)

(assert (=> b!1579378 m!1450539))

(declare-fun m!1450541 () Bool)

(assert (=> b!1579379 m!1450541))

(assert (=> start!136978 d!166079))

(declare-fun d!166089 () Bool)

(assert (=> d!166089 (= (inv!58968 thiss!201) (isStrictlySorted!1041 (toList!11432 thiss!201)))))

(declare-fun bs!45712 () Bool)

(assert (= bs!45712 d!166089))

(declare-fun m!1450543 () Bool)

(assert (=> bs!45712 m!1450543))

(assert (=> start!136978 d!166089))

(declare-fun d!166091 () Bool)

(declare-fun e!881045 () Bool)

(assert (=> d!166091 e!881045))

(declare-fun res!1079076 () Bool)

(assert (=> d!166091 (=> res!1079076 e!881045)))

(declare-fun lt!676314 () Bool)

(assert (=> d!166091 (= res!1079076 (not lt!676314))))

(declare-fun lt!676315 () Bool)

(assert (=> d!166091 (= lt!676314 lt!676315)))

(declare-fun lt!676316 () Unit!52033)

(declare-fun e!881044 () Unit!52033)

(assert (=> d!166091 (= lt!676316 e!881044)))

(declare-fun c!146374 () Bool)

(assert (=> d!166091 (= c!146374 lt!676315)))

(assert (=> d!166091 (= lt!676315 (containsKey!887 (toList!11432 (ListLongMap!22834 lt!676280)) (_1!12758 keyValue!4)))))

(assert (=> d!166091 (= (contains!10409 (ListLongMap!22834 lt!676280) (_1!12758 keyValue!4)) lt!676314)))

(declare-fun b!1579398 () Bool)

(declare-fun lt!676317 () Unit!52033)

(assert (=> b!1579398 (= e!881044 lt!676317)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!544 (List!36823 (_ BitVec 64)) Unit!52033)

(assert (=> b!1579398 (= lt!676317 (lemmaContainsKeyImpliesGetValueByKeyDefined!544 (toList!11432 (ListLongMap!22834 lt!676280)) (_1!12758 keyValue!4)))))

(declare-fun isDefined!596 (Option!886) Bool)

(assert (=> b!1579398 (isDefined!596 (getValueByKey!811 (toList!11432 (ListLongMap!22834 lt!676280)) (_1!12758 keyValue!4)))))

(declare-fun b!1579399 () Bool)

(declare-fun Unit!52039 () Unit!52033)

(assert (=> b!1579399 (= e!881044 Unit!52039)))

(declare-fun b!1579400 () Bool)

(assert (=> b!1579400 (= e!881045 (isDefined!596 (getValueByKey!811 (toList!11432 (ListLongMap!22834 lt!676280)) (_1!12758 keyValue!4))))))

(assert (= (and d!166091 c!146374) b!1579398))

(assert (= (and d!166091 (not c!146374)) b!1579399))

(assert (= (and d!166091 (not res!1079076)) b!1579400))

(declare-fun m!1450563 () Bool)

(assert (=> d!166091 m!1450563))

(declare-fun m!1450565 () Bool)

(assert (=> b!1579398 m!1450565))

(declare-fun m!1450567 () Bool)

(assert (=> b!1579398 m!1450567))

(assert (=> b!1579398 m!1450567))

(declare-fun m!1450569 () Bool)

(assert (=> b!1579398 m!1450569))

(assert (=> b!1579400 m!1450567))

(assert (=> b!1579400 m!1450567))

(assert (=> b!1579400 m!1450569))

(assert (=> start!136978 d!166091))

(declare-fun bm!72423 () Bool)

(declare-fun call!72428 () List!36823)

(declare-fun call!72427 () List!36823)

(assert (=> bm!72423 (= call!72428 call!72427)))

(declare-fun b!1579463 () Bool)

(declare-fun e!881082 () List!36823)

(assert (=> b!1579463 (= e!881082 call!72428)))

(declare-fun c!146402 () Bool)

(declare-fun e!881080 () List!36823)

(declare-fun call!72426 () List!36823)

(declare-fun bm!72424 () Bool)

(declare-fun $colon$colon!1017 (List!36823 tuple2!25494) List!36823)

(assert (=> bm!72424 (= call!72426 ($colon$colon!1017 e!881080 (ite c!146402 (h!38363 (toList!11432 thiss!201)) (tuple2!25495 (_1!12758 keyValue!4) (_2!12758 keyValue!4)))))))

(declare-fun c!146401 () Bool)

(assert (=> bm!72424 (= c!146401 c!146402)))

(declare-fun b!1579464 () Bool)

(assert (=> b!1579464 (= e!881080 (insertStrictlySorted!615 (t!51729 (toList!11432 thiss!201)) (_1!12758 keyValue!4) (_2!12758 keyValue!4)))))

(declare-fun b!1579465 () Bool)

(declare-fun e!881084 () Bool)

(declare-fun lt!676346 () List!36823)

(assert (=> b!1579465 (= e!881084 (contains!10410 lt!676346 (tuple2!25495 (_1!12758 keyValue!4) (_2!12758 keyValue!4))))))

(declare-fun c!146403 () Bool)

(declare-fun c!146404 () Bool)

(declare-fun b!1579466 () Bool)

(assert (=> b!1579466 (= e!881080 (ite c!146404 (t!51729 (toList!11432 thiss!201)) (ite c!146403 (Cons!36819 (h!38363 (toList!11432 thiss!201)) (t!51729 (toList!11432 thiss!201))) Nil!36820)))))

(declare-fun b!1579467 () Bool)

(get-info :version)

(assert (=> b!1579467 (= c!146403 (and ((_ is Cons!36819) (toList!11432 thiss!201)) (bvsgt (_1!12758 (h!38363 (toList!11432 thiss!201))) (_1!12758 keyValue!4))))))

(declare-fun e!881083 () List!36823)

(assert (=> b!1579467 (= e!881083 e!881082)))

(declare-fun b!1579468 () Bool)

(declare-fun e!881081 () List!36823)

(assert (=> b!1579468 (= e!881081 call!72426)))

(declare-fun bm!72425 () Bool)

(assert (=> bm!72425 (= call!72427 call!72426)))

(declare-fun b!1579469 () Bool)

(assert (=> b!1579469 (= e!881081 e!881083)))

(assert (=> b!1579469 (= c!146404 (and ((_ is Cons!36819) (toList!11432 thiss!201)) (= (_1!12758 (h!38363 (toList!11432 thiss!201))) (_1!12758 keyValue!4))))))

(declare-fun b!1579470 () Bool)

(assert (=> b!1579470 (= e!881083 call!72427)))

(declare-fun d!166099 () Bool)

(assert (=> d!166099 e!881084))

(declare-fun res!1079087 () Bool)

(assert (=> d!166099 (=> (not res!1079087) (not e!881084))))

(assert (=> d!166099 (= res!1079087 (isStrictlySorted!1041 lt!676346))))

(assert (=> d!166099 (= lt!676346 e!881081)))

(assert (=> d!166099 (= c!146402 (and ((_ is Cons!36819) (toList!11432 thiss!201)) (bvslt (_1!12758 (h!38363 (toList!11432 thiss!201))) (_1!12758 keyValue!4))))))

(assert (=> d!166099 (isStrictlySorted!1041 (toList!11432 thiss!201))))

(assert (=> d!166099 (= (insertStrictlySorted!615 (toList!11432 thiss!201) (_1!12758 keyValue!4) (_2!12758 keyValue!4)) lt!676346)))

(declare-fun b!1579471 () Bool)

(assert (=> b!1579471 (= e!881082 call!72428)))

(declare-fun b!1579472 () Bool)

(declare-fun res!1079088 () Bool)

(assert (=> b!1579472 (=> (not res!1079088) (not e!881084))))

(assert (=> b!1579472 (= res!1079088 (containsKey!887 lt!676346 (_1!12758 keyValue!4)))))

(assert (= (and d!166099 c!146402) b!1579468))

(assert (= (and d!166099 (not c!146402)) b!1579469))

(assert (= (and b!1579469 c!146404) b!1579470))

(assert (= (and b!1579469 (not c!146404)) b!1579467))

(assert (= (and b!1579467 c!146403) b!1579471))

(assert (= (and b!1579467 (not c!146403)) b!1579463))

(assert (= (or b!1579471 b!1579463) bm!72423))

(assert (= (or b!1579470 bm!72423) bm!72425))

(assert (= (or b!1579468 bm!72425) bm!72424))

(assert (= (and bm!72424 c!146401) b!1579464))

(assert (= (and bm!72424 (not c!146401)) b!1579466))

(assert (= (and d!166099 res!1079087) b!1579472))

(assert (= (and b!1579472 res!1079088) b!1579465))

(declare-fun m!1450589 () Bool)

(assert (=> b!1579472 m!1450589))

(declare-fun m!1450591 () Bool)

(assert (=> b!1579465 m!1450591))

(declare-fun m!1450593 () Bool)

(assert (=> bm!72424 m!1450593))

(declare-fun m!1450595 () Bool)

(assert (=> b!1579464 m!1450595))

(declare-fun m!1450597 () Bool)

(assert (=> d!166099 m!1450597))

(assert (=> d!166099 m!1450543))

(assert (=> start!136978 d!166099))

(declare-fun b!1579511 () Bool)

(declare-fun e!881104 () Option!886)

(assert (=> b!1579511 (= e!881104 (getValueByKey!811 (t!51729 lt!676280) (_1!12758 keyValue!4)))))

(declare-fun b!1579510 () Bool)

(declare-fun e!881103 () Option!886)

(assert (=> b!1579510 (= e!881103 e!881104)))

(declare-fun c!146420 () Bool)

(assert (=> b!1579510 (= c!146420 (and ((_ is Cons!36819) lt!676280) (not (= (_1!12758 (h!38363 lt!676280)) (_1!12758 keyValue!4)))))))

(declare-fun d!166107 () Bool)

(declare-fun c!146419 () Bool)

(assert (=> d!166107 (= c!146419 (and ((_ is Cons!36819) lt!676280) (= (_1!12758 (h!38363 lt!676280)) (_1!12758 keyValue!4))))))

(assert (=> d!166107 (= (getValueByKey!811 lt!676280 (_1!12758 keyValue!4)) e!881103)))

(declare-fun b!1579509 () Bool)

(assert (=> b!1579509 (= e!881103 (Some!885 (_2!12758 (h!38363 lt!676280))))))

(declare-fun b!1579512 () Bool)

(assert (=> b!1579512 (= e!881104 None!884)))

(assert (= (and d!166107 c!146419) b!1579509))

(assert (= (and d!166107 (not c!146419)) b!1579510))

(assert (= (and b!1579510 c!146420) b!1579511))

(assert (= (and b!1579510 (not c!146420)) b!1579512))

(declare-fun m!1450599 () Bool)

(assert (=> b!1579511 m!1450599))

(assert (=> start!136978 d!166107))

(declare-fun d!166109 () Bool)

(declare-fun lt!676353 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!816 (List!36823) (InoxSet tuple2!25494))

(assert (=> d!166109 (= lt!676353 (select (content!816 lt!676280) keyValue!4))))

(declare-fun e!881122 () Bool)

(assert (=> d!166109 (= lt!676353 e!881122)))

(declare-fun res!1079105 () Bool)

(assert (=> d!166109 (=> (not res!1079105) (not e!881122))))

(assert (=> d!166109 (= res!1079105 ((_ is Cons!36819) lt!676280))))

(assert (=> d!166109 (= (contains!10410 lt!676280 keyValue!4) lt!676353)))

(declare-fun b!1579541 () Bool)

(declare-fun e!881121 () Bool)

(assert (=> b!1579541 (= e!881122 e!881121)))

(declare-fun res!1079106 () Bool)

(assert (=> b!1579541 (=> res!1079106 e!881121)))

(assert (=> b!1579541 (= res!1079106 (= (h!38363 lt!676280) keyValue!4))))

(declare-fun b!1579542 () Bool)

(assert (=> b!1579542 (= e!881121 (contains!10410 (t!51729 lt!676280) keyValue!4))))

(assert (= (and d!166109 res!1079105) b!1579541))

(assert (= (and b!1579541 (not res!1079106)) b!1579542))

(declare-fun m!1450621 () Bool)

(assert (=> d!166109 m!1450621))

(declare-fun m!1450623 () Bool)

(assert (=> d!166109 m!1450623))

(declare-fun m!1450625 () Bool)

(assert (=> b!1579542 m!1450625))

(assert (=> b!1579354 d!166109))

(declare-fun b!1579551 () Bool)

(declare-fun e!881127 () Bool)

(declare-fun tp!114370 () Bool)

(assert (=> b!1579551 (= e!881127 (and tp_is_empty!39145 tp!114370))))

(assert (=> b!1579355 (= tp!114361 e!881127)))

(assert (= (and b!1579355 ((_ is Cons!36819) (toList!11432 thiss!201))) b!1579551))

(check-sat (not bm!72424) (not b!1579379) tp_is_empty!39145 (not d!166091) (not d!166089) (not b!1579464) (not d!166079) (not d!166099) (not b!1579472) (not b!1579398) (not b!1579465) (not b!1579542) (not b!1579378) (not b!1579551) (not b!1579400) (not b!1579511) (not d!166109))
(check-sat)
