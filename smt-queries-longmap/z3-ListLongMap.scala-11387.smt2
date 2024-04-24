; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132810 () Bool)

(assert start!132810)

(declare-fun res!1064112 () Bool)

(declare-fun e!866393 () Bool)

(assert (=> start!132810 (=> (not res!1064112) (not e!866393))))

(declare-datatypes ((B!2198 0))(
  ( (B!2199 (val!19185 Int)) )
))
(declare-datatypes ((tuple2!24800 0))(
  ( (tuple2!24801 (_1!12411 (_ BitVec 64)) (_2!12411 B!2198)) )
))
(declare-datatypes ((List!36248 0))(
  ( (Nil!36245) (Cons!36244 (h!37708 tuple2!24800) (t!50961 List!36248)) )
))
(declare-datatypes ((ListLongMap!22417 0))(
  ( (ListLongMap!22418 (toList!11224 List!36248)) )
))
(declare-fun lm!249 () ListLongMap!22417)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun contains!10178 (ListLongMap!22417 (_ BitVec 64)) Bool)

(assert (=> start!132810 (= res!1064112 (contains!10178 lm!249 a0!49))))

(assert (=> start!132810 e!866393))

(declare-fun e!866392 () Bool)

(declare-fun inv!57287 (ListLongMap!22417) Bool)

(assert (=> start!132810 (and (inv!57287 lm!249) e!866392)))

(assert (=> start!132810 true))

(declare-fun b!1555872 () Bool)

(declare-fun res!1064111 () Bool)

(assert (=> b!1555872 (=> (not res!1064111) (not e!866393))))

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1555872 (= res!1064111 (not (= a0!49 a!523)))))

(declare-fun b!1555873 () Bool)

(declare-fun isStrictlySorted!876 (List!36248) Bool)

(assert (=> b!1555873 (= e!866393 (not (isStrictlySorted!876 (toList!11224 lm!249))))))

(declare-fun b!1555874 () Bool)

(declare-fun tp!112083 () Bool)

(assert (=> b!1555874 (= e!866392 tp!112083)))

(assert (= (and start!132810 res!1064112) b!1555872))

(assert (= (and b!1555872 res!1064111) b!1555873))

(assert (= start!132810 b!1555874))

(declare-fun m!1434383 () Bool)

(assert (=> start!132810 m!1434383))

(declare-fun m!1434385 () Bool)

(assert (=> start!132810 m!1434385))

(declare-fun m!1434387 () Bool)

(assert (=> b!1555873 m!1434387))

(check-sat (not start!132810) (not b!1555873) (not b!1555874))
(check-sat)
(get-model)

(declare-fun d!162249 () Bool)

(declare-fun e!866423 () Bool)

(assert (=> d!162249 e!866423))

(declare-fun res!1064139 () Bool)

(assert (=> d!162249 (=> res!1064139 e!866423)))

(declare-fun lt!670577 () Bool)

(assert (=> d!162249 (= res!1064139 (not lt!670577))))

(declare-fun lt!670578 () Bool)

(assert (=> d!162249 (= lt!670577 lt!670578)))

(declare-datatypes ((Unit!51646 0))(
  ( (Unit!51647) )
))
(declare-fun lt!670579 () Unit!51646)

(declare-fun e!866422 () Unit!51646)

(assert (=> d!162249 (= lt!670579 e!866422)))

(declare-fun c!144055 () Bool)

(assert (=> d!162249 (= c!144055 lt!670578)))

(declare-fun containsKey!755 (List!36248 (_ BitVec 64)) Bool)

(assert (=> d!162249 (= lt!670578 (containsKey!755 (toList!11224 lm!249) a0!49))))

(assert (=> d!162249 (= (contains!10178 lm!249 a0!49) lt!670577)))

(declare-fun b!1555911 () Bool)

(declare-fun lt!670576 () Unit!51646)

(assert (=> b!1555911 (= e!866422 lt!670576)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!501 (List!36248 (_ BitVec 64)) Unit!51646)

(assert (=> b!1555911 (= lt!670576 (lemmaContainsKeyImpliesGetValueByKeyDefined!501 (toList!11224 lm!249) a0!49))))

(declare-datatypes ((Option!804 0))(
  ( (Some!803 (v!21985 B!2198)) (None!802) )
))
(declare-fun isDefined!547 (Option!804) Bool)

(declare-fun getValueByKey!729 (List!36248 (_ BitVec 64)) Option!804)

(assert (=> b!1555911 (isDefined!547 (getValueByKey!729 (toList!11224 lm!249) a0!49))))

(declare-fun b!1555912 () Bool)

(declare-fun Unit!51648 () Unit!51646)

(assert (=> b!1555912 (= e!866422 Unit!51648)))

(declare-fun b!1555913 () Bool)

(assert (=> b!1555913 (= e!866423 (isDefined!547 (getValueByKey!729 (toList!11224 lm!249) a0!49)))))

(assert (= (and d!162249 c!144055) b!1555911))

(assert (= (and d!162249 (not c!144055)) b!1555912))

(assert (= (and d!162249 (not res!1064139)) b!1555913))

(declare-fun m!1434405 () Bool)

(assert (=> d!162249 m!1434405))

(declare-fun m!1434407 () Bool)

(assert (=> b!1555911 m!1434407))

(declare-fun m!1434409 () Bool)

(assert (=> b!1555911 m!1434409))

(assert (=> b!1555911 m!1434409))

(declare-fun m!1434411 () Bool)

(assert (=> b!1555911 m!1434411))

(assert (=> b!1555913 m!1434409))

(assert (=> b!1555913 m!1434409))

(assert (=> b!1555913 m!1434411))

(assert (=> start!132810 d!162249))

(declare-fun d!162259 () Bool)

(assert (=> d!162259 (= (inv!57287 lm!249) (isStrictlySorted!876 (toList!11224 lm!249)))))

(declare-fun bs!44663 () Bool)

(assert (= bs!44663 d!162259))

(assert (=> bs!44663 m!1434387))

(assert (=> start!132810 d!162259))

(declare-fun d!162261 () Bool)

(declare-fun res!1064146 () Bool)

(declare-fun e!866434 () Bool)

(assert (=> d!162261 (=> res!1064146 e!866434)))

(get-info :version)

(assert (=> d!162261 (= res!1064146 (or ((_ is Nil!36245) (toList!11224 lm!249)) ((_ is Nil!36245) (t!50961 (toList!11224 lm!249)))))))

(assert (=> d!162261 (= (isStrictlySorted!876 (toList!11224 lm!249)) e!866434)))

(declare-fun b!1555928 () Bool)

(declare-fun e!866435 () Bool)

(assert (=> b!1555928 (= e!866434 e!866435)))

(declare-fun res!1064147 () Bool)

(assert (=> b!1555928 (=> (not res!1064147) (not e!866435))))

(assert (=> b!1555928 (= res!1064147 (bvslt (_1!12411 (h!37708 (toList!11224 lm!249))) (_1!12411 (h!37708 (t!50961 (toList!11224 lm!249))))))))

(declare-fun b!1555929 () Bool)

(assert (=> b!1555929 (= e!866435 (isStrictlySorted!876 (t!50961 (toList!11224 lm!249))))))

(assert (= (and d!162261 (not res!1064146)) b!1555928))

(assert (= (and b!1555928 res!1064147) b!1555929))

(declare-fun m!1434413 () Bool)

(assert (=> b!1555929 m!1434413))

(assert (=> b!1555873 d!162261))

(declare-fun b!1555939 () Bool)

(declare-fun e!866442 () Bool)

(declare-fun tp_is_empty!38215 () Bool)

(declare-fun tp!112092 () Bool)

(assert (=> b!1555939 (= e!866442 (and tp_is_empty!38215 tp!112092))))

(assert (=> b!1555874 (= tp!112083 e!866442)))

(assert (= (and b!1555874 ((_ is Cons!36244) (toList!11224 lm!249))) b!1555939))

(check-sat (not b!1555929) (not d!162249) (not d!162259) tp_is_empty!38215 (not b!1555913) (not b!1555911) (not b!1555939))
(check-sat)
