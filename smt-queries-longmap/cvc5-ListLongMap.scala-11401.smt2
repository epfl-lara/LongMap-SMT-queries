; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132740 () Bool)

(assert start!132740)

(declare-fun b!1555236 () Bool)

(declare-fun e!866077 () Bool)

(declare-datatypes ((B!2282 0))(
  ( (B!2283 (val!19227 Int)) )
))
(declare-datatypes ((tuple2!24830 0))(
  ( (tuple2!24831 (_1!12426 (_ BitVec 64)) (_2!12426 B!2282)) )
))
(declare-datatypes ((List!36261 0))(
  ( (Nil!36258) (Cons!36257 (h!37703 tuple2!24830) (t!50982 List!36261)) )
))
(declare-fun lt!670257 () List!36261)

(declare-fun isStrictlySorted!920 (List!36261) Bool)

(assert (=> b!1555236 (= e!866077 (isStrictlySorted!920 lt!670257))))

(declare-fun b!1555237 () Bool)

(declare-fun res!1064204 () Bool)

(declare-fun e!866078 () Bool)

(assert (=> b!1555237 (=> (not res!1064204) (not e!866078))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-fun l!1177 () List!36261)

(assert (=> b!1555237 (= res!1064204 (and (not (= newKey!105 otherKey!50)) (is-Cons!36257 l!1177) (not (= (_1!12426 (h!37703 l!1177)) otherKey!50))))))

(declare-fun b!1555238 () Bool)

(assert (=> b!1555238 (= e!866078 (not e!866077))))

(declare-fun res!1064205 () Bool)

(assert (=> b!1555238 (=> res!1064205 e!866077)))

(declare-fun containsKey!791 (List!36261 (_ BitVec 64)) Bool)

(assert (=> b!1555238 (= res!1064205 (not (= (containsKey!791 lt!670257 otherKey!50) (containsKey!791 l!1177 otherKey!50))))))

(declare-fun newValue!105 () B!2282)

(declare-fun insertStrictlySorted!531 (List!36261 (_ BitVec 64) B!2282) List!36261)

(assert (=> b!1555238 (= lt!670257 (insertStrictlySorted!531 l!1177 newKey!105 newValue!105))))

(declare-fun e!866075 () Bool)

(assert (=> b!1555238 e!866075))

(declare-fun res!1064206 () Bool)

(assert (=> b!1555238 (=> (not res!1064206) (not e!866075))))

(declare-fun lt!670259 () List!36261)

(assert (=> b!1555238 (= res!1064206 (= (containsKey!791 lt!670259 otherKey!50) (containsKey!791 (t!50982 l!1177) otherKey!50)))))

(assert (=> b!1555238 (= lt!670259 (insertStrictlySorted!531 (t!50982 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51826 0))(
  ( (Unit!51827) )
))
(declare-fun lt!670258 () Unit!51826)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!28 (List!36261 (_ BitVec 64) B!2282 (_ BitVec 64)) Unit!51826)

(assert (=> b!1555238 (= lt!670258 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!28 (t!50982 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1555239 () Bool)

(declare-datatypes ((Option!845 0))(
  ( (Some!844 (v!22029 B!2282)) (None!843) )
))
(declare-fun getValueByKey!769 (List!36261 (_ BitVec 64)) Option!845)

(assert (=> b!1555239 (= e!866075 (= (getValueByKey!769 lt!670259 otherKey!50) (getValueByKey!769 (t!50982 l!1177) otherKey!50)))))

(declare-fun res!1064203 () Bool)

(assert (=> start!132740 (=> (not res!1064203) (not e!866078))))

(assert (=> start!132740 (= res!1064203 (isStrictlySorted!920 l!1177))))

(assert (=> start!132740 e!866078))

(declare-fun e!866076 () Bool)

(assert (=> start!132740 e!866076))

(assert (=> start!132740 true))

(declare-fun tp_is_empty!38293 () Bool)

(assert (=> start!132740 tp_is_empty!38293))

(declare-fun b!1555240 () Bool)

(declare-fun res!1064202 () Bool)

(assert (=> b!1555240 (=> (not res!1064202) (not e!866078))))

(assert (=> b!1555240 (= res!1064202 (isStrictlySorted!920 (t!50982 l!1177)))))

(declare-fun b!1555241 () Bool)

(declare-fun tp!112272 () Bool)

(assert (=> b!1555241 (= e!866076 (and tp_is_empty!38293 tp!112272))))

(assert (= (and start!132740 res!1064203) b!1555237))

(assert (= (and b!1555237 res!1064204) b!1555240))

(assert (= (and b!1555240 res!1064202) b!1555238))

(assert (= (and b!1555238 res!1064206) b!1555239))

(assert (= (and b!1555238 (not res!1064205)) b!1555236))

(assert (= (and start!132740 (is-Cons!36257 l!1177)) b!1555241))

(declare-fun m!1433325 () Bool)

(assert (=> b!1555236 m!1433325))

(declare-fun m!1433327 () Bool)

(assert (=> b!1555238 m!1433327))

(declare-fun m!1433329 () Bool)

(assert (=> b!1555238 m!1433329))

(declare-fun m!1433331 () Bool)

(assert (=> b!1555238 m!1433331))

(declare-fun m!1433333 () Bool)

(assert (=> b!1555238 m!1433333))

(declare-fun m!1433335 () Bool)

(assert (=> b!1555238 m!1433335))

(declare-fun m!1433337 () Bool)

(assert (=> b!1555238 m!1433337))

(declare-fun m!1433339 () Bool)

(assert (=> b!1555238 m!1433339))

(declare-fun m!1433341 () Bool)

(assert (=> b!1555240 m!1433341))

(declare-fun m!1433343 () Bool)

(assert (=> b!1555239 m!1433343))

(declare-fun m!1433345 () Bool)

(assert (=> b!1555239 m!1433345))

(declare-fun m!1433347 () Bool)

(assert (=> start!132740 m!1433347))

(push 1)

(assert tp_is_empty!38293)

(assert (not b!1555236))

(assert (not b!1555241))

(assert (not b!1555239))

(assert (not b!1555240))

(assert (not start!132740))

(assert (not b!1555238))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1555312 () Bool)

(declare-fun e!866125 () Option!845)

(assert (=> b!1555312 (= e!866125 (Some!844 (_2!12426 (h!37703 lt!670259))))))

(declare-fun d!161919 () Bool)

(declare-fun c!143574 () Bool)

(assert (=> d!161919 (= c!143574 (and (is-Cons!36257 lt!670259) (= (_1!12426 (h!37703 lt!670259)) otherKey!50)))))

(assert (=> d!161919 (= (getValueByKey!769 lt!670259 otherKey!50) e!866125)))

(declare-fun b!1555313 () Bool)

(declare-fun e!866126 () Option!845)

(assert (=> b!1555313 (= e!866125 e!866126)))

(declare-fun c!143575 () Bool)

(assert (=> b!1555313 (= c!143575 (and (is-Cons!36257 lt!670259) (not (= (_1!12426 (h!37703 lt!670259)) otherKey!50))))))

(declare-fun b!1555314 () Bool)

(assert (=> b!1555314 (= e!866126 (getValueByKey!769 (t!50982 lt!670259) otherKey!50))))

(declare-fun b!1555315 () Bool)

(assert (=> b!1555315 (= e!866126 None!843)))

(assert (= (and d!161919 c!143574) b!1555312))

(assert (= (and d!161919 (not c!143574)) b!1555313))

(assert (= (and b!1555313 c!143575) b!1555314))

(assert (= (and b!1555313 (not c!143575)) b!1555315))

(declare-fun m!1433405 () Bool)

(assert (=> b!1555314 m!1433405))

(assert (=> b!1555239 d!161919))

(declare-fun b!1555316 () Bool)

(declare-fun e!866127 () Option!845)

(assert (=> b!1555316 (= e!866127 (Some!844 (_2!12426 (h!37703 (t!50982 l!1177)))))))

(declare-fun d!161929 () Bool)

(declare-fun c!143576 () Bool)

(assert (=> d!161929 (= c!143576 (and (is-Cons!36257 (t!50982 l!1177)) (= (_1!12426 (h!37703 (t!50982 l!1177))) otherKey!50)))))

(assert (=> d!161929 (= (getValueByKey!769 (t!50982 l!1177) otherKey!50) e!866127)))

(declare-fun b!1555317 () Bool)

(declare-fun e!866128 () Option!845)

(assert (=> b!1555317 (= e!866127 e!866128)))

(declare-fun c!143577 () Bool)

(assert (=> b!1555317 (= c!143577 (and (is-Cons!36257 (t!50982 l!1177)) (not (= (_1!12426 (h!37703 (t!50982 l!1177))) otherKey!50))))))

(declare-fun b!1555318 () Bool)

(assert (=> b!1555318 (= e!866128 (getValueByKey!769 (t!50982 (t!50982 l!1177)) otherKey!50))))

(declare-fun b!1555319 () Bool)

(assert (=> b!1555319 (= e!866128 None!843)))

(assert (= (and d!161929 c!143576) b!1555316))

(assert (= (and d!161929 (not c!143576)) b!1555317))

(assert (= (and b!1555317 c!143577) b!1555318))

(assert (= (and b!1555317 (not c!143577)) b!1555319))

(declare-fun m!1433407 () Bool)

(assert (=> b!1555318 m!1433407))

(assert (=> b!1555239 d!161929))

(declare-fun b!1555406 () Bool)

(declare-fun e!866175 () List!36261)

(declare-fun call!71516 () List!36261)

(assert (=> b!1555406 (= e!866175 call!71516)))

(declare-fun b!1555407 () Bool)

(declare-fun e!866179 () Bool)

(declare-fun lt!670286 () List!36261)

(declare-fun contains!10175 (List!36261 tuple2!24830) Bool)

(assert (=> b!1555407 (= e!866179 (contains!10175 lt!670286 (tuple2!24831 newKey!105 newValue!105)))))

(declare-fun bm!71512 () Bool)

(declare-fun call!71517 () List!36261)

(assert (=> bm!71512 (= call!71517 call!71516)))

(declare-fun b!1555408 () Bool)

(declare-fun res!1064269 () Bool)

(assert (=> b!1555408 (=> (not res!1064269) (not e!866179))))

(assert (=> b!1555408 (= res!1064269 (containsKey!791 lt!670286 newKey!105))))

(declare-fun c!143611 () Bool)

(declare-fun c!143613 () Bool)

(declare-fun e!866177 () List!36261)

(declare-fun b!1555409 () Bool)

(assert (=> b!1555409 (= e!866177 (ite c!143611 (t!50982 l!1177) (ite c!143613 (Cons!36257 (h!37703 l!1177) (t!50982 l!1177)) Nil!36258)))))

(declare-fun d!161931 () Bool)

(assert (=> d!161931 e!866179))

(declare-fun res!1064270 () Bool)

(assert (=> d!161931 (=> (not res!1064270) (not e!866179))))

(assert (=> d!161931 (= res!1064270 (isStrictlySorted!920 lt!670286))))

(assert (=> d!161931 (= lt!670286 e!866175)))

(declare-fun c!143612 () Bool)

(assert (=> d!161931 (= c!143612 (and (is-Cons!36257 l!1177) (bvslt (_1!12426 (h!37703 l!1177)) newKey!105)))))

(assert (=> d!161931 (isStrictlySorted!920 l!1177)))

(assert (=> d!161931 (= (insertStrictlySorted!531 l!1177 newKey!105 newValue!105) lt!670286)))

(declare-fun b!1555410 () Bool)

(declare-fun e!866176 () List!36261)

(declare-fun call!71515 () List!36261)

(assert (=> b!1555410 (= e!866176 call!71515)))

(declare-fun b!1555411 () Bool)

(declare-fun e!866178 () List!36261)

(assert (=> b!1555411 (= e!866175 e!866178)))

(assert (=> b!1555411 (= c!143611 (and (is-Cons!36257 l!1177) (= (_1!12426 (h!37703 l!1177)) newKey!105)))))

(declare-fun b!1555412 () Bool)

(assert (=> b!1555412 (= e!866177 (insertStrictlySorted!531 (t!50982 l!1177) newKey!105 newValue!105))))

(declare-fun bm!71513 () Bool)

(assert (=> bm!71513 (= call!71515 call!71517)))

(declare-fun b!1555413 () Bool)

(assert (=> b!1555413 (= e!866178 call!71517)))

(declare-fun bm!71514 () Bool)

(declare-fun $colon$colon!959 (List!36261 tuple2!24830) List!36261)

(assert (=> bm!71514 (= call!71516 ($colon$colon!959 e!866177 (ite c!143612 (h!37703 l!1177) (tuple2!24831 newKey!105 newValue!105))))))

(declare-fun c!143610 () Bool)

(assert (=> bm!71514 (= c!143610 c!143612)))

(declare-fun b!1555414 () Bool)

(assert (=> b!1555414 (= c!143613 (and (is-Cons!36257 l!1177) (bvsgt (_1!12426 (h!37703 l!1177)) newKey!105)))))

(assert (=> b!1555414 (= e!866178 e!866176)))

(declare-fun b!1555415 () Bool)

(assert (=> b!1555415 (= e!866176 call!71515)))

(assert (= (and d!161931 c!143612) b!1555406))

(assert (= (and d!161931 (not c!143612)) b!1555411))

(assert (= (and b!1555411 c!143611) b!1555413))

(assert (= (and b!1555411 (not c!143611)) b!1555414))

(assert (= (and b!1555414 c!143613) b!1555410))

(assert (= (and b!1555414 (not c!143613)) b!1555415))

(assert (= (or b!1555410 b!1555415) bm!71513))

(assert (= (or b!1555413 bm!71513) bm!71512))

(assert (= (or b!1555406 bm!71512) bm!71514))

(assert (= (and bm!71514 c!143610) b!1555412))

(assert (= (and bm!71514 (not c!143610)) b!1555409))

(assert (= (and d!161931 res!1064270) b!1555408))

(assert (= (and b!1555408 res!1064269) b!1555407))

(assert (=> b!1555412 m!1433333))

(declare-fun m!1433427 () Bool)

(assert (=> b!1555408 m!1433427))

(declare-fun m!1433429 () Bool)

(assert (=> bm!71514 m!1433429))

(declare-fun m!1433431 () Bool)

(assert (=> b!1555407 m!1433431))

(declare-fun m!1433433 () Bool)

(assert (=> d!161931 m!1433433))

(assert (=> d!161931 m!1433347))

(assert (=> b!1555238 d!161931))

(declare-fun d!161939 () Bool)

(declare-fun e!866210 () Bool)

(assert (=> d!161939 e!866210))

(declare-fun res!1064295 () Bool)

(assert (=> d!161939 (=> (not res!1064295) (not e!866210))))

(assert (=> d!161939 (= res!1064295 (= (containsKey!791 (insertStrictlySorted!531 (t!50982 l!1177) newKey!105 newValue!105) otherKey!50) (containsKey!791 (t!50982 l!1177) otherKey!50)))))

(declare-fun lt!670293 () Unit!51826)

(declare-fun choose!2059 (List!36261 (_ BitVec 64) B!2282 (_ BitVec 64)) Unit!51826)

(assert (=> d!161939 (= lt!670293 (choose!2059 (t!50982 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun e!866207 () Bool)

(assert (=> d!161939 e!866207))

(declare-fun res!1064296 () Bool)

(assert (=> d!161939 (=> (not res!1064296) (not e!866207))))

(assert (=> d!161939 (= res!1064296 (isStrictlySorted!920 (t!50982 l!1177)))))

(assert (=> d!161939 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!28 (t!50982 l!1177) newKey!105 newValue!105 otherKey!50) lt!670293)))

(declare-fun b!1555448 () Bool)

(assert (=> b!1555448 (= e!866207 (not (= newKey!105 otherKey!50)))))

(declare-fun b!1555449 () Bool)

(assert (=> b!1555449 (= e!866210 (= (getValueByKey!769 (insertStrictlySorted!531 (t!50982 l!1177) newKey!105 newValue!105) otherKey!50) (getValueByKey!769 (t!50982 l!1177) otherKey!50)))))

(assert (= (and d!161939 res!1064296) b!1555448))

(assert (= (and d!161939 res!1064295) b!1555449))

(assert (=> d!161939 m!1433335))

(assert (=> d!161939 m!1433341))

(declare-fun m!1433457 () Bool)

(assert (=> d!161939 m!1433457))

(assert (=> d!161939 m!1433333))

(assert (=> d!161939 m!1433333))

(declare-fun m!1433459 () Bool)

(assert (=> d!161939 m!1433459))

(assert (=> b!1555449 m!1433333))

(assert (=> b!1555449 m!1433333))

(declare-fun m!1433461 () Bool)

(assert (=> b!1555449 m!1433461))

(assert (=> b!1555449 m!1433345))

(assert (=> b!1555238 d!161939))

(declare-fun d!161953 () Bool)

(declare-fun res!1064321 () Bool)

(declare-fun e!866236 () Bool)

(assert (=> d!161953 (=> res!1064321 e!866236)))

(assert (=> d!161953 (= res!1064321 (and (is-Cons!36257 l!1177) (= (_1!12426 (h!37703 l!1177)) otherKey!50)))))

(assert (=> d!161953 (= (containsKey!791 l!1177 otherKey!50) e!866236)))

(declare-fun b!1555484 () Bool)

(declare-fun e!866237 () Bool)

(assert (=> b!1555484 (= e!866236 e!866237)))

(declare-fun res!1064322 () Bool)

(assert (=> b!1555484 (=> (not res!1064322) (not e!866237))))

(assert (=> b!1555484 (= res!1064322 (and (or (not (is-Cons!36257 l!1177)) (bvsle (_1!12426 (h!37703 l!1177)) otherKey!50)) (is-Cons!36257 l!1177) (bvslt (_1!12426 (h!37703 l!1177)) otherKey!50)))))

(declare-fun b!1555485 () Bool)

(assert (=> b!1555485 (= e!866237 (containsKey!791 (t!50982 l!1177) otherKey!50))))

(assert (= (and d!161953 (not res!1064321)) b!1555484))

(assert (= (and b!1555484 res!1064322) b!1555485))

(assert (=> b!1555485 m!1433335))

(assert (=> b!1555238 d!161953))

(declare-fun b!1555492 () Bool)

(declare-fun e!866242 () List!36261)

(declare-fun call!71525 () List!36261)

(assert (=> b!1555492 (= e!866242 call!71525)))

(declare-fun b!1555493 () Bool)

(declare-fun e!866246 () Bool)

(declare-fun lt!670298 () List!36261)

(assert (=> b!1555493 (= e!866246 (contains!10175 lt!670298 (tuple2!24831 newKey!105 newValue!105)))))

(declare-fun bm!71521 () Bool)

(declare-fun call!71526 () List!36261)

(assert (=> bm!71521 (= call!71526 call!71525)))

(declare-fun b!1555494 () Bool)

(declare-fun res!1064323 () Bool)

(assert (=> b!1555494 (=> (not res!1064323) (not e!866246))))

(assert (=> b!1555494 (= res!1064323 (containsKey!791 lt!670298 newKey!105))))

(declare-fun c!143629 () Bool)

(declare-fun c!143627 () Bool)

(declare-fun e!866244 () List!36261)

(declare-fun b!1555495 () Bool)

(assert (=> b!1555495 (= e!866244 (ite c!143627 (t!50982 (t!50982 l!1177)) (ite c!143629 (Cons!36257 (h!37703 (t!50982 l!1177)) (t!50982 (t!50982 l!1177))) Nil!36258)))))

(declare-fun d!161965 () Bool)

(assert (=> d!161965 e!866246))

(declare-fun res!1064324 () Bool)

(assert (=> d!161965 (=> (not res!1064324) (not e!866246))))

(assert (=> d!161965 (= res!1064324 (isStrictlySorted!920 lt!670298))))

(assert (=> d!161965 (= lt!670298 e!866242)))

(declare-fun c!143628 () Bool)

(assert (=> d!161965 (= c!143628 (and (is-Cons!36257 (t!50982 l!1177)) (bvslt (_1!12426 (h!37703 (t!50982 l!1177))) newKey!105)))))

(assert (=> d!161965 (isStrictlySorted!920 (t!50982 l!1177))))

(assert (=> d!161965 (= (insertStrictlySorted!531 (t!50982 l!1177) newKey!105 newValue!105) lt!670298)))

(declare-fun b!1555496 () Bool)

(declare-fun e!866243 () List!36261)

(declare-fun call!71524 () List!36261)

(assert (=> b!1555496 (= e!866243 call!71524)))

(declare-fun b!1555497 () Bool)

(declare-fun e!866245 () List!36261)

(assert (=> b!1555497 (= e!866242 e!866245)))

(assert (=> b!1555497 (= c!143627 (and (is-Cons!36257 (t!50982 l!1177)) (= (_1!12426 (h!37703 (t!50982 l!1177))) newKey!105)))))

(declare-fun b!1555498 () Bool)

(assert (=> b!1555498 (= e!866244 (insertStrictlySorted!531 (t!50982 (t!50982 l!1177)) newKey!105 newValue!105))))

(declare-fun bm!71522 () Bool)

(assert (=> bm!71522 (= call!71524 call!71526)))

(declare-fun b!1555499 () Bool)

(assert (=> b!1555499 (= e!866245 call!71526)))

(declare-fun bm!71523 () Bool)

(assert (=> bm!71523 (= call!71525 ($colon$colon!959 e!866244 (ite c!143628 (h!37703 (t!50982 l!1177)) (tuple2!24831 newKey!105 newValue!105))))))

(declare-fun c!143626 () Bool)

(assert (=> bm!71523 (= c!143626 c!143628)))

(declare-fun b!1555500 () Bool)

(assert (=> b!1555500 (= c!143629 (and (is-Cons!36257 (t!50982 l!1177)) (bvsgt (_1!12426 (h!37703 (t!50982 l!1177))) newKey!105)))))

(assert (=> b!1555500 (= e!866245 e!866243)))

(declare-fun b!1555501 () Bool)

(assert (=> b!1555501 (= e!866243 call!71524)))

(assert (= (and d!161965 c!143628) b!1555492))

(assert (= (and d!161965 (not c!143628)) b!1555497))

(assert (= (and b!1555497 c!143627) b!1555499))

(assert (= (and b!1555497 (not c!143627)) b!1555500))

(assert (= (and b!1555500 c!143629) b!1555496))

(assert (= (and b!1555500 (not c!143629)) b!1555501))

(assert (= (or b!1555496 b!1555501) bm!71522))

(assert (= (or b!1555499 bm!71522) bm!71521))

(assert (= (or b!1555492 bm!71521) bm!71523))

(assert (= (and bm!71523 c!143626) b!1555498))

(assert (= (and bm!71523 (not c!143626)) b!1555495))

(assert (= (and d!161965 res!1064324) b!1555494))

(assert (= (and b!1555494 res!1064323) b!1555493))

(declare-fun m!1433485 () Bool)

(assert (=> b!1555498 m!1433485))

(declare-fun m!1433487 () Bool)

(assert (=> b!1555494 m!1433487))

(declare-fun m!1433489 () Bool)

(assert (=> bm!71523 m!1433489))

(declare-fun m!1433491 () Bool)

(assert (=> b!1555493 m!1433491))

(declare-fun m!1433493 () Bool)

(assert (=> d!161965 m!1433493))

(assert (=> d!161965 m!1433341))

(assert (=> b!1555238 d!161965))

(declare-fun d!161969 () Bool)

(declare-fun res!1064327 () Bool)

(declare-fun e!866251 () Bool)

(assert (=> d!161969 (=> res!1064327 e!866251)))

(assert (=> d!161969 (= res!1064327 (and (is-Cons!36257 (t!50982 l!1177)) (= (_1!12426 (h!37703 (t!50982 l!1177))) otherKey!50)))))

(assert (=> d!161969 (= (containsKey!791 (t!50982 l!1177) otherKey!50) e!866251)))

(declare-fun b!1555508 () Bool)

(declare-fun e!866252 () Bool)

(assert (=> b!1555508 (= e!866251 e!866252)))

(declare-fun res!1064328 () Bool)

(assert (=> b!1555508 (=> (not res!1064328) (not e!866252))))

(assert (=> b!1555508 (= res!1064328 (and (or (not (is-Cons!36257 (t!50982 l!1177))) (bvsle (_1!12426 (h!37703 (t!50982 l!1177))) otherKey!50)) (is-Cons!36257 (t!50982 l!1177)) (bvslt (_1!12426 (h!37703 (t!50982 l!1177))) otherKey!50)))))

(declare-fun b!1555509 () Bool)

(assert (=> b!1555509 (= e!866252 (containsKey!791 (t!50982 (t!50982 l!1177)) otherKey!50))))

(assert (= (and d!161969 (not res!1064327)) b!1555508))

(assert (= (and b!1555508 res!1064328) b!1555509))

(declare-fun m!1433495 () Bool)

(assert (=> b!1555509 m!1433495))

(assert (=> b!1555238 d!161969))

(declare-fun d!161971 () Bool)

(declare-fun res!1064329 () Bool)

(declare-fun e!866256 () Bool)

(assert (=> d!161971 (=> res!1064329 e!866256)))

(assert (=> d!161971 (= res!1064329 (and (is-Cons!36257 lt!670259) (= (_1!12426 (h!37703 lt!670259)) otherKey!50)))))

(assert (=> d!161971 (= (containsKey!791 lt!670259 otherKey!50) e!866256)))

(declare-fun b!1555515 () Bool)

(declare-fun e!866257 () Bool)

(assert (=> b!1555515 (= e!866256 e!866257)))

(declare-fun res!1064330 () Bool)

(assert (=> b!1555515 (=> (not res!1064330) (not e!866257))))

(assert (=> b!1555515 (= res!1064330 (and (or (not (is-Cons!36257 lt!670259)) (bvsle (_1!12426 (h!37703 lt!670259)) otherKey!50)) (is-Cons!36257 lt!670259) (bvslt (_1!12426 (h!37703 lt!670259)) otherKey!50)))))

(declare-fun b!1555516 () Bool)

(assert (=> b!1555516 (= e!866257 (containsKey!791 (t!50982 lt!670259) otherKey!50))))

(assert (= (and d!161971 (not res!1064329)) b!1555515))

(assert (= (and b!1555515 res!1064330) b!1555516))

(declare-fun m!1433499 () Bool)

(assert (=> b!1555516 m!1433499))

(assert (=> b!1555238 d!161971))

(declare-fun d!161975 () Bool)

(declare-fun res!1064331 () Bool)

(declare-fun e!866258 () Bool)

(assert (=> d!161975 (=> res!1064331 e!866258)))

(assert (=> d!161975 (= res!1064331 (and (is-Cons!36257 lt!670257) (= (_1!12426 (h!37703 lt!670257)) otherKey!50)))))

(assert (=> d!161975 (= (containsKey!791 lt!670257 otherKey!50) e!866258)))

(declare-fun b!1555517 () Bool)

(declare-fun e!866259 () Bool)

(assert (=> b!1555517 (= e!866258 e!866259)))

(declare-fun res!1064332 () Bool)

(assert (=> b!1555517 (=> (not res!1064332) (not e!866259))))

(assert (=> b!1555517 (= res!1064332 (and (or (not (is-Cons!36257 lt!670257)) (bvsle (_1!12426 (h!37703 lt!670257)) otherKey!50)) (is-Cons!36257 lt!670257) (bvslt (_1!12426 (h!37703 lt!670257)) otherKey!50)))))

(declare-fun b!1555518 () Bool)

(assert (=> b!1555518 (= e!866259 (containsKey!791 (t!50982 lt!670257) otherKey!50))))

(assert (= (and d!161975 (not res!1064331)) b!1555517))

(assert (= (and b!1555517 res!1064332) b!1555518))

(declare-fun m!1433501 () Bool)

(assert (=> b!1555518 m!1433501))

(assert (=> b!1555238 d!161975))

(declare-fun d!161977 () Bool)

(declare-fun res!1064339 () Bool)

(declare-fun e!866271 () Bool)

(assert (=> d!161977 (=> res!1064339 e!866271)))

(assert (=> d!161977 (= res!1064339 (or (is-Nil!36258 l!1177) (is-Nil!36258 (t!50982 l!1177))))))

(assert (=> d!161977 (= (isStrictlySorted!920 l!1177) e!866271)))

(declare-fun b!1555534 () Bool)

(declare-fun e!866272 () Bool)

(assert (=> b!1555534 (= e!866271 e!866272)))

(declare-fun res!1064340 () Bool)

(assert (=> b!1555534 (=> (not res!1064340) (not e!866272))))

(assert (=> b!1555534 (= res!1064340 (bvslt (_1!12426 (h!37703 l!1177)) (_1!12426 (h!37703 (t!50982 l!1177)))))))

(declare-fun b!1555535 () Bool)

(assert (=> b!1555535 (= e!866272 (isStrictlySorted!920 (t!50982 l!1177)))))

(assert (= (and d!161977 (not res!1064339)) b!1555534))

(assert (= (and b!1555534 res!1064340) b!1555535))

(assert (=> b!1555535 m!1433341))

(assert (=> start!132740 d!161977))

(declare-fun d!161981 () Bool)

(declare-fun res!1064341 () Bool)

(declare-fun e!866273 () Bool)

(assert (=> d!161981 (=> res!1064341 e!866273)))

(assert (=> d!161981 (= res!1064341 (or (is-Nil!36258 lt!670257) (is-Nil!36258 (t!50982 lt!670257))))))

(assert (=> d!161981 (= (isStrictlySorted!920 lt!670257) e!866273)))

(declare-fun b!1555536 () Bool)

(declare-fun e!866274 () Bool)

(assert (=> b!1555536 (= e!866273 e!866274)))

(declare-fun res!1064342 () Bool)

(assert (=> b!1555536 (=> (not res!1064342) (not e!866274))))

(assert (=> b!1555536 (= res!1064342 (bvslt (_1!12426 (h!37703 lt!670257)) (_1!12426 (h!37703 (t!50982 lt!670257)))))))

(declare-fun b!1555537 () Bool)

(assert (=> b!1555537 (= e!866274 (isStrictlySorted!920 (t!50982 lt!670257)))))

(assert (= (and d!161981 (not res!1064341)) b!1555536))

(assert (= (and b!1555536 res!1064342) b!1555537))

(declare-fun m!1433507 () Bool)

(assert (=> b!1555537 m!1433507))

(assert (=> b!1555236 d!161981))

(declare-fun d!161983 () Bool)

(declare-fun res!1064343 () Bool)

(declare-fun e!866275 () Bool)

(assert (=> d!161983 (=> res!1064343 e!866275)))

(assert (=> d!161983 (= res!1064343 (or (is-Nil!36258 (t!50982 l!1177)) (is-Nil!36258 (t!50982 (t!50982 l!1177)))))))

(assert (=> d!161983 (= (isStrictlySorted!920 (t!50982 l!1177)) e!866275)))

(declare-fun b!1555538 () Bool)

(declare-fun e!866276 () Bool)

(assert (=> b!1555538 (= e!866275 e!866276)))

(declare-fun res!1064344 () Bool)

(assert (=> b!1555538 (=> (not res!1064344) (not e!866276))))

(assert (=> b!1555538 (= res!1064344 (bvslt (_1!12426 (h!37703 (t!50982 l!1177))) (_1!12426 (h!37703 (t!50982 (t!50982 l!1177))))))))

(declare-fun b!1555539 () Bool)

(assert (=> b!1555539 (= e!866276 (isStrictlySorted!920 (t!50982 (t!50982 l!1177))))))

(assert (= (and d!161983 (not res!1064343)) b!1555538))

(assert (= (and b!1555538 res!1064344) b!1555539))

(declare-fun m!1433509 () Bool)

(assert (=> b!1555539 m!1433509))

(assert (=> b!1555240 d!161983))

(declare-fun b!1555544 () Bool)

(declare-fun e!866279 () Bool)

(declare-fun tp!112287 () Bool)

(assert (=> b!1555544 (= e!866279 (and tp_is_empty!38293 tp!112287))))

(assert (=> b!1555241 (= tp!112272 e!866279)))

(assert (= (and b!1555241 (is-Cons!36257 (t!50982 l!1177))) b!1555544))

(push 1)

