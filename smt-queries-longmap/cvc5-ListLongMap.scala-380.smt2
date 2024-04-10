; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7186 () Bool)

(assert start!7186)

(assert (=> start!7186 false))

(declare-fun e!29336 () Bool)

(assert (=> start!7186 e!29336))

(declare-fun b!46068 () Bool)

(declare-fun tp_is_empty!1957 () Bool)

(declare-fun tp!6056 () Bool)

(assert (=> b!46068 (= e!29336 (and tp_is_empty!1957 tp!6056))))

(declare-datatypes ((B!860 0))(
  ( (B!861 (val!1017 Int)) )
))
(declare-datatypes ((tuple2!1682 0))(
  ( (tuple2!1683 (_1!852 (_ BitVec 64)) (_2!852 B!860)) )
))
(declare-datatypes ((List!1235 0))(
  ( (Nil!1232) (Cons!1231 (h!1811 tuple2!1682) (t!4260 List!1235)) )
))
(declare-fun l!812 () List!1235)

(assert (= (and start!7186 (is-Cons!1231 l!812)) b!46068))

(push 1)

(assert (not b!46068))

(assert tp_is_empty!1957)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

