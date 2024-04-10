; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138188 () Bool)

(assert start!138188)

(assert (=> start!138188 false))

(declare-fun e!885021 () Bool)

(assert (=> start!138188 e!885021))

(assert (=> start!138188 true))

(declare-fun b!1585226 () Bool)

(declare-fun tp_is_empty!39499 () Bool)

(declare-fun tp!115215 () Bool)

(assert (=> b!1585226 (= e!885021 (and tp_is_empty!39499 tp!115215))))

(declare-datatypes ((B!2966 0))(
  ( (B!2967 (val!19845 Int)) )
))
(declare-datatypes ((tuple2!25858 0))(
  ( (tuple2!25859 (_1!12940 (_ BitVec 64)) (_2!12940 B!2966)) )
))
(declare-datatypes ((List!36965 0))(
  ( (Nil!36962) (Cons!36961 (h!38504 tuple2!25858) (t!51883 List!36965)) )
))
(declare-fun l!556 () List!36965)

(assert (= (and start!138188 (is-Cons!36961 l!556)) b!1585226))

(push 1)

(assert (not b!1585226))

(assert tp_is_empty!39499)

(check-sat)

(pop 1)

