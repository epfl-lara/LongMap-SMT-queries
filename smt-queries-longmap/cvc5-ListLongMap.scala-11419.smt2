; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133106 () Bool)

(assert start!133106)

(assert (=> start!133106 false))

(declare-fun e!867662 () Bool)

(assert (=> start!133106 e!867662))

(assert (=> start!133106 true))

(declare-fun b!1557614 () Bool)

(declare-fun tp_is_empty!38395 () Bool)

(declare-fun tp!112539 () Bool)

(assert (=> b!1557614 (= e!867662 (and tp_is_empty!38395 tp!112539))))

(declare-datatypes ((B!2390 0))(
  ( (B!2391 (val!19281 Int)) )
))
(declare-datatypes ((tuple2!24938 0))(
  ( (tuple2!24939 (_1!12480 (_ BitVec 64)) (_2!12480 B!2390)) )
))
(declare-datatypes ((List!36315 0))(
  ( (Nil!36312) (Cons!36311 (h!37757 tuple2!24938) (t!51042 List!36315)) )
))
(declare-fun l!1292 () List!36315)

(assert (= (and start!133106 (is-Cons!36311 l!1292)) b!1557614))

(push 1)

(assert (not b!1557614))

(assert tp_is_empty!38395)

(check-sat)

(pop 1)

(push 1)

(check-sat)

