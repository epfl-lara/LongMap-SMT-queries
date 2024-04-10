; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133152 () Bool)

(assert start!133152)

(assert (=> start!133152 false))

(declare-fun e!867851 () Bool)

(assert (=> start!133152 e!867851))

(assert (=> start!133152 true))

(declare-fun b!1557950 () Bool)

(declare-fun tp_is_empty!38417 () Bool)

(declare-fun tp!112581 () Bool)

(assert (=> b!1557950 (= e!867851 (and tp_is_empty!38417 tp!112581))))

(declare-datatypes ((B!2412 0))(
  ( (B!2413 (val!19292 Int)) )
))
(declare-datatypes ((tuple2!24960 0))(
  ( (tuple2!24961 (_1!12491 (_ BitVec 64)) (_2!12491 B!2412)) )
))
(declare-datatypes ((List!36326 0))(
  ( (Nil!36323) (Cons!36322 (h!37768 tuple2!24960) (t!51053 List!36326)) )
))
(declare-fun l!1292 () List!36326)

(assert (= (and start!133152 (is-Cons!36322 l!1292)) b!1557950))

(push 1)

(assert (not b!1557950))

(assert tp_is_empty!38417)

(check-sat)

(pop 1)

