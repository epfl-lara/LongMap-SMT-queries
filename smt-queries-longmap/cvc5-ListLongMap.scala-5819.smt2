; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75046 () Bool)

(assert start!75046)

(declare-fun res!601177 () Bool)

(declare-fun e!492545 () Bool)

(assert (=> start!75046 (=> (not res!601177) (not e!492545))))

(declare-datatypes ((B!1232 0))(
  ( (B!1233 (val!8922 Int)) )
))
(declare-datatypes ((tuple2!11838 0))(
  ( (tuple2!11839 (_1!5930 (_ BitVec 64)) (_2!5930 B!1232)) )
))
(declare-datatypes ((List!17638 0))(
  ( (Nil!17635) (Cons!17634 (h!18765 tuple2!11838) (t!24915 List!17638)) )
))
(declare-datatypes ((ListLongMap!10607 0))(
  ( (ListLongMap!10608 (toList!5319 List!17638)) )
))
(declare-fun lm!210 () ListLongMap!10607)

(declare-fun isStrictlySorted!465 (List!17638) Bool)

(assert (=> start!75046 (= res!601177 (isStrictlySorted!465 (toList!5319 lm!210)))))

(assert (=> start!75046 e!492545))

(declare-fun e!492546 () Bool)

(declare-fun inv!29369 (ListLongMap!10607) Bool)

(assert (=> start!75046 (and (inv!29369 lm!210) e!492546)))

(assert (=> start!75046 true))

(declare-fun tp_is_empty!17743 () Bool)

(assert (=> start!75046 tp_is_empty!17743))

(declare-fun lt!400884 () tuple2!11838)

(declare-fun a!500 () (_ BitVec 64))

(declare-fun b1!76 () B!1232)

(declare-fun b!885021 () Bool)

(declare-fun +!2581 (ListLongMap!10607 tuple2!11838) ListLongMap!10607)

(assert (=> b!885021 (= e!492545 (not (= (+!2581 lm!210 lt!400884) (+!2581 (+!2581 lm!210 (tuple2!11839 a!500 b1!76)) lt!400884))))))

(declare-fun b2!54 () B!1232)

(assert (=> b!885021 (= lt!400884 (tuple2!11839 a!500 b2!54))))

(declare-fun insertStrictlySorted!282 (List!17638 (_ BitVec 64) B!1232) List!17638)

(assert (=> b!885021 (= (insertStrictlySorted!282 (insertStrictlySorted!282 (toList!5319 lm!210) a!500 b1!76) a!500 b2!54) (insertStrictlySorted!282 (toList!5319 lm!210) a!500 b2!54))))

(declare-datatypes ((Unit!30216 0))(
  ( (Unit!30217) )
))
(declare-fun lt!400885 () Unit!30216)

(declare-fun lemmaInsertStrictlySortedErasesIfSameKey!1 (List!17638 (_ BitVec 64) B!1232 B!1232) Unit!30216)

(assert (=> b!885021 (= lt!400885 (lemmaInsertStrictlySortedErasesIfSameKey!1 (toList!5319 lm!210) a!500 b1!76 b2!54))))

(declare-fun b!885022 () Bool)

(declare-fun tp!54212 () Bool)

(assert (=> b!885022 (= e!492546 tp!54212)))

(assert (= (and start!75046 res!601177) b!885021))

(assert (= start!75046 b!885022))

(declare-fun m!825253 () Bool)

(assert (=> start!75046 m!825253))

(declare-fun m!825255 () Bool)

(assert (=> start!75046 m!825255))

(declare-fun m!825257 () Bool)

(assert (=> b!885021 m!825257))

(declare-fun m!825259 () Bool)

(assert (=> b!885021 m!825259))

(declare-fun m!825261 () Bool)

(assert (=> b!885021 m!825261))

(declare-fun m!825263 () Bool)

(assert (=> b!885021 m!825263))

(declare-fun m!825265 () Bool)

(assert (=> b!885021 m!825265))

(assert (=> b!885021 m!825263))

(assert (=> b!885021 m!825259))

(declare-fun m!825267 () Bool)

(assert (=> b!885021 m!825267))

(declare-fun m!825269 () Bool)

(assert (=> b!885021 m!825269))

(push 1)

(assert (not start!75046))

(assert (not b!885021))

(assert (not b!885022))

(assert tp_is_empty!17743)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!109307 () Bool)

(declare-fun res!601193 () Bool)

(declare-fun e!492568 () Bool)

(assert (=> d!109307 (=> res!601193 e!492568)))

(assert (=> d!109307 (= res!601193 (or (is-Nil!17635 (toList!5319 lm!210)) (is-Nil!17635 (t!24915 (toList!5319 lm!210)))))))

(assert (=> d!109307 (= (isStrictlySorted!465 (toList!5319 lm!210)) e!492568)))

(declare-fun b!885044 () Bool)

(declare-fun e!492570 () Bool)

(assert (=> b!885044 (= e!492568 e!492570)))

(declare-fun res!601195 () Bool)

(assert (=> b!885044 (=> (not res!601195) (not e!492570))))

(assert (=> b!885044 (= res!601195 (bvslt (_1!5930 (h!18765 (toList!5319 lm!210))) (_1!5930 (h!18765 (t!24915 (toList!5319 lm!210))))))))

(declare-fun b!885046 () Bool)

(assert (=> b!885046 (= e!492570 (isStrictlySorted!465 (t!24915 (toList!5319 lm!210))))))

(assert (= (and d!109307 (not res!601193)) b!885044))

(assert (= (and b!885044 res!601195) b!885046))

(declare-fun m!825309 () Bool)

(assert (=> b!885046 m!825309))

(assert (=> start!75046 d!109307))

(declare-fun d!109315 () Bool)

(assert (=> d!109315 (= (inv!29369 lm!210) (isStrictlySorted!465 (toList!5319 lm!210)))))

(declare-fun bs!24808 () Bool)

(assert (= bs!24808 d!109315))

(assert (=> bs!24808 m!825253))

(assert (=> start!75046 d!109315))

(declare-fun b!885103 () Bool)

(declare-fun e!492602 () List!17638)

(declare-fun call!39039 () List!17638)

(assert (=> b!885103 (= e!492602 call!39039)))

(declare-fun b!885104 () Bool)

(declare-fun e!492603 () List!17638)

(assert (=> b!885104 (= e!492603 (insertStrictlySorted!282 (t!24915 (toList!5319 lm!210)) a!500 b2!54))))

(declare-fun e!492601 () Bool)

(declare-fun lt!400915 () List!17638)

(declare-fun b!885105 () Bool)

(declare-fun contains!4286 (List!17638 tuple2!11838) Bool)

(assert (=> b!885105 (= e!492601 (contains!4286 lt!400915 (tuple2!11839 a!500 b2!54)))))

(declare-fun d!109319 () Bool)

(assert (=> d!109319 e!492601))

(declare-fun res!601212 () Bool)

(assert (=> d!109319 (=> (not res!601212) (not e!492601))))

(assert (=> d!109319 (= res!601212 (isStrictlySorted!465 lt!400915))))

(assert (=> d!109319 (= lt!400915 e!492602)))

(declare-fun c!93206 () Bool)

(assert (=> d!109319 (= c!93206 (and (is-Cons!17634 (toList!5319 lm!210)) (bvslt (_1!5930 (h!18765 (toList!5319 lm!210))) a!500)))))

(assert (=> d!109319 (isStrictlySorted!465 (toList!5319 lm!210))))

(assert (=> d!109319 (= (insertStrictlySorted!282 (toList!5319 lm!210) a!500 b2!54) lt!400915)))

(declare-fun b!885106 () Bool)

(declare-fun e!492600 () List!17638)

(assert (=> b!885106 (= e!492602 e!492600)))

(declare-fun c!93208 () Bool)

(assert (=> b!885106 (= c!93208 (and (is-Cons!17634 (toList!5319 lm!210)) (= (_1!5930 (h!18765 (toList!5319 lm!210))) a!500)))))

(declare-fun b!885107 () Bool)

(declare-fun call!39040 () List!17638)

(assert (=> b!885107 (= e!492600 call!39040)))

(declare-fun c!93209 () Bool)

(declare-fun b!885108 () Bool)

(assert (=> b!885108 (= e!492603 (ite c!93208 (t!24915 (toList!5319 lm!210)) (ite c!93209 (Cons!17634 (h!18765 (toList!5319 lm!210)) (t!24915 (toList!5319 lm!210))) Nil!17635)))))

(declare-fun b!885109 () Bool)

(declare-fun e!492599 () List!17638)

(declare-fun call!39038 () List!17638)

(assert (=> b!885109 (= e!492599 call!39038)))

(declare-fun b!885110 () Bool)

(assert (=> b!885110 (= c!93209 (and (is-Cons!17634 (toList!5319 lm!210)) (bvsgt (_1!5930 (h!18765 (toList!5319 lm!210))) a!500)))))

(assert (=> b!885110 (= e!492600 e!492599)))

(declare-fun bm!39035 () Bool)

(assert (=> bm!39035 (= call!39040 call!39039)))

(declare-fun bm!39036 () Bool)

(declare-fun $colon$colon!540 (List!17638 tuple2!11838) List!17638)

(assert (=> bm!39036 (= call!39039 ($colon$colon!540 e!492603 (ite c!93206 (h!18765 (toList!5319 lm!210)) (tuple2!11839 a!500 b2!54))))))

(declare-fun c!93207 () Bool)

(assert (=> bm!39036 (= c!93207 c!93206)))

(declare-fun b!885111 () Bool)

(assert (=> b!885111 (= e!492599 call!39038)))

(declare-fun b!885112 () Bool)

(declare-fun res!601213 () Bool)

(assert (=> b!885112 (=> (not res!601213) (not e!492601))))

(declare-fun containsKey!405 (List!17638 (_ BitVec 64)) Bool)

(assert (=> b!885112 (= res!601213 (containsKey!405 lt!400915 a!500))))

(declare-fun bm!39037 () Bool)

(assert (=> bm!39037 (= call!39038 call!39040)))

(assert (= (and d!109319 c!93206) b!885103))

(assert (= (and d!109319 (not c!93206)) b!885106))

(assert (= (and b!885106 c!93208) b!885107))

(assert (= (and b!885106 (not c!93208)) b!885110))

(assert (= (and b!885110 c!93209) b!885109))

(assert (= (and b!885110 (not c!93209)) b!885111))

(assert (= (or b!885109 b!885111) bm!39037))

(assert (= (or b!885107 bm!39037) bm!39035))

(assert (= (or b!885103 bm!39035) bm!39036))

(assert (= (and bm!39036 c!93207) b!885104))

(assert (= (and bm!39036 (not c!93207)) b!885108))

(assert (= (and d!109319 res!601212) b!885112))

(assert (= (and b!885112 res!601213) b!885105))

(declare-fun m!825333 () Bool)

(assert (=> b!885112 m!825333))

(declare-fun m!825335 () Bool)

(assert (=> b!885104 m!825335))

(declare-fun m!825337 () Bool)

(assert (=> bm!39036 m!825337))

(declare-fun m!825339 () Bool)

(assert (=> b!885105 m!825339))

(declare-fun m!825341 () Bool)

(assert (=> d!109319 m!825341))

(assert (=> d!109319 m!825253))

(assert (=> b!885021 d!109319))

(declare-fun d!109325 () Bool)

(declare-fun e!492624 () Bool)

(assert (=> d!109325 e!492624))

(declare-fun res!601231 () Bool)

(assert (=> d!109325 (=> (not res!601231) (not e!492624))))

(declare-fun lt!400941 () ListLongMap!10607)

(declare-fun contains!4289 (ListLongMap!10607 (_ BitVec 64)) Bool)

(assert (=> d!109325 (= res!601231 (contains!4289 lt!400941 (_1!5930 (tuple2!11839 a!500 b1!76))))))

(declare-fun lt!400942 () List!17638)

(assert (=> d!109325 (= lt!400941 (ListLongMap!10608 lt!400942))))

(declare-fun lt!400940 () Unit!30216)

(declare-fun lt!400939 () Unit!30216)

(assert (=> d!109325 (= lt!400940 lt!400939)))

(declare-datatypes ((Option!437 0))(
  ( (Some!436 (v!11395 B!1232)) (None!435) )
))
(declare-fun getValueByKey!431 (List!17638 (_ BitVec 64)) Option!437)

(assert (=> d!109325 (= (getValueByKey!431 lt!400942 (_1!5930 (tuple2!11839 a!500 b1!76))) (Some!436 (_2!5930 (tuple2!11839 a!500 b1!76))))))

(declare-fun lemmaContainsTupThenGetReturnValue!245 (List!17638 (_ BitVec 64) B!1232) Unit!30216)

(assert (=> d!109325 (= lt!400939 (lemmaContainsTupThenGetReturnValue!245 lt!400942 (_1!5930 (tuple2!11839 a!500 b1!76)) (_2!5930 (tuple2!11839 a!500 b1!76))))))

(assert (=> d!109325 (= lt!400942 (insertStrictlySorted!282 (toList!5319 lm!210) (_1!5930 (tuple2!11839 a!500 b1!76)) (_2!5930 (tuple2!11839 a!500 b1!76))))))

(assert (=> d!109325 (= (+!2581 lm!210 (tuple2!11839 a!500 b1!76)) lt!400941)))

(declare-fun b!885153 () Bool)

(declare-fun res!601230 () Bool)

(assert (=> b!885153 (=> (not res!601230) (not e!492624))))

(assert (=> b!885153 (= res!601230 (= (getValueByKey!431 (toList!5319 lt!400941) (_1!5930 (tuple2!11839 a!500 b1!76))) (Some!436 (_2!5930 (tuple2!11839 a!500 b1!76)))))))

(declare-fun b!885154 () Bool)

(assert (=> b!885154 (= e!492624 (contains!4286 (toList!5319 lt!400941) (tuple2!11839 a!500 b1!76)))))

(assert (= (and d!109325 res!601231) b!885153))

(assert (= (and b!885153 res!601230) b!885154))

(declare-fun m!825361 () Bool)

(assert (=> d!109325 m!825361))

(declare-fun m!825365 () Bool)

(assert (=> d!109325 m!825365))

(declare-fun m!825369 () Bool)

(assert (=> d!109325 m!825369))

(declare-fun m!825371 () Bool)

(assert (=> d!109325 m!825371))

(declare-fun m!825373 () Bool)

(assert (=> b!885153 m!825373))

(declare-fun m!825375 () Bool)

(assert (=> b!885154 m!825375))

(assert (=> b!885021 d!109325))

(declare-fun d!109331 () Bool)

(assert (=> d!109331 (= (insertStrictlySorted!282 (insertStrictlySorted!282 (toList!5319 lm!210) a!500 b1!76) a!500 b2!54) (insertStrictlySorted!282 (toList!5319 lm!210) a!500 b2!54))))

(declare-fun lt!400965 () Unit!30216)

(declare-fun choose!1445 (List!17638 (_ BitVec 64) B!1232 B!1232) Unit!30216)

(assert (=> d!109331 (= lt!400965 (choose!1445 (toList!5319 lm!210) a!500 b1!76 b2!54))))

(assert (=> d!109331 (isStrictlySorted!465 (toList!5319 lm!210))))

(assert (=> d!109331 (= (lemmaInsertStrictlySortedErasesIfSameKey!1 (toList!5319 lm!210) a!500 b1!76 b2!54) lt!400965)))

(declare-fun bs!24810 () Bool)

(assert (= bs!24810 d!109331))

(assert (=> bs!24810 m!825269))

(assert (=> bs!24810 m!825263))

(declare-fun m!825437 () Bool)

(assert (=> bs!24810 m!825437))

(assert (=> bs!24810 m!825263))

(assert (=> bs!24810 m!825265))

(assert (=> bs!24810 m!825253))

(assert (=> b!885021 d!109331))

(declare-fun b!885183 () Bool)

(declare-fun e!492642 () List!17638)

(declare-fun call!39057 () List!17638)

(assert (=> b!885183 (= e!492642 call!39057)))

(declare-fun b!885184 () Bool)

(declare-fun e!492643 () List!17638)

(assert (=> b!885184 (= e!492643 (insertStrictlySorted!282 (t!24915 (toList!5319 lm!210)) a!500 b1!76))))

(declare-fun e!492641 () Bool)

(declare-fun b!885185 () Bool)

(declare-fun lt!400969 () List!17638)

(assert (=> b!885185 (= e!492641 (contains!4286 lt!400969 (tuple2!11839 a!500 b1!76)))))

(declare-fun d!109345 () Bool)

(assert (=> d!109345 e!492641))

(declare-fun res!601244 () Bool)

(assert (=> d!109345 (=> (not res!601244) (not e!492641))))

(assert (=> d!109345 (= res!601244 (isStrictlySorted!465 lt!400969))))

(assert (=> d!109345 (= lt!400969 e!492642)))

(declare-fun c!93230 () Bool)

(assert (=> d!109345 (= c!93230 (and (is-Cons!17634 (toList!5319 lm!210)) (bvslt (_1!5930 (h!18765 (toList!5319 lm!210))) a!500)))))

(assert (=> d!109345 (isStrictlySorted!465 (toList!5319 lm!210))))

(assert (=> d!109345 (= (insertStrictlySorted!282 (toList!5319 lm!210) a!500 b1!76) lt!400969)))

(declare-fun b!885186 () Bool)

(declare-fun e!492640 () List!17638)

(assert (=> b!885186 (= e!492642 e!492640)))

(declare-fun c!93232 () Bool)

(assert (=> b!885186 (= c!93232 (and (is-Cons!17634 (toList!5319 lm!210)) (= (_1!5930 (h!18765 (toList!5319 lm!210))) a!500)))))

(declare-fun b!885187 () Bool)

(declare-fun call!39058 () List!17638)

(assert (=> b!885187 (= e!492640 call!39058)))

(declare-fun c!93233 () Bool)

(declare-fun b!885188 () Bool)

(assert (=> b!885188 (= e!492643 (ite c!93232 (t!24915 (toList!5319 lm!210)) (ite c!93233 (Cons!17634 (h!18765 (toList!5319 lm!210)) (t!24915 (toList!5319 lm!210))) Nil!17635)))))

(declare-fun b!885189 () Bool)

(declare-fun e!492639 () List!17638)

(declare-fun call!39056 () List!17638)

(assert (=> b!885189 (= e!492639 call!39056)))

(declare-fun b!885190 () Bool)

(assert (=> b!885190 (= c!93233 (and (is-Cons!17634 (toList!5319 lm!210)) (bvsgt (_1!5930 (h!18765 (toList!5319 lm!210))) a!500)))))

(assert (=> b!885190 (= e!492640 e!492639)))

(declare-fun bm!39053 () Bool)

(assert (=> bm!39053 (= call!39058 call!39057)))

(declare-fun bm!39054 () Bool)

(assert (=> bm!39054 (= call!39057 ($colon$colon!540 e!492643 (ite c!93230 (h!18765 (toList!5319 lm!210)) (tuple2!11839 a!500 b1!76))))))

(declare-fun c!93231 () Bool)

(assert (=> bm!39054 (= c!93231 c!93230)))

(declare-fun b!885191 () Bool)

(assert (=> b!885191 (= e!492639 call!39056)))

(declare-fun b!885192 () Bool)

(declare-fun res!601245 () Bool)

(assert (=> b!885192 (=> (not res!601245) (not e!492641))))

(assert (=> b!885192 (= res!601245 (containsKey!405 lt!400969 a!500))))

(declare-fun bm!39055 () Bool)

(assert (=> bm!39055 (= call!39056 call!39058)))

(assert (= (and d!109345 c!93230) b!885183))

(assert (= (and d!109345 (not c!93230)) b!885186))

(assert (= (and b!885186 c!93232) b!885187))

(assert (= (and b!885186 (not c!93232)) b!885190))

(assert (= (and b!885190 c!93233) b!885189))

(assert (= (and b!885190 (not c!93233)) b!885191))

(assert (= (or b!885189 b!885191) bm!39055))

(assert (= (or b!885187 bm!39055) bm!39053))

(assert (= (or b!885183 bm!39053) bm!39054))

(assert (= (and bm!39054 c!93231) b!885184))

(assert (= (and bm!39054 (not c!93231)) b!885188))

(assert (= (and d!109345 res!601244) b!885192))

(assert (= (and b!885192 res!601245) b!885185))

(declare-fun m!825451 () Bool)

(assert (=> b!885192 m!825451))

(declare-fun m!825453 () Bool)

(assert (=> b!885184 m!825453))

(declare-fun m!825455 () Bool)

(assert (=> bm!39054 m!825455))

(declare-fun m!825459 () Bool)

(assert (=> b!885185 m!825459))

(declare-fun m!825461 () Bool)

(assert (=> d!109345 m!825461))

(assert (=> d!109345 m!825253))

(assert (=> b!885021 d!109345))

(declare-fun d!109349 () Bool)

(declare-fun e!492644 () Bool)

(assert (=> d!109349 e!492644))

(declare-fun res!601247 () Bool)

(assert (=> d!109349 (=> (not res!601247) (not e!492644))))

(declare-fun lt!400973 () ListLongMap!10607)

(assert (=> d!109349 (= res!601247 (contains!4289 lt!400973 (_1!5930 lt!400884)))))

(declare-fun lt!400974 () List!17638)

(assert (=> d!109349 (= lt!400973 (ListLongMap!10608 lt!400974))))

(declare-fun lt!400972 () Unit!30216)

(declare-fun lt!400971 () Unit!30216)

(assert (=> d!109349 (= lt!400972 lt!400971)))

(assert (=> d!109349 (= (getValueByKey!431 lt!400974 (_1!5930 lt!400884)) (Some!436 (_2!5930 lt!400884)))))

(assert (=> d!109349 (= lt!400971 (lemmaContainsTupThenGetReturnValue!245 lt!400974 (_1!5930 lt!400884) (_2!5930 lt!400884)))))

(assert (=> d!109349 (= lt!400974 (insertStrictlySorted!282 (toList!5319 lm!210) (_1!5930 lt!400884) (_2!5930 lt!400884)))))

(assert (=> d!109349 (= (+!2581 lm!210 lt!400884) lt!400973)))

(declare-fun b!885193 () Bool)

(declare-fun res!601246 () Bool)

(assert (=> b!885193 (=> (not res!601246) (not e!492644))))

(assert (=> b!885193 (= res!601246 (= (getValueByKey!431 (toList!5319 lt!400973) (_1!5930 lt!400884)) (Some!436 (_2!5930 lt!400884))))))

(declare-fun b!885194 () Bool)

(assert (=> b!885194 (= e!492644 (contains!4286 (toList!5319 lt!400973) lt!400884))))

(assert (= (and d!109349 res!601247) b!885193))

(assert (= (and b!885193 res!601246) b!885194))

(declare-fun m!825463 () Bool)

(assert (=> d!109349 m!825463))

(declare-fun m!825465 () Bool)

(assert (=> d!109349 m!825465))

(declare-fun m!825467 () Bool)

(assert (=> d!109349 m!825467))

(declare-fun m!825469 () Bool)

(assert (=> d!109349 m!825469))

(declare-fun m!825471 () Bool)

(assert (=> b!885193 m!825471))

(declare-fun m!825473 () Bool)

(assert (=> b!885194 m!825473))

(assert (=> b!885021 d!109349))

(declare-fun d!109353 () Bool)

(declare-fun e!492650 () Bool)

(assert (=> d!109353 e!492650))

(declare-fun res!601251 () Bool)

(assert (=> d!109353 (=> (not res!601251) (not e!492650))))

(declare-fun lt!400978 () ListLongMap!10607)

(assert (=> d!109353 (= res!601251 (contains!4289 lt!400978 (_1!5930 lt!400884)))))

(declare-fun lt!400979 () List!17638)

(assert (=> d!109353 (= lt!400978 (ListLongMap!10608 lt!400979))))

(declare-fun lt!400977 () Unit!30216)

(declare-fun lt!400976 () Unit!30216)

(assert (=> d!109353 (= lt!400977 lt!400976)))

(assert (=> d!109353 (= (getValueByKey!431 lt!400979 (_1!5930 lt!400884)) (Some!436 (_2!5930 lt!400884)))))

(assert (=> d!109353 (= lt!400976 (lemmaContainsTupThenGetReturnValue!245 lt!400979 (_1!5930 lt!400884) (_2!5930 lt!400884)))))

(assert (=> d!109353 (= lt!400979 (insertStrictlySorted!282 (toList!5319 (+!2581 lm!210 (tuple2!11839 a!500 b1!76))) (_1!5930 lt!400884) (_2!5930 lt!400884)))))

(assert (=> d!109353 (= (+!2581 (+!2581 lm!210 (tuple2!11839 a!500 b1!76)) lt!400884) lt!400978)))

(declare-fun b!885205 () Bool)

(declare-fun res!601250 () Bool)

(assert (=> b!885205 (=> (not res!601250) (not e!492650))))

(assert (=> b!885205 (= res!601250 (= (getValueByKey!431 (toList!5319 lt!400978) (_1!5930 lt!400884)) (Some!436 (_2!5930 lt!400884))))))

(declare-fun b!885206 () Bool)

(assert (=> b!885206 (= e!492650 (contains!4286 (toList!5319 lt!400978) lt!400884))))

(assert (= (and d!109353 res!601251) b!885205))

(assert (= (and b!885205 res!601250) b!885206))

(declare-fun m!825485 () Bool)

(assert (=> d!109353 m!825485))

(declare-fun m!825487 () Bool)

(assert (=> d!109353 m!825487))

(declare-fun m!825489 () Bool)

(assert (=> d!109353 m!825489))

(declare-fun m!825491 () Bool)

(assert (=> d!109353 m!825491))

(declare-fun m!825493 () Bool)

(assert (=> b!885205 m!825493))

(declare-fun m!825495 () Bool)

(assert (=> b!885206 m!825495))

(assert (=> b!885021 d!109353))

(declare-fun b!885221 () Bool)

(declare-fun e!492663 () List!17638)

(declare-fun call!39066 () List!17638)

(assert (=> b!885221 (= e!492663 call!39066)))

(declare-fun b!885222 () Bool)

(declare-fun e!492664 () List!17638)

(assert (=> b!885222 (= e!492664 (insertStrictlySorted!282 (t!24915 (insertStrictlySorted!282 (toList!5319 lm!210) a!500 b1!76)) a!500 b2!54))))

(declare-fun lt!400981 () List!17638)

(declare-fun b!885223 () Bool)

(declare-fun e!492662 () Bool)

(assert (=> b!885223 (= e!492662 (contains!4286 lt!400981 (tuple2!11839 a!500 b2!54)))))

(declare-fun d!109357 () Bool)

(assert (=> d!109357 e!492662))

(declare-fun res!601258 () Bool)

(assert (=> d!109357 (=> (not res!601258) (not e!492662))))

(assert (=> d!109357 (= res!601258 (isStrictlySorted!465 lt!400981))))

(assert (=> d!109357 (= lt!400981 e!492663)))

(declare-fun c!93242 () Bool)

(assert (=> d!109357 (= c!93242 (and (is-Cons!17634 (insertStrictlySorted!282 (toList!5319 lm!210) a!500 b1!76)) (bvslt (_1!5930 (h!18765 (insertStrictlySorted!282 (toList!5319 lm!210) a!500 b1!76))) a!500)))))

(assert (=> d!109357 (isStrictlySorted!465 (insertStrictlySorted!282 (toList!5319 lm!210) a!500 b1!76))))

(assert (=> d!109357 (= (insertStrictlySorted!282 (insertStrictlySorted!282 (toList!5319 lm!210) a!500 b1!76) a!500 b2!54) lt!400981)))

(declare-fun b!885224 () Bool)

(declare-fun e!492661 () List!17638)

(assert (=> b!885224 (= e!492663 e!492661)))

(declare-fun c!93244 () Bool)

(assert (=> b!885224 (= c!93244 (and (is-Cons!17634 (insertStrictlySorted!282 (toList!5319 lm!210) a!500 b1!76)) (= (_1!5930 (h!18765 (insertStrictlySorted!282 (toList!5319 lm!210) a!500 b1!76))) a!500)))))

(declare-fun b!885225 () Bool)

(declare-fun call!39067 () List!17638)

(assert (=> b!885225 (= e!492661 call!39067)))

(declare-fun c!93245 () Bool)

(declare-fun b!885226 () Bool)

(assert (=> b!885226 (= e!492664 (ite c!93244 (t!24915 (insertStrictlySorted!282 (toList!5319 lm!210) a!500 b1!76)) (ite c!93245 (Cons!17634 (h!18765 (insertStrictlySorted!282 (toList!5319 lm!210) a!500 b1!76)) (t!24915 (insertStrictlySorted!282 (toList!5319 lm!210) a!500 b1!76))) Nil!17635)))))

(declare-fun b!885227 () Bool)

(declare-fun e!492660 () List!17638)

(declare-fun call!39065 () List!17638)

(assert (=> b!885227 (= e!492660 call!39065)))

(declare-fun b!885228 () Bool)

(assert (=> b!885228 (= c!93245 (and (is-Cons!17634 (insertStrictlySorted!282 (toList!5319 lm!210) a!500 b1!76)) (bvsgt (_1!5930 (h!18765 (insertStrictlySorted!282 (toList!5319 lm!210) a!500 b1!76))) a!500)))))

(assert (=> b!885228 (= e!492661 e!492660)))

(declare-fun bm!39062 () Bool)

(assert (=> bm!39062 (= call!39067 call!39066)))

(declare-fun bm!39063 () Bool)

(assert (=> bm!39063 (= call!39066 ($colon$colon!540 e!492664 (ite c!93242 (h!18765 (insertStrictlySorted!282 (toList!5319 lm!210) a!500 b1!76)) (tuple2!11839 a!500 b2!54))))))

(declare-fun c!93243 () Bool)

(assert (=> bm!39063 (= c!93243 c!93242)))

(declare-fun b!885229 () Bool)

(assert (=> b!885229 (= e!492660 call!39065)))

(declare-fun b!885230 () Bool)

(declare-fun res!601259 () Bool)

(assert (=> b!885230 (=> (not res!601259) (not e!492662))))

(assert (=> b!885230 (= res!601259 (containsKey!405 lt!400981 a!500))))

(declare-fun bm!39064 () Bool)

(assert (=> bm!39064 (= call!39065 call!39067)))

(assert (= (and d!109357 c!93242) b!885221))

(assert (= (and d!109357 (not c!93242)) b!885224))

(assert (= (and b!885224 c!93244) b!885225))

(assert (= (and b!885224 (not c!93244)) b!885228))

(assert (= (and b!885228 c!93245) b!885227))

(assert (= (and b!885228 (not c!93245)) b!885229))

(assert (= (or b!885227 b!885229) bm!39064))

(assert (= (or b!885225 bm!39064) bm!39062))

(assert (= (or b!885221 bm!39062) bm!39063))

(assert (= (and bm!39063 c!93243) b!885222))

(assert (= (and bm!39063 (not c!93243)) b!885226))

(assert (= (and d!109357 res!601258) b!885230))

(assert (= (and b!885230 res!601259) b!885223))

(declare-fun m!825509 () Bool)

(assert (=> b!885230 m!825509))

(declare-fun m!825511 () Bool)

(assert (=> b!885222 m!825511))

(declare-fun m!825513 () Bool)

(assert (=> bm!39063 m!825513))

(declare-fun m!825515 () Bool)

(assert (=> b!885223 m!825515))

(declare-fun m!825517 () Bool)

(assert (=> d!109357 m!825517))

(assert (=> d!109357 m!825263))

(declare-fun m!825519 () Bool)

(assert (=> d!109357 m!825519))

(assert (=> b!885021 d!109357))

(declare-fun b!885242 () Bool)

(declare-fun e!492672 () Bool)

(declare-fun tp!54224 () Bool)

(assert (=> b!885242 (= e!492672 (and tp_is_empty!17743 tp!54224))))

(assert (=> b!885022 (= tp!54212 e!492672)))

(assert (= (and b!885022 (is-Cons!17634 (toList!5319 lm!210))) b!885242))

(push 1)

