; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133002 () Bool)

(assert start!133002)

(declare-fun b!1557152 () Bool)

(declare-fun e!867369 () Bool)

(declare-fun e!867370 () Bool)

(assert (=> b!1557152 (= e!867369 e!867370)))

(declare-fun res!1065121 () Bool)

(assert (=> b!1557152 (=> res!1065121 e!867370)))

(declare-datatypes ((B!2370 0))(
  ( (B!2371 (val!19271 Int)) )
))
(declare-datatypes ((tuple2!24918 0))(
  ( (tuple2!24919 (_1!12470 (_ BitVec 64)) (_2!12470 B!2370)) )
))
(declare-datatypes ((List!36305 0))(
  ( (Nil!36302) (Cons!36301 (h!37747 tuple2!24918) (t!51032 List!36305)) )
))
(declare-datatypes ((ListLongMap!22419 0))(
  ( (ListLongMap!22420 (toList!11225 List!36305)) )
))
(declare-fun lm!250 () ListLongMap!22419)

(declare-fun isStrictlySorted!955 (List!36305) Bool)

(assert (=> b!1557152 (= res!1065121 (not (isStrictlySorted!955 (toList!11225 lm!250))))))

(declare-fun b!1557153 () Bool)

(declare-fun e!867371 () Bool)

(declare-fun tp!112482 () Bool)

(assert (=> b!1557153 (= e!867371 tp!112482)))

(declare-fun b!1557154 () Bool)

(declare-fun a0!50 () (_ BitVec 64))

(declare-fun a!524 () (_ BitVec 64))

(assert (=> b!1557154 (= e!867370 (= a0!50 a!524))))

(declare-fun b!1557155 () Bool)

(declare-fun res!1065124 () Bool)

(assert (=> b!1557155 (=> (not res!1065124) (not e!867369))))

(assert (=> b!1557155 (= res!1065124 (not (= a!524 a0!50)))))

(declare-fun b!1557151 () Bool)

(declare-fun res!1065123 () Bool)

(assert (=> b!1557151 (=> res!1065123 e!867370)))

(declare-fun containsKey!817 (List!36305 (_ BitVec 64)) Bool)

(assert (=> b!1557151 (= res!1065123 (not (containsKey!817 (toList!11225 lm!250) a0!50)))))

(declare-fun res!1065122 () Bool)

(assert (=> start!133002 (=> (not res!1065122) (not e!867369))))

(declare-fun contains!10193 (ListLongMap!22419 (_ BitVec 64)) Bool)

(assert (=> start!133002 (= res!1065122 (contains!10193 lm!250 a0!50))))

(assert (=> start!133002 e!867369))

(declare-fun inv!57459 (ListLongMap!22419) Bool)

(assert (=> start!133002 (and (inv!57459 lm!250) e!867371)))

(assert (=> start!133002 true))

(assert (= (and start!133002 res!1065122) b!1557155))

(assert (= (and b!1557155 res!1065124) b!1557152))

(assert (= (and b!1557152 (not res!1065121)) b!1557151))

(assert (= (and b!1557151 (not res!1065123)) b!1557154))

(assert (= start!133002 b!1557153))

(declare-fun m!1434379 () Bool)

(assert (=> b!1557152 m!1434379))

(declare-fun m!1434381 () Bool)

(assert (=> b!1557151 m!1434381))

(declare-fun m!1434383 () Bool)

(assert (=> start!133002 m!1434383))

(declare-fun m!1434385 () Bool)

(assert (=> start!133002 m!1434385))

(push 1)

(assert (not b!1557152))

(assert (not b!1557151))

(assert (not start!133002))

(assert (not b!1557153))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162397 () Bool)

(declare-fun res!1065133 () Bool)

(declare-fun e!867380 () Bool)

(assert (=> d!162397 (=> res!1065133 e!867380)))

(assert (=> d!162397 (= res!1065133 (or (is-Nil!36302 (toList!11225 lm!250)) (is-Nil!36302 (t!51032 (toList!11225 lm!250)))))))

(assert (=> d!162397 (= (isStrictlySorted!955 (toList!11225 lm!250)) e!867380)))

(declare-fun b!1557164 () Bool)

(declare-fun e!867381 () Bool)

(assert (=> b!1557164 (= e!867380 e!867381)))

(declare-fun res!1065134 () Bool)

(assert (=> b!1557164 (=> (not res!1065134) (not e!867381))))

(assert (=> b!1557164 (= res!1065134 (bvslt (_1!12470 (h!37747 (toList!11225 lm!250))) (_1!12470 (h!37747 (t!51032 (toList!11225 lm!250))))))))

(declare-fun b!1557165 () Bool)

(assert (=> b!1557165 (= e!867381 (isStrictlySorted!955 (t!51032 (toList!11225 lm!250))))))

(assert (= (and d!162397 (not res!1065133)) b!1557164))

(assert (= (and b!1557164 res!1065134) b!1557165))

(declare-fun m!1434387 () Bool)

(assert (=> b!1557165 m!1434387))

(assert (=> b!1557152 d!162397))

(declare-fun d!162403 () Bool)

(declare-fun res!1065141 () Bool)

(declare-fun e!867388 () Bool)

(assert (=> d!162403 (=> res!1065141 e!867388)))

(assert (=> d!162403 (= res!1065141 (and (is-Cons!36301 (toList!11225 lm!250)) (= (_1!12470 (h!37747 (toList!11225 lm!250))) a0!50)))))

(assert (=> d!162403 (= (containsKey!817 (toList!11225 lm!250) a0!50) e!867388)))

(declare-fun b!1557172 () Bool)

(declare-fun e!867389 () Bool)

(assert (=> b!1557172 (= e!867388 e!867389)))

(declare-fun res!1065142 () Bool)

(assert (=> b!1557172 (=> (not res!1065142) (not e!867389))))

(assert (=> b!1557172 (= res!1065142 (and (or (not (is-Cons!36301 (toList!11225 lm!250))) (bvsle (_1!12470 (h!37747 (toList!11225 lm!250))) a0!50)) (is-Cons!36301 (toList!11225 lm!250)) (bvslt (_1!12470 (h!37747 (toList!11225 lm!250))) a0!50)))))

(declare-fun b!1557173 () Bool)

(assert (=> b!1557173 (= e!867389 (containsKey!817 (t!51032 (toList!11225 lm!250)) a0!50))))

(assert (= (and d!162403 (not res!1065141)) b!1557172))

(assert (= (and b!1557172 res!1065142) b!1557173))

(declare-fun m!1434391 () Bool)

(assert (=> b!1557173 m!1434391))

(assert (=> b!1557151 d!162403))

(declare-fun d!162407 () Bool)

(declare-fun e!867410 () Bool)

(assert (=> d!162407 e!867410))

(declare-fun res!1065155 () Bool)

(assert (=> d!162407 (=> res!1065155 e!867410)))

(declare-fun lt!670518 () Bool)

(assert (=> d!162407 (= res!1065155 (not lt!670518))))

(declare-fun lt!670517 () Bool)

(assert (=> d!162407 (= lt!670518 lt!670517)))

(declare-datatypes ((Unit!51850 0))(
  ( (Unit!51851) )
))
(declare-fun lt!670520 () Unit!51850)

(declare-fun e!867411 () Unit!51850)

(assert (=> d!162407 (= lt!670520 e!867411)))

(declare-fun c!143939 () Bool)

(assert (=> d!162407 (= c!143939 lt!670517)))

(assert (=> d!162407 (= lt!670517 (containsKey!817 (toList!11225 lm!250) a0!50))))

(assert (=> d!162407 (= (contains!10193 lm!250 a0!50) lt!670518)))

(declare-fun b!1557202 () Bool)

(declare-fun lt!670519 () Unit!51850)

(assert (=> b!1557202 (= e!867411 lt!670519)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!524 (List!36305 (_ BitVec 64)) Unit!51850)

(assert (=> b!1557202 (= lt!670519 (lemmaContainsKeyImpliesGetValueByKeyDefined!524 (toList!11225 lm!250) a0!50))))

(declare-datatypes ((Option!859 0))(
  ( (Some!858 (v!22049 B!2370)) (None!857) )
))
(declare-fun isDefined!572 (Option!859) Bool)

(declare-fun getValueByKey!783 (List!36305 (_ BitVec 64)) Option!859)

(assert (=> b!1557202 (isDefined!572 (getValueByKey!783 (toList!11225 lm!250) a0!50))))

(declare-fun b!1557203 () Bool)

(declare-fun Unit!51852 () Unit!51850)

(assert (=> b!1557203 (= e!867411 Unit!51852)))

(declare-fun b!1557204 () Bool)

(assert (=> b!1557204 (= e!867410 (isDefined!572 (getValueByKey!783 (toList!11225 lm!250) a0!50)))))

(assert (= (and d!162407 c!143939) b!1557202))

(assert (= (and d!162407 (not c!143939)) b!1557203))

(assert (= (and d!162407 (not res!1065155)) b!1557204))

(assert (=> d!162407 m!1434381))

(declare-fun m!1434405 () Bool)

(assert (=> b!1557202 m!1434405))

(declare-fun m!1434407 () Bool)

(assert (=> b!1557202 m!1434407))

(assert (=> b!1557202 m!1434407))

(declare-fun m!1434411 () Bool)

(assert (=> b!1557202 m!1434411))

(assert (=> b!1557204 m!1434407))

(assert (=> b!1557204 m!1434407))

(assert (=> b!1557204 m!1434411))

(assert (=> start!133002 d!162407))

(declare-fun d!162419 () Bool)

(assert (=> d!162419 (= (inv!57459 lm!250) (isStrictlySorted!955 (toList!11225 lm!250)))))

(declare-fun bs!44761 () Bool)

(assert (= bs!44761 d!162419))

(assert (=> bs!44761 m!1434379))

(assert (=> start!133002 d!162419))

(declare-fun b!1557221 () Bool)

(declare-fun e!867424 () Bool)

(declare-fun tp_is_empty!38371 () Bool)

(declare-fun tp!112487 () Bool)

(assert (=> b!1557221 (= e!867424 (and tp_is_empty!38371 tp!112487))))

(assert (=> b!1557153 (= tp!112482 e!867424)))

(assert (= (and b!1557153 (is-Cons!36301 (toList!11225 lm!250))) b!1557221))

(push 1)

