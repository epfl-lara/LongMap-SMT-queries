; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74162 () Bool)

(assert start!74162)

(declare-fun b!872404 () Bool)

(declare-fun e!485811 () Bool)

(assert (=> b!872404 (= e!485811 false)))

(declare-fun lt!395617 () Bool)

(declare-datatypes ((array!50536 0))(
  ( (array!50537 (arr!24298 (Array (_ BitVec 32) (_ BitVec 64))) (size!24738 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50536)

(declare-datatypes ((List!17261 0))(
  ( (Nil!17258) (Cons!17257 (h!18388 (_ BitVec 64)) (t!24298 List!17261)) )
))
(declare-fun arrayNoDuplicates!0 (array!50536 (_ BitVec 32) List!17261) Bool)

(assert (=> b!872404 (= lt!395617 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17258))))

(declare-fun b!872405 () Bool)

(declare-fun e!485815 () Bool)

(declare-fun tp_is_empty!17201 () Bool)

(assert (=> b!872405 (= e!485815 tp_is_empty!17201)))

(declare-fun mapNonEmpty!27404 () Bool)

(declare-fun mapRes!27404 () Bool)

(declare-fun tp!52603 () Bool)

(assert (=> mapNonEmpty!27404 (= mapRes!27404 (and tp!52603 e!485815))))

(declare-datatypes ((V!27981 0))(
  ( (V!27982 (val!8648 Int)) )
))
(declare-datatypes ((ValueCell!8161 0))(
  ( (ValueCellFull!8161 (v!11073 V!27981)) (EmptyCell!8161) )
))
(declare-fun mapValue!27404 () ValueCell!8161)

(declare-fun mapRest!27404 () (Array (_ BitVec 32) ValueCell!8161))

(declare-fun mapKey!27404 () (_ BitVec 32))

(declare-datatypes ((array!50538 0))(
  ( (array!50539 (arr!24299 (Array (_ BitVec 32) ValueCell!8161)) (size!24739 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50538)

(assert (=> mapNonEmpty!27404 (= (arr!24299 _values!688) (store mapRest!27404 mapKey!27404 mapValue!27404))))

(declare-fun b!872406 () Bool)

(declare-fun res!592936 () Bool)

(assert (=> b!872406 (=> (not res!592936) (not e!485811))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!872406 (= res!592936 (and (= (size!24739 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24738 _keys!868) (size!24739 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27404 () Bool)

(assert (=> mapIsEmpty!27404 mapRes!27404))

(declare-fun b!872407 () Bool)

(declare-fun e!485812 () Bool)

(declare-fun e!485813 () Bool)

(assert (=> b!872407 (= e!485812 (and e!485813 mapRes!27404))))

(declare-fun condMapEmpty!27404 () Bool)

(declare-fun mapDefault!27404 () ValueCell!8161)

