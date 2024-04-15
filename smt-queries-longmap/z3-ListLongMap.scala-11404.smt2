; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132738 () Bool)

(assert start!132738)

(declare-fun res!1064256 () Bool)

(declare-fun e!866123 () Bool)

(assert (=> start!132738 (=> (not res!1064256) (not e!866123))))

(declare-datatypes ((B!2300 0))(
  ( (B!2301 (val!19236 Int)) )
))
(declare-datatypes ((tuple2!24920 0))(
  ( (tuple2!24921 (_1!12471 (_ BitVec 64)) (_2!12471 B!2300)) )
))
(declare-datatypes ((List!36315 0))(
  ( (Nil!36312) (Cons!36311 (h!37758 tuple2!24920) (t!51028 List!36315)) )
))
(declare-fun l!1177 () List!36315)

(declare-fun isStrictlySorted!924 (List!36315) Bool)

(assert (=> start!132738 (= res!1064256 (isStrictlySorted!924 l!1177))))

(assert (=> start!132738 e!866123))

(declare-fun e!866122 () Bool)

(assert (=> start!132738 e!866122))

(assert (=> start!132738 true))

(declare-fun tp_is_empty!38311 () Bool)

(assert (=> start!132738 tp_is_empty!38311))

(declare-fun b!1555292 () Bool)

(declare-fun res!1064257 () Bool)

(assert (=> b!1555292 (=> (not res!1064257) (not e!866123))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1555292 (= res!1064257 (and (not (= newKey!105 otherKey!50)) (or (not ((_ is Cons!36311) l!1177)) (= (_1!12471 (h!37758 l!1177)) otherKey!50))))))

(declare-fun newValue!105 () B!2300)

(declare-fun b!1555293 () Bool)

(declare-fun insertStrictlySorted!538 (List!36315 (_ BitVec 64) B!2300) List!36315)

(assert (=> b!1555293 (= e!866123 (not (isStrictlySorted!924 (insertStrictlySorted!538 l!1177 newKey!105 newValue!105))))))

(declare-fun b!1555294 () Bool)

(declare-fun tp!112309 () Bool)

(assert (=> b!1555294 (= e!866122 (and tp_is_empty!38311 tp!112309))))

(assert (= (and start!132738 res!1064256) b!1555292))

(assert (= (and b!1555292 res!1064257) b!1555293))

(assert (= (and start!132738 ((_ is Cons!36311) l!1177)) b!1555294))

(declare-fun m!1432679 () Bool)

(assert (=> start!132738 m!1432679))

(declare-fun m!1432681 () Bool)

(assert (=> b!1555293 m!1432681))

(assert (=> b!1555293 m!1432681))

(declare-fun m!1432683 () Bool)

(assert (=> b!1555293 m!1432683))

(check-sat (not b!1555293) (not start!132738) (not b!1555294) tp_is_empty!38311)
(check-sat)
(get-model)

(declare-fun d!161737 () Bool)

(declare-fun res!1064274 () Bool)

(declare-fun e!866140 () Bool)

(assert (=> d!161737 (=> res!1064274 e!866140)))

(assert (=> d!161737 (= res!1064274 (or ((_ is Nil!36312) (insertStrictlySorted!538 l!1177 newKey!105 newValue!105)) ((_ is Nil!36312) (t!51028 (insertStrictlySorted!538 l!1177 newKey!105 newValue!105)))))))

(assert (=> d!161737 (= (isStrictlySorted!924 (insertStrictlySorted!538 l!1177 newKey!105 newValue!105)) e!866140)))

(declare-fun b!1555317 () Bool)

(declare-fun e!866141 () Bool)

(assert (=> b!1555317 (= e!866140 e!866141)))

(declare-fun res!1064275 () Bool)

(assert (=> b!1555317 (=> (not res!1064275) (not e!866141))))

(assert (=> b!1555317 (= res!1064275 (bvslt (_1!12471 (h!37758 (insertStrictlySorted!538 l!1177 newKey!105 newValue!105))) (_1!12471 (h!37758 (t!51028 (insertStrictlySorted!538 l!1177 newKey!105 newValue!105))))))))

(declare-fun b!1555318 () Bool)

(assert (=> b!1555318 (= e!866141 (isStrictlySorted!924 (t!51028 (insertStrictlySorted!538 l!1177 newKey!105 newValue!105))))))

(assert (= (and d!161737 (not res!1064274)) b!1555317))

(assert (= (and b!1555317 res!1064275) b!1555318))

(declare-fun m!1432697 () Bool)

(assert (=> b!1555318 m!1432697))

(assert (=> b!1555293 d!161737))

(declare-fun b!1555387 () Bool)

(declare-fun e!866184 () List!36315)

(declare-fun call!71512 () List!36315)

(assert (=> b!1555387 (= e!866184 call!71512)))

(declare-fun d!161739 () Bool)

(declare-fun e!866183 () Bool)

(assert (=> d!161739 e!866183))

(declare-fun res!1064296 () Bool)

(assert (=> d!161739 (=> (not res!1064296) (not e!866183))))

(declare-fun lt!670046 () List!36315)

(assert (=> d!161739 (= res!1064296 (isStrictlySorted!924 lt!670046))))

(declare-fun e!866185 () List!36315)

(assert (=> d!161739 (= lt!670046 e!866185)))

(declare-fun c!143570 () Bool)

(assert (=> d!161739 (= c!143570 (and ((_ is Cons!36311) l!1177) (bvslt (_1!12471 (h!37758 l!1177)) newKey!105)))))

(assert (=> d!161739 (isStrictlySorted!924 l!1177)))

(assert (=> d!161739 (= (insertStrictlySorted!538 l!1177 newKey!105 newValue!105) lt!670046)))

(declare-fun bm!71507 () Bool)

(declare-fun call!71510 () List!36315)

(assert (=> bm!71507 (= call!71512 call!71510)))

(declare-fun b!1555388 () Bool)

(declare-fun c!143572 () Bool)

(declare-fun c!143569 () Bool)

(declare-fun e!866182 () List!36315)

(assert (=> b!1555388 (= e!866182 (ite c!143572 (t!51028 l!1177) (ite c!143569 (Cons!36311 (h!37758 l!1177) (t!51028 l!1177)) Nil!36312)))))

(declare-fun b!1555389 () Bool)

(declare-fun contains!10134 (List!36315 tuple2!24920) Bool)

(assert (=> b!1555389 (= e!866183 (contains!10134 lt!670046 (tuple2!24921 newKey!105 newValue!105)))))

(declare-fun b!1555390 () Bool)

(assert (=> b!1555390 (= e!866184 call!71512)))

(declare-fun b!1555391 () Bool)

(declare-fun call!71511 () List!36315)

(assert (=> b!1555391 (= e!866185 call!71511)))

(declare-fun b!1555392 () Bool)

(assert (=> b!1555392 (= e!866182 (insertStrictlySorted!538 (t!51028 l!1177) newKey!105 newValue!105))))

(declare-fun b!1555393 () Bool)

(declare-fun e!866186 () List!36315)

(assert (=> b!1555393 (= e!866186 call!71510)))

(declare-fun b!1555394 () Bool)

(assert (=> b!1555394 (= e!866185 e!866186)))

(assert (=> b!1555394 (= c!143572 (and ((_ is Cons!36311) l!1177) (= (_1!12471 (h!37758 l!1177)) newKey!105)))))

(declare-fun bm!71508 () Bool)

(assert (=> bm!71508 (= call!71510 call!71511)))

(declare-fun b!1555395 () Bool)

(declare-fun res!1064297 () Bool)

(assert (=> b!1555395 (=> (not res!1064297) (not e!866183))))

(declare-fun containsKey!796 (List!36315 (_ BitVec 64)) Bool)

(assert (=> b!1555395 (= res!1064297 (containsKey!796 lt!670046 newKey!105))))

(declare-fun bm!71509 () Bool)

(declare-fun $colon$colon!962 (List!36315 tuple2!24920) List!36315)

(assert (=> bm!71509 (= call!71511 ($colon$colon!962 e!866182 (ite c!143570 (h!37758 l!1177) (tuple2!24921 newKey!105 newValue!105))))))

(declare-fun c!143571 () Bool)

(assert (=> bm!71509 (= c!143571 c!143570)))

(declare-fun b!1555396 () Bool)

(assert (=> b!1555396 (= c!143569 (and ((_ is Cons!36311) l!1177) (bvsgt (_1!12471 (h!37758 l!1177)) newKey!105)))))

(assert (=> b!1555396 (= e!866186 e!866184)))

(assert (= (and d!161739 c!143570) b!1555391))

(assert (= (and d!161739 (not c!143570)) b!1555394))

(assert (= (and b!1555394 c!143572) b!1555393))

(assert (= (and b!1555394 (not c!143572)) b!1555396))

(assert (= (and b!1555396 c!143569) b!1555390))

(assert (= (and b!1555396 (not c!143569)) b!1555387))

(assert (= (or b!1555390 b!1555387) bm!71507))

(assert (= (or b!1555393 bm!71507) bm!71508))

(assert (= (or b!1555391 bm!71508) bm!71509))

(assert (= (and bm!71509 c!143571) b!1555392))

(assert (= (and bm!71509 (not c!143571)) b!1555388))

(assert (= (and d!161739 res!1064296) b!1555395))

(assert (= (and b!1555395 res!1064297) b!1555389))

(declare-fun m!1432703 () Bool)

(assert (=> b!1555395 m!1432703))

(declare-fun m!1432705 () Bool)

(assert (=> d!161739 m!1432705))

(assert (=> d!161739 m!1432679))

(declare-fun m!1432707 () Bool)

(assert (=> b!1555389 m!1432707))

(declare-fun m!1432709 () Bool)

(assert (=> b!1555392 m!1432709))

(declare-fun m!1432711 () Bool)

(assert (=> bm!71509 m!1432711))

(assert (=> b!1555293 d!161739))

(declare-fun d!161749 () Bool)

(declare-fun res!1064302 () Bool)

(declare-fun e!866189 () Bool)

(assert (=> d!161749 (=> res!1064302 e!866189)))

(assert (=> d!161749 (= res!1064302 (or ((_ is Nil!36312) l!1177) ((_ is Nil!36312) (t!51028 l!1177))))))

(assert (=> d!161749 (= (isStrictlySorted!924 l!1177) e!866189)))

(declare-fun b!1555401 () Bool)

(declare-fun e!866190 () Bool)

(assert (=> b!1555401 (= e!866189 e!866190)))

(declare-fun res!1064303 () Bool)

(assert (=> b!1555401 (=> (not res!1064303) (not e!866190))))

(assert (=> b!1555401 (= res!1064303 (bvslt (_1!12471 (h!37758 l!1177)) (_1!12471 (h!37758 (t!51028 l!1177)))))))

(declare-fun b!1555402 () Bool)

(assert (=> b!1555402 (= e!866190 (isStrictlySorted!924 (t!51028 l!1177)))))

(assert (= (and d!161749 (not res!1064302)) b!1555401))

(assert (= (and b!1555401 res!1064303) b!1555402))

(declare-fun m!1432713 () Bool)

(assert (=> b!1555402 m!1432713))

(assert (=> start!132738 d!161749))

(declare-fun b!1555407 () Bool)

(declare-fun e!866193 () Bool)

(declare-fun tp!112318 () Bool)

(assert (=> b!1555407 (= e!866193 (and tp_is_empty!38311 tp!112318))))

(assert (=> b!1555294 (= tp!112309 e!866193)))

(assert (= (and b!1555294 ((_ is Cons!36311) (t!51028 l!1177))) b!1555407))

(check-sat (not b!1555402) (not b!1555395) (not b!1555389) (not bm!71509) (not b!1555392) (not d!161739) tp_is_empty!38311 (not b!1555318) (not b!1555407))
(check-sat)
