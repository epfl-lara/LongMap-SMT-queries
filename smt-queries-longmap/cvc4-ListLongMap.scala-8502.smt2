; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103648 () Bool)

(assert start!103648)

(assert (=> start!103648 false))

(assert (=> start!103648 true))

(declare-fun e!703680 () Bool)

(assert (=> start!103648 e!703680))

(declare-fun b!1241471 () Bool)

(declare-fun tp_is_empty!31241 () Bool)

(declare-fun tp!92633 () Bool)

(assert (=> b!1241471 (= e!703680 (and tp_is_empty!31241 tp!92633))))

(declare-datatypes ((B!1842 0))(
  ( (B!1843 (val!15683 Int)) )
))
(declare-datatypes ((tuple2!20238 0))(
  ( (tuple2!20239 (_1!10130 (_ BitVec 64)) (_2!10130 B!1842)) )
))
(declare-datatypes ((List!27348 0))(
  ( (Nil!27345) (Cons!27344 (h!28553 tuple2!20238) (t!40811 List!27348)) )
))
(declare-fun l!644 () List!27348)

(assert (= (and start!103648 (is-Cons!27344 l!644)) b!1241471))

(push 1)

(assert (not b!1241471))

(assert tp_is_empty!31241)

(check-sat)

