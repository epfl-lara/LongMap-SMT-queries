; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133148 () Bool)

(assert start!133148)

(assert (=> start!133148 false))

(declare-fun e!867845 () Bool)

(assert (=> start!133148 e!867845))

(assert (=> start!133148 true))

(declare-fun b!1557944 () Bool)

(declare-fun tp_is_empty!38413 () Bool)

(declare-fun tp!112575 () Bool)

(assert (=> b!1557944 (= e!867845 (and tp_is_empty!38413 tp!112575))))

(declare-datatypes ((B!2408 0))(
  ( (B!2409 (val!19290 Int)) )
))
(declare-datatypes ((tuple2!24956 0))(
  ( (tuple2!24957 (_1!12489 (_ BitVec 64)) (_2!12489 B!2408)) )
))
(declare-datatypes ((List!36324 0))(
  ( (Nil!36321) (Cons!36320 (h!37766 tuple2!24956) (t!51051 List!36324)) )
))
(declare-fun l!1292 () List!36324)

(assert (= (and start!133148 (is-Cons!36320 l!1292)) b!1557944))

(push 1)

(assert (not b!1557944))

(assert tp_is_empty!38413)

(check-sat)

