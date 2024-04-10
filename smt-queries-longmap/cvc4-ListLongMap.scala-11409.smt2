; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132852 () Bool)

(assert start!132852)

(declare-fun res!1064586 () Bool)

(declare-fun e!866602 () Bool)

(assert (=> start!132852 (=> (not res!1064586) (not e!866602))))

(declare-datatypes ((B!2334 0))(
  ( (B!2335 (val!19253 Int)) )
))
(declare-datatypes ((tuple2!24882 0))(
  ( (tuple2!24883 (_1!12452 (_ BitVec 64)) (_2!12452 B!2334)) )
))
(declare-datatypes ((List!36287 0))(
  ( (Nil!36284) (Cons!36283 (h!37729 tuple2!24882) (t!51008 List!36287)) )
))
(declare-fun l!1177 () List!36287)

(declare-fun isStrictlySorted!940 (List!36287) Bool)

(assert (=> start!132852 (= res!1064586 (isStrictlySorted!940 l!1177))))

(assert (=> start!132852 e!866602))

(declare-fun e!866603 () Bool)

(assert (=> start!132852 e!866603))

(assert (=> start!132852 true))

(declare-fun b!1556031 () Bool)

(declare-fun res!1064587 () Bool)

(assert (=> b!1556031 (=> (not res!1064587) (not e!866602))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(assert (=> b!1556031 (= res!1064587 (not (= newKey!105 otherKey!50)))))

(declare-fun b!1556032 () Bool)

(declare-fun ListPrimitiveSize!177 (List!36287) Int)

(assert (=> b!1556032 (= e!866602 (< (ListPrimitiveSize!177 l!1177) 0))))

(declare-fun b!1556033 () Bool)

(declare-fun tp_is_empty!38345 () Bool)

(declare-fun tp!112377 () Bool)

(assert (=> b!1556033 (= e!866603 (and tp_is_empty!38345 tp!112377))))

(assert (= (and start!132852 res!1064586) b!1556031))

(assert (= (and b!1556031 res!1064587) b!1556032))

(assert (= (and start!132852 (is-Cons!36283 l!1177)) b!1556033))

(declare-fun m!1433759 () Bool)

(assert (=> start!132852 m!1433759))

(declare-fun m!1433761 () Bool)

(assert (=> b!1556032 m!1433761))

(push 1)

(assert (not b!1556032))

(assert (not start!132852))

(assert (not b!1556033))

(assert tp_is_empty!38345)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162051 () Bool)

(declare-fun lt!670376 () Int)

(assert (=> d!162051 (>= lt!670376 0)))

(declare-fun e!866611 () Int)

(assert (=> d!162051 (= lt!670376 e!866611)))

(declare-fun c!143711 () Bool)

(assert (=> d!162051 (= c!143711 (is-Nil!36284 l!1177))))

(assert (=> d!162051 (= (ListPrimitiveSize!177 l!1177) lt!670376)))

(declare-fun b!1556046 () Bool)

(assert (=> b!1556046 (= e!866611 0)))

(declare-fun b!1556047 () Bool)

(assert (=> b!1556047 (= e!866611 (+ 1 (ListPrimitiveSize!177 (t!51008 l!1177))))))

(assert (= (and d!162051 c!143711) b!1556046))

(assert (= (and d!162051 (not c!143711)) b!1556047))

(declare-fun m!1433765 () Bool)

(assert (=> b!1556047 m!1433765))

(assert (=> b!1556032 d!162051))

(declare-fun d!162057 () Bool)

(declare-fun res!1064604 () Bool)

(declare-fun e!866630 () Bool)

(assert (=> d!162057 (=> res!1064604 e!866630)))

(assert (=> d!162057 (= res!1064604 (or (is-Nil!36284 l!1177) (is-Nil!36284 (t!51008 l!1177))))))

(assert (=> d!162057 (= (isStrictlySorted!940 l!1177) e!866630)))

(declare-fun b!1556070 () Bool)

(declare-fun e!866631 () Bool)

(assert (=> b!1556070 (= e!866630 e!866631)))

(declare-fun res!1064605 () Bool)

(assert (=> b!1556070 (=> (not res!1064605) (not e!866631))))

(assert (=> b!1556070 (= res!1064605 (bvslt (_1!12452 (h!37729 l!1177)) (_1!12452 (h!37729 (t!51008 l!1177)))))))

(declare-fun b!1556071 () Bool)

(assert (=> b!1556071 (= e!866631 (isStrictlySorted!940 (t!51008 l!1177)))))

