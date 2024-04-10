; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103676 () Bool)

(assert start!103676)

(declare-datatypes ((B!1858 0))(
  ( (B!1859 (val!15691 Int)) )
))
(declare-datatypes ((tuple2!20254 0))(
  ( (tuple2!20255 (_1!10138 (_ BitVec 64)) (_2!10138 B!1858)) )
))
(declare-datatypes ((List!27356 0))(
  ( (Nil!27353) (Cons!27352 (h!28561 tuple2!20254) (t!40819 List!27356)) )
))
(declare-fun l!644 () List!27356)

(declare-fun e!703779 () Bool)

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun b!1241623 () Bool)

(declare-fun v1!20 () B!1858)

(declare-fun isStrictlySorted!752 (List!27356) Bool)

(declare-fun insertStrictlySorted!435 (List!27356 (_ BitVec 64) B!1858) List!27356)

(assert (=> b!1241623 (= e!703779 (not (isStrictlySorted!752 (insertStrictlySorted!435 l!644 key1!25 v1!20))))))

(declare-fun b!1241622 () Bool)

(declare-fun res!828208 () Bool)

(assert (=> b!1241622 (=> (not res!828208) (not e!703779))))

(get-info :version)

(assert (=> b!1241622 (= res!828208 (not ((_ is Cons!27352) l!644)))))

(declare-fun b!1241621 () Bool)

(declare-fun res!828206 () Bool)

(assert (=> b!1241621 (=> (not res!828206) (not e!703779))))

(assert (=> b!1241621 (= res!828206 (isStrictlySorted!752 l!644))))

(declare-fun res!828207 () Bool)

(assert (=> start!103676 (=> (not res!828207) (not e!703779))))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103676 (= res!828207 (not (= key1!25 key2!15)))))

(assert (=> start!103676 e!703779))

(assert (=> start!103676 true))

(declare-fun e!703778 () Bool)

(assert (=> start!103676 e!703778))

(declare-fun tp_is_empty!31257 () Bool)

(assert (=> start!103676 tp_is_empty!31257))

(declare-fun b!1241624 () Bool)

(declare-fun tp!92666 () Bool)

(assert (=> b!1241624 (= e!703778 (and tp_is_empty!31257 tp!92666))))

(assert (= (and start!103676 res!828207) b!1241621))

(assert (= (and b!1241621 res!828206) b!1241622))

(assert (= (and b!1241622 res!828208) b!1241623))

(assert (= (and start!103676 ((_ is Cons!27352) l!644)) b!1241624))

(declare-fun m!1144621 () Bool)

(assert (=> b!1241623 m!1144621))

(assert (=> b!1241623 m!1144621))

(declare-fun m!1144623 () Bool)

(assert (=> b!1241623 m!1144623))

(declare-fun m!1144625 () Bool)

(assert (=> b!1241621 m!1144625))

(check-sat (not b!1241621) (not b!1241623) (not b!1241624) tp_is_empty!31257)
(check-sat)
(get-model)

(declare-fun d!136519 () Bool)

(declare-fun res!828236 () Bool)

(declare-fun e!703804 () Bool)

(assert (=> d!136519 (=> res!828236 e!703804)))

(assert (=> d!136519 (= res!828236 (or ((_ is Nil!27353) l!644) ((_ is Nil!27353) (t!40819 l!644))))))

(assert (=> d!136519 (= (isStrictlySorted!752 l!644) e!703804)))

(declare-fun b!1241655 () Bool)

(declare-fun e!703805 () Bool)

(assert (=> b!1241655 (= e!703804 e!703805)))

(declare-fun res!828237 () Bool)

(assert (=> b!1241655 (=> (not res!828237) (not e!703805))))

(assert (=> b!1241655 (= res!828237 (bvslt (_1!10138 (h!28561 l!644)) (_1!10138 (h!28561 (t!40819 l!644)))))))

(declare-fun b!1241656 () Bool)

(assert (=> b!1241656 (= e!703805 (isStrictlySorted!752 (t!40819 l!644)))))

(assert (= (and d!136519 (not res!828236)) b!1241655))

(assert (= (and b!1241655 res!828237) b!1241656))

(declare-fun m!1144639 () Bool)

(assert (=> b!1241656 m!1144639))

(assert (=> b!1241621 d!136519))

(declare-fun d!136525 () Bool)

(declare-fun res!828238 () Bool)

(declare-fun e!703806 () Bool)

(assert (=> d!136525 (=> res!828238 e!703806)))

(assert (=> d!136525 (= res!828238 (or ((_ is Nil!27353) (insertStrictlySorted!435 l!644 key1!25 v1!20)) ((_ is Nil!27353) (t!40819 (insertStrictlySorted!435 l!644 key1!25 v1!20)))))))

(assert (=> d!136525 (= (isStrictlySorted!752 (insertStrictlySorted!435 l!644 key1!25 v1!20)) e!703806)))

(declare-fun b!1241657 () Bool)

(declare-fun e!703807 () Bool)

(assert (=> b!1241657 (= e!703806 e!703807)))

(declare-fun res!828239 () Bool)

(assert (=> b!1241657 (=> (not res!828239) (not e!703807))))

(assert (=> b!1241657 (= res!828239 (bvslt (_1!10138 (h!28561 (insertStrictlySorted!435 l!644 key1!25 v1!20))) (_1!10138 (h!28561 (t!40819 (insertStrictlySorted!435 l!644 key1!25 v1!20))))))))

(declare-fun b!1241658 () Bool)

(assert (=> b!1241658 (= e!703807 (isStrictlySorted!752 (t!40819 (insertStrictlySorted!435 l!644 key1!25 v1!20))))))

(assert (= (and d!136525 (not res!828238)) b!1241657))

(assert (= (and b!1241657 res!828239) b!1241658))

(declare-fun m!1144641 () Bool)

(assert (=> b!1241658 m!1144641))

(assert (=> b!1241623 d!136525))

(declare-fun b!1241752 () Bool)

(declare-fun e!703856 () List!27356)

(declare-fun call!61271 () List!27356)

(assert (=> b!1241752 (= e!703856 call!61271)))

(declare-fun bm!61268 () Bool)

(declare-fun c!121502 () Bool)

(declare-fun e!703860 () List!27356)

(declare-fun call!61273 () List!27356)

(declare-fun $colon$colon!625 (List!27356 tuple2!20254) List!27356)

(assert (=> bm!61268 (= call!61273 ($colon$colon!625 e!703860 (ite c!121502 (h!28561 l!644) (tuple2!20255 key1!25 v1!20))))))

(declare-fun c!121504 () Bool)

(assert (=> bm!61268 (= c!121504 c!121502)))

(declare-fun bm!61269 () Bool)

(assert (=> bm!61269 (= call!61271 call!61273)))

(declare-fun b!1241753 () Bool)

(declare-fun e!703857 () List!27356)

(declare-fun call!61272 () List!27356)

(assert (=> b!1241753 (= e!703857 call!61272)))

(declare-fun bm!61270 () Bool)

(assert (=> bm!61270 (= call!61272 call!61271)))

(declare-fun b!1241754 () Bool)

(declare-fun c!121503 () Bool)

(assert (=> b!1241754 (= c!121503 (and ((_ is Cons!27352) l!644) (bvsgt (_1!10138 (h!28561 l!644)) key1!25)))))

(assert (=> b!1241754 (= e!703856 e!703857)))

(declare-fun lt!562160 () List!27356)

(declare-fun e!703859 () Bool)

(declare-fun b!1241755 () Bool)

(declare-fun contains!7392 (List!27356 tuple2!20254) Bool)

(assert (=> b!1241755 (= e!703859 (contains!7392 lt!562160 (tuple2!20255 key1!25 v1!20)))))

(declare-fun b!1241756 () Bool)

(declare-fun res!828258 () Bool)

(assert (=> b!1241756 (=> (not res!828258) (not e!703859))))

(declare-fun containsKey!611 (List!27356 (_ BitVec 64)) Bool)

(assert (=> b!1241756 (= res!828258 (containsKey!611 lt!562160 key1!25))))

(declare-fun b!1241757 () Bool)

(assert (=> b!1241757 (= e!703857 call!61272)))

(declare-fun b!1241758 () Bool)

(declare-fun e!703858 () List!27356)

(assert (=> b!1241758 (= e!703858 e!703856)))

(declare-fun c!121501 () Bool)

(assert (=> b!1241758 (= c!121501 (and ((_ is Cons!27352) l!644) (= (_1!10138 (h!28561 l!644)) key1!25)))))

(declare-fun d!136527 () Bool)

(assert (=> d!136527 e!703859))

(declare-fun res!828259 () Bool)

(assert (=> d!136527 (=> (not res!828259) (not e!703859))))

(assert (=> d!136527 (= res!828259 (isStrictlySorted!752 lt!562160))))

(assert (=> d!136527 (= lt!562160 e!703858)))

(assert (=> d!136527 (= c!121502 (and ((_ is Cons!27352) l!644) (bvslt (_1!10138 (h!28561 l!644)) key1!25)))))

(assert (=> d!136527 (isStrictlySorted!752 l!644)))

(assert (=> d!136527 (= (insertStrictlySorted!435 l!644 key1!25 v1!20) lt!562160)))

(declare-fun b!1241751 () Bool)

(assert (=> b!1241751 (= e!703860 (insertStrictlySorted!435 (t!40819 l!644) key1!25 v1!20))))

(declare-fun b!1241759 () Bool)

(assert (=> b!1241759 (= e!703858 call!61273)))

(declare-fun b!1241760 () Bool)

(assert (=> b!1241760 (= e!703860 (ite c!121501 (t!40819 l!644) (ite c!121503 (Cons!27352 (h!28561 l!644) (t!40819 l!644)) Nil!27353)))))

(assert (= (and d!136527 c!121502) b!1241759))

(assert (= (and d!136527 (not c!121502)) b!1241758))

(assert (= (and b!1241758 c!121501) b!1241752))

(assert (= (and b!1241758 (not c!121501)) b!1241754))

(assert (= (and b!1241754 c!121503) b!1241753))

(assert (= (and b!1241754 (not c!121503)) b!1241757))

(assert (= (or b!1241753 b!1241757) bm!61270))

(assert (= (or b!1241752 bm!61270) bm!61269))

(assert (= (or b!1241759 bm!61269) bm!61268))

(assert (= (and bm!61268 c!121504) b!1241751))

(assert (= (and bm!61268 (not c!121504)) b!1241760))

(assert (= (and d!136527 res!828259) b!1241756))

(assert (= (and b!1241756 res!828258) b!1241755))

(declare-fun m!1144665 () Bool)

(assert (=> b!1241756 m!1144665))

(declare-fun m!1144667 () Bool)

(assert (=> bm!61268 m!1144667))

(declare-fun m!1144669 () Bool)

(assert (=> b!1241751 m!1144669))

(declare-fun m!1144671 () Bool)

(assert (=> b!1241755 m!1144671))

(declare-fun m!1144673 () Bool)

(assert (=> d!136527 m!1144673))

(assert (=> d!136527 m!1144625))

(assert (=> b!1241623 d!136527))

(declare-fun b!1241765 () Bool)

(declare-fun e!703863 () Bool)

(declare-fun tp!92678 () Bool)

(assert (=> b!1241765 (= e!703863 (and tp_is_empty!31257 tp!92678))))

(assert (=> b!1241624 (= tp!92666 e!703863)))

(assert (= (and b!1241624 ((_ is Cons!27352) (t!40819 l!644))) b!1241765))

(check-sat (not b!1241658) (not bm!61268) tp_is_empty!31257 (not b!1241656) (not b!1241756) (not b!1241751) (not b!1241765) (not d!136527) (not b!1241755))
