; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106730 () Bool)

(assert start!106730)

(assert (=> start!106730 false))

(declare-fun e!721835 () Bool)

(assert (=> start!106730 e!721835))

(assert (=> start!106730 true))

(declare-fun b!1267138 () Bool)

(declare-fun tp_is_empty!32573 () Bool)

(declare-fun tp!96548 () Bool)

(assert (=> b!1267138 (= e!721835 (and tp_is_empty!32573 tp!96548))))

(declare-datatypes ((B!2052 0))(
  ( (B!2053 (val!16361 Int)) )
))
(declare-datatypes ((tuple2!21240 0))(
  ( (tuple2!21241 (_1!10631 (_ BitVec 64)) (_2!10631 B!2052)) )
))
(declare-datatypes ((List!28353 0))(
  ( (Nil!28350) (Cons!28349 (h!29558 tuple2!21240) (t!41880 List!28353)) )
))
(declare-fun l!874 () List!28353)

(assert (= (and start!106730 (is-Cons!28349 l!874)) b!1267138))

(push 1)

(assert (not b!1267138))

(assert tp_is_empty!32573)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

