; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7510 () Bool)

(assert start!7510)

(declare-fun e!30871 () Bool)

(declare-datatypes ((B!926 0))(
  ( (B!927 (val!1083 Int)) )
))
(declare-datatypes ((tuple2!1748 0))(
  ( (tuple2!1749 (_1!885 (_ BitVec 64)) (_2!885 B!926)) )
))
(declare-fun lt!20555 () tuple2!1748)

(declare-fun b!48100 () Bool)

(declare-fun lt!20553 () (Set tuple2!1748))

(declare-datatypes ((List!1280 0))(
  ( (Nil!1277) (Cons!1276 (h!1856 tuple2!1748) (t!4308 List!1280)) )
))
(declare-datatypes ((ListLongMap!1241 0))(
  ( (ListLongMap!1242 (toList!636 List!1280)) )
))
(declare-fun lm!267 () ListLongMap!1241)

(declare-fun content!46 (List!1280) (Set tuple2!1748))

(declare-fun +!73 (ListLongMap!1241 tuple2!1748) ListLongMap!1241)

(assert (=> b!48100 (= e!30871 (not (= lt!20553 (content!46 (toList!636 (+!73 lm!267 lt!20555))))))))

(declare-fun key!657 () (_ BitVec 64))

(declare-fun value!242 () B!926)

(declare-fun insertStrictlySorted!31 (List!1280 (_ BitVec 64) B!926) List!1280)

(assert (=> b!48100 (= lt!20553 (content!46 (insertStrictlySorted!31 (toList!636 lm!267) key!657 value!242)))))

(assert (=> b!48100 (= lt!20553 (set.union (content!46 (toList!636 lm!267)) (set.insert lt!20555 (as set.empty (Set tuple2!1748)))))))

(assert (=> b!48100 (= lt!20555 (tuple2!1749 key!657 value!242))))

(declare-datatypes ((Unit!1355 0))(
  ( (Unit!1356) )
))
(declare-fun lt!20554 () Unit!1355)

(declare-fun lemmaInsertStrictlySortedNotContainedContent!1 (List!1280 (_ BitVec 64) B!926) Unit!1355)

(assert (=> b!48100 (= lt!20554 (lemmaInsertStrictlySortedNotContainedContent!1 (toList!636 lm!267) key!657 value!242))))

(declare-fun b!48098 () Bool)

(declare-fun res!27941 () Bool)

(assert (=> b!48098 (=> (not res!27941) (not e!30871))))

(declare-fun isStrictlySorted!253 (List!1280) Bool)

(assert (=> b!48098 (= res!27941 (isStrictlySorted!253 (toList!636 lm!267)))))

(declare-fun b!48099 () Bool)

(declare-fun res!27939 () Bool)

(assert (=> b!48099 (=> (not res!27939) (not e!30871))))

(declare-fun containsKey!102 (List!1280 (_ BitVec 64)) Bool)

(assert (=> b!48099 (= res!27939 (not (containsKey!102 (toList!636 lm!267) key!657)))))

(declare-fun b!48101 () Bool)

(declare-fun e!30870 () Bool)

(declare-fun tp!6347 () Bool)

(assert (=> b!48101 (= e!30870 tp!6347)))

(declare-fun res!27940 () Bool)

(assert (=> start!7510 (=> (not res!27940) (not e!30871))))

(declare-fun contains!600 (ListLongMap!1241 (_ BitVec 64)) Bool)

(assert (=> start!7510 (= res!27940 (not (contains!600 lm!267 key!657)))))

(assert (=> start!7510 e!30871))

(declare-fun inv!2236 (ListLongMap!1241) Bool)

(assert (=> start!7510 (and (inv!2236 lm!267) e!30870)))

(assert (=> start!7510 true))

(declare-fun tp_is_empty!2077 () Bool)

(assert (=> start!7510 tp_is_empty!2077))

(assert (= (and start!7510 res!27940) b!48098))

(assert (= (and b!48098 res!27941) b!48099))

(assert (= (and b!48099 res!27939) b!48100))

(assert (= start!7510 b!48101))

(declare-fun m!42039 () Bool)

(assert (=> b!48100 m!42039))

(declare-fun m!42041 () Bool)

(assert (=> b!48100 m!42041))

(declare-fun m!42043 () Bool)

(assert (=> b!48100 m!42043))

(declare-fun m!42045 () Bool)

(assert (=> b!48100 m!42045))

(assert (=> b!48100 m!42043))

(declare-fun m!42047 () Bool)

(assert (=> b!48100 m!42047))

(declare-fun m!42049 () Bool)

(assert (=> b!48100 m!42049))

(declare-fun m!42051 () Bool)

(assert (=> b!48100 m!42051))

(declare-fun m!42053 () Bool)

(assert (=> b!48098 m!42053))

(declare-fun m!42055 () Bool)

(assert (=> b!48099 m!42055))

(declare-fun m!42057 () Bool)

(assert (=> start!7510 m!42057))

(declare-fun m!42059 () Bool)

(assert (=> start!7510 m!42059))

(push 1)

(assert (not start!7510))

(assert (not b!48100))

(assert (not b!48099))

(assert (not b!48098))

(assert (not b!48101))

(assert tp_is_empty!2077)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9541 () Bool)

(declare-fun res!27964 () Bool)

(declare-fun e!30888 () Bool)

(assert (=> d!9541 (=> res!27964 e!30888)))

(assert (=> d!9541 (= res!27964 (and (is-Cons!1276 (toList!636 lm!267)) (= (_1!885 (h!1856 (toList!636 lm!267))) key!657)))))

(assert (=> d!9541 (= (containsKey!102 (toList!636 lm!267) key!657) e!30888)))

(declare-fun b!48130 () Bool)

(declare-fun e!30889 () Bool)

(assert (=> b!48130 (= e!30888 e!30889)))

(declare-fun res!27965 () Bool)

(assert (=> b!48130 (=> (not res!27965) (not e!30889))))

(assert (=> b!48130 (= res!27965 (and (or (not (is-Cons!1276 (toList!636 lm!267))) (bvsle (_1!885 (h!1856 (toList!636 lm!267))) key!657)) (is-Cons!1276 (toList!636 lm!267)) (bvslt (_1!885 (h!1856 (toList!636 lm!267))) key!657)))))

(declare-fun b!48131 () Bool)

(assert (=> b!48131 (= e!30889 (containsKey!102 (t!4308 (toList!636 lm!267)) key!657))))

(assert (= (and d!9541 (not res!27964)) b!48130))

(assert (= (and b!48130 res!27965) b!48131))

(declare-fun m!42105 () Bool)

(assert (=> b!48131 m!42105))

(assert (=> b!48099 d!9541))

(declare-fun d!9543 () Bool)

(declare-fun res!27974 () Bool)

(declare-fun e!30896 () Bool)

(assert (=> d!9543 (=> res!27974 e!30896)))

(assert (=> d!9543 (= res!27974 (or (is-Nil!1277 (toList!636 lm!267)) (is-Nil!1277 (t!4308 (toList!636 lm!267)))))))

(assert (=> d!9543 (= (isStrictlySorted!253 (toList!636 lm!267)) e!30896)))

(declare-fun b!48140 () Bool)

(declare-fun e!30897 () Bool)

(assert (=> b!48140 (= e!30896 e!30897)))

(declare-fun res!27975 () Bool)

(assert (=> b!48140 (=> (not res!27975) (not e!30897))))

(assert (=> b!48140 (= res!27975 (bvslt (_1!885 (h!1856 (toList!636 lm!267))) (_1!885 (h!1856 (t!4308 (toList!636 lm!267))))))))

(declare-fun b!48141 () Bool)

(assert (=> b!48141 (= e!30897 (isStrictlySorted!253 (t!4308 (toList!636 lm!267))))))

(assert (= (and d!9543 (not res!27974)) b!48140))

(assert (= (and b!48140 res!27975) b!48141))

(declare-fun m!42107 () Bool)

(assert (=> b!48141 m!42107))

(assert (=> b!48098 d!9543))

(declare-fun d!9547 () Bool)

(declare-fun e!30904 () Bool)

(assert (=> d!9547 e!30904))

(declare-fun res!27980 () Bool)

(assert (=> d!9547 (=> res!27980 e!30904)))

(declare-fun lt!20602 () Bool)

(assert (=> d!9547 (= res!27980 (not lt!20602))))

(declare-fun lt!20603 () Bool)

(assert (=> d!9547 (= lt!20602 lt!20603)))

(declare-fun lt!20601 () Unit!1355)

(declare-fun e!30903 () Unit!1355)

(assert (=> d!9547 (= lt!20601 e!30903)))

(declare-fun c!6462 () Bool)

(assert (=> d!9547 (= c!6462 lt!20603)))

(assert (=> d!9547 (= lt!20603 (containsKey!102 (toList!636 lm!267) key!657))))

(assert (=> d!9547 (= (contains!600 lm!267 key!657) lt!20602)))

(declare-fun b!48150 () Bool)

(declare-fun lt!20600 () Unit!1355)

(assert (=> b!48150 (= e!30903 lt!20600)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!72 (List!1280 (_ BitVec 64)) Unit!1355)

(assert (=> b!48150 (= lt!20600 (lemmaContainsKeyImpliesGetValueByKeyDefined!72 (toList!636 lm!267) key!657))))

(declare-datatypes ((Option!123 0))(
  ( (Some!122 (v!2139 B!926)) (None!121) )
))
(declare-fun isDefined!73 (Option!123) Bool)

(declare-fun getValueByKey!117 (List!1280 (_ BitVec 64)) Option!123)

(assert (=> b!48150 (isDefined!73 (getValueByKey!117 (toList!636 lm!267) key!657))))

(declare-fun b!48151 () Bool)

(declare-fun Unit!1361 () Unit!1355)

(assert (=> b!48151 (= e!30903 Unit!1361)))

(declare-fun b!48152 () Bool)

(assert (=> b!48152 (= e!30904 (isDefined!73 (getValueByKey!117 (toList!636 lm!267) key!657)))))

(assert (= (and d!9547 c!6462) b!48150))

(assert (= (and d!9547 (not c!6462)) b!48151))

(assert (= (and d!9547 (not res!27980)) b!48152))

(assert (=> d!9547 m!42055))

(declare-fun m!42129 () Bool)

(assert (=> b!48150 m!42129))

(declare-fun m!42131 () Bool)

(assert (=> b!48150 m!42131))

(assert (=> b!48150 m!42131))

(declare-fun m!42133 () Bool)

(assert (=> b!48150 m!42133))

(assert (=> b!48152 m!42131))

(assert (=> b!48152 m!42131))

(assert (=> b!48152 m!42133))

(assert (=> start!7510 d!9547))

(declare-fun d!9555 () Bool)

(assert (=> d!9555 (= (inv!2236 lm!267) (isStrictlySorted!253 (toList!636 lm!267)))))

(declare-fun bs!2247 () Bool)

(assert (= bs!2247 d!9555))

(assert (=> bs!2247 m!42053))

(assert (=> start!7510 d!9555))

(declare-fun d!9557 () Bool)

(declare-fun c!6468 () Bool)

(assert (=> d!9557 (= c!6468 (is-Nil!1277 (toList!636 (+!73 lm!267 lt!20555))))))

(declare-fun e!30910 () (Set tuple2!1748))

(assert (=> d!9557 (= (content!46 (toList!636 (+!73 lm!267 lt!20555))) e!30910)))

(declare-fun b!48163 () Bool)

(assert (=> b!48163 (= e!30910 (as set.empty (Set tuple2!1748)))))

(declare-fun b!48164 () Bool)

(assert (=> b!48164 (= e!30910 (set.union (set.insert (h!1856 (toList!636 (+!73 lm!267 lt!20555))) (as set.empty (Set tuple2!1748))) (content!46 (t!4308 (toList!636 (+!73 lm!267 lt!20555))))))))

(assert (= (and d!9557 c!6468) b!48163))

(assert (= (and d!9557 (not c!6468)) b!48164))

(declare-fun m!42139 () Bool)

(assert (=> b!48164 m!42139))

(declare-fun m!42141 () Bool)

(assert (=> b!48164 m!42141))

(assert (=> b!48100 d!9557))

(declare-fun d!9561 () Bool)

(assert (=> d!9561 (= (set.union (content!46 (toList!636 lm!267)) (set.insert (tuple2!1749 key!657 value!242) (as set.empty (Set tuple2!1748)))) (content!46 (insertStrictlySorted!31 (toList!636 lm!267) key!657 value!242)))))

(declare-fun lt!20608 () Unit!1355)

(declare-fun choose!282 (List!1280 (_ BitVec 64) B!926) Unit!1355)

(assert (=> d!9561 (= lt!20608 (choose!282 (toList!636 lm!267) key!657 value!242))))

(assert (=> d!9561 (isStrictlySorted!253 (toList!636 lm!267))))

(assert (=> d!9561 (= (lemmaInsertStrictlySortedNotContainedContent!1 (toList!636 lm!267) key!657 value!242) lt!20608)))

(declare-fun bs!2248 () Bool)

(assert (= bs!2248 d!9561))

(assert (=> bs!2248 m!42043))

(declare-fun m!42143 () Bool)

(assert (=> bs!2248 m!42143))

(assert (=> bs!2248 m!42039))

(declare-fun m!42145 () Bool)

(assert (=> bs!2248 m!42145))

(assert (=> bs!2248 m!42043))

(assert (=> bs!2248 m!42045))

(assert (=> bs!2248 m!42053))

(assert (=> b!48100 d!9561))

(declare-fun bm!3767 () Bool)

(declare-fun call!3770 () List!1280)

(declare-fun call!3771 () List!1280)

(assert (=> bm!3767 (= call!3770 call!3771)))

(declare-fun b!48259 () Bool)

(declare-fun e!30963 () List!1280)

(declare-fun e!30961 () List!1280)

(assert (=> b!48259 (= e!30963 e!30961)))

(declare-fun c!6509 () Bool)

(assert (=> b!48259 (= c!6509 (and (is-Cons!1276 (toList!636 lm!267)) (= (_1!885 (h!1856 (toList!636 lm!267))) key!657)))))

(declare-fun b!48260 () Bool)

(declare-fun e!30962 () Bool)

(declare-fun lt!20615 () List!1280)

(declare-fun contains!604 (List!1280 tuple2!1748) Bool)

(assert (=> b!48260 (= e!30962 (contains!604 lt!20615 (tuple2!1749 key!657 value!242)))))

(declare-fun e!30964 () List!1280)

(declare-fun b!48261 () Bool)

(assert (=> b!48261 (= e!30964 (insertStrictlySorted!31 (t!4308 (toList!636 lm!267)) key!657 value!242))))

(declare-fun b!48262 () Bool)

(declare-fun res!28001 () Bool)

(assert (=> b!48262 (=> (not res!28001) (not e!30962))))

(assert (=> b!48262 (= res!28001 (containsKey!102 lt!20615 key!657))))

(declare-fun d!9563 () Bool)

(assert (=> d!9563 e!30962))

(declare-fun res!28002 () Bool)

(assert (=> d!9563 (=> (not res!28002) (not e!30962))))

(assert (=> d!9563 (= res!28002 (isStrictlySorted!253 lt!20615))))

(assert (=> d!9563 (= lt!20615 e!30963)))

(declare-fun c!6507 () Bool)

(assert (=> d!9563 (= c!6507 (and (is-Cons!1276 (toList!636 lm!267)) (bvslt (_1!885 (h!1856 (toList!636 lm!267))) key!657)))))

(assert (=> d!9563 (isStrictlySorted!253 (toList!636 lm!267))))

(assert (=> d!9563 (= (insertStrictlySorted!31 (toList!636 lm!267) key!657 value!242) lt!20615)))

(declare-fun b!48263 () Bool)

(declare-fun call!3772 () List!1280)

(assert (=> b!48263 (= e!30963 call!3772)))

(declare-fun b!48264 () Bool)

(declare-fun e!30960 () List!1280)

(assert (=> b!48264 (= e!30960 call!3770)))

(declare-fun bm!3768 () Bool)

(assert (=> bm!3768 (= call!3771 call!3772)))

(declare-fun b!48265 () Bool)

(assert (=> b!48265 (= e!30960 call!3770)))

(declare-fun b!48266 () Bool)

(declare-fun c!6506 () Bool)

(assert (=> b!48266 (= e!30964 (ite c!6509 (t!4308 (toList!636 lm!267)) (ite c!6506 (Cons!1276 (h!1856 (toList!636 lm!267)) (t!4308 (toList!636 lm!267))) Nil!1277)))))

(declare-fun bm!3769 () Bool)

(declare-fun $colon$colon!52 (List!1280 tuple2!1748) List!1280)

(assert (=> bm!3769 (= call!3772 ($colon$colon!52 e!30964 (ite c!6507 (h!1856 (toList!636 lm!267)) (tuple2!1749 key!657 value!242))))))

(declare-fun c!6508 () Bool)

(assert (=> bm!3769 (= c!6508 c!6507)))

(declare-fun b!48267 () Bool)

(assert (=> b!48267 (= c!6506 (and (is-Cons!1276 (toList!636 lm!267)) (bvsgt (_1!885 (h!1856 (toList!636 lm!267))) key!657)))))

(assert (=> b!48267 (= e!30961 e!30960)))

(declare-fun b!48268 () Bool)

(assert (=> b!48268 (= e!30961 call!3771)))

(assert (= (and d!9563 c!6507) b!48263))

(assert (= (and d!9563 (not c!6507)) b!48259))

(assert (= (and b!48259 c!6509) b!48268))

(assert (= (and b!48259 (not c!6509)) b!48267))

(assert (= (and b!48267 c!6506) b!48265))

(assert (= (and b!48267 (not c!6506)) b!48264))

(assert (= (or b!48265 b!48264) bm!3767))

(assert (= (or b!48268 bm!3767) bm!3768))

(assert (= (or b!48263 bm!3768) bm!3769))

(assert (= (and bm!3769 c!6508) b!48261))

(assert (= (and bm!3769 (not c!6508)) b!48266))

(assert (= (and d!9563 res!28002) b!48262))

(assert (= (and b!48262 res!28001) b!48260))

(declare-fun m!42181 () Bool)

(assert (=> bm!3769 m!42181))

(declare-fun m!42183 () Bool)

(assert (=> b!48262 m!42183))

(declare-fun m!42185 () Bool)

(assert (=> b!48260 m!42185))

(declare-fun m!42187 () Bool)

(assert (=> d!9563 m!42187))

(assert (=> d!9563 m!42053))

(declare-fun m!42189 () Bool)

(assert (=> b!48261 m!42189))

(assert (=> b!48100 d!9563))

(declare-fun d!9577 () Bool)

(declare-fun e!30984 () Bool)

(assert (=> d!9577 e!30984))

(declare-fun res!28023 () Bool)

(assert (=> d!9577 (=> (not res!28023) (not e!30984))))

(declare-fun lt!20645 () ListLongMap!1241)

(assert (=> d!9577 (= res!28023 (contains!600 lt!20645 (_1!885 lt!20555)))))

(declare-fun lt!20647 () List!1280)

(assert (=> d!9577 (= lt!20645 (ListLongMap!1242 lt!20647))))

(declare-fun lt!20644 () Unit!1355)

(declare-fun lt!20646 () Unit!1355)

(assert (=> d!9577 (= lt!20644 lt!20646)))

(assert (=> d!9577 (= (getValueByKey!117 lt!20647 (_1!885 lt!20555)) (Some!122 (_2!885 lt!20555)))))

(declare-fun lemmaContainsTupThenGetReturnValue!35 (List!1280 (_ BitVec 64) B!926) Unit!1355)

(assert (=> d!9577 (= lt!20646 (lemmaContainsTupThenGetReturnValue!35 lt!20647 (_1!885 lt!20555) (_2!885 lt!20555)))))

(assert (=> d!9577 (= lt!20647 (insertStrictlySorted!31 (toList!636 lm!267) (_1!885 lt!20555) (_2!885 lt!20555)))))

(assert (=> d!9577 (= (+!73 lm!267 lt!20555) lt!20645)))

(declare-fun b!48297 () Bool)

(declare-fun res!28024 () Bool)

(assert (=> b!48297 (=> (not res!28024) (not e!30984))))

(assert (=> b!48297 (= res!28024 (= (getValueByKey!117 (toList!636 lt!20645) (_1!885 lt!20555)) (Some!122 (_2!885 lt!20555))))))

(declare-fun b!48298 () Bool)

(assert (=> b!48298 (= e!30984 (contains!604 (toList!636 lt!20645) lt!20555))))

(assert (= (and d!9577 res!28023) b!48297))

(assert (= (and b!48297 res!28024) b!48298))

(declare-fun m!42213 () Bool)

(assert (=> d!9577 m!42213))

(declare-fun m!42215 () Bool)

(assert (=> d!9577 m!42215))

(declare-fun m!42217 () Bool)

(assert (=> d!9577 m!42217))

(declare-fun m!42219 () Bool)

(assert (=> d!9577 m!42219))

(declare-fun m!42221 () Bool)

(assert (=> b!48297 m!42221))

(declare-fun m!42223 () Bool)

(assert (=> b!48298 m!42223))

(assert (=> b!48100 d!9577))

(declare-fun d!9587 () Bool)

(declare-fun c!6515 () Bool)

(assert (=> d!9587 (= c!6515 (is-Nil!1277 (insertStrictlySorted!31 (toList!636 lm!267) key!657 value!242)))))

(declare-fun e!30987 () (Set tuple2!1748))

(assert (=> d!9587 (= (content!46 (insertStrictlySorted!31 (toList!636 lm!267) key!657 value!242)) e!30987)))

(declare-fun b!48302 () Bool)

(assert (=> b!48302 (= e!30987 (as set.empty (Set tuple2!1748)))))

(declare-fun b!48303 () Bool)

(assert (=> b!48303 (= e!30987 (set.union (set.insert (h!1856 (insertStrictlySorted!31 (toList!636 lm!267) key!657 value!242)) (as set.empty (Set tuple2!1748))) (content!46 (t!4308 (insertStrictlySorted!31 (toList!636 lm!267) key!657 value!242)))))))

(assert (= (and d!9587 c!6515) b!48302))

(assert (= (and d!9587 (not c!6515)) b!48303))

(declare-fun m!42225 () Bool)

(assert (=> b!48303 m!42225))

(declare-fun m!42229 () Bool)

(assert (=> b!48303 m!42229))

(assert (=> b!48100 d!9587))

(declare-fun d!9589 () Bool)

(declare-fun c!6516 () Bool)

(assert (=> d!9589 (= c!6516 (is-Nil!1277 (toList!636 lm!267)))))

(declare-fun e!30992 () (Set tuple2!1748))

(assert (=> d!9589 (= (content!46 (toList!636 lm!267)) e!30992)))

(declare-fun b!48308 () Bool)

(assert (=> b!48308 (= e!30992 (as set.empty (Set tuple2!1748)))))

(declare-fun b!48309 () Bool)

(assert (=> b!48309 (= e!30992 (set.union (set.insert (h!1856 (toList!636 lm!267)) (as set.empty (Set tuple2!1748))) (content!46 (t!4308 (toList!636 lm!267)))))))

(assert (= (and d!9589 c!6516) b!48308))

(assert (= (and d!9589 (not c!6516)) b!48309))

(declare-fun m!42235 () Bool)

(assert (=> b!48309 m!42235))

(declare-fun m!42237 () Bool)

(assert (=> b!48309 m!42237))

(assert (=> b!48100 d!9589))

(declare-fun b!48320 () Bool)

(declare-fun e!30999 () Bool)

(declare-fun tp!6356 () Bool)

(assert (=> b!48320 (= e!30999 (and tp_is_empty!2077 tp!6356))))

(assert (=> b!48101 (= tp!6347 e!30999)))

(assert (= (and b!48101 (is-Cons!1276 (toList!636 lm!267))) b!48320))

(push 1)

