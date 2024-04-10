; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132788 () Bool)

(assert start!132788)

(declare-fun res!1064386 () Bool)

(declare-fun e!866321 () Bool)

(assert (=> start!132788 (=> (not res!1064386) (not e!866321))))

(declare-datatypes ((B!2300 0))(
  ( (B!2301 (val!19236 Int)) )
))
(declare-datatypes ((tuple2!24848 0))(
  ( (tuple2!24849 (_1!12435 (_ BitVec 64)) (_2!12435 B!2300)) )
))
(declare-datatypes ((List!36270 0))(
  ( (Nil!36267) (Cons!36266 (h!37712 tuple2!24848) (t!50991 List!36270)) )
))
(declare-fun l!1177 () List!36270)

(declare-fun isStrictlySorted!926 (List!36270) Bool)

(assert (=> start!132788 (= res!1064386 (isStrictlySorted!926 l!1177))))

(assert (=> start!132788 e!866321))

(declare-fun e!866320 () Bool)

(assert (=> start!132788 e!866320))

(assert (=> start!132788 true))

(declare-fun tp_is_empty!38311 () Bool)

(assert (=> start!132788 tp_is_empty!38311))

(declare-fun b!1555605 () Bool)

(declare-fun res!1064385 () Bool)

(assert (=> b!1555605 (=> (not res!1064385) (not e!866321))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(assert (=> b!1555605 (= res!1064385 (and (not (= newKey!105 otherKey!50)) (or (not (is-Cons!36266 l!1177)) (= (_1!12435 (h!37712 l!1177)) otherKey!50))))))

(declare-fun newValue!105 () B!2300)

(declare-fun b!1555606 () Bool)

(declare-fun insertStrictlySorted!537 (List!36270 (_ BitVec 64) B!2300) List!36270)

(assert (=> b!1555606 (= e!866321 (not (isStrictlySorted!926 (insertStrictlySorted!537 l!1177 newKey!105 newValue!105))))))

(declare-fun b!1555607 () Bool)

(declare-fun tp!112308 () Bool)

(assert (=> b!1555607 (= e!866320 (and tp_is_empty!38311 tp!112308))))

(assert (= (and start!132788 res!1064386) b!1555605))

(assert (= (and b!1555605 res!1064385) b!1555606))

(assert (= (and start!132788 (is-Cons!36266 l!1177)) b!1555607))

(declare-fun m!1433571 () Bool)

(assert (=> start!132788 m!1433571))

(declare-fun m!1433573 () Bool)

(assert (=> b!1555606 m!1433573))

(assert (=> b!1555606 m!1433573))

(declare-fun m!1433575 () Bool)

(assert (=> b!1555606 m!1433575))

(push 1)

(assert (not start!132788))

(assert (not b!1555606))

(assert (not b!1555607))

(assert tp_is_empty!38311)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!161997 () Bool)

(declare-fun res!1064419 () Bool)

(declare-fun e!866354 () Bool)

(assert (=> d!161997 (=> res!1064419 e!866354)))

(assert (=> d!161997 (= res!1064419 (or (is-Nil!36267 l!1177) (is-Nil!36267 (t!50991 l!1177))))))

(assert (=> d!161997 (= (isStrictlySorted!926 l!1177) e!866354)))

(declare-fun b!1555646 () Bool)

(declare-fun e!866355 () Bool)

(assert (=> b!1555646 (= e!866354 e!866355)))

(declare-fun res!1064420 () Bool)

(assert (=> b!1555646 (=> (not res!1064420) (not e!866355))))

(assert (=> b!1555646 (= res!1064420 (bvslt (_1!12435 (h!37712 l!1177)) (_1!12435 (h!37712 (t!50991 l!1177)))))))

(declare-fun b!1555647 () Bool)

(assert (=> b!1555647 (= e!866355 (isStrictlySorted!926 (t!50991 l!1177)))))

(assert (= (and d!161997 (not res!1064419)) b!1555646))

(assert (= (and b!1555646 res!1064420) b!1555647))

(declare-fun m!1433597 () Bool)

(assert (=> b!1555647 m!1433597))

(assert (=> start!132788 d!161997))

(declare-fun d!162005 () Bool)

(declare-fun res!1064421 () Bool)

(declare-fun e!866356 () Bool)

(assert (=> d!162005 (=> res!1064421 e!866356)))

(assert (=> d!162005 (= res!1064421 (or (is-Nil!36267 (insertStrictlySorted!537 l!1177 newKey!105 newValue!105)) (is-Nil!36267 (t!50991 (insertStrictlySorted!537 l!1177 newKey!105 newValue!105)))))))

(assert (=> d!162005 (= (isStrictlySorted!926 (insertStrictlySorted!537 l!1177 newKey!105 newValue!105)) e!866356)))

(declare-fun b!1555648 () Bool)

(declare-fun e!866357 () Bool)

(assert (=> b!1555648 (= e!866356 e!866357)))

(declare-fun res!1064422 () Bool)

(assert (=> b!1555648 (=> (not res!1064422) (not e!866357))))

(assert (=> b!1555648 (= res!1064422 (bvslt (_1!12435 (h!37712 (insertStrictlySorted!537 l!1177 newKey!105 newValue!105))) (_1!12435 (h!37712 (t!50991 (insertStrictlySorted!537 l!1177 newKey!105 newValue!105))))))))

(declare-fun b!1555649 () Bool)

(assert (=> b!1555649 (= e!866357 (isStrictlySorted!926 (t!50991 (insertStrictlySorted!537 l!1177 newKey!105 newValue!105))))))

(assert (= (and d!162005 (not res!1064421)) b!1555648))

(assert (= (and b!1555648 res!1064422) b!1555649))

(declare-fun m!1433599 () Bool)

(assert (=> b!1555649 m!1433599))

(assert (=> b!1555606 d!162005))

(declare-fun b!1555740 () Bool)

(declare-fun e!866404 () List!36270)

(declare-fun e!866407 () List!36270)

(assert (=> b!1555740 (= e!866404 e!866407)))

(declare-fun c!143668 () Bool)

(assert (=> b!1555740 (= c!143668 (and (is-Cons!36266 l!1177) (= (_1!12435 (h!37712 l!1177)) newKey!105)))))

(declare-fun b!1555741 () Bool)

(declare-fun e!866405 () List!36270)

(declare-fun call!71551 () List!36270)

(assert (=> b!1555741 (= e!866405 call!71551)))

(declare-fun call!71552 () List!36270)

(declare-fun bm!71548 () Bool)

(declare-fun e!866408 () List!36270)

(declare-fun c!143666 () Bool)

(declare-fun $colon$colon!961 (List!36270 tuple2!24848) List!36270)

(assert (=> bm!71548 (= call!71552 ($colon$colon!961 e!866408 (ite c!143666 (h!37712 l!1177) (tuple2!24849 newKey!105 newValue!105))))))

(declare-fun c!143667 () Bool)

(assert (=> bm!71548 (= c!143667 c!143666)))

(declare-fun b!1555742 () Bool)

(declare-fun c!143669 () Bool)

(assert (=> b!1555742 (= c!143669 (and (is-Cons!36266 l!1177) (bvsgt (_1!12435 (h!37712 l!1177)) newKey!105)))))

(assert (=> b!1555742 (= e!866407 e!866405)))

(declare-fun b!1555743 () Bool)

(assert (=> b!1555743 (= e!866408 (ite c!143668 (t!50991 l!1177) (ite c!143669 (Cons!36266 (h!37712 l!1177) (t!50991 l!1177)) Nil!36267)))))

(declare-fun bm!71549 () Bool)

(declare-fun call!71553 () List!36270)

(assert (=> bm!71549 (= call!71551 call!71553)))

(declare-fun e!866406 () Bool)

(declare-fun lt!670334 () List!36270)

(declare-fun b!1555745 () Bool)

(declare-fun contains!10178 (List!36270 tuple2!24848) Bool)

(assert (=> b!1555745 (= e!866406 (contains!10178 lt!670334 (tuple2!24849 newKey!105 newValue!105)))))

(declare-fun b!1555746 () Bool)

(assert (=> b!1555746 (= e!866405 call!71551)))

(declare-fun b!1555747 () Bool)

(assert (=> b!1555747 (= e!866408 (insertStrictlySorted!537 (t!50991 l!1177) newKey!105 newValue!105))))

(declare-fun d!162007 () Bool)

(assert (=> d!162007 e!866406))

(declare-fun res!1064440 () Bool)

(assert (=> d!162007 (=> (not res!1064440) (not e!866406))))

(assert (=> d!162007 (= res!1064440 (isStrictlySorted!926 lt!670334))))

(assert (=> d!162007 (= lt!670334 e!866404)))

(assert (=> d!162007 (= c!143666 (and (is-Cons!36266 l!1177) (bvslt (_1!12435 (h!37712 l!1177)) newKey!105)))))

(assert (=> d!162007 (isStrictlySorted!926 l!1177)))

(assert (=> d!162007 (= (insertStrictlySorted!537 l!1177 newKey!105 newValue!105) lt!670334)))

(declare-fun b!1555744 () Bool)

(assert (=> b!1555744 (= e!866404 call!71552)))

(declare-fun b!1555748 () Bool)

(assert (=> b!1555748 (= e!866407 call!71553)))

(declare-fun b!1555749 () Bool)

(declare-fun res!1064439 () Bool)

(assert (=> b!1555749 (=> (not res!1064439) (not e!866406))))

(declare-fun containsKey!799 (List!36270 (_ BitVec 64)) Bool)

(assert (=> b!1555749 (= res!1064439 (containsKey!799 lt!670334 newKey!105))))

(declare-fun bm!71550 () Bool)

(assert (=> bm!71550 (= call!71553 call!71552)))

(assert (= (and d!162007 c!143666) b!1555744))

(assert (= (and d!162007 (not c!143666)) b!1555740))

(assert (= (and b!1555740 c!143668) b!1555748))

(assert (= (and b!1555740 (not c!143668)) b!1555742))

(assert (= (and b!1555742 c!143669) b!1555741))

(assert (= (and b!1555742 (not c!143669)) b!1555746))

(assert (= (or b!1555741 b!1555746) bm!71549))

(assert (= (or b!1555748 bm!71549) bm!71550))

(assert (= (or b!1555744 bm!71550) bm!71548))

(assert (= (and bm!71548 c!143667) b!1555747))

(assert (= (and bm!71548 (not c!143667)) b!1555743))

(assert (= (and d!162007 res!1064440) b!1555749))

(assert (= (and b!1555749 res!1064439) b!1555745))

(declare-fun m!1433621 () Bool)

(assert (=> b!1555749 m!1433621))

(declare-fun m!1433623 () Bool)

(assert (=> d!162007 m!1433623))

(assert (=> d!162007 m!1433571))

(declare-fun m!1433625 () Bool)

(assert (=> b!1555745 m!1433625))

(declare-fun m!1433627 () Bool)

(assert (=> b!1555747 m!1433627))

(declare-fun m!1433629 () Bool)

(assert (=> bm!71548 m!1433629))

(assert (=> b!1555606 d!162007))

(declare-fun b!1555754 () Bool)

(declare-fun e!866411 () Bool)

(declare-fun tp!112323 () Bool)

(assert (=> b!1555754 (= e!866411 (and tp_is_empty!38311 tp!112323))))

(assert (=> b!1555607 (= tp!112308 e!866411)))

(assert (= (and b!1555607 (is-Cons!36266 (t!50991 l!1177))) b!1555754))

(push 1)

