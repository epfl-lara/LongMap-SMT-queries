; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106724 () Bool)

(assert start!106724)

(assert (=> start!106724 false))

(declare-fun e!721826 () Bool)

(assert (=> start!106724 e!721826))

(assert (=> start!106724 true))

(declare-fun b!1267129 () Bool)

(declare-fun tp_is_empty!32567 () Bool)

(declare-fun tp!96539 () Bool)

(assert (=> b!1267129 (= e!721826 (and tp_is_empty!32567 tp!96539))))

(declare-datatypes ((B!2046 0))(
  ( (B!2047 (val!16358 Int)) )
))
(declare-datatypes ((tuple2!21234 0))(
  ( (tuple2!21235 (_1!10628 (_ BitVec 64)) (_2!10628 B!2046)) )
))
(declare-datatypes ((List!28350 0))(
  ( (Nil!28347) (Cons!28346 (h!29555 tuple2!21234) (t!41877 List!28350)) )
))
(declare-fun l!874 () List!28350)

(assert (= (and start!106724 (is-Cons!28346 l!874)) b!1267129))

(push 1)

(assert (not b!1267129))

(assert tp_is_empty!32567)

(check-sat)

(pop 1)

(push 1)

