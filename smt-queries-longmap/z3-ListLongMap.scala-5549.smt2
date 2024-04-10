; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73080 () Bool)

(assert start!73080)

(declare-fun b_free!13995 () Bool)

(declare-fun b_next!13995 () Bool)

(assert (=> start!73080 (= b_free!13995 (not b_next!13995))))

(declare-fun tp!49489 () Bool)

(declare-fun b_and!23149 () Bool)

(assert (=> start!73080 (= tp!49489 b_and!23149)))

(declare-fun b!850037 () Bool)

(declare-fun e!474207 () Bool)

(declare-fun e!474206 () Bool)

(assert (=> b!850037 (= e!474207 (not e!474206))))

(declare-fun res!577454 () Bool)

(assert (=> b!850037 (=> res!577454 e!474206)))

(declare-datatypes ((array!48468 0))(
  ( (array!48469 (arr!23265 (Array (_ BitVec 32) (_ BitVec 64))) (size!23705 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48468)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850037 (= res!577454 (not (validKeyInArray!0 (select (arr!23265 _keys!868) from!1053))))))

(declare-fun e!474203 () Bool)

(assert (=> b!850037 e!474203))

(declare-fun c!91663 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!850037 (= c!91663 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!26555 0))(
  ( (V!26556 (val!8113 Int)) )
))
(declare-fun v!557 () V!26555)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!26555)

(declare-fun zeroValue!654 () V!26555)

(declare-datatypes ((Unit!29025 0))(
  ( (Unit!29026) )
))
(declare-fun lt!382571 () Unit!29025)

(declare-datatypes ((ValueCell!7626 0))(
  ( (ValueCellFull!7626 (v!10538 V!26555)) (EmptyCell!7626) )
))
(declare-datatypes ((array!48470 0))(
  ( (array!48471 (arr!23266 (Array (_ BitVec 32) ValueCell!7626)) (size!23706 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48470)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!356 (array!48468 array!48470 (_ BitVec 32) (_ BitVec 32) V!26555 V!26555 (_ BitVec 32) (_ BitVec 64) V!26555 (_ BitVec 32) Int) Unit!29025)

(assert (=> b!850037 (= lt!382571 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!356 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((tuple2!10630 0))(
  ( (tuple2!10631 (_1!5326 (_ BitVec 64)) (_2!5326 V!26555)) )
))
(declare-datatypes ((List!16475 0))(
  ( (Nil!16472) (Cons!16471 (h!17602 tuple2!10630) (t!22916 List!16475)) )
))
(declare-datatypes ((ListLongMap!9399 0))(
  ( (ListLongMap!9400 (toList!4715 List!16475)) )
))
(declare-fun call!37840 () ListLongMap!9399)

(declare-fun call!37841 () ListLongMap!9399)

(declare-fun b!850039 () Bool)

(declare-fun +!2117 (ListLongMap!9399 tuple2!10630) ListLongMap!9399)

(assert (=> b!850039 (= e!474203 (= call!37841 (+!2117 call!37840 (tuple2!10631 k0!854 v!557))))))

(declare-fun lt!382572 () array!48470)

(declare-fun bm!37837 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2697 (array!48468 array!48470 (_ BitVec 32) (_ BitVec 32) V!26555 V!26555 (_ BitVec 32) Int) ListLongMap!9399)

(assert (=> bm!37837 (= call!37841 (getCurrentListMapNoExtraKeys!2697 _keys!868 lt!382572 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850040 () Bool)

(declare-fun e!474204 () Bool)

(assert (=> b!850040 (= e!474204 e!474207)))

(declare-fun res!577452 () Bool)

(assert (=> b!850040 (=> (not res!577452) (not e!474207))))

(assert (=> b!850040 (= res!577452 (= from!1053 i!612))))

(declare-fun lt!382566 () ListLongMap!9399)

(assert (=> b!850040 (= lt!382566 (getCurrentListMapNoExtraKeys!2697 _keys!868 lt!382572 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!850040 (= lt!382572 (array!48471 (store (arr!23266 _values!688) i!612 (ValueCellFull!7626 v!557)) (size!23706 _values!688)))))

(declare-fun lt!382569 () ListLongMap!9399)

(assert (=> b!850040 (= lt!382569 (getCurrentListMapNoExtraKeys!2697 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!850041 () Bool)

(assert (=> b!850041 (= e!474203 (= call!37841 call!37840))))

(declare-fun b!850042 () Bool)

(assert (=> b!850042 (= e!474206 true)))

(declare-fun lt!382565 () tuple2!10630)

(declare-fun lt!382564 () V!26555)

(declare-fun lt!382567 () ListLongMap!9399)

(assert (=> b!850042 (= (+!2117 lt!382567 lt!382565) (+!2117 (+!2117 lt!382567 (tuple2!10631 k0!854 lt!382564)) lt!382565))))

(declare-fun lt!382568 () V!26555)

(assert (=> b!850042 (= lt!382565 (tuple2!10631 k0!854 lt!382568))))

(declare-fun lt!382573 () Unit!29025)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!254 (ListLongMap!9399 (_ BitVec 64) V!26555 V!26555) Unit!29025)

(assert (=> b!850042 (= lt!382573 (addSameAsAddTwiceSameKeyDiffValues!254 lt!382567 k0!854 lt!382564 lt!382568))))

(declare-fun lt!382570 () V!26555)

(declare-fun get!12250 (ValueCell!7626 V!26555) V!26555)

(assert (=> b!850042 (= lt!382564 (get!12250 (select (arr!23266 _values!688) from!1053) lt!382570))))

(assert (=> b!850042 (= lt!382566 (+!2117 lt!382567 (tuple2!10631 (select (arr!23265 _keys!868) from!1053) lt!382568)))))

(assert (=> b!850042 (= lt!382568 (get!12250 (select (store (arr!23266 _values!688) i!612 (ValueCellFull!7626 v!557)) from!1053) lt!382570))))

(declare-fun dynLambda!1008 (Int (_ BitVec 64)) V!26555)

(assert (=> b!850042 (= lt!382570 (dynLambda!1008 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!850042 (= lt!382567 (getCurrentListMapNoExtraKeys!2697 _keys!868 lt!382572 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850043 () Bool)

(declare-fun res!577453 () Bool)

(assert (=> b!850043 (=> (not res!577453) (not e!474204))))

(assert (=> b!850043 (= res!577453 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23705 _keys!868))))))

(declare-fun b!850044 () Bool)

(declare-fun res!577450 () Bool)

(assert (=> b!850044 (=> (not res!577450) (not e!474204))))

(assert (=> b!850044 (= res!577450 (validKeyInArray!0 k0!854))))

(declare-fun b!850045 () Bool)

(declare-fun e!474202 () Bool)

(declare-fun tp_is_empty!16131 () Bool)

(assert (=> b!850045 (= e!474202 tp_is_empty!16131)))

(declare-fun b!850046 () Bool)

(declare-fun e!474208 () Bool)

(declare-fun e!474201 () Bool)

(declare-fun mapRes!25796 () Bool)

(assert (=> b!850046 (= e!474208 (and e!474201 mapRes!25796))))

(declare-fun condMapEmpty!25796 () Bool)

(declare-fun mapDefault!25796 () ValueCell!7626)

(assert (=> b!850046 (= condMapEmpty!25796 (= (arr!23266 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7626)) mapDefault!25796)))))

(declare-fun b!850047 () Bool)

(declare-fun res!577456 () Bool)

(assert (=> b!850047 (=> (not res!577456) (not e!474204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850047 (= res!577456 (validMask!0 mask!1196))))

(declare-fun b!850048 () Bool)

(declare-fun res!577451 () Bool)

(assert (=> b!850048 (=> (not res!577451) (not e!474204))))

(assert (=> b!850048 (= res!577451 (and (= (size!23706 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23705 _keys!868) (size!23706 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!577448 () Bool)

(assert (=> start!73080 (=> (not res!577448) (not e!474204))))

(assert (=> start!73080 (= res!577448 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23705 _keys!868))))))

(assert (=> start!73080 e!474204))

(assert (=> start!73080 tp_is_empty!16131))

(assert (=> start!73080 true))

(assert (=> start!73080 tp!49489))

(declare-fun array_inv!18462 (array!48468) Bool)

(assert (=> start!73080 (array_inv!18462 _keys!868)))

(declare-fun array_inv!18463 (array!48470) Bool)

(assert (=> start!73080 (and (array_inv!18463 _values!688) e!474208)))

(declare-fun b!850038 () Bool)

(assert (=> b!850038 (= e!474201 tp_is_empty!16131)))

(declare-fun mapIsEmpty!25796 () Bool)

(assert (=> mapIsEmpty!25796 mapRes!25796))

(declare-fun mapNonEmpty!25796 () Bool)

(declare-fun tp!49488 () Bool)

(assert (=> mapNonEmpty!25796 (= mapRes!25796 (and tp!49488 e!474202))))

(declare-fun mapValue!25796 () ValueCell!7626)

(declare-fun mapRest!25796 () (Array (_ BitVec 32) ValueCell!7626))

(declare-fun mapKey!25796 () (_ BitVec 32))

(assert (=> mapNonEmpty!25796 (= (arr!23266 _values!688) (store mapRest!25796 mapKey!25796 mapValue!25796))))

(declare-fun b!850049 () Bool)

(declare-fun res!577457 () Bool)

(assert (=> b!850049 (=> (not res!577457) (not e!474204))))

(assert (=> b!850049 (= res!577457 (and (= (select (arr!23265 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!850050 () Bool)

(declare-fun res!577455 () Bool)

(assert (=> b!850050 (=> (not res!577455) (not e!474204))))

(declare-datatypes ((List!16476 0))(
  ( (Nil!16473) (Cons!16472 (h!17603 (_ BitVec 64)) (t!22917 List!16476)) )
))
(declare-fun arrayNoDuplicates!0 (array!48468 (_ BitVec 32) List!16476) Bool)

(assert (=> b!850050 (= res!577455 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16473))))

(declare-fun b!850051 () Bool)

(declare-fun res!577449 () Bool)

(assert (=> b!850051 (=> (not res!577449) (not e!474204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48468 (_ BitVec 32)) Bool)

(assert (=> b!850051 (= res!577449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun bm!37838 () Bool)

(assert (=> bm!37838 (= call!37840 (getCurrentListMapNoExtraKeys!2697 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73080 res!577448) b!850047))

(assert (= (and b!850047 res!577456) b!850048))

(assert (= (and b!850048 res!577451) b!850051))

(assert (= (and b!850051 res!577449) b!850050))

(assert (= (and b!850050 res!577455) b!850043))

(assert (= (and b!850043 res!577453) b!850044))

(assert (= (and b!850044 res!577450) b!850049))

(assert (= (and b!850049 res!577457) b!850040))

(assert (= (and b!850040 res!577452) b!850037))

(assert (= (and b!850037 c!91663) b!850039))

(assert (= (and b!850037 (not c!91663)) b!850041))

(assert (= (or b!850039 b!850041) bm!37837))

(assert (= (or b!850039 b!850041) bm!37838))

(assert (= (and b!850037 (not res!577454)) b!850042))

(assert (= (and b!850046 condMapEmpty!25796) mapIsEmpty!25796))

(assert (= (and b!850046 (not condMapEmpty!25796)) mapNonEmpty!25796))

(get-info :version)

(assert (= (and mapNonEmpty!25796 ((_ is ValueCellFull!7626) mapValue!25796)) b!850045))

(assert (= (and b!850046 ((_ is ValueCellFull!7626) mapDefault!25796)) b!850038))

(assert (= start!73080 b!850046))

(declare-fun b_lambda!11527 () Bool)

(assert (=> (not b_lambda!11527) (not b!850042)))

(declare-fun t!22915 () Bool)

(declare-fun tb!4297 () Bool)

(assert (=> (and start!73080 (= defaultEntry!696 defaultEntry!696) t!22915) tb!4297))

(declare-fun result!8205 () Bool)

(assert (=> tb!4297 (= result!8205 tp_is_empty!16131)))

(assert (=> b!850042 t!22915))

(declare-fun b_and!23151 () Bool)

(assert (= b_and!23149 (and (=> t!22915 result!8205) b_and!23151)))

(declare-fun m!790737 () Bool)

(assert (=> b!850039 m!790737))

(declare-fun m!790739 () Bool)

(assert (=> b!850044 m!790739))

(declare-fun m!790741 () Bool)

(assert (=> b!850051 m!790741))

(declare-fun m!790743 () Bool)

(assert (=> bm!37838 m!790743))

(declare-fun m!790745 () Bool)

(assert (=> bm!37837 m!790745))

(declare-fun m!790747 () Bool)

(assert (=> b!850040 m!790747))

(declare-fun m!790749 () Bool)

(assert (=> b!850040 m!790749))

(declare-fun m!790751 () Bool)

(assert (=> b!850040 m!790751))

(declare-fun m!790753 () Bool)

(assert (=> b!850050 m!790753))

(declare-fun m!790755 () Bool)

(assert (=> b!850037 m!790755))

(assert (=> b!850037 m!790755))

(declare-fun m!790757 () Bool)

(assert (=> b!850037 m!790757))

(declare-fun m!790759 () Bool)

(assert (=> b!850037 m!790759))

(declare-fun m!790761 () Bool)

(assert (=> start!73080 m!790761))

(declare-fun m!790763 () Bool)

(assert (=> start!73080 m!790763))

(declare-fun m!790765 () Bool)

(assert (=> b!850049 m!790765))

(declare-fun m!790767 () Bool)

(assert (=> b!850042 m!790767))

(declare-fun m!790769 () Bool)

(assert (=> b!850042 m!790769))

(declare-fun m!790771 () Bool)

(assert (=> b!850042 m!790771))

(declare-fun m!790773 () Bool)

(assert (=> b!850042 m!790773))

(declare-fun m!790775 () Bool)

(assert (=> b!850042 m!790775))

(assert (=> b!850042 m!790749))

(declare-fun m!790777 () Bool)

(assert (=> b!850042 m!790777))

(declare-fun m!790779 () Bool)

(assert (=> b!850042 m!790779))

(assert (=> b!850042 m!790755))

(declare-fun m!790781 () Bool)

(assert (=> b!850042 m!790781))

(assert (=> b!850042 m!790775))

(declare-fun m!790783 () Bool)

(assert (=> b!850042 m!790783))

(assert (=> b!850042 m!790779))

(declare-fun m!790785 () Bool)

(assert (=> b!850042 m!790785))

(assert (=> b!850042 m!790767))

(assert (=> b!850042 m!790745))

(declare-fun m!790787 () Bool)

(assert (=> mapNonEmpty!25796 m!790787))

(declare-fun m!790789 () Bool)

(assert (=> b!850047 m!790789))

(check-sat tp_is_empty!16131 (not mapNonEmpty!25796) (not b!850040) (not b!850050) (not b_next!13995) (not b!850042) (not b!850051) (not b!850037) b_and!23151 (not bm!37837) (not b!850047) (not b!850039) (not b_lambda!11527) (not b!850044) (not bm!37838) (not start!73080))
(check-sat b_and!23151 (not b_next!13995))
