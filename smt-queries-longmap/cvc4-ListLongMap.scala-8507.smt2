; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103714 () Bool)

(assert start!103714)

(assert (=> start!103714 false))

(assert (=> start!103714 true))

(declare-fun e!703926 () Bool)

(assert (=> start!103714 e!703926))

(declare-fun b!1241852 () Bool)

(declare-fun tp_is_empty!31271 () Bool)

(declare-fun tp!92705 () Bool)

(assert (=> b!1241852 (= e!703926 (and tp_is_empty!31271 tp!92705))))

(declare-datatypes ((B!1872 0))(
  ( (B!1873 (val!15698 Int)) )
))
(declare-datatypes ((tuple2!20268 0))(
  ( (tuple2!20269 (_1!10145 (_ BitVec 64)) (_2!10145 B!1872)) )
))
(declare-datatypes ((List!27363 0))(
  ( (Nil!27360) (Cons!27359 (h!28568 tuple2!20268) (t!40826 List!27363)) )
))
(declare-fun l!644 () List!27363)

(assert (= (and start!103714 (is-Cons!27359 l!644)) b!1241852))

(push 1)

(assert (not b!1241852))

(assert tp_is_empty!31271)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

