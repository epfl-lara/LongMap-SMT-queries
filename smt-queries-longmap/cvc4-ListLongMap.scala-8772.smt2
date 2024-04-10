; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106640 () Bool)

(assert start!106640)

(declare-fun res!843357 () Bool)

(declare-fun e!721637 () Bool)

(assert (=> start!106640 (=> (not res!843357) (not e!721637))))

(declare-datatypes ((B!2028 0))(
  ( (B!2029 (val!16349 Int)) )
))
(declare-datatypes ((tuple2!21216 0))(
  ( (tuple2!21217 (_1!10619 (_ BitVec 64)) (_2!10619 B!2028)) )
))
(declare-datatypes ((List!28341 0))(
  ( (Nil!28338) (Cons!28337 (h!29546 tuple2!21216) (t!41868 List!28341)) )
))
(declare-datatypes ((ListLongMap!19011 0))(
  ( (ListLongMap!19012 (toList!9521 List!28341)) )
))
(declare-fun lm!209 () ListLongMap!19011)

(declare-fun a!499 () (_ BitVec 64))

(declare-fun contains!7657 (ListLongMap!19011 (_ BitVec 64)) Bool)

(assert (=> start!106640 (= res!843357 (not (contains!7657 lm!209 a!499)))))

(assert (=> start!106640 e!721637))

(declare-fun e!721636 () Bool)

(declare-fun inv!44187 (ListLongMap!19011) Bool)

(assert (=> start!106640 (and (inv!44187 lm!209) e!721636)))

(assert (=> start!106640 true))

(declare-fun b!1266872 () Bool)

(declare-fun res!843358 () Bool)

(assert (=> b!1266872 (=> (not res!843358) (not e!721637))))

(declare-fun isStrictlySorted!810 (List!28341) Bool)

(assert (=> b!1266872 (= res!843358 (isStrictlySorted!810 (toList!9521 lm!209)))))

(declare-fun b!1266873 () Bool)

(declare-fun containsKey!669 (List!28341 (_ BitVec 64)) Bool)

(assert (=> b!1266873 (= e!721637 (containsKey!669 (toList!9521 lm!209) a!499))))

(declare-fun b!1266874 () Bool)

(declare-fun tp!96494 () Bool)

(assert (=> b!1266874 (= e!721636 tp!96494)))

(assert (= (and start!106640 res!843357) b!1266872))

(assert (= (and b!1266872 res!843358) b!1266873))

(assert (= start!106640 b!1266874))

(declare-fun m!1166473 () Bool)

(assert (=> start!106640 m!1166473))

(declare-fun m!1166475 () Bool)

(assert (=> start!106640 m!1166475))

(declare-fun m!1166477 () Bool)

(assert (=> b!1266872 m!1166477))

(declare-fun m!1166479 () Bool)

(assert (=> b!1266873 m!1166479))

(push 1)

(assert (not b!1266873))

(assert (not start!106640))

(assert (not b!1266872))

(assert (not b!1266874))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139343 () Bool)

(declare-fun res!843375 () Bool)

(declare-fun e!721654 () Bool)

(assert (=> d!139343 (=> res!843375 e!721654)))

(assert (=> d!139343 (= res!843375 (and (is-Cons!28337 (toList!9521 lm!209)) (= (_1!10619 (h!29546 (toList!9521 lm!209))) a!499)))))

(assert (=> d!139343 (= (containsKey!669 (toList!9521 lm!209) a!499) e!721654)))

(declare-fun b!1266891 () Bool)

(declare-fun e!721655 () Bool)

(assert (=> b!1266891 (= e!721654 e!721655)))

(declare-fun res!843376 () Bool)

(assert (=> b!1266891 (=> (not res!843376) (not e!721655))))

(assert (=> b!1266891 (= res!843376 (and (or (not (is-Cons!28337 (toList!9521 lm!209))) (bvsle (_1!10619 (h!29546 (toList!9521 lm!209))) a!499)) (is-Cons!28337 (toList!9521 lm!209)) (bvslt (_1!10619 (h!29546 (toList!9521 lm!209))) a!499)))))

(declare-fun b!1266892 () Bool)

(assert (=> b!1266892 (= e!721655 (containsKey!669 (t!41868 (toList!9521 lm!209)) a!499))))

(assert (= (and d!139343 (not res!843375)) b!1266891))

(assert (= (and b!1266891 res!843376) b!1266892))

(declare-fun m!1166485 () Bool)

(assert (=> b!1266892 m!1166485))

(assert (=> b!1266873 d!139343))

(declare-fun d!139351 () Bool)

(declare-fun e!721673 () Bool)

(assert (=> d!139351 e!721673))

(declare-fun res!843388 () Bool)

(assert (=> d!139351 (=> res!843388 e!721673)))

(declare-fun lt!574227 () Bool)

(assert (=> d!139351 (= res!843388 (not lt!574227))))

(declare-fun lt!574224 () Bool)

(assert (=> d!139351 (= lt!574227 lt!574224)))

(declare-datatypes ((Unit!42200 0))(
  ( (Unit!42201) )
))
(declare-fun lt!574226 () Unit!42200)

(declare-fun e!721672 () Unit!42200)

(assert (=> d!139351 (= lt!574226 e!721672)))

(declare-fun c!123523 () Bool)

(assert (=> d!139351 (= c!123523 lt!574224)))

(assert (=> d!139351 (= lt!574224 (containsKey!669 (toList!9521 lm!209) a!499))))

(assert (=> d!139351 (= (contains!7657 lm!209 a!499) lt!574227)))

(declare-fun b!1266914 () Bool)

(declare-fun lt!574225 () Unit!42200)

(assert (=> b!1266914 (= e!721672 lt!574225)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!451 (List!28341 (_ BitVec 64)) Unit!42200)

(assert (=> b!1266914 (= lt!574225 (lemmaContainsKeyImpliesGetValueByKeyDefined!451 (toList!9521 lm!209) a!499))))

(declare-datatypes ((Option!735 0))(
  ( (Some!734 (v!19018 B!2028)) (None!733) )
))
(declare-fun isDefined!490 (Option!735) Bool)

(declare-fun getValueByKey!683 (List!28341 (_ BitVec 64)) Option!735)

(assert (=> b!1266914 (isDefined!490 (getValueByKey!683 (toList!9521 lm!209) a!499))))

(declare-fun b!1266915 () Bool)

(declare-fun Unit!42206 () Unit!42200)

(assert (=> b!1266915 (= e!721672 Unit!42206)))

(declare-fun b!1266916 () Bool)

(assert (=> b!1266916 (= e!721673 (isDefined!490 (getValueByKey!683 (toList!9521 lm!209) a!499)))))

(assert (= (and d!139351 c!123523) b!1266914))

(assert (= (and d!139351 (not c!123523)) b!1266915))

(assert (= (and d!139351 (not res!843388)) b!1266916))

(assert (=> d!139351 m!1166479))

(declare-fun m!1166495 () Bool)

(assert (=> b!1266914 m!1166495))

(declare-fun m!1166497 () Bool)

(assert (=> b!1266914 m!1166497))

(assert (=> b!1266914 m!1166497))

(declare-fun m!1166499 () Bool)

(assert (=> b!1266914 m!1166499))

(assert (=> b!1266916 m!1166497))

(assert (=> b!1266916 m!1166497))

(assert (=> b!1266916 m!1166499))

(assert (=> start!106640 d!139351))

(declare-fun d!139357 () Bool)

(assert (=> d!139357 (= (inv!44187 lm!209) (isStrictlySorted!810 (toList!9521 lm!209)))))

(declare-fun bs!35859 () Bool)

(assert (= bs!35859 d!139357))

(assert (=> bs!35859 m!1166477))

(assert (=> start!106640 d!139357))

(declare-fun d!139361 () Bool)

(declare-fun res!843400 () Bool)

(declare-fun e!721688 () Bool)

(assert (=> d!139361 (=> res!843400 e!721688)))

(assert (=> d!139361 (= res!843400 (or (is-Nil!28338 (toList!9521 lm!209)) (is-Nil!28338 (t!41868 (toList!9521 lm!209)))))))

(assert (=> d!139361 (= (isStrictlySorted!810 (toList!9521 lm!209)) e!721688)))

(declare-fun b!1266935 () Bool)

(declare-fun e!721689 () Bool)

(assert (=> b!1266935 (= e!721688 e!721689)))

(declare-fun res!843401 () Bool)

(assert (=> b!1266935 (=> (not res!843401) (not e!721689))))

(assert (=> b!1266935 (= res!843401 (bvslt (_1!10619 (h!29546 (toList!9521 lm!209))) (_1!10619 (h!29546 (t!41868 (toList!9521 lm!209))))))))

(declare-fun b!1266936 () Bool)

(assert (=> b!1266936 (= e!721689 (isStrictlySorted!810 (t!41868 (toList!9521 lm!209))))))

(assert (= (and d!139361 (not res!843400)) b!1266935))

