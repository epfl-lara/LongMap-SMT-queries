; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133182 () Bool)

(assert start!133182)

(declare-fun b!1558168 () Bool)

(declare-fun e!867982 () Bool)

(declare-datatypes ((B!2424 0))(
  ( (B!2425 (val!19298 Int)) )
))
(declare-datatypes ((tuple2!24972 0))(
  ( (tuple2!24973 (_1!12497 (_ BitVec 64)) (_2!12497 B!2424)) )
))
(declare-datatypes ((List!36332 0))(
  ( (Nil!36329) (Cons!36328 (h!37774 tuple2!24972) (t!51059 List!36332)) )
))
(declare-fun l!1292 () List!36332)

(declare-fun ListPrimitiveSize!183 (List!36332) Int)

(assert (=> b!1558168 (= e!867982 (< (ListPrimitiveSize!183 l!1292) 0))))

(declare-fun b!1558166 () Bool)

(declare-fun res!1065675 () Bool)

(assert (=> b!1558166 (=> (not res!1065675) (not e!867982))))

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun containsKey!835 (List!36332 (_ BitVec 64)) Bool)

(assert (=> b!1558166 (= res!1065675 (containsKey!835 l!1292 otherKey!62))))

(declare-fun b!1558167 () Bool)

(declare-fun res!1065674 () Bool)

(assert (=> b!1558167 (=> (not res!1065674) (not e!867982))))

(declare-fun newKey!135 () (_ BitVec 64))

(assert (=> b!1558167 (= res!1065674 (not (= otherKey!62 newKey!135)))))

(declare-fun res!1065676 () Bool)

(assert (=> start!133182 (=> (not res!1065676) (not e!867982))))

(declare-fun isStrictlySorted!972 (List!36332) Bool)

(assert (=> start!133182 (= res!1065676 (isStrictlySorted!972 l!1292))))

(assert (=> start!133182 e!867982))

(declare-fun e!867983 () Bool)

(assert (=> start!133182 e!867983))

(assert (=> start!133182 true))

(declare-fun b!1558169 () Bool)

(declare-fun tp_is_empty!38429 () Bool)

(declare-fun tp!112608 () Bool)

(assert (=> b!1558169 (= e!867983 (and tp_is_empty!38429 tp!112608))))

(assert (= (and start!133182 res!1065676) b!1558166))

(assert (= (and b!1558166 res!1065675) b!1558167))

(assert (= (and b!1558167 res!1065674) b!1558168))

(assert (= (and start!133182 (is-Cons!36328 l!1292)) b!1558169))

(declare-fun m!1434981 () Bool)

(assert (=> b!1558168 m!1434981))

(declare-fun m!1434983 () Bool)

(assert (=> b!1558166 m!1434983))

(declare-fun m!1434985 () Bool)

(assert (=> start!133182 m!1434985))

(push 1)

(assert (not b!1558166))

(assert (not b!1558169))

(assert tp_is_empty!38429)

(assert (not b!1558168))

(assert (not start!133182))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162595 () Bool)

(declare-fun res!1065687 () Bool)

(declare-fun e!867996 () Bool)

(assert (=> d!162595 (=> res!1065687 e!867996)))

(assert (=> d!162595 (= res!1065687 (and (is-Cons!36328 l!1292) (= (_1!12497 (h!37774 l!1292)) otherKey!62)))))

(assert (=> d!162595 (= (containsKey!835 l!1292 otherKey!62) e!867996)))

(declare-fun b!1558184 () Bool)

(declare-fun e!867997 () Bool)

(assert (=> b!1558184 (= e!867996 e!867997)))

(declare-fun res!1065688 () Bool)

(assert (=> b!1558184 (=> (not res!1065688) (not e!867997))))

(assert (=> b!1558184 (= res!1065688 (and (or (not (is-Cons!36328 l!1292)) (bvsle (_1!12497 (h!37774 l!1292)) otherKey!62)) (is-Cons!36328 l!1292) (bvslt (_1!12497 (h!37774 l!1292)) otherKey!62)))))

(declare-fun b!1558185 () Bool)

(assert (=> b!1558185 (= e!867997 (containsKey!835 (t!51059 l!1292) otherKey!62))))

(assert (= (and d!162595 (not res!1065687)) b!1558184))

(assert (= (and b!1558184 res!1065688) b!1558185))

(declare-fun m!1434989 () Bool)

(assert (=> b!1558185 m!1434989))

(assert (=> b!1558166 d!162595))

(declare-fun d!162603 () Bool)

(declare-fun lt!670772 () Int)

(assert (=> d!162603 (>= lt!670772 0)))

(declare-fun e!868008 () Int)

(assert (=> d!162603 (= lt!670772 e!868008)))

(declare-fun c!144092 () Bool)

(assert (=> d!162603 (= c!144092 (is-Nil!36329 l!1292))))

(assert (=> d!162603 (= (ListPrimitiveSize!183 l!1292) lt!670772)))

(declare-fun b!1558202 () Bool)

(assert (=> b!1558202 (= e!868008 0)))

(declare-fun b!1558203 () Bool)

(assert (=> b!1558203 (= e!868008 (+ 1 (ListPrimitiveSize!183 (t!51059 l!1292))))))

(assert (= (and d!162603 c!144092) b!1558202))

