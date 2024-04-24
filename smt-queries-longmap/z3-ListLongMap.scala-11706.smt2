; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137282 () Bool)

(assert start!137282)

(declare-fun b!1581344 () Bool)

(declare-fun res!1079698 () Bool)

(declare-fun e!882241 () Bool)

(assert (=> b!1581344 (=> res!1079698 e!882241)))

(declare-datatypes ((B!2564 0))(
  ( (B!2565 (val!19644 Int)) )
))
(declare-datatypes ((tuple2!25450 0))(
  ( (tuple2!25451 (_1!12736 (_ BitVec 64)) (_2!12736 B!2564)) )
))
(declare-datatypes ((List!36796 0))(
  ( (Nil!36793) (Cons!36792 (h!38353 tuple2!25450) (t!51702 List!36796)) )
))
(declare-datatypes ((ListLongMap!22797 0))(
  ( (ListLongMap!22798 (toList!11414 List!36796)) )
))
(declare-fun lm!251 () ListLongMap!22797)

(declare-fun a0!51 () (_ BitVec 64))

(declare-fun containsKey!875 (List!36796 (_ BitVec 64)) Bool)

(assert (=> b!1581344 (= res!1079698 (containsKey!875 (toList!11414 lm!251) a0!51))))

(declare-fun b!1581345 () Bool)

(declare-fun e!882242 () Bool)

(declare-fun tp!114261 () Bool)

(assert (=> b!1581345 (= e!882242 tp!114261)))

(declare-fun b!1581346 () Bool)

(declare-fun a!525 () (_ BitVec 64))

(assert (=> b!1581346 (= e!882241 (= a0!51 a!525))))

(declare-fun b!1581347 () Bool)

(declare-fun res!1079699 () Bool)

(declare-fun e!882240 () Bool)

(assert (=> b!1581347 (=> (not res!1079699) (not e!882240))))

(assert (=> b!1581347 (= res!1079699 (not (= a!525 a0!51)))))

(declare-fun res!1079696 () Bool)

(assert (=> start!137282 (=> (not res!1079696) (not e!882240))))

(declare-fun contains!10481 (ListLongMap!22797 (_ BitVec 64)) Bool)

(assert (=> start!137282 (= res!1079696 (not (contains!10481 lm!251 a0!51)))))

(assert (=> start!137282 e!882240))

(declare-fun inv!58930 (ListLongMap!22797) Bool)

(assert (=> start!137282 (and (inv!58930 lm!251) e!882242)))

(assert (=> start!137282 true))

(declare-fun b!1581348 () Bool)

(assert (=> b!1581348 (= e!882240 e!882241)))

(declare-fun res!1079697 () Bool)

(assert (=> b!1581348 (=> res!1079697 e!882241)))

(declare-fun isStrictlySorted!1013 (List!36796) Bool)

(assert (=> b!1581348 (= res!1079697 (not (isStrictlySorted!1013 (toList!11414 lm!251))))))

(assert (= (and start!137282 res!1079696) b!1581347))

(assert (= (and b!1581347 res!1079699) b!1581348))

(assert (= (and b!1581348 (not res!1079697)) b!1581344))

(assert (= (and b!1581344 (not res!1079698)) b!1581346))

(assert (= start!137282 b!1581345))

(declare-fun m!1453197 () Bool)

(assert (=> b!1581344 m!1453197))

(declare-fun m!1453199 () Bool)

(assert (=> start!137282 m!1453199))

(declare-fun m!1453201 () Bool)

(assert (=> start!137282 m!1453201))

(declare-fun m!1453203 () Bool)

(assert (=> b!1581348 m!1453203))

(check-sat (not b!1581344) (not b!1581348) (not start!137282) (not b!1581345))
(check-sat)
(get-model)

(declare-fun d!166876 () Bool)

(declare-fun res!1079728 () Bool)

(declare-fun e!882265 () Bool)

(assert (=> d!166876 (=> res!1079728 e!882265)))

(get-info :version)

(assert (=> d!166876 (= res!1079728 (and ((_ is Cons!36792) (toList!11414 lm!251)) (= (_1!12736 (h!38353 (toList!11414 lm!251))) a0!51)))))

(assert (=> d!166876 (= (containsKey!875 (toList!11414 lm!251) a0!51) e!882265)))

(declare-fun b!1581383 () Bool)

(declare-fun e!882266 () Bool)

(assert (=> b!1581383 (= e!882265 e!882266)))

(declare-fun res!1079729 () Bool)

(assert (=> b!1581383 (=> (not res!1079729) (not e!882266))))

(assert (=> b!1581383 (= res!1079729 (and (or (not ((_ is Cons!36792) (toList!11414 lm!251))) (bvsle (_1!12736 (h!38353 (toList!11414 lm!251))) a0!51)) ((_ is Cons!36792) (toList!11414 lm!251)) (bvslt (_1!12736 (h!38353 (toList!11414 lm!251))) a0!51)))))

(declare-fun b!1581384 () Bool)

(assert (=> b!1581384 (= e!882266 (containsKey!875 (t!51702 (toList!11414 lm!251)) a0!51))))

(assert (= (and d!166876 (not res!1079728)) b!1581383))

(assert (= (and b!1581383 res!1079729) b!1581384))

(declare-fun m!1453221 () Bool)

(assert (=> b!1581384 m!1453221))

(assert (=> b!1581344 d!166876))

(declare-fun d!166881 () Bool)

(declare-fun res!1079736 () Bool)

(declare-fun e!882275 () Bool)

(assert (=> d!166881 (=> res!1079736 e!882275)))

(assert (=> d!166881 (= res!1079736 (or ((_ is Nil!36793) (toList!11414 lm!251)) ((_ is Nil!36793) (t!51702 (toList!11414 lm!251)))))))

(assert (=> d!166881 (= (isStrictlySorted!1013 (toList!11414 lm!251)) e!882275)))

(declare-fun b!1581395 () Bool)

(declare-fun e!882276 () Bool)

(assert (=> b!1581395 (= e!882275 e!882276)))

(declare-fun res!1079737 () Bool)

(assert (=> b!1581395 (=> (not res!1079737) (not e!882276))))

(assert (=> b!1581395 (= res!1079737 (bvslt (_1!12736 (h!38353 (toList!11414 lm!251))) (_1!12736 (h!38353 (t!51702 (toList!11414 lm!251))))))))

(declare-fun b!1581396 () Bool)

(assert (=> b!1581396 (= e!882276 (isStrictlySorted!1013 (t!51702 (toList!11414 lm!251))))))

(assert (= (and d!166881 (not res!1079736)) b!1581395))

(assert (= (and b!1581395 res!1079737) b!1581396))

(declare-fun m!1453223 () Bool)

(assert (=> b!1581396 m!1453223))

(assert (=> b!1581348 d!166881))

(declare-fun d!166883 () Bool)

(declare-fun e!882301 () Bool)

(assert (=> d!166883 e!882301))

(declare-fun res!1079756 () Bool)

(assert (=> d!166883 (=> res!1079756 e!882301)))

(declare-fun lt!677273 () Bool)

(assert (=> d!166883 (= res!1079756 (not lt!677273))))

(declare-fun lt!677272 () Bool)

(assert (=> d!166883 (= lt!677273 lt!677272)))

(declare-datatypes ((Unit!52113 0))(
  ( (Unit!52114) )
))
(declare-fun lt!677274 () Unit!52113)

(declare-fun e!882302 () Unit!52113)

(assert (=> d!166883 (= lt!677274 e!882302)))

(declare-fun c!147122 () Bool)

(assert (=> d!166883 (= c!147122 lt!677272)))

(assert (=> d!166883 (= lt!677272 (containsKey!875 (toList!11414 lm!251) a0!51))))

(assert (=> d!166883 (= (contains!10481 lm!251 a0!51) lt!677273)))

(declare-fun b!1581427 () Bool)

(declare-fun lt!677271 () Unit!52113)

(assert (=> b!1581427 (= e!882302 lt!677271)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!542 (List!36796 (_ BitVec 64)) Unit!52113)

(assert (=> b!1581427 (= lt!677271 (lemmaContainsKeyImpliesGetValueByKeyDefined!542 (toList!11414 lm!251) a0!51))))

(declare-datatypes ((Option!872 0))(
  ( (Some!871 (v!22357 B!2564)) (None!870) )
))
(declare-fun isDefined!588 (Option!872) Bool)

(declare-fun getValueByKey!797 (List!36796 (_ BitVec 64)) Option!872)

(assert (=> b!1581427 (isDefined!588 (getValueByKey!797 (toList!11414 lm!251) a0!51))))

(declare-fun b!1581428 () Bool)

(declare-fun Unit!52115 () Unit!52113)

(assert (=> b!1581428 (= e!882302 Unit!52115)))

(declare-fun b!1581429 () Bool)

(assert (=> b!1581429 (= e!882301 (isDefined!588 (getValueByKey!797 (toList!11414 lm!251) a0!51)))))

(assert (= (and d!166883 c!147122) b!1581427))

(assert (= (and d!166883 (not c!147122)) b!1581428))

(assert (= (and d!166883 (not res!1079756)) b!1581429))

(assert (=> d!166883 m!1453197))

(declare-fun m!1453241 () Bool)

(assert (=> b!1581427 m!1453241))

(declare-fun m!1453243 () Bool)

(assert (=> b!1581427 m!1453243))

(assert (=> b!1581427 m!1453243))

(declare-fun m!1453245 () Bool)

(assert (=> b!1581427 m!1453245))

(assert (=> b!1581429 m!1453243))

(assert (=> b!1581429 m!1453243))

(assert (=> b!1581429 m!1453245))

(assert (=> start!137282 d!166883))

(declare-fun d!166897 () Bool)

(assert (=> d!166897 (= (inv!58930 lm!251) (isStrictlySorted!1013 (toList!11414 lm!251)))))

(declare-fun bs!45746 () Bool)

(assert (= bs!45746 d!166897))

(assert (=> bs!45746 m!1453203))

(assert (=> start!137282 d!166897))

(declare-fun b!1581448 () Bool)

(declare-fun e!882317 () Bool)

(declare-fun tp_is_empty!39109 () Bool)

(declare-fun tp!114272 () Bool)

(assert (=> b!1581448 (= e!882317 (and tp_is_empty!39109 tp!114272))))

(assert (=> b!1581345 (= tp!114261 e!882317)))

(assert (= (and b!1581345 ((_ is Cons!36792) (toList!11414 lm!251))) b!1581448))

(check-sat (not d!166897) (not b!1581448) (not b!1581384) (not b!1581429) (not d!166883) (not b!1581427) (not b!1581396) tp_is_empty!39109)
(check-sat)
