; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73008 () Bool)

(assert start!73008)

(declare-fun b_free!13923 () Bool)

(declare-fun b_next!13923 () Bool)

(assert (=> start!73008 (= b_free!13923 (not b_next!13923))))

(declare-fun tp!49273 () Bool)

(declare-fun b_and!23009 () Bool)

(assert (=> start!73008 (= tp!49273 b_and!23009)))

(declare-fun b!848349 () Bool)

(declare-fun res!576372 () Bool)

(declare-fun e!473342 () Bool)

(assert (=> b!848349 (=> (not res!576372) (not e!473342))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48324 0))(
  ( (array!48325 (arr!23193 (Array (_ BitVec 32) (_ BitVec 64))) (size!23633 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48324)

(assert (=> b!848349 (= res!576372 (and (= (select (arr!23193 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!848350 () Bool)

(declare-fun e!473340 () Bool)

(declare-fun tp_is_empty!16059 () Bool)

(assert (=> b!848350 (= e!473340 tp_is_empty!16059)))

(declare-fun bm!37621 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26459 0))(
  ( (V!26460 (val!8077 Int)) )
))
(declare-datatypes ((ValueCell!7590 0))(
  ( (ValueCellFull!7590 (v!10502 V!26459)) (EmptyCell!7590) )
))
(declare-datatypes ((array!48326 0))(
  ( (array!48327 (arr!23194 (Array (_ BitVec 32) ValueCell!7590)) (size!23634 (_ BitVec 32))) )
))
(declare-fun lt!381996 () array!48326)

(declare-fun minValue!654 () V!26459)

(declare-fun zeroValue!654 () V!26459)

(declare-datatypes ((tuple2!10560 0))(
  ( (tuple2!10561 (_1!5291 (_ BitVec 64)) (_2!5291 V!26459)) )
))
(declare-datatypes ((List!16416 0))(
  ( (Nil!16413) (Cons!16412 (h!17543 tuple2!10560) (t!22787 List!16416)) )
))
(declare-datatypes ((ListLongMap!9329 0))(
  ( (ListLongMap!9330 (toList!4680 List!16416)) )
))
(declare-fun call!37625 () ListLongMap!9329)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2663 (array!48324 array!48326 (_ BitVec 32) (_ BitVec 32) V!26459 V!26459 (_ BitVec 32) Int) ListLongMap!9329)

(assert (=> bm!37621 (= call!37625 (getCurrentListMapNoExtraKeys!2663 _keys!868 lt!381996 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25688 () Bool)

(declare-fun mapRes!25688 () Bool)

(assert (=> mapIsEmpty!25688 mapRes!25688))

(declare-fun b!848351 () Bool)

(declare-fun res!576373 () Bool)

(assert (=> b!848351 (=> (not res!576373) (not e!473342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848351 (= res!576373 (validKeyInArray!0 k0!854))))

(declare-fun res!576370 () Bool)

(assert (=> start!73008 (=> (not res!576370) (not e!473342))))

(assert (=> start!73008 (= res!576370 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23633 _keys!868))))))

(assert (=> start!73008 e!473342))

(assert (=> start!73008 tp_is_empty!16059))

(assert (=> start!73008 true))

(assert (=> start!73008 tp!49273))

(declare-fun array_inv!18414 (array!48324) Bool)

(assert (=> start!73008 (array_inv!18414 _keys!868)))

(declare-fun _values!688 () array!48326)

(declare-fun e!473344 () Bool)

(declare-fun array_inv!18415 (array!48326) Bool)

(assert (=> start!73008 (and (array_inv!18415 _values!688) e!473344)))

(declare-fun call!37624 () ListLongMap!9329)

(declare-fun b!848352 () Bool)

(declare-fun v!557 () V!26459)

(declare-fun e!473337 () Bool)

(declare-fun +!2092 (ListLongMap!9329 tuple2!10560) ListLongMap!9329)

(assert (=> b!848352 (= e!473337 (= call!37625 (+!2092 call!37624 (tuple2!10561 k0!854 v!557))))))

(declare-fun b!848353 () Bool)

(declare-fun e!473343 () Bool)

(assert (=> b!848353 (= e!473342 e!473343)))

(declare-fun res!576374 () Bool)

(assert (=> b!848353 (=> (not res!576374) (not e!473343))))

(assert (=> b!848353 (= res!576374 (= from!1053 i!612))))

(declare-fun lt!381994 () ListLongMap!9329)

(assert (=> b!848353 (= lt!381994 (getCurrentListMapNoExtraKeys!2663 _keys!868 lt!381996 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!848353 (= lt!381996 (array!48327 (store (arr!23194 _values!688) i!612 (ValueCellFull!7590 v!557)) (size!23634 _values!688)))))

(declare-fun lt!381997 () ListLongMap!9329)

(assert (=> b!848353 (= lt!381997 (getCurrentListMapNoExtraKeys!2663 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!848354 () Bool)

(declare-fun res!576368 () Bool)

(assert (=> b!848354 (=> (not res!576368) (not e!473342))))

(assert (=> b!848354 (= res!576368 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23633 _keys!868))))))

(declare-fun b!848355 () Bool)

(assert (=> b!848355 (= e!473344 (and e!473340 mapRes!25688))))

(declare-fun condMapEmpty!25688 () Bool)

(declare-fun mapDefault!25688 () ValueCell!7590)

(assert (=> b!848355 (= condMapEmpty!25688 (= (arr!23194 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7590)) mapDefault!25688)))))

(declare-fun b!848356 () Bool)

(declare-fun res!576376 () Bool)

(assert (=> b!848356 (=> (not res!576376) (not e!473342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48324 (_ BitVec 32)) Bool)

(assert (=> b!848356 (= res!576376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!848357 () Bool)

(assert (=> b!848357 (= e!473337 (= call!37625 call!37624))))

(declare-fun b!848358 () Bool)

(declare-fun e!473338 () Bool)

(assert (=> b!848358 (= e!473338 tp_is_empty!16059)))

(declare-fun mapNonEmpty!25688 () Bool)

(declare-fun tp!49272 () Bool)

(assert (=> mapNonEmpty!25688 (= mapRes!25688 (and tp!49272 e!473338))))

(declare-fun mapRest!25688 () (Array (_ BitVec 32) ValueCell!7590))

(declare-fun mapValue!25688 () ValueCell!7590)

(declare-fun mapKey!25688 () (_ BitVec 32))

(assert (=> mapNonEmpty!25688 (= (arr!23194 _values!688) (store mapRest!25688 mapKey!25688 mapValue!25688))))

(declare-fun b!848359 () Bool)

(declare-fun e!473341 () Bool)

(assert (=> b!848359 (= e!473343 (not e!473341))))

(declare-fun res!576377 () Bool)

(assert (=> b!848359 (=> res!576377 e!473341)))

(assert (=> b!848359 (= res!576377 (not (validKeyInArray!0 (select (arr!23193 _keys!868) from!1053))))))

(assert (=> b!848359 e!473337))

(declare-fun c!91555 () Bool)

(assert (=> b!848359 (= c!91555 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28973 0))(
  ( (Unit!28974) )
))
(declare-fun lt!381995 () Unit!28973)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!332 (array!48324 array!48326 (_ BitVec 32) (_ BitVec 32) V!26459 V!26459 (_ BitVec 32) (_ BitVec 64) V!26459 (_ BitVec 32) Int) Unit!28973)

(assert (=> b!848359 (= lt!381995 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!332 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37622 () Bool)

(assert (=> bm!37622 (= call!37624 (getCurrentListMapNoExtraKeys!2663 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848360 () Bool)

(declare-fun res!576369 () Bool)

(assert (=> b!848360 (=> (not res!576369) (not e!473342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848360 (= res!576369 (validMask!0 mask!1196))))

(declare-fun b!848361 () Bool)

(assert (=> b!848361 (= e!473341 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23633 _keys!868))))))

(declare-fun b!848362 () Bool)

(declare-fun res!576371 () Bool)

(assert (=> b!848362 (=> (not res!576371) (not e!473342))))

(declare-datatypes ((List!16417 0))(
  ( (Nil!16414) (Cons!16413 (h!17544 (_ BitVec 64)) (t!22788 List!16417)) )
))
(declare-fun arrayNoDuplicates!0 (array!48324 (_ BitVec 32) List!16417) Bool)

(assert (=> b!848362 (= res!576371 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16414))))

(declare-fun b!848363 () Bool)

(declare-fun res!576375 () Bool)

(assert (=> b!848363 (=> (not res!576375) (not e!473342))))

(assert (=> b!848363 (= res!576375 (and (= (size!23634 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23633 _keys!868) (size!23634 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73008 res!576370) b!848360))

(assert (= (and b!848360 res!576369) b!848363))

(assert (= (and b!848363 res!576375) b!848356))

(assert (= (and b!848356 res!576376) b!848362))

(assert (= (and b!848362 res!576371) b!848354))

(assert (= (and b!848354 res!576368) b!848351))

(assert (= (and b!848351 res!576373) b!848349))

(assert (= (and b!848349 res!576372) b!848353))

(assert (= (and b!848353 res!576374) b!848359))

(assert (= (and b!848359 c!91555) b!848352))

(assert (= (and b!848359 (not c!91555)) b!848357))

(assert (= (or b!848352 b!848357) bm!37621))

(assert (= (or b!848352 b!848357) bm!37622))

(assert (= (and b!848359 (not res!576377)) b!848361))

(assert (= (and b!848355 condMapEmpty!25688) mapIsEmpty!25688))

(assert (= (and b!848355 (not condMapEmpty!25688)) mapNonEmpty!25688))

(get-info :version)

(assert (= (and mapNonEmpty!25688 ((_ is ValueCellFull!7590) mapValue!25688)) b!848358))

(assert (= (and b!848355 ((_ is ValueCellFull!7590) mapDefault!25688)) b!848350))

(assert (= start!73008 b!848355))

(declare-fun m!789157 () Bool)

(assert (=> b!848359 m!789157))

(assert (=> b!848359 m!789157))

(declare-fun m!789159 () Bool)

(assert (=> b!848359 m!789159))

(declare-fun m!789161 () Bool)

(assert (=> b!848359 m!789161))

(declare-fun m!789163 () Bool)

(assert (=> b!848362 m!789163))

(declare-fun m!789165 () Bool)

(assert (=> b!848356 m!789165))

(declare-fun m!789167 () Bool)

(assert (=> bm!37621 m!789167))

(declare-fun m!789169 () Bool)

(assert (=> b!848360 m!789169))

(declare-fun m!789171 () Bool)

(assert (=> mapNonEmpty!25688 m!789171))

(declare-fun m!789173 () Bool)

(assert (=> bm!37622 m!789173))

(declare-fun m!789175 () Bool)

(assert (=> b!848351 m!789175))

(declare-fun m!789177 () Bool)

(assert (=> start!73008 m!789177))

(declare-fun m!789179 () Bool)

(assert (=> start!73008 m!789179))

(declare-fun m!789181 () Bool)

(assert (=> b!848349 m!789181))

(declare-fun m!789183 () Bool)

(assert (=> b!848353 m!789183))

(declare-fun m!789185 () Bool)

(assert (=> b!848353 m!789185))

(declare-fun m!789187 () Bool)

(assert (=> b!848353 m!789187))

(declare-fun m!789189 () Bool)

(assert (=> b!848352 m!789189))

(check-sat (not b!848362) tp_is_empty!16059 (not start!73008) (not b!848353) (not bm!37622) b_and!23009 (not b!848360) (not bm!37621) (not b!848352) (not b!848351) (not b!848359) (not b_next!13923) (not mapNonEmpty!25688) (not b!848356))
(check-sat b_and!23009 (not b_next!13923))
