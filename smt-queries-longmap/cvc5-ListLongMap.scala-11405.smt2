; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132806 () Bool)

(assert start!132806)

(assert (=> start!132806 false))

(declare-fun e!866414 () Bool)

(assert (=> start!132806 e!866414))

(declare-fun b!1555757 () Bool)

(declare-fun tp_is_empty!38317 () Bool)

(declare-fun tp!112326 () Bool)

(assert (=> b!1555757 (= e!866414 (and tp_is_empty!38317 tp!112326))))

(declare-datatypes ((B!2306 0))(
  ( (B!2307 (val!19239 Int)) )
))
(declare-datatypes ((tuple2!24854 0))(
  ( (tuple2!24855 (_1!12438 (_ BitVec 64)) (_2!12438 B!2306)) )
))
(declare-datatypes ((List!36273 0))(
  ( (Nil!36270) (Cons!36269 (h!37715 tuple2!24854) (t!50994 List!36273)) )
))
(declare-fun l!1177 () List!36273)

(assert (= (and start!132806 (is-Cons!36269 l!1177)) b!1555757))

(push 1)

(assert (not b!1555757))

(assert tp_is_empty!38317)

(check-sat)

(pop 1)

