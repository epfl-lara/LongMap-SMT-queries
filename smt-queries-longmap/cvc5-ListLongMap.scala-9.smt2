; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!380 () Bool)

(assert start!380)

(declare-fun b_free!53 () Bool)

(declare-fun b_next!53 () Bool)

(assert (=> start!380 (= b_free!53 (not b_next!53))))

(declare-fun tp!208 () Bool)

(declare-fun b_and!173 () Bool)

(assert (=> start!380 (= tp!208 b_and!173)))

(declare-fun b!2395 () Bool)

(assert (=> b!2395 true))

(assert (=> b!2395 true))

(declare-fun order!21 () Int)

(declare-fun order!23 () Int)

(declare-fun lambda!41 () Int)

(declare-fun p!318 () Int)

(declare-fun dynLambda!31 (Int Int) Int)

(declare-fun dynLambda!32 (Int Int) Int)

(assert (=> b!2395 (< (dynLambda!31 order!21 p!318) (dynLambda!32 order!23 lambda!41))))

(declare-fun res!4719 () Bool)

(declare-fun e!753 () Bool)

(assert (=> start!380 (=> (not res!4719) (not e!753))))

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

(declare-fun forall!33 (List!35 Int) Bool)

(assert (=> start!380 (= res!4719 (forall!33 (toList!44 lm!258) p!318))))

(assert (=> start!380 e!753))

(declare-fun e!752 () Bool)

(declare-fun inv!81 (ListLongMap!57) Bool)

(assert (=> start!380 (and (inv!81 lm!258) e!752)))

(assert (=> start!380 tp!208))

(assert (=> start!380 true))

(declare-fun b!2396 () Bool)

(declare-fun tp!209 () Bool)

(assert (=> b!2396 (= e!752 tp!209)))

(declare-fun k!394 () (_ BitVec 64))

(declare-datatypes ((Option!12 0))(
  ( (Some!11 (v!1106 B!288)) (None!10) )
))
(declare-fun forall!34 (Option!12 Int) Bool)

(declare-fun getValueByKey!6 (List!35 (_ BitVec 64)) Option!12)

(assert (=> b!2395 (= e!753 (not (forall!34 (getValueByKey!6 (toList!44 lm!258) k!394) lambda!41)))))

(declare-fun b!2393 () Bool)

(declare-fun res!4721 () Bool)

(assert (=> b!2393 (=> (not res!4721) (not e!753))))

(declare-fun e!751 () Bool)

(assert (=> b!2393 (= res!4721 e!751)))

(declare-fun res!4720 () Bool)

(assert (=> b!2393 (=> res!4720 e!751)))

(declare-fun isEmpty!39 (ListLongMap!57) Bool)

(assert (=> b!2393 (= res!4720 (isEmpty!39 lm!258))))

(declare-fun b!2394 () Bool)

(declare-fun head!757 (List!35) tuple2!52)

(assert (=> b!2394 (= e!751 (= (_1!26 (head!757 (toList!44 lm!258))) k!394))))

(assert (= (and start!380 res!4719) b!2393))

(assert (= (and b!2393 (not res!4720)) b!2394))

(assert (= (and b!2393 res!4721) b!2395))

(assert (= start!380 b!2396))

(declare-fun m!1017 () Bool)

(assert (=> start!380 m!1017))

(declare-fun m!1019 () Bool)

(assert (=> start!380 m!1019))

(declare-fun m!1021 () Bool)

(assert (=> b!2395 m!1021))

(assert (=> b!2395 m!1021))

(declare-fun m!1023 () Bool)

(assert (=> b!2395 m!1023))

(declare-fun m!1025 () Bool)

(assert (=> b!2393 m!1025))

(declare-fun m!1027 () Bool)

(assert (=> b!2394 m!1027))

(push 1)

(assert (not b!2393))

(assert (not start!380))

(assert (not b!2394))

(assert (not b_next!53))

(assert b_and!173)

(assert (not b!2395))

(assert (not b!2396))

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

(declare-fun dynLambda!33 (Int tuple2!52) Bool)

(assert (=> b!2405 (= res!4727 (dynLambda!33 p!318 (h!597 (toList!44 lm!258))))))

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

(declare-fun m!1031 () Bool)

(assert (=> b!2405 m!1031))

(declare-fun m!1033 () Bool)

(assert (=> b!2406 m!1033))

(assert (=> start!380 d!483))

(declare-fun d!489 () Bool)

(declare-fun isStrictlySorted!16 (List!35) Bool)

(assert (=> d!489 (= (inv!81 lm!258) (isStrictlySorted!16 (toList!44 lm!258)))))

(declare-fun bs!112 () Bool)

(assert (= bs!112 d!489))

(declare-fun m!1039 () Bool)

(assert (=> bs!112 m!1039))

(assert (=> start!380 d!489))

(declare-fun d!493 () Bool)

(assert (=> d!493 (= (head!757 (toList!44 lm!258)) (h!597 (toList!44 lm!258)))))

(assert (=> b!2394 d!493))

(declare-fun d!497 () Bool)

(declare-fun isEmpty!41 (List!35) Bool)

(assert (=> d!497 (= (isEmpty!39 lm!258) (isEmpty!41 (toList!44 lm!258)))))

(declare-fun bs!113 () Bool)

(assert (= bs!113 d!497))

(declare-fun m!1041 () Bool)

(assert (=> bs!113 m!1041))

(assert (=> b!2393 d!497))

(declare-fun d!501 () Bool)

(declare-fun res!4740 () Bool)

(declare-fun e!772 () Bool)

(assert (=> d!501 (=> res!4740 e!772)))

(assert (=> d!501 (= res!4740 (not (is-Some!11 (getValueByKey!6 (toList!44 lm!258) k!394))))))

(assert (=> d!501 (= (forall!34 (getValueByKey!6 (toList!44 lm!258) k!394) lambda!41) e!772)))

(declare-fun b!2419 () Bool)

(declare-fun dynLambda!35 (Int B!288) Bool)

(assert (=> b!2419 (= e!772 (dynLambda!35 lambda!41 (v!1106 (getValueByKey!6 (toList!44 lm!258) k!394))))))

(assert (= (and d!501 (not res!4740)) b!2419))

(declare-fun b_lambda!275 () Bool)

(assert (=> (not b_lambda!275) (not b!2419)))

(declare-fun m!1047 () Bool)

(assert (=> b!2419 m!1047))

(assert (=> b!2395 d!501))

(declare-fun b!2446 () Bool)

(declare-fun e!787 () Option!12)

(assert (=> b!2446 (= e!787 (Some!11 (_2!26 (h!597 (toList!44 lm!258)))))))

(declare-fun b!2447 () Bool)

(declare-fun e!788 () Option!12)

(assert (=> b!2447 (= e!787 e!788)))

(declare-fun c!163 () Bool)

(assert (=> b!2447 (= c!163 (and (is-Cons!31 (toList!44 lm!258)) (not (= (_1!26 (h!597 (toList!44 lm!258))) k!394))))))

(declare-fun d!509 () Bool)

(declare-fun c!162 () Bool)

(assert (=> d!509 (= c!162 (and (is-Cons!31 (toList!44 lm!258)) (= (_1!26 (h!597 (toList!44 lm!258))) k!394)))))

(assert (=> d!509 (= (getValueByKey!6 (toList!44 lm!258) k!394) e!787)))

(declare-fun b!2449 () Bool)

(assert (=> b!2449 (= e!788 None!10)))

(declare-fun b!2448 () Bool)

(assert (=> b!2448 (= e!788 (getValueByKey!6 (t!2144 (toList!44 lm!258)) k!394))))

(assert (= (and d!509 c!162) b!2446))

(assert (= (and d!509 (not c!162)) b!2447))

(assert (= (and b!2447 c!163) b!2448))

(assert (= (and b!2447 (not c!163)) b!2449))

(declare-fun m!1053 () Bool)

(assert (=> b!2448 m!1053))

(assert (=> b!2395 d!509))

(declare-fun b!2464 () Bool)

(declare-fun e!795 () Bool)

(declare-fun tp_is_empty!37 () Bool)

(declare-fun tp!212 () Bool)

(assert (=> b!2464 (= e!795 (and tp_is_empty!37 tp!212))))

(assert (=> b!2396 (= tp!209 e!795)))

(assert (= (and b!2396 (is-Cons!31 (toList!44 lm!258))) b!2464))

(declare-fun b_lambda!281 () Bool)

(assert (= b_lambda!271 (or (and start!380 b_free!53) b_lambda!281)))

(declare-fun b_lambda!283 () Bool)

(assert (= b_lambda!275 (or b!2395 b_lambda!283)))

(declare-fun bs!116 () Bool)

(declare-fun d!517 () Bool)

(assert (= bs!116 (and d!517 b!2395)))

(assert (=> bs!116 (= (dynLambda!35 lambda!41 (v!1106 (getValueByKey!6 (toList!44 lm!258) k!394))) (dynLambda!33 p!318 (tuple2!53 k!394 (v!1106 (getValueByKey!6 (toList!44 lm!258) k!394)))))))

(declare-fun b_lambda!285 () Bool)

(assert (=> (not b_lambda!285) (not bs!116)))

(declare-fun t!2150 () Bool)

(declare-fun tb!113 () Bool)

(assert (=> (and start!380 (= p!318 p!318) t!2150) tb!113))

(declare-fun result!153 () Bool)

(assert (=> tb!113 (= result!153 true)))

(assert (=> bs!116 t!2150))

(declare-fun b_and!179 () Bool)

(assert (= b_and!175 (and (=> t!2150 result!153) b_and!179)))

(declare-fun m!1059 () Bool)

(assert (=> bs!116 m!1059))

(assert (=> b!2419 d!517))

(push 1)

(assert (not b!2464))

(assert (not b!2448))

(assert (not b_lambda!285))

(assert (not d!497))

(assert b_and!179)

(assert (not b_lambda!283))

(assert (not b_next!53))

(assert (not b!2406))

(assert tp_is_empty!37)

(assert (not d!489))

(assert (not b_lambda!281))

(check-sat)

(pop 1)

(push 1)

(assert b_and!179)

(assert (not b_next!53))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!301 () Bool)

(assert (= b_lambda!285 (or (and start!380 b_free!53) b_lambda!301)))

(push 1)

(assert (not b!2464))

(assert (not b!2448))

(assert (not d!497))

(assert b_and!179)

(assert (not b_lambda!283))

(assert (not b_lambda!301))

(assert (not b_next!53))

(assert (not b!2406))

(assert tp_is_empty!37)

(assert (not d!489))

(assert (not b_lambda!281))

(check-sat)

(pop 1)

(push 1)

(assert b_and!179)

(assert (not b_next!53))

(check-sat)

(get-model)

(pop 1)

(declare-fun b!2479 () Bool)

(declare-fun e!808 () Option!12)

(assert (=> b!2479 (= e!808 (Some!11 (_2!26 (h!597 (t!2144 (toList!44 lm!258))))))))

(declare-fun b!2480 () Bool)

(declare-fun e!809 () Option!12)

(assert (=> b!2480 (= e!808 e!809)))

(declare-fun c!169 () Bool)

(assert (=> b!2480 (= c!169 (and (is-Cons!31 (t!2144 (toList!44 lm!258))) (not (= (_1!26 (h!597 (t!2144 (toList!44 lm!258)))) k!394))))))

(declare-fun d!525 () Bool)

(declare-fun c!168 () Bool)

(assert (=> d!525 (= c!168 (and (is-Cons!31 (t!2144 (toList!44 lm!258))) (= (_1!26 (h!597 (t!2144 (toList!44 lm!258)))) k!394)))))

(assert (=> d!525 (= (getValueByKey!6 (t!2144 (toList!44 lm!258)) k!394) e!808)))

(declare-fun b!2482 () Bool)

(assert (=> b!2482 (= e!809 None!10)))

(declare-fun b!2481 () Bool)

(assert (=> b!2481 (= e!809 (getValueByKey!6 (t!2144 (t!2144 (toList!44 lm!258))) k!394))))

(assert (= (and d!525 c!168) b!2479))

(assert (= (and d!525 (not c!168)) b!2480))

(assert (= (and b!2480 c!169) b!2481))

(assert (= (and b!2480 (not c!169)) b!2482))

(declare-fun m!1071 () Bool)

(assert (=> b!2481 m!1071))

(assert (=> b!2448 d!525))

(declare-fun d!527 () Bool)

(declare-fun res!4749 () Bool)

(declare-fun e!810 () Bool)

(assert (=> d!527 (=> res!4749 e!810)))

(assert (=> d!527 (= res!4749 (is-Nil!32 (t!2144 (toList!44 lm!258))))))

(assert (=> d!527 (= (forall!33 (t!2144 (toList!44 lm!258)) p!318) e!810)))

(declare-fun b!2483 () Bool)

(declare-fun e!811 () Bool)

(assert (=> b!2483 (= e!810 e!811)))

(declare-fun res!4750 () Bool)

(assert (=> b!2483 (=> (not res!4750) (not e!811))))

(assert (=> b!2483 (= res!4750 (dynLambda!33 p!318 (h!597 (t!2144 (toList!44 lm!258)))))))

(declare-fun b!2484 () Bool)

(assert (=> b!2484 (= e!811 (forall!33 (t!2144 (t!2144 (toList!44 lm!258))) p!318))))

(assert (= (and d!527 (not res!4749)) b!2483))

(assert (= (and b!2483 res!4750) b!2484))

(declare-fun b_lambda!307 () Bool)

(assert (=> (not b_lambda!307) (not b!2483)))

(declare-fun t!2158 () Bool)

(declare-fun tb!121 () Bool)

(assert (=> (and start!380 (= p!318 p!318) t!2158) tb!121))

(declare-fun result!163 () Bool)

(assert (=> tb!121 (= result!163 true)))

(assert (=> b!2483 t!2158))

(declare-fun b_and!187 () Bool)

(assert (= b_and!179 (and (=> t!2158 result!163) b_and!187)))

(declare-fun m!1073 () Bool)

(assert (=> b!2483 m!1073))

(declare-fun m!1075 () Bool)

(assert (=> b!2484 m!1075))

(assert (=> b!2406 d!527))

(declare-fun d!529 () Bool)

(declare-fun res!4757 () Bool)

(declare-fun e!820 () Bool)

(assert (=> d!529 (=> res!4757 e!820)))

(assert (=> d!529 (= res!4757 (or (is-Nil!32 (toList!44 lm!258)) (is-Nil!32 (t!2144 (toList!44 lm!258)))))))

(assert (=> d!529 (= (isStrictlySorted!16 (toList!44 lm!258)) e!820)))

(declare-fun b!2495 () Bool)

(declare-fun e!821 () Bool)

(assert (=> b!2495 (= e!820 e!821)))

(declare-fun res!4758 () Bool)

(assert (=> b!2495 (=> (not res!4758) (not e!821))))

(assert (=> b!2495 (= res!4758 (bvslt (_1!26 (h!597 (toList!44 lm!258))) (_1!26 (h!597 (t!2144 (toList!44 lm!258))))))))

(declare-fun b!2496 () Bool)

(assert (=> b!2496 (= e!821 (isStrictlySorted!16 (t!2144 (toList!44 lm!258))))))

(assert (= (and d!529 (not res!4757)) b!2495))

(assert (= (and b!2495 res!4758) b!2496))

(declare-fun m!1083 () Bool)

(assert (=> b!2496 m!1083))

(assert (=> d!489 d!529))

(declare-fun d!539 () Bool)

(assert (=> d!539 (= (isEmpty!41 (toList!44 lm!258)) (is-Nil!32 (toList!44 lm!258)))))

(assert (=> d!497 d!539))

(declare-fun b!2497 () Bool)

(declare-fun e!822 () Bool)

(declare-fun tp!219 () Bool)

(assert (=> b!2497 (= e!822 (and tp_is_empty!37 tp!219))))

(assert (=> b!2464 (= tp!212 e!822)))

(assert (= (and b!2464 (is-Cons!31 (t!2144 (toList!44 lm!258)))) b!2497))

(declare-fun b_lambda!311 () Bool)

(assert (= b_lambda!307 (or (and start!380 b_free!53) b_lambda!311)))

(push 1)

(assert (not b!2484))

(assert (not b_lambda!281))

(assert (not b_lambda!301))

(assert (not b!2497))

(assert (not b!2496))

(assert (not b_next!53))

(assert tp_is_empty!37)

(assert b_and!187)

(assert (not b!2481))

(assert (not b_lambda!311))

(assert (not b_lambda!283))

(check-sat)

(pop 1)

(push 1)

(assert b_and!187)

(assert (not b_next!53))

(check-sat)

(pop 1)

