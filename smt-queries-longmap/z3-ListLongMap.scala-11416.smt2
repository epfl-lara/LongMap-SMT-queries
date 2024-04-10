; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133030 () Bool)

(assert start!133030)

(declare-fun b!1557264 () Bool)

(declare-fun res!1065196 () Bool)

(declare-fun e!867445 () Bool)

(assert (=> b!1557264 (=> (not res!1065196) (not e!867445))))

(declare-datatypes ((B!2374 0))(
  ( (B!2375 (val!19273 Int)) )
))
(declare-datatypes ((tuple2!24922 0))(
  ( (tuple2!24923 (_1!12472 (_ BitVec 64)) (_2!12472 B!2374)) )
))
(declare-datatypes ((List!36307 0))(
  ( (Nil!36304) (Cons!36303 (h!37749 tuple2!24922) (t!51034 List!36307)) )
))
(declare-datatypes ((ListLongMap!22423 0))(
  ( (ListLongMap!22424 (toList!11227 List!36307)) )
))
(declare-fun lm!250 () ListLongMap!22423)

(declare-fun isStrictlySorted!957 (List!36307) Bool)

(assert (=> b!1557264 (= res!1065196 (isStrictlySorted!957 (toList!11227 lm!250)))))

(declare-fun b!1557265 () Bool)

(declare-fun e!867446 () Bool)

(declare-fun tp!112497 () Bool)

(assert (=> b!1557265 (= e!867446 tp!112497)))

(declare-fun b!1557266 () Bool)

(declare-fun res!1065199 () Bool)

(assert (=> b!1557266 (=> (not res!1065199) (not e!867445))))

(declare-fun a!524 () (_ BitVec 64))

(declare-fun a0!50 () (_ BitVec 64))

(assert (=> b!1557266 (= res!1065199 (not (= a!524 a0!50)))))

(declare-fun b!1557267 () Bool)

(declare-fun res!1065198 () Bool)

(assert (=> b!1557267 (=> (not res!1065198) (not e!867445))))

(declare-fun containsKey!819 (List!36307 (_ BitVec 64)) Bool)

(assert (=> b!1557267 (= res!1065198 (containsKey!819 (toList!11227 lm!250) a0!50))))

(declare-fun res!1065197 () Bool)

(assert (=> start!133030 (=> (not res!1065197) (not e!867445))))

(declare-fun contains!10195 (ListLongMap!22423 (_ BitVec 64)) Bool)

(assert (=> start!133030 (= res!1065197 (contains!10195 lm!250 a0!50))))

(assert (=> start!133030 e!867445))

(declare-fun inv!57466 (ListLongMap!22423) Bool)

(assert (=> start!133030 (and (inv!57466 lm!250) e!867446)))

(assert (=> start!133030 true))

(declare-fun tp_is_empty!38379 () Bool)

(assert (=> start!133030 tp_is_empty!38379))

(declare-fun b!1557268 () Bool)

(declare-fun res!1065195 () Bool)

(assert (=> b!1557268 (=> (not res!1065195) (not e!867445))))

(assert (=> b!1557268 (= res!1065195 (not (= a0!50 a!524)))))

(declare-fun b!97 () B!2374)

(declare-fun b!1557269 () Bool)

(declare-fun +!5019 (ListLongMap!22423 tuple2!24922) ListLongMap!22423)

(assert (=> b!1557269 (= e!867445 (not (contains!10195 (+!5019 lm!250 (tuple2!24923 a!524 b!97)) a0!50)))))

(declare-fun insertStrictlySorted!556 (List!36307 (_ BitVec 64) B!2374) List!36307)

(assert (=> b!1557269 (containsKey!819 (insertStrictlySorted!556 (toList!11227 lm!250) a!524 b!97) a0!50)))

(declare-datatypes ((Unit!51855 0))(
  ( (Unit!51856) )
))
(declare-fun lt!670526 () Unit!51855)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!2 (List!36307 (_ BitVec 64) B!2374 (_ BitVec 64)) Unit!51855)

(assert (=> b!1557269 (= lt!670526 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!2 (toList!11227 lm!250) a!524 b!97 a0!50))))

(assert (= (and start!133030 res!1065197) b!1557266))

(assert (= (and b!1557266 res!1065199) b!1557264))

(assert (= (and b!1557264 res!1065196) b!1557267))

(assert (= (and b!1557267 res!1065198) b!1557268))

(assert (= (and b!1557268 res!1065195) b!1557269))

(assert (= start!133030 b!1557265))

(declare-fun m!1434435 () Bool)

(assert (=> b!1557264 m!1434435))

(declare-fun m!1434437 () Bool)

(assert (=> b!1557267 m!1434437))

(declare-fun m!1434439 () Bool)

(assert (=> start!133030 m!1434439))

(declare-fun m!1434441 () Bool)

(assert (=> start!133030 m!1434441))

(declare-fun m!1434443 () Bool)

(assert (=> b!1557269 m!1434443))

(declare-fun m!1434445 () Bool)

(assert (=> b!1557269 m!1434445))

(declare-fun m!1434447 () Bool)

(assert (=> b!1557269 m!1434447))

(assert (=> b!1557269 m!1434445))

(assert (=> b!1557269 m!1434443))

(declare-fun m!1434449 () Bool)

(assert (=> b!1557269 m!1434449))

(declare-fun m!1434451 () Bool)

(assert (=> b!1557269 m!1434451))

(check-sat (not start!133030) (not b!1557264) (not b!1557265) tp_is_empty!38379 (not b!1557267) (not b!1557269))
(check-sat)
(get-model)

(declare-fun d!162425 () Bool)

(declare-fun res!1065223 () Bool)

(declare-fun e!867461 () Bool)

(assert (=> d!162425 (=> res!1065223 e!867461)))

(get-info :version)

(assert (=> d!162425 (= res!1065223 (or ((_ is Nil!36304) (toList!11227 lm!250)) ((_ is Nil!36304) (t!51034 (toList!11227 lm!250)))))))

(assert (=> d!162425 (= (isStrictlySorted!957 (toList!11227 lm!250)) e!867461)))

(declare-fun b!1557296 () Bool)

(declare-fun e!867462 () Bool)

(assert (=> b!1557296 (= e!867461 e!867462)))

(declare-fun res!1065224 () Bool)

(assert (=> b!1557296 (=> (not res!1065224) (not e!867462))))

(assert (=> b!1557296 (= res!1065224 (bvslt (_1!12472 (h!37749 (toList!11227 lm!250))) (_1!12472 (h!37749 (t!51034 (toList!11227 lm!250))))))))

(declare-fun b!1557297 () Bool)

(assert (=> b!1557297 (= e!867462 (isStrictlySorted!957 (t!51034 (toList!11227 lm!250))))))

(assert (= (and d!162425 (not res!1065223)) b!1557296))

(assert (= (and b!1557296 res!1065224) b!1557297))

(declare-fun m!1434471 () Bool)

(assert (=> b!1557297 m!1434471))

(assert (=> b!1557264 d!162425))

(declare-fun d!162429 () Bool)

(declare-fun e!867485 () Bool)

(assert (=> d!162429 e!867485))

(declare-fun res!1065243 () Bool)

(assert (=> d!162429 (=> res!1065243 e!867485)))

(declare-fun lt!670549 () Bool)

(assert (=> d!162429 (= res!1065243 (not lt!670549))))

(declare-fun lt!670547 () Bool)

(assert (=> d!162429 (= lt!670549 lt!670547)))

(declare-fun lt!670546 () Unit!51855)

(declare-fun e!867486 () Unit!51855)

(assert (=> d!162429 (= lt!670546 e!867486)))

(declare-fun c!143944 () Bool)

(assert (=> d!162429 (= c!143944 lt!670547)))

(assert (=> d!162429 (= lt!670547 (containsKey!819 (toList!11227 lm!250) a0!50))))

(assert (=> d!162429 (= (contains!10195 lm!250 a0!50) lt!670549)))

(declare-fun b!1557324 () Bool)

(declare-fun lt!670548 () Unit!51855)

(assert (=> b!1557324 (= e!867486 lt!670548)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!525 (List!36307 (_ BitVec 64)) Unit!51855)

(assert (=> b!1557324 (= lt!670548 (lemmaContainsKeyImpliesGetValueByKeyDefined!525 (toList!11227 lm!250) a0!50))))

(declare-datatypes ((Option!860 0))(
  ( (Some!859 (v!22050 B!2374)) (None!858) )
))
(declare-fun isDefined!573 (Option!860) Bool)

(declare-fun getValueByKey!784 (List!36307 (_ BitVec 64)) Option!860)

(assert (=> b!1557324 (isDefined!573 (getValueByKey!784 (toList!11227 lm!250) a0!50))))

(declare-fun b!1557325 () Bool)

(declare-fun Unit!51859 () Unit!51855)

(assert (=> b!1557325 (= e!867486 Unit!51859)))

(declare-fun b!1557326 () Bool)

(assert (=> b!1557326 (= e!867485 (isDefined!573 (getValueByKey!784 (toList!11227 lm!250) a0!50)))))

(assert (= (and d!162429 c!143944) b!1557324))

(assert (= (and d!162429 (not c!143944)) b!1557325))

(assert (= (and d!162429 (not res!1065243)) b!1557326))

(assert (=> d!162429 m!1434437))

(declare-fun m!1434479 () Bool)

(assert (=> b!1557324 m!1434479))

(declare-fun m!1434481 () Bool)

(assert (=> b!1557324 m!1434481))

(assert (=> b!1557324 m!1434481))

(declare-fun m!1434483 () Bool)

(assert (=> b!1557324 m!1434483))

(assert (=> b!1557326 m!1434481))

(assert (=> b!1557326 m!1434481))

(assert (=> b!1557326 m!1434483))

(assert (=> start!133030 d!162429))

(declare-fun d!162437 () Bool)

(assert (=> d!162437 (= (inv!57466 lm!250) (isStrictlySorted!957 (toList!11227 lm!250)))))

(declare-fun bs!44765 () Bool)

(assert (= bs!44765 d!162437))

(assert (=> bs!44765 m!1434435))

(assert (=> start!133030 d!162437))

(declare-fun d!162439 () Bool)

(declare-fun e!867528 () Bool)

(assert (=> d!162439 e!867528))

(declare-fun res!1065263 () Bool)

(assert (=> d!162439 (=> (not res!1065263) (not e!867528))))

(declare-fun lt!670572 () List!36307)

(assert (=> d!162439 (= res!1065263 (isStrictlySorted!957 lt!670572))))

(declare-fun e!867531 () List!36307)

(assert (=> d!162439 (= lt!670572 e!867531)))

(declare-fun c!143974 () Bool)

(assert (=> d!162439 (= c!143974 (and ((_ is Cons!36303) (toList!11227 lm!250)) (bvslt (_1!12472 (h!37749 (toList!11227 lm!250))) a!524)))))

(assert (=> d!162439 (isStrictlySorted!957 (toList!11227 lm!250))))

(assert (=> d!162439 (= (insertStrictlySorted!556 (toList!11227 lm!250) a!524 b!97) lt!670572)))

(declare-fun e!867527 () List!36307)

(declare-fun b!1557397 () Bool)

(declare-fun c!143972 () Bool)

(declare-fun c!143971 () Bool)

(assert (=> b!1557397 (= e!867527 (ite c!143972 (t!51034 (toList!11227 lm!250)) (ite c!143971 (Cons!36303 (h!37749 (toList!11227 lm!250)) (t!51034 (toList!11227 lm!250))) Nil!36304)))))

(declare-fun b!1557398 () Bool)

(assert (=> b!1557398 (= c!143971 (and ((_ is Cons!36303) (toList!11227 lm!250)) (bvsgt (_1!12472 (h!37749 (toList!11227 lm!250))) a!524)))))

(declare-fun e!867530 () List!36307)

(declare-fun e!867529 () List!36307)

(assert (=> b!1557398 (= e!867530 e!867529)))

(declare-fun bm!71675 () Bool)

(declare-fun call!71678 () List!36307)

(declare-fun $colon$colon!972 (List!36307 tuple2!24922) List!36307)

(assert (=> bm!71675 (= call!71678 ($colon$colon!972 e!867527 (ite c!143974 (h!37749 (toList!11227 lm!250)) (tuple2!24923 a!524 b!97))))))

(declare-fun c!143973 () Bool)

(assert (=> bm!71675 (= c!143973 c!143974)))

(declare-fun bm!71676 () Bool)

(declare-fun call!71680 () List!36307)

(declare-fun call!71679 () List!36307)

(assert (=> bm!71676 (= call!71680 call!71679)))

(declare-fun b!1557399 () Bool)

(assert (=> b!1557399 (= e!867527 (insertStrictlySorted!556 (t!51034 (toList!11227 lm!250)) a!524 b!97))))

(declare-fun bm!71677 () Bool)

(assert (=> bm!71677 (= call!71679 call!71678)))

(declare-fun b!1557400 () Bool)

(assert (=> b!1557400 (= e!867529 call!71680)))

(declare-fun b!1557401 () Bool)

(assert (=> b!1557401 (= e!867531 call!71678)))

(declare-fun b!1557402 () Bool)

(assert (=> b!1557402 (= e!867530 call!71679)))

(declare-fun b!1557403 () Bool)

(assert (=> b!1557403 (= e!867529 call!71680)))

(declare-fun b!1557404 () Bool)

(declare-fun contains!10197 (List!36307 tuple2!24922) Bool)

(assert (=> b!1557404 (= e!867528 (contains!10197 lt!670572 (tuple2!24923 a!524 b!97)))))

(declare-fun b!1557405 () Bool)

(declare-fun res!1065262 () Bool)

(assert (=> b!1557405 (=> (not res!1065262) (not e!867528))))

(assert (=> b!1557405 (= res!1065262 (containsKey!819 lt!670572 a!524))))

(declare-fun b!1557406 () Bool)

(assert (=> b!1557406 (= e!867531 e!867530)))

(assert (=> b!1557406 (= c!143972 (and ((_ is Cons!36303) (toList!11227 lm!250)) (= (_1!12472 (h!37749 (toList!11227 lm!250))) a!524)))))

(assert (= (and d!162439 c!143974) b!1557401))

(assert (= (and d!162439 (not c!143974)) b!1557406))

(assert (= (and b!1557406 c!143972) b!1557402))

(assert (= (and b!1557406 (not c!143972)) b!1557398))

(assert (= (and b!1557398 c!143971) b!1557403))

(assert (= (and b!1557398 (not c!143971)) b!1557400))

(assert (= (or b!1557403 b!1557400) bm!71676))

(assert (= (or b!1557402 bm!71676) bm!71677))

(assert (= (or b!1557401 bm!71677) bm!71675))

(assert (= (and bm!71675 c!143973) b!1557399))

(assert (= (and bm!71675 (not c!143973)) b!1557397))

(assert (= (and d!162439 res!1065263) b!1557405))

(assert (= (and b!1557405 res!1065262) b!1557404))

(declare-fun m!1434499 () Bool)

(assert (=> b!1557405 m!1434499))

(declare-fun m!1434501 () Bool)

(assert (=> d!162439 m!1434501))

(assert (=> d!162439 m!1434435))

(declare-fun m!1434503 () Bool)

(assert (=> b!1557399 m!1434503))

(declare-fun m!1434505 () Bool)

(assert (=> b!1557404 m!1434505))

(declare-fun m!1434507 () Bool)

(assert (=> bm!71675 m!1434507))

(assert (=> b!1557269 d!162439))

(declare-fun d!162451 () Bool)

(declare-fun e!867536 () Bool)

(assert (=> d!162451 e!867536))

(declare-fun res!1065266 () Bool)

(assert (=> d!162451 (=> res!1065266 e!867536)))

(declare-fun lt!670576 () Bool)

(assert (=> d!162451 (= res!1065266 (not lt!670576))))

(declare-fun lt!670574 () Bool)

(assert (=> d!162451 (= lt!670576 lt!670574)))

(declare-fun lt!670573 () Unit!51855)

(declare-fun e!867537 () Unit!51855)

(assert (=> d!162451 (= lt!670573 e!867537)))

(declare-fun c!143977 () Bool)

(assert (=> d!162451 (= c!143977 lt!670574)))

(assert (=> d!162451 (= lt!670574 (containsKey!819 (toList!11227 (+!5019 lm!250 (tuple2!24923 a!524 b!97))) a0!50))))

(assert (=> d!162451 (= (contains!10195 (+!5019 lm!250 (tuple2!24923 a!524 b!97)) a0!50) lt!670576)))

(declare-fun b!1557411 () Bool)

(declare-fun lt!670575 () Unit!51855)

(assert (=> b!1557411 (= e!867537 lt!670575)))

(assert (=> b!1557411 (= lt!670575 (lemmaContainsKeyImpliesGetValueByKeyDefined!525 (toList!11227 (+!5019 lm!250 (tuple2!24923 a!524 b!97))) a0!50))))

(assert (=> b!1557411 (isDefined!573 (getValueByKey!784 (toList!11227 (+!5019 lm!250 (tuple2!24923 a!524 b!97))) a0!50))))

(declare-fun b!1557412 () Bool)

(declare-fun Unit!51862 () Unit!51855)

(assert (=> b!1557412 (= e!867537 Unit!51862)))

(declare-fun b!1557413 () Bool)

(assert (=> b!1557413 (= e!867536 (isDefined!573 (getValueByKey!784 (toList!11227 (+!5019 lm!250 (tuple2!24923 a!524 b!97))) a0!50)))))

(assert (= (and d!162451 c!143977) b!1557411))

(assert (= (and d!162451 (not c!143977)) b!1557412))

(assert (= (and d!162451 (not res!1065266)) b!1557413))

(declare-fun m!1434509 () Bool)

(assert (=> d!162451 m!1434509))

(declare-fun m!1434511 () Bool)

(assert (=> b!1557411 m!1434511))

(declare-fun m!1434513 () Bool)

(assert (=> b!1557411 m!1434513))

(assert (=> b!1557411 m!1434513))

(declare-fun m!1434515 () Bool)

(assert (=> b!1557411 m!1434515))

(assert (=> b!1557413 m!1434513))

(assert (=> b!1557413 m!1434513))

(assert (=> b!1557413 m!1434515))

(assert (=> b!1557269 d!162451))

(declare-fun d!162453 () Bool)

(assert (=> d!162453 (containsKey!819 (insertStrictlySorted!556 (toList!11227 lm!250) a!524 b!97) a0!50)))

(declare-fun lt!670589 () Unit!51855)

(declare-fun choose!2064 (List!36307 (_ BitVec 64) B!2374 (_ BitVec 64)) Unit!51855)

(assert (=> d!162453 (= lt!670589 (choose!2064 (toList!11227 lm!250) a!524 b!97 a0!50))))

(declare-fun e!867554 () Bool)

(assert (=> d!162453 e!867554))

(declare-fun res!1065279 () Bool)

(assert (=> d!162453 (=> (not res!1065279) (not e!867554))))

(assert (=> d!162453 (= res!1065279 (isStrictlySorted!957 (toList!11227 lm!250)))))

(assert (=> d!162453 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!2 (toList!11227 lm!250) a!524 b!97 a0!50) lt!670589)))

(declare-fun b!1557448 () Bool)

(declare-fun res!1065280 () Bool)

(assert (=> b!1557448 (=> (not res!1065280) (not e!867554))))

(assert (=> b!1557448 (= res!1065280 (containsKey!819 (toList!11227 lm!250) a0!50))))

(declare-fun b!1557449 () Bool)

(assert (=> b!1557449 (= e!867554 (not (= a0!50 a!524)))))

(assert (= (and d!162453 res!1065279) b!1557448))

(assert (= (and b!1557448 res!1065280) b!1557449))

(assert (=> d!162453 m!1434445))

(assert (=> d!162453 m!1434445))

(assert (=> d!162453 m!1434447))

(declare-fun m!1434553 () Bool)

(assert (=> d!162453 m!1434553))

(assert (=> d!162453 m!1434435))

(assert (=> b!1557448 m!1434437))

(assert (=> b!1557269 d!162453))

(declare-fun d!162463 () Bool)

(declare-fun res!1065297 () Bool)

(declare-fun e!867566 () Bool)

(assert (=> d!162463 (=> res!1065297 e!867566)))

(assert (=> d!162463 (= res!1065297 (and ((_ is Cons!36303) (insertStrictlySorted!556 (toList!11227 lm!250) a!524 b!97)) (= (_1!12472 (h!37749 (insertStrictlySorted!556 (toList!11227 lm!250) a!524 b!97))) a0!50)))))

(assert (=> d!162463 (= (containsKey!819 (insertStrictlySorted!556 (toList!11227 lm!250) a!524 b!97) a0!50) e!867566)))

(declare-fun b!1557466 () Bool)

(declare-fun e!867567 () Bool)

(assert (=> b!1557466 (= e!867566 e!867567)))

(declare-fun res!1065298 () Bool)

(assert (=> b!1557466 (=> (not res!1065298) (not e!867567))))

(assert (=> b!1557466 (= res!1065298 (and (or (not ((_ is Cons!36303) (insertStrictlySorted!556 (toList!11227 lm!250) a!524 b!97))) (bvsle (_1!12472 (h!37749 (insertStrictlySorted!556 (toList!11227 lm!250) a!524 b!97))) a0!50)) ((_ is Cons!36303) (insertStrictlySorted!556 (toList!11227 lm!250) a!524 b!97)) (bvslt (_1!12472 (h!37749 (insertStrictlySorted!556 (toList!11227 lm!250) a!524 b!97))) a0!50)))))

(declare-fun b!1557467 () Bool)

(assert (=> b!1557467 (= e!867567 (containsKey!819 (t!51034 (insertStrictlySorted!556 (toList!11227 lm!250) a!524 b!97)) a0!50))))

(assert (= (and d!162463 (not res!1065297)) b!1557466))

(assert (= (and b!1557466 res!1065298) b!1557467))

(declare-fun m!1434559 () Bool)

(assert (=> b!1557467 m!1434559))

(assert (=> b!1557269 d!162463))

(declare-fun d!162469 () Bool)

(declare-fun e!867578 () Bool)

(assert (=> d!162469 e!867578))

(declare-fun res!1065318 () Bool)

(assert (=> d!162469 (=> (not res!1065318) (not e!867578))))

(declare-fun lt!670626 () ListLongMap!22423)

(assert (=> d!162469 (= res!1065318 (contains!10195 lt!670626 (_1!12472 (tuple2!24923 a!524 b!97))))))

(declare-fun lt!670627 () List!36307)

(assert (=> d!162469 (= lt!670626 (ListLongMap!22424 lt!670627))))

(declare-fun lt!670625 () Unit!51855)

(declare-fun lt!670624 () Unit!51855)

(assert (=> d!162469 (= lt!670625 lt!670624)))

(assert (=> d!162469 (= (getValueByKey!784 lt!670627 (_1!12472 (tuple2!24923 a!524 b!97))) (Some!859 (_2!12472 (tuple2!24923 a!524 b!97))))))

(declare-fun lemmaContainsTupThenGetReturnValue!381 (List!36307 (_ BitVec 64) B!2374) Unit!51855)

(assert (=> d!162469 (= lt!670624 (lemmaContainsTupThenGetReturnValue!381 lt!670627 (_1!12472 (tuple2!24923 a!524 b!97)) (_2!12472 (tuple2!24923 a!524 b!97))))))

(assert (=> d!162469 (= lt!670627 (insertStrictlySorted!556 (toList!11227 lm!250) (_1!12472 (tuple2!24923 a!524 b!97)) (_2!12472 (tuple2!24923 a!524 b!97))))))

(assert (=> d!162469 (= (+!5019 lm!250 (tuple2!24923 a!524 b!97)) lt!670626)))

(declare-fun b!1557486 () Bool)

(declare-fun res!1065317 () Bool)

(assert (=> b!1557486 (=> (not res!1065317) (not e!867578))))

(assert (=> b!1557486 (= res!1065317 (= (getValueByKey!784 (toList!11227 lt!670626) (_1!12472 (tuple2!24923 a!524 b!97))) (Some!859 (_2!12472 (tuple2!24923 a!524 b!97)))))))

(declare-fun b!1557487 () Bool)

(assert (=> b!1557487 (= e!867578 (contains!10197 (toList!11227 lt!670626) (tuple2!24923 a!524 b!97)))))

(assert (= (and d!162469 res!1065318) b!1557486))

(assert (= (and b!1557486 res!1065317) b!1557487))

(declare-fun m!1434577 () Bool)

(assert (=> d!162469 m!1434577))

(declare-fun m!1434579 () Bool)

(assert (=> d!162469 m!1434579))

(declare-fun m!1434581 () Bool)

(assert (=> d!162469 m!1434581))

(declare-fun m!1434583 () Bool)

(assert (=> d!162469 m!1434583))

(declare-fun m!1434585 () Bool)

(assert (=> b!1557486 m!1434585))

(declare-fun m!1434587 () Bool)

(assert (=> b!1557487 m!1434587))

(assert (=> b!1557269 d!162469))

(declare-fun d!162475 () Bool)

(declare-fun res!1065319 () Bool)

(declare-fun e!867581 () Bool)

(assert (=> d!162475 (=> res!1065319 e!867581)))

(assert (=> d!162475 (= res!1065319 (and ((_ is Cons!36303) (toList!11227 lm!250)) (= (_1!12472 (h!37749 (toList!11227 lm!250))) a0!50)))))

(assert (=> d!162475 (= (containsKey!819 (toList!11227 lm!250) a0!50) e!867581)))

(declare-fun b!1557492 () Bool)

(declare-fun e!867582 () Bool)

(assert (=> b!1557492 (= e!867581 e!867582)))

(declare-fun res!1065320 () Bool)

(assert (=> b!1557492 (=> (not res!1065320) (not e!867582))))

(assert (=> b!1557492 (= res!1065320 (and (or (not ((_ is Cons!36303) (toList!11227 lm!250))) (bvsle (_1!12472 (h!37749 (toList!11227 lm!250))) a0!50)) ((_ is Cons!36303) (toList!11227 lm!250)) (bvslt (_1!12472 (h!37749 (toList!11227 lm!250))) a0!50)))))

(declare-fun b!1557493 () Bool)

(assert (=> b!1557493 (= e!867582 (containsKey!819 (t!51034 (toList!11227 lm!250)) a0!50))))

(assert (= (and d!162475 (not res!1065319)) b!1557492))

(assert (= (and b!1557492 res!1065320) b!1557493))

(declare-fun m!1434589 () Bool)

(assert (=> b!1557493 m!1434589))

(assert (=> b!1557267 d!162475))

(declare-fun b!1557501 () Bool)

(declare-fun e!867587 () Bool)

(declare-fun tp!112506 () Bool)

(assert (=> b!1557501 (= e!867587 (and tp_is_empty!38379 tp!112506))))

(assert (=> b!1557265 (= tp!112497 e!867587)))

(assert (= (and b!1557265 ((_ is Cons!36303) (toList!11227 lm!250))) b!1557501))

(check-sat (not bm!71675) (not b!1557399) (not d!162437) (not b!1557501) (not d!162439) (not b!1557405) (not b!1557467) (not b!1557404) (not d!162469) (not b!1557448) (not b!1557487) (not b!1557486) (not d!162453) (not b!1557411) (not b!1557324) (not b!1557297) (not d!162429) tp_is_empty!38379 (not d!162451) (not b!1557326) (not b!1557413) (not b!1557493))
(check-sat)
