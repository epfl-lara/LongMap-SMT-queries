; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87466 () Bool)

(assert start!87466)

(assert (=> start!87466 false))

(declare-fun e!569896 () Bool)

(assert (=> start!87466 e!569896))

(declare-fun b!1013120 () Bool)

(declare-fun tp_is_empty!23447 () Bool)

(declare-fun tp!70379 () Bool)

(assert (=> b!1013120 (= e!569896 (and tp_is_empty!23447 tp!70379))))

(declare-datatypes ((B!1380 0))(
  ( (B!1381 (val!11774 Int)) )
))
(declare-datatypes ((tuple2!15094 0))(
  ( (tuple2!15095 (_1!7558 (_ BitVec 64)) (_2!7558 B!1380)) )
))
(declare-datatypes ((List!21393 0))(
  ( (Nil!21390) (Cons!21389 (h!22587 tuple2!15094) (t!30394 List!21393)) )
))
(declare-fun l!412 () List!21393)

(assert (= (and start!87466 (is-Cons!21389 l!412)) b!1013120))

(push 1)

(assert (not b!1013120))

(assert tp_is_empty!23447)

(check-sat)

(pop 1)

(push 1)

