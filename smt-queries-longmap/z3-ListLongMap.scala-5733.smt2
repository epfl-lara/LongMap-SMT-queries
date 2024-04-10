; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74196 () Bool)

(assert start!74196)

(declare-fun b_free!15003 () Bool)

(declare-fun b_next!15003 () Bool)

(assert (=> start!74196 (= b_free!15003 (not b_next!15003))))

(declare-fun tp!52660 () Bool)

(declare-fun b_and!24755 () Bool)

(assert (=> start!74196 (= tp!52660 b_and!24755)))

(declare-fun b!872818 () Bool)

(declare-fun res!593190 () Bool)

(declare-fun e!486073 () Bool)

(assert (=> b!872818 (=> (not res!593190) (not e!486073))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50598 0))(
  ( (array!50599 (arr!24329 (Array (_ BitVec 32) (_ BitVec 64))) (size!24769 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50598)

(assert (=> b!872818 (= res!593190 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24769 _keys!868))))))

(declare-fun b!872819 () Bool)

(declare-fun e!486071 () Bool)

(declare-fun tp_is_empty!17235 () Bool)

(assert (=> b!872819 (= e!486071 tp_is_empty!17235)))

(declare-datatypes ((V!28027 0))(
  ( (V!28028 (val!8665 Int)) )
))
(declare-fun v!557 () V!28027)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun e!486072 () Bool)

(declare-datatypes ((tuple2!11456 0))(
  ( (tuple2!11457 (_1!5739 (_ BitVec 64)) (_2!5739 V!28027)) )
))
(declare-datatypes ((List!17274 0))(
  ( (Nil!17271) (Cons!17270 (h!18401 tuple2!11456) (t!24311 List!17274)) )
))
(declare-datatypes ((ListLongMap!10225 0))(
  ( (ListLongMap!10226 (toList!5128 List!17274)) )
))
(declare-fun call!38477 () ListLongMap!10225)

(declare-fun b!872820 () Bool)

(declare-fun call!38476 () ListLongMap!10225)

(declare-fun +!2458 (ListLongMap!10225 tuple2!11456) ListLongMap!10225)

(assert (=> b!872820 (= e!486072 (= call!38477 (+!2458 call!38476 (tuple2!11457 k0!854 v!557))))))

(declare-fun b!872821 () Bool)

(declare-fun e!486075 () Bool)

(declare-fun e!486074 () Bool)

(declare-fun mapRes!27455 () Bool)

(assert (=> b!872821 (= e!486075 (and e!486074 mapRes!27455))))

(declare-fun condMapEmpty!27455 () Bool)

(declare-datatypes ((ValueCell!8178 0))(
  ( (ValueCellFull!8178 (v!11090 V!28027)) (EmptyCell!8178) )
))
(declare-datatypes ((array!50600 0))(
  ( (array!50601 (arr!24330 (Array (_ BitVec 32) ValueCell!8178)) (size!24770 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50600)

(declare-fun mapDefault!27455 () ValueCell!8178)

(assert (=> b!872821 (= condMapEmpty!27455 (= (arr!24330 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8178)) mapDefault!27455)))))

(declare-fun b!872822 () Bool)

(declare-fun res!593185 () Bool)

(assert (=> b!872822 (=> (not res!593185) (not e!486073))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!872822 (= res!593185 (and (= (select (arr!24329 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24769 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!27455 () Bool)

(assert (=> mapIsEmpty!27455 mapRes!27455))

(declare-fun bm!38473 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28027)

(declare-fun zeroValue!654 () V!28027)

(declare-fun getCurrentListMapNoExtraKeys!3097 (array!50598 array!50600 (_ BitVec 32) (_ BitVec 32) V!28027 V!28027 (_ BitVec 32) Int) ListLongMap!10225)

(assert (=> bm!38473 (= call!38477 (getCurrentListMapNoExtraKeys!3097 _keys!868 (array!50601 (store (arr!24330 _values!688) i!612 (ValueCellFull!8178 v!557)) (size!24770 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!872823 () Bool)

(declare-fun res!593189 () Bool)

(assert (=> b!872823 (=> (not res!593189) (not e!486073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50598 (_ BitVec 32)) Bool)

(assert (=> b!872823 (= res!593189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872824 () Bool)

(assert (=> b!872824 (= e!486072 (= call!38477 call!38476))))

(declare-fun mapNonEmpty!27455 () Bool)

(declare-fun tp!52659 () Bool)

(assert (=> mapNonEmpty!27455 (= mapRes!27455 (and tp!52659 e!486071))))

(declare-fun mapValue!27455 () ValueCell!8178)

(declare-fun mapKey!27455 () (_ BitVec 32))

(declare-fun mapRest!27455 () (Array (_ BitVec 32) ValueCell!8178))

(assert (=> mapNonEmpty!27455 (= (arr!24330 _values!688) (store mapRest!27455 mapKey!27455 mapValue!27455))))

(declare-fun b!872825 () Bool)

(declare-fun res!593192 () Bool)

(assert (=> b!872825 (=> (not res!593192) (not e!486073))))

(declare-datatypes ((List!17275 0))(
  ( (Nil!17272) (Cons!17271 (h!18402 (_ BitVec 64)) (t!24312 List!17275)) )
))
(declare-fun arrayNoDuplicates!0 (array!50598 (_ BitVec 32) List!17275) Bool)

(assert (=> b!872825 (= res!593192 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17272))))

(declare-fun b!872826 () Bool)

(declare-fun res!593186 () Bool)

(assert (=> b!872826 (=> (not res!593186) (not e!486073))))

(assert (=> b!872826 (= res!593186 (and (= (size!24770 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24769 _keys!868) (size!24770 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872828 () Bool)

(declare-fun res!593188 () Bool)

(assert (=> b!872828 (=> (not res!593188) (not e!486073))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!872828 (= res!593188 (validKeyInArray!0 k0!854))))

(declare-fun b!872829 () Bool)

(assert (=> b!872829 (= e!486074 tp_is_empty!17235)))

(declare-fun b!872830 () Bool)

(declare-fun res!593187 () Bool)

(assert (=> b!872830 (=> (not res!593187) (not e!486073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872830 (= res!593187 (validMask!0 mask!1196))))

(declare-fun bm!38474 () Bool)

(assert (=> bm!38474 (= call!38476 (getCurrentListMapNoExtraKeys!3097 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!593191 () Bool)

(assert (=> start!74196 (=> (not res!593191) (not e!486073))))

(assert (=> start!74196 (= res!593191 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24769 _keys!868))))))

(assert (=> start!74196 e!486073))

(assert (=> start!74196 tp_is_empty!17235))

(assert (=> start!74196 true))

(assert (=> start!74196 tp!52660))

(declare-fun array_inv!19198 (array!50598) Bool)

(assert (=> start!74196 (array_inv!19198 _keys!868)))

(declare-fun array_inv!19199 (array!50600) Bool)

(assert (=> start!74196 (and (array_inv!19199 _values!688) e!486075)))

(declare-fun b!872827 () Bool)

(assert (=> b!872827 (= e!486073 (not true))))

(assert (=> b!872827 e!486072))

(declare-fun c!92398 () Bool)

(assert (=> b!872827 (= c!92398 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29916 0))(
  ( (Unit!29917) )
))
(declare-fun lt!395659 () Unit!29916)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!652 (array!50598 array!50600 (_ BitVec 32) (_ BitVec 32) V!28027 V!28027 (_ BitVec 32) (_ BitVec 64) V!28027 (_ BitVec 32) Int) Unit!29916)

(assert (=> b!872827 (= lt!395659 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!652 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!74196 res!593191) b!872830))

(assert (= (and b!872830 res!593187) b!872826))

(assert (= (and b!872826 res!593186) b!872823))

(assert (= (and b!872823 res!593189) b!872825))

(assert (= (and b!872825 res!593192) b!872818))

(assert (= (and b!872818 res!593190) b!872828))

(assert (= (and b!872828 res!593188) b!872822))

(assert (= (and b!872822 res!593185) b!872827))

(assert (= (and b!872827 c!92398) b!872820))

(assert (= (and b!872827 (not c!92398)) b!872824))

(assert (= (or b!872820 b!872824) bm!38473))

(assert (= (or b!872820 b!872824) bm!38474))

(assert (= (and b!872821 condMapEmpty!27455) mapIsEmpty!27455))

(assert (= (and b!872821 (not condMapEmpty!27455)) mapNonEmpty!27455))

(get-info :version)

(assert (= (and mapNonEmpty!27455 ((_ is ValueCellFull!8178) mapValue!27455)) b!872819))

(assert (= (and b!872821 ((_ is ValueCellFull!8178) mapDefault!27455)) b!872829))

(assert (= start!74196 b!872821))

(declare-fun m!813469 () Bool)

(assert (=> mapNonEmpty!27455 m!813469))

(declare-fun m!813471 () Bool)

(assert (=> start!74196 m!813471))

(declare-fun m!813473 () Bool)

(assert (=> start!74196 m!813473))

(declare-fun m!813475 () Bool)

(assert (=> b!872830 m!813475))

(declare-fun m!813477 () Bool)

(assert (=> b!872823 m!813477))

(declare-fun m!813479 () Bool)

(assert (=> bm!38473 m!813479))

(declare-fun m!813481 () Bool)

(assert (=> bm!38473 m!813481))

(declare-fun m!813483 () Bool)

(assert (=> b!872820 m!813483))

(declare-fun m!813485 () Bool)

(assert (=> b!872828 m!813485))

(declare-fun m!813487 () Bool)

(assert (=> b!872827 m!813487))

(declare-fun m!813489 () Bool)

(assert (=> b!872822 m!813489))

(declare-fun m!813491 () Bool)

(assert (=> bm!38474 m!813491))

(declare-fun m!813493 () Bool)

(assert (=> b!872825 m!813493))

(check-sat (not start!74196) (not b!872828) (not bm!38474) b_and!24755 (not b!872825) (not mapNonEmpty!27455) (not b!872823) (not b!872830) (not b_next!15003) tp_is_empty!17235 (not b!872827) (not bm!38473) (not b!872820))
(check-sat b_and!24755 (not b_next!15003))
