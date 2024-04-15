; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106664 () Bool)

(assert start!106664)

(declare-fun b!1266891 () Bool)

(declare-fun res!843381 () Bool)

(declare-fun e!721666 () Bool)

(assert (=> b!1266891 (=> (not res!843381) (not e!721666))))

(declare-datatypes ((B!2032 0))(
  ( (B!2033 (val!16351 Int)) )
))
(declare-datatypes ((tuple2!21302 0))(
  ( (tuple2!21303 (_1!10662 (_ BitVec 64)) (_2!10662 B!2032)) )
))
(declare-datatypes ((List!28427 0))(
  ( (Nil!28424) (Cons!28423 (h!29632 tuple2!21302) (t!41945 List!28427)) )
))
(declare-datatypes ((ListLongMap!19097 0))(
  ( (ListLongMap!19098 (toList!9564 List!28427)) )
))
(declare-fun lm!209 () ListLongMap!19097)

(declare-fun isStrictlySorted!808 (List!28427) Bool)

(assert (=> b!1266891 (= res!843381 (isStrictlySorted!808 (toList!9564 lm!209)))))

(declare-fun b!1266892 () Bool)

(declare-fun res!843379 () Bool)

(assert (=> b!1266892 (=> (not res!843379) (not e!721666))))

(declare-fun a!499 () (_ BitVec 64))

(declare-fun containsKey!669 (List!28427 (_ BitVec 64)) Bool)

(assert (=> b!1266892 (= res!843379 (not (containsKey!669 (toList!9564 lm!209) a!499)))))

(declare-fun res!843380 () Bool)

(assert (=> start!106664 (=> (not res!843380) (not e!721666))))

(declare-fun contains!7628 (ListLongMap!19097 (_ BitVec 64)) Bool)

(assert (=> start!106664 (= res!843380 (not (contains!7628 lm!209 a!499)))))

(assert (=> start!106664 e!721666))

(declare-fun e!721667 () Bool)

(declare-fun inv!44194 (ListLongMap!19097) Bool)

(assert (=> start!106664 (and (inv!44194 lm!209) e!721667)))

(assert (=> start!106664 true))

(declare-fun b!1266893 () Bool)

(declare-fun -!2110 (ListLongMap!19097 (_ BitVec 64)) ListLongMap!19097)

(assert (=> b!1266893 (= e!721666 (not (= (-!2110 lm!209 a!499) lm!209)))))

(declare-fun removeStrictlySorted!162 (List!28427 (_ BitVec 64)) List!28427)

(assert (=> b!1266893 (= (removeStrictlySorted!162 (toList!9564 lm!209) a!499) (toList!9564 lm!209))))

(declare-datatypes ((Unit!42059 0))(
  ( (Unit!42060) )
))
(declare-fun lt!574066 () Unit!42059)

(declare-fun lemmaRemoveStrictlySortedNotPresentPreserves!2 (List!28427 (_ BitVec 64)) Unit!42059)

(assert (=> b!1266893 (= lt!574066 (lemmaRemoveStrictlySortedNotPresentPreserves!2 (toList!9564 lm!209) a!499))))

(declare-fun b!1266894 () Bool)

(declare-fun tp!96509 () Bool)

(assert (=> b!1266894 (= e!721667 tp!96509)))

(assert (= (and start!106664 res!843380) b!1266891))

(assert (= (and b!1266891 res!843381) b!1266892))

(assert (= (and b!1266892 res!843379) b!1266893))

(assert (= start!106664 b!1266894))

(declare-fun m!1166005 () Bool)

(assert (=> b!1266891 m!1166005))

(declare-fun m!1166007 () Bool)

(assert (=> b!1266892 m!1166007))

(declare-fun m!1166009 () Bool)

(assert (=> start!106664 m!1166009))

(declare-fun m!1166011 () Bool)

(assert (=> start!106664 m!1166011))

(declare-fun m!1166013 () Bool)

(assert (=> b!1266893 m!1166013))

(declare-fun m!1166015 () Bool)

(assert (=> b!1266893 m!1166015))

(declare-fun m!1166017 () Bool)

(assert (=> b!1266893 m!1166017))

(push 1)

(assert (not b!1266892))

(assert (not b!1266891))

(assert (not b!1266893))

(assert (not b!1266894))

(assert (not start!106664))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139237 () Bool)

(declare-fun res!843399 () Bool)

(declare-fun e!721682 () Bool)

(assert (=> d!139237 (=> res!843399 e!721682)))

(assert (=> d!139237 (= res!843399 (and (is-Cons!28423 (toList!9564 lm!209)) (= (_1!10662 (h!29632 (toList!9564 lm!209))) a!499)))))

(assert (=> d!139237 (= (containsKey!669 (toList!9564 lm!209) a!499) e!721682)))

(declare-fun b!1266915 () Bool)

(declare-fun e!721683 () Bool)

(assert (=> b!1266915 (= e!721682 e!721683)))

(declare-fun res!843400 () Bool)

(assert (=> b!1266915 (=> (not res!843400) (not e!721683))))

(assert (=> b!1266915 (= res!843400 (and (or (not (is-Cons!28423 (toList!9564 lm!209))) (bvsle (_1!10662 (h!29632 (toList!9564 lm!209))) a!499)) (is-Cons!28423 (toList!9564 lm!209)) (bvslt (_1!10662 (h!29632 (toList!9564 lm!209))) a!499)))))

(declare-fun b!1266916 () Bool)

(assert (=> b!1266916 (= e!721683 (containsKey!669 (t!41945 (toList!9564 lm!209)) a!499))))

(assert (= (and d!139237 (not res!843399)) b!1266915))

(assert (= (and b!1266915 res!843400) b!1266916))

(declare-fun m!1166033 () Bool)

(assert (=> b!1266916 m!1166033))

(assert (=> b!1266892 d!139237))

(declare-fun d!139241 () Bool)

(declare-fun e!721694 () Bool)

(assert (=> d!139241 e!721694))

(declare-fun res!843407 () Bool)

(assert (=> d!139241 (=> res!843407 e!721694)))

(declare-fun lt!574088 () Bool)

(assert (=> d!139241 (= res!843407 (not lt!574088))))

(declare-fun lt!574086 () Bool)

(assert (=> d!139241 (= lt!574088 lt!574086)))

(declare-fun lt!574087 () Unit!42059)

(declare-fun e!721695 () Unit!42059)

(assert (=> d!139241 (= lt!574087 e!721695)))

(declare-fun c!123513 () Bool)

(assert (=> d!139241 (= c!123513 lt!574086)))

(assert (=> d!139241 (= lt!574086 (containsKey!669 (toList!9564 lm!209) a!499))))

(assert (=> d!139241 (= (contains!7628 lm!209 a!499) lt!574088)))

(declare-fun b!1266931 () Bool)

(declare-fun lt!574089 () Unit!42059)

(assert (=> b!1266931 (= e!721695 lt!574089)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!451 (List!28427 (_ BitVec 64)) Unit!42059)

(assert (=> b!1266931 (= lt!574089 (lemmaContainsKeyImpliesGetValueByKeyDefined!451 (toList!9564 lm!209) a!499))))

(declare-datatypes ((Option!738 0))(
  ( (Some!737 (v!19018 B!2032)) (None!736) )
))
(declare-fun isDefined!494 (Option!738) Bool)

(declare-fun getValueByKey!687 (List!28427 (_ BitVec 64)) Option!738)

(assert (=> b!1266931 (isDefined!494 (getValueByKey!687 (toList!9564 lm!209) a!499))))

(declare-fun b!1266932 () Bool)

(declare-fun Unit!42063 () Unit!42059)

(assert (=> b!1266932 (= e!721695 Unit!42063)))

(declare-fun b!1266933 () Bool)

(assert (=> b!1266933 (= e!721694 (isDefined!494 (getValueByKey!687 (toList!9564 lm!209) a!499)))))

(assert (= (and d!139241 c!123513) b!1266931))

(assert (= (and d!139241 (not c!123513)) b!1266932))

(assert (= (and d!139241 (not res!843407)) b!1266933))

(assert (=> d!139241 m!1166007))

(declare-fun m!1166037 () Bool)

(assert (=> b!1266931 m!1166037))

(declare-fun m!1166039 () Bool)

(assert (=> b!1266931 m!1166039))

(assert (=> b!1266931 m!1166039))

(declare-fun m!1166041 () Bool)

(assert (=> b!1266931 m!1166041))

(assert (=> b!1266933 m!1166039))

(assert (=> b!1266933 m!1166039))

(assert (=> b!1266933 m!1166041))

(assert (=> start!106664 d!139241))

(declare-fun d!139245 () Bool)

(assert (=> d!139245 (= (inv!44194 lm!209) (isStrictlySorted!808 (toList!9564 lm!209)))))

(declare-fun bs!35836 () Bool)

(assert (= bs!35836 d!139245))

(assert (=> bs!35836 m!1166005))

(assert (=> start!106664 d!139245))

(declare-fun d!139247 () Bool)

(declare-fun lt!574104 () ListLongMap!19097)

(assert (=> d!139247 (not (contains!7628 lt!574104 a!499))))

(assert (=> d!139247 (= lt!574104 (ListLongMap!19098 (removeStrictlySorted!162 (toList!9564 lm!209) a!499)))))

(assert (=> d!139247 (= (-!2110 lm!209 a!499) lt!574104)))

(declare-fun bs!35838 () Bool)

(assert (= bs!35838 d!139247))

(declare-fun m!1166049 () Bool)

(assert (=> bs!35838 m!1166049))

(assert (=> bs!35838 m!1166015))

(assert (=> b!1266893 d!139247))

(declare-fun b!1266956 () Bool)

(declare-fun e!721711 () List!28427)

(assert (=> b!1266956 (= e!721711 Nil!28424)))

(declare-fun b!1266957 () Bool)

(declare-fun e!721710 () List!28427)

(assert (=> b!1266957 (= e!721710 (t!41945 (toList!9564 lm!209)))))

(declare-fun b!1266958 () Bool)

(assert (=> b!1266958 (= e!721710 e!721711)))

(declare-fun c!123523 () Bool)

(assert (=> b!1266958 (= c!123523 (and (is-Cons!28423 (toList!9564 lm!209)) (not (= (_1!10662 (h!29632 (toList!9564 lm!209))) a!499))))))

(declare-fun b!1266959 () Bool)

(declare-fun e!721712 () Bool)

(declare-fun lt!574116 () List!28427)

(assert (=> b!1266959 (= e!721712 (not (containsKey!669 lt!574116 a!499)))))

(declare-fun b!1266960 () Bool)

(declare-fun $colon$colon!648 (List!28427 tuple2!21302) List!28427)

(assert (=> b!1266960 (= e!721711 ($colon$colon!648 (removeStrictlySorted!162 (t!41945 (toList!9564 lm!209)) a!499) (h!29632 (toList!9564 lm!209))))))

(declare-fun d!139253 () Bool)

(assert (=> d!139253 e!721712))

(declare-fun res!843414 () Bool)

(assert (=> d!139253 (=> (not res!843414) (not e!721712))))

(assert (=> d!139253 (= res!843414 (isStrictlySorted!808 lt!574116))))

(assert (=> d!139253 (= lt!574116 e!721710)))

(declare-fun c!123522 () Bool)

(assert (=> d!139253 (= c!123522 (and (is-Cons!28423 (toList!9564 lm!209)) (= (_1!10662 (h!29632 (toList!9564 lm!209))) a!499)))))

(assert (=> d!139253 (isStrictlySorted!808 (toList!9564 lm!209))))

(assert (=> d!139253 (= (removeStrictlySorted!162 (toList!9564 lm!209) a!499) lt!574116)))

(assert (= (and d!139253 c!123522) b!1266957))

(assert (= (and d!139253 (not c!123522)) b!1266958))

(assert (= (and b!1266958 c!123523) b!1266960))

(assert (= (and b!1266958 (not c!123523)) b!1266956))

(assert (= (and d!139253 res!843414) b!1266959))

(declare-fun m!1166061 () Bool)

(assert (=> b!1266959 m!1166061))

(declare-fun m!1166063 () Bool)

(assert (=> b!1266960 m!1166063))

(assert (=> b!1266960 m!1166063))

(declare-fun m!1166065 () Bool)

(assert (=> b!1266960 m!1166065))

(declare-fun m!1166067 () Bool)

(assert (=> d!139253 m!1166067))

(assert (=> d!139253 m!1166005))

(assert (=> b!1266893 d!139253))

(declare-fun d!139263 () Bool)

(assert (=> d!139263 (= (removeStrictlySorted!162 (toList!9564 lm!209) a!499) (toList!9564 lm!209))))

(declare-fun lt!574120 () Unit!42059)

(declare-fun choose!1898 (List!28427 (_ BitVec 64)) Unit!42059)

(assert (=> d!139263 (= lt!574120 (choose!1898 (toList!9564 lm!209) a!499))))

(assert (=> d!139263 (isStrictlySorted!808 (toList!9564 lm!209))))

(assert (=> d!139263 (= (lemmaRemoveStrictlySortedNotPresentPreserves!2 (toList!9564 lm!209) a!499) lt!574120)))

(declare-fun bs!35842 () Bool)

(assert (= bs!35842 d!139263))

(assert (=> bs!35842 m!1166015))

(declare-fun m!1166069 () Bool)

(assert (=> bs!35842 m!1166069))

(assert (=> bs!35842 m!1166005))

(assert (=> b!1266893 d!139263))

(declare-fun d!139265 () Bool)

(declare-fun res!843421 () Bool)

(declare-fun e!721723 () Bool)

(assert (=> d!139265 (=> res!843421 e!721723)))

(assert (=> d!139265 (= res!843421 (or (is-Nil!28424 (toList!9564 lm!209)) (is-Nil!28424 (t!41945 (toList!9564 lm!209)))))))

(assert (=> d!139265 (= (isStrictlySorted!808 (toList!9564 lm!209)) e!721723)))

(declare-fun b!1266975 () Bool)

(declare-fun e!721724 () Bool)

(assert (=> b!1266975 (= e!721723 e!721724)))

(declare-fun res!843422 () Bool)

(assert (=> b!1266975 (=> (not res!843422) (not e!721724))))

(assert (=> b!1266975 (= res!843422 (bvslt (_1!10662 (h!29632 (toList!9564 lm!209))) (_1!10662 (h!29632 (t!41945 (toList!9564 lm!209))))))))

(declare-fun b!1266976 () Bool)

(assert (=> b!1266976 (= e!721724 (isStrictlySorted!808 (t!41945 (toList!9564 lm!209))))))

(assert (= (and d!139265 (not res!843421)) b!1266975))

(assert (= (and b!1266975 res!843422) b!1266976))

(declare-fun m!1166071 () Bool)

(assert (=> b!1266976 m!1166071))

(assert (=> b!1266891 d!139265))

(declare-fun b!1266985 () Bool)

(declare-fun e!721729 () Bool)

(declare-fun tp_is_empty!32551 () Bool)

(declare-fun tp!96515 () Bool)

(assert (=> b!1266985 (= e!721729 (and tp_is_empty!32551 tp!96515))))

(assert (=> b!1266894 (= tp!96509 e!721729)))

(assert (= (and b!1266894 (is-Cons!28423 (toList!9564 lm!209))) b!1266985))

(push 1)

(assert (not d!139241))

(assert (not d!139253))

(assert tp_is_empty!32551)

(assert (not b!1266916))

(assert (not d!139247))

(assert (not b!1266976))

(assert (not b!1266959))

(assert (not b!1266931))

(assert (not b!1266933))

(assert (not b!1266985))

(assert (not d!139245))

(assert (not b!1266960))

(assert (not d!139263))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

