; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137058 () Bool)

(assert start!137058)

(assert (=> start!137058 false))

(declare-fun e!881348 () Bool)

(assert (=> start!137058 e!881348))

(declare-fun b!1579893 () Bool)

(declare-fun tp_is_empty!39155 () Bool)

(declare-fun tp!114384 () Bool)

(assert (=> b!1579893 (= e!881348 (and tp_is_empty!39155 tp!114384))))

(declare-datatypes ((B!2610 0))(
  ( (B!2611 (val!19667 Int)) )
))
(declare-datatypes ((tuple2!25436 0))(
  ( (tuple2!25437 (_1!12729 (_ BitVec 64)) (_2!12729 B!2610)) )
))
(declare-datatypes ((List!36787 0))(
  ( (Nil!36784) (Cons!36783 (h!38326 tuple2!25436) (t!51701 List!36787)) )
))
(declare-fun l!1390 () List!36787)

(assert (= (and start!137058 (is-Cons!36783 l!1390)) b!1579893))

(push 1)

(assert (not b!1579893))

(assert tp_is_empty!39155)

(check-sat)

(pop 1)

