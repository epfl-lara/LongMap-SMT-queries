; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138038 () Bool)

(assert start!138038)

(declare-fun b!1584264 () Bool)

(declare-fun e!884372 () Bool)

(declare-fun tp_is_empty!39449 () Bool)

(declare-fun tp!115090 () Bool)

(assert (=> b!1584264 (= e!884372 (and tp_is_empty!39449 tp!115090))))

(declare-fun b!1584265 () Bool)

(declare-fun res!1082105 () Bool)

(declare-fun e!884374 () Bool)

(assert (=> b!1584265 (=> (not res!1082105) (not e!884374))))

(declare-fun newKey!123 () (_ BitVec 64))

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-datatypes ((B!2916 0))(
  ( (B!2917 (val!19820 Int)) )
))
(declare-datatypes ((tuple2!25808 0))(
  ( (tuple2!25809 (_1!12915 (_ BitVec 64)) (_2!12915 B!2916)) )
))
(declare-datatypes ((List!36940 0))(
  ( (Nil!36937) (Cons!36936 (h!38479 tuple2!25808) (t!51854 List!36940)) )
))
(declare-fun l!1251 () List!36940)

(assert (=> b!1584265 (= res!1082105 (and (not (= otherKey!56 newKey!123)) (is-Cons!36936 l!1251)))))

(declare-fun b!1584266 () Bool)

(declare-fun e!884373 () Bool)

(assert (=> b!1584266 (= e!884374 e!884373)))

(declare-fun res!1082107 () Bool)

(assert (=> b!1584266 (=> res!1082107 e!884373)))

(declare-fun isStrictlySorted!1165 (List!36940) Bool)

(assert (=> b!1584266 (= res!1082107 (not (isStrictlySorted!1165 (t!51854 l!1251))))))

(declare-fun b!1584267 () Bool)

(declare-fun res!1082108 () Bool)

(assert (=> b!1584267 (=> (not res!1082108) (not e!884374))))

(declare-fun containsKey!999 (List!36940 (_ BitVec 64)) Bool)

(assert (=> b!1584267 (= res!1082108 (not (containsKey!999 l!1251 otherKey!56)))))

(declare-fun res!1082106 () Bool)

(assert (=> start!138038 (=> (not res!1082106) (not e!884374))))

(assert (=> start!138038 (= res!1082106 (isStrictlySorted!1165 l!1251))))

(assert (=> start!138038 e!884374))

(assert (=> start!138038 e!884372))

(assert (=> start!138038 true))

(declare-fun b!1584268 () Bool)

(assert (=> b!1584268 (= e!884373 (containsKey!999 (t!51854 l!1251) otherKey!56))))

(assert (= (and start!138038 res!1082106) b!1584267))

(assert (= (and b!1584267 res!1082108) b!1584265))

(assert (= (and b!1584265 res!1082105) b!1584266))

(assert (= (and b!1584266 (not res!1082107)) b!1584268))

(assert (= (and start!138038 (is-Cons!36936 l!1251)) b!1584264))

(declare-fun m!1453665 () Bool)

(assert (=> b!1584266 m!1453665))

(declare-fun m!1453667 () Bool)

(assert (=> b!1584267 m!1453667))

(declare-fun m!1453669 () Bool)

(assert (=> start!138038 m!1453669))

(declare-fun m!1453671 () Bool)

(assert (=> b!1584268 m!1453671))

(push 1)

(assert (not start!138038))

(assert (not b!1584268))

(assert (not b!1584264))

(assert tp_is_empty!39449)

(assert (not b!1584266))

(assert (not b!1584267))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167377 () Bool)

(declare-fun res!1082123 () Bool)

(declare-fun e!884389 () Bool)

(assert (=> d!167377 (=> res!1082123 e!884389)))

(assert (=> d!167377 (= res!1082123 (and (is-Cons!36936 l!1251) (= (_1!12915 (h!38479 l!1251)) otherKey!56)))))

(assert (=> d!167377 (= (containsKey!999 l!1251 otherKey!56) e!884389)))

(declare-fun b!1584283 () Bool)

(declare-fun e!884390 () Bool)

(assert (=> b!1584283 (= e!884389 e!884390)))

(declare-fun res!1082124 () Bool)

(assert (=> b!1584283 (=> (not res!1082124) (not e!884390))))

(assert (=> b!1584283 (= res!1082124 (and (or (not (is-Cons!36936 l!1251)) (bvsle (_1!12915 (h!38479 l!1251)) otherKey!56)) (is-Cons!36936 l!1251) (bvslt (_1!12915 (h!38479 l!1251)) otherKey!56)))))

(declare-fun b!1584284 () Bool)

(assert (=> b!1584284 (= e!884390 (containsKey!999 (t!51854 l!1251) otherKey!56))))

(assert (= (and d!167377 (not res!1082123)) b!1584283))

(assert (= (and b!1584283 res!1082124) b!1584284))

(assert (=> b!1584284 m!1453671))

(assert (=> b!1584267 d!167377))

(declare-fun d!167383 () Bool)

(declare-fun res!1082125 () Bool)

(declare-fun e!884391 () Bool)

(assert (=> d!167383 (=> res!1082125 e!884391)))

(assert (=> d!167383 (= res!1082125 (and (is-Cons!36936 (t!51854 l!1251)) (= (_1!12915 (h!38479 (t!51854 l!1251))) otherKey!56)))))

(assert (=> d!167383 (= (containsKey!999 (t!51854 l!1251) otherKey!56) e!884391)))

(declare-fun b!1584285 () Bool)

(declare-fun e!884392 () Bool)

(assert (=> b!1584285 (= e!884391 e!884392)))

(declare-fun res!1082126 () Bool)

(assert (=> b!1584285 (=> (not res!1082126) (not e!884392))))

(assert (=> b!1584285 (= res!1082126 (and (or (not (is-Cons!36936 (t!51854 l!1251))) (bvsle (_1!12915 (h!38479 (t!51854 l!1251))) otherKey!56)) (is-Cons!36936 (t!51854 l!1251)) (bvslt (_1!12915 (h!38479 (t!51854 l!1251))) otherKey!56)))))

(declare-fun b!1584286 () Bool)

(assert (=> b!1584286 (= e!884392 (containsKey!999 (t!51854 (t!51854 l!1251)) otherKey!56))))

(assert (= (and d!167383 (not res!1082125)) b!1584285))

(assert (= (and b!1584285 res!1082126) b!1584286))

(declare-fun m!1453675 () Bool)

(assert (=> b!1584286 m!1453675))

(assert (=> b!1584268 d!167383))

(declare-fun d!167385 () Bool)

(declare-fun res!1082145 () Bool)

(declare-fun e!884411 () Bool)

(assert (=> d!167385 (=> res!1082145 e!884411)))

(assert (=> d!167385 (= res!1082145 (or (is-Nil!36937 l!1251) (is-Nil!36937 (t!51854 l!1251))))))

(assert (=> d!167385 (= (isStrictlySorted!1165 l!1251) e!884411)))

(declare-fun b!1584305 () Bool)

(declare-fun e!884412 () Bool)

(assert (=> b!1584305 (= e!884411 e!884412)))

(declare-fun res!1082146 () Bool)

(assert (=> b!1584305 (=> (not res!1082146) (not e!884412))))

(assert (=> b!1584305 (= res!1082146 (bvslt (_1!12915 (h!38479 l!1251)) (_1!12915 (h!38479 (t!51854 l!1251)))))))

(declare-fun b!1584306 () Bool)

(assert (=> b!1584306 (= e!884412 (isStrictlySorted!1165 (t!51854 l!1251)))))

(assert (= (and d!167385 (not res!1082145)) b!1584305))

(assert (= (and b!1584305 res!1082146) b!1584306))

(assert (=> b!1584306 m!1453665))

(assert (=> start!138038 d!167385))

(declare-fun d!167393 () Bool)

(declare-fun res!1082149 () Bool)

(declare-fun e!884415 () Bool)

(assert (=> d!167393 (=> res!1082149 e!884415)))

(assert (=> d!167393 (= res!1082149 (or (is-Nil!36937 (t!51854 l!1251)) (is-Nil!36937 (t!51854 (t!51854 l!1251)))))))

(assert (=> d!167393 (= (isStrictlySorted!1165 (t!51854 l!1251)) e!884415)))

(declare-fun b!1584309 () Bool)

(declare-fun e!884416 () Bool)

(assert (=> b!1584309 (= e!884415 e!884416)))

(declare-fun res!1082150 () Bool)

(assert (=> b!1584309 (=> (not res!1082150) (not e!884416))))

(assert (=> b!1584309 (= res!1082150 (bvslt (_1!12915 (h!38479 (t!51854 l!1251))) (_1!12915 (h!38479 (t!51854 (t!51854 l!1251))))))))

(declare-fun b!1584310 () Bool)

(assert (=> b!1584310 (= e!884416 (isStrictlySorted!1165 (t!51854 (t!51854 l!1251))))))

(assert (= (and d!167393 (not res!1082149)) b!1584309))

(assert (= (and b!1584309 res!1082150) b!1584310))

(declare-fun m!1453679 () Bool)

(assert (=> b!1584310 m!1453679))

(assert (=> b!1584266 d!167393))

(declare-fun b!1584322 () Bool)

(declare-fun e!884424 () Bool)

(declare-fun tp!115096 () Bool)

(assert (=> b!1584322 (= e!884424 (and tp_is_empty!39449 tp!115096))))

(assert (=> b!1584264 (= tp!115090 e!884424)))

(assert (= (and b!1584264 (is-Cons!36936 (t!51854 l!1251))) b!1584322))

(push 1)

(assert (not b!1584284))

(assert (not b!1584286))

(assert (not b!1584322))

(assert tp_is_empty!39449)

(assert (not b!1584306))

(assert (not b!1584310))

(check-sat)

(pop 1)

(push 1)

(check-sat)

