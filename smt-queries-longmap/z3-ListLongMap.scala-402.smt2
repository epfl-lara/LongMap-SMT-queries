; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7512 () Bool)

(assert start!7512)

(declare-fun b!48033 () Bool)

(declare-fun res!27921 () Bool)

(declare-fun e!30828 () Bool)

(assert (=> b!48033 (=> (not res!27921) (not e!30828))))

(declare-datatypes ((B!926 0))(
  ( (B!927 (val!1083 Int)) )
))
(declare-datatypes ((tuple2!1752 0))(
  ( (tuple2!1753 (_1!887 (_ BitVec 64)) (_2!887 B!926)) )
))
(declare-datatypes ((List!1276 0))(
  ( (Nil!1273) (Cons!1272 (h!1852 tuple2!1752) (t!4303 List!1276)) )
))
(declare-datatypes ((ListLongMap!1233 0))(
  ( (ListLongMap!1234 (toList!632 List!1276)) )
))
(declare-fun lm!267 () ListLongMap!1233)

(declare-fun key!657 () (_ BitVec 64))

(declare-fun containsKey!100 (List!1276 (_ BitVec 64)) Bool)

(assert (=> b!48033 (= res!27921 (not (containsKey!100 (toList!632 lm!267) key!657)))))

(declare-fun lt!20537 () tuple2!1752)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun lt!20538 () (InoxSet tuple2!1752))

(declare-fun b!48034 () Bool)

(declare-fun content!46 (List!1276) (InoxSet tuple2!1752))

(declare-fun +!73 (ListLongMap!1233 tuple2!1752) ListLongMap!1233)

(assert (=> b!48034 (= e!30828 (not (= lt!20538 (content!46 (toList!632 (+!73 lm!267 lt!20537))))))))

(declare-fun value!242 () B!926)

(declare-fun insertStrictlySorted!32 (List!1276 (_ BitVec 64) B!926) List!1276)

(assert (=> b!48034 (= lt!20538 (content!46 (insertStrictlySorted!32 (toList!632 lm!267) key!657 value!242)))))

(assert (=> b!48034 (= lt!20538 ((_ map or) (content!46 (toList!632 lm!267)) (store ((as const (Array tuple2!1752 Bool)) false) lt!20537 true)))))

(assert (=> b!48034 (= lt!20537 (tuple2!1753 key!657 value!242))))

(declare-datatypes ((Unit!1360 0))(
  ( (Unit!1361) )
))
(declare-fun lt!20539 () Unit!1360)

(declare-fun lemmaInsertStrictlySortedNotContainedContent!1 (List!1276 (_ BitVec 64) B!926) Unit!1360)

(assert (=> b!48034 (= lt!20539 (lemmaInsertStrictlySortedNotContainedContent!1 (toList!632 lm!267) key!657 value!242))))

(declare-fun res!27920 () Bool)

(assert (=> start!7512 (=> (not res!27920) (not e!30828))))

(declare-fun contains!597 (ListLongMap!1233 (_ BitVec 64)) Bool)

(assert (=> start!7512 (= res!27920 (not (contains!597 lm!267 key!657)))))

(assert (=> start!7512 e!30828))

(declare-fun e!30827 () Bool)

(declare-fun inv!2236 (ListLongMap!1233) Bool)

(assert (=> start!7512 (and (inv!2236 lm!267) e!30827)))

(assert (=> start!7512 true))

(declare-fun tp_is_empty!2077 () Bool)

(assert (=> start!7512 tp_is_empty!2077))

(declare-fun b!48032 () Bool)

(declare-fun res!27919 () Bool)

(assert (=> b!48032 (=> (not res!27919) (not e!30828))))

(declare-fun isStrictlySorted!248 (List!1276) Bool)

(assert (=> b!48032 (= res!27919 (isStrictlySorted!248 (toList!632 lm!267)))))

(declare-fun b!48035 () Bool)

(declare-fun tp!6347 () Bool)

(assert (=> b!48035 (= e!30827 tp!6347)))

(assert (= (and start!7512 res!27920) b!48032))

(assert (= (and b!48032 res!27919) b!48033))

(assert (= (and b!48033 res!27921) b!48034))

(assert (= start!7512 b!48035))

(declare-fun m!41957 () Bool)

(assert (=> b!48033 m!41957))

(declare-fun m!41959 () Bool)

(assert (=> b!48034 m!41959))

(declare-fun m!41961 () Bool)

(assert (=> b!48034 m!41961))

(declare-fun m!41963 () Bool)

(assert (=> b!48034 m!41963))

(assert (=> b!48034 m!41961))

(declare-fun m!41965 () Bool)

(assert (=> b!48034 m!41965))

(declare-fun m!41967 () Bool)

(assert (=> b!48034 m!41967))

(declare-fun m!41969 () Bool)

(assert (=> b!48034 m!41969))

(declare-fun m!41971 () Bool)

(assert (=> b!48034 m!41971))

(declare-fun m!41973 () Bool)

(assert (=> start!7512 m!41973))

(declare-fun m!41975 () Bool)

(assert (=> start!7512 m!41975))

(declare-fun m!41977 () Bool)

(assert (=> b!48032 m!41977))

(check-sat (not start!7512) (not b!48034) (not b!48032) (not b!48035) (not b!48033) tp_is_empty!2077)
(check-sat)
(get-model)

(declare-fun d!9517 () Bool)

(declare-fun res!27944 () Bool)

(declare-fun e!30845 () Bool)

(assert (=> d!9517 (=> res!27944 e!30845)))

(get-info :version)

(assert (=> d!9517 (= res!27944 (and ((_ is Cons!1272) (toList!632 lm!267)) (= (_1!887 (h!1852 (toList!632 lm!267))) key!657)))))

(assert (=> d!9517 (= (containsKey!100 (toList!632 lm!267) key!657) e!30845)))

(declare-fun b!48064 () Bool)

(declare-fun e!30846 () Bool)

(assert (=> b!48064 (= e!30845 e!30846)))

(declare-fun res!27945 () Bool)

(assert (=> b!48064 (=> (not res!27945) (not e!30846))))

(assert (=> b!48064 (= res!27945 (and (or (not ((_ is Cons!1272) (toList!632 lm!267))) (bvsle (_1!887 (h!1852 (toList!632 lm!267))) key!657)) ((_ is Cons!1272) (toList!632 lm!267)) (bvslt (_1!887 (h!1852 (toList!632 lm!267))) key!657)))))

(declare-fun b!48065 () Bool)

(assert (=> b!48065 (= e!30846 (containsKey!100 (t!4303 (toList!632 lm!267)) key!657))))

(assert (= (and d!9517 (not res!27944)) b!48064))

(assert (= (and b!48064 res!27945) b!48065))

(declare-fun m!42023 () Bool)

(assert (=> b!48065 m!42023))

(assert (=> b!48033 d!9517))

(declare-fun d!9519 () Bool)

(assert (=> d!9519 (= ((_ map or) (content!46 (toList!632 lm!267)) (store ((as const (Array tuple2!1752 Bool)) false) (tuple2!1753 key!657 value!242) true)) (content!46 (insertStrictlySorted!32 (toList!632 lm!267) key!657 value!242)))))

(declare-fun lt!20571 () Unit!1360)

(declare-fun choose!288 (List!1276 (_ BitVec 64) B!926) Unit!1360)

(assert (=> d!9519 (= lt!20571 (choose!288 (toList!632 lm!267) key!657 value!242))))

(assert (=> d!9519 (isStrictlySorted!248 (toList!632 lm!267))))

(assert (=> d!9519 (= (lemmaInsertStrictlySortedNotContainedContent!1 (toList!632 lm!267) key!657 value!242) lt!20571)))

(declare-fun bs!2245 () Bool)

(assert (= bs!2245 d!9519))

(assert (=> bs!2245 m!41977))

(assert (=> bs!2245 m!41961))

(assert (=> bs!2245 m!41963))

(assert (=> bs!2245 m!41959))

(declare-fun m!42029 () Bool)

(assert (=> bs!2245 m!42029))

(assert (=> bs!2245 m!41961))

(declare-fun m!42033 () Bool)

(assert (=> bs!2245 m!42033))

(assert (=> b!48034 d!9519))

(declare-fun c!6465 () Bool)

(declare-fun c!6467 () Bool)

(declare-fun e!30885 () List!1276)

(declare-fun b!48136 () Bool)

(assert (=> b!48136 (= e!30885 (ite c!6467 (t!4303 (toList!632 lm!267)) (ite c!6465 (Cons!1272 (h!1852 (toList!632 lm!267)) (t!4303 (toList!632 lm!267))) Nil!1273)))))

(declare-fun b!48138 () Bool)

(assert (=> b!48138 (= c!6465 (and ((_ is Cons!1272) (toList!632 lm!267)) (bvsgt (_1!887 (h!1852 (toList!632 lm!267))) key!657)))))

(declare-fun e!30884 () List!1276)

(declare-fun e!30882 () List!1276)

(assert (=> b!48138 (= e!30884 e!30882)))

(declare-fun b!48139 () Bool)

(declare-fun e!30886 () Bool)

(declare-fun lt!20584 () List!1276)

(declare-fun contains!602 (List!1276 tuple2!1752) Bool)

(assert (=> b!48139 (= e!30886 (contains!602 lt!20584 (tuple2!1753 key!657 value!242)))))

(declare-fun call!3760 () List!1276)

(declare-fun c!6464 () Bool)

(declare-fun bm!3757 () Bool)

(declare-fun $colon$colon!49 (List!1276 tuple2!1752) List!1276)

(assert (=> bm!3757 (= call!3760 ($colon$colon!49 e!30885 (ite c!6464 (h!1852 (toList!632 lm!267)) (tuple2!1753 key!657 value!242))))))

(declare-fun c!6466 () Bool)

(assert (=> bm!3757 (= c!6466 c!6464)))

(declare-fun d!9523 () Bool)

(assert (=> d!9523 e!30886))

(declare-fun res!27962 () Bool)

(assert (=> d!9523 (=> (not res!27962) (not e!30886))))

(assert (=> d!9523 (= res!27962 (isStrictlySorted!248 lt!20584))))

(declare-fun e!30883 () List!1276)

(assert (=> d!9523 (= lt!20584 e!30883)))

(assert (=> d!9523 (= c!6464 (and ((_ is Cons!1272) (toList!632 lm!267)) (bvslt (_1!887 (h!1852 (toList!632 lm!267))) key!657)))))

(assert (=> d!9523 (isStrictlySorted!248 (toList!632 lm!267))))

(assert (=> d!9523 (= (insertStrictlySorted!32 (toList!632 lm!267) key!657 value!242) lt!20584)))

(declare-fun b!48137 () Bool)

(declare-fun call!3762 () List!1276)

(assert (=> b!48137 (= e!30882 call!3762)))

(declare-fun b!48140 () Bool)

(assert (=> b!48140 (= e!30883 call!3760)))

(declare-fun bm!3758 () Bool)

(declare-fun call!3761 () List!1276)

(assert (=> bm!3758 (= call!3762 call!3761)))

(declare-fun b!48141 () Bool)

(assert (=> b!48141 (= e!30884 call!3761)))

(declare-fun b!48142 () Bool)

(assert (=> b!48142 (= e!30885 (insertStrictlySorted!32 (t!4303 (toList!632 lm!267)) key!657 value!242))))

(declare-fun b!48143 () Bool)

(declare-fun res!27963 () Bool)

(assert (=> b!48143 (=> (not res!27963) (not e!30886))))

(assert (=> b!48143 (= res!27963 (containsKey!100 lt!20584 key!657))))

(declare-fun bm!3759 () Bool)

(assert (=> bm!3759 (= call!3761 call!3760)))

(declare-fun b!48144 () Bool)

(assert (=> b!48144 (= e!30882 call!3762)))

(declare-fun b!48145 () Bool)

(assert (=> b!48145 (= e!30883 e!30884)))

(assert (=> b!48145 (= c!6467 (and ((_ is Cons!1272) (toList!632 lm!267)) (= (_1!887 (h!1852 (toList!632 lm!267))) key!657)))))

(assert (= (and d!9523 c!6464) b!48140))

(assert (= (and d!9523 (not c!6464)) b!48145))

(assert (= (and b!48145 c!6467) b!48141))

(assert (= (and b!48145 (not c!6467)) b!48138))

(assert (= (and b!48138 c!6465) b!48137))

(assert (= (and b!48138 (not c!6465)) b!48144))

(assert (= (or b!48137 b!48144) bm!3758))

(assert (= (or b!48141 bm!3758) bm!3759))

(assert (= (or b!48140 bm!3759) bm!3757))

(assert (= (and bm!3757 c!6466) b!48142))

(assert (= (and bm!3757 (not c!6466)) b!48136))

(assert (= (and d!9523 res!27962) b!48143))

(assert (= (and b!48143 res!27963) b!48139))

(declare-fun m!42075 () Bool)

(assert (=> b!48139 m!42075))

(declare-fun m!42077 () Bool)

(assert (=> bm!3757 m!42077))

(declare-fun m!42079 () Bool)

(assert (=> d!9523 m!42079))

(assert (=> d!9523 m!41977))

(declare-fun m!42081 () Bool)

(assert (=> b!48142 m!42081))

(declare-fun m!42083 () Bool)

(assert (=> b!48143 m!42083))

(assert (=> b!48034 d!9523))

(declare-fun d!9539 () Bool)

(declare-fun e!30910 () Bool)

(assert (=> d!9539 e!30910))

(declare-fun res!27980 () Bool)

(assert (=> d!9539 (=> (not res!27980) (not e!30910))))

(declare-fun lt!20610 () ListLongMap!1233)

(assert (=> d!9539 (= res!27980 (contains!597 lt!20610 (_1!887 lt!20537)))))

(declare-fun lt!20609 () List!1276)

(assert (=> d!9539 (= lt!20610 (ListLongMap!1234 lt!20609))))

(declare-fun lt!20611 () Unit!1360)

(declare-fun lt!20608 () Unit!1360)

(assert (=> d!9539 (= lt!20611 lt!20608)))

(declare-datatypes ((Option!121 0))(
  ( (Some!120 (v!2137 B!926)) (None!119) )
))
(declare-fun getValueByKey!115 (List!1276 (_ BitVec 64)) Option!121)

(assert (=> d!9539 (= (getValueByKey!115 lt!20609 (_1!887 lt!20537)) (Some!120 (_2!887 lt!20537)))))

(declare-fun lemmaContainsTupThenGetReturnValue!36 (List!1276 (_ BitVec 64) B!926) Unit!1360)

(assert (=> d!9539 (= lt!20608 (lemmaContainsTupThenGetReturnValue!36 lt!20609 (_1!887 lt!20537) (_2!887 lt!20537)))))

(assert (=> d!9539 (= lt!20609 (insertStrictlySorted!32 (toList!632 lm!267) (_1!887 lt!20537) (_2!887 lt!20537)))))

(assert (=> d!9539 (= (+!73 lm!267 lt!20537) lt!20610)))

(declare-fun b!48192 () Bool)

(declare-fun res!27981 () Bool)

(assert (=> b!48192 (=> (not res!27981) (not e!30910))))

(assert (=> b!48192 (= res!27981 (= (getValueByKey!115 (toList!632 lt!20610) (_1!887 lt!20537)) (Some!120 (_2!887 lt!20537))))))

(declare-fun b!48193 () Bool)

(assert (=> b!48193 (= e!30910 (contains!602 (toList!632 lt!20610) lt!20537))))

(assert (= (and d!9539 res!27980) b!48192))

(assert (= (and b!48192 res!27981) b!48193))

(declare-fun m!42113 () Bool)

(assert (=> d!9539 m!42113))

(declare-fun m!42117 () Bool)

(assert (=> d!9539 m!42117))

(declare-fun m!42119 () Bool)

(assert (=> d!9539 m!42119))

(declare-fun m!42121 () Bool)

(assert (=> d!9539 m!42121))

(declare-fun m!42123 () Bool)

(assert (=> b!48192 m!42123))

(declare-fun m!42125 () Bool)

(assert (=> b!48193 m!42125))

(assert (=> b!48034 d!9539))

(declare-fun d!9549 () Bool)

(declare-fun c!6485 () Bool)

(assert (=> d!9549 (= c!6485 ((_ is Nil!1273) (insertStrictlySorted!32 (toList!632 lm!267) key!657 value!242)))))

(declare-fun e!30917 () (InoxSet tuple2!1752))

(assert (=> d!9549 (= (content!46 (insertStrictlySorted!32 (toList!632 lm!267) key!657 value!242)) e!30917)))

(declare-fun b!48202 () Bool)

(assert (=> b!48202 (= e!30917 ((as const (Array tuple2!1752 Bool)) false))))

(declare-fun b!48203 () Bool)

(assert (=> b!48203 (= e!30917 ((_ map or) (store ((as const (Array tuple2!1752 Bool)) false) (h!1852 (insertStrictlySorted!32 (toList!632 lm!267) key!657 value!242)) true) (content!46 (t!4303 (insertStrictlySorted!32 (toList!632 lm!267) key!657 value!242)))))))

(assert (= (and d!9549 c!6485) b!48202))

(assert (= (and d!9549 (not c!6485)) b!48203))

(declare-fun m!42127 () Bool)

(assert (=> b!48203 m!42127))

(declare-fun m!42129 () Bool)

(assert (=> b!48203 m!42129))

(assert (=> b!48034 d!9549))

(declare-fun d!9551 () Bool)

(declare-fun c!6486 () Bool)

(assert (=> d!9551 (= c!6486 ((_ is Nil!1273) (toList!632 lm!267)))))

(declare-fun e!30920 () (InoxSet tuple2!1752))

(assert (=> d!9551 (= (content!46 (toList!632 lm!267)) e!30920)))

(declare-fun b!48206 () Bool)

(assert (=> b!48206 (= e!30920 ((as const (Array tuple2!1752 Bool)) false))))

(declare-fun b!48207 () Bool)

(assert (=> b!48207 (= e!30920 ((_ map or) (store ((as const (Array tuple2!1752 Bool)) false) (h!1852 (toList!632 lm!267)) true) (content!46 (t!4303 (toList!632 lm!267)))))))

(assert (= (and d!9551 c!6486) b!48206))

(assert (= (and d!9551 (not c!6486)) b!48207))

(declare-fun m!42133 () Bool)

(assert (=> b!48207 m!42133))

(declare-fun m!42135 () Bool)

(assert (=> b!48207 m!42135))

(assert (=> b!48034 d!9551))

(declare-fun d!9555 () Bool)

(declare-fun c!6487 () Bool)

(assert (=> d!9555 (= c!6487 ((_ is Nil!1273) (toList!632 (+!73 lm!267 lt!20537))))))

(declare-fun e!30921 () (InoxSet tuple2!1752))

(assert (=> d!9555 (= (content!46 (toList!632 (+!73 lm!267 lt!20537))) e!30921)))

(declare-fun b!48208 () Bool)

(assert (=> b!48208 (= e!30921 ((as const (Array tuple2!1752 Bool)) false))))

(declare-fun b!48209 () Bool)

(assert (=> b!48209 (= e!30921 ((_ map or) (store ((as const (Array tuple2!1752 Bool)) false) (h!1852 (toList!632 (+!73 lm!267 lt!20537))) true) (content!46 (t!4303 (toList!632 (+!73 lm!267 lt!20537))))))))

(assert (= (and d!9555 c!6487) b!48208))

(assert (= (and d!9555 (not c!6487)) b!48209))

(declare-fun m!42137 () Bool)

(assert (=> b!48209 m!42137))

(declare-fun m!42139 () Bool)

(assert (=> b!48209 m!42139))

(assert (=> b!48034 d!9555))

(declare-fun d!9557 () Bool)

(declare-fun e!30943 () Bool)

(assert (=> d!9557 e!30943))

(declare-fun res!28003 () Bool)

(assert (=> d!9557 (=> res!28003 e!30943)))

(declare-fun lt!20636 () Bool)

(assert (=> d!9557 (= res!28003 (not lt!20636))))

(declare-fun lt!20638 () Bool)

(assert (=> d!9557 (= lt!20636 lt!20638)))

(declare-fun lt!20639 () Unit!1360)

(declare-fun e!30942 () Unit!1360)

(assert (=> d!9557 (= lt!20639 e!30942)))

(declare-fun c!6493 () Bool)

(assert (=> d!9557 (= c!6493 lt!20638)))

(assert (=> d!9557 (= lt!20638 (containsKey!100 (toList!632 lm!267) key!657))))

(assert (=> d!9557 (= (contains!597 lm!267 key!657) lt!20636)))

(declare-fun b!48235 () Bool)

(declare-fun lt!20637 () Unit!1360)

(assert (=> b!48235 (= e!30942 lt!20637)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!71 (List!1276 (_ BitVec 64)) Unit!1360)

(assert (=> b!48235 (= lt!20637 (lemmaContainsKeyImpliesGetValueByKeyDefined!71 (toList!632 lm!267) key!657))))

(declare-fun isDefined!72 (Option!121) Bool)

(assert (=> b!48235 (isDefined!72 (getValueByKey!115 (toList!632 lm!267) key!657))))

(declare-fun b!48236 () Bool)

(declare-fun Unit!1366 () Unit!1360)

(assert (=> b!48236 (= e!30942 Unit!1366)))

(declare-fun b!48237 () Bool)

(assert (=> b!48237 (= e!30943 (isDefined!72 (getValueByKey!115 (toList!632 lm!267) key!657)))))

(assert (= (and d!9557 c!6493) b!48235))

(assert (= (and d!9557 (not c!6493)) b!48236))

(assert (= (and d!9557 (not res!28003)) b!48237))

(assert (=> d!9557 m!41957))

(declare-fun m!42149 () Bool)

(assert (=> b!48235 m!42149))

(declare-fun m!42151 () Bool)

(assert (=> b!48235 m!42151))

(assert (=> b!48235 m!42151))

(declare-fun m!42155 () Bool)

(assert (=> b!48235 m!42155))

(assert (=> b!48237 m!42151))

(assert (=> b!48237 m!42151))

(assert (=> b!48237 m!42155))

(assert (=> start!7512 d!9557))

(declare-fun d!9567 () Bool)

(assert (=> d!9567 (= (inv!2236 lm!267) (isStrictlySorted!248 (toList!632 lm!267)))))

(declare-fun bs!2248 () Bool)

(assert (= bs!2248 d!9567))

(assert (=> bs!2248 m!41977))

(assert (=> start!7512 d!9567))

(declare-fun d!9569 () Bool)

(declare-fun res!28019 () Bool)

(declare-fun e!30966 () Bool)

(assert (=> d!9569 (=> res!28019 e!30966)))

(assert (=> d!9569 (= res!28019 (or ((_ is Nil!1273) (toList!632 lm!267)) ((_ is Nil!1273) (t!4303 (toList!632 lm!267)))))))

(assert (=> d!9569 (= (isStrictlySorted!248 (toList!632 lm!267)) e!30966)))

(declare-fun b!48265 () Bool)

(declare-fun e!30967 () Bool)

(assert (=> b!48265 (= e!30966 e!30967)))

(declare-fun res!28020 () Bool)

(assert (=> b!48265 (=> (not res!28020) (not e!30967))))

(assert (=> b!48265 (= res!28020 (bvslt (_1!887 (h!1852 (toList!632 lm!267))) (_1!887 (h!1852 (t!4303 (toList!632 lm!267))))))))

(declare-fun b!48266 () Bool)

(assert (=> b!48266 (= e!30967 (isStrictlySorted!248 (t!4303 (toList!632 lm!267))))))

(assert (= (and d!9569 (not res!28019)) b!48265))

(assert (= (and b!48265 res!28020) b!48266))

(declare-fun m!42165 () Bool)

(assert (=> b!48266 m!42165))

(assert (=> b!48032 d!9569))

(declare-fun b!48275 () Bool)

(declare-fun e!30972 () Bool)

(declare-fun tp!6362 () Bool)

(assert (=> b!48275 (= e!30972 (and tp_is_empty!2077 tp!6362))))

(assert (=> b!48035 (= tp!6347 e!30972)))

(assert (= (and b!48035 ((_ is Cons!1272) (toList!632 lm!267))) b!48275))

(check-sat (not b!48207) (not d!9523) (not d!9519) (not b!48209) (not b!48203) (not b!48143) (not b!48139) (not d!9557) (not bm!3757) (not b!48192) (not b!48275) (not b!48235) (not d!9567) (not b!48065) (not b!48142) (not d!9539) (not b!48266) tp_is_empty!2077 (not b!48193) (not b!48237))
(check-sat)
