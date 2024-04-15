; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103504 () Bool)

(assert start!103504)

(declare-fun res!827708 () Bool)

(declare-fun e!703088 () Bool)

(assert (=> start!103504 (=> (not res!827708) (not e!703088))))

(declare-fun a1!66 () (_ BitVec 64))

(declare-fun a2!55 () (_ BitVec 64))

(assert (=> start!103504 (= res!827708 (not (= a1!66 a2!55)))))

(assert (=> start!103504 e!703088))

(assert (=> start!103504 true))

(declare-datatypes ((B!1796 0))(
  ( (B!1797 (val!15660 Int)) )
))
(declare-datatypes ((tuple2!20276 0))(
  ( (tuple2!20277 (_1!10149 (_ BitVec 64)) (_2!10149 B!1796)) )
))
(declare-datatypes ((List!27387 0))(
  ( (Nil!27384) (Cons!27383 (h!28592 tuple2!20276) (t!40841 List!27387)) )
))
(declare-datatypes ((ListLongMap!18245 0))(
  ( (ListLongMap!18246 (toList!9138 List!27387)) )
))
(declare-fun lm!211 () ListLongMap!18245)

(declare-fun e!703089 () Bool)

(declare-fun inv!42773 (ListLongMap!18245) Bool)

(assert (=> start!103504 (and (inv!42773 lm!211) e!703089)))

(declare-fun tp_is_empty!31195 () Bool)

(assert (=> start!103504 tp_is_empty!31195))

(declare-fun b!1240424 () Bool)

(declare-fun res!827709 () Bool)

(assert (=> b!1240424 (=> (not res!827709) (not e!703088))))

(declare-fun isStrictlySorted!729 (List!27387) Bool)

(assert (=> b!1240424 (= res!827709 (isStrictlySorted!729 (toList!9138 lm!211)))))

(declare-fun b!1240425 () Bool)

(declare-fun lt!561750 () tuple2!20276)

(declare-fun -!1944 (ListLongMap!18245 (_ BitVec 64)) ListLongMap!18245)

(declare-fun +!4180 (ListLongMap!18245 tuple2!20276) ListLongMap!18245)

(assert (=> b!1240425 (= e!703088 (not (= (-!1944 (+!4180 lm!211 lt!561750) a2!55) (+!4180 (-!1944 lm!211 a2!55) lt!561750))))))

(declare-fun b1!77 () B!1796)

(assert (=> b!1240425 (= lt!561750 (tuple2!20277 a1!66 b1!77))))

(declare-fun insertStrictlySorted!420 (List!27387 (_ BitVec 64) B!1796) List!27387)

(declare-fun removeStrictlySorted!112 (List!27387 (_ BitVec 64)) List!27387)

(assert (=> b!1240425 (= (insertStrictlySorted!420 (removeStrictlySorted!112 (toList!9138 lm!211) a2!55) a1!66 b1!77) (removeStrictlySorted!112 (insertStrictlySorted!420 (toList!9138 lm!211) a1!66 b1!77) a2!55))))

(declare-datatypes ((Unit!41076 0))(
  ( (Unit!41077) )
))
(declare-fun lt!561749 () Unit!41076)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!1 (List!27387 (_ BitVec 64) B!1796 (_ BitVec 64)) Unit!41076)

(assert (=> b!1240425 (= lt!561749 (lemmaInsertAndRemoveStrictlySortedCommutative!1 (toList!9138 lm!211) a1!66 b1!77 a2!55))))

(declare-fun b!1240426 () Bool)

(declare-fun tp!92537 () Bool)

(assert (=> b!1240426 (= e!703089 tp!92537)))

(assert (= (and start!103504 res!827708) b!1240424))

(assert (= (and b!1240424 res!827709) b!1240425))

(assert (= start!103504 b!1240426))

(declare-fun m!1143231 () Bool)

(assert (=> start!103504 m!1143231))

(declare-fun m!1143233 () Bool)

(assert (=> b!1240424 m!1143233))

(declare-fun m!1143235 () Bool)

(assert (=> b!1240425 m!1143235))

(declare-fun m!1143237 () Bool)

(assert (=> b!1240425 m!1143237))

(declare-fun m!1143239 () Bool)

(assert (=> b!1240425 m!1143239))

(declare-fun m!1143241 () Bool)

(assert (=> b!1240425 m!1143241))

(declare-fun m!1143243 () Bool)

(assert (=> b!1240425 m!1143243))

(declare-fun m!1143245 () Bool)

(assert (=> b!1240425 m!1143245))

(assert (=> b!1240425 m!1143241))

(declare-fun m!1143247 () Bool)

(assert (=> b!1240425 m!1143247))

(assert (=> b!1240425 m!1143235))

(declare-fun m!1143249 () Bool)

(assert (=> b!1240425 m!1143249))

(assert (=> b!1240425 m!1143243))

(assert (=> b!1240425 m!1143249))

(declare-fun m!1143251 () Bool)

(assert (=> b!1240425 m!1143251))

(check-sat (not start!103504) tp_is_empty!31195 (not b!1240426) (not b!1240424) (not b!1240425))
(check-sat)
(get-model)

(declare-fun b!1240501 () Bool)

(declare-fun e!703132 () List!27387)

(declare-fun call!61127 () List!27387)

(assert (=> b!1240501 (= e!703132 call!61127)))

(declare-fun b!1240502 () Bool)

(declare-fun e!703131 () List!27387)

(assert (=> b!1240502 (= e!703132 e!703131)))

(declare-fun c!121220 () Bool)

(get-info :version)

(assert (=> b!1240502 (= c!121220 (and ((_ is Cons!27383) (removeStrictlySorted!112 (toList!9138 lm!211) a2!55)) (= (_1!10149 (h!28592 (removeStrictlySorted!112 (toList!9138 lm!211) a2!55))) a1!66)))))

(declare-fun b!1240503 () Bool)

(declare-fun e!703130 () List!27387)

(declare-fun call!61126 () List!27387)

(assert (=> b!1240503 (= e!703130 call!61126)))

(declare-fun d!136169 () Bool)

(declare-fun e!703133 () Bool)

(assert (=> d!136169 e!703133))

(declare-fun res!827738 () Bool)

(assert (=> d!136169 (=> (not res!827738) (not e!703133))))

(declare-fun lt!561780 () List!27387)

(assert (=> d!136169 (= res!827738 (isStrictlySorted!729 lt!561780))))

(assert (=> d!136169 (= lt!561780 e!703132)))

(declare-fun c!121221 () Bool)

(assert (=> d!136169 (= c!121221 (and ((_ is Cons!27383) (removeStrictlySorted!112 (toList!9138 lm!211) a2!55)) (bvslt (_1!10149 (h!28592 (removeStrictlySorted!112 (toList!9138 lm!211) a2!55))) a1!66)))))

(assert (=> d!136169 (isStrictlySorted!729 (removeStrictlySorted!112 (toList!9138 lm!211) a2!55))))

(assert (=> d!136169 (= (insertStrictlySorted!420 (removeStrictlySorted!112 (toList!9138 lm!211) a2!55) a1!66 b1!77) lt!561780)))

(declare-fun b!1240504 () Bool)

(declare-fun res!827739 () Bool)

(assert (=> b!1240504 (=> (not res!827739) (not e!703133))))

(declare-fun containsKey!598 (List!27387 (_ BitVec 64)) Bool)

(assert (=> b!1240504 (= res!827739 (containsKey!598 lt!561780 a1!66))))

(declare-fun b!1240505 () Bool)

(assert (=> b!1240505 (= e!703130 call!61126)))

(declare-fun bm!61123 () Bool)

(declare-fun call!61128 () List!27387)

(assert (=> bm!61123 (= call!61126 call!61128)))

(declare-fun e!703134 () List!27387)

(declare-fun b!1240506 () Bool)

(assert (=> b!1240506 (= e!703134 (insertStrictlySorted!420 (t!40841 (removeStrictlySorted!112 (toList!9138 lm!211) a2!55)) a1!66 b1!77))))

(declare-fun c!121222 () Bool)

(declare-fun b!1240507 () Bool)

(assert (=> b!1240507 (= c!121222 (and ((_ is Cons!27383) (removeStrictlySorted!112 (toList!9138 lm!211) a2!55)) (bvsgt (_1!10149 (h!28592 (removeStrictlySorted!112 (toList!9138 lm!211) a2!55))) a1!66)))))

(assert (=> b!1240507 (= e!703131 e!703130)))

(declare-fun bm!61124 () Bool)

(declare-fun $colon$colon!615 (List!27387 tuple2!20276) List!27387)

(assert (=> bm!61124 (= call!61127 ($colon$colon!615 e!703134 (ite c!121221 (h!28592 (removeStrictlySorted!112 (toList!9138 lm!211) a2!55)) (tuple2!20277 a1!66 b1!77))))))

(declare-fun c!121219 () Bool)

(assert (=> bm!61124 (= c!121219 c!121221)))

(declare-fun bm!61125 () Bool)

(assert (=> bm!61125 (= call!61128 call!61127)))

(declare-fun b!1240508 () Bool)

(assert (=> b!1240508 (= e!703131 call!61128)))

(declare-fun b!1240509 () Bool)

(declare-fun contains!7353 (List!27387 tuple2!20276) Bool)

(assert (=> b!1240509 (= e!703133 (contains!7353 lt!561780 (tuple2!20277 a1!66 b1!77)))))

(declare-fun b!1240510 () Bool)

(assert (=> b!1240510 (= e!703134 (ite c!121220 (t!40841 (removeStrictlySorted!112 (toList!9138 lm!211) a2!55)) (ite c!121222 (Cons!27383 (h!28592 (removeStrictlySorted!112 (toList!9138 lm!211) a2!55)) (t!40841 (removeStrictlySorted!112 (toList!9138 lm!211) a2!55))) Nil!27384)))))

(assert (= (and d!136169 c!121221) b!1240501))

(assert (= (and d!136169 (not c!121221)) b!1240502))

(assert (= (and b!1240502 c!121220) b!1240508))

(assert (= (and b!1240502 (not c!121220)) b!1240507))

(assert (= (and b!1240507 c!121222) b!1240503))

(assert (= (and b!1240507 (not c!121222)) b!1240505))

(assert (= (or b!1240503 b!1240505) bm!61123))

(assert (= (or b!1240508 bm!61123) bm!61125))

(assert (= (or b!1240501 bm!61125) bm!61124))

(assert (= (and bm!61124 c!121219) b!1240506))

(assert (= (and bm!61124 (not c!121219)) b!1240510))

(assert (= (and d!136169 res!827738) b!1240504))

(assert (= (and b!1240504 res!827739) b!1240509))

(declare-fun m!1143321 () Bool)

(assert (=> d!136169 m!1143321))

(assert (=> d!136169 m!1143235))

(declare-fun m!1143323 () Bool)

(assert (=> d!136169 m!1143323))

(declare-fun m!1143325 () Bool)

(assert (=> b!1240504 m!1143325))

(declare-fun m!1143327 () Bool)

(assert (=> bm!61124 m!1143327))

(declare-fun m!1143329 () Bool)

(assert (=> b!1240506 m!1143329))

(declare-fun m!1143331 () Bool)

(assert (=> b!1240509 m!1143331))

(assert (=> b!1240425 d!136169))

(declare-fun b!1240551 () Bool)

(declare-fun e!703159 () Bool)

(declare-fun lt!561791 () List!27387)

(assert (=> b!1240551 (= e!703159 (not (containsKey!598 lt!561791 a2!55)))))

(declare-fun b!1240552 () Bool)

(declare-fun e!703158 () List!27387)

(assert (=> b!1240552 (= e!703158 (t!40841 (insertStrictlySorted!420 (toList!9138 lm!211) a1!66 b1!77)))))

(declare-fun b!1240553 () Bool)

(declare-fun e!703157 () List!27387)

(assert (=> b!1240553 (= e!703157 ($colon$colon!615 (removeStrictlySorted!112 (t!40841 (insertStrictlySorted!420 (toList!9138 lm!211) a1!66 b1!77)) a2!55) (h!28592 (insertStrictlySorted!420 (toList!9138 lm!211) a1!66 b1!77))))))

(declare-fun b!1240554 () Bool)

(assert (=> b!1240554 (= e!703157 Nil!27384)))

(declare-fun b!1240555 () Bool)

(assert (=> b!1240555 (= e!703158 e!703157)))

(declare-fun c!121240 () Bool)

(assert (=> b!1240555 (= c!121240 (and ((_ is Cons!27383) (insertStrictlySorted!420 (toList!9138 lm!211) a1!66 b1!77)) (not (= (_1!10149 (h!28592 (insertStrictlySorted!420 (toList!9138 lm!211) a1!66 b1!77))) a2!55))))))

(declare-fun d!136175 () Bool)

(assert (=> d!136175 e!703159))

(declare-fun res!827748 () Bool)

(assert (=> d!136175 (=> (not res!827748) (not e!703159))))

(assert (=> d!136175 (= res!827748 (isStrictlySorted!729 lt!561791))))

(assert (=> d!136175 (= lt!561791 e!703158)))

(declare-fun c!121239 () Bool)

(assert (=> d!136175 (= c!121239 (and ((_ is Cons!27383) (insertStrictlySorted!420 (toList!9138 lm!211) a1!66 b1!77)) (= (_1!10149 (h!28592 (insertStrictlySorted!420 (toList!9138 lm!211) a1!66 b1!77))) a2!55)))))

(assert (=> d!136175 (isStrictlySorted!729 (insertStrictlySorted!420 (toList!9138 lm!211) a1!66 b1!77))))

(assert (=> d!136175 (= (removeStrictlySorted!112 (insertStrictlySorted!420 (toList!9138 lm!211) a1!66 b1!77) a2!55) lt!561791)))

(assert (= (and d!136175 c!121239) b!1240552))

(assert (= (and d!136175 (not c!121239)) b!1240555))

(assert (= (and b!1240555 c!121240) b!1240553))

(assert (= (and b!1240555 (not c!121240)) b!1240554))

(assert (= (and d!136175 res!827748) b!1240551))

(declare-fun m!1143339 () Bool)

(assert (=> b!1240551 m!1143339))

(declare-fun m!1143341 () Bool)

(assert (=> b!1240553 m!1143341))

(assert (=> b!1240553 m!1143341))

(declare-fun m!1143343 () Bool)

(assert (=> b!1240553 m!1143343))

(declare-fun m!1143345 () Bool)

(assert (=> d!136175 m!1143345))

(assert (=> d!136175 m!1143241))

(declare-fun m!1143347 () Bool)

(assert (=> d!136175 m!1143347))

(assert (=> b!1240425 d!136175))

(declare-fun b!1240566 () Bool)

(declare-fun e!703167 () Bool)

(declare-fun lt!561793 () List!27387)

(assert (=> b!1240566 (= e!703167 (not (containsKey!598 lt!561793 a2!55)))))

(declare-fun b!1240567 () Bool)

(declare-fun e!703166 () List!27387)

(assert (=> b!1240567 (= e!703166 (t!40841 (toList!9138 lm!211)))))

(declare-fun b!1240568 () Bool)

(declare-fun e!703165 () List!27387)

(assert (=> b!1240568 (= e!703165 ($colon$colon!615 (removeStrictlySorted!112 (t!40841 (toList!9138 lm!211)) a2!55) (h!28592 (toList!9138 lm!211))))))

(declare-fun b!1240569 () Bool)

(assert (=> b!1240569 (= e!703165 Nil!27384)))

(declare-fun b!1240570 () Bool)

(assert (=> b!1240570 (= e!703166 e!703165)))

(declare-fun c!121246 () Bool)

(assert (=> b!1240570 (= c!121246 (and ((_ is Cons!27383) (toList!9138 lm!211)) (not (= (_1!10149 (h!28592 (toList!9138 lm!211))) a2!55))))))

(declare-fun d!136181 () Bool)

(assert (=> d!136181 e!703167))

(declare-fun res!827751 () Bool)

(assert (=> d!136181 (=> (not res!827751) (not e!703167))))

(assert (=> d!136181 (= res!827751 (isStrictlySorted!729 lt!561793))))

(assert (=> d!136181 (= lt!561793 e!703166)))

(declare-fun c!121245 () Bool)

(assert (=> d!136181 (= c!121245 (and ((_ is Cons!27383) (toList!9138 lm!211)) (= (_1!10149 (h!28592 (toList!9138 lm!211))) a2!55)))))

(assert (=> d!136181 (isStrictlySorted!729 (toList!9138 lm!211))))

(assert (=> d!136181 (= (removeStrictlySorted!112 (toList!9138 lm!211) a2!55) lt!561793)))

(assert (= (and d!136181 c!121245) b!1240567))

(assert (= (and d!136181 (not c!121245)) b!1240570))

(assert (= (and b!1240570 c!121246) b!1240568))

(assert (= (and b!1240570 (not c!121246)) b!1240569))

(assert (= (and d!136181 res!827751) b!1240566))

(declare-fun m!1143349 () Bool)

(assert (=> b!1240566 m!1143349))

(declare-fun m!1143351 () Bool)

(assert (=> b!1240568 m!1143351))

(assert (=> b!1240568 m!1143351))

(declare-fun m!1143355 () Bool)

(assert (=> b!1240568 m!1143355))

(declare-fun m!1143359 () Bool)

(assert (=> d!136181 m!1143359))

(assert (=> d!136181 m!1143233))

(assert (=> b!1240425 d!136181))

(declare-fun d!136183 () Bool)

(declare-fun e!703184 () Bool)

(assert (=> d!136183 e!703184))

(declare-fun res!827765 () Bool)

(assert (=> d!136183 (=> (not res!827765) (not e!703184))))

(declare-fun lt!561820 () ListLongMap!18245)

(declare-fun contains!7355 (ListLongMap!18245 (_ BitVec 64)) Bool)

(assert (=> d!136183 (= res!827765 (contains!7355 lt!561820 (_1!10149 lt!561750)))))

(declare-fun lt!561819 () List!27387)

(assert (=> d!136183 (= lt!561820 (ListLongMap!18246 lt!561819))))

(declare-fun lt!561818 () Unit!41076)

(declare-fun lt!561817 () Unit!41076)

(assert (=> d!136183 (= lt!561818 lt!561817)))

(declare-datatypes ((Option!703 0))(
  ( (Some!702 (v!18370 B!1796)) (None!701) )
))
(declare-fun getValueByKey!652 (List!27387 (_ BitVec 64)) Option!703)

(assert (=> d!136183 (= (getValueByKey!652 lt!561819 (_1!10149 lt!561750)) (Some!702 (_2!10149 lt!561750)))))

(declare-fun lemmaContainsTupThenGetReturnValue!328 (List!27387 (_ BitVec 64) B!1796) Unit!41076)

(assert (=> d!136183 (= lt!561817 (lemmaContainsTupThenGetReturnValue!328 lt!561819 (_1!10149 lt!561750) (_2!10149 lt!561750)))))

(assert (=> d!136183 (= lt!561819 (insertStrictlySorted!420 (toList!9138 (-!1944 lm!211 a2!55)) (_1!10149 lt!561750) (_2!10149 lt!561750)))))

(assert (=> d!136183 (= (+!4180 (-!1944 lm!211 a2!55) lt!561750) lt!561820)))

(declare-fun b!1240599 () Bool)

(declare-fun res!827764 () Bool)

(assert (=> b!1240599 (=> (not res!827764) (not e!703184))))

(assert (=> b!1240599 (= res!827764 (= (getValueByKey!652 (toList!9138 lt!561820) (_1!10149 lt!561750)) (Some!702 (_2!10149 lt!561750))))))

(declare-fun b!1240600 () Bool)

(assert (=> b!1240600 (= e!703184 (contains!7353 (toList!9138 lt!561820) lt!561750))))

(assert (= (and d!136183 res!827765) b!1240599))

(assert (= (and b!1240599 res!827764) b!1240600))

(declare-fun m!1143389 () Bool)

(assert (=> d!136183 m!1143389))

(declare-fun m!1143391 () Bool)

(assert (=> d!136183 m!1143391))

(declare-fun m!1143393 () Bool)

(assert (=> d!136183 m!1143393))

(declare-fun m!1143395 () Bool)

(assert (=> d!136183 m!1143395))

(declare-fun m!1143397 () Bool)

(assert (=> b!1240599 m!1143397))

(declare-fun m!1143399 () Bool)

(assert (=> b!1240600 m!1143399))

(assert (=> b!1240425 d!136183))

(declare-fun d!136193 () Bool)

(declare-fun lt!561840 () ListLongMap!18245)

(assert (=> d!136193 (not (contains!7355 lt!561840 a2!55))))

(assert (=> d!136193 (= lt!561840 (ListLongMap!18246 (removeStrictlySorted!112 (toList!9138 (+!4180 lm!211 lt!561750)) a2!55)))))

(assert (=> d!136193 (= (-!1944 (+!4180 lm!211 lt!561750) a2!55) lt!561840)))

(declare-fun bs!34889 () Bool)

(assert (= bs!34889 d!136193))

(declare-fun m!1143459 () Bool)

(assert (=> bs!34889 m!1143459))

(declare-fun m!1143461 () Bool)

(assert (=> bs!34889 m!1143461))

(assert (=> b!1240425 d!136193))

(declare-fun d!136207 () Bool)

(declare-fun lt!561841 () ListLongMap!18245)

(assert (=> d!136207 (not (contains!7355 lt!561841 a2!55))))

(assert (=> d!136207 (= lt!561841 (ListLongMap!18246 (removeStrictlySorted!112 (toList!9138 lm!211) a2!55)))))

(assert (=> d!136207 (= (-!1944 lm!211 a2!55) lt!561841)))

(declare-fun bs!34890 () Bool)

(assert (= bs!34890 d!136207))

(declare-fun m!1143463 () Bool)

(assert (=> bs!34890 m!1143463))

(assert (=> bs!34890 m!1143235))

(assert (=> b!1240425 d!136207))

(declare-fun d!136209 () Bool)

(declare-fun e!703204 () Bool)

(assert (=> d!136209 e!703204))

(declare-fun res!827779 () Bool)

(assert (=> d!136209 (=> (not res!827779) (not e!703204))))

(declare-fun lt!561845 () ListLongMap!18245)

(assert (=> d!136209 (= res!827779 (contains!7355 lt!561845 (_1!10149 lt!561750)))))

(declare-fun lt!561844 () List!27387)

(assert (=> d!136209 (= lt!561845 (ListLongMap!18246 lt!561844))))

(declare-fun lt!561843 () Unit!41076)

(declare-fun lt!561842 () Unit!41076)

(assert (=> d!136209 (= lt!561843 lt!561842)))

(assert (=> d!136209 (= (getValueByKey!652 lt!561844 (_1!10149 lt!561750)) (Some!702 (_2!10149 lt!561750)))))

(assert (=> d!136209 (= lt!561842 (lemmaContainsTupThenGetReturnValue!328 lt!561844 (_1!10149 lt!561750) (_2!10149 lt!561750)))))

(assert (=> d!136209 (= lt!561844 (insertStrictlySorted!420 (toList!9138 lm!211) (_1!10149 lt!561750) (_2!10149 lt!561750)))))

(assert (=> d!136209 (= (+!4180 lm!211 lt!561750) lt!561845)))

(declare-fun b!1240637 () Bool)

(declare-fun res!827778 () Bool)

(assert (=> b!1240637 (=> (not res!827778) (not e!703204))))

(assert (=> b!1240637 (= res!827778 (= (getValueByKey!652 (toList!9138 lt!561845) (_1!10149 lt!561750)) (Some!702 (_2!10149 lt!561750))))))

(declare-fun b!1240638 () Bool)

(assert (=> b!1240638 (= e!703204 (contains!7353 (toList!9138 lt!561845) lt!561750))))

(assert (= (and d!136209 res!827779) b!1240637))

(assert (= (and b!1240637 res!827778) b!1240638))

(declare-fun m!1143485 () Bool)

(assert (=> d!136209 m!1143485))

(declare-fun m!1143487 () Bool)

(assert (=> d!136209 m!1143487))

(declare-fun m!1143489 () Bool)

(assert (=> d!136209 m!1143489))

(declare-fun m!1143491 () Bool)

(assert (=> d!136209 m!1143491))

(declare-fun m!1143493 () Bool)

(assert (=> b!1240637 m!1143493))

(declare-fun m!1143495 () Bool)

(assert (=> b!1240638 m!1143495))

(assert (=> b!1240425 d!136209))

(declare-fun b!1240639 () Bool)

(declare-fun e!703207 () List!27387)

(declare-fun call!61145 () List!27387)

(assert (=> b!1240639 (= e!703207 call!61145)))

(declare-fun b!1240640 () Bool)

(declare-fun e!703206 () List!27387)

(assert (=> b!1240640 (= e!703207 e!703206)))

(declare-fun c!121268 () Bool)

(assert (=> b!1240640 (= c!121268 (and ((_ is Cons!27383) (toList!9138 lm!211)) (= (_1!10149 (h!28592 (toList!9138 lm!211))) a1!66)))))

(declare-fun b!1240641 () Bool)

(declare-fun e!703205 () List!27387)

(declare-fun call!61144 () List!27387)

(assert (=> b!1240641 (= e!703205 call!61144)))

(declare-fun d!136215 () Bool)

(declare-fun e!703208 () Bool)

(assert (=> d!136215 e!703208))

(declare-fun res!827780 () Bool)

(assert (=> d!136215 (=> (not res!827780) (not e!703208))))

(declare-fun lt!561846 () List!27387)

(assert (=> d!136215 (= res!827780 (isStrictlySorted!729 lt!561846))))

(assert (=> d!136215 (= lt!561846 e!703207)))

(declare-fun c!121269 () Bool)

(assert (=> d!136215 (= c!121269 (and ((_ is Cons!27383) (toList!9138 lm!211)) (bvslt (_1!10149 (h!28592 (toList!9138 lm!211))) a1!66)))))

(assert (=> d!136215 (isStrictlySorted!729 (toList!9138 lm!211))))

(assert (=> d!136215 (= (insertStrictlySorted!420 (toList!9138 lm!211) a1!66 b1!77) lt!561846)))

(declare-fun b!1240642 () Bool)

(declare-fun res!827781 () Bool)

(assert (=> b!1240642 (=> (not res!827781) (not e!703208))))

(assert (=> b!1240642 (= res!827781 (containsKey!598 lt!561846 a1!66))))

(declare-fun b!1240643 () Bool)

(assert (=> b!1240643 (= e!703205 call!61144)))

(declare-fun bm!61141 () Bool)

(declare-fun call!61146 () List!27387)

(assert (=> bm!61141 (= call!61144 call!61146)))

(declare-fun e!703209 () List!27387)

(declare-fun b!1240644 () Bool)

(assert (=> b!1240644 (= e!703209 (insertStrictlySorted!420 (t!40841 (toList!9138 lm!211)) a1!66 b1!77))))

(declare-fun b!1240645 () Bool)

(declare-fun c!121270 () Bool)

(assert (=> b!1240645 (= c!121270 (and ((_ is Cons!27383) (toList!9138 lm!211)) (bvsgt (_1!10149 (h!28592 (toList!9138 lm!211))) a1!66)))))

(assert (=> b!1240645 (= e!703206 e!703205)))

(declare-fun bm!61142 () Bool)

(assert (=> bm!61142 (= call!61145 ($colon$colon!615 e!703209 (ite c!121269 (h!28592 (toList!9138 lm!211)) (tuple2!20277 a1!66 b1!77))))))

(declare-fun c!121267 () Bool)

(assert (=> bm!61142 (= c!121267 c!121269)))

(declare-fun bm!61143 () Bool)

(assert (=> bm!61143 (= call!61146 call!61145)))

(declare-fun b!1240646 () Bool)

(assert (=> b!1240646 (= e!703206 call!61146)))

(declare-fun b!1240647 () Bool)

(assert (=> b!1240647 (= e!703208 (contains!7353 lt!561846 (tuple2!20277 a1!66 b1!77)))))

(declare-fun b!1240648 () Bool)

(assert (=> b!1240648 (= e!703209 (ite c!121268 (t!40841 (toList!9138 lm!211)) (ite c!121270 (Cons!27383 (h!28592 (toList!9138 lm!211)) (t!40841 (toList!9138 lm!211))) Nil!27384)))))

(assert (= (and d!136215 c!121269) b!1240639))

(assert (= (and d!136215 (not c!121269)) b!1240640))

(assert (= (and b!1240640 c!121268) b!1240646))

(assert (= (and b!1240640 (not c!121268)) b!1240645))

(assert (= (and b!1240645 c!121270) b!1240641))

(assert (= (and b!1240645 (not c!121270)) b!1240643))

(assert (= (or b!1240641 b!1240643) bm!61141))

(assert (= (or b!1240646 bm!61141) bm!61143))

(assert (= (or b!1240639 bm!61143) bm!61142))

(assert (= (and bm!61142 c!121267) b!1240644))

(assert (= (and bm!61142 (not c!121267)) b!1240648))

(assert (= (and d!136215 res!827780) b!1240642))

(assert (= (and b!1240642 res!827781) b!1240647))

(declare-fun m!1143497 () Bool)

(assert (=> d!136215 m!1143497))

(assert (=> d!136215 m!1143233))

(declare-fun m!1143499 () Bool)

(assert (=> b!1240642 m!1143499))

(declare-fun m!1143501 () Bool)

(assert (=> bm!61142 m!1143501))

(declare-fun m!1143503 () Bool)

(assert (=> b!1240644 m!1143503))

(declare-fun m!1143505 () Bool)

(assert (=> b!1240647 m!1143505))

(assert (=> b!1240425 d!136215))

(declare-fun d!136217 () Bool)

(assert (=> d!136217 (= (insertStrictlySorted!420 (removeStrictlySorted!112 (toList!9138 lm!211) a2!55) a1!66 b1!77) (removeStrictlySorted!112 (insertStrictlySorted!420 (toList!9138 lm!211) a1!66 b1!77) a2!55))))

(declare-fun lt!561855 () Unit!41076)

(declare-fun choose!1842 (List!27387 (_ BitVec 64) B!1796 (_ BitVec 64)) Unit!41076)

(assert (=> d!136217 (= lt!561855 (choose!1842 (toList!9138 lm!211) a1!66 b1!77 a2!55))))

(assert (=> d!136217 (not (= a1!66 a2!55))))

(assert (=> d!136217 (= (lemmaInsertAndRemoveStrictlySortedCommutative!1 (toList!9138 lm!211) a1!66 b1!77 a2!55) lt!561855)))

(declare-fun bs!34895 () Bool)

(assert (= bs!34895 d!136217))

(declare-fun m!1143511 () Bool)

(assert (=> bs!34895 m!1143511))

(assert (=> bs!34895 m!1143235))

(assert (=> bs!34895 m!1143237))

(assert (=> bs!34895 m!1143241))

(assert (=> bs!34895 m!1143247))

(assert (=> bs!34895 m!1143235))

(assert (=> bs!34895 m!1143241))

(assert (=> b!1240425 d!136217))

(declare-fun d!136227 () Bool)

(assert (=> d!136227 (= (inv!42773 lm!211) (isStrictlySorted!729 (toList!9138 lm!211)))))

(declare-fun bs!34896 () Bool)

(assert (= bs!34896 d!136227))

(assert (=> bs!34896 m!1143233))

(assert (=> start!103504 d!136227))

(declare-fun d!136229 () Bool)

(declare-fun res!827798 () Bool)

(declare-fun e!703232 () Bool)

(assert (=> d!136229 (=> res!827798 e!703232)))

(assert (=> d!136229 (= res!827798 (or ((_ is Nil!27384) (toList!9138 lm!211)) ((_ is Nil!27384) (t!40841 (toList!9138 lm!211)))))))

(assert (=> d!136229 (= (isStrictlySorted!729 (toList!9138 lm!211)) e!703232)))

(declare-fun b!1240675 () Bool)

(declare-fun e!703233 () Bool)

(assert (=> b!1240675 (= e!703232 e!703233)))

(declare-fun res!827799 () Bool)

(assert (=> b!1240675 (=> (not res!827799) (not e!703233))))

(assert (=> b!1240675 (= res!827799 (bvslt (_1!10149 (h!28592 (toList!9138 lm!211))) (_1!10149 (h!28592 (t!40841 (toList!9138 lm!211))))))))

(declare-fun b!1240676 () Bool)

(assert (=> b!1240676 (= e!703233 (isStrictlySorted!729 (t!40841 (toList!9138 lm!211))))))

(assert (= (and d!136229 (not res!827798)) b!1240675))

(assert (= (and b!1240675 res!827799) b!1240676))

(declare-fun m!1143517 () Bool)

(assert (=> b!1240676 m!1143517))

(assert (=> b!1240424 d!136229))

(declare-fun b!1240681 () Bool)

(declare-fun e!703236 () Bool)

(declare-fun tp!92552 () Bool)

(assert (=> b!1240681 (= e!703236 (and tp_is_empty!31195 tp!92552))))

(assert (=> b!1240426 (= tp!92537 e!703236)))

(assert (= (and b!1240426 ((_ is Cons!27383) (toList!9138 lm!211))) b!1240681))

(check-sat (not b!1240676) (not b!1240644) (not b!1240637) (not d!136209) (not b!1240568) (not b!1240638) (not d!136207) (not b!1240553) (not b!1240509) (not b!1240566) (not d!136217) (not d!136169) (not d!136183) (not b!1240504) (not b!1240551) (not d!136215) (not b!1240506) (not b!1240599) (not b!1240642) (not d!136193) (not b!1240681) tp_is_empty!31195 (not d!136227) (not bm!61142) (not bm!61124) (not d!136181) (not b!1240600) (not b!1240647) (not d!136175))
(check-sat)
