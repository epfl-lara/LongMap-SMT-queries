; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!376 () Bool)

(assert start!376)

(declare-fun b_free!49 () Bool)

(declare-fun b_next!49 () Bool)

(assert (=> start!376 (= b_free!49 (not b_next!49))))

(declare-fun tp!197 () Bool)

(declare-fun b_and!169 () Bool)

(assert (=> start!376 (= tp!197 b_and!169)))

(declare-fun b!2363 () Bool)

(assert (=> b!2363 true))

(assert (=> b!2363 true))

(declare-fun lambda!35 () Int)

(declare-fun order!15 () Int)

(declare-fun p!318 () Int)

(declare-fun order!13 () Int)

(declare-fun dynLambda!27 (Int Int) Int)

(declare-fun dynLambda!28 (Int Int) Int)

(assert (=> b!2363 (< (dynLambda!27 order!13 p!318) (dynLambda!28 order!15 lambda!35))))

(declare-fun b!2362 () Bool)

(declare-fun e!734 () Bool)

(declare-datatypes ((B!284 0))(
  ( (B!285 (val!24 Int)) )
))
(declare-datatypes ((tuple2!48 0))(
  ( (tuple2!49 (_1!24 (_ BitVec 64)) (_2!24 B!284)) )
))
(declare-datatypes ((List!33 0))(
  ( (Nil!30) (Cons!29 (h!595 tuple2!48) (t!2142 List!33)) )
))
(declare-datatypes ((ListLongMap!53 0))(
  ( (ListLongMap!54 (toList!42 List!33)) )
))
(declare-fun lm!258 () ListLongMap!53)

(declare-fun k!394 () (_ BitVec 64))

(declare-fun head!755 (List!33) tuple2!48)

(assert (=> b!2362 (= e!734 (= (_1!24 (head!755 (toList!42 lm!258))) k!394))))

(declare-fun b!2364 () Bool)

(declare-fun e!733 () Bool)

(declare-fun tp!196 () Bool)

(assert (=> b!2364 (= e!733 tp!196)))

(declare-fun b!2361 () Bool)

(declare-fun res!4703 () Bool)

(declare-fun e!735 () Bool)

(assert (=> b!2361 (=> (not res!4703) (not e!735))))

(assert (=> b!2361 (= res!4703 e!734)))

(declare-fun res!4702 () Bool)

(assert (=> b!2361 (=> res!4702 e!734)))

(declare-fun isEmpty!37 (ListLongMap!53) Bool)

(assert (=> b!2361 (= res!4702 (isEmpty!37 lm!258))))

(declare-fun res!4701 () Bool)

(assert (=> start!376 (=> (not res!4701) (not e!735))))

(declare-fun forall!29 (List!33 Int) Bool)

(assert (=> start!376 (= res!4701 (forall!29 (toList!42 lm!258) p!318))))

(assert (=> start!376 e!735))

(declare-fun inv!79 (ListLongMap!53) Bool)

(assert (=> start!376 (and (inv!79 lm!258) e!733)))

(assert (=> start!376 tp!197))

(assert (=> start!376 true))

(declare-datatypes ((Option!10 0))(
  ( (Some!9 (v!1100 B!284)) (None!8) )
))
(declare-fun forall!30 (Option!10 Int) Bool)

(declare-fun getValueByKey!4 (List!33 (_ BitVec 64)) Option!10)

(assert (=> b!2363 (= e!735 (not (forall!30 (getValueByKey!4 (toList!42 lm!258) k!394) lambda!35)))))

(assert (= (and start!376 res!4701) b!2361))

(assert (= (and b!2361 (not res!4702)) b!2362))

(assert (= (and b!2361 res!4703) b!2363))

(assert (= start!376 b!2364))

(declare-fun m!993 () Bool)

(assert (=> b!2362 m!993))

(declare-fun m!995 () Bool)

(assert (=> b!2361 m!995))

(declare-fun m!997 () Bool)

(assert (=> start!376 m!997))

(declare-fun m!999 () Bool)

(assert (=> start!376 m!999))

(declare-fun m!1001 () Bool)

(assert (=> b!2363 m!1001))

(assert (=> b!2363 m!1001))

(declare-fun m!1003 () Bool)

(assert (=> b!2363 m!1003))

(push 1)

(assert (not b!2361))

(assert b_and!169)

(assert (not b!2363))

(assert (not b!2362))

(assert (not b_next!49))

(assert (not start!376))

(assert (not b!2364))

(check-sat)

(pop 1)

(push 1)

(assert b_and!169)

(assert (not b_next!49))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!485 () Bool)

(declare-fun res!4730 () Bool)

(declare-fun e!762 () Bool)

(assert (=> d!485 (=> res!4730 e!762)))

(assert (=> d!485 (= res!4730 (not (is-Some!9 (getValueByKey!4 (toList!42 lm!258) k!394))))))

(assert (=> d!485 (= (forall!30 (getValueByKey!4 (toList!42 lm!258) k!394) lambda!35) e!762)))

(declare-fun b!2409 () Bool)

(declare-fun dynLambda!33 (Int B!284) Bool)

(assert (=> b!2409 (= e!762 (dynLambda!33 lambda!35 (v!1100 (getValueByKey!4 (toList!42 lm!258) k!394))))))

(assert (= (and d!485 (not res!4730)) b!2409))

(declare-fun b_lambda!273 () Bool)

(assert (=> (not b_lambda!273) (not b!2409)))

(declare-fun m!1035 () Bool)

(assert (=> b!2409 m!1035))

(assert (=> b!2363 d!485))

(declare-fun b!2425 () Bool)

(declare-fun e!773 () Option!10)

(declare-fun e!774 () Option!10)

(assert (=> b!2425 (= e!773 e!774)))

(declare-fun c!155 () Bool)

(assert (=> b!2425 (= c!155 (and (is-Cons!29 (toList!42 lm!258)) (not (= (_1!24 (h!595 (toList!42 lm!258))) k!394))))))

(declare-fun b!2424 () Bool)

(assert (=> b!2424 (= e!773 (Some!9 (_2!24 (h!595 (toList!42 lm!258)))))))

(declare-fun b!2427 () Bool)

(assert (=> b!2427 (= e!774 None!8)))

(declare-fun d!495 () Bool)

(declare-fun c!154 () Bool)

(assert (=> d!495 (= c!154 (and (is-Cons!29 (toList!42 lm!258)) (= (_1!24 (h!595 (toList!42 lm!258))) k!394)))))

(assert (=> d!495 (= (getValueByKey!4 (toList!42 lm!258) k!394) e!773)))

(declare-fun b!2426 () Bool)

(assert (=> b!2426 (= e!774 (getValueByKey!4 (t!2142 (toList!42 lm!258)) k!394))))

(assert (= (and d!495 c!154) b!2424))

(assert (= (and d!495 (not c!154)) b!2425))

(assert (= (and b!2425 c!155) b!2426))

(assert (= (and b!2425 (not c!155)) b!2427))

(declare-fun m!1041 () Bool)

(assert (=> b!2426 m!1041))

(assert (=> b!2363 d!495))

(declare-fun d!501 () Bool)

(assert (=> d!501 (= (head!755 (toList!42 lm!258)) (h!595 (toList!42 lm!258)))))

(assert (=> b!2362 d!501))

(declare-fun d!505 () Bool)

(declare-fun res!4741 () Bool)

(declare-fun e!787 () Bool)

(assert (=> d!505 (=> res!4741 e!787)))

(assert (=> d!505 (= res!4741 (is-Nil!30 (toList!42 lm!258)))))

(assert (=> d!505 (= (forall!29 (toList!42 lm!258) p!318) e!787)))

(declare-fun b!2448 () Bool)

(declare-fun e!788 () Bool)

(assert (=> b!2448 (= e!787 e!788)))

(declare-fun res!4742 () Bool)

(assert (=> b!2448 (=> (not res!4742) (not e!788))))

(declare-fun dynLambda!36 (Int tuple2!48) Bool)

(assert (=> b!2448 (= res!4742 (dynLambda!36 p!318 (h!595 (toList!42 lm!258))))))

(declare-fun b!2449 () Bool)

(assert (=> b!2449 (= e!788 (forall!29 (t!2142 (toList!42 lm!258)) p!318))))

(assert (= (and d!505 (not res!4741)) b!2448))

(assert (= (and b!2448 res!4742) b!2449))

(declare-fun b_lambda!279 () Bool)

(assert (=> (not b_lambda!279) (not b!2448)))

(declare-fun t!2148 () Bool)

(declare-fun tb!111 () Bool)

(assert (=> (and start!376 (= p!318 p!318) t!2148) tb!111))

(declare-fun result!147 () Bool)

(assert (=> tb!111 (= result!147 true)))

(assert (=> b!2448 t!2148))

(declare-fun b_and!177 () Bool)

(assert (= b_and!169 (and (=> t!2148 result!147) b_and!177)))

(declare-fun m!1047 () Bool)

(assert (=> b!2448 m!1047))

(declare-fun m!1049 () Bool)

(assert (=> b!2449 m!1049))

(assert (=> start!376 d!505))

(declare-fun d!509 () Bool)

(declare-fun isStrictlySorted!17 (List!33) Bool)

(assert (=> d!509 (= (inv!79 lm!258) (isStrictlySorted!17 (toList!42 lm!258)))))

(declare-fun bs!113 () Bool)

(assert (= bs!113 d!509))

(declare-fun m!1053 () Bool)

(assert (=> bs!113 m!1053))

(assert (=> start!376 d!509))

(declare-fun d!513 () Bool)

(declare-fun isEmpty!41 (List!33) Bool)

(assert (=> d!513 (= (isEmpty!37 lm!258) (isEmpty!41 (toList!42 lm!258)))))

(declare-fun bs!114 () Bool)

(assert (= bs!114 d!513))

(declare-fun m!1055 () Bool)

(assert (=> bs!114 m!1055))

(assert (=> b!2361 d!513))

(declare-fun b!2473 () Bool)

(declare-fun e!804 () Bool)

(declare-fun tp_is_empty!39 () Bool)

(declare-fun tp!215 () Bool)

(assert (=> b!2473 (= e!804 (and tp_is_empty!39 tp!215))))

(assert (=> b!2364 (= tp!196 e!804)))

(assert (= (and b!2364 (is-Cons!29 (toList!42 lm!258))) b!2473))

(declare-fun b_lambda!289 () Bool)

(assert (= b_lambda!273 (or b!2363 b_lambda!289)))

(declare-fun bs!116 () Bool)

(declare-fun d!519 () Bool)

(assert (= bs!116 (and d!519 b!2363)))

(assert (=> bs!116 (= (dynLambda!33 lambda!35 (v!1100 (getValueByKey!4 (toList!42 lm!258) k!394))) (dynLambda!36 p!318 (tuple2!49 k!394 (v!1100 (getValueByKey!4 (toList!42 lm!258) k!394)))))))

(declare-fun b_lambda!293 () Bool)

(assert (=> (not b_lambda!293) (not bs!116)))

(declare-fun t!2154 () Bool)

(declare-fun tb!117 () Bool)

(assert (=> (and start!376 (= p!318 p!318) t!2154) tb!117))

(declare-fun result!157 () Bool)

(assert (=> tb!117 (= result!157 true)))

(assert (=> bs!116 t!2154))

(declare-fun b_and!183 () Bool)

(assert (= b_and!177 (and (=> t!2154 result!157) b_and!183)))

(declare-fun m!1063 () Bool)

(assert (=> bs!116 m!1063))

(assert (=> b!2409 d!519))

(declare-fun b_lambda!291 () Bool)

(assert (= b_lambda!279 (or (and start!376 b_free!49) b_lambda!291)))

(push 1)

(assert (not d!513))

(assert (not b_lambda!291))

(assert b_and!183)

(assert (not b_lambda!289))

(assert (not d!509))

(assert (not b_lambda!293))

(assert (not b!2426))

(assert (not b_next!49))

(assert tp_is_empty!39)

(assert (not b!2473))

(assert (not b!2449))

(check-sat)

(pop 1)

(push 1)

(assert b_and!183)

(assert (not b_next!49))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!303 () Bool)

(assert (= b_lambda!293 (or (and start!376 b_free!49) b_lambda!303)))

(push 1)

(assert (not b_lambda!303))

(assert (not d!513))

(assert (not b_lambda!291))

(assert b_and!183)

(assert (not b_lambda!289))

(assert (not d!509))

(assert (not b!2426))

(assert (not b_next!49))

(assert tp_is_empty!39)

(assert (not b!2473))

(assert (not b!2449))

(check-sat)

(pop 1)

(push 1)

(assert b_and!183)

(assert (not b_next!49))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!525 () Bool)

(declare-fun res!4749 () Bool)

(declare-fun e!808 () Bool)

(assert (=> d!525 (=> res!4749 e!808)))

(assert (=> d!525 (= res!4749 (is-Nil!30 (t!2142 (toList!42 lm!258))))))

(assert (=> d!525 (= (forall!29 (t!2142 (toList!42 lm!258)) p!318) e!808)))

(declare-fun b!2479 () Bool)

(declare-fun e!809 () Bool)

(assert (=> b!2479 (= e!808 e!809)))

(declare-fun res!4750 () Bool)

(assert (=> b!2479 (=> (not res!4750) (not e!809))))

(assert (=> b!2479 (= res!4750 (dynLambda!36 p!318 (h!595 (t!2142 (toList!42 lm!258)))))))

(declare-fun b!2480 () Bool)

(assert (=> b!2480 (= e!809 (forall!29 (t!2142 (t!2142 (toList!42 lm!258))) p!318))))

(assert (= (and d!525 (not res!4749)) b!2479))

(assert (= (and b!2479 res!4750) b!2480))

(declare-fun b_lambda!307 () Bool)

(assert (=> (not b_lambda!307) (not b!2479)))

(declare-fun t!2158 () Bool)

(declare-fun tb!121 () Bool)

(assert (=> (and start!376 (= p!318 p!318) t!2158) tb!121))

(declare-fun result!163 () Bool)

(assert (=> tb!121 (= result!163 true)))

(assert (=> b!2479 t!2158))

(declare-fun b_and!187 () Bool)

(assert (= b_and!183 (and (=> t!2158 result!163) b_and!187)))

(declare-fun m!1071 () Bool)

(assert (=> b!2479 m!1071))

(declare-fun m!1073 () Bool)

(assert (=> b!2480 m!1073))

(assert (=> b!2449 d!525))

(declare-fun d!527 () Bool)

(assert (=> d!527 (= (isEmpty!41 (toList!42 lm!258)) (is-Nil!30 (toList!42 lm!258)))))

(assert (=> d!513 d!527))

(declare-fun d!531 () Bool)

(declare-fun res!4759 () Bool)

(declare-fun e!818 () Bool)

(assert (=> d!531 (=> res!4759 e!818)))

(assert (=> d!531 (= res!4759 (or (is-Nil!30 (toList!42 lm!258)) (is-Nil!30 (t!2142 (toList!42 lm!258)))))))

(assert (=> d!531 (= (isStrictlySorted!17 (toList!42 lm!258)) e!818)))

(declare-fun b!2489 () Bool)

(declare-fun e!819 () Bool)

(assert (=> b!2489 (= e!818 e!819)))

(declare-fun res!4760 () Bool)

(assert (=> b!2489 (=> (not res!4760) (not e!819))))

(assert (=> b!2489 (= res!4760 (bvslt (_1!24 (h!595 (toList!42 lm!258))) (_1!24 (h!595 (t!2142 (toList!42 lm!258))))))))

(declare-fun b!2490 () Bool)

(assert (=> b!2490 (= e!819 (isStrictlySorted!17 (t!2142 (toList!42 lm!258))))))

(assert (= (and d!531 (not res!4759)) b!2489))

(assert (= (and b!2489 res!4760) b!2490))

(declare-fun m!1075 () Bool)

(assert (=> b!2490 m!1075))

(assert (=> d!509 d!531))

(declare-fun b!2494 () Bool)

(declare-fun e!822 () Option!10)

(declare-fun e!823 () Option!10)

(assert (=> b!2494 (= e!822 e!823)))

(declare-fun c!169 () Bool)

(assert (=> b!2494 (= c!169 (and (is-Cons!29 (t!2142 (toList!42 lm!258))) (not (= (_1!24 (h!595 (t!2142 (toList!42 lm!258)))) k!394))))))

(declare-fun b!2493 () Bool)

(assert (=> b!2493 (= e!822 (Some!9 (_2!24 (h!595 (t!2142 (toList!42 lm!258))))))))

(declare-fun b!2496 () Bool)

(assert (=> b!2496 (= e!823 None!8)))

(declare-fun d!535 () Bool)

(declare-fun c!168 () Bool)

(assert (=> d!535 (= c!168 (and (is-Cons!29 (t!2142 (toList!42 lm!258))) (= (_1!24 (h!595 (t!2142 (toList!42 lm!258)))) k!394)))))

(assert (=> d!535 (= (getValueByKey!4 (t!2142 (toList!42 lm!258)) k!394) e!822)))

(declare-fun b!2495 () Bool)

(assert (=> b!2495 (= e!823 (getValueByKey!4 (t!2142 (t!2142 (toList!42 lm!258))) k!394))))

(assert (= (and d!535 c!168) b!2493))

(assert (= (and d!535 (not c!168)) b!2494))

(assert (= (and b!2494 c!169) b!2495))

(assert (= (and b!2494 (not c!169)) b!2496))

(declare-fun m!1079 () Bool)

(assert (=> b!2495 m!1079))

(assert (=> b!2426 d!535))

(declare-fun b!2499 () Bool)

(declare-fun e!826 () Bool)

(declare-fun tp!219 () Bool)

(assert (=> b!2499 (= e!826 (and tp_is_empty!39 tp!219))))

(assert (=> b!2473 (= tp!215 e!826)))

(assert (= (and b!2473 (is-Cons!29 (t!2142 (toList!42 lm!258)))) b!2499))

(declare-fun b_lambda!311 () Bool)

(assert (= b_lambda!307 (or (and start!376 b_free!49) b_lambda!311)))

(push 1)

(assert (not b_lambda!303))

(assert (not b_lambda!311))

(assert (not b_lambda!291))

(assert (not b_lambda!289))

(assert b_and!187)

(assert (not b!2495))

(assert (not b!2499))

(assert (not b_next!49))

(assert tp_is_empty!39)

(assert (not b!2480))

(assert (not b!2490))

(check-sat)

