; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103666 () Bool)

(assert start!103666)

(declare-fun b!1241521 () Bool)

(declare-fun res!828153 () Bool)

(declare-fun e!703721 () Bool)

(assert (=> b!1241521 (=> (not res!828153) (not e!703721))))

(declare-datatypes ((B!1856 0))(
  ( (B!1857 (val!15690 Int)) )
))
(declare-datatypes ((tuple2!20336 0))(
  ( (tuple2!20337 (_1!10179 (_ BitVec 64)) (_2!10179 B!1856)) )
))
(declare-datatypes ((List!27417 0))(
  ( (Nil!27414) (Cons!27413 (h!28622 tuple2!20336) (t!40871 List!27417)) )
))
(declare-fun l!644 () List!27417)

(declare-fun isStrictlySorted!747 (List!27417) Bool)

(assert (=> b!1241521 (= res!828153 (isStrictlySorted!747 l!644))))

(declare-fun res!828151 () Bool)

(assert (=> start!103666 (=> (not res!828151) (not e!703721))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103666 (= res!828151 (not (= key1!25 key2!15)))))

(assert (=> start!103666 e!703721))

(assert (=> start!103666 true))

(declare-fun e!703722 () Bool)

(assert (=> start!103666 e!703722))

(declare-fun tp_is_empty!31255 () Bool)

(assert (=> start!103666 tp_is_empty!31255))

(declare-fun v1!20 () B!1856)

(declare-fun b!1241523 () Bool)

(declare-fun insertStrictlySorted!435 (List!27417 (_ BitVec 64) B!1856) List!27417)

(assert (=> b!1241523 (= e!703721 (not (isStrictlySorted!747 (insertStrictlySorted!435 l!644 key1!25 v1!20))))))

(declare-fun b!1241522 () Bool)

(declare-fun res!828152 () Bool)

(assert (=> b!1241522 (=> (not res!828152) (not e!703721))))

(get-info :version)

(assert (=> b!1241522 (= res!828152 (not ((_ is Cons!27413) l!644)))))

(declare-fun b!1241524 () Bool)

(declare-fun tp!92663 () Bool)

(assert (=> b!1241524 (= e!703722 (and tp_is_empty!31255 tp!92663))))

(assert (= (and start!103666 res!828151) b!1241521))

(assert (= (and b!1241521 res!828153) b!1241522))

(assert (= (and b!1241522 res!828152) b!1241523))

(assert (= (and start!103666 ((_ is Cons!27413) l!644)) b!1241524))

(declare-fun m!1144083 () Bool)

(assert (=> b!1241521 m!1144083))

(declare-fun m!1144085 () Bool)

(assert (=> b!1241523 m!1144085))

(assert (=> b!1241523 m!1144085))

(declare-fun m!1144087 () Bool)

(assert (=> b!1241523 m!1144087))

(check-sat (not b!1241521) (not b!1241523) (not b!1241524) tp_is_empty!31255)
(check-sat)
(get-model)

(declare-fun d!136377 () Bool)

(declare-fun res!828178 () Bool)

(declare-fun e!703741 () Bool)

(assert (=> d!136377 (=> res!828178 e!703741)))

(assert (=> d!136377 (= res!828178 (or ((_ is Nil!27414) l!644) ((_ is Nil!27414) (t!40871 l!644))))))

(assert (=> d!136377 (= (isStrictlySorted!747 l!644) e!703741)))

(declare-fun b!1241555 () Bool)

(declare-fun e!703742 () Bool)

(assert (=> b!1241555 (= e!703741 e!703742)))

(declare-fun res!828179 () Bool)

(assert (=> b!1241555 (=> (not res!828179) (not e!703742))))

(assert (=> b!1241555 (= res!828179 (bvslt (_1!10179 (h!28622 l!644)) (_1!10179 (h!28622 (t!40871 l!644)))))))

(declare-fun b!1241556 () Bool)

(assert (=> b!1241556 (= e!703742 (isStrictlySorted!747 (t!40871 l!644)))))

(assert (= (and d!136377 (not res!828178)) b!1241555))

(assert (= (and b!1241555 res!828179) b!1241556))

(declare-fun m!1144101 () Bool)

(assert (=> b!1241556 m!1144101))

(assert (=> b!1241521 d!136377))

(declare-fun d!136381 () Bool)

(declare-fun res!828182 () Bool)

(declare-fun e!703745 () Bool)

(assert (=> d!136381 (=> res!828182 e!703745)))

(assert (=> d!136381 (= res!828182 (or ((_ is Nil!27414) (insertStrictlySorted!435 l!644 key1!25 v1!20)) ((_ is Nil!27414) (t!40871 (insertStrictlySorted!435 l!644 key1!25 v1!20)))))))

(assert (=> d!136381 (= (isStrictlySorted!747 (insertStrictlySorted!435 l!644 key1!25 v1!20)) e!703745)))

(declare-fun b!1241559 () Bool)

(declare-fun e!703746 () Bool)

(assert (=> b!1241559 (= e!703745 e!703746)))

(declare-fun res!828183 () Bool)

(assert (=> b!1241559 (=> (not res!828183) (not e!703746))))

(assert (=> b!1241559 (= res!828183 (bvslt (_1!10179 (h!28622 (insertStrictlySorted!435 l!644 key1!25 v1!20))) (_1!10179 (h!28622 (t!40871 (insertStrictlySorted!435 l!644 key1!25 v1!20))))))))

(declare-fun b!1241560 () Bool)

(assert (=> b!1241560 (= e!703746 (isStrictlySorted!747 (t!40871 (insertStrictlySorted!435 l!644 key1!25 v1!20))))))

(assert (= (and d!136381 (not res!828182)) b!1241559))

(assert (= (and b!1241559 res!828183) b!1241560))

(declare-fun m!1144103 () Bool)

(assert (=> b!1241560 m!1144103))

(assert (=> b!1241523 d!136381))

(declare-fun c!121468 () Bool)

(declare-fun c!121470 () Bool)

(declare-fun e!703781 () List!27417)

(declare-fun b!1241613 () Bool)

(assert (=> b!1241613 (= e!703781 (ite c!121468 (t!40871 l!644) (ite c!121470 (Cons!27413 (h!28622 l!644) (t!40871 l!644)) Nil!27414)))))

(declare-fun bm!61237 () Bool)

(declare-fun call!61241 () List!27417)

(declare-fun call!61242 () List!27417)

(assert (=> bm!61237 (= call!61241 call!61242)))

(declare-fun b!1241614 () Bool)

(declare-fun e!703782 () List!27417)

(declare-fun call!61240 () List!27417)

(assert (=> b!1241614 (= e!703782 call!61240)))

(declare-fun b!1241615 () Bool)

(assert (=> b!1241615 (= e!703782 call!61240)))

(declare-fun b!1241616 () Bool)

(assert (=> b!1241616 (= e!703781 (insertStrictlySorted!435 (t!40871 l!644) key1!25 v1!20))))

(declare-fun d!136383 () Bool)

(declare-fun e!703779 () Bool)

(assert (=> d!136383 e!703779))

(declare-fun res!828205 () Bool)

(assert (=> d!136383 (=> (not res!828205) (not e!703779))))

(declare-fun lt!561977 () List!27417)

(assert (=> d!136383 (= res!828205 (isStrictlySorted!747 lt!561977))))

(declare-fun e!703783 () List!27417)

(assert (=> d!136383 (= lt!561977 e!703783)))

(declare-fun c!121467 () Bool)

(assert (=> d!136383 (= c!121467 (and ((_ is Cons!27413) l!644) (bvslt (_1!10179 (h!28622 l!644)) key1!25)))))

(assert (=> d!136383 (isStrictlySorted!747 l!644)))

(assert (=> d!136383 (= (insertStrictlySorted!435 l!644 key1!25 v1!20) lt!561977)))

(declare-fun b!1241617 () Bool)

(assert (=> b!1241617 (= c!121470 (and ((_ is Cons!27413) l!644) (bvsgt (_1!10179 (h!28622 l!644)) key1!25)))))

(declare-fun e!703780 () List!27417)

(assert (=> b!1241617 (= e!703780 e!703782)))

(declare-fun bm!61238 () Bool)

(assert (=> bm!61238 (= call!61240 call!61241)))

(declare-fun b!1241618 () Bool)

(assert (=> b!1241618 (= e!703783 call!61242)))

(declare-fun b!1241619 () Bool)

(declare-fun contains!7362 (List!27417 tuple2!20336) Bool)

(assert (=> b!1241619 (= e!703779 (contains!7362 lt!561977 (tuple2!20337 key1!25 v1!20)))))

(declare-fun bm!61239 () Bool)

(declare-fun $colon$colon!626 (List!27417 tuple2!20336) List!27417)

(assert (=> bm!61239 (= call!61242 ($colon$colon!626 e!703781 (ite c!121467 (h!28622 l!644) (tuple2!20337 key1!25 v1!20))))))

(declare-fun c!121469 () Bool)

(assert (=> bm!61239 (= c!121469 c!121467)))

(declare-fun b!1241620 () Bool)

(declare-fun res!828204 () Bool)

(assert (=> b!1241620 (=> (not res!828204) (not e!703779))))

(declare-fun containsKey!609 (List!27417 (_ BitVec 64)) Bool)

(assert (=> b!1241620 (= res!828204 (containsKey!609 lt!561977 key1!25))))

(declare-fun b!1241621 () Bool)

(assert (=> b!1241621 (= e!703780 call!61241)))

(declare-fun b!1241622 () Bool)

(assert (=> b!1241622 (= e!703783 e!703780)))

(assert (=> b!1241622 (= c!121468 (and ((_ is Cons!27413) l!644) (= (_1!10179 (h!28622 l!644)) key1!25)))))

(assert (= (and d!136383 c!121467) b!1241618))

(assert (= (and d!136383 (not c!121467)) b!1241622))

(assert (= (and b!1241622 c!121468) b!1241621))

(assert (= (and b!1241622 (not c!121468)) b!1241617))

(assert (= (and b!1241617 c!121470) b!1241615))

(assert (= (and b!1241617 (not c!121470)) b!1241614))

(assert (= (or b!1241615 b!1241614) bm!61238))

(assert (= (or b!1241621 bm!61238) bm!61237))

(assert (= (or b!1241618 bm!61237) bm!61239))

(assert (= (and bm!61239 c!121469) b!1241616))

(assert (= (and bm!61239 (not c!121469)) b!1241613))

(assert (= (and d!136383 res!828205) b!1241620))

(assert (= (and b!1241620 res!828204) b!1241619))

(declare-fun m!1144113 () Bool)

(assert (=> d!136383 m!1144113))

(assert (=> d!136383 m!1144083))

(declare-fun m!1144115 () Bool)

(assert (=> b!1241616 m!1144115))

(declare-fun m!1144117 () Bool)

(assert (=> b!1241619 m!1144117))

(declare-fun m!1144119 () Bool)

(assert (=> bm!61239 m!1144119))

(declare-fun m!1144121 () Bool)

(assert (=> b!1241620 m!1144121))

(assert (=> b!1241523 d!136383))

(declare-fun b!1241637 () Bool)

(declare-fun e!703791 () Bool)

(declare-fun tp!92672 () Bool)

(assert (=> b!1241637 (= e!703791 (and tp_is_empty!31255 tp!92672))))

(assert (=> b!1241524 (= tp!92663 e!703791)))

(assert (= (and b!1241524 ((_ is Cons!27413) (t!40871 l!644))) b!1241637))

(check-sat (not b!1241619) (not bm!61239) (not d!136383) (not b!1241637) (not b!1241620) (not b!1241556) tp_is_empty!31255 (not b!1241560) (not b!1241616))
(check-sat)
