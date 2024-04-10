; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43750 () Bool)

(assert start!43750)

(assert (=> start!43750 false))

(declare-fun e!284751 () Bool)

(assert (=> start!43750 e!284751))

(declare-fun b!483794 () Bool)

(declare-fun tp_is_empty!13889 () Bool)

(declare-fun tp!43423 () Bool)

(assert (=> b!483794 (= e!284751 (and tp_is_empty!13889 tp!43423))))

(declare-datatypes ((B!1080 0))(
  ( (B!1081 (val!6992 Int)) )
))
(declare-datatypes ((tuple2!9186 0))(
  ( (tuple2!9187 (_1!4604 (_ BitVec 64)) (_2!4604 B!1080)) )
))
(declare-datatypes ((List!9256 0))(
  ( (Nil!9253) (Cons!9252 (h!10108 tuple2!9186) (t!15478 List!9256)) )
))
(declare-fun l!956 () List!9256)

(assert (= (and start!43750 (is-Cons!9252 l!956)) b!483794))

(push 1)

(assert (not b!483794))

(assert tp_is_empty!13889)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

