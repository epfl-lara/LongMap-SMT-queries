; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103582 () Bool)

(assert start!103582)

(declare-fun b!1240873 () Bool)

(declare-fun res!827914 () Bool)

(declare-fun e!703340 () Bool)

(assert (=> b!1240873 (=> (not res!827914) (not e!703340))))

(declare-datatypes ((B!1824 0))(
  ( (B!1825 (val!15674 Int)) )
))
(declare-datatypes ((tuple2!20220 0))(
  ( (tuple2!20221 (_1!10121 (_ BitVec 64)) (_2!10121 B!1824)) )
))
(declare-datatypes ((List!27339 0))(
  ( (Nil!27336) (Cons!27335 (h!28544 tuple2!20220) (t!40802 List!27339)) )
))
(declare-fun l!644 () List!27339)

(assert (=> b!1240873 (= res!827914 (is-Cons!27335 l!644))))

(declare-fun b!1240874 () Bool)

(declare-fun key2!15 () (_ BitVec 64))

(declare-fun isStrictlySorted!741 (List!27339) Bool)

(declare-fun removeStrictlySorted!120 (List!27339 (_ BitVec 64)) List!27339)

(assert (=> b!1240874 (= e!703340 (not (isStrictlySorted!741 (removeStrictlySorted!120 l!644 key2!15))))))

(declare-fun v1!20 () B!1824)

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun insertStrictlySorted!427 (List!27339 (_ BitVec 64) B!1824) List!27339)

(assert (=> b!1240874 (= (insertStrictlySorted!427 (removeStrictlySorted!120 (t!40802 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!120 (insertStrictlySorted!427 (t!40802 l!644) key1!25 v1!20) key2!15))))

(declare-datatypes ((Unit!41247 0))(
  ( (Unit!41248) )
))
(declare-fun lt!562052 () Unit!41247)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!9 (List!27339 (_ BitVec 64) B!1824 (_ BitVec 64)) Unit!41247)

(assert (=> b!1240874 (= lt!562052 (lemmaInsertAndRemoveStrictlySortedCommutative!9 (t!40802 l!644) key1!25 v1!20 key2!15))))

(declare-fun b!1240875 () Bool)

(declare-fun res!827915 () Bool)

(assert (=> b!1240875 (=> (not res!827915) (not e!703340))))

(assert (=> b!1240875 (= res!827915 (isStrictlySorted!741 (t!40802 l!644)))))

(declare-fun b!1240876 () Bool)

(declare-fun e!703341 () Bool)

(declare-fun tp_is_empty!31223 () Bool)

(declare-fun tp!92588 () Bool)

(assert (=> b!1240876 (= e!703341 (and tp_is_empty!31223 tp!92588))))

(declare-fun res!827917 () Bool)

(assert (=> start!103582 (=> (not res!827917) (not e!703340))))

(assert (=> start!103582 (= res!827917 (not (= key1!25 key2!15)))))

(assert (=> start!103582 e!703340))

(assert (=> start!103582 true))

(assert (=> start!103582 e!703341))

(assert (=> start!103582 tp_is_empty!31223))

(declare-fun b!1240877 () Bool)

(declare-fun res!827916 () Bool)

(assert (=> b!1240877 (=> (not res!827916) (not e!703340))))

(assert (=> b!1240877 (= res!827916 (isStrictlySorted!741 l!644))))

(assert (= (and start!103582 res!827917) b!1240877))

(assert (= (and b!1240877 res!827916) b!1240873))

(assert (= (and b!1240873 res!827914) b!1240875))

(assert (= (and b!1240875 res!827915) b!1240874))

(assert (= (and start!103582 (is-Cons!27335 l!644)) b!1240876))

(declare-fun m!1144129 () Bool)

(assert (=> b!1240874 m!1144129))

(declare-fun m!1144131 () Bool)

(assert (=> b!1240874 m!1144131))

(declare-fun m!1144133 () Bool)

(assert (=> b!1240874 m!1144133))

(assert (=> b!1240874 m!1144131))

(declare-fun m!1144135 () Bool)

(assert (=> b!1240874 m!1144135))

(declare-fun m!1144137 () Bool)

(assert (=> b!1240874 m!1144137))

(assert (=> b!1240874 m!1144135))

(declare-fun m!1144139 () Bool)

(assert (=> b!1240874 m!1144139))

(assert (=> b!1240874 m!1144129))

(declare-fun m!1144141 () Bool)

(assert (=> b!1240874 m!1144141))

(declare-fun m!1144143 () Bool)

(assert (=> b!1240875 m!1144143))

(declare-fun m!1144145 () Bool)

(assert (=> b!1240877 m!1144145))

(push 1)

(assert (not b!1240876))

(assert tp_is_empty!31223)

(assert (not b!1240877))

(assert (not b!1240874))

(assert (not b!1240875))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136375 () Bool)

(declare-fun res!827930 () Bool)

(declare-fun e!703354 () Bool)

(assert (=> d!136375 (=> res!827930 e!703354)))

(assert (=> d!136375 (= res!827930 (or (is-Nil!27336 l!644) (is-Nil!27336 (t!40802 l!644))))))

(assert (=> d!136375 (= (isStrictlySorted!741 l!644) e!703354)))

(declare-fun b!1240890 () Bool)

(declare-fun e!703356 () Bool)

(assert (=> b!1240890 (= e!703354 e!703356)))

(declare-fun res!827932 () Bool)

(assert (=> b!1240890 (=> (not res!827932) (not e!703356))))

(assert (=> b!1240890 (= res!827932 (bvslt (_1!10121 (h!28544 l!644)) (_1!10121 (h!28544 (t!40802 l!644)))))))

(declare-fun b!1240892 () Bool)

(assert (=> b!1240892 (= e!703356 (isStrictlySorted!741 (t!40802 l!644)))))

(assert (= (and d!136375 (not res!827930)) b!1240890))

(assert (= (and b!1240890 res!827932) b!1240892))

(assert (=> b!1240892 m!1144143))

(assert (=> b!1240877 d!136375))

(declare-fun d!136382 () Bool)

(declare-fun res!827934 () Bool)

(declare-fun e!703358 () Bool)

(assert (=> d!136382 (=> res!827934 e!703358)))

(assert (=> d!136382 (= res!827934 (or (is-Nil!27336 (t!40802 l!644)) (is-Nil!27336 (t!40802 (t!40802 l!644)))))))

(assert (=> d!136382 (= (isStrictlySorted!741 (t!40802 l!644)) e!703358)))

(declare-fun b!1240894 () Bool)

(declare-fun e!703360 () Bool)

(assert (=> b!1240894 (= e!703358 e!703360)))

(declare-fun res!827936 () Bool)

(assert (=> b!1240894 (=> (not res!827936) (not e!703360))))

(assert (=> b!1240894 (= res!827936 (bvslt (_1!10121 (h!28544 (t!40802 l!644))) (_1!10121 (h!28544 (t!40802 (t!40802 l!644))))))))

(declare-fun b!1240896 () Bool)

(assert (=> b!1240896 (= e!703360 (isStrictlySorted!741 (t!40802 (t!40802 l!644))))))

(assert (= (and d!136382 (not res!827934)) b!1240894))

(assert (= (and b!1240894 res!827936) b!1240896))

(declare-fun m!1144147 () Bool)

(assert (=> b!1240896 m!1144147))

(assert (=> b!1240875 d!136382))

(declare-fun b!1240932 () Bool)

(declare-fun e!703386 () Bool)

(declare-fun lt!562059 () List!27339)

(declare-fun containsKey!600 (List!27339 (_ BitVec 64)) Bool)

(assert (=> b!1240932 (= e!703386 (not (containsKey!600 lt!562059 key2!15)))))

(declare-fun b!1240933 () Bool)

(declare-fun e!703385 () List!27339)

(assert (=> b!1240933 (= e!703385 Nil!27336)))

(declare-fun d!136385 () Bool)

(assert (=> d!136385 e!703386))

(declare-fun res!827948 () Bool)

(assert (=> d!136385 (=> (not res!827948) (not e!703386))))

(assert (=> d!136385 (= res!827948 (isStrictlySorted!741 lt!562059))))

(declare-fun e!703384 () List!27339)

(assert (=> d!136385 (= lt!562059 e!703384)))

(declare-fun c!121302 () Bool)

(assert (=> d!136385 (= c!121302 (and (is-Cons!27335 (insertStrictlySorted!427 (t!40802 l!644) key1!25 v1!20)) (= (_1!10121 (h!28544 (insertStrictlySorted!427 (t!40802 l!644) key1!25 v1!20))) key2!15)))))

(assert (=> d!136385 (isStrictlySorted!741 (insertStrictlySorted!427 (t!40802 l!644) key1!25 v1!20))))

(assert (=> d!136385 (= (removeStrictlySorted!120 (insertStrictlySorted!427 (t!40802 l!644) key1!25 v1!20) key2!15) lt!562059)))

(declare-fun b!1240934 () Bool)

(declare-fun $colon$colon!616 (List!27339 tuple2!20220) List!27339)

(assert (=> b!1240934 (= e!703385 ($colon$colon!616 (removeStrictlySorted!120 (t!40802 (insertStrictlySorted!427 (t!40802 l!644) key1!25 v1!20)) key2!15) (h!28544 (insertStrictlySorted!427 (t!40802 l!644) key1!25 v1!20))))))

(declare-fun b!1240935 () Bool)

(assert (=> b!1240935 (= e!703384 (t!40802 (insertStrictlySorted!427 (t!40802 l!644) key1!25 v1!20)))))

(declare-fun b!1240936 () Bool)

(assert (=> b!1240936 (= e!703384 e!703385)))

(declare-fun c!121301 () Bool)

(assert (=> b!1240936 (= c!121301 (and (is-Cons!27335 (insertStrictlySorted!427 (t!40802 l!644) key1!25 v1!20)) (not (= (_1!10121 (h!28544 (insertStrictlySorted!427 (t!40802 l!644) key1!25 v1!20))) key2!15))))))

(assert (= (and d!136385 c!121302) b!1240935))

(assert (= (and d!136385 (not c!121302)) b!1240936))

(assert (= (and b!1240936 c!121301) b!1240934))

(assert (= (and b!1240936 (not c!121301)) b!1240933))

(assert (= (and d!136385 res!827948) b!1240932))

(declare-fun m!1144153 () Bool)

(assert (=> b!1240932 m!1144153))

(declare-fun m!1144155 () Bool)

(assert (=> d!136385 m!1144155))

(assert (=> d!136385 m!1144131))

(declare-fun m!1144159 () Bool)

(assert (=> d!136385 m!1144159))

(declare-fun m!1144161 () Bool)

(assert (=> b!1240934 m!1144161))

(assert (=> b!1240934 m!1144161))

(declare-fun m!1144167 () Bool)

(assert (=> b!1240934 m!1144167))

(assert (=> b!1240874 d!136385))

(declare-fun b!1241017 () Bool)

(declare-fun e!703431 () List!27339)

(declare-fun call!61189 () List!27339)

(assert (=> b!1241017 (= e!703431 call!61189)))

(declare-fun c!121335 () Bool)

(declare-fun b!1241018 () Bool)

(declare-fun e!703430 () List!27339)

(declare-fun c!121337 () Bool)

(assert (=> b!1241018 (= e!703430 (ite c!121335 (t!40802 (removeStrictlySorted!120 (t!40802 l!644) key2!15)) (ite c!121337 (Cons!27335 (h!28544 (removeStrictlySorted!120 (t!40802 l!644) key2!15)) (t!40802 (removeStrictlySorted!120 (t!40802 l!644) key2!15))) Nil!27336)))))

(declare-fun bm!61184 () Bool)

(declare-fun call!61187 () List!27339)

(assert (=> bm!61184 (= call!61187 call!61189)))

(declare-fun b!1241019 () Bool)

(assert (=> b!1241019 (= c!121337 (and (is-Cons!27335 (removeStrictlySorted!120 (t!40802 l!644) key2!15)) (bvsgt (_1!10121 (h!28544 (removeStrictlySorted!120 (t!40802 l!644) key2!15))) key1!25)))))

(declare-fun e!703428 () List!27339)

(declare-fun e!703429 () List!27339)

(assert (=> b!1241019 (= e!703428 e!703429)))

(declare-fun b!1241020 () Bool)

(declare-fun res!827965 () Bool)

(declare-fun e!703432 () Bool)

(assert (=> b!1241020 (=> (not res!827965) (not e!703432))))

(declare-fun lt!562069 () List!27339)

(assert (=> b!1241020 (= res!827965 (containsKey!600 lt!562069 key1!25))))

(declare-fun b!1241021 () Bool)

(assert (=> b!1241021 (= e!703428 call!61187)))

(declare-fun b!1241022 () Bool)

(assert (=> b!1241022 (= e!703430 (insertStrictlySorted!427 (t!40802 (removeStrictlySorted!120 (t!40802 l!644) key2!15)) key1!25 v1!20))))

(declare-fun bm!61185 () Bool)

(declare-fun c!121338 () Bool)

(assert (=> bm!61185 (= call!61189 ($colon$colon!616 e!703430 (ite c!121338 (h!28544 (removeStrictlySorted!120 (t!40802 l!644) key2!15)) (tuple2!20221 key1!25 v1!20))))))

(declare-fun c!121336 () Bool)

(assert (=> bm!61185 (= c!121336 c!121338)))

(declare-fun b!1241023 () Bool)

(declare-fun call!61188 () List!27339)

(assert (=> b!1241023 (= e!703429 call!61188)))

(declare-fun b!1241024 () Bool)

(declare-fun contains!7386 (List!27339 tuple2!20220) Bool)

(assert (=> b!1241024 (= e!703432 (contains!7386 lt!562069 (tuple2!20221 key1!25 v1!20)))))

(declare-fun b!1241025 () Bool)

(assert (=> b!1241025 (= e!703429 call!61188)))

(declare-fun b!1241026 () Bool)

(assert (=> b!1241026 (= e!703431 e!703428)))

(assert (=> b!1241026 (= c!121335 (and (is-Cons!27335 (removeStrictlySorted!120 (t!40802 l!644) key2!15)) (= (_1!10121 (h!28544 (removeStrictlySorted!120 (t!40802 l!644) key2!15))) key1!25)))))

(declare-fun d!136393 () Bool)

(assert (=> d!136393 e!703432))

(declare-fun res!827966 () Bool)

(assert (=> d!136393 (=> (not res!827966) (not e!703432))))

(assert (=> d!136393 (= res!827966 (isStrictlySorted!741 lt!562069))))

(assert (=> d!136393 (= lt!562069 e!703431)))

(assert (=> d!136393 (= c!121338 (and (is-Cons!27335 (removeStrictlySorted!120 (t!40802 l!644) key2!15)) (bvslt (_1!10121 (h!28544 (removeStrictlySorted!120 (t!40802 l!644) key2!15))) key1!25)))))

(assert (=> d!136393 (isStrictlySorted!741 (removeStrictlySorted!120 (t!40802 l!644) key2!15))))

(assert (=> d!136393 (= (insertStrictlySorted!427 (removeStrictlySorted!120 (t!40802 l!644) key2!15) key1!25 v1!20) lt!562069)))

(declare-fun bm!61186 () Bool)

(assert (=> bm!61186 (= call!61188 call!61187)))

(assert (= (and d!136393 c!121338) b!1241017))

(assert (= (and d!136393 (not c!121338)) b!1241026))

(assert (= (and b!1241026 c!121335) b!1241021))

(assert (= (and b!1241026 (not c!121335)) b!1241019))

(assert (= (and b!1241019 c!121337) b!1241025))

(assert (= (and b!1241019 (not c!121337)) b!1241023))

(assert (= (or b!1241025 b!1241023) bm!61186))

(assert (= (or b!1241021 bm!61186) bm!61184))

(assert (= (or b!1241017 bm!61184) bm!61185))

(assert (= (and bm!61185 c!121336) b!1241022))

(assert (= (and bm!61185 (not c!121336)) b!1241018))

(assert (= (and d!136393 res!827966) b!1241020))

(assert (= (and b!1241020 res!827965) b!1241024))

(declare-fun m!1144187 () Bool)

(assert (=> b!1241024 m!1144187))

(declare-fun m!1144193 () Bool)

(assert (=> bm!61185 m!1144193))

(declare-fun m!1144199 () Bool)

(assert (=> b!1241020 m!1144199))

(declare-fun m!1144205 () Bool)

(assert (=> b!1241022 m!1144205))

(declare-fun m!1144209 () Bool)

(assert (=> d!136393 m!1144209))

(assert (=> d!136393 m!1144135))

(declare-fun m!1144213 () Bool)

(assert (=> d!136393 m!1144213))

(assert (=> b!1240874 d!136393))

(declare-fun b!1241042 () Bool)

(declare-fun e!703443 () Bool)

(declare-fun lt!562072 () List!27339)

(assert (=> b!1241042 (= e!703443 (not (containsKey!600 lt!562072 key2!15)))))

(declare-fun b!1241043 () Bool)

(declare-fun e!703442 () List!27339)

(assert (=> b!1241043 (= e!703442 Nil!27336)))

(declare-fun d!136401 () Bool)

(assert (=> d!136401 e!703443))

(declare-fun res!827970 () Bool)

(assert (=> d!136401 (=> (not res!827970) (not e!703443))))

(assert (=> d!136401 (= res!827970 (isStrictlySorted!741 lt!562072))))

(declare-fun e!703441 () List!27339)

(assert (=> d!136401 (= lt!562072 e!703441)))

(declare-fun c!121346 () Bool)

(assert (=> d!136401 (= c!121346 (and (is-Cons!27335 l!644) (= (_1!10121 (h!28544 l!644)) key2!15)))))

(assert (=> d!136401 (isStrictlySorted!741 l!644)))

(assert (=> d!136401 (= (removeStrictlySorted!120 l!644 key2!15) lt!562072)))

(declare-fun b!1241044 () Bool)

(assert (=> b!1241044 (= e!703442 ($colon$colon!616 (removeStrictlySorted!120 (t!40802 l!644) key2!15) (h!28544 l!644)))))

(declare-fun b!1241045 () Bool)

(assert (=> b!1241045 (= e!703441 (t!40802 l!644))))

(declare-fun b!1241046 () Bool)

(assert (=> b!1241046 (= e!703441 e!703442)))

(declare-fun c!121345 () Bool)

(assert (=> b!1241046 (= c!121345 (and (is-Cons!27335 l!644) (not (= (_1!10121 (h!28544 l!644)) key2!15))))))

(assert (= (and d!136401 c!121346) b!1241045))

(assert (= (and d!136401 (not c!121346)) b!1241046))

(assert (= (and b!1241046 c!121345) b!1241044))

(assert (= (and b!1241046 (not c!121345)) b!1241043))

(assert (= (and d!136401 res!827970) b!1241042))

(declare-fun m!1144220 () Bool)

(assert (=> b!1241042 m!1144220))

(declare-fun m!1144225 () Bool)

(assert (=> d!136401 m!1144225))

(assert (=> d!136401 m!1144145))

(assert (=> b!1241044 m!1144135))

(assert (=> b!1241044 m!1144135))

(declare-fun m!1144231 () Bool)

(assert (=> b!1241044 m!1144231))

(assert (=> b!1240874 d!136401))

(declare-fun d!136407 () Bool)

(assert (=> d!136407 (= (insertStrictlySorted!427 (removeStrictlySorted!120 (t!40802 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!120 (insertStrictlySorted!427 (t!40802 l!644) key1!25 v1!20) key2!15))))

(declare-fun lt!562081 () Unit!41247)

(declare-fun choose!1836 (List!27339 (_ BitVec 64) B!1824 (_ BitVec 64)) Unit!41247)

(assert (=> d!136407 (= lt!562081 (choose!1836 (t!40802 l!644) key1!25 v1!20 key2!15))))

(assert (=> d!136407 (not (= key1!25 key2!15))))

(assert (=> d!136407 (= (lemmaInsertAndRemoveStrictlySortedCommutative!9 (t!40802 l!644) key1!25 v1!20 key2!15) lt!562081)))

(declare-fun bs!34938 () Bool)

(assert (= bs!34938 d!136407))

(assert (=> bs!34938 m!1144135))

(assert (=> bs!34938 m!1144131))

(assert (=> bs!34938 m!1144131))

(assert (=> bs!34938 m!1144133))

(assert (=> bs!34938 m!1144135))

(assert (=> bs!34938 m!1144139))

(declare-fun m!1144241 () Bool)

(assert (=> bs!34938 m!1144241))

(assert (=> b!1240874 d!136407))

(declare-fun d!136413 () Bool)

(declare-fun res!827974 () Bool)

(declare-fun e!703449 () Bool)

(assert (=> d!136413 (=> res!827974 e!703449)))

(assert (=> d!136413 (= res!827974 (or (is-Nil!27336 (removeStrictlySorted!120 l!644 key2!15)) (is-Nil!27336 (t!40802 (removeStrictlySorted!120 l!644 key2!15)))))))

(assert (=> d!136413 (= (isStrictlySorted!741 (removeStrictlySorted!120 l!644 key2!15)) e!703449)))

(declare-fun b!1241054 () Bool)

(declare-fun e!703450 () Bool)

(assert (=> b!1241054 (= e!703449 e!703450)))

(declare-fun res!827975 () Bool)

(assert (=> b!1241054 (=> (not res!827975) (not e!703450))))

(assert (=> b!1241054 (= res!827975 (bvslt (_1!10121 (h!28544 (removeStrictlySorted!120 l!644 key2!15))) (_1!10121 (h!28544 (t!40802 (removeStrictlySorted!120 l!644 key2!15))))))))

(declare-fun b!1241055 () Bool)

(assert (=> b!1241055 (= e!703450 (isStrictlySorted!741 (t!40802 (removeStrictlySorted!120 l!644 key2!15))))))

(assert (= (and d!136413 (not res!827974)) b!1241054))

(assert (= (and b!1241054 res!827975) b!1241055))

(declare-fun m!1144245 () Bool)

(assert (=> b!1241055 m!1144245))

(assert (=> b!1240874 d!136413))

(declare-fun b!1241063 () Bool)

(declare-fun e!703461 () List!27339)

(declare-fun call!61197 () List!27339)

(assert (=> b!1241063 (= e!703461 call!61197)))

(declare-fun b!1241064 () Bool)

(declare-fun c!121353 () Bool)

(declare-fun c!121355 () Bool)

(declare-fun e!703459 () List!27339)

(assert (=> b!1241064 (= e!703459 (ite c!121353 (t!40802 (t!40802 l!644)) (ite c!121355 (Cons!27335 (h!28544 (t!40802 l!644)) (t!40802 (t!40802 l!644))) Nil!27336)))))

(declare-fun bm!61192 () Bool)

(declare-fun call!61195 () List!27339)

(assert (=> bm!61192 (= call!61195 call!61197)))

(declare-fun b!1241066 () Bool)

(assert (=> b!1241066 (= c!121355 (and (is-Cons!27335 (t!40802 l!644)) (bvsgt (_1!10121 (h!28544 (t!40802 l!644))) key1!25)))))

(declare-fun e!703456 () List!27339)

(declare-fun e!703458 () List!27339)

(assert (=> b!1241066 (= e!703456 e!703458)))

(declare-fun b!1241068 () Bool)

(declare-fun res!827980 () Bool)

(declare-fun e!703462 () Bool)

(assert (=> b!1241068 (=> (not res!827980) (not e!703462))))

(declare-fun lt!562084 () List!27339)

(assert (=> b!1241068 (= res!827980 (containsKey!600 lt!562084 key1!25))))

(declare-fun b!1241070 () Bool)

(assert (=> b!1241070 (= e!703456 call!61195)))

(declare-fun b!1241072 () Bool)

(assert (=> b!1241072 (= e!703459 (insertStrictlySorted!427 (t!40802 (t!40802 l!644)) key1!25 v1!20))))

(declare-fun bm!61194 () Bool)

(declare-fun c!121356 () Bool)

(assert (=> bm!61194 (= call!61197 ($colon$colon!616 e!703459 (ite c!121356 (h!28544 (t!40802 l!644)) (tuple2!20221 key1!25 v1!20))))))

(declare-fun c!121354 () Bool)

(assert (=> bm!61194 (= c!121354 c!121356)))

(declare-fun b!1241074 () Bool)

(declare-fun call!61196 () List!27339)

(assert (=> b!1241074 (= e!703458 call!61196)))

(declare-fun b!1241075 () Bool)

(assert (=> b!1241075 (= e!703462 (contains!7386 lt!562084 (tuple2!20221 key1!25 v1!20)))))

(declare-fun b!1241076 () Bool)

(assert (=> b!1241076 (= e!703458 call!61196)))

(declare-fun b!1241077 () Bool)

(assert (=> b!1241077 (= e!703461 e!703456)))

(assert (=> b!1241077 (= c!121353 (and (is-Cons!27335 (t!40802 l!644)) (= (_1!10121 (h!28544 (t!40802 l!644))) key1!25)))))

(declare-fun d!136419 () Bool)

(assert (=> d!136419 e!703462))

(declare-fun res!827981 () Bool)

(assert (=> d!136419 (=> (not res!827981) (not e!703462))))

(assert (=> d!136419 (= res!827981 (isStrictlySorted!741 lt!562084))))

(assert (=> d!136419 (= lt!562084 e!703461)))

(assert (=> d!136419 (= c!121356 (and (is-Cons!27335 (t!40802 l!644)) (bvslt (_1!10121 (h!28544 (t!40802 l!644))) key1!25)))))

(assert (=> d!136419 (isStrictlySorted!741 (t!40802 l!644))))

(assert (=> d!136419 (= (insertStrictlySorted!427 (t!40802 l!644) key1!25 v1!20) lt!562084)))

(declare-fun bm!61195 () Bool)

(assert (=> bm!61195 (= call!61196 call!61195)))

(assert (= (and d!136419 c!121356) b!1241063))

(assert (= (and d!136419 (not c!121356)) b!1241077))

(assert (= (and b!1241077 c!121353) b!1241070))

(assert (= (and b!1241077 (not c!121353)) b!1241066))

(assert (= (and b!1241066 c!121355) b!1241076))

(assert (= (and b!1241066 (not c!121355)) b!1241074))

(assert (= (or b!1241076 b!1241074) bm!61195))

(assert (= (or b!1241070 bm!61195) bm!61192))

(assert (= (or b!1241063 bm!61192) bm!61194))

(assert (= (and bm!61194 c!121354) b!1241072))

(assert (= (and bm!61194 (not c!121354)) b!1241064))

(assert (= (and d!136419 res!827981) b!1241068))

(assert (= (and b!1241068 res!827980) b!1241075))

(declare-fun m!1144251 () Bool)

(assert (=> b!1241075 m!1144251))

(declare-fun m!1144259 () Bool)

(assert (=> bm!61194 m!1144259))

(declare-fun m!1144263 () Bool)

(assert (=> b!1241068 m!1144263))

(declare-fun m!1144269 () Bool)

(assert (=> b!1241072 m!1144269))

(declare-fun m!1144275 () Bool)

(assert (=> d!136419 m!1144275))

(assert (=> d!136419 m!1144143))

(assert (=> b!1240874 d!136419))

(declare-fun b!1241093 () Bool)

(declare-fun e!703473 () Bool)

(declare-fun lt!562087 () List!27339)

(assert (=> b!1241093 (= e!703473 (not (containsKey!600 lt!562087 key2!15)))))

(declare-fun b!1241094 () Bool)

(declare-fun e!703472 () List!27339)

(assert (=> b!1241094 (= e!703472 Nil!27336)))

(declare-fun d!136425 () Bool)

(assert (=> d!136425 e!703473))

(declare-fun res!827985 () Bool)

(assert (=> d!136425 (=> (not res!827985) (not e!703473))))

(assert (=> d!136425 (= res!827985 (isStrictlySorted!741 lt!562087))))

(declare-fun e!703471 () List!27339)

(assert (=> d!136425 (= lt!562087 e!703471)))

(declare-fun c!121364 () Bool)

(assert (=> d!136425 (= c!121364 (and (is-Cons!27335 (t!40802 l!644)) (= (_1!10121 (h!28544 (t!40802 l!644))) key2!15)))))

(assert (=> d!136425 (isStrictlySorted!741 (t!40802 l!644))))

(assert (=> d!136425 (= (removeStrictlySorted!120 (t!40802 l!644) key2!15) lt!562087)))

(declare-fun b!1241095 () Bool)

(assert (=> b!1241095 (= e!703472 ($colon$colon!616 (removeStrictlySorted!120 (t!40802 (t!40802 l!644)) key2!15) (h!28544 (t!40802 l!644))))))

(declare-fun b!1241096 () Bool)

(assert (=> b!1241096 (= e!703471 (t!40802 (t!40802 l!644)))))

(declare-fun b!1241097 () Bool)

(assert (=> b!1241097 (= e!703471 e!703472)))

(declare-fun c!121363 () Bool)

(assert (=> b!1241097 (= c!121363 (and (is-Cons!27335 (t!40802 l!644)) (not (= (_1!10121 (h!28544 (t!40802 l!644))) key2!15))))))

(assert (= (and d!136425 c!121364) b!1241096))

(assert (= (and d!136425 (not c!121364)) b!1241097))

(assert (= (and b!1241097 c!121363) b!1241095))

(assert (= (and b!1241097 (not c!121363)) b!1241094))

(assert (= (and d!136425 res!827985) b!1241093))

(declare-fun m!1144281 () Bool)

(assert (=> b!1241093 m!1144281))

(declare-fun m!1144285 () Bool)

(assert (=> d!136425 m!1144285))

(assert (=> d!136425 m!1144143))

(declare-fun m!1144291 () Bool)

(assert (=> b!1241095 m!1144291))

(assert (=> b!1241095 m!1144291))

(declare-fun m!1144297 () Bool)

(assert (=> b!1241095 m!1144297))

(assert (=> b!1240874 d!136425))

(declare-fun b!1241115 () Bool)

