; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134384 () Bool)

(assert start!134384)

(assert (=> start!134384 false))

(assert (=> start!134384 true))

(declare-fun e!874805 () Bool)

(assert (=> start!134384 e!874805))

(declare-fun b!1569276 () Bool)

(declare-fun tp_is_empty!39049 () Bool)

(declare-fun tp!114093 () Bool)

(assert (=> b!1569276 (= e!874805 (and tp_is_empty!39049 tp!114093))))

(declare-datatypes ((B!2498 0))(
  ( (B!2499 (val!19611 Int)) )
))
(declare-datatypes ((tuple2!25324 0))(
  ( (tuple2!25325 (_1!12673 (_ BitVec 64)) (_2!12673 B!2498)) )
))
(declare-datatypes ((List!36731 0))(
  ( (Nil!36728) (Cons!36727 (h!38174 tuple2!25324) (t!51639 List!36731)) )
))
(declare-fun l!750 () List!36731)

(assert (= (and start!134384 (is-Cons!36727 l!750)) b!1569276))

(push 1)

(assert (not b!1569276))

(assert tp_is_empty!39049)

(check-sat)

(pop 1)

