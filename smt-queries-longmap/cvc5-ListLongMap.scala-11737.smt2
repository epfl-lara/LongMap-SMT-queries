; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137658 () Bool)

(assert start!137658)

(assert (=> start!137658 false))

(declare-fun e!883148 () Bool)

(assert (=> start!137658 e!883148))

(assert (=> start!137658 true))

(declare-fun b!1582447 () Bool)

(declare-fun tp_is_empty!39307 () Bool)

(declare-fun tp!114740 () Bool)

(assert (=> b!1582447 (= e!883148 (and tp_is_empty!39307 tp!114740))))

(declare-datatypes ((B!2762 0))(
  ( (B!2763 (val!19743 Int)) )
))
(declare-datatypes ((tuple2!25654 0))(
  ( (tuple2!25655 (_1!12838 (_ BitVec 64)) (_2!12838 B!2762)) )
))
(declare-datatypes ((List!36863 0))(
  ( (Nil!36860) (Cons!36859 (h!38402 tuple2!25654) (t!51777 List!36863)) )
))
(declare-fun l!1356 () List!36863)

(assert (= (and start!137658 (is-Cons!36859 l!1356)) b!1582447))

(push 1)

(assert (not b!1582447))

(assert tp_is_empty!39307)

(check-sat)

