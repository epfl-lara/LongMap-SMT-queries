; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88576 () Bool)

(assert start!88576)

(assert (=> start!88576 false))

(declare-fun e!572901 () Bool)

(assert (=> start!88576 e!572901))

(declare-fun b!1018223 () Bool)

(declare-fun tp_is_empty!23683 () Bool)

(declare-fun tp!70993 () Bool)

(assert (=> b!1018223 (= e!572901 (and tp_is_empty!23683 tp!70993))))

(declare-datatypes ((B!1616 0))(
  ( (B!1617 (val!11892 Int)) )
))
(declare-datatypes ((tuple2!15330 0))(
  ( (tuple2!15331 (_1!7676 (_ BitVec 64)) (_2!7676 B!1616)) )
))
(declare-datatypes ((List!21580 0))(
  ( (Nil!21577) (Cons!21576 (h!22774 tuple2!15330) (t!30581 List!21580)) )
))
(declare-fun l!996 () List!21580)

(assert (= (and start!88576 (is-Cons!21576 l!996)) b!1018223))

(push 1)

(assert (not b!1018223))

(assert tp_is_empty!23683)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

