; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132782 () Bool)

(assert start!132782)

(assert (=> start!132782 false))

(declare-fun e!866309 () Bool)

(assert (=> start!132782 e!866309))

(declare-fun b!1555592 () Bool)

(declare-fun tp_is_empty!38305 () Bool)

(declare-fun tp!112299 () Bool)

(assert (=> b!1555592 (= e!866309 (and tp_is_empty!38305 tp!112299))))

(declare-datatypes ((B!2294 0))(
  ( (B!2295 (val!19233 Int)) )
))
(declare-datatypes ((tuple2!24842 0))(
  ( (tuple2!24843 (_1!12432 (_ BitVec 64)) (_2!12432 B!2294)) )
))
(declare-datatypes ((List!36267 0))(
  ( (Nil!36264) (Cons!36263 (h!37709 tuple2!24842) (t!50988 List!36267)) )
))
(declare-fun l!1177 () List!36267)

(assert (= (and start!132782 (is-Cons!36263 l!1177)) b!1555592))

(push 1)

(assert (not b!1555592))

(assert tp_is_empty!38305)

(check-sat)

(pop 1)

