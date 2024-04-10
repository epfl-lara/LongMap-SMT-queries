; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87910 () Bool)

(assert start!87910)

(assert (=> start!87910 false))

(declare-fun e!571294 () Bool)

(assert (=> start!87910 e!571294))

(declare-fun b!1015520 () Bool)

(declare-fun tp_is_empty!23549 () Bool)

(declare-fun tp!70652 () Bool)

(assert (=> b!1015520 (= e!571294 (and tp_is_empty!23549 tp!70652))))

(declare-datatypes ((B!1482 0))(
  ( (B!1483 (val!11825 Int)) )
))
(declare-datatypes ((tuple2!15196 0))(
  ( (tuple2!15197 (_1!7609 (_ BitVec 64)) (_2!7609 B!1482)) )
))
(declare-datatypes ((List!21477 0))(
  ( (Nil!21474) (Cons!21473 (h!22671 tuple2!15196) (t!30478 List!21477)) )
))
(declare-fun l!1114 () List!21477)

(assert (= (and start!87910 (is-Cons!21473 l!1114)) b!1015520))

(push 1)

(assert (not b!1015520))

(assert tp_is_empty!23549)

(check-sat)

(pop 1)

