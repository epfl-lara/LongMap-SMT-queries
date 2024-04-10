; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106668 () Bool)

(assert start!106668)

(declare-fun b!1266973 () Bool)

(declare-fun res!843419 () Bool)

(declare-fun e!721711 () Bool)

(assert (=> b!1266973 (=> (not res!843419) (not e!721711))))

(declare-datatypes ((B!2032 0))(
  ( (B!2033 (val!16351 Int)) )
))
(declare-datatypes ((tuple2!21220 0))(
  ( (tuple2!21221 (_1!10621 (_ BitVec 64)) (_2!10621 B!2032)) )
))
(declare-datatypes ((List!28343 0))(
  ( (Nil!28340) (Cons!28339 (h!29548 tuple2!21220) (t!41870 List!28343)) )
))
(declare-datatypes ((ListLongMap!19015 0))(
  ( (ListLongMap!19016 (toList!9523 List!28343)) )
))
(declare-fun lm!209 () ListLongMap!19015)

(declare-fun isStrictlySorted!812 (List!28343) Bool)

(assert (=> b!1266973 (= res!843419 (isStrictlySorted!812 (toList!9523 lm!209)))))

(declare-fun b!1266974 () Bool)

(declare-fun res!843420 () Bool)

(assert (=> b!1266974 (=> (not res!843420) (not e!721711))))

(declare-fun a!499 () (_ BitVec 64))

(declare-fun containsKey!671 (List!28343 (_ BitVec 64)) Bool)

(assert (=> b!1266974 (= res!843420 (not (containsKey!671 (toList!9523 lm!209) a!499)))))

(declare-fun b!1266975 () Bool)

(declare-fun -!2156 (ListLongMap!19015 (_ BitVec 64)) ListLongMap!19015)

(assert (=> b!1266975 (= e!721711 (not (= (-!2156 lm!209 a!499) lm!209)))))

(declare-fun removeStrictlySorted!162 (List!28343 (_ BitVec 64)) List!28343)

(assert (=> b!1266975 (= (removeStrictlySorted!162 (toList!9523 lm!209) a!499) (toList!9523 lm!209))))

(declare-datatypes ((Unit!42209 0))(
  ( (Unit!42210) )
))
(declare-fun lt!574245 () Unit!42209)

(declare-fun lemmaRemoveStrictlySortedNotPresentPreserves!2 (List!28343 (_ BitVec 64)) Unit!42209)

(assert (=> b!1266975 (= lt!574245 (lemmaRemoveStrictlySortedNotPresentPreserves!2 (toList!9523 lm!209) a!499))))

(declare-fun res!843421 () Bool)

(assert (=> start!106668 (=> (not res!843421) (not e!721711))))

(declare-fun contains!7659 (ListLongMap!19015 (_ BitVec 64)) Bool)

(assert (=> start!106668 (= res!843421 (not (contains!7659 lm!209 a!499)))))

(assert (=> start!106668 e!721711))

(declare-fun e!721712 () Bool)

(declare-fun inv!44194 (ListLongMap!19015) Bool)

(assert (=> start!106668 (and (inv!44194 lm!209) e!721712)))

(assert (=> start!106668 true))

(declare-fun b!1266976 () Bool)

(declare-fun tp!96509 () Bool)

(assert (=> b!1266976 (= e!721712 tp!96509)))

(assert (= (and start!106668 res!843421) b!1266973))

(assert (= (and b!1266973 res!843419) b!1266974))

(assert (= (and b!1266974 res!843420) b!1266975))

(assert (= start!106668 b!1266976))

(declare-fun m!1166525 () Bool)

(assert (=> b!1266973 m!1166525))

(declare-fun m!1166527 () Bool)

(assert (=> b!1266974 m!1166527))

(declare-fun m!1166529 () Bool)

(assert (=> b!1266975 m!1166529))

(declare-fun m!1166531 () Bool)

(assert (=> b!1266975 m!1166531))

(declare-fun m!1166533 () Bool)

(assert (=> b!1266975 m!1166533))

(declare-fun m!1166535 () Bool)

(assert (=> start!106668 m!1166535))

(declare-fun m!1166537 () Bool)

(assert (=> start!106668 m!1166537))

(check-sat (not b!1266974) (not b!1266975) (not b!1266976) (not b!1266973) (not start!106668))
(check-sat)
(get-model)

(declare-fun d!139367 () Bool)

(declare-fun res!843439 () Bool)

(declare-fun e!721727 () Bool)

(assert (=> d!139367 (=> res!843439 e!721727)))

(get-info :version)

(assert (=> d!139367 (= res!843439 (and ((_ is Cons!28339) (toList!9523 lm!209)) (= (_1!10621 (h!29548 (toList!9523 lm!209))) a!499)))))

(assert (=> d!139367 (= (containsKey!671 (toList!9523 lm!209) a!499) e!721727)))

(declare-fun b!1266997 () Bool)

(declare-fun e!721728 () Bool)

(assert (=> b!1266997 (= e!721727 e!721728)))

(declare-fun res!843440 () Bool)

(assert (=> b!1266997 (=> (not res!843440) (not e!721728))))

(assert (=> b!1266997 (= res!843440 (and (or (not ((_ is Cons!28339) (toList!9523 lm!209))) (bvsle (_1!10621 (h!29548 (toList!9523 lm!209))) a!499)) ((_ is Cons!28339) (toList!9523 lm!209)) (bvslt (_1!10621 (h!29548 (toList!9523 lm!209))) a!499)))))

(declare-fun b!1266998 () Bool)

(assert (=> b!1266998 (= e!721728 (containsKey!671 (t!41870 (toList!9523 lm!209)) a!499))))

(assert (= (and d!139367 (not res!843439)) b!1266997))

(assert (= (and b!1266997 res!843440) b!1266998))

(declare-fun m!1166553 () Bool)

(assert (=> b!1266998 m!1166553))

(assert (=> b!1266974 d!139367))

(declare-fun d!139373 () Bool)

(declare-fun e!721747 () Bool)

(assert (=> d!139373 e!721747))

(declare-fun res!843454 () Bool)

(assert (=> d!139373 (=> res!843454 e!721747)))

(declare-fun lt!574274 () Bool)

(assert (=> d!139373 (= res!843454 (not lt!574274))))

(declare-fun lt!574271 () Bool)

(assert (=> d!139373 (= lt!574274 lt!574271)))

(declare-fun lt!574272 () Unit!42209)

(declare-fun e!721748 () Unit!42209)

(assert (=> d!139373 (= lt!574272 e!721748)))

(declare-fun c!123532 () Bool)

(assert (=> d!139373 (= c!123532 lt!574271)))

(assert (=> d!139373 (= lt!574271 (containsKey!671 (toList!9523 lm!209) a!499))))

(assert (=> d!139373 (= (contains!7659 lm!209 a!499) lt!574274)))

(declare-fun b!1267022 () Bool)

(declare-fun lt!574273 () Unit!42209)

(assert (=> b!1267022 (= e!721748 lt!574273)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!453 (List!28343 (_ BitVec 64)) Unit!42209)

(assert (=> b!1267022 (= lt!574273 (lemmaContainsKeyImpliesGetValueByKeyDefined!453 (toList!9523 lm!209) a!499))))

(declare-datatypes ((Option!737 0))(
  ( (Some!736 (v!19020 B!2032)) (None!735) )
))
(declare-fun isDefined!492 (Option!737) Bool)

(declare-fun getValueByKey!685 (List!28343 (_ BitVec 64)) Option!737)

(assert (=> b!1267022 (isDefined!492 (getValueByKey!685 (toList!9523 lm!209) a!499))))

(declare-fun b!1267023 () Bool)

(declare-fun Unit!42214 () Unit!42209)

(assert (=> b!1267023 (= e!721748 Unit!42214)))

(declare-fun b!1267024 () Bool)

(assert (=> b!1267024 (= e!721747 (isDefined!492 (getValueByKey!685 (toList!9523 lm!209) a!499)))))

(assert (= (and d!139373 c!123532) b!1267022))

(assert (= (and d!139373 (not c!123532)) b!1267023))

(assert (= (and d!139373 (not res!843454)) b!1267024))

(assert (=> d!139373 m!1166527))

(declare-fun m!1166565 () Bool)

(assert (=> b!1267022 m!1166565))

(declare-fun m!1166567 () Bool)

(assert (=> b!1267022 m!1166567))

(assert (=> b!1267022 m!1166567))

(declare-fun m!1166569 () Bool)

(assert (=> b!1267022 m!1166569))

(assert (=> b!1267024 m!1166567))

(assert (=> b!1267024 m!1166567))

(assert (=> b!1267024 m!1166569))

(assert (=> start!106668 d!139373))

(declare-fun d!139383 () Bool)

(assert (=> d!139383 (= (inv!44194 lm!209) (isStrictlySorted!812 (toList!9523 lm!209)))))

(declare-fun bs!35866 () Bool)

(assert (= bs!35866 d!139383))

(assert (=> bs!35866 m!1166525))

(assert (=> start!106668 d!139383))

(declare-fun d!139387 () Bool)

(declare-fun lt!574290 () ListLongMap!19015)

(assert (=> d!139387 (not (contains!7659 lt!574290 a!499))))

(assert (=> d!139387 (= lt!574290 (ListLongMap!19016 (removeStrictlySorted!162 (toList!9523 lm!209) a!499)))))

(assert (=> d!139387 (= (-!2156 lm!209 a!499) lt!574290)))

(declare-fun bs!35867 () Bool)

(assert (= bs!35867 d!139387))

(declare-fun m!1166579 () Bool)

(assert (=> bs!35867 m!1166579))

(assert (=> bs!35867 m!1166531))

(assert (=> b!1266975 d!139387))

(declare-fun b!1267059 () Bool)

(declare-fun e!721772 () List!28343)

(assert (=> b!1267059 (= e!721772 (t!41870 (toList!9523 lm!209)))))

(declare-fun b!1267060 () Bool)

(declare-fun e!721770 () List!28343)

(assert (=> b!1267060 (= e!721772 e!721770)))

(declare-fun c!123547 () Bool)

(assert (=> b!1267060 (= c!123547 (and ((_ is Cons!28339) (toList!9523 lm!209)) (not (= (_1!10621 (h!29548 (toList!9523 lm!209))) a!499))))))

(declare-fun d!139391 () Bool)

(declare-fun e!721771 () Bool)

(assert (=> d!139391 e!721771))

(declare-fun res!843463 () Bool)

(assert (=> d!139391 (=> (not res!843463) (not e!721771))))

(declare-fun lt!574302 () List!28343)

(assert (=> d!139391 (= res!843463 (isStrictlySorted!812 lt!574302))))

(assert (=> d!139391 (= lt!574302 e!721772)))

(declare-fun c!123546 () Bool)

(assert (=> d!139391 (= c!123546 (and ((_ is Cons!28339) (toList!9523 lm!209)) (= (_1!10621 (h!29548 (toList!9523 lm!209))) a!499)))))

(assert (=> d!139391 (isStrictlySorted!812 (toList!9523 lm!209))))

(assert (=> d!139391 (= (removeStrictlySorted!162 (toList!9523 lm!209) a!499) lt!574302)))

(declare-fun b!1267061 () Bool)

(assert (=> b!1267061 (= e!721771 (not (containsKey!671 lt!574302 a!499)))))

(declare-fun b!1267062 () Bool)

(assert (=> b!1267062 (= e!721770 Nil!28340)))

(declare-fun b!1267063 () Bool)

(declare-fun $colon$colon!648 (List!28343 tuple2!21220) List!28343)

(assert (=> b!1267063 (= e!721770 ($colon$colon!648 (removeStrictlySorted!162 (t!41870 (toList!9523 lm!209)) a!499) (h!29548 (toList!9523 lm!209))))))

(assert (= (and d!139391 c!123546) b!1267059))

(assert (= (and d!139391 (not c!123546)) b!1267060))

(assert (= (and b!1267060 c!123547) b!1267063))

(assert (= (and b!1267060 (not c!123547)) b!1267062))

(assert (= (and d!139391 res!843463) b!1267061))

(declare-fun m!1166593 () Bool)

(assert (=> d!139391 m!1166593))

(assert (=> d!139391 m!1166525))

(declare-fun m!1166595 () Bool)

(assert (=> b!1267061 m!1166595))

(declare-fun m!1166597 () Bool)

(assert (=> b!1267063 m!1166597))

(assert (=> b!1267063 m!1166597))

(declare-fun m!1166599 () Bool)

(assert (=> b!1267063 m!1166599))

(assert (=> b!1266975 d!139391))

(declare-fun d!139401 () Bool)

(assert (=> d!139401 (= (removeStrictlySorted!162 (toList!9523 lm!209) a!499) (toList!9523 lm!209))))

(declare-fun lt!574307 () Unit!42209)

(declare-fun choose!1889 (List!28343 (_ BitVec 64)) Unit!42209)

(assert (=> d!139401 (= lt!574307 (choose!1889 (toList!9523 lm!209) a!499))))

(assert (=> d!139401 (isStrictlySorted!812 (toList!9523 lm!209))))

(assert (=> d!139401 (= (lemmaRemoveStrictlySortedNotPresentPreserves!2 (toList!9523 lm!209) a!499) lt!574307)))

(declare-fun bs!35871 () Bool)

(assert (= bs!35871 d!139401))

(assert (=> bs!35871 m!1166531))

(declare-fun m!1166603 () Bool)

(assert (=> bs!35871 m!1166603))

(assert (=> bs!35871 m!1166525))

(assert (=> b!1266975 d!139401))

(declare-fun d!139405 () Bool)

(declare-fun res!843481 () Bool)

(declare-fun e!721796 () Bool)

(assert (=> d!139405 (=> res!843481 e!721796)))

(assert (=> d!139405 (= res!843481 (or ((_ is Nil!28340) (toList!9523 lm!209)) ((_ is Nil!28340) (t!41870 (toList!9523 lm!209)))))))

(assert (=> d!139405 (= (isStrictlySorted!812 (toList!9523 lm!209)) e!721796)))

(declare-fun b!1267093 () Bool)

(declare-fun e!721797 () Bool)

(assert (=> b!1267093 (= e!721796 e!721797)))

(declare-fun res!843482 () Bool)

(assert (=> b!1267093 (=> (not res!843482) (not e!721797))))

(assert (=> b!1267093 (= res!843482 (bvslt (_1!10621 (h!29548 (toList!9523 lm!209))) (_1!10621 (h!29548 (t!41870 (toList!9523 lm!209))))))))

(declare-fun b!1267094 () Bool)

(assert (=> b!1267094 (= e!721797 (isStrictlySorted!812 (t!41870 (toList!9523 lm!209))))))

(assert (= (and d!139405 (not res!843481)) b!1267093))

(assert (= (and b!1267093 res!843482) b!1267094))

(declare-fun m!1166613 () Bool)

(assert (=> b!1267094 m!1166613))

(assert (=> b!1266973 d!139405))

(declare-fun b!1267109 () Bool)

(declare-fun e!721806 () Bool)

(declare-fun tp_is_empty!32551 () Bool)

(declare-fun tp!96519 () Bool)

(assert (=> b!1267109 (= e!721806 (and tp_is_empty!32551 tp!96519))))

(assert (=> b!1266976 (= tp!96509 e!721806)))

(assert (= (and b!1266976 ((_ is Cons!28339) (toList!9523 lm!209))) b!1267109))

(check-sat (not b!1267024) (not d!139383) (not b!1266998) (not d!139391) (not d!139373) (not b!1267109) (not b!1267022) tp_is_empty!32551 (not d!139401) (not d!139387) (not b!1267061) (not b!1267063) (not b!1267094))
(check-sat)
