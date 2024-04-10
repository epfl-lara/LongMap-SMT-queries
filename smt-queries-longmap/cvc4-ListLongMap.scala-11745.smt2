; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137740 () Bool)

(assert start!137740)

(assert (=> start!137740 false))

(declare-fun e!883334 () Bool)

(assert (=> start!137740 e!883334))

(assert (=> start!137740 true))

(declare-fun b!1582690 () Bool)

(declare-fun tp_is_empty!39347 () Bool)

(declare-fun tp!114836 () Bool)

(assert (=> b!1582690 (= e!883334 (and tp_is_empty!39347 tp!114836))))

(declare-datatypes ((B!2814 0))(
  ( (B!2815 (val!19769 Int)) )
))
(declare-datatypes ((tuple2!25706 0))(
  ( (tuple2!25707 (_1!12864 (_ BitVec 64)) (_2!12864 B!2814)) )
))
(declare-datatypes ((List!36889 0))(
  ( (Nil!36886) (Cons!36885 (h!38428 tuple2!25706) (t!51803 List!36889)) )
))
(declare-fun l!1065 () List!36889)

(assert (= (and start!137740 (is-Cons!36885 l!1065)) b!1582690))

(push 1)

(assert (not b!1582690))

(assert tp_is_empty!39347)

(check-sat)

(pop 1)

