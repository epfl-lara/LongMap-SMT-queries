; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137724 () Bool)

(assert start!137724)

(assert (=> start!137724 false))

(declare-fun e!883301 () Bool)

(assert (=> start!137724 e!883301))

(assert (=> start!137724 true))

(declare-fun b!1582621 () Bool)

(declare-fun tp_is_empty!39331 () Bool)

(declare-fun tp!114812 () Bool)

(assert (=> b!1582621 (= e!883301 (and tp_is_empty!39331 tp!114812))))

(declare-datatypes ((B!2798 0))(
  ( (B!2799 (val!19761 Int)) )
))
(declare-datatypes ((tuple2!25690 0))(
  ( (tuple2!25691 (_1!12856 (_ BitVec 64)) (_2!12856 B!2798)) )
))
(declare-datatypes ((List!36881 0))(
  ( (Nil!36878) (Cons!36877 (h!38420 tuple2!25690) (t!51795 List!36881)) )
))
(declare-fun l!1065 () List!36881)

(assert (= (and start!137724 (is-Cons!36877 l!1065)) b!1582621))

(push 1)

(assert (not b!1582621))

(assert tp_is_empty!39331)

(check-sat)

