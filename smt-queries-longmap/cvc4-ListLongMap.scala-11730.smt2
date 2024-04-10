; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137530 () Bool)

(assert start!137530)

(assert (=> start!137530 false))

(declare-fun e!882734 () Bool)

(assert (=> start!137530 e!882734))

(declare-fun b!1581901 () Bool)

(declare-fun tp_is_empty!39269 () Bool)

(declare-fun tp!114638 () Bool)

(assert (=> b!1581901 (= e!882734 (and tp_is_empty!39269 tp!114638))))

(declare-datatypes ((B!2724 0))(
  ( (B!2725 (val!19724 Int)) )
))
(declare-datatypes ((tuple2!25616 0))(
  ( (tuple2!25617 (_1!12819 (_ BitVec 64)) (_2!12819 B!2724)) )
))
(declare-datatypes ((List!36844 0))(
  ( (Nil!36841) (Cons!36840 (h!38383 tuple2!25616) (t!51758 List!36844)) )
))
(declare-fun l!1356 () List!36844)

(assert (= (and start!137530 (is-Cons!36840 l!1356)) b!1581901))

(push 1)

(assert (not b!1581901))

(assert tp_is_empty!39269)

(check-sat)

(pop 1)

(push 1)

