; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74206 () Bool)

(assert start!74206)

(declare-fun b_free!14953 () Bool)

(declare-fun b_next!14953 () Bool)

(assert (=> start!74206 (= b_free!14953 (not b_next!14953))))

(declare-fun tp!52364 () Bool)

(declare-fun b_and!24715 () Bool)

(assert (=> start!74206 (= tp!52364 b_and!24715)))

(declare-fun b!871710 () Bool)

(declare-fun res!592229 () Bool)

(declare-fun e!485456 () Bool)

(assert (=> b!871710 (=> (not res!592229) (not e!485456))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27833 0))(
  ( (V!27834 (val!8592 Int)) )
))
(declare-datatypes ((ValueCell!8105 0))(
  ( (ValueCellFull!8105 (v!11017 V!27833)) (EmptyCell!8105) )
))
(declare-datatypes ((array!50381 0))(
  ( (array!50382 (arr!24217 (Array (_ BitVec 32) ValueCell!8105)) (size!24658 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50381)

(declare-datatypes ((array!50383 0))(
  ( (array!50384 (arr!24218 (Array (_ BitVec 32) (_ BitVec 64))) (size!24659 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50383)

(assert (=> b!871710 (= res!592229 (and (= (size!24658 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24659 _keys!868) (size!24658 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871711 () Bool)

(declare-fun res!592223 () Bool)

(assert (=> b!871711 (=> (not res!592223) (not e!485456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50383 (_ BitVec 32)) Bool)

(assert (=> b!871711 (= res!592223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871712 () Bool)

(declare-fun e!485457 () Bool)

(assert (=> b!871712 (= e!485457 (not true))))

(declare-fun v!557 () V!27833)

(declare-fun defaultEntry!696 () Int)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27833)

(declare-fun zeroValue!654 () V!27833)

(declare-fun lt!395621 () array!50381)

(declare-datatypes ((tuple2!11350 0))(
  ( (tuple2!11351 (_1!5686 (_ BitVec 64)) (_2!5686 V!27833)) )
))
(declare-datatypes ((List!17168 0))(
  ( (Nil!17165) (Cons!17164 (h!18301 tuple2!11350) (t!24197 List!17168)) )
))
(declare-datatypes ((ListLongMap!10121 0))(
  ( (ListLongMap!10122 (toList!5076 List!17168)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3120 (array!50383 array!50381 (_ BitVec 32) (_ BitVec 32) V!27833 V!27833 (_ BitVec 32) Int) ListLongMap!10121)

(declare-fun +!2466 (ListLongMap!10121 tuple2!11350) ListLongMap!10121)

(assert (=> b!871712 (= (getCurrentListMapNoExtraKeys!3120 _keys!868 lt!395621 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2466 (getCurrentListMapNoExtraKeys!3120 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11351 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29882 0))(
  ( (Unit!29883) )
))
(declare-fun lt!395619 () Unit!29882)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!637 (array!50383 array!50381 (_ BitVec 32) (_ BitVec 32) V!27833 V!27833 (_ BitVec 32) (_ BitVec 64) V!27833 (_ BitVec 32) Int) Unit!29882)

(assert (=> b!871712 (= lt!395619 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!637 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!871713 () Bool)

(declare-fun res!592231 () Bool)

(assert (=> b!871713 (=> (not res!592231) (not e!485456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871713 (= res!592231 (validMask!0 mask!1196))))

(declare-fun b!871714 () Bool)

(declare-fun e!485458 () Bool)

(declare-fun tp_is_empty!17089 () Bool)

(assert (=> b!871714 (= e!485458 tp_is_empty!17089)))

(declare-fun res!592225 () Bool)

(assert (=> start!74206 (=> (not res!592225) (not e!485456))))

(assert (=> start!74206 (= res!592225 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24659 _keys!868))))))

(assert (=> start!74206 e!485456))

(assert (=> start!74206 tp_is_empty!17089))

(assert (=> start!74206 true))

(assert (=> start!74206 tp!52364))

(declare-fun array_inv!19180 (array!50383) Bool)

(assert (=> start!74206 (array_inv!19180 _keys!868)))

(declare-fun e!485460 () Bool)

(declare-fun array_inv!19181 (array!50381) Bool)

(assert (=> start!74206 (and (array_inv!19181 _values!688) e!485460)))

(declare-fun mapIsEmpty!27233 () Bool)

(declare-fun mapRes!27233 () Bool)

(assert (=> mapIsEmpty!27233 mapRes!27233))

(declare-fun b!871715 () Bool)

(assert (=> b!871715 (= e!485456 e!485457)))

(declare-fun res!592228 () Bool)

(assert (=> b!871715 (=> (not res!592228) (not e!485457))))

(assert (=> b!871715 (= res!592228 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395618 () ListLongMap!10121)

(assert (=> b!871715 (= lt!395618 (getCurrentListMapNoExtraKeys!3120 _keys!868 lt!395621 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!871715 (= lt!395621 (array!50382 (store (arr!24217 _values!688) i!612 (ValueCellFull!8105 v!557)) (size!24658 _values!688)))))

(declare-fun lt!395620 () ListLongMap!10121)

(assert (=> b!871715 (= lt!395620 (getCurrentListMapNoExtraKeys!3120 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!871716 () Bool)

(declare-fun e!485459 () Bool)

(assert (=> b!871716 (= e!485460 (and e!485459 mapRes!27233))))

(declare-fun condMapEmpty!27233 () Bool)

(declare-fun mapDefault!27233 () ValueCell!8105)

(assert (=> b!871716 (= condMapEmpty!27233 (= (arr!24217 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8105)) mapDefault!27233)))))

(declare-fun b!871717 () Bool)

(declare-fun res!592224 () Bool)

(assert (=> b!871717 (=> (not res!592224) (not e!485456))))

(assert (=> b!871717 (= res!592224 (and (= (select (arr!24218 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!871718 () Bool)

(declare-fun res!592226 () Bool)

(assert (=> b!871718 (=> (not res!592226) (not e!485456))))

(declare-datatypes ((List!17169 0))(
  ( (Nil!17166) (Cons!17165 (h!18302 (_ BitVec 64)) (t!24198 List!17169)) )
))
(declare-fun arrayNoDuplicates!0 (array!50383 (_ BitVec 32) List!17169) Bool)

(assert (=> b!871718 (= res!592226 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17166))))

(declare-fun b!871719 () Bool)

(declare-fun res!592227 () Bool)

(assert (=> b!871719 (=> (not res!592227) (not e!485456))))

(assert (=> b!871719 (= res!592227 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24659 _keys!868))))))

(declare-fun mapNonEmpty!27233 () Bool)

(declare-fun tp!52363 () Bool)

(assert (=> mapNonEmpty!27233 (= mapRes!27233 (and tp!52363 e!485458))))

(declare-fun mapRest!27233 () (Array (_ BitVec 32) ValueCell!8105))

(declare-fun mapValue!27233 () ValueCell!8105)

(declare-fun mapKey!27233 () (_ BitVec 32))

(assert (=> mapNonEmpty!27233 (= (arr!24217 _values!688) (store mapRest!27233 mapKey!27233 mapValue!27233))))

(declare-fun b!871720 () Bool)

(declare-fun res!592230 () Bool)

(assert (=> b!871720 (=> (not res!592230) (not e!485456))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871720 (= res!592230 (validKeyInArray!0 k0!854))))

(declare-fun b!871721 () Bool)

(assert (=> b!871721 (= e!485459 tp_is_empty!17089)))

(assert (= (and start!74206 res!592225) b!871713))

(assert (= (and b!871713 res!592231) b!871710))

(assert (= (and b!871710 res!592229) b!871711))

(assert (= (and b!871711 res!592223) b!871718))

(assert (= (and b!871718 res!592226) b!871719))

(assert (= (and b!871719 res!592227) b!871720))

(assert (= (and b!871720 res!592230) b!871717))

(assert (= (and b!871717 res!592224) b!871715))

(assert (= (and b!871715 res!592228) b!871712))

(assert (= (and b!871716 condMapEmpty!27233) mapIsEmpty!27233))

(assert (= (and b!871716 (not condMapEmpty!27233)) mapNonEmpty!27233))

(get-info :version)

(assert (= (and mapNonEmpty!27233 ((_ is ValueCellFull!8105) mapValue!27233)) b!871714))

(assert (= (and b!871716 ((_ is ValueCellFull!8105) mapDefault!27233)) b!871721))

(assert (= start!74206 b!871716))

(declare-fun m!813407 () Bool)

(assert (=> b!871718 m!813407))

(declare-fun m!813409 () Bool)

(assert (=> b!871712 m!813409))

(declare-fun m!813411 () Bool)

(assert (=> b!871712 m!813411))

(assert (=> b!871712 m!813411))

(declare-fun m!813413 () Bool)

(assert (=> b!871712 m!813413))

(declare-fun m!813415 () Bool)

(assert (=> b!871712 m!813415))

(declare-fun m!813417 () Bool)

(assert (=> b!871720 m!813417))

(declare-fun m!813419 () Bool)

(assert (=> start!74206 m!813419))

(declare-fun m!813421 () Bool)

(assert (=> start!74206 m!813421))

(declare-fun m!813423 () Bool)

(assert (=> b!871711 m!813423))

(declare-fun m!813425 () Bool)

(assert (=> b!871713 m!813425))

(declare-fun m!813427 () Bool)

(assert (=> mapNonEmpty!27233 m!813427))

(declare-fun m!813429 () Bool)

(assert (=> b!871715 m!813429))

(declare-fun m!813431 () Bool)

(assert (=> b!871715 m!813431))

(declare-fun m!813433 () Bool)

(assert (=> b!871715 m!813433))

(declare-fun m!813435 () Bool)

(assert (=> b!871717 m!813435))

(check-sat tp_is_empty!17089 (not mapNonEmpty!27233) b_and!24715 (not b!871713) (not b!871720) (not b!871718) (not start!74206) (not b!871711) (not b!871712) (not b_next!14953) (not b!871715))
(check-sat b_and!24715 (not b_next!14953))
