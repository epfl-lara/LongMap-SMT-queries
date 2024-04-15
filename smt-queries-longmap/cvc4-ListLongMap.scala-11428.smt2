; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133244 () Bool)

(assert start!133244)

(declare-fun b!1558569 () Bool)

(declare-datatypes ((B!2446 0))(
  ( (B!2447 (val!19309 Int)) )
))
(declare-datatypes ((tuple2!25066 0))(
  ( (tuple2!25067 (_1!12544 (_ BitVec 64)) (_2!12544 B!2446)) )
))
(declare-datatypes ((List!36388 0))(
  ( (Nil!36385) (Cons!36384 (h!37831 tuple2!25066) (t!51110 List!36388)) )
))
(declare-fun l!1292 () List!36388)

(declare-fun newValue!135 () B!2446)

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun newKey!135 () (_ BitVec 64))

(declare-fun e!868267 () Bool)

(declare-fun containsKey!844 (List!36388 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!575 (List!36388 (_ BitVec 64) B!2446) List!36388)

(assert (=> b!1558569 (= e!868267 (not (containsKey!844 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135) otherKey!62)))))

(declare-fun b!1558568 () Bool)

(declare-fun res!1066002 () Bool)

(assert (=> b!1558568 (=> (not res!1066002) (not e!868267))))

(assert (=> b!1558568 (= res!1066002 (and (not (= otherKey!62 newKey!135)) (or (not (is-Cons!36384 l!1292)) (= (_1!12544 (h!37831 l!1292)) otherKey!62))))))

(declare-fun res!1066001 () Bool)

(assert (=> start!133244 (=> (not res!1066001) (not e!868267))))

(declare-fun isStrictlySorted!982 (List!36388) Bool)

(assert (=> start!133244 (= res!1066001 (isStrictlySorted!982 l!1292))))

(assert (=> start!133244 e!868267))

(declare-fun e!868268 () Bool)

(assert (=> start!133244 e!868268))

(assert (=> start!133244 true))

(declare-fun tp_is_empty!38451 () Bool)

(assert (=> start!133244 tp_is_empty!38451))

(declare-fun b!1558570 () Bool)

(declare-fun tp!112681 () Bool)

(assert (=> b!1558570 (= e!868268 (and tp_is_empty!38451 tp!112681))))

(declare-fun b!1558567 () Bool)

(declare-fun res!1066003 () Bool)

(assert (=> b!1558567 (=> (not res!1066003) (not e!868267))))

(assert (=> b!1558567 (= res!1066003 (containsKey!844 l!1292 otherKey!62))))

(assert (= (and start!133244 res!1066001) b!1558567))

(assert (= (and b!1558567 res!1066003) b!1558568))

(assert (= (and b!1558568 res!1066002) b!1558569))

(assert (= (and start!133244 (is-Cons!36384 l!1292)) b!1558570))

(declare-fun m!1434463 () Bool)

(assert (=> b!1558569 m!1434463))

(assert (=> b!1558569 m!1434463))

(declare-fun m!1434465 () Bool)

(assert (=> b!1558569 m!1434465))

(declare-fun m!1434467 () Bool)

(assert (=> start!133244 m!1434467))

(declare-fun m!1434469 () Bool)

(assert (=> b!1558567 m!1434469))

(push 1)

(assert (not start!133244))

(assert (not b!1558570))

(assert (not b!1558569))

(assert (not b!1558567))

(assert tp_is_empty!38451)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162571 () Bool)

(declare-fun res!1066035 () Bool)

(declare-fun e!868297 () Bool)

(assert (=> d!162571 (=> res!1066035 e!868297)))

(assert (=> d!162571 (= res!1066035 (and (is-Cons!36384 l!1292) (= (_1!12544 (h!37831 l!1292)) otherKey!62)))))

(assert (=> d!162571 (= (containsKey!844 l!1292 otherKey!62) e!868297)))

(declare-fun b!1558605 () Bool)

(declare-fun e!868298 () Bool)

(assert (=> b!1558605 (= e!868297 e!868298)))

(declare-fun res!1066036 () Bool)

(assert (=> b!1558605 (=> (not res!1066036) (not e!868298))))

(assert (=> b!1558605 (= res!1066036 (and (or (not (is-Cons!36384 l!1292)) (bvsle (_1!12544 (h!37831 l!1292)) otherKey!62)) (is-Cons!36384 l!1292) (bvslt (_1!12544 (h!37831 l!1292)) otherKey!62)))))

(declare-fun b!1558606 () Bool)

(assert (=> b!1558606 (= e!868298 (containsKey!844 (t!51110 l!1292) otherKey!62))))

(assert (= (and d!162571 (not res!1066035)) b!1558605))

(assert (= (and b!1558605 res!1066036) b!1558606))

(declare-fun m!1434485 () Bool)

(assert (=> b!1558606 m!1434485))

(assert (=> b!1558567 d!162571))

(declare-fun d!162577 () Bool)

(declare-fun res!1066041 () Bool)

(declare-fun e!868303 () Bool)

(assert (=> d!162577 (=> res!1066041 e!868303)))

(assert (=> d!162577 (= res!1066041 (or (is-Nil!36385 l!1292) (is-Nil!36385 (t!51110 l!1292))))))

(assert (=> d!162577 (= (isStrictlySorted!982 l!1292) e!868303)))

(declare-fun b!1558611 () Bool)

(declare-fun e!868304 () Bool)

(assert (=> b!1558611 (= e!868303 e!868304)))

(declare-fun res!1066042 () Bool)

(assert (=> b!1558611 (=> (not res!1066042) (not e!868304))))

(assert (=> b!1558611 (= res!1066042 (bvslt (_1!12544 (h!37831 l!1292)) (_1!12544 (h!37831 (t!51110 l!1292)))))))

(declare-fun b!1558612 () Bool)

(assert (=> b!1558612 (= e!868304 (isStrictlySorted!982 (t!51110 l!1292)))))

(assert (= (and d!162577 (not res!1066041)) b!1558611))

(assert (= (and b!1558611 res!1066042) b!1558612))

(declare-fun m!1434487 () Bool)

(assert (=> b!1558612 m!1434487))

(assert (=> start!133244 d!162577))

(declare-fun d!162579 () Bool)

(declare-fun res!1066043 () Bool)

(declare-fun e!868305 () Bool)

(assert (=> d!162579 (=> res!1066043 e!868305)))

(assert (=> d!162579 (= res!1066043 (and (is-Cons!36384 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135)) (= (_1!12544 (h!37831 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135))) otherKey!62)))))

(assert (=> d!162579 (= (containsKey!844 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135) otherKey!62) e!868305)))

(declare-fun b!1558613 () Bool)

(declare-fun e!868306 () Bool)

(assert (=> b!1558613 (= e!868305 e!868306)))

(declare-fun res!1066044 () Bool)

(assert (=> b!1558613 (=> (not res!1066044) (not e!868306))))

(assert (=> b!1558613 (= res!1066044 (and (or (not (is-Cons!36384 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135))) (bvsle (_1!12544 (h!37831 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135))) otherKey!62)) (is-Cons!36384 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135)) (bvslt (_1!12544 (h!37831 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135))) otherKey!62)))))

(declare-fun b!1558614 () Bool)

(assert (=> b!1558614 (= e!868306 (containsKey!844 (t!51110 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135)) otherKey!62))))

(assert (= (and d!162579 (not res!1066043)) b!1558613))

(assert (= (and b!1558613 res!1066044) b!1558614))

(declare-fun m!1434489 () Bool)

(assert (=> b!1558614 m!1434489))

(assert (=> b!1558569 d!162579))

(declare-fun b!1558708 () Bool)

(declare-fun e!868361 () Bool)

(declare-fun lt!670552 () List!36388)

(declare-fun contains!10175 (List!36388 tuple2!25066) Bool)

(assert (=> b!1558708 (= e!868361 (contains!10175 lt!670552 (tuple2!25067 newKey!135 newValue!135)))))

(declare-fun b!1558709 () Bool)

(declare-fun c!144108 () Bool)

(declare-fun e!868359 () List!36388)

(declare-fun c!144109 () Bool)

(assert (=> b!1558709 (= e!868359 (ite c!144108 (t!51110 l!1292) (ite c!144109 (Cons!36384 (h!37831 l!1292) (t!51110 l!1292)) Nil!36385)))))

(declare-fun call!71788 () List!36388)

(declare-fun bm!71783 () Bool)

(declare-fun c!144110 () Bool)

(declare-fun $colon$colon!988 (List!36388 tuple2!25066) List!36388)

(assert (=> bm!71783 (= call!71788 ($colon$colon!988 e!868359 (ite c!144110 (h!37831 l!1292) (tuple2!25067 newKey!135 newValue!135))))))

(declare-fun c!144111 () Bool)

(assert (=> bm!71783 (= c!144111 c!144110)))

(declare-fun b!1558710 () Bool)

(declare-fun e!868358 () List!36388)

(declare-fun call!71787 () List!36388)

(assert (=> b!1558710 (= e!868358 call!71787)))

(declare-fun b!1558711 () Bool)

(assert (=> b!1558711 (= e!868359 (insertStrictlySorted!575 (t!51110 l!1292) newKey!135 newValue!135))))

(declare-fun bm!71784 () Bool)

(declare-fun call!71786 () List!36388)

(assert (=> bm!71784 (= call!71786 call!71788)))

(declare-fun b!1558712 () Bool)

(declare-fun e!868362 () List!36388)

(declare-fun e!868360 () List!36388)

(assert (=> b!1558712 (= e!868362 e!868360)))

(assert (=> b!1558712 (= c!144108 (and (is-Cons!36384 l!1292) (= (_1!12544 (h!37831 l!1292)) newKey!135)))))

(declare-fun b!1558713 () Bool)

(assert (=> b!1558713 (= e!868362 call!71788)))

(declare-fun b!1558714 () Bool)

(assert (=> b!1558714 (= e!868360 call!71786)))

(declare-fun b!1558715 () Bool)

(assert (=> b!1558715 (= c!144109 (and (is-Cons!36384 l!1292) (bvsgt (_1!12544 (h!37831 l!1292)) newKey!135)))))

(assert (=> b!1558715 (= e!868360 e!868358)))

(declare-fun d!162581 () Bool)

(assert (=> d!162581 e!868361))

(declare-fun res!1066069 () Bool)

(assert (=> d!162581 (=> (not res!1066069) (not e!868361))))

(assert (=> d!162581 (= res!1066069 (isStrictlySorted!982 lt!670552))))

(assert (=> d!162581 (= lt!670552 e!868362)))

(assert (=> d!162581 (= c!144110 (and (is-Cons!36384 l!1292) (bvslt (_1!12544 (h!37831 l!1292)) newKey!135)))))

(assert (=> d!162581 (isStrictlySorted!982 l!1292)))

(assert (=> d!162581 (= (insertStrictlySorted!575 l!1292 newKey!135 newValue!135) lt!670552)))

(declare-fun b!1558716 () Bool)

(declare-fun res!1066070 () Bool)

(assert (=> b!1558716 (=> (not res!1066070) (not e!868361))))

(assert (=> b!1558716 (= res!1066070 (containsKey!844 lt!670552 newKey!135))))

(declare-fun b!1558717 () Bool)

(assert (=> b!1558717 (= e!868358 call!71787)))

(declare-fun bm!71785 () Bool)

(assert (=> bm!71785 (= call!71787 call!71786)))

(assert (= (and d!162581 c!144110) b!1558713))

(assert (= (and d!162581 (not c!144110)) b!1558712))

(assert (= (and b!1558712 c!144108) b!1558714))

(assert (= (and b!1558712 (not c!144108)) b!1558715))

(assert (= (and b!1558715 c!144109) b!1558717))

(assert (= (and b!1558715 (not c!144109)) b!1558710))

(assert (= (or b!1558717 b!1558710) bm!71785))

(assert (= (or b!1558714 bm!71785) bm!71784))

(assert (= (or b!1558713 bm!71784) bm!71783))

(assert (= (and bm!71783 c!144111) b!1558711))

(assert (= (and bm!71783 (not c!144111)) b!1558709))

(assert (= (and d!162581 res!1066069) b!1558716))

(assert (= (and b!1558716 res!1066070) b!1558708))

(declare-fun m!1434515 () Bool)

(assert (=> bm!71783 m!1434515))

(declare-fun m!1434517 () Bool)

(assert (=> b!1558711 m!1434517))

(declare-fun m!1434519 () Bool)

(assert (=> b!1558708 m!1434519))

(declare-fun m!1434521 () Bool)

(assert (=> b!1558716 m!1434521))

(declare-fun m!1434523 () Bool)

(assert (=> d!162581 m!1434523))

(assert (=> d!162581 m!1434467))

(assert (=> b!1558569 d!162581))

(declare-fun b!1558728 () Bool)

(declare-fun e!868369 () Bool)

(declare-fun tp!112692 () Bool)

(assert (=> b!1558728 (= e!868369 (and tp_is_empty!38451 tp!112692))))

(assert (=> b!1558570 (= tp!112681 e!868369)))

(assert (= (and b!1558570 (is-Cons!36384 (t!51110 l!1292))) b!1558728))

(push 1)

(assert (not b!1558728))

(assert (not b!1558708))

(assert (not b!1558614))

(assert (not b!1558711))

(assert (not d!162581))

(assert tp_is_empty!38451)

(assert (not bm!71783))

(assert (not b!1558606))

(assert (not b!1558612))

(assert (not b!1558716))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162621 () Bool)

(declare-fun res!1066109 () Bool)

(declare-fun e!868415 () Bool)

(assert (=> d!162621 (=> res!1066109 e!868415)))

(assert (=> d!162621 (= res!1066109 (or (is-Nil!36385 (t!51110 l!1292)) (is-Nil!36385 (t!51110 (t!51110 l!1292)))))))

(assert (=> d!162621 (= (isStrictlySorted!982 (t!51110 l!1292)) e!868415)))

(declare-fun b!1558784 () Bool)

(declare-fun e!868416 () Bool)

(assert (=> b!1558784 (= e!868415 e!868416)))

(declare-fun res!1066110 () Bool)

(assert (=> b!1558784 (=> (not res!1066110) (not e!868416))))

(assert (=> b!1558784 (= res!1066110 (bvslt (_1!12544 (h!37831 (t!51110 l!1292))) (_1!12544 (h!37831 (t!51110 (t!51110 l!1292))))))))

(declare-fun b!1558785 () Bool)

(assert (=> b!1558785 (= e!868416 (isStrictlySorted!982 (t!51110 (t!51110 l!1292))))))

(assert (= (and d!162621 (not res!1066109)) b!1558784))

(assert (= (and b!1558784 res!1066110) b!1558785))

(declare-fun m!1434579 () Bool)

(assert (=> b!1558785 m!1434579))

(assert (=> b!1558612 d!162621))

(declare-fun d!162623 () Bool)

(declare-fun lt!670563 () Bool)

(declare-fun content!795 (List!36388) (Set tuple2!25066))

(assert (=> d!162623 (= lt!670563 (member (tuple2!25067 newKey!135 newValue!135) (content!795 lt!670552)))))

(declare-fun e!868421 () Bool)

(assert (=> d!162623 (= lt!670563 e!868421)))

(declare-fun res!1066116 () Bool)

(assert (=> d!162623 (=> (not res!1066116) (not e!868421))))

(assert (=> d!162623 (= res!1066116 (is-Cons!36384 lt!670552))))

(assert (=> d!162623 (= (contains!10175 lt!670552 (tuple2!25067 newKey!135 newValue!135)) lt!670563)))

(declare-fun b!1558790 () Bool)

(declare-fun e!868422 () Bool)

(assert (=> b!1558790 (= e!868421 e!868422)))

(declare-fun res!1066115 () Bool)

(assert (=> b!1558790 (=> res!1066115 e!868422)))

(assert (=> b!1558790 (= res!1066115 (= (h!37831 lt!670552) (tuple2!25067 newKey!135 newValue!135)))))

(declare-fun b!1558791 () Bool)

(assert (=> b!1558791 (= e!868422 (contains!10175 (t!51110 lt!670552) (tuple2!25067 newKey!135 newValue!135)))))

(assert (= (and d!162623 res!1066116) b!1558790))

(assert (= (and b!1558790 (not res!1066115)) b!1558791))

(declare-fun m!1434581 () Bool)

(assert (=> d!162623 m!1434581))

(declare-fun m!1434583 () Bool)

(assert (=> d!162623 m!1434583))

(declare-fun m!1434585 () Bool)

(assert (=> b!1558791 m!1434585))

(assert (=> b!1558708 d!162623))

(declare-fun d!162625 () Bool)

(declare-fun res!1066117 () Bool)

(declare-fun e!868423 () Bool)

(assert (=> d!162625 (=> res!1066117 e!868423)))

(assert (=> d!162625 (= res!1066117 (and (is-Cons!36384 (t!51110 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135))) (= (_1!12544 (h!37831 (t!51110 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135)))) otherKey!62)))))

(assert (=> d!162625 (= (containsKey!844 (t!51110 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135)) otherKey!62) e!868423)))

(declare-fun b!1558792 () Bool)

(declare-fun e!868424 () Bool)

(assert (=> b!1558792 (= e!868423 e!868424)))

(declare-fun res!1066118 () Bool)

(assert (=> b!1558792 (=> (not res!1066118) (not e!868424))))

(assert (=> b!1558792 (= res!1066118 (and (or (not (is-Cons!36384 (t!51110 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135)))) (bvsle (_1!12544 (h!37831 (t!51110 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135)))) otherKey!62)) (is-Cons!36384 (t!51110 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135))) (bvslt (_1!12544 (h!37831 (t!51110 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135)))) otherKey!62)))))

(declare-fun b!1558793 () Bool)

(assert (=> b!1558793 (= e!868424 (containsKey!844 (t!51110 (t!51110 (insertStrictlySorted!575 l!1292 newKey!135 newValue!135))) otherKey!62))))

(assert (= (and d!162625 (not res!1066117)) b!1558792))

(assert (= (and b!1558792 res!1066118) b!1558793))

(declare-fun m!1434587 () Bool)

(assert (=> b!1558793 m!1434587))

(assert (=> b!1558614 d!162625))

(declare-fun d!162627 () Bool)

(declare-fun res!1066119 () Bool)

(declare-fun e!868425 () Bool)

(assert (=> d!162627 (=> res!1066119 e!868425)))

(assert (=> d!162627 (= res!1066119 (and (is-Cons!36384 lt!670552) (= (_1!12544 (h!37831 lt!670552)) newKey!135)))))

(assert (=> d!162627 (= (containsKey!844 lt!670552 newKey!135) e!868425)))

(declare-fun b!1558794 () Bool)

(declare-fun e!868426 () Bool)

(assert (=> b!1558794 (= e!868425 e!868426)))

(declare-fun res!1066120 () Bool)

(assert (=> b!1558794 (=> (not res!1066120) (not e!868426))))

(assert (=> b!1558794 (= res!1066120 (and (or (not (is-Cons!36384 lt!670552)) (bvsle (_1!12544 (h!37831 lt!670552)) newKey!135)) (is-Cons!36384 lt!670552) (bvslt (_1!12544 (h!37831 lt!670552)) newKey!135)))))

(declare-fun b!1558795 () Bool)

(assert (=> b!1558795 (= e!868426 (containsKey!844 (t!51110 lt!670552) newKey!135))))

(assert (= (and d!162627 (not res!1066119)) b!1558794))

(assert (= (and b!1558794 res!1066120) b!1558795))

(declare-fun m!1434589 () Bool)

(assert (=> b!1558795 m!1434589))

(assert (=> b!1558716 d!162627))

(declare-fun b!1558796 () Bool)

(declare-fun e!868430 () Bool)

(declare-fun lt!670564 () List!36388)

(assert (=> b!1558796 (= e!868430 (contains!10175 lt!670564 (tuple2!25067 newKey!135 newValue!135)))))

(declare-fun c!144120 () Bool)

(declare-fun c!144121 () Bool)

(declare-fun e!868428 () List!36388)

(declare-fun b!1558797 () Bool)

(assert (=> b!1558797 (= e!868428 (ite c!144120 (t!51110 (t!51110 l!1292)) (ite c!144121 (Cons!36384 (h!37831 (t!51110 l!1292)) (t!51110 (t!51110 l!1292))) Nil!36385)))))

(declare-fun call!71797 () List!36388)

(declare-fun c!144122 () Bool)

(declare-fun bm!71792 () Bool)

(assert (=> bm!71792 (= call!71797 ($colon$colon!988 e!868428 (ite c!144122 (h!37831 (t!51110 l!1292)) (tuple2!25067 newKey!135 newValue!135))))))

(declare-fun c!144123 () Bool)

(assert (=> bm!71792 (= c!144123 c!144122)))

(declare-fun b!1558798 () Bool)

(declare-fun e!868427 () List!36388)

(declare-fun call!71796 () List!36388)

(assert (=> b!1558798 (= e!868427 call!71796)))

(declare-fun b!1558799 () Bool)

(assert (=> b!1558799 (= e!868428 (insertStrictlySorted!575 (t!51110 (t!51110 l!1292)) newKey!135 newValue!135))))

(declare-fun bm!71793 () Bool)

(declare-fun call!71795 () List!36388)

(assert (=> bm!71793 (= call!71795 call!71797)))

(declare-fun b!1558800 () Bool)

(declare-fun e!868431 () List!36388)

(declare-fun e!868429 () List!36388)

(assert (=> b!1558800 (= e!868431 e!868429)))

(assert (=> b!1558800 (= c!144120 (and (is-Cons!36384 (t!51110 l!1292)) (= (_1!12544 (h!37831 (t!51110 l!1292))) newKey!135)))))

(declare-fun b!1558801 () Bool)

(assert (=> b!1558801 (= e!868431 call!71797)))

(declare-fun b!1558802 () Bool)

(assert (=> b!1558802 (= e!868429 call!71795)))

(declare-fun b!1558803 () Bool)

(assert (=> b!1558803 (= c!144121 (and (is-Cons!36384 (t!51110 l!1292)) (bvsgt (_1!12544 (h!37831 (t!51110 l!1292))) newKey!135)))))

(assert (=> b!1558803 (= e!868429 e!868427)))

(declare-fun d!162629 () Bool)

(assert (=> d!162629 e!868430))

(declare-fun res!1066121 () Bool)

(assert (=> d!162629 (=> (not res!1066121) (not e!868430))))

(assert (=> d!162629 (= res!1066121 (isStrictlySorted!982 lt!670564))))

(assert (=> d!162629 (= lt!670564 e!868431)))

(assert (=> d!162629 (= c!144122 (and (is-Cons!36384 (t!51110 l!1292)) (bvslt (_1!12544 (h!37831 (t!51110 l!1292))) newKey!135)))))

(assert (=> d!162629 (isStrictlySorted!982 (t!51110 l!1292))))

(assert (=> d!162629 (= (insertStrictlySorted!575 (t!51110 l!1292) newKey!135 newValue!135) lt!670564)))

(declare-fun b!1558804 () Bool)

(declare-fun res!1066122 () Bool)

(assert (=> b!1558804 (=> (not res!1066122) (not e!868430))))

(assert (=> b!1558804 (= res!1066122 (containsKey!844 lt!670564 newKey!135))))

(declare-fun b!1558805 () Bool)

(assert (=> b!1558805 (= e!868427 call!71796)))

(declare-fun bm!71794 () Bool)

(assert (=> bm!71794 (= call!71796 call!71795)))

(assert (= (and d!162629 c!144122) b!1558801))

(assert (= (and d!162629 (not c!144122)) b!1558800))

(assert (= (and b!1558800 c!144120) b!1558802))

(assert (= (and b!1558800 (not c!144120)) b!1558803))

(assert (= (and b!1558803 c!144121) b!1558805))

(assert (= (and b!1558803 (not c!144121)) b!1558798))

(assert (= (or b!1558805 b!1558798) bm!71794))

(assert (= (or b!1558802 bm!71794) bm!71793))

(assert (= (or b!1558801 bm!71793) bm!71792))

(assert (= (and bm!71792 c!144123) b!1558799))

(assert (= (and bm!71792 (not c!144123)) b!1558797))

(assert (= (and d!162629 res!1066121) b!1558804))

(assert (= (and b!1558804 res!1066122) b!1558796))

(declare-fun m!1434591 () Bool)

(assert (=> bm!71792 m!1434591))

(declare-fun m!1434593 () Bool)

(assert (=> b!1558799 m!1434593))

(declare-fun m!1434595 () Bool)

(assert (=> b!1558796 m!1434595))

(declare-fun m!1434597 () Bool)

(assert (=> b!1558804 m!1434597))

(declare-fun m!1434599 () Bool)

(assert (=> d!162629 m!1434599))

(assert (=> d!162629 m!1434487))

(assert (=> b!1558711 d!162629))

(declare-fun d!162631 () Bool)

(declare-fun res!1066123 () Bool)

(declare-fun e!868432 () Bool)

(assert (=> d!162631 (=> res!1066123 e!868432)))

(assert (=> d!162631 (= res!1066123 (or (is-Nil!36385 lt!670552) (is-Nil!36385 (t!51110 lt!670552))))))

(assert (=> d!162631 (= (isStrictlySorted!982 lt!670552) e!868432)))

(declare-fun b!1558806 () Bool)

(declare-fun e!868433 () Bool)

(assert (=> b!1558806 (= e!868432 e!868433)))

(declare-fun res!1066124 () Bool)

(assert (=> b!1558806 (=> (not res!1066124) (not e!868433))))

(assert (=> b!1558806 (= res!1066124 (bvslt (_1!12544 (h!37831 lt!670552)) (_1!12544 (h!37831 (t!51110 lt!670552)))))))

(declare-fun b!1558807 () Bool)

(assert (=> b!1558807 (= e!868433 (isStrictlySorted!982 (t!51110 lt!670552)))))

(assert (= (and d!162631 (not res!1066123)) b!1558806))

(assert (= (and b!1558806 res!1066124) b!1558807))

(declare-fun m!1434601 () Bool)

(assert (=> b!1558807 m!1434601))

(assert (=> d!162581 d!162631))

(assert (=> d!162581 d!162577))

(declare-fun d!162633 () Bool)

(declare-fun res!1066125 () Bool)

(declare-fun e!868434 () Bool)

(assert (=> d!162633 (=> res!1066125 e!868434)))

(assert (=> d!162633 (= res!1066125 (and (is-Cons!36384 (t!51110 l!1292)) (= (_1!12544 (h!37831 (t!51110 l!1292))) otherKey!62)))))

(assert (=> d!162633 (= (containsKey!844 (t!51110 l!1292) otherKey!62) e!868434)))

(declare-fun b!1558808 () Bool)

(declare-fun e!868435 () Bool)

(assert (=> b!1558808 (= e!868434 e!868435)))

(declare-fun res!1066126 () Bool)

(assert (=> b!1558808 (=> (not res!1066126) (not e!868435))))

(assert (=> b!1558808 (= res!1066126 (and (or (not (is-Cons!36384 (t!51110 l!1292))) (bvsle (_1!12544 (h!37831 (t!51110 l!1292))) otherKey!62)) (is-Cons!36384 (t!51110 l!1292)) (bvslt (_1!12544 (h!37831 (t!51110 l!1292))) otherKey!62)))))

(declare-fun b!1558809 () Bool)

(assert (=> b!1558809 (= e!868435 (containsKey!844 (t!51110 (t!51110 l!1292)) otherKey!62))))

(assert (= (and d!162633 (not res!1066125)) b!1558808))

(assert (= (and b!1558808 res!1066126) b!1558809))

(declare-fun m!1434603 () Bool)

(assert (=> b!1558809 m!1434603))

(assert (=> b!1558606 d!162633))

(declare-fun d!162635 () Bool)

(assert (=> d!162635 (= ($colon$colon!988 e!868359 (ite c!144110 (h!37831 l!1292) (tuple2!25067 newKey!135 newValue!135))) (Cons!36384 (ite c!144110 (h!37831 l!1292) (tuple2!25067 newKey!135 newValue!135)) e!868359))))

(assert (=> bm!71783 d!162635))

(declare-fun b!1558810 () Bool)

(declare-fun e!868436 () Bool)

(declare-fun tp!112696 () Bool)

(assert (=> b!1558810 (= e!868436 (and tp_is_empty!38451 tp!112696))))

(assert (=> b!1558728 (= tp!112692 e!868436)))

(assert (= (and b!1558728 (is-Cons!36384 (t!51110 (t!51110 l!1292)))) b!1558810))

(push 1)

(assert (not b!1558791))

(assert (not d!162623))

(assert (not b!1558799))

(assert (not b!1558809))

(assert (not b!1558793))

(assert (not b!1558807))

(assert (not d!162629))

(assert (not b!1558804))

(assert (not b!1558796))

(assert tp_is_empty!38451)

(assert (not b!1558795))

(assert (not b!1558785))

(assert (not b!1558810))

(assert (not bm!71792))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

