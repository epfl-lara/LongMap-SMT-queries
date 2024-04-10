; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132792 () Bool)

(assert start!132792)

(declare-fun res!1064398 () Bool)

(declare-fun e!866333 () Bool)

(assert (=> start!132792 (=> (not res!1064398) (not e!866333))))

(declare-datatypes ((B!2304 0))(
  ( (B!2305 (val!19238 Int)) )
))
(declare-datatypes ((tuple2!24852 0))(
  ( (tuple2!24853 (_1!12437 (_ BitVec 64)) (_2!12437 B!2304)) )
))
(declare-datatypes ((List!36272 0))(
  ( (Nil!36269) (Cons!36268 (h!37714 tuple2!24852) (t!50993 List!36272)) )
))
(declare-fun l!1177 () List!36272)

(declare-fun isStrictlySorted!928 (List!36272) Bool)

(assert (=> start!132792 (= res!1064398 (isStrictlySorted!928 l!1177))))

(assert (=> start!132792 e!866333))

(declare-fun e!866332 () Bool)

(assert (=> start!132792 e!866332))

(assert (=> start!132792 true))

(declare-fun tp_is_empty!38315 () Bool)

(assert (=> start!132792 tp_is_empty!38315))

(declare-fun b!1555623 () Bool)

(declare-fun res!1064397 () Bool)

(assert (=> b!1555623 (=> (not res!1064397) (not e!866333))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(assert (=> b!1555623 (= res!1064397 (and (not (= newKey!105 otherKey!50)) (or (not (is-Cons!36268 l!1177)) (= (_1!12437 (h!37714 l!1177)) otherKey!50))))))

(declare-fun newValue!105 () B!2304)

(declare-fun b!1555624 () Bool)

(declare-fun insertStrictlySorted!539 (List!36272 (_ BitVec 64) B!2304) List!36272)

(assert (=> b!1555624 (= e!866333 (not (isStrictlySorted!928 (insertStrictlySorted!539 l!1177 newKey!105 newValue!105))))))

(declare-fun b!1555625 () Bool)

(declare-fun tp!112314 () Bool)

(assert (=> b!1555625 (= e!866332 (and tp_is_empty!38315 tp!112314))))

(assert (= (and start!132792 res!1064398) b!1555623))

(assert (= (and b!1555623 res!1064397) b!1555624))

(assert (= (and start!132792 (is-Cons!36268 l!1177)) b!1555625))

(declare-fun m!1433583 () Bool)

(assert (=> start!132792 m!1433583))

(declare-fun m!1433585 () Bool)

(assert (=> b!1555624 m!1433585))

(assert (=> b!1555624 m!1433585))

(declare-fun m!1433587 () Bool)

(assert (=> b!1555624 m!1433587))

(push 1)

(assert (not start!132792))

(assert (not b!1555624))

(assert (not b!1555625))

(assert tp_is_empty!38315)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!161993 () Bool)

(declare-fun res!1064411 () Bool)

(declare-fun e!866346 () Bool)

(assert (=> d!161993 (=> res!1064411 e!866346)))

(assert (=> d!161993 (= res!1064411 (or (is-Nil!36269 l!1177) (is-Nil!36269 (t!50993 l!1177))))))

(assert (=> d!161993 (= (isStrictlySorted!928 l!1177) e!866346)))

(declare-fun b!1555638 () Bool)

(declare-fun e!866347 () Bool)

(assert (=> b!1555638 (= e!866346 e!866347)))

(declare-fun res!1064412 () Bool)

(assert (=> b!1555638 (=> (not res!1064412) (not e!866347))))

(assert (=> b!1555638 (= res!1064412 (bvslt (_1!12437 (h!37714 l!1177)) (_1!12437 (h!37714 (t!50993 l!1177)))))))

(declare-fun b!1555639 () Bool)

(assert (=> b!1555639 (= e!866347 (isStrictlySorted!928 (t!50993 l!1177)))))

(assert (= (and d!161993 (not res!1064411)) b!1555638))

(assert (= (and b!1555638 res!1064412) b!1555639))

(declare-fun m!1433593 () Bool)

(assert (=> b!1555639 m!1433593))

(assert (=> start!132792 d!161993))

(declare-fun d!162001 () Bool)

(declare-fun res!1064413 () Bool)

(declare-fun e!866348 () Bool)

(assert (=> d!162001 (=> res!1064413 e!866348)))

(assert (=> d!162001 (= res!1064413 (or (is-Nil!36269 (insertStrictlySorted!539 l!1177 newKey!105 newValue!105)) (is-Nil!36269 (t!50993 (insertStrictlySorted!539 l!1177 newKey!105 newValue!105)))))))

(assert (=> d!162001 (= (isStrictlySorted!928 (insertStrictlySorted!539 l!1177 newKey!105 newValue!105)) e!866348)))

(declare-fun b!1555640 () Bool)

(declare-fun e!866349 () Bool)

(assert (=> b!1555640 (= e!866348 e!866349)))

(declare-fun res!1064414 () Bool)

(assert (=> b!1555640 (=> (not res!1064414) (not e!866349))))

(assert (=> b!1555640 (= res!1064414 (bvslt (_1!12437 (h!37714 (insertStrictlySorted!539 l!1177 newKey!105 newValue!105))) (_1!12437 (h!37714 (t!50993 (insertStrictlySorted!539 l!1177 newKey!105 newValue!105))))))))

(declare-fun b!1555641 () Bool)

(assert (=> b!1555641 (= e!866349 (isStrictlySorted!928 (t!50993 (insertStrictlySorted!539 l!1177 newKey!105 newValue!105))))))

(assert (= (and d!162001 (not res!1064413)) b!1555640))

(assert (= (and b!1555640 res!1064414) b!1555641))

(declare-fun m!1433595 () Bool)

(assert (=> b!1555641 m!1433595))

(assert (=> b!1555624 d!162001))

(declare-fun bm!71545 () Bool)

(declare-fun call!71549 () List!36272)

(declare-fun call!71550 () List!36272)

(assert (=> bm!71545 (= call!71549 call!71550)))

(declare-fun b!1555724 () Bool)

(declare-fun e!866395 () List!36272)

(declare-fun c!143664 () Bool)

(declare-fun c!143662 () Bool)

(assert (=> b!1555724 (= e!866395 (ite c!143662 (t!50993 l!1177) (ite c!143664 (Cons!36268 (h!37714 l!1177) (t!50993 l!1177)) Nil!36269)))))

(declare-fun c!143663 () Bool)

(declare-fun call!71548 () List!36272)

(declare-fun bm!71546 () Bool)

(declare-fun $colon$colon!962 (List!36272 tuple2!24852) List!36272)

(assert (=> bm!71546 (= call!71548 ($colon$colon!962 e!866395 (ite c!143663 (h!37714 l!1177) (tuple2!24853 newKey!105 newValue!105))))))

(declare-fun c!143665 () Bool)

(assert (=> bm!71546 (= c!143665 c!143663)))

(declare-fun b!1555725 () Bool)

(declare-fun res!1064438 () Bool)

(declare-fun e!866399 () Bool)

(assert (=> b!1555725 (=> (not res!1064438) (not e!866399))))

(declare-fun lt!670333 () List!36272)

(declare-fun containsKey!798 (List!36272 (_ BitVec 64)) Bool)

(assert (=> b!1555725 (= res!1064438 (containsKey!798 lt!670333 newKey!105))))

(declare-fun b!1555726 () Bool)

(declare-fun e!866397 () List!36272)

(assert (=> b!1555726 (= e!866397 call!71548)))

(declare-fun b!1555727 () Bool)

(assert (=> b!1555727 (= e!866395 (insertStrictlySorted!539 (t!50993 l!1177) newKey!105 newValue!105))))

(declare-fun d!162003 () Bool)

(assert (=> d!162003 e!866399))

(declare-fun res!1064437 () Bool)

(assert (=> d!162003 (=> (not res!1064437) (not e!866399))))

(assert (=> d!162003 (= res!1064437 (isStrictlySorted!928 lt!670333))))

(assert (=> d!162003 (= lt!670333 e!866397)))

(assert (=> d!162003 (= c!143663 (and (is-Cons!36268 l!1177) (bvslt (_1!12437 (h!37714 l!1177)) newKey!105)))))

(assert (=> d!162003 (isStrictlySorted!928 l!1177)))

(assert (=> d!162003 (= (insertStrictlySorted!539 l!1177 newKey!105 newValue!105) lt!670333)))

(declare-fun b!1555728 () Bool)

(declare-fun e!866398 () List!36272)

(assert (=> b!1555728 (= e!866397 e!866398)))

(assert (=> b!1555728 (= c!143662 (and (is-Cons!36268 l!1177) (= (_1!12437 (h!37714 l!1177)) newKey!105)))))

(declare-fun b!1555729 () Bool)

(declare-fun contains!10179 (List!36272 tuple2!24852) Bool)

(assert (=> b!1555729 (= e!866399 (contains!10179 lt!670333 (tuple2!24853 newKey!105 newValue!105)))))

(declare-fun b!1555730 () Bool)

(declare-fun e!866396 () List!36272)

(assert (=> b!1555730 (= e!866396 call!71549)))

(declare-fun bm!71547 () Bool)

(assert (=> bm!71547 (= call!71550 call!71548)))

(declare-fun b!1555731 () Bool)

(assert (=> b!1555731 (= c!143664 (and (is-Cons!36268 l!1177) (bvsgt (_1!12437 (h!37714 l!1177)) newKey!105)))))

(assert (=> b!1555731 (= e!866398 e!866396)))

(declare-fun b!1555732 () Bool)

(assert (=> b!1555732 (= e!866396 call!71549)))

(declare-fun b!1555733 () Bool)

(assert (=> b!1555733 (= e!866398 call!71550)))

(assert (= (and d!162003 c!143663) b!1555726))

(assert (= (and d!162003 (not c!143663)) b!1555728))

(assert (= (and b!1555728 c!143662) b!1555733))

(assert (= (and b!1555728 (not c!143662)) b!1555731))

(assert (= (and b!1555731 c!143664) b!1555730))

(assert (= (and b!1555731 (not c!143664)) b!1555732))

(assert (= (or b!1555730 b!1555732) bm!71545))

(assert (= (or b!1555733 bm!71545) bm!71547))

(assert (= (or b!1555726 bm!71547) bm!71546))

(assert (= (and bm!71546 c!143665) b!1555727))

(assert (= (and bm!71546 (not c!143665)) b!1555724))

