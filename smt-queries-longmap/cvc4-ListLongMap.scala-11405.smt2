; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132810 () Bool)

(assert start!132810)

(assert (=> start!132810 false))

(declare-fun e!866420 () Bool)

(assert (=> start!132810 e!866420))

(declare-fun b!1555763 () Bool)

(declare-fun tp_is_empty!38321 () Bool)

(declare-fun tp!112332 () Bool)

(assert (=> b!1555763 (= e!866420 (and tp_is_empty!38321 tp!112332))))

(declare-datatypes ((B!2310 0))(
  ( (B!2311 (val!19241 Int)) )
))
(declare-datatypes ((tuple2!24858 0))(
  ( (tuple2!24859 (_1!12440 (_ BitVec 64)) (_2!12440 B!2310)) )
))
(declare-datatypes ((List!36275 0))(
  ( (Nil!36272) (Cons!36271 (h!37717 tuple2!24858) (t!50996 List!36275)) )
))
(declare-fun l!1177 () List!36275)

(assert (= (and start!132810 (is-Cons!36271 l!1177)) b!1555763))

(push 1)

(assert (not b!1555763))

(assert tp_is_empty!38321)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

