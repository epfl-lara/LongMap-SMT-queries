; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74082 () Bool)

(assert start!74082)

(declare-fun b_free!14991 () Bool)

(declare-fun b_next!14991 () Bool)

(assert (=> start!74082 (= b_free!14991 (not b_next!14991))))

(declare-fun tp!52485 () Bool)

(declare-fun b_and!24743 () Bool)

(assert (=> start!74082 (= tp!52485 b_and!24743)))

(declare-fun mapNonEmpty!27299 () Bool)

(declare-fun mapRes!27299 () Bool)

(declare-fun tp!52486 () Bool)

(declare-fun e!485266 () Bool)

(assert (=> mapNonEmpty!27299 (= mapRes!27299 (and tp!52486 e!485266))))

(declare-datatypes ((V!27891 0))(
  ( (V!27892 (val!8614 Int)) )
))
(declare-datatypes ((ValueCell!8127 0))(
  ( (ValueCellFull!8127 (v!11039 V!27891)) (EmptyCell!8127) )
))
(declare-fun mapValue!27299 () ValueCell!8127)

(declare-fun mapRest!27299 () (Array (_ BitVec 32) ValueCell!8127))

(declare-datatypes ((array!50404 0))(
  ( (array!50405 (arr!24233 (Array (_ BitVec 32) ValueCell!8127)) (size!24673 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50404)

(declare-fun mapKey!27299 () (_ BitVec 32))

(assert (=> mapNonEmpty!27299 (= (arr!24233 _values!688) (store mapRest!27299 mapKey!27299 mapValue!27299))))

(declare-fun res!592433 () Bool)

(declare-fun e!485272 () Bool)

(assert (=> start!74082 (=> (not res!592433) (not e!485272))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50406 0))(
  ( (array!50407 (arr!24234 (Array (_ BitVec 32) (_ BitVec 64))) (size!24674 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50406)

(assert (=> start!74082 (= res!592433 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24674 _keys!868))))))

(assert (=> start!74082 e!485272))

(declare-fun tp_is_empty!17133 () Bool)

(assert (=> start!74082 tp_is_empty!17133))

(assert (=> start!74082 true))

(assert (=> start!74082 tp!52485))

(declare-fun array_inv!19136 (array!50406) Bool)

(assert (=> start!74082 (array_inv!19136 _keys!868)))

(declare-fun e!485270 () Bool)

(declare-fun array_inv!19137 (array!50404) Bool)

(assert (=> start!74082 (and (array_inv!19137 _values!688) e!485270)))

(declare-fun b!871564 () Bool)

(declare-fun res!592435 () Bool)

(assert (=> b!871564 (=> (not res!592435) (not e!485272))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!871564 (= res!592435 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24674 _keys!868))))))

(declare-fun mapIsEmpty!27299 () Bool)

(assert (=> mapIsEmpty!27299 mapRes!27299))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!395496 () array!50404)

(declare-fun minValue!654 () V!27891)

(declare-fun zeroValue!654 () V!27891)

(declare-fun bm!38449 () Bool)

(declare-datatypes ((tuple2!11444 0))(
  ( (tuple2!11445 (_1!5733 (_ BitVec 64)) (_2!5733 V!27891)) )
))
(declare-datatypes ((List!17232 0))(
  ( (Nil!17229) (Cons!17228 (h!18359 tuple2!11444) (t!24269 List!17232)) )
))
(declare-datatypes ((ListLongMap!10213 0))(
  ( (ListLongMap!10214 (toList!5122 List!17232)) )
))
(declare-fun call!38453 () ListLongMap!10213)

(declare-fun getCurrentListMapNoExtraKeys!3091 (array!50406 array!50404 (_ BitVec 32) (_ BitVec 32) V!27891 V!27891 (_ BitVec 32) Int) ListLongMap!10213)

(assert (=> bm!38449 (= call!38453 (getCurrentListMapNoExtraKeys!3091 _keys!868 lt!395496 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!871565 () Bool)

(declare-fun res!592430 () Bool)

(assert (=> b!871565 (=> (not res!592430) (not e!485272))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871565 (= res!592430 (validKeyInArray!0 k0!854))))

(declare-fun call!38452 () ListLongMap!10213)

(declare-fun bm!38450 () Bool)

(assert (=> bm!38450 (= call!38452 (getCurrentListMapNoExtraKeys!3091 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!871566 () Bool)

(declare-fun e!485267 () Bool)

(assert (=> b!871566 (= e!485272 e!485267)))

(declare-fun res!592431 () Bool)

(assert (=> b!871566 (=> (not res!592431) (not e!485267))))

(assert (=> b!871566 (= res!592431 (= from!1053 i!612))))

(declare-fun lt!395495 () ListLongMap!10213)

(assert (=> b!871566 (= lt!395495 (getCurrentListMapNoExtraKeys!3091 _keys!868 lt!395496 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27891)

(assert (=> b!871566 (= lt!395496 (array!50405 (store (arr!24233 _values!688) i!612 (ValueCellFull!8127 v!557)) (size!24673 _values!688)))))

(declare-fun lt!395497 () ListLongMap!10213)

(assert (=> b!871566 (= lt!395497 (getCurrentListMapNoExtraKeys!3091 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!871567 () Bool)

(declare-fun e!485268 () Bool)

(assert (=> b!871567 (= e!485268 (= call!38453 call!38452))))

(declare-fun b!871568 () Bool)

(declare-fun e!485271 () Bool)

(assert (=> b!871568 (= e!485271 tp_is_empty!17133)))

(declare-fun b!871569 () Bool)

(declare-fun res!592436 () Bool)

(assert (=> b!871569 (=> (not res!592436) (not e!485272))))

(assert (=> b!871569 (= res!592436 (and (= (select (arr!24234 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!871570 () Bool)

(declare-fun res!592432 () Bool)

(assert (=> b!871570 (=> (not res!592432) (not e!485272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50406 (_ BitVec 32)) Bool)

(assert (=> b!871570 (= res!592432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871571 () Bool)

(declare-fun res!592434 () Bool)

(assert (=> b!871571 (=> (not res!592434) (not e!485272))))

(assert (=> b!871571 (= res!592434 (and (= (size!24673 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24674 _keys!868) (size!24673 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!871572 () Bool)

(assert (=> b!871572 (= e!485270 (and e!485271 mapRes!27299))))

(declare-fun condMapEmpty!27299 () Bool)

(declare-fun mapDefault!27299 () ValueCell!8127)

(assert (=> b!871572 (= condMapEmpty!27299 (= (arr!24233 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8127)) mapDefault!27299)))))

(declare-fun b!871573 () Bool)

(assert (=> b!871573 (= e!485267 (not (validKeyInArray!0 (select (arr!24234 _keys!868) from!1053))))))

(assert (=> b!871573 e!485268))

(declare-fun c!92383 () Bool)

(assert (=> b!871573 (= c!92383 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29910 0))(
  ( (Unit!29911) )
))
(declare-fun lt!395494 () Unit!29910)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!650 (array!50406 array!50404 (_ BitVec 32) (_ BitVec 32) V!27891 V!27891 (_ BitVec 32) (_ BitVec 64) V!27891 (_ BitVec 32) Int) Unit!29910)

(assert (=> b!871573 (= lt!395494 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!650 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!871574 () Bool)

(declare-fun res!592428 () Bool)

(assert (=> b!871574 (=> (not res!592428) (not e!485272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871574 (= res!592428 (validMask!0 mask!1196))))

(declare-fun b!871575 () Bool)

(assert (=> b!871575 (= e!485266 tp_is_empty!17133)))

(declare-fun b!871576 () Bool)

(declare-fun +!2456 (ListLongMap!10213 tuple2!11444) ListLongMap!10213)

(assert (=> b!871576 (= e!485268 (= call!38453 (+!2456 call!38452 (tuple2!11445 k0!854 v!557))))))

(declare-fun b!871577 () Bool)

(declare-fun res!592429 () Bool)

(assert (=> b!871577 (=> (not res!592429) (not e!485272))))

(declare-datatypes ((List!17233 0))(
  ( (Nil!17230) (Cons!17229 (h!18360 (_ BitVec 64)) (t!24270 List!17233)) )
))
(declare-fun arrayNoDuplicates!0 (array!50406 (_ BitVec 32) List!17233) Bool)

(assert (=> b!871577 (= res!592429 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17230))))

(assert (= (and start!74082 res!592433) b!871574))

(assert (= (and b!871574 res!592428) b!871571))

(assert (= (and b!871571 res!592434) b!871570))

(assert (= (and b!871570 res!592432) b!871577))

(assert (= (and b!871577 res!592429) b!871564))

(assert (= (and b!871564 res!592435) b!871565))

(assert (= (and b!871565 res!592430) b!871569))

(assert (= (and b!871569 res!592436) b!871566))

(assert (= (and b!871566 res!592431) b!871573))

(assert (= (and b!871573 c!92383) b!871576))

(assert (= (and b!871573 (not c!92383)) b!871567))

(assert (= (or b!871576 b!871567) bm!38450))

(assert (= (or b!871576 b!871567) bm!38449))

(assert (= (and b!871572 condMapEmpty!27299) mapIsEmpty!27299))

(assert (= (and b!871572 (not condMapEmpty!27299)) mapNonEmpty!27299))

(get-info :version)

(assert (= (and mapNonEmpty!27299 ((_ is ValueCellFull!8127) mapValue!27299)) b!871575))

(assert (= (and b!871572 ((_ is ValueCellFull!8127) mapDefault!27299)) b!871568))

(assert (= start!74082 b!871572))

(declare-fun m!812727 () Bool)

(assert (=> b!871566 m!812727))

(declare-fun m!812729 () Bool)

(assert (=> b!871566 m!812729))

(declare-fun m!812731 () Bool)

(assert (=> b!871566 m!812731))

(declare-fun m!812733 () Bool)

(assert (=> b!871570 m!812733))

(declare-fun m!812735 () Bool)

(assert (=> b!871574 m!812735))

(declare-fun m!812737 () Bool)

(assert (=> b!871577 m!812737))

(declare-fun m!812739 () Bool)

(assert (=> b!871573 m!812739))

(assert (=> b!871573 m!812739))

(declare-fun m!812741 () Bool)

(assert (=> b!871573 m!812741))

(declare-fun m!812743 () Bool)

(assert (=> b!871573 m!812743))

(declare-fun m!812745 () Bool)

(assert (=> start!74082 m!812745))

(declare-fun m!812747 () Bool)

(assert (=> start!74082 m!812747))

(declare-fun m!812749 () Bool)

(assert (=> b!871576 m!812749))

(declare-fun m!812751 () Bool)

(assert (=> bm!38449 m!812751))

(declare-fun m!812753 () Bool)

(assert (=> b!871569 m!812753))

(declare-fun m!812755 () Bool)

(assert (=> b!871565 m!812755))

(declare-fun m!812757 () Bool)

(assert (=> bm!38450 m!812757))

(declare-fun m!812759 () Bool)

(assert (=> mapNonEmpty!27299 m!812759))

(check-sat (not b!871576) (not mapNonEmpty!27299) (not b_next!14991) (not start!74082) (not bm!38450) (not b!871577) (not b!871566) (not b!871565) (not b!871574) (not b!871570) tp_is_empty!17133 (not b!871573) b_and!24743 (not bm!38449))
(check-sat b_and!24743 (not b_next!14991))
