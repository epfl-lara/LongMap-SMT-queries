; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7162 () Bool)

(assert start!7162)

(assert (=> start!7162 false))

(declare-fun e!29249 () Bool)

(assert (=> start!7162 e!29249))

(declare-fun b!45948 () Bool)

(declare-fun tp_is_empty!1945 () Bool)

(declare-fun tp!6029 () Bool)

(assert (=> b!45948 (= e!29249 (and tp_is_empty!1945 tp!6029))))

(declare-datatypes ((B!848 0))(
  ( (B!849 (val!1011 Int)) )
))
(declare-datatypes ((tuple2!1670 0))(
  ( (tuple2!1671 (_1!846 (_ BitVec 64)) (_2!846 B!848)) )
))
(declare-datatypes ((List!1229 0))(
  ( (Nil!1226) (Cons!1225 (h!1805 tuple2!1670) (t!4254 List!1229)) )
))
(declare-fun l!812 () List!1229)

(assert (= (and start!7162 (is-Cons!1225 l!812)) b!45948))

(push 1)

(assert (not b!45948))

(assert tp_is_empty!1945)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

