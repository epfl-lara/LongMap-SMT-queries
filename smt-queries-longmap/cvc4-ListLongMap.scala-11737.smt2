; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137662 () Bool)

(assert start!137662)

(assert (=> start!137662 false))

(declare-fun e!883154 () Bool)

(assert (=> start!137662 e!883154))

(assert (=> start!137662 true))

(declare-fun b!1582453 () Bool)

(declare-fun tp_is_empty!39311 () Bool)

(declare-fun tp!114746 () Bool)

(assert (=> b!1582453 (= e!883154 (and tp_is_empty!39311 tp!114746))))

(declare-datatypes ((B!2766 0))(
  ( (B!2767 (val!19745 Int)) )
))
(declare-datatypes ((tuple2!25658 0))(
  ( (tuple2!25659 (_1!12840 (_ BitVec 64)) (_2!12840 B!2766)) )
))
(declare-datatypes ((List!36865 0))(
  ( (Nil!36862) (Cons!36861 (h!38404 tuple2!25658) (t!51779 List!36865)) )
))
(declare-fun l!1356 () List!36865)

(assert (= (and start!137662 (is-Cons!36861 l!1356)) b!1582453))

(push 1)

(assert (not b!1582453))

(assert tp_is_empty!39311)

(check-sat)

(pop 1)

(push 1)

