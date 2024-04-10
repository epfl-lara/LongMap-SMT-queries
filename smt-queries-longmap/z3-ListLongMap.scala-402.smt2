; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7512 () Bool)

(assert start!7512)

(declare-fun b!48111 () Bool)

(declare-fun res!27950 () Bool)

(declare-fun e!30877 () Bool)

(assert (=> b!48111 (=> (not res!27950) (not e!30877))))

(declare-datatypes ((B!928 0))(
  ( (B!929 (val!1084 Int)) )
))
(declare-datatypes ((tuple2!1750 0))(
  ( (tuple2!1751 (_1!886 (_ BitVec 64)) (_2!886 B!928)) )
))
(declare-datatypes ((List!1281 0))(
  ( (Nil!1278) (Cons!1277 (h!1857 tuple2!1750) (t!4309 List!1281)) )
))
(declare-datatypes ((ListLongMap!1243 0))(
  ( (ListLongMap!1244 (toList!637 List!1281)) )
))
(declare-fun lm!267 () ListLongMap!1243)

(declare-fun key!657 () (_ BitVec 64))

(declare-fun containsKey!103 (List!1281 (_ BitVec 64)) Bool)

(assert (=> b!48111 (= res!27950 (not (containsKey!103 (toList!637 lm!267) key!657)))))

(declare-fun b!48110 () Bool)

(declare-fun res!27948 () Bool)

(assert (=> b!48110 (=> (not res!27948) (not e!30877))))

(declare-fun isStrictlySorted!254 (List!1281) Bool)

(assert (=> b!48110 (= res!27948 (isStrictlySorted!254 (toList!637 lm!267)))))

(declare-fun b!48113 () Bool)

(declare-fun e!30876 () Bool)

(declare-fun tp!6350 () Bool)

(assert (=> b!48113 (= e!30876 tp!6350)))

(declare-fun lt!20564 () tuple2!1750)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun lt!20563 () (InoxSet tuple2!1750))

(declare-fun b!48112 () Bool)

(declare-fun content!47 (List!1281) (InoxSet tuple2!1750))

(declare-fun +!74 (ListLongMap!1243 tuple2!1750) ListLongMap!1243)

(assert (=> b!48112 (= e!30877 (not (= lt!20563 (content!47 (toList!637 (+!74 lm!267 lt!20564))))))))

(declare-fun value!242 () B!928)

(declare-fun insertStrictlySorted!32 (List!1281 (_ BitVec 64) B!928) List!1281)

(assert (=> b!48112 (= lt!20563 (content!47 (insertStrictlySorted!32 (toList!637 lm!267) key!657 value!242)))))

(assert (=> b!48112 (= lt!20563 ((_ map or) (content!47 (toList!637 lm!267)) (store ((as const (Array tuple2!1750 Bool)) false) lt!20564 true)))))

(assert (=> b!48112 (= lt!20564 (tuple2!1751 key!657 value!242))))

(declare-datatypes ((Unit!1357 0))(
  ( (Unit!1358) )
))
(declare-fun lt!20562 () Unit!1357)

(declare-fun lemmaInsertStrictlySortedNotContainedContent!2 (List!1281 (_ BitVec 64) B!928) Unit!1357)

(assert (=> b!48112 (= lt!20562 (lemmaInsertStrictlySortedNotContainedContent!2 (toList!637 lm!267) key!657 value!242))))

(declare-fun res!27949 () Bool)

(assert (=> start!7512 (=> (not res!27949) (not e!30877))))

(declare-fun contains!601 (ListLongMap!1243 (_ BitVec 64)) Bool)

(assert (=> start!7512 (= res!27949 (not (contains!601 lm!267 key!657)))))

(assert (=> start!7512 e!30877))

(declare-fun inv!2237 (ListLongMap!1243) Bool)

(assert (=> start!7512 (and (inv!2237 lm!267) e!30876)))

(assert (=> start!7512 true))

(declare-fun tp_is_empty!2079 () Bool)

(assert (=> start!7512 tp_is_empty!2079))

(assert (= (and start!7512 res!27949) b!48110))

(assert (= (and b!48110 res!27948) b!48111))

(assert (= (and b!48111 res!27950) b!48112))

(assert (= start!7512 b!48113))

(declare-fun m!42061 () Bool)

(assert (=> b!48111 m!42061))

(declare-fun m!42063 () Bool)

(assert (=> b!48110 m!42063))

(declare-fun m!42065 () Bool)

(assert (=> b!48112 m!42065))

(declare-fun m!42067 () Bool)

(assert (=> b!48112 m!42067))

(declare-fun m!42069 () Bool)

(assert (=> b!48112 m!42069))

(declare-fun m!42071 () Bool)

(assert (=> b!48112 m!42071))

(assert (=> b!48112 m!42069))

(declare-fun m!42073 () Bool)

(assert (=> b!48112 m!42073))

(declare-fun m!42075 () Bool)

(assert (=> b!48112 m!42075))

(declare-fun m!42077 () Bool)

(assert (=> b!48112 m!42077))

(declare-fun m!42079 () Bool)

(assert (=> start!7512 m!42079))

(declare-fun m!42081 () Bool)

(assert (=> start!7512 m!42081))

(check-sat (not start!7512) (not b!48113) (not b!48111) (not b!48110) tp_is_empty!2079 (not b!48112))
(check-sat)
(get-model)

(declare-fun d!9539 () Bool)

(declare-fun e!30898 () Bool)

(assert (=> d!9539 e!30898))

(declare-fun res!27976 () Bool)

(assert (=> d!9539 (=> (not res!27976) (not e!30898))))

(declare-fun lt!20582 () ListLongMap!1243)

(assert (=> d!9539 (= res!27976 (contains!601 lt!20582 (_1!886 lt!20564)))))

(declare-fun lt!20583 () List!1281)

(assert (=> d!9539 (= lt!20582 (ListLongMap!1244 lt!20583))))

(declare-fun lt!20585 () Unit!1357)

(declare-fun lt!20584 () Unit!1357)

(assert (=> d!9539 (= lt!20585 lt!20584)))

(declare-datatypes ((Option!122 0))(
  ( (Some!121 (v!2138 B!928)) (None!120) )
))
(declare-fun getValueByKey!116 (List!1281 (_ BitVec 64)) Option!122)

(assert (=> d!9539 (= (getValueByKey!116 lt!20583 (_1!886 lt!20564)) (Some!121 (_2!886 lt!20564)))))

(declare-fun lemmaContainsTupThenGetReturnValue!34 (List!1281 (_ BitVec 64) B!928) Unit!1357)

(assert (=> d!9539 (= lt!20584 (lemmaContainsTupThenGetReturnValue!34 lt!20583 (_1!886 lt!20564) (_2!886 lt!20564)))))

(assert (=> d!9539 (= lt!20583 (insertStrictlySorted!32 (toList!637 lm!267) (_1!886 lt!20564) (_2!886 lt!20564)))))

(assert (=> d!9539 (= (+!74 lm!267 lt!20564) lt!20582)))

(declare-fun b!48142 () Bool)

(declare-fun res!27977 () Bool)

(assert (=> b!48142 (=> (not res!27977) (not e!30898))))

(assert (=> b!48142 (= res!27977 (= (getValueByKey!116 (toList!637 lt!20582) (_1!886 lt!20564)) (Some!121 (_2!886 lt!20564))))))

(declare-fun b!48143 () Bool)

(declare-fun contains!603 (List!1281 tuple2!1750) Bool)

(assert (=> b!48143 (= e!30898 (contains!603 (toList!637 lt!20582) lt!20564))))

(assert (= (and d!9539 res!27976) b!48142))

(assert (= (and b!48142 res!27977) b!48143))

(declare-fun m!42109 () Bool)

(assert (=> d!9539 m!42109))

(declare-fun m!42111 () Bool)

(assert (=> d!9539 m!42111))

(declare-fun m!42113 () Bool)

(assert (=> d!9539 m!42113))

(declare-fun m!42115 () Bool)

(assert (=> d!9539 m!42115))

(declare-fun m!42117 () Bool)

(assert (=> b!48142 m!42117))

(declare-fun m!42119 () Bool)

(assert (=> b!48143 m!42119))

(assert (=> b!48112 d!9539))

(declare-fun d!9549 () Bool)

(assert (=> d!9549 (= ((_ map or) (content!47 (toList!637 lm!267)) (store ((as const (Array tuple2!1750 Bool)) false) (tuple2!1751 key!657 value!242) true)) (content!47 (insertStrictlySorted!32 (toList!637 lm!267) key!657 value!242)))))

(declare-fun lt!20599 () Unit!1357)

(declare-fun choose!280 (List!1281 (_ BitVec 64) B!928) Unit!1357)

(assert (=> d!9549 (= lt!20599 (choose!280 (toList!637 lm!267) key!657 value!242))))

(assert (=> d!9549 (isStrictlySorted!254 (toList!637 lm!267))))

(assert (=> d!9549 (= (lemmaInsertStrictlySortedNotContainedContent!2 (toList!637 lm!267) key!657 value!242) lt!20599)))

(declare-fun bs!2246 () Bool)

(assert (= bs!2246 d!9549))

(declare-fun m!42125 () Bool)

(assert (=> bs!2246 m!42125))

(assert (=> bs!2246 m!42069))

(declare-fun m!42127 () Bool)

(assert (=> bs!2246 m!42127))

(assert (=> bs!2246 m!42063))

(assert (=> bs!2246 m!42065))

(assert (=> bs!2246 m!42069))

(assert (=> bs!2246 m!42071))

(assert (=> b!48112 d!9549))

(declare-fun b!48197 () Bool)

(declare-fun e!30928 () List!1281)

(declare-fun call!3754 () List!1281)

(assert (=> b!48197 (= e!30928 call!3754)))

(declare-fun b!48198 () Bool)

(declare-fun res!27985 () Bool)

(declare-fun e!30931 () Bool)

(assert (=> b!48198 (=> (not res!27985) (not e!30931))))

(declare-fun lt!20611 () List!1281)

(assert (=> b!48198 (= res!27985 (containsKey!103 lt!20611 key!657))))

(declare-fun b!48199 () Bool)

(assert (=> b!48199 (= e!30928 call!3754)))

(declare-fun e!30930 () List!1281)

(declare-fun call!3752 () List!1281)

(declare-fun bm!3749 () Bool)

(declare-fun c!6486 () Bool)

(declare-fun $colon$colon!50 (List!1281 tuple2!1750) List!1281)

(assert (=> bm!3749 (= call!3752 ($colon$colon!50 e!30930 (ite c!6486 (h!1857 (toList!637 lm!267)) (tuple2!1751 key!657 value!242))))))

(declare-fun c!6483 () Bool)

(assert (=> bm!3749 (= c!6483 c!6486)))

(declare-fun c!6484 () Bool)

(declare-fun b!48200 () Bool)

(declare-fun c!6485 () Bool)

(assert (=> b!48200 (= e!30930 (ite c!6485 (t!4309 (toList!637 lm!267)) (ite c!6484 (Cons!1277 (h!1857 (toList!637 lm!267)) (t!4309 (toList!637 lm!267))) Nil!1278)))))

(declare-fun b!48201 () Bool)

(declare-fun e!30929 () List!1281)

(declare-fun call!3753 () List!1281)

(assert (=> b!48201 (= e!30929 call!3753)))

(declare-fun d!9553 () Bool)

(assert (=> d!9553 e!30931))

(declare-fun res!27986 () Bool)

(assert (=> d!9553 (=> (not res!27986) (not e!30931))))

(assert (=> d!9553 (= res!27986 (isStrictlySorted!254 lt!20611))))

(declare-fun e!30927 () List!1281)

(assert (=> d!9553 (= lt!20611 e!30927)))

(get-info :version)

(assert (=> d!9553 (= c!6486 (and ((_ is Cons!1277) (toList!637 lm!267)) (bvslt (_1!886 (h!1857 (toList!637 lm!267))) key!657)))))

(assert (=> d!9553 (isStrictlySorted!254 (toList!637 lm!267))))

(assert (=> d!9553 (= (insertStrictlySorted!32 (toList!637 lm!267) key!657 value!242) lt!20611)))

(declare-fun b!48202 () Bool)

(assert (=> b!48202 (= e!30927 e!30929)))

(assert (=> b!48202 (= c!6485 (and ((_ is Cons!1277) (toList!637 lm!267)) (= (_1!886 (h!1857 (toList!637 lm!267))) key!657)))))

(declare-fun bm!3750 () Bool)

(assert (=> bm!3750 (= call!3754 call!3753)))

(declare-fun b!48203 () Bool)

(assert (=> b!48203 (= e!30930 (insertStrictlySorted!32 (t!4309 (toList!637 lm!267)) key!657 value!242))))

(declare-fun b!48204 () Bool)

(assert (=> b!48204 (= e!30931 (contains!603 lt!20611 (tuple2!1751 key!657 value!242)))))

(declare-fun bm!3751 () Bool)

(assert (=> bm!3751 (= call!3753 call!3752)))

(declare-fun b!48205 () Bool)

(assert (=> b!48205 (= c!6484 (and ((_ is Cons!1277) (toList!637 lm!267)) (bvsgt (_1!886 (h!1857 (toList!637 lm!267))) key!657)))))

(assert (=> b!48205 (= e!30929 e!30928)))

(declare-fun b!48206 () Bool)

(assert (=> b!48206 (= e!30927 call!3752)))

(assert (= (and d!9553 c!6486) b!48206))

(assert (= (and d!9553 (not c!6486)) b!48202))

(assert (= (and b!48202 c!6485) b!48201))

(assert (= (and b!48202 (not c!6485)) b!48205))

(assert (= (and b!48205 c!6484) b!48197))

(assert (= (and b!48205 (not c!6484)) b!48199))

(assert (= (or b!48197 b!48199) bm!3750))

(assert (= (or b!48201 bm!3750) bm!3751))

(assert (= (or b!48206 bm!3751) bm!3749))

(assert (= (and bm!3749 c!6483) b!48203))

(assert (= (and bm!3749 (not c!6483)) b!48200))

(assert (= (and d!9553 res!27986) b!48198))

(assert (= (and b!48198 res!27985) b!48204))

(declare-fun m!42147 () Bool)

(assert (=> d!9553 m!42147))

(assert (=> d!9553 m!42063))

(declare-fun m!42149 () Bool)

(assert (=> b!48203 m!42149))

(declare-fun m!42151 () Bool)

(assert (=> bm!3749 m!42151))

(declare-fun m!42153 () Bool)

(assert (=> b!48204 m!42153))

(declare-fun m!42155 () Bool)

(assert (=> b!48198 m!42155))

(assert (=> b!48112 d!9553))

(declare-fun d!9565 () Bool)

(declare-fun c!6497 () Bool)

(assert (=> d!9565 (= c!6497 ((_ is Nil!1278) (insertStrictlySorted!32 (toList!637 lm!267) key!657 value!242)))))

(declare-fun e!30944 () (InoxSet tuple2!1750))

(assert (=> d!9565 (= (content!47 (insertStrictlySorted!32 (toList!637 lm!267) key!657 value!242)) e!30944)))

(declare-fun b!48231 () Bool)

(assert (=> b!48231 (= e!30944 ((as const (Array tuple2!1750 Bool)) false))))

(declare-fun b!48232 () Bool)

(assert (=> b!48232 (= e!30944 ((_ map or) (store ((as const (Array tuple2!1750 Bool)) false) (h!1857 (insertStrictlySorted!32 (toList!637 lm!267) key!657 value!242)) true) (content!47 (t!4309 (insertStrictlySorted!32 (toList!637 lm!267) key!657 value!242)))))))

(assert (= (and d!9565 c!6497) b!48231))

(assert (= (and d!9565 (not c!6497)) b!48232))

(declare-fun m!42157 () Bool)

(assert (=> b!48232 m!42157))

(declare-fun m!42159 () Bool)

(assert (=> b!48232 m!42159))

(assert (=> b!48112 d!9565))

(declare-fun d!9567 () Bool)

(declare-fun c!6500 () Bool)

(assert (=> d!9567 (= c!6500 ((_ is Nil!1278) (toList!637 (+!74 lm!267 lt!20564))))))

(declare-fun e!30947 () (InoxSet tuple2!1750))

(assert (=> d!9567 (= (content!47 (toList!637 (+!74 lm!267 lt!20564))) e!30947)))

(declare-fun b!48237 () Bool)

(assert (=> b!48237 (= e!30947 ((as const (Array tuple2!1750 Bool)) false))))

(declare-fun b!48238 () Bool)

(assert (=> b!48238 (= e!30947 ((_ map or) (store ((as const (Array tuple2!1750 Bool)) false) (h!1857 (toList!637 (+!74 lm!267 lt!20564))) true) (content!47 (t!4309 (toList!637 (+!74 lm!267 lt!20564))))))))

(assert (= (and d!9567 c!6500) b!48237))

(assert (= (and d!9567 (not c!6500)) b!48238))

(declare-fun m!42161 () Bool)

(assert (=> b!48238 m!42161))

(declare-fun m!42163 () Bool)

(assert (=> b!48238 m!42163))

(assert (=> b!48112 d!9567))

(declare-fun d!9569 () Bool)

(declare-fun c!6501 () Bool)

(assert (=> d!9569 (= c!6501 ((_ is Nil!1278) (toList!637 lm!267)))))

(declare-fun e!30950 () (InoxSet tuple2!1750))

(assert (=> d!9569 (= (content!47 (toList!637 lm!267)) e!30950)))

(declare-fun b!48243 () Bool)

(assert (=> b!48243 (= e!30950 ((as const (Array tuple2!1750 Bool)) false))))

(declare-fun b!48244 () Bool)

(assert (=> b!48244 (= e!30950 ((_ map or) (store ((as const (Array tuple2!1750 Bool)) false) (h!1857 (toList!637 lm!267)) true) (content!47 (t!4309 (toList!637 lm!267)))))))

(assert (= (and d!9569 c!6501) b!48243))

(assert (= (and d!9569 (not c!6501)) b!48244))

(declare-fun m!42165 () Bool)

(assert (=> b!48244 m!42165))

(declare-fun m!42167 () Bool)

(assert (=> b!48244 m!42167))

(assert (=> b!48112 d!9569))

(declare-fun d!9571 () Bool)

(declare-fun res!28003 () Bool)

(declare-fun e!30965 () Bool)

(assert (=> d!9571 (=> res!28003 e!30965)))

(assert (=> d!9571 (= res!28003 (and ((_ is Cons!1277) (toList!637 lm!267)) (= (_1!886 (h!1857 (toList!637 lm!267))) key!657)))))

(assert (=> d!9571 (= (containsKey!103 (toList!637 lm!267) key!657) e!30965)))

(declare-fun b!48269 () Bool)

(declare-fun e!30966 () Bool)

(assert (=> b!48269 (= e!30965 e!30966)))

(declare-fun res!28004 () Bool)

(assert (=> b!48269 (=> (not res!28004) (not e!30966))))

(assert (=> b!48269 (= res!28004 (and (or (not ((_ is Cons!1277) (toList!637 lm!267))) (bvsle (_1!886 (h!1857 (toList!637 lm!267))) key!657)) ((_ is Cons!1277) (toList!637 lm!267)) (bvslt (_1!886 (h!1857 (toList!637 lm!267))) key!657)))))

(declare-fun b!48270 () Bool)

(assert (=> b!48270 (= e!30966 (containsKey!103 (t!4309 (toList!637 lm!267)) key!657))))

(assert (= (and d!9571 (not res!28003)) b!48269))

(assert (= (and b!48269 res!28004) b!48270))

(declare-fun m!42179 () Bool)

(assert (=> b!48270 m!42179))

(assert (=> b!48111 d!9571))

(declare-fun d!9575 () Bool)

(declare-fun res!28009 () Bool)

(declare-fun e!30971 () Bool)

(assert (=> d!9575 (=> res!28009 e!30971)))

(assert (=> d!9575 (= res!28009 (or ((_ is Nil!1278) (toList!637 lm!267)) ((_ is Nil!1278) (t!4309 (toList!637 lm!267)))))))

(assert (=> d!9575 (= (isStrictlySorted!254 (toList!637 lm!267)) e!30971)))

(declare-fun b!48275 () Bool)

(declare-fun e!30972 () Bool)

(assert (=> b!48275 (= e!30971 e!30972)))

(declare-fun res!28010 () Bool)

(assert (=> b!48275 (=> (not res!28010) (not e!30972))))

(assert (=> b!48275 (= res!28010 (bvslt (_1!886 (h!1857 (toList!637 lm!267))) (_1!886 (h!1857 (t!4309 (toList!637 lm!267))))))))

(declare-fun b!48276 () Bool)

(assert (=> b!48276 (= e!30972 (isStrictlySorted!254 (t!4309 (toList!637 lm!267))))))

(assert (= (and d!9575 (not res!28009)) b!48275))

(assert (= (and b!48275 res!28010) b!48276))

(declare-fun m!42191 () Bool)

(assert (=> b!48276 m!42191))

(assert (=> b!48110 d!9575))

(declare-fun d!9579 () Bool)

(declare-fun e!30986 () Bool)

(assert (=> d!9579 e!30986))

(declare-fun res!28025 () Bool)

(assert (=> d!9579 (=> res!28025 e!30986)))

(declare-fun lt!20650 () Bool)

(assert (=> d!9579 (= res!28025 (not lt!20650))))

(declare-fun lt!20649 () Bool)

(assert (=> d!9579 (= lt!20650 lt!20649)))

(declare-fun lt!20648 () Unit!1357)

(declare-fun e!30985 () Unit!1357)

(assert (=> d!9579 (= lt!20648 e!30985)))

(declare-fun c!6514 () Bool)

(assert (=> d!9579 (= c!6514 lt!20649)))

(assert (=> d!9579 (= lt!20649 (containsKey!103 (toList!637 lm!267) key!657))))

(assert (=> d!9579 (= (contains!601 lm!267 key!657) lt!20650)))

(declare-fun b!48299 () Bool)

(declare-fun lt!20651 () Unit!1357)

(assert (=> b!48299 (= e!30985 lt!20651)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!73 (List!1281 (_ BitVec 64)) Unit!1357)

(assert (=> b!48299 (= lt!20651 (lemmaContainsKeyImpliesGetValueByKeyDefined!73 (toList!637 lm!267) key!657))))

(declare-fun isDefined!74 (Option!122) Bool)

(assert (=> b!48299 (isDefined!74 (getValueByKey!116 (toList!637 lm!267) key!657))))

(declare-fun b!48300 () Bool)

(declare-fun Unit!1362 () Unit!1357)

(assert (=> b!48300 (= e!30985 Unit!1362)))

(declare-fun b!48301 () Bool)

(assert (=> b!48301 (= e!30986 (isDefined!74 (getValueByKey!116 (toList!637 lm!267) key!657)))))

(assert (= (and d!9579 c!6514) b!48299))

(assert (= (and d!9579 (not c!6514)) b!48300))

(assert (= (and d!9579 (not res!28025)) b!48301))

(assert (=> d!9579 m!42061))

(declare-fun m!42227 () Bool)

(assert (=> b!48299 m!42227))

(declare-fun m!42231 () Bool)

(assert (=> b!48299 m!42231))

(assert (=> b!48299 m!42231))

(declare-fun m!42233 () Bool)

(assert (=> b!48299 m!42233))

(assert (=> b!48301 m!42231))

(assert (=> b!48301 m!42231))

(assert (=> b!48301 m!42233))

(assert (=> start!7512 d!9579))

(declare-fun d!9591 () Bool)

(assert (=> d!9591 (= (inv!2237 lm!267) (isStrictlySorted!254 (toList!637 lm!267)))))

(declare-fun bs!2249 () Bool)

(assert (= bs!2249 d!9591))

(assert (=> bs!2249 m!42063))

(assert (=> start!7512 d!9591))

(declare-fun b!48321 () Bool)

(declare-fun e!31000 () Bool)

(declare-fun tp!6359 () Bool)

(assert (=> b!48321 (= e!31000 (and tp_is_empty!2079 tp!6359))))

(assert (=> b!48113 (= tp!6350 e!31000)))

(assert (= (and b!48113 ((_ is Cons!1277) (toList!637 lm!267))) b!48321))

(check-sat (not b!48301) (not b!48203) (not d!9549) (not d!9553) (not b!48321) (not d!9579) (not d!9591) (not b!48143) (not b!48238) (not b!48198) (not b!48142) (not b!48270) (not b!48204) (not d!9539) (not b!48232) (not b!48299) (not bm!3749) tp_is_empty!2079 (not b!48244) (not b!48276))
(check-sat)
