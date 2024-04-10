; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74322 () Bool)

(assert start!74322)

(declare-fun b_free!15085 () Bool)

(declare-fun b_next!15085 () Bool)

(assert (=> start!74322 (= b_free!15085 (not b_next!15085))))

(declare-fun tp!52929 () Bool)

(declare-fun b_and!24861 () Bool)

(assert (=> start!74322 (= tp!52929 b_and!24861)))

(declare-fun b!874577 () Bool)

(declare-fun res!594351 () Bool)

(declare-fun e!486931 () Bool)

(assert (=> b!874577 (=> (not res!594351) (not e!486931))))

(declare-datatypes ((array!50786 0))(
  ( (array!50787 (arr!24421 (Array (_ BitVec 32) (_ BitVec 64))) (size!24861 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50786)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50786 (_ BitVec 32)) Bool)

(assert (=> b!874577 (= res!594351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27602 () Bool)

(declare-fun mapRes!27602 () Bool)

(assert (=> mapIsEmpty!27602 mapRes!27602))

(declare-fun b!874578 () Bool)

(declare-fun res!594349 () Bool)

(assert (=> b!874578 (=> (not res!594349) (not e!486931))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!28153 0))(
  ( (V!28154 (val!8712 Int)) )
))
(declare-datatypes ((ValueCell!8225 0))(
  ( (ValueCellFull!8225 (v!11141 V!28153)) (EmptyCell!8225) )
))
(declare-datatypes ((array!50788 0))(
  ( (array!50789 (arr!24422 (Array (_ BitVec 32) ValueCell!8225)) (size!24862 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50788)

(assert (=> b!874578 (= res!594349 (and (= (size!24862 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24861 _keys!868) (size!24862 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874579 () Bool)

(declare-fun res!594348 () Bool)

(assert (=> b!874579 (=> (not res!594348) (not e!486931))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874579 (= res!594348 (validKeyInArray!0 k!854))))

(declare-fun b!874580 () Bool)

(declare-fun res!594352 () Bool)

(assert (=> b!874580 (=> (not res!594352) (not e!486931))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!874580 (= res!594352 (and (= (select (arr!24421 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!874581 () Bool)

(declare-fun e!486935 () Bool)

(declare-fun tp_is_empty!17329 () Bool)

(assert (=> b!874581 (= e!486935 tp_is_empty!17329)))

(declare-fun b!874582 () Bool)

(declare-fun res!594347 () Bool)

(assert (=> b!874582 (=> (not res!594347) (not e!486931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874582 (= res!594347 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27602 () Bool)

(declare-fun tp!52930 () Bool)

(assert (=> mapNonEmpty!27602 (= mapRes!27602 (and tp!52930 e!486935))))

(declare-fun mapKey!27602 () (_ BitVec 32))

(declare-fun mapValue!27602 () ValueCell!8225)

(declare-fun mapRest!27602 () (Array (_ BitVec 32) ValueCell!8225))

(assert (=> mapNonEmpty!27602 (= (arr!24422 _values!688) (store mapRest!27602 mapKey!27602 mapValue!27602))))

(declare-fun b!874583 () Bool)

(declare-fun res!594354 () Bool)

(assert (=> b!874583 (=> (not res!594354) (not e!486931))))

(declare-datatypes ((List!17334 0))(
  ( (Nil!17331) (Cons!17330 (h!18461 (_ BitVec 64)) (t!24375 List!17334)) )
))
(declare-fun arrayNoDuplicates!0 (array!50786 (_ BitVec 32) List!17334) Bool)

(assert (=> b!874583 (= res!594354 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17331))))

(declare-fun b!874584 () Bool)

(declare-fun res!594353 () Bool)

(assert (=> b!874584 (=> (not res!594353) (not e!486931))))

(assert (=> b!874584 (= res!594353 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24861 _keys!868))))))

(declare-fun b!874585 () Bool)

(assert (=> b!874585 (= e!486931 false)))

(declare-datatypes ((tuple2!11512 0))(
  ( (tuple2!11513 (_1!5767 (_ BitVec 64)) (_2!5767 V!28153)) )
))
(declare-datatypes ((List!17335 0))(
  ( (Nil!17332) (Cons!17331 (h!18462 tuple2!11512) (t!24376 List!17335)) )
))
(declare-datatypes ((ListLongMap!10281 0))(
  ( (ListLongMap!10282 (toList!5156 List!17335)) )
))
(declare-fun lt!395969 () ListLongMap!10281)

(declare-fun v!557 () V!28153)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28153)

(declare-fun zeroValue!654 () V!28153)

(declare-fun getCurrentListMapNoExtraKeys!3123 (array!50786 array!50788 (_ BitVec 32) (_ BitVec 32) V!28153 V!28153 (_ BitVec 32) Int) ListLongMap!10281)

(assert (=> b!874585 (= lt!395969 (getCurrentListMapNoExtraKeys!3123 _keys!868 (array!50789 (store (arr!24422 _values!688) i!612 (ValueCellFull!8225 v!557)) (size!24862 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395968 () ListLongMap!10281)

(assert (=> b!874585 (= lt!395968 (getCurrentListMapNoExtraKeys!3123 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!594350 () Bool)

(assert (=> start!74322 (=> (not res!594350) (not e!486931))))

(assert (=> start!74322 (= res!594350 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24861 _keys!868))))))

(assert (=> start!74322 e!486931))

(assert (=> start!74322 tp_is_empty!17329))

(assert (=> start!74322 true))

(assert (=> start!74322 tp!52929))

(declare-fun array_inv!19258 (array!50786) Bool)

(assert (=> start!74322 (array_inv!19258 _keys!868)))

(declare-fun e!486932 () Bool)

(declare-fun array_inv!19259 (array!50788) Bool)

(assert (=> start!74322 (and (array_inv!19259 _values!688) e!486932)))

(declare-fun b!874586 () Bool)

(declare-fun e!486934 () Bool)

(assert (=> b!874586 (= e!486932 (and e!486934 mapRes!27602))))

(declare-fun condMapEmpty!27602 () Bool)

(declare-fun mapDefault!27602 () ValueCell!8225)

