; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7232 () Bool)

(assert start!7232)

(declare-fun res!27038 () Bool)

(declare-fun e!29491 () Bool)

(assert (=> start!7232 (=> (not res!27038) (not e!29491))))

(declare-datatypes ((B!882 0))(
  ( (B!883 (val!1028 Int)) )
))
(declare-datatypes ((tuple2!1704 0))(
  ( (tuple2!1705 (_1!863 (_ BitVec 64)) (_2!863 B!882)) )
))
(declare-datatypes ((List!1246 0))(
  ( (Nil!1243) (Cons!1242 (h!1822 tuple2!1704) (t!4271 List!1246)) )
))
(declare-fun l!812 () List!1246)

(declare-fun isStrictlySorted!237 (List!1246) Bool)

(assert (=> start!7232 (= res!27038 (isStrictlySorted!237 l!812))))

(assert (=> start!7232 e!29491))

(declare-fun e!29492 () Bool)

(assert (=> start!7232 e!29492))

(declare-fun b!46279 () Bool)

(declare-fun res!27039 () Bool)

(assert (=> b!46279 (=> (not res!27039) (not e!29491))))

(assert (=> b!46279 (= res!27039 (is-Cons!1242 l!812))))

(declare-fun b!46280 () Bool)

(assert (=> b!46280 (= e!29491 (not (isStrictlySorted!237 (t!4271 l!812))))))

(declare-fun b!46281 () Bool)

(declare-fun tp_is_empty!1979 () Bool)

(declare-fun tp!6107 () Bool)

(assert (=> b!46281 (= e!29492 (and tp_is_empty!1979 tp!6107))))

(assert (= (and start!7232 res!27038) b!46279))

(assert (= (and b!46279 res!27039) b!46280))

(assert (= (and start!7232 (is-Cons!1242 l!812)) b!46281))

(declare-fun m!40667 () Bool)

(assert (=> start!7232 m!40667))

(declare-fun m!40669 () Bool)

(assert (=> b!46280 m!40669))

(push 1)

(assert (not start!7232))

(assert (not b!46280))

(assert (not b!46281))

(assert tp_is_empty!1979)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9051 () Bool)

(declare-fun res!27057 () Bool)

(declare-fun e!29513 () Bool)

(assert (=> d!9051 (=> res!27057 e!29513)))

(assert (=> d!9051 (= res!27057 (or (is-Nil!1243 l!812) (is-Nil!1243 (t!4271 l!812))))))

(assert (=> d!9051 (= (isStrictlySorted!237 l!812) e!29513)))

(declare-fun b!46304 () Bool)

(declare-fun e!29515 () Bool)

(assert (=> b!46304 (= e!29513 e!29515)))

(declare-fun res!27059 () Bool)

(assert (=> b!46304 (=> (not res!27059) (not e!29515))))

(assert (=> b!46304 (= res!27059 (bvslt (_1!863 (h!1822 l!812)) (_1!863 (h!1822 (t!4271 l!812)))))))

(declare-fun b!46305 () Bool)

(assert (=> b!46305 (= e!29515 (isStrictlySorted!237 (t!4271 l!812)))))

(assert (= (and d!9051 (not res!27057)) b!46304))

(assert (= (and b!46304 res!27059) b!46305))

(assert (=> b!46305 m!40669))

(assert (=> start!7232 d!9051))

(declare-fun d!9058 () Bool)

(declare-fun res!27062 () Bool)

(declare-fun e!29518 () Bool)

(assert (=> d!9058 (=> res!27062 e!29518)))

(assert (=> d!9058 (= res!27062 (or (is-Nil!1243 (t!4271 l!812)) (is-Nil!1243 (t!4271 (t!4271 l!812)))))))

(assert (=> d!9058 (= (isStrictlySorted!237 (t!4271 l!812)) e!29518)))

(declare-fun b!46309 () Bool)

(declare-fun e!29519 () Bool)

(assert (=> b!46309 (= e!29518 e!29519)))

(declare-fun res!27063 () Bool)

(assert (=> b!46309 (=> (not res!27063) (not e!29519))))

