; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136948 () Bool)

(assert start!136948)

(declare-datatypes ((B!2594 0))(
  ( (B!2595 (val!19659 Int)) )
))
(declare-datatypes ((tuple2!25488 0))(
  ( (tuple2!25489 (_1!12755 (_ BitVec 64)) (_2!12755 B!2594)) )
))
(declare-datatypes ((List!36820 0))(
  ( (Nil!36817) (Cons!36816 (h!38360 tuple2!25488) (t!51726 List!36820)) )
))
(declare-fun lt!676244 () List!36820)

(declare-fun keyValue!4 () tuple2!25488)

(declare-datatypes ((Option!883 0))(
  ( (Some!882 (v!22368 B!2594)) (None!881) )
))
(declare-fun getValueByKey!808 (List!36820 (_ BitVec 64)) Option!883)

(assert (=> start!136948 (= (getValueByKey!808 lt!676244 (_1!12755 keyValue!4)) (Some!882 (_2!12755 keyValue!4)))))

(declare-datatypes ((Unit!52027 0))(
  ( (Unit!52028) )
))
(declare-fun lt!676245 () Unit!52027)

(declare-fun lemmaContainsTupThenGetReturnValue!392 (List!36820 (_ BitVec 64) B!2594) Unit!52027)

(assert (=> start!136948 (= lt!676245 (lemmaContainsTupThenGetReturnValue!392 lt!676244 (_1!12755 keyValue!4) (_2!12755 keyValue!4)))))

(declare-datatypes ((ListLongMap!22827 0))(
  ( (ListLongMap!22828 (toList!11429 List!36820)) )
))
(declare-fun thiss!201 () ListLongMap!22827)

(declare-fun insertStrictlySorted!612 (List!36820 (_ BitVec 64) B!2594) List!36820)

(assert (=> start!136948 (= lt!676244 (insertStrictlySorted!612 (toList!11429 thiss!201) (_1!12755 keyValue!4) (_2!12755 keyValue!4)))))

(declare-fun inv!58960 (ListLongMap!22827) Bool)

(assert (=> start!136948 (not (inv!58960 (ListLongMap!22828 lt!676244)))))

(declare-fun e!880919 () Bool)

(assert (=> start!136948 (and (inv!58960 thiss!201) e!880919)))

(declare-fun tp_is_empty!39139 () Bool)

(assert (=> start!136948 tp_is_empty!39139))

(declare-fun b!1579184 () Bool)

(declare-fun tp!114343 () Bool)

(assert (=> b!1579184 (= e!880919 tp!114343)))

(assert (= start!136948 b!1579184))

(declare-fun m!1450389 () Bool)

(assert (=> start!136948 m!1450389))

(declare-fun m!1450391 () Bool)

(assert (=> start!136948 m!1450391))

(declare-fun m!1450393 () Bool)

(assert (=> start!136948 m!1450393))

(declare-fun m!1450395 () Bool)

(assert (=> start!136948 m!1450395))

(declare-fun m!1450397 () Bool)

(assert (=> start!136948 m!1450397))

(check-sat (not start!136948) (not b!1579184) tp_is_empty!39139)
(check-sat)
(get-model)

(declare-fun d!166051 () Bool)

(assert (=> d!166051 (= (getValueByKey!808 lt!676244 (_1!12755 keyValue!4)) (Some!882 (_2!12755 keyValue!4)))))

(declare-fun lt!676265 () Unit!52027)

(declare-fun choose!2100 (List!36820 (_ BitVec 64) B!2594) Unit!52027)

(assert (=> d!166051 (= lt!676265 (choose!2100 lt!676244 (_1!12755 keyValue!4) (_2!12755 keyValue!4)))))

(declare-fun e!880933 () Bool)

(assert (=> d!166051 e!880933))

(declare-fun res!1079019 () Bool)

(assert (=> d!166051 (=> (not res!1079019) (not e!880933))))

(declare-fun isStrictlySorted!1040 (List!36820) Bool)

(assert (=> d!166051 (= res!1079019 (isStrictlySorted!1040 lt!676244))))

(assert (=> d!166051 (= (lemmaContainsTupThenGetReturnValue!392 lt!676244 (_1!12755 keyValue!4) (_2!12755 keyValue!4)) lt!676265)))

(declare-fun b!1579205 () Bool)

(declare-fun res!1079020 () Bool)

(assert (=> b!1579205 (=> (not res!1079020) (not e!880933))))

(declare-fun containsKey!885 (List!36820 (_ BitVec 64)) Bool)

(assert (=> b!1579205 (= res!1079020 (containsKey!885 lt!676244 (_1!12755 keyValue!4)))))

(declare-fun b!1579206 () Bool)

(declare-fun contains!10406 (List!36820 tuple2!25488) Bool)

(assert (=> b!1579206 (= e!880933 (contains!10406 lt!676244 (tuple2!25489 (_1!12755 keyValue!4) (_2!12755 keyValue!4))))))

(assert (= (and d!166051 res!1079019) b!1579205))

(assert (= (and b!1579205 res!1079020) b!1579206))

(assert (=> d!166051 m!1450397))

(declare-fun m!1450429 () Bool)

(assert (=> d!166051 m!1450429))

(declare-fun m!1450431 () Bool)

(assert (=> d!166051 m!1450431))

(declare-fun m!1450433 () Bool)

(assert (=> b!1579205 m!1450433))

(declare-fun m!1450435 () Bool)

(assert (=> b!1579206 m!1450435))

(assert (=> start!136948 d!166051))

(declare-fun d!166057 () Bool)

(assert (=> d!166057 (= (inv!58960 thiss!201) (isStrictlySorted!1040 (toList!11429 thiss!201)))))

(declare-fun bs!45705 () Bool)

(assert (= bs!45705 d!166057))

(declare-fun m!1450449 () Bool)

(assert (=> bs!45705 m!1450449))

(assert (=> start!136948 d!166057))

(declare-fun d!166065 () Bool)

(assert (=> d!166065 (= (inv!58960 (ListLongMap!22828 lt!676244)) (isStrictlySorted!1040 (toList!11429 (ListLongMap!22828 lt!676244))))))

(declare-fun bs!45706 () Bool)

(assert (= bs!45706 d!166065))

(declare-fun m!1450451 () Bool)

(assert (=> bs!45706 m!1450451))

(assert (=> start!136948 d!166065))

(declare-fun b!1579287 () Bool)

(declare-fun e!880975 () List!36820)

(declare-fun call!72410 () List!36820)

(assert (=> b!1579287 (= e!880975 call!72410)))

(declare-fun b!1579288 () Bool)

(declare-fun e!880976 () List!36820)

(declare-fun call!72411 () List!36820)

(assert (=> b!1579288 (= e!880976 call!72411)))

(declare-fun e!880978 () List!36820)

(declare-fun c!146357 () Bool)

(declare-fun bm!72406 () Bool)

(declare-fun $colon$colon!1014 (List!36820 tuple2!25488) List!36820)

(assert (=> bm!72406 (= call!72411 ($colon$colon!1014 e!880978 (ite c!146357 (h!38360 (toList!11429 thiss!201)) (tuple2!25489 (_1!12755 keyValue!4) (_2!12755 keyValue!4)))))))

(declare-fun c!146354 () Bool)

(assert (=> bm!72406 (= c!146354 c!146357)))

(declare-fun b!1579289 () Bool)

(assert (=> b!1579289 (= e!880978 (insertStrictlySorted!612 (t!51726 (toList!11429 thiss!201)) (_1!12755 keyValue!4) (_2!12755 keyValue!4)))))

(declare-fun d!166067 () Bool)

(declare-fun e!880977 () Bool)

(assert (=> d!166067 e!880977))

(declare-fun res!1079030 () Bool)

(assert (=> d!166067 (=> (not res!1079030) (not e!880977))))

(declare-fun lt!676273 () List!36820)

(assert (=> d!166067 (= res!1079030 (isStrictlySorted!1040 lt!676273))))

(assert (=> d!166067 (= lt!676273 e!880976)))

(get-info :version)

(assert (=> d!166067 (= c!146357 (and ((_ is Cons!36816) (toList!11429 thiss!201)) (bvslt (_1!12755 (h!38360 (toList!11429 thiss!201))) (_1!12755 keyValue!4))))))

(assert (=> d!166067 (isStrictlySorted!1040 (toList!11429 thiss!201))))

(assert (=> d!166067 (= (insertStrictlySorted!612 (toList!11429 thiss!201) (_1!12755 keyValue!4) (_2!12755 keyValue!4)) lt!676273)))

(declare-fun b!1579290 () Bool)

(assert (=> b!1579290 (= e!880977 (contains!10406 lt!676273 (tuple2!25489 (_1!12755 keyValue!4) (_2!12755 keyValue!4))))))

(declare-fun b!1579291 () Bool)

(declare-fun e!880979 () List!36820)

(assert (=> b!1579291 (= e!880976 e!880979)))

(declare-fun c!146356 () Bool)

(assert (=> b!1579291 (= c!146356 (and ((_ is Cons!36816) (toList!11429 thiss!201)) (= (_1!12755 (h!38360 (toList!11429 thiss!201))) (_1!12755 keyValue!4))))))

(declare-fun b!1579292 () Bool)

(declare-fun res!1079029 () Bool)

(assert (=> b!1579292 (=> (not res!1079029) (not e!880977))))

(assert (=> b!1579292 (= res!1079029 (containsKey!885 lt!676273 (_1!12755 keyValue!4)))))

(declare-fun b!1579293 () Bool)

(declare-fun c!146355 () Bool)

(assert (=> b!1579293 (= c!146355 (and ((_ is Cons!36816) (toList!11429 thiss!201)) (bvsgt (_1!12755 (h!38360 (toList!11429 thiss!201))) (_1!12755 keyValue!4))))))

(assert (=> b!1579293 (= e!880979 e!880975)))

(declare-fun b!1579294 () Bool)

(assert (=> b!1579294 (= e!880978 (ite c!146356 (t!51726 (toList!11429 thiss!201)) (ite c!146355 (Cons!36816 (h!38360 (toList!11429 thiss!201)) (t!51726 (toList!11429 thiss!201))) Nil!36817)))))

(declare-fun b!1579295 () Bool)

(declare-fun call!72409 () List!36820)

(assert (=> b!1579295 (= e!880979 call!72409)))

(declare-fun bm!72407 () Bool)

(assert (=> bm!72407 (= call!72410 call!72409)))

(declare-fun bm!72408 () Bool)

(assert (=> bm!72408 (= call!72409 call!72411)))

(declare-fun b!1579296 () Bool)

(assert (=> b!1579296 (= e!880975 call!72410)))

(assert (= (and d!166067 c!146357) b!1579288))

(assert (= (and d!166067 (not c!146357)) b!1579291))

(assert (= (and b!1579291 c!146356) b!1579295))

(assert (= (and b!1579291 (not c!146356)) b!1579293))

(assert (= (and b!1579293 c!146355) b!1579287))

(assert (= (and b!1579293 (not c!146355)) b!1579296))

(assert (= (or b!1579287 b!1579296) bm!72407))

(assert (= (or b!1579295 bm!72407) bm!72408))

(assert (= (or b!1579288 bm!72408) bm!72406))

(assert (= (and bm!72406 c!146354) b!1579289))

(assert (= (and bm!72406 (not c!146354)) b!1579294))

(assert (= (and d!166067 res!1079030) b!1579292))

(assert (= (and b!1579292 res!1079029) b!1579290))

(declare-fun m!1450457 () Bool)

(assert (=> b!1579289 m!1450457))

(declare-fun m!1450459 () Bool)

(assert (=> b!1579292 m!1450459))

(declare-fun m!1450461 () Bool)

(assert (=> d!166067 m!1450461))

(assert (=> d!166067 m!1450449))

(declare-fun m!1450463 () Bool)

(assert (=> b!1579290 m!1450463))

(declare-fun m!1450465 () Bool)

(assert (=> bm!72406 m!1450465))

(assert (=> start!136948 d!166067))

(declare-fun d!166073 () Bool)

(declare-fun c!146370 () Bool)

(assert (=> d!166073 (= c!146370 (and ((_ is Cons!36816) lt!676244) (= (_1!12755 (h!38360 lt!676244)) (_1!12755 keyValue!4))))))

(declare-fun e!880998 () Option!883)

(assert (=> d!166073 (= (getValueByKey!808 lt!676244 (_1!12755 keyValue!4)) e!880998)))

(declare-fun b!1579336 () Bool)

(declare-fun e!880999 () Option!883)

(assert (=> b!1579336 (= e!880998 e!880999)))

(declare-fun c!146371 () Bool)

(assert (=> b!1579336 (= c!146371 (and ((_ is Cons!36816) lt!676244) (not (= (_1!12755 (h!38360 lt!676244)) (_1!12755 keyValue!4)))))))

(declare-fun b!1579335 () Bool)

(assert (=> b!1579335 (= e!880998 (Some!882 (_2!12755 (h!38360 lt!676244))))))

(declare-fun b!1579338 () Bool)

(assert (=> b!1579338 (= e!880999 None!881)))

(declare-fun b!1579337 () Bool)

(assert (=> b!1579337 (= e!880999 (getValueByKey!808 (t!51726 lt!676244) (_1!12755 keyValue!4)))))

(assert (= (and d!166073 c!146370) b!1579335))

(assert (= (and d!166073 (not c!146370)) b!1579336))

(assert (= (and b!1579336 c!146371) b!1579337))

(assert (= (and b!1579336 (not c!146371)) b!1579338))

(declare-fun m!1450487 () Bool)

(assert (=> b!1579337 m!1450487))

(assert (=> start!136948 d!166073))

(declare-fun b!1579348 () Bool)

(declare-fun e!881005 () Bool)

(declare-fun tp!114357 () Bool)

(assert (=> b!1579348 (= e!881005 (and tp_is_empty!39139 tp!114357))))

(assert (=> b!1579184 (= tp!114343 e!881005)))

(assert (= (and b!1579184 ((_ is Cons!36816) (toList!11429 thiss!201))) b!1579348))

(check-sat (not b!1579205) (not b!1579348) tp_is_empty!39139 (not b!1579337) (not d!166057) (not b!1579289) (not b!1579206) (not b!1579290) (not d!166067) (not d!166051) (not b!1579292) (not bm!72406) (not d!166065))
(check-sat)
