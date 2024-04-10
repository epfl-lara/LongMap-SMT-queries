; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134322 () Bool)

(assert start!134322)

(assert (=> start!134322 false))

(assert (=> start!134322 true))

(declare-fun e!874442 () Bool)

(assert (=> start!134322 e!874442))

(declare-fun b!1568583 () Bool)

(declare-fun tp_is_empty!39023 () Bool)

(declare-fun tp!114036 () Bool)

(assert (=> b!1568583 (= e!874442 (and tp_is_empty!39023 tp!114036))))

(declare-datatypes ((B!2472 0))(
  ( (B!2473 (val!19598 Int)) )
))
(declare-datatypes ((tuple2!25298 0))(
  ( (tuple2!25299 (_1!12660 (_ BitVec 64)) (_2!12660 B!2472)) )
))
(declare-datatypes ((List!36718 0))(
  ( (Nil!36715) (Cons!36714 (h!38161 tuple2!25298) (t!51626 List!36718)) )
))
(declare-fun l!750 () List!36718)

(assert (= (and start!134322 (is-Cons!36714 l!750)) b!1568583))

(push 1)

(assert (not b!1568583))

(assert tp_is_empty!39023)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

