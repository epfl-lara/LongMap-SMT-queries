; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137984 () Bool)

(assert start!137984)

(assert (=> start!137984 false))

(declare-fun e!884161 () Bool)

(assert (=> start!137984 e!884161))

(assert (=> start!137984 true))

(declare-fun b!1583935 () Bool)

(declare-fun tp_is_empty!39431 () Bool)

(declare-fun tp!115045 () Bool)

(assert (=> b!1583935 (= e!884161 (and tp_is_empty!39431 tp!115045))))

(declare-datatypes ((B!2898 0))(
  ( (B!2899 (val!19811 Int)) )
))
(declare-datatypes ((tuple2!25790 0))(
  ( (tuple2!25791 (_1!12906 (_ BitVec 64)) (_2!12906 B!2898)) )
))
(declare-datatypes ((List!36931 0))(
  ( (Nil!36928) (Cons!36927 (h!38470 tuple2!25790) (t!51845 List!36931)) )
))
(declare-fun l!1251 () List!36931)

(assert (= (and start!137984 (is-Cons!36927 l!1251)) b!1583935))

(push 1)

(assert (not b!1583935))

(assert tp_is_empty!39431)

(check-sat)

(pop 1)

(push 1)

(check-sat)

