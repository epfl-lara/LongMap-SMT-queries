; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134148 () Bool)

(assert start!134148)

(declare-fun res!1071294 () Bool)

(declare-fun e!873808 () Bool)

(assert (=> start!134148 (=> (not res!1071294) (not e!873808))))

(declare-datatypes ((B!2460 0))(
  ( (B!2461 (val!19592 Int)) )
))
(declare-datatypes ((tuple2!25286 0))(
  ( (tuple2!25287 (_1!12654 (_ BitVec 64)) (_2!12654 B!2460)) )
))
(declare-datatypes ((List!36667 0))(
  ( (Nil!36664) (Cons!36663 (h!38110 tuple2!25286) (t!51575 List!36667)) )
))
(declare-datatypes ((ListLongMap!22721 0))(
  ( (ListLongMap!22722 (toList!11376 List!36667)) )
))
(declare-fun thiss!194 () ListLongMap!22721)

(declare-fun key!103 () (_ BitVec 64))

(declare-fun contains!10369 (ListLongMap!22721 (_ BitVec 64)) Bool)

(assert (=> start!134148 (= res!1071294 (contains!10369 thiss!194 key!103))))

(assert (=> start!134148 e!873808))

(declare-fun e!873809 () Bool)

(declare-fun inv!58006 (ListLongMap!22721) Bool)

(assert (=> start!134148 (and (inv!58006 thiss!194) e!873809)))

(assert (=> start!134148 true))

(declare-fun b!1567538 () Bool)

(declare-datatypes ((Option!874 0))(
  ( (Some!873 (v!22350 B!2460)) (None!872) )
))
(declare-fun isDefined!587 (Option!874) Bool)

(declare-fun getValueByKey!798 (List!36667 (_ BitVec 64)) Option!874)

(assert (=> b!1567538 (= e!873808 (not (isDefined!587 (getValueByKey!798 (toList!11376 thiss!194) key!103))))))

(declare-fun b!1567539 () Bool)

(declare-fun tp!114009 () Bool)

(assert (=> b!1567539 (= e!873809 tp!114009)))

(assert (= (and start!134148 res!1071294) b!1567538))

(assert (= start!134148 b!1567539))

(declare-fun m!1442399 () Bool)

(assert (=> start!134148 m!1442399))

(declare-fun m!1442401 () Bool)

(assert (=> start!134148 m!1442401))

(declare-fun m!1442403 () Bool)

(assert (=> b!1567538 m!1442403))

(assert (=> b!1567538 m!1442403))

(declare-fun m!1442405 () Bool)

(assert (=> b!1567538 m!1442405))

(push 1)

(assert (not b!1567538))

(assert (not start!134148))

(assert (not b!1567539))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163605 () Bool)

(declare-fun isEmpty!1152 (Option!874) Bool)

(assert (=> d!163605 (= (isDefined!587 (getValueByKey!798 (toList!11376 thiss!194) key!103)) (not (isEmpty!1152 (getValueByKey!798 (toList!11376 thiss!194) key!103))))))

(declare-fun bs!45125 () Bool)

(assert (= bs!45125 d!163605))

(assert (=> bs!45125 m!1442403))

(declare-fun m!1442409 () Bool)

(assert (=> bs!45125 m!1442409))

(assert (=> b!1567538 d!163605))

(declare-fun b!1567561 () Bool)

(declare-fun e!873820 () Option!874)

(declare-fun e!873821 () Option!874)

(assert (=> b!1567561 (= e!873820 e!873821)))

(declare-fun c!144519 () Bool)

(assert (=> b!1567561 (= c!144519 (and (is-Cons!36663 (toList!11376 thiss!194)) (not (= (_1!12654 (h!38110 (toList!11376 thiss!194))) key!103))))))

(declare-fun b!1567562 () Bool)

(assert (=> b!1567562 (= e!873821 (getValueByKey!798 (t!51575 (toList!11376 thiss!194)) key!103))))

(declare-fun b!1567560 () Bool)

(assert (=> b!1567560 (= e!873820 (Some!873 (_2!12654 (h!38110 (toList!11376 thiss!194)))))))

(declare-fun d!163609 () Bool)

(declare-fun c!144518 () Bool)

(assert (=> d!163609 (= c!144518 (and (is-Cons!36663 (toList!11376 thiss!194)) (= (_1!12654 (h!38110 (toList!11376 thiss!194))) key!103)))))

(assert (=> d!163609 (= (getValueByKey!798 (toList!11376 thiss!194) key!103) e!873820)))

(declare-fun b!1567563 () Bool)

(assert (=> b!1567563 (= e!873821 None!872)))

(assert (= (and d!163609 c!144518) b!1567560))

(assert (= (and d!163609 (not c!144518)) b!1567561))

(assert (= (and b!1567561 c!144519) b!1567562))

(assert (= (and b!1567561 (not c!144519)) b!1567563))

(declare-fun m!1442413 () Bool)

(assert (=> b!1567562 m!1442413))

(assert (=> b!1567538 d!163609))

(declare-fun d!163613 () Bool)

(declare-fun e!873842 () Bool)

(assert (=> d!163613 e!873842))

(declare-fun res!1071303 () Bool)

(assert (=> d!163613 (=> res!1071303 e!873842)))

(declare-fun lt!673018 () Bool)

(assert (=> d!163613 (= res!1071303 (not lt!673018))))

(declare-fun lt!673019 () Bool)

(assert (=> d!163613 (= lt!673018 lt!673019)))

(declare-datatypes ((Unit!52069 0))(
  ( (Unit!52070) )
))
(declare-fun lt!673021 () Unit!52069)

(declare-fun e!873843 () Unit!52069)

(assert (=> d!163613 (= lt!673021 e!873843)))

(declare-fun c!144532 () Bool)

(assert (=> d!163613 (= c!144532 lt!673019)))

(declare-fun containsKey!856 (List!36667 (_ BitVec 64)) Bool)

(assert (=> d!163613 (= lt!673019 (containsKey!856 (toList!11376 thiss!194) key!103))))

(assert (=> d!163613 (= (contains!10369 thiss!194 key!103) lt!673018)))

(declare-fun b!1567596 () Bool)

(declare-fun lt!673020 () Unit!52069)

(assert (=> b!1567596 (= e!873843 lt!673020)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!539 (List!36667 (_ BitVec 64)) Unit!52069)

(assert (=> b!1567596 (= lt!673020 (lemmaContainsKeyImpliesGetValueByKeyDefined!539 (toList!11376 thiss!194) key!103))))

(assert (=> b!1567596 (isDefined!587 (getValueByKey!798 (toList!11376 thiss!194) key!103))))

(declare-fun b!1567597 () Bool)

(declare-fun Unit!52071 () Unit!52069)

(assert (=> b!1567597 (= e!873843 Unit!52071)))

(declare-fun b!1567598 () Bool)

(assert (=> b!1567598 (= e!873842 (isDefined!587 (getValueByKey!798 (toList!11376 thiss!194) key!103)))))

(assert (= (and d!163613 c!144532) b!1567596))

