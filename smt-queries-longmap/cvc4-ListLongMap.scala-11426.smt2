; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133224 () Bool)

(assert start!133224)

(declare-fun b!1558395 () Bool)

(declare-fun e!868139 () Bool)

(declare-datatypes ((B!2436 0))(
  ( (B!2437 (val!19304 Int)) )
))
(declare-datatypes ((tuple2!24984 0))(
  ( (tuple2!24985 (_1!12503 (_ BitVec 64)) (_2!12503 B!2436)) )
))
(declare-datatypes ((List!36338 0))(
  ( (Nil!36335) (Cons!36334 (h!37780 tuple2!24984) (t!51065 List!36338)) )
))
(declare-fun l!1292 () List!36338)

(declare-fun ListPrimitiveSize!186 (List!36338) Int)

(assert (=> b!1558395 (= e!868139 (>= (ListPrimitiveSize!186 (t!51065 l!1292)) (ListPrimitiveSize!186 l!1292)))))

(declare-fun b!1558396 () Bool)

(declare-fun res!1065838 () Bool)

(assert (=> b!1558396 (=> (not res!1065838) (not e!868139))))

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun containsKey!841 (List!36338 (_ BitVec 64)) Bool)

(assert (=> b!1558396 (= res!1065838 (containsKey!841 (t!51065 l!1292) otherKey!62))))

(declare-fun b!1558397 () Bool)

(declare-fun res!1065840 () Bool)

(assert (=> b!1558397 (=> (not res!1065840) (not e!868139))))

(declare-fun newKey!135 () (_ BitVec 64))

(assert (=> b!1558397 (= res!1065840 (and (not (= otherKey!62 newKey!135)) (is-Cons!36334 l!1292) (not (= (_1!12503 (h!37780 l!1292)) otherKey!62))))))

(declare-fun res!1065841 () Bool)

(assert (=> start!133224 (=> (not res!1065841) (not e!868139))))

(declare-fun isStrictlySorted!978 (List!36338) Bool)

(assert (=> start!133224 (= res!1065841 (isStrictlySorted!978 l!1292))))

(assert (=> start!133224 e!868139))

(declare-fun e!868138 () Bool)

(assert (=> start!133224 e!868138))

(assert (=> start!133224 true))

(declare-fun b!1558398 () Bool)

(declare-fun res!1065839 () Bool)

(assert (=> b!1558398 (=> (not res!1065839) (not e!868139))))

(assert (=> b!1558398 (= res!1065839 (containsKey!841 l!1292 otherKey!62))))

(declare-fun b!1558399 () Bool)

(declare-fun tp_is_empty!38441 () Bool)

(declare-fun tp!112644 () Bool)

(assert (=> b!1558399 (= e!868138 (and tp_is_empty!38441 tp!112644))))

(declare-fun b!1558400 () Bool)

(declare-fun res!1065837 () Bool)

(assert (=> b!1558400 (=> (not res!1065837) (not e!868139))))

(assert (=> b!1558400 (= res!1065837 (isStrictlySorted!978 (t!51065 l!1292)))))

(assert (= (and start!133224 res!1065841) b!1558398))

(assert (= (and b!1558398 res!1065839) b!1558397))

(assert (= (and b!1558397 res!1065840) b!1558400))

(assert (= (and b!1558400 res!1065837) b!1558396))

(assert (= (and b!1558396 res!1065838) b!1558395))

(assert (= (and start!133224 (is-Cons!36334 l!1292)) b!1558399))

(declare-fun m!1435065 () Bool)

(assert (=> b!1558396 m!1435065))

(declare-fun m!1435067 () Bool)

(assert (=> start!133224 m!1435067))

(declare-fun m!1435069 () Bool)

(assert (=> b!1558398 m!1435069))

(declare-fun m!1435071 () Bool)

(assert (=> b!1558395 m!1435071))

(declare-fun m!1435073 () Bool)

(assert (=> b!1558395 m!1435073))

(declare-fun m!1435075 () Bool)

(assert (=> b!1558400 m!1435075))

(push 1)

(assert tp_is_empty!38441)

(assert (not start!133224))

(assert (not b!1558399))

(assert (not b!1558396))

(assert (not b!1558398))

(assert (not b!1558395))

(assert (not b!1558400))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162643 () Bool)

(declare-fun lt!670779 () Int)

(assert (=> d!162643 (>= lt!670779 0)))

(declare-fun e!868146 () Int)

(assert (=> d!162643 (= lt!670779 e!868146)))

(declare-fun c!144099 () Bool)

(assert (=> d!162643 (= c!144099 (is-Nil!36335 (t!51065 l!1292)))))

(assert (=> d!162643 (= (ListPrimitiveSize!186 (t!51065 l!1292)) lt!670779)))

(declare-fun b!1558413 () Bool)

(assert (=> b!1558413 (= e!868146 0)))

(declare-fun b!1558414 () Bool)

(assert (=> b!1558414 (= e!868146 (+ 1 (ListPrimitiveSize!186 (t!51065 (t!51065 l!1292)))))))

(assert (= (and d!162643 c!144099) b!1558413))

(assert (= (and d!162643 (not c!144099)) b!1558414))

(declare-fun m!1435079 () Bool)

(assert (=> b!1558414 m!1435079))

(assert (=> b!1558395 d!162643))

(declare-fun d!162649 () Bool)

(declare-fun lt!670780 () Int)

(assert (=> d!162649 (>= lt!670780 0)))

(declare-fun e!868147 () Int)

(assert (=> d!162649 (= lt!670780 e!868147)))

(declare-fun c!144100 () Bool)

(assert (=> d!162649 (= c!144100 (is-Nil!36335 l!1292))))

(assert (=> d!162649 (= (ListPrimitiveSize!186 l!1292) lt!670780)))

(declare-fun b!1558415 () Bool)

(assert (=> b!1558415 (= e!868147 0)))

(declare-fun b!1558416 () Bool)

(assert (=> b!1558416 (= e!868147 (+ 1 (ListPrimitiveSize!186 (t!51065 l!1292))))))

(assert (= (and d!162649 c!144100) b!1558415))

(assert (= (and d!162649 (not c!144100)) b!1558416))

(assert (=> b!1558416 m!1435071))

(assert (=> b!1558395 d!162649))

(declare-fun d!162653 () Bool)

(declare-fun res!1065858 () Bool)

(declare-fun e!868164 () Bool)

(assert (=> d!162653 (=> res!1065858 e!868164)))

(assert (=> d!162653 (= res!1065858 (or (is-Nil!36335 (t!51065 l!1292)) (is-Nil!36335 (t!51065 (t!51065 l!1292)))))))

(assert (=> d!162653 (= (isStrictlySorted!978 (t!51065 l!1292)) e!868164)))

(declare-fun b!1558433 () Bool)

(declare-fun e!868165 () Bool)

(assert (=> b!1558433 (= e!868164 e!868165)))

(declare-fun res!1065859 () Bool)

(assert (=> b!1558433 (=> (not res!1065859) (not e!868165))))

(assert (=> b!1558433 (= res!1065859 (bvslt (_1!12503 (h!37780 (t!51065 l!1292))) (_1!12503 (h!37780 (t!51065 (t!51065 l!1292))))))))

(declare-fun b!1558434 () Bool)

(assert (=> b!1558434 (= e!868165 (isStrictlySorted!978 (t!51065 (t!51065 l!1292))))))

(assert (= (and d!162653 (not res!1065858)) b!1558433))

(assert (= (and b!1558433 res!1065859) b!1558434))

(declare-fun m!1435083 () Bool)

(assert (=> b!1558434 m!1435083))

(assert (=> b!1558400 d!162653))

(declare-fun d!162659 () Bool)

(declare-fun res!1065860 () Bool)

(declare-fun e!868166 () Bool)

(assert (=> d!162659 (=> res!1065860 e!868166)))

(assert (=> d!162659 (= res!1065860 (or (is-Nil!36335 l!1292) (is-Nil!36335 (t!51065 l!1292))))))

(assert (=> d!162659 (= (isStrictlySorted!978 l!1292) e!868166)))

(declare-fun b!1558435 () Bool)

(declare-fun e!868167 () Bool)

(assert (=> b!1558435 (= e!868166 e!868167)))

(declare-fun res!1065861 () Bool)

(assert (=> b!1558435 (=> (not res!1065861) (not e!868167))))

(assert (=> b!1558435 (= res!1065861 (bvslt (_1!12503 (h!37780 l!1292)) (_1!12503 (h!37780 (t!51065 l!1292)))))))

(declare-fun b!1558436 () Bool)

(assert (=> b!1558436 (= e!868167 (isStrictlySorted!978 (t!51065 l!1292)))))

(assert (= (and d!162659 (not res!1065860)) b!1558435))

(assert (= (and b!1558435 res!1065861) b!1558436))

(assert (=> b!1558436 m!1435075))

(assert (=> start!133224 d!162659))

(declare-fun d!162661 () Bool)

(declare-fun res!1065882 () Bool)

(declare-fun e!868190 () Bool)

(assert (=> d!162661 (=> res!1065882 e!868190)))

(assert (=> d!162661 (= res!1065882 (and (is-Cons!36334 l!1292) (= (_1!12503 (h!37780 l!1292)) otherKey!62)))))

(assert (=> d!162661 (= (containsKey!841 l!1292 otherKey!62) e!868190)))

(declare-fun b!1558461 () Bool)

(declare-fun e!868191 () Bool)

(assert (=> b!1558461 (= e!868190 e!868191)))

(declare-fun res!1065883 () Bool)

(assert (=> b!1558461 (=> (not res!1065883) (not e!868191))))

(assert (=> b!1558461 (= res!1065883 (and (or (not (is-Cons!36334 l!1292)) (bvsle (_1!12503 (h!37780 l!1292)) otherKey!62)) (is-Cons!36334 l!1292) (bvslt (_1!12503 (h!37780 l!1292)) otherKey!62)))))

(declare-fun b!1558462 () Bool)

(assert (=> b!1558462 (= e!868191 (containsKey!841 (t!51065 l!1292) otherKey!62))))

(assert (= (and d!162661 (not res!1065882)) b!1558461))

(assert (= (and b!1558461 res!1065883) b!1558462))

(assert (=> b!1558462 m!1435065))

(assert (=> b!1558398 d!162661))

(declare-fun d!162669 () Bool)

(declare-fun res!1065886 () Bool)

(declare-fun e!868195 () Bool)

(assert (=> d!162669 (=> res!1065886 e!868195)))

(assert (=> d!162669 (= res!1065886 (and (is-Cons!36334 (t!51065 l!1292)) (= (_1!12503 (h!37780 (t!51065 l!1292))) otherKey!62)))))

(assert (=> d!162669 (= (containsKey!841 (t!51065 l!1292) otherKey!62) e!868195)))

(declare-fun b!1558466 () Bool)

(declare-fun e!868196 () Bool)

(assert (=> b!1558466 (= e!868195 e!868196)))

(declare-fun res!1065887 () Bool)

(assert (=> b!1558466 (=> (not res!1065887) (not e!868196))))

(assert (=> b!1558466 (= res!1065887 (and (or (not (is-Cons!36334 (t!51065 l!1292))) (bvsle (_1!12503 (h!37780 (t!51065 l!1292))) otherKey!62)) (is-Cons!36334 (t!51065 l!1292)) (bvslt (_1!12503 (h!37780 (t!51065 l!1292))) otherKey!62)))))

(declare-fun b!1558467 () Bool)

(assert (=> b!1558467 (= e!868196 (containsKey!841 (t!51065 (t!51065 l!1292)) otherKey!62))))

(assert (= (and d!162669 (not res!1065886)) b!1558466))

(assert (= (and b!1558466 res!1065887) b!1558467))

(declare-fun m!1435089 () Bool)

(assert (=> b!1558467 m!1435089))

(assert (=> b!1558396 d!162669))

(declare-fun b!1558474 () Bool)

(declare-fun e!868201 () Bool)

(declare-fun tp!112650 () Bool)

(assert (=> b!1558474 (= e!868201 (and tp_is_empty!38441 tp!112650))))

(assert (=> b!1558399 (= tp!112644 e!868201)))

(assert (= (and b!1558399 (is-Cons!36334 (t!51065 l!1292))) b!1558474))

(push 1)

