; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134318 () Bool)

(assert start!134318)

(assert (=> start!134318 false))

(assert (=> start!134318 true))

(declare-fun e!874436 () Bool)

(assert (=> start!134318 e!874436))

(declare-fun b!1568577 () Bool)

(declare-fun tp_is_empty!39019 () Bool)

(declare-fun tp!114030 () Bool)

(assert (=> b!1568577 (= e!874436 (and tp_is_empty!39019 tp!114030))))

(declare-datatypes ((B!2468 0))(
  ( (B!2469 (val!19596 Int)) )
))
(declare-datatypes ((tuple2!25294 0))(
  ( (tuple2!25295 (_1!12658 (_ BitVec 64)) (_2!12658 B!2468)) )
))
(declare-datatypes ((List!36716 0))(
  ( (Nil!36713) (Cons!36712 (h!38159 tuple2!25294) (t!51624 List!36716)) )
))
(declare-fun l!750 () List!36716)

(assert (= (and start!134318 (is-Cons!36712 l!750)) b!1568577))

(push 1)

(assert (not b!1568577))

(assert tp_is_empty!39019)

(check-sat)

(pop 1)

