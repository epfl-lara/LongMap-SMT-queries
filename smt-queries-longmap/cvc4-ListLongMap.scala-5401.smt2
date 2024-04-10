; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72118 () Bool)

(assert start!72118)

(assert (=> start!72118 false))

(declare-fun e!466899 () Bool)

(assert (=> start!72118 e!466899))

(declare-fun b!836762 () Bool)

(declare-fun tp_is_empty!15281 () Bool)

(declare-fun tp!47506 () Bool)

(assert (=> b!836762 (= e!466899 (and tp_is_empty!15281 tp!47506))))

(declare-datatypes ((B!1212 0))(
  ( (B!1213 (val!7688 Int)) )
))
(declare-datatypes ((tuple2!10236 0))(
  ( (tuple2!10237 (_1!5129 (_ BitVec 64)) (_2!5129 B!1212)) )
))
(declare-datatypes ((List!15999 0))(
  ( (Nil!15996) (Cons!15995 (h!17126 tuple2!10236) (t!22370 List!15999)) )
))
(declare-fun l!390 () List!15999)

(assert (= (and start!72118 (is-Cons!15995 l!390)) b!836762))

(push 1)

(assert (not b!836762))

(assert tp_is_empty!15281)

(check-sat)

