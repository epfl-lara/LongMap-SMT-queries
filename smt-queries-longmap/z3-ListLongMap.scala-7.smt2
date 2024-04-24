; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!238 () Bool)

(assert start!238)

(declare-fun b_free!37 () Bool)

(declare-fun b_next!37 () Bool)

(assert (=> start!238 (= b_free!37 (not b_next!37))))

(declare-fun tp!137 () Bool)

(declare-fun b_and!91 () Bool)

(assert (=> start!238 (= tp!137 b_and!91)))

(declare-fun b!1994 () Bool)

(declare-fun res!4509 () Bool)

(declare-fun e!479 () Bool)

(assert (=> b!1994 (=> (not res!4509) (not e!479))))

(declare-datatypes ((B!272 0))(
  ( (B!273 (val!18 Int)) )
))
(declare-datatypes ((tuple2!36 0))(
  ( (tuple2!37 (_1!18 (_ BitVec 64)) (_2!18 B!272)) )
))
(declare-datatypes ((List!27 0))(
  ( (Nil!24) (Cons!23 (h!589 tuple2!36) (t!2076 List!27)) )
))
(declare-datatypes ((ListLongMap!41 0))(
  ( (ListLongMap!42 (toList!36 List!27)) )
))
(declare-fun lm!258 () ListLongMap!41)

(declare-fun k0!394 () (_ BitVec 64))

(declare-fun head!749 (List!27) tuple2!36)

(assert (=> b!1994 (= res!4509 (not (= (_1!18 (head!749 (toList!36 lm!258))) k0!394)))))

(declare-fun b!1995 () Bool)

(declare-fun e!478 () Bool)

(declare-fun tp!136 () Bool)

(assert (=> b!1995 (= e!478 tp!136)))

(declare-fun res!4511 () Bool)

(assert (=> start!238 (=> (not res!4511) (not e!479))))

(declare-fun p!318 () Int)

(declare-fun forall!20 (List!27 Int) Bool)

(assert (=> start!238 (= res!4511 (forall!20 (toList!36 lm!258) p!318))))

(assert (=> start!238 e!479))

(declare-fun inv!63 (ListLongMap!41) Bool)

(assert (=> start!238 (and (inv!63 lm!258) e!478)))

(assert (=> start!238 tp!137))

(assert (=> start!238 true))

(declare-fun b!1996 () Bool)

(declare-fun e!480 () Bool)

(assert (=> b!1996 (= e!479 e!480)))

(declare-fun res!4508 () Bool)

(assert (=> b!1996 (=> (not res!4508) (not e!480))))

(declare-fun lt!317 () ListLongMap!41)

(assert (=> b!1996 (= res!4508 (forall!20 (toList!36 lt!317) p!318))))

(declare-fun tail!38 (ListLongMap!41) ListLongMap!41)

(assert (=> b!1996 (= lt!317 (tail!38 lm!258))))

(declare-fun b!1997 () Bool)

(declare-fun res!4510 () Bool)

(assert (=> b!1997 (=> (not res!4510) (not e!479))))

(declare-fun isEmpty!25 (ListLongMap!41) Bool)

(assert (=> b!1997 (= res!4510 (not (isEmpty!25 lm!258)))))

(declare-fun b!1998 () Bool)

(declare-fun size!66 (List!27) Int)

(assert (=> b!1998 (= e!480 (>= (size!66 (toList!36 lt!317)) (size!66 (toList!36 lm!258))))))

(assert (= (and start!238 res!4511) b!1997))

(assert (= (and b!1997 res!4510) b!1994))

(assert (= (and b!1994 res!4509) b!1996))

(assert (= (and b!1996 res!4508) b!1998))

(assert (= start!238 b!1995))

(declare-fun m!639 () Bool)

(assert (=> start!238 m!639))

(declare-fun m!641 () Bool)

(assert (=> start!238 m!641))

(declare-fun m!643 () Bool)

(assert (=> b!1997 m!643))

(declare-fun m!645 () Bool)

(assert (=> b!1996 m!645))

(declare-fun m!647 () Bool)

(assert (=> b!1996 m!647))

(declare-fun m!649 () Bool)

(assert (=> b!1994 m!649))

(declare-fun m!651 () Bool)

(assert (=> b!1998 m!651))

(declare-fun m!653 () Bool)

(assert (=> b!1998 m!653))

(check-sat (not b!1997) (not b_next!37) (not b!1998) (not start!238) (not b!1995) (not b!1994) b_and!91 (not b!1996))
(check-sat b_and!91 (not b_next!37))
(get-model)

(declare-fun d!253 () Bool)

(declare-fun res!4546 () Bool)

(declare-fun e!509 () Bool)

(assert (=> d!253 (=> res!4546 e!509)))

(get-info :version)

(assert (=> d!253 (= res!4546 ((_ is Nil!24) (toList!36 lm!258)))))

(assert (=> d!253 (= (forall!20 (toList!36 lm!258) p!318) e!509)))

(declare-fun b!2039 () Bool)

(declare-fun e!510 () Bool)

(assert (=> b!2039 (= e!509 e!510)))

(declare-fun res!4547 () Bool)

(assert (=> b!2039 (=> (not res!4547) (not e!510))))

(declare-fun dynLambda!13 (Int tuple2!36) Bool)

(assert (=> b!2039 (= res!4547 (dynLambda!13 p!318 (h!589 (toList!36 lm!258))))))

(declare-fun b!2040 () Bool)

(assert (=> b!2040 (= e!510 (forall!20 (t!2076 (toList!36 lm!258)) p!318))))

(assert (= (and d!253 (not res!4546)) b!2039))

(assert (= (and b!2039 res!4547) b!2040))

(declare-fun b_lambda!111 () Bool)

(assert (=> (not b_lambda!111) (not b!2039)))

(declare-fun t!2082 () Bool)

(declare-fun tb!51 () Bool)

(assert (=> (and start!238 (= p!318 p!318) t!2082) tb!51))

(declare-fun result!75 () Bool)

(assert (=> tb!51 (= result!75 true)))

(assert (=> b!2039 t!2082))

(declare-fun b_and!99 () Bool)

(assert (= b_and!91 (and (=> t!2082 result!75) b_and!99)))

(declare-fun m!691 () Bool)

(assert (=> b!2039 m!691))

(declare-fun m!693 () Bool)

(assert (=> b!2040 m!693))

(assert (=> start!238 d!253))

(declare-fun d!259 () Bool)

(declare-fun isStrictlySorted!9 (List!27) Bool)

(assert (=> d!259 (= (inv!63 lm!258) (isStrictlySorted!9 (toList!36 lm!258)))))

(declare-fun bs!64 () Bool)

(assert (= bs!64 d!259))

(declare-fun m!697 () Bool)

(assert (=> bs!64 m!697))

(assert (=> start!238 d!259))

(declare-fun d!263 () Bool)

(assert (=> d!263 (= (head!749 (toList!36 lm!258)) (h!589 (toList!36 lm!258)))))

(assert (=> b!1994 d!263))

(declare-fun d!265 () Bool)

(declare-fun lt!328 () Int)

(assert (=> d!265 (>= lt!328 0)))

(declare-fun e!521 () Int)

(assert (=> d!265 (= lt!328 e!521)))

(declare-fun c!100 () Bool)

(assert (=> d!265 (= c!100 ((_ is Nil!24) (toList!36 lt!317)))))

(assert (=> d!265 (= (size!66 (toList!36 lt!317)) lt!328)))

(declare-fun b!2055 () Bool)

(assert (=> b!2055 (= e!521 0)))

(declare-fun b!2056 () Bool)

(assert (=> b!2056 (= e!521 (+ 1 (size!66 (t!2076 (toList!36 lt!317)))))))

(assert (= (and d!265 c!100) b!2055))

(assert (= (and d!265 (not c!100)) b!2056))

(declare-fun m!707 () Bool)

(assert (=> b!2056 m!707))

(assert (=> b!1998 d!265))

(declare-fun d!275 () Bool)

(declare-fun lt!329 () Int)

(assert (=> d!275 (>= lt!329 0)))

(declare-fun e!522 () Int)

(assert (=> d!275 (= lt!329 e!522)))

(declare-fun c!101 () Bool)

(assert (=> d!275 (= c!101 ((_ is Nil!24) (toList!36 lm!258)))))

(assert (=> d!275 (= (size!66 (toList!36 lm!258)) lt!329)))

(declare-fun b!2057 () Bool)

(assert (=> b!2057 (= e!522 0)))

(declare-fun b!2058 () Bool)

(assert (=> b!2058 (= e!522 (+ 1 (size!66 (t!2076 (toList!36 lm!258)))))))

(assert (= (and d!275 c!101) b!2057))

(assert (= (and d!275 (not c!101)) b!2058))

(declare-fun m!709 () Bool)

(assert (=> b!2058 m!709))

(assert (=> b!1998 d!275))

(declare-fun d!277 () Bool)

(declare-fun res!4554 () Bool)

(declare-fun e!524 () Bool)

(assert (=> d!277 (=> res!4554 e!524)))

(assert (=> d!277 (= res!4554 ((_ is Nil!24) (toList!36 lt!317)))))

(assert (=> d!277 (= (forall!20 (toList!36 lt!317) p!318) e!524)))

(declare-fun b!2061 () Bool)

(declare-fun e!525 () Bool)

(assert (=> b!2061 (= e!524 e!525)))

(declare-fun res!4555 () Bool)

(assert (=> b!2061 (=> (not res!4555) (not e!525))))

(assert (=> b!2061 (= res!4555 (dynLambda!13 p!318 (h!589 (toList!36 lt!317))))))

(declare-fun b!2062 () Bool)

(assert (=> b!2062 (= e!525 (forall!20 (t!2076 (toList!36 lt!317)) p!318))))

(assert (= (and d!277 (not res!4554)) b!2061))

(assert (= (and b!2061 res!4555) b!2062))

(declare-fun b_lambda!115 () Bool)

(assert (=> (not b_lambda!115) (not b!2061)))

(declare-fun t!2086 () Bool)

(declare-fun tb!55 () Bool)

(assert (=> (and start!238 (= p!318 p!318) t!2086) tb!55))

(declare-fun result!79 () Bool)

(assert (=> tb!55 (= result!79 true)))

(assert (=> b!2061 t!2086))

(declare-fun b_and!103 () Bool)

(assert (= b_and!99 (and (=> t!2086 result!79) b_and!103)))

(declare-fun m!715 () Bool)

(assert (=> b!2061 m!715))

(declare-fun m!719 () Bool)

(assert (=> b!2062 m!719))

(assert (=> b!1996 d!277))

(declare-fun d!285 () Bool)

(declare-fun tail!42 (List!27) List!27)

(assert (=> d!285 (= (tail!38 lm!258) (ListLongMap!42 (tail!42 (toList!36 lm!258))))))

(declare-fun bs!68 () Bool)

(assert (= bs!68 d!285))

(declare-fun m!729 () Bool)

(assert (=> bs!68 m!729))

(assert (=> b!1996 d!285))

(declare-fun d!291 () Bool)

(declare-fun isEmpty!30 (List!27) Bool)

(assert (=> d!291 (= (isEmpty!25 lm!258) (isEmpty!30 (toList!36 lm!258)))))

(declare-fun bs!70 () Bool)

(assert (= bs!70 d!291))

(declare-fun m!733 () Bool)

(assert (=> bs!70 m!733))

(assert (=> b!1997 d!291))

(declare-fun b!2078 () Bool)

(declare-fun e!536 () Bool)

(declare-fun tp_is_empty!27 () Bool)

(declare-fun tp!155 () Bool)

(assert (=> b!2078 (= e!536 (and tp_is_empty!27 tp!155))))

(assert (=> b!1995 (= tp!136 e!536)))

(assert (= (and b!1995 ((_ is Cons!23) (toList!36 lm!258))) b!2078))

(declare-fun b_lambda!125 () Bool)

(assert (= b_lambda!115 (or (and start!238 b_free!37) b_lambda!125)))

(declare-fun b_lambda!127 () Bool)

(assert (= b_lambda!111 (or (and start!238 b_free!37) b_lambda!127)))

(check-sat (not b_next!37) (not b_lambda!125) (not b_lambda!127) (not d!259) (not b!2040) b_and!103 (not b!2078) (not b!2056) (not d!291) tp_is_empty!27 (not b!2062) (not b!2058) (not d!285))
(check-sat b_and!103 (not b_next!37))
(get-model)

(declare-fun d!299 () Bool)

(assert (=> d!299 (= (isEmpty!30 (toList!36 lm!258)) ((_ is Nil!24) (toList!36 lm!258)))))

(assert (=> d!291 d!299))

(declare-fun d!301 () Bool)

(declare-fun res!4560 () Bool)

(declare-fun e!544 () Bool)

(assert (=> d!301 (=> res!4560 e!544)))

(assert (=> d!301 (= res!4560 ((_ is Nil!24) (t!2076 (toList!36 lm!258))))))

(assert (=> d!301 (= (forall!20 (t!2076 (toList!36 lm!258)) p!318) e!544)))

(declare-fun b!2092 () Bool)

(declare-fun e!545 () Bool)

(assert (=> b!2092 (= e!544 e!545)))

(declare-fun res!4561 () Bool)

(assert (=> b!2092 (=> (not res!4561) (not e!545))))

(assert (=> b!2092 (= res!4561 (dynLambda!13 p!318 (h!589 (t!2076 (toList!36 lm!258)))))))

(declare-fun b!2093 () Bool)

(assert (=> b!2093 (= e!545 (forall!20 (t!2076 (t!2076 (toList!36 lm!258))) p!318))))

(assert (= (and d!301 (not res!4560)) b!2092))

(assert (= (and b!2092 res!4561) b!2093))

(declare-fun b_lambda!133 () Bool)

(assert (=> (not b_lambda!133) (not b!2092)))

(declare-fun t!2092 () Bool)

(declare-fun tb!61 () Bool)

(assert (=> (and start!238 (= p!318 p!318) t!2092) tb!61))

(declare-fun result!91 () Bool)

(assert (=> tb!61 (= result!91 true)))

(assert (=> b!2092 t!2092))

(declare-fun b_and!109 () Bool)

(assert (= b_and!103 (and (=> t!2092 result!91) b_and!109)))

(declare-fun m!741 () Bool)

(assert (=> b!2092 m!741))

(declare-fun m!743 () Bool)

(assert (=> b!2093 m!743))

(assert (=> b!2040 d!301))

(declare-fun d!303 () Bool)

(declare-fun lt!336 () Int)

(assert (=> d!303 (>= lt!336 0)))

(declare-fun e!546 () Int)

(assert (=> d!303 (= lt!336 e!546)))

(declare-fun c!108 () Bool)

(assert (=> d!303 (= c!108 ((_ is Nil!24) (t!2076 (toList!36 lm!258))))))

(assert (=> d!303 (= (size!66 (t!2076 (toList!36 lm!258))) lt!336)))

(declare-fun b!2094 () Bool)

(assert (=> b!2094 (= e!546 0)))

(declare-fun b!2095 () Bool)

(assert (=> b!2095 (= e!546 (+ 1 (size!66 (t!2076 (t!2076 (toList!36 lm!258))))))))

(assert (= (and d!303 c!108) b!2094))

(assert (= (and d!303 (not c!108)) b!2095))

(declare-fun m!745 () Bool)

(assert (=> b!2095 m!745))

(assert (=> b!2058 d!303))

(declare-fun d!305 () Bool)

(assert (=> d!305 (= (tail!42 (toList!36 lm!258)) (t!2076 (toList!36 lm!258)))))

(assert (=> d!285 d!305))

(declare-fun d!307 () Bool)

(declare-fun lt!337 () Int)

(assert (=> d!307 (>= lt!337 0)))

(declare-fun e!547 () Int)

(assert (=> d!307 (= lt!337 e!547)))

(declare-fun c!109 () Bool)

(assert (=> d!307 (= c!109 ((_ is Nil!24) (t!2076 (toList!36 lt!317))))))

(assert (=> d!307 (= (size!66 (t!2076 (toList!36 lt!317))) lt!337)))

(declare-fun b!2096 () Bool)

(assert (=> b!2096 (= e!547 0)))

(declare-fun b!2097 () Bool)

(assert (=> b!2097 (= e!547 (+ 1 (size!66 (t!2076 (t!2076 (toList!36 lt!317))))))))

(assert (= (and d!307 c!109) b!2096))

(assert (= (and d!307 (not c!109)) b!2097))

(declare-fun m!747 () Bool)

(assert (=> b!2097 m!747))

(assert (=> b!2056 d!307))

(declare-fun d!309 () Bool)

(declare-fun res!4566 () Bool)

(declare-fun e!552 () Bool)

(assert (=> d!309 (=> res!4566 e!552)))

(assert (=> d!309 (= res!4566 (or ((_ is Nil!24) (toList!36 lm!258)) ((_ is Nil!24) (t!2076 (toList!36 lm!258)))))))

(assert (=> d!309 (= (isStrictlySorted!9 (toList!36 lm!258)) e!552)))

(declare-fun b!2102 () Bool)

(declare-fun e!553 () Bool)

(assert (=> b!2102 (= e!552 e!553)))

(declare-fun res!4567 () Bool)

(assert (=> b!2102 (=> (not res!4567) (not e!553))))

(assert (=> b!2102 (= res!4567 (bvslt (_1!18 (h!589 (toList!36 lm!258))) (_1!18 (h!589 (t!2076 (toList!36 lm!258))))))))

(declare-fun b!2103 () Bool)

(assert (=> b!2103 (= e!553 (isStrictlySorted!9 (t!2076 (toList!36 lm!258))))))

(assert (= (and d!309 (not res!4566)) b!2102))

(assert (= (and b!2102 res!4567) b!2103))

(declare-fun m!749 () Bool)

(assert (=> b!2103 m!749))

(assert (=> d!259 d!309))

(declare-fun d!311 () Bool)

(declare-fun res!4568 () Bool)

(declare-fun e!554 () Bool)

(assert (=> d!311 (=> res!4568 e!554)))

(assert (=> d!311 (= res!4568 ((_ is Nil!24) (t!2076 (toList!36 lt!317))))))

(assert (=> d!311 (= (forall!20 (t!2076 (toList!36 lt!317)) p!318) e!554)))

(declare-fun b!2104 () Bool)

(declare-fun e!555 () Bool)

(assert (=> b!2104 (= e!554 e!555)))

(declare-fun res!4569 () Bool)

(assert (=> b!2104 (=> (not res!4569) (not e!555))))

(assert (=> b!2104 (= res!4569 (dynLambda!13 p!318 (h!589 (t!2076 (toList!36 lt!317)))))))

(declare-fun b!2105 () Bool)

(assert (=> b!2105 (= e!555 (forall!20 (t!2076 (t!2076 (toList!36 lt!317))) p!318))))

(assert (= (and d!311 (not res!4568)) b!2104))

(assert (= (and b!2104 res!4569) b!2105))

(declare-fun b_lambda!135 () Bool)

(assert (=> (not b_lambda!135) (not b!2104)))

(declare-fun t!2094 () Bool)

(declare-fun tb!63 () Bool)

(assert (=> (and start!238 (= p!318 p!318) t!2094) tb!63))

(declare-fun result!93 () Bool)

(assert (=> tb!63 (= result!93 true)))

(assert (=> b!2104 t!2094))

(declare-fun b_and!111 () Bool)

(assert (= b_and!109 (and (=> t!2094 result!93) b_and!111)))

(declare-fun m!751 () Bool)

(assert (=> b!2104 m!751))

(declare-fun m!753 () Bool)

(assert (=> b!2105 m!753))

(assert (=> b!2062 d!311))

(declare-fun b!2106 () Bool)

(declare-fun e!556 () Bool)

(declare-fun tp!159 () Bool)

(assert (=> b!2106 (= e!556 (and tp_is_empty!27 tp!159))))

(assert (=> b!2078 (= tp!155 e!556)))

(assert (= (and b!2078 ((_ is Cons!23) (t!2076 (toList!36 lm!258)))) b!2106))

(declare-fun b_lambda!137 () Bool)

(assert (= b_lambda!133 (or (and start!238 b_free!37) b_lambda!137)))

(declare-fun b_lambda!139 () Bool)

(assert (= b_lambda!135 (or (and start!238 b_free!37) b_lambda!139)))

(check-sat (not b_lambda!137) tp_is_empty!27 (not b_next!37) (not b!2105) (not b_lambda!125) (not b!2106) (not b!2103) (not b_lambda!127) b_and!111 (not b!2097) (not b_lambda!139) (not b!2095) (not b!2093))
(check-sat b_and!111 (not b_next!37))
