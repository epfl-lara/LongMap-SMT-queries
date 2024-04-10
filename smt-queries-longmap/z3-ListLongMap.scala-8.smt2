; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!300 () Bool)

(assert start!300)

(declare-fun b_free!45 () Bool)

(declare-fun b_next!45 () Bool)

(assert (=> start!300 (= b_free!45 (not b_next!45))))

(declare-fun tp!173 () Bool)

(declare-fun b_and!123 () Bool)

(assert (=> start!300 (= tp!173 b_and!123)))

(declare-fun b!2166 () Bool)

(assert (=> b!2166 true))

(assert (=> b!2166 true))

(declare-fun order!5 () Int)

(declare-fun p!318 () Int)

(declare-fun lambda!9 () Int)

(declare-fun order!7 () Int)

(declare-fun dynLambda!17 (Int Int) Int)

(declare-fun dynLambda!18 (Int Int) Int)

(assert (=> b!2166 (< (dynLambda!17 order!5 p!318) (dynLambda!18 order!7 lambda!9))))

(declare-datatypes ((B!280 0))(
  ( (B!281 (val!22 Int)) )
))
(declare-datatypes ((tuple2!44 0))(
  ( (tuple2!45 (_1!22 (_ BitVec 64)) (_2!22 B!280)) )
))
(declare-datatypes ((List!31 0))(
  ( (Nil!28) (Cons!27 (h!593 tuple2!44) (t!2104 List!31)) )
))
(declare-datatypes ((ListLongMap!49 0))(
  ( (ListLongMap!50 (toList!40 List!31)) )
))
(declare-fun lm!258 () ListLongMap!49)

(declare-fun e!600 () Bool)

(declare-fun k0!394 () (_ BitVec 64))

(declare-datatypes ((Option!8 0))(
  ( (Some!7 (v!1080 B!280)) (None!6) )
))
(declare-fun forall!25 (Option!8 Int) Bool)

(declare-fun getValueByKey!2 (List!31 (_ BitVec 64)) Option!8)

(assert (=> b!2166 (= e!600 (not (forall!25 (getValueByKey!2 (toList!40 lm!258) k0!394) lambda!9)))))

(declare-fun lt!353 () ListLongMap!49)

(assert (=> b!2166 (forall!25 (getValueByKey!2 (toList!40 lt!353) k0!394) lambda!9)))

(declare-datatypes ((Unit!15 0))(
  ( (Unit!16) )
))
(declare-fun lt!352 () Unit!15)

(declare-fun getForall!3 (ListLongMap!49 Int (_ BitVec 64)) Unit!15)

(assert (=> b!2166 (= lt!352 (getForall!3 lt!353 p!318 k0!394))))

(declare-fun res!4611 () Bool)

(declare-fun e!598 () Bool)

(assert (=> start!300 (=> (not res!4611) (not e!598))))

(declare-fun forall!26 (List!31 Int) Bool)

(assert (=> start!300 (= res!4611 (forall!26 (toList!40 lm!258) p!318))))

(assert (=> start!300 e!598))

(declare-fun e!599 () Bool)

(declare-fun inv!72 (ListLongMap!49) Bool)

(assert (=> start!300 (and (inv!72 lm!258) e!599)))

(assert (=> start!300 tp!173))

(assert (=> start!300 true))

(declare-fun b!2167 () Bool)

(assert (=> b!2167 (= e!598 e!600)))

(declare-fun res!4613 () Bool)

(assert (=> b!2167 (=> (not res!4613) (not e!600))))

(assert (=> b!2167 (= res!4613 (forall!26 (toList!40 lt!353) p!318))))

(declare-fun tail!45 (ListLongMap!49) ListLongMap!49)

(assert (=> b!2167 (= lt!353 (tail!45 lm!258))))

(declare-fun b!2168 () Bool)

(declare-fun res!4610 () Bool)

(assert (=> b!2168 (=> (not res!4610) (not e!598))))

(declare-fun head!753 (List!31) tuple2!44)

(assert (=> b!2168 (= res!4610 (not (= (_1!22 (head!753 (toList!40 lm!258))) k0!394)))))

(declare-fun b!2169 () Bool)

(declare-fun tp!172 () Bool)

(assert (=> b!2169 (= e!599 tp!172)))

(declare-fun b!2170 () Bool)

(declare-fun res!4612 () Bool)

(assert (=> b!2170 (=> (not res!4612) (not e!598))))

(declare-fun isEmpty!32 (ListLongMap!49) Bool)

(assert (=> b!2170 (= res!4612 (not (isEmpty!32 lm!258)))))

(assert (= (and start!300 res!4611) b!2170))

(assert (= (and b!2170 res!4612) b!2168))

(assert (= (and b!2168 res!4610) b!2167))

(assert (= (and b!2167 res!4613) b!2166))

(assert (= start!300 b!2169))

(declare-fun m!805 () Bool)

(assert (=> b!2168 m!805))

(declare-fun m!807 () Bool)

(assert (=> b!2170 m!807))

(declare-fun m!809 () Bool)

(assert (=> b!2167 m!809))

(declare-fun m!811 () Bool)

(assert (=> b!2167 m!811))

(declare-fun m!813 () Bool)

(assert (=> b!2166 m!813))

(declare-fun m!815 () Bool)

(assert (=> b!2166 m!815))

(declare-fun m!817 () Bool)

(assert (=> b!2166 m!817))

(assert (=> b!2166 m!813))

(declare-fun m!819 () Bool)

(assert (=> b!2166 m!819))

(assert (=> b!2166 m!817))

(declare-fun m!821 () Bool)

(assert (=> b!2166 m!821))

(declare-fun m!823 () Bool)

(assert (=> start!300 m!823))

(declare-fun m!825 () Bool)

(assert (=> start!300 m!825))

(check-sat (not b!2168) (not b!2169) (not b!2167) (not b!2170) (not b!2166) b_and!123 (not start!300) (not b_next!45))
(check-sat b_and!123 (not b_next!45))
(get-model)

(declare-fun bs!78 () Bool)

(declare-fun d!357 () Bool)

(assert (= bs!78 (and d!357 b!2166)))

(declare-fun lambda!17 () Int)

(assert (=> bs!78 (= lambda!17 lambda!9)))

(assert (=> d!357 true))

(assert (=> d!357 true))

(assert (=> d!357 (< (dynLambda!17 order!5 p!318) (dynLambda!18 order!7 lambda!17))))

(assert (=> d!357 (forall!25 (getValueByKey!2 (toList!40 lt!353) k0!394) lambda!17)))

(declare-fun lt!362 () Unit!15)

(declare-fun choose!132 (ListLongMap!49 Int (_ BitVec 64)) Unit!15)

(assert (=> d!357 (= lt!362 (choose!132 lt!353 p!318 k0!394))))

(assert (=> d!357 (forall!26 (toList!40 lt!353) p!318)))

(assert (=> d!357 (= (getForall!3 lt!353 p!318 k0!394) lt!362)))

(declare-fun bs!80 () Bool)

(assert (= bs!80 d!357))

(assert (=> bs!80 m!813))

(assert (=> bs!80 m!813))

(declare-fun m!873 () Bool)

(assert (=> bs!80 m!873))

(declare-fun m!877 () Bool)

(assert (=> bs!80 m!877))

(assert (=> bs!80 m!809))

(assert (=> b!2166 d!357))

(declare-fun d!373 () Bool)

(declare-fun res!4649 () Bool)

(declare-fun e!647 () Bool)

(assert (=> d!373 (=> res!4649 e!647)))

(get-info :version)

(assert (=> d!373 (= res!4649 (not ((_ is Some!7) (getValueByKey!2 (toList!40 lm!258) k0!394))))))

(assert (=> d!373 (= (forall!25 (getValueByKey!2 (toList!40 lm!258) k0!394) lambda!9) e!647)))

(declare-fun b!2245 () Bool)

(declare-fun dynLambda!25 (Int B!280) Bool)

(assert (=> b!2245 (= e!647 (dynLambda!25 lambda!9 (v!1080 (getValueByKey!2 (toList!40 lm!258) k0!394))))))

(assert (= (and d!373 (not res!4649)) b!2245))

(declare-fun b_lambda!169 () Bool)

(assert (=> (not b_lambda!169) (not b!2245)))

(declare-fun m!889 () Bool)

(assert (=> b!2245 m!889))

(assert (=> b!2166 d!373))

(declare-fun d!383 () Bool)

(declare-fun res!4650 () Bool)

(declare-fun e!648 () Bool)

(assert (=> d!383 (=> res!4650 e!648)))

(assert (=> d!383 (= res!4650 (not ((_ is Some!7) (getValueByKey!2 (toList!40 lt!353) k0!394))))))

(assert (=> d!383 (= (forall!25 (getValueByKey!2 (toList!40 lt!353) k0!394) lambda!9) e!648)))

(declare-fun b!2246 () Bool)

(assert (=> b!2246 (= e!648 (dynLambda!25 lambda!9 (v!1080 (getValueByKey!2 (toList!40 lt!353) k0!394))))))

(assert (= (and d!383 (not res!4650)) b!2246))

(declare-fun b_lambda!171 () Bool)

(assert (=> (not b_lambda!171) (not b!2246)))

(declare-fun m!893 () Bool)

(assert (=> b!2246 m!893))

(assert (=> b!2166 d!383))

(declare-fun b!2262 () Bool)

(declare-fun e!657 () Option!8)

(assert (=> b!2262 (= e!657 (getValueByKey!2 (t!2104 (toList!40 lt!353)) k0!394))))

(declare-fun d!385 () Bool)

(declare-fun c!132 () Bool)

(assert (=> d!385 (= c!132 (and ((_ is Cons!27) (toList!40 lt!353)) (= (_1!22 (h!593 (toList!40 lt!353))) k0!394)))))

(declare-fun e!656 () Option!8)

(assert (=> d!385 (= (getValueByKey!2 (toList!40 lt!353) k0!394) e!656)))

(declare-fun b!2263 () Bool)

(assert (=> b!2263 (= e!657 None!6)))

(declare-fun b!2261 () Bool)

(assert (=> b!2261 (= e!656 e!657)))

(declare-fun c!133 () Bool)

(assert (=> b!2261 (= c!133 (and ((_ is Cons!27) (toList!40 lt!353)) (not (= (_1!22 (h!593 (toList!40 lt!353))) k0!394))))))

(declare-fun b!2260 () Bool)

(assert (=> b!2260 (= e!656 (Some!7 (_2!22 (h!593 (toList!40 lt!353)))))))

(assert (= (and d!385 c!132) b!2260))

(assert (= (and d!385 (not c!132)) b!2261))

(assert (= (and b!2261 c!133) b!2262))

(assert (= (and b!2261 (not c!133)) b!2263))

(declare-fun m!899 () Bool)

(assert (=> b!2262 m!899))

(assert (=> b!2166 d!385))

(declare-fun b!2266 () Bool)

(declare-fun e!659 () Option!8)

(assert (=> b!2266 (= e!659 (getValueByKey!2 (t!2104 (toList!40 lm!258)) k0!394))))

(declare-fun d!391 () Bool)

(declare-fun c!134 () Bool)

(assert (=> d!391 (= c!134 (and ((_ is Cons!27) (toList!40 lm!258)) (= (_1!22 (h!593 (toList!40 lm!258))) k0!394)))))

(declare-fun e!658 () Option!8)

(assert (=> d!391 (= (getValueByKey!2 (toList!40 lm!258) k0!394) e!658)))

(declare-fun b!2267 () Bool)

(assert (=> b!2267 (= e!659 None!6)))

(declare-fun b!2265 () Bool)

(assert (=> b!2265 (= e!658 e!659)))

(declare-fun c!135 () Bool)

(assert (=> b!2265 (= c!135 (and ((_ is Cons!27) (toList!40 lm!258)) (not (= (_1!22 (h!593 (toList!40 lm!258))) k0!394))))))

(declare-fun b!2264 () Bool)

(assert (=> b!2264 (= e!658 (Some!7 (_2!22 (h!593 (toList!40 lm!258)))))))

(assert (= (and d!391 c!134) b!2264))

(assert (= (and d!391 (not c!134)) b!2265))

(assert (= (and b!2265 c!135) b!2266))

(assert (= (and b!2265 (not c!135)) b!2267))

(declare-fun m!903 () Bool)

(assert (=> b!2266 m!903))

(assert (=> b!2166 d!391))

(declare-fun d!393 () Bool)

(declare-fun res!4658 () Bool)

(declare-fun e!669 () Bool)

(assert (=> d!393 (=> res!4658 e!669)))

(assert (=> d!393 (= res!4658 ((_ is Nil!28) (toList!40 lt!353)))))

(assert (=> d!393 (= (forall!26 (toList!40 lt!353) p!318) e!669)))

(declare-fun b!2279 () Bool)

(declare-fun e!670 () Bool)

(assert (=> b!2279 (= e!669 e!670)))

(declare-fun res!4659 () Bool)

(assert (=> b!2279 (=> (not res!4659) (not e!670))))

(declare-fun dynLambda!26 (Int tuple2!44) Bool)

(assert (=> b!2279 (= res!4659 (dynLambda!26 p!318 (h!593 (toList!40 lt!353))))))

(declare-fun b!2280 () Bool)

(assert (=> b!2280 (= e!670 (forall!26 (t!2104 (toList!40 lt!353)) p!318))))

(assert (= (and d!393 (not res!4658)) b!2279))

(assert (= (and b!2279 res!4659) b!2280))

(declare-fun b_lambda!189 () Bool)

(assert (=> (not b_lambda!189) (not b!2279)))

(declare-fun t!2119 () Bool)

(declare-fun tb!85 () Bool)

(assert (=> (and start!300 (= p!318 p!318) t!2119) tb!85))

(declare-fun result!117 () Bool)

(assert (=> tb!85 (= result!117 true)))

(assert (=> b!2279 t!2119))

(declare-fun b_and!139 () Bool)

(assert (= b_and!123 (and (=> t!2119 result!117) b_and!139)))

(declare-fun m!915 () Bool)

(assert (=> b!2279 m!915))

(declare-fun m!917 () Bool)

(assert (=> b!2280 m!917))

(assert (=> b!2167 d!393))

(declare-fun d!403 () Bool)

(declare-fun tail!49 (List!31) List!31)

(assert (=> d!403 (= (tail!45 lm!258) (ListLongMap!50 (tail!49 (toList!40 lm!258))))))

(declare-fun bs!89 () Bool)

(assert (= bs!89 d!403))

(declare-fun m!921 () Bool)

(assert (=> bs!89 m!921))

(assert (=> b!2167 d!403))

(declare-fun d!405 () Bool)

(declare-fun res!4660 () Bool)

(declare-fun e!674 () Bool)

(assert (=> d!405 (=> res!4660 e!674)))

(assert (=> d!405 (= res!4660 ((_ is Nil!28) (toList!40 lm!258)))))

(assert (=> d!405 (= (forall!26 (toList!40 lm!258) p!318) e!674)))

(declare-fun b!2286 () Bool)

(declare-fun e!675 () Bool)

(assert (=> b!2286 (= e!674 e!675)))

(declare-fun res!4661 () Bool)

(assert (=> b!2286 (=> (not res!4661) (not e!675))))

(assert (=> b!2286 (= res!4661 (dynLambda!26 p!318 (h!593 (toList!40 lm!258))))))

(declare-fun b!2287 () Bool)

(assert (=> b!2287 (= e!675 (forall!26 (t!2104 (toList!40 lm!258)) p!318))))

(assert (= (and d!405 (not res!4660)) b!2286))

(assert (= (and b!2286 res!4661) b!2287))

(declare-fun b_lambda!201 () Bool)

(assert (=> (not b_lambda!201) (not b!2286)))

(declare-fun t!2123 () Bool)

(declare-fun tb!89 () Bool)

(assert (=> (and start!300 (= p!318 p!318) t!2123) tb!89))

(declare-fun result!123 () Bool)

(assert (=> tb!89 (= result!123 true)))

(assert (=> b!2286 t!2123))

(declare-fun b_and!143 () Bool)

(assert (= b_and!139 (and (=> t!2123 result!123) b_and!143)))

(declare-fun m!925 () Bool)

(assert (=> b!2286 m!925))

(declare-fun m!927 () Bool)

(assert (=> b!2287 m!927))

(assert (=> start!300 d!405))

(declare-fun d!411 () Bool)

(declare-fun isStrictlySorted!15 (List!31) Bool)

(assert (=> d!411 (= (inv!72 lm!258) (isStrictlySorted!15 (toList!40 lm!258)))))

(declare-fun bs!92 () Bool)

(assert (= bs!92 d!411))

(declare-fun m!931 () Bool)

(assert (=> bs!92 m!931))

(assert (=> start!300 d!411))

(declare-fun d!413 () Bool)

(assert (=> d!413 (= (head!753 (toList!40 lm!258)) (h!593 (toList!40 lm!258)))))

(assert (=> b!2168 d!413))

(declare-fun d!415 () Bool)

(declare-fun isEmpty!36 (List!31) Bool)

(assert (=> d!415 (= (isEmpty!32 lm!258) (isEmpty!36 (toList!40 lm!258)))))

(declare-fun bs!93 () Bool)

(assert (= bs!93 d!415))

(declare-fun m!933 () Bool)

(assert (=> bs!93 m!933))

(assert (=> b!2170 d!415))

(declare-fun b!2292 () Bool)

(declare-fun e!678 () Bool)

(declare-fun tp_is_empty!35 () Bool)

(declare-fun tp!188 () Bool)

(assert (=> b!2292 (= e!678 (and tp_is_empty!35 tp!188))))

(assert (=> b!2169 (= tp!172 e!678)))

(assert (= (and b!2169 ((_ is Cons!27) (toList!40 lm!258))) b!2292))

(declare-fun b_lambda!205 () Bool)

(assert (= b_lambda!189 (or (and start!300 b_free!45) b_lambda!205)))

(declare-fun b_lambda!207 () Bool)

(assert (= b_lambda!201 (or (and start!300 b_free!45) b_lambda!207)))

(declare-fun b_lambda!209 () Bool)

(assert (= b_lambda!169 (or b!2166 b_lambda!209)))

(declare-fun bs!94 () Bool)

(declare-fun d!417 () Bool)

(assert (= bs!94 (and d!417 b!2166)))

(assert (=> bs!94 (= (dynLambda!25 lambda!9 (v!1080 (getValueByKey!2 (toList!40 lm!258) k0!394))) (dynLambda!26 p!318 (tuple2!45 k0!394 (v!1080 (getValueByKey!2 (toList!40 lm!258) k0!394)))))))

(declare-fun b_lambda!213 () Bool)

(assert (=> (not b_lambda!213) (not bs!94)))

(declare-fun t!2127 () Bool)

(declare-fun tb!93 () Bool)

(assert (=> (and start!300 (= p!318 p!318) t!2127) tb!93))

(declare-fun result!129 () Bool)

(assert (=> tb!93 (= result!129 true)))

(assert (=> bs!94 t!2127))

(declare-fun b_and!147 () Bool)

(assert (= b_and!143 (and (=> t!2127 result!129) b_and!147)))

(declare-fun m!935 () Bool)

(assert (=> bs!94 m!935))

(assert (=> b!2245 d!417))

(declare-fun b_lambda!211 () Bool)

(assert (= b_lambda!171 (or b!2166 b_lambda!211)))

(declare-fun bs!95 () Bool)

(declare-fun d!419 () Bool)

(assert (= bs!95 (and d!419 b!2166)))

(assert (=> bs!95 (= (dynLambda!25 lambda!9 (v!1080 (getValueByKey!2 (toList!40 lt!353) k0!394))) (dynLambda!26 p!318 (tuple2!45 k0!394 (v!1080 (getValueByKey!2 (toList!40 lt!353) k0!394)))))))

(declare-fun b_lambda!215 () Bool)

(assert (=> (not b_lambda!215) (not bs!95)))

(declare-fun t!2129 () Bool)

(declare-fun tb!95 () Bool)

(assert (=> (and start!300 (= p!318 p!318) t!2129) tb!95))

(declare-fun result!131 () Bool)

(assert (=> tb!95 (= result!131 true)))

(assert (=> bs!95 t!2129))

(declare-fun b_and!149 () Bool)

(assert (= b_and!147 (and (=> t!2129 result!131) b_and!149)))

(declare-fun m!937 () Bool)

(assert (=> bs!95 m!937))

(assert (=> b!2246 d!419))

(check-sat (not b_lambda!207) (not b!2262) (not b!2266) (not b!2292) (not b_next!45) (not b_lambda!209) (not d!357) tp_is_empty!35 (not b_lambda!215) (not d!403) (not d!411) (not b_lambda!213) b_and!149 (not b!2280) (not b_lambda!205) (not b_lambda!211) (not b!2287) (not d!415))
(check-sat b_and!149 (not b_next!45))
(get-model)

(declare-fun b_lambda!225 () Bool)

(assert (= b_lambda!215 (or (and start!300 b_free!45) b_lambda!225)))

(declare-fun b_lambda!227 () Bool)

(assert (= b_lambda!213 (or (and start!300 b_free!45) b_lambda!227)))

(check-sat (not b_lambda!207) (not b!2262) (not b!2292) (not b_next!45) (not b_lambda!209) (not d!357) tp_is_empty!35 (not d!403) (not d!411) (not b_lambda!225) (not b_lambda!227) (not b!2266) b_and!149 (not b!2280) (not b_lambda!205) (not b_lambda!211) (not b!2287) (not d!415))
(check-sat b_and!149 (not b_next!45))
(get-model)

(declare-fun d!455 () Bool)

(declare-fun res!4676 () Bool)

(declare-fun e!701 () Bool)

(assert (=> d!455 (=> res!4676 e!701)))

(assert (=> d!455 (= res!4676 ((_ is Nil!28) (t!2104 (toList!40 lm!258))))))

(assert (=> d!455 (= (forall!26 (t!2104 (toList!40 lm!258)) p!318) e!701)))

(declare-fun b!2323 () Bool)

(declare-fun e!702 () Bool)

(assert (=> b!2323 (= e!701 e!702)))

(declare-fun res!4677 () Bool)

(assert (=> b!2323 (=> (not res!4677) (not e!702))))

(assert (=> b!2323 (= res!4677 (dynLambda!26 p!318 (h!593 (t!2104 (toList!40 lm!258)))))))

(declare-fun b!2324 () Bool)

(assert (=> b!2324 (= e!702 (forall!26 (t!2104 (t!2104 (toList!40 lm!258))) p!318))))

(assert (= (and d!455 (not res!4676)) b!2323))

(assert (= (and b!2323 res!4677) b!2324))

(declare-fun b_lambda!239 () Bool)

(assert (=> (not b_lambda!239) (not b!2323)))

(declare-fun t!2137 () Bool)

(declare-fun tb!103 () Bool)

(assert (=> (and start!300 (= p!318 p!318) t!2137) tb!103))

(declare-fun result!139 () Bool)

(assert (=> tb!103 (= result!139 true)))

(assert (=> b!2323 t!2137))

(declare-fun b_and!157 () Bool)

(assert (= b_and!149 (and (=> t!2137 result!139) b_and!157)))

(declare-fun m!967 () Bool)

(assert (=> b!2323 m!967))

(declare-fun m!969 () Bool)

(assert (=> b!2324 m!969))

(assert (=> b!2287 d!455))

(declare-fun b!2327 () Bool)

(declare-fun e!706 () Option!8)

(assert (=> b!2327 (= e!706 (getValueByKey!2 (t!2104 (t!2104 (toList!40 lm!258))) k0!394))))

(declare-fun d!457 () Bool)

(declare-fun c!146 () Bool)

(assert (=> d!457 (= c!146 (and ((_ is Cons!27) (t!2104 (toList!40 lm!258))) (= (_1!22 (h!593 (t!2104 (toList!40 lm!258)))) k0!394)))))

(declare-fun e!703 () Option!8)

(assert (=> d!457 (= (getValueByKey!2 (t!2104 (toList!40 lm!258)) k0!394) e!703)))

(declare-fun b!2328 () Bool)

(assert (=> b!2328 (= e!706 None!6)))

(declare-fun b!2326 () Bool)

(assert (=> b!2326 (= e!703 e!706)))

(declare-fun c!147 () Bool)

(assert (=> b!2326 (= c!147 (and ((_ is Cons!27) (t!2104 (toList!40 lm!258))) (not (= (_1!22 (h!593 (t!2104 (toList!40 lm!258)))) k0!394))))))

(declare-fun b!2325 () Bool)

(assert (=> b!2325 (= e!703 (Some!7 (_2!22 (h!593 (t!2104 (toList!40 lm!258))))))))

(assert (= (and d!457 c!146) b!2325))

(assert (= (and d!457 (not c!146)) b!2326))

(assert (= (and b!2326 c!147) b!2327))

(assert (= (and b!2326 (not c!147)) b!2328))

(declare-fun m!971 () Bool)

(assert (=> b!2327 m!971))

(assert (=> b!2266 d!457))

(declare-fun d!459 () Bool)

(assert (=> d!459 (= (tail!49 (toList!40 lm!258)) (t!2104 (toList!40 lm!258)))))

(assert (=> d!403 d!459))

(declare-fun d!461 () Bool)

(declare-fun res!4684 () Bool)

(declare-fun e!711 () Bool)

(assert (=> d!461 (=> res!4684 e!711)))

(assert (=> d!461 (= res!4684 (not ((_ is Some!7) (getValueByKey!2 (toList!40 lt!353) k0!394))))))

(assert (=> d!461 (= (forall!25 (getValueByKey!2 (toList!40 lt!353) k0!394) lambda!17) e!711)))

(declare-fun b!2335 () Bool)

(assert (=> b!2335 (= e!711 (dynLambda!25 lambda!17 (v!1080 (getValueByKey!2 (toList!40 lt!353) k0!394))))))

(assert (= (and d!461 (not res!4684)) b!2335))

(declare-fun b_lambda!241 () Bool)

(assert (=> (not b_lambda!241) (not b!2335)))

(declare-fun m!975 () Bool)

(assert (=> b!2335 m!975))

(assert (=> d!357 d!461))

(assert (=> d!357 d!385))

(declare-fun bs!104 () Bool)

(declare-fun d!465 () Bool)

(assert (= bs!104 (and d!465 b!2166)))

(declare-fun lambda!32 () Int)

(assert (=> bs!104 (= lambda!32 lambda!9)))

(declare-fun bs!105 () Bool)

(assert (= bs!105 (and d!465 d!357)))

(assert (=> bs!105 (= lambda!32 lambda!17)))

(assert (=> d!465 true))

(assert (=> d!465 true))

(assert (=> d!465 (< (dynLambda!17 order!5 p!318) (dynLambda!18 order!7 lambda!32))))

(assert (=> d!465 (forall!25 (getValueByKey!2 (toList!40 lt!353) k0!394) lambda!32)))

(assert (=> d!465 true))

(declare-fun _$38!29 () Unit!15)

(assert (=> d!465 (= (choose!132 lt!353 p!318 k0!394) _$38!29)))

(declare-fun bs!106 () Bool)

(assert (= bs!106 d!465))

(assert (=> bs!106 m!813))

(assert (=> bs!106 m!813))

(declare-fun m!983 () Bool)

(assert (=> bs!106 m!983))

(assert (=> d!357 d!465))

(assert (=> d!357 d!393))

(declare-fun b!2342 () Bool)

(declare-fun e!717 () Option!8)

(assert (=> b!2342 (= e!717 (getValueByKey!2 (t!2104 (t!2104 (toList!40 lt!353))) k0!394))))

(declare-fun d!471 () Bool)

(declare-fun c!148 () Bool)

(assert (=> d!471 (= c!148 (and ((_ is Cons!27) (t!2104 (toList!40 lt!353))) (= (_1!22 (h!593 (t!2104 (toList!40 lt!353)))) k0!394)))))

(declare-fun e!716 () Option!8)

(assert (=> d!471 (= (getValueByKey!2 (t!2104 (toList!40 lt!353)) k0!394) e!716)))

(declare-fun b!2343 () Bool)

(assert (=> b!2343 (= e!717 None!6)))

(declare-fun b!2341 () Bool)

(assert (=> b!2341 (= e!716 e!717)))

(declare-fun c!149 () Bool)

(assert (=> b!2341 (= c!149 (and ((_ is Cons!27) (t!2104 (toList!40 lt!353))) (not (= (_1!22 (h!593 (t!2104 (toList!40 lt!353)))) k0!394))))))

(declare-fun b!2340 () Bool)

(assert (=> b!2340 (= e!716 (Some!7 (_2!22 (h!593 (t!2104 (toList!40 lt!353))))))))

(assert (= (and d!471 c!148) b!2340))

(assert (= (and d!471 (not c!148)) b!2341))

(assert (= (and b!2341 c!149) b!2342))

(assert (= (and b!2341 (not c!149)) b!2343))

(declare-fun m!985 () Bool)

(assert (=> b!2342 m!985))

(assert (=> b!2262 d!471))

(declare-fun d!473 () Bool)

(declare-fun res!4691 () Bool)

(declare-fun e!722 () Bool)

(assert (=> d!473 (=> res!4691 e!722)))

(assert (=> d!473 (= res!4691 (or ((_ is Nil!28) (toList!40 lm!258)) ((_ is Nil!28) (t!2104 (toList!40 lm!258)))))))

(assert (=> d!473 (= (isStrictlySorted!15 (toList!40 lm!258)) e!722)))

(declare-fun b!2348 () Bool)

(declare-fun e!723 () Bool)

(assert (=> b!2348 (= e!722 e!723)))

(declare-fun res!4692 () Bool)

(assert (=> b!2348 (=> (not res!4692) (not e!723))))

(assert (=> b!2348 (= res!4692 (bvslt (_1!22 (h!593 (toList!40 lm!258))) (_1!22 (h!593 (t!2104 (toList!40 lm!258))))))))

(declare-fun b!2349 () Bool)

(assert (=> b!2349 (= e!723 (isStrictlySorted!15 (t!2104 (toList!40 lm!258))))))

(assert (= (and d!473 (not res!4691)) b!2348))

(assert (= (and b!2348 res!4692) b!2349))

(declare-fun m!987 () Bool)

(assert (=> b!2349 m!987))

(assert (=> d!411 d!473))

(declare-fun d!475 () Bool)

(assert (=> d!475 (= (isEmpty!36 (toList!40 lm!258)) ((_ is Nil!28) (toList!40 lm!258)))))

(assert (=> d!415 d!475))

(declare-fun d!477 () Bool)

(declare-fun res!4693 () Bool)

(declare-fun e!724 () Bool)

(assert (=> d!477 (=> res!4693 e!724)))

(assert (=> d!477 (= res!4693 ((_ is Nil!28) (t!2104 (toList!40 lt!353))))))

(assert (=> d!477 (= (forall!26 (t!2104 (toList!40 lt!353)) p!318) e!724)))

(declare-fun b!2350 () Bool)

(declare-fun e!725 () Bool)

(assert (=> b!2350 (= e!724 e!725)))

(declare-fun res!4694 () Bool)

(assert (=> b!2350 (=> (not res!4694) (not e!725))))

(assert (=> b!2350 (= res!4694 (dynLambda!26 p!318 (h!593 (t!2104 (toList!40 lt!353)))))))

(declare-fun b!2351 () Bool)

(assert (=> b!2351 (= e!725 (forall!26 (t!2104 (t!2104 (toList!40 lt!353))) p!318))))

(assert (= (and d!477 (not res!4693)) b!2350))

(assert (= (and b!2350 res!4694) b!2351))

(declare-fun b_lambda!261 () Bool)

(assert (=> (not b_lambda!261) (not b!2350)))

(declare-fun t!2141 () Bool)

(declare-fun tb!107 () Bool)

(assert (=> (and start!300 (= p!318 p!318) t!2141) tb!107))

(declare-fun result!143 () Bool)

(assert (=> tb!107 (= result!143 true)))

(assert (=> b!2350 t!2141))

(declare-fun b_and!165 () Bool)

(assert (= b_and!157 (and (=> t!2141 result!143) b_and!165)))

(declare-fun m!989 () Bool)

(assert (=> b!2350 m!989))

(declare-fun m!991 () Bool)

(assert (=> b!2351 m!991))

(assert (=> b!2280 d!477))

(declare-fun b!2352 () Bool)

(declare-fun e!726 () Bool)

(declare-fun tp!191 () Bool)

(assert (=> b!2352 (= e!726 (and tp_is_empty!35 tp!191))))

(assert (=> b!2292 (= tp!188 e!726)))

(assert (= (and b!2292 ((_ is Cons!27) (t!2104 (toList!40 lm!258)))) b!2352))

(declare-fun b_lambda!263 () Bool)

(assert (= b_lambda!261 (or (and start!300 b_free!45) b_lambda!263)))

(declare-fun b_lambda!265 () Bool)

(assert (= b_lambda!241 (or d!357 b_lambda!265)))

(declare-fun bs!107 () Bool)

(declare-fun d!479 () Bool)

(assert (= bs!107 (and d!479 d!357)))

(assert (=> bs!107 (= (dynLambda!25 lambda!17 (v!1080 (getValueByKey!2 (toList!40 lt!353) k0!394))) (dynLambda!26 p!318 (tuple2!45 k0!394 (v!1080 (getValueByKey!2 (toList!40 lt!353) k0!394)))))))

(declare-fun b_lambda!269 () Bool)

(assert (=> (not b_lambda!269) (not bs!107)))

(assert (=> bs!107 t!2129))

(declare-fun b_and!167 () Bool)

(assert (= b_and!165 (and (=> t!2129 result!131) b_and!167)))

(assert (=> bs!107 m!937))

(assert (=> b!2335 d!479))

(declare-fun b_lambda!267 () Bool)

(assert (= b_lambda!239 (or (and start!300 b_free!45) b_lambda!267)))

(check-sat b_and!167 (not b_lambda!267) (not b_lambda!207) (not b_lambda!227) (not b!2352) (not b!2342) (not b_lambda!209) (not b_lambda!263) (not b!2327) (not b!2349) (not b_lambda!225) (not d!465) (not b!2324) (not b_lambda!269) (not b_next!45) (not b_lambda!205) (not b!2351) (not b_lambda!211) tp_is_empty!35 (not b_lambda!265))
(check-sat b_and!167 (not b_next!45))
