; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!238 () Bool)

(assert start!238)

(declare-fun b_free!37 () Bool)

(declare-fun b_next!37 () Bool)

(assert (=> start!238 (= b_free!37 (not b_next!37))))

(declare-fun tp!136 () Bool)

(declare-fun b_and!91 () Bool)

(assert (=> start!238 (= tp!136 b_and!91)))

(declare-fun b!1994 () Bool)

(declare-fun res!4511 () Bool)

(declare-fun e!479 () Bool)

(assert (=> b!1994 (=> (not res!4511) (not e!479))))

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

(declare-fun k!394 () (_ BitVec 64))

(declare-fun head!749 (List!27) tuple2!36)

(assert (=> b!1994 (= res!4511 (not (= (_1!18 (head!749 (toList!36 lm!258))) k!394)))))

(declare-fun b!1995 () Bool)

(declare-fun res!4509 () Bool)

(assert (=> b!1995 (=> (not res!4509) (not e!479))))

(declare-fun isEmpty!25 (ListLongMap!41) Bool)

(assert (=> b!1995 (= res!4509 (not (isEmpty!25 lm!258)))))

(declare-fun b!1996 () Bool)

(declare-fun e!480 () Bool)

(declare-fun lt!317 () ListLongMap!41)

(declare-fun size!66 (List!27) Int)

(assert (=> b!1996 (= e!480 (>= (size!66 (toList!36 lt!317)) (size!66 (toList!36 lm!258))))))

(declare-fun b!1997 () Bool)

(declare-fun e!478 () Bool)

(declare-fun tp!137 () Bool)

(assert (=> b!1997 (= e!478 tp!137)))

(declare-fun b!1998 () Bool)

(assert (=> b!1998 (= e!479 e!480)))

(declare-fun res!4510 () Bool)

(assert (=> b!1998 (=> (not res!4510) (not e!480))))

(declare-fun p!318 () Int)

(declare-fun forall!20 (List!27 Int) Bool)

(assert (=> b!1998 (= res!4510 (forall!20 (toList!36 lt!317) p!318))))

(declare-fun tail!38 (ListLongMap!41) ListLongMap!41)

(assert (=> b!1998 (= lt!317 (tail!38 lm!258))))

(declare-fun res!4508 () Bool)

(assert (=> start!238 (=> (not res!4508) (not e!479))))

(assert (=> start!238 (= res!4508 (forall!20 (toList!36 lm!258) p!318))))

(assert (=> start!238 e!479))

(declare-fun inv!63 (ListLongMap!41) Bool)

(assert (=> start!238 (and (inv!63 lm!258) e!478)))

(assert (=> start!238 tp!136))

(assert (=> start!238 true))

(assert (= (and start!238 res!4508) b!1995))

(assert (= (and b!1995 res!4509) b!1994))

(assert (= (and b!1994 res!4511) b!1998))

(assert (= (and b!1998 res!4510) b!1996))

(assert (= start!238 b!1997))

(declare-fun m!639 () Bool)

(assert (=> b!1994 m!639))

(declare-fun m!641 () Bool)

(assert (=> b!1996 m!641))

(declare-fun m!643 () Bool)

(assert (=> b!1996 m!643))

(declare-fun m!645 () Bool)

(assert (=> b!1998 m!645))

(declare-fun m!647 () Bool)

(assert (=> b!1998 m!647))

(declare-fun m!649 () Bool)

(assert (=> b!1995 m!649))

(declare-fun m!651 () Bool)

(assert (=> start!238 m!651))

(declare-fun m!653 () Bool)

(assert (=> start!238 m!653))

(push 1)

(assert (not b!1998))

(assert (not b_next!37))

(assert (not start!238))

(assert (not b!1994))

(assert b_and!91)

(assert (not b!1996))

(assert (not b!1995))

(assert (not b!1997))

(check-sat)

(pop 1)

(push 1)

(assert b_and!91)

(assert (not b_next!37))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!253 () Bool)

(declare-fun lt!326 () Int)

(assert (=> d!253 (>= lt!326 0)))

(declare-fun e!507 () Int)

(assert (=> d!253 (= lt!326 e!507)))

(declare-fun c!98 () Bool)

(assert (=> d!253 (= c!98 (is-Nil!24 (toList!36 lt!317)))))

(assert (=> d!253 (= (size!66 (toList!36 lt!317)) lt!326)))

(declare-fun b!2039 () Bool)

(assert (=> b!2039 (= e!507 0)))

(declare-fun b!2040 () Bool)

(assert (=> b!2040 (= e!507 (+ 1 (size!66 (t!2076 (toList!36 lt!317)))))))

(assert (= (and d!253 c!98) b!2039))

(assert (= (and d!253 (not c!98)) b!2040))

(declare-fun m!695 () Bool)

(assert (=> b!2040 m!695))

(assert (=> b!1996 d!253))

(declare-fun d!263 () Bool)

(declare-fun lt!327 () Int)

(assert (=> d!263 (>= lt!327 0)))

(declare-fun e!508 () Int)

(assert (=> d!263 (= lt!327 e!508)))

(declare-fun c!99 () Bool)

(assert (=> d!263 (= c!99 (is-Nil!24 (toList!36 lm!258)))))

(assert (=> d!263 (= (size!66 (toList!36 lm!258)) lt!327)))

(declare-fun b!2041 () Bool)

(assert (=> b!2041 (= e!508 0)))

(declare-fun b!2042 () Bool)

(assert (=> b!2042 (= e!508 (+ 1 (size!66 (t!2076 (toList!36 lm!258)))))))

(assert (= (and d!263 c!99) b!2041))

(assert (= (and d!263 (not c!99)) b!2042))

(declare-fun m!697 () Bool)

(assert (=> b!2042 m!697))

(assert (=> b!1996 d!263))

(declare-fun d!265 () Bool)

(declare-fun res!4554 () Bool)

(declare-fun e!521 () Bool)

(assert (=> d!265 (=> res!4554 e!521)))

(assert (=> d!265 (= res!4554 (is-Nil!24 (toList!36 lm!258)))))

(assert (=> d!265 (= (forall!20 (toList!36 lm!258) p!318) e!521)))

(declare-fun b!2055 () Bool)

(declare-fun e!522 () Bool)

(assert (=> b!2055 (= e!521 e!522)))

(declare-fun res!4555 () Bool)

(assert (=> b!2055 (=> (not res!4555) (not e!522))))

(declare-fun dynLambda!14 (Int tuple2!36) Bool)

(assert (=> b!2055 (= res!4555 (dynLambda!14 p!318 (h!589 (toList!36 lm!258))))))

(declare-fun b!2056 () Bool)

(assert (=> b!2056 (= e!522 (forall!20 (t!2076 (toList!36 lm!258)) p!318))))

(assert (= (and d!265 (not res!4554)) b!2055))

(assert (= (and b!2055 res!4555) b!2056))

(declare-fun b_lambda!115 () Bool)

(assert (=> (not b_lambda!115) (not b!2055)))

(declare-fun t!2086 () Bool)

(declare-fun tb!55 () Bool)

(assert (=> (and start!238 (= p!318 p!318) t!2086) tb!55))

(declare-fun result!79 () Bool)

(assert (=> tb!55 (= result!79 true)))

(assert (=> b!2055 t!2086))

(declare-fun b_and!103 () Bool)

(assert (= b_and!91 (and (=> t!2086 result!79) b_and!103)))

(declare-fun m!711 () Bool)

(assert (=> b!2055 m!711))

(declare-fun m!713 () Bool)

(assert (=> b!2056 m!713))

(assert (=> start!238 d!265))

(declare-fun d!275 () Bool)

(declare-fun isStrictlySorted!11 (List!27) Bool)

(assert (=> d!275 (= (inv!63 lm!258) (isStrictlySorted!11 (toList!36 lm!258)))))

(declare-fun bs!68 () Bool)

(assert (= bs!68 d!275))

(declare-fun m!725 () Bool)

(assert (=> bs!68 m!725))

(assert (=> start!238 d!275))

(declare-fun d!285 () Bool)

(declare-fun isEmpty!30 (List!27) Bool)

(assert (=> d!285 (= (isEmpty!25 lm!258) (isEmpty!30 (toList!36 lm!258)))))

(declare-fun bs!70 () Bool)

(assert (= bs!70 d!285))

(declare-fun m!729 () Bool)

(assert (=> bs!70 m!729))

(assert (=> b!1995 d!285))

(declare-fun d!288 () Bool)

(assert (=> d!288 (= (head!749 (toList!36 lm!258)) (h!589 (toList!36 lm!258)))))

(assert (=> b!1994 d!288))

(declare-fun d!293 () Bool)

(declare-fun res!4558 () Bool)

(declare-fun e!532 () Bool)

(assert (=> d!293 (=> res!4558 e!532)))

(assert (=> d!293 (= res!4558 (is-Nil!24 (toList!36 lt!317)))))

(assert (=> d!293 (= (forall!20 (toList!36 lt!317) p!318) e!532)))

(declare-fun b!2072 () Bool)

(declare-fun e!533 () Bool)

(assert (=> b!2072 (= e!532 e!533)))

(declare-fun res!4559 () Bool)

(assert (=> b!2072 (=> (not res!4559) (not e!533))))

(assert (=> b!2072 (= res!4559 (dynLambda!14 p!318 (h!589 (toList!36 lt!317))))))

(declare-fun b!2073 () Bool)

(assert (=> b!2073 (= e!533 (forall!20 (t!2076 (toList!36 lt!317)) p!318))))

(assert (= (and d!293 (not res!4558)) b!2072))

(assert (= (and b!2072 res!4559) b!2073))

(declare-fun b_lambda!123 () Bool)

(assert (=> (not b_lambda!123) (not b!2072)))

(declare-fun t!2090 () Bool)

(declare-fun tb!59 () Bool)

(assert (=> (and start!238 (= p!318 p!318) t!2090) tb!59))

(declare-fun result!85 () Bool)

(assert (=> tb!59 (= result!85 true)))

(assert (=> b!2072 t!2090))

(declare-fun b_and!107 () Bool)

(assert (= b_and!103 (and (=> t!2090 result!85) b_and!107)))

(declare-fun m!731 () Bool)

(assert (=> b!2072 m!731))

(declare-fun m!733 () Bool)

(assert (=> b!2073 m!733))

(assert (=> b!1998 d!293))

(declare-fun d!295 () Bool)

(declare-fun tail!43 (List!27) List!27)

(assert (=> d!295 (= (tail!38 lm!258) (ListLongMap!42 (tail!43 (toList!36 lm!258))))))

(declare-fun bs!71 () Bool)

(assert (= bs!71 d!295))

(declare-fun m!735 () Bool)

(assert (=> bs!71 m!735))

(assert (=> b!1998 d!295))

(declare-fun b!2086 () Bool)

(declare-fun e!540 () Bool)

(declare-fun tp_is_empty!27 () Bool)

(declare-fun tp!155 () Bool)

(assert (=> b!2086 (= e!540 (and tp_is_empty!27 tp!155))))

(assert (=> b!1997 (= tp!137 e!540)))

(assert (= (and b!1997 (is-Cons!23 (toList!36 lm!258))) b!2086))

(declare-fun b_lambda!125 () Bool)

(assert (= b_lambda!123 (or (and start!238 b_free!37) b_lambda!125)))

(declare-fun b_lambda!127 () Bool)

(assert (= b_lambda!115 (or (and start!238 b_free!37) b_lambda!127)))

(push 1)

(assert (not b!2040))

(assert (not b!2073))

(assert tp_is_empty!27)

(assert (not b_next!37))

(assert (not b_lambda!125))

(assert (not b!2086))

(assert (not d!275))

(assert (not b_lambda!127))

(assert (not b!2056))

(assert (not d!295))

(assert (not b!2042))

(assert (not d!285))

(assert b_and!107)

(check-sat)

(pop 1)

(push 1)

(assert b_and!107)

(assert (not b_next!37))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!319 () Bool)

(declare-fun lt!337 () Int)

(assert (=> d!319 (>= lt!337 0)))

(declare-fun e!553 () Int)

(assert (=> d!319 (= lt!337 e!553)))

(declare-fun c!109 () Bool)

(assert (=> d!319 (= c!109 (is-Nil!24 (t!2076 (toList!36 lm!258))))))

(assert (=> d!319 (= (size!66 (t!2076 (toList!36 lm!258))) lt!337)))

(declare-fun b!2102 () Bool)

(assert (=> b!2102 (= e!553 0)))

(declare-fun b!2103 () Bool)

(assert (=> b!2103 (= e!553 (+ 1 (size!66 (t!2076 (t!2076 (toList!36 lm!258))))))))

(assert (= (and d!319 c!109) b!2102))

(assert (= (and d!319 (not c!109)) b!2103))

(declare-fun m!759 () Bool)

(assert (=> b!2103 m!759))

(assert (=> b!2042 d!319))

(declare-fun d!323 () Bool)

(declare-fun res!4583 () Bool)

(declare-fun e!571 () Bool)

(assert (=> d!323 (=> res!4583 e!571)))

(assert (=> d!323 (= res!4583 (or (is-Nil!24 (toList!36 lm!258)) (is-Nil!24 (t!2076 (toList!36 lm!258)))))))

(assert (=> d!323 (= (isStrictlySorted!11 (toList!36 lm!258)) e!571)))

(declare-fun b!2122 () Bool)

(declare-fun e!573 () Bool)

(assert (=> b!2122 (= e!571 e!573)))

(declare-fun res!4585 () Bool)

(assert (=> b!2122 (=> (not res!4585) (not e!573))))

(assert (=> b!2122 (= res!4585 (bvslt (_1!18 (h!589 (toList!36 lm!258))) (_1!18 (h!589 (t!2076 (toList!36 lm!258))))))))

(declare-fun b!2124 () Bool)

(assert (=> b!2124 (= e!573 (isStrictlySorted!11 (t!2076 (toList!36 lm!258))))))

(assert (= (and d!323 (not res!4583)) b!2122))

(assert (= (and b!2122 res!4585) b!2124))

(declare-fun m!767 () Bool)

(assert (=> b!2124 m!767))

(assert (=> d!275 d!323))

(declare-fun d!329 () Bool)

(declare-fun res!4586 () Bool)

(declare-fun e!576 () Bool)

(assert (=> d!329 (=> res!4586 e!576)))

(assert (=> d!329 (= res!4586 (is-Nil!24 (t!2076 (toList!36 lm!258))))))

(assert (=> d!329 (= (forall!20 (t!2076 (toList!36 lm!258)) p!318) e!576)))

(declare-fun b!2129 () Bool)

(declare-fun e!577 () Bool)

(assert (=> b!2129 (= e!576 e!577)))

(declare-fun res!4587 () Bool)

(assert (=> b!2129 (=> (not res!4587) (not e!577))))

(assert (=> b!2129 (= res!4587 (dynLambda!14 p!318 (h!589 (t!2076 (toList!36 lm!258)))))))

(declare-fun b!2130 () Bool)

(assert (=> b!2130 (= e!577 (forall!20 (t!2076 (t!2076 (toList!36 lm!258))) p!318))))

(assert (= (and d!329 (not res!4586)) b!2129))

(assert (= (and b!2129 res!4587) b!2130))

(declare-fun b_lambda!145 () Bool)

(assert (=> (not b_lambda!145) (not b!2129)))

(declare-fun t!2100 () Bool)

(declare-fun tb!69 () Bool)

(assert (=> (and start!238 (= p!318 p!318) t!2100) tb!69))

(declare-fun result!99 () Bool)

(assert (=> tb!69 (= result!99 true)))

(assert (=> b!2129 t!2100))

(declare-fun b_and!117 () Bool)

(assert (= b_and!107 (and (=> t!2100 result!99) b_and!117)))

(declare-fun m!773 () Bool)

(assert (=> b!2129 m!773))

(declare-fun m!775 () Bool)

(assert (=> b!2130 m!775))

(assert (=> b!2056 d!329))

(declare-fun d!333 () Bool)

(assert (=> d!333 (= (tail!43 (toList!36 lm!258)) (t!2076 (toList!36 lm!258)))))

(assert (=> d!295 d!333))

(declare-fun d!335 () Bool)

(declare-fun res!4588 () Bool)

(declare-fun e!579 () Bool)

(assert (=> d!335 (=> res!4588 e!579)))

(assert (=> d!335 (= res!4588 (is-Nil!24 (t!2076 (toList!36 lt!317))))))

(assert (=> d!335 (= (forall!20 (t!2076 (toList!36 lt!317)) p!318) e!579)))

(declare-fun b!2132 () Bool)

(declare-fun e!580 () Bool)

(assert (=> b!2132 (= e!579 e!580)))

(declare-fun res!4589 () Bool)

