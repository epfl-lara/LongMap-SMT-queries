; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103716 () Bool)

(assert start!103716)

(declare-fun res!828304 () Bool)

(declare-fun e!703932 () Bool)

(assert (=> start!103716 (=> (not res!828304) (not e!703932))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103716 (= res!828304 (not (= key1!25 key2!15)))))

(assert (=> start!103716 e!703932))

(assert (=> start!103716 true))

(declare-fun e!703931 () Bool)

(assert (=> start!103716 e!703931))

(declare-fun b!1241864 () Bool)

(declare-fun tp_is_empty!31273 () Bool)

(declare-fun tp!92708 () Bool)

(assert (=> b!1241864 (= e!703931 (and tp_is_empty!31273 tp!92708))))

(declare-fun b!1241863 () Bool)

(declare-datatypes ((B!1874 0))(
  ( (B!1875 (val!15699 Int)) )
))
(declare-datatypes ((tuple2!20270 0))(
  ( (tuple2!20271 (_1!10146 (_ BitVec 64)) (_2!10146 B!1874)) )
))
(declare-datatypes ((List!27364 0))(
  ( (Nil!27361) (Cons!27360 (h!28569 tuple2!20270) (t!40827 List!27364)) )
))
(declare-fun l!644 () List!27364)

(declare-fun isStrictlySorted!757 (List!27364) Bool)

(assert (=> b!1241863 (= e!703932 (not (isStrictlySorted!757 (t!40827 l!644))))))

(declare-fun b!1241862 () Bool)

(declare-fun res!828303 () Bool)

(assert (=> b!1241862 (=> (not res!828303) (not e!703932))))

(assert (=> b!1241862 (= res!828303 (is-Cons!27360 l!644))))

(declare-fun b!1241861 () Bool)

(declare-fun res!828302 () Bool)

(assert (=> b!1241861 (=> (not res!828302) (not e!703932))))

(assert (=> b!1241861 (= res!828302 (isStrictlySorted!757 l!644))))

(assert (= (and start!103716 res!828304) b!1241861))

(assert (= (and b!1241861 res!828302) b!1241862))

(assert (= (and b!1241862 res!828303) b!1241863))

(assert (= (and start!103716 (is-Cons!27360 l!644)) b!1241864))

(declare-fun m!1144699 () Bool)

(assert (=> b!1241863 m!1144699))

(declare-fun m!1144701 () Bool)

(assert (=> b!1241861 m!1144701))

(push 1)

(assert (not b!1241861))

(assert (not b!1241863))

(assert (not b!1241864))

(assert tp_is_empty!31273)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136553 () Bool)

(declare-fun res!828343 () Bool)

(declare-fun e!703969 () Bool)

(assert (=> d!136553 (=> res!828343 e!703969)))

(assert (=> d!136553 (= res!828343 (or (is-Nil!27361 l!644) (is-Nil!27361 (t!40827 l!644))))))

(assert (=> d!136553 (= (isStrictlySorted!757 l!644) e!703969)))

(declare-fun b!1241917 () Bool)

(declare-fun e!703970 () Bool)

(assert (=> b!1241917 (= e!703969 e!703970)))

(declare-fun res!828344 () Bool)

(assert (=> b!1241917 (=> (not res!828344) (not e!703970))))

(assert (=> b!1241917 (= res!828344 (bvslt (_1!10146 (h!28569 l!644)) (_1!10146 (h!28569 (t!40827 l!644)))))))

(declare-fun b!1241918 () Bool)

(assert (=> b!1241918 (= e!703970 (isStrictlySorted!757 (t!40827 l!644)))))

(assert (= (and d!136553 (not res!828343)) b!1241917))

(assert (= (and b!1241917 res!828344) b!1241918))

(assert (=> b!1241918 m!1144699))

(assert (=> b!1241861 d!136553))

(declare-fun d!136559 () Bool)

(declare-fun res!828345 () Bool)

(declare-fun e!703973 () Bool)

(assert (=> d!136559 (=> res!828345 e!703973)))

(assert (=> d!136559 (= res!828345 (or (is-Nil!27361 (t!40827 l!644)) (is-Nil!27361 (t!40827 (t!40827 l!644)))))))

(assert (=> d!136559 (= (isStrictlySorted!757 (t!40827 l!644)) e!703973)))

(declare-fun b!1241921 () Bool)

(declare-fun e!703974 () Bool)

(assert (=> b!1241921 (= e!703973 e!703974)))

(declare-fun res!828346 () Bool)

(assert (=> b!1241921 (=> (not res!828346) (not e!703974))))

(assert (=> b!1241921 (= res!828346 (bvslt (_1!10146 (h!28569 (t!40827 l!644))) (_1!10146 (h!28569 (t!40827 (t!40827 l!644))))))))

(declare-fun b!1241922 () Bool)

(assert (=> b!1241922 (= e!703974 (isStrictlySorted!757 (t!40827 (t!40827 l!644))))))

(assert (= (and d!136559 (not res!828345)) b!1241921))

(assert (= (and b!1241921 res!828346) b!1241922))

(declare-fun m!1144715 () Bool)

(assert (=> b!1241922 m!1144715))

(assert (=> b!1241863 d!136559))

(declare-fun b!1241927 () Bool)

(declare-fun e!703977 () Bool)

(declare-fun tp!92723 () Bool)

(assert (=> b!1241927 (= e!703977 (and tp_is_empty!31273 tp!92723))))

(assert (=> b!1241864 (= tp!92708 e!703977)))

(assert (= (and b!1241864 (is-Cons!27360 (t!40827 l!644))) b!1241927))

(push 1)

