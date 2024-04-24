; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133492 () Bool)

(assert start!133492)

(declare-fun res!1066199 () Bool)

(declare-fun e!869116 () Bool)

(assert (=> start!133492 (=> (not res!1066199) (not e!869116))))

(declare-datatypes ((B!2382 0))(
  ( (B!2383 (val!19277 Int)) )
))
(declare-datatypes ((tuple2!24984 0))(
  ( (tuple2!24985 (_1!12503 (_ BitVec 64)) (_2!12503 B!2382)) )
))
(declare-datatypes ((List!36340 0))(
  ( (Nil!36337) (Cons!36336 (h!37800 tuple2!24984) (t!51059 List!36340)) )
))
(declare-datatypes ((ListLongMap!22493 0))(
  ( (ListLongMap!22494 (toList!11262 List!36340)) )
))
(declare-fun lm!250 () ListLongMap!22493)

(declare-fun a0!50 () (_ BitVec 64))

(declare-fun contains!10246 (ListLongMap!22493 (_ BitVec 64)) Bool)

(assert (=> start!133492 (= res!1066199 (contains!10246 lm!250 a0!50))))

(assert (=> start!133492 e!869116))

(declare-fun e!869117 () Bool)

(declare-fun inv!57475 (ListLongMap!22493) Bool)

(assert (=> start!133492 (and (inv!57475 lm!250) e!869117)))

(assert (=> start!133492 true))

(declare-fun tp_is_empty!38387 () Bool)

(assert (=> start!133492 tp_is_empty!38387))

(declare-fun b!1559967 () Bool)

(declare-fun res!1066200 () Bool)

(assert (=> b!1559967 (=> (not res!1066200) (not e!869116))))

(declare-fun a!524 () (_ BitVec 64))

(assert (=> b!1559967 (= res!1066200 (= a!524 a0!50))))

(declare-fun b!97 () B!2382)

(declare-fun b!1559968 () Bool)

(declare-fun +!5063 (ListLongMap!22493 tuple2!24984) ListLongMap!22493)

(assert (=> b!1559968 (= e!869116 (not (contains!10246 (+!5063 lm!250 (tuple2!24985 a!524 b!97)) a0!50)))))

(declare-fun b!1559969 () Bool)

(declare-fun tp!112518 () Bool)

(assert (=> b!1559969 (= e!869117 tp!112518)))

(assert (= (and start!133492 res!1066199) b!1559967))

(assert (= (and b!1559967 res!1066200) b!1559968))

(assert (= start!133492 b!1559969))

(declare-fun m!1436877 () Bool)

(assert (=> start!133492 m!1436877))

(declare-fun m!1436879 () Bool)

(assert (=> start!133492 m!1436879))

(declare-fun m!1436881 () Bool)

(assert (=> b!1559968 m!1436881))

(assert (=> b!1559968 m!1436881))

(declare-fun m!1436883 () Bool)

(assert (=> b!1559968 m!1436883))

(push 1)

(assert (not b!1559968))

(assert (not start!133492))

(assert (not b!1559969))

(assert tp_is_empty!38387)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163179 () Bool)

(declare-fun e!869122 () Bool)

(assert (=> d!163179 e!869122))

(declare-fun res!1066203 () Bool)

(assert (=> d!163179 (=> res!1066203 e!869122)))

(declare-fun lt!671549 () Bool)

(assert (=> d!163179 (= res!1066203 (not lt!671549))))

(declare-fun lt!671551 () Bool)

(assert (=> d!163179 (= lt!671549 lt!671551)))

(declare-datatypes ((Unit!51776 0))(
  ( (Unit!51777) )
))
(declare-fun lt!671548 () Unit!51776)

(declare-fun e!869123 () Unit!51776)

(assert (=> d!163179 (= lt!671548 e!869123)))

(declare-fun c!144790 () Bool)

(assert (=> d!163179 (= c!144790 lt!671551)))

(declare-fun containsKey!821 (List!36340 (_ BitVec 64)) Bool)

(assert (=> d!163179 (= lt!671551 (containsKey!821 (toList!11262 (+!5063 lm!250 (tuple2!24985 a!524 b!97))) a0!50))))

(assert (=> d!163179 (= (contains!10246 (+!5063 lm!250 (tuple2!24985 a!524 b!97)) a0!50) lt!671549)))

(declare-fun b!1559976 () Bool)

(declare-fun lt!671550 () Unit!51776)

(assert (=> b!1559976 (= e!869123 lt!671550)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!528 (List!36340 (_ BitVec 64)) Unit!51776)

(assert (=> b!1559976 (= lt!671550 (lemmaContainsKeyImpliesGetValueByKeyDefined!528 (toList!11262 (+!5063 lm!250 (tuple2!24985 a!524 b!97))) a0!50))))

(declare-datatypes ((Option!858 0))(
  ( (Some!857 (v!22045 B!2382)) (None!856) )
))
(declare-fun isDefined!574 (Option!858) Bool)

(declare-fun getValueByKey!783 (List!36340 (_ BitVec 64)) Option!858)

(assert (=> b!1559976 (isDefined!574 (getValueByKey!783 (toList!11262 (+!5063 lm!250 (tuple2!24985 a!524 b!97))) a0!50))))

(declare-fun b!1559977 () Bool)

(declare-fun Unit!51778 () Unit!51776)

(assert (=> b!1559977 (= e!869123 Unit!51778)))

(declare-fun b!1559978 () Bool)

(assert (=> b!1559978 (= e!869122 (isDefined!574 (getValueByKey!783 (toList!11262 (+!5063 lm!250 (tuple2!24985 a!524 b!97))) a0!50)))))

(assert (= (and d!163179 c!144790) b!1559976))

(assert (= (and d!163179 (not c!144790)) b!1559977))

(assert (= (and d!163179 (not res!1066203)) b!1559978))

(declare-fun m!1436885 () Bool)

(assert (=> d!163179 m!1436885))

(declare-fun m!1436887 () Bool)

(assert (=> b!1559976 m!1436887))

(declare-fun m!1436889 () Bool)

(assert (=> b!1559976 m!1436889))

(assert (=> b!1559976 m!1436889))

(declare-fun m!1436891 () Bool)

(assert (=> b!1559976 m!1436891))

(assert (=> b!1559978 m!1436889))

(assert (=> b!1559978 m!1436889))

(assert (=> b!1559978 m!1436891))

(assert (=> b!1559968 d!163179))

(declare-fun d!163185 () Bool)

(declare-fun e!869138 () Bool)

(assert (=> d!163185 e!869138))

(declare-fun res!1066214 () Bool)

(assert (=> d!163185 (=> (not res!1066214) (not e!869138))))

(declare-fun lt!671586 () ListLongMap!22493)

(assert (=> d!163185 (= res!1066214 (contains!10246 lt!671586 (_1!12503 (tuple2!24985 a!524 b!97))))))

(declare-fun lt!671584 () List!36340)

(assert (=> d!163185 (= lt!671586 (ListLongMap!22494 lt!671584))))

(declare-fun lt!671587 () Unit!51776)

(declare-fun lt!671585 () Unit!51776)

(assert (=> d!163185 (= lt!671587 lt!671585)))

(assert (=> d!163185 (= (getValueByKey!783 lt!671584 (_1!12503 (tuple2!24985 a!524 b!97))) (Some!857 (_2!12503 (tuple2!24985 a!524 b!97))))))

(declare-fun lemmaContainsTupThenGetReturnValue!382 (List!36340 (_ BitVec 64) B!2382) Unit!51776)

(assert (=> d!163185 (= lt!671585 (lemmaContainsTupThenGetReturnValue!382 lt!671584 (_1!12503 (tuple2!24985 a!524 b!97)) (_2!12503 (tuple2!24985 a!524 b!97))))))

(declare-fun insertStrictlySorted!559 (List!36340 (_ BitVec 64) B!2382) List!36340)

(assert (=> d!163185 (= lt!671584 (insertStrictlySorted!559 (toList!11262 lm!250) (_1!12503 (tuple2!24985 a!524 b!97)) (_2!12503 (tuple2!24985 a!524 b!97))))))

(assert (=> d!163185 (= (+!5063 lm!250 (tuple2!24985 a!524 b!97)) lt!671586)))

(declare-fun b!1560001 () Bool)

(declare-fun res!1066215 () Bool)

(assert (=> b!1560001 (=> (not res!1066215) (not e!869138))))

(assert (=> b!1560001 (= res!1066215 (= (getValueByKey!783 (toList!11262 lt!671586) (_1!12503 (tuple2!24985 a!524 b!97))) (Some!857 (_2!12503 (tuple2!24985 a!524 b!97)))))))

(declare-fun b!1560002 () Bool)

(declare-fun contains!10247 (List!36340 tuple2!24984) Bool)

(assert (=> b!1560002 (= e!869138 (contains!10247 (toList!11262 lt!671586) (tuple2!24985 a!524 b!97)))))

(assert (= (and d!163185 res!1066214) b!1560001))

(assert (= (and b!1560001 res!1066215) b!1560002))

(declare-fun m!1436909 () Bool)

(assert (=> d!163185 m!1436909))

(declare-fun m!1436911 () Bool)

(assert (=> d!163185 m!1436911))

(declare-fun m!1436913 () Bool)

(assert (=> d!163185 m!1436913))

(declare-fun m!1436915 () Bool)

(assert (=> d!163185 m!1436915))

(declare-fun m!1436917 () Bool)

(assert (=> b!1560001 m!1436917))

(declare-fun m!1436919 () Bool)

(assert (=> b!1560002 m!1436919))

(assert (=> b!1559968 d!163185))

(declare-fun d!163191 () Bool)

(declare-fun e!869139 () Bool)

(assert (=> d!163191 e!869139))

(declare-fun res!1066216 () Bool)

(assert (=> d!163191 (=> res!1066216 e!869139)))

(declare-fun lt!671589 () Bool)

(assert (=> d!163191 (= res!1066216 (not lt!671589))))

(declare-fun lt!671591 () Bool)

(assert (=> d!163191 (= lt!671589 lt!671591)))

(declare-fun lt!671588 () Unit!51776)

(declare-fun e!869140 () Unit!51776)

(assert (=> d!163191 (= lt!671588 e!869140)))

(declare-fun c!144797 () Bool)

(assert (=> d!163191 (= c!144797 lt!671591)))

(assert (=> d!163191 (= lt!671591 (containsKey!821 (toList!11262 lm!250) a0!50))))

(assert (=> d!163191 (= (contains!10246 lm!250 a0!50) lt!671589)))

(declare-fun b!1560003 () Bool)

(declare-fun lt!671590 () Unit!51776)

(assert (=> b!1560003 (= e!869140 lt!671590)))

(assert (=> b!1560003 (= lt!671590 (lemmaContainsKeyImpliesGetValueByKeyDefined!528 (toList!11262 lm!250) a0!50))))

(assert (=> b!1560003 (isDefined!574 (getValueByKey!783 (toList!11262 lm!250) a0!50))))

(declare-fun b!1560004 () Bool)

(declare-fun Unit!51785 () Unit!51776)

(assert (=> b!1560004 (= e!869140 Unit!51785)))

(declare-fun b!1560005 () Bool)

(assert (=> b!1560005 (= e!869139 (isDefined!574 (getValueByKey!783 (toList!11262 lm!250) a0!50)))))

(assert (= (and d!163191 c!144797) b!1560003))

(assert (= (and d!163191 (not c!144797)) b!1560004))

(assert (= (and d!163191 (not res!1066216)) b!1560005))

(declare-fun m!1436921 () Bool)

(assert (=> d!163191 m!1436921))

(declare-fun m!1436923 () Bool)

(assert (=> b!1560003 m!1436923))

(declare-fun m!1436925 () Bool)

(assert (=> b!1560003 m!1436925))

(assert (=> b!1560003 m!1436925))

(declare-fun m!1436927 () Bool)

(assert (=> b!1560003 m!1436927))

(assert (=> b!1560005 m!1436925))

(assert (=> b!1560005 m!1436925))

(assert (=> b!1560005 m!1436927))

(assert (=> start!133492 d!163191))

(declare-fun d!163193 () Bool)

(declare-fun isStrictlySorted!946 (List!36340) Bool)

(assert (=> d!163193 (= (inv!57475 lm!250) (isStrictlySorted!946 (toList!11262 lm!250)))))

(declare-fun bs!44789 () Bool)

(assert (= bs!44789 d!163193))

(declare-fun m!1436929 () Bool)

(assert (=> bs!44789 m!1436929))

(assert (=> start!133492 d!163193))

(declare-fun b!1560010 () Bool)

(declare-fun e!869143 () Bool)

(declare-fun tp!112521 () Bool)

(assert (=> b!1560010 (= e!869143 (and tp_is_empty!38387 tp!112521))))

(assert (=> b!1559969 (= tp!112518 e!869143)))

(assert (= (and b!1559969 (is-Cons!36336 (toList!11262 lm!250))) b!1560010))

(push 1)

(assert (not b!1560003))

(assert (not b!1559976))

(assert (not b!1560005))

(assert (not b!1559978))

(assert (not d!163191))

(assert (not b!1560002))

(assert tp_is_empty!38387)

(assert (not d!163179))

(assert (not b!1560001))

(assert (not d!163185))

(assert (not d!163193))

(assert (not b!1560010))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

