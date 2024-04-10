; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106218 () Bool)

(assert start!106218)

(declare-fun res!842116 () Bool)

(declare-fun e!720061 () Bool)

(assert (=> start!106218 (=> (not res!842116) (not e!720061))))

(declare-datatypes ((B!1912 0))(
  ( (B!1913 (val!16291 Int)) )
))
(declare-datatypes ((tuple2!21100 0))(
  ( (tuple2!21101 (_1!10561 (_ BitVec 64)) (_2!10561 B!1912)) )
))
(declare-datatypes ((List!28283 0))(
  ( (Nil!28280) (Cons!28279 (h!29488 tuple2!21100) (t!41804 List!28283)) )
))
(declare-datatypes ((ListLongMap!18973 0))(
  ( (ListLongMap!18974 (toList!9502 List!28283)) )
))
(declare-fun lm!212 () ListLongMap!18973)

(declare-fun a1!67 () (_ BitVec 64))

(declare-fun contains!7623 (ListLongMap!18973 (_ BitVec 64)) Bool)

(assert (=> start!106218 (= res!842116 (not (contains!7623 lm!212 a1!67)))))

(assert (=> start!106218 e!720061))

(declare-fun e!720062 () Bool)

(declare-fun inv!44073 (ListLongMap!18973) Bool)

(assert (=> start!106218 (and (inv!44073 lm!212) e!720062)))

(assert (=> start!106218 true))

(declare-fun b!1264509 () Bool)

(declare-fun isStrictlySorted!770 (List!28283) Bool)

(assert (=> b!1264509 (= e!720061 (not (isStrictlySorted!770 (toList!9502 lm!212))))))

(declare-fun b!1264510 () Bool)

(declare-fun tp!96206 () Bool)

(assert (=> b!1264510 (= e!720062 tp!96206)))

(assert (= (and start!106218 res!842116) b!1264509))

(assert (= start!106218 b!1264510))

(declare-fun m!1165077 () Bool)

(assert (=> start!106218 m!1165077))

(declare-fun m!1165079 () Bool)

(assert (=> start!106218 m!1165079))

(declare-fun m!1165081 () Bool)

(assert (=> b!1264509 m!1165081))

(check-sat (not start!106218) (not b!1264509) (not b!1264510))
(check-sat)
(get-model)

(declare-fun d!138735 () Bool)

(declare-fun e!720083 () Bool)

(assert (=> d!138735 e!720083))

(declare-fun res!842127 () Bool)

(assert (=> d!138735 (=> res!842127 e!720083)))

(declare-fun lt!573834 () Bool)

(assert (=> d!138735 (= res!842127 (not lt!573834))))

(declare-fun lt!573836 () Bool)

(assert (=> d!138735 (= lt!573834 lt!573836)))

(declare-datatypes ((Unit!42147 0))(
  ( (Unit!42148) )
))
(declare-fun lt!573833 () Unit!42147)

(declare-fun e!720084 () Unit!42147)

(assert (=> d!138735 (= lt!573833 e!720084)))

(declare-fun c!123144 () Bool)

(assert (=> d!138735 (= c!123144 lt!573836)))

(declare-fun containsKey!628 (List!28283 (_ BitVec 64)) Bool)

(assert (=> d!138735 (= lt!573836 (containsKey!628 (toList!9502 lm!212) a1!67))))

(assert (=> d!138735 (= (contains!7623 lm!212 a1!67) lt!573834)))

(declare-fun b!1264538 () Bool)

(declare-fun lt!573835 () Unit!42147)

(assert (=> b!1264538 (= e!720084 lt!573835)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!437 (List!28283 (_ BitVec 64)) Unit!42147)

(assert (=> b!1264538 (= lt!573835 (lemmaContainsKeyImpliesGetValueByKeyDefined!437 (toList!9502 lm!212) a1!67))))

(declare-datatypes ((Option!721 0))(
  ( (Some!720 (v!18998 B!1912)) (None!719) )
))
(declare-fun isDefined!476 (Option!721) Bool)

(declare-fun getValueByKey!670 (List!28283 (_ BitVec 64)) Option!721)

(assert (=> b!1264538 (isDefined!476 (getValueByKey!670 (toList!9502 lm!212) a1!67))))

(declare-fun b!1264539 () Bool)

(declare-fun Unit!42149 () Unit!42147)

(assert (=> b!1264539 (= e!720084 Unit!42149)))

(declare-fun b!1264540 () Bool)

(assert (=> b!1264540 (= e!720083 (isDefined!476 (getValueByKey!670 (toList!9502 lm!212) a1!67)))))

(assert (= (and d!138735 c!123144) b!1264538))

(assert (= (and d!138735 (not c!123144)) b!1264539))

(assert (= (and d!138735 (not res!842127)) b!1264540))

(declare-fun m!1165097 () Bool)

(assert (=> d!138735 m!1165097))

(declare-fun m!1165099 () Bool)

(assert (=> b!1264538 m!1165099))

(declare-fun m!1165101 () Bool)

(assert (=> b!1264538 m!1165101))

(assert (=> b!1264538 m!1165101))

(declare-fun m!1165103 () Bool)

(assert (=> b!1264538 m!1165103))

(assert (=> b!1264540 m!1165101))

(assert (=> b!1264540 m!1165101))

(assert (=> b!1264540 m!1165103))

(assert (=> start!106218 d!138735))

(declare-fun d!138741 () Bool)

(assert (=> d!138741 (= (inv!44073 lm!212) (isStrictlySorted!770 (toList!9502 lm!212)))))

(declare-fun bs!35775 () Bool)

(assert (= bs!35775 d!138741))

(assert (=> bs!35775 m!1165081))

(assert (=> start!106218 d!138741))

(declare-fun d!138745 () Bool)

(declare-fun res!842139 () Bool)

(declare-fun e!720097 () Bool)

(assert (=> d!138745 (=> res!842139 e!720097)))

(get-info :version)

(assert (=> d!138745 (= res!842139 (or ((_ is Nil!28280) (toList!9502 lm!212)) ((_ is Nil!28280) (t!41804 (toList!9502 lm!212)))))))

(assert (=> d!138745 (= (isStrictlySorted!770 (toList!9502 lm!212)) e!720097)))

(declare-fun b!1264556 () Bool)

(declare-fun e!720098 () Bool)

(assert (=> b!1264556 (= e!720097 e!720098)))

(declare-fun res!842140 () Bool)

(assert (=> b!1264556 (=> (not res!842140) (not e!720098))))

(assert (=> b!1264556 (= res!842140 (bvslt (_1!10561 (h!29488 (toList!9502 lm!212))) (_1!10561 (h!29488 (t!41804 (toList!9502 lm!212))))))))

(declare-fun b!1264557 () Bool)

(assert (=> b!1264557 (= e!720098 (isStrictlySorted!770 (t!41804 (toList!9502 lm!212))))))

(assert (= (and d!138745 (not res!842139)) b!1264556))

(assert (= (and b!1264556 res!842140) b!1264557))

(declare-fun m!1165115 () Bool)

(assert (=> b!1264557 m!1165115))

(assert (=> b!1264509 d!138745))

(declare-fun b!1264569 () Bool)

(declare-fun e!720108 () Bool)

(declare-fun tp_is_empty!32445 () Bool)

(declare-fun tp!96215 () Bool)

(assert (=> b!1264569 (= e!720108 (and tp_is_empty!32445 tp!96215))))

(assert (=> b!1264510 (= tp!96206 e!720108)))

(assert (= (and b!1264510 ((_ is Cons!28279) (toList!9502 lm!212))) b!1264569))

(check-sat (not b!1264540) (not b!1264538) (not d!138741) (not b!1264557) tp_is_empty!32445 (not b!1264569) (not d!138735))
(check-sat)
