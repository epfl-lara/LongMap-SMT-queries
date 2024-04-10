; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133110 () Bool)

(assert start!133110)

(assert (=> start!133110 false))

(declare-fun e!867668 () Bool)

(assert (=> start!133110 e!867668))

(assert (=> start!133110 true))

(declare-fun b!1557620 () Bool)

(declare-fun tp_is_empty!38399 () Bool)

(declare-fun tp!112545 () Bool)

(assert (=> b!1557620 (= e!867668 (and tp_is_empty!38399 tp!112545))))

(declare-datatypes ((B!2394 0))(
  ( (B!2395 (val!19283 Int)) )
))
(declare-datatypes ((tuple2!24942 0))(
  ( (tuple2!24943 (_1!12482 (_ BitVec 64)) (_2!12482 B!2394)) )
))
(declare-datatypes ((List!36317 0))(
  ( (Nil!36314) (Cons!36313 (h!37759 tuple2!24942) (t!51044 List!36317)) )
))
(declare-fun l!1292 () List!36317)

(assert (= (and start!133110 (is-Cons!36313 l!1292)) b!1557620))

(push 1)

(assert (not b!1557620))

(assert tp_is_empty!38399)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

