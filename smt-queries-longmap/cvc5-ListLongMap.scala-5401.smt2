; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72114 () Bool)

(assert start!72114)

(assert (=> start!72114 false))

(declare-fun e!466893 () Bool)

(assert (=> start!72114 e!466893))

(declare-fun b!836756 () Bool)

(declare-fun tp_is_empty!15277 () Bool)

(declare-fun tp!47500 () Bool)

(assert (=> b!836756 (= e!466893 (and tp_is_empty!15277 tp!47500))))

(declare-datatypes ((B!1208 0))(
  ( (B!1209 (val!7686 Int)) )
))
(declare-datatypes ((tuple2!10232 0))(
  ( (tuple2!10233 (_1!5127 (_ BitVec 64)) (_2!5127 B!1208)) )
))
(declare-datatypes ((List!15997 0))(
  ( (Nil!15994) (Cons!15993 (h!17124 tuple2!10232) (t!22368 List!15997)) )
))
(declare-fun l!390 () List!15997)

(assert (= (and start!72114 (is-Cons!15993 l!390)) b!836756))

(push 1)

(assert (not b!836756))

(assert tp_is_empty!15277)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

