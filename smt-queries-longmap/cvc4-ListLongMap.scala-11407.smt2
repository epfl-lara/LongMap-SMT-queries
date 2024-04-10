; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132822 () Bool)

(assert start!132822)

(declare-fun b!1555826 () Bool)

(declare-fun e!866464 () Bool)

(declare-fun tp_is_empty!38333 () Bool)

(declare-fun tp!112350 () Bool)

(assert (=> b!1555826 (= e!866464 (and tp_is_empty!38333 tp!112350))))

(declare-fun b!1555825 () Bool)

(declare-fun e!866465 () Bool)

(declare-datatypes ((B!2322 0))(
  ( (B!2323 (val!19247 Int)) )
))
(declare-datatypes ((tuple2!24870 0))(
  ( (tuple2!24871 (_1!12446 (_ BitVec 64)) (_2!12446 B!2322)) )
))
(declare-datatypes ((List!36281 0))(
  ( (Nil!36278) (Cons!36277 (h!37723 tuple2!24870) (t!51002 List!36281)) )
))
(declare-fun lt!670352 () List!36281)

(declare-fun isStrictlySorted!934 (List!36281) Bool)

(assert (=> b!1555825 (= e!866465 (not (isStrictlySorted!934 lt!670352)))))

(declare-fun b!1555824 () Bool)

(declare-fun e!866463 () Bool)

(assert (=> b!1555824 (= e!866463 e!866465)))

(declare-fun res!1064484 () Bool)

(assert (=> b!1555824 (=> (not res!1064484) (not e!866465))))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-fun l!1177 () List!36281)

(declare-fun containsKey!805 (List!36281 (_ BitVec 64)) Bool)

(assert (=> b!1555824 (= res!1064484 (= (containsKey!805 lt!670352 otherKey!50) (containsKey!805 l!1177 otherKey!50)))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun newValue!105 () B!2322)

(declare-fun insertStrictlySorted!545 (List!36281 (_ BitVec 64) B!2322) List!36281)

(assert (=> b!1555824 (= lt!670352 (insertStrictlySorted!545 l!1177 newKey!105 newValue!105))))

(declare-fun b!1555823 () Bool)

(declare-fun res!1064485 () Bool)

(assert (=> b!1555823 (=> (not res!1064485) (not e!866463))))

(assert (=> b!1555823 (= res!1064485 (and (not (= newKey!105 otherKey!50)) (or (not (is-Cons!36277 l!1177)) (= (_1!12446 (h!37723 l!1177)) otherKey!50))))))

(declare-fun res!1064483 () Bool)

(assert (=> start!132822 (=> (not res!1064483) (not e!866463))))

(assert (=> start!132822 (= res!1064483 (isStrictlySorted!934 l!1177))))

(assert (=> start!132822 e!866463))

(assert (=> start!132822 e!866464))

(assert (=> start!132822 true))

(assert (=> start!132822 tp_is_empty!38333))

(assert (= (and start!132822 res!1064483) b!1555823))

(assert (= (and b!1555823 res!1064485) b!1555824))

(assert (= (and b!1555824 res!1064484) b!1555825))

(assert (= (and start!132822 (is-Cons!36277 l!1177)) b!1555826))

(declare-fun m!1433669 () Bool)

(assert (=> b!1555825 m!1433669))

(declare-fun m!1433671 () Bool)

(assert (=> b!1555824 m!1433671))

(declare-fun m!1433673 () Bool)

(assert (=> b!1555824 m!1433673))

(declare-fun m!1433675 () Bool)

(assert (=> b!1555824 m!1433675))

(declare-fun m!1433677 () Bool)

(assert (=> start!132822 m!1433677))

(push 1)

(assert (not b!1555824))

(assert (not b!1555825))

(assert tp_is_empty!38333)

(assert (not start!132822))

(assert (not b!1555826))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162019 () Bool)

(declare-fun res!1064512 () Bool)

(declare-fun e!866492 () Bool)

(assert (=> d!162019 (=> res!1064512 e!866492)))

(assert (=> d!162019 (= res!1064512 (and (is-Cons!36277 lt!670352) (= (_1!12446 (h!37723 lt!670352)) otherKey!50)))))

(assert (=> d!162019 (= (containsKey!805 lt!670352 otherKey!50) e!866492)))

(declare-fun b!1555853 () Bool)

(declare-fun e!866493 () Bool)

(assert (=> b!1555853 (= e!866492 e!866493)))

(declare-fun res!1064513 () Bool)

(assert (=> b!1555853 (=> (not res!1064513) (not e!866493))))

(assert (=> b!1555853 (= res!1064513 (and (or (not (is-Cons!36277 lt!670352)) (bvsle (_1!12446 (h!37723 lt!670352)) otherKey!50)) (is-Cons!36277 lt!670352) (bvslt (_1!12446 (h!37723 lt!670352)) otherKey!50)))))

(declare-fun b!1555854 () Bool)

(assert (=> b!1555854 (= e!866493 (containsKey!805 (t!51002 lt!670352) otherKey!50))))

(assert (= (and d!162019 (not res!1064512)) b!1555853))

(assert (= (and b!1555853 res!1064513) b!1555854))

(declare-fun m!1433691 () Bool)

(assert (=> b!1555854 m!1433691))

(assert (=> b!1555824 d!162019))

(declare-fun d!162033 () Bool)

(declare-fun res!1064516 () Bool)

(declare-fun e!866496 () Bool)

(assert (=> d!162033 (=> res!1064516 e!866496)))

(assert (=> d!162033 (= res!1064516 (and (is-Cons!36277 l!1177) (= (_1!12446 (h!37723 l!1177)) otherKey!50)))))

(assert (=> d!162033 (= (containsKey!805 l!1177 otherKey!50) e!866496)))

(declare-fun b!1555857 () Bool)

(declare-fun e!866497 () Bool)

(assert (=> b!1555857 (= e!866496 e!866497)))

(declare-fun res!1064517 () Bool)

(assert (=> b!1555857 (=> (not res!1064517) (not e!866497))))

(assert (=> b!1555857 (= res!1064517 (and (or (not (is-Cons!36277 l!1177)) (bvsle (_1!12446 (h!37723 l!1177)) otherKey!50)) (is-Cons!36277 l!1177) (bvslt (_1!12446 (h!37723 l!1177)) otherKey!50)))))

(declare-fun b!1555858 () Bool)

(assert (=> b!1555858 (= e!866497 (containsKey!805 (t!51002 l!1177) otherKey!50))))

(assert (= (and d!162033 (not res!1064516)) b!1555857))

(assert (= (and b!1555857 res!1064517) b!1555858))

(declare-fun m!1433693 () Bool)

(assert (=> b!1555858 m!1433693))

(assert (=> b!1555824 d!162033))

(declare-fun d!162035 () Bool)

(declare-fun e!866545 () Bool)

(assert (=> d!162035 e!866545))

(declare-fun res!1064540 () Bool)

(assert (=> d!162035 (=> (not res!1064540) (not e!866545))))

(declare-fun lt!670360 () List!36281)

(assert (=> d!162035 (= res!1064540 (isStrictlySorted!934 lt!670360))))

(declare-fun e!866547 () List!36281)

(assert (=> d!162035 (= lt!670360 e!866547)))

(declare-fun c!143701 () Bool)

(assert (=> d!162035 (= c!143701 (and (is-Cons!36277 l!1177) (bvslt (_1!12446 (h!37723 l!1177)) newKey!105)))))

(assert (=> d!162035 (isStrictlySorted!934 l!1177)))

(assert (=> d!162035 (= (insertStrictlySorted!545 l!1177 newKey!105 newValue!105) lt!670360)))

(declare-fun b!1555942 () Bool)

(declare-fun e!866548 () List!36281)

(declare-fun call!71577 () List!36281)

(assert (=> b!1555942 (= e!866548 call!71577)))

(declare-fun b!1555943 () Bool)

(assert (=> b!1555943 (= e!866548 call!71577)))

(declare-fun b!1555944 () Bool)

(declare-fun e!866546 () List!36281)

(declare-fun call!71575 () List!36281)

(assert (=> b!1555944 (= e!866546 call!71575)))

(declare-fun call!71576 () List!36281)

(declare-fun e!866544 () List!36281)

(declare-fun bm!71572 () Bool)

(declare-fun $colon$colon!965 (List!36281 tuple2!24870) List!36281)

(assert (=> bm!71572 (= call!71576 ($colon$colon!965 e!866544 (ite c!143701 (h!37723 l!1177) (tuple2!24871 newKey!105 newValue!105))))))

(declare-fun c!143700 () Bool)

(assert (=> bm!71572 (= c!143700 c!143701)))

(declare-fun b!1555945 () Bool)

(declare-fun c!143698 () Bool)

(assert (=> b!1555945 (= c!143698 (and (is-Cons!36277 l!1177) (bvsgt (_1!12446 (h!37723 l!1177)) newKey!105)))))

(assert (=> b!1555945 (= e!866546 e!866548)))

(declare-fun b!1555946 () Bool)

(assert (=> b!1555946 (= e!866547 e!866546)))

(declare-fun c!143699 () Bool)

(assert (=> b!1555946 (= c!143699 (and (is-Cons!36277 l!1177) (= (_1!12446 (h!37723 l!1177)) newKey!105)))))

(declare-fun b!1555947 () Bool)

(declare-fun res!1064541 () Bool)

(assert (=> b!1555947 (=> (not res!1064541) (not e!866545))))

(assert (=> b!1555947 (= res!1064541 (containsKey!805 lt!670360 newKey!105))))

(declare-fun b!1555948 () Bool)

(assert (=> b!1555948 (= e!866544 (insertStrictlySorted!545 (t!51002 l!1177) newKey!105 newValue!105))))

(declare-fun b!1555949 () Bool)

(assert (=> b!1555949 (= e!866547 call!71576)))

(declare-fun bm!71573 () Bool)

(assert (=> bm!71573 (= call!71575 call!71576)))

(declare-fun bm!71574 () Bool)

(assert (=> bm!71574 (= call!71577 call!71575)))

