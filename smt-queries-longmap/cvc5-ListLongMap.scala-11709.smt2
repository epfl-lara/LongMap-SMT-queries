; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136982 () Bool)

(assert start!136982)

(declare-datatypes ((B!2594 0))(
  ( (B!2595 (val!19659 Int)) )
))
(declare-datatypes ((tuple2!25420 0))(
  ( (tuple2!25421 (_1!12721 (_ BitVec 64)) (_2!12721 B!2594)) )
))
(declare-datatypes ((List!36779 0))(
  ( (Nil!36776) (Cons!36775 (h!38318 tuple2!25420) (t!51693 List!36779)) )
))
(declare-fun lt!676527 () List!36779)

(declare-fun keyValue!4 () tuple2!25420)

(declare-datatypes ((Option!881 0))(
  ( (Some!880 (v!22372 B!2594)) (None!879) )
))
(declare-fun getValueByKey!805 (List!36779 (_ BitVec 64)) Option!881)

(assert (=> start!136982 (= (getValueByKey!805 lt!676527 (_1!12721 keyValue!4)) (Some!880 (_2!12721 keyValue!4)))))

(declare-datatypes ((Unit!52219 0))(
  ( (Unit!52220) )
))
(declare-fun lt!676528 () Unit!52219)

(declare-fun lemmaContainsTupThenGetReturnValue!391 (List!36779 (_ BitVec 64) B!2594) Unit!52219)

(assert (=> start!136982 (= lt!676528 (lemmaContainsTupThenGetReturnValue!391 lt!676527 (_1!12721 keyValue!4) (_2!12721 keyValue!4)))))

(declare-datatypes ((ListLongMap!22759 0))(
  ( (ListLongMap!22760 (toList!11395 List!36779)) )
))
(declare-fun thiss!201 () ListLongMap!22759)

(declare-fun insertStrictlySorted!611 (List!36779 (_ BitVec 64) B!2594) List!36779)

(assert (=> start!136982 (= lt!676527 (insertStrictlySorted!611 (toList!11395 thiss!201) (_1!12721 keyValue!4) (_2!12721 keyValue!4)))))

(declare-fun inv!58960 (ListLongMap!22759) Bool)

(assert (=> start!136982 (not (inv!58960 (ListLongMap!22760 lt!676527)))))

(declare-fun e!881117 () Bool)

(assert (=> start!136982 (and (inv!58960 thiss!201) e!881117)))

(declare-fun tp_is_empty!39139 () Bool)

(assert (=> start!136982 tp_is_empty!39139))

(declare-fun b!1579497 () Bool)

(declare-fun tp!114342 () Bool)

(assert (=> b!1579497 (= e!881117 tp!114342)))

(assert (= start!136982 b!1579497))

(declare-fun m!1451269 () Bool)

(assert (=> start!136982 m!1451269))

(declare-fun m!1451271 () Bool)

(assert (=> start!136982 m!1451271))

(declare-fun m!1451273 () Bool)

(assert (=> start!136982 m!1451273))

(declare-fun m!1451275 () Bool)

(assert (=> start!136982 m!1451275))

(declare-fun m!1451277 () Bool)

(assert (=> start!136982 m!1451277))

(push 1)

(assert (not start!136982))

(assert (not b!1579497))

(assert tp_is_empty!39139)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1579514 () Bool)

(declare-fun e!881129 () Option!881)

(assert (=> b!1579514 (= e!881129 (getValueByKey!805 (t!51693 lt!676527) (_1!12721 keyValue!4)))))

(declare-fun b!1579513 () Bool)

(declare-fun e!881128 () Option!881)

(assert (=> b!1579513 (= e!881128 e!881129)))

(declare-fun c!146412 () Bool)

(assert (=> b!1579513 (= c!146412 (and (is-Cons!36775 lt!676527) (not (= (_1!12721 (h!38318 lt!676527)) (_1!12721 keyValue!4)))))))

(declare-fun b!1579512 () Bool)

(assert (=> b!1579512 (= e!881128 (Some!880 (_2!12721 (h!38318 lt!676527))))))

(declare-fun b!1579515 () Bool)

(assert (=> b!1579515 (= e!881129 None!879)))

(declare-fun d!166285 () Bool)

(declare-fun c!146411 () Bool)

(assert (=> d!166285 (= c!146411 (and (is-Cons!36775 lt!676527) (= (_1!12721 (h!38318 lt!676527)) (_1!12721 keyValue!4))))))

(assert (=> d!166285 (= (getValueByKey!805 lt!676527 (_1!12721 keyValue!4)) e!881128)))

(assert (= (and d!166285 c!146411) b!1579512))

(assert (= (and d!166285 (not c!146411)) b!1579513))

(assert (= (and b!1579513 c!146412) b!1579514))

(assert (= (and b!1579513 (not c!146412)) b!1579515))

(declare-fun m!1451299 () Bool)

(assert (=> b!1579514 m!1451299))

(assert (=> start!136982 d!166285))

(declare-fun d!166291 () Bool)

(assert (=> d!166291 (= (getValueByKey!805 lt!676527 (_1!12721 keyValue!4)) (Some!880 (_2!12721 keyValue!4)))))

(declare-fun lt!676549 () Unit!52219)

(declare-fun choose!2092 (List!36779 (_ BitVec 64) B!2594) Unit!52219)

(assert (=> d!166291 (= lt!676549 (choose!2092 lt!676527 (_1!12721 keyValue!4) (_2!12721 keyValue!4)))))

(declare-fun e!881142 () Bool)

(assert (=> d!166291 e!881142))

(declare-fun res!1079150 () Bool)

(assert (=> d!166291 (=> (not res!1079150) (not e!881142))))

(declare-fun isStrictlySorted!1042 (List!36779) Bool)

(assert (=> d!166291 (= res!1079150 (isStrictlySorted!1042 lt!676527))))

(assert (=> d!166291 (= (lemmaContainsTupThenGetReturnValue!391 lt!676527 (_1!12721 keyValue!4) (_2!12721 keyValue!4)) lt!676549)))

(declare-fun b!1579540 () Bool)

(declare-fun res!1079151 () Bool)

(assert (=> b!1579540 (=> (not res!1079151) (not e!881142))))

(declare-fun containsKey!888 (List!36779 (_ BitVec 64)) Bool)

(assert (=> b!1579540 (= res!1079151 (containsKey!888 lt!676527 (_1!12721 keyValue!4)))))

(declare-fun b!1579541 () Bool)

(declare-fun contains!10453 (List!36779 tuple2!25420) Bool)

(assert (=> b!1579541 (= e!881142 (contains!10453 lt!676527 (tuple2!25421 (_1!12721 keyValue!4) (_2!12721 keyValue!4))))))

(assert (= (and d!166291 res!1079150) b!1579540))

(assert (= (and b!1579540 res!1079151) b!1579541))

(assert (=> d!166291 m!1451275))

(declare-fun m!1451321 () Bool)

(assert (=> d!166291 m!1451321))

(declare-fun m!1451323 () Bool)

(assert (=> d!166291 m!1451323))

(declare-fun m!1451325 () Bool)

(assert (=> b!1579540 m!1451325))

(declare-fun m!1451327 () Bool)

(assert (=> b!1579541 m!1451327))

(assert (=> start!136982 d!166291))

(declare-fun b!1579616 () Bool)

(declare-fun res!1079166 () Bool)

(declare-fun e!881183 () Bool)

(assert (=> b!1579616 (=> (not res!1079166) (not e!881183))))

(declare-fun lt!676557 () List!36779)

(assert (=> b!1579616 (= res!1079166 (containsKey!888 lt!676557 (_1!12721 keyValue!4)))))

(declare-fun b!1579617 () Bool)

(declare-fun e!881180 () List!36779)

(declare-fun call!72447 () List!36779)

(assert (=> b!1579617 (= e!881180 call!72447)))

(declare-fun b!1579618 () Bool)

(declare-fun e!881181 () List!36779)

(declare-fun call!72448 () List!36779)

(assert (=> b!1579618 (= e!881181 call!72448)))

(declare-fun c!146447 () Bool)

(declare-fun c!146450 () Bool)

(declare-fun e!881184 () List!36779)

(declare-fun b!1579619 () Bool)

(assert (=> b!1579619 (= e!881184 (ite c!146447 (t!51693 (toList!11395 thiss!201)) (ite c!146450 (Cons!36775 (h!38318 (toList!11395 thiss!201)) (t!51693 (toList!11395 thiss!201))) Nil!36776)))))

(declare-fun b!1579620 () Bool)

(assert (=> b!1579620 (= c!146450 (and (is-Cons!36775 (toList!11395 thiss!201)) (bvsgt (_1!12721 (h!38318 (toList!11395 thiss!201))) (_1!12721 keyValue!4))))))

(assert (=> b!1579620 (= e!881181 e!881180)))

(declare-fun b!1579621 () Bool)

(declare-fun e!881182 () List!36779)

(declare-fun call!72449 () List!36779)

(assert (=> b!1579621 (= e!881182 call!72449)))

(declare-fun b!1579622 () Bool)

(assert (=> b!1579622 (= e!881182 e!881181)))

(assert (=> b!1579622 (= c!146447 (and (is-Cons!36775 (toList!11395 thiss!201)) (= (_1!12721 (h!38318 (toList!11395 thiss!201))) (_1!12721 keyValue!4))))))

(declare-fun bm!72444 () Bool)

(assert (=> bm!72444 (= call!72448 call!72449)))

(declare-fun d!166301 () Bool)

(assert (=> d!166301 e!881183))

(declare-fun res!1079167 () Bool)

(assert (=> d!166301 (=> (not res!1079167) (not e!881183))))

(assert (=> d!166301 (= res!1079167 (isStrictlySorted!1042 lt!676557))))

(assert (=> d!166301 (= lt!676557 e!881182)))

(declare-fun c!146448 () Bool)

(assert (=> d!166301 (= c!146448 (and (is-Cons!36775 (toList!11395 thiss!201)) (bvslt (_1!12721 (h!38318 (toList!11395 thiss!201))) (_1!12721 keyValue!4))))))

(assert (=> d!166301 (isStrictlySorted!1042 (toList!11395 thiss!201))))

(assert (=> d!166301 (= (insertStrictlySorted!611 (toList!11395 thiss!201) (_1!12721 keyValue!4) (_2!12721 keyValue!4)) lt!676557)))

(declare-fun b!1579623 () Bool)

(assert (=> b!1579623 (= e!881180 call!72447)))

(declare-fun bm!72445 () Bool)

(assert (=> bm!72445 (= call!72447 call!72448)))

(declare-fun bm!72446 () Bool)

(declare-fun $colon$colon!1011 (List!36779 tuple2!25420) List!36779)

(assert (=> bm!72446 (= call!72449 ($colon$colon!1011 e!881184 (ite c!146448 (h!38318 (toList!11395 thiss!201)) (tuple2!25421 (_1!12721 keyValue!4) (_2!12721 keyValue!4)))))))

(declare-fun c!146449 () Bool)

(assert (=> bm!72446 (= c!146449 c!146448)))

(declare-fun b!1579624 () Bool)

(assert (=> b!1579624 (= e!881184 (insertStrictlySorted!611 (t!51693 (toList!11395 thiss!201)) (_1!12721 keyValue!4) (_2!12721 keyValue!4)))))

(declare-fun b!1579625 () Bool)

(assert (=> b!1579625 (= e!881183 (contains!10453 lt!676557 (tuple2!25421 (_1!12721 keyValue!4) (_2!12721 keyValue!4))))))

(assert (= (and d!166301 c!146448) b!1579621))

(assert (= (and d!166301 (not c!146448)) b!1579622))

(assert (= (and b!1579622 c!146447) b!1579618))

(assert (= (and b!1579622 (not c!146447)) b!1579620))

(assert (= (and b!1579620 c!146450) b!1579623))

(assert (= (and b!1579620 (not c!146450)) b!1579617))

(assert (= (or b!1579623 b!1579617) bm!72445))

(assert (= (or b!1579618 bm!72445) bm!72444))

(assert (= (or b!1579621 bm!72444) bm!72446))

(assert (= (and bm!72446 c!146449) b!1579624))

(assert (= (and bm!72446 (not c!146449)) b!1579619))

(assert (= (and d!166301 res!1079167) b!1579616))

(assert (= (and b!1579616 res!1079166) b!1579625))

(declare-fun m!1451343 () Bool)

(assert (=> d!166301 m!1451343))

(declare-fun m!1451345 () Bool)

(assert (=> d!166301 m!1451345))

(declare-fun m!1451347 () Bool)

(assert (=> b!1579624 m!1451347))

(declare-fun m!1451349 () Bool)

(assert (=> b!1579625 m!1451349))

(declare-fun m!1451351 () Bool)

(assert (=> bm!72446 m!1451351))

(declare-fun m!1451353 () Bool)

(assert (=> b!1579616 m!1451353))

(assert (=> start!136982 d!166301))

(declare-fun d!166309 () Bool)

(assert (=> d!166309 (= (inv!58960 thiss!201) (isStrictlySorted!1042 (toList!11395 thiss!201)))))

(declare-fun bs!45750 () Bool)

(assert (= bs!45750 d!166309))

(assert (=> bs!45750 m!1451345))

(assert (=> start!136982 d!166309))

(declare-fun d!166311 () Bool)

(assert (=> d!166311 (= (inv!58960 (ListLongMap!22760 lt!676527)) (isStrictlySorted!1042 (toList!11395 (ListLongMap!22760 lt!676527))))))

(declare-fun bs!45751 () Bool)

(assert (= bs!45751 d!166311))

(declare-fun m!1451355 () Bool)

(assert (=> bs!45751 m!1451355))

(assert (=> start!136982 d!166311))

(declare-fun b!1579652 () Bool)

(declare-fun e!881198 () Bool)

(declare-fun tp!114351 () Bool)

(assert (=> b!1579652 (= e!881198 (and tp_is_empty!39139 tp!114351))))

(assert (=> b!1579497 (= tp!114342 e!881198)))

(assert (= (and b!1579497 (is-Cons!36775 (toList!11395 thiss!201))) b!1579652))

(push 1)

