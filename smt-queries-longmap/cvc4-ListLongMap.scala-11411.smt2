; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132882 () Bool)

(assert start!132882)

(declare-fun b!1556184 () Bool)

(declare-fun res!1064672 () Bool)

(declare-fun e!866707 () Bool)

(assert (=> b!1556184 (=> (not res!1064672) (not e!866707))))

(declare-datatypes ((B!2346 0))(
  ( (B!2347 (val!19259 Int)) )
))
(declare-datatypes ((tuple2!24894 0))(
  ( (tuple2!24895 (_1!12458 (_ BitVec 64)) (_2!12458 B!2346)) )
))
(declare-datatypes ((List!36293 0))(
  ( (Nil!36290) (Cons!36289 (h!37735 tuple2!24894) (t!51014 List!36293)) )
))
(declare-fun l!1177 () List!36293)

(declare-fun isStrictlySorted!946 (List!36293) Bool)

(assert (=> b!1556184 (= res!1064672 (isStrictlySorted!946 (t!51014 l!1177)))))

(declare-fun b!1556185 () Bool)

(declare-fun ListPrimitiveSize!180 (List!36293) Int)

(assert (=> b!1556185 (= e!866707 (>= (ListPrimitiveSize!180 (t!51014 l!1177)) (ListPrimitiveSize!180 l!1177)))))

(declare-fun res!1064673 () Bool)

(assert (=> start!132882 (=> (not res!1064673) (not e!866707))))

(assert (=> start!132882 (= res!1064673 (isStrictlySorted!946 l!1177))))

(assert (=> start!132882 e!866707))

(declare-fun e!866708 () Bool)

(assert (=> start!132882 e!866708))

(assert (=> start!132882 true))

(declare-fun b!1556183 () Bool)

(declare-fun res!1064674 () Bool)

(assert (=> b!1556183 (=> (not res!1064674) (not e!866707))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(assert (=> b!1556183 (= res!1064674 (and (not (= newKey!105 otherKey!50)) (is-Cons!36289 l!1177) (not (= (_1!12458 (h!37735 l!1177)) otherKey!50))))))

(declare-fun b!1556186 () Bool)

(declare-fun tp_is_empty!38357 () Bool)

(declare-fun tp!112413 () Bool)

(assert (=> b!1556186 (= e!866708 (and tp_is_empty!38357 tp!112413))))

(assert (= (and start!132882 res!1064673) b!1556183))

(assert (= (and b!1556183 res!1064674) b!1556184))

(assert (= (and b!1556184 res!1064672) b!1556185))

(assert (= (and start!132882 (is-Cons!36289 l!1177)) b!1556186))

(declare-fun m!1433809 () Bool)

(assert (=> b!1556184 m!1433809))

(declare-fun m!1433811 () Bool)

(assert (=> b!1556185 m!1433811))

(declare-fun m!1433813 () Bool)

(assert (=> b!1556185 m!1433813))

(declare-fun m!1433815 () Bool)

(assert (=> start!132882 m!1433815))

(push 1)

(assert (not start!132882))

(assert (not b!1556184))

(assert tp_is_empty!38357)

(assert (not b!1556186))

(assert (not b!1556185))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162079 () Bool)

(declare-fun res!1064689 () Bool)

(declare-fun e!866726 () Bool)

(assert (=> d!162079 (=> res!1064689 e!866726)))

(assert (=> d!162079 (= res!1064689 (or (is-Nil!36290 l!1177) (is-Nil!36290 (t!51014 l!1177))))))

(assert (=> d!162079 (= (isStrictlySorted!946 l!1177) e!866726)))

(declare-fun b!1556207 () Bool)

(declare-fun e!866727 () Bool)

(assert (=> b!1556207 (= e!866726 e!866727)))

(declare-fun res!1064690 () Bool)

(assert (=> b!1556207 (=> (not res!1064690) (not e!866727))))

(assert (=> b!1556207 (= res!1064690 (bvslt (_1!12458 (h!37735 l!1177)) (_1!12458 (h!37735 (t!51014 l!1177)))))))

(declare-fun b!1556208 () Bool)

(assert (=> b!1556208 (= e!866727 (isStrictlySorted!946 (t!51014 l!1177)))))

(assert (= (and d!162079 (not res!1064689)) b!1556207))

(assert (= (and b!1556207 res!1064690) b!1556208))

(assert (=> b!1556208 m!1433809))

(assert (=> start!132882 d!162079))

(declare-fun d!162087 () Bool)

(declare-fun res!1064691 () Bool)

(declare-fun e!866729 () Bool)

(assert (=> d!162087 (=> res!1064691 e!866729)))

(assert (=> d!162087 (= res!1064691 (or (is-Nil!36290 (t!51014 l!1177)) (is-Nil!36290 (t!51014 (t!51014 l!1177)))))))

(assert (=> d!162087 (= (isStrictlySorted!946 (t!51014 l!1177)) e!866729)))

(declare-fun b!1556211 () Bool)

(declare-fun e!866730 () Bool)

(assert (=> b!1556211 (= e!866729 e!866730)))

(declare-fun res!1064692 () Bool)

(assert (=> b!1556211 (=> (not res!1064692) (not e!866730))))

(assert (=> b!1556211 (= res!1064692 (bvslt (_1!12458 (h!37735 (t!51014 l!1177))) (_1!12458 (h!37735 (t!51014 (t!51014 l!1177))))))))

(declare-fun b!1556212 () Bool)

(assert (=> b!1556212 (= e!866730 (isStrictlySorted!946 (t!51014 (t!51014 l!1177))))))

(assert (= (and d!162087 (not res!1064691)) b!1556211))

(assert (= (and b!1556211 res!1064692) b!1556212))

(declare-fun m!1433821 () Bool)

(assert (=> b!1556212 m!1433821))

(assert (=> b!1556184 d!162087))

(declare-fun d!162091 () Bool)

(declare-fun lt!670388 () Int)

(assert (=> d!162091 (>= lt!670388 0)))

(declare-fun e!866744 () Int)

(assert (=> d!162091 (= lt!670388 e!866744)))

(declare-fun c!143723 () Bool)

(assert (=> d!162091 (= c!143723 (is-Nil!36290 (t!51014 l!1177)))))

(assert (=> d!162091 (= (ListPrimitiveSize!180 (t!51014 l!1177)) lt!670388)))

(declare-fun b!1556232 () Bool)

(assert (=> b!1556232 (= e!866744 0)))

