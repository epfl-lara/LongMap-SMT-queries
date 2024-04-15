; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103570 () Bool)

(assert start!103570)

(declare-fun b!1240755 () Bool)

(declare-fun res!827844 () Bool)

(declare-fun e!703278 () Bool)

(assert (=> b!1240755 (=> (not res!827844) (not e!703278))))

(declare-datatypes ((B!1820 0))(
  ( (B!1821 (val!15672 Int)) )
))
(declare-datatypes ((tuple2!20300 0))(
  ( (tuple2!20301 (_1!10161 (_ BitVec 64)) (_2!10161 B!1820)) )
))
(declare-datatypes ((List!27399 0))(
  ( (Nil!27396) (Cons!27395 (h!28604 tuple2!20300) (t!40853 List!27399)) )
))
(declare-fun l!644 () List!27399)

(declare-fun isStrictlySorted!735 (List!27399) Bool)

(assert (=> b!1240755 (= res!827844 (isStrictlySorted!735 (t!40853 l!644)))))

(declare-fun b!1240756 () Bool)

(declare-fun res!827845 () Bool)

(assert (=> b!1240756 (=> (not res!827845) (not e!703278))))

(get-info :version)

(assert (=> b!1240756 (= res!827845 ((_ is Cons!27395) l!644))))

(declare-fun b!1240757 () Bool)

(declare-fun e!703277 () Bool)

(declare-fun tp_is_empty!31219 () Bool)

(declare-fun tp!92582 () Bool)

(assert (=> b!1240757 (= e!703277 (and tp_is_empty!31219 tp!92582))))

(declare-fun b!1240758 () Bool)

(declare-fun res!827846 () Bool)

(assert (=> b!1240758 (=> (not res!827846) (not e!703278))))

(assert (=> b!1240758 (= res!827846 (isStrictlySorted!735 l!644))))

(declare-fun b!1240759 () Bool)

(declare-fun key2!15 () (_ BitVec 64))

(declare-fun removeStrictlySorted!118 (List!27399 (_ BitVec 64)) List!27399)

(assert (=> b!1240759 (= e!703278 (not (isStrictlySorted!735 (removeStrictlySorted!118 l!644 key2!15))))))

(declare-fun v1!20 () B!1820)

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun insertStrictlySorted!426 (List!27399 (_ BitVec 64) B!1820) List!27399)

(assert (=> b!1240759 (= (insertStrictlySorted!426 (removeStrictlySorted!118 (t!40853 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!118 (insertStrictlySorted!426 (t!40853 l!644) key1!25 v1!20) key2!15))))

(declare-datatypes ((Unit!41088 0))(
  ( (Unit!41089) )
))
(declare-fun lt!561867 () Unit!41088)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!7 (List!27399 (_ BitVec 64) B!1820 (_ BitVec 64)) Unit!41088)

(assert (=> b!1240759 (= lt!561867 (lemmaInsertAndRemoveStrictlySortedCommutative!7 (t!40853 l!644) key1!25 v1!20 key2!15))))

(declare-fun res!827847 () Bool)

(assert (=> start!103570 (=> (not res!827847) (not e!703278))))

(assert (=> start!103570 (= res!827847 (not (= key1!25 key2!15)))))

(assert (=> start!103570 e!703278))

(assert (=> start!103570 true))

(assert (=> start!103570 e!703277))

(assert (=> start!103570 tp_is_empty!31219))

(assert (= (and start!103570 res!827847) b!1240758))

(assert (= (and b!1240758 res!827846) b!1240756))

(assert (= (and b!1240756 res!827845) b!1240755))

(assert (= (and b!1240755 res!827844) b!1240759))

(assert (= (and start!103570 ((_ is Cons!27395) l!644)) b!1240757))

(declare-fun m!1143561 () Bool)

(assert (=> b!1240755 m!1143561))

(declare-fun m!1143563 () Bool)

(assert (=> b!1240758 m!1143563))

(declare-fun m!1143565 () Bool)

(assert (=> b!1240759 m!1143565))

(declare-fun m!1143567 () Bool)

(assert (=> b!1240759 m!1143567))

(declare-fun m!1143569 () Bool)

(assert (=> b!1240759 m!1143569))

(assert (=> b!1240759 m!1143567))

(declare-fun m!1143571 () Bool)

(assert (=> b!1240759 m!1143571))

(declare-fun m!1143573 () Bool)

(assert (=> b!1240759 m!1143573))

(assert (=> b!1240759 m!1143571))

(declare-fun m!1143575 () Bool)

(assert (=> b!1240759 m!1143575))

(assert (=> b!1240759 m!1143565))

(declare-fun m!1143577 () Bool)

(assert (=> b!1240759 m!1143577))

(check-sat (not b!1240758) (not b!1240757) (not b!1240759) tp_is_empty!31219 (not b!1240755))
(check-sat)
(get-model)

(declare-fun d!136243 () Bool)

(declare-fun res!827884 () Bool)

(declare-fun e!703303 () Bool)

(assert (=> d!136243 (=> res!827884 e!703303)))

(assert (=> d!136243 (= res!827884 (or ((_ is Nil!27396) l!644) ((_ is Nil!27396) (t!40853 l!644))))))

(assert (=> d!136243 (= (isStrictlySorted!735 l!644) e!703303)))

(declare-fun b!1240802 () Bool)

(declare-fun e!703304 () Bool)

(assert (=> b!1240802 (= e!703303 e!703304)))

(declare-fun res!827885 () Bool)

(assert (=> b!1240802 (=> (not res!827885) (not e!703304))))

(assert (=> b!1240802 (= res!827885 (bvslt (_1!10161 (h!28604 l!644)) (_1!10161 (h!28604 (t!40853 l!644)))))))

(declare-fun b!1240803 () Bool)

(assert (=> b!1240803 (= e!703304 (isStrictlySorted!735 (t!40853 l!644)))))

(assert (= (and d!136243 (not res!827884)) b!1240802))

(assert (= (and b!1240802 res!827885) b!1240803))

(assert (=> b!1240803 m!1143561))

(assert (=> b!1240758 d!136243))

(declare-fun d!136249 () Bool)

(declare-fun res!827886 () Bool)

(declare-fun e!703307 () Bool)

(assert (=> d!136249 (=> res!827886 e!703307)))

(assert (=> d!136249 (= res!827886 (or ((_ is Nil!27396) (t!40853 l!644)) ((_ is Nil!27396) (t!40853 (t!40853 l!644)))))))

(assert (=> d!136249 (= (isStrictlySorted!735 (t!40853 l!644)) e!703307)))

(declare-fun b!1240811 () Bool)

(declare-fun e!703308 () Bool)

(assert (=> b!1240811 (= e!703307 e!703308)))

(declare-fun res!827887 () Bool)

(assert (=> b!1240811 (=> (not res!827887) (not e!703308))))

(assert (=> b!1240811 (= res!827887 (bvslt (_1!10161 (h!28604 (t!40853 l!644))) (_1!10161 (h!28604 (t!40853 (t!40853 l!644))))))))

(declare-fun b!1240813 () Bool)

(assert (=> b!1240813 (= e!703308 (isStrictlySorted!735 (t!40853 (t!40853 l!644))))))

(assert (= (and d!136249 (not res!827886)) b!1240811))

(assert (= (and b!1240811 res!827887) b!1240813))

(declare-fun m!1143617 () Bool)

(assert (=> b!1240813 m!1143617))

(assert (=> b!1240755 d!136249))

(declare-fun b!1240846 () Bool)

(declare-fun e!703332 () List!27399)

(assert (=> b!1240846 (= e!703332 Nil!27396)))

(declare-fun e!703333 () List!27399)

(declare-fun b!1240847 () Bool)

(assert (=> b!1240847 (= e!703333 (t!40853 (insertStrictlySorted!426 (t!40853 l!644) key1!25 v1!20)))))

(declare-fun b!1240848 () Bool)

(assert (=> b!1240848 (= e!703333 e!703332)))

(declare-fun c!121287 () Bool)

(assert (=> b!1240848 (= c!121287 (and ((_ is Cons!27395) (insertStrictlySorted!426 (t!40853 l!644) key1!25 v1!20)) (not (= (_1!10161 (h!28604 (insertStrictlySorted!426 (t!40853 l!644) key1!25 v1!20))) key2!15))))))

(declare-fun b!1240849 () Bool)

(declare-fun e!703331 () Bool)

(declare-fun lt!561882 () List!27399)

(declare-fun containsKey!602 (List!27399 (_ BitVec 64)) Bool)

(assert (=> b!1240849 (= e!703331 (not (containsKey!602 lt!561882 key2!15)))))

(declare-fun d!136251 () Bool)

(assert (=> d!136251 e!703331))

(declare-fun res!827896 () Bool)

(assert (=> d!136251 (=> (not res!827896) (not e!703331))))

(assert (=> d!136251 (= res!827896 (isStrictlySorted!735 lt!561882))))

(assert (=> d!136251 (= lt!561882 e!703333)))

(declare-fun c!121288 () Bool)

(assert (=> d!136251 (= c!121288 (and ((_ is Cons!27395) (insertStrictlySorted!426 (t!40853 l!644) key1!25 v1!20)) (= (_1!10161 (h!28604 (insertStrictlySorted!426 (t!40853 l!644) key1!25 v1!20))) key2!15)))))

(assert (=> d!136251 (isStrictlySorted!735 (insertStrictlySorted!426 (t!40853 l!644) key1!25 v1!20))))

(assert (=> d!136251 (= (removeStrictlySorted!118 (insertStrictlySorted!426 (t!40853 l!644) key1!25 v1!20) key2!15) lt!561882)))

(declare-fun b!1240850 () Bool)

(declare-fun $colon$colon!618 (List!27399 tuple2!20300) List!27399)

(assert (=> b!1240850 (= e!703332 ($colon$colon!618 (removeStrictlySorted!118 (t!40853 (insertStrictlySorted!426 (t!40853 l!644) key1!25 v1!20)) key2!15) (h!28604 (insertStrictlySorted!426 (t!40853 l!644) key1!25 v1!20))))))

(assert (= (and d!136251 c!121288) b!1240847))

(assert (= (and d!136251 (not c!121288)) b!1240848))

(assert (= (and b!1240848 c!121287) b!1240850))

(assert (= (and b!1240848 (not c!121287)) b!1240846))

(assert (= (and d!136251 res!827896) b!1240849))

(declare-fun m!1143639 () Bool)

(assert (=> b!1240849 m!1143639))

(declare-fun m!1143641 () Bool)

(assert (=> d!136251 m!1143641))

(assert (=> d!136251 m!1143567))

(declare-fun m!1143643 () Bool)

(assert (=> d!136251 m!1143643))

(declare-fun m!1143645 () Bool)

(assert (=> b!1240850 m!1143645))

(assert (=> b!1240850 m!1143645))

(declare-fun m!1143647 () Bool)

(assert (=> b!1240850 m!1143647))

(assert (=> b!1240759 d!136251))

(declare-fun c!121325 () Bool)

(declare-fun b!1240941 () Bool)

(assert (=> b!1240941 (= c!121325 (and ((_ is Cons!27395) (removeStrictlySorted!118 (t!40853 l!644) key2!15)) (bvsgt (_1!10161 (h!28604 (removeStrictlySorted!118 (t!40853 l!644) key2!15))) key1!25)))))

(declare-fun e!703384 () List!27399)

(declare-fun e!703382 () List!27399)

(assert (=> b!1240941 (= e!703384 e!703382)))

(declare-fun b!1240942 () Bool)

(declare-fun call!61171 () List!27399)

(assert (=> b!1240942 (= e!703384 call!61171)))

(declare-fun bm!61168 () Bool)

(declare-fun call!61172 () List!27399)

(assert (=> bm!61168 (= call!61171 call!61172)))

(declare-fun b!1240943 () Bool)

(declare-fun call!61173 () List!27399)

(assert (=> b!1240943 (= e!703382 call!61173)))

(declare-fun lt!561893 () List!27399)

(declare-fun e!703378 () Bool)

(declare-fun b!1240944 () Bool)

(declare-fun contains!7357 (List!27399 tuple2!20300) Bool)

(assert (=> b!1240944 (= e!703378 (contains!7357 lt!561893 (tuple2!20301 key1!25 v1!20)))))

(declare-fun e!703381 () List!27399)

(declare-fun bm!61169 () Bool)

(declare-fun c!121323 () Bool)

(assert (=> bm!61169 (= call!61172 ($colon$colon!618 e!703381 (ite c!121323 (h!28604 (removeStrictlySorted!118 (t!40853 l!644) key2!15)) (tuple2!20301 key1!25 v1!20))))))

(declare-fun c!121328 () Bool)

(assert (=> bm!61169 (= c!121328 c!121323)))

(declare-fun d!136257 () Bool)

(assert (=> d!136257 e!703378))

(declare-fun res!827915 () Bool)

(assert (=> d!136257 (=> (not res!827915) (not e!703378))))

(assert (=> d!136257 (= res!827915 (isStrictlySorted!735 lt!561893))))

(declare-fun e!703383 () List!27399)

(assert (=> d!136257 (= lt!561893 e!703383)))

(assert (=> d!136257 (= c!121323 (and ((_ is Cons!27395) (removeStrictlySorted!118 (t!40853 l!644) key2!15)) (bvslt (_1!10161 (h!28604 (removeStrictlySorted!118 (t!40853 l!644) key2!15))) key1!25)))))

(assert (=> d!136257 (isStrictlySorted!735 (removeStrictlySorted!118 (t!40853 l!644) key2!15))))

(assert (=> d!136257 (= (insertStrictlySorted!426 (removeStrictlySorted!118 (t!40853 l!644) key2!15) key1!25 v1!20) lt!561893)))

(declare-fun c!121326 () Bool)

(declare-fun b!1240945 () Bool)

(assert (=> b!1240945 (= e!703381 (ite c!121326 (t!40853 (removeStrictlySorted!118 (t!40853 l!644) key2!15)) (ite c!121325 (Cons!27395 (h!28604 (removeStrictlySorted!118 (t!40853 l!644) key2!15)) (t!40853 (removeStrictlySorted!118 (t!40853 l!644) key2!15))) Nil!27396)))))

(declare-fun b!1240946 () Bool)

(assert (=> b!1240946 (= e!703383 call!61172)))

(declare-fun b!1240947 () Bool)

(assert (=> b!1240947 (= e!703381 (insertStrictlySorted!426 (t!40853 (removeStrictlySorted!118 (t!40853 l!644) key2!15)) key1!25 v1!20))))

(declare-fun b!1240948 () Bool)

(assert (=> b!1240948 (= e!703383 e!703384)))

(assert (=> b!1240948 (= c!121326 (and ((_ is Cons!27395) (removeStrictlySorted!118 (t!40853 l!644) key2!15)) (= (_1!10161 (h!28604 (removeStrictlySorted!118 (t!40853 l!644) key2!15))) key1!25)))))

(declare-fun bm!61170 () Bool)

(assert (=> bm!61170 (= call!61173 call!61171)))

(declare-fun b!1240949 () Bool)

(assert (=> b!1240949 (= e!703382 call!61173)))

(declare-fun b!1240950 () Bool)

(declare-fun res!827916 () Bool)

(assert (=> b!1240950 (=> (not res!827916) (not e!703378))))

(assert (=> b!1240950 (= res!827916 (containsKey!602 lt!561893 key1!25))))

(assert (= (and d!136257 c!121323) b!1240946))

(assert (= (and d!136257 (not c!121323)) b!1240948))

(assert (= (and b!1240948 c!121326) b!1240942))

(assert (= (and b!1240948 (not c!121326)) b!1240941))

(assert (= (and b!1240941 c!121325) b!1240943))

(assert (= (and b!1240941 (not c!121325)) b!1240949))

(assert (= (or b!1240943 b!1240949) bm!61170))

(assert (= (or b!1240942 bm!61170) bm!61168))

(assert (= (or b!1240946 bm!61168) bm!61169))

(assert (= (and bm!61169 c!121328) b!1240947))

(assert (= (and bm!61169 (not c!121328)) b!1240945))

(assert (= (and d!136257 res!827915) b!1240950))

(assert (= (and b!1240950 res!827916) b!1240944))

(declare-fun m!1143685 () Bool)

(assert (=> d!136257 m!1143685))

(assert (=> d!136257 m!1143571))

(declare-fun m!1143687 () Bool)

(assert (=> d!136257 m!1143687))

(declare-fun m!1143689 () Bool)

(assert (=> b!1240947 m!1143689))

(declare-fun m!1143691 () Bool)

(assert (=> b!1240950 m!1143691))

(declare-fun m!1143693 () Bool)

(assert (=> b!1240944 m!1143693))

(declare-fun m!1143695 () Bool)

(assert (=> bm!61169 m!1143695))

(assert (=> b!1240759 d!136257))

(declare-fun b!1240951 () Bool)

(declare-fun e!703386 () List!27399)

(assert (=> b!1240951 (= e!703386 Nil!27396)))

(declare-fun b!1240952 () Bool)

(declare-fun e!703387 () List!27399)

(assert (=> b!1240952 (= e!703387 (t!40853 l!644))))

(declare-fun b!1240953 () Bool)

(assert (=> b!1240953 (= e!703387 e!703386)))

(declare-fun c!121329 () Bool)

(assert (=> b!1240953 (= c!121329 (and ((_ is Cons!27395) l!644) (not (= (_1!10161 (h!28604 l!644)) key2!15))))))

(declare-fun b!1240954 () Bool)

(declare-fun e!703385 () Bool)

(declare-fun lt!561897 () List!27399)

(assert (=> b!1240954 (= e!703385 (not (containsKey!602 lt!561897 key2!15)))))

(declare-fun d!136267 () Bool)

(assert (=> d!136267 e!703385))

(declare-fun res!827917 () Bool)

(assert (=> d!136267 (=> (not res!827917) (not e!703385))))

(assert (=> d!136267 (= res!827917 (isStrictlySorted!735 lt!561897))))

(assert (=> d!136267 (= lt!561897 e!703387)))

(declare-fun c!121330 () Bool)

(assert (=> d!136267 (= c!121330 (and ((_ is Cons!27395) l!644) (= (_1!10161 (h!28604 l!644)) key2!15)))))

(assert (=> d!136267 (isStrictlySorted!735 l!644)))

(assert (=> d!136267 (= (removeStrictlySorted!118 l!644 key2!15) lt!561897)))

(declare-fun b!1240955 () Bool)

(assert (=> b!1240955 (= e!703386 ($colon$colon!618 (removeStrictlySorted!118 (t!40853 l!644) key2!15) (h!28604 l!644)))))

(assert (= (and d!136267 c!121330) b!1240952))

(assert (= (and d!136267 (not c!121330)) b!1240953))

(assert (= (and b!1240953 c!121329) b!1240955))

(assert (= (and b!1240953 (not c!121329)) b!1240951))

(assert (= (and d!136267 res!827917) b!1240954))

(declare-fun m!1143699 () Bool)

(assert (=> b!1240954 m!1143699))

(declare-fun m!1143701 () Bool)

(assert (=> d!136267 m!1143701))

(assert (=> d!136267 m!1143563))

(assert (=> b!1240955 m!1143571))

(assert (=> b!1240955 m!1143571))

(declare-fun m!1143703 () Bool)

(assert (=> b!1240955 m!1143703))

(assert (=> b!1240759 d!136267))

(declare-fun d!136271 () Bool)

(assert (=> d!136271 (= (insertStrictlySorted!426 (removeStrictlySorted!118 (t!40853 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!118 (insertStrictlySorted!426 (t!40853 l!644) key1!25 v1!20) key2!15))))

(declare-fun lt!561905 () Unit!41088)

(declare-fun choose!1844 (List!27399 (_ BitVec 64) B!1820 (_ BitVec 64)) Unit!41088)

(assert (=> d!136271 (= lt!561905 (choose!1844 (t!40853 l!644) key1!25 v1!20 key2!15))))

(assert (=> d!136271 (not (= key1!25 key2!15))))

(assert (=> d!136271 (= (lemmaInsertAndRemoveStrictlySortedCommutative!7 (t!40853 l!644) key1!25 v1!20 key2!15) lt!561905)))

(declare-fun bs!34911 () Bool)

(assert (= bs!34911 d!136271))

(declare-fun m!1143721 () Bool)

(assert (=> bs!34911 m!1143721))

(assert (=> bs!34911 m!1143571))

(assert (=> bs!34911 m!1143575))

(assert (=> bs!34911 m!1143567))

(assert (=> bs!34911 m!1143569))

(assert (=> bs!34911 m!1143571))

(assert (=> bs!34911 m!1143567))

(assert (=> b!1240759 d!136271))

(declare-fun d!136281 () Bool)

(declare-fun res!827931 () Bool)

(declare-fun e!703409 () Bool)

(assert (=> d!136281 (=> res!827931 e!703409)))

(assert (=> d!136281 (= res!827931 (or ((_ is Nil!27396) (removeStrictlySorted!118 l!644 key2!15)) ((_ is Nil!27396) (t!40853 (removeStrictlySorted!118 l!644 key2!15)))))))

(assert (=> d!136281 (= (isStrictlySorted!735 (removeStrictlySorted!118 l!644 key2!15)) e!703409)))

(declare-fun b!1240989 () Bool)

(declare-fun e!703410 () Bool)

(assert (=> b!1240989 (= e!703409 e!703410)))

(declare-fun res!827932 () Bool)

(assert (=> b!1240989 (=> (not res!827932) (not e!703410))))

(assert (=> b!1240989 (= res!827932 (bvslt (_1!10161 (h!28604 (removeStrictlySorted!118 l!644 key2!15))) (_1!10161 (h!28604 (t!40853 (removeStrictlySorted!118 l!644 key2!15))))))))

(declare-fun b!1240990 () Bool)

(assert (=> b!1240990 (= e!703410 (isStrictlySorted!735 (t!40853 (removeStrictlySorted!118 l!644 key2!15))))))

(assert (= (and d!136281 (not res!827931)) b!1240989))

(assert (= (and b!1240989 res!827932) b!1240990))

(declare-fun m!1143741 () Bool)

(assert (=> b!1240990 m!1143741))

(assert (=> b!1240759 d!136281))

(declare-fun b!1240998 () Bool)

(declare-fun c!121344 () Bool)

(assert (=> b!1240998 (= c!121344 (and ((_ is Cons!27395) (t!40853 l!644)) (bvsgt (_1!10161 (h!28604 (t!40853 l!644))) key1!25)))))

(declare-fun e!703420 () List!27399)

(declare-fun e!703418 () List!27399)

(assert (=> b!1240998 (= e!703420 e!703418)))

(declare-fun b!1240999 () Bool)

(declare-fun call!61180 () List!27399)

(assert (=> b!1240999 (= e!703420 call!61180)))

(declare-fun bm!61177 () Bool)

(declare-fun call!61181 () List!27399)

(assert (=> bm!61177 (= call!61180 call!61181)))

(declare-fun b!1241000 () Bool)

(declare-fun call!61182 () List!27399)

(assert (=> b!1241000 (= e!703418 call!61182)))

(declare-fun b!1241001 () Bool)

(declare-fun e!703416 () Bool)

(declare-fun lt!561908 () List!27399)

(assert (=> b!1241001 (= e!703416 (contains!7357 lt!561908 (tuple2!20301 key1!25 v1!20)))))

(declare-fun c!121343 () Bool)

(declare-fun e!703417 () List!27399)

(declare-fun bm!61178 () Bool)

(assert (=> bm!61178 (= call!61181 ($colon$colon!618 e!703417 (ite c!121343 (h!28604 (t!40853 l!644)) (tuple2!20301 key1!25 v1!20))))))

(declare-fun c!121346 () Bool)

(assert (=> bm!61178 (= c!121346 c!121343)))

(declare-fun d!136287 () Bool)

(assert (=> d!136287 e!703416))

(declare-fun res!827936 () Bool)

(assert (=> d!136287 (=> (not res!827936) (not e!703416))))

(assert (=> d!136287 (= res!827936 (isStrictlySorted!735 lt!561908))))

(declare-fun e!703419 () List!27399)

(assert (=> d!136287 (= lt!561908 e!703419)))

(assert (=> d!136287 (= c!121343 (and ((_ is Cons!27395) (t!40853 l!644)) (bvslt (_1!10161 (h!28604 (t!40853 l!644))) key1!25)))))

(assert (=> d!136287 (isStrictlySorted!735 (t!40853 l!644))))

(assert (=> d!136287 (= (insertStrictlySorted!426 (t!40853 l!644) key1!25 v1!20) lt!561908)))

(declare-fun c!121345 () Bool)

(declare-fun b!1241002 () Bool)

(assert (=> b!1241002 (= e!703417 (ite c!121345 (t!40853 (t!40853 l!644)) (ite c!121344 (Cons!27395 (h!28604 (t!40853 l!644)) (t!40853 (t!40853 l!644))) Nil!27396)))))

(declare-fun b!1241003 () Bool)

(assert (=> b!1241003 (= e!703419 call!61181)))

(declare-fun b!1241004 () Bool)

(assert (=> b!1241004 (= e!703417 (insertStrictlySorted!426 (t!40853 (t!40853 l!644)) key1!25 v1!20))))

(declare-fun b!1241005 () Bool)

(assert (=> b!1241005 (= e!703419 e!703420)))

(assert (=> b!1241005 (= c!121345 (and ((_ is Cons!27395) (t!40853 l!644)) (= (_1!10161 (h!28604 (t!40853 l!644))) key1!25)))))

(declare-fun bm!61179 () Bool)

(assert (=> bm!61179 (= call!61182 call!61180)))

(declare-fun b!1241006 () Bool)

(assert (=> b!1241006 (= e!703418 call!61182)))

(declare-fun b!1241007 () Bool)

(declare-fun res!827937 () Bool)

(assert (=> b!1241007 (=> (not res!827937) (not e!703416))))

(assert (=> b!1241007 (= res!827937 (containsKey!602 lt!561908 key1!25))))

(assert (= (and d!136287 c!121343) b!1241003))

(assert (= (and d!136287 (not c!121343)) b!1241005))

(assert (= (and b!1241005 c!121345) b!1240999))

(assert (= (and b!1241005 (not c!121345)) b!1240998))

(assert (= (and b!1240998 c!121344) b!1241000))

(assert (= (and b!1240998 (not c!121344)) b!1241006))

(assert (= (or b!1241000 b!1241006) bm!61179))

(assert (= (or b!1240999 bm!61179) bm!61177))

(assert (= (or b!1241003 bm!61177) bm!61178))

(assert (= (and bm!61178 c!121346) b!1241004))

(assert (= (and bm!61178 (not c!121346)) b!1241002))

(assert (= (and d!136287 res!827936) b!1241007))

(assert (= (and b!1241007 res!827937) b!1241001))

(declare-fun m!1143753 () Bool)

(assert (=> d!136287 m!1143753))

(assert (=> d!136287 m!1143561))

(declare-fun m!1143755 () Bool)

(assert (=> b!1241004 m!1143755))

(declare-fun m!1143757 () Bool)

(assert (=> b!1241007 m!1143757))

(declare-fun m!1143759 () Bool)

(assert (=> b!1241001 m!1143759))

(declare-fun m!1143761 () Bool)

(assert (=> bm!61178 m!1143761))

(assert (=> b!1240759 d!136287))

(declare-fun b!1241019 () Bool)

(declare-fun e!703429 () List!27399)

(assert (=> b!1241019 (= e!703429 Nil!27396)))

(declare-fun b!1241020 () Bool)

(declare-fun e!703430 () List!27399)

(assert (=> b!1241020 (= e!703430 (t!40853 (t!40853 l!644)))))

(declare-fun b!1241021 () Bool)

(assert (=> b!1241021 (= e!703430 e!703429)))

(declare-fun c!121347 () Bool)

(assert (=> b!1241021 (= c!121347 (and ((_ is Cons!27395) (t!40853 l!644)) (not (= (_1!10161 (h!28604 (t!40853 l!644))) key2!15))))))

(declare-fun b!1241022 () Bool)

(declare-fun e!703428 () Bool)

(declare-fun lt!561909 () List!27399)

(assert (=> b!1241022 (= e!703428 (not (containsKey!602 lt!561909 key2!15)))))

(declare-fun d!136291 () Bool)

(assert (=> d!136291 e!703428))

(declare-fun res!827940 () Bool)

(assert (=> d!136291 (=> (not res!827940) (not e!703428))))

(assert (=> d!136291 (= res!827940 (isStrictlySorted!735 lt!561909))))

(assert (=> d!136291 (= lt!561909 e!703430)))

(declare-fun c!121348 () Bool)

(assert (=> d!136291 (= c!121348 (and ((_ is Cons!27395) (t!40853 l!644)) (= (_1!10161 (h!28604 (t!40853 l!644))) key2!15)))))

(assert (=> d!136291 (isStrictlySorted!735 (t!40853 l!644))))

(assert (=> d!136291 (= (removeStrictlySorted!118 (t!40853 l!644) key2!15) lt!561909)))

(declare-fun b!1241024 () Bool)

(assert (=> b!1241024 (= e!703429 ($colon$colon!618 (removeStrictlySorted!118 (t!40853 (t!40853 l!644)) key2!15) (h!28604 (t!40853 l!644))))))

(assert (= (and d!136291 c!121348) b!1241020))

(assert (= (and d!136291 (not c!121348)) b!1241021))

(assert (= (and b!1241021 c!121347) b!1241024))

(assert (= (and b!1241021 (not c!121347)) b!1241019))

(assert (= (and d!136291 res!827940) b!1241022))

(declare-fun m!1143763 () Bool)

(assert (=> b!1241022 m!1143763))

(declare-fun m!1143765 () Bool)

(assert (=> d!136291 m!1143765))

(assert (=> d!136291 m!1143561))

(declare-fun m!1143767 () Bool)

(assert (=> b!1241024 m!1143767))

(assert (=> b!1241024 m!1143767))

(declare-fun m!1143769 () Bool)

(assert (=> b!1241024 m!1143769))

(assert (=> b!1240759 d!136291))

(declare-fun b!1241029 () Bool)

(declare-fun e!703434 () Bool)

(declare-fun tp!92597 () Bool)

(assert (=> b!1241029 (= e!703434 (and tp_is_empty!31219 tp!92597))))

(assert (=> b!1240757 (= tp!92582 e!703434)))

(assert (= (and b!1240757 ((_ is Cons!27395) (t!40853 l!644))) b!1241029))

(check-sat (not d!136291) (not b!1240947) (not b!1240950) (not d!136251) (not b!1241022) tp_is_empty!31219 (not d!136257) (not b!1240849) (not b!1240850) (not b!1241029) (not d!136287) (not b!1241004) (not bm!61169) (not b!1240803) (not b!1240955) (not b!1241007) (not d!136271) (not b!1241001) (not b!1240954) (not b!1240813) (not bm!61178) (not b!1240944) (not b!1240990) (not b!1241024) (not d!136267))
(check-sat)
