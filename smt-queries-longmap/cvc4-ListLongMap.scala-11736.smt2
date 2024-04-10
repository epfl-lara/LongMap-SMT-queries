; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137656 () Bool)

(assert start!137656)

(assert (=> start!137656 false))

(declare-fun e!883145 () Bool)

(assert (=> start!137656 e!883145))

(assert (=> start!137656 true))

(declare-fun b!1582444 () Bool)

(declare-fun tp_is_empty!39305 () Bool)

(declare-fun tp!114737 () Bool)

(assert (=> b!1582444 (= e!883145 (and tp_is_empty!39305 tp!114737))))

(declare-datatypes ((B!2760 0))(
  ( (B!2761 (val!19742 Int)) )
))
(declare-datatypes ((tuple2!25652 0))(
  ( (tuple2!25653 (_1!12837 (_ BitVec 64)) (_2!12837 B!2760)) )
))
(declare-datatypes ((List!36862 0))(
  ( (Nil!36859) (Cons!36858 (h!38401 tuple2!25652) (t!51776 List!36862)) )
))
(declare-fun l!1356 () List!36862)

(assert (= (and start!137656 (is-Cons!36858 l!1356)) b!1582444))

(push 1)

(assert (not b!1582444))

(assert tp_is_empty!39305)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

