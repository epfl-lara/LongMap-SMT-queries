; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88396 () Bool)

(assert start!88396)

(assert (=> start!88396 false))

(declare-fun e!572403 () Bool)

(assert (=> start!88396 e!572403))

(declare-fun b!1017407 () Bool)

(declare-fun tp_is_empty!23629 () Bool)

(declare-fun tp!70864 () Bool)

(assert (=> b!1017407 (= e!572403 (and tp_is_empty!23629 tp!70864))))

(declare-datatypes ((B!1562 0))(
  ( (B!1563 (val!11865 Int)) )
))
(declare-datatypes ((tuple2!15276 0))(
  ( (tuple2!15277 (_1!7649 (_ BitVec 64)) (_2!7649 B!1562)) )
))
(declare-datatypes ((List!21553 0))(
  ( (Nil!21550) (Cons!21549 (h!22747 tuple2!15276) (t!30554 List!21553)) )
))
(declare-fun l!1036 () List!21553)

(assert (= (and start!88396 (is-Cons!21549 l!1036)) b!1017407))

(push 1)

(assert (not b!1017407))

(assert tp_is_empty!23629)

(check-sat)

(pop 1)

