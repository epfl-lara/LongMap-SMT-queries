; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4844 () Bool)

(assert start!4844)

(declare-fun b_free!1333 () Bool)

(declare-fun b_next!1333 () Bool)

(assert (=> start!4844 (= b_free!1333 (not b_next!1333))))

(declare-fun tp!5482 () Bool)

(declare-fun b_and!2205 () Bool)

(assert (=> start!4844 (= tp!5482 b_and!2205)))

(declare-fun res!22351 () Bool)

(declare-fun e!23345 () Bool)

(assert (=> start!4844 (=> (not res!22351) (not e!23345))))

(declare-datatypes ((B!740 0))(
  ( (B!741 (val!870 Int)) )
))
(declare-datatypes ((tuple2!1382 0))(
  ( (tuple2!1383 (_1!702 (_ BitVec 64)) (_2!702 B!740)) )
))
(declare-datatypes ((List!960 0))(
  ( (Nil!957) (Cons!956 (h!1524 tuple2!1382) (t!3715 List!960)) )
))
(declare-datatypes ((ListLongMap!953 0))(
  ( (ListLongMap!954 (toList!492 List!960)) )
))
(declare-fun lm!252 () ListLongMap!953)

(declare-fun p!304 () Int)

(declare-fun forall!170 (List!960 Int) Bool)

(assert (=> start!4844 (= res!22351 (forall!170 (toList!492 lm!252) p!304))))

(assert (=> start!4844 e!23345))

(declare-fun e!23344 () Bool)

(declare-fun inv!1630 (ListLongMap!953) Bool)

(assert (=> start!4844 (and (inv!1630 lm!252) e!23344)))

(assert (=> start!4844 tp!5482))

(assert (=> start!4844 true))

(declare-fun b!36922 () Bool)

(declare-fun res!22348 () Bool)

(declare-fun e!23346 () Bool)

(assert (=> b!36922 (=> (not res!22348) (not e!23346))))

(declare-fun lt!13618 () ListLongMap!953)

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun contains!445 (ListLongMap!953 (_ BitVec 64)) Bool)

(assert (=> b!36922 (= res!22348 (contains!445 lt!13618 k0!388))))

(declare-fun b!36923 () Bool)

(declare-fun size!1294 (List!960) Int)

(assert (=> b!36923 (= e!23346 (>= (size!1294 (toList!492 lt!13618)) (size!1294 (toList!492 lm!252))))))

(declare-fun b!36924 () Bool)

(declare-fun res!22349 () Bool)

(assert (=> b!36924 (=> (not res!22349) (not e!23345))))

(declare-fun head!840 (List!960) tuple2!1382)

(assert (=> b!36924 (= res!22349 (not (= (_1!702 (head!840 (toList!492 lm!252))) k0!388)))))

(declare-fun b!36925 () Bool)

(declare-fun tp!5483 () Bool)

(assert (=> b!36925 (= e!23344 tp!5483)))

(declare-fun b!36926 () Bool)

(assert (=> b!36926 (= e!23345 e!23346)))

(declare-fun res!22347 () Bool)

(assert (=> b!36926 (=> (not res!22347) (not e!23346))))

(assert (=> b!36926 (= res!22347 (forall!170 (toList!492 lt!13618) p!304))))

(declare-fun tail!98 (ListLongMap!953) ListLongMap!953)

(assert (=> b!36926 (= lt!13618 (tail!98 lm!252))))

(declare-fun b!36927 () Bool)

(declare-fun res!22350 () Bool)

(assert (=> b!36927 (=> (not res!22350) (not e!23345))))

(declare-fun isEmpty!200 (ListLongMap!953) Bool)

(assert (=> b!36927 (= res!22350 (not (isEmpty!200 lm!252)))))

(declare-fun b!36928 () Bool)

(declare-fun res!22352 () Bool)

(assert (=> b!36928 (=> (not res!22352) (not e!23345))))

(assert (=> b!36928 (= res!22352 (contains!445 lm!252 k0!388))))

(assert (= (and start!4844 res!22351) b!36928))

(assert (= (and b!36928 res!22352) b!36927))

(assert (= (and b!36927 res!22350) b!36924))

(assert (= (and b!36924 res!22349) b!36926))

(assert (= (and b!36926 res!22347) b!36922))

(assert (= (and b!36922 res!22348) b!36923))

(assert (= start!4844 b!36925))

(declare-fun m!29671 () Bool)

(assert (=> b!36924 m!29671))

(declare-fun m!29673 () Bool)

(assert (=> b!36923 m!29673))

(declare-fun m!29675 () Bool)

(assert (=> b!36923 m!29675))

(declare-fun m!29677 () Bool)

(assert (=> b!36922 m!29677))

(declare-fun m!29679 () Bool)

(assert (=> b!36928 m!29679))

(declare-fun m!29681 () Bool)

(assert (=> b!36926 m!29681))

(declare-fun m!29683 () Bool)

(assert (=> b!36926 m!29683))

(declare-fun m!29685 () Bool)

(assert (=> b!36927 m!29685))

(declare-fun m!29687 () Bool)

(assert (=> start!4844 m!29687))

(declare-fun m!29689 () Bool)

(assert (=> start!4844 m!29689))

(check-sat (not b!36923) (not b!36925) (not b!36922) (not b!36928) (not b!36927) (not b!36926) (not start!4844) (not b!36924) (not b_next!1333) b_and!2205)
(check-sat b_and!2205 (not b_next!1333))
(get-model)

(declare-fun d!5651 () Bool)

(declare-fun lt!13627 () Int)

(assert (=> d!5651 (>= lt!13627 0)))

(declare-fun e!23373 () Int)

(assert (=> d!5651 (= lt!13627 e!23373)))

(declare-fun c!4225 () Bool)

(get-info :version)

(assert (=> d!5651 (= c!4225 ((_ is Nil!957) (toList!492 lt!13618)))))

(assert (=> d!5651 (= (size!1294 (toList!492 lt!13618)) lt!13627)))

(declare-fun b!36981 () Bool)

(assert (=> b!36981 (= e!23373 0)))

(declare-fun b!36982 () Bool)

(assert (=> b!36982 (= e!23373 (+ 1 (size!1294 (t!3715 (toList!492 lt!13618)))))))

(assert (= (and d!5651 c!4225) b!36981))

(assert (= (and d!5651 (not c!4225)) b!36982))

(declare-fun m!29735 () Bool)

(assert (=> b!36982 m!29735))

(assert (=> b!36923 d!5651))

(declare-fun d!5655 () Bool)

(declare-fun lt!13628 () Int)

(assert (=> d!5655 (>= lt!13628 0)))

(declare-fun e!23374 () Int)

(assert (=> d!5655 (= lt!13628 e!23374)))

(declare-fun c!4226 () Bool)

(assert (=> d!5655 (= c!4226 ((_ is Nil!957) (toList!492 lm!252)))))

(assert (=> d!5655 (= (size!1294 (toList!492 lm!252)) lt!13628)))

(declare-fun b!36983 () Bool)

(assert (=> b!36983 (= e!23374 0)))

(declare-fun b!36984 () Bool)

(assert (=> b!36984 (= e!23374 (+ 1 (size!1294 (t!3715 (toList!492 lm!252)))))))

(assert (= (and d!5655 c!4226) b!36983))

(assert (= (and d!5655 (not c!4226)) b!36984))

(declare-fun m!29739 () Bool)

(assert (=> b!36984 m!29739))

(assert (=> b!36923 d!5655))

(declare-fun d!5659 () Bool)

(assert (=> d!5659 (= (head!840 (toList!492 lm!252)) (h!1524 (toList!492 lm!252)))))

(assert (=> b!36924 d!5659))

(declare-fun d!5663 () Bool)

(declare-fun res!22401 () Bool)

(declare-fun e!23383 () Bool)

(assert (=> d!5663 (=> res!22401 e!23383)))

(assert (=> d!5663 (= res!22401 ((_ is Nil!957) (toList!492 lm!252)))))

(assert (=> d!5663 (= (forall!170 (toList!492 lm!252) p!304) e!23383)))

(declare-fun b!36995 () Bool)

(declare-fun e!23384 () Bool)

(assert (=> b!36995 (= e!23383 e!23384)))

(declare-fun res!22402 () Bool)

(assert (=> b!36995 (=> (not res!22402) (not e!23384))))

(declare-fun dynLambda!169 (Int tuple2!1382) Bool)

(assert (=> b!36995 (= res!22402 (dynLambda!169 p!304 (h!1524 (toList!492 lm!252))))))

(declare-fun b!36996 () Bool)

(assert (=> b!36996 (= e!23384 (forall!170 (t!3715 (toList!492 lm!252)) p!304))))

(assert (= (and d!5663 (not res!22401)) b!36995))

(assert (= (and b!36995 res!22402) b!36996))

(declare-fun b_lambda!1821 () Bool)

(assert (=> (not b_lambda!1821) (not b!36995)))

(declare-fun t!3723 () Bool)

(declare-fun tb!747 () Bool)

(assert (=> (and start!4844 (= p!304 p!304) t!3723) tb!747))

(declare-fun result!1277 () Bool)

(assert (=> tb!747 (= result!1277 true)))

(assert (=> b!36995 t!3723))

(declare-fun b_and!2215 () Bool)

(assert (= b_and!2205 (and (=> t!3723 result!1277) b_and!2215)))

(declare-fun m!29747 () Bool)

(assert (=> b!36995 m!29747))

(declare-fun m!29749 () Bool)

(assert (=> b!36996 m!29749))

(assert (=> start!4844 d!5663))

(declare-fun d!5669 () Bool)

(declare-fun isStrictlySorted!170 (List!960) Bool)

(assert (=> d!5669 (= (inv!1630 lm!252) (isStrictlySorted!170 (toList!492 lm!252)))))

(declare-fun bs!1427 () Bool)

(assert (= bs!1427 d!5669))

(declare-fun m!29759 () Bool)

(assert (=> bs!1427 m!29759))

(assert (=> start!4844 d!5669))

(declare-fun d!5673 () Bool)

(declare-fun res!22406 () Bool)

(declare-fun e!23389 () Bool)

(assert (=> d!5673 (=> res!22406 e!23389)))

(assert (=> d!5673 (= res!22406 ((_ is Nil!957) (toList!492 lt!13618)))))

(assert (=> d!5673 (= (forall!170 (toList!492 lt!13618) p!304) e!23389)))

(declare-fun b!37002 () Bool)

(declare-fun e!23390 () Bool)

(assert (=> b!37002 (= e!23389 e!23390)))

(declare-fun res!22407 () Bool)

(assert (=> b!37002 (=> (not res!22407) (not e!23390))))

(assert (=> b!37002 (= res!22407 (dynLambda!169 p!304 (h!1524 (toList!492 lt!13618))))))

(declare-fun b!37003 () Bool)

(assert (=> b!37003 (= e!23390 (forall!170 (t!3715 (toList!492 lt!13618)) p!304))))

(assert (= (and d!5673 (not res!22406)) b!37002))

(assert (= (and b!37002 res!22407) b!37003))

(declare-fun b_lambda!1823 () Bool)

(assert (=> (not b_lambda!1823) (not b!37002)))

(declare-fun t!3725 () Bool)

(declare-fun tb!749 () Bool)

(assert (=> (and start!4844 (= p!304 p!304) t!3725) tb!749))

(declare-fun result!1279 () Bool)

(assert (=> tb!749 (= result!1279 true)))

(assert (=> b!37002 t!3725))

(declare-fun b_and!2217 () Bool)

(assert (= b_and!2215 (and (=> t!3725 result!1279) b_and!2217)))

(declare-fun m!29761 () Bool)

(assert (=> b!37002 m!29761))

(declare-fun m!29763 () Bool)

(assert (=> b!37003 m!29763))

(assert (=> b!36926 d!5673))

(declare-fun d!5675 () Bool)

(declare-fun tail!102 (List!960) List!960)

(assert (=> d!5675 (= (tail!98 lm!252) (ListLongMap!954 (tail!102 (toList!492 lm!252))))))

(declare-fun bs!1428 () Bool)

(assert (= bs!1428 d!5675))

(declare-fun m!29765 () Bool)

(assert (=> bs!1428 m!29765))

(assert (=> b!36926 d!5675))

(declare-fun d!5677 () Bool)

(declare-fun e!23421 () Bool)

(assert (=> d!5677 e!23421))

(declare-fun res!22423 () Bool)

(assert (=> d!5677 (=> res!22423 e!23421)))

(declare-fun lt!13680 () Bool)

(assert (=> d!5677 (= res!22423 (not lt!13680))))

(declare-fun lt!13678 () Bool)

(assert (=> d!5677 (= lt!13680 lt!13678)))

(declare-datatypes ((Unit!849 0))(
  ( (Unit!850) )
))
(declare-fun lt!13679 () Unit!849)

(declare-fun e!23422 () Unit!849)

(assert (=> d!5677 (= lt!13679 e!23422)))

(declare-fun c!4245 () Bool)

(assert (=> d!5677 (= c!4245 lt!13678)))

(declare-fun containsKey!50 (List!960 (_ BitVec 64)) Bool)

(assert (=> d!5677 (= lt!13678 (containsKey!50 (toList!492 lt!13618) k0!388))))

(assert (=> d!5677 (= (contains!445 lt!13618 k0!388) lt!13680)))

(declare-fun b!37049 () Bool)

(declare-fun lt!13677 () Unit!849)

(assert (=> b!37049 (= e!23422 lt!13677)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!47 (List!960 (_ BitVec 64)) Unit!849)

(assert (=> b!37049 (= lt!13677 (lemmaContainsKeyImpliesGetValueByKeyDefined!47 (toList!492 lt!13618) k0!388))))

(declare-datatypes ((Option!92 0))(
  ( (Some!91 (v!1960 B!740)) (None!90) )
))
(declare-fun isDefined!48 (Option!92) Bool)

(declare-fun getValueByKey!86 (List!960 (_ BitVec 64)) Option!92)

(assert (=> b!37049 (isDefined!48 (getValueByKey!86 (toList!492 lt!13618) k0!388))))

(declare-fun b!37050 () Bool)

(declare-fun Unit!851 () Unit!849)

(assert (=> b!37050 (= e!23422 Unit!851)))

(declare-fun b!37051 () Bool)

(assert (=> b!37051 (= e!23421 (isDefined!48 (getValueByKey!86 (toList!492 lt!13618) k0!388)))))

(assert (= (and d!5677 c!4245) b!37049))

(assert (= (and d!5677 (not c!4245)) b!37050))

(assert (= (and d!5677 (not res!22423)) b!37051))

(declare-fun m!29811 () Bool)

(assert (=> d!5677 m!29811))

(declare-fun m!29813 () Bool)

(assert (=> b!37049 m!29813))

(declare-fun m!29815 () Bool)

(assert (=> b!37049 m!29815))

(assert (=> b!37049 m!29815))

(declare-fun m!29817 () Bool)

(assert (=> b!37049 m!29817))

(assert (=> b!37051 m!29815))

(assert (=> b!37051 m!29815))

(assert (=> b!37051 m!29817))

(assert (=> b!36922 d!5677))

(declare-fun d!5703 () Bool)

(declare-fun isEmpty!204 (List!960) Bool)

(assert (=> d!5703 (= (isEmpty!200 lm!252) (isEmpty!204 (toList!492 lm!252)))))

(declare-fun bs!1433 () Bool)

(assert (= bs!1433 d!5703))

(declare-fun m!29823 () Bool)

(assert (=> bs!1433 m!29823))

(assert (=> b!36927 d!5703))

(declare-fun d!5705 () Bool)

(declare-fun e!23428 () Bool)

(assert (=> d!5705 e!23428))

(declare-fun res!22424 () Bool)

(assert (=> d!5705 (=> res!22424 e!23428)))

(declare-fun lt!13684 () Bool)

(assert (=> d!5705 (= res!22424 (not lt!13684))))

(declare-fun lt!13682 () Bool)

(assert (=> d!5705 (= lt!13684 lt!13682)))

(declare-fun lt!13683 () Unit!849)

(declare-fun e!23429 () Unit!849)

(assert (=> d!5705 (= lt!13683 e!23429)))

(declare-fun c!4246 () Bool)

(assert (=> d!5705 (= c!4246 lt!13682)))

(assert (=> d!5705 (= lt!13682 (containsKey!50 (toList!492 lm!252) k0!388))))

(assert (=> d!5705 (= (contains!445 lm!252 k0!388) lt!13684)))

(declare-fun b!37061 () Bool)

(declare-fun lt!13681 () Unit!849)

(assert (=> b!37061 (= e!23429 lt!13681)))

(assert (=> b!37061 (= lt!13681 (lemmaContainsKeyImpliesGetValueByKeyDefined!47 (toList!492 lm!252) k0!388))))

(assert (=> b!37061 (isDefined!48 (getValueByKey!86 (toList!492 lm!252) k0!388))))

(declare-fun b!37062 () Bool)

(declare-fun Unit!853 () Unit!849)

(assert (=> b!37062 (= e!23429 Unit!853)))

(declare-fun b!37063 () Bool)

(assert (=> b!37063 (= e!23428 (isDefined!48 (getValueByKey!86 (toList!492 lm!252) k0!388)))))

(assert (= (and d!5705 c!4246) b!37061))

(assert (= (and d!5705 (not c!4246)) b!37062))

(assert (= (and d!5705 (not res!22424)) b!37063))

(declare-fun m!29825 () Bool)

(assert (=> d!5705 m!29825))

(declare-fun m!29827 () Bool)

(assert (=> b!37061 m!29827))

(declare-fun m!29829 () Bool)

(assert (=> b!37061 m!29829))

(assert (=> b!37061 m!29829))

(declare-fun m!29831 () Bool)

(assert (=> b!37061 m!29831))

(assert (=> b!37063 m!29829))

(assert (=> b!37063 m!29829))

(assert (=> b!37063 m!29831))

(assert (=> b!36928 d!5705))

(declare-fun b!37069 () Bool)

(declare-fun e!23433 () Bool)

(declare-fun tp_is_empty!1667 () Bool)

(declare-fun tp!5504 () Bool)

(assert (=> b!37069 (= e!23433 (and tp_is_empty!1667 tp!5504))))

(assert (=> b!36925 (= tp!5483 e!23433)))

(assert (= (and b!36925 ((_ is Cons!956) (toList!492 lm!252))) b!37069))

(declare-fun b_lambda!1837 () Bool)

(assert (= b_lambda!1821 (or (and start!4844 b_free!1333) b_lambda!1837)))

(declare-fun b_lambda!1839 () Bool)

(assert (= b_lambda!1823 (or (and start!4844 b_free!1333) b_lambda!1839)))

(check-sat (not d!5703) (not b!37051) b_and!2217 (not b_lambda!1837) (not b!37003) (not b!37049) (not b!37063) tp_is_empty!1667 (not d!5675) (not b!36982) (not d!5669) (not d!5677) (not b!36996) (not d!5705) (not b!36984) (not b_next!1333) (not b!37069) (not b!37061) (not b_lambda!1839))
(check-sat b_and!2217 (not b_next!1333))
(get-model)

(declare-fun d!5707 () Bool)

(declare-fun res!22429 () Bool)

(declare-fun e!23438 () Bool)

(assert (=> d!5707 (=> res!22429 e!23438)))

(assert (=> d!5707 (= res!22429 (and ((_ is Cons!956) (toList!492 lm!252)) (= (_1!702 (h!1524 (toList!492 lm!252))) k0!388)))))

(assert (=> d!5707 (= (containsKey!50 (toList!492 lm!252) k0!388) e!23438)))

(declare-fun b!37074 () Bool)

(declare-fun e!23439 () Bool)

(assert (=> b!37074 (= e!23438 e!23439)))

(declare-fun res!22430 () Bool)

(assert (=> b!37074 (=> (not res!22430) (not e!23439))))

(assert (=> b!37074 (= res!22430 (and (or (not ((_ is Cons!956) (toList!492 lm!252))) (bvsle (_1!702 (h!1524 (toList!492 lm!252))) k0!388)) ((_ is Cons!956) (toList!492 lm!252)) (bvslt (_1!702 (h!1524 (toList!492 lm!252))) k0!388)))))

(declare-fun b!37075 () Bool)

(assert (=> b!37075 (= e!23439 (containsKey!50 (t!3715 (toList!492 lm!252)) k0!388))))

(assert (= (and d!5707 (not res!22429)) b!37074))

(assert (= (and b!37074 res!22430) b!37075))

(declare-fun m!29833 () Bool)

(assert (=> b!37075 m!29833))

(assert (=> d!5705 d!5707))

(declare-fun d!5709 () Bool)

(declare-fun isEmpty!206 (Option!92) Bool)

(assert (=> d!5709 (= (isDefined!48 (getValueByKey!86 (toList!492 lm!252) k0!388)) (not (isEmpty!206 (getValueByKey!86 (toList!492 lm!252) k0!388))))))

(declare-fun bs!1434 () Bool)

(assert (= bs!1434 d!5709))

(assert (=> bs!1434 m!29829))

(declare-fun m!29835 () Bool)

(assert (=> bs!1434 m!29835))

(assert (=> b!37063 d!5709))

(declare-fun b!37093 () Bool)

(declare-fun e!23448 () Option!92)

(declare-fun e!23449 () Option!92)

(assert (=> b!37093 (= e!23448 e!23449)))

(declare-fun c!4256 () Bool)

(assert (=> b!37093 (= c!4256 (and ((_ is Cons!956) (toList!492 lm!252)) (not (= (_1!702 (h!1524 (toList!492 lm!252))) k0!388))))))

(declare-fun b!37094 () Bool)

(assert (=> b!37094 (= e!23449 (getValueByKey!86 (t!3715 (toList!492 lm!252)) k0!388))))

(declare-fun d!5711 () Bool)

(declare-fun c!4255 () Bool)

(assert (=> d!5711 (= c!4255 (and ((_ is Cons!956) (toList!492 lm!252)) (= (_1!702 (h!1524 (toList!492 lm!252))) k0!388)))))

(assert (=> d!5711 (= (getValueByKey!86 (toList!492 lm!252) k0!388) e!23448)))

(declare-fun b!37095 () Bool)

(assert (=> b!37095 (= e!23449 None!90)))

(declare-fun b!37092 () Bool)

(assert (=> b!37092 (= e!23448 (Some!91 (_2!702 (h!1524 (toList!492 lm!252)))))))

(assert (= (and d!5711 c!4255) b!37092))

(assert (= (and d!5711 (not c!4255)) b!37093))

(assert (= (and b!37093 c!4256) b!37094))

(assert (= (and b!37093 (not c!4256)) b!37095))

(declare-fun m!29839 () Bool)

(assert (=> b!37094 m!29839))

(assert (=> b!37063 d!5711))

(declare-fun d!5717 () Bool)

(declare-fun lt!13685 () Int)

(assert (=> d!5717 (>= lt!13685 0)))

(declare-fun e!23450 () Int)

(assert (=> d!5717 (= lt!13685 e!23450)))

(declare-fun c!4257 () Bool)

(assert (=> d!5717 (= c!4257 ((_ is Nil!957) (t!3715 (toList!492 lt!13618))))))

(assert (=> d!5717 (= (size!1294 (t!3715 (toList!492 lt!13618))) lt!13685)))

(declare-fun b!37096 () Bool)

(assert (=> b!37096 (= e!23450 0)))

(declare-fun b!37097 () Bool)

(assert (=> b!37097 (= e!23450 (+ 1 (size!1294 (t!3715 (t!3715 (toList!492 lt!13618))))))))

(assert (= (and d!5717 c!4257) b!37096))

(assert (= (and d!5717 (not c!4257)) b!37097))

(declare-fun m!29841 () Bool)

(assert (=> b!37097 m!29841))

(assert (=> b!36982 d!5717))

(declare-fun d!5719 () Bool)

(declare-fun res!22431 () Bool)

(declare-fun e!23451 () Bool)

(assert (=> d!5719 (=> res!22431 e!23451)))

(assert (=> d!5719 (= res!22431 ((_ is Nil!957) (t!3715 (toList!492 lm!252))))))

(assert (=> d!5719 (= (forall!170 (t!3715 (toList!492 lm!252)) p!304) e!23451)))

(declare-fun b!37098 () Bool)

(declare-fun e!23452 () Bool)

(assert (=> b!37098 (= e!23451 e!23452)))

(declare-fun res!22432 () Bool)

(assert (=> b!37098 (=> (not res!22432) (not e!23452))))

(assert (=> b!37098 (= res!22432 (dynLambda!169 p!304 (h!1524 (t!3715 (toList!492 lm!252)))))))

(declare-fun b!37099 () Bool)

(assert (=> b!37099 (= e!23452 (forall!170 (t!3715 (t!3715 (toList!492 lm!252))) p!304))))

(assert (= (and d!5719 (not res!22431)) b!37098))

(assert (= (and b!37098 res!22432) b!37099))

(declare-fun b_lambda!1841 () Bool)

(assert (=> (not b_lambda!1841) (not b!37098)))

(declare-fun t!3731 () Bool)

(declare-fun tb!755 () Bool)

(assert (=> (and start!4844 (= p!304 p!304) t!3731) tb!755))

(declare-fun result!1291 () Bool)

(assert (=> tb!755 (= result!1291 true)))

(assert (=> b!37098 t!3731))

(declare-fun b_and!2223 () Bool)

(assert (= b_and!2217 (and (=> t!3731 result!1291) b_and!2223)))

(declare-fun m!29843 () Bool)

(assert (=> b!37098 m!29843))

(declare-fun m!29845 () Bool)

(assert (=> b!37099 m!29845))

(assert (=> b!36996 d!5719))

(declare-fun d!5721 () Bool)

(declare-fun res!22433 () Bool)

(declare-fun e!23455 () Bool)

(assert (=> d!5721 (=> res!22433 e!23455)))

(assert (=> d!5721 (= res!22433 (and ((_ is Cons!956) (toList!492 lt!13618)) (= (_1!702 (h!1524 (toList!492 lt!13618))) k0!388)))))

(assert (=> d!5721 (= (containsKey!50 (toList!492 lt!13618) k0!388) e!23455)))

(declare-fun b!37104 () Bool)

(declare-fun e!23456 () Bool)

(assert (=> b!37104 (= e!23455 e!23456)))

(declare-fun res!22434 () Bool)

(assert (=> b!37104 (=> (not res!22434) (not e!23456))))

(assert (=> b!37104 (= res!22434 (and (or (not ((_ is Cons!956) (toList!492 lt!13618))) (bvsle (_1!702 (h!1524 (toList!492 lt!13618))) k0!388)) ((_ is Cons!956) (toList!492 lt!13618)) (bvslt (_1!702 (h!1524 (toList!492 lt!13618))) k0!388)))))

(declare-fun b!37105 () Bool)

(assert (=> b!37105 (= e!23456 (containsKey!50 (t!3715 (toList!492 lt!13618)) k0!388))))

(assert (= (and d!5721 (not res!22433)) b!37104))

(assert (= (and b!37104 res!22434) b!37105))

(declare-fun m!29849 () Bool)

(assert (=> b!37105 m!29849))

(assert (=> d!5677 d!5721))

(declare-fun d!5725 () Bool)

(assert (=> d!5725 (= (tail!102 (toList!492 lm!252)) (t!3715 (toList!492 lm!252)))))

(assert (=> d!5675 d!5725))

(declare-fun d!5727 () Bool)

(assert (=> d!5727 (= (isEmpty!204 (toList!492 lm!252)) ((_ is Nil!957) (toList!492 lm!252)))))

(assert (=> d!5703 d!5727))

(declare-fun d!5729 () Bool)

(declare-fun res!22445 () Bool)

(declare-fun e!23467 () Bool)

(assert (=> d!5729 (=> res!22445 e!23467)))

(assert (=> d!5729 (= res!22445 (or ((_ is Nil!957) (toList!492 lm!252)) ((_ is Nil!957) (t!3715 (toList!492 lm!252)))))))

(assert (=> d!5729 (= (isStrictlySorted!170 (toList!492 lm!252)) e!23467)))

(declare-fun b!37116 () Bool)

(declare-fun e!23468 () Bool)

(assert (=> b!37116 (= e!23467 e!23468)))

(declare-fun res!22446 () Bool)

(assert (=> b!37116 (=> (not res!22446) (not e!23468))))

(assert (=> b!37116 (= res!22446 (bvslt (_1!702 (h!1524 (toList!492 lm!252))) (_1!702 (h!1524 (t!3715 (toList!492 lm!252))))))))

(declare-fun b!37117 () Bool)

(assert (=> b!37117 (= e!23468 (isStrictlySorted!170 (t!3715 (toList!492 lm!252))))))

(assert (= (and d!5729 (not res!22445)) b!37116))

(assert (= (and b!37116 res!22446) b!37117))

(declare-fun m!29853 () Bool)

(assert (=> b!37117 m!29853))

(assert (=> d!5669 d!5729))

(declare-fun d!5733 () Bool)

(assert (=> d!5733 (isDefined!48 (getValueByKey!86 (toList!492 lt!13618) k0!388))))

(declare-fun lt!13691 () Unit!849)

(declare-fun choose!231 (List!960 (_ BitVec 64)) Unit!849)

(assert (=> d!5733 (= lt!13691 (choose!231 (toList!492 lt!13618) k0!388))))

(declare-fun e!23476 () Bool)

(assert (=> d!5733 e!23476))

(declare-fun res!22452 () Bool)

(assert (=> d!5733 (=> (not res!22452) (not e!23476))))

(assert (=> d!5733 (= res!22452 (isStrictlySorted!170 (toList!492 lt!13618)))))

(assert (=> d!5733 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!47 (toList!492 lt!13618) k0!388) lt!13691)))

(declare-fun b!37127 () Bool)

(assert (=> b!37127 (= e!23476 (containsKey!50 (toList!492 lt!13618) k0!388))))

(assert (= (and d!5733 res!22452) b!37127))

(assert (=> d!5733 m!29815))

(assert (=> d!5733 m!29815))

(assert (=> d!5733 m!29817))

(declare-fun m!29867 () Bool)

(assert (=> d!5733 m!29867))

(declare-fun m!29869 () Bool)

(assert (=> d!5733 m!29869))

(assert (=> b!37127 m!29811))

(assert (=> b!37049 d!5733))

(declare-fun d!5747 () Bool)

(assert (=> d!5747 (= (isDefined!48 (getValueByKey!86 (toList!492 lt!13618) k0!388)) (not (isEmpty!206 (getValueByKey!86 (toList!492 lt!13618) k0!388))))))

(declare-fun bs!1438 () Bool)

(assert (= bs!1438 d!5747))

(assert (=> bs!1438 m!29815))

(declare-fun m!29871 () Bool)

(assert (=> bs!1438 m!29871))

(assert (=> b!37049 d!5747))

(declare-fun b!37133 () Bool)

(declare-fun e!23481 () Option!92)

(declare-fun e!23482 () Option!92)

(assert (=> b!37133 (= e!23481 e!23482)))

(declare-fun c!4263 () Bool)

(assert (=> b!37133 (= c!4263 (and ((_ is Cons!956) (toList!492 lt!13618)) (not (= (_1!702 (h!1524 (toList!492 lt!13618))) k0!388))))))

(declare-fun b!37134 () Bool)

(assert (=> b!37134 (= e!23482 (getValueByKey!86 (t!3715 (toList!492 lt!13618)) k0!388))))

(declare-fun d!5749 () Bool)

(declare-fun c!4262 () Bool)

(assert (=> d!5749 (= c!4262 (and ((_ is Cons!956) (toList!492 lt!13618)) (= (_1!702 (h!1524 (toList!492 lt!13618))) k0!388)))))

(assert (=> d!5749 (= (getValueByKey!86 (toList!492 lt!13618) k0!388) e!23481)))

(declare-fun b!37135 () Bool)

(assert (=> b!37135 (= e!23482 None!90)))

(declare-fun b!37132 () Bool)

(assert (=> b!37132 (= e!23481 (Some!91 (_2!702 (h!1524 (toList!492 lt!13618)))))))

(assert (= (and d!5749 c!4262) b!37132))

(assert (= (and d!5749 (not c!4262)) b!37133))

(assert (= (and b!37133 c!4263) b!37134))

(assert (= (and b!37133 (not c!4263)) b!37135))

(declare-fun m!29877 () Bool)

(assert (=> b!37134 m!29877))

(assert (=> b!37049 d!5749))

(assert (=> b!37051 d!5747))

(assert (=> b!37051 d!5749))

(declare-fun d!5753 () Bool)

(declare-fun res!22459 () Bool)

(declare-fun e!23485 () Bool)

(assert (=> d!5753 (=> res!22459 e!23485)))

(assert (=> d!5753 (= res!22459 ((_ is Nil!957) (t!3715 (toList!492 lt!13618))))))

(assert (=> d!5753 (= (forall!170 (t!3715 (toList!492 lt!13618)) p!304) e!23485)))

(declare-fun b!37140 () Bool)

(declare-fun e!23486 () Bool)

(assert (=> b!37140 (= e!23485 e!23486)))

(declare-fun res!22460 () Bool)

(assert (=> b!37140 (=> (not res!22460) (not e!23486))))

(assert (=> b!37140 (= res!22460 (dynLambda!169 p!304 (h!1524 (t!3715 (toList!492 lt!13618)))))))

(declare-fun b!37141 () Bool)

(assert (=> b!37141 (= e!23486 (forall!170 (t!3715 (t!3715 (toList!492 lt!13618))) p!304))))

(assert (= (and d!5753 (not res!22459)) b!37140))

(assert (= (and b!37140 res!22460) b!37141))

(declare-fun b_lambda!1847 () Bool)

(assert (=> (not b_lambda!1847) (not b!37140)))

(declare-fun t!3737 () Bool)

(declare-fun tb!761 () Bool)

(assert (=> (and start!4844 (= p!304 p!304) t!3737) tb!761))

(declare-fun result!1297 () Bool)

(assert (=> tb!761 (= result!1297 true)))

(assert (=> b!37140 t!3737))

(declare-fun b_and!2229 () Bool)

(assert (= b_and!2223 (and (=> t!3737 result!1297) b_and!2229)))

(declare-fun m!29883 () Bool)

(assert (=> b!37140 m!29883))

(declare-fun m!29885 () Bool)

(assert (=> b!37141 m!29885))

(assert (=> b!37003 d!5753))

(declare-fun d!5757 () Bool)

(assert (=> d!5757 (isDefined!48 (getValueByKey!86 (toList!492 lm!252) k0!388))))

(declare-fun lt!13692 () Unit!849)

(assert (=> d!5757 (= lt!13692 (choose!231 (toList!492 lm!252) k0!388))))

(declare-fun e!23491 () Bool)

(assert (=> d!5757 e!23491))

(declare-fun res!22461 () Bool)

(assert (=> d!5757 (=> (not res!22461) (not e!23491))))

(assert (=> d!5757 (= res!22461 (isStrictlySorted!170 (toList!492 lm!252)))))

(assert (=> d!5757 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!47 (toList!492 lm!252) k0!388) lt!13692)))

(declare-fun b!37148 () Bool)

(assert (=> b!37148 (= e!23491 (containsKey!50 (toList!492 lm!252) k0!388))))

(assert (= (and d!5757 res!22461) b!37148))

(assert (=> d!5757 m!29829))

(assert (=> d!5757 m!29829))

(assert (=> d!5757 m!29831))

(declare-fun m!29887 () Bool)

(assert (=> d!5757 m!29887))

(assert (=> d!5757 m!29759))

(assert (=> b!37148 m!29825))

(assert (=> b!37061 d!5757))

(assert (=> b!37061 d!5709))

(assert (=> b!37061 d!5711))

(declare-fun d!5759 () Bool)

(declare-fun lt!13693 () Int)

(assert (=> d!5759 (>= lt!13693 0)))

(declare-fun e!23492 () Int)

(assert (=> d!5759 (= lt!13693 e!23492)))

(declare-fun c!4268 () Bool)

(assert (=> d!5759 (= c!4268 ((_ is Nil!957) (t!3715 (toList!492 lm!252))))))

(assert (=> d!5759 (= (size!1294 (t!3715 (toList!492 lm!252))) lt!13693)))

(declare-fun b!37149 () Bool)

(assert (=> b!37149 (= e!23492 0)))

(declare-fun b!37150 () Bool)

(assert (=> b!37150 (= e!23492 (+ 1 (size!1294 (t!3715 (t!3715 (toList!492 lm!252))))))))

(assert (= (and d!5759 c!4268) b!37149))

(assert (= (and d!5759 (not c!4268)) b!37150))

(declare-fun m!29889 () Bool)

(assert (=> b!37150 m!29889))

(assert (=> b!36984 d!5759))

(declare-fun b!37153 () Bool)

(declare-fun e!23494 () Bool)

(declare-fun tp!5505 () Bool)

(assert (=> b!37153 (= e!23494 (and tp_is_empty!1667 tp!5505))))

(assert (=> b!37069 (= tp!5504 e!23494)))

(assert (= (and b!37069 ((_ is Cons!956) (t!3715 (toList!492 lm!252)))) b!37153))

(declare-fun b_lambda!1849 () Bool)

(assert (= b_lambda!1847 (or (and start!4844 b_free!1333) b_lambda!1849)))

(declare-fun b_lambda!1851 () Bool)

(assert (= b_lambda!1841 (or (and start!4844 b_free!1333) b_lambda!1851)))

(check-sat (not d!5757) (not b!37150) (not b!37097) (not b!37094) (not b_next!1333) (not b!37148) (not b_lambda!1849) (not b_lambda!1839) (not b_lambda!1851) (not b!37105) (not b!37099) (not b!37141) b_and!2229 (not b!37127) (not b_lambda!1837) (not b!37153) (not b!37075) (not d!5733) (not b!37117) tp_is_empty!1667 (not d!5709) (not d!5747) (not b!37134))
(check-sat b_and!2229 (not b_next!1333))
