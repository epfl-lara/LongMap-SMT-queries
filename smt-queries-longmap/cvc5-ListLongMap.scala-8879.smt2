; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107798 () Bool)

(assert start!107798)

(assert (=> start!107798 false))

(declare-fun e!727441 () Bool)

(assert (=> start!107798 e!727441))

(assert (=> start!107798 true))

(declare-fun b!1274643 () Bool)

(declare-fun tp_is_empty!33187 () Bool)

(declare-fun tp!97994 () Bool)

(assert (=> b!1274643 (= e!727441 (and tp_is_empty!33187 tp!97994))))

(declare-datatypes ((B!2144 0))(
  ( (B!2145 (val!16668 Int)) )
))
(declare-datatypes ((tuple2!21418 0))(
  ( (tuple2!21419 (_1!10720 (_ BitVec 64)) (_2!10720 B!2144)) )
))
(declare-datatypes ((List!28594 0))(
  ( (Nil!28591) (Cons!28590 (h!29799 tuple2!21418) (t!42127 List!28594)) )
))
(declare-fun l!595 () List!28594)

(assert (= (and start!107798 (is-Cons!28590 l!595)) b!1274643))

(push 1)

(assert (not b!1274643))

(assert tp_is_empty!33187)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

