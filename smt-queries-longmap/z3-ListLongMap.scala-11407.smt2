; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133230 () Bool)

(assert start!133230)

(declare-fun b!1558238 () Bool)

(declare-fun e!867955 () Bool)

(declare-fun tp_is_empty!38329 () Bool)

(declare-fun tp!112344 () Bool)

(assert (=> b!1558238 (= e!867955 (and tp_is_empty!38329 tp!112344))))

(declare-fun b!1558235 () Bool)

(declare-fun res!1065326 () Bool)

(declare-fun e!867956 () Bool)

(assert (=> b!1558235 (=> (not res!1065326) (not e!867956))))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-datatypes ((B!2318 0))(
  ( (B!2319 (val!19245 Int)) )
))
(declare-datatypes ((tuple2!24920 0))(
  ( (tuple2!24921 (_1!12471 (_ BitVec 64)) (_2!12471 B!2318)) )
))
(declare-datatypes ((List!36308 0))(
  ( (Nil!36305) (Cons!36304 (h!37768 tuple2!24920) (t!51021 List!36308)) )
))
(declare-fun l!1177 () List!36308)

(declare-fun newKey!105 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1558235 (= res!1065326 (and (not (= newKey!105 otherKey!50)) (or (not ((_ is Cons!36304) l!1177)) (= (_1!12471 (h!37768 l!1177)) otherKey!50))))))

(declare-fun b!1558236 () Bool)

(declare-fun e!867954 () Bool)

(assert (=> b!1558236 (= e!867956 e!867954)))

(declare-fun res!1065327 () Bool)

(assert (=> b!1558236 (=> (not res!1065327) (not e!867954))))

(declare-fun lt!671254 () List!36308)

(declare-fun containsKey!803 (List!36308 (_ BitVec 64)) Bool)

(assert (=> b!1558236 (= res!1065327 (= (containsKey!803 lt!671254 otherKey!50) (containsKey!803 l!1177 otherKey!50)))))

(declare-fun newValue!105 () B!2318)

(declare-fun insertStrictlySorted!544 (List!36308 (_ BitVec 64) B!2318) List!36308)

(assert (=> b!1558236 (= lt!671254 (insertStrictlySorted!544 l!1177 newKey!105 newValue!105))))

(declare-fun res!1065325 () Bool)

(assert (=> start!133230 (=> (not res!1065325) (not e!867956))))

(declare-fun isStrictlySorted!919 (List!36308) Bool)

(assert (=> start!133230 (= res!1065325 (isStrictlySorted!919 l!1177))))

(assert (=> start!133230 e!867956))

(assert (=> start!133230 e!867955))

(assert (=> start!133230 true))

(assert (=> start!133230 tp_is_empty!38329))

(declare-fun b!1558237 () Bool)

(assert (=> b!1558237 (= e!867954 (not (isStrictlySorted!919 lt!671254)))))

(assert (= (and start!133230 res!1065325) b!1558235))

(assert (= (and b!1558235 res!1065326) b!1558236))

(assert (= (and b!1558236 res!1065327) b!1558237))

(assert (= (and start!133230 ((_ is Cons!36304) l!1177)) b!1558238))

(declare-fun m!1435907 () Bool)

(assert (=> b!1558236 m!1435907))

(declare-fun m!1435909 () Bool)

(assert (=> b!1558236 m!1435909))

(declare-fun m!1435911 () Bool)

(assert (=> b!1558236 m!1435911))

(declare-fun m!1435913 () Bool)

(assert (=> start!133230 m!1435913))

(declare-fun m!1435915 () Bool)

(assert (=> b!1558237 m!1435915))

(check-sat (not b!1558238) (not start!133230) tp_is_empty!38329 (not b!1558237) (not b!1558236))
(check-sat)
(get-model)

(declare-fun d!162715 () Bool)

(declare-fun res!1065350 () Bool)

(declare-fun e!867979 () Bool)

(assert (=> d!162715 (=> res!1065350 e!867979)))

(assert (=> d!162715 (= res!1065350 (or ((_ is Nil!36305) lt!671254) ((_ is Nil!36305) (t!51021 lt!671254))))))

(assert (=> d!162715 (= (isStrictlySorted!919 lt!671254) e!867979)))

(declare-fun b!1558267 () Bool)

(declare-fun e!867980 () Bool)

(assert (=> b!1558267 (= e!867979 e!867980)))

(declare-fun res!1065351 () Bool)

(assert (=> b!1558267 (=> (not res!1065351) (not e!867980))))

(assert (=> b!1558267 (= res!1065351 (bvslt (_1!12471 (h!37768 lt!671254)) (_1!12471 (h!37768 (t!51021 lt!671254)))))))

(declare-fun b!1558268 () Bool)

(assert (=> b!1558268 (= e!867980 (isStrictlySorted!919 (t!51021 lt!671254)))))

(assert (= (and d!162715 (not res!1065350)) b!1558267))

(assert (= (and b!1558267 res!1065351) b!1558268))

(declare-fun m!1435937 () Bool)

(assert (=> b!1558268 m!1435937))

(assert (=> b!1558237 d!162715))

(declare-fun d!162721 () Bool)

(declare-fun res!1065372 () Bool)

(declare-fun e!868001 () Bool)

(assert (=> d!162721 (=> res!1065372 e!868001)))

(assert (=> d!162721 (= res!1065372 (and ((_ is Cons!36304) lt!671254) (= (_1!12471 (h!37768 lt!671254)) otherKey!50)))))

(assert (=> d!162721 (= (containsKey!803 lt!671254 otherKey!50) e!868001)))

(declare-fun b!1558289 () Bool)

(declare-fun e!868002 () Bool)

(assert (=> b!1558289 (= e!868001 e!868002)))

(declare-fun res!1065373 () Bool)

(assert (=> b!1558289 (=> (not res!1065373) (not e!868002))))

(assert (=> b!1558289 (= res!1065373 (and (or (not ((_ is Cons!36304) lt!671254)) (bvsle (_1!12471 (h!37768 lt!671254)) otherKey!50)) ((_ is Cons!36304) lt!671254) (bvslt (_1!12471 (h!37768 lt!671254)) otherKey!50)))))

(declare-fun b!1558290 () Bool)

(assert (=> b!1558290 (= e!868002 (containsKey!803 (t!51021 lt!671254) otherKey!50))))

(assert (= (and d!162721 (not res!1065372)) b!1558289))

(assert (= (and b!1558289 res!1065373) b!1558290))

(declare-fun m!1435947 () Bool)

(assert (=> b!1558290 m!1435947))

(assert (=> b!1558236 d!162721))

(declare-fun d!162731 () Bool)

(declare-fun res!1065374 () Bool)

(declare-fun e!868003 () Bool)

(assert (=> d!162731 (=> res!1065374 e!868003)))

(assert (=> d!162731 (= res!1065374 (and ((_ is Cons!36304) l!1177) (= (_1!12471 (h!37768 l!1177)) otherKey!50)))))

(assert (=> d!162731 (= (containsKey!803 l!1177 otherKey!50) e!868003)))

(declare-fun b!1558291 () Bool)

(declare-fun e!868004 () Bool)

(assert (=> b!1558291 (= e!868003 e!868004)))

(declare-fun res!1065375 () Bool)

(assert (=> b!1558291 (=> (not res!1065375) (not e!868004))))

(assert (=> b!1558291 (= res!1065375 (and (or (not ((_ is Cons!36304) l!1177)) (bvsle (_1!12471 (h!37768 l!1177)) otherKey!50)) ((_ is Cons!36304) l!1177) (bvslt (_1!12471 (h!37768 l!1177)) otherKey!50)))))

(declare-fun b!1558292 () Bool)

(assert (=> b!1558292 (= e!868004 (containsKey!803 (t!51021 l!1177) otherKey!50))))

(assert (= (and d!162731 (not res!1065374)) b!1558291))

(assert (= (and b!1558291 res!1065375) b!1558292))

(declare-fun m!1435949 () Bool)

(assert (=> b!1558292 m!1435949))

(assert (=> b!1558236 d!162731))

(declare-fun b!1558373 () Bool)

(declare-fun e!868047 () List!36308)

(declare-fun call!71728 () List!36308)

(assert (=> b!1558373 (= e!868047 call!71728)))

(declare-fun b!1558374 () Bool)

(declare-fun e!868049 () List!36308)

(declare-fun e!868045 () List!36308)

(assert (=> b!1558374 (= e!868049 e!868045)))

(declare-fun c!144505 () Bool)

(assert (=> b!1558374 (= c!144505 (and ((_ is Cons!36304) l!1177) (= (_1!12471 (h!37768 l!1177)) newKey!105)))))

(declare-fun lt!671269 () List!36308)

(declare-fun b!1558375 () Bool)

(declare-fun e!868048 () Bool)

(declare-fun contains!10224 (List!36308 tuple2!24920) Bool)

(assert (=> b!1558375 (= e!868048 (contains!10224 lt!671269 (tuple2!24921 newKey!105 newValue!105)))))

(declare-fun b!1558376 () Bool)

(declare-fun res!1065393 () Bool)

(assert (=> b!1558376 (=> (not res!1065393) (not e!868048))))

(assert (=> b!1558376 (= res!1065393 (containsKey!803 lt!671269 newKey!105))))

(declare-fun bm!71725 () Bool)

(declare-fun call!71730 () List!36308)

(declare-fun e!868046 () List!36308)

(declare-fun c!144503 () Bool)

(declare-fun $colon$colon!963 (List!36308 tuple2!24920) List!36308)

(assert (=> bm!71725 (= call!71730 ($colon$colon!963 e!868046 (ite c!144503 (h!37768 l!1177) (tuple2!24921 newKey!105 newValue!105))))))

(declare-fun c!144502 () Bool)

(assert (=> bm!71725 (= c!144502 c!144503)))

(declare-fun bm!71726 () Bool)

(declare-fun call!71729 () List!36308)

(assert (=> bm!71726 (= call!71728 call!71729)))

(declare-fun bm!71727 () Bool)

(assert (=> bm!71727 (= call!71729 call!71730)))

(declare-fun c!144504 () Bool)

(declare-fun b!1558378 () Bool)

(assert (=> b!1558378 (= e!868046 (ite c!144505 (t!51021 l!1177) (ite c!144504 (Cons!36304 (h!37768 l!1177) (t!51021 l!1177)) Nil!36305)))))

(declare-fun b!1558379 () Bool)

(assert (=> b!1558379 (= c!144504 (and ((_ is Cons!36304) l!1177) (bvsgt (_1!12471 (h!37768 l!1177)) newKey!105)))))

(assert (=> b!1558379 (= e!868045 e!868047)))

(declare-fun b!1558380 () Bool)

(assert (=> b!1558380 (= e!868045 call!71729)))

(declare-fun b!1558377 () Bool)

(assert (=> b!1558377 (= e!868049 call!71730)))

(declare-fun d!162733 () Bool)

(assert (=> d!162733 e!868048))

(declare-fun res!1065392 () Bool)

(assert (=> d!162733 (=> (not res!1065392) (not e!868048))))

(assert (=> d!162733 (= res!1065392 (isStrictlySorted!919 lt!671269))))

(assert (=> d!162733 (= lt!671269 e!868049)))

(assert (=> d!162733 (= c!144503 (and ((_ is Cons!36304) l!1177) (bvslt (_1!12471 (h!37768 l!1177)) newKey!105)))))

(assert (=> d!162733 (isStrictlySorted!919 l!1177)))

(assert (=> d!162733 (= (insertStrictlySorted!544 l!1177 newKey!105 newValue!105) lt!671269)))

(declare-fun b!1558381 () Bool)

(assert (=> b!1558381 (= e!868047 call!71728)))

(declare-fun b!1558382 () Bool)

(assert (=> b!1558382 (= e!868046 (insertStrictlySorted!544 (t!51021 l!1177) newKey!105 newValue!105))))

(assert (= (and d!162733 c!144503) b!1558377))

(assert (= (and d!162733 (not c!144503)) b!1558374))

(assert (= (and b!1558374 c!144505) b!1558380))

(assert (= (and b!1558374 (not c!144505)) b!1558379))

(assert (= (and b!1558379 c!144504) b!1558373))

(assert (= (and b!1558379 (not c!144504)) b!1558381))

(assert (= (or b!1558373 b!1558381) bm!71726))

(assert (= (or b!1558380 bm!71726) bm!71727))

(assert (= (or b!1558377 bm!71727) bm!71725))

(assert (= (and bm!71725 c!144502) b!1558382))

(assert (= (and bm!71725 (not c!144502)) b!1558378))

(assert (= (and d!162733 res!1065392) b!1558376))

(assert (= (and b!1558376 res!1065393) b!1558375))

(declare-fun m!1435971 () Bool)

(assert (=> d!162733 m!1435971))

(assert (=> d!162733 m!1435913))

(declare-fun m!1435973 () Bool)

(assert (=> b!1558382 m!1435973))

(declare-fun m!1435975 () Bool)

(assert (=> b!1558376 m!1435975))

(declare-fun m!1435977 () Bool)

(assert (=> b!1558375 m!1435977))

(declare-fun m!1435979 () Bool)

(assert (=> bm!71725 m!1435979))

(assert (=> b!1558236 d!162733))

(declare-fun d!162739 () Bool)

(declare-fun res!1065394 () Bool)

(declare-fun e!868050 () Bool)

(assert (=> d!162739 (=> res!1065394 e!868050)))

(assert (=> d!162739 (= res!1065394 (or ((_ is Nil!36305) l!1177) ((_ is Nil!36305) (t!51021 l!1177))))))

(assert (=> d!162739 (= (isStrictlySorted!919 l!1177) e!868050)))

(declare-fun b!1558383 () Bool)

(declare-fun e!868051 () Bool)

(assert (=> b!1558383 (= e!868050 e!868051)))

(declare-fun res!1065395 () Bool)

(assert (=> b!1558383 (=> (not res!1065395) (not e!868051))))

(assert (=> b!1558383 (= res!1065395 (bvslt (_1!12471 (h!37768 l!1177)) (_1!12471 (h!37768 (t!51021 l!1177)))))))

(declare-fun b!1558384 () Bool)

(assert (=> b!1558384 (= e!868051 (isStrictlySorted!919 (t!51021 l!1177)))))

(assert (= (and d!162739 (not res!1065394)) b!1558383))

(assert (= (and b!1558383 res!1065395) b!1558384))

(declare-fun m!1435981 () Bool)

(assert (=> b!1558384 m!1435981))

(assert (=> start!133230 d!162739))

(declare-fun b!1558397 () Bool)

(declare-fun e!868062 () Bool)

(declare-fun tp!112353 () Bool)

(assert (=> b!1558397 (= e!868062 (and tp_is_empty!38329 tp!112353))))

(assert (=> b!1558238 (= tp!112344 e!868062)))

(assert (= (and b!1558238 ((_ is Cons!36304) (t!51021 l!1177))) b!1558397))

(check-sat (not b!1558384) (not b!1558292) (not b!1558397) tp_is_empty!38329 (not d!162733) (not b!1558376) (not b!1558290) (not b!1558268) (not b!1558382) (not bm!71725) (not b!1558375))
(check-sat)
