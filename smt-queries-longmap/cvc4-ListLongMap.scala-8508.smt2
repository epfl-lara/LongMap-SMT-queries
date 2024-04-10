; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103720 () Bool)

(assert start!103720)

(declare-fun b!1241885 () Bool)

(declare-fun res!828320 () Bool)

(declare-fun e!703943 () Bool)

(assert (=> b!1241885 (=> (not res!828320) (not e!703943))))

(declare-datatypes ((B!1878 0))(
  ( (B!1879 (val!15701 Int)) )
))
(declare-datatypes ((tuple2!20274 0))(
  ( (tuple2!20275 (_1!10148 (_ BitVec 64)) (_2!10148 B!1878)) )
))
(declare-datatypes ((List!27366 0))(
  ( (Nil!27363) (Cons!27362 (h!28571 tuple2!20274) (t!40829 List!27366)) )
))
(declare-fun l!644 () List!27366)

(declare-fun isStrictlySorted!759 (List!27366) Bool)

(assert (=> b!1241885 (= res!828320 (isStrictlySorted!759 l!644))))

(declare-fun res!828322 () Bool)

(assert (=> start!103720 (=> (not res!828322) (not e!703943))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103720 (= res!828322 (not (= key1!25 key2!15)))))

(assert (=> start!103720 e!703943))

(assert (=> start!103720 true))

(declare-fun e!703944 () Bool)

(assert (=> start!103720 e!703944))

(declare-fun b!1241886 () Bool)

(declare-fun res!828321 () Bool)

(assert (=> b!1241886 (=> (not res!828321) (not e!703943))))

(assert (=> b!1241886 (= res!828321 (is-Cons!27362 l!644))))

(declare-fun b!1241888 () Bool)

(declare-fun tp_is_empty!31277 () Bool)

(declare-fun tp!92714 () Bool)

(assert (=> b!1241888 (= e!703944 (and tp_is_empty!31277 tp!92714))))

(declare-fun b!1241887 () Bool)

(assert (=> b!1241887 (= e!703943 (not (isStrictlySorted!759 (t!40829 l!644))))))

(assert (= (and start!103720 res!828322) b!1241885))

(assert (= (and b!1241885 res!828320) b!1241886))

(assert (= (and b!1241886 res!828321) b!1241887))

(assert (= (and start!103720 (is-Cons!27362 l!644)) b!1241888))

(declare-fun m!1144707 () Bool)

(assert (=> b!1241885 m!1144707))

(declare-fun m!1144709 () Bool)

(assert (=> b!1241887 m!1144709))

(push 1)

(assert (not b!1241885))

(assert (not b!1241887))

(assert (not b!1241888))

(assert tp_is_empty!31277)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136549 () Bool)

(declare-fun res!828333 () Bool)

(declare-fun e!703955 () Bool)

(assert (=> d!136549 (=> res!828333 e!703955)))

(assert (=> d!136549 (= res!828333 (or (is-Nil!27363 l!644) (is-Nil!27363 (t!40829 l!644))))))

(assert (=> d!136549 (= (isStrictlySorted!759 l!644) e!703955)))

(declare-fun b!1241901 () Bool)

(declare-fun e!703958 () Bool)

(assert (=> b!1241901 (= e!703955 e!703958)))

(declare-fun res!828336 () Bool)

(assert (=> b!1241901 (=> (not res!828336) (not e!703958))))

(assert (=> b!1241901 (= res!828336 (bvslt (_1!10148 (h!28571 l!644)) (_1!10148 (h!28571 (t!40829 l!644)))))))

(declare-fun b!1241902 () Bool)

(assert (=> b!1241902 (= e!703958 (isStrictlySorted!759 (t!40829 l!644)))))

(assert (= (and d!136549 (not res!828333)) b!1241901))

(assert (= (and b!1241901 res!828336) b!1241902))

(assert (=> b!1241902 m!1144709))

(assert (=> b!1241885 d!136549))

(declare-fun d!136556 () Bool)

(declare-fun res!828339 () Bool)

(declare-fun e!703961 () Bool)

(assert (=> d!136556 (=> res!828339 e!703961)))

(assert (=> d!136556 (= res!828339 (or (is-Nil!27363 (t!40829 l!644)) (is-Nil!27363 (t!40829 (t!40829 l!644)))))))

(assert (=> d!136556 (= (isStrictlySorted!759 (t!40829 l!644)) e!703961)))

(declare-fun b!1241905 () Bool)

(declare-fun e!703963 () Bool)

(assert (=> b!1241905 (= e!703961 e!703963)))

(declare-fun res!828341 () Bool)

(assert (=> b!1241905 (=> (not res!828341) (not e!703963))))

(assert (=> b!1241905 (= res!828341 (bvslt (_1!10148 (h!28571 (t!40829 l!644))) (_1!10148 (h!28571 (t!40829 (t!40829 l!644))))))))

(declare-fun b!1241907 () Bool)

(assert (=> b!1241907 (= e!703963 (isStrictlySorted!759 (t!40829 (t!40829 l!644))))))

(assert (= (and d!136556 (not res!828339)) b!1241905))

(assert (= (and b!1241905 res!828341) b!1241907))

(declare-fun m!1144713 () Bool)

(assert (=> b!1241907 m!1144713))

(assert (=> b!1241887 d!136556))

(declare-fun b!1241919 () Bool)

(declare-fun e!703971 () Bool)

(declare-fun tp!92719 () Bool)

(assert (=> b!1241919 (= e!703971 (and tp_is_empty!31277 tp!92719))))

