; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138444 () Bool)

(assert start!138444)

(declare-fun res!1083368 () Bool)

(declare-fun e!885914 () Bool)

(assert (=> start!138444 (=> (not res!1083368) (not e!885914))))

(declare-datatypes ((B!3054 0))(
  ( (B!3055 (val!19889 Int)) )
))
(declare-datatypes ((tuple2!25946 0))(
  ( (tuple2!25947 (_1!12984 (_ BitVec 64)) (_2!12984 B!3054)) )
))
(declare-datatypes ((List!37009 0))(
  ( (Nil!37006) (Cons!37005 (h!38548 tuple2!25946) (t!51939 List!37009)) )
))
(declare-fun l!628 () List!37009)

(assert (=> start!138444 (= res!1083368 (and (not (is-Nil!37006 l!628)) (not (is-Nil!37006 (t!51939 l!628))) (bvslt (_1!12984 (h!38548 l!628)) (_1!12984 (h!38548 (t!51939 l!628))))))))

(assert (=> start!138444 e!885914))

(declare-fun e!885915 () Bool)

(assert (=> start!138444 e!885915))

(declare-fun b!1586416 () Bool)

(declare-fun ListPrimitiveSize!240 (List!37009) Int)

(assert (=> b!1586416 (= e!885914 (>= (ListPrimitiveSize!240 (t!51939 l!628)) (ListPrimitiveSize!240 l!628)))))

(declare-fun b!1586417 () Bool)

(declare-fun tp_is_empty!39587 () Bool)

(declare-fun tp!115449 () Bool)

(assert (=> b!1586417 (= e!885915 (and tp_is_empty!39587 tp!115449))))

(assert (= (and start!138444 res!1083368) b!1586416))

(assert (= (and start!138444 (is-Cons!37005 l!628)) b!1586417))

(declare-fun m!1454759 () Bool)

(assert (=> b!1586416 m!1454759))

(declare-fun m!1454761 () Bool)

(assert (=> b!1586416 m!1454761))

(push 1)

(assert (not b!1586416))

(assert (not b!1586417))

(assert tp_is_empty!39587)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167935 () Bool)

(declare-fun lt!677537 () Int)

(assert (=> d!167935 (>= lt!677537 0)))

(declare-fun e!885932 () Int)

(assert (=> d!167935 (= lt!677537 e!885932)))

(declare-fun c!147074 () Bool)

(assert (=> d!167935 (= c!147074 (is-Nil!37006 (t!51939 l!628)))))

(assert (=> d!167935 (= (ListPrimitiveSize!240 (t!51939 l!628)) lt!677537)))

(declare-fun b!1586448 () Bool)

(assert (=> b!1586448 (= e!885932 0)))

