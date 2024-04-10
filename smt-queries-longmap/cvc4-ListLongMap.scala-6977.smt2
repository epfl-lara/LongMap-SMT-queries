; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88406 () Bool)

(assert start!88406)

(assert (=> start!88406 false))

(declare-fun e!572418 () Bool)

(assert (=> start!88406 e!572418))

(assert (=> start!88406 true))

(declare-fun b!1017422 () Bool)

(declare-fun tp_is_empty!23639 () Bool)

(declare-fun tp!70879 () Bool)

(assert (=> b!1017422 (= e!572418 (and tp_is_empty!23639 tp!70879))))

(declare-datatypes ((B!1572 0))(
  ( (B!1573 (val!11870 Int)) )
))
(declare-datatypes ((tuple2!15286 0))(
  ( (tuple2!15287 (_1!7654 (_ BitVec 64)) (_2!7654 B!1572)) )
))
(declare-datatypes ((List!21558 0))(
  ( (Nil!21555) (Cons!21554 (h!22752 tuple2!15286) (t!30559 List!21558)) )
))
(declare-fun l!1036 () List!21558)

(assert (= (and start!88406 (is-Cons!21554 l!1036)) b!1017422))

(push 1)

(assert (not b!1017422))

(assert tp_is_empty!23639)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

