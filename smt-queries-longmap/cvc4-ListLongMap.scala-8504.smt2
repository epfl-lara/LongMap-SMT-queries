; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103672 () Bool)

(assert start!103672)

(assert (=> start!103672 false))

(assert (=> start!103672 true))

(declare-fun e!703767 () Bool)

(assert (=> start!103672 e!703767))

(declare-fun b!1241600 () Bool)

(declare-fun tp_is_empty!31253 () Bool)

(declare-fun tp!92660 () Bool)

(assert (=> b!1241600 (= e!703767 (and tp_is_empty!31253 tp!92660))))

(declare-datatypes ((B!1854 0))(
  ( (B!1855 (val!15689 Int)) )
))
(declare-datatypes ((tuple2!20250 0))(
  ( (tuple2!20251 (_1!10136 (_ BitVec 64)) (_2!10136 B!1854)) )
))
(declare-datatypes ((List!27354 0))(
  ( (Nil!27351) (Cons!27350 (h!28559 tuple2!20250) (t!40817 List!27354)) )
))
(declare-fun l!644 () List!27354)

(assert (= (and start!103672 (is-Cons!27350 l!644)) b!1241600))

(push 1)

(assert (not b!1241600))

(assert tp_is_empty!31253)

