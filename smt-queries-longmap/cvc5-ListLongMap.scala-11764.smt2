; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138076 () Bool)

(assert start!138076)

(declare-fun b!1584485 () Bool)

(declare-fun res!1082261 () Bool)

(declare-fun e!884524 () Bool)

(assert (=> b!1584485 (=> (not res!1082261) (not e!884524))))

(declare-fun newKey!123 () (_ BitVec 64))

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-datatypes ((B!2924 0))(
  ( (B!2925 (val!19824 Int)) )
))
(declare-datatypes ((tuple2!25816 0))(
  ( (tuple2!25817 (_1!12919 (_ BitVec 64)) (_2!12919 B!2924)) )
))
(declare-datatypes ((List!36944 0))(
  ( (Nil!36941) (Cons!36940 (h!38483 tuple2!25816) (t!51858 List!36944)) )
))
(declare-fun l!1251 () List!36944)

(assert (=> b!1584485 (= res!1082261 (and (not (= otherKey!56 newKey!123)) (is-Cons!36940 l!1251)))))

(declare-fun b!1584486 () Bool)

(declare-fun e!884523 () Bool)

(declare-fun tp_is_empty!39457 () Bool)

(declare-fun tp!115120 () Bool)

(assert (=> b!1584486 (= e!884523 (and tp_is_empty!39457 tp!115120))))

(declare-fun res!1082264 () Bool)

(assert (=> start!138076 (=> (not res!1082264) (not e!884524))))

(declare-fun isStrictlySorted!1169 (List!36944) Bool)

(assert (=> start!138076 (= res!1082264 (isStrictlySorted!1169 l!1251))))

(assert (=> start!138076 e!884524))

(assert (=> start!138076 e!884523))

(assert (=> start!138076 true))

(assert (=> start!138076 tp_is_empty!39457))

(declare-fun b!1584487 () Bool)

(declare-fun res!1082262 () Bool)

(assert (=> b!1584487 (=> (not res!1082262) (not e!884524))))

(declare-fun containsKey!1003 (List!36944 (_ BitVec 64)) Bool)

(assert (=> b!1584487 (= res!1082262 (not (containsKey!1003 (t!51858 l!1251) otherKey!56)))))

(declare-fun b!1584488 () Bool)

(declare-fun res!1082263 () Bool)

(assert (=> b!1584488 (=> (not res!1082263) (not e!884524))))

(assert (=> b!1584488 (= res!1082263 (not (containsKey!1003 l!1251 otherKey!56)))))

(declare-fun b!1584489 () Bool)

(declare-fun res!1082260 () Bool)

(assert (=> b!1584489 (=> (not res!1082260) (not e!884524))))

(assert (=> b!1584489 (= res!1082260 (isStrictlySorted!1169 (t!51858 l!1251)))))

(declare-fun newValue!123 () B!2924)

(declare-fun b!1584490 () Bool)

(declare-fun insertStrictlySorted!626 (List!36944 (_ BitVec 64) B!2924) List!36944)

(assert (=> b!1584490 (= e!884524 (not (not (containsKey!1003 (insertStrictlySorted!626 l!1251 newKey!123 newValue!123) otherKey!56))))))

(assert (=> b!1584490 (not (containsKey!1003 (insertStrictlySorted!626 (t!51858 l!1251) newKey!123 newValue!123) otherKey!56))))

(declare-datatypes ((Unit!52297 0))(
  ( (Unit!52298) )
))
(declare-fun lt!677259 () Unit!52297)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!10 (List!36944 (_ BitVec 64) B!2924 (_ BitVec 64)) Unit!52297)

(assert (=> b!1584490 (= lt!677259 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!10 (t!51858 l!1251) newKey!123 newValue!123 otherKey!56))))

(assert (= (and start!138076 res!1082264) b!1584488))

(assert (= (and b!1584488 res!1082263) b!1584485))

(assert (= (and b!1584485 res!1082261) b!1584489))

(assert (= (and b!1584489 res!1082260) b!1584487))

(assert (= (and b!1584487 res!1082262) b!1584490))

(assert (= (and start!138076 (is-Cons!36940 l!1251)) b!1584486))

(declare-fun m!1453739 () Bool)

(assert (=> b!1584490 m!1453739))

(declare-fun m!1453741 () Bool)

(assert (=> b!1584490 m!1453741))

(declare-fun m!1453743 () Bool)

(assert (=> b!1584490 m!1453743))

(declare-fun m!1453745 () Bool)

(assert (=> b!1584490 m!1453745))

(assert (=> b!1584490 m!1453741))

(declare-fun m!1453747 () Bool)

(assert (=> b!1584490 m!1453747))

(assert (=> b!1584490 m!1453743))

(declare-fun m!1453749 () Bool)

(assert (=> b!1584487 m!1453749))

(declare-fun m!1453751 () Bool)

(assert (=> b!1584489 m!1453751))

(declare-fun m!1453753 () Bool)

(assert (=> start!138076 m!1453753))

(declare-fun m!1453755 () Bool)

(assert (=> b!1584488 m!1453755))

(push 1)

(assert tp_is_empty!39457)

(assert (not b!1584487))

(assert (not b!1584489))

(assert (not start!138076))

(assert (not b!1584488))

(assert (not b!1584490))

(assert (not b!1584486))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1584579 () Bool)

(declare-fun e!884581 () List!36944)

(declare-fun e!884583 () List!36944)

(assert (=> b!1584579 (= e!884581 e!884583)))

(declare-fun c!146866 () Bool)

(assert (=> b!1584579 (= c!146866 (and (is-Cons!36940 l!1251) (= (_1!12919 (h!38483 l!1251)) newKey!123)))))

(declare-fun b!1584580 () Bool)

(declare-fun call!72551 () List!36944)

(assert (=> b!1584580 (= e!884581 call!72551)))

(declare-fun b!1584581 () Bool)

(declare-fun call!72550 () List!36944)

(assert (=> b!1584581 (= e!884583 call!72550)))

(declare-fun b!1584582 () Bool)

(declare-fun e!884582 () Bool)

(declare-fun lt!677268 () List!36944)

(declare-fun contains!10526 (List!36944 tuple2!25816) Bool)

(assert (=> b!1584582 (= e!884582 (contains!10526 lt!677268 (tuple2!25817 newKey!123 newValue!123)))))

(declare-fun d!167443 () Bool)

(assert (=> d!167443 e!884582))

(declare-fun res!1082332 () Bool)

(assert (=> d!167443 (=> (not res!1082332) (not e!884582))))

(assert (=> d!167443 (= res!1082332 (isStrictlySorted!1169 lt!677268))))

(assert (=> d!167443 (= lt!677268 e!884581)))

(declare-fun c!146865 () Bool)

(assert (=> d!167443 (= c!146865 (and (is-Cons!36940 l!1251) (bvslt (_1!12919 (h!38483 l!1251)) newKey!123)))))

(assert (=> d!167443 (isStrictlySorted!1169 l!1251)))

(assert (=> d!167443 (= (insertStrictlySorted!626 l!1251 newKey!123 newValue!123) lt!677268)))

(declare-fun b!1584583 () Bool)

(declare-fun e!884580 () List!36944)

(declare-fun call!72549 () List!36944)

(assert (=> b!1584583 (= e!884580 call!72549)))

(declare-fun b!1584584 () Bool)

(assert (=> b!1584584 (= e!884580 call!72549)))

(declare-fun b!1584585 () Bool)

(declare-fun e!884579 () List!36944)

(assert (=> b!1584585 (= e!884579 (insertStrictlySorted!626 (t!51858 l!1251) newKey!123 newValue!123))))

(declare-fun b!1584586 () Bool)

(declare-fun res!1082331 () Bool)

(assert (=> b!1584586 (=> (not res!1082331) (not e!884582))))

(assert (=> b!1584586 (= res!1082331 (containsKey!1003 lt!677268 newKey!123))))

(declare-fun bm!72546 () Bool)

(assert (=> bm!72546 (= call!72549 call!72550)))

(declare-fun b!1584587 () Bool)

(declare-fun c!146867 () Bool)

(assert (=> b!1584587 (= e!884579 (ite c!146866 (t!51858 l!1251) (ite c!146867 (Cons!36940 (h!38483 l!1251) (t!51858 l!1251)) Nil!36941)))))

(declare-fun b!1584588 () Bool)

(assert (=> b!1584588 (= c!146867 (and (is-Cons!36940 l!1251) (bvsgt (_1!12919 (h!38483 l!1251)) newKey!123)))))

(assert (=> b!1584588 (= e!884583 e!884580)))

(declare-fun bm!72547 () Bool)

(assert (=> bm!72547 (= call!72550 call!72551)))

(declare-fun bm!72548 () Bool)

(declare-fun $colon$colon!1022 (List!36944 tuple2!25816) List!36944)

(assert (=> bm!72548 (= call!72551 ($colon$colon!1022 e!884579 (ite c!146865 (h!38483 l!1251) (tuple2!25817 newKey!123 newValue!123))))))

(declare-fun c!146864 () Bool)

(assert (=> bm!72548 (= c!146864 c!146865)))

(assert (= (and d!167443 c!146865) b!1584580))

(assert (= (and d!167443 (not c!146865)) b!1584579))

(assert (= (and b!1584579 c!146866) b!1584581))

(assert (= (and b!1584579 (not c!146866)) b!1584588))

(assert (= (and b!1584588 c!146867) b!1584583))

(assert (= (and b!1584588 (not c!146867)) b!1584584))

(assert (= (or b!1584583 b!1584584) bm!72546))

(assert (= (or b!1584581 bm!72546) bm!72547))

(assert (= (or b!1584580 bm!72547) bm!72548))

(assert (= (and bm!72548 c!146864) b!1584585))

(assert (= (and bm!72548 (not c!146864)) b!1584587))

(assert (= (and d!167443 res!1082332) b!1584586))

(assert (= (and b!1584586 res!1082331) b!1584582))

(declare-fun m!1453801 () Bool)

(assert (=> bm!72548 m!1453801))

(declare-fun m!1453803 () Bool)

(assert (=> b!1584582 m!1453803))

(declare-fun m!1453805 () Bool)

(assert (=> b!1584586 m!1453805))

(declare-fun m!1453807 () Bool)

(assert (=> d!167443 m!1453807))

(assert (=> d!167443 m!1453753))

(assert (=> b!1584585 m!1453741))

(assert (=> b!1584490 d!167443))

(declare-fun b!1584589 () Bool)

(declare-fun e!884586 () List!36944)

(declare-fun e!884588 () List!36944)

(assert (=> b!1584589 (= e!884586 e!884588)))

(declare-fun c!146870 () Bool)

(assert (=> b!1584589 (= c!146870 (and (is-Cons!36940 (t!51858 l!1251)) (= (_1!12919 (h!38483 (t!51858 l!1251))) newKey!123)))))

(declare-fun b!1584590 () Bool)

(declare-fun call!72554 () List!36944)

(assert (=> b!1584590 (= e!884586 call!72554)))

(declare-fun b!1584591 () Bool)

(declare-fun call!72553 () List!36944)

(assert (=> b!1584591 (= e!884588 call!72553)))

(declare-fun e!884587 () Bool)

(declare-fun lt!677269 () List!36944)

(declare-fun b!1584592 () Bool)

(assert (=> b!1584592 (= e!884587 (contains!10526 lt!677269 (tuple2!25817 newKey!123 newValue!123)))))

(declare-fun d!167461 () Bool)

(assert (=> d!167461 e!884587))

(declare-fun res!1082334 () Bool)

(assert (=> d!167461 (=> (not res!1082334) (not e!884587))))

(assert (=> d!167461 (= res!1082334 (isStrictlySorted!1169 lt!677269))))

(assert (=> d!167461 (= lt!677269 e!884586)))

(declare-fun c!146869 () Bool)

(assert (=> d!167461 (= c!146869 (and (is-Cons!36940 (t!51858 l!1251)) (bvslt (_1!12919 (h!38483 (t!51858 l!1251))) newKey!123)))))

(assert (=> d!167461 (isStrictlySorted!1169 (t!51858 l!1251))))

(assert (=> d!167461 (= (insertStrictlySorted!626 (t!51858 l!1251) newKey!123 newValue!123) lt!677269)))

(declare-fun b!1584593 () Bool)

(declare-fun e!884585 () List!36944)

(declare-fun call!72552 () List!36944)

(assert (=> b!1584593 (= e!884585 call!72552)))

(declare-fun b!1584594 () Bool)

(assert (=> b!1584594 (= e!884585 call!72552)))

(declare-fun b!1584595 () Bool)

(declare-fun e!884584 () List!36944)

(assert (=> b!1584595 (= e!884584 (insertStrictlySorted!626 (t!51858 (t!51858 l!1251)) newKey!123 newValue!123))))

(declare-fun b!1584596 () Bool)

(declare-fun res!1082333 () Bool)

(assert (=> b!1584596 (=> (not res!1082333) (not e!884587))))

(assert (=> b!1584596 (= res!1082333 (containsKey!1003 lt!677269 newKey!123))))

(declare-fun bm!72549 () Bool)

(assert (=> bm!72549 (= call!72552 call!72553)))

(declare-fun b!1584597 () Bool)

(declare-fun c!146871 () Bool)

(assert (=> b!1584597 (= e!884584 (ite c!146870 (t!51858 (t!51858 l!1251)) (ite c!146871 (Cons!36940 (h!38483 (t!51858 l!1251)) (t!51858 (t!51858 l!1251))) Nil!36941)))))

(declare-fun b!1584598 () Bool)

(assert (=> b!1584598 (= c!146871 (and (is-Cons!36940 (t!51858 l!1251)) (bvsgt (_1!12919 (h!38483 (t!51858 l!1251))) newKey!123)))))

(assert (=> b!1584598 (= e!884588 e!884585)))

(declare-fun bm!72550 () Bool)

(assert (=> bm!72550 (= call!72553 call!72554)))

(declare-fun bm!72551 () Bool)

(assert (=> bm!72551 (= call!72554 ($colon$colon!1022 e!884584 (ite c!146869 (h!38483 (t!51858 l!1251)) (tuple2!25817 newKey!123 newValue!123))))))

(declare-fun c!146868 () Bool)

(assert (=> bm!72551 (= c!146868 c!146869)))

(assert (= (and d!167461 c!146869) b!1584590))

(assert (= (and d!167461 (not c!146869)) b!1584589))

(assert (= (and b!1584589 c!146870) b!1584591))

(assert (= (and b!1584589 (not c!146870)) b!1584598))

(assert (= (and b!1584598 c!146871) b!1584593))

(assert (= (and b!1584598 (not c!146871)) b!1584594))

(assert (= (or b!1584593 b!1584594) bm!72549))

(assert (= (or b!1584591 bm!72549) bm!72550))

(assert (= (or b!1584590 bm!72550) bm!72551))

(assert (= (and bm!72551 c!146868) b!1584595))

(assert (= (and bm!72551 (not c!146868)) b!1584597))

(assert (= (and d!167461 res!1082334) b!1584596))

(assert (= (and b!1584596 res!1082333) b!1584592))

(declare-fun m!1453809 () Bool)

(assert (=> bm!72551 m!1453809))

(declare-fun m!1453811 () Bool)

(assert (=> b!1584592 m!1453811))

(declare-fun m!1453813 () Bool)

(assert (=> b!1584596 m!1453813))

(declare-fun m!1453815 () Bool)

(assert (=> d!167461 m!1453815))

(assert (=> d!167461 m!1453751))

(declare-fun m!1453817 () Bool)

(assert (=> b!1584595 m!1453817))

(assert (=> b!1584490 d!167461))

(declare-fun d!167463 () Bool)

(assert (=> d!167463 (not (containsKey!1003 (insertStrictlySorted!626 (t!51858 l!1251) newKey!123 newValue!123) otherKey!56))))

(declare-fun lt!677272 () Unit!52297)

(declare-fun choose!2110 (List!36944 (_ BitVec 64) B!2924 (_ BitVec 64)) Unit!52297)

(assert (=> d!167463 (= lt!677272 (choose!2110 (t!51858 l!1251) newKey!123 newValue!123 otherKey!56))))

(declare-fun e!884591 () Bool)

(assert (=> d!167463 e!884591))

(declare-fun res!1082339 () Bool)

(assert (=> d!167463 (=> (not res!1082339) (not e!884591))))

(assert (=> d!167463 (= res!1082339 (isStrictlySorted!1169 (t!51858 l!1251)))))

(assert (=> d!167463 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!10 (t!51858 l!1251) newKey!123 newValue!123 otherKey!56) lt!677272)))

(declare-fun b!1584603 () Bool)

(declare-fun res!1082340 () Bool)

(assert (=> b!1584603 (=> (not res!1082340) (not e!884591))))

(assert (=> b!1584603 (= res!1082340 (not (containsKey!1003 (t!51858 l!1251) otherKey!56)))))

(declare-fun b!1584604 () Bool)

(assert (=> b!1584604 (= e!884591 (not (= otherKey!56 newKey!123)))))

(assert (= (and d!167463 res!1082339) b!1584603))

(assert (= (and b!1584603 res!1082340) b!1584604))

(assert (=> d!167463 m!1453741))

(assert (=> d!167463 m!1453741))

(assert (=> d!167463 m!1453747))

(declare-fun m!1453819 () Bool)

(assert (=> d!167463 m!1453819))

(assert (=> d!167463 m!1453751))

(assert (=> b!1584603 m!1453749))

(assert (=> b!1584490 d!167463))

(declare-fun d!167465 () Bool)

(declare-fun res!1082345 () Bool)

(declare-fun e!884608 () Bool)

(assert (=> d!167465 (=> res!1082345 e!884608)))

(assert (=> d!167465 (= res!1082345 (and (is-Cons!36940 (insertStrictlySorted!626 l!1251 newKey!123 newValue!123)) (= (_1!12919 (h!38483 (insertStrictlySorted!626 l!1251 newKey!123 newValue!123))) otherKey!56)))))

(assert (=> d!167465 (= (containsKey!1003 (insertStrictlySorted!626 l!1251 newKey!123 newValue!123) otherKey!56) e!884608)))

(declare-fun b!1584633 () Bool)

(declare-fun e!884609 () Bool)

(assert (=> b!1584633 (= e!884608 e!884609)))

(declare-fun res!1082346 () Bool)

(assert (=> b!1584633 (=> (not res!1082346) (not e!884609))))

(assert (=> b!1584633 (= res!1082346 (and (or (not (is-Cons!36940 (insertStrictlySorted!626 l!1251 newKey!123 newValue!123))) (bvsle (_1!12919 (h!38483 (insertStrictlySorted!626 l!1251 newKey!123 newValue!123))) otherKey!56)) (is-Cons!36940 (insertStrictlySorted!626 l!1251 newKey!123 newValue!123)) (bvslt (_1!12919 (h!38483 (insertStrictlySorted!626 l!1251 newKey!123 newValue!123))) otherKey!56)))))

(declare-fun b!1584634 () Bool)

(assert (=> b!1584634 (= e!884609 (containsKey!1003 (t!51858 (insertStrictlySorted!626 l!1251 newKey!123 newValue!123)) otherKey!56))))

(assert (= (and d!167465 (not res!1082345)) b!1584633))

(assert (= (and b!1584633 res!1082346) b!1584634))

(declare-fun m!1453821 () Bool)

(assert (=> b!1584634 m!1453821))

(assert (=> b!1584490 d!167465))

(declare-fun d!167467 () Bool)

(declare-fun res!1082347 () Bool)

(declare-fun e!884614 () Bool)

(assert (=> d!167467 (=> res!1082347 e!884614)))

(assert (=> d!167467 (= res!1082347 (and (is-Cons!36940 (insertStrictlySorted!626 (t!51858 l!1251) newKey!123 newValue!123)) (= (_1!12919 (h!38483 (insertStrictlySorted!626 (t!51858 l!1251) newKey!123 newValue!123))) otherKey!56)))))

(assert (=> d!167467 (= (containsKey!1003 (insertStrictlySorted!626 (t!51858 l!1251) newKey!123 newValue!123) otherKey!56) e!884614)))

(declare-fun b!1584643 () Bool)

(declare-fun e!884615 () Bool)

(assert (=> b!1584643 (= e!884614 e!884615)))

(declare-fun res!1082348 () Bool)

(assert (=> b!1584643 (=> (not res!1082348) (not e!884615))))

(assert (=> b!1584643 (= res!1082348 (and (or (not (is-Cons!36940 (insertStrictlySorted!626 (t!51858 l!1251) newKey!123 newValue!123))) (bvsle (_1!12919 (h!38483 (insertStrictlySorted!626 (t!51858 l!1251) newKey!123 newValue!123))) otherKey!56)) (is-Cons!36940 (insertStrictlySorted!626 (t!51858 l!1251) newKey!123 newValue!123)) (bvslt (_1!12919 (h!38483 (insertStrictlySorted!626 (t!51858 l!1251) newKey!123 newValue!123))) otherKey!56)))))

(declare-fun b!1584644 () Bool)

(assert (=> b!1584644 (= e!884615 (containsKey!1003 (t!51858 (insertStrictlySorted!626 (t!51858 l!1251) newKey!123 newValue!123)) otherKey!56))))

(assert (= (and d!167467 (not res!1082347)) b!1584643))

(assert (= (and b!1584643 res!1082348) b!1584644))

(declare-fun m!1453823 () Bool)

(assert (=> b!1584644 m!1453823))

(assert (=> b!1584490 d!167467))

(declare-fun d!167469 () Bool)

(declare-fun res!1082361 () Bool)

(declare-fun e!884624 () Bool)

(assert (=> d!167469 (=> res!1082361 e!884624)))

(assert (=> d!167469 (= res!1082361 (or (is-Nil!36941 l!1251) (is-Nil!36941 (t!51858 l!1251))))))

(assert (=> d!167469 (= (isStrictlySorted!1169 l!1251) e!884624)))

(declare-fun b!1584657 () Bool)

(declare-fun e!884625 () Bool)

(assert (=> b!1584657 (= e!884624 e!884625)))

(declare-fun res!1082362 () Bool)

(assert (=> b!1584657 (=> (not res!1082362) (not e!884625))))

(assert (=> b!1584657 (= res!1082362 (bvslt (_1!12919 (h!38483 l!1251)) (_1!12919 (h!38483 (t!51858 l!1251)))))))

(declare-fun b!1584658 () Bool)

(assert (=> b!1584658 (= e!884625 (isStrictlySorted!1169 (t!51858 l!1251)))))

(assert (= (and d!167469 (not res!1082361)) b!1584657))

(assert (= (and b!1584657 res!1082362) b!1584658))

(assert (=> b!1584658 m!1453751))

(assert (=> start!138076 d!167469))

(declare-fun d!167471 () Bool)

(declare-fun res!1082363 () Bool)

(declare-fun e!884626 () Bool)

(assert (=> d!167471 (=> res!1082363 e!884626)))

(assert (=> d!167471 (= res!1082363 (and (is-Cons!36940 (t!51858 l!1251)) (= (_1!12919 (h!38483 (t!51858 l!1251))) otherKey!56)))))

(assert (=> d!167471 (= (containsKey!1003 (t!51858 l!1251) otherKey!56) e!884626)))

(declare-fun b!1584659 () Bool)

(declare-fun e!884627 () Bool)

(assert (=> b!1584659 (= e!884626 e!884627)))

(declare-fun res!1082364 () Bool)

(assert (=> b!1584659 (=> (not res!1082364) (not e!884627))))

(assert (=> b!1584659 (= res!1082364 (and (or (not (is-Cons!36940 (t!51858 l!1251))) (bvsle (_1!12919 (h!38483 (t!51858 l!1251))) otherKey!56)) (is-Cons!36940 (t!51858 l!1251)) (bvslt (_1!12919 (h!38483 (t!51858 l!1251))) otherKey!56)))))

(declare-fun b!1584660 () Bool)

(assert (=> b!1584660 (= e!884627 (containsKey!1003 (t!51858 (t!51858 l!1251)) otherKey!56))))

(assert (= (and d!167471 (not res!1082363)) b!1584659))

(assert (= (and b!1584659 res!1082364) b!1584660))

(declare-fun m!1453825 () Bool)

(assert (=> b!1584660 m!1453825))

(assert (=> b!1584487 d!167471))

(declare-fun d!167473 () Bool)

(declare-fun res!1082365 () Bool)

(declare-fun e!884628 () Bool)

(assert (=> d!167473 (=> res!1082365 e!884628)))

(assert (=> d!167473 (= res!1082365 (and (is-Cons!36940 l!1251) (= (_1!12919 (h!38483 l!1251)) otherKey!56)))))

(assert (=> d!167473 (= (containsKey!1003 l!1251 otherKey!56) e!884628)))

(declare-fun b!1584661 () Bool)

(declare-fun e!884629 () Bool)

(assert (=> b!1584661 (= e!884628 e!884629)))

(declare-fun res!1082366 () Bool)

(assert (=> b!1584661 (=> (not res!1082366) (not e!884629))))

(assert (=> b!1584661 (= res!1082366 (and (or (not (is-Cons!36940 l!1251)) (bvsle (_1!12919 (h!38483 l!1251)) otherKey!56)) (is-Cons!36940 l!1251) (bvslt (_1!12919 (h!38483 l!1251)) otherKey!56)))))

(declare-fun b!1584662 () Bool)

(assert (=> b!1584662 (= e!884629 (containsKey!1003 (t!51858 l!1251) otherKey!56))))

(assert (= (and d!167473 (not res!1082365)) b!1584661))

(assert (= (and b!1584661 res!1082366) b!1584662))

(assert (=> b!1584662 m!1453749))

(assert (=> b!1584488 d!167473))

(declare-fun d!167475 () Bool)

(declare-fun res!1082367 () Bool)

(declare-fun e!884630 () Bool)

(assert (=> d!167475 (=> res!1082367 e!884630)))

(assert (=> d!167475 (= res!1082367 (or (is-Nil!36941 (t!51858 l!1251)) (is-Nil!36941 (t!51858 (t!51858 l!1251)))))))

(assert (=> d!167475 (= (isStrictlySorted!1169 (t!51858 l!1251)) e!884630)))

(declare-fun b!1584663 () Bool)

(declare-fun e!884631 () Bool)

(assert (=> b!1584663 (= e!884630 e!884631)))

(declare-fun res!1082368 () Bool)

(assert (=> b!1584663 (=> (not res!1082368) (not e!884631))))

(assert (=> b!1584663 (= res!1082368 (bvslt (_1!12919 (h!38483 (t!51858 l!1251))) (_1!12919 (h!38483 (t!51858 (t!51858 l!1251))))))))

(declare-fun b!1584664 () Bool)

(assert (=> b!1584664 (= e!884631 (isStrictlySorted!1169 (t!51858 (t!51858 l!1251))))))

(assert (= (and d!167475 (not res!1082367)) b!1584663))

(assert (= (and b!1584663 res!1082368) b!1584664))

(declare-fun m!1453827 () Bool)

(assert (=> b!1584664 m!1453827))

(assert (=> b!1584489 d!167475))

(declare-fun b!1584669 () Bool)

(declare-fun e!884634 () Bool)

(declare-fun tp!115129 () Bool)

(assert (=> b!1584669 (= e!884634 (and tp_is_empty!39457 tp!115129))))

(assert (=> b!1584486 (= tp!115120 e!884634)))

(assert (= (and b!1584486 (is-Cons!36940 (t!51858 l!1251))) b!1584669))

(push 1)

(assert (not b!1584634))

(assert (not b!1584644))

(assert (not d!167461))

(assert (not b!1584586))

(assert (not b!1584585))

(assert (not b!1584595))

(assert (not d!167463))

(assert (not b!1584592))

(assert (not d!167443))

(assert (not b!1584669))

(assert (not b!1584658))

(assert (not bm!72548))

(assert (not b!1584603))

(assert (not b!1584660))

(assert (not bm!72551))

(assert tp_is_empty!39457)

(assert (not b!1584582))

(assert (not b!1584596))

(assert (not b!1584664))

(assert (not b!1584662))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> d!167463 d!167467))

(assert (=> d!167463 d!167461))

(declare-fun d!167493 () Bool)

(assert (=> d!167493 (not (containsKey!1003 (insertStrictlySorted!626 (t!51858 l!1251) newKey!123 newValue!123) otherKey!56))))

(assert (=> d!167493 true))

(declare-fun _$17!98 () Unit!52297)

(assert (=> d!167493 (= (choose!2110 (t!51858 l!1251) newKey!123 newValue!123 otherKey!56) _$17!98)))

(declare-fun bs!45939 () Bool)

(assert (= bs!45939 d!167493))

(assert (=> bs!45939 m!1453741))

(assert (=> bs!45939 m!1453741))

(assert (=> bs!45939 m!1453747))

(assert (=> d!167463 d!167493))

(assert (=> d!167463 d!167475))

(declare-fun d!167495 () Bool)

(declare-fun res!1082397 () Bool)

(declare-fun e!884675 () Bool)

(assert (=> d!167495 (=> res!1082397 e!884675)))

(assert (=> d!167495 (= res!1082397 (and (is-Cons!36940 (t!51858 (insertStrictlySorted!626 l!1251 newKey!123 newValue!123))) (= (_1!12919 (h!38483 (t!51858 (insertStrictlySorted!626 l!1251 newKey!123 newValue!123)))) otherKey!56)))))

(assert (=> d!167495 (= (containsKey!1003 (t!51858 (insertStrictlySorted!626 l!1251 newKey!123 newValue!123)) otherKey!56) e!884675)))

(declare-fun b!1584740 () Bool)

(declare-fun e!884676 () Bool)

(assert (=> b!1584740 (= e!884675 e!884676)))

(declare-fun res!1082398 () Bool)

(assert (=> b!1584740 (=> (not res!1082398) (not e!884676))))

(assert (=> b!1584740 (= res!1082398 (and (or (not (is-Cons!36940 (t!51858 (insertStrictlySorted!626 l!1251 newKey!123 newValue!123)))) (bvsle (_1!12919 (h!38483 (t!51858 (insertStrictlySorted!626 l!1251 newKey!123 newValue!123)))) otherKey!56)) (is-Cons!36940 (t!51858 (insertStrictlySorted!626 l!1251 newKey!123 newValue!123))) (bvslt (_1!12919 (h!38483 (t!51858 (insertStrictlySorted!626 l!1251 newKey!123 newValue!123)))) otherKey!56)))))

(declare-fun b!1584741 () Bool)

(assert (=> b!1584741 (= e!884676 (containsKey!1003 (t!51858 (t!51858 (insertStrictlySorted!626 l!1251 newKey!123 newValue!123))) otherKey!56))))

(assert (= (and d!167495 (not res!1082397)) b!1584740))

(assert (= (and b!1584740 res!1082398) b!1584741))

(declare-fun m!1453877 () Bool)

(assert (=> b!1584741 m!1453877))

(assert (=> b!1584634 d!167495))

(declare-fun d!167497 () Bool)

(declare-fun lt!677289 () Bool)

(declare-fun content!861 (List!36944) (Set tuple2!25816))

(assert (=> d!167497 (= lt!677289 (set.member (tuple2!25817 newKey!123 newValue!123) (content!861 lt!677269)))))

(declare-fun e!884681 () Bool)

(assert (=> d!167497 (= lt!677289 e!884681)))

(declare-fun res!1082404 () Bool)

(assert (=> d!167497 (=> (not res!1082404) (not e!884681))))

(assert (=> d!167497 (= res!1082404 (is-Cons!36940 lt!677269))))

(assert (=> d!167497 (= (contains!10526 lt!677269 (tuple2!25817 newKey!123 newValue!123)) lt!677289)))

(declare-fun b!1584746 () Bool)

(declare-fun e!884682 () Bool)

(assert (=> b!1584746 (= e!884681 e!884682)))

(declare-fun res!1082403 () Bool)

(assert (=> b!1584746 (=> res!1082403 e!884682)))

(assert (=> b!1584746 (= res!1082403 (= (h!38483 lt!677269) (tuple2!25817 newKey!123 newValue!123)))))

(declare-fun b!1584747 () Bool)

(assert (=> b!1584747 (= e!884682 (contains!10526 (t!51858 lt!677269) (tuple2!25817 newKey!123 newValue!123)))))

(assert (= (and d!167497 res!1082404) b!1584746))

(assert (= (and b!1584746 (not res!1082403)) b!1584747))

(declare-fun m!1453879 () Bool)

(assert (=> d!167497 m!1453879))

(declare-fun m!1453881 () Bool)

(assert (=> d!167497 m!1453881))

(declare-fun m!1453883 () Bool)

(assert (=> b!1584747 m!1453883))

(assert (=> b!1584592 d!167497))

(assert (=> b!1584662 d!167471))

(assert (=> b!1584603 d!167471))

(declare-fun d!167499 () Bool)

(declare-fun res!1082405 () Bool)

(declare-fun e!884683 () Bool)

(assert (=> d!167499 (=> res!1082405 e!884683)))

(assert (=> d!167499 (= res!1082405 (and (is-Cons!36940 (t!51858 (t!51858 l!1251))) (= (_1!12919 (h!38483 (t!51858 (t!51858 l!1251)))) otherKey!56)))))

(assert (=> d!167499 (= (containsKey!1003 (t!51858 (t!51858 l!1251)) otherKey!56) e!884683)))

(declare-fun b!1584748 () Bool)

(declare-fun e!884684 () Bool)

(assert (=> b!1584748 (= e!884683 e!884684)))

(declare-fun res!1082406 () Bool)

(assert (=> b!1584748 (=> (not res!1082406) (not e!884684))))

(assert (=> b!1584748 (= res!1082406 (and (or (not (is-Cons!36940 (t!51858 (t!51858 l!1251)))) (bvsle (_1!12919 (h!38483 (t!51858 (t!51858 l!1251)))) otherKey!56)) (is-Cons!36940 (t!51858 (t!51858 l!1251))) (bvslt (_1!12919 (h!38483 (t!51858 (t!51858 l!1251)))) otherKey!56)))))

(declare-fun b!1584749 () Bool)

(assert (=> b!1584749 (= e!884684 (containsKey!1003 (t!51858 (t!51858 (t!51858 l!1251))) otherKey!56))))

(assert (= (and d!167499 (not res!1082405)) b!1584748))

(assert (= (and b!1584748 res!1082406) b!1584749))

(declare-fun m!1453885 () Bool)

(assert (=> b!1584749 m!1453885))

(assert (=> b!1584660 d!167499))

(declare-fun d!167501 () Bool)

(declare-fun res!1082407 () Bool)

(declare-fun e!884685 () Bool)

(assert (=> d!167501 (=> res!1082407 e!884685)))

(assert (=> d!167501 (= res!1082407 (and (is-Cons!36940 (t!51858 (insertStrictlySorted!626 (t!51858 l!1251) newKey!123 newValue!123))) (= (_1!12919 (h!38483 (t!51858 (insertStrictlySorted!626 (t!51858 l!1251) newKey!123 newValue!123)))) otherKey!56)))))

(assert (=> d!167501 (= (containsKey!1003 (t!51858 (insertStrictlySorted!626 (t!51858 l!1251) newKey!123 newValue!123)) otherKey!56) e!884685)))

(declare-fun b!1584750 () Bool)

(declare-fun e!884686 () Bool)

(assert (=> b!1584750 (= e!884685 e!884686)))

(declare-fun res!1082408 () Bool)

(assert (=> b!1584750 (=> (not res!1082408) (not e!884686))))

(assert (=> b!1584750 (= res!1082408 (and (or (not (is-Cons!36940 (t!51858 (insertStrictlySorted!626 (t!51858 l!1251) newKey!123 newValue!123)))) (bvsle (_1!12919 (h!38483 (t!51858 (insertStrictlySorted!626 (t!51858 l!1251) newKey!123 newValue!123)))) otherKey!56)) (is-Cons!36940 (t!51858 (insertStrictlySorted!626 (t!51858 l!1251) newKey!123 newValue!123))) (bvslt (_1!12919 (h!38483 (t!51858 (insertStrictlySorted!626 (t!51858 l!1251) newKey!123 newValue!123)))) otherKey!56)))))

(declare-fun b!1584751 () Bool)

(assert (=> b!1584751 (= e!884686 (containsKey!1003 (t!51858 (t!51858 (insertStrictlySorted!626 (t!51858 l!1251) newKey!123 newValue!123))) otherKey!56))))

(assert (= (and d!167501 (not res!1082407)) b!1584750))

(assert (= (and b!1584750 res!1082408) b!1584751))

(declare-fun m!1453887 () Bool)

(assert (=> b!1584751 m!1453887))

(assert (=> b!1584644 d!167501))

(declare-fun d!167503 () Bool)

(declare-fun res!1082409 () Bool)

(declare-fun e!884687 () Bool)

(assert (=> d!167503 (=> res!1082409 e!884687)))

(assert (=> d!167503 (= res!1082409 (or (is-Nil!36941 lt!677269) (is-Nil!36941 (t!51858 lt!677269))))))

(assert (=> d!167503 (= (isStrictlySorted!1169 lt!677269) e!884687)))

(declare-fun b!1584752 () Bool)

(declare-fun e!884688 () Bool)

(assert (=> b!1584752 (= e!884687 e!884688)))

(declare-fun res!1082410 () Bool)

(assert (=> b!1584752 (=> (not res!1082410) (not e!884688))))

(assert (=> b!1584752 (= res!1082410 (bvslt (_1!12919 (h!38483 lt!677269)) (_1!12919 (h!38483 (t!51858 lt!677269)))))))

(declare-fun b!1584753 () Bool)

(assert (=> b!1584753 (= e!884688 (isStrictlySorted!1169 (t!51858 lt!677269)))))

(assert (= (and d!167503 (not res!1082409)) b!1584752))

(assert (= (and b!1584752 res!1082410) b!1584753))

(declare-fun m!1453889 () Bool)

(assert (=> b!1584753 m!1453889))

(assert (=> d!167461 d!167503))

(assert (=> d!167461 d!167475))

(declare-fun d!167505 () Bool)

(assert (=> d!167505 (= ($colon$colon!1022 e!884579 (ite c!146865 (h!38483 l!1251) (tuple2!25817 newKey!123 newValue!123))) (Cons!36940 (ite c!146865 (h!38483 l!1251) (tuple2!25817 newKey!123 newValue!123)) e!884579))))

(assert (=> bm!72548 d!167505))

(declare-fun b!1584754 () Bool)

(declare-fun e!884691 () List!36944)

(declare-fun e!884693 () List!36944)

(assert (=> b!1584754 (= e!884691 e!884693)))

(declare-fun c!146906 () Bool)

(assert (=> b!1584754 (= c!146906 (and (is-Cons!36940 (t!51858 (t!51858 l!1251))) (= (_1!12919 (h!38483 (t!51858 (t!51858 l!1251)))) newKey!123)))))

(declare-fun b!1584755 () Bool)

(declare-fun call!72581 () List!36944)

(assert (=> b!1584755 (= e!884691 call!72581)))

(declare-fun b!1584756 () Bool)

(declare-fun call!72580 () List!36944)

(assert (=> b!1584756 (= e!884693 call!72580)))

(declare-fun b!1584757 () Bool)

(declare-fun lt!677290 () List!36944)

(declare-fun e!884692 () Bool)

(assert (=> b!1584757 (= e!884692 (contains!10526 lt!677290 (tuple2!25817 newKey!123 newValue!123)))))

(declare-fun d!167507 () Bool)

(assert (=> d!167507 e!884692))

(declare-fun res!1082412 () Bool)

(assert (=> d!167507 (=> (not res!1082412) (not e!884692))))

(assert (=> d!167507 (= res!1082412 (isStrictlySorted!1169 lt!677290))))

(assert (=> d!167507 (= lt!677290 e!884691)))

(declare-fun c!146905 () Bool)

(assert (=> d!167507 (= c!146905 (and (is-Cons!36940 (t!51858 (t!51858 l!1251))) (bvslt (_1!12919 (h!38483 (t!51858 (t!51858 l!1251)))) newKey!123)))))

(assert (=> d!167507 (isStrictlySorted!1169 (t!51858 (t!51858 l!1251)))))

(assert (=> d!167507 (= (insertStrictlySorted!626 (t!51858 (t!51858 l!1251)) newKey!123 newValue!123) lt!677290)))

(declare-fun b!1584758 () Bool)

(declare-fun e!884690 () List!36944)

(declare-fun call!72579 () List!36944)

(assert (=> b!1584758 (= e!884690 call!72579)))

(declare-fun b!1584759 () Bool)

(assert (=> b!1584759 (= e!884690 call!72579)))

(declare-fun b!1584760 () Bool)

(declare-fun e!884689 () List!36944)

(assert (=> b!1584760 (= e!884689 (insertStrictlySorted!626 (t!51858 (t!51858 (t!51858 l!1251))) newKey!123 newValue!123))))

(declare-fun b!1584761 () Bool)

(declare-fun res!1082411 () Bool)

(assert (=> b!1584761 (=> (not res!1082411) (not e!884692))))

(assert (=> b!1584761 (= res!1082411 (containsKey!1003 lt!677290 newKey!123))))

(declare-fun bm!72576 () Bool)

(assert (=> bm!72576 (= call!72579 call!72580)))

(declare-fun c!146907 () Bool)

(declare-fun b!1584762 () Bool)

(assert (=> b!1584762 (= e!884689 (ite c!146906 (t!51858 (t!51858 (t!51858 l!1251))) (ite c!146907 (Cons!36940 (h!38483 (t!51858 (t!51858 l!1251))) (t!51858 (t!51858 (t!51858 l!1251)))) Nil!36941)))))

(declare-fun b!1584763 () Bool)

(assert (=> b!1584763 (= c!146907 (and (is-Cons!36940 (t!51858 (t!51858 l!1251))) (bvsgt (_1!12919 (h!38483 (t!51858 (t!51858 l!1251)))) newKey!123)))))

(assert (=> b!1584763 (= e!884693 e!884690)))

(declare-fun bm!72577 () Bool)

(assert (=> bm!72577 (= call!72580 call!72581)))

(declare-fun bm!72578 () Bool)

(assert (=> bm!72578 (= call!72581 ($colon$colon!1022 e!884689 (ite c!146905 (h!38483 (t!51858 (t!51858 l!1251))) (tuple2!25817 newKey!123 newValue!123))))))

(declare-fun c!146904 () Bool)

(assert (=> bm!72578 (= c!146904 c!146905)))

(assert (= (and d!167507 c!146905) b!1584755))

(assert (= (and d!167507 (not c!146905)) b!1584754))

(assert (= (and b!1584754 c!146906) b!1584756))

(assert (= (and b!1584754 (not c!146906)) b!1584763))

(assert (= (and b!1584763 c!146907) b!1584758))

(assert (= (and b!1584763 (not c!146907)) b!1584759))

(assert (= (or b!1584758 b!1584759) bm!72576))

(assert (= (or b!1584756 bm!72576) bm!72577))

(assert (= (or b!1584755 bm!72577) bm!72578))

(assert (= (and bm!72578 c!146904) b!1584760))

(assert (= (and bm!72578 (not c!146904)) b!1584762))

(assert (= (and d!167507 res!1082412) b!1584761))

(assert (= (and b!1584761 res!1082411) b!1584757))

(declare-fun m!1453891 () Bool)

(assert (=> bm!72578 m!1453891))

(declare-fun m!1453893 () Bool)

(assert (=> b!1584757 m!1453893))

(declare-fun m!1453895 () Bool)

(assert (=> b!1584761 m!1453895))

(declare-fun m!1453897 () Bool)

(assert (=> d!167507 m!1453897))

(assert (=> d!167507 m!1453827))

(declare-fun m!1453899 () Bool)

(assert (=> b!1584760 m!1453899))

(assert (=> b!1584595 d!167507))

(declare-fun d!167509 () Bool)

(declare-fun res!1082413 () Bool)

(declare-fun e!884694 () Bool)

(assert (=> d!167509 (=> res!1082413 e!884694)))

(assert (=> d!167509 (= res!1082413 (or (is-Nil!36941 lt!677268) (is-Nil!36941 (t!51858 lt!677268))))))

(assert (=> d!167509 (= (isStrictlySorted!1169 lt!677268) e!884694)))

(declare-fun b!1584764 () Bool)

(declare-fun e!884695 () Bool)

(assert (=> b!1584764 (= e!884694 e!884695)))

(declare-fun res!1082414 () Bool)

(assert (=> b!1584764 (=> (not res!1082414) (not e!884695))))

(assert (=> b!1584764 (= res!1082414 (bvslt (_1!12919 (h!38483 lt!677268)) (_1!12919 (h!38483 (t!51858 lt!677268)))))))

(declare-fun b!1584765 () Bool)

(assert (=> b!1584765 (= e!884695 (isStrictlySorted!1169 (t!51858 lt!677268)))))

(assert (= (and d!167509 (not res!1082413)) b!1584764))

(assert (= (and b!1584764 res!1082414) b!1584765))

(declare-fun m!1453901 () Bool)

(assert (=> b!1584765 m!1453901))

(assert (=> d!167443 d!167509))

(assert (=> d!167443 d!167469))

(declare-fun d!167511 () Bool)

(declare-fun res!1082415 () Bool)

(declare-fun e!884696 () Bool)

(assert (=> d!167511 (=> res!1082415 e!884696)))

(assert (=> d!167511 (= res!1082415 (and (is-Cons!36940 lt!677269) (= (_1!12919 (h!38483 lt!677269)) newKey!123)))))

(assert (=> d!167511 (= (containsKey!1003 lt!677269 newKey!123) e!884696)))

(declare-fun b!1584766 () Bool)

(declare-fun e!884697 () Bool)

(assert (=> b!1584766 (= e!884696 e!884697)))

(declare-fun res!1082416 () Bool)

(assert (=> b!1584766 (=> (not res!1082416) (not e!884697))))

(assert (=> b!1584766 (= res!1082416 (and (or (not (is-Cons!36940 lt!677269)) (bvsle (_1!12919 (h!38483 lt!677269)) newKey!123)) (is-Cons!36940 lt!677269) (bvslt (_1!12919 (h!38483 lt!677269)) newKey!123)))))

(declare-fun b!1584767 () Bool)

(assert (=> b!1584767 (= e!884697 (containsKey!1003 (t!51858 lt!677269) newKey!123))))

(assert (= (and d!167511 (not res!1082415)) b!1584766))

(assert (= (and b!1584766 res!1082416) b!1584767))

(declare-fun m!1453903 () Bool)

(assert (=> b!1584767 m!1453903))

(assert (=> b!1584596 d!167511))

(assert (=> b!1584658 d!167475))

(declare-fun lt!677291 () Bool)

(declare-fun d!167513 () Bool)

(assert (=> d!167513 (= lt!677291 (set.member (tuple2!25817 newKey!123 newValue!123) (content!861 lt!677268)))))

(declare-fun e!884698 () Bool)

(assert (=> d!167513 (= lt!677291 e!884698)))

(declare-fun res!1082418 () Bool)

(assert (=> d!167513 (=> (not res!1082418) (not e!884698))))

(assert (=> d!167513 (= res!1082418 (is-Cons!36940 lt!677268))))

(assert (=> d!167513 (= (contains!10526 lt!677268 (tuple2!25817 newKey!123 newValue!123)) lt!677291)))

(declare-fun b!1584768 () Bool)

(declare-fun e!884699 () Bool)

(assert (=> b!1584768 (= e!884698 e!884699)))

(declare-fun res!1082417 () Bool)

(assert (=> b!1584768 (=> res!1082417 e!884699)))

(assert (=> b!1584768 (= res!1082417 (= (h!38483 lt!677268) (tuple2!25817 newKey!123 newValue!123)))))

(declare-fun b!1584769 () Bool)

(assert (=> b!1584769 (= e!884699 (contains!10526 (t!51858 lt!677268) (tuple2!25817 newKey!123 newValue!123)))))

(assert (= (and d!167513 res!1082418) b!1584768))

(assert (= (and b!1584768 (not res!1082417)) b!1584769))

(declare-fun m!1453905 () Bool)

(assert (=> d!167513 m!1453905))

(declare-fun m!1453907 () Bool)

(assert (=> d!167513 m!1453907))

(declare-fun m!1453909 () Bool)

(assert (=> b!1584769 m!1453909))

(assert (=> b!1584582 d!167513))

(assert (=> b!1584585 d!167461))

(declare-fun d!167515 () Bool)

(declare-fun res!1082419 () Bool)

(declare-fun e!884700 () Bool)

(assert (=> d!167515 (=> res!1082419 e!884700)))

(assert (=> d!167515 (= res!1082419 (and (is-Cons!36940 lt!677268) (= (_1!12919 (h!38483 lt!677268)) newKey!123)))))

(assert (=> d!167515 (= (containsKey!1003 lt!677268 newKey!123) e!884700)))

(declare-fun b!1584770 () Bool)

(declare-fun e!884701 () Bool)

(assert (=> b!1584770 (= e!884700 e!884701)))

(declare-fun res!1082420 () Bool)

(assert (=> b!1584770 (=> (not res!1082420) (not e!884701))))

(assert (=> b!1584770 (= res!1082420 (and (or (not (is-Cons!36940 lt!677268)) (bvsle (_1!12919 (h!38483 lt!677268)) newKey!123)) (is-Cons!36940 lt!677268) (bvslt (_1!12919 (h!38483 lt!677268)) newKey!123)))))

(declare-fun b!1584771 () Bool)

(assert (=> b!1584771 (= e!884701 (containsKey!1003 (t!51858 lt!677268) newKey!123))))

(assert (= (and d!167515 (not res!1082419)) b!1584770))

(assert (= (and b!1584770 res!1082420) b!1584771))

(declare-fun m!1453911 () Bool)

(assert (=> b!1584771 m!1453911))

(assert (=> b!1584586 d!167515))

(declare-fun d!167517 () Bool)

(declare-fun res!1082421 () Bool)

(declare-fun e!884702 () Bool)

(assert (=> d!167517 (=> res!1082421 e!884702)))

(assert (=> d!167517 (= res!1082421 (or (is-Nil!36941 (t!51858 (t!51858 l!1251))) (is-Nil!36941 (t!51858 (t!51858 (t!51858 l!1251))))))))

(assert (=> d!167517 (= (isStrictlySorted!1169 (t!51858 (t!51858 l!1251))) e!884702)))

(declare-fun b!1584772 () Bool)

(declare-fun e!884703 () Bool)

(assert (=> b!1584772 (= e!884702 e!884703)))

(declare-fun res!1082422 () Bool)

(assert (=> b!1584772 (=> (not res!1082422) (not e!884703))))

(assert (=> b!1584772 (= res!1082422 (bvslt (_1!12919 (h!38483 (t!51858 (t!51858 l!1251)))) (_1!12919 (h!38483 (t!51858 (t!51858 (t!51858 l!1251)))))))))

(declare-fun b!1584773 () Bool)

(assert (=> b!1584773 (= e!884703 (isStrictlySorted!1169 (t!51858 (t!51858 (t!51858 l!1251)))))))

(assert (= (and d!167517 (not res!1082421)) b!1584772))

(assert (= (and b!1584772 res!1082422) b!1584773))

(declare-fun m!1453913 () Bool)

(assert (=> b!1584773 m!1453913))

(assert (=> b!1584664 d!167517))

(declare-fun d!167519 () Bool)

(assert (=> d!167519 (= ($colon$colon!1022 e!884584 (ite c!146869 (h!38483 (t!51858 l!1251)) (tuple2!25817 newKey!123 newValue!123))) (Cons!36940 (ite c!146869 (h!38483 (t!51858 l!1251)) (tuple2!25817 newKey!123 newValue!123)) e!884584))))

(assert (=> bm!72551 d!167519))

(declare-fun b!1584774 () Bool)

(declare-fun e!884704 () Bool)

(declare-fun tp!115136 () Bool)

(assert (=> b!1584774 (= e!884704 (and tp_is_empty!39457 tp!115136))))

(assert (=> b!1584669 (= tp!115129 e!884704)))

(assert (= (and b!1584669 (is-Cons!36940 (t!51858 (t!51858 l!1251)))) b!1584774))

(push 1)

(assert (not b!1584761))

(assert (not b!1584773))

(assert (not b!1584753))

(assert (not b!1584747))

(assert (not b!1584749))

(assert (not d!167493))

(assert (not b!1584774))

(assert (not bm!72578))

(assert (not b!1584741))

(assert (not d!167497))

(assert (not d!167513))

(assert (not b!1584765))

(assert (not b!1584767))

(assert (not b!1584760))

(assert (not b!1584769))

(assert (not b!1584771))

(assert (not b!1584757))

(assert (not d!167507))

(assert (not b!1584751))

(assert tp_is_empty!39457)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

