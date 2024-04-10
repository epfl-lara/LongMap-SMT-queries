; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133100 () Bool)

(assert start!133100)

(assert (=> start!133100 false))

(declare-fun e!867653 () Bool)

(assert (=> start!133100 e!867653))

(declare-fun b!1557605 () Bool)

(declare-fun tp_is_empty!38389 () Bool)

(declare-fun tp!112530 () Bool)

(assert (=> b!1557605 (= e!867653 (and tp_is_empty!38389 tp!112530))))

(declare-datatypes ((B!2384 0))(
  ( (B!2385 (val!19278 Int)) )
))
(declare-datatypes ((tuple2!24932 0))(
  ( (tuple2!24933 (_1!12477 (_ BitVec 64)) (_2!12477 B!2384)) )
))
(declare-datatypes ((List!36312 0))(
  ( (Nil!36309) (Cons!36308 (h!37754 tuple2!24932) (t!51039 List!36312)) )
))
(declare-fun l!1292 () List!36312)

(assert (= (and start!133100 (is-Cons!36308 l!1292)) b!1557605))

(push 1)

(assert (not b!1557605))

(assert tp_is_empty!38389)

(check-sat)

(pop 1)

