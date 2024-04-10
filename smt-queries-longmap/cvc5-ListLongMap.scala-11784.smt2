; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138428 () Bool)

(assert start!138428)

(declare-datatypes ((B!3044 0))(
  ( (B!3045 (val!19884 Int)) )
))
(declare-datatypes ((tuple2!25936 0))(
  ( (tuple2!25937 (_1!12979 (_ BitVec 64)) (_2!12979 B!3044)) )
))
(declare-datatypes ((List!37004 0))(
  ( (Nil!37001) (Cons!37000 (h!38543 tuple2!25936) (t!51934 List!37004)) )
))
(declare-fun l!628 () List!37004)

(declare-fun ListPrimitiveSize!235 (List!37004) Int)

(assert (=> start!138428 (< (ListPrimitiveSize!235 l!628) 0)))

(declare-fun e!885873 () Bool)

(assert (=> start!138428 e!885873))

(declare-fun b!1586360 () Bool)

(declare-fun tp_is_empty!39577 () Bool)

(declare-fun tp!115425 () Bool)

(assert (=> b!1586360 (= e!885873 (and tp_is_empty!39577 tp!115425))))

(assert (= (and start!138428 (is-Cons!37000 l!628)) b!1586360))

(declare-fun m!1454739 () Bool)

(assert (=> start!138428 m!1454739))

(push 1)

(assert (not start!138428))

(assert (not b!1586360))

(assert tp_is_empty!39577)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167921 () Bool)

(declare-fun lt!677524 () Int)

(assert (=> d!167921 (>= lt!677524 0)))

(declare-fun e!885886 () Int)

(assert (=> d!167921 (= lt!677524 e!885886)))

(declare-fun c!147061 () Bool)

(assert (=> d!167921 (= c!147061 (is-Nil!37001 l!628))))

(assert (=> d!167921 (= (ListPrimitiveSize!235 l!628) lt!677524)))

(declare-fun b!1586379 () Bool)

(assert (=> b!1586379 (= e!885886 0)))

(declare-fun b!1586380 () Bool)

(assert (=> b!1586380 (= e!885886 (+ 1 (ListPrimitiveSize!235 (t!51934 l!628))))))

(assert (= (and d!167921 c!147061) b!1586379))

(assert (= (and d!167921 (not c!147061)) b!1586380))

(declare-fun m!1454745 () Bool)

(assert (=> b!1586380 m!1454745))

(assert (=> start!138428 d!167921))

(declare-fun b!1586393 () Bool)

(declare-fun e!885893 () Bool)

(declare-fun tp!115436 () Bool)

(assert (=> b!1586393 (= e!885893 (and tp_is_empty!39577 tp!115436))))

(assert (=> b!1586360 (= tp!115425 e!885893)))

(assert (= (and b!1586360 (is-Cons!37000 (t!51934 l!628))) b!1586393))

(push 1)

(assert (not b!1586380))

(assert (not b!1586393))

(assert tp_is_empty!39577)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

