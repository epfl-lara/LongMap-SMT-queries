; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106354 () Bool)

(assert start!106354)

(declare-fun b!1265042 () Bool)

(declare-fun res!842383 () Bool)

(declare-fun e!720406 () Bool)

(assert (=> b!1265042 (=> (not res!842383) (not e!720406))))

(declare-datatypes ((B!1952 0))(
  ( (B!1953 (val!16311 Int)) )
))
(declare-datatypes ((tuple2!21140 0))(
  ( (tuple2!21141 (_1!10581 (_ BitVec 64)) (_2!10581 B!1952)) )
))
(declare-datatypes ((List!28303 0))(
  ( (Nil!28300) (Cons!28299 (h!29508 tuple2!21140) (t!41824 List!28303)) )
))
(declare-fun l!706 () List!28303)

(assert (=> b!1265042 (= res!842383 (is-Cons!28299 l!706))))

(declare-fun b!1265043 () Bool)

(declare-fun res!842382 () Bool)

(assert (=> b!1265043 (=> (not res!842382) (not e!720406))))

(declare-fun isStrictlySorted!781 (List!28303) Bool)

(assert (=> b!1265043 (= res!842382 (isStrictlySorted!781 (t!41824 l!706)))))

(declare-fun res!842386 () Bool)

(assert (=> start!106354 (=> (not res!842386) (not e!720406))))

(assert (=> start!106354 (= res!842386 (isStrictlySorted!781 l!706))))

(assert (=> start!106354 e!720406))

(declare-fun e!720407 () Bool)

(assert (=> start!106354 e!720407))

(assert (=> start!106354 true))

(declare-fun tp_is_empty!32485 () Bool)

(assert (=> start!106354 tp_is_empty!32485))

(declare-fun b!1265044 () Bool)

(declare-fun res!842384 () Bool)

(assert (=> b!1265044 (=> (not res!842384) (not e!720406))))

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!640 (List!28303 (_ BitVec 64)) Bool)

(assert (=> b!1265044 (= res!842384 (not (containsKey!640 l!706 key1!31)))))

(declare-fun v1!26 () B!1952)

(declare-fun b!1265045 () Bool)

(declare-fun insertStrictlySorted!459 (List!28303 (_ BitVec 64) B!1952) List!28303)

(assert (=> b!1265045 (= e!720406 (not (isStrictlySorted!781 (insertStrictlySorted!459 l!706 key1!31 v1!26))))))

(declare-fun removeStrictlySorted!152 (List!28303 (_ BitVec 64)) List!28303)

(assert (=> b!1265045 (= (removeStrictlySorted!152 (insertStrictlySorted!459 (t!41824 l!706) key1!31 v1!26) key1!31) (t!41824 l!706))))

(declare-datatypes ((Unit!42177 0))(
  ( (Unit!42178) )
))
(declare-fun lt!574005 () Unit!42177)

(declare-fun lemmaInsertStrictlySortedThenRemoveIsSame!7 (List!28303 (_ BitVec 64) B!1952) Unit!42177)

(assert (=> b!1265045 (= lt!574005 (lemmaInsertStrictlySortedThenRemoveIsSame!7 (t!41824 l!706) key1!31 v1!26))))

(declare-fun b!1265046 () Bool)

(declare-fun tp!96293 () Bool)

(assert (=> b!1265046 (= e!720407 (and tp_is_empty!32485 tp!96293))))

(declare-fun b!1265047 () Bool)

(declare-fun res!842385 () Bool)

(assert (=> b!1265047 (=> (not res!842385) (not e!720406))))

(assert (=> b!1265047 (= res!842385 (not (containsKey!640 (t!41824 l!706) key1!31)))))

(assert (= (and start!106354 res!842386) b!1265044))

(assert (= (and b!1265044 res!842384) b!1265042))

(assert (= (and b!1265042 res!842383) b!1265043))

(assert (= (and b!1265043 res!842382) b!1265047))

(assert (= (and b!1265047 res!842385) b!1265045))

(assert (= (and start!106354 (is-Cons!28299 l!706)) b!1265046))

(declare-fun m!1165413 () Bool)

(assert (=> b!1265043 m!1165413))

(declare-fun m!1165415 () Bool)

(assert (=> b!1265045 m!1165415))

(declare-fun m!1165417 () Bool)

(assert (=> b!1265045 m!1165417))

(declare-fun m!1165419 () Bool)

(assert (=> b!1265045 m!1165419))

(declare-fun m!1165421 () Bool)

(assert (=> b!1265045 m!1165421))

(assert (=> b!1265045 m!1165419))

(declare-fun m!1165423 () Bool)

(assert (=> b!1265045 m!1165423))

(assert (=> b!1265045 m!1165415))

(declare-fun m!1165425 () Bool)

(assert (=> start!106354 m!1165425))

(declare-fun m!1165427 () Bool)

(assert (=> b!1265044 m!1165427))

(declare-fun m!1165429 () Bool)

(assert (=> b!1265047 m!1165429))

(push 1)

(assert (not b!1265045))

(assert (not b!1265047))

(assert (not b!1265046))

(assert tp_is_empty!32485)

(assert (not start!106354))

(assert (not b!1265043))

(assert (not b!1265044))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!138847 () Bool)

(declare-fun res!842431 () Bool)

(declare-fun e!720434 () Bool)

(assert (=> d!138847 (=> res!842431 e!720434)))

(assert (=> d!138847 (= res!842431 (or (is-Nil!28300 l!706) (is-Nil!28300 (t!41824 l!706))))))

(assert (=> d!138847 (= (isStrictlySorted!781 l!706) e!720434)))

(declare-fun b!1265098 () Bool)

(declare-fun e!720435 () Bool)

(assert (=> b!1265098 (= e!720434 e!720435)))

(declare-fun res!842432 () Bool)

(assert (=> b!1265098 (=> (not res!842432) (not e!720435))))

(assert (=> b!1265098 (= res!842432 (bvslt (_1!10581 (h!29508 l!706)) (_1!10581 (h!29508 (t!41824 l!706)))))))

(declare-fun b!1265099 () Bool)

(assert (=> b!1265099 (= e!720435 (isStrictlySorted!781 (t!41824 l!706)))))

(assert (= (and d!138847 (not res!842431)) b!1265098))

(assert (= (and b!1265098 res!842432) b!1265099))

(assert (=> b!1265099 m!1165413))

(assert (=> start!106354 d!138847))

(declare-fun d!138851 () Bool)

(declare-fun res!842435 () Bool)

(declare-fun e!720438 () Bool)

(assert (=> d!138851 (=> res!842435 e!720438)))

(assert (=> d!138851 (= res!842435 (or (is-Nil!28300 (t!41824 l!706)) (is-Nil!28300 (t!41824 (t!41824 l!706)))))))

(assert (=> d!138851 (= (isStrictlySorted!781 (t!41824 l!706)) e!720438)))

(declare-fun b!1265102 () Bool)

(declare-fun e!720439 () Bool)

(assert (=> b!1265102 (= e!720438 e!720439)))

(declare-fun res!842436 () Bool)

(assert (=> b!1265102 (=> (not res!842436) (not e!720439))))

(assert (=> b!1265102 (= res!842436 (bvslt (_1!10581 (h!29508 (t!41824 l!706))) (_1!10581 (h!29508 (t!41824 (t!41824 l!706))))))))

(declare-fun b!1265103 () Bool)

(assert (=> b!1265103 (= e!720439 (isStrictlySorted!781 (t!41824 (t!41824 l!706))))))

(assert (= (and d!138851 (not res!842435)) b!1265102))

(assert (= (and b!1265102 res!842436) b!1265103))

(declare-fun m!1165469 () Bool)

(assert (=> b!1265103 m!1165469))

(assert (=> b!1265043 d!138851))

(declare-fun d!138855 () Bool)

(declare-fun res!842449 () Bool)

(declare-fun e!720452 () Bool)

(assert (=> d!138855 (=> res!842449 e!720452)))

(assert (=> d!138855 (= res!842449 (and (is-Cons!28299 (t!41824 l!706)) (= (_1!10581 (h!29508 (t!41824 l!706))) key1!31)))))

(assert (=> d!138855 (= (containsKey!640 (t!41824 l!706) key1!31) e!720452)))

(declare-fun b!1265116 () Bool)

(declare-fun e!720453 () Bool)

(assert (=> b!1265116 (= e!720452 e!720453)))

(declare-fun res!842450 () Bool)

(assert (=> b!1265116 (=> (not res!842450) (not e!720453))))

(assert (=> b!1265116 (= res!842450 (and (or (not (is-Cons!28299 (t!41824 l!706))) (bvsle (_1!10581 (h!29508 (t!41824 l!706))) key1!31)) (is-Cons!28299 (t!41824 l!706)) (bvslt (_1!10581 (h!29508 (t!41824 l!706))) key1!31)))))

(declare-fun b!1265117 () Bool)

(assert (=> b!1265117 (= e!720453 (containsKey!640 (t!41824 (t!41824 l!706)) key1!31))))

(assert (= (and d!138855 (not res!842449)) b!1265116))

(assert (= (and b!1265116 res!842450) b!1265117))

(declare-fun m!1165473 () Bool)

(assert (=> b!1265117 m!1165473))

(assert (=> b!1265047 d!138855))

(declare-fun b!1265155 () Bool)

(declare-fun e!720477 () List!28303)

(assert (=> b!1265155 (= e!720477 (t!41824 (insertStrictlySorted!459 (t!41824 l!706) key1!31 v1!26)))))

(declare-fun b!1265156 () Bool)

(declare-fun e!720478 () List!28303)

(assert (=> b!1265156 (= e!720477 e!720478)))

(declare-fun c!123233 () Bool)

(assert (=> b!1265156 (= c!123233 (and (is-Cons!28299 (insertStrictlySorted!459 (t!41824 l!706) key1!31 v1!26)) (not (= (_1!10581 (h!29508 (insertStrictlySorted!459 (t!41824 l!706) key1!31 v1!26))) key1!31))))))

(declare-fun d!138861 () Bool)

(declare-fun e!720479 () Bool)

(assert (=> d!138861 e!720479))

(declare-fun res!842460 () Bool)

(assert (=> d!138861 (=> (not res!842460) (not e!720479))))

(declare-fun lt!574019 () List!28303)

(assert (=> d!138861 (= res!842460 (isStrictlySorted!781 lt!574019))))

(assert (=> d!138861 (= lt!574019 e!720477)))

(declare-fun c!123232 () Bool)

(assert (=> d!138861 (= c!123232 (and (is-Cons!28299 (insertStrictlySorted!459 (t!41824 l!706) key1!31 v1!26)) (= (_1!10581 (h!29508 (insertStrictlySorted!459 (t!41824 l!706) key1!31 v1!26))) key1!31)))))

(assert (=> d!138861 (isStrictlySorted!781 (insertStrictlySorted!459 (t!41824 l!706) key1!31 v1!26))))

(assert (=> d!138861 (= (removeStrictlySorted!152 (insertStrictlySorted!459 (t!41824 l!706) key1!31 v1!26) key1!31) lt!574019)))

(declare-fun b!1265157 () Bool)

(assert (=> b!1265157 (= e!720479 (not (containsKey!640 lt!574019 key1!31)))))

(declare-fun b!1265158 () Bool)

(declare-fun $colon$colon!636 (List!28303 tuple2!21140) List!28303)

(assert (=> b!1265158 (= e!720478 ($colon$colon!636 (removeStrictlySorted!152 (t!41824 (insertStrictlySorted!459 (t!41824 l!706) key1!31 v1!26)) key1!31) (h!29508 (insertStrictlySorted!459 (t!41824 l!706) key1!31 v1!26))))))

(declare-fun b!1265159 () Bool)

(assert (=> b!1265159 (= e!720478 Nil!28300)))

(assert (= (and d!138861 c!123232) b!1265155))

(assert (= (and d!138861 (not c!123232)) b!1265156))

(assert (= (and b!1265156 c!123233) b!1265158))

(assert (= (and b!1265156 (not c!123233)) b!1265159))

(assert (= (and d!138861 res!842460) b!1265157))

(declare-fun m!1165487 () Bool)

(assert (=> d!138861 m!1165487))

(assert (=> d!138861 m!1165419))

(declare-fun m!1165489 () Bool)

(assert (=> d!138861 m!1165489))

(declare-fun m!1165491 () Bool)

(assert (=> b!1265157 m!1165491))

(declare-fun m!1165495 () Bool)

(assert (=> b!1265158 m!1165495))

(assert (=> b!1265158 m!1165495))

(declare-fun m!1165501 () Bool)

(assert (=> b!1265158 m!1165501))

(assert (=> b!1265045 d!138861))

(declare-fun d!138867 () Bool)

(declare-fun e!720518 () Bool)

(assert (=> d!138867 e!720518))

(declare-fun res!842476 () Bool)

(assert (=> d!138867 (=> (not res!842476) (not e!720518))))

(declare-fun lt!574028 () List!28303)

(assert (=> d!138867 (= res!842476 (isStrictlySorted!781 lt!574028))))

(declare-fun e!720522 () List!28303)

(assert (=> d!138867 (= lt!574028 e!720522)))

(declare-fun c!123267 () Bool)

(assert (=> d!138867 (= c!123267 (and (is-Cons!28299 l!706) (bvslt (_1!10581 (h!29508 l!706)) key1!31)))))

(assert (=> d!138867 (isStrictlySorted!781 l!706)))

(assert (=> d!138867 (= (insertStrictlySorted!459 l!706 key1!31 v1!26) lt!574028)))

(declare-fun b!1265235 () Bool)

(declare-fun c!123266 () Bool)

(declare-fun e!720520 () List!28303)

(declare-fun c!123264 () Bool)

(assert (=> b!1265235 (= e!720520 (ite c!123266 (t!41824 l!706) (ite c!123264 (Cons!28299 (h!29508 l!706) (t!41824 l!706)) Nil!28300)))))

(declare-fun b!1265236 () Bool)

(declare-fun e!720519 () List!28303)

(declare-fun call!62383 () List!28303)

(assert (=> b!1265236 (= e!720519 call!62383)))

(declare-fun b!1265237 () Bool)

(declare-fun contains!7634 (List!28303 tuple2!21140) Bool)

(assert (=> b!1265237 (= e!720518 (contains!7634 lt!574028 (tuple2!21141 key1!31 v1!26)))))

(declare-fun b!1265238 () Bool)

(declare-fun call!62381 () List!28303)

(assert (=> b!1265238 (= e!720522 call!62381)))

(declare-fun b!1265239 () Bool)

(declare-fun e!720521 () List!28303)

(declare-fun call!62382 () List!28303)

(assert (=> b!1265239 (= e!720521 call!62382)))

(declare-fun b!1265240 () Bool)

(assert (=> b!1265240 (= c!123264 (and (is-Cons!28299 l!706) (bvsgt (_1!10581 (h!29508 l!706)) key1!31)))))

(assert (=> b!1265240 (= e!720521 e!720519)))

(declare-fun bm!62378 () Bool)

(assert (=> bm!62378 (= call!62382 call!62381)))

(declare-fun bm!62379 () Bool)

(assert (=> bm!62379 (= call!62383 call!62382)))

(declare-fun b!1265241 () Bool)

(assert (=> b!1265241 (= e!720519 call!62383)))

(declare-fun b!1265242 () Bool)

(assert (=> b!1265242 (= e!720520 (insertStrictlySorted!459 (t!41824 l!706) key1!31 v1!26))))

(declare-fun b!1265243 () Bool)

(declare-fun res!842477 () Bool)

(assert (=> b!1265243 (=> (not res!842477) (not e!720518))))

(assert (=> b!1265243 (= res!842477 (containsKey!640 lt!574028 key1!31))))

(declare-fun bm!62380 () Bool)

(assert (=> bm!62380 (= call!62381 ($colon$colon!636 e!720520 (ite c!123267 (h!29508 l!706) (tuple2!21141 key1!31 v1!26))))))

(declare-fun c!123265 () Bool)

(assert (=> bm!62380 (= c!123265 c!123267)))

(declare-fun b!1265244 () Bool)

(assert (=> b!1265244 (= e!720522 e!720521)))

(assert (=> b!1265244 (= c!123266 (and (is-Cons!28299 l!706) (= (_1!10581 (h!29508 l!706)) key1!31)))))

(assert (= (and d!138867 c!123267) b!1265238))

(assert (= (and d!138867 (not c!123267)) b!1265244))

(assert (= (and b!1265244 c!123266) b!1265239))

(assert (= (and b!1265244 (not c!123266)) b!1265240))

(assert (= (and b!1265240 c!123264) b!1265236))

(assert (= (and b!1265240 (not c!123264)) b!1265241))

(assert (= (or b!1265236 b!1265241) bm!62379))

(assert (= (or b!1265239 bm!62379) bm!62378))

(assert (= (or b!1265238 bm!62378) bm!62380))

(assert (= (and bm!62380 c!123265) b!1265242))

(assert (= (and bm!62380 (not c!123265)) b!1265235))

(assert (= (and d!138867 res!842476) b!1265243))

(assert (= (and b!1265243 res!842477) b!1265237))

(declare-fun m!1165515 () Bool)

(assert (=> b!1265243 m!1165515))

(declare-fun m!1165517 () Bool)

(assert (=> b!1265237 m!1165517))

(assert (=> b!1265242 m!1165419))

(declare-fun m!1165519 () Bool)

(assert (=> d!138867 m!1165519))

(assert (=> d!138867 m!1165425))

(declare-fun m!1165527 () Bool)

(assert (=> bm!62380 m!1165527))

(assert (=> b!1265045 d!138867))

(declare-fun d!138875 () Bool)

(assert (=> d!138875 (= (removeStrictlySorted!152 (insertStrictlySorted!459 (t!41824 l!706) key1!31 v1!26) key1!31) (t!41824 l!706))))

(declare-fun lt!574038 () Unit!42177)

(declare-fun choose!1884 (List!28303 (_ BitVec 64) B!1952) Unit!42177)

(assert (=> d!138875 (= lt!574038 (choose!1884 (t!41824 l!706) key1!31 v1!26))))

(assert (=> d!138875 (isStrictlySorted!781 (t!41824 l!706))))

(assert (=> d!138875 (= (lemmaInsertStrictlySortedThenRemoveIsSame!7 (t!41824 l!706) key1!31 v1!26) lt!574038)))

(declare-fun bs!35811 () Bool)

(assert (= bs!35811 d!138875))

(assert (=> bs!35811 m!1165419))

(assert (=> bs!35811 m!1165419))

(assert (=> bs!35811 m!1165423))

(declare-fun m!1165545 () Bool)

(assert (=> bs!35811 m!1165545))

(assert (=> bs!35811 m!1165413))

(assert (=> b!1265045 d!138875))

(declare-fun d!138883 () Bool)

(declare-fun e!720539 () Bool)

(assert (=> d!138883 e!720539))

(declare-fun res!842488 () Bool)

(assert (=> d!138883 (=> (not res!842488) (not e!720539))))

(declare-fun lt!574040 () List!28303)

(assert (=> d!138883 (= res!842488 (isStrictlySorted!781 lt!574040))))

(declare-fun e!720543 () List!28303)

(assert (=> d!138883 (= lt!574040 e!720543)))

(declare-fun c!123279 () Bool)

(assert (=> d!138883 (= c!123279 (and (is-Cons!28299 (t!41824 l!706)) (bvslt (_1!10581 (h!29508 (t!41824 l!706))) key1!31)))))

(assert (=> d!138883 (isStrictlySorted!781 (t!41824 l!706))))

(assert (=> d!138883 (= (insertStrictlySorted!459 (t!41824 l!706) key1!31 v1!26) lt!574040)))

(declare-fun c!123278 () Bool)

(declare-fun c!123276 () Bool)

(declare-fun e!720541 () List!28303)

(declare-fun b!1265271 () Bool)

(assert (=> b!1265271 (= e!720541 (ite c!123278 (t!41824 (t!41824 l!706)) (ite c!123276 (Cons!28299 (h!29508 (t!41824 l!706)) (t!41824 (t!41824 l!706))) Nil!28300)))))

(declare-fun b!1265272 () Bool)

(declare-fun e!720540 () List!28303)

(declare-fun call!62392 () List!28303)

(assert (=> b!1265272 (= e!720540 call!62392)))

(declare-fun b!1265273 () Bool)

(assert (=> b!1265273 (= e!720539 (contains!7634 lt!574040 (tuple2!21141 key1!31 v1!26)))))

(declare-fun b!1265274 () Bool)

(declare-fun call!62390 () List!28303)

(assert (=> b!1265274 (= e!720543 call!62390)))

(declare-fun b!1265275 () Bool)

(declare-fun e!720542 () List!28303)

(declare-fun call!62391 () List!28303)

(assert (=> b!1265275 (= e!720542 call!62391)))

(declare-fun b!1265276 () Bool)

(assert (=> b!1265276 (= c!123276 (and (is-Cons!28299 (t!41824 l!706)) (bvsgt (_1!10581 (h!29508 (t!41824 l!706))) key1!31)))))

(assert (=> b!1265276 (= e!720542 e!720540)))

(declare-fun bm!62387 () Bool)

(assert (=> bm!62387 (= call!62391 call!62390)))

(declare-fun bm!62388 () Bool)

(assert (=> bm!62388 (= call!62392 call!62391)))

(declare-fun b!1265277 () Bool)

(assert (=> b!1265277 (= e!720540 call!62392)))

(declare-fun b!1265278 () Bool)

(assert (=> b!1265278 (= e!720541 (insertStrictlySorted!459 (t!41824 (t!41824 l!706)) key1!31 v1!26))))

(declare-fun b!1265279 () Bool)

(declare-fun res!842489 () Bool)

(assert (=> b!1265279 (=> (not res!842489) (not e!720539))))

(assert (=> b!1265279 (= res!842489 (containsKey!640 lt!574040 key1!31))))

(declare-fun bm!62389 () Bool)

(assert (=> bm!62389 (= call!62390 ($colon$colon!636 e!720541 (ite c!123279 (h!29508 (t!41824 l!706)) (tuple2!21141 key1!31 v1!26))))))

(declare-fun c!123277 () Bool)

(assert (=> bm!62389 (= c!123277 c!123279)))

(declare-fun b!1265280 () Bool)

(assert (=> b!1265280 (= e!720543 e!720542)))

(assert (=> b!1265280 (= c!123278 (and (is-Cons!28299 (t!41824 l!706)) (= (_1!10581 (h!29508 (t!41824 l!706))) key1!31)))))

(assert (= (and d!138883 c!123279) b!1265274))

(assert (= (and d!138883 (not c!123279)) b!1265280))

(assert (= (and b!1265280 c!123278) b!1265275))

(assert (= (and b!1265280 (not c!123278)) b!1265276))

(assert (= (and b!1265276 c!123276) b!1265272))

(assert (= (and b!1265276 (not c!123276)) b!1265277))

(assert (= (or b!1265272 b!1265277) bm!62388))

(assert (= (or b!1265275 bm!62388) bm!62387))

(assert (= (or b!1265274 bm!62387) bm!62389))

(assert (= (and bm!62389 c!123277) b!1265278))

(assert (= (and bm!62389 (not c!123277)) b!1265271))

(assert (= (and d!138883 res!842488) b!1265279))

(assert (= (and b!1265279 res!842489) b!1265273))

(declare-fun m!1165549 () Bool)

(assert (=> b!1265279 m!1165549))

(declare-fun m!1165551 () Bool)

(assert (=> b!1265273 m!1165551))

(declare-fun m!1165553 () Bool)

(assert (=> b!1265278 m!1165553))

(declare-fun m!1165555 () Bool)

(assert (=> d!138883 m!1165555))

(assert (=> d!138883 m!1165413))

(declare-fun m!1165557 () Bool)

(assert (=> bm!62389 m!1165557))

(assert (=> b!1265045 d!138883))

(declare-fun d!138887 () Bool)

(declare-fun res!842494 () Bool)

(declare-fun e!720551 () Bool)

(assert (=> d!138887 (=> res!842494 e!720551)))

(assert (=> d!138887 (= res!842494 (or (is-Nil!28300 (insertStrictlySorted!459 l!706 key1!31 v1!26)) (is-Nil!28300 (t!41824 (insertStrictlySorted!459 l!706 key1!31 v1!26)))))))

(assert (=> d!138887 (= (isStrictlySorted!781 (insertStrictlySorted!459 l!706 key1!31 v1!26)) e!720551)))

(declare-fun b!1265293 () Bool)

(declare-fun e!720552 () Bool)

(assert (=> b!1265293 (= e!720551 e!720552)))

(declare-fun res!842495 () Bool)

(assert (=> b!1265293 (=> (not res!842495) (not e!720552))))

(assert (=> b!1265293 (= res!842495 (bvslt (_1!10581 (h!29508 (insertStrictlySorted!459 l!706 key1!31 v1!26))) (_1!10581 (h!29508 (t!41824 (insertStrictlySorted!459 l!706 key1!31 v1!26))))))))

(declare-fun b!1265294 () Bool)

(assert (=> b!1265294 (= e!720552 (isStrictlySorted!781 (t!41824 (insertStrictlySorted!459 l!706 key1!31 v1!26))))))

(assert (= (and d!138887 (not res!842494)) b!1265293))

(assert (= (and b!1265293 res!842495) b!1265294))

(declare-fun m!1165569 () Bool)

(assert (=> b!1265294 m!1165569))

(assert (=> b!1265045 d!138887))

(declare-fun d!138895 () Bool)

(declare-fun res!842500 () Bool)

(declare-fun e!720557 () Bool)

(assert (=> d!138895 (=> res!842500 e!720557)))

(assert (=> d!138895 (= res!842500 (and (is-Cons!28299 l!706) (= (_1!10581 (h!29508 l!706)) key1!31)))))

(assert (=> d!138895 (= (containsKey!640 l!706 key1!31) e!720557)))

(declare-fun b!1265299 () Bool)

(declare-fun e!720559 () Bool)

(assert (=> b!1265299 (= e!720557 e!720559)))

(declare-fun res!842502 () Bool)

(assert (=> b!1265299 (=> (not res!842502) (not e!720559))))

(assert (=> b!1265299 (= res!842502 (and (or (not (is-Cons!28299 l!706)) (bvsle (_1!10581 (h!29508 l!706)) key1!31)) (is-Cons!28299 l!706) (bvslt (_1!10581 (h!29508 l!706)) key1!31)))))

(declare-fun b!1265301 () Bool)

(assert (=> b!1265301 (= e!720559 (containsKey!640 (t!41824 l!706) key1!31))))

(assert (= (and d!138895 (not res!842500)) b!1265299))

(assert (= (and b!1265299 res!842502) b!1265301))

(assert (=> b!1265301 m!1165429))

(assert (=> b!1265044 d!138895))

(declare-fun b!1265316 () Bool)

(declare-fun e!720568 () Bool)

(declare-fun tp!96307 () Bool)

(assert (=> b!1265316 (= e!720568 (and tp_is_empty!32485 tp!96307))))

(assert (=> b!1265046 (= tp!96293 e!720568)))

(assert (= (and b!1265046 (is-Cons!28299 (t!41824 l!706))) b!1265316))

(push 1)

