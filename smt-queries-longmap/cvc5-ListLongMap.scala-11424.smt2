; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133178 () Bool)

(assert start!133178)

(declare-fun b!1558145 () Bool)

(declare-fun e!867970 () Bool)

(declare-fun tp_is_empty!38425 () Bool)

(declare-fun tp!112602 () Bool)

(assert (=> b!1558145 (= e!867970 (and tp_is_empty!38425 tp!112602))))

(declare-fun b!1558143 () Bool)

(declare-fun res!1065657 () Bool)

(declare-fun e!867971 () Bool)

(assert (=> b!1558143 (=> (not res!1065657) (not e!867971))))

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun newKey!135 () (_ BitVec 64))

(assert (=> b!1558143 (= res!1065657 (not (= otherKey!62 newKey!135)))))

(declare-fun res!1065656 () Bool)

(assert (=> start!133178 (=> (not res!1065656) (not e!867971))))

(declare-datatypes ((B!2420 0))(
  ( (B!2421 (val!19296 Int)) )
))
(declare-datatypes ((tuple2!24968 0))(
  ( (tuple2!24969 (_1!12495 (_ BitVec 64)) (_2!12495 B!2420)) )
))
(declare-datatypes ((List!36330 0))(
  ( (Nil!36327) (Cons!36326 (h!37772 tuple2!24968) (t!51057 List!36330)) )
))
(declare-fun l!1292 () List!36330)

(declare-fun isStrictlySorted!970 (List!36330) Bool)

(assert (=> start!133178 (= res!1065656 (isStrictlySorted!970 l!1292))))

(assert (=> start!133178 e!867971))

(assert (=> start!133178 e!867970))

(assert (=> start!133178 true))

(declare-fun b!1558144 () Bool)

(declare-fun ListPrimitiveSize!181 (List!36330) Int)

(assert (=> b!1558144 (= e!867971 (< (ListPrimitiveSize!181 l!1292) 0))))

(declare-fun b!1558142 () Bool)

(declare-fun res!1065658 () Bool)

(assert (=> b!1558142 (=> (not res!1065658) (not e!867971))))

(declare-fun containsKey!833 (List!36330 (_ BitVec 64)) Bool)

(assert (=> b!1558142 (= res!1065658 (containsKey!833 l!1292 otherKey!62))))

(assert (= (and start!133178 res!1065656) b!1558142))

(assert (= (and b!1558142 res!1065658) b!1558143))

(assert (= (and b!1558143 res!1065657) b!1558144))

(assert (= (and start!133178 (is-Cons!36326 l!1292)) b!1558145))

(declare-fun m!1434969 () Bool)

(assert (=> start!133178 m!1434969))

(declare-fun m!1434971 () Bool)

(assert (=> b!1558144 m!1434971))

(declare-fun m!1434973 () Bool)

(assert (=> b!1558142 m!1434973))

(push 1)

(assert (not b!1558145))

(assert (not start!133178))

(assert (not b!1558142))

(assert tp_is_empty!38425)

(assert (not b!1558144))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162599 () Bool)

(declare-fun lt!670769 () Int)

(assert (=> d!162599 (>= lt!670769 0)))

(declare-fun e!868001 () Int)

(assert (=> d!162599 (= lt!670769 e!868001)))

(declare-fun c!144089 () Bool)

(assert (=> d!162599 (= c!144089 (is-Nil!36327 l!1292))))

(assert (=> d!162599 (= (ListPrimitiveSize!181 l!1292) lt!670769)))

(declare-fun b!1558192 () Bool)

(assert (=> b!1558192 (= e!868001 0)))

(declare-fun b!1558193 () Bool)

(assert (=> b!1558193 (= e!868001 (+ 1 (ListPrimitiveSize!181 (t!51057 l!1292))))))

(assert (= (and d!162599 c!144089) b!1558192))

(assert (= (and d!162599 (not c!144089)) b!1558193))

(declare-fun m!1434993 () Bool)

(assert (=> b!1558193 m!1434993))

(assert (=> b!1558144 d!162599))

(declare-fun d!162607 () Bool)

(declare-fun res!1065699 () Bool)

(declare-fun e!868018 () Bool)

(assert (=> d!162607 (=> res!1065699 e!868018)))

(assert (=> d!162607 (= res!1065699 (or (is-Nil!36327 l!1292) (is-Nil!36327 (t!51057 l!1292))))))

(assert (=> d!162607 (= (isStrictlySorted!970 l!1292) e!868018)))

(declare-fun b!1558215 () Bool)

(declare-fun e!868019 () Bool)

(assert (=> b!1558215 (= e!868018 e!868019)))

(declare-fun res!1065700 () Bool)

(assert (=> b!1558215 (=> (not res!1065700) (not e!868019))))

(assert (=> b!1558215 (= res!1065700 (bvslt (_1!12495 (h!37772 l!1292)) (_1!12495 (h!37772 (t!51057 l!1292)))))))

