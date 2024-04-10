; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87468 () Bool)

(assert start!87468)

(assert (=> start!87468 false))

(declare-fun e!569899 () Bool)

(assert (=> start!87468 e!569899))

(declare-fun b!1013123 () Bool)

(declare-fun tp_is_empty!23449 () Bool)

(declare-fun tp!70382 () Bool)

(assert (=> b!1013123 (= e!569899 (and tp_is_empty!23449 tp!70382))))

(declare-datatypes ((B!1382 0))(
  ( (B!1383 (val!11775 Int)) )
))
(declare-datatypes ((tuple2!15096 0))(
  ( (tuple2!15097 (_1!7559 (_ BitVec 64)) (_2!7559 B!1382)) )
))
(declare-datatypes ((List!21394 0))(
  ( (Nil!21391) (Cons!21390 (h!22588 tuple2!15096) (t!30395 List!21394)) )
))
(declare-fun l!412 () List!21394)

(assert (= (and start!87468 (is-Cons!21390 l!412)) b!1013123))

(push 1)

(assert (not b!1013123))

(assert tp_is_empty!23449)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

