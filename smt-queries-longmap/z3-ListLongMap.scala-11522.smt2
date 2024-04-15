; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134094 () Bool)

(assert start!134094)

(declare-fun res!1071159 () Bool)

(declare-fun e!873598 () Bool)

(assert (=> start!134094 (=> (not res!1071159) (not e!873598))))

(declare-datatypes ((B!2456 0))(
  ( (B!2457 (val!19590 Int)) )
))
(declare-datatypes ((tuple2!25350 0))(
  ( (tuple2!25351 (_1!12686 (_ BitVec 64)) (_2!12686 B!2456)) )
))
(declare-datatypes ((List!36706 0))(
  ( (Nil!36703) (Cons!36702 (h!38150 tuple2!25350) (t!51606 List!36706)) )
))
(declare-datatypes ((ListLongMap!22785 0))(
  ( (ListLongMap!22786 (toList!11408 List!36706)) )
))
(declare-fun thiss!194 () ListLongMap!22785)

(declare-fun key!103 () (_ BitVec 64))

(declare-fun contains!10322 (ListLongMap!22785 (_ BitVec 64)) Bool)

(assert (=> start!134094 (= res!1071159 (contains!10322 thiss!194 key!103))))

(assert (=> start!134094 e!873598))

(declare-fun e!873599 () Bool)

(declare-fun inv!58004 (ListLongMap!22785) Bool)

(assert (=> start!134094 (and (inv!58004 thiss!194) e!873599)))

(assert (=> start!134094 true))

(declare-fun b!1567213 () Bool)

(declare-datatypes ((Option!874 0))(
  ( (Some!873 (v!22344 B!2456)) (None!872) )
))
(declare-fun isDefined!587 (Option!874) Bool)

(declare-fun getValueByKey!799 (List!36706 (_ BitVec 64)) Option!874)

(assert (=> b!1567213 (= e!873598 (not (isDefined!587 (getValueByKey!799 (toList!11408 thiss!194) key!103))))))

(declare-fun b!1567214 () Bool)

(declare-fun tp!114004 () Bool)

(assert (=> b!1567214 (= e!873599 tp!114004)))

(assert (= (and start!134094 res!1071159) b!1567213))

(assert (= start!134094 b!1567214))

(declare-fun m!1441491 () Bool)

(assert (=> start!134094 m!1441491))

(declare-fun m!1441493 () Bool)

(assert (=> start!134094 m!1441493))

(declare-fun m!1441495 () Bool)

(assert (=> b!1567213 m!1441495))

(assert (=> b!1567213 m!1441495))

(declare-fun m!1441497 () Bool)

(assert (=> b!1567213 m!1441497))

(check-sat (not start!134094) (not b!1567213) (not b!1567214))
(check-sat)
(get-model)

(declare-fun d!163347 () Bool)

(declare-fun e!873622 () Bool)

(assert (=> d!163347 e!873622))

(declare-fun res!1071168 () Bool)

(assert (=> d!163347 (=> res!1071168 e!873622)))

(declare-fun lt!672710 () Bool)

(assert (=> d!163347 (= res!1071168 (not lt!672710))))

(declare-fun lt!672708 () Bool)

(assert (=> d!163347 (= lt!672710 lt!672708)))

(declare-datatypes ((Unit!51875 0))(
  ( (Unit!51876) )
))
(declare-fun lt!672711 () Unit!51875)

(declare-fun e!873623 () Unit!51875)

(assert (=> d!163347 (= lt!672711 e!873623)))

(declare-fun c!144427 () Bool)

(assert (=> d!163347 (= c!144427 lt!672708)))

(declare-fun containsKey!852 (List!36706 (_ BitVec 64)) Bool)

(assert (=> d!163347 (= lt!672708 (containsKey!852 (toList!11408 thiss!194) key!103))))

(assert (=> d!163347 (= (contains!10322 thiss!194 key!103) lt!672710)))

(declare-fun b!1567245 () Bool)

(declare-fun lt!672709 () Unit!51875)

(assert (=> b!1567245 (= e!873623 lt!672709)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!536 (List!36706 (_ BitVec 64)) Unit!51875)

(assert (=> b!1567245 (= lt!672709 (lemmaContainsKeyImpliesGetValueByKeyDefined!536 (toList!11408 thiss!194) key!103))))

(assert (=> b!1567245 (isDefined!587 (getValueByKey!799 (toList!11408 thiss!194) key!103))))

(declare-fun b!1567246 () Bool)

(declare-fun Unit!51877 () Unit!51875)

(assert (=> b!1567246 (= e!873623 Unit!51877)))

(declare-fun b!1567247 () Bool)

(assert (=> b!1567247 (= e!873622 (isDefined!587 (getValueByKey!799 (toList!11408 thiss!194) key!103)))))

(assert (= (and d!163347 c!144427) b!1567245))

(assert (= (and d!163347 (not c!144427)) b!1567246))

(assert (= (and d!163347 (not res!1071168)) b!1567247))

(declare-fun m!1441519 () Bool)

(assert (=> d!163347 m!1441519))

(declare-fun m!1441521 () Bool)

(assert (=> b!1567245 m!1441521))

(assert (=> b!1567245 m!1441495))

(assert (=> b!1567245 m!1441495))

(assert (=> b!1567245 m!1441497))

(assert (=> b!1567247 m!1441495))

(assert (=> b!1567247 m!1441495))

(assert (=> b!1567247 m!1441497))

(assert (=> start!134094 d!163347))

(declare-fun d!163357 () Bool)

(declare-fun isStrictlySorted!989 (List!36706) Bool)

(assert (=> d!163357 (= (inv!58004 thiss!194) (isStrictlySorted!989 (toList!11408 thiss!194)))))

(declare-fun bs!45079 () Bool)

(assert (= bs!45079 d!163357))

(declare-fun m!1441523 () Bool)

(assert (=> bs!45079 m!1441523))

(assert (=> start!134094 d!163357))

(declare-fun d!163359 () Bool)

(declare-fun isEmpty!1156 (Option!874) Bool)

(assert (=> d!163359 (= (isDefined!587 (getValueByKey!799 (toList!11408 thiss!194) key!103)) (not (isEmpty!1156 (getValueByKey!799 (toList!11408 thiss!194) key!103))))))

(declare-fun bs!45080 () Bool)

(assert (= bs!45080 d!163359))

(assert (=> bs!45080 m!1441495))

(declare-fun m!1441525 () Bool)

(assert (=> bs!45080 m!1441525))

(assert (=> b!1567213 d!163359))

(declare-fun b!1567266 () Bool)

(declare-fun e!873634 () Option!874)

(declare-fun e!873635 () Option!874)

(assert (=> b!1567266 (= e!873634 e!873635)))

(declare-fun c!144436 () Bool)

(get-info :version)

(assert (=> b!1567266 (= c!144436 (and ((_ is Cons!36702) (toList!11408 thiss!194)) (not (= (_1!12686 (h!38150 (toList!11408 thiss!194))) key!103))))))

(declare-fun b!1567265 () Bool)

(assert (=> b!1567265 (= e!873634 (Some!873 (_2!12686 (h!38150 (toList!11408 thiss!194)))))))

(declare-fun b!1567267 () Bool)

(assert (=> b!1567267 (= e!873635 (getValueByKey!799 (t!51606 (toList!11408 thiss!194)) key!103))))

(declare-fun b!1567268 () Bool)

(assert (=> b!1567268 (= e!873635 None!872)))

(declare-fun d!163361 () Bool)

(declare-fun c!144435 () Bool)

(assert (=> d!163361 (= c!144435 (and ((_ is Cons!36702) (toList!11408 thiss!194)) (= (_1!12686 (h!38150 (toList!11408 thiss!194))) key!103)))))

(assert (=> d!163361 (= (getValueByKey!799 (toList!11408 thiss!194) key!103) e!873634)))

(assert (= (and d!163361 c!144435) b!1567265))

(assert (= (and d!163361 (not c!144435)) b!1567266))

(assert (= (and b!1567266 c!144436) b!1567267))

(assert (= (and b!1567266 (not c!144436)) b!1567268))

(declare-fun m!1441531 () Bool)

(assert (=> b!1567267 m!1441531))

(assert (=> b!1567213 d!163361))

(declare-fun b!1567273 () Bool)

(declare-fun e!873638 () Bool)

(declare-fun tp_is_empty!39007 () Bool)

(declare-fun tp!114013 () Bool)

(assert (=> b!1567273 (= e!873638 (and tp_is_empty!39007 tp!114013))))

(assert (=> b!1567214 (= tp!114004 e!873638)))

(assert (= (and b!1567214 ((_ is Cons!36702) (toList!11408 thiss!194))) b!1567273))

(check-sat tp_is_empty!39007 (not d!163359) (not b!1567245) (not d!163347) (not b!1567273) (not b!1567267) (not b!1567247) (not d!163357))
(check-sat)
