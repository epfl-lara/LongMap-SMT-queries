; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137936 () Bool)

(assert start!137936)

(assert (=> start!137936 false))

(declare-fun e!883969 () Bool)

(assert (=> start!137936 e!883969))

(declare-fun b!1583596 () Bool)

(declare-fun tp_is_empty!39407 () Bool)

(declare-fun tp!115000 () Bool)

(assert (=> b!1583596 (= e!883969 (and tp_is_empty!39407 tp!115000))))

(declare-datatypes ((B!2874 0))(
  ( (B!2875 (val!19799 Int)) )
))
(declare-datatypes ((tuple2!25766 0))(
  ( (tuple2!25767 (_1!12894 (_ BitVec 64)) (_2!12894 B!2874)) )
))
(declare-datatypes ((List!36919 0))(
  ( (Nil!36916) (Cons!36915 (h!38458 tuple2!25766) (t!51833 List!36919)) )
))
(declare-fun l!1251 () List!36919)

(assert (= (and start!137936 (is-Cons!36915 l!1251)) b!1583596))

(push 1)

(assert (not b!1583596))

(assert tp_is_empty!39407)

(check-sat)

(pop 1)

(push 1)

