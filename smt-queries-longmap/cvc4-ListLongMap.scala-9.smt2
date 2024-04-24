; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!378 () Bool)

(assert start!378)

(declare-fun b_free!51 () Bool)

(declare-fun b_next!51 () Bool)

(assert (=> start!378 (= b_free!51 (not b_next!51))))

(declare-fun tp!203 () Bool)

(declare-fun b_and!171 () Bool)

(assert (=> start!378 (= tp!203 b_and!171)))

(declare-fun b!2379 () Bool)

(assert (=> b!2379 true))

(assert (=> b!2379 true))

(declare-fun order!17 () Int)

(declare-fun lambda!38 () Int)

(declare-fun order!19 () Int)

(declare-fun p!318 () Int)

(declare-fun dynLambda!29 (Int Int) Int)

(declare-fun dynLambda!30 (Int Int) Int)

(assert (=> b!2379 (< (dynLambda!29 order!17 p!318) (dynLambda!30 order!19 lambda!38))))

(declare-fun b!2378 () Bool)

(declare-fun e!742 () Bool)

(declare-datatypes ((B!286 0))(
  ( (B!287 (val!25 Int)) )
))
(declare-datatypes ((tuple2!50 0))(
  ( (tuple2!51 (_1!25 (_ BitVec 64)) (_2!25 B!286)) )
))
(declare-datatypes ((List!34 0))(
  ( (Nil!31) (Cons!30 (h!596 tuple2!50) (t!2143 List!34)) )
))
(declare-datatypes ((ListLongMap!55 0))(
  ( (ListLongMap!56 (toList!43 List!34)) )
))
(declare-fun lm!258 () ListLongMap!55)

(declare-fun k!394 () (_ BitVec 64))

(declare-fun head!756 (List!34) tuple2!50)

(assert (=> b!2378 (= e!742 (= (_1!25 (head!756 (toList!43 lm!258))) k!394))))

(declare-fun res!4712 () Bool)

(declare-fun e!744 () Bool)

(assert (=> start!378 (=> (not res!4712) (not e!744))))

(declare-fun forall!31 (List!34 Int) Bool)

(assert (=> start!378 (= res!4712 (forall!31 (toList!43 lm!258) p!318))))

(assert (=> start!378 e!744))

(declare-fun e!743 () Bool)

(declare-fun inv!80 (ListLongMap!55) Bool)

(assert (=> start!378 (and (inv!80 lm!258) e!743)))

(assert (=> start!378 tp!203))

(assert (=> start!378 true))

(declare-fun b!2380 () Bool)

(declare-fun tp!202 () Bool)

(assert (=> b!2380 (= e!743 tp!202)))

(declare-fun b!2377 () Bool)

(declare-fun res!4711 () Bool)

(assert (=> b!2377 (=> (not res!4711) (not e!744))))

(assert (=> b!2377 (= res!4711 e!742)))

(declare-fun res!4710 () Bool)

(assert (=> b!2377 (=> res!4710 e!742)))

(declare-fun isEmpty!38 (ListLongMap!55) Bool)

(assert (=> b!2377 (= res!4710 (isEmpty!38 lm!258))))

(declare-datatypes ((Option!11 0))(
  ( (Some!10 (v!1103 B!286)) (None!9) )
))
(declare-fun forall!32 (Option!11 Int) Bool)

(declare-fun getValueByKey!5 (List!34 (_ BitVec 64)) Option!11)

(assert (=> b!2379 (= e!744 (not (forall!32 (getValueByKey!5 (toList!43 lm!258) k!394) lambda!38)))))

(assert (= (and start!378 res!4712) b!2377))

(assert (= (and b!2377 (not res!4710)) b!2378))

(assert (= (and b!2377 res!4711) b!2379))

(assert (= start!378 b!2380))

(declare-fun m!1005 () Bool)

(assert (=> b!2378 m!1005))

(declare-fun m!1007 () Bool)

(assert (=> start!378 m!1007))

(declare-fun m!1009 () Bool)

(assert (=> start!378 m!1009))

(declare-fun m!1011 () Bool)

(assert (=> b!2377 m!1011))

(declare-fun m!1013 () Bool)

(assert (=> b!2379 m!1013))

(assert (=> b!2379 m!1013))

(declare-fun m!1015 () Bool)

(assert (=> b!2379 m!1015))

(push 1)

(assert (not b!2380))

(assert (not b!2378))

(assert b_and!171)

(assert (not b_next!51))

(assert (not start!378))

(assert (not b!2377))

(assert (not b!2379))

(check-sat)

(pop 1)

(push 1)

(assert b_and!171)

(assert (not b_next!51))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!483 () Bool)

(declare-fun isEmpty!40 (List!34) Bool)

(assert (=> d!483 (= (isEmpty!38 lm!258) (isEmpty!40 (toList!43 lm!258)))))

(declare-fun bs!111 () Bool)

(assert (= bs!111 d!483))

(declare-fun m!1029 () Bool)

(assert (=> bs!111 m!1029))

(assert (=> b!2377 d!483))

(declare-fun d!487 () Bool)

(declare-fun res!4730 () Bool)

(declare-fun e!762 () Bool)

(assert (=> d!487 (=> res!4730 e!762)))

(assert (=> d!487 (= res!4730 (is-Nil!31 (toList!43 lm!258)))))

(assert (=> d!487 (= (forall!31 (toList!43 lm!258) p!318) e!762)))

(declare-fun b!2409 () Bool)

(declare-fun e!763 () Bool)

(assert (=> b!2409 (= e!762 e!763)))

(declare-fun res!4731 () Bool)

(assert (=> b!2409 (=> (not res!4731) (not e!763))))

(declare-fun dynLambda!33 (Int tuple2!50) Bool)

(assert (=> b!2409 (= res!4731 (dynLambda!33 p!318 (h!596 (toList!43 lm!258))))))

(declare-fun b!2410 () Bool)

(assert (=> b!2410 (= e!763 (forall!31 (t!2143 (toList!43 lm!258)) p!318))))

(assert (= (and d!487 (not res!4730)) b!2409))

(assert (= (and b!2409 res!4731) b!2410))

(declare-fun b_lambda!271 () Bool)

(assert (=> (not b_lambda!271) (not b!2409)))

(declare-fun t!2146 () Bool)

(declare-fun tb!109 () Bool)

(assert (=> (and start!378 (= p!318 p!318) t!2146) tb!109))

(declare-fun result!145 () Bool)

(assert (=> tb!109 (= result!145 true)))

(assert (=> b!2409 t!2146))

(declare-fun b_and!175 () Bool)

(assert (= b_and!171 (and (=> t!2146 result!145) b_and!175)))

(declare-fun m!1031 () Bool)

(assert (=> b!2409 m!1031))

(declare-fun m!1033 () Bool)

(assert (=> b!2410 m!1033))

(assert (=> start!378 d!487))

(declare-fun d!489 () Bool)

(declare-fun isStrictlySorted!15 (List!34) Bool)

(assert (=> d!489 (= (inv!80 lm!258) (isStrictlySorted!15 (toList!43 lm!258)))))

(declare-fun bs!112 () Bool)

(assert (= bs!112 d!489))

(declare-fun m!1039 () Bool)

(assert (=> bs!112 m!1039))

(assert (=> start!378 d!489))

(declare-fun d!493 () Bool)

(assert (=> d!493 (= (head!756 (toList!43 lm!258)) (h!596 (toList!43 lm!258)))))

(assert (=> b!2378 d!493))

(declare-fun d!495 () Bool)

(declare-fun res!4736 () Bool)

(declare-fun e!768 () Bool)

(assert (=> d!495 (=> res!4736 e!768)))

(assert (=> d!495 (= res!4736 (not (is-Some!10 (getValueByKey!5 (toList!43 lm!258) k!394))))))

(assert (=> d!495 (= (forall!32 (getValueByKey!5 (toList!43 lm!258) k!394) lambda!38) e!768)))

(declare-fun b!2415 () Bool)

(declare-fun dynLambda!34 (Int B!286) Bool)

(assert (=> b!2415 (= e!768 (dynLambda!34 lambda!38 (v!1103 (getValueByKey!5 (toList!43 lm!258) k!394))))))

(assert (= (and d!495 (not res!4736)) b!2415))

(declare-fun b_lambda!275 () Bool)

(assert (=> (not b_lambda!275) (not b!2415)))

(declare-fun m!1043 () Bool)

(assert (=> b!2415 m!1043))

(assert (=> b!2379 d!495))

(declare-fun b!2430 () Bool)

(declare-fun e!778 () Option!11)

(assert (=> b!2430 (= e!778 (getValueByKey!5 (t!2143 (toList!43 lm!258)) k!394))))

(declare-fun b!2431 () Bool)

(assert (=> b!2431 (= e!778 None!9)))

(declare-fun b!2429 () Bool)

(declare-fun e!777 () Option!11)

(assert (=> b!2429 (= e!777 e!778)))

(declare-fun c!155 () Bool)

(assert (=> b!2429 (= c!155 (and (is-Cons!30 (toList!43 lm!258)) (not (= (_1!25 (h!596 (toList!43 lm!258))) k!394))))))

(declare-fun d!501 () Bool)

(declare-fun c!154 () Bool)

(assert (=> d!501 (= c!154 (and (is-Cons!30 (toList!43 lm!258)) (= (_1!25 (h!596 (toList!43 lm!258))) k!394)))))

(assert (=> d!501 (= (getValueByKey!5 (toList!43 lm!258) k!394) e!777)))

(declare-fun b!2428 () Bool)

(assert (=> b!2428 (= e!777 (Some!10 (_2!25 (h!596 (toList!43 lm!258)))))))

(assert (= (and d!501 c!154) b!2428))

(assert (= (and d!501 (not c!154)) b!2429))

(assert (= (and b!2429 c!155) b!2430))

(assert (= (and b!2429 (not c!155)) b!2431))

(declare-fun m!1049 () Bool)

(assert (=> b!2430 m!1049))

(assert (=> b!2379 d!501))

(declare-fun b!2438 () Bool)

(declare-fun e!783 () Bool)

(declare-fun tp_is_empty!37 () Bool)

(declare-fun tp!212 () Bool)

(assert (=> b!2438 (= e!783 (and tp_is_empty!37 tp!212))))

(assert (=> b!2380 (= tp!202 e!783)))

(assert (= (and b!2380 (is-Cons!30 (toList!43 lm!258))) b!2438))

(declare-fun b_lambda!281 () Bool)

(assert (= b_lambda!275 (or b!2379 b_lambda!281)))

(declare-fun bs!116 () Bool)

(declare-fun d!515 () Bool)

(assert (= bs!116 (and d!515 b!2379)))

(assert (=> bs!116 (= (dynLambda!34 lambda!38 (v!1103 (getValueByKey!5 (toList!43 lm!258) k!394))) (dynLambda!33 p!318 (tuple2!51 k!394 (v!1103 (getValueByKey!5 (toList!43 lm!258) k!394)))))))

(declare-fun b_lambda!285 () Bool)

(assert (=> (not b_lambda!285) (not bs!116)))

(declare-fun t!2150 () Bool)

(declare-fun tb!113 () Bool)

(assert (=> (and start!378 (= p!318 p!318) t!2150) tb!113))

(declare-fun result!151 () Bool)

(assert (=> tb!113 (= result!151 true)))

(assert (=> bs!116 t!2150))

(declare-fun b_and!179 () Bool)

(assert (= b_and!175 (and (=> t!2150 result!151) b_and!179)))

(declare-fun m!1055 () Bool)

(assert (=> bs!116 m!1055))

(assert (=> b!2415 d!515))

(declare-fun b_lambda!283 () Bool)

(assert (= b_lambda!271 (or (and start!378 b_free!51) b_lambda!283)))

(push 1)

(assert (not b_lambda!281))

(assert (not d!483))

(assert (not b!2430))

(assert tp_is_empty!37)

(assert (not b_next!51))

(assert b_and!179)

(assert (not b!2438))

(assert (not b_lambda!283))

(assert (not b_lambda!285))

(assert (not d!489))

(assert (not b!2410))

(check-sat)

(pop 1)

(push 1)

(assert b_and!179)

(assert (not b_next!51))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!301 () Bool)

(assert (= b_lambda!285 (or (and start!378 b_free!51) b_lambda!301)))

(push 1)

(assert (not b_lambda!281))

(assert (not d!483))

(assert (not b!2430))

(assert (not b_next!51))

(assert b_and!179)

(assert (not b!2438))

(assert (not b_lambda!283))

(assert (not d!489))

(assert (not b!2410))

(assert (not b_lambda!301))

(assert tp_is_empty!37)

(check-sat)

(pop 1)

(push 1)

(assert b_and!179)

(assert (not b_next!51))

(check-sat)

(get-model)

(pop 1)

(declare-fun b!2481 () Bool)

(declare-fun e!809 () Option!11)

(assert (=> b!2481 (= e!809 (getValueByKey!5 (t!2143 (t!2143 (toList!43 lm!258))) k!394))))

(declare-fun b!2482 () Bool)

(assert (=> b!2482 (= e!809 None!9)))

(declare-fun b!2480 () Bool)

(declare-fun e!808 () Option!11)

(assert (=> b!2480 (= e!808 e!809)))

(declare-fun c!169 () Bool)

(assert (=> b!2480 (= c!169 (and (is-Cons!30 (t!2143 (toList!43 lm!258))) (not (= (_1!25 (h!596 (t!2143 (toList!43 lm!258)))) k!394))))))

(declare-fun d!525 () Bool)

(declare-fun c!168 () Bool)

(assert (=> d!525 (= c!168 (and (is-Cons!30 (t!2143 (toList!43 lm!258))) (= (_1!25 (h!596 (t!2143 (toList!43 lm!258)))) k!394)))))

(assert (=> d!525 (= (getValueByKey!5 (t!2143 (toList!43 lm!258)) k!394) e!808)))

(declare-fun b!2479 () Bool)

(assert (=> b!2479 (= e!808 (Some!10 (_2!25 (h!596 (t!2143 (toList!43 lm!258))))))))

(assert (= (and d!525 c!168) b!2479))

(assert (= (and d!525 (not c!168)) b!2480))

(assert (= (and b!2480 c!169) b!2481))

(assert (= (and b!2480 (not c!169)) b!2482))

(declare-fun m!1071 () Bool)

(assert (=> b!2481 m!1071))

(assert (=> b!2430 d!525))

(declare-fun d!527 () Bool)

(declare-fun res!4753 () Bool)

(declare-fun e!814 () Bool)

(assert (=> d!527 (=> res!4753 e!814)))

(assert (=> d!527 (= res!4753 (or (is-Nil!31 (toList!43 lm!258)) (is-Nil!31 (t!2143 (toList!43 lm!258)))))))

(assert (=> d!527 (= (isStrictlySorted!15 (toList!43 lm!258)) e!814)))

(declare-fun b!2487 () Bool)

(declare-fun e!815 () Bool)

(assert (=> b!2487 (= e!814 e!815)))

(declare-fun res!4754 () Bool)

(assert (=> b!2487 (=> (not res!4754) (not e!815))))

(assert (=> b!2487 (= res!4754 (bvslt (_1!25 (h!596 (toList!43 lm!258))) (_1!25 (h!596 (t!2143 (toList!43 lm!258))))))))

(declare-fun b!2488 () Bool)

(assert (=> b!2488 (= e!815 (isStrictlySorted!15 (t!2143 (toList!43 lm!258))))))

(assert (= (and d!527 (not res!4753)) b!2487))

(assert (= (and b!2487 res!4754) b!2488))

(declare-fun m!1073 () Bool)

(assert (=> b!2488 m!1073))

(assert (=> d!489 d!527))

(declare-fun d!529 () Bool)

(assert (=> d!529 (= (isEmpty!40 (toList!43 lm!258)) (is-Nil!31 (toList!43 lm!258)))))

(assert (=> d!483 d!529))

(declare-fun d!531 () Bool)

(declare-fun res!4755 () Bool)

(declare-fun e!816 () Bool)

(assert (=> d!531 (=> res!4755 e!816)))

(assert (=> d!531 (= res!4755 (is-Nil!31 (t!2143 (toList!43 lm!258))))))

(assert (=> d!531 (= (forall!31 (t!2143 (toList!43 lm!258)) p!318) e!816)))

(declare-fun b!2489 () Bool)

(declare-fun e!817 () Bool)

(assert (=> b!2489 (= e!816 e!817)))

(declare-fun res!4756 () Bool)

(assert (=> b!2489 (=> (not res!4756) (not e!817))))

(assert (=> b!2489 (= res!4756 (dynLambda!33 p!318 (h!596 (t!2143 (toList!43 lm!258)))))))

(declare-fun b!2490 () Bool)

(assert (=> b!2490 (= e!817 (forall!31 (t!2143 (t!2143 (toList!43 lm!258))) p!318))))

(assert (= (and d!531 (not res!4755)) b!2489))

(assert (= (and b!2489 res!4756) b!2490))

(declare-fun b_lambda!305 () Bool)

(assert (=> (not b_lambda!305) (not b!2489)))

(declare-fun t!2158 () Bool)

(declare-fun tb!121 () Bool)

(assert (=> (and start!378 (= p!318 p!318) t!2158) tb!121))

(declare-fun result!163 () Bool)

(assert (=> tb!121 (= result!163 true)))

(assert (=> b!2489 t!2158))

(declare-fun b_and!187 () Bool)

(assert (= b_and!179 (and (=> t!2158 result!163) b_and!187)))

(declare-fun m!1075 () Bool)

(assert (=> b!2489 m!1075))

(declare-fun m!1077 () Bool)

(assert (=> b!2490 m!1077))

(assert (=> b!2410 d!531))

(declare-fun b!2491 () Bool)

(declare-fun e!818 () Bool)

(declare-fun tp!219 () Bool)

(assert (=> b!2491 (= e!818 (and tp_is_empty!37 tp!219))))

(assert (=> b!2438 (= tp!212 e!818)))

(assert (= (and b!2438 (is-Cons!30 (t!2143 (toList!43 lm!258)))) b!2491))

(declare-fun b_lambda!307 () Bool)

(assert (= b_lambda!305 (or (and start!378 b_free!51) b_lambda!307)))

(push 1)

(assert b_and!187)

(assert (not b!2490))

(assert (not b_lambda!281))

(assert (not b_lambda!307))

(assert (not b!2488))

(assert (not b!2491))

(assert (not b_lambda!283))

(assert (not b_lambda!301))

(assert tp_is_empty!37)

(assert (not b!2481))

(assert (not b_next!51))

(check-sat)

(pop 1)

(push 1)

(assert b_and!187)

(assert (not b_next!51))

(check-sat)

(pop 1)

