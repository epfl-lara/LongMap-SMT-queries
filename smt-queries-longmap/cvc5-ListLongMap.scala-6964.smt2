; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87936 () Bool)

(assert start!87936)

(assert (=> start!87936 false))

(declare-fun e!571360 () Bool)

(assert (=> start!87936 e!571360))

(assert (=> start!87936 true))

(declare-fun tp_is_empty!23557 () Bool)

(assert (=> start!87936 tp_is_empty!23557))

(declare-fun b!1015622 () Bool)

(declare-fun tp!70673 () Bool)

(assert (=> b!1015622 (= e!571360 (and tp_is_empty!23557 tp!70673))))

(declare-datatypes ((B!1490 0))(
  ( (B!1491 (val!11829 Int)) )
))
(declare-datatypes ((tuple2!15204 0))(
  ( (tuple2!15205 (_1!7613 (_ BitVec 64)) (_2!7613 B!1490)) )
))
(declare-datatypes ((List!21484 0))(
  ( (Nil!21481) (Cons!21480 (h!22678 tuple2!15204) (t!30485 List!21484)) )
))
(declare-fun l!1114 () List!21484)

(assert (= (and start!87936 (is-Cons!21480 l!1114)) b!1015622))

(push 1)

(assert (not b!1015622))

(assert tp_is_empty!23557)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

