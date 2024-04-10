; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103692 () Bool)

(assert start!103692)

(declare-fun res!828265 () Bool)

(declare-fun e!703868 () Bool)

(assert (=> start!103692 (=> (not res!828265) (not e!703868))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103692 (= res!828265 (not (= key1!25 key2!15)))))

(assert (=> start!103692 e!703868))

(assert (=> start!103692 true))

(declare-fun e!703869 () Bool)

(assert (=> start!103692 e!703869))

(declare-fun b!1241772 () Bool)

(declare-fun res!828264 () Bool)

(assert (=> b!1241772 (=> (not res!828264) (not e!703868))))

(declare-datatypes ((B!1862 0))(
  ( (B!1863 (val!15693 Int)) )
))
(declare-datatypes ((tuple2!20258 0))(
  ( (tuple2!20259 (_1!10140 (_ BitVec 64)) (_2!10140 B!1862)) )
))
(declare-datatypes ((List!27358 0))(
  ( (Nil!27355) (Cons!27354 (h!28563 tuple2!20258) (t!40821 List!27358)) )
))
(declare-fun l!644 () List!27358)

(declare-fun isStrictlySorted!754 (List!27358) Bool)

(assert (=> b!1241772 (= res!828264 (isStrictlySorted!754 l!644))))

(declare-fun b!1241773 () Bool)

(declare-fun ListPrimitiveSize!145 (List!27358) Int)

(assert (=> b!1241773 (= e!703868 (< (ListPrimitiveSize!145 l!644) 0))))

(declare-fun b!1241774 () Bool)

(declare-fun tp_is_empty!31261 () Bool)

(declare-fun tp!92681 () Bool)

(assert (=> b!1241774 (= e!703869 (and tp_is_empty!31261 tp!92681))))

(assert (= (and start!103692 res!828265) b!1241772))

(assert (= (and b!1241772 res!828264) b!1241773))

(assert (= (and start!103692 (is-Cons!27354 l!644)) b!1241774))

(declare-fun m!1144675 () Bool)

(assert (=> b!1241772 m!1144675))

(declare-fun m!1144677 () Bool)

(assert (=> b!1241773 m!1144677))

(push 1)

(assert (not b!1241772))

(assert (not b!1241773))

(assert (not b!1241774))

(assert tp_is_empty!31261)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136537 () Bool)

(declare-fun res!828288 () Bool)

(declare-fun e!703896 () Bool)

(assert (=> d!136537 (=> res!828288 e!703896)))

(assert (=> d!136537 (= res!828288 (or (is-Nil!27355 l!644) (is-Nil!27355 (t!40821 l!644))))))

(assert (=> d!136537 (= (isStrictlySorted!754 l!644) e!703896)))

(declare-fun b!1241811 () Bool)

(declare-fun e!703897 () Bool)

(assert (=> b!1241811 (= e!703896 e!703897)))

(declare-fun res!828289 () Bool)

(assert (=> b!1241811 (=> (not res!828289) (not e!703897))))

(assert (=> b!1241811 (= res!828289 (bvslt (_1!10140 (h!28563 l!644)) (_1!10140 (h!28563 (t!40821 l!644)))))))

(declare-fun b!1241812 () Bool)

(assert (=> b!1241812 (= e!703897 (isStrictlySorted!754 (t!40821 l!644)))))

(assert (= (and d!136537 (not res!828288)) b!1241811))

(assert (= (and b!1241811 res!828289) b!1241812))

(declare-fun m!1144689 () Bool)

(assert (=> b!1241812 m!1144689))

(assert (=> b!1241772 d!136537))

(declare-fun d!136541 () Bool)

(declare-fun lt!562169 () Int)

(assert (=> d!136541 (>= lt!562169 0)))

(declare-fun e!703905 () Int)

(assert (=> d!136541 (= lt!562169 e!703905)))

(declare-fun c!121513 () Bool)

(assert (=> d!136541 (= c!121513 (is-Nil!27355 l!644))))

(assert (=> d!136541 (= (ListPrimitiveSize!145 l!644) lt!562169)))

(declare-fun b!1241826 () Bool)

(assert (=> b!1241826 (= e!703905 0)))

(declare-fun b!1241827 () Bool)

(assert (=> b!1241827 (= e!703905 (+ 1 (ListPrimitiveSize!145 (t!40821 l!644))))))

(assert (= (and d!136541 c!121513) b!1241826))

(assert (= (and d!136541 (not c!121513)) b!1241827))

(declare-fun m!1144693 () Bool)

(assert (=> b!1241827 m!1144693))

(assert (=> b!1241773 d!136541))

(declare-fun b!1241832 () Bool)

(declare-fun e!703908 () Bool)

(declare-fun tp!92693 () Bool)

(assert (=> b!1241832 (= e!703908 (and tp_is_empty!31261 tp!92693))))

(assert (=> b!1241774 (= tp!92681 e!703908)))

(assert (= (and b!1241774 (is-Cons!27354 (t!40821 l!644))) b!1241832))

(push 1)

(assert (not b!1241827))

(assert (not b!1241812))

(assert (not b!1241832))

(assert tp_is_empty!31261)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

