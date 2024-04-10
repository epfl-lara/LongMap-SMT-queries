; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74156 () Bool)

(assert start!74156)

(declare-fun mapIsEmpty!27395 () Bool)

(declare-fun mapRes!27395 () Bool)

(assert (=> mapIsEmpty!27395 mapRes!27395))

(declare-fun b!872341 () Bool)

(declare-fun e!485769 () Bool)

(declare-fun tp_is_empty!17195 () Bool)

(assert (=> b!872341 (= e!485769 tp_is_empty!17195)))

(declare-fun mapNonEmpty!27395 () Bool)

(declare-fun tp!52594 () Bool)

(assert (=> mapNonEmpty!27395 (= mapRes!27395 (and tp!52594 e!485769))))

(declare-datatypes ((V!27973 0))(
  ( (V!27974 (val!8645 Int)) )
))
(declare-datatypes ((ValueCell!8158 0))(
  ( (ValueCellFull!8158 (v!11070 V!27973)) (EmptyCell!8158) )
))
(declare-fun mapValue!27395 () ValueCell!8158)

(declare-fun mapKey!27395 () (_ BitVec 32))

(declare-fun mapRest!27395 () (Array (_ BitVec 32) ValueCell!8158))

(declare-datatypes ((array!50524 0))(
  ( (array!50525 (arr!24292 (Array (_ BitVec 32) ValueCell!8158)) (size!24732 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50524)

(assert (=> mapNonEmpty!27395 (= (arr!24292 _values!688) (store mapRest!27395 mapKey!27395 mapValue!27395))))

(declare-fun b!872342 () Bool)

(declare-fun res!592900 () Bool)

(declare-fun e!485768 () Bool)

(assert (=> b!872342 (=> (not res!592900) (not e!485768))))

(declare-datatypes ((array!50526 0))(
  ( (array!50527 (arr!24293 (Array (_ BitVec 32) (_ BitVec 64))) (size!24733 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50526)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50526 (_ BitVec 32)) Bool)

(assert (=> b!872342 (= res!592900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872344 () Bool)

(assert (=> b!872344 (= e!485768 false)))

(declare-fun lt!395608 () Bool)

(declare-datatypes ((List!17259 0))(
  ( (Nil!17256) (Cons!17255 (h!18386 (_ BitVec 64)) (t!24296 List!17259)) )
))
(declare-fun arrayNoDuplicates!0 (array!50526 (_ BitVec 32) List!17259) Bool)

(assert (=> b!872344 (= lt!395608 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17256))))

(declare-fun b!872345 () Bool)

(declare-fun e!485766 () Bool)

(declare-fun e!485767 () Bool)

(assert (=> b!872345 (= e!485766 (and e!485767 mapRes!27395))))

(declare-fun condMapEmpty!27395 () Bool)

(declare-fun mapDefault!27395 () ValueCell!8158)

