; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7514 () Bool)

(assert start!7514)

(declare-fun res!27959 () Bool)

(declare-fun e!30882 () Bool)

(assert (=> start!7514 (=> (not res!27959) (not e!30882))))

(declare-datatypes ((B!930 0))(
  ( (B!931 (val!1085 Int)) )
))
(declare-datatypes ((tuple2!1752 0))(
  ( (tuple2!1753 (_1!887 (_ BitVec 64)) (_2!887 B!930)) )
))
(declare-datatypes ((List!1282 0))(
  ( (Nil!1279) (Cons!1278 (h!1858 tuple2!1752) (t!4310 List!1282)) )
))
(declare-datatypes ((ListLongMap!1245 0))(
  ( (ListLongMap!1246 (toList!638 List!1282)) )
))
(declare-fun lm!267 () ListLongMap!1245)

(declare-fun key!657 () (_ BitVec 64))

(declare-fun contains!602 (ListLongMap!1245 (_ BitVec 64)) Bool)

(assert (=> start!7514 (= res!27959 (not (contains!602 lm!267 key!657)))))

(assert (=> start!7514 e!30882))

(declare-fun e!30883 () Bool)

(declare-fun inv!2238 (ListLongMap!1245) Bool)

(assert (=> start!7514 (and (inv!2238 lm!267) e!30883)))

(assert (=> start!7514 true))

(declare-fun tp_is_empty!2081 () Bool)

(assert (=> start!7514 tp_is_empty!2081))

(declare-fun b!48123 () Bool)

(declare-fun res!27958 () Bool)

(assert (=> b!48123 (=> (not res!27958) (not e!30882))))

(declare-fun containsKey!104 (List!1282 (_ BitVec 64)) Bool)

(assert (=> b!48123 (= res!27958 (not (containsKey!104 (toList!638 lm!267) key!657)))))

(declare-fun b!48124 () Bool)

(declare-fun lt!20571 () (Set tuple2!1752))

(declare-fun lt!20572 () tuple2!1752)

(declare-fun content!48 (List!1282) (Set tuple2!1752))

(declare-fun +!75 (ListLongMap!1245 tuple2!1752) ListLongMap!1245)

(assert (=> b!48124 (= e!30882 (not (= lt!20571 (content!48 (toList!638 (+!75 lm!267 lt!20572))))))))

(declare-fun value!242 () B!930)

(declare-fun insertStrictlySorted!33 (List!1282 (_ BitVec 64) B!930) List!1282)

(assert (=> b!48124 (= lt!20571 (content!48 (insertStrictlySorted!33 (toList!638 lm!267) key!657 value!242)))))

(assert (=> b!48124 (= lt!20571 (union (content!48 (toList!638 lm!267)) (insert lt!20572 (as emptyset (Set tuple2!1752)))))))

(assert (=> b!48124 (= lt!20572 (tuple2!1753 key!657 value!242))))

(declare-datatypes ((Unit!1359 0))(
  ( (Unit!1360) )
))
(declare-fun lt!20573 () Unit!1359)

(declare-fun lemmaInsertStrictlySortedNotContainedContent!3 (List!1282 (_ BitVec 64) B!930) Unit!1359)

(assert (=> b!48124 (= lt!20573 (lemmaInsertStrictlySortedNotContainedContent!3 (toList!638 lm!267) key!657 value!242))))

(declare-fun b!48122 () Bool)

(declare-fun res!27957 () Bool)

(assert (=> b!48122 (=> (not res!27957) (not e!30882))))

(declare-fun isStrictlySorted!255 (List!1282) Bool)

(assert (=> b!48122 (= res!27957 (isStrictlySorted!255 (toList!638 lm!267)))))

(declare-fun b!48125 () Bool)

(declare-fun tp!6353 () Bool)

(assert (=> b!48125 (= e!30883 tp!6353)))

(assert (= (and start!7514 res!27959) b!48122))

(assert (= (and b!48122 res!27957) b!48123))

(assert (= (and b!48123 res!27958) b!48124))

(assert (= start!7514 b!48125))

(declare-fun m!42083 () Bool)

(assert (=> start!7514 m!42083))

(declare-fun m!42085 () Bool)

(assert (=> start!7514 m!42085))

(declare-fun m!42087 () Bool)

(assert (=> b!48123 m!42087))

(declare-fun m!42089 () Bool)

(assert (=> b!48124 m!42089))

(declare-fun m!42091 () Bool)

(assert (=> b!48124 m!42091))

(declare-fun m!42093 () Bool)

(assert (=> b!48124 m!42093))

(declare-fun m!42095 () Bool)

(assert (=> b!48124 m!42095))

(declare-fun m!42097 () Bool)

(assert (=> b!48124 m!42097))

(declare-fun m!42099 () Bool)

(assert (=> b!48124 m!42099))

(declare-fun m!42101 () Bool)

(assert (=> b!48124 m!42101))

(assert (=> b!48124 m!42093))

(declare-fun m!42103 () Bool)

(assert (=> b!48122 m!42103))

(push 1)

(assert (not b!48125))

(assert tp_is_empty!2081)

(assert (not b!48122))

(assert (not b!48124))

(assert (not b!48123))

(assert (not start!7514))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9545 () Bool)

(assert (=> d!9545 (= (union (content!48 (toList!638 lm!267)) (insert (tuple2!1753 key!657 value!242) (as emptyset (Set tuple2!1752)))) (content!48 (insertStrictlySorted!33 (toList!638 lm!267) key!657 value!242)))))

(declare-fun lt!20588 () Unit!1359)

(declare-fun choose!281 (List!1282 (_ BitVec 64) B!930) Unit!1359)

(assert (=> d!9545 (= lt!20588 (choose!281 (toList!638 lm!267) key!657 value!242))))

(assert (=> d!9545 (isStrictlySorted!255 (toList!638 lm!267))))

(assert (=> d!9545 (= (lemmaInsertStrictlySortedNotContainedContent!3 (toList!638 lm!267) key!657 value!242) lt!20588)))

(declare-fun bs!2245 () Bool)

(assert (= bs!2245 d!9545))

(assert (=> bs!2245 m!42089))

(assert (=> bs!2245 m!42103))

(declare-fun m!42121 () Bool)

(assert (=> bs!2245 m!42121))

(assert (=> bs!2245 m!42093))

(assert (=> bs!2245 m!42095))

(assert (=> bs!2245 m!42093))

(declare-fun m!42123 () Bool)

(assert (=> bs!2245 m!42123))

(assert (=> b!48124 d!9545))

(declare-fun d!9551 () Bool)

(declare-fun c!6467 () Bool)

(assert (=> d!9551 (= c!6467 (is-Nil!1279 (toList!638 (+!75 lm!267 lt!20572))))))

(declare-fun e!30909 () (Set tuple2!1752))

(assert (=> d!9551 (= (content!48 (toList!638 (+!75 lm!267 lt!20572))) e!30909)))

(declare-fun b!48161 () Bool)

(assert (=> b!48161 (= e!30909 (as emptyset (Set tuple2!1752)))))

(declare-fun b!48162 () Bool)

(assert (=> b!48162 (= e!30909 (union (insert (h!1858 (toList!638 (+!75 lm!267 lt!20572))) (as emptyset (Set tuple2!1752))) (content!48 (t!4310 (toList!638 (+!75 lm!267 lt!20572))))))))

(assert (= (and d!9551 c!6467) b!48161))

(assert (= (and d!9551 (not c!6467)) b!48162))

(declare-fun m!42135 () Bool)

(assert (=> b!48162 m!42135))

(declare-fun m!42137 () Bool)

(assert (=> b!48162 m!42137))

(assert (=> b!48124 d!9551))

(declare-fun b!48245 () Bool)

(declare-fun e!30954 () List!1282)

(declare-fun call!3769 () List!1282)

(assert (=> b!48245 (= e!30954 call!3769)))

(declare-fun b!48246 () Bool)

(declare-fun c!6504 () Bool)

(assert (=> b!48246 (= c!6504 (and (is-Cons!1278 (toList!638 lm!267)) (bvsgt (_1!887 (h!1858 (toList!638 lm!267))) key!657)))))

(declare-fun e!30953 () List!1282)

(assert (=> b!48246 (= e!30954 e!30953)))

(declare-fun d!9559 () Bool)

(declare-fun e!30951 () Bool)

(assert (=> d!9559 e!30951))

(declare-fun res!27996 () Bool)

(assert (=> d!9559 (=> (not res!27996) (not e!30951))))

(declare-fun lt!20614 () List!1282)

(assert (=> d!9559 (= res!27996 (isStrictlySorted!255 lt!20614))))

(declare-fun e!30955 () List!1282)

(assert (=> d!9559 (= lt!20614 e!30955)))

(declare-fun c!6503 () Bool)

(assert (=> d!9559 (= c!6503 (and (is-Cons!1278 (toList!638 lm!267)) (bvslt (_1!887 (h!1858 (toList!638 lm!267))) key!657)))))

(assert (=> d!9559 (isStrictlySorted!255 (toList!638 lm!267))))

(assert (=> d!9559 (= (insertStrictlySorted!33 (toList!638 lm!267) key!657 value!242) lt!20614)))

(declare-fun b!48247 () Bool)

(declare-fun call!3768 () List!1282)

(assert (=> b!48247 (= e!30953 call!3768)))

(declare-fun b!48248 () Bool)

(declare-fun contains!605 (List!1282 tuple2!1752) Bool)

(assert (=> b!48248 (= e!30951 (contains!605 lt!20614 (tuple2!1753 key!657 value!242)))))

(declare-fun b!48249 () Bool)

(assert (=> b!48249 (= e!30955 e!30954)))

(declare-fun c!6505 () Bool)

(assert (=> b!48249 (= c!6505 (and (is-Cons!1278 (toList!638 lm!267)) (= (_1!887 (h!1858 (toList!638 lm!267))) key!657)))))

(declare-fun bm!3764 () Bool)

(declare-fun call!3767 () List!1282)

(assert (=> bm!3764 (= call!3769 call!3767)))

(declare-fun bm!3765 () Bool)

(assert (=> bm!3765 (= call!3768 call!3769)))

(declare-fun b!48250 () Bool)

(declare-fun e!30952 () List!1282)

(assert (=> b!48250 (= e!30952 (ite c!6505 (t!4310 (toList!638 lm!267)) (ite c!6504 (Cons!1278 (h!1858 (toList!638 lm!267)) (t!4310 (toList!638 lm!267))) Nil!1279)))))

(declare-fun b!48251 () Bool)

(assert (=> b!48251 (= e!30953 call!3768)))

(declare-fun bm!3766 () Bool)

(declare-fun $colon$colon!51 (List!1282 tuple2!1752) List!1282)

(assert (=> bm!3766 (= call!3767 ($colon$colon!51 e!30952 (ite c!6503 (h!1858 (toList!638 lm!267)) (tuple2!1753 key!657 value!242))))))

(declare-fun c!6502 () Bool)

(assert (=> bm!3766 (= c!6502 c!6503)))

(declare-fun b!48252 () Bool)

(assert (=> b!48252 (= e!30952 (insertStrictlySorted!33 (t!4310 (toList!638 lm!267)) key!657 value!242))))

(declare-fun b!48253 () Bool)

(assert (=> b!48253 (= e!30955 call!3767)))

(declare-fun b!48254 () Bool)

(declare-fun res!27995 () Bool)

(assert (=> b!48254 (=> (not res!27995) (not e!30951))))

(assert (=> b!48254 (= res!27995 (containsKey!104 lt!20614 key!657))))

(assert (= (and d!9559 c!6503) b!48253))

(assert (= (and d!9559 (not c!6503)) b!48249))

(assert (= (and b!48249 c!6505) b!48245))

(assert (= (and b!48249 (not c!6505)) b!48246))

(assert (= (and b!48246 c!6504) b!48247))

(assert (= (and b!48246 (not c!6504)) b!48251))

(assert (= (or b!48247 b!48251) bm!3765))

(assert (= (or b!48245 bm!3765) bm!3764))

(assert (= (or b!48253 bm!3764) bm!3766))

(assert (= (and bm!3766 c!6502) b!48252))

(assert (= (and bm!3766 (not c!6502)) b!48250))

(assert (= (and d!9559 res!27996) b!48254))

(assert (= (and b!48254 res!27995) b!48248))

(declare-fun m!42169 () Bool)

(assert (=> b!48248 m!42169))

(declare-fun m!42171 () Bool)

(assert (=> bm!3766 m!42171))

(declare-fun m!42173 () Bool)

(assert (=> d!9559 m!42173))

(assert (=> d!9559 m!42103))

(declare-fun m!42175 () Bool)

(assert (=> b!48254 m!42175))

(declare-fun m!42177 () Bool)

(assert (=> b!48252 m!42177))

(assert (=> b!48124 d!9559))

(declare-fun d!9573 () Bool)

(declare-fun e!30975 () Bool)

(assert (=> d!9573 e!30975))

(declare-fun res!28016 () Bool)

(assert (=> d!9573 (=> (not res!28016) (not e!30975))))

(declare-fun lt!20624 () ListLongMap!1245)

(assert (=> d!9573 (= res!28016 (contains!602 lt!20624 (_1!887 lt!20572)))))

(declare-fun lt!20626 () List!1282)

(assert (=> d!9573 (= lt!20624 (ListLongMap!1246 lt!20626))))

(declare-fun lt!20625 () Unit!1359)

(declare-fun lt!20629 () Unit!1359)

(assert (=> d!9573 (= lt!20625 lt!20629)))

(declare-datatypes ((Option!124 0))(
  ( (Some!123 (v!2140 B!930)) (None!122) )
))
(declare-fun getValueByKey!118 (List!1282 (_ BitVec 64)) Option!124)

(assert (=> d!9573 (= (getValueByKey!118 lt!20626 (_1!887 lt!20572)) (Some!123 (_2!887 lt!20572)))))

(declare-fun lemmaContainsTupThenGetReturnValue!36 (List!1282 (_ BitVec 64) B!930) Unit!1359)

(assert (=> d!9573 (= lt!20629 (lemmaContainsTupThenGetReturnValue!36 lt!20626 (_1!887 lt!20572) (_2!887 lt!20572)))))

(assert (=> d!9573 (= lt!20626 (insertStrictlySorted!33 (toList!638 lm!267) (_1!887 lt!20572) (_2!887 lt!20572)))))

(assert (=> d!9573 (= (+!75 lm!267 lt!20572) lt!20624)))

(declare-fun b!48281 () Bool)

(declare-fun res!28015 () Bool)

(assert (=> b!48281 (=> (not res!28015) (not e!30975))))

(assert (=> b!48281 (= res!28015 (= (getValueByKey!118 (toList!638 lt!20624) (_1!887 lt!20572)) (Some!123 (_2!887 lt!20572))))))

(declare-fun b!48282 () Bool)

(assert (=> b!48282 (= e!30975 (contains!605 (toList!638 lt!20624) lt!20572))))

(assert (= (and d!9573 res!28016) b!48281))

(assert (= (and b!48281 res!28015) b!48282))

(declare-fun m!42193 () Bool)

(assert (=> d!9573 m!42193))

(declare-fun m!42195 () Bool)

(assert (=> d!9573 m!42195))

(declare-fun m!42197 () Bool)

(assert (=> d!9573 m!42197))

(declare-fun m!42199 () Bool)

(assert (=> d!9573 m!42199))

(declare-fun m!42201 () Bool)

(assert (=> b!48281 m!42201))

(declare-fun m!42203 () Bool)

(assert (=> b!48282 m!42203))

(assert (=> b!48124 d!9573))

(declare-fun d!9581 () Bool)

(declare-fun c!6510 () Bool)

(assert (=> d!9581 (= c!6510 (is-Nil!1279 (insertStrictlySorted!33 (toList!638 lm!267) key!657 value!242)))))

(declare-fun e!30978 () (Set tuple2!1752))

(assert (=> d!9581 (= (content!48 (insertStrictlySorted!33 (toList!638 lm!267) key!657 value!242)) e!30978)))

(declare-fun b!48287 () Bool)

(assert (=> b!48287 (= e!30978 (as emptyset (Set tuple2!1752)))))

(declare-fun b!48288 () Bool)

(assert (=> b!48288 (= e!30978 (union (insert (h!1858 (insertStrictlySorted!33 (toList!638 lm!267) key!657 value!242)) (as emptyset (Set tuple2!1752))) (content!48 (t!4310 (insertStrictlySorted!33 (toList!638 lm!267) key!657 value!242)))))))

(assert (= (and d!9581 c!6510) b!48287))

(assert (= (and d!9581 (not c!6510)) b!48288))

(declare-fun m!42205 () Bool)

(assert (=> b!48288 m!42205))

(declare-fun m!42207 () Bool)

(assert (=> b!48288 m!42207))

(assert (=> b!48124 d!9581))

(declare-fun d!9583 () Bool)

(declare-fun c!6513 () Bool)

(assert (=> d!9583 (= c!6513 (is-Nil!1279 (toList!638 lm!267)))))

(declare-fun e!30981 () (Set tuple2!1752))

(assert (=> d!9583 (= (content!48 (toList!638 lm!267)) e!30981)))

(declare-fun b!48293 () Bool)

(assert (=> b!48293 (= e!30981 (as emptyset (Set tuple2!1752)))))

(declare-fun b!48294 () Bool)

(assert (=> b!48294 (= e!30981 (union (insert (h!1858 (toList!638 lm!267)) (as emptyset (Set tuple2!1752))) (content!48 (t!4310 (toList!638 lm!267)))))))

(assert (= (and d!9583 c!6513) b!48293))

(assert (= (and d!9583 (not c!6513)) b!48294))

(declare-fun m!42209 () Bool)

(assert (=> b!48294 m!42209))

(declare-fun m!42211 () Bool)

(assert (=> b!48294 m!42211))

(assert (=> b!48124 d!9583))

(declare-fun d!9585 () Bool)

(declare-fun res!28030 () Bool)

(declare-fun e!30995 () Bool)

(assert (=> d!9585 (=> res!28030 e!30995)))

(assert (=> d!9585 (= res!28030 (and (is-Cons!1278 (toList!638 lm!267)) (= (_1!887 (h!1858 (toList!638 lm!267))) key!657)))))

(assert (=> d!9585 (= (containsKey!104 (toList!638 lm!267) key!657) e!30995)))

(declare-fun b!48314 () Bool)

(declare-fun e!30996 () Bool)

(assert (=> b!48314 (= e!30995 e!30996)))

(declare-fun res!28031 () Bool)

(assert (=> b!48314 (=> (not res!28031) (not e!30996))))

(assert (=> b!48314 (= res!28031 (and (or (not (is-Cons!1278 (toList!638 lm!267))) (bvsle (_1!887 (h!1858 (toList!638 lm!267))) key!657)) (is-Cons!1278 (toList!638 lm!267)) (bvslt (_1!887 (h!1858 (toList!638 lm!267))) key!657)))))

(declare-fun b!48315 () Bool)

(assert (=> b!48315 (= e!30996 (containsKey!104 (t!4310 (toList!638 lm!267)) key!657))))

(assert (= (and d!9585 (not res!28030)) b!48314))

(assert (= (and b!48314 res!28031) b!48315))

(declare-fun m!42239 () Bool)

(assert (=> b!48315 m!42239))

(assert (=> b!48123 d!9585))

(declare-fun d!9593 () Bool)

(declare-fun res!28036 () Bool)

(declare-fun e!31005 () Bool)

(assert (=> d!9593 (=> res!28036 e!31005)))

(assert (=> d!9593 (= res!28036 (or (is-Nil!1279 (toList!638 lm!267)) (is-Nil!1279 (t!4310 (toList!638 lm!267)))))))

(assert (=> d!9593 (= (isStrictlySorted!255 (toList!638 lm!267)) e!31005)))

