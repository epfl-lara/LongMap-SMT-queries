; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72120 () Bool)

(assert start!72120)

(assert (=> start!72120 false))

(declare-fun e!466902 () Bool)

(assert (=> start!72120 e!466902))

(declare-fun b!836765 () Bool)

(declare-fun tp_is_empty!15283 () Bool)

(declare-fun tp!47509 () Bool)

(assert (=> b!836765 (= e!466902 (and tp_is_empty!15283 tp!47509))))

(declare-datatypes ((B!1214 0))(
  ( (B!1215 (val!7689 Int)) )
))
(declare-datatypes ((tuple2!10238 0))(
  ( (tuple2!10239 (_1!5130 (_ BitVec 64)) (_2!5130 B!1214)) )
))
(declare-datatypes ((List!16000 0))(
  ( (Nil!15997) (Cons!15996 (h!17127 tuple2!10238) (t!22371 List!16000)) )
))
(declare-fun l!390 () List!16000)

(assert (= (and start!72120 (is-Cons!15996 l!390)) b!836765))

(push 1)

(assert (not b!836765))

(assert tp_is_empty!15283)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

