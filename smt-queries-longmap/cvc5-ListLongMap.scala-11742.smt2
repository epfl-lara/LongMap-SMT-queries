; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137718 () Bool)

(assert start!137718)

(assert (=> start!137718 false))

(declare-fun e!883292 () Bool)

(assert (=> start!137718 e!883292))

(declare-fun b!1582612 () Bool)

(declare-fun tp_is_empty!39325 () Bool)

(declare-fun tp!114803 () Bool)

(assert (=> b!1582612 (= e!883292 (and tp_is_empty!39325 tp!114803))))

(declare-datatypes ((B!2792 0))(
  ( (B!2793 (val!19758 Int)) )
))
(declare-datatypes ((tuple2!25684 0))(
  ( (tuple2!25685 (_1!12853 (_ BitVec 64)) (_2!12853 B!2792)) )
))
(declare-datatypes ((List!36878 0))(
  ( (Nil!36875) (Cons!36874 (h!38417 tuple2!25684) (t!51792 List!36878)) )
))
(declare-fun l!1065 () List!36878)

(assert (= (and start!137718 (is-Cons!36874 l!1065)) b!1582612))

(push 1)

(assert (not b!1582612))

(assert tp_is_empty!39325)

(check-sat)

