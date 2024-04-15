; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74352 () Bool)

(assert start!74352)

(declare-fun b_free!15133 () Bool)

(declare-fun b_next!15133 () Bool)

(assert (=> start!74352 (= b_free!15133 (not b_next!15133))))

(declare-fun tp!53074 () Bool)

(declare-fun b_and!24883 () Bool)

(assert (=> start!74352 (= tp!53074 b_and!24883)))

(declare-datatypes ((V!28217 0))(
  ( (V!28218 (val!8736 Int)) )
))
(declare-fun v!557 () V!28217)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun b!875273 () Bool)

(declare-datatypes ((tuple2!11550 0))(
  ( (tuple2!11551 (_1!5786 (_ BitVec 64)) (_2!5786 V!28217)) )
))
(declare-datatypes ((List!17360 0))(
  ( (Nil!17357) (Cons!17356 (h!18487 tuple2!11550) (t!24392 List!17360)) )
))
(declare-datatypes ((ListLongMap!10309 0))(
  ( (ListLongMap!10310 (toList!5170 List!17360)) )
))
(declare-fun call!38599 () ListLongMap!10309)

(declare-fun e!487251 () Bool)

(declare-fun call!38598 () ListLongMap!10309)

(declare-fun +!2498 (ListLongMap!10309 tuple2!11550) ListLongMap!10309)

(assert (=> b!875273 (= e!487251 (= call!38598 (+!2498 call!38599 (tuple2!11551 k0!854 v!557))))))

(declare-fun b!875274 () Bool)

(declare-fun res!594883 () Bool)

(declare-fun e!487254 () Bool)

(assert (=> b!875274 (=> (not res!594883) (not e!487254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875274 (= res!594883 (validKeyInArray!0 k0!854))))

(declare-fun b!875275 () Bool)

(declare-fun res!594884 () Bool)

(assert (=> b!875275 (=> (not res!594884) (not e!487254))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50857 0))(
  ( (array!50858 (arr!24457 (Array (_ BitVec 32) (_ BitVec 64))) (size!24899 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50857)

(assert (=> b!875275 (= res!594884 (and (= (select (arr!24457 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!875276 () Bool)

(declare-fun e!487249 () Bool)

(declare-fun tp_is_empty!17377 () Bool)

(assert (=> b!875276 (= e!487249 tp_is_empty!17377)))

(declare-fun b!875277 () Bool)

(declare-fun res!594886 () Bool)

(assert (=> b!875277 (=> (not res!594886) (not e!487254))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50857 (_ BitVec 32)) Bool)

(assert (=> b!875277 (= res!594886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!875278 () Bool)

(declare-fun res!594881 () Bool)

(assert (=> b!875278 (=> (not res!594881) (not e!487254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875278 (= res!594881 (validMask!0 mask!1196))))

(declare-fun b!875279 () Bool)

(assert (=> b!875279 (= e!487251 (= call!38598 call!38599))))

(declare-fun b!875280 () Bool)

(declare-fun res!594880 () Bool)

(assert (=> b!875280 (=> (not res!594880) (not e!487254))))

(assert (=> b!875280 (= res!594880 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24899 _keys!868))))))

(declare-fun b!875281 () Bool)

(declare-fun e!487250 () Bool)

(assert (=> b!875281 (= e!487250 tp_is_empty!17377)))

(declare-fun mapNonEmpty!27674 () Bool)

(declare-fun mapRes!27674 () Bool)

(declare-fun tp!53075 () Bool)

(assert (=> mapNonEmpty!27674 (= mapRes!27674 (and tp!53075 e!487250))))

(declare-datatypes ((ValueCell!8249 0))(
  ( (ValueCellFull!8249 (v!11159 V!28217)) (EmptyCell!8249) )
))
(declare-fun mapValue!27674 () ValueCell!8249)

(declare-fun mapRest!27674 () (Array (_ BitVec 32) ValueCell!8249))

(declare-fun mapKey!27674 () (_ BitVec 32))

(declare-datatypes ((array!50859 0))(
  ( (array!50860 (arr!24458 (Array (_ BitVec 32) ValueCell!8249)) (size!24900 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50859)

(assert (=> mapNonEmpty!27674 (= (arr!24458 _values!688) (store mapRest!27674 mapKey!27674 mapValue!27674))))

(declare-fun b!875282 () Bool)

(declare-fun res!594885 () Bool)

(assert (=> b!875282 (=> (not res!594885) (not e!487254))))

(declare-datatypes ((List!17361 0))(
  ( (Nil!17358) (Cons!17357 (h!18488 (_ BitVec 64)) (t!24393 List!17361)) )
))
(declare-fun arrayNoDuplicates!0 (array!50857 (_ BitVec 32) List!17361) Bool)

(assert (=> b!875282 (= res!594885 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17358))))

(declare-fun bm!38595 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28217)

(declare-fun zeroValue!654 () V!28217)

(declare-fun lt!395964 () array!50859)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3163 (array!50857 array!50859 (_ BitVec 32) (_ BitVec 32) V!28217 V!28217 (_ BitVec 32) Int) ListLongMap!10309)

(assert (=> bm!38595 (= call!38598 (getCurrentListMapNoExtraKeys!3163 _keys!868 lt!395964 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875283 () Bool)

(declare-fun e!487253 () Bool)

(assert (=> b!875283 (= e!487253 (bvslt from!1053 (size!24900 _values!688)))))

(declare-fun lt!395966 () ListLongMap!10309)

(assert (=> b!875283 (= lt!395966 (getCurrentListMapNoExtraKeys!3163 _keys!868 lt!395964 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875284 () Bool)

(declare-fun e!487248 () Bool)

(assert (=> b!875284 (= e!487248 (and e!487249 mapRes!27674))))

(declare-fun condMapEmpty!27674 () Bool)

(declare-fun mapDefault!27674 () ValueCell!8249)

(assert (=> b!875284 (= condMapEmpty!27674 (= (arr!24458 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8249)) mapDefault!27674)))))

(declare-fun res!594889 () Bool)

(assert (=> start!74352 (=> (not res!594889) (not e!487254))))

(assert (=> start!74352 (= res!594889 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24899 _keys!868))))))

(assert (=> start!74352 e!487254))

(assert (=> start!74352 tp_is_empty!17377))

(assert (=> start!74352 true))

(assert (=> start!74352 tp!53074))

(declare-fun array_inv!19330 (array!50857) Bool)

(assert (=> start!74352 (array_inv!19330 _keys!868)))

(declare-fun array_inv!19331 (array!50859) Bool)

(assert (=> start!74352 (and (array_inv!19331 _values!688) e!487248)))

(declare-fun bm!38596 () Bool)

(assert (=> bm!38596 (= call!38599 (getCurrentListMapNoExtraKeys!3163 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875285 () Bool)

(declare-fun e!487255 () Bool)

(assert (=> b!875285 (= e!487255 (not e!487253))))

(declare-fun res!594882 () Bool)

(assert (=> b!875285 (=> res!594882 e!487253)))

(assert (=> b!875285 (= res!594882 (not (validKeyInArray!0 (select (arr!24457 _keys!868) from!1053))))))

(assert (=> b!875285 e!487251))

(declare-fun c!92448 () Bool)

(assert (=> b!875285 (= c!92448 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29891 0))(
  ( (Unit!29892) )
))
(declare-fun lt!395963 () Unit!29891)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!668 (array!50857 array!50859 (_ BitVec 32) (_ BitVec 32) V!28217 V!28217 (_ BitVec 32) (_ BitVec 64) V!28217 (_ BitVec 32) Int) Unit!29891)

(assert (=> b!875285 (= lt!395963 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!668 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!27674 () Bool)

(assert (=> mapIsEmpty!27674 mapRes!27674))

(declare-fun b!875286 () Bool)

(declare-fun res!594888 () Bool)

(assert (=> b!875286 (=> (not res!594888) (not e!487254))))

(assert (=> b!875286 (= res!594888 (and (= (size!24900 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24899 _keys!868) (size!24900 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!875287 () Bool)

(assert (=> b!875287 (= e!487254 e!487255)))

(declare-fun res!594887 () Bool)

(assert (=> b!875287 (=> (not res!594887) (not e!487255))))

(assert (=> b!875287 (= res!594887 (= from!1053 i!612))))

(declare-fun lt!395967 () ListLongMap!10309)

(assert (=> b!875287 (= lt!395967 (getCurrentListMapNoExtraKeys!3163 _keys!868 lt!395964 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!875287 (= lt!395964 (array!50860 (store (arr!24458 _values!688) i!612 (ValueCellFull!8249 v!557)) (size!24900 _values!688)))))

(declare-fun lt!395965 () ListLongMap!10309)

(assert (=> b!875287 (= lt!395965 (getCurrentListMapNoExtraKeys!3163 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!74352 res!594889) b!875278))

(assert (= (and b!875278 res!594881) b!875286))

(assert (= (and b!875286 res!594888) b!875277))

(assert (= (and b!875277 res!594886) b!875282))

(assert (= (and b!875282 res!594885) b!875280))

(assert (= (and b!875280 res!594880) b!875274))

(assert (= (and b!875274 res!594883) b!875275))

(assert (= (and b!875275 res!594884) b!875287))

(assert (= (and b!875287 res!594887) b!875285))

(assert (= (and b!875285 c!92448) b!875273))

(assert (= (and b!875285 (not c!92448)) b!875279))

(assert (= (or b!875273 b!875279) bm!38596))

(assert (= (or b!875273 b!875279) bm!38595))

(assert (= (and b!875285 (not res!594882)) b!875283))

(assert (= (and b!875284 condMapEmpty!27674) mapIsEmpty!27674))

(assert (= (and b!875284 (not condMapEmpty!27674)) mapNonEmpty!27674))

(get-info :version)

(assert (= (and mapNonEmpty!27674 ((_ is ValueCellFull!8249) mapValue!27674)) b!875281))

(assert (= (and b!875284 ((_ is ValueCellFull!8249) mapDefault!27674)) b!875276))

(assert (= start!74352 b!875284))

(declare-fun m!814601 () Bool)

(assert (=> b!875283 m!814601))

(declare-fun m!814603 () Bool)

(assert (=> b!875273 m!814603))

(declare-fun m!814605 () Bool)

(assert (=> b!875282 m!814605))

(declare-fun m!814607 () Bool)

(assert (=> b!875277 m!814607))

(declare-fun m!814609 () Bool)

(assert (=> start!74352 m!814609))

(declare-fun m!814611 () Bool)

(assert (=> start!74352 m!814611))

(declare-fun m!814613 () Bool)

(assert (=> b!875278 m!814613))

(declare-fun m!814615 () Bool)

(assert (=> b!875275 m!814615))

(assert (=> bm!38595 m!814601))

(declare-fun m!814617 () Bool)

(assert (=> mapNonEmpty!27674 m!814617))

(declare-fun m!814619 () Bool)

(assert (=> b!875274 m!814619))

(declare-fun m!814621 () Bool)

(assert (=> b!875285 m!814621))

(assert (=> b!875285 m!814621))

(declare-fun m!814623 () Bool)

(assert (=> b!875285 m!814623))

(declare-fun m!814625 () Bool)

(assert (=> b!875285 m!814625))

(declare-fun m!814627 () Bool)

(assert (=> bm!38596 m!814627))

(declare-fun m!814629 () Bool)

(assert (=> b!875287 m!814629))

(declare-fun m!814631 () Bool)

(assert (=> b!875287 m!814631))

(declare-fun m!814633 () Bool)

(assert (=> b!875287 m!814633))

(check-sat (not b!875287) (not b!875278) (not b!875273) (not mapNonEmpty!27674) b_and!24883 (not b_next!15133) (not bm!38596) (not bm!38595) (not start!74352) tp_is_empty!17377 (not b!875285) (not b!875282) (not b!875283) (not b!875277) (not b!875274))
(check-sat b_and!24883 (not b_next!15133))
