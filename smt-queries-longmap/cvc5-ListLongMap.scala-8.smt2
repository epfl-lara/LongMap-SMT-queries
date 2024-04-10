; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!298 () Bool)

(assert start!298)

(declare-fun b_free!43 () Bool)

(declare-fun b_next!43 () Bool)

(assert (=> start!298 (= b_free!43 (not b_next!43))))

(declare-fun tp!166 () Bool)

(declare-fun b_and!121 () Bool)

(assert (=> start!298 (= tp!166 b_and!121)))

(declare-fun b!2151 () Bool)

(assert (=> b!2151 true))

(assert (=> b!2151 true))

(declare-fun order!3 () Int)

(declare-fun order!1 () Int)

(declare-fun p!318 () Int)

(declare-fun lambda!4 () Int)

(declare-fun dynLambda!15 (Int Int) Int)

(declare-fun dynLambda!16 (Int Int) Int)

(assert (=> b!2151 (< (dynLambda!15 order!1 p!318) (dynLambda!16 order!3 lambda!4))))

(declare-fun b!2147 () Bool)

(declare-fun res!4600 () Bool)

(declare-fun e!589 () Bool)

(assert (=> b!2147 (=> (not res!4600) (not e!589))))

(declare-datatypes ((B!278 0))(
  ( (B!279 (val!21 Int)) )
))
(declare-datatypes ((tuple2!42 0))(
  ( (tuple2!43 (_1!21 (_ BitVec 64)) (_2!21 B!278)) )
))
(declare-datatypes ((List!30 0))(
  ( (Nil!27) (Cons!26 (h!592 tuple2!42) (t!2103 List!30)) )
))
(declare-datatypes ((ListLongMap!47 0))(
  ( (ListLongMap!48 (toList!39 List!30)) )
))
(declare-fun lm!258 () ListLongMap!47)

(declare-fun isEmpty!31 (ListLongMap!47) Bool)

(assert (=> b!2147 (= res!4600 (not (isEmpty!31 lm!258)))))

(declare-fun b!2148 () Bool)

(declare-fun res!4599 () Bool)

(assert (=> b!2148 (=> (not res!4599) (not e!589))))

(declare-fun k!394 () (_ BitVec 64))

(declare-fun head!752 (List!30) tuple2!42)

(assert (=> b!2148 (= res!4599 (not (= (_1!21 (head!752 (toList!39 lm!258))) k!394)))))

(declare-fun b!2149 () Bool)

(declare-fun e!590 () Bool)

(declare-fun tp!167 () Bool)

(assert (=> b!2149 (= e!590 tp!167)))

(declare-fun res!4598 () Bool)

(assert (=> start!298 (=> (not res!4598) (not e!589))))

(declare-fun forall!23 (List!30 Int) Bool)

(assert (=> start!298 (= res!4598 (forall!23 (toList!39 lm!258) p!318))))

(assert (=> start!298 e!589))

(declare-fun inv!71 (ListLongMap!47) Bool)

(assert (=> start!298 (and (inv!71 lm!258) e!590)))

(assert (=> start!298 tp!166))

(assert (=> start!298 true))

(declare-fun b!2150 () Bool)

(declare-fun e!591 () Bool)

(assert (=> b!2150 (= e!589 e!591)))

(declare-fun res!4601 () Bool)

(assert (=> b!2150 (=> (not res!4601) (not e!591))))

(declare-fun lt!347 () ListLongMap!47)

(assert (=> b!2150 (= res!4601 (forall!23 (toList!39 lt!347) p!318))))

(declare-fun tail!44 (ListLongMap!47) ListLongMap!47)

(assert (=> b!2150 (= lt!347 (tail!44 lm!258))))

(declare-datatypes ((Option!7 0))(
  ( (Some!6 (v!1075 B!278)) (None!5) )
))
(declare-fun forall!24 (Option!7 Int) Bool)

(declare-fun getValueByKey!1 (List!30 (_ BitVec 64)) Option!7)

(assert (=> b!2151 (= e!591 (not (forall!24 (getValueByKey!1 (toList!39 lm!258) k!394) lambda!4)))))

(assert (=> b!2151 (forall!24 (getValueByKey!1 (toList!39 lt!347) k!394) lambda!4)))

(declare-datatypes ((Unit!13 0))(
  ( (Unit!14) )
))
(declare-fun lt!346 () Unit!13)

(declare-fun getForall!2 (ListLongMap!47 Int (_ BitVec 64)) Unit!13)

(assert (=> b!2151 (= lt!346 (getForall!2 lt!347 p!318 k!394))))

(assert (= (and start!298 res!4598) b!2147))

(assert (= (and b!2147 res!4600) b!2148))

(assert (= (and b!2148 res!4599) b!2150))

(assert (= (and b!2150 res!4601) b!2151))

(assert (= start!298 b!2149))

(declare-fun m!783 () Bool)

(assert (=> b!2151 m!783))

(declare-fun m!785 () Bool)

(assert (=> b!2151 m!785))

(declare-fun m!787 () Bool)

(assert (=> b!2151 m!787))

(declare-fun m!789 () Bool)

(assert (=> b!2151 m!789))

(declare-fun m!791 () Bool)

(assert (=> b!2151 m!791))

(assert (=> b!2151 m!789))

(assert (=> b!2151 m!783))

(declare-fun m!793 () Bool)

(assert (=> b!2147 m!793))

(declare-fun m!795 () Bool)

(assert (=> start!298 m!795))

(declare-fun m!797 () Bool)

(assert (=> start!298 m!797))

(declare-fun m!799 () Bool)

(assert (=> b!2148 m!799))

(declare-fun m!801 () Bool)

(assert (=> b!2150 m!801))

(declare-fun m!803 () Bool)

(assert (=> b!2150 m!803))

(push 1)

(assert b_and!121)

(assert (not b!2150))

(assert (not start!298))

(assert (not b!2147))

(assert (not b_next!43))

(assert (not b!2151))

(assert (not b!2149))

(assert (not b!2148))

(check-sat)

(pop 1)

(push 1)

(assert b_and!121)

(assert (not b_next!43))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!345 () Bool)

(declare-fun isEmpty!34 (List!30) Bool)

(assert (=> d!345 (= (isEmpty!31 lm!258) (isEmpty!34 (toList!39 lm!258)))))

(declare-fun bs!75 () Bool)

(assert (= bs!75 d!345))

(declare-fun m!849 () Bool)

(assert (=> bs!75 m!849))

(assert (=> b!2147 d!345))

(declare-fun d!347 () Bool)

(assert (=> d!347 (= (head!752 (toList!39 lm!258)) (h!592 (toList!39 lm!258)))))

(assert (=> b!2148 d!347))

(declare-fun d!351 () Bool)

(declare-fun res!4636 () Bool)

(declare-fun e!620 () Bool)

(assert (=> d!351 (=> res!4636 e!620)))

(assert (=> d!351 (= res!4636 (is-Nil!27 (toList!39 lm!258)))))

(assert (=> d!351 (= (forall!23 (toList!39 lm!258) p!318) e!620)))

(declare-fun b!2204 () Bool)

(declare-fun e!621 () Bool)

(assert (=> b!2204 (= e!620 e!621)))

(declare-fun res!4637 () Bool)

(assert (=> b!2204 (=> (not res!4637) (not e!621))))

(declare-fun dynLambda!23 (Int tuple2!42) Bool)

(assert (=> b!2204 (= res!4637 (dynLambda!23 p!318 (h!592 (toList!39 lm!258))))))

(declare-fun b!2205 () Bool)

(assert (=> b!2205 (= e!621 (forall!23 (t!2103 (toList!39 lm!258)) p!318))))

(assert (= (and d!351 (not res!4636)) b!2204))

(assert (= (and b!2204 res!4637) b!2205))

(declare-fun b_lambda!159 () Bool)

(assert (=> (not b_lambda!159) (not b!2204)))

(declare-fun t!2109 () Bool)

(declare-fun tb!75 () Bool)

(assert (=> (and start!298 (= p!318 p!318) t!2109) tb!75))

(declare-fun result!105 () Bool)

(assert (=> tb!75 (= result!105 true)))

(assert (=> b!2204 t!2109))

(declare-fun b_and!129 () Bool)

(assert (= b_and!121 (and (=> t!2109 result!105) b_and!129)))

(declare-fun m!857 () Bool)

(assert (=> b!2204 m!857))

(declare-fun m!859 () Bool)

(assert (=> b!2205 m!859))

(assert (=> start!298 d!351))

(declare-fun d!359 () Bool)

(declare-fun isStrictlySorted!14 (List!30) Bool)

(assert (=> d!359 (= (inv!71 lm!258) (isStrictlySorted!14 (toList!39 lm!258)))))

(declare-fun bs!77 () Bool)

(assert (= bs!77 d!359))

(declare-fun m!863 () Bool)

(assert (=> bs!77 m!863))

(assert (=> start!298 d!359))

(declare-fun d!363 () Bool)

(declare-fun res!4644 () Bool)

(declare-fun e!634 () Bool)

(assert (=> d!363 (=> res!4644 e!634)))

(assert (=> d!363 (= res!4644 (not (is-Some!6 (getValueByKey!1 (toList!39 lt!347) k!394))))))

(assert (=> d!363 (= (forall!24 (getValueByKey!1 (toList!39 lt!347) k!394) lambda!4) e!634)))

(declare-fun b!2224 () Bool)

(declare-fun dynLambda!24 (Int B!278) Bool)

(assert (=> b!2224 (= e!634 (dynLambda!24 lambda!4 (v!1075 (getValueByKey!1 (toList!39 lt!347) k!394))))))

(assert (= (and d!363 (not res!4644)) b!2224))

(declare-fun b_lambda!165 () Bool)

(assert (=> (not b_lambda!165) (not b!2224)))

(declare-fun m!869 () Bool)

(assert (=> b!2224 m!869))

(assert (=> b!2151 d!363))

(declare-fun b!2242 () Bool)

(declare-fun e!644 () Option!7)

(assert (=> b!2242 (= e!644 None!5)))

(declare-fun b!2241 () Bool)

(assert (=> b!2241 (= e!644 (getValueByKey!1 (t!2103 (toList!39 lt!347)) k!394))))

(declare-fun b!2240 () Bool)

(declare-fun e!643 () Option!7)

(assert (=> b!2240 (= e!643 e!644)))

(declare-fun c!127 () Bool)

(assert (=> b!2240 (= c!127 (and (is-Cons!26 (toList!39 lt!347)) (not (= (_1!21 (h!592 (toList!39 lt!347))) k!394))))))

(declare-fun b!2239 () Bool)

(assert (=> b!2239 (= e!643 (Some!6 (_2!21 (h!592 (toList!39 lt!347)))))))

(declare-fun d!369 () Bool)

(declare-fun c!126 () Bool)

(assert (=> d!369 (= c!126 (and (is-Cons!26 (toList!39 lt!347)) (= (_1!21 (h!592 (toList!39 lt!347))) k!394)))))

(assert (=> d!369 (= (getValueByKey!1 (toList!39 lt!347) k!394) e!643)))

(assert (= (and d!369 c!126) b!2239))

(assert (= (and d!369 (not c!126)) b!2240))

(assert (= (and b!2240 c!127) b!2241))

(assert (= (and b!2240 (not c!127)) b!2242))

(declare-fun m!885 () Bool)

(assert (=> b!2241 m!885))

(assert (=> b!2151 d!369))

(declare-fun bs!86 () Bool)

(declare-fun d!379 () Bool)

(assert (= bs!86 (and d!379 b!2151)))

(declare-fun lambda!23 () Int)

(assert (=> bs!86 (= lambda!23 lambda!4)))

(assert (=> d!379 true))

(assert (=> d!379 true))

(assert (=> d!379 (< (dynLambda!15 order!1 p!318) (dynLambda!16 order!3 lambda!23))))

(assert (=> d!379 (forall!24 (getValueByKey!1 (toList!39 lt!347) k!394) lambda!23)))

(declare-fun lt!368 () Unit!13)

(declare-fun choose!133 (ListLongMap!47 Int (_ BitVec 64)) Unit!13)

(assert (=> d!379 (= lt!368 (choose!133 lt!347 p!318 k!394))))

(assert (=> d!379 (forall!23 (toList!39 lt!347) p!318)))

(assert (=> d!379 (= (getForall!2 lt!347 p!318 k!394) lt!368)))

(declare-fun bs!87 () Bool)

(assert (= bs!87 d!379))

(assert (=> bs!87 m!783))

(assert (=> bs!87 m!783))

(declare-fun m!902 () Bool)

(assert (=> bs!87 m!902))

(declare-fun m!905 () Bool)

(assert (=> bs!87 m!905))

(assert (=> bs!87 m!801))

(assert (=> b!2151 d!379))

(declare-fun b!2271 () Bool)

(declare-fun e!661 () Option!7)

(assert (=> b!2271 (= e!661 None!5)))

(declare-fun b!2270 () Bool)

(assert (=> b!2270 (= e!661 (getValueByKey!1 (t!2103 (toList!39 lm!258)) k!394))))

(declare-fun b!2269 () Bool)

(declare-fun e!660 () Option!7)

(assert (=> b!2269 (= e!660 e!661)))

(declare-fun c!137 () Bool)

(assert (=> b!2269 (= c!137 (and (is-Cons!26 (toList!39 lm!258)) (not (= (_1!21 (h!592 (toList!39 lm!258))) k!394))))))

(declare-fun b!2268 () Bool)

(assert (=> b!2268 (= e!660 (Some!6 (_2!21 (h!592 (toList!39 lm!258)))))))

(declare-fun d!395 () Bool)

(declare-fun c!136 () Bool)

(assert (=> d!395 (= c!136 (and (is-Cons!26 (toList!39 lm!258)) (= (_1!21 (h!592 (toList!39 lm!258))) k!394)))))

(assert (=> d!395 (= (getValueByKey!1 (toList!39 lm!258) k!394) e!660)))

(assert (= (and d!395 c!136) b!2268))

(assert (= (and d!395 (not c!136)) b!2269))

(assert (= (and b!2269 c!137) b!2270))

(assert (= (and b!2269 (not c!137)) b!2271))

(declare-fun m!907 () Bool)

(assert (=> b!2270 m!907))

(assert (=> b!2151 d!395))

(declare-fun d!397 () Bool)

(declare-fun res!4651 () Bool)

(declare-fun e!662 () Bool)

(assert (=> d!397 (=> res!4651 e!662)))

(assert (=> d!397 (= res!4651 (not (is-Some!6 (getValueByKey!1 (toList!39 lm!258) k!394))))))

(assert (=> d!397 (= (forall!24 (getValueByKey!1 (toList!39 lm!258) k!394) lambda!4) e!662)))

(declare-fun b!2272 () Bool)

(assert (=> b!2272 (= e!662 (dynLambda!24 lambda!4 (v!1075 (getValueByKey!1 (toList!39 lm!258) k!394))))))

(assert (= (and d!397 (not res!4651)) b!2272))

(declare-fun b_lambda!185 () Bool)

(assert (=> (not b_lambda!185) (not b!2272)))

(declare-fun m!909 () Bool)

(assert (=> b!2272 m!909))

(assert (=> b!2151 d!397))

(declare-fun d!399 () Bool)

(declare-fun res!4656 () Bool)

(declare-fun e!667 () Bool)

(assert (=> d!399 (=> res!4656 e!667)))

(assert (=> d!399 (= res!4656 (is-Nil!27 (toList!39 lt!347)))))

(assert (=> d!399 (= (forall!23 (toList!39 lt!347) p!318) e!667)))

(declare-fun b!2277 () Bool)

(declare-fun e!668 () Bool)

(assert (=> b!2277 (= e!667 e!668)))

(declare-fun res!4657 () Bool)

(assert (=> b!2277 (=> (not res!4657) (not e!668))))

(assert (=> b!2277 (= res!4657 (dynLambda!23 p!318 (h!592 (toList!39 lt!347))))))

(declare-fun b!2278 () Bool)

(assert (=> b!2278 (= e!668 (forall!23 (t!2103 (toList!39 lt!347)) p!318))))

(assert (= (and d!399 (not res!4656)) b!2277))

(assert (= (and b!2277 res!4657) b!2278))

(declare-fun b_lambda!187 () Bool)

(assert (=> (not b_lambda!187) (not b!2277)))

(declare-fun t!2117 () Bool)

(declare-fun tb!83 () Bool)

(assert (=> (and start!298 (= p!318 p!318) t!2117) tb!83))

(declare-fun result!115 () Bool)

(assert (=> tb!83 (= result!115 true)))

(assert (=> b!2277 t!2117))

(declare-fun b_and!137 () Bool)

(assert (= b_and!129 (and (=> t!2117 result!115) b_and!137)))

(declare-fun m!911 () Bool)

(assert (=> b!2277 m!911))

(declare-fun m!913 () Bool)

(assert (=> b!2278 m!913))

(assert (=> b!2150 d!399))

(declare-fun d!401 () Bool)

(declare-fun tail!48 (List!30) List!30)

(assert (=> d!401 (= (tail!44 lm!258) (ListLongMap!48 (tail!48 (toList!39 lm!258))))))

(declare-fun bs!88 () Bool)

(assert (= bs!88 d!401))

(declare-fun m!919 () Bool)

(assert (=> bs!88 m!919))

(assert (=> b!2150 d!401))

(declare-fun b!2285 () Bool)

(declare-fun e!673 () Bool)

(declare-fun tp_is_empty!33 () Bool)

(declare-fun tp!185 () Bool)

(assert (=> b!2285 (= e!673 (and tp_is_empty!33 tp!185))))

(assert (=> b!2149 (= tp!167 e!673)))

(assert (= (and b!2149 (is-Cons!26 (toList!39 lm!258))) b!2285))

(declare-fun b_lambda!191 () Bool)

(assert (= b_lambda!187 (or (and start!298 b_free!43) b_lambda!191)))

(declare-fun b_lambda!193 () Bool)

(assert (= b_lambda!185 (or b!2151 b_lambda!193)))

(declare-fun bs!90 () Bool)

(declare-fun d!407 () Bool)

(assert (= bs!90 (and d!407 b!2151)))

(assert (=> bs!90 (= (dynLambda!24 lambda!4 (v!1075 (getValueByKey!1 (toList!39 lm!258) k!394))) (dynLambda!23 p!318 (tuple2!43 k!394 (v!1075 (getValueByKey!1 (toList!39 lm!258) k!394)))))))

(declare-fun b_lambda!199 () Bool)

(assert (=> (not b_lambda!199) (not bs!90)))

(declare-fun t!2121 () Bool)

(declare-fun tb!87 () Bool)

(assert (=> (and start!298 (= p!318 p!318) t!2121) tb!87))

(declare-fun result!121 () Bool)

(assert (=> tb!87 (= result!121 true)))

(assert (=> bs!90 t!2121))

(declare-fun b_and!141 () Bool)

(assert (= b_and!137 (and (=> t!2121 result!121) b_and!141)))

(declare-fun m!923 () Bool)

(assert (=> bs!90 m!923))

(assert (=> b!2272 d!407))

(declare-fun b_lambda!195 () Bool)

(assert (= b_lambda!165 (or b!2151 b_lambda!195)))

(declare-fun bs!91 () Bool)

(declare-fun d!409 () Bool)

(assert (= bs!91 (and d!409 b!2151)))

(assert (=> bs!91 (= (dynLambda!24 lambda!4 (v!1075 (getValueByKey!1 (toList!39 lt!347) k!394))) (dynLambda!23 p!318 (tuple2!43 k!394 (v!1075 (getValueByKey!1 (toList!39 lt!347) k!394)))))))

(declare-fun b_lambda!203 () Bool)

(assert (=> (not b_lambda!203) (not bs!91)))

(declare-fun t!2125 () Bool)

(declare-fun tb!91 () Bool)

(assert (=> (and start!298 (= p!318 p!318) t!2125) tb!91))

(declare-fun result!125 () Bool)

(assert (=> tb!91 (= result!125 true)))

(assert (=> bs!91 t!2125))

(declare-fun b_and!145 () Bool)

(assert (= b_and!141 (and (=> t!2125 result!125) b_and!145)))

(declare-fun m!929 () Bool)

(assert (=> bs!91 m!929))

(assert (=> b!2224 d!409))

(declare-fun b_lambda!197 () Bool)

(assert (= b_lambda!159 (or (and start!298 b_free!43) b_lambda!197)))

(push 1)

(assert (not b!2205))

(assert (not d!379))

(assert (not d!401))

(assert (not b!2278))

(assert (not b_lambda!195))

(assert (not b_lambda!191))

(assert (not b!2241))

(assert (not b_lambda!197))

(assert (not b_lambda!203))

(assert (not b!2285))

(assert b_and!145)

(assert tp_is_empty!33)

(assert (not d!359))

(assert (not d!345))

(assert (not b_lambda!193))

(assert (not b_lambda!199))

(assert (not b!2270))

(assert (not b_next!43))

(check-sat)

(pop 1)

(push 1)

(assert b_and!145)

(assert (not b_next!43))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!221 () Bool)

(assert (= b_lambda!203 (or (and start!298 b_free!43) b_lambda!221)))

(declare-fun b_lambda!223 () Bool)

(assert (= b_lambda!199 (or (and start!298 b_free!43) b_lambda!223)))

(push 1)

(assert (not b!2205))

(assert (not d!379))

(assert (not b_lambda!221))

(assert (not d!401))

(assert (not b!2278))

(assert (not b_lambda!191))

(assert (not b!2241))

(assert (not b_lambda!193))

(assert (not b_lambda!197))

(assert (not b!2285))

(assert b_and!145)

(assert tp_is_empty!33)

(assert (not b_lambda!195))

(assert (not b_lambda!223))

(assert (not d!359))

(assert (not d!345))

(assert (not b!2270))

(assert (not b_next!43))

(check-sat)

(pop 1)

(push 1)

(assert b_and!145)

(assert (not b_next!43))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!423 () Bool)

(assert (=> d!423 (= (isEmpty!34 (toList!39 lm!258)) (is-Nil!27 (toList!39 lm!258)))))

(assert (=> d!345 d!423))

(declare-fun d!429 () Bool)

(declare-fun res!4664 () Bool)

(declare-fun e!685 () Bool)

(assert (=> d!429 (=> res!4664 e!685)))

(assert (=> d!429 (= res!4664 (is-Nil!27 (t!2103 (toList!39 lt!347))))))

(assert (=> d!429 (= (forall!23 (t!2103 (toList!39 lt!347)) p!318) e!685)))

(declare-fun b!2303 () Bool)

(declare-fun e!686 () Bool)

(assert (=> b!2303 (= e!685 e!686)))

(declare-fun res!4665 () Bool)

(assert (=> b!2303 (=> (not res!4665) (not e!686))))

(assert (=> b!2303 (= res!4665 (dynLambda!23 p!318 (h!592 (t!2103 (toList!39 lt!347)))))))

(declare-fun b!2304 () Bool)

(assert (=> b!2304 (= e!686 (forall!23 (t!2103 (t!2103 (toList!39 lt!347))) p!318))))

(assert (= (and d!429 (not res!4664)) b!2303))

(assert (= (and b!2303 res!4665) b!2304))

(declare-fun b_lambda!231 () Bool)

(assert (=> (not b_lambda!231) (not b!2303)))

(declare-fun t!2133 () Bool)

(declare-fun tb!99 () Bool)

(assert (=> (and start!298 (= p!318 p!318) t!2133) tb!99))

(declare-fun result!135 () Bool)

(assert (=> tb!99 (= result!135 true)))

(assert (=> b!2303 t!2133))

(declare-fun b_and!153 () Bool)

(assert (= b_and!145 (and (=> t!2133 result!135) b_and!153)))

(declare-fun m!947 () Bool)

(assert (=> b!2303 m!947))

(declare-fun m!949 () Bool)

(assert (=> b!2304 m!949))

(assert (=> b!2278 d!429))

(declare-fun b!2310 () Bool)

(declare-fun e!690 () Option!7)

(assert (=> b!2310 (= e!690 None!5)))

(declare-fun b!2309 () Bool)

(assert (=> b!2309 (= e!690 (getValueByKey!1 (t!2103 (t!2103 (toList!39 lt!347))) k!394))))

(declare-fun b!2308 () Bool)

(declare-fun e!689 () Option!7)

(assert (=> b!2308 (= e!689 e!690)))

(declare-fun c!143 () Bool)

(assert (=> b!2308 (= c!143 (and (is-Cons!26 (t!2103 (toList!39 lt!347))) (not (= (_1!21 (h!592 (t!2103 (toList!39 lt!347)))) k!394))))))

(declare-fun b!2307 () Bool)

(assert (=> b!2307 (= e!689 (Some!6 (_2!21 (h!592 (t!2103 (toList!39 lt!347))))))))

(declare-fun d!433 () Bool)

(declare-fun c!142 () Bool)

(assert (=> d!433 (= c!142 (and (is-Cons!26 (t!2103 (toList!39 lt!347))) (= (_1!21 (h!592 (t!2103 (toList!39 lt!347)))) k!394)))))

(assert (=> d!433 (= (getValueByKey!1 (t!2103 (toList!39 lt!347)) k!394) e!689)))

(assert (= (and d!433 c!142) b!2307))

(assert (= (and d!433 (not c!142)) b!2308))

(assert (= (and b!2308 c!143) b!2309))

(assert (= (and b!2308 (not c!143)) b!2310))

(declare-fun m!955 () Bool)

(assert (=> b!2309 m!955))

(assert (=> b!2241 d!433))

(declare-fun d!437 () Bool)

(declare-fun res!4668 () Bool)

(declare-fun e!691 () Bool)

(assert (=> d!437 (=> res!4668 e!691)))

(assert (=> d!437 (= res!4668 (not (is-Some!6 (getValueByKey!1 (toList!39 lt!347) k!394))))))

(assert (=> d!437 (= (forall!24 (getValueByKey!1 (toList!39 lt!347) k!394) lambda!23) e!691)))

(declare-fun b!2311 () Bool)

(assert (=> b!2311 (= e!691 (dynLambda!24 lambda!23 (v!1075 (getValueByKey!1 (toList!39 lt!347) k!394))))))

(assert (= (and d!437 (not res!4668)) b!2311))

(declare-fun b_lambda!235 () Bool)

(assert (=> (not b_lambda!235) (not b!2311)))

(declare-fun m!957 () Bool)

(assert (=> b!2311 m!957))

(assert (=> d!379 d!437))

(assert (=> d!379 d!369))

(declare-fun bs!96 () Bool)

(declare-fun d!441 () Bool)

(assert (= bs!96 (and d!441 b!2151)))

(declare-fun lambda!26 () Int)

(assert (=> bs!96 (= lambda!26 lambda!4)))

(declare-fun bs!97 () Bool)

(assert (= bs!97 (and d!441 d!379)))

(assert (=> bs!97 (= lambda!26 lambda!23)))

(assert (=> d!441 true))

(assert (=> d!441 true))

(assert (=> d!441 (< (dynLambda!15 order!1 p!318) (dynLambda!16 order!3 lambda!26))))

(assert (=> d!441 (forall!24 (getValueByKey!1 (toList!39 lt!347) k!394) lambda!26)))

(assert (=> d!441 true))

(declare-fun _$38!23 () Unit!13)

(assert (=> d!441 (= (choose!133 lt!347 p!318 k!394) _$38!23)))

(declare-fun bs!98 () Bool)

(assert (= bs!98 d!441))

(assert (=> bs!98 m!783))

(assert (=> bs!98 m!783))

(declare-fun m!963 () Bool)

(assert (=> bs!98 m!963))

(assert (=> d!379 d!441))

(assert (=> d!379 d!399))

(declare-fun b!2322 () Bool)

(declare-fun e!700 () Option!7)

(assert (=> b!2322 (= e!700 None!5)))

(declare-fun b!2321 () Bool)

(assert (=> b!2321 (= e!700 (getValueByKey!1 (t!2103 (t!2103 (toList!39 lm!258))) k!394))))

(declare-fun b!2320 () Bool)

(declare-fun e!699 () Option!7)

(assert (=> b!2320 (= e!699 e!700)))

(declare-fun c!145 () Bool)

(assert (=> b!2320 (= c!145 (and (is-Cons!26 (t!2103 (toList!39 lm!258))) (not (= (_1!21 (h!592 (t!2103 (toList!39 lm!258)))) k!394))))))

(declare-fun b!2319 () Bool)

(assert (=> b!2319 (= e!699 (Some!6 (_2!21 (h!592 (t!2103 (toList!39 lm!258))))))))

(declare-fun d!449 () Bool)

(declare-fun c!144 () Bool)

(assert (=> d!449 (= c!144 (and (is-Cons!26 (t!2103 (toList!39 lm!258))) (= (_1!21 (h!592 (t!2103 (toList!39 lm!258)))) k!394)))))

(assert (=> d!449 (= (getValueByKey!1 (t!2103 (toList!39 lm!258)) k!394) e!699)))

(assert (= (and d!449 c!144) b!2319))

(assert (= (and d!449 (not c!144)) b!2320))

(assert (= (and b!2320 c!145) b!2321))

(assert (= (and b!2320 (not c!145)) b!2322))

(declare-fun m!965 () Bool)

(assert (=> b!2321 m!965))

(assert (=> b!2270 d!449))

(declare-fun d!451 () Bool)

(assert (=> d!451 (= (tail!48 (toList!39 lm!258)) (t!2103 (toList!39 lm!258)))))

(assert (=> d!401 d!451))

(declare-fun d!453 () Bool)

(declare-fun res!4682 () Bool)

(declare-fun e!709 () Bool)

(assert (=> d!453 (=> res!4682 e!709)))

(assert (=> d!453 (= res!4682 (or (is-Nil!27 (toList!39 lm!258)) (is-Nil!27 (t!2103 (toList!39 lm!258)))))))

(assert (=> d!453 (= (isStrictlySorted!14 (toList!39 lm!258)) e!709)))

(declare-fun b!2333 () Bool)

(declare-fun e!710 () Bool)

(assert (=> b!2333 (= e!709 e!710)))

(declare-fun res!4683 () Bool)

(assert (=> b!2333 (=> (not res!4683) (not e!710))))

(assert (=> b!2333 (= res!4683 (bvslt (_1!21 (h!592 (toList!39 lm!258))) (_1!21 (h!592 (t!2103 (toList!39 lm!258))))))))

(declare-fun b!2334 () Bool)

(assert (=> b!2334 (= e!710 (isStrictlySorted!14 (t!2103 (toList!39 lm!258))))))

(assert (= (and d!453 (not res!4682)) b!2333))

(assert (= (and b!2333 res!4683) b!2334))

(declare-fun m!973 () Bool)

(assert (=> b!2334 m!973))

(assert (=> d!359 d!453))

(declare-fun d!463 () Bool)

(declare-fun res!4685 () Bool)

(declare-fun e!712 () Bool)

(assert (=> d!463 (=> res!4685 e!712)))

(assert (=> d!463 (= res!4685 (is-Nil!27 (t!2103 (toList!39 lm!258))))))

(assert (=> d!463 (= (forall!23 (t!2103 (toList!39 lm!258)) p!318) e!712)))

(declare-fun b!2336 () Bool)

(declare-fun e!713 () Bool)

(assert (=> b!2336 (= e!712 e!713)))

(declare-fun res!4686 () Bool)

(assert (=> b!2336 (=> (not res!4686) (not e!713))))

(assert (=> b!2336 (= res!4686 (dynLambda!23 p!318 (h!592 (t!2103 (toList!39 lm!258)))))))

(declare-fun b!2337 () Bool)

(assert (=> b!2337 (= e!713 (forall!23 (t!2103 (t!2103 (toList!39 lm!258))) p!318))))

(assert (= (and d!463 (not res!4685)) b!2336))

(assert (= (and b!2336 res!4686) b!2337))

(declare-fun b_lambda!243 () Bool)

(assert (=> (not b_lambda!243) (not b!2336)))

(declare-fun t!2139 () Bool)

(declare-fun tb!105 () Bool)

(assert (=> (and start!298 (= p!318 p!318) t!2139) tb!105))

(declare-fun result!141 () Bool)

(assert (=> tb!105 (= result!141 true)))

(assert (=> b!2336 t!2139))

(declare-fun b_and!159 () Bool)

(assert (= b_and!153 (and (=> t!2139 result!141) b_and!159)))

(declare-fun m!977 () Bool)

(assert (=> b!2336 m!977))

(declare-fun m!981 () Bool)

(assert (=> b!2337 m!981))

(assert (=> b!2205 d!463))

(declare-fun b!2339 () Bool)

(declare-fun e!715 () Bool)

(declare-fun tp!190 () Bool)

(assert (=> b!2339 (= e!715 (and tp_is_empty!33 tp!190))))

(assert (=> b!2285 (= tp!185 e!715)))

(assert (= (and b!2285 (is-Cons!26 (t!2103 (toList!39 lm!258)))) b!2339))

(declare-fun b_lambda!245 () Bool)

(assert (= b_lambda!231 (or (and start!298 b_free!43) b_lambda!245)))

(declare-fun b_lambda!247 () Bool)

(assert (= b_lambda!235 (or d!379 b_lambda!247)))

(declare-fun bs!102 () Bool)

(declare-fun d!467 () Bool)

(assert (= bs!102 (and d!467 d!379)))

(assert (=> bs!102 (= (dynLambda!24 lambda!23 (v!1075 (getValueByKey!1 (toList!39 lt!347) k!394))) (dynLambda!23 p!318 (tuple2!43 k!394 (v!1075 (getValueByKey!1 (toList!39 lt!347) k!394)))))))

(declare-fun b_lambda!257 () Bool)

(assert (=> (not b_lambda!257) (not bs!102)))

(assert (=> bs!102 t!2125))

(declare-fun b_and!161 () Bool)

(assert (= b_and!159 (and (=> t!2125 result!125) b_and!161)))

(assert (=> bs!102 m!929))

(assert (=> b!2311 d!467))

(declare-fun b_lambda!249 () Bool)

(assert (= b_lambda!243 (or (and start!298 b_free!43) b_lambda!249)))

(push 1)

(assert (not b!2321))

(assert (not b!2309))

(assert (not b!2337))

(assert (not b_lambda!193))

(assert (not b_lambda!257))

(assert (not b_lambda!197))

(assert (not b_next!43))

(assert (not b_lambda!249))

(assert (not d!441))

(assert (not b_lambda!221))

(assert (not b_lambda!245))

(assert (not b_lambda!247))

(assert tp_is_empty!33)

(assert (not b_lambda!195))

(assert (not b_lambda!223))

(assert (not b!2334))

(assert (not b_lambda!191))

(assert (not b!2304))

(assert b_and!161)

(assert (not b!2339))

(check-sat)

(pop 1)

(push 1)

(assert b_and!161)

(assert (not b_next!43))

(check-sat)

