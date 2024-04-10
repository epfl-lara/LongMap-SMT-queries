; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75048 () Bool)

(assert start!75048)

(declare-fun res!601180 () Bool)

(declare-fun e!492552 () Bool)

(assert (=> start!75048 (=> (not res!601180) (not e!492552))))

(declare-datatypes ((B!1234 0))(
  ( (B!1235 (val!8923 Int)) )
))
(declare-datatypes ((tuple2!11840 0))(
  ( (tuple2!11841 (_1!5931 (_ BitVec 64)) (_2!5931 B!1234)) )
))
(declare-datatypes ((List!17639 0))(
  ( (Nil!17636) (Cons!17635 (h!18766 tuple2!11840) (t!24916 List!17639)) )
))
(declare-datatypes ((ListLongMap!10609 0))(
  ( (ListLongMap!10610 (toList!5320 List!17639)) )
))
(declare-fun lm!210 () ListLongMap!10609)

(declare-fun isStrictlySorted!466 (List!17639) Bool)

(assert (=> start!75048 (= res!601180 (isStrictlySorted!466 (toList!5320 lm!210)))))

(assert (=> start!75048 e!492552))

(declare-fun e!492551 () Bool)

(declare-fun inv!29370 (ListLongMap!10609) Bool)

(assert (=> start!75048 (and (inv!29370 lm!210) e!492551)))

(assert (=> start!75048 true))

(declare-fun tp_is_empty!17745 () Bool)

(assert (=> start!75048 tp_is_empty!17745))

(declare-fun a!500 () (_ BitVec 64))

(declare-fun b!885027 () Bool)

(declare-fun b1!76 () B!1234)

(declare-fun lt!400890 () tuple2!11840)

(declare-fun +!2582 (ListLongMap!10609 tuple2!11840) ListLongMap!10609)

(assert (=> b!885027 (= e!492552 (not (= (+!2582 lm!210 lt!400890) (+!2582 (+!2582 lm!210 (tuple2!11841 a!500 b1!76)) lt!400890))))))

(declare-fun b2!54 () B!1234)

(assert (=> b!885027 (= lt!400890 (tuple2!11841 a!500 b2!54))))

(declare-fun insertStrictlySorted!283 (List!17639 (_ BitVec 64) B!1234) List!17639)

(assert (=> b!885027 (= (insertStrictlySorted!283 (insertStrictlySorted!283 (toList!5320 lm!210) a!500 b1!76) a!500 b2!54) (insertStrictlySorted!283 (toList!5320 lm!210) a!500 b2!54))))

(declare-datatypes ((Unit!30218 0))(
  ( (Unit!30219) )
))
(declare-fun lt!400891 () Unit!30218)

(declare-fun lemmaInsertStrictlySortedErasesIfSameKey!2 (List!17639 (_ BitVec 64) B!1234 B!1234) Unit!30218)

(assert (=> b!885027 (= lt!400891 (lemmaInsertStrictlySortedErasesIfSameKey!2 (toList!5320 lm!210) a!500 b1!76 b2!54))))

(declare-fun b!885028 () Bool)

(declare-fun tp!54215 () Bool)

(assert (=> b!885028 (= e!492551 tp!54215)))

(assert (= (and start!75048 res!601180) b!885027))

(assert (= start!75048 b!885028))

(declare-fun m!825271 () Bool)

(assert (=> start!75048 m!825271))

(declare-fun m!825273 () Bool)

(assert (=> start!75048 m!825273))

(declare-fun m!825275 () Bool)

(assert (=> b!885027 m!825275))

(declare-fun m!825277 () Bool)

(assert (=> b!885027 m!825277))

(declare-fun m!825279 () Bool)

(assert (=> b!885027 m!825279))

(declare-fun m!825281 () Bool)

(assert (=> b!885027 m!825281))

(declare-fun m!825283 () Bool)

(assert (=> b!885027 m!825283))

(assert (=> b!885027 m!825281))

(assert (=> b!885027 m!825277))

(declare-fun m!825285 () Bool)

(assert (=> b!885027 m!825285))

(declare-fun m!825287 () Bool)

(assert (=> b!885027 m!825287))

(check-sat (not b!885027) (not start!75048) (not b!885028) tp_is_empty!17745)
(check-sat)
(get-model)

(declare-fun b!885093 () Bool)

(declare-fun e!492597 () List!17639)

(declare-fun call!39036 () List!17639)

(assert (=> b!885093 (= e!492597 call!39036)))

(declare-fun b!885094 () Bool)

(declare-fun e!492594 () List!17639)

(assert (=> b!885094 (= e!492597 e!492594)))

(declare-fun c!93204 () Bool)

(get-info :version)

(assert (=> b!885094 (= c!93204 (and ((_ is Cons!17635) (toList!5320 lm!210)) (= (_1!5931 (h!18766 (toList!5320 lm!210))) a!500)))))

(declare-fun bm!39032 () Bool)

(declare-fun call!39037 () List!17639)

(assert (=> bm!39032 (= call!39037 call!39036)))

(declare-fun b!885095 () Bool)

(declare-fun e!492595 () List!17639)

(assert (=> b!885095 (= e!492595 (insertStrictlySorted!283 (t!24916 (toList!5320 lm!210)) a!500 b2!54))))

(declare-fun b!885096 () Bool)

(declare-fun c!93202 () Bool)

(assert (=> b!885096 (= c!93202 (and ((_ is Cons!17635) (toList!5320 lm!210)) (bvsgt (_1!5931 (h!18766 (toList!5320 lm!210))) a!500)))))

(declare-fun e!492598 () List!17639)

(assert (=> b!885096 (= e!492594 e!492598)))

(declare-fun b!885097 () Bool)

(declare-fun e!492596 () Bool)

(declare-fun lt!400914 () List!17639)

(declare-fun contains!4284 (List!17639 tuple2!11840) Bool)

(assert (=> b!885097 (= e!492596 (contains!4284 lt!400914 (tuple2!11841 a!500 b2!54)))))

(declare-fun b!885098 () Bool)

(assert (=> b!885098 (= e!492595 (ite c!93204 (t!24916 (toList!5320 lm!210)) (ite c!93202 (Cons!17635 (h!18766 (toList!5320 lm!210)) (t!24916 (toList!5320 lm!210))) Nil!17636)))))

(declare-fun d!109311 () Bool)

(assert (=> d!109311 e!492596))

(declare-fun res!601210 () Bool)

(assert (=> d!109311 (=> (not res!601210) (not e!492596))))

(assert (=> d!109311 (= res!601210 (isStrictlySorted!466 lt!400914))))

(assert (=> d!109311 (= lt!400914 e!492597)))

(declare-fun c!93205 () Bool)

(assert (=> d!109311 (= c!93205 (and ((_ is Cons!17635) (toList!5320 lm!210)) (bvslt (_1!5931 (h!18766 (toList!5320 lm!210))) a!500)))))

(assert (=> d!109311 (isStrictlySorted!466 (toList!5320 lm!210))))

(assert (=> d!109311 (= (insertStrictlySorted!283 (toList!5320 lm!210) a!500 b2!54) lt!400914)))

(declare-fun bm!39033 () Bool)

(declare-fun call!39035 () List!17639)

(assert (=> bm!39033 (= call!39035 call!39037)))

(declare-fun bm!39034 () Bool)

(declare-fun $colon$colon!539 (List!17639 tuple2!11840) List!17639)

(assert (=> bm!39034 (= call!39036 ($colon$colon!539 e!492595 (ite c!93205 (h!18766 (toList!5320 lm!210)) (tuple2!11841 a!500 b2!54))))))

(declare-fun c!93203 () Bool)

(assert (=> bm!39034 (= c!93203 c!93205)))

(declare-fun b!885099 () Bool)

(declare-fun res!601211 () Bool)

(assert (=> b!885099 (=> (not res!601211) (not e!492596))))

(declare-fun containsKey!404 (List!17639 (_ BitVec 64)) Bool)

(assert (=> b!885099 (= res!601211 (containsKey!404 lt!400914 a!500))))

(declare-fun b!885100 () Bool)

(assert (=> b!885100 (= e!492598 call!39035)))

(declare-fun b!885101 () Bool)

(assert (=> b!885101 (= e!492598 call!39035)))

(declare-fun b!885102 () Bool)

(assert (=> b!885102 (= e!492594 call!39037)))

(assert (= (and d!109311 c!93205) b!885093))

(assert (= (and d!109311 (not c!93205)) b!885094))

(assert (= (and b!885094 c!93204) b!885102))

(assert (= (and b!885094 (not c!93204)) b!885096))

(assert (= (and b!885096 c!93202) b!885100))

(assert (= (and b!885096 (not c!93202)) b!885101))

(assert (= (or b!885100 b!885101) bm!39033))

(assert (= (or b!885102 bm!39033) bm!39032))

(assert (= (or b!885093 bm!39032) bm!39034))

(assert (= (and bm!39034 c!93203) b!885095))

(assert (= (and bm!39034 (not c!93203)) b!885098))

(assert (= (and d!109311 res!601210) b!885099))

(assert (= (and b!885099 res!601211) b!885097))

(declare-fun m!825323 () Bool)

(assert (=> b!885095 m!825323))

(declare-fun m!825325 () Bool)

(assert (=> d!109311 m!825325))

(assert (=> d!109311 m!825271))

(declare-fun m!825327 () Bool)

(assert (=> b!885097 m!825327))

(declare-fun m!825329 () Bool)

(assert (=> b!885099 m!825329))

(declare-fun m!825331 () Bool)

(assert (=> bm!39034 m!825331))

(assert (=> b!885027 d!109311))

(declare-fun d!109323 () Bool)

(declare-fun e!492616 () Bool)

(assert (=> d!109323 e!492616))

(declare-fun res!601223 () Bool)

(assert (=> d!109323 (=> (not res!601223) (not e!492616))))

(declare-fun lt!400926 () ListLongMap!10609)

(declare-fun contains!4288 (ListLongMap!10609 (_ BitVec 64)) Bool)

(assert (=> d!109323 (= res!601223 (contains!4288 lt!400926 (_1!5931 (tuple2!11841 a!500 b1!76))))))

(declare-fun lt!400928 () List!17639)

(assert (=> d!109323 (= lt!400926 (ListLongMap!10610 lt!400928))))

(declare-fun lt!400927 () Unit!30218)

(declare-fun lt!400929 () Unit!30218)

(assert (=> d!109323 (= lt!400927 lt!400929)))

(declare-datatypes ((Option!436 0))(
  ( (Some!435 (v!11394 B!1234)) (None!434) )
))
(declare-fun getValueByKey!430 (List!17639 (_ BitVec 64)) Option!436)

(assert (=> d!109323 (= (getValueByKey!430 lt!400928 (_1!5931 (tuple2!11841 a!500 b1!76))) (Some!435 (_2!5931 (tuple2!11841 a!500 b1!76))))))

(declare-fun lemmaContainsTupThenGetReturnValue!244 (List!17639 (_ BitVec 64) B!1234) Unit!30218)

(assert (=> d!109323 (= lt!400929 (lemmaContainsTupThenGetReturnValue!244 lt!400928 (_1!5931 (tuple2!11841 a!500 b1!76)) (_2!5931 (tuple2!11841 a!500 b1!76))))))

(assert (=> d!109323 (= lt!400928 (insertStrictlySorted!283 (toList!5320 lm!210) (_1!5931 (tuple2!11841 a!500 b1!76)) (_2!5931 (tuple2!11841 a!500 b1!76))))))

(assert (=> d!109323 (= (+!2582 lm!210 (tuple2!11841 a!500 b1!76)) lt!400926)))

(declare-fun b!885137 () Bool)

(declare-fun res!601222 () Bool)

(assert (=> b!885137 (=> (not res!601222) (not e!492616))))

(assert (=> b!885137 (= res!601222 (= (getValueByKey!430 (toList!5320 lt!400926) (_1!5931 (tuple2!11841 a!500 b1!76))) (Some!435 (_2!5931 (tuple2!11841 a!500 b1!76)))))))

(declare-fun b!885138 () Bool)

(assert (=> b!885138 (= e!492616 (contains!4284 (toList!5320 lt!400926) (tuple2!11841 a!500 b1!76)))))

(assert (= (and d!109323 res!601223) b!885137))

(assert (= (and b!885137 res!601222) b!885138))

(declare-fun m!825343 () Bool)

(assert (=> d!109323 m!825343))

(declare-fun m!825345 () Bool)

(assert (=> d!109323 m!825345))

(declare-fun m!825347 () Bool)

(assert (=> d!109323 m!825347))

(declare-fun m!825349 () Bool)

(assert (=> d!109323 m!825349))

(declare-fun m!825351 () Bool)

(assert (=> b!885137 m!825351))

(declare-fun m!825353 () Bool)

(assert (=> b!885138 m!825353))

(assert (=> b!885027 d!109323))

(declare-fun d!109327 () Bool)

(assert (=> d!109327 (= (insertStrictlySorted!283 (insertStrictlySorted!283 (toList!5320 lm!210) a!500 b1!76) a!500 b2!54) (insertStrictlySorted!283 (toList!5320 lm!210) a!500 b2!54))))

(declare-fun lt!400953 () Unit!30218)

(declare-fun choose!1444 (List!17639 (_ BitVec 64) B!1234 B!1234) Unit!30218)

(assert (=> d!109327 (= lt!400953 (choose!1444 (toList!5320 lm!210) a!500 b1!76 b2!54))))

(assert (=> d!109327 (isStrictlySorted!466 (toList!5320 lm!210))))

(assert (=> d!109327 (= (lemmaInsertStrictlySortedErasesIfSameKey!2 (toList!5320 lm!210) a!500 b1!76 b2!54) lt!400953)))

(declare-fun bs!24809 () Bool)

(assert (= bs!24809 d!109327))

(assert (=> bs!24809 m!825287))

(assert (=> bs!24809 m!825281))

(assert (=> bs!24809 m!825283))

(assert (=> bs!24809 m!825281))

(declare-fun m!825395 () Bool)

(assert (=> bs!24809 m!825395))

(assert (=> bs!24809 m!825271))

(assert (=> b!885027 d!109327))

(declare-fun d!109335 () Bool)

(declare-fun e!492627 () Bool)

(assert (=> d!109335 e!492627))

(declare-fun res!601237 () Bool)

(assert (=> d!109335 (=> (not res!601237) (not e!492627))))

(declare-fun lt!400954 () ListLongMap!10609)

(assert (=> d!109335 (= res!601237 (contains!4288 lt!400954 (_1!5931 lt!400890)))))

(declare-fun lt!400956 () List!17639)

(assert (=> d!109335 (= lt!400954 (ListLongMap!10610 lt!400956))))

(declare-fun lt!400955 () Unit!30218)

(declare-fun lt!400957 () Unit!30218)

(assert (=> d!109335 (= lt!400955 lt!400957)))

(assert (=> d!109335 (= (getValueByKey!430 lt!400956 (_1!5931 lt!400890)) (Some!435 (_2!5931 lt!400890)))))

(assert (=> d!109335 (= lt!400957 (lemmaContainsTupThenGetReturnValue!244 lt!400956 (_1!5931 lt!400890) (_2!5931 lt!400890)))))

(assert (=> d!109335 (= lt!400956 (insertStrictlySorted!283 (toList!5320 lm!210) (_1!5931 lt!400890) (_2!5931 lt!400890)))))

(assert (=> d!109335 (= (+!2582 lm!210 lt!400890) lt!400954)))

(declare-fun b!885159 () Bool)

(declare-fun res!601236 () Bool)

(assert (=> b!885159 (=> (not res!601236) (not e!492627))))

(assert (=> b!885159 (= res!601236 (= (getValueByKey!430 (toList!5320 lt!400954) (_1!5931 lt!400890)) (Some!435 (_2!5931 lt!400890))))))

(declare-fun b!885160 () Bool)

(assert (=> b!885160 (= e!492627 (contains!4284 (toList!5320 lt!400954) lt!400890))))

(assert (= (and d!109335 res!601237) b!885159))

(assert (= (and b!885159 res!601236) b!885160))

(declare-fun m!825403 () Bool)

(assert (=> d!109335 m!825403))

(declare-fun m!825405 () Bool)

(assert (=> d!109335 m!825405))

(declare-fun m!825407 () Bool)

(assert (=> d!109335 m!825407))

(declare-fun m!825409 () Bool)

(assert (=> d!109335 m!825409))

(declare-fun m!825411 () Bool)

(assert (=> b!885159 m!825411))

(declare-fun m!825413 () Bool)

(assert (=> b!885160 m!825413))

(assert (=> b!885027 d!109335))

(declare-fun d!109339 () Bool)

(declare-fun e!492628 () Bool)

(assert (=> d!109339 e!492628))

(declare-fun res!601239 () Bool)

(assert (=> d!109339 (=> (not res!601239) (not e!492628))))

(declare-fun lt!400958 () ListLongMap!10609)

(assert (=> d!109339 (= res!601239 (contains!4288 lt!400958 (_1!5931 lt!400890)))))

(declare-fun lt!400960 () List!17639)

(assert (=> d!109339 (= lt!400958 (ListLongMap!10610 lt!400960))))

(declare-fun lt!400959 () Unit!30218)

(declare-fun lt!400961 () Unit!30218)

(assert (=> d!109339 (= lt!400959 lt!400961)))

(assert (=> d!109339 (= (getValueByKey!430 lt!400960 (_1!5931 lt!400890)) (Some!435 (_2!5931 lt!400890)))))

(assert (=> d!109339 (= lt!400961 (lemmaContainsTupThenGetReturnValue!244 lt!400960 (_1!5931 lt!400890) (_2!5931 lt!400890)))))

(assert (=> d!109339 (= lt!400960 (insertStrictlySorted!283 (toList!5320 (+!2582 lm!210 (tuple2!11841 a!500 b1!76))) (_1!5931 lt!400890) (_2!5931 lt!400890)))))

(assert (=> d!109339 (= (+!2582 (+!2582 lm!210 (tuple2!11841 a!500 b1!76)) lt!400890) lt!400958)))

(declare-fun b!885161 () Bool)

(declare-fun res!601238 () Bool)

(assert (=> b!885161 (=> (not res!601238) (not e!492628))))

(assert (=> b!885161 (= res!601238 (= (getValueByKey!430 (toList!5320 lt!400958) (_1!5931 lt!400890)) (Some!435 (_2!5931 lt!400890))))))

(declare-fun b!885162 () Bool)

(assert (=> b!885162 (= e!492628 (contains!4284 (toList!5320 lt!400958) lt!400890))))

(assert (= (and d!109339 res!601239) b!885161))

(assert (= (and b!885161 res!601238) b!885162))

(declare-fun m!825415 () Bool)

(assert (=> d!109339 m!825415))

(declare-fun m!825417 () Bool)

(assert (=> d!109339 m!825417))

(declare-fun m!825419 () Bool)

(assert (=> d!109339 m!825419))

(declare-fun m!825421 () Bool)

(assert (=> d!109339 m!825421))

(declare-fun m!825423 () Bool)

(assert (=> b!885161 m!825423))

(declare-fun m!825425 () Bool)

(assert (=> b!885162 m!825425))

(assert (=> b!885027 d!109339))

(declare-fun b!885163 () Bool)

(declare-fun e!492632 () List!17639)

(declare-fun call!39051 () List!17639)

(assert (=> b!885163 (= e!492632 call!39051)))

(declare-fun b!885164 () Bool)

(declare-fun e!492629 () List!17639)

(assert (=> b!885164 (= e!492632 e!492629)))

(declare-fun c!93224 () Bool)

(assert (=> b!885164 (= c!93224 (and ((_ is Cons!17635) (toList!5320 lm!210)) (= (_1!5931 (h!18766 (toList!5320 lm!210))) a!500)))))

(declare-fun bm!39047 () Bool)

(declare-fun call!39052 () List!17639)

(assert (=> bm!39047 (= call!39052 call!39051)))

(declare-fun b!885165 () Bool)

(declare-fun e!492630 () List!17639)

(assert (=> b!885165 (= e!492630 (insertStrictlySorted!283 (t!24916 (toList!5320 lm!210)) a!500 b1!76))))

(declare-fun b!885166 () Bool)

(declare-fun c!93222 () Bool)

(assert (=> b!885166 (= c!93222 (and ((_ is Cons!17635) (toList!5320 lm!210)) (bvsgt (_1!5931 (h!18766 (toList!5320 lm!210))) a!500)))))

(declare-fun e!492633 () List!17639)

(assert (=> b!885166 (= e!492629 e!492633)))

(declare-fun lt!400962 () List!17639)

(declare-fun b!885167 () Bool)

(declare-fun e!492631 () Bool)

(assert (=> b!885167 (= e!492631 (contains!4284 lt!400962 (tuple2!11841 a!500 b1!76)))))

(declare-fun b!885168 () Bool)

(assert (=> b!885168 (= e!492630 (ite c!93224 (t!24916 (toList!5320 lm!210)) (ite c!93222 (Cons!17635 (h!18766 (toList!5320 lm!210)) (t!24916 (toList!5320 lm!210))) Nil!17636)))))

(declare-fun d!109341 () Bool)

(assert (=> d!109341 e!492631))

(declare-fun res!601240 () Bool)

(assert (=> d!109341 (=> (not res!601240) (not e!492631))))

(assert (=> d!109341 (= res!601240 (isStrictlySorted!466 lt!400962))))

(assert (=> d!109341 (= lt!400962 e!492632)))

(declare-fun c!93225 () Bool)

(assert (=> d!109341 (= c!93225 (and ((_ is Cons!17635) (toList!5320 lm!210)) (bvslt (_1!5931 (h!18766 (toList!5320 lm!210))) a!500)))))

(assert (=> d!109341 (isStrictlySorted!466 (toList!5320 lm!210))))

(assert (=> d!109341 (= (insertStrictlySorted!283 (toList!5320 lm!210) a!500 b1!76) lt!400962)))

(declare-fun bm!39048 () Bool)

(declare-fun call!39050 () List!17639)

(assert (=> bm!39048 (= call!39050 call!39052)))

(declare-fun bm!39049 () Bool)

(assert (=> bm!39049 (= call!39051 ($colon$colon!539 e!492630 (ite c!93225 (h!18766 (toList!5320 lm!210)) (tuple2!11841 a!500 b1!76))))))

(declare-fun c!93223 () Bool)

(assert (=> bm!39049 (= c!93223 c!93225)))

(declare-fun b!885169 () Bool)

(declare-fun res!601241 () Bool)

(assert (=> b!885169 (=> (not res!601241) (not e!492631))))

(assert (=> b!885169 (= res!601241 (containsKey!404 lt!400962 a!500))))

(declare-fun b!885170 () Bool)

(assert (=> b!885170 (= e!492633 call!39050)))

(declare-fun b!885171 () Bool)

(assert (=> b!885171 (= e!492633 call!39050)))

(declare-fun b!885172 () Bool)

(assert (=> b!885172 (= e!492629 call!39052)))

(assert (= (and d!109341 c!93225) b!885163))

(assert (= (and d!109341 (not c!93225)) b!885164))

(assert (= (and b!885164 c!93224) b!885172))

(assert (= (and b!885164 (not c!93224)) b!885166))

(assert (= (and b!885166 c!93222) b!885170))

(assert (= (and b!885166 (not c!93222)) b!885171))

(assert (= (or b!885170 b!885171) bm!39048))

(assert (= (or b!885172 bm!39048) bm!39047))

(assert (= (or b!885163 bm!39047) bm!39049))

(assert (= (and bm!39049 c!93223) b!885165))

(assert (= (and bm!39049 (not c!93223)) b!885168))

(assert (= (and d!109341 res!601240) b!885169))

(assert (= (and b!885169 res!601241) b!885167))

(declare-fun m!825427 () Bool)

(assert (=> b!885165 m!825427))

(declare-fun m!825429 () Bool)

(assert (=> d!109341 m!825429))

(assert (=> d!109341 m!825271))

(declare-fun m!825431 () Bool)

(assert (=> b!885167 m!825431))

(declare-fun m!825433 () Bool)

(assert (=> b!885169 m!825433))

(declare-fun m!825435 () Bool)

(assert (=> bm!39049 m!825435))

(assert (=> b!885027 d!109341))

(declare-fun b!885173 () Bool)

(declare-fun e!492637 () List!17639)

(declare-fun call!39054 () List!17639)

(assert (=> b!885173 (= e!492637 call!39054)))

(declare-fun b!885174 () Bool)

(declare-fun e!492634 () List!17639)

(assert (=> b!885174 (= e!492637 e!492634)))

(declare-fun c!93228 () Bool)

(assert (=> b!885174 (= c!93228 (and ((_ is Cons!17635) (insertStrictlySorted!283 (toList!5320 lm!210) a!500 b1!76)) (= (_1!5931 (h!18766 (insertStrictlySorted!283 (toList!5320 lm!210) a!500 b1!76))) a!500)))))

(declare-fun bm!39050 () Bool)

(declare-fun call!39055 () List!17639)

(assert (=> bm!39050 (= call!39055 call!39054)))

(declare-fun e!492635 () List!17639)

(declare-fun b!885175 () Bool)

(assert (=> b!885175 (= e!492635 (insertStrictlySorted!283 (t!24916 (insertStrictlySorted!283 (toList!5320 lm!210) a!500 b1!76)) a!500 b2!54))))

(declare-fun b!885176 () Bool)

(declare-fun c!93226 () Bool)

(assert (=> b!885176 (= c!93226 (and ((_ is Cons!17635) (insertStrictlySorted!283 (toList!5320 lm!210) a!500 b1!76)) (bvsgt (_1!5931 (h!18766 (insertStrictlySorted!283 (toList!5320 lm!210) a!500 b1!76))) a!500)))))

(declare-fun e!492638 () List!17639)

(assert (=> b!885176 (= e!492634 e!492638)))

(declare-fun e!492636 () Bool)

(declare-fun b!885177 () Bool)

(declare-fun lt!400966 () List!17639)

(assert (=> b!885177 (= e!492636 (contains!4284 lt!400966 (tuple2!11841 a!500 b2!54)))))

(declare-fun b!885178 () Bool)

(assert (=> b!885178 (= e!492635 (ite c!93228 (t!24916 (insertStrictlySorted!283 (toList!5320 lm!210) a!500 b1!76)) (ite c!93226 (Cons!17635 (h!18766 (insertStrictlySorted!283 (toList!5320 lm!210) a!500 b1!76)) (t!24916 (insertStrictlySorted!283 (toList!5320 lm!210) a!500 b1!76))) Nil!17636)))))

(declare-fun d!109343 () Bool)

(assert (=> d!109343 e!492636))

(declare-fun res!601242 () Bool)

(assert (=> d!109343 (=> (not res!601242) (not e!492636))))

(assert (=> d!109343 (= res!601242 (isStrictlySorted!466 lt!400966))))

(assert (=> d!109343 (= lt!400966 e!492637)))

(declare-fun c!93229 () Bool)

(assert (=> d!109343 (= c!93229 (and ((_ is Cons!17635) (insertStrictlySorted!283 (toList!5320 lm!210) a!500 b1!76)) (bvslt (_1!5931 (h!18766 (insertStrictlySorted!283 (toList!5320 lm!210) a!500 b1!76))) a!500)))))

(assert (=> d!109343 (isStrictlySorted!466 (insertStrictlySorted!283 (toList!5320 lm!210) a!500 b1!76))))

(assert (=> d!109343 (= (insertStrictlySorted!283 (insertStrictlySorted!283 (toList!5320 lm!210) a!500 b1!76) a!500 b2!54) lt!400966)))

(declare-fun bm!39051 () Bool)

(declare-fun call!39053 () List!17639)

(assert (=> bm!39051 (= call!39053 call!39055)))

(declare-fun bm!39052 () Bool)

(assert (=> bm!39052 (= call!39054 ($colon$colon!539 e!492635 (ite c!93229 (h!18766 (insertStrictlySorted!283 (toList!5320 lm!210) a!500 b1!76)) (tuple2!11841 a!500 b2!54))))))

(declare-fun c!93227 () Bool)

(assert (=> bm!39052 (= c!93227 c!93229)))

(declare-fun b!885179 () Bool)

(declare-fun res!601243 () Bool)

(assert (=> b!885179 (=> (not res!601243) (not e!492636))))

(assert (=> b!885179 (= res!601243 (containsKey!404 lt!400966 a!500))))

(declare-fun b!885180 () Bool)

(assert (=> b!885180 (= e!492638 call!39053)))

(declare-fun b!885181 () Bool)

(assert (=> b!885181 (= e!492638 call!39053)))

(declare-fun b!885182 () Bool)

(assert (=> b!885182 (= e!492634 call!39055)))

(assert (= (and d!109343 c!93229) b!885173))

(assert (= (and d!109343 (not c!93229)) b!885174))

(assert (= (and b!885174 c!93228) b!885182))

(assert (= (and b!885174 (not c!93228)) b!885176))

(assert (= (and b!885176 c!93226) b!885180))

(assert (= (and b!885176 (not c!93226)) b!885181))

(assert (= (or b!885180 b!885181) bm!39051))

(assert (= (or b!885182 bm!39051) bm!39050))

(assert (= (or b!885173 bm!39050) bm!39052))

(assert (= (and bm!39052 c!93227) b!885175))

(assert (= (and bm!39052 (not c!93227)) b!885178))

(assert (= (and d!109343 res!601242) b!885179))

(assert (= (and b!885179 res!601243) b!885177))

(declare-fun m!825439 () Bool)

(assert (=> b!885175 m!825439))

(declare-fun m!825441 () Bool)

(assert (=> d!109343 m!825441))

(assert (=> d!109343 m!825281))

(declare-fun m!825443 () Bool)

(assert (=> d!109343 m!825443))

(declare-fun m!825445 () Bool)

(assert (=> b!885177 m!825445))

(declare-fun m!825447 () Bool)

(assert (=> b!885179 m!825447))

(declare-fun m!825449 () Bool)

(assert (=> bm!39052 m!825449))

(assert (=> b!885027 d!109343))

(declare-fun d!109347 () Bool)

(declare-fun res!601260 () Bool)

(declare-fun e!492665 () Bool)

(assert (=> d!109347 (=> res!601260 e!492665)))

(assert (=> d!109347 (= res!601260 (or ((_ is Nil!17636) (toList!5320 lm!210)) ((_ is Nil!17636) (t!24916 (toList!5320 lm!210)))))))

(assert (=> d!109347 (= (isStrictlySorted!466 (toList!5320 lm!210)) e!492665)))

(declare-fun b!885231 () Bool)

(declare-fun e!492666 () Bool)

(assert (=> b!885231 (= e!492665 e!492666)))

(declare-fun res!601261 () Bool)

(assert (=> b!885231 (=> (not res!601261) (not e!492666))))

(assert (=> b!885231 (= res!601261 (bvslt (_1!5931 (h!18766 (toList!5320 lm!210))) (_1!5931 (h!18766 (t!24916 (toList!5320 lm!210))))))))

(declare-fun b!885232 () Bool)

(assert (=> b!885232 (= e!492666 (isStrictlySorted!466 (t!24916 (toList!5320 lm!210))))))

(assert (= (and d!109347 (not res!601260)) b!885231))

(assert (= (and b!885231 res!601261) b!885232))

(declare-fun m!825521 () Bool)

(assert (=> b!885232 m!825521))

(assert (=> start!75048 d!109347))

(declare-fun d!109359 () Bool)

(assert (=> d!109359 (= (inv!29370 lm!210) (isStrictlySorted!466 (toList!5320 lm!210)))))

(declare-fun bs!24812 () Bool)

(assert (= bs!24812 d!109359))

(assert (=> bs!24812 m!825271))

(assert (=> start!75048 d!109359))

(declare-fun b!885247 () Bool)

(declare-fun e!492675 () Bool)

(declare-fun tp!54227 () Bool)

(assert (=> b!885247 (= e!492675 (and tp_is_empty!17745 tp!54227))))

(assert (=> b!885028 (= tp!54215 e!492675)))

(assert (= (and b!885028 ((_ is Cons!17635) (toList!5320 lm!210))) b!885247))

(check-sat (not b!885160) (not d!109359) (not d!109327) (not bm!39052) (not b!885099) (not b!885165) tp_is_empty!17745 (not b!885138) (not bm!39049) (not d!109311) (not b!885159) (not b!885177) (not d!109341) (not b!885097) (not bm!39034) (not d!109323) (not b!885095) (not b!885162) (not b!885169) (not b!885179) (not b!885247) (not b!885137) (not b!885161) (not b!885175) (not d!109335) (not b!885167) (not b!885232) (not d!109339) (not d!109343))
(check-sat)
