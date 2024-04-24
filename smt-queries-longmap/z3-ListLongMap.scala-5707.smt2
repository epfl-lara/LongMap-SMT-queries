; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74194 () Bool)

(assert start!74194)

(declare-fun b_free!14941 () Bool)

(declare-fun b_next!14941 () Bool)

(assert (=> start!74194 (= b_free!14941 (not b_next!14941))))

(declare-fun tp!52327 () Bool)

(declare-fun b_and!24703 () Bool)

(assert (=> start!74194 (= tp!52327 b_and!24703)))

(declare-fun res!592061 () Bool)

(declare-fun e!485351 () Bool)

(assert (=> start!74194 (=> (not res!592061) (not e!485351))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50357 0))(
  ( (array!50358 (arr!24205 (Array (_ BitVec 32) (_ BitVec 64))) (size!24646 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50357)

(assert (=> start!74194 (= res!592061 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24646 _keys!868))))))

(assert (=> start!74194 e!485351))

(declare-fun tp_is_empty!17077 () Bool)

(assert (=> start!74194 tp_is_empty!17077))

(assert (=> start!74194 true))

(assert (=> start!74194 tp!52327))

(declare-fun array_inv!19172 (array!50357) Bool)

(assert (=> start!74194 (array_inv!19172 _keys!868)))

(declare-datatypes ((V!27817 0))(
  ( (V!27818 (val!8586 Int)) )
))
(declare-datatypes ((ValueCell!8099 0))(
  ( (ValueCellFull!8099 (v!11011 V!27817)) (EmptyCell!8099) )
))
(declare-datatypes ((array!50359 0))(
  ( (array!50360 (arr!24206 (Array (_ BitVec 32) ValueCell!8099)) (size!24647 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50359)

(declare-fun e!485350 () Bool)

(declare-fun array_inv!19173 (array!50359) Bool)

(assert (=> start!74194 (and (array_inv!19173 _values!688) e!485350)))

(declare-fun b!871494 () Bool)

(declare-fun res!592064 () Bool)

(assert (=> b!871494 (=> (not res!592064) (not e!485351))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871494 (= res!592064 (validMask!0 mask!1196))))

(declare-fun b!871495 () Bool)

(declare-fun e!485349 () Bool)

(assert (=> b!871495 (= e!485349 (not true))))

(declare-fun lt!395547 () array!50359)

(declare-fun v!557 () V!27817)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!27817)

(declare-fun zeroValue!654 () V!27817)

(declare-datatypes ((tuple2!11342 0))(
  ( (tuple2!11343 (_1!5682 (_ BitVec 64)) (_2!5682 V!27817)) )
))
(declare-datatypes ((List!17159 0))(
  ( (Nil!17156) (Cons!17155 (h!18292 tuple2!11342) (t!24188 List!17159)) )
))
(declare-datatypes ((ListLongMap!10113 0))(
  ( (ListLongMap!10114 (toList!5072 List!17159)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3116 (array!50357 array!50359 (_ BitVec 32) (_ BitVec 32) V!27817 V!27817 (_ BitVec 32) Int) ListLongMap!10113)

(declare-fun +!2463 (ListLongMap!10113 tuple2!11342) ListLongMap!10113)

(assert (=> b!871495 (= (getCurrentListMapNoExtraKeys!3116 _keys!868 lt!395547 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2463 (getCurrentListMapNoExtraKeys!3116 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11343 k0!854 v!557)))))

(declare-datatypes ((Unit!29876 0))(
  ( (Unit!29877) )
))
(declare-fun lt!395546 () Unit!29876)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!634 (array!50357 array!50359 (_ BitVec 32) (_ BitVec 32) V!27817 V!27817 (_ BitVec 32) (_ BitVec 64) V!27817 (_ BitVec 32) Int) Unit!29876)

(assert (=> b!871495 (= lt!395546 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!634 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!871496 () Bool)

(declare-fun res!592067 () Bool)

(assert (=> b!871496 (=> (not res!592067) (not e!485351))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50357 (_ BitVec 32)) Bool)

(assert (=> b!871496 (= res!592067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27215 () Bool)

(declare-fun mapRes!27215 () Bool)

(declare-fun tp!52328 () Bool)

(declare-fun e!485348 () Bool)

(assert (=> mapNonEmpty!27215 (= mapRes!27215 (and tp!52328 e!485348))))

(declare-fun mapValue!27215 () ValueCell!8099)

(declare-fun mapKey!27215 () (_ BitVec 32))

(declare-fun mapRest!27215 () (Array (_ BitVec 32) ValueCell!8099))

(assert (=> mapNonEmpty!27215 (= (arr!24206 _values!688) (store mapRest!27215 mapKey!27215 mapValue!27215))))

(declare-fun b!871497 () Bool)

(declare-fun res!592063 () Bool)

(assert (=> b!871497 (=> (not res!592063) (not e!485351))))

(declare-datatypes ((List!17160 0))(
  ( (Nil!17157) (Cons!17156 (h!18293 (_ BitVec 64)) (t!24189 List!17160)) )
))
(declare-fun arrayNoDuplicates!0 (array!50357 (_ BitVec 32) List!17160) Bool)

(assert (=> b!871497 (= res!592063 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17157))))

(declare-fun b!871498 () Bool)

(declare-fun e!485352 () Bool)

(assert (=> b!871498 (= e!485350 (and e!485352 mapRes!27215))))

(declare-fun condMapEmpty!27215 () Bool)

(declare-fun mapDefault!27215 () ValueCell!8099)

(assert (=> b!871498 (= condMapEmpty!27215 (= (arr!24206 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8099)) mapDefault!27215)))))

(declare-fun mapIsEmpty!27215 () Bool)

(assert (=> mapIsEmpty!27215 mapRes!27215))

(declare-fun b!871499 () Bool)

(assert (=> b!871499 (= e!485351 e!485349)))

(declare-fun res!592065 () Bool)

(assert (=> b!871499 (=> (not res!592065) (not e!485349))))

(assert (=> b!871499 (= res!592065 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395548 () ListLongMap!10113)

(assert (=> b!871499 (= lt!395548 (getCurrentListMapNoExtraKeys!3116 _keys!868 lt!395547 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!871499 (= lt!395547 (array!50360 (store (arr!24206 _values!688) i!612 (ValueCellFull!8099 v!557)) (size!24647 _values!688)))))

(declare-fun lt!395549 () ListLongMap!10113)

(assert (=> b!871499 (= lt!395549 (getCurrentListMapNoExtraKeys!3116 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!871500 () Bool)

(declare-fun res!592062 () Bool)

(assert (=> b!871500 (=> (not res!592062) (not e!485351))))

(assert (=> b!871500 (= res!592062 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24646 _keys!868))))))

(declare-fun b!871501 () Bool)

(assert (=> b!871501 (= e!485348 tp_is_empty!17077)))

(declare-fun b!871502 () Bool)

(declare-fun res!592069 () Bool)

(assert (=> b!871502 (=> (not res!592069) (not e!485351))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871502 (= res!592069 (validKeyInArray!0 k0!854))))

(declare-fun b!871503 () Bool)

(declare-fun res!592068 () Bool)

(assert (=> b!871503 (=> (not res!592068) (not e!485351))))

(assert (=> b!871503 (= res!592068 (and (= (size!24647 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24646 _keys!868) (size!24647 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871504 () Bool)

(declare-fun res!592066 () Bool)

(assert (=> b!871504 (=> (not res!592066) (not e!485351))))

(assert (=> b!871504 (= res!592066 (and (= (select (arr!24205 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!871505 () Bool)

(assert (=> b!871505 (= e!485352 tp_is_empty!17077)))

(assert (= (and start!74194 res!592061) b!871494))

(assert (= (and b!871494 res!592064) b!871503))

(assert (= (and b!871503 res!592068) b!871496))

(assert (= (and b!871496 res!592067) b!871497))

(assert (= (and b!871497 res!592063) b!871500))

(assert (= (and b!871500 res!592062) b!871502))

(assert (= (and b!871502 res!592069) b!871504))

(assert (= (and b!871504 res!592066) b!871499))

(assert (= (and b!871499 res!592065) b!871495))

(assert (= (and b!871498 condMapEmpty!27215) mapIsEmpty!27215))

(assert (= (and b!871498 (not condMapEmpty!27215)) mapNonEmpty!27215))

(get-info :version)

(assert (= (and mapNonEmpty!27215 ((_ is ValueCellFull!8099) mapValue!27215)) b!871501))

(assert (= (and b!871498 ((_ is ValueCellFull!8099) mapDefault!27215)) b!871505))

(assert (= start!74194 b!871498))

(declare-fun m!813227 () Bool)

(assert (=> b!871502 m!813227))

(declare-fun m!813229 () Bool)

(assert (=> b!871504 m!813229))

(declare-fun m!813231 () Bool)

(assert (=> b!871499 m!813231))

(declare-fun m!813233 () Bool)

(assert (=> b!871499 m!813233))

(declare-fun m!813235 () Bool)

(assert (=> b!871499 m!813235))

(declare-fun m!813237 () Bool)

(assert (=> start!74194 m!813237))

(declare-fun m!813239 () Bool)

(assert (=> start!74194 m!813239))

(declare-fun m!813241 () Bool)

(assert (=> b!871494 m!813241))

(declare-fun m!813243 () Bool)

(assert (=> b!871497 m!813243))

(declare-fun m!813245 () Bool)

(assert (=> mapNonEmpty!27215 m!813245))

(declare-fun m!813247 () Bool)

(assert (=> b!871496 m!813247))

(declare-fun m!813249 () Bool)

(assert (=> b!871495 m!813249))

(declare-fun m!813251 () Bool)

(assert (=> b!871495 m!813251))

(assert (=> b!871495 m!813251))

(declare-fun m!813253 () Bool)

(assert (=> b!871495 m!813253))

(declare-fun m!813255 () Bool)

(assert (=> b!871495 m!813255))

(check-sat (not b!871494) (not b_next!14941) (not b!871497) (not mapNonEmpty!27215) (not b!871502) b_and!24703 tp_is_empty!17077 (not b!871495) (not b!871496) (not b!871499) (not start!74194))
(check-sat b_and!24703 (not b_next!14941))
