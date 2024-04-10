; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133104 () Bool)

(assert start!133104)

(assert (=> start!133104 false))

(declare-fun e!867659 () Bool)

(assert (=> start!133104 e!867659))

(declare-fun b!1557611 () Bool)

(declare-fun tp_is_empty!38393 () Bool)

(declare-fun tp!112536 () Bool)

(assert (=> b!1557611 (= e!867659 (and tp_is_empty!38393 tp!112536))))

(declare-datatypes ((B!2388 0))(
  ( (B!2389 (val!19280 Int)) )
))
(declare-datatypes ((tuple2!24936 0))(
  ( (tuple2!24937 (_1!12479 (_ BitVec 64)) (_2!12479 B!2388)) )
))
(declare-datatypes ((List!36314 0))(
  ( (Nil!36311) (Cons!36310 (h!37756 tuple2!24936) (t!51041 List!36314)) )
))
(declare-fun l!1292 () List!36314)

(assert (= (and start!133104 (is-Cons!36310 l!1292)) b!1557611))

(push 1)

(assert (not b!1557611))

(assert tp_is_empty!38393)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

