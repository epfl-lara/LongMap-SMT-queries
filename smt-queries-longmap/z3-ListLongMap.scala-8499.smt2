; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103814 () Bool)

(assert start!103814)

(declare-fun res!828424 () Bool)

(declare-fun e!704191 () Bool)

(assert (=> start!103814 (=> (not res!828424) (not e!704191))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103814 (= res!828424 (not (= key1!25 key2!15)))))

(assert (=> start!103814 e!704191))

(assert (=> start!103814 true))

(declare-fun e!704192 () Bool)

(assert (=> start!103814 e!704192))

(declare-fun tp_is_empty!31219 () Bool)

(assert (=> start!103814 tp_is_empty!31219))

(declare-fun b!1242167 () Bool)

(declare-fun res!828423 () Bool)

(assert (=> b!1242167 (=> (not res!828423) (not e!704191))))

(declare-datatypes ((B!1820 0))(
  ( (B!1821 (val!15672 Int)) )
))
(declare-datatypes ((tuple2!20232 0))(
  ( (tuple2!20233 (_1!10127 (_ BitVec 64)) (_2!10127 B!1820)) )
))
(declare-datatypes ((List!27362 0))(
  ( (Nil!27359) (Cons!27358 (h!28576 tuple2!20232) (t!40817 List!27362)) )
))
(declare-fun l!644 () List!27362)

(declare-fun isStrictlySorted!727 (List!27362) Bool)

(assert (=> b!1242167 (= res!828423 (isStrictlySorted!727 (t!40817 l!644)))))

(declare-fun b!1242168 () Bool)

(declare-fun res!828426 () Bool)

(assert (=> b!1242168 (=> (not res!828426) (not e!704191))))

(assert (=> b!1242168 (= res!828426 (isStrictlySorted!727 l!644))))

(declare-fun b!1242169 () Bool)

(declare-fun tp!92582 () Bool)

(assert (=> b!1242169 (= e!704192 (and tp_is_empty!31219 tp!92582))))

(declare-fun b!1242170 () Bool)

(declare-fun res!828425 () Bool)

(assert (=> b!1242170 (=> (not res!828425) (not e!704191))))

(get-info :version)

(assert (=> b!1242170 (= res!828425 ((_ is Cons!27358) l!644))))

(declare-fun b!1242171 () Bool)

(declare-fun removeStrictlySorted!117 (List!27362 (_ BitVec 64)) List!27362)

(assert (=> b!1242171 (= e!704191 (not (isStrictlySorted!727 (removeStrictlySorted!117 l!644 key2!15))))))

(declare-fun v1!20 () B!1820)

(declare-fun insertStrictlySorted!426 (List!27362 (_ BitVec 64) B!1820) List!27362)

(assert (=> b!1242171 (= (insertStrictlySorted!426 (removeStrictlySorted!117 (t!40817 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!117 (insertStrictlySorted!426 (t!40817 l!644) key1!25 v1!20) key2!15))))

(declare-datatypes ((Unit!41216 0))(
  ( (Unit!41217) )
))
(declare-fun lt!562532 () Unit!41216)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!7 (List!27362 (_ BitVec 64) B!1820 (_ BitVec 64)) Unit!41216)

(assert (=> b!1242171 (= lt!562532 (lemmaInsertAndRemoveStrictlySortedCommutative!7 (t!40817 l!644) key1!25 v1!20 key2!15))))

(assert (= (and start!103814 res!828424) b!1242168))

(assert (= (and b!1242168 res!828426) b!1242170))

(assert (= (and b!1242170 res!828425) b!1242167))

(assert (= (and b!1242167 res!828423) b!1242171))

(assert (= (and start!103814 ((_ is Cons!27358) l!644)) b!1242169))

(declare-fun m!1145735 () Bool)

(assert (=> b!1242167 m!1145735))

(declare-fun m!1145737 () Bool)

(assert (=> b!1242168 m!1145737))

(declare-fun m!1145739 () Bool)

(assert (=> b!1242171 m!1145739))

(declare-fun m!1145741 () Bool)

(assert (=> b!1242171 m!1145741))

(declare-fun m!1145743 () Bool)

(assert (=> b!1242171 m!1145743))

(assert (=> b!1242171 m!1145741))

(declare-fun m!1145745 () Bool)

(assert (=> b!1242171 m!1145745))

(declare-fun m!1145747 () Bool)

(assert (=> b!1242171 m!1145747))

(assert (=> b!1242171 m!1145745))

(declare-fun m!1145749 () Bool)

(assert (=> b!1242171 m!1145749))

(assert (=> b!1242171 m!1145739))

(declare-fun m!1145751 () Bool)

(assert (=> b!1242171 m!1145751))

(check-sat (not b!1242171) (not b!1242167) (not b!1242169) (not b!1242168) tp_is_empty!31219)
(check-sat)
(get-model)

(declare-fun d!136841 () Bool)

(declare-fun res!828463 () Bool)

(declare-fun e!704217 () Bool)

(assert (=> d!136841 (=> res!828463 e!704217)))

(assert (=> d!136841 (= res!828463 (or ((_ is Nil!27359) (t!40817 l!644)) ((_ is Nil!27359) (t!40817 (t!40817 l!644)))))))

(assert (=> d!136841 (= (isStrictlySorted!727 (t!40817 l!644)) e!704217)))

(declare-fun b!1242214 () Bool)

(declare-fun e!704218 () Bool)

(assert (=> b!1242214 (= e!704217 e!704218)))

(declare-fun res!828464 () Bool)

(assert (=> b!1242214 (=> (not res!828464) (not e!704218))))

(assert (=> b!1242214 (= res!828464 (bvslt (_1!10127 (h!28576 (t!40817 l!644))) (_1!10127 (h!28576 (t!40817 (t!40817 l!644))))))))

(declare-fun b!1242215 () Bool)

(assert (=> b!1242215 (= e!704218 (isStrictlySorted!727 (t!40817 (t!40817 l!644))))))

(assert (= (and d!136841 (not res!828463)) b!1242214))

(assert (= (and b!1242214 res!828464) b!1242215))

(declare-fun m!1145791 () Bool)

(assert (=> b!1242215 m!1145791))

(assert (=> b!1242167 d!136841))

(declare-fun d!136847 () Bool)

(declare-fun res!828465 () Bool)

(declare-fun e!704219 () Bool)

(assert (=> d!136847 (=> res!828465 e!704219)))

(assert (=> d!136847 (= res!828465 (or ((_ is Nil!27359) l!644) ((_ is Nil!27359) (t!40817 l!644))))))

(assert (=> d!136847 (= (isStrictlySorted!727 l!644) e!704219)))

(declare-fun b!1242216 () Bool)

(declare-fun e!704220 () Bool)

(assert (=> b!1242216 (= e!704219 e!704220)))

(declare-fun res!828466 () Bool)

(assert (=> b!1242216 (=> (not res!828466) (not e!704220))))

(assert (=> b!1242216 (= res!828466 (bvslt (_1!10127 (h!28576 l!644)) (_1!10127 (h!28576 (t!40817 l!644)))))))

(declare-fun b!1242217 () Bool)

(assert (=> b!1242217 (= e!704220 (isStrictlySorted!727 (t!40817 l!644)))))

(assert (= (and d!136847 (not res!828465)) b!1242216))

(assert (= (and b!1242216 res!828466) b!1242217))

(assert (=> b!1242217 m!1145735))

(assert (=> b!1242168 d!136847))

(declare-fun b!1242243 () Bool)

(declare-fun e!704237 () List!27362)

(declare-fun $colon$colon!615 (List!27362 tuple2!20232) List!27362)

(assert (=> b!1242243 (= e!704237 ($colon$colon!615 (removeStrictlySorted!117 (t!40817 (insertStrictlySorted!426 (t!40817 l!644) key1!25 v1!20)) key2!15) (h!28576 (insertStrictlySorted!426 (t!40817 l!644) key1!25 v1!20))))))

(declare-fun d!136849 () Bool)

(declare-fun e!704238 () Bool)

(assert (=> d!136849 e!704238))

(declare-fun res!828472 () Bool)

(assert (=> d!136849 (=> (not res!828472) (not e!704238))))

(declare-fun lt!562544 () List!27362)

(assert (=> d!136849 (= res!828472 (isStrictlySorted!727 lt!562544))))

(declare-fun e!704236 () List!27362)

(assert (=> d!136849 (= lt!562544 e!704236)))

(declare-fun c!121702 () Bool)

(assert (=> d!136849 (= c!121702 (and ((_ is Cons!27358) (insertStrictlySorted!426 (t!40817 l!644) key1!25 v1!20)) (= (_1!10127 (h!28576 (insertStrictlySorted!426 (t!40817 l!644) key1!25 v1!20))) key2!15)))))

(assert (=> d!136849 (isStrictlySorted!727 (insertStrictlySorted!426 (t!40817 l!644) key1!25 v1!20))))

(assert (=> d!136849 (= (removeStrictlySorted!117 (insertStrictlySorted!426 (t!40817 l!644) key1!25 v1!20) key2!15) lt!562544)))

(declare-fun b!1242244 () Bool)

(assert (=> b!1242244 (= e!704236 (t!40817 (insertStrictlySorted!426 (t!40817 l!644) key1!25 v1!20)))))

(declare-fun b!1242245 () Bool)

(assert (=> b!1242245 (= e!704237 Nil!27359)))

(declare-fun b!1242246 () Bool)

(assert (=> b!1242246 (= e!704236 e!704237)))

(declare-fun c!121703 () Bool)

(assert (=> b!1242246 (= c!121703 (and ((_ is Cons!27358) (insertStrictlySorted!426 (t!40817 l!644) key1!25 v1!20)) (not (= (_1!10127 (h!28576 (insertStrictlySorted!426 (t!40817 l!644) key1!25 v1!20))) key2!15))))))

(declare-fun b!1242247 () Bool)

(declare-fun containsKey!602 (List!27362 (_ BitVec 64)) Bool)

(assert (=> b!1242247 (= e!704238 (not (containsKey!602 lt!562544 key2!15)))))

(assert (= (and d!136849 c!121702) b!1242244))

(assert (= (and d!136849 (not c!121702)) b!1242246))

(assert (= (and b!1242246 c!121703) b!1242243))

(assert (= (and b!1242246 (not c!121703)) b!1242245))

(assert (= (and d!136849 res!828472) b!1242247))

(declare-fun m!1145803 () Bool)

(assert (=> b!1242243 m!1145803))

(assert (=> b!1242243 m!1145803))

(declare-fun m!1145805 () Bool)

(assert (=> b!1242243 m!1145805))

(declare-fun m!1145807 () Bool)

(assert (=> d!136849 m!1145807))

(assert (=> d!136849 m!1145741))

(declare-fun m!1145809 () Bool)

(assert (=> d!136849 m!1145809))

(declare-fun m!1145811 () Bool)

(assert (=> b!1242247 m!1145811))

(assert (=> b!1242171 d!136849))

(declare-fun d!136855 () Bool)

(declare-fun e!704283 () Bool)

(assert (=> d!136855 e!704283))

(declare-fun res!828495 () Bool)

(assert (=> d!136855 (=> (not res!828495) (not e!704283))))

(declare-fun lt!562553 () List!27362)

(assert (=> d!136855 (= res!828495 (isStrictlySorted!727 lt!562553))))

(declare-fun e!704281 () List!27362)

(assert (=> d!136855 (= lt!562553 e!704281)))

(declare-fun c!121733 () Bool)

(assert (=> d!136855 (= c!121733 (and ((_ is Cons!27358) (removeStrictlySorted!117 (t!40817 l!644) key2!15)) (bvslt (_1!10127 (h!28576 (removeStrictlySorted!117 (t!40817 l!644) key2!15))) key1!25)))))

(assert (=> d!136855 (isStrictlySorted!727 (removeStrictlySorted!117 (t!40817 l!644) key2!15))))

(assert (=> d!136855 (= (insertStrictlySorted!426 (removeStrictlySorted!117 (t!40817 l!644) key2!15) key1!25 v1!20) lt!562553)))

(declare-fun b!1242321 () Bool)

(declare-fun e!704282 () List!27362)

(assert (=> b!1242321 (= e!704282 (insertStrictlySorted!426 (t!40817 (removeStrictlySorted!117 (t!40817 l!644) key2!15)) key1!25 v1!20))))

(declare-fun c!121732 () Bool)

(declare-fun b!1242322 () Bool)

(declare-fun c!121730 () Bool)

(assert (=> b!1242322 (= e!704282 (ite c!121730 (t!40817 (removeStrictlySorted!117 (t!40817 l!644) key2!15)) (ite c!121732 (Cons!27358 (h!28576 (removeStrictlySorted!117 (t!40817 l!644) key2!15)) (t!40817 (removeStrictlySorted!117 (t!40817 l!644) key2!15))) Nil!27359)))))

(declare-fun b!1242323 () Bool)

(declare-fun call!61249 () List!27362)

(assert (=> b!1242323 (= e!704281 call!61249)))

(declare-fun b!1242324 () Bool)

(declare-fun contains!7418 (List!27362 tuple2!20232) Bool)

(assert (=> b!1242324 (= e!704283 (contains!7418 lt!562553 (tuple2!20233 key1!25 v1!20)))))

(declare-fun b!1242325 () Bool)

(declare-fun e!704285 () List!27362)

(declare-fun call!61251 () List!27362)

(assert (=> b!1242325 (= e!704285 call!61251)))

(declare-fun b!1242326 () Bool)

(declare-fun res!828494 () Bool)

(assert (=> b!1242326 (=> (not res!828494) (not e!704283))))

(assert (=> b!1242326 (= res!828494 (containsKey!602 lt!562553 key1!25))))

(declare-fun bm!61246 () Bool)

(assert (=> bm!61246 (= call!61251 call!61249)))

(declare-fun bm!61247 () Bool)

(assert (=> bm!61247 (= call!61249 ($colon$colon!615 e!704282 (ite c!121733 (h!28576 (removeStrictlySorted!117 (t!40817 l!644) key2!15)) (tuple2!20233 key1!25 v1!20))))))

(declare-fun c!121731 () Bool)

(assert (=> bm!61247 (= c!121731 c!121733)))

(declare-fun b!1242327 () Bool)

(declare-fun e!704284 () List!27362)

(declare-fun call!61250 () List!27362)

(assert (=> b!1242327 (= e!704284 call!61250)))

(declare-fun bm!61248 () Bool)

(assert (=> bm!61248 (= call!61250 call!61251)))

(declare-fun b!1242328 () Bool)

(assert (=> b!1242328 (= c!121732 (and ((_ is Cons!27358) (removeStrictlySorted!117 (t!40817 l!644) key2!15)) (bvsgt (_1!10127 (h!28576 (removeStrictlySorted!117 (t!40817 l!644) key2!15))) key1!25)))))

(assert (=> b!1242328 (= e!704285 e!704284)))

(declare-fun b!1242329 () Bool)

(assert (=> b!1242329 (= e!704281 e!704285)))

(assert (=> b!1242329 (= c!121730 (and ((_ is Cons!27358) (removeStrictlySorted!117 (t!40817 l!644) key2!15)) (= (_1!10127 (h!28576 (removeStrictlySorted!117 (t!40817 l!644) key2!15))) key1!25)))))

(declare-fun b!1242330 () Bool)

(assert (=> b!1242330 (= e!704284 call!61250)))

(assert (= (and d!136855 c!121733) b!1242323))

(assert (= (and d!136855 (not c!121733)) b!1242329))

(assert (= (and b!1242329 c!121730) b!1242325))

(assert (= (and b!1242329 (not c!121730)) b!1242328))

(assert (= (and b!1242328 c!121732) b!1242327))

(assert (= (and b!1242328 (not c!121732)) b!1242330))

(assert (= (or b!1242327 b!1242330) bm!61248))

(assert (= (or b!1242325 bm!61248) bm!61246))

(assert (= (or b!1242323 bm!61246) bm!61247))

(assert (= (and bm!61247 c!121731) b!1242321))

(assert (= (and bm!61247 (not c!121731)) b!1242322))

(assert (= (and d!136855 res!828495) b!1242326))

(assert (= (and b!1242326 res!828494) b!1242324))

(declare-fun m!1145837 () Bool)

(assert (=> bm!61247 m!1145837))

(declare-fun m!1145839 () Bool)

(assert (=> b!1242324 m!1145839))

(declare-fun m!1145841 () Bool)

(assert (=> d!136855 m!1145841))

(assert (=> d!136855 m!1145745))

(declare-fun m!1145843 () Bool)

(assert (=> d!136855 m!1145843))

(declare-fun m!1145845 () Bool)

(assert (=> b!1242321 m!1145845))

(declare-fun m!1145847 () Bool)

(assert (=> b!1242326 m!1145847))

(assert (=> b!1242171 d!136855))

(declare-fun b!1242336 () Bool)

(declare-fun e!704290 () List!27362)

(assert (=> b!1242336 (= e!704290 ($colon$colon!615 (removeStrictlySorted!117 (t!40817 l!644) key2!15) (h!28576 l!644)))))

(declare-fun d!136865 () Bool)

(declare-fun e!704291 () Bool)

(assert (=> d!136865 e!704291))

(declare-fun res!828497 () Bool)

(assert (=> d!136865 (=> (not res!828497) (not e!704291))))

(declare-fun lt!562555 () List!27362)

(assert (=> d!136865 (= res!828497 (isStrictlySorted!727 lt!562555))))

(declare-fun e!704289 () List!27362)

(assert (=> d!136865 (= lt!562555 e!704289)))

(declare-fun c!121736 () Bool)

(assert (=> d!136865 (= c!121736 (and ((_ is Cons!27358) l!644) (= (_1!10127 (h!28576 l!644)) key2!15)))))

(assert (=> d!136865 (isStrictlySorted!727 l!644)))

(assert (=> d!136865 (= (removeStrictlySorted!117 l!644 key2!15) lt!562555)))

(declare-fun b!1242337 () Bool)

(assert (=> b!1242337 (= e!704289 (t!40817 l!644))))

(declare-fun b!1242338 () Bool)

(assert (=> b!1242338 (= e!704290 Nil!27359)))

(declare-fun b!1242339 () Bool)

(assert (=> b!1242339 (= e!704289 e!704290)))

(declare-fun c!121737 () Bool)

(assert (=> b!1242339 (= c!121737 (and ((_ is Cons!27358) l!644) (not (= (_1!10127 (h!28576 l!644)) key2!15))))))

(declare-fun b!1242340 () Bool)

(assert (=> b!1242340 (= e!704291 (not (containsKey!602 lt!562555 key2!15)))))

(assert (= (and d!136865 c!121736) b!1242337))

(assert (= (and d!136865 (not c!121736)) b!1242339))

(assert (= (and b!1242339 c!121737) b!1242336))

(assert (= (and b!1242339 (not c!121737)) b!1242338))

(assert (= (and d!136865 res!828497) b!1242340))

(assert (=> b!1242336 m!1145745))

(assert (=> b!1242336 m!1145745))

(declare-fun m!1145855 () Bool)

(assert (=> b!1242336 m!1145855))

(declare-fun m!1145857 () Bool)

(assert (=> d!136865 m!1145857))

(assert (=> d!136865 m!1145737))

(declare-fun m!1145859 () Bool)

(assert (=> b!1242340 m!1145859))

(assert (=> b!1242171 d!136865))

(declare-fun d!136869 () Bool)

(assert (=> d!136869 (= (insertStrictlySorted!426 (removeStrictlySorted!117 (t!40817 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!117 (insertStrictlySorted!426 (t!40817 l!644) key1!25 v1!20) key2!15))))

(declare-fun lt!562563 () Unit!41216)

(declare-fun choose!1839 (List!27362 (_ BitVec 64) B!1820 (_ BitVec 64)) Unit!41216)

(assert (=> d!136869 (= lt!562563 (choose!1839 (t!40817 l!644) key1!25 v1!20 key2!15))))

(assert (=> d!136869 (not (= key1!25 key2!15))))

(assert (=> d!136869 (= (lemmaInsertAndRemoveStrictlySortedCommutative!7 (t!40817 l!644) key1!25 v1!20 key2!15) lt!562563)))

(declare-fun bs!34956 () Bool)

(assert (= bs!34956 d!136869))

(declare-fun m!1145863 () Bool)

(assert (=> bs!34956 m!1145863))

(assert (=> bs!34956 m!1145741))

(assert (=> bs!34956 m!1145743))

(assert (=> bs!34956 m!1145741))

(assert (=> bs!34956 m!1145745))

(assert (=> bs!34956 m!1145749))

(assert (=> bs!34956 m!1145745))

(assert (=> b!1242171 d!136869))

(declare-fun d!136875 () Bool)

(declare-fun res!828502 () Bool)

(declare-fun e!704305 () Bool)

(assert (=> d!136875 (=> res!828502 e!704305)))

(assert (=> d!136875 (= res!828502 (or ((_ is Nil!27359) (removeStrictlySorted!117 l!644 key2!15)) ((_ is Nil!27359) (t!40817 (removeStrictlySorted!117 l!644 key2!15)))))))

(assert (=> d!136875 (= (isStrictlySorted!727 (removeStrictlySorted!117 l!644 key2!15)) e!704305)))

(declare-fun b!1242360 () Bool)

(declare-fun e!704306 () Bool)

(assert (=> b!1242360 (= e!704305 e!704306)))

(declare-fun res!828503 () Bool)

(assert (=> b!1242360 (=> (not res!828503) (not e!704306))))

(assert (=> b!1242360 (= res!828503 (bvslt (_1!10127 (h!28576 (removeStrictlySorted!117 l!644 key2!15))) (_1!10127 (h!28576 (t!40817 (removeStrictlySorted!117 l!644 key2!15))))))))

(declare-fun b!1242362 () Bool)

(assert (=> b!1242362 (= e!704306 (isStrictlySorted!727 (t!40817 (removeStrictlySorted!117 l!644 key2!15))))))

(assert (= (and d!136875 (not res!828502)) b!1242360))

(assert (= (and b!1242360 res!828503) b!1242362))

(declare-fun m!1145867 () Bool)

(assert (=> b!1242362 m!1145867))

(assert (=> b!1242171 d!136875))

(declare-fun d!136877 () Bool)

(declare-fun e!704311 () Bool)

(assert (=> d!136877 e!704311))

(declare-fun res!828505 () Bool)

(assert (=> d!136877 (=> (not res!828505) (not e!704311))))

(declare-fun lt!562565 () List!27362)

(assert (=> d!136877 (= res!828505 (isStrictlySorted!727 lt!562565))))

(declare-fun e!704309 () List!27362)

(assert (=> d!136877 (= lt!562565 e!704309)))

(declare-fun c!121753 () Bool)

(assert (=> d!136877 (= c!121753 (and ((_ is Cons!27358) (t!40817 l!644)) (bvslt (_1!10127 (h!28576 (t!40817 l!644))) key1!25)))))

(assert (=> d!136877 (isStrictlySorted!727 (t!40817 l!644))))

(assert (=> d!136877 (= (insertStrictlySorted!426 (t!40817 l!644) key1!25 v1!20) lt!562565)))

(declare-fun b!1242371 () Bool)

(declare-fun e!704310 () List!27362)

(assert (=> b!1242371 (= e!704310 (insertStrictlySorted!426 (t!40817 (t!40817 l!644)) key1!25 v1!20))))

(declare-fun b!1242372 () Bool)

(declare-fun c!121752 () Bool)

(declare-fun c!121750 () Bool)

(assert (=> b!1242372 (= e!704310 (ite c!121750 (t!40817 (t!40817 l!644)) (ite c!121752 (Cons!27358 (h!28576 (t!40817 l!644)) (t!40817 (t!40817 l!644))) Nil!27359)))))

(declare-fun b!1242373 () Bool)

(declare-fun call!61261 () List!27362)

(assert (=> b!1242373 (= e!704309 call!61261)))

(declare-fun b!1242374 () Bool)

(assert (=> b!1242374 (= e!704311 (contains!7418 lt!562565 (tuple2!20233 key1!25 v1!20)))))

(declare-fun b!1242375 () Bool)

(declare-fun e!704313 () List!27362)

(declare-fun call!61263 () List!27362)

(assert (=> b!1242375 (= e!704313 call!61263)))

(declare-fun b!1242376 () Bool)

(declare-fun res!828504 () Bool)

(assert (=> b!1242376 (=> (not res!828504) (not e!704311))))

(assert (=> b!1242376 (= res!828504 (containsKey!602 lt!562565 key1!25))))

(declare-fun bm!61258 () Bool)

(assert (=> bm!61258 (= call!61263 call!61261)))

(declare-fun bm!61259 () Bool)

(assert (=> bm!61259 (= call!61261 ($colon$colon!615 e!704310 (ite c!121753 (h!28576 (t!40817 l!644)) (tuple2!20233 key1!25 v1!20))))))

(declare-fun c!121751 () Bool)

(assert (=> bm!61259 (= c!121751 c!121753)))

(declare-fun b!1242377 () Bool)

(declare-fun e!704312 () List!27362)

(declare-fun call!61262 () List!27362)

(assert (=> b!1242377 (= e!704312 call!61262)))

(declare-fun bm!61260 () Bool)

(assert (=> bm!61260 (= call!61262 call!61263)))

(declare-fun b!1242378 () Bool)

(assert (=> b!1242378 (= c!121752 (and ((_ is Cons!27358) (t!40817 l!644)) (bvsgt (_1!10127 (h!28576 (t!40817 l!644))) key1!25)))))

(assert (=> b!1242378 (= e!704313 e!704312)))

(declare-fun b!1242379 () Bool)

(assert (=> b!1242379 (= e!704309 e!704313)))

(assert (=> b!1242379 (= c!121750 (and ((_ is Cons!27358) (t!40817 l!644)) (= (_1!10127 (h!28576 (t!40817 l!644))) key1!25)))))

(declare-fun b!1242380 () Bool)

(assert (=> b!1242380 (= e!704312 call!61262)))

(assert (= (and d!136877 c!121753) b!1242373))

(assert (= (and d!136877 (not c!121753)) b!1242379))

(assert (= (and b!1242379 c!121750) b!1242375))

(assert (= (and b!1242379 (not c!121750)) b!1242378))

(assert (= (and b!1242378 c!121752) b!1242377))

(assert (= (and b!1242378 (not c!121752)) b!1242380))

(assert (= (or b!1242377 b!1242380) bm!61260))

(assert (= (or b!1242375 bm!61260) bm!61258))

(assert (= (or b!1242373 bm!61258) bm!61259))

(assert (= (and bm!61259 c!121751) b!1242371))

(assert (= (and bm!61259 (not c!121751)) b!1242372))

(assert (= (and d!136877 res!828505) b!1242376))

(assert (= (and b!1242376 res!828504) b!1242374))

(declare-fun m!1145879 () Bool)

(assert (=> bm!61259 m!1145879))

(declare-fun m!1145881 () Bool)

(assert (=> b!1242374 m!1145881))

(declare-fun m!1145883 () Bool)

(assert (=> d!136877 m!1145883))

(assert (=> d!136877 m!1145735))

(declare-fun m!1145885 () Bool)

(assert (=> b!1242371 m!1145885))

(declare-fun m!1145887 () Bool)

(assert (=> b!1242376 m!1145887))

(assert (=> b!1242171 d!136877))

(declare-fun b!1242390 () Bool)

(declare-fun e!704320 () List!27362)

(assert (=> b!1242390 (= e!704320 ($colon$colon!615 (removeStrictlySorted!117 (t!40817 (t!40817 l!644)) key2!15) (h!28576 (t!40817 l!644))))))

(declare-fun d!136881 () Bool)

(declare-fun e!704321 () Bool)

(assert (=> d!136881 e!704321))

(declare-fun res!828511 () Bool)

(assert (=> d!136881 (=> (not res!828511) (not e!704321))))

(declare-fun lt!562567 () List!27362)

(assert (=> d!136881 (= res!828511 (isStrictlySorted!727 lt!562567))))

(declare-fun e!704319 () List!27362)

(assert (=> d!136881 (= lt!562567 e!704319)))

(declare-fun c!121756 () Bool)

(assert (=> d!136881 (= c!121756 (and ((_ is Cons!27358) (t!40817 l!644)) (= (_1!10127 (h!28576 (t!40817 l!644))) key2!15)))))

(assert (=> d!136881 (isStrictlySorted!727 (t!40817 l!644))))

(assert (=> d!136881 (= (removeStrictlySorted!117 (t!40817 l!644) key2!15) lt!562567)))

(declare-fun b!1242391 () Bool)

(assert (=> b!1242391 (= e!704319 (t!40817 (t!40817 l!644)))))

(declare-fun b!1242392 () Bool)

(assert (=> b!1242392 (= e!704320 Nil!27359)))

(declare-fun b!1242393 () Bool)

(assert (=> b!1242393 (= e!704319 e!704320)))

(declare-fun c!121757 () Bool)

(assert (=> b!1242393 (= c!121757 (and ((_ is Cons!27358) (t!40817 l!644)) (not (= (_1!10127 (h!28576 (t!40817 l!644))) key2!15))))))

(declare-fun b!1242394 () Bool)

(assert (=> b!1242394 (= e!704321 (not (containsKey!602 lt!562567 key2!15)))))

(assert (= (and d!136881 c!121756) b!1242391))

(assert (= (and d!136881 (not c!121756)) b!1242393))

(assert (= (and b!1242393 c!121757) b!1242390))

(assert (= (and b!1242393 (not c!121757)) b!1242392))

(assert (= (and d!136881 res!828511) b!1242394))

(declare-fun m!1145897 () Bool)

(assert (=> b!1242390 m!1145897))

(assert (=> b!1242390 m!1145897))

(declare-fun m!1145899 () Bool)

(assert (=> b!1242390 m!1145899))

(declare-fun m!1145901 () Bool)

(assert (=> d!136881 m!1145901))

(assert (=> d!136881 m!1145735))

(declare-fun m!1145903 () Bool)

(assert (=> b!1242394 m!1145903))

(assert (=> b!1242171 d!136881))

(declare-fun b!1242404 () Bool)

(declare-fun e!704327 () Bool)

(declare-fun tp!92594 () Bool)

(assert (=> b!1242404 (= e!704327 (and tp_is_empty!31219 tp!92594))))

(assert (=> b!1242169 (= tp!92582 e!704327)))

(assert (= (and b!1242169 ((_ is Cons!27358) (t!40817 l!644))) b!1242404))

(check-sat (not b!1242324) (not b!1242390) (not b!1242217) (not d!136877) (not b!1242321) (not b!1242376) (not b!1242336) (not bm!61259) (not b!1242371) (not d!136865) (not b!1242243) (not b!1242404) (not b!1242215) (not b!1242326) (not bm!61247) (not d!136869) (not b!1242340) (not b!1242362) (not d!136849) (not b!1242374) (not d!136855) (not b!1242247) (not b!1242394) (not d!136881) tp_is_empty!31219)
(check-sat)
