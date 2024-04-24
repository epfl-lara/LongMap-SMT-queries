; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133566 () Bool)

(assert start!133566)

(declare-fun b!1560398 () Bool)

(declare-fun e!869366 () Bool)

(declare-fun tp_is_empty!38419 () Bool)

(declare-fun tp!112584 () Bool)

(assert (=> b!1560398 (= e!869366 (and tp_is_empty!38419 tp!112584))))

(declare-fun b!1560396 () Bool)

(declare-fun res!1066431 () Bool)

(declare-fun e!869365 () Bool)

(assert (=> b!1560396 (=> (not res!1066431) (not e!869365))))

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun newKey!135 () (_ BitVec 64))

(declare-datatypes ((B!2414 0))(
  ( (B!2415 (val!19293 Int)) )
))
(declare-datatypes ((tuple2!25016 0))(
  ( (tuple2!25017 (_1!12519 (_ BitVec 64)) (_2!12519 B!2414)) )
))
(declare-datatypes ((List!36356 0))(
  ( (Nil!36353) (Cons!36352 (h!37816 tuple2!25016) (t!51075 List!36356)) )
))
(declare-fun l!1292 () List!36356)

(get-info :version)

(assert (=> b!1560396 (= res!1066431 (and (not (= otherKey!62 newKey!135)) (or (not ((_ is Cons!36352) l!1292)) (= (_1!12519 (h!37816 l!1292)) otherKey!62))))))

(declare-fun newValue!135 () B!2414)

(declare-fun b!1560397 () Bool)

(declare-fun isStrictlySorted!954 (List!36356) Bool)

(declare-fun insertStrictlySorted!568 (List!36356 (_ BitVec 64) B!2414) List!36356)

(assert (=> b!1560397 (= e!869365 (not (isStrictlySorted!954 (insertStrictlySorted!568 l!1292 newKey!135 newValue!135))))))

(declare-fun res!1066429 () Bool)

(assert (=> start!133566 (=> (not res!1066429) (not e!869365))))

(assert (=> start!133566 (= res!1066429 (isStrictlySorted!954 l!1292))))

(assert (=> start!133566 e!869365))

(assert (=> start!133566 e!869366))

(assert (=> start!133566 true))

(assert (=> start!133566 tp_is_empty!38419))

(declare-fun b!1560395 () Bool)

(declare-fun res!1066430 () Bool)

(assert (=> b!1560395 (=> (not res!1066430) (not e!869365))))

(declare-fun containsKey!830 (List!36356 (_ BitVec 64)) Bool)

(assert (=> b!1560395 (= res!1066430 (containsKey!830 l!1292 otherKey!62))))

(assert (= (and start!133566 res!1066429) b!1560395))

(assert (= (and b!1560395 res!1066430) b!1560396))

(assert (= (and b!1560396 res!1066431) b!1560397))

(assert (= (and start!133566 ((_ is Cons!36352) l!1292)) b!1560398))

(declare-fun m!1437155 () Bool)

(assert (=> b!1560397 m!1437155))

(assert (=> b!1560397 m!1437155))

(declare-fun m!1437157 () Bool)

(assert (=> b!1560397 m!1437157))

(declare-fun m!1437159 () Bool)

(assert (=> start!133566 m!1437159))

(declare-fun m!1437161 () Bool)

(assert (=> b!1560395 m!1437161))

(check-sat (not b!1560397) tp_is_empty!38419 (not start!133566) (not b!1560398) (not b!1560395))
(check-sat)
(get-model)

(declare-fun d!163269 () Bool)

(declare-fun res!1066454 () Bool)

(declare-fun e!869383 () Bool)

(assert (=> d!163269 (=> res!1066454 e!869383)))

(assert (=> d!163269 (= res!1066454 (or ((_ is Nil!36353) l!1292) ((_ is Nil!36353) (t!51075 l!1292))))))

(assert (=> d!163269 (= (isStrictlySorted!954 l!1292) e!869383)))

(declare-fun b!1560427 () Bool)

(declare-fun e!869384 () Bool)

(assert (=> b!1560427 (= e!869383 e!869384)))

(declare-fun res!1066455 () Bool)

(assert (=> b!1560427 (=> (not res!1066455) (not e!869384))))

(assert (=> b!1560427 (= res!1066455 (bvslt (_1!12519 (h!37816 l!1292)) (_1!12519 (h!37816 (t!51075 l!1292)))))))

(declare-fun b!1560428 () Bool)

(assert (=> b!1560428 (= e!869384 (isStrictlySorted!954 (t!51075 l!1292)))))

(assert (= (and d!163269 (not res!1066454)) b!1560427))

(assert (= (and b!1560427 res!1066455) b!1560428))

(declare-fun m!1437179 () Bool)

(assert (=> b!1560428 m!1437179))

(assert (=> start!133566 d!163269))

(declare-fun d!163273 () Bool)

(declare-fun res!1066456 () Bool)

(declare-fun e!869385 () Bool)

(assert (=> d!163273 (=> res!1066456 e!869385)))

(assert (=> d!163273 (= res!1066456 (or ((_ is Nil!36353) (insertStrictlySorted!568 l!1292 newKey!135 newValue!135)) ((_ is Nil!36353) (t!51075 (insertStrictlySorted!568 l!1292 newKey!135 newValue!135)))))))

(assert (=> d!163273 (= (isStrictlySorted!954 (insertStrictlySorted!568 l!1292 newKey!135 newValue!135)) e!869385)))

(declare-fun b!1560429 () Bool)

(declare-fun e!869386 () Bool)

(assert (=> b!1560429 (= e!869385 e!869386)))

(declare-fun res!1066457 () Bool)

(assert (=> b!1560429 (=> (not res!1066457) (not e!869386))))

(assert (=> b!1560429 (= res!1066457 (bvslt (_1!12519 (h!37816 (insertStrictlySorted!568 l!1292 newKey!135 newValue!135))) (_1!12519 (h!37816 (t!51075 (insertStrictlySorted!568 l!1292 newKey!135 newValue!135))))))))

(declare-fun b!1560430 () Bool)

(assert (=> b!1560430 (= e!869386 (isStrictlySorted!954 (t!51075 (insertStrictlySorted!568 l!1292 newKey!135 newValue!135))))))

(assert (= (and d!163273 (not res!1066456)) b!1560429))

(assert (= (and b!1560429 res!1066457) b!1560430))

(declare-fun m!1437181 () Bool)

(assert (=> b!1560430 m!1437181))

(assert (=> b!1560397 d!163273))

(declare-fun b!1560471 () Bool)

(declare-fun e!869421 () List!36356)

(declare-fun e!869420 () List!36356)

(assert (=> b!1560471 (= e!869421 e!869420)))

(declare-fun c!144856 () Bool)

(assert (=> b!1560471 (= c!144856 (and ((_ is Cons!36352) l!1292) (= (_1!12519 (h!37816 l!1292)) newKey!135)))))

(declare-fun call!71882 () List!36356)

(declare-fun e!869419 () List!36356)

(declare-fun bm!71878 () Bool)

(declare-fun c!144857 () Bool)

(declare-fun $colon$colon!977 (List!36356 tuple2!25016) List!36356)

(assert (=> bm!71878 (= call!71882 ($colon$colon!977 e!869419 (ite c!144857 (h!37816 l!1292) (tuple2!25017 newKey!135 newValue!135))))))

(declare-fun c!144858 () Bool)

(assert (=> bm!71878 (= c!144858 c!144857)))

(declare-fun b!1560472 () Bool)

(assert (=> b!1560472 (= e!869419 (insertStrictlySorted!568 (t!51075 l!1292) newKey!135 newValue!135))))

(declare-fun b!1560473 () Bool)

(declare-fun e!869417 () List!36356)

(declare-fun call!71881 () List!36356)

(assert (=> b!1560473 (= e!869417 call!71881)))

(declare-fun b!1560474 () Bool)

(declare-fun c!144859 () Bool)

(assert (=> b!1560474 (= e!869419 (ite c!144856 (t!51075 l!1292) (ite c!144859 (Cons!36352 (h!37816 l!1292) (t!51075 l!1292)) Nil!36353)))))

(declare-fun e!869418 () Bool)

(declare-fun b!1560475 () Bool)

(declare-fun lt!671665 () List!36356)

(declare-fun contains!10253 (List!36356 tuple2!25016) Bool)

(assert (=> b!1560475 (= e!869418 (contains!10253 lt!671665 (tuple2!25017 newKey!135 newValue!135)))))

(declare-fun d!163275 () Bool)

(assert (=> d!163275 e!869418))

(declare-fun res!1066482 () Bool)

(assert (=> d!163275 (=> (not res!1066482) (not e!869418))))

(assert (=> d!163275 (= res!1066482 (isStrictlySorted!954 lt!671665))))

(assert (=> d!163275 (= lt!671665 e!869421)))

(assert (=> d!163275 (= c!144857 (and ((_ is Cons!36352) l!1292) (bvslt (_1!12519 (h!37816 l!1292)) newKey!135)))))

(assert (=> d!163275 (isStrictlySorted!954 l!1292)))

(assert (=> d!163275 (= (insertStrictlySorted!568 l!1292 newKey!135 newValue!135) lt!671665)))

(declare-fun b!1560476 () Bool)

(assert (=> b!1560476 (= c!144859 (and ((_ is Cons!36352) l!1292) (bvsgt (_1!12519 (h!37816 l!1292)) newKey!135)))))

(assert (=> b!1560476 (= e!869420 e!869417)))

(declare-fun bm!71879 () Bool)

(declare-fun call!71883 () List!36356)

(assert (=> bm!71879 (= call!71883 call!71882)))

(declare-fun b!1560477 () Bool)

(assert (=> b!1560477 (= e!869417 call!71881)))

(declare-fun b!1560478 () Bool)

(assert (=> b!1560478 (= e!869421 call!71882)))

(declare-fun b!1560479 () Bool)

(declare-fun res!1066483 () Bool)

(assert (=> b!1560479 (=> (not res!1066483) (not e!869418))))

(assert (=> b!1560479 (= res!1066483 (containsKey!830 lt!671665 newKey!135))))

(declare-fun bm!71880 () Bool)

(assert (=> bm!71880 (= call!71881 call!71883)))

(declare-fun b!1560480 () Bool)

(assert (=> b!1560480 (= e!869420 call!71883)))

(assert (= (and d!163275 c!144857) b!1560478))

(assert (= (and d!163275 (not c!144857)) b!1560471))

(assert (= (and b!1560471 c!144856) b!1560480))

(assert (= (and b!1560471 (not c!144856)) b!1560476))

(assert (= (and b!1560476 c!144859) b!1560477))

(assert (= (and b!1560476 (not c!144859)) b!1560473))

(assert (= (or b!1560477 b!1560473) bm!71880))

(assert (= (or b!1560480 bm!71880) bm!71879))

(assert (= (or b!1560478 bm!71879) bm!71878))

(assert (= (and bm!71878 c!144858) b!1560472))

(assert (= (and bm!71878 (not c!144858)) b!1560474))

(assert (= (and d!163275 res!1066482) b!1560479))

(assert (= (and b!1560479 res!1066483) b!1560475))

(declare-fun m!1437191 () Bool)

(assert (=> d!163275 m!1437191))

(assert (=> d!163275 m!1437159))

(declare-fun m!1437193 () Bool)

(assert (=> b!1560479 m!1437193))

(declare-fun m!1437195 () Bool)

(assert (=> bm!71878 m!1437195))

(declare-fun m!1437197 () Bool)

(assert (=> b!1560472 m!1437197))

(declare-fun m!1437199 () Bool)

(assert (=> b!1560475 m!1437199))

(assert (=> b!1560397 d!163275))

(declare-fun d!163287 () Bool)

(declare-fun res!1066488 () Bool)

(declare-fun e!869432 () Bool)

(assert (=> d!163287 (=> res!1066488 e!869432)))

(assert (=> d!163287 (= res!1066488 (and ((_ is Cons!36352) l!1292) (= (_1!12519 (h!37816 l!1292)) otherKey!62)))))

(assert (=> d!163287 (= (containsKey!830 l!1292 otherKey!62) e!869432)))

(declare-fun b!1560497 () Bool)

(declare-fun e!869433 () Bool)

(assert (=> b!1560497 (= e!869432 e!869433)))

(declare-fun res!1066489 () Bool)

(assert (=> b!1560497 (=> (not res!1066489) (not e!869433))))

(assert (=> b!1560497 (= res!1066489 (and (or (not ((_ is Cons!36352) l!1292)) (bvsle (_1!12519 (h!37816 l!1292)) otherKey!62)) ((_ is Cons!36352) l!1292) (bvslt (_1!12519 (h!37816 l!1292)) otherKey!62)))))

(declare-fun b!1560498 () Bool)

(assert (=> b!1560498 (= e!869433 (containsKey!830 (t!51075 l!1292) otherKey!62))))

(assert (= (and d!163287 (not res!1066488)) b!1560497))

(assert (= (and b!1560497 res!1066489) b!1560498))

(declare-fun m!1437201 () Bool)

(assert (=> b!1560498 m!1437201))

(assert (=> b!1560395 d!163287))

(declare-fun b!1560503 () Bool)

(declare-fun e!869436 () Bool)

(declare-fun tp!112593 () Bool)

(assert (=> b!1560503 (= e!869436 (and tp_is_empty!38419 tp!112593))))

(assert (=> b!1560398 (= tp!112584 e!869436)))

(assert (= (and b!1560398 ((_ is Cons!36352) (t!51075 l!1292))) b!1560503))

(check-sat (not b!1560498) (not b!1560472) (not b!1560430) (not b!1560479) (not bm!71878) (not b!1560475) (not d!163275) (not b!1560503) tp_is_empty!38419 (not b!1560428))
(check-sat)
