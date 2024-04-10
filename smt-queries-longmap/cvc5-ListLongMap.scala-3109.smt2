; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43746 () Bool)

(assert start!43746)

(assert (=> start!43746 false))

(declare-fun e!284745 () Bool)

(assert (=> start!43746 e!284745))

(declare-fun b!483788 () Bool)

(declare-fun tp_is_empty!13885 () Bool)

(declare-fun tp!43417 () Bool)

(assert (=> b!483788 (= e!284745 (and tp_is_empty!13885 tp!43417))))

(declare-datatypes ((B!1076 0))(
  ( (B!1077 (val!6990 Int)) )
))
(declare-datatypes ((tuple2!9182 0))(
  ( (tuple2!9183 (_1!4602 (_ BitVec 64)) (_2!4602 B!1076)) )
))
(declare-datatypes ((List!9254 0))(
  ( (Nil!9251) (Cons!9250 (h!10106 tuple2!9182) (t!15476 List!9254)) )
))
(declare-fun l!956 () List!9254)

(assert (= (and start!43746 (is-Cons!9250 l!956)) b!483788))

(push 1)

(assert (not b!483788))

(assert tp_is_empty!13885)

(check-sat)

