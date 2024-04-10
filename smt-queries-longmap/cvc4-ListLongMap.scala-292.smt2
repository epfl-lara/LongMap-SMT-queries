; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4942 () Bool)

(assert start!4942)

(declare-fun b_free!1343 () Bool)

(declare-fun b_next!1343 () Bool)

(assert (=> start!4942 (= b_free!1343 (not b_next!1343))))

(declare-fun tp!5524 () Bool)

(declare-fun b_and!2257 () Bool)

(assert (=> start!4942 (= tp!5524 b_and!2257)))

(declare-fun b!37327 () Bool)

(declare-fun res!22584 () Bool)

(declare-fun e!23610 () Bool)

(assert (=> b!37327 (=> (not res!22584) (not e!23610))))

(declare-datatypes ((B!750 0))(
  ( (B!751 (val!875 Int)) )
))
(declare-datatypes ((tuple2!1410 0))(
  ( (tuple2!1411 (_1!716 (_ BitVec 64)) (_2!716 B!750)) )
))
(declare-datatypes ((List!979 0))(
  ( (Nil!976) (Cons!975 (h!1543 tuple2!1410) (t!3776 List!979)) )
))
(declare-datatypes ((ListLongMap!987 0))(
  ( (ListLongMap!988 (toList!509 List!979)) )
))
(declare-fun lm!252 () ListLongMap!987)

(declare-fun k!388 () (_ BitVec 64))

(declare-fun head!847 (List!979) tuple2!1410)

(assert (=> b!37327 (= res!22584 (not (= (_1!716 (head!847 (toList!509 lm!252))) k!388)))))

(declare-fun res!22579 () Bool)

(assert (=> start!4942 (=> (not res!22579) (not e!23610))))

(declare-fun p!304 () Int)

(declare-fun forall!175 (List!979 Int) Bool)

(assert (=> start!4942 (= res!22579 (forall!175 (toList!509 lm!252) p!304))))

(assert (=> start!4942 e!23610))

(declare-fun e!23611 () Bool)

(declare-fun inv!1640 (ListLongMap!987) Bool)

(assert (=> start!4942 (and (inv!1640 lm!252) e!23611)))

(assert (=> start!4942 tp!5524))

(assert (=> start!4942 true))

(declare-fun b!37328 () Bool)

(declare-fun tp!5525 () Bool)

(assert (=> b!37328 (= e!23611 tp!5525)))

(declare-fun b!37329 () Bool)

(declare-fun res!22580 () Bool)

(assert (=> b!37329 (=> (not res!22580) (not e!23610))))

(declare-fun isEmpty!210 (ListLongMap!987) Bool)

(assert (=> b!37329 (= res!22580 (not (isEmpty!210 lm!252)))))

(declare-fun b!37330 () Bool)

(declare-fun res!22581 () Bool)

(assert (=> b!37330 (=> (not res!22581) (not e!23610))))

(declare-fun contains!460 (ListLongMap!987 (_ BitVec 64)) Bool)

(assert (=> b!37330 (= res!22581 (contains!460 lm!252 k!388))))

(declare-fun e!23609 () Bool)

(declare-fun b!37331 () Bool)

(declare-fun dynLambda!177 (Int tuple2!1410) Bool)

(declare-fun apply!48 (ListLongMap!987 (_ BitVec 64)) B!750)

(assert (=> b!37331 (= e!23609 (not (dynLambda!177 p!304 (tuple2!1411 k!388 (apply!48 lm!252 k!388)))))))

(declare-fun lt!13763 () ListLongMap!987)

(assert (=> b!37331 (dynLambda!177 p!304 (tuple2!1411 k!388 (apply!48 lt!13763 k!388)))))

(declare-datatypes ((Unit!852 0))(
  ( (Unit!853) )
))
(declare-fun lt!13764 () Unit!852)

(declare-fun applyForall!7 (ListLongMap!987 Int (_ BitVec 64)) Unit!852)

(assert (=> b!37331 (= lt!13764 (applyForall!7 lt!13763 p!304 k!388))))

(declare-fun b!37332 () Bool)

(assert (=> b!37332 (= e!23610 e!23609)))

(declare-fun res!22583 () Bool)

(assert (=> b!37332 (=> (not res!22583) (not e!23609))))

(assert (=> b!37332 (= res!22583 (forall!175 (toList!509 lt!13763) p!304))))

(declare-fun tail!106 (ListLongMap!987) ListLongMap!987)

(assert (=> b!37332 (= lt!13763 (tail!106 lm!252))))

(declare-fun b!37333 () Bool)

(declare-fun res!22582 () Bool)

(assert (=> b!37333 (=> (not res!22582) (not e!23609))))

(assert (=> b!37333 (= res!22582 (contains!460 lt!13763 k!388))))

(assert (= (and start!4942 res!22579) b!37330))

(assert (= (and b!37330 res!22581) b!37329))

(assert (= (and b!37329 res!22580) b!37327))

(assert (= (and b!37327 res!22584) b!37332))

(assert (= (and b!37332 res!22583) b!37333))

(assert (= (and b!37333 res!22582) b!37331))

(assert (= start!4942 b!37328))

(declare-fun b_lambda!1889 () Bool)

(assert (=> (not b_lambda!1889) (not b!37331)))

(declare-fun t!3773 () Bool)

(declare-fun tb!781 () Bool)

(assert (=> (and start!4942 (= p!304 p!304) t!3773) tb!781))

(declare-fun result!1317 () Bool)

(assert (=> tb!781 (= result!1317 true)))

(assert (=> b!37331 t!3773))

(declare-fun b_and!2259 () Bool)

(assert (= b_and!2257 (and (=> t!3773 result!1317) b_and!2259)))

(declare-fun b_lambda!1891 () Bool)

(assert (=> (not b_lambda!1891) (not b!37331)))

(declare-fun t!3775 () Bool)

(declare-fun tb!783 () Bool)

(assert (=> (and start!4942 (= p!304 p!304) t!3775) tb!783))

(declare-fun result!1319 () Bool)

(assert (=> tb!783 (= result!1319 true)))

(assert (=> b!37331 t!3775))

(declare-fun b_and!2261 () Bool)

(assert (= b_and!2259 (and (=> t!3775 result!1319) b_and!2261)))

(declare-fun m!30133 () Bool)

(assert (=> b!37331 m!30133))

(declare-fun m!30135 () Bool)

(assert (=> b!37331 m!30135))

(declare-fun m!30137 () Bool)

(assert (=> b!37331 m!30137))

(declare-fun m!30139 () Bool)

(assert (=> b!37331 m!30139))

(declare-fun m!30141 () Bool)

(assert (=> b!37331 m!30141))

(declare-fun m!30143 () Bool)

(assert (=> b!37329 m!30143))

(declare-fun m!30145 () Bool)

(assert (=> b!37332 m!30145))

(declare-fun m!30147 () Bool)

(assert (=> b!37332 m!30147))

(declare-fun m!30149 () Bool)

(assert (=> start!4942 m!30149))

(declare-fun m!30151 () Bool)

(assert (=> start!4942 m!30151))

(declare-fun m!30153 () Bool)

(assert (=> b!37333 m!30153))

(declare-fun m!30155 () Bool)

(assert (=> b!37327 m!30155))

(declare-fun m!30157 () Bool)

(assert (=> b!37330 m!30157))

(push 1)

(assert (not b!37329))

(assert (not b!37332))

(assert (not b_lambda!1889))

(assert (not b!37331))

(assert (not b_next!1343))

(assert b_and!2261)

(assert (not b!37330))

(assert (not start!4942))

(assert (not b!37327))

(assert (not b!37328))

(assert (not b_lambda!1891))

(assert (not b!37333))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2261)

(assert (not b_next!1343))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!1897 () Bool)

(assert (= b_lambda!1889 (or (and start!4942 b_free!1343) b_lambda!1897)))

(declare-fun b_lambda!1899 () Bool)

(assert (= b_lambda!1891 (or (and start!4942 b_free!1343) b_lambda!1899)))

(push 1)

(assert (not b!37333))

(assert (not b!37329))

(assert (not b!37332))

(assert (not b!37331))

(assert b_and!2261)

(assert (not b_lambda!1899))

(assert (not b!37330))

(assert (not start!4942))

(assert (not b!37327))

(assert (not b!37328))

(assert (not b_next!1343))

(assert (not b_lambda!1897))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2261)

(assert (not b_next!1343))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5837 () Bool)

(declare-fun e!23625 () Bool)

(assert (=> d!5837 e!23625))

(declare-fun res!22595 () Bool)

(assert (=> d!5837 (=> res!22595 e!23625)))

(declare-fun lt!13776 () Bool)

(assert (=> d!5837 (= res!22595 (not lt!13776))))

(declare-fun lt!13774 () Bool)

(assert (=> d!5837 (= lt!13776 lt!13774)))

(declare-fun lt!13775 () Unit!852)

(declare-fun e!23624 () Unit!852)

(assert (=> d!5837 (= lt!13775 e!23624)))

(declare-fun c!4295 () Bool)

(assert (=> d!5837 (= c!4295 lt!13774)))

(declare-fun containsKey!51 (List!979 (_ BitVec 64)) Bool)

(assert (=> d!5837 (= lt!13774 (containsKey!51 (toList!509 lm!252) k!388))))

(assert (=> d!5837 (= (contains!460 lm!252 k!388) lt!13776)))

(declare-fun b!37348 () Bool)

(declare-fun lt!13773 () Unit!852)

(assert (=> b!37348 (= e!23624 lt!13773)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!48 (List!979 (_ BitVec 64)) Unit!852)

(assert (=> b!37348 (= lt!13773 (lemmaContainsKeyImpliesGetValueByKeyDefined!48 (toList!509 lm!252) k!388))))

(declare-datatypes ((Option!93 0))(
  ( (Some!92 (v!1961 B!750)) (None!91) )
))
(declare-fun isDefined!49 (Option!93) Bool)

(declare-fun getValueByKey!87 (List!979 (_ BitVec 64)) Option!93)

(assert (=> b!37348 (isDefined!49 (getValueByKey!87 (toList!509 lm!252) k!388))))

(declare-fun b!37349 () Bool)

(declare-fun Unit!854 () Unit!852)

(assert (=> b!37349 (= e!23624 Unit!854)))

(declare-fun b!37350 () Bool)

(assert (=> b!37350 (= e!23625 (isDefined!49 (getValueByKey!87 (toList!509 lm!252) k!388)))))

(assert (= (and d!5837 c!4295) b!37348))

(assert (= (and d!5837 (not c!4295)) b!37349))

(assert (= (and d!5837 (not res!22595)) b!37350))

(declare-fun m!30173 () Bool)

(assert (=> d!5837 m!30173))

(declare-fun m!30175 () Bool)

(assert (=> b!37348 m!30175))

(declare-fun m!30177 () Bool)

(assert (=> b!37348 m!30177))

(assert (=> b!37348 m!30177))

(declare-fun m!30179 () Bool)

(assert (=> b!37348 m!30179))

(assert (=> b!37350 m!30177))

(assert (=> b!37350 m!30177))

(assert (=> b!37350 m!30179))

(assert (=> b!37330 d!5837))

(declare-fun d!5851 () Bool)

(declare-fun isEmpty!213 (List!979) Bool)

(assert (=> d!5851 (= (isEmpty!210 lm!252) (isEmpty!213 (toList!509 lm!252)))))

(declare-fun bs!1448 () Bool)

(assert (= bs!1448 d!5851))

(declare-fun m!30181 () Bool)

(assert (=> bs!1448 m!30181))

(assert (=> b!37329 d!5851))

(declare-fun d!5853 () Bool)

(declare-fun e!23631 () Bool)

(assert (=> d!5853 e!23631))

(declare-fun res!22598 () Bool)

(assert (=> d!5853 (=> res!22598 e!23631)))

(declare-fun lt!13788 () Bool)

(assert (=> d!5853 (= res!22598 (not lt!13788))))

(declare-fun lt!13786 () Bool)

(assert (=> d!5853 (= lt!13788 lt!13786)))

(declare-fun lt!13787 () Unit!852)

(declare-fun e!23630 () Unit!852)

(assert (=> d!5853 (= lt!13787 e!23630)))

(declare-fun c!4298 () Bool)

(assert (=> d!5853 (= c!4298 lt!13786)))

(assert (=> d!5853 (= lt!13786 (containsKey!51 (toList!509 lt!13763) k!388))))

(assert (=> d!5853 (= (contains!460 lt!13763 k!388) lt!13788)))

(declare-fun b!37357 () Bool)

(declare-fun lt!13785 () Unit!852)

(assert (=> b!37357 (= e!23630 lt!13785)))

(assert (=> b!37357 (= lt!13785 (lemmaContainsKeyImpliesGetValueByKeyDefined!48 (toList!509 lt!13763) k!388))))

(assert (=> b!37357 (isDefined!49 (getValueByKey!87 (toList!509 lt!13763) k!388))))

(declare-fun b!37358 () Bool)

(declare-fun Unit!859 () Unit!852)

(assert (=> b!37358 (= e!23630 Unit!859)))

(declare-fun b!37359 () Bool)

(assert (=> b!37359 (= e!23631 (isDefined!49 (getValueByKey!87 (toList!509 lt!13763) k!388)))))

(assert (= (and d!5853 c!4298) b!37357))

(assert (= (and d!5853 (not c!4298)) b!37358))

(assert (= (and d!5853 (not res!22598)) b!37359))

(declare-fun m!30183 () Bool)

(assert (=> d!5853 m!30183))

(declare-fun m!30185 () Bool)

(assert (=> b!37357 m!30185))

(declare-fun m!30187 () Bool)

(assert (=> b!37357 m!30187))

(assert (=> b!37357 m!30187))

(declare-fun m!30189 () Bool)

(assert (=> b!37357 m!30189))

(assert (=> b!37359 m!30187))

(assert (=> b!37359 m!30187))

(assert (=> b!37359 m!30189))

(assert (=> b!37333 d!5853))

(declare-fun d!5855 () Bool)

(assert (=> d!5855 (= (head!847 (toList!509 lm!252)) (h!1543 (toList!509 lm!252)))))

(assert (=> b!37327 d!5855))

(declare-fun d!5857 () Bool)

(declare-fun res!22608 () Bool)

(declare-fun e!23646 () Bool)

(assert (=> d!5857 (=> res!22608 e!23646)))

(assert (=> d!5857 (= res!22608 (is-Nil!976 (toList!509 lm!252)))))

(assert (=> d!5857 (= (forall!175 (toList!509 lm!252) p!304) e!23646)))

(declare-fun b!37379 () Bool)

(declare-fun e!23647 () Bool)

(assert (=> b!37379 (= e!23646 e!23647)))

(declare-fun res!22609 () Bool)

(assert (=> b!37379 (=> (not res!22609) (not e!23647))))

(assert (=> b!37379 (= res!22609 (dynLambda!177 p!304 (h!1543 (toList!509 lm!252))))))

(declare-fun b!37380 () Bool)

(assert (=> b!37380 (= e!23647 (forall!175 (t!3776 (toList!509 lm!252)) p!304))))

(assert (= (and d!5857 (not res!22608)) b!37379))

(assert (= (and b!37379 res!22609) b!37380))

(declare-fun b_lambda!1909 () Bool)

(assert (=> (not b_lambda!1909) (not b!37379)))

(declare-fun t!3782 () Bool)

(declare-fun tb!789 () Bool)

(assert (=> (and start!4942 (= p!304 p!304) t!3782) tb!789))

(declare-fun result!1325 () Bool)

(assert (=> tb!789 (= result!1325 true)))

(assert (=> b!37379 t!3782))

(declare-fun b_and!2267 () Bool)

(assert (= b_and!2261 (and (=> t!3782 result!1325) b_and!2267)))

(declare-fun m!30217 () Bool)

(assert (=> b!37379 m!30217))

(declare-fun m!30219 () Bool)

(assert (=> b!37380 m!30219))

(assert (=> start!4942 d!5857))

(declare-fun d!5867 () Bool)

(declare-fun isStrictlySorted!187 (List!979) Bool)

(assert (=> d!5867 (= (inv!1640 lm!252) (isStrictlySorted!187 (toList!509 lm!252)))))

(declare-fun bs!1452 () Bool)

(assert (= bs!1452 d!5867))

(declare-fun m!30233 () Bool)

(assert (=> bs!1452 m!30233))

(assert (=> start!4942 d!5867))

(declare-fun d!5875 () Bool)

(declare-fun res!22611 () Bool)

(declare-fun e!23650 () Bool)

(assert (=> d!5875 (=> res!22611 e!23650)))

(assert (=> d!5875 (= res!22611 (is-Nil!976 (toList!509 lt!13763)))))

(assert (=> d!5875 (= (forall!175 (toList!509 lt!13763) p!304) e!23650)))

(declare-fun b!37384 () Bool)

(declare-fun e!23651 () Bool)

(assert (=> b!37384 (= e!23650 e!23651)))

(declare-fun res!22612 () Bool)

(assert (=> b!37384 (=> (not res!22612) (not e!23651))))

(assert (=> b!37384 (= res!22612 (dynLambda!177 p!304 (h!1543 (toList!509 lt!13763))))))

(declare-fun b!37385 () Bool)

(assert (=> b!37385 (= e!23651 (forall!175 (t!3776 (toList!509 lt!13763)) p!304))))

(assert (= (and d!5875 (not res!22611)) b!37384))

(assert (= (and b!37384 res!22612) b!37385))

(declare-fun b_lambda!1911 () Bool)

(assert (=> (not b_lambda!1911) (not b!37384)))

(declare-fun t!3784 () Bool)

(declare-fun tb!791 () Bool)

(assert (=> (and start!4942 (= p!304 p!304) t!3784) tb!791))

(declare-fun result!1327 () Bool)

(assert (=> tb!791 (= result!1327 true)))

(assert (=> b!37384 t!3784))

(declare-fun b_and!2269 () Bool)

(assert (= b_and!2267 (and (=> t!3784 result!1327) b_and!2269)))

(declare-fun m!30235 () Bool)

(assert (=> b!37384 m!30235))

(declare-fun m!30237 () Bool)

(assert (=> b!37385 m!30237))

(assert (=> b!37332 d!5875))

(declare-fun d!5877 () Bool)

(declare-fun tail!108 (List!979) List!979)

(assert (=> d!5877 (= (tail!106 lm!252) (ListLongMap!988 (tail!108 (toList!509 lm!252))))))

(declare-fun bs!1453 () Bool)

(assert (= bs!1453 d!5877))

(declare-fun m!30239 () Bool)

(assert (=> bs!1453 m!30239))

(assert (=> b!37332 d!5877))

(declare-fun d!5879 () Bool)

(declare-fun get!637 (Option!93) B!750)

(assert (=> d!5879 (= (apply!48 lm!252 k!388) (get!637 (getValueByKey!87 (toList!509 lm!252) k!388)))))

(declare-fun bs!1454 () Bool)

(assert (= bs!1454 d!5879))

(assert (=> bs!1454 m!30177))

(assert (=> bs!1454 m!30177))

(declare-fun m!30245 () Bool)

(assert (=> bs!1454 m!30245))

(assert (=> b!37331 d!5879))

(declare-fun d!5883 () Bool)

(assert (=> d!5883 (= (apply!48 lt!13763 k!388) (get!637 (getValueByKey!87 (toList!509 lt!13763) k!388)))))

(declare-fun bs!1456 () Bool)

(assert (= bs!1456 d!5883))

(assert (=> bs!1456 m!30187))

(assert (=> bs!1456 m!30187))

(declare-fun m!30249 () Bool)

(assert (=> bs!1456 m!30249))

(assert (=> b!37331 d!5883))

(declare-fun d!5887 () Bool)

(assert (=> d!5887 (dynLambda!177 p!304 (tuple2!1411 k!388 (apply!48 lt!13763 k!388)))))

(declare-fun lt!13818 () Unit!852)

(declare-fun choose!234 (ListLongMap!987 Int (_ BitVec 64)) Unit!852)

(assert (=> d!5887 (= lt!13818 (choose!234 lt!13763 p!304 k!388))))

(declare-fun e!23668 () Bool)

(assert (=> d!5887 e!23668))

(declare-fun res!22626 () Bool)

(assert (=> d!5887 (=> (not res!22626) (not e!23668))))

(assert (=> d!5887 (= res!22626 (forall!175 (toList!509 lt!13763) p!304))))

(assert (=> d!5887 (= (applyForall!7 lt!13763 p!304 k!388) lt!13818)))

(declare-fun b!37404 () Bool)

(assert (=> b!37404 (= e!23668 (contains!460 lt!13763 k!388))))

(assert (= (and d!5887 res!22626) b!37404))

(declare-fun b_lambda!1923 () Bool)

(assert (=> (not b_lambda!1923) (not d!5887)))

(assert (=> d!5887 t!3775))

(declare-fun b_and!2275 () Bool)

(assert (= b_and!2269 (and (=> t!3775 result!1319) b_and!2275)))

(assert (=> d!5887 m!30137))

(assert (=> d!5887 m!30139))

(declare-fun m!30257 () Bool)

(assert (=> d!5887 m!30257))

(assert (=> d!5887 m!30145))

(assert (=> b!37404 m!30153))

(assert (=> b!37331 d!5887))

(declare-fun b!37410 () Bool)

(declare-fun e!23672 () Bool)

(declare-fun tp_is_empty!1671 () Bool)

(declare-fun tp!5531 () Bool)

(assert (=> b!37410 (= e!23672 (and tp_is_empty!1671 tp!5531))))

(assert (=> b!37328 (= tp!5525 e!23672)))

(assert (= (and b!37328 (is-Cons!975 (toList!509 lm!252))) b!37410))

(declare-fun b_lambda!1927 () Bool)

(assert (= b_lambda!1909 (or (and start!4942 b_free!1343) b_lambda!1927)))

(declare-fun b_lambda!1929 () Bool)

(assert (= b_lambda!1911 (or (and start!4942 b_free!1343) b_lambda!1929)))

(declare-fun b_lambda!1931 () Bool)

(assert (= b_lambda!1923 (or (and start!4942 b_free!1343) b_lambda!1931)))

(push 1)

(assert (not d!5867))

(assert (not d!5837))

(assert (not b!37350))

(assert (not b_lambda!1927))

(assert b_and!2275)

(assert (not b!37410))

(assert (not d!5887))

(assert tp_is_empty!1671)

(assert (not b!37357))

(assert (not b!37359))

(assert (not b!37348))

(assert (not b!37404))

(assert (not b!37385))

(assert (not d!5879))

(assert (not b_next!1343))

(assert (not b_lambda!1897))

(assert (not b_lambda!1931))

(assert (not b_lambda!1929))

(assert (not b_lambda!1899))

(assert (not d!5883))

(assert (not d!5853))

(assert (not d!5877))

(assert (not d!5851))

(assert (not b!37380))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2275)

(assert (not b_next!1343))

(check-sat)

(get-model)

(pop 1)

