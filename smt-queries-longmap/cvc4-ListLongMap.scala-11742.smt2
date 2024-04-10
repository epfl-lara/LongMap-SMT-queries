; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137722 () Bool)

(assert start!137722)

(assert (=> start!137722 false))

(declare-fun e!883298 () Bool)

(assert (=> start!137722 e!883298))

(declare-fun b!1582618 () Bool)

(declare-fun tp_is_empty!39329 () Bool)

(declare-fun tp!114809 () Bool)

(assert (=> b!1582618 (= e!883298 (and tp_is_empty!39329 tp!114809))))

(declare-datatypes ((B!2796 0))(
  ( (B!2797 (val!19760 Int)) )
))
(declare-datatypes ((tuple2!25688 0))(
  ( (tuple2!25689 (_1!12855 (_ BitVec 64)) (_2!12855 B!2796)) )
))
(declare-datatypes ((List!36880 0))(
  ( (Nil!36877) (Cons!36876 (h!38419 tuple2!25688) (t!51794 List!36880)) )
))
(declare-fun l!1065 () List!36880)

(assert (= (and start!137722 (is-Cons!36876 l!1065)) b!1582618))

(push 1)

(assert (not b!1582618))

(assert tp_is_empty!39329)

(check-sat)

(pop 1)

(push 1)

(check-sat)

