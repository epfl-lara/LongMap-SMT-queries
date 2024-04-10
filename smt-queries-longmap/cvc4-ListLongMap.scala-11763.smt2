; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138056 () Bool)

(assert start!138056)

(declare-fun b!1584380 () Bool)

(declare-fun e!884449 () Bool)

(declare-datatypes ((B!2922 0))(
  ( (B!2923 (val!19823 Int)) )
))
(declare-datatypes ((tuple2!25814 0))(
  ( (tuple2!25815 (_1!12918 (_ BitVec 64)) (_2!12918 B!2922)) )
))
(declare-datatypes ((List!36943 0))(
  ( (Nil!36940) (Cons!36939 (h!38482 tuple2!25814) (t!51857 List!36943)) )
))
(declare-fun l!1251 () List!36943)

(declare-fun ListPrimitiveSize!222 (List!36943) Int)

(assert (=> b!1584380 (= e!884449 (>= (ListPrimitiveSize!222 (t!51857 l!1251)) (ListPrimitiveSize!222 l!1251)))))

(declare-fun b!1584381 () Bool)

(declare-fun res!1082200 () Bool)

(assert (=> b!1584381 (=> (not res!1082200) (not e!884449))))

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-fun containsKey!1002 (List!36943 (_ BitVec 64)) Bool)

(assert (=> b!1584381 (= res!1082200 (not (containsKey!1002 l!1251 otherKey!56)))))

(declare-fun b!1584382 () Bool)

(declare-fun res!1082201 () Bool)

(assert (=> b!1584382 (=> (not res!1082201) (not e!884449))))

(assert (=> b!1584382 (= res!1082201 (not (containsKey!1002 (t!51857 l!1251) otherKey!56)))))

(declare-fun b!1584383 () Bool)

(declare-fun res!1082197 () Bool)

(assert (=> b!1584383 (=> (not res!1082197) (not e!884449))))

(declare-fun newKey!123 () (_ BitVec 64))

(assert (=> b!1584383 (= res!1082197 (and (not (= otherKey!56 newKey!123)) (is-Cons!36939 l!1251)))))

(declare-fun res!1082199 () Bool)

(assert (=> start!138056 (=> (not res!1082199) (not e!884449))))

(declare-fun isStrictlySorted!1168 (List!36943) Bool)

(assert (=> start!138056 (= res!1082199 (isStrictlySorted!1168 l!1251))))

(assert (=> start!138056 e!884449))

(declare-fun e!884448 () Bool)

(assert (=> start!138056 e!884448))

(assert (=> start!138056 true))

(declare-fun b!1584384 () Bool)

(declare-fun tp_is_empty!39455 () Bool)

(declare-fun tp!115108 () Bool)

(assert (=> b!1584384 (= e!884448 (and tp_is_empty!39455 tp!115108))))

(declare-fun b!1584385 () Bool)

(declare-fun res!1082198 () Bool)

(assert (=> b!1584385 (=> (not res!1082198) (not e!884449))))

(assert (=> b!1584385 (= res!1082198 (isStrictlySorted!1168 (t!51857 l!1251)))))

(assert (= (and start!138056 res!1082199) b!1584381))

(assert (= (and b!1584381 res!1082200) b!1584383))

(assert (= (and b!1584383 res!1082197) b!1584385))

(assert (= (and b!1584385 res!1082198) b!1584382))

(assert (= (and b!1584382 res!1082201) b!1584380))

(assert (= (and start!138056 (is-Cons!36939 l!1251)) b!1584384))

(declare-fun m!1453709 () Bool)

(assert (=> start!138056 m!1453709))

(declare-fun m!1453711 () Bool)

(assert (=> b!1584380 m!1453711))

(declare-fun m!1453713 () Bool)

(assert (=> b!1584380 m!1453713))

(declare-fun m!1453715 () Bool)

(assert (=> b!1584382 m!1453715))

(declare-fun m!1453717 () Bool)

(assert (=> b!1584385 m!1453717))

(declare-fun m!1453719 () Bool)

(assert (=> b!1584381 m!1453719))

(push 1)

(assert (not b!1584380))

(assert (not b!1584382))

(assert tp_is_empty!39455)

(assert (not start!138056))

(assert (not b!1584384))

(assert (not b!1584381))

(assert (not b!1584385))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167403 () Bool)

(declare-fun res!1082210 () Bool)

(declare-fun e!884458 () Bool)

(assert (=> d!167403 (=> res!1082210 e!884458)))

(assert (=> d!167403 (= res!1082210 (or (is-Nil!36940 l!1251) (is-Nil!36940 (t!51857 l!1251))))))

(assert (=> d!167403 (= (isStrictlySorted!1168 l!1251) e!884458)))

(declare-fun b!1584394 () Bool)

(declare-fun e!884459 () Bool)

(assert (=> b!1584394 (= e!884458 e!884459)))

(declare-fun res!1082211 () Bool)

(assert (=> b!1584394 (=> (not res!1082211) (not e!884459))))

(assert (=> b!1584394 (= res!1082211 (bvslt (_1!12918 (h!38482 l!1251)) (_1!12918 (h!38482 (t!51857 l!1251)))))))

(declare-fun b!1584395 () Bool)

(assert (=> b!1584395 (= e!884459 (isStrictlySorted!1168 (t!51857 l!1251)))))

(assert (= (and d!167403 (not res!1082210)) b!1584394))

(assert (= (and b!1584394 res!1082211) b!1584395))

(assert (=> b!1584395 m!1453717))

(assert (=> start!138056 d!167403))

(declare-fun d!167407 () Bool)

(declare-fun res!1082214 () Bool)

(declare-fun e!884462 () Bool)

(assert (=> d!167407 (=> res!1082214 e!884462)))

(assert (=> d!167407 (= res!1082214 (or (is-Nil!36940 (t!51857 l!1251)) (is-Nil!36940 (t!51857 (t!51857 l!1251)))))))

(assert (=> d!167407 (= (isStrictlySorted!1168 (t!51857 l!1251)) e!884462)))

(declare-fun b!1584398 () Bool)

(declare-fun e!884463 () Bool)

(assert (=> b!1584398 (= e!884462 e!884463)))

(declare-fun res!1082215 () Bool)

(assert (=> b!1584398 (=> (not res!1082215) (not e!884463))))

(assert (=> b!1584398 (= res!1082215 (bvslt (_1!12918 (h!38482 (t!51857 l!1251))) (_1!12918 (h!38482 (t!51857 (t!51857 l!1251))))))))

(declare-fun b!1584399 () Bool)

(assert (=> b!1584399 (= e!884463 (isStrictlySorted!1168 (t!51857 (t!51857 l!1251))))))

(assert (= (and d!167407 (not res!1082214)) b!1584398))

(assert (= (and b!1584398 res!1082215) b!1584399))

(declare-fun m!1453723 () Bool)

(assert (=> b!1584399 m!1453723))

(assert (=> b!1584385 d!167407))

(declare-fun d!167411 () Bool)

(declare-fun lt!677247 () Int)

(assert (=> d!167411 (>= lt!677247 0)))

(declare-fun e!884470 () Int)

(assert (=> d!167411 (= lt!677247 e!884470)))

(declare-fun c!146846 () Bool)

(assert (=> d!167411 (= c!146846 (is-Nil!36940 (t!51857 l!1251)))))

(assert (=> d!167411 (= (ListPrimitiveSize!222 (t!51857 l!1251)) lt!677247)))

(declare-fun b!1584408 () Bool)

(assert (=> b!1584408 (= e!884470 0)))

(declare-fun b!1584409 () Bool)

(assert (=> b!1584409 (= e!884470 (+ 1 (ListPrimitiveSize!222 (t!51857 (t!51857 l!1251)))))))

(assert (= (and d!167411 c!146846) b!1584408))

(assert (= (and d!167411 (not c!146846)) b!1584409))

(declare-fun m!1453725 () Bool)

(assert (=> b!1584409 m!1453725))

(assert (=> b!1584380 d!167411))

(declare-fun d!167413 () Bool)

(declare-fun lt!677248 () Int)

(assert (=> d!167413 (>= lt!677248 0)))

(declare-fun e!884473 () Int)

(assert (=> d!167413 (= lt!677248 e!884473)))

(declare-fun c!146847 () Bool)

(assert (=> d!167413 (= c!146847 (is-Nil!36940 l!1251))))

(assert (=> d!167413 (= (ListPrimitiveSize!222 l!1251) lt!677248)))

(declare-fun b!1584410 () Bool)

(assert (=> b!1584410 (= e!884473 0)))

(declare-fun b!1584411 () Bool)

(assert (=> b!1584411 (= e!884473 (+ 1 (ListPrimitiveSize!222 (t!51857 l!1251))))))

(assert (= (and d!167413 c!146847) b!1584410))

(assert (= (and d!167413 (not c!146847)) b!1584411))

(assert (=> b!1584411 m!1453711))

(assert (=> b!1584380 d!167413))

(declare-fun d!167415 () Bool)

(declare-fun res!1082234 () Bool)

(declare-fun e!884486 () Bool)

(assert (=> d!167415 (=> res!1082234 e!884486)))

(assert (=> d!167415 (= res!1082234 (and (is-Cons!36939 l!1251) (= (_1!12918 (h!38482 l!1251)) otherKey!56)))))

(assert (=> d!167415 (= (containsKey!1002 l!1251 otherKey!56) e!884486)))

(declare-fun b!1584426 () Bool)

(declare-fun e!884487 () Bool)

(assert (=> b!1584426 (= e!884486 e!884487)))

(declare-fun res!1082235 () Bool)

(assert (=> b!1584426 (=> (not res!1082235) (not e!884487))))

(assert (=> b!1584426 (= res!1082235 (and (or (not (is-Cons!36939 l!1251)) (bvsle (_1!12918 (h!38482 l!1251)) otherKey!56)) (is-Cons!36939 l!1251) (bvslt (_1!12918 (h!38482 l!1251)) otherKey!56)))))

(declare-fun b!1584427 () Bool)

(assert (=> b!1584427 (= e!884487 (containsKey!1002 (t!51857 l!1251) otherKey!56))))

(assert (= (and d!167415 (not res!1082234)) b!1584426))

(assert (= (and b!1584426 res!1082235) b!1584427))

(assert (=> b!1584427 m!1453715))

(assert (=> b!1584381 d!167415))

(declare-fun d!167423 () Bool)

(declare-fun res!1082236 () Bool)

(declare-fun e!884490 () Bool)

(assert (=> d!167423 (=> res!1082236 e!884490)))

(assert (=> d!167423 (= res!1082236 (and (is-Cons!36939 (t!51857 l!1251)) (= (_1!12918 (h!38482 (t!51857 l!1251))) otherKey!56)))))

(assert (=> d!167423 (= (containsKey!1002 (t!51857 l!1251) otherKey!56) e!884490)))

(declare-fun b!1584432 () Bool)

(declare-fun e!884491 () Bool)

(assert (=> b!1584432 (= e!884490 e!884491)))

(declare-fun res!1082237 () Bool)

(assert (=> b!1584432 (=> (not res!1082237) (not e!884491))))

(assert (=> b!1584432 (= res!1082237 (and (or (not (is-Cons!36939 (t!51857 l!1251))) (bvsle (_1!12918 (h!38482 (t!51857 l!1251))) otherKey!56)) (is-Cons!36939 (t!51857 l!1251)) (bvslt (_1!12918 (h!38482 (t!51857 l!1251))) otherKey!56)))))

(declare-fun b!1584433 () Bool)

(assert (=> b!1584433 (= e!884491 (containsKey!1002 (t!51857 (t!51857 l!1251)) otherKey!56))))

(assert (= (and d!167423 (not res!1082236)) b!1584432))

(assert (= (and b!1584432 res!1082237) b!1584433))

(declare-fun m!1453727 () Bool)

(assert (=> b!1584433 m!1453727))

(assert (=> b!1584382 d!167423))

(declare-fun b!1584438 () Bool)

(declare-fun e!884494 () Bool)

(declare-fun tp!115111 () Bool)

(assert (=> b!1584438 (= e!884494 (and tp_is_empty!39455 tp!115111))))

(assert (=> b!1584384 (= tp!115108 e!884494)))

(assert (= (and b!1584384 (is-Cons!36939 (t!51857 l!1251))) b!1584438))

(push 1)

(assert (not b!1584399))

(assert (not b!1584433))

(assert tp_is_empty!39455)

(assert (not b!1584411))

(assert (not b!1584409))

(assert (not b!1584427))

(assert (not b!1584438))

(assert (not b!1584395))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

