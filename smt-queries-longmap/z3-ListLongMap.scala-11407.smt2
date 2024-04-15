; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132768 () Bool)

(assert start!132768)

(declare-fun b!1555487 () Bool)

(declare-fun e!866247 () Bool)

(declare-fun e!866249 () Bool)

(assert (=> b!1555487 (= e!866247 e!866249)))

(declare-fun res!1064337 () Bool)

(assert (=> b!1555487 (=> (not res!1064337) (not e!866249))))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-datatypes ((B!2318 0))(
  ( (B!2319 (val!19245 Int)) )
))
(declare-datatypes ((tuple2!24938 0))(
  ( (tuple2!24939 (_1!12480 (_ BitVec 64)) (_2!12480 B!2318)) )
))
(declare-datatypes ((List!36324 0))(
  ( (Nil!36321) (Cons!36320 (h!37767 tuple2!24938) (t!51037 List!36324)) )
))
(declare-fun lt!670060 () List!36324)

(declare-fun l!1177 () List!36324)

(declare-fun containsKey!801 (List!36324 (_ BitVec 64)) Bool)

(assert (=> b!1555487 (= res!1064337 (= (containsKey!801 lt!670060 otherKey!50) (containsKey!801 l!1177 otherKey!50)))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun newValue!105 () B!2318)

(declare-fun insertStrictlySorted!544 (List!36324 (_ BitVec 64) B!2318) List!36324)

(assert (=> b!1555487 (= lt!670060 (insertStrictlySorted!544 l!1177 newKey!105 newValue!105))))

(declare-fun b!1555488 () Bool)

(declare-fun isStrictlySorted!930 (List!36324) Bool)

(assert (=> b!1555488 (= e!866249 (not (isStrictlySorted!930 lt!670060)))))

(declare-fun res!1064338 () Bool)

(assert (=> start!132768 (=> (not res!1064338) (not e!866247))))

(assert (=> start!132768 (= res!1064338 (isStrictlySorted!930 l!1177))))

(assert (=> start!132768 e!866247))

(declare-fun e!866248 () Bool)

(assert (=> start!132768 e!866248))

(assert (=> start!132768 true))

(declare-fun tp_is_empty!38329 () Bool)

(assert (=> start!132768 tp_is_empty!38329))

(declare-fun b!1555486 () Bool)

(declare-fun res!1064336 () Bool)

(assert (=> b!1555486 (=> (not res!1064336) (not e!866247))))

(get-info :version)

(assert (=> b!1555486 (= res!1064336 (and (not (= newKey!105 otherKey!50)) (or (not ((_ is Cons!36320) l!1177)) (= (_1!12480 (h!37767 l!1177)) otherKey!50))))))

(declare-fun b!1555489 () Bool)

(declare-fun tp!112345 () Bool)

(assert (=> b!1555489 (= e!866248 (and tp_is_empty!38329 tp!112345))))

(assert (= (and start!132768 res!1064338) b!1555486))

(assert (= (and b!1555486 res!1064336) b!1555487))

(assert (= (and b!1555487 res!1064337) b!1555488))

(assert (= (and start!132768 ((_ is Cons!36320) l!1177)) b!1555489))

(declare-fun m!1432757 () Bool)

(assert (=> b!1555487 m!1432757))

(declare-fun m!1432759 () Bool)

(assert (=> b!1555487 m!1432759))

(declare-fun m!1432761 () Bool)

(assert (=> b!1555487 m!1432761))

(declare-fun m!1432763 () Bool)

(assert (=> b!1555488 m!1432763))

(declare-fun m!1432765 () Bool)

(assert (=> start!132768 m!1432765))

(check-sat (not b!1555489) (not b!1555488) tp_is_empty!38329 (not b!1555487) (not start!132768))
(check-sat)
(get-model)

(declare-fun d!161761 () Bool)

(declare-fun res!1064361 () Bool)

(declare-fun e!866272 () Bool)

(assert (=> d!161761 (=> res!1064361 e!866272)))

(assert (=> d!161761 (= res!1064361 (or ((_ is Nil!36321) l!1177) ((_ is Nil!36321) (t!51037 l!1177))))))

(assert (=> d!161761 (= (isStrictlySorted!930 l!1177) e!866272)))

(declare-fun b!1555518 () Bool)

(declare-fun e!866273 () Bool)

(assert (=> b!1555518 (= e!866272 e!866273)))

(declare-fun res!1064362 () Bool)

(assert (=> b!1555518 (=> (not res!1064362) (not e!866273))))

(assert (=> b!1555518 (= res!1064362 (bvslt (_1!12480 (h!37767 l!1177)) (_1!12480 (h!37767 (t!51037 l!1177)))))))

(declare-fun b!1555519 () Bool)

(assert (=> b!1555519 (= e!866273 (isStrictlySorted!930 (t!51037 l!1177)))))

(assert (= (and d!161761 (not res!1064361)) b!1555518))

(assert (= (and b!1555518 res!1064362) b!1555519))

(declare-fun m!1432787 () Bool)

(assert (=> b!1555519 m!1432787))

(assert (=> start!132768 d!161761))

(declare-fun d!161763 () Bool)

(declare-fun res!1064363 () Bool)

(declare-fun e!866274 () Bool)

(assert (=> d!161763 (=> res!1064363 e!866274)))

(assert (=> d!161763 (= res!1064363 (or ((_ is Nil!36321) lt!670060) ((_ is Nil!36321) (t!51037 lt!670060))))))

(assert (=> d!161763 (= (isStrictlySorted!930 lt!670060) e!866274)))

(declare-fun b!1555520 () Bool)

(declare-fun e!866275 () Bool)

(assert (=> b!1555520 (= e!866274 e!866275)))

(declare-fun res!1064364 () Bool)

(assert (=> b!1555520 (=> (not res!1064364) (not e!866275))))

(assert (=> b!1555520 (= res!1064364 (bvslt (_1!12480 (h!37767 lt!670060)) (_1!12480 (h!37767 (t!51037 lt!670060)))))))

(declare-fun b!1555521 () Bool)

(assert (=> b!1555521 (= e!866275 (isStrictlySorted!930 (t!51037 lt!670060)))))

(assert (= (and d!161763 (not res!1064363)) b!1555520))

(assert (= (and b!1555520 res!1064364) b!1555521))

(declare-fun m!1432789 () Bool)

(assert (=> b!1555521 m!1432789))

(assert (=> b!1555488 d!161763))

(declare-fun d!161765 () Bool)

(declare-fun res!1064373 () Bool)

(declare-fun e!866284 () Bool)

(assert (=> d!161765 (=> res!1064373 e!866284)))

(assert (=> d!161765 (= res!1064373 (and ((_ is Cons!36320) lt!670060) (= (_1!12480 (h!37767 lt!670060)) otherKey!50)))))

(assert (=> d!161765 (= (containsKey!801 lt!670060 otherKey!50) e!866284)))

(declare-fun b!1555530 () Bool)

(declare-fun e!866285 () Bool)

(assert (=> b!1555530 (= e!866284 e!866285)))

(declare-fun res!1064374 () Bool)

(assert (=> b!1555530 (=> (not res!1064374) (not e!866285))))

(assert (=> b!1555530 (= res!1064374 (and (or (not ((_ is Cons!36320) lt!670060)) (bvsle (_1!12480 (h!37767 lt!670060)) otherKey!50)) ((_ is Cons!36320) lt!670060) (bvslt (_1!12480 (h!37767 lt!670060)) otherKey!50)))))

(declare-fun b!1555531 () Bool)

(assert (=> b!1555531 (= e!866285 (containsKey!801 (t!51037 lt!670060) otherKey!50))))

(assert (= (and d!161765 (not res!1064373)) b!1555530))

(assert (= (and b!1555530 res!1064374) b!1555531))

(declare-fun m!1432791 () Bool)

(assert (=> b!1555531 m!1432791))

(assert (=> b!1555487 d!161765))

(declare-fun d!161769 () Bool)

(declare-fun res!1064375 () Bool)

(declare-fun e!866286 () Bool)

(assert (=> d!161769 (=> res!1064375 e!866286)))

(assert (=> d!161769 (= res!1064375 (and ((_ is Cons!36320) l!1177) (= (_1!12480 (h!37767 l!1177)) otherKey!50)))))

(assert (=> d!161769 (= (containsKey!801 l!1177 otherKey!50) e!866286)))

(declare-fun b!1555532 () Bool)

(declare-fun e!866287 () Bool)

(assert (=> b!1555532 (= e!866286 e!866287)))

(declare-fun res!1064376 () Bool)

(assert (=> b!1555532 (=> (not res!1064376) (not e!866287))))

(assert (=> b!1555532 (= res!1064376 (and (or (not ((_ is Cons!36320) l!1177)) (bvsle (_1!12480 (h!37767 l!1177)) otherKey!50)) ((_ is Cons!36320) l!1177) (bvslt (_1!12480 (h!37767 l!1177)) otherKey!50)))))

(declare-fun b!1555533 () Bool)

(assert (=> b!1555533 (= e!866287 (containsKey!801 (t!51037 l!1177) otherKey!50))))

(assert (= (and d!161769 (not res!1064375)) b!1555532))

(assert (= (and b!1555532 res!1064376) b!1555533))

(declare-fun m!1432793 () Bool)

(assert (=> b!1555533 m!1432793))

(assert (=> b!1555487 d!161769))

(declare-fun call!71535 () List!36324)

(declare-fun bm!71532 () Bool)

(declare-fun e!866335 () List!36324)

(declare-fun c!143606 () Bool)

(declare-fun $colon$colon!965 (List!36324 tuple2!24938) List!36324)

(assert (=> bm!71532 (= call!71535 ($colon$colon!965 e!866335 (ite c!143606 (h!37767 l!1177) (tuple2!24939 newKey!105 newValue!105))))))

(declare-fun c!143603 () Bool)

(assert (=> bm!71532 (= c!143603 c!143606)))

(declare-fun bm!71533 () Bool)

(declare-fun call!71536 () List!36324)

(declare-fun call!71537 () List!36324)

(assert (=> bm!71533 (= call!71536 call!71537)))

(declare-fun d!161773 () Bool)

(declare-fun e!866333 () Bool)

(assert (=> d!161773 e!866333))

(declare-fun res!1064401 () Bool)

(assert (=> d!161773 (=> (not res!1064401) (not e!866333))))

(declare-fun lt!670073 () List!36324)

(assert (=> d!161773 (= res!1064401 (isStrictlySorted!930 lt!670073))))

(declare-fun e!866334 () List!36324)

(assert (=> d!161773 (= lt!670073 e!866334)))

(assert (=> d!161773 (= c!143606 (and ((_ is Cons!36320) l!1177) (bvslt (_1!12480 (h!37767 l!1177)) newKey!105)))))

(assert (=> d!161773 (isStrictlySorted!930 l!1177)))

(assert (=> d!161773 (= (insertStrictlySorted!544 l!1177 newKey!105 newValue!105) lt!670073)))

(declare-fun b!1555602 () Bool)

(declare-fun e!866336 () List!36324)

(assert (=> b!1555602 (= e!866336 call!71536)))

(declare-fun bm!71534 () Bool)

(assert (=> bm!71534 (= call!71537 call!71535)))

(declare-fun c!143604 () Bool)

(declare-fun c!143605 () Bool)

(declare-fun b!1555603 () Bool)

(assert (=> b!1555603 (= e!866335 (ite c!143605 (t!51037 l!1177) (ite c!143604 (Cons!36320 (h!37767 l!1177) (t!51037 l!1177)) Nil!36321)))))

(declare-fun b!1555604 () Bool)

(declare-fun e!866332 () List!36324)

(assert (=> b!1555604 (= e!866332 call!71537)))

(declare-fun b!1555605 () Bool)

(assert (=> b!1555605 (= e!866334 e!866332)))

(assert (=> b!1555605 (= c!143605 (and ((_ is Cons!36320) l!1177) (= (_1!12480 (h!37767 l!1177)) newKey!105)))))

(declare-fun b!1555606 () Bool)

(assert (=> b!1555606 (= e!866336 call!71536)))

(declare-fun b!1555607 () Bool)

(assert (=> b!1555607 (= e!866335 (insertStrictlySorted!544 (t!51037 l!1177) newKey!105 newValue!105))))

(declare-fun b!1555608 () Bool)

(assert (=> b!1555608 (= c!143604 (and ((_ is Cons!36320) l!1177) (bvsgt (_1!12480 (h!37767 l!1177)) newKey!105)))))

(assert (=> b!1555608 (= e!866332 e!866336)))

(declare-fun b!1555609 () Bool)

(assert (=> b!1555609 (= e!866334 call!71535)))

(declare-fun b!1555610 () Bool)

(declare-fun res!1064402 () Bool)

(assert (=> b!1555610 (=> (not res!1064402) (not e!866333))))

(assert (=> b!1555610 (= res!1064402 (containsKey!801 lt!670073 newKey!105))))

(declare-fun b!1555611 () Bool)

(declare-fun contains!10138 (List!36324 tuple2!24938) Bool)

(assert (=> b!1555611 (= e!866333 (contains!10138 lt!670073 (tuple2!24939 newKey!105 newValue!105)))))

(assert (= (and d!161773 c!143606) b!1555609))

(assert (= (and d!161773 (not c!143606)) b!1555605))

(assert (= (and b!1555605 c!143605) b!1555604))

(assert (= (and b!1555605 (not c!143605)) b!1555608))

(assert (= (and b!1555608 c!143604) b!1555606))

(assert (= (and b!1555608 (not c!143604)) b!1555602))

(assert (= (or b!1555606 b!1555602) bm!71533))

(assert (= (or b!1555604 bm!71533) bm!71534))

(assert (= (or b!1555609 bm!71534) bm!71532))

(assert (= (and bm!71532 c!143603) b!1555607))

(assert (= (and bm!71532 (not c!143603)) b!1555603))

(assert (= (and d!161773 res!1064401) b!1555610))

(assert (= (and b!1555610 res!1064402) b!1555611))

(declare-fun m!1432807 () Bool)

(assert (=> d!161773 m!1432807))

(assert (=> d!161773 m!1432765))

(declare-fun m!1432809 () Bool)

(assert (=> b!1555607 m!1432809))

(declare-fun m!1432811 () Bool)

(assert (=> b!1555611 m!1432811))

(declare-fun m!1432813 () Bool)

(assert (=> bm!71532 m!1432813))

(declare-fun m!1432815 () Bool)

(assert (=> b!1555610 m!1432815))

(assert (=> b!1555487 d!161773))

(declare-fun b!1555628 () Bool)

(declare-fun e!866345 () Bool)

(declare-fun tp!112354 () Bool)

(assert (=> b!1555628 (= e!866345 (and tp_is_empty!38329 tp!112354))))

(assert (=> b!1555489 (= tp!112345 e!866345)))

(assert (= (and b!1555489 ((_ is Cons!36320) (t!51037 l!1177))) b!1555628))

(check-sat (not b!1555533) (not b!1555607) (not b!1555519) (not b!1555531) (not b!1555521) (not d!161773) tp_is_empty!38329 (not b!1555611) (not bm!71532) (not b!1555628) (not b!1555610))
(check-sat)
