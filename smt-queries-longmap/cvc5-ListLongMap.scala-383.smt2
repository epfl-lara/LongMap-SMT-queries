; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7228 () Bool)

(assert start!7228)

(declare-fun res!27027 () Bool)

(declare-fun e!29479 () Bool)

(assert (=> start!7228 (=> (not res!27027) (not e!29479))))

(declare-datatypes ((B!878 0))(
  ( (B!879 (val!1026 Int)) )
))
(declare-datatypes ((tuple2!1700 0))(
  ( (tuple2!1701 (_1!861 (_ BitVec 64)) (_2!861 B!878)) )
))
(declare-datatypes ((List!1244 0))(
  ( (Nil!1241) (Cons!1240 (h!1820 tuple2!1700) (t!4269 List!1244)) )
))
(declare-fun l!812 () List!1244)

(declare-fun isStrictlySorted!235 (List!1244) Bool)

(assert (=> start!7228 (= res!27027 (isStrictlySorted!235 l!812))))

(assert (=> start!7228 e!29479))

(declare-fun e!29480 () Bool)

(assert (=> start!7228 e!29480))

(declare-fun b!46261 () Bool)

(declare-fun res!27026 () Bool)

(assert (=> b!46261 (=> (not res!27026) (not e!29479))))

(assert (=> b!46261 (= res!27026 (is-Cons!1240 l!812))))

(declare-fun b!46262 () Bool)

(assert (=> b!46262 (= e!29479 (not (isStrictlySorted!235 (t!4269 l!812))))))

(declare-fun b!46263 () Bool)

(declare-fun tp_is_empty!1975 () Bool)

(declare-fun tp!6101 () Bool)

(assert (=> b!46263 (= e!29480 (and tp_is_empty!1975 tp!6101))))

(assert (= (and start!7228 res!27027) b!46261))

(assert (= (and b!46261 res!27026) b!46262))

(assert (= (and start!7228 (is-Cons!1240 l!812)) b!46263))

(declare-fun m!40659 () Bool)

(assert (=> start!7228 m!40659))

(declare-fun m!40661 () Bool)

(assert (=> b!46262 m!40661))

(push 1)

(assert (not b!46262))

(assert (not start!7228))

(assert (not b!46263))

(assert tp_is_empty!1975)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9049 () Bool)

(declare-fun res!27044 () Bool)

(declare-fun e!29497 () Bool)

(assert (=> d!9049 (=> res!27044 e!29497)))

(assert (=> d!9049 (= res!27044 (or (is-Nil!1241 (t!4269 l!812)) (is-Nil!1241 (t!4269 (t!4269 l!812)))))))

(assert (=> d!9049 (= (isStrictlySorted!235 (t!4269 l!812)) e!29497)))

(declare-fun b!46286 () Bool)

(declare-fun e!29498 () Bool)

(assert (=> b!46286 (= e!29497 e!29498)))

(declare-fun res!27045 () Bool)

(assert (=> b!46286 (=> (not res!27045) (not e!29498))))

(assert (=> b!46286 (= res!27045 (bvslt (_1!861 (h!1820 (t!4269 l!812))) (_1!861 (h!1820 (t!4269 (t!4269 l!812))))))))

(declare-fun b!46287 () Bool)

(assert (=> b!46287 (= e!29498 (isStrictlySorted!235 (t!4269 (t!4269 l!812))))))

(assert (= (and d!9049 (not res!27044)) b!46286))

(assert (= (and b!46286 res!27045) b!46287))

(declare-fun m!40671 () Bool)

(assert (=> b!46287 m!40671))

(assert (=> b!46262 d!9049))

(declare-fun d!9055 () Bool)

(declare-fun res!27046 () Bool)

(declare-fun e!29499 () Bool)

(assert (=> d!9055 (=> res!27046 e!29499)))

(assert (=> d!9055 (= res!27046 (or (is-Nil!1241 l!812) (is-Nil!1241 (t!4269 l!812))))))

(assert (=> d!9055 (= (isStrictlySorted!235 l!812) e!29499)))

(declare-fun b!46288 () Bool)

(declare-fun e!29500 () Bool)

(assert (=> b!46288 (= e!29499 e!29500)))

(declare-fun res!27047 () Bool)

(assert (=> b!46288 (=> (not res!27047) (not e!29500))))

(assert (=> b!46288 (= res!27047 (bvslt (_1!861 (h!1820 l!812)) (_1!861 (h!1820 (t!4269 l!812)))))))

(declare-fun b!46289 () Bool)

(assert (=> b!46289 (= e!29500 (isStrictlySorted!235 (t!4269 l!812)))))

(assert (= (and d!9055 (not res!27046)) b!46288))

(assert (= (and b!46288 res!27047) b!46289))

(assert (=> b!46289 m!40661))

(assert (=> start!7228 d!9055))

(declare-fun b!46294 () Bool)

(declare-fun e!29503 () Bool)

(declare-fun tp!6110 () Bool)

(assert (=> b!46294 (= e!29503 (and tp_is_empty!1975 tp!6110))))

(assert (=> b!46263 (= tp!6101 e!29503)))

(assert (= (and b!46263 (is-Cons!1240 (t!4269 l!812))) b!46294))

(push 1)

(assert (not b!46287))

(assert (not b!46289))

(assert (not b!46294))

(assert tp_is_empty!1975)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

