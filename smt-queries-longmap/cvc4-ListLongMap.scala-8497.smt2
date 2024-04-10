; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103570 () Bool)

(assert start!103570)

(assert (=> start!103570 false))

(assert (=> start!103570 true))

(declare-fun e!703305 () Bool)

(assert (=> start!103570 e!703305))

(declare-fun b!1240787 () Bool)

(declare-fun tp_is_empty!31211 () Bool)

(declare-fun tp!92570 () Bool)

(assert (=> b!1240787 (= e!703305 (and tp_is_empty!31211 tp!92570))))

(declare-datatypes ((B!1812 0))(
  ( (B!1813 (val!15668 Int)) )
))
(declare-datatypes ((tuple2!20208 0))(
  ( (tuple2!20209 (_1!10115 (_ BitVec 64)) (_2!10115 B!1812)) )
))
(declare-datatypes ((List!27333 0))(
  ( (Nil!27330) (Cons!27329 (h!28538 tuple2!20208) (t!40796 List!27333)) )
))
(declare-fun l!644 () List!27333)

(assert (= (and start!103570 (is-Cons!27329 l!644)) b!1240787))

(push 1)

(assert (not b!1240787))

(assert tp_is_empty!31211)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

