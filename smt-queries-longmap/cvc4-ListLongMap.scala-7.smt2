; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!242 () Bool)

(assert start!242)

(declare-fun b_free!41 () Bool)

(declare-fun b_next!41 () Bool)

(assert (=> start!242 (= b_free!41 (not b_next!41))))

(declare-fun tp!149 () Bool)

(declare-fun b_and!95 () Bool)

(assert (=> start!242 (= tp!149 b_and!95)))

(declare-fun b!2024 () Bool)

(declare-fun res!4533 () Bool)

(declare-fun e!498 () Bool)

(assert (=> b!2024 (=> (not res!4533) (not e!498))))

(declare-datatypes ((B!276 0))(
  ( (B!277 (val!20 Int)) )
))
(declare-datatypes ((tuple2!40 0))(
  ( (tuple2!41 (_1!20 (_ BitVec 64)) (_2!20 B!276)) )
))
(declare-datatypes ((List!29 0))(
  ( (Nil!26) (Cons!25 (h!591 tuple2!40) (t!2078 List!29)) )
))
(declare-datatypes ((ListLongMap!45 0))(
  ( (ListLongMap!46 (toList!38 List!29)) )
))
(declare-fun lm!258 () ListLongMap!45)

(declare-fun k!394 () (_ BitVec 64))

(declare-fun head!751 (List!29) tuple2!40)

(assert (=> b!2024 (= res!4533 (not (= (_1!20 (head!751 (toList!38 lm!258))) k!394)))))

(declare-fun res!4535 () Bool)

(assert (=> start!242 (=> (not res!4535) (not e!498))))

(declare-fun p!318 () Int)

(declare-fun forall!22 (List!29 Int) Bool)

(assert (=> start!242 (= res!4535 (forall!22 (toList!38 lm!258) p!318))))

(assert (=> start!242 e!498))

(declare-fun e!497 () Bool)

(declare-fun inv!65 (ListLongMap!45) Bool)

(assert (=> start!242 (and (inv!65 lm!258) e!497)))

(assert (=> start!242 tp!149))

(assert (=> start!242 true))

(declare-fun b!2025 () Bool)

(declare-fun e!496 () Bool)

(declare-fun lt!323 () ListLongMap!45)

(declare-fun size!68 (List!29) Int)

(assert (=> b!2025 (= e!496 (>= (size!68 (toList!38 lt!323)) (size!68 (toList!38 lm!258))))))

(declare-fun b!2026 () Bool)

(declare-fun res!4534 () Bool)

(assert (=> b!2026 (=> (not res!4534) (not e!498))))

(declare-fun isEmpty!27 (ListLongMap!45) Bool)

(assert (=> b!2026 (= res!4534 (not (isEmpty!27 lm!258)))))

(declare-fun b!2027 () Bool)

(assert (=> b!2027 (= e!498 e!496)))

(declare-fun res!4532 () Bool)

(assert (=> b!2027 (=> (not res!4532) (not e!496))))

(assert (=> b!2027 (= res!4532 (forall!22 (toList!38 lt!323) p!318))))

(declare-fun tail!40 (ListLongMap!45) ListLongMap!45)

(assert (=> b!2027 (= lt!323 (tail!40 lm!258))))

(declare-fun b!2028 () Bool)

(declare-fun tp!148 () Bool)

(assert (=> b!2028 (= e!497 tp!148)))

(assert (= (and start!242 res!4535) b!2026))

(assert (= (and b!2026 res!4534) b!2024))

(assert (= (and b!2024 res!4533) b!2027))

(assert (= (and b!2027 res!4532) b!2025))

(assert (= start!242 b!2028))

(declare-fun m!671 () Bool)

(assert (=> start!242 m!671))

(declare-fun m!673 () Bool)

(assert (=> start!242 m!673))

(declare-fun m!675 () Bool)

(assert (=> b!2027 m!675))

(declare-fun m!677 () Bool)

(assert (=> b!2027 m!677))

(declare-fun m!679 () Bool)

(assert (=> b!2026 m!679))

(declare-fun m!681 () Bool)

(assert (=> b!2025 m!681))

(declare-fun m!683 () Bool)

(assert (=> b!2025 m!683))

(declare-fun m!685 () Bool)

(assert (=> b!2024 m!685))

(push 1)

(assert (not b!2027))

(assert (not b!2026))

(assert b_and!95)

(assert (not start!242))

(assert (not b!2028))

(assert (not b!2025))

(assert (not b_next!41))

(assert (not b!2024))

(check-sat)

(pop 1)

(push 1)

(assert b_and!95)

(assert (not b_next!41))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!251 () Bool)

(declare-fun res!4540 () Bool)

(declare-fun e!503 () Bool)

(assert (=> d!251 (=> res!4540 e!503)))

(assert (=> d!251 (= res!4540 (is-Nil!26 (toList!38 lt!323)))))

(assert (=> d!251 (= (forall!22 (toList!38 lt!323) p!318) e!503)))

(declare-fun b!2033 () Bool)

(declare-fun e!504 () Bool)

(assert (=> b!2033 (= e!503 e!504)))

(declare-fun res!4541 () Bool)

(assert (=> b!2033 (=> (not res!4541) (not e!504))))

(declare-fun dynLambda!12 (Int tuple2!40) Bool)

(assert (=> b!2033 (= res!4541 (dynLambda!12 p!318 (h!591 (toList!38 lt!323))))))

(declare-fun b!2034 () Bool)

(assert (=> b!2034 (= e!504 (forall!22 (t!2078 (toList!38 lt!323)) p!318))))

(assert (= (and d!251 (not res!4540)) b!2033))

(assert (= (and b!2033 res!4541) b!2034))

(declare-fun b_lambda!109 () Bool)

(assert (=> (not b_lambda!109) (not b!2033)))

(declare-fun t!2080 () Bool)

(declare-fun tb!49 () Bool)

(assert (=> (and start!242 (= p!318 p!318) t!2080) tb!49))

(declare-fun result!73 () Bool)

(assert (=> tb!49 (= result!73 true)))

(assert (=> b!2033 t!2080))

(declare-fun b_and!97 () Bool)

(assert (= b_and!95 (and (=> t!2080 result!73) b_and!97)))

(declare-fun m!687 () Bool)

(assert (=> b!2033 m!687))

(declare-fun m!689 () Bool)

(assert (=> b!2034 m!689))

(assert (=> b!2027 d!251))

(declare-fun d!257 () Bool)

(declare-fun tail!41 (List!29) List!29)

(assert (=> d!257 (= (tail!40 lm!258) (ListLongMap!46 (tail!41 (toList!38 lm!258))))))

(declare-fun bs!63 () Bool)

(assert (= bs!63 d!257))

(declare-fun m!691 () Bool)

(assert (=> bs!63 m!691))

(assert (=> b!2027 d!257))

(declare-fun d!259 () Bool)

(declare-fun isEmpty!28 (List!29) Bool)

(assert (=> d!259 (= (isEmpty!27 lm!258) (isEmpty!28 (toList!38 lm!258)))))

(declare-fun bs!65 () Bool)

(assert (= bs!65 d!259))

(declare-fun m!699 () Bool)

(assert (=> bs!65 m!699))

(assert (=> b!2026 d!259))

(declare-fun d!267 () Bool)

(declare-fun res!4542 () Bool)

(declare-fun e!509 () Bool)

(assert (=> d!267 (=> res!4542 e!509)))

(assert (=> d!267 (= res!4542 (is-Nil!26 (toList!38 lm!258)))))

(assert (=> d!267 (= (forall!22 (toList!38 lm!258) p!318) e!509)))

(declare-fun b!2043 () Bool)

(declare-fun e!510 () Bool)

(assert (=> b!2043 (= e!509 e!510)))

(declare-fun res!4543 () Bool)

(assert (=> b!2043 (=> (not res!4543) (not e!510))))

(assert (=> b!2043 (= res!4543 (dynLambda!12 p!318 (h!591 (toList!38 lm!258))))))

(declare-fun b!2044 () Bool)

(assert (=> b!2044 (= e!510 (forall!22 (t!2078 (toList!38 lm!258)) p!318))))

(assert (= (and d!267 (not res!4542)) b!2043))

(assert (= (and b!2043 res!4543) b!2044))

(declare-fun b_lambda!111 () Bool)

(assert (=> (not b_lambda!111) (not b!2043)))

(declare-fun t!2082 () Bool)

(declare-fun tb!51 () Bool)

(assert (=> (and start!242 (= p!318 p!318) t!2082) tb!51))

(declare-fun result!75 () Bool)

(assert (=> tb!51 (= result!75 true)))

(assert (=> b!2043 t!2082))

(declare-fun b_and!99 () Bool)

(assert (= b_and!97 (and (=> t!2082 result!75) b_and!99)))

(declare-fun m!701 () Bool)

(assert (=> b!2043 m!701))

(declare-fun m!703 () Bool)

(assert (=> b!2044 m!703))

(assert (=> start!242 d!267))

(declare-fun d!269 () Bool)

(declare-fun isStrictlySorted!10 (List!29) Bool)

(assert (=> d!269 (= (inv!65 lm!258) (isStrictlySorted!10 (toList!38 lm!258)))))

(declare-fun bs!66 () Bool)

(assert (= bs!66 d!269))

(declare-fun m!705 () Bool)

(assert (=> bs!66 m!705))

(assert (=> start!242 d!269))

(declare-fun d!271 () Bool)

(declare-fun lt!330 () Int)

(assert (=> d!271 (>= lt!330 0)))

(declare-fun e!525 () Int)

(assert (=> d!271 (= lt!330 e!525)))

(declare-fun c!102 () Bool)

(assert (=> d!271 (= c!102 (is-Nil!26 (toList!38 lt!323)))))

(assert (=> d!271 (= (size!68 (toList!38 lt!323)) lt!330)))

(declare-fun b!2061 () Bool)

(assert (=> b!2061 (= e!525 0)))

(declare-fun b!2062 () Bool)

(assert (=> b!2062 (= e!525 (+ 1 (size!68 (t!2078 (toList!38 lt!323)))))))

(assert (= (and d!271 c!102) b!2061))

(assert (= (and d!271 (not c!102)) b!2062))

(declare-fun m!717 () Bool)

(assert (=> b!2062 m!717))

(assert (=> b!2025 d!271))

(declare-fun d!279 () Bool)

(declare-fun lt!331 () Int)

(assert (=> d!279 (>= lt!331 0)))

(declare-fun e!528 () Int)

(assert (=> d!279 (= lt!331 e!528)))

(declare-fun c!103 () Bool)

(assert (=> d!279 (= c!103 (is-Nil!26 (toList!38 lm!258)))))

(assert (=> d!279 (= (size!68 (toList!38 lm!258)) lt!331)))

(declare-fun b!2065 () Bool)

(assert (=> b!2065 (= e!528 0)))

(declare-fun b!2066 () Bool)

(assert (=> b!2066 (= e!528 (+ 1 (size!68 (t!2078 (toList!38 lm!258)))))))

(assert (= (and d!279 c!103) b!2065))

(assert (= (and d!279 (not c!103)) b!2066))

(declare-fun m!719 () Bool)

(assert (=> b!2066 m!719))

(assert (=> b!2025 d!279))

(declare-fun d!281 () Bool)

(assert (=> d!281 (= (head!751 (toList!38 lm!258)) (h!591 (toList!38 lm!258)))))

(assert (=> b!2024 d!281))

(declare-fun b!2071 () Bool)

(declare-fun e!531 () Bool)

(declare-fun tp_is_empty!25 () Bool)

(declare-fun tp!152 () Bool)

(assert (=> b!2071 (= e!531 (and tp_is_empty!25 tp!152))))

(assert (=> b!2028 (= tp!148 e!531)))

(assert (= (and b!2028 (is-Cons!25 (toList!38 lm!258))) b!2071))

(declare-fun b_lambda!119 () Bool)

(assert (= b_lambda!109 (or (and start!242 b_free!41) b_lambda!119)))

(declare-fun b_lambda!121 () Bool)

(assert (= b_lambda!111 (or (and start!242 b_free!41) b_lambda!121)))

(push 1)

(assert (not d!257))

(assert b_and!99)

(assert (not b!2044))

(assert tp_is_empty!25)

(assert (not b!2062))

(assert (not b!2066))

(assert (not b_lambda!119))

(assert (not d!259))

(assert (not d!269))

(assert (not b!2071))

(assert (not b!2034))

(assert (not b_next!41))

(assert (not b_lambda!121))

(check-sat)

(pop 1)

(push 1)

(assert b_and!99)

(assert (not b_next!41))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!299 () Bool)

(declare-fun res!4560 () Bool)

(declare-fun e!544 () Bool)

(assert (=> d!299 (=> res!4560 e!544)))

(assert (=> d!299 (= res!4560 (is-Nil!26 (t!2078 (toList!38 lt!323))))))

(assert (=> d!299 (= (forall!22 (t!2078 (toList!38 lt!323)) p!318) e!544)))

(declare-fun b!2092 () Bool)

(declare-fun e!545 () Bool)

(assert (=> b!2092 (= e!544 e!545)))

(declare-fun res!4561 () Bool)

(assert (=> b!2092 (=> (not res!4561) (not e!545))))

(assert (=> b!2092 (= res!4561 (dynLambda!12 p!318 (h!591 (t!2078 (toList!38 lt!323)))))))

(declare-fun b!2093 () Bool)

(assert (=> b!2093 (= e!545 (forall!22 (t!2078 (t!2078 (toList!38 lt!323))) p!318))))

(assert (= (and d!299 (not res!4560)) b!2092))

(assert (= (and b!2092 res!4561) b!2093))

(declare-fun b_lambda!133 () Bool)

(assert (=> (not b_lambda!133) (not b!2092)))

(declare-fun t!2092 () Bool)

(declare-fun tb!61 () Bool)

(assert (=> (and start!242 (= p!318 p!318) t!2092) tb!61))

(declare-fun result!91 () Bool)

(assert (=> tb!61 (= result!91 true)))

(assert (=> b!2092 t!2092))

(declare-fun b_and!109 () Bool)

(assert (= b_and!99 (and (=> t!2092 result!91) b_and!109)))

(declare-fun m!741 () Bool)

(assert (=> b!2092 m!741))

(declare-fun m!743 () Bool)

(assert (=> b!2093 m!743))

(assert (=> b!2034 d!299))

(declare-fun d!303 () Bool)

(assert (=> d!303 (= (isEmpty!28 (toList!38 lm!258)) (is-Nil!26 (toList!38 lm!258)))))

(assert (=> d!259 d!303))

(declare-fun d!307 () Bool)

(assert (=> d!307 (= (tail!41 (toList!38 lm!258)) (t!2078 (toList!38 lm!258)))))

(assert (=> d!257 d!307))

(declare-fun d!311 () Bool)

(declare-fun res!4564 () Bool)

(declare-fun e!549 () Bool)

(assert (=> d!311 (=> res!4564 e!549)))

(assert (=> d!311 (= res!4564 (is-Nil!26 (t!2078 (toList!38 lm!258))))))

(assert (=> d!311 (= (forall!22 (t!2078 (toList!38 lm!258)) p!318) e!549)))

(declare-fun b!2098 () Bool)

(declare-fun e!550 () Bool)

(assert (=> b!2098 (= e!549 e!550)))

(declare-fun res!4565 () Bool)

(assert (=> b!2098 (=> (not res!4565) (not e!550))))

(assert (=> b!2098 (= res!4565 (dynLambda!12 p!318 (h!591 (t!2078 (toList!38 lm!258)))))))

(declare-fun b!2099 () Bool)

(assert (=> b!2099 (= e!550 (forall!22 (t!2078 (t!2078 (toList!38 lm!258))) p!318))))

(assert (= (and d!311 (not res!4564)) b!2098))

(assert (= (and b!2098 res!4565) b!2099))

(declare-fun b_lambda!137 () Bool)

(assert (=> (not b_lambda!137) (not b!2098)))

(declare-fun t!2096 () Bool)

(declare-fun tb!65 () Bool)

(assert (=> (and start!242 (= p!318 p!318) t!2096) tb!65))

(declare-fun result!95 () Bool)

(assert (=> tb!65 (= result!95 true)))

(assert (=> b!2098 t!2096))

(declare-fun b_and!113 () Bool)

(assert (= b_and!109 (and (=> t!2096 result!95) b_and!113)))

(declare-fun m!751 () Bool)

(assert (=> b!2098 m!751))

(declare-fun m!753 () Bool)

(assert (=> b!2099 m!753))

(assert (=> b!2044 d!311))

(declare-fun d!315 () Bool)

(declare-fun res!4580 () Bool)

(declare-fun e!566 () Bool)

(assert (=> d!315 (=> res!4580 e!566)))

(assert (=> d!315 (= res!4580 (or (is-Nil!26 (toList!38 lm!258)) (is-Nil!26 (t!2078 (toList!38 lm!258)))))))

(assert (=> d!315 (= (isStrictlySorted!10 (toList!38 lm!258)) e!566)))

(declare-fun b!2112 () Bool)

(declare-fun e!567 () Bool)

(assert (=> b!2112 (= e!566 e!567)))

(declare-fun res!4581 () Bool)

(assert (=> b!2112 (=> (not res!4581) (not e!567))))

(assert (=> b!2112 (= res!4581 (bvslt (_1!20 (h!591 (toList!38 lm!258))) (_1!20 (h!591 (t!2078 (toList!38 lm!258))))))))

(declare-fun b!2113 () Bool)

(assert (=> b!2113 (= e!567 (isStrictlySorted!10 (t!2078 (toList!38 lm!258))))))

(assert (= (and d!315 (not res!4580)) b!2112))

(assert (= (and b!2112 res!4581) b!2113))

(declare-fun m!761 () Bool)

(assert (=> b!2113 m!761))

(assert (=> d!269 d!315))

(declare-fun d!325 () Bool)

(declare-fun lt!338 () Int)

(assert (=> d!325 (>= lt!338 0)))

(declare-fun e!568 () Int)

(assert (=> d!325 (= lt!338 e!568)))

(declare-fun c!110 () Bool)

(assert (=> d!325 (= c!110 (is-Nil!26 (t!2078 (toList!38 lt!323))))))

(assert (=> d!325 (= (size!68 (t!2078 (toList!38 lt!323))) lt!338)))

(declare-fun b!2118 () Bool)

(assert (=> b!2118 (= e!568 0)))

(declare-fun b!2119 () Bool)

(assert (=> b!2119 (= e!568 (+ 1 (size!68 (t!2078 (t!2078 (toList!38 lt!323))))))))

(assert (= (and d!325 c!110) b!2118))

(assert (= (and d!325 (not c!110)) b!2119))

(declare-fun m!763 () Bool)

(assert (=> b!2119 m!763))

(assert (=> b!2062 d!325))

(declare-fun d!327 () Bool)

(declare-fun lt!339 () Int)

