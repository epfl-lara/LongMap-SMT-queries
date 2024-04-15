; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133194 () Bool)

(assert start!133194)

(declare-fun b!1558187 () Bool)

(declare-fun e!868016 () Bool)

(declare-fun tp_is_empty!38443 () Bool)

(declare-fun tp!112657 () Bool)

(assert (=> b!1558187 (= e!868016 (and tp_is_empty!38443 tp!112657))))

(declare-fun res!1065774 () Bool)

(declare-fun e!868015 () Bool)

(assert (=> start!133194 (=> (not res!1065774) (not e!868015))))

(declare-datatypes ((B!2438 0))(
  ( (B!2439 (val!19305 Int)) )
))
(declare-datatypes ((tuple2!25058 0))(
  ( (tuple2!25059 (_1!12540 (_ BitVec 64)) (_2!12540 B!2438)) )
))
(declare-datatypes ((List!36384 0))(
  ( (Nil!36381) (Cons!36380 (h!37827 tuple2!25058) (t!51103 List!36384)) )
))
(declare-fun l!1292 () List!36384)

(declare-fun isStrictlySorted!978 (List!36384) Bool)

(assert (=> start!133194 (= res!1065774 (isStrictlySorted!978 l!1292))))

(assert (=> start!133194 e!868015))

(assert (=> start!133194 e!868016))

(assert (=> start!133194 true))

(assert (=> start!133194 tp_is_empty!38443))

(declare-fun b!1558188 () Bool)

(declare-fun res!1065773 () Bool)

(assert (=> b!1558188 (=> (not res!1065773) (not e!868015))))

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun containsKey!840 (List!36384 (_ BitVec 64)) Bool)

(assert (=> b!1558188 (= res!1065773 (containsKey!840 l!1292 otherKey!62))))

(declare-fun b!1558189 () Bool)

(declare-fun res!1065771 () Bool)

(assert (=> b!1558189 (=> (not res!1065771) (not e!868015))))

(assert (=> b!1558189 (= res!1065771 (containsKey!840 (t!51103 l!1292) otherKey!62))))

(declare-fun b!1558190 () Bool)

(declare-fun res!1065775 () Bool)

(assert (=> b!1558190 (=> (not res!1065775) (not e!868015))))

(assert (=> b!1558190 (= res!1065775 (isStrictlySorted!978 (t!51103 l!1292)))))

(declare-fun b!1558191 () Bool)

(declare-fun newKey!135 () (_ BitVec 64))

(declare-fun newValue!135 () B!2438)

(declare-fun insertStrictlySorted!571 (List!36384 (_ BitVec 64) B!2438) List!36384)

(assert (=> b!1558191 (= e!868015 (not (containsKey!840 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135) otherKey!62)))))

(assert (=> b!1558191 (containsKey!840 (insertStrictlySorted!571 (t!51103 l!1292) newKey!135 newValue!135) otherKey!62)))

(declare-datatypes ((Unit!51704 0))(
  ( (Unit!51705) )
))
(declare-fun lt!670501 () Unit!51704)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!10 (List!36384 (_ BitVec 64) B!2438 (_ BitVec 64)) Unit!51704)

(assert (=> b!1558191 (= lt!670501 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!10 (t!51103 l!1292) newKey!135 newValue!135 otherKey!62))))

(declare-fun b!1558192 () Bool)

(declare-fun res!1065772 () Bool)

(assert (=> b!1558192 (=> (not res!1065772) (not e!868015))))

(get-info :version)

(assert (=> b!1558192 (= res!1065772 (and (not (= otherKey!62 newKey!135)) ((_ is Cons!36380) l!1292) (not (= (_1!12540 (h!37827 l!1292)) otherKey!62))))))

(assert (= (and start!133194 res!1065774) b!1558188))

(assert (= (and b!1558188 res!1065773) b!1558192))

(assert (= (and b!1558192 res!1065772) b!1558190))

(assert (= (and b!1558190 res!1065775) b!1558189))

(assert (= (and b!1558189 res!1065771) b!1558191))

(assert (= (and start!133194 ((_ is Cons!36380) l!1292)) b!1558187))

(declare-fun m!1434203 () Bool)

(assert (=> b!1558190 m!1434203))

(declare-fun m!1434205 () Bool)

(assert (=> start!133194 m!1434205))

(declare-fun m!1434207 () Bool)

(assert (=> b!1558189 m!1434207))

(declare-fun m!1434209 () Bool)

(assert (=> b!1558191 m!1434209))

(declare-fun m!1434211 () Bool)

(assert (=> b!1558191 m!1434211))

(assert (=> b!1558191 m!1434209))

(declare-fun m!1434213 () Bool)

(assert (=> b!1558191 m!1434213))

(declare-fun m!1434215 () Bool)

(assert (=> b!1558191 m!1434215))

(assert (=> b!1558191 m!1434213))

(declare-fun m!1434217 () Bool)

(assert (=> b!1558191 m!1434217))

(declare-fun m!1434219 () Bool)

(assert (=> b!1558188 m!1434219))

(check-sat (not start!133194) (not b!1558189) (not b!1558191) tp_is_empty!38443 (not b!1558190) (not b!1558187) (not b!1558188))
(check-sat)
(get-model)

(declare-fun d!162425 () Bool)

(declare-fun res!1065814 () Bool)

(declare-fun e!868037 () Bool)

(assert (=> d!162425 (=> res!1065814 e!868037)))

(assert (=> d!162425 (= res!1065814 (and ((_ is Cons!36380) l!1292) (= (_1!12540 (h!37827 l!1292)) otherKey!62)))))

(assert (=> d!162425 (= (containsKey!840 l!1292 otherKey!62) e!868037)))

(declare-fun b!1558237 () Bool)

(declare-fun e!868038 () Bool)

(assert (=> b!1558237 (= e!868037 e!868038)))

(declare-fun res!1065815 () Bool)

(assert (=> b!1558237 (=> (not res!1065815) (not e!868038))))

(assert (=> b!1558237 (= res!1065815 (and (or (not ((_ is Cons!36380) l!1292)) (bvsle (_1!12540 (h!37827 l!1292)) otherKey!62)) ((_ is Cons!36380) l!1292) (bvslt (_1!12540 (h!37827 l!1292)) otherKey!62)))))

(declare-fun b!1558238 () Bool)

(assert (=> b!1558238 (= e!868038 (containsKey!840 (t!51103 l!1292) otherKey!62))))

(assert (= (and d!162425 (not res!1065814)) b!1558237))

(assert (= (and b!1558237 res!1065815) b!1558238))

(assert (=> b!1558238 m!1434207))

(assert (=> b!1558188 d!162425))

(declare-fun d!162431 () Bool)

(declare-fun res!1065816 () Bool)

(declare-fun e!868039 () Bool)

(assert (=> d!162431 (=> res!1065816 e!868039)))

(assert (=> d!162431 (= res!1065816 (and ((_ is Cons!36380) (t!51103 l!1292)) (= (_1!12540 (h!37827 (t!51103 l!1292))) otherKey!62)))))

(assert (=> d!162431 (= (containsKey!840 (t!51103 l!1292) otherKey!62) e!868039)))

(declare-fun b!1558239 () Bool)

(declare-fun e!868040 () Bool)

(assert (=> b!1558239 (= e!868039 e!868040)))

(declare-fun res!1065817 () Bool)

(assert (=> b!1558239 (=> (not res!1065817) (not e!868040))))

(assert (=> b!1558239 (= res!1065817 (and (or (not ((_ is Cons!36380) (t!51103 l!1292))) (bvsle (_1!12540 (h!37827 (t!51103 l!1292))) otherKey!62)) ((_ is Cons!36380) (t!51103 l!1292)) (bvslt (_1!12540 (h!37827 (t!51103 l!1292))) otherKey!62)))))

(declare-fun b!1558240 () Bool)

(assert (=> b!1558240 (= e!868040 (containsKey!840 (t!51103 (t!51103 l!1292)) otherKey!62))))

(assert (= (and d!162431 (not res!1065816)) b!1558239))

(assert (= (and b!1558239 res!1065817) b!1558240))

(declare-fun m!1434257 () Bool)

(assert (=> b!1558240 m!1434257))

(assert (=> b!1558189 d!162431))

(declare-fun d!162433 () Bool)

(declare-fun res!1065832 () Bool)

(declare-fun e!868055 () Bool)

(assert (=> d!162433 (=> res!1065832 e!868055)))

(assert (=> d!162433 (= res!1065832 (or ((_ is Nil!36381) (t!51103 l!1292)) ((_ is Nil!36381) (t!51103 (t!51103 l!1292)))))))

(assert (=> d!162433 (= (isStrictlySorted!978 (t!51103 l!1292)) e!868055)))

(declare-fun b!1558255 () Bool)

(declare-fun e!868056 () Bool)

(assert (=> b!1558255 (= e!868055 e!868056)))

(declare-fun res!1065833 () Bool)

(assert (=> b!1558255 (=> (not res!1065833) (not e!868056))))

(assert (=> b!1558255 (= res!1065833 (bvslt (_1!12540 (h!37827 (t!51103 l!1292))) (_1!12540 (h!37827 (t!51103 (t!51103 l!1292))))))))

(declare-fun b!1558256 () Bool)

(assert (=> b!1558256 (= e!868056 (isStrictlySorted!978 (t!51103 (t!51103 l!1292))))))

(assert (= (and d!162433 (not res!1065832)) b!1558255))

(assert (= (and b!1558255 res!1065833) b!1558256))

(declare-fun m!1434263 () Bool)

(assert (=> b!1558256 m!1434263))

(assert (=> b!1558190 d!162433))

(declare-fun d!162441 () Bool)

(declare-fun res!1065836 () Bool)

(declare-fun e!868059 () Bool)

(assert (=> d!162441 (=> res!1065836 e!868059)))

(assert (=> d!162441 (= res!1065836 (and ((_ is Cons!36380) (insertStrictlySorted!571 (t!51103 l!1292) newKey!135 newValue!135)) (= (_1!12540 (h!37827 (insertStrictlySorted!571 (t!51103 l!1292) newKey!135 newValue!135))) otherKey!62)))))

(assert (=> d!162441 (= (containsKey!840 (insertStrictlySorted!571 (t!51103 l!1292) newKey!135 newValue!135) otherKey!62) e!868059)))

(declare-fun b!1558259 () Bool)

(declare-fun e!868060 () Bool)

(assert (=> b!1558259 (= e!868059 e!868060)))

(declare-fun res!1065837 () Bool)

(assert (=> b!1558259 (=> (not res!1065837) (not e!868060))))

(assert (=> b!1558259 (= res!1065837 (and (or (not ((_ is Cons!36380) (insertStrictlySorted!571 (t!51103 l!1292) newKey!135 newValue!135))) (bvsle (_1!12540 (h!37827 (insertStrictlySorted!571 (t!51103 l!1292) newKey!135 newValue!135))) otherKey!62)) ((_ is Cons!36380) (insertStrictlySorted!571 (t!51103 l!1292) newKey!135 newValue!135)) (bvslt (_1!12540 (h!37827 (insertStrictlySorted!571 (t!51103 l!1292) newKey!135 newValue!135))) otherKey!62)))))

(declare-fun b!1558260 () Bool)

(assert (=> b!1558260 (= e!868060 (containsKey!840 (t!51103 (insertStrictlySorted!571 (t!51103 l!1292) newKey!135 newValue!135)) otherKey!62))))

(assert (= (and d!162441 (not res!1065836)) b!1558259))

(assert (= (and b!1558259 res!1065837) b!1558260))

(declare-fun m!1434267 () Bool)

(assert (=> b!1558260 m!1434267))

(assert (=> b!1558191 d!162441))

(declare-fun d!162445 () Bool)

(declare-fun res!1065840 () Bool)

(declare-fun e!868063 () Bool)

(assert (=> d!162445 (=> res!1065840 e!868063)))

(assert (=> d!162445 (= res!1065840 (and ((_ is Cons!36380) (insertStrictlySorted!571 l!1292 newKey!135 newValue!135)) (= (_1!12540 (h!37827 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135))) otherKey!62)))))

(assert (=> d!162445 (= (containsKey!840 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135) otherKey!62) e!868063)))

(declare-fun b!1558263 () Bool)

(declare-fun e!868064 () Bool)

(assert (=> b!1558263 (= e!868063 e!868064)))

(declare-fun res!1065841 () Bool)

(assert (=> b!1558263 (=> (not res!1065841) (not e!868064))))

(assert (=> b!1558263 (= res!1065841 (and (or (not ((_ is Cons!36380) (insertStrictlySorted!571 l!1292 newKey!135 newValue!135))) (bvsle (_1!12540 (h!37827 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135))) otherKey!62)) ((_ is Cons!36380) (insertStrictlySorted!571 l!1292 newKey!135 newValue!135)) (bvslt (_1!12540 (h!37827 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135))) otherKey!62)))))

(declare-fun b!1558264 () Bool)

(assert (=> b!1558264 (= e!868064 (containsKey!840 (t!51103 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135)) otherKey!62))))

(assert (= (and d!162445 (not res!1065840)) b!1558263))

(assert (= (and b!1558263 res!1065841) b!1558264))

(declare-fun m!1434271 () Bool)

(assert (=> b!1558264 m!1434271))

(assert (=> b!1558191 d!162445))

(declare-fun b!1558345 () Bool)

(declare-fun e!868106 () List!36384)

(declare-fun call!71742 () List!36384)

(assert (=> b!1558345 (= e!868106 call!71742)))

(declare-fun b!1558346 () Bool)

(assert (=> b!1558346 (= e!868106 call!71742)))

(declare-fun b!1558347 () Bool)

(declare-fun e!868109 () List!36384)

(declare-fun call!71743 () List!36384)

(assert (=> b!1558347 (= e!868109 call!71743)))

(declare-fun bm!71738 () Bool)

(declare-fun call!71741 () List!36384)

(assert (=> bm!71738 (= call!71742 call!71741)))

(declare-fun e!868105 () List!36384)

(declare-fun c!144048 () Bool)

(declare-fun bm!71739 () Bool)

(declare-fun $colon$colon!983 (List!36384 tuple2!25058) List!36384)

(assert (=> bm!71739 (= call!71743 ($colon$colon!983 e!868105 (ite c!144048 (h!37827 l!1292) (tuple2!25059 newKey!135 newValue!135))))))

(declare-fun c!144050 () Bool)

(assert (=> bm!71739 (= c!144050 c!144048)))

(declare-fun b!1558349 () Bool)

(assert (=> b!1558349 (= e!868105 (insertStrictlySorted!571 (t!51103 l!1292) newKey!135 newValue!135))))

(declare-fun lt!670516 () List!36384)

(declare-fun b!1558350 () Bool)

(declare-fun e!868108 () Bool)

(declare-fun contains!10170 (List!36384 tuple2!25058) Bool)

(assert (=> b!1558350 (= e!868108 (contains!10170 lt!670516 (tuple2!25059 newKey!135 newValue!135)))))

(declare-fun bm!71740 () Bool)

(assert (=> bm!71740 (= call!71741 call!71743)))

(declare-fun b!1558351 () Bool)

(declare-fun res!1065858 () Bool)

(assert (=> b!1558351 (=> (not res!1065858) (not e!868108))))

(assert (=> b!1558351 (= res!1065858 (containsKey!840 lt!670516 newKey!135))))

(declare-fun c!144051 () Bool)

(declare-fun b!1558352 () Bool)

(declare-fun c!144049 () Bool)

(assert (=> b!1558352 (= e!868105 (ite c!144049 (t!51103 l!1292) (ite c!144051 (Cons!36380 (h!37827 l!1292) (t!51103 l!1292)) Nil!36381)))))

(declare-fun b!1558353 () Bool)

(assert (=> b!1558353 (= c!144051 (and ((_ is Cons!36380) l!1292) (bvsgt (_1!12540 (h!37827 l!1292)) newKey!135)))))

(declare-fun e!868107 () List!36384)

(assert (=> b!1558353 (= e!868107 e!868106)))

(declare-fun b!1558354 () Bool)

(assert (=> b!1558354 (= e!868109 e!868107)))

(assert (=> b!1558354 (= c!144049 (and ((_ is Cons!36380) l!1292) (= (_1!12540 (h!37827 l!1292)) newKey!135)))))

(declare-fun b!1558348 () Bool)

(assert (=> b!1558348 (= e!868107 call!71741)))

(declare-fun d!162449 () Bool)

(assert (=> d!162449 e!868108))

(declare-fun res!1065859 () Bool)

(assert (=> d!162449 (=> (not res!1065859) (not e!868108))))

(assert (=> d!162449 (= res!1065859 (isStrictlySorted!978 lt!670516))))

(assert (=> d!162449 (= lt!670516 e!868109)))

(assert (=> d!162449 (= c!144048 (and ((_ is Cons!36380) l!1292) (bvslt (_1!12540 (h!37827 l!1292)) newKey!135)))))

(assert (=> d!162449 (isStrictlySorted!978 l!1292)))

(assert (=> d!162449 (= (insertStrictlySorted!571 l!1292 newKey!135 newValue!135) lt!670516)))

(assert (= (and d!162449 c!144048) b!1558347))

(assert (= (and d!162449 (not c!144048)) b!1558354))

(assert (= (and b!1558354 c!144049) b!1558348))

(assert (= (and b!1558354 (not c!144049)) b!1558353))

(assert (= (and b!1558353 c!144051) b!1558346))

(assert (= (and b!1558353 (not c!144051)) b!1558345))

(assert (= (or b!1558346 b!1558345) bm!71738))

(assert (= (or b!1558348 bm!71738) bm!71740))

(assert (= (or b!1558347 bm!71740) bm!71739))

(assert (= (and bm!71739 c!144050) b!1558349))

(assert (= (and bm!71739 (not c!144050)) b!1558352))

(assert (= (and d!162449 res!1065859) b!1558351))

(assert (= (and b!1558351 res!1065858) b!1558350))

(declare-fun m!1434285 () Bool)

(assert (=> d!162449 m!1434285))

(assert (=> d!162449 m!1434205))

(declare-fun m!1434291 () Bool)

(assert (=> bm!71739 m!1434291))

(declare-fun m!1434293 () Bool)

(assert (=> b!1558350 m!1434293))

(assert (=> b!1558349 m!1434209))

(declare-fun m!1434295 () Bool)

(assert (=> b!1558351 m!1434295))

(assert (=> b!1558191 d!162449))

(declare-fun d!162455 () Bool)

(assert (=> d!162455 (containsKey!840 (insertStrictlySorted!571 (t!51103 l!1292) newKey!135 newValue!135) otherKey!62)))

(declare-fun lt!670526 () Unit!51704)

(declare-fun choose!2079 (List!36384 (_ BitVec 64) B!2438 (_ BitVec 64)) Unit!51704)

(assert (=> d!162455 (= lt!670526 (choose!2079 (t!51103 l!1292) newKey!135 newValue!135 otherKey!62))))

(declare-fun e!868125 () Bool)

(assert (=> d!162455 e!868125))

(declare-fun res!1065880 () Bool)

(assert (=> d!162455 (=> (not res!1065880) (not e!868125))))

(assert (=> d!162455 (= res!1065880 (isStrictlySorted!978 (t!51103 l!1292)))))

(assert (=> d!162455 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!10 (t!51103 l!1292) newKey!135 newValue!135 otherKey!62) lt!670526)))

(declare-fun b!1558383 () Bool)

(declare-fun res!1065881 () Bool)

(assert (=> b!1558383 (=> (not res!1065881) (not e!868125))))

(assert (=> b!1558383 (= res!1065881 (containsKey!840 (t!51103 l!1292) otherKey!62))))

(declare-fun b!1558384 () Bool)

(assert (=> b!1558384 (= e!868125 (not (= otherKey!62 newKey!135)))))

(assert (= (and d!162455 res!1065880) b!1558383))

(assert (= (and b!1558383 res!1065881) b!1558384))

(assert (=> d!162455 m!1434209))

(assert (=> d!162455 m!1434209))

(assert (=> d!162455 m!1434211))

(declare-fun m!1434313 () Bool)

(assert (=> d!162455 m!1434313))

(assert (=> d!162455 m!1434203))

(assert (=> b!1558383 m!1434207))

(assert (=> b!1558191 d!162455))

(declare-fun b!1558395 () Bool)

(declare-fun e!868132 () List!36384)

(declare-fun call!71751 () List!36384)

(assert (=> b!1558395 (= e!868132 call!71751)))

(declare-fun b!1558396 () Bool)

(assert (=> b!1558396 (= e!868132 call!71751)))

(declare-fun b!1558397 () Bool)

(declare-fun e!868135 () List!36384)

(declare-fun call!71752 () List!36384)

(assert (=> b!1558397 (= e!868135 call!71752)))

(declare-fun bm!71747 () Bool)

(declare-fun call!71750 () List!36384)

(assert (=> bm!71747 (= call!71751 call!71750)))

(declare-fun c!144060 () Bool)

(declare-fun e!868131 () List!36384)

(declare-fun bm!71748 () Bool)

(assert (=> bm!71748 (= call!71752 ($colon$colon!983 e!868131 (ite c!144060 (h!37827 (t!51103 l!1292)) (tuple2!25059 newKey!135 newValue!135))))))

(declare-fun c!144062 () Bool)

(assert (=> bm!71748 (= c!144062 c!144060)))

(declare-fun b!1558399 () Bool)

(assert (=> b!1558399 (= e!868131 (insertStrictlySorted!571 (t!51103 (t!51103 l!1292)) newKey!135 newValue!135))))

(declare-fun lt!670528 () List!36384)

(declare-fun b!1558400 () Bool)

(declare-fun e!868134 () Bool)

(assert (=> b!1558400 (= e!868134 (contains!10170 lt!670528 (tuple2!25059 newKey!135 newValue!135)))))

(declare-fun bm!71749 () Bool)

(assert (=> bm!71749 (= call!71750 call!71752)))

(declare-fun b!1558401 () Bool)

(declare-fun res!1065884 () Bool)

(assert (=> b!1558401 (=> (not res!1065884) (not e!868134))))

(assert (=> b!1558401 (= res!1065884 (containsKey!840 lt!670528 newKey!135))))

(declare-fun b!1558402 () Bool)

(declare-fun c!144063 () Bool)

(declare-fun c!144061 () Bool)

(assert (=> b!1558402 (= e!868131 (ite c!144061 (t!51103 (t!51103 l!1292)) (ite c!144063 (Cons!36380 (h!37827 (t!51103 l!1292)) (t!51103 (t!51103 l!1292))) Nil!36381)))))

(declare-fun b!1558403 () Bool)

(assert (=> b!1558403 (= c!144063 (and ((_ is Cons!36380) (t!51103 l!1292)) (bvsgt (_1!12540 (h!37827 (t!51103 l!1292))) newKey!135)))))

(declare-fun e!868133 () List!36384)

(assert (=> b!1558403 (= e!868133 e!868132)))

(declare-fun b!1558404 () Bool)

(assert (=> b!1558404 (= e!868135 e!868133)))

(assert (=> b!1558404 (= c!144061 (and ((_ is Cons!36380) (t!51103 l!1292)) (= (_1!12540 (h!37827 (t!51103 l!1292))) newKey!135)))))

(declare-fun b!1558398 () Bool)

(assert (=> b!1558398 (= e!868133 call!71750)))

(declare-fun d!162465 () Bool)

(assert (=> d!162465 e!868134))

(declare-fun res!1065885 () Bool)

(assert (=> d!162465 (=> (not res!1065885) (not e!868134))))

(assert (=> d!162465 (= res!1065885 (isStrictlySorted!978 lt!670528))))

(assert (=> d!162465 (= lt!670528 e!868135)))

(assert (=> d!162465 (= c!144060 (and ((_ is Cons!36380) (t!51103 l!1292)) (bvslt (_1!12540 (h!37827 (t!51103 l!1292))) newKey!135)))))

(assert (=> d!162465 (isStrictlySorted!978 (t!51103 l!1292))))

(assert (=> d!162465 (= (insertStrictlySorted!571 (t!51103 l!1292) newKey!135 newValue!135) lt!670528)))

(assert (= (and d!162465 c!144060) b!1558397))

(assert (= (and d!162465 (not c!144060)) b!1558404))

(assert (= (and b!1558404 c!144061) b!1558398))

(assert (= (and b!1558404 (not c!144061)) b!1558403))

(assert (= (and b!1558403 c!144063) b!1558396))

(assert (= (and b!1558403 (not c!144063)) b!1558395))

(assert (= (or b!1558396 b!1558395) bm!71747))

(assert (= (or b!1558398 bm!71747) bm!71749))

(assert (= (or b!1558397 bm!71749) bm!71748))

(assert (= (and bm!71748 c!144062) b!1558399))

(assert (= (and bm!71748 (not c!144062)) b!1558402))

(assert (= (and d!162465 res!1065885) b!1558401))

(assert (= (and b!1558401 res!1065884) b!1558400))

(declare-fun m!1434317 () Bool)

(assert (=> d!162465 m!1434317))

(assert (=> d!162465 m!1434203))

(declare-fun m!1434323 () Bool)

(assert (=> bm!71748 m!1434323))

(declare-fun m!1434329 () Bool)

(assert (=> b!1558400 m!1434329))

(declare-fun m!1434331 () Bool)

(assert (=> b!1558399 m!1434331))

(declare-fun m!1434333 () Bool)

(assert (=> b!1558401 m!1434333))

(assert (=> b!1558191 d!162465))

(declare-fun d!162469 () Bool)

(declare-fun res!1065890 () Bool)

(declare-fun e!868140 () Bool)

(assert (=> d!162469 (=> res!1065890 e!868140)))

(assert (=> d!162469 (= res!1065890 (or ((_ is Nil!36381) l!1292) ((_ is Nil!36381) (t!51103 l!1292))))))

(assert (=> d!162469 (= (isStrictlySorted!978 l!1292) e!868140)))

(declare-fun b!1558409 () Bool)

(declare-fun e!868141 () Bool)

(assert (=> b!1558409 (= e!868140 e!868141)))

(declare-fun res!1065891 () Bool)

(assert (=> b!1558409 (=> (not res!1065891) (not e!868141))))

(assert (=> b!1558409 (= res!1065891 (bvslt (_1!12540 (h!37827 l!1292)) (_1!12540 (h!37827 (t!51103 l!1292)))))))

(declare-fun b!1558410 () Bool)

(assert (=> b!1558410 (= e!868141 (isStrictlySorted!978 (t!51103 l!1292)))))

(assert (= (and d!162469 (not res!1065890)) b!1558409))

(assert (= (and b!1558409 res!1065891) b!1558410))

(assert (=> b!1558410 m!1434203))

(assert (=> start!133194 d!162469))

(declare-fun b!1558419 () Bool)

(declare-fun e!868148 () Bool)

(declare-fun tp!112666 () Bool)

(assert (=> b!1558419 (= e!868148 (and tp_is_empty!38443 tp!112666))))

(assert (=> b!1558187 (= tp!112657 e!868148)))

(assert (= (and b!1558187 ((_ is Cons!36380) (t!51103 l!1292))) b!1558419))

(check-sat (not b!1558401) (not b!1558349) (not b!1558350) (not b!1558264) (not b!1558419) (not b!1558399) (not b!1558240) tp_is_empty!38443 (not b!1558410) (not b!1558351) (not b!1558400) (not bm!71739) (not b!1558383) (not bm!71748) (not b!1558238) (not d!162465) (not d!162449) (not b!1558256) (not d!162455) (not b!1558260))
(check-sat)
(get-model)

(assert (=> d!162455 d!162441))

(assert (=> d!162455 d!162465))

(declare-fun d!162479 () Bool)

(assert (=> d!162479 (containsKey!840 (insertStrictlySorted!571 (t!51103 l!1292) newKey!135 newValue!135) otherKey!62)))

(assert (=> d!162479 true))

(declare-fun _$18!41 () Unit!51704)

(assert (=> d!162479 (= (choose!2079 (t!51103 l!1292) newKey!135 newValue!135 otherKey!62) _$18!41)))

(declare-fun bs!44758 () Bool)

(assert (= bs!44758 d!162479))

(assert (=> bs!44758 m!1434209))

(assert (=> bs!44758 m!1434209))

(assert (=> bs!44758 m!1434211))

(assert (=> d!162455 d!162479))

(assert (=> d!162455 d!162433))

(assert (=> b!1558410 d!162433))

(declare-fun d!162481 () Bool)

(assert (=> d!162481 (= ($colon$colon!983 e!868131 (ite c!144060 (h!37827 (t!51103 l!1292)) (tuple2!25059 newKey!135 newValue!135))) (Cons!36380 (ite c!144060 (h!37827 (t!51103 l!1292)) (tuple2!25059 newKey!135 newValue!135)) e!868131))))

(assert (=> bm!71748 d!162481))

(declare-fun d!162483 () Bool)

(declare-fun res!1065908 () Bool)

(declare-fun e!868167 () Bool)

(assert (=> d!162483 (=> res!1065908 e!868167)))

(assert (=> d!162483 (= res!1065908 (or ((_ is Nil!36381) lt!670516) ((_ is Nil!36381) (t!51103 lt!670516))))))

(assert (=> d!162483 (= (isStrictlySorted!978 lt!670516) e!868167)))

(declare-fun b!1558442 () Bool)

(declare-fun e!868168 () Bool)

(assert (=> b!1558442 (= e!868167 e!868168)))

(declare-fun res!1065909 () Bool)

(assert (=> b!1558442 (=> (not res!1065909) (not e!868168))))

(assert (=> b!1558442 (= res!1065909 (bvslt (_1!12540 (h!37827 lt!670516)) (_1!12540 (h!37827 (t!51103 lt!670516)))))))

(declare-fun b!1558443 () Bool)

(assert (=> b!1558443 (= e!868168 (isStrictlySorted!978 (t!51103 lt!670516)))))

(assert (= (and d!162483 (not res!1065908)) b!1558442))

(assert (= (and b!1558442 res!1065909) b!1558443))

(declare-fun m!1434341 () Bool)

(assert (=> b!1558443 m!1434341))

(assert (=> d!162449 d!162483))

(assert (=> d!162449 d!162469))

(declare-fun d!162485 () Bool)

(declare-fun res!1065910 () Bool)

(declare-fun e!868169 () Bool)

(assert (=> d!162485 (=> res!1065910 e!868169)))

(assert (=> d!162485 (= res!1065910 (or ((_ is Nil!36381) (t!51103 (t!51103 l!1292))) ((_ is Nil!36381) (t!51103 (t!51103 (t!51103 l!1292))))))))

(assert (=> d!162485 (= (isStrictlySorted!978 (t!51103 (t!51103 l!1292))) e!868169)))

(declare-fun b!1558444 () Bool)

(declare-fun e!868170 () Bool)

(assert (=> b!1558444 (= e!868169 e!868170)))

(declare-fun res!1065911 () Bool)

(assert (=> b!1558444 (=> (not res!1065911) (not e!868170))))

(assert (=> b!1558444 (= res!1065911 (bvslt (_1!12540 (h!37827 (t!51103 (t!51103 l!1292)))) (_1!12540 (h!37827 (t!51103 (t!51103 (t!51103 l!1292)))))))))

(declare-fun b!1558445 () Bool)

(assert (=> b!1558445 (= e!868170 (isStrictlySorted!978 (t!51103 (t!51103 (t!51103 l!1292)))))))

(assert (= (and d!162485 (not res!1065910)) b!1558444))

(assert (= (and b!1558444 res!1065911) b!1558445))

(declare-fun m!1434343 () Bool)

(assert (=> b!1558445 m!1434343))

(assert (=> b!1558256 d!162485))

(assert (=> b!1558238 d!162431))

(declare-fun d!162487 () Bool)

(declare-fun res!1065912 () Bool)

(declare-fun e!868171 () Bool)

(assert (=> d!162487 (=> res!1065912 e!868171)))

(assert (=> d!162487 (= res!1065912 (and ((_ is Cons!36380) lt!670516) (= (_1!12540 (h!37827 lt!670516)) newKey!135)))))

(assert (=> d!162487 (= (containsKey!840 lt!670516 newKey!135) e!868171)))

(declare-fun b!1558446 () Bool)

(declare-fun e!868172 () Bool)

(assert (=> b!1558446 (= e!868171 e!868172)))

(declare-fun res!1065913 () Bool)

(assert (=> b!1558446 (=> (not res!1065913) (not e!868172))))

(assert (=> b!1558446 (= res!1065913 (and (or (not ((_ is Cons!36380) lt!670516)) (bvsle (_1!12540 (h!37827 lt!670516)) newKey!135)) ((_ is Cons!36380) lt!670516) (bvslt (_1!12540 (h!37827 lt!670516)) newKey!135)))))

(declare-fun b!1558447 () Bool)

(assert (=> b!1558447 (= e!868172 (containsKey!840 (t!51103 lt!670516) newKey!135))))

(assert (= (and d!162487 (not res!1065912)) b!1558446))

(assert (= (and b!1558446 res!1065913) b!1558447))

(declare-fun m!1434345 () Bool)

(assert (=> b!1558447 m!1434345))

(assert (=> b!1558351 d!162487))

(declare-fun d!162489 () Bool)

(declare-fun res!1065914 () Bool)

(declare-fun e!868173 () Bool)

(assert (=> d!162489 (=> res!1065914 e!868173)))

(assert (=> d!162489 (= res!1065914 (or ((_ is Nil!36381) lt!670528) ((_ is Nil!36381) (t!51103 lt!670528))))))

(assert (=> d!162489 (= (isStrictlySorted!978 lt!670528) e!868173)))

(declare-fun b!1558448 () Bool)

(declare-fun e!868174 () Bool)

(assert (=> b!1558448 (= e!868173 e!868174)))

(declare-fun res!1065915 () Bool)

(assert (=> b!1558448 (=> (not res!1065915) (not e!868174))))

(assert (=> b!1558448 (= res!1065915 (bvslt (_1!12540 (h!37827 lt!670528)) (_1!12540 (h!37827 (t!51103 lt!670528)))))))

(declare-fun b!1558449 () Bool)

(assert (=> b!1558449 (= e!868174 (isStrictlySorted!978 (t!51103 lt!670528)))))

(assert (= (and d!162489 (not res!1065914)) b!1558448))

(assert (= (and b!1558448 res!1065915) b!1558449))

(declare-fun m!1434347 () Bool)

(assert (=> b!1558449 m!1434347))

(assert (=> d!162465 d!162489))

(assert (=> d!162465 d!162433))

(declare-fun d!162491 () Bool)

(declare-fun res!1065916 () Bool)

(declare-fun e!868175 () Bool)

(assert (=> d!162491 (=> res!1065916 e!868175)))

(assert (=> d!162491 (= res!1065916 (and ((_ is Cons!36380) (t!51103 (insertStrictlySorted!571 (t!51103 l!1292) newKey!135 newValue!135))) (= (_1!12540 (h!37827 (t!51103 (insertStrictlySorted!571 (t!51103 l!1292) newKey!135 newValue!135)))) otherKey!62)))))

(assert (=> d!162491 (= (containsKey!840 (t!51103 (insertStrictlySorted!571 (t!51103 l!1292) newKey!135 newValue!135)) otherKey!62) e!868175)))

(declare-fun b!1558450 () Bool)

(declare-fun e!868176 () Bool)

(assert (=> b!1558450 (= e!868175 e!868176)))

(declare-fun res!1065917 () Bool)

(assert (=> b!1558450 (=> (not res!1065917) (not e!868176))))

(assert (=> b!1558450 (= res!1065917 (and (or (not ((_ is Cons!36380) (t!51103 (insertStrictlySorted!571 (t!51103 l!1292) newKey!135 newValue!135)))) (bvsle (_1!12540 (h!37827 (t!51103 (insertStrictlySorted!571 (t!51103 l!1292) newKey!135 newValue!135)))) otherKey!62)) ((_ is Cons!36380) (t!51103 (insertStrictlySorted!571 (t!51103 l!1292) newKey!135 newValue!135))) (bvslt (_1!12540 (h!37827 (t!51103 (insertStrictlySorted!571 (t!51103 l!1292) newKey!135 newValue!135)))) otherKey!62)))))

(declare-fun b!1558451 () Bool)

(assert (=> b!1558451 (= e!868176 (containsKey!840 (t!51103 (t!51103 (insertStrictlySorted!571 (t!51103 l!1292) newKey!135 newValue!135))) otherKey!62))))

(assert (= (and d!162491 (not res!1065916)) b!1558450))

(assert (= (and b!1558450 res!1065917) b!1558451))

(declare-fun m!1434349 () Bool)

(assert (=> b!1558451 m!1434349))

(assert (=> b!1558260 d!162491))

(declare-fun d!162493 () Bool)

(declare-fun res!1065918 () Bool)

(declare-fun e!868177 () Bool)

(assert (=> d!162493 (=> res!1065918 e!868177)))

(assert (=> d!162493 (= res!1065918 (and ((_ is Cons!36380) lt!670528) (= (_1!12540 (h!37827 lt!670528)) newKey!135)))))

(assert (=> d!162493 (= (containsKey!840 lt!670528 newKey!135) e!868177)))

(declare-fun b!1558452 () Bool)

(declare-fun e!868178 () Bool)

(assert (=> b!1558452 (= e!868177 e!868178)))

(declare-fun res!1065919 () Bool)

(assert (=> b!1558452 (=> (not res!1065919) (not e!868178))))

(assert (=> b!1558452 (= res!1065919 (and (or (not ((_ is Cons!36380) lt!670528)) (bvsle (_1!12540 (h!37827 lt!670528)) newKey!135)) ((_ is Cons!36380) lt!670528) (bvslt (_1!12540 (h!37827 lt!670528)) newKey!135)))))

(declare-fun b!1558453 () Bool)

(assert (=> b!1558453 (= e!868178 (containsKey!840 (t!51103 lt!670528) newKey!135))))

(assert (= (and d!162493 (not res!1065918)) b!1558452))

(assert (= (and b!1558452 res!1065919) b!1558453))

(declare-fun m!1434351 () Bool)

(assert (=> b!1558453 m!1434351))

(assert (=> b!1558401 d!162493))

(assert (=> b!1558349 d!162465))

(declare-fun d!162495 () Bool)

(declare-fun res!1065920 () Bool)

(declare-fun e!868179 () Bool)

(assert (=> d!162495 (=> res!1065920 e!868179)))

(assert (=> d!162495 (= res!1065920 (and ((_ is Cons!36380) (t!51103 (t!51103 l!1292))) (= (_1!12540 (h!37827 (t!51103 (t!51103 l!1292)))) otherKey!62)))))

(assert (=> d!162495 (= (containsKey!840 (t!51103 (t!51103 l!1292)) otherKey!62) e!868179)))

(declare-fun b!1558454 () Bool)

(declare-fun e!868180 () Bool)

(assert (=> b!1558454 (= e!868179 e!868180)))

(declare-fun res!1065921 () Bool)

(assert (=> b!1558454 (=> (not res!1065921) (not e!868180))))

(assert (=> b!1558454 (= res!1065921 (and (or (not ((_ is Cons!36380) (t!51103 (t!51103 l!1292)))) (bvsle (_1!12540 (h!37827 (t!51103 (t!51103 l!1292)))) otherKey!62)) ((_ is Cons!36380) (t!51103 (t!51103 l!1292))) (bvslt (_1!12540 (h!37827 (t!51103 (t!51103 l!1292)))) otherKey!62)))))

(declare-fun b!1558455 () Bool)

(assert (=> b!1558455 (= e!868180 (containsKey!840 (t!51103 (t!51103 (t!51103 l!1292))) otherKey!62))))

(assert (= (and d!162495 (not res!1065920)) b!1558454))

(assert (= (and b!1558454 res!1065921) b!1558455))

(declare-fun m!1434353 () Bool)

(assert (=> b!1558455 m!1434353))

(assert (=> b!1558240 d!162495))

(declare-fun lt!670531 () Bool)

(declare-fun d!162497 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!790 (List!36384) (InoxSet tuple2!25058))

(assert (=> d!162497 (= lt!670531 (select (content!790 lt!670516) (tuple2!25059 newKey!135 newValue!135)))))

(declare-fun e!868185 () Bool)

(assert (=> d!162497 (= lt!670531 e!868185)))

(declare-fun res!1065927 () Bool)

(assert (=> d!162497 (=> (not res!1065927) (not e!868185))))

(assert (=> d!162497 (= res!1065927 ((_ is Cons!36380) lt!670516))))

(assert (=> d!162497 (= (contains!10170 lt!670516 (tuple2!25059 newKey!135 newValue!135)) lt!670531)))

(declare-fun b!1558460 () Bool)

(declare-fun e!868186 () Bool)

(assert (=> b!1558460 (= e!868185 e!868186)))

(declare-fun res!1065926 () Bool)

(assert (=> b!1558460 (=> res!1065926 e!868186)))

(assert (=> b!1558460 (= res!1065926 (= (h!37827 lt!670516) (tuple2!25059 newKey!135 newValue!135)))))

(declare-fun b!1558461 () Bool)

(assert (=> b!1558461 (= e!868186 (contains!10170 (t!51103 lt!670516) (tuple2!25059 newKey!135 newValue!135)))))

(assert (= (and d!162497 res!1065927) b!1558460))

(assert (= (and b!1558460 (not res!1065926)) b!1558461))

(declare-fun m!1434355 () Bool)

(assert (=> d!162497 m!1434355))

(declare-fun m!1434357 () Bool)

(assert (=> d!162497 m!1434357))

(declare-fun m!1434359 () Bool)

(assert (=> b!1558461 m!1434359))

(assert (=> b!1558350 d!162497))

(assert (=> b!1558383 d!162431))

(declare-fun b!1558462 () Bool)

(declare-fun e!868188 () List!36384)

(declare-fun call!71754 () List!36384)

(assert (=> b!1558462 (= e!868188 call!71754)))

(declare-fun b!1558463 () Bool)

(assert (=> b!1558463 (= e!868188 call!71754)))

(declare-fun b!1558464 () Bool)

(declare-fun e!868191 () List!36384)

(declare-fun call!71755 () List!36384)

(assert (=> b!1558464 (= e!868191 call!71755)))

(declare-fun bm!71750 () Bool)

(declare-fun call!71753 () List!36384)

(assert (=> bm!71750 (= call!71754 call!71753)))

(declare-fun e!868187 () List!36384)

(declare-fun c!144064 () Bool)

(declare-fun bm!71751 () Bool)

(assert (=> bm!71751 (= call!71755 ($colon$colon!983 e!868187 (ite c!144064 (h!37827 (t!51103 (t!51103 l!1292))) (tuple2!25059 newKey!135 newValue!135))))))

(declare-fun c!144066 () Bool)

(assert (=> bm!71751 (= c!144066 c!144064)))

(declare-fun b!1558466 () Bool)

(assert (=> b!1558466 (= e!868187 (insertStrictlySorted!571 (t!51103 (t!51103 (t!51103 l!1292))) newKey!135 newValue!135))))

(declare-fun lt!670532 () List!36384)

(declare-fun e!868190 () Bool)

(declare-fun b!1558467 () Bool)

(assert (=> b!1558467 (= e!868190 (contains!10170 lt!670532 (tuple2!25059 newKey!135 newValue!135)))))

(declare-fun bm!71752 () Bool)

(assert (=> bm!71752 (= call!71753 call!71755)))

(declare-fun b!1558468 () Bool)

(declare-fun res!1065928 () Bool)

(assert (=> b!1558468 (=> (not res!1065928) (not e!868190))))

(assert (=> b!1558468 (= res!1065928 (containsKey!840 lt!670532 newKey!135))))

(declare-fun b!1558469 () Bool)

(declare-fun c!144067 () Bool)

(declare-fun c!144065 () Bool)

(assert (=> b!1558469 (= e!868187 (ite c!144065 (t!51103 (t!51103 (t!51103 l!1292))) (ite c!144067 (Cons!36380 (h!37827 (t!51103 (t!51103 l!1292))) (t!51103 (t!51103 (t!51103 l!1292)))) Nil!36381)))))

(declare-fun b!1558470 () Bool)

(assert (=> b!1558470 (= c!144067 (and ((_ is Cons!36380) (t!51103 (t!51103 l!1292))) (bvsgt (_1!12540 (h!37827 (t!51103 (t!51103 l!1292)))) newKey!135)))))

(declare-fun e!868189 () List!36384)

(assert (=> b!1558470 (= e!868189 e!868188)))

(declare-fun b!1558471 () Bool)

(assert (=> b!1558471 (= e!868191 e!868189)))

(assert (=> b!1558471 (= c!144065 (and ((_ is Cons!36380) (t!51103 (t!51103 l!1292))) (= (_1!12540 (h!37827 (t!51103 (t!51103 l!1292)))) newKey!135)))))

(declare-fun b!1558465 () Bool)

(assert (=> b!1558465 (= e!868189 call!71753)))

(declare-fun d!162499 () Bool)

(assert (=> d!162499 e!868190))

(declare-fun res!1065929 () Bool)

(assert (=> d!162499 (=> (not res!1065929) (not e!868190))))

(assert (=> d!162499 (= res!1065929 (isStrictlySorted!978 lt!670532))))

(assert (=> d!162499 (= lt!670532 e!868191)))

(assert (=> d!162499 (= c!144064 (and ((_ is Cons!36380) (t!51103 (t!51103 l!1292))) (bvslt (_1!12540 (h!37827 (t!51103 (t!51103 l!1292)))) newKey!135)))))

(assert (=> d!162499 (isStrictlySorted!978 (t!51103 (t!51103 l!1292)))))

(assert (=> d!162499 (= (insertStrictlySorted!571 (t!51103 (t!51103 l!1292)) newKey!135 newValue!135) lt!670532)))

(assert (= (and d!162499 c!144064) b!1558464))

(assert (= (and d!162499 (not c!144064)) b!1558471))

(assert (= (and b!1558471 c!144065) b!1558465))

(assert (= (and b!1558471 (not c!144065)) b!1558470))

(assert (= (and b!1558470 c!144067) b!1558463))

(assert (= (and b!1558470 (not c!144067)) b!1558462))

(assert (= (or b!1558463 b!1558462) bm!71750))

(assert (= (or b!1558465 bm!71750) bm!71752))

(assert (= (or b!1558464 bm!71752) bm!71751))

(assert (= (and bm!71751 c!144066) b!1558466))

(assert (= (and bm!71751 (not c!144066)) b!1558469))

(assert (= (and d!162499 res!1065929) b!1558468))

(assert (= (and b!1558468 res!1065928) b!1558467))

(declare-fun m!1434361 () Bool)

(assert (=> d!162499 m!1434361))

(assert (=> d!162499 m!1434263))

(declare-fun m!1434363 () Bool)

(assert (=> bm!71751 m!1434363))

(declare-fun m!1434365 () Bool)

(assert (=> b!1558467 m!1434365))

(declare-fun m!1434367 () Bool)

(assert (=> b!1558466 m!1434367))

(declare-fun m!1434369 () Bool)

(assert (=> b!1558468 m!1434369))

(assert (=> b!1558399 d!162499))

(declare-fun lt!670533 () Bool)

(declare-fun d!162501 () Bool)

(assert (=> d!162501 (= lt!670533 (select (content!790 lt!670528) (tuple2!25059 newKey!135 newValue!135)))))

(declare-fun e!868192 () Bool)

(assert (=> d!162501 (= lt!670533 e!868192)))

(declare-fun res!1065931 () Bool)

(assert (=> d!162501 (=> (not res!1065931) (not e!868192))))

(assert (=> d!162501 (= res!1065931 ((_ is Cons!36380) lt!670528))))

(assert (=> d!162501 (= (contains!10170 lt!670528 (tuple2!25059 newKey!135 newValue!135)) lt!670533)))

(declare-fun b!1558472 () Bool)

(declare-fun e!868193 () Bool)

(assert (=> b!1558472 (= e!868192 e!868193)))

(declare-fun res!1065930 () Bool)

(assert (=> b!1558472 (=> res!1065930 e!868193)))

(assert (=> b!1558472 (= res!1065930 (= (h!37827 lt!670528) (tuple2!25059 newKey!135 newValue!135)))))

(declare-fun b!1558473 () Bool)

(assert (=> b!1558473 (= e!868193 (contains!10170 (t!51103 lt!670528) (tuple2!25059 newKey!135 newValue!135)))))

(assert (= (and d!162501 res!1065931) b!1558472))

(assert (= (and b!1558472 (not res!1065930)) b!1558473))

(declare-fun m!1434371 () Bool)

(assert (=> d!162501 m!1434371))

(declare-fun m!1434373 () Bool)

(assert (=> d!162501 m!1434373))

(declare-fun m!1434375 () Bool)

(assert (=> b!1558473 m!1434375))

(assert (=> b!1558400 d!162501))

(declare-fun d!162503 () Bool)

(declare-fun res!1065932 () Bool)

(declare-fun e!868194 () Bool)

(assert (=> d!162503 (=> res!1065932 e!868194)))

(assert (=> d!162503 (= res!1065932 (and ((_ is Cons!36380) (t!51103 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135))) (= (_1!12540 (h!37827 (t!51103 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135)))) otherKey!62)))))

(assert (=> d!162503 (= (containsKey!840 (t!51103 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135)) otherKey!62) e!868194)))

(declare-fun b!1558474 () Bool)

(declare-fun e!868195 () Bool)

(assert (=> b!1558474 (= e!868194 e!868195)))

(declare-fun res!1065933 () Bool)

(assert (=> b!1558474 (=> (not res!1065933) (not e!868195))))

(assert (=> b!1558474 (= res!1065933 (and (or (not ((_ is Cons!36380) (t!51103 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135)))) (bvsle (_1!12540 (h!37827 (t!51103 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135)))) otherKey!62)) ((_ is Cons!36380) (t!51103 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135))) (bvslt (_1!12540 (h!37827 (t!51103 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135)))) otherKey!62)))))

(declare-fun b!1558475 () Bool)

(assert (=> b!1558475 (= e!868195 (containsKey!840 (t!51103 (t!51103 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135))) otherKey!62))))

(assert (= (and d!162503 (not res!1065932)) b!1558474))

(assert (= (and b!1558474 res!1065933) b!1558475))

(declare-fun m!1434377 () Bool)

(assert (=> b!1558475 m!1434377))

(assert (=> b!1558264 d!162503))

(declare-fun d!162505 () Bool)

(assert (=> d!162505 (= ($colon$colon!983 e!868105 (ite c!144048 (h!37827 l!1292) (tuple2!25059 newKey!135 newValue!135))) (Cons!36380 (ite c!144048 (h!37827 l!1292) (tuple2!25059 newKey!135 newValue!135)) e!868105))))

(assert (=> bm!71739 d!162505))

(declare-fun b!1558476 () Bool)

(declare-fun e!868196 () Bool)

(declare-fun tp!112673 () Bool)

(assert (=> b!1558476 (= e!868196 (and tp_is_empty!38443 tp!112673))))

(assert (=> b!1558419 (= tp!112666 e!868196)))

(assert (= (and b!1558419 ((_ is Cons!36380) (t!51103 (t!51103 l!1292)))) b!1558476))

(check-sat (not d!162479) (not b!1558466) (not b!1558451) (not b!1558476) (not b!1558461) (not b!1558467) (not bm!71751) (not b!1558453) (not b!1558473) (not d!162499) tp_is_empty!38443 (not b!1558449) (not b!1558455) (not d!162501) (not b!1558443) (not b!1558445) (not b!1558447) (not d!162497) (not b!1558475) (not b!1558468))
(check-sat)
