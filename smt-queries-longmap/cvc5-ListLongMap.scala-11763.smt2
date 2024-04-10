; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138052 () Bool)

(assert start!138052)

(declare-fun res!1082168 () Bool)

(declare-fun e!884436 () Bool)

(assert (=> start!138052 (=> (not res!1082168) (not e!884436))))

(declare-datatypes ((B!2918 0))(
  ( (B!2919 (val!19821 Int)) )
))
(declare-datatypes ((tuple2!25810 0))(
  ( (tuple2!25811 (_1!12916 (_ BitVec 64)) (_2!12916 B!2918)) )
))
(declare-datatypes ((List!36941 0))(
  ( (Nil!36938) (Cons!36937 (h!38480 tuple2!25810) (t!51855 List!36941)) )
))
(declare-fun l!1251 () List!36941)

(declare-fun isStrictlySorted!1166 (List!36941) Bool)

(assert (=> start!138052 (= res!1082168 (isStrictlySorted!1166 l!1251))))

(assert (=> start!138052 e!884436))

(declare-fun e!884437 () Bool)

(assert (=> start!138052 e!884437))

(assert (=> start!138052 true))

(declare-fun b!1584344 () Bool)

(declare-fun res!1082171 () Bool)

(assert (=> b!1584344 (=> (not res!1082171) (not e!884436))))

(declare-fun newKey!123 () (_ BitVec 64))

(declare-fun otherKey!56 () (_ BitVec 64))

(assert (=> b!1584344 (= res!1082171 (and (not (= otherKey!56 newKey!123)) (is-Cons!36937 l!1251)))))

(declare-fun b!1584345 () Bool)

(declare-fun res!1082169 () Bool)

(assert (=> b!1584345 (=> (not res!1082169) (not e!884436))))

(declare-fun containsKey!1000 (List!36941 (_ BitVec 64)) Bool)

(assert (=> b!1584345 (= res!1082169 (not (containsKey!1000 l!1251 otherKey!56)))))

(declare-fun b!1584346 () Bool)

(declare-fun ListPrimitiveSize!220 (List!36941) Int)

(assert (=> b!1584346 (= e!884436 (>= (ListPrimitiveSize!220 (t!51855 l!1251)) (ListPrimitiveSize!220 l!1251)))))

(declare-fun b!1584347 () Bool)

(declare-fun res!1082170 () Bool)

(assert (=> b!1584347 (=> (not res!1082170) (not e!884436))))

(assert (=> b!1584347 (= res!1082170 (isStrictlySorted!1166 (t!51855 l!1251)))))

(declare-fun b!1584348 () Bool)

(declare-fun res!1082167 () Bool)

(assert (=> b!1584348 (=> (not res!1082167) (not e!884436))))

(assert (=> b!1584348 (= res!1082167 (not (containsKey!1000 (t!51855 l!1251) otherKey!56)))))

(declare-fun b!1584349 () Bool)

(declare-fun tp_is_empty!39451 () Bool)

(declare-fun tp!115102 () Bool)

(assert (=> b!1584349 (= e!884437 (and tp_is_empty!39451 tp!115102))))

(assert (= (and start!138052 res!1082168) b!1584345))

(assert (= (and b!1584345 res!1082169) b!1584344))

(assert (= (and b!1584344 res!1082171) b!1584347))

(assert (= (and b!1584347 res!1082170) b!1584348))

(assert (= (and b!1584348 res!1082167) b!1584346))

(assert (= (and start!138052 (is-Cons!36937 l!1251)) b!1584349))

(declare-fun m!1453685 () Bool)

(assert (=> b!1584347 m!1453685))

(declare-fun m!1453687 () Bool)

(assert (=> b!1584345 m!1453687))

(declare-fun m!1453689 () Bool)

(assert (=> start!138052 m!1453689))

(declare-fun m!1453691 () Bool)

(assert (=> b!1584348 m!1453691))

(declare-fun m!1453693 () Bool)

(assert (=> b!1584346 m!1453693))

(declare-fun m!1453695 () Bool)

(assert (=> b!1584346 m!1453695))

(push 1)

(assert (not b!1584349))

(assert tp_is_empty!39451)

(assert (not b!1584347))

(assert (not b!1584348))

(assert (not start!138052))

(assert (not b!1584346))

(assert (not b!1584345))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167405 () Bool)

(declare-fun res!1082224 () Bool)

(declare-fun e!884476 () Bool)

(assert (=> d!167405 (=> res!1082224 e!884476)))

(assert (=> d!167405 (= res!1082224 (and (is-Cons!36937 l!1251) (= (_1!12916 (h!38480 l!1251)) otherKey!56)))))

(assert (=> d!167405 (= (containsKey!1000 l!1251 otherKey!56) e!884476)))

(declare-fun b!1584416 () Bool)

(declare-fun e!884477 () Bool)

(assert (=> b!1584416 (= e!884476 e!884477)))

(declare-fun res!1082225 () Bool)

(assert (=> b!1584416 (=> (not res!1082225) (not e!884477))))

(assert (=> b!1584416 (= res!1082225 (and (or (not (is-Cons!36937 l!1251)) (bvsle (_1!12916 (h!38480 l!1251)) otherKey!56)) (is-Cons!36937 l!1251) (bvslt (_1!12916 (h!38480 l!1251)) otherKey!56)))))

(declare-fun b!1584417 () Bool)

(assert (=> b!1584417 (= e!884477 (containsKey!1000 (t!51855 l!1251) otherKey!56))))

(assert (= (and d!167405 (not res!1082224)) b!1584416))

(assert (= (and b!1584416 res!1082225) b!1584417))

(assert (=> b!1584417 m!1453691))

(assert (=> b!1584345 d!167405))

(declare-fun d!167417 () Bool)

(declare-fun lt!677253 () Int)

(assert (=> d!167417 (>= lt!677253 0)))

(declare-fun e!884497 () Int)

(assert (=> d!167417 (= lt!677253 e!884497)))

(declare-fun c!146852 () Bool)

(assert (=> d!167417 (= c!146852 (is-Nil!36938 (t!51855 l!1251)))))

(assert (=> d!167417 (= (ListPrimitiveSize!220 (t!51855 l!1251)) lt!677253)))

(declare-fun b!1584443 () Bool)

(assert (=> b!1584443 (= e!884497 0)))

(declare-fun b!1584444 () Bool)

(assert (=> b!1584444 (= e!884497 (+ 1 (ListPrimitiveSize!220 (t!51855 (t!51855 l!1251)))))))

(assert (= (and d!167417 c!146852) b!1584443))

(assert (= (and d!167417 (not c!146852)) b!1584444))

(declare-fun m!1453729 () Bool)

(assert (=> b!1584444 m!1453729))

(assert (=> b!1584346 d!167417))

(declare-fun d!167425 () Bool)

(declare-fun lt!677254 () Int)

(assert (=> d!167425 (>= lt!677254 0)))

(declare-fun e!884498 () Int)

(assert (=> d!167425 (= lt!677254 e!884498)))

(declare-fun c!146853 () Bool)

(assert (=> d!167425 (= c!146853 (is-Nil!36938 l!1251))))

(assert (=> d!167425 (= (ListPrimitiveSize!220 l!1251) lt!677254)))

(declare-fun b!1584445 () Bool)

(assert (=> b!1584445 (= e!884498 0)))

(declare-fun b!1584446 () Bool)

(assert (=> b!1584446 (= e!884498 (+ 1 (ListPrimitiveSize!220 (t!51855 l!1251))))))

(assert (= (and d!167425 c!146853) b!1584445))

(assert (= (and d!167425 (not c!146853)) b!1584446))

(assert (=> b!1584446 m!1453693))

(assert (=> b!1584346 d!167425))

(declare-fun d!167427 () Bool)

(declare-fun res!1082244 () Bool)

(declare-fun e!884510 () Bool)

(assert (=> d!167427 (=> res!1082244 e!884510)))

(assert (=> d!167427 (= res!1082244 (or (is-Nil!36938 (t!51855 l!1251)) (is-Nil!36938 (t!51855 (t!51855 l!1251)))))))

(assert (=> d!167427 (= (isStrictlySorted!1166 (t!51855 l!1251)) e!884510)))

(declare-fun b!1584462 () Bool)

(declare-fun e!884511 () Bool)

(assert (=> b!1584462 (= e!884510 e!884511)))

(declare-fun res!1082245 () Bool)

(assert (=> b!1584462 (=> (not res!1082245) (not e!884511))))

(assert (=> b!1584462 (= res!1082245 (bvslt (_1!12916 (h!38480 (t!51855 l!1251))) (_1!12916 (h!38480 (t!51855 (t!51855 l!1251))))))))

(declare-fun b!1584463 () Bool)

(assert (=> b!1584463 (= e!884511 (isStrictlySorted!1166 (t!51855 (t!51855 l!1251))))))

(assert (= (and d!167427 (not res!1082244)) b!1584462))

(assert (= (and b!1584462 res!1082245) b!1584463))

(declare-fun m!1453735 () Bool)

(assert (=> b!1584463 m!1453735))

(assert (=> b!1584347 d!167427))

(declare-fun d!167433 () Bool)

(declare-fun res!1082246 () Bool)

(declare-fun e!884512 () Bool)

(assert (=> d!167433 (=> res!1082246 e!884512)))

(assert (=> d!167433 (= res!1082246 (or (is-Nil!36938 l!1251) (is-Nil!36938 (t!51855 l!1251))))))

(assert (=> d!167433 (= (isStrictlySorted!1166 l!1251) e!884512)))

(declare-fun b!1584464 () Bool)

(declare-fun e!884513 () Bool)

(assert (=> b!1584464 (= e!884512 e!884513)))

(declare-fun res!1082247 () Bool)

(assert (=> b!1584464 (=> (not res!1082247) (not e!884513))))

(assert (=> b!1584464 (= res!1082247 (bvslt (_1!12916 (h!38480 l!1251)) (_1!12916 (h!38480 (t!51855 l!1251)))))))

(declare-fun b!1584465 () Bool)

(assert (=> b!1584465 (= e!884513 (isStrictlySorted!1166 (t!51855 l!1251)))))

(assert (= (and d!167433 (not res!1082246)) b!1584464))

(assert (= (and b!1584464 res!1082247) b!1584465))

(assert (=> b!1584465 m!1453685))

(assert (=> start!138052 d!167433))

(declare-fun d!167435 () Bool)

(declare-fun res!1082248 () Bool)

(declare-fun e!884514 () Bool)

(assert (=> d!167435 (=> res!1082248 e!884514)))

(assert (=> d!167435 (= res!1082248 (and (is-Cons!36937 (t!51855 l!1251)) (= (_1!12916 (h!38480 (t!51855 l!1251))) otherKey!56)))))

(assert (=> d!167435 (= (containsKey!1000 (t!51855 l!1251) otherKey!56) e!884514)))

(declare-fun b!1584466 () Bool)

(declare-fun e!884515 () Bool)

(assert (=> b!1584466 (= e!884514 e!884515)))

(declare-fun res!1082249 () Bool)

(assert (=> b!1584466 (=> (not res!1082249) (not e!884515))))

(assert (=> b!1584466 (= res!1082249 (and (or (not (is-Cons!36937 (t!51855 l!1251))) (bvsle (_1!12916 (h!38480 (t!51855 l!1251))) otherKey!56)) (is-Cons!36937 (t!51855 l!1251)) (bvslt (_1!12916 (h!38480 (t!51855 l!1251))) otherKey!56)))))

(declare-fun b!1584467 () Bool)

(assert (=> b!1584467 (= e!884515 (containsKey!1000 (t!51855 (t!51855 l!1251)) otherKey!56))))

(assert (= (and d!167435 (not res!1082248)) b!1584466))

(assert (= (and b!1584466 res!1082249) b!1584467))

(declare-fun m!1453737 () Bool)

(assert (=> b!1584467 m!1453737))

(assert (=> b!1584348 d!167435))

(declare-fun b!1584472 () Bool)

(declare-fun e!884518 () Bool)

(declare-fun tp!115117 () Bool)

(assert (=> b!1584472 (= e!884518 (and tp_is_empty!39451 tp!115117))))

(assert (=> b!1584349 (= tp!115102 e!884518)))

(assert (= (and b!1584349 (is-Cons!36937 (t!51855 l!1251))) b!1584472))

(push 1)

(assert (not b!1584417))

(assert (not b!1584444))

(assert (not b!1584463))

(assert (not b!1584446))

(assert (not b!1584465))

(assert (not b!1584472))

(assert tp_is_empty!39451)

(assert (not b!1584467))

(check-sat)

