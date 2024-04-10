; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7190 () Bool)

(assert start!7190)

(assert (=> start!7190 false))

(declare-fun e!29342 () Bool)

(assert (=> start!7190 e!29342))

(declare-fun b!46074 () Bool)

(declare-fun tp_is_empty!1961 () Bool)

(declare-fun tp!6062 () Bool)

(assert (=> b!46074 (= e!29342 (and tp_is_empty!1961 tp!6062))))

(declare-datatypes ((B!864 0))(
  ( (B!865 (val!1019 Int)) )
))
(declare-datatypes ((tuple2!1686 0))(
  ( (tuple2!1687 (_1!854 (_ BitVec 64)) (_2!854 B!864)) )
))
(declare-datatypes ((List!1237 0))(
  ( (Nil!1234) (Cons!1233 (h!1813 tuple2!1686) (t!4262 List!1237)) )
))
(declare-fun l!812 () List!1237)

(assert (= (and start!7190 (is-Cons!1233 l!812)) b!46074))

(push 1)

(assert (not b!46074))

(assert tp_is_empty!1961)

(check-sat)

(pop 1)

(push 1)

(check-sat)

