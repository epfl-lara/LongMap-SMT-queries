; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106714 () Bool)

(assert start!106714)

(assert (=> start!106714 false))

(declare-fun e!721811 () Bool)

(assert (=> start!106714 e!721811))

(declare-fun b!1267114 () Bool)

(declare-fun tp_is_empty!32557 () Bool)

(declare-fun tp!96524 () Bool)

(assert (=> b!1267114 (= e!721811 (and tp_is_empty!32557 tp!96524))))

(declare-datatypes ((B!2036 0))(
  ( (B!2037 (val!16353 Int)) )
))
(declare-datatypes ((tuple2!21224 0))(
  ( (tuple2!21225 (_1!10623 (_ BitVec 64)) (_2!10623 B!2036)) )
))
(declare-datatypes ((List!28345 0))(
  ( (Nil!28342) (Cons!28341 (h!29550 tuple2!21224) (t!41872 List!28345)) )
))
(declare-fun l!874 () List!28345)

(assert (= (and start!106714 (is-Cons!28341 l!874)) b!1267114))

(push 1)

(assert (not b!1267114))

(assert tp_is_empty!32557)

(check-sat)

(pop 1)

