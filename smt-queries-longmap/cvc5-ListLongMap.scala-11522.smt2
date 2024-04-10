; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134144 () Bool)

(assert start!134144)

(declare-fun res!1071288 () Bool)

(declare-fun e!873796 () Bool)

(assert (=> start!134144 (=> (not res!1071288) (not e!873796))))

(declare-datatypes ((B!2456 0))(
  ( (B!2457 (val!19590 Int)) )
))
(declare-datatypes ((tuple2!25282 0))(
  ( (tuple2!25283 (_1!12652 (_ BitVec 64)) (_2!12652 B!2456)) )
))
(declare-datatypes ((List!36665 0))(
  ( (Nil!36662) (Cons!36661 (h!38108 tuple2!25282) (t!51573 List!36665)) )
))
(declare-datatypes ((ListLongMap!22717 0))(
  ( (ListLongMap!22718 (toList!11374 List!36665)) )
))
(declare-fun thiss!194 () ListLongMap!22717)

(declare-fun key!103 () (_ BitVec 64))

(declare-fun contains!10367 (ListLongMap!22717 (_ BitVec 64)) Bool)

(assert (=> start!134144 (= res!1071288 (contains!10367 thiss!194 key!103))))

(assert (=> start!134144 e!873796))

(declare-fun e!873797 () Bool)

(declare-fun inv!58004 (ListLongMap!22717) Bool)

(assert (=> start!134144 (and (inv!58004 thiss!194) e!873797)))

(assert (=> start!134144 true))

(declare-fun b!1567526 () Bool)

(declare-datatypes ((Option!872 0))(
  ( (Some!871 (v!22348 B!2456)) (None!870) )
))
(declare-fun isDefined!585 (Option!872) Bool)

(declare-fun getValueByKey!796 (List!36665 (_ BitVec 64)) Option!872)

(assert (=> b!1567526 (= e!873796 (not (isDefined!585 (getValueByKey!796 (toList!11374 thiss!194) key!103))))))

(declare-fun b!1567527 () Bool)

(declare-fun tp!114003 () Bool)

(assert (=> b!1567527 (= e!873797 tp!114003)))

(assert (= (and start!134144 res!1071288) b!1567526))

(assert (= start!134144 b!1567527))

(declare-fun m!1442383 () Bool)

(assert (=> start!134144 m!1442383))

(declare-fun m!1442385 () Bool)

(assert (=> start!134144 m!1442385))

(declare-fun m!1442387 () Bool)

(assert (=> b!1567526 m!1442387))

(assert (=> b!1567526 m!1442387))

(declare-fun m!1442389 () Bool)

(assert (=> b!1567526 m!1442389))

(push 1)

(assert (not b!1567526))

(assert (not start!134144))

(assert (not b!1567527))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163601 () Bool)

(declare-fun isEmpty!1151 (Option!872) Bool)

(assert (=> d!163601 (= (isDefined!585 (getValueByKey!796 (toList!11374 thiss!194) key!103)) (not (isEmpty!1151 (getValueByKey!796 (toList!11374 thiss!194) key!103))))))

(declare-fun bs!45124 () Bool)

(assert (= bs!45124 d!163601))

(assert (=> bs!45124 m!1442387))

(declare-fun m!1442407 () Bool)

(assert (=> bs!45124 m!1442407))

(assert (=> b!1567526 d!163601))

(declare-fun d!163607 () Bool)

(declare-fun c!144516 () Bool)

(assert (=> d!163607 (= c!144516 (and (is-Cons!36661 (toList!11374 thiss!194)) (= (_1!12652 (h!38108 (toList!11374 thiss!194))) key!103)))))

(declare-fun e!873818 () Option!872)

(assert (=> d!163607 (= (getValueByKey!796 (toList!11374 thiss!194) key!103) e!873818)))

(declare-fun b!1567558 () Bool)

(declare-fun e!873819 () Option!872)

(assert (=> b!1567558 (= e!873819 (getValueByKey!796 (t!51573 (toList!11374 thiss!194)) key!103))))

(declare-fun b!1567559 () Bool)

(assert (=> b!1567559 (= e!873819 None!870)))

(declare-fun b!1567556 () Bool)

(assert (=> b!1567556 (= e!873818 (Some!871 (_2!12652 (h!38108 (toList!11374 thiss!194)))))))

(declare-fun b!1567557 () Bool)

(assert (=> b!1567557 (= e!873818 e!873819)))

(declare-fun c!144517 () Bool)

(assert (=> b!1567557 (= c!144517 (and (is-Cons!36661 (toList!11374 thiss!194)) (not (= (_1!12652 (h!38108 (toList!11374 thiss!194))) key!103))))))

(assert (= (and d!163607 c!144516) b!1567556))

(assert (= (and d!163607 (not c!144516)) b!1567557))

(assert (= (and b!1567557 c!144517) b!1567558))

(assert (= (and b!1567557 (not c!144517)) b!1567559))

(declare-fun m!1442411 () Bool)

(assert (=> b!1567558 m!1442411))

(assert (=> b!1567526 d!163607))

(declare-fun d!163611 () Bool)

(declare-fun e!873840 () Bool)

(assert (=> d!163611 e!873840))

(declare-fun res!1071302 () Bool)

(assert (=> d!163611 (=> res!1071302 e!873840)))

(declare-fun lt!673017 () Bool)

(assert (=> d!163611 (= res!1071302 (not lt!673017))))

(declare-fun lt!673014 () Bool)

(assert (=> d!163611 (= lt!673017 lt!673014)))

(declare-datatypes ((Unit!52066 0))(
  ( (Unit!52067) )
))
(declare-fun lt!673015 () Unit!52066)

(declare-fun e!873841 () Unit!52066)

(assert (=> d!163611 (= lt!673015 e!873841)))

(declare-fun c!144531 () Bool)

(assert (=> d!163611 (= c!144531 lt!673014)))

(declare-fun containsKey!855 (List!36665 (_ BitVec 64)) Bool)

(assert (=> d!163611 (= lt!673014 (containsKey!855 (toList!11374 thiss!194) key!103))))

(assert (=> d!163611 (= (contains!10367 thiss!194 key!103) lt!673017)))

(declare-fun b!1567593 () Bool)

(declare-fun lt!673016 () Unit!52066)

(assert (=> b!1567593 (= e!873841 lt!673016)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!538 (List!36665 (_ BitVec 64)) Unit!52066)

(assert (=> b!1567593 (= lt!673016 (lemmaContainsKeyImpliesGetValueByKeyDefined!538 (toList!11374 thiss!194) key!103))))

(assert (=> b!1567593 (isDefined!585 (getValueByKey!796 (toList!11374 thiss!194) key!103))))

(declare-fun b!1567594 () Bool)

(declare-fun Unit!52068 () Unit!52066)

(assert (=> b!1567594 (= e!873841 Unit!52068)))

(declare-fun b!1567595 () Bool)

(assert (=> b!1567595 (= e!873840 (isDefined!585 (getValueByKey!796 (toList!11374 thiss!194) key!103)))))

(assert (= (and d!163611 c!144531) b!1567593))

(assert (= (and d!163611 (not c!144531)) b!1567594))

(assert (= (and d!163611 (not res!1071302)) b!1567595))

(declare-fun m!1442423 () Bool)

(assert (=> d!163611 m!1442423))

(declare-fun m!1442425 () Bool)

(assert (=> b!1567593 m!1442425))

(assert (=> b!1567593 m!1442387))

(assert (=> b!1567593 m!1442387))

(assert (=> b!1567593 m!1442389))

(assert (=> b!1567595 m!1442387))

(assert (=> b!1567595 m!1442387))

(assert (=> b!1567595 m!1442389))

(assert (=> start!134144 d!163611))

(declare-fun d!163621 () Bool)

(declare-fun isStrictlySorted!991 (List!36665) Bool)

(assert (=> d!163621 (= (inv!58004 thiss!194) (isStrictlySorted!991 (toList!11374 thiss!194)))))

(declare-fun bs!45128 () Bool)

(assert (= bs!45128 d!163621))

(declare-fun m!1442431 () Bool)

(assert (=> bs!45128 m!1442431))

(assert (=> start!134144 d!163621))

(declare-fun b!1567615 () Bool)

(declare-fun e!873852 () Bool)

(declare-fun tp_is_empty!39007 () Bool)

(declare-fun tp!114016 () Bool)

(assert (=> b!1567615 (= e!873852 (and tp_is_empty!39007 tp!114016))))

(assert (=> b!1567527 (= tp!114003 e!873852)))

(assert (= (and b!1567527 (is-Cons!36661 (toList!11374 thiss!194))) b!1567615))

(push 1)

