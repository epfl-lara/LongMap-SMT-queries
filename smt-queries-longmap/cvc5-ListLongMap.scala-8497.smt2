; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103566 () Bool)

(assert start!103566)

(assert (=> start!103566 false))

(assert (=> start!103566 true))

(declare-fun e!703299 () Bool)

(assert (=> start!103566 e!703299))

(declare-fun b!1240781 () Bool)

(declare-fun tp_is_empty!31207 () Bool)

(declare-fun tp!92564 () Bool)

(assert (=> b!1240781 (= e!703299 (and tp_is_empty!31207 tp!92564))))

(declare-datatypes ((B!1808 0))(
  ( (B!1809 (val!15666 Int)) )
))
(declare-datatypes ((tuple2!20204 0))(
  ( (tuple2!20205 (_1!10113 (_ BitVec 64)) (_2!10113 B!1808)) )
))
(declare-datatypes ((List!27331 0))(
  ( (Nil!27328) (Cons!27327 (h!28536 tuple2!20204) (t!40794 List!27331)) )
))
(declare-fun l!644 () List!27331)

(assert (= (and start!103566 (is-Cons!27327 l!644)) b!1240781))

(push 1)

(assert (not b!1240781))

(assert tp_is_empty!31207)

(check-sat)

(pop 1)

