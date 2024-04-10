; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103728 () Bool)

(assert start!103728)

(declare-fun b!1241938 () Bool)

(declare-fun e!703983 () Bool)

(declare-fun tp_is_empty!31279 () Bool)

(declare-fun tp!92726 () Bool)

(assert (=> b!1241938 (= e!703983 (and tp_is_empty!31279 tp!92726))))

(declare-fun b!1241939 () Bool)

(declare-fun res!828358 () Bool)

(declare-fun e!703982 () Bool)

(assert (=> b!1241939 (=> (not res!828358) (not e!703982))))

(declare-datatypes ((B!1880 0))(
  ( (B!1881 (val!15702 Int)) )
))
(declare-datatypes ((tuple2!20276 0))(
  ( (tuple2!20277 (_1!10149 (_ BitVec 64)) (_2!10149 B!1880)) )
))
(declare-datatypes ((List!27367 0))(
  ( (Nil!27364) (Cons!27363 (h!28572 tuple2!20276) (t!40830 List!27367)) )
))
(declare-fun l!644 () List!27367)

(declare-fun isStrictlySorted!760 (List!27367) Bool)

(assert (=> b!1241939 (= res!828358 (isStrictlySorted!760 (t!40830 l!644)))))

(declare-fun b!1241940 () Bool)

(declare-fun ListPrimitiveSize!148 (List!27367) Int)

(assert (=> b!1241940 (= e!703982 (>= (ListPrimitiveSize!148 (t!40830 l!644)) (ListPrimitiveSize!148 l!644)))))

(declare-fun res!828356 () Bool)

(assert (=> start!103728 (=> (not res!828356) (not e!703982))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103728 (= res!828356 (not (= key1!25 key2!15)))))

(assert (=> start!103728 e!703982))

(assert (=> start!103728 true))

(assert (=> start!103728 e!703983))

(declare-fun b!1241941 () Bool)

(declare-fun res!828355 () Bool)

(assert (=> b!1241941 (=> (not res!828355) (not e!703982))))

(assert (=> b!1241941 (= res!828355 (isStrictlySorted!760 l!644))))

(declare-fun b!1241942 () Bool)

(declare-fun res!828357 () Bool)

(assert (=> b!1241942 (=> (not res!828357) (not e!703982))))

(assert (=> b!1241942 (= res!828357 (is-Cons!27363 l!644))))

(assert (= (and start!103728 res!828356) b!1241941))

(assert (= (and b!1241941 res!828355) b!1241942))

(assert (= (and b!1241942 res!828357) b!1241939))

(assert (= (and b!1241939 res!828358) b!1241940))

(assert (= (and start!103728 (is-Cons!27363 l!644)) b!1241938))

(declare-fun m!1144717 () Bool)

(assert (=> b!1241939 m!1144717))

(declare-fun m!1144719 () Bool)

(assert (=> b!1241940 m!1144719))

(declare-fun m!1144721 () Bool)

(assert (=> b!1241940 m!1144721))

(declare-fun m!1144723 () Bool)

(assert (=> b!1241941 m!1144723))

(push 1)

(assert (not b!1241938))

(assert (not b!1241941))

(assert (not b!1241939))

(assert (not b!1241940))

(assert tp_is_empty!31279)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136567 () Bool)

(declare-fun res!828393 () Bool)

(declare-fun e!704010 () Bool)

(assert (=> d!136567 (=> res!828393 e!704010)))

(assert (=> d!136567 (= res!828393 (or (is-Nil!27364 l!644) (is-Nil!27364 (t!40830 l!644))))))

(assert (=> d!136567 (= (isStrictlySorted!760 l!644) e!704010)))

(declare-fun b!1241991 () Bool)

(declare-fun e!704011 () Bool)

(assert (=> b!1241991 (= e!704010 e!704011)))

(declare-fun res!828394 () Bool)

(assert (=> b!1241991 (=> (not res!828394) (not e!704011))))

(assert (=> b!1241991 (= res!828394 (bvslt (_1!10149 (h!28572 l!644)) (_1!10149 (h!28572 (t!40830 l!644)))))))

(declare-fun b!1241992 () Bool)

(assert (=> b!1241992 (= e!704011 (isStrictlySorted!760 (t!40830 l!644)))))

(assert (= (and d!136567 (not res!828393)) b!1241991))

(assert (= (and b!1241991 res!828394) b!1241992))

(assert (=> b!1241992 m!1144717))

(assert (=> b!1241941 d!136567))

(declare-fun d!136575 () Bool)

(declare-fun res!828395 () Bool)

(declare-fun e!704012 () Bool)

(assert (=> d!136575 (=> res!828395 e!704012)))

(assert (=> d!136575 (= res!828395 (or (is-Nil!27364 (t!40830 l!644)) (is-Nil!27364 (t!40830 (t!40830 l!644)))))))

(assert (=> d!136575 (= (isStrictlySorted!760 (t!40830 l!644)) e!704012)))

(declare-fun b!1241996 () Bool)

(declare-fun e!704014 () Bool)

(assert (=> b!1241996 (= e!704012 e!704014)))

(declare-fun res!828396 () Bool)

(assert (=> b!1241996 (=> (not res!828396) (not e!704014))))

(assert (=> b!1241996 (= res!828396 (bvslt (_1!10149 (h!28572 (t!40830 l!644))) (_1!10149 (h!28572 (t!40830 (t!40830 l!644))))))))

(declare-fun b!1241998 () Bool)

(assert (=> b!1241998 (= e!704014 (isStrictlySorted!760 (t!40830 (t!40830 l!644))))))

(assert (= (and d!136575 (not res!828395)) b!1241996))

(assert (= (and b!1241996 res!828396) b!1241998))

(declare-fun m!1144743 () Bool)

(assert (=> b!1241998 m!1144743))

(assert (=> b!1241939 d!136575))

(declare-fun d!136577 () Bool)

(declare-fun lt!562180 () Int)

(assert (=> d!136577 (>= lt!562180 0)))

(declare-fun e!704032 () Int)

(assert (=> d!136577 (= lt!562180 e!704032)))

(declare-fun c!121524 () Bool)

(assert (=> d!136577 (= c!121524 (is-Nil!27364 (t!40830 l!644)))))

(assert (=> d!136577 (= (ListPrimitiveSize!148 (t!40830 l!644)) lt!562180)))

(declare-fun b!1242021 () Bool)

(assert (=> b!1242021 (= e!704032 0)))

(declare-fun b!1242022 () Bool)

(assert (=> b!1242022 (= e!704032 (+ 1 (ListPrimitiveSize!148 (t!40830 (t!40830 l!644)))))))

(assert (= (and d!136577 c!121524) b!1242021))

(assert (= (and d!136577 (not c!121524)) b!1242022))

(declare-fun m!1144751 () Bool)

(assert (=> b!1242022 m!1144751))

(assert (=> b!1241940 d!136577))

(declare-fun d!136585 () Bool)

(declare-fun lt!562181 () Int)

(assert (=> d!136585 (>= lt!562181 0)))

(declare-fun e!704035 () Int)

(assert (=> d!136585 (= lt!562181 e!704035)))

(declare-fun c!121525 () Bool)

(assert (=> d!136585 (= c!121525 (is-Nil!27364 l!644))))

(assert (=> d!136585 (= (ListPrimitiveSize!148 l!644) lt!562181)))

(declare-fun b!1242027 () Bool)

(assert (=> b!1242027 (= e!704035 0)))

(declare-fun b!1242028 () Bool)

(assert (=> b!1242028 (= e!704035 (+ 1 (ListPrimitiveSize!148 (t!40830 l!644))))))

(assert (= (and d!136585 c!121525) b!1242027))

(assert (= (and d!136585 (not c!121525)) b!1242028))

(assert (=> b!1242028 m!1144719))

(assert (=> b!1241940 d!136585))

(declare-fun b!1242035 () Bool)

(declare-fun e!704040 () Bool)

(declare-fun tp!92741 () Bool)

(assert (=> b!1242035 (= e!704040 (and tp_is_empty!31279 tp!92741))))

(assert (=> b!1241938 (= tp!92726 e!704040)))

(assert (= (and b!1241938 (is-Cons!27363 (t!40830 l!644))) b!1242035))

(push 1)

