; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132384 () Bool)

(assert start!132384)

(declare-fun b!1553279 () Bool)

(declare-fun e!864797 () Bool)

(declare-fun e!864799 () Bool)

(assert (=> b!1553279 (= e!864797 (not e!864799))))

(declare-fun res!1063219 () Bool)

(assert (=> b!1553279 (=> res!1063219 e!864799)))

(declare-datatypes ((B!2216 0))(
  ( (B!2217 (val!19194 Int)) )
))
(declare-datatypes ((tuple2!24836 0))(
  ( (tuple2!24837 (_1!12429 (_ BitVec 64)) (_2!12429 B!2216)) )
))
(declare-datatypes ((List!36273 0))(
  ( (Nil!36270) (Cons!36269 (h!37716 tuple2!24836) (t!50986 List!36273)) )
))
(declare-datatypes ((ListLongMap!22445 0))(
  ( (ListLongMap!22446 (toList!11238 List!36273)) )
))
(declare-fun lm!249 () ListLongMap!22445)

(declare-fun isStrictlySorted!888 (List!36273) Bool)

(assert (=> b!1553279 (= res!1063219 (not (isStrictlySorted!888 (toList!11238 lm!249))))))

(declare-fun e!864798 () Bool)

(assert (=> b!1553279 e!864798))

(declare-fun res!1063221 () Bool)

(assert (=> b!1553279 (=> (not res!1063221) (not e!864798))))

(declare-fun lt!669434 () List!36273)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun containsKey!759 (List!36273 (_ BitVec 64)) Bool)

(assert (=> b!1553279 (= res!1063221 (containsKey!759 lt!669434 a0!49))))

(declare-fun a!523 () (_ BitVec 64))

(declare-fun b!96 () B!2216)

(declare-fun insertStrictlySorted!508 (List!36273 (_ BitVec 64) B!2216) List!36273)

(assert (=> b!1553279 (= lt!669434 (insertStrictlySorted!508 (toList!11238 lm!249) a!523 b!96))))

(declare-datatypes ((Unit!51566 0))(
  ( (Unit!51567) )
))
(declare-fun lt!669435 () Unit!51566)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!4 (List!36273 (_ BitVec 64) B!2216 (_ BitVec 64)) Unit!51566)

(assert (=> b!1553279 (= lt!669435 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!4 (toList!11238 lm!249) a!523 b!96 a0!49))))

(declare-fun res!1063222 () Bool)

(assert (=> start!132384 (=> (not res!1063222) (not e!864797))))

(declare-fun contains!10101 (ListLongMap!22445 (_ BitVec 64)) Bool)

(assert (=> start!132384 (= res!1063222 (contains!10101 lm!249 a0!49))))

(assert (=> start!132384 e!864797))

(declare-fun e!864800 () Bool)

(declare-fun inv!57311 (ListLongMap!22445) Bool)

(assert (=> start!132384 (and (inv!57311 lm!249) e!864800)))

(assert (=> start!132384 true))

(declare-fun tp_is_empty!38227 () Bool)

(assert (=> start!132384 tp_is_empty!38227))

(declare-fun b!1553280 () Bool)

(declare-fun res!1063218 () Bool)

(assert (=> b!1553280 (=> (not res!1063218) (not e!864797))))

(assert (=> b!1553280 (= res!1063218 (not (= a0!49 a!523)))))

(declare-fun b!1553281 () Bool)

(declare-datatypes ((Option!817 0))(
  ( (Some!816 (v!21995 B!2216)) (None!815) )
))
(declare-fun getValueByKey!742 (List!36273 (_ BitVec 64)) Option!817)

(assert (=> b!1553281 (= e!864798 (= (getValueByKey!742 lt!669434 a0!49) (getValueByKey!742 (toList!11238 lm!249) a0!49)))))

(declare-fun b!1553282 () Bool)

(declare-fun +!5043 (ListLongMap!22445 tuple2!24836) ListLongMap!22445)

(assert (=> b!1553282 (= e!864799 (contains!10101 (+!5043 lm!249 (tuple2!24837 a!523 b!96)) a0!49))))

(declare-fun isDefined!555 (Option!817) Bool)

(assert (=> b!1553282 (isDefined!555 (getValueByKey!742 (toList!11238 lm!249) a0!49))))

(declare-fun lt!669436 () Unit!51566)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!503 (List!36273 (_ BitVec 64)) Unit!51566)

(assert (=> b!1553282 (= lt!669436 (lemmaContainsKeyImpliesGetValueByKeyDefined!503 (toList!11238 lm!249) a0!49))))

(declare-fun b!1553283 () Bool)

(declare-fun res!1063220 () Bool)

(assert (=> b!1553283 (=> (not res!1063220) (not e!864797))))

(assert (=> b!1553283 (= res!1063220 (containsKey!759 (toList!11238 lm!249) a0!49))))

(declare-fun b!1553284 () Bool)

(declare-fun tp!112120 () Bool)

(assert (=> b!1553284 (= e!864800 tp!112120)))

(assert (= (and start!132384 res!1063222) b!1553280))

(assert (= (and b!1553280 res!1063218) b!1553283))

(assert (= (and b!1553283 res!1063220) b!1553279))

(assert (= (and b!1553279 res!1063221) b!1553281))

(assert (= (and b!1553279 (not res!1063219)) b!1553282))

(assert (= start!132384 b!1553284))

(declare-fun m!1431341 () Bool)

(assert (=> b!1553282 m!1431341))

(declare-fun m!1431343 () Bool)

(assert (=> b!1553282 m!1431343))

(assert (=> b!1553282 m!1431341))

(declare-fun m!1431345 () Bool)

(assert (=> b!1553282 m!1431345))

(assert (=> b!1553282 m!1431343))

(declare-fun m!1431347 () Bool)

(assert (=> b!1553282 m!1431347))

(declare-fun m!1431349 () Bool)

(assert (=> b!1553282 m!1431349))

(declare-fun m!1431351 () Bool)

(assert (=> b!1553283 m!1431351))

(declare-fun m!1431353 () Bool)

(assert (=> b!1553279 m!1431353))

(declare-fun m!1431355 () Bool)

(assert (=> b!1553279 m!1431355))

(declare-fun m!1431357 () Bool)

(assert (=> b!1553279 m!1431357))

(declare-fun m!1431359 () Bool)

(assert (=> b!1553279 m!1431359))

(declare-fun m!1431361 () Bool)

(assert (=> b!1553281 m!1431361))

(assert (=> b!1553281 m!1431341))

(declare-fun m!1431363 () Bool)

(assert (=> start!132384 m!1431363))

(declare-fun m!1431365 () Bool)

(assert (=> start!132384 m!1431365))

(check-sat (not start!132384) (not b!1553282) tp_is_empty!38227 (not b!1553281) (not b!1553279) (not b!1553284) (not b!1553283))
(check-sat)
(get-model)

(declare-fun d!161319 () Bool)

(declare-fun e!864836 () Bool)

(assert (=> d!161319 e!864836))

(declare-fun res!1063261 () Bool)

(assert (=> d!161319 (=> res!1063261 e!864836)))

(declare-fun lt!669472 () Bool)

(assert (=> d!161319 (= res!1063261 (not lt!669472))))

(declare-fun lt!669471 () Bool)

(assert (=> d!161319 (= lt!669472 lt!669471)))

(declare-fun lt!669469 () Unit!51566)

(declare-fun e!864835 () Unit!51566)

(assert (=> d!161319 (= lt!669469 e!864835)))

(declare-fun c!143175 () Bool)

(assert (=> d!161319 (= c!143175 lt!669471)))

(assert (=> d!161319 (= lt!669471 (containsKey!759 (toList!11238 lm!249) a0!49))))

(assert (=> d!161319 (= (contains!10101 lm!249 a0!49) lt!669472)))

(declare-fun b!1553335 () Bool)

(declare-fun lt!669470 () Unit!51566)

(assert (=> b!1553335 (= e!864835 lt!669470)))

(assert (=> b!1553335 (= lt!669470 (lemmaContainsKeyImpliesGetValueByKeyDefined!503 (toList!11238 lm!249) a0!49))))

(assert (=> b!1553335 (isDefined!555 (getValueByKey!742 (toList!11238 lm!249) a0!49))))

(declare-fun b!1553336 () Bool)

(declare-fun Unit!51572 () Unit!51566)

(assert (=> b!1553336 (= e!864835 Unit!51572)))

(declare-fun b!1553337 () Bool)

(assert (=> b!1553337 (= e!864836 (isDefined!555 (getValueByKey!742 (toList!11238 lm!249) a0!49)))))

(assert (= (and d!161319 c!143175) b!1553335))

(assert (= (and d!161319 (not c!143175)) b!1553336))

(assert (= (and d!161319 (not res!1063261)) b!1553337))

(assert (=> d!161319 m!1431351))

(assert (=> b!1553335 m!1431349))

(assert (=> b!1553335 m!1431341))

(assert (=> b!1553335 m!1431341))

(assert (=> b!1553335 m!1431345))

(assert (=> b!1553337 m!1431341))

(assert (=> b!1553337 m!1431341))

(assert (=> b!1553337 m!1431345))

(assert (=> start!132384 d!161319))

(declare-fun d!161327 () Bool)

(assert (=> d!161327 (= (inv!57311 lm!249) (isStrictlySorted!888 (toList!11238 lm!249)))))

(declare-fun bs!44611 () Bool)

(assert (= bs!44611 d!161327))

(assert (=> bs!44611 m!1431353))

(assert (=> start!132384 d!161327))

(declare-fun d!161329 () Bool)

(declare-fun res!1063275 () Bool)

(declare-fun e!864853 () Bool)

(assert (=> d!161329 (=> res!1063275 e!864853)))

(get-info :version)

(assert (=> d!161329 (= res!1063275 (and ((_ is Cons!36269) (toList!11238 lm!249)) (= (_1!12429 (h!37716 (toList!11238 lm!249))) a0!49)))))

(assert (=> d!161329 (= (containsKey!759 (toList!11238 lm!249) a0!49) e!864853)))

(declare-fun b!1553355 () Bool)

(declare-fun e!864854 () Bool)

(assert (=> b!1553355 (= e!864853 e!864854)))

(declare-fun res!1063276 () Bool)

(assert (=> b!1553355 (=> (not res!1063276) (not e!864854))))

(assert (=> b!1553355 (= res!1063276 (and (or (not ((_ is Cons!36269) (toList!11238 lm!249))) (bvsle (_1!12429 (h!37716 (toList!11238 lm!249))) a0!49)) ((_ is Cons!36269) (toList!11238 lm!249)) (bvslt (_1!12429 (h!37716 (toList!11238 lm!249))) a0!49)))))

(declare-fun b!1553356 () Bool)

(assert (=> b!1553356 (= e!864854 (containsKey!759 (t!50986 (toList!11238 lm!249)) a0!49))))

(assert (= (and d!161329 (not res!1063275)) b!1553355))

(assert (= (and b!1553355 res!1063276) b!1553356))

(declare-fun m!1431423 () Bool)

(assert (=> b!1553356 m!1431423))

(assert (=> b!1553283 d!161329))

(declare-fun d!161337 () Bool)

(declare-fun res!1063287 () Bool)

(declare-fun e!864865 () Bool)

(assert (=> d!161337 (=> res!1063287 e!864865)))

(assert (=> d!161337 (= res!1063287 (or ((_ is Nil!36270) (toList!11238 lm!249)) ((_ is Nil!36270) (t!50986 (toList!11238 lm!249)))))))

(assert (=> d!161337 (= (isStrictlySorted!888 (toList!11238 lm!249)) e!864865)))

(declare-fun b!1553367 () Bool)

(declare-fun e!864866 () Bool)

(assert (=> b!1553367 (= e!864865 e!864866)))

(declare-fun res!1063288 () Bool)

(assert (=> b!1553367 (=> (not res!1063288) (not e!864866))))

(assert (=> b!1553367 (= res!1063288 (bvslt (_1!12429 (h!37716 (toList!11238 lm!249))) (_1!12429 (h!37716 (t!50986 (toList!11238 lm!249))))))))

(declare-fun b!1553368 () Bool)

(assert (=> b!1553368 (= e!864866 (isStrictlySorted!888 (t!50986 (toList!11238 lm!249))))))

(assert (= (and d!161337 (not res!1063287)) b!1553367))

(assert (= (and b!1553367 res!1063288) b!1553368))

(declare-fun m!1431427 () Bool)

(assert (=> b!1553368 m!1431427))

(assert (=> b!1553279 d!161337))

(declare-fun d!161341 () Bool)

(declare-fun res!1063289 () Bool)

(declare-fun e!864867 () Bool)

(assert (=> d!161341 (=> res!1063289 e!864867)))

(assert (=> d!161341 (= res!1063289 (and ((_ is Cons!36269) lt!669434) (= (_1!12429 (h!37716 lt!669434)) a0!49)))))

(assert (=> d!161341 (= (containsKey!759 lt!669434 a0!49) e!864867)))

(declare-fun b!1553369 () Bool)

(declare-fun e!864868 () Bool)

(assert (=> b!1553369 (= e!864867 e!864868)))

(declare-fun res!1063290 () Bool)

(assert (=> b!1553369 (=> (not res!1063290) (not e!864868))))

(assert (=> b!1553369 (= res!1063290 (and (or (not ((_ is Cons!36269) lt!669434)) (bvsle (_1!12429 (h!37716 lt!669434)) a0!49)) ((_ is Cons!36269) lt!669434) (bvslt (_1!12429 (h!37716 lt!669434)) a0!49)))))

(declare-fun b!1553370 () Bool)

(assert (=> b!1553370 (= e!864868 (containsKey!759 (t!50986 lt!669434) a0!49))))

(assert (= (and d!161341 (not res!1063289)) b!1553369))

(assert (= (and b!1553369 res!1063290) b!1553370))

(declare-fun m!1431429 () Bool)

(assert (=> b!1553370 m!1431429))

(assert (=> b!1553279 d!161341))

(declare-fun b!1553451 () Bool)

(declare-fun lt!669488 () List!36273)

(declare-fun e!864914 () Bool)

(declare-fun contains!10105 (List!36273 tuple2!24836) Bool)

(assert (=> b!1553451 (= e!864914 (contains!10105 lt!669488 (tuple2!24837 a!523 b!96)))))

(declare-fun b!1553452 () Bool)

(declare-fun e!864918 () List!36273)

(declare-fun call!71362 () List!36273)

(assert (=> b!1553452 (= e!864918 call!71362)))

(declare-fun e!864917 () List!36273)

(declare-fun bm!71357 () Bool)

(declare-fun c!143209 () Bool)

(declare-fun call!71361 () List!36273)

(declare-fun $colon$colon!947 (List!36273 tuple2!24836) List!36273)

(assert (=> bm!71357 (= call!71361 ($colon$colon!947 e!864917 (ite c!143209 (h!37716 (toList!11238 lm!249)) (tuple2!24837 a!523 b!96))))))

(declare-fun c!143207 () Bool)

(assert (=> bm!71357 (= c!143207 c!143209)))

(declare-fun bm!71358 () Bool)

(declare-fun call!71360 () List!36273)

(assert (=> bm!71358 (= call!71360 call!71361)))

(declare-fun b!1553453 () Bool)

(assert (=> b!1553453 (= e!864917 (insertStrictlySorted!508 (t!50986 (toList!11238 lm!249)) a!523 b!96))))

(declare-fun b!1553454 () Bool)

(declare-fun e!864915 () List!36273)

(assert (=> b!1553454 (= e!864915 call!71360)))

(declare-fun b!1553455 () Bool)

(assert (=> b!1553455 (= e!864918 call!71362)))

(declare-fun b!1553456 () Bool)

(declare-fun e!864916 () List!36273)

(assert (=> b!1553456 (= e!864916 e!864915)))

(declare-fun c!143210 () Bool)

(assert (=> b!1553456 (= c!143210 (and ((_ is Cons!36269) (toList!11238 lm!249)) (= (_1!12429 (h!37716 (toList!11238 lm!249))) a!523)))))

(declare-fun bm!71359 () Bool)

(assert (=> bm!71359 (= call!71362 call!71360)))

(declare-fun d!161343 () Bool)

(assert (=> d!161343 e!864914))

(declare-fun res!1063315 () Bool)

(assert (=> d!161343 (=> (not res!1063315) (not e!864914))))

(assert (=> d!161343 (= res!1063315 (isStrictlySorted!888 lt!669488))))

(assert (=> d!161343 (= lt!669488 e!864916)))

(assert (=> d!161343 (= c!143209 (and ((_ is Cons!36269) (toList!11238 lm!249)) (bvslt (_1!12429 (h!37716 (toList!11238 lm!249))) a!523)))))

(assert (=> d!161343 (isStrictlySorted!888 (toList!11238 lm!249))))

(assert (=> d!161343 (= (insertStrictlySorted!508 (toList!11238 lm!249) a!523 b!96) lt!669488)))

(declare-fun b!1553457 () Bool)

(declare-fun res!1063316 () Bool)

(assert (=> b!1553457 (=> (not res!1063316) (not e!864914))))

(assert (=> b!1553457 (= res!1063316 (containsKey!759 lt!669488 a!523))))

(declare-fun b!1553458 () Bool)

(declare-fun c!143208 () Bool)

(assert (=> b!1553458 (= c!143208 (and ((_ is Cons!36269) (toList!11238 lm!249)) (bvsgt (_1!12429 (h!37716 (toList!11238 lm!249))) a!523)))))

(assert (=> b!1553458 (= e!864915 e!864918)))

(declare-fun b!1553459 () Bool)

(assert (=> b!1553459 (= e!864916 call!71361)))

(declare-fun b!1553460 () Bool)

(assert (=> b!1553460 (= e!864917 (ite c!143210 (t!50986 (toList!11238 lm!249)) (ite c!143208 (Cons!36269 (h!37716 (toList!11238 lm!249)) (t!50986 (toList!11238 lm!249))) Nil!36270)))))

(assert (= (and d!161343 c!143209) b!1553459))

(assert (= (and d!161343 (not c!143209)) b!1553456))

(assert (= (and b!1553456 c!143210) b!1553454))

(assert (= (and b!1553456 (not c!143210)) b!1553458))

(assert (= (and b!1553458 c!143208) b!1553455))

(assert (= (and b!1553458 (not c!143208)) b!1553452))

(assert (= (or b!1553455 b!1553452) bm!71359))

(assert (= (or b!1553454 bm!71359) bm!71358))

(assert (= (or b!1553459 bm!71358) bm!71357))

(assert (= (and bm!71357 c!143207) b!1553453))

(assert (= (and bm!71357 (not c!143207)) b!1553460))

(assert (= (and d!161343 res!1063315) b!1553457))

(assert (= (and b!1553457 res!1063316) b!1553451))

(declare-fun m!1431443 () Bool)

(assert (=> b!1553457 m!1431443))

(declare-fun m!1431445 () Bool)

(assert (=> bm!71357 m!1431445))

(declare-fun m!1431447 () Bool)

(assert (=> b!1553451 m!1431447))

(declare-fun m!1431449 () Bool)

(assert (=> d!161343 m!1431449))

(assert (=> d!161343 m!1431353))

(declare-fun m!1431451 () Bool)

(assert (=> b!1553453 m!1431451))

(assert (=> b!1553279 d!161343))

(declare-fun d!161349 () Bool)

(declare-fun e!864934 () Bool)

(assert (=> d!161349 e!864934))

(declare-fun res!1063327 () Bool)

(assert (=> d!161349 (=> (not res!1063327) (not e!864934))))

(assert (=> d!161349 (= res!1063327 (= (containsKey!759 (insertStrictlySorted!508 (toList!11238 lm!249) a!523 b!96) a0!49) (containsKey!759 (toList!11238 lm!249) a0!49)))))

(declare-fun lt!669501 () Unit!51566)

(declare-fun choose!2050 (List!36273 (_ BitVec 64) B!2216 (_ BitVec 64)) Unit!51566)

(assert (=> d!161349 (= lt!669501 (choose!2050 (toList!11238 lm!249) a!523 b!96 a0!49))))

(declare-fun e!864935 () Bool)

(assert (=> d!161349 e!864935))

(declare-fun res!1063328 () Bool)

(assert (=> d!161349 (=> (not res!1063328) (not e!864935))))

(assert (=> d!161349 (= res!1063328 (isStrictlySorted!888 (toList!11238 lm!249)))))

(assert (=> d!161349 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!4 (toList!11238 lm!249) a!523 b!96 a0!49) lt!669501)))

(declare-fun b!1553483 () Bool)

(assert (=> b!1553483 (= e!864935 (not (= a!523 a0!49)))))

(declare-fun b!1553484 () Bool)

(assert (=> b!1553484 (= e!864934 (= (getValueByKey!742 (insertStrictlySorted!508 (toList!11238 lm!249) a!523 b!96) a0!49) (getValueByKey!742 (toList!11238 lm!249) a0!49)))))

(assert (= (and d!161349 res!1063328) b!1553483))

(assert (= (and d!161349 res!1063327) b!1553484))

(assert (=> d!161349 m!1431351))

(assert (=> d!161349 m!1431357))

(declare-fun m!1431469 () Bool)

(assert (=> d!161349 m!1431469))

(assert (=> d!161349 m!1431353))

(assert (=> d!161349 m!1431357))

(declare-fun m!1431471 () Bool)

(assert (=> d!161349 m!1431471))

(assert (=> b!1553484 m!1431357))

(assert (=> b!1553484 m!1431357))

(declare-fun m!1431473 () Bool)

(assert (=> b!1553484 m!1431473))

(assert (=> b!1553484 m!1431341))

(assert (=> b!1553279 d!161349))

(declare-fun d!161355 () Bool)

(declare-fun c!143226 () Bool)

(assert (=> d!161355 (= c!143226 (and ((_ is Cons!36269) lt!669434) (= (_1!12429 (h!37716 lt!669434)) a0!49)))))

(declare-fun e!864954 () Option!817)

(assert (=> d!161355 (= (getValueByKey!742 lt!669434 a0!49) e!864954)))

(declare-fun b!1553512 () Bool)

(assert (=> b!1553512 (= e!864954 (Some!816 (_2!12429 (h!37716 lt!669434))))))

(declare-fun b!1553515 () Bool)

(declare-fun e!864955 () Option!817)

(assert (=> b!1553515 (= e!864955 None!815)))

(declare-fun b!1553513 () Bool)

(assert (=> b!1553513 (= e!864954 e!864955)))

(declare-fun c!143227 () Bool)

(assert (=> b!1553513 (= c!143227 (and ((_ is Cons!36269) lt!669434) (not (= (_1!12429 (h!37716 lt!669434)) a0!49))))))

(declare-fun b!1553514 () Bool)

(assert (=> b!1553514 (= e!864955 (getValueByKey!742 (t!50986 lt!669434) a0!49))))

(assert (= (and d!161355 c!143226) b!1553512))

(assert (= (and d!161355 (not c!143226)) b!1553513))

(assert (= (and b!1553513 c!143227) b!1553514))

(assert (= (and b!1553513 (not c!143227)) b!1553515))

(declare-fun m!1431483 () Bool)

(assert (=> b!1553514 m!1431483))

(assert (=> b!1553281 d!161355))

(declare-fun d!161365 () Bool)

(declare-fun c!143228 () Bool)

(assert (=> d!161365 (= c!143228 (and ((_ is Cons!36269) (toList!11238 lm!249)) (= (_1!12429 (h!37716 (toList!11238 lm!249))) a0!49)))))

(declare-fun e!864956 () Option!817)

(assert (=> d!161365 (= (getValueByKey!742 (toList!11238 lm!249) a0!49) e!864956)))

(declare-fun b!1553518 () Bool)

(assert (=> b!1553518 (= e!864956 (Some!816 (_2!12429 (h!37716 (toList!11238 lm!249)))))))

(declare-fun b!1553521 () Bool)

(declare-fun e!864957 () Option!817)

(assert (=> b!1553521 (= e!864957 None!815)))

(declare-fun b!1553519 () Bool)

(assert (=> b!1553519 (= e!864956 e!864957)))

(declare-fun c!143229 () Bool)

(assert (=> b!1553519 (= c!143229 (and ((_ is Cons!36269) (toList!11238 lm!249)) (not (= (_1!12429 (h!37716 (toList!11238 lm!249))) a0!49))))))

(declare-fun b!1553520 () Bool)

(assert (=> b!1553520 (= e!864957 (getValueByKey!742 (t!50986 (toList!11238 lm!249)) a0!49))))

(assert (= (and d!161365 c!143228) b!1553518))

(assert (= (and d!161365 (not c!143228)) b!1553519))

(assert (= (and b!1553519 c!143229) b!1553520))

(assert (= (and b!1553519 (not c!143229)) b!1553521))

(declare-fun m!1431485 () Bool)

(assert (=> b!1553520 m!1431485))

(assert (=> b!1553281 d!161365))

(assert (=> b!1553282 d!161365))

(declare-fun d!161367 () Bool)

(declare-fun isEmpty!1140 (Option!817) Bool)

(assert (=> d!161367 (= (isDefined!555 (getValueByKey!742 (toList!11238 lm!249) a0!49)) (not (isEmpty!1140 (getValueByKey!742 (toList!11238 lm!249) a0!49))))))

(declare-fun bs!44614 () Bool)

(assert (= bs!44614 d!161367))

(assert (=> bs!44614 m!1431341))

(declare-fun m!1431489 () Bool)

(assert (=> bs!44614 m!1431489))

(assert (=> b!1553282 d!161367))

(declare-fun d!161371 () Bool)

(assert (=> d!161371 (isDefined!555 (getValueByKey!742 (toList!11238 lm!249) a0!49))))

(declare-fun lt!669511 () Unit!51566)

(declare-fun choose!2052 (List!36273 (_ BitVec 64)) Unit!51566)

(assert (=> d!161371 (= lt!669511 (choose!2052 (toList!11238 lm!249) a0!49))))

(declare-fun e!864974 () Bool)

(assert (=> d!161371 e!864974))

(declare-fun res!1063342 () Bool)

(assert (=> d!161371 (=> (not res!1063342) (not e!864974))))

(assert (=> d!161371 (= res!1063342 (isStrictlySorted!888 (toList!11238 lm!249)))))

(assert (=> d!161371 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!503 (toList!11238 lm!249) a0!49) lt!669511)))

(declare-fun b!1553548 () Bool)

(assert (=> b!1553548 (= e!864974 (containsKey!759 (toList!11238 lm!249) a0!49))))

(assert (= (and d!161371 res!1063342) b!1553548))

(assert (=> d!161371 m!1431341))

(assert (=> d!161371 m!1431341))

(assert (=> d!161371 m!1431345))

(declare-fun m!1431503 () Bool)

(assert (=> d!161371 m!1431503))

(assert (=> d!161371 m!1431353))

(assert (=> b!1553548 m!1431351))

(assert (=> b!1553282 d!161371))

(declare-fun d!161385 () Bool)

(declare-fun e!864978 () Bool)

(assert (=> d!161385 e!864978))

(declare-fun res!1063345 () Bool)

(assert (=> d!161385 (=> res!1063345 e!864978)))

(declare-fun lt!669515 () Bool)

(assert (=> d!161385 (= res!1063345 (not lt!669515))))

(declare-fun lt!669514 () Bool)

(assert (=> d!161385 (= lt!669515 lt!669514)))

(declare-fun lt!669512 () Unit!51566)

(declare-fun e!864977 () Unit!51566)

(assert (=> d!161385 (= lt!669512 e!864977)))

(declare-fun c!143242 () Bool)

(assert (=> d!161385 (= c!143242 lt!669514)))

(assert (=> d!161385 (= lt!669514 (containsKey!759 (toList!11238 (+!5043 lm!249 (tuple2!24837 a!523 b!96))) a0!49))))

(assert (=> d!161385 (= (contains!10101 (+!5043 lm!249 (tuple2!24837 a!523 b!96)) a0!49) lt!669515)))

(declare-fun b!1553551 () Bool)

(declare-fun lt!669513 () Unit!51566)

(assert (=> b!1553551 (= e!864977 lt!669513)))

(assert (=> b!1553551 (= lt!669513 (lemmaContainsKeyImpliesGetValueByKeyDefined!503 (toList!11238 (+!5043 lm!249 (tuple2!24837 a!523 b!96))) a0!49))))

(assert (=> b!1553551 (isDefined!555 (getValueByKey!742 (toList!11238 (+!5043 lm!249 (tuple2!24837 a!523 b!96))) a0!49))))

(declare-fun b!1553552 () Bool)

(declare-fun Unit!51575 () Unit!51566)

(assert (=> b!1553552 (= e!864977 Unit!51575)))

(declare-fun b!1553553 () Bool)

(assert (=> b!1553553 (= e!864978 (isDefined!555 (getValueByKey!742 (toList!11238 (+!5043 lm!249 (tuple2!24837 a!523 b!96))) a0!49)))))

(assert (= (and d!161385 c!143242) b!1553551))

(assert (= (and d!161385 (not c!143242)) b!1553552))

(assert (= (and d!161385 (not res!1063345)) b!1553553))

(declare-fun m!1431505 () Bool)

(assert (=> d!161385 m!1431505))

(declare-fun m!1431507 () Bool)

(assert (=> b!1553551 m!1431507))

(declare-fun m!1431509 () Bool)

(assert (=> b!1553551 m!1431509))

(assert (=> b!1553551 m!1431509))

(declare-fun m!1431511 () Bool)

(assert (=> b!1553551 m!1431511))

(assert (=> b!1553553 m!1431509))

(assert (=> b!1553553 m!1431509))

(assert (=> b!1553553 m!1431511))

(assert (=> b!1553282 d!161385))

(declare-fun d!161387 () Bool)

(declare-fun e!864993 () Bool)

(assert (=> d!161387 e!864993))

(declare-fun res!1063363 () Bool)

(assert (=> d!161387 (=> (not res!1063363) (not e!864993))))

(declare-fun lt!669555 () ListLongMap!22445)

(assert (=> d!161387 (= res!1063363 (contains!10101 lt!669555 (_1!12429 (tuple2!24837 a!523 b!96))))))

(declare-fun lt!669554 () List!36273)

(assert (=> d!161387 (= lt!669555 (ListLongMap!22446 lt!669554))))

(declare-fun lt!669556 () Unit!51566)

(declare-fun lt!669557 () Unit!51566)

(assert (=> d!161387 (= lt!669556 lt!669557)))

(assert (=> d!161387 (= (getValueByKey!742 lt!669554 (_1!12429 (tuple2!24837 a!523 b!96))) (Some!816 (_2!12429 (tuple2!24837 a!523 b!96))))))

(declare-fun lemmaContainsTupThenGetReturnValue!376 (List!36273 (_ BitVec 64) B!2216) Unit!51566)

(assert (=> d!161387 (= lt!669557 (lemmaContainsTupThenGetReturnValue!376 lt!669554 (_1!12429 (tuple2!24837 a!523 b!96)) (_2!12429 (tuple2!24837 a!523 b!96))))))

(assert (=> d!161387 (= lt!669554 (insertStrictlySorted!508 (toList!11238 lm!249) (_1!12429 (tuple2!24837 a!523 b!96)) (_2!12429 (tuple2!24837 a!523 b!96))))))

(assert (=> d!161387 (= (+!5043 lm!249 (tuple2!24837 a!523 b!96)) lt!669555)))

(declare-fun b!1553574 () Bool)

(declare-fun res!1063365 () Bool)

(assert (=> b!1553574 (=> (not res!1063365) (not e!864993))))

(assert (=> b!1553574 (= res!1063365 (= (getValueByKey!742 (toList!11238 lt!669555) (_1!12429 (tuple2!24837 a!523 b!96))) (Some!816 (_2!12429 (tuple2!24837 a!523 b!96)))))))

(declare-fun b!1553575 () Bool)

(assert (=> b!1553575 (= e!864993 (contains!10105 (toList!11238 lt!669555) (tuple2!24837 a!523 b!96)))))

(assert (= (and d!161387 res!1063363) b!1553574))

(assert (= (and b!1553574 res!1063365) b!1553575))

(declare-fun m!1431533 () Bool)

(assert (=> d!161387 m!1431533))

(declare-fun m!1431535 () Bool)

(assert (=> d!161387 m!1431535))

(declare-fun m!1431537 () Bool)

(assert (=> d!161387 m!1431537))

(declare-fun m!1431539 () Bool)

(assert (=> d!161387 m!1431539))

(declare-fun m!1431541 () Bool)

(assert (=> b!1553574 m!1431541))

(declare-fun m!1431543 () Bool)

(assert (=> b!1553575 m!1431543))

(assert (=> b!1553282 d!161387))

(declare-fun b!1553582 () Bool)

(declare-fun e!864996 () Bool)

(declare-fun tp!112129 () Bool)

(assert (=> b!1553582 (= e!864996 (and tp_is_empty!38227 tp!112129))))

(assert (=> b!1553284 (= tp!112120 e!864996)))

(assert (= (and b!1553284 ((_ is Cons!36269) (toList!11238 lm!249))) b!1553582))

(check-sat (not b!1553451) (not b!1553548) (not b!1553582) (not d!161343) (not bm!71357) (not b!1553514) (not b!1553335) (not b!1553553) (not d!161327) (not d!161319) (not d!161371) (not b!1553356) tp_is_empty!38227 (not d!161367) (not b!1553368) (not b!1553551) (not b!1553453) (not b!1553484) (not d!161385) (not b!1553337) (not d!161349) (not b!1553457) (not b!1553575) (not d!161387) (not b!1553520) (not b!1553370) (not b!1553574))
(check-sat)
