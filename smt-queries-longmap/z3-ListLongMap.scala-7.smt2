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

(declare-fun d!255 () Bool)

(declare-fun res!4552 () Bool)

(declare-fun e!515 () Bool)

(assert (=> d!255 (=> res!4552 e!515)))

(get-info :version)

(assert (=> d!255 (= res!4552 ((_ is Nil!24) (toList!36 lm!258)))))

(assert (=> d!255 (= (forall!20 (toList!36 lm!258) p!318) e!515)))

(declare-fun b!2045 () Bool)

(declare-fun e!516 () Bool)

(assert (=> b!2045 (= e!515 e!516)))

(declare-fun res!4553 () Bool)

(assert (=> b!2045 (=> (not res!4553) (not e!516))))

(declare-fun dynLambda!14 (Int tuple2!36) Bool)

(assert (=> b!2045 (= res!4553 (dynLambda!14 p!318 (h!589 (toList!36 lm!258))))))

(declare-fun b!2046 () Bool)

(assert (=> b!2046 (= e!516 (forall!20 (t!2076 (toList!36 lm!258)) p!318))))

(assert (= (and d!255 (not res!4552)) b!2045))

(assert (= (and b!2045 res!4553) b!2046))

(declare-fun b_lambda!113 () Bool)

(assert (=> (not b_lambda!113) (not b!2045)))

(declare-fun t!2084 () Bool)

(declare-fun tb!53 () Bool)

(assert (=> (and start!238 (= p!318 p!318) t!2084) tb!53))

(declare-fun result!77 () Bool)

(assert (=> tb!53 (= result!77 true)))

(assert (=> b!2045 t!2084))

(declare-fun b_and!101 () Bool)

(assert (= b_and!91 (and (=> t!2084 result!77) b_and!101)))

(declare-fun m!695 () Bool)

(assert (=> b!2045 m!695))

(declare-fun m!697 () Bool)

(assert (=> b!2046 m!697))

(assert (=> start!238 d!255))

(declare-fun d!261 () Bool)

(declare-fun isStrictlySorted!11 (List!27) Bool)

(assert (=> d!261 (= (inv!63 lm!258) (isStrictlySorted!11 (toList!36 lm!258)))))

(declare-fun bs!65 () Bool)

(assert (= bs!65 d!261))

(declare-fun m!703 () Bool)

(assert (=> bs!65 m!703))

(assert (=> start!238 d!261))

(declare-fun d!267 () Bool)

(assert (=> d!267 (= (head!749 (toList!36 lm!258)) (h!589 (toList!36 lm!258)))))

(assert (=> b!1994 d!267))

(declare-fun d!271 () Bool)

(declare-fun lt!328 () Int)

(assert (=> d!271 (>= lt!328 0)))

(declare-fun e!523 () Int)

(assert (=> d!271 (= lt!328 e!523)))

(declare-fun c!100 () Bool)

(assert (=> d!271 (= c!100 ((_ is Nil!24) (toList!36 lt!317)))))

(assert (=> d!271 (= (size!66 (toList!36 lt!317)) lt!328)))

(declare-fun b!2057 () Bool)

(assert (=> b!2057 (= e!523 0)))

(declare-fun b!2058 () Bool)

(assert (=> b!2058 (= e!523 (+ 1 (size!66 (t!2076 (toList!36 lt!317)))))))

(assert (= (and d!271 c!100) b!2057))

(assert (= (and d!271 (not c!100)) b!2058))

(declare-fun m!715 () Bool)

(assert (=> b!2058 m!715))

(assert (=> b!1998 d!271))

(declare-fun d!281 () Bool)

(declare-fun lt!329 () Int)

(assert (=> d!281 (>= lt!329 0)))

(declare-fun e!524 () Int)

(assert (=> d!281 (= lt!329 e!524)))

(declare-fun c!101 () Bool)

(assert (=> d!281 (= c!101 ((_ is Nil!24) (toList!36 lm!258)))))

(assert (=> d!281 (= (size!66 (toList!36 lm!258)) lt!329)))

(declare-fun b!2059 () Bool)

(assert (=> b!2059 (= e!524 0)))

(declare-fun b!2060 () Bool)

(assert (=> b!2060 (= e!524 (+ 1 (size!66 (t!2076 (toList!36 lm!258)))))))

(assert (= (and d!281 c!101) b!2059))

(assert (= (and d!281 (not c!101)) b!2060))

(declare-fun m!717 () Bool)

(assert (=> b!2060 m!717))

(assert (=> b!1998 d!281))

(declare-fun d!285 () Bool)

(declare-fun res!4556 () Bool)

(declare-fun e!526 () Bool)

(assert (=> d!285 (=> res!4556 e!526)))

(assert (=> d!285 (= res!4556 ((_ is Nil!24) (toList!36 lt!317)))))

(assert (=> d!285 (= (forall!20 (toList!36 lt!317) p!318) e!526)))

(declare-fun b!2063 () Bool)

(declare-fun e!527 () Bool)

(assert (=> b!2063 (= e!526 e!527)))

(declare-fun res!4557 () Bool)

(assert (=> b!2063 (=> (not res!4557) (not e!527))))

(assert (=> b!2063 (= res!4557 (dynLambda!14 p!318 (h!589 (toList!36 lt!317))))))

(declare-fun b!2064 () Bool)

(assert (=> b!2064 (= e!527 (forall!20 (t!2076 (toList!36 lt!317)) p!318))))

(assert (= (and d!285 (not res!4556)) b!2063))

(assert (= (and b!2063 res!4557) b!2064))

(declare-fun b_lambda!117 () Bool)

(assert (=> (not b_lambda!117) (not b!2063)))

(declare-fun t!2088 () Bool)

(declare-fun tb!57 () Bool)

(assert (=> (and start!238 (= p!318 p!318) t!2088) tb!57))

(declare-fun result!81 () Bool)

(assert (=> tb!57 (= result!81 true)))

(assert (=> b!2063 t!2088))

(declare-fun b_and!105 () Bool)

(assert (= b_and!101 (and (=> t!2088 result!81) b_and!105)))

(declare-fun m!723 () Bool)

(assert (=> b!2063 m!723))

(declare-fun m!725 () Bool)

(assert (=> b!2064 m!725))

(assert (=> b!1996 d!285))

(declare-fun d!291 () Bool)

(declare-fun tail!42 (List!27) List!27)

(assert (=> d!291 (= (tail!38 lm!258) (ListLongMap!42 (tail!42 (toList!36 lm!258))))))

(declare-fun bs!69 () Bool)

(assert (= bs!69 d!291))

(declare-fun m!731 () Bool)

(assert (=> bs!69 m!731))

(assert (=> b!1996 d!291))

(declare-fun d!295 () Bool)

(declare-fun isEmpty!30 (List!27) Bool)

(assert (=> d!295 (= (isEmpty!25 lm!258) (isEmpty!30 (toList!36 lm!258)))))

(declare-fun bs!71 () Bool)

(assert (= bs!71 d!295))

(declare-fun m!739 () Bool)

(assert (=> bs!71 m!739))

(assert (=> b!1997 d!295))

(declare-fun b!2091 () Bool)

(declare-fun e!543 () Bool)

(declare-fun tp_is_empty!29 () Bool)

(declare-fun tp!158 () Bool)

(assert (=> b!2091 (= e!543 (and tp_is_empty!29 tp!158))))

(assert (=> b!1995 (= tp!136 e!543)))

(assert (= (and b!1995 ((_ is Cons!23) (toList!36 lm!258))) b!2091))

(declare-fun b_lambda!129 () Bool)

(assert (= b_lambda!117 (or (and start!238 b_free!37) b_lambda!129)))

(declare-fun b_lambda!131 () Bool)

(assert (= b_lambda!113 (or (and start!238 b_free!37) b_lambda!131)))

(check-sat (not b_next!37) (not b!2060) tp_is_empty!29 (not b_lambda!129) b_and!105 (not b!2058) (not d!295) (not b_lambda!131) (not d!261) (not b!2046) (not d!291) (not b!2064) (not b!2091))
(check-sat b_and!105 (not b_next!37))
(get-model)

(declare-fun d!299 () Bool)

(declare-fun lt!336 () Int)

(assert (=> d!299 (>= lt!336 0)))

(declare-fun e!544 () Int)

(assert (=> d!299 (= lt!336 e!544)))

(declare-fun c!108 () Bool)

(assert (=> d!299 (= c!108 ((_ is Nil!24) (t!2076 (toList!36 lm!258))))))

(assert (=> d!299 (= (size!66 (t!2076 (toList!36 lm!258))) lt!336)))

(declare-fun b!2092 () Bool)

(assert (=> b!2092 (= e!544 0)))

(declare-fun b!2093 () Bool)

(assert (=> b!2093 (= e!544 (+ 1 (size!66 (t!2076 (t!2076 (toList!36 lm!258))))))))

(assert (= (and d!299 c!108) b!2092))

(assert (= (and d!299 (not c!108)) b!2093))

(declare-fun m!741 () Bool)

(assert (=> b!2093 m!741))

(assert (=> b!2060 d!299))

(declare-fun d!301 () Bool)

(declare-fun res!4560 () Bool)

(declare-fun e!545 () Bool)

(assert (=> d!301 (=> res!4560 e!545)))

(assert (=> d!301 (= res!4560 ((_ is Nil!24) (t!2076 (toList!36 lt!317))))))

(assert (=> d!301 (= (forall!20 (t!2076 (toList!36 lt!317)) p!318) e!545)))

(declare-fun b!2094 () Bool)

(declare-fun e!546 () Bool)

(assert (=> b!2094 (= e!545 e!546)))

(declare-fun res!4561 () Bool)

(assert (=> b!2094 (=> (not res!4561) (not e!546))))

(assert (=> b!2094 (= res!4561 (dynLambda!14 p!318 (h!589 (t!2076 (toList!36 lt!317)))))))

(declare-fun b!2095 () Bool)

(assert (=> b!2095 (= e!546 (forall!20 (t!2076 (t!2076 (toList!36 lt!317))) p!318))))

(assert (= (and d!301 (not res!4560)) b!2094))

(assert (= (and b!2094 res!4561) b!2095))

(declare-fun b_lambda!133 () Bool)

(assert (=> (not b_lambda!133) (not b!2094)))

(declare-fun t!2092 () Bool)

(declare-fun tb!61 () Bool)

(assert (=> (and start!238 (= p!318 p!318) t!2092) tb!61))

(declare-fun result!91 () Bool)

(assert (=> tb!61 (= result!91 true)))

(assert (=> b!2094 t!2092))

(declare-fun b_and!109 () Bool)

(assert (= b_and!105 (and (=> t!2092 result!91) b_and!109)))

(declare-fun m!743 () Bool)

(assert (=> b!2094 m!743))

(declare-fun m!745 () Bool)

(assert (=> b!2095 m!745))

(assert (=> b!2064 d!301))

(declare-fun d!305 () Bool)

(assert (=> d!305 (= (isEmpty!30 (toList!36 lm!258)) ((_ is Nil!24) (toList!36 lm!258)))))

(assert (=> d!295 d!305))

(declare-fun d!309 () Bool)

(assert (=> d!309 (= (tail!42 (toList!36 lm!258)) (t!2076 (toList!36 lm!258)))))

(assert (=> d!291 d!309))

(declare-fun d!313 () Bool)

(declare-fun res!4566 () Bool)

(declare-fun e!551 () Bool)

(assert (=> d!313 (=> res!4566 e!551)))

(assert (=> d!313 (= res!4566 ((_ is Nil!24) (t!2076 (toList!36 lm!258))))))

(assert (=> d!313 (= (forall!20 (t!2076 (toList!36 lm!258)) p!318) e!551)))

(declare-fun b!2100 () Bool)

(declare-fun e!552 () Bool)

(assert (=> b!2100 (= e!551 e!552)))

(declare-fun res!4567 () Bool)

(assert (=> b!2100 (=> (not res!4567) (not e!552))))

(assert (=> b!2100 (= res!4567 (dynLambda!14 p!318 (h!589 (t!2076 (toList!36 lm!258)))))))

(declare-fun b!2101 () Bool)

(assert (=> b!2101 (= e!552 (forall!20 (t!2076 (t!2076 (toList!36 lm!258))) p!318))))

(assert (= (and d!313 (not res!4566)) b!2100))

(assert (= (and b!2100 res!4567) b!2101))

(declare-fun b_lambda!139 () Bool)

(assert (=> (not b_lambda!139) (not b!2100)))

(declare-fun t!2098 () Bool)

(declare-fun tb!67 () Bool)

(assert (=> (and start!238 (= p!318 p!318) t!2098) tb!67))

(declare-fun result!97 () Bool)

(assert (=> tb!67 (= result!97 true)))

(assert (=> b!2100 t!2098))

(declare-fun b_and!115 () Bool)

(assert (= b_and!109 (and (=> t!2098 result!97) b_and!115)))

(declare-fun m!755 () Bool)

(assert (=> b!2100 m!755))

(declare-fun m!757 () Bool)

(assert (=> b!2101 m!757))

(assert (=> b!2046 d!313))

(declare-fun d!317 () Bool)

(declare-fun lt!338 () Int)

(assert (=> d!317 (>= lt!338 0)))

(declare-fun e!554 () Int)

(assert (=> d!317 (= lt!338 e!554)))

(declare-fun c!110 () Bool)

(assert (=> d!317 (= c!110 ((_ is Nil!24) (t!2076 (toList!36 lt!317))))))

(assert (=> d!317 (= (size!66 (t!2076 (toList!36 lt!317))) lt!338)))

(declare-fun b!2104 () Bool)

(assert (=> b!2104 (= e!554 0)))

(declare-fun b!2105 () Bool)

(assert (=> b!2105 (= e!554 (+ 1 (size!66 (t!2076 (t!2076 (toList!36 lt!317))))))))

(assert (= (and d!317 c!110) b!2104))

(assert (= (and d!317 (not c!110)) b!2105))

(declare-fun m!761 () Bool)

(assert (=> b!2105 m!761))

(assert (=> b!2058 d!317))

(declare-fun d!321 () Bool)

(declare-fun res!4578 () Bool)

(declare-fun e!565 () Bool)

(assert (=> d!321 (=> res!4578 e!565)))

(assert (=> d!321 (= res!4578 (or ((_ is Nil!24) (toList!36 lm!258)) ((_ is Nil!24) (t!2076 (toList!36 lm!258)))))))

(assert (=> d!321 (= (isStrictlySorted!11 (toList!36 lm!258)) e!565)))

(declare-fun b!2116 () Bool)

(declare-fun e!566 () Bool)

(assert (=> b!2116 (= e!565 e!566)))

(declare-fun res!4579 () Bool)

(assert (=> b!2116 (=> (not res!4579) (not e!566))))

(assert (=> b!2116 (= res!4579 (bvslt (_1!18 (h!589 (toList!36 lm!258))) (_1!18 (h!589 (t!2076 (toList!36 lm!258))))))))

(declare-fun b!2117 () Bool)

(assert (=> b!2117 (= e!566 (isStrictlySorted!11 (t!2076 (toList!36 lm!258))))))

(assert (= (and d!321 (not res!4578)) b!2116))

(assert (= (and b!2116 res!4579) b!2117))

(declare-fun m!765 () Bool)

(assert (=> b!2117 m!765))

(assert (=> d!261 d!321))

(declare-fun b!2120 () Bool)

(declare-fun e!568 () Bool)

(declare-fun tp!159 () Bool)

(assert (=> b!2120 (= e!568 (and tp_is_empty!29 tp!159))))

(assert (=> b!2091 (= tp!158 e!568)))

(assert (= (and b!2091 ((_ is Cons!23) (t!2076 (toList!36 lm!258)))) b!2120))

(declare-fun b_lambda!141 () Bool)

(assert (= b_lambda!139 (or (and start!238 b_free!37) b_lambda!141)))

(declare-fun b_lambda!143 () Bool)

(assert (= b_lambda!133 (or (and start!238 b_free!37) b_lambda!143)))

(check-sat (not b!2117) (not b_next!37) b_and!115 (not b_lambda!131) (not b!2105) (not b_lambda!129) (not b_lambda!143) (not b!2120) (not b!2101) (not b_lambda!141) tp_is_empty!29 (not b!2095) (not b!2093))
(check-sat b_and!115 (not b_next!37))
