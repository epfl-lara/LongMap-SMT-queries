; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103732 () Bool)

(assert start!103732)

(declare-fun b!1241968 () Bool)

(declare-fun res!828381 () Bool)

(declare-fun e!703995 () Bool)

(assert (=> b!1241968 (=> (not res!828381) (not e!703995))))

(declare-datatypes ((B!1884 0))(
  ( (B!1885 (val!15704 Int)) )
))
(declare-datatypes ((tuple2!20280 0))(
  ( (tuple2!20281 (_1!10151 (_ BitVec 64)) (_2!10151 B!1884)) )
))
(declare-datatypes ((List!27369 0))(
  ( (Nil!27366) (Cons!27365 (h!28574 tuple2!20280) (t!40832 List!27369)) )
))
(declare-fun l!644 () List!27369)

(declare-fun isStrictlySorted!762 (List!27369) Bool)

(assert (=> b!1241968 (= res!828381 (isStrictlySorted!762 l!644))))

(declare-fun res!828379 () Bool)

(assert (=> start!103732 (=> (not res!828379) (not e!703995))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103732 (= res!828379 (not (= key1!25 key2!15)))))

(assert (=> start!103732 e!703995))

(assert (=> start!103732 true))

(declare-fun e!703994 () Bool)

(assert (=> start!103732 e!703994))

(declare-fun b!1241969 () Bool)

(declare-fun res!828380 () Bool)

(assert (=> b!1241969 (=> (not res!828380) (not e!703995))))

(assert (=> b!1241969 (= res!828380 (is-Cons!27365 l!644))))

(declare-fun b!1241970 () Bool)

(declare-fun tp_is_empty!31283 () Bool)

(declare-fun tp!92732 () Bool)

(assert (=> b!1241970 (= e!703994 (and tp_is_empty!31283 tp!92732))))

(declare-fun b!1241971 () Bool)

(declare-fun ListPrimitiveSize!150 (List!27369) Int)

(assert (=> b!1241971 (= e!703995 (>= (ListPrimitiveSize!150 (t!40832 l!644)) (ListPrimitiveSize!150 l!644)))))

(declare-fun b!1241972 () Bool)

(declare-fun res!828382 () Bool)

(assert (=> b!1241972 (=> (not res!828382) (not e!703995))))

(assert (=> b!1241972 (= res!828382 (isStrictlySorted!762 (t!40832 l!644)))))

(assert (= (and start!103732 res!828379) b!1241968))

(assert (= (and b!1241968 res!828381) b!1241969))

(assert (= (and b!1241969 res!828380) b!1241972))

(assert (= (and b!1241972 res!828382) b!1241971))

(assert (= (and start!103732 (is-Cons!27365 l!644)) b!1241970))

(declare-fun m!1144733 () Bool)

(assert (=> b!1241968 m!1144733))

(declare-fun m!1144735 () Bool)

(assert (=> b!1241971 m!1144735))

(declare-fun m!1144737 () Bool)

(assert (=> b!1241971 m!1144737))

(declare-fun m!1144739 () Bool)

(assert (=> b!1241972 m!1144739))

(push 1)

(assert (not b!1241968))

(assert (not b!1241971))

(assert tp_is_empty!31283)

(assert (not b!1241972))

(assert (not b!1241970))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136565 () Bool)

(declare-fun lt!562172 () Int)

(assert (=> d!136565 (>= lt!562172 0)))

(declare-fun e!704002 () Int)

(assert (=> d!136565 (= lt!562172 e!704002)))

(declare-fun c!121516 () Bool)

(assert (=> d!136565 (= c!121516 (is-Nil!27366 (t!40832 l!644)))))

(assert (=> d!136565 (= (ListPrimitiveSize!150 (t!40832 l!644)) lt!562172)))

(declare-fun b!1241981 () Bool)

(assert (=> b!1241981 (= e!704002 0)))

(declare-fun b!1241982 () Bool)

(assert (=> b!1241982 (= e!704002 (+ 1 (ListPrimitiveSize!150 (t!40832 (t!40832 l!644)))))))

(assert (= (and d!136565 c!121516) b!1241981))

(assert (= (and d!136565 (not c!121516)) b!1241982))

(declare-fun m!1144741 () Bool)

(assert (=> b!1241982 m!1144741))

(assert (=> b!1241971 d!136565))

(declare-fun d!136569 () Bool)

(declare-fun lt!562173 () Int)

(assert (=> d!136569 (>= lt!562173 0)))

(declare-fun e!704007 () Int)

(assert (=> d!136569 (= lt!562173 e!704007)))

(declare-fun c!121517 () Bool)

(assert (=> d!136569 (= c!121517 (is-Nil!27366 l!644))))

(assert (=> d!136569 (= (ListPrimitiveSize!150 l!644) lt!562173)))

(declare-fun b!1241987 () Bool)

(assert (=> b!1241987 (= e!704007 0)))

(declare-fun b!1241988 () Bool)

(assert (=> b!1241988 (= e!704007 (+ 1 (ListPrimitiveSize!150 (t!40832 l!644))))))

(assert (= (and d!136569 c!121517) b!1241987))

(assert (= (and d!136569 (not c!121517)) b!1241988))

(assert (=> b!1241988 m!1144735))

(assert (=> b!1241971 d!136569))

(declare-fun d!136573 () Bool)

(declare-fun res!828401 () Bool)

(declare-fun e!704024 () Bool)

(assert (=> d!136573 (=> res!828401 e!704024)))

(assert (=> d!136573 (= res!828401 (or (is-Nil!27366 (t!40832 l!644)) (is-Nil!27366 (t!40832 (t!40832 l!644)))))))

(assert (=> d!136573 (= (isStrictlySorted!762 (t!40832 l!644)) e!704024)))

(declare-fun b!1242011 () Bool)

(declare-fun e!704025 () Bool)

(assert (=> b!1242011 (= e!704024 e!704025)))

(declare-fun res!828402 () Bool)

(assert (=> b!1242011 (=> (not res!828402) (not e!704025))))

(assert (=> b!1242011 (= res!828402 (bvslt (_1!10151 (h!28574 (t!40832 l!644))) (_1!10151 (h!28574 (t!40832 (t!40832 l!644))))))))

(declare-fun b!1242012 () Bool)

(assert (=> b!1242012 (= e!704025 (isStrictlySorted!762 (t!40832 (t!40832 l!644))))))

(assert (= (and d!136573 (not res!828401)) b!1242011))

(assert (= (and b!1242011 res!828402) b!1242012))

(declare-fun m!1144747 () Bool)

(assert (=> b!1242012 m!1144747))

(assert (=> b!1241972 d!136573))

(declare-fun d!136583 () Bool)

(declare-fun res!828405 () Bool)

(declare-fun e!704028 () Bool)

(assert (=> d!136583 (=> res!828405 e!704028)))

(assert (=> d!136583 (= res!828405 (or (is-Nil!27366 l!644) (is-Nil!27366 (t!40832 l!644))))))

(assert (=> d!136583 (= (isStrictlySorted!762 l!644) e!704028)))

(declare-fun b!1242015 () Bool)

(declare-fun e!704029 () Bool)

(assert (=> b!1242015 (= e!704028 e!704029)))

(declare-fun res!828406 () Bool)

(assert (=> b!1242015 (=> (not res!828406) (not e!704029))))

(assert (=> b!1242015 (= res!828406 (bvslt (_1!10151 (h!28574 l!644)) (_1!10151 (h!28574 (t!40832 l!644)))))))

(declare-fun b!1242016 () Bool)

(assert (=> b!1242016 (= e!704029 (isStrictlySorted!762 (t!40832 l!644)))))

(assert (= (and d!136583 (not res!828405)) b!1242015))

(assert (= (and b!1242015 res!828406) b!1242016))

(assert (=> b!1242016 m!1144739))

(assert (=> b!1241968 d!136583))

(declare-fun b!1242034 () Bool)

(declare-fun e!704039 () Bool)

(declare-fun tp!92740 () Bool)

(assert (=> b!1242034 (= e!704039 (and tp_is_empty!31283 tp!92740))))

(assert (=> b!1241970 (= tp!92732 e!704039)))

(assert (= (and b!1241970 (is-Cons!27365 (t!40832 l!644))) b!1242034))

(push 1)

