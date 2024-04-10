; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7192 () Bool)

(assert start!7192)

(declare-fun res!26949 () Bool)

(declare-fun e!29348 () Bool)

(assert (=> start!7192 (=> (not res!26949) (not e!29348))))

(declare-datatypes ((B!866 0))(
  ( (B!867 (val!1020 Int)) )
))
(declare-datatypes ((tuple2!1688 0))(
  ( (tuple2!1689 (_1!855 (_ BitVec 64)) (_2!855 B!866)) )
))
(declare-datatypes ((List!1238 0))(
  ( (Nil!1235) (Cons!1234 (h!1814 tuple2!1688) (t!4263 List!1238)) )
))
(declare-fun l!812 () List!1238)

(declare-fun isStrictlySorted!229 (List!1238) Bool)

(assert (=> start!7192 (= res!26949 (isStrictlySorted!229 l!812))))

(assert (=> start!7192 e!29348))

(declare-fun e!29347 () Bool)

(assert (=> start!7192 e!29347))

(assert (=> start!7192 true))

(declare-fun b!46081 () Bool)

(declare-fun res!26948 () Bool)

(assert (=> b!46081 (=> (not res!26948) (not e!29348))))

(assert (=> b!46081 (= res!26948 (not (is-Cons!1234 l!812)))))

(declare-fun b!46082 () Bool)

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun removeStrictlySorted!39 (List!1238 (_ BitVec 64)) List!1238)

(assert (=> b!46082 (= e!29348 (not (isStrictlySorted!229 (removeStrictlySorted!39 l!812 key2!27))))))

(declare-fun b!46083 () Bool)

(declare-fun tp_is_empty!1963 () Bool)

(declare-fun tp!6065 () Bool)

(assert (=> b!46083 (= e!29347 (and tp_is_empty!1963 tp!6065))))

(assert (= (and start!7192 res!26949) b!46081))

(assert (= (and b!46081 res!26948) b!46082))

(assert (= (and start!7192 (is-Cons!1234 l!812)) b!46083))

(declare-fun m!40581 () Bool)

(assert (=> start!7192 m!40581))

(declare-fun m!40583 () Bool)

(assert (=> b!46082 m!40583))

(assert (=> b!46082 m!40583))

(declare-fun m!40585 () Bool)

(assert (=> b!46082 m!40585))

(push 1)

(assert (not start!7192))

(assert (not b!46082))

(assert (not b!46083))

(assert tp_is_empty!1963)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9017 () Bool)

(declare-fun res!26970 () Bool)

(declare-fun e!29369 () Bool)

(assert (=> d!9017 (=> res!26970 e!29369)))

(assert (=> d!9017 (= res!26970 (or (is-Nil!1235 l!812) (is-Nil!1235 (t!4263 l!812))))))

(assert (=> d!9017 (= (isStrictlySorted!229 l!812) e!29369)))

(declare-fun b!46110 () Bool)

(declare-fun e!29371 () Bool)

(assert (=> b!46110 (= e!29369 e!29371)))

(declare-fun res!26972 () Bool)

(assert (=> b!46110 (=> (not res!26972) (not e!29371))))

(assert (=> b!46110 (= res!26972 (bvslt (_1!855 (h!1814 l!812)) (_1!855 (h!1814 (t!4263 l!812)))))))

(declare-fun b!46112 () Bool)

(assert (=> b!46112 (= e!29371 (isStrictlySorted!229 (t!4263 l!812)))))

(assert (= (and d!9017 (not res!26970)) b!46110))

(assert (= (and b!46110 res!26972) b!46112))

(declare-fun m!40599 () Bool)

(assert (=> b!46112 m!40599))

(assert (=> start!7192 d!9017))

(declare-fun d!9020 () Bool)

(declare-fun res!26974 () Bool)

(declare-fun e!29373 () Bool)

(assert (=> d!9020 (=> res!26974 e!29373)))

(assert (=> d!9020 (= res!26974 (or (is-Nil!1235 (removeStrictlySorted!39 l!812 key2!27)) (is-Nil!1235 (t!4263 (removeStrictlySorted!39 l!812 key2!27)))))))

(assert (=> d!9020 (= (isStrictlySorted!229 (removeStrictlySorted!39 l!812 key2!27)) e!29373)))

(declare-fun b!46114 () Bool)

(declare-fun e!29375 () Bool)

(assert (=> b!46114 (= e!29373 e!29375)))

(declare-fun res!26976 () Bool)

(assert (=> b!46114 (=> (not res!26976) (not e!29375))))

(assert (=> b!46114 (= res!26976 (bvslt (_1!855 (h!1814 (removeStrictlySorted!39 l!812 key2!27))) (_1!855 (h!1814 (t!4263 (removeStrictlySorted!39 l!812 key2!27))))))))

(declare-fun b!46116 () Bool)

(assert (=> b!46116 (= e!29375 (isStrictlySorted!229 (t!4263 (removeStrictlySorted!39 l!812 key2!27))))))

(assert (= (and d!9020 (not res!26974)) b!46114))

(assert (= (and b!46114 res!26976) b!46116))

(declare-fun m!40605 () Bool)

(assert (=> b!46116 m!40605))

(assert (=> b!46082 d!9020))

(declare-fun b!46151 () Bool)

(declare-fun e!29401 () Bool)

(declare-fun lt!20272 () List!1238)

(declare-fun containsKey!87 (List!1238 (_ BitVec 64)) Bool)

(assert (=> b!46151 (= e!29401 (not (containsKey!87 lt!20272 key2!27)))))

(declare-fun b!46152 () Bool)

(declare-fun e!29402 () List!1238)

(assert (=> b!46152 (= e!29402 (t!4263 l!812))))

(declare-fun d!9027 () Bool)

(assert (=> d!9027 e!29401))

(declare-fun res!26991 () Bool)

(assert (=> d!9027 (=> (not res!26991) (not e!29401))))

(assert (=> d!9027 (= res!26991 (isStrictlySorted!229 lt!20272))))

(assert (=> d!9027 (= lt!20272 e!29402)))

(declare-fun c!6237 () Bool)

(assert (=> d!9027 (= c!6237 (and (is-Cons!1234 l!812) (= (_1!855 (h!1814 l!812)) key2!27)))))

(assert (=> d!9027 (isStrictlySorted!229 l!812)))

(assert (=> d!9027 (= (removeStrictlySorted!39 l!812 key2!27) lt!20272)))

(declare-fun b!46153 () Bool)

(declare-fun e!29400 () List!1238)

(assert (=> b!46153 (= e!29400 Nil!1235)))

(declare-fun b!46154 () Bool)

(assert (=> b!46154 (= e!29402 e!29400)))

(declare-fun c!6236 () Bool)

(assert (=> b!46154 (= c!6236 (and (is-Cons!1234 l!812) (not (= (_1!855 (h!1814 l!812)) key2!27))))))

(declare-fun b!46155 () Bool)

(declare-fun $colon$colon!41 (List!1238 tuple2!1688) List!1238)

(assert (=> b!46155 (= e!29400 ($colon$colon!41 (removeStrictlySorted!39 (t!4263 l!812) key2!27) (h!1814 l!812)))))

(assert (= (and d!9027 c!6237) b!46152))

(assert (= (and d!9027 (not c!6237)) b!46154))

(assert (= (and b!46154 c!6236) b!46155))

(assert (= (and b!46154 (not c!6236)) b!46153))

(assert (= (and d!9027 res!26991) b!46151))

(declare-fun m!40613 () Bool)

(assert (=> b!46151 m!40613))

(declare-fun m!40615 () Bool)

(assert (=> d!9027 m!40615))

(assert (=> d!9027 m!40581))

(declare-fun m!40621 () Bool)

(assert (=> b!46155 m!40621))

(assert (=> b!46155 m!40621))

(declare-fun m!40625 () Bool)

(assert (=> b!46155 m!40625))

(assert (=> b!46082 d!9027))

(declare-fun b!46165 () Bool)

(declare-fun e!29408 () Bool)

(declare-fun tp!6077 () Bool)

(assert (=> b!46165 (= e!29408 (and tp_is_empty!1963 tp!6077))))

(assert (=> b!46083 (= tp!6065 e!29408)))

(assert (= (and b!46083 (is-Cons!1234 (t!4263 l!812))) b!46165))

(push 1)

(assert (not b!46165))

(assert (not b!46116))

(assert tp_is_empty!1963)

(assert (not b!46112))

(assert (not b!46155))

(assert (not b!46151))

(assert (not d!9027))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

