; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7100 () Bool)

(assert start!7100)

(assert (=> start!7100 false))

(declare-fun e!28970 () Bool)

(assert (=> start!7100 e!28970))

(declare-fun b!45501 () Bool)

(declare-fun tp_is_empty!1919 () Bool)

(declare-fun tp!5972 () Bool)

(assert (=> b!45501 (= e!28970 (and tp_is_empty!1919 tp!5972))))

(declare-datatypes ((B!822 0))(
  ( (B!823 (val!998 Int)) )
))
(declare-datatypes ((tuple2!1644 0))(
  ( (tuple2!1645 (_1!833 (_ BitVec 64)) (_2!833 B!822)) )
))
(declare-datatypes ((List!1216 0))(
  ( (Nil!1213) (Cons!1212 (h!1792 tuple2!1644) (t!4241 List!1216)) )
))
(declare-fun l!812 () List!1216)

(assert (= (and start!7100 (is-Cons!1212 l!812)) b!45501))

(push 1)

(assert (not b!45501))

(assert tp_is_empty!1919)

(check-sat)

