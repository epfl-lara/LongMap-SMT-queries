; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106356 () Bool)

(assert start!106356)

(declare-fun b!1265060 () Bool)

(declare-fun res!842397 () Bool)

(declare-fun e!720412 () Bool)

(assert (=> b!1265060 (=> (not res!842397) (not e!720412))))

(declare-datatypes ((B!1954 0))(
  ( (B!1955 (val!16312 Int)) )
))
(declare-datatypes ((tuple2!21142 0))(
  ( (tuple2!21143 (_1!10582 (_ BitVec 64)) (_2!10582 B!1954)) )
))
(declare-datatypes ((List!28304 0))(
  ( (Nil!28301) (Cons!28300 (h!29509 tuple2!21142) (t!41825 List!28304)) )
))
(declare-fun l!706 () List!28304)

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!641 (List!28304 (_ BitVec 64)) Bool)

(assert (=> b!1265060 (= res!842397 (not (containsKey!641 l!706 key1!31)))))

(declare-fun res!842401 () Bool)

(assert (=> start!106356 (=> (not res!842401) (not e!720412))))

(declare-fun isStrictlySorted!782 (List!28304) Bool)

(assert (=> start!106356 (= res!842401 (isStrictlySorted!782 l!706))))

(assert (=> start!106356 e!720412))

(declare-fun e!720413 () Bool)

(assert (=> start!106356 e!720413))

(assert (=> start!106356 true))

(declare-fun tp_is_empty!32487 () Bool)

(assert (=> start!106356 tp_is_empty!32487))

(declare-fun b!1265061 () Bool)

(declare-fun v1!26 () B!1954)

(declare-fun insertStrictlySorted!460 (List!28304 (_ BitVec 64) B!1954) List!28304)

(assert (=> b!1265061 (= e!720412 (not (isStrictlySorted!782 (insertStrictlySorted!460 l!706 key1!31 v1!26))))))

(declare-fun removeStrictlySorted!153 (List!28304 (_ BitVec 64)) List!28304)

(assert (=> b!1265061 (= (removeStrictlySorted!153 (insertStrictlySorted!460 (t!41825 l!706) key1!31 v1!26) key1!31) (t!41825 l!706))))

(declare-datatypes ((Unit!42179 0))(
  ( (Unit!42180) )
))
(declare-fun lt!574008 () Unit!42179)

(declare-fun lemmaInsertStrictlySortedThenRemoveIsSame!8 (List!28304 (_ BitVec 64) B!1954) Unit!42179)

(assert (=> b!1265061 (= lt!574008 (lemmaInsertStrictlySortedThenRemoveIsSame!8 (t!41825 l!706) key1!31 v1!26))))

(declare-fun b!1265062 () Bool)

(declare-fun res!842399 () Bool)

(assert (=> b!1265062 (=> (not res!842399) (not e!720412))))

(get-info :version)

(assert (=> b!1265062 (= res!842399 ((_ is Cons!28300) l!706))))

(declare-fun b!1265063 () Bool)

(declare-fun res!842398 () Bool)

(assert (=> b!1265063 (=> (not res!842398) (not e!720412))))

(assert (=> b!1265063 (= res!842398 (isStrictlySorted!782 (t!41825 l!706)))))

(declare-fun b!1265064 () Bool)

(declare-fun res!842400 () Bool)

(assert (=> b!1265064 (=> (not res!842400) (not e!720412))))

(assert (=> b!1265064 (= res!842400 (not (containsKey!641 (t!41825 l!706) key1!31)))))

(declare-fun b!1265065 () Bool)

(declare-fun tp!96296 () Bool)

(assert (=> b!1265065 (= e!720413 (and tp_is_empty!32487 tp!96296))))

(assert (= (and start!106356 res!842401) b!1265060))

(assert (= (and b!1265060 res!842397) b!1265062))

(assert (= (and b!1265062 res!842399) b!1265063))

(assert (= (and b!1265063 res!842398) b!1265064))

(assert (= (and b!1265064 res!842400) b!1265061))

(assert (= (and start!106356 ((_ is Cons!28300) l!706)) b!1265065))

(declare-fun m!1165431 () Bool)

(assert (=> b!1265063 m!1165431))

(declare-fun m!1165433 () Bool)

(assert (=> b!1265060 m!1165433))

(declare-fun m!1165435 () Bool)

(assert (=> b!1265064 m!1165435))

(declare-fun m!1165437 () Bool)

(assert (=> start!106356 m!1165437))

(declare-fun m!1165439 () Bool)

(assert (=> b!1265061 m!1165439))

(declare-fun m!1165441 () Bool)

(assert (=> b!1265061 m!1165441))

(declare-fun m!1165443 () Bool)

(assert (=> b!1265061 m!1165443))

(declare-fun m!1165445 () Bool)

(assert (=> b!1265061 m!1165445))

(assert (=> b!1265061 m!1165443))

(declare-fun m!1165447 () Bool)

(assert (=> b!1265061 m!1165447))

(assert (=> b!1265061 m!1165439))

(check-sat (not b!1265060) (not b!1265064) (not start!106356) (not b!1265063) (not b!1265061) (not b!1265065) tp_is_empty!32487)
(check-sat)
(get-model)

(declare-fun d!138843 () Bool)

(declare-fun res!842433 () Bool)

(declare-fun e!720436 () Bool)

(assert (=> d!138843 (=> res!842433 e!720436)))

(assert (=> d!138843 (= res!842433 (and ((_ is Cons!28300) l!706) (= (_1!10582 (h!29509 l!706)) key1!31)))))

(assert (=> d!138843 (= (containsKey!641 l!706 key1!31) e!720436)))

(declare-fun b!1265100 () Bool)

(declare-fun e!720437 () Bool)

(assert (=> b!1265100 (= e!720436 e!720437)))

(declare-fun res!842434 () Bool)

(assert (=> b!1265100 (=> (not res!842434) (not e!720437))))

(assert (=> b!1265100 (= res!842434 (and (or (not ((_ is Cons!28300) l!706)) (bvsle (_1!10582 (h!29509 l!706)) key1!31)) ((_ is Cons!28300) l!706) (bvslt (_1!10582 (h!29509 l!706)) key1!31)))))

(declare-fun b!1265101 () Bool)

(assert (=> b!1265101 (= e!720437 (containsKey!641 (t!41825 l!706) key1!31))))

(assert (= (and d!138843 (not res!842433)) b!1265100))

(assert (= (and b!1265100 res!842434) b!1265101))

(assert (=> b!1265101 m!1165435))

(assert (=> b!1265060 d!138843))

(declare-fun d!138853 () Bool)

(declare-fun res!842445 () Bool)

(declare-fun e!720448 () Bool)

(assert (=> d!138853 (=> res!842445 e!720448)))

(assert (=> d!138853 (= res!842445 (or ((_ is Nil!28301) l!706) ((_ is Nil!28301) (t!41825 l!706))))))

(assert (=> d!138853 (= (isStrictlySorted!782 l!706) e!720448)))

(declare-fun b!1265112 () Bool)

(declare-fun e!720449 () Bool)

(assert (=> b!1265112 (= e!720448 e!720449)))

(declare-fun res!842446 () Bool)

(assert (=> b!1265112 (=> (not res!842446) (not e!720449))))

(assert (=> b!1265112 (= res!842446 (bvslt (_1!10582 (h!29509 l!706)) (_1!10582 (h!29509 (t!41825 l!706)))))))

(declare-fun b!1265113 () Bool)

(assert (=> b!1265113 (= e!720449 (isStrictlySorted!782 (t!41825 l!706)))))

(assert (= (and d!138853 (not res!842445)) b!1265112))

(assert (= (and b!1265112 res!842446) b!1265113))

(assert (=> b!1265113 m!1165431))

(assert (=> start!106356 d!138853))

(declare-fun d!138857 () Bool)

(declare-fun res!842447 () Bool)

(declare-fun e!720450 () Bool)

(assert (=> d!138857 (=> res!842447 e!720450)))

(assert (=> d!138857 (= res!842447 (and ((_ is Cons!28300) (t!41825 l!706)) (= (_1!10582 (h!29509 (t!41825 l!706))) key1!31)))))

(assert (=> d!138857 (= (containsKey!641 (t!41825 l!706) key1!31) e!720450)))

(declare-fun b!1265114 () Bool)

(declare-fun e!720451 () Bool)

(assert (=> b!1265114 (= e!720450 e!720451)))

(declare-fun res!842448 () Bool)

(assert (=> b!1265114 (=> (not res!842448) (not e!720451))))

(assert (=> b!1265114 (= res!842448 (and (or (not ((_ is Cons!28300) (t!41825 l!706))) (bvsle (_1!10582 (h!29509 (t!41825 l!706))) key1!31)) ((_ is Cons!28300) (t!41825 l!706)) (bvslt (_1!10582 (h!29509 (t!41825 l!706))) key1!31)))))

(declare-fun b!1265115 () Bool)

(assert (=> b!1265115 (= e!720451 (containsKey!641 (t!41825 (t!41825 l!706)) key1!31))))

(assert (= (and d!138857 (not res!842447)) b!1265114))

(assert (= (and b!1265114 res!842448) b!1265115))

(declare-fun m!1165471 () Bool)

(assert (=> b!1265115 m!1165471))

(assert (=> b!1265064 d!138857))

(declare-fun d!138859 () Bool)

(declare-fun res!842451 () Bool)

(declare-fun e!720454 () Bool)

(assert (=> d!138859 (=> res!842451 e!720454)))

(assert (=> d!138859 (= res!842451 (or ((_ is Nil!28301) (t!41825 l!706)) ((_ is Nil!28301) (t!41825 (t!41825 l!706)))))))

(assert (=> d!138859 (= (isStrictlySorted!782 (t!41825 l!706)) e!720454)))

(declare-fun b!1265118 () Bool)

(declare-fun e!720455 () Bool)

(assert (=> b!1265118 (= e!720454 e!720455)))

(declare-fun res!842452 () Bool)

(assert (=> b!1265118 (=> (not res!842452) (not e!720455))))

(assert (=> b!1265118 (= res!842452 (bvslt (_1!10582 (h!29509 (t!41825 l!706))) (_1!10582 (h!29509 (t!41825 (t!41825 l!706))))))))

(declare-fun b!1265119 () Bool)

(assert (=> b!1265119 (= e!720455 (isStrictlySorted!782 (t!41825 (t!41825 l!706))))))

(assert (= (and d!138859 (not res!842451)) b!1265118))

(assert (= (and b!1265118 res!842452) b!1265119))

(declare-fun m!1165475 () Bool)

(assert (=> b!1265119 m!1165475))

(assert (=> b!1265063 d!138859))

(declare-fun b!1265160 () Bool)

(declare-fun e!720482 () List!28304)

(assert (=> b!1265160 (= e!720482 Nil!28301)))

(declare-fun d!138863 () Bool)

(declare-fun e!720481 () Bool)

(assert (=> d!138863 e!720481))

(declare-fun res!842461 () Bool)

(assert (=> d!138863 (=> (not res!842461) (not e!720481))))

(declare-fun lt!574020 () List!28304)

(assert (=> d!138863 (= res!842461 (isStrictlySorted!782 lt!574020))))

(declare-fun e!720480 () List!28304)

(assert (=> d!138863 (= lt!574020 e!720480)))

(declare-fun c!123235 () Bool)

(assert (=> d!138863 (= c!123235 (and ((_ is Cons!28300) (insertStrictlySorted!460 (t!41825 l!706) key1!31 v1!26)) (= (_1!10582 (h!29509 (insertStrictlySorted!460 (t!41825 l!706) key1!31 v1!26))) key1!31)))))

(assert (=> d!138863 (isStrictlySorted!782 (insertStrictlySorted!460 (t!41825 l!706) key1!31 v1!26))))

(assert (=> d!138863 (= (removeStrictlySorted!153 (insertStrictlySorted!460 (t!41825 l!706) key1!31 v1!26) key1!31) lt!574020)))

(declare-fun b!1265161 () Bool)

(assert (=> b!1265161 (= e!720480 (t!41825 (insertStrictlySorted!460 (t!41825 l!706) key1!31 v1!26)))))

(declare-fun b!1265162 () Bool)

(assert (=> b!1265162 (= e!720480 e!720482)))

(declare-fun c!123234 () Bool)

(assert (=> b!1265162 (= c!123234 (and ((_ is Cons!28300) (insertStrictlySorted!460 (t!41825 l!706) key1!31 v1!26)) (not (= (_1!10582 (h!29509 (insertStrictlySorted!460 (t!41825 l!706) key1!31 v1!26))) key1!31))))))

(declare-fun b!1265163 () Bool)

(assert (=> b!1265163 (= e!720481 (not (containsKey!641 lt!574020 key1!31)))))

(declare-fun b!1265164 () Bool)

(declare-fun $colon$colon!637 (List!28304 tuple2!21142) List!28304)

(assert (=> b!1265164 (= e!720482 ($colon$colon!637 (removeStrictlySorted!153 (t!41825 (insertStrictlySorted!460 (t!41825 l!706) key1!31 v1!26)) key1!31) (h!29509 (insertStrictlySorted!460 (t!41825 l!706) key1!31 v1!26))))))

(assert (= (and d!138863 c!123235) b!1265161))

(assert (= (and d!138863 (not c!123235)) b!1265162))

(assert (= (and b!1265162 c!123234) b!1265164))

(assert (= (and b!1265162 (not c!123234)) b!1265160))

(assert (= (and d!138863 res!842461) b!1265163))

(declare-fun m!1165493 () Bool)

(assert (=> d!138863 m!1165493))

(assert (=> d!138863 m!1165443))

(declare-fun m!1165497 () Bool)

(assert (=> d!138863 m!1165497))

(declare-fun m!1165500 () Bool)

(assert (=> b!1265163 m!1165500))

(declare-fun m!1165503 () Bool)

(assert (=> b!1265164 m!1165503))

(assert (=> b!1265164 m!1165503))

(declare-fun m!1165505 () Bool)

(assert (=> b!1265164 m!1165505))

(assert (=> b!1265061 d!138863))

(declare-fun c!123271 () Bool)

(declare-fun call!62386 () List!28304)

(declare-fun e!720525 () List!28304)

(declare-fun bm!62381 () Bool)

(assert (=> bm!62381 (= call!62386 ($colon$colon!637 e!720525 (ite c!123271 (h!29509 l!706) (tuple2!21143 key1!31 v1!26))))))

(declare-fun c!123270 () Bool)

(assert (=> bm!62381 (= c!123270 c!123271)))

(declare-fun d!138869 () Bool)

(declare-fun e!720524 () Bool)

(assert (=> d!138869 e!720524))

(declare-fun res!842479 () Bool)

(assert (=> d!138869 (=> (not res!842479) (not e!720524))))

(declare-fun lt!574031 () List!28304)

(assert (=> d!138869 (= res!842479 (isStrictlySorted!782 lt!574031))))

(declare-fun e!720523 () List!28304)

(assert (=> d!138869 (= lt!574031 e!720523)))

(assert (=> d!138869 (= c!123271 (and ((_ is Cons!28300) l!706) (bvslt (_1!10582 (h!29509 l!706)) key1!31)))))

(assert (=> d!138869 (isStrictlySorted!782 l!706)))

(assert (=> d!138869 (= (insertStrictlySorted!460 l!706 key1!31 v1!26) lt!574031)))

(declare-fun b!1265245 () Bool)

(assert (=> b!1265245 (= e!720525 (insertStrictlySorted!460 (t!41825 l!706) key1!31 v1!26))))

(declare-fun b!1265246 () Bool)

(declare-fun e!720527 () List!28304)

(declare-fun call!62384 () List!28304)

(assert (=> b!1265246 (= e!720527 call!62384)))

(declare-fun b!1265247 () Bool)

(declare-fun contains!7635 (List!28304 tuple2!21142) Bool)

(assert (=> b!1265247 (= e!720524 (contains!7635 lt!574031 (tuple2!21143 key1!31 v1!26)))))

(declare-fun b!1265248 () Bool)

(declare-fun e!720526 () List!28304)

(declare-fun call!62385 () List!28304)

(assert (=> b!1265248 (= e!720526 call!62385)))

(declare-fun bm!62382 () Bool)

(assert (=> bm!62382 (= call!62384 call!62385)))

(declare-fun b!1265249 () Bool)

(assert (=> b!1265249 (= e!720523 call!62386)))

(declare-fun b!1265250 () Bool)

(assert (=> b!1265250 (= e!720527 call!62384)))

(declare-fun bm!62383 () Bool)

(assert (=> bm!62383 (= call!62385 call!62386)))

(declare-fun b!1265251 () Bool)

(declare-fun c!123269 () Bool)

(assert (=> b!1265251 (= c!123269 (and ((_ is Cons!28300) l!706) (bvsgt (_1!10582 (h!29509 l!706)) key1!31)))))

(assert (=> b!1265251 (= e!720526 e!720527)))

(declare-fun b!1265252 () Bool)

(assert (=> b!1265252 (= e!720523 e!720526)))

(declare-fun c!123268 () Bool)

(assert (=> b!1265252 (= c!123268 (and ((_ is Cons!28300) l!706) (= (_1!10582 (h!29509 l!706)) key1!31)))))

(declare-fun b!1265253 () Bool)

(assert (=> b!1265253 (= e!720525 (ite c!123268 (t!41825 l!706) (ite c!123269 (Cons!28300 (h!29509 l!706) (t!41825 l!706)) Nil!28301)))))

(declare-fun b!1265254 () Bool)

(declare-fun res!842478 () Bool)

(assert (=> b!1265254 (=> (not res!842478) (not e!720524))))

(assert (=> b!1265254 (= res!842478 (containsKey!641 lt!574031 key1!31))))

(assert (= (and d!138869 c!123271) b!1265249))

(assert (= (and d!138869 (not c!123271)) b!1265252))

(assert (= (and b!1265252 c!123268) b!1265248))

(assert (= (and b!1265252 (not c!123268)) b!1265251))

(assert (= (and b!1265251 c!123269) b!1265250))

(assert (= (and b!1265251 (not c!123269)) b!1265246))

(assert (= (or b!1265250 b!1265246) bm!62382))

(assert (= (or b!1265248 bm!62382) bm!62383))

(assert (= (or b!1265249 bm!62383) bm!62381))

(assert (= (and bm!62381 c!123270) b!1265245))

(assert (= (and bm!62381 (not c!123270)) b!1265253))

(assert (= (and d!138869 res!842479) b!1265254))

(assert (= (and b!1265254 res!842478) b!1265247))

(declare-fun m!1165521 () Bool)

(assert (=> b!1265254 m!1165521))

(declare-fun m!1165525 () Bool)

(assert (=> b!1265247 m!1165525))

(assert (=> b!1265245 m!1165443))

(declare-fun m!1165529 () Bool)

(assert (=> d!138869 m!1165529))

(assert (=> d!138869 m!1165437))

(declare-fun m!1165531 () Bool)

(assert (=> bm!62381 m!1165531))

(assert (=> b!1265061 d!138869))

(declare-fun d!138877 () Bool)

(assert (=> d!138877 (= (removeStrictlySorted!153 (insertStrictlySorted!460 (t!41825 l!706) key1!31 v1!26) key1!31) (t!41825 l!706))))

(declare-fun lt!574039 () Unit!42179)

(declare-fun choose!1885 (List!28304 (_ BitVec 64) B!1954) Unit!42179)

(assert (=> d!138877 (= lt!574039 (choose!1885 (t!41825 l!706) key1!31 v1!26))))

(assert (=> d!138877 (isStrictlySorted!782 (t!41825 l!706))))

(assert (=> d!138877 (= (lemmaInsertStrictlySortedThenRemoveIsSame!8 (t!41825 l!706) key1!31 v1!26) lt!574039)))

(declare-fun bs!35812 () Bool)

(assert (= bs!35812 d!138877))

(assert (=> bs!35812 m!1165443))

(assert (=> bs!35812 m!1165443))

(assert (=> bs!35812 m!1165447))

(declare-fun m!1165547 () Bool)

(assert (=> bs!35812 m!1165547))

(assert (=> bs!35812 m!1165431))

(assert (=> b!1265061 d!138877))

(declare-fun c!123283 () Bool)

(declare-fun bm!62390 () Bool)

(declare-fun call!62395 () List!28304)

(declare-fun e!720546 () List!28304)

(assert (=> bm!62390 (= call!62395 ($colon$colon!637 e!720546 (ite c!123283 (h!29509 (t!41825 l!706)) (tuple2!21143 key1!31 v1!26))))))

(declare-fun c!123282 () Bool)

(assert (=> bm!62390 (= c!123282 c!123283)))

(declare-fun d!138885 () Bool)

(declare-fun e!720545 () Bool)

(assert (=> d!138885 e!720545))

(declare-fun res!842491 () Bool)

(assert (=> d!138885 (=> (not res!842491) (not e!720545))))

(declare-fun lt!574041 () List!28304)

(assert (=> d!138885 (= res!842491 (isStrictlySorted!782 lt!574041))))

(declare-fun e!720544 () List!28304)

(assert (=> d!138885 (= lt!574041 e!720544)))

(assert (=> d!138885 (= c!123283 (and ((_ is Cons!28300) (t!41825 l!706)) (bvslt (_1!10582 (h!29509 (t!41825 l!706))) key1!31)))))

(assert (=> d!138885 (isStrictlySorted!782 (t!41825 l!706))))

(assert (=> d!138885 (= (insertStrictlySorted!460 (t!41825 l!706) key1!31 v1!26) lt!574041)))

(declare-fun b!1265281 () Bool)

(assert (=> b!1265281 (= e!720546 (insertStrictlySorted!460 (t!41825 (t!41825 l!706)) key1!31 v1!26))))

(declare-fun b!1265282 () Bool)

(declare-fun e!720548 () List!28304)

(declare-fun call!62393 () List!28304)

(assert (=> b!1265282 (= e!720548 call!62393)))

(declare-fun b!1265283 () Bool)

(assert (=> b!1265283 (= e!720545 (contains!7635 lt!574041 (tuple2!21143 key1!31 v1!26)))))

(declare-fun b!1265284 () Bool)

(declare-fun e!720547 () List!28304)

(declare-fun call!62394 () List!28304)

(assert (=> b!1265284 (= e!720547 call!62394)))

(declare-fun bm!62391 () Bool)

(assert (=> bm!62391 (= call!62393 call!62394)))

(declare-fun b!1265285 () Bool)

(assert (=> b!1265285 (= e!720544 call!62395)))

(declare-fun b!1265286 () Bool)

(assert (=> b!1265286 (= e!720548 call!62393)))

(declare-fun bm!62392 () Bool)

(assert (=> bm!62392 (= call!62394 call!62395)))

(declare-fun b!1265287 () Bool)

(declare-fun c!123281 () Bool)

(assert (=> b!1265287 (= c!123281 (and ((_ is Cons!28300) (t!41825 l!706)) (bvsgt (_1!10582 (h!29509 (t!41825 l!706))) key1!31)))))

(assert (=> b!1265287 (= e!720547 e!720548)))

(declare-fun b!1265288 () Bool)

(assert (=> b!1265288 (= e!720544 e!720547)))

(declare-fun c!123280 () Bool)

(assert (=> b!1265288 (= c!123280 (and ((_ is Cons!28300) (t!41825 l!706)) (= (_1!10582 (h!29509 (t!41825 l!706))) key1!31)))))

(declare-fun b!1265289 () Bool)

(assert (=> b!1265289 (= e!720546 (ite c!123280 (t!41825 (t!41825 l!706)) (ite c!123281 (Cons!28300 (h!29509 (t!41825 l!706)) (t!41825 (t!41825 l!706))) Nil!28301)))))

(declare-fun b!1265290 () Bool)

(declare-fun res!842490 () Bool)

(assert (=> b!1265290 (=> (not res!842490) (not e!720545))))

(assert (=> b!1265290 (= res!842490 (containsKey!641 lt!574041 key1!31))))

(assert (= (and d!138885 c!123283) b!1265285))

(assert (= (and d!138885 (not c!123283)) b!1265288))

(assert (= (and b!1265288 c!123280) b!1265284))

(assert (= (and b!1265288 (not c!123280)) b!1265287))

(assert (= (and b!1265287 c!123281) b!1265286))

(assert (= (and b!1265287 (not c!123281)) b!1265282))

(assert (= (or b!1265286 b!1265282) bm!62391))

(assert (= (or b!1265284 bm!62391) bm!62392))

(assert (= (or b!1265285 bm!62392) bm!62390))

(assert (= (and bm!62390 c!123282) b!1265281))

(assert (= (and bm!62390 (not c!123282)) b!1265289))

(assert (= (and d!138885 res!842491) b!1265290))

(assert (= (and b!1265290 res!842490) b!1265283))

(declare-fun m!1165559 () Bool)

(assert (=> b!1265290 m!1165559))

(declare-fun m!1165561 () Bool)

(assert (=> b!1265283 m!1165561))

(declare-fun m!1165563 () Bool)

(assert (=> b!1265281 m!1165563))

(declare-fun m!1165565 () Bool)

(assert (=> d!138885 m!1165565))

(assert (=> d!138885 m!1165431))

(declare-fun m!1165567 () Bool)

(assert (=> bm!62390 m!1165567))

(assert (=> b!1265061 d!138885))

(declare-fun d!138891 () Bool)

(declare-fun res!842498 () Bool)

(declare-fun e!720555 () Bool)

(assert (=> d!138891 (=> res!842498 e!720555)))

(assert (=> d!138891 (= res!842498 (or ((_ is Nil!28301) (insertStrictlySorted!460 l!706 key1!31 v1!26)) ((_ is Nil!28301) (t!41825 (insertStrictlySorted!460 l!706 key1!31 v1!26)))))))

(assert (=> d!138891 (= (isStrictlySorted!782 (insertStrictlySorted!460 l!706 key1!31 v1!26)) e!720555)))

(declare-fun b!1265297 () Bool)

(declare-fun e!720556 () Bool)

(assert (=> b!1265297 (= e!720555 e!720556)))

(declare-fun res!842499 () Bool)

(assert (=> b!1265297 (=> (not res!842499) (not e!720556))))

(assert (=> b!1265297 (= res!842499 (bvslt (_1!10582 (h!29509 (insertStrictlySorted!460 l!706 key1!31 v1!26))) (_1!10582 (h!29509 (t!41825 (insertStrictlySorted!460 l!706 key1!31 v1!26))))))))

(declare-fun b!1265298 () Bool)

(assert (=> b!1265298 (= e!720556 (isStrictlySorted!782 (t!41825 (insertStrictlySorted!460 l!706 key1!31 v1!26))))))

(assert (= (and d!138891 (not res!842498)) b!1265297))

(assert (= (and b!1265297 res!842499) b!1265298))

(declare-fun m!1165571 () Bool)

(assert (=> b!1265298 m!1165571))

(assert (=> b!1265061 d!138891))

(declare-fun b!1265315 () Bool)

(declare-fun e!720567 () Bool)

(declare-fun tp!96306 () Bool)

(assert (=> b!1265315 (= e!720567 (and tp_is_empty!32487 tp!96306))))

(assert (=> b!1265065 (= tp!96296 e!720567)))

(assert (= (and b!1265065 ((_ is Cons!28300) (t!41825 l!706))) b!1265315))

(check-sat (not bm!62390) (not b!1265113) (not b!1265115) (not d!138877) (not b!1265245) (not b!1265247) (not b!1265298) (not b!1265315) (not b!1265101) (not b!1265119) (not b!1265290) (not bm!62381) (not b!1265254) (not b!1265283) (not d!138885) (not b!1265164) (not d!138863) tp_is_empty!32487 (not d!138869) (not b!1265163) (not b!1265281))
(check-sat)
