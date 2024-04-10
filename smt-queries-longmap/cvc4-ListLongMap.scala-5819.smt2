; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75050 () Bool)

(assert start!75050)

(declare-fun res!601183 () Bool)

(declare-fun e!492557 () Bool)

(assert (=> start!75050 (=> (not res!601183) (not e!492557))))

(declare-datatypes ((B!1236 0))(
  ( (B!1237 (val!8924 Int)) )
))
(declare-datatypes ((tuple2!11842 0))(
  ( (tuple2!11843 (_1!5932 (_ BitVec 64)) (_2!5932 B!1236)) )
))
(declare-datatypes ((List!17640 0))(
  ( (Nil!17637) (Cons!17636 (h!18767 tuple2!11842) (t!24917 List!17640)) )
))
(declare-datatypes ((ListLongMap!10611 0))(
  ( (ListLongMap!10612 (toList!5321 List!17640)) )
))
(declare-fun lm!210 () ListLongMap!10611)

(declare-fun isStrictlySorted!467 (List!17640) Bool)

(assert (=> start!75050 (= res!601183 (isStrictlySorted!467 (toList!5321 lm!210)))))

(assert (=> start!75050 e!492557))

(declare-fun e!492558 () Bool)

(declare-fun inv!29371 (ListLongMap!10611) Bool)

(assert (=> start!75050 (and (inv!29371 lm!210) e!492558)))

(assert (=> start!75050 true))

(declare-fun tp_is_empty!17747 () Bool)

(assert (=> start!75050 tp_is_empty!17747))

(declare-fun lt!400897 () tuple2!11842)

(declare-fun b1!76 () B!1236)

(declare-fun b!885033 () Bool)

(declare-fun a!500 () (_ BitVec 64))

(declare-fun +!2583 (ListLongMap!10611 tuple2!11842) ListLongMap!10611)

(assert (=> b!885033 (= e!492557 (not (= (+!2583 lm!210 lt!400897) (+!2583 (+!2583 lm!210 (tuple2!11843 a!500 b1!76)) lt!400897))))))

(declare-fun b2!54 () B!1236)

(assert (=> b!885033 (= lt!400897 (tuple2!11843 a!500 b2!54))))

(declare-fun insertStrictlySorted!284 (List!17640 (_ BitVec 64) B!1236) List!17640)

(assert (=> b!885033 (= (insertStrictlySorted!284 (insertStrictlySorted!284 (toList!5321 lm!210) a!500 b1!76) a!500 b2!54) (insertStrictlySorted!284 (toList!5321 lm!210) a!500 b2!54))))

(declare-datatypes ((Unit!30220 0))(
  ( (Unit!30221) )
))
(declare-fun lt!400896 () Unit!30220)

(declare-fun lemmaInsertStrictlySortedErasesIfSameKey!3 (List!17640 (_ BitVec 64) B!1236 B!1236) Unit!30220)

(assert (=> b!885033 (= lt!400896 (lemmaInsertStrictlySortedErasesIfSameKey!3 (toList!5321 lm!210) a!500 b1!76 b2!54))))

(declare-fun b!885034 () Bool)

(declare-fun tp!54218 () Bool)

(assert (=> b!885034 (= e!492558 tp!54218)))

(assert (= (and start!75050 res!601183) b!885033))

(assert (= start!75050 b!885034))

(declare-fun m!825289 () Bool)

(assert (=> start!75050 m!825289))

(declare-fun m!825291 () Bool)

(assert (=> start!75050 m!825291))

(declare-fun m!825293 () Bool)

(assert (=> b!885033 m!825293))

(declare-fun m!825295 () Bool)

(assert (=> b!885033 m!825295))

(assert (=> b!885033 m!825293))

(declare-fun m!825297 () Bool)

(assert (=> b!885033 m!825297))

(declare-fun m!825299 () Bool)

(assert (=> b!885033 m!825299))

(declare-fun m!825301 () Bool)

(assert (=> b!885033 m!825301))

(assert (=> b!885033 m!825297))

(declare-fun m!825303 () Bool)

(assert (=> b!885033 m!825303))

(declare-fun m!825305 () Bool)

(assert (=> b!885033 m!825305))

(push 1)

(assert (not start!75050))

(assert (not b!885033))

(assert (not b!885034))

(assert tp_is_empty!17747)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!109309 () Bool)

(declare-fun res!601192 () Bool)

(declare-fun e!492567 () Bool)

(assert (=> d!109309 (=> res!601192 e!492567)))

(assert (=> d!109309 (= res!601192 (or (is-Nil!17637 (toList!5321 lm!210)) (is-Nil!17637 (t!24917 (toList!5321 lm!210)))))))

(assert (=> d!109309 (= (isStrictlySorted!467 (toList!5321 lm!210)) e!492567)))

(declare-fun b!885043 () Bool)

(declare-fun e!492569 () Bool)

(assert (=> b!885043 (= e!492567 e!492569)))

(declare-fun res!601194 () Bool)

(assert (=> b!885043 (=> (not res!601194) (not e!492569))))

(assert (=> b!885043 (= res!601194 (bvslt (_1!5932 (h!18767 (toList!5321 lm!210))) (_1!5932 (h!18767 (t!24917 (toList!5321 lm!210))))))))

(declare-fun b!885045 () Bool)

(assert (=> b!885045 (= e!492569 (isStrictlySorted!467 (t!24917 (toList!5321 lm!210))))))

(assert (= (and d!109309 (not res!601192)) b!885043))

(assert (= (and b!885043 res!601194) b!885045))

(declare-fun m!825307 () Bool)

(assert (=> b!885045 m!825307))

(assert (=> start!75050 d!109309))

(declare-fun d!109313 () Bool)

(assert (=> d!109313 (= (inv!29371 lm!210) (isStrictlySorted!467 (toList!5321 lm!210)))))

(declare-fun bs!24807 () Bool)

(assert (= bs!24807 d!109313))

(assert (=> bs!24807 m!825289))

(assert (=> start!75050 d!109313))

(declare-fun d!109317 () Bool)

(declare-fun e!492589 () Bool)

(assert (=> d!109317 e!492589))

(declare-fun res!601205 () Bool)

(assert (=> d!109317 (=> (not res!601205) (not e!492589))))

(declare-fun lt!400910 () ListLongMap!10611)

(declare-fun contains!4285 (ListLongMap!10611 (_ BitVec 64)) Bool)

(assert (=> d!109317 (= res!601205 (contains!4285 lt!400910 (_1!5932 lt!400897)))))

(declare-fun lt!400912 () List!17640)

(assert (=> d!109317 (= lt!400910 (ListLongMap!10612 lt!400912))))

(declare-fun lt!400911 () Unit!30220)

(declare-fun lt!400913 () Unit!30220)

(assert (=> d!109317 (= lt!400911 lt!400913)))

(declare-datatypes ((Option!435 0))(
  ( (Some!434 (v!11393 B!1236)) (None!433) )
))
(declare-fun getValueByKey!429 (List!17640 (_ BitVec 64)) Option!435)

(assert (=> d!109317 (= (getValueByKey!429 lt!400912 (_1!5932 lt!400897)) (Some!434 (_2!5932 lt!400897)))))

(declare-fun lemmaContainsTupThenGetReturnValue!243 (List!17640 (_ BitVec 64) B!1236) Unit!30220)

(assert (=> d!109317 (= lt!400913 (lemmaContainsTupThenGetReturnValue!243 lt!400912 (_1!5932 lt!400897) (_2!5932 lt!400897)))))

(assert (=> d!109317 (= lt!400912 (insertStrictlySorted!284 (toList!5321 (+!2583 lm!210 (tuple2!11843 a!500 b1!76))) (_1!5932 lt!400897) (_2!5932 lt!400897)))))

(assert (=> d!109317 (= (+!2583 (+!2583 lm!210 (tuple2!11843 a!500 b1!76)) lt!400897) lt!400910)))

(declare-fun b!885083 () Bool)

(declare-fun res!601204 () Bool)

(assert (=> b!885083 (=> (not res!601204) (not e!492589))))

(assert (=> b!885083 (= res!601204 (= (getValueByKey!429 (toList!5321 lt!400910) (_1!5932 lt!400897)) (Some!434 (_2!5932 lt!400897))))))

(declare-fun b!885084 () Bool)

(declare-fun contains!4287 (List!17640 tuple2!11842) Bool)

(assert (=> b!885084 (= e!492589 (contains!4287 (toList!5321 lt!400910) lt!400897))))

(assert (= (and d!109317 res!601205) b!885083))

(assert (= (and b!885083 res!601204) b!885084))

(declare-fun m!825311 () Bool)

(assert (=> d!109317 m!825311))

(declare-fun m!825313 () Bool)

(assert (=> d!109317 m!825313))

(declare-fun m!825315 () Bool)

(assert (=> d!109317 m!825315))

(declare-fun m!825317 () Bool)

(assert (=> d!109317 m!825317))

(declare-fun m!825319 () Bool)

(assert (=> b!885083 m!825319))

(declare-fun m!825321 () Bool)

(assert (=> b!885084 m!825321))

(assert (=> b!885033 d!109317))

(declare-fun b!885143 () Bool)

(declare-fun res!601228 () Bool)

(declare-fun e!492622 () Bool)

(assert (=> b!885143 (=> (not res!601228) (not e!492622))))

(declare-fun lt!400938 () List!17640)

(declare-fun containsKey!406 (List!17640 (_ BitVec 64)) Bool)

(assert (=> b!885143 (= res!601228 (containsKey!406 lt!400938 a!500))))

(declare-fun b!885144 () Bool)

(declare-fun e!492619 () List!17640)

(declare-fun call!39049 () List!17640)

(assert (=> b!885144 (= e!492619 call!39049)))

(declare-fun b!885145 () Bool)

(declare-fun e!492621 () List!17640)

(declare-fun call!39048 () List!17640)

(assert (=> b!885145 (= e!492621 call!39048)))

(declare-fun c!93218 () Bool)

(declare-fun b!885146 () Bool)

(declare-fun c!93221 () Bool)

(declare-fun e!492620 () List!17640)

(assert (=> b!885146 (= e!492620 (ite c!93218 (t!24917 (toList!5321 lm!210)) (ite c!93221 (Cons!17636 (h!18767 (toList!5321 lm!210)) (t!24917 (toList!5321 lm!210))) Nil!17637)))))

(declare-fun c!93219 () Bool)

(declare-fun bm!39044 () Bool)

(declare-fun $colon$colon!541 (List!17640 tuple2!11842) List!17640)

(assert (=> bm!39044 (= call!39048 ($colon$colon!541 e!492620 (ite c!93219 (h!18767 (toList!5321 lm!210)) (tuple2!11843 a!500 b2!54))))))

(declare-fun c!93220 () Bool)

(assert (=> bm!39044 (= c!93220 c!93219)))

(declare-fun b!885147 () Bool)

(assert (=> b!885147 (= e!492622 (contains!4287 lt!400938 (tuple2!11843 a!500 b2!54)))))

(declare-fun b!885148 () Bool)

(declare-fun e!492623 () List!17640)

(assert (=> b!885148 (= e!492621 e!492623)))

(assert (=> b!885148 (= c!93218 (and (is-Cons!17636 (toList!5321 lm!210)) (= (_1!5932 (h!18767 (toList!5321 lm!210))) a!500)))))

(declare-fun b!885149 () Bool)

(assert (=> b!885149 (= c!93221 (and (is-Cons!17636 (toList!5321 lm!210)) (bvsgt (_1!5932 (h!18767 (toList!5321 lm!210))) a!500)))))

(assert (=> b!885149 (= e!492623 e!492619)))

(declare-fun b!885150 () Bool)

(assert (=> b!885150 (= e!492620 (insertStrictlySorted!284 (t!24917 (toList!5321 lm!210)) a!500 b2!54))))

(declare-fun b!885151 () Bool)

(assert (=> b!885151 (= e!492619 call!39049)))

(declare-fun b!885152 () Bool)

(declare-fun call!39047 () List!17640)

(assert (=> b!885152 (= e!492623 call!39047)))

(declare-fun bm!39045 () Bool)

(assert (=> bm!39045 (= call!39049 call!39047)))

(declare-fun bm!39046 () Bool)

(assert (=> bm!39046 (= call!39047 call!39048)))

(declare-fun d!109321 () Bool)

(assert (=> d!109321 e!492622))

(declare-fun res!601229 () Bool)

(assert (=> d!109321 (=> (not res!601229) (not e!492622))))

(assert (=> d!109321 (= res!601229 (isStrictlySorted!467 lt!400938))))

(assert (=> d!109321 (= lt!400938 e!492621)))

(assert (=> d!109321 (= c!93219 (and (is-Cons!17636 (toList!5321 lm!210)) (bvslt (_1!5932 (h!18767 (toList!5321 lm!210))) a!500)))))

(assert (=> d!109321 (isStrictlySorted!467 (toList!5321 lm!210))))

(assert (=> d!109321 (= (insertStrictlySorted!284 (toList!5321 lm!210) a!500 b2!54) lt!400938)))

(assert (= (and d!109321 c!93219) b!885145))

(assert (= (and d!109321 (not c!93219)) b!885148))

(assert (= (and b!885148 c!93218) b!885152))

(assert (= (and b!885148 (not c!93218)) b!885149))

(assert (= (and b!885149 c!93221) b!885144))

(assert (= (and b!885149 (not c!93221)) b!885151))

(assert (= (or b!885144 b!885151) bm!39045))

(assert (= (or b!885152 bm!39045) bm!39046))

(assert (= (or b!885145 bm!39046) bm!39044))

(assert (= (and bm!39044 c!93220) b!885150))

(assert (= (and bm!39044 (not c!93220)) b!885146))

(assert (= (and d!109321 res!601229) b!885143))

(assert (= (and b!885143 res!601228) b!885147))

(declare-fun m!825355 () Bool)

(assert (=> bm!39044 m!825355))

(declare-fun m!825357 () Bool)

(assert (=> b!885150 m!825357))

(declare-fun m!825359 () Bool)

(assert (=> b!885143 m!825359))

(declare-fun m!825363 () Bool)

(assert (=> b!885147 m!825363))

(declare-fun m!825367 () Bool)

(assert (=> d!109321 m!825367))

(assert (=> d!109321 m!825289))

(assert (=> b!885033 d!109321))

(declare-fun d!109329 () Bool)

(declare-fun e!492625 () Bool)

(assert (=> d!109329 e!492625))

(declare-fun res!601233 () Bool)

(assert (=> d!109329 (=> (not res!601233) (not e!492625))))

(declare-fun lt!400945 () ListLongMap!10611)

(assert (=> d!109329 (= res!601233 (contains!4285 lt!400945 (_1!5932 lt!400897)))))

(declare-fun lt!400947 () List!17640)

(assert (=> d!109329 (= lt!400945 (ListLongMap!10612 lt!400947))))

(declare-fun lt!400946 () Unit!30220)

(declare-fun lt!400948 () Unit!30220)

(assert (=> d!109329 (= lt!400946 lt!400948)))

(assert (=> d!109329 (= (getValueByKey!429 lt!400947 (_1!5932 lt!400897)) (Some!434 (_2!5932 lt!400897)))))

(assert (=> d!109329 (= lt!400948 (lemmaContainsTupThenGetReturnValue!243 lt!400947 (_1!5932 lt!400897) (_2!5932 lt!400897)))))

(assert (=> d!109329 (= lt!400947 (insertStrictlySorted!284 (toList!5321 lm!210) (_1!5932 lt!400897) (_2!5932 lt!400897)))))

(assert (=> d!109329 (= (+!2583 lm!210 lt!400897) lt!400945)))

(declare-fun b!885155 () Bool)

(declare-fun res!601232 () Bool)

(assert (=> b!885155 (=> (not res!601232) (not e!492625))))

(assert (=> b!885155 (= res!601232 (= (getValueByKey!429 (toList!5321 lt!400945) (_1!5932 lt!400897)) (Some!434 (_2!5932 lt!400897))))))

(declare-fun b!885156 () Bool)

(assert (=> b!885156 (= e!492625 (contains!4287 (toList!5321 lt!400945) lt!400897))))

(assert (= (and d!109329 res!601233) b!885155))

(assert (= (and b!885155 res!601232) b!885156))

(declare-fun m!825377 () Bool)

(assert (=> d!109329 m!825377))

(declare-fun m!825379 () Bool)

(assert (=> d!109329 m!825379))

(declare-fun m!825381 () Bool)

(assert (=> d!109329 m!825381))

(declare-fun m!825383 () Bool)

(assert (=> d!109329 m!825383))

(declare-fun m!825385 () Bool)

(assert (=> b!885155 m!825385))

(declare-fun m!825387 () Bool)

(assert (=> b!885156 m!825387))

(assert (=> b!885033 d!109329))

(declare-fun d!109333 () Bool)

(declare-fun e!492626 () Bool)

(assert (=> d!109333 e!492626))

(declare-fun res!601235 () Bool)

(assert (=> d!109333 (=> (not res!601235) (not e!492626))))

(declare-fun lt!400949 () ListLongMap!10611)

(assert (=> d!109333 (= res!601235 (contains!4285 lt!400949 (_1!5932 (tuple2!11843 a!500 b1!76))))))

(declare-fun lt!400951 () List!17640)

(assert (=> d!109333 (= lt!400949 (ListLongMap!10612 lt!400951))))

(declare-fun lt!400950 () Unit!30220)

(declare-fun lt!400952 () Unit!30220)

(assert (=> d!109333 (= lt!400950 lt!400952)))

(assert (=> d!109333 (= (getValueByKey!429 lt!400951 (_1!5932 (tuple2!11843 a!500 b1!76))) (Some!434 (_2!5932 (tuple2!11843 a!500 b1!76))))))

(assert (=> d!109333 (= lt!400952 (lemmaContainsTupThenGetReturnValue!243 lt!400951 (_1!5932 (tuple2!11843 a!500 b1!76)) (_2!5932 (tuple2!11843 a!500 b1!76))))))

(assert (=> d!109333 (= lt!400951 (insertStrictlySorted!284 (toList!5321 lm!210) (_1!5932 (tuple2!11843 a!500 b1!76)) (_2!5932 (tuple2!11843 a!500 b1!76))))))

(assert (=> d!109333 (= (+!2583 lm!210 (tuple2!11843 a!500 b1!76)) lt!400949)))

(declare-fun b!885157 () Bool)

(declare-fun res!601234 () Bool)

(assert (=> b!885157 (=> (not res!601234) (not e!492626))))

(assert (=> b!885157 (= res!601234 (= (getValueByKey!429 (toList!5321 lt!400949) (_1!5932 (tuple2!11843 a!500 b1!76))) (Some!434 (_2!5932 (tuple2!11843 a!500 b1!76)))))))

(declare-fun b!885158 () Bool)

(assert (=> b!885158 (= e!492626 (contains!4287 (toList!5321 lt!400949) (tuple2!11843 a!500 b1!76)))))

(assert (= (and d!109333 res!601235) b!885157))

(assert (= (and b!885157 res!601234) b!885158))

(declare-fun m!825389 () Bool)

(assert (=> d!109333 m!825389))

(declare-fun m!825391 () Bool)

(assert (=> d!109333 m!825391))

(declare-fun m!825393 () Bool)

(assert (=> d!109333 m!825393))

(declare-fun m!825397 () Bool)

(assert (=> d!109333 m!825397))

(declare-fun m!825399 () Bool)

(assert (=> b!885157 m!825399))

(declare-fun m!825401 () Bool)

(assert (=> b!885158 m!825401))

(assert (=> b!885033 d!109333))

(declare-fun d!109337 () Bool)

(assert (=> d!109337 (= (insertStrictlySorted!284 (insertStrictlySorted!284 (toList!5321 lm!210) a!500 b1!76) a!500 b2!54) (insertStrictlySorted!284 (toList!5321 lm!210) a!500 b2!54))))

(declare-fun lt!400970 () Unit!30220)

(declare-fun choose!1446 (List!17640 (_ BitVec 64) B!1236 B!1236) Unit!30220)

(assert (=> d!109337 (= lt!400970 (choose!1446 (toList!5321 lm!210) a!500 b1!76 b2!54))))

(assert (=> d!109337 (isStrictlySorted!467 (toList!5321 lm!210))))

(assert (=> d!109337 (= (lemmaInsertStrictlySortedErasesIfSameKey!3 (toList!5321 lm!210) a!500 b1!76 b2!54) lt!400970)))

(declare-fun bs!24811 () Bool)

(assert (= bs!24811 d!109337))

(assert (=> bs!24811 m!825289))

(declare-fun m!825457 () Bool)

(assert (=> bs!24811 m!825457))

(assert (=> bs!24811 m!825305))

(assert (=> bs!24811 m!825293))

(assert (=> bs!24811 m!825295))

(assert (=> bs!24811 m!825293))

(assert (=> b!885033 d!109337))

(declare-fun b!885195 () Bool)

(declare-fun res!601248 () Bool)

(declare-fun e!492648 () Bool)

(assert (=> b!885195 (=> (not res!601248) (not e!492648))))

(declare-fun lt!400975 () List!17640)

(assert (=> b!885195 (= res!601248 (containsKey!406 lt!400975 a!500))))

(declare-fun b!885196 () Bool)

(declare-fun e!492645 () List!17640)

(declare-fun call!39061 () List!17640)

(assert (=> b!885196 (= e!492645 call!39061)))

(declare-fun b!885197 () Bool)

(declare-fun e!492647 () List!17640)

(declare-fun call!39060 () List!17640)

(assert (=> b!885197 (= e!492647 call!39060)))

(declare-fun c!93237 () Bool)

(declare-fun b!885198 () Bool)

(declare-fun e!492646 () List!17640)

(declare-fun c!93234 () Bool)

(assert (=> b!885198 (= e!492646 (ite c!93234 (t!24917 (toList!5321 lm!210)) (ite c!93237 (Cons!17636 (h!18767 (toList!5321 lm!210)) (t!24917 (toList!5321 lm!210))) Nil!17637)))))

(declare-fun c!93235 () Bool)

(declare-fun bm!39056 () Bool)

(assert (=> bm!39056 (= call!39060 ($colon$colon!541 e!492646 (ite c!93235 (h!18767 (toList!5321 lm!210)) (tuple2!11843 a!500 b1!76))))))

(declare-fun c!93236 () Bool)

(assert (=> bm!39056 (= c!93236 c!93235)))

(declare-fun b!885199 () Bool)

(assert (=> b!885199 (= e!492648 (contains!4287 lt!400975 (tuple2!11843 a!500 b1!76)))))

(declare-fun b!885200 () Bool)

(declare-fun e!492649 () List!17640)

(assert (=> b!885200 (= e!492647 e!492649)))

(assert (=> b!885200 (= c!93234 (and (is-Cons!17636 (toList!5321 lm!210)) (= (_1!5932 (h!18767 (toList!5321 lm!210))) a!500)))))

(declare-fun b!885201 () Bool)

(assert (=> b!885201 (= c!93237 (and (is-Cons!17636 (toList!5321 lm!210)) (bvsgt (_1!5932 (h!18767 (toList!5321 lm!210))) a!500)))))

(assert (=> b!885201 (= e!492649 e!492645)))

(declare-fun b!885202 () Bool)

(assert (=> b!885202 (= e!492646 (insertStrictlySorted!284 (t!24917 (toList!5321 lm!210)) a!500 b1!76))))

(declare-fun b!885203 () Bool)

(assert (=> b!885203 (= e!492645 call!39061)))

(declare-fun b!885204 () Bool)

(declare-fun call!39059 () List!17640)

(assert (=> b!885204 (= e!492649 call!39059)))

(declare-fun bm!39057 () Bool)

(assert (=> bm!39057 (= call!39061 call!39059)))

(declare-fun bm!39058 () Bool)

(assert (=> bm!39058 (= call!39059 call!39060)))

(declare-fun d!109351 () Bool)

(assert (=> d!109351 e!492648))

(declare-fun res!601249 () Bool)

(assert (=> d!109351 (=> (not res!601249) (not e!492648))))

(assert (=> d!109351 (= res!601249 (isStrictlySorted!467 lt!400975))))

(assert (=> d!109351 (= lt!400975 e!492647)))

(assert (=> d!109351 (= c!93235 (and (is-Cons!17636 (toList!5321 lm!210)) (bvslt (_1!5932 (h!18767 (toList!5321 lm!210))) a!500)))))

(assert (=> d!109351 (isStrictlySorted!467 (toList!5321 lm!210))))

(assert (=> d!109351 (= (insertStrictlySorted!284 (toList!5321 lm!210) a!500 b1!76) lt!400975)))

(assert (= (and d!109351 c!93235) b!885197))

(assert (= (and d!109351 (not c!93235)) b!885200))

(assert (= (and b!885200 c!93234) b!885204))

(assert (= (and b!885200 (not c!93234)) b!885201))

(assert (= (and b!885201 c!93237) b!885196))

(assert (= (and b!885201 (not c!93237)) b!885203))

(assert (= (or b!885196 b!885203) bm!39057))

(assert (= (or b!885204 bm!39057) bm!39058))

(assert (= (or b!885197 bm!39058) bm!39056))

(assert (= (and bm!39056 c!93236) b!885202))

(assert (= (and bm!39056 (not c!93236)) b!885198))

(assert (= (and d!109351 res!601249) b!885195))

(assert (= (and b!885195 res!601248) b!885199))

(declare-fun m!825475 () Bool)

(assert (=> bm!39056 m!825475))

(declare-fun m!825477 () Bool)

(assert (=> b!885202 m!825477))

(declare-fun m!825479 () Bool)

(assert (=> b!885195 m!825479))

(declare-fun m!825481 () Bool)

(assert (=> b!885199 m!825481))

(declare-fun m!825483 () Bool)

(assert (=> d!109351 m!825483))

(assert (=> d!109351 m!825289))

(assert (=> b!885033 d!109351))

(declare-fun b!885209 () Bool)

(declare-fun res!601254 () Bool)

(declare-fun e!492656 () Bool)

(assert (=> b!885209 (=> (not res!601254) (not e!492656))))

(declare-fun lt!400980 () List!17640)

(assert (=> b!885209 (= res!601254 (containsKey!406 lt!400980 a!500))))

(declare-fun b!885210 () Bool)

(declare-fun e!492653 () List!17640)

(declare-fun call!39064 () List!17640)

(assert (=> b!885210 (= e!492653 call!39064)))

(declare-fun b!885211 () Bool)

(declare-fun e!492655 () List!17640)

(declare-fun call!39063 () List!17640)

(assert (=> b!885211 (= e!492655 call!39063)))

(declare-fun e!492654 () List!17640)

(declare-fun b!885212 () Bool)

(declare-fun c!93241 () Bool)

(declare-fun c!93238 () Bool)

(assert (=> b!885212 (= e!492654 (ite c!93238 (t!24917 (insertStrictlySorted!284 (toList!5321 lm!210) a!500 b1!76)) (ite c!93241 (Cons!17636 (h!18767 (insertStrictlySorted!284 (toList!5321 lm!210) a!500 b1!76)) (t!24917 (insertStrictlySorted!284 (toList!5321 lm!210) a!500 b1!76))) Nil!17637)))))

(declare-fun bm!39059 () Bool)

(declare-fun c!93239 () Bool)

(assert (=> bm!39059 (= call!39063 ($colon$colon!541 e!492654 (ite c!93239 (h!18767 (insertStrictlySorted!284 (toList!5321 lm!210) a!500 b1!76)) (tuple2!11843 a!500 b2!54))))))

(declare-fun c!93240 () Bool)

(assert (=> bm!39059 (= c!93240 c!93239)))

(declare-fun b!885213 () Bool)

(assert (=> b!885213 (= e!492656 (contains!4287 lt!400980 (tuple2!11843 a!500 b2!54)))))

(declare-fun b!885214 () Bool)

(declare-fun e!492657 () List!17640)

(assert (=> b!885214 (= e!492655 e!492657)))

(assert (=> b!885214 (= c!93238 (and (is-Cons!17636 (insertStrictlySorted!284 (toList!5321 lm!210) a!500 b1!76)) (= (_1!5932 (h!18767 (insertStrictlySorted!284 (toList!5321 lm!210) a!500 b1!76))) a!500)))))

(declare-fun b!885215 () Bool)

(assert (=> b!885215 (= c!93241 (and (is-Cons!17636 (insertStrictlySorted!284 (toList!5321 lm!210) a!500 b1!76)) (bvsgt (_1!5932 (h!18767 (insertStrictlySorted!284 (toList!5321 lm!210) a!500 b1!76))) a!500)))))

(assert (=> b!885215 (= e!492657 e!492653)))

(declare-fun b!885216 () Bool)

(assert (=> b!885216 (= e!492654 (insertStrictlySorted!284 (t!24917 (insertStrictlySorted!284 (toList!5321 lm!210) a!500 b1!76)) a!500 b2!54))))

(declare-fun b!885217 () Bool)

(assert (=> b!885217 (= e!492653 call!39064)))

(declare-fun b!885218 () Bool)

(declare-fun call!39062 () List!17640)

(assert (=> b!885218 (= e!492657 call!39062)))

(declare-fun bm!39060 () Bool)

(assert (=> bm!39060 (= call!39064 call!39062)))

(declare-fun bm!39061 () Bool)

(assert (=> bm!39061 (= call!39062 call!39063)))

(declare-fun d!109355 () Bool)

(assert (=> d!109355 e!492656))

(declare-fun res!601255 () Bool)

(assert (=> d!109355 (=> (not res!601255) (not e!492656))))

(assert (=> d!109355 (= res!601255 (isStrictlySorted!467 lt!400980))))

(assert (=> d!109355 (= lt!400980 e!492655)))

(assert (=> d!109355 (= c!93239 (and (is-Cons!17636 (insertStrictlySorted!284 (toList!5321 lm!210) a!500 b1!76)) (bvslt (_1!5932 (h!18767 (insertStrictlySorted!284 (toList!5321 lm!210) a!500 b1!76))) a!500)))))

(assert (=> d!109355 (isStrictlySorted!467 (insertStrictlySorted!284 (toList!5321 lm!210) a!500 b1!76))))

(assert (=> d!109355 (= (insertStrictlySorted!284 (insertStrictlySorted!284 (toList!5321 lm!210) a!500 b1!76) a!500 b2!54) lt!400980)))

(assert (= (and d!109355 c!93239) b!885211))

(assert (= (and d!109355 (not c!93239)) b!885214))

(assert (= (and b!885214 c!93238) b!885218))

