; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134408 () Bool)

(assert start!134408)

(assert (=> start!134408 false))

(assert (=> start!134408 true))

(declare-fun e!874910 () Bool)

(assert (=> start!134408 e!874910))

(declare-fun b!1569450 () Bool)

(declare-fun tp_is_empty!39061 () Bool)

(declare-fun tp!114120 () Bool)

(assert (=> b!1569450 (= e!874910 (and tp_is_empty!39061 tp!114120))))

(declare-datatypes ((B!2510 0))(
  ( (B!2511 (val!19617 Int)) )
))
(declare-datatypes ((tuple2!25336 0))(
  ( (tuple2!25337 (_1!12679 (_ BitVec 64)) (_2!12679 B!2510)) )
))
(declare-datatypes ((List!36737 0))(
  ( (Nil!36734) (Cons!36733 (h!38180 tuple2!25336) (t!51645 List!36737)) )
))
(declare-fun l!750 () List!36737)

(assert (= (and start!134408 (is-Cons!36733 l!750)) b!1569450))

(push 1)

(assert (not b!1569450))

(assert tp_is_empty!39061)

(check-sat)

