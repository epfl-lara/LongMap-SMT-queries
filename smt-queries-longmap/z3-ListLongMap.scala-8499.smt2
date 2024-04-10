; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103580 () Bool)

(assert start!103580)

(declare-fun b!1240858 () Bool)

(declare-fun e!703334 () Bool)

(declare-fun tp_is_empty!31221 () Bool)

(declare-fun tp!92585 () Bool)

(assert (=> b!1240858 (= e!703334 (and tp_is_empty!31221 tp!92585))))

(declare-fun b!1240859 () Bool)

(declare-fun e!703335 () Bool)

(declare-datatypes ((B!1822 0))(
  ( (B!1823 (val!15673 Int)) )
))
(declare-datatypes ((tuple2!20218 0))(
  ( (tuple2!20219 (_1!10120 (_ BitVec 64)) (_2!10120 B!1822)) )
))
(declare-datatypes ((List!27338 0))(
  ( (Nil!27335) (Cons!27334 (h!28543 tuple2!20218) (t!40801 List!27338)) )
))
(declare-fun l!644 () List!27338)

(declare-fun key2!15 () (_ BitVec 64))

(declare-fun isStrictlySorted!740 (List!27338) Bool)

(declare-fun removeStrictlySorted!119 (List!27338 (_ BitVec 64)) List!27338)

(assert (=> b!1240859 (= e!703335 (not (isStrictlySorted!740 (removeStrictlySorted!119 l!644 key2!15))))))

(declare-fun v1!20 () B!1822)

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun insertStrictlySorted!426 (List!27338 (_ BitVec 64) B!1822) List!27338)

(assert (=> b!1240859 (= (insertStrictlySorted!426 (removeStrictlySorted!119 (t!40801 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!119 (insertStrictlySorted!426 (t!40801 l!644) key1!25 v1!20) key2!15))))

(declare-datatypes ((Unit!41245 0))(
  ( (Unit!41246) )
))
(declare-fun lt!562049 () Unit!41245)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!8 (List!27338 (_ BitVec 64) B!1822 (_ BitVec 64)) Unit!41245)

(assert (=> b!1240859 (= lt!562049 (lemmaInsertAndRemoveStrictlySortedCommutative!8 (t!40801 l!644) key1!25 v1!20 key2!15))))

(declare-fun b!1240860 () Bool)

(declare-fun res!827902 () Bool)

(assert (=> b!1240860 (=> (not res!827902) (not e!703335))))

(get-info :version)

(assert (=> b!1240860 (= res!827902 ((_ is Cons!27334) l!644))))

(declare-fun b!1240861 () Bool)

(declare-fun res!827904 () Bool)

(assert (=> b!1240861 (=> (not res!827904) (not e!703335))))

(assert (=> b!1240861 (= res!827904 (isStrictlySorted!740 (t!40801 l!644)))))

(declare-fun b!1240862 () Bool)

(declare-fun res!827905 () Bool)

(assert (=> b!1240862 (=> (not res!827905) (not e!703335))))

(assert (=> b!1240862 (= res!827905 (isStrictlySorted!740 l!644))))

(declare-fun res!827903 () Bool)

(assert (=> start!103580 (=> (not res!827903) (not e!703335))))

(assert (=> start!103580 (= res!827903 (not (= key1!25 key2!15)))))

(assert (=> start!103580 e!703335))

(assert (=> start!103580 true))

(assert (=> start!103580 e!703334))

(assert (=> start!103580 tp_is_empty!31221))

(assert (= (and start!103580 res!827903) b!1240862))

(assert (= (and b!1240862 res!827905) b!1240860))

(assert (= (and b!1240860 res!827902) b!1240861))

(assert (= (and b!1240861 res!827904) b!1240859))

(assert (= (and start!103580 ((_ is Cons!27334) l!644)) b!1240858))

(declare-fun m!1144111 () Bool)

(assert (=> b!1240859 m!1144111))

(declare-fun m!1144113 () Bool)

(assert (=> b!1240859 m!1144113))

(declare-fun m!1144115 () Bool)

(assert (=> b!1240859 m!1144115))

(assert (=> b!1240859 m!1144113))

(declare-fun m!1144117 () Bool)

(assert (=> b!1240859 m!1144117))

(declare-fun m!1144119 () Bool)

(assert (=> b!1240859 m!1144119))

(assert (=> b!1240859 m!1144117))

(declare-fun m!1144121 () Bool)

(assert (=> b!1240859 m!1144121))

(assert (=> b!1240859 m!1144111))

(declare-fun m!1144123 () Bool)

(assert (=> b!1240859 m!1144123))

(declare-fun m!1144125 () Bool)

(assert (=> b!1240861 m!1144125))

(declare-fun m!1144127 () Bool)

(assert (=> b!1240862 m!1144127))

(check-sat (not b!1240862) tp_is_empty!31221 (not b!1240861) (not b!1240858) (not b!1240859))
(check-sat)
(get-model)

(declare-fun d!136377 () Bool)

(declare-fun res!827931 () Bool)

(declare-fun e!703355 () Bool)

(assert (=> d!136377 (=> res!827931 e!703355)))

(assert (=> d!136377 (= res!827931 (or ((_ is Nil!27335) l!644) ((_ is Nil!27335) (t!40801 l!644))))))

(assert (=> d!136377 (= (isStrictlySorted!740 l!644) e!703355)))

(declare-fun b!1240891 () Bool)

(declare-fun e!703357 () Bool)

(assert (=> b!1240891 (= e!703355 e!703357)))

(declare-fun res!827933 () Bool)

(assert (=> b!1240891 (=> (not res!827933) (not e!703357))))

(assert (=> b!1240891 (= res!827933 (bvslt (_1!10120 (h!28543 l!644)) (_1!10120 (h!28543 (t!40801 l!644)))))))

(declare-fun b!1240893 () Bool)

(assert (=> b!1240893 (= e!703357 (isStrictlySorted!740 (t!40801 l!644)))))

(assert (= (and d!136377 (not res!827931)) b!1240891))

(assert (= (and b!1240891 res!827933) b!1240893))

(assert (=> b!1240893 m!1144125))

(assert (=> b!1240862 d!136377))

(declare-fun d!136383 () Bool)

(declare-fun res!827935 () Bool)

(declare-fun e!703359 () Bool)

(assert (=> d!136383 (=> res!827935 e!703359)))

(assert (=> d!136383 (= res!827935 (or ((_ is Nil!27335) (t!40801 l!644)) ((_ is Nil!27335) (t!40801 (t!40801 l!644)))))))

(assert (=> d!136383 (= (isStrictlySorted!740 (t!40801 l!644)) e!703359)))

(declare-fun b!1240895 () Bool)

(declare-fun e!703361 () Bool)

(assert (=> b!1240895 (= e!703359 e!703361)))

(declare-fun res!827937 () Bool)

(assert (=> b!1240895 (=> (not res!827937) (not e!703361))))

(assert (=> b!1240895 (= res!827937 (bvslt (_1!10120 (h!28543 (t!40801 l!644))) (_1!10120 (h!28543 (t!40801 (t!40801 l!644))))))))

(declare-fun b!1240897 () Bool)

(assert (=> b!1240897 (= e!703361 (isStrictlySorted!740 (t!40801 (t!40801 l!644))))))

(assert (= (and d!136383 (not res!827935)) b!1240895))

(assert (= (and b!1240895 res!827937) b!1240897))

(declare-fun m!1144149 () Bool)

(assert (=> b!1240897 m!1144149))

(assert (=> b!1240861 d!136383))

(declare-fun b!1240937 () Bool)

(declare-fun e!703388 () List!27338)

(assert (=> b!1240937 (= e!703388 Nil!27335)))

(declare-fun b!1240938 () Bool)

(declare-fun $colon$colon!614 (List!27338 tuple2!20218) List!27338)

(assert (=> b!1240938 (= e!703388 ($colon$colon!614 (removeStrictlySorted!119 (t!40801 (insertStrictlySorted!426 (t!40801 l!644) key1!25 v1!20)) key2!15) (h!28543 (insertStrictlySorted!426 (t!40801 l!644) key1!25 v1!20))))))

(declare-fun b!1240939 () Bool)

(declare-fun e!703389 () List!27338)

(assert (=> b!1240939 (= e!703389 e!703388)))

(declare-fun c!121304 () Bool)

(assert (=> b!1240939 (= c!121304 (and ((_ is Cons!27334) (insertStrictlySorted!426 (t!40801 l!644) key1!25 v1!20)) (not (= (_1!10120 (h!28543 (insertStrictlySorted!426 (t!40801 l!644) key1!25 v1!20))) key2!15))))))

(declare-fun b!1240940 () Bool)

(declare-fun e!703387 () Bool)

(declare-fun lt!562060 () List!27338)

(declare-fun containsKey!601 (List!27338 (_ BitVec 64)) Bool)

(assert (=> b!1240940 (= e!703387 (not (containsKey!601 lt!562060 key2!15)))))

(declare-fun b!1240941 () Bool)

(assert (=> b!1240941 (= e!703389 (t!40801 (insertStrictlySorted!426 (t!40801 l!644) key1!25 v1!20)))))

(declare-fun d!136387 () Bool)

(assert (=> d!136387 e!703387))

(declare-fun res!827949 () Bool)

(assert (=> d!136387 (=> (not res!827949) (not e!703387))))

(assert (=> d!136387 (= res!827949 (isStrictlySorted!740 lt!562060))))

(assert (=> d!136387 (= lt!562060 e!703389)))

(declare-fun c!121303 () Bool)

(assert (=> d!136387 (= c!121303 (and ((_ is Cons!27334) (insertStrictlySorted!426 (t!40801 l!644) key1!25 v1!20)) (= (_1!10120 (h!28543 (insertStrictlySorted!426 (t!40801 l!644) key1!25 v1!20))) key2!15)))))

(assert (=> d!136387 (isStrictlySorted!740 (insertStrictlySorted!426 (t!40801 l!644) key1!25 v1!20))))

(assert (=> d!136387 (= (removeStrictlySorted!119 (insertStrictlySorted!426 (t!40801 l!644) key1!25 v1!20) key2!15) lt!562060)))

(assert (= (and d!136387 c!121303) b!1240941))

(assert (= (and d!136387 (not c!121303)) b!1240939))

(assert (= (and b!1240939 c!121304) b!1240938))

(assert (= (and b!1240939 (not c!121304)) b!1240937))

(assert (= (and d!136387 res!827949) b!1240940))

(declare-fun m!1144157 () Bool)

(assert (=> b!1240938 m!1144157))

(assert (=> b!1240938 m!1144157))

(declare-fun m!1144163 () Bool)

(assert (=> b!1240938 m!1144163))

(declare-fun m!1144165 () Bool)

(assert (=> b!1240940 m!1144165))

(declare-fun m!1144169 () Bool)

(assert (=> d!136387 m!1144169))

(assert (=> d!136387 m!1144113))

(declare-fun m!1144171 () Bool)

(assert (=> d!136387 m!1144171))

(assert (=> b!1240859 d!136387))

(declare-fun b!1241007 () Bool)

(declare-fun e!703425 () List!27338)

(declare-fun call!61185 () List!27338)

(assert (=> b!1241007 (= e!703425 call!61185)))

(declare-fun b!1241008 () Bool)

(assert (=> b!1241008 (= e!703425 call!61185)))

(declare-fun b!1241009 () Bool)

(declare-fun e!703423 () List!27338)

(declare-fun call!61184 () List!27338)

(assert (=> b!1241009 (= e!703423 call!61184)))

(declare-fun b!1241010 () Bool)

(declare-fun e!703424 () List!27338)

(assert (=> b!1241010 (= e!703424 (insertStrictlySorted!426 (t!40801 (removeStrictlySorted!119 (t!40801 l!644) key2!15)) key1!25 v1!20))))

(declare-fun b!1241011 () Bool)

(declare-fun e!703427 () List!27338)

(declare-fun call!61186 () List!27338)

(assert (=> b!1241011 (= e!703427 call!61186)))

(declare-fun bm!61181 () Bool)

(assert (=> bm!61181 (= call!61185 call!61184)))

(declare-fun bm!61182 () Bool)

(assert (=> bm!61182 (= call!61184 call!61186)))

(declare-fun d!136395 () Bool)

(declare-fun e!703426 () Bool)

(assert (=> d!136395 e!703426))

(declare-fun res!827963 () Bool)

(assert (=> d!136395 (=> (not res!827963) (not e!703426))))

(declare-fun lt!562068 () List!27338)

(assert (=> d!136395 (= res!827963 (isStrictlySorted!740 lt!562068))))

(assert (=> d!136395 (= lt!562068 e!703427)))

(declare-fun c!121331 () Bool)

(assert (=> d!136395 (= c!121331 (and ((_ is Cons!27334) (removeStrictlySorted!119 (t!40801 l!644) key2!15)) (bvslt (_1!10120 (h!28543 (removeStrictlySorted!119 (t!40801 l!644) key2!15))) key1!25)))))

(assert (=> d!136395 (isStrictlySorted!740 (removeStrictlySorted!119 (t!40801 l!644) key2!15))))

(assert (=> d!136395 (= (insertStrictlySorted!426 (removeStrictlySorted!119 (t!40801 l!644) key2!15) key1!25 v1!20) lt!562068)))

(declare-fun c!121333 () Bool)

(declare-fun c!121332 () Bool)

(declare-fun b!1241012 () Bool)

(assert (=> b!1241012 (= e!703424 (ite c!121332 (t!40801 (removeStrictlySorted!119 (t!40801 l!644) key2!15)) (ite c!121333 (Cons!27334 (h!28543 (removeStrictlySorted!119 (t!40801 l!644) key2!15)) (t!40801 (removeStrictlySorted!119 (t!40801 l!644) key2!15))) Nil!27335)))))

(declare-fun b!1241013 () Bool)

(assert (=> b!1241013 (= e!703427 e!703423)))

(assert (=> b!1241013 (= c!121332 (and ((_ is Cons!27334) (removeStrictlySorted!119 (t!40801 l!644) key2!15)) (= (_1!10120 (h!28543 (removeStrictlySorted!119 (t!40801 l!644) key2!15))) key1!25)))))

(declare-fun b!1241014 () Bool)

(declare-fun res!827964 () Bool)

(assert (=> b!1241014 (=> (not res!827964) (not e!703426))))

(assert (=> b!1241014 (= res!827964 (containsKey!601 lt!562068 key1!25))))

(declare-fun b!1241015 () Bool)

(declare-fun contains!7384 (List!27338 tuple2!20218) Bool)

(assert (=> b!1241015 (= e!703426 (contains!7384 lt!562068 (tuple2!20219 key1!25 v1!20)))))

(declare-fun bm!61183 () Bool)

(assert (=> bm!61183 (= call!61186 ($colon$colon!614 e!703424 (ite c!121331 (h!28543 (removeStrictlySorted!119 (t!40801 l!644) key2!15)) (tuple2!20219 key1!25 v1!20))))))

(declare-fun c!121334 () Bool)

(assert (=> bm!61183 (= c!121334 c!121331)))

(declare-fun b!1241016 () Bool)

(assert (=> b!1241016 (= c!121333 (and ((_ is Cons!27334) (removeStrictlySorted!119 (t!40801 l!644) key2!15)) (bvsgt (_1!10120 (h!28543 (removeStrictlySorted!119 (t!40801 l!644) key2!15))) key1!25)))))

(assert (=> b!1241016 (= e!703423 e!703425)))

(assert (= (and d!136395 c!121331) b!1241011))

(assert (= (and d!136395 (not c!121331)) b!1241013))

(assert (= (and b!1241013 c!121332) b!1241009))

(assert (= (and b!1241013 (not c!121332)) b!1241016))

(assert (= (and b!1241016 c!121333) b!1241008))

(assert (= (and b!1241016 (not c!121333)) b!1241007))

(assert (= (or b!1241008 b!1241007) bm!61181))

(assert (= (or b!1241009 bm!61181) bm!61182))

(assert (= (or b!1241011 bm!61182) bm!61183))

(assert (= (and bm!61183 c!121334) b!1241010))

(assert (= (and bm!61183 (not c!121334)) b!1241012))

(assert (= (and d!136395 res!827963) b!1241014))

(assert (= (and b!1241014 res!827964) b!1241015))

(declare-fun m!1144183 () Bool)

(assert (=> bm!61183 m!1144183))

(declare-fun m!1144185 () Bool)

(assert (=> d!136395 m!1144185))

(assert (=> d!136395 m!1144117))

(declare-fun m!1144189 () Bool)

(assert (=> d!136395 m!1144189))

(declare-fun m!1144191 () Bool)

(assert (=> b!1241014 m!1144191))

(declare-fun m!1144197 () Bool)

(assert (=> b!1241015 m!1144197))

(declare-fun m!1144203 () Bool)

(assert (=> b!1241010 m!1144203))

(assert (=> b!1240859 d!136395))

(declare-fun b!1241037 () Bool)

(declare-fun e!703439 () List!27338)

(assert (=> b!1241037 (= e!703439 Nil!27335)))

(declare-fun b!1241038 () Bool)

(assert (=> b!1241038 (= e!703439 ($colon$colon!614 (removeStrictlySorted!119 (t!40801 l!644) key2!15) (h!28543 l!644)))))

(declare-fun b!1241039 () Bool)

(declare-fun e!703440 () List!27338)

(assert (=> b!1241039 (= e!703440 e!703439)))

(declare-fun c!121344 () Bool)

(assert (=> b!1241039 (= c!121344 (and ((_ is Cons!27334) l!644) (not (= (_1!10120 (h!28543 l!644)) key2!15))))))

(declare-fun b!1241040 () Bool)

(declare-fun e!703438 () Bool)

(declare-fun lt!562071 () List!27338)

(assert (=> b!1241040 (= e!703438 (not (containsKey!601 lt!562071 key2!15)))))

(declare-fun b!1241041 () Bool)

(assert (=> b!1241041 (= e!703440 (t!40801 l!644))))

(declare-fun d!136399 () Bool)

(assert (=> d!136399 e!703438))

(declare-fun res!827969 () Bool)

(assert (=> d!136399 (=> (not res!827969) (not e!703438))))

(assert (=> d!136399 (= res!827969 (isStrictlySorted!740 lt!562071))))

(assert (=> d!136399 (= lt!562071 e!703440)))

(declare-fun c!121343 () Bool)

(assert (=> d!136399 (= c!121343 (and ((_ is Cons!27334) l!644) (= (_1!10120 (h!28543 l!644)) key2!15)))))

(assert (=> d!136399 (isStrictlySorted!740 l!644)))

(assert (=> d!136399 (= (removeStrictlySorted!119 l!644 key2!15) lt!562071)))

(assert (= (and d!136399 c!121343) b!1241041))

(assert (= (and d!136399 (not c!121343)) b!1241039))

(assert (= (and b!1241039 c!121344) b!1241038))

(assert (= (and b!1241039 (not c!121344)) b!1241037))

(assert (= (and d!136399 res!827969) b!1241040))

(assert (=> b!1241038 m!1144117))

(assert (=> b!1241038 m!1144117))

(declare-fun m!1144221 () Bool)

(assert (=> b!1241038 m!1144221))

(declare-fun m!1144224 () Bool)

(assert (=> b!1241040 m!1144224))

(declare-fun m!1144227 () Bool)

(assert (=> d!136399 m!1144227))

(assert (=> d!136399 m!1144127))

(assert (=> b!1240859 d!136399))

(declare-fun d!136405 () Bool)

(assert (=> d!136405 (= (insertStrictlySorted!426 (removeStrictlySorted!119 (t!40801 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!119 (insertStrictlySorted!426 (t!40801 l!644) key1!25 v1!20) key2!15))))

(declare-fun lt!562080 () Unit!41245)

(declare-fun choose!1834 (List!27338 (_ BitVec 64) B!1822 (_ BitVec 64)) Unit!41245)

(assert (=> d!136405 (= lt!562080 (choose!1834 (t!40801 l!644) key1!25 v1!20 key2!15))))

(assert (=> d!136405 (not (= key1!25 key2!15))))

(assert (=> d!136405 (= (lemmaInsertAndRemoveStrictlySortedCommutative!8 (t!40801 l!644) key1!25 v1!20 key2!15) lt!562080)))

(declare-fun bs!34937 () Bool)

(assert (= bs!34937 d!136405))

(assert (=> bs!34937 m!1144113))

(assert (=> bs!34937 m!1144115))

(assert (=> bs!34937 m!1144113))

(assert (=> bs!34937 m!1144117))

(assert (=> bs!34937 m!1144121))

(declare-fun m!1144237 () Bool)

(assert (=> bs!34937 m!1144237))

(assert (=> bs!34937 m!1144117))

(assert (=> b!1240859 d!136405))

(declare-fun d!136411 () Bool)

(declare-fun res!827972 () Bool)

(declare-fun e!703447 () Bool)

(assert (=> d!136411 (=> res!827972 e!703447)))

(assert (=> d!136411 (= res!827972 (or ((_ is Nil!27335) (removeStrictlySorted!119 l!644 key2!15)) ((_ is Nil!27335) (t!40801 (removeStrictlySorted!119 l!644 key2!15)))))))

(assert (=> d!136411 (= (isStrictlySorted!740 (removeStrictlySorted!119 l!644 key2!15)) e!703447)))

(declare-fun b!1241052 () Bool)

(declare-fun e!703448 () Bool)

(assert (=> b!1241052 (= e!703447 e!703448)))

(declare-fun res!827973 () Bool)

(assert (=> b!1241052 (=> (not res!827973) (not e!703448))))

(assert (=> b!1241052 (= res!827973 (bvslt (_1!10120 (h!28543 (removeStrictlySorted!119 l!644 key2!15))) (_1!10120 (h!28543 (t!40801 (removeStrictlySorted!119 l!644 key2!15))))))))

(declare-fun b!1241053 () Bool)

(assert (=> b!1241053 (= e!703448 (isStrictlySorted!740 (t!40801 (removeStrictlySorted!119 l!644 key2!15))))))

(assert (= (and d!136411 (not res!827972)) b!1241052))

(assert (= (and b!1241052 res!827973) b!1241053))

(declare-fun m!1144243 () Bool)

(assert (=> b!1241053 m!1144243))

(assert (=> b!1240859 d!136411))

(declare-fun b!1241058 () Bool)

(declare-fun e!703455 () List!27338)

(declare-fun call!61194 () List!27338)

(assert (=> b!1241058 (= e!703455 call!61194)))

(declare-fun b!1241059 () Bool)

(assert (=> b!1241059 (= e!703455 call!61194)))

(declare-fun b!1241060 () Bool)

(declare-fun e!703453 () List!27338)

(declare-fun call!61193 () List!27338)

(assert (=> b!1241060 (= e!703453 call!61193)))

(declare-fun b!1241061 () Bool)

(declare-fun e!703454 () List!27338)

(assert (=> b!1241061 (= e!703454 (insertStrictlySorted!426 (t!40801 (t!40801 l!644)) key1!25 v1!20))))

(declare-fun b!1241062 () Bool)

(declare-fun e!703460 () List!27338)

(declare-fun call!61198 () List!27338)

(assert (=> b!1241062 (= e!703460 call!61198)))

(declare-fun bm!61190 () Bool)

(assert (=> bm!61190 (= call!61194 call!61193)))

(declare-fun bm!61191 () Bool)

(assert (=> bm!61191 (= call!61193 call!61198)))

(declare-fun d!136417 () Bool)

(declare-fun e!703457 () Bool)

(assert (=> d!136417 e!703457))

(declare-fun res!827978 () Bool)

(assert (=> d!136417 (=> (not res!827978) (not e!703457))))

(declare-fun lt!562083 () List!27338)

(assert (=> d!136417 (= res!827978 (isStrictlySorted!740 lt!562083))))

(assert (=> d!136417 (= lt!562083 e!703460)))

(declare-fun c!121349 () Bool)

(assert (=> d!136417 (= c!121349 (and ((_ is Cons!27334) (t!40801 l!644)) (bvslt (_1!10120 (h!28543 (t!40801 l!644))) key1!25)))))

(assert (=> d!136417 (isStrictlySorted!740 (t!40801 l!644))))

(assert (=> d!136417 (= (insertStrictlySorted!426 (t!40801 l!644) key1!25 v1!20) lt!562083)))

(declare-fun c!121351 () Bool)

(declare-fun b!1241065 () Bool)

(declare-fun c!121350 () Bool)

(assert (=> b!1241065 (= e!703454 (ite c!121350 (t!40801 (t!40801 l!644)) (ite c!121351 (Cons!27334 (h!28543 (t!40801 l!644)) (t!40801 (t!40801 l!644))) Nil!27335)))))

(declare-fun b!1241067 () Bool)

(assert (=> b!1241067 (= e!703460 e!703453)))

(assert (=> b!1241067 (= c!121350 (and ((_ is Cons!27334) (t!40801 l!644)) (= (_1!10120 (h!28543 (t!40801 l!644))) key1!25)))))

(declare-fun b!1241069 () Bool)

(declare-fun res!827979 () Bool)

(assert (=> b!1241069 (=> (not res!827979) (not e!703457))))

(assert (=> b!1241069 (= res!827979 (containsKey!601 lt!562083 key1!25))))

(declare-fun b!1241071 () Bool)

(assert (=> b!1241071 (= e!703457 (contains!7384 lt!562083 (tuple2!20219 key1!25 v1!20)))))

(declare-fun bm!61193 () Bool)

(assert (=> bm!61193 (= call!61198 ($colon$colon!614 e!703454 (ite c!121349 (h!28543 (t!40801 l!644)) (tuple2!20219 key1!25 v1!20))))))

(declare-fun c!121352 () Bool)

(assert (=> bm!61193 (= c!121352 c!121349)))

(declare-fun b!1241073 () Bool)

(assert (=> b!1241073 (= c!121351 (and ((_ is Cons!27334) (t!40801 l!644)) (bvsgt (_1!10120 (h!28543 (t!40801 l!644))) key1!25)))))

(assert (=> b!1241073 (= e!703453 e!703455)))

(assert (= (and d!136417 c!121349) b!1241062))

(assert (= (and d!136417 (not c!121349)) b!1241067))

(assert (= (and b!1241067 c!121350) b!1241060))

(assert (= (and b!1241067 (not c!121350)) b!1241073))

(assert (= (and b!1241073 c!121351) b!1241059))

(assert (= (and b!1241073 (not c!121351)) b!1241058))

(assert (= (or b!1241059 b!1241058) bm!61190))

(assert (= (or b!1241060 bm!61190) bm!61191))

(assert (= (or b!1241062 bm!61191) bm!61193))

(assert (= (and bm!61193 c!121352) b!1241061))

(assert (= (and bm!61193 (not c!121352)) b!1241065))

(assert (= (and d!136417 res!827978) b!1241069))

(assert (= (and b!1241069 res!827979) b!1241071))

(declare-fun m!1144249 () Bool)

(assert (=> bm!61193 m!1144249))

(declare-fun m!1144254 () Bool)

(assert (=> d!136417 m!1144254))

(assert (=> d!136417 m!1144125))

(declare-fun m!1144257 () Bool)

(assert (=> b!1241069 m!1144257))

(declare-fun m!1144265 () Bool)

(assert (=> b!1241071 m!1144265))

(declare-fun m!1144271 () Bool)

(assert (=> b!1241061 m!1144271))

(assert (=> b!1240859 d!136417))

(declare-fun b!1241088 () Bool)

(declare-fun e!703469 () List!27338)

(assert (=> b!1241088 (= e!703469 Nil!27335)))

(declare-fun b!1241089 () Bool)

(assert (=> b!1241089 (= e!703469 ($colon$colon!614 (removeStrictlySorted!119 (t!40801 (t!40801 l!644)) key2!15) (h!28543 (t!40801 l!644))))))

(declare-fun b!1241090 () Bool)

(declare-fun e!703470 () List!27338)

(assert (=> b!1241090 (= e!703470 e!703469)))

(declare-fun c!121362 () Bool)

(assert (=> b!1241090 (= c!121362 (and ((_ is Cons!27334) (t!40801 l!644)) (not (= (_1!10120 (h!28543 (t!40801 l!644))) key2!15))))))

(declare-fun b!1241091 () Bool)

(declare-fun e!703468 () Bool)

(declare-fun lt!562086 () List!27338)

(assert (=> b!1241091 (= e!703468 (not (containsKey!601 lt!562086 key2!15)))))

(declare-fun b!1241092 () Bool)

(assert (=> b!1241092 (= e!703470 (t!40801 (t!40801 l!644)))))

(declare-fun d!136423 () Bool)

(assert (=> d!136423 e!703468))

(declare-fun res!827984 () Bool)

(assert (=> d!136423 (=> (not res!827984) (not e!703468))))

(assert (=> d!136423 (= res!827984 (isStrictlySorted!740 lt!562086))))

(assert (=> d!136423 (= lt!562086 e!703470)))

(declare-fun c!121361 () Bool)

(assert (=> d!136423 (= c!121361 (and ((_ is Cons!27334) (t!40801 l!644)) (= (_1!10120 (h!28543 (t!40801 l!644))) key2!15)))))

(assert (=> d!136423 (isStrictlySorted!740 (t!40801 l!644))))

(assert (=> d!136423 (= (removeStrictlySorted!119 (t!40801 l!644) key2!15) lt!562086)))

(assert (= (and d!136423 c!121361) b!1241092))

(assert (= (and d!136423 (not c!121361)) b!1241090))

(assert (= (and b!1241090 c!121362) b!1241089))

(assert (= (and b!1241090 (not c!121362)) b!1241088))

(assert (= (and d!136423 res!827984) b!1241091))

(declare-fun m!1144279 () Bool)

(assert (=> b!1241089 m!1144279))

(assert (=> b!1241089 m!1144279))

(declare-fun m!1144287 () Bool)

(assert (=> b!1241089 m!1144287))

(declare-fun m!1144289 () Bool)

(assert (=> b!1241091 m!1144289))

(declare-fun m!1144295 () Bool)

(assert (=> d!136423 m!1144295))

(assert (=> d!136423 m!1144125))

(assert (=> b!1240859 d!136423))

(declare-fun b!1241116 () Bool)

(declare-fun e!703484 () Bool)

(declare-fun tp!92596 () Bool)

(assert (=> b!1241116 (= e!703484 (and tp_is_empty!31221 tp!92596))))

(assert (=> b!1240858 (= tp!92585 e!703484)))

(assert (= (and b!1240858 ((_ is Cons!27334) (t!40801 l!644))) b!1241116))

(check-sat (not bm!61193) (not b!1241038) (not b!1240940) (not b!1241071) (not d!136395) (not b!1241061) (not b!1241116) (not b!1241089) (not b!1240893) (not b!1241010) (not d!136387) (not b!1241069) (not d!136417) (not b!1241015) (not b!1241091) (not b!1241014) tp_is_empty!31221 (not b!1241053) (not b!1240897) (not d!136405) (not b!1240938) (not d!136399) (not d!136423) (not bm!61183) (not b!1241040))
(check-sat)
