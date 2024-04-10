; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133080 () Bool)

(assert start!133080)

(declare-fun res!1065340 () Bool)

(declare-fun e!867608 () Bool)

(assert (=> start!133080 (=> (not res!1065340) (not e!867608))))

(declare-datatypes ((B!2382 0))(
  ( (B!2383 (val!19277 Int)) )
))
(declare-datatypes ((tuple2!24930 0))(
  ( (tuple2!24931 (_1!12476 (_ BitVec 64)) (_2!12476 B!2382)) )
))
(declare-datatypes ((List!36311 0))(
  ( (Nil!36308) (Cons!36307 (h!37753 tuple2!24930) (t!51038 List!36311)) )
))
(declare-datatypes ((ListLongMap!22431 0))(
  ( (ListLongMap!22432 (toList!11231 List!36311)) )
))
(declare-fun lm!250 () ListLongMap!22431)

(declare-fun a0!50 () (_ BitVec 64))

(declare-fun contains!10202 (ListLongMap!22431 (_ BitVec 64)) Bool)

(assert (=> start!133080 (= res!1065340 (contains!10202 lm!250 a0!50))))

(assert (=> start!133080 e!867608))

(declare-fun e!867607 () Bool)

(declare-fun inv!57475 (ListLongMap!22431) Bool)

(assert (=> start!133080 (and (inv!57475 lm!250) e!867607)))

(assert (=> start!133080 true))

(declare-fun tp_is_empty!38387 () Bool)

(assert (=> start!133080 tp_is_empty!38387))

(declare-fun b!1557531 () Bool)

(declare-fun res!1065339 () Bool)

(assert (=> b!1557531 (=> (not res!1065339) (not e!867608))))

(declare-fun a!524 () (_ BitVec 64))

(assert (=> b!1557531 (= res!1065339 (= a!524 a0!50))))

(declare-fun b!1557532 () Bool)

(declare-fun b!97 () B!2382)

(declare-fun +!5023 (ListLongMap!22431 tuple2!24930) ListLongMap!22431)

(assert (=> b!1557532 (= e!867608 (not (contains!10202 (+!5023 lm!250 (tuple2!24931 a!524 b!97)) a0!50)))))

(declare-fun b!1557533 () Bool)

(declare-fun tp!112518 () Bool)

(assert (=> b!1557533 (= e!867607 tp!112518)))

(assert (= (and start!133080 res!1065340) b!1557531))

(assert (= (and b!1557531 res!1065339) b!1557532))

(assert (= start!133080 b!1557533))

(declare-fun m!1434619 () Bool)

(assert (=> start!133080 m!1434619))

(declare-fun m!1434621 () Bool)

(assert (=> start!133080 m!1434621))

(declare-fun m!1434623 () Bool)

(assert (=> b!1557532 m!1434623))

(assert (=> b!1557532 m!1434623))

(declare-fun m!1434625 () Bool)

(assert (=> b!1557532 m!1434625))

(push 1)

(assert (not b!1557532))

(assert (not start!133080))

(assert (not b!1557533))

(assert tp_is_empty!38387)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162481 () Bool)

(declare-fun e!867624 () Bool)

(assert (=> d!162481 e!867624))

(declare-fun res!1065348 () Bool)

(assert (=> d!162481 (=> res!1065348 e!867624)))

(declare-fun lt!670662 () Bool)

(assert (=> d!162481 (= res!1065348 (not lt!670662))))

(declare-fun lt!670663 () Bool)

(assert (=> d!162481 (= lt!670662 lt!670663)))

(declare-datatypes ((Unit!51869 0))(
  ( (Unit!51870) )
))
(declare-fun lt!670661 () Unit!51869)

(declare-fun e!867623 () Unit!51869)

(assert (=> d!162481 (= lt!670661 e!867623)))

(declare-fun c!143995 () Bool)

(assert (=> d!162481 (= c!143995 lt!670663)))

(declare-fun containsKey!823 (List!36311 (_ BitVec 64)) Bool)

(assert (=> d!162481 (= lt!670663 (containsKey!823 (toList!11231 (+!5023 lm!250 (tuple2!24931 a!524 b!97))) a0!50))))

(assert (=> d!162481 (= (contains!10202 (+!5023 lm!250 (tuple2!24931 a!524 b!97)) a0!50) lt!670662)))

(declare-fun b!1557555 () Bool)

(declare-fun lt!670660 () Unit!51869)

(assert (=> b!1557555 (= e!867623 lt!670660)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!530 (List!36311 (_ BitVec 64)) Unit!51869)

(assert (=> b!1557555 (= lt!670660 (lemmaContainsKeyImpliesGetValueByKeyDefined!530 (toList!11231 (+!5023 lm!250 (tuple2!24931 a!524 b!97))) a0!50))))

(declare-datatypes ((Option!865 0))(
  ( (Some!864 (v!22055 B!2382)) (None!863) )
))
(declare-fun isDefined!578 (Option!865) Bool)

(declare-fun getValueByKey!789 (List!36311 (_ BitVec 64)) Option!865)

(assert (=> b!1557555 (isDefined!578 (getValueByKey!789 (toList!11231 (+!5023 lm!250 (tuple2!24931 a!524 b!97))) a0!50))))

(declare-fun b!1557556 () Bool)

(declare-fun Unit!51873 () Unit!51869)

(assert (=> b!1557556 (= e!867623 Unit!51873)))

(declare-fun b!1557557 () Bool)

(assert (=> b!1557557 (= e!867624 (isDefined!578 (getValueByKey!789 (toList!11231 (+!5023 lm!250 (tuple2!24931 a!524 b!97))) a0!50)))))

(assert (= (and d!162481 c!143995) b!1557555))

(assert (= (and d!162481 (not c!143995)) b!1557556))

(assert (= (and d!162481 (not res!1065348)) b!1557557))

(declare-fun m!1434629 () Bool)

(assert (=> d!162481 m!1434629))

(declare-fun m!1434633 () Bool)

(assert (=> b!1557555 m!1434633))

(declare-fun m!1434637 () Bool)

(assert (=> b!1557555 m!1434637))

(assert (=> b!1557555 m!1434637))

(declare-fun m!1434645 () Bool)

(assert (=> b!1557555 m!1434645))

(assert (=> b!1557557 m!1434637))

(assert (=> b!1557557 m!1434637))

(assert (=> b!1557557 m!1434645))

(assert (=> b!1557532 d!162481))

(declare-fun d!162487 () Bool)

(declare-fun e!867635 () Bool)

(assert (=> d!162487 e!867635))

(declare-fun res!1065364 () Bool)

(assert (=> d!162487 (=> (not res!1065364) (not e!867635))))

(declare-fun lt!670699 () ListLongMap!22431)

(assert (=> d!162487 (= res!1065364 (contains!10202 lt!670699 (_1!12476 (tuple2!24931 a!524 b!97))))))

(declare-fun lt!670697 () List!36311)

(assert (=> d!162487 (= lt!670699 (ListLongMap!22432 lt!670697))))

(declare-fun lt!670696 () Unit!51869)

(declare-fun lt!670698 () Unit!51869)

(assert (=> d!162487 (= lt!670696 lt!670698)))

(assert (=> d!162487 (= (getValueByKey!789 lt!670697 (_1!12476 (tuple2!24931 a!524 b!97))) (Some!864 (_2!12476 (tuple2!24931 a!524 b!97))))))

(declare-fun lemmaContainsTupThenGetReturnValue!384 (List!36311 (_ BitVec 64) B!2382) Unit!51869)

(assert (=> d!162487 (= lt!670698 (lemmaContainsTupThenGetReturnValue!384 lt!670697 (_1!12476 (tuple2!24931 a!524 b!97)) (_2!12476 (tuple2!24931 a!524 b!97))))))

(declare-fun insertStrictlySorted!559 (List!36311 (_ BitVec 64) B!2382) List!36311)

(assert (=> d!162487 (= lt!670697 (insertStrictlySorted!559 (toList!11231 lm!250) (_1!12476 (tuple2!24931 a!524 b!97)) (_2!12476 (tuple2!24931 a!524 b!97))))))

(assert (=> d!162487 (= (+!5023 lm!250 (tuple2!24931 a!524 b!97)) lt!670699)))

(declare-fun b!1557576 () Bool)

(declare-fun res!1065363 () Bool)

(assert (=> b!1557576 (=> (not res!1065363) (not e!867635))))

(assert (=> b!1557576 (= res!1065363 (= (getValueByKey!789 (toList!11231 lt!670699) (_1!12476 (tuple2!24931 a!524 b!97))) (Some!864 (_2!12476 (tuple2!24931 a!524 b!97)))))))

(declare-fun b!1557577 () Bool)

(declare-fun contains!10204 (List!36311 tuple2!24930) Bool)

(assert (=> b!1557577 (= e!867635 (contains!10204 (toList!11231 lt!670699) (tuple2!24931 a!524 b!97)))))

(assert (= (and d!162487 res!1065364) b!1557576))

(assert (= (and b!1557576 res!1065363) b!1557577))

(declare-fun m!1434661 () Bool)

(assert (=> d!162487 m!1434661))

(declare-fun m!1434663 () Bool)

(assert (=> d!162487 m!1434663))

(declare-fun m!1434667 () Bool)

(assert (=> d!162487 m!1434667))

(declare-fun m!1434671 () Bool)

(assert (=> d!162487 m!1434671))

(declare-fun m!1434675 () Bool)

(assert (=> b!1557576 m!1434675))

(declare-fun m!1434679 () Bool)

(assert (=> b!1557577 m!1434679))

(assert (=> b!1557532 d!162487))

(declare-fun d!162495 () Bool)

(declare-fun e!867638 () Bool)

(assert (=> d!162495 e!867638))

(declare-fun res!1065367 () Bool)

(assert (=> d!162495 (=> res!1065367 e!867638)))

(declare-fun lt!670706 () Bool)

(assert (=> d!162495 (= res!1065367 (not lt!670706))))

(declare-fun lt!670707 () Bool)

(assert (=> d!162495 (= lt!670706 lt!670707)))

(declare-fun lt!670705 () Unit!51869)

(declare-fun e!867637 () Unit!51869)

(assert (=> d!162495 (= lt!670705 e!867637)))

(declare-fun c!143998 () Bool)

(assert (=> d!162495 (= c!143998 lt!670707)))

(assert (=> d!162495 (= lt!670707 (containsKey!823 (toList!11231 lm!250) a0!50))))

(assert (=> d!162495 (= (contains!10202 lm!250 a0!50) lt!670706)))

