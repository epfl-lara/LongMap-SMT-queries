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

(declare-fun d!353 () Bool)

(assert (=> d!353 (= (head!752 (toList!39 lm!258)) (h!592 (toList!39 lm!258)))))

(assert (=> b!2148 d!353))

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

(declare-fun res!4645 () Bool)

(declare-fun e!637 () Bool)

(assert (=> d!369 (=> res!4645 e!637)))

(assert (=> d!369 (= res!4645 (not ((_ is Some!6) (getValueByKey!1 (toList!39 lm!258) k0!394))))))

(assert (=> d!369 (= (forall!24 (getValueByKey!1 (toList!39 lm!258) k0!394) lambda!4) e!637)))

(declare-fun b!2229 () Bool)

(assert (=> b!2229 (= e!637 (dynLambda!24 lambda!4 (v!1075 (getValueByKey!1 (toList!39 lm!258) k0!394))))))

(assert (= (and d!369 (not res!4645)) b!2229))

(declare-fun b_lambda!167 () Bool)

(assert (=> (not b_lambda!167) (not b!2229)))

(declare-fun m!873 () Bool)

(assert (=> b!2229 m!873))

(assert (=> b!2150 d!369))

(declare-fun b!2256 () Bool)

(declare-fun e!653 () Option!7)

(declare-fun e!654 () Option!7)

(assert (=> b!2256 (= e!653 e!654)))

(declare-fun c!133 () Bool)

(assert (=> b!2256 (= c!133 (and ((_ is Cons!26) (toList!39 lt!347)) (not (= (_1!21 (h!592 (toList!39 lt!347))) k0!394))))))

(declare-fun d!371 () Bool)

(declare-fun c!132 () Bool)

(assert (=> d!371 (= c!132 (and ((_ is Cons!26) (toList!39 lt!347)) (= (_1!21 (h!592 (toList!39 lt!347))) k0!394)))))

(assert (=> d!371 (= (getValueByKey!1 (toList!39 lt!347) k0!394) e!653)))

(declare-fun b!2258 () Bool)

(assert (=> b!2258 (= e!654 None!5)))

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

(declare-fun bs!83 () Bool)

(declare-fun d!379 () Bool)

(assert (= bs!83 (and d!379 b!2150)))

(declare-fun lambda!23 () Int)

(assert (=> bs!83 (= lambda!23 lambda!4)))

(assert (=> d!379 true))

(assert (=> d!379 true))

(assert (=> d!379 (< (dynLambda!15 order!1 p!318) (dynLambda!16 order!3 lambda!23))))

(assert (=> d!379 (forall!24 (getValueByKey!1 (toList!39 lt!347) k0!394) lambda!23)))

(declare-fun lt!368 () Unit!13)

(declare-fun choose!132 (ListLongMap!47 Int (_ BitVec 64)) Unit!13)

(assert (=> d!379 (= lt!368 (choose!132 lt!347 p!318 k0!394))))

(assert (=> d!379 (forall!23 (toList!39 lt!347) p!318)))

(assert (=> d!379 (= (getForall!2 lt!347 p!318 k0!394) lt!368)))

(declare-fun bs!84 () Bool)

(assert (= bs!84 d!379))

(assert (=> bs!84 m!783))

(assert (=> bs!84 m!783))

(declare-fun m!903 () Bool)

(assert (=> bs!84 m!903))

(declare-fun m!907 () Bool)

(assert (=> bs!84 m!907))

(assert (=> bs!84 m!799))

(assert (=> b!2150 d!379))

(declare-fun b!2273 () Bool)

(declare-fun e!666 () Option!7)

(declare-fun e!667 () Option!7)

(assert (=> b!2273 (= e!666 e!667)))

(declare-fun c!137 () Bool)

(assert (=> b!2273 (= c!137 (and ((_ is Cons!26) (toList!39 lm!258)) (not (= (_1!21 (h!592 (toList!39 lm!258))) k0!394))))))

(declare-fun d!397 () Bool)

(declare-fun c!136 () Bool)

(assert (=> d!397 (= c!136 (and ((_ is Cons!26) (toList!39 lm!258)) (= (_1!21 (h!592 (toList!39 lm!258))) k0!394)))))

(assert (=> d!397 (= (getValueByKey!1 (toList!39 lm!258) k0!394) e!666)))

(declare-fun b!2275 () Bool)

(assert (=> b!2275 (= e!667 None!5)))

(declare-fun b!2272 () Bool)

(assert (=> b!2272 (= e!666 (Some!6 (_2!21 (h!592 (toList!39 lm!258)))))))

(declare-fun b!2274 () Bool)

(assert (=> b!2274 (= e!667 (getValueByKey!1 (t!2103 (toList!39 lm!258)) k0!394))))

(assert (= (and d!397 c!136) b!2272))

(assert (= (and d!397 (not c!136)) b!2273))

(assert (= (and b!2273 c!137) b!2274))

(assert (= (and b!2273 (not c!137)) b!2275))

(declare-fun m!913 () Bool)

(assert (=> b!2274 m!913))

(assert (=> b!2150 d!397))

(declare-fun d!401 () Bool)

(declare-fun res!4660 () Bool)

(declare-fun e!668 () Bool)

(assert (=> d!401 (=> res!4660 e!668)))

(assert (=> d!401 (= res!4660 ((_ is Nil!27) (toList!39 lm!258)))))

(assert (=> d!401 (= (forall!23 (toList!39 lm!258) p!318) e!668)))

(declare-fun b!2276 () Bool)

(declare-fun e!669 () Bool)

(assert (=> b!2276 (= e!668 e!669)))

(declare-fun res!4661 () Bool)

(assert (=> b!2276 (=> (not res!4661) (not e!669))))

(assert (=> b!2276 (= res!4661 (dynLambda!23 p!318 (h!592 (toList!39 lm!258))))))

(declare-fun b!2277 () Bool)

(assert (=> b!2277 (= e!669 (forall!23 (t!2103 (toList!39 lm!258)) p!318))))

(assert (= (and d!401 (not res!4660)) b!2276))

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

(declare-fun m!919 () Bool)

(assert (=> b!2276 m!919))

(declare-fun m!921 () Bool)

(assert (=> b!2277 m!921))

(assert (=> start!298 d!401))

(declare-fun d!405 () Bool)

(declare-fun isStrictlySorted!15 (List!30) Bool)

(assert (=> d!405 (= (inv!71 lm!258) (isStrictlySorted!15 (toList!39 lm!258)))))

(declare-fun bs!90 () Bool)

(assert (= bs!90 d!405))

(declare-fun m!925 () Bool)

(assert (=> bs!90 m!925))

(assert (=> start!298 d!405))

(declare-fun d!411 () Bool)

(declare-fun isEmpty!34 (List!30) Bool)

(assert (=> d!411 (= (isEmpty!31 lm!258) (isEmpty!34 (toList!39 lm!258)))))

(declare-fun bs!93 () Bool)

(assert (= bs!93 d!411))

(declare-fun m!929 () Bool)

(assert (=> bs!93 m!929))

(assert (=> b!2149 d!411))

(declare-fun b!2292 () Bool)

(declare-fun e!678 () Bool)

(declare-fun tp_is_empty!35 () Bool)

(declare-fun tp!188 () Bool)

(assert (=> b!2292 (= e!678 (and tp_is_empty!35 tp!188))))

(assert (=> b!2151 (= tp!166 e!678)))

(assert (= (and b!2151 ((_ is Cons!26) (toList!39 lm!258))) b!2292))

(declare-fun b_lambda!205 () Bool)

(assert (= b_lambda!167 (or b!2150 b_lambda!205)))

(declare-fun bs!94 () Bool)

(declare-fun d!417 () Bool)

(assert (= bs!94 (and d!417 b!2150)))

(assert (=> bs!94 (= (dynLambda!24 lambda!4 (v!1075 (getValueByKey!1 (toList!39 lm!258) k0!394))) (dynLambda!23 p!318 (tuple2!43 k0!394 (v!1075 (getValueByKey!1 (toList!39 lm!258) k0!394)))))))

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

(assert (=> b!2229 d!417))

(declare-fun b_lambda!207 () Bool)

(assert (= b_lambda!165 (or b!2150 b_lambda!207)))

(declare-fun bs!95 () Bool)

(declare-fun d!419 () Bool)

(assert (= bs!95 (and d!419 b!2150)))

(assert (=> bs!95 (= (dynLambda!24 lambda!4 (v!1075 (getValueByKey!1 (toList!39 lt!347) k0!394))) (dynLambda!23 p!318 (tuple2!43 k0!394 (v!1075 (getValueByKey!1 (toList!39 lt!347) k0!394)))))))

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

(assert (=> b!2224 d!419))

(declare-fun b_lambda!209 () Bool)

(assert (= b_lambda!179 (or (and start!298 b_free!43) b_lambda!209)))

(declare-fun b_lambda!211 () Bool)

(assert (= b_lambda!163 (or (and start!298 b_free!43) b_lambda!211)))

(check-sat (not b_lambda!207) (not b!2274) (not d!411) (not b_lambda!209) (not b!2257) (not b_lambda!211) (not b!2209) (not b_lambda!215) (not b!2292) (not d!405) (not b_next!43) (not d!379) (not b_lambda!213) tp_is_empty!35 b_and!149 (not b_lambda!205) (not d!361) (not b!2277))
(check-sat b_and!149 (not b_next!43))
(get-model)

(declare-fun b_lambda!217 () Bool)

(assert (= b_lambda!213 (or (and start!298 b_free!43) b_lambda!217)))

(declare-fun b_lambda!219 () Bool)

(assert (= b_lambda!215 (or (and start!298 b_free!43) b_lambda!219)))

(check-sat (not b_lambda!207) (not b!2274) (not d!411) (not b!2257) (not b_lambda!211) (not b!2209) (not d!379) (not b!2292) (not b_lambda!217) (not b_lambda!209) (not b_lambda!219) (not d!405) (not b_next!43) tp_is_empty!35 b_and!149 (not b_lambda!205) (not d!361) (not b!2277))
(check-sat b_and!149 (not b_next!43))
(get-model)

(declare-fun d!421 () Bool)

(assert (=> d!421 (= (isEmpty!34 (toList!39 lm!258)) ((_ is Nil!27) (toList!39 lm!258)))))

(assert (=> d!411 d!421))

(declare-fun d!423 () Bool)

(declare-fun res!4662 () Bool)

(declare-fun e!679 () Bool)

(assert (=> d!423 (=> res!4662 e!679)))

(assert (=> d!423 (= res!4662 (not ((_ is Some!6) (getValueByKey!1 (toList!39 lt!347) k0!394))))))

(assert (=> d!423 (= (forall!24 (getValueByKey!1 (toList!39 lt!347) k0!394) lambda!23) e!679)))

(declare-fun b!2293 () Bool)

(assert (=> b!2293 (= e!679 (dynLambda!24 lambda!23 (v!1075 (getValueByKey!1 (toList!39 lt!347) k0!394))))))

(assert (= (and d!423 (not res!4662)) b!2293))

(declare-fun b_lambda!229 () Bool)

(assert (=> (not b_lambda!229) (not b!2293)))

(declare-fun m!939 () Bool)

(assert (=> b!2293 m!939))

(assert (=> d!379 d!423))

(assert (=> d!379 d!371))

(declare-fun bs!96 () Bool)

(declare-fun d!427 () Bool)

(assert (= bs!96 (and d!427 b!2150)))

(declare-fun lambda!28 () Int)

(assert (=> bs!96 (= lambda!28 lambda!4)))

(declare-fun bs!97 () Bool)

(assert (= bs!97 (and d!427 d!379)))

(assert (=> bs!97 (= lambda!28 lambda!23)))

(assert (=> d!427 true))

(assert (=> d!427 true))

(assert (=> d!427 (< (dynLambda!15 order!1 p!318) (dynLambda!16 order!3 lambda!28))))

(assert (=> d!427 (forall!24 (getValueByKey!1 (toList!39 lt!347) k0!394) lambda!28)))

(assert (=> d!427 true))

(declare-fun _$38!25 () Unit!13)

(assert (=> d!427 (= (choose!132 lt!347 p!318 k0!394) _$38!25)))

(declare-fun bs!98 () Bool)

(assert (= bs!98 d!427))

(assert (=> bs!98 m!783))

(assert (=> bs!98 m!783))

(declare-fun m!945 () Bool)

(assert (=> bs!98 m!945))

(assert (=> d!379 d!427))

(assert (=> d!379 d!357))

(declare-fun d!439 () Bool)

(declare-fun res!4678 () Bool)

(declare-fun e!695 () Bool)

(assert (=> d!439 (=> res!4678 e!695)))

(assert (=> d!439 (= res!4678 (or ((_ is Nil!27) (toList!39 lm!258)) ((_ is Nil!27) (t!2103 (toList!39 lm!258)))))))

(assert (=> d!439 (= (isStrictlySorted!15 (toList!39 lm!258)) e!695)))

(declare-fun b!2309 () Bool)

(declare-fun e!696 () Bool)

(assert (=> b!2309 (= e!695 e!696)))

(declare-fun res!4679 () Bool)

(assert (=> b!2309 (=> (not res!4679) (not e!696))))

(assert (=> b!2309 (= res!4679 (bvslt (_1!21 (h!592 (toList!39 lm!258))) (_1!21 (h!592 (t!2103 (toList!39 lm!258))))))))

(declare-fun b!2310 () Bool)

(assert (=> b!2310 (= e!696 (isStrictlySorted!15 (t!2103 (toList!39 lm!258))))))

(assert (= (and d!439 (not res!4678)) b!2309))

(assert (= (and b!2309 res!4679) b!2310))

(declare-fun m!951 () Bool)

(assert (=> b!2310 m!951))

(assert (=> d!405 d!439))

(declare-fun d!443 () Bool)

(declare-fun res!4684 () Bool)

(declare-fun e!701 () Bool)

(assert (=> d!443 (=> res!4684 e!701)))

(assert (=> d!443 (= res!4684 ((_ is Nil!27) (t!2103 (toList!39 lm!258))))))

(assert (=> d!443 (= (forall!23 (t!2103 (toList!39 lm!258)) p!318) e!701)))

(declare-fun b!2315 () Bool)

(declare-fun e!702 () Bool)

(assert (=> b!2315 (= e!701 e!702)))

(declare-fun res!4685 () Bool)

(assert (=> b!2315 (=> (not res!4685) (not e!702))))

(assert (=> b!2315 (= res!4685 (dynLambda!23 p!318 (h!592 (t!2103 (toList!39 lm!258)))))))

(declare-fun b!2316 () Bool)

(assert (=> b!2316 (= e!702 (forall!23 (t!2103 (t!2103 (toList!39 lm!258))) p!318))))

(assert (= (and d!443 (not res!4684)) b!2315))

(assert (= (and b!2315 res!4685) b!2316))

(declare-fun b_lambda!237 () Bool)

(assert (=> (not b_lambda!237) (not b!2315)))

(declare-fun t!2133 () Bool)

(declare-fun tb!99 () Bool)

(assert (=> (and start!298 (= p!318 p!318) t!2133) tb!99))

(declare-fun result!135 () Bool)

(assert (=> tb!99 (= result!135 true)))

(assert (=> b!2315 t!2133))

(declare-fun b_and!153 () Bool)

(assert (= b_and!149 (and (=> t!2133 result!135) b_and!153)))

(declare-fun m!959 () Bool)

(assert (=> b!2315 m!959))

(declare-fun m!961 () Bool)

(assert (=> b!2316 m!961))

(assert (=> b!2277 d!443))

(declare-fun b!2321 () Bool)

(declare-fun e!706 () Option!7)

(declare-fun e!707 () Option!7)

(assert (=> b!2321 (= e!706 e!707)))

(declare-fun c!139 () Bool)

(assert (=> b!2321 (= c!139 (and ((_ is Cons!26) (t!2103 (toList!39 lm!258))) (not (= (_1!21 (h!592 (t!2103 (toList!39 lm!258)))) k0!394))))))

(declare-fun d!451 () Bool)

(declare-fun c!138 () Bool)

(assert (=> d!451 (= c!138 (and ((_ is Cons!26) (t!2103 (toList!39 lm!258))) (= (_1!21 (h!592 (t!2103 (toList!39 lm!258)))) k0!394)))))

(assert (=> d!451 (= (getValueByKey!1 (t!2103 (toList!39 lm!258)) k0!394) e!706)))

(declare-fun b!2323 () Bool)

(assert (=> b!2323 (= e!707 None!5)))

(declare-fun b!2320 () Bool)

(assert (=> b!2320 (= e!706 (Some!6 (_2!21 (h!592 (t!2103 (toList!39 lm!258))))))))

(declare-fun b!2322 () Bool)

(assert (=> b!2322 (= e!707 (getValueByKey!1 (t!2103 (t!2103 (toList!39 lm!258))) k0!394))))

(assert (= (and d!451 c!138) b!2320))

(assert (= (and d!451 (not c!138)) b!2321))

(assert (= (and b!2321 c!139) b!2322))

(assert (= (and b!2321 (not c!139)) b!2323))

(declare-fun m!967 () Bool)

(assert (=> b!2322 m!967))

(assert (=> b!2274 d!451))

(declare-fun d!455 () Bool)

(declare-fun res!4691 () Bool)

(declare-fun e!710 () Bool)

(assert (=> d!455 (=> res!4691 e!710)))

(assert (=> d!455 (= res!4691 ((_ is Nil!27) (t!2103 (toList!39 lt!347))))))

(assert (=> d!455 (= (forall!23 (t!2103 (toList!39 lt!347)) p!318) e!710)))

(declare-fun b!2326 () Bool)

(declare-fun e!711 () Bool)

(assert (=> b!2326 (= e!710 e!711)))

(declare-fun res!4692 () Bool)

(assert (=> b!2326 (=> (not res!4692) (not e!711))))

(assert (=> b!2326 (= res!4692 (dynLambda!23 p!318 (h!592 (t!2103 (toList!39 lt!347)))))))

(declare-fun b!2327 () Bool)

(assert (=> b!2327 (= e!711 (forall!23 (t!2103 (t!2103 (toList!39 lt!347))) p!318))))

(assert (= (and d!455 (not res!4691)) b!2326))

(assert (= (and b!2326 res!4692) b!2327))

(declare-fun b_lambda!243 () Bool)

(assert (=> (not b_lambda!243) (not b!2326)))

(declare-fun t!2139 () Bool)

(declare-fun tb!105 () Bool)

(assert (=> (and start!298 (= p!318 p!318) t!2139) tb!105))

(declare-fun result!141 () Bool)

(assert (=> tb!105 (= result!141 true)))

(assert (=> b!2326 t!2139))

(declare-fun b_and!159 () Bool)

(assert (= b_and!153 (and (=> t!2139 result!141) b_and!159)))

(declare-fun m!973 () Bool)

(assert (=> b!2326 m!973))

(declare-fun m!975 () Bool)

(assert (=> b!2327 m!975))

(assert (=> b!2209 d!455))

(declare-fun b!2333 () Bool)

(declare-fun e!714 () Option!7)

(declare-fun e!715 () Option!7)

(assert (=> b!2333 (= e!714 e!715)))

(declare-fun c!143 () Bool)

(assert (=> b!2333 (= c!143 (and ((_ is Cons!26) (t!2103 (toList!39 lt!347))) (not (= (_1!21 (h!592 (t!2103 (toList!39 lt!347)))) k0!394))))))

(declare-fun d!459 () Bool)

(declare-fun c!142 () Bool)

(assert (=> d!459 (= c!142 (and ((_ is Cons!26) (t!2103 (toList!39 lt!347))) (= (_1!21 (h!592 (t!2103 (toList!39 lt!347)))) k0!394)))))

(assert (=> d!459 (= (getValueByKey!1 (t!2103 (toList!39 lt!347)) k0!394) e!714)))

(declare-fun b!2335 () Bool)

(assert (=> b!2335 (= e!715 None!5)))

(declare-fun b!2332 () Bool)

(assert (=> b!2332 (= e!714 (Some!6 (_2!21 (h!592 (t!2103 (toList!39 lt!347))))))))

(declare-fun b!2334 () Bool)

(assert (=> b!2334 (= e!715 (getValueByKey!1 (t!2103 (t!2103 (toList!39 lt!347))) k0!394))))

(assert (= (and d!459 c!142) b!2332))

(assert (= (and d!459 (not c!142)) b!2333))

(assert (= (and b!2333 c!143) b!2334))

(assert (= (and b!2333 (not c!143)) b!2335))

(declare-fun m!979 () Bool)

(assert (=> b!2334 m!979))

(assert (=> b!2257 d!459))

(declare-fun d!463 () Bool)

(assert (=> d!463 (= (tail!47 (toList!39 lm!258)) (t!2103 (toList!39 lm!258)))))

(assert (=> d!361 d!463))

(declare-fun b!2341 () Bool)

(declare-fun e!719 () Bool)

(declare-fun tp!190 () Bool)

(assert (=> b!2341 (= e!719 (and tp_is_empty!35 tp!190))))

(assert (=> b!2292 (= tp!188 e!719)))

(assert (= (and b!2292 ((_ is Cons!26) (t!2103 (toList!39 lm!258)))) b!2341))

(declare-fun b_lambda!253 () Bool)

(assert (= b_lambda!237 (or (and start!298 b_free!43) b_lambda!253)))

(declare-fun b_lambda!255 () Bool)

(assert (= b_lambda!243 (or (and start!298 b_free!43) b_lambda!255)))

(declare-fun b_lambda!257 () Bool)

(assert (= b_lambda!229 (or d!379 b_lambda!257)))

(declare-fun bs!105 () Bool)

(declare-fun d!467 () Bool)

(assert (= bs!105 (and d!467 d!379)))

(assert (=> bs!105 (= (dynLambda!24 lambda!23 (v!1075 (getValueByKey!1 (toList!39 lt!347) k0!394))) (dynLambda!23 p!318 (tuple2!43 k0!394 (v!1075 (getValueByKey!1 (toList!39 lt!347) k0!394)))))))

(declare-fun b_lambda!259 () Bool)

(assert (=> (not b_lambda!259) (not bs!105)))

(assert (=> bs!105 t!2129))

(declare-fun b_and!163 () Bool)

(assert (= b_and!159 (and (=> t!2129 result!131) b_and!163)))

(assert (=> bs!105 m!937))

(assert (=> b!2293 d!467))

(check-sat (not b_lambda!253) (not b_lambda!207) (not b!2327) (not b!2310) (not d!427) (not b_lambda!211) (not b_lambda!259) (not b!2322) b_and!163 (not b_lambda!255) (not b_lambda!217) (not b!2316) (not b_lambda!209) (not b_lambda!219) (not b_next!43) (not b_lambda!257) (not b!2334) (not b!2341) tp_is_empty!35 (not b_lambda!205))
(check-sat b_and!163 (not b_next!43))
