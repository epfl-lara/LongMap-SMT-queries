; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103696 () Bool)

(assert start!103696)

(declare-fun res!828276 () Bool)

(declare-fun e!703880 () Bool)

(assert (=> start!103696 (=> (not res!828276) (not e!703880))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103696 (= res!828276 (not (= key1!25 key2!15)))))

(assert (=> start!103696 e!703880))

(assert (=> start!103696 true))

(declare-fun e!703881 () Bool)

(assert (=> start!103696 e!703881))

(declare-fun b!1241790 () Bool)

(declare-fun res!828277 () Bool)

(assert (=> b!1241790 (=> (not res!828277) (not e!703880))))

(declare-datatypes ((B!1866 0))(
  ( (B!1867 (val!15695 Int)) )
))
(declare-datatypes ((tuple2!20262 0))(
  ( (tuple2!20263 (_1!10142 (_ BitVec 64)) (_2!10142 B!1866)) )
))
(declare-datatypes ((List!27360 0))(
  ( (Nil!27357) (Cons!27356 (h!28565 tuple2!20262) (t!40823 List!27360)) )
))
(declare-fun l!644 () List!27360)

(declare-fun isStrictlySorted!756 (List!27360) Bool)

(assert (=> b!1241790 (= res!828277 (isStrictlySorted!756 l!644))))

(declare-fun b!1241791 () Bool)

(declare-fun ListPrimitiveSize!147 (List!27360) Int)

(assert (=> b!1241791 (= e!703880 (< (ListPrimitiveSize!147 l!644) 0))))

(declare-fun b!1241792 () Bool)

(declare-fun tp_is_empty!31265 () Bool)

(declare-fun tp!92687 () Bool)

(assert (=> b!1241792 (= e!703881 (and tp_is_empty!31265 tp!92687))))

(assert (= (and start!103696 res!828276) b!1241790))

(assert (= (and b!1241790 res!828277) b!1241791))

(assert (= (and start!103696 (is-Cons!27356 l!644)) b!1241792))

(declare-fun m!1144683 () Bool)

(assert (=> b!1241790 m!1144683))

(declare-fun m!1144685 () Bool)

(assert (=> b!1241791 m!1144685))

(push 1)

(assert (not b!1241790))

(assert (not b!1241791))

(assert (not b!1241792))

(assert tp_is_empty!31265)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136533 () Bool)

(declare-fun res!828282 () Bool)

(declare-fun e!703886 () Bool)

(assert (=> d!136533 (=> res!828282 e!703886)))

(assert (=> d!136533 (= res!828282 (or (is-Nil!27357 l!644) (is-Nil!27357 (t!40823 l!644))))))

(assert (=> d!136533 (= (isStrictlySorted!756 l!644) e!703886)))

(declare-fun b!1241797 () Bool)

(declare-fun e!703887 () Bool)

(assert (=> b!1241797 (= e!703886 e!703887)))

(declare-fun res!828283 () Bool)

(assert (=> b!1241797 (=> (not res!828283) (not e!703887))))

(assert (=> b!1241797 (= res!828283 (bvslt (_1!10142 (h!28565 l!644)) (_1!10142 (h!28565 (t!40823 l!644)))))))

(declare-fun b!1241798 () Bool)

(assert (=> b!1241798 (= e!703887 (isStrictlySorted!756 (t!40823 l!644)))))

(assert (= (and d!136533 (not res!828282)) b!1241797))

(assert (= (and b!1241797 res!828283) b!1241798))

(declare-fun m!1144687 () Bool)

(assert (=> b!1241798 m!1144687))

(assert (=> b!1241790 d!136533))

(declare-fun d!136539 () Bool)

(declare-fun lt!562165 () Int)

(assert (=> d!136539 (>= lt!562165 0)))

(declare-fun e!703898 () Int)

(assert (=> d!136539 (= lt!562165 e!703898)))

(declare-fun c!121509 () Bool)

(assert (=> d!136539 (= c!121509 (is-Nil!27357 l!644))))

(assert (=> d!136539 (= (ListPrimitiveSize!147 l!644) lt!562165)))

(declare-fun b!1241813 () Bool)

(assert (=> b!1241813 (= e!703898 0)))

(declare-fun b!1241814 () Bool)

(assert (=> b!1241814 (= e!703898 (+ 1 (ListPrimitiveSize!147 (t!40823 l!644))))))

(assert (= (and d!136539 c!121509) b!1241813))

(assert (= (and d!136539 (not c!121509)) b!1241814))

(declare-fun m!1144691 () Bool)

(assert (=> b!1241814 m!1144691))

(assert (=> b!1241791 d!136539))

(declare-fun b!1241819 () Bool)

(declare-fun e!703901 () Bool)

(declare-fun tp!92690 () Bool)

(assert (=> b!1241819 (= e!703901 (and tp_is_empty!31265 tp!92690))))

(assert (=> b!1241792 (= tp!92687 e!703901)))

(assert (= (and b!1241792 (is-Cons!27356 (t!40823 l!644))) b!1241819))

(push 1)

(assert (not b!1241798))

(assert (not b!1241814))

(assert (not b!1241819))

(assert tp_is_empty!31265)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

