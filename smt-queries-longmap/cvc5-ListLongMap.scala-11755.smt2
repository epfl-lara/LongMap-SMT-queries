; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137932 () Bool)

(assert start!137932)

(assert (=> start!137932 false))

(declare-fun e!883963 () Bool)

(assert (=> start!137932 e!883963))

(declare-fun b!1583590 () Bool)

(declare-fun tp_is_empty!39403 () Bool)

(declare-fun tp!114994 () Bool)

(assert (=> b!1583590 (= e!883963 (and tp_is_empty!39403 tp!114994))))

(declare-datatypes ((B!2870 0))(
  ( (B!2871 (val!19797 Int)) )
))
(declare-datatypes ((tuple2!25762 0))(
  ( (tuple2!25763 (_1!12892 (_ BitVec 64)) (_2!12892 B!2870)) )
))
(declare-datatypes ((List!36917 0))(
  ( (Nil!36914) (Cons!36913 (h!38456 tuple2!25762) (t!51831 List!36917)) )
))
(declare-fun l!1251 () List!36917)

(assert (= (and start!137932 (is-Cons!36913 l!1251)) b!1583590))

(push 1)

(assert (not b!1583590))

(assert tp_is_empty!39403)

(check-sat)

(pop 1)

