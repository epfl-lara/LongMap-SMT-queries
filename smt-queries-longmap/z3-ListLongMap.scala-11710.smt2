; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137384 () Bool)

(assert start!137384)

(declare-fun res!1079963 () Bool)

(declare-fun e!882539 () Bool)

(assert (=> start!137384 (=> res!1079963 e!882539)))

(declare-datatypes ((B!2588 0))(
  ( (B!2589 (val!19656 Int)) )
))
(declare-datatypes ((tuple2!25474 0))(
  ( (tuple2!25475 (_1!12748 (_ BitVec 64)) (_2!12748 B!2588)) )
))
(declare-datatypes ((List!36808 0))(
  ( (Nil!36805) (Cons!36804 (h!38365 tuple2!25474) (t!51714 List!36808)) )
))
(declare-fun lt!677406 () List!36808)

(declare-fun isStrictlySorted!1025 (List!36808) Bool)

(assert (=> start!137384 (= res!1079963 (not (isStrictlySorted!1025 lt!677406)))))

(declare-datatypes ((ListLongMap!22821 0))(
  ( (ListLongMap!22822 (toList!11426 List!36808)) )
))
(declare-fun thiss!201 () ListLongMap!22821)

(declare-fun keyValue!4 () tuple2!25474)

(declare-fun insertStrictlySorted!609 (List!36808 (_ BitVec 64) B!2588) List!36808)

(assert (=> start!137384 (= lt!677406 (insertStrictlySorted!609 (toList!11426 thiss!201) (_1!12748 keyValue!4) (_2!12748 keyValue!4)))))

(assert (=> start!137384 e!882539))

(declare-fun e!882538 () Bool)

(declare-fun inv!58962 (ListLongMap!22821) Bool)

(assert (=> start!137384 (and (inv!58962 thiss!201) e!882538)))

(declare-fun tp_is_empty!39133 () Bool)

(assert (=> start!137384 tp_is_empty!39133))

(declare-fun b!1581805 () Bool)

(declare-fun res!1079962 () Bool)

(assert (=> b!1581805 (=> res!1079962 e!882539)))

(declare-fun containsKey!884 (List!36808 (_ BitVec 64)) Bool)

(assert (=> b!1581805 (= res!1079962 (not (containsKey!884 lt!677406 (_1!12748 keyValue!4))))))

(declare-fun b!1581806 () Bool)

(declare-fun contains!10493 (List!36808 tuple2!25474) Bool)

(assert (=> b!1581806 (= e!882539 (not (contains!10493 lt!677406 keyValue!4)))))

(declare-fun b!1581807 () Bool)

(declare-fun tp!114324 () Bool)

(assert (=> b!1581807 (= e!882538 tp!114324)))

(assert (= (and start!137384 (not res!1079963)) b!1581805))

(assert (= (and b!1581805 (not res!1079962)) b!1581806))

(assert (= start!137384 b!1581807))

(declare-fun m!1453485 () Bool)

(assert (=> start!137384 m!1453485))

(declare-fun m!1453487 () Bool)

(assert (=> start!137384 m!1453487))

(declare-fun m!1453489 () Bool)

(assert (=> start!137384 m!1453489))

(declare-fun m!1453491 () Bool)

(assert (=> b!1581805 m!1453491))

(declare-fun m!1453493 () Bool)

(assert (=> b!1581806 m!1453493))

(check-sat (not start!137384) (not b!1581806) (not b!1581805) (not b!1581807) tp_is_empty!39133)
(check-sat)
(get-model)

(declare-fun d!166973 () Bool)

(declare-fun res!1079980 () Bool)

(declare-fun e!882556 () Bool)

(assert (=> d!166973 (=> res!1079980 e!882556)))

(get-info :version)

(assert (=> d!166973 (= res!1079980 (and ((_ is Cons!36804) lt!677406) (= (_1!12748 (h!38365 lt!677406)) (_1!12748 keyValue!4))))))

(assert (=> d!166973 (= (containsKey!884 lt!677406 (_1!12748 keyValue!4)) e!882556)))

(declare-fun b!1581830 () Bool)

(declare-fun e!882557 () Bool)

(assert (=> b!1581830 (= e!882556 e!882557)))

(declare-fun res!1079981 () Bool)

(assert (=> b!1581830 (=> (not res!1079981) (not e!882557))))

(assert (=> b!1581830 (= res!1079981 (and (or (not ((_ is Cons!36804) lt!677406)) (bvsle (_1!12748 (h!38365 lt!677406)) (_1!12748 keyValue!4))) ((_ is Cons!36804) lt!677406) (bvslt (_1!12748 (h!38365 lt!677406)) (_1!12748 keyValue!4))))))

(declare-fun b!1581831 () Bool)

(assert (=> b!1581831 (= e!882557 (containsKey!884 (t!51714 lt!677406) (_1!12748 keyValue!4)))))

(assert (= (and d!166973 (not res!1079980)) b!1581830))

(assert (= (and b!1581830 res!1079981) b!1581831))

(declare-fun m!1453515 () Bool)

(assert (=> b!1581831 m!1453515))

(assert (=> b!1581805 d!166973))

(declare-fun d!166979 () Bool)

(declare-fun res!1079994 () Bool)

(declare-fun e!882570 () Bool)

(assert (=> d!166979 (=> res!1079994 e!882570)))

(assert (=> d!166979 (= res!1079994 (or ((_ is Nil!36805) lt!677406) ((_ is Nil!36805) (t!51714 lt!677406))))))

(assert (=> d!166979 (= (isStrictlySorted!1025 lt!677406) e!882570)))

(declare-fun b!1581844 () Bool)

(declare-fun e!882571 () Bool)

(assert (=> b!1581844 (= e!882570 e!882571)))

(declare-fun res!1079995 () Bool)

(assert (=> b!1581844 (=> (not res!1079995) (not e!882571))))

(assert (=> b!1581844 (= res!1079995 (bvslt (_1!12748 (h!38365 lt!677406)) (_1!12748 (h!38365 (t!51714 lt!677406)))))))

(declare-fun b!1581845 () Bool)

(assert (=> b!1581845 (= e!882571 (isStrictlySorted!1025 (t!51714 lt!677406)))))

(assert (= (and d!166979 (not res!1079994)) b!1581844))

(assert (= (and b!1581844 res!1079995) b!1581845))

(declare-fun m!1453517 () Bool)

(assert (=> b!1581845 m!1453517))

(assert (=> start!137384 d!166979))

(declare-fun bm!72554 () Bool)

(declare-fun call!72559 () List!36808)

(declare-fun call!72558 () List!36808)

(assert (=> bm!72554 (= call!72559 call!72558)))

(declare-fun b!1581888 () Bool)

(declare-fun e!882599 () List!36808)

(assert (=> b!1581888 (= e!882599 (insertStrictlySorted!609 (t!51714 (toList!11426 thiss!201)) (_1!12748 keyValue!4) (_2!12748 keyValue!4)))))

(declare-fun d!166981 () Bool)

(declare-fun e!882600 () Bool)

(assert (=> d!166981 e!882600))

(declare-fun res!1080011 () Bool)

(assert (=> d!166981 (=> (not res!1080011) (not e!882600))))

(declare-fun lt!677417 () List!36808)

(assert (=> d!166981 (= res!1080011 (isStrictlySorted!1025 lt!677417))))

(declare-fun e!882598 () List!36808)

(assert (=> d!166981 (= lt!677417 e!882598)))

(declare-fun c!147188 () Bool)

(assert (=> d!166981 (= c!147188 (and ((_ is Cons!36804) (toList!11426 thiss!201)) (bvslt (_1!12748 (h!38365 (toList!11426 thiss!201))) (_1!12748 keyValue!4))))))

(assert (=> d!166981 (isStrictlySorted!1025 (toList!11426 thiss!201))))

(assert (=> d!166981 (= (insertStrictlySorted!609 (toList!11426 thiss!201) (_1!12748 keyValue!4) (_2!12748 keyValue!4)) lt!677417)))

(declare-fun bm!72555 () Bool)

(declare-fun call!72557 () List!36808)

(declare-fun $colon$colon!1006 (List!36808 tuple2!25474) List!36808)

(assert (=> bm!72555 (= call!72557 ($colon$colon!1006 e!882599 (ite c!147188 (h!38365 (toList!11426 thiss!201)) (tuple2!25475 (_1!12748 keyValue!4) (_2!12748 keyValue!4)))))))

(declare-fun c!147185 () Bool)

(assert (=> bm!72555 (= c!147185 c!147188)))

(declare-fun b!1581889 () Bool)

(declare-fun c!147187 () Bool)

(assert (=> b!1581889 (= c!147187 (and ((_ is Cons!36804) (toList!11426 thiss!201)) (bvsgt (_1!12748 (h!38365 (toList!11426 thiss!201))) (_1!12748 keyValue!4))))))

(declare-fun e!882601 () List!36808)

(declare-fun e!882602 () List!36808)

(assert (=> b!1581889 (= e!882601 e!882602)))

(declare-fun b!1581890 () Bool)

(assert (=> b!1581890 (= e!882600 (contains!10493 lt!677417 (tuple2!25475 (_1!12748 keyValue!4) (_2!12748 keyValue!4))))))

(declare-fun b!1581891 () Bool)

(declare-fun res!1080010 () Bool)

(assert (=> b!1581891 (=> (not res!1080010) (not e!882600))))

(assert (=> b!1581891 (= res!1080010 (containsKey!884 lt!677417 (_1!12748 keyValue!4)))))

(declare-fun b!1581892 () Bool)

(assert (=> b!1581892 (= e!882602 call!72559)))

(declare-fun b!1581893 () Bool)

(assert (=> b!1581893 (= e!882601 call!72558)))

(declare-fun b!1581894 () Bool)

(assert (=> b!1581894 (= e!882598 call!72557)))

(declare-fun bm!72556 () Bool)

(assert (=> bm!72556 (= call!72558 call!72557)))

(declare-fun c!147186 () Bool)

(declare-fun b!1581895 () Bool)

(assert (=> b!1581895 (= e!882599 (ite c!147186 (t!51714 (toList!11426 thiss!201)) (ite c!147187 (Cons!36804 (h!38365 (toList!11426 thiss!201)) (t!51714 (toList!11426 thiss!201))) Nil!36805)))))

(declare-fun b!1581896 () Bool)

(assert (=> b!1581896 (= e!882602 call!72559)))

(declare-fun b!1581897 () Bool)

(assert (=> b!1581897 (= e!882598 e!882601)))

(assert (=> b!1581897 (= c!147186 (and ((_ is Cons!36804) (toList!11426 thiss!201)) (= (_1!12748 (h!38365 (toList!11426 thiss!201))) (_1!12748 keyValue!4))))))

(assert (= (and d!166981 c!147188) b!1581894))

(assert (= (and d!166981 (not c!147188)) b!1581897))

(assert (= (and b!1581897 c!147186) b!1581893))

(assert (= (and b!1581897 (not c!147186)) b!1581889))

(assert (= (and b!1581889 c!147187) b!1581892))

(assert (= (and b!1581889 (not c!147187)) b!1581896))

(assert (= (or b!1581892 b!1581896) bm!72554))

(assert (= (or b!1581893 bm!72554) bm!72556))

(assert (= (or b!1581894 bm!72556) bm!72555))

(assert (= (and bm!72555 c!147185) b!1581888))

(assert (= (and bm!72555 (not c!147185)) b!1581895))

(assert (= (and d!166981 res!1080011) b!1581891))

(assert (= (and b!1581891 res!1080010) b!1581890))

(declare-fun m!1453525 () Bool)

(assert (=> d!166981 m!1453525))

(declare-fun m!1453527 () Bool)

(assert (=> d!166981 m!1453527))

(declare-fun m!1453529 () Bool)

(assert (=> b!1581891 m!1453529))

(declare-fun m!1453531 () Bool)

(assert (=> bm!72555 m!1453531))

(declare-fun m!1453533 () Bool)

(assert (=> b!1581888 m!1453533))

(declare-fun m!1453535 () Bool)

(assert (=> b!1581890 m!1453535))

(assert (=> start!137384 d!166981))

(declare-fun d!166989 () Bool)

(assert (=> d!166989 (= (inv!58962 thiss!201) (isStrictlySorted!1025 (toList!11426 thiss!201)))))

(declare-fun bs!45765 () Bool)

(assert (= bs!45765 d!166989))

(assert (=> bs!45765 m!1453527))

(assert (=> start!137384 d!166989))

(declare-fun d!166991 () Bool)

(declare-fun lt!677422 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!813 (List!36808) (InoxSet tuple2!25474))

(assert (=> d!166991 (= lt!677422 (select (content!813 lt!677406) keyValue!4))))

(declare-fun e!882618 () Bool)

(assert (=> d!166991 (= lt!677422 e!882618)))

(declare-fun res!1080020 () Bool)

(assert (=> d!166991 (=> (not res!1080020) (not e!882618))))

(assert (=> d!166991 (= res!1080020 ((_ is Cons!36804) lt!677406))))

(assert (=> d!166991 (= (contains!10493 lt!677406 keyValue!4) lt!677422)))

(declare-fun b!1581922 () Bool)

(declare-fun e!882617 () Bool)

(assert (=> b!1581922 (= e!882618 e!882617)))

(declare-fun res!1080021 () Bool)

(assert (=> b!1581922 (=> res!1080021 e!882617)))

(assert (=> b!1581922 (= res!1080021 (= (h!38365 lt!677406) keyValue!4))))

(declare-fun b!1581923 () Bool)

(assert (=> b!1581923 (= e!882617 (contains!10493 (t!51714 lt!677406) keyValue!4))))

(assert (= (and d!166991 res!1080020) b!1581922))

(assert (= (and b!1581922 (not res!1080021)) b!1581923))

(declare-fun m!1453537 () Bool)

(assert (=> d!166991 m!1453537))

(declare-fun m!1453539 () Bool)

(assert (=> d!166991 m!1453539))

(declare-fun m!1453541 () Bool)

(assert (=> b!1581923 m!1453541))

(assert (=> b!1581806 d!166991))

(declare-fun b!1581928 () Bool)

(declare-fun e!882621 () Bool)

(declare-fun tp!114333 () Bool)

(assert (=> b!1581928 (= e!882621 (and tp_is_empty!39133 tp!114333))))

(assert (=> b!1581807 (= tp!114324 e!882621)))

(assert (= (and b!1581807 ((_ is Cons!36804) (toList!11426 thiss!201))) b!1581928))

(check-sat (not b!1581888) (not b!1581845) (not b!1581831) (not d!166989) tp_is_empty!39133 (not d!166981) (not b!1581923) (not b!1581928) (not bm!72555) (not b!1581890) (not b!1581891) (not d!166991))
(check-sat)
