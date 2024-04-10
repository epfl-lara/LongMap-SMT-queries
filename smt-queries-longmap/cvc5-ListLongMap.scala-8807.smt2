; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107066 () Bool)

(assert start!107066)

(declare-fun b_free!27571 () Bool)

(declare-fun b_next!27571 () Bool)

(assert (=> start!107066 (= b_free!27571 (not b_next!27571))))

(declare-fun tp!96939 () Bool)

(declare-fun b_and!45603 () Bool)

(assert (=> start!107066 (= tp!96939 b_and!45603)))

(declare-fun b!1269387 () Bool)

(declare-fun e!723496 () Bool)

(declare-fun e!723495 () Bool)

(declare-fun mapRes!50713 () Bool)

(assert (=> b!1269387 (= e!723496 (and e!723495 mapRes!50713))))

(declare-fun condMapEmpty!50713 () Bool)

(declare-datatypes ((V!48867 0))(
  ( (V!48868 (val!16452 Int)) )
))
(declare-datatypes ((ValueCell!15524 0))(
  ( (ValueCellFull!15524 (v!19089 V!48867)) (EmptyCell!15524) )
))
(declare-datatypes ((array!82774 0))(
  ( (array!82775 (arr!39924 (Array (_ BitVec 32) ValueCell!15524)) (size!40460 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82774)

(declare-fun mapDefault!50713 () ValueCell!15524)

