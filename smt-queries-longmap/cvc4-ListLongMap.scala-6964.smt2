; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87940 () Bool)

(assert start!87940)

(assert (=> start!87940 false))

(declare-fun e!571366 () Bool)

(assert (=> start!87940 e!571366))

(assert (=> start!87940 true))

(declare-fun tp_is_empty!23561 () Bool)

(assert (=> start!87940 tp_is_empty!23561))

(declare-fun b!1015628 () Bool)

(declare-fun tp!70679 () Bool)

(assert (=> b!1015628 (= e!571366 (and tp_is_empty!23561 tp!70679))))

(declare-datatypes ((B!1494 0))(
  ( (B!1495 (val!11831 Int)) )
))
(declare-datatypes ((tuple2!15208 0))(
  ( (tuple2!15209 (_1!7615 (_ BitVec 64)) (_2!7615 B!1494)) )
))
(declare-datatypes ((List!21486 0))(
  ( (Nil!21483) (Cons!21482 (h!22680 tuple2!15208) (t!30487 List!21486)) )
))
(declare-fun l!1114 () List!21486)

(assert (= (and start!87940 (is-Cons!21482 l!1114)) b!1015628))

(push 1)

(assert (not b!1015628))

(assert tp_is_empty!23561)

(check-sat)

(pop 1)

(push 1)

(check-sat)

