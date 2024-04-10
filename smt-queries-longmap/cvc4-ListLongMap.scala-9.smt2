; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!380 () Bool)

(assert start!380)

(declare-fun b_free!53 () Bool)

(declare-fun b_next!53 () Bool)

(assert (=> start!380 (= b_free!53 (not b_next!53))))

(declare-fun tp!209 () Bool)

(declare-fun b_and!173 () Bool)

(assert (=> start!380 (= tp!209 b_and!173)))

(declare-fun b!2395 () Bool)

(assert (=> b!2395 true))

(assert (=> b!2395 true))

(declare-fun order!23 () Int)

(declare-fun order!21 () Int)

(declare-fun lambda!41 () Int)

(declare-fun p!318 () Int)

(declare-fun dynLambda!31 (Int Int) Int)

(declare-fun dynLambda!32 (Int Int) Int)

(assert (=> b!2395 (< (dynLambda!31 order!21 p!318) (dynLambda!32 order!23 lambda!41))))

(declare-fun b!2396 () Bool)

(declare-fun e!751 () Bool)

(declare-fun tp!208 () Bool)

(assert (=> b!2396 (= e!751 tp!208)))

(declare-fun b!2393 () Bool)

(declare-fun res!4721 () Bool)

(declare-fun e!752 () Bool)

(assert (=> b!2393 (=> (not res!4721) (not e!752))))

(declare-fun e!753 () Bool)

(assert (=> b!2393 (= res!4721 e!753)))

(declare-fun res!4720 () Bool)

(assert (=> b!2393 (=> res!4720 e!753)))

(declare-datatypes ((B!288 0))(
  ( (B!289 (val!26 Int)) )
))
(declare-datatypes ((tuple2!52 0))(
  ( (tuple2!53 (_1!26 (_ BitVec 64)) (_2!26 B!288)) )
))
(declare-datatypes ((List!35 0))(
  ( (Nil!32) (Cons!31 (h!597 tuple2!52) (t!2144 List!35)) )
))
(declare-datatypes ((ListLongMap!57 0))(
  ( (ListLongMap!58 (toList!44 List!35)) )
))
(declare-fun lm!258 () ListLongMap!57)

(declare-fun isEmpty!39 (ListLongMap!57) Bool)

(assert (=> b!2393 (= res!4720 (isEmpty!39 lm!258))))

(declare-fun res!4719 () Bool)

(assert (=> start!380 (=> (not res!4719) (not e!752))))

(declare-fun forall!33 (List!35 Int) Bool)

(assert (=> start!380 (= res!4719 (forall!33 (toList!44 lm!258) p!318))))

(assert (=> start!380 e!752))

(declare-fun inv!81 (ListLongMap!57) Bool)

(assert (=> start!380 (and (inv!81 lm!258) e!751)))

(assert (=> start!380 tp!209))

(assert (=> start!380 true))

(declare-fun k!394 () (_ BitVec 64))

(declare-datatypes ((Option!12 0))(
  ( (Some!11 (v!1106 B!288)) (None!10) )
))
(declare-fun forall!34 (Option!12 Int) Bool)

(declare-fun getValueByKey!6 (List!35 (_ BitVec 64)) Option!12)

(assert (=> b!2395 (= e!752 (not (forall!34 (getValueByKey!6 (toList!44 lm!258) k!394) lambda!41)))))

(declare-fun b!2394 () Bool)

(declare-fun head!757 (List!35) tuple2!52)

(assert (=> b!2394 (= e!753 (= (_1!26 (head!757 (toList!44 lm!258))) k!394))))

(assert (= (and start!380 res!4719) b!2393))

(assert (= (and b!2393 (not res!4720)) b!2394))

(assert (= (and b!2393 res!4721) b!2395))

(assert (= start!380 b!2396))

(declare-fun m!1017 () Bool)

(assert (=> b!2393 m!1017))

(declare-fun m!1019 () Bool)

(assert (=> start!380 m!1019))

(declare-fun m!1021 () Bool)

(assert (=> start!380 m!1021))

(declare-fun m!1023 () Bool)

(assert (=> b!2395 m!1023))

(assert (=> b!2395 m!1023))

(declare-fun m!1025 () Bool)

(assert (=> b!2395 m!1025))

(declare-fun m!1027 () Bool)

(assert (=> b!2394 m!1027))

(push 1)

(assert (not b!2394))

(assert (not b_next!53))

(assert b_and!173)

(assert (not b!2395))

(assert (not b!2393))

(assert (not b!2396))

(assert (not start!380))

(check-sat)

(pop 1)

(push 1)

(assert b_and!173)

(assert (not b_next!53))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!483 () Bool)

(declare-fun res!4726 () Bool)

(declare-fun e!758 () Bool)

(assert (=> d!483 (=> res!4726 e!758)))

(assert (=> d!483 (= res!4726 (is-Nil!32 (toList!44 lm!258)))))

(assert (=> d!483 (= (forall!33 (toList!44 lm!258) p!318) e!758)))

(declare-fun b!2405 () Bool)

(declare-fun e!759 () Bool)

(assert (=> b!2405 (= e!758 e!759)))

(declare-fun res!4727 () Bool)

(assert (=> b!2405 (=> (not res!4727) (not e!759))))

(declare-fun dynLambda!34 (Int tuple2!52) Bool)

(assert (=> b!2405 (= res!4727 (dynLambda!34 p!318 (h!597 (toList!44 lm!258))))))

(declare-fun b!2406 () Bool)

(assert (=> b!2406 (= e!759 (forall!33 (t!2144 (toList!44 lm!258)) p!318))))

(assert (= (and d!483 (not res!4726)) b!2405))

(assert (= (and b!2405 res!4727) b!2406))

(declare-fun b_lambda!271 () Bool)

(assert (=> (not b_lambda!271) (not b!2405)))

(declare-fun t!2146 () Bool)

(declare-fun tb!109 () Bool)

(assert (=> (and start!380 (= p!318 p!318) t!2146) tb!109))

(declare-fun result!145 () Bool)

(assert (=> tb!109 (= result!145 true)))

(assert (=> b!2405 t!2146))

(declare-fun b_and!175 () Bool)

(assert (= b_and!173 (and (=> t!2146 result!145) b_and!175)))

(declare-fun m!1029 () Bool)

(assert (=> b!2405 m!1029))

(declare-fun m!1031 () Bool)

(assert (=> b!2406 m!1031))

(assert (=> start!380 d!483))

(declare-fun d!487 () Bool)

(declare-fun isStrictlySorted!16 (List!35) Bool)

(assert (=> d!487 (= (inv!81 lm!258) (isStrictlySorted!16 (toList!44 lm!258)))))

(declare-fun bs!111 () Bool)

(assert (= bs!111 d!487))

(declare-fun m!1033 () Bool)

(assert (=> bs!111 m!1033))

(assert (=> start!380 d!487))

(declare-fun d!493 () Bool)

(declare-fun isEmpty!40 (List!35) Bool)

(assert (=> d!493 (= (isEmpty!39 lm!258) (isEmpty!40 (toList!44 lm!258)))))

(declare-fun bs!112 () Bool)

(assert (= bs!112 d!493))

(declare-fun m!1037 () Bool)

(assert (=> bs!112 m!1037))

(assert (=> b!2393 d!493))

(declare-fun d!497 () Bool)

(declare-fun res!4736 () Bool)

(declare-fun e!772 () Bool)

(assert (=> d!497 (=> res!4736 e!772)))

(assert (=> d!497 (= res!4736 (not (is-Some!11 (getValueByKey!6 (toList!44 lm!258) k!394))))))

(assert (=> d!497 (= (forall!34 (getValueByKey!6 (toList!44 lm!258) k!394) lambda!41) e!772)))

(declare-fun b!2423 () Bool)

(declare-fun dynLambda!37 (Int B!288) Bool)

(assert (=> b!2423 (= e!772 (dynLambda!37 lambda!41 (v!1106 (getValueByKey!6 (toList!44 lm!258) k!394))))))

(assert (= (and d!497 (not res!4736)) b!2423))

(declare-fun b_lambda!277 () Bool)

(assert (=> (not b_lambda!277) (not b!2423)))

(declare-fun m!1043 () Bool)

(assert (=> b!2423 m!1043))

(assert (=> b!2395 d!497))

(declare-fun b!2454 () Bool)

(declare-fun e!791 () Option!12)

(assert (=> b!2454 (= e!791 (Some!11 (_2!26 (h!597 (toList!44 lm!258)))))))

(declare-fun b!2455 () Bool)

(declare-fun e!792 () Option!12)

(assert (=> b!2455 (= e!791 e!792)))

(declare-fun c!167 () Bool)

(assert (=> b!2455 (= c!167 (and (is-Cons!31 (toList!44 lm!258)) (not (= (_1!26 (h!597 (toList!44 lm!258))) k!394))))))

(declare-fun d!503 () Bool)

(declare-fun c!166 () Bool)

(assert (=> d!503 (= c!166 (and (is-Cons!31 (toList!44 lm!258)) (= (_1!26 (h!597 (toList!44 lm!258))) k!394)))))

(assert (=> d!503 (= (getValueByKey!6 (toList!44 lm!258) k!394) e!791)))

(declare-fun b!2457 () Bool)

(assert (=> b!2457 (= e!792 None!10)))

(declare-fun b!2456 () Bool)

(assert (=> b!2456 (= e!792 (getValueByKey!6 (t!2144 (toList!44 lm!258)) k!394))))

(assert (= (and d!503 c!166) b!2454))

(assert (= (and d!503 (not c!166)) b!2455))

(assert (= (and b!2455 c!167) b!2456))

(assert (= (and b!2455 (not c!167)) b!2457))

(declare-fun m!1051 () Bool)

(assert (=> b!2456 m!1051))

(assert (=> b!2395 d!503))

(declare-fun d!511 () Bool)

(assert (=> d!511 (= (head!757 (toList!44 lm!258)) (h!597 (toList!44 lm!258)))))

(assert (=> b!2394 d!511))

(declare-fun b!2468 () Bool)

(declare-fun e!801 () Bool)

(declare-fun tp_is_empty!37 () Bool)

(declare-fun tp!212 () Bool)

(assert (=> b!2468 (= e!801 (and tp_is_empty!37 tp!212))))

(assert (=> b!2396 (= tp!208 e!801)))

(assert (= (and b!2396 (is-Cons!31 (toList!44 lm!258))) b!2468))

(declare-fun b_lambda!283 () Bool)

(assert (= b_lambda!277 (or b!2395 b_lambda!283)))

(declare-fun bs!115 () Bool)

(declare-fun d!517 () Bool)

(assert (= bs!115 (and d!517 b!2395)))

(assert (=> bs!115 (= (dynLambda!37 lambda!41 (v!1106 (getValueByKey!6 (toList!44 lm!258) k!394))) (dynLambda!34 p!318 (tuple2!53 k!394 (v!1106 (getValueByKey!6 (toList!44 lm!258) k!394)))))))

(declare-fun b_lambda!287 () Bool)

(assert (=> (not b_lambda!287) (not bs!115)))

(declare-fun t!2152 () Bool)

(declare-fun tb!115 () Bool)

(assert (=> (and start!380 (= p!318 p!318) t!2152) tb!115))

(declare-fun result!155 () Bool)

(assert (=> tb!115 (= result!155 true)))

(assert (=> bs!115 t!2152))

(declare-fun b_and!181 () Bool)

(assert (= b_and!175 (and (=> t!2152 result!155) b_and!181)))

(declare-fun m!1061 () Bool)

(assert (=> bs!115 m!1061))

(assert (=> b!2423 d!517))

(declare-fun b_lambda!285 () Bool)

(assert (= b_lambda!271 (or (and start!380 b_free!53) b_lambda!285)))

(push 1)

(assert (not b_next!53))

(assert (not b_lambda!287))

(assert (not b_lambda!283))

(assert (not d!487))

(assert b_and!181)

(assert (not b!2468))

(assert (not d!493))

(assert tp_is_empty!37)

(assert (not b!2456))

(assert (not b_lambda!285))

(assert (not b!2406))

(check-sat)

(pop 1)

(push 1)

(assert b_and!181)

(assert (not b_next!53))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!305 () Bool)

(assert (= b_lambda!287 (or (and start!380 b_free!53) b_lambda!305)))

(push 1)

(assert (not b_lambda!305))

(assert (not b_next!53))

(assert (not b_lambda!283))

(assert (not d!487))

(assert b_and!181)

(assert (not b!2468))

(assert (not d!493))

(assert tp_is_empty!37)

(assert (not b!2456))

(assert (not b_lambda!285))

(assert (not b!2406))

(check-sat)

(pop 1)

(push 1)

(assert b_and!181)

(assert (not b_next!53))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!541 () Bool)

(declare-fun res!4769 () Bool)

(declare-fun e!834 () Bool)

(assert (=> d!541 (=> res!4769 e!834)))

(assert (=> d!541 (= res!4769 (or (is-Nil!32 (toList!44 lm!258)) (is-Nil!32 (t!2144 (toList!44 lm!258)))))))

(assert (=> d!541 (= (isStrictlySorted!16 (toList!44 lm!258)) e!834)))

(declare-fun b!2509 () Bool)

(declare-fun e!835 () Bool)

(assert (=> b!2509 (= e!834 e!835)))

(declare-fun res!4770 () Bool)

(assert (=> b!2509 (=> (not res!4770) (not e!835))))

(assert (=> b!2509 (= res!4770 (bvslt (_1!26 (h!597 (toList!44 lm!258))) (_1!26 (h!597 (t!2144 (toList!44 lm!258))))))))

(declare-fun b!2510 () Bool)

(assert (=> b!2510 (= e!835 (isStrictlySorted!16 (t!2144 (toList!44 lm!258))))))

(assert (= (and d!541 (not res!4769)) b!2509))

(assert (= (and b!2509 res!4770) b!2510))

(declare-fun m!1087 () Bool)

(assert (=> b!2510 m!1087))

(assert (=> d!487 d!541))

(declare-fun d!543 () Bool)

(declare-fun res!4771 () Bool)

(declare-fun e!836 () Bool)

(assert (=> d!543 (=> res!4771 e!836)))

(assert (=> d!543 (= res!4771 (is-Nil!32 (t!2144 (toList!44 lm!258))))))

(assert (=> d!543 (= (forall!33 (t!2144 (toList!44 lm!258)) p!318) e!836)))

(declare-fun b!2511 () Bool)

(declare-fun e!837 () Bool)

(assert (=> b!2511 (= e!836 e!837)))

(declare-fun res!4772 () Bool)

(assert (=> b!2511 (=> (not res!4772) (not e!837))))

(assert (=> b!2511 (= res!4772 (dynLambda!34 p!318 (h!597 (t!2144 (toList!44 lm!258)))))))

(declare-fun b!2512 () Bool)

(assert (=> b!2512 (= e!837 (forall!33 (t!2144 (t!2144 (toList!44 lm!258))) p!318))))

(assert (= (and d!543 (not res!4771)) b!2511))

(assert (= (and b!2511 res!4772) b!2512))

