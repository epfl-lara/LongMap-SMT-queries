; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136948 () Bool)

(assert start!136948)

(declare-fun res!1079054 () Bool)

(declare-fun e!880999 () Bool)

(assert (=> start!136948 (=> res!1079054 e!880999)))

(declare-datatypes ((B!2590 0))(
  ( (B!2591 (val!19657 Int)) )
))
(declare-datatypes ((tuple2!25416 0))(
  ( (tuple2!25417 (_1!12719 (_ BitVec 64)) (_2!12719 B!2590)) )
))
(declare-datatypes ((List!36777 0))(
  ( (Nil!36774) (Cons!36773 (h!38316 tuple2!25416) (t!51691 List!36777)) )
))
(declare-fun lt!676501 () List!36777)

(declare-fun isStrictlySorted!1038 (List!36777) Bool)

(assert (=> start!136948 (= res!1079054 (not (isStrictlySorted!1038 lt!676501)))))

(declare-datatypes ((ListLongMap!22755 0))(
  ( (ListLongMap!22756 (toList!11393 List!36777)) )
))
(declare-fun thiss!201 () ListLongMap!22755)

(declare-fun keyValue!4 () tuple2!25416)

(declare-fun insertStrictlySorted!609 (List!36777 (_ BitVec 64) B!2590) List!36777)

(assert (=> start!136948 (= lt!676501 (insertStrictlySorted!609 (toList!11393 thiss!201) (_1!12719 keyValue!4) (_2!12719 keyValue!4)))))

(assert (=> start!136948 e!880999))

(declare-fun e!881000 () Bool)

(declare-fun inv!58953 (ListLongMap!22755) Bool)

(assert (=> start!136948 (and (inv!58953 thiss!201) e!881000)))

(declare-fun tp_is_empty!39135 () Bool)

(assert (=> start!136948 tp_is_empty!39135))

(declare-fun b!1579324 () Bool)

(declare-fun res!1079055 () Bool)

(assert (=> b!1579324 (=> res!1079055 e!880999)))

(declare-fun containsKey!884 (List!36777 (_ BitVec 64)) Bool)

(assert (=> b!1579324 (= res!1079055 (not (containsKey!884 lt!676501 (_1!12719 keyValue!4))))))

(declare-fun b!1579325 () Bool)

(declare-fun contains!10449 (List!36777 tuple2!25416) Bool)

(assert (=> b!1579325 (= e!880999 (not (contains!10449 lt!676501 keyValue!4)))))

(declare-fun b!1579326 () Bool)

(declare-fun tp!114327 () Bool)

(assert (=> b!1579326 (= e!881000 tp!114327)))

(assert (= (and start!136948 (not res!1079054)) b!1579324))

(assert (= (and b!1579324 (not res!1079055)) b!1579325))

(assert (= start!136948 b!1579326))

(declare-fun m!1451183 () Bool)

(assert (=> start!136948 m!1451183))

(declare-fun m!1451185 () Bool)

(assert (=> start!136948 m!1451185))

(declare-fun m!1451187 () Bool)

(assert (=> start!136948 m!1451187))

(declare-fun m!1451189 () Bool)

(assert (=> b!1579324 m!1451189))

(declare-fun m!1451191 () Bool)

(assert (=> b!1579325 m!1451191))

(check-sat (not b!1579325) (not b!1579324) (not b!1579326) (not start!136948) tp_is_empty!39135)
(check-sat)
(get-model)

(declare-fun d!166253 () Bool)

(declare-fun res!1079066 () Bool)

(declare-fun e!881011 () Bool)

(assert (=> d!166253 (=> res!1079066 e!881011)))

(get-info :version)

(assert (=> d!166253 (= res!1079066 (or ((_ is Nil!36774) lt!676501) ((_ is Nil!36774) (t!51691 lt!676501))))))

(assert (=> d!166253 (= (isStrictlySorted!1038 lt!676501) e!881011)))

(declare-fun b!1579340 () Bool)

(declare-fun e!881012 () Bool)

(assert (=> b!1579340 (= e!881011 e!881012)))

(declare-fun res!1079067 () Bool)

(assert (=> b!1579340 (=> (not res!1079067) (not e!881012))))

(assert (=> b!1579340 (= res!1079067 (bvslt (_1!12719 (h!38316 lt!676501)) (_1!12719 (h!38316 (t!51691 lt!676501)))))))

(declare-fun b!1579341 () Bool)

(assert (=> b!1579341 (= e!881012 (isStrictlySorted!1038 (t!51691 lt!676501)))))

(assert (= (and d!166253 (not res!1079066)) b!1579340))

(assert (= (and b!1579340 res!1079067) b!1579341))

(declare-fun m!1451203 () Bool)

(assert (=> b!1579341 m!1451203))

(assert (=> start!136948 d!166253))

(declare-fun d!166259 () Bool)

(declare-fun e!881060 () Bool)

(assert (=> d!166259 e!881060))

(declare-fun res!1079108 () Bool)

(assert (=> d!166259 (=> (not res!1079108) (not e!881060))))

(declare-fun lt!676513 () List!36777)

(assert (=> d!166259 (= res!1079108 (isStrictlySorted!1038 lt!676513))))

(declare-fun e!881063 () List!36777)

(assert (=> d!166259 (= lt!676513 e!881063)))

(declare-fun c!146379 () Bool)

(assert (=> d!166259 (= c!146379 (and ((_ is Cons!36773) (toList!11393 thiss!201)) (bvslt (_1!12719 (h!38316 (toList!11393 thiss!201))) (_1!12719 keyValue!4))))))

(assert (=> d!166259 (isStrictlySorted!1038 (toList!11393 thiss!201))))

(assert (=> d!166259 (= (insertStrictlySorted!609 (toList!11393 thiss!201) (_1!12719 keyValue!4) (_2!12719 keyValue!4)) lt!676513)))

(declare-fun b!1579398 () Bool)

(declare-fun e!881059 () List!36777)

(declare-fun call!72406 () List!36777)

(assert (=> b!1579398 (= e!881059 call!72406)))

(declare-fun b!1579399 () Bool)

(declare-fun e!881062 () List!36777)

(assert (=> b!1579399 (= e!881062 (insertStrictlySorted!609 (t!51691 (toList!11393 thiss!201)) (_1!12719 keyValue!4) (_2!12719 keyValue!4)))))

(declare-fun b!1579400 () Bool)

(assert (=> b!1579400 (= e!881060 (contains!10449 lt!676513 (tuple2!25417 (_1!12719 keyValue!4) (_2!12719 keyValue!4))))))

(declare-fun b!1579401 () Bool)

(declare-fun call!72407 () List!36777)

(assert (=> b!1579401 (= e!881063 call!72407)))

(declare-fun bm!72402 () Bool)

(declare-fun call!72405 () List!36777)

(assert (=> bm!72402 (= call!72405 call!72407)))

(declare-fun b!1579402 () Bool)

(declare-fun e!881061 () List!36777)

(assert (=> b!1579402 (= e!881061 call!72405)))

(declare-fun b!1579403 () Bool)

(declare-fun res!1079109 () Bool)

(assert (=> b!1579403 (=> (not res!1079109) (not e!881060))))

(assert (=> b!1579403 (= res!1079109 (containsKey!884 lt!676513 (_1!12719 keyValue!4)))))

(declare-fun c!146382 () Bool)

(declare-fun c!146381 () Bool)

(declare-fun b!1579404 () Bool)

(assert (=> b!1579404 (= e!881062 (ite c!146381 (t!51691 (toList!11393 thiss!201)) (ite c!146382 (Cons!36773 (h!38316 (toList!11393 thiss!201)) (t!51691 (toList!11393 thiss!201))) Nil!36774)))))

(declare-fun b!1579405 () Bool)

(assert (=> b!1579405 (= e!881059 call!72406)))

(declare-fun bm!72403 () Bool)

(assert (=> bm!72403 (= call!72406 call!72405)))

(declare-fun b!1579406 () Bool)

(assert (=> b!1579406 (= c!146382 (and ((_ is Cons!36773) (toList!11393 thiss!201)) (bvsgt (_1!12719 (h!38316 (toList!11393 thiss!201))) (_1!12719 keyValue!4))))))

(assert (=> b!1579406 (= e!881061 e!881059)))

(declare-fun b!1579407 () Bool)

(assert (=> b!1579407 (= e!881063 e!881061)))

(assert (=> b!1579407 (= c!146381 (and ((_ is Cons!36773) (toList!11393 thiss!201)) (= (_1!12719 (h!38316 (toList!11393 thiss!201))) (_1!12719 keyValue!4))))))

(declare-fun bm!72404 () Bool)

(declare-fun $colon$colon!1008 (List!36777 tuple2!25416) List!36777)

(assert (=> bm!72404 (= call!72407 ($colon$colon!1008 e!881062 (ite c!146379 (h!38316 (toList!11393 thiss!201)) (tuple2!25417 (_1!12719 keyValue!4) (_2!12719 keyValue!4)))))))

(declare-fun c!146380 () Bool)

(assert (=> bm!72404 (= c!146380 c!146379)))

(assert (= (and d!166259 c!146379) b!1579401))

(assert (= (and d!166259 (not c!146379)) b!1579407))

(assert (= (and b!1579407 c!146381) b!1579402))

(assert (= (and b!1579407 (not c!146381)) b!1579406))

(assert (= (and b!1579406 c!146382) b!1579405))

(assert (= (and b!1579406 (not c!146382)) b!1579398))

(assert (= (or b!1579405 b!1579398) bm!72403))

(assert (= (or b!1579402 bm!72403) bm!72402))

(assert (= (or b!1579401 bm!72402) bm!72404))

(assert (= (and bm!72404 c!146380) b!1579399))

(assert (= (and bm!72404 (not c!146380)) b!1579404))

(assert (= (and d!166259 res!1079108) b!1579403))

(assert (= (and b!1579403 res!1079109) b!1579400))

(declare-fun m!1451225 () Bool)

(assert (=> d!166259 m!1451225))

(declare-fun m!1451227 () Bool)

(assert (=> d!166259 m!1451227))

(declare-fun m!1451229 () Bool)

(assert (=> bm!72404 m!1451229))

(declare-fun m!1451231 () Bool)

(assert (=> b!1579399 m!1451231))

(declare-fun m!1451233 () Bool)

(assert (=> b!1579403 m!1451233))

(declare-fun m!1451235 () Bool)

(assert (=> b!1579400 m!1451235))

(assert (=> start!136948 d!166259))

(declare-fun d!166273 () Bool)

(assert (=> d!166273 (= (inv!58953 thiss!201) (isStrictlySorted!1038 (toList!11393 thiss!201)))))

(declare-fun bs!45741 () Bool)

(assert (= bs!45741 d!166273))

(assert (=> bs!45741 m!1451227))

(assert (=> start!136948 d!166273))

(declare-fun d!166275 () Bool)

(declare-fun res!1079114 () Bool)

(declare-fun e!881080 () Bool)

(assert (=> d!166275 (=> res!1079114 e!881080)))

(assert (=> d!166275 (= res!1079114 (and ((_ is Cons!36773) lt!676501) (= (_1!12719 (h!38316 lt!676501)) (_1!12719 keyValue!4))))))

(assert (=> d!166275 (= (containsKey!884 lt!676501 (_1!12719 keyValue!4)) e!881080)))

(declare-fun b!1579436 () Bool)

(declare-fun e!881081 () Bool)

(assert (=> b!1579436 (= e!881080 e!881081)))

(declare-fun res!1079115 () Bool)

(assert (=> b!1579436 (=> (not res!1079115) (not e!881081))))

(assert (=> b!1579436 (= res!1079115 (and (or (not ((_ is Cons!36773) lt!676501)) (bvsle (_1!12719 (h!38316 lt!676501)) (_1!12719 keyValue!4))) ((_ is Cons!36773) lt!676501) (bvslt (_1!12719 (h!38316 lt!676501)) (_1!12719 keyValue!4))))))

(declare-fun b!1579437 () Bool)

(assert (=> b!1579437 (= e!881081 (containsKey!884 (t!51691 lt!676501) (_1!12719 keyValue!4)))))

(assert (= (and d!166275 (not res!1079114)) b!1579436))

(assert (= (and b!1579436 res!1079115) b!1579437))

(declare-fun m!1451237 () Bool)

(assert (=> b!1579437 m!1451237))

(assert (=> b!1579324 d!166275))

(declare-fun d!166277 () Bool)

(declare-fun lt!676520 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!826 (List!36777) (InoxSet tuple2!25416))

(assert (=> d!166277 (= lt!676520 (select (content!826 lt!676501) keyValue!4))))

(declare-fun e!881094 () Bool)

(assert (=> d!166277 (= lt!676520 e!881094)))

(declare-fun res!1079128 () Bool)

(assert (=> d!166277 (=> (not res!1079128) (not e!881094))))

(assert (=> d!166277 (= res!1079128 ((_ is Cons!36773) lt!676501))))

(assert (=> d!166277 (= (contains!10449 lt!676501 keyValue!4) lt!676520)))

(declare-fun b!1579458 () Bool)

(declare-fun e!881095 () Bool)

(assert (=> b!1579458 (= e!881094 e!881095)))

(declare-fun res!1079129 () Bool)

(assert (=> b!1579458 (=> res!1079129 e!881095)))

(assert (=> b!1579458 (= res!1079129 (= (h!38316 lt!676501) keyValue!4))))

(declare-fun b!1579459 () Bool)

(assert (=> b!1579459 (= e!881095 (contains!10449 (t!51691 lt!676501) keyValue!4))))

(assert (= (and d!166277 res!1079128) b!1579458))

(assert (= (and b!1579458 (not res!1079129)) b!1579459))

(declare-fun m!1451239 () Bool)

(assert (=> d!166277 m!1451239))

(declare-fun m!1451241 () Bool)

(assert (=> d!166277 m!1451241))

(declare-fun m!1451243 () Bool)

(assert (=> b!1579459 m!1451243))

(assert (=> b!1579325 d!166277))

(declare-fun b!1579474 () Bool)

(declare-fun e!881103 () Bool)

(declare-fun tp!114333 () Bool)

(assert (=> b!1579474 (= e!881103 (and tp_is_empty!39135 tp!114333))))

(assert (=> b!1579326 (= tp!114327 e!881103)))

(assert (= (and b!1579326 ((_ is Cons!36773) (toList!11393 thiss!201))) b!1579474))

(check-sat (not b!1579341) (not b!1579400) (not d!166273) (not b!1579403) (not d!166259) tp_is_empty!39135 (not d!166277) (not b!1579399) (not b!1579474) (not b!1579437) (not b!1579459) (not bm!72404))
(check-sat)
