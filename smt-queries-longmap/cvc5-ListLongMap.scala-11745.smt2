; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137736 () Bool)

(assert start!137736)

(assert (=> start!137736 false))

(declare-fun e!883328 () Bool)

(assert (=> start!137736 e!883328))

(assert (=> start!137736 true))

(declare-fun b!1582684 () Bool)

(declare-fun tp_is_empty!39343 () Bool)

(declare-fun tp!114830 () Bool)

(assert (=> b!1582684 (= e!883328 (and tp_is_empty!39343 tp!114830))))

(declare-datatypes ((B!2810 0))(
  ( (B!2811 (val!19767 Int)) )
))
(declare-datatypes ((tuple2!25702 0))(
  ( (tuple2!25703 (_1!12862 (_ BitVec 64)) (_2!12862 B!2810)) )
))
(declare-datatypes ((List!36887 0))(
  ( (Nil!36884) (Cons!36883 (h!38426 tuple2!25702) (t!51801 List!36887)) )
))
(declare-fun l!1065 () List!36887)

(assert (= (and start!137736 (is-Cons!36883 l!1065)) b!1582684))

(push 1)

(assert (not b!1582684))

(assert tp_is_empty!39343)

(check-sat)

(pop 1)

