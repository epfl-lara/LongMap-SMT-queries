; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134450 () Bool)

(assert start!134450)

(assert (=> start!134450 false))

(assert (=> start!134450 true))

(declare-fun e!875069 () Bool)

(assert (=> start!134450 e!875069))

(declare-fun b!1569702 () Bool)

(declare-fun tp_is_empty!39079 () Bool)

(declare-fun tp!114165 () Bool)

(assert (=> b!1569702 (= e!875069 (and tp_is_empty!39079 tp!114165))))

(declare-datatypes ((B!2528 0))(
  ( (B!2529 (val!19626 Int)) )
))
(declare-datatypes ((tuple2!25354 0))(
  ( (tuple2!25355 (_1!12688 (_ BitVec 64)) (_2!12688 B!2528)) )
))
(declare-datatypes ((List!36746 0))(
  ( (Nil!36743) (Cons!36742 (h!38189 tuple2!25354) (t!51654 List!36746)) )
))
(declare-fun l!750 () List!36746)

(assert (= (and start!134450 (is-Cons!36742 l!750)) b!1569702))

(push 1)

(assert (not b!1569702))

(assert tp_is_empty!39079)

(check-sat)

(pop 1)

