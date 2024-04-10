; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106216 () Bool)

(assert start!106216)

(declare-fun res!842113 () Bool)

(declare-fun e!720055 () Bool)

(assert (=> start!106216 (=> (not res!842113) (not e!720055))))

(declare-datatypes ((B!1910 0))(
  ( (B!1911 (val!16290 Int)) )
))
(declare-datatypes ((tuple2!21098 0))(
  ( (tuple2!21099 (_1!10560 (_ BitVec 64)) (_2!10560 B!1910)) )
))
(declare-datatypes ((List!28282 0))(
  ( (Nil!28279) (Cons!28278 (h!29487 tuple2!21098) (t!41803 List!28282)) )
))
(declare-datatypes ((ListLongMap!18971 0))(
  ( (ListLongMap!18972 (toList!9501 List!28282)) )
))
(declare-fun lm!212 () ListLongMap!18971)

(declare-fun a1!67 () (_ BitVec 64))

(declare-fun contains!7622 (ListLongMap!18971 (_ BitVec 64)) Bool)

(assert (=> start!106216 (= res!842113 (not (contains!7622 lm!212 a1!67)))))

(assert (=> start!106216 e!720055))

(declare-fun e!720056 () Bool)

(declare-fun inv!44072 (ListLongMap!18971) Bool)

(assert (=> start!106216 (and (inv!44072 lm!212) e!720056)))

(assert (=> start!106216 true))

(declare-fun b!1264503 () Bool)

(declare-fun isStrictlySorted!769 (List!28282) Bool)

(assert (=> b!1264503 (= e!720055 (not (isStrictlySorted!769 (toList!9501 lm!212))))))

(declare-fun b!1264504 () Bool)

(declare-fun tp!96203 () Bool)

(assert (=> b!1264504 (= e!720056 tp!96203)))

(assert (= (and start!106216 res!842113) b!1264503))

(assert (= start!106216 b!1264504))

(declare-fun m!1165071 () Bool)

(assert (=> start!106216 m!1165071))

(declare-fun m!1165073 () Bool)

(assert (=> start!106216 m!1165073))

(declare-fun m!1165075 () Bool)

(assert (=> b!1264503 m!1165075))

(push 1)

(assert (not start!106216))

(assert (not b!1264503))

(assert (not b!1264504))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!138733 () Bool)

(declare-fun e!720080 () Bool)

(assert (=> d!138733 e!720080))

(declare-fun res!842124 () Bool)

(assert (=> d!138733 (=> res!842124 e!720080)))

(declare-fun lt!573831 () Bool)

(assert (=> d!138733 (= res!842124 (not lt!573831))))

(declare-fun lt!573830 () Bool)

(assert (=> d!138733 (= lt!573831 lt!573830)))

(declare-datatypes ((Unit!42145 0))(
  ( (Unit!42146) )
))
(declare-fun lt!573832 () Unit!42145)

(declare-fun e!720079 () Unit!42145)

(assert (=> d!138733 (= lt!573832 e!720079)))

(declare-fun c!123143 () Bool)

(assert (=> d!138733 (= c!123143 lt!573830)))

(declare-fun containsKey!629 (List!28282 (_ BitVec 64)) Bool)

(assert (=> d!138733 (= lt!573830 (containsKey!629 (toList!9501 lm!212) a1!67))))

(assert (=> d!138733 (= (contains!7622 lm!212 a1!67) lt!573831)))

(declare-fun b!1264533 () Bool)

(declare-fun lt!573829 () Unit!42145)

(assert (=> b!1264533 (= e!720079 lt!573829)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!438 (List!28282 (_ BitVec 64)) Unit!42145)

(assert (=> b!1264533 (= lt!573829 (lemmaContainsKeyImpliesGetValueByKeyDefined!438 (toList!9501 lm!212) a1!67))))

(declare-datatypes ((Option!722 0))(
  ( (Some!721 (v!18999 B!1910)) (None!720) )
))
(declare-fun isDefined!477 (Option!722) Bool)

(declare-fun getValueByKey!671 (List!28282 (_ BitVec 64)) Option!722)

(assert (=> b!1264533 (isDefined!477 (getValueByKey!671 (toList!9501 lm!212) a1!67))))

(declare-fun b!1264534 () Bool)

(declare-fun Unit!42152 () Unit!42145)

(assert (=> b!1264534 (= e!720079 Unit!42152)))

(declare-fun b!1264535 () Bool)

(assert (=> b!1264535 (= e!720080 (isDefined!477 (getValueByKey!671 (toList!9501 lm!212) a1!67)))))

(assert (= (and d!138733 c!123143) b!1264533))

(assert (= (and d!138733 (not c!123143)) b!1264534))

(assert (= (and d!138733 (not res!842124)) b!1264535))

(declare-fun m!1165089 () Bool)

(assert (=> d!138733 m!1165089))

(declare-fun m!1165091 () Bool)

(assert (=> b!1264533 m!1165091))

(declare-fun m!1165093 () Bool)

(assert (=> b!1264533 m!1165093))

(assert (=> b!1264533 m!1165093))

(declare-fun m!1165095 () Bool)

(assert (=> b!1264533 m!1165095))

(assert (=> b!1264535 m!1165093))

(assert (=> b!1264535 m!1165093))

(assert (=> b!1264535 m!1165095))

(assert (=> start!106216 d!138733))

(declare-fun d!138739 () Bool)

(assert (=> d!138739 (= (inv!44072 lm!212) (isStrictlySorted!769 (toList!9501 lm!212)))))

(declare-fun bs!35774 () Bool)

(assert (= bs!35774 d!138739))

(assert (=> bs!35774 m!1165075))

(assert (=> start!106216 d!138739))

(declare-fun d!138743 () Bool)

(declare-fun res!842137 () Bool)

(declare-fun e!720095 () Bool)

(assert (=> d!138743 (=> res!842137 e!720095)))

(assert (=> d!138743 (= res!842137 (or (is-Nil!28279 (toList!9501 lm!212)) (is-Nil!28279 (t!41803 (toList!9501 lm!212)))))))

(assert (=> d!138743 (= (isStrictlySorted!769 (toList!9501 lm!212)) e!720095)))

(declare-fun b!1264552 () Bool)

(declare-fun e!720096 () Bool)

(assert (=> b!1264552 (= e!720095 e!720096)))

(declare-fun res!842138 () Bool)

(assert (=> b!1264552 (=> (not res!842138) (not e!720096))))

(assert (=> b!1264552 (= res!842138 (bvslt (_1!10560 (h!29487 (toList!9501 lm!212))) (_1!10560 (h!29487 (t!41803 (toList!9501 lm!212))))))))

(declare-fun b!1264553 () Bool)

(assert (=> b!1264553 (= e!720096 (isStrictlySorted!769 (t!41803 (toList!9501 lm!212))))))

(assert (= (and d!138743 (not res!842137)) b!1264552))

(assert (= (and b!1264552 res!842138) b!1264553))

(declare-fun m!1165113 () Bool)

(assert (=> b!1264553 m!1165113))

(assert (=> b!1264503 d!138743))

(declare-fun b!1264568 () Bool)

(declare-fun e!720107 () Bool)

(declare-fun tp_is_empty!32443 () Bool)

(declare-fun tp!96214 () Bool)

(assert (=> b!1264568 (= e!720107 (and tp_is_empty!32443 tp!96214))))

(assert (=> b!1264504 (= tp!96203 e!720107)))

(assert (= (and b!1264504 (is-Cons!28278 (toList!9501 lm!212))) b!1264568))

(push 1)

(assert tp_is_empty!32443)

