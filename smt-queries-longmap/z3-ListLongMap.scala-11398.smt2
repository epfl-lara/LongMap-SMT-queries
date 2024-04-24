; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133104 () Bool)

(assert start!133104)

(declare-fun b!1557280 () Bool)

(declare-fun res!1064857 () Bool)

(declare-fun e!867337 () Bool)

(assert (=> b!1557280 (=> (not res!1064857) (not e!867337))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-datatypes ((B!2264 0))(
  ( (B!2265 (val!19218 Int)) )
))
(declare-datatypes ((tuple2!24866 0))(
  ( (tuple2!24867 (_1!12444 (_ BitVec 64)) (_2!12444 B!2264)) )
))
(declare-datatypes ((List!36281 0))(
  ( (Nil!36278) (Cons!36277 (h!37741 tuple2!24866) (t!50994 List!36281)) )
))
(declare-fun l!1177 () List!36281)

(get-info :version)

(assert (=> b!1557280 (= res!1064857 (and (not (= newKey!105 otherKey!50)) ((_ is Cons!36277) l!1177) (not (= (_1!12444 (h!37741 l!1177)) otherKey!50))))))

(declare-fun res!1064858 () Bool)

(assert (=> start!133104 (=> (not res!1064858) (not e!867337))))

(declare-fun isStrictlySorted!898 (List!36281) Bool)

(assert (=> start!133104 (= res!1064858 (isStrictlySorted!898 l!1177))))

(assert (=> start!133104 e!867337))

(declare-fun e!867336 () Bool)

(assert (=> start!133104 e!867336))

(assert (=> start!133104 true))

(declare-fun tp_is_empty!38275 () Bool)

(assert (=> start!133104 tp_is_empty!38275))

(declare-fun lt!671080 () List!36281)

(declare-fun e!867338 () Bool)

(declare-fun b!1557281 () Bool)

(declare-datatypes ((Option!831 0))(
  ( (Some!830 (v!22012 B!2264)) (None!829) )
))
(declare-fun getValueByKey!756 (List!36281 (_ BitVec 64)) Option!831)

(assert (=> b!1557281 (= e!867338 (= (getValueByKey!756 lt!671080 otherKey!50) (getValueByKey!756 (t!50994 l!1177) otherKey!50)))))

(declare-fun b!1557282 () Bool)

(declare-fun res!1064856 () Bool)

(assert (=> b!1557282 (=> (not res!1064856) (not e!867337))))

(assert (=> b!1557282 (= res!1064856 (isStrictlySorted!898 (t!50994 l!1177)))))

(declare-fun newValue!105 () B!2264)

(declare-fun b!1557283 () Bool)

(declare-fun insertStrictlySorted!523 (List!36281 (_ BitVec 64) B!2264) List!36281)

(assert (=> b!1557283 (= e!867337 (not (isStrictlySorted!898 (insertStrictlySorted!523 l!1177 newKey!105 newValue!105))))))

(assert (=> b!1557283 e!867338))

(declare-fun res!1064859 () Bool)

(assert (=> b!1557283 (=> (not res!1064859) (not e!867338))))

(declare-fun containsKey!782 (List!36281 (_ BitVec 64)) Bool)

(assert (=> b!1557283 (= res!1064859 (= (containsKey!782 lt!671080 otherKey!50) (containsKey!782 (t!50994 l!1177) otherKey!50)))))

(assert (=> b!1557283 (= lt!671080 (insertStrictlySorted!523 (t!50994 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51719 0))(
  ( (Unit!51720) )
))
(declare-fun lt!671079 () Unit!51719)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!19 (List!36281 (_ BitVec 64) B!2264 (_ BitVec 64)) Unit!51719)

(assert (=> b!1557283 (= lt!671079 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!19 (t!50994 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1557284 () Bool)

(declare-fun tp!112236 () Bool)

(assert (=> b!1557284 (= e!867336 (and tp_is_empty!38275 tp!112236))))

(assert (= (and start!133104 res!1064858) b!1557280))

(assert (= (and b!1557280 res!1064857) b!1557282))

(assert (= (and b!1557282 res!1064856) b!1557283))

(assert (= (and b!1557283 res!1064859) b!1557281))

(assert (= (and start!133104 ((_ is Cons!36277) l!1177)) b!1557284))

(declare-fun m!1435307 () Bool)

(assert (=> start!133104 m!1435307))

(declare-fun m!1435309 () Bool)

(assert (=> b!1557281 m!1435309))

(declare-fun m!1435311 () Bool)

(assert (=> b!1557281 m!1435311))

(declare-fun m!1435313 () Bool)

(assert (=> b!1557282 m!1435313))

(declare-fun m!1435315 () Bool)

(assert (=> b!1557283 m!1435315))

(declare-fun m!1435317 () Bool)

(assert (=> b!1557283 m!1435317))

(declare-fun m!1435319 () Bool)

(assert (=> b!1557283 m!1435319))

(assert (=> b!1557283 m!1435315))

(declare-fun m!1435321 () Bool)

(assert (=> b!1557283 m!1435321))

(declare-fun m!1435323 () Bool)

(assert (=> b!1557283 m!1435323))

(declare-fun m!1435325 () Bool)

(assert (=> b!1557283 m!1435325))

(check-sat (not b!1557283) (not b!1557284) tp_is_empty!38275 (not start!133104) (not b!1557282) (not b!1557281))
(check-sat)
(get-model)

(declare-fun bm!71608 () Bool)

(declare-fun call!71611 () List!36281)

(declare-fun c!144315 () Bool)

(declare-fun e!867391 () List!36281)

(declare-fun $colon$colon!953 (List!36281 tuple2!24866) List!36281)

(assert (=> bm!71608 (= call!71611 ($colon$colon!953 e!867391 (ite c!144315 (h!37741 l!1177) (tuple2!24867 newKey!105 newValue!105))))))

(declare-fun c!144310 () Bool)

(assert (=> bm!71608 (= c!144310 c!144315)))

(declare-fun bm!71609 () Bool)

(declare-fun call!71613 () List!36281)

(declare-fun call!71612 () List!36281)

(assert (=> bm!71609 (= call!71613 call!71612)))

(declare-fun b!1557375 () Bool)

(declare-fun e!867393 () List!36281)

(assert (=> b!1557375 (= e!867393 call!71613)))

(declare-fun b!1557376 () Bool)

(assert (=> b!1557376 (= e!867393 call!71613)))

(declare-fun bm!71610 () Bool)

(assert (=> bm!71610 (= call!71612 call!71611)))

(declare-fun b!1557377 () Bool)

(declare-fun c!144311 () Bool)

(assert (=> b!1557377 (= c!144311 (and ((_ is Cons!36277) l!1177) (bvsgt (_1!12444 (h!37741 l!1177)) newKey!105)))))

(declare-fun e!867392 () List!36281)

(assert (=> b!1557377 (= e!867392 e!867393)))

(declare-fun b!1557378 () Bool)

(declare-fun c!144312 () Bool)

(assert (=> b!1557378 (= e!867391 (ite c!144312 (t!50994 l!1177) (ite c!144311 (Cons!36277 (h!37741 l!1177) (t!50994 l!1177)) Nil!36278)))))

(declare-fun d!162547 () Bool)

(declare-fun e!867395 () Bool)

(assert (=> d!162547 e!867395))

(declare-fun res!1064901 () Bool)

(assert (=> d!162547 (=> (not res!1064901) (not e!867395))))

(declare-fun lt!671097 () List!36281)

(assert (=> d!162547 (= res!1064901 (isStrictlySorted!898 lt!671097))))

(declare-fun e!867394 () List!36281)

(assert (=> d!162547 (= lt!671097 e!867394)))

(assert (=> d!162547 (= c!144315 (and ((_ is Cons!36277) l!1177) (bvslt (_1!12444 (h!37741 l!1177)) newKey!105)))))

(assert (=> d!162547 (isStrictlySorted!898 l!1177)))

(assert (=> d!162547 (= (insertStrictlySorted!523 l!1177 newKey!105 newValue!105) lt!671097)))

(declare-fun b!1557379 () Bool)

(declare-fun contains!10214 (List!36281 tuple2!24866) Bool)

(assert (=> b!1557379 (= e!867395 (contains!10214 lt!671097 (tuple2!24867 newKey!105 newValue!105)))))

(declare-fun b!1557380 () Bool)

(declare-fun res!1064900 () Bool)

(assert (=> b!1557380 (=> (not res!1064900) (not e!867395))))

(assert (=> b!1557380 (= res!1064900 (containsKey!782 lt!671097 newKey!105))))

(declare-fun b!1557381 () Bool)

(assert (=> b!1557381 (= e!867391 (insertStrictlySorted!523 (t!50994 l!1177) newKey!105 newValue!105))))

(declare-fun b!1557382 () Bool)

(assert (=> b!1557382 (= e!867392 call!71612)))

(declare-fun b!1557383 () Bool)

(assert (=> b!1557383 (= e!867394 call!71611)))

(declare-fun b!1557384 () Bool)

(assert (=> b!1557384 (= e!867394 e!867392)))

(assert (=> b!1557384 (= c!144312 (and ((_ is Cons!36277) l!1177) (= (_1!12444 (h!37741 l!1177)) newKey!105)))))

(assert (= (and d!162547 c!144315) b!1557383))

(assert (= (and d!162547 (not c!144315)) b!1557384))

(assert (= (and b!1557384 c!144312) b!1557382))

(assert (= (and b!1557384 (not c!144312)) b!1557377))

(assert (= (and b!1557377 c!144311) b!1557376))

(assert (= (and b!1557377 (not c!144311)) b!1557375))

(assert (= (or b!1557376 b!1557375) bm!71609))

(assert (= (or b!1557382 bm!71609) bm!71610))

(assert (= (or b!1557383 bm!71610) bm!71608))

(assert (= (and bm!71608 c!144310) b!1557381))

(assert (= (and bm!71608 (not c!144310)) b!1557378))

(assert (= (and d!162547 res!1064901) b!1557380))

(assert (= (and b!1557380 res!1064900) b!1557379))

(declare-fun m!1435375 () Bool)

(assert (=> b!1557380 m!1435375))

(declare-fun m!1435377 () Bool)

(assert (=> b!1557379 m!1435377))

(declare-fun m!1435379 () Bool)

(assert (=> d!162547 m!1435379))

(assert (=> d!162547 m!1435307))

(declare-fun m!1435381 () Bool)

(assert (=> bm!71608 m!1435381))

(assert (=> b!1557381 m!1435321))

(assert (=> b!1557283 d!162547))

(declare-fun d!162565 () Bool)

(declare-fun e!867416 () Bool)

(assert (=> d!162565 e!867416))

(declare-fun res!1064916 () Bool)

(assert (=> d!162565 (=> (not res!1064916) (not e!867416))))

(assert (=> d!162565 (= res!1064916 (= (containsKey!782 (insertStrictlySorted!523 (t!50994 l!1177) newKey!105 newValue!105) otherKey!50) (containsKey!782 (t!50994 l!1177) otherKey!50)))))

(declare-fun lt!671101 () Unit!51719)

(declare-fun choose!2049 (List!36281 (_ BitVec 64) B!2264 (_ BitVec 64)) Unit!51719)

(assert (=> d!162565 (= lt!671101 (choose!2049 (t!50994 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun e!867415 () Bool)

(assert (=> d!162565 e!867415))

(declare-fun res!1064917 () Bool)

(assert (=> d!162565 (=> (not res!1064917) (not e!867415))))

(assert (=> d!162565 (= res!1064917 (isStrictlySorted!898 (t!50994 l!1177)))))

(assert (=> d!162565 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!19 (t!50994 l!1177) newKey!105 newValue!105 otherKey!50) lt!671101)))

(declare-fun b!1557411 () Bool)

(assert (=> b!1557411 (= e!867415 (not (= newKey!105 otherKey!50)))))

(declare-fun b!1557412 () Bool)

(assert (=> b!1557412 (= e!867416 (= (getValueByKey!756 (insertStrictlySorted!523 (t!50994 l!1177) newKey!105 newValue!105) otherKey!50) (getValueByKey!756 (t!50994 l!1177) otherKey!50)))))

(assert (= (and d!162565 res!1064917) b!1557411))

(assert (= (and d!162565 res!1064916) b!1557412))

(assert (=> d!162565 m!1435321))

(assert (=> d!162565 m!1435321))

(declare-fun m!1435391 () Bool)

(assert (=> d!162565 m!1435391))

(assert (=> d!162565 m!1435323))

(assert (=> d!162565 m!1435313))

(declare-fun m!1435393 () Bool)

(assert (=> d!162565 m!1435393))

(assert (=> b!1557412 m!1435321))

(assert (=> b!1557412 m!1435321))

(declare-fun m!1435395 () Bool)

(assert (=> b!1557412 m!1435395))

(assert (=> b!1557412 m!1435311))

(assert (=> b!1557283 d!162565))

(declare-fun d!162569 () Bool)

(declare-fun res!1064922 () Bool)

(declare-fun e!867427 () Bool)

(assert (=> d!162569 (=> res!1064922 e!867427)))

(assert (=> d!162569 (= res!1064922 (and ((_ is Cons!36277) lt!671080) (= (_1!12444 (h!37741 lt!671080)) otherKey!50)))))

(assert (=> d!162569 (= (containsKey!782 lt!671080 otherKey!50) e!867427)))

(declare-fun b!1557429 () Bool)

(declare-fun e!867428 () Bool)

(assert (=> b!1557429 (= e!867427 e!867428)))

(declare-fun res!1064923 () Bool)

(assert (=> b!1557429 (=> (not res!1064923) (not e!867428))))

(assert (=> b!1557429 (= res!1064923 (and (or (not ((_ is Cons!36277) lt!671080)) (bvsle (_1!12444 (h!37741 lt!671080)) otherKey!50)) ((_ is Cons!36277) lt!671080) (bvslt (_1!12444 (h!37741 lt!671080)) otherKey!50)))))

(declare-fun b!1557430 () Bool)

(assert (=> b!1557430 (= e!867428 (containsKey!782 (t!50994 lt!671080) otherKey!50))))

(assert (= (and d!162569 (not res!1064922)) b!1557429))

(assert (= (and b!1557429 res!1064923) b!1557430))

(declare-fun m!1435397 () Bool)

(assert (=> b!1557430 m!1435397))

(assert (=> b!1557283 d!162569))

(declare-fun e!867431 () List!36281)

(declare-fun bm!71626 () Bool)

(declare-fun call!71629 () List!36281)

(declare-fun c!144333 () Bool)

(assert (=> bm!71626 (= call!71629 ($colon$colon!953 e!867431 (ite c!144333 (h!37741 (t!50994 l!1177)) (tuple2!24867 newKey!105 newValue!105))))))

(declare-fun c!144330 () Bool)

(assert (=> bm!71626 (= c!144330 c!144333)))

(declare-fun bm!71627 () Bool)

(declare-fun call!71631 () List!36281)

(declare-fun call!71630 () List!36281)

(assert (=> bm!71627 (= call!71631 call!71630)))

(declare-fun b!1557435 () Bool)

(declare-fun e!867433 () List!36281)

(assert (=> b!1557435 (= e!867433 call!71631)))

(declare-fun b!1557436 () Bool)

(assert (=> b!1557436 (= e!867433 call!71631)))

(declare-fun bm!71628 () Bool)

(assert (=> bm!71628 (= call!71630 call!71629)))

(declare-fun b!1557437 () Bool)

(declare-fun c!144331 () Bool)

(assert (=> b!1557437 (= c!144331 (and ((_ is Cons!36277) (t!50994 l!1177)) (bvsgt (_1!12444 (h!37741 (t!50994 l!1177))) newKey!105)))))

(declare-fun e!867432 () List!36281)

(assert (=> b!1557437 (= e!867432 e!867433)))

(declare-fun c!144332 () Bool)

(declare-fun b!1557438 () Bool)

(assert (=> b!1557438 (= e!867431 (ite c!144332 (t!50994 (t!50994 l!1177)) (ite c!144331 (Cons!36277 (h!37741 (t!50994 l!1177)) (t!50994 (t!50994 l!1177))) Nil!36278)))))

(declare-fun d!162571 () Bool)

(declare-fun e!867435 () Bool)

(assert (=> d!162571 e!867435))

(declare-fun res!1064925 () Bool)

(assert (=> d!162571 (=> (not res!1064925) (not e!867435))))

(declare-fun lt!671104 () List!36281)

(assert (=> d!162571 (= res!1064925 (isStrictlySorted!898 lt!671104))))

(declare-fun e!867434 () List!36281)

(assert (=> d!162571 (= lt!671104 e!867434)))

(assert (=> d!162571 (= c!144333 (and ((_ is Cons!36277) (t!50994 l!1177)) (bvslt (_1!12444 (h!37741 (t!50994 l!1177))) newKey!105)))))

(assert (=> d!162571 (isStrictlySorted!898 (t!50994 l!1177))))

(assert (=> d!162571 (= (insertStrictlySorted!523 (t!50994 l!1177) newKey!105 newValue!105) lt!671104)))

(declare-fun b!1557439 () Bool)

(assert (=> b!1557439 (= e!867435 (contains!10214 lt!671104 (tuple2!24867 newKey!105 newValue!105)))))

(declare-fun b!1557440 () Bool)

(declare-fun res!1064924 () Bool)

(assert (=> b!1557440 (=> (not res!1064924) (not e!867435))))

(assert (=> b!1557440 (= res!1064924 (containsKey!782 lt!671104 newKey!105))))

(declare-fun b!1557441 () Bool)

(assert (=> b!1557441 (= e!867431 (insertStrictlySorted!523 (t!50994 (t!50994 l!1177)) newKey!105 newValue!105))))

(declare-fun b!1557442 () Bool)

(assert (=> b!1557442 (= e!867432 call!71630)))

(declare-fun b!1557443 () Bool)

(assert (=> b!1557443 (= e!867434 call!71629)))

(declare-fun b!1557444 () Bool)

(assert (=> b!1557444 (= e!867434 e!867432)))

(assert (=> b!1557444 (= c!144332 (and ((_ is Cons!36277) (t!50994 l!1177)) (= (_1!12444 (h!37741 (t!50994 l!1177))) newKey!105)))))

(assert (= (and d!162571 c!144333) b!1557443))

(assert (= (and d!162571 (not c!144333)) b!1557444))

(assert (= (and b!1557444 c!144332) b!1557442))

(assert (= (and b!1557444 (not c!144332)) b!1557437))

(assert (= (and b!1557437 c!144331) b!1557436))

(assert (= (and b!1557437 (not c!144331)) b!1557435))

(assert (= (or b!1557436 b!1557435) bm!71627))

(assert (= (or b!1557442 bm!71627) bm!71628))

(assert (= (or b!1557443 bm!71628) bm!71626))

(assert (= (and bm!71626 c!144330) b!1557441))

(assert (= (and bm!71626 (not c!144330)) b!1557438))

(assert (= (and d!162571 res!1064925) b!1557440))

(assert (= (and b!1557440 res!1064924) b!1557439))

(declare-fun m!1435399 () Bool)

(assert (=> b!1557440 m!1435399))

(declare-fun m!1435401 () Bool)

(assert (=> b!1557439 m!1435401))

(declare-fun m!1435403 () Bool)

(assert (=> d!162571 m!1435403))

(assert (=> d!162571 m!1435313))

(declare-fun m!1435405 () Bool)

(assert (=> bm!71626 m!1435405))

(declare-fun m!1435407 () Bool)

(assert (=> b!1557441 m!1435407))

(assert (=> b!1557283 d!162571))

(declare-fun d!162573 () Bool)

(declare-fun res!1064934 () Bool)

(declare-fun e!867442 () Bool)

(assert (=> d!162573 (=> res!1064934 e!867442)))

(assert (=> d!162573 (= res!1064934 (and ((_ is Cons!36277) (t!50994 l!1177)) (= (_1!12444 (h!37741 (t!50994 l!1177))) otherKey!50)))))

(assert (=> d!162573 (= (containsKey!782 (t!50994 l!1177) otherKey!50) e!867442)))

(declare-fun b!1557453 () Bool)

(declare-fun e!867443 () Bool)

(assert (=> b!1557453 (= e!867442 e!867443)))

(declare-fun res!1064935 () Bool)

(assert (=> b!1557453 (=> (not res!1064935) (not e!867443))))

(assert (=> b!1557453 (= res!1064935 (and (or (not ((_ is Cons!36277) (t!50994 l!1177))) (bvsle (_1!12444 (h!37741 (t!50994 l!1177))) otherKey!50)) ((_ is Cons!36277) (t!50994 l!1177)) (bvslt (_1!12444 (h!37741 (t!50994 l!1177))) otherKey!50)))))

(declare-fun b!1557454 () Bool)

(assert (=> b!1557454 (= e!867443 (containsKey!782 (t!50994 (t!50994 l!1177)) otherKey!50))))

(assert (= (and d!162573 (not res!1064934)) b!1557453))

(assert (= (and b!1557453 res!1064935) b!1557454))

(declare-fun m!1435409 () Bool)

(assert (=> b!1557454 m!1435409))

(assert (=> b!1557283 d!162573))

(declare-fun d!162575 () Bool)

(declare-fun res!1064944 () Bool)

(declare-fun e!867455 () Bool)

(assert (=> d!162575 (=> res!1064944 e!867455)))

(assert (=> d!162575 (= res!1064944 (or ((_ is Nil!36278) (insertStrictlySorted!523 l!1177 newKey!105 newValue!105)) ((_ is Nil!36278) (t!50994 (insertStrictlySorted!523 l!1177 newKey!105 newValue!105)))))))

(assert (=> d!162575 (= (isStrictlySorted!898 (insertStrictlySorted!523 l!1177 newKey!105 newValue!105)) e!867455)))

(declare-fun b!1557471 () Bool)

(declare-fun e!867456 () Bool)

(assert (=> b!1557471 (= e!867455 e!867456)))

(declare-fun res!1064945 () Bool)

(assert (=> b!1557471 (=> (not res!1064945) (not e!867456))))

(assert (=> b!1557471 (= res!1064945 (bvslt (_1!12444 (h!37741 (insertStrictlySorted!523 l!1177 newKey!105 newValue!105))) (_1!12444 (h!37741 (t!50994 (insertStrictlySorted!523 l!1177 newKey!105 newValue!105))))))))

(declare-fun b!1557472 () Bool)

(assert (=> b!1557472 (= e!867456 (isStrictlySorted!898 (t!50994 (insertStrictlySorted!523 l!1177 newKey!105 newValue!105))))))

(assert (= (and d!162575 (not res!1064944)) b!1557471))

(assert (= (and b!1557471 res!1064945) b!1557472))

(declare-fun m!1435417 () Bool)

(assert (=> b!1557472 m!1435417))

(assert (=> b!1557283 d!162575))

(declare-fun d!162579 () Bool)

(declare-fun res!1064950 () Bool)

(declare-fun e!867461 () Bool)

(assert (=> d!162579 (=> res!1064950 e!867461)))

(assert (=> d!162579 (= res!1064950 (or ((_ is Nil!36278) (t!50994 l!1177)) ((_ is Nil!36278) (t!50994 (t!50994 l!1177)))))))

(assert (=> d!162579 (= (isStrictlySorted!898 (t!50994 l!1177)) e!867461)))

(declare-fun b!1557475 () Bool)

(declare-fun e!867462 () Bool)

(assert (=> b!1557475 (= e!867461 e!867462)))

(declare-fun res!1064951 () Bool)

(assert (=> b!1557475 (=> (not res!1064951) (not e!867462))))

(assert (=> b!1557475 (= res!1064951 (bvslt (_1!12444 (h!37741 (t!50994 l!1177))) (_1!12444 (h!37741 (t!50994 (t!50994 l!1177))))))))

(declare-fun b!1557476 () Bool)

(assert (=> b!1557476 (= e!867462 (isStrictlySorted!898 (t!50994 (t!50994 l!1177))))))

(assert (= (and d!162579 (not res!1064950)) b!1557475))

(assert (= (and b!1557475 res!1064951) b!1557476))

(declare-fun m!1435425 () Bool)

(assert (=> b!1557476 m!1435425))

(assert (=> b!1557282 d!162579))

(declare-fun b!1557503 () Bool)

(declare-fun e!867478 () Option!831)

(assert (=> b!1557503 (= e!867478 (Some!830 (_2!12444 (h!37741 lt!671080))))))

(declare-fun b!1557504 () Bool)

(declare-fun e!867479 () Option!831)

(assert (=> b!1557504 (= e!867478 e!867479)))

(declare-fun c!144347 () Bool)

(assert (=> b!1557504 (= c!144347 (and ((_ is Cons!36277) lt!671080) (not (= (_1!12444 (h!37741 lt!671080)) otherKey!50))))))

(declare-fun d!162581 () Bool)

(declare-fun c!144346 () Bool)

(assert (=> d!162581 (= c!144346 (and ((_ is Cons!36277) lt!671080) (= (_1!12444 (h!37741 lt!671080)) otherKey!50)))))

(assert (=> d!162581 (= (getValueByKey!756 lt!671080 otherKey!50) e!867478)))

(declare-fun b!1557506 () Bool)

(assert (=> b!1557506 (= e!867479 None!829)))

(declare-fun b!1557505 () Bool)

(assert (=> b!1557505 (= e!867479 (getValueByKey!756 (t!50994 lt!671080) otherKey!50))))

(assert (= (and d!162581 c!144346) b!1557503))

(assert (= (and d!162581 (not c!144346)) b!1557504))

(assert (= (and b!1557504 c!144347) b!1557505))

(assert (= (and b!1557504 (not c!144347)) b!1557506))

(declare-fun m!1435445 () Bool)

(assert (=> b!1557505 m!1435445))

(assert (=> b!1557281 d!162581))

(declare-fun b!1557507 () Bool)

(declare-fun e!867480 () Option!831)

(assert (=> b!1557507 (= e!867480 (Some!830 (_2!12444 (h!37741 (t!50994 l!1177)))))))

(declare-fun b!1557508 () Bool)

(declare-fun e!867481 () Option!831)

(assert (=> b!1557508 (= e!867480 e!867481)))

(declare-fun c!144349 () Bool)

(assert (=> b!1557508 (= c!144349 (and ((_ is Cons!36277) (t!50994 l!1177)) (not (= (_1!12444 (h!37741 (t!50994 l!1177))) otherKey!50))))))

(declare-fun d!162593 () Bool)

(declare-fun c!144348 () Bool)

(assert (=> d!162593 (= c!144348 (and ((_ is Cons!36277) (t!50994 l!1177)) (= (_1!12444 (h!37741 (t!50994 l!1177))) otherKey!50)))))

(assert (=> d!162593 (= (getValueByKey!756 (t!50994 l!1177) otherKey!50) e!867480)))

(declare-fun b!1557510 () Bool)

(assert (=> b!1557510 (= e!867481 None!829)))

(declare-fun b!1557509 () Bool)

(assert (=> b!1557509 (= e!867481 (getValueByKey!756 (t!50994 (t!50994 l!1177)) otherKey!50))))

(assert (= (and d!162593 c!144348) b!1557507))

(assert (= (and d!162593 (not c!144348)) b!1557508))

(assert (= (and b!1557508 c!144349) b!1557509))

(assert (= (and b!1557508 (not c!144349)) b!1557510))

(declare-fun m!1435447 () Bool)

(assert (=> b!1557509 m!1435447))

(assert (=> b!1557281 d!162593))

(declare-fun d!162595 () Bool)

(declare-fun res!1064964 () Bool)

(declare-fun e!867486 () Bool)

(assert (=> d!162595 (=> res!1064964 e!867486)))

(assert (=> d!162595 (= res!1064964 (or ((_ is Nil!36278) l!1177) ((_ is Nil!36278) (t!50994 l!1177))))))

(assert (=> d!162595 (= (isStrictlySorted!898 l!1177) e!867486)))

(declare-fun b!1557515 () Bool)

(declare-fun e!867487 () Bool)

(assert (=> b!1557515 (= e!867486 e!867487)))

(declare-fun res!1064965 () Bool)

(assert (=> b!1557515 (=> (not res!1064965) (not e!867487))))

(assert (=> b!1557515 (= res!1064965 (bvslt (_1!12444 (h!37741 l!1177)) (_1!12444 (h!37741 (t!50994 l!1177)))))))

(declare-fun b!1557516 () Bool)

(assert (=> b!1557516 (= e!867487 (isStrictlySorted!898 (t!50994 l!1177)))))

(assert (= (and d!162595 (not res!1064964)) b!1557515))

(assert (= (and b!1557515 res!1064965) b!1557516))

(assert (=> b!1557516 m!1435313))

(assert (=> start!133104 d!162595))

(declare-fun b!1557529 () Bool)

(declare-fun e!867494 () Bool)

(declare-fun tp!112245 () Bool)

(assert (=> b!1557529 (= e!867494 (and tp_is_empty!38275 tp!112245))))

(assert (=> b!1557284 (= tp!112236 e!867494)))

(assert (= (and b!1557284 ((_ is Cons!36277) (t!50994 l!1177))) b!1557529))

(check-sat (not b!1557441) (not b!1557505) tp_is_empty!38275 (not b!1557509) (not b!1557472) (not bm!71608) (not b!1557454) (not d!162547) (not b!1557516) (not b!1557412) (not b!1557440) (not b!1557439) (not b!1557430) (not d!162571) (not d!162565) (not b!1557379) (not b!1557476) (not b!1557381) (not bm!71626) (not b!1557380) (not b!1557529))
(check-sat)
