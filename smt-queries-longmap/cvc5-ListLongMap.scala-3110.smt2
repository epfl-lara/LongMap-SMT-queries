; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43752 () Bool)

(assert start!43752)

(assert (=> start!43752 false))

(declare-fun e!284754 () Bool)

(assert (=> start!43752 e!284754))

(assert (=> start!43752 true))

(declare-fun b!483797 () Bool)

(declare-fun tp_is_empty!13891 () Bool)

(declare-fun tp!43426 () Bool)

(assert (=> b!483797 (= e!284754 (and tp_is_empty!13891 tp!43426))))

(declare-datatypes ((B!1082 0))(
  ( (B!1083 (val!6993 Int)) )
))
(declare-datatypes ((tuple2!9188 0))(
  ( (tuple2!9189 (_1!4605 (_ BitVec 64)) (_2!4605 B!1082)) )
))
(declare-datatypes ((List!9257 0))(
  ( (Nil!9254) (Cons!9253 (h!10109 tuple2!9188) (t!15479 List!9257)) )
))
(declare-fun l!956 () List!9257)

(assert (= (and start!43752 (is-Cons!9253 l!956)) b!483797))

(push 1)

(assert (not b!483797))

(assert tp_is_empty!13891)

(check-sat)

(pop 1)

