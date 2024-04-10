; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138432 () Bool)

(assert start!138432)

(declare-datatypes ((B!3048 0))(
  ( (B!3049 (val!19886 Int)) )
))
(declare-datatypes ((tuple2!25940 0))(
  ( (tuple2!25941 (_1!12981 (_ BitVec 64)) (_2!12981 B!3048)) )
))
(declare-datatypes ((List!37006 0))(
  ( (Nil!37003) (Cons!37002 (h!38545 tuple2!25940) (t!51936 List!37006)) )
))
(declare-fun l!628 () List!37006)

(declare-fun ListPrimitiveSize!237 (List!37006) Int)

(assert (=> start!138432 (< (ListPrimitiveSize!237 l!628) 0)))

(declare-fun e!885879 () Bool)

(assert (=> start!138432 e!885879))

(declare-fun b!1586366 () Bool)

(declare-fun tp_is_empty!39581 () Bool)

(declare-fun tp!115431 () Bool)

(assert (=> b!1586366 (= e!885879 (and tp_is_empty!39581 tp!115431))))

(assert (= (and start!138432 (is-Cons!37002 l!628)) b!1586366))

(declare-fun m!1454743 () Bool)

(assert (=> start!138432 m!1454743))

(push 1)

(assert (not start!138432))

(assert (not b!1586366))

(assert tp_is_empty!39581)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167923 () Bool)

(declare-fun lt!677525 () Int)

(assert (=> d!167923 (>= lt!677525 0)))

(declare-fun e!885887 () Int)

(assert (=> d!167923 (= lt!677525 e!885887)))

(declare-fun c!147062 () Bool)

(assert (=> d!167923 (= c!147062 (is-Nil!37003 l!628))))

(assert (=> d!167923 (= (ListPrimitiveSize!237 l!628) lt!677525)))

(declare-fun b!1586381 () Bool)

(assert (=> b!1586381 (= e!885887 0)))

(declare-fun b!1586382 () Bool)

(assert (=> b!1586382 (= e!885887 (+ 1 (ListPrimitiveSize!237 (t!51936 l!628))))))

(assert (= (and d!167923 c!147062) b!1586381))

(assert (= (and d!167923 (not c!147062)) b!1586382))

(declare-fun m!1454747 () Bool)

(assert (=> b!1586382 m!1454747))

(assert (=> start!138432 d!167923))

(declare-fun b!1586394 () Bool)

(declare-fun e!885894 () Bool)

(declare-fun tp!115437 () Bool)

(assert (=> b!1586394 (= e!885894 (and tp_is_empty!39581 tp!115437))))

(assert (=> b!1586366 (= tp!115431 e!885894)))

(assert (= (and b!1586366 (is-Cons!37002 (t!51936 l!628))) b!1586394))

(push 1)

