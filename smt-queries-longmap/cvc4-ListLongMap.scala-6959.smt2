; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87880 () Bool)

(assert start!87880)

(declare-fun b!1015398 () Bool)

(assert (=> b!1015398 true))

(assert (=> b!1015398 true))

(declare-fun res!681107 () Bool)

(declare-fun e!571203 () Bool)

(assert (=> start!87880 (=> (not res!681107) (not e!571203))))

(declare-datatypes ((B!1464 0))(
  ( (B!1465 (val!11816 Int)) )
))
(declare-datatypes ((tuple2!15178 0))(
  ( (tuple2!15179 (_1!7600 (_ BitVec 64)) (_2!7600 B!1464)) )
))
(declare-datatypes ((List!21464 0))(
  ( (Nil!21461) (Cons!21460 (h!22658 tuple2!15178) (t!30465 List!21464)) )
))
(declare-fun l!412 () List!21464)

(declare-fun isStrictlySorted!590 (List!21464) Bool)

(assert (=> start!87880 (= res!681107 (isStrictlySorted!590 l!412))))

(assert (=> start!87880 e!571203))

(declare-fun e!571204 () Bool)

(assert (=> start!87880 e!571204))

(declare-fun tp_is_empty!23531 () Bool)

(assert (=> start!87880 tp_is_empty!23531))

(declare-fun b!1015397 () Bool)

(declare-fun res!681108 () Bool)

(assert (=> b!1015397 (=> (not res!681108) (not e!571203))))

(declare-fun value!115 () B!1464)

(assert (=> b!1015397 (= res!681108 (and (or (not (is-Cons!21460 l!412)) (not (= (_2!7600 (h!22658 l!412)) value!115))) (or (not (is-Cons!21460 l!412)) (= (_2!7600 (h!22658 l!412)) value!115)) (is-Nil!21461 l!412)))))

(declare-fun lambda!899 () Int)

(declare-datatypes ((List!21465 0))(
  ( (Nil!21462) (Cons!21461 (h!22659 (_ BitVec 64)) (t!30466 List!21465)) )
))
(declare-fun forall!255 (List!21465 Int) Bool)

(assert (=> b!1015398 (= e!571203 (not (forall!255 Nil!21462 lambda!899)))))

(declare-fun b!1015399 () Bool)

(declare-fun tp!70616 () Bool)

(assert (=> b!1015399 (= e!571204 (and tp_is_empty!23531 tp!70616))))

(assert (= (and start!87880 res!681107) b!1015397))

(assert (= (and b!1015397 res!681108) b!1015398))

(assert (= (and start!87880 (is-Cons!21460 l!412)) b!1015399))

(declare-fun m!937517 () Bool)

(assert (=> start!87880 m!937517))

(declare-fun m!937519 () Bool)

(assert (=> b!1015398 m!937519))

(push 1)

(assert (not b!1015398))

(assert (not start!87880))

(assert (not b!1015399))

(assert tp_is_empty!23531)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

