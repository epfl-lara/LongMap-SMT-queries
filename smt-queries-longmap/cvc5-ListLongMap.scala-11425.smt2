; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133202 () Bool)

(assert start!133202)

(declare-fun b!1558249 () Bool)

(declare-fun res!1065723 () Bool)

(declare-fun e!868044 () Bool)

(assert (=> b!1558249 (=> (not res!1065723) (not e!868044))))

(declare-datatypes ((B!2426 0))(
  ( (B!2427 (val!19299 Int)) )
))
(declare-datatypes ((tuple2!24974 0))(
  ( (tuple2!24975 (_1!12498 (_ BitVec 64)) (_2!12498 B!2426)) )
))
(declare-datatypes ((List!36333 0))(
  ( (Nil!36330) (Cons!36329 (h!37775 tuple2!24974) (t!51060 List!36333)) )
))
(declare-fun l!1292 () List!36333)

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun containsKey!836 (List!36333 (_ BitVec 64)) Bool)

(assert (=> b!1558249 (= res!1065723 (containsKey!836 l!1292 otherKey!62))))

(declare-fun b!1558250 () Bool)

(declare-fun e!868046 () Bool)

(assert (=> b!1558250 (= e!868044 e!868046)))

(declare-fun res!1065722 () Bool)

(assert (=> b!1558250 (=> res!1065722 e!868046)))

(declare-fun isStrictlySorted!973 (List!36333) Bool)

(assert (=> b!1558250 (= res!1065722 (not (isStrictlySorted!973 (t!51060 l!1292))))))

(declare-fun b!1558251 () Bool)

(declare-fun e!868045 () Bool)

(declare-fun tp_is_empty!38431 () Bool)

(declare-fun tp!112620 () Bool)

(assert (=> b!1558251 (= e!868045 (and tp_is_empty!38431 tp!112620))))

(declare-fun b!1558252 () Bool)

(declare-fun res!1065721 () Bool)

(assert (=> b!1558252 (=> (not res!1065721) (not e!868044))))

(declare-fun newKey!135 () (_ BitVec 64))

(assert (=> b!1558252 (= res!1065721 (and (not (= otherKey!62 newKey!135)) (is-Cons!36329 l!1292) (not (= (_1!12498 (h!37775 l!1292)) otherKey!62))))))

(declare-fun b!1558253 () Bool)

(assert (=> b!1558253 (= e!868046 (not (containsKey!836 (t!51060 l!1292) otherKey!62)))))

(declare-fun res!1065724 () Bool)

(assert (=> start!133202 (=> (not res!1065724) (not e!868044))))

(assert (=> start!133202 (= res!1065724 (isStrictlySorted!973 l!1292))))

(assert (=> start!133202 e!868044))

(assert (=> start!133202 e!868045))

(assert (=> start!133202 true))

(assert (= (and start!133202 res!1065724) b!1558249))

(assert (= (and b!1558249 res!1065723) b!1558252))

(assert (= (and b!1558252 res!1065721) b!1558250))

(assert (= (and b!1558250 (not res!1065722)) b!1558253))

(assert (= (and start!133202 (is-Cons!36329 l!1292)) b!1558251))

(declare-fun m!1435005 () Bool)

(assert (=> b!1558249 m!1435005))

(declare-fun m!1435007 () Bool)

(assert (=> b!1558250 m!1435007))

(declare-fun m!1435009 () Bool)

(assert (=> b!1558253 m!1435009))

(declare-fun m!1435011 () Bool)

(assert (=> start!133202 m!1435011))

(push 1)

(assert tp_is_empty!38431)

(assert (not b!1558253))

(assert (not b!1558251))

(assert (not b!1558250))

(assert (not start!133202))

(assert (not b!1558249))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162621 () Bool)

(declare-fun res!1065775 () Bool)

(declare-fun e!868094 () Bool)

(assert (=> d!162621 (=> res!1065775 e!868094)))

(assert (=> d!162621 (= res!1065775 (and (is-Cons!36329 (t!51060 l!1292)) (= (_1!12498 (h!37775 (t!51060 l!1292))) otherKey!62)))))

(assert (=> d!162621 (= (containsKey!836 (t!51060 l!1292) otherKey!62) e!868094)))

(declare-fun b!1558315 () Bool)

(declare-fun e!868095 () Bool)

(assert (=> b!1558315 (= e!868094 e!868095)))

(declare-fun res!1065776 () Bool)

(assert (=> b!1558315 (=> (not res!1065776) (not e!868095))))

(assert (=> b!1558315 (= res!1065776 (and (or (not (is-Cons!36329 (t!51060 l!1292))) (bvsle (_1!12498 (h!37775 (t!51060 l!1292))) otherKey!62)) (is-Cons!36329 (t!51060 l!1292)) (bvslt (_1!12498 (h!37775 (t!51060 l!1292))) otherKey!62)))))

(declare-fun b!1558316 () Bool)

(assert (=> b!1558316 (= e!868095 (containsKey!836 (t!51060 (t!51060 l!1292)) otherKey!62))))

(assert (= (and d!162621 (not res!1065775)) b!1558315))

(assert (= (and b!1558315 res!1065776) b!1558316))

(declare-fun m!1435033 () Bool)

(assert (=> b!1558316 m!1435033))

(assert (=> b!1558253 d!162621))

(declare-fun d!162629 () Bool)

(declare-fun res!1065777 () Bool)

(declare-fun e!868096 () Bool)

(assert (=> d!162629 (=> res!1065777 e!868096)))

(assert (=> d!162629 (= res!1065777 (and (is-Cons!36329 l!1292) (= (_1!12498 (h!37775 l!1292)) otherKey!62)))))

(assert (=> d!162629 (= (containsKey!836 l!1292 otherKey!62) e!868096)))

(declare-fun b!1558317 () Bool)

(declare-fun e!868097 () Bool)

(assert (=> b!1558317 (= e!868096 e!868097)))

(declare-fun res!1065778 () Bool)

(assert (=> b!1558317 (=> (not res!1065778) (not e!868097))))

(assert (=> b!1558317 (= res!1065778 (and (or (not (is-Cons!36329 l!1292)) (bvsle (_1!12498 (h!37775 l!1292)) otherKey!62)) (is-Cons!36329 l!1292) (bvslt (_1!12498 (h!37775 l!1292)) otherKey!62)))))

(declare-fun b!1558318 () Bool)

(assert (=> b!1558318 (= e!868097 (containsKey!836 (t!51060 l!1292) otherKey!62))))

(assert (= (and d!162629 (not res!1065777)) b!1558317))

(assert (= (and b!1558317 res!1065778) b!1558318))

(assert (=> b!1558318 m!1435009))

(assert (=> b!1558249 d!162629))

(declare-fun d!162631 () Bool)

(declare-fun res!1065793 () Bool)

(declare-fun e!868114 () Bool)

(assert (=> d!162631 (=> res!1065793 e!868114)))

(assert (=> d!162631 (= res!1065793 (or (is-Nil!36330 l!1292) (is-Nil!36330 (t!51060 l!1292))))))

(assert (=> d!162631 (= (isStrictlySorted!973 l!1292) e!868114)))

(declare-fun b!1558337 () Bool)

(declare-fun e!868115 () Bool)

(assert (=> b!1558337 (= e!868114 e!868115)))

(declare-fun res!1065794 () Bool)

(assert (=> b!1558337 (=> (not res!1065794) (not e!868115))))

(assert (=> b!1558337 (= res!1065794 (bvslt (_1!12498 (h!37775 l!1292)) (_1!12498 (h!37775 (t!51060 l!1292)))))))

(declare-fun b!1558338 () Bool)

(assert (=> b!1558338 (= e!868115 (isStrictlySorted!973 (t!51060 l!1292)))))

(assert (= (and d!162631 (not res!1065793)) b!1558337))

(assert (= (and b!1558337 res!1065794) b!1558338))

(assert (=> b!1558338 m!1435007))

(assert (=> start!133202 d!162631))

(declare-fun d!162637 () Bool)

(declare-fun res!1065795 () Bool)

(declare-fun e!868117 () Bool)

(assert (=> d!162637 (=> res!1065795 e!868117)))

(assert (=> d!162637 (= res!1065795 (or (is-Nil!36330 (t!51060 l!1292)) (is-Nil!36330 (t!51060 (t!51060 l!1292)))))))

(assert (=> d!162637 (= (isStrictlySorted!973 (t!51060 l!1292)) e!868117)))

(declare-fun b!1558340 () Bool)

(declare-fun e!868118 () Bool)

(assert (=> b!1558340 (= e!868117 e!868118)))

(declare-fun res!1065796 () Bool)

(assert (=> b!1558340 (=> (not res!1065796) (not e!868118))))

(assert (=> b!1558340 (= res!1065796 (bvslt (_1!12498 (h!37775 (t!51060 l!1292))) (_1!12498 (h!37775 (t!51060 (t!51060 l!1292))))))))

(declare-fun b!1558341 () Bool)

(assert (=> b!1558341 (= e!868118 (isStrictlySorted!973 (t!51060 (t!51060 l!1292))))))

(assert (= (and d!162637 (not res!1065795)) b!1558340))

(assert (= (and b!1558340 res!1065796) b!1558341))

(declare-fun m!1435039 () Bool)

(assert (=> b!1558341 m!1435039))

(assert (=> b!1558250 d!162637))

(declare-fun b!1558346 () Bool)

(declare-fun e!868121 () Bool)

(declare-fun tp!112635 () Bool)

(assert (=> b!1558346 (= e!868121 (and tp_is_empty!38431 tp!112635))))

(assert (=> b!1558251 (= tp!112620 e!868121)))

(assert (= (and b!1558251 (is-Cons!36329 (t!51060 l!1292))) b!1558346))

(push 1)

