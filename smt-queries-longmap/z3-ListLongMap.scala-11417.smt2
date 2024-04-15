; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133026 () Bool)

(assert start!133026)

(declare-fun res!1065198 () Bool)

(declare-fun e!867398 () Bool)

(assert (=> start!133026 (=> (not res!1065198) (not e!867398))))

(declare-datatypes ((B!2378 0))(
  ( (B!2379 (val!19275 Int)) )
))
(declare-datatypes ((tuple2!24998 0))(
  ( (tuple2!24999 (_1!12510 (_ BitVec 64)) (_2!12510 B!2378)) )
))
(declare-datatypes ((List!36354 0))(
  ( (Nil!36351) (Cons!36350 (h!37797 tuple2!24998) (t!51073 List!36354)) )
))
(declare-datatypes ((ListLongMap!22499 0))(
  ( (ListLongMap!22500 (toList!11265 List!36354)) )
))
(declare-fun lm!250 () ListLongMap!22499)

(declare-fun a0!50 () (_ BitVec 64))

(declare-fun contains!10158 (ListLongMap!22499 (_ BitVec 64)) Bool)

(assert (=> start!133026 (= res!1065198 (contains!10158 lm!250 a0!50))))

(assert (=> start!133026 e!867398))

(declare-fun e!867397 () Bool)

(declare-fun inv!57473 (ListLongMap!22499) Bool)

(assert (=> start!133026 (and (inv!57473 lm!250) e!867397)))

(assert (=> start!133026 true))

(declare-fun tp_is_empty!38383 () Bool)

(assert (=> start!133026 tp_is_empty!38383))

(declare-fun b!1557200 () Bool)

(declare-fun res!1065199 () Bool)

(assert (=> b!1557200 (=> (not res!1065199) (not e!867398))))

(declare-fun a!524 () (_ BitVec 64))

(assert (=> b!1557200 (= res!1065199 (= a!524 a0!50))))

(declare-fun b!1557201 () Bool)

(declare-fun b!97 () B!2378)

(declare-fun +!5052 (ListLongMap!22499 tuple2!24998) ListLongMap!22499)

(assert (=> b!1557201 (= e!867398 (not (contains!10158 (+!5052 lm!250 (tuple2!24999 a!524 b!97)) a0!50)))))

(declare-fun b!1557202 () Bool)

(declare-fun tp!112513 () Bool)

(assert (=> b!1557202 (= e!867397 tp!112513)))

(assert (= (and start!133026 res!1065198) b!1557200))

(assert (= (and b!1557200 res!1065199) b!1557201))

(assert (= start!133026 b!1557202))

(declare-fun m!1433711 () Bool)

(assert (=> start!133026 m!1433711))

(declare-fun m!1433713 () Bool)

(assert (=> start!133026 m!1433713))

(declare-fun m!1433715 () Bool)

(assert (=> b!1557201 m!1433715))

(assert (=> b!1557201 m!1433715))

(declare-fun m!1433717 () Bool)

(assert (=> b!1557201 m!1433717))

(check-sat (not start!133026) (not b!1557201) (not b!1557202) tp_is_empty!38383)
(check-sat)
(get-model)

(declare-fun d!162227 () Bool)

(declare-fun e!867426 () Bool)

(assert (=> d!162227 e!867426))

(declare-fun res!1065219 () Bool)

(assert (=> d!162227 (=> res!1065219 e!867426)))

(declare-fun lt!670376 () Bool)

(assert (=> d!162227 (= res!1065219 (not lt!670376))))

(declare-fun lt!670374 () Bool)

(assert (=> d!162227 (= lt!670376 lt!670374)))

(declare-datatypes ((Unit!51682 0))(
  ( (Unit!51683) )
))
(declare-fun lt!670377 () Unit!51682)

(declare-fun e!867425 () Unit!51682)

(assert (=> d!162227 (= lt!670377 e!867425)))

(declare-fun c!143906 () Bool)

(assert (=> d!162227 (= c!143906 lt!670374)))

(declare-fun containsKey!820 (List!36354 (_ BitVec 64)) Bool)

(assert (=> d!162227 (= lt!670374 (containsKey!820 (toList!11265 lm!250) a0!50))))

(assert (=> d!162227 (= (contains!10158 lm!250 a0!50) lt!670376)))

(declare-fun b!1557242 () Bool)

(declare-fun lt!670375 () Unit!51682)

(assert (=> b!1557242 (= e!867425 lt!670375)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!527 (List!36354 (_ BitVec 64)) Unit!51682)

(assert (=> b!1557242 (= lt!670375 (lemmaContainsKeyImpliesGetValueByKeyDefined!527 (toList!11265 lm!250) a0!50))))

(declare-datatypes ((Option!865 0))(
  ( (Some!864 (v!22049 B!2378)) (None!863) )
))
(declare-fun isDefined!578 (Option!865) Bool)

(declare-fun getValueByKey!790 (List!36354 (_ BitVec 64)) Option!865)

(assert (=> b!1557242 (isDefined!578 (getValueByKey!790 (toList!11265 lm!250) a0!50))))

(declare-fun b!1557243 () Bool)

(declare-fun Unit!51686 () Unit!51682)

(assert (=> b!1557243 (= e!867425 Unit!51686)))

(declare-fun b!1557244 () Bool)

(assert (=> b!1557244 (= e!867426 (isDefined!578 (getValueByKey!790 (toList!11265 lm!250) a0!50)))))

(assert (= (and d!162227 c!143906) b!1557242))

(assert (= (and d!162227 (not c!143906)) b!1557243))

(assert (= (and d!162227 (not res!1065219)) b!1557244))

(declare-fun m!1433743 () Bool)

(assert (=> d!162227 m!1433743))

(declare-fun m!1433745 () Bool)

(assert (=> b!1557242 m!1433745))

(declare-fun m!1433747 () Bool)

(assert (=> b!1557242 m!1433747))

(assert (=> b!1557242 m!1433747))

(declare-fun m!1433749 () Bool)

(assert (=> b!1557242 m!1433749))

(assert (=> b!1557244 m!1433747))

(assert (=> b!1557244 m!1433747))

(assert (=> b!1557244 m!1433749))

(assert (=> start!133026 d!162227))

(declare-fun d!162233 () Bool)

(declare-fun isStrictlySorted!957 (List!36354) Bool)

(assert (=> d!162233 (= (inv!57473 lm!250) (isStrictlySorted!957 (toList!11265 lm!250)))))

(declare-fun bs!44726 () Bool)

(assert (= bs!44726 d!162233))

(declare-fun m!1433769 () Bool)

(assert (=> bs!44726 m!1433769))

(assert (=> start!133026 d!162233))

(declare-fun d!162239 () Bool)

(declare-fun e!867432 () Bool)

(assert (=> d!162239 e!867432))

(declare-fun res!1065222 () Bool)

(assert (=> d!162239 (=> res!1065222 e!867432)))

(declare-fun lt!670388 () Bool)

(assert (=> d!162239 (= res!1065222 (not lt!670388))))

(declare-fun lt!670386 () Bool)

(assert (=> d!162239 (= lt!670388 lt!670386)))

(declare-fun lt!670389 () Unit!51682)

(declare-fun e!867431 () Unit!51682)

(assert (=> d!162239 (= lt!670389 e!867431)))

(declare-fun c!143909 () Bool)

(assert (=> d!162239 (= c!143909 lt!670386)))

(assert (=> d!162239 (= lt!670386 (containsKey!820 (toList!11265 (+!5052 lm!250 (tuple2!24999 a!524 b!97))) a0!50))))

(assert (=> d!162239 (= (contains!10158 (+!5052 lm!250 (tuple2!24999 a!524 b!97)) a0!50) lt!670388)))

(declare-fun b!1557251 () Bool)

(declare-fun lt!670387 () Unit!51682)

(assert (=> b!1557251 (= e!867431 lt!670387)))

(assert (=> b!1557251 (= lt!670387 (lemmaContainsKeyImpliesGetValueByKeyDefined!527 (toList!11265 (+!5052 lm!250 (tuple2!24999 a!524 b!97))) a0!50))))

(assert (=> b!1557251 (isDefined!578 (getValueByKey!790 (toList!11265 (+!5052 lm!250 (tuple2!24999 a!524 b!97))) a0!50))))

(declare-fun b!1557252 () Bool)

(declare-fun Unit!51689 () Unit!51682)

(assert (=> b!1557252 (= e!867431 Unit!51689)))

(declare-fun b!1557253 () Bool)

(assert (=> b!1557253 (= e!867432 (isDefined!578 (getValueByKey!790 (toList!11265 (+!5052 lm!250 (tuple2!24999 a!524 b!97))) a0!50)))))

(assert (= (and d!162239 c!143909) b!1557251))

(assert (= (and d!162239 (not c!143909)) b!1557252))

(assert (= (and d!162239 (not res!1065222)) b!1557253))

(declare-fun m!1433771 () Bool)

(assert (=> d!162239 m!1433771))

(declare-fun m!1433773 () Bool)

(assert (=> b!1557251 m!1433773))

(declare-fun m!1433775 () Bool)

(assert (=> b!1557251 m!1433775))

(assert (=> b!1557251 m!1433775))

(declare-fun m!1433777 () Bool)

(assert (=> b!1557251 m!1433777))

(assert (=> b!1557253 m!1433775))

(assert (=> b!1557253 m!1433775))

(assert (=> b!1557253 m!1433777))

(assert (=> b!1557201 d!162239))

(declare-fun d!162243 () Bool)

(declare-fun e!867443 () Bool)

(assert (=> d!162243 e!867443))

(declare-fun res!1065240 () Bool)

(assert (=> d!162243 (=> (not res!1065240) (not e!867443))))

(declare-fun lt!670429 () ListLongMap!22499)

(assert (=> d!162243 (= res!1065240 (contains!10158 lt!670429 (_1!12510 (tuple2!24999 a!524 b!97))))))

(declare-fun lt!670427 () List!36354)

(assert (=> d!162243 (= lt!670429 (ListLongMap!22500 lt!670427))))

(declare-fun lt!670426 () Unit!51682)

(declare-fun lt!670428 () Unit!51682)

(assert (=> d!162243 (= lt!670426 lt!670428)))

(assert (=> d!162243 (= (getValueByKey!790 lt!670427 (_1!12510 (tuple2!24999 a!524 b!97))) (Some!864 (_2!12510 (tuple2!24999 a!524 b!97))))))

(declare-fun lemmaContainsTupThenGetReturnValue!385 (List!36354 (_ BitVec 64) B!2378) Unit!51682)

(assert (=> d!162243 (= lt!670428 (lemmaContainsTupThenGetReturnValue!385 lt!670427 (_1!12510 (tuple2!24999 a!524 b!97)) (_2!12510 (tuple2!24999 a!524 b!97))))))

(declare-fun insertStrictlySorted!560 (List!36354 (_ BitVec 64) B!2378) List!36354)

(assert (=> d!162243 (= lt!670427 (insertStrictlySorted!560 (toList!11265 lm!250) (_1!12510 (tuple2!24999 a!524 b!97)) (_2!12510 (tuple2!24999 a!524 b!97))))))

(assert (=> d!162243 (= (+!5052 lm!250 (tuple2!24999 a!524 b!97)) lt!670429)))

(declare-fun b!1557273 () Bool)

(declare-fun res!1065241 () Bool)

(assert (=> b!1557273 (=> (not res!1065241) (not e!867443))))

(assert (=> b!1557273 (= res!1065241 (= (getValueByKey!790 (toList!11265 lt!670429) (_1!12510 (tuple2!24999 a!524 b!97))) (Some!864 (_2!12510 (tuple2!24999 a!524 b!97)))))))

(declare-fun b!1557274 () Bool)

(declare-fun contains!10162 (List!36354 tuple2!24998) Bool)

(assert (=> b!1557274 (= e!867443 (contains!10162 (toList!11265 lt!670429) (tuple2!24999 a!524 b!97)))))

(assert (= (and d!162243 res!1065240) b!1557273))

(assert (= (and b!1557273 res!1065241) b!1557274))

(declare-fun m!1433811 () Bool)

(assert (=> d!162243 m!1433811))

(declare-fun m!1433813 () Bool)

(assert (=> d!162243 m!1433813))

(declare-fun m!1433815 () Bool)

(assert (=> d!162243 m!1433815))

(declare-fun m!1433817 () Bool)

(assert (=> d!162243 m!1433817))

(declare-fun m!1433819 () Bool)

(assert (=> b!1557273 m!1433819))

(declare-fun m!1433821 () Bool)

(assert (=> b!1557274 m!1433821))

(assert (=> b!1557201 d!162243))

(declare-fun b!1557284 () Bool)

(declare-fun e!867449 () Bool)

(declare-fun tp!112525 () Bool)

(assert (=> b!1557284 (= e!867449 (and tp_is_empty!38383 tp!112525))))

(assert (=> b!1557202 (= tp!112513 e!867449)))

(get-info :version)

(assert (= (and b!1557202 ((_ is Cons!36350) (toList!11265 lm!250))) b!1557284))

(check-sat (not b!1557274) (not d!162243) (not d!162227) (not b!1557284) (not b!1557244) (not b!1557242) tp_is_empty!38383 (not d!162233) (not b!1557273) (not b!1557251) (not b!1557253) (not d!162239))
(check-sat)
