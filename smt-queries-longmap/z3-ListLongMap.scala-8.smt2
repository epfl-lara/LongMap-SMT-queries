; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!298 () Bool)

(assert start!298)

(declare-fun b_free!43 () Bool)

(declare-fun b_next!43 () Bool)

(assert (=> start!298 (= b_free!43 (not b_next!43))))

(declare-fun tp!167 () Bool)

(declare-fun b_and!121 () Bool)

(assert (=> start!298 (= tp!167 b_and!121)))

(declare-fun b!2150 () Bool)

(assert (=> b!2150 true))

(assert (=> b!2150 true))

(declare-fun order!1 () Int)

(declare-fun p!318 () Int)

(declare-fun lambda!4 () Int)

(declare-fun order!3 () Int)

(declare-fun dynLambda!15 (Int Int) Int)

(declare-fun dynLambda!16 (Int Int) Int)

(assert (=> b!2150 (< (dynLambda!15 order!1 p!318) (dynLambda!16 order!3 lambda!4))))

(declare-fun b!2147 () Bool)

(declare-fun e!589 () Bool)

(declare-fun e!590 () Bool)

(assert (=> b!2147 (= e!589 e!590)))

(declare-fun res!4600 () Bool)

(assert (=> b!2147 (=> (not res!4600) (not e!590))))

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
(declare-fun lt!347 () ListLongMap!47)

(declare-fun forall!23 (List!30 Int) Bool)

(assert (=> b!2147 (= res!4600 (forall!23 (toList!39 lt!347) p!318))))

(declare-fun lm!258 () ListLongMap!47)

(declare-fun tail!44 (ListLongMap!47) ListLongMap!47)

(assert (=> b!2147 (= lt!347 (tail!44 lm!258))))

(declare-fun res!4601 () Bool)

(assert (=> start!298 (=> (not res!4601) (not e!589))))

(assert (=> start!298 (= res!4601 (forall!23 (toList!39 lm!258) p!318))))

(assert (=> start!298 e!589))

(declare-fun e!591 () Bool)

(declare-fun inv!71 (ListLongMap!47) Bool)

(assert (=> start!298 (and (inv!71 lm!258) e!591)))

(assert (=> start!298 tp!167))

(assert (=> start!298 true))

(declare-fun b!2148 () Bool)

(declare-fun res!4598 () Bool)

(assert (=> b!2148 (=> (not res!4598) (not e!589))))

(declare-fun k0!394 () (_ BitVec 64))

(declare-fun head!752 (List!30) tuple2!42)

(assert (=> b!2148 (= res!4598 (not (= (_1!21 (head!752 (toList!39 lm!258))) k0!394)))))

(declare-fun b!2149 () Bool)

(declare-fun res!4599 () Bool)

(assert (=> b!2149 (=> (not res!4599) (not e!589))))

(declare-fun isEmpty!31 (ListLongMap!47) Bool)

(assert (=> b!2149 (= res!4599 (not (isEmpty!31 lm!258)))))

(declare-datatypes ((Option!7 0))(
  ( (Some!6 (v!1075 B!278)) (None!5) )
))
(declare-fun forall!24 (Option!7 Int) Bool)

(declare-fun getValueByKey!1 (List!30 (_ BitVec 64)) Option!7)

(assert (=> b!2150 (= e!590 (not (forall!24 (getValueByKey!1 (toList!39 lm!258) k0!394) lambda!4)))))

(assert (=> b!2150 (forall!24 (getValueByKey!1 (toList!39 lt!347) k0!394) lambda!4)))

(declare-datatypes ((Unit!13 0))(
  ( (Unit!14) )
))
(declare-fun lt!346 () Unit!13)

(declare-fun getForall!2 (ListLongMap!47 Int (_ BitVec 64)) Unit!13)

(assert (=> b!2150 (= lt!346 (getForall!2 lt!347 p!318 k0!394))))

(declare-fun b!2151 () Bool)

(declare-fun tp!166 () Bool)

(assert (=> b!2151 (= e!591 tp!166)))

(assert (= (and start!298 res!4601) b!2149))

(assert (= (and b!2149 res!4599) b!2148))

(assert (= (and b!2148 res!4598) b!2147))

(assert (= (and b!2147 res!4600) b!2150))

(assert (= start!298 b!2151))

(declare-fun m!783 () Bool)

(assert (=> b!2150 m!783))

(declare-fun m!785 () Bool)

(assert (=> b!2150 m!785))

(assert (=> b!2150 m!783))

(declare-fun m!787 () Bool)

(assert (=> b!2150 m!787))

(declare-fun m!789 () Bool)

(assert (=> b!2150 m!789))

(declare-fun m!791 () Bool)

(assert (=> b!2150 m!791))

(assert (=> b!2150 m!789))

(declare-fun m!793 () Bool)

(assert (=> b!2149 m!793))

(declare-fun m!795 () Bool)

(assert (=> start!298 m!795))

(declare-fun m!797 () Bool)

(assert (=> start!298 m!797))

(declare-fun m!799 () Bool)

(assert (=> b!2147 m!799))

(declare-fun m!801 () Bool)

(assert (=> b!2147 m!801))

(declare-fun m!803 () Bool)

(assert (=> b!2148 m!803))

(check-sat (not b!2149) (not b!2151) (not b_next!43) (not b!2150) b_and!121 (not start!298) (not b!2148) (not b!2147))
(check-sat b_and!121 (not b_next!43))
(get-model)

(declare-fun d!355 () Bool)

(assert (=> d!355 (= (head!752 (toList!39 lm!258)) (h!592 (toList!39 lm!258)))))

(assert (=> b!2148 d!355))

(declare-fun d!357 () Bool)

(declare-fun res!4640 () Bool)

(declare-fun e!624 () Bool)

(assert (=> d!357 (=> res!4640 e!624)))

(get-info :version)

(assert (=> d!357 (= res!4640 ((_ is Nil!27) (toList!39 lt!347)))))

(assert (=> d!357 (= (forall!23 (toList!39 lt!347) p!318) e!624)))

(declare-fun b!2208 () Bool)

(declare-fun e!625 () Bool)

(assert (=> b!2208 (= e!624 e!625)))

(declare-fun res!4641 () Bool)

(assert (=> b!2208 (=> (not res!4641) (not e!625))))

(declare-fun dynLambda!23 (Int tuple2!42) Bool)

(assert (=> b!2208 (= res!4641 (dynLambda!23 p!318 (h!592 (toList!39 lt!347))))))

(declare-fun b!2209 () Bool)

(assert (=> b!2209 (= e!625 (forall!23 (t!2103 (toList!39 lt!347)) p!318))))

(assert (= (and d!357 (not res!4640)) b!2208))

(assert (= (and b!2208 res!4641) b!2209))

(declare-fun b_lambda!163 () Bool)

(assert (=> (not b_lambda!163) (not b!2208)))

(declare-fun t!2109 () Bool)

(declare-fun tb!75 () Bool)

(assert (=> (and start!298 (= p!318 p!318) t!2109) tb!75))

(declare-fun result!105 () Bool)

(assert (=> tb!75 (= result!105 true)))

(assert (=> b!2208 t!2109))

(declare-fun b_and!129 () Bool)

(assert (= b_and!121 (and (=> t!2109 result!105) b_and!129)))

(declare-fun m!859 () Bool)

(assert (=> b!2208 m!859))

(declare-fun m!861 () Bool)

(assert (=> b!2209 m!861))

(assert (=> b!2147 d!357))

(declare-fun d!361 () Bool)

(declare-fun tail!47 (List!30) List!30)

(assert (=> d!361 (= (tail!44 lm!258) (ListLongMap!48 (tail!47 (toList!39 lm!258))))))

(declare-fun bs!77 () Bool)

(assert (= bs!77 d!361))

(declare-fun m!863 () Bool)

(assert (=> bs!77 m!863))

(assert (=> b!2147 d!361))

(declare-fun d!363 () Bool)

(declare-fun res!4644 () Bool)

(declare-fun e!634 () Bool)

(assert (=> d!363 (=> res!4644 e!634)))

(assert (=> d!363 (= res!4644 (not ((_ is Some!6) (getValueByKey!1 (toList!39 lt!347) k0!394))))))

(assert (=> d!363 (= (forall!24 (getValueByKey!1 (toList!39 lt!347) k0!394) lambda!4) e!634)))

(declare-fun b!2224 () Bool)

(declare-fun dynLambda!24 (Int B!278) Bool)

(assert (=> b!2224 (= e!634 (dynLambda!24 lambda!4 (v!1075 (getValueByKey!1 (toList!39 lt!347) k0!394))))))

(assert (= (and d!363 (not res!4644)) b!2224))

(declare-fun b_lambda!165 () Bool)

(assert (=> (not b_lambda!165) (not b!2224)))

(declare-fun m!871 () Bool)

(assert (=> b!2224 m!871))

(assert (=> b!2150 d!363))

(declare-fun d!369 () Bool)

(declare-fun res!4647 () Bool)

(declare-fun e!639 () Bool)

(assert (=> d!369 (=> res!4647 e!639)))

(assert (=> d!369 (= res!4647 (not ((_ is Some!6) (getValueByKey!1 (toList!39 lm!258) k0!394))))))

(assert (=> d!369 (= (forall!24 (getValueByKey!1 (toList!39 lm!258) k0!394) lambda!4) e!639)))

(declare-fun b!2231 () Bool)

(assert (=> b!2231 (= e!639 (dynLambda!24 lambda!4 (v!1075 (getValueByKey!1 (toList!39 lm!258) k0!394))))))

(assert (= (and d!369 (not res!4647)) b!2231))

(declare-fun b_lambda!167 () Bool)

(assert (=> (not b_lambda!167) (not b!2231)))

(declare-fun m!873 () Bool)

(assert (=> b!2231 m!873))

(assert (=> b!2150 d!369))

(declare-fun d!371 () Bool)

(declare-fun c!132 () Bool)

(assert (=> d!371 (= c!132 (and ((_ is Cons!26) (toList!39 lt!347)) (= (_1!21 (h!592 (toList!39 lt!347))) k0!394)))))

(declare-fun e!653 () Option!7)

(assert (=> d!371 (= (getValueByKey!1 (toList!39 lt!347) k0!394) e!653)))

(declare-fun b!2258 () Bool)

(declare-fun e!654 () Option!7)

(assert (=> b!2258 (= e!654 None!5)))

(declare-fun b!2256 () Bool)

(assert (=> b!2256 (= e!653 e!654)))

(declare-fun c!133 () Bool)

(assert (=> b!2256 (= c!133 (and ((_ is Cons!26) (toList!39 lt!347)) (not (= (_1!21 (h!592 (toList!39 lt!347))) k0!394))))))

(declare-fun b!2255 () Bool)

(assert (=> b!2255 (= e!653 (Some!6 (_2!21 (h!592 (toList!39 lt!347)))))))

(declare-fun b!2257 () Bool)

(assert (=> b!2257 (= e!654 (getValueByKey!1 (t!2103 (toList!39 lt!347)) k0!394))))

(assert (= (and d!371 c!132) b!2255))

(assert (= (and d!371 (not c!132)) b!2256))

(assert (= (and b!2256 c!133) b!2257))

(assert (= (and b!2256 (not c!133)) b!2258))

(declare-fun m!881 () Bool)

(assert (=> b!2257 m!881))

(assert (=> b!2150 d!371))

(declare-fun bs!82 () Bool)

(declare-fun d!379 () Bool)

(assert (= bs!82 (and d!379 b!2150)))

(declare-fun lambda!23 () Int)

(assert (=> bs!82 (= lambda!23 lambda!4)))

(assert (=> d!379 true))

(assert (=> d!379 true))

(assert (=> d!379 (< (dynLambda!15 order!1 p!318) (dynLambda!16 order!3 lambda!23))))

(assert (=> d!379 (forall!24 (getValueByKey!1 (toList!39 lt!347) k0!394) lambda!23)))

(declare-fun lt!368 () Unit!13)

(declare-fun choose!133 (ListLongMap!47 Int (_ BitVec 64)) Unit!13)

(assert (=> d!379 (= lt!368 (choose!133 lt!347 p!318 k0!394))))

(assert (=> d!379 (forall!23 (toList!39 lt!347) p!318)))

(assert (=> d!379 (= (getForall!2 lt!347 p!318 k0!394) lt!368)))

(declare-fun bs!84 () Bool)

(assert (= bs!84 d!379))

(assert (=> bs!84 m!783))

(assert (=> bs!84 m!783))

(declare-fun m!903 () Bool)

(assert (=> bs!84 m!903))

(declare-fun m!905 () Bool)

(assert (=> bs!84 m!905))

(assert (=> bs!84 m!799))

(assert (=> b!2150 d!379))

(declare-fun d!395 () Bool)

(declare-fun c!136 () Bool)

(assert (=> d!395 (= c!136 (and ((_ is Cons!26) (toList!39 lm!258)) (= (_1!21 (h!592 (toList!39 lm!258))) k0!394)))))

(declare-fun e!664 () Option!7)

(assert (=> d!395 (= (getValueByKey!1 (toList!39 lm!258) k0!394) e!664)))

(declare-fun b!2273 () Bool)

(declare-fun e!665 () Option!7)

(assert (=> b!2273 (= e!665 None!5)))

(declare-fun b!2271 () Bool)

(assert (=> b!2271 (= e!664 e!665)))

(declare-fun c!137 () Bool)

(assert (=> b!2271 (= c!137 (and ((_ is Cons!26) (toList!39 lm!258)) (not (= (_1!21 (h!592 (toList!39 lm!258))) k0!394))))))

(declare-fun b!2270 () Bool)

(assert (=> b!2270 (= e!664 (Some!6 (_2!21 (h!592 (toList!39 lm!258)))))))

(declare-fun b!2272 () Bool)

(assert (=> b!2272 (= e!665 (getValueByKey!1 (t!2103 (toList!39 lm!258)) k0!394))))

(assert (= (and d!395 c!136) b!2270))

(assert (= (and d!395 (not c!136)) b!2271))

(assert (= (and b!2271 c!137) b!2272))

(assert (= (and b!2271 (not c!137)) b!2273))

(declare-fun m!909 () Bool)

(assert (=> b!2272 m!909))

(assert (=> b!2150 d!395))

(declare-fun d!399 () Bool)

(declare-fun res!4660 () Bool)

(declare-fun e!668 () Bool)

(assert (=> d!399 (=> res!4660 e!668)))

(assert (=> d!399 (= res!4660 ((_ is Nil!27) (toList!39 lm!258)))))

(assert (=> d!399 (= (forall!23 (toList!39 lm!258) p!318) e!668)))

(declare-fun b!2276 () Bool)

(declare-fun e!669 () Bool)

(assert (=> b!2276 (= e!668 e!669)))

(declare-fun res!4661 () Bool)

(assert (=> b!2276 (=> (not res!4661) (not e!669))))

(assert (=> b!2276 (= res!4661 (dynLambda!23 p!318 (h!592 (toList!39 lm!258))))))

(declare-fun b!2277 () Bool)

(assert (=> b!2277 (= e!669 (forall!23 (t!2103 (toList!39 lm!258)) p!318))))

(assert (= (and d!399 (not res!4660)) b!2276))

(assert (= (and b!2276 res!4661) b!2277))

(declare-fun b_lambda!179 () Bool)

(assert (=> (not b_lambda!179) (not b!2276)))

(declare-fun t!2117 () Bool)

(declare-fun tb!83 () Bool)

(assert (=> (and start!298 (= p!318 p!318) t!2117) tb!83))

(declare-fun result!113 () Bool)

(assert (=> tb!83 (= result!113 true)))

(assert (=> b!2276 t!2117))

(declare-fun b_and!137 () Bool)

(assert (= b_and!129 (and (=> t!2117 result!113) b_and!137)))

(declare-fun m!917 () Bool)

(assert (=> b!2276 m!917))

(declare-fun m!919 () Bool)

(assert (=> b!2277 m!919))

(assert (=> start!298 d!399))

(declare-fun d!405 () Bool)

(declare-fun isStrictlySorted!14 (List!30) Bool)

(assert (=> d!405 (= (inv!71 lm!258) (isStrictlySorted!14 (toList!39 lm!258)))))

(declare-fun bs!89 () Bool)

(assert (= bs!89 d!405))

(declare-fun m!923 () Bool)

(assert (=> bs!89 m!923))

(assert (=> start!298 d!405))

(declare-fun d!409 () Bool)

(declare-fun isEmpty!35 (List!30) Bool)

(assert (=> d!409 (= (isEmpty!31 lm!258) (isEmpty!35 (toList!39 lm!258)))))

(declare-fun bs!91 () Bool)

(assert (= bs!91 d!409))

(declare-fun m!927 () Bool)

(assert (=> bs!91 m!927))

(assert (=> b!2149 d!409))

(declare-fun b!2292 () Bool)

(declare-fun e!678 () Bool)

(declare-fun tp_is_empty!35 () Bool)

(declare-fun tp!188 () Bool)

(assert (=> b!2292 (= e!678 (and tp_is_empty!35 tp!188))))

(assert (=> b!2151 (= tp!166 e!678)))

(assert (= (and b!2151 ((_ is Cons!26) (toList!39 lm!258))) b!2292))

(declare-fun b_lambda!205 () Bool)

(assert (= b_lambda!165 (or b!2150 b_lambda!205)))

(declare-fun bs!94 () Bool)

(declare-fun d!417 () Bool)

(assert (= bs!94 (and d!417 b!2150)))

(assert (=> bs!94 (= (dynLambda!24 lambda!4 (v!1075 (getValueByKey!1 (toList!39 lt!347) k0!394))) (dynLambda!23 p!318 (tuple2!43 k0!394 (v!1075 (getValueByKey!1 (toList!39 lt!347) k0!394)))))))

(declare-fun b_lambda!213 () Bool)

(assert (=> (not b_lambda!213) (not bs!94)))

(declare-fun t!2127 () Bool)

(declare-fun tb!93 () Bool)

(assert (=> (and start!298 (= p!318 p!318) t!2127) tb!93))

(declare-fun result!129 () Bool)

(assert (=> tb!93 (= result!129 true)))

(assert (=> bs!94 t!2127))

(declare-fun b_and!147 () Bool)

(assert (= b_and!137 (and (=> t!2127 result!129) b_and!147)))

(declare-fun m!935 () Bool)

(assert (=> bs!94 m!935))

(assert (=> b!2224 d!417))

(declare-fun b_lambda!207 () Bool)

(assert (= b_lambda!167 (or b!2150 b_lambda!207)))

(declare-fun bs!95 () Bool)

(declare-fun d!419 () Bool)

(assert (= bs!95 (and d!419 b!2150)))

(assert (=> bs!95 (= (dynLambda!24 lambda!4 (v!1075 (getValueByKey!1 (toList!39 lm!258) k0!394))) (dynLambda!23 p!318 (tuple2!43 k0!394 (v!1075 (getValueByKey!1 (toList!39 lm!258) k0!394)))))))

(declare-fun b_lambda!215 () Bool)

(assert (=> (not b_lambda!215) (not bs!95)))

(declare-fun t!2129 () Bool)

(declare-fun tb!95 () Bool)

(assert (=> (and start!298 (= p!318 p!318) t!2129) tb!95))

(declare-fun result!131 () Bool)

(assert (=> tb!95 (= result!131 true)))

(assert (=> bs!95 t!2129))

(declare-fun b_and!149 () Bool)

(assert (= b_and!147 (and (=> t!2129 result!131) b_and!149)))

(declare-fun m!937 () Bool)

(assert (=> bs!95 m!937))

(assert (=> b!2231 d!419))

(declare-fun b_lambda!209 () Bool)

(assert (= b_lambda!163 (or (and start!298 b_free!43) b_lambda!209)))

(declare-fun b_lambda!211 () Bool)

(assert (= b_lambda!179 (or (and start!298 b_free!43) b_lambda!211)))

(check-sat (not b_lambda!207) (not b!2292) (not b_lambda!209) (not b!2257) (not b_lambda!215) (not d!409) (not b!2209) (not d!379) (not d!405) (not b!2277) (not b!2272) tp_is_empty!35 (not b_next!43) (not b_lambda!211) (not d!361) (not b_lambda!213) b_and!149 (not b_lambda!205))
(check-sat b_and!149 (not b_next!43))
(get-model)

(declare-fun b_lambda!221 () Bool)

(assert (= b_lambda!213 (or (and start!298 b_free!43) b_lambda!221)))

(declare-fun b_lambda!223 () Bool)

(assert (= b_lambda!215 (or (and start!298 b_free!43) b_lambda!223)))

(check-sat (not b_lambda!207) (not b_lambda!223) (not b!2292) (not b_lambda!209) (not b!2257) (not b_lambda!221) (not d!409) (not b!2209) (not d!379) (not d!405) (not b!2277) (not b!2272) tp_is_empty!35 (not b_next!43) (not b_lambda!211) (not d!361) b_and!149 (not b_lambda!205))
(check-sat b_and!149 (not b_next!43))
(get-model)

(declare-fun d!429 () Bool)

(declare-fun c!138 () Bool)

(assert (=> d!429 (= c!138 (and ((_ is Cons!26) (t!2103 (toList!39 lm!258))) (= (_1!21 (h!592 (t!2103 (toList!39 lm!258)))) k0!394)))))

(declare-fun e!682 () Option!7)

(assert (=> d!429 (= (getValueByKey!1 (t!2103 (toList!39 lm!258)) k0!394) e!682)))

(declare-fun b!2299 () Bool)

(declare-fun e!683 () Option!7)

(assert (=> b!2299 (= e!683 None!5)))

(declare-fun b!2297 () Bool)

(assert (=> b!2297 (= e!682 e!683)))

(declare-fun c!139 () Bool)

(assert (=> b!2297 (= c!139 (and ((_ is Cons!26) (t!2103 (toList!39 lm!258))) (not (= (_1!21 (h!592 (t!2103 (toList!39 lm!258)))) k0!394))))))

(declare-fun b!2296 () Bool)

(assert (=> b!2296 (= e!682 (Some!6 (_2!21 (h!592 (t!2103 (toList!39 lm!258))))))))

(declare-fun b!2298 () Bool)

(assert (=> b!2298 (= e!683 (getValueByKey!1 (t!2103 (t!2103 (toList!39 lm!258))) k0!394))))

(assert (= (and d!429 c!138) b!2296))

(assert (= (and d!429 (not c!138)) b!2297))

(assert (= (and b!2297 c!139) b!2298))

(assert (= (and b!2297 (not c!139)) b!2299))

(declare-fun m!945 () Bool)

(assert (=> b!2298 m!945))

(assert (=> b!2272 d!429))

(declare-fun d!431 () Bool)

(assert (=> d!431 (= (isEmpty!35 (toList!39 lm!258)) ((_ is Nil!27) (toList!39 lm!258)))))

(assert (=> d!409 d!431))

(declare-fun d!433 () Bool)

(declare-fun res!4665 () Bool)

(declare-fun e!684 () Bool)

(assert (=> d!433 (=> res!4665 e!684)))

(assert (=> d!433 (= res!4665 ((_ is Nil!27) (t!2103 (toList!39 lm!258))))))

(assert (=> d!433 (= (forall!23 (t!2103 (toList!39 lm!258)) p!318) e!684)))

(declare-fun b!2300 () Bool)

(declare-fun e!685 () Bool)

(assert (=> b!2300 (= e!684 e!685)))

(declare-fun res!4666 () Bool)

(assert (=> b!2300 (=> (not res!4666) (not e!685))))

(assert (=> b!2300 (= res!4666 (dynLambda!23 p!318 (h!592 (t!2103 (toList!39 lm!258)))))))

(declare-fun b!2301 () Bool)

(assert (=> b!2301 (= e!685 (forall!23 (t!2103 (t!2103 (toList!39 lm!258))) p!318))))

(assert (= (and d!433 (not res!4665)) b!2300))

(assert (= (and b!2300 res!4666) b!2301))

(declare-fun b_lambda!233 () Bool)

(assert (=> (not b_lambda!233) (not b!2300)))

(declare-fun t!2133 () Bool)

(declare-fun tb!99 () Bool)

(assert (=> (and start!298 (= p!318 p!318) t!2133) tb!99))

(declare-fun result!135 () Bool)

(assert (=> tb!99 (= result!135 true)))

(assert (=> b!2300 t!2133))

(declare-fun b_and!153 () Bool)

(assert (= b_and!149 (and (=> t!2133 result!135) b_and!153)))

(declare-fun m!947 () Bool)

(assert (=> b!2300 m!947))

(declare-fun m!949 () Bool)

(assert (=> b!2301 m!949))

(assert (=> b!2277 d!433))

(declare-fun d!435 () Bool)

(declare-fun res!4667 () Bool)

(declare-fun e!686 () Bool)

(assert (=> d!435 (=> res!4667 e!686)))

(assert (=> d!435 (= res!4667 (not ((_ is Some!6) (getValueByKey!1 (toList!39 lt!347) k0!394))))))

(assert (=> d!435 (= (forall!24 (getValueByKey!1 (toList!39 lt!347) k0!394) lambda!23) e!686)))

(declare-fun b!2302 () Bool)

(assert (=> b!2302 (= e!686 (dynLambda!24 lambda!23 (v!1075 (getValueByKey!1 (toList!39 lt!347) k0!394))))))

(assert (= (and d!435 (not res!4667)) b!2302))

(declare-fun b_lambda!235 () Bool)

(assert (=> (not b_lambda!235) (not b!2302)))

(declare-fun m!951 () Bool)

(assert (=> b!2302 m!951))

(assert (=> d!379 d!435))

(assert (=> d!379 d!371))

(declare-fun bs!99 () Bool)

(declare-fun d!437 () Bool)

(assert (= bs!99 (and d!437 b!2150)))

(declare-fun lambda!29 () Int)

(assert (=> bs!99 (= lambda!29 lambda!4)))

(declare-fun bs!100 () Bool)

(assert (= bs!100 (and d!437 d!379)))

(assert (=> bs!100 (= lambda!29 lambda!23)))

(assert (=> d!437 true))

(assert (=> d!437 true))

(assert (=> d!437 (< (dynLambda!15 order!1 p!318) (dynLambda!16 order!3 lambda!29))))

(assert (=> d!437 (forall!24 (getValueByKey!1 (toList!39 lt!347) k0!394) lambda!29)))

(assert (=> d!437 true))

(declare-fun _$38!26 () Unit!13)

(assert (=> d!437 (= (choose!133 lt!347 p!318 k0!394) _$38!26)))

(declare-fun bs!101 () Bool)

(assert (= bs!101 d!437))

(assert (=> bs!101 m!783))

(assert (=> bs!101 m!783))

(declare-fun m!957 () Bool)

(assert (=> bs!101 m!957))

(assert (=> d!379 d!437))

(assert (=> d!379 d!357))

(declare-fun d!445 () Bool)

(assert (=> d!445 (= (tail!47 (toList!39 lm!258)) (t!2103 (toList!39 lm!258)))))

(assert (=> d!361 d!445))

(declare-fun d!449 () Bool)

(declare-fun c!142 () Bool)

(assert (=> d!449 (= c!142 (and ((_ is Cons!26) (t!2103 (toList!39 lt!347))) (= (_1!21 (h!592 (t!2103 (toList!39 lt!347)))) k0!394)))))

(declare-fun e!697 () Option!7)

(assert (=> d!449 (= (getValueByKey!1 (t!2103 (toList!39 lt!347)) k0!394) e!697)))

(declare-fun b!2318 () Bool)

(declare-fun e!698 () Option!7)

(assert (=> b!2318 (= e!698 None!5)))

(declare-fun b!2316 () Bool)

(assert (=> b!2316 (= e!697 e!698)))

(declare-fun c!143 () Bool)

(assert (=> b!2316 (= c!143 (and ((_ is Cons!26) (t!2103 (toList!39 lt!347))) (not (= (_1!21 (h!592 (t!2103 (toList!39 lt!347)))) k0!394))))))

(declare-fun b!2315 () Bool)

(assert (=> b!2315 (= e!697 (Some!6 (_2!21 (h!592 (t!2103 (toList!39 lt!347))))))))

(declare-fun b!2317 () Bool)

(assert (=> b!2317 (= e!698 (getValueByKey!1 (t!2103 (t!2103 (toList!39 lt!347))) k0!394))))

(assert (= (and d!449 c!142) b!2315))

(assert (= (and d!449 (not c!142)) b!2316))

(assert (= (and b!2316 c!143) b!2317))

(assert (= (and b!2316 (not c!143)) b!2318))

(declare-fun m!965 () Bool)

(assert (=> b!2317 m!965))

(assert (=> b!2257 d!449))

(declare-fun d!453 () Bool)

(declare-fun res!4676 () Bool)

(declare-fun e!701 () Bool)

(assert (=> d!453 (=> res!4676 e!701)))

(assert (=> d!453 (= res!4676 ((_ is Nil!27) (t!2103 (toList!39 lt!347))))))

(assert (=> d!453 (= (forall!23 (t!2103 (toList!39 lt!347)) p!318) e!701)))

(declare-fun b!2323 () Bool)

(declare-fun e!702 () Bool)

(assert (=> b!2323 (= e!701 e!702)))

(declare-fun res!4677 () Bool)

(assert (=> b!2323 (=> (not res!4677) (not e!702))))

(assert (=> b!2323 (= res!4677 (dynLambda!23 p!318 (h!592 (t!2103 (toList!39 lt!347)))))))

(declare-fun b!2324 () Bool)

(assert (=> b!2324 (= e!702 (forall!23 (t!2103 (t!2103 (toList!39 lt!347))) p!318))))

(assert (= (and d!453 (not res!4676)) b!2323))

(assert (= (and b!2323 res!4677) b!2324))

(declare-fun b_lambda!239 () Bool)

(assert (=> (not b_lambda!239) (not b!2323)))

(declare-fun t!2137 () Bool)

(declare-fun tb!103 () Bool)

(assert (=> (and start!298 (= p!318 p!318) t!2137) tb!103))

(declare-fun result!139 () Bool)

(assert (=> tb!103 (= result!139 true)))

(assert (=> b!2323 t!2137))

(declare-fun b_and!157 () Bool)

(assert (= b_and!153 (and (=> t!2137 result!139) b_and!157)))

(declare-fun m!969 () Bool)

(assert (=> b!2323 m!969))

(declare-fun m!971 () Bool)

(assert (=> b!2324 m!971))

(assert (=> b!2209 d!453))

(declare-fun d!455 () Bool)

(declare-fun res!4682 () Bool)

(declare-fun e!708 () Bool)

(assert (=> d!455 (=> res!4682 e!708)))

(assert (=> d!455 (= res!4682 (or ((_ is Nil!27) (toList!39 lm!258)) ((_ is Nil!27) (t!2103 (toList!39 lm!258)))))))

(assert (=> d!455 (= (isStrictlySorted!14 (toList!39 lm!258)) e!708)))

(declare-fun b!2330 () Bool)

(declare-fun e!709 () Bool)

(assert (=> b!2330 (= e!708 e!709)))

(declare-fun res!4683 () Bool)

(assert (=> b!2330 (=> (not res!4683) (not e!709))))

(assert (=> b!2330 (= res!4683 (bvslt (_1!21 (h!592 (toList!39 lm!258))) (_1!21 (h!592 (t!2103 (toList!39 lm!258))))))))

(declare-fun b!2331 () Bool)

(assert (=> b!2331 (= e!709 (isStrictlySorted!14 (t!2103 (toList!39 lm!258))))))

(assert (= (and d!455 (not res!4682)) b!2330))

(assert (= (and b!2330 res!4683) b!2331))

(declare-fun m!973 () Bool)

(assert (=> b!2331 m!973))

(assert (=> d!405 d!455))

(declare-fun b!2332 () Bool)

(declare-fun e!710 () Bool)

(declare-fun tp!190 () Bool)

(assert (=> b!2332 (= e!710 (and tp_is_empty!35 tp!190))))

(assert (=> b!2292 (= tp!188 e!710)))

(assert (= (and b!2292 ((_ is Cons!26) (t!2103 (toList!39 lm!258)))) b!2332))

(declare-fun b_lambda!249 () Bool)

(assert (= b_lambda!239 (or (and start!298 b_free!43) b_lambda!249)))

(declare-fun b_lambda!251 () Bool)

(assert (= b_lambda!233 (or (and start!298 b_free!43) b_lambda!251)))

(declare-fun b_lambda!253 () Bool)

(assert (= b_lambda!235 (or d!379 b_lambda!253)))

(declare-fun bs!103 () Bool)

(declare-fun d!461 () Bool)

(assert (= bs!103 (and d!461 d!379)))

(assert (=> bs!103 (= (dynLambda!24 lambda!23 (v!1075 (getValueByKey!1 (toList!39 lt!347) k0!394))) (dynLambda!23 p!318 (tuple2!43 k0!394 (v!1075 (getValueByKey!1 (toList!39 lt!347) k0!394)))))))

(declare-fun b_lambda!255 () Bool)

(assert (=> (not b_lambda!255) (not bs!103)))

(assert (=> bs!103 t!2127))

(declare-fun b_and!161 () Bool)

(assert (= b_and!157 (and (=> t!2127 result!129) b_and!161)))

(assert (=> bs!103 m!935))

(assert (=> b!2302 d!461))

(check-sat (not b_lambda!207) (not b_lambda!223) (not b!2331) (not b!2298) (not b_lambda!209) (not b_lambda!251) (not b_lambda!211) (not b_lambda!221) (not d!437) (not b_lambda!255) (not b_lambda!249) (not b_lambda!205) (not b!2301) (not b!2317) (not b!2324) (not b_lambda!253) (not b!2332) b_and!161 tp_is_empty!35 (not b_next!43))
(check-sat b_and!161 (not b_next!43))
