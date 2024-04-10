; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132684 () Bool)

(assert start!132684)

(assert (=> start!132684 false))

(declare-fun e!865793 () Bool)

(assert (=> start!132684 e!865793))

(assert (=> start!132684 true))

(declare-fun b!1554788 () Bool)

(declare-fun tp_is_empty!38267 () Bool)

(declare-fun tp!112224 () Bool)

(assert (=> b!1554788 (= e!865793 (and tp_is_empty!38267 tp!112224))))

(declare-datatypes ((B!2256 0))(
  ( (B!2257 (val!19214 Int)) )
))
(declare-datatypes ((tuple2!24804 0))(
  ( (tuple2!24805 (_1!12413 (_ BitVec 64)) (_2!12413 B!2256)) )
))
(declare-datatypes ((List!36248 0))(
  ( (Nil!36245) (Cons!36244 (h!37690 tuple2!24804) (t!50969 List!36248)) )
))
(declare-fun l!1177 () List!36248)

(assert (= (and start!132684 (is-Cons!36244 l!1177)) b!1554788))

(push 1)

(assert (not b!1554788))

(assert tp_is_empty!38267)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

