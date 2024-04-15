; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4634 () Bool)

(assert start!4634)

(declare-fun b_free!1291 () Bool)

(declare-fun b_next!1291 () Bool)

(assert (=> start!4634 (= b_free!1291 (not b_next!1291))))

(declare-fun tp!5323 () Bool)

(declare-fun b_and!2119 () Bool)

(assert (=> start!4634 (= tp!5323 b_and!2119)))

(declare-fun b!36245 () Bool)

(declare-fun res!21937 () Bool)

(declare-fun e!22877 () Bool)

(assert (=> b!36245 (=> (not res!21937) (not e!22877))))

(declare-datatypes ((B!698 0))(
  ( (B!699 (val!849 Int)) )
))
(declare-datatypes ((tuple2!1362 0))(
  ( (tuple2!1363 (_1!692 (_ BitVec 64)) (_2!692 B!698)) )
))
(declare-datatypes ((List!946 0))(
  ( (Nil!943) (Cons!942 (h!1510 tuple2!1362) (t!3652 List!946)) )
))
(declare-datatypes ((ListLongMap!927 0))(
  ( (ListLongMap!928 (toList!479 List!946)) )
))
(declare-fun lm!252 () ListLongMap!927)

(declare-fun isEmpty!176 (ListLongMap!927) Bool)

(assert (=> b!36245 (= res!21937 (not (isEmpty!176 lm!252)))))

(declare-fun b!36246 () Bool)

(assert (=> b!36246 (= e!22877 (= (toList!479 lm!252) Nil!943))))

(declare-fun b!36247 () Bool)

(declare-fun e!22878 () Bool)

(declare-fun tp!5324 () Bool)

(assert (=> b!36247 (= e!22878 tp!5324)))

(declare-fun res!21936 () Bool)

(assert (=> start!4634 (=> (not res!21936) (not e!22877))))

(declare-fun p!304 () Int)

(declare-fun forall!149 (List!946 Int) Bool)

(assert (=> start!4634 (= res!21936 (forall!149 (toList!479 lm!252) p!304))))

(assert (=> start!4634 e!22877))

(declare-fun inv!1574 (ListLongMap!927) Bool)

(assert (=> start!4634 (and (inv!1574 lm!252) e!22878)))

(assert (=> start!4634 tp!5323))

(assert (=> start!4634 true))

(declare-fun b!36244 () Bool)

(declare-fun res!21935 () Bool)

(assert (=> b!36244 (=> (not res!21935) (not e!22877))))

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun contains!431 (ListLongMap!927 (_ BitVec 64)) Bool)

(assert (=> b!36244 (= res!21935 (contains!431 lm!252 k0!388))))

(assert (= (and start!4634 res!21936) b!36244))

(assert (= (and b!36244 res!21935) b!36245))

(assert (= (and b!36245 res!21937) b!36246))

(assert (= start!4634 b!36247))

(declare-fun m!29195 () Bool)

(assert (=> b!36245 m!29195))

(declare-fun m!29197 () Bool)

(assert (=> start!4634 m!29197))

(declare-fun m!29199 () Bool)

(assert (=> start!4634 m!29199))

(declare-fun m!29201 () Bool)

(assert (=> b!36244 m!29201))

(check-sat (not b!36244) (not b!36247) (not start!4634) b_and!2119 (not b!36245) (not b_next!1291))
(check-sat b_and!2119 (not b_next!1291))
(get-model)

(declare-fun d!5415 () Bool)

(declare-fun isEmpty!179 (List!946) Bool)

(assert (=> d!5415 (= (isEmpty!176 lm!252) (isEmpty!179 (toList!479 lm!252)))))

(declare-fun bs!1377 () Bool)

(assert (= bs!1377 d!5415))

(declare-fun m!29219 () Bool)

(assert (=> bs!1377 m!29219))

(assert (=> b!36245 d!5415))

(declare-fun d!5421 () Bool)

(declare-fun e!22907 () Bool)

(assert (=> d!5421 e!22907))

(declare-fun res!21970 () Bool)

(assert (=> d!5421 (=> res!21970 e!22907)))

(declare-fun lt!13451 () Bool)

(assert (=> d!5421 (= res!21970 (not lt!13451))))

(declare-fun lt!13454 () Bool)

(assert (=> d!5421 (= lt!13451 lt!13454)))

(declare-datatypes ((Unit!803 0))(
  ( (Unit!804) )
))
(declare-fun lt!13452 () Unit!803)

(declare-fun e!22908 () Unit!803)

(assert (=> d!5421 (= lt!13452 e!22908)))

(declare-fun c!4149 () Bool)

(assert (=> d!5421 (= c!4149 lt!13454)))

(declare-fun containsKey!38 (List!946 (_ BitVec 64)) Bool)

(assert (=> d!5421 (= lt!13454 (containsKey!38 (toList!479 lm!252) k0!388))))

(assert (=> d!5421 (= (contains!431 lm!252 k0!388) lt!13451)))

(declare-fun b!36290 () Bool)

(declare-fun lt!13453 () Unit!803)

(assert (=> b!36290 (= e!22908 lt!13453)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!35 (List!946 (_ BitVec 64)) Unit!803)

(assert (=> b!36290 (= lt!13453 (lemmaContainsKeyImpliesGetValueByKeyDefined!35 (toList!479 lm!252) k0!388))))

(declare-datatypes ((Option!80 0))(
  ( (Some!79 (v!1948 B!698)) (None!78) )
))
(declare-fun isDefined!36 (Option!80) Bool)

(declare-fun getValueByKey!74 (List!946 (_ BitVec 64)) Option!80)

(assert (=> b!36290 (isDefined!36 (getValueByKey!74 (toList!479 lm!252) k0!388))))

(declare-fun b!36291 () Bool)

(declare-fun Unit!805 () Unit!803)

(assert (=> b!36291 (= e!22908 Unit!805)))

(declare-fun b!36292 () Bool)

(assert (=> b!36292 (= e!22907 (isDefined!36 (getValueByKey!74 (toList!479 lm!252) k0!388)))))

(assert (= (and d!5421 c!4149) b!36290))

(assert (= (and d!5421 (not c!4149)) b!36291))

(assert (= (and d!5421 (not res!21970)) b!36292))

(declare-fun m!29237 () Bool)

(assert (=> d!5421 m!29237))

(declare-fun m!29239 () Bool)

(assert (=> b!36290 m!29239))

(declare-fun m!29241 () Bool)

(assert (=> b!36290 m!29241))

(assert (=> b!36290 m!29241))

(declare-fun m!29243 () Bool)

(assert (=> b!36290 m!29243))

(assert (=> b!36292 m!29241))

(assert (=> b!36292 m!29241))

(assert (=> b!36292 m!29243))

(assert (=> b!36244 d!5421))

(declare-fun d!5435 () Bool)

(declare-fun res!21979 () Bool)

(declare-fun e!22921 () Bool)

(assert (=> d!5435 (=> res!21979 e!22921)))

(get-info :version)

(assert (=> d!5435 (= res!21979 ((_ is Nil!943) (toList!479 lm!252)))))

(assert (=> d!5435 (= (forall!149 (toList!479 lm!252) p!304) e!22921)))

(declare-fun b!36309 () Bool)

(declare-fun e!22922 () Bool)

(assert (=> b!36309 (= e!22921 e!22922)))

(declare-fun res!21980 () Bool)

(assert (=> b!36309 (=> (not res!21980) (not e!22922))))

(declare-fun dynLambda!161 (Int tuple2!1362) Bool)

(assert (=> b!36309 (= res!21980 (dynLambda!161 p!304 (h!1510 (toList!479 lm!252))))))

(declare-fun b!36310 () Bool)

(assert (=> b!36310 (= e!22922 (forall!149 (t!3652 (toList!479 lm!252)) p!304))))

(assert (= (and d!5435 (not res!21979)) b!36309))

(assert (= (and b!36309 res!21980) b!36310))

(declare-fun b_lambda!1735 () Bool)

(assert (=> (not b_lambda!1735) (not b!36309)))

(declare-fun t!3660 () Bool)

(declare-fun tb!699 () Bool)

(assert (=> (and start!4634 (= p!304 p!304) t!3660) tb!699))

(declare-fun result!1211 () Bool)

(assert (=> tb!699 (= result!1211 true)))

(assert (=> b!36309 t!3660))

(declare-fun b_and!2129 () Bool)

(assert (= b_and!2119 (and (=> t!3660 result!1211) b_and!2129)))

(declare-fun m!29245 () Bool)

(assert (=> b!36309 m!29245))

(declare-fun m!29247 () Bool)

(assert (=> b!36310 m!29247))

(assert (=> start!4634 d!5435))

(declare-fun d!5437 () Bool)

(declare-fun isStrictlySorted!169 (List!946) Bool)

(assert (=> d!5437 (= (inv!1574 lm!252) (isStrictlySorted!169 (toList!479 lm!252)))))

(declare-fun bs!1382 () Bool)

(assert (= bs!1382 d!5437))

(declare-fun m!29265 () Bool)

(assert (=> bs!1382 m!29265))

(assert (=> start!4634 d!5437))

(declare-fun b!36331 () Bool)

(declare-fun e!22935 () Bool)

(declare-fun tp_is_empty!1649 () Bool)

(declare-fun tp!5345 () Bool)

(assert (=> b!36331 (= e!22935 (and tp_is_empty!1649 tp!5345))))

(assert (=> b!36247 (= tp!5324 e!22935)))

(assert (= (and b!36247 ((_ is Cons!942) (toList!479 lm!252))) b!36331))

(declare-fun b_lambda!1741 () Bool)

(assert (= b_lambda!1735 (or (and start!4634 b_free!1291) b_lambda!1741)))

(check-sat (not b!36331) (not b!36310) (not d!5415) (not b_lambda!1741) (not b!36292) b_and!2129 (not d!5421) (not d!5437) tp_is_empty!1649 (not b!36290) (not b_next!1291))
(check-sat b_and!2129 (not b_next!1291))
(get-model)

(declare-fun d!5439 () Bool)

(declare-fun res!21987 () Bool)

(declare-fun e!22940 () Bool)

(assert (=> d!5439 (=> res!21987 e!22940)))

(assert (=> d!5439 (= res!21987 (and ((_ is Cons!942) (toList!479 lm!252)) (= (_1!692 (h!1510 (toList!479 lm!252))) k0!388)))))

(assert (=> d!5439 (= (containsKey!38 (toList!479 lm!252) k0!388) e!22940)))

(declare-fun b!36336 () Bool)

(declare-fun e!22941 () Bool)

(assert (=> b!36336 (= e!22940 e!22941)))

(declare-fun res!21988 () Bool)

(assert (=> b!36336 (=> (not res!21988) (not e!22941))))

(assert (=> b!36336 (= res!21988 (and (or (not ((_ is Cons!942) (toList!479 lm!252))) (bvsle (_1!692 (h!1510 (toList!479 lm!252))) k0!388)) ((_ is Cons!942) (toList!479 lm!252)) (bvslt (_1!692 (h!1510 (toList!479 lm!252))) k0!388)))))

(declare-fun b!36337 () Bool)

(assert (=> b!36337 (= e!22941 (containsKey!38 (t!3652 (toList!479 lm!252)) k0!388))))

(assert (= (and d!5439 (not res!21987)) b!36336))

(assert (= (and b!36336 res!21988) b!36337))

(declare-fun m!29267 () Bool)

(assert (=> b!36337 m!29267))

(assert (=> d!5421 d!5439))

(declare-fun d!5443 () Bool)

(declare-fun isEmpty!182 (Option!80) Bool)

(assert (=> d!5443 (= (isDefined!36 (getValueByKey!74 (toList!479 lm!252) k0!388)) (not (isEmpty!182 (getValueByKey!74 (toList!479 lm!252) k0!388))))))

(declare-fun bs!1383 () Bool)

(assert (= bs!1383 d!5443))

(assert (=> bs!1383 m!29241))

(declare-fun m!29269 () Bool)

(assert (=> bs!1383 m!29269))

(assert (=> b!36292 d!5443))

(declare-fun b!36355 () Bool)

(declare-fun e!22954 () Option!80)

(declare-fun e!22955 () Option!80)

(assert (=> b!36355 (= e!22954 e!22955)))

(declare-fun c!4161 () Bool)

(assert (=> b!36355 (= c!4161 (and ((_ is Cons!942) (toList!479 lm!252)) (not (= (_1!692 (h!1510 (toList!479 lm!252))) k0!388))))))

(declare-fun b!36354 () Bool)

(assert (=> b!36354 (= e!22954 (Some!79 (_2!692 (h!1510 (toList!479 lm!252)))))))

(declare-fun b!36357 () Bool)

(assert (=> b!36357 (= e!22955 None!78)))

(declare-fun d!5445 () Bool)

(declare-fun c!4160 () Bool)

(assert (=> d!5445 (= c!4160 (and ((_ is Cons!942) (toList!479 lm!252)) (= (_1!692 (h!1510 (toList!479 lm!252))) k0!388)))))

(assert (=> d!5445 (= (getValueByKey!74 (toList!479 lm!252) k0!388) e!22954)))

(declare-fun b!36356 () Bool)

(assert (=> b!36356 (= e!22955 (getValueByKey!74 (t!3652 (toList!479 lm!252)) k0!388))))

(assert (= (and d!5445 c!4160) b!36354))

(assert (= (and d!5445 (not c!4160)) b!36355))

(assert (= (and b!36355 c!4161) b!36356))

(assert (= (and b!36355 (not c!4161)) b!36357))

(declare-fun m!29279 () Bool)

(assert (=> b!36356 m!29279))

(assert (=> b!36292 d!5445))

(declare-fun d!5453 () Bool)

(assert (=> d!5453 (isDefined!36 (getValueByKey!74 (toList!479 lm!252) k0!388))))

(declare-fun lt!13481 () Unit!803)

(declare-fun choose!224 (List!946 (_ BitVec 64)) Unit!803)

(assert (=> d!5453 (= lt!13481 (choose!224 (toList!479 lm!252) k0!388))))

(declare-fun e!22964 () Bool)

(assert (=> d!5453 e!22964))

(declare-fun res!21999 () Bool)

(assert (=> d!5453 (=> (not res!21999) (not e!22964))))

(assert (=> d!5453 (= res!21999 (isStrictlySorted!169 (toList!479 lm!252)))))

(assert (=> d!5453 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!35 (toList!479 lm!252) k0!388) lt!13481)))

(declare-fun b!36372 () Bool)

(assert (=> b!36372 (= e!22964 (containsKey!38 (toList!479 lm!252) k0!388))))

(assert (= (and d!5453 res!21999) b!36372))

(assert (=> d!5453 m!29241))

(assert (=> d!5453 m!29241))

(assert (=> d!5453 m!29243))

(declare-fun m!29283 () Bool)

(assert (=> d!5453 m!29283))

(assert (=> d!5453 m!29265))

(assert (=> b!36372 m!29237))

(assert (=> b!36290 d!5453))

(assert (=> b!36290 d!5443))

(assert (=> b!36290 d!5445))

(declare-fun d!5461 () Bool)

(assert (=> d!5461 (= (isEmpty!179 (toList!479 lm!252)) ((_ is Nil!943) (toList!479 lm!252)))))

(assert (=> d!5415 d!5461))

(declare-fun d!5465 () Bool)

(declare-fun res!22004 () Bool)

(declare-fun e!22969 () Bool)

(assert (=> d!5465 (=> res!22004 e!22969)))

(assert (=> d!5465 (= res!22004 ((_ is Nil!943) (t!3652 (toList!479 lm!252))))))

(assert (=> d!5465 (= (forall!149 (t!3652 (toList!479 lm!252)) p!304) e!22969)))

(declare-fun b!36377 () Bool)

(declare-fun e!22970 () Bool)

(assert (=> b!36377 (= e!22969 e!22970)))

(declare-fun res!22005 () Bool)

(assert (=> b!36377 (=> (not res!22005) (not e!22970))))

(assert (=> b!36377 (= res!22005 (dynLambda!161 p!304 (h!1510 (t!3652 (toList!479 lm!252)))))))

(declare-fun b!36378 () Bool)

(assert (=> b!36378 (= e!22970 (forall!149 (t!3652 (t!3652 (toList!479 lm!252))) p!304))))

(assert (= (and d!5465 (not res!22004)) b!36377))

(assert (= (and b!36377 res!22005) b!36378))

(declare-fun b_lambda!1745 () Bool)

(assert (=> (not b_lambda!1745) (not b!36377)))

(declare-fun t!3664 () Bool)

(declare-fun tb!703 () Bool)

(assert (=> (and start!4634 (= p!304 p!304) t!3664) tb!703))

(declare-fun result!1221 () Bool)

(assert (=> tb!703 (= result!1221 true)))

(assert (=> b!36377 t!3664))

(declare-fun b_and!2133 () Bool)

(assert (= b_and!2129 (and (=> t!3664 result!1221) b_and!2133)))

(declare-fun m!29285 () Bool)

(assert (=> b!36377 m!29285))

(declare-fun m!29287 () Bool)

(assert (=> b!36378 m!29287))

(assert (=> b!36310 d!5465))

(declare-fun d!5467 () Bool)

(declare-fun res!22018 () Bool)

(declare-fun e!22983 () Bool)

(assert (=> d!5467 (=> res!22018 e!22983)))

(assert (=> d!5467 (= res!22018 (or ((_ is Nil!943) (toList!479 lm!252)) ((_ is Nil!943) (t!3652 (toList!479 lm!252)))))))

(assert (=> d!5467 (= (isStrictlySorted!169 (toList!479 lm!252)) e!22983)))

(declare-fun b!36393 () Bool)

(declare-fun e!22984 () Bool)

(assert (=> b!36393 (= e!22983 e!22984)))

(declare-fun res!22019 () Bool)

(assert (=> b!36393 (=> (not res!22019) (not e!22984))))

(assert (=> b!36393 (= res!22019 (bvslt (_1!692 (h!1510 (toList!479 lm!252))) (_1!692 (h!1510 (t!3652 (toList!479 lm!252))))))))

(declare-fun b!36394 () Bool)

(assert (=> b!36394 (= e!22984 (isStrictlySorted!169 (t!3652 (toList!479 lm!252))))))

(assert (= (and d!5467 (not res!22018)) b!36393))

(assert (= (and b!36393 res!22019) b!36394))

(declare-fun m!29295 () Bool)

(assert (=> b!36394 m!29295))

(assert (=> d!5437 d!5467))

(declare-fun b!36401 () Bool)

(declare-fun e!22989 () Bool)

(declare-fun tp!5346 () Bool)

(assert (=> b!36401 (= e!22989 (and tp_is_empty!1649 tp!5346))))

(assert (=> b!36331 (= tp!5345 e!22989)))

(assert (= (and b!36331 ((_ is Cons!942) (t!3652 (toList!479 lm!252)))) b!36401))

(declare-fun b_lambda!1747 () Bool)

(assert (= b_lambda!1745 (or (and start!4634 b_free!1291) b_lambda!1747)))

(check-sat (not b!36372) b_and!2133 (not d!5443) (not b_lambda!1747) (not b_lambda!1741) (not b!36401) (not b!36394) (not b!36337) (not b!36378) (not d!5453) tp_is_empty!1649 (not b!36356) (not b_next!1291))
(check-sat b_and!2133 (not b_next!1291))
