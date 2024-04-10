; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43756 () Bool)

(assert start!43756)

(assert (=> start!43756 false))

(declare-fun e!284760 () Bool)

(assert (=> start!43756 e!284760))

(assert (=> start!43756 true))

(declare-fun b!483803 () Bool)

(declare-fun tp_is_empty!13895 () Bool)

(declare-fun tp!43432 () Bool)

(assert (=> b!483803 (= e!284760 (and tp_is_empty!13895 tp!43432))))

(declare-datatypes ((B!1086 0))(
  ( (B!1087 (val!6995 Int)) )
))
(declare-datatypes ((tuple2!9192 0))(
  ( (tuple2!9193 (_1!4607 (_ BitVec 64)) (_2!4607 B!1086)) )
))
(declare-datatypes ((List!9259 0))(
  ( (Nil!9256) (Cons!9255 (h!10111 tuple2!9192) (t!15481 List!9259)) )
))
(declare-fun l!956 () List!9259)

(assert (= (and start!43756 (is-Cons!9255 l!956)) b!483803))

(push 1)

(assert (not b!483803))

(assert tp_is_empty!13895)

(check-sat)

(pop 1)

(push 1)

(check-sat)

