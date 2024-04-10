; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137652 () Bool)

(assert start!137652)

(assert (=> start!137652 false))

(declare-fun e!883139 () Bool)

(assert (=> start!137652 e!883139))

(assert (=> start!137652 true))

(declare-fun b!1582438 () Bool)

(declare-fun tp_is_empty!39301 () Bool)

(declare-fun tp!114731 () Bool)

(assert (=> b!1582438 (= e!883139 (and tp_is_empty!39301 tp!114731))))

(declare-datatypes ((B!2756 0))(
  ( (B!2757 (val!19740 Int)) )
))
(declare-datatypes ((tuple2!25648 0))(
  ( (tuple2!25649 (_1!12835 (_ BitVec 64)) (_2!12835 B!2756)) )
))
(declare-datatypes ((List!36860 0))(
  ( (Nil!36857) (Cons!36856 (h!38399 tuple2!25648) (t!51774 List!36860)) )
))
(declare-fun l!1356 () List!36860)

(assert (= (and start!137652 (is-Cons!36856 l!1356)) b!1582438))

(push 1)

(assert (not b!1582438))

(assert tp_is_empty!39301)

(check-sat)

(pop 1)

