; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137526 () Bool)

(assert start!137526)

(assert (=> start!137526 false))

(declare-fun e!882728 () Bool)

(assert (=> start!137526 e!882728))

(declare-fun b!1581895 () Bool)

(declare-fun tp_is_empty!39265 () Bool)

(declare-fun tp!114632 () Bool)

(assert (=> b!1581895 (= e!882728 (and tp_is_empty!39265 tp!114632))))

(declare-datatypes ((B!2720 0))(
  ( (B!2721 (val!19722 Int)) )
))
(declare-datatypes ((tuple2!25612 0))(
  ( (tuple2!25613 (_1!12817 (_ BitVec 64)) (_2!12817 B!2720)) )
))
(declare-datatypes ((List!36842 0))(
  ( (Nil!36839) (Cons!36838 (h!38381 tuple2!25612) (t!51756 List!36842)) )
))
(declare-fun l!1356 () List!36842)

(assert (= (and start!137526 (is-Cons!36838 l!1356)) b!1581895))

(push 1)

(assert (not b!1581895))

(assert tp_is_empty!39265)

(check-sat)

(pop 1)

