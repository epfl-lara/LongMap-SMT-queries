; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74066 () Bool)

(assert start!74066)

(declare-fun b_free!14981 () Bool)

(declare-fun b_next!14981 () Bool)

(assert (=> start!74066 (= b_free!14981 (not b_next!14981))))

(declare-fun tp!52446 () Bool)

(declare-fun b_and!24733 () Bool)

(assert (=> start!74066 (= tp!52446 b_and!24733)))

(declare-fun b!871311 () Bool)

(declare-fun res!592265 () Bool)

(declare-fun e!485130 () Bool)

(assert (=> b!871311 (=> (not res!592265) (not e!485130))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50374 0))(
  ( (array!50375 (arr!24218 (Array (_ BitVec 32) (_ BitVec 64))) (size!24658 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50374)

(assert (=> b!871311 (= res!592265 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24658 _keys!868))))))

(declare-fun b!871313 () Bool)

(declare-fun e!485127 () Bool)

(assert (=> b!871313 (= e!485127 (not true))))

(declare-datatypes ((V!27869 0))(
  ( (V!27870 (val!8606 Int)) )
))
(declare-fun v!557 () V!27869)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8119 0))(
  ( (ValueCellFull!8119 (v!11031 V!27869)) (EmptyCell!8119) )
))
(declare-datatypes ((array!50376 0))(
  ( (array!50377 (arr!24219 (Array (_ BitVec 32) ValueCell!8119)) (size!24659 (_ BitVec 32))) )
))
(declare-fun lt!395426 () array!50376)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun _values!688 () array!50376)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27869)

(declare-fun zeroValue!654 () V!27869)

(declare-datatypes ((tuple2!11438 0))(
  ( (tuple2!11439 (_1!5730 (_ BitVec 64)) (_2!5730 V!27869)) )
))
(declare-datatypes ((List!17224 0))(
  ( (Nil!17221) (Cons!17220 (h!18351 tuple2!11438) (t!24261 List!17224)) )
))
(declare-datatypes ((ListLongMap!10207 0))(
  ( (ListLongMap!10208 (toList!5119 List!17224)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3088 (array!50374 array!50376 (_ BitVec 32) (_ BitVec 32) V!27869 V!27869 (_ BitVec 32) Int) ListLongMap!10207)

(declare-fun +!2454 (ListLongMap!10207 tuple2!11438) ListLongMap!10207)

(assert (=> b!871313 (= (getCurrentListMapNoExtraKeys!3088 _keys!868 lt!395426 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2454 (getCurrentListMapNoExtraKeys!3088 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11439 k!854 v!557)))))

(declare-datatypes ((Unit!29906 0))(
  ( (Unit!29907) )
))
(declare-fun lt!395425 () Unit!29906)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!648 (array!50374 array!50376 (_ BitVec 32) (_ BitVec 32) V!27869 V!27869 (_ BitVec 32) (_ BitVec 64) V!27869 (_ BitVec 32) Int) Unit!29906)

(assert (=> b!871313 (= lt!395425 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!648 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!871314 () Bool)

(declare-fun res!592261 () Bool)

(assert (=> b!871314 (=> (not res!592261) (not e!485130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50374 (_ BitVec 32)) Bool)

(assert (=> b!871314 (= res!592261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871315 () Bool)

(declare-fun e!485128 () Bool)

(declare-fun tp_is_empty!17117 () Bool)

(assert (=> b!871315 (= e!485128 tp_is_empty!17117)))

(declare-fun mapIsEmpty!27275 () Bool)

(declare-fun mapRes!27275 () Bool)

(assert (=> mapIsEmpty!27275 mapRes!27275))

(declare-fun b!871316 () Bool)

(assert (=> b!871316 (= e!485130 e!485127)))

(declare-fun res!592264 () Bool)

(assert (=> b!871316 (=> (not res!592264) (not e!485127))))

(assert (=> b!871316 (= res!592264 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395427 () ListLongMap!10207)

(assert (=> b!871316 (= lt!395427 (getCurrentListMapNoExtraKeys!3088 _keys!868 lt!395426 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!871316 (= lt!395426 (array!50377 (store (arr!24219 _values!688) i!612 (ValueCellFull!8119 v!557)) (size!24659 _values!688)))))

(declare-fun lt!395428 () ListLongMap!10207)

(assert (=> b!871316 (= lt!395428 (getCurrentListMapNoExtraKeys!3088 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!871317 () Bool)

(declare-fun res!592263 () Bool)

(assert (=> b!871317 (=> (not res!592263) (not e!485130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871317 (= res!592263 (validMask!0 mask!1196))))

(declare-fun b!871318 () Bool)

(declare-fun res!592262 () Bool)

(assert (=> b!871318 (=> (not res!592262) (not e!485130))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871318 (= res!592262 (validKeyInArray!0 k!854))))

(declare-fun b!871319 () Bool)

(declare-fun e!485126 () Bool)

(assert (=> b!871319 (= e!485126 tp_is_empty!17117)))

(declare-fun mapNonEmpty!27275 () Bool)

(declare-fun tp!52447 () Bool)

(assert (=> mapNonEmpty!27275 (= mapRes!27275 (and tp!52447 e!485126))))

(declare-fun mapRest!27275 () (Array (_ BitVec 32) ValueCell!8119))

(declare-fun mapValue!27275 () ValueCell!8119)

(declare-fun mapKey!27275 () (_ BitVec 32))

(assert (=> mapNonEmpty!27275 (= (arr!24219 _values!688) (store mapRest!27275 mapKey!27275 mapValue!27275))))

(declare-fun b!871320 () Bool)

(declare-fun res!592257 () Bool)

(assert (=> b!871320 (=> (not res!592257) (not e!485130))))

(assert (=> b!871320 (= res!592257 (and (= (size!24659 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24658 _keys!868) (size!24659 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!592259 () Bool)

(assert (=> start!74066 (=> (not res!592259) (not e!485130))))

(assert (=> start!74066 (= res!592259 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24658 _keys!868))))))

(assert (=> start!74066 e!485130))

(assert (=> start!74066 tp_is_empty!17117))

(assert (=> start!74066 true))

(assert (=> start!74066 tp!52446))

(declare-fun array_inv!19122 (array!50374) Bool)

(assert (=> start!74066 (array_inv!19122 _keys!868)))

(declare-fun e!485131 () Bool)

(declare-fun array_inv!19123 (array!50376) Bool)

(assert (=> start!74066 (and (array_inv!19123 _values!688) e!485131)))

(declare-fun b!871312 () Bool)

(declare-fun res!592260 () Bool)

(assert (=> b!871312 (=> (not res!592260) (not e!485130))))

(declare-datatypes ((List!17225 0))(
  ( (Nil!17222) (Cons!17221 (h!18352 (_ BitVec 64)) (t!24262 List!17225)) )
))
(declare-fun arrayNoDuplicates!0 (array!50374 (_ BitVec 32) List!17225) Bool)

(assert (=> b!871312 (= res!592260 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17222))))

(declare-fun b!871321 () Bool)

(declare-fun res!592258 () Bool)

(assert (=> b!871321 (=> (not res!592258) (not e!485130))))

(assert (=> b!871321 (= res!592258 (and (= (select (arr!24218 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!871322 () Bool)

(assert (=> b!871322 (= e!485131 (and e!485128 mapRes!27275))))

(declare-fun condMapEmpty!27275 () Bool)

(declare-fun mapDefault!27275 () ValueCell!8119)

