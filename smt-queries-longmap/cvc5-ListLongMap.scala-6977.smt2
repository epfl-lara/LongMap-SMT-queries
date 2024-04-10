; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88402 () Bool)

(assert start!88402)

(assert (=> start!88402 false))

(declare-fun e!572412 () Bool)

(assert (=> start!88402 e!572412))

(assert (=> start!88402 true))

(declare-fun b!1017416 () Bool)

(declare-fun tp_is_empty!23635 () Bool)

(declare-fun tp!70873 () Bool)

(assert (=> b!1017416 (= e!572412 (and tp_is_empty!23635 tp!70873))))

(declare-datatypes ((B!1568 0))(
  ( (B!1569 (val!11868 Int)) )
))
(declare-datatypes ((tuple2!15282 0))(
  ( (tuple2!15283 (_1!7652 (_ BitVec 64)) (_2!7652 B!1568)) )
))
(declare-datatypes ((List!21556 0))(
  ( (Nil!21553) (Cons!21552 (h!22750 tuple2!15282) (t!30557 List!21556)) )
))
(declare-fun l!1036 () List!21556)

(assert (= (and start!88402 (is-Cons!21552 l!1036)) b!1017416))

(push 1)

(assert (not b!1017416))

(assert tp_is_empty!23635)

(check-sat)

(pop 1)

(push 1)

(check-sat)

