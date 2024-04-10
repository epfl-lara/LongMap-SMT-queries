; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136986 () Bool)

(assert start!136986)

(declare-datatypes ((B!2598 0))(
  ( (B!2599 (val!19661 Int)) )
))
(declare-datatypes ((tuple2!25424 0))(
  ( (tuple2!25425 (_1!12723 (_ BitVec 64)) (_2!12723 B!2598)) )
))
(declare-datatypes ((List!36781 0))(
  ( (Nil!36778) (Cons!36777 (h!38320 tuple2!25424) (t!51695 List!36781)) )
))
(declare-fun lt!676539 () List!36781)

(declare-fun keyValue!4 () tuple2!25424)

(declare-datatypes ((Option!883 0))(
  ( (Some!882 (v!22374 B!2598)) (None!881) )
))
(declare-fun getValueByKey!807 (List!36781 (_ BitVec 64)) Option!883)

(assert (=> start!136986 (= (getValueByKey!807 lt!676539 (_1!12723 keyValue!4)) (Some!882 (_2!12723 keyValue!4)))))

(declare-datatypes ((Unit!52223 0))(
  ( (Unit!52224) )
))
(declare-fun lt!676540 () Unit!52223)

(declare-fun lemmaContainsTupThenGetReturnValue!393 (List!36781 (_ BitVec 64) B!2598) Unit!52223)

(assert (=> start!136986 (= lt!676540 (lemmaContainsTupThenGetReturnValue!393 lt!676539 (_1!12723 keyValue!4) (_2!12723 keyValue!4)))))

(declare-datatypes ((ListLongMap!22763 0))(
  ( (ListLongMap!22764 (toList!11397 List!36781)) )
))
(declare-fun thiss!201 () ListLongMap!22763)

(declare-fun insertStrictlySorted!613 (List!36781 (_ BitVec 64) B!2598) List!36781)

(assert (=> start!136986 (= lt!676539 (insertStrictlySorted!613 (toList!11397 thiss!201) (_1!12723 keyValue!4) (_2!12723 keyValue!4)))))

(declare-fun inv!58962 (ListLongMap!22763) Bool)

(assert (=> start!136986 (not (inv!58962 (ListLongMap!22764 lt!676539)))))

(declare-fun e!881123 () Bool)

(assert (=> start!136986 (and (inv!58962 thiss!201) e!881123)))

(declare-fun tp_is_empty!39143 () Bool)

(assert (=> start!136986 tp_is_empty!39143))

(declare-fun b!1579503 () Bool)

(declare-fun tp!114348 () Bool)

(assert (=> b!1579503 (= e!881123 tp!114348)))

(assert (= start!136986 b!1579503))

(declare-fun m!1451289 () Bool)

(assert (=> start!136986 m!1451289))

(declare-fun m!1451291 () Bool)

(assert (=> start!136986 m!1451291))

(declare-fun m!1451293 () Bool)

(assert (=> start!136986 m!1451293))

(declare-fun m!1451295 () Bool)

(assert (=> start!136986 m!1451295))

(declare-fun m!1451297 () Bool)

(assert (=> start!136986 m!1451297))

(push 1)

(assert (not start!136986))

(assert (not b!1579503))

(assert tp_is_empty!39143)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166287 () Bool)

(assert (=> d!166287 (= (getValueByKey!807 lt!676539 (_1!12723 keyValue!4)) (Some!882 (_2!12723 keyValue!4)))))

(declare-fun lt!676545 () Unit!52223)

(declare-fun choose!2090 (List!36781 (_ BitVec 64) B!2598) Unit!52223)

(assert (=> d!166287 (= lt!676545 (choose!2090 lt!676539 (_1!12723 keyValue!4) (_2!12723 keyValue!4)))))

(declare-fun e!881134 () Bool)

(assert (=> d!166287 e!881134))

(declare-fun res!1079142 () Bool)

(assert (=> d!166287 (=> (not res!1079142) (not e!881134))))

(declare-fun isStrictlySorted!1041 (List!36781) Bool)

(assert (=> d!166287 (= res!1079142 (isStrictlySorted!1041 lt!676539))))

(assert (=> d!166287 (= (lemmaContainsTupThenGetReturnValue!393 lt!676539 (_1!12723 keyValue!4) (_2!12723 keyValue!4)) lt!676545)))

(declare-fun b!1579524 () Bool)

(declare-fun res!1079144 () Bool)

(assert (=> b!1579524 (=> (not res!1079144) (not e!881134))))

(declare-fun containsKey!887 (List!36781 (_ BitVec 64)) Bool)

(assert (=> b!1579524 (= res!1079144 (containsKey!887 lt!676539 (_1!12723 keyValue!4)))))

(declare-fun b!1579526 () Bool)

(declare-fun contains!10452 (List!36781 tuple2!25424) Bool)

(assert (=> b!1579526 (= e!881134 (contains!10452 lt!676539 (tuple2!25425 (_1!12723 keyValue!4) (_2!12723 keyValue!4))))))

(assert (= (and d!166287 res!1079142) b!1579524))

(assert (= (and b!1579524 res!1079144) b!1579526))

(assert (=> d!166287 m!1451293))

(declare-fun m!1451301 () Bool)

(assert (=> d!166287 m!1451301))

(declare-fun m!1451305 () Bool)

(assert (=> d!166287 m!1451305))

(declare-fun m!1451309 () Bool)

(assert (=> b!1579524 m!1451309))

(declare-fun m!1451313 () Bool)

(assert (=> b!1579526 m!1451313))

(assert (=> start!136986 d!166287))

(declare-fun d!166293 () Bool)

(assert (=> d!166293 (= (inv!58962 thiss!201) (isStrictlySorted!1041 (toList!11397 thiss!201)))))

(declare-fun bs!45747 () Bool)

(assert (= bs!45747 d!166293))

(declare-fun m!1451317 () Bool)

(assert (=> bs!45747 m!1451317))

(assert (=> start!136986 d!166293))

(declare-fun b!1579543 () Bool)

(declare-fun e!881143 () Option!883)

(declare-fun e!881144 () Option!883)

(assert (=> b!1579543 (= e!881143 e!881144)))

(declare-fun c!146418 () Bool)

(assert (=> b!1579543 (= c!146418 (and (is-Cons!36777 lt!676539) (not (= (_1!12723 (h!38320 lt!676539)) (_1!12723 keyValue!4)))))))

(declare-fun d!166297 () Bool)

(declare-fun c!146417 () Bool)

(assert (=> d!166297 (= c!146417 (and (is-Cons!36777 lt!676539) (= (_1!12723 (h!38320 lt!676539)) (_1!12723 keyValue!4))))))

(assert (=> d!166297 (= (getValueByKey!807 lt!676539 (_1!12723 keyValue!4)) e!881143)))

(declare-fun b!1579544 () Bool)

(assert (=> b!1579544 (= e!881144 (getValueByKey!807 (t!51695 lt!676539) (_1!12723 keyValue!4)))))

(declare-fun b!1579545 () Bool)

(assert (=> b!1579545 (= e!881144 None!881)))

(declare-fun b!1579542 () Bool)

(assert (=> b!1579542 (= e!881143 (Some!882 (_2!12723 (h!38320 lt!676539))))))

(assert (= (and d!166297 c!146417) b!1579542))

(assert (= (and d!166297 (not c!146417)) b!1579543))

(assert (= (and b!1579543 c!146418) b!1579544))

(assert (= (and b!1579543 (not c!146418)) b!1579545))

(declare-fun m!1451329 () Bool)

(assert (=> b!1579544 m!1451329))

(assert (=> start!136986 d!166297))

(declare-fun b!1579634 () Bool)

(declare-fun e!881189 () List!36781)

(declare-fun call!72451 () List!36781)

(assert (=> b!1579634 (= e!881189 call!72451)))

(declare-fun b!1579635 () Bool)

(declare-fun c!146457 () Bool)

(assert (=> b!1579635 (= c!146457 (and (is-Cons!36777 (toList!11397 thiss!201)) (bvsgt (_1!12723 (h!38320 (toList!11397 thiss!201))) (_1!12723 keyValue!4))))))

(declare-fun e!881191 () List!36781)

(assert (=> b!1579635 (= e!881191 e!881189)))

(declare-fun b!1579636 () Bool)

(assert (=> b!1579636 (= e!881189 call!72451)))

(declare-fun bm!72448 () Bool)

(declare-fun call!72452 () List!36781)

(assert (=> bm!72448 (= call!72451 call!72452)))

(declare-fun b!1579637 () Bool)

(assert (=> b!1579637 (= e!881191 call!72452)))

(declare-fun bm!72449 () Bool)

(declare-fun e!881193 () List!36781)

(declare-fun call!72450 () List!36781)

(declare-fun c!146456 () Bool)

(declare-fun $colon$colon!1012 (List!36781 tuple2!25424) List!36781)

(assert (=> bm!72449 (= call!72450 ($colon$colon!1012 e!881193 (ite c!146456 (h!38320 (toList!11397 thiss!201)) (tuple2!25425 (_1!12723 keyValue!4) (_2!12723 keyValue!4)))))))

(declare-fun c!146455 () Bool)

(assert (=> bm!72449 (= c!146455 c!146456)))

(declare-fun d!166303 () Bool)

(declare-fun e!881192 () Bool)

(assert (=> d!166303 e!881192))

(declare-fun res!1079168 () Bool)

(assert (=> d!166303 (=> (not res!1079168) (not e!881192))))

(declare-fun lt!676558 () List!36781)

(assert (=> d!166303 (= res!1079168 (isStrictlySorted!1041 lt!676558))))

(declare-fun e!881190 () List!36781)

(assert (=> d!166303 (= lt!676558 e!881190)))

(assert (=> d!166303 (= c!146456 (and (is-Cons!36777 (toList!11397 thiss!201)) (bvslt (_1!12723 (h!38320 (toList!11397 thiss!201))) (_1!12723 keyValue!4))))))

(assert (=> d!166303 (isStrictlySorted!1041 (toList!11397 thiss!201))))

(assert (=> d!166303 (= (insertStrictlySorted!613 (toList!11397 thiss!201) (_1!12723 keyValue!4) (_2!12723 keyValue!4)) lt!676558)))

(declare-fun bm!72447 () Bool)

(assert (=> bm!72447 (= call!72452 call!72450)))

(declare-fun b!1579638 () Bool)

