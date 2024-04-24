; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134802 () Bool)

(assert start!134802)

(declare-fun b!1571730 () Bool)

(declare-fun e!876325 () Bool)

(declare-fun tp_is_empty!39055 () Bool)

(declare-fun tp!114102 () Bool)

(assert (=> b!1571730 (= e!876325 (and tp_is_empty!39055 tp!114102))))

(declare-datatypes ((B!2504 0))(
  ( (B!2505 (val!19614 Int)) )
))
(declare-fun v1!32 () B!2504)

(declare-datatypes ((tuple2!25390 0))(
  ( (tuple2!25391 (_1!12706 (_ BitVec 64)) (_2!12706 B!2504)) )
))
(declare-datatypes ((List!36766 0))(
  ( (Nil!36763) (Cons!36762 (h!38227 tuple2!25390) (t!51666 List!36766)) )
))
(declare-fun l!750 () List!36766)

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun b!1571729 () Bool)

(declare-fun e!876326 () Bool)

(declare-fun isStrictlySorted!992 (List!36766) Bool)

(declare-fun insertStrictlySorted!591 (List!36766 (_ BitVec 64) B!2504) List!36766)

(assert (=> b!1571729 (= e!876326 (not (isStrictlySorted!992 (insertStrictlySorted!591 l!750 key1!37 v1!32))))))

(declare-fun b!1571728 () Bool)

(declare-fun res!1073406 () Bool)

(assert (=> b!1571728 (=> (not res!1073406) (not e!876326))))

(declare-fun key2!21 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1571728 (= res!1073406 (or (not ((_ is Cons!36762) l!750)) (bvsge (_1!12706 (h!38227 l!750)) key1!37) (bvsge (_1!12706 (h!38227 l!750)) key2!21)))))

(declare-fun b!1571727 () Bool)

(declare-fun res!1073408 () Bool)

(assert (=> b!1571727 (=> (not res!1073408) (not e!876326))))

(assert (=> b!1571727 (= res!1073408 (isStrictlySorted!992 l!750))))

(declare-fun res!1073407 () Bool)

(assert (=> start!134802 (=> (not res!1073407) (not e!876326))))

(assert (=> start!134802 (= res!1073407 (not (= key1!37 key2!21)))))

(assert (=> start!134802 e!876326))

(assert (=> start!134802 true))

(assert (=> start!134802 e!876325))

(assert (=> start!134802 tp_is_empty!39055))

(assert (= (and start!134802 res!1073407) b!1571727))

(assert (= (and b!1571727 res!1073408) b!1571728))

(assert (= (and b!1571728 res!1073406) b!1571729))

(assert (= (and start!134802 ((_ is Cons!36762) l!750)) b!1571730))

(declare-fun m!1445997 () Bool)

(assert (=> b!1571729 m!1445997))

(assert (=> b!1571729 m!1445997))

(declare-fun m!1445999 () Bool)

(assert (=> b!1571729 m!1445999))

(declare-fun m!1446001 () Bool)

(assert (=> b!1571727 m!1446001))

(check-sat (not b!1571727) (not b!1571729) (not b!1571730) tp_is_empty!39055)
(check-sat)
(get-model)

(declare-fun d!164577 () Bool)

(declare-fun res!1073431 () Bool)

(declare-fun e!876343 () Bool)

(assert (=> d!164577 (=> res!1073431 e!876343)))

(assert (=> d!164577 (= res!1073431 (or ((_ is Nil!36763) l!750) ((_ is Nil!36763) (t!51666 l!750))))))

(assert (=> d!164577 (= (isStrictlySorted!992 l!750) e!876343)))

(declare-fun b!1571759 () Bool)

(declare-fun e!876344 () Bool)

(assert (=> b!1571759 (= e!876343 e!876344)))

(declare-fun res!1073432 () Bool)

(assert (=> b!1571759 (=> (not res!1073432) (not e!876344))))

(assert (=> b!1571759 (= res!1073432 (bvslt (_1!12706 (h!38227 l!750)) (_1!12706 (h!38227 (t!51666 l!750)))))))

(declare-fun b!1571760 () Bool)

(assert (=> b!1571760 (= e!876344 (isStrictlySorted!992 (t!51666 l!750)))))

(assert (= (and d!164577 (not res!1073431)) b!1571759))

(assert (= (and b!1571759 res!1073432) b!1571760))

(declare-fun m!1446015 () Bool)

(assert (=> b!1571760 m!1446015))

(assert (=> b!1571727 d!164577))

(declare-fun d!164581 () Bool)

(declare-fun res!1073433 () Bool)

(declare-fun e!876345 () Bool)

(assert (=> d!164581 (=> res!1073433 e!876345)))

(assert (=> d!164581 (= res!1073433 (or ((_ is Nil!36763) (insertStrictlySorted!591 l!750 key1!37 v1!32)) ((_ is Nil!36763) (t!51666 (insertStrictlySorted!591 l!750 key1!37 v1!32)))))))

(assert (=> d!164581 (= (isStrictlySorted!992 (insertStrictlySorted!591 l!750 key1!37 v1!32)) e!876345)))

(declare-fun b!1571761 () Bool)

(declare-fun e!876346 () Bool)

(assert (=> b!1571761 (= e!876345 e!876346)))

(declare-fun res!1073434 () Bool)

(assert (=> b!1571761 (=> (not res!1073434) (not e!876346))))

(assert (=> b!1571761 (= res!1073434 (bvslt (_1!12706 (h!38227 (insertStrictlySorted!591 l!750 key1!37 v1!32))) (_1!12706 (h!38227 (t!51666 (insertStrictlySorted!591 l!750 key1!37 v1!32))))))))

(declare-fun b!1571762 () Bool)

(assert (=> b!1571762 (= e!876346 (isStrictlySorted!992 (t!51666 (insertStrictlySorted!591 l!750 key1!37 v1!32))))))

(assert (= (and d!164581 (not res!1073433)) b!1571761))

(assert (= (and b!1571761 res!1073434) b!1571762))

(declare-fun m!1446017 () Bool)

(assert (=> b!1571762 m!1446017))

(assert (=> b!1571729 d!164581))

(declare-fun b!1571838 () Bool)

(declare-fun e!876394 () List!36766)

(declare-fun call!72234 () List!36766)

(assert (=> b!1571838 (= e!876394 call!72234)))

(declare-fun b!1571839 () Bool)

(declare-fun e!876393 () List!36766)

(assert (=> b!1571839 (= e!876393 e!876394)))

(declare-fun c!145528 () Bool)

(assert (=> b!1571839 (= c!145528 (and ((_ is Cons!36762) l!750) (= (_1!12706 (h!38227 l!750)) key1!37)))))

(declare-fun b!1571840 () Bool)

(declare-fun c!145527 () Bool)

(assert (=> b!1571840 (= c!145527 (and ((_ is Cons!36762) l!750) (bvsgt (_1!12706 (h!38227 l!750)) key1!37)))))

(declare-fun e!876392 () List!36766)

(assert (=> b!1571840 (= e!876394 e!876392)))

(declare-fun bm!72231 () Bool)

(declare-fun call!72235 () List!36766)

(assert (=> bm!72231 (= call!72234 call!72235)))

(declare-fun b!1571841 () Bool)

(assert (=> b!1571841 (= e!876393 call!72235)))

(declare-fun e!876395 () List!36766)

(declare-fun b!1571842 () Bool)

(assert (=> b!1571842 (= e!876395 (ite c!145528 (t!51666 l!750) (ite c!145527 (Cons!36762 (h!38227 l!750) (t!51666 l!750)) Nil!36763)))))

(declare-fun bm!72232 () Bool)

(declare-fun call!72236 () List!36766)

(assert (=> bm!72232 (= call!72236 call!72234)))

(declare-fun b!1571843 () Bool)

(assert (=> b!1571843 (= e!876395 (insertStrictlySorted!591 (t!51666 l!750) key1!37 v1!32))))

(declare-fun e!876391 () Bool)

(declare-fun b!1571837 () Bool)

(declare-fun lt!674212 () List!36766)

(declare-fun contains!10467 (List!36766 tuple2!25390) Bool)

(assert (=> b!1571837 (= e!876391 (contains!10467 lt!674212 (tuple2!25391 key1!37 v1!32)))))

(declare-fun d!164583 () Bool)

(assert (=> d!164583 e!876391))

(declare-fun res!1073462 () Bool)

(assert (=> d!164583 (=> (not res!1073462) (not e!876391))))

(assert (=> d!164583 (= res!1073462 (isStrictlySorted!992 lt!674212))))

(assert (=> d!164583 (= lt!674212 e!876393)))

(declare-fun c!145530 () Bool)

(assert (=> d!164583 (= c!145530 (and ((_ is Cons!36762) l!750) (bvslt (_1!12706 (h!38227 l!750)) key1!37)))))

(assert (=> d!164583 (isStrictlySorted!992 l!750)))

(assert (=> d!164583 (= (insertStrictlySorted!591 l!750 key1!37 v1!32) lt!674212)))

(declare-fun b!1571844 () Bool)

(assert (=> b!1571844 (= e!876392 call!72236)))

(declare-fun b!1571845 () Bool)

(assert (=> b!1571845 (= e!876392 call!72236)))

(declare-fun bm!72233 () Bool)

(declare-fun $colon$colon!991 (List!36766 tuple2!25390) List!36766)

(assert (=> bm!72233 (= call!72235 ($colon$colon!991 e!876395 (ite c!145530 (h!38227 l!750) (tuple2!25391 key1!37 v1!32))))))

(declare-fun c!145529 () Bool)

(assert (=> bm!72233 (= c!145529 c!145530)))

(declare-fun b!1571846 () Bool)

(declare-fun res!1073461 () Bool)

(assert (=> b!1571846 (=> (not res!1073461) (not e!876391))))

(declare-fun containsKey!864 (List!36766 (_ BitVec 64)) Bool)

(assert (=> b!1571846 (= res!1073461 (containsKey!864 lt!674212 key1!37))))

(assert (= (and d!164583 c!145530) b!1571841))

(assert (= (and d!164583 (not c!145530)) b!1571839))

(assert (= (and b!1571839 c!145528) b!1571838))

(assert (= (and b!1571839 (not c!145528)) b!1571840))

(assert (= (and b!1571840 c!145527) b!1571845))

(assert (= (and b!1571840 (not c!145527)) b!1571844))

(assert (= (or b!1571845 b!1571844) bm!72232))

(assert (= (or b!1571838 bm!72232) bm!72231))

(assert (= (or b!1571841 bm!72231) bm!72233))

(assert (= (and bm!72233 c!145529) b!1571843))

(assert (= (and bm!72233 (not c!145529)) b!1571842))

(assert (= (and d!164583 res!1073462) b!1571846))

(assert (= (and b!1571846 res!1073461) b!1571837))

(declare-fun m!1446025 () Bool)

(assert (=> d!164583 m!1446025))

(assert (=> d!164583 m!1446001))

(declare-fun m!1446027 () Bool)

(assert (=> bm!72233 m!1446027))

(declare-fun m!1446029 () Bool)

(assert (=> b!1571843 m!1446029))

(declare-fun m!1446031 () Bool)

(assert (=> b!1571837 m!1446031))

(declare-fun m!1446033 () Bool)

(assert (=> b!1571846 m!1446033))

(assert (=> b!1571729 d!164583))

(declare-fun b!1571861 () Bool)

(declare-fun e!876403 () Bool)

(declare-fun tp!114111 () Bool)

(assert (=> b!1571861 (= e!876403 (and tp_is_empty!39055 tp!114111))))

(assert (=> b!1571730 (= tp!114102 e!876403)))

(assert (= (and b!1571730 ((_ is Cons!36762) (t!51666 l!750))) b!1571861))

(check-sat (not b!1571843) (not bm!72233) (not b!1571861) (not b!1571760) (not d!164583) (not b!1571762) (not b!1571846) tp_is_empty!39055 (not b!1571837))
(check-sat)
