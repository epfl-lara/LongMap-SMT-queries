; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106666 () Bool)

(assert start!106666)

(declare-fun b!1266961 () Bool)

(declare-fun res!843411 () Bool)

(declare-fun e!721706 () Bool)

(assert (=> b!1266961 (=> (not res!843411) (not e!721706))))

(declare-datatypes ((B!2030 0))(
  ( (B!2031 (val!16350 Int)) )
))
(declare-datatypes ((tuple2!21218 0))(
  ( (tuple2!21219 (_1!10620 (_ BitVec 64)) (_2!10620 B!2030)) )
))
(declare-datatypes ((List!28342 0))(
  ( (Nil!28339) (Cons!28338 (h!29547 tuple2!21218) (t!41869 List!28342)) )
))
(declare-datatypes ((ListLongMap!19013 0))(
  ( (ListLongMap!19014 (toList!9522 List!28342)) )
))
(declare-fun lm!209 () ListLongMap!19013)

(declare-fun isStrictlySorted!811 (List!28342) Bool)

(assert (=> b!1266961 (= res!843411 (isStrictlySorted!811 (toList!9522 lm!209)))))

(declare-fun b!1266962 () Bool)

(declare-fun res!843410 () Bool)

(assert (=> b!1266962 (=> (not res!843410) (not e!721706))))

(declare-fun a!499 () (_ BitVec 64))

(declare-fun containsKey!670 (List!28342 (_ BitVec 64)) Bool)

(assert (=> b!1266962 (= res!843410 (not (containsKey!670 (toList!9522 lm!209) a!499)))))

(declare-fun res!843412 () Bool)

(assert (=> start!106666 (=> (not res!843412) (not e!721706))))

(declare-fun contains!7658 (ListLongMap!19013 (_ BitVec 64)) Bool)

(assert (=> start!106666 (= res!843412 (not (contains!7658 lm!209 a!499)))))

(assert (=> start!106666 e!721706))

(declare-fun e!721705 () Bool)

(declare-fun inv!44193 (ListLongMap!19013) Bool)

(assert (=> start!106666 (and (inv!44193 lm!209) e!721705)))

(assert (=> start!106666 true))

(declare-fun b!1266964 () Bool)

(declare-fun tp!96506 () Bool)

(assert (=> b!1266964 (= e!721705 tp!96506)))

(declare-fun b!1266963 () Bool)

(declare-fun -!2155 (ListLongMap!19013 (_ BitVec 64)) ListLongMap!19013)

(assert (=> b!1266963 (= e!721706 (not (= (-!2155 lm!209 a!499) lm!209)))))

(declare-fun removeStrictlySorted!161 (List!28342 (_ BitVec 64)) List!28342)

(assert (=> b!1266963 (= (removeStrictlySorted!161 (toList!9522 lm!209) a!499) (toList!9522 lm!209))))

(declare-datatypes ((Unit!42207 0))(
  ( (Unit!42208) )
))
(declare-fun lt!574242 () Unit!42207)

(declare-fun lemmaRemoveStrictlySortedNotPresentPreserves!1 (List!28342 (_ BitVec 64)) Unit!42207)

(assert (=> b!1266963 (= lt!574242 (lemmaRemoveStrictlySortedNotPresentPreserves!1 (toList!9522 lm!209) a!499))))

(assert (= (and start!106666 res!843412) b!1266961))

(assert (= (and b!1266961 res!843411) b!1266962))

(assert (= (and b!1266962 res!843410) b!1266963))

(assert (= start!106666 b!1266964))

(declare-fun m!1166511 () Bool)

(assert (=> b!1266961 m!1166511))

(declare-fun m!1166513 () Bool)

(assert (=> b!1266962 m!1166513))

(declare-fun m!1166515 () Bool)

(assert (=> start!106666 m!1166515))

(declare-fun m!1166517 () Bool)

(assert (=> start!106666 m!1166517))

(declare-fun m!1166519 () Bool)

(assert (=> b!1266963 m!1166519))

(declare-fun m!1166521 () Bool)

(assert (=> b!1266963 m!1166521))

(declare-fun m!1166523 () Bool)

(assert (=> b!1266963 m!1166523))

(push 1)

(assert (not b!1266961))

(assert (not b!1266964))

(assert (not b!1266963))

(assert (not start!106666))

(assert (not b!1266962))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139371 () Bool)

(declare-fun res!843441 () Bool)

(declare-fun e!721729 () Bool)

(assert (=> d!139371 (=> res!843441 e!721729)))

(assert (=> d!139371 (= res!843441 (and (is-Cons!28338 (toList!9522 lm!209)) (= (_1!10620 (h!29547 (toList!9522 lm!209))) a!499)))))

(assert (=> d!139371 (= (containsKey!670 (toList!9522 lm!209) a!499) e!721729)))

(declare-fun b!1266999 () Bool)

(declare-fun e!721730 () Bool)

(assert (=> b!1266999 (= e!721729 e!721730)))

(declare-fun res!843442 () Bool)

(assert (=> b!1266999 (=> (not res!843442) (not e!721730))))

(assert (=> b!1266999 (= res!843442 (and (or (not (is-Cons!28338 (toList!9522 lm!209))) (bvsle (_1!10620 (h!29547 (toList!9522 lm!209))) a!499)) (is-Cons!28338 (toList!9522 lm!209)) (bvslt (_1!10620 (h!29547 (toList!9522 lm!209))) a!499)))))

(declare-fun b!1267000 () Bool)

(assert (=> b!1267000 (= e!721730 (containsKey!670 (t!41869 (toList!9522 lm!209)) a!499))))

(assert (= (and d!139371 (not res!843441)) b!1266999))

(assert (= (and b!1266999 res!843442) b!1267000))

(declare-fun m!1166555 () Bool)

(assert (=> b!1267000 m!1166555))

(assert (=> b!1266962 d!139371))

(declare-fun d!139375 () Bool)

(declare-fun res!843449 () Bool)

(declare-fun e!721739 () Bool)

(assert (=> d!139375 (=> res!843449 e!721739)))

(assert (=> d!139375 (= res!843449 (or (is-Nil!28339 (toList!9522 lm!209)) (is-Nil!28339 (t!41869 (toList!9522 lm!209)))))))

(assert (=> d!139375 (= (isStrictlySorted!811 (toList!9522 lm!209)) e!721739)))

(declare-fun b!1267011 () Bool)

(declare-fun e!721740 () Bool)

(assert (=> b!1267011 (= e!721739 e!721740)))

(declare-fun res!843450 () Bool)

(assert (=> b!1267011 (=> (not res!843450) (not e!721740))))

(assert (=> b!1267011 (= res!843450 (bvslt (_1!10620 (h!29547 (toList!9522 lm!209))) (_1!10620 (h!29547 (t!41869 (toList!9522 lm!209))))))))

(declare-fun b!1267012 () Bool)

(assert (=> b!1267012 (= e!721740 (isStrictlySorted!811 (t!41869 (toList!9522 lm!209))))))

(assert (= (and d!139375 (not res!843449)) b!1267011))

(assert (= (and b!1267011 res!843450) b!1267012))

(declare-fun m!1166557 () Bool)

(assert (=> b!1267012 m!1166557))

(assert (=> b!1266961 d!139375))

(declare-fun d!139377 () Bool)

(declare-fun e!721753 () Bool)

(assert (=> d!139377 e!721753))

(declare-fun res!843457 () Bool)

(assert (=> d!139377 (=> res!843457 e!721753)))

(declare-fun lt!574286 () Bool)

(assert (=> d!139377 (= res!843457 (not lt!574286))))

(declare-fun lt!574284 () Bool)

(assert (=> d!139377 (= lt!574286 lt!574284)))

(declare-fun lt!574285 () Unit!42207)

(declare-fun e!721754 () Unit!42207)

(assert (=> d!139377 (= lt!574285 e!721754)))

(declare-fun c!123535 () Bool)

(assert (=> d!139377 (= c!123535 lt!574284)))

(assert (=> d!139377 (= lt!574284 (containsKey!670 (toList!9522 lm!209) a!499))))

(assert (=> d!139377 (= (contains!7658 lm!209 a!499) lt!574286)))

(declare-fun b!1267031 () Bool)

(declare-fun lt!574287 () Unit!42207)

(assert (=> b!1267031 (= e!721754 lt!574287)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!454 (List!28342 (_ BitVec 64)) Unit!42207)

(assert (=> b!1267031 (= lt!574287 (lemmaContainsKeyImpliesGetValueByKeyDefined!454 (toList!9522 lm!209) a!499))))

(declare-datatypes ((Option!738 0))(
  ( (Some!737 (v!19021 B!2030)) (None!736) )
))
(declare-fun isDefined!493 (Option!738) Bool)

(declare-fun getValueByKey!686 (List!28342 (_ BitVec 64)) Option!738)

(assert (=> b!1267031 (isDefined!493 (getValueByKey!686 (toList!9522 lm!209) a!499))))

(declare-fun b!1267032 () Bool)

(declare-fun Unit!42215 () Unit!42207)

(assert (=> b!1267032 (= e!721754 Unit!42215)))

(declare-fun b!1267033 () Bool)

(assert (=> b!1267033 (= e!721753 (isDefined!493 (getValueByKey!686 (toList!9522 lm!209) a!499)))))

(assert (= (and d!139377 c!123535) b!1267031))

(assert (= (and d!139377 (not c!123535)) b!1267032))

(assert (= (and d!139377 (not res!843457)) b!1267033))

(assert (=> d!139377 m!1166513))

(declare-fun m!1166573 () Bool)

(assert (=> b!1267031 m!1166573))

(declare-fun m!1166575 () Bool)

(assert (=> b!1267031 m!1166575))

(assert (=> b!1267031 m!1166575))

(declare-fun m!1166577 () Bool)

(assert (=> b!1267031 m!1166577))

(assert (=> b!1267033 m!1166575))

(assert (=> b!1267033 m!1166575))

(assert (=> b!1267033 m!1166577))

(assert (=> start!106666 d!139377))

(declare-fun d!139389 () Bool)

(assert (=> d!139389 (= (inv!44193 lm!209) (isStrictlySorted!811 (toList!9522 lm!209)))))

(declare-fun bs!35868 () Bool)

(assert (= bs!35868 d!139389))

(assert (=> bs!35868 m!1166511))

(assert (=> start!106666 d!139389))

(declare-fun d!139393 () Bool)

(declare-fun lt!574295 () ListLongMap!19013)

(assert (=> d!139393 (not (contains!7658 lt!574295 a!499))))

(assert (=> d!139393 (= lt!574295 (ListLongMap!19014 (removeStrictlySorted!161 (toList!9522 lm!209) a!499)))))

(assert (=> d!139393 (= (-!2155 lm!209 a!499) lt!574295)))

(declare-fun bs!35869 () Bool)

(assert (= bs!35869 d!139393))

(declare-fun m!1166581 () Bool)

(assert (=> bs!35869 m!1166581))

(assert (=> bs!35869 m!1166521))

(assert (=> b!1266963 d!139393))

(declare-fun b!1267080 () Bool)

(declare-fun e!721785 () List!28342)

(assert (=> b!1267080 (= e!721785 Nil!28339)))

(declare-fun b!1267081 () Bool)

(declare-fun e!721787 () Bool)

(declare-fun lt!574308 () List!28342)

(assert (=> b!1267081 (= e!721787 (not (containsKey!670 lt!574308 a!499)))))

(declare-fun b!1267082 () Bool)

(declare-fun e!721786 () List!28342)

(assert (=> b!1267082 (= e!721786 e!721785)))

(declare-fun c!123552 () Bool)

(assert (=> b!1267082 (= c!123552 (and (is-Cons!28338 (toList!9522 lm!209)) (not (= (_1!10620 (h!29547 (toList!9522 lm!209))) a!499))))))

(declare-fun b!1267083 () Bool)

(declare-fun $colon$colon!649 (List!28342 tuple2!21218) List!28342)

(assert (=> b!1267083 (= e!721785 ($colon$colon!649 (removeStrictlySorted!161 (t!41869 (toList!9522 lm!209)) a!499) (h!29547 (toList!9522 lm!209))))))

(declare-fun b!1267084 () Bool)

(assert (=> b!1267084 (= e!721786 (t!41869 (toList!9522 lm!209)))))

(declare-fun d!139395 () Bool)

(assert (=> d!139395 e!721787))

(declare-fun res!843472 () Bool)

(assert (=> d!139395 (=> (not res!843472) (not e!721787))))

(assert (=> d!139395 (= res!843472 (isStrictlySorted!811 lt!574308))))

(assert (=> d!139395 (= lt!574308 e!721786)))

(declare-fun c!123553 () Bool)

(assert (=> d!139395 (= c!123553 (and (is-Cons!28338 (toList!9522 lm!209)) (= (_1!10620 (h!29547 (toList!9522 lm!209))) a!499)))))

(assert (=> d!139395 (isStrictlySorted!811 (toList!9522 lm!209))))

(assert (=> d!139395 (= (removeStrictlySorted!161 (toList!9522 lm!209) a!499) lt!574308)))

(assert (= (and d!139395 c!123553) b!1267084))

(assert (= (and d!139395 (not c!123553)) b!1267082))

(assert (= (and b!1267082 c!123552) b!1267083))

(assert (= (and b!1267082 (not c!123552)) b!1267080))

(assert (= (and d!139395 res!843472) b!1267081))

(declare-fun m!1166605 () Bool)

(assert (=> b!1267081 m!1166605))

(declare-fun m!1166607 () Bool)

(assert (=> b!1267083 m!1166607))

(assert (=> b!1267083 m!1166607))

(declare-fun m!1166609 () Bool)

(assert (=> b!1267083 m!1166609))

(declare-fun m!1166611 () Bool)

(assert (=> d!139395 m!1166611))

(assert (=> d!139395 m!1166511))

(assert (=> b!1266963 d!139395))

(declare-fun d!139407 () Bool)

(assert (=> d!139407 (= (removeStrictlySorted!161 (toList!9522 lm!209) a!499) (toList!9522 lm!209))))

(declare-fun lt!574311 () Unit!42207)

(declare-fun choose!1891 (List!28342 (_ BitVec 64)) Unit!42207)

(assert (=> d!139407 (= lt!574311 (choose!1891 (toList!9522 lm!209) a!499))))

(assert (=> d!139407 (isStrictlySorted!811 (toList!9522 lm!209))))

(assert (=> d!139407 (= (lemmaRemoveStrictlySortedNotPresentPreserves!1 (toList!9522 lm!209) a!499) lt!574311)))

(declare-fun bs!35872 () Bool)

(assert (= bs!35872 d!139407))

(assert (=> bs!35872 m!1166521))

(declare-fun m!1166615 () Bool)

(assert (=> bs!35872 m!1166615))

(assert (=> bs!35872 m!1166511))

(assert (=> b!1266963 d!139407))

(declare-fun b!1267110 () Bool)

(declare-fun e!721807 () Bool)

(declare-fun tp_is_empty!32553 () Bool)

(declare-fun tp!96520 () Bool)

(assert (=> b!1267110 (= e!721807 (and tp_is_empty!32553 tp!96520))))

(assert (=> b!1266964 (= tp!96506 e!721807)))

(assert (= (and b!1266964 (is-Cons!28338 (toList!9522 lm!209))) b!1267110))

(push 1)

