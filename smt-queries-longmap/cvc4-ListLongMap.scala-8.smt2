; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!302 () Bool)

(assert start!302)

(declare-fun b_free!47 () Bool)

(declare-fun b_next!47 () Bool)

(assert (=> start!302 (= b_free!47 (not b_next!47))))

(declare-fun tp!179 () Bool)

(declare-fun b_and!125 () Bool)

(assert (=> start!302 (= tp!179 b_and!125)))

(declare-fun b!2185 () Bool)

(assert (=> b!2185 true))

(assert (=> b!2185 true))

(declare-fun order!11 () Int)

(declare-fun order!9 () Int)

(declare-fun lambda!14 () Int)

(declare-fun p!318 () Int)

(declare-fun dynLambda!19 (Int Int) Int)

(declare-fun dynLambda!20 (Int Int) Int)

(assert (=> b!2185 (< (dynLambda!19 order!9 p!318) (dynLambda!20 order!11 lambda!14))))

(declare-fun e!608 () Bool)

(declare-datatypes ((B!282 0))(
  ( (B!283 (val!23 Int)) )
))
(declare-datatypes ((tuple2!46 0))(
  ( (tuple2!47 (_1!23 (_ BitVec 64)) (_2!23 B!282)) )
))
(declare-datatypes ((List!32 0))(
  ( (Nil!29) (Cons!28 (h!594 tuple2!46) (t!2105 List!32)) )
))
(declare-datatypes ((ListLongMap!51 0))(
  ( (ListLongMap!52 (toList!41 List!32)) )
))
(declare-fun lm!258 () ListLongMap!51)

(declare-fun k!394 () (_ BitVec 64))

(declare-datatypes ((Option!9 0))(
  ( (Some!8 (v!1085 B!282)) (None!7) )
))
(declare-fun forall!27 (Option!9 Int) Bool)

(declare-fun getValueByKey!3 (List!32 (_ BitVec 64)) Option!9)

(assert (=> b!2185 (= e!608 (not (forall!27 (getValueByKey!3 (toList!41 lm!258) k!394) lambda!14)))))

(declare-fun lt!358 () ListLongMap!51)

(assert (=> b!2185 (forall!27 (getValueByKey!3 (toList!41 lt!358) k!394) lambda!14)))

(declare-datatypes ((Unit!17 0))(
  ( (Unit!18) )
))
(declare-fun lt!359 () Unit!17)

(declare-fun getForall!4 (ListLongMap!51 Int (_ BitVec 64)) Unit!17)

(assert (=> b!2185 (= lt!359 (getForall!4 lt!358 p!318 k!394))))

(declare-fun b!2186 () Bool)

(declare-fun res!4625 () Bool)

(declare-fun e!607 () Bool)

(assert (=> b!2186 (=> (not res!4625) (not e!607))))

(declare-fun head!754 (List!32) tuple2!46)

(assert (=> b!2186 (= res!4625 (not (= (_1!23 (head!754 (toList!41 lm!258))) k!394)))))

(declare-fun b!2187 () Bool)

(assert (=> b!2187 (= e!607 e!608)))

(declare-fun res!4624 () Bool)

(assert (=> b!2187 (=> (not res!4624) (not e!608))))

(declare-fun forall!28 (List!32 Int) Bool)

(assert (=> b!2187 (= res!4624 (forall!28 (toList!41 lt!358) p!318))))

(declare-fun tail!46 (ListLongMap!51) ListLongMap!51)

(assert (=> b!2187 (= lt!358 (tail!46 lm!258))))

(declare-fun b!2188 () Bool)

(declare-fun res!4623 () Bool)

(assert (=> b!2188 (=> (not res!4623) (not e!607))))

(declare-fun isEmpty!33 (ListLongMap!51) Bool)

(assert (=> b!2188 (= res!4623 (not (isEmpty!33 lm!258)))))

(declare-fun b!2189 () Bool)

(declare-fun e!609 () Bool)

(declare-fun tp!178 () Bool)

(assert (=> b!2189 (= e!609 tp!178)))

(declare-fun res!4622 () Bool)

(assert (=> start!302 (=> (not res!4622) (not e!607))))

(assert (=> start!302 (= res!4622 (forall!28 (toList!41 lm!258) p!318))))

(assert (=> start!302 e!607))

(declare-fun inv!73 (ListLongMap!51) Bool)

(assert (=> start!302 (and (inv!73 lm!258) e!609)))

(assert (=> start!302 tp!179))

(assert (=> start!302 true))

(assert (= (and start!302 res!4622) b!2188))

(assert (= (and b!2188 res!4623) b!2186))

(assert (= (and b!2186 res!4625) b!2187))

(assert (= (and b!2187 res!4624) b!2185))

(assert (= start!302 b!2189))

(declare-fun m!827 () Bool)

(assert (=> b!2187 m!827))

(declare-fun m!829 () Bool)

(assert (=> b!2187 m!829))

(declare-fun m!831 () Bool)

(assert (=> b!2186 m!831))

(declare-fun m!833 () Bool)

(assert (=> start!302 m!833))

(declare-fun m!835 () Bool)

(assert (=> start!302 m!835))

(declare-fun m!837 () Bool)

(assert (=> b!2188 m!837))

(declare-fun m!839 () Bool)

(assert (=> b!2185 m!839))

(declare-fun m!841 () Bool)

(assert (=> b!2185 m!841))

(declare-fun m!843 () Bool)

(assert (=> b!2185 m!843))

(declare-fun m!845 () Bool)

(assert (=> b!2185 m!845))

(assert (=> b!2185 m!845))

(declare-fun m!847 () Bool)

(assert (=> b!2185 m!847))

(assert (=> b!2185 m!839))

(push 1)

(assert b_and!125)

(assert (not b!2187))

(assert (not start!302))

(assert (not b!2189))

(assert (not b!2185))

(assert (not b!2186))

(assert (not b_next!47))

(assert (not b!2188))

(check-sat)

(pop 1)

(push 1)

(assert b_and!125)

(assert (not b_next!47))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!343 () Bool)

(declare-fun res!4630 () Bool)

(declare-fun e!614 () Bool)

(assert (=> d!343 (=> res!4630 e!614)))

(assert (=> d!343 (= res!4630 (is-Nil!29 (toList!41 lm!258)))))

(assert (=> d!343 (= (forall!28 (toList!41 lm!258) p!318) e!614)))

(declare-fun b!2198 () Bool)

(declare-fun e!615 () Bool)

(assert (=> b!2198 (= e!614 e!615)))

(declare-fun res!4631 () Bool)

(assert (=> b!2198 (=> (not res!4631) (not e!615))))

(declare-fun dynLambda!21 (Int tuple2!46) Bool)

(assert (=> b!2198 (= res!4631 (dynLambda!21 p!318 (h!594 (toList!41 lm!258))))))

(declare-fun b!2199 () Bool)

(assert (=> b!2199 (= e!615 (forall!28 (t!2105 (toList!41 lm!258)) p!318))))

(assert (= (and d!343 (not res!4630)) b!2198))

(assert (= (and b!2198 res!4631) b!2199))

(declare-fun b_lambda!157 () Bool)

(assert (=> (not b_lambda!157) (not b!2198)))

(declare-fun t!2107 () Bool)

(declare-fun tb!73 () Bool)

(assert (=> (and start!302 (= p!318 p!318) t!2107) tb!73))

(declare-fun result!103 () Bool)

(assert (=> tb!73 (= result!103 true)))

(assert (=> b!2198 t!2107))

(declare-fun b_and!127 () Bool)

(assert (= b_and!125 (and (=> t!2107 result!103) b_and!127)))

(declare-fun m!851 () Bool)

(assert (=> b!2198 m!851))

(declare-fun m!853 () Bool)

(assert (=> b!2199 m!853))

(assert (=> start!302 d!343))

(declare-fun d!349 () Bool)

(declare-fun isStrictlySorted!13 (List!32) Bool)

(assert (=> d!349 (= (inv!73 lm!258) (isStrictlySorted!13 (toList!41 lm!258)))))

(declare-fun bs!76 () Bool)

(assert (= bs!76 d!349))

(declare-fun m!855 () Bool)

(assert (=> bs!76 m!855))

(assert (=> start!302 d!349))

(declare-fun d!353 () Bool)

(assert (=> d!353 (= (head!754 (toList!41 lm!258)) (h!594 (toList!41 lm!258)))))

(assert (=> b!2186 d!353))

(declare-fun b!2215 () Bool)

(declare-fun e!626 () Option!9)

(declare-fun e!627 () Option!9)

(assert (=> b!2215 (= e!626 e!627)))

(declare-fun c!119 () Bool)

(assert (=> b!2215 (= c!119 (and (is-Cons!28 (toList!41 lt!358)) (not (= (_1!23 (h!594 (toList!41 lt!358))) k!394))))))

(declare-fun b!2217 () Bool)

(assert (=> b!2217 (= e!627 None!7)))

(declare-fun b!2216 () Bool)

(assert (=> b!2216 (= e!627 (getValueByKey!3 (t!2105 (toList!41 lt!358)) k!394))))

(declare-fun b!2214 () Bool)

(assert (=> b!2214 (= e!626 (Some!8 (_2!23 (h!594 (toList!41 lt!358)))))))

(declare-fun d!355 () Bool)

(declare-fun c!118 () Bool)

(assert (=> d!355 (= c!118 (and (is-Cons!28 (toList!41 lt!358)) (= (_1!23 (h!594 (toList!41 lt!358))) k!394)))))

(assert (=> d!355 (= (getValueByKey!3 (toList!41 lt!358) k!394) e!626)))

(assert (= (and d!355 c!118) b!2214))

(assert (= (and d!355 (not c!118)) b!2215))

(assert (= (and b!2215 c!119) b!2216))

(assert (= (and b!2215 (not c!119)) b!2217))

(declare-fun m!861 () Bool)

(assert (=> b!2216 m!861))

(assert (=> b!2185 d!355))

(declare-fun d!361 () Bool)

(declare-fun res!4640 () Bool)

(declare-fun e!630 () Bool)

(assert (=> d!361 (=> res!4640 e!630)))

(assert (=> d!361 (= res!4640 (not (is-Some!8 (getValueByKey!3 (toList!41 lt!358) k!394))))))

(assert (=> d!361 (= (forall!27 (getValueByKey!3 (toList!41 lt!358) k!394) lambda!14) e!630)))

(declare-fun b!2220 () Bool)

(declare-fun dynLambda!22 (Int B!282) Bool)

(assert (=> b!2220 (= e!630 (dynLambda!22 lambda!14 (v!1085 (getValueByKey!3 (toList!41 lt!358) k!394))))))

(assert (= (and d!361 (not res!4640)) b!2220))

(declare-fun b_lambda!161 () Bool)

(assert (=> (not b_lambda!161) (not b!2220)))

(declare-fun m!865 () Bool)

(assert (=> b!2220 m!865))

(assert (=> b!2185 d!361))

(declare-fun d!365 () Bool)

(declare-fun res!4643 () Bool)

(declare-fun e!633 () Bool)

(assert (=> d!365 (=> res!4643 e!633)))

(assert (=> d!365 (= res!4643 (not (is-Some!8 (getValueByKey!3 (toList!41 lm!258) k!394))))))

(assert (=> d!365 (= (forall!27 (getValueByKey!3 (toList!41 lm!258) k!394) lambda!14) e!633)))

(declare-fun b!2223 () Bool)

(assert (=> b!2223 (= e!633 (dynLambda!22 lambda!14 (v!1085 (getValueByKey!3 (toList!41 lm!258) k!394))))))

(assert (= (and d!365 (not res!4643)) b!2223))

(declare-fun b_lambda!163 () Bool)

(assert (=> (not b_lambda!163) (not b!2223)))

(declare-fun m!867 () Bool)

(assert (=> b!2223 m!867))

(assert (=> b!2185 d!365))

(declare-fun bs!79 () Bool)

(declare-fun d!367 () Bool)

(assert (= bs!79 (and d!367 b!2185)))

(declare-fun lambda!20 () Int)

(assert (=> bs!79 (= lambda!20 lambda!14)))

(assert (=> d!367 true))

(assert (=> d!367 true))

(assert (=> d!367 (< (dynLambda!19 order!9 p!318) (dynLambda!20 order!11 lambda!20))))

(assert (=> d!367 (forall!27 (getValueByKey!3 (toList!41 lt!358) k!394) lambda!20)))

(declare-fun lt!365 () Unit!17)

(declare-fun choose!131 (ListLongMap!51 Int (_ BitVec 64)) Unit!17)

(assert (=> d!367 (= lt!365 (choose!131 lt!358 p!318 k!394))))

(assert (=> d!367 (forall!28 (toList!41 lt!358) p!318)))

(assert (=> d!367 (= (getForall!4 lt!358 p!318 k!394) lt!365)))

(declare-fun bs!81 () Bool)

(assert (= bs!81 d!367))

(assert (=> bs!81 m!845))

(assert (=> bs!81 m!845))

(declare-fun m!871 () Bool)

(assert (=> bs!81 m!871))

(declare-fun m!875 () Bool)

(assert (=> bs!81 m!875))

(assert (=> bs!81 m!827))

(assert (=> b!2185 d!367))

(declare-fun b!2234 () Bool)

(declare-fun e!639 () Option!9)

(declare-fun e!640 () Option!9)

(assert (=> b!2234 (= e!639 e!640)))

(declare-fun c!125 () Bool)

(assert (=> b!2234 (= c!125 (and (is-Cons!28 (toList!41 lm!258)) (not (= (_1!23 (h!594 (toList!41 lm!258))) k!394))))))

(declare-fun b!2236 () Bool)

(assert (=> b!2236 (= e!640 None!7)))

(declare-fun b!2235 () Bool)

(assert (=> b!2235 (= e!640 (getValueByKey!3 (t!2105 (toList!41 lm!258)) k!394))))

(declare-fun b!2233 () Bool)

(assert (=> b!2233 (= e!639 (Some!8 (_2!23 (h!594 (toList!41 lm!258)))))))

(declare-fun d!371 () Bool)

(declare-fun c!124 () Bool)

(assert (=> d!371 (= c!124 (and (is-Cons!28 (toList!41 lm!258)) (= (_1!23 (h!594 (toList!41 lm!258))) k!394)))))

(assert (=> d!371 (= (getValueByKey!3 (toList!41 lm!258) k!394) e!639)))

(assert (= (and d!371 c!124) b!2233))

(assert (= (and d!371 (not c!124)) b!2234))

(assert (= (and b!2234 c!125) b!2235))

(assert (= (and b!2234 (not c!125)) b!2236))

(declare-fun m!879 () Bool)

(assert (=> b!2235 m!879))

(assert (=> b!2185 d!371))

(declare-fun d!375 () Bool)

(declare-fun res!4645 () Bool)

(declare-fun e!641 () Bool)

(assert (=> d!375 (=> res!4645 e!641)))

(assert (=> d!375 (= res!4645 (is-Nil!29 (toList!41 lt!358)))))

(assert (=> d!375 (= (forall!28 (toList!41 lt!358) p!318) e!641)))

(declare-fun b!2237 () Bool)

(declare-fun e!642 () Bool)

(assert (=> b!2237 (= e!641 e!642)))

(declare-fun res!4646 () Bool)

(assert (=> b!2237 (=> (not res!4646) (not e!642))))

(assert (=> b!2237 (= res!4646 (dynLambda!21 p!318 (h!594 (toList!41 lt!358))))))

(declare-fun b!2238 () Bool)

(assert (=> b!2238 (= e!642 (forall!28 (t!2105 (toList!41 lt!358)) p!318))))

(assert (= (and d!375 (not res!4645)) b!2237))

(assert (= (and b!2237 res!4646) b!2238))

(declare-fun b_lambda!167 () Bool)

(assert (=> (not b_lambda!167) (not b!2237)))

(declare-fun t!2111 () Bool)

(declare-fun tb!77 () Bool)

(assert (=> (and start!302 (= p!318 p!318) t!2111) tb!77))

(declare-fun result!107 () Bool)

(assert (=> tb!77 (= result!107 true)))

(assert (=> b!2237 t!2111))

(declare-fun b_and!131 () Bool)

(assert (= b_and!127 (and (=> t!2111 result!107) b_and!131)))

(declare-fun m!881 () Bool)

(assert (=> b!2237 m!881))

(declare-fun m!883 () Bool)

(assert (=> b!2238 m!883))

(assert (=> b!2187 d!375))

(declare-fun d!377 () Bool)

(declare-fun tail!47 (List!32) List!32)

(assert (=> d!377 (= (tail!46 lm!258) (ListLongMap!52 (tail!47 (toList!41 lm!258))))))

(declare-fun bs!82 () Bool)

(assert (= bs!82 d!377))

(declare-fun m!887 () Bool)

(assert (=> bs!82 m!887))

(assert (=> b!2187 d!377))

(declare-fun d!381 () Bool)

(declare-fun isEmpty!35 (List!32) Bool)

(assert (=> d!381 (= (isEmpty!33 lm!258) (isEmpty!35 (toList!41 lm!258)))))

(declare-fun bs!83 () Bool)

(assert (= bs!83 d!381))

(declare-fun m!891 () Bool)

(assert (=> bs!83 m!891))

(assert (=> b!2188 d!381))

(declare-fun b!2251 () Bool)

(declare-fun e!651 () Bool)

(declare-fun tp_is_empty!31 () Bool)

(declare-fun tp!182 () Bool)

(assert (=> b!2251 (= e!651 (and tp_is_empty!31 tp!182))))

(assert (=> b!2189 (= tp!178 e!651)))

(assert (= (and b!2189 (is-Cons!28 (toList!41 lm!258))) b!2251))

(declare-fun b_lambda!173 () Bool)

(assert (= b_lambda!163 (or b!2185 b_lambda!173)))

(declare-fun bs!84 () Bool)

(declare-fun d!387 () Bool)

(assert (= bs!84 (and d!387 b!2185)))

(assert (=> bs!84 (= (dynLambda!22 lambda!14 (v!1085 (getValueByKey!3 (toList!41 lm!258) k!394))) (dynLambda!21 p!318 (tuple2!47 k!394 (v!1085 (getValueByKey!3 (toList!41 lm!258) k!394)))))))

(declare-fun b_lambda!181 () Bool)

(assert (=> (not b_lambda!181) (not bs!84)))

(declare-fun t!2113 () Bool)

(declare-fun tb!79 () Bool)

(assert (=> (and start!302 (= p!318 p!318) t!2113) tb!79))

(declare-fun result!111 () Bool)

(assert (=> tb!79 (= result!111 true)))

(assert (=> bs!84 t!2113))

(declare-fun b_and!133 () Bool)

(assert (= b_and!131 (and (=> t!2113 result!111) b_and!133)))

(declare-fun m!895 () Bool)

(assert (=> bs!84 m!895))

(assert (=> b!2223 d!387))

(declare-fun b_lambda!175 () Bool)

(assert (= b_lambda!157 (or (and start!302 b_free!47) b_lambda!175)))

(declare-fun b_lambda!177 () Bool)

(assert (= b_lambda!167 (or (and start!302 b_free!47) b_lambda!177)))

(declare-fun b_lambda!179 () Bool)

(assert (= b_lambda!161 (or b!2185 b_lambda!179)))

(declare-fun bs!85 () Bool)

(declare-fun d!389 () Bool)

(assert (= bs!85 (and d!389 b!2185)))

(assert (=> bs!85 (= (dynLambda!22 lambda!14 (v!1085 (getValueByKey!3 (toList!41 lt!358) k!394))) (dynLambda!21 p!318 (tuple2!47 k!394 (v!1085 (getValueByKey!3 (toList!41 lt!358) k!394)))))))

(declare-fun b_lambda!183 () Bool)

(assert (=> (not b_lambda!183) (not bs!85)))

(declare-fun t!2115 () Bool)

(declare-fun tb!81 () Bool)

(assert (=> (and start!302 (= p!318 p!318) t!2115) tb!81))

(declare-fun result!113 () Bool)

(assert (=> tb!81 (= result!113 true)))

(assert (=> bs!85 t!2115))

(declare-fun b_and!135 () Bool)

(assert (= b_and!133 (and (=> t!2115 result!113) b_and!135)))

(declare-fun m!897 () Bool)

(assert (=> bs!85 m!897))

(assert (=> b!2220 d!389))

(push 1)

(assert b_and!135)

(assert (not b_next!47))

(assert (not b_lambda!183))

(assert (not b!2199))

(assert (not b_lambda!175))

(assert (not b_lambda!179))

(assert tp_is_empty!31)

(assert (not b_lambda!173))

(assert (not b!2251))

(assert (not b_lambda!177))

(assert (not b_lambda!181))

(assert (not b!2235))

(assert (not d!367))

(assert (not b!2238))

(assert (not d!377))

(assert (not d!349))

(assert (not b!2216))

(assert (not d!381))

(check-sat)

(pop 1)

(push 1)

(assert b_and!135)

(assert (not b_next!47))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!217 () Bool)

(assert (= b_lambda!181 (or (and start!302 b_free!47) b_lambda!217)))

(declare-fun b_lambda!219 () Bool)

(assert (= b_lambda!183 (or (and start!302 b_free!47) b_lambda!219)))

(push 1)

(assert b_and!135)

(assert (not b_next!47))

(assert (not b!2199))

(assert (not b_lambda!175))

(assert (not b_lambda!179))

(assert (not b_lambda!217))

(assert tp_is_empty!31)

(assert (not b!2251))

(assert (not b_lambda!177))

(assert (not b!2235))

(assert (not d!367))

(assert (not b!2238))

(assert (not d!377))

(assert (not d!349))

(assert (not b!2216))

(assert (not d!381))

(assert (not b_lambda!219))

(assert (not b_lambda!173))

(check-sat)

(pop 1)

(push 1)

(assert b_and!135)

(assert (not b_next!47))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!421 () Bool)

(declare-fun res!4662 () Bool)

(declare-fun e!679 () Bool)

(assert (=> d!421 (=> res!4662 e!679)))

(assert (=> d!421 (= res!4662 (is-Nil!29 (t!2105 (toList!41 lt!358))))))

(assert (=> d!421 (= (forall!28 (t!2105 (toList!41 lt!358)) p!318) e!679)))

(declare-fun b!2293 () Bool)

(declare-fun e!680 () Bool)

(assert (=> b!2293 (= e!679 e!680)))

(declare-fun res!4663 () Bool)

(assert (=> b!2293 (=> (not res!4663) (not e!680))))

(assert (=> b!2293 (= res!4663 (dynLambda!21 p!318 (h!594 (t!2105 (toList!41 lt!358)))))))

(declare-fun b!2294 () Bool)

(assert (=> b!2294 (= e!680 (forall!28 (t!2105 (t!2105 (toList!41 lt!358))) p!318))))

(assert (= (and d!421 (not res!4662)) b!2293))

(assert (= (and b!2293 res!4663) b!2294))

(declare-fun b_lambda!229 () Bool)

(assert (=> (not b_lambda!229) (not b!2293)))

(declare-fun t!2131 () Bool)

(declare-fun tb!97 () Bool)

(assert (=> (and start!302 (= p!318 p!318) t!2131) tb!97))

(declare-fun result!133 () Bool)

(assert (=> tb!97 (= result!133 true)))

(assert (=> b!2293 t!2131))

(declare-fun b_and!151 () Bool)

(assert (= b_and!135 (and (=> t!2131 result!133) b_and!151)))

(declare-fun m!939 () Bool)

(assert (=> b!2293 m!939))

(declare-fun m!941 () Bool)

(assert (=> b!2294 m!941))

(assert (=> b!2238 d!421))

(declare-fun b!2296 () Bool)

(declare-fun e!681 () Option!9)

(declare-fun e!682 () Option!9)

(assert (=> b!2296 (= e!681 e!682)))

(declare-fun c!139 () Bool)

(assert (=> b!2296 (= c!139 (and (is-Cons!28 (t!2105 (toList!41 lt!358))) (not (= (_1!23 (h!594 (t!2105 (toList!41 lt!358)))) k!394))))))

(declare-fun b!2298 () Bool)

(assert (=> b!2298 (= e!682 None!7)))

(declare-fun b!2297 () Bool)

(assert (=> b!2297 (= e!682 (getValueByKey!3 (t!2105 (t!2105 (toList!41 lt!358))) k!394))))

(declare-fun b!2295 () Bool)

(assert (=> b!2295 (= e!681 (Some!8 (_2!23 (h!594 (t!2105 (toList!41 lt!358))))))))

(declare-fun d!425 () Bool)

(declare-fun c!138 () Bool)

(assert (=> d!425 (= c!138 (and (is-Cons!28 (t!2105 (toList!41 lt!358))) (= (_1!23 (h!594 (t!2105 (toList!41 lt!358)))) k!394)))))

(assert (=> d!425 (= (getValueByKey!3 (t!2105 (toList!41 lt!358)) k!394) e!681)))

(assert (= (and d!425 c!138) b!2295))

(assert (= (and d!425 (not c!138)) b!2296))

(assert (= (and b!2296 c!139) b!2297))

(assert (= (and b!2296 (not c!139)) b!2298))

(declare-fun m!943 () Bool)

(assert (=> b!2297 m!943))

(assert (=> b!2216 d!425))

(declare-fun b!2300 () Bool)

(declare-fun e!683 () Option!9)

(declare-fun e!684 () Option!9)

(assert (=> b!2300 (= e!683 e!684)))

(declare-fun c!141 () Bool)

(assert (=> b!2300 (= c!141 (and (is-Cons!28 (t!2105 (toList!41 lm!258))) (not (= (_1!23 (h!594 (t!2105 (toList!41 lm!258)))) k!394))))))

(declare-fun b!2302 () Bool)

(assert (=> b!2302 (= e!684 None!7)))

(declare-fun b!2301 () Bool)

(assert (=> b!2301 (= e!684 (getValueByKey!3 (t!2105 (t!2105 (toList!41 lm!258))) k!394))))

(declare-fun b!2299 () Bool)

(assert (=> b!2299 (= e!683 (Some!8 (_2!23 (h!594 (t!2105 (toList!41 lm!258))))))))

(declare-fun d!427 () Bool)

(declare-fun c!140 () Bool)

(assert (=> d!427 (= c!140 (and (is-Cons!28 (t!2105 (toList!41 lm!258))) (= (_1!23 (h!594 (t!2105 (toList!41 lm!258)))) k!394)))))

(assert (=> d!427 (= (getValueByKey!3 (t!2105 (toList!41 lm!258)) k!394) e!683)))

(assert (= (and d!427 c!140) b!2299))

(assert (= (and d!427 (not c!140)) b!2300))

(assert (= (and b!2300 c!141) b!2301))

(assert (= (and b!2300 (not c!141)) b!2302))

(declare-fun m!945 () Bool)

(assert (=> b!2301 m!945))

(assert (=> b!2235 d!427))

(declare-fun d!431 () Bool)

(declare-fun res!4666 () Bool)

(declare-fun e!687 () Bool)

(assert (=> d!431 (=> res!4666 e!687)))

(assert (=> d!431 (= res!4666 (is-Nil!29 (t!2105 (toList!41 lm!258))))))

(assert (=> d!431 (= (forall!28 (t!2105 (toList!41 lm!258)) p!318) e!687)))

(declare-fun b!2305 () Bool)

(declare-fun e!688 () Bool)

(assert (=> b!2305 (= e!687 e!688)))

(declare-fun res!4667 () Bool)

(assert (=> b!2305 (=> (not res!4667) (not e!688))))

(assert (=> b!2305 (= res!4667 (dynLambda!21 p!318 (h!594 (t!2105 (toList!41 lm!258)))))))

(declare-fun b!2306 () Bool)

(assert (=> b!2306 (= e!688 (forall!28 (t!2105 (t!2105 (toList!41 lm!258))) p!318))))

(assert (= (and d!431 (not res!4666)) b!2305))

(assert (= (and b!2305 res!4667) b!2306))

(declare-fun b_lambda!233 () Bool)

(assert (=> (not b_lambda!233) (not b!2305)))

(declare-fun t!2135 () Bool)

(declare-fun tb!101 () Bool)

(assert (=> (and start!302 (= p!318 p!318) t!2135) tb!101))

(declare-fun result!137 () Bool)

(assert (=> tb!101 (= result!137 true)))

(assert (=> b!2305 t!2135))

(declare-fun b_and!155 () Bool)

(assert (= b_and!151 (and (=> t!2135 result!137) b_and!155)))

(declare-fun m!951 () Bool)

(assert (=> b!2305 m!951))

(declare-fun m!953 () Bool)

(assert (=> b!2306 m!953))

(assert (=> b!2199 d!431))

(declare-fun d!435 () Bool)

(assert (=> d!435 (= (tail!47 (toList!41 lm!258)) (t!2105 (toList!41 lm!258)))))

(assert (=> d!377 d!435))

(declare-fun d!439 () Bool)

(assert (=> d!439 (= (isEmpty!35 (toList!41 lm!258)) (is-Nil!29 (toList!41 lm!258)))))

(assert (=> d!381 d!439))

(declare-fun d!443 () Bool)

(declare-fun res!4673 () Bool)

(declare-fun e!696 () Bool)

(assert (=> d!443 (=> res!4673 e!696)))

(assert (=> d!443 (= res!4673 (or (is-Nil!29 (toList!41 lm!258)) (is-Nil!29 (t!2105 (toList!41 lm!258)))))))

(assert (=> d!443 (= (isStrictlySorted!13 (toList!41 lm!258)) e!696)))

(declare-fun b!2316 () Bool)

(declare-fun e!697 () Bool)

(assert (=> b!2316 (= e!696 e!697)))

(declare-fun res!4674 () Bool)

(assert (=> b!2316 (=> (not res!4674) (not e!697))))

(assert (=> b!2316 (= res!4674 (bvslt (_1!23 (h!594 (toList!41 lm!258))) (_1!23 (h!594 (t!2105 (toList!41 lm!258))))))))

(declare-fun b!2317 () Bool)

(assert (=> b!2317 (= e!697 (isStrictlySorted!13 (t!2105 (toList!41 lm!258))))))

(assert (= (and d!443 (not res!4673)) b!2316))

(assert (= (and b!2316 res!4674) b!2317))

(declare-fun m!959 () Bool)

(assert (=> b!2317 m!959))

(assert (=> d!349 d!443))

(declare-fun d!445 () Bool)

(declare-fun res!4675 () Bool)

(declare-fun e!698 () Bool)

(assert (=> d!445 (=> res!4675 e!698)))

(assert (=> d!445 (= res!4675 (not (is-Some!8 (getValueByKey!3 (toList!41 lt!358) k!394))))))

(assert (=> d!445 (= (forall!27 (getValueByKey!3 (toList!41 lt!358) k!394) lambda!20) e!698)))

(declare-fun b!2318 () Bool)

(assert (=> b!2318 (= e!698 (dynLambda!22 lambda!20 (v!1085 (getValueByKey!3 (toList!41 lt!358) k!394))))))

(assert (= (and d!445 (not res!4675)) b!2318))

(declare-fun b_lambda!237 () Bool)

(assert (=> (not b_lambda!237) (not b!2318)))

(declare-fun m!961 () Bool)

(assert (=> b!2318 m!961))

(assert (=> d!367 d!445))

(assert (=> d!367 d!355))

(declare-fun bs!99 () Bool)

(declare-fun d!447 () Bool)

(assert (= bs!99 (and d!447 b!2185)))

(declare-fun lambda!29 () Int)

(assert (=> bs!99 (= lambda!29 lambda!14)))

(declare-fun bs!100 () Bool)

(assert (= bs!100 (and d!447 d!367)))

(assert (=> bs!100 (= lambda!29 lambda!20)))

(assert (=> d!447 true))

(assert (=> d!447 true))

(assert (=> d!447 (< (dynLambda!19 order!9 p!318) (dynLambda!20 order!11 lambda!29))))

(assert (=> d!447 (forall!27 (getValueByKey!3 (toList!41 lt!358) k!394) lambda!29)))

(assert (=> d!447 true))

(declare-fun _$38!26 () Unit!17)

(assert (=> d!447 (= (choose!131 lt!358 p!318 k!394) _$38!26)))

(declare-fun bs!101 () Bool)

(assert (= bs!101 d!447))

(assert (=> bs!101 m!845))

(assert (=> bs!101 m!845))

(declare-fun m!979 () Bool)

(assert (=> bs!101 m!979))

(assert (=> d!367 d!447))

(assert (=> d!367 d!375))

(declare-fun b!2338 () Bool)

(declare-fun e!714 () Bool)

(declare-fun tp!189 () Bool)

(assert (=> b!2338 (= e!714 (and tp_is_empty!31 tp!189))))

(assert (=> b!2251 (= tp!182 e!714)))

(assert (= (and b!2251 (is-Cons!28 (t!2105 (toList!41 lm!258)))) b!2338))

(declare-fun b_lambda!251 () Bool)

(assert (= b_lambda!229 (or (and start!302 b_free!47) b_lambda!251)))

(declare-fun b_lambda!253 () Bool)

(assert (= b_lambda!237 (or d!367 b_lambda!253)))

(declare-fun bs!103 () Bool)

(declare-fun d!469 () Bool)

(assert (= bs!103 (and d!469 d!367)))

(assert (=> bs!103 (= (dynLambda!22 lambda!20 (v!1085 (getValueByKey!3 (toList!41 lt!358) k!394))) (dynLambda!21 p!318 (tuple2!47 k!394 (v!1085 (getValueByKey!3 (toList!41 lt!358) k!394)))))))

(declare-fun b_lambda!259 () Bool)

(assert (=> (not b_lambda!259) (not bs!103)))

(assert (=> bs!103 t!2115))

(declare-fun b_and!163 () Bool)

(assert (= b_and!155 (and (=> t!2115 result!113) b_and!163)))

(assert (=> bs!103 m!897))

(assert (=> b!2318 d!469))

(declare-fun b_lambda!255 () Bool)

(assert (= b_lambda!233 (or (and start!302 b_free!47) b_lambda!255)))

(push 1)

