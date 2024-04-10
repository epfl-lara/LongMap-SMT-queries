; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134146 () Bool)

(assert start!134146)

(declare-fun res!1071291 () Bool)

(declare-fun e!873802 () Bool)

(assert (=> start!134146 (=> (not res!1071291) (not e!873802))))

(declare-datatypes ((B!2458 0))(
  ( (B!2459 (val!19591 Int)) )
))
(declare-datatypes ((tuple2!25284 0))(
  ( (tuple2!25285 (_1!12653 (_ BitVec 64)) (_2!12653 B!2458)) )
))
(declare-datatypes ((List!36666 0))(
  ( (Nil!36663) (Cons!36662 (h!38109 tuple2!25284) (t!51574 List!36666)) )
))
(declare-datatypes ((ListLongMap!22719 0))(
  ( (ListLongMap!22720 (toList!11375 List!36666)) )
))
(declare-fun thiss!194 () ListLongMap!22719)

(declare-fun key!103 () (_ BitVec 64))

(declare-fun contains!10368 (ListLongMap!22719 (_ BitVec 64)) Bool)

(assert (=> start!134146 (= res!1071291 (contains!10368 thiss!194 key!103))))

(assert (=> start!134146 e!873802))

(declare-fun e!873803 () Bool)

(declare-fun inv!58005 (ListLongMap!22719) Bool)

(assert (=> start!134146 (and (inv!58005 thiss!194) e!873803)))

(assert (=> start!134146 true))

(declare-fun b!1567532 () Bool)

(declare-datatypes ((Option!873 0))(
  ( (Some!872 (v!22349 B!2458)) (None!871) )
))
(declare-fun isDefined!586 (Option!873) Bool)

(declare-fun getValueByKey!797 (List!36666 (_ BitVec 64)) Option!873)

(assert (=> b!1567532 (= e!873802 (not (isDefined!586 (getValueByKey!797 (toList!11375 thiss!194) key!103))))))

(declare-fun b!1567533 () Bool)

(declare-fun tp!114006 () Bool)

(assert (=> b!1567533 (= e!873803 tp!114006)))

(assert (= (and start!134146 res!1071291) b!1567532))

(assert (= start!134146 b!1567533))

(declare-fun m!1442391 () Bool)

(assert (=> start!134146 m!1442391))

(declare-fun m!1442393 () Bool)

(assert (=> start!134146 m!1442393))

(declare-fun m!1442395 () Bool)

(assert (=> b!1567532 m!1442395))

(assert (=> b!1567532 m!1442395))

(declare-fun m!1442397 () Bool)

(assert (=> b!1567532 m!1442397))

(check-sat (not start!134146) (not b!1567532) (not b!1567533))
(check-sat)
(get-model)

(declare-fun d!163603 () Bool)

(declare-fun e!873827 () Bool)

(assert (=> d!163603 e!873827))

(declare-fun res!1071297 () Bool)

(assert (=> d!163603 (=> res!1071297 e!873827)))

(declare-fun lt!672997 () Bool)

(assert (=> d!163603 (= res!1071297 (not lt!672997))))

(declare-fun lt!672995 () Bool)

(assert (=> d!163603 (= lt!672997 lt!672995)))

(declare-datatypes ((Unit!52063 0))(
  ( (Unit!52064) )
))
(declare-fun lt!672996 () Unit!52063)

(declare-fun e!873826 () Unit!52063)

(assert (=> d!163603 (= lt!672996 e!873826)))

(declare-fun c!144522 () Bool)

(assert (=> d!163603 (= c!144522 lt!672995)))

(declare-fun containsKey!854 (List!36666 (_ BitVec 64)) Bool)

(assert (=> d!163603 (= lt!672995 (containsKey!854 (toList!11375 thiss!194) key!103))))

(assert (=> d!163603 (= (contains!10368 thiss!194 key!103) lt!672997)))

(declare-fun b!1567570 () Bool)

(declare-fun lt!672994 () Unit!52063)

(assert (=> b!1567570 (= e!873826 lt!672994)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!537 (List!36666 (_ BitVec 64)) Unit!52063)

(assert (=> b!1567570 (= lt!672994 (lemmaContainsKeyImpliesGetValueByKeyDefined!537 (toList!11375 thiss!194) key!103))))

(assert (=> b!1567570 (isDefined!586 (getValueByKey!797 (toList!11375 thiss!194) key!103))))

(declare-fun b!1567571 () Bool)

(declare-fun Unit!52065 () Unit!52063)

(assert (=> b!1567571 (= e!873826 Unit!52065)))

(declare-fun b!1567572 () Bool)

(assert (=> b!1567572 (= e!873827 (isDefined!586 (getValueByKey!797 (toList!11375 thiss!194) key!103)))))

(assert (= (and d!163603 c!144522) b!1567570))

(assert (= (and d!163603 (not c!144522)) b!1567571))

(assert (= (and d!163603 (not res!1071297)) b!1567572))

(declare-fun m!1442415 () Bool)

(assert (=> d!163603 m!1442415))

(declare-fun m!1442417 () Bool)

(assert (=> b!1567570 m!1442417))

(assert (=> b!1567570 m!1442395))

(assert (=> b!1567570 m!1442395))

(assert (=> b!1567570 m!1442397))

(assert (=> b!1567572 m!1442395))

(assert (=> b!1567572 m!1442395))

(assert (=> b!1567572 m!1442397))

(assert (=> start!134146 d!163603))

(declare-fun d!163615 () Bool)

(declare-fun isStrictlySorted!990 (List!36666) Bool)

(assert (=> d!163615 (= (inv!58005 thiss!194) (isStrictlySorted!990 (toList!11375 thiss!194)))))

(declare-fun bs!45126 () Bool)

(assert (= bs!45126 d!163615))

(declare-fun m!1442419 () Bool)

(assert (=> bs!45126 m!1442419))

(assert (=> start!134146 d!163615))

(declare-fun d!163617 () Bool)

(declare-fun isEmpty!1153 (Option!873) Bool)

(assert (=> d!163617 (= (isDefined!586 (getValueByKey!797 (toList!11375 thiss!194) key!103)) (not (isEmpty!1153 (getValueByKey!797 (toList!11375 thiss!194) key!103))))))

(declare-fun bs!45127 () Bool)

(assert (= bs!45127 d!163617))

(assert (=> bs!45127 m!1442395))

(declare-fun m!1442421 () Bool)

(assert (=> bs!45127 m!1442421))

(assert (=> b!1567532 d!163617))

(declare-fun b!1567599 () Bool)

(declare-fun e!873844 () Option!873)

(assert (=> b!1567599 (= e!873844 (Some!872 (_2!12653 (h!38109 (toList!11375 thiss!194)))))))

(declare-fun b!1567600 () Bool)

(declare-fun e!873845 () Option!873)

(assert (=> b!1567600 (= e!873844 e!873845)))

(declare-fun c!144534 () Bool)

(get-info :version)

(assert (=> b!1567600 (= c!144534 (and ((_ is Cons!36662) (toList!11375 thiss!194)) (not (= (_1!12653 (h!38109 (toList!11375 thiss!194))) key!103))))))

(declare-fun d!163619 () Bool)

(declare-fun c!144533 () Bool)

(assert (=> d!163619 (= c!144533 (and ((_ is Cons!36662) (toList!11375 thiss!194)) (= (_1!12653 (h!38109 (toList!11375 thiss!194))) key!103)))))

(assert (=> d!163619 (= (getValueByKey!797 (toList!11375 thiss!194) key!103) e!873844)))

(declare-fun b!1567602 () Bool)

(assert (=> b!1567602 (= e!873845 None!871)))

(declare-fun b!1567601 () Bool)

(assert (=> b!1567601 (= e!873845 (getValueByKey!797 (t!51574 (toList!11375 thiss!194)) key!103))))

(assert (= (and d!163619 c!144533) b!1567599))

(assert (= (and d!163619 (not c!144533)) b!1567600))

(assert (= (and b!1567600 c!144534) b!1567601))

(assert (= (and b!1567600 (not c!144534)) b!1567602))

(declare-fun m!1442435 () Bool)

(assert (=> b!1567601 m!1442435))

(assert (=> b!1567532 d!163619))

(declare-fun b!1567617 () Bool)

(declare-fun e!873854 () Bool)

(declare-fun tp_is_empty!39011 () Bool)

(declare-fun tp!114018 () Bool)

(assert (=> b!1567617 (= e!873854 (and tp_is_empty!39011 tp!114018))))

(assert (=> b!1567533 (= tp!114006 e!873854)))

(assert (= (and b!1567533 ((_ is Cons!36662) (toList!11375 thiss!194))) b!1567617))

(check-sat (not b!1567601) tp_is_empty!39011 (not d!163615) (not d!163617) (not b!1567617) (not b!1567572) (not d!163603) (not b!1567570))
(check-sat)
