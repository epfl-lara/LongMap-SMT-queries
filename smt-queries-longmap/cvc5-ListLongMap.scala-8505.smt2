; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103674 () Bool)

(assert start!103674)

(declare-fun b!1241609 () Bool)

(declare-fun res!828199 () Bool)

(declare-fun e!703772 () Bool)

(assert (=> b!1241609 (=> (not res!828199) (not e!703772))))

(declare-datatypes ((B!1856 0))(
  ( (B!1857 (val!15690 Int)) )
))
(declare-datatypes ((tuple2!20252 0))(
  ( (tuple2!20253 (_1!10137 (_ BitVec 64)) (_2!10137 B!1856)) )
))
(declare-datatypes ((List!27355 0))(
  ( (Nil!27352) (Cons!27351 (h!28560 tuple2!20252) (t!40818 List!27355)) )
))
(declare-fun l!644 () List!27355)

(declare-fun isStrictlySorted!751 (List!27355) Bool)

(assert (=> b!1241609 (= res!828199 (isStrictlySorted!751 l!644))))

(declare-fun res!828197 () Bool)

(assert (=> start!103674 (=> (not res!828197) (not e!703772))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103674 (= res!828197 (not (= key1!25 key2!15)))))

(assert (=> start!103674 e!703772))

(assert (=> start!103674 true))

(declare-fun e!703773 () Bool)

(assert (=> start!103674 e!703773))

(declare-fun tp_is_empty!31255 () Bool)

(assert (=> start!103674 tp_is_empty!31255))

(declare-fun v1!20 () B!1856)

(declare-fun b!1241611 () Bool)

(declare-fun insertStrictlySorted!434 (List!27355 (_ BitVec 64) B!1856) List!27355)

(assert (=> b!1241611 (= e!703772 (not (isStrictlySorted!751 (insertStrictlySorted!434 l!644 key1!25 v1!20))))))

(declare-fun b!1241612 () Bool)

(declare-fun tp!92663 () Bool)

(assert (=> b!1241612 (= e!703773 (and tp_is_empty!31255 tp!92663))))

(declare-fun b!1241610 () Bool)

(declare-fun res!828198 () Bool)

(assert (=> b!1241610 (=> (not res!828198) (not e!703772))))

(assert (=> b!1241610 (= res!828198 (not (is-Cons!27351 l!644)))))

(assert (= (and start!103674 res!828197) b!1241609))

(assert (= (and b!1241609 res!828199) b!1241610))

(assert (= (and b!1241610 res!828198) b!1241611))

(assert (= (and start!103674 (is-Cons!27351 l!644)) b!1241612))

(declare-fun m!1144615 () Bool)

(assert (=> b!1241609 m!1144615))

(declare-fun m!1144617 () Bool)

(assert (=> b!1241611 m!1144617))

(assert (=> b!1241611 m!1144617))

(declare-fun m!1144619 () Bool)

(assert (=> b!1241611 m!1144619))

(push 1)

(assert (not b!1241609))

(assert (not b!1241611))

(assert (not b!1241612))

(assert tp_is_empty!31255)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136515 () Bool)

(declare-fun res!828228 () Bool)

(declare-fun e!703796 () Bool)

(assert (=> d!136515 (=> res!828228 e!703796)))

(assert (=> d!136515 (= res!828228 (or (is-Nil!27352 l!644) (is-Nil!27352 (t!40818 l!644))))))

(assert (=> d!136515 (= (isStrictlySorted!751 l!644) e!703796)))

(declare-fun b!1241647 () Bool)

(declare-fun e!703797 () Bool)

(assert (=> b!1241647 (= e!703796 e!703797)))

(declare-fun res!828229 () Bool)

(assert (=> b!1241647 (=> (not res!828229) (not e!703797))))

(assert (=> b!1241647 (= res!828229 (bvslt (_1!10137 (h!28560 l!644)) (_1!10137 (h!28560 (t!40818 l!644)))))))

(declare-fun b!1241648 () Bool)

(assert (=> b!1241648 (= e!703797 (isStrictlySorted!751 (t!40818 l!644)))))

(assert (= (and d!136515 (not res!828228)) b!1241647))

(assert (= (and b!1241647 res!828229) b!1241648))

(declare-fun m!1144635 () Bool)

(assert (=> b!1241648 m!1144635))

(assert (=> b!1241609 d!136515))

(declare-fun d!136521 () Bool)

(declare-fun res!828230 () Bool)

(declare-fun e!703798 () Bool)

(assert (=> d!136521 (=> res!828230 e!703798)))

(assert (=> d!136521 (= res!828230 (or (is-Nil!27352 (insertStrictlySorted!434 l!644 key1!25 v1!20)) (is-Nil!27352 (t!40818 (insertStrictlySorted!434 l!644 key1!25 v1!20)))))))

(assert (=> d!136521 (= (isStrictlySorted!751 (insertStrictlySorted!434 l!644 key1!25 v1!20)) e!703798)))

(declare-fun b!1241649 () Bool)

(declare-fun e!703799 () Bool)

(assert (=> b!1241649 (= e!703798 e!703799)))

(declare-fun res!828231 () Bool)

(assert (=> b!1241649 (=> (not res!828231) (not e!703799))))

(assert (=> b!1241649 (= res!828231 (bvslt (_1!10137 (h!28560 (insertStrictlySorted!434 l!644 key1!25 v1!20))) (_1!10137 (h!28560 (t!40818 (insertStrictlySorted!434 l!644 key1!25 v1!20))))))))

(declare-fun b!1241650 () Bool)

(assert (=> b!1241650 (= e!703799 (isStrictlySorted!751 (t!40818 (insertStrictlySorted!434 l!644 key1!25 v1!20))))))

(assert (= (and d!136521 (not res!828230)) b!1241649))

(assert (= (and b!1241649 res!828231) b!1241650))

(declare-fun m!1144637 () Bool)

(assert (=> b!1241650 m!1144637))

(assert (=> b!1241611 d!136521))

(declare-fun b!1241728 () Bool)

(declare-fun e!703846 () List!27355)

(declare-fun call!61263 () List!27355)

(assert (=> b!1241728 (= e!703846 call!61263)))

(declare-fun b!1241729 () Bool)

(declare-fun e!703844 () List!27355)

(declare-fun call!61262 () List!27355)

(assert (=> b!1241729 (= e!703844 call!61262)))

(declare-fun b!1241730 () Bool)

(declare-fun e!703848 () List!27355)

(declare-fun c!121496 () Bool)

(declare-fun c!121498 () Bool)

(assert (=> b!1241730 (= e!703848 (ite c!121498 (t!40818 l!644) (ite c!121496 (Cons!27351 (h!28560 l!644) (t!40818 l!644)) Nil!27352)))))

(declare-fun b!1241731 () Bool)

(assert (=> b!1241731 (= c!121496 (and (is-Cons!27351 l!644) (bvsgt (_1!10137 (h!28560 l!644)) key1!25)))))

(assert (=> b!1241731 (= e!703844 e!703846)))

(declare-fun b!1241732 () Bool)

(declare-fun res!828252 () Bool)

(declare-fun e!703845 () Bool)

(assert (=> b!1241732 (=> (not res!828252) (not e!703845))))

(declare-fun lt!562159 () List!27355)

(declare-fun containsKey!610 (List!27355 (_ BitVec 64)) Bool)

(assert (=> b!1241732 (= res!828252 (containsKey!610 lt!562159 key1!25))))

(declare-fun d!136523 () Bool)

(assert (=> d!136523 e!703845))

(declare-fun res!828253 () Bool)

(assert (=> d!136523 (=> (not res!828253) (not e!703845))))

(assert (=> d!136523 (= res!828253 (isStrictlySorted!751 lt!562159))))

(declare-fun e!703847 () List!27355)

(assert (=> d!136523 (= lt!562159 e!703847)))

(declare-fun c!121497 () Bool)

(assert (=> d!136523 (= c!121497 (and (is-Cons!27351 l!644) (bvslt (_1!10137 (h!28560 l!644)) key1!25)))))

(assert (=> d!136523 (isStrictlySorted!751 l!644)))

(assert (=> d!136523 (= (insertStrictlySorted!434 l!644 key1!25 v1!20) lt!562159)))

(declare-fun b!1241733 () Bool)

(declare-fun contains!7391 (List!27355 tuple2!20252) Bool)

(assert (=> b!1241733 (= e!703845 (contains!7391 lt!562159 (tuple2!20253 key1!25 v1!20)))))

(declare-fun b!1241734 () Bool)

(assert (=> b!1241734 (= e!703846 call!61263)))

(declare-fun b!1241735 () Bool)

(assert (=> b!1241735 (= e!703847 e!703844)))

(assert (=> b!1241735 (= c!121498 (and (is-Cons!27351 l!644) (= (_1!10137 (h!28560 l!644)) key1!25)))))

(declare-fun call!61264 () List!27355)

(declare-fun bm!61259 () Bool)

(declare-fun $colon$colon!624 (List!27355 tuple2!20252) List!27355)

(assert (=> bm!61259 (= call!61264 ($colon$colon!624 e!703848 (ite c!121497 (h!28560 l!644) (tuple2!20253 key1!25 v1!20))))))

(declare-fun c!121495 () Bool)

(assert (=> bm!61259 (= c!121495 c!121497)))

(declare-fun b!1241736 () Bool)

(assert (=> b!1241736 (= e!703848 (insertStrictlySorted!434 (t!40818 l!644) key1!25 v1!20))))

(declare-fun bm!61260 () Bool)

(assert (=> bm!61260 (= call!61263 call!61262)))

(declare-fun b!1241737 () Bool)

(assert (=> b!1241737 (= e!703847 call!61264)))

(declare-fun bm!61261 () Bool)

(assert (=> bm!61261 (= call!61262 call!61264)))

(assert (= (and d!136523 c!121497) b!1241737))

(assert (= (and d!136523 (not c!121497)) b!1241735))

(assert (= (and b!1241735 c!121498) b!1241729))

(assert (= (and b!1241735 (not c!121498)) b!1241731))

(assert (= (and b!1241731 c!121496) b!1241728))

(assert (= (and b!1241731 (not c!121496)) b!1241734))

(assert (= (or b!1241728 b!1241734) bm!61260))

(assert (= (or b!1241729 bm!61260) bm!61261))

(assert (= (or b!1241737 bm!61261) bm!61259))

(assert (= (and bm!61259 c!121495) b!1241736))

(assert (= (and bm!61259 (not c!121495)) b!1241730))

(assert (= (and d!136523 res!828253) b!1241732))

(assert (= (and b!1241732 res!828252) b!1241733))

(declare-fun m!1144655 () Bool)

(assert (=> b!1241733 m!1144655))

(declare-fun m!1144657 () Bool)

(assert (=> b!1241736 m!1144657))

(declare-fun m!1144659 () Bool)

(assert (=> d!136523 m!1144659))

(assert (=> d!136523 m!1144615))

(declare-fun m!1144661 () Bool)

(assert (=> b!1241732 m!1144661))

(declare-fun m!1144663 () Bool)

(assert (=> bm!61259 m!1144663))

(assert (=> b!1241611 d!136523))

(declare-fun b!1241742 () Bool)

(declare-fun e!703851 () Bool)

(declare-fun tp!92675 () Bool)

(assert (=> b!1241742 (= e!703851 (and tp_is_empty!31255 tp!92675))))

(assert (=> b!1241612 (= tp!92663 e!703851)))

(assert (= (and b!1241612 (is-Cons!27351 (t!40818 l!644))) b!1241742))

(push 1)

(assert (not d!136523))

(assert (not b!1241650))

(assert (not b!1241742))

(assert (not bm!61259))

(assert (not b!1241648))

(assert (not b!1241732))

(assert tp_is_empty!31255)

(assert (not b!1241736))

(assert (not b!1241733))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

