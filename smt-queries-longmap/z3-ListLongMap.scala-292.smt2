; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4928 () Bool)

(assert start!4928)

(declare-fun b_free!1339 () Bool)

(declare-fun b_next!1339 () Bool)

(assert (=> start!4928 (= b_free!1339 (not b_next!1339))))

(declare-fun tp!5513 () Bool)

(declare-fun b_and!2239 () Bool)

(assert (=> start!4928 (= tp!5513 b_and!2239)))

(declare-fun b!37231 () Bool)

(declare-fun res!22514 () Bool)

(declare-fun e!23549 () Bool)

(assert (=> b!37231 (=> (not res!22514) (not e!23549))))

(declare-datatypes ((B!746 0))(
  ( (B!747 (val!873 Int)) )
))
(declare-datatypes ((tuple2!1410 0))(
  ( (tuple2!1411 (_1!716 (_ BitVec 64)) (_2!716 B!746)) )
))
(declare-datatypes ((List!970 0))(
  ( (Nil!967) (Cons!966 (h!1534 tuple2!1410) (t!3752 List!970)) )
))
(declare-datatypes ((ListLongMap!975 0))(
  ( (ListLongMap!976 (toList!503 List!970)) )
))
(declare-fun lm!252 () ListLongMap!975)

(declare-fun isEmpty!209 (ListLongMap!975) Bool)

(assert (=> b!37231 (= res!22514 (not (isEmpty!209 lm!252)))))

(declare-fun b!37232 () Bool)

(declare-fun res!22511 () Bool)

(assert (=> b!37232 (=> (not res!22511) (not e!23549))))

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun contains!455 (ListLongMap!975 (_ BitVec 64)) Bool)

(assert (=> b!37232 (= res!22511 (contains!455 lm!252 k0!388))))

(declare-fun b!37233 () Bool)

(declare-fun e!23550 () Bool)

(declare-fun tp!5512 () Bool)

(assert (=> b!37233 (= e!23550 tp!5512)))

(declare-fun b!37234 () Bool)

(declare-fun res!22515 () Bool)

(assert (=> b!37234 (=> (not res!22515) (not e!23549))))

(declare-fun head!845 (List!970) tuple2!1410)

(assert (=> b!37234 (= res!22515 (not (= (_1!716 (head!845 (toList!503 lm!252))) k0!388)))))

(declare-fun e!23548 () Bool)

(declare-fun p!304 () Int)

(declare-fun b!37236 () Bool)

(declare-fun dynLambda!174 (Int tuple2!1410) Bool)

(declare-fun apply!46 (ListLongMap!975 (_ BitVec 64)) B!746)

(assert (=> b!37236 (= e!23548 (not (dynLambda!174 p!304 (tuple2!1411 k0!388 (apply!46 lm!252 k0!388)))))))

(declare-fun lt!13747 () ListLongMap!975)

(assert (=> b!37236 (dynLambda!174 p!304 (tuple2!1411 k0!388 (apply!46 lt!13747 k0!388)))))

(declare-datatypes ((Unit!851 0))(
  ( (Unit!852) )
))
(declare-fun lt!13748 () Unit!851)

(declare-fun applyForall!5 (ListLongMap!975 Int (_ BitVec 64)) Unit!851)

(assert (=> b!37236 (= lt!13748 (applyForall!5 lt!13747 p!304 k0!388))))

(declare-fun b!37237 () Bool)

(assert (=> b!37237 (= e!23549 e!23548)))

(declare-fun res!22516 () Bool)

(assert (=> b!37237 (=> (not res!22516) (not e!23548))))

(declare-fun forall!173 (List!970 Int) Bool)

(assert (=> b!37237 (= res!22516 (forall!173 (toList!503 lt!13747) p!304))))

(declare-fun tail!104 (ListLongMap!975) ListLongMap!975)

(assert (=> b!37237 (= lt!13747 (tail!104 lm!252))))

(declare-fun b!37235 () Bool)

(declare-fun res!22513 () Bool)

(assert (=> b!37235 (=> (not res!22513) (not e!23548))))

(assert (=> b!37235 (= res!22513 (contains!455 lt!13747 k0!388))))

(declare-fun res!22512 () Bool)

(assert (=> start!4928 (=> (not res!22512) (not e!23549))))

(assert (=> start!4928 (= res!22512 (forall!173 (toList!503 lm!252) p!304))))

(assert (=> start!4928 e!23549))

(declare-fun inv!1638 (ListLongMap!975) Bool)

(assert (=> start!4928 (and (inv!1638 lm!252) e!23550)))

(assert (=> start!4928 tp!5513))

(assert (=> start!4928 true))

(assert (= (and start!4928 res!22512) b!37232))

(assert (= (and b!37232 res!22511) b!37231))

(assert (= (and b!37231 res!22514) b!37234))

(assert (= (and b!37234 res!22515) b!37237))

(assert (= (and b!37237 res!22516) b!37235))

(assert (= (and b!37235 res!22513) b!37236))

(assert (= start!4928 b!37233))

(declare-fun b_lambda!1869 () Bool)

(assert (=> (not b_lambda!1869) (not b!37236)))

(declare-fun t!3749 () Bool)

(declare-fun tb!767 () Bool)

(assert (=> (and start!4928 (= p!304 p!304) t!3749) tb!767))

(declare-fun result!1303 () Bool)

(assert (=> tb!767 (= result!1303 true)))

(assert (=> b!37236 t!3749))

(declare-fun b_and!2241 () Bool)

(assert (= b_and!2239 (and (=> t!3749 result!1303) b_and!2241)))

(declare-fun b_lambda!1871 () Bool)

(assert (=> (not b_lambda!1871) (not b!37236)))

(declare-fun t!3751 () Bool)

(declare-fun tb!769 () Bool)

(assert (=> (and start!4928 (= p!304 p!304) t!3751) tb!769))

(declare-fun result!1305 () Bool)

(assert (=> tb!769 (= result!1305 true)))

(assert (=> b!37236 t!3751))

(declare-fun b_and!2243 () Bool)

(assert (= b_and!2241 (and (=> t!3751 result!1305) b_and!2243)))

(declare-fun m!30011 () Bool)

(assert (=> b!37232 m!30011))

(declare-fun m!30013 () Bool)

(assert (=> b!37237 m!30013))

(declare-fun m!30015 () Bool)

(assert (=> b!37237 m!30015))

(declare-fun m!30017 () Bool)

(assert (=> b!37236 m!30017))

(declare-fun m!30019 () Bool)

(assert (=> b!37236 m!30019))

(declare-fun m!30021 () Bool)

(assert (=> b!37236 m!30021))

(declare-fun m!30023 () Bool)

(assert (=> b!37236 m!30023))

(declare-fun m!30025 () Bool)

(assert (=> b!37236 m!30025))

(declare-fun m!30027 () Bool)

(assert (=> b!37234 m!30027))

(declare-fun m!30029 () Bool)

(assert (=> start!4928 m!30029))

(declare-fun m!30031 () Bool)

(assert (=> start!4928 m!30031))

(declare-fun m!30033 () Bool)

(assert (=> b!37231 m!30033))

(declare-fun m!30035 () Bool)

(assert (=> b!37235 m!30035))

(check-sat (not b!37231) (not b_lambda!1869) (not b_lambda!1871) (not b!37233) (not b_next!1339) (not b!37234) (not b!37236) (not b!37237) b_and!2243 (not b!37235) (not b!37232) (not start!4928))
(check-sat b_and!2243 (not b_next!1339))
(get-model)

(declare-fun b_lambda!1889 () Bool)

(assert (= b_lambda!1871 (or (and start!4928 b_free!1339) b_lambda!1889)))

(declare-fun b_lambda!1891 () Bool)

(assert (= b_lambda!1869 (or (and start!4928 b_free!1339) b_lambda!1891)))

(check-sat (not b!37231) (not b!37233) (not b_next!1339) (not b!37234) (not b_lambda!1891) (not b!37237) b_and!2243 (not b!37235) (not b!37232) (not start!4928) (not b_lambda!1889) (not b!37236))
(check-sat b_and!2243 (not b_next!1339))
(get-model)

(declare-fun d!5801 () Bool)

(declare-fun e!23588 () Bool)

(assert (=> d!5801 e!23588))

(declare-fun res!22566 () Bool)

(assert (=> d!5801 (=> res!22566 e!23588)))

(declare-fun lt!13790 () Bool)

(assert (=> d!5801 (= res!22566 (not lt!13790))))

(declare-fun lt!13789 () Bool)

(assert (=> d!5801 (= lt!13790 lt!13789)))

(declare-fun lt!13788 () Unit!851)

(declare-fun e!23590 () Unit!851)

(assert (=> d!5801 (= lt!13788 e!23590)))

(declare-fun c!4288 () Bool)

(assert (=> d!5801 (= c!4288 lt!13789)))

(declare-fun containsKey!51 (List!970 (_ BitVec 64)) Bool)

(assert (=> d!5801 (= lt!13789 (containsKey!51 (toList!503 lm!252) k0!388))))

(assert (=> d!5801 (= (contains!455 lm!252 k0!388) lt!13790)))

(declare-fun b!37307 () Bool)

(declare-fun lt!13791 () Unit!851)

(assert (=> b!37307 (= e!23590 lt!13791)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!48 (List!970 (_ BitVec 64)) Unit!851)

(assert (=> b!37307 (= lt!13791 (lemmaContainsKeyImpliesGetValueByKeyDefined!48 (toList!503 lm!252) k0!388))))

(declare-datatypes ((Option!94 0))(
  ( (Some!93 (v!1962 B!746)) (None!92) )
))
(declare-fun isDefined!49 (Option!94) Bool)

(declare-fun getValueByKey!88 (List!970 (_ BitVec 64)) Option!94)

(assert (=> b!37307 (isDefined!49 (getValueByKey!88 (toList!503 lm!252) k0!388))))

(declare-fun b!37308 () Bool)

(declare-fun Unit!858 () Unit!851)

(assert (=> b!37308 (= e!23590 Unit!858)))

(declare-fun b!37309 () Bool)

(assert (=> b!37309 (= e!23588 (isDefined!49 (getValueByKey!88 (toList!503 lm!252) k0!388)))))

(assert (= (and d!5801 c!4288) b!37307))

(assert (= (and d!5801 (not c!4288)) b!37308))

(assert (= (and d!5801 (not res!22566)) b!37309))

(declare-fun m!30115 () Bool)

(assert (=> d!5801 m!30115))

(declare-fun m!30117 () Bool)

(assert (=> b!37307 m!30117))

(declare-fun m!30119 () Bool)

(assert (=> b!37307 m!30119))

(assert (=> b!37307 m!30119))

(declare-fun m!30121 () Bool)

(assert (=> b!37307 m!30121))

(assert (=> b!37309 m!30119))

(assert (=> b!37309 m!30119))

(assert (=> b!37309 m!30121))

(assert (=> b!37232 d!5801))

(declare-fun d!5815 () Bool)

(declare-fun res!22579 () Bool)

(declare-fun e!23602 () Bool)

(assert (=> d!5815 (=> res!22579 e!23602)))

(get-info :version)

(assert (=> d!5815 (= res!22579 ((_ is Nil!967) (toList!503 lt!13747)))))

(assert (=> d!5815 (= (forall!173 (toList!503 lt!13747) p!304) e!23602)))

(declare-fun b!37320 () Bool)

(declare-fun e!23603 () Bool)

(assert (=> b!37320 (= e!23602 e!23603)))

(declare-fun res!22580 () Bool)

(assert (=> b!37320 (=> (not res!22580) (not e!23603))))

(assert (=> b!37320 (= res!22580 (dynLambda!174 p!304 (h!1534 (toList!503 lt!13747))))))

(declare-fun b!37321 () Bool)

(assert (=> b!37321 (= e!23603 (forall!173 (t!3752 (toList!503 lt!13747)) p!304))))

(assert (= (and d!5815 (not res!22579)) b!37320))

(assert (= (and b!37320 res!22580) b!37321))

(declare-fun b_lambda!1899 () Bool)

(assert (=> (not b_lambda!1899) (not b!37320)))

(declare-fun t!3768 () Bool)

(declare-fun tb!783 () Bool)

(assert (=> (and start!4928 (= p!304 p!304) t!3768) tb!783))

(declare-fun result!1319 () Bool)

(assert (=> tb!783 (= result!1319 true)))

(assert (=> b!37320 t!3768))

(declare-fun b_and!2263 () Bool)

(assert (= b_and!2243 (and (=> t!3768 result!1319) b_and!2263)))

(declare-fun m!30137 () Bool)

(assert (=> b!37320 m!30137))

(declare-fun m!30139 () Bool)

(assert (=> b!37321 m!30139))

(assert (=> b!37237 d!5815))

(declare-fun d!5827 () Bool)

(declare-fun tail!107 (List!970) List!970)

(assert (=> d!5827 (= (tail!104 lm!252) (ListLongMap!976 (tail!107 (toList!503 lm!252))))))

(declare-fun bs!1449 () Bool)

(assert (= bs!1449 d!5827))

(declare-fun m!30141 () Bool)

(assert (=> bs!1449 m!30141))

(assert (=> b!37237 d!5827))

(declare-fun d!5829 () Bool)

(declare-fun isEmpty!212 (List!970) Bool)

(assert (=> d!5829 (= (isEmpty!209 lm!252) (isEmpty!212 (toList!503 lm!252)))))

(declare-fun bs!1451 () Bool)

(assert (= bs!1451 d!5829))

(declare-fun m!30147 () Bool)

(assert (=> bs!1451 m!30147))

(assert (=> b!37231 d!5829))

(declare-fun d!5835 () Bool)

(declare-fun get!636 (Option!94) B!746)

(assert (=> d!5835 (= (apply!46 lm!252 k0!388) (get!636 (getValueByKey!88 (toList!503 lm!252) k0!388)))))

(declare-fun bs!1452 () Bool)

(assert (= bs!1452 d!5835))

(assert (=> bs!1452 m!30119))

(assert (=> bs!1452 m!30119))

(declare-fun m!30149 () Bool)

(assert (=> bs!1452 m!30149))

(assert (=> b!37236 d!5835))

(declare-fun d!5837 () Bool)

(assert (=> d!5837 (= (apply!46 lt!13747 k0!388) (get!636 (getValueByKey!88 (toList!503 lt!13747) k0!388)))))

(declare-fun bs!1453 () Bool)

(assert (= bs!1453 d!5837))

(declare-fun m!30151 () Bool)

(assert (=> bs!1453 m!30151))

(assert (=> bs!1453 m!30151))

(declare-fun m!30153 () Bool)

(assert (=> bs!1453 m!30153))

(assert (=> b!37236 d!5837))

(declare-fun d!5839 () Bool)

(assert (=> d!5839 (dynLambda!174 p!304 (tuple2!1411 k0!388 (apply!46 lt!13747 k0!388)))))

(declare-fun lt!13809 () Unit!851)

(declare-fun choose!233 (ListLongMap!975 Int (_ BitVec 64)) Unit!851)

(assert (=> d!5839 (= lt!13809 (choose!233 lt!13747 p!304 k0!388))))

(declare-fun e!23619 () Bool)

(assert (=> d!5839 e!23619))

(declare-fun res!22593 () Bool)

(assert (=> d!5839 (=> (not res!22593) (not e!23619))))

(assert (=> d!5839 (= res!22593 (forall!173 (toList!503 lt!13747) p!304))))

(assert (=> d!5839 (= (applyForall!5 lt!13747 p!304 k0!388) lt!13809)))

(declare-fun b!37340 () Bool)

(assert (=> b!37340 (= e!23619 (contains!455 lt!13747 k0!388))))

(assert (= (and d!5839 res!22593) b!37340))

(declare-fun b_lambda!1907 () Bool)

(assert (=> (not b_lambda!1907) (not d!5839)))

(assert (=> d!5839 t!3751))

(declare-fun b_and!2271 () Bool)

(assert (= b_and!2263 (and (=> t!3751 result!1305) b_and!2271)))

(assert (=> d!5839 m!30017))

(assert (=> d!5839 m!30023))

(declare-fun m!30173 () Bool)

(assert (=> d!5839 m!30173))

(assert (=> d!5839 m!30013))

(assert (=> b!37340 m!30035))

(assert (=> b!37236 d!5839))

(declare-fun d!5853 () Bool)

(declare-fun res!22594 () Bool)

(declare-fun e!23620 () Bool)

(assert (=> d!5853 (=> res!22594 e!23620)))

(assert (=> d!5853 (= res!22594 ((_ is Nil!967) (toList!503 lm!252)))))

(assert (=> d!5853 (= (forall!173 (toList!503 lm!252) p!304) e!23620)))

(declare-fun b!37341 () Bool)

(declare-fun e!23621 () Bool)

(assert (=> b!37341 (= e!23620 e!23621)))

(declare-fun res!22595 () Bool)

(assert (=> b!37341 (=> (not res!22595) (not e!23621))))

(assert (=> b!37341 (= res!22595 (dynLambda!174 p!304 (h!1534 (toList!503 lm!252))))))

(declare-fun b!37342 () Bool)

(assert (=> b!37342 (= e!23621 (forall!173 (t!3752 (toList!503 lm!252)) p!304))))

(assert (= (and d!5853 (not res!22594)) b!37341))

(assert (= (and b!37341 res!22595) b!37342))

(declare-fun b_lambda!1909 () Bool)

(assert (=> (not b_lambda!1909) (not b!37341)))

(declare-fun t!3774 () Bool)

(declare-fun tb!789 () Bool)

(assert (=> (and start!4928 (= p!304 p!304) t!3774) tb!789))

(declare-fun result!1327 () Bool)

(assert (=> tb!789 (= result!1327 true)))

(assert (=> b!37341 t!3774))

(declare-fun b_and!2273 () Bool)

(assert (= b_and!2271 (and (=> t!3774 result!1327) b_and!2273)))

(declare-fun m!30179 () Bool)

(assert (=> b!37341 m!30179))

(declare-fun m!30181 () Bool)

(assert (=> b!37342 m!30181))

(assert (=> start!4928 d!5853))

(declare-fun d!5857 () Bool)

(declare-fun isStrictlySorted!180 (List!970) Bool)

(assert (=> d!5857 (= (inv!1638 lm!252) (isStrictlySorted!180 (toList!503 lm!252)))))

(declare-fun bs!1457 () Bool)

(assert (= bs!1457 d!5857))

(declare-fun m!30189 () Bool)

(assert (=> bs!1457 m!30189))

(assert (=> start!4928 d!5857))

(declare-fun d!5859 () Bool)

(declare-fun e!23629 () Bool)

(assert (=> d!5859 e!23629))

(declare-fun res!22597 () Bool)

(assert (=> d!5859 (=> res!22597 e!23629)))

(declare-fun lt!13816 () Bool)

(assert (=> d!5859 (= res!22597 (not lt!13816))))

(declare-fun lt!13815 () Bool)

(assert (=> d!5859 (= lt!13816 lt!13815)))

(declare-fun lt!13814 () Unit!851)

(declare-fun e!23630 () Unit!851)

(assert (=> d!5859 (= lt!13814 e!23630)))

(declare-fun c!4293 () Bool)

(assert (=> d!5859 (= c!4293 lt!13815)))

(assert (=> d!5859 (= lt!13815 (containsKey!51 (toList!503 lt!13747) k0!388))))

(assert (=> d!5859 (= (contains!455 lt!13747 k0!388) lt!13816)))

(declare-fun b!37355 () Bool)

(declare-fun lt!13817 () Unit!851)

(assert (=> b!37355 (= e!23630 lt!13817)))

(assert (=> b!37355 (= lt!13817 (lemmaContainsKeyImpliesGetValueByKeyDefined!48 (toList!503 lt!13747) k0!388))))

(assert (=> b!37355 (isDefined!49 (getValueByKey!88 (toList!503 lt!13747) k0!388))))

(declare-fun b!37356 () Bool)

(declare-fun Unit!861 () Unit!851)

(assert (=> b!37356 (= e!23630 Unit!861)))

(declare-fun b!37357 () Bool)

(assert (=> b!37357 (= e!23629 (isDefined!49 (getValueByKey!88 (toList!503 lt!13747) k0!388)))))

(assert (= (and d!5859 c!4293) b!37355))

(assert (= (and d!5859 (not c!4293)) b!37356))

(assert (= (and d!5859 (not res!22597)) b!37357))

(declare-fun m!30191 () Bool)

(assert (=> d!5859 m!30191))

(declare-fun m!30193 () Bool)

(assert (=> b!37355 m!30193))

(assert (=> b!37355 m!30151))

(assert (=> b!37355 m!30151))

(declare-fun m!30195 () Bool)

(assert (=> b!37355 m!30195))

(assert (=> b!37357 m!30151))

(assert (=> b!37357 m!30151))

(assert (=> b!37357 m!30195))

(assert (=> b!37235 d!5859))

(declare-fun d!5861 () Bool)

(assert (=> d!5861 (= (head!845 (toList!503 lm!252)) (h!1534 (toList!503 lm!252)))))

(assert (=> b!37234 d!5861))

(declare-fun b!37363 () Bool)

(declare-fun e!23634 () Bool)

(declare-fun tp_is_empty!1673 () Bool)

(declare-fun tp!5534 () Bool)

(assert (=> b!37363 (= e!23634 (and tp_is_empty!1673 tp!5534))))

(assert (=> b!37233 (= tp!5512 e!23634)))

(assert (= (and b!37233 ((_ is Cons!966) (toList!503 lm!252))) b!37363))

(declare-fun b_lambda!1923 () Bool)

(assert (= b_lambda!1909 (or (and start!4928 b_free!1339) b_lambda!1923)))

(declare-fun b_lambda!1925 () Bool)

(assert (= b_lambda!1907 (or (and start!4928 b_free!1339) b_lambda!1925)))

(declare-fun b_lambda!1927 () Bool)

(assert (= b_lambda!1899 (or (and start!4928 b_free!1339) b_lambda!1927)))

(check-sat (not d!5839) (not b!37321) (not b!37357) (not d!5857) (not d!5835) (not b!37342) (not b_lambda!1889) (not b!37307) (not b_lambda!1925) (not b_lambda!1923) (not d!5859) (not b!37340) (not b_next!1339) tp_is_empty!1673 (not b!37363) (not d!5837) (not d!5801) (not d!5829) (not d!5827) (not b_lambda!1927) (not b!37309) (not b_lambda!1891) b_and!2273 (not b!37355))
(check-sat b_and!2273 (not b_next!1339))
(get-model)

(declare-fun d!5863 () Bool)

(declare-fun res!22602 () Bool)

(declare-fun e!23639 () Bool)

(assert (=> d!5863 (=> res!22602 e!23639)))

(assert (=> d!5863 (= res!22602 (or ((_ is Nil!967) (toList!503 lm!252)) ((_ is Nil!967) (t!3752 (toList!503 lm!252)))))))

(assert (=> d!5863 (= (isStrictlySorted!180 (toList!503 lm!252)) e!23639)))

(declare-fun b!37368 () Bool)

(declare-fun e!23640 () Bool)

(assert (=> b!37368 (= e!23639 e!23640)))

(declare-fun res!22603 () Bool)

(assert (=> b!37368 (=> (not res!22603) (not e!23640))))

(assert (=> b!37368 (= res!22603 (bvslt (_1!716 (h!1534 (toList!503 lm!252))) (_1!716 (h!1534 (t!3752 (toList!503 lm!252))))))))

(declare-fun b!37369 () Bool)

(assert (=> b!37369 (= e!23640 (isStrictlySorted!180 (t!3752 (toList!503 lm!252))))))

(assert (= (and d!5863 (not res!22602)) b!37368))

(assert (= (and b!37368 res!22603) b!37369))

(declare-fun m!30197 () Bool)

(assert (=> b!37369 m!30197))

(assert (=> d!5857 d!5863))

(declare-fun d!5865 () Bool)

(assert (=> d!5865 (= (tail!107 (toList!503 lm!252)) (t!3752 (toList!503 lm!252)))))

(assert (=> d!5827 d!5865))

(declare-fun d!5867 () Bool)

(assert (=> d!5867 (isDefined!49 (getValueByKey!88 (toList!503 lm!252) k0!388))))

(declare-fun lt!13820 () Unit!851)

(declare-fun choose!235 (List!970 (_ BitVec 64)) Unit!851)

(assert (=> d!5867 (= lt!13820 (choose!235 (toList!503 lm!252) k0!388))))

(declare-fun e!23643 () Bool)

(assert (=> d!5867 e!23643))

(declare-fun res!22606 () Bool)

(assert (=> d!5867 (=> (not res!22606) (not e!23643))))

(assert (=> d!5867 (= res!22606 (isStrictlySorted!180 (toList!503 lm!252)))))

(assert (=> d!5867 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!48 (toList!503 lm!252) k0!388) lt!13820)))

(declare-fun b!37372 () Bool)

(assert (=> b!37372 (= e!23643 (containsKey!51 (toList!503 lm!252) k0!388))))

(assert (= (and d!5867 res!22606) b!37372))

(assert (=> d!5867 m!30119))

(assert (=> d!5867 m!30119))

(assert (=> d!5867 m!30121))

(declare-fun m!30199 () Bool)

(assert (=> d!5867 m!30199))

(assert (=> d!5867 m!30189))

(assert (=> b!37372 m!30115))

(assert (=> b!37307 d!5867))

(declare-fun d!5871 () Bool)

(declare-fun isEmpty!215 (Option!94) Bool)

(assert (=> d!5871 (= (isDefined!49 (getValueByKey!88 (toList!503 lm!252) k0!388)) (not (isEmpty!215 (getValueByKey!88 (toList!503 lm!252) k0!388))))))

(declare-fun bs!1458 () Bool)

(assert (= bs!1458 d!5871))

(assert (=> bs!1458 m!30119))

(declare-fun m!30201 () Bool)

(assert (=> bs!1458 m!30201))

(assert (=> b!37307 d!5871))

(declare-fun b!37390 () Bool)

(declare-fun e!23655 () Option!94)

(assert (=> b!37390 (= e!23655 None!92)))

(declare-fun b!37388 () Bool)

(declare-fun e!23654 () Option!94)

(assert (=> b!37388 (= e!23654 e!23655)))

(declare-fun c!4299 () Bool)

(assert (=> b!37388 (= c!4299 (and ((_ is Cons!966) (toList!503 lm!252)) (not (= (_1!716 (h!1534 (toList!503 lm!252))) k0!388))))))

(declare-fun d!5873 () Bool)

(declare-fun c!4298 () Bool)

(assert (=> d!5873 (= c!4298 (and ((_ is Cons!966) (toList!503 lm!252)) (= (_1!716 (h!1534 (toList!503 lm!252))) k0!388)))))

(assert (=> d!5873 (= (getValueByKey!88 (toList!503 lm!252) k0!388) e!23654)))

(declare-fun b!37387 () Bool)

(assert (=> b!37387 (= e!23654 (Some!93 (_2!716 (h!1534 (toList!503 lm!252)))))))

(declare-fun b!37389 () Bool)

(assert (=> b!37389 (= e!23655 (getValueByKey!88 (t!3752 (toList!503 lm!252)) k0!388))))

(assert (= (and d!5873 c!4298) b!37387))

(assert (= (and d!5873 (not c!4298)) b!37388))

(assert (= (and b!37388 c!4299) b!37389))

(assert (= (and b!37388 (not c!4299)) b!37390))

(declare-fun m!30205 () Bool)

(assert (=> b!37389 m!30205))

(assert (=> b!37307 d!5873))

(assert (=> b!37340 d!5859))

(declare-fun d!5881 () Bool)

(assert (=> d!5881 (= (get!636 (getValueByKey!88 (toList!503 lm!252) k0!388)) (v!1962 (getValueByKey!88 (toList!503 lm!252) k0!388)))))

(assert (=> d!5835 d!5881))

(assert (=> d!5835 d!5873))

(declare-fun d!5883 () Bool)

(declare-fun res!22617 () Bool)

(declare-fun e!23668 () Bool)

(assert (=> d!5883 (=> res!22617 e!23668)))

(assert (=> d!5883 (= res!22617 (and ((_ is Cons!966) (toList!503 lt!13747)) (= (_1!716 (h!1534 (toList!503 lt!13747))) k0!388)))))

(assert (=> d!5883 (= (containsKey!51 (toList!503 lt!13747) k0!388) e!23668)))

(declare-fun b!37411 () Bool)

(declare-fun e!23669 () Bool)

(assert (=> b!37411 (= e!23668 e!23669)))

(declare-fun res!22618 () Bool)

(assert (=> b!37411 (=> (not res!22618) (not e!23669))))

(assert (=> b!37411 (= res!22618 (and (or (not ((_ is Cons!966) (toList!503 lt!13747))) (bvsle (_1!716 (h!1534 (toList!503 lt!13747))) k0!388)) ((_ is Cons!966) (toList!503 lt!13747)) (bvslt (_1!716 (h!1534 (toList!503 lt!13747))) k0!388)))))

(declare-fun b!37412 () Bool)

(assert (=> b!37412 (= e!23669 (containsKey!51 (t!3752 (toList!503 lt!13747)) k0!388))))

(assert (= (and d!5883 (not res!22617)) b!37411))

(assert (= (and b!37411 res!22618) b!37412))

(declare-fun m!30213 () Bool)

(assert (=> b!37412 m!30213))

(assert (=> d!5859 d!5883))

(declare-fun d!5891 () Bool)

(assert (=> d!5891 (= (isDefined!49 (getValueByKey!88 (toList!503 lt!13747) k0!388)) (not (isEmpty!215 (getValueByKey!88 (toList!503 lt!13747) k0!388))))))

(declare-fun bs!1460 () Bool)

(assert (= bs!1460 d!5891))

(assert (=> bs!1460 m!30151))

(declare-fun m!30215 () Bool)

(assert (=> bs!1460 m!30215))

(assert (=> b!37357 d!5891))

(declare-fun b!37418 () Bool)

(declare-fun e!23673 () Option!94)

(assert (=> b!37418 (= e!23673 None!92)))

(declare-fun b!37416 () Bool)

(declare-fun e!23672 () Option!94)

(assert (=> b!37416 (= e!23672 e!23673)))

(declare-fun c!4309 () Bool)

(assert (=> b!37416 (= c!4309 (and ((_ is Cons!966) (toList!503 lt!13747)) (not (= (_1!716 (h!1534 (toList!503 lt!13747))) k0!388))))))

(declare-fun d!5895 () Bool)

(declare-fun c!4308 () Bool)

(assert (=> d!5895 (= c!4308 (and ((_ is Cons!966) (toList!503 lt!13747)) (= (_1!716 (h!1534 (toList!503 lt!13747))) k0!388)))))

(assert (=> d!5895 (= (getValueByKey!88 (toList!503 lt!13747) k0!388) e!23672)))

(declare-fun b!37415 () Bool)

(assert (=> b!37415 (= e!23672 (Some!93 (_2!716 (h!1534 (toList!503 lt!13747)))))))

(declare-fun b!37417 () Bool)

(assert (=> b!37417 (= e!23673 (getValueByKey!88 (t!3752 (toList!503 lt!13747)) k0!388))))

(assert (= (and d!5895 c!4308) b!37415))

(assert (= (and d!5895 (not c!4308)) b!37416))

(assert (= (and b!37416 c!4309) b!37417))

(assert (= (and b!37416 (not c!4309)) b!37418))

(declare-fun m!30217 () Bool)

(assert (=> b!37417 m!30217))

(assert (=> b!37357 d!5895))

(declare-fun d!5899 () Bool)

(assert (=> d!5899 (= (get!636 (getValueByKey!88 (toList!503 lt!13747) k0!388)) (v!1962 (getValueByKey!88 (toList!503 lt!13747) k0!388)))))

(assert (=> d!5837 d!5899))

(assert (=> d!5837 d!5895))

(declare-fun d!5901 () Bool)

(assert (=> d!5901 (isDefined!49 (getValueByKey!88 (toList!503 lt!13747) k0!388))))

(declare-fun lt!13821 () Unit!851)

(assert (=> d!5901 (= lt!13821 (choose!235 (toList!503 lt!13747) k0!388))))

(declare-fun e!23674 () Bool)

(assert (=> d!5901 e!23674))

(declare-fun res!22621 () Bool)

(assert (=> d!5901 (=> (not res!22621) (not e!23674))))

(assert (=> d!5901 (= res!22621 (isStrictlySorted!180 (toList!503 lt!13747)))))

(assert (=> d!5901 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!48 (toList!503 lt!13747) k0!388) lt!13821)))

(declare-fun b!37419 () Bool)

(assert (=> b!37419 (= e!23674 (containsKey!51 (toList!503 lt!13747) k0!388))))

(assert (= (and d!5901 res!22621) b!37419))

(assert (=> d!5901 m!30151))

(assert (=> d!5901 m!30151))

(assert (=> d!5901 m!30195))

(declare-fun m!30223 () Bool)

(assert (=> d!5901 m!30223))

(declare-fun m!30225 () Bool)

(assert (=> d!5901 m!30225))

(assert (=> b!37419 m!30191))

(assert (=> b!37355 d!5901))

(assert (=> b!37355 d!5891))

(assert (=> b!37355 d!5895))

(declare-fun d!5905 () Bool)

(declare-fun res!22624 () Bool)

(declare-fun e!23677 () Bool)

(assert (=> d!5905 (=> res!22624 e!23677)))

(assert (=> d!5905 (= res!22624 ((_ is Nil!967) (t!3752 (toList!503 lm!252))))))

(assert (=> d!5905 (= (forall!173 (t!3752 (toList!503 lm!252)) p!304) e!23677)))

(declare-fun b!37422 () Bool)

(declare-fun e!23678 () Bool)

(assert (=> b!37422 (= e!23677 e!23678)))

(declare-fun res!22625 () Bool)

(assert (=> b!37422 (=> (not res!22625) (not e!23678))))

(assert (=> b!37422 (= res!22625 (dynLambda!174 p!304 (h!1534 (t!3752 (toList!503 lm!252)))))))

(declare-fun b!37423 () Bool)

(assert (=> b!37423 (= e!23678 (forall!173 (t!3752 (t!3752 (toList!503 lm!252))) p!304))))

(assert (= (and d!5905 (not res!22624)) b!37422))

(assert (= (and b!37422 res!22625) b!37423))

(declare-fun b_lambda!1933 () Bool)

(assert (=> (not b_lambda!1933) (not b!37422)))

(declare-fun t!3780 () Bool)

(declare-fun tb!795 () Bool)

(assert (=> (and start!4928 (= p!304 p!304) t!3780) tb!795))

(declare-fun result!1337 () Bool)

(assert (=> tb!795 (= result!1337 true)))

(assert (=> b!37422 t!3780))

(declare-fun b_and!2279 () Bool)

(assert (= b_and!2273 (and (=> t!3780 result!1337) b_and!2279)))

(declare-fun m!30231 () Bool)

(assert (=> b!37422 m!30231))

(declare-fun m!30233 () Bool)

(assert (=> b!37423 m!30233))

(assert (=> b!37342 d!5905))

(declare-fun d!5909 () Bool)

(assert (=> d!5909 (= (isEmpty!212 (toList!503 lm!252)) ((_ is Nil!967) (toList!503 lm!252)))))

(assert (=> d!5829 d!5909))

(assert (=> d!5839 d!5837))

(declare-fun d!5911 () Bool)

(assert (=> d!5911 (dynLambda!174 p!304 (tuple2!1411 k0!388 (apply!46 lt!13747 k0!388)))))

(assert (=> d!5911 true))

(declare-fun _$37!23 () Unit!851)

(assert (=> d!5911 (= (choose!233 lt!13747 p!304 k0!388) _$37!23)))

(declare-fun b_lambda!1935 () Bool)

(assert (=> (not b_lambda!1935) (not d!5911)))

(assert (=> d!5911 t!3751))

(declare-fun b_and!2281 () Bool)

(assert (= b_and!2279 (and (=> t!3751 result!1305) b_and!2281)))

(assert (=> d!5911 m!30017))

(assert (=> d!5911 m!30023))

(assert (=> d!5839 d!5911))

(assert (=> d!5839 d!5815))

(declare-fun d!5917 () Bool)

(declare-fun res!22632 () Bool)

(declare-fun e!23685 () Bool)

(assert (=> d!5917 (=> res!22632 e!23685)))

(assert (=> d!5917 (= res!22632 ((_ is Nil!967) (t!3752 (toList!503 lt!13747))))))

(assert (=> d!5917 (= (forall!173 (t!3752 (toList!503 lt!13747)) p!304) e!23685)))

(declare-fun b!37430 () Bool)

(declare-fun e!23686 () Bool)

(assert (=> b!37430 (= e!23685 e!23686)))

(declare-fun res!22633 () Bool)

(assert (=> b!37430 (=> (not res!22633) (not e!23686))))

(assert (=> b!37430 (= res!22633 (dynLambda!174 p!304 (h!1534 (t!3752 (toList!503 lt!13747)))))))

(declare-fun b!37431 () Bool)

(assert (=> b!37431 (= e!23686 (forall!173 (t!3752 (t!3752 (toList!503 lt!13747))) p!304))))

(assert (= (and d!5917 (not res!22632)) b!37430))

(assert (= (and b!37430 res!22633) b!37431))

(declare-fun b_lambda!1937 () Bool)

(assert (=> (not b_lambda!1937) (not b!37430)))

(declare-fun t!3782 () Bool)

(declare-fun tb!797 () Bool)

(assert (=> (and start!4928 (= p!304 p!304) t!3782) tb!797))

(declare-fun result!1339 () Bool)

(assert (=> tb!797 (= result!1339 true)))

(assert (=> b!37430 t!3782))

(declare-fun b_and!2283 () Bool)

(assert (= b_and!2281 (and (=> t!3782 result!1339) b_and!2283)))

(declare-fun m!30247 () Bool)

(assert (=> b!37430 m!30247))

(declare-fun m!30249 () Bool)

(assert (=> b!37431 m!30249))

(assert (=> b!37321 d!5917))

(assert (=> b!37309 d!5871))

(assert (=> b!37309 d!5873))

(declare-fun d!5925 () Bool)

(declare-fun res!22635 () Bool)

(declare-fun e!23688 () Bool)

(assert (=> d!5925 (=> res!22635 e!23688)))

(assert (=> d!5925 (= res!22635 (and ((_ is Cons!966) (toList!503 lm!252)) (= (_1!716 (h!1534 (toList!503 lm!252))) k0!388)))))

(assert (=> d!5925 (= (containsKey!51 (toList!503 lm!252) k0!388) e!23688)))

(declare-fun b!37433 () Bool)

(declare-fun e!23689 () Bool)

(assert (=> b!37433 (= e!23688 e!23689)))

(declare-fun res!22636 () Bool)

(assert (=> b!37433 (=> (not res!22636) (not e!23689))))

(assert (=> b!37433 (= res!22636 (and (or (not ((_ is Cons!966) (toList!503 lm!252))) (bvsle (_1!716 (h!1534 (toList!503 lm!252))) k0!388)) ((_ is Cons!966) (toList!503 lm!252)) (bvslt (_1!716 (h!1534 (toList!503 lm!252))) k0!388)))))

(declare-fun b!37434 () Bool)

(assert (=> b!37434 (= e!23689 (containsKey!51 (t!3752 (toList!503 lm!252)) k0!388))))

(assert (= (and d!5925 (not res!22635)) b!37433))

(assert (= (and b!37433 res!22636) b!37434))

(declare-fun m!30253 () Bool)

(assert (=> b!37434 m!30253))

(assert (=> d!5801 d!5925))

(declare-fun b!37443 () Bool)

(declare-fun e!23694 () Bool)

(declare-fun tp!5535 () Bool)

(assert (=> b!37443 (= e!23694 (and tp_is_empty!1673 tp!5535))))

(assert (=> b!37363 (= tp!5534 e!23694)))

(assert (= (and b!37363 ((_ is Cons!966) (t!3752 (toList!503 lm!252)))) b!37443))

(declare-fun b_lambda!1939 () Bool)

(assert (= b_lambda!1935 (or (and start!4928 b_free!1339) b_lambda!1939)))

(declare-fun b_lambda!1941 () Bool)

(assert (= b_lambda!1933 (or (and start!4928 b_free!1339) b_lambda!1941)))

(declare-fun b_lambda!1943 () Bool)

(assert (= b_lambda!1937 (or (and start!4928 b_free!1339) b_lambda!1943)))

(check-sat (not d!5871) (not b_lambda!1943) (not d!5891) (not b!37369) (not d!5901) (not b!37372) (not b!37412) (not b_lambda!1941) (not b_lambda!1891) (not b!37431) (not b_lambda!1925) (not b_lambda!1923) (not b!37417) (not b!37419) (not b_next!1339) tp_is_empty!1673 (not d!5867) (not b_lambda!1927) (not b!37389) (not b!37434) b_and!2283 (not b!37443) (not b!37423) (not d!5911) (not b_lambda!1889) (not b_lambda!1939))
(check-sat b_and!2283 (not b_next!1339))
