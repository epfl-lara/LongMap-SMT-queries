; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1696 () Bool)

(assert start!1696)

(assert (=> start!1696 false))

(declare-fun e!7139 () Bool)

(assert (=> start!1696 e!7139))

(assert (=> start!1696 true))

(declare-fun tp_is_empty!605 () Bool)

(assert (=> start!1696 tp_is_empty!605))

(declare-fun b!11978 () Bool)

(declare-fun tp!2021 () Bool)

(assert (=> b!11978 (= e!7139 (and tp_is_empty!605 tp!2021))))

(declare-datatypes ((B!432 0))(
  ( (B!433 (val!311 Int)) )
))
(declare-datatypes ((tuple2!422 0))(
  ( (tuple2!423 (_1!211 (_ BitVec 64)) (_2!211 B!432)) )
))
(declare-datatypes ((List!363 0))(
  ( (Nil!360) (Cons!359 (h!925 tuple2!422) (t!2750 List!363)) )
))
(declare-fun l!1094 () List!363)

(assert (= (and start!1696 (is-Cons!359 l!1094)) b!11978))

(push 1)

(assert (not b!11978))

(assert tp_is_empty!605)

(check-sat)

(pop 1)

(push 1)

(check-sat)

