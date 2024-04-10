; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87472 () Bool)

(assert start!87472)

(assert (=> start!87472 false))

(declare-fun e!569905 () Bool)

(assert (=> start!87472 e!569905))

(declare-fun b!1013129 () Bool)

(declare-fun tp_is_empty!23453 () Bool)

(declare-fun tp!70388 () Bool)

(assert (=> b!1013129 (= e!569905 (and tp_is_empty!23453 tp!70388))))

(declare-datatypes ((B!1386 0))(
  ( (B!1387 (val!11777 Int)) )
))
(declare-datatypes ((tuple2!15100 0))(
  ( (tuple2!15101 (_1!7561 (_ BitVec 64)) (_2!7561 B!1386)) )
))
(declare-datatypes ((List!21396 0))(
  ( (Nil!21393) (Cons!21392 (h!22590 tuple2!15100) (t!30397 List!21396)) )
))
(declare-fun l!412 () List!21396)

(assert (= (and start!87472 (is-Cons!21392 l!412)) b!1013129))

(push 1)

(assert (not b!1013129))

(assert tp_is_empty!23453)

(check-sat)

