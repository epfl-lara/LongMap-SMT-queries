; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134412 () Bool)

(assert start!134412)

(assert (=> start!134412 false))

(assert (=> start!134412 true))

(declare-fun e!874916 () Bool)

(assert (=> start!134412 e!874916))

(declare-fun b!1569456 () Bool)

(declare-fun tp_is_empty!39065 () Bool)

(declare-fun tp!114126 () Bool)

(assert (=> b!1569456 (= e!874916 (and tp_is_empty!39065 tp!114126))))

(declare-datatypes ((B!2514 0))(
  ( (B!2515 (val!19619 Int)) )
))
(declare-datatypes ((tuple2!25340 0))(
  ( (tuple2!25341 (_1!12681 (_ BitVec 64)) (_2!12681 B!2514)) )
))
(declare-datatypes ((List!36739 0))(
  ( (Nil!36736) (Cons!36735 (h!38182 tuple2!25340) (t!51647 List!36739)) )
))
(declare-fun l!750 () List!36739)

(assert (= (and start!134412 (is-Cons!36735 l!750)) b!1569456))

(push 1)

(assert (not b!1569456))

(assert tp_is_empty!39065)

(check-sat)

(pop 1)

(push 1)

