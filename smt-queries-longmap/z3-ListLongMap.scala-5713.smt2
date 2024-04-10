; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74064 () Bool)

(assert start!74064)

(declare-fun b_free!14979 () Bool)

(declare-fun b_next!14979 () Bool)

(assert (=> start!74064 (= b_free!14979 (not b_next!14979))))

(declare-fun tp!52440 () Bool)

(declare-fun b_and!24731 () Bool)

(assert (=> start!74064 (= tp!52440 b_and!24731)))

(declare-fun b!871275 () Bool)

(declare-fun res!592233 () Bool)

(declare-fun e!485108 () Bool)

(assert (=> b!871275 (=> (not res!592233) (not e!485108))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50370 0))(
  ( (array!50371 (arr!24216 (Array (_ BitVec 32) (_ BitVec 64))) (size!24656 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50370)

(assert (=> b!871275 (= res!592233 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24656 _keys!868))))))

(declare-fun res!592234 () Bool)

(assert (=> start!74064 (=> (not res!592234) (not e!485108))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74064 (= res!592234 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24656 _keys!868))))))

(assert (=> start!74064 e!485108))

(declare-fun tp_is_empty!17115 () Bool)

(assert (=> start!74064 tp_is_empty!17115))

(assert (=> start!74064 true))

(assert (=> start!74064 tp!52440))

(declare-fun array_inv!19120 (array!50370) Bool)

(assert (=> start!74064 (array_inv!19120 _keys!868)))

(declare-datatypes ((V!27867 0))(
  ( (V!27868 (val!8605 Int)) )
))
(declare-datatypes ((ValueCell!8118 0))(
  ( (ValueCellFull!8118 (v!11030 V!27867)) (EmptyCell!8118) )
))
(declare-datatypes ((array!50372 0))(
  ( (array!50373 (arr!24217 (Array (_ BitVec 32) ValueCell!8118)) (size!24657 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50372)

(declare-fun e!485112 () Bool)

(declare-fun array_inv!19121 (array!50372) Bool)

(assert (=> start!74064 (and (array_inv!19121 _values!688) e!485112)))

(declare-fun b!871276 () Bool)

(declare-fun e!485109 () Bool)

(declare-fun mapRes!27272 () Bool)

(assert (=> b!871276 (= e!485112 (and e!485109 mapRes!27272))))

(declare-fun condMapEmpty!27272 () Bool)

(declare-fun mapDefault!27272 () ValueCell!8118)

(assert (=> b!871276 (= condMapEmpty!27272 (= (arr!24217 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8118)) mapDefault!27272)))))

(declare-fun b!871277 () Bool)

(declare-fun res!592231 () Bool)

(assert (=> b!871277 (=> (not res!592231) (not e!485108))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871277 (= res!592231 (validMask!0 mask!1196))))

(declare-fun b!871278 () Bool)

(declare-fun res!592237 () Bool)

(assert (=> b!871278 (=> (not res!592237) (not e!485108))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871278 (= res!592237 (validKeyInArray!0 k0!854))))

(declare-fun b!871279 () Bool)

(assert (=> b!871279 (= e!485109 tp_is_empty!17115)))

(declare-fun b!871280 () Bool)

(declare-fun e!485113 () Bool)

(assert (=> b!871280 (= e!485113 (not true))))

(declare-fun v!557 () V!27867)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27867)

(declare-fun zeroValue!654 () V!27867)

(declare-fun lt!395415 () array!50372)

(declare-datatypes ((tuple2!11436 0))(
  ( (tuple2!11437 (_1!5729 (_ BitVec 64)) (_2!5729 V!27867)) )
))
(declare-datatypes ((List!17222 0))(
  ( (Nil!17219) (Cons!17218 (h!18349 tuple2!11436) (t!24259 List!17222)) )
))
(declare-datatypes ((ListLongMap!10205 0))(
  ( (ListLongMap!10206 (toList!5118 List!17222)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3087 (array!50370 array!50372 (_ BitVec 32) (_ BitVec 32) V!27867 V!27867 (_ BitVec 32) Int) ListLongMap!10205)

(declare-fun +!2453 (ListLongMap!10205 tuple2!11436) ListLongMap!10205)

(assert (=> b!871280 (= (getCurrentListMapNoExtraKeys!3087 _keys!868 lt!395415 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2453 (getCurrentListMapNoExtraKeys!3087 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11437 k0!854 v!557)))))

(declare-datatypes ((Unit!29904 0))(
  ( (Unit!29905) )
))
(declare-fun lt!395413 () Unit!29904)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!647 (array!50370 array!50372 (_ BitVec 32) (_ BitVec 32) V!27867 V!27867 (_ BitVec 32) (_ BitVec 64) V!27867 (_ BitVec 32) Int) Unit!29904)

(assert (=> b!871280 (= lt!395413 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!647 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!871281 () Bool)

(declare-fun res!592236 () Bool)

(assert (=> b!871281 (=> (not res!592236) (not e!485108))))

(assert (=> b!871281 (= res!592236 (and (= (select (arr!24216 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!871282 () Bool)

(assert (=> b!871282 (= e!485108 e!485113)))

(declare-fun res!592238 () Bool)

(assert (=> b!871282 (=> (not res!592238) (not e!485113))))

(assert (=> b!871282 (= res!592238 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395416 () ListLongMap!10205)

(assert (=> b!871282 (= lt!395416 (getCurrentListMapNoExtraKeys!3087 _keys!868 lt!395415 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!871282 (= lt!395415 (array!50373 (store (arr!24217 _values!688) i!612 (ValueCellFull!8118 v!557)) (size!24657 _values!688)))))

(declare-fun lt!395414 () ListLongMap!10205)

(assert (=> b!871282 (= lt!395414 (getCurrentListMapNoExtraKeys!3087 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!871283 () Bool)

(declare-fun e!485110 () Bool)

(assert (=> b!871283 (= e!485110 tp_is_empty!17115)))

(declare-fun mapNonEmpty!27272 () Bool)

(declare-fun tp!52441 () Bool)

(assert (=> mapNonEmpty!27272 (= mapRes!27272 (and tp!52441 e!485110))))

(declare-fun mapKey!27272 () (_ BitVec 32))

(declare-fun mapRest!27272 () (Array (_ BitVec 32) ValueCell!8118))

(declare-fun mapValue!27272 () ValueCell!8118)

(assert (=> mapNonEmpty!27272 (= (arr!24217 _values!688) (store mapRest!27272 mapKey!27272 mapValue!27272))))

(declare-fun b!871284 () Bool)

(declare-fun res!592235 () Bool)

(assert (=> b!871284 (=> (not res!592235) (not e!485108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50370 (_ BitVec 32)) Bool)

(assert (=> b!871284 (= res!592235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27272 () Bool)

(assert (=> mapIsEmpty!27272 mapRes!27272))

(declare-fun b!871285 () Bool)

(declare-fun res!592232 () Bool)

(assert (=> b!871285 (=> (not res!592232) (not e!485108))))

(assert (=> b!871285 (= res!592232 (and (= (size!24657 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24656 _keys!868) (size!24657 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871286 () Bool)

(declare-fun res!592230 () Bool)

(assert (=> b!871286 (=> (not res!592230) (not e!485108))))

(declare-datatypes ((List!17223 0))(
  ( (Nil!17220) (Cons!17219 (h!18350 (_ BitVec 64)) (t!24260 List!17223)) )
))
(declare-fun arrayNoDuplicates!0 (array!50370 (_ BitVec 32) List!17223) Bool)

(assert (=> b!871286 (= res!592230 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17220))))

(assert (= (and start!74064 res!592234) b!871277))

(assert (= (and b!871277 res!592231) b!871285))

(assert (= (and b!871285 res!592232) b!871284))

(assert (= (and b!871284 res!592235) b!871286))

(assert (= (and b!871286 res!592230) b!871275))

(assert (= (and b!871275 res!592233) b!871278))

(assert (= (and b!871278 res!592237) b!871281))

(assert (= (and b!871281 res!592236) b!871282))

(assert (= (and b!871282 res!592238) b!871280))

(assert (= (and b!871276 condMapEmpty!27272) mapIsEmpty!27272))

(assert (= (and b!871276 (not condMapEmpty!27272)) mapNonEmpty!27272))

(get-info :version)

(assert (= (and mapNonEmpty!27272 ((_ is ValueCellFull!8118) mapValue!27272)) b!871283))

(assert (= (and b!871276 ((_ is ValueCellFull!8118) mapDefault!27272)) b!871279))

(assert (= start!74064 b!871276))

(declare-fun m!812507 () Bool)

(assert (=> b!871282 m!812507))

(declare-fun m!812509 () Bool)

(assert (=> b!871282 m!812509))

(declare-fun m!812511 () Bool)

(assert (=> b!871282 m!812511))

(declare-fun m!812513 () Bool)

(assert (=> mapNonEmpty!27272 m!812513))

(declare-fun m!812515 () Bool)

(assert (=> b!871281 m!812515))

(declare-fun m!812517 () Bool)

(assert (=> start!74064 m!812517))

(declare-fun m!812519 () Bool)

(assert (=> start!74064 m!812519))

(declare-fun m!812521 () Bool)

(assert (=> b!871277 m!812521))

(declare-fun m!812523 () Bool)

(assert (=> b!871284 m!812523))

(declare-fun m!812525 () Bool)

(assert (=> b!871280 m!812525))

(declare-fun m!812527 () Bool)

(assert (=> b!871280 m!812527))

(assert (=> b!871280 m!812527))

(declare-fun m!812529 () Bool)

(assert (=> b!871280 m!812529))

(declare-fun m!812531 () Bool)

(assert (=> b!871280 m!812531))

(declare-fun m!812533 () Bool)

(assert (=> b!871286 m!812533))

(declare-fun m!812535 () Bool)

(assert (=> b!871278 m!812535))

(check-sat (not b_next!14979) (not b!871286) (not b!871278) tp_is_empty!17115 (not start!74064) (not b!871284) (not b!871277) (not b!871282) (not b!871280) b_and!24731 (not mapNonEmpty!27272))
(check-sat b_and!24731 (not b_next!14979))
