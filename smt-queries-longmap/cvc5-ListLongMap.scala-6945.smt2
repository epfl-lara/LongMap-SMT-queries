; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87462 () Bool)

(assert start!87462)

(assert (=> start!87462 false))

(declare-fun e!569890 () Bool)

(assert (=> start!87462 e!569890))

(declare-fun b!1013114 () Bool)

(declare-fun tp_is_empty!23443 () Bool)

(declare-fun tp!70373 () Bool)

(assert (=> b!1013114 (= e!569890 (and tp_is_empty!23443 tp!70373))))

(declare-datatypes ((B!1376 0))(
  ( (B!1377 (val!11772 Int)) )
))
(declare-datatypes ((tuple2!15090 0))(
  ( (tuple2!15091 (_1!7556 (_ BitVec 64)) (_2!7556 B!1376)) )
))
(declare-datatypes ((List!21391 0))(
  ( (Nil!21388) (Cons!21387 (h!22585 tuple2!15090) (t!30392 List!21391)) )
))
(declare-fun l!412 () List!21391)

(assert (= (and start!87462 (is-Cons!21387 l!412)) b!1013114))

(push 1)

(assert (not b!1013114))

(assert tp_is_empty!23443)

(check-sat)

(pop 1)

(push 1)

(check-sat)

