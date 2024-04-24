; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106836 () Bool)

(assert start!106836)

(declare-fun res!843827 () Bool)

(declare-fun e!722408 () Bool)

(assert (=> start!106836 (=> (not res!843827) (not e!722408))))

(declare-datatypes ((B!2018 0))(
  ( (B!2019 (val!16344 Int)) )
))
(declare-datatypes ((tuple2!21216 0))(
  ( (tuple2!21217 (_1!10619 (_ BitVec 64)) (_2!10619 B!2018)) )
))
(declare-datatypes ((List!28372 0))(
  ( (Nil!28369) (Cons!28368 (h!29586 tuple2!21216) (t!41891 List!28372)) )
))
(declare-datatypes ((ListLongMap!19019 0))(
  ( (ListLongMap!19020 (toList!9525 List!28372)) )
))
(declare-fun lm!209 () ListLongMap!19019)

(declare-fun a!499 () (_ BitVec 64))

(declare-fun contains!7677 (ListLongMap!19019 (_ BitVec 64)) Bool)

(assert (=> start!106836 (= res!843827 (not (contains!7677 lm!209 a!499)))))

(assert (=> start!106836 e!722408))

(declare-fun e!722409 () Bool)

(declare-fun inv!44177 (ListLongMap!19019) Bool)

(assert (=> start!106836 (and (inv!44177 lm!209) e!722409)))

(assert (=> start!106836 true))

(declare-fun b!1268079 () Bool)

(declare-fun isStrictlySorted!793 (List!28372) Bool)

(assert (=> b!1268079 (= e!722408 (not (isStrictlySorted!793 (toList!9525 lm!209))))))

(declare-fun b!1268080 () Bool)

(declare-fun tp!96470 () Bool)

(assert (=> b!1268080 (= e!722409 tp!96470)))

(assert (= (and start!106836 res!843827) b!1268079))

(assert (= start!106836 b!1268080))

(declare-fun m!1168021 () Bool)

(assert (=> start!106836 m!1168021))

(declare-fun m!1168023 () Bool)

(assert (=> start!106836 m!1168023))

(declare-fun m!1168025 () Bool)

(assert (=> b!1268079 m!1168025))

(check-sat (not b!1268079) (not start!106836) (not b!1268080))
(check-sat)
(get-model)

(declare-fun d!139769 () Bool)

(declare-fun res!843846 () Bool)

(declare-fun e!722434 () Bool)

(assert (=> d!139769 (=> res!843846 e!722434)))

(get-info :version)

(assert (=> d!139769 (= res!843846 (or ((_ is Nil!28369) (toList!9525 lm!209)) ((_ is Nil!28369) (t!41891 (toList!9525 lm!209)))))))

(assert (=> d!139769 (= (isStrictlySorted!793 (toList!9525 lm!209)) e!722434)))

(declare-fun b!1268105 () Bool)

(declare-fun e!722435 () Bool)

(assert (=> b!1268105 (= e!722434 e!722435)))

(declare-fun res!843847 () Bool)

(assert (=> b!1268105 (=> (not res!843847) (not e!722435))))

(assert (=> b!1268105 (= res!843847 (bvslt (_1!10619 (h!29586 (toList!9525 lm!209))) (_1!10619 (h!29586 (t!41891 (toList!9525 lm!209))))))))

(declare-fun b!1268106 () Bool)

(assert (=> b!1268106 (= e!722435 (isStrictlySorted!793 (t!41891 (toList!9525 lm!209))))))

(assert (= (and d!139769 (not res!843846)) b!1268105))

(assert (= (and b!1268105 res!843847) b!1268106))

(declare-fun m!1168039 () Bool)

(assert (=> b!1268106 m!1168039))

(assert (=> b!1268079 d!139769))

(declare-fun d!139775 () Bool)

(declare-fun e!722452 () Bool)

(assert (=> d!139775 e!722452))

(declare-fun res!843858 () Bool)

(assert (=> d!139775 (=> res!843858 e!722452)))

(declare-fun lt!574676 () Bool)

(assert (=> d!139775 (= res!843858 (not lt!574676))))

(declare-fun lt!574678 () Bool)

(assert (=> d!139775 (= lt!574676 lt!574678)))

(declare-datatypes ((Unit!42163 0))(
  ( (Unit!42164) )
))
(declare-fun lt!574679 () Unit!42163)

(declare-fun e!722453 () Unit!42163)

(assert (=> d!139775 (= lt!574679 e!722453)))

(declare-fun c!123915 () Bool)

(assert (=> d!139775 (= c!123915 lt!574678)))

(declare-fun containsKey!664 (List!28372 (_ BitVec 64)) Bool)

(assert (=> d!139775 (= lt!574678 (containsKey!664 (toList!9525 lm!209) a!499))))

(assert (=> d!139775 (= (contains!7677 lm!209 a!499) lt!574676)))

(declare-fun b!1268129 () Bool)

(declare-fun lt!574677 () Unit!42163)

(assert (=> b!1268129 (= e!722453 lt!574677)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!446 (List!28372 (_ BitVec 64)) Unit!42163)

(assert (=> b!1268129 (= lt!574677 (lemmaContainsKeyImpliesGetValueByKeyDefined!446 (toList!9525 lm!209) a!499))))

(declare-datatypes ((Option!726 0))(
  ( (Some!725 (v!19009 B!2018)) (None!724) )
))
(declare-fun isDefined!484 (Option!726) Bool)

(declare-fun getValueByKey!675 (List!28372 (_ BitVec 64)) Option!726)

(assert (=> b!1268129 (isDefined!484 (getValueByKey!675 (toList!9525 lm!209) a!499))))

(declare-fun b!1268130 () Bool)

(declare-fun Unit!42167 () Unit!42163)

(assert (=> b!1268130 (= e!722453 Unit!42167)))

(declare-fun b!1268131 () Bool)

(assert (=> b!1268131 (= e!722452 (isDefined!484 (getValueByKey!675 (toList!9525 lm!209) a!499)))))

(assert (= (and d!139775 c!123915) b!1268129))

(assert (= (and d!139775 (not c!123915)) b!1268130))

(assert (= (and d!139775 (not res!843858)) b!1268131))

(declare-fun m!1168045 () Bool)

(assert (=> d!139775 m!1168045))

(declare-fun m!1168047 () Bool)

(assert (=> b!1268129 m!1168047))

(declare-fun m!1168049 () Bool)

(assert (=> b!1268129 m!1168049))

(assert (=> b!1268129 m!1168049))

(declare-fun m!1168051 () Bool)

(assert (=> b!1268129 m!1168051))

(assert (=> b!1268131 m!1168049))

(assert (=> b!1268131 m!1168049))

(assert (=> b!1268131 m!1168051))

(assert (=> start!106836 d!139775))

(declare-fun d!139781 () Bool)

(assert (=> d!139781 (= (inv!44177 lm!209) (isStrictlySorted!793 (toList!9525 lm!209)))))

(declare-fun bs!35868 () Bool)

(assert (= bs!35868 d!139781))

(assert (=> bs!35868 m!1168025))

(assert (=> start!106836 d!139781))

(declare-fun b!1268150 () Bool)

(declare-fun e!722464 () Bool)

(declare-fun tp_is_empty!32539 () Bool)

(declare-fun tp!96483 () Bool)

(assert (=> b!1268150 (= e!722464 (and tp_is_empty!32539 tp!96483))))

(assert (=> b!1268080 (= tp!96470 e!722464)))

(assert (= (and b!1268080 ((_ is Cons!28368) (toList!9525 lm!209))) b!1268150))

(check-sat (not b!1268150) (not b!1268106) (not b!1268129) (not d!139781) tp_is_empty!32539 (not d!139775) (not b!1268131))
(check-sat)
