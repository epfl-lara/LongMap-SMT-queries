; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74092 () Bool)

(assert start!74092)

(declare-fun mapNonEmpty!27314 () Bool)

(declare-fun mapRes!27314 () Bool)

(declare-fun tp!52513 () Bool)

(declare-fun e!485352 () Bool)

(assert (=> mapNonEmpty!27314 (= mapRes!27314 (and tp!52513 e!485352))))

(declare-datatypes ((V!27905 0))(
  ( (V!27906 (val!8619 Int)) )
))
(declare-datatypes ((ValueCell!8132 0))(
  ( (ValueCellFull!8132 (v!11044 V!27905)) (EmptyCell!8132) )
))
(declare-fun mapValue!27314 () ValueCell!8132)

(declare-fun mapRest!27314 () (Array (_ BitVec 32) ValueCell!8132))

(declare-fun mapKey!27314 () (_ BitVec 32))

(declare-datatypes ((array!50424 0))(
  ( (array!50425 (arr!24243 (Array (_ BitVec 32) ValueCell!8132)) (size!24683 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50424)

(assert (=> mapNonEmpty!27314 (= (arr!24243 _values!688) (store mapRest!27314 mapKey!27314 mapValue!27314))))

(declare-fun b!871733 () Bool)

(declare-fun tp_is_empty!17143 () Bool)

(assert (=> b!871733 (= e!485352 tp_is_empty!17143)))

(declare-fun b!871734 () Bool)

(declare-fun res!592546 () Bool)

(declare-fun e!485349 () Bool)

(assert (=> b!871734 (=> (not res!592546) (not e!485349))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871734 (= res!592546 (validMask!0 mask!1196))))

(declare-fun b!871735 () Bool)

(assert (=> b!871735 (= e!485349 false)))

(declare-fun lt!395530 () Bool)

(declare-datatypes ((array!50426 0))(
  ( (array!50427 (arr!24244 (Array (_ BitVec 32) (_ BitVec 64))) (size!24684 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50426)

(declare-datatypes ((List!17242 0))(
  ( (Nil!17239) (Cons!17238 (h!18369 (_ BitVec 64)) (t!24279 List!17242)) )
))
(declare-fun arrayNoDuplicates!0 (array!50426 (_ BitVec 32) List!17242) Bool)

(assert (=> b!871735 (= lt!395530 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17239))))

(declare-fun b!871736 () Bool)

(declare-fun e!485351 () Bool)

(assert (=> b!871736 (= e!485351 tp_is_empty!17143)))

(declare-fun mapIsEmpty!27314 () Bool)

(assert (=> mapIsEmpty!27314 mapRes!27314))

(declare-fun b!871738 () Bool)

(declare-fun res!592545 () Bool)

(assert (=> b!871738 (=> (not res!592545) (not e!485349))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!871738 (= res!592545 (and (= (size!24683 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24684 _keys!868) (size!24683 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871739 () Bool)

(declare-fun res!592547 () Bool)

(assert (=> b!871739 (=> (not res!592547) (not e!485349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50426 (_ BitVec 32)) Bool)

(assert (=> b!871739 (= res!592547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871737 () Bool)

(declare-fun e!485353 () Bool)

(assert (=> b!871737 (= e!485353 (and e!485351 mapRes!27314))))

(declare-fun condMapEmpty!27314 () Bool)

(declare-fun mapDefault!27314 () ValueCell!8132)

