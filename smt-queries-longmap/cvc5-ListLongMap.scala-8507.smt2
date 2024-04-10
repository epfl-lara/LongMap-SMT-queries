; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103710 () Bool)

(assert start!103710)

(assert (=> start!103710 false))

(assert (=> start!103710 true))

(declare-fun e!703920 () Bool)

(assert (=> start!103710 e!703920))

(declare-fun b!1241846 () Bool)

(declare-fun tp_is_empty!31267 () Bool)

(declare-fun tp!92699 () Bool)

(assert (=> b!1241846 (= e!703920 (and tp_is_empty!31267 tp!92699))))

(declare-datatypes ((B!1868 0))(
  ( (B!1869 (val!15696 Int)) )
))
(declare-datatypes ((tuple2!20264 0))(
  ( (tuple2!20265 (_1!10143 (_ BitVec 64)) (_2!10143 B!1868)) )
))
(declare-datatypes ((List!27361 0))(
  ( (Nil!27358) (Cons!27357 (h!28566 tuple2!20264) (t!40824 List!27361)) )
))
(declare-fun l!644 () List!27361)

(assert (= (and start!103710 (is-Cons!27357 l!644)) b!1241846))

(push 1)

(assert (not b!1241846))

(assert tp_is_empty!31267)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

