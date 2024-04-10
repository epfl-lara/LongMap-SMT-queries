; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137364 () Bool)

(assert start!137364)

(declare-fun b!1581247 () Bool)

(declare-fun e!882287 () Bool)

(declare-fun e!882289 () Bool)

(assert (=> b!1581247 (= e!882287 e!882289)))

(declare-fun res!1080276 () Bool)

(assert (=> b!1581247 (=> (not res!1080276) (not e!882289))))

(declare-fun e!882288 () Bool)

(assert (=> b!1581247 (= res!1080276 e!882288)))

(declare-fun res!1080279 () Bool)

(assert (=> b!1581247 (=> res!1080279 e!882288)))

(declare-datatypes ((B!2690 0))(
  ( (B!2691 (val!19707 Int)) )
))
(declare-datatypes ((tuple2!25564 0))(
  ( (tuple2!25565 (_1!12793 (_ BitVec 64)) (_2!12793 B!2690)) )
))
(declare-datatypes ((List!36827 0))(
  ( (Nil!36824) (Cons!36823 (h!38366 tuple2!25564) (t!51741 List!36827)) )
))
(declare-datatypes ((tuple2!25566 0))(
  ( (tuple2!25567 (_1!12794 tuple2!25564) (_2!12794 List!36827)) )
))
(declare-datatypes ((Option!920 0))(
  ( (Some!919 (v!22432 tuple2!25566)) (None!918) )
))
(declare-fun lt!676905 () Option!920)

(declare-fun isEmpty!1178 (Option!920) Bool)

(assert (=> b!1581247 (= res!1080279 (isEmpty!1178 lt!676905))))

(declare-fun l!1390 () List!36827)

(declare-fun unapply!94 (List!36827) Option!920)

(assert (=> b!1581247 (= lt!676905 (unapply!94 l!1390))))

(declare-fun b!1581248 () Bool)

(declare-fun res!1080278 () Bool)

(assert (=> b!1581248 (=> (not res!1080278) (not e!882289))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!931 (List!36827 (_ BitVec 64)) Bool)

(assert (=> b!1581248 (= res!1080278 (containsKey!931 (t!51741 l!1390) key!405))))

(declare-fun b!1581249 () Bool)

(declare-fun e!882286 () Bool)

(declare-fun tp_is_empty!39235 () Bool)

(declare-fun tp!114560 () Bool)

(assert (=> b!1581249 (= e!882286 (and tp_is_empty!39235 tp!114560))))

(declare-fun b!1581250 () Bool)

(declare-fun res!1080280 () Bool)

(assert (=> b!1581250 (=> (not res!1080280) (not e!882289))))

(assert (=> b!1581250 (= res!1080280 (and (or (not (is-Cons!36823 l!1390)) (not (= (_1!12793 (h!38366 l!1390)) key!405))) (is-Cons!36823 l!1390)))))

(declare-fun b!1581251 () Bool)

(declare-fun res!1080281 () Bool)

(assert (=> b!1581251 (=> (not res!1080281) (not e!882289))))

(declare-fun lt!676904 () tuple2!25564)

(declare-fun contains!10499 (List!36827 tuple2!25564) Bool)

(assert (=> b!1581251 (= res!1080281 (contains!10499 (t!51741 l!1390) lt!676904))))

(declare-fun b!1581252 () Bool)

(declare-fun e!882290 () Bool)

(assert (=> b!1581252 (= e!882290 e!882287)))

(declare-fun res!1080277 () Bool)

(assert (=> b!1581252 (=> (not res!1080277) (not e!882287))))

(assert (=> b!1581252 (= res!1080277 (contains!10499 l!1390 lt!676904))))

(declare-fun value!194 () B!2690)

(assert (=> b!1581252 (= lt!676904 (tuple2!25565 key!405 value!194))))

(declare-fun res!1080282 () Bool)

(assert (=> start!137364 (=> (not res!1080282) (not e!882290))))

(declare-fun isStrictlySorted!1085 (List!36827) Bool)

(assert (=> start!137364 (= res!1080282 (isStrictlySorted!1085 l!1390))))

(assert (=> start!137364 e!882290))

(assert (=> start!137364 e!882286))

(assert (=> start!137364 true))

(assert (=> start!137364 tp_is_empty!39235))

(declare-fun b!1581253 () Bool)

(declare-fun res!1080274 () Bool)

(assert (=> b!1581253 (=> (not res!1080274) (not e!882289))))

(assert (=> b!1581253 (= res!1080274 (isStrictlySorted!1085 (t!51741 l!1390)))))

(declare-fun b!1581254 () Bool)

(declare-fun get!26813 (Option!920) tuple2!25566)

(assert (=> b!1581254 (= e!882288 (not (is-Nil!36824 (_2!12794 (get!26813 lt!676905)))))))

(declare-fun b!1581255 () Bool)

(declare-fun ListPrimitiveSize!196 (List!36827) Int)

(assert (=> b!1581255 (= e!882289 (>= (ListPrimitiveSize!196 (t!51741 l!1390)) (ListPrimitiveSize!196 l!1390)))))

(declare-fun b!1581256 () Bool)

(declare-fun res!1080275 () Bool)

(assert (=> b!1581256 (=> (not res!1080275) (not e!882290))))

(assert (=> b!1581256 (= res!1080275 (containsKey!931 l!1390 key!405))))

(assert (= (and start!137364 res!1080282) b!1581256))

(assert (= (and b!1581256 res!1080275) b!1581252))

(assert (= (and b!1581252 res!1080277) b!1581247))

(assert (= (and b!1581247 (not res!1080279)) b!1581254))

(assert (= (and b!1581247 res!1080276) b!1581250))

(assert (= (and b!1581250 res!1080280) b!1581253))

(assert (= (and b!1581253 res!1080274) b!1581248))

(assert (= (and b!1581248 res!1080278) b!1581251))

(assert (= (and b!1581251 res!1080281) b!1581255))

(assert (= (and start!137364 (is-Cons!36823 l!1390)) b!1581249))

(declare-fun m!1452299 () Bool)

(assert (=> b!1581253 m!1452299))

(declare-fun m!1452301 () Bool)

(assert (=> b!1581248 m!1452301))

(declare-fun m!1452303 () Bool)

(assert (=> start!137364 m!1452303))

(declare-fun m!1452305 () Bool)

(assert (=> b!1581247 m!1452305))

(declare-fun m!1452307 () Bool)

(assert (=> b!1581247 m!1452307))

(declare-fun m!1452309 () Bool)

(assert (=> b!1581252 m!1452309))

(declare-fun m!1452311 () Bool)

(assert (=> b!1581255 m!1452311))

(declare-fun m!1452313 () Bool)

(assert (=> b!1581255 m!1452313))

(declare-fun m!1452315 () Bool)

(assert (=> b!1581256 m!1452315))

(declare-fun m!1452317 () Bool)

(assert (=> b!1581254 m!1452317))

(declare-fun m!1452319 () Bool)

(assert (=> b!1581251 m!1452319))

(push 1)

(assert (not start!137364))

(assert (not b!1581251))

(assert (not b!1581248))

(assert (not b!1581249))

(assert (not b!1581256))

(assert (not b!1581253))

(assert (not b!1581252))

(assert (not b!1581247))

(assert (not b!1581255))

(assert (not b!1581254))

(assert tp_is_empty!39235)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166683 () Bool)

(assert (=> d!166683 (= (get!26813 lt!676905) (v!22432 lt!676905))))

(assert (=> b!1581254 d!166683))

(declare-fun d!166685 () Bool)

(declare-fun res!1080369 () Bool)

(declare-fun e!882353 () Bool)

(assert (=> d!166685 (=> res!1080369 e!882353)))

(assert (=> d!166685 (= res!1080369 (and (is-Cons!36823 (t!51741 l!1390)) (= (_1!12793 (h!38366 (t!51741 l!1390))) key!405)))))

(assert (=> d!166685 (= (containsKey!931 (t!51741 l!1390) key!405) e!882353)))

(declare-fun b!1581349 () Bool)

(declare-fun e!882354 () Bool)

(assert (=> b!1581349 (= e!882353 e!882354)))

(declare-fun res!1080370 () Bool)

(assert (=> b!1581349 (=> (not res!1080370) (not e!882354))))

(assert (=> b!1581349 (= res!1080370 (and (or (not (is-Cons!36823 (t!51741 l!1390))) (bvsle (_1!12793 (h!38366 (t!51741 l!1390))) key!405)) (is-Cons!36823 (t!51741 l!1390)) (bvslt (_1!12793 (h!38366 (t!51741 l!1390))) key!405)))))

(declare-fun b!1581350 () Bool)

(assert (=> b!1581350 (= e!882354 (containsKey!931 (t!51741 (t!51741 l!1390)) key!405))))

(assert (= (and d!166685 (not res!1080369)) b!1581349))

(assert (= (and b!1581349 res!1080370) b!1581350))

(declare-fun m!1452379 () Bool)

(assert (=> b!1581350 m!1452379))

(assert (=> b!1581248 d!166685))

(declare-fun d!166699 () Bool)

(declare-fun res!1080387 () Bool)

(declare-fun e!882371 () Bool)

(assert (=> d!166699 (=> res!1080387 e!882371)))

(assert (=> d!166699 (= res!1080387 (or (is-Nil!36824 l!1390) (is-Nil!36824 (t!51741 l!1390))))))

(assert (=> d!166699 (= (isStrictlySorted!1085 l!1390) e!882371)))

(declare-fun b!1581367 () Bool)

(declare-fun e!882372 () Bool)

(assert (=> b!1581367 (= e!882371 e!882372)))

(declare-fun res!1080388 () Bool)

(assert (=> b!1581367 (=> (not res!1080388) (not e!882372))))

(assert (=> b!1581367 (= res!1080388 (bvslt (_1!12793 (h!38366 l!1390)) (_1!12793 (h!38366 (t!51741 l!1390)))))))

(declare-fun b!1581368 () Bool)

(assert (=> b!1581368 (= e!882372 (isStrictlySorted!1085 (t!51741 l!1390)))))

(assert (= (and d!166699 (not res!1080387)) b!1581367))

(assert (= (and b!1581367 res!1080388) b!1581368))

(assert (=> b!1581368 m!1452299))

(assert (=> start!137364 d!166699))

(declare-fun d!166715 () Bool)

(declare-fun res!1080389 () Bool)

(declare-fun e!882373 () Bool)

(assert (=> d!166715 (=> res!1080389 e!882373)))

(assert (=> d!166715 (= res!1080389 (or (is-Nil!36824 (t!51741 l!1390)) (is-Nil!36824 (t!51741 (t!51741 l!1390)))))))

(assert (=> d!166715 (= (isStrictlySorted!1085 (t!51741 l!1390)) e!882373)))

(declare-fun b!1581369 () Bool)

(declare-fun e!882374 () Bool)

(assert (=> b!1581369 (= e!882373 e!882374)))

(declare-fun res!1080390 () Bool)

(assert (=> b!1581369 (=> (not res!1080390) (not e!882374))))

(assert (=> b!1581369 (= res!1080390 (bvslt (_1!12793 (h!38366 (t!51741 l!1390))) (_1!12793 (h!38366 (t!51741 (t!51741 l!1390))))))))

(declare-fun b!1581370 () Bool)

(assert (=> b!1581370 (= e!882374 (isStrictlySorted!1085 (t!51741 (t!51741 l!1390))))))

(assert (= (and d!166715 (not res!1080389)) b!1581369))

(assert (= (and b!1581369 res!1080390) b!1581370))

(declare-fun m!1452385 () Bool)

(assert (=> b!1581370 m!1452385))

(assert (=> b!1581253 d!166715))

(declare-fun d!166717 () Bool)

(declare-fun lt!676930 () Int)

(assert (=> d!166717 (>= lt!676930 0)))

(declare-fun e!882387 () Int)

(assert (=> d!166717 (= lt!676930 e!882387)))

(declare-fun c!146585 () Bool)

(assert (=> d!166717 (= c!146585 (is-Nil!36824 (t!51741 l!1390)))))

(assert (=> d!166717 (= (ListPrimitiveSize!196 (t!51741 l!1390)) lt!676930)))

(declare-fun b!1581391 () Bool)

(assert (=> b!1581391 (= e!882387 0)))

(declare-fun b!1581392 () Bool)

(assert (=> b!1581392 (= e!882387 (+ 1 (ListPrimitiveSize!196 (t!51741 (t!51741 l!1390)))))))

(assert (= (and d!166717 c!146585) b!1581391))

(assert (= (and d!166717 (not c!146585)) b!1581392))

(declare-fun m!1452389 () Bool)

(assert (=> b!1581392 m!1452389))

(assert (=> b!1581255 d!166717))

(declare-fun d!166721 () Bool)

(declare-fun lt!676931 () Int)

(assert (=> d!166721 (>= lt!676931 0)))

(declare-fun e!882389 () Int)

(assert (=> d!166721 (= lt!676931 e!882389)))

(declare-fun c!146586 () Bool)

(assert (=> d!166721 (= c!146586 (is-Nil!36824 l!1390))))

(assert (=> d!166721 (= (ListPrimitiveSize!196 l!1390) lt!676931)))

(declare-fun b!1581394 () Bool)

(assert (=> b!1581394 (= e!882389 0)))

(declare-fun b!1581395 () Bool)

(assert (=> b!1581395 (= e!882389 (+ 1 (ListPrimitiveSize!196 (t!51741 l!1390))))))

(assert (= (and d!166721 c!146586) b!1581394))

(assert (= (and d!166721 (not c!146586)) b!1581395))

(assert (=> b!1581395 m!1452311))

(assert (=> b!1581255 d!166721))

(declare-fun d!166723 () Bool)

(declare-fun lt!676940 () Bool)

(declare-fun content!848 (List!36827) (Set tuple2!25564))

(assert (=> d!166723 (= lt!676940 (set.member lt!676904 (content!848 (t!51741 l!1390))))))

(declare-fun e!882405 () Bool)

(assert (=> d!166723 (= lt!676940 e!882405)))

(declare-fun res!1080403 () Bool)

(assert (=> d!166723 (=> (not res!1080403) (not e!882405))))

(assert (=> d!166723 (= res!1080403 (is-Cons!36823 (t!51741 l!1390)))))

(assert (=> d!166723 (= (contains!10499 (t!51741 l!1390) lt!676904) lt!676940)))

(declare-fun b!1581417 () Bool)

(declare-fun e!882406 () Bool)

(assert (=> b!1581417 (= e!882405 e!882406)))

(declare-fun res!1080404 () Bool)

(assert (=> b!1581417 (=> res!1080404 e!882406)))

(assert (=> b!1581417 (= res!1080404 (= (h!38366 (t!51741 l!1390)) lt!676904))))

(declare-fun b!1581418 () Bool)

(assert (=> b!1581418 (= e!882406 (contains!10499 (t!51741 (t!51741 l!1390)) lt!676904))))

(assert (= (and d!166723 res!1080403) b!1581417))

(assert (= (and b!1581417 (not res!1080404)) b!1581418))

(declare-fun m!1452403 () Bool)

(assert (=> d!166723 m!1452403))

(declare-fun m!1452405 () Bool)

(assert (=> d!166723 m!1452405))

(declare-fun m!1452407 () Bool)

(assert (=> b!1581418 m!1452407))

(assert (=> b!1581251 d!166723))

(declare-fun d!166731 () Bool)

(declare-fun res!1080405 () Bool)

(declare-fun e!882407 () Bool)

(assert (=> d!166731 (=> res!1080405 e!882407)))

(assert (=> d!166731 (= res!1080405 (and (is-Cons!36823 l!1390) (= (_1!12793 (h!38366 l!1390)) key!405)))))

(assert (=> d!166731 (= (containsKey!931 l!1390 key!405) e!882407)))

(declare-fun b!1581419 () Bool)

(declare-fun e!882408 () Bool)

(assert (=> b!1581419 (= e!882407 e!882408)))

(declare-fun res!1080406 () Bool)

