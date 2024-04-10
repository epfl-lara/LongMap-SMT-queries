; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136878 () Bool)

(assert start!136878)

(declare-fun b!1579015 () Bool)

(declare-fun res!1078896 () Bool)

(declare-fun e!880795 () Bool)

(assert (=> b!1579015 (=> (not res!1078896) (not e!880795))))

(declare-datatypes ((B!2574 0))(
  ( (B!2575 (val!19649 Int)) )
))
(declare-datatypes ((tuple2!25400 0))(
  ( (tuple2!25401 (_1!12711 (_ BitVec 64)) (_2!12711 B!2574)) )
))
(declare-datatypes ((List!36769 0))(
  ( (Nil!36766) (Cons!36765 (h!38308 tuple2!25400) (t!51683 List!36769)) )
))
(declare-datatypes ((ListLongMap!22739 0))(
  ( (ListLongMap!22740 (toList!11385 List!36769)) )
))
(declare-fun lm!251 () ListLongMap!22739)

(declare-fun a0!51 () (_ BitVec 64))

(declare-fun containsKey!879 (List!36769 (_ BitVec 64)) Bool)

(assert (=> b!1579015 (= res!1078896 (not (containsKey!879 (toList!11385 lm!251) a0!51)))))

(declare-fun b!1579016 () Bool)

(declare-fun res!1078899 () Bool)

(assert (=> b!1579016 (=> (not res!1078899) (not e!880795))))

(declare-fun a!525 () (_ BitVec 64))

(assert (=> b!1579016 (= res!1078899 (not (= a0!51 a!525)))))

(declare-fun b!1579017 () Bool)

(declare-fun res!1078898 () Bool)

(assert (=> b!1579017 (=> (not res!1078898) (not e!880795))))

(assert (=> b!1579017 (= res!1078898 (not (= a!525 a0!51)))))

(declare-fun b!1579018 () Bool)

(declare-fun e!880796 () Bool)

(declare-fun tp!114285 () Bool)

(assert (=> b!1579018 (= e!880796 tp!114285)))

(declare-fun b!1579019 () Bool)

(declare-fun res!1078897 () Bool)

(assert (=> b!1579019 (=> (not res!1078897) (not e!880795))))

(declare-fun isStrictlySorted!1030 (List!36769) Bool)

(assert (=> b!1579019 (= res!1078897 (isStrictlySorted!1030 (toList!11385 lm!251)))))

(declare-fun res!1078895 () Bool)

(assert (=> start!136878 (=> (not res!1078895) (not e!880795))))

(declare-fun contains!10441 (ListLongMap!22739 (_ BitVec 64)) Bool)

(assert (=> start!136878 (= res!1078895 (not (contains!10441 lm!251 a0!51)))))

(assert (=> start!136878 e!880795))

(declare-fun inv!58930 (ListLongMap!22739) Bool)

(assert (=> start!136878 (and (inv!58930 lm!251) e!880796)))

(assert (=> start!136878 true))

(declare-fun tp_is_empty!39119 () Bool)

(assert (=> start!136878 tp_is_empty!39119))

(declare-fun b!1579020 () Bool)

(declare-fun b!98 () B!2574)

(declare-fun +!5090 (ListLongMap!22739 tuple2!25400) ListLongMap!22739)

(assert (=> b!1579020 (= e!880795 (not (not (contains!10441 (+!5090 lm!251 (tuple2!25401 a!525 b!98)) a0!51))))))

(declare-fun insertStrictlySorted!604 (List!36769 (_ BitVec 64) B!2574) List!36769)

(assert (=> b!1579020 (not (containsKey!879 (insertStrictlySorted!604 (toList!11385 lm!251) a!525 b!98) a0!51))))

(declare-datatypes ((Unit!52211 0))(
  ( (Unit!52212) )
))
(declare-fun lt!676375 () Unit!52211)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!3 (List!36769 (_ BitVec 64) B!2574 (_ BitVec 64)) Unit!52211)

(assert (=> b!1579020 (= lt!676375 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!3 (toList!11385 lm!251) a!525 b!98 a0!51))))

(assert (= (and start!136878 res!1078895) b!1579017))

(assert (= (and b!1579017 res!1078898) b!1579019))

(assert (= (and b!1579019 res!1078897) b!1579015))

(assert (= (and b!1579015 res!1078896) b!1579016))

(assert (= (and b!1579016 res!1078899) b!1579020))

(assert (= start!136878 b!1579018))

(declare-fun m!1450975 () Bool)

(assert (=> b!1579015 m!1450975))

(declare-fun m!1450977 () Bool)

(assert (=> b!1579019 m!1450977))

(declare-fun m!1450979 () Bool)

(assert (=> start!136878 m!1450979))

(declare-fun m!1450981 () Bool)

(assert (=> start!136878 m!1450981))

(declare-fun m!1450983 () Bool)

(assert (=> b!1579020 m!1450983))

(declare-fun m!1450985 () Bool)

(assert (=> b!1579020 m!1450985))

(declare-fun m!1450987 () Bool)

(assert (=> b!1579020 m!1450987))

(assert (=> b!1579020 m!1450983))

(declare-fun m!1450989 () Bool)

(assert (=> b!1579020 m!1450989))

(declare-fun m!1450991 () Bool)

(assert (=> b!1579020 m!1450991))

(assert (=> b!1579020 m!1450985))

(push 1)

(assert (not b!1579018))

(assert (not b!1579015))

(assert (not b!1579020))

(assert (not start!136878))

(assert tp_is_empty!39119)

(assert (not b!1579019))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166181 () Bool)

(declare-fun e!880808 () Bool)

(assert (=> d!166181 e!880808))

(declare-fun res!1078908 () Bool)

(assert (=> d!166181 (=> res!1078908 e!880808)))

(declare-fun lt!676386 () Bool)

(assert (=> d!166181 (= res!1078908 (not lt!676386))))

(declare-fun lt!676384 () Bool)

(assert (=> d!166181 (= lt!676386 lt!676384)))

(declare-fun lt!676387 () Unit!52211)

(declare-fun e!880807 () Unit!52211)

(assert (=> d!166181 (= lt!676387 e!880807)))

(declare-fun c!146325 () Bool)

(assert (=> d!166181 (= c!146325 lt!676384)))

(assert (=> d!166181 (= lt!676384 (containsKey!879 (toList!11385 lm!251) a0!51))))

(assert (=> d!166181 (= (contains!10441 lm!251 a0!51) lt!676386)))

(declare-fun b!1579033 () Bool)

(declare-fun lt!676385 () Unit!52211)

(assert (=> b!1579033 (= e!880807 lt!676385)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!543 (List!36769 (_ BitVec 64)) Unit!52211)

(assert (=> b!1579033 (= lt!676385 (lemmaContainsKeyImpliesGetValueByKeyDefined!543 (toList!11385 lm!251) a0!51))))

(declare-datatypes ((Option!878 0))(
  ( (Some!877 (v!22366 B!2574)) (None!876) )
))
(declare-fun isDefined!591 (Option!878) Bool)

(declare-fun getValueByKey!802 (List!36769 (_ BitVec 64)) Option!878)

(assert (=> b!1579033 (isDefined!591 (getValueByKey!802 (toList!11385 lm!251) a0!51))))

(declare-fun b!1579034 () Bool)

(declare-fun Unit!52213 () Unit!52211)

(assert (=> b!1579034 (= e!880807 Unit!52213)))

(declare-fun b!1579035 () Bool)

(assert (=> b!1579035 (= e!880808 (isDefined!591 (getValueByKey!802 (toList!11385 lm!251) a0!51)))))

(assert (= (and d!166181 c!146325) b!1579033))

(assert (= (and d!166181 (not c!146325)) b!1579034))

(assert (= (and d!166181 (not res!1078908)) b!1579035))

(assert (=> d!166181 m!1450975))

(declare-fun m!1450995 () Bool)

(assert (=> b!1579033 m!1450995))

(declare-fun m!1450997 () Bool)

(assert (=> b!1579033 m!1450997))

(assert (=> b!1579033 m!1450997))

(declare-fun m!1450999 () Bool)

(assert (=> b!1579033 m!1450999))

(assert (=> b!1579035 m!1450997))

(assert (=> b!1579035 m!1450997))

(assert (=> b!1579035 m!1450999))

(assert (=> start!136878 d!166181))

(declare-fun d!166189 () Bool)

(assert (=> d!166189 (= (inv!58930 lm!251) (isStrictlySorted!1030 (toList!11385 lm!251)))))

(declare-fun bs!45726 () Bool)

(assert (= bs!45726 d!166189))

(assert (=> bs!45726 m!1450977))

(assert (=> start!136878 d!166189))

(declare-fun d!166191 () Bool)

(declare-fun res!1078913 () Bool)

(declare-fun e!880813 () Bool)

(assert (=> d!166191 (=> res!1078913 e!880813)))

(assert (=> d!166191 (= res!1078913 (and (is-Cons!36765 (toList!11385 lm!251)) (= (_1!12711 (h!38308 (toList!11385 lm!251))) a0!51)))))

(assert (=> d!166191 (= (containsKey!879 (toList!11385 lm!251) a0!51) e!880813)))

(declare-fun b!1579040 () Bool)

(declare-fun e!880814 () Bool)

(assert (=> b!1579040 (= e!880813 e!880814)))

(declare-fun res!1078914 () Bool)

(assert (=> b!1579040 (=> (not res!1078914) (not e!880814))))

(assert (=> b!1579040 (= res!1078914 (and (or (not (is-Cons!36765 (toList!11385 lm!251))) (bvsle (_1!12711 (h!38308 (toList!11385 lm!251))) a0!51)) (is-Cons!36765 (toList!11385 lm!251)) (bvslt (_1!12711 (h!38308 (toList!11385 lm!251))) a0!51)))))

(declare-fun b!1579041 () Bool)

(assert (=> b!1579041 (= e!880814 (containsKey!879 (t!51683 (toList!11385 lm!251)) a0!51))))

(assert (= (and d!166191 (not res!1078913)) b!1579040))

(assert (= (and b!1579040 res!1078914) b!1579041))

(declare-fun m!1451001 () Bool)

(assert (=> b!1579041 m!1451001))

(assert (=> b!1579015 d!166191))

(declare-fun b!1579107 () Bool)

(declare-fun res!1078934 () Bool)

(declare-fun e!880854 () Bool)

(assert (=> b!1579107 (=> (not res!1078934) (not e!880854))))

(declare-fun lt!676405 () List!36769)

(assert (=> b!1579107 (= res!1078934 (containsKey!879 lt!676405 a!525))))

(declare-fun b!1579108 () Bool)

(declare-fun e!880852 () List!36769)

(declare-fun call!72389 () List!36769)

(assert (=> b!1579108 (= e!880852 call!72389)))

(declare-fun b!1579109 () Bool)

(declare-fun e!880855 () List!36769)

(declare-fun call!72387 () List!36769)

(assert (=> b!1579109 (= e!880855 call!72387)))

(declare-fun b!1579110 () Bool)

(declare-fun c!146352 () Bool)

(assert (=> b!1579110 (= c!146352 (and (is-Cons!36765 (toList!11385 lm!251)) (bvsgt (_1!12711 (h!38308 (toList!11385 lm!251))) a!525)))))

(declare-fun e!880856 () List!36769)

(assert (=> b!1579110 (= e!880856 e!880852)))

(declare-fun b!1579111 () Bool)

(declare-fun e!880853 () List!36769)

(assert (=> b!1579111 (= e!880853 (insertStrictlySorted!604 (t!51683 (toList!11385 lm!251)) a!525 b!98))))

(declare-fun b!1579112 () Bool)

(assert (=> b!1579112 (= e!880852 call!72389)))

(declare-fun bm!72384 () Bool)

(declare-fun c!146349 () Bool)

(declare-fun $colon$colon!1005 (List!36769 tuple2!25400) List!36769)

(assert (=> bm!72384 (= call!72387 ($colon$colon!1005 e!880853 (ite c!146349 (h!38308 (toList!11385 lm!251)) (tuple2!25401 a!525 b!98))))))

(declare-fun c!146350 () Bool)

(assert (=> bm!72384 (= c!146350 c!146349)))

(declare-fun bm!72385 () Bool)

(declare-fun call!72388 () List!36769)

(assert (=> bm!72385 (= call!72389 call!72388)))

(declare-fun c!146351 () Bool)

(declare-fun b!1579113 () Bool)

(assert (=> b!1579113 (= e!880853 (ite c!146351 (t!51683 (toList!11385 lm!251)) (ite c!146352 (Cons!36765 (h!38308 (toList!11385 lm!251)) (t!51683 (toList!11385 lm!251))) Nil!36766)))))

(declare-fun d!166193 () Bool)

(assert (=> d!166193 e!880854))

(declare-fun res!1078935 () Bool)

(assert (=> d!166193 (=> (not res!1078935) (not e!880854))))

(assert (=> d!166193 (= res!1078935 (isStrictlySorted!1030 lt!676405))))

(assert (=> d!166193 (= lt!676405 e!880855)))

(assert (=> d!166193 (= c!146349 (and (is-Cons!36765 (toList!11385 lm!251)) (bvslt (_1!12711 (h!38308 (toList!11385 lm!251))) a!525)))))

(assert (=> d!166193 (isStrictlySorted!1030 (toList!11385 lm!251))))

(assert (=> d!166193 (= (insertStrictlySorted!604 (toList!11385 lm!251) a!525 b!98) lt!676405)))

(declare-fun b!1579114 () Bool)

(declare-fun contains!10442 (List!36769 tuple2!25400) Bool)

(assert (=> b!1579114 (= e!880854 (contains!10442 lt!676405 (tuple2!25401 a!525 b!98)))))

(declare-fun b!1579115 () Bool)

(assert (=> b!1579115 (= e!880855 e!880856)))

(assert (=> b!1579115 (= c!146351 (and (is-Cons!36765 (toList!11385 lm!251)) (= (_1!12711 (h!38308 (toList!11385 lm!251))) a!525)))))

(declare-fun bm!72386 () Bool)

(assert (=> bm!72386 (= call!72388 call!72387)))

(declare-fun b!1579116 () Bool)

(assert (=> b!1579116 (= e!880856 call!72388)))

(assert (= (and d!166193 c!146349) b!1579109))

(assert (= (and d!166193 (not c!146349)) b!1579115))

(assert (= (and b!1579115 c!146351) b!1579116))

(assert (= (and b!1579115 (not c!146351)) b!1579110))

(assert (= (and b!1579110 c!146352) b!1579112))

(assert (= (and b!1579110 (not c!146352)) b!1579108))

(assert (= (or b!1579112 b!1579108) bm!72385))

(assert (= (or b!1579116 bm!72385) bm!72386))

(assert (= (or b!1579109 bm!72386) bm!72384))

(assert (= (and bm!72384 c!146350) b!1579111))

(assert (= (and bm!72384 (not c!146350)) b!1579113))

(assert (= (and d!166193 res!1078935) b!1579107))

(assert (= (and b!1579107 res!1078934) b!1579114))

(declare-fun m!1451011 () Bool)

(assert (=> b!1579107 m!1451011))

(declare-fun m!1451013 () Bool)

(assert (=> d!166193 m!1451013))

(assert (=> d!166193 m!1450977))

(declare-fun m!1451015 () Bool)

(assert (=> b!1579111 m!1451015))

(declare-fun m!1451017 () Bool)

(assert (=> b!1579114 m!1451017))

(declare-fun m!1451019 () Bool)

(assert (=> bm!72384 m!1451019))

(assert (=> b!1579020 d!166193))

(declare-fun d!166201 () Bool)

(declare-fun res!1078936 () Bool)

(declare-fun e!880857 () Bool)

(assert (=> d!166201 (=> res!1078936 e!880857)))

(assert (=> d!166201 (= res!1078936 (and (is-Cons!36765 (insertStrictlySorted!604 (toList!11385 lm!251) a!525 b!98)) (= (_1!12711 (h!38308 (insertStrictlySorted!604 (toList!11385 lm!251) a!525 b!98))) a0!51)))))

(assert (=> d!166201 (= (containsKey!879 (insertStrictlySorted!604 (toList!11385 lm!251) a!525 b!98) a0!51) e!880857)))

(declare-fun b!1579117 () Bool)

(declare-fun e!880858 () Bool)

(assert (=> b!1579117 (= e!880857 e!880858)))

(declare-fun res!1078937 () Bool)

(assert (=> b!1579117 (=> (not res!1078937) (not e!880858))))

(assert (=> b!1579117 (= res!1078937 (and (or (not (is-Cons!36765 (insertStrictlySorted!604 (toList!11385 lm!251) a!525 b!98))) (bvsle (_1!12711 (h!38308 (insertStrictlySorted!604 (toList!11385 lm!251) a!525 b!98))) a0!51)) (is-Cons!36765 (insertStrictlySorted!604 (toList!11385 lm!251) a!525 b!98)) (bvslt (_1!12711 (h!38308 (insertStrictlySorted!604 (toList!11385 lm!251) a!525 b!98))) a0!51)))))

(declare-fun b!1579118 () Bool)

(assert (=> b!1579118 (= e!880858 (containsKey!879 (t!51683 (insertStrictlySorted!604 (toList!11385 lm!251) a!525 b!98)) a0!51))))

(assert (= (and d!166201 (not res!1078936)) b!1579117))

(assert (= (and b!1579117 res!1078937) b!1579118))

(declare-fun m!1451031 () Bool)

(assert (=> b!1579118 m!1451031))

(assert (=> b!1579020 d!166201))

(declare-fun d!166203 () Bool)

(declare-fun e!880867 () Bool)

(assert (=> d!166203 e!880867))

(declare-fun res!1078948 () Bool)

(assert (=> d!166203 (=> (not res!1078948) (not e!880867))))

(declare-fun lt!676419 () ListLongMap!22739)

(assert (=> d!166203 (= res!1078948 (contains!10441 lt!676419 (_1!12711 (tuple2!25401 a!525 b!98))))))

(declare-fun lt!676417 () List!36769)

(assert (=> d!166203 (= lt!676419 (ListLongMap!22740 lt!676417))))

(declare-fun lt!676418 () Unit!52211)

(declare-fun lt!676416 () Unit!52211)

(assert (=> d!166203 (= lt!676418 lt!676416)))

(assert (=> d!166203 (= (getValueByKey!802 lt!676417 (_1!12711 (tuple2!25401 a!525 b!98))) (Some!877 (_2!12711 (tuple2!25401 a!525 b!98))))))

(declare-fun lemmaContainsTupThenGetReturnValue!388 (List!36769 (_ BitVec 64) B!2574) Unit!52211)

(assert (=> d!166203 (= lt!676416 (lemmaContainsTupThenGetReturnValue!388 lt!676417 (_1!12711 (tuple2!25401 a!525 b!98)) (_2!12711 (tuple2!25401 a!525 b!98))))))

(assert (=> d!166203 (= lt!676417 (insertStrictlySorted!604 (toList!11385 lm!251) (_1!12711 (tuple2!25401 a!525 b!98)) (_2!12711 (tuple2!25401 a!525 b!98))))))

(assert (=> d!166203 (= (+!5090 lm!251 (tuple2!25401 a!525 b!98)) lt!676419)))

(declare-fun b!1579131 () Bool)

(declare-fun res!1078949 () Bool)

(assert (=> b!1579131 (=> (not res!1078949) (not e!880867))))

(assert (=> b!1579131 (= res!1078949 (= (getValueByKey!802 (toList!11385 lt!676419) (_1!12711 (tuple2!25401 a!525 b!98))) (Some!877 (_2!12711 (tuple2!25401 a!525 b!98)))))))

(declare-fun b!1579132 () Bool)

(assert (=> b!1579132 (= e!880867 (contains!10442 (toList!11385 lt!676419) (tuple2!25401 a!525 b!98)))))

(assert (= (and d!166203 res!1078948) b!1579131))

(assert (= (and b!1579131 res!1078949) b!1579132))

(declare-fun m!1451035 () Bool)

(assert (=> d!166203 m!1451035))

(declare-fun m!1451037 () Bool)

(assert (=> d!166203 m!1451037))

(declare-fun m!1451039 () Bool)

(assert (=> d!166203 m!1451039))

(declare-fun m!1451041 () Bool)

(assert (=> d!166203 m!1451041))

(declare-fun m!1451043 () Bool)

(assert (=> b!1579131 m!1451043))

(declare-fun m!1451045 () Bool)

(assert (=> b!1579132 m!1451045))

(assert (=> b!1579020 d!166203))

(declare-fun d!166209 () Bool)

(declare-fun e!880875 () Bool)

(assert (=> d!166209 e!880875))

(declare-fun res!1078950 () Bool)

(assert (=> d!166209 (=> res!1078950 e!880875)))

(declare-fun lt!676422 () Bool)

(assert (=> d!166209 (= res!1078950 (not lt!676422))))

(declare-fun lt!676420 () Bool)

(assert (=> d!166209 (= lt!676422 lt!676420)))

(declare-fun lt!676423 () Unit!52211)

(declare-fun e!880874 () Unit!52211)

(assert (=> d!166209 (= lt!676423 e!880874)))

(declare-fun c!146359 () Bool)

(assert (=> d!166209 (= c!146359 lt!676420)))

(assert (=> d!166209 (= lt!676420 (containsKey!879 (toList!11385 (+!5090 lm!251 (tuple2!25401 a!525 b!98))) a0!51))))

(assert (=> d!166209 (= (contains!10441 (+!5090 lm!251 (tuple2!25401 a!525 b!98)) a0!51) lt!676422)))

(declare-fun b!1579143 () Bool)

(declare-fun lt!676421 () Unit!52211)

(assert (=> b!1579143 (= e!880874 lt!676421)))

(assert (=> b!1579143 (= lt!676421 (lemmaContainsKeyImpliesGetValueByKeyDefined!543 (toList!11385 (+!5090 lm!251 (tuple2!25401 a!525 b!98))) a0!51))))

(assert (=> b!1579143 (isDefined!591 (getValueByKey!802 (toList!11385 (+!5090 lm!251 (tuple2!25401 a!525 b!98))) a0!51))))

(declare-fun b!1579144 () Bool)

(declare-fun Unit!52215 () Unit!52211)

(assert (=> b!1579144 (= e!880874 Unit!52215)))

(declare-fun b!1579145 () Bool)

(assert (=> b!1579145 (= e!880875 (isDefined!591 (getValueByKey!802 (toList!11385 (+!5090 lm!251 (tuple2!25401 a!525 b!98))) a0!51)))))

(assert (= (and d!166209 c!146359) b!1579143))

(assert (= (and d!166209 (not c!146359)) b!1579144))

(assert (= (and d!166209 (not res!1078950)) b!1579145))

(declare-fun m!1451047 () Bool)

(assert (=> d!166209 m!1451047))

(declare-fun m!1451049 () Bool)

(assert (=> b!1579143 m!1451049))

(declare-fun m!1451051 () Bool)

(assert (=> b!1579143 m!1451051))

(assert (=> b!1579143 m!1451051))

(declare-fun m!1451053 () Bool)

(assert (=> b!1579143 m!1451053))

(assert (=> b!1579145 m!1451051))

(assert (=> b!1579145 m!1451051))

(assert (=> b!1579145 m!1451053))

(assert (=> b!1579020 d!166209))

(declare-fun d!166211 () Bool)

(assert (=> d!166211 (not (containsKey!879 (insertStrictlySorted!604 (toList!11385 lm!251) a!525 b!98) a0!51))))

(declare-fun lt!676426 () Unit!52211)

(declare-fun choose!2087 (List!36769 (_ BitVec 64) B!2574 (_ BitVec 64)) Unit!52211)

(assert (=> d!166211 (= lt!676426 (choose!2087 (toList!11385 lm!251) a!525 b!98 a0!51))))

(declare-fun e!880882 () Bool)

(assert (=> d!166211 e!880882))

(declare-fun res!1078959 () Bool)

(assert (=> d!166211 (=> (not res!1078959) (not e!880882))))

(assert (=> d!166211 (= res!1078959 (isStrictlySorted!1030 (toList!11385 lm!251)))))

(assert (=> d!166211 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!3 (toList!11385 lm!251) a!525 b!98 a0!51) lt!676426)))

(declare-fun b!1579158 () Bool)

(declare-fun res!1078960 () Bool)

(assert (=> b!1579158 (=> (not res!1078960) (not e!880882))))

(assert (=> b!1579158 (= res!1078960 (not (containsKey!879 (toList!11385 lm!251) a0!51)))))

(declare-fun b!1579159 () Bool)

(assert (=> b!1579159 (= e!880882 (not (= a0!51 a!525)))))

(assert (= (and d!166211 res!1078959) b!1579158))

(assert (= (and b!1579158 res!1078960) b!1579159))

(assert (=> d!166211 m!1450985))

(assert (=> d!166211 m!1450985))

(assert (=> d!166211 m!1450987))

(declare-fun m!1451055 () Bool)

(assert (=> d!166211 m!1451055))

(assert (=> d!166211 m!1450977))

(assert (=> b!1579158 m!1450975))

(assert (=> b!1579020 d!166211))

(declare-fun d!166213 () Bool)

(declare-fun res!1078969 () Bool)

(declare-fun e!880889 () Bool)

(assert (=> d!166213 (=> res!1078969 e!880889)))

(assert (=> d!166213 (= res!1078969 (or (is-Nil!36766 (toList!11385 lm!251)) (is-Nil!36766 (t!51683 (toList!11385 lm!251)))))))

(assert (=> d!166213 (= (isStrictlySorted!1030 (toList!11385 lm!251)) e!880889)))

(declare-fun b!1579168 () Bool)

(declare-fun e!880890 () Bool)

(assert (=> b!1579168 (= e!880889 e!880890)))

(declare-fun res!1078970 () Bool)

(assert (=> b!1579168 (=> (not res!1078970) (not e!880890))))

(assert (=> b!1579168 (= res!1078970 (bvslt (_1!12711 (h!38308 (toList!11385 lm!251))) (_1!12711 (h!38308 (t!51683 (toList!11385 lm!251))))))))

(declare-fun b!1579169 () Bool)

(assert (=> b!1579169 (= e!880890 (isStrictlySorted!1030 (t!51683 (toList!11385 lm!251))))))

(assert (= (and d!166213 (not res!1078969)) b!1579168))

(assert (= (and b!1579168 res!1078970) b!1579169))

(declare-fun m!1451057 () Bool)

(assert (=> b!1579169 m!1451057))

(assert (=> b!1579019 d!166213))

(declare-fun b!1579174 () Bool)

(declare-fun e!880893 () Bool)

(declare-fun tp!114288 () Bool)

(assert (=> b!1579174 (= e!880893 (and tp_is_empty!39119 tp!114288))))

(assert (=> b!1579018 (= tp!114285 e!880893)))

(assert (= (and b!1579018 (is-Cons!36765 (toList!11385 lm!251))) b!1579174))

(push 1)

(assert (not b!1579114))

(assert (not d!166193))

(assert (not d!166203))

(assert (not b!1579118))

(assert (not b!1579143))

(assert (not b!1579035))

(assert (not d!166211))

(assert (not b!1579174))

(assert (not b!1579169))

(assert tp_is_empty!39119)

(assert (not b!1579041))

