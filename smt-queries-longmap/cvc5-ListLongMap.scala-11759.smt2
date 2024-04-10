; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137980 () Bool)

(assert start!137980)

(assert (=> start!137980 false))

(declare-fun e!884155 () Bool)

(assert (=> start!137980 e!884155))

(assert (=> start!137980 true))

(declare-fun b!1583929 () Bool)

(declare-fun tp_is_empty!39427 () Bool)

(declare-fun tp!115039 () Bool)

(assert (=> b!1583929 (= e!884155 (and tp_is_empty!39427 tp!115039))))

(declare-datatypes ((B!2894 0))(
  ( (B!2895 (val!19809 Int)) )
))
(declare-datatypes ((tuple2!25786 0))(
  ( (tuple2!25787 (_1!12904 (_ BitVec 64)) (_2!12904 B!2894)) )
))
(declare-datatypes ((List!36929 0))(
  ( (Nil!36926) (Cons!36925 (h!38468 tuple2!25786) (t!51843 List!36929)) )
))
(declare-fun l!1251 () List!36929)

(assert (= (and start!137980 (is-Cons!36925 l!1251)) b!1583929))

(push 1)

(assert (not b!1583929))

(assert tp_is_empty!39427)

(check-sat)

(pop 1)

