; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103618 () Bool)

(assert start!103618)

(declare-fun b!1241203 () Bool)

(declare-fun res!828057 () Bool)

(declare-fun e!703521 () Bool)

(assert (=> b!1241203 (=> (not res!828057) (not e!703521))))

(declare-datatypes ((B!1836 0))(
  ( (B!1837 (val!15680 Int)) )
))
(declare-datatypes ((tuple2!20232 0))(
  ( (tuple2!20233 (_1!10127 (_ BitVec 64)) (_2!10127 B!1836)) )
))
(declare-datatypes ((List!27345 0))(
  ( (Nil!27342) (Cons!27341 (h!28550 tuple2!20232) (t!40808 List!27345)) )
))
(declare-fun l!644 () List!27345)

(declare-fun isStrictlySorted!747 (List!27345) Bool)

(assert (=> b!1241203 (= res!828057 (isStrictlySorted!747 (t!40808 l!644)))))

(declare-fun b!1241204 () Bool)

(declare-fun e!703520 () Bool)

(declare-fun tp_is_empty!31235 () Bool)

(declare-fun tp!92615 () Bool)

(assert (=> b!1241204 (= e!703520 (and tp_is_empty!31235 tp!92615))))

(declare-fun b!1241205 () Bool)

(declare-fun res!828056 () Bool)

(assert (=> b!1241205 (=> (not res!828056) (not e!703521))))

(assert (=> b!1241205 (= res!828056 (isStrictlySorted!747 l!644))))

(declare-fun b!1241206 () Bool)

(declare-fun res!828058 () Bool)

(assert (=> b!1241206 (=> (not res!828058) (not e!703521))))

(assert (=> b!1241206 (= res!828058 (is-Cons!27341 l!644))))

(declare-fun v1!20 () B!1836)

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun b!1241207 () Bool)

(declare-fun insertStrictlySorted!433 (List!27345 (_ BitVec 64) B!1836) List!27345)

(assert (=> b!1241207 (= e!703521 (not (isStrictlySorted!747 (insertStrictlySorted!433 l!644 key1!25 v1!20))))))

(declare-fun key2!15 () (_ BitVec 64))

(declare-fun removeStrictlySorted!126 (List!27345 (_ BitVec 64)) List!27345)

(assert (=> b!1241207 (= (insertStrictlySorted!433 (removeStrictlySorted!126 (t!40808 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!126 (insertStrictlySorted!433 (t!40808 l!644) key1!25 v1!20) key2!15))))

(declare-datatypes ((Unit!41259 0))(
  ( (Unit!41260) )
))
(declare-fun lt!562106 () Unit!41259)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!15 (List!27345 (_ BitVec 64) B!1836 (_ BitVec 64)) Unit!41259)

(assert (=> b!1241207 (= lt!562106 (lemmaInsertAndRemoveStrictlySortedCommutative!15 (t!40808 l!644) key1!25 v1!20 key2!15))))

(declare-fun res!828055 () Bool)

(assert (=> start!103618 (=> (not res!828055) (not e!703521))))

(assert (=> start!103618 (= res!828055 (not (= key1!25 key2!15)))))

(assert (=> start!103618 e!703521))

(assert (=> start!103618 true))

(assert (=> start!103618 e!703520))

(assert (=> start!103618 tp_is_empty!31235))

(assert (= (and start!103618 res!828055) b!1241205))

(assert (= (and b!1241205 res!828056) b!1241206))

(assert (= (and b!1241206 res!828058) b!1241203))

(assert (= (and b!1241203 res!828057) b!1241207))

(assert (= (and start!103618 (is-Cons!27341 l!644)) b!1241204))

(declare-fun m!1144381 () Bool)

(assert (=> b!1241203 m!1144381))

(declare-fun m!1144383 () Bool)

(assert (=> b!1241205 m!1144383))

(declare-fun m!1144385 () Bool)

(assert (=> b!1241207 m!1144385))

(declare-fun m!1144387 () Bool)

(assert (=> b!1241207 m!1144387))

(assert (=> b!1241207 m!1144385))

(declare-fun m!1144389 () Bool)

(assert (=> b!1241207 m!1144389))

(declare-fun m!1144391 () Bool)

(assert (=> b!1241207 m!1144391))

(assert (=> b!1241207 m!1144389))

(declare-fun m!1144393 () Bool)

(assert (=> b!1241207 m!1144393))

(declare-fun m!1144395 () Bool)

(assert (=> b!1241207 m!1144395))

(assert (=> b!1241207 m!1144393))

(declare-fun m!1144397 () Bool)

(assert (=> b!1241207 m!1144397))

(push 1)

(assert (not b!1241207))

(assert (not b!1241204))

(assert tp_is_empty!31235)

(assert (not b!1241205))

(assert (not b!1241203))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136433 () Bool)

(declare-fun res!828067 () Bool)

(declare-fun e!703530 () Bool)

(assert (=> d!136433 (=> res!828067 e!703530)))

(assert (=> d!136433 (= res!828067 (or (is-Nil!27342 (t!40808 l!644)) (is-Nil!27342 (t!40808 (t!40808 l!644)))))))

(assert (=> d!136433 (= (isStrictlySorted!747 (t!40808 l!644)) e!703530)))

(declare-fun b!1241216 () Bool)

(declare-fun e!703531 () Bool)

(assert (=> b!1241216 (= e!703530 e!703531)))

(declare-fun res!828068 () Bool)

(assert (=> b!1241216 (=> (not res!828068) (not e!703531))))

(assert (=> b!1241216 (= res!828068 (bvslt (_1!10127 (h!28550 (t!40808 l!644))) (_1!10127 (h!28550 (t!40808 (t!40808 l!644))))))))

(declare-fun b!1241217 () Bool)

(assert (=> b!1241217 (= e!703531 (isStrictlySorted!747 (t!40808 (t!40808 l!644))))))

(assert (= (and d!136433 (not res!828067)) b!1241216))

(assert (= (and b!1241216 res!828068) b!1241217))

(declare-fun m!1144399 () Bool)

(assert (=> b!1241217 m!1144399))

(assert (=> b!1241203 d!136433))

(declare-fun d!136439 () Bool)

(declare-fun e!703558 () Bool)

(assert (=> d!136439 e!703558))

(declare-fun res!828083 () Bool)

(assert (=> d!136439 (=> (not res!828083) (not e!703558))))

(declare-fun lt!562113 () List!27345)

(assert (=> d!136439 (= res!828083 (isStrictlySorted!747 lt!562113))))

(declare-fun e!703560 () List!27345)

(assert (=> d!136439 (= lt!562113 e!703560)))

(declare-fun c!121379 () Bool)

(assert (=> d!136439 (= c!121379 (and (is-Cons!27341 (insertStrictlySorted!433 (t!40808 l!644) key1!25 v1!20)) (= (_1!10127 (h!28550 (insertStrictlySorted!433 (t!40808 l!644) key1!25 v1!20))) key2!15)))))

(assert (=> d!136439 (isStrictlySorted!747 (insertStrictlySorted!433 (t!40808 l!644) key1!25 v1!20))))

(assert (=> d!136439 (= (removeStrictlySorted!126 (insertStrictlySorted!433 (t!40808 l!644) key1!25 v1!20) key2!15) lt!562113)))

(declare-fun e!703559 () List!27345)

(declare-fun b!1241256 () Bool)

(declare-fun $colon$colon!619 (List!27345 tuple2!20232) List!27345)

(assert (=> b!1241256 (= e!703559 ($colon$colon!619 (removeStrictlySorted!126 (t!40808 (insertStrictlySorted!433 (t!40808 l!644) key1!25 v1!20)) key2!15) (h!28550 (insertStrictlySorted!433 (t!40808 l!644) key1!25 v1!20))))))

(declare-fun b!1241257 () Bool)

(assert (=> b!1241257 (= e!703560 e!703559)))

(declare-fun c!121380 () Bool)

(assert (=> b!1241257 (= c!121380 (and (is-Cons!27341 (insertStrictlySorted!433 (t!40808 l!644) key1!25 v1!20)) (not (= (_1!10127 (h!28550 (insertStrictlySorted!433 (t!40808 l!644) key1!25 v1!20))) key2!15))))))

(declare-fun b!1241258 () Bool)

(assert (=> b!1241258 (= e!703560 (t!40808 (insertStrictlySorted!433 (t!40808 l!644) key1!25 v1!20)))))

(declare-fun b!1241259 () Bool)

(declare-fun containsKey!605 (List!27345 (_ BitVec 64)) Bool)

(assert (=> b!1241259 (= e!703558 (not (containsKey!605 lt!562113 key2!15)))))

(declare-fun b!1241260 () Bool)

(assert (=> b!1241260 (= e!703559 Nil!27342)))

(assert (= (and d!136439 c!121379) b!1241258))

(assert (= (and d!136439 (not c!121379)) b!1241257))

(assert (= (and b!1241257 c!121380) b!1241256))

(assert (= (and b!1241257 (not c!121380)) b!1241260))

(assert (= (and d!136439 res!828083) b!1241259))

(declare-fun m!1144405 () Bool)

(assert (=> d!136439 m!1144405))

(assert (=> d!136439 m!1144389))

(declare-fun m!1144407 () Bool)

(assert (=> d!136439 m!1144407))

(declare-fun m!1144409 () Bool)

(assert (=> b!1241256 m!1144409))

(assert (=> b!1241256 m!1144409))

(declare-fun m!1144411 () Bool)

(assert (=> b!1241256 m!1144411))

(declare-fun m!1144413 () Bool)

(assert (=> b!1241259 m!1144413))

(assert (=> b!1241207 d!136439))

(declare-fun b!1241331 () Bool)

(declare-fun e!703598 () List!27345)

(declare-fun call!61222 () List!27345)

(assert (=> b!1241331 (= e!703598 call!61222)))

(declare-fun bm!61217 () Bool)

(declare-fun call!61221 () List!27345)

(assert (=> bm!61217 (= call!61222 call!61221)))

(declare-fun d!136445 () Bool)

(declare-fun e!703600 () Bool)

(assert (=> d!136445 e!703600))

(declare-fun res!828098 () Bool)

(assert (=> d!136445 (=> (not res!828098) (not e!703600))))

(declare-fun lt!562122 () List!27345)

(assert (=> d!136445 (= res!828098 (isStrictlySorted!747 lt!562122))))

(declare-fun e!703597 () List!27345)

(assert (=> d!136445 (= lt!562122 e!703597)))

(declare-fun c!121411 () Bool)

(assert (=> d!136445 (= c!121411 (and (is-Cons!27341 (removeStrictlySorted!126 (t!40808 l!644) key2!15)) (bvslt (_1!10127 (h!28550 (removeStrictlySorted!126 (t!40808 l!644) key2!15))) key1!25)))))

(assert (=> d!136445 (isStrictlySorted!747 (removeStrictlySorted!126 (t!40808 l!644) key2!15))))

(assert (=> d!136445 (= (insertStrictlySorted!433 (removeStrictlySorted!126 (t!40808 l!644) key2!15) key1!25 v1!20) lt!562122)))

(declare-fun b!1241332 () Bool)

(declare-fun e!703599 () List!27345)

(assert (=> b!1241332 (= e!703599 (insertStrictlySorted!433 (t!40808 (removeStrictlySorted!126 (t!40808 l!644) key2!15)) key1!25 v1!20))))

(declare-fun b!1241333 () Bool)

(declare-fun res!828099 () Bool)

(assert (=> b!1241333 (=> (not res!828099) (not e!703600))))

(assert (=> b!1241333 (= res!828099 (containsKey!605 lt!562122 key1!25))))

(declare-fun bm!61218 () Bool)

(declare-fun call!61220 () List!27345)

(assert (=> bm!61218 (= call!61221 call!61220)))

(declare-fun b!1241334 () Bool)

(assert (=> b!1241334 (= e!703597 call!61220)))

(declare-fun b!1241335 () Bool)

(declare-fun e!703601 () List!27345)

(assert (=> b!1241335 (= e!703601 call!61221)))

(declare-fun bm!61219 () Bool)

(assert (=> bm!61219 (= call!61220 ($colon$colon!619 e!703599 (ite c!121411 (h!28550 (removeStrictlySorted!126 (t!40808 l!644) key2!15)) (tuple2!20233 key1!25 v1!20))))))

(declare-fun c!121412 () Bool)

(assert (=> bm!61219 (= c!121412 c!121411)))

(declare-fun b!1241336 () Bool)

(assert (=> b!1241336 (= e!703597 e!703601)))

(declare-fun c!121410 () Bool)

(assert (=> b!1241336 (= c!121410 (and (is-Cons!27341 (removeStrictlySorted!126 (t!40808 l!644) key2!15)) (= (_1!10127 (h!28550 (removeStrictlySorted!126 (t!40808 l!644) key2!15))) key1!25)))))

(declare-fun b!1241337 () Bool)

(assert (=> b!1241337 (= e!703598 call!61222)))

(declare-fun c!121409 () Bool)

(declare-fun b!1241338 () Bool)

(assert (=> b!1241338 (= c!121409 (and (is-Cons!27341 (removeStrictlySorted!126 (t!40808 l!644) key2!15)) (bvsgt (_1!10127 (h!28550 (removeStrictlySorted!126 (t!40808 l!644) key2!15))) key1!25)))))

(assert (=> b!1241338 (= e!703601 e!703598)))

(declare-fun b!1241339 () Bool)

(declare-fun contains!7389 (List!27345 tuple2!20232) Bool)

(assert (=> b!1241339 (= e!703600 (contains!7389 lt!562122 (tuple2!20233 key1!25 v1!20)))))

(declare-fun b!1241340 () Bool)

(assert (=> b!1241340 (= e!703599 (ite c!121410 (t!40808 (removeStrictlySorted!126 (t!40808 l!644) key2!15)) (ite c!121409 (Cons!27341 (h!28550 (removeStrictlySorted!126 (t!40808 l!644) key2!15)) (t!40808 (removeStrictlySorted!126 (t!40808 l!644) key2!15))) Nil!27342)))))

(assert (= (and d!136445 c!121411) b!1241334))

(assert (= (and d!136445 (not c!121411)) b!1241336))

(assert (= (and b!1241336 c!121410) b!1241335))

(assert (= (and b!1241336 (not c!121410)) b!1241338))

(assert (= (and b!1241338 c!121409) b!1241337))

(assert (= (and b!1241338 (not c!121409)) b!1241331))

(assert (= (or b!1241337 b!1241331) bm!61217))

(assert (= (or b!1241335 bm!61217) bm!61218))

(assert (= (or b!1241334 bm!61218) bm!61219))

(assert (= (and bm!61219 c!121412) b!1241332))

(assert (= (and bm!61219 (not c!121412)) b!1241340))

(assert (= (and d!136445 res!828098) b!1241333))

(assert (= (and b!1241333 res!828099) b!1241339))

(declare-fun m!1144435 () Bool)

(assert (=> b!1241339 m!1144435))

(declare-fun m!1144437 () Bool)

(assert (=> bm!61219 m!1144437))

(declare-fun m!1144439 () Bool)

(assert (=> b!1241332 m!1144439))

(declare-fun m!1144441 () Bool)

(assert (=> d!136445 m!1144441))

(assert (=> d!136445 m!1144393))

(declare-fun m!1144443 () Bool)

(assert (=> d!136445 m!1144443))

(declare-fun m!1144445 () Bool)

(assert (=> b!1241333 m!1144445))

(assert (=> b!1241207 d!136445))

(declare-fun d!136451 () Bool)

(declare-fun res!828102 () Bool)

(declare-fun e!703607 () Bool)

(assert (=> d!136451 (=> res!828102 e!703607)))

(assert (=> d!136451 (= res!828102 (or (is-Nil!27342 (insertStrictlySorted!433 l!644 key1!25 v1!20)) (is-Nil!27342 (t!40808 (insertStrictlySorted!433 l!644 key1!25 v1!20)))))))

(assert (=> d!136451 (= (isStrictlySorted!747 (insertStrictlySorted!433 l!644 key1!25 v1!20)) e!703607)))

(declare-fun b!1241351 () Bool)

(declare-fun e!703608 () Bool)

(assert (=> b!1241351 (= e!703607 e!703608)))

(declare-fun res!828103 () Bool)

(assert (=> b!1241351 (=> (not res!828103) (not e!703608))))

(assert (=> b!1241351 (= res!828103 (bvslt (_1!10127 (h!28550 (insertStrictlySorted!433 l!644 key1!25 v1!20))) (_1!10127 (h!28550 (t!40808 (insertStrictlySorted!433 l!644 key1!25 v1!20))))))))

(declare-fun b!1241352 () Bool)

(assert (=> b!1241352 (= e!703608 (isStrictlySorted!747 (t!40808 (insertStrictlySorted!433 l!644 key1!25 v1!20))))))

(assert (= (and d!136451 (not res!828102)) b!1241351))

(assert (= (and b!1241351 res!828103) b!1241352))

(declare-fun m!1144447 () Bool)

(assert (=> b!1241352 m!1144447))

(assert (=> b!1241207 d!136451))

(declare-fun b!1241363 () Bool)

(declare-fun e!703615 () List!27345)

(declare-fun call!61231 () List!27345)

(assert (=> b!1241363 (= e!703615 call!61231)))

(declare-fun bm!61226 () Bool)

(declare-fun call!61230 () List!27345)

(assert (=> bm!61226 (= call!61231 call!61230)))

(declare-fun d!136453 () Bool)

(declare-fun e!703617 () Bool)

(assert (=> d!136453 e!703617))

(declare-fun res!828106 () Bool)

(assert (=> d!136453 (=> (not res!828106) (not e!703617))))

(declare-fun lt!562125 () List!27345)

(assert (=> d!136453 (= res!828106 (isStrictlySorted!747 lt!562125))))

(declare-fun e!703614 () List!27345)

(assert (=> d!136453 (= lt!562125 e!703614)))

(declare-fun c!121423 () Bool)

(assert (=> d!136453 (= c!121423 (and (is-Cons!27341 l!644) (bvslt (_1!10127 (h!28550 l!644)) key1!25)))))

(assert (=> d!136453 (isStrictlySorted!747 l!644)))

(assert (=> d!136453 (= (insertStrictlySorted!433 l!644 key1!25 v1!20) lt!562125)))

(declare-fun e!703616 () List!27345)

(declare-fun b!1241364 () Bool)

(assert (=> b!1241364 (= e!703616 (insertStrictlySorted!433 (t!40808 l!644) key1!25 v1!20))))

(declare-fun b!1241365 () Bool)

(declare-fun res!828107 () Bool)

(assert (=> b!1241365 (=> (not res!828107) (not e!703617))))

(assert (=> b!1241365 (= res!828107 (containsKey!605 lt!562125 key1!25))))

(declare-fun bm!61227 () Bool)

(declare-fun call!61229 () List!27345)

(assert (=> bm!61227 (= call!61230 call!61229)))

(declare-fun b!1241366 () Bool)

(assert (=> b!1241366 (= e!703614 call!61229)))

(declare-fun b!1241367 () Bool)

(declare-fun e!703618 () List!27345)

(assert (=> b!1241367 (= e!703618 call!61230)))

(declare-fun bm!61228 () Bool)

(assert (=> bm!61228 (= call!61229 ($colon$colon!619 e!703616 (ite c!121423 (h!28550 l!644) (tuple2!20233 key1!25 v1!20))))))

(declare-fun c!121424 () Bool)

(assert (=> bm!61228 (= c!121424 c!121423)))

(declare-fun b!1241368 () Bool)

(assert (=> b!1241368 (= e!703614 e!703618)))

(declare-fun c!121422 () Bool)

(assert (=> b!1241368 (= c!121422 (and (is-Cons!27341 l!644) (= (_1!10127 (h!28550 l!644)) key1!25)))))

(declare-fun b!1241369 () Bool)

(assert (=> b!1241369 (= e!703615 call!61231)))

(declare-fun b!1241370 () Bool)

(declare-fun c!121421 () Bool)

(assert (=> b!1241370 (= c!121421 (and (is-Cons!27341 l!644) (bvsgt (_1!10127 (h!28550 l!644)) key1!25)))))

(assert (=> b!1241370 (= e!703618 e!703615)))

(declare-fun b!1241371 () Bool)

(assert (=> b!1241371 (= e!703617 (contains!7389 lt!562125 (tuple2!20233 key1!25 v1!20)))))

(declare-fun b!1241372 () Bool)

(assert (=> b!1241372 (= e!703616 (ite c!121422 (t!40808 l!644) (ite c!121421 (Cons!27341 (h!28550 l!644) (t!40808 l!644)) Nil!27342)))))

(assert (= (and d!136453 c!121423) b!1241366))

(assert (= (and d!136453 (not c!121423)) b!1241368))

(assert (= (and b!1241368 c!121422) b!1241367))

(assert (= (and b!1241368 (not c!121422)) b!1241370))

(assert (= (and b!1241370 c!121421) b!1241369))

(assert (= (and b!1241370 (not c!121421)) b!1241363))

(assert (= (or b!1241369 b!1241363) bm!61226))

(assert (= (or b!1241367 bm!61226) bm!61227))

(assert (= (or b!1241366 bm!61227) bm!61228))

(assert (= (and bm!61228 c!121424) b!1241364))

(assert (= (and bm!61228 (not c!121424)) b!1241372))

(assert (= (and d!136453 res!828106) b!1241365))

(assert (= (and b!1241365 res!828107) b!1241371))

(declare-fun m!1144467 () Bool)

(assert (=> b!1241371 m!1144467))

(declare-fun m!1144470 () Bool)

(assert (=> bm!61228 m!1144470))

(assert (=> b!1241364 m!1144389))

(declare-fun m!1144475 () Bool)

(assert (=> d!136453 m!1144475))

(assert (=> d!136453 m!1144383))

(declare-fun m!1144479 () Bool)

(assert (=> b!1241365 m!1144479))

(assert (=> b!1241207 d!136453))

(declare-fun d!136459 () Bool)

(assert (=> d!136459 (= (insertStrictlySorted!433 (removeStrictlySorted!126 (t!40808 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!126 (insertStrictlySorted!433 (t!40808 l!644) key1!25 v1!20) key2!15))))

(declare-fun lt!562132 () Unit!41259)

(declare-fun choose!1839 (List!27345 (_ BitVec 64) B!1836 (_ BitVec 64)) Unit!41259)

(assert (=> d!136459 (= lt!562132 (choose!1839 (t!40808 l!644) key1!25 v1!20 key2!15))))

(assert (=> d!136459 (not (= key1!25 key2!15))))

(assert (=> d!136459 (= (lemmaInsertAndRemoveStrictlySortedCommutative!15 (t!40808 l!644) key1!25 v1!20 key2!15) lt!562132)))

(declare-fun bs!34946 () Bool)

(assert (= bs!34946 d!136459))

(declare-fun m!1144501 () Bool)

(assert (=> bs!34946 m!1144501))

(assert (=> bs!34946 m!1144389))

(assert (=> bs!34946 m!1144389))

(assert (=> bs!34946 m!1144391))

(assert (=> bs!34946 m!1144393))

(assert (=> bs!34946 m!1144395))

(assert (=> bs!34946 m!1144393))

(assert (=> b!1241207 d!136459))

(declare-fun b!1241397 () Bool)

(declare-fun e!703634 () List!27345)

(declare-fun call!61240 () List!27345)

(assert (=> b!1241397 (= e!703634 call!61240)))

(declare-fun bm!61235 () Bool)

(declare-fun call!61239 () List!27345)

(assert (=> bm!61235 (= call!61240 call!61239)))

(declare-fun d!136469 () Bool)

(declare-fun e!703636 () Bool)

(assert (=> d!136469 e!703636))

(declare-fun res!828116 () Bool)

(assert (=> d!136469 (=> (not res!828116) (not e!703636))))

(declare-fun lt!562136 () List!27345)

(assert (=> d!136469 (= res!828116 (isStrictlySorted!747 lt!562136))))

(declare-fun e!703633 () List!27345)

(assert (=> d!136469 (= lt!562136 e!703633)))

(declare-fun c!121435 () Bool)

(assert (=> d!136469 (= c!121435 (and (is-Cons!27341 (t!40808 l!644)) (bvslt (_1!10127 (h!28550 (t!40808 l!644))) key1!25)))))

(assert (=> d!136469 (isStrictlySorted!747 (t!40808 l!644))))

(assert (=> d!136469 (= (insertStrictlySorted!433 (t!40808 l!644) key1!25 v1!20) lt!562136)))

(declare-fun b!1241398 () Bool)

(declare-fun e!703635 () List!27345)

(assert (=> b!1241398 (= e!703635 (insertStrictlySorted!433 (t!40808 (t!40808 l!644)) key1!25 v1!20))))

(declare-fun b!1241399 () Bool)

(declare-fun res!828117 () Bool)

(assert (=> b!1241399 (=> (not res!828117) (not e!703636))))

(assert (=> b!1241399 (= res!828117 (containsKey!605 lt!562136 key1!25))))

(declare-fun bm!61236 () Bool)

(declare-fun call!61238 () List!27345)

(assert (=> bm!61236 (= call!61239 call!61238)))

(declare-fun b!1241400 () Bool)

(assert (=> b!1241400 (= e!703633 call!61238)))

(declare-fun b!1241401 () Bool)

(declare-fun e!703637 () List!27345)

(assert (=> b!1241401 (= e!703637 call!61239)))

(declare-fun bm!61237 () Bool)

(assert (=> bm!61237 (= call!61238 ($colon$colon!619 e!703635 (ite c!121435 (h!28550 (t!40808 l!644)) (tuple2!20233 key1!25 v1!20))))))

(declare-fun c!121436 () Bool)

(assert (=> bm!61237 (= c!121436 c!121435)))

(declare-fun b!1241402 () Bool)

(assert (=> b!1241402 (= e!703633 e!703637)))

(declare-fun c!121434 () Bool)

(assert (=> b!1241402 (= c!121434 (and (is-Cons!27341 (t!40808 l!644)) (= (_1!10127 (h!28550 (t!40808 l!644))) key1!25)))))

(declare-fun b!1241403 () Bool)

(assert (=> b!1241403 (= e!703634 call!61240)))

(declare-fun b!1241404 () Bool)

(declare-fun c!121433 () Bool)

(assert (=> b!1241404 (= c!121433 (and (is-Cons!27341 (t!40808 l!644)) (bvsgt (_1!10127 (h!28550 (t!40808 l!644))) key1!25)))))

(assert (=> b!1241404 (= e!703637 e!703634)))

(declare-fun b!1241405 () Bool)

(assert (=> b!1241405 (= e!703636 (contains!7389 lt!562136 (tuple2!20233 key1!25 v1!20)))))

(declare-fun b!1241406 () Bool)

(assert (=> b!1241406 (= e!703635 (ite c!121434 (t!40808 (t!40808 l!644)) (ite c!121433 (Cons!27341 (h!28550 (t!40808 l!644)) (t!40808 (t!40808 l!644))) Nil!27342)))))

(assert (= (and d!136469 c!121435) b!1241400))

(assert (= (and d!136469 (not c!121435)) b!1241402))

(assert (= (and b!1241402 c!121434) b!1241401))

(assert (= (and b!1241402 (not c!121434)) b!1241404))

(assert (= (and b!1241404 c!121433) b!1241403))

(assert (= (and b!1241404 (not c!121433)) b!1241397))

(assert (= (or b!1241403 b!1241397) bm!61235))

(assert (= (or b!1241401 bm!61235) bm!61236))

(assert (= (or b!1241400 bm!61236) bm!61237))

(assert (= (and bm!61237 c!121436) b!1241398))

(assert (= (and bm!61237 (not c!121436)) b!1241406))

(assert (= (and d!136469 res!828116) b!1241399))

(assert (= (and b!1241399 res!828117) b!1241405))

(declare-fun m!1144505 () Bool)

(assert (=> b!1241405 m!1144505))

(declare-fun m!1144507 () Bool)

(assert (=> bm!61237 m!1144507))

(declare-fun m!1144509 () Bool)

(assert (=> b!1241398 m!1144509))

(declare-fun m!1144511 () Bool)

(assert (=> d!136469 m!1144511))

(assert (=> d!136469 m!1144381))

(declare-fun m!1144513 () Bool)

(assert (=> b!1241399 m!1144513))

(assert (=> b!1241207 d!136469))

(declare-fun d!136473 () Bool)

(declare-fun e!703643 () Bool)

(assert (=> d!136473 e!703643))

(declare-fun res!828120 () Bool)

(assert (=> d!136473 (=> (not res!828120) (not e!703643))))

(declare-fun lt!562139 () List!27345)

(assert (=> d!136473 (= res!828120 (isStrictlySorted!747 lt!562139))))

(declare-fun e!703645 () List!27345)

(assert (=> d!136473 (= lt!562139 e!703645)))

(declare-fun c!121441 () Bool)

(assert (=> d!136473 (= c!121441 (and (is-Cons!27341 (t!40808 l!644)) (= (_1!10127 (h!28550 (t!40808 l!644))) key2!15)))))

(assert (=> d!136473 (isStrictlySorted!747 (t!40808 l!644))))

