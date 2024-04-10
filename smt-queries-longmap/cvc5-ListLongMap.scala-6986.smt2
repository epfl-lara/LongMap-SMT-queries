; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88582 () Bool)

(assert start!88582)

(assert (=> start!88582 false))

(declare-fun e!572910 () Bool)

(assert (=> start!88582 e!572910))

(assert (=> start!88582 true))

(declare-fun b!1018232 () Bool)

(declare-fun tp_is_empty!23689 () Bool)

(declare-fun tp!71002 () Bool)

(assert (=> b!1018232 (= e!572910 (and tp_is_empty!23689 tp!71002))))

(declare-datatypes ((B!1622 0))(
  ( (B!1623 (val!11895 Int)) )
))
(declare-datatypes ((tuple2!15336 0))(
  ( (tuple2!15337 (_1!7679 (_ BitVec 64)) (_2!7679 B!1622)) )
))
(declare-datatypes ((List!21583 0))(
  ( (Nil!21580) (Cons!21579 (h!22777 tuple2!15336) (t!30584 List!21583)) )
))
(declare-fun l!996 () List!21583)

(assert (= (and start!88582 (is-Cons!21579 l!996)) b!1018232))

(push 1)

(assert (not b!1018232))

(assert tp_is_empty!23689)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

