; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88414 () Bool)

(assert start!88414)

(assert (=> start!88414 false))

(declare-fun e!572439 () Bool)

(assert (=> start!88414 e!572439))

(assert (=> start!88414 true))

(declare-fun b!1017479 () Bool)

(declare-fun tp_is_empty!23647 () Bool)

(declare-fun tp!70891 () Bool)

(assert (=> b!1017479 (= e!572439 (and tp_is_empty!23647 tp!70891))))

(declare-datatypes ((B!1580 0))(
  ( (B!1581 (val!11874 Int)) )
))
(declare-datatypes ((tuple2!15294 0))(
  ( (tuple2!15295 (_1!7658 (_ BitVec 64)) (_2!7658 B!1580)) )
))
(declare-datatypes ((List!21562 0))(
  ( (Nil!21559) (Cons!21558 (h!22756 tuple2!15294) (t!30563 List!21562)) )
))
(declare-fun l!1036 () List!21562)

(assert (= (and start!88414 (is-Cons!21558 l!1036)) b!1017479))

(push 1)

(assert (not b!1017479))

(assert tp_is_empty!23647)

(check-sat)

(pop 1)

