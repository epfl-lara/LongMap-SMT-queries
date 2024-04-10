; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40404 () Bool)

(assert start!40404)

(declare-fun mapNonEmpty!19311 () Bool)

(declare-fun mapRes!19311 () Bool)

(declare-fun tp!37293 () Bool)

(declare-fun e!261275 () Bool)

(assert (=> mapNonEmpty!19311 (= mapRes!19311 (and tp!37293 e!261275))))

(declare-datatypes ((V!16823 0))(
  ( (V!16824 (val!5939 Int)) )
))
(declare-datatypes ((ValueCell!5551 0))(
  ( (ValueCellFull!5551 (v!8190 V!16823)) (EmptyCell!5551) )
))
(declare-datatypes ((array!27387 0))(
  ( (array!27388 (arr!13141 (Array (_ BitVec 32) ValueCell!5551)) (size!13493 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27387)

(declare-fun mapValue!19311 () ValueCell!5551)

(declare-fun mapRest!19311 () (Array (_ BitVec 32) ValueCell!5551))

(declare-fun mapKey!19311 () (_ BitVec 32))

(assert (=> mapNonEmpty!19311 (= (arr!13141 _values!549) (store mapRest!19311 mapKey!19311 mapValue!19311))))

(declare-fun b!444224 () Bool)

(declare-fun res!263380 () Bool)

(declare-fun e!261274 () Bool)

(assert (=> b!444224 (=> (not res!263380) (not e!261274))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444224 (= res!263380 (validMask!0 mask!1025))))

(declare-fun b!444225 () Bool)

(declare-fun res!263377 () Bool)

(assert (=> b!444225 (=> (not res!263377) (not e!261274))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!27389 0))(
  ( (array!27390 (arr!13142 (Array (_ BitVec 32) (_ BitVec 64))) (size!13494 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27389)

(assert (=> b!444225 (= res!263377 (and (= (size!13493 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13494 _keys!709) (size!13493 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19311 () Bool)

(assert (=> mapIsEmpty!19311 mapRes!19311))

(declare-fun b!444226 () Bool)

(declare-fun e!261276 () Bool)

(declare-fun e!261273 () Bool)

(assert (=> b!444226 (= e!261276 (and e!261273 mapRes!19311))))

(declare-fun condMapEmpty!19311 () Bool)

(declare-fun mapDefault!19311 () ValueCell!5551)

