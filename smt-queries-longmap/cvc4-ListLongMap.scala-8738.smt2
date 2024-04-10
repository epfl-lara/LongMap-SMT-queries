; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105956 () Bool)

(assert start!105956)

(declare-fun b_free!27467 () Bool)

(declare-fun b_next!27467 () Bool)

(assert (=> start!105956 (= b_free!27467 (not b_next!27467))))

(declare-fun tp!95938 () Bool)

(declare-fun b_and!45393 () Bool)

(assert (=> start!105956 (= tp!95938 b_and!45393)))

(declare-fun mapNonEmpty!50362 () Bool)

(declare-fun mapRes!50362 () Bool)

(declare-fun tp!95939 () Bool)

(declare-fun e!718279 () Bool)

(assert (=> mapNonEmpty!50362 (= mapRes!50362 (and tp!95939 e!718279))))

(declare-datatypes ((V!48523 0))(
  ( (V!48524 (val!16247 Int)) )
))
(declare-datatypes ((ValueCell!15421 0))(
  ( (ValueCellFull!15421 (v!18952 V!48523)) (EmptyCell!15421) )
))
(declare-fun mapValue!50362 () ValueCell!15421)

(declare-fun mapKey!50362 () (_ BitVec 32))

(declare-fun mapRest!50362 () (Array (_ BitVec 32) ValueCell!15421))

(declare-datatypes ((array!82356 0))(
  ( (array!82357 (arr!39729 (Array (_ BitVec 32) ValueCell!15421)) (size!40265 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82356)

(assert (=> mapNonEmpty!50362 (= (arr!39729 _values!914) (store mapRest!50362 mapKey!50362 mapValue!50362))))

(declare-fun b!1261918 () Bool)

(declare-fun e!718280 () Bool)

(declare-fun e!718276 () Bool)

(assert (=> b!1261918 (= e!718280 (and e!718276 mapRes!50362))))

(declare-fun condMapEmpty!50362 () Bool)

(declare-fun mapDefault!50362 () ValueCell!15421)

