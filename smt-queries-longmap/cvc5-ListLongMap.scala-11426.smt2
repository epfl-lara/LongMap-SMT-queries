; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133220 () Bool)

(assert start!133220)

(declare-fun b!1558359 () Bool)

(declare-fun e!868127 () Bool)

(declare-fun tp_is_empty!38437 () Bool)

(declare-fun tp!112638 () Bool)

(assert (=> b!1558359 (= e!868127 (and tp_is_empty!38437 tp!112638))))

(declare-fun b!1558360 () Bool)

(declare-fun e!868126 () Bool)

(declare-datatypes ((B!2432 0))(
  ( (B!2433 (val!19302 Int)) )
))
(declare-datatypes ((tuple2!24980 0))(
  ( (tuple2!24981 (_1!12501 (_ BitVec 64)) (_2!12501 B!2432)) )
))
(declare-datatypes ((List!36336 0))(
  ( (Nil!36333) (Cons!36332 (h!37778 tuple2!24980) (t!51063 List!36336)) )
))
(declare-fun l!1292 () List!36336)

(declare-fun ListPrimitiveSize!184 (List!36336) Int)

(assert (=> b!1558360 (= e!868126 (>= (ListPrimitiveSize!184 (t!51063 l!1292)) (ListPrimitiveSize!184 l!1292)))))

(declare-fun b!1558361 () Bool)

(declare-fun res!1065811 () Bool)

(assert (=> b!1558361 (=> (not res!1065811) (not e!868126))))

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun newKey!135 () (_ BitVec 64))

(assert (=> b!1558361 (= res!1065811 (and (not (= otherKey!62 newKey!135)) (is-Cons!36332 l!1292) (not (= (_1!12501 (h!37778 l!1292)) otherKey!62))))))

(declare-fun res!1065808 () Bool)

(assert (=> start!133220 (=> (not res!1065808) (not e!868126))))

(declare-fun isStrictlySorted!976 (List!36336) Bool)

(assert (=> start!133220 (= res!1065808 (isStrictlySorted!976 l!1292))))

(assert (=> start!133220 e!868126))

(assert (=> start!133220 e!868127))

(assert (=> start!133220 true))

(declare-fun b!1558362 () Bool)

(declare-fun res!1065809 () Bool)

(assert (=> b!1558362 (=> (not res!1065809) (not e!868126))))

(declare-fun containsKey!839 (List!36336 (_ BitVec 64)) Bool)

(assert (=> b!1558362 (= res!1065809 (containsKey!839 l!1292 otherKey!62))))

(declare-fun b!1558363 () Bool)

(declare-fun res!1065810 () Bool)

(assert (=> b!1558363 (=> (not res!1065810) (not e!868126))))

(assert (=> b!1558363 (= res!1065810 (isStrictlySorted!976 (t!51063 l!1292)))))

(declare-fun b!1558364 () Bool)

(declare-fun res!1065807 () Bool)

(assert (=> b!1558364 (=> (not res!1065807) (not e!868126))))

(assert (=> b!1558364 (= res!1065807 (containsKey!839 (t!51063 l!1292) otherKey!62))))

(assert (= (and start!133220 res!1065808) b!1558362))

(assert (= (and b!1558362 res!1065809) b!1558361))

(assert (= (and b!1558361 res!1065811) b!1558363))

(assert (= (and b!1558363 res!1065810) b!1558364))

(assert (= (and b!1558364 res!1065807) b!1558360))

(assert (= (and start!133220 (is-Cons!36332 l!1292)) b!1558359))

(declare-fun m!1435041 () Bool)

(assert (=> b!1558362 m!1435041))

(declare-fun m!1435043 () Bool)

(assert (=> b!1558364 m!1435043))

(declare-fun m!1435045 () Bool)

(assert (=> b!1558363 m!1435045))

(declare-fun m!1435047 () Bool)

(assert (=> b!1558360 m!1435047))

(declare-fun m!1435049 () Bool)

(assert (=> b!1558360 m!1435049))

(declare-fun m!1435051 () Bool)

(assert (=> start!133220 m!1435051))

(push 1)

(assert (not b!1558364))

(assert (not b!1558362))

(assert (not b!1558359))

(assert (not start!133220))

(assert (not b!1558360))

(assert tp_is_empty!38437)

(assert (not b!1558363))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162651 () Bool)

(declare-fun res!1065862 () Bool)

(declare-fun e!868168 () Bool)

(assert (=> d!162651 (=> res!1065862 e!868168)))

(assert (=> d!162651 (= res!1065862 (and (is-Cons!36332 l!1292) (= (_1!12501 (h!37778 l!1292)) otherKey!62)))))

(assert (=> d!162651 (= (containsKey!839 l!1292 otherKey!62) e!868168)))

(declare-fun b!1558437 () Bool)

(declare-fun e!868169 () Bool)

(assert (=> b!1558437 (= e!868168 e!868169)))

(declare-fun res!1065863 () Bool)

(assert (=> b!1558437 (=> (not res!1065863) (not e!868169))))

(assert (=> b!1558437 (= res!1065863 (and (or (not (is-Cons!36332 l!1292)) (bvsle (_1!12501 (h!37778 l!1292)) otherKey!62)) (is-Cons!36332 l!1292) (bvslt (_1!12501 (h!37778 l!1292)) otherKey!62)))))

(declare-fun b!1558438 () Bool)

(assert (=> b!1558438 (= e!868169 (containsKey!839 (t!51063 l!1292) otherKey!62))))

(assert (= (and d!162651 (not res!1065862)) b!1558437))

(assert (= (and b!1558437 res!1065863) b!1558438))

(assert (=> b!1558438 m!1435043))

(assert (=> b!1558362 d!162651))

(declare-fun d!162663 () Bool)

(declare-fun res!1065880 () Bool)

(declare-fun e!868188 () Bool)

(assert (=> d!162663 (=> res!1065880 e!868188)))

(assert (=> d!162663 (= res!1065880 (or (is-Nil!36333 l!1292) (is-Nil!36333 (t!51063 l!1292))))))

(assert (=> d!162663 (= (isStrictlySorted!976 l!1292) e!868188)))

(declare-fun b!1558459 () Bool)

(declare-fun e!868189 () Bool)

(assert (=> b!1558459 (= e!868188 e!868189)))

(declare-fun res!1065881 () Bool)

(assert (=> b!1558459 (=> (not res!1065881) (not e!868189))))

(assert (=> b!1558459 (= res!1065881 (bvslt (_1!12501 (h!37778 l!1292)) (_1!12501 (h!37778 (t!51063 l!1292)))))))

(declare-fun b!1558460 () Bool)

(assert (=> b!1558460 (= e!868189 (isStrictlySorted!976 (t!51063 l!1292)))))

(assert (= (and d!162663 (not res!1065880)) b!1558459))

(assert (= (and b!1558459 res!1065881) b!1558460))

(assert (=> b!1558460 m!1435045))

(assert (=> start!133220 d!162663))

(declare-fun d!162667 () Bool)

(declare-fun res!1065884 () Bool)

(declare-fun e!868192 () Bool)

(assert (=> d!162667 (=> res!1065884 e!868192)))

(assert (=> d!162667 (= res!1065884 (or (is-Nil!36333 (t!51063 l!1292)) (is-Nil!36333 (t!51063 (t!51063 l!1292)))))))

(assert (=> d!162667 (= (isStrictlySorted!976 (t!51063 l!1292)) e!868192)))

(declare-fun b!1558463 () Bool)

(declare-fun e!868193 () Bool)

(assert (=> b!1558463 (= e!868192 e!868193)))

(declare-fun res!1065885 () Bool)

(assert (=> b!1558463 (=> (not res!1065885) (not e!868193))))

(assert (=> b!1558463 (= res!1065885 (bvslt (_1!12501 (h!37778 (t!51063 l!1292))) (_1!12501 (h!37778 (t!51063 (t!51063 l!1292))))))))

(declare-fun b!1558464 () Bool)

(assert (=> b!1558464 (= e!868193 (isStrictlySorted!976 (t!51063 (t!51063 l!1292))))))

(assert (= (and d!162667 (not res!1065884)) b!1558463))

(assert (= (and b!1558463 res!1065885) b!1558464))

(declare-fun m!1435087 () Bool)

(assert (=> b!1558464 m!1435087))

(assert (=> b!1558363 d!162667))

(declare-fun d!162671 () Bool)

(declare-fun res!1065888 () Bool)

(declare-fun e!868197 () Bool)

(assert (=> d!162671 (=> res!1065888 e!868197)))

(assert (=> d!162671 (= res!1065888 (and (is-Cons!36332 (t!51063 l!1292)) (= (_1!12501 (h!37778 (t!51063 l!1292))) otherKey!62)))))

(assert (=> d!162671 (= (containsKey!839 (t!51063 l!1292) otherKey!62) e!868197)))

(declare-fun b!1558468 () Bool)

(declare-fun e!868198 () Bool)

(assert (=> b!1558468 (= e!868197 e!868198)))

(declare-fun res!1065889 () Bool)

(assert (=> b!1558468 (=> (not res!1065889) (not e!868198))))

(assert (=> b!1558468 (= res!1065889 (and (or (not (is-Cons!36332 (t!51063 l!1292))) (bvsle (_1!12501 (h!37778 (t!51063 l!1292))) otherKey!62)) (is-Cons!36332 (t!51063 l!1292)) (bvslt (_1!12501 (h!37778 (t!51063 l!1292))) otherKey!62)))))

(declare-fun b!1558469 () Bool)

(assert (=> b!1558469 (= e!868198 (containsKey!839 (t!51063 (t!51063 l!1292)) otherKey!62))))

(assert (= (and d!162671 (not res!1065888)) b!1558468))

(assert (= (and b!1558468 res!1065889) b!1558469))

(declare-fun m!1435091 () Bool)

(assert (=> b!1558469 m!1435091))

(assert (=> b!1558364 d!162671))

(declare-fun d!162673 () Bool)

(declare-fun lt!670783 () Int)

(assert (=> d!162673 (>= lt!670783 0)))

(declare-fun e!868204 () Int)

(assert (=> d!162673 (= lt!670783 e!868204)))

(declare-fun c!144103 () Bool)

(assert (=> d!162673 (= c!144103 (is-Nil!36333 (t!51063 l!1292)))))

(assert (=> d!162673 (= (ListPrimitiveSize!184 (t!51063 l!1292)) lt!670783)))

(declare-fun b!1558479 () Bool)

(assert (=> b!1558479 (= e!868204 0)))

(declare-fun b!1558480 () Bool)

(assert (=> b!1558480 (= e!868204 (+ 1 (ListPrimitiveSize!184 (t!51063 (t!51063 l!1292)))))))

(assert (= (and d!162673 c!144103) b!1558479))

(assert (= (and d!162673 (not c!144103)) b!1558480))

(declare-fun m!1435093 () Bool)

(assert (=> b!1558480 m!1435093))

(assert (=> b!1558360 d!162673))

(declare-fun d!162675 () Bool)

(declare-fun lt!670784 () Int)

(assert (=> d!162675 (>= lt!670784 0)))

(declare-fun e!868205 () Int)

(assert (=> d!162675 (= lt!670784 e!868205)))

(declare-fun c!144104 () Bool)

(assert (=> d!162675 (= c!144104 (is-Nil!36333 l!1292))))

(assert (=> d!162675 (= (ListPrimitiveSize!184 l!1292) lt!670784)))

(declare-fun b!1558481 () Bool)

(assert (=> b!1558481 (= e!868205 0)))

(declare-fun b!1558482 () Bool)

(assert (=> b!1558482 (= e!868205 (+ 1 (ListPrimitiveSize!184 (t!51063 l!1292))))))

(assert (= (and d!162675 c!144104) b!1558481))

(assert (= (and d!162675 (not c!144104)) b!1558482))

(assert (=> b!1558482 m!1435047))

(assert (=> b!1558360 d!162675))

(declare-fun b!1558487 () Bool)

(declare-fun e!868208 () Bool)

(declare-fun tp!112653 () Bool)

(assert (=> b!1558487 (= e!868208 (and tp_is_empty!38437 tp!112653))))

(assert (=> b!1558359 (= tp!112638 e!868208)))

(assert (= (and b!1558359 (is-Cons!36332 (t!51063 l!1292))) b!1558487))

(push 1)

(assert (not b!1558487))

(assert (not b!1558460))

(assert (not b!1558438))

(assert tp_is_empty!38437)

(assert (not b!1558469))

(assert (not b!1558464))

(assert (not b!1558482))

(assert (not b!1558480))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

