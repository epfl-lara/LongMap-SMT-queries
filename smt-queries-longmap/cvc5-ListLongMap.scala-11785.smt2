; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138440 () Bool)

(assert start!138440)

(declare-fun res!1083362 () Bool)

(declare-fun e!885902 () Bool)

(assert (=> start!138440 (=> (not res!1083362) (not e!885902))))

(declare-datatypes ((B!3050 0))(
  ( (B!3051 (val!19887 Int)) )
))
(declare-datatypes ((tuple2!25942 0))(
  ( (tuple2!25943 (_1!12982 (_ BitVec 64)) (_2!12982 B!3050)) )
))
(declare-datatypes ((List!37007 0))(
  ( (Nil!37004) (Cons!37003 (h!38546 tuple2!25942) (t!51937 List!37007)) )
))
(declare-fun l!628 () List!37007)

(assert (=> start!138440 (= res!1083362 (and (not (is-Nil!37004 l!628)) (not (is-Nil!37004 (t!51937 l!628))) (bvslt (_1!12982 (h!38546 l!628)) (_1!12982 (h!38546 (t!51937 l!628))))))))

(assert (=> start!138440 e!885902))

(declare-fun e!885903 () Bool)

(assert (=> start!138440 e!885903))

(declare-fun b!1586404 () Bool)

(declare-fun ListPrimitiveSize!238 (List!37007) Int)

(assert (=> b!1586404 (= e!885902 (>= (ListPrimitiveSize!238 (t!51937 l!628)) (ListPrimitiveSize!238 l!628)))))

(declare-fun b!1586405 () Bool)

(declare-fun tp_is_empty!39583 () Bool)

(declare-fun tp!115443 () Bool)

(assert (=> b!1586405 (= e!885903 (and tp_is_empty!39583 tp!115443))))

(assert (= (and start!138440 res!1083362) b!1586404))

(assert (= (and start!138440 (is-Cons!37003 l!628)) b!1586405))

(declare-fun m!1454751 () Bool)

(assert (=> b!1586404 m!1454751))

(declare-fun m!1454753 () Bool)

(assert (=> b!1586404 m!1454753))

(push 1)

(assert (not b!1586404))

(assert (not b!1586405))

(assert tp_is_empty!39583)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167931 () Bool)

(declare-fun lt!677533 () Int)

(assert (=> d!167931 (>= lt!677533 0)))

(declare-fun e!885925 () Int)

(assert (=> d!167931 (= lt!677533 e!885925)))

(declare-fun c!147070 () Bool)

(assert (=> d!167931 (= c!147070 (is-Nil!37004 (t!51937 l!628)))))

(assert (=> d!167931 (= (ListPrimitiveSize!238 (t!51937 l!628)) lt!677533)))

(declare-fun b!1586435 () Bool)

(assert (=> b!1586435 (= e!885925 0)))

(declare-fun b!1586436 () Bool)

(assert (=> b!1586436 (= e!885925 (+ 1 (ListPrimitiveSize!238 (t!51937 (t!51937 l!628)))))))

(assert (= (and d!167931 c!147070) b!1586435))

(assert (= (and d!167931 (not c!147070)) b!1586436))

(declare-fun m!1454765 () Bool)

(assert (=> b!1586436 m!1454765))

(assert (=> b!1586404 d!167931))

(declare-fun d!167933 () Bool)

(declare-fun lt!677534 () Int)

(assert (=> d!167933 (>= lt!677534 0)))

(declare-fun e!885926 () Int)

(assert (=> d!167933 (= lt!677534 e!885926)))

(declare-fun c!147071 () Bool)

(assert (=> d!167933 (= c!147071 (is-Nil!37004 l!628))))

(assert (=> d!167933 (= (ListPrimitiveSize!238 l!628) lt!677534)))

(declare-fun b!1586437 () Bool)

(assert (=> b!1586437 (= e!885926 0)))

(declare-fun b!1586438 () Bool)

(assert (=> b!1586438 (= e!885926 (+ 1 (ListPrimitiveSize!238 (t!51937 l!628))))))

(assert (= (and d!167933 c!147071) b!1586437))

(assert (= (and d!167933 (not c!147071)) b!1586438))

(assert (=> b!1586438 m!1454751))

(assert (=> b!1586404 d!167933))

(declare-fun b!1586443 () Bool)

(declare-fun e!885929 () Bool)

