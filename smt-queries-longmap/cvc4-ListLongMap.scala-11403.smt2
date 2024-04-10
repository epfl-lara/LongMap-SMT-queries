; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132786 () Bool)

(assert start!132786)

(assert (=> start!132786 false))

(declare-fun e!866315 () Bool)

(assert (=> start!132786 e!866315))

(declare-fun b!1555598 () Bool)

(declare-fun tp_is_empty!38309 () Bool)

(declare-fun tp!112305 () Bool)

(assert (=> b!1555598 (= e!866315 (and tp_is_empty!38309 tp!112305))))

(declare-datatypes ((B!2298 0))(
  ( (B!2299 (val!19235 Int)) )
))
(declare-datatypes ((tuple2!24846 0))(
  ( (tuple2!24847 (_1!12434 (_ BitVec 64)) (_2!12434 B!2298)) )
))
(declare-datatypes ((List!36269 0))(
  ( (Nil!36266) (Cons!36265 (h!37711 tuple2!24846) (t!50990 List!36269)) )
))
(declare-fun l!1177 () List!36269)

(assert (= (and start!132786 (is-Cons!36265 l!1177)) b!1555598))

(push 1)

(assert (not b!1555598))

(assert tp_is_empty!38309)

(check-sat)

(pop 1)

