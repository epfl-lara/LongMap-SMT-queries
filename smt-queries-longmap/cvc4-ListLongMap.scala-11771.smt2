; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138192 () Bool)

(assert start!138192)

(assert (=> start!138192 false))

(declare-fun e!885027 () Bool)

(assert (=> start!138192 e!885027))

(assert (=> start!138192 true))

(declare-fun b!1585232 () Bool)

(declare-fun tp_is_empty!39503 () Bool)

(declare-fun tp!115221 () Bool)

(assert (=> b!1585232 (= e!885027 (and tp_is_empty!39503 tp!115221))))

(declare-datatypes ((B!2970 0))(
  ( (B!2971 (val!19847 Int)) )
))
(declare-datatypes ((tuple2!25862 0))(
  ( (tuple2!25863 (_1!12942 (_ BitVec 64)) (_2!12942 B!2970)) )
))
(declare-datatypes ((List!36967 0))(
  ( (Nil!36964) (Cons!36963 (h!38506 tuple2!25862) (t!51885 List!36967)) )
))
(declare-fun l!556 () List!36967)

(assert (= (and start!138192 (is-Cons!36963 l!556)) b!1585232))

(push 1)

(assert (not b!1585232))

(assert tp_is_empty!39503)

(check-sat)

(pop 1)

(push 1)

(check-sat)

