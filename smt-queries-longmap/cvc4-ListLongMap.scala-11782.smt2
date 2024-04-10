; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138408 () Bool)

(assert start!138408)

(declare-fun res!1083332 () Bool)

(declare-fun e!885813 () Bool)

(assert (=> start!138408 (=> (not res!1083332) (not e!885813))))

(declare-datatypes ((B!3036 0))(
  ( (B!3037 (val!19880 Int)) )
))
(declare-datatypes ((tuple2!25928 0))(
  ( (tuple2!25929 (_1!12975 (_ BitVec 64)) (_2!12975 B!3036)) )
))
(declare-datatypes ((List!37000 0))(
  ( (Nil!36997) (Cons!36996 (h!38539 tuple2!25928) (t!51930 List!37000)) )
))
(declare-fun l!636 () List!37000)

(declare-fun isStrictlySorted!1222 (List!37000) Bool)

(assert (=> start!138408 (= res!1083332 (isStrictlySorted!1222 l!636))))

(assert (=> start!138408 e!885813))

(declare-fun e!885812 () Bool)

(assert (=> start!138408 e!885812))

(assert (=> start!138408 true))

(declare-fun b!1586280 () Bool)

(declare-fun res!1083331 () Bool)

(assert (=> b!1586280 (=> (not res!1083331) (not e!885813))))

(declare-fun key!185 () (_ BitVec 64))

(assert (=> b!1586280 (= res!1083331 (and (or (not (is-Cons!36996 l!636)) (not (= (_1!12975 (h!38539 l!636)) key!185))) (or (not (is-Cons!36996 l!636)) (bvsle (_1!12975 (h!38539 l!636)) key!185)) (is-Cons!36996 l!636) (bvslt (_1!12975 (h!38539 l!636)) key!185)))))

(declare-fun b!1586281 () Bool)

(declare-fun ListPrimitiveSize!234 (List!37000) Int)

(assert (=> b!1586281 (= e!885813 (>= (ListPrimitiveSize!234 (t!51930 l!636)) (ListPrimitiveSize!234 l!636)))))

(declare-fun b!1586282 () Bool)

(declare-fun tp_is_empty!39569 () Bool)

(declare-fun tp!115404 () Bool)

(assert (=> b!1586282 (= e!885812 (and tp_is_empty!39569 tp!115404))))

(assert (= (and start!138408 res!1083332) b!1586280))

(assert (= (and b!1586280 res!1083331) b!1586281))

(assert (= (and start!138408 (is-Cons!36996 l!636)) b!1586282))

(declare-fun m!1454715 () Bool)

(assert (=> start!138408 m!1454715))

(declare-fun m!1454717 () Bool)

(assert (=> b!1586281 m!1454717))

(declare-fun m!1454719 () Bool)

(assert (=> b!1586281 m!1454719))

(push 1)

(assert (not start!138408))

(assert (not b!1586281))

(assert (not b!1586282))

(assert tp_is_empty!39569)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167905 () Bool)

(declare-fun res!1083349 () Bool)

(declare-fun e!885844 () Bool)

(assert (=> d!167905 (=> res!1083349 e!885844)))

(assert (=> d!167905 (= res!1083349 (or (is-Nil!36997 l!636) (is-Nil!36997 (t!51930 l!636))))))

(assert (=> d!167905 (= (isStrictlySorted!1222 l!636) e!885844)))

(declare-fun b!1586325 () Bool)

(declare-fun e!885845 () Bool)

(assert (=> b!1586325 (= e!885844 e!885845)))

(declare-fun res!1083350 () Bool)

(assert (=> b!1586325 (=> (not res!1083350) (not e!885845))))

(assert (=> b!1586325 (= res!1083350 (bvslt (_1!12975 (h!38539 l!636)) (_1!12975 (h!38539 (t!51930 l!636)))))))

(declare-fun b!1586326 () Bool)

(assert (=> b!1586326 (= e!885845 (isStrictlySorted!1222 (t!51930 l!636)))))

(assert (= (and d!167905 (not res!1083349)) b!1586325))

(assert (= (and b!1586325 res!1083350) b!1586326))

(declare-fun m!1454729 () Bool)

(assert (=> b!1586326 m!1454729))

(assert (=> start!138408 d!167905))

(declare-fun d!167911 () Bool)

(declare-fun lt!677516 () Int)

(assert (=> d!167911 (>= lt!677516 0)))

(declare-fun e!885848 () Int)

(assert (=> d!167911 (= lt!677516 e!885848)))

(declare-fun c!147053 () Bool)

(assert (=> d!167911 (= c!147053 (is-Nil!36997 (t!51930 l!636)))))

(assert (=> d!167911 (= (ListPrimitiveSize!234 (t!51930 l!636)) lt!677516)))

(declare-fun b!1586331 () Bool)

(assert (=> b!1586331 (= e!885848 0)))

(declare-fun b!1586332 () Bool)

(assert (=> b!1586332 (= e!885848 (+ 1 (ListPrimitiveSize!234 (t!51930 (t!51930 l!636)))))))

(assert (= (and d!167911 c!147053) b!1586331))

(assert (= (and d!167911 (not c!147053)) b!1586332))

(declare-fun m!1454731 () Bool)

(assert (=> b!1586332 m!1454731))

(assert (=> b!1586281 d!167911))

(declare-fun d!167913 () Bool)

(declare-fun lt!677517 () Int)

(assert (=> d!167913 (>= lt!677517 0)))

(declare-fun e!885849 () Int)

(assert (=> d!167913 (= lt!677517 e!885849)))

(declare-fun c!147054 () Bool)

(assert (=> d!167913 (= c!147054 (is-Nil!36997 l!636))))

(assert (=> d!167913 (= (ListPrimitiveSize!234 l!636) lt!677517)))

