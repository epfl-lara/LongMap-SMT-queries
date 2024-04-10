; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106738 () Bool)

(assert start!106738)

(assert (=> start!106738 false))

(declare-fun e!721856 () Bool)

(assert (=> start!106738 e!721856))

(assert (=> start!106738 true))

(declare-fun b!1267195 () Bool)

(declare-fun tp_is_empty!32581 () Bool)

(declare-fun tp!96560 () Bool)

(assert (=> b!1267195 (= e!721856 (and tp_is_empty!32581 tp!96560))))

(declare-datatypes ((B!2060 0))(
  ( (B!2061 (val!16365 Int)) )
))
(declare-datatypes ((tuple2!21248 0))(
  ( (tuple2!21249 (_1!10635 (_ BitVec 64)) (_2!10635 B!2060)) )
))
(declare-datatypes ((List!28357 0))(
  ( (Nil!28354) (Cons!28353 (h!29562 tuple2!21248) (t!41884 List!28357)) )
))
(declare-fun l!874 () List!28357)

(assert (= (and start!106738 (is-Cons!28353 l!874)) b!1267195))

(push 1)

(assert (not b!1267195))

(assert tp_is_empty!32581)

(check-sat)

(pop 1)

