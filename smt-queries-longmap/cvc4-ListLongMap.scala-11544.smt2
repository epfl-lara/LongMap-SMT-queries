; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134388 () Bool)

(assert start!134388)

(assert (=> start!134388 false))

(assert (=> start!134388 true))

(declare-fun e!874811 () Bool)

(assert (=> start!134388 e!874811))

(declare-fun b!1569282 () Bool)

(declare-fun tp_is_empty!39053 () Bool)

(declare-fun tp!114099 () Bool)

(assert (=> b!1569282 (= e!874811 (and tp_is_empty!39053 tp!114099))))

(declare-datatypes ((B!2502 0))(
  ( (B!2503 (val!19613 Int)) )
))
(declare-datatypes ((tuple2!25328 0))(
  ( (tuple2!25329 (_1!12675 (_ BitVec 64)) (_2!12675 B!2502)) )
))
(declare-datatypes ((List!36733 0))(
  ( (Nil!36730) (Cons!36729 (h!38176 tuple2!25328) (t!51641 List!36733)) )
))
(declare-fun l!750 () List!36733)

(assert (= (and start!134388 (is-Cons!36729 l!750)) b!1569282))

(push 1)

(assert (not b!1569282))

(assert tp_is_empty!39053)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

