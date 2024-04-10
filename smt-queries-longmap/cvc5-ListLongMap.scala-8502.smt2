; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103644 () Bool)

(assert start!103644)

(assert (=> start!103644 false))

(assert (=> start!103644 true))

(declare-fun e!703674 () Bool)

(assert (=> start!103644 e!703674))

(declare-fun b!1241465 () Bool)

(declare-fun tp_is_empty!31237 () Bool)

(declare-fun tp!92627 () Bool)

(assert (=> b!1241465 (= e!703674 (and tp_is_empty!31237 tp!92627))))

(declare-datatypes ((B!1838 0))(
  ( (B!1839 (val!15681 Int)) )
))
(declare-datatypes ((tuple2!20234 0))(
  ( (tuple2!20235 (_1!10128 (_ BitVec 64)) (_2!10128 B!1838)) )
))
(declare-datatypes ((List!27346 0))(
  ( (Nil!27343) (Cons!27342 (h!28551 tuple2!20234) (t!40809 List!27346)) )
))
(declare-fun l!644 () List!27346)

(assert (= (and start!103644 (is-Cons!27342 l!644)) b!1241465))

(push 1)

(assert (not b!1241465))

(assert tp_is_empty!31237)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

