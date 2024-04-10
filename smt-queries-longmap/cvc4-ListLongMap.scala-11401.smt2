; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132744 () Bool)

(assert start!132744)

(declare-fun res!1064233 () Bool)

(declare-fun e!866102 () Bool)

(assert (=> start!132744 (=> (not res!1064233) (not e!866102))))

(declare-datatypes ((B!2286 0))(
  ( (B!2287 (val!19229 Int)) )
))
(declare-datatypes ((tuple2!24834 0))(
  ( (tuple2!24835 (_1!12428 (_ BitVec 64)) (_2!12428 B!2286)) )
))
(declare-datatypes ((List!36263 0))(
  ( (Nil!36260) (Cons!36259 (h!37705 tuple2!24834) (t!50984 List!36263)) )
))
(declare-fun l!1177 () List!36263)

(declare-fun isStrictlySorted!922 (List!36263) Bool)

(assert (=> start!132744 (= res!1064233 (isStrictlySorted!922 l!1177))))

(assert (=> start!132744 e!866102))

(declare-fun e!866101 () Bool)

(assert (=> start!132744 e!866101))

(assert (=> start!132744 true))

(declare-fun tp_is_empty!38297 () Bool)

(assert (=> start!132744 tp_is_empty!38297))

(declare-fun b!1555272 () Bool)

(declare-fun res!1064234 () Bool)

(assert (=> b!1555272 (=> (not res!1064234) (not e!866102))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(assert (=> b!1555272 (= res!1064234 (and (not (= newKey!105 otherKey!50)) (is-Cons!36259 l!1177) (not (= (_1!12428 (h!37705 l!1177)) otherKey!50))))))

(declare-fun b!1555273 () Bool)

(declare-fun tp!112278 () Bool)

(assert (=> b!1555273 (= e!866101 (and tp_is_empty!38297 tp!112278))))

(declare-fun b!1555274 () Bool)

(declare-fun res!1064235 () Bool)

(assert (=> b!1555274 (=> (not res!1064235) (not e!866102))))

(assert (=> b!1555274 (= res!1064235 (isStrictlySorted!922 (t!50984 l!1177)))))

(declare-fun b!1555275 () Bool)

(declare-fun e!866100 () Bool)

(declare-fun lt!670276 () List!36263)

(declare-datatypes ((Option!847 0))(
  ( (Some!846 (v!22031 B!2286)) (None!845) )
))
(declare-fun getValueByKey!771 (List!36263 (_ BitVec 64)) Option!847)

(assert (=> b!1555275 (= e!866100 (= (getValueByKey!771 lt!670276 otherKey!50) (getValueByKey!771 (t!50984 l!1177) otherKey!50)))))

(declare-fun b!1555276 () Bool)

(declare-fun e!866099 () Bool)

(declare-fun lt!670275 () List!36263)

(assert (=> b!1555276 (= e!866099 (isStrictlySorted!922 lt!670275))))

(declare-fun b!1555277 () Bool)

(assert (=> b!1555277 (= e!866102 (not e!866099))))

(declare-fun res!1064236 () Bool)

(assert (=> b!1555277 (=> res!1064236 e!866099)))

(declare-fun containsKey!793 (List!36263 (_ BitVec 64)) Bool)

(assert (=> b!1555277 (= res!1064236 (not (= (containsKey!793 lt!670275 otherKey!50) (containsKey!793 l!1177 otherKey!50))))))

(declare-fun newValue!105 () B!2286)

(declare-fun insertStrictlySorted!533 (List!36263 (_ BitVec 64) B!2286) List!36263)

(assert (=> b!1555277 (= lt!670275 (insertStrictlySorted!533 l!1177 newKey!105 newValue!105))))

(assert (=> b!1555277 e!866100))

(declare-fun res!1064232 () Bool)

(assert (=> b!1555277 (=> (not res!1064232) (not e!866100))))

(assert (=> b!1555277 (= res!1064232 (= (containsKey!793 lt!670276 otherKey!50) (containsKey!793 (t!50984 l!1177) otherKey!50)))))

(assert (=> b!1555277 (= lt!670276 (insertStrictlySorted!533 (t!50984 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51830 0))(
  ( (Unit!51831) )
))
(declare-fun lt!670277 () Unit!51830)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!30 (List!36263 (_ BitVec 64) B!2286 (_ BitVec 64)) Unit!51830)

(assert (=> b!1555277 (= lt!670277 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!30 (t!50984 l!1177) newKey!105 newValue!105 otherKey!50))))

(assert (= (and start!132744 res!1064233) b!1555272))

(assert (= (and b!1555272 res!1064234) b!1555274))

(assert (= (and b!1555274 res!1064235) b!1555277))

(assert (= (and b!1555277 res!1064232) b!1555275))

(assert (= (and b!1555277 (not res!1064236)) b!1555276))

(assert (= (and start!132744 (is-Cons!36259 l!1177)) b!1555273))

(declare-fun m!1433373 () Bool)

(assert (=> b!1555275 m!1433373))

(declare-fun m!1433375 () Bool)

(assert (=> b!1555275 m!1433375))

(declare-fun m!1433377 () Bool)

(assert (=> b!1555277 m!1433377))

(declare-fun m!1433379 () Bool)

(assert (=> b!1555277 m!1433379))

(declare-fun m!1433381 () Bool)

(assert (=> b!1555277 m!1433381))

(declare-fun m!1433383 () Bool)

(assert (=> b!1555277 m!1433383))

(declare-fun m!1433385 () Bool)

(assert (=> b!1555277 m!1433385))

(declare-fun m!1433387 () Bool)

(assert (=> b!1555277 m!1433387))

(declare-fun m!1433389 () Bool)

(assert (=> b!1555277 m!1433389))

(declare-fun m!1433391 () Bool)

(assert (=> b!1555274 m!1433391))

(declare-fun m!1433393 () Bool)

(assert (=> start!132744 m!1433393))

(declare-fun m!1433395 () Bool)

(assert (=> b!1555276 m!1433395))

(push 1)

(assert tp_is_empty!38297)

(assert (not start!132744))

(assert (not b!1555273))

(assert (not b!1555274))

(assert (not b!1555275))

(assert (not b!1555276))

(assert (not b!1555277))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1555352 () Bool)

(declare-fun c!143594 () Bool)

(assert (=> b!1555352 (= c!143594 (and (is-Cons!36259 l!1177) (bvsgt (_1!12428 (h!37705 l!1177)) newKey!105)))))

(declare-fun e!866148 () List!36263)

(declare-fun e!866149 () List!36263)

(assert (=> b!1555352 (= e!866148 e!866149)))

(declare-fun b!1555353 () Bool)

(declare-fun call!71499 () List!36263)

(assert (=> b!1555353 (= e!866149 call!71499)))

(declare-fun b!1555354 () Bool)

(declare-fun call!71498 () List!36263)

(assert (=> b!1555354 (= e!866148 call!71498)))

(declare-fun b!1555355 () Bool)

(declare-fun res!1064251 () Bool)

(declare-fun e!866145 () Bool)

(assert (=> b!1555355 (=> (not res!1064251) (not e!866145))))

(declare-fun lt!670282 () List!36263)

(assert (=> b!1555355 (= res!1064251 (containsKey!793 lt!670282 newKey!105))))

(declare-fun e!866146 () List!36263)

(declare-fun c!143592 () Bool)

(declare-fun b!1555356 () Bool)

(assert (=> b!1555356 (= e!866146 (ite c!143592 (t!50984 l!1177) (ite c!143594 (Cons!36259 (h!37705 l!1177) (t!50984 l!1177)) Nil!36260)))))

(declare-fun b!1555357 () Bool)

(assert (=> b!1555357 (= e!866149 call!71499)))

(declare-fun b!1555358 () Bool)

(declare-fun contains!10174 (List!36263 tuple2!24834) Bool)

(assert (=> b!1555358 (= e!866145 (contains!10174 lt!670282 (tuple2!24835 newKey!105 newValue!105)))))

(declare-fun d!161915 () Bool)

(assert (=> d!161915 e!866145))

(declare-fun res!1064252 () Bool)

(assert (=> d!161915 (=> (not res!1064252) (not e!866145))))

(assert (=> d!161915 (= res!1064252 (isStrictlySorted!922 lt!670282))))

(declare-fun e!866147 () List!36263)

(assert (=> d!161915 (= lt!670282 e!866147)))

(declare-fun c!143593 () Bool)

(assert (=> d!161915 (= c!143593 (and (is-Cons!36259 l!1177) (bvslt (_1!12428 (h!37705 l!1177)) newKey!105)))))

(assert (=> d!161915 (isStrictlySorted!922 l!1177)))

(assert (=> d!161915 (= (insertStrictlySorted!533 l!1177 newKey!105 newValue!105) lt!670282)))

(declare-fun bm!71494 () Bool)

(declare-fun call!71497 () List!36263)

(assert (=> bm!71494 (= call!71498 call!71497)))

(declare-fun b!1555359 () Bool)

(assert (=> b!1555359 (= e!866146 (insertStrictlySorted!533 (t!50984 l!1177) newKey!105 newValue!105))))

(declare-fun b!1555360 () Bool)

(assert (=> b!1555360 (= e!866147 call!71497)))

(declare-fun b!1555361 () Bool)

(assert (=> b!1555361 (= e!866147 e!866148)))

(assert (=> b!1555361 (= c!143592 (and (is-Cons!36259 l!1177) (= (_1!12428 (h!37705 l!1177)) newKey!105)))))

(declare-fun bm!71495 () Bool)

(assert (=> bm!71495 (= call!71499 call!71498)))

(declare-fun bm!71496 () Bool)

(declare-fun $colon$colon!957 (List!36263 tuple2!24834) List!36263)

(assert (=> bm!71496 (= call!71497 ($colon$colon!957 e!866146 (ite c!143593 (h!37705 l!1177) (tuple2!24835 newKey!105 newValue!105))))))

(declare-fun c!143595 () Bool)

(assert (=> bm!71496 (= c!143595 c!143593)))

(assert (= (and d!161915 c!143593) b!1555360))

(assert (= (and d!161915 (not c!143593)) b!1555361))

(assert (= (and b!1555361 c!143592) b!1555354))

(assert (= (and b!1555361 (not c!143592)) b!1555352))

(assert (= (and b!1555352 c!143594) b!1555357))

(assert (= (and b!1555352 (not c!143594)) b!1555353))

(assert (= (or b!1555357 b!1555353) bm!71495))

(assert (= (or b!1555354 bm!71495) bm!71494))

(assert (= (or b!1555360 bm!71494) bm!71496))

(assert (= (and bm!71496 c!143595) b!1555359))

(assert (= (and bm!71496 (not c!143595)) b!1555356))

(assert (= (and d!161915 res!1064252) b!1555355))

(assert (= (and b!1555355 res!1064251) b!1555358))

(declare-fun m!1433409 () Bool)

(assert (=> bm!71496 m!1433409))

(declare-fun m!1433411 () Bool)

(assert (=> b!1555355 m!1433411))

(declare-fun m!1433413 () Bool)

(assert (=> b!1555358 m!1433413))

(declare-fun m!1433415 () Bool)

(assert (=> d!161915 m!1433415))

(assert (=> d!161915 m!1433393))

(assert (=> b!1555359 m!1433381))

(assert (=> b!1555277 d!161915))

(declare-fun d!161933 () Bool)

(declare-fun res!1064265 () Bool)

(declare-fun e!866168 () Bool)

(assert (=> d!161933 (=> res!1064265 e!866168)))

(assert (=> d!161933 (= res!1064265 (and (is-Cons!36259 lt!670275) (= (_1!12428 (h!37705 lt!670275)) otherKey!50)))))

(assert (=> d!161933 (= (containsKey!793 lt!670275 otherKey!50) e!866168)))

(declare-fun b!1555394 () Bool)

(declare-fun e!866169 () Bool)

(assert (=> b!1555394 (= e!866168 e!866169)))

(declare-fun res!1064266 () Bool)

(assert (=> b!1555394 (=> (not res!1064266) (not e!866169))))

(assert (=> b!1555394 (= res!1064266 (and (or (not (is-Cons!36259 lt!670275)) (bvsle (_1!12428 (h!37705 lt!670275)) otherKey!50)) (is-Cons!36259 lt!670275) (bvslt (_1!12428 (h!37705 lt!670275)) otherKey!50)))))

(declare-fun b!1555395 () Bool)

(assert (=> b!1555395 (= e!866169 (containsKey!793 (t!50984 lt!670275) otherKey!50))))

(assert (= (and d!161933 (not res!1064265)) b!1555394))

(assert (= (and b!1555394 res!1064266) b!1555395))

(declare-fun m!1433417 () Bool)

(assert (=> b!1555395 m!1433417))

(assert (=> b!1555277 d!161933))

(declare-fun d!161935 () Bool)

(declare-fun e!866190 () Bool)

(assert (=> d!161935 e!866190))

(declare-fun res!1064282 () Bool)

(assert (=> d!161935 (=> (not res!1064282) (not e!866190))))

(assert (=> d!161935 (= res!1064282 (= (containsKey!793 (insertStrictlySorted!533 (t!50984 l!1177) newKey!105 newValue!105) otherKey!50) (containsKey!793 (t!50984 l!1177) otherKey!50)))))

(declare-fun lt!670289 () Unit!51830)

(declare-fun choose!2058 (List!36263 (_ BitVec 64) B!2286 (_ BitVec 64)) Unit!51830)

(assert (=> d!161935 (= lt!670289 (choose!2058 (t!50984 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun e!866191 () Bool)

(assert (=> d!161935 e!866191))

(declare-fun res!1064281 () Bool)

(assert (=> d!161935 (=> (not res!1064281) (not e!866191))))

(assert (=> d!161935 (= res!1064281 (isStrictlySorted!922 (t!50984 l!1177)))))

(assert (=> d!161935 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!30 (t!50984 l!1177) newKey!105 newValue!105 otherKey!50) lt!670289)))

(declare-fun b!1555426 () Bool)

(assert (=> b!1555426 (= e!866191 (not (= newKey!105 otherKey!50)))))

(declare-fun b!1555427 () Bool)

(assert (=> b!1555427 (= e!866190 (= (getValueByKey!771 (insertStrictlySorted!533 (t!50984 l!1177) newKey!105 newValue!105) otherKey!50) (getValueByKey!771 (t!50984 l!1177) otherKey!50)))))

(assert (= (and d!161935 res!1064281) b!1555426))

(assert (= (and d!161935 res!1064282) b!1555427))

(assert (=> d!161935 m!1433391))

(declare-fun m!1433437 () Bool)

(assert (=> d!161935 m!1433437))

(assert (=> d!161935 m!1433383))

(assert (=> d!161935 m!1433381))

(declare-fun m!1433439 () Bool)

(assert (=> d!161935 m!1433439))

(assert (=> d!161935 m!1433381))

(assert (=> b!1555427 m!1433381))

(assert (=> b!1555427 m!1433381))

(declare-fun m!1433441 () Bool)

(assert (=> b!1555427 m!1433441))

(assert (=> b!1555427 m!1433375))

(assert (=> b!1555277 d!161935))

(declare-fun d!161943 () Bool)

(declare-fun res!1064283 () Bool)

(declare-fun e!866192 () Bool)

(assert (=> d!161943 (=> res!1064283 e!866192)))

(assert (=> d!161943 (= res!1064283 (and (is-Cons!36259 l!1177) (= (_1!12428 (h!37705 l!1177)) otherKey!50)))))

(assert (=> d!161943 (= (containsKey!793 l!1177 otherKey!50) e!866192)))

(declare-fun b!1555428 () Bool)

(declare-fun e!866193 () Bool)

(assert (=> b!1555428 (= e!866192 e!866193)))

(declare-fun res!1064284 () Bool)

(assert (=> b!1555428 (=> (not res!1064284) (not e!866193))))

(assert (=> b!1555428 (= res!1064284 (and (or (not (is-Cons!36259 l!1177)) (bvsle (_1!12428 (h!37705 l!1177)) otherKey!50)) (is-Cons!36259 l!1177) (bvslt (_1!12428 (h!37705 l!1177)) otherKey!50)))))

(declare-fun b!1555429 () Bool)

(assert (=> b!1555429 (= e!866193 (containsKey!793 (t!50984 l!1177) otherKey!50))))

(assert (= (and d!161943 (not res!1064283)) b!1555428))

(assert (= (and b!1555428 res!1064284) b!1555429))

(assert (=> b!1555429 m!1433383))

(assert (=> b!1555277 d!161943))

(declare-fun b!1555430 () Bool)

(declare-fun c!143616 () Bool)

(assert (=> b!1555430 (= c!143616 (and (is-Cons!36259 (t!50984 l!1177)) (bvsgt (_1!12428 (h!37705 (t!50984 l!1177))) newKey!105)))))

(declare-fun e!866197 () List!36263)

(declare-fun e!866198 () List!36263)

(assert (=> b!1555430 (= e!866197 e!866198)))

(declare-fun b!1555431 () Bool)

(declare-fun call!71520 () List!36263)

(assert (=> b!1555431 (= e!866198 call!71520)))

(declare-fun b!1555432 () Bool)

(declare-fun call!71519 () List!36263)

(assert (=> b!1555432 (= e!866197 call!71519)))

(declare-fun b!1555433 () Bool)

(declare-fun res!1064285 () Bool)

(declare-fun e!866194 () Bool)

(assert (=> b!1555433 (=> (not res!1064285) (not e!866194))))

(declare-fun lt!670290 () List!36263)

(assert (=> b!1555433 (= res!1064285 (containsKey!793 lt!670290 newKey!105))))

(declare-fun b!1555434 () Bool)

(declare-fun e!866195 () List!36263)

(declare-fun c!143614 () Bool)

(assert (=> b!1555434 (= e!866195 (ite c!143614 (t!50984 (t!50984 l!1177)) (ite c!143616 (Cons!36259 (h!37705 (t!50984 l!1177)) (t!50984 (t!50984 l!1177))) Nil!36260)))))

(declare-fun b!1555435 () Bool)

(assert (=> b!1555435 (= e!866198 call!71520)))

(declare-fun b!1555436 () Bool)

(assert (=> b!1555436 (= e!866194 (contains!10174 lt!670290 (tuple2!24835 newKey!105 newValue!105)))))

(declare-fun d!161945 () Bool)

(assert (=> d!161945 e!866194))

(declare-fun res!1064286 () Bool)

(assert (=> d!161945 (=> (not res!1064286) (not e!866194))))

(assert (=> d!161945 (= res!1064286 (isStrictlySorted!922 lt!670290))))

(declare-fun e!866196 () List!36263)

(assert (=> d!161945 (= lt!670290 e!866196)))

(declare-fun c!143615 () Bool)

(assert (=> d!161945 (= c!143615 (and (is-Cons!36259 (t!50984 l!1177)) (bvslt (_1!12428 (h!37705 (t!50984 l!1177))) newKey!105)))))

(assert (=> d!161945 (isStrictlySorted!922 (t!50984 l!1177))))

(assert (=> d!161945 (= (insertStrictlySorted!533 (t!50984 l!1177) newKey!105 newValue!105) lt!670290)))

(declare-fun bm!71515 () Bool)

(declare-fun call!71518 () List!36263)

(assert (=> bm!71515 (= call!71519 call!71518)))

(declare-fun b!1555437 () Bool)

(assert (=> b!1555437 (= e!866195 (insertStrictlySorted!533 (t!50984 (t!50984 l!1177)) newKey!105 newValue!105))))

(declare-fun b!1555438 () Bool)

(assert (=> b!1555438 (= e!866196 call!71518)))

(declare-fun b!1555439 () Bool)

(assert (=> b!1555439 (= e!866196 e!866197)))

(assert (=> b!1555439 (= c!143614 (and (is-Cons!36259 (t!50984 l!1177)) (= (_1!12428 (h!37705 (t!50984 l!1177))) newKey!105)))))

(declare-fun bm!71516 () Bool)

(assert (=> bm!71516 (= call!71520 call!71519)))

(declare-fun bm!71517 () Bool)

(assert (=> bm!71517 (= call!71518 ($colon$colon!957 e!866195 (ite c!143615 (h!37705 (t!50984 l!1177)) (tuple2!24835 newKey!105 newValue!105))))))

(declare-fun c!143617 () Bool)

(assert (=> bm!71517 (= c!143617 c!143615)))

(assert (= (and d!161945 c!143615) b!1555438))

(assert (= (and d!161945 (not c!143615)) b!1555439))

(assert (= (and b!1555439 c!143614) b!1555432))

(assert (= (and b!1555439 (not c!143614)) b!1555430))

(assert (= (and b!1555430 c!143616) b!1555435))

(assert (= (and b!1555430 (not c!143616)) b!1555431))

(assert (= (or b!1555435 b!1555431) bm!71516))

(assert (= (or b!1555432 bm!71516) bm!71515))

(assert (= (or b!1555438 bm!71515) bm!71517))

(assert (= (and bm!71517 c!143617) b!1555437))

(assert (= (and bm!71517 (not c!143617)) b!1555434))

(assert (= (and d!161945 res!1064286) b!1555433))

(assert (= (and b!1555433 res!1064285) b!1555436))

(declare-fun m!1433443 () Bool)

(assert (=> bm!71517 m!1433443))

(declare-fun m!1433445 () Bool)

(assert (=> b!1555433 m!1433445))

(declare-fun m!1433447 () Bool)

(assert (=> b!1555436 m!1433447))

(declare-fun m!1433449 () Bool)

(assert (=> d!161945 m!1433449))

(assert (=> d!161945 m!1433391))

(declare-fun m!1433451 () Bool)

(assert (=> b!1555437 m!1433451))

(assert (=> b!1555277 d!161945))

(declare-fun d!161947 () Bool)

(declare-fun res!1064289 () Bool)

(declare-fun e!866201 () Bool)

(assert (=> d!161947 (=> res!1064289 e!866201)))

(assert (=> d!161947 (= res!1064289 (and (is-Cons!36259 lt!670276) (= (_1!12428 (h!37705 lt!670276)) otherKey!50)))))

(assert (=> d!161947 (= (containsKey!793 lt!670276 otherKey!50) e!866201)))

(declare-fun b!1555442 () Bool)

(declare-fun e!866202 () Bool)

(assert (=> b!1555442 (= e!866201 e!866202)))

(declare-fun res!1064290 () Bool)

(assert (=> b!1555442 (=> (not res!1064290) (not e!866202))))

(assert (=> b!1555442 (= res!1064290 (and (or (not (is-Cons!36259 lt!670276)) (bvsle (_1!12428 (h!37705 lt!670276)) otherKey!50)) (is-Cons!36259 lt!670276) (bvslt (_1!12428 (h!37705 lt!670276)) otherKey!50)))))

(declare-fun b!1555443 () Bool)

(assert (=> b!1555443 (= e!866202 (containsKey!793 (t!50984 lt!670276) otherKey!50))))

(assert (= (and d!161947 (not res!1064289)) b!1555442))

(assert (= (and b!1555442 res!1064290) b!1555443))

(declare-fun m!1433453 () Bool)

(assert (=> b!1555443 m!1433453))

(assert (=> b!1555277 d!161947))

(declare-fun d!161949 () Bool)

(declare-fun res!1064293 () Bool)

(declare-fun e!866205 () Bool)

(assert (=> d!161949 (=> res!1064293 e!866205)))

(assert (=> d!161949 (= res!1064293 (and (is-Cons!36259 (t!50984 l!1177)) (= (_1!12428 (h!37705 (t!50984 l!1177))) otherKey!50)))))

(assert (=> d!161949 (= (containsKey!793 (t!50984 l!1177) otherKey!50) e!866205)))

(declare-fun b!1555446 () Bool)

(declare-fun e!866206 () Bool)

(assert (=> b!1555446 (= e!866205 e!866206)))

(declare-fun res!1064294 () Bool)

(assert (=> b!1555446 (=> (not res!1064294) (not e!866206))))

(assert (=> b!1555446 (= res!1064294 (and (or (not (is-Cons!36259 (t!50984 l!1177))) (bvsle (_1!12428 (h!37705 (t!50984 l!1177))) otherKey!50)) (is-Cons!36259 (t!50984 l!1177)) (bvslt (_1!12428 (h!37705 (t!50984 l!1177))) otherKey!50)))))

(declare-fun b!1555447 () Bool)

(assert (=> b!1555447 (= e!866206 (containsKey!793 (t!50984 (t!50984 l!1177)) otherKey!50))))

(assert (= (and d!161949 (not res!1064293)) b!1555446))

(assert (= (and b!1555446 res!1064294) b!1555447))

(declare-fun m!1433455 () Bool)

(assert (=> b!1555447 m!1433455))

(assert (=> b!1555277 d!161949))

(declare-fun d!161951 () Bool)

(declare-fun res!1064305 () Bool)

(declare-fun e!866217 () Bool)

(assert (=> d!161951 (=> res!1064305 e!866217)))

(assert (=> d!161951 (= res!1064305 (or (is-Nil!36260 l!1177) (is-Nil!36260 (t!50984 l!1177))))))

(assert (=> d!161951 (= (isStrictlySorted!922 l!1177) e!866217)))

(declare-fun b!1555458 () Bool)

(declare-fun e!866218 () Bool)

(assert (=> b!1555458 (= e!866217 e!866218)))

(declare-fun res!1064306 () Bool)

(assert (=> b!1555458 (=> (not res!1064306) (not e!866218))))

(assert (=> b!1555458 (= res!1064306 (bvslt (_1!12428 (h!37705 l!1177)) (_1!12428 (h!37705 (t!50984 l!1177)))))))

(declare-fun b!1555459 () Bool)

(assert (=> b!1555459 (= e!866218 (isStrictlySorted!922 (t!50984 l!1177)))))

(assert (= (and d!161951 (not res!1064305)) b!1555458))

(assert (= (and b!1555458 res!1064306) b!1555459))

(assert (=> b!1555459 m!1433391))

(assert (=> start!132744 d!161951))

(declare-fun d!161955 () Bool)

(declare-fun res!1064309 () Bool)

(declare-fun e!866221 () Bool)

(assert (=> d!161955 (=> res!1064309 e!866221)))

(assert (=> d!161955 (= res!1064309 (or (is-Nil!36260 lt!670275) (is-Nil!36260 (t!50984 lt!670275))))))

(assert (=> d!161955 (= (isStrictlySorted!922 lt!670275) e!866221)))

(declare-fun b!1555462 () Bool)

(declare-fun e!866222 () Bool)

(assert (=> b!1555462 (= e!866221 e!866222)))

(declare-fun res!1064310 () Bool)

(assert (=> b!1555462 (=> (not res!1064310) (not e!866222))))

(assert (=> b!1555462 (= res!1064310 (bvslt (_1!12428 (h!37705 lt!670275)) (_1!12428 (h!37705 (t!50984 lt!670275)))))))

(declare-fun b!1555463 () Bool)

(assert (=> b!1555463 (= e!866222 (isStrictlySorted!922 (t!50984 lt!670275)))))

(assert (= (and d!161955 (not res!1064309)) b!1555462))

(assert (= (and b!1555462 res!1064310) b!1555463))

(declare-fun m!1433463 () Bool)

(assert (=> b!1555463 m!1433463))

(assert (=> b!1555276 d!161955))

(declare-fun b!1555511 () Bool)

(declare-fun e!866254 () Option!847)

(assert (=> b!1555511 (= e!866254 (Some!846 (_2!12428 (h!37705 lt!670276))))))

(declare-fun b!1555513 () Bool)

(declare-fun e!866255 () Option!847)

(assert (=> b!1555513 (= e!866255 (getValueByKey!771 (t!50984 lt!670276) otherKey!50))))

(declare-fun d!161957 () Bool)

(declare-fun c!143630 () Bool)

(assert (=> d!161957 (= c!143630 (and (is-Cons!36259 lt!670276) (= (_1!12428 (h!37705 lt!670276)) otherKey!50)))))

(assert (=> d!161957 (= (getValueByKey!771 lt!670276 otherKey!50) e!866254)))

(declare-fun b!1555514 () Bool)

(assert (=> b!1555514 (= e!866255 None!845)))

(declare-fun b!1555512 () Bool)

(assert (=> b!1555512 (= e!866254 e!866255)))

(declare-fun c!143631 () Bool)

(assert (=> b!1555512 (= c!143631 (and (is-Cons!36259 lt!670276) (not (= (_1!12428 (h!37705 lt!670276)) otherKey!50))))))

