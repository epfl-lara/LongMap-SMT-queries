; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133000 () Bool)

(assert start!133000)

(declare-fun b!1557136 () Bool)

(declare-fun res!1065112 () Bool)

(declare-fun e!867361 () Bool)

(assert (=> b!1557136 (=> (not res!1065112) (not e!867361))))

(declare-fun a!524 () (_ BitVec 64))

(declare-fun a0!50 () (_ BitVec 64))

(assert (=> b!1557136 (= res!1065112 (not (= a!524 a0!50)))))

(declare-fun b!1557137 () Bool)

(declare-fun e!867360 () Bool)

(assert (=> b!1557137 (= e!867361 e!867360)))

(declare-fun res!1065110 () Bool)

(assert (=> b!1557137 (=> res!1065110 e!867360)))

(declare-datatypes ((B!2368 0))(
  ( (B!2369 (val!19270 Int)) )
))
(declare-datatypes ((tuple2!24916 0))(
  ( (tuple2!24917 (_1!12469 (_ BitVec 64)) (_2!12469 B!2368)) )
))
(declare-datatypes ((List!36304 0))(
  ( (Nil!36301) (Cons!36300 (h!37746 tuple2!24916) (t!51031 List!36304)) )
))
(declare-datatypes ((ListLongMap!22417 0))(
  ( (ListLongMap!22418 (toList!11224 List!36304)) )
))
(declare-fun lm!250 () ListLongMap!22417)

(declare-fun isStrictlySorted!954 (List!36304) Bool)

(assert (=> b!1557137 (= res!1065110 (not (isStrictlySorted!954 (toList!11224 lm!250))))))

(declare-fun b!1557138 () Bool)

(declare-fun e!867362 () Bool)

(declare-fun tp!112479 () Bool)

(assert (=> b!1557138 (= e!867362 tp!112479)))

(declare-fun res!1065111 () Bool)

(assert (=> start!133000 (=> (not res!1065111) (not e!867361))))

(declare-fun contains!10192 (ListLongMap!22417 (_ BitVec 64)) Bool)

(assert (=> start!133000 (= res!1065111 (contains!10192 lm!250 a0!50))))

(assert (=> start!133000 e!867361))

(declare-fun inv!57458 (ListLongMap!22417) Bool)

(assert (=> start!133000 (and (inv!57458 lm!250) e!867362)))

(assert (=> start!133000 true))

(declare-fun b!1557139 () Bool)

(assert (=> b!1557139 (= e!867360 (= a0!50 a!524))))

(declare-fun b!1557140 () Bool)

(declare-fun res!1065109 () Bool)

(assert (=> b!1557140 (=> res!1065109 e!867360)))

(declare-fun containsKey!816 (List!36304 (_ BitVec 64)) Bool)

(assert (=> b!1557140 (= res!1065109 (not (containsKey!816 (toList!11224 lm!250) a0!50)))))

(assert (= (and start!133000 res!1065111) b!1557136))

(assert (= (and b!1557136 res!1065112) b!1557137))

(assert (= (and b!1557137 (not res!1065110)) b!1557140))

(assert (= (and b!1557140 (not res!1065109)) b!1557139))

(assert (= start!133000 b!1557138))

(declare-fun m!1434371 () Bool)

(assert (=> b!1557137 m!1434371))

(declare-fun m!1434373 () Bool)

(assert (=> start!133000 m!1434373))

(declare-fun m!1434375 () Bool)

(assert (=> start!133000 m!1434375))

(declare-fun m!1434377 () Bool)

(assert (=> b!1557140 m!1434377))

(check-sat (not b!1557140) (not start!133000) (not b!1557137) (not b!1557138))
(check-sat)
(get-model)

(declare-fun d!162399 () Bool)

(declare-fun res!1065135 () Bool)

(declare-fun e!867382 () Bool)

(assert (=> d!162399 (=> res!1065135 e!867382)))

(get-info :version)

(assert (=> d!162399 (= res!1065135 (and ((_ is Cons!36300) (toList!11224 lm!250)) (= (_1!12469 (h!37746 (toList!11224 lm!250))) a0!50)))))

(assert (=> d!162399 (= (containsKey!816 (toList!11224 lm!250) a0!50) e!867382)))

(declare-fun b!1557166 () Bool)

(declare-fun e!867383 () Bool)

(assert (=> b!1557166 (= e!867382 e!867383)))

(declare-fun res!1065136 () Bool)

(assert (=> b!1557166 (=> (not res!1065136) (not e!867383))))

(assert (=> b!1557166 (= res!1065136 (and (or (not ((_ is Cons!36300) (toList!11224 lm!250))) (bvsle (_1!12469 (h!37746 (toList!11224 lm!250))) a0!50)) ((_ is Cons!36300) (toList!11224 lm!250)) (bvslt (_1!12469 (h!37746 (toList!11224 lm!250))) a0!50)))))

(declare-fun b!1557167 () Bool)

(assert (=> b!1557167 (= e!867383 (containsKey!816 (t!51031 (toList!11224 lm!250)) a0!50))))

(assert (= (and d!162399 (not res!1065135)) b!1557166))

(assert (= (and b!1557166 res!1065136) b!1557167))

(declare-fun m!1434389 () Bool)

(assert (=> b!1557167 m!1434389))

(assert (=> b!1557140 d!162399))

(declare-fun d!162405 () Bool)

(declare-fun e!867401 () Bool)

(assert (=> d!162405 e!867401))

(declare-fun res!1065148 () Bool)

(assert (=> d!162405 (=> res!1065148 e!867401)))

(declare-fun lt!670507 () Bool)

(assert (=> d!162405 (= res!1065148 (not lt!670507))))

(declare-fun lt!670508 () Bool)

(assert (=> d!162405 (= lt!670507 lt!670508)))

(declare-datatypes ((Unit!51846 0))(
  ( (Unit!51847) )
))
(declare-fun lt!670506 () Unit!51846)

(declare-fun e!867400 () Unit!51846)

(assert (=> d!162405 (= lt!670506 e!867400)))

(declare-fun c!143936 () Bool)

(assert (=> d!162405 (= c!143936 lt!670508)))

(assert (=> d!162405 (= lt!670508 (containsKey!816 (toList!11224 lm!250) a0!50))))

(assert (=> d!162405 (= (contains!10192 lm!250 a0!50) lt!670507)))

(declare-fun b!1557189 () Bool)

(declare-fun lt!670505 () Unit!51846)

(assert (=> b!1557189 (= e!867400 lt!670505)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!523 (List!36304 (_ BitVec 64)) Unit!51846)

(assert (=> b!1557189 (= lt!670505 (lemmaContainsKeyImpliesGetValueByKeyDefined!523 (toList!11224 lm!250) a0!50))))

(declare-datatypes ((Option!858 0))(
  ( (Some!857 (v!22048 B!2368)) (None!856) )
))
(declare-fun isDefined!571 (Option!858) Bool)

(declare-fun getValueByKey!782 (List!36304 (_ BitVec 64)) Option!858)

(assert (=> b!1557189 (isDefined!571 (getValueByKey!782 (toList!11224 lm!250) a0!50))))

(declare-fun b!1557190 () Bool)

(declare-fun Unit!51849 () Unit!51846)

(assert (=> b!1557190 (= e!867400 Unit!51849)))

(declare-fun b!1557191 () Bool)

(assert (=> b!1557191 (= e!867401 (isDefined!571 (getValueByKey!782 (toList!11224 lm!250) a0!50)))))

(assert (= (and d!162405 c!143936) b!1557189))

(assert (= (and d!162405 (not c!143936)) b!1557190))

(assert (= (and d!162405 (not res!1065148)) b!1557191))

(assert (=> d!162405 m!1434377))

(declare-fun m!1434399 () Bool)

(assert (=> b!1557189 m!1434399))

(declare-fun m!1434401 () Bool)

(assert (=> b!1557189 m!1434401))

(assert (=> b!1557189 m!1434401))

(declare-fun m!1434403 () Bool)

(assert (=> b!1557189 m!1434403))

(assert (=> b!1557191 m!1434401))

(assert (=> b!1557191 m!1434401))

(assert (=> b!1557191 m!1434403))

(assert (=> start!133000 d!162405))

(declare-fun d!162413 () Bool)

(assert (=> d!162413 (= (inv!57458 lm!250) (isStrictlySorted!954 (toList!11224 lm!250)))))

(declare-fun bs!44760 () Bool)

(assert (= bs!44760 d!162413))

(assert (=> bs!44760 m!1434371))

(assert (=> start!133000 d!162413))

(declare-fun d!162415 () Bool)

(declare-fun res!1065162 () Bool)

(declare-fun e!867418 () Bool)

(assert (=> d!162415 (=> res!1065162 e!867418)))

(assert (=> d!162415 (= res!1065162 (or ((_ is Nil!36301) (toList!11224 lm!250)) ((_ is Nil!36301) (t!51031 (toList!11224 lm!250)))))))

(assert (=> d!162415 (= (isStrictlySorted!954 (toList!11224 lm!250)) e!867418)))

(declare-fun b!1557211 () Bool)

(declare-fun e!867419 () Bool)

(assert (=> b!1557211 (= e!867418 e!867419)))

(declare-fun res!1065163 () Bool)

(assert (=> b!1557211 (=> (not res!1065163) (not e!867419))))

(assert (=> b!1557211 (= res!1065163 (bvslt (_1!12469 (h!37746 (toList!11224 lm!250))) (_1!12469 (h!37746 (t!51031 (toList!11224 lm!250))))))))

(declare-fun b!1557212 () Bool)

(assert (=> b!1557212 (= e!867419 (isStrictlySorted!954 (t!51031 (toList!11224 lm!250))))))

(assert (= (and d!162415 (not res!1065162)) b!1557211))

(assert (= (and b!1557211 res!1065163) b!1557212))

(declare-fun m!1434413 () Bool)

(assert (=> b!1557212 m!1434413))

(assert (=> b!1557137 d!162415))

(declare-fun b!1557224 () Bool)

(declare-fun e!867427 () Bool)

(declare-fun tp_is_empty!38373 () Bool)

(declare-fun tp!112488 () Bool)

(assert (=> b!1557224 (= e!867427 (and tp_is_empty!38373 tp!112488))))

(assert (=> b!1557138 (= tp!112479 e!867427)))

(assert (= (and b!1557138 ((_ is Cons!36300) (toList!11224 lm!250))) b!1557224))

(check-sat (not b!1557224) tp_is_empty!38373 (not b!1557212) (not b!1557191) (not d!162413) (not d!162405) (not b!1557189) (not b!1557167))
(check-sat)
