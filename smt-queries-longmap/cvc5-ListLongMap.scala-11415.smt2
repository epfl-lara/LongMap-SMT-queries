; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132998 () Bool)

(assert start!132998)

(declare-fun b!1557121 () Bool)

(declare-fun res!1065099 () Bool)

(declare-fun e!867351 () Bool)

(assert (=> b!1557121 (=> res!1065099 e!867351)))

(declare-datatypes ((B!2366 0))(
  ( (B!2367 (val!19269 Int)) )
))
(declare-datatypes ((tuple2!24914 0))(
  ( (tuple2!24915 (_1!12468 (_ BitVec 64)) (_2!12468 B!2366)) )
))
(declare-datatypes ((List!36303 0))(
  ( (Nil!36300) (Cons!36299 (h!37745 tuple2!24914) (t!51030 List!36303)) )
))
(declare-datatypes ((ListLongMap!22415 0))(
  ( (ListLongMap!22416 (toList!11223 List!36303)) )
))
(declare-fun lm!250 () ListLongMap!22415)

(declare-fun a0!50 () (_ BitVec 64))

(declare-fun containsKey!815 (List!36303 (_ BitVec 64)) Bool)

(assert (=> b!1557121 (= res!1065099 (not (containsKey!815 (toList!11223 lm!250) a0!50)))))

(declare-fun b!1557122 () Bool)

(declare-fun res!1065097 () Bool)

(declare-fun e!867353 () Bool)

(assert (=> b!1557122 (=> (not res!1065097) (not e!867353))))

(declare-fun a!524 () (_ BitVec 64))

(assert (=> b!1557122 (= res!1065097 (not (= a!524 a0!50)))))

(declare-fun res!1065098 () Bool)

(assert (=> start!132998 (=> (not res!1065098) (not e!867353))))

(declare-fun contains!10191 (ListLongMap!22415 (_ BitVec 64)) Bool)

(assert (=> start!132998 (= res!1065098 (contains!10191 lm!250 a0!50))))

(assert (=> start!132998 e!867353))

(declare-fun e!867352 () Bool)

(declare-fun inv!57457 (ListLongMap!22415) Bool)

(assert (=> start!132998 (and (inv!57457 lm!250) e!867352)))

(assert (=> start!132998 true))

(declare-fun b!1557123 () Bool)

(assert (=> b!1557123 (= e!867351 (= a0!50 a!524))))

(declare-fun b!1557124 () Bool)

(declare-fun tp!112476 () Bool)

(assert (=> b!1557124 (= e!867352 tp!112476)))

(declare-fun b!1557125 () Bool)

(assert (=> b!1557125 (= e!867353 e!867351)))

(declare-fun res!1065100 () Bool)

(assert (=> b!1557125 (=> res!1065100 e!867351)))

(declare-fun isStrictlySorted!953 (List!36303) Bool)

(assert (=> b!1557125 (= res!1065100 (not (isStrictlySorted!953 (toList!11223 lm!250))))))

(assert (= (and start!132998 res!1065098) b!1557122))

(assert (= (and b!1557122 res!1065097) b!1557125))

(assert (= (and b!1557125 (not res!1065100)) b!1557121))

(assert (= (and b!1557121 (not res!1065099)) b!1557123))

(assert (= start!132998 b!1557124))

(declare-fun m!1434363 () Bool)

(assert (=> b!1557121 m!1434363))

(declare-fun m!1434365 () Bool)

(assert (=> start!132998 m!1434365))

(declare-fun m!1434367 () Bool)

(assert (=> start!132998 m!1434367))

(declare-fun m!1434369 () Bool)

(assert (=> b!1557125 m!1434369))

(push 1)

(assert (not start!132998))

(assert (not b!1557121))

(assert (not b!1557125))

(assert (not b!1557124))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162401 () Bool)

(declare-fun e!867399 () Bool)

(assert (=> d!162401 e!867399))

(declare-fun res!1065147 () Bool)

(assert (=> d!162401 (=> res!1065147 e!867399)))

(declare-fun lt!670504 () Bool)

(assert (=> d!162401 (= res!1065147 (not lt!670504))))

(declare-fun lt!670503 () Bool)

(assert (=> d!162401 (= lt!670504 lt!670503)))

(declare-datatypes ((Unit!51844 0))(
  ( (Unit!51845) )
))
(declare-fun lt!670502 () Unit!51844)

(declare-fun e!867398 () Unit!51844)

(assert (=> d!162401 (= lt!670502 e!867398)))

(declare-fun c!143935 () Bool)

(assert (=> d!162401 (= c!143935 lt!670503)))

(assert (=> d!162401 (= lt!670503 (containsKey!815 (toList!11223 lm!250) a0!50))))

(assert (=> d!162401 (= (contains!10191 lm!250 a0!50) lt!670504)))

(declare-fun b!1557186 () Bool)

(declare-fun lt!670501 () Unit!51844)

(assert (=> b!1557186 (= e!867398 lt!670501)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!522 (List!36303 (_ BitVec 64)) Unit!51844)

(assert (=> b!1557186 (= lt!670501 (lemmaContainsKeyImpliesGetValueByKeyDefined!522 (toList!11223 lm!250) a0!50))))

(declare-datatypes ((Option!857 0))(
  ( (Some!856 (v!22047 B!2366)) (None!855) )
))
(declare-fun isDefined!570 (Option!857) Bool)

(declare-fun getValueByKey!781 (List!36303 (_ BitVec 64)) Option!857)

(assert (=> b!1557186 (isDefined!570 (getValueByKey!781 (toList!11223 lm!250) a0!50))))

(declare-fun b!1557187 () Bool)

(declare-fun Unit!51848 () Unit!51844)

(assert (=> b!1557187 (= e!867398 Unit!51848)))

(declare-fun b!1557188 () Bool)

(assert (=> b!1557188 (= e!867399 (isDefined!570 (getValueByKey!781 (toList!11223 lm!250) a0!50)))))

(assert (= (and d!162401 c!143935) b!1557186))

(assert (= (and d!162401 (not c!143935)) b!1557187))

(assert (= (and d!162401 (not res!1065147)) b!1557188))

(assert (=> d!162401 m!1434363))

(declare-fun m!1434393 () Bool)

(assert (=> b!1557186 m!1434393))

(declare-fun m!1434395 () Bool)

(assert (=> b!1557186 m!1434395))

(assert (=> b!1557186 m!1434395))

(declare-fun m!1434397 () Bool)

(assert (=> b!1557186 m!1434397))

(assert (=> b!1557188 m!1434395))

(assert (=> b!1557188 m!1434395))

(assert (=> b!1557188 m!1434397))

(assert (=> start!132998 d!162401))

(declare-fun d!162409 () Bool)

(assert (=> d!162409 (= (inv!57457 lm!250) (isStrictlySorted!953 (toList!11223 lm!250)))))

(declare-fun bs!44759 () Bool)

(assert (= bs!44759 d!162409))

(assert (=> bs!44759 m!1434369))

(assert (=> start!132998 d!162409))

(declare-fun d!162411 () Bool)

(declare-fun res!1065158 () Bool)

(declare-fun e!867414 () Bool)

(assert (=> d!162411 (=> res!1065158 e!867414)))

(assert (=> d!162411 (= res!1065158 (and (is-Cons!36299 (toList!11223 lm!250)) (= (_1!12468 (h!37745 (toList!11223 lm!250))) a0!50)))))

(assert (=> d!162411 (= (containsKey!815 (toList!11223 lm!250) a0!50) e!867414)))

(declare-fun b!1557205 () Bool)

(declare-fun e!867415 () Bool)

(assert (=> b!1557205 (= e!867414 e!867415)))

(declare-fun res!1065159 () Bool)

(assert (=> b!1557205 (=> (not res!1065159) (not e!867415))))

(assert (=> b!1557205 (= res!1065159 (and (or (not (is-Cons!36299 (toList!11223 lm!250))) (bvsle (_1!12468 (h!37745 (toList!11223 lm!250))) a0!50)) (is-Cons!36299 (toList!11223 lm!250)) (bvslt (_1!12468 (h!37745 (toList!11223 lm!250))) a0!50)))))

(declare-fun b!1557206 () Bool)

(assert (=> b!1557206 (= e!867415 (containsKey!815 (t!51030 (toList!11223 lm!250)) a0!50))))

(assert (= (and d!162411 (not res!1065158)) b!1557205))

(assert (= (and b!1557205 res!1065159) b!1557206))

(declare-fun m!1434409 () Bool)

(assert (=> b!1557206 m!1434409))

(assert (=> b!1557121 d!162411))

(declare-fun d!162417 () Bool)

(declare-fun res!1065168 () Bool)

(declare-fun e!867430 () Bool)

(assert (=> d!162417 (=> res!1065168 e!867430)))

(assert (=> d!162417 (= res!1065168 (or (is-Nil!36300 (toList!11223 lm!250)) (is-Nil!36300 (t!51030 (toList!11223 lm!250)))))))

(assert (=> d!162417 (= (isStrictlySorted!953 (toList!11223 lm!250)) e!867430)))

(declare-fun b!1557227 () Bool)

(declare-fun e!867431 () Bool)

(assert (=> b!1557227 (= e!867430 e!867431)))

(declare-fun res!1065169 () Bool)

(assert (=> b!1557227 (=> (not res!1065169) (not e!867431))))

(assert (=> b!1557227 (= res!1065169 (bvslt (_1!12468 (h!37745 (toList!11223 lm!250))) (_1!12468 (h!37745 (t!51030 (toList!11223 lm!250))))))))

(declare-fun b!1557228 () Bool)

(assert (=> b!1557228 (= e!867431 (isStrictlySorted!953 (t!51030 (toList!11223 lm!250))))))

(assert (= (and d!162417 (not res!1065168)) b!1557227))

(assert (= (and b!1557227 res!1065169) b!1557228))

(declare-fun m!1434415 () Bool)

(assert (=> b!1557228 m!1434415))

(assert (=> b!1557125 d!162417))

(declare-fun b!1557233 () Bool)

(declare-fun e!867434 () Bool)

(declare-fun tp_is_empty!38375 () Bool)

(declare-fun tp!112491 () Bool)

(assert (=> b!1557233 (= e!867434 (and tp_is_empty!38375 tp!112491))))

(assert (=> b!1557124 (= tp!112476 e!867434)))

(assert (= (and b!1557124 (is-Cons!36299 (toList!11223 lm!250))) b!1557233))

(push 1)

