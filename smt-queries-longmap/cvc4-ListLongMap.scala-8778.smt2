; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106742 () Bool)

(assert start!106742)

(assert (=> start!106742 false))

(declare-fun e!721862 () Bool)

(assert (=> start!106742 e!721862))

(assert (=> start!106742 true))

(declare-fun b!1267201 () Bool)

(declare-fun tp_is_empty!32585 () Bool)

(declare-fun tp!96566 () Bool)

(assert (=> b!1267201 (= e!721862 (and tp_is_empty!32585 tp!96566))))

(declare-datatypes ((B!2064 0))(
  ( (B!2065 (val!16367 Int)) )
))
(declare-datatypes ((tuple2!21252 0))(
  ( (tuple2!21253 (_1!10637 (_ BitVec 64)) (_2!10637 B!2064)) )
))
(declare-datatypes ((List!28359 0))(
  ( (Nil!28356) (Cons!28355 (h!29564 tuple2!21252) (t!41886 List!28359)) )
))
(declare-fun l!874 () List!28359)

(assert (= (and start!106742 (is-Cons!28355 l!874)) b!1267201))

(push 1)

(assert (not b!1267201))

(assert tp_is_empty!32585)

(check-sat)

