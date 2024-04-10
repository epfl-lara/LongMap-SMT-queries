; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106726 () Bool)

(assert start!106726)

(assert (=> start!106726 false))

(declare-fun e!721829 () Bool)

(assert (=> start!106726 e!721829))

(assert (=> start!106726 true))

(declare-fun b!1267132 () Bool)

(declare-fun tp_is_empty!32569 () Bool)

(declare-fun tp!96542 () Bool)

(assert (=> b!1267132 (= e!721829 (and tp_is_empty!32569 tp!96542))))

(declare-datatypes ((B!2048 0))(
  ( (B!2049 (val!16359 Int)) )
))
(declare-datatypes ((tuple2!21236 0))(
  ( (tuple2!21237 (_1!10629 (_ BitVec 64)) (_2!10629 B!2048)) )
))
(declare-datatypes ((List!28351 0))(
  ( (Nil!28348) (Cons!28347 (h!29556 tuple2!21236) (t!41878 List!28351)) )
))
(declare-fun l!874 () List!28351)

(assert (= (and start!106726 (is-Cons!28347 l!874)) b!1267132))

(push 1)

(assert (not b!1267132))

(assert tp_is_empty!32569)

(check-sat)

(pop 1)

