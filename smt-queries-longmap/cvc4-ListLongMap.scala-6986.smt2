; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88586 () Bool)

(assert start!88586)

(assert (=> start!88586 false))

(declare-fun e!572916 () Bool)

(assert (=> start!88586 e!572916))

(assert (=> start!88586 true))

(declare-fun b!1018238 () Bool)

(declare-fun tp_is_empty!23693 () Bool)

(declare-fun tp!71008 () Bool)

(assert (=> b!1018238 (= e!572916 (and tp_is_empty!23693 tp!71008))))

(declare-datatypes ((B!1626 0))(
  ( (B!1627 (val!11897 Int)) )
))
(declare-datatypes ((tuple2!15340 0))(
  ( (tuple2!15341 (_1!7681 (_ BitVec 64)) (_2!7681 B!1626)) )
))
(declare-datatypes ((List!21585 0))(
  ( (Nil!21582) (Cons!21581 (h!22779 tuple2!15340) (t!30586 List!21585)) )
))
(declare-fun l!996 () List!21585)

(assert (= (and start!88586 (is-Cons!21581 l!996)) b!1018238))

(push 1)

(assert (not b!1018238))

(assert tp_is_empty!23693)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

