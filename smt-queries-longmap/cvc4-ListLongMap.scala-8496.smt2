; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103564 () Bool)

(assert start!103564)

(assert (=> start!103564 false))

(assert (=> start!103564 true))

(declare-fun e!703296 () Bool)

(assert (=> start!103564 e!703296))

(declare-fun b!1240778 () Bool)

(declare-fun tp_is_empty!31205 () Bool)

(declare-fun tp!92561 () Bool)

(assert (=> b!1240778 (= e!703296 (and tp_is_empty!31205 tp!92561))))

(declare-datatypes ((B!1806 0))(
  ( (B!1807 (val!15665 Int)) )
))
(declare-datatypes ((tuple2!20202 0))(
  ( (tuple2!20203 (_1!10112 (_ BitVec 64)) (_2!10112 B!1806)) )
))
(declare-datatypes ((List!27330 0))(
  ( (Nil!27327) (Cons!27326 (h!28535 tuple2!20202) (t!40793 List!27330)) )
))
(declare-fun l!644 () List!27330)

(assert (= (and start!103564 (is-Cons!27326 l!644)) b!1240778))

(push 1)

(assert (not b!1240778))

