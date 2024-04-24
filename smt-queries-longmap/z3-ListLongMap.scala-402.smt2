; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7516 () Bool)

(assert start!7516)

(declare-fun res!27916 () Bool)

(declare-fun e!30833 () Bool)

(assert (=> start!7516 (=> (not res!27916) (not e!30833))))

(declare-datatypes ((B!926 0))(
  ( (B!927 (val!1083 Int)) )
))
(declare-datatypes ((tuple2!1730 0))(
  ( (tuple2!1731 (_1!876 (_ BitVec 64)) (_2!876 B!926)) )
))
(declare-datatypes ((List!1266 0))(
  ( (Nil!1263) (Cons!1262 (h!1842 tuple2!1730) (t!4294 List!1266)) )
))
(declare-datatypes ((ListLongMap!1217 0))(
  ( (ListLongMap!1218 (toList!624 List!1266)) )
))
(declare-fun lm!267 () ListLongMap!1217)

(declare-fun key!657 () (_ BitVec 64))

(declare-fun contains!591 (ListLongMap!1217 (_ BitVec 64)) Bool)

(assert (=> start!7516 (= res!27916 (not (contains!591 lm!267 key!657)))))

(assert (=> start!7516 e!30833))

(declare-fun e!30834 () Bool)

(declare-fun inv!2236 (ListLongMap!1217) Bool)

(assert (=> start!7516 (and (inv!2236 lm!267) e!30834)))

(assert (=> start!7516 true))

(declare-fun tp_is_empty!2077 () Bool)

(assert (=> start!7516 tp_is_empty!2077))

(declare-fun b!48042 () Bool)

(declare-fun res!27914 () Bool)

(assert (=> b!48042 (=> (not res!27914) (not e!30833))))

(declare-fun containsKey!102 (List!1266 (_ BitVec 64)) Bool)

(assert (=> b!48042 (= res!27914 (not (containsKey!102 (toList!624 lm!267) key!657)))))

(declare-fun b!48043 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun lt!20511 () (InoxSet tuple2!1730))

(declare-fun lt!20512 () tuple2!1730)

(declare-fun content!47 (List!1266) (InoxSet tuple2!1730))

(declare-fun +!72 (ListLongMap!1217 tuple2!1730) ListLongMap!1217)

(assert (=> b!48043 (= e!30833 (not (= lt!20511 (content!47 (toList!624 (+!72 lm!267 lt!20512))))))))

(declare-fun value!242 () B!926)

(declare-fun insertStrictlySorted!32 (List!1266 (_ BitVec 64) B!926) List!1266)

(assert (=> b!48043 (= lt!20511 (content!47 (insertStrictlySorted!32 (toList!624 lm!267) key!657 value!242)))))

(assert (=> b!48043 (= lt!20511 ((_ map or) (content!47 (toList!624 lm!267)) (store ((as const (Array tuple2!1730 Bool)) false) lt!20512 true)))))

(assert (=> b!48043 (= lt!20512 (tuple2!1731 key!657 value!242))))

(declare-datatypes ((Unit!1366 0))(
  ( (Unit!1367) )
))
(declare-fun lt!20510 () Unit!1366)

(declare-fun lemmaInsertStrictlySortedNotContainedContent!1 (List!1266 (_ BitVec 64) B!926) Unit!1366)

(assert (=> b!48043 (= lt!20510 (lemmaInsertStrictlySortedNotContainedContent!1 (toList!624 lm!267) key!657 value!242))))

(declare-fun b!48044 () Bool)

(declare-fun tp!6347 () Bool)

(assert (=> b!48044 (= e!30834 tp!6347)))

(declare-fun b!48041 () Bool)

(declare-fun res!27915 () Bool)

(assert (=> b!48041 (=> (not res!27915) (not e!30833))))

(declare-fun isStrictlySorted!241 (List!1266) Bool)

(assert (=> b!48041 (= res!27915 (isStrictlySorted!241 (toList!624 lm!267)))))

(assert (= (and start!7516 res!27916) b!48041))

(assert (= (and b!48041 res!27915) b!48042))

(assert (= (and b!48042 res!27914) b!48043))

(assert (= start!7516 b!48044))

(declare-fun m!41915 () Bool)

(assert (=> start!7516 m!41915))

(declare-fun m!41917 () Bool)

(assert (=> start!7516 m!41917))

(declare-fun m!41919 () Bool)

(assert (=> b!48042 m!41919))

(declare-fun m!41921 () Bool)

(assert (=> b!48043 m!41921))

(declare-fun m!41923 () Bool)

(assert (=> b!48043 m!41923))

(declare-fun m!41925 () Bool)

(assert (=> b!48043 m!41925))

(declare-fun m!41927 () Bool)

(assert (=> b!48043 m!41927))

(assert (=> b!48043 m!41925))

(declare-fun m!41929 () Bool)

(assert (=> b!48043 m!41929))

(declare-fun m!41931 () Bool)

(assert (=> b!48043 m!41931))

(declare-fun m!41933 () Bool)

(assert (=> b!48043 m!41933))

(declare-fun m!41935 () Bool)

(assert (=> b!48041 m!41935))

(check-sat (not start!7516) (not b!48042) tp_is_empty!2077 (not b!48041) (not b!48044) (not b!48043))
(check-sat)
(get-model)

(declare-fun d!9529 () Bool)

(declare-fun res!27943 () Bool)

(declare-fun e!30855 () Bool)

(assert (=> d!9529 (=> res!27943 e!30855)))

(get-info :version)

(assert (=> d!9529 (= res!27943 (or ((_ is Nil!1263) (toList!624 lm!267)) ((_ is Nil!1263) (t!4294 (toList!624 lm!267)))))))

(assert (=> d!9529 (= (isStrictlySorted!241 (toList!624 lm!267)) e!30855)))

(declare-fun b!48077 () Bool)

(declare-fun e!30856 () Bool)

(assert (=> b!48077 (= e!30855 e!30856)))

(declare-fun res!27944 () Bool)

(assert (=> b!48077 (=> (not res!27944) (not e!30856))))

(assert (=> b!48077 (= res!27944 (bvslt (_1!876 (h!1842 (toList!624 lm!267))) (_1!876 (h!1842 (t!4294 (toList!624 lm!267))))))))

(declare-fun b!48078 () Bool)

(assert (=> b!48078 (= e!30856 (isStrictlySorted!241 (t!4294 (toList!624 lm!267))))))

(assert (= (and d!9529 (not res!27943)) b!48077))

(assert (= (and b!48077 res!27944) b!48078))

(declare-fun m!41981 () Bool)

(assert (=> b!48078 m!41981))

(assert (=> b!48041 d!9529))

(declare-fun d!9533 () Bool)

(declare-fun res!27957 () Bool)

(declare-fun e!30869 () Bool)

(assert (=> d!9533 (=> res!27957 e!30869)))

(assert (=> d!9533 (= res!27957 (and ((_ is Cons!1262) (toList!624 lm!267)) (= (_1!876 (h!1842 (toList!624 lm!267))) key!657)))))

(assert (=> d!9533 (= (containsKey!102 (toList!624 lm!267) key!657) e!30869)))

(declare-fun b!48091 () Bool)

(declare-fun e!30870 () Bool)

(assert (=> b!48091 (= e!30869 e!30870)))

(declare-fun res!27958 () Bool)

(assert (=> b!48091 (=> (not res!27958) (not e!30870))))

(assert (=> b!48091 (= res!27958 (and (or (not ((_ is Cons!1262) (toList!624 lm!267))) (bvsle (_1!876 (h!1842 (toList!624 lm!267))) key!657)) ((_ is Cons!1262) (toList!624 lm!267)) (bvslt (_1!876 (h!1842 (toList!624 lm!267))) key!657)))))

(declare-fun b!48092 () Bool)

(assert (=> b!48092 (= e!30870 (containsKey!102 (t!4294 (toList!624 lm!267)) key!657))))

(assert (= (and d!9533 (not res!27957)) b!48091))

(assert (= (and b!48091 res!27958) b!48092))

(declare-fun m!41987 () Bool)

(assert (=> b!48092 m!41987))

(assert (=> b!48042 d!9533))

(declare-fun d!9539 () Bool)

(assert (=> d!9539 (= ((_ map or) (content!47 (toList!624 lm!267)) (store ((as const (Array tuple2!1730 Bool)) false) (tuple2!1731 key!657 value!242) true)) (content!47 (insertStrictlySorted!32 (toList!624 lm!267) key!657 value!242)))))

(declare-fun lt!20539 () Unit!1366)

(declare-fun choose!288 (List!1266 (_ BitVec 64) B!926) Unit!1366)

(assert (=> d!9539 (= lt!20539 (choose!288 (toList!624 lm!267) key!657 value!242))))

(assert (=> d!9539 (isStrictlySorted!241 (toList!624 lm!267))))

(assert (=> d!9539 (= (lemmaInsertStrictlySortedNotContainedContent!1 (toList!624 lm!267) key!657 value!242) lt!20539)))

(declare-fun bs!2247 () Bool)

(assert (= bs!2247 d!9539))

(assert (=> bs!2247 m!41925))

(assert (=> bs!2247 m!41925))

(assert (=> bs!2247 m!41927))

(assert (=> bs!2247 m!41921))

(declare-fun m!41997 () Bool)

(assert (=> bs!2247 m!41997))

(declare-fun m!41999 () Bool)

(assert (=> bs!2247 m!41999))

(assert (=> bs!2247 m!41935))

(assert (=> b!48043 d!9539))

(declare-fun b!48177 () Bool)

(declare-fun e!30917 () List!1266)

(declare-fun call!3757 () List!1266)

(assert (=> b!48177 (= e!30917 call!3757)))

(declare-fun b!48178 () Bool)

(declare-fun res!27976 () Bool)

(declare-fun e!30914 () Bool)

(assert (=> b!48178 (=> (not res!27976) (not e!30914))))

(declare-fun lt!20548 () List!1266)

(assert (=> b!48178 (= res!27976 (containsKey!102 lt!20548 key!657))))

(declare-fun b!48179 () Bool)

(declare-fun e!30915 () List!1266)

(declare-fun call!3756 () List!1266)

(assert (=> b!48179 (= e!30915 call!3756)))

(declare-fun bm!3753 () Bool)

(declare-fun call!3758 () List!1266)

(assert (=> bm!3753 (= call!3758 call!3756)))

(declare-fun b!48180 () Bool)

(declare-fun contains!594 (List!1266 tuple2!1730) Bool)

(assert (=> b!48180 (= e!30914 (contains!594 lt!20548 (tuple2!1731 key!657 value!242)))))

(declare-fun d!9545 () Bool)

(assert (=> d!9545 e!30914))

(declare-fun res!27975 () Bool)

(assert (=> d!9545 (=> (not res!27975) (not e!30914))))

(assert (=> d!9545 (= res!27975 (isStrictlySorted!241 lt!20548))))

(assert (=> d!9545 (= lt!20548 e!30915)))

(declare-fun c!6481 () Bool)

(assert (=> d!9545 (= c!6481 (and ((_ is Cons!1262) (toList!624 lm!267)) (bvslt (_1!876 (h!1842 (toList!624 lm!267))) key!657)))))

(assert (=> d!9545 (isStrictlySorted!241 (toList!624 lm!267))))

(assert (=> d!9545 (= (insertStrictlySorted!32 (toList!624 lm!267) key!657 value!242) lt!20548)))

(declare-fun e!30916 () List!1266)

(declare-fun bm!3754 () Bool)

(declare-fun $colon$colon!50 (List!1266 tuple2!1730) List!1266)

(assert (=> bm!3754 (= call!3756 ($colon$colon!50 e!30916 (ite c!6481 (h!1842 (toList!624 lm!267)) (tuple2!1731 key!657 value!242))))))

(declare-fun c!6480 () Bool)

(assert (=> bm!3754 (= c!6480 c!6481)))

(declare-fun bm!3755 () Bool)

(assert (=> bm!3755 (= call!3757 call!3758)))

(declare-fun b!48181 () Bool)

(declare-fun e!30913 () List!1266)

(assert (=> b!48181 (= e!30913 call!3758)))

(declare-fun b!48182 () Bool)

(declare-fun c!6479 () Bool)

(assert (=> b!48182 (= c!6479 (and ((_ is Cons!1262) (toList!624 lm!267)) (bvsgt (_1!876 (h!1842 (toList!624 lm!267))) key!657)))))

(assert (=> b!48182 (= e!30913 e!30917)))

(declare-fun b!48183 () Bool)

(assert (=> b!48183 (= e!30916 (insertStrictlySorted!32 (t!4294 (toList!624 lm!267)) key!657 value!242))))

(declare-fun b!48184 () Bool)

(assert (=> b!48184 (= e!30917 call!3757)))

(declare-fun b!48185 () Bool)

(declare-fun c!6478 () Bool)

(assert (=> b!48185 (= e!30916 (ite c!6478 (t!4294 (toList!624 lm!267)) (ite c!6479 (Cons!1262 (h!1842 (toList!624 lm!267)) (t!4294 (toList!624 lm!267))) Nil!1263)))))

(declare-fun b!48186 () Bool)

(assert (=> b!48186 (= e!30915 e!30913)))

(assert (=> b!48186 (= c!6478 (and ((_ is Cons!1262) (toList!624 lm!267)) (= (_1!876 (h!1842 (toList!624 lm!267))) key!657)))))

(assert (= (and d!9545 c!6481) b!48179))

(assert (= (and d!9545 (not c!6481)) b!48186))

(assert (= (and b!48186 c!6478) b!48181))

(assert (= (and b!48186 (not c!6478)) b!48182))

(assert (= (and b!48182 c!6479) b!48184))

(assert (= (and b!48182 (not c!6479)) b!48177))

(assert (= (or b!48184 b!48177) bm!3755))

(assert (= (or b!48181 bm!3755) bm!3753))

(assert (= (or b!48179 bm!3753) bm!3754))

(assert (= (and bm!3754 c!6480) b!48183))

(assert (= (and bm!3754 (not c!6480)) b!48185))

(assert (= (and d!9545 res!27975) b!48178))

(assert (= (and b!48178 res!27976) b!48180))

(declare-fun m!42021 () Bool)

(assert (=> b!48180 m!42021))

(declare-fun m!42023 () Bool)

(assert (=> b!48183 m!42023))

(declare-fun m!42025 () Bool)

(assert (=> d!9545 m!42025))

(assert (=> d!9545 m!41935))

(declare-fun m!42027 () Bool)

(assert (=> bm!3754 m!42027))

(declare-fun m!42029 () Bool)

(assert (=> b!48178 m!42029))

(assert (=> b!48043 d!9545))

(declare-fun d!9551 () Bool)

(declare-fun c!6487 () Bool)

(assert (=> d!9551 (= c!6487 ((_ is Nil!1263) (toList!624 (+!72 lm!267 lt!20512))))))

(declare-fun e!30923 () (InoxSet tuple2!1730))

(assert (=> d!9551 (= (content!47 (toList!624 (+!72 lm!267 lt!20512))) e!30923)))

(declare-fun b!48197 () Bool)

(assert (=> b!48197 (= e!30923 ((as const (Array tuple2!1730 Bool)) false))))

(declare-fun b!48198 () Bool)

(assert (=> b!48198 (= e!30923 ((_ map or) (store ((as const (Array tuple2!1730 Bool)) false) (h!1842 (toList!624 (+!72 lm!267 lt!20512))) true) (content!47 (t!4294 (toList!624 (+!72 lm!267 lt!20512))))))))

(assert (= (and d!9551 c!6487) b!48197))

(assert (= (and d!9551 (not c!6487)) b!48198))

(declare-fun m!42043 () Bool)

(assert (=> b!48198 m!42043))

(declare-fun m!42045 () Bool)

(assert (=> b!48198 m!42045))

(assert (=> b!48043 d!9551))

(declare-fun d!9559 () Bool)

(declare-fun c!6488 () Bool)

(assert (=> d!9559 (= c!6488 ((_ is Nil!1263) (insertStrictlySorted!32 (toList!624 lm!267) key!657 value!242)))))

(declare-fun e!30924 () (InoxSet tuple2!1730))

(assert (=> d!9559 (= (content!47 (insertStrictlySorted!32 (toList!624 lm!267) key!657 value!242)) e!30924)))

(declare-fun b!48199 () Bool)

(assert (=> b!48199 (= e!30924 ((as const (Array tuple2!1730 Bool)) false))))

(declare-fun b!48200 () Bool)

(assert (=> b!48200 (= e!30924 ((_ map or) (store ((as const (Array tuple2!1730 Bool)) false) (h!1842 (insertStrictlySorted!32 (toList!624 lm!267) key!657 value!242)) true) (content!47 (t!4294 (insertStrictlySorted!32 (toList!624 lm!267) key!657 value!242)))))))

(assert (= (and d!9559 c!6488) b!48199))

(assert (= (and d!9559 (not c!6488)) b!48200))

(declare-fun m!42047 () Bool)

(assert (=> b!48200 m!42047))

(declare-fun m!42049 () Bool)

(assert (=> b!48200 m!42049))

(assert (=> b!48043 d!9559))

(declare-fun d!9561 () Bool)

(declare-fun c!6489 () Bool)

(assert (=> d!9561 (= c!6489 ((_ is Nil!1263) (toList!624 lm!267)))))

(declare-fun e!30925 () (InoxSet tuple2!1730))

(assert (=> d!9561 (= (content!47 (toList!624 lm!267)) e!30925)))

(declare-fun b!48201 () Bool)

(assert (=> b!48201 (= e!30925 ((as const (Array tuple2!1730 Bool)) false))))

(declare-fun b!48202 () Bool)

(assert (=> b!48202 (= e!30925 ((_ map or) (store ((as const (Array tuple2!1730 Bool)) false) (h!1842 (toList!624 lm!267)) true) (content!47 (t!4294 (toList!624 lm!267)))))))

(assert (= (and d!9561 c!6489) b!48201))

(assert (= (and d!9561 (not c!6489)) b!48202))

(declare-fun m!42051 () Bool)

(assert (=> b!48202 m!42051))

(declare-fun m!42053 () Bool)

(assert (=> b!48202 m!42053))

(assert (=> b!48043 d!9561))

(declare-fun d!9563 () Bool)

(declare-fun e!30939 () Bool)

(assert (=> d!9563 e!30939))

(declare-fun res!27993 () Bool)

(assert (=> d!9563 (=> (not res!27993) (not e!30939))))

(declare-fun lt!20581 () ListLongMap!1217)

(assert (=> d!9563 (= res!27993 (contains!591 lt!20581 (_1!876 lt!20512)))))

(declare-fun lt!20582 () List!1266)

(assert (=> d!9563 (= lt!20581 (ListLongMap!1218 lt!20582))))

(declare-fun lt!20583 () Unit!1366)

(declare-fun lt!20584 () Unit!1366)

(assert (=> d!9563 (= lt!20583 lt!20584)))

(declare-datatypes ((Option!124 0))(
  ( (Some!123 (v!2140 B!926)) (None!122) )
))
(declare-fun getValueByKey!118 (List!1266 (_ BitVec 64)) Option!124)

(assert (=> d!9563 (= (getValueByKey!118 lt!20582 (_1!876 lt!20512)) (Some!123 (_2!876 lt!20512)))))

(declare-fun lemmaContainsTupThenGetReturnValue!36 (List!1266 (_ BitVec 64) B!926) Unit!1366)

(assert (=> d!9563 (= lt!20584 (lemmaContainsTupThenGetReturnValue!36 lt!20582 (_1!876 lt!20512) (_2!876 lt!20512)))))

(assert (=> d!9563 (= lt!20582 (insertStrictlySorted!32 (toList!624 lm!267) (_1!876 lt!20512) (_2!876 lt!20512)))))

(assert (=> d!9563 (= (+!72 lm!267 lt!20512) lt!20581)))

(declare-fun b!48229 () Bool)

(declare-fun res!27994 () Bool)

(assert (=> b!48229 (=> (not res!27994) (not e!30939))))

(assert (=> b!48229 (= res!27994 (= (getValueByKey!118 (toList!624 lt!20581) (_1!876 lt!20512)) (Some!123 (_2!876 lt!20512))))))

(declare-fun b!48230 () Bool)

(assert (=> b!48230 (= e!30939 (contains!594 (toList!624 lt!20581) lt!20512))))

(assert (= (and d!9563 res!27993) b!48229))

(assert (= (and b!48229 res!27994) b!48230))

(declare-fun m!42091 () Bool)

(assert (=> d!9563 m!42091))

(declare-fun m!42093 () Bool)

(assert (=> d!9563 m!42093))

(declare-fun m!42095 () Bool)

(assert (=> d!9563 m!42095))

(declare-fun m!42097 () Bool)

(assert (=> d!9563 m!42097))

(declare-fun m!42099 () Bool)

(assert (=> b!48229 m!42099))

(declare-fun m!42101 () Bool)

(assert (=> b!48230 m!42101))

(assert (=> b!48043 d!9563))

(declare-fun d!9575 () Bool)

(declare-fun e!30957 () Bool)

(assert (=> d!9575 e!30957))

(declare-fun res!28003 () Bool)

(assert (=> d!9575 (=> res!28003 e!30957)))

(declare-fun lt!20617 () Bool)

(assert (=> d!9575 (= res!28003 (not lt!20617))))

(declare-fun lt!20619 () Bool)

(assert (=> d!9575 (= lt!20617 lt!20619)))

(declare-fun lt!20620 () Unit!1366)

(declare-fun e!30956 () Unit!1366)

(assert (=> d!9575 (= lt!20620 e!30956)))

(declare-fun c!6503 () Bool)

(assert (=> d!9575 (= c!6503 lt!20619)))

(assert (=> d!9575 (= lt!20619 (containsKey!102 (toList!624 lm!267) key!657))))

(assert (=> d!9575 (= (contains!591 lm!267 key!657) lt!20617)))

(declare-fun b!48255 () Bool)

(declare-fun lt!20618 () Unit!1366)

(assert (=> b!48255 (= e!30956 lt!20618)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!72 (List!1266 (_ BitVec 64)) Unit!1366)

(assert (=> b!48255 (= lt!20618 (lemmaContainsKeyImpliesGetValueByKeyDefined!72 (toList!624 lm!267) key!657))))

(declare-fun isDefined!73 (Option!124) Bool)

(assert (=> b!48255 (isDefined!73 (getValueByKey!118 (toList!624 lm!267) key!657))))

(declare-fun b!48256 () Bool)

(declare-fun Unit!1372 () Unit!1366)

(assert (=> b!48256 (= e!30956 Unit!1372)))

(declare-fun b!48257 () Bool)

(assert (=> b!48257 (= e!30957 (isDefined!73 (getValueByKey!118 (toList!624 lm!267) key!657)))))

(assert (= (and d!9575 c!6503) b!48255))

(assert (= (and d!9575 (not c!6503)) b!48256))

(assert (= (and d!9575 (not res!28003)) b!48257))

(assert (=> d!9575 m!41919))

(declare-fun m!42115 () Bool)

(assert (=> b!48255 m!42115))

(declare-fun m!42117 () Bool)

(assert (=> b!48255 m!42117))

(assert (=> b!48255 m!42117))

(declare-fun m!42119 () Bool)

(assert (=> b!48255 m!42119))

(assert (=> b!48257 m!42117))

(assert (=> b!48257 m!42117))

(assert (=> b!48257 m!42119))

(assert (=> start!7516 d!9575))

(declare-fun d!9583 () Bool)

(assert (=> d!9583 (= (inv!2236 lm!267) (isStrictlySorted!241 (toList!624 lm!267)))))

(declare-fun bs!2250 () Bool)

(assert (= bs!2250 d!9583))

(assert (=> bs!2250 m!41935))

(assert (=> start!7516 d!9583))

(declare-fun b!48268 () Bool)

(declare-fun e!30966 () Bool)

(declare-fun tp!6356 () Bool)

(assert (=> b!48268 (= e!30966 (and tp_is_empty!2077 tp!6356))))

(assert (=> b!48044 (= tp!6347 e!30966)))

(assert (= (and b!48044 ((_ is Cons!1262) (toList!624 lm!267))) b!48268))

(check-sat (not b!48255) (not d!9563) (not b!48202) (not b!48078) (not b!48180) (not d!9583) (not b!48229) (not b!48268) (not d!9575) (not b!48092) (not b!48200) tp_is_empty!2077 (not d!9545) (not b!48183) (not bm!3754) (not b!48257) (not b!48198) (not b!48230) (not b!48178) (not d!9539))
(check-sat)
