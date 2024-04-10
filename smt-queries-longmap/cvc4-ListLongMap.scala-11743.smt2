; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137728 () Bool)

(assert start!137728)

(assert (=> start!137728 false))

(declare-fun e!883307 () Bool)

(assert (=> start!137728 e!883307))

(assert (=> start!137728 true))

(declare-fun b!1582627 () Bool)

(declare-fun tp_is_empty!39335 () Bool)

(declare-fun tp!114818 () Bool)

(assert (=> b!1582627 (= e!883307 (and tp_is_empty!39335 tp!114818))))

(declare-datatypes ((B!2802 0))(
  ( (B!2803 (val!19763 Int)) )
))
(declare-datatypes ((tuple2!25694 0))(
  ( (tuple2!25695 (_1!12858 (_ BitVec 64)) (_2!12858 B!2802)) )
))
(declare-datatypes ((List!36883 0))(
  ( (Nil!36880) (Cons!36879 (h!38422 tuple2!25694) (t!51797 List!36883)) )
))
(declare-fun l!1065 () List!36883)

(assert (= (and start!137728 (is-Cons!36879 l!1065)) b!1582627))

(push 1)

(assert (not b!1582627))

(assert tp_is_empty!39335)

(check-sat)

(pop 1)

