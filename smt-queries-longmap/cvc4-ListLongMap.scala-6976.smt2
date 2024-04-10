; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88400 () Bool)

(assert start!88400)

(assert (=> start!88400 false))

(declare-fun e!572409 () Bool)

(assert (=> start!88400 e!572409))

(declare-fun b!1017413 () Bool)

(declare-fun tp_is_empty!23633 () Bool)

(declare-fun tp!70870 () Bool)

(assert (=> b!1017413 (= e!572409 (and tp_is_empty!23633 tp!70870))))

(declare-datatypes ((B!1566 0))(
  ( (B!1567 (val!11867 Int)) )
))
(declare-datatypes ((tuple2!15280 0))(
  ( (tuple2!15281 (_1!7651 (_ BitVec 64)) (_2!7651 B!1566)) )
))
(declare-datatypes ((List!21555 0))(
  ( (Nil!21552) (Cons!21551 (h!22749 tuple2!15280) (t!30556 List!21555)) )
))
(declare-fun l!1036 () List!21555)

(assert (= (and start!88400 (is-Cons!21551 l!1036)) b!1017413))

(push 1)

(assert (not b!1017413))

(assert tp_is_empty!23633)

(check-sat)

(pop 1)

(push 1)

