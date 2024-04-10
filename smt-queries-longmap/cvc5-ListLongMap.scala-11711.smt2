; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137054 () Bool)

(assert start!137054)

(assert (=> start!137054 false))

(declare-fun e!881342 () Bool)

(assert (=> start!137054 e!881342))

(declare-fun b!1579887 () Bool)

(declare-fun tp_is_empty!39151 () Bool)

(declare-fun tp!114378 () Bool)

(assert (=> b!1579887 (= e!881342 (and tp_is_empty!39151 tp!114378))))

(declare-datatypes ((B!2606 0))(
  ( (B!2607 (val!19665 Int)) )
))
(declare-datatypes ((tuple2!25432 0))(
  ( (tuple2!25433 (_1!12727 (_ BitVec 64)) (_2!12727 B!2606)) )
))
(declare-datatypes ((List!36785 0))(
  ( (Nil!36782) (Cons!36781 (h!38324 tuple2!25432) (t!51699 List!36785)) )
))
(declare-fun l!1390 () List!36785)

(assert (= (and start!137054 (is-Cons!36781 l!1390)) b!1579887))

(push 1)

(assert (not b!1579887))

(assert tp_is_empty!39151)

(check-sat)

(pop 1)

