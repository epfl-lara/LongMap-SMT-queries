; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137938 () Bool)

(assert start!137938)

(assert (=> start!137938 false))

(declare-fun e!883972 () Bool)

(assert (=> start!137938 e!883972))

(assert (=> start!137938 true))

(declare-fun b!1583599 () Bool)

(declare-fun tp_is_empty!39409 () Bool)

(declare-fun tp!115003 () Bool)

(assert (=> b!1583599 (= e!883972 (and tp_is_empty!39409 tp!115003))))

(declare-datatypes ((B!2876 0))(
  ( (B!2877 (val!19800 Int)) )
))
(declare-datatypes ((tuple2!25768 0))(
  ( (tuple2!25769 (_1!12895 (_ BitVec 64)) (_2!12895 B!2876)) )
))
(declare-datatypes ((List!36920 0))(
  ( (Nil!36917) (Cons!36916 (h!38459 tuple2!25768) (t!51834 List!36920)) )
))
(declare-fun l!1251 () List!36920)

(assert (= (and start!137938 (is-Cons!36916 l!1251)) b!1583599))

(push 1)

(assert (not b!1583599))

(assert tp_is_empty!39409)

(check-sat)

